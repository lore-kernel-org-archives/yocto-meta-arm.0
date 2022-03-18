Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4420DC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 16:54:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12378.1647622467157475156
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 09:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A33A11595
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5298D3F7B4
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 09:54:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm-bsp/u-boot: use latest u-boot for fvp-base
Date: Fri, 18 Mar 2022 16:54:22 +0000
Message-Id: <20220318165422.1711512-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318165422.1711512-1-ross.burton@arm.com>
References: <20220318165422.1711512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Mar 2022 16:54:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3187

Explicitly enable use of CRC instructions: we configure fvp-base to have
armv8.4 cores, but the default uboot config disables crc (see uboot 51d83=
67d8).

Keep fvp-base-arm32 on 2021.10 as the arm32-specific patches need
rebasing, and a trivial rebase doesn't boot successfully.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf                | 1 +
 meta-arm-bsp/conf/machine/fvp-common.inc                     | 2 --
 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg | 2 ++
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp=
/conf/machine/fvp-base-arm32.conf
index acaadbaf..b6fe6f77 100644
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -8,6 +8,7 @@ require conf/machine/fvp-common.inc
 require conf/machine/include/arm/arch-armv7a.inc
=20
 # FVP u-boot configuration
+PREFERRED_VERSION_u-boot ?=3D "2021.10"
 UBOOT_MACHINE =3D "vexpress_aemv8a_aarch32_defconfig"
=20
 KERNEL_IMAGETYPE =3D "zImage"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf=
/machine/fvp-common.inc
index 3da1ef0b..b0aeb81f 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -14,8 +14,6 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
=20
-PREFERRED_VERSION_u-boot ?=3D "2021.10"
-
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg=
 b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
index b7510f48..716600f4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
@@ -1 +1,3 @@
 CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 root=3D=
/dev/vda1 rw rootwait"
+# Our FVP support CRC instructions
+CONFIG_ARM64_CRC32=3Dy
--=20
2.25.1


