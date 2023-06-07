Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F73CC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 13:48:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9549.1686232116256141333
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 06:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51C79AB6
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Jun 2023 06:49:21 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A97743F6C4
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Jun 2023 06:48:35 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] trusted-firmware-a: update to the latest TF-A LTS
Date: Wed,  7 Jun 2023 09:14:27 -0500
Message-Id: <20230607141428.3313424-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 13:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4749

Update TF-A and fiptool (which is part of tf-a) to the latest stable vers=
ion.
Also, use the tf-a tests lts branch (which is still at version 2.8.0).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../{fiptool-native_2.8.bb =3D> fiptool-native_2.8.6.bb}   | 6 +++---
 .../recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb   | 4 ++--
 ...d-firmware-a_2.8.0.bb =3D> trusted-firmware-a_2.8.6.bb} | 9 +++++----
 3 files changed, 10 insertions(+), 9 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.8.bb =3D=
> fiptool-native_2.8.6.bb} (90%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.8.0=
.bb =3D> trusted-firmware-a_2.8.6.bb} (78%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.b=
b b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.6.bb
similarity index 90%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.6.bb
index 578f5a29..02f33873 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.8.6.bb
@@ -7,11 +7,11 @@ LICENSE =3D "BSD-3-Clause"
=20
 SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
-SRCBRANCH =3D "master"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.8
-SRCREV =3D "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48"
+# Use fiptool from TF-A v2.8.6
+SRCREV =3D "ff0bd5f9bb2ba2f31fb9cec96df917747af9e92d"
+SRCBRANCH =3D "lts-v2.8"
=20
 DEPENDS +=3D "openssl-native"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb =
b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
index 0c094995..ed3b3499 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.8.0.bb
@@ -10,8 +10,8 @@ COMPATIBLE_MACHINE ?=3D "invalid"
 SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
           file://tf-a-tests-no-warn-rwx-segments.patch"
-SRCBRANCH =3D "master"
-SRCREV =3D "f7b3be91ab954c495912fc7bc48383cd83bfec2d"
+SRCBRANCH =3D "lts-v2.8"
+SRCREV =3D "85442d2943440718c2c2c9c5c690202b4b4f5725"
=20
 DEPENDS +=3D "optee-os"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.8.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
6.bb
similarity index 78%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
8.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
6.bb
index 5830339c..a987ac1c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.6.bb
@@ -1,7 +1,8 @@
 require trusted-firmware-a.inc
=20
-# TF-A v2.8
-SRCREV_tfa =3D "9881bb93a3bc0a3ea37e9f093e09ab4b360a9e48"
+# TF-A v2.8.6
+SRCREV_tfa =3D "ff0bd5f9bb2ba2f31fb9cec96df917747af9e92d"
+SRCBRANCH =3D "lts-v2.8"
=20
 SRC_URI +=3D "file://rwx-segments.patch"
=20
@@ -13,8 +14,8 @@ SRC_URI:append:qemuarm64-secureboot =3D " \
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
-# mbed TLS v2.28.2
+# mbed TLS v2.28.3
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.28"
-SRCREV_mbedtls =3D "89f040a5c938985c5f30728baed21e49d0846a53"
+SRCREV_mbedtls =3D "981743de6fcdbe672e482b6fd724d31d0a0d2476"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
--=20
2.30.2


