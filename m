Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAC9C19F28
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:57:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21641.1658937417516339644
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 08:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: adam.johnston@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADB5315BF;
	Wed, 27 Jul 2022 08:56:57 -0700 (PDT)
Received: from e114993.cambridge.arm.com (e114993.cambridge.arm.com
 [10.1.194.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CA673F73B;
	Wed, 27 Jul 2022 08:56:56 -0700 (PDT)
From: adam.johnston@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Adam Johnston <adam.johnston@arm.com>
Subject: [PATCH kirkstone 1/5] arm-bsp/trusted-firmware-a: N1SDP trusted boot
Date: Wed, 27 Jul 2022 16:56:39 +0100
Message-Id: <20220727155643.2786523-2-adam.johnston@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727155643.2786523-1-adam.johnston@arm.com>
References: <20220727155643.2786523-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 15:57:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3598

From: Adam Johnston <adam.johnston@arm.com>

This commit configures trusted-firmware-a for TBBR bootflow on N1SDP as f=
ollows:
* Trusted Firmware is upgraded to 2.7.0 for the N1SDP only
* Trusted boot is enabled.
* Generation of root-of-trust is enabled
* All TB images (BLx, DTBs) are built
* uefi.bin is specified as the BL33 image
* BL2, BL31, BL33 are signed and stored in the FIP
* N1SDP platform sources are patched to increase max size BL2 and reduce =
max size of BL1

Signed-off-by: Adam Johnston <adam.johnston@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  2 +
 .../files/n1sdp/bl_size.patch                 | 40 +++++++++++++++++++
 .../trusted-firmware-a-n1sdp.inc              | 27 +++++++++++--
 .../trusted-firmware-a_2.6.bbappend           |  1 -
 .../trusted-firmware-a_2.7.bbappend           |  6 +++
 .../trusted-firmware-a_2.7.bb                 | 15 +++++++
 6 files changed, 87 insertions(+), 4 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1s=
dp/bl_size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.7.bbappend
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.7.bb

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 5e87e61d..4a867135 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -25,6 +25,8 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.15%"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.7%"
+
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
 #UEFI EDK2 firmware
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
index 112fac8b..d47f2572 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -2,8 +2,29 @@
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
+SRC_URI:remove =3D " \
+    file://ssl.patch \
+    "=20
+
+SRC_URI:append =3D " \
+    file://bl_size.patch \
+    "
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
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.6.bbappend
index f8b2ac1b..d18c5252 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.=
bbappend
@@ -6,7 +6,6 @@ MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-=
corstone1000.inc"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE:fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
-MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
 MACHINE_TFA_REQUIRE:tc =3D "trusted-firmware-a-tc.inc"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.7.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.7.bbappend
new file mode 100644
index 00000000..301f5fde
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.=
bbappend
@@ -0,0 +1,6 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?=3D ""
+MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
+
+require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.7.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
new file mode 100644
index 00000000..13785a0a
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.7.bb
@@ -0,0 +1,15 @@
+require trusted-firmware-a.inc
+
+# TF-A v2.7
+SRCREV_tfa =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
+
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
+
+# mbed TLS v2.28.0
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.28"
+SRCREV_mbedtls =3D "8b3f26a5ac38d4fdccbc5c5366229f3e01dafcc0"
+
+LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
+
+# Disable by default
+DEFAULT_PREFERENCE =3D "-1"
--=20
2.17.1


