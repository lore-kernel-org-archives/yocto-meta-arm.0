Return-Path: <anusmita.duttamazumder@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A7CC54E69
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:35:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.41293.1710761746083800124
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 04:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6572B106F;
	Mon, 18 Mar 2024 04:36:20 -0700 (PDT)
Received: from PW04GXMM.arm.com (PW04GXMM.arm.com [10.1.39.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD7EB3F762;
	Mon, 18 Mar 2024 04:35:44 -0700 (PDT)
From: anusmita.duttamazumder@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/1] arm-bsp/n1sdp: Update EDK2 version
Date: Mon, 18 Mar 2024 11:35:31 +0000
Message-Id: <20240318113531.9598-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240318113531.9598-1-anusmita.duttamazumder@arm.com>
References: <20240318113531.9598-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:35:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5447

From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>

Update N1SDP EDK2 version to 2023-11 and rebase existing out of tree patche=
s.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                   |  2 +-
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb  |  7 -------
 ...orm-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch | 10 ++++++----
 3 files changed, 7 insertions(+), 12 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machi=
ne/n1sdp.conf
index 12b22cec..fa6d6f7f 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -35,7 +35,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmwa=
re"
=20
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
-PREFERRED_VERSION_edk2-firmware ?=3D "202305"
+PREFERRED_VERSION_edk2-firmware ?=3D "202311"
=20
 #optee
 PREFERRED_VERSION_optee-os ?=3D "4.1.%"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb b/meta-a=
rm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb
deleted file mode 100644
index 23325503..00000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202305.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SRCREV_edk2           ?=3D "ba91d0292e593df8528b66f99c1b0b14fadc8e16"
-SRCREV_edk2-platforms ?=3D "be2af02a3fb202756ed9855173e0d0ed878ab6be"
-
-# FIXME - clang is having issues with antlr
-TOOLCHAIN:aarch64 =3D "gcc"
-
-require recipes-bsp/uefi/edk2-firmware.inc
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1=
Sdp-Reserve-OP-TEE-Region-from-UEFI.patch b/meta-arm-bsp/recipes-bsp/uefi/f=
iles/n1sdp/0009-Platform-ARM-N1Sdp-Reserve-OP-TEE-Region-from-UEFI.patch
index 0fdf9ee3..6105e9a6 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp-Res=
erve-OP-TEE-Region-from-UEFI.patch
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/0009-Platform-ARM-N1Sdp-Res=
erve-OP-TEE-Region-from-UEFI.patch
@@ -1,15 +1,14 @@
-From f2a76d6595b31b0bc1be7029277676af1b1cc3d3 Mon Sep 17 00:00:00 2001
+From 60dfd5bb8f25fa5f0b6c07c3098836bec1668c19 Mon Sep 17 00:00:00 2001
 From: Mariam Elshakfy <mariam.elshakfy@arm.com>
-Date: Wed, 11 Oct 2023 16:18:22 +0000
+Date: Thu, 14 Mar 2024 14:47:27 +0000
 Subject: [PATCH] Platform/ARM/N1Sdp: Reserve OP-TEE Region from UEFI
=20
 To enable cache on N1SDP, OP-TEE has to be moved
 to run from DDR4 memory. Since this memory is
 known to application side, it must be reserved
=20
-Upstream-Status: Pending (not yet submitted to upstream)
+Upstream-Status: Inappropriate [will not be submitted as it's a workaround=
 to address hardware issue]
 Signed-off-by: Mariam Elshakfy <mariam.elshakfy@arm.com>
-
 ---
  .../Library/PlatformLib/PlatformLib.inf             |  3 +++
  .../Library/PlatformLib/PlatformLibMem.c            | 13 +++++++++++++
@@ -68,3 +67,6 @@ index 9e257ebde0..587319262a 100644
 +=0D
  [Ppis]=0D
    gNtFwConfigDtInfoPpiGuid =3D  { 0xb50dee0e, 0x577f, 0x47fb, { 0x83, 0xd=
0, 0x41, 0x78, 0x61, 0x8b, 0x33, 0x8a } }=0D
+--=20
+2.38.1
+
--=20
2.34.1


