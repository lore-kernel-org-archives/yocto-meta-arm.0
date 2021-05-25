Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7307.1621934484149254506
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 May 2021 02:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3425E6D
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 May 2021 02:21:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D31323F73D
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 May 2021 02:21:21 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/trusted-firmware-a: fix incorrect license checksum
Date: Tue, 25 May 2021 10:21:19 +0100
Message-Id: <20210525092119.1143597-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TF-A 2.5 has a tweaked license.rst file but the checksum wasn't updated.
Curiously the CI didn't catch this which is worrying.

Update the checksum for that file, and add MIT explicitly to the license
list as all of the embedded projects are used under the MIT.

Change-Id: Id39b4c49c0efae30c6452e77b1cdf56e43b792d4
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 67a5cd3..33ae64b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Trusted Firmware-A"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "BSD-3-Clause & MIT"
=20
 PROVIDES =3D "virtual/trusted-firmware-a"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
index dded003..15e689a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.5.bb
@@ -6,7 +6,7 @@ SRCREV_FORMAT =3D "tfa"
 # TF-A v2.5
 SRCREV_tfa =3D "1e13c500a0351ac4b55d09a63f7008e2438550f8"
=20
-LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D189505435dbcdcc8caa=
63c46fe93fa89"
+LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D713afe122abbe07f067=
f939ca3c480c5"
=20
 # mbed TLS v2.26.0
 SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3Dmaster"
--=20
2.25.1

