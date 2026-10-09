Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8E2CA6019
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 14:13:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8806.1791555216000611285
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Oct 2026 07:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=foss header.b=LuhNRBAD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF8261BB2
	for <meta-arm@lists.yoctoproject.org>; Fri,  9 Oct 2026 07:13:31 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F1033F66F
	for <meta-arm@lists.yoctoproject.org>; Fri,  9 Oct 2026 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791555215; bh=ADKGCN5Hpa/RtGt9uYMSIfvzXDW7LUf5yB3tHV1q2eI=;
	h=From:To:Subject:Date:From;
	b=LuhNRBADRkC1nFpYDOwz349CrDQqbIhA0C8pxFveMgrLT89QPSoIZLRWHHWGAw8hp
	 KJkPiQEdhPYMcq6AhbSjDOWbZqALhEHnd29RjBD1/AcYsrWU8v7eFUCSel22cJGm7n
	 lGYaAV1+KPc1kbfvykhoIbOFGMOCJOxB+IxxBKtM=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] edk2: update to edk2-stable202608
Date: Fri,  9 Oct 2026 10:13:34 -0400
Message-ID: <20261009141334.30653-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Oct 2026 14:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7184

Update edk2 and edk2-platforms from edk2-stable202605 to edk2-stable202608 =
tags.

Add a backport for the SmbiosType2Generator clang build failure
introduced by the newer edk2 release.

Remove the same patch from RDN2 and RDV2, where it is not
applicable because those platforms use an older SHA-based edk2
release.

Update SBSA-ACS to use the new edk2 release.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-rdn2.inc   |  1 +
 .../recipes-bsp/uefi/edk2-firmware-rdv2.inc   |  1 +
 ...605.bb =3D> edk2-basetools-native_202608.bb} |  4 +-
 ...-fix-SmbiosType2Genertor-build-failu.patch | 41 +++++++++++++++++++
 .../recipes-bsp/uefi/edk2-firmware_202605.bb  |  4 --
 .../recipes-bsp/uefi/edk2-firmware_202608.bb  |  7 ++++
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb   |  2 +-
 7 files changed, 53 insertions(+), 7 deletions(-)
 rename meta-arm/recipes-bsp/uefi/{edk2-basetools-native_202605.bb =3D> edk=
2-basetools-native_202608.bb} (95%)
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware/0001-DynamicTab=
lesPkg-fix-SmbiosType2Genertor-build-failu.patch
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202605.bb
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_202608.bb

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc b/meta-ar=
m-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc
index e020c5d87b29..898ce78df260 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdn2.inc
@@ -11,6 +11,7 @@ SRC_URI_EDK2_PLATFORMS =3D "git://gitlab.arm.com/infra-so=
lutions/reference-design/
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append =3D " file://0001-Changes-in-acpica-20260408-are-now-causin=
g-issues-wi.patch;patchdir=3Dedk2-platforms"
+SRC_URI:remove =3D "file://0001-DynamicTablesPkg-fix-SmbiosType2Genertor-b=
uild-failu.patch"
=20
 SRCBRANCH_edk2 =3D "refinfra"
 SRCBRANCH_edk2_platforms =3D "refinfra"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc b/meta-ar=
m-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
index 89126c5fdcff..1eb56646e0ff 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-rdv2.inc
@@ -11,6 +11,7 @@ SRC_URI_EDK2_PLATFORMS =3D "git://gitlab.arm.com/infra-so=
lutions/reference-design/
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append =3D " file://0001-Changes-in-acpica-20260408-are-now-causin=
g-issues-wi.patch;patchdir=3Dedk2-platforms"
+SRC_URI:remove =3D "file://0001-DynamicTablesPkg-fix-SmbiosType2Genertor-b=
uild-failu.patch"
=20
 SRCBRANCH_edk2 =3D "refinfra"
 SRCBRANCH_edk2_platforms =3D "refinfra"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202605.bb b/me=
ta-arm/recipes-bsp/uefi/edk2-basetools-native_202608.bb
similarity index 95%
rename from meta-arm/recipes-bsp/uefi/edk2-basetools-native_202605.bb
rename to meta-arm/recipes-bsp/uefi/edk2-basetools-native_202608.bb
index e10b85cbcb84..78baf2ee206a 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202605.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202608.bb
@@ -5,7 +5,7 @@
 # SRCREV_brotli must be kept in sync with the brotli submodule commit that
 # the pinned edk2 SRCREV declares in its .gitmodules. Update it whenever
 # the edk2 SRCREV is bumped.
-#   edk2-stable202602 (b7a715f7): brotli e230f474
+#   edk2-stable202608 (b7a715f7): brotli e230f474
=20
 SUMMARY =3D "EDK2 Base Tools"
 LICENSE =3D "BSD-2-Clause-Patent"
