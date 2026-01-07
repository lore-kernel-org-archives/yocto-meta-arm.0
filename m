Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2E2CFD62D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:49:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6168.1767793784262668298
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13A47497;
	Wed,  7 Jan 2026 05:49:37 -0800 (PST)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.35.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6FBF3F5A1;
	Wed,  7 Jan 2026 05:49:42 -0800 (PST)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Devaraj Ranganna <devaraj.ranganna@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH whinlatter 1/1] arm-bsp: corstone1000: Enable secure debug on TF-M v2.2.x
Date: Wed,  7 Jan 2026 13:49:31 +0000
Message-Id: <20260107134931.585408-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107134931.585408-1-harsimransingh.tungal@arm.com>
References: <20260107134931.585408-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:49:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6820

From: Devaraj Ranganna <devaraj.ranganna@arm.com>

Allow TF-M v2.2.1 to boot with Secure Debug enabled on Corstone-1000 and
align the driver implementation with the current psa-adac library.

- Add missing DRBG macros to fix the
  "Failed to generate challenge!" error during Secure Debug.
- Fix an unintended platform reset occurring immediately after setting
  the debug enable bits in the dcu_en register while in SE LCS.

Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...-Remove-the-weak-function-definition.patch | 116 +++++++++++++++++
 ...Enable-different-DRBG-configurations.patch |  40 ++++++
 ...0-Remove-psa_adac_to_tfm_apply_permi.patch |  51 ++++++++
 ...-1000-secure-debug-waiting-in-CM-LCS.patch |  56 +++++++++
 ...015-CC3XX-Add-logging-on-cc3xx_dcu.c.patch |  88 +++++++++++++
 ...dcu_en-against-the-permanent_disable.patch |  72 +++++++++++
 ...-checking-ICV-restriction-mask-confi.patch | 118 ++++++++++++++++++
 ...sca-B1-and-Corstone-1000-do-not-chec.patch |  49 ++++++++
 ...nk-psa_interface-instead-of-tfm_sprt.patch |  35 ------
 ...Fix-psa_key_handle_t-initialization.patch} |   0
 ...ate-psa_adac_psa_crypto-dependencies.patch |  30 +++++
 .../trusted-firmware-m-corstone1000.inc       |  13 +-
 12 files changed, 631 insertions(+), 37 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-BL2-Remove-the-weak-function-definition.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-Corstone-1000-Enable-different-DRBG-configurations.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0015-CC3XX-Add-logging-on-cc3xx_dcu.c.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-CC3XX-DCU-Check-dcu_en-against-the-permanent_disable.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-CC3XX-DCU-Enable-checking-ICV-restriction-mask-confi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-Platform-ADAC-Musca-B1-and-Corstone-1000-do-not-chec.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/ps=
