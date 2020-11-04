Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12746.1604497211428145283
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Nov 2020 05:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5859142F
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Nov 2020 05:40:10 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61EFA3F719
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Nov 2020 05:40:10 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/trusted-firmware-a: ensure LICENSE is correct
Date: Wed,  4 Nov 2020 13:40:06 +0000
Message-Id: <20201104134006.1121416-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104134006.1121416-1-ross.burton@arm.com>
References: <20201104134006.1121416-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TF-A itself is BSD 3-clause licensed, so use that instead of the
generic BSD license.

The end result is only also Apache-2.0 licensed if mbed TLS is used,
so add this only if mbed TLS is enabled.

Change-Id: I243e664dcfc590d8b2dbe7b795bc414a973b379b
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 98085d0..393da40 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Trusted Firmware-A"
-LICENSE =3D "BSD & Apache-2.0"
+LICENSE =3D "BSD-3-Clause"
=20
 PROVIDES =3D "virtual/trusted-firmware-a"
=20
@@ -39,8 +39,9 @@ SRC_URI_MBEDTLS ??=3D ""
 LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
 # add MBEDTLS to our sources if activated
 SRC_URI_append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
-# add mbed TLS chksum
-LIC_FILES_CHKSUM +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '${LIC_F=
ILES_CHKSUM_MBEDTLS}', '', d)}"
+# Update license variables
+LICENSE_append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
+LIC_FILES_CHKSUM_append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
 SRCREV_FORMAT_append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
=20
--=20
2.25.1

