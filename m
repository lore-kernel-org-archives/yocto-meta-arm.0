Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0CDCD98FB
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:59:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18999.1781787561741591774
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=i+BPQ3nq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14EF22936
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B0EE3F915
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781787561; bh=Xiv7QUQGUorOlYL2XBWpgd2tJztHtV8gzW4/CS6hicg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i+BPQ3nqd0SXVETqcb7kD8tYjDhQyEQp1w9b+VnDjPsM8go6vPDt4A4ESw8L081ec
	 RQz6riiR0gvqPHSuw8GlnOlv6/yDmlTnm7VmWFm0OjEx7YJCN7g6IlHfKNapnv5Cyq
	 6HjEfcFFeH/ffpsF0brSrNzaPmnbxhfceK+84uiI=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] arm/uefi: update edk2-firmware to 202605
Date: Thu, 18 Jun 2026 08:59:16 -0400
Message-ID: <20260618125918.62619-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260618125918.62619-1-jon.mason@arm.com>
References: <20260618125918.62619-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:59:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7089

Update edk2-firmware to the latest release.
Of note, GCC5 make variable has been removed.  Use the GCC make variable
instead.  Also, these changes caused the need to modify the sbsa-acs
patches.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...602.bb =3D> edk2-basetools-native_202605.bb} |  2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  6 +--
 .../recipes-bsp/uefi/edk2-firmware_202602.bb  |  6 ---
 .../recipes-bsp/uefi/edk2-firmware_202605.bb  |  4 ++
 ...-C-VfrCompile-Fix-parallel-make-fail.patch | 46 -------------------
 ...02-Enforce-using-good-old-BFD-linker.patch | 22 ++++-----
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb   |  2 +-
 7 files changed, 20 insertions(+), 68 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202602.bb =3D> edk=
2-basetools-native_202605.bb} (97%)
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202602.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202605.bb
 delete mode 100644 meta-arm/recipes-bsp/uefi/files/0001-BaseTools-Source-C=
-VfrCompile-Fix-parallel-make-fail.patch

diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202605.bb
similarity index 97%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202605.bb
index 28bd0dbade71..e10b85cbcb84 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202602.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202605.bb
@@ -17,7 +17,7 @@ SRC_URI =3D " \
 "
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae12b=
4570a"
=20
-SRCREV =3D "b7a715f7c03c45c6b4575bf88596bfd79658b8ce"
+SRCREV =3D "b03a21a63e3bd001f52c527e5a57feddb53a690b"
 SRCREV_brotli =3D "e230f474b87134e8c6c85b630084c612057f253e"
 SRCREV_FORMAT =3D "default_brotli"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes=
-bsp/uefi/edk2-firmware.inc
index 8b6f153a836c..e12a490fa018 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -74,9 +74,9 @@ export CONF_PATH           =3D "${S}/Conf"
=20
 export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
=20
-EDK_COMPILER ?=3D "GCC5"
-export GCC5_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
-export GCC5_ARM_PREFIX =3D "${TARGET_PREFIX}"
+EDK_COMPILER ?=3D "GCC"
+export GCC_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
+export GCC_ARM_PREFIX =3D "${TARGET_PREFIX}"
=20
 EDK_COMPILER:toolchain-clang =3D "CLANGDWARF"
 export CLANG38_AARCH64_PREFIX =3D "${TARGET_PREFIX}"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202602.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202602.bb
