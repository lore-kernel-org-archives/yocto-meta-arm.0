Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94298C5B559
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:25:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17873.1749047111712859772
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 07:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAB4125E3
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Jun 2025 07:24:53 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6A2D3F5A1
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Jun 2025 07:25:10 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/trusted-firmware-a: update 2.10 lts
Date: Wed,  4 Jun 2025 10:25:07 -0400
Message-Id: <20250604142509.15895-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jun 2025 14:25:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6525

Update the TF-A 2.10 LTS recipes to the latest versions, which are
2.10.17 and 2.10.15 for the tests.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ool-native_2.10.9.bb =3D> fiptool-native_2.10.17.bb} |  4 ++--
 .../{tf-a-tests_2.10.3.bb =3D> tf-a-tests_2.10.15.bb}   |  6 +++---
 ...are-a_2.10.12.bb =3D> trusted-firmware-a_2.10.17.bb} | 11 ++++++-----
 3 files changed, 11 insertions(+), 10 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.10.9.bb=
 =3D> fiptool-native_2.10.17.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.10.3.bb =3D=
> tf-a-tests_2.10.15.bb} (89%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.10.=
12.bb =3D> trusted-firmware-a_2.10.17.bb} (70%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
9.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.9=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.=
bb
index a6ebea976d1c..1534b7e5f562 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.9.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.10.9
-SRCREV =3D "7e63213601425c7a6d83e47dc936b264deb9df2b"
+# Use fiptool from TF-A v2.10.17
+SRCREV =3D "4b1f6671b0cbddad7577fea5fcd7027f5533dc71"
 SRCBRANCH =3D "lts-v2.10"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
similarity index 89%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
index 39fddd9b7fd6..5b2899600bfb 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
@@ -8,9 +8,9 @@ inherit deploy
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};nobranch=3D1"
-SRCBRANCH =3D "master"
-SRCREV =3D "8917cf8b5eeb409b63256076d0dc35c60930ce18"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
+SRCBRANCH =3D "lts-v2.10"
+SRCREV =3D "42c6a147d6f8957ff0b6e9eec4591b0927b8769f"
=20
 EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.12.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.17.bb
similarity index 70%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.12.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10=
.17.bb
index 5454e84cc8aa..e7dd90a5fec5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.12.=
bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.17.=
bb
@@ -1,15 +1,16 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.10.12
-SRCREV_tfa =3D "408ba4ddfe9a8d55e3e2488bea89c39adef07981"
+# TF-A v2.10.17
+SRCREV_tfa =3D "4b1f6671b0cbddad7577fea5fcd7027f5533dc71"
 SRCBRANCH =3D "lts-v2.10"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.2
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-3.6"
-SRCREV_mbedtls =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
+# mbedtls-3.6.3
+SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
+SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
--=20
2.39.5 (Apple Git-154)


