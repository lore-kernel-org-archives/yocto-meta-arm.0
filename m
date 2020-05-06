Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2178.1588731348698973569
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 May 2020 19:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C41D740C2E;
	Wed,  6 May 2020 02:15:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_dwrA2VVMyq; Wed,  6 May 2020 02:15:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A598440A93;
	Wed,  6 May 2020 02:15:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6004716EC83;
	Tue,  5 May 2020 22:15:46 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 1/4] gcc-arm: add re-staging of unwind.h from external-arm-toolchain
Date: Tue,  5 May 2020 22:15:31 -0400
Message-Id: <1588731334-4919-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

gcc-target.inc expects unwind.h to come from and be staged by libgcc.
When TCMODE="external-arm" libgcc is provided by external-arm-toolchain.bb
And while it stages the necessary unwind.h file, it ends up in slightly
different location, so re-stage it. More details are in the comments.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-devtools/gcc/gcc-arm-common.inc             | 17 +++++++++++++++++
 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb  |  1 +
 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb  |  1 +
 meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb  |  1 +
 4 files changed, 20 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
new file mode 100644
index 0000000..55f40e1
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-common.inc
@@ -0,0 +1,17 @@
+# gcc-target.inc in OE-Core has these 2 lines in do_install():
+#
+# | # Add unwind.h, it comes from libgcc which we don't want to build again
+# | install ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+#
+# When TCMODE="external-arm" libgcc is provided by external-arm-toolchain.bb
+# And while it stages the necessary unwind.h file, it ends up in slightly
+# different location. While this is a kludge, be very conservative - only
+# copy the file for target build in recipe-specific sysroot, in external-arm
+# toolchain mode and if the required file does not exist already.
+
+do_install_prepend_class-target () {
+	if [ "${TCMODE}" = "external-arm" -a ! -f ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/unwind.h ]; then
+		install -d ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
+		install ${STAGING_LIBDIR}/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include/unwind.h ${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/gcc/${TARGET_SYS}/${BINV}/include/
+	fi
+}
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
index c4a2de2..51a0877 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.2.bb
@@ -1,5 +1,6 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-target.inc
+require recipes-devtools/gcc/gcc-arm-common.inc
 
 # Building with thumb enabled on armv4t armv5t fails with
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
index c4a2de2..51a0877 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-8.3.bb
@@ -1,5 +1,6 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-target.inc
+require recipes-devtools/gcc/gcc-arm-common.inc
 
 # Building with thumb enabled on armv4t armv5t fails with
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
index c4a2de2..51a0877 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc_arm-9.2.bb
@@ -1,5 +1,6 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-target.inc
+require recipes-devtools/gcc/gcc-arm-common.inc
 
 # Building with thumb enabled on armv4t armv5t fails with
 # | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
-- 
2.7.4

