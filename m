Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D960C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:49:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10162.1666360148000809915
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 06:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCFFF12FC;
	Fri, 21 Oct 2022 06:49:13 -0700 (PDT)
Received: from cassini-003.cambridge.arm.com (cassini-003.cambridge.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CADE53F792;
	Fri, 21 Oct 2022 06:49:06 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 1/1] arm/trusted-services: port crypto config
Date: Fri, 21 Oct 2022 14:49:01 +0100
Message-Id: <20221021134901.56428-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021134901.56428-1-emekcan.aras@arm.com>
References: <20221021134901.56428-1-emekcan.aras@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 13:49:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3995

From: Rui Miguel Silva <rui.silva@linaro.org>

Port crypto config to psa arch test api suite.This
needs to move to arm-bsp since is corstone1000 specific
configuration

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 ...0002-corstone1000-port-crypto-config.patch | 230 ++++++++++++++++++
 .../ts-psa-api-test-common_git.inc            |   1 +
 2 files changed, 231 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch

diff --git a/meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch b/meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch
new file mode 100644
index 00000000..c7289562
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0002-corstone1000-port-crypto-config.patch
@@ -0,0 +1,230 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <Emekcan.Aras@arm.com>
+
+From c1bcab09bb5b73e0f7131d9433f5e23c3943f007 Mon Sep 17 00:00:00 2001
+From: Satish Kumar <satish.kumar01@arm.com>
+Date: Sat, 11 Dec 2021 11:06:57 +0000
+Subject: [PATCH] corstone1000: port crypto config
+
+
+Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
+
+%% original patch: 0002-corstone1000-port-crypto-config.patch
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ .../nspe/pal_crypto_config.h                  | 81 +++++++++++++++----
+ 1 file changed, 65 insertions(+), 16 deletions(-)
+
+diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h
+index 218a94c69502..c6d4aadd8476 100755
+--- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h
++++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h
+@@ -34,10 +34,14 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_RSA
+ #define ARCH_TEST_RSA_1024
+ #define ARCH_TEST_RSA_2048
+ #define ARCH_TEST_RSA_3072
++#endif
++#endif
+ 
+ /**
+  * \def  ARCH_TEST_ECC
+@@ -50,11 +54,17 @@
+  * Requires: ARCH_TEST_ECC
+  * Comment macros to disable the curve
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECC
+ #define ARCH_TEST_ECC_CURVE_SECP192R1
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_ECC_CURVE_SECP224R1
++#endif
+ #define ARCH_TEST_ECC_CURVE_SECP256R1
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_ECC_CURVE_SECP384R1
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_AES
+@@ -78,10 +88,10 @@
+  *
+  * Comment macros to disable the types
+  */
+-#define ARCH_TEST_DES
+-#define ARCH_TEST_DES_1KEY
+-#define ARCH_TEST_DES_2KEY
+-#define ARCH_TEST_DES_3KEY
++//#define ARCH_TEST_DES
++//#define ARCH_TEST_DES_1KEY
++//#define ARCH_TEST_DES_2KEY
++//#define ARCH_TEST_DES_3KEY
+ 
+ /**
+  * \def  ARCH_TEST_RAW
+@@ -104,7 +114,7 @@
+  *
+  * Enable the ARC4 key type.
+  */
+-#define ARCH_TEST_ARC4
++//#define ARCH_TEST_ARC4
+ 
+ /**
+  * \def ARCH_TEST_CIPHER_MODE_CTR
+@@ -113,7 +123,11 @@
+  *
+  * Requires: ARCH_TEST_CIPHER
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CIPHER_MODE_CTR
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CIPHER_MODE_CFB
+@@ -138,7 +152,11 @@
+  *
+  * Requires: ARCH_TEST_CIPHER, ARCH_TEST_AES, ARCH_TEST_CIPHER_MODE_CTR
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CTR_AES
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CBC_AES
+@@ -157,7 +175,11 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CBC_NO_PADDING
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CFB_AES
+@@ -177,11 +199,15 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_PKCS1V15
+ #define ARCH_TEST_RSA_PKCS1V15_SIGN
+ #define ARCH_TEST_RSA_PKCS1V15_SIGN_RAW
+ #define ARCH_TEST_RSA_PKCS1V15_CRYPT
+ #define ARCH_TEST_RSA_OAEP
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_CBC_PKCS7
+@@ -190,7 +216,11 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CBC_PKCS7
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_ASYMMETRIC_ENCRYPTION
+@@ -227,21 +257,27 @@
+  *
+  * Comment macros to disable the types
+  */
+-// #define ARCH_TEST_MD2
+-// #define ARCH_TEST_MD4
+-#define ARCH_TEST_MD5
+-#define ARCH_TEST_RIPEMD160
+-#define ARCH_TEST_SHA1
++//#define ARCH_TEST_MD2
++//#define ARCH_TEST_MD4
++//#define ARCH_TEST_MD5
++//#define ARCH_TEST_RIPEMD160
++//#define ARCH_TEST_SHA1
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_SHA224
++#endif
+ #define ARCH_TEST_SHA256
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_SHA384
+ #define ARCH_TEST_SHA512
+-// #define ARCH_TEST_SHA512_224
+-// #define ARCH_TEST_SHA512_256
+-// #define ARCH_TEST_SHA3_224
+-// #define ARCH_TEST_SHA3_256
+-// #define ARCH_TEST_SHA3_384
+-// #define ARCH_TEST_SHA3_512
++#endif
++#endif
++//#define ARCH_TEST_SHA512_224
++//#define ARCH_TEST_SHA512_256
++//#define ARCH_TEST_SHA3_224
++//#define ARCH_TEST_SHA3_256
++//#define ARCH_TEST_SHA3_384
++//#define ARCH_TEST_SHA3_512
+ 
+ /**
+  * \def ARCH_TEST_HKDF
+@@ -270,7 +306,12 @@
+  *
+  * Comment macros to disable the types
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_CMAC
++#endif
++#endif
++//#define ARCH_TEST_GMAC
+ #define ARCH_TEST_HMAC
+ 
+ /**
+@@ -290,7 +331,11 @@
+  * Requires: ARCH_TEST_AES
+  *
+  */
++#ifndef TF_M_PROFILE_SMALL
++#ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_GCM
++#endif
++#endif
+ 
+ /**
+  * \def ARCH_TEST_TRUNCATED_MAC
+@@ -309,7 +354,9 @@
+  *
+  * Requires: ARCH_TEST_ECC
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECDH
++#endif
+ 
+ /**
+  * \def ARCH_TEST_ECDSA
+@@ -317,7 +364,9 @@
+  * Enable the elliptic curve DSA library.
+  * Requires: ARCH_TEST_ECC
+  */
++#ifndef TF_M_PROFILE_SMALL
+ #define ARCH_TEST_ECDSA
++#endif
+ 
+ /**
+  * \def ARCH_TEST_DETERMINISTIC_ECDSA
+-- 
+2.38.0
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
index dfd47163..3bb7bea3 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
@@ -9,6 +9,7 @@ RDEPENDS:${PN} += "libts"
 
 SRC_URI += "git://github.com/ARM-software/psa-arch-tests.git;name=psatest;protocol=https;branch=main;destsuffix=git/psatest \
             file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-native.patch;patchdir=../psatest \
+            file://0002-corstone1000-port-crypto-config.patch;patchdir=../psatest \
            "
 
 SRCREV_psatest = "451aa087a40d02c7d04778235014c5619d126471"
-- 
2.17.1


