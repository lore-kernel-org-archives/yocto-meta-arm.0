Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A291BCA6015
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 14:13:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8812.1791555235019338346
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Oct 2026 07:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=tqmoz2NB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0171C1BB2
	for <meta-arm@lists.yoctoproject.org>; Fri,  9 Oct 2026 07:13:51 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28E523F66F
	for <meta-arm@lists.yoctoproject.org>; Fri,  9 Oct 2026 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791555234; bh=TcBJ1ogtmAV/5okR2ImcOwncFN2wzpL34kcmISzzMZI=;
	h=From:To:Subject:Date:From;
	b=tqmoz2NBDd7ns2T+XiVXS2aLdKGPKxAwqsyedY0yPt1ZBpbASPqJhiFrkZo61fzw4
	 s80VY5a/dBq2mdbg62/AVvH2hCB6zYALxiVuZiJXerLKqjB85XtAuEMpTYwm4UZscb
	 RRVzQaItsOshy3S4Au3NcqKoC2vxlcWk6t7mKDpo=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-m: update to 2.3.1
Date: Fri,  9 Oct 2026 10:13:53 -0400
Message-ID: <20261009141353.30701-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Oct 2026 14:13:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7185

Update Trusted Firmware-M from 2.3.0 to the 2.3.1 release.
This requires rebasing corstone1000 patches

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...of-cc312-differences-between-fvp-and.patch |  13 +-
 ...Enable-different-DRBG-configurations.patch |  11 +-
 ...-1000-secure-debug-waiting-in-CM-LCS.patch |   9 +-
 ...-remaining-GCC-v14.2-AES-type-error.patch} |   9 +-
 ...5-plat-cs1k-Removed-unused-variables.patch |  15 +-
 ...ent-of-GUIDs-in-unittests-more-clear.patch |  10 +-
 ...Provide-macro-identifying-free-space.patch |   9 +-
 ...t-Add-operation-to-duplicate-entries.patch |  13 +-
 ...ively-erase-blocks-when-moving-parti.patch |  10 +-
 .../0010-lib-gpt-Clarify-API-operation.patch  |   9 +-
 ...gpt-Add-metadata-only-API-operations.patch |  13 +-
 ...plat-cs1k-Add-flash-erase-protection.patch |   9 +-
 ...-unused-FWU-partitions-upon-version-.patch | 153 ------------
 ...one1000-Increase-FIP-partition-size.patch} |   9 +-
 ...lat-cs1k-Duplicate-old-images-in-FWU.patch | 217 ------------------
 ...one1000-keep-CM-during-secure-debug.patch} |  16 +-
 ...-Fix-missing-destination-offset-of-p.patch |  92 --------
 ...Bound-FWU-writes-to-target-partition.patch |  61 -----
 .../trusted-firmware-m-corstone1000.inc       |  10 +-
 ...c.inc =3D> trusted-firmware-m-2.3.1-src.inc} |  20 +-
 ...rusted-firmware-m-scripts-native_2.3.1.bb} |   0
 ...m_2.3.0.bb =3D> trusted-firmware-m_2.3.1.bb} |   0
 22 files changed, 112 insertions(+), 596 deletions(-)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
004-Workaround-compile-errors-in-AES.patch =3D> 0004-Build-fix-remaining-=
GCC-v14.2-AES-type-error.patch} (86%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0013-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
015-platform-corstone1000-Increase-FIP-partition-size.patch =3D> 0013-pla=
tform-corstone1000-Increase-FIP-partition-size.patch} (88%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0014-plat-cs1k-Duplicate-old-images-in-FWU.patch
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/{0=
016-platform-corstone1000-Optionally-skip-provisioning.patch =3D> 0014-pl=
atform-corstone1000-keep-CM-during-secure-debug.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0017-corstone1000-fwu-Fix-missing-destination-offset-of-p.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0018-plat-cs1k-Bound-FWU-writes-to-target-partition.patch
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-2.3.0=
-src.inc =3D> trusted-firmware-m-2.3.1-src.inc} (91%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-scrip=
ts-native_2.3.0.bb =3D> trusted-firmware-m-scripts-native_2.3.1.bb} (100%=
)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_2.3.0=
.bb =3D> trusted-firmware-m_2.3.1.bb} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0001-CC312-alignment-of-cc312-differences-between-fvp-and.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001-CC312-ali=
gnment-of-cc312-differences-between-fvp-and.patch
index 7aa4d5e9bbdd..590e22ed98b4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0001=
-CC312-alignment-of-cc312-differences-between-fvp-and.patch
@@ -1,8 +1,8 @@
-From 4274b94aa0af175e31b8883ec6f2113133608e24 Mon Sep 17 00:00:00 2001
+From 4cfcc1af5dd1a9aaadcf42a46d5dc769977b4fed Mon Sep 17 00:00:00 2001
 From: Ali Can Ozaslan <ali.oezaslan@arm.com>
 Date: Wed, 15 May 2024 12:12:15 +0000
-Subject: [PATCH] CC312: alignment of cc312 differences between fvp and m=
ps3
- corstone1000 platforms
+Subject: [PATCH 01/14] CC312: alignment of cc312 differences between fvp=
 and
+ mps3 corstone1000 platforms
=20
 Configures CC312 mps3 model same as predefined cc312 FVP
 configuration while keeping debug ports closed.
