Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48.1616599987050321426
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Mar 2021 08:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CD94ED1;
	Wed, 24 Mar 2021 08:33:06 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6AEB3F7D7;
	Wed, 24 Mar 2021 08:33:05 -0700 (PDT)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 3/3] arm-autonomy/images: Introduced xenguest-extern-guests recipe
Date: Wed, 24 Mar 2021 15:32:57 +0000
Message-Id: <20210324153257.4716-3-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210324153257.4716-1-nathan.dunne@arm.com>
References: <20210324153257.4716-1-nathan.dunne@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Nathan Dunne <Nathan.Dunne@arm.com>

Seperated guest inclusion for image into seperate recipe, allowing
a do_install task to be used rather than directly copying from the
local path.

This allows all bitbake fetcher types to be used rather than only
local files. Alternate fetchers are enabled through parsing
ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS with set_src_uri_from_var.bbclass

Issue-Id: SCM-2225
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Iff5483926a5cde8ce7519da60f1b9119946a7f4e
---
 .../images/arm-autonomy-host-image-minimal.bb | 139 +-----------------
 .../xenguest/xenguest-extern-guests.bb        | 118 +++++++++++++++
 2 files changed, 119 insertions(+), 138 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-=
extern-guests.bb

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-imag=
e-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-im=
age-minimal.bb
index ea5d889..cce632f 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minim=
al.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minim=
al.bb
@@ -11,39 +11,6 @@ inherit core-image features_check
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
=20
-# The ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS variable can be used to incl=
ude in the
-# image one or several xenguest images.
-# The list must be space separated and each entry must have the followin=
g
-# format: URL[;params]
-#  - URL can be the full path to a file or a Yocto compatible SRC_URI ur=
l
-#  - params encompasses two values that can be optionally set:
-#    - guestname=3DNAME can be used to specify the name of the guest. If=
 not
-#      specified the default value is the basename of the file
-#      (without .xenguest extension).
-#    - guestcount=3DNUM can be used to created NUM guests with the same =
config.
-#      All guests after the first will have numbers appended to the gues=
tname,
-#      starting from 2. In the rootfs additional xenguest files will be
-#      symlinks to the original.
-#  params should be semicolon seperated, without a space, and can appear=
 in
-#  any order.
-#
-#  Here are examples of values:
-#  /home/mydir/myguest.xenguest;guestname=3Dguest1;guestcount=3D3
-#  http://www.url.com/testguest.xenguest
-#
-#  If you are using the output of an other Yocto project, you should use=
 the
-#  full path syntax instead of the Yocto SRC_URI to be able to use the
-#  symlink version of your image (as the real file has a new name on eac=
h
-#  build as it includes the date). You must not use SRC_URI type file://=
 as
-#  it will try to include the symlink and not the destination file which=
 will
-#  be detected by the recipe and output an error 'Guest file is a symlin=
k'.
-#
-#  Guests can also be added using a bbapend to this recipe by adding ent=
ries
-#  to SRC_URI with parameter ;guestname=3DNAME to specify the destinatio=
n
-#  guestname. The parameter guestname must be present as it is used to d=
etect
-#  guests to be added
-ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??=3D ""
-
 #=C2=A0Includes minimal set required to start and manage guest. The xen =
specific
 # modules are not explicitly included as they are built as part of the k=
ernel
 # image for performance reasons. It doesn't include all kernel modules t=
o
@@ -53,6 +20,7 @@ IMAGE_INSTALL +=3D " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
     qemu-system-i386 \
+    xenguest-extern-guests \
     xenguest-manager \
     xenguest-network \
     "
@@ -63,110 +31,5 @@ EXTRA_IMAGEDEPENDS +=3D "xen"
 # Build xen-devicetree to produce a xen ready devicetree
 EXTRA_IMAGEDEPENDS +=3D "xen-devicetree"
=20
-# Documentation for setting up a multiconfig build can be found in:
-# meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
-
-# In a multiconfig build this variable will hold a dependency string, wh=
ich differs based
-# on whether the guest has initramfs or not.
-# It may have a space seperated list of dependency strings if mulitple g=
uest types are
-# configured
-MC_DOIMAGE_MCDEPENDS ?=3D ""
-# Example value: mc:host:guest:core-image-minimal:do_image_complete
-
-# In a multiconfig build the host task 'do_image' has a dependency on mu=
lticonfig guest.
-# This ensures that the guest image file already exists when it is neede=
d by the host
-DO_IMAGE_MCDEPENDS :=3D "${@ '${MC_DOIMAGE_MCDEPENDS}' if d.getVar('BBMU=
LTICONFIG') else ''}"
-
-# Apply mc dependency. Empty string if multiconfig not enabled
-do_image[mcdepends] +=3D "${DO_IMAGE_MCDEPENDS}"
-
 REQUIRED_DISTRO_FEATURES +=3D 'arm-autonomy-host'
 REQUIRED_DISTRO_FEATURES +=3D 'xen'