@@ -17,7 +17,7 @@ SRC_URI =3D " \
 "
 LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae12b=
4570a"
=20
-SRCREV =3D "b03a21a63e3bd001f52c527e5a57feddb53a690b"
+SRCREV =3D "2970e5699ba6267f3384ffab20f96647578aebc8"
 SRCREV_brotli =3D "e230f474b87134e8c6c85b630084c612057f253e"
 SRCREV_FORMAT =3D "default_brotli"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware/0001-DynamicTablesPkg-=
fix-SmbiosType2Genertor-build-failu.patch b/meta-arm/recipes-bsp/uefi/edk2-=
firmware/0001-DynamicTablesPkg-fix-SmbiosType2Genertor-build-failu.patch
new file mode 100644
index 000000000000..0352beac6565
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware/0001-DynamicTablesPkg-fix-Smb=
iosType2Genertor-build-failu.patch
@@ -0,0 +1,41 @@
+From 7d2f6b6e31fad2c96c6fc55c17e79f8c96b4bfcf Mon Sep 17 00:00:00 2001
+From: Yeoreum Yun <yeoreum.yun@arm.com>
+Date: Mon, 10 Aug 2026 15:40:06 +0100
+Subject: [PATCH] DynamicTablesPkg: fix SmbiosType2Genertor build failure w=
ith
+ clang
+
+BaseboardCount type is UINT32. Using MAX_UINTN in the comparision
+triggers below build error:
+
+  type 'UINT32' (aka 'unsigned int') is always false
+    [-Werror,-Wtautological-constant-out-of-range-compare]
+  199 |       (BaseboardCount > (MAX_UINTN / sizeof (*CmObjectList))))
+
+To address this, use MAX_UINT32 instead of MAX_UINTN.
+
+Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
+
+Upstream-Status: Backport [7d2f6b6e31fad2c96c6fc55c17e79f8c96b4bfcf]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ .../Library/Smbios/SmbiosType2Lib/SmbiosType2Generator.c      | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/DynamicTablesPkg/Library/Smbios/SmbiosType2Lib/SmbiosType2Gen=
erator.c b/DynamicTablesPkg/Library/Smbios/SmbiosType2Lib/SmbiosType2Genera=
tor.c
+index 1250ef8059e9..5345d2b6d233 100644
+--- a/DynamicTablesPkg/Library/Smbios/SmbiosType2Lib/SmbiosType2Generator.c
++++ b/DynamicTablesPkg/Library/Smbios/SmbiosType2Lib/SmbiosType2Generator.c
+@@ -195,8 +195,8 @@ BuildSmbiosType2TableEx (
+   }=0D
+ =0D
+   if ((BaseboardInfo =3D=3D NULL) ||=0D
+-      (BaseboardCount > (MAX_UINTN / sizeof (*TableList))) ||=0D
+-      (BaseboardCount > (MAX_UINTN / sizeof (*CmObjectList))))=0D
++      (BaseboardCount > (MAX_UINT32 / sizeof (*TableList))) ||=0D
++      (BaseboardCount > (MAX_UINT32 / sizeof (*CmObjectList))))=0D
+   {=0D
+     DEBUG ((DEBUG_ERROR, "%a: Invalid Baseboard object list\n", __func__)=
);=0D
+     return EFI_INVALID_PARAMETER;=0D
+--=20
+2.39.5
+
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202605.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202605.bb
deleted file mode 100644
index 8f1afe133a4e..000000000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_202605.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-bsp/uefi/edk2-firmware.inc
-
-SRCREV_edk2           ?=3D "b03a21a63e3bd001f52c527e5a57feddb53a690b"
-SRCREV_edk2-platforms ?=3D "04470160f67192c53ec9192e0e8460d183fe49ec"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_202608.bb b/meta-arm/r=
ecipes-bsp/uefi/edk2-firmware_202608.bb
new file mode 100644
index 000000000000..5008fcca467b
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_202608.bb
@@ -0,0 +1,7 @@
+require recipes-bsp/uefi/edk2-firmware.inc
+
+SRCREV_edk2           ?=3D "2970e5699ba6267f3384ffab20f96647578aebc8"
+SRCREV_edk2-platforms ?=3D "c98cdf8de9bd84a3267623e64f4388e21de69512"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
+SRC_URI +=3D "file://0001-DynamicTablesPkg-fix-SmbiosType2Genertor-build-f=
ailu.patch"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb b/meta-arm/recipes=
-bsp/uefi/sbsa-acs_7.2.2.bb
index 1c4753cbb252..c9fdaa501bce 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/uefi/edk2-firmware_202605.bb
+require recipes-bsp/uefi/edk2-firmware_202608.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
 LICENSE +=3D "AND Apache-2.0"
--=20
2.54.0 (Apple Git-157)


