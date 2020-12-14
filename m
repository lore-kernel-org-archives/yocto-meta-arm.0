Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.2446.1607988295887239932
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 15:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A1A81FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:55 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE8DA3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 15:24:54 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm-bsp: update SCP for SGI575
Date: Mon, 14 Dec 2020 18:24:41 -0500
Message-Id: <20201214232442.4371-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201214232442.4371-1-jon.mason@arm.com>
References: <20201214232442.4371-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Update SGI575 SCP from using a non-standard, post 2.6 release version of
SCP to using the generic v2.7 recipe.

Change-Id: I31945afbb16ce65b4f87130c6b85f12c89b8713c
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf                       | 2 --
 .../recipes-bsp/scp-firmware/scp-firmware-sgi575.inc        | 6 ------
 .../recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend     | 1 -
 .../recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend     | 1 +
 4 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index ef74d1f..1b1001f 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -14,8 +14,6 @@ PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
=20
-PREFERRED_VERSION_scp-firmware ?=3D "2.6%"
-
 # Use kernel provided by linaro
 KERNEL_IMAGETYPE ?=3D "Image"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.in=
c b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
index 158f481..a2dab3b 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
@@ -1,7 +1,5 @@
 # SGI575 specific SCP configurations and build instructions
=20
-#it=E2=80=99s a tested tag post-2.6.0
-SRCREV    =3D "7a025658d8318e95dbab4259a8ff7834ae6d8061"
 SCP_PLATFORM  =3D "sgi575"
 SCP_LOG_LEVEL =3D "INFO"
=20
@@ -13,7 +11,3 @@ do_install() {
     install -D "${B}/product/${SCP_PLATFORM}/scp_ramfw/release/bin/scp_r=
amfw.bin" "${D}/firmware/"
     install -D "${B}/product/${SCP_PLATFORM}/mcp_romfw/release/bin/mcp_r=
omfw.bin" "${D}/firmware/"
 }
-
-
-PV =3D "2.6.0+git${SRCPV}"
-
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
index 06b236b..627689f 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
@@ -4,6 +4,5 @@ MACHINE_SCP_REQUIRE ?=3D ""
=20
 MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
 MACHINE_SCP_REQUIRE_juno =3D "scp-firmware-juno.inc"
-MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbap=
pend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
index 53bd022..9cbdcb6 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
@@ -3,5 +3,6 @@
 MACHINE_SCP_REQUIRE ?=3D ""
=20
 MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
+MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
--=20
2.17.1

