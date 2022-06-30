Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42512C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:44:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.23225.1656582253036912361
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 02:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E839E1042;
	Thu, 30 Jun 2022 02:44:12 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10B3F3F5A1;
	Thu, 30 Jun 2022 02:44:11 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH 2/4] arm-bsp/trusted-firmware-a: N1SDP trusted boot
Date: Thu, 30 Jun 2022 10:43:31 +0100
Message-Id: <20220630094333.3738129-3-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630094333.3738129-1-adam.johnston@arm.com>
References: <20220630094333.3738129-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jun 2022 09:44:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3544

From: Adam Johnston <adam.johnston@arm.com>

This commit configures trusted-firmware-a for TBBR bootflow on N1SDP as f=
ollows:
* Trusted boot is enabled.
* Generation of root-of-trust is enabled
* All TB images (BLx, DTBs) are built
* uefi.bin is specified as the BL33 image
* BL2, BL31, BL33 are signed and stored in the FIP
* N1SDP platform sources are patched to increase max size BL2 and reduce =
max size of BL1

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 .../files/n1sdp/bl_size.patch                 | 40 +++++++++++++++++++
 .../trusted-firmware-a-n1sdp.inc              | 21 ++++++++--
 2 files changed, 58 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/bl_size.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_s=
ize.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_si=
ze.patch
new file mode 100644
index 00000000..a5b30195
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/bl_size.pat=
ch
@@ -0,0 +1,40 @@
+From 80b1efa92486a87f9e82dbf665ef612291148de8 Mon Sep 17 00:00:00 2001
+From: Adam Johnston <adam.johnston@arm.com>
+Date: Tue, 14 Jun 2022 11:19:30 +0000
+Subject: [PATCH] arm-bsp/trusted-firmware-a: N1SDP trusted boot
+
+Increase max size of BL2 on N1SDP by 4KB to enable trusted boot
+Decrease max size of BL1 on N1SDP by 8KB so BL1/BL2 fits above BL31 prog=
bits
+
+Signed-off-by: Adam Johnston <adam.johnston@arm.com>
+Upstream-Status: Pending [Flagged to upstream]
+
+---
+ plat/arm/board/n1sdp/include/platform_def.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plat/arm/board/n1sdp/include/platform_def.h b/plat/arm/boar=
d/n1sdp/include/platform_def.h
+index c9b81bafa..7468a31ed 100644
+--- a/plat/arm/board/n1sdp/include/platform_def.h
++++ b/plat/arm/board/n1sdp/include/platform_def.h
+@@ -91,7 +91,7 @@
+  * PLAT_ARM_MAX_BL1_RW_SIZE is calculated using the current BL1 RW debu=
g size
+  * plus a little space for growth.
+  */
+-#define PLAT_ARM_MAX_BL1_RW_SIZE	0xE000
++#define PLAT_ARM_MAX_BL1_RW_SIZE	0xC000
+=20
+ /*
+  * PLAT_ARM_MAX_ROMLIB_RW_SIZE is define to use a full page
+@@ -110,7 +110,7 @@
+  * little space for growth.
+  */
+ #if TRUSTED_BOARD_BOOT
+-# define PLAT_ARM_MAX_BL2_SIZE		0x20000
++# define PLAT_ARM_MAX_BL2_SIZE		0x21000
+ #else
+ # define PLAT_ARM_MAX_BL2_SIZE		0x14000
+ #endif
+--=20
+2.35.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index 112fac8b..f8a0b8d5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -2,8 +2,23 @@
=20
 COMPATIBLE_MACHINE =3D "n1sdp"
 TFA_PLATFORM       =3D "n1sdp"
-TFA_BUILD_TARGET   =3D "bl31 dtbs"
-TFA_INSTALL_TARGET =3D "bl31 n1sdp-multi-chip n1sdp-single-chip"
+TFA_BUILD_TARGET   =3D "all fip"
+TFA_INSTALL_TARGET =3D "bl1 bl2 bl31 n1sdp-multi-chip n1sdp-single-chip =
n1sdp_fw_config n1sdp_tb_fw_config fip"
 TFA_DEBUG          =3D "1"
-TFA_MBEDTLS        =3D "0"
+TFA_MBEDTLS        =3D "1"
 TFA_UBOOT          =3D "0"
+TFA_UEFI           =3D "1"
+
+SRC_URI:append =3D " file://bl_size.patch"
+
+TFA_ROT_KEY=3D "plat/arm/board/common/rotpk/arm_rotprivk_rsa.pem"
+
+EXTRA_OEMAKE:append =3D "\
+                    TRUSTED_BOARD_BOOT=3D1 \
+                    GENERATE_COT=3D1 \
+                    CREATE_KEYS=3D1 \
+                    ENABLE_PIE=3D0 \
+                    ARM_ROTPK_LOCATION=3D"devel_rsa" \
+                    ROT_KEY=3D"${TFA_ROT_KEY}" \
+                    BL33=3D${RECIPE_SYSROOT}/firmware/uefi.bin \
+                    "
--=20
2.25.1


