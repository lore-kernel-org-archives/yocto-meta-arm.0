Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA33C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 15:18:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10383.1740496699278427671
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 07:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47CE528C7
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:35 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDCEE3F5A1
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 07:18:18 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] arm/trusted-firmware-m: update to v2.1.1
Date: Tue, 25 Feb 2025 10:18:15 -0500
Message-Id: <20250225151817.11875-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250225151817.11875-1-jon.mason@arm.com>
References: <20250225151817.11875-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 15:18:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6388

Update trusted-firmware-m to the latest LTS (TF-Mv2.1.1)
Changes between 0c4c99ba33b3e66deea070e149279278dc7647f4 and 02bf27991343=
9a07082dd581df033f370a8fbb92
	02bf27991343 docs: Release notes for v2.1.1
	7264a32e84a0 docs: rp2350: Minor docs & script improvements
	4bad159af017 Docs: Release dates update
	a5e02ec0c6a2 Align .gitignore contents to main branch
	8fe944a652f5 Platform: RP2350: Fix NV counters in ITS
	66bc1fa8eed9 Build: Fix patch formatting for 0001-iar-Add-missing-v8.1m-=
check.patch
	895d44a4eb52 Platform: RP2350: Add NV counters to ITS
	e81b741aa6cc tf-m-tests: Step version for rp2350 psa-arch-tests
	2be65a027c86 Platform: rp2350: Add rwx linker flag conditionally for GNU=
ARM
	a85425417696 Platform: RP2350: Add RP2350 porting
	9ed2e7c7f52b Platform/TFM/ITS/Config: Commits required for new platform =
porting
	f12db7c872d5 cc3xx/low-level/pka: SRAM size depends on CC3XX version
	c7e0192fab6f cc3xx/low-level/hash: wait for hash engine to be idle
	42a4041bdff4 Crypto: Update to Mbed TLS 3.6.2
	471c127e7755 Crypto: Add option to enforce ABI compatibility
	7da71fd05445 tfm_spe_mailbox: Fix NULL pointer checks
	974bc101e0b2 cc3xx/low-level/pka: wait for sw reset to be done before pr=
oceeding
	89b9c4889c60 Crypto: Enforce MBEDTLS_PSA_ASSUME_EXCLUSIVE_BUFFERS on Mbe=
d TLS config
	62b1300557c5 Crypto: Additional checks for writes to avoid out-of-bound =
access
	a2cead6a9ef4 tfm_spe_mailbox: Use local vars for local_copy_vects
	15afe61d1194 TFMV-8: Fix unchecked user-supplied pointer via mailbox mes=
sage
	22e8e89c8f56 tfm_spe_mailbox: Do not write-back on input vectors checks =
failure
	12a4c5342965 tfm_spe_mailbox: Validate vectors from NSPE
	75bbe3fc0240 CC3XX: Relax assert condition in aead_crypt for input
	0db7ebf32ba3 Crypto: Protect writes to avoid out-of-bound access
	2ecea430fbb4 Crypto: Prevent the scratch allocator from overflowing
	fbcdc69b794d SPM: mailbox_agent_api: Free connection if params associati=
on fails
	2a59580b5809 Crypto: Update to Mbed TLS 3.6.1
	6a54ec89f22f Platform: STM32: script all_stm_platfrom
	66596b4dae57 Platform: corstone1000: Fix isolation L2 memory protection
	7045675209ca stm : fix error on b_u585i_iot02a with TF-Mv2.1.0

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...0-Fix-isolation-L2-memory-protection.patch | 88 -------------------
 .../trusted-firmware-m-corstone1000.inc       |  1 -
 ...c.inc =3D> trusted-firmware-m-2.1.1-src.inc} | 24 ++---
 ...rusted-firmware-m-scripts-native_2.1.1.bb} |  0
 ...m_2.1.0.bb =3D> trusted-firmware-m_2.1.1.bb} |  0
 5 files changed, 12 insertions(+), 101 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/cor=
