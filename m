Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF13C41513
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:27:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89284.1718724459185191049
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 08:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95F7EDA7;
	Tue, 18 Jun 2024 08:28:03 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.30.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DCC33F6A8;
	Tue, 18 Jun 2024 08:27:37 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH v2 4/5] arm-bsp/trusted-firmware-m: corstone1000: Multicore support for Corstone-1000 FVP
Date: Tue, 18 Jun 2024 16:27:23 +0100
Message-Id: <20240618152724.7273-5-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
References: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 15:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5823

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset introduces the multicore support for the Corstone-1000
FVP.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...CS1000-Add-multicore-support-for-FVP.patch | 119 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-platform-CS1000-Add-multicore-support-for-FVP.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-platform-CS1000-Add-multicore-support-for-FVP.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-platform-CS1000-=
Add-multicore-support-for-FVP.patch
new file mode 100644
index 00000000..9ede5341
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-platform-CS1000-Add-multicore-support-for-FVP.patch
@@ -0,0 +1,119 @@
+From 1120957e74a1a0727a215188813cab3e47602e71 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 9 May 2024 13:20:57 +0000
+Subject: [PATCH] platform: CS1000: Add multicore support for FVP
+
+This changeset adds the support to enable the secondary cores for
+the Corstone-1000 FVP
+
+Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/29242]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../target/arm/corstone1000/CMakeLists.txt    |  6 +++
+ .../corstone1000/Device/Config/device_cfg.h   |  6 +++
+ .../arm/corstone1000/tfm_hal_multi_core.c     | 38 ++++++++++++++++++-
+ 3 files changed, 48 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index e2a7ac302..a269251aa 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -374,6 +374,12 @@ target_sources(tfm_psa_rot_partition_ns_agent_mailb=
ox
+         tfm_hal_multi_core.c
+ )
+=20
++if (PLATFORM_IS_FVP)
++target_compile_definitions(tfm_psa_rot_partition_ns_agent_mailbox
++    PUBLIC
++    	$<$<BOOL:${ENABLE_MULTICORE}>:CORSTONE1000_FVP_MULTICORE>
++)
++endif()
+ #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D tfm_spm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
+=20
+ target_sources(tfm_spm
+diff --git a/platform/ext/target/arm/corstone1000/Device/Config/device_c=
fg.h b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
+index 222905d3d..9d48f119e 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
++++ b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
+@@ -45,5 +45,11 @@
+ /* CFI Controller */
+ #define CFI_S
+=20
++/* Total number of host cores */
++#if CORSTONE1000_FVP_MULTICORE
++#define PLATFORM_HOST_MAX_CORE_COUNT 4
++#else
++#define PLATFORM_HOST_MAX_CORE_COUNT 1
++#endif
+=20
+ #endif  /* __DEVICE_CFG_H__ */
+diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+index f0e2bc333..ce72e50c9 100644
+--- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
++++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
+@@ -11,9 +11,14 @@
+ #include "tfm_hal_multi_core.h"
+ #include "fwu_agent.h"
+=20
+-#define HOST_SYS_RST_CTRL_OFFSET 0x0
++#define HOST_SYS_RST_CTRL_OFFSET     0x000
++#define HOST_CPU_PE0_CONFIG_OFFSET   0x010
++#define HOST_CPU_PE1_CONFIG_OFFSET   0x020
++#define HOST_CPU_PE2_CONFIG_OFFSET   0x030
++#define HOST_CPU_PE3_CONFIG_OFFSET   0x040
++#define HOST_CPU_BOOT_MASK_OFFSET    0x300
+ #define HOST_CPU_CORE0_WAKEUP_OFFSET 0x308
+-#define HOST_CPU_PE0_CONFIG_OFFSET 0x010
++
+ #define AA64nAA32_MASK (1 << 3)
+=20
+ #ifdef EXTERNAL_SYSTEM_SUPPORT
+@@ -53,9 +58,29 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     volatile uint32_t *PE0_CONFIG =3D
+                         (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
+                                      + HOST_CPU_PE0_CONFIG_OFFSET);
++#if CORSTONE1000_FVP_MULTICORE
++    volatile uint32_t *PE1_CONFIG =3D
++                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
++                                     + HOST_CPU_PE1_CONFIG_OFFSET);
++    volatile uint32_t *PE2_CONFIG =3D
++                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
++                                     + HOST_CPU_PE2_CONFIG_OFFSET);
++    volatile uint32_t *PE3_CONFIG =3D
++                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
++                                     + HOST_CPU_PE3_CONFIG_OFFSET);
++    volatile uint32_t *CPU_BOOT_MASK =3D
++                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
++		                     + HOST_CPU_BOOT_MASK_OFFSET);
+=20
++    *CPU_BOOT_MASK =3D 0xf;
++#endif
+     /* Select host CPU architecture as AArch64 */
+     *PE0_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
++#if CORSTONE1000_FVP_MULTICORE
++    *PE1_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
++    *PE2_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
++    *PE3_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
++#endif
+=20
+     /* wakeup CORE0 before bringing it out of reset */
+     *reset_ctl_wakeup_reg =3D 0x1;
+@@ -63,6 +88,15 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
+     /* Clear HOST_SYS_RST_CTRL register to bring host out of RESET */
+     *reset_ctl_reg =3D 0;
+=20
++#if CORSTONE1000_FVP_MULTICORE
++    /* Wake up secondary cores.
++     * This should be done after bringing the primary core out of reset=
. */
++    for(int core_index=3D1; core_index < PLATFORM_HOST_MAX_CORE_COUNT; =
core_index++)
++    {
++	    *reset_ctl_wakeup_reg =3D (0x1 << core_index);
++    }
++#endif
++
+     (void) start_addr;
+=20
+ #ifdef EXTERNAL_SYSTEM_SUPPORT
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index dcba79ef..b362461e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -29,6 +29,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0010-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
     file://0011-Platform-corstone1000-Increase-buffers-for-EFI-vars.patc=
h \
     file://0012-corstone1000-Remove-reset-after-capsule-update.patch \
+    file://0013-platform-CS1000-Add-multicore-support-for-FVP.patch \
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


