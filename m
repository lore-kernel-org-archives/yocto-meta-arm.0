Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EB6E7719D
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 15:26:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21251.1736522797176952726
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 07:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 000221477
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 07:27:04 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 902043F59E
	for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 07:26:36 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/trusted-firmware-a: update 2.10 LTS to the latest versions
Date: Fri, 10 Jan 2025 10:26:33 -0500
Message-Id: <20250110152635.99735-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6313

Update TF-A LTS to 2.10.9 (which includes an mbedtls bump to 3.6.1, per
docs).  Also, bump the TF-A tests to the latest version.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ptool-native_2.10.4.bb =3D> fiptool-native_2.10.9.bb} |  4 ++--
 .../{tf-a-tests_2.10.0.bb =3D> tf-a-tests_2.10.3.bb}     |  5 ++---
 ...rmware-a_2.10.4.bb =3D> trusted-firmware-a_2.10.9.bb} | 10 +++++-----
 3 files changed, 9 insertions(+), 10 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.10.4.bb=
 =3D> fiptool-native_2.10.9.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.10.0.bb =3D=
> tf-a-tests_2.10.3.bb} (90%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.10.=
4.bb =3D> trusted-firmware-a_2.10.9.bb} (74%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.9.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.4=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.9.b=
b
index 9072dca50a50..a6ebea976d1c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.4.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.9.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmwar=
e.org/TF-A/trusted-firmwa
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.10.4
-SRCREV =3D "569e16caad976a0684147da1ecc6333fd9b7f813"
+# Use fiptool from TF-A v2.10.9
+SRCREV =3D "7e63213601425c7a6d83e47dc936b264deb9df2b"
 SRCBRANCH =3D "lts-v2.10"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
similarity index 90%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
index fffdf5d3653d..645e8d86a8a6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
@@ -8,10 +8,9 @@ inherit deploy
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
-SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
-          "
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};nobranch=3D1"
 SRCBRANCH =3D "master"
-SRCREV =3D "42b99719d5dde58bdde07712bcb70a20d87f9067"
+SRCREV =3D "8917cf8b5eeb409b63256076d0dc35c60930ce18"
=20
 DEPENDS +=3D "optee-os"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.4.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
0.9.bb
similarity index 74%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.4.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10=
.9.bb
index 8cdfda443cde..aab78477f484 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.4.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.9.b=
b
@@ -1,15 +1,15 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.10.4
-SRCREV_tfa =3D "569e16caad976a0684147da1ecc6333fd9b7f813"
+# TF-A v2.10.9
+SRCREV_tfa =3D "7e63213601425c7a6d83e47dc936b264deb9df2b"
 SRCBRANCH =3D "lts-v2.10"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.4.1
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
-SRCREV_mbedtls =3D "72718dd87e087215ce9155a826ee5a66cfbe9631"
+# mbedtls-3.6.1
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-3.6"
+SRCREV_mbedtls =3D "71c569d44bf3a8bd53d874c81ee8ac644dd6e9e3"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D3b83ef96387f1=
4655fc854ddc3c6bd57"
=20
--=20
2.39.5 (Apple Git-154)


