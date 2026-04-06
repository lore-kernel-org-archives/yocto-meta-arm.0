Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23B4F46C51
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:16:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57328.1775488581594628833
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Apr 2026 08:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=Yofx2pIi;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B8972972
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:16:15 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C9483F632
	for <meta-arm@lists.yoctoproject.org>; Mon,  6 Apr 2026 08:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775488581; bh=sjPQhvBJf8MiA3eCNS1BvED6KySMai+T8CProEWTMN8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yofx2pIia1QfxpD1rVny3ubqXFwr43yglhpqQRcGKB3hmiz75Oly04WSvZsRVd7tf
	 93bmV+VHNvMNdkQb8iNF/lwGjmL5KtnSHLF/zGrNhdrU+kFBD1Q/LrtpgX9orOE0Ja
	 f/aUwwBmDcPAuKB+Wdh6alg6o9xJCwJEutOvirRI=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/edk2-firmware: remove 202408
Date: Mon,  6 Apr 2026 11:16:20 -0400
Message-ID: <20260406151620.99679-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260406151620.99679-1-jon.mason@arm.com>
References: <20260406151620.99679-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Apr 2026 15:16:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7003

Nothing in meta-arm-bsp is using this version anymore.  Drop it and the
related patches.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_202408.bb  | 12 -----
 .../0001-BaseTools-Pccts-set-C-standard.patch | 47 -------------------
 .../0001-Platform-StMmRpmb-Fix-build.patch    | 38 ---------------
 3 files changed, 97 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pcct=
