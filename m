Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF13C25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:32:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10128.1716384765950109087
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 May 2024 06:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C340339
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 06:33:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C544D3F766
	for <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 06:32:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/linux-yocto: fvp-base: remove fvp-timer.cfg
Date: Wed, 22 May 2024 13:32:42 +0000
Message-Id: <20240522133242.1866847-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 May 2024 13:32:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5748

The fvp-timer.cfg enables two modules for the SP804 and SP810 devices.
These are older pieces of hardware that predate the architectural timer
in modern systems, so even if the drivers are built they will not be used
by the kernel.

Whilst this is a good reason to remove them, another reason is that the
SP804 driver is incorrectly defined in the Kconfig so it can only be
built if a machine selects it explicitly (for arm64, only ARCH_BCM2835
and ARCH_HISI do this) or if COMPILE_TEST is enabled.

This led to COMPILE_TEST being enabled so that this driver can be built.
However, COMPILE_TEST does more, notably it turns on COMPILE_WERROR which
then makes any compile warnings fatal.  This is inconvenient, especially
when compiler upgrades happen.

Remove the timer configuration entirely: the architectural timer is used
so this is entirely redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/fvp.scc       | 1 -
 .../arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg   | 4 ----
 2 files changed, 5 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp/fvp-timer.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kme=
ta/bsp/arm-platforms/fvp.scc
index 80b85819..8e9731d4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp.scc
@@ -9,5 +9,4 @@ kconf hardware fvp/fvp-rtc.cfg
 kconf hardware fvp/fvp-serial.cfg
 kconf hardware fvp/fvp-cfi.cfg
 kconf hardware fvp/fvp-drm.cfg
-kconf hardware fvp/fvp-timer.cfg
 kconf hardware fvp/fvp-watchdog.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp/fvp-timer.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
deleted file mode 100644
index b33c65c2..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp/fvp-timer.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-# Dual timer module
-CONFIG_COMPILE_TEST=3Dy
-CONFIG_ARM_TIMER_SP804=3Dy
-CONFIG_CLK_SP810=3Dy
--=20
2.34.1


