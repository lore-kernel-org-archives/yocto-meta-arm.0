Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2588ECA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 13:52:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17234.1757685171497484580
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 06:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C9C516A3
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 06:52:42 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 92AFB3F66E
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 06:52:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-base: add abstracts for easier ISA configuration
Date: Fri, 12 Sep 2025 09:52:49 -0400
Message-Id: <20250912135249.81126-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 13:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6706

Add variables for setting the Major and Minor version of the ARM
Instruction Set Architecture, and add those variables in the various
places needed for the FVP Base virtual machine to run with those
instructions.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf           | 15 ++++++++++++---
 .../trusted-firmware-a-fvp-base.inc               |  4 ++--
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 2dd2dacb7775..52f1e1f2f141 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -6,6 +6,12 @@
=20
 require conf/machine/include/arm/arch-armv8-5a.inc
=20
+# Set variables here to make it easier to change Instruction Set Archite=
ctures
+# on the FVP Base machine, which should make it easier to test both the =
tunes
+# and the virtual hardware.  These variables are set via the DEFAULT_TUN=
E
+ARM_ISA_MAJOR =3D "${@int(d.getVar('ARMPKGARCH').split('v')[1][0])}"
+ARM_ISA_MINOR =3D "${@int(d.getVar('ARMPKGARCH')[d.getVar('ARMPKGARCH').=
find('-')+1]) if '-' in d.getVar('ARMPKGARCH') else 0 }"
+
 ARM_SYSTEMREADY_FIRMWARE =3D "trusted-firmware-a:do_deploy"
 ARM_SYSTEMREADY_ACS_CONSOLE =3D "default"
 EXTRA_IMAGEDEPENDS =3D "${ARM_SYSTEMREADY_FIRMWARE}"
@@ -55,9 +61,12 @@ FVP_CONFIG[cluster1.stage12_tlb_size] ?=3D "1024"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
 FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
-# Set the baseline to ARMv8.5, as the default is 8.0.
-FVP_CONFIG[cluster0.has_arm_v8-5] =3D "1"
-FVP_CONFIG[cluster1.has_arm_v8-5] =3D "1"
+
+# FVP Base default is 8.0, so there is no has_arm_v8-0 for it.  However,=
 this is needed for every version after.  So set this accordingly
+FVP_EXTRA_ARGS =3D "--parameter cluster0.has_arm_v${ARM_ISA_MAJOR}-${ARM=
_ISA_MINOR}=3D1 --parameter cluster1.has_arm_v${ARM_ISA_MAJOR}-${ARM_ISA_=
MINOR}=3D1"
+FVP_EXTRA_ARGS +=3D "${@bb.utils.contains('TUNE_FEATURES', 'sve', '--par=
ameter cluster0.has_sve=3D1 --parameter cluster1.has_sve=3D1', '', d)}"
+FVP_EXTRA_ARGS +=3D "${@bb.utils.contains('TUNE_FEATURES', 'sve2', '--pa=
rameter cluster0.sve.has_sve2=3D1 --parameter cluster1.sve.has_sve2=3D1',=
 '', d)}"
+
 FVP_CONSOLES[default] =3D "terminal_0"
 FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
 FVP_TERMINALS[bp.terminal_1] ?=3D ""
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index b93dc72a9c68..06a2d22631c3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -63,8 +63,8 @@ TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
=20
 EXTRA_OEMAKE +=3D "FVP_DT_PREFIX=3Dfvp-base-gicv3-psci-1t FVP_USE_GIC_DR=
IVER=3DFVP_GICV3"
=20
-# Our fvp-base machine explicitly has v8.4 cores
-EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4"
+# Set the ISA to fvp-base conf file and disable AArch32 system registers
+EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D${ARM_ISA_MAJOR} ARM_ARCH_MINOR=3D${=
ARM_ISA_MINOR} CTX_INCLUDE_AARCH32_REGS=3D0"
=20
 # If GENERATE_COT is set, then tf-a will try to use local poetry install
 # to run the python cot-dt2c command.  Disable the local poetry and use
--=20
2.39.5 (Apple Git-154)