s-set-C-standard.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-StMmR=
pmb-Fix-build.patch

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
deleted file mode 100644
index 6b0f1961be4c..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202408.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-bsp/uefi/edk2-firmware.inc
-
-SRCREV_edk2           ?=3D "b158dad150bf02879668f72ce306445250838201"
-SRCREV_edk2-platforms ?=3D "a3c898956a4d48dc5980336fa6ce6eeb23c4f72b"
-
-SRC_URI +=3D "file://0001-Platform-StMmRpmb-Fix-build.patch;patchdir=3Dedk=
2-platforms \
-            file://0001-BaseTools-Pccts-set-C-standard.patch"
-
-# FIXME:
-# ArmPkg/Universal/Smbios/SmbiosMiscDxe/Type03/MiscChassisManufacturerFunc=
tion.c:146:37:
-# error: variable 'ContainedElements' is uninitialized when passed as a co=
nst pointer argument here [-Werror,-Wuninitialized-const-pointer]
-TOOLCHAIN:aarch64 =3D "gcc"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pccts-set-C=
-standard.patch b/meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pccts-=
set-C-standard.patch
deleted file mode 100644
index 913bd4a94502..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/0001-BaseTools-Pccts-set-C-standa=
rd.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e063f8b8a53861043b9872cc35b08a3dc03b0942 Mon Sep 17 00:00:00 2001
-From: Gerd Hoffmann <kraxel@redhat.com>
-Date: Mon, 20 Jan 2025 09:40:31 +0100
-Subject: [PATCH] BaseTools/Pccts: set C standard
-
-The prehistoric code base doesn't build with ISO C23.  Set the C
-standard to C11 (for both clang and gcc) so it continues to build with
-gcc 15 (which uses C23 by default).
-
-Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
-
-Upstream-Status: Backport [e063f8b8a53861043b9872cc35b08a3dc03b0942]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile | 2 +-
- BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile b/BaseTool=
s/Source/C/VfrCompile/Pccts/antlr/makefile
-index 746d58b5e2..b47c8a37af 100644
---- a/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
-+++ b/BaseTools/Source/C/VfrCompile/Pccts/antlr/makefile
-@@ -169,7 +169,7 @@ ANTLR=3D${BIN_DIR}/antlr
- DLG=3D${BIN_DIR}/dlg=0D
- OBJ_EXT=3Do=0D
- OUT_OBJ =3D -o=0D
--CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZLE=
XBUFSIZE=3D65536=0D
-+CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN $(COTHER) -DZZLE=
XBUFSIZE=3D65536 -std=3Dgnu11=0D
- CPPFLAGS=3D=0D
- #=0D
- # SGI Users, use this CFLAGS=0D
-diff --git a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile b/BaseTools/=
Source/C/VfrCompile/Pccts/dlg/makefile
-index e45ac98e04..d72bee3d70 100644
---- a/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
-+++ b/BaseTools/Source/C/VfrCompile/Pccts/dlg/makefile
-@@ -123,7 +123,7 @@ endif
- COPT=3D-O=0D
- ANTLR=3D${BIN_DIR}/antlr=0D
- DLG=3D${BIN_DIR}/dlg=0D
--CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536=0D
-+CFLAGS=3D $(COPT) -I. -I$(SET) -I$(PCCTS_H) -DUSER_ZZSYN -DZZLEXBUFSIZE=
=3D65536 -std=3Dgnu11=0D
- CPPFLAGS=3D=0D
- OBJ_EXT=3Do=0D
- OUT_OBJ =3D -o=0D
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix=
-build.patch b/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-F=
ix-build.patch
deleted file mode 100644
index 234ccf343c63..000000000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/0001-Platform-StMmRpmb-Fix-build.=
patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ee185eda7b7ec9a0c82827fea197fbb73d971f93 Mon Sep 17 00:00:00 2001
-From: Ard Biesheuvel <ardb@kernel.org>
-Date: Thu, 29 Aug 2024 21:21:50 +0200
-Subject: [PATCH] Platform/StMmRpmb: Fix build
-
-Add some missing library class resolutions relating to changes in the
-core upstream EDK2 repo.
-
-Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
-Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
----
- .../PlatformStandaloneMmPkg/PlatformStandaloneMmRpmb.dsc       | 3 +++
- 1 file changed, 3 insertions(+)
-
-Upstream-Status: Backport
-
-diff --git a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandal=
oneMmRpmb.dsc b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStand=
aloneMmRpmb.dsc
-index 653029c52f..54c7a63b41 100644
---- a/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRp=
mb.dsc
-+++ b/Platform/StandaloneMm/PlatformStandaloneMmPkg/PlatformStandaloneMmRp=
mb.dsc
-@@ -41,11 +41,14 @@
-   ExtractGuidedSectionLib|EmbeddedPkg/Library/PrePiExtractGuidedSectionLi=
b/PrePiExtractGuidedSectionLib.inf=0D
-   FvLib|StandaloneMmPkg/Library/FvLib/FvLib.inf=0D
-   HobLib|StandaloneMmPkg/Library/StandaloneMmCoreHobLib/StandaloneMmCoreH=
obLib.inf=0D
-+  HobPrintLib|MdeModulePkg/Library/HobPrintLib/HobPrintLib.inf=0D
-+  ImagePropertiesRecordLib|MdeModulePkg/Library/ImagePropertiesRecordLib/=
ImagePropertiesRecordLib.inf=0D
-   IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf=0D
-   NULL|MdePkg/Library/BaseStackCheckLib/BaseStackCheckLib.inf=0D
-   MemLib|StandaloneMmPkg/Library/StandaloneMmMemLib/StandaloneMmMemLib.in=
f=0D
-   MemoryAllocationLib|StandaloneMmPkg/Library/StandaloneMmCoreMemoryAlloc=
ationLib/StandaloneMmCoreMemoryAllocationLib.inf=0D
-   PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf=0D
-+  PeCoffGetEntryPointLib|MdePkg/Library/BasePeCoffGetEntryPointLib/BasePe=
CoffGetEntryPointLib.inf=0D
-   PeCoffLib|MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf=0D
-   PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf=0D
-   VariablePolicyLib|MdeModulePkg/Library/VariablePolicyLib/VariablePolicy=
Lib.inf=0D
---=20
-2.43.0
-
--=20
2.50.1 (Apple Git-155)


