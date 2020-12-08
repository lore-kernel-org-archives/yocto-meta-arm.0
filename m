Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6825.1607425346932985594
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 03:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 548AD30E
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Dec 2020 03:02:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDFBC3F68F
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Dec 2020 03:02:25 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: move N1SDP to TF-A 2.4
Date: Tue,  8 Dec 2020 11:02:22 +0000
Message-Id: <20201208110222.1700149-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208110222.1700149-1-ross.burton@arm.com>
References: <20201208110222.1700149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: I85a7b9421a6d5267c778c164b8f0e0bdd24b8407
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                        | 4 +---
 ...sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch | 1 +
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc         | 6 ------
 .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend      | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.4.bbappend      | 1 +
 5 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 441d8c6..acb0f5c 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -24,9 +24,7 @@ PREFERRED_VERSION_linux-linaro-arm ?=3D "5.4%"
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
=20
-# Trusted firmware v2.3 version
-PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001=
-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch b/meta-arm-bs=
p/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-wo=
rkaround-for-N1-Erratum-13157.patch
index 53a6616..c199a7b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-=
arm-tf-disable-workaround-for-N1-Erratum-13157.patch
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-=
arm-tf-disable-workaround-for-N1-Erratum-13157.patch
@@ -26,6 +26,7 @@ software running on N1 SDP, including those that do not=
 require mitigation.
 This patch is meant for performance evaluation purposes ONLY and should =
not
 be used for software that requires a seccomp computing environment.
=20
+Upstream-Status: Inappropriate
 Signed-off-by: James Yang <James.Yang@arm.com>
 ---
  plat/arm/board/n1sdp/platform.mk | 2 ++
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwa=
re-a-n1sdp.inc
index f9cb288..fbc4358 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sd=
p.inc
@@ -8,12 +8,6 @@ TFA_DEBUG          =3D "1"
 TFA_MBEDTLS        =3D "0"
 TFA_UBOOT          =3D "0"
=20
-SRCREV_tfa =3D "dffd5192df41e77e27bb524bfe64d747c1c43522"
-
 SRC_URI_append =3D " \
     file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.pat=
ch \
     "
-# This is incorporated into the SRCREV above
-SRC_URI_remove =3D "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue=
.patch"
-
-PV =3D "2.3+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
index 7048097..f1908f8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
@@ -3,7 +3,6 @@
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
 MACHINE_TFA_REQUIRE_corstone500 =3D "trusted-firmware-a-corstone500.inc"
-MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.4.bbappend
index 4a89fd5..944dd7a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.=
bbappend
@@ -3,5 +3,6 @@
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
+MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
--=20
2.25.1

