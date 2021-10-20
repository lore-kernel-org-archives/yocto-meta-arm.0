Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBFAC4332F
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 15:25:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9583.1634743529184499062
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78117113E
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21BD43F73D
	for <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:25:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][master 4/5] arm/trusted-firmware-m: upgrade to 1.4.0
Date: Wed, 20 Oct 2021 16:25:21 +0100
Message-Id: <20211020152522.415448-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020152522.415448-1-ross.burton@arm.com>
References: <20211020152522.415448-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Oct 2021 15:25:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2283

From: Satish Kumar <satish.kumar01@arm.com>

Update TF-M to version 1.4.0, mbed TLS to 3.0.0, TF-M tests to 1.4.0,
and MCUBoot to TF-Mv1.4-integ tag.

Change-Id: I9172ed9fbf6c6c2ed88303256ef2452dafc665be
Signed-off-by: Satish Kumar <satish.kumar01@arm.com>
---
 ...-m_1.3.0.bb =3D> trusted-firmware-m_1.4.0.bb} | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.3.0=
.bb =3D> trusted-firmware-m_1.4.0.bb} (92%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.=
0.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
3.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.=
0.bb
index fa23191f..14fcbb1b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.3.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.4.0.bb
@@ -18,18 +18,18 @@ LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368=
487da347f3c7bd0fc3085f3afa \
 SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3Dmaster;name=3Dtfm;destsuffix=3D${S} \
             git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Dmaster;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-tests \
             git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmaster;name=3Dmbedtls;destsuffix=3D${S}/../mbedtls \
-            git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dv1.7-branch;name=3Dmcuboot;destsuffix=3D${S}/../mcuboot \
+            git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3Dmain;name=3Dmcuboot;destsuffix=3D${S}/../mcuboot \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
-# TF-Mv1.3.0
-SRCREV_tfm =3D "aa7d90a23b045e50c26ef66b11250842b665f54b"
-# mbedtls 2.26
-SRCREV_mbedtls =3D "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
-# tf-m-tests v1.3.0
-SRCREV_tfm-tests =3D "e7430d13b388a106c9f4cfb534e7340ce1482575"
-# 1.7.2
-SRCREV_mcuboot =3D "4aa516e7281fc6f9a2dce0b0efda9acc580fa254"
+# TF-Mv1.4.0
+SRCREV_tfm =3D "7ef9178adad866d48e3af42d8a3129dfab792ed8"
+# mbedtls-3.0.0
+SRCREV_mbedtls =3D "8df2f8e7b9c7bb9390ac74bb7bace27edca81a2b"
+# TF-Mv1.4.0
+SRCREV_tfm-tests =3D "e1a8c9fb8394b1f6ea66d2611c070915b0d4b573"
+# TF-Mv1.4-integ
+SRCREV_mcuboot =3D "4f8091318b4026d14af9e5a7036825bff62fb612"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
--=20
2.25.1


