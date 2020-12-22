Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11961.1608647119526420211
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 06:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5498E1FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Dec 2020 06:25:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3E913F6CF
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Dec 2020 06:25:17 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-a: remove unused 2.1 recipe
Date: Tue, 22 Dec 2020 14:25:13 +0000
Message-Id: <20201222142514.3891335-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No machines in meta-arm are using this old release.

Change-Id: I8b56b1cc3eb603ee423acc52950d1e7661502d0e
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a_2.1.bb                 | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_2.1.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
deleted file mode 100644
index 44d6d6f..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# Trusted firmware-A 2.1
-#
-
-require trusted-firmware-a.inc
-
-# Use TF-A for version
-SRCREV_FORMAT =3D "tfa"
-
-# TF-A v2.1
-SRCREV_tfa =3D "e1286bdb968ee74fc52f96cf303a4218e1ae2950"
-
-LIC_FILES_CHKSUM +=3D "file://license.rst;md5=3Dc709b197e22b81ede21109db=
ffd5f363"
-
-#
-# mbed TLS source
-# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
-#
-
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmbedtls-2.16"
-
-# mbed TLS v2.16.2
-SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D " \
-    file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
-    file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
-    "
--=20
2.25.1

