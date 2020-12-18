Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.2044.1608312871349305698
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F12B230E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86A533F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:30 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/7] arm-bsp/trusted-firmware-m: move TFM_PLATFORM to machine configuration
Date: Fri, 18 Dec 2020 17:34:23 +0000
Message-Id: <20201218173427.1225026-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173427.1225026-1-ross.burton@arm.com>
References: <20201218173427.1225026-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now this can be easily set in the machine, do so.

Change-Id: I964c78c8e1e8f845cc2c95193c4a795e12089d1a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf                       | 2 ++
 meta-arm-bsp/conf/machine/musca-s1.conf                       | 2 ++
 .../trusted-firmware-m/trusted-firmware-m_%.bbappend          | 4 ----
 3 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m_%.bbappend

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index ac0bea0..5300b75 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -23,3 +23,5 @@ QB_MEM =3D "512k"
 ZEPHYR_BOARD =3D "v2m_musca_b1"
 ZEPHYR_INHERIT_CLASSES +=3D "zephyr-qemuboot"
 ARCH_musca-b1 =3D "arm"
+
+TFM_PLATFORM =3D "MUSCA_B1"
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/=
machine/musca-s1.conf
index 2dcdb50..c4131a8 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -8,3 +8,5 @@ require conf/machine/include/tune-cortexm33.inc
=20
 # GLIBC will not work with Cortex-M.
 TCLIBC =3D "newlib"
+
+TFM_PLATFORM =3D "MUSCA_S1"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmw=
are-m_%.bbappend
deleted file mode 100644
index d7a099e..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bb=
append
+++ /dev/null
@@ -1,4 +0,0 @@
-COMPATIBLE_MACHINE =3D "musca-b1|musca-s1"
-
-TFM_PLATFORM_musca-b1 =3D "MUSCA_B1"
-TFM_PLATFORM_musca-s1 =3D "MUSCA_S1"
--=20
2.25.1

