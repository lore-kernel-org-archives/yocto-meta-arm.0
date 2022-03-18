Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3C6C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 16:54:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12271.1647622466566801436
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AC351570
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A22F3F7B4
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm-bsp/fvp-base: consolidate FVP configuration
Date: Fri, 18 Mar 2022 16:54:20 +0000
Message-Id: <20220318165422.1711512-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318165422.1711512-1-ross.burton@arm.com>
References: <20220318165422.1711512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 16:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3184

The bulk of the FVP_* variables are common, so move them into
fvp-common.inc.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf | 15 +++++++++++++--
 meta-arm-bsp/conf/machine/fvp-base.conf       | 16 +---------------
 meta-arm-bsp/conf/machine/fvp-common.inc      | 15 +++++++++++++++
 3 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp=
/conf/machine/fvp-base-arm32.conf
index 9e821b74..acaadbaf 100644
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -7,9 +7,20 @@
 require conf/machine/fvp-common.inc
 require conf/machine/include/arm/arch-armv7a.inc
=20
-KERNEL_IMAGETYPE =3D "zImage"
-
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_aarch32_defconfig"
=20
+KERNEL_IMAGETYPE =3D "zImage"
+
 KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
+
+FVP_DATA ?=3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}@0=
x80080000 \
+             cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/fvp-base-gicv3-psci-cus=
tom.dtb@0x83000000"
+FVP_CONFIG[cluster0.cpu0.CONFIG64] =3D "0"
+FVP_CONFIG[cluster0.cpu1.CONFIG64] =3D "0"
+FVP_CONFIG[cluster0.cpu2.CONFIG64] =3D "0"
+FVP_CONFIG[cluster0.cpu3.CONFIG64] =3D "0"
+FVP_CONFIG[cluster1.cpu0.CONFIG64] =3D "0"
+FVP_CONFIG[cluster1.cpu1.CONFIG64] =3D "0"
+FVP_CONFIG[cluster1.cpu2.CONFIG64] =3D "0"
+FVP_CONFIG[cluster1.cpu3.CONFIG64] =3D "0"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 06a8bd93..00ef2116 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -16,19 +16,5 @@ KERNEL_IMAGETYPE =3D "Image"
=20
 KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
=20
-FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
-FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
-FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
-FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
-FVP_CONFIG[cache_state_modelled] ?=3D "0"
-FVP_CONFIG[bp.secureflashloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/bl1-fvp=
.bin"
-FVP_CONFIG[bp.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
 FVP_DATA ?=3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}@0=
x80080000 \
-            cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x8300=
0000"
-FVP_CONSOLE ?=3D "terminal_0"
-FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
-FVP_TERMINALS[bp.terminal_1] ?=3D ""
-FVP_TERMINALS[bp.terminal_2] ?=3D ""
-FVP_TERMINALS[bp.terminal_3] ?=3D ""
+             cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/fvp-base-revc.dtb@0x830=
00000"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index a8fd60d9..f98f6cc8 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -25,3 +25,18 @@ PACKAGECONFIG:remove:pn-openssh =3D "rng-tools"
 MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
=20
 TEST_TARGET =3D "OEFVPTarget"
+
+FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
+FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
+FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
+FVP_CONFIG[cache_state_modelled] ?=3D "0"
+FVP_CONFIG[bp.secureflashloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/bl1-fvp=
.bin"
+FVP_CONFIG[bp.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
+FVP_CONSOLE ?=3D "terminal_0"
+FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
+FVP_TERMINALS[bp.terminal_1] ?=3D ""
+FVP_TERMINALS[bp.terminal_2] ?=3D ""
+FVP_TERMINALS[bp.terminal_3] ?=3D ""
--=20
2.25.1


