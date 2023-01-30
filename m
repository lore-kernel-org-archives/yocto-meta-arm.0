Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0500C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 11:24:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38539.1675077871101819243
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 03:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1A8616F8
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 03:25:12 -0800 (PST)
Received: from jdm-VirtualBox.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E4673F71E
	for <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 03:24:30 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/juno: update kernel patches for 6.1
Date: Mon, 30 Jan 2023 06:24:24 -0500
Message-Id: <20230130112425.784450-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130112425.784450-1-jon.mason@arm.com>
References: <20230130112425.784450-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 11:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4338

Update kernel patches and configs for the v6.1 kernel.  Previously, it
was using the linux defconfig as a starting point.  It is now using the
local kernel metadata.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../bsp/arm-platforms/juno.scc                |  1 +
 .../bsp/arm-platforms/juno/juno-board.cfg     |  5 +-
 .../bsp/arm-platforms/juno/juno-net.cfg       |  1 +
 .../bsp/arm-platforms/juno/juno-pci.cfg       |  1 +
 .../bsp/arm-platforms/juno/juno-sata.cfg      |  1 -
 .../bsp/arm-platforms/juno/juno-thermal.cfg   |  3 +
 ...cache-properties-for-Arm-Ltd-platfo.patch} |  5 +-
 ...uno-Add-thermal-critical-trip-points.patch | 60 -------------------
 ...4-dts-fvp-Add-SPE-to-Foundation-FVP.patch} |  5 +-
 ...-information-about-L1-and-L2-caches.patch} |  5 +-
 ...-align-LED-node-names-with-dtschema.patch} |  5 +-
 .../linux/linux-arm-platforms.inc             | 13 ++--
 12 files changed, 19 insertions(+), 86 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/files/juno/{0002-arm64-dts-Upda=
te-cache-properties-for-Arm-Ltd-platfo.patch =3D> 0001-arm64-dts-Update-c=
ache-properties-for-Arm-Ltd-platfo.patch} (98%)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm=
64-dts-juno-Add-thermal-critical-trip-points.patch
 rename meta-arm-bsp/recipes-kernel/linux/files/juno/{0003-arm64-dts-fvp-=
Add-SPE-to-Foundation-FVP.patch =3D> 0002-arm64-dts-fvp-Add-SPE-to-Founda=
tion-FVP.patch} (93%)
 rename meta-arm-bsp/recipes-kernel/linux/files/juno/{0004-arm64-dts-fvp-=
Add-information-about-L1-and-L2-caches.patch =3D> 0003-arm64-dts-fvp-Add-=
information-about-L1-and-L2-caches.patch} (98%)
 rename meta-arm-bsp/recipes-kernel/linux/files/juno/{0005-ARM-dts-vexpre=
ss-align-LED-node-names-with-dtschema.patch =3D> 0004-ARM-dts-vexpress-al=
ign-LED-node-names-with-dtschema.patch} (96%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-km=
eta/bsp/arm-platforms/juno.scc
index 240ecf5e..a167d225 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno.scc
@@ -1,5 +1,6 @@
 include features/input/input.scc
 include features/net/net.scc
+include features/usb/usb-base.scc
 include features/bluetooth/bluetooth.scc
 include cfg/timer/no_hz.scc
 include cfg/usb-mass-storage.scc
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-board.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg
index 654efa45..2d7ad8c4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-board.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-board.cfg
@@ -13,7 +13,9 @@ CONFIG_MAILBOX=3Dy
 CONFIG_ARM_MHU=3Dy
=20
 # SCMI support
+CONFIG_HWMON=3Dy
 CONFIG_ARM_SCMI_PROTOCOL=3Dy
+CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=3Dy
 CONFIG_ARM_SCMI_POWER_DOMAIN=3Dy
 CONFIG_SENSORS_ARM_SCMI=3Dy
 CONFIG_COMMON_CLK_SCMI=3Dy
@@ -28,7 +30,6 @@ CONFIG_REGULATOR=3Dy
 CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
=20
 CONFIG_CPU_IDLE=3Dy
-CONFIG_ARM_CPUIDLE=3Dy
=20
 CONFIG_CPU_FREQ=3Dy
 CONFIG_ARM_SCPI_CPUFREQ=3Dy
@@ -38,4 +39,4 @@ CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
 CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
=20
 CONFIG_CONNECTOR=3Dy
-CONFIG_ARM_TIMER_SP804=3Dy
+CONFIG_PRINTK_TIME=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-net.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/juno/juno-net.cfg
index 54e3686d..20cc408f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-net.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-net.cfg
@@ -1,2 +1,3 @@
+CONFIG_NET_VENDOR_SMSC=3Dy
 CONFIG_SMSC911X=3Dy
 CONFIG_SMC91X=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-pci.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pla=
tforms-kmeta/bsp/arm-platforms/juno/juno-pci.cfg
index 295d190d..ec919e39 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-pci.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-pci.cfg
@@ -1,4 +1,5 @@
 CONFIG_PCI=3Dy
+CONFIG_PCI_IOV=3Dy
 CONFIG_PCI_MSI=3Dy
 CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
 CONFIG_PCI_PRI=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-sata.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-pl=
atforms-kmeta/bsp/arm-platforms/juno/juno-sata.cfg
index a159af8f..179d7b8f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-sata.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-sata.cfg
@@ -1,3 +1,2 @@
 CONFIG_ATA=3Dy
 CONFIG_SATA_SIL24=3Dy
-CONFIG_SKY2=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/juno/juno-thermal.cfg b/meta-arm-bsp/recipes-kernel/linux/arm=
-platforms-kmeta/bsp/arm-platforms/juno/juno-thermal.cfg
index 6241374a..f4d220e0 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-thermal.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/juno/juno-thermal.cfg
@@ -1,4 +1,7 @@
 CONFIG_THERMAL=3Dy
+CONFIG_THERMAL_OF=3Dy
+CONFIG_ENERGY_MODEL=3Dy
+CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
 CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
 CONFIG_THERMAL_GOV_USER_SPACE=3Dy
 CONFIG_CPU_THERMAL=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-=
Update-cache-properties-for-Arm-Ltd-platfo.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0001-arm64-dts-Update-cache-properties-for-Arm-Ltd=
-platfo.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-U=
pdate-cache-properties-for-Arm-Ltd-platfo.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-Upd=
ate-cache-properties-for-Arm-Ltd-platfo.patch
index f19fb8b9..329c939f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-Update-=
cache-properties-for-Arm-Ltd-platfo.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-Update-=
cache-properties-for-Arm-Ltd-platfo.patch
@@ -1,4 +1,4 @@
-From 59fb813f9742b349f48250bd7793279cafe2752c Mon Sep 17 00:00:00 2001
+From dc250cab31c6611cc7fa76bc8b2027dbd56dd65d Mon Sep 17 00:00:00 2001
 From: Pierre Gondois <pierre.gondois@arm.com>
 Date: Mon, 7 Nov 2022 16:56:58 +0100
 Subject: [PATCH] arm64: dts: Update cache properties for Arm Ltd platfor=
ms
@@ -136,6 +136,3 @@ index 5b6d9d8e934d..796cd7d02eb5 100644
  		};
  	};
 =20
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-=
juno-Add-thermal-critical-trip-points.patch b/meta-arm-bsp/recipes-kernel=
/linux/files/juno/0001-arm64-dts-juno-Add-thermal-critical-trip-points.pa=
tch
deleted file mode 100644
index 1c0f25eb..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-juno-Ad=
d-thermal-critical-trip-points.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From c4a7b9b587ca1bb4678d48d8be7132492b23a81c Mon Sep 17 00:00:00 2001
-From: Cristian Marussi <cristian.marussi@arm.com>
-Date: Fri, 28 Oct 2022 15:08:33 +0100
-Subject: [PATCH] arm64: dts: juno: Add thermal critical trip points
-
-When thermnal zones are defined, trip points definitions are mandatory.
-Define a couple of critical trip points for monitoring of existing
-PMIC and SOC thermal zones.
-
-This was lost between txt to yaml conversion and was re-enforced recentl=
y
-via the commit 8c596324232d ("dt-bindings: thermal: Fix missing required=
 property")
-
-Cc: Rob Herring <robh+dt@kernel.org>
-Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
-Cc: devicetree@vger.kernel.org
-Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
-Fixes: f7b636a8d83c ("arm64: dts: juno: add thermal zones for scpi senso=
rs")
-Link: https://lore.kernel.org/r/20221028140833.280091-8-cristian.marussi=
@arm.com
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Backport
----
- arch/arm64/boot/dts/arm/juno-base.dtsi | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dt=
s/arm/juno-base.dtsi
-index 2f27619d8abd..8b4d280b1e7e 100644
---- a/arch/arm64/boot/dts/arm/juno-base.dtsi
-+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
-@@ -751,12 +751,26 @@ pmic {
- 			polling-delay =3D <1000>;
- 			polling-delay-passive =3D <100>;
- 			thermal-sensors =3D <&scpi_sensors0 0>;
-+			trips {
-+				pmic_crit0: trip0 {
-+					temperature =3D <90000>;
-+					hysteresis =3D <2000>;
-+					type =3D "critical";
-+				};
-+			};
- 		};
-=20
- 		soc {
- 			polling-delay =3D <1000>;
- 			polling-delay-passive =3D <100>;
- 			thermal-sensors =3D <&scpi_sensors0 3>;
-+			trips {
-+				soc_crit0: trip0 {
-+					temperature =3D <80000>;
-+					hysteresis =3D <2000>;
-+					type =3D "critical";
-+				};
-+			};
- 		};
-=20
- 		big_cluster_thermal_zone: big-cluster {
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-=
fvp-Add-SPE-to-Foundation-FVP.patch b/meta-arm-bsp/recipes-kernel/linux/f=
iles/juno/0002-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch
similarity index 93%
rename from meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-f=
vp-Add-SPE-to-Foundation-FVP.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-fvp=
-Add-SPE-to-Foundation-FVP.patch
index 34dd0251..4495f397 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp-Add=
-SPE-to-Foundation-FVP.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-fvp-Add=
-SPE-to-Foundation-FVP.patch
@@ -1,4 +1,4 @@
-From 3bd7a0219082c2c91570b81afc35f2aec57cade2 Mon Sep 17 00:00:00 2001
+From bd354219987dddbf8ab6fd11450b4046547aca1b Mon Sep 17 00:00:00 2001
 From: James Clark <james.clark@arm.com>
 Date: Thu, 17 Nov 2022 10:25:36 +0000
 Subject: [PATCH] arm64: dts: fvp: Add SPE to Foundation FVP
@@ -33,6 +33,3 @@ index c8bd23b1a7ba..029578072d8f 100644
  	watchdog@2a440000 {
  		compatible =3D "arm,sbsa-gwdt";
  		reg =3D <0x0 0x2a440000 0 0x1000>,
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-arm64-dts-=
fvp-Add-information-about-L1-and-L2-caches.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0003-arm64-dts-fvp-Add-information-about-L1-and-L2=
-caches.patch
similarity index 98%
rename from meta-arm-bsp/recipes-kernel/linux/files/juno/0004-arm64-dts-f=
vp-Add-information-about-L1-and-L2-caches.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp=
-Add-information-about-L1-and-L2-caches.patch
index 72f7161f..fc027510 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-arm64-dts-fvp-Add=
-information-about-L1-and-L2-caches.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp-Add=
-information-about-L1-and-L2-caches.patch
@@ -1,4 +1,4 @@
-From b2d5025e129289d9b914c696646e64495a7453c0 Mon Sep 17 00:00:00 2001
+From 22e740d069e14875a64864bf86e0826a96560b44 Mon Sep 17 00:00:00 2001
 From: Sudeep Holla <sudeep.holla@arm.com>
 Date: Fri, 18 Nov 2022 15:10:17 +0000
 Subject: [PATCH] arm64: dts: fvp: Add information about L1 and L2 caches
@@ -144,6 +144,3 @@ index 5f6f30c801a7..60472d65a355 100644
  		};
  	};
 =20
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-ARM-dts-ve=
xpress-align-LED-node-names-with-dtschema.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/files/juno/0004-ARM-dts-vexpress-align-LED-node-names-with-dts=
chema.patch
similarity index 96%
rename from meta-arm-bsp/recipes-kernel/linux/files/juno/0005-ARM-dts-vex=
press-align-LED-node-names-with-dtschema.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/juno/0004-ARM-dts-vexpr=
ess-align-LED-node-names-with-dtschema.patch
index c5512508..e3828ec9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-ARM-dts-vexpress-=
align-LED-node-names-with-dtschema.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-ARM-dts-vexpress-=
align-LED-node-names-with-dtschema.patch
@@ -1,4 +1,4 @@
-From e15031539490733279c41ba87f4ef2b440a685f5 Mon Sep 17 00:00:00 2001
+From 4edb625e2256d5761312110e34cbc0164915d772 Mon Sep 17 00:00:00 2001
 From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 Date: Fri, 25 Nov 2022 15:41:12 +0100
 Subject: [PATCH] ARM: dts: vexpress: align LED node names with dtschema
@@ -79,6 +79,3 @@ index f434fe5cf4a1..def538ce8769 100644
  					label =3D "v2m:green:user8";
  					gpios =3D <&v2m_led_gpios 7 0>;
  					linux,default-trigger =3D "cpu5";
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4f9bcfdf..e2a36c9b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -97,15 +97,14 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " file://fvp-ba=
ser-aemv8r64.dts;subdir=3Dgit/a
 # Juno KMACHINE
 #
 COMPATIBLE_MACHINE:juno =3D "juno"
-KBUILD_DEFCONFIG:juno =3D "defconfig"
-KCONFIG_MODE:juno =3D "--alldefconfig"
+#KBUILD_DEFCONFIG:juno =3D "defconfig"
+#KCONFIG_MODE:juno =3D "--alldefconfig"
 FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATHS}"
 SRC_URI:append:juno =3D " \
-    file://0001-arm64-dts-juno-Add-thermal-critical-trip-points.patch \
-    file://0002-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.pat=
ch \
-    file://0003-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch \
-    file://0004-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.pat=
ch \
-    file://0005-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patc=
h \
+    file://0001-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.pat=
ch \
+    file://0002-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch \
+    file://0003-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.pat=
ch \
+    file://0004-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patc=
h \
     "
=20
 #
--=20
2.25.1


