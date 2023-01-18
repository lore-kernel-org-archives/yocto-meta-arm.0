Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4586C38147
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:54:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19246.1674057253290861720
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 07:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1761D169C
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:54:55 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B57583F67D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:54:12 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/juno: Update kernel patches to the latest
Date: Wed, 18 Jan 2023 10:54:06 -0500
Message-Id: <20230118155406.30116-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230118155406.30116-1-jon.mason@arm.com>
References: <20230118155406.30116-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 15:54:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4297

Pulling in the latest juno kernel patches from
https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...uno-Add-thermal-critical-trip-points.patch |  60 +++++++
 ...-cache-properties-for-Arm-Ltd-platfo.patch | 141 +++++++++++++++++
 ...64-dts-fvp-Add-SPE-to-Foundation-FVP.patch |  38 +++++
 ...d-information-about-L1-and-L2-caches.patch | 149 ++++++++++++++++++
 ...s-align-LED-node-names-with-dtschema.patch |  84 ++++++++++
 .../linux/linux-arm-platforms.inc             |   7 +
 6 files changed, 479 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-juno-Add-thermal-critical-trip-points.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0004-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0005-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-juno-Add-thermal-critical-trip-points.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-juno-Add-thermal-critical-trip-points.patch
new file mode 100644
index 00000000..1c0f25eb
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-juno-Add-thermal-critical-trip-points.patch
@@ -0,0 +1,60 @@
+From c4a7b9b587ca1bb4678d48d8be7132492b23a81c Mon Sep 17 00:00:00 2001
+From: Cristian Marussi <cristian.marussi@arm.com>
+Date: Fri, 28 Oct 2022 15:08:33 +0100
+Subject: [PATCH] arm64: dts: juno: Add thermal critical trip points
+
+When thermnal zones are defined, trip points definitions are mandatory.
+Define a couple of critical trip points for monitoring of existing
+PMIC and SOC thermal zones.
+
+This was lost between txt to yaml conversion and was re-enforced recently
+via the commit 8c596324232d ("dt-bindings: thermal: Fix missing required property")
+
+Cc: Rob Herring <robh+dt@kernel.org>
+Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
+Cc: devicetree@vger.kernel.org
+Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
+Fixes: f7b636a8d83c ("arm64: dts: juno: add thermal zones for scpi sensors")
+Link: https://lore.kernel.org/r/20221028140833.280091-8-cristian.marussi@arm.com
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Backport
+---
+ arch/arm64/boot/dts/arm/juno-base.dtsi | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
+index 2f27619d8abd..8b4d280b1e7e 100644
+--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
++++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
+@@ -751,12 +751,26 @@ pmic {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+ 			thermal-sensors = <&scpi_sensors0 0>;
++			trips {
++				pmic_crit0: trip0 {
++					temperature = <90000>;
++					hysteresis = <2000>;
++					type = "critical";
++				};
++			};
+ 		};
+ 
+ 		soc {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+ 			thermal-sensors = <&scpi_sensors0 3>;
++			trips {
++				soc_crit0: trip0 {
++					temperature = <80000>;
++					hysteresis = <2000>;
++					type = "critical";
++				};
++			};
+ 		};
+ 
+ 		big_cluster_thermal_zone: big-cluster {
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.patch
new file mode 100644
index 00000000..f19fb8b9
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.patch
@@ -0,0 +1,141 @@
+From 59fb813f9742b349f48250bd7793279cafe2752c Mon Sep 17 00:00:00 2001
+From: Pierre Gondois <pierre.gondois@arm.com>
+Date: Mon, 7 Nov 2022 16:56:58 +0100
+Subject: [PATCH] arm64: dts: Update cache properties for Arm Ltd platforms
+
+The DeviceTree Specification v0.3 specifies that the cache node
+"compatible" and "cache-level" properties are required.
+
+Cf. s3.8 Multi-level and Shared Cache Nodes
+The 'cache-unified' property should be present if one of the properties
+for unified cache is present ('cache-size', ...).
+
+Update the relevant device trees nodes accordingly.
+
+Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
+Link: https://lore.kernel.org/r/20221107155825.1644604-6-pierre.gondois@arm.com
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Backport
+---
+ arch/arm64/boot/dts/arm/corstone1000.dtsi            | 1 +
+ arch/arm64/boot/dts/arm/foundation-v8.dtsi           | 1 +
+ arch/arm64/boot/dts/arm/juno-r1.dts                  | 2 ++
+ arch/arm64/boot/dts/arm/juno-r2.dts                  | 2 ++
+ arch/arm64/boot/dts/arm/juno.dts                     | 2 ++
+ arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts           | 1 +
+ arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts | 1 +
+ 7 files changed, 10 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot/dts/arm/corstone1000.dtsi
+index 4e46826f883a..21f1f952e985 100644
+--- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
++++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
+@@ -53,6 +53,7 @@ gic: interrupt-controller@1c000000 {
+ 
+ 	L2_0: l2-cache0 {
+ 		compatible = "cache";
++		cache-unified;
+ 		cache-level = <2>;
+ 		cache-size = <0x80000>;
+ 		cache-line-size = <64>;
+diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+index 83e3e7e3984f..c8bd23b1a7ba 100644
+--- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
++++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+@@ -58,6 +58,7 @@ cpu3: cpu@3 {
+ 
+ 		L2_0: l2-cache0 {
+ 			compatible = "cache";
++			cache-level = <2>;
+ 		};
+ 	};
+ 
+diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
+index 6451c62146fd..1d90eeebb37d 100644
+--- a/arch/arm64/boot/dts/arm/juno-r1.dts
++++ b/arch/arm64/boot/dts/arm/juno-r1.dts
+@@ -189,6 +189,7 @@ A53_3: cpu@103 {
+ 
+ 		A57_L2: l2-cache0 {
+ 			compatible = "cache";
++			cache-unified;
+ 			cache-size = <0x200000>;
+ 			cache-line-size = <64>;
+ 			cache-sets = <2048>;
+@@ -197,6 +198,7 @@ A57_L2: l2-cache0 {
+ 
+ 		A53_L2: l2-cache1 {
+ 			compatible = "cache";
++			cache-unified;
+ 			cache-size = <0x100000>;
+ 			cache-line-size = <64>;
+ 			cache-sets = <1024>;
+diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
+index 438cd1ff4bd0..d2ada69b0a43 100644
+--- a/arch/arm64/boot/dts/arm/juno-r2.dts
++++ b/arch/arm64/boot/dts/arm/juno-r2.dts
+@@ -195,6 +195,7 @@ A53_3: cpu@103 {
+ 
+ 		A72_L2: l2-cache0 {
+ 			compatible = "cache";
++			cache-unified;
+ 			cache-size = <0x200000>;
+ 			cache-line-size = <64>;
+ 			cache-sets = <2048>;
+@@ -203,6 +204,7 @@ A72_L2: l2-cache0 {
+ 
+ 		A53_L2: l2-cache1 {
+ 			compatible = "cache";
++			cache-unified;
+ 			cache-size = <0x100000>;
+ 			cache-line-size = <64>;
+ 			cache-sets = <1024>;
+diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
+index cf4a58211399..5e48a01a5b9f 100644
+--- a/arch/arm64/boot/dts/arm/juno.dts
++++ b/arch/arm64/boot/dts/arm/juno.dts
+@@ -194,6 +194,7 @@ A53_3: cpu@103 {
+ 
+ 		A57_L2: l2-cache0 {
+ 			compatible = "cache";
++			cache-unified;
+ 			cache-size = <0x200000>;
+ 			cache-line-size = <64>;
+ 			cache-sets = <2048>;
+@@ -202,6 +203,7 @@ A57_L2: l2-cache0 {
+ 
+ 		A53_L2: l2-cache1 {
+ 			compatible = "cache";
++			cache-unified;
+ 			cache-size = <0x100000>;
+ 			cache-line-size = <64>;
+ 			cache-sets = <1024>;
+diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
+index 258991ad7cc0..ef68f5aae7dd 100644
+--- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
++++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
+@@ -71,6 +71,7 @@ cpu@3 {
+ 
+ 		L2_0: l2-cache0 {
+ 			compatible = "cache";
++			cache-level = <2>;
+ 		};
+ 	};
+ 
+diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
+index 5b6d9d8e934d..796cd7d02eb5 100644
+--- a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
++++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
+@@ -57,6 +57,7 @@ cpu@1 {
+ 
+ 		L2_0: l2-cache0 {
+ 			compatible = "cache";
++			cache-level = <2>;
+ 		};
+ 	};
+ 
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch
new file mode 100644
index 00000000..34dd0251
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch
@@ -0,0 +1,38 @@
+From 3bd7a0219082c2c91570b81afc35f2aec57cade2 Mon Sep 17 00:00:00 2001
+From: James Clark <james.clark@arm.com>
+Date: Thu, 17 Nov 2022 10:25:36 +0000
+Subject: [PATCH] arm64: dts: fvp: Add SPE to Foundation FVP
+
+Add SPE DT node to FVP model. If the model doesn't support SPE (e.g.,
+turned off via parameter), the driver will skip the initialisation
+accordingly and thus is safe.
+
+Signed-off-by: James Clark <james.clark@arm.com>
+Link: https://lore.kernel.org/r/20221117102536.237515-1-james.clark@arm.com
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Backport
+---
+ arch/arm64/boot/dts/arm/foundation-v8.dtsi | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+index c8bd23b1a7ba..029578072d8f 100644
+--- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
++++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+@@ -85,6 +85,11 @@ pmu {
+ 			     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+ 	};
+ 
++	spe-pmu {
++		compatible = "arm,statistical-profiling-extension-v1";
++		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
++	};
++
+ 	watchdog@2a440000 {
+ 		compatible = "arm,sbsa-gwdt";
+ 		reg = <0x0 0x2a440000 0 0x1000>,
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.patch
new file mode 100644
index 00000000..72f7161f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.patch
@@ -0,0 +1,149 @@
+From b2d5025e129289d9b914c696646e64495a7453c0 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 18 Nov 2022 15:10:17 +0000
+Subject: [PATCH] arm64: dts: fvp: Add information about L1 and L2 caches
+
+Add the information about L1 and L2 caches on FVP RevC platform.
+Though the cache size is configurable through the model parameters,
+having default values in the device tree helps to exercise and debug
+any code utilising the cache information without the need of real
+hardware.
+
+Link: https://lore.kernel.org/r/20221118151017.704716-1-sudeep.holla@arm.com
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Backport
+---
+ arch/arm64/boot/dts/arm/fvp-base-revc.dts | 73 +++++++++++++++++++++++
+ 1 file changed, 73 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+index 5f6f30c801a7..60472d65a355 100644
+--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
++++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+@@ -47,48 +47,121 @@ cpu0: cpu@0 {
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x000>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C0_L2>;
+ 		};
+ 		cpu1: cpu@100 {
+ 			device_type = "cpu";
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x100>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C0_L2>;
+ 		};
+ 		cpu2: cpu@200 {
+ 			device_type = "cpu";
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x200>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C0_L2>;
+ 		};
+ 		cpu3: cpu@300 {
+ 			device_type = "cpu";
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x300>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C0_L2>;
+ 		};
+ 		cpu4: cpu@10000 {
+ 			device_type = "cpu";
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x10000>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C1_L2>;
+ 		};
+ 		cpu5: cpu@10100 {
+ 			device_type = "cpu";
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x10100>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C1_L2>;
+ 		};
+ 		cpu6: cpu@10200 {
+ 			device_type = "cpu";
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x10200>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C1_L2>;
+ 		};
+ 		cpu7: cpu@10300 {
+ 			device_type = "cpu";
+ 			compatible = "arm,armv8";
+ 			reg = <0x0 0x10300>;
+ 			enable-method = "psci";
++			i-cache-size = <0x8000>;
++			i-cache-line-size = <64>;
++			i-cache-sets = <256>;
++			d-cache-size = <0x8000>;
++			d-cache-line-size = <64>;
++			d-cache-sets = <256>;
++			next-level-cache = <&C1_L2>;
++		};
++		C0_L2: l2-cache0 {
++			compatible = "cache";
++			cache-size = <0x80000>;
++			cache-line-size = <64>;
++			cache-sets = <512>;
++			cache-level = <2>;
++			cache-unified;
++		};
++
++		C1_L2: l2-cache1 {
++			compatible = "cache";
++			cache-size = <0x80000>;
++			cache-line-size = <64>;
++			cache-sets = <512>;
++			cache-level = <2>;
++			cache-unified;
+ 		};
+ 	};
+ 
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patch
new file mode 100644
index 00000000..c5512508
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patch
@@ -0,0 +1,84 @@
+From e15031539490733279c41ba87f4ef2b440a685f5 Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+Date: Fri, 25 Nov 2022 15:41:12 +0100
+Subject: [PATCH] ARM: dts: vexpress: align LED node names with dtschema
+
+The node names should be generic and DT schema expects certain pattern.
+
+  vexpress-v2p-ca9.dtb: leds: 'user1', 'user2', 'user3', 'user4', 'user5', 'user6', 'user7', 'user8' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
+
+Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+Link: https://lore.kernel.org/r/20221125144112.476817-1-krzysztof.kozlowski@linaro.org
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Backport
+---
+ arch/arm/boot/dts/vexpress-v2m.dtsi | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/arch/arm/boot/dts/vexpress-v2m.dtsi b/arch/arm/boot/dts/vexpress-v2m.dtsi
+index f434fe5cf4a1..def538ce8769 100644
+--- a/arch/arm/boot/dts/vexpress-v2m.dtsi
++++ b/arch/arm/boot/dts/vexpress-v2m.dtsi
+@@ -383,49 +383,49 @@ v2m_refclk32khz: refclk32khz {
+ 			leds {
+ 				compatible = "gpio-leds";
+ 
+-				user1 {
++				led-user1 {
+ 					label = "v2m:green:user1";
+ 					gpios = <&v2m_led_gpios 0 0>;
+ 					linux,default-trigger = "heartbeat";
+ 				};
+ 
+-				user2 {
++				led-user2 {
+ 					label = "v2m:green:user2";
+ 					gpios = <&v2m_led_gpios 1 0>;
+ 					linux,default-trigger = "mmc0";
+ 				};
+ 
+-				user3 {
++				led-user3 {
+ 					label = "v2m:green:user3";
+ 					gpios = <&v2m_led_gpios 2 0>;
+ 					linux,default-trigger = "cpu0";
+ 				};
+ 
+-				user4 {
++				led-user4 {
+ 					label = "v2m:green:user4";
+ 					gpios = <&v2m_led_gpios 3 0>;
+ 					linux,default-trigger = "cpu1";
+ 				};
+ 
+-				user5 {
++				led-user5 {
+ 					label = "v2m:green:user5";
+ 					gpios = <&v2m_led_gpios 4 0>;
+ 					linux,default-trigger = "cpu2";
+ 				};
+ 
+-				user6 {
++				led-user6 {
+ 					label = "v2m:green:user6";
+ 					gpios = <&v2m_led_gpios 5 0>;
+ 					linux,default-trigger = "cpu3";
+ 				};
+ 
+-				user7 {
++				led-user7 {
+ 					label = "v2m:green:user7";
+ 					gpios = <&v2m_led_gpios 6 0>;
+ 					linux,default-trigger = "cpu4";
+ 				};
+ 
+-				user8 {
++				led-user8 {
+ 					label = "v2m:green:user8";
+ 					gpios = <&v2m_led_gpios 7 0>;
+ 					linux,default-trigger = "cpu5";
+-- 
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index df906107..4f9bcfdf 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -100,6 +100,13 @@ COMPATIBLE_MACHINE:juno = "juno"
 KBUILD_DEFCONFIG:juno = "defconfig"
 KCONFIG_MODE:juno = "--alldefconfig"
 FILESEXTRAPATHS:prepend:juno := "${ARMBSPFILESPATHS}"
+SRC_URI:append:juno = " \
+    file://0001-arm64-dts-juno-Add-thermal-critical-trip-points.patch \
+    file://0002-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.patch \
+    file://0003-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch \
+    file://0004-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.patch \
+    file://0005-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patch \
+    "
 
 #
 # Musca B1/S2 can't run Linux
-- 
2.17.1


