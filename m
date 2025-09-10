Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22B7CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 12:51:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16971.1757508702463859507
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 05:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C94FE16F8;
	Wed, 10 Sep 2025 05:51:33 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957D13F63F;
	Wed, 10 Sep 2025 05:51:40 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 3/3] arm-bsp: corstone1000: Upgrade Trusted-Firmware-M v2.2.1
Date: Wed, 10 Sep 2025 13:51:12 +0100
Message-Id: <20250910125112.75362-4-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
References: <20250910125112.75362-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 12:51:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6698

The move to Trusted-Firmware-M v2.2.1 makes the BL1 code larger,
while the provisioning bundle can be trimmed.  At the same time BL2 and
TF-M binary addresses now need to begin on a 0x100-byte boundary for
Cortex-M0+ based platforms.

Key changes
--------------------------------
- Upgrade Trusted-Firmware-M v2.2.1 for Corstone-1000
- New crypto driver supports ECC instead of RSA.
- Rebase patches
- Add new patches to address the following changes for v2.2.1
   - Increase `BL1_1_CODE_SIZE` to 58KB to accommodate the v2.2.1 binarie=
s.
   - Reduce `PROVISIONING_DATA_SIZE` to 6KB.
   - `BL2_CODE_START` and `S_CODE_START` are aligned to 0x100 byte bounda=
ry
      so both start addresses are an exact multiple of 0x100.
   - Adapt ADAC enabled build to the new BL2 build restructure.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../conf/machine/include/corstone1000.inc     |   2 +-
 .../corstone1000-flash-firmware-image.bb      |   2 +-
 ...form-CS1000-Remove-unused-BL1-files.patch} |  21 +-
 ...-Corstone1000-Enable-firewall-in-FVP.patch | 177 -------
 ...m-CS1000-Increase-ITS-max-asset-size.patch |  41 --
 ...e1000-Fix-BL1-compiler-switch-and-re.patch |  46 ++
 ...f-cc312-differences-between-fvp-and.patch} |   8 +-
 ...S1000-Increase-RSE_COMMS-buffer-size.patch |  38 --
 ...CS1000-Increase-buffers-for-EFI-vars.patch |  42 --
 ...m-Corstone1000-Enable-FWU-partition.patch} |  16 +-
 ...m-CS1000-Increase-flash-PS-area-size.patch |  37 --
 ...1000-Implement-Bootloader-Abstracti.patch} | 455 ++++++++++--------
 ...-Corstone1000-Increase-buffer-sizes.patch} |  27 +-
 ...CS1000-Add-multicore-support-for-FVP.patch | 119 -----
 ...007-Platform-CS1000-Fix-Bank-offsets.patch |  36 --
 ...1000-Remove-duplicate-configuration.patch} |  22 +-
 ...m-CS1000-Increase-BL2-partition-size.patch | 111 -----
 ...e1000-Increase-BL1-size-and-align-bi.patch |  93 ++++
 ...-Add-PSA_WANT_ALG_SHA_256-definition.patch |  42 --
 ...apt-ADAC-enabled-build-to-the-new-BL.patch |  45 ++
 ...m-CS1000-Add-crypto-configs-for-ADAC.patch |  41 --
 ...orm-CS1000-Fix-platform-name-in-logs.patch |  27 --
 ...rm-CS1000-Fix-compiler-switch-in-BL1.patch | 193 --------
 ...one1000-Allow-FWU-calls-in-RSE-COMMS.patch |  60 ---
 ...m-specific-TFM_FWU_BOOTLOADER_LIB-se.patch |  73 ---
 .../trusted-firmware-m-corstone1000.inc       |  36 +-
 26 files changed, 504 insertions(+), 1306 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-Platform-CS1000-Remove-unused-BL1-files.patch =3D> 0001-Platform-CS10=
00-Remove-unused-BL1-files.patch} (97%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0001-Platform-Corstone1000-Enable-firewall-in-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-CS1000-Increase-ITS-max-asset-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
014-CC312-alignment-of-cc312-differences.patch =3D> 0003-CC312-alignment-=
of-cc312-differences-between-fvp-and.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0003-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0004-Platform-CS1000-Increase-buffers-for-EFI-vars.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
017-Platform-CS1000-Enable-FWU-partition.patch =3D> 0004-Platform-Corston=
e1000-Enable-FWU-partition.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0005-Platform-CS1000-Increase-flash-PS-area-size.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch =3D> 0005-=
Platform-Corstone1000-Implement-Bootloader-Abstracti.patch} (93%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
019-Platform-Corstone1000-Increase-buffer-sizes.patch =3D> 0006-Platform-=
Corstone1000-Increase-buffer-sizes.patch} (64%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0006-platform-CS1000-Add-multicore-support-for-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0007-Platform-CS1000-Fix-Bank-offsets.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch =3D> =
0007-Platform-Corstone1000-Remove-duplicate-configuration.patch} (60%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-CS1000-Increase-BL2-partition-size.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-Platform-CS1000-Fix-platform-name-in-logs.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 83253246..6027b633 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -3,7 +3,7 @@ require conf/machine/include/arm/armv8a/tune-cortexa35.in=
c
 MACHINEOVERRIDES =3D. "corstone1000:"
=20
 # TF-M
-PREFERRED_VERSION_trusted-firmware-m ?=3D "2.1.%"
+PREFERRED_VERSION_trusted-firmware-m ?=3D "2.2.1"
=20
 # TF-A
 TFA_PLATFORM =3D "corstone1000"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index 2b9a180d..a452445e 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -162,7 +162,7 @@ TFA_BL2_RE_SIGN_BIN_SIZE =3D "0x2d000"
 TFA_FIP_RE_IMAGE_LOAD_ADDRESS =3D "0x68130000"
 TFA_FIP_RE_SIGN_BIN_SIZE =3D "0x00200000"
 RE_LAYOUT_WRAPPER_VERSION =3D "0.0.7"
-TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
+TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-EC-P256_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
=20
 do_sign_images() {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-Platform-CS1000-Remove-unused-BL1-files.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-CS1000-Remove=
-unused-BL1-files.patch
similarity index 97%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0012-Platform-CS1000-Remove-unused-BL1-files.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0001-Platform-CS1000-Remove-unused-BL1-files.patch
index b2bf1293..91b1ff6e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-Platform-CS1000-Remove-unused-BL1-files.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-CS1000-Remove-unused-BL1-files.patch
@@ -1,10 +1,11 @@
-From 67e5aa83efce5f75df1c5d027e2d52f0da2eaba0 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Thu, 5 Sep 2024 17:21:50 +0200
-Subject: [PATCH 1/5] Platform: CS1000: Remove unused BL1 files
+From 778d62d8ebe91212363cdab2fa1eef6a977ae6e2 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 13 Aug 2025 14:02:57 +0000
+Subject: [PATCH 1/7] Platform: CS1000: Remove unused BL1 files
=20
 These files are not referenced anywhere so removed them to prevent
 confusion.
+
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
 Upstream-Status: Backport [9a7bdf9ef595196e1e518a27d3c79079aedb5bda]
 ---
@@ -16,7 +17,7 @@ Upstream-Status: Backport [9a7bdf9ef595196e1e518a27d3c7=
9079aedb5bda]
=20
 diff --git a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt b/p=
latform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
 deleted file mode 100644
-index 5e140eecf6..0000000000
+index d85b0611d..000000000
 --- a/platform/ext/target/arm/corstone1000/bl1/CMakeLists.txt
 +++ /dev/null
 @@ -1,345 +0,0 @@
@@ -53,14 +54,14 @@ index 5e140eecf6..0000000000
 -
 -add_convert_to_bin_target(bl1)
 -
--# bl2_mbedcrypto reused as it is, but it pulls the MCUBOOT_IMAGE_NUMBER=
=3D${MCUBOOT_IMAGE_NUMBER}
+-# bl2_crypto reused as it is, but it pulls the MCUBOOT_IMAGE_NUMBER=3D$=
{MCUBOOT_IMAGE_NUMBER}
 -# configuration, where image number is 3. (Coming from BL2 build). To n=
ot to collide with BL1's
 -# build where image number is 1 mbedcrypto library is separated from th=
e build of other source
 -# files.
 -target_link_libraries(bl1
 -    PRIVATE
 -        bl1_main
--        bl2_mbedcrypto
+-        bl2_crypto
 -        cmsis_stack_override
 -        cmsis
 -)
@@ -159,7 +160,7 @@ index 5e140eecf6..0000000000
 -target_link_libraries(bl1_main
 -    PRIVATE
 -        mcuboot_config
--        bl2_mbedcrypto_config
+-        bl2_crypto_config
 -)
 -
 -target_include_directories(bl1_main
@@ -367,7 +368,7 @@ index 5e140eecf6..0000000000
 -)
 diff --git a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c=
 b/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
 deleted file mode 100644
-index 32c1481cca..0000000000
+index 32c1481cc..000000000
 --- a/platform/ext/target/arm/corstone1000/bl1/bl1_security_cnt.c
 +++ /dev/null
 @@ -1,75 +0,0 @@
@@ -447,5 +448,5 @@ index 32c1481cca..0000000000
 -    return 0;
 -}
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-Platform-Corstone1000-Enable-firewall-in-FVP.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-Platform-Corstone=
1000-Enable-firewall-in-FVP.patch
deleted file mode 100644
index 17aad5ab..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-Platform-Corstone1000-Enable-firewall-in-FVP.patch
+++ /dev/null
@@ -1,177 +0,0 @@
-From 4b5a9546205e484ac7f53cee369b1db9a7bf2279 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <Emekcan.Aras@arm.com>
-Date: Wed, 3 Apr 2024 13:37:40 +0100
-Subject: [PATCH 3/9] Platform: Corstone1000: Enable firewall in FVP
-
-Enables host firewall and MPU setup for FVP. It also fixes secure RAM
-configuration and disables access rights to secure RAM from normal world
-for both MPS3 and FVP.
-
-Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [4b5a9546205e484ac7f53cee369b1db9a7bf2279]
----
- .../Device/Include/platform_base_address.h    |  2 +-
- .../arm/corstone1000/bl1/boot_hal_bl1_1.c     | 42 ++++---------------
- .../arm/corstone1000/bl2/flash_map_bl2.c      |  2 +-
- 3 files changed, 11 insertions(+), 35 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
-index 416f0ebcdb..101cad9e7c 100644
---- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
-+++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
-@@ -67,7 +67,7 @@
-  * required by the SE are defined here */
- #define CORSTONE1000_HOST_ADDRESS_SPACE_BASE       (0x60000000U) /* Hos=
t Address Space                */
- #define CORSTONE1000_HOST_BIR_BASE                 (0x60000000U) /* Boo=
t Instruction Register         */
--#define CORSTONE1000_HOST_SHARED_RAM_BASE          (0x62000000U) /* Sha=
red RAM                        */
-+#define CORSTONE1000_HOST_TRUSTED_RAM_BASE         (0x62000000U) /* Sec=
ure RAM                        */
- #define CORSTONE1000_HOST_XNVM_BASE                (0x68000000U) /* XNV=
M                              */
- #define CORSTONE1000_HOST_BASE_SYSTEM_CONTROL_BASE (0x7A010000U) /* Hos=
t SCB                          */
- #define CORSTONE1000_EXT_SYS_RESET_REG             (0x7A010310U) /* ext=
ernal system (cortex-M3)       */
-diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c b=
/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
-index 45d6768215..2f693d2b1b 100644
---- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
-+++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
-@@ -35,7 +35,7 @@ REGION_DECLARE(Image$$, ER_DATA, $$Base)[];
- REGION_DECLARE(Image$$, ARM_LIB_HEAP, $$ZI$$Limit)[];
-=20
- #define HOST_ADDRESS_SPACE_BASE         0x00000000
--#define HOST_SHARED_RAM_BASE            0x02000000
-+#define HOST_TRUSTED_RAM_BASE           0x02000000
- #define HOST_XNVM_BASE                  0x08000000
- #define HOST_BASE_SYSTEM_CONTROL_BASE   0x1A010000
- #define HOST_FIREWALL_BASE              0x1A800000
-@@ -347,7 +347,7 @@ static void setup_host_firewall(void)
-=20
-     fc_pe_enable();
-=20
--    /* CVM - Shared RAM */
-+    /* CVM - Secure RAM */
-     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_CVM);
-     fc_disable_bypass();
-     fc_pe_disable();
-@@ -355,15 +355,12 @@ static void setup_host_firewall(void)
-     fc_select_region(1);
-     fc_disable_regions();
-     fc_disable_mpe(RGN_MPE0);
--    fc_prog_rgn(RGN_SIZE_4MB, HOST_SHARED_RAM_BASE);
-+    fc_prog_rgn(RGN_SIZE_4MB, HOST_TRUSTED_RAM_BASE);
-     fc_init_mpl(RGN_MPE0);
-=20
-     mpl_rights =3D (RGN_MPL_ANY_MST_MASK | RGN_MPL_SECURE_READ_MASK |
-                                          RGN_MPL_SECURE_WRITE_MASK |
--                                         RGN_MPL_SECURE_EXECUTE_MASK |
--                                         RGN_MPL_NONSECURE_READ_MASK |
--                                         RGN_MPL_NONSECURE_WRITE_MASK |
--                                         RGN_MPL_NONSECURE_EXECUTE_MASK=
);
-+                                         RGN_MPL_SECURE_EXECUTE_MASK);
-=20
-     fc_enable_mpl(RGN_MPE0, mpl_rights);
-     fc_disable_mpl(RGN_MPE0, ~mpl_rights);
-@@ -398,7 +395,9 @@ static void setup_host_firewall(void)
-=20
-     fc_pe_enable();
-=20
--    /* Host Expansion Master 0 */
-+#if !(PLATFORM_IS_FVP)
-+    /* Host Expansion Master 0 (Due to the difference in the models onl=
y
-+     * programming this for MPS3) */
-     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_EXPMST0);
-     fc_disable_bypass();
-     fc_pe_disable();
-@@ -433,7 +432,6 @@ static void setup_host_firewall(void)
-     fc_enable_regions();
-     fc_rgn_lock();
-=20
--#if !(PLATFORM_IS_FVP)
-     fc_select_region(3);
-     fc_disable_regions();
-     fc_disable_mpe(RGN_MPE0);
-@@ -461,16 +459,14 @@ static void setup_host_firewall(void)
-     fc_enable_mpe(RGN_MPE0);
-     fc_enable_regions();
-     fc_rgn_lock();
--#endif
-=20
-     fc_pe_enable();
-=20
--    /* Host Expansion Master 0 */
-+    /* Host Expansion Master 1*/
-     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_EXPMST1);
-     fc_disable_bypass();
-     fc_pe_disable();
-=20
--#if !(PLATFORM_IS_FVP)
-     fc_select_region(1);
-     fc_disable_regions();
-     fc_disable_mpe(RGN_MPE0);
-@@ -484,22 +480,6 @@ static void setup_host_firewall(void)
-     fc_enable_mpe(RGN_MPE0);
-     fc_enable_regions();
-     fc_rgn_lock();
--#else
--    fc_select_region(1);
--    fc_disable_regions();
--    fc_disable_mpe(RGN_MPE0);
--    fc_prog_rgn(RGN_SIZE_8MB, HOST_SE_SECURE_FLASH_BASE_FVP);
--    fc_init_mpl(RGN_MPE0);
--
--    mpl_rights =3D (RGN_MPL_ANY_MST_MASK | RGN_MPL_SECURE_READ_MASK |
--                                         RGN_MPL_SECURE_WRITE_MASK);
--
--    fc_enable_mpl(RGN_MPE0, mpl_rights);
--    fc_enable_mpe(RGN_MPE0);
--    fc_enable_regions();
--    fc_rgn_lock();
--#endif
--
-     fc_pe_enable();
-=20
-     /* Always ON Host Peripherals */
-@@ -527,7 +507,6 @@ static void setup_host_firewall(void)
-     }
-=20
-     fc_pe_enable();
--
-     /* Host System Peripherals */
-     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_SYSPERIPH);
-     fc_disable_bypass();
-@@ -553,6 +532,7 @@ static void setup_host_firewall(void)
-     }
-=20
-     fc_pe_enable();
-+#endif
-=20
-     /* Host System Peripherals */
-     fc_select((void *)CORSTONE1000_HOST_FIREWALL_BASE, COMP_DBGPERIPH);
-@@ -592,13 +572,9 @@ int32_t boot_platform_init(void)
-     if (result !=3D ARM_DRIVER_OK) {
- 	return 1;
-      }
--#if !(PLATFORM_IS_FVP)
-         setup_mpu();
--#endif
-         setup_se_firewall();
--#if !(PLATFORM_IS_FVP)
-         setup_host_firewall();
--#endif
-=20
- #if defined(TFM_BL1_LOGGING) || defined(TEST_BL1_1) || defined(TEST_BL1=
_2)
-     stdio_init();
-diff --git a/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c b/=
platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
-index 2b1cdfa199..06cc3f0f52 100644
---- a/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
-+++ b/platform/ext/target/arm/corstone1000/bl2/flash_map_bl2.c
-@@ -70,7 +70,7 @@ int boot_get_image_exec_ram_info(uint32_t image_id,
-         rc =3D 0;
-     }
-     else if (image_id =3D=3D 1 || image_id =3D=3D 2) {
--        (*exec_ram_start) =3D CORSTONE1000_HOST_SHARED_RAM_BASE;
-+        (*exec_ram_start) =3D CORSTONE1000_HOST_TRUSTED_RAM_BASE;
-         (*exec_ram_size) =3D 0x20000000U;
-         rc =3D 0;
-     }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-CS1000-Increase-ITS-max-asset-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-CS1000-In=
crease-ITS-max-asset-size.patch
deleted file mode 100644
index 21450654..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-CS1000-Increase-ITS-max-asset-size.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 2a7e418afc96a9c897d3511fd47dbe596f880074 Mon Sep 17 00:00:00 2001
-From: Emekcan Aras <emekcan.aras@arm.com>
-Date: Wed, 17 Apr 2024 11:34:45 +0000
-Subject: [PATCH 4/9] Platform: CS1000: Increase ITS max asset size
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Increases the max asset size for ITS to enable Parsec services and
-tests.
-=E2=80=8B
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Vikas Katariya <vikas.katariya@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [2a7e418afc96a9c897d3511fd47dbe596f880074]
----
- platform/ext/target/arm/corstone1000/config_tfm_target.h | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index 2c7341afd..9522379cd 100644
---- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
-+++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -20,4 +20,7 @@
- /* The maximum number of assets to be stored in the Protected Storage a=
rea. */
- #define PS_NUM_ASSETS        20
-=20
-+/* The maximum size of asset to be stored in the Internal Trusted Stora=
ge area. */
-+#define ITS_MAX_ASSET_SIZE   2048
-+
- #endif /* __CONFIG_TFM_TARGET_H__ */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Platform-=
Corstone1000-Fix-BL1-compiler-switch-and-re.patch
new file mode 100644
index 00000000..4753b067
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.patch
@@ -0,0 +1,46 @@
+From 162d46ac77be0ad3e7cf1840fa05578cce084a68 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Wed, 13 Aug 2025 14:31:53 +0000
+Subject: [PATCH 2/7] Platform: Corstone1000: Fix BL1 compiler switch and
+ regression test failure
+
+Introduce a dedicated preprocessor definition (`BL1_BUILD`) added only t=
o the
+platform_bl1_1 target. This ensures that #if BL1 checks are evaluated co=
rrectly
+based on the actual build configuration.
+
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Backport [f25649cc0de56f360069c6128670f7533ba5e14d]
+---
+ platform/ext/target/arm/corstone1000/CMakeLists.txt | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 4d165ed9c..3573c8492 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -146,6 +146,7 @@ target_sources(platform_s
+         rse_comms_permissions_hal.c
+         mem_check_v6m_v7m_hal.c
+         ${PLATFORM_DIR}/ext/common/mem_check_v6m_v7m.c
++        platform.c
+ )
+=20
+ if (PLATFORM_IS_FVP)
+@@ -215,6 +216,13 @@ target_compile_definitions(platform_bl1_1
+         $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING}>:CRYPTO_HW_A=
CCELERATOR_OTP_PROVISIONING>
+         MBEDTLS_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/mbedcrypto/m=
bedcrypto_config/tfm_mbedcrypto_config_default.h"
+         MBEDTLS_PSA_CRYPTO_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/m=
bedcrypto/mbedcrypto_config/crypto_config_default.h"
++
++        # This definition is only added to the bl1_main target. There a=
re
++        # files that are shared between the BL1 and TFM_S targets. This=
 flag
