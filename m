Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61076CFA463
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 19:39:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6814.1729712390747982544
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 12:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E515E339
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 12:40:19 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 158273F528
	for <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 12:39:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/fvp-base: remove backported u-boot patches
Date: Wed, 23 Oct 2024 15:39:48 -0400
Message-Id: <20241023193949.59449-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Oct 2024 19:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6223

With the recent update of u-boot to 2024.10, these patches are no longer
needed (as they are in this release).  Remove them and everything is
happy again.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |   2 -
 ...-wfe-definitions-to-common-Arm-heade.patch |  84 --------------
 ...ic_timer-Use-event-stream-for-udelay.patch | 105 ------------------
 3 files changed, 191 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-=
arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0005-=
armv8-generic_timer-Use-event-stream-for-udelay.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index 1bde9c64944a..9aca993f5cbc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -4,6 +4,4 @@ SRC_URI:append =3D " \
     file://0001-vexpress64-Set-the-DM_RNG-property.patch \
     file://0002-vexpress64-Select-PSCI-RESET-by-default.patch \
     file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
-    file://0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.pat=
ch \
-    file://0005-armv8-generic_timer-Use-event-stream-for-udelay.patch \
     "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-arm-Mov=
e-sev-and-wfe-definitions-to-common-Arm-heade.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/fvp-base/0004-arm-Move-sev-and-wfe-definitions-to-com=
mon-Arm-heade.patch
deleted file mode 100644
index 088b4dccb5b3..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-arm-Move-sev-a=
nd-wfe-definitions-to-common-Arm-heade.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From b18a3c183d20812933d192d4b0d622b11ef2bf29 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Wed, 1 May 2024 09:16:32 +0100
-Subject: [PATCH] arm: Move sev() and wfe() definitions to common Arm hea=
der
- file
-
-The sev() and wfe() asm macros are currently defined only for
-mach-exynos. As these are common Arm instructions, move them to the
-common asm/system.h header file, for both Armv7 and Armv8, so they
-can be used by other machines.
-
-wfe may theoretically trigger a context switch if an interrupt occurs
-so add a memory barrier to this call.
-
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Reviewed-by: Andre Przywara<andre.przywara@arm.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm/include/asm/system.h              |  9 +++++++++
- arch/arm/mach-exynos/include/mach/system.h | 19 -------------------
- 2 files changed, 9 insertions(+), 19 deletions(-)
-
-diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
-index 43f7503571d7..51123c296843 100644
---- a/arch/arm/include/asm/system.h
-+++ b/arch/arm/include/asm/system.h
-@@ -154,6 +154,13 @@ enum dcache_option {
- 	"wfi" : : : "memory");		\
- 	})
-=20
-+#define wfe()				\
-+	({asm volatile(			\
-+	"wfe" : : : "memory");		\
-+	})
-+
-+#define sev() asm volatile("sev")
-+
- static inline unsigned int current_el(void)
- {
- 	unsigned long el;
-@@ -369,6 +376,8 @@ void switch_to_hypervisor_ret(void);
-=20
- #ifdef __ARM_ARCH_7A__
- #define wfi() __asm__ __volatile__ ("wfi" : : : "memory")
-+#define wfe() __asm__ __volatile__ ("wfe" : : : "memory")
-+#define sev() __asm__ __volatile__ ("sev")
- #else
- #define wfi()
- #endif
-diff --git a/arch/arm/mach-exynos/include/mach/system.h b/arch/arm/mach-=
exynos/include/mach/system.h
-index 5d0bebac5733..0aed4c3e2bf6 100644
---- a/arch/arm/mach-exynos/include/mach/system.h
-+++ b/arch/arm/mach-exynos/include/mach/system.h
-@@ -36,25 +36,6 @@ struct exynos5_sysreg {
-=20
- #define USB20_PHY_CFG_HOST_LINK_EN	(1 << 0)
-=20
--/*
-- * This instruction causes an event to be signaled to all cores
-- * within a multiprocessor system. If SEV is implemented,
-- * WFE must also be implemented.
-- */
--#define sev() __asm__ __volatile__ ("sev\n\t" : : );
--/*
-- * If the Event Register is not set, WFE suspends execution until
-- * one of the following events occurs:
-- * - an IRQ interrupt, unless masked by the CPSR I-bit
-- * - an FIQ interrupt, unless masked by the CPSR F-bit
-- * - an Imprecise Data abort, unless masked by the CPSR A-bit
-- * - a Debug Entry request, if Debug is enabled
-- * - an Event signaled by another processor using the SEV instruction.
-- * If the Event Register is set, WFE clears it and returns immediately.
-- * If WFE is implemented, SEV must also be implemented.
-- */
--#define wfe() __asm__ __volatile__ ("wfe\n\t" : : );
--
- /* Move 0xd3 value to CPSR register to enable SVC mode */
- #define svc32_mode_en() __asm__ __volatile__				\
- 			("@ I&F disable, Mode: 0x13 - SVC\n\t"		\
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0005-armv8-g=
eneric_timer-Use-event-stream-for-udelay.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/fvp-base/0005-armv8-generic_timer-Use-event-stream-for-ude=
lay.patch
deleted file mode 100644
index ac29b463cd01..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0005-armv8-generic_=
timer-Use-event-stream-for-udelay.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From ebc84d7b60c1ed3398e9f600fe3dc8406500bd35 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Wed, 1 May 2024 09:16:33 +0100
-Subject: [PATCH] armv8: generic_timer: Use event stream for udelay
-
-Polling cntpct_el0 in a tight loop for delays is inefficient.
-This is particularly apparent on Arm FVPs, which do not simulate
-real time, meaning that a 1s sleep can take a couple of orders
-of magnitude longer to execute in wall time.
-
-If running at EL2 or above (where CNTHCTL_EL2 is available), enable
-the cntpct_el0 event stream temporarily and use wfe to implement
-the delay more efficiently. The event period is chosen as a
-trade-off between efficiency and the fact that Arm FVPs do not
-typically simulate real time.
-
-This is only implemented for Armv8 boards, where an architectural
-timer exists, and only enabled by default for the ARCH_VEXPRESS64
-board family.
-
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Reviewed-by: Andre Przywara <andre.przywara@arm.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- arch/arm/cpu/armv8/Kconfig         |  8 ++++++++
- arch/arm/cpu/armv8/generic_timer.c | 27 +++++++++++++++++++++++++++
- arch/arm/include/asm/system.h      |  6 ++++--
- 3 files changed, 39 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 9f0fb369f773..199335cd6040 100644
---- a/arch/arm/cpu/armv8/Kconfig
-+++ b/arch/arm/cpu/armv8/Kconfig
-@@ -191,6 +191,14 @@ config ARMV8_EA_EL3_FIRST
- 	  Exception handling at all exception levels for External Abort and
- 	  SError interrupt exception are taken in EL3.
-=20
-+config ARMV8_UDELAY_EVENT_STREAM
-+	bool "Use the event stream for udelay"
-+	default y if ARCH_VEXPRESS64
-+	help
-+	  Use the event stream provided by the AArch64 architectural timer for
-+	  delays. This is more efficient than the default polling
-+	  implementation.
-+
- menuconfig ARMV8_CRYPTO
- 	bool "ARM64 Accelerated Cryptographic Algorithms"
-=20
-diff --git a/arch/arm/cpu/armv8/generic_timer.c b/arch/arm/cpu/armv8/gen=
eric_timer.c
-index e4aa5a474553..1de7ec596fc7 100644
---- a/arch/arm/cpu/armv8/generic_timer.c
-+++ b/arch/arm/cpu/armv8/generic_timer.c
-@@ -114,3 +114,30 @@ ulong timer_get_boot_us(void)
-=20
- 	return val / get_tbclk();
- }
-+
-+#if CONFIG_IS_ENABLED(ARMV8_UDELAY_EVENT_STREAM)
-+void __udelay(unsigned long usec)
-+{
-+	u64 target =3D get_ticks() + usec_to_tick(usec);
-+
-+	/* At EL2 or above, use the event stream to avoid polling CNTPCT_EL0 s=
o often */
-+	if (current_el() >=3D 2) {
-+		u32 cnthctl_val;
-+		const u8 event_period =3D 0x7;
-+
-+		asm volatile("mrs %0, cnthctl_el2" : "=3Dr" (cnthctl_val));
-+		asm volatile("msr cnthctl_el2, %0" : : "r"
-+			(cnthctl_val | CNTHCTL_EL2_EVNT_EN | CNTHCTL_EL2_EVNT_I(event_period=
)));
-+
-+		while (get_ticks() + (1ULL << event_period) <=3D target)
-+			wfe();
-+
-+		/* Reset the event stream */
-+		asm volatile("msr cnthctl_el2, %0" : : "r" (cnthctl_val));
-+	}
-+
-+	/* Fall back to polling CNTPCT_EL0 */
-+	while (get_ticks() <=3D target)
-+		;
-+}
-+#endif
-diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
-index 51123c296843..7e30cac32a09 100644
---- a/arch/arm/include/asm/system.h
-+++ b/arch/arm/include/asm/system.h
-@@ -69,8 +69,10 @@
- /*
-  * CNTHCTL_EL2 bits definitions
-  */
--#define CNTHCTL_EL2_EL1PCEN_EN	(1 << 1)  /* Physical timer regs accessi=
ble   */
--#define CNTHCTL_EL2_EL1PCTEN_EN	(1 << 0)  /* Physical counter accessibl=
e      */
-+#define CNTHCTL_EL2_EVNT_EN	BIT(2)	     /* Enable the event stream     =
  */
-+#define CNTHCTL_EL2_EVNT_I(val)	((val) << 4) /* Event stream trigger bi=
ts     */
-+#define CNTHCTL_EL2_EL1PCEN_EN	(1 << 1)     /* Physical timer regs acce=
ssible */
-+#define CNTHCTL_EL2_EL1PCTEN_EN	(1 << 0)     /* Physical counter access=
ible   */
-=20
- /*
-  * HCR_EL2 bits definitions
---=20
-2.30.2
-
--=20
2.39.5 (Apple Git-154)


