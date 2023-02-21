Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB22CC6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.44479.1676991071321871436
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 06:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEF62FEC;
	Tue, 21 Feb 2023 06:51:53 -0800 (PST)
Received: from e126544.cambridge.arm.com (unknown [10.1.199.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52C3B3F703;
	Tue, 21 Feb 2023 06:51:10 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 2/3] arm-bsp/trusted-services:corstone1000: disable obsolete algorithms for crypto
Date: Tue, 21 Feb 2023 14:50:55 +0000
Message-Id: <20230221145056.278981-3-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221145056.278981-1-mohamed.omarasaker@arm.com>
References: <20230221145056.278981-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 14:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4431

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

Disable obsolete algorithms in the psa-crypto configs

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 ...tone1000-Disable-obsolete-algorithms.patch | 32 +++++++++++++++++++
 .../trusted-services/ts-psa-api-test.inc      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/psa-apitest/0002-corstone1000-Disable-obsolete-algorithms.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
psa-apitest/0002-corstone1000-Disable-obsolete-algorithms.patch b/meta-ar=
m-bsp/recipes-security/trusted-services/corstone1000/psa-apitest/0002-cor=
stone1000-Disable-obsolete-algorithms.patch
new file mode 100644
index 00000000..d13e167a
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/psa-api=
test/0002-corstone1000-Disable-obsolete-algorithms.patch
@@ -0,0 +1,32 @@
+From 1bc041813df89a1be953d0ba3471e608f6fa7ed8 Mon Sep 17 00:00:00 2001
+From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Date: Thu, 9 Feb 2023 20:54:40 +0000
+Subject: [PATCH] corstone1000: Disable obsolete algorithms
+
+curves of size <255 are obsolete algorithms
+
+Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
+Upstream-Status: Inappropriate [Discussions of having these configs
+                                in a separate target is ongoing]
+---
+ .../targets/tgt_dev_apis_linux/nspe/pal_crypto_config.h       | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_cryp=
to_config.h
+index c6d4aad..1d9b356 100755
+--- a/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
++++ b/api-tests/platform/targets/tgt_dev_apis_linux/nspe/pal_crypto_conf=
ig.h
+@@ -66,6 +66,10 @@
+ #endif
+ #endif
+=20
++/* curves of size <255 are obsolete algorithms, should be disabled. */
++#undef ARCH_TEST_ECC_CURVE_SECP192R1
++#undef ARCH_TEST_ECC_CURVE_SECP224R1
++
+ /**
+  * \def ARCH_TEST_AES
+  *
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-te=
st.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.i=
nc
index a1f43d41..261d8e1a 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-psa-api-test.inc
@@ -4,4 +4,5 @@ include ts-arm-platforms.inc
=20
 SRC_URI:append:corstone1000  =3D " \
     file://0001-corstone1000-port-crypto-config.patch;patchdir=3D../psat=
est \
+    file://0002-corstone1000-Disable-obsolete-algorithms.patch;patchdir=3D=
../psatest \
     "
--=20
2.25.1


