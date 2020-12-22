Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11742.1608647119947424826
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 06:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9C891042
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Dec 2020 06:25:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 863673F6CF
	for <meta-arm@lists.yoctoproject.org>; Tue, 22 Dec 2020 06:25:18 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-a: remove git-specific recipe
Date: Tue, 22 Dec 2020 14:25:14 +0000
Message-Id: <20201222142514.3891335-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222142514.3891335-1-ross.burton@arm.com>
References: <20201222142514.3891335-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This recipe isn't used by any machines and isn't tested, so remove it.

Machines that use a git snapshot should extend the closest versioned reci=
pe
instead.

Change-Id: Ia0970f2d0491204c23d171c065e85c9f65f9472f
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a_git.bb                 | 27 -------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_git.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
deleted file mode 100644
index 8dab35f..0000000
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-# Trusted firmware-A points a commit rather a tag
-#
-# This is only a base receipt and should be bbextended with suitable SRC=
REV_tfa
-# and SRCREV_MBEDTLS and target TFA_* variables
-
-# Never select this if another version is available
-DEFAULT_PREFERENCE =3D "-1"
-
-require trusted-firmware-a.inc
-
-# Use TF-A for version
-SRCREV_FORMAT =3D "tfa"
-
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
-
-#
-# mbed TLS source
-# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
-#
-
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls"
-
-LIC_FILES_CHKSUM_MBEDTLS =3D " \
-    file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57=
 \
-    file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
-    "
-
--=20
2.25.1

