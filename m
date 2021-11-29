Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BDEC433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 14:23:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.61566.1638195815518942279
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Nov 2021 06:23:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F04F11D4
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8C213F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 06:23:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp: use edk2-firmware instead of
 virtual/uefi-firmware
Date: Mon, 29 Nov 2021 14:23:29 +0000
Message-Id: <20211129142330.4018944-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129142330.4018944-1-ross.burton@arm.com>
References: <20211129142330.4018944-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Nov 2021 14:23:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2473

Firmware isn't arbitarily interchangable as by definition it is specific
to the platform, so use the real recipe name instead of a virtual name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                            | 2 +-
 meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb       | 2 +-
 .../trusted-firmware-a/trusted-firmware-a-sgi575.inc            | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 288d7608..643212fb 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -31,7 +31,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 #UEFI EDK2 firmware
-EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
+EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
=20
 #grub-efi
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/=
meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
index 0ef68b9b..6f74159c 100644
--- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Firmware image recipe for generating SD-Card=
 artifacts."
=20
 inherit deploy nopackages
=20
-DEPENDS =3D "virtual/uefi-firmware \
+DEPENDS =3D "edk2-firmware \
            virtual/control-processor-firmware \
            n1sdp-board-firmware"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-sgi575.inc
index 84f679c1..5786ce0b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi5=
75.inc
@@ -9,7 +9,7 @@ TFA_MBEDTLS        =3D "1"
 TFA_UBOOT          =3D "0"
=20
 # Sgi575 needs the UEFI as bl33
-DEPENDS +=3D "virtual/uefi-firmware"
+DEPENDS +=3D "edk2-firmware"
=20
 EXTRA_OEMAKE +=3D "BL33=3D${RECIPE_SYSROOT}/firmware/uefi.bin"
 EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOC=
ATION=3Ddevel_rsa \
--=20
2.25.1


