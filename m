Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11885.1597227177008011782
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 03:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A56BBD6E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:56 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AAA63F22E
	for <meta-arm@lists.yoctoproject.org>; Wed, 12 Aug 2020 03:12:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/trusted-firmware-m: use hashes not tag names
Date: Wed, 12 Aug 2020 11:12:51 +0100
Message-Id: <20200812101251.3237307-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812101251.3237307-1-ross.burton@arm.com>
References: <20200812101251.3237307-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@arm.com>

Using tag names in SRCREV means a network operation every build, and
loss of reproducible builds if the tag moves.

Change-Id: I583e723925314a4a36a9ac1b6c932dbcf99e7da4
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m_1.0.bb      | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
index db941b8..80df2f1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -8,8 +8,6 @@ DESCRIPTION =3D "Trusted Firmware-M"
 HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
 PROVIDES =3D "virtual/trusted-firmware-m"
=20
-# TF-Mv1.0
-SRCREV_tfm =3D "TF-Mv1.0"
 LICENSE =3D "BSD-3-Clause & Apachev2"
=20
 LIC_FILES_CHKSUM ?=3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc3=
085f3afa"
@@ -23,9 +21,12 @@ SRC_URI +=3D "https://github.com/ARM-software/CMSIS_5/=
releases/download/5.5.0/ARM.
 SRC_URI[cmsis.md5sum] =3D "73b6cf6b4ab06ac099478e6cf983c08e"
 SRC_URI[cmsis.sha256sum] =3D "fc6e46c77de29ed05ef3bfd4846a2da49b024bc885=
4c876ac053aaa8d348ac52"
=20
-SRCREV_FORMAT ?=3D "tfm_mbed-crypto_cmsis"
-SRCREV_mbed-crypto ?=3D "mbedcrypto-3.0.1"
-SRCREV_cmsis ?=3D "5.5.0"
+SRCREV_FORMAT =3D "tfm_mbed-crypto_cmsis"
+# TF-Mv1.0
+SRCREV_tfm =3D "0768982ea41b5e7d207445f19ee23e5d67d9c89b"
+# mbedcrypto-3.0.1
+SRCREV_mbed-crypto =3D "1146b4e06011b69a6437e6b728f2af043a06ec19"
+SRCREV_cmsis =3D "5.5.0"
=20
 # Note to future readers of this recipe: until the CMakeLists don't abus=
e
 # installation (see do_install) there is no point in trying to inherit
--=20
2.26.2

