Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91661C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:25:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17926.1749047111713180207
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 07:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A409266C
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Jun 2025 07:24:54 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 189653F5A1
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Jun 2025 07:25:11 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/trusted-firmware-a: update 2.12 lts
Date: Wed,  4 Jun 2025 10:25:08 -0400
Message-Id: <20250604142509.15895-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250604142509.15895-1-jon.mason@arm.com>
References: <20250604142509.15895-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jun 2025 14:25:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6526

Update the TF-A 2.12 LTS recipes to the latest versions, which are
2.12.3.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...{fiptool-native_2.12.1.bb =3D> fiptool-native_2.12.3.bb} | 4 ++--
 .../{tf-a-tests_2.12.0.bb =3D> tf-a-tests_2.12.3.bb}        | 7 +++----
 ...-firmware-a_2.12.1.bb =3D> trusted-firmware-a_2.12.3.bb} | 8 ++++----
 3 files changed, 9 insertions(+), 10 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.12.1.bb=
 =3D> fiptool-native_2.12.3.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.12.0.bb =3D=
> tf-a-tests_2.12.3.bb} (93%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.12.=
1.bb =3D> trusted-firmware-a_2.12.3.bb} (81%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.=
1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.1=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.b=
b
index 98c8edda730c..cfbfe42bc41c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
=20
-# Use fiptool from TF-A v2.12.1
-SRCREV =3D "8cf9edba5cc3ec11ed5463f206aa5819f7fdbade"
+# Use fiptool from TF-A v2.12.3
+SRCREV =3D "799fa03173b6c5ab85f70e583dd7d12719592436"
 SRCBRANCH =3D "lts-v2.12"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
similarity index 93%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
index 31b0964bdaa3..adf94c42ad19 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
@@ -8,10 +8,9 @@ inherit deploy
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
-          "
-SRCBRANCH =3D "master"
-SRCREV =3D "6a113621a9efdc143e9270b1789046cd7d9cdfb1"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
+SRCBRANCH =3D "lts-v2.12"
+SRCREV =3D "3650d9cdfaa8eda20eba4b0c366c7c213a356557"
=20
 EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
2.3.bb
similarity index 81%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
12.1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12=
.3.bb
index 47ac87225b32..d7f83fe716c4 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.3.b=
b
@@ -1,16 +1,16 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.12.1
-SRCREV_tfa =3D "8cf9edba5cc3ec11ed5463f206aa5819f7fdbade"
+# TF-A v2.12.3
+SRCREV_tfa =3D "799fa03173b6c5ab85f70e583dd7d12719592436"
 SRCBRANCH =3D "lts-v2.12"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.2
+# mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
-SRCREV_mbedtls =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
+SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
--=20
2.39.5 (Apple Git-154)


