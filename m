Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.20884.1605846542183171562
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2020 20:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: thomas.abraham@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC3691595;
	Thu, 19 Nov 2020 20:29:00 -0800 (PST)
Received: from usa.arm.com (a077432.blr.arm.com [10.162.4.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E24C83F719;
	Thu, 19 Nov 2020 20:28:59 -0800 (PST)
From: "Thomas Abraham" <thomas.abraham@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Vivek Gautam <vivek.gautam@arm.com>
Subject: [PATCH 2/6] arm-bsp/scp-firmware: Build SCP/MCP for rdn1edge
Date: Fri, 20 Nov 2020 09:58:40 +0530
Message-Id: <20201120042844.21915-2-thomas.abraham@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120042844.21915-1-thomas.abraham@arm.com>
References: <20201120042844.21915-1-thomas.abraham@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Vivek Gautam <vivek.gautam@arm.com>

Add bbappend recipe to build SCP and MCP firmware for the rdn1edge
platform. In addition to this, add machine conf to add image
dependency for SCP-firmware components.

Change-Id: I2b64216d18ce4c28d7a720fffd638ca3be06d8d1
Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 meta-arm-bsp/conf/machine/rdn1edge.conf          |  3 +++
 .../scp-firmware/scp-firmware-rdn1edge.inc       | 16 ++++++++++++++++
 .../scp-firmware/scp-firmware_%.bbappend         |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rd=
n1edge.inc

diff --git a/meta-arm-bsp/conf/machine/rdn1edge.conf b/meta-arm-bsp/conf/=
machine/rdn1edge.conf
index 088e09d..47d1d05 100644
--- a/meta-arm-bsp/conf/machine/rdn1edge.conf
+++ b/meta-arm-bsp/conf/machine/rdn1edge.conf
@@ -5,3 +5,6 @@
 #@DESCRIPTION: Machine configuration for RD-N1-Edge
=20
 require conf/machine/include/tune-neoversen1.inc
+
+#include SCP/MCP firmware
+EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdn1edge.=
inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdn1edge.inc
new file mode 100644
index 0000000..aba8409
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-rdn1edge.inc
@@ -0,0 +1,16 @@
+# RD-N1-Edge specific SCP configurations and build instructions
+
+#it=E2=80=99s a tested tag post-2.6.0
+SRCREV    =3D "3e99f94ad195ab902a50d0368c80810ec10f0e42"
+SCP_PLATFORM  =3D "rdn1e1"
+
+COMPATIBLE_MACHINE_rdn1edge =3D "rdn1edge"
+
+do_install() {
+    install -d ${D}/firmware
+    install -D "${B}/product/${SCP_PLATFORM}/scp_romfw/${SCP_BUILD_STR}/=
bin/scp_romfw.bin" "${D}/firmware/"
+    install -D "${B}/product/${SCP_PLATFORM}/scp_ramfw/${SCP_BUILD_STR}/=
bin/scp_ramfw.bin" "${D}/firmware/"
+    install -D "${B}/product/${SCP_PLATFORM}/mcp_romfw/${SCP_BUILD_STR}/=
bin/mcp_romfw.bin" "${D}/firmware/"
+}
+
+PV =3D "2.6.0+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappen=
d b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 8a68704..9e1b20d 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -6,6 +6,7 @@ MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
 MACHINE_SCP_REQUIRE_juno =3D "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
+MACHINE_SCP_REQUIRE_rdn1edge =3D "scp-firmware-rdn1edge.inc"
 MACHINE_SCP_REQUIRE_corstone700 =3D "scp-firmware-corstone700.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
--=20
2.17.1

