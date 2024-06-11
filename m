Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D26CC27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:05:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12067.1718118325082219798
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jun 2024 08:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347CD106F
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D6753F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 08:05:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] arm-bsp/u-boot: update tick.patch to merged patches
Date: Tue, 11 Jun 2024 15:05:17 +0000
Message-Id: <20240611150519.1940896-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611150519.1940896-1-ross.burton@arm.com>
References: <20240611150519.1940896-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jun 2024 15:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5798

These patches have been merged, so refresh the patches.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/u-boot/u-boot/tick.patch      | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot/tick.patch
index 88c9b056..370bc274 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch
@@ -1,6 +1,6 @@
-From 1023728e7925443032fc7f7733c12ed37142523d Mon Sep 17 00:00:00 2001
+From b18a3c183d20812933d192d4b0d622b11ef2bf29 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Tue, 23 Apr 2024 09:10:04 +0100
+Date: Wed, 1 May 2024 09:16:32 +0100
 Subject: [PATCH 1/2] arm: Move sev() and wfe() definitions to common Arm
  header file
=20
@@ -13,8 +13,9 @@ wfe may theoretically trigger a context switch if an in=
terrupt occurs
 so add a memory barrier to this call.
=20
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Reviewed-by: Andre Przywara<andre.przywara@arm.com>
=20
-Upstream-Status: Submitted [https://lore.kernel.org/u-boot/2024042308100=
5.23218-1-peter.hoyes@arm.com/]
+Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  arch/arm/include/asm/system.h              |  9 +++++++++
@@ -82,9 +83,9 @@ index 5d0bebac57..0aed4c3e2b 100644
 2.34.1
=20
=20
-From d96e7f07f6863e24d360924aea4eb0460d706e89 Mon Sep 17 00:00:00 2001
+From ebc84d7b60c1ed3398e9f600fe3dc8406500bd35 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Tue, 23 Apr 2024 09:10:05 +0100
+Date: Wed, 1 May 2024 09:16:33 +0100
 Subject: [PATCH 2/2] armv8: generic_timer: Use event stream for udelay
=20
 Polling cntpct_el0 in a tight loop for delays is inefficient.
@@ -99,13 +100,11 @@ trade-off between efficiency and the fact that Arm F=
VPs do not
 typically simulate real time.
=20
 This is only implemented for Armv8 boards, where an architectural
-timer exists.
-
-Some mach-socfpga AArch64 boards already override __udelay to make
-it always inline, so guard the functionality with a new
-ARMV8_UDELAY_EVENT_STREAM Kconfig, enabled by default.
+timer exists, and only enabled by default for the ARCH_VEXPRESS64
+board family.
=20
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Reviewed-by: Andre Przywara <andre.przywara@arm.com>
 ---
  arch/arm/cpu/armv8/Kconfig         |  8 ++++++++
  arch/arm/cpu/armv8/generic_timer.c | 27 +++++++++++++++++++++++++++
@@ -113,7 +112,7 @@ Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
  3 files changed, 39 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 9f0fb369f7..544c5e2d74 100644
+index 9f0fb369f7..199335cd60 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
 @@ -191,6 +191,14 @@ config ARMV8_EA_EL3_FIRST
@@ -122,7 +121,7 @@ index 9f0fb369f7..544c5e2d74 100644
 =20
 +config ARMV8_UDELAY_EVENT_STREAM
 +	bool "Use the event stream for udelay"
-+	default y if !ARCH_SOCFPGA
++	default y if ARCH_VEXPRESS64
 +	help
 +	  Use the event stream provided by the AArch64 architectural timer for
 +	  delays. This is more efficient than the default polling
@@ -132,10 +131,10 @@ index 9f0fb369f7..544c5e2d74 100644
  	bool "ARM64 Accelerated Cryptographic Algorithms"
 =20
 diff --git a/arch/arm/cpu/armv8/generic_timer.c b/arch/arm/cpu/armv8/gen=
eric_timer.c
-index 8f83372cbc..e18b5c8187 100644
+index e4aa5a4745..1de7ec596f 100644
 --- a/arch/arm/cpu/armv8/generic_timer.c
 +++ b/arch/arm/cpu/armv8/generic_timer.c
-@@ -115,3 +115,30 @@ ulong timer_get_boot_us(void)
+@@ -114,3 +114,30 @@ ulong timer_get_boot_us(void)
 =20
  	return val / get_tbclk();
  }
--=20
2.34.1


