Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95773FEFB5A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 14:14:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96796.1772201676316159228
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 06:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9FE1516
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 06:14:29 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC02C3F8C6
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 06:14:35 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-m: workarounds for new(er) toolchains
Date: Fri, 27 Feb 2026 09:14:27 -0500
Message-ID: <20260227141434.69360-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260227141434.69360-1-jon.mason@arm.com>
References: <20260227141434.69360-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Feb 2026 14:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6924

GCC 15 (and GCC 14, and probably others) are finding new problems in
trusted-firmware m, and these cannot simply be ignored (as they are
fatal build errors).  Clear the ld security flags to get around those
issues, backport a couple of patches for fixes that have been addressed
upstream, and create a patch to work around some casting issues in
functions that are removed in newer versions of the code.  This
refactoring caused some minor clean up of existing corstone1000 tfm
patches.

Also, use size based optimization for corstone1000.  With this, the bl1
is too big to fit into flash.  The correct way to solve this would be to
remove TFA_DEBUG, but that causes a rabbit hole of problems related to
heap being enabled or not.  This works around the issue until it can be
resolved properly.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...e1000-Implement-Bootloader-Abstracti.patch |   8 +-
 ...-Add-support-for-Cortex-A320-varian.patch} |  17 +-
 ...nable-different-DRBG-configurations.patch} |  11 +-
 ...-Remove-psa_adac_to_tfm_apply_permi.patch} |   9 +-
 ...1000-secure-debug-waiting-in-CM-LCS.patch} |   9 +-
 ...adjust-CS1000-platform-for-GCC-v14.2.patch | 147 +++++++++++++++++
 ...014-Workaround-compile-errors-in-AES.patch |  48 ++++++
 .../0001-Build-Fix-compiler-warnings.patch    | 151 ++++++++++++++++++
 .../trusted-firmware-m-corstone1000.inc       |  18 ++-
 .../trusted-firmware-m_2.1.4.bb               |   5 +
 .../trusted-firmware-m_2.2.2.bb               |   5 +
 11 files changed, 389 insertions(+), 39 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
010-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch =3D> 0009-=
plat-corstone1000-Add-support-for-Cortex-A320-varian.patch} (98%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
011-Corstone-1000-Enable-different-DRBG-configurations.patch =3D> 0010-Co=
rstone-1000-Enable-different-DRBG-configurations.patch} (87%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
012-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch =3D> 0011-=
bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
013-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch =3D> 0012-bl2-=
corstone-1000-secure-debug-waiting-in-CM-LCS.patch} (92%)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-Build-adjust-CS1000-platform-for-GCC-v14.2.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-Workaround-compile-errors-in-AES.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/psa-adac/0001-Build-Fix-compiler-warnings.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-Platform-=
Corstone1000-Implement-Bootloader-Abstracti.patch
index 509ab2078500..28c5e67da3b5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
@@ -1,4 +1,4 @@
-From acefd1b894790c1d2a158bd42fcb4892ffa7c053 Mon Sep 17 00:00:00 2001
+From ab77323c82d4d1983e81fe20b7b3c8eda743d808 Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Tue, 15 Oct 2024 12:50:16 +0000
 Subject: [PATCH] Platform: Corstone1000: Implement Bootloader Abstractio=
n
@@ -2875,7 +2875,7 @@ diff --git a/platform/ext/target/arm/corstone1000/f=
w_update_agent/uefi_fmp.c b/p
 similarity index 66%
 rename from platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fm=
p.c
 rename to platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_f=
mp.c
-index 896658995a55..aef9c9a20c0f 100644
+index 896658995a55..3edd4ebd0ea9 100644
 --- a/platform/ext/target/arm/corstone1000/fw_update_agent/uefi_fmp.c
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/uefi_fmp.c
 @@ -1,5 +1,5 @@
@@ -2999,9 +2999,9 @@ index 896658995a55..aef9c9a20c0f 100644
 +        fmp_info[i].ImageDescriptor.LastAttemptVersion =3D FWU_IMAGE_IN=
ITIAL_VERSION;
 +        fmp_info[i].ImageDescriptor.LastAttemptStatus =3D LAST_ATTEMPT_=
STATUS_SUCCESS;
 +
-+        fmp_info[i].ImageName =3D image_info[i].corstone_image_name;
++        fmp_info[i].ImageName =3D (uint16_t *)image_info[i].corstone_im=
age_name;
 +        fmp_info[i].ImageNameSize =3D sizeof(image_info[i].corstone_ima=
ge_name);
-+        fmp_info[i].ImageVersionName =3D image_info[i].corstone_version=
_name;
++        fmp_info[i].ImageVersionName =3D (uint16_t *)image_info[i].cors=
tone_version_name;
 +        fmp_info[i].ImageVersionNameSize =3D sizeof(image_info[i].corst=
one_version_name);
 +    }
      is_fmp_info_initialized =3D true;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-plat-cors=
