Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B40BCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:38:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53318.1697805525170128908
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 05:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14AC92F4
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:39:25 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.36.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE9D43F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:38:43 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm-bsp/fvp-base: Merge fvp-common.inc into fvp-base.conf
Date: Fri, 20 Oct 2023 13:38:24 +0100
Message-Id: <20231020123827.346193-1-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 12:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5154

Merge the common FVP configuration in fvp-common.inc into
fvp-base.conf since that is the only place it is inherited.

Drop setting MACHINE_FEATURES to "optee" because there is no
optee machine feature.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       | 45 +++++++++++++++--
 .../conf/machine/include/fvp-common.inc       | 50 -------------------
 2 files changed, 42 insertions(+), 53 deletions(-)
 delete mode 100644 meta-arm-bsp/conf/machine/include/fvp-common.inc

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 3a923bad..cc0893fa 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -4,15 +4,54 @@
 #@NAME: Armv8-A Base Platform FVP machine
 #@DESCRIPTION: Machine configuration for Armv8-A Base Platform FVP model

-require conf/machine/include/fvp-common.inc
 require conf/machine/include/arm/arch-armv8a.inc

 TUNE_FEATURES =3D "aarch64"

+IMAGE_NAME_SUFFIX =3D ""
+IMAGE_FSTYPES +=3D "wic"
+WKS_FILE ?=3D "fvp-base.wks"
+
+SERIAL_CONSOLES =3D "115200;ttyAMA0"
+
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
+KERNEL_IMAGETYPE =3D "Image"
+
+EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
+
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"

-KERNEL_IMAGETYPE =3D "Image"
+# As this is a virtual target that will not be used in the real world th=
ere is
+# no need for real SSH keys.
+MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
+
+TEST_TARGET =3D "OEFVPTarget"
+TEST_TARGET_IP =3D "127.0.0.1:2222"
+TEST_SUITES:append =3D " fvp_boot fvp_devices"
+TEST_FVP_DEVICES ?=3D "rtc watchdog networking virtiorng cpu_hotplug"

+FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
+FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
+FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
+# Tell testimage to connect to localhost:2222, and forward that to SSH i=
n the FVP.
+FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
 FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
-IMAGE_NAME_SUFFIX =3D ""
+FVP_CONFIG[cache_state_modelled] ?=3D "0"
+FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
+FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
+# Set the baseline to ARMv8.4, as the default is 8.0.
+FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
+FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
+FVP_CONSOLE ?=3D "terminal_0"
+FVP_DATA ?=3D "cluster0.cpu0=3D${KERNEL_IMAGETYPE}@0x80080000 \
+             cluster0.cpu0=3Dfvp-base-revc.dtb@0x8fc00000"
+FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
+FVP_TERMINALS[bp.terminal_1] ?=3D ""
+FVP_TERMINALS[bp.terminal_2] ?=3D ""
+FVP_TERMINALS[bp.terminal_3] ?=3D ""
+
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-=
bsp/conf/machine/include/fvp-common.inc
deleted file mode 100644
index e6e44431..00000000
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ /dev/null
@@ -1,50 +0,0 @@
-# FVP common parameters
-
-#
-# Capturing FVP common configurations (Armv8-A Base Platform FVP,
-# Armv8-A Foundation Platform and Armv7-A Base Platform FVP).
-#
-
-MACHINE_FEATURES =3D "optee"
-
-IMAGE_FSTYPES +=3D "wic"
-WKS_FILE ?=3D "fvp-base.wks"
-
-SERIAL_CONSOLES =3D "115200;ttyAMA0"
-
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-
-KERNEL_DEVICETREE =3D "arm/fvp-base-revc.dtb"
-
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
-
-# As this is a virtual target that will not be used in the real world th=
ere is
-# no need for real SSH keys.
-MACHINE_EXTRA_RRECOMMENDS +=3D "ssh-pregen-hostkeys"
-
-TEST_TARGET =3D "OEFVPTarget"
-TEST_TARGET_IP =3D "127.0.0.1:2222"
-TEST_SUITES:append =3D " fvp_boot fvp_devices"
-TEST_FVP_DEVICES ?=3D "rtc watchdog networking virtiorng cpu_hotplug"
-
-FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
-FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
-FVP_CONFIG[bp.ve_sysregs.exit_on_shutdown] ?=3D "1"
-FVP_CONFIG[bp.virtio_net.enabled] ?=3D "1"
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D "1"
-# Tell testimage to connect to localhost:2222, and forward that to SSH i=
n the FVP.
-FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] =3D "2222=3D22"
-FVP_CONFIG[cache_state_modelled] ?=3D "0"
-FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
-FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
-# Set the baseline to ARMv8.4, as the default is 8.0.
-FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
-FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
-FVP_CONSOLE ?=3D "terminal_0"
-FVP_DATA ?=3D "cluster0.cpu0=3D${KERNEL_IMAGETYPE}@0x80080000 \
-             cluster0.cpu0=3Dfvp-base-revc.dtb@0x8fc00000"
-FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
-FVP_TERMINALS[bp.terminal_1] ?=3D ""
-FVP_TERMINALS[bp.terminal_2] ?=3D ""
-FVP_TERMINALS[bp.terminal_3] ?=3D ""
--
2.25.1


