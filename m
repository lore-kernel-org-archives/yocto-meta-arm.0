Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12911.1604497211424504676
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 05:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 305C6139F
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Nov 2020 05:40:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF0AC3F719
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Nov 2020 05:40:09 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-a: clean up license assignments
Date: Wed,  4 Nov 2020 13:40:05 +0000
Message-Id: <20201104134006.1121416-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

trusted-firmware-a.inc can set LIC_FILES_CHKSUM so do +=3D in the .bb fil=
es.

trusted-firmware-a.inc expects recipes to set LIC_FILES_CHKSUM_MBEDTLS,
so just use =3D in the .bb files.

Change-Id: I673aec6f2ae59c58cd11517e1f2aecc538427796
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb  | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb  | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb  | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb  | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb  | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1=
.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
index 744ba8c..2e41e90 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
@@ -14,7 +14,7 @@ SRCREV_tfa =3D "ed8112606c54d85781fc8429160883d6310ece3=
2"
=20
 S =3D "${WORKDIR}/git"
=20
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3De927e02bca647e14efd87e9e9=
14b2443"
+LIC_FILES_CHKSUM +=3D "file://license.rst;md5=3De927e02bca647e14efd87e9e=
914b2443"
=20
 #
 # mbed TLS source
@@ -26,7 +26,7 @@ SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.g=
it;name=3Dmbedtls;protocol=3Dht
 # mbed TLS v2.16.2
 SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
=20
-LIC_FILES_CHKSUM_MBEDTLS +=3D " \
+LIC_FILES_CHKSUM_MBEDTLS =3D " \
     file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
     file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
     "
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
index 1f36dbc..96df5c6 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
@@ -14,7 +14,7 @@ SRCREV_tfa =3D "e1286bdb968ee74fc52f96cf303a4218e1ae295=
0"
=20
 S =3D "${WORKDIR}/git"
=20
-LIC_FILES_CHKSUM =3D "file://license.rst;md5=3Dc709b197e22b81ede21109dbf=
fd5f363"
+LIC_FILES_CHKSUM +=3D "file://license.rst;md5=3Dc709b197e22b81ede21109db=
ffd5f363"
=20
 #
 # mbed TLS source
@@ -26,7 +26,7 @@ SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.g=
it;name=3Dmbedtls;protocol=3Dht
 # mbed TLS v2.16.2
 SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
=20
-LIC_FILES_CHKSUM_MBEDTLS +=3D " \
+LIC_FILES_CHKSUM_MBEDTLS =3D " \
     file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
     file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
     "
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
index cd57539..58e6c8e 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
@@ -14,7 +14,7 @@ SRCREV_tfa =3D "7192b956bde11652a835eee0724dca0e403fee9=
0"
=20
 S =3D "${WORKDIR}/git"
=20
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa6=
3c46fe93fa89"
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
=20
 #
 # mbed TLS source
@@ -26,7 +26,7 @@ SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.g=
it;name=3Dmbedtls;protocol=3Dht
 # mbed TLS v2.16.2
 SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
=20
-LIC_FILES_CHKSUM_MBEDTLS +=3D " \
+LIC_FILES_CHKSUM_MBEDTLS =3D " \
     file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
     file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
     "
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
index 7279173..d333854 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -14,7 +14,7 @@ SRCREV_tfa =3D "ecd27ad85f1eba29f6bf92c39dc002c85b07dad=
5"
=20
 S =3D "${WORKDIR}/git"
=20
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa6=
3c46fe93fa89"
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
=20
 #
 # mbed TLS source
@@ -26,7 +26,7 @@ SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.g=
it;name=3Dmbedtls;protocol=3Dht
 # mbed TLS v2.18.1
 SRCREV_mbedtls =3D "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
=20
-LIC_FILES_CHKSUM_MBEDTLS +=3D " \
+LIC_FILES_CHKSUM_MBEDTLS =3D " \
     file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
     file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
     "
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index c443ecd..6adc00b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -15,7 +15,7 @@ SRCREV_FORMAT =3D "tfa"
=20
 S =3D "${WORKDIR}/git"
=20
-LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa6=
3c46fe93fa89"
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
=20
 #
 # mbed TLS source
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D189=
505435dbcdcc8caa63c46fe93fa89
=20
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls"
=20
-LIC_FILES_CHKSUM_MBEDTLS +=3D " \
+LIC_FILES_CHKSUM_MBEDTLS =3D " \
     file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
     file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
     "
--=20
2.25.1