deleted file mode 100644
index de739f37b12b..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202602.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require recipes-bsp/uefi/edk2-firmware.inc
-
-SRCREV_edk2           ?=3D "b7a715f7c03c45c6b4575bf88596bfd79658b8ce"
-SRCREV_edk2-platforms ?=3D "75024f5aa54cf4d975d024768604b28c754db338"
-
-SRC_URI +=3D "file://0001-BaseTools-Source-C-VfrCompile-Fix-parallel-make-=
fail.patch"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202605.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202605.bb
new file mode 100644
index 000000000000..8f1afe133a4e
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202605.bb
@@ -0,0 +1,4 @@
+require recipes-bsp/uefi/edk2-firmware.inc
+
+SRCREV_edk2           ?=3D "b03a21a63e3bd001f52c527e5a57feddb53a690b"
+SRCREV_edk2-platforms ?=3D "04470160f67192c53ec9192e0e8460d183fe49ec"
diff --git a/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-Source-C-VfrCom=
pile-Fix-parallel-make-fail.patch b/meta-arm/recipes-bsp/uefi/files/0001-Ba=
seTools-Source-C-VfrCompile-Fix-parallel-make-fail.patch
deleted file mode 100644
index 7e7353fbb73c..000000000000
--- a/meta-arm/recipes-bsp/uefi/files/0001-BaseTools-Source-C-VfrCompile-Fi=
x-parallel-make-fail.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5f8c99d9a7fe88301b01a7015375a827eecc7985 Mon Sep 17 00:00:00 2001
-From: Michael D Kinney <michael.d.kinney@intel.com>
-Date: Thu, 26 Feb 2026 11:48:11 -0500
-Subject: [PATCH] BaseTools/Source/C/VfrCompile: Fix parallel make failures
-
-Update makefile rules to run antlr and dlg to completion
-before compiling any of the generated cpp files.
-
-Without this change, parallel make may start compiling some
-of the cpp files before both antlr and dlg have finished
-which produces syntax errors from compilation with partially
-generated files.
-
-Also use &: so the targets are treated as a group and the
-rule is only executed once for the entire group. Without
-this change, parallel make may run the rule actions more
-than once and modify the output while it is being used by
-another rule.
-
-Signed-off-by: Michael D Kinney <michael.d.kinney@intel.com>
-
-Upstream-Status: Backport [2f75effb93999adadeead511dd76f86833649b45]
-Signed-off-by: Jon Mason <jon.mason@arm.com>
----
- BaseTools/Source/C/VfrCompile/GNUmakefile | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Source/=
C/VfrCompile/GNUmakefile
-index b469bd3f303f..4f10b1d9338b 100644
---- a/BaseTools/Source/C/VfrCompile/GNUmakefile
-+++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
-@@ -54,10 +54,11 @@ VfrCompiler.o: ../Include/Common/BuildVersion.h
- =0D
- include $(MAKEROOT)/Makefiles/footer.makefile=0D
- =0D
--VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg VfrTokens.h: =
Pccts/antlr/antlr VfrSyntax.g=0D
--	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -=
o . VfrSyntax.g=0D
-+ANTLR_GEN =3D VfrSyntax.cpp EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg=
 VfrTokens.h=0D
-+DLG_GEN =3D VfrLexer.cpp VfrLexer.h=0D
- =0D
--VfrLexer.cpp VfrLexer.h: Pccts/dlg/dlg VfrParser.dlg=0D
-+$(ANTLR_GEN) $(DLG_GEN) &: Pccts/antlr/antlr Pccts/dlg/dlg VfrSyntax.g=0D
-+	Pccts/antlr/antlr -CC -e3 -ck 3 -k 2 -fl VfrParser.dlg -ft VfrTokens.h -=
o . VfrSyntax.g=0D
- 	Pccts/dlg/dlg -C2 -i -CC -cl VfrLexer -o . VfrParser.dlg=0D
- =0D
- Pccts/antlr/antlr:=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old=
-BFD-linker.patch b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-g=
ood-old-BFD-linker.patch
index 42523d0e9a1c..7c02100d7218 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs/0002-Enforce-using-good-old-BFD-li=
nker.patch
@@ -1,4 +1,4 @@
-From af134611c744322e1d159794c426fbdd02e151cc Mon Sep 17 00:00:00 2001
+From 8509abdab8ad75d59d6bc2478bba78b50c59ad82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 7 Apr 2021 00:16:07 -0400
 Subject: [PATCH] Enforce using good old BFD linker
@@ -25,15 +25,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/BaseTools/Conf/tools_def.template b/BaseTools/Conf/tools_def.=
template
-index 90a389bdff07..93f7b5cde437 100755
+index eca4cb82d059..ec4e30f3df84 100644
 --- a/BaseTools/Conf/tools_def.template
 +++ b/BaseTools/Conf/tools_def.template