a-adac/{0003-Fix-psa_key_handle_t-initialization.patch =3D> 0002-Fix-psa_=
key_handle_t-initialization.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0003-cmake-Update-psa_adac_psa_crypto-dependencies.pat=
ch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-BL2-Remove-the-weak-function-definition.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0011-BL2-Remove-the-weak-fu=
nction-definition.patch
new file mode 100644
index 00000000..2a412d1a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-BL2-Remove-the-weak-function-definition.patch
@@ -0,0 +1,116 @@
+From bea93292fdd5eecd4d106a4288004493cabd13b2 Mon Sep 17 00:00:00 2001
+From: Maulik Patel <maulik.patel@arm.com>
+Date: Mon, 14 Jul 2025 14:55:09 +0100
+Subject: [PATCH] BL2: Remove the weak function definition
+
+When psa_adac_generate_challenge is called from the psa adac crypto
+library (psa_adac_psa_crypto), linker uses the weak function defined in
+the thin_psa_crypto_core.c since it part of same static library
+(bl2_cc3xx_psa_driver_api).
+
+This weak function is intended to be overridden by the strong function
+defined in the linked library (cc3xx_psa_random).
+
+This commit creates separate static library for the weak function
+mbedtls_psa_external_get_random and links it only when the
+crypto hardware accelerator is not enabled.
+
+Upstream-Status: Backport [aef30c4e6507db792648b01f81bc82d3c54f7d43]
+Signed-off-by: Maulik Patel <maulik.patel@arm.com>
+Change-Id: Ic51944a2f4c9bf0bcc0560a38e40c85444bd8aac
+---
+ bl2/CMakeLists.txt             | 14 ++++++++++++++
+ bl2/src/psa_stub_rng.c         | 24 ++++++++++++++++++++++++
+ bl2/src/thin_psa_crypto_core.c | 16 ----------------
+ 3 files changed, 38 insertions(+), 16 deletions(-)
+ create mode 100644 bl2/src/psa_stub_rng.c
+
+diff --git a/bl2/CMakeLists.txt b/bl2/CMakeLists.txt
+index f6c2f894d0..d852102427 100644
+--- a/bl2/CMakeLists.txt
++++ b/bl2/CMakeLists.txt
+@@ -57,6 +57,19 @@ endif()
+=20
+ ############################### BL2_CRYPTO ############################=
#########
+=20
++# Adds a static library target named 'bl2_fallback_rng' which includes =
the source file
++# 'src/psa_stub_rng.c'. This source file contains only the __weak stub =
implementation,
++# serving as a fallback for random number generation in case no other R=
NG is provided.
++if(NOT CRYPTO_HW_ACCELERATOR)
++    add_library(bl2_fallback_rng STATIC
++        src/psa_stub_rng.c
++    )
++    target_link_libraries(bl2_fallback_rng
++        PUBLIC
++            bl2_crypto_config
++    )
++endif()
++
+ set(is_384_bit_curve "$<STREQUAL:${SIG_LEN},384>")
+ set(is_256_bit_curve "$<STREQUAL:${SIG_LEN},256>")
+ set(build_sha_384    "$<AND:${is_ec_signature},${is_384_bit_curve}>")
+@@ -150,6 +163,7 @@ target_link_libraries(bl2
+         $<$<BOOL:${TEST_BL2}>:mcuboot_tests>
+     PUBLIC
+         bl2_crypto
++        $<$<NOT:$<BOOL:${CRYPTO_HW_ACCELERATOR}>>:bl2_fallback_rng>
+ )
+=20
+ target_compile_options(bl2
+diff --git a/bl2/src/psa_stub_rng.c b/bl2/src/psa_stub_rng.c
+new file mode 100644
+index 0000000000..6ede1ddc59
+--- /dev/null
++++ b/bl2/src/psa_stub_rng.c
+@@ -0,0 +1,24 @@
++/*
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ */
++/**
++ * \note This source file is derivative work of psa_crypto.c from the M=
bed TLS project
++ */
++#include <stdint.h>
++#include "psa/crypto.h"
++
++/* This function is stubbed as no source of randomness is required
++ * by APIs used in the BLx stages. Nevertheless, an hardwware driver
++ * for a TRNG might override this implementation with a valid one
++ * hence mark it as a weak
++ */
++__attribute__((weak))
++psa_status_t mbedtls_psa_external_get_random(
++    mbedtls_psa_external_random_context_t *context,
++    uint8_t *output, size_t output_size, size_t *output_length)
++{
++    return PSA_ERROR_NOT_SUPPORTED;
++}
+diff --git a/bl2/src/thin_psa_crypto_core.c b/bl2/src/thin_psa_crypto_co=
re.c
+index 4c0c1897a2..07e3e1e07b 100644
+--- a/bl2/src/thin_psa_crypto_core.c
++++ b/bl2/src/thin_psa_crypto_core.c
+@@ -677,19 +677,3 @@ psa_status_t psa_driver_wrapper_export_public_key(
+=20
+     return PSA_SUCCESS;
+ }
+-
+-#if defined(MBEDTLS_PSA_CRYPTO_EXTERNAL_RNG)
+-/* This function is stubbed as no source of randomness is required
+- * by APIs used in the BLx stages. Nevertheless, an hardwware driver
+- * for a TRNG might override this implementation with a valid one
+- * hence mark it as a weak
+- */
+-__attribute__((weak))
+-psa_status_t mbedtls_psa_external_get_random(
+-    mbedtls_psa_external_random_context_t *context,
+-    uint8_t *output, size_t output_size, size_t *output_length)
+-{
+-    return PSA_ERROR_NOT_SUPPORTED;
+-}
+-#endif /* MBEDTLS_PSA_CRYPTO_EXTERNAL_RNG */
+-/*!@}*/
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-Corstone-1000-Enable-different-DRBG-configurations.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-Corstone-10=
00-Enable-different-DRBG-configurations.patch
new file mode 100644
index 00000000..4fe40b58
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-Corstone-1000-Enable-different-DRBG-configurations.patch
@@ -0,0 +1,40 @@
+From d60a6b4edda3465d86ec264b2cbfd7d14109ed5f Mon Sep 17 00:00:00 2001
+From: Devaraj Ranganna <devaraj.ranganna@arm.com>
+Date: Thu, 18 Sep 2025 22:07:38 +0100
+Subject: [PATCH 2/2] Corstone-1000: Enable different DRBG configurations
+
+The following DRBG configurations are enabled:
+
+* `CC3XX_CONFIG_DRBG_CTR_ENABLE`
+* `CC3XX_CONFIG_DRBG_HMAC_ENABLE`
+* `CC3XX_CONFIG_DRBG_HASH_ENABLE`
+
+The choice of DRBG is defined by `CC3XX_CONFIG_ENABLE_RANDOM_CTR_DRBG`.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.com>
+---
+ platform/ext/target/arm/corstone1000/cc3xx_config.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/platform/ext/target/arm/corstone1000/cc3xx_config.h b/platf=
orm/ext/target/arm/corstone1000/cc3xx_config.h
+index c5654a6bdb..199a99e1ca 100644
+--- a/platform/ext/target/arm/corstone1000/cc3xx_config.h
++++ b/platform/ext/target/arm/corstone1000/cc3xx_config.h
+@@ -87,6 +87,13 @@
+ #error "cc3xx_config: RNG config must select a single DRBG"
+ #endif /* CC3XX_CONFIG_RNG_DRBG_HMAC + CC3XX_CONFIG_RNG_DRBG_CTR + CC3X=
X_CONFIG_RNG_DRBG_HASH */
+=20
++/* Whether the CTR_DRBG is enabled through the generic interface */
++#define CC3XX_CONFIG_DRBG_CTR_ENABLE
++/* Whether the HMAC_DRBG is enabled through the generic interface */
++#define CC3XX_CONFIG_DRBG_HMAC_ENABLE
++/* Whether the HASH_DRBG is enabled through the generic interface */
++#define CC3XX_CONFIG_DRBG_HASH_ENABLE
++
+ /* Whether an external TRNG should be used in place of the standard CC3=
XX TRNG */
+ /* #define CC3XX_CONFIG_RNG_EXTERNAL_TRNG */
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-bl2-corst=
one-1000-Remove-psa_adac_to_tfm_apply_permi.patch
new file mode 100644
index 00000000..2971958d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
@@ -0,0 +1,51 @@
+From 2165f9db2257905d20722a2b87ceb53f320fc198 Mon Sep 17 00:00:00 2001
+From: Devaraj Ranganna <devaraj.ranganna@arm.com>
+Date: Mon, 22 Sep 2025 12:48:57 +0100
+Subject: [PATCH 1/2] bl2: corstone-1000: Remove
+ `psa_adac_to_tfm_apply_permissions`
+
+The API `psa_adac_to_tfm_apply_permissions` is added to `psa-adac`
+library. Therefore, remove it from
+`platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c`.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.com>
+---
+ .../arm/corstone1000/bl2/boot_hal_bl2.c       | 21 -------------------
+ 1 file changed, 21 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+index 2abcfb5fd3..8c4eb80d03 100644
+--- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
++++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+@@ -111,27 +111,6 @@ static bool fill_flash_map_with_fip_data(uint8_t bo=
ot_index) {
+ #endif /* !TFM_S_REG_TEST */
+=20
+ #ifdef PLATFORM_PSA_ADAC_SECURE_DEBUG
+-int psa_adac_to_tfm_apply_permissions(uint8_t permissions_mask[16])
+-{
+-    (void)permissions_mask;
+-
+-    int ret;
+-    uint32_t dcu_reg_values[4];
+-
+-    /* Below values provide same access as when platform is in developm=
ent
+-       life cycle state */
+-    dcu_reg_values[0] =3D 0xffffe7fc;
+-    dcu_reg_values[1] =3D 0x800703ff;
+-    dcu_reg_values[2] =3D 0xffffffff;
+-    dcu_reg_values[3] =3D 0xffffffff;
+-
+-    ret =3D crypto_hw_apply_debug_permissions((uint8_t*)dcu_reg_values,=
 16);
+-    BOOT_LOG_INF("%s: debug permission apply %s\n\r", __func__,
+-            (ret =3D=3D 0) ? "success" : "fail");
+-
+-    return ret;
+-}
+-
+ uint8_t secure_debug_rotpk[32];
+ #endif /* PLATFORM_PSA_ADAC_SECURE_DEBUG */
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-bl2-corstone-=
1000-secure-debug-waiting-in-CM-LCS.patch
new file mode 100644
index 00000000..11085f66
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
@@ -0,0 +1,56 @@
+From fddaf5d297f56305b50b672477cabb840d6f426b Mon Sep 17 00:00:00 2001
+From: Devaraj Ranganna <devaraj.ranganna@arm.com>
+Date: Mon, 22 Sep 2025 12:59:43 +0100
+Subject: [PATCH 2/2] bl2: corstone-1000: secure debug waiting in CM LCS
+
+Currently, when the device is in Secure Enable (SE) LCS state, setting
+`dcu_en` register causes CC-312 reset, which effectively resets the
+device as they are both on same power domain. Therefore, temporarily
+disable moving SE enable before waiting for secure debug notification.
+The device will be in CM provisioned state.
+
+Long-term solution is to implement a solution similar to RSE, secure
+debug handshake is completed and then a reset is triggered and `dcu_en`
+is applied during bl2.
+
+Upstream-Status: Inappropriate [Need to be redesigned]
+Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.com>
+---
+ .../ext/target/arm/corstone1000/bl2/boot_hal_bl2.c  | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+index 8c4eb80d03..bf7b62881a 100644
+--- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
++++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
+@@ -165,7 +165,18 @@ int32_t boot_platform_post_init(void)
+     }
+=20
+ #ifdef PLATFORM_PSA_ADAC_SECURE_DEBUG
++    /*  TODO: Currently, when the device is in Secure Enable (SE) LCS s=
tate,
++        setting `dcu_en` register causes CC-312 reset, which effectivel=
y resets
++        the device as they are both on same power domain. Therefore, te=
mporarily
++        disable moving SE enable before waiting for secure debug notifi=
cation.
++        The device will be in CM provisioned state.
++
++        Long-term solution is to implement a solution similar to RSE, s=
ecure
++        debug handshake is completed and then a reset is triggered and =
`dcu_en`
++        is applied during bl2.
++
+     if (!tfm_plat_provisioning_is_required()) {
++    */
+=20
+         plat_err =3D tfm_plat_otp_read(PLAT_OTP_ID_SECURE_DEBUG_PK, 32,=
 secure_debug_rotpk);
+         if (plat_err !=3D TFM_PLAT_ERR_SUCCESS) {
+@@ -176,7 +187,7 @@ int32_t boot_platform_post_init(void)
+         BOOT_LOG_INF("%s: Corstone-1000 Secure Debug is a %s.\r\n", __f=
unc__,
+                 (result =3D=3D 0) ? "success" : "failure");
+=20
+-    }
++  /*}*/
+ #endif
+=20
+     return 0;
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-CC3XX-Add-logging-on-cc3xx_dcu.c.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0015-CC3XX-Add-logging-on-cc3xx_dc=
u.c.patch
new file mode 100644
index 00000000..1a3258ad
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-CC3XX-Add-logging-on-cc3xx_dcu.c.patch
@@ -0,0 +1,88 @@
+From 6c2aae4f5dae05d12b834ea8ca5c7da505ffd965 Mon Sep 17 00:00:00 2001
+From: Antonio de Angelis <Antonio.deAngelis@arm.com>
+Date: Thu, 18 Sep 2025 11:17:46 +0100
+Subject: [PATCH 1/4] CC3XX: Add logging on cc3xx_dcu.c
+
+Helps understanding which values are being applied and the
+current status of the system (current DCU opens, DCU locks and
+the restriction mask).
+
+Upstream-Status: Backport [7d3931b4f02ea253f065d593743a7c2e0cbca0d7]
+Signed-off-by: Antonio de Angelis <antonio.deangelis@arm.com>
+Change-Id: I426ee064a0008d8031aabdea91fa771b8c892fe4
+
+---
+ .../cc3xx/low_level_driver/src/cc3xx_dcu.c    | 29 +++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/=
cc3xx_dcu.c b/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/=
cc3xx_dcu.c
+index bc23ed6aba..ce9b1afc4a 100644
+--- a/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/cc3xx_d=
cu.c
++++ b/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/cc3xx_d=
cu.c
+@@ -10,6 +10,9 @@
+ #include <assert.h>
+ #include <string.h>
+=20
++/* FixMe: Remove this when CC3XX_INFO logging gets sorted */
++#define CC3XX_INFO(...)
++
+ /**
+  * @brief Check that the requested permissions are in accordance with t=
he
+  *        hardware restriction mask
+@@ -21,6 +24,12 @@ static cc3xx_err_t check_dcu_restriction_mask(const u=
int32_t *val)
+ {
+     size_t idx;
+=20
++    CC3XX_INFO("icv_dcu_restriction_mask: 0x%08x_%08x_%08x_%08x\r\n",
++               P_CC3XX->ao.ao_icv_dcu_restriction_mask[0],
++               P_CC3XX->ao.ao_icv_dcu_restriction_mask[1],
++               P_CC3XX->ao.ao_icv_dcu_restriction_mask[2],
++               P_CC3XX->ao.ao_icv_dcu_restriction_mask[3]);
++
+     for (idx =3D 0; idx < sizeof(P_CC3XX->ao.ao_icv_dcu_restriction_mas=
k) / sizeof(uint32_t); idx++) {
+         if (val[idx] & ~P_CC3XX->ao.ao_icv_dcu_restriction_mask[idx]) {
+             return CC3XX_ERR_DCU_MASK_MISMATCH;
+@@ -42,6 +51,18 @@ static cc3xx_err_t check_dcu_locks(const uint32_t *va=
l)
+     size_t idx;
+     uint32_t dcu_has_to_change;
+=20
++    CC3XX_INFO("Current host_dcu_en: 0x%08x_%08x_%08x_%08x\r\n",
++               P_CC3XX->ao.host_dcu_en[0],
++               P_CC3XX->ao.host_dcu_en[1],
++               P_CC3XX->ao.host_dcu_en[2],
++               P_CC3XX->ao.host_dcu_en[3]);
++
++    CC3XX_INFO("host_dcu_lock: 0x%08x_%08x_%08x_%08x\r\n",
++               P_CC3XX->ao.host_dcu_lock[0],
++               P_CC3XX->ao.host_dcu_lock[1],
++               P_CC3XX->ao.host_dcu_lock[2],
++               P_CC3XX->ao.host_dcu_lock[3]);
++
+     for (idx =3D 0; idx < sizeof(P_CC3XX->ao.host_dcu_en) / sizeof(uint=
32_t); idx++) {
+         /* Check if the host_dcu_en has to change */
+         dcu_has_to_change =3D P_CC3XX->ao.host_dcu_en[idx] ^ val[idx];
+@@ -123,6 +144,12 @@ cc3xx_err_t cc3xx_dcu_set_enabled(const uint8_t *pe=
rmissions_mask, size_t len)
+         dcu_en_requested[idx] =3D *((uint32_t *)(permissions_mask + (id=
x*sizeof(uint32_t))));
+     }
+=20
++    CC3XX_INFO("Requested host_dcu_en: 0x%08x_%08x_%08x_%08x\r\n",
++               dcu_en_requested[0],
++               dcu_en_requested[1],
++               dcu_en_requested[2],
++               dcu_en_requested[3]);
++
+     /* Check the restriction mask for the dcu_en*/
+     err =3D check_dcu_restriction_mask(dcu_en_requested);
+     if (err !=3D CC3XX_ERR_SUCCESS) {
+@@ -139,6 +166,8 @@ cc3xx_err_t cc3xx_dcu_set_enabled(const uint8_t *per=
missions_mask, size_t len)
+         P_CC3XX->ao.host_dcu_en[idx] =3D dcu_en_requested[idx];
+     }
+=20
++    CC3XX_INFO("Requested host_dcu_en applied successfully\r\n");
++
+     return CC3XX_ERR_SUCCESS;
+ }
+ /** @} */ // end of cc3xx_dcu
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0016-CC3XX-DCU-Check-dcu_en-against-the-permanent_disable.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-CC3XX-DCU=
-Check-dcu_en-against-the-permanent_disable.patch
new file mode 100644
index 00000000..4d55d173
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016=
-CC3XX-DCU-Check-dcu_en-against-the-permanent_disable.patch
@@ -0,0 +1,72 @@
+From b51461b88a0fb4ab60e21fcf7f85503e0a7aade0 Mon Sep 17 00:00:00 2001
+From: Antonio de Angelis <Antonio.deAngelis@arm.com>
+Date: Thu, 18 Sep 2025 13:02:36 +0100
+Subject: [PATCH 2/4] CC3XX: DCU: Check dcu_en against the
+ permanent_disable_mask
+
+Regardless of the lifecycle state, there is a permanent disable
+mask register against which the required DCU_EN need to be checked.
+
+Upstream-Status: Backport [ab8edf16290fc13aa2eb5f5149235613c4f7c9a0]
+Signed-off-by: Antonio de Angelis <antonio.deangelis@arm.com>
+Change-Id: I2b4435d6ae7ebb8238987be06ac0c3b40b6dc991
+
+---
+ .../cc3xx/low_level_driver/src/cc3xx_dcu.c    | 34 ++++++++++++++++++-
+ 1 file changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/=
cc3xx_dcu.c b/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/=
cc3xx_dcu.c
+index ce9b1afc4a..089589f278 100644
+--- a/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/cc3xx_d=
cu.c
++++ b/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/cc3xx_d=
cu.c
+@@ -39,6 +39,32 @@ static cc3xx_err_t check_dcu_restriction_mask(const u=
int32_t *val)
+     return CC3XX_ERR_SUCCESS;
+ }
+=20
++/**
++ * @brief Check that the requested permissions are in accordance with t=
he
++ *        permanent disable mask. A 1 in the mask means disabled
++ *
++ * @param[in] val Sets of permissions, i.e. host_dcu_en to check as an =
array of 4 words
++ * @return cc3xx_err_t CC3XX_ERR_SUCCESS or CC3XX_ERR_DCU_MASK_MISMATCH
++ */
++static cc3xx_err_t check_dcu_permanent_disable_mask(const uint32_t *val=
)
++{
++    size_t idx;
++
++    CC3XX_INFO("permanent_disable_mask: 0x%08x_%08x_%08x_%08x\r\n",
++               P_CC3XX->ao.ao_permanent_disable_mask[0],
++               P_CC3XX->ao.ao_permanent_disable_mask[1],
++               P_CC3XX->ao.ao_permanent_disable_mask[2],
++               P_CC3XX->ao.ao_permanent_disable_mask[3]);
++
++    for (idx =3D 0; idx < sizeof(P_CC3XX->ao.ao_permanent_disable_mask)=
 / sizeof(uint32_t); idx++) {
++        if (val[idx] & P_CC3XX->ao.ao_permanent_disable_mask[idx]) {
++            return CC3XX_ERR_DCU_MASK_MISMATCH;
++        }
++    }
++
++    return CC3XX_ERR_SUCCESS;
++}
++
+ /**
+  * @brief Check that the requested permissions are in accordance with t=
he
+  *        current status of the DCU locks
+@@ -150,7 +176,13 @@ cc3xx_err_t cc3xx_dcu_set_enabled(const uint8_t *pe=
rmissions_mask, size_t len)
+                dcu_en_requested[2],
+                dcu_en_requested[3]);
+=20
+-    /* Check the restriction mask for the dcu_en*/
++    /* Check the permanent disable mask for the dcu_en */
++    err =3D check_dcu_permanent_disable_mask(dcu_en_requested);
++    if (err !=3D CC3XX_ERR_SUCCESS) {
++        return err;
++    }
++
++    /* Check the ICV restriction mask for the dcu_en */
+     err =3D check_dcu_restriction_mask(dcu_en_requested);
+     if (err !=3D CC3XX_ERR_SUCCESS) {
+         return err;
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-CC3XX-DCU-Enable-checking-ICV-restriction-mask-confi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017-CC3XX-DCU=
-Enable-checking-ICV-restriction-mask-confi.patch
new file mode 100644
index 00000000..165988ac
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-CC3XX-DCU-Enable-checking-ICV-restriction-mask-confi.patch
@@ -0,0 +1,118 @@
+From 7607a80c43e6cdc9aab6aea61dcc6b4a567136b2 Mon Sep 17 00:00:00 2001
+From: Antonio de Angelis <Antonio.deAngelis@arm.com>
+Date: Fri, 19 Sep 2025 10:21:59 +0100
+Subject: [PATCH 3/4] CC3XX: DCU: Enable checking ICV restriction mask
+ configurable
+
+To allow for platforms which might not convey the CM/DM cert
+enable information to the driver to work correctly. The ICV
+restriction mask is a software only feature hence restrictions
+won't be taken into account when the feature is not enabled in FW.
+
+Upstream-Status: Backport [ffb14450be486b5cb9cc8d0cce8903fc3bb5de34]
+Signed-off-by: Antonio de Angelis <antonio.deangelis@arm.com>
+Change-Id: Ie5b7efadf9ef1f722546585669383e660acf97a9
+
+---
+ .../target/arm/corstone1000/cc3xx_config.h    |  3 +++
+ .../cc3xx/low_level_driver/src/cc3xx_dcu.c    | 21 ++++++++++++++-----
+ .../target/arm/musca_b1/cc312/cc3xx_config.h  |  3 +++
+ 3 files changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/cc3xx_config.h b/platf=
orm/ext/target/arm/corstone1000/cc3xx_config.h
+index 199a99e1ca..a63a2df07a 100644
+--- a/platform/ext/target/arm/corstone1000/cc3xx_config.h
++++ b/platform/ext/target/arm/corstone1000/cc3xx_config.h
+@@ -13,6 +13,9 @@
+ #define CC3XX_CONFIG_BASE_ADDRESS (CC3XX_BASE_S)
+ #endif /* CC3XX_CONFIG_BASE_ADDRESS */
+=20
++/* Whether the DCU apply permission function enforces ICV restriction m=
ask */
++#define CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK
++
+ /* Whether uint32_t accesses must be strictly 4-byte aligned */
+ /* CC3XX_CONFIG_STRICT_UINT32_T_ALIGNMENT */
+=20
+diff --git a/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/=
cc3xx_dcu.c b/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/=
cc3xx_dcu.c
+index 089589f278..f2b70819c0 100644
+--- a/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/cc3xx_d=
cu.c
++++ b/platform/ext/target/arm/drivers/cc3xx/low_level_driver/src/cc3xx_d=
cu.c
+@@ -1,18 +1,26 @@
+ /*
+- * Copyright (c) 2024, The TrustedFirmware-M Contributors. All rights r=
eserved.
++ * SPDX-FileCopyrightText: Copyright The TrustedFirmware-M Contributors
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+  */
+=20
+-#include "cc3xx_dcu.h"
+-#include "cc3xx_dev.h"
++#ifndef CC3XX_CONFIG_FILE
++#include "cc3xx_config.h"
++#else
++#include CC3XX_CONFIG_FILE
++#endif
++
+ #include <assert.h>
+ #include <string.h>
+=20
++#include "cc3xx_dcu.h"
++#include "cc3xx_dev.h"
++
+ /* FixMe: Remove this when CC3XX_INFO logging gets sorted */
+ #define CC3XX_INFO(...)
+=20
++#ifdef CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK
+ /**
+  * @brief Check that the requested permissions are in accordance with t=
he
+  *        hardware restriction mask
+@@ -20,7 +28,7 @@
+  * @param[in] val Sets of permissions, i.e. host_dcu_en to check as an =
array of 4 words
+  * @return cc3xx_err_t CC3XX_ERR_SUCCESS or CC3XX_ERR_DCU_MASK_MISMATCH
+  */
+-static cc3xx_err_t check_dcu_restriction_mask(const uint32_t *val)
++static cc3xx_err_t check_dcu_icv_restriction_mask(const uint32_t *val)
+ {
+     size_t idx;
+=20
+@@ -38,6 +46,7 @@ static cc3xx_err_t check_dcu_restriction_mask(const ui=
nt32_t *val)
+=20
+     return CC3XX_ERR_SUCCESS;
+ }
++#endif /* CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK */
+=20
+ /**
+  * @brief Check that the requested permissions are in accordance with t=
he
+@@ -182,11 +191,13 @@ cc3xx_err_t cc3xx_dcu_set_enabled(const uint8_t *p=
ermissions_mask, size_t len)
+         return err;
+     }
+=20
++#ifdef CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK
+     /* Check the ICV restriction mask for the dcu_en */
+-    err =3D check_dcu_restriction_mask(dcu_en_requested);
++    err =3D check_dcu_icv_restriction_mask(dcu_en_requested);
+     if (err !=3D CC3XX_ERR_SUCCESS) {
+         return err;
+     }
++#endif /* CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK */
+=20
+     /* Check if any dcu_lock has been locked for the corresponding dcu_=
en */
+     err =3D check_dcu_locks(dcu_en_requested);
+diff --git a/platform/ext/target/arm/musca_b1/cc312/cc3xx_config.h b/pla=
tform/ext/target/arm/musca_b1/cc312/cc3xx_config.h
+index cd38d3e837..6fc7ae0fa0 100644
+--- a/platform/ext/target/arm/musca_b1/cc312/cc3xx_config.h
++++ b/platform/ext/target/arm/musca_b1/cc312/cc3xx_config.h
+@@ -13,6 +13,9 @@
+ #define CC3XX_CONFIG_BASE_ADDRESS (CC3XX_BASE_S)
+ #endif /* CC3XX_CONFIG_BASE_ADDRESS */
+=20
++/* Whether the DCU apply permission function enforces ICV restriction m=
ask */
++#define CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK
++
+ /* Whether uint32_t accesses must be strictly 4-byte aligned */
+ /* CC3XX_CONFIG_STRICT_UINT32_T_ALIGNMENT */
+=20
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-Platform-ADAC-Musca-B1-and-Corstone-1000-do-not-chec.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-Platform-=
ADAC-Musca-B1-and-Corstone-1000-do-not-chec.patch
new file mode 100644
index 00000000..e29e4ade
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-Platform-ADAC-Musca-B1-and-Corstone-1000-do-not-chec.patch
@@ -0,0 +1,49 @@
+From d50f841de57c0848595834ab8cde4c89e4ffc1ca Mon Sep 17 00:00:00 2001
+From: Antonio de Angelis <Antonio.deAngelis@arm.com>
+Date: Fri, 19 Sep 2025 10:31:21 +0100
+Subject: [PATCH 4/4] Platform: ADAC: Musca-B1 and Corstone-1000 do not c=
heck
+ ICV restrictions mask
+
+As the permissions being requested in our reference certificates are not
+taking into consideration this aspect yet. As restriction checking is pu=
rely
+a FW feature, this means that ICV restrictions are not taken into any
+considerations (i.e. which DCU_EN are exclusively reserved for CM or DM)
+
+Upstream-Status: Backport [392f6752bd70052371278c93693b8c3d95cce0c9]
+Signed-off-by: Antonio de Angelis <antonio.deangelis@arm.com>
+Change-Id: I8ef4e432a395e1938d749082fbd25fa58916211c
+
+---
+ platform/ext/target/arm/corstone1000/cc3xx_config.h   | 2 +-
+ platform/ext/target/arm/musca_b1/cc312/cc3xx_config.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/cc3xx_config.h b/platf=
orm/ext/target/arm/corstone1000/cc3xx_config.h
+index a63a2df07a..e3f7843986 100644
+--- a/platform/ext/target/arm/corstone1000/cc3xx_config.h
++++ b/platform/ext/target/arm/corstone1000/cc3xx_config.h
+@@ -14,7 +14,7 @@
+ #endif /* CC3XX_CONFIG_BASE_ADDRESS */
+=20
+ /* Whether the DCU apply permission function enforces ICV restriction m=
ask */
+-#define CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK
++/* #define CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK */
+=20
+ /* Whether uint32_t accesses must be strictly 4-byte aligned */
+ /* CC3XX_CONFIG_STRICT_UINT32_T_ALIGNMENT */
+diff --git a/platform/ext/target/arm/musca_b1/cc312/cc3xx_config.h b/pla=
tform/ext/target/arm/musca_b1/cc312/cc3xx_config.h
+index 6fc7ae0fa0..1faf4a06e5 100644
+--- a/platform/ext/target/arm/musca_b1/cc312/cc3xx_config.h
++++ b/platform/ext/target/arm/musca_b1/cc312/cc3xx_config.h
+@@ -14,7 +14,7 @@
+ #endif /* CC3XX_CONFIG_BASE_ADDRESS */
+=20
+ /* Whether the DCU apply permission function enforces ICV restriction m=
ask */
+-#define CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK
++/* #define CC3XX_CONFIG_DCU_ICV_RESTRICTION_MASK_CHECK */
+=20
+ /* Whether uint32_t accesses must be strictly 4-byte aligned */
+ /* CC3XX_CONFIG_STRICT_UINT32_T_ALIGNMENT */
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-adac/0002-=
ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
deleted file mode 100644
index b82e417c..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From af71103845498eef4f859deba4b904a195f2817f Mon Sep 17 00:00:00 2001
-From: Bence Balogh <bence.balogh@arm.com>
-Date: Mon, 22 Jul 2024 17:33:23 +0200
-Subject: [PATCH] ADAC: Link psa_interface instead of tfm_sprt
-
-The tfm_sprt brings in other functionalities that are not needed for
-the Secure Debug.
-
-The printf() override in tfm_sp_log_raw.c can cause problems because
-it calls tfm_hal_output_sp_log() which triggers an SVC. The SVC calls
-tfm_hal_output_spm_log which relies on an SPM, which might not be
-initialized at that point.
-
-Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Backport [af0acd1af3e2cc81b12931b31367fb95e49e8272]
----
- psa_crypto/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/psa_crypto/CMakeLists.txt b/psa_crypto/CMakeLists.txt
-index 3e70624..58d95f7 100644
---- a/psa_crypto/CMakeLists.txt
-+++ b/psa_crypto/CMakeLists.txt
-@@ -18,7 +18,7 @@ target_sources(psa_adac_psa_crypto
- target_link_libraries(psa_adac_psa_crypto
-     PRIVATE
-         psa_adac_config
--        tfm_sprt
-+        psa_interface
- )
-=20
- target_link_libraries(trusted-firmware-m-psa-adac
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0003-Fix-psa_key_handle_t-initialization.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-adac/0002-Fix-psa_=
key_handle_t-initialization.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/psa-adac/0003-Fix-psa_key_handle_t-initialization.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
psa-adac/0002-Fix-psa_key_handle_t-initialization.patch
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0003-cmake-Update-psa_adac_psa_crypto-dependencies.patch b/me=
ta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-adac/000=
3-cmake-Update-psa_adac_psa_crypto-dependencies.patch
new file mode 100644
index 00000000..393a4be6
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0003-cmake-Update-psa_adac_psa_crypto-dependencies.patch
@@ -0,0 +1,30 @@
+From 3c552d0b46559160581e89bf310db0b176e33074 Mon Sep 17 00:00:00 2001
+From: Devaraj Ranganna <devaraj.ranganna@arm.com>
+Date: Thu, 18 Sep 2025 17:45:20 +0100
+Subject: [PATCH] cmake: Update `psa_adac_psa_crypto` dependencies
+
+The auto-generated header files are part of `psa_adac_core` library.
+Therefore, link `psa_adac_psa_crypto` library with `psa_adac_core`
+library.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.com>
+---
+ psa_crypto/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/psa_crypto/CMakeLists.txt b/psa_crypto/CMakeLists.txt
+index b1c3f5d..efc284d 100644
+--- a/psa_crypto/CMakeLists.txt
++++ b/psa_crypto/CMakeLists.txt
+@@ -20,6 +20,7 @@ target_link_libraries(psa_adac_psa_crypto
+         psa_adac_config
+         $<$<BOOL:${PSA_ADAC_AS_TFM_RUNTIME_SERVICE}>:tfm_sprt>
+         psa_interface
++        psa_adac_core
+ )
+=20
+ target_link_libraries(trusted-firmware-m-psa-adac
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index a355e844..fd4e6666 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -31,6 +31,7 @@ SRC_URI +=3D " \
            "
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"
 SRC_URI:append:corstone1000 =3D " \
     file://0001-Platform-CS1000-Remove-unused-BL1-files.patch \
     file://0002-Platform-Corstone1000-Fix-BL1-compiler-switch-and-re.pat=
ch \
@@ -42,13 +43,21 @@ SRC_URI:append:corstone1000 =3D " \
     file://0008-Platform-Corstone1000-Increase-BL1-size-and-align-bi.pat=
ch \
     file://0009-Platform-CS1K-Adapt-ADAC-enabled-build-to-the-new-BL.pat=
ch \
     file://0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.pat=
ch \
+    file://0011-BL2-Remove-the-weak-function-definition.patch \
+    file://0012-Corstone-1000-Enable-different-DRBG-configurations.patch=
 \
+    file://0013-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.pat=
ch \
+    file://0014-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch \
+    file://0015-CC3XX-Add-logging-on-cc3xx_dcu.c.patch \
+    file://0016-CC3XX-DCU-Check-dcu_en-against-the-permanent_disable.pat=
ch \
+    file://0017-CC3XX-DCU-Enable-checking-ICV-restriction-mask-confi.pat=
ch \
+    file://0018-Platform-ADAC-Musca-B1-and-Corstone-1000-do-not-chec.pat=
ch \
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
 SRC_URI:append:corstone1000-mps3 =3D " \
     file://0001-PSA-revert-header-versions.patch;patchdir=3D../tfm-psa-a=
dac \
-    file://0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch;patchd=
ir=3D../tfm-psa-adac \
-    file://0003-Fix-psa_key_handle_t-initialization.patch;patchdir=3D../=
tfm-psa-adac \
+    file://0002-Fix-psa_key_handle_t-initialization.patch;patchdir=3D../=
tfm-psa-adac \
+    file://0003-cmake-Update-psa_adac_psa_crypto-dependencies.patch;patc=
hdir=3D../tfm-psa-adac \
     "
=20
 do_install() {

