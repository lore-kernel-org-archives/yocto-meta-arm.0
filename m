Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2124.1608312870343227868
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD52A30E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:29 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF923F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:29 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm-bsp/musca: remove trusted-firmware-m statements
Date: Fri, 18 Dec 2020 17:34:21 +0000
Message-Id: <20201218173427.1225026-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Musca doesn't build 'images' in the traditional sense yet, just
trusted-firmware-m or Zephyr, so remove EXTRA_IMAGEDEPENDS.

Remove the preferred version for TF-M as we only ship one currently.

Change-Id: I2fbd1230f6ba7a49aa093ca90fc38e676ba14633
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 3 ---
 meta-arm-bsp/conf/machine/musca-s1.conf | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/=
machine/musca-b1.conf
index 5b359bc..ac0bea0 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -4,9 +4,6 @@
 #@NAME: Musca-B1 machine
 #@DESCRIPTION: Machine configuration for Musca-B1
=20
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-m"
-PREFERRED_VERSION_trusted-firmware-m =3D "1.0"
-
 DEFAULTTUNE ?=3D "armv8m-main"
 require conf/machine/include/tune-cortexm33.inc
=20
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/=
machine/musca-s1.conf
index 66e0a35..2dcdb50 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -4,9 +4,6 @@
 #@NAME: Musca-S1 machine
 #@DESCRIPTION: Machine configuration for Musca-S1
=20
-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-m"
-PREFERRED_VERSION_trusted-firmware-m =3D "1.0"
-
 require conf/machine/include/tune-cortexm33.inc
=20
 # GLIBC will not work with Cortex-M.
--=20
2.25.1

