Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBD8CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:58:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2939.1762797476187002929
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Nov 2025 09:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3EEE2F
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Nov 2025 09:57:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 150263F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 10 Nov 2025 09:57:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-*: use correct mbedtls git URL
Date: Mon, 10 Nov 2025 17:57:51 +0000
Message-ID: <20251110175751.1259294-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Nov 2025 17:58:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6764

ARMmbed/mbedtls is the old name and redirects to Mbed-TLS/mbedtls, use
the correct name to avoid the redirection.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a_2.10.17.bb            | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.3.bb | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.bb | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb    | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-2.1.1-src.inc         | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-2.2.1-src.inc         | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-git-src.inc           | 2 +-
 .../recipes-security/trusted-services/trusted-services-src.inc  | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.17.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.17.bb
index ca887e0e80..664c1090b9 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.17.=
bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.17.=
bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c7=
40efedc159745b9b31f88ff03dd
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
2.3.bb
index 970773265d..66c30f2635 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.3.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.3.b=
b
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7=
626b8c7a37263c6a58af8d19bee
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.13.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
3.0.bb
index 3de30bcaa1..b34ade0f30 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118=
e32884721c0be33267bd7ae1113
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 6383fefa9c..811fab8439 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118=
e32884721c0be33267bd7ae1113
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;pr=
otocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branch=3D=
${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.1-src.inc
index 5eaf48c570..10a046e135 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
@@ -12,7 +12,7 @@ SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmw=
are.org/TF-M/trusted-firmwa
 SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/Mbed-TLS/mbe=
dtls;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.1-src.inc
index 833d257a7e..d57c9e613d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.1-sr=
c.inc
@@ -16,7 +16,7 @@ SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmw=
are.org/TF-M/trusted-firmwa
 SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/Mbed-TLS/mbe=
dtls;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
index b4e24c9ee5..65a2e3110a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -16,7 +16,7 @@ SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmw=
are.org/TF-M/trusted-firmwa
 SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_CMSIS ?=3D "git://github.com/ARM-software/CMS=
IS_6.git;protocol=3Dhttps"
-SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/ARMmbed/mbed=
tls.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://github.com/Mbed-TLS/mbe=
dtls;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 4d10f6ea24..331ff062d2 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -27,7 +27,7 @@ SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd8=
1"
 LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/dtc/README.license;md5=3Da1eb=
22e37f09df5b5511b8a278992d0e"
=20
 # MbedTLS, tag "v3.6.0"
-SRC_URI +=3D "gitsm://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;prot=
ocol=3Dhttps;branch=3Dmaster;destsuffix=3Dmbedtls"
+SRC_URI +=3D "gitsm://github.com/Mbed-TLS/mbedtls;name=3Dmbedtls;protoco=
l=3Dhttps;branch=3Dmaster;destsuffix=3Dmbedtls"
 SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
 LIC_FILES_CHKSUM +=3D "file://${UNPACKDIR}/mbedtls/LICENSE;md5=3D379d581=
9937a6c2f1ef1630d341e026d"
=20
--=20
2.43.0