tone1000-Add-support-for-Cortex-A320-varian.patch
similarity index 98%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0009-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch
index 1792474b2447..b46d4d681b89 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-plat-corstone1000-Add-support-for-Cortex-A320-varian.patch
@@ -1,4 +1,4 @@
-From 2f09a03bc8396164c8075ac802751b6150b8a6c0 Mon Sep 17 00:00:00 2001
+From c5bcb737352ad2e1c24cc14a0b8ddf91ad7197b4 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Tue, 29 Jul 2025 15:09:45 +0000
 Subject: [PATCH] plat: corstone1000: Add support for Cortex-A320 variant
@@ -52,7 +52,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  create mode 100644 platform/ext/target/arm/corstone1000/dsu-120t/ppu.h
=20
 diff --git a/platform/ext/target/arm/corstone1000/CMakeLists.txt b/platf=
orm/ext/target/arm/corstone1000/CMakeLists.txt
-index 91bf197d8..993c51591 100644
+index 91bf197d86b7..993c51591fa7 100644
 --- a/platform/ext/target/arm/corstone1000/CMakeLists.txt
 +++ b/platform/ext/target/arm/corstone1000/CMakeLists.txt
 @@ -423,6 +423,37 @@ target_sources(tfm_spm
@@ -94,7 +94,7 @@ index 91bf197d8..993c51591 100644
 =20
  if (${PLATFORM_PSA_ADAC_SECURE_DEBUG})
 diff --git a/platform/ext/target/arm/corstone1000/Device/Include/platfor=
m_base_address.h b/platform/ext/target/arm/corstone1000/Device/Include/pl=
atform_base_address.h
-index 5f9f03ddc..3908d69bc 100644
+index 5f9f03ddc610..3908d69bc9bd 100644
 --- a/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
 +++ b/platform/ext/target/arm/corstone1000/Device/Include/platform_base_=
address.h
 @@ -1,5 +1,7 @@
@@ -118,7 +118,7 @@ index 5f9f03ddc..3908d69bc 100644
  #define CC3XX_BASE_S        CORSTONE1000_CRYPTO_ACCELERATOR_BASE
 =20
 diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c b=
/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
-index b51a233e9..1a5e98ad3 100644
+index b51a233e9143..1a5e98ad3c35 100644
 --- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
 +++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_1.c
 @@ -1,5 +1,5 @@
@@ -199,7 +199,7 @@ index b51a233e9..1a5e98ad3 100644
      /* DDR */
 diff --git a/platform/ext/target/arm/corstone1000/dsu-120t/ppu.c b/platf=
orm/ext/target/arm/corstone1000/dsu-120t/ppu.c
 new file mode 100644
-index 000000000..d6be5982a
+index 000000000000..d6be5982a8dd
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/dsu-120t/ppu.c
 @@ -0,0 +1,40 @@
@@ -245,7 +245,7 @@ index 000000000..d6be5982a
 +
 diff --git a/platform/ext/target/arm/corstone1000/dsu-120t/ppu.h b/platf=
orm/ext/target/arm/corstone1000/dsu-120t/ppu.h
 new file mode 100644
-index 000000000..05470df9a
+index 000000000000..05470df9a884
 --- /dev/null
 +++ b/platform/ext/target/arm/corstone1000/dsu-120t/ppu.h
 @@ -0,0 +1,185 @@
@@ -435,7 +435,7 @@ index 000000000..05470df9a
 +
 +#endif /* PPU_H */
 diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c b=
/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
-index d0c6b8d59..10c66ac41 100644
+index d0c6b8d590f9..10c66ac41ad2 100644
 --- a/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
 +++ b/platform/ext/target/arm/corstone1000/tfm_hal_multi_core.c
 @@ -1,5 +1,5 @@
@@ -485,6 +485,3 @@ index d0c6b8d59..10c66ac41 100644
  #ifdef EXTERNAL_SYSTEM_SUPPORT
      /*release EXT SYS out of reset*/
      tfm_external_system_boot();
---=20
-2.50.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-Corstone-1000-Enable-different-DRBG-configurations.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Corstone-10=
00-Enable-different-DRBG-configurations.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0011-Corstone-1000-Enable-different-DRBG-configurations.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0010-Corstone-1000-Enable-different-DRBG-configurations.patch
index 4fe40b58244f..41414148ca08 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-Corstone-1000-Enable-different-DRBG-configurations.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-Corstone-1000-Enable-different-DRBG-configurations.patch
@@ -1,7 +1,7 @@
-From d60a6b4edda3465d86ec264b2cbfd7d14109ed5f Mon Sep 17 00:00:00 2001
+From dae5f3d1ec85e29f44d3f19bec2312607751ec22 Mon Sep 17 00:00:00 2001
 From: Devaraj Ranganna <devaraj.ranganna@arm.com>
 Date: Thu, 18 Sep 2025 22:07:38 +0100
-Subject: [PATCH 2/2] Corstone-1000: Enable different DRBG configurations
+Subject: [PATCH] Corstone-1000: Enable different DRBG configurations
=20
 The following DRBG configurations are enabled:
=20
@@ -18,10 +18,10 @@ Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm=
.com>
  1 file changed, 7 insertions(+)
=20
 diff --git a/platform/ext/target/arm/corstone1000/cc3xx_config.h b/platf=
orm/ext/target/arm/corstone1000/cc3xx_config.h
-index c5654a6bdb..199a99e1ca 100644
+index ac034b17982a..e3f78439861f 100644
 --- a/platform/ext/target/arm/corstone1000/cc3xx_config.h
 +++ b/platform/ext/target/arm/corstone1000/cc3xx_config.h
-@@ -87,6 +87,13 @@
+@@ -90,6 +90,13 @@
  #error "cc3xx_config: RNG config must select a single DRBG"
  #endif /* CC3XX_CONFIG_RNG_DRBG_HMAC + CC3XX_CONFIG_RNG_DRBG_CTR + CC3X=
X_CONFIG_RNG_DRBG_HASH */
 =20
@@ -35,6 +35,3 @@ index c5654a6bdb..199a99e1ca 100644
  /* Whether an external TRNG should be used in place of the standard CC3=
XX TRNG */
  /* #define CC3XX_CONFIG_RNG_EXTERNAL_TRNG */
 =20
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011-bl2-corst=
one-1000-Remove-psa_adac_to_tfm_apply_permi.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0012-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0011-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
index 2971958dc925..2621667dd6d1 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.patch
@@ -1,7 +1,7 @@
-From 2165f9db2257905d20722a2b87ceb53f320fc198 Mon Sep 17 00:00:00 2001
+From 3a9e209596ca0ae5850ae382c624adf9932b16b4 Mon Sep 17 00:00:00 2001
 From: Devaraj Ranganna <devaraj.ranganna@arm.com>
 Date: Mon, 22 Sep 2025 12:48:57 +0100
-Subject: [PATCH 1/2] bl2: corstone-1000: Remove
+Subject: [PATCH] bl2: corstone-1000: Remove
  `psa_adac_to_tfm_apply_permissions`
=20
 The API `psa_adac_to_tfm_apply_permissions` is added to `psa-adac`
@@ -15,7 +15,7 @@ Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.c=
om>
  1 file changed, 21 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-index 2abcfb5fd3..8c4eb80d03 100644
+index 2abcfb5fd39d..8c4eb80d032c 100644
 --- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
 +++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
 @@ -111,27 +111,6 @@ static bool fill_flash_map_with_fip_data(uint8_t bo=
ot_index) {
@@ -46,6 +46,3 @@ index 2abcfb5fd3..8c4eb80d03 100644
  uint8_t secure_debug_rotpk[32];
  #endif /* PLATFORM_PSA_ADAC_SECURE_DEBUG */
 =20
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012-bl2-corstone-=
1000-secure-debug-waiting-in-CM-LCS.patch
similarity index 92%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0013-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0012-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
index 11085f66af02..d0a9e9a6ad51 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
@@ -1,7 +1,7 @@
-From fddaf5d297f56305b50b672477cabb840d6f426b Mon Sep 17 00:00:00 2001
+From 901a63f09369cfbed8eff8c450b8615bd4c361af Mon Sep 17 00:00:00 2001
 From: Devaraj Ranganna <devaraj.ranganna@arm.com>
 Date: Mon, 22 Sep 2025 12:59:43 +0100
-Subject: [PATCH 2/2] bl2: corstone-1000: secure debug waiting in CM LCS
+Subject: [PATCH] bl2: corstone-1000: secure debug waiting in CM LCS
=20
 Currently, when the device is in Secure Enable (SE) LCS state, setting
 `dcu_en` register causes CC-312 reset, which effectively resets the
@@ -20,7 +20,7 @@ Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm.c=
om>
  1 file changed, 12 insertions(+), 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-index 8c4eb80d03..bf7b62881a 100644
+index 8c4eb80d032c..bf7b62881ad5 100644
 --- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
 +++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
 @@ -165,7 +165,18 @@ int32_t boot_platform_post_init(void)
@@ -51,6 +51,3 @@ index 8c4eb80d03..bf7b62881a 100644
  #endif
 =20
      return 0;
---=20
-2.43.0
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-Build-adjust-CS1000-platform-for-GCC-v14.2.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0013-Build-adjust-CS1000=
-platform-for-GCC-v14.2.patch
new file mode 100644
index 000000000000..90c1a2e1a0f2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-Build-adjust-CS1000-platform-for-GCC-v14.2.patch
@@ -0,0 +1,147 @@
+From 14fff6df016dad1d76f1eda6f77dde1890836c3c Mon Sep 17 00:00:00 2001
+From: Anton Komlev <anton.komlev@arm.com>
+Date: Thu, 11 Sep 2025 17:16:43 +0100
+Subject: [PATCH] Build: adjust CS1000 platform for GCC v14.2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The latest GNUARM toolchain is more strict, converting some warnings
+into errors. This change:
+- adds missing function prototypes and header files
+- explicitly typecasts incompatible types in secure side
+- prevents integer=E2=80=93pointer conversion errors in
+  `tfm_test_suite_extra_s` CMake targets because a number of type
+  mismatch is too high.
+
+Signed-off-by: Anton Komlev <anton.komlev@arm.com>
+Change-Id: Ia803ebd5ceeab03ab7c7afc7c79c4e5836e03b26
+
+Upstream-Status: Backport [05c174df157eac428a3e87a1c40170ed7a74af57]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ .../ext/target/arm/corstone1000/bl1/boot_hal_bl1_2.c   |  1 +
+ .../corstone1000/ci_regression_tests/CMakeLists.txt    |  2 ++
+ platform/ext/target/arm/corstone1000/io/io_block.c     |  1 +
+ platform/ext/target/arm/corstone1000/io/io_flash.c     | 10 +++++-----
+ platform/ext/target/arm/corstone1000/platform.c        |  8 ++++----
+ .../target/arm/corstone1000/rse_comms/rse_comms_hal.h  |  2 ++
+ 6 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_2.c b=
/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_2.c
+index 8d85d2b2c9b8..b81e14e03aa9 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_2.c
++++ b/platform/ext/target/arm/corstone1000/bl1/boot_hal_bl1_2.c
+@@ -21,6 +21,7 @@
+ #include "uart_stdout.h"
+ #include "region_defs.h"
+ #include "tfm_log.h"
++#include "cc3xx_init.h"
+=20
+ #ifdef CRYPTO_HW_ACCELERATOR
+ #include "cc3xx_dev.h"
+diff --git a/platform/ext/target/arm/corstone1000/ci_regression_tests/CM=
akeLists.txt b/platform/ext/target/arm/corstone1000/ci_regression_tests/C=
MakeLists.txt
+index 405b2b370237..3b023c813e02 100644
+--- a/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeList=
s.txt
++++ b/platform/ext/target/arm/corstone1000/ci_regression_tests/CMakeList=
s.txt
+@@ -44,3 +44,5 @@ target_compile_definitions(tfm_test_suite_extra_s
+         TEST_FLASH_PAGE_SIZE=3D${TEST_FLASH_PAGE_SIZE}
+         TEST_FLASH_PROGRAM_UNIT=3D${TEST_FLASH_PROGRAM_UNIT}
+ )
++
++target_compile_options(tfm_test_suite_extra_s PRIVATE -Wno-int-conversi=
on)
+diff --git a/platform/ext/target/arm/corstone1000/io/io_block.c b/platfo=
rm/ext/target/arm/corstone1000/io/io_block.c
+index f7eaf7444c38..a5c021ac5a18 100644
+--- a/platform/ext/target/arm/corstone1000/io/io_block.c
++++ b/platform/ext/target/arm/corstone1000/io/io_block.c
+@@ -20,6 +20,7 @@
+=20
+ #include <assert.h>
+ #include <errno.h>
++#include <string.h>
+=20
+ #include "io_defs.h"
+ #include "io_driver.h"
+diff --git a/platform/ext/target/arm/corstone1000/io/io_flash.c b/platfo=
rm/ext/target/arm/corstone1000/io/io_flash.c
+index ff4524e9c575..b90a81a48d82 100644
+--- a/platform/ext/target/arm/corstone1000/io/io_flash.c
++++ b/platform/ext/target/arm/corstone1000/io/io_flash.c
+@@ -71,7 +71,7 @@ static size_t flash_read(int lba, uintptr_t buf, size_=
t size, size_t flash_id) {
+     size_t rem =3D info->sector_count * info->sector_size - offset;
+     size_t cnt =3D size < rem ? size : rem;
+=20
+-    return flash_driver->ReadData(offset, buf, cnt);
++    return flash_driver->ReadData(offset, (void *)buf, cnt);
+ }
+=20
+ static size_t flash_write(int lba, const uintptr_t buf, size_t size,
+@@ -86,7 +86,7 @@ static size_t flash_write(int lba, const uintptr_t buf=
, size_t size,
+     size_t cnt =3D size < rem ? size : rem;
+=20
+     flash_driver->EraseSector(offset);
+-    rc =3D flash_driver->ProgramData(offset, buf, cnt);
++    rc =3D flash_driver->ProgramData(offset, (const void *)buf, cnt);
+     return rc;
+ }
+=20
+@@ -143,8 +143,8 @@ static int flash_dev_open(const uintptr_t dev_spec, =
io_dev_info_t **dev_info) {
+     /* Check if Flash ops functions are defined for this flash */
+     assert(flashs_ops[index].read && flashs_ops[index].write);
+=20
+-    flash_dev_specs[index] =3D dev_spec;
+-    flash_driver =3D flash_dev_specs[index]->flash_driver;
++    flash_dev_specs[index] =3D (io_flash_dev_spec_t *)dev_spec;
++    flash_driver =3D (const ARM_DRIVER_FLASH *)flash_dev_specs[index]->=
flash_driver;
+=20
+     block_dev_spec[index].block_size =3D flash_driver->GetInfo()->secto=
r_size;
+     block_dev_spec[index].buffer.offset =3D flash_dev_specs[index]->buf=
fer;
+@@ -153,7 +153,7 @@ static int flash_dev_open(const uintptr_t dev_spec, =
io_dev_info_t **dev_info) {
+=20
+     flash_driver->Initialize(NULL);
+=20
+-    block_dev_connectors[index].dev_open(&block_dev_spec[index], dev_in=
fo);
++    block_dev_connectors[index].dev_open((uintptr_t)&block_dev_spec[ind=
ex], dev_info);
+=20
+     return 0;
+ }
+diff --git a/platform/ext/target/arm/corstone1000/platform.c b/platform/=
ext/target/arm/corstone1000/platform.c
+index c686b403ff10..d0f30b72a76d 100644
+--- a/platform/ext/target/arm/corstone1000/platform.c
++++ b/platform/ext/target/arm/corstone1000/platform.c
+@@ -29,10 +29,10 @@ extern ARM_DRIVER_FLASH FLASH_DEV_NAME;
+ static io_dev_connector_t *flash_dev_con;
+ static uint8_t local_block_flash[FLASH_SECTOR_SIZE];
+ static io_flash_dev_spec_t flash_dev_spec =3D {
+-    .buffer =3D local_block_flash,
++    .buffer =3D (uintptr_t)local_block_flash,
+     .bufferlen =3D FLASH_SECTOR_SIZE,
+     .base_addr =3D FLASH_BASE_ADDRESS,
+-    .flash_driver =3D &FLASH_DEV_NAME,
++    .flash_driver =3D (uintptr_t)&FLASH_DEV_NAME,
+ };
+ static io_block_spec_t flash_spec =3D {
+     .offset =3D FLASH_BASE_ADDRESS,
+@@ -41,8 +41,8 @@ static io_block_spec_t flash_spec =3D {
+=20
+ static platform_image_source_t platform_image_source[] =3D {
+     [PLATFORM_GPT_IMAGE] =3D {
+-        .dev_handle =3D NULL,
+-        .image_spec =3D &flash_spec,
++        .dev_handle =3D (uintptr_t)NULL,
++        .image_spec =3D (uintptr_t)&flash_spec,
+     }
+ };
+=20
+diff --git a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_ha=
l.h b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_hal.h
+index c4676cb2ef74..29be08ddb36e 100644
+--- a/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_hal.h
++++ b/platform/ext/target/arm/corstone1000/rse_comms/rse_comms_hal.h
+@@ -49,6 +49,8 @@ enum tfm_plat_err_t tfm_multi_core_hal_receive(void *m=
hu_receiver_dev,
+  */
+ enum tfm_plat_err_t tfm_multi_core_hal_reply(struct client_request_t *r=
eq);
+=20
++int32_t tfm_hal_client_id_translate(void *owner, int32_t client_id_in);
++
+ #ifdef __cplusplus
+ }
+ #endif
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-Workaround-compile-errors-in-AES.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0014-Workaround-compile-errors-in-=
AES.patch
new file mode 100644
index 000000000000..d4ffb9e61e26
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-Workaround-compile-errors-in-AES.patch
@@ -0,0 +1,48 @@
+From 949ecbcd29660225f42bdfc37bdff4b79917620a Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com>
+Date: Mon, 23 Feb 2026 11:53:38 -0500
+Subject: [PATCH] Workaround compile errors in AES
+
+TF-M commit d7c4850d8ce3abeb2634e85631b4bbadeb343f23 removes support for
+bl1_aes_256_ctr_decrypt() API.  Since backporting that is more involved
+than we want for this release.  Simply do some casting to address the
+issues until the next release (which will have the commit referenced
+previously).
+
+Upstream-Status: Inappropriate
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+---
+ platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c=
 b/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c
+index 542fc01bc7a8..5b34d90464eb 100644
+--- a/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c
++++ b/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c
+@@ -328,7 +328,7 @@ fih_int bl1_aes_256_ctr_decrypt(enum tfm_bl1_key_id_=
t key_id,
+     uint32_t key_buf[32 / sizeof(uint32_t)];
+     fih_int fih_rc;
+     int32_t rc =3D 0;
+-    const uint8_t *input_key =3D key_buf;
++    const uint8_t *input_key =3D (const uint8_t *)key_buf;
+     cc3xx_err_t err;
+=20
+     if (ciphertext_length =3D=3D 0) {
+@@ -356,7 +356,7 @@ fih_int bl1_aes_256_ctr_decrypt(enum tfm_bl1_key_id_=
t key_id,
+     }
+=20
+     err =3D cc3xx_lowlevel_aes_init(CC3XX_AES_DIRECTION_DECRYPT, CC3XX_=
AES_MODE_CTR,
+-                                  cc3xx_key_type, input_key, CC3XX_AES_=
KEYSIZE_256,
++                                  cc3xx_key_type, (const uint32_t *)inp=
ut_key, CC3XX_AES_KEYSIZE_256,
+                                   (uint32_t *)counter, 16);
+     fih_rc =3D fih_int_encode_zero_equality(err);
+     if (fih_not_eq(fih_rc, FIH_SUCCESS)) {
+@@ -388,7 +388,7 @@ static int32_t aes_256_ecb_encrypt(enum tfm_bl1_key_=
id_t key_id,
+         return -1;
+     }
+=20
+-    rc =3D bl1_key_to_cc3xx_key(key_id, &cc3xx_key_type, key_buf, sizeo=
f(key_buf));
++    rc =3D bl1_key_to_cc3xx_key(key_id, &cc3xx_key_type, (uint8_t *)key=
_buf, sizeof(key_buf));
+     if (rc) {
+         return rc;
+     }
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0001-Build-Fix-compiler-warnings.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/psa-adac/0001-Build-Fix-compil=
er-warnings.patch
new file mode 100644
index 000000000000..9fa1c42a7395
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0001-Build-Fix-compiler-warnings.patch
@@ -0,0 +1,151 @@
+From 6391a6189ee2024f0ef956f56373f79128576230 Mon Sep 17 00:00:00 2001
+From: Maulik Patel <maulik.patel@arm.com>
+Date: Tue, 23 Sep 2025 21:26:44 +0100
+Subject: [PATCH] Build: Fix compiler warnings
+
+- Add header crypto_hw for crypto_hw_apply_debug_permissions()
+- Add header int_com_port_driver.h for IComPortRxIntInit()
+- Move psa_adac_platform_init() declaration to psa_adac_platform.h
+- Add include path for psa-adac/transport_layer/transports/sdc-600
+
+Signed-off-by: Maulik Patel <maulik.patel@arm.com>
+Change-Id: I34f774a9843f7a3a62ad447fa0ae607184bd800a
+
+Upstream-Status: Backport [6391a6189ee2024f0ef956f56373f79128576230]
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ .../platform/arm/corstone1000/CMakeLists.txt               | 2 ++
+ .../platform/arm/corstone1000/corstone1000.c               | 7 ++++++-
+ .../platform/arm/corstone1000/include/platform/platform.h  | 1 -
+ .../platform/arm/corstone1000/include/psa_adac_platform.h  | 6 ++++++
+ .../platform/arm/rse/common/CMakeLists.txt                 | 1 +
+ .../platform/arm/rse/common/include/platform/platform.h    | 1 -
+ .../platform/arm/rse/common/include/psa_adac_platform.h    | 7 +++++++
+ .../platform/arm/rse/common/psa_adac_platform.c            | 5 +++++
+ 8 files changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/target/trusted-firmware-m/platform/arm/corstone1000/CMakeLi=
sts.txt b/target/trusted-firmware-m/platform/arm/corstone1000/CMakeLists.=
txt
+index c36259e0b31f..604c9b72745d 100644
+--- a/target/trusted-firmware-m/platform/arm/corstone1000/CMakeLists.txt
++++ b/target/trusted-firmware-m/platform/arm/corstone1000/CMakeLists.txt
+@@ -20,6 +20,8 @@ target_include_directories(${PROJECT_NAME}
+         ${CMAKE_CURRENT_SOURCE_DIR}
+         ${PSA_ADAC_MBEDTLS_INCLUDE}
+         ${PSA_ADAC_ROOT}/transport_layer/transports
++        ${PSA_ADAC_ROOT}/transport_layer/transports/sdc-600
++
+ )
+=20
+ target_compile_definitions(${PROJECT_NAME}
+diff --git a/target/trusted-firmware-m/platform/arm/corstone1000/corston=
e1000.c b/target/trusted-firmware-m/platform/arm/corstone1000/corstone100=
0.c
+index e629eed97236..e979b3246e12 100644
+--- a/target/trusted-firmware-m/platform/arm/corstone1000/corstone1000.c
++++ b/target/trusted-firmware-m/platform/arm/corstone1000/corstone1000.c
+@@ -12,6 +12,11 @@
+ #include "platform/msg_interface.h"
+ #include "demo-anchors.h"
+ #include <string.h>
++#include "crypto_hw.h"
++
++#ifdef PSA_ADAC_AS_TFM_RUNTIME_SERVICE
++#include "int_com_port_driver.h"
++#endif /* PSA_ADAC_AS_TFM_RUNTIME_SERVICE */
+=20
+ extern uint8_t discovery_template[];
+ extern size_t discovery_template_len;
+@@ -70,7 +75,7 @@ int psa_adac_platform_check_certificate(uint8_t *crt, =
size_t crt_size)
+=20
+ int psa_adac_to_tfm_apply_permissions(uint8_t permissions_mask[16])
+ {
+-    /* This implementation only support coarse-grained secure debug=20
++    /* This implementation only support coarse-grained secure debug
+      * unlock (closed/open). Fine-grained access-control can be
+      * supported by defining a mapping from permissions_mask to
+      * dcu_reg_values.
+diff --git a/target/trusted-firmware-m/platform/arm/corstone1000/include=
/platform/platform.h b/target/trusted-firmware-m/platform/arm/corstone100=
0/include/platform/platform.h
+index e99d0d55f624..82b416f5f67f 100644
+--- a/target/trusted-firmware-m/platform/arm/corstone1000/include/platfo=
rm/platform.h
++++ b/target/trusted-firmware-m/platform/arm/corstone1000/include/platfo=
rm/platform.h
+@@ -31,7 +31,6 @@ adac_status_t psa_adac_change_life_cycle_state(uint8_t=
 *input, size_t input_size
+ void psa_adac_close_session(void);
+ void psa_adac_resume(void);
+ void psa_adac_platform_lock(void);
+-void psa_adac_platform_init(void);
+ int psa_adac_detect_debug_request(void);
+ void psa_adac_acknowledge_debug_request(void);
+=20
+diff --git a/target/trusted-firmware-m/platform/arm/corstone1000/include=
/psa_adac_platform.h b/target/trusted-firmware-m/platform/arm/corstone100=
0/include/psa_adac_platform.h
+index 26f10f8999ca..2ae4569f5ff1 100644
+--- a/target/trusted-firmware-m/platform/arm/corstone1000/include/psa_ad=
ac_platform.h
++++ b/target/trusted-firmware-m/platform/arm/corstone1000/include/psa_ad=
ac_platform.h
+@@ -30,5 +30,11 @@ int tfm_to_psa_adac_corstone1000_secure_debug(uint8_t=
 *secure_debug_rotpk, uint3
+  */
+ int psa_adac_to_tfm_apply_permissions(uint8_t permissions_mask[16]);
+=20
++/*
++ * Platform initialization function for PSA ADAC.
++ * This function should be called during runtime service init to initia=
lize
++ * the PSA ADAC platform-specific components.
++ */
++void psa_adac_platform_init(void);
+=20
+ #endif /* __PSA_ADAC_PLATFORM_H__ */
+diff --git a/target/trusted-firmware-m/platform/arm/rse/common/CMakeList=
s.txt b/target/trusted-firmware-m/platform/arm/rse/common/CMakeLists.txt
+index 67214bb3f354..d1b9718a8183 100644
+--- a/target/trusted-firmware-m/platform/arm/rse/common/CMakeLists.txt
++++ b/target/trusted-firmware-m/platform/arm/rse/common/CMakeLists.txt
+@@ -23,6 +23,7 @@ target_include_directories(${PROJECT_NAME}
+         ${PSA_ADAC_MBEDTLS_INCLUDE}
+         ${PSA_ADAC_ROOT}/transport_layer/transports
+         ${TFM_SRC_DIR}/platform/ext/target/arm/rse/common/partition
++        ${PSA_ADAC_ROOT}/transport_layer/transports/sdc-600
+ )
+=20
+ target_compile_definitions(${PROJECT_NAME}
+diff --git a/target/trusted-firmware-m/platform/arm/rse/common/include/p=
latform/platform.h b/target/trusted-firmware-m/platform/arm/rse/common/in=
clude/platform/platform.h
+index 57044f05a67a..afd4b3033a4b 100644
+--- a/target/trusted-firmware-m/platform/arm/rse/common/include/platform=
/platform.h
++++ b/target/trusted-firmware-m/platform/arm/rse/common/include/platform=
/platform.h
+@@ -32,7 +32,6 @@ void psa_adac_resume(void);
+ void psa_adac_platform_lock(void);
+ int psa_adac_platform_check_token(uint8_t *token, size_t token_size);
+ int psa_adac_platform_check_certificate(uint8_t *crt, size_t crt_size);
+-void psa_adac_platform_init(void);
+ int psa_adac_detect_debug_request(void);
+ void psa_adac_acknowledge_debug_request(void);
+ int psa_adac_apply_permissions(uint8_t permissions_mask[16]);
+diff --git a/target/trusted-firmware-m/platform/arm/rse/common/include/p=
sa_adac_platform.h b/target/trusted-firmware-m/platform/arm/rse/common/in=
clude/psa_adac_platform.h
+index a47788566aec..3e1dc73c4e0e 100644
+--- a/target/trusted-firmware-m/platform/arm/rse/common/include/psa_adac=
_platform.h
++++ b/target/trusted-firmware-m/platform/arm/rse/common/include/psa_adac=
_platform.h
+@@ -34,6 +34,13 @@ int tfm_to_psa_adac_rse_secure_debug(uint8_t *secure_=
debug_rotpk, uint32_t len);
+  */
+ int psa_adac_to_tfm_apply_permissions(uint8_t permissions_mask[16]);
+=20
++/*
++ * Platform initialization function for PSA ADAC.
++ * This function should be called during runtime service init to initia=
lize
++ * the PSA ADAC platform-specific components.
++ */
++void psa_adac_platform_init(void);
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/target/trusted-firmware-m/platform/arm/rse/common/psa_adac_=
platform.c b/target/trusted-firmware-m/platform/arm/rse/common/psa_adac_p=
latform.c
+index fa2e7c023ef4..5c5cfd1529a3 100644
+--- a/target/trusted-firmware-m/platform/arm/rse/common/psa_adac_platfor=
m.c
++++ b/target/trusted-firmware-m/platform/arm/rse/common/psa_adac_platfor=
m.c
+@@ -21,6 +21,11 @@
+ #include "rse_debug_after_reset.h"
+ #include "lcm_drv.h"
+ #include "device_definition.h"
++
++#ifdef PSA_ADAC_AS_TFM_RUNTIME_SERVICE
++#include "int_com_port_driver.h"
++#endif /* PSA_ADAC_AS_TFM_RUNTIME_SERVICE */
++
+ #define ROTPK_ANCHOR_ALG PSA_ALG_SHA_512
+ #define UINT8_SIZE_IN_BITS  8
+=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 2b44f16860a5..ce5ffa29c5c5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -4,7 +4,11 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
 TFM_PLATFORM =3D "arm/corstone1000"
=20
+# FIXME - debug shouldn't be used here, as it should be used when doing =
bring up or actual debug.  However, switching this to the release version=
 causes issues with TFM related to=20
+# sbrk.c:(.text._sbrk+0x18): undefined reference to `end'
+# which is being caused by heap not being enabled.. So, just use the siz=
e optimization to keep this small enough to fit in to flash
 TFM_DEBUG =3D "1"
+EXTRA_OECMAKE:append =3D " -DCMAKE_C_FLAGS_DEBUG=3D'-Os -g'"
=20
 # These dependencies are needed for TF-M v2.2.0 and above
 # https://github.com/TrustedFirmware-M/trusted-firmware-m/blob/TF-Mv2.2.=
0/tools/requirements.txt
@@ -27,8 +31,6 @@ EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM=
_PSA_ADAC_SECURE_DEBUG=3D${@b
 EXTRA_OECMAKE:append:corstone1000-mps3 =3D " -DPLATFORM_PSA_ADAC_SOURCE_=
PATH=3D${UNPACKDIR}/tfm-psa-adac -DPLATFORM_PSA_ADAC_BUILD_PATH=3D${B}/tf=
m-psa-adac-build"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
-SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"
 SRC_URI:append:corstone1000 =3D " \
     file://0001-arm-trusted-firmware-m-disable-address-warnings-into.pat=
ch \
     file://0002-Platform-CS1000-Remove-unused-BL1-files.patch \
@@ -38,17 +40,21 @@ SRC_URI:append:corstone1000 =3D " \
     file://0006-Platform-Corstone1000-Implement-Bootloader-Abstracti.pat=
ch \
     file://0007-Platform-Corstone1000-Increase-buffer-sizes.patch \
     file://0008-Platform-Corstone1000-Remove-duplicate-configuration.pat=
ch \
-    file://0010-plat-corstone1000-Add-support-for-Cortex-A320-varian.pat=
ch \
-    file://0011-Corstone-1000-Enable-different-DRBG-configurations.patch=
 \
-    file://0012-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.pat=
ch \
-    file://0013-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch \
+    file://0009-plat-corstone1000-Add-support-for-Cortex-A320-varian.pat=
ch \
+    file://0010-Corstone-1000-Enable-different-DRBG-configurations.patch=
 \
+    file://0011-bl2-corstone-1000-Remove-psa_adac_to_tfm_apply_permi.pat=
ch \
+    file://0012-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch \
+    file://0013-Build-adjust-CS1000-platform-for-GCC-v14.2.patch \
+    file://0014-Workaround-compile-errors-in-AES.patch \
     "
=20
+SRCREV_tfm-psa-adac:corstone1000 =3D "f2809ae231be33a1afcd7714f40756c67d=
846c88"
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
 SRC_URI:append:corstone1000-mps3 =3D " \
     file://0001-PSA-revert-header-versions.patch;patchdir=3D../tfm-psa-a=
dac \
     file://0002-Fix-psa_key_handle_t-initialization.patch;patchdir=3D../=
tfm-psa-adac \
     file://0003-cmake-Update-psa_adac_psa_crypto-dependencies.patch;patc=
hdir=3D../tfm-psa-adac \
+    file://0001-Build-Fix-compiler-warnings.patch;patchdir=3D../tfm-psa-=
adac \
     "
=20
 create_bl1_image(){
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.1.4.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.=
4.bb
index 3464f49dd9d1..e206a2a5a0da 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.4.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.4.bb
@@ -1,2 +1,7 @@
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+
+# FIXME - arm-none-eabi/bin/ld: error: unsupported option: -z relro
+# Working around the issue by removing the loader flags, which aren't re=
levant for us here
+# Long term fix, create a baremetal firmware bbclass that doesn't add th=
is stuff
+SECURITY_LDFLAGS =3D ""
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.=
2.bb
index 3464f49dd9d1..e206a2a5a0da 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.2.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.2.2.bb
@@ -1,2 +1,7 @@
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m-${PV}-src.inc
 require recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+
+# FIXME - arm-none-eabi/bin/ld: error: unsupported option: -z relro
+# Working around the issue by removing the loader flags, which aren't re=
levant for us here
+# Long term fix, create a baremetal firmware bbclass that doesn't add th=
is stuff
+SECURITY_LDFLAGS =3D ""
--=20
2.50.1 (Apple Git-155)


