Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F117C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 10:05:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42914.1712916339508374448
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 03:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 793BA1596;
	Fri, 12 Apr 2024 03:06:08 -0700 (PDT)
Received: from e126835.arm.com (unknown [10.57.83.142])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 728D23F64C;
	Fri, 12 Apr 2024 03:05:38 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-m: corstone1000: Enable host firewall in FVP
Date: Fri, 12 Apr 2024 11:05:27 +0100
Message-Id: <20240412100527.991610-4-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412100527.991610-1-emekcan.aras@arm.com>
References: <20240412100527.991610-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Apr 2024 10:05:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5538

From: Emekcan Aras <emekcan.aras@arm.com>

Enables host firewall and mpu setup for FVP. It also fixes secure-ram
configuration and disable access rights to secure ram from both normal wo=
rld
for both mps3 and fvp.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...tone1000-Enable-host-firewall-in-FVP.patch | 177 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-Cor=
stone1000-Enable-host-firewall-in-FVP.patch
new file mode 100644
index 00000000..4f15da22
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch
@@ -0,0 +1,177 @@
+From 1410dc5504d60219279581b1cf6442f81551cfe7 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <Emekcan.Aras@arm.com>
+Date: Wed, 3 Apr 2024 13:37:40 +0100
+Subject: [PATCH] Platform: Corstone1000: Enable host firewall in FVP
+
+Enables host firewall and mpu setup for FVP. It also fixes secure-ram
+configuration and disable access rights to secure ram from both normal w=
orld
+for both mps3 and fvp.
+
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ .../Device/Include/platform_base_address.h    |  2 +-
+ .../arm/corstone1000/bl1/boot_hal_bl1_1.c     | 42 ++++---------------
+ .../arm/corstone1000/bl2/flash_map_bl2.c      |  2 +-
+ 3 files changed, 11 insertions(+), 35 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
+index 416f0ebcd..101cad9e7 100644
+--- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
++++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
+@@ -67,7 +67,7 @@
+  * required by the SE are defined here */
+ #define CORSTONE1000_HOST_ADDRESS_SPACE_BASE       (0x60000000U) /* Hos=
t Address Space                */
+ #define CORSTONE1000_HOST_BIR_BASE                 (0x60000000U) /* Boo=
t Instruction Register         */
+-#define CORSTONE1000_HOST_SHARED_RAM_BASE          (0x62000000U) /* Sha=
red RAM                        */
++#define CORSTONE1000_HOST_TRUSTED_RAM_BASE         (0x62000000U) /* Sec=
ure RAM                        */
+ #define CORSTONE1000_HOST_XNVM_BASE                (0x68000000U) /* XNV=
M                              */
+ #define CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE (0x7A010000U) /* Hos=
t SCB                          */
+ #define CORSTONE1000_EXT_SYS_RESET_REG             (0x7A010310U) /* ext=
ernal system (cortex-M3)       */
+diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c b=
/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
+index a5fee66af..7988c2392 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
++++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
+@@ -35,7 +35,7 @@ REGION_DECLARE(Image$$, ER_DATA, $$Base)[];
+ REGION_DECLARE(Image$$, ARM_LIB_HEAP, $$ZI$$Limit)[];
+=20
+ #define HOST_ADDRESS_SPACE_BASE         0x00000000
+-#define HOST_SHARED_RAM_BASE            0x02000000
++#define HOST_TRUSTED_RAM_BASE           0x02000000
+ #define HOST_XNVM_BASE                  0x08000000
+ #define HOST_BASE_SYSTEM_CONTROL_BASE   0x1A010000
+ #define HOST_FIREWALL_BASE              0x1A800000
+@@ -347,7 +347,7 @@ static void setup_host_firewall(void)
+=20
+     fc_pe_enable();
+=20
+-    /* CVM - Shared RAM */
++    /* CVM - Secure RAM */
+     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_CVM);
+     fc_disable_bypass();
+     fc_pe_disable();
+@@ -355,15 +355,12 @@ static void setup_host_firewall(void)
+     fc_select_region(1);
+     fc_disable_regions();
+     fc_disable_mpe(RGN_MPE0);
+-    fc_prog_rgn(RGN_SIZE_4MB, HOST_SHARED_RAM_BASE);
++    fc_prog_rgn(RGN_SIZE_4MB, HOST_TRUSTED_RAM_BASE);
+     fc_init_mpl(RGN_MPE0);
+=20
+     mpl_rights =3D (RGN_MPL_ANY_MST_MASK | RGN_MPL_SECURE_READ_MASK |
+                                          RGN_MPL_SECURE_WRITE_MASK |
+-                                         RGN_MPL_SECURE_EXECUTE_MASK |
+-                                         RGN_MPL_NONSECURE_READ_MASK |
+-                                         RGN_MPL_NONSECURE_WRITE_MASK |
+-                                         RGN_MPL_NONSECURE_EXECUTE_MASK=
);
++                                         RGN_MPL_SECURE_EXECUTE_MASK);
+=20
+     fc_enable_mpl(RGN_MPE0, mpl_rights);
+     fc_disable_mpl(RGN_MPE0, ~mpl_rights);
+@@ -398,7 +395,9 @@ static void setup_host_firewall(void)
+=20
+     fc_pe_enable();
+=20
+-    /* Host Expansion Master 0 */
++#if !(PLATFORM_IS_FVP)
++    /* Host Expansion Master 0 (Due to the difference in the models onl=
y
++     * programming this for MPS3) */
+     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_EXPMST0);
+     fc_disable_bypass();
+     fc_pe_disable();
+@@ -433,7 +432,6 @@ static void setup_host_firewall(void)
+     fc_enable_regions();
+     fc_rgn_lock();
+=20
+-#if !(PLATFORM_IS_FVP)
+     fc_select_region(3);
+     fc_disable_regions();
+     fc_disable_mpe(RGN_MPE0);
+@@ -461,16 +459,14 @@ static void setup_host_firewall(void)
+     fc_enable_mpe(RGN_MPE0);
+     fc_enable_regions();
+     fc_rgn_lock();
+-#endif
+=20
+     fc_pe_enable();
+=20
+-    /* Host Expansion Master 0 */
++    /* Host Expansion Master 1*/
+     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_EXPMST1);
+     fc_disable_bypass();
+     fc_pe_disable();
+=20
+-#if !(PLATFORM_IS_FVP)
+     fc_select_region(1);
+     fc_disable_regions();
+     fc_disable_mpe(RGN_MPE0);
+@@ -484,22 +480,6 @@ static void setup_host_firewall(void)
+     fc_enable_mpe(RGN_MPE0);
+     fc_enable_regions();
+     fc_rgn_lock();
+-#else
+-    fc_select_region(1);
+-    fc_disable_regions();
+-    fc_disable_mpe(RGN_MPE0);
+-    fc_prog_rgn(RGN_SIZE_8MB, HOST_SE_SECURE_FLASH_BASE_FVP);
+-    fc_init_mpl(RGN_MPE0);
+-
+-    mpl_rights =3D (RGN_MPL_ANY_MST_MASK | RGN_MPL_SECURE_READ_MASK |
+-                                         RGN_MPL_SECURE_WRITE_MASK);
+-
+-    fc_enable_mpl(RGN_MPE0, mpl_rights);
+-    fc_enable_mpe(RGN_MPE0);
+-    fc_enable_regions();
+-    fc_rgn_lock();
+-#endif
+-
+     fc_pe_enable();
+=20
+     /* Always ON Host Peripherals */
+@@ -527,7 +507,6 @@ static void setup_host_firewall(void)
+     }
+=20
+     fc_pe_enable();
+-
+     /* Host System Peripherals */
+     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_SYSPERIPH);
+     fc_disable_bypass();
+@@ -553,6 +532,7 @@ static void setup_host_firewall(void)
+     }
+=20
+     fc_pe_enable();
++#endif
+=20
+     /* Host System Peripherals */
+     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_DBGPERIPH);
+@@ -592,13 +572,9 @@ int32_t boot_platform_init(void)
+     if (result !=3D ARM_DRIVER_OK) {
+ 	return 1;
+      }
+-#if !(PLATFORM_IS_FVP)
+         setup_mpu();
+-#endif
+         setup_se_firewall();
+-#if !(PLATFORM_IS_FVP)
+         setup_host_firewall();
+-#endif
+=20
+ #if defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1=
_2)
+     stdio_init();
+diff --git a/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c b/=
platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
+index 2b1cdfa19..06cc3f0f5 100644
+--- a/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
++++ b/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
+@@ -70,7 +70,7 @@ int boot_get_image_exec_ram_info(uint32_t image_id,
+         rc =3D 0;
+     }
+     else if (image_id =3D=3D 1 || image_id =3D=3D 2) {
+-        (*exec_ram_start) =3D CORSTONE1000_HOST_SHARED_RAM_BASE;
++        (*exec_ram_start) =3D CORSTONE1000_HOST_TRUSTED_RAM_BASE;
+         (*exec_ram_size) =3D 0x20000000U;
+         rc =3D 0;
+     }
+--=20
+2.25.1
+
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index e098da72..72aea36f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -40,6 +40,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0005-platform-corstone1000-fix-synchronization-issue-on-o.pat=
ch \
     file://0006-Platform-Corstone1000-skip-the-first-nv-counter.patch \
     file://0007-platform-corstone1000-add-unique-guid-for-mps3.patch \  =
 =20
+    file://0008-Platform-Corstone1000-Enable-host-firewall-in-FVP.patch =
\
     "
=20
 # TF-M ships patches for external dependencies that needs to be applied
--=20
2.25.1


