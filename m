Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.10403.1606326398296239840
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 09:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B018931B
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 09:46:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B52A3F23F
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 09:46:37 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/trusted-firmware-a: adapt for patched recipe
Date: Wed, 25 Nov 2020 17:46:35 +0000
Message-Id: <20201125174635.3789789-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The base trusted-firmware-a recipe is now patched, but these BSPs
chose to use an intermediate SHA instead of the release.  This SHA
already contains the patch, so we need to remove it from SRC_URI.

Change-Id: I69fab93cefd2e8b38474e308c6f2910454ba3a81
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-corstone700.inc   | 3 +++
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc         | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-=
firmware-a-corstone700.inc
index f48ac64..bdffec8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone700.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone700.inc
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D1dd070c9=
8a281d18d9eefd938729b031"
 # fdts: corstone700: add NXP isp1763 node to device tree
 SRCREV_tfa =3D "a6f65b11529b618ff04017f64054dc661c489068"
=20
+# This is incorporated into the SRCREV above
+SRC_URI_remove =3D "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue=
.patch"
+
 PV =3D "2.3+git${SRCPV}"
=20
 EXTRA_OEMAKE_append =3D " \
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index a9cf38f..f9cb288 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -8,10 +8,12 @@ TFA_DEBUG          =3D "1"
 TFA_MBEDTLS        =3D "0"
 TFA_UBOOT          =3D "0"
=20
+SRCREV_tfa =3D "dffd5192df41e77e27bb524bfe64d747c1c43522"
+
 SRC_URI_append =3D " \
     file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.pat=
ch \
     "
-
-SRCREV_tfa =3D "dffd5192df41e77e27bb524bfe64d747c1c43522"
+# This is incorporated into the SRCREV above
+SRC_URI_remove =3D "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue=
.patch"
=20
 PV =3D "2.3+git${SRCPV}"
--=20
2.25.1

