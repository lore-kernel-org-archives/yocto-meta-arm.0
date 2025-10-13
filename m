Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F92ECCD190
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:49:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.47325.1760370579742343209
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 08:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CEE6113E;
	Mon, 13 Oct 2025 08:49:31 -0700 (PDT)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.29.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6973F66E;
	Mon, 13 Oct 2025 08:49:38 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 2/2] arm-bsp/corstone1000:psa-tests: Removes RSA tests
Date: Mon, 13 Oct 2025 16:49:12 +0100
Message-ID: <20251013154912.55363-3-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013154912.55363-1-frazer.carsley@arm.com>
References: <20251013154912.55363-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 15:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6735

Since TF-M v2.2.1, the new crypto driver used does not support RSA
algorithms, so these tests are no longer valid.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../psa-apitest/0004-Remove-RSA-support.patch | 52 +++++++++++++++++++
 .../trusted-services/ts-psa-api-test.inc      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/psa-apitest/0004-Remove-RSA-support.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
psa-apitest/0004-Remove-RSA-support.patch b/meta-arm-bsp/recipes-security=
/trusted-services/corstone1000/psa-apitest/0004-Remove-RSA-support.patch
new file mode 100644
index 00000000..50619f49
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/psa-api=
test/0004-Remove-RSA-support.patch
@@ -0,0 +1,52 @@
+From 56a71c2f32f73e0d4fec9f0881c390b7c2809a9e Mon Sep 17 00:00:00 2001
+From: emeara01 <emekcan.aras@arm.com>
+Date: Wed, 25 Sep 2024 15:06:19 +0100
+Subject: [PATCH] Remove RSA support
+
+TF-M 2.2 uses a new crypto driver that does not support RSA algorithms
+and Corstone1000 incorporates this version of TF-M.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+---
+ .../tgt_dev_apis_linux/nspe/pal_crypto_config.h  | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h
+index d6d552a..bfdeedc 100755
+--- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
++++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
+@@ -36,10 +36,10 @@
+  */
+ #ifndef TF_M_PROFILE_SMALL
+ #ifndef TF_M_PROFILE_MEDIUM
+-#define ARCH_TEST_RSA
+-#define ARCH_TEST_RSA_1024
+-#define ARCH_TEST_RSA_2048
+-#define ARCH_TEST_RSA_3072
++//#define ARCH_TEST_RSA
++//#define ARCH_TEST_RSA_1024
++//#define ARCH_TEST_RSA_2048
++//#define ARCH_TEST_RSA_3072
+ #endif
+ #endif
+=20
+@@ -206,10 +206,10 @@
+ #ifndef TF_M_PROFILE_SMALL
+ #ifndef TF_M_PROFILE_MEDIUM
+ #define ARCH_TEST_PKCS1V15
+-#define ARCH_TEST_RSA_PKCS1V15_SIGN
+-#define ARCH_TEST_RSA_PKCS1V15_SIGN_RAW
+-#define ARCH_TEST_RSA_PKCS1V15_CRYPT
+-#define ARCH_TEST_RSA_OAEP
++//#define ARCH_TEST_RSA_PKCS1V15_SIGN
++//#define ARCH_TEST_RSA_PKCS1V15_SIGN_RAW
++//#define ARCH_TEST_RSA_PKCS1V15_CRYPT
++//#define ARCH_TEST_RSA_OAEP
+ #endif
+ #endif
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-te=
st.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.i=
nc
index c9b1c784..006bcdef 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
@@ -6,4 +6,5 @@ SRC_URI:append:corstone1000  =3D " \
     file://0001-corstone1000-port-crypto-config.patch;patchdir=3D../psat=
est \
     file://0002-corstone1000-Disable-obsolete-algorithms.patch;patchdir=3D=
../psatest \
     file://0003-corstone1000-Disable-SHA512-384.patch;patchdir=3D../psat=
est \
+    file://0004-Remove-RSA-support.patch;patchdir=3D../psatest \
     "

