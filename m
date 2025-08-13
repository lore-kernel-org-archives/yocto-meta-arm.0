Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B6FCA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 08:23:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.95720.1755073381549143625
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 01:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBB94113E;
	Wed, 13 Aug 2025 01:22:52 -0700 (PDT)
Received: from e121095.cambridge.arm.com (e121095.arm.com [10.1.198.39])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D4F73F5A1;
	Wed, 13 Aug 2025 01:23:00 -0700 (PDT)
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 1/1] arm-bsp/trusted-firmware-m: corstone1000: Update the patches upstream status
Date: Wed, 13 Aug 2025 09:22:36 +0100
Message-ID: <20250813082236.2202985-1-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Aug 2025 08:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6665

These patches upstream status changed to Backport:
0006-platform-CS1000-Add-multicore-support-for-FVP.patch
0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
0012-Platform-CS1000-Remove-unused-BL1-files.patch
0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
0017-Platform-CS1000-Enable-FWU-partition.patch
0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
0019-Platform-Corstone1000-Increase-buffer-sizes.patch
0023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch

And from the PSA-ADAC,
This patch upstream status changed to Backport:
0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch

This patch upstream status changed to Inappropriate:
0003-Fix-psa_key_handle_t-initialization.patch
Reason: mbedcrypto configs have to be fixed to build secure-debug mps3
without this patch

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 .../0006-platform-CS1000-Add-multicore-support-for-FVP.patch    | 2 +-
 .../0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch   | 2 +-
 .../0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch      | 2 +-
 .../0012-Platform-CS1000-Remove-unused-BL1-files.patch          | 2 +-
 .../0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch       | 2 +-
 .../0017-Platform-CS1000-Enable-FWU-partition.patch             | 2 +-
 ...8-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch | 2 +-
 .../0019-Platform-Corstone1000-Increase-buffer-sizes.patch      | 2 +-
 ...tform-CS1000-Remove-duplicate-configuration-parameters.patch | 2 +-
 .../0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch      | 2 +-
 .../psa-adac/0003-Fix-psa_key_handle_t-initialization.patch     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0006-platform-CS1000-Add-multicore-support-for-FVP.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-m/files/corstone1000/0006-platform-CS1000-=
Add-multicore-support-for-FVP.patch
index 28d81b8d..525d9018 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-platform-CS1000-Add-multicore-support-for-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0006=
-platform-CS1000-Add-multicore-support-for-FVP.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 10/10] platform: CS1000: Add multicore su=
pport for FVP
 This changeset adds the support to enable the secondary cores for
 the Corstone-1000 FVP
=20
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/29242]
+Upstream-Status: Backport [86383bb0ee5a99343c23c0b6fb9a1d161857a75c]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
  .../target/arm/corstone1000/CMakeLists.txt    |  6 +++
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0009-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch b/meta-arm-b=
sp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009-CC312-ADAC-Add-=
PSA_WANT_ALG_SHA_256-definition.patch
index b273700f..4254d684 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0009=
-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch
@@ -13,7 +13,7 @@ of this, the PSA_HASH_MAX_SIZE is not set correctly for=
 the sources
 of the psa_adac_cc312 target. This caused runtime issues.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/31131]
+Upstream-Status: Backport [d7a6a86ee9adc65317c6d2a9962bfa4f093fa4ce]
 ---
  platform/ext/accelerator/cc312/psa-adac/CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0010-Platform-CS1000-Add-crypto-configs-for-ADAC.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0010-Platform-CS1000-Ad=
d-crypto-configs-for-ADAC.patch
index 35ba5a30..047e052a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0010=
-Platform-CS1000-Add-crypto-configs-for-ADAC.patch
@@ -8,7 +8,7 @@ MBEDTLS_PSA_CRYPTO_CONFIG_FILE defines in order to build =
correctly.
 The default crypto config files are used here.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/31132]
+Upstream-Status: Backport [06c0515a508ccbf60620e9337d5283bd00cd218c]
 ---
  platform/ext/target/arm/corstone1000/CMakeLists.txt | 12 ++++++++++++
  1 file changed, 12 insertions(+)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0012-Platform-CS1000-Remove-unused-BL1-files.patch b/meta-arm-bsp/reci=