@@ -15,10 +15,10 @@ Upstream-Status: Inappropriate [Requires an aligment =
cc3xx with mps3 hw and fvp
  1 file changed, 3 insertions(+)
=20
 diff --git a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c b=
/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
-index 31e4332bed64..4b08c02526d3 100644
+index b43e86988a41..af8181ca815a 100644
 --- a/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
 +++ b/lib/ext/cryptocell-312-runtime/host/src/cc3x_lib/cc_lib.c
-@@ -207,6 +207,9 @@ CClibRetCode_t CC_LibInit(CCRndContext_t *rndContext=
_ptr, CCRndWorkBuff_t  *rndW
+@@ -209,6 +209,9 @@ CClibRetCode_t CC_LibInit(CCRndContext_t *rndContext=
_ptr, CCRndWorkBuff_t  *rndW
          goto InitErr2;
      }
 =20
@@ -28,3 +28,6 @@ index 31e4332bed64..4b08c02526d3 100644
      /* turn off the DFA since Cerberus doen't support it */
      reg =3D CC_HAL_READ_REGISTER(CC_REG_OFFSET(HOST_RGF, HOST_AO_LOCK_B=
ITS));
      CC_REG_FLD_SET(0, HOST_AO_LOCK_BITS, HOST_FORCE_DFA_ENABLE, reg, 0x=
0);
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0002-Corstone-1000-Enable-different-DRBG-configurations.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002-Corstone-10=
00-Enable-different-DRBG-configurations.patch
index 41414148ca08..32564268fe79 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Corstone-1000-Enable-different-DRBG-configurations.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0002=
-Corstone-1000-Enable-different-DRBG-configurations.patch
@@ -1,7 +1,7 @@
-From dae5f3d1ec85e29f44d3f19bec2312607751ec22 Mon Sep 17 00:00:00 2001
+From a02970f522567169fa1851ab1b5431793e365cb0 Mon Sep 17 00:00:00 2001
 From: Devaraj Ranganna <devaraj.ranganna@arm.com>
 Date: Thu, 18 Sep 2025 22:07:38 +0100
-Subject: [PATCH] Corstone-1000: Enable different DRBG configurations
+Subject: [PATCH 02/14] Corstone-1000: Enable different DRBG configuratio=
ns
=20
 The following DRBG configurations are enabled:
=20
@@ -18,10 +18,10 @@ Signed-off-by: Devaraj Ranganna <devaraj.ranganna@arm=
.com>
  1 file changed, 7 insertions(+)
=20
 diff --git a/platform/ext/target/arm/corstone1000/cc3xx_config.h b/platf=
orm/ext/target/arm/corstone1000/cc3xx_config.h
-index ac034b17982a..e3f78439861f 100644
+index 68707f3a2194..8c53cace937c 100644
 --- a/platform/ext/target/arm/corstone1000/cc3xx_config.h
 +++ b/platform/ext/target/arm/corstone1000/cc3xx_config.h
-@@ -90,6 +90,13 @@
+@@ -100,6 +100,13 @@
  #error "cc3xx_config: RNG config must select a single DRBG"
  #endif /* CC3XX_CONFIG_RNG_DRBG_HMAC + CC3XX_CONFIG_RNG_DRBG_CTR + CC3X=
X_CONFIG_RNG_DRBG_HASH */
 =20
@@ -35,3 +35,6 @@ index ac034b17982a..e3f78439861f 100644
  /* Whether an external TRNG should be used in place of the standard CC3=
XX TRNG */
  /* #define CC3XX_CONFIG_RNG_EXTERNAL_TRNG */
 =20
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0003-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch b/meta-arm=
-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003-bl2-corstone-=
1000-secure-debug-waiting-in-CM-LCS.patch
index d458a435188b..29e9cf2b6af3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0003=
-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch
@@ -1,7 +1,7 @@
-From f0567aa80b2cc88d278c3adb0a5366ae9ff8cf58 Mon Sep 17 00:00:00 2001
+From d8141d0d445bc5117b21dc684410b115e82d5568 Mon Sep 17 00:00:00 2001
 From: Devaraj Ranganna <devaraj.ranganna@arm.com>
 Date: Mon, 22 Sep 2025 12:59:43 +0100
-Subject: [PATCH] bl2: corstone-1000: secure debug waiting in CM LCS
+Subject: [PATCH 03/14] bl2: corstone-1000: secure debug waiting in CM LC=
S
=20
 Currently, when the device is in Secure Enable (SE) LCS state,
 setting the dcu_en register causes a CC-312 reset. Because CC-312 and
@@ -20,7 +20,7 @@ Signed-off-by: Ahmed Gomaa <Ahmed.Gomaa@arm.com>
  1 file changed, 30 insertions(+), 16 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c b/p=
latform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
-index 9bc0f20e10..d034efe59f 100644
+index 9bc0f20e1045..d034efe59f5d 100644
 --- a/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
 +++ b/platform/ext/target/arm/corstone1000/bl2/boot_hal_bl2.c
 @@ -187,7 +187,7 @@ int32_t boot_platform_post_init(void)
@@ -88,3 +88,6 @@ index 9bc0f20e10..d034efe59f 100644
  #endif /* PLATFORM_PSA_ADAC_SECURE_DEBUG */
 =20
      return 0;
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0004-Workaround-compile-errors-in-AES.patch b/meta-arm-bsp/recipes-bsp=
/trusted-firmware-m/files/corstone1000/0004-Build-fix-remaining-GCC-v14.2=
-AES-type-error.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0004-Workaround-compile-errors-in-AES.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0004-Build-fix-remaining-GCC-v14.2-AES-type-error.patch
index 453c86850645..8f03c2c9282c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Workaround-compile-errors-in-AES.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0004=
-Build-fix-remaining-GCC-v14.2-AES-type-error.patch
@@ -1,7 +1,7 @@
-From cc48c5782b6968a34fa69047c04f3caf99a3bf18 Mon Sep 17 00:00:00 2001
+From 8a30545506d8a7f58f0ad30130593e0f78e8b219 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jon.mason@arm.com>
 Date: Mon, 23 Feb 2026 11:53:38 -0500
-Subject: [PATCH] Build: fix remaining GCC v14.2 AES type error
+Subject: [PATCH 04/14] Build: fix remaining GCC v14.2 AES type error
=20
 GCC v14.2 diagnoses the incompatible pointer type used when passing
 the ECB key buffer to bl1_key_to_cc3xx_key(). Cast the uint32_t key
@@ -16,7 +16,7 @@ Signed-off-by: Ahmed Gomaa <Ahmed.Gomaa@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c=
 b/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c
-index 6bc89fe115..2008e9641b 100644
+index 6bc89fe1155c..2008e9641b49 100644
 --- a/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c
 +++ b/platform/ext/target/arm/corstone1000/bl1/cc312_rom_crypto.c
 @@ -338,7 +338,7 @@ static int32_t aes_256_ecb_encrypt(enum tfm_bl1_key_=
id_t key_id,
@@ -28,3 +28,6 @@ index 6bc89fe115..2008e9641b 100644
      if (rc) {
          return rc;
      }
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0005-plat-cs1k-Removed-unused-variables.patch b/meta-arm-bsp/recipes-b=
sp/trusted-firmware-m/files/corstone1000/0005-plat-cs1k-Removed-unused-va=
riables.patch
index f10a65574430..0a0a5335f7e8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-plat-cs1k-Removed-unused-variables.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0005=
-plat-cs1k-Removed-unused-variables.patch
@@ -1,7 +1,7 @@
-From 3dcaa54afe671534b11a0586a49a9036b2bb2011 Mon Sep 17 00:00:00 2001
+From 9192041a3e6eec6b9e63dbdbe7fa49581aafa5b2 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 29 Dec 2025 11:28:47 +0000
-Subject: [PATCH] plat: cs1k: Removed unused variables
+Subject: [PATCH 05/14] plat: cs1k: Removed unused variables
=20
 Change-Id: I0dd3ff834c47c58dc833586c74791deca679a3ab
 Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
@@ -12,10 +12,10 @@ Signed-off-by: Ahmed Gomaa <Ahmed.Gomaa@arm.com>
  1 file changed, 4 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
-index 9fe9df0..89c2696 100644
+index deb14a9215b5..ed4a9f6804c9 100644
 --- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
 +++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-@@ -1594,7 +1594,6 @@ static psa_status_t fwu_accept_image(struct fwu_me=
tadata *metadata,
+@@ -1614,7 +1614,6 @@ static psa_status_t fwu_accept_image(struct fwu_me=
tadata *metadata,
          uint8_t number)
  {
      uint8_t current_state;
@@ -23,7 +23,7 @@ index 9fe9df0..89c2696 100644
      uint32_t active_bank_index;
      uint32_t fwu_image_index;
      psa_status_t ret;
-@@ -2070,7 +2069,6 @@ static psa_status_t fwu_update_metadata(const psa_=
fwu_component_t *candidates, u
+@@ -2160,7 +2159,6 @@ static psa_status_t fwu_update_metadata(const psa_=
fwu_component_t *candidates, u
  {
      int ret;
      uint32_t active_index;
@@ -31,7 +31,7 @@ index 9fe9df0..89c2696 100644
      uint32_t previous_active_index;
      uint8_t fwu_image_index;
 =20
-@@ -2085,10 +2083,8 @@ static psa_status_t fwu_update_metadata(const psa=
_fwu_component_t *candidates, u
+@@ -2175,10 +2173,8 @@ static psa_status_t fwu_update_metadata(const psa=
_fwu_component_t *candidates, u
      active_index =3D _metadata.active_index;
      if (active_index =3D=3D BANK_0) {
          previous_active_index =3D BANK_1;
@@ -42,3 +42,6 @@ index 9fe9df0..89c2696 100644
      } else {
          FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,active_in=
dex);
          ret =3D PSA_ERROR_DATA_INVALID;
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-lib-gpt-S=
how-intent-of-GUIDs-in-unittests-more-clear.patch
index 1279db9d237a..4480727cb223 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.patch
@@ -1,7 +1,8 @@
-From ca0d50fc1abbfe165941dc0bd674bb117f236f87 Mon Sep 17 00:00:00 2001
+From 81813176251a37995390338914f309d8ca72549d Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 30 Mar 2026 14:06:20 +0100
-Subject: [PATCH] lib: gpt: Show intent of GUIDs in unittests more clearl=
y
+Subject: [PATCH 06/14] lib: gpt: Show intent of GUIDs in unittests more
+ clearly
=20
 The standard EFI_GUID macros used in the unittests do not convey the
 full meaning of the why that particular GUID is used. The new macros can
@@ -16,7 +17,7 @@ Upstream-Status: Submitted [https://review.trustedfirmw=
are.org/c/TF-M/trusted-fi
  1 file changed, 31 insertions(+), 24 deletions(-)
=20
 diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
-index bd161ec74..32dfb8fb2 100644
+index bd161ec7445b..32dfb8fb2757 100644
 --- a/lib/gpt/unittests/gpt/test_gpt.c
 +++ b/lib/gpt/unittests/gpt/test_gpt.c
 @@ -69,6 +69,13 @@
@@ -214,3 +215,6 @@ index bd161ec74..32dfb8fb2 100644
      TEST_ASSERT_EQUAL(PSA_ERROR_DOES_NOT_EXIST, gpt_entry_read_by_type(=
&test_type, 0, &entry));
 =20
      /* Now, have a non-empty GPT but search for a type that won't exist=
 */
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0007-lib-gpt-Provide-macro-identifying-free-space.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/0007-lib-gpt-Provide-m=
acro-identifying-free-space.patch
index 3deaf93a546f..aa26d373fee7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-lib-gpt-Provide-macro-identifying-free-space.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0007=
-lib-gpt-Provide-macro-identifying-free-space.patch
@@ -1,7 +1,7 @@
-From 229313778bae6ca16d6e3b25437c8e87eddf3084 Mon Sep 17 00:00:00 2001
+From 02ce1958e127f0bec9bfb86cd3a3e406644e1fce Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 30 Mar 2026 14:35:45 +0100
-Subject: [PATCH] lib: gpt: Provide macro identifying free space
+Subject: [PATCH 07/14] lib: gpt: Provide macro identifying free space
=20
 In the unit tests, it is often required to know where free space on the
 mocked disk is in order to determine where it is valid to create or move
@@ -15,7 +15,7 @@ Upstream-Status: Submitted [https://review.trustedfirmw=
are.org/c/TF-M/trusted-fi
  1 file changed, 23 insertions(+), 19 deletions(-)
=20
 diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
-index 32dfb8fb2..0ae660336 100644
+index 32dfb8fb2757..0ae6603368e8 100644
 --- a/lib/gpt/unittests/gpt/test_gpt.c
 +++ b/lib/gpt/unittests/gpt/test_gpt.c
 @@ -58,6 +58,7 @@
@@ -155,3 +155,6 @@ index 32dfb8fb2..0ae660336 100644
 =20
      /* Fourth, start in the backup header area */
      TEST_ASSERT_EQUAL(PSA_ERROR_INVALID_ARGUMENT, gpt_entry_move(
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0008-lib-gpt-Add-operation-to-duplicate-entries.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0008-lib-gpt-Add-operati=
on-to-duplicate-entries.patch
index 09fcb39a9898..cc761af69054 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-lib-gpt-Add-operation-to-duplicate-entries.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0008=
-lib-gpt-Add-operation-to-duplicate-entries.patch
@@ -1,7 +1,7 @@
-From 38daa61f876a6becb3968f1360d403f496634131 Mon Sep 17 00:00:00 2001
+From 69ee51ca58f8b1460a9ce4649c0e07f21201ff0a Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 16 Mar 2026 16:46:43 +0000
-Subject: [PATCH] lib: gpt: Add operation to duplicate entries
+Subject: [PATCH 08/14] lib: gpt: Add operation to duplicate entries
=20
 Without this new function, callers of the library would have to first
 read the entry they want to duplicate, then attempt to create a new
@@ -20,7 +20,7 @@ Upstream-Status: Submitted [https://review.trustedfirmw=
are.org/c/TF-M/trusted-fi
  3 files changed, 201 insertions(+)
=20
 diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
-index 34ce67580..334a08f41 100644
+index 34ce675801b3..334a08f41abe 100644
 --- a/lib/gpt/inc/gpt.h
 +++ b/lib/gpt/inc/gpt.h
 @@ -170,6 +170,25 @@ psa_status_t gpt_entry_move(const struct efi_guid_t=
 *guid,
@@ -50,7 +50,7 @@ index 34ce67580..334a08f41 100644
   * \brief Creates a partition entry in the table.
   *
 diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
-index 0335befa7..920c4ccca 100644
+index 0335befa7770..920c4ccca78e 100644
 --- a/lib/gpt/src/gpt.c
 +++ b/lib/gpt/src/gpt.c
 @@ -516,6 +516,29 @@ psa_status_t gpt_entry_move(const struct efi_guid_t=
 *guid,
@@ -84,7 +84,7 @@ index 0335befa7..920c4ccca 100644
                                const uint64_t           start,
                                const uint64_t           size,
 diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
-index 0ae660336..5d2c4243f 100644
+index 0ae6603368e8..5d2c4243f607 100644
 --- a/lib/gpt/unittests/gpt/test_gpt.c
 +++ b/lib/gpt/unittests/gpt/test_gpt.c
 @@ -738,6 +738,165 @@ void test_gpt_defragment_should_succeedWhenNoIOFai=
lure(void)
@@ -253,3 +253,6 @@ index 0ae660336..5d2c4243f 100644
  void test_gpt_entry_create_should_createNewEntry(void)
  {
      /* Add an entry. It must not overlap with an existing entry and mus=
t also
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-lib-gpt-C=
onsecutively-erase-blocks-when-moving-parti.patch
index 53eabd6eae27..6c49b9fd1872 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-lib-gpt-Consecutively-erase-blocks-when-moving-parti.patch
@@ -1,7 +1,8 @@
-From 0dcbef3a0800a2a610b32935a54762d4b42203f1 Mon Sep 17 00:00:00 2001
+From 4dab128d0da86be6ca09b861dfb157a11345e0e7 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Tue, 17 Mar 2026 11:44:14 +0000
-Subject: [PATCH] lib: gpt: Consecutively erase blocks when moving partit=
ions
+Subject: [PATCH 09/14] lib: gpt: Consecutively erase blocks when moving
+ partitions
=20
 An LBA is typically smaller than a flash sector size, so it becomes
 inefficient to erase block by block and also erases the same sector
@@ -21,7 +22,7 @@ Upstream-Status: Submitted [https://review.trustedfirmw=
are.org/c/TF-M/trusted-fi
  1 file changed, 75 insertions(+), 27 deletions(-)
=20
 diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
-index 920c4ccca..984c8f821 100644
+index 920c4ccca78e..984c8f82146c 100644
 --- a/lib/gpt/src/gpt.c
 +++ b/lib/gpt/src/gpt.c
 @@ -207,7 +207,7 @@ static psa_status_t read_entry_from_flash(const stru=
ct gpt_t *table,
@@ -238,3 +239,6 @@ index 920c4ccca..984c8f821 100644
      memcpy(lba_buf, temp_buf, GPT_HEADER_SIZE);
 =20
      return ret;
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-lib-gpt-Clarify-API-operation.patch b/meta-arm-bsp/recipes-bsp/tr=
usted-firmware-m/files/corstone1000/0010-lib-gpt-Clarify-API-operation.pa=
tch
index 29986c43ef85..92962b845ef8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-lib-gpt-Clarify-API-operation.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-lib-gpt-Clarify-API-operation.patch
@@ -1,7 +1,7 @@
-From 7e2ae2fc4f8ae8a16a24b87d0650c6b4b28fc870 Mon Sep 17 00:00:00 2001
+From 60608602c55f92c82263775cbe42b221f3ea5f09 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Wed, 8 Apr 2026 17:39:13 +0100
-Subject: [PATCH] lib: gpt: Clarify API operation
+Subject: [PATCH 10/14] lib: gpt: Clarify API operation
=20
 The move and duplicate operations both also move or copy (respectively)
 the partition data, which is not immediately obvious.
@@ -14,7 +14,7 @@ Upstream-Status: Submitted [https://review.trustedfirmw=
are.org/c/TF-M/trusted-fi
  1 file changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
-index 334a08f41..c11ecbff2 100644
+index 334a08f41abe..c11ecbff2619 100644
 --- a/lib/gpt/inc/gpt.h
 +++ b/lib/gpt/inc/gpt.h
 @@ -152,7 +152,7 @@ __attribute__((nonnull(1)))
@@ -36,3 +36,6 @@ index 334a08f41..c11ecbff2 100644
   *
   * \param[in]  old_guid Entry to duplicate.
   * \param[in]  start    Starting LBA (0 uses the lowest free LBA possib=
le).
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0011-lib-gpt-Add-metadata-only-API-operations.patch b/meta-arm-bsp/rec=
ipes-bsp/trusted-firmware-m/files/corstone1000/0011-lib-gpt-Add-metadata-=
only-API-operations.patch
index e3320caf877a..89f207e37a9b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-lib-gpt-Add-metadata-only-API-operations.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0011=
-lib-gpt-Add-metadata-only-API-operations.patch
@@ -1,7 +1,7 @@
-From f9badce3570bbc89b141c86a6b8a988d90d81f0c Mon Sep 17 00:00:00 2001
+From b10d50f554745f2f9a2e43c24e1020c4da15a098 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Wed, 8 Apr 2026 17:51:18 +0100
-Subject: [PATCH] lib: gpt: Add metadata-only API operations
+Subject: [PATCH 11/14] lib: gpt: Add metadata-only API operations
=20
 Both move and duplicate functions also move or copy (respectively) the
 partition data. This is not always required, for example if the
@@ -17,7 +17,7 @@ Upstream-Status: Submitted [https://review.trustedfirmw=
are.org/c/TF-M/trusted-fi
  3 files changed, 473 insertions(+), 120 deletions(-)
=20
 diff --git a/lib/gpt/inc/gpt.h b/lib/gpt/inc/gpt.h
-index c11ecbff2..c5bddb470 100644
+index c11ecbff2619..c5bddb4704e7 100644
 --- a/lib/gpt/inc/gpt.h
 +++ b/lib/gpt/inc/gpt.h
 @@ -170,6 +170,25 @@ psa_status_t gpt_entry_move(const struct efi_guid_t=
 *guid,
@@ -74,7 +74,7 @@ index c11ecbff2..c5bddb470 100644
   * \brief Creates a partition entry in the table.
   *
 diff --git a/lib/gpt/src/gpt.c b/lib/gpt/src/gpt.c
-index 984c8f821..d6528f6a5 100644
+index 984c8f82146c..d6528f6a50ef 100644
 --- a/lib/gpt/src/gpt.c
 +++ b/lib/gpt/src/gpt.c
 @@ -222,9 +222,17 @@ static psa_status_t find_gpt_entry(const struct gpt=
_t      *table,
@@ -413,7 +413,7 @@ index 984c8f821..d6528f6a5 100644
              restore_to.header.array_lba,
              (restore_from->header.num_partitions +
 diff --git a/lib/gpt/unittests/gpt/test_gpt.c b/lib/gpt/unittests/gpt/te=
st_gpt.c
-index 5d2c4243f..bd9eb8ba1 100644
+index 5d2c4243f607..bd9eb8ba1da5 100644
 --- a/lib/gpt/unittests/gpt/test_gpt.c
 +++ b/lib/gpt/unittests/gpt/test_gpt.c
 @@ -897,6 +897,153 @@ void test_gpt_entry_duplicate_should_failWhenTable=
Full(void)
@@ -699,3 +699,6 @@ index 5d2c4243f..bd9eb8ba1 100644
  void test_gpt_attr_set_should_setAttributes(void)
  {
      /* Start with a populated GPT */
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-plat-cs1k-Add-flash-erase-protection.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0012-plat-cs1k-Add-flash-erase=
-protection.patch
index 3bca1d901169..d47d9e880012 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-plat-cs1k-Add-flash-erase-protection.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-plat-cs1k-Add-flash-erase-protection.patch
@@ -1,7 +1,7 @@
-From 60277832aa6d4a205a5b1180f0513de0eb7c84c6 Mon Sep 17 00:00:00 2001
+From 857a18c00ca3301ed6136333732d4c35e838e51f Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Tue, 17 Mar 2026 11:05:45 +0000
-Subject: [PATCH] plat: cs1k: Add flash erase protection
+Subject: [PATCH 12/14] plat: cs1k: Add flash erase protection
=20
 The GPT library deals in blocks, whereas flash deals in sectors. On
 cs1k, eight blocks make up a sector. So, when the GPT library requests a
@@ -23,7 +23,7 @@ Upstream-Status: Submitted [https://review.trustedfirmw=
are.org/c/TF-M/trusted-fi
  1 file changed, 39 insertions(+), 3 deletions(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/io/io_gpt.c b/platform=
/ext/target/arm/corstone1000/io/io_gpt.c
-index 513c77016..f7c3d79d2 100644
+index 513c770166cc..f7c3d79d272f 100644
 --- a/platform/ext/target/arm/corstone1000/io/io_gpt.c
 +++ b/platform/ext/target/arm/corstone1000/io/io_gpt.c
 @@ -53,6 +53,32 @@ static uint8_t sector_buf[FLASH_SECTOR_SIZE];
@@ -96,3 +96,6 @@ index 513c77016..f7c3d79d2 100644
          }
      } else {
          /* Partial erase of final sector */
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-plat-cs1k=
-Remove-unused-FWU-partitions-upon-version-.patch
deleted file mode 100644
index 697190448578..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.patch
+++ /dev/null
@@ -1,153 +0,0 @@
-From 281f6799d6de19e63cbcf175ad848b8c8f2cc220 Mon Sep 17 00:00:00 2001
-From: Frazer Carsley <frazer.carsley@arm.com>
-Date: Fri, 10 Apr 2026 17:15:36 +0100
-Subject: [PATCH] plat: cs1k: Remove unused FWU partitions upon version
- rejection
-
-If a firmware update (FWU) is attempted and the version of any image is
-lower or equal to the current version, the entire capsule is rejected
-and the previous bank used to continue booting. The partitions created
-during staging for the to-be images therefore can be removed and the
-space free'd up.
-
-Change-Id: I9b74c2ed5efee938c14dbdd0380d8d094e71c10e
-Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50260/1]
----
- .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 108 ++++++++++++------
- 1 file changed, 75 insertions(+), 33 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
-index d85590c71..557e48d07 100644
---- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-+++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-@@ -1105,6 +1105,54 @@ static psa_status_t erase_image(uint32_t image_of=
fset, uint32_t image_size)
-     return PSA_SUCCESS;
- }
-=20
-+#ifndef BL1_BUILD
-+/* stale index is the index of the partition to remove within the parti=
tion entry
-+ * array, which could be representing either bank 0 or bank 1. name_ind=
ex is the
-+ * index of partition to remove within the fwu_images image_names index=
, which is
-+ * fixed at compile time in the structure
-+ */
-+static psa_status_t remove_all_stale_partitions(const uint32_t stale_in=
dex,
-+                                                const uint32_t name_ind=
ex)
-+{
-+    psa_status_t ret;
-+
-+    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; ++i) {
-+        struct partition_entry_t part;
-+        ret =3D gpt_entry_read_by_type(&(fwu_image[i].image_type), stal=
e_index, &part);
-+
-+        if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
-+            FWU_LOG_MSG("%s: Unable to find partition '%s', skipping re=
moval\r\n",
-+                    __func__, fwu_image[i].image_names[name_index]);
-+            continue;
-+        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
-+            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
-+                    __func__, fwu_image[i].image_names[name_index]);
-+            return ret;
-+        } else if (ret < 0) {
-+            FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
-+                    __func__, fwu_image[i].image_names[name_index]);
-+            return ret;
-+        }
-+
-+        ret =3D gpt_entry_remove(&(part.partition_guid));
-+        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
-+            FWU_LOG_MSG("%s: Flash error whilst removing GPT partition =
'%s'\r\n",
-+                    __func__, fwu_image[i].image_names[name_index]);
-+            return ret;
-+        } else if (ret < 0) {
-+            FWU_LOG_MSG("%s: Unable to remove partition '%s'\r\n",
-+                    __func__, fwu_image[i].image_names[name_index]);
-+            return ret;
-+        }
-+
-+        FWU_LOG_MSG("%s: Removed GPT partition '%s'\r\n",
-+                    __func__, fwu_image[i].image_names[name_index]);
-+    }
-+
-+    return ret;
-+}
-+#endif
-+
- static psa_status_t fwu_select_previous(
-         struct fwu_metadata *metadata,
-         struct fwu_private_metadata *priv_metadata)
-@@ -1162,40 +1210,12 @@ static psa_status_t fwu_select_previous(
-=20
- #ifndef BL1_BUILD
-     /* Remove the GPT partitions for the rejected images. It is always =
the newer
--     * (second) partitions that are rejected, as they are created durin=
g the
--     * fwu process
-+     * (previous active) partitions that are rejected, as they are crea=
ted during
-+     * the fwu process
-      */
--    for (int i =3D 0; i < NR_OF_IMAGES_IN_FW_BANK; ++i) {
--        struct partition_entry_t part;
--        ret =3D gpt_entry_read_by_type(&(fwu_image[i].image_type), 1, &=
part);
--
--        if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
--            FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
--                    __func__, fwu_image[i].image_names[index]);
--            return ret;
--        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
--            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
--                    __func__, fwu_image[i].image_names[index]);
--            return ret;
--        } else if (ret < 0) {
--            FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
--                    __func__, fwu_image[i].image_names[index]);
--            return ret;
--        }
--
--        ret =3D gpt_entry_remove(&(part.partition_guid));
--        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
--            FWU_LOG_MSG("%s: Flash error whilst removing GPT partition =
'%s'\r\n",
--                    __func__, fwu_image[i].image_names[index]);
--            return ret;
--        } else if (ret < 0) {
--            FWU_LOG_MSG("%s: Unable to remove partition '%s'\r\n",
--                    __func__, fwu_image[i].image_names[index]);
--            return ret;
--        }
--
--        FWU_LOG_MSG("%s: Removed GPT partition '%s'\r\n",
--                    __func__, fwu_image[i].image_names[index]);
-+    ret =3D remove_all_stale_partitions(1, metadata->previous_active_in=
dex);
-+    if (ret !=3D PSA_SUCCESS) {
-+        return ret;
-     }
- #endif /* BL1_BUILD */
-=20
-@@ -1971,6 +1991,28 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_co=
mponent_t component,
-                 priv_metadata.fmp_last_attempt_status[fwu_image_index])=
;
-=20
-         FWU_LOG_MSG("ERROR: %s: version error\n\r",__func__);
-+
-+#ifndef BL1_BUILD
-+        /* The FWU process short circuits at this point, so remove all =
images,
-+         * effecitvely treating them all as rejected. Ignore return cod=
e and
-+         * in order to return PSA_OPERATION_INCOMPLETE as per PSA FWU A=
PI.
-+         */
-+        uint32_t previous_active_index;
-+        if (active_index =3D=3D BANK_0) {
-+            previous_active_index =3D BANK_1;
-+        } else if (active_index =3D=3D BANK_1) {
-+            previous_active_index =3D BANK_0;
-+        } else {
-+            FWU_LOG_MSG("ERROR: %s: active_index %d\n\r",__func__,activ=
e_index);
-+            ret =3D PSA_ERROR_DATA_INVALID;
-+            goto out;
-+        }
-+
-+        /* The newer index should be removed as that was just created i=
n the
-+         * staging phase.
-+         */
-+        (void)remove_all_stale_partitions(1, previous_active_index);
-+#endif
-         ret =3D PSA_OPERATION_INCOMPLETE;
-         goto out;
-     }
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0015-platform-corstone1000-Increase-FIP-partition-size.patch b/meta-ar=
m-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013-platform-cor=
stone1000-Increase-FIP-partition-size.patch
similarity index 88%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0015-platform-corstone1000-Increase-FIP-partition-size.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0013-platform-corstone1000-Increase-FIP-partition-size.patch
index 57cb30718074..7e87703d2c43 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0015=
-platform-corstone1000-Increase-FIP-partition-size.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-platform-corstone1000-Increase-FIP-partition-size.patch
@@ -1,7 +1,7 @@
-From 9edcdd272a7d2d872f7e04b3a9db5185fd24fd97 Mon Sep 17 00:00:00 2001
+From e7fb39d0124f60b624f535bc78745fbf4aac678c Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Tue, 28 Apr 2026 08:57:06 +0100
-Subject: [PATCH] platform: corstone1000: Increase FIP partition size
+Subject: [PATCH 13/14] platform: corstone1000: Increase FIP partition si=
ze
=20
 Increase the FIP partition size from 2MB to 2.5MB in the
 Corstone-1000 flash layout.
@@ -18,7 +18,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/platform/ext/target/arm/corstone1000/partition/flash_layout=
.h b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
-index e2219d80a..b7282beb2 100644
+index e2219d80a75c..b7282beb232e 100644
 --- a/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 +++ b/platform/ext/target/arm/corstone1000/partition/flash_layout.h
 @@ -139,7 +139,7 @@
@@ -30,3 +30,6 @@ index e2219d80a..b7282beb2 100644
  #define FIP_PARTITION_BANK_OFFSET         (TFM_PARTITION_BANK_OFFSET + =
TFM_PARTITION_SIZE)
 =20
  #define INITRAMFS_PARTITION_SIZE          (0xC00000)   /* 12 MB */
+--=20
+2.39.5
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0014-plat-cs1k-Duplicate-old-images-in-FWU.patch b/meta-arm-bsp/recipe=
s-bsp/trusted-firmware-m/files/corstone1000/0014-plat-cs1k-Duplicate-old-=
images-in-FWU.patch
deleted file mode 100644
index 3fcf8560f920..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-plat-cs1k-Duplicate-old-images-in-FWU.patch
+++ /dev/null
@@ -1,217 +0,0 @@
-From 3c7cb3432084df3b75b6382e543f3fc2352e32cf Mon Sep 17 00:00:00 2001
-From: Frazer Carsley <frazer.carsley@arm.com>
-Date: Fri, 13 Mar 2026 13:42:16 +0000
-Subject: [PATCH] plat: cs1k: Duplicate old images in FWU
-
-When copying existing partitions during a partial firmware update, the
-GPT library is now used to duplicate the old partitions and then rename
-them accordingly. This streamlines the steps of
-    1. creating a new partition for the image to be copied into and
-    2. the copying itself
-into a single library call.
-
-Change-Id: Ibd169dcc14ed1c946bbd6c30b6962c89055d0e8e
-Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/50261/1]
----
- .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 144 +++++++++---------
- 1 file changed, 68 insertions(+), 76 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
-index 557e48d07..c48d51b32 100644
---- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-+++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-@@ -39,7 +39,6 @@
-  * This is used when bank consistency is maintained during partial caps=
ule update
-  */
- #define FLASH_CHUNK_SIZE                512
--static uint8_t flash_data_buf[FLASH_CHUNK_SIZE];
-=20
- /* Possible states of the bank.
-  * Naming convention here matches the implementation in U-Boot=20
-@@ -2171,94 +2170,24 @@ out:
-     return ret;
- }
-=20
-+#ifdef BL1_BUILD
- static psa_status_t copy_image_from_other_bank(int image_index,
-                                                uint32_t active_index,
-                                                uint32_t previous_active=
_index)
- {
-     FWU_LOG_FUNC_ENTER;
-=20
-+    /* Use offsets directly */
-     uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
-     psa_status_t ret;
-=20
--#ifdef BL1_BUILD
-     /* Use offsets directly */
-+    uint8_t data[FLASH_CHUNK_SIZE];
-     size_t remaining_size =3D fwu_image[image_index].image_size;
-     size_t data_size;
-     size_t offset_read =3D bank_offset[active_index] + fwu_image[image_=
index].image_offset;
-     size_t offset_write =3D bank_offset[previous_active_index] + fwu_im=
age[image_index].image_offset;
-     int data_transferred_count;
--#else
--    /* Use GPT to find the correct image */
--    struct partition_entry_t active_part;
--    ret =3D gpt_entry_read_by_type(
--            &(fwu_image[image_index].image_type),
--            0,
--            &active_part);
--    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
--        FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
--                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
--        return ret;
--    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
--        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
--                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
--        return ret;
--    } else if (ret < 0) {
--        FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
--                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
--        return ret;
--    }
--
--    struct partition_entry_t prev_active_part;
--    ret =3D gpt_entry_read_by_type(
--            &(fwu_image[image_index].image_type),
--            1,
--            &prev_active_part);
--
--    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
--        /* Create the partition in the expected space */
--        struct efi_guid_t new_guid =3D {0};
--        char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
--        ascii_to_unicode(fwu_image[image_index].image_names[previous_ac=
tive_index], unicode_name);
--
--        ret =3D gpt_entry_create(&(fwu_image[image_index].image_type),
--                               (bank_offset[previous_active_index] + fw=
u_image[image_index].image_offset) / TFM_GPT_BLOCK_SIZE,
--                               1 + ((fwu_image[image_index].image_size =
- 1) / TFM_GPT_BLOCK_SIZE),
--                               0,
--                               unicode_name,
--                               &new_guid);
--        if (ret =3D=3D PSA_ERROR_INSUFFICIENT_STORAGE) {
--            FWU_LOG_MSG("%s: No space left on device!\r\n", __func__);
--            return ret;
--        } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
--            FWU_LOG_MSG("%s: Flash error whilst creating GPT partition =
'%s'!\r\n",
--                    __func__, fwu_image[image_index].image_names[previo=
us_active_index]);
--            return ret;
--        } else if (ret < 0) {
--            return ret;
--        }
--
--        ret =3D gpt_entry_read(&new_guid, &prev_active_part);
--        if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
--            FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '=
%s'\r\n",
--                    __func__, fwu_image[image_index].image_names[previo=
us_active_index]);
--            return ret;
--        } else if (ret < 0) {
--            return ret;
--        }
--    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
--        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
--                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
--        return ret;
--    } else if (ret < 0) {
--        return ret;
--    }
--
--    size_t remaining_size =3D prev_active_part.size * TFM_GPT_BLOCK_SIZ=
E;
--    size_t data_size;
--    size_t offset_read =3D active_part.start * TFM_GPT_BLOCK_SIZE;
--    size_t offset_write =3D prev_active_part.start * TFM_GPT_BLOCK_SIZE=
;
--    int data_transferred_count;
--#endif /* BL1_BUILD */
-=20
-     ret =3D erase_image(offset_write, remaining_size);
-     if (ret !=3D PSA_SUCCESS) {
-@@ -2270,7 +2199,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
-         data_size =3D (remaining_size > FLASH_CHUNK_SIZE) ? FLASH_CHUNK=
_SIZE : remaining_size;
-=20
-         /* read image data from flash */
--        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ReadData(offs=
et_read, flash_data_buf, data_size);
-+        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ReadData(offs=
et_read, data, data_size);
-         if (data_transferred_count < 0) {
-             FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
-             return PSA_ERROR_STORAGE_FAILURE;
-@@ -2285,7 +2214,7 @@ static psa_status_t copy_image_from_other_bank(int=
 image_index,
-         offset_read +=3D data_size;
-=20
-         /* write image data to flash */
--        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, flash_data_buf, data_size);
-+        data_transferred_count =3D FWU_METADATA_FLASH_DEV.ProgramData(o=
ffset_write, data, data_size);
-         if (data_transferred_count < 0) {
-             FWU_LOG_MSG("%s: ERROR - Flash read failed (ret =3D %d)\n\r=
", __func__, data_transferred_count);
-             return PSA_ERROR_STORAGE_FAILURE;
-@@ -2304,6 +2233,69 @@ static psa_status_t copy_image_from_other_bank(in=
t image_index,
-     FWU_LOG_MSG("%s: exit \n\r", __func__);
-     return PSA_SUCCESS;
- }
-+#else
-+static psa_status_t copy_image_from_other_bank(int image_index,
-+                                               uint32_t active_index,
-+                                               uint32_t previous_active=
_index)
-+{
-+    FWU_LOG_FUNC_ENTER;
-+
-+    /* Use GPT to find and copy the correct image */
-+    uint32_t bank_offset[NR_OF_FW_BANKS] =3D {BANK_0_PARTITION_OFFSET, =
BANK_1_PARTITION_OFFSET};
-+    uint64_t new_lba =3D
-+        (bank_offset[previous_active_index] + fwu_image[image_index].im=
age_offset) / TFM_GPT_BLOCK_SIZE;
-+
-+    struct partition_entry_t active_part;
-+    psa_status_t ret =3D gpt_entry_read_by_type(
-+            &(fwu_image[image_index].image_type),
-+            0,
-+            &active_part);
-+    if (ret =3D=3D PSA_ERROR_DOES_NOT_EXIST) {
-+        FWU_LOG_MSG("%s: Unable to find partition '%s'\r\n",
-+                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
-+        return ret;
-+    } else if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
-+        FWU_LOG_MSG("%s: Flash error whilst reading GPT partition '%s'\=
r\n",
-+                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
-+        return ret;
-+    } else if (ret < 0) {
-+        FWU_LOG_MSG("%s: Unable to read partition '%s'\r\n",
-+                __func__, fwu_image[image_index].image_names[active_ind=
ex]);
-+        return ret;
-+    }
-+
-+    struct efi_guid_t new_guid;
-+    ret =3D gpt_entry_duplicate(&(active_part.partition_guid), new_lba,=
 &new_guid);
-+    if (ret =3D=3D PSA_ERROR_STORAGE_FAILURE) {
-+        FWU_LOG_MSG("%s: Flash error whilst creating GPT partition '%s'=
\r\n",
-+                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
-+        return ret;
-+    } else if (ret < 0) {
-+        FWU_LOG_MSG("%s: Unable to create partition '%s'\r\n",
-+                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
-+        return ret;
-+    }
-+
-+    char unicode_name[GPT_ENTRY_NAME_LENGTH] =3D {'\0'};
-+    ascii_to_unicode(fwu_image[image_index].image_names[previous_active=
_index], unicode_name);
-+    ret =3D gpt_entry_rename(&new_guid, unicode_name);
-+    if (ret !=3D PSA_SUCCESS) {
-+        FWU_LOG_MSG("%s: Unable to rename partition to '%s'\r\n",
-+                __func__, fwu_image[image_index].image_names[previous_a=
ctive_index]);
-+
-+        /* Delete the newly created partition as there is code that rel=
ies on the naming */
-+        ret =3D gpt_entry_remove(&new_guid);
-+        if (ret !=3D PSA_SUCCESS) {
-+            FWU_LOG_MSG("%s: Catastrophic failure: unable to remove dup=
licate partition '%s'\r\n",
-+                    __func__, fwu_image[image_index].image_names[active=
_index]);
-+        }
-+        return ret;
-+    }
-+
-+    FWU_LOG_MSG("%s: exit \n\r", __func__);
-+    return PSA_SUCCESS;
-+}
-+#endif /* BL1_BUILD */
-=20
- static psa_status_t maintain_bank_consistency(void)
- {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0016-platform-corstone1000-Optionally-skip-provisioning.patch b/meta-a=
rm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014-platform-co=
rstone1000-keep-CM-during-secure-debug.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone100=
0/0016-platform-corstone1000-Optionally-skip-provisioning.patch
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/=
0014-platform-corstone1000-keep-CM-during-secure-debug.patch
index da808b9ad3d1..7fe52850a04b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016=
-platform-corstone1000-Optionally-skip-provisioning.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0014=
-platform-corstone1000-keep-CM-during-secure-debug.patch
@@ -1,7 +1,7 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From 3b01281520036b621166d409634dab9b46d01f70 Mon Sep 17 00:00:00 2001
 From: Ahmed Gomaa <ahmed.gomaa@arm.com>
 Date: Wed, 2 Sep 2026 12:00:00 +0100
-Subject: [PATCH] platform: corstone1000: keep CM during secure debug
+Subject: [PATCH 14/14] platform: corstone1000: keep CM during secure deb=
ug
=20
 Add a temporary Corstone-1000 Secure Debug workaround that skips runtime
 TF-M provisioning when Secure Debug is enabled. This keeps the device in
@@ -14,14 +14,15 @@ preserve the authenticated DCU_EN value across reset =
and apply it from BL2.
 Upstream-Status: Inappropriate [temporary platform workaround]
 Signed-off-by: Ahmed Gomaa <ahmed.gomaa@arm.com>
 ---
- secure_fw/spm/CMakeLists.txt |  1 +
- secure_fw/spm/core/main.c    | 10 ++++++++++
- 2 files changed, 11 insertions(+)
+ secure_fw/spm/CMakeLists.txt | 1 +
+ secure_fw/spm/core/main.c    | 9 +++++++++
+ 2 files changed, 10 insertions(+)
=20
 diff --git a/secure_fw/spm/CMakeLists.txt b/secure_fw/spm/CMakeLists.txt
+index bf0ab6e99c16..6741c52089de 100644
 --- a/secure_fw/spm/CMakeLists.txt
 +++ b/secure_fw/spm/CMakeLists.txt
-@@ -111,6 +111,7 @@ target_compile_definitions(tfm_spm
+@@ -110,6 +110,7 @@ target_compile_definitions(tfm_spm
          $<$<STREQUAL:${CONFIG_TFM_BRANCH_PROTECTION_FEAT},BRANCH_PROTEC=
TION_PACRET_LEAF>:BRANCH_PROTECTION_CONTROL=3D2>
          $<$<STREQUAL:${CONFIG_TFM_BRANCH_PROTECTION_FEAT},BRANCH_PROTEC=
TION_BTI>:BRANCH_PROTECTION_CONTROL=3D3>
          $<$<BOOL:${PLATFORM_PSA_ADAC_SECURE_DEBUG}>:PLATFORM_PSA_ADAC_S=
ECURE_DEBUG>
@@ -30,6 +31,7 @@ diff --git a/secure_fw/spm/CMakeLists.txt b/secure_fw/s=
pm/CMakeLists.txt
          $<$<BOOL:${TFM_TZ_REENTRANCY_CHECK}>:TFM_TZ_REENTRANCY_CHECK>
  )
 diff --git a/secure_fw/spm/core/main.c b/secure_fw/spm/core/main.c
+index 2bafac0c980e..22090c34efc4 100644
 --- a/secure_fw/spm/core/main.c
 +++ b/secure_fw/spm/core/main.c
 @@ -31,7 +31,9 @@ static fih_ret tfm_core_init(void)
@@ -64,5 +66,5 @@ diff --git a/secure_fw/spm/core/main.c b/secure_fw/spm/=
core/main.c
      TFM_COVERITY_DEVIATE_LINE(MISRA_C_2023_Rule_2_2, "Parameters can be=
 changed by user and this code will make effect")
      tfm_plat_provisioning_check_for_dummy_keys();
 --=20
-2.43.0
+2.39.5
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-corstone1000-fwu-Fix-missing-destination-offset-of-p.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017-corstone1=
000-fwu-Fix-missing-destination-offset-of-p.patch
deleted file mode 100644
index 8d8981107c00..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-corstone1000-fwu-Fix-missing-destination-offset-of-p.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From b3a51b202020ea461b5e742c3cdf6db02deef757 Mon Sep 17 00:00:00 2001
-From: Nicola Mazzucato <nicola.mazzucato@arm.com>
-Date: Tue, 7 Jul 2026 17:19:37 +0100
-Subject: [PATCH 17/18] corstone1000: fwu: Fix missing destination offset=
 of
- parse_fmp_header
-
-parse_fmp_header() overwrites the beginning of fmp_hdr on every FWU writ=
e.
-Fix it by appending incoming partial header bytes.
-
-Also:
- - use local variables to improve readability
- - add an overflow check for the incoming size before memcpy
-
-CVE: CVE-2026-73063
-Upstream-Status: Backport [d92781c5b966ee700ddaa9525230e677789def96]
-Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
-Change-Id: Iefcfe1c9c2479ea4346a56ecb0475483a56ee695
----
- .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 43 ++++++++++++++-----
- 1 file changed, 33 insertions(+), 10 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
-index 9fe9df0a4..83db6163c 100644
---- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-+++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-@@ -1863,26 +1863,46 @@ out:
-     return ret;
- }
-=20
--psa_status_t parse_fmp_header(psa_fwu_component_t component, const void=
 *block, size_t size, size_t *fmp_bytes)
-+static psa_status_t parse_fmp_header(
-+    psa_fwu_component_t component,
-+    const void *block,
-+    size_t size,
-+    size_t *fmp_bytes)
- {
-+    size_t header_size =3D sizeof(fmp_header_image_info[component].fmp_=
hdr);
-+    size_t *header_size_recv =3D &fmp_header_image_info[component].fmp_=
hdr_size_recvd;
-+
-+    if ((*header_size_recv + size) < size) {
-+        return PSA_ERROR_INVALID_ARGUMENT;
-+    }
-+
-     /* Parse the incoming block to make sure complete FMP header is rec=
eived */
--    if (sizeof(fmp_header_image_info[component].fmp_hdr) >=3D (fmp_head=
er_image_info[component].fmp_hdr_size_recvd + size)) {
--        memcpy(&fmp_header_image_info[component].fmp_hdr, block, size);
--        fmp_header_image_info[component].fmp_hdr_size_recvd +=3D size;
-+    if (header_size >=3D (*header_size_recv + size)) {
-+        memcpy(
-+            (uint8_t *)&fmp_header_image_info[component].fmp_hdr + *hea=
der_size_recv,
-+            block,
-+            size);
-+
-         *fmp_bytes =3D size;
-+        *header_size_recv +=3D size;
-+
-         return PSA_ERROR_INSUFFICIENT_DATA;
-     }
--    if (fmp_header_image_info[component].fmp_hdr_size_recvd !=3D sizeof=
(fmp_header_image_info[component].fmp_hdr)) {
--        memcpy(&fmp_header_image_info[component].fmp_hdr,
--                block,
--                (sizeof(fmp_header_image_info[component].fmp_hdr) - fmp=
_header_image_info[component].fmp_hdr_size_recvd));
-+    if (*header_size_recv !=3D header_size) {
-+        memcpy(
-+            (uint8_t *)&fmp_header_image_info[component].fmp_hdr + *hea=
der_size_recv,
-+            block,
-+            (header_size - *header_size_recv));
-+
-+        *fmp_bytes =3D header_size - *header_size_recv;
-+        *header_size_recv =3D header_size;
-=20
--        *fmp_bytes =3D sizeof(fmp_header_image_info[component].fmp_hdr)=
 - fmp_header_image_info[component].fmp_hdr_size_recvd;
--        fmp_header_image_info[component].fmp_hdr_size_recvd =3D sizeof(=
fmp_header_image_info[component].fmp_hdr);
-         return PSA_SUCCESS;
-     }
-=20
-+    FWU_ASSERT(0);
- }
-+
- psa_status_t fwu_bootloader_load_image(psa_fwu_component_t component,
-                                        size_t block_offset,
-                                        const void *block,
-@@ -1925,6 +1945,9 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_com=
ponent_t component,
-         if(ret =3D=3D PSA_ERROR_INSUFFICIENT_DATA) {
-             return PSA_SUCCESS;
-         }
-+        if(ret =3D=3D PSA_ERROR_INVALID_ARGUMENT) {
-+            return ret;
-+        }
-         if (ret =3D=3D PSA_SUCCESS) {
-             block_size -=3D fmp_bytes;
-             block +=3D fmp_bytes;
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-plat-cs1k-Bound-FWU-writes-to-target-partition.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-plat-cs1k-Bound=
-FWU-writes-to-target-partition.patch
deleted file mode 100644
index 8b1f5eb38298..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-plat-cs1k-Bound-FWU-writes-to-target-partition.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3de39fdc1cdc2f446c57d9211f20252612673733 Mon Sep 17 00:00:00 2001
-From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Date: Fri, 7 Aug 2026 12:01:58 +0100
-Subject: [PATCH 18/18] plat: cs1k: Bound FWU writes to target partition
-
-The Corstone-1000 FWU bootloader backend writes update blocks directly
-to flash using ProgramData(). Unlike the generic TF-M FWU backend, this
-path does not go through flash_area_write(), so partition overflow check=
s
-are not applied.
-
-Reject FWU write requests that would exceed the flash address space or
-the target image partition size before calling the raw flash driver.
-
-This prevents any host from writing past the selected update
-partition into other secure flash regions.
-
-CVE: CVE-2026-73094
-Upstream-Status: Backport [060ec25948f29f66b026be3c4858c2dbdfe0c443]
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
-Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
-Change-Id: I2f4ceeab93014cbbfcd91fb865c167bbaa290b3d
----
- .../bootloader/mcuboot/tfm_mcuboot_fwu.c      | 25 +++++++++++++++++++
- 1 file changed, 25 insertions(+)
-
-diff --git a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm=
_mcuboot_fwu.c b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/=
tfm_mcuboot_fwu.c
-index 9fe9df0a4..2e0d742e3 100644
---- a/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-+++ b/platform/ext/target/arm/corstone1000/bootloader/mcuboot/tfm_mcuboo=
t_fwu.c
-@@ -2024,6 +2024,31 @@ psa_status_t fwu_bootloader_load_image(psa_fwu_co=
mponent_t component,
-     image_offset =3D part.start * TFM_GPT_BLOCK_SIZE;
- #endif /* BL1_BUILD */
-=20
-+    if ((fmp_header_image_info[fwu_image_index].image_size_recvd >
-+            (UINT32_MAX - image_offset)) ||
-+        (block_size > (UINT32_MAX - image_offset -
-+            fmp_header_image_info[fwu_image_index].image_size_recvd))) =
{
-+        FWU_LOG_MSG("%s: image write range overflows flash address spac=
e\n\r", __func__);
-+        ret =3D PSA_ERROR_INVALID_ARGUMENT;
-+        goto out;
-+    }
-+
-+#ifdef BL1_BUILD
-+    if ((fmp_header_image_info[fwu_image_index].image_size_recvd >
-+            fwu_image[fwu_image_index].image_size) ||
-+        (block_size > (fwu_image[fwu_image_index].image_size -
-+            fmp_header_image_info[fwu_image_index].image_size_recvd))) =
{
-+#else
-+    if ((fmp_header_image_info[fwu_image_index].image_size_recvd >
-+            (part.size * TFM_GPT_BLOCK_SIZE)) ||
-+        (block_size > ((part.size * TFM_GPT_BLOCK_SIZE) -
-+            fmp_header_image_info[fwu_image_index].image_size_recvd))) =
{
-+#endif
-+        FWU_LOG_MSG("%s: image write exceeds partition size\n\r", __fun=
c__);
-+        ret =3D PSA_ERROR_INSUFFICIENT_STORAGE;
-+        goto out;
-+    }
-+
-     /* Firmware update process can only start in regular state. */
-     current_state =3D get_fwu_image_state(&_metadata, &priv_metadata, f=
wu_image_index);
-     if (current_state !=3D PSA_FWU_READY) {
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index fbf1daf6ca34..a12435fd9c69 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -38,7 +38,7 @@ SRC_URI:append:corstone1000 =3D " \
     file://0001-CC312-alignment-of-cc312-differences-between-fvp-and.pat=
ch \
     file://0002-Corstone-1000-Enable-different-DRBG-configurations.patch=
 \
     file://0003-bl2-corstone-1000-secure-debug-waiting-in-CM-LCS.patch \
-    file://0004-Workaround-compile-errors-in-AES.patch \
+    file://0004-Build-fix-remaining-GCC-v14.2-AES-type-error.patch \
     file://0005-plat-cs1k-Removed-unused-variables.patch \
     file://0006-lib-gpt-Show-intent-of-GUIDs-in-unittests-more-clear.pat=
ch \
     file://0007-lib-gpt-Provide-macro-identifying-free-space.patch \
@@ -47,12 +47,8 @@ SRC_URI:append:corstone1000 =3D " \
     file://0010-lib-gpt-Clarify-API-operation.patch \
     file://0011-lib-gpt-Add-metadata-only-API-operations.patch \
     file://0012-plat-cs1k-Add-flash-erase-protection.patch \
-    file://0013-plat-cs1k-Remove-unused-FWU-partitions-upon-version-.pat=
ch \
-    file://0014-plat-cs1k-Duplicate-old-images-in-FWU.patch \
-    file://0015-platform-corstone1000-Increase-FIP-partition-size.patch =
\
-    file://0016-platform-corstone1000-Optionally-skip-provisioning.patch=
 \
-    file://0017-corstone1000-fwu-Fix-missing-destination-offset-of-p.pat=
ch \
-    file://0018-plat-cs1k-Bound-FWU-writes-to-target-partition.patch \
+    file://0013-platform-corstone1000-Increase-FIP-partition-size.patch =
\
+    file://0014-platform-corstone1000-keep-CM-during-secure-debug.patch =
\
     "
=20
 FILESEXTRAPATHS:prepend:corstone1000-mps3 :=3D "${THISDIR}/files/corston=
e1000/psa-adac:"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.3.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.3.1-src.inc
similarity index 91%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.=
3.0-src.inc
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.=
1-src.inc
index 4ed6d8cb803f..7c94aa8bbc1d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.1-sr=
c.inc
@@ -23,18 +23,18 @@ SRC_URI_TRUSTED_FIRMWARE_M_PSA_CRYPTO_DRIVER ?=3D "gi=
t://git.trustedfirmware.org/s
 SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
-# TF-Mv2.3.0
+# TF-Mv2.3.1
 SRCBRANCH_tfm ?=3D "release/2.3.x"
-SRCREV_tfm =3D "5d906d29d7b6d1a7f7134960d228f9e75f6a8a07"
-# TF-Mv2.3.0
+SRCREV_tfm =3D "0b40d7806136baadf489febf8e2f91bf87aca63d"
+# TF-Mv2.3.1
 SRCBRANCH_tfm-extras ?=3D "release/2.3.x"
 SRCREV_tfm-extras =3D "8abeb6610e7ca27fff54dd8a9b5767d5cf98b998"
-# TF-Mv2.3.0
+# TF-Mv2.3.1
 SRCBRANCH_tfm-tests ?=3D "release/2.3.x"
-SRCREV_tfm-tests =3D "6a1165dfef219d0801487f51e06d12331e726643"
-# CMSIS v6.1.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
+SRCREV_tfm-tests =3D "465acb8405fb35b12a624a27062e361afe0025e4"
+# CMSIS v6.2.0, CMSIS_TAG from lib/ext/cmsis/CMakeLists.txt
 SRCBRANCH_cmsis ?=3D "main"
-SRCREV_cmsis =3D "b0bbb0423b278ca632cfe1474eb227961d835fd2"
+SRCREV_cmsis =3D "6f0a58d01aa9bd2feba212097f9afe7acd991d52"
 # mcuboot v2.4.0, value from MCUBOOT_VERSION
 SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "6d3b3d2c38ab20c242e5b9abb04d050086383eb2"
@@ -44,9 +44,9 @@ SRCREV_qcbor =3D "92d3f89030baff4af7be8396c563e6c8ef263=
622"
 # PSA-ADAC (intermediate SHA), value from PLATFORM_PSA_ADAC_VERSION
 SRCBRANCH_tfm-psa-adac =3D "master"
 SRCREV_tfm-psa-adac =3D "eff89e8e0ce36e4793f78309be19fcfab798f473"
-# TF-PSA-Crypto v1.1.0, value from TF_PSA_CRYPTO_VERSION
-SRCBRANCH_tf-psa-crypto =3D "development"
-SRCREV_tf-psa-crypto =3D "29160dd877d29658279fd683b2ae57b320ddcf09"
+# TF-PSA-Crypto v1.1.1, value from TF_PSA_CRYPTO_VERSION
+SRCBRANCH_tf-psa-crypto =3D "tf-psa-crypto-1.1"
+SRCREV_tf-psa-crypto =3D "a0632be94d883daa0295ac1eabf70359ad94f91b"
 # From platform/ext/target/arm/drivers/cc3xx/CMakeLists.txt
 SRCBRANCH_psa-crypto-driver =3D "main"
 SRCREV_psa-crypto-driver =3D "3a93566c04c4d77a007e6b149e7c06e7b8f0cd8d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.3.1.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_2.3.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_2.3.1.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.3.=
1.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.=
3.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.3.=
1.bb
--=20
2.54.0 (Apple Git-157)


