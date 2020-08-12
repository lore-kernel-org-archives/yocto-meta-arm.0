Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11683.1597227176477988524
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 03:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1111411B3
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:56 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9D7B3F22E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/trusted-firmware-m: don't fetch mbedtls
Date: Wed, 12 Aug 2020 11:12:50 +0100
Message-Id: <20200812101251.3237307-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812101251.3237307-1-ross.burton@arm.com>
References: <20200812101251.3237307-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

The trusted-firmware-m build doesn't use mbedtls (just mbed-crypto), so
don't fetch it.

Change-Id: Idc7fe211a8a667262a59d1e8106e486fb96498bd
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index f3a8724..db941b8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -14,20 +14,17 @@ LICENSE =3D "BSD-3-Clause & Apachev2"
=20
 LIC_FILES_CHKSUM ?=3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc3=
085f3afa"
 LIC_FILES_CHKSUM +=3D "file://../mbed-crypto/LICENSE;md5=3D302d50a6369f5=
f22efdb674db908167a"
-LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D302d50a6369f5f22e=
fdb674db908167a"
 LIC_FILES_CHKSUM +=3D "file://../CMSIS_5/LICENSE.txt;md5=3Dc4082b6c254c9=
fb71136710391d9728b"
=20
 SRC_URI  =3D "git://git.trustedfirmware.org/trusted-firmware-m.git;proto=
col=3Dhttps;branch=3Dmaster;name=3Dtfm;destsuffix=3D${S}"
 SRC_URI +=3D "git://github.com/ARMmbed/mbed-crypto.git;protocol=3Dhttps;=
branch=3Ddevelopment;name=3Dmbed-crypto;destsuffix=3D${S}/../mbed-crypto"
-SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-2.7;name=3Dmbedtls;destsuffix=3D${S}/../mbedtls"
 SRC_URI +=3D "https://github.com/ARM-software/CMSIS_5/releases/download/=
5.5.0/ARM.CMSIS.5.5.0.pack;name=3Dcmsis;subdir=3D${S}/../CMSIS_5;download=
filename=3DARM.CMSIS.5.5.0.zip"
=20
 SRC_URI[cmsis.md5sum] =3D "73b6cf6b4ab06ac099478e6cf983c08e"
 SRC_URI[cmsis.sha256sum] =3D "fc6e46c77de29ed05ef3bfd4846a2da49b024bc885=
4c876ac053aaa8d348ac52"
=20
-SRCREV_FORMAT ?=3D "tfm_mbed-crypto_mbedtls_cmsis"
+SRCREV_FORMAT ?=3D "tfm_mbed-crypto_cmsis"
 SRCREV_mbed-crypto ?=3D "mbedcrypto-3.0.1"
-SRCREV_mbedtls ?=3D "mbedtls-2.7.14"
 SRCREV_cmsis ?=3D "5.5.0"
=20
 # Note to future readers of this recipe: until the CMakeLists don't abus=
e
--=20
2.26.2