-@@ -839,7 +839,7 @@ DEFINE GCC_LOONGARCH64_CC_FLAGS    =3D DEF(GCC_ALL_CC_=
FLAGS) -mabi=3Dlp64d -fno-asyn
- DEFINE GCC_AARCH64_CC_FLAGS        =3D DEF(GCC_ALL_CC_FLAGS) -mlittle-end=
ian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-sections -fd=
ata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-table=
s -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
- DEFINE GCC_AARCH64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
- DEFINE GCC_RISCV64_CC_XIPFLAGS     =3D -mstrict-align -mgeneral-regs-only=
=0D
--DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -Wl,--script=3D$(EDK_TOOLS_PATH)/S=
cripts/GccBase.lds=0D
-+DEFINE GCC_DLINK2_FLAGS_COMMON     =3D -fuse-ld=3Dbfd -Wl,--script=3D$(ED=
K_TOOLS_PATH)/Scripts/GccBase.lds=0D
- DEFINE GCC_LOONGARCH64_DLINK_COMMON=3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map=0D
- DEFINE GCC_AARCH64_DLINK_FLAGS     =3D -Wl,--emit-relocs -nostdlib -Wl,--=
gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(DEST=
_DIR_DEBUG)/$(BASE_NAME).map -z common-page-size=3D0x20=0D
- DEFINE GCC_LOONGARCH64_DLINK_FLAGS =3D DEF(GCC_LOONGARCH64_DLINK_COMMON) =
-z common-page-size=3D0x20=0D
+@@ -931,7 +931,7 @@ DEFINE GCC_LOONGARCH64_CC_FLAGS        =3D DEF(GCC_ALL=
_CC_COMMON) -mabi=3Dlp64d -fno
+ DEFINE GCC_AARCH64_CC_COMMON           =3D DEF(GCC_ALL_CC_COMMON) -mlittl=
e-endian -fno-short-enums -fverbose-asm -funsigned-char  -ffunction-section=
s -fdata-sections -Wno-address -fno-asynchronous-unwind-tables -fno-unwind-=
tables -fno-pic -fno-pie -ffixed-x18 -mstack-protector-guard=3Dglobal=0D
+ DEFINE GCC_AARCH64_CC_XIPCOMMON        =3D -mstrict-align -mgeneral-regs-=
only=0D
+ DEFINE GCC_RISCV64_CC_XIPFLAGS         =3D -mstrict-align -mgeneral-regs-=
only=0D
+-DEFINE GCC_DLINK2_FLAGS_COMMON         =3D -Wl,--script=3D$(EDK_TOOLS_PAT=
H)/Scripts/GccBase.lds=0D
++DEFINE GCC_DLINK2_FLAGS_COMMON         =3D -fuse-ld=3Dbfd -Wl,--script=3D=
$(EDK_TOOLS_PATH)/Scripts/GccBase.lds=0D
+ DEFINE GCC_AARCH64_DLINK_COMMON        =3D -Wl,--emit-relocs -nostdlib -W=
l,--gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(=
DEST_DIR_DEBUG)/$(BASE_NAME).map=0D
+ DEFINE GCC_LOONGARCH64_DLINK_COMMON    =3D -Wl,--emit-relocs -nostdlib -W=
l,--gc-sections -u $(IMAGE_ENTRY_POINT) -Wl,-e,$(IMAGE_ENTRY_POINT),-Map,$(=
DEST_DIR_DEBUG)/$(BASE_NAME).map -z common-page-size=3D0x20=0D
+ DEFINE GCC_AARCH64_ASLDLINK_COMMON     =3D DEF(GCC_AARCH64_DLINK_COMMON) =
-Wl,--entry,ReferenceAcpiTable -u $(IMAGE_ENTRY_POINT) -Wl,--defsym=3DPECOF=
F_HEADER_SIZE=3D0 DEF(GCC_DLINK2_FLAGS_COMMON) -z common-page-size=3D0x20=0D
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.2.2.bb
index bc8187ebeb10..6d4422f99a99 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202602.bb
+require recipes-bsp/uefi/edk2-firmware_202605.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "& Apache-2.0"
--=20
2.50.1 (Apple Git-155)


