Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1E8EA4E36
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:06:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.164048.1772467596622486353
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 08:06:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 922F014BF
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Mar 2026 08:06:29 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C74933F694
	for <meta-arm@lists.yoctoproject.org>; Mon,  2 Mar 2026 08:06:35 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-a: update LTSes
Date: Mon,  2 Mar 2026 11:06:33 -0500
Message-ID: <20260302160634.41221-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Mar 2026 16:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6929

Update the TF-A recipes to the latest stables/LTS versions.  Not all of
the versions updated the version of mbedtls being used (and even the
updates didn't update to the latest stable version of mbedtls).  We're
using the mbedtls version specified in
docs/getting_started/prerequisites.rst, not the latest available.

Also, update the related fiptools and tf-a-tests (which don't map to the
same releases, but were all verified to be at the latest versions).
No real change in cot-dt2c code, but updating the SHA to the latest.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb | 6 +++---
 ...iptool-native_2.10.17.bb =3D> fiptool-native_2.10.30.bb} | 4 ++--
 ...fiptool-native_2.12.3.bb =3D> fiptool-native_2.12.10.bb} | 4 ++--
 ...{fiptool-native_2.14.0.bb =3D> fiptool-native_2.14.1.bb} | 6 +++---
 .../{tf-a-tests_2.10.15.bb =3D> tf-a-tests_2.10.24.bb}      | 2 +-
 ...irmware-a_2.10.17.bb =3D> trusted-firmware-a_2.10.30.bb} | 8 ++++----
 ...firmware-a_2.12.3.bb =3D> trusted-firmware-a_2.12.10.bb} | 4 ++--
 ...-firmware-a_2.14.0.bb =3D> trusted-firmware-a_2.14.1.bb} | 6 +++---
 8 files changed, 20 insertions(+), 20 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.10.17.b=
b =3D> fiptool-native_2.10.30.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.12.3.bb=
 =3D> fiptool-native_2.12.10.bb} (92%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{fiptool-native_2.14.0.bb=
 =3D> fiptool-native_2.14.1.bb} (90%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{tf-a-tests_2.10.15.bb =3D=
> tf-a-tests_2.10.24.bb} (96%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.10.=
17.bb =3D> trusted-firmware-a_2.10.30.bb} (83%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.12.=
3.bb =3D> trusted-firmware-a_2.12.10.bb} (91%)
 rename meta-arm/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.14.=
0.bb =3D> trusted-firmware-a_2.14.1.bb} (89%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
index 8e9e37a9064b..2cffb46c417d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -6,9 +6,9 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirm=
ware.org/TF-A/trusted-fir
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};branch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
-# Use cot-dt2c from TF-A v2.14.0
-SRCREV =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
-SRCBRANCH =3D "master"
+# Use cot-dt2c from TF-A v2.14.1
+SRCREV =3D "e82c7ced9e76aea35b176e608d67dfe5ebe1c569"
+SRCBRANCH =3D "lts-v2.14"
=20
 inherit python_poetry_core
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.=
17.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.30.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.1=
7.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.30.=
bb
index 5ae8247c3128..deab9ad059bc 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.17.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.10.30.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirm=
ware.org/TF-A/trusted-fir
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
-# Use fiptool from TF-A v2.10.17
-SRCREV =3D "4b1f6671b0cbddad7577fea5fcd7027f5533dc71"
+# Use fiptool from TF-A v2.10.30
+SRCREV =3D "d57b81079003e1647ed4181057c5784c7e3b1c3e"
 SRCBRANCH =3D "lts-v2.10"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.=
3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.10.bb
similarity index 92%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.10.=
bb
index af4f4f5b2f0e..985fd4c2ca6c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.12.10.bb
@@ -9,8 +9,8 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirm=
ware.org/TF-A/trusted-fir
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
=20
-# Use fiptool from TF-A v2.12.3
-SRCREV =3D "799fa03173b6c5ab85f70e583dd7d12719592436"
+# Use fiptool from TF-A v2.12.10
+SRCREV =3D "9487b105dcf18d057c6aeb405f9eaa1079c8fe6e"
 SRCBRANCH =3D "lts-v2.12"
=20
 DEPENDS +=3D "openssl-native"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.=
0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.1.bb
similarity index 90%
rename from meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.0=
.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.1.b=
b
index a96329e1b424..d70304aa1299 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/fiptool-native_2.14.1.bb
@@ -9,9 +9,9 @@ SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirm=
ware.org/TF-A/trusted-fir
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c6=
eba7b524039e"
=20
-# Use fiptool from  TF-A v2.14.0
-SRCREV =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
-SRCBRANCH =3D "master"
+# Use fiptool from TF-A v2.14.1
+SRCREV =3D "e82c7ced9e76aea35b176e608d67dfe5ebe1c569"
+SRCBRANCH =3D "lts-v2.14"
=20
 DEPENDS +=3D "openssl-native"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.b=
b b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.24.bb
similarity index 96%
rename from meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.24.bb
index c484721b9398..b2691122cc09 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.24.bb
@@ -10,7 +10,7 @@ COMPATIBLE_MACHINE ?=3D "invalid"
 SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://review.trustedfirmware.org/=
TF-A/tf-a-tests;protocol=3Dhttps"
 SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH}"
 SRCBRANCH =3D "lts-v2.10"
