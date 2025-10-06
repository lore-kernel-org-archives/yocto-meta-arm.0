Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03783CCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:25:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.36647.1759764332176117957
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Oct 2025 08:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6621515
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Oct 2025 08:25:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E2543F66E
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Oct 2025 08:25:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/edk2-firmware: backport a patch to fix builds with host gcc15
Date: Mon,  6 Oct 2025 16:25:26 +0100
Message-ID: <20251006152526.2401666-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Oct 2025 15:25:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6725

Backport a patch from upstream to fix the build of antlr with GCC 15 on
the host.

The build still fails with clang, so update the message with the current
error message.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_202408.bb  |  7 ++-
 .../0001-BaseTools-Pccts-set-C-standard.patch | 47 +++++++++++++++++++
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pc=
cts-set-C-standard.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
index ea03d47ba1..fa44e28f7f 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
@@ -1,9 +1,12 @@
 SRCREV_edk2           ?=3D "b158dad150bf02879668f72ce306445250838201"
 SRCREV_edk2-platforms ?=3D "a3c898956a4d48dc5980336fa6ce6eeb23c4f72b"
=20
-SRC_URI +=3D "file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=3De=
dk2-platforms"
+SRC_URI +=3D "file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=3De=
dk2-platforms \
+            file://0001-BaseTools-Pccts-set-C-standard.patch"
=20
-# FIXME - clang is having issues with antlr
+# FIXME:
+# ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManufacturerFu=
nction.c:146:37:
+# error: variable 'ContainedElements' is uninitialized when passed as a =
const pointer argument here [-Werror,-Wuninitialized-const-pointer]
 TOOLCHAIN:aarch64 =3D "gcc"
=20
 require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pccts-set=
-C-standard.patch b/meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pc=
cts-set-C-standard.patch
new file mode 100644
index 0000000000..058073c9d8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pccts-set-C-stan=
dard.patch
@@ -0,0 +1,47 @@
+From e063f8b8a53861043b9872cc35b08a3dc03b0942 Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 20 Jan 2025 09:40:31 +0100
+Subject: [PATCH] BaseTools/Pccts: set C standard
+
+The prehistoric code base doesn't build with ISO C23.  Set the C
+standard to C11 (for both clang and gcc) so it continues to build with
+gcc 15 (which uses C23 by default).
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport [e063f8b8a53861043b9872cc35b08a3dc03b0942]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile | 2 +-
+ BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile b/BaseTo=
ols/Source/C/VfrCompile/Pccts/antlr/makefile
+index 746d58b5e2..b47c8a37af 100644
+--- a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
++++ b/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
+@@ -169,7 +169,7 @@ ANTLR=3D${BIN_DIR}/antlr
+ DLG=3D${BIN_DIR}/dlg
+ OBJ_EXT=3Do
+ OUT_OBJ =3D -o
+-CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZ=
LEXBUFSIZE=3D65536
++CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZ=
LEXBUFSIZE=3D65536 -std=3Dgnu11
+ CPPFLAGS=3D
+ #
+ # SGI Users, use this CFLAGS
+diff --git a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile b/BaseTool=
s/Source/C/VfrCompile/Pccts/dlg/makefile
+index e45ac98e04..d72bee3d70 100644
+--- a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
++++ b/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
+@@ -123,7 +123,7 @@ endif
+ COPT=3D-O
+ ANTLR=3D${BIN_DIR}/antlr
+ DLG=3D${BIN_DIR}/dlg
+-CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536
++CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536 -std=3Dgnu11
+ CPPFLAGS=3D
+ OBJ_EXT=3Do
+ OUT_OBJ =3D -o
+--=20
+2.43.0
+
--=20
2.43.0