stone1000/0016-Platform-corstone1000-Fix-isolation-L2-memory-protection.p=
atch
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-2.1.0=
-src.inc =3D> trusted-firmware-m-2.1.1-src.inc} (84%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-scrip=
ts-native_2.1.0.bb =3D> trusted-firmware-m-scripts-native_2.1.1.bb} (100%=
)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_2.1.0=
.bb =3D> trusted-firmware-m_2.1.1.bb} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone10=
00/0016-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch b/=
meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016-Platf=
orm-corstone1000-Fix-isolation-L2-memory-protection.patch
deleted file mode 100644
index 267254c4c604..000000000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/files/corstone1000/0016=
-Platform-corstone1000-Fix-isolation-L2-memory-protection.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 4d3ebb03b89b122af490824ca73287954a35bd07 Mon Sep 17 00:00:00 2001
-From: Jamie Fox <jamie.fox@arm.com>
-Date: Thu, 22 Aug 2024 16:54:45 +0100
-Subject: [PATCH] Platform: corstone1000: Fix isolation L2 memory protect=
ion
-
-The whole of the SRAM was configured unprivileged on this platform, so
-the memory protection required for isolation level 2 was not present.
-
-This patch changes the S_DATA_START to S_DATA_LIMIT MPU region to be
-configured for privileged access only. It also reorders the MPU regions
-so that the App RoT sub-region overlapping S_DATA has a higher region
-number and so takes priority in the operation of the Armv6-M MPU.
-
-Signed-off-by: Jamie Fox <jamie.fox@arm.com>
-Upstream-Status: Submitted [https://review.trustedfirmware.org/c/TF-M/tr=
usted-firmware-m/+/30951]
----
- .../arm/corstone1000/tfm_hal_isolation.c      | 43 +++++++++----------
- 1 file changed, 21 insertions(+), 22 deletions(-)
-
-diff --git a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c b/=
platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-index 39b19c535..498f14ed2 100644
---- a/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-+++ b/platform/ext/target/arm/corstone1000/tfm_hal_isolation.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2020-2023, Arm Limited. All rights reserved.
-+ * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
-  * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon
-  * company) or an affiliate of Cypress Semiconductor Corporation. All r=
ights
-  * reserved.
-@@ -99,6 +99,26 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundarie=
s(
-         return ret;
-     }
-=20
-+    /* Set the RAM attributes. It is needed because the first region ov=
erlaps the whole
-+     * SRAM and it has to be overridden.
-+     * The RAM_MPU_REGION_BLOCK_1_SIZE and RAM_MPU_REGION_BLOCK_2_SIZE =
are calculated manually
-+     * and added to the platform_region_defs compile definitions.
-+     */
-+    base =3D S_DATA_START;
-+    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
-+    ret =3D configure_mpu(rnr++, base, limit,
-+                            XN_EXEC_NOT_OK, AP_RW_PRIV_ONLY);
-+    if (ret !=3D TFM_HAL_SUCCESS) {
-+        return ret;
-+    }
-+
-+    base =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
-+    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGI=
ON_BLOCK_2_SIZE;
-+    ret =3D configure_mpu(rnr++, base, limit,
-+                            XN_EXEC_NOT_OK, AP_RW_PRIV_ONLY);
-+    if (ret !=3D TFM_HAL_SUCCESS) {
-+        return ret;
-+    }
-=20
-     /* RW, ZI and stack as one region */
-     base =3D (uint32_t)&REGION_NAME(Image$$, TFM_APP_RW_STACK_START, $$=
Base);
-@@ -133,27 +153,6 @@ enum tfm_hal_status_t tfm_hal_set_up_static_boundar=
ies(
-=20
- #endif
-=20
--    /* Set the RAM attributes. It is needed because the first region ov=
erlaps the whole
--     * SRAM and it has to be overridden.
--     * The RAM_MPU_REGION_BLOCK_1_SIZE and RAM_MPU_REGION_BLOCK_2_SIZE =
are calculated manually
--     * and added to the platform_region_defs compile definitions.
--     */
--    base =3D S_DATA_START;
--    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
--    ret =3D configure_mpu(rnr++, base, limit,
--                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
--    if (ret !=3D TFM_HAL_SUCCESS) {
--        return ret;
--    }
--
--    base =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE;
--    limit =3D S_DATA_START + RAM_MPU_REGION_BLOCK_1_SIZE + RAM_MPU_REGI=
ON_BLOCK_2_SIZE;
--    ret =3D configure_mpu(rnr++, base, limit,
--                            XN_EXEC_NOT_OK, AP_RW_PRIV_UNPRIV);
--    if (ret !=3D TFM_HAL_SUCCESS) {
--        return ret;
--    }
--
-     arm_mpu_enable();
-=20
- #endif /* CONFIG_TFM_ENABLE_MEMORY_PROTECT */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 9c38d1ad5dfe..c79ac2e3d896 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -35,7 +35,6 @@ SRC_URI:append:corstone1000 =3D " \
     file://0013-CC312-ADAC-Add-PSA_WANT_ALG_SHA_256-definition.patch \
     file://0014-Platform-CS1000-Add-crypto-configs-for-ADAC.patch \
     file://0015-Platform-CS1000-Fix-platform-name-in-logs.patch \
-    file://0016-Platform-corstone1000-Fix-isolation-L2-memory-protection=
.patch \
     file://0017-Platform-CS1000-Remove-unused-BL1-files.patch \
     file://0018-Platform-CS1000-Remove-duplicated-metadata-write.patch \
     file://0019-Platform-CS1000-Fix-compiler-switch-in-BL1.patch \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.1-src.inc
similarity index 84%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.=
1.0-src.inc
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.=
1-src.inc
index fb4ddcb673e3..6b483995f82d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
@@ -27,28 +27,28 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
-# TF-Mv2.1.0
+# TF-Mv2.1.1
 SRCBRANCH_tfm ?=3D "release/2.1.x"
-SRCREV_tfm =3D "0c4c99ba33b3e66deea070e149279278dc7647f4"
-# TF-Mv2.1.0
+SRCREV_tfm =3D "02bf279913439a07082dd581df033f370a8fbb92"
+# TF-Mv2.1.1
 SRCBRANCH_tfm-extras ?=3D "release/2.1.x"
 SRCREV_tfm-extras =3D "95add8abb15879f48f1069a0952dd9abdffbc1f8"
-# TF-Mv2.1.0
+# TF-Mv2.1.1
 SRCBRANCH_tfm-tests ?=3D "release/2.1.x"
-SRCREV_tfm-tests =3D "73100d90d8871435eaffa668eb04ce5b746ecece"
-# CMSIS v6.0.0+ (intermediate SHA)
+SRCREV_tfm-tests =3D "6f642014a8c255e163ae0bc4d21e327de694d6a2"
+# CMSIS v6.0.0+ (intermediate SHA), CMSIS_TAG from lib/ext/cmsis/CMakeLi=
sts.txt
 SRCBRANCH_cmsis ?=3D "main"
 SRCREV_cmsis =3D "d0c460c1697d210b49a4b90998195831c0cd325c"
-# mbedtls-3.6.0
-SRCBRANCH_mbedtls ?=3D "master"
-SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
-# mcuboot v2.1.0
+# mbedtls-3.6.2, value from MBEDCRYPTO_VERSION
+SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
+SRCREV_mbedtls =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
+# mcuboot v2.1.0, value from MCUBOOT_VERSION
 SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "9c99326b9756dbcc35b524636d99ed5f3e6cb29b"
-# QCBOR v1.2
+# QCBOR v1.2, value from QCBOR_VERSION in lib/ext/qcbor/CMakeLists.txt
 SRCBRANCH_qcbor ?=3D "master"
 SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19ebaff"
-# PSA-ADAC (intermediate SHA, default value for PLATFORM_PSA_ADAC_VERSIO=
N in TF-M)
+# PSA-ADAC (intermediate SHA), value from PLATFORM_PSA_ADAC_VERSION
 SRCBRANCH_tfm-psa-adac =3D "master"
 SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf1f97deef625"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.1.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.1.1.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_2.1.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_2.1.1.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.1.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.=
1.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.=
1.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.=
1.bb
--=20
2.39.5 (Apple Git-154)


