Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22287.1611828422860954301
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Jan 2021 02:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46867113E;
	Thu, 28 Jan 2021 02:07:02 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07EF3F766;
	Thu, 28 Jan 2021 02:07:01 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 3/4] arm-autonomy/xen-devicetree: Check for empty/invalid variable values
Date: Thu, 28 Jan 2021 10:06:39 +0000
Message-Id: <20210128100640.31866-3-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210128100640.31866-1-nathan.dunne@arm.com>
References: <20210128100640.31866-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Added check to xen-devicetree to validate values of required variables:
XEN_DEVICETREE_DOM0_ADDR
XEN_DEVICETREE_DOM0_SIZE
XEN_DEVICETREE_DOM0_MEM

Issue-Id: SCM-2037
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I31bfcdb9d064f6e91beb1500d0a18f2a30a42028
---
 .../documentation/xen-devicetree.md           | 10 +++++---
 .../xen-devicetree/xen-devicetree.bb          | 24 +++++++++++++++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/meta-arm-autonomy/documentation/xen-devicetree.md b/meta-arm-autonomy/documentation/xen-devicetree.md
index a44dca7..0d4466a 100644
--- a/meta-arm-autonomy/documentation/xen-devicetree.md
+++ b/meta-arm-autonomy/documentation/xen-devicetree.md
@@ -70,7 +70,9 @@ The following parameters are available:
   This variable is only used if XEN_DEVICETREE_XEN_BOOTARGS has a value
   containing "dom0_mem=${XEN_DEVICETREE_DOM0_MEM}" as the memory assigned to
   dom0 is defined using Xen boot arguments.
-  This variable is set by default to "1024M".
+  This variable is set by default to "1024M", and cannot be empty.
+  The value can also be of the form "1024M,max:1024M", as documented here:
+  https://wiki.xenproject.org/wiki/Do%EF%BB%BFm0_Memory_%E2%80%94_Where_It_Has_Not_Gone
 
 - XEN_DEVICETREE_DOM0_BOOTARGS: Boot arguments to pass to Dom0 Linux when
   booting it.
@@ -84,7 +86,8 @@ The following parameters are available:
 - XEN_DEVICETREE_DOM0_ADDR: This is the address from which the Linux kernel to
   be used for Dom0 will be copied. When using u-boot, this is the address at
   which you will load the kernel Image before starting Xen.
-  This variable is set by default to "0x80080000".
+  This variable is set by default to "0x80080000", and cannot be empty.
+  Values for this variable can be in hex (prefixed with '0x') or in decimal.
 
 - XEN_DEVICETREE_DOM0_SIZE: This is the size of the kernel loaded at
   ${XEN_DEVICETREE_DOM0_ADDR}. Xen will copy this amount of data inside the
@@ -92,7 +95,8 @@ The following parameters are available:
   size but can be bigger. You must be careful not to have a value too big as it
   could slow down boot or copy other parts with it (like the DTB).
   You might need to increase this if you use a kernel with a bundled initramfs.
-  This variable is set by default to "0x01000000".
+  This variable is set by default to "0x01000000" and cannot be empty.
+  Values for this variable can be in hex (prefixed with '0x') or in decimal.
 
 - XEN_DEVICETREE_DTSI_MERGE: This variable contains the list of dtsi files that
   must be included inside the generated DTB file. By default the only one
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index 398385a..c6a785f 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -35,6 +35,30 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
 
+# Validate xen devicetree variables
+python __anonymous() {
+
+    # Compare values of a list of variables to a regex pattern
+    def validate_type(pattern, var_list):
+        for varname in var_list:
+            if d.getVar(varname):
+                if not pattern.match(d.getVar(varname)):
+                    raise bb.parse.SkipRecipe(d.getVar(varname) + "' is not a valid value for " + varname + "!")
+            else:
+                raise bb.parse.SkipRecipe('Required variable ' + varname + ' is empty!')
+
+    import re
+
+    num_vars_to_check = ['XEN_DEVICETREE_DOM0_ADDR', 'XEN_DEVICETREE_DOM0_SIZE']
+    size_vars_to_check = ['XEN_DEVICETREE_DOM0_MEM']
+
+    num_pattern = re.compile(r'((0x[0-9a-fA-F]+)|[0-9]+)$')
+    size_pattern = re.compile(r'[0-9]+[MG](,max:[0-9]+[MG])?$')
+
+    validate_type(num_pattern, num_vars_to_check)
+    validate_type(size_pattern, size_vars_to_check)
+}
+
 do_deploy() {
     if [ ! -f ${WORKDIR}/xen.dtsi.in ]; then
         die "xen.dtsi.in does not exist"
-- 
2.17.1

