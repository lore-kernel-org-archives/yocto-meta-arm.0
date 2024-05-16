Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47CCC41513
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 14:05:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14921.1715868338226021730
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 07:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F0331007;
	Thu, 16 May 2024 07:06:02 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.32.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32F8A3F7A6;
	Thu, 16 May 2024 07:05:37 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: [PATCH scarthgap 1/1] arm-bsp/trusted-firmware-a: corstone1000: fix reset sequence
Date: Thu, 16 May 2024 15:05:27 +0100
Message-Id: <20240516140527.67665-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516140527.67665-1-emekcan.aras@arm.com>
References: <20240516140527.67665-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 14:05:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5720

From: Emekcan Aras <Emekcan.Aras@arm.com>

Corstone1000 does not properly clean the cache and disable gic interrupts
before the reset. This causes a race condition especially in FVP after re=
set.
This adds proper sequence before resetting the platform.

Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
---
 ...-clean-the-cache-and-disable-interru.patch | 46 +++++++++++++++++++
 .../trusted-firmware-a-corstone1000.inc       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/cor=
stone1000/0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone10=
00/0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005-fix-corst=
one1000-clean-the-cache-and-disable-interru.patch
new file mode 100644
index 00000000..a45b6577
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/corstone1000/0005=
-fix-corstone1000-clean-the-cache-and-disable-interru.patch
@@ -0,0 +1,46 @@
+From 37f92eeb4361626072e690adb3b0bb20db7c2fca Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 15 May 2024 13:54:51 +0100
+Subject: [PATCH] fix(corstone1000): clean the cache and disable interrup=
t
+ before system reset
+
+Corstone1000 does not properly clean the cache and disable gic interrupt=
s
+before the reset. This causes a race condition especially in FVP after r=
eset.
+This adds proper sequence before resetting the platform.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Upstream-Status: Pending
+---
+ plat/arm/board/corstone1000/common/corstone1000_pm.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/plat/arm/board/corstone1000/common/corstone1000_pm.c b/plat=
/arm/board/corstone1000/common/corstone1000_pm.c
+index 4b0a791e7..a52e945bf 100644
+--- a/plat/arm/board/corstone1000/common/corstone1000_pm.c
++++ b/plat/arm/board/corstone1000/common/corstone1000_pm.c
+@@ -7,6 +7,7 @@
+ #include <lib/psci/psci.h>
+ #include <plat/arm/common/plat_arm.h>
+ #include <platform_def.h>
++#include <drivers/arm/gicv2.h>
+ /**********************************************************************=
*********
+  * Export the platform handlers via plat_arm_psci_pm_ops. The ARM Stand=
ard
+  * platform layer will take care of registering the handlers with PSCI.
+@@ -18,6 +19,14 @@ static void __dead2 corstone1000_system_reset(void)
+ 	uint32_t volatile * const watchdog_ctrl_reg =3D (uint32_t *) SECURE_WA=
TCHDOG_ADDR_CTRL_REG;
+ 	uint32_t volatile * const watchdog_val_reg =3D (uint32_t *) SECURE_WAT=
CHDOG_ADDR_VAL_REG;
+=20
++	/* Flush and invalidate data cache */
++	dcsw_op_all(DCCISW);
++	/*
++	 * Disable GIC CPU interface to prevent pending interrupt
++	 * from waking up the AP from WFI.
++	 */
++	gicv2_cpuif_disable();
++
+ 	*(watchdog_val_reg) =3D SECURE_WATCHDOG_COUNTDOWN_VAL;
+ 	*watchdog_ctrl_reg =3D SECURE_WATCHDOG_MASK_ENABLE;
+ 	while (1) {
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index a61c74b4..f5737ca4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -8,6 +8,7 @@ SRC_URI:append =3D " \
 	file://0002-fix-corstone1000-pass-spsr-value-explicitly.patch \
 	file://0003-fix-spmd-remove-EL3-interrupt-registration.patch \
 	file://0004-fix-corstone1000-remove-unused-NS_SHARED_RAM-region.patch \
+	file://0005-fix-corstone1000-clean-the-cache-and-disable-interru.patch =
\
        "
=20
 TFA_DEBUG =3D "1"
--=20
2.25.1


