Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.40150.1598609753078901276
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 03:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A57CE31B
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:51 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48BE83F68F
	for <meta-arm@lists.yoctoproject.org>; Fri, 28 Aug 2020 03:15:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm/trusted-firmware-a: actually add mbedtls to SRC_URI
Date: Fri, 28 Aug 2020 11:15:42 +0100
Message-Id: <20200828101545.1291491-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

trusted-firmware-a.inc was conditionally adding the Mbed TLS tarball to
SRC_URI, but all of the versioned recipes subsequently assigned over the
top of it so the Mbed TLS tarball was never actually in SRC_URI.  This
resulted in machine overrides needing to add the tarball themselves.

Solve by using _append so that the SRC_URI is actually changed.

Change-Id: I05cf1dec2c6422a40a42c615fb2b9b6e8d6f1cb0
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index e1cffdf..7845dac 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -38,7 +38,7 @@ SRC_URI_MBEDTLS ??=3D ""
 # This should be set to MBEDTLS LIC FILES checksum
 LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
 # add MBEDTLS to our sources if activated
-SRC_URI +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTL=
S}', '', d)}"
+SRC_URI_append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
 # add mbed TLS chksum
 LIC_FILES_CHKSUM +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '${LIC_F=
ILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
--=20
2.28.0

