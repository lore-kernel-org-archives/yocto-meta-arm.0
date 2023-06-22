Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438D0EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 13:16:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11133.1687439804080389493
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 06:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A42991042;
	Thu, 22 Jun 2023 06:17:27 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.194.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F03FE3F64C;
	Thu, 22 Jun 2023 06:16:42 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH MICKLEDORE 6/7] arm-bsp/trusted-services: corstone1000: Fix PSA_RAW_KEY agreement test
Date: Thu, 22 Jun 2023 14:16:27 +0100
Message-Id: <20230622131628.11573-7-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230622131628.11573-1-emekcan.aras@arm.com>
References: <20230622131628.11573-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Jun 2023 13:16:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4831

From: Emekcan Aras <emekcan.aras@arm.com>

Adds missing compilation option to fix psa_raw_key_aggrement test for
corstone1000.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
---
 ...0-add-compile-definitions-for-ECP_DP.patch | 27 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch
new file mode 100644
index 00000000..2fdd19e7
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch
@@ -0,0 +1,27 @@
+From 041d30bb9cc6857f5ef26ded154ff7126dafaa20 Mon Sep 17 00:00:00 2001
+From: Emekcan Aras <emekcan.aras@arm.com>
+Date: Fri, 16 Jun 2023 10:47:48 +0100
+Subject: [PATCH] plat: corstone1000: add compile definitions for
+ ECP_DP_SECP512R1
+
+Corstone1000 runs PSA-API tests which requires this ECC algorithm.
+Without setting this, corstone1000 fails psa-api-crypto-test no 243.
+
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+---
+ platform/providers/arm/corstone1000/platform.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/platform/providers/arm/corstone1000/platform.cmake b/platform/providers/arm/corstone1000/platform.cmake
+index dbdf1097..e7a295dd 100644
+--- a/platform/providers/arm/corstone1000/platform.cmake
++++ b/platform/providers/arm/corstone1000/platform.cmake
+@@ -14,3 +14,5 @@ target_compile_definitions(${TGT} PRIVATE
+ 	SMM_VARIABLE_INDEX_STORAGE_UID=0x787
+ 	SMM_GATEWAY_MAX_UEFI_VARIABLES=100
+ )
++
++add_compile_definitions(MBEDTLS_ECP_DP_SECP521R1_ENABLED)
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
index 8b7776c9..baf4dbdb 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -6,6 +6,7 @@ SRC_URI:append:corstone1000  = " \
     file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=../trusted-services \
     file://0003-FMP-Support-in-Corstone1000.patch;patchdir=../trusted-services \
     file://0004-GetNextVariableName-Fix.patch;patchdir=../trusted-services     \
+    file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.patch;patchdir=../trusted-services \
     "
 
 
-- 
2.17.1