pes-bsp/trusted-firmware-m/files/corstone1000/0012-Platform-CS1000-Remove=
-unused-BL1-files.patch
index 35183c5f..b2bf1293 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-Platform-CS1000-Remove-unused-BL1-files.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0012=
-Platform-CS1000-Remove-unused-BL1-files.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 1/5] Platform: CS1000: Remove unused BL1 =
files
 These files are not referenced anywhere so removed them to prevent
 confusion.
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [9a7bdf9ef595196e1e518a27d3c79079aedb5bda]
 ---
  .../arm/corstone1000/bl1/CMakeLists.txt       | 345 ------------------
  .../arm/corstone1000/bl1/bl1_security_cnt.c   |  75 ----
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0013-Platform-CS1000-Fix-compiler-switch-in-BL1.patch b/meta-arm-bsp/r=
ecipes-bsp/trusted-firmware-m/files/corstone1000/0013-Platform-CS1000-Fix=
-compiler-switch-in-BL1.patch
index 7ff3a868..b2ae4bc5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0013=
-Platform-CS1000-Fix-compiler-switch-in-BL1.patch
@@ -25,7 +25,7 @@ This commit:
   loaded during the runtime TFM_S execution, only in BL2.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [f25649cc0de56f360069c6128670f7533ba5e14d]
 ---
  .../target/arm/corstone1000/CMakeLists.txt    |  7 ++++
  .../corstone1000/fw_update_agent/fwu_agent.c  | 33 +++++++++----------
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0017-Platform-CS1000-Enable-FWU-partition.patch b/meta-arm-bsp/recipes=
-bsp/trusted-firmware-m/files/corstone1000/0017-Platform-CS1000-Enable-FW=
U-partition.patch
index c6b97733..17fc0051 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-Platform-CS1000-Enable-FWU-partition.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0017=
-Platform-CS1000-Enable-FWU-partition.patch
@@ -9,7 +9,7 @@ Increase the necessary flags to enable firmware update pa=
rtition.
 Set TFM_FWU_BOOTLOADER_LIB to use Corstone-1000 specific bootloader
 configuration. Fix linker issues caused by enablement.
=20
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/39515]
+Upstream-Status: Backport [0107057d1411ec68e374fbd0ddc0e12abd5754ec]
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
=20
 ---
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0018-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018-Platform-=
Corstone1000-Implement-Bootloader-Abstracti.patch
index da275a19..8e03608e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0018=
-Platform-Corstone1000-Implement-Bootloader-Abstracti.patch
@@ -78,7 +78,7 @@ with the following changes:
 -> Add image offsets and sizes for each payload to facilitate
    accurate image management during updates.
=20
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/39516/1]
+Upstream-Status: Backport [fb790fc19904a0ca9bacba7e58cf4dff5576b1d0]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
 ---
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0019-Platform-Corstone1000-Increase-buffer-sizes.patch b/meta-arm-bsp/=
recipes-bsp/trusted-firmware-m/files/corstone1000/0019-Platform-Corstone1=
000-Increase-buffer-sizes.patch
index 2aaa4fcd..ce6e1d8c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0019=
-Platform-Corstone1000-Increase-buffer-sizes.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0019=
-Platform-Corstone1000-Increase-buffer-sizes.patch
@@ -11,7 +11,7 @@ EFI variables. These ACS tests started failing after in=
troducing new
 version of U-Boot, Trusted-Services and Trusted-Firmware-M while
 implementing PSA FWU support.
=20
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/39517/1]
+Upstream-Status: Backport [bd80dee733e792eadfd2115f4bfa6bad748e5ce5]
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
  platform/ext/target/arm/corstone1000/config_tfm_target.h | 4 ++--
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0023-Platform-CS1000-Remove-duplicate-configuration-parameters.patch b=
/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023-Plat=
form-CS1000-Remove-duplicate-configuration-parameters.patch
index d654c362..720146a6 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023=
-Platform-CS1000-Remove-duplicate-configuration-parameters.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0023=
-Platform-CS1000-Remove-duplicate-configuration-parameters.patch
@@ -11,7 +11,7 @@ The whole rationale behind this is for the vendor to be=
 able
 to override the configuration using the cmake file.
=20
 Signed-off-by: Yogesh Wani <yogesh.wani@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/39598]
+Upstream-Status: Backport [948cb8e7601dcf1fe822d855c77749287fe6d9bd]
 ---
  platform/ext/target/arm/corstone1000/config.cmake | 1 -
  1 file changed, 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch b/meta=
-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-adac/0002-=
ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
index fcfe892e..b82e417c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0002-ADAC-Link-psa_interface-instead-of-tfm_sprt.patch
@@ -12,7 +12,7 @@ tfm_hal_output_spm_log which relies on an SPM, which mi=
ght not be
 initialized at that point.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Backport [af0acd1af3e2cc81b12931b31367fb95e49e8272]
 ---
  psa_crypto/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/psa-adac/0003-Fix-psa_key_handle_t-initialization.patch b/meta-arm-bsp=
/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-adac/0003-Fix-psa_=
key_handle_t-initialization.patch
index d620cc19..ea171e2a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0003-Fix-psa_key_handle_t-initialization.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/psa-=
adac/0003-Fix-psa_key_handle_t-initialization.patch
@@ -9,7 +9,7 @@ struct. In this case, it is defined in the used configura=
tion header
 so the struct cannot be initialized with -1.
=20
 Signed-off-by: Bence Balogh <bence.balogh@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
+Upstream-Status: Inappropriate [mbedcrypto configs have to be fixed to b=
uild secure-debug mps3 without this patch]
 ---
  psa_crypto/adac_crypto_psa_mac.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

