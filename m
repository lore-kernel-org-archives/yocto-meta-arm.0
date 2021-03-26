Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11804.1616762676788082637
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 05:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BF5C1476
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 05:44:35 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16B5B3F7D7
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Mar 2021 05:44:34 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/juno: move scp-firmware version from 2.6 to 2.7
Date: Fri, 26 Mar 2021 12:44:31 +0000
Message-Id: <20210326124431.3085123-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326124431.3085123-1-ross.burton@arm.com>
References: <20210326124431.3085123-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Damodar Santhapuri <damodar.santhapuri@arm.com>

Move scp-firmware version to 2.7 for juno platform

Change-Id: I7ff1132c1e6a6fee047a268da2d991f81074e672
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf                             | 2 +-
 .../recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend         | 2 --
 .../recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend         | 1 +
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/mach=
ine/juno.conf
index 0e84dd3..b5959b3 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,7 +20,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
-PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
+PREFERRED_VERSION_scp-firmware ?=3D "2.7%"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
 PREFERRED_VERSION_u-boot ?=3D "2020.07"
=20
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
index 1ddb497..0d71e55 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
@@ -2,6 +2,4 @@
=20
 MACHINE_SCP_REQUIRE ?=3D ""
=20
-MACHINE_SCP_REQUIRE_juno =3D "scp-firmware-juno.inc"
-
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
index 443c293..b419064 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
@@ -2,6 +2,7 @@
=20
 MACHINE_SCP_REQUIRE ?=3D ""
=20
+MACHINE_SCP_REQUIRE_juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
 MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
--=20
2.25.1