++        # can be used if the BL1 target needs different implementation =
than
++        # the TFM_S target.
++        BL1_BUILD
++
+ )
+=20
+ target_include_directories(platform_bl1_1_interface
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-CC312-alignment-of-cc312-differences.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0003-CC312-alignment-of-cc312-=
differences-between-fvp-and.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0014-CC312-alignment-of-cc312-differences.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0003-CC312-alignment-of-cc312-differences-between-fvp-and.patch
index 45d7049c..37f762d6 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-CC312-alignment-of-cc312-differences.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
@@ -1,7 +1,7 @@
-From 60ab8bbf85e9e84afd23948a71cf84c69f4aad7a Mon Sep 17 00:00:00 2001
+From bfc977a43ea6b328136599a7558c3706739579b6 Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Wed, 15 May 2024 12:12:15 +0000
-Subject: [PATCH 07/10] CC312: alignment of cc312 differences between fvp=
 and
+Subject: [PATCH 3/7] CC312: alignment of cc312 differences between fvp a=
nd
  mps3 corstone1000 platforms
=20
 Configures CC312 mps3 model same as predefined cc312 FVP
@@ -15,7 +15,7 @@ Upstream-Status: Inappropriate [Requires an aligment cc=
3xx with mps3 hw and fvp
  1 file changed, 3 insertions(+)
=20
 diff --git a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c b=
/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
-index 31e4332bed..4b08c02526 100644
+index 31e4332be..4b08c0252 100644
 --- a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
 +++ b/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
 @@ -207,6 +207,9 @@ CClibRetCode_t CC_LibInit(CCRndContext_t *rndContext=
_ptr, CCRndWorkBuff_t  *rndW
@@ -29,5 +29,5 @@ index 31e4332bed..4b08c02526 100644
      reg =3D CC_HAL_READ_REGISTER(CC_REG_OFFSET(HOST_RGF, HOST_AO_LOCK_B=
ITS));
      CC_REG_FLD_SET(0, HOST_AO_LOCK_BITS, HOST_FORCE_DFA_ENABLE, reg, 0x=
0);
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-Platform-CS1000=
-Increase-RSE_COMMS-buffer-size.patch
deleted file mode 100644
index 059b5a2d..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 85e7e9f52177c9617b8554fbacac34c8c591f549 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Fri, 5 Jul 2024 21:18:08 +0200
-Subject: [PATCH 5/9] Platform: CS1000: Increase RSE_COMMS buffer size
-
-This was needed because the UEFI variable index size was increased in
-the Host side software stack. The RSE_COMMS buffer has to be increased
-to accomodate the bigger messages.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [85e7e9f52177c9617b8554fbacac34c8c591f549]
----
- .../ext/target/arm/corstone1000/rse_comms/rse_comms.h    | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h =
b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-index 41e5c2bc3..720a60b62 100644
---- a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-+++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms.h
-@@ -15,8 +15,13 @@
- extern "C" {
- #endif
-=20
--/* size suits to fit the largest message too (EFI variables) */
--#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x2100)
-+/*
-+ * The size suits to fit the largest message too (EFI variables)
-+ * This size is defined by the Host's software stack.
-+ * The size was chosen by monitoring the messages that are coming
-+ * from the Trusted Services SE Proxy partition.
-+ */
-+#define RSE_COMMS_PAYLOAD_MAX_SIZE (0x43C0)
-=20
- /*
-  * Allocated for each client request.
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Platform-CS1000-Increase-buffers-for-EFI-vars.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-CS1000-=
Increase-buffers-for-EFI-vars.patch
deleted file mode 100644
index 62022183..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-CS1000-Increase-buffers-for-EFI-vars.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 8ca9620a000ba182ebb51c51f49e2b97622f3404 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 15 May 2024 22:37:51 +0200
-Subject: [PATCH 6/9] Platform: CS1000: Increase buffers for EFI vars
-
-The UEFI variables are stored in the Protected Storage. The size of
-the variables metadata have been increased in the Host software stack
-so the related buffer sizes have to be increased:
-
-- The PS_MAX_ASSET_SIZE needs to be big enough to store the variables.
-- The CRYPTO_ENGINE_BUF_SIZE needs to be increased because the encryptio=
n
-  of the bigger PS assets requires bigger buffer.
-- The CRYPTO_IOVEC_BUFFER_SIZE needs to be increased because the PS
-  assets are passed through the IOVEC buffer between the crypto and
-  PS partition during encryption.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [8ca9620a000ba182ebb51c51f49e2b97622f3404]
----
- platform/ext/target/arm/corstone1000/config_tfm_target.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index 9522379cd..0b410dfd4 100644
---- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
-+++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -23,4 +23,12 @@
- /* The maximum size of asset to be stored in the Internal Trusted Stora=
ge area. */
- #define ITS_MAX_ASSET_SIZE   2048
-=20
-+/* The maximum asset size to be stored in the Protected Storage */
-+#define PS_MAX_ASSET_SIZE   2592
-+
-+/* This is needed to be able to process the EFI variables during PS wri=
tes. */
-+#define CRYPTO_ENGINE_BUF_SIZE 0x5000
-+
-+/* This is also has to be increased to fit the EFI variables into the i=
ovecs. */
-+#define CRYPTO_IOVEC_BUFFER_SIZE    6000
- #endif /* __CONFIG_TFM_TARGET_H__ */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-Platform-CS1000-Enable-FWU-partition.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0004-Platform-Corstone1000-Ena=
ble-FWU-partition.patch
similarity index 80%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0017-Platform-CS1000-Enable-FWU-partition.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0004-Platform-Corstone1000-Enable-FWU-partition.patch
index 17fc0051..b4bd9a71 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-Platform-CS1000-Enable-FWU-partition.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Platform-Corstone1000-Enable-FWU-partition.patch
@@ -1,7 +1,7 @@
-From 1f8eb5887f3de167ac68c92b5b77efc51308603c Mon Sep 17 00:00:00 2001
+From ab1ecf0cfbbf199c4d868d2c565f7bff3f5245ee Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Tue, 15 Oct 2024 12:50:16 +0000
-Subject: [PATCH] Platform: Corstone1000: Enable FWU partition
+Subject: [PATCH 4/7] Platform: Corstone1000: Enable FWU partition
=20
 Enable firmware update partition for Corstone-1000 platform.
=20
@@ -11,13 +11,16 @@ configuration. Fix linker issues caused by enablement=
.
=20
 Upstream-Status: Backport [0107057d1411ec68e374fbd0ddc0e12abd5754ec]
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
-
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
+ platform/ext/target/arm/corstone1000/config.cmake | 4 ++++
+ 1 file changed, 4 insertions(+)
+
 diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index 6a805a122..1ba43a006 100644
+index 0e6297dae..e45b56b2f 100644
 --- a/platform/ext/target/arm/corstone1000/config.cmake
 +++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -56,6 +56,10 @@ set(TFM_PARTITION_CRYPTO                ON          C=
ACHE BOOL      "Enable Cryp
+@@ -55,6 +55,10 @@ set(TFM_PARTITION_CRYPTO                ON          C=
ACHE BOOL      "Enable Cryp
  set(TFM_PARTITION_INITIAL_ATTESTATION   ON          CACHE BOOL      "En=
able Initial Attestation partition")
  set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "En=
able Internal Trusted Storage partition")
 =20
@@ -28,3 +31,6 @@ index 6a805a122..1ba43a006 100644
 =20
  if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL =
RelWithDebInfo)
    set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-Platform-CS1000-Increase-flash-PS-area-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-CS1000-In=
crease-flash-PS-area-size.patch
deleted file mode 100644
index 77e8ddba..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-CS1000-Increase-flash-PS-area-size.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3794ba29b66641ebecbd4dd3d9a2a2e8caeb690a Mon Sep 17 00:00:00 2001
-From: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Date: Mon, 15 Jul 2024 13:03:24 +0000
-Subject: [PATCH 8/9] Platform: CS1000: Increase flash PS area size
-
-Previously, approximately only 2MB was used out of the 8MB SE Flash.
-The aim of this commit is to increase the size of PS storage in SE
-Flash.
-Increasing the size minimize the possibilities of it to run out
-of memory as it is not cleared on reset or reprogramming of the device.
-
-The FLASH_PS_AREA_SIZE is increased to 6MB so now 7MB of the SE Flash
-is used. The remaining 1MB is allocated for future uses.
-
-Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [3794ba29b66641ebecbd4dd3d9a2a2e8caeb690a]
----
- platform/ext/target/arm/corstone1000/partition/flash_layout.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index a181a7168..07b4cdea7 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -192,7 +192,7 @@
-=20
- #define FLASH_PS_AREA_OFFSET            (FLASH_ITS_AREA_OFFSET + \
-                                          FLASH_ITS_AREA_SIZE)
--#define FLASH_PS_AREA_SIZE              (16 * SECURE_FLASH_SECTOR_SIZE)
-+#define FLASH_PS_AREA_SIZE              (96 * SECURE_FLASH_SECTOR_SIZE)
-=20
- /* OTP_definitions */
- #define FLASH_OTP_NV_COUNTERS_AREA_OFFSET (FLASH_PS_AREA_OFFSET + \
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005-Platform-=
Corstone1000-Implement-Bootloader-Abstracti.patch
similarity index 93%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0005-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
index 8e03608e..942c798a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
@@ -1,7 +1,7 @@
-From 929ac4fdf22bdc84f7363be3f9604c586800e2c1 Mon Sep 17 00:00:00 2001
+From ed7dc0b54d8a654916c62fed4a201872e94233cc Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Tue, 15 Oct 2024 12:50:16 +0000
-Subject: [PATCH 5/6] Platform: Corstone1000: Implement Bootloader Abstra=
ction
+Subject: [PATCH 5/8] Platform: Corstone1000: Implement Bootloader Abstra=
ction
  Layer
=20
 This commit introduces the Bootloader Abstraction Layer (BAL) for
@@ -82,9 +82,9 @@ Upstream-Status: Backport [fb790fc19904a0ca9bacba7e58cf=
4dff5576b1d0]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
 ---
- .../target/arm/corstone1000/CMakeLists.txt    |   36 +-
- .../arm/corstone1000/bl1/provisioning.c       |    4 +-
- .../arm/corstone1000/bl2/security_cnt_bl2.c   |    6 +-
+ .../target/arm/corstone1000/CMakeLists.txt    |   34 +-
+ .../arm/corstone1000/bl1/provisioning.c       |    2 +-
+ .../arm/corstone1000/bl2/security_cnt_bl2.c   |    5 +-
  .../arm/corstone1000/bootloader/fwu_agent.h   |  123 +
  .../corstone1000/bootloader/fwu_config.h.in   |   58 +
  .../bootloader/mcuboot/CMakeLists.txt         |   52 +
@@ -92,13 +92,13 @@ Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
  .../mcuboot}/uefi_fmp.c                       |  111 +-
  .../tfm_bootloader_fwu_abstraction.h          |  189 ++
  .../uefi_fmp.h                                |    7 +-
- .../ext/target/arm/corstone1000/config.cmake  |    5 +-
- .../corstone1000/fw_update_agent/fwu_agent.c  | 1350 ----------
+ .../ext/target/arm/corstone1000/config.cmake  |   11 +-
+ .../corstone1000/fw_update_agent/fwu_agent.c  | 1405 ----------
  .../corstone1000/fw_update_agent/fwu_agent.h  |   73 -
- .../fw_update_agent/uefi_capsule_parser.c     |  175 --
+ .../fw_update_agent/uefi_capsule_parser.c     |  176 --
  .../fw_update_agent/uefi_capsule_parser.h     |   33 -
  .../arm/corstone1000/partition/flash_layout.h |   14 +-
- 16 files changed, 2882 insertions(+), 1699 deletions(-)
+ 16 files changed, 2883 insertions(+), 1755 deletions(-)
  create mode 100644 platform/ext/target/arm/corstone1000/bootloader/fwu_=
agent.h
  create mode 100644 platform/ext/target/arm/corstone1000/bootloader/fwu_=
config.h.in
  create mode 100644 platform/ext/target/arm/corstone1000/bootloader/mcub=
oot/CMakeLists.txt
@@ -112,16 +112,9 @@ Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com=
>
  delete mode 100644 platform/ext/target/arm/corstone1000/fw_update_agent=
/uefi_capsule_parser.h
=20
 diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 3323cb8ce..e49dca49c 100644
+index 3573c8492..6105c951b 100644
 --- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
 +++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2024, Arm Limited. All rights reserved.
-+# Copyright (c) 2020-2025, Arm Limited. All rights reserved.
- # Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon com=
pany)
- # or an affiliate of Cypress Semiconductor Corporation. All rights rese=
rved.
- #
 @@ -115,7 +115,7 @@ target_include_directories(platform_s
          ${PLATFORM_DIR}/ext/target/arm/drivers/usart/pl011
      INTERFACE
@@ -138,24 +131,24 @@ index 3323cb8ce..e49dca49c 100644
 -        fw_update_agent/uefi_capsule_parser.c
 -        fw_update_agent/fwu_agent.c
 -        fw_update_agent/uefi_fmp.c
-+	bootloader/mcuboot/tfm_mcuboot_fwu.c
-+	bootloader/mcuboot/uefi_fmp.c
++        bootloader/mcuboot/tfm_mcuboot_fwu.c
++        bootloader/mcuboot/uefi_fmp.c
          soft_crc/soft_crc.c
          io/io_block.c
          io/io_flash.c
-@@ -201,9 +200,8 @@ target_sources(platform_bl1_1
+@@ -199,9 +198,8 @@ target_sources(platform_bl1_1
          ./Native_Driver/watchdog.c
          ./bl1/boot_hal_bl1_1.c
          ./bl1/provisioning.c
 -        ./fw_update_agent/fwu_agent.c
 -        ./fw_update_agent/uefi_capsule_parser.c
 -        ./fw_update_agent/uefi_fmp.c
-+	./bootloader/mcuboot/tfm_mcuboot_fwu.c
-+	./bootloader/mcuboot/uefi_fmp.c
++        ./bootloader/mcuboot/tfm_mcuboot_fwu.c
++        ./bootloader/mcuboot/uefi_fmp.c
          ./soft_crc/soft_crc.c
          $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
          $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:${CMAKE_CURRENT_SOU=
RCE_DIR}/bl1/cc312_rom_crypto.c>
-@@ -233,7 +231,7 @@ target_include_directories(platform_bl1_1_interface
+@@ -232,7 +230,7 @@ target_include_directories(platform_bl1_1_interface
          ./Device/Config
          ./Native_Driver
          ./CMSIS_Driver/Config
@@ -164,16 +157,16 @@ index 3323cb8ce..e49dca49c 100644
          ./soft_crc
          ${PLATFORM_DIR}/ext/target/arm/drivers/flash/cfi
          ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
-@@ -245,6 +243,7 @@ target_include_directories(platform_bl1_1_interface
+@@ -244,6 +242,7 @@ target_include_directories(platform_bl1_1_interface
          ${PLATFORM_DIR}/ext/target/arm/drivers/usart/pl011
          $<$<BOOL:${CRYPTO_HW_ACCELERATOR}>:${CMAKE_SOURCE_DIR}/platform=
/ext/accelerator/interface>
          ${PLATFORM_DIR}/ext/accelerator/cc312/
-+        ${CMAKE_SOURCE_DIR}/lib/fih/inc/
++	${CMAKE_SOURCE_DIR}/lib/fih/inc/
  )
 =20
  target_link_libraries(platform_bl1_1
-@@ -252,6 +251,11 @@ target_link_libraries(platform_bl1_1
-         $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:cc312_rom>
+@@ -251,6 +250,11 @@ target_link_libraries(platform_bl1_1
+         $<$<NOT:$<BOOL:${TFM_BL1_SOFTWARE_CRYPTO}>>:cc3xx>
  )
 =20
 +target_include_directories(platform_bl1_1
@@ -206,24 +199,24 @@ index 3323cb8ce..e49dca49c 100644
          Native_Driver/arm_watchdog_drv.c
          fip_parser/fip_parser.c
 -        fw_update_agent/fwu_agent.c
-+	bootloader/mcuboot/tfm_mcuboot_fwu.c
++        bootloader/mcuboot/tfm_mcuboot_fwu.c
          bl2/security_cnt_bl2.c
          $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
          io/io_block.c
-@@ -358,6 +363,12 @@ target_compile_definitions(bl2
+@@ -356,6 +361,12 @@ target_compile_definitions(bl2
          $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING}>:CRYPTO_HW_A=
CCELERATOR_OTP_PROVISIONING>
          $<$<BOOL:${PLATFORM_PSA_ADAC_SECURE_DEBUG}>:PLATFORM_PSA_ADAC_S=
ECURE_DEBUG>
  )
 +
 +target_include_directories(bl2
 +    PRIVATE
-+	${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
++       ${CMAKE_SOURCE_DIR}/interface/include # for psa/error.h
 +)
 +
  target_compile_definitions(bootutil
      PRIVATE
          MULTIPLE_EXECUTABLE_RAM_REGIONS
-@@ -369,7 +380,7 @@ target_include_directories(platform_bl2
+@@ -367,7 +378,7 @@ target_include_directories(platform_bl2
          Device/Include
          fip_parser
          Native_Driver
@@ -232,7 +225,7 @@ index 3323cb8ce..e49dca49c 100644
          soft_crc
          io
          ${PLATFORM_DIR}/ext/target/arm/drivers/flash/common
-@@ -388,6 +399,7 @@ target_include_directories(platform_bl2
+@@ -386,6 +397,7 @@ target_include_directories(platform_bl2
          ${MCUBOOT_PATH}/boot/bootutil/include # for fault_injection_har=
dening.h only
          ${CMAKE_BINARY_DIR}/bl2/ext/mcuboot # for mcuboot_config.h only
          $<BUILD_INTERFACE:${BL2_SOURCE}/ext/mcuboot/include>
@@ -241,17 +234,10 @@ index 3323cb8ce..e49dca49c 100644
 =20
  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D ns_agent_mailbox =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
 diff --git a/platform/ext/target/arm/corstone1000/bl1/provisioning.c b/p=
latform/ext/target/arm/corstone1000/bl1/provisioning.c
-index cc42bc0a1..1afa9d542 100644
+index b8b03ad55..b28c840f8 100644
 --- a/platform/ext/target/arm/corstone1000/bl1/provisioning.c
 +++ b/platform/ext/target/arm/corstone1000/bl1/provisioning.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
-+ * Copyright (c) 2021-2023, 2025, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -100,7 +100,7 @@ enum tfm_plat_err_t provision_assembly_and_test(void=
)
+@@ -92,7 +92,7 @@ enum tfm_plat_err_t provision_assembly_and_test(void)
      }
 =20
      err =3D fwu_metadata_provision();
@@ -261,26 +247,20 @@ index cc42bc0a1..1afa9d542 100644
      }
 =20
 diff --git a/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c=
 b/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
-index da9f74e1c..c74c67d89 100644
+index da9f74e1c..850ed46ac 100644
 --- a/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
 +++ b/platform/ext/target/arm/corstone1000/bl2/security_cnt_bl2.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2019-2021, Arm Limited. All rights reserved.
-+ * Copyright (c) 2019-2021, 2025, Arm Limited. All rights reserved.
-  *
-  * SPDX-License-Identifier: BSD-3-Clause
-  *
-@@ -76,7 +76,7 @@ int32_t boot_nv_security_counter_update(uint32_t image=
_id,
+@@ -76,7 +76,8 @@ int32_t boot_nv_security_counter_update(uint32_t image=
_id,
  {
      enum tfm_nv_counter_t nv_counter;
      enum tfm_plat_err_t err;
 -    enum fwu_agent_error_t fwu_err;
++    bool provisioning_required;
 +    psa_status_t fwu_err;
 =20
      nv_counter =3D get_nv_counter_from_image_id(image_id);
      if (nv_counter >=3D TFM_BOOT_NV_COUNTER_MAX) {
-@@ -100,7 +100,7 @@ int32_t boot_nv_security_counter_update(uint32_t ima=
ge_id,
+@@ -100,7 +101,7 @@ int32_t boot_nv_security_counter_update(uint32_t ima=
ge_id,
              return -1;
          }
 =20
@@ -291,12 +271,12 @@ index da9f74e1c..c74c67d89 100644
 =20
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h=
 b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
 new file mode 100644
-index 000000000..6b3a38b64
+index 000000000..aa5af15b2
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_agent.h
 @@ -0,0 +1,123 @@
 +/*
-+ * Copyright (c) 2021-2023, 2025, Arm Limited. All rights reserved.
++ * Copyright (c) 2021-2023, Arm Limited. All rights reserved.
 + *
 + * SPDX-License-Identifier: BSD-3-Clause
 + *
@@ -328,10 +308,10 @@ index 000000000..6b3a38b64
 +
 +#define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION  1
 +typedef struct {
-+    uint32_t                signature;
-+    uint32_t                header_size;
-+    uint32_t                fw_version;
-+    uint32_t                lowest_supported_version;
++    uint32_t signature;
++    uint32_t header_size;
++    uint32_t fw_version;
++    uint32_t lowest_supported_version;
 +} __packed fmp_payload_header_t;
 +
 +typedef struct {
@@ -354,20 +334,20 @@ index 000000000..6b3a38b64
 +
 +/* ESRT v1 */
 +struct __attribute__((__packed__)) efi_system_resource_entry {
-+	struct efi_guid fw_class;
-+	uint32_t fw_type;
-+	uint32_t fw_version;
-+	uint32_t lowest_supported_fw_version;
-+	uint32_t capsule_flags;
-+	uint32_t last_attempt_version;
-+	uint32_t last_attempt_status;
++    struct   efi_guid fw_class;
++    uint32_t fw_type;
++    uint32_t fw_version;
++    uint32_t lowest_supported_fw_version;
++    uint32_t capsule_flags;
++    uint32_t last_attempt_version;
++    uint32_t last_attempt_status;
 +};
 +
 +struct __attribute__((__packed__)) efi_system_resource_table {
-+	uint32_t fw_resource_count;
-+	uint32_t fw_resource_count_max;
-+	uint64_t fw_resource_version;
-+	struct efi_system_resource_entry entries[];
++    uint32_t fw_resource_count;
++    uint32_t fw_resource_count_max;
++    uint64_t fw_resource_version;
++    struct   efi_system_resource_entry entries[];
 +};
 +
 +psa_status_t fwu_metadata_provision(void);
@@ -420,12 +400,12 @@ index 000000000..6b3a38b64
 +#endif /* FWU_AGENT_H */
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/fwu_config.=
h.in b/platform/ext/target/arm/corstone1000/bootloader/fwu_config.h.in
 new file mode 100644
-index 000000000..79e310e29
+index 000000000..acb8de05e
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/fwu_config.h.in
 @@ -0,0 +1,58 @@
 +/*
-+ * Copyright (c) 2025, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
 + *
 + * SPDX-License-Identifier: BSD-3-Clause
 + *
@@ -484,12 +464,12 @@ index 000000000..79e310e29
 +#endif /* __FWU_CONFIG_H__ */
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMa=
keLists.txt b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMa=
keLists.txt
 new file mode 100644
-index 000000000..7d57a57c7
+index 000000000..13a3caf54
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/CMakeLists=
.txt
 @@ -0,0 +1,52 @@
 +#----------------------------------------------------------------------=
---------
-+# Copyright (c) 2021-2022, 2025, Arm Limited. All rights reserved.
++# SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
 +#
 +# SPDX-License-Identifier: BSD-3-Clause
 +#
@@ -505,7 +485,7 @@ index 000000000..7d57a57c7
 +        ${CMAKE_SOURCE_DIR}/bl2/src/flash_map.c
 +        ${CMAKE_SOURCE_DIR}/bl2/ext/mcuboot/flash_map_extended.c
 +        ./tfm_mcuboot_fwu.c
-+	./uefi_fmp.c
++        ./uefi_fmp.c
 +        $<$<BOOL:${DEFAULT_MCUBOOT_FLASH_MAP}>:${CMAKE_SOURCE_DIR}/bl2/=
src/default_flash_map.c>
 +)
 +
@@ -542,12 +522,12 @@ index 000000000..7d57a57c7
 +)
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
 new file mode 100644
-index 000000000..32fe44516
+index 000000000..a458b5478
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
 @@ -0,0 +1,2345 @@
 +/*
-+ * Copyright (c) 2021-2025, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
 + *
 + * SPDX-License-Identifier: BSD-3-Clause
 + *
@@ -1371,15 +1351,15 @@ index 000000000..32fe44516
 +    psa_status_t ret;
 +    ARM_FLASH_INFO* flash_info;
 +
++#ifndef BL1_BUILD
++    plat_io_storage_init();
++    partition_init(PLATFORM_GPT_IMAGE);
++#endif
++
 +    if (is_initialized) {
 +        return PSA_SUCCESS;
 +    }
 +
-+    #ifndef BL1_BUILD
-+    plat_io_storage_init();
-+    partition_init(PLATFORM_GPT_IMAGE);
-+    #endif
-+
 +    /* Code assumes everything fits into a sector */
 +    if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
 +        return PSA_ERROR_GENERIC_ERROR;
@@ -2895,13 +2875,13 @@ diff --git a/platform/ext/target/arm/corstone1000=
/fw_update_agent/uefi_fmp.c b/p
 similarity index 66%
 rename from platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fm=
p.c
 rename to platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_f=
mp.c
-index 896658995..30956a440 100644
+index 896658995..aef9c9a20 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.c
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fmp.c
 @@ -1,5 +1,5 @@
  /*
 - * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022-2025, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
   *
   * SPDX-License-Identifier: BSD-3-Clause
   *
@@ -3098,12 +3078,12 @@ index 896658995..30956a440 100644
 -
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/tfm_bootloa=
der_fwu_abstraction.h b/platform/ext/target/arm/corstone1000/bootloader/t=
fm_bootloader_fwu_abstraction.h
 new file mode 100644
-index 000000000..571f61be3
+index 000000000..909b4857b
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/bootloader/tfm_bootloader_fwu=
_abstraction.h
 @@ -0,0 +1,189 @@
 +/*
-+ * Copyright (c) 2021-2022, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
 + *
 + * SPDX-License-Identifier: BSD-3-Clause
 + *
@@ -3295,13 +3275,13 @@ diff --git a/platform/ext/target/arm/corstone1000=
/fw_update_agent/uefi_fmp.h b/p
 similarity index 89%
 rename from platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fm=
p.h
 rename to platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
-index d876bd7cf..a555d851f 100644
+index d876bd7cf..36c604714 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.h
 +++ b/platform/ext/target/arm/corstone1000/bootloader/uefi_fmp.h
 @@ -1,5 +1,5 @@
  /*
 - * Copyright (c) 2022, Arm Limited. All rights reserved.
-+ * Copyright (c) 2022, 2025, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
   *
   * SPDX-License-Identifier: BSD-3-Clause
   *
@@ -3323,32 +3303,33 @@ index d876bd7cf..a555d851f 100644
 +psa_status_t fmp_get_image_info(void *buffer, uint32_t size);
  #endif /* UEFI_FMP_H */
 diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index 1ba43a006..108d16f57 100644
+index e45b56b2f..f1de066e5 100644
 --- a/platform/ext/target/arm/corstone1000/config.cmake
 +++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2023, Arm Limited. All rights reserved.
-+# Copyright (c) 2020-2023, 2025, Arm Limited. All rights reserved.
- # Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon com=
pany)
- # or an affiliate of Cypress Semiconductor Corporation. All rights rese=
rved.
- #
-@@ -60,6 +60,9 @@ set(TFM_PARTITION_FIRMWARE_UPDATE         ON        CA=
CHE BOOL      "Enable firm
- set(PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT ON         CACHE BOOL      "Wh=
eter the platform has firmware update support")
- set(MCUBOOT_DATA_SHARING                 ON         CACHE BOOL      "En=
able Data Sharing")
- set(TFM_FWU_BOOTLOADER_LIB                "${CMAKE_CURRENT_LIST_DIR}/bo=
otloader/mcuboot"   CACHE STRING    "Bootloader configure file for Firmwa=
re Update partition")
-+set(TFM_CONFIG_FWU_MAX_MANIFEST_SIZE      0         CACHE STRING    "Th=
e maximum permitted size for manifest in psa_fwu_start(), in bytes.")
-+set(TFM_CONFIG_FWU_MAX_WRITE_SIZE         4096        CACHE STRING    "=
The maximum permitted size for block in psa_fwu_write, in bytes.")
-+set(FWU_SUPPORT_TRIAL_STATE              ON         CACHE BOOL      "De=
vice support TRIAL component state.")
+@@ -55,10 +55,13 @@ set(TFM_PARTITION_CRYPTO                ON          =
CACHE BOOL      "Enable Cryp
+ set(TFM_PARTITION_INITIAL_ATTESTATION   ON          CACHE BOOL      "En=
able Initial Attestation partition")
+ set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "En=
able Internal Trusted Storage partition")
+=20
+-set(TFM_PARTITION_FIRMWARE_UPDATE         ON        CACHE BOOL      "En=
able firmware update partition")
+-set(PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT ON         CACHE BOOL      "Wh=
eter the platform has firmware update support")
+-set(MCUBOOT_DATA_SHARING                 ON         CACHE BOOL      "En=
able Data Sharing")
+-set(TFM_FWU_BOOTLOADER_LIB                "${CMAKE_CURRENT_LIST_DIR}/bo=
otloader/mcuboot"   CACHE STRING    "Bootloader configure file for Firmwa=
re Update partition")
++set(TFM_PARTITION_FIRMWARE_UPDATE         ON         CACHE BOOL      "E=
nable firmware update partition")
++set(PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT  ON         CACHE BOOL      "W=
hether the platform has firmware update support")
++set(MCUBOOT_DATA_SHARING                  ON         CACHE BOOL      "E=
nable Data Sharing")
++set(TFM_FWU_BOOTLOADER_LIB                "${CMAKE_CURRENT_LIST_DIR}/bo=
otloader/mcuboot"   CACHE STRING    "Bootloader configuration file for Fi=
rmware Update partition")
++set(TFM_CONFIG_FWU_MAX_MANIFEST_SIZE      0          CACHE STRING    "T=
he maximum permitted size for manifest in psa_fwu_start(), in bytes.")
++set(TFM_CONFIG_FWU_MAX_WRITE_SIZE         4096       CACHE STRING    "T=
he maximum permitted size for block in psa_fwu_write, in bytes.")
++set(FWU_SUPPORT_TRIAL_STATE               ON         CACHE BOOL      "D=
evice support TRIAL component state.")
 =20
  if (${CMAKE_BUILD_TYPE} STREQUAL Debug OR ${CMAKE_BUILD_TYPE} STREQUAL =
RelWithDebInfo)
    set(ENABLE_FWU_AGENT_DEBUG_LOGS     TRUE          CACHE BOOL      "En=
able Firmware update agent debug logs.")
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 deleted file mode 100644
-index c9b3e4844..000000000
+index 29c7be9a3..000000000
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
 +++ /dev/null
-@@ -1,1350 +0,0 @@
+@@ -1,1405 +0,0 @@
 -/*
 - * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
 - *
@@ -3372,11 +3353,20 @@ index c9b3e4844..000000000
 -#include "uefi_fmp.h"
 -#include "uart_stdout.h"
 -#include "soft_crc.h"
--#ifndef BL1_BUILD
+-#if !BL1
 -#include "partition.h"
 -#include "platform.h"
 -#endif
 -
+-#define FWU_METADATA_VERSION		2
+-#define FWU_FW_STORE_DESC_OFFSET	0x20
+-#define NR_OF_MAX_FW_BANKS		4
+-
+-/*
+- * Metadata version 2 data structures defined by PSA_FW update specific=
ation
+- * at https://developer.arm.com/documentation/den0118/latest/
+- */
+-
 -/* Properties of image in a bank */
 -struct fwu_image_properties {
 -
@@ -3409,6 +3399,28 @@ index c9b3e4844..000000000
 -
 -} __packed;
 -
+-struct fwu_fw_store_descriptor {
+-
+-       /* Number of Banks */
+-       uint8_t num_banks;
+-
+-       /* Reserved */
+-       uint8_t reserved;
+-
+-       /* Number of images per bank */
+-       uint16_t num_images;
+-
+-       /* Size of image_entry(all banks) in bytes */
+-       uint16_t img_entry_size;
+-
+-       /* Size of image bank info structure in bytes */
+-       uint16_t bank_info_entry_size;
+-
+-       /* Array of fwu_image_entry structs */
+-       struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
+-
+-} __packed;
+-
 -struct fwu_metadata {
 -
 -        /* Metadata CRC value */
@@ -3423,8 +3435,23 @@ index c9b3e4844..000000000
 -        /* Previous bank index with which device booted successfully */
 -        uint32_t previous_active_index;
 -
--        /* Image entry information */
--        struct fwu_image_entry img_entry[NR_OF_IMAGES_IN_FW_BANK];
+-        /* Size of the entire metadata in bytes */
+-        uint32_t metadata_size;
+-
+-        /* Offset of the image descriptor structure */
+-        uint16_t desc_offset;
+-
+-        /* Reserved */
+-        uint16_t reserved1;
+-
+-        /* Bank state: It's not used in corstone1000 at the moment.Curr=
ently
+-	     * not used by any sw componenets such as u-boot and TF-A */
+-        uint8_t bank_state[NR_OF_MAX_FW_BANKS];
+-
+-        /* Reserved */
+-        uint32_t reserved2;
+-
+-        struct fwu_fw_store_descriptor fw_desc;
 -
 -} __packed;
 -
@@ -3498,7 +3525,7 @@ index c9b3e4844..000000000
 -
 -#define HOST_ACK_TIMEOUT_SEC    (6 * 60) /* ~seconds, not exact */
 -
--#ifdef BL1_BUILD
+-#if BL1
 -static enum fwu_agent_error_t private_metadata_read(
 -        struct fwu_private_metadata* p_metadata)
 -{
@@ -3511,8 +3538,8 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_PRIVATE_METADATA_REPLIC=
A_1_OFFSET, p_metadata,
--                                          sizeof(struct fwu_private_met=
adata));
--    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-                                          sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3521,7 +3548,7 @@ index c9b3e4844..000000000
 -
 -    return FWU_AGENT_SUCCESS;
 -}
--#else
+-#elif
 -static enum fwu_agent_error_t private_metadata_read(
 -        struct fwu_private_metadata* p_metadata)
 -{
@@ -3542,8 +3569,8 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start, p_metadata,
--                                          sizeof(struct fwu_private_met=
adata));
--    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-                                          sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3554,7 +3581,7 @@ index c9b3e4844..000000000
 -}
 -#endif
 -
--#ifdef BL1_BUILD
+-#if BL1
 -static enum fwu_agent_error_t private_metadata_write(
 -        struct fwu_private_metadata* p_metadata)
 -{
@@ -3573,15 +3600,15 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_PRIVATE_METADATA_REP=
LICA_1_OFFSET,
--                                p_metadata, sizeof(struct fwu_private_m=
etadata));
--    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
 -    FWU_LOG_MSG("%s: success\n\r", __func__);
 -    return FWU_AGENT_SUCCESS;
 -}
--#else
+-#elif
 -static enum fwu_agent_error_t private_metadata_write(
 -        struct fwu_private_metadata* p_metadata)
 -{
@@ -3608,8 +3635,8 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
--                                p_metadata, sizeof(struct fwu_private_m=
etadata));
--    if (ret < 0 || ret !=3D sizeof(struct fwu_private_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3620,8 +3647,6 @@ index c9b3e4844..000000000
 -
 -static enum fwu_agent_error_t metadata_validate(struct fwu_metadata *p_=
metadata)
 -{
--    int ret;
--
 -    FWU_LOG_MSG("%s: enter:\n\r", __func__);
 -
 -    if (!p_metadata) {
@@ -3629,7 +3654,7 @@ index c9b3e4844..000000000
 -    }
 -
 -    uint32_t calculated_crc32 =3D crc32((uint8_t *)&(p_metadata->versio=
n),
--                                      sizeof(struct fwu_metadata) - siz=
eof(uint32_t));
+-                                      sizeof(*p_metadata) - sizeof(p_me=
tadata->crc_32));
 -
 -    if (p_metadata->crc_32 !=3D calculated_crc32) {
 -        FWU_LOG_MSG("%s: failed: crc32 calculated: 0x%x, given: 0x%x\n\=
r", __func__,
@@ -3642,21 +3667,21 @@ index c9b3e4844..000000000
 -    return FWU_AGENT_SUCCESS;
 -}
 -
--#ifdef BL1_BUILD
+-#if BL1
 -static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
 -{
 -    int ret;
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(*p_metadata));
 -
 -    if (!p_metadata) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3665,7 +3690,7 @@ index c9b3e4844..000000000
 -
 -    return FWU_AGENT_SUCCESS;
 -}
--#else
+-#elif
 -static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
 -{
 -    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
@@ -3683,12 +3708,12 @@ index c9b3e4844..000000000
 -    }
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  part->start, sizeof(struct fwu_metadata));
+-                  part->start, sizeof(*p_metadata));
 -
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3699,21 +3724,21 @@ index c9b3e4844..000000000
 -}
 -#endif
 -
--#ifdef BL1_BUILD
+-#if BL1
 -static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
 -{
 -    int ret;
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(*p_metadata));
 -
 -    if (!p_metadata) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ReadData(FWU_METADATA_REPLICA_1_OFFS=
ET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3726,7 +3751,7 @@ index c9b3e4844..000000000
 -
 -    return FWU_AGENT_SUCCESS;
 -}
--#else
+-#elif
 -static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
 -{
 -    uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
@@ -3744,11 +3769,11 @@ index c9b3e4844..000000000
 -    }
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  part->start, sizeof(struct fwu_metadata));
+-                  part->start, sizeof(*p_metadata));
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ReadData(part->start,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3764,14 +3789,14 @@ index c9b3e4844..000000000
 -#endif
 -
 -
--#ifdef BL1_BUILD
+-#if BL1
 -static enum fwu_agent_error_t metadata_write(
 -                        struct fwu_metadata *p_metadata)
 -{
 -    int ret;
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(struct fwu_meta=
data));
+-                  FWU_METADATA_REPLICA_1_OFFSET, sizeof(*p_metadata));
 -
 -    if (!p_metadata) {
 -        return FWU_AGENT_ERROR;
@@ -3783,13 +3808,13 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_1_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
+-                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(*p_metadata));
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
 -    if (ret !=3D ARM_DRIVER_OK) {
@@ -3797,13 +3822,13 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
+-                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(*p_metadata));
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
 -    if (ret !=3D ARM_DRIVER_OK) {
@@ -3811,8 +3836,8 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3820,7 +3845,7 @@ index c9b3e4844..000000000
 -                  p_metadata->active_index, p_metadata->previous_active=
_index);
 -    return FWU_AGENT_SUCCESS;
 -}
--#else
+-#elif
 -static enum fwu_agent_error_t metadata_write(
 -                        struct fwu_metadata *p_metadata)
 -{
@@ -3839,7 +3864,7 @@ index c9b3e4844..000000000
 -    }
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  part->start, sizeof(struct fwu_metadata));
+-                  part->start, sizeof(*p_metadata));
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
 -    if (ret !=3D ARM_DRIVER_OK) {
@@ -3847,8 +3872,8 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3859,7 +3884,7 @@ index c9b3e4844..000000000
 -    }
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  part->start, sizeof(struct fwu_metadata));
+-                  part->start, sizeof(*p_metadata));
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(part->start);
 -    if (ret !=3D ARM_DRIVER_OK) {
@@ -3867,13 +3892,13 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(part->start,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
 -    FWU_LOG_MSG("%s: enter: flash addr =3D %u, size =3D %d\n\r", __func=
__,
--                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(struct fwu_meta=
data));
+-                  FWU_METADATA_REPLICA_2_OFFSET, sizeof(*p_metadata));
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.EraseSector(FWU_METADATA_REPLICA_2_O=
FFSET);
 -    if (ret !=3D ARM_DRIVER_OK) {
@@ -3881,8 +3906,8 @@ index c9b3e4844..000000000
 -    }
 -
 -    ret =3D FWU_METADATA_FLASH_DEV.ProgramData(FWU_METADATA_REPLICA_2_O=
FFSET,
--                                p_metadata, sizeof(struct fwu_metadata)=
);
--    if (ret < 0 || ret !=3D sizeof(struct fwu_metadata)) {
+-                                p_metadata, sizeof(*p_metadata));
+-    if (ret < 0 || ret !=3D sizeof(*p_metadata)) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3898,17 +3923,13 @@ index c9b3e4844..000000000
 -    enum fwu_agent_error_t ret;
 -    ARM_FLASH_INFO* flash_info;
 -
+-
 -    if (is_initialized) {
 -        return FWU_AGENT_SUCCESS;
 -    }
 -
--    #ifndef BL1_BUILD
--    plat_io_storage_init();
--    partition_init(PLATFORM_GPT_IMAGE);
--    #endif
--
 -    /* Code assumes everything fits into a sector */
--    if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
+-    if (sizeof(_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
 -        return FWU_AGENT_ERROR;
 -    }
 -
@@ -3940,6 +3961,11 @@ index c9b3e4844..000000000
 -
 -    FWU_LOG_MSG("%s: enter\n\r", __func__);
 -
+-#if !BL1
+-    plat_io_storage_init();
+-    partition_init(PLATFORM_GPT_IMAGE);
+-#endif
+-
 -    ret =3D fwu_metadata_init();
 -    if (ret) {
 -        return ret;
@@ -3957,34 +3983,40 @@ index c9b3e4844..000000000
 -    }
 -    /* Provision FWU Agent Metadata */
 -
--    memset(&_metadata, 0, sizeof(struct fwu_metadata));
+-    memset(&_metadata, 0, sizeof(_metadata));
 -
--    _metadata.version =3D 1;
+-    _metadata.version =3D FWU_METADATA_VERSION;
 -    _metadata.active_index =3D BANK_0;
 -    _metadata.previous_active_index =3D BANK_1;
+-    _metadata.desc_offset=3D FWU_FW_STORE_DESC_OFFSET;
 -
+-    _metadata.fw_desc.num_banks =3D NR_OF_FW_BANKS;
+-    _metadata.fw_desc.num_images =3D NR_OF_IMAGES_IN_FW_BANK;
+-    _metadata.fw_desc.img_entry_size =3D sizeof(struct fwu_image_entry)=
 * NR_OF_IMAGES_IN_FW_BANK;
+-    _metadata.fw_desc.bank_info_entry_size =3D sizeof(struct fwu_image_=
properties) * NR_OF_FW_BANKS;
 -    /* bank 0 is the place where images are located at the
 -     * start of device lifecycle */
 -
 -    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
 -
--        _metadata.img_entry[i].img_props[BANK_0].accepted =3D IMAGE_ACC=
EPTED;
--        _metadata.img_entry[i].img_props[BANK_0].version =3D image_vers=
ion;
+-        _metadata.fw_desc.img_entry[i].img_props[BANK_0].accepted =3D I=
MAGE_ACCEPTED;
+-        _metadata.fw_desc.img_entry[i].img_props[BANK_0].version =3D im=
age_version;
 -
--        _metadata.img_entry[i].img_props[BANK_1].accepted =3D IMAGE_NOT=
_ACCEPTED;
--        _metadata.img_entry[i].img_props[BANK_1].version =3D INVALID_VE=
RSION;
+-        _metadata.fw_desc.img_entry[i].img_props[BANK_1].accepted =3D I=
MAGE_NOT_ACCEPTED;
+-        _metadata.fw_desc.img_entry[i].img_props[BANK_1].version =3D IN=
VALID_VERSION;
 -    }
 -
--    /* Calculate CRC32 for fwu metadata */
+-    /* Calculate CRC32 for fwu metadata. The first filed in the _metada=
ta has to be the crc_32.
+-     * This should be omited from the calculation. */
 -    _metadata.crc_32 =3D crc32((uint8_t *)&_metadata.version,
--                             sizeof(struct fwu_metadata) - sizeof(uint3=
2_t));
+-                             sizeof(_metadata) - sizeof(_metadata.crc_3=
2));
 -
 -    ret =3D metadata_write(&_metadata);
 -    if (ret) {
 -        return ret;
 -    }
 -
--    memset(&_metadata, 0, sizeof(struct fwu_metadata));
+-    memset(&_metadata, 0, sizeof(_metadata));
 -    ret =3D metadata_read(&_metadata);
 -    if (ret) {
 -        return ret;
@@ -3996,7 +4028,7 @@ index c9b3e4844..000000000
 -    /* Provision Private metadata for update agent which is shared
 -       beween BL1 and tf-m of secure enclave */
 -
--    memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
+-    memset(&priv_metadata, 0, sizeof(priv_metadata));
 -
 -    priv_metadata.boot_index =3D BANK_0;
 -    priv_metadata.boot_attempted =3D 0;
@@ -4010,7 +4042,7 @@ index c9b3e4844..000000000
 -        return ret;
 -    }
 -
--    memset(&priv_metadata, 0, sizeof(struct fwu_private_metadata));
+-    memset(&priv_metadata, 0, sizeof(priv_metadata));
 -    ret =3D private_metadata_read(&priv_metadata);
 -    if (ret) {
 -        return ret;
@@ -4037,7 +4069,7 @@ index c9b3e4844..000000000
 -    }
 -
 -    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        if ((metadata_ptr->img_entry[i].img_props[boot_index].accepted)
+-        if ((metadata_ptr->fw_desc.img_entry[i].img_props[boot_index].a=
ccepted)
 -                =3D=3D (IMAGE_NOT_ACCEPTED)) {
 -            return FWU_AGENT_STATE_TRIAL;
 -        }
@@ -4049,7 +4081,7 @@ index c9b3e4844..000000000
 -
 -static int get_image_info_in_bank(struct efi_guid* guid, uint32_t* imag=
e_bank_offset)
 -{
--    if ((memcmp(guid, &full_capsule_image_guid, sizeof(struct efi_guid)=
)) =3D=3D 0) {
+-    if ((memcmp(guid, &full_capsule_image_guid, sizeof(*guid))) =3D=3D =
0) {
 -        *image_bank_offset =3D 0;
 -        return IMAGE_ALL;
 -    }
@@ -4112,7 +4144,7 @@ index c9b3e4844..000000000
 -    }
 -
 -    if (version <=3D
--            (metadata->img_entry[IMAGE_0].img_props[active_index].versi=
on)) {
+-            (metadata->fw_desc.img_entry[IMAGE_0].img_props[active_inde=
x].version)) {
 -        FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
 -        return FWU_AGENT_ERROR;
 -    }
@@ -4143,14 +4175,14 @@ index c9b3e4844..000000000
 -
 -    /* Change system state to trial bank state */
 -    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        metadata->img_entry[i].img_props[previous_active_index].accepte=
d =3D
+-        metadata->fw_desc.img_entry[i].img_props[previous_active_index]=
.accepted =3D
 -                                                        IMAGE_NOT_ACCEP=
TED;
--        metadata->img_entry[i].img_props[previous_active_index].version=
 =3D version;
+-        metadata->fw_desc.img_entry[i].img_props[previous_active_index]=
.version =3D version;
 -    }
 -    metadata->active_index =3D previous_active_index;
 -    metadata->previous_active_index =3D active_index;
 -    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
--                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
+-                              sizeof(*metadata) - sizeof(metadata->crc_=
32));
 -
 -    ret =3D metadata_write(metadata);
 -    if (ret) {
@@ -4196,7 +4228,7 @@ index c9b3e4844..000000000
 -        goto out;
 -    }
 -
--    memset(&capsule_info, 0, sizeof(capsule_image_info_t));
+-    memset(&capsule_info, 0, sizeof(capsule_info));
 -    if (uefi_capsule_retrieve_images(capsule_ptr, &capsule_info)) {
 -        ret =3D  FWU_AGENT_ERROR;
 -        goto out;
@@ -4252,7 +4284,7 @@ index c9b3e4844..000000000
 -    FWU_LOG_MSG("%s: enter\n\r", __func__);
 -
 -    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        metadata->img_entry[i].img_props[active_index].accepted =3D
+-        metadata->fw_desc.img_entry[i].img_props[active_index].accepted=
 =3D
 -                                                            IMAGE_ACCEP=
TED;
 -    }
 -
@@ -4263,7 +4295,7 @@ index c9b3e4844..000000000
 -        return ret;
 -    }
 -    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
--                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
+-                              sizeof(*metadata) - sizeof(metadata->crc_=
32));
 -
 -    ret =3D metadata_write(metadata);
 -    if (ret) {
@@ -4342,7 +4374,7 @@ index c9b3e4844..000000000
 -
 -    index =3D metadata->previous_active_index;
 -    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; i++) {
--        if (metadata->img_entry[i].img_props[index].accepted !=3D IMAGE=
_ACCEPTED)
+-        if (metadata->fw_desc.img_entry[i].img_props[index].accepted !=3D=
 IMAGE_ACCEPTED)
 -        {
 -            FWU_ASSERT(0);
 -        }
@@ -4359,7 +4391,7 @@ index c9b3e4844..000000000
 -        return ret;
 -    }
 -    metadata->crc_32 =3D crc32((uint8_t *)&metadata->version,
--                              sizeof(struct fwu_metadata) - sizeof(uint=
32_t));
+-                              sizeof(*metadata) - sizeof(metadata->crc_=
32));
 -
 -    ret =3D metadata_write(metadata);
 -    if (ret) {
@@ -4472,12 +4504,13 @@ index c9b3e4844..000000000
 -
 -    FWU_LOG_MSG("%s: enter\n\r", __func__);
 -
--    for (int i =3D 0; i <=3D FWU_MAX_NV_COUNTER_INDEX; i++) {
+-    /* The FWU_BL2_NV_COUNTER (0) is not mirrored in the private metada=
ta. It is
+-     * directly updated in the bl1_2_validate_image_at_addr() function,=
 in
+-     * tfm/bl1/bl1_2/main.c.
+-     * Because of this, the index starts from FWU_TFM_NV_COUNTER (1). *=
/
+-    for (int i =3D FWU_TFM_NV_COUNTER; i <=3D FWU_MAX_NV_COUNTER_INDEX;=
 i++) {
 -
 -        switch (i) {
--            case FWU_BL2_NV_COUNTER:
--                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL1_0;
--                break;
 -            case FWU_TFM_NV_COUNTER:
 -                tfm_nv_counter_i =3D PLAT_NV_COUNTER_BL2_0;
 -                break;
@@ -4492,18 +4525,21 @@ index c9b3e4844..000000000
 -        err =3D tfm_plat_read_nv_counter(tfm_nv_counter_i,
 -                        sizeof(security_cnt), (uint8_t *)&security_cnt)=
;
 -        if (err !=3D TFM_PLAT_ERR_SUCCESS) {
+-            FWU_LOG_MSG("%s: couldn't read NV counter\n\r", __func__);
 -            return FWU_AGENT_ERROR;
 -        }
 -
 -        if (priv_metadata->nv_counter[i] < security_cnt) {
+-            FWU_LOG_MSG("%s: staged NV counter is smaller than current =
value\n\r", __func__);
 -            return FWU_AGENT_ERROR;
 -        } else if (priv_metadata->nv_counter[i] > security_cnt) {
--            FWU_LOG_MSG("%s: updaing index =3D %u nv counter =3D %u->%u=
\n\r",
+-            FWU_LOG_MSG("%s: updating index =3D %u nv counter =3D %u->%=
u\n\r",
 -                        __func__, i, security_cnt,
--                        priv_metadata->nv_counter[FWU_BL2_NV_COUNTER]);
+-                        priv_metadata->nv_counter[i]);
 -            err =3D tfm_plat_set_nv_counter(tfm_nv_counter_i,
--                                    priv_metadata->nv_counter[FWU_BL2_N=
V_COUNTER]);
+-                                    priv_metadata->nv_counter[i]);
 -            if (err !=3D TFM_PLAT_ERR_SUCCESS) {
+-                FWU_LOG_MSG("%s: couldn't write NV counter\n\r", __func=
__);
 -                return FWU_AGENT_ERROR;
 -            }
 -        }
@@ -4559,7 +4595,7 @@ index c9b3e4844..000000000
 -        /* firmware update failed, revert back to previous bank */
 -
 -        priv_metadata.fmp_last_attempt_version =3D
--         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
+-         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
 -
 -        priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_E=
RROR_UNSUCCESSFUL;
 -
@@ -4570,9 +4606,9 @@ index c9b3e4844..000000000
 -        /* firmware update successful */
 -
 -        priv_metadata.fmp_version =3D
--         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
+-         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
 -        priv_metadata.fmp_last_attempt_version =3D
--         _metadata.img_entry[IMAGE_0].img_props[_metadata.active_index]=
.version;
+-         _metadata.fw_desc.img_entry[IMAGE_0].img_props[_metadata.activ=
e_index].version;
 -
 -        priv_metadata.fmp_last_attempt_status =3D LAST_ATTEMPT_STATUS_S=
UCCESS;
 -
@@ -4780,17 +4816,18 @@ index 701f20558..000000000
 -#endif /* FWU_AGENT_H */
 diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_c=
apsule_parser.c b/platform/ext/target/arm/corstone1000/fw_update_agent/ue=
fi_capsule_parser.c
 deleted file mode 100644
-index c706c040a..000000000
+index 44566e08d..000000000
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_capsule_=
parser.c
 +++ /dev/null
-@@ -1,175 +0,0 @@
+@@ -1,176 +0,0 @@
 -/*
-- * Copyright (c) 2021, Arm Limited. All rights reserved.
+- * Copyright (c) 2021-2024, Arm Limited. All rights reserved.
 - *
 - * SPDX-License-Identifier: BSD-3-Clause
 - *
 - */
 -
+-#include "cmsis_compiler.h"
 -#include "uefi_capsule_parser.h"
 -#include "fwu_agent.h"
 -#include <string.h>
@@ -4815,21 +4852,21 @@ index c706c040a..000000000
 -            Payload n (item_offset[embedded_driver_count + payload_item=
_count -1])
 -*/
 -
--typedef struct {
+-typedef __PACKED_STRUCT {
 -    struct efi_guid         capsule_guid;
 -    uint32_t                header_size;
 -    uint32_t                flags;
 -    uint32_t                capsule_image_size;
 -} efi_capsule_header_t;
 -
--typedef struct {
+-typedef __PACKED_STRUCT {
 -    uint32_t                version;
 -    uint16_t                embedded_driver_count;
 -    uint16_t                payload_item_count;
 -    uint64_t                item_offset_list[];
 -} efi_firmware_management_capsule_header_t;
 -
--typedef struct {
+-typedef __PACKED_STRUCT {
 -    uint32_t                version;
 -    struct efi_guid         update_image_type_id;
 -    uint8_t                 update_image_index;
@@ -4840,7 +4877,7 @@ index c706c040a..000000000
 -    uint64_t                image_capsule_support; //introduced in v3
 -} efi_firmware_management_capsule_image_header_t;
 -
--typedef struct {
+-typedef __PACKED_STRUCT {
 -    uint32_t                signature;
 -    uint32_t                header_size;
 -    uint32_t                fw_version;
@@ -4849,20 +4886,20 @@ index c706c040a..000000000
 -
 -#define ANYSIZE_ARRAY 0
 -
--typedef struct {
+-typedef __PACKED_STRUCT {
 -    uint32_t                dwLength;
 -    uint16_t                wRevision;
 -    uint16_t                wCertificateType;
 -    uint8_t                 bCertificate[ANYSIZE_ARRAY];
 -} WIN_CERTIFICATE;
 -
--typedef struct {
+-typedef __PACKED_STRUCT {
 -    WIN_CERTIFICATE         hdr;
 -    struct efi_guid         cert_type;
 -    uint8_t                 cert_data[ANYSIZE_ARRAY];
 -} win_certificate_uefi_guid_t;
 -
--typedef struct {
+-typedef __PACKED_STRUCT {
 -    uint64_t                    monotonic_count;
 -    win_certificate_uefi_guid_t   auth_info;
 -} efi_firmware_image_authentication_t;
@@ -4999,13 +5036,13 @@ index a31cd8a3a..000000000
 -
 -#endif /* UEFI_CAPSULE_PARSER_H */
 diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index b183d1242..58b02229b 100644
+index f42dda809..e2219d80a 100644
 --- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 +++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 @@ -1,5 +1,5 @@
  /*
 - * Copyright (c) 2017-2024 Arm Limited. All rights reserved.
-+ * Copyright (c) 2017-2025 Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
   *
   * Licensed under the Apache License, Version 2.0 (the "License");
   * you may not use this file except in compliance with the License.
@@ -5014,7 +5051,7 @@ index b183d1242..58b02229b 100644
 =20
  /* Bank configurations */
 -#define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
--#define TFM_PARTITION_SIZE              (0x50000)    /* 320 KB */
+-#define TFM_PARTITION_SIZE              (0x50000)    /* 320 KiB */
 +#define BANK_PARTITION_SIZE               (0xFE0000)   /* 15.875 MB */
 +#define SE_BL2_PARTITION_BANK_OFFSET      (0)
 +#define TFM_PARTITION_SIZE                (0x50000)    /* 320 KB */
@@ -5029,5 +5066,5 @@ index b183d1242..58b02229b 100644
  /************************************************************/
  /* Bank : Images flash offsets are with respect to the bank */
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0019-Platform-Corstone1000-Increase-buffer-sizes.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-Corstone1=
000-Increase-buffer-sizes.patch
similarity index 64%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0019-Platform-Corstone1000-Increase-buffer-sizes.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0006-Platform-Corstone1000-Increase-buffer-sizes.patch
index ce6e1d8c..d5f3bee4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0019=
-Platform-Corstone1000-Increase-buffer-sizes.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Increase-buffer-sizes.patch
@@ -1,7 +1,7 @@
-From e3d94988f14b3004606c247b39bda5ade119545f Mon Sep 17 00:00:00 2001
+From def9095e7bfd5a82ba6cd4756e990cd9ae7307ab Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Wed, 12 Mar 2025 13:10:47 +0000
-Subject: [PATCH 2/2] Platform: Corstone1000: Increase buffer sizes
+Date: Mon, 16 Jun 2025 14:44:39 +0100
+Subject: [PATCH 6/7] Platform: Corstone1000: Increase buffer sizes
=20
 Increase PSA_MAX_ASSET_SIZE and CRYPTO_IOVEC_BUFFER_SIZE
 to accommodate large size EFI variables set by new U-Boot version.
@@ -14,14 +14,21 @@ implementing PSA FWU support.
 Upstream-Status: Backport [bd80dee733e792eadfd2115f4bfa6bad748e5ce5]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- platform/ext/target/arm/corstone1000/config_tfm_target.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ platform/ext/target/arm/corstone1000/config_tfm_target.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/config_tfm_target.h b/=
platform/ext/target/arm/corstone1000/config_tfm_target.h
-index 0b410dfd4..a65305bd4 100644
+index 4920f6708..cf13712a1 100644
 --- a/platform/ext/target/arm/corstone1000/config_tfm_target.h
 +++ b/platform/ext/target/arm/corstone1000/config_tfm_target.h
-@@ -24,11 +24,11 @@
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2022-2024, Arm Limited. All rights reserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -27,13 +27,13 @@
  #define ITS_MAX_ASSET_SIZE   2048
 =20
  /* The maximum asset size to be stored in the Protected Storage */
@@ -34,7 +41,9 @@ index 0b410dfd4..a65305bd4 100644
  /* This is also has to be increased to fit the EFI variables into the i=
ovecs. */
 -#define CRYPTO_IOVEC_BUFFER_SIZE    6000
 +#define CRYPTO_IOVEC_BUFFER_SIZE    7200
- #endif /* __CONFIG_TFM_TARGET_H__ */
+=20
+ /* The Mailbox partition is used as an NS Agent so its stack size is us=
ed to
+  * determine the PSP and PSPLIM during the SFN backend initialization. =
It has to
 --=20
-2.25.1
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-platform-CS1000-Add-multicore-support-for-FVP.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-platform-CS1000-=
Add-multicore-support-for-FVP.patch
deleted file mode 100644
index 525d9018..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-platform-CS1000-Add-multicore-support-for-FVP.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 1eb9bc330bf387ff26a6df93d3b8c843174dc40b Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Thu, 9 May 2024 13:20:57 +0000
-Subject: [PATCH 10/10] platform: CS1000: Add multicore support for FVP
-
-This changeset adds the support to enable the secondary cores for
-the Corstone-1000 FVP
-
-Upstream-Status: Backport [86383bb0ee5a99343c23c0b6fb9a1d161857a75c]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../target/arm/corstone1000/CMakeLists.txt    |  6 +++
- .../corstone1000/Device/Config/device_cfg.h   |  6 +++
- .../arm/corstone1000/tfm_hal_multi_core.c     | 38 ++++++++++++++++++-
- 3 files changed, 48 insertions(+), 2 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 95e3f57b4f..e46123cc6f 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -381,6 +381,12 @@ target_sources(tfm_psa_rot_partition_ns_agent_mailb=
ox
-         tfm_hal_multi_core.c
- )
-=20
-+if (PLATFORM_IS_FVP)
-+target_compile_definitions(tfm_psa_rot_partition_ns_agent_mailbox
-+    PUBLIC
-+    	$<$<BOOL:${ENABLE_MULTICORE}>:CORSTONE1000_FVP_MULTICORE>
-+)
-+endif()
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D tfm_spm =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
- target_sources(tfm_spm
-diff --git a/platform/ext/target/arm/corstone1000/Device/Config/device_c=
fg.h b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
-index 222905d3dd..9d48f119ed 100644
---- a/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
-+++ b/platform/ext/target/arm/corstone1000/Device/Config/device_cfg.h
-@@ -45,5 +45,11 @@
- /* CFI Controller */
- #define CFI_S
-=20
-+/* Total number of host cores */
-+#if CORSTONE1000_FVP_MULTICORE
-+#define PLATFORM_HOST_MAX_CORE_COUNT 4
-+#else
-+#define PLATFORM_HOST_MAX_CORE_COUNT 1
-+#endif
-=20
- #endif  /* __DEVICE_CFG_H__ */
-diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
-index f0e2bc333a..ce72e50c9b 100644
---- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
-+++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
-@@ -11,9 +11,14 @@
- #include "tfm_hal_multi_core.h"
- #include "fwu_agent.h"
-=20
--#define HOST_SYS_RST_CTRL_OFFSET 0x0
-+#define HOST_SYS_RST_CTRL_OFFSET     0x000
-+#define HOST_CPU_PE0_CONFIG_OFFSET   0x010
-+#define HOST_CPU_PE1_CONFIG_OFFSET   0x020
-+#define HOST_CPU_PE2_CONFIG_OFFSET   0x030
-+#define HOST_CPU_PE3_CONFIG_OFFSET   0x040
-+#define HOST_CPU_BOOT_MASK_OFFSET    0x300
- #define HOST_CPU_CORE0_WAKEUP_OFFSET 0x308
--#define HOST_CPU_PE0_CONFIG_OFFSET 0x010
-+
- #define AA64nAA32_MASK (1 << 3)
-=20
- #ifdef EXTERNAL_SYSTEM_SUPPORT
-@@ -53,9 +58,29 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
-     volatile uint32_t *PE0_CONFIG =3D
-                         (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
-                                      + HOST_CPU_PE0_CONFIG_OFFSET);
-+#if CORSTONE1000_FVP_MULTICORE
-+    volatile uint32_t *PE1_CONFIG =3D
-+                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
-+                                     + HOST_CPU_PE1_CONFIG_OFFSET);
-+    volatile uint32_t *PE2_CONFIG =3D
-+                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
-+                                     + HOST_CPU_PE2_CONFIG_OFFSET);
-+    volatile uint32_t *PE3_CONFIG =3D
-+                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
-+                                     + HOST_CPU_PE3_CONFIG_OFFSET);
-+    volatile uint32_t *CPU_BOOT_MASK =3D
-+                        (uint32_t *)(CORSTONE1000_HOST_BASE_SYSTEM_CONT=
ROL_BASE
-+		                     + HOST_CPU_BOOT_MASK_OFFSET);
-=20
-+    *CPU_BOOT_MASK =3D 0xf;
-+#endif
-     /* Select host CPU architecture as AArch64 */
-     *PE0_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
-+#if CORSTONE1000_FVP_MULTICORE
-+    *PE1_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
-+    *PE2_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
-+    *PE3_CONFIG |=3D AA64nAA32_MASK; /* 0b1 =E2=80=93 AArch64 */
-+#endif
-=20
-     /* wakeup CORE0 before bringing it out of reset */
-     *reset_ctl_wakeup_reg =3D 0x1;
-@@ -63,6 +88,15 @@ void tfm_hal_boot_ns_cpu(uintptr_t start_addr)
-     /* Clear HOST_SYS_RST_CTRL register to bring host out of RESET */
-     *reset_ctl_reg =3D 0;
-=20
-+#if CORSTONE1000_FVP_MULTICORE
-+    /* Wake up secondary cores.
-+     * This should be done after bringing the primary core out of reset=
. */
-+    for(int core_index=3D1; core_index < PLATFORM_HOST_MAX_CORE_COUNT; =
core_index++)
-+    {
-+	    *reset_ctl_wakeup_reg =3D (0x1 << core_index);
-+    }
-+#endif
-+
-     (void) start_addr;
-=20
- #ifdef EXTERNAL_SYSTEM_SUPPORT
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-Platform-CS1000-Fix-Bank-offsets.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0007-Platform-CS1000-Fix-Bank-offs=
ets.patch
deleted file mode 100644
index 218dff38..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-Platform-CS1000-Fix-Bank-offsets.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 939a39a0705ed2571fe5b842a9d5f80036f71a12 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Fri, 2 Aug 2024 22:02:55 +0200
-Subject: [PATCH 9/9] Platform: CS1000: Fix Bank offsets
-
-The BANK_0_PARTITION_OFFSET and BANK_1_PARTITION_OFFSET are used for
-erasing the banks during capsule update. The fwu_agent erases the flash
-using them as starting addresses. The BL2 (MCUBoot) should also
-be erased during capsule update.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [939a39a0705ed2571fe5b842a9d5f80036f71a12]
----
- .../ext/target/arm/corstone1000/partition/flash_layout.h    | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 07b4cdea7..f42dda809 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -109,10 +109,8 @@
- #define FWU_PRIVATE_METADATA_REPLICA_2_OFFSET   (FWU_PRIVATE_METADATA_R=
EPLICA_1_OFFSET + \
-                                                  FWU_METADATA_FLASH_SEC=
TOR_SIZE)
-=20
--#define BANK_0_PARTITION_OFFSET         (SE_BL2_BANK_0_OFFSET + \
--                                         SE_BL2_PARTITION_SIZE)
--#define BANK_1_PARTITION_OFFSET         (SE_BL2_BANK_1_OFFSET + \
--                                         SE_BL2_PARTITION_SIZE)
-+#define BANK_0_PARTITION_OFFSET         (SE_BL2_BANK_0_OFFSET)
-+#define BANK_1_PARTITION_OFFSET         (SE_BL2_BANK_1_OFFSET)
-=20
- /* BL1: mcuboot flashmap configurations */
- #define FLASH_AREA_8_ID                 (1)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch b=
/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-Plat=
form-Corstone1000-Remove-duplicate-configuration.patch
similarity index 60%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0007-Platform-Corstone1000-Remove-duplicate-configuration.patch
index 720146a6..1a95fd25 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023=
-Platform-CS1000-Remove-duplicate-configuration-parameters.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-Platform-Corstone1000-Remove-duplicate-configuration.patch
@@ -1,30 +1,34 @@
-From 456a58e4cb06c9cbdaadfc3d2e54ef21ec8405fc Mon Sep 17 00:00:00 2001
+From 038b35ac96dcdaa640bb5f641b8c028491abb9b7 Mon Sep 17 00:00:00 2001
 From: Yogesh Wani <yogesh.wani@arm.com>
-Date: Wed, 7 May 2025 16:51:27 +0000
-Subject: [PATCH] Remove duplicate configuration parameters for corstone-=
1000
+Date: Wed, 30 Apr 2025 14:39:37 +0100
+Subject: [PATCH 7/7] Platform: Corstone1000: Remove duplicate configurat=
ion
+ parameters for Corstone-1000
=20
 The PS_NUM_ASSET is duplicated in the cmake.config and the
-config_tfm_target.h file under corstone-1000. The commit removes
+config_tfm_target.h file under Corstone-1000. The commit removes
 the one from the cmake.config and keeps the one in the header file.
=20
 The whole rationale behind this is for the vendor to be able
 to override the configuration using the cmake file.
=20
-Signed-off-by: Yogesh Wani <yogesh.wani@arm.com>
 Upstream-Status: Backport [948cb8e7601dcf1fe822d855c77749287fe6d9bd]
+Signed-off-by: Yogesh Wani <yogesh.wani@arm.com>
 ---
  platform/ext/target/arm/corstone1000/config.cmake | 1 -
  1 file changed, 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/config.cmake b/platfor=
m/ext/target/arm/corstone1000/config.cmake
-index 6a805a1220..708bacaedf 100644
+index f1de066e5..cf4d63f61 100644
 --- a/platform/ext/target/arm/corstone1000/config.cmake
 +++ b/platform/ext/target/arm/corstone1000/config.cmake
-@@ -68,4 +68,3 @@ endif()
+@@ -74,7 +74,6 @@ endif()
  # Platform-specific configurations
  set(CONFIG_TFM_USE_TRUSTZONE            OFF)
  set(TFM_MULTI_CORE_TOPOLOGY             ON)
 -set(PS_NUM_ASSETS                       "40"        CACHE STRING    "Th=
e maximum number of assets to be stored in the Protected Storage area")
---
-2.34.1
+=20
+ set(MCUBOOT_USE_PSA_CRYPTO            ON               CACHE BOOL      =
"Enable the cryptographic abstraction layer to use PSA Crypto APIs")
+ set(MCUBOOT_SIGNATURE_TYPE            "EC-P256"        CACHE STRING    =
"Algorithm to use for signature validation [RSA-2048, RSA-3072, EC-P256, =
EC-P384]")
+--=20
+2.43.0
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-CS1000-Increase-BL2-partition-size.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-CS1000-In=
crease-BL2-partition-size.patch
deleted file mode 100644
index 7c2a6325..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-CS1000-Increase-BL2-partition-size.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From ddd4abdb3893e284a35303e4a5ac7b6ad2ed8320 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Tue, 16 Jul 2024 21:04:49 +0200
-Subject: [PATCH] Platform: CS1000: Increase BL2 partition size
-
-Enabling secure debug increases the BL2 code size considerably. This
-patch increases the BL2 partition size to enable secure debug feature
-on Corstone-1000. The TF-M partition size has to be decreased for this.
-The RAM_MPU_REGION_BLOCK_1_SIZE had to be aligned with the changes to
-fully cover the S_DATA.
-
-Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [https://review.trustedfirmware.org/c/TF-M/tru=
sted-firmware-m/+/30406]
----
- .../ext/target/arm/corstone1000/CMakeLists.txt     |  9 ++++++---
- .../target/arm/corstone1000/create-flash-image.sh  | 14 ++++++++------
- .../arm/corstone1000/partition/flash_layout.h      |  4 ++--
- 3 files changed, 16 insertions(+), 11 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index b13dc26c0e..3ba26e0de7 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -44,10 +44,13 @@ target_compile_definitions(platform_region_defs
-         # The RAM MPU Region block sizes are calculated manually. The R=
AM has to be covered
-         # with the MPU regions. These regions also have to be the power=
 of 2 and
-         # the start addresses have to be aligned to these sizes. The si=
zes can be calculated
--        # from the S_DATA_START and S_DATA_SIZE defines.
--        RAM_MPU_REGION_BLOCK_1_SIZE=3D0x4000
-+        # from the S_DATA_START and S_DATA_SIZE defines the following w=
ay:
-+        # S_DATA_SIZE =3D RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGION_=
BLOCK_2_SIZE
-+        # And the following constraints have to be taken:
-+        # S_DATA_START % RAM_MPU_REGION_BLOCK_1_SIZE =3D 0
-+        # (S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE) % RAM_MPU_REGION=
_BLOCK_2_SIZE =3D 0
-+        RAM_MPU_REGION_BLOCK_1_SIZE=3D0x10000
-         RAM_MPU_REGION_BLOCK_2_SIZE=3D0x20000
--
- )
- #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D Platform common defs =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D#
-=20
-diff --git a/platform/ext/target/arm/corstone1000/create-flash-image.sh =
b/platform/ext/target/arm/corstone1000/create-flash-image.sh
-index a6be61384f..06f0d1ec9a 100755
---- a/platform/ext/target/arm/corstone1000/create-flash-image.sh
-+++ b/platform/ext/target/arm/corstone1000/create-flash-image.sh
-@@ -1,6 +1,6 @@
- #!/bin/bash
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2023, Arm Limited. All rights reserved.
-+# Copyright (c) 2023-2024, Arm Limited. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -65,6 +65,8 @@ FWU_METADATA_TYPE_UUID=3D"8A7A84A0-8387-40F6-AB41-A8B9=
A5A60D23"
- PRIVATE_METADATA_TYPE_UUID=3D"ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42"
- SE_BL2_TYPE_UUID=3D"64BD8ADB-02C0-4819-8688-03AB4CAB0ED9"
- TFM_TYPE_UUID=3D"D763C27F-07F6-4FF0-B2F3-060CB465CD4E"
-+SE_BL2_PARTITION_SIZE=3D"+144k"
-+TFM_S_PARTITION_SIZE=3D"+320K"
-=20
- # Create the image
- rm -f $IMAGE
-@@ -81,10 +83,10 @@ sgdisk  --mbrtogpt \
-         --new=3D3:48:+4K --typecode=3D3:$FWU_METADATA_TYPE_UUID --parti=
tion-guid=3D3:$(uuidgen) --change-name=3D3:'Bkup-FWU-Metadata' \
-         --new=3D4:56:+4K --typecode=3D4:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D4:$(uuidgen) --change-name=3D4:'private_metadata_replica_=
1' \
-         --new=3D5:64:+4k --typecode=3D5:$PRIVATE_METADATA_TYPE_UUID --p=
artition-guid=3D5:$(uuidgen) --change-name=3D5:'private_metadata_replica_=
2' \
--        --new=3D6:72:+100k --typecode=3D6:$SE_BL2_TYPE_UUID --partition=
-guid=3D6:$(uuidgen) --change-name=3D6:'bl2_primary' \
--        --new=3D7:272:+368K --typecode=3D7:$TFM_TYPE_UUID --partition-g=
uid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
--        --new=3D8:32784:+100k --typecode=3D8:$SE_BL2_TYPE_UUID --partit=
ion-guid=3D8:$(uuidgen) --change-name=3D8:'bl2_secondary' \
--        --new=3D9:32984:+368K --typecode=3D9:$TFM_TYPE_UUID --partition=
-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
-+        --new=3D6:72:$SE_BL2_PARTITION_SIZE --typecode=3D6:$SE_BL2_TYPE=
_UUID --partition-guid=3D6:$(uuidgen) --change-name=3D6:'bl2_primary' \
-+        --new=3D7:360:$TFM_S_PARTITION_SIZE --typecode=3D7:$TFM_TYPE_UU=
ID --partition-guid=3D7:$(uuidgen) --change-name=3D7:'tfm_primary' \
-+        --new=3D8:32784:$SE_BL2_PARTITION_SIZE --typecode=3D8:$SE_BL2_T=
YPE_UUID --partition-guid=3D8:$(uuidgen) --change-name=3D8:'bl2_secondary=
' \
-+        --new=3D9:33072:$TFM_S_PARTITION_SIZE --typecode=3D9:$TFM_TYPE_=
UUID --partition-guid=3D9:$(uuidgen) --change-name=3D9:'tfm_secondary' \
-         --new=3D10:65496:65501  --partition-guid=3D10:$(uuidgen) --chan=
ge-name=3D10:'reserved_2' \
-         $IMAGE
-=20
-@@ -93,7 +95,7 @@ sgdisk  --mbrtogpt \
- # Write partitions
- # conv=3Dnotrunc avoids truncation to keep the geometry of the image.
- dd if=3D$BIN_DIR/bl2_signed.bin of=3D${IMAGE}  seek=3D72 conv=3Dnotrunc
--dd if=3D$BIN_DIR/tfm_s_signed.bin of=3D${IMAGE} seek=3D272 conv=3Dnotru=
nc
-+dd if=3D$BIN_DIR/tfm_s_signed.bin of=3D${IMAGE} seek=3D360 conv=3Dnotru=
nc
-=20
- # Print the gpt table
- sgdisk -p $IMAGE
-diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index 9fc1d9fa63..73c430ce57 100644
---- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-+++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-@@ -92,7 +92,7 @@
- #define FLASH_DEV_NAME_BL1              FLASH_DEV_NAME
-=20
- /* Static Configurations of the Flash */
--#define SE_BL2_PARTITION_SIZE           (0x18000)    /* 96 KB */
-+#define SE_BL2_PARTITION_SIZE           (0x24000)    /* 144 KB */
- #define SE_BL2_BANK_0_OFFSET            (0x9000)  /* 72nd LBA */
- #define SE_BL2_BANK_1_OFFSET            (0x1002000)  /* 32784th LBA */
-=20
-@@ -137,7 +137,7 @@
-=20
- /* Bank configurations */
- #define BANK_PARTITION_SIZE             (0xFE0000)   /* 15.875 MB */
--#define TFM_PARTITION_SIZE              (0x5C000)    /* 368 KB */
-+#define TFM_PARTITION_SIZE              (0x50000)    /* 320 KB */
-=20
- /************************************************************/
- /* Bank : Images flash offsets are with respect to the bank */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008-Platform-=
Corstone1000-Increase-BL1-size-and-align-bi.patch
new file mode 100644
index 00000000..65cecc2f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-Platform-Corstone1000-Increase-BL1-size-and-align-bi.patch
@@ -0,0 +1,93 @@
+From d708753e317c89dead0759e3ffa6ecabef5a84a3 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 21 Aug 2025 09:12:25 +0000
+Subject: [PATCH 1/2] Platform: Corstone1000: Increase BL1 size and align
+ binary addresses
+
+The move to Trusted-Firmware-M v2.2.1 makes the BL1 code larger,
+while the provisioning bundle can be trimmed.  At the same time BL2 and
+TF-M binary addresses now need to begin on a 0x100-byte boundary for
+Cortex-M0+ based platforms.
+
+Key changes
+--------------------------------
+- Increase `BL1_1_CODE_SIZE` to 58KB to accommodate the v2.2.1 binaries.
+- Reduce `PROVISIONING_DATA_SIZE` to 6KB.
+- `BL2_CODE_START` and `S_CODE_START` are aligned to 0x100 byte boundary
+   so both start addresses are an exact multiple of 0x100.
+
+Upstream-Status: Backport [d56178638a49c8c964aab3bff69ed8396dd6d8fc]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ .../arm/corstone1000/partition/region_defs.h  | 29 ++++++++++---------
+ 1 file changed, 15 insertions(+), 14 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/partition/region_defs.=
h b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+index 3e1294484..92e01c0e3 100644
+--- a/platform/ext/target/arm/corstone1000/partition/region_defs.h
++++ b/platform/ext/target/arm/corstone1000/partition/region_defs.h
+@@ -24,6 +24,10 @@
+ #include "flash_layout.h"
+ #include "bl1_2_config.h"
+=20
++/* Align address to 0x100 bytes boundary */
++#define ADDR_ALIGN               0x100
++#define ALIGN_UP_100(addr)       (((addr + (ADDR_ALIGN - 1)) / ADDR_ALI=
GN) * ADDR_ALIGN)
++
+ /* BL1_1 */
+ #define BL1_1_HEAP_SIZE         (0x0001000) /* 4KiB */
+ #define BL1_1_MSP_STACK_SIZE    (0x0001800) /* 6KiB */
+@@ -43,14 +47,10 @@
+=20
+ #define BOOT_TFM_SHARED_DATA_SIZE (0x400)
+=20
+-#define IMAGE_TFM_CODE_SIZE \
+-            (TFM_PARTITION_SIZE - BL2_HEADER_SIZE - BL2_TRAILER_SIZE)
+-
+-#define IMAGE_BL2_CODE_SIZE \
+-            (SE_BL2_PARTITION_SIZE - TFM_BL1_2_HEADER_MAX_SIZE)
+-
+ /* Secure regions */
+-#define S_CODE_START            (SRAM_BASE + BL2_HEADER_SIZE)
++#define S_CODE_START            ALIGN_UP_100(SRAM_BASE + BL2_HEADER_SIZ=
E)
++#define S_CODE_ALIGNMENT_DIFF   (S_CODE_START - (SRAM_BASE + BL2_HEADER=
_SIZE))
++#define IMAGE_TFM_CODE_SIZE     (TFM_PARTITION_SIZE - BL2_HEADER_SIZE -=
 BL2_TRAILER_SIZE - S_CODE_ALIGNMENT_DIFF)
+ #define S_CODE_SIZE             (IMAGE_TFM_CODE_SIZE)
+ #define S_CODE_LIMIT            (S_CODE_START + S_CODE_SIZE - 1)
+=20
+@@ -80,12 +80,13 @@
+ #define SECONDARY_PARTITION_START 0
+ #define SECONDARY_PARTITION_SIZE (TFM_PARTITION_SIZE)
+=20
+-
+ /* SE BL2 regions */
+-#define BL2_IMAGE_START   (SRAM_BASE + SRAM_SIZE - SE_BL2_PARTITION_SIZ=
E)
+-#define BL2_CODE_START    (BL2_IMAGE_START + TFM_BL1_2_HEADER_MAX_SIZE)
+-#define BL2_CODE_SIZE     (IMAGE_BL2_CODE_SIZE)
+-#define BL2_CODE_LIMIT    (BL2_CODE_START + BL2_CODE_SIZE - 1)
++#define BL2_IMAGE_START            (SRAM_BASE + SRAM_SIZE - SE_BL2_PART=
ITION_SIZE)
++#define BL2_CODE_START             ALIGN_UP_100(BL2_IMAGE_START + TFM_B=
L1_2_HEADER_MAX_SIZE)
++#define BL2_CODE_ALIGNMENT_DIFF    (BL2_CODE_START - (BL2_IMAGE_START +=
 TFM_BL1_2_HEADER_MAX_SIZE))
++#define IMAGE_BL2_CODE_SIZE        (SE_BL2_PARTITION_SIZE - TFM_BL1_2_H=
EADER_MAX_SIZE - BL2_CODE_ALIGNMENT_DIFF)
++#define BL2_CODE_SIZE              (IMAGE_BL2_CODE_SIZE)
++#define BL2_CODE_LIMIT             (BL2_CODE_START + BL2_CODE_SIZE - 1)
+=20
+ #define BL2_DATA_START    (S_DATA_START)
+ #define BL2_DATA_SIZE     (BL2_IMAGE_START - BL2_DATA_START)
+@@ -93,11 +94,11 @@
+=20
+ /* SE BL1 regions */
+ #define BL1_1_CODE_START    (0)
+-#define BL1_1_CODE_SIZE     (0x0000C800)     /* 50 KiB */
++#define BL1_1_CODE_SIZE     (0x0000E800)     /* 58 KiB */
+ #define BL1_1_CODE_LIMIT    (BL1_1_CODE_START + BL1_1_CODE_SIZE - 1)
+=20
+ #define PROVISIONING_DATA_START (BL1_1_CODE_START + BL1_1_CODE_SIZE)
+-#define PROVISIONING_DATA_SIZE  (0x00002000)     /* 8 KiB */
++#define PROVISIONING_DATA_SIZE  (0x00001800)     /* 6 KiB */
+ #define PROVISIONING_DATA_LIMIT (PROVISIONING_DATA_START + PROVISIONING=
_DATA_SIZE - 1)
+=20
+ #define BL1_1_DATA_START    (SRAM_BASE)
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-CC312-ADAC-Add-=
PSA_WANT_ALG_SHA_256-definition.patch
deleted file mode 100644
index 4254d684..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 756cfad0cc05e7f4c02faa74aea14962aa54420c Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 31 Jul 2024 13:38:09 +0200
-Subject: [PATCH 2/3] CC312: ADAC: Add PSA_WANT_ALG_SHA_256 definition
-
-The bl2_mbedcrypto_config is linked to the psa_adac_cc312 target so
-the MCUBOOT_PSA_CRYPTO_CONFIG_FILEPATH and
-MCUBOOT_MBEDCRYPTO_CONFIG_FILEPATH configs are used for the ADAC driver
-too. The MCUBOOT_USE_PSA_CRYPTO is OFF by default, that means the
-MCUBOOT_PSA_CRYPTO_CONFIG_FILEPATH is not included during the build so
-the PSA_WANT_ALG_SHA_256 is not defined for the ADAC driver. Because
-of this, the PSA_HASH_MAX_SIZE is not set correctly for the sources
-of the psa_adac_cc312 target. This caused runtime issues.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [d7a6a86ee9adc65317c6d2a9962bfa4f093fa4ce]
----
- platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt b/pl=
atform/ext/accelerator/cc312/psa-adac/CMakeLists.txt
-index cb0553b40a..d7f5a54f3c 100644
---- a/platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt
-+++ b/platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt
-@@ -1,5 +1,5 @@
- #----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2023, Arm Limited. All rights reserved.
-+# Copyright (c) 2020-2024, Arm Limited. All rights reserved.
- #
- # SPDX-License-Identifier: BSD-3-Clause
- #
-@@ -32,6 +32,7 @@ target_compile_options(psa_adac_cc312
-         -DCC_IOT
-         -DUSE_MBEDTLS_CRYPTOCELL
-         -D_INTERNAL_CC_NO_RSA_SCHEME_15_SUPPORT
-+        -DPSA_WANT_ALG_SHA_256
- )
-=20
- target_link_libraries(psa_adac_cc312
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-Platform-=
CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
new file mode 100644
index 00000000..65a90742
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.patch
@@ -0,0 +1,45 @@
+From 31d3a21a2012d64c7acff55183477c7593ef4b31 Mon Sep 17 00:00:00 2001
+From: Antonio de Angelis <Antonio.deAngelis@arm.com>
+Date: Fri, 18 Apr 2025 21:00:55 +0100
+Subject: [PATCH] Platform: CS1K: Adapt ADAC enabled build to the new BL2=
 build
+ restructure
+
+The BL2 build was restructured in order to always migrate to use
+MCUBOOT_USE_PSA_CRYPTO and then support hardware crypto drivers
+through the PSA driver interface instead of the _ALT interface
+which will be deprecated in newer versions of Mbed TLS. The ADAC
+enabled library will then use PSA Crypto APIs through the thin
+PSA Crypto core which is available in the BL2 build, without the
+need to link the old driver through psa_adac_cc312.
+
+Upstream-Status: Backport [36cc3a7cda2356d3a256e1271b75a93f35531b2f]
+Signed-off-by: Antonio de Angelis <antonio.deangelis@arm.com>
+Change-Id: I413116406ee18506ed3bcfe83ce7709542ea6f47
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ platform/ext/target/arm/corstone1000/CMakeLists.txt | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
+index 6105c951b..ca5a034e3 100644
+--- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
++++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
+@@ -436,15 +436,6 @@ if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
+             trusted-firmware-m-psa-adac
+     )
+=20
+-    target_link_libraries(trusted-firmware-m-psa-adac
+-        PRIVATE
+-            psa_adac_cc312
+-    )
+-
+-    target_link_libraries(psa_adac_psa_crypto
+-        PRIVATE
+-            bl2_mbedcrypto_config
+-    )
+ endif()
+=20
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-CS1000-Ad=
d-crypto-configs-for-ADAC.patch
deleted file mode 100644
index 047e052a..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8d6ed0ac3b1eee4b1e279993ec351e9bd80b68dc Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 31 Jul 2024 13:38:27 +0200
-Subject: [PATCH] Platform: CS1000: Add crypto configs for ADAC
-
-The psa_adac_psa_crypto target needs the MBEDTLS_CONFIG_FILE and
-MBEDTLS_PSA_CRYPTO_CONFIG_FILE defines in order to build correctly.
-The default crypto config files are used here.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [06c0515a508ccbf60620e9337d5283bd00cd218c]
----
- platform/ext/target/arm/corstone1000/CMakeLists.txt | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 530c4059d..3709bf3ec 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -412,6 +412,18 @@ if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
-         PRIVATE
-             platform_bl2
-     )
-+
-+    target_compile_definitions(psa_adac_psa_crypto
-+        PRIVATE
-+            MBEDTLS_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/mbedcryp=
to/mbedcrypto_config/tfm_mbedcrypto_config_default.h"
-+            MBEDTLS_PSA_CRYPTO_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/e=
xt/mbedcrypto/mbedcrypto_config/crypto_config_default.h"
-+    )
-+
-+    target_link_libraries(psa_adac_psa_crypto
-+        PRIVATE
-+            psa_crypto_library_config
-+    )
-+
- endif()
-=20
- find_package(Python3)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Platform-CS1000-Fix-platform-name-in-logs.patch b/meta-arm-bsp/re=
cipes-bsp/trusted-firmware-m/files/corstone1000/0011-Platform-CS1000-Fix-=
platform-name-in-logs.patch
deleted file mode 100644
index 96ba3c1e..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-Platform-CS1000-Fix-platform-name-in-logs.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8f0cd9710be508adab91d8b5ab5aa2d39e89c287 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Wed, 31 Jul 2024 19:57:33 +0200
-Subject: [PATCH] Platform: CS1000: Fix platform name in logs
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [c3fa68995b247c802589890c6ea3e721127b0c78]
----
- platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-index 8aacd877e4..f5baf08cb4 100644
---- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-+++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-@@ -192,7 +192,7 @@ int32_t boot_platform_post_init(void)
-         }
-=20
-         result =3D tfm_to_psa_adac_corstone1000_secure_debug(secure_deb=
ug_rotpk, 32);
--        BOOT_LOG_INF("%s: dipda_secure_debug is a %s.\r\n", __func__,
-+        BOOT_LOG_INF("%s: Corstone-1000 Secure Debug is a %s.\r\n", __f=
unc__,
-                 (result =3D=3D 0) ? "success" : "failure");
-=20
-     }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-CS1000-Fix=
-compiler-switch-in-BL1.patch
deleted file mode 100644
index b2ae4bc5..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From 09827a44518b05a2cc58602dda18474973abfb83 Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Thu, 5 Sep 2024 17:28:56 +0200
-Subject: [PATCH 3/5] Platform: CS1000: Fix compiler switch in BL1
-
-The fwu_agent.c used the "BL1" definition to check if the source file
-is building for the BL1 or for the TFM_S target.
-But the "BL1" definition is added to the build flags for every file
-that links against platform_region_defs, see
-tfm/cmake/spe-CMakeLists.cmake:
-
-target_compile_definitions(platform_region_defs
-    INTERFACE
-        $<$<BOOL:${BL1}>:BL1>
-       ....
-)
-
-This means the "#if BL1" condition was true for both cases.
-
-This commit:
-- Adds a new definition that is only added to the
-  platform_bl1_1 target.
-- Fixes the #elif with no expression error that came up.
-- Moves the partition table loading because previously it was not
-  loaded during the runtime TFM_S execution, only in BL2.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [f25649cc0de56f360069c6128670f7533ba5e14d]
----
- .../target/arm/corstone1000/CMakeLists.txt    |  7 ++++
- .../corstone1000/fw_update_agent/fwu_agent.c  | 33 +++++++++----------
- 2 files changed, 23 insertions(+), 17 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 89db1732a9..f6880cba3c 100644
---- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
-+++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
-@@ -144,6 +144,7 @@ target_sources(platform_s
-         partition/gpt.c
-         $<$<NOT:$<BOOL:${PLATFORM_DEFAULT_OTP}>>:${PLATFORM_DIR}/ext/ac=
celerator/cc312/otp_cc312.c>
-         rse_comms_permissions_hal.c
-+        platform.c
- )
-=20
- if (PLATFORM_IS_FVP)
-@@ -213,6 +214,12 @@ target_compile_definitions(platform_bl1_1
-         $<$<BOOL:${CRYPTO_HW_ACCELERATOR_OTP_PROVISIONING}>:CRYPTO_HW_A=
CCELERATOR_OTP_PROVISIONING>
-         MBEDTLS_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/mbedcrypto/m=
bedcrypto_config/tfm_mbedcrypto_config_default.h"
-         MBEDTLS_PSA_CRYPTO_CONFIG_FILE=3D"${CMAKE_SOURCE_DIR}/lib/ext/m=
bedcrypto/mbedcrypto_config/crypto_config_default.h"
-+
-+        # This definition is only added to the bl1_main target. There a=
re
-+        # files that are shared between the BL1 and TFM_S targets. This=
 flag
-+        # can be used if the BL1 target needs different implementation =
than
-+        # the TFM_S target.
-+        BL1_BUILD
- )
-=20
- target_include_directories(platform_bl1_1_interface
-diff --git a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_ag=
ent.c b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-index 2b69447dc5..9890eeaf90 100644
---- a/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-+++ b/platform/ext/target/arm/corstone1000/fw_update_agent/fwu_agent.c
-@@ -21,7 +21,7 @@
- #include "uefi_fmp.h"
- #include "uart_stdout.h"
- #include "soft_crc.h"
--#if !BL1
-+#ifndef BL1_BUILD
- #include "partition.h"
- #include "platform.h"
- #endif
-@@ -197,7 +197,7 @@ extern ARM_DRIVER_FLASH FWU_METADATA_FLASH_DEV;
-=20
- #define HOST_ACK_TIMEOUT_SEC    (6 * 60) /* ~seconds, not exact */
-=20
--#if BL1
-+#ifdef BL1_BUILD
- static enum fwu_agent_error_t private_metadata_read(
-         struct fwu_private_metadata* p_metadata)
- {
-@@ -220,7 +220,7 @@ static enum fwu_agent_error_t private_metadata_read(
-=20
-     return FWU_AGENT_SUCCESS;
- }
--#elif
-+#else
- static enum fwu_agent_error_t private_metadata_read(
-         struct fwu_private_metadata* p_metadata)
- {
-@@ -253,7 +253,7 @@ static enum fwu_agent_error_t private_metadata_read(
- }
- #endif
-=20
--#if BL1
-+#ifdef BL1_BUILD
- static enum fwu_agent_error_t private_metadata_write(
-         struct fwu_private_metadata* p_metadata)
- {
-@@ -280,7 +280,7 @@ static enum fwu_agent_error_t private_metadata_write=
(
-     FWU_LOG_MSG("%s: success\n\r", __func__);
-     return FWU_AGENT_SUCCESS;
- }
--#elif
-+#else
- static enum fwu_agent_error_t private_metadata_write(
-         struct fwu_private_metadata* p_metadata)
- {
-@@ -339,7 +339,7 @@ static enum fwu_agent_error_t metadata_validate(stru=
ct fwu_metadata *p_metadata)
-     return FWU_AGENT_SUCCESS;
- }
-=20
--#if BL1
-+#ifdef BL1_BUILD
- static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
- {
-     int ret;
-@@ -362,7 +362,7 @@ static enum fwu_agent_error_t metadata_read_without_=
validation(struct fwu_metada
-=20
-     return FWU_AGENT_SUCCESS;
- }
--#elif
-+#else
- static enum fwu_agent_error_t metadata_read_without_validation(struct f=
wu_metadata *p_metadata)
- {
-     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-@@ -396,7 +396,7 @@ static enum fwu_agent_error_t metadata_read_without_=
validation(struct fwu_metada
- }
- #endif
-=20
--#if BL1
-+#ifdef BL1_BUILD
- static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
- {
-     int ret;
-@@ -423,7 +423,7 @@ static enum fwu_agent_error_t metadata_read(struct f=
wu_metadata *p_metadata)
-=20
-     return FWU_AGENT_SUCCESS;
- }
--#elif
-+#else
- static enum fwu_agent_error_t metadata_read(struct fwu_metadata *p_meta=
data)
- {
-     uuid_t metadata_uuid =3D FWU_METADATA_TYPE_UUID;
-@@ -461,7 +461,7 @@ static enum fwu_agent_error_t metadata_read(struct f=
wu_metadata *p_metadata)
- #endif
-=20
-=20
--#if BL1
-+#ifdef BL1_BUILD
- static enum fwu_agent_error_t metadata_write(
-                         struct fwu_metadata *p_metadata)
- {
-@@ -503,7 +503,7 @@ static enum fwu_agent_error_t metadata_write(
-                   p_metadata->active_index, p_metadata->previous_active=
_index);
-     return FWU_AGENT_SUCCESS;
- }
--#elif
-+#else
- static enum fwu_agent_error_t metadata_write(
-                         struct fwu_metadata *p_metadata)
- {
-@@ -567,11 +567,15 @@ enum fwu_agent_error_t fwu_metadata_init(void)
-     enum fwu_agent_error_t ret;
-     ARM_FLASH_INFO* flash_info;
-=20
--
-     if (is_initialized) {
-         return FWU_AGENT_SUCCESS;
-     }
-=20
-+    #ifndef BL1_BUILD
-+    plat_io_storage_init();
-+    partition_init(PLATFORM_GPT_IMAGE);
-+    #endif
-+
-     /* Code assumes everything fits into a sector */
-     if (sizeof(struct fwu_metadata) > FWU_METADATA_FLASH_SECTOR_SIZE) {
-         return FWU_AGENT_ERROR;
-@@ -605,11 +609,6 @@ enum fwu_agent_error_t fwu_metadata_provision(void)
-=20
-     FWU_LOG_MSG("%s: enter\n\r", __func__);
-=20
--#if !BL1
--    plat_io_storage_init();
--    partition_init(PLATFORM_GPT_IMAGE);
--#endif
--
-     ret =3D fwu_metadata_init();
-     if (ret) {
-         return ret;
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015-Platform-co=
rstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
deleted file mode 100644
index 0c1b53c0..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 47593ccd1b2a2210c0860d1670005780836f120b Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Mon, 18 Nov 2024 11:40:25 +0000
-Subject: [PATCH] Platform: corstone1000: Permit FWU calls in RSE-COMMS
-
-Allow FWU calls to be dispatched by the RSE-COMMS for Corstone-1000.
-This change is required to allow the transmission of PSA FWU related
-calls between Cortex A and Cortex M side on Corstone-1000.
-For every PSA call from A side, the RSE-COMMS at M side validates, if th=
e
-call is allowed or not.
-
-Upstream-Status: Backport [b1123e3bf99000dd45992c0638c8f9ae7dba2ed8]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- .../corstone1000/rse_comms_permissions_hal.c  | 22 +++++++++++++++++++
- 1 file changed, 22 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/rse_comms_permissions_=
hal.c b/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
-index 59724bc94..58ade2026 100644
---- a/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
-+++ b/platform/ext/target/arm/corstone1000/rse_comms_permissions_hal.c
-@@ -33,6 +33,9 @@
- #ifdef TFM_PARTITION_INTERNAL_TRUSTED_STORAGE
- #include "tfm_its_defs.h"
- #endif /* TFM_PARTITION_INTERNAL_TRUSTED_STORAGE */
-+#ifdef TFM_PARTITION_FIRMWARE_UPDATE
-+#include "tfm_fwu_defs.h"
-+#endif /* TFM_PARTITION_FIRMWARE_UPDATE */
-=20
- #define INVALID_REGION_COUNTER_MAX  128
- #define INVALID_SERVICE_COUNTER_MAX 64
-@@ -165,6 +168,25 @@ enum tfm_plat_err_t comms_permissions_service_check=
(psa_handle_t handle,
-     case TFM_DPE_SERVICE_HANDLE:
-         return TFM_PLAT_ERR_SUCCESS;
- #endif /* TFM_PARTITION_DPE */
-+
-+#ifdef TFM_PARTITION_FIRMWARE_UPDATE
-+    case TFM_FIRMWARE_UPDATE_SERVICE_HANDLE:
-+        switch(type) {
-+        case TFM_FWU_START:
-+        case TFM_FWU_WRITE:
-+        case TFM_FWU_FINISH:
-+        case TFM_FWU_CANCEL:
-+        case TFM_FWU_INSTALL:
-+        case TFM_FWU_CLEAN:
-+        case TFM_FWU_REJECT:
-+        case TFM_FWU_REQUEST_REBOOT:
-+        case TFM_FWU_ACCEPT:
-+        case TFM_FWU_QUERY:
-+            return TFM_PLAT_ERR_SUCCESS;
-+        default:
-+            goto out_err;
-+	}
-+#endif /* TFM_PARTITION_FIRMWARE_UPDATE */
-     default:
-         goto out_err;
-     }
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0016-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-FWU-Make-=
platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
deleted file mode 100644
index 5c503141..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016=
-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 5afc6fde140e4033c4b69450daed42c6a3dea2bc Mon Sep 17 00:00:00 2001
-From: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Date: Wed, 30 Oct 2024 09:54:49 +0000
-Subject: [PATCH] FWU: Make platform specific TFM_FWU_BOOTLOADER_LIB sele=
ctable
- to add
-
-Prepare the environment where partition firmware update can be
-enabled and platform specific bootloader configuration can be used.
-
-FWU implementation provides an abstraction for the bootloader.
-This bootloader abstraction layer is implemented for MCUBoot.
-It can be used after making changes that can handle platform
-specific behaviors. But the implementation limits it.
-
-When TFM_PARTITION_FIRMWARE_UPDATE is enabled, the configuration
-becomes invalid. Therefore, the invalid configuration is limited
-to the case where TFM_FWU_BOOTLOADER_LIB is used for MCUboot.
-This makes the configuration valid when a platform specific
-configuration is used.
-
-TFM_FWU_BOOTLOADER_LIB can only be added from a subdirectory, which
-prevents the use of platform-specific bootloader configurations.
-The logic has been changed to allow the use of platform-specific
-bootloader configurations.
-
-Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
-
-Upstream-Status: Backport [3357369d7b878b8e8ad9515f821ac2226ec7fb18]
----
- config/check_config.cmake                           |  2 +-
- secure_fw/partitions/firmware_update/CMakeLists.txt | 12 ++++++++----
- 2 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/config/check_config.cmake b/config/check_config.cmake
-index 1039b22f9..d1929f6da 100644
---- a/config/check_config.cmake
-+++ b/config/check_config.cmake
-@@ -63,7 +63,7 @@ tfm_invalid_config(TFM_NS_NV_COUNTER_AMOUNT GREATER 3)
-=20
- tfm_invalid_config(NOT PLATFORM_HAS_FIRMWARE_UPDATE_SUPPORT AND TFM_PAR=
TITION_FIRMWARE_UPDATE)
- tfm_invalid_config(TFM_PARTITION_FIRMWARE_UPDATE AND NOT TFM_PARTITION_=
PLATFORM)
--tfm_invalid_config((MCUBOOT_UPGRADE_STRATEGY STREQUAL "DIRECT_XIP" OR M=
CUBOOT_UPGRADE_STRATEGY STREQUAL "RAM_LOAD") AND TFM_PARTITION_FIRMWARE_U=
PDATE)
-+tfm_invalid_config((MCUBOOT_UPGRADE_STRATEGY STREQUAL "DIRECT_XIP" OR M=
CUBOOT_UPGRADE_STRATEGY STREQUAL "RAM_LOAD") AND TFM_PARTITION_FIRMWARE_U=
PDATE AND TFM_FWU_BOOTLOADER_LIB STREQUAL "mcuboot")
- tfm_invalid_config(TFM_PARTITION_FIRMWARE_UPDATE AND NOT MCUBOOT_DATA_S=
HARING)
-=20
- ####################### Protected Storage Partition ###################=
############
-diff --git a/secure_fw/partitions/firmware_update/CMakeLists.txt b/secur=
e_fw/partitions/firmware_update/CMakeLists.txt
-index b249597b9..ecb90e0f0 100644
---- a/secure_fw/partitions/firmware_update/CMakeLists.txt
-+++ b/secure_fw/partitions/firmware_update/CMakeLists.txt
-@@ -37,11 +37,15 @@ target_sources(tfm_partitions
-         ${CMAKE_BINARY_DIR}/generated/secure_fw/partitions/firmware_upd=
ate/auto_generated/load_info_tfm_firmware_update.c
- )
-=20
--# The bootloader specific configuration.
--if ((NOT TFM_FWU_BOOTLOADER_LIB) OR (NOT EXISTS ${CMAKE_CURRENT_SOURCE_=
DIR}/bootloader/${TFM_FWU_BOOTLOADER_LIB}))
--    message(FATAL_ERROR "TFM_FWU_BOOTLOADER_LIB invalid")
-+# Use platform specific bootloader configuration if present.
-+if ((TFM_FWU_BOOTLOADER_LIB) AND (EXISTS ${TFM_FWU_BOOTLOADER_LIB}))
-+    add_subdirectory(${TFM_FWU_BOOTLOADER_LIB} ${CMAKE_CURRENT_BINARY_D=
IR}/${TFM_FWU_BOOTLOADER_LIB})
-+else()
-+    if ((NOT TFM_FWU_BOOTLOADER_LIB) OR (NOT EXISTS ${CMAKE_CURRENT_SOU=
RCE_DIR}/bootloader/${TFM_FWU_BOOTLOADER_LIB}))
-+        message(FATAL_ERROR "TFM_FWU_BOOTLOADER_LIB invalid")
-+    endif()
-+    add_subdirectory(bootloader/${TFM_FWU_BOOTLOADER_LIB})
- endif()
--add_subdirectory(bootloader/${TFM_FWU_BOOTLOADER_LIB})
-=20
- target_link_libraries(tfm_psa_rot_partition_fwu
-     PRIVATE
---=20
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 2c35c207..e0a0745c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -6,6 +6,10 @@ TFM_PLATFORM =3D "arm/corstone1000"
=20
 TFM_DEBUG =3D "1"
=20
+# These dependencies are needed for TF-M v2.2.0 and above
+# https://github.com/TrustedFirmware-M/trusted-firmware-m/blob/TF-Mv2.2.=
0/tools/requirements.txt
+DEPENDS:append =3D " clang-native python3-rich-native python3-pyelftools=
-native"
+
 ## Default is the MPS3 board
 TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
@@ -20,26 +24,15 @@ SRC_URI +=3D " \
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
 SRC_URI:append:corstone1000 =3D " \
-    file://0001-Platform-Corstone1000-Enable-firewall-in-FVP.patch \
-    file://0002-Platform-CS1000-Increase-ITS-max-asset-size.patch \
-    file://0003-Platform-CS1000-Increase-RSE_COMMS-buffer-size.patch \
-    file://0004-Platform-CS1000-Increase-buffers-for-EFI-vars.patch \
-    file://0005-Platform-CS1000-Increase-flash-PS-area-size.patch \
-    file://0006-platform-CS1000-Add-multicore-support-for-FVP.patch \
-    file://0007-Platform-CS1000-Fix-Bank-offsets.patch \
-    file://0008-Platform-CS1000-Increase-BL2-partition-size.patch \
-    file://0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
-    file://0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
-    file://0011-Platform-CS1000-Fix-platform-name-in-logs.patch \
-    file://0012-Platform-CS1000-Remove-unused-BL1-files.patch \
-    file://0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch \
-    file://0014-CC312-alignment-of-cc312-differences.patch \
-    file://0015-Platform-corstone1000-Allow-FWU-calls-in-RSE-COMMS.patch=
 \
-    file://0016-FWU-Make-platform-specific-TFM_FWU_BOOTLOADER_LIB-se.pat=
ch \
-    file://0017-Platform-CS1000-Enable-FWU-partition.patch \
-    file://0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
-    file://0019-Platform-Corstone1000-Increase-buffer-sizes.patch \
-    file://0023-Platform-CS1000-Remove-duplicate-configuration-parameter=
s.patch \
+    file://0001-Platform-CS1000-Remove-unused-BL1-files.patch \
+    file://0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.pat=
ch \
+    file://0003-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
+    file://0004-Platform-Corstone1000-Enable-FWU-partition.patch \
+    file://0005-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
+    file://0006-Platform-Corstone1000-Increase-buffer-sizes.patch \
+    file://0007-Platform-Corstone1000-Remove-duplicate-configuration.pat=
ch \
+    file://0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.pat=
ch \
+    file://0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.pat=
ch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
@@ -58,6 +51,7 @@ do_install() {
=20
 create_bl1_image(){
     dd conv=3Dnotrunc bs=3D1 if=3D${D}/firmware/bl1_1.bin of=3D${D}/firm=
ware/bl1.bin seek=3D0
-    dd conv=3Dnotrunc bs=3D1 if=3D${D}/firmware/bl1_provisioning_bundle.=
bin of=3D${D}/firmware/bl1.bin seek=3D40960
+    # Size of bl1_1.bin is 58KB (59392 bytes) =20
+    dd conv=3Dnotrunc bs=3D1 if=3D${D}/firmware/bl1_provisioning_bundle.=
bin of=3D${D}/firmware/bl1.bin seek=3D59392
 }
 do_install[postfuncs] +=3D "create_bl1_image"

