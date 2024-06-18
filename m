Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255A9C2BB85
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:27:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89282.1718724455685529124
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 08:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3216DA7;
	Tue, 18 Jun 2024 08:27:59 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.30.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 837DA3F6A8;
	Tue, 18 Jun 2024 08:27:34 -0700 (PDT)
From: harsimransingh.tungal@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH v2 2/5] arm-bsp/u-boot: corstone1000: Enable secondary cores for Corstone-1000 FVP
Date: Tue, 18 Jun 2024 16:27:21 +0100
Message-Id: <20240618152724.7273-3-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
References: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 15:27:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5821

From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>

This changeset adds secondary cpu nodes for Corstone-1000 FVP dts.

Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  1 +
 ...dd-secondary-cores-cpu-nodes-for-FVP.patch | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 82049c43..7d8155d4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -64,6 +64,7 @@ SRC_URI:append =3D " \
     file://0046-Corstone1000-Change-MMCOMM-buffer-location.patch		  \
     file://0047-corstone1000-dts-add-external-system-node.patch \
     file://0048-corstone1000-Enable-UEFI-Secure-boot.patch 			  \
+    file://0049-corstone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch=
	  \
     "
=20
 do_configure:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-cor=
stone1000-Add-secondary-cores-cpu-nodes-for-FVP.patch b/meta-arm-bsp/reci=
pes-bsp/u-boot/u-boot/corstone1000/0049-corstone1000-Add-secondary-cores-=
cpu-nodes-for-FVP.patch
new file mode 100644
index 00000000..0e90f577
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0049-corstone10=
00-Add-secondary-cores-cpu-nodes-for-FVP.patch
@@ -0,0 +1,63 @@
+From 68708d6b4953f58a0484b9a83efa8318747cea80 Mon Sep 17 00:00:00 2001
+From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Date: Thu, 9 May 2024 14:16:55 +0000
+Subject: [PATCH] arm: dts: corstone1000: enable secondary cores for FVP
+
+Add the secondary cores nodes in the dts file
+
+Upstream-Status: Submitted [https://lore.kernel.org/all/20240612100421.4=
7938-1-harsimransingh.tungal@arm.com/]
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ arch/arm/dts/corstone1000-fvp.dts | 25 +++++++++++++++++++++++++
+ arch/arm/dts/corstone1000.dtsi    |  2 +-
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
+index 26b0f1b3ce..3076fb9f34 100644
+--- a/arch/arm/dts/corstone1000-fvp.dts
++++ b/arch/arm/dts/corstone1000-fvp.dts
+@@ -49,3 +49,28 @@
+ 		clock-names =3D "smclk", "apb_pclk";
+ 	};
+ };
++
++&cpus {
++	cpu1: cpu@1 {
++		device_type =3D "cpu";
++		compatible =3D "arm,cortex-a35";
++		reg =3D <0x1>;
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++	cpu2: cpu@2 {
++		device_type =3D "cpu";
++		compatible =3D "arm,cortex-a35";
++		reg =3D <0x2>;
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++	cpu3: cpu@3 {
++		device_type =3D "cpu";
++		compatible =3D "arm,cortex-a35";
++		reg =3D <0x3>;
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++};
++
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
+index 1e0ec075e4..5d9d95b21c 100644
+--- a/arch/arm/dts/corstone1000.dtsi
++++ b/arch/arm/dts/corstone1000.dtsi
+@@ -21,7 +21,7 @@
+ 		stdout-path =3D "serial0:115200n8";
+ 	};
+=20
+-	cpus {
++	cpus: cpus {
+ 		#address-cells =3D <1>;
+ 		#size-cells =3D <0>;
+=20
+--=20
+2.25.1
+
--=20
2.25.1


