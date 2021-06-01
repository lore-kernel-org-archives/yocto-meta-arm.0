Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web10.58665.1622558495508214507
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 07:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 _spf-b.arm.com}: parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B67AE11B3
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Jun 2021 07:41:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C1673F719
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Jun 2021 07:41:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2 6/6] arm-bsp/fvp-base: set FVP_ variables
Date: Tue,  1 Jun 2021 15:41:29 +0100
Message-Id: <20210601144129.1894990-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601144129.1894990-1-ross.burton@arm.com>
References: <20210601144129.1894990-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

So that a fvp-base image can be tested easily, set the relevant FVP_*
variables.

After setting IMAGE_CLASSES +=3D "fvpboot" in local.conf, this will show
the firmware start and Linux boot:

$ MACHINE=3Dfvp-base bitbake core-image-base
$ runfvp fvp-base --console

Change-Id: Id1bd6cea57958117103e53ab9f78a58ce92b6a2e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 4bccdb6..41163c9 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -15,3 +15,17 @@ UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
 KERNEL_IMAGETYPE =3D "Image"
=20
 KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
+
+FVP_PROVIDER ?=3D "fvp-base-a-aem-native"
+FVP_EXE ?=3D "FVP_Base_RevC-2xAEMvA"
+FVP_CONFIG[cache_state_modelled] ?=3D "0"
+FVP_CONFIG[bp.secureflashloader.fname] ?=3D "${DEPLOY_DIR_IMAGE}/bl1-fvp=
.bin"
+FVP_CONFIG[bp.flashloader0.fname] ?=3D "${DEPLOY_DIR_IMAGE}/fip-fvp.bin"
+FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${DEPLOY_DIR_IMAGE}/${=
IMAGE_NAME}.rootfs.wic"
+FVP_DATA ?=3D "cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}@0=
x80080000 \
+            cluster0.cpu0=3D${DEPLOY_DIR_IMAGE}/fvp-base-gicv3-psci-cust=
om.dtb@0x83000000"
+FVP_CONSOLE ?=3D "terminal_0"
+FVP_TERMINALS[bp.terminal_0] ?=3D "Console"
+FVP_TERMINALS[bp.terminal_1] ?=3D ""
+FVP_TERMINALS[bp.terminal_2] ?=3D ""
+FVP_TERMINALS[bp.terminal_3] ?=3D ""
--=20
2.25.1

