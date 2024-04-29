Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06925C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:04:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19102.1714392250334074113
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 05:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CF132F4;
	Mon, 29 Apr 2024 05:04:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65E0B3F73F;
	Mon, 29 Apr 2024 05:04:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/u-boot: add optimised timer implementation for fvp-base
Date: Mon, 29 Apr 2024 12:04:04 +0000
Message-Id: <20240429120404.3941386-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 12:04:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5618

Due to how the timer in u-boot is implemented, it's quite possible for
a two second timeout in the u-boot login to actually take over 15s to
expire.

Take a patch from the mailing list to implement this differently so the
timer runs in an accurate amount of time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |   1 +
 .../recipes-bsp/u-boot/u-boot/tick.patch      | 188 ++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index 9aca993f..9f8c178a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -4,4 +4,5 @@ SRC_URI:append =3D " \
     file://0001-vexpress64-Set-the-DM_RNG-property.patch \
     file://0002-vexpress64-Select-PSCI-RESET-by-default.patch \
     file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
+    file://tick.patch \
     "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot/tick.patch
new file mode 100644
index 00000000..88c9b056
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch
@@ -0,0 +1,188 @@
+From 1023728e7925443032fc7f7733c12ed37142523d Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Tue, 23 Apr 2024 09:10:04 +0100
+Subject: [PATCH 1/2] arm: Move sev() and wfe() definitions to common Arm
+ header file
+
+The sev() and wfe() asm macros are currently defined only for
+mach-exynos. As these are common Arm instructions, move them to the
+common asm/system.h header file, for both Armv7 and Armv8, so they
+can be used by other machines.
+
+wfe may theoretically trigger a context switch if an interrupt occurs
+so add a memory barrier to this call.
+
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/2024042308100=
5.23218-1-peter.hoyes@arm.com/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ arch/arm/include/asm/system.h              |  9 +++++++++
+ arch/arm/mach-exynos/include/mach/system.h | 19 -------------------
+ 2 files changed, 9 insertions(+), 19 deletions(-)
+
+diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
+index 43f7503571..51123c2968 100644
+--- a/arch/arm/include/asm/system.h
++++ b/arch/arm/include/asm/system.h
+@@ -154,6 +154,13 @@ enum dcache_option {
+ 	"wfi" : : : "memory");		\
+ 	})
+=20
++#define wfe()				\
++	({asm volatile(			\
++	"wfe" : : : "memory");		\
++	})
++
++#define sev() asm volatile("sev")
++
+ static inline unsigned int current_el(void)
+ {
+ 	unsigned long el;
+@@ -369,6 +376,8 @@ void switch_to_hypervisor_ret(void);
+=20
+ #ifdef __ARM_ARCH_7A__
+ #define wfi() __asm__ __volatile__ ("wfi" : : : "memory")
++#define wfe() __asm__ __volatile__ ("wfe" : : : "memory")
++#define sev() __asm__ __volatile__ ("sev")
+ #else
+ #define wfi()
+ #endif
+diff --git a/arch/arm/mach-exynos/include/mach/system.h b/arch/arm/mach-=
exynos/include/mach/system.h
+index 5d0bebac57..0aed4c3e2b 100644
+--- a/arch/arm/mach-exynos/include/mach/system.h
++++ b/arch/arm/mach-exynos/include/mach/system.h
+@@ -36,25 +36,6 @@ struct exynos5_sysreg {
+=20
+ #define USB20_PHY_CFG_HOST_LINK_EN	(1 << 0)
+=20
+-/*
+- * This instruction causes an event to be signaled to all cores
+- * within a multiprocessor system. If SEV is implemented,
+- * WFE must also be implemented.
+- */
+-#define sev() __asm__ __volatile__ ("sev\n\t" : : );
+-/*
+- * If the Event Register is not set, WFE suspends execution until
+- * one of the following events occurs:
+- * - an IRQ interrupt, unless masked by the CPSR I-bit
+- * - an FIQ interrupt, unless masked by the CPSR F-bit
+- * - an Imprecise Data abort, unless masked by the CPSR A-bit
+- * - a Debug Entry request, if Debug is enabled
+- * - an Event signaled by another processor using the SEV instruction.
+- * If the Event Register is set, WFE clears it and returns immediately.
+- * If WFE is implemented, SEV must also be implemented.
+- */
+-#define wfe() __asm__ __volatile__ ("wfe\n\t" : : );
+-
+ /* Move 0xd3 value to CPSR register to enable SVC mode */
+ #define svc32_mode_en() __asm__ __volatile__				\
+ 			("@ I&F disable, Mode: 0x13 - SVC\n\t"		\
+--=20
+2.34.1
+
+
+From d96e7f07f6863e24d360924aea4eb0460d706e89 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Tue, 23 Apr 2024 09:10:05 +0100
+Subject: [PATCH 2/2] armv8: generic_timer: Use event stream for udelay
+
+Polling cntpct_el0 in a tight loop for delays is inefficient.
+This is particularly apparent on Arm FVPs, which do not simulate
+real time, meaning that a 1s sleep can take a couple of orders
+of magnitude longer to execute in wall time.
+
+If running at EL2 or above (where CNTHCTL_EL2 is available), enable
+the cntpct_el0 event stream temporarily and use wfe to implement
+the delay more efficiently. The event period is chosen as a
+trade-off between efficiency and the fact that Arm FVPs do not
+typically simulate real time.
+
+This is only implemented for Armv8 boards, where an architectural
+timer exists.
+
+Some mach-socfpga AArch64 boards already override __udelay to make
+it always inline, so guard the functionality with a new
+ARMV8_UDELAY_EVENT_STREAM Kconfig, enabled by default.
+
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+---
+ arch/arm/cpu/armv8/Kconfig         |  8 ++++++++
+ arch/arm/cpu/armv8/generic_timer.c | 27 +++++++++++++++++++++++++++
+ arch/arm/include/asm/system.h      |  6 ++++--
+ 3 files changed, 39 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
+index 9f0fb369f7..544c5e2d74 100644
+--- a/arch/arm/cpu/armv8/Kconfig
++++ b/arch/arm/cpu/armv8/Kconfig
+@@ -191,6 +191,14 @@ config ARMV8_EA_EL3_FIRST
+ 	  Exception handling at all exception levels for External Abort and
+ 	  SError interrupt exception are taken in EL3.
+=20
++config ARMV8_UDELAY_EVENT_STREAM
++	bool "Use the event stream for udelay"
++	default y if !ARCH_SOCFPGA
++	help
++	  Use the event stream provided by the AArch64 architectural timer for
++	  delays. This is more efficient than the default polling
++	  implementation.
++
+ menuconfig ARMV8_CRYPTO
+ 	bool "ARM64 Accelerated Cryptographic Algorithms"
+=20
+diff --git a/arch/arm/cpu/armv8/generic_timer.c b/arch/arm/cpu/armv8/gen=
eric_timer.c
+index 8f83372cbc..e18b5c8187 100644
+--- a/arch/arm/cpu/armv8/generic_timer.c
++++ b/arch/arm/cpu/armv8/generic_timer.c
+@@ -115,3 +115,30 @@ ulong timer_get_boot_us(void)
+=20
+ 	return val / get_tbclk();
+ }
++
++#if CONFIG_IS_ENABLED(ARMV8_UDELAY_EVENT_STREAM)
++void __udelay(unsigned long usec)
++{
++	u64 target =3D get_ticks() + usec_to_tick(usec);
++
++	/* At EL2 or above, use the event stream to avoid polling CNTPCT_EL0 s=
o often */
++	if (current_el() >=3D 2) {
++		u32 cnthctl_val;
++		const u8 event_period =3D 0x7;
++
++		asm volatile("mrs %0, cnthctl_el2" : "=3Dr" (cnthctl_val));
++		asm volatile("msr cnthctl_el2, %0" : : "r"
++			(cnthctl_val | CNTHCTL_EL2_EVNT_EN | CNTHCTL_EL2_EVNT_I(event_period=
)));
++
++		while (get_ticks() + (1ULL << event_period) <=3D target)
++			wfe();
++
++		/* Reset the event stream */
++		asm volatile("msr cnthctl_el2, %0" : : "r" (cnthctl_val));
++	}
++
++	/* Fall back to polling CNTPCT_EL0 */
++	while (get_ticks() <=3D target)
++		;
++}
++#endif
+diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
+index 51123c2968..7e30cac32a 100644
+--- a/arch/arm/include/asm/system.h
++++ b/arch/arm/include/asm/system.h
+@@ -69,8 +69,10 @@
+ /*
+  * CNTHCTL_EL2 bits definitions
+  */
+-#define CNTHCTL_EL2_EL1PCEN_EN	(1 << 1)  /* Physical timer regs accessi=
ble   */
+-#define CNTHCTL_EL2_EL1PCTEN_EN	(1 << 0)  /* Physical counter accessibl=
e      */
++#define CNTHCTL_EL2_EVNT_EN	BIT(2)	     /* Enable the event stream     =
  */
++#define CNTHCTL_EL2_EVNT_I(val)	((val) << 4) /* Event stream trigger bi=
ts     */
++#define CNTHCTL_EL2_EL1PCEN_EN	(1 << 1)     /* Physical timer regs acce=
ssible */
++#define CNTHCTL_EL2_EL1PCTEN_EN	(1 << 0)     /* Physical counter access=
ible   */
+=20
+ /*
+  * HCR_EL2 bits definitions
+--=20
+2.34.1
+
--=20
2.34.1


