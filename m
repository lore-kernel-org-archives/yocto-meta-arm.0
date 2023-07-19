Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB07C04A6A
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 01:22:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4285.1689729767069627833
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 18:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A0F139F;
	Tue, 18 Jul 2023 18:23:29 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B4D73F67D;
	Tue, 18 Jul 2023 18:22:46 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ziad Elhanafy <ziad.elhanafy@arm.com>
Subject: [PATCH v2 5/8] arm-bsp/conf: Remove hardcoded .rootfs from image path
Date: Tue, 18 Jul 2023 20:22:37 -0500
Message-Id: <20230719012240.3567881-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719012240.3567881-1-jon.mason@arm.com>
References: <20230719012240.3567881-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 01:22:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4899

From: Ziad Elhanafy <ziad.elhanafy@arm.com>

Remove hardcoded .rootfs from image path in:
1- fvp-common.inc
2- corstone1000-fvp.conf
3- corstone500.conf
4- fvp-baser-aemv8r64.conf

Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/corstone1000-fvp.conf   | 2 +-
 meta-arm-bsp/conf/machine/corstone500.conf        | 2 +-
 meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf | 2 +-
 meta-arm-bsp/conf/machine/include/fvp-common.inc  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf b/meta-arm-b=
sp/conf/machine/corstone1000-fvp.conf
index 449f5658..9636ffe4 100644
--- a/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone1000-fvp.conf
@@ -32,7 +32,7 @@ FVP_CONFIG[se.nvm.update_raw_image] ?=3D "0"
 FVP_CONFIG[se.cryptocell.USER_OTP_FILTERING_DISABLE] ?=3D "1"
=20
 # Boot image
-FVP_DATA ?=3D "board.flash0=3D${IMAGE_NAME}.rootfs.wic@0x68000000"
+FVP_DATA ?=3D "board.flash0=3D${IMAGE_NAME}.wic@0x68000000"
=20
 # External system (cortex-M3)
 FVP_CONFIG[extsys_harness0.extsys_flashloader.fname] ?=3D "es_flashfw.bi=
n"
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index a688ad2f..978d4edb 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -38,7 +38,7 @@ TEST_SUITES =3D "fvp_boot"
 FVP_PROVIDER ?=3D "fvp-corstone500-native"
 FVP_EXE ?=3D "FVP_Corstone-500"
 FVP_CONFIG[board.flashloader0.fname] ?=3D "bl1.bin"
-FVP_DATA ?=3D "css.cluster.cpu0=3D${IMAGE_NAME}.rootfs.wic.nopt@0x800000=
00"
+FVP_DATA ?=3D "css.cluster.cpu0=3D${IMAGE_NAME}.wic.nopt@0x80000000"
 FVP_CONSOLE ?=3D "terminal_0"
 FVP_TERMINALS[css.terminal_0] ?=3D "console"
 FVP_TERMINALS[css.terminal_1] ?=3D ""
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index c0ac3d75..b5900b4e 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -51,7 +51,7 @@ FVP_CONFIG[bp.virtio_net.hostbridge.userNetworking] ?=3D=
 "1"
 FVP_CONFIG[bp.virtio_net.secure_accesses] =3D "1"
 FVP_CONFIG[bp.virtio_rng.enabled] ?=3D "1"
 FVP_CONFIG[bp.virtio_rng.secure_accesses] =3D "1"
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.rootfs.w=
ic"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
 FVP_CONFIG[bp.virtioblockdevice.secure_accesses] =3D "1"
 FVP_CONFIG[cache_state_modelled] ?=3D "0"
 FVP_CONFIG[cci400.force_on_from_start] =3D "1"
diff --git a/meta-arm-bsp/conf/machine/include/fvp-common.inc b/meta-arm-=
bsp/conf/machine/include/fvp-common.inc
index b76de3c4..36bf9555 100644
--- a/meta-arm-bsp/conf/machine/include/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/include/fvp-common.inc
@@ -37,7 +37,7 @@ FVP_CONFIG[bp.virtio_net.hostbridge.userNetPorts] =3D "=
8022=3D22"
 FVP_CONFIG[cache_state_modelled] ?=3D "0"
 FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
 FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
-FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.rootfs.w=
ic"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
 # Set the baseline to ARMv8.4, as the default is 8.0.
 FVP_CONFIG[cluster0.has_arm_v8-4] =3D "1"
 FVP_CONFIG[cluster1.has_arm_v8-4] =3D "1"
--=20
2.30.2