-
-# Configurable guest variables
-require conf/xenguest.conf
-
-python __anonymous() {
-    import re
-    guestfile_pattern =3D re.compile(r"^([^;]+);")
-    guestname_pattern =3D re.compile(r";guestname=3D([^;]+);?")
-    guestcount_pattern =3D re.compile(r";guestcount=3D(\d+);?")
-
-    # Check in ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS for extra guests an=
d add them
-    # to SRC_URI with xenguest parameter if not set
-    guestlist =3D d.getVar('ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS')
-    if guestlist:
-        for guest in guestlist.split():
-            # If the user just specified a file instead of file://FILE, =
add
-            # the file:// prefix
-            if guest.startswith('/'):
-                guestname =3D os.path.basename(guest)
-                guestfile =3D guest
-                guestcount =3D "1"
-                f =3D guestfile_pattern.search(guest)
-                n =3D guestname_pattern.search(guest)
-                c =3D guestcount_pattern.search(guest)
-
-                if f is not None:
-                    guestfile =3D f.group(1)
-                if n is not None:
-                    guestname =3D n.group(1)
-                if c is not None:
-                    guestcount =3D c.group(1)
-                # in case we have a link we need the destination
-                guestfile =3D os.path.realpath(guestfile)
-
-                # make sure the file exist to give a meaningfull error
-                if not os.path.exists(guestfile):
-                    raise bb.parse.SkipRecipe("ARM_AUTONOMY_HOST_IMAGE_E=
XTERN_GUESTS entry does not exist: " + guest)
-
-                # In case the file is a symlink make sure we use the des=
tination
-                d.appendVar('SRC_URI',  ' file://' + guestfile + ';guest=
name=3D' + guestname + ';guestcount=3D' + guestcount)
-            else:
-                # we have a Yocto URL
-                try:
-                    _, _, path, _, _, parm =3D bb.fetch.decodeurl(guest)
-                    # force guestname param in if not already there
-                    if not 'guestname' in parm:
-                        guest  +=3D ';guestname=3D' + os.path.basename(p=
ath)
-                    d.appendVar('SRC_URI', ' ' + guest)
-                except:
-                    raise bb.parse.SkipRecipe("ARM_AUTONOMY_HOST_IMAGE_E=
XTERN_GUESTS contains an invalid entry: " + guest)
-}
-
-python add_extern_guests () {
-    # Destination directory on the rootfs
-    guestdir =3D d.getVar('IMAGE_ROOTFS') + d.getVar('XENGUEST_MANAGER_G=
UEST_DIR')
-
-    # Parse SRC_URI for files with ;guestname=3D parameter
-    src_uri =3D d.getVar('SRC_URI')
-    for entry in src_uri.split():
-        _, _, path, _, _, parm =3D bb.fetch.decodeurl(entry)
-        if 'guestname' in parm:
-            if os.path.islink(path):
-                realpath =3D os.path.realpath(path)
-
-                if not os.path.exists(realpath):
-                    bb.fatal("ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS link=
 does not resolve: " + path)
-
-                bb.note("Guest file is a symlink:\n " + path + "\nResolv=
ed to:\n " + realpath)
-                path =3D realpath
-
-            bb.utils.mkdirhier(guestdir)
-            dstname =3D parm['guestname']
-            # Add file extension if not there
-            if not dstname.endswith('.xenguest'):
-                dstname +=3D '.xenguest'
-
-            if not bb.utils.copyfile(path, guestdir + '/' + dstname):
-                bb.fatal("Fail to copy Guest file " + path)
-
-        if 'guestcount' in parm:
-            guestcount =3D int(parm['guestcount']) + 1
-
-            for i in range(2, guestcount):
-                os.symlink('./' + dstname, guestdir + '/' + dstname.repl=
ace('.xenguest', str(i) + '.xenguest'))
-}
-
-IMAGE_PREPROCESS_COMMAND +=3D "add_extern_guests; "
-
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-=
guests.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-g=
uests.bb
new file mode 100644
index 0000000..9310cbc
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.=
bb
@@ -0,0 +1,118 @@
+# Xenguest Extern Guests
+#
+# This recipe installs the extern guest files specified in
+# ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS into the host image, They are in=
stalled
+# to the directory XENGUEST_MANAGER_GUEST_DIR
+#
+# src_uri_parse_var.bbclass is used to parse
+# ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS
+#
+# There are 4 supported formats for ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUEST=
S
+# entries:
+#
+# - http/https url
+#   - "https://[url]:[port]/foo.xenguest;md5sum=3D..."
+#
+# - file:// absolute local path from root
+#   - "file:///xenguests/bar.xenguest"
+#
+# - file:// path relative to FILESEXTRAPATHS
+#  - "file://relative/baz.xenguest"
+#
+# - plain absolute local path from root
+#   - "/xenguests/absolute/xyzzy.xenguest"
+#
+# It is not recommended to use other yocto URL types, as they may result=
 in
+# undefined behaviour.
+#
+# A semicolon seperated list of install arguments can follow each image =
path:
+# - guestname  : the name that will be attached when the image is import=
ed
+#                (default: [filename, without extension])
+# - guestcount : the number of copies of the guest to install, with
+#                incrementing numbers appended to the name
+#                (default: 1)
+#
+# Any other arguments, for example an md5sum, will be assumed to be fetc=
h
+# arguments, and will be kept when the path is added to the SRC_URI
+#
+# e.g.  ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS =3D "\
+# https://[url]:[port]/base.xenguest;md5sum=3D[checksum];guestname=3Dhtt=
p \
+# file:///guests/base.xenguest;guestname=3Dfile_abs \
+# file://foo/base.xenguest;guestname=3Dfile_rel;guestcount=3D2 \
+# /guests/foo/bar/base.xenguest;guestname=3Dno_fetcher \ "
+#
+# Documentation for setting up a multiconfig build can be found in:
+# meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
+
+DESCRIPTION =3D "Xenguest Extern Guests"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+# Global value of XENGUEST_MANAGER_GUEST_DIR set here
+require conf/xenguest.conf
+
+ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??=3D ""
+
+# Parse the variable ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS for xenguest =
files,
+# unpack them to SRC_URI_FROM_VAR_UNPACK_DIR and create a manifest file
+# containing each of SRC_URI_FROM_VAR_MANIFEST_PARAMS for each entry
+inherit set_src_uri_from_var
+SRC_URI_FROM_VAR_NAME =3D "ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS"
+SRC_URI_FROM_VAR_MANIFEST_PARAMS=3D "guestname=3D[basename] guestcount=3D=
1"
+SRC_URI_FROM_VAR_UNPACK_DIR =3D "xenguests"
+
+# Unnecessary tasks
+do_compile[noexec] =3D "1"
+do_configure[noexec] =3D "1"
+do_patch[noexec] =3D "1"
+
+# Install guest files to XENGUEST_MANAGER_GUEST_DIR
+do_install() {
+
+    local guestfile guestname guestcount
+
+    if [ -f "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/manifest" ]; then
+
+        install -d "${D}${XENGUEST_MANAGER_GUEST_DIR}"
+
+        # Iterate over manifest file containing parameters
+        while read -r guestfile guestname guestcount _; do
+            [ -f "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/${guestfile}=
" ] ||
+                bbfatal "${guestfile} does not exist"
+
+            install -m 644 \
+                "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/${guestfile}"=
 \
+                "${D}${XENGUEST_MANAGER_GUEST_DIR}/${guestname}.xenguest=
"
+
+            # Create symlinks for duplicate guests, appending numbers to
+            # guestname
+            for i in `seq 2 $guestcount`
+            do
+                ln -s -r \
+                    "${D}${XENGUEST_MANAGER_GUEST_DIR}/${guestname}.xeng=
uest" \
+                    "${D}${XENGUEST_MANAGER_GUEST_DIR}/${guestname}$i.xe=
nguest"
+            done
+
+        done < "${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}/manifest"
+    fi
+}
+
+do_install[vardeps] +=3D "ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS"
+
+FILES_${PN} +=3D "${XENGUEST_MANAGER_GUEST_DIR}"
+
+# In a multiconfig build this variable will hold a dependency string, wh=
ich
+# differs based on whether the guest has initramfs or not.  It may have =
a space
+# seperated list of dependency strings if mulitple guest types are confi=
gured
+MC_DOIMAGE_MCDEPENDS ?=3D ""
+# Example value: mc:host:guest:core-image-minimal:do_merge_xenguestenv
+
+# In a multiconfig build the host task 'do_image' has a dependency on
+# multiconfig guest.  This ensures that the guest image file already exi=
sts
+# when it is needed by the host
+DO_IMAGE_MCDEPENDS :=3D "${@ '${MC_DOIMAGE_MCDEPENDS}' \
+if d.getVar('BBMULTICONFIG') else ''}"
+
+# Apply mc dependency. Empty string if multiconfig not enabled
+do_fetch[mcdepends] +=3D "${DO_IMAGE_MCDEPENDS}"
--=20
2.17.1