-SRCREV =3D "42c6a147d6f8957ff0b6e9eec4591b0927b8769f"
+SRCREV =3D "ad8e3c9506abc6fd093c9753c8e201ddc2daa270"
=20
 EXTRA_OEMAKE +=3D "USE_NVM=3D0"
 EXTRA_OEMAKE +=3D "SHELL_COLOR=3D1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.17.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.30.bb
similarity index 83%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.17.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10=
.30.bb
index 664c1090b9c3..fd19ac911089 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.17.=
bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.30.=
bb
@@ -1,16 +1,16 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.10.17
-SRCREV_tfa =3D "4b1f6671b0cbddad7577fea5fcd7027f5533dc71"
+# TF-A v2.10.30
+SRCREV_tfa =3D "d57b81079003e1647ed4181057c5784c7e3b1c3e"
 SRCBRANCH =3D "lts-v2.10"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c740efedc159745b9=
b31f88ff03dde"
=20
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
-# mbedtls-3.6.3
+# mbedtls-3.6.4
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
 SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
-SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
+SRCREV_mbedtls =3D "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
2.10.bb
similarity index 91%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
12.3.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12=
.10.bb
index 66c30f263593..20fc5a7d70bc 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.3.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.10.=
bb
@@ -1,7 +1,7 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.12.3
-SRCREV_tfa =3D "799fa03173b6c5ab85f70e583dd7d12719592436"
+# TF-A v2.12.10
+SRCREV_tfa =3D "9487b105dcf18d057c6aeb405f9eaa1079c8fe6e"
 SRCBRANCH =3D "lts-v2.12"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6=
a58af8d19bee1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.1.bb
similarity index 89%
rename from meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
14.0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14=
.1.bb
index 31ad86805ab9..2f69d054a3f8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.1.b=
b
@@ -1,9 +1,9 @@
 require recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
=20
-# TF-A v2.14.0
+# TF-A v2.14.1
 SRC_URI_TRUSTED_FIRMWARE_A =3D "gitsm://review.trustedfirmware.org/TF-A/=
trusted-firmware-a;protocol=3Dhttps"
-SRCREV_tfa =3D "1d5aa939bc8d3d892e2ed9945fa50e36a1a924cc"
-SRCBRANCH =3D "master"
+SRCREV_tfa =3D "e82c7ced9e76aea35b176e608d67dfe5ebe1c569"
+SRCBRANCH =3D "lts-v2.14"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6ed7bace7b0bc63021c=
6eba7b524039e"
=20
--=20
2.50.1 (Apple Git-155)


