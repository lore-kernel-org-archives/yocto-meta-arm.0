Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6865.1607425346918648169
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 03:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 988FB1FB
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Dec 2020 03:02:25 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4161A3F68F
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Dec 2020 03:02:25 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/scp-firmware: Update N1SDP SCP firmware to 2.7.0
Date: Tue,  8 Dec 2020 11:02:21 +0000
Message-Id: <20201208110222.1700149-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Khasim Syed Mohammed <khasim.mohammed@arm.com>

SCP firmware recipes are updated to build SCP firmware version 2.7.0 for =
N1SDP

Change-Id: Ic42fac178cf4ac9e87127e9b6258c9bd15101906
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                       | 2 +-
 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc        | 3 ---
 .../recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend    | 1 -
 .../recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend    | 7 +++++++
 4 files changed, 8 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.=
7%.bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
index 1f11acd..441d8c6 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -31,7 +31,7 @@ PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
=20
-PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
+PREFERRED_VERSION_scp-firmware ?=3D "2.7%"
=20
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc=
 b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index efa3acb..635ec39 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -1,6 +1,5 @@
 # N1SDP specific SCP configurations and build instructions
=20
-SRCREV        =3D "350be71a2ecef588b8ff5a095a0840de23506e45"
 SCP_PLATFORM  =3D "n1sdp"
 SCP_LOG_LEVEL =3D "INFO"
=20
@@ -12,8 +11,6 @@ SRC_URI_append =3D " \
=20
 COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
=20
-PV =3D "2.6.0+git${SRCPV}"
-
 DEPENDS +=3D "fiptool-native"
 DEPENDS +=3D "virtual/trusted-firmware-a"
=20
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
index b760ba7..06b236b 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
@@ -2,7 +2,6 @@
=20
 MACHINE_SCP_REQUIRE ?=3D ""
=20
-MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
 MACHINE_SCP_REQUIRE_juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
new file mode 100644
index 0000000..53bd022
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
@@ -0,0 +1,7 @@
+# Include machine specific SCP configurations
+
+MACHINE_SCP_REQUIRE ?=3D ""
+
+MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
+
+require ${MACHINE_SCP_REQUIRE}
--=20
2.25.1

