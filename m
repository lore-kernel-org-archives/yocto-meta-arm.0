Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2141CFD63D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 13:51:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6228.1767793891582080144
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 05:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4500E497;
	Wed,  7 Jan 2026 05:51:24 -0800 (PST)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.35.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1763F5A1;
	Wed,  7 Jan 2026 05:51:29 -0800 (PST)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Devaraj Ranganna <devaraj.ranganna@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 1/1] arm-bsp: corstone1000: Enable secure debug on TF-M v2.2.x
Date: Wed,  7 Jan 2026 13:51:20 +0000
Message-Id: <20260107135120.585754-2-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107135120.585754-1-harsimransingh.tungal@arm.com>
References: <20260107135120.585754-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 Jan 2026 13:51:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6822

From: Devaraj Ranganna <devaraj.ranganna@arm.com>

Allow TF-M v2.2.2 to boot with Secure Debug enabled on Corstone-1000 and
align the driver implementation with the current psa-adac library.

- Add missing DRBG macros to fix the
  "Failed to generate challenge!" error during Secure Debug.
- Fix an unintended platform reset occurring immediately after setting
  the debug enable bits in the dcu_en register while in SE LCS.

Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 ...Enable-different-DRBG-configurations.patch | 40 +++++++++++++
 ...0-Remove-psa_adac_to_tfm_apply_permi.patch | 51 +++++++++++++++++
 ...-1000-secure-debug-waiting-in-CM-LCS.patch | 56 +++++++++++++++++++
 ...nk-psa_interface-instead-of-tfm_sprt.patch | 35 ------------
 ...Fix-psa_key_handle_t-initialization.patch} |  0
 ...ate-psa_adac_psa_crypto-dependencies.patch | 30 ++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  9 ++-
 7 files changed, 184 insertions(+), 37 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0011-Corstone-1000-Enable-different-DRBG-configurations.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0012-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/ps=
a-adac/{0003-Fix-psa_key_handle_t-initialization.patch =3D> 0002-Fix-psa_=
key_handle_t-initialization.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0003-cmake-Update-psa_adac_psa_crypto-dependencies.pat=
ch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Corstone-1000-Enable-different-DRBG-configurations.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-Corstone-10=
00-Enable-different-DRBG-configurations.patch
new file mode 100644
index 00000000..4fe40b58
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
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
00/0012-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-bl2-corst=
one-1000-Remove-psa_adac_to_tfm_apply_permi.patch
new file mode 100644
index 00000000..2971958d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
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
00/0013-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-bl2-corstone-=
1000-secure-debug-waiting-in-CM-LCS.patch
new file mode 100644
index 00000000..11085f66
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
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
index 90284d81..2b44f168 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -27,6 +27,8 @@ EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM=
_PSA_ADAC_SECURE_DEBUG=3D${@b
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${UNPACKDIR}/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/tf=
m-psa-adac-build"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"
 SRC_URI:append:corstone1000 =3D " \
     file://0001-arm-trusted-firmware-m-disable-address-warnings-into.pat=
ch \
     file://0002-Platform-CS1000-Remove-unused-BL1-files.patch \
@@ -37,13 +39,16 @@ SRC_URI:append:corstone1000 =3D " \
     file://0007-Platform-Corstone1000-Increase-buffer-sizes.patch \
     file://0008-Platform-Corstone1000-Remove-duplicate-configuration.pat=
ch \
     file://0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.pat=
ch \
+    file://0011-Corstone-1000-Enable-different-DRBG-configurations.patch=
 \
+    file://0012-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.pat=
ch \
+    file://0013-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch \
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
 create_bl1_image(){

