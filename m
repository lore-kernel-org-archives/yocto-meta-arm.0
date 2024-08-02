Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6843C52D6F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 18:25:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2484.1722623133390322031
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 11:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81E45DA7
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:25:58 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1AB2E3F766
	for <meta-arm@lists.yoctoproject.org>; Fri,  2 Aug 2024 11:25:31 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm-bsp/fvp-base: u-boot patch clean-up
Date: Fri,  2 Aug 2024 14:25:22 -0400
Message-Id: <20240802182525.80611-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 18:25:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5947

Move the fvp-base unique u-boot patches to the proper nested directory
and rename them to match convention (devtool style).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |  3 +-
 ...-wfe-definitions-to-common-Arm-heade.patch | 84 ++++++++++++++++
 ...c_timer-Use-event-stream-for-udelay.patch} | 98 ++-----------------
 3 files changed, 94 insertions(+), 91 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-=
arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/{tick.patch =3D> fvp-base/=
0005-armv8-generic_timer-Use-event-stream-for-udelay.patch} (53%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index 9f8c178a29ef..1bde9c64944a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -4,5 +4,6 @@ SRC_URI:append =3D " \
     file://0001-vexpress64-Set-the-DM_RNG-property.patch \
     file://0002-vexpress64-Select-PSCI-RESET-by-default.patch \
     file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
-    file://tick.patch \
+    file://0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.pat=
ch \
+    file://0005-armv8-generic_timer-Use-event-stream-for-udelay.patch \
     "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-arm-Mov=
e-sev-and-wfe-definitions-to-common-Arm-heade.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/fvp-base/0004-arm-Move-sev-and-wfe-definitions-to-com=
mon-Arm-heade.patch
new file mode 100644
index 000000000000..088b4dccb5b3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-arm-Move-sev-a=
nd-wfe-definitions-to-common-Arm-heade.patch
@@ -0,0 +1,84 @@
+From b18a3c183d20812933d192d4b0d622b11ef2bf29 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Wed, 1 May 2024 09:16:32 +0100
+Subject: [PATCH] arm: Move sev() and wfe() definitions to common Arm hea=
der
+ file
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
+Reviewed-by: Andre Przywara<andre.przywara@arm.com>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ arch/arm/include/asm/system.h              |  9 +++++++++
+ arch/arm/mach-exynos/include/mach/system.h | 19 -------------------
+ 2 files changed, 9 insertions(+), 19 deletions(-)
+
+diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
+index 43f7503571d7..51123c296843 100644
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
+index 5d0bebac5733..0aed4c3e2bf6 100644
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
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0005-armv8-generic_timer-Use-even=
t-stream-for-udelay.patch
similarity index 53%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0005-armv8-gene=
ric_timer-Use-event-stream-for-udelay.patch
index 370bc2745914..ac29b463cd01 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/tick.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0005-armv8-generic_=
timer-Use-event-stream-for-udelay.patch
@@ -1,92 +1,7 @@
-From b18a3c183d20812933d192d4b0d622b11ef2bf29 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Wed, 1 May 2024 09:16:32 +0100
-Subject: [PATCH 1/2] arm: Move sev() and wfe() definitions to common Arm
- header file
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
-index 43f7503571..51123c2968 100644
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
-index 5d0bebac57..0aed4c3e2b 100644
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
-2.34.1
-
-
 From ebc84d7b60c1ed3398e9f600fe3dc8406500bd35 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 1 May 2024 09:16:33 +0100
-Subject: [PATCH 2/2] armv8: generic_timer: Use event stream for udelay
+Subject: [PATCH] armv8: generic_timer: Use event stream for udelay
=20
 Polling cntpct_el0 in a tight loop for delays is inefficient.
 This is particularly apparent on Arm FVPs, which do not simulate
@@ -105,6 +20,9 @@ board family.
=20
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Reviewed-by: Andre Przywara <andre.przywara@arm.com>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  arch/arm/cpu/armv8/Kconfig         |  8 ++++++++
  arch/arm/cpu/armv8/generic_timer.c | 27 +++++++++++++++++++++++++++
@@ -112,7 +30,7 @@ Reviewed-by: Andre Przywara <andre.przywara@arm.com>
  3 files changed, 39 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 9f0fb369f7..199335cd60 100644
+index 9f0fb369f773..199335cd6040 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
 @@ -191,6 +191,14 @@ config ARMV8_EA_EL3_FIRST
@@ -131,7 +49,7 @@ index 9f0fb369f7..199335cd60 100644
  	bool "ARM64 Accelerated Cryptographic Algorithms"
 =20
 diff --git a/arch/arm/cpu/armv8/generic_timer.c b/arch/arm/cpu/armv8/gen=
eric_timer.c
-index e4aa5a4745..1de7ec596f 100644
+index e4aa5a474553..1de7ec596fc7 100644
 --- a/arch/arm/cpu/armv8/generic_timer.c
 +++ b/arch/arm/cpu/armv8/generic_timer.c
 @@ -114,3 +114,30 @@ ulong timer_get_boot_us(void)
@@ -166,7 +84,7 @@ index e4aa5a4745..1de7ec596f 100644
 +}
 +#endif
 diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
-index 51123c2968..7e30cac32a 100644
+index 51123c296843..7e30cac32a09 100644
 --- a/arch/arm/include/asm/system.h
 +++ b/arch/arm/include/asm/system.h
 @@ -69,8 +69,10 @@
@@ -183,5 +101,5 @@ index 51123c2968..7e30cac32a 100644
  /*
   * HCR_EL2 bits definitions
 --=20
-2.34.1
+2.30.2
=20
--=20
2.39.3 (Apple Git-146)


