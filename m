Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.27695.1611148651385164466
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 05:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C5F1D6E;
	Wed, 20 Jan 2021 05:17:30 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A68833F66E;
	Wed, 20 Jan 2021 05:17:29 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 1/3] arm-autonomy/xenguest: Add guestcount support
Date: Wed, 20 Jan 2021 13:17:14 +0000
Message-Id: <20210120131716.30428-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Add guestcount parameter to ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS,
to create multiple guests with the same config. Symlinks are created
in the host rootfs pointing to the original xenguest file

Parameters for ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS are now
retrieved using python regex rather than split, so that they can
appear in any order

Issue-Id: SCM-1863
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ifa5f5ab3b284815427c94979b3f1a5eed592ec3c
---
 .../images/arm-autonomy-host-image-minimal.bb | 54 +++++++++++++------
 .../xenguest/files/xenguest-manager           | 22 ++++++--
 2 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 50378b1..8245e9a 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -14,12 +14,21 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 # The ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS variable can be used to include in the
 # image one or several xenguest images.
 # The list must be space separated and each entry must have the following
-# format: URL[;guestname=NAME]
+# format: URL[;params]
 #  - URL can be the full path to a file or a Yocto compatible SRC_URI url
-#  - guestname=NAME can be used to specify the name of the guest. If not
-#    specified the basename of the file (without .xenguest extension) is used.
+#  - params encompasses two values that can be optionally set:
+#    - guestname=NAME can be used to specify the name of the guest. If not
+#      specified the default value is the basename of the file
+#      (without .xenguest extension).
+#    - guestcount=NUM can be used to created NUM guests with the same config.
+#      All guests after the first will have numbers appended to the guestname,
+#      starting from 2. In the rootfs additional xenguest files will be
+#      symlinks to the original.
+#  params should be semicolon seperated, without a space, and can appear in
+#  any order.
+#
 #  Here are examples of values:
-#  /home/mydir/myguest.xenguest;guestname=guest1
+#  /home/mydir/myguest.xenguest;guestname=guest1;guestcount=3
 #  http://www.url.com/testguest.xenguest
 #
 #  If you are using the output of an other Yocto project, you should use the
@@ -73,6 +82,11 @@ do_image[mcdepends] += "${DO_IMAGE_MCDEPENDS}"
 
 
 python __anonymous() {
+    import re
+    guestfile_pattern = re.compile(r"^([^;]+);")
+    guestname_pattern = re.compile(r";guestname=([^;]+);?")
+    guestcount_pattern = re.compile(r";guestcount=(\d+);?")
+
     if bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', False, True, d):
         raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'arm-autonomy-host'")
 
@@ -87,16 +101,19 @@ python __anonymous() {
             # If the user just specified a file instead of file://FILE, add
             # the file:// prefix
             if guest.startswith('/'):
-                guestfile = ''
-                guestname = ''
-                if ';guestname=' in guest:
-                    # user specified a guestname
-                    guestname = guest.split(';guestname=')[1]
-                    guestfile = guest.split(';guestname=')[0]
-                else:
-                    # no guestname so use the basename
-                    guestname = os.path.basename(guest)
-                    guestfile = guest
+                guestname = os.path.basename(guest)
+                guestfile = guest
+                guestcount = "1"
+                f = guestfile_pattern.search(guest)
+                n = guestname_pattern.search(guest)
+                c = guestcount_pattern.search(guest)
+
+                if f is not None:
+                    guestfile = f.group(1)
+                if n is not None:
+                    guestname = n.group(1)
+                if c is not None:
+                    guestcount = c.group(1)
                 # in case we have a link we need the destination
                 guestfile = os.path.realpath(guestfile)
 
@@ -105,7 +122,7 @@ python __anonymous() {
                     raise bb.parse.SkipRecipe("ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS entry does not exist: " + guest)
 
                 # In case the file is a symlink make sure we use the destination
-                d.appendVar('SRC_URI',  ' file://' + guestfile + ';guestname=' + guestname)
+                d.appendVar('SRC_URI',  ' file://' + guestfile + ';guestname=' + guestname + ';guestcount=' + guestcount)
             else:
                 # we have a Yocto URL
                 try:
@@ -141,8 +158,15 @@ python add_extern_guests () {
             # Add file extension if not there
             if not dstname.endswith('.xenguest'):
                 dstname += '.xenguest'
+
             if not bb.utils.copyfile(path, guestdir + '/' + dstname):
                 bb.fatal("Fail to copy Guest file " + path)
+
+        if 'guestcount' in parm:
+            guestcount = int(parm['guestcount']) + 1
+
+            for i in range(2, guestcount):
+                os.symlink('./' + dstname, guestdir + '/' + dstname.replace('.xenguest', str(i) + '.xenguest'))
 }
 
 IMAGE_PREPROCESS_COMMAND += "add_extern_guests; "
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 8a54806..be2af32 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -1017,15 +1017,31 @@ case ${cmd} in
     create)
         guestfile="${arg1}"
         guestname="${arg2}"
-        if [ -z "${guestfile}" -o ! -f "${guestfile}" ]; then
+        # guestfile invalid if empty
+        if [ -z "${guestfile}" ]; then
             log fatal "Usage ${this} create XENGUEST_FILE [NAME]"
         fi
+        # Set Guest name before resolving any symlinks
         if [ -z "${guestname}" ]; then
             guestname=$(basename ${guestfile} .xenguest)
+            log info "guestname argument not provided, using '${guestname}'"
         fi
-
+        # Check for and resolve symlink
+        if [ -L "${guestfile}" ]; then
+            errmsg="'${guestfile}' is a broken symlink"
+            guestfile=$(readlink -e "${guestfile}")
+            if [ -z "${guestfile}" ]; then
+                log fatal "${errmsg}"
+            else
+                log info "Guestfile symlink resolved to path '${guestfile}'"
+            fi
+        fi
+        # Check that guestfile is a valid file
+        if [ ! -f "${guestfile}" ]; then
+            log fatal "File '${guestfile}' not found"
+        fi
+        # Check if guest already exists
         if [ -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg ]; then
-            # Guest already exist
             log fatal "Guest '${guestname}' already exists"
         fi
 
-- 
2.17.1

