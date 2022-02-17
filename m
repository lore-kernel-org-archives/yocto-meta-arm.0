Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD70C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:53:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1552.1645113236778105216
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 07:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C7601396;
	Thu, 17 Feb 2022 07:53:56 -0800 (PST)
Received: from e126835.arm.com (unknown [10.57.40.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36E043F718;
	Thu, 17 Feb 2022 07:53:55 -0800 (PST)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
Cc: nd@arm.com,
	Vishnu Banavath <vishnu.banavath@arm.com>
Subject: [PATCH 1/2] arm-bsp/security: replace mbedcrypto with mbedtls
Date: Thu, 17 Feb 2022 15:53:45 +0000
Message-Id: <20220217155346.2566392-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217155346.2566392-1-emekcan.aras@arm.com>
References: <20220217155346.2566392-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 15:53:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3005

From: Vishnu Banavath <vishnu.banavath@arm.com>

This commit replaces mbedcrpyto with mbedtls on the trusted-service
recipe.

Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
---
 .../trusted-services/ts-corstone1000.inc        | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone10=
00.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.i=
nc
index 499dc31a..27315430 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-corstone1000.inc
@@ -2,15 +2,14 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/secure-partiti=
ons:"
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
-LIC_FILES_CHKSUM +=3D "file://../mbedcrypto/LICENSE;md5=3D302d50a6369f5f=
22efdb674db908167a \
-                                             file://../nanopb/LICENSE.tx=
t;md5=3D9db4b73a55a3994384112efcdb37c01f \
-                                             file://../openamp/LICENSE.m=
d;md5=3Da8d8cf662ef6bf9936a1e1413585ecbf \
-					     file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f0813b606d15a3=
df3d3c \
-                                             "
-
+LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57 \
+                     file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a39943=
84112efcdb37c01f \
+                     file://../openamp/LICENSE.md;md5=3Da8d8cf662ef6bf99=
36a1e1413585ecbf \
+		     file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f0813b606d15a3df3=
d3c \
+		     "
=20
 SRC_URI:append =3D " \
-                 ${SRC_URI_MBED} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP} ${=
SRC_URI_LIBMETAL} \
+                 ${SRC_URI_MBEDTLS} ${SRC_URI_NANOPB} ${SRC_URI_OPENAMP}=
 ${SRC_URI_LIBMETAL} \
                   file://0001-tools-cmake-common-applying-lowercase-proj=
ect-convention.patch \
                   file://0002-fix-EARLY_TA_PATHS-env-variable.patch \
                   file://0003-se-proxy-dts-add-se-proxy-as-child-node.pa=
tch \
@@ -45,8 +44,8 @@ SRC_URI:append =3D " \
                   file://0032-smm_gateway-add-checks-for-null-attributes=
.patch \
                   "
=20
-SRC_URI_MBED =3D "git://github.com/ARMmbed/mbed-crypto.git;protocol=3Dht=
tps;branch=3Ddevelopment;name=3Dmbed;destsuffix=3Dgit/mbedcrypto"
-SRCREV_mbed =3D "cf4a40ba0a3086cabb5a8227245191161fd26383"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhtt=
ps;branch=3Ddevelopment;name=3Dmbedtls;destsuffix=3Dgit/mbedtls"
+SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
=20
 SRC_URI_NANOPB =3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;pro=
tocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/nanopb"
 SRCREV_nanopb =3D "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
--=20
2.25.1


