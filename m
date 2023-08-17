Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D65C3DA41
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:51:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.419.1692287495288632742
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 08:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A2B6D75
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 08:52:15 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B41D3F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 08:51:34 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/juno: update kernel to 6.4
Date: Thu, 17 Aug 2023 10:51:27 -0500
Message-Id: <20230817155127.3634849-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 15:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4966

Juno requires no patches to build and boot with 6.4, as the patches
present were backports.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-cache-properties-for-Arm-Ltd-platfo.patch | 138 -----------------
 ...64-dts-fvp-Add-SPE-to-Foundation-FVP.patch |  35 -----
 ...d-information-about-L1-and-L2-caches.patch | 146 ------------------
 ...s-align-LED-node-names-with-dtschema.patch |  81 ----------
 .../linux/linux-arm-platforms.inc             |   6 -
 5 files changed, 406 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm=
64-dts-Update-cache-properties-for-Arm-Ltd-platfo.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm=
64-dts-fvp-Add-SPE-to-Foundation-FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm=
64-dts-fvp-Add-information-about-L1-and-L2-caches.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0004-ARM=
-dts-vexpress-align-LED-node-names-with-dtschema.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-=
Update-cache-properties-for-Arm-Ltd-platfo.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0001-arm64-dts-Update-cache-properties-for-Arm-Ltd=
-platfo.patch
deleted file mode 100644
index 329c939f..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-arm64-dts-Update-=
cache-properties-for-Arm-Ltd-platfo.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From dc250cab31c6611cc7fa76bc8b2027dbd56dd65d Mon Sep 17 00:00:00 2001
-From: Pierre Gondois <pierre.gondois@arm.com>
-Date: Mon, 7 Nov 2022 16:56:58 +0100
-Subject: [PATCH] arm64: dts: Update cache properties for Arm Ltd platfor=
ms
-
-The DeviceTree Specification v0.3 specifies that the cache node
-"compatible" and "cache-level" properties are required.
-
-Cf. s3.8 Multi-level and Shared Cache Nodes
-The 'cache-unified' property should be present if one of the properties
-for unified cache is present ('cache-size', ...).
-
-Update the relevant device trees nodes accordingly.
-
-Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
-Link: https://lore.kernel.org/r/20221107155825.1644604-6-pierre.gondois@=
arm.com
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Backport
----
- arch/arm64/boot/dts/arm/corstone1000.dtsi            | 1 +
- arch/arm64/boot/dts/arm/foundation-v8.dtsi           | 1 +
- arch/arm64/boot/dts/arm/juno-r1.dts                  | 2 ++
- arch/arm64/boot/dts/arm/juno-r2.dts                  | 2 ++
- arch/arm64/boot/dts/arm/juno.dts                     | 2 ++
- arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts           | 1 +
- arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts | 1 +
- 7 files changed, 10 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/arm/corstone1000.dtsi b/arch/arm64/boot=
/dts/arm/corstone1000.dtsi
-index 4e46826f883a..21f1f952e985 100644
---- a/arch/arm64/boot/dts/arm/corstone1000.dtsi
-+++ b/arch/arm64/boot/dts/arm/corstone1000.dtsi
-@@ -53,6 +53,7 @@ gic: interrupt-controller@1c000000 {
-=20
- 	L2_0: l2-cache0 {
- 		compatible =3D "cache";
-+		cache-unified;
- 		cache-level =3D <2>;
- 		cache-size =3D <0x80000>;
- 		cache-line-size =3D <64>;
-diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boo=
t/dts/arm/foundation-v8.dtsi
-index 83e3e7e3984f..c8bd23b1a7ba 100644
---- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
-+++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
-@@ -58,6 +58,7 @@ cpu3: cpu@3 {
-=20
- 		L2_0: l2-cache0 {
- 			compatible =3D "cache";
-+			cache-level =3D <2>;
- 		};
- 	};
-=20
-diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/a=
rm/juno-r1.dts
-index 6451c62146fd..1d90eeebb37d 100644
---- a/arch/arm64/boot/dts/arm/juno-r1.dts
-+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
-@@ -189,6 +189,7 @@ A53_3: cpu@103 {
-=20
- 		A57_L2: l2-cache0 {
- 			compatible =3D "cache";
-+			cache-unified;
- 			cache-size =3D <0x200000>;
- 			cache-line-size =3D <64>;
- 			cache-sets =3D <2048>;
-@@ -197,6 +198,7 @@ A57_L2: l2-cache0 {
-=20
- 		A53_L2: l2-cache1 {
- 			compatible =3D "cache";
-+			cache-unified;
- 			cache-size =3D <0x100000>;
- 			cache-line-size =3D <64>;
- 			cache-sets =3D <1024>;
-diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/a=
rm/juno-r2.dts
-index 438cd1ff4bd0..d2ada69b0a43 100644
---- a/arch/arm64/boot/dts/arm/juno-r2.dts
-+++ b/arch/arm64/boot/dts/arm/juno-r2.dts
-@@ -195,6 +195,7 @@ A53_3: cpu@103 {
-=20
- 		A72_L2: l2-cache0 {
- 			compatible =3D "cache";
-+			cache-unified;
- 			cache-size =3D <0x200000>;
- 			cache-line-size =3D <64>;
- 			cache-sets =3D <2048>;
-@@ -203,6 +204,7 @@ A72_L2: l2-cache0 {
-=20
- 		A53_L2: l2-cache1 {
- 			compatible =3D "cache";
-+			cache-unified;
- 			cache-size =3D <0x100000>;
- 			cache-line-size =3D <64>;
- 			cache-sets =3D <1024>;
-diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/=
juno.dts
-index cf4a58211399..5e48a01a5b9f 100644
---- a/arch/arm64/boot/dts/arm/juno.dts
-+++ b/arch/arm64/boot/dts/arm/juno.dts
-@@ -194,6 +194,7 @@ A53_3: cpu@103 {
-=20
- 		A57_L2: l2-cache0 {
- 			compatible =3D "cache";
-+			cache-unified;
- 			cache-size =3D <0x200000>;
- 			cache-line-size =3D <64>;
- 			cache-sets =3D <2048>;
-@@ -202,6 +203,7 @@ A57_L2: l2-cache0 {
-=20
- 		A53_L2: l2-cache1 {
- 			compatible =3D "cache";
-+			cache-unified;
- 			cache-size =3D <0x100000>;
- 			cache-line-size =3D <64>;
- 			cache-sets =3D <1024>;
-diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/boo=
t/dts/arm/rtsm_ve-aemv8a.dts
-index 258991ad7cc0..ef68f5aae7dd 100644
---- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
-+++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
-@@ -71,6 +71,7 @@ cpu@3 {
-=20
- 		L2_0: l2-cache0 {
- 			compatible =3D "cache";
-+			cache-level =3D <2>;
- 		};
- 	};
-=20
-diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts b/arch=
/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
-index 5b6d9d8e934d..796cd7d02eb5 100644
---- a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
-+++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
-@@ -57,6 +57,7 @@ cpu@1 {
-=20
- 		L2_0: l2-cache0 {
- 			compatible =3D "cache";
-+			cache-level =3D <2>;
- 		};
- 	};
-=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-=
fvp-Add-SPE-to-Foundation-FVP.patch b/meta-arm-bsp/recipes-kernel/linux/f=
iles/juno/0002-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch
deleted file mode 100644
index 4495f397..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-arm64-dts-fvp-Add=
-SPE-to-Foundation-FVP.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bd354219987dddbf8ab6fd11450b4046547aca1b Mon Sep 17 00:00:00 2001
-From: James Clark <james.clark@arm.com>
-Date: Thu, 17 Nov 2022 10:25:36 +0000
-Subject: [PATCH] arm64: dts: fvp: Add SPE to Foundation FVP
-
-Add SPE DT node to FVP model. If the model doesn't support SPE (e.g.,
-turned off via parameter), the driver will skip the initialisation
-accordingly and thus is safe.
-
-Signed-off-by: James Clark <james.clark@arm.com>
-Link: https://lore.kernel.org/r/20221117102536.237515-1-james.clark@arm.=
com
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Backport
----
- arch/arm64/boot/dts/arm/foundation-v8.dtsi | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi b/arch/arm64/boo=
t/dts/arm/foundation-v8.dtsi
-index c8bd23b1a7ba..029578072d8f 100644
---- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
-+++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
-@@ -85,6 +85,11 @@ pmu {
- 			     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
- 	};
-=20
-+	spe-pmu {
-+		compatible =3D "arm,statistical-profiling-extension-v1";
-+		interrupts =3D <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
-+	};
-+
- 	watchdog@2a440000 {
- 		compatible =3D "arm,sbsa-gwdt";
- 		reg =3D <0x0 0x2a440000 0 0x1000>,
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-=
fvp-Add-information-about-L1-and-L2-caches.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/juno/0003-arm64-dts-fvp-Add-information-about-L1-and-L2=
-caches.patch
deleted file mode 100644
index fc027510..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-arm64-dts-fvp-Add=
-information-about-L1-and-L2-caches.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From 22e740d069e14875a64864bf86e0826a96560b44 Mon Sep 17 00:00:00 2001
-From: Sudeep Holla <sudeep.holla@arm.com>
-Date: Fri, 18 Nov 2022 15:10:17 +0000
-Subject: [PATCH] arm64: dts: fvp: Add information about L1 and L2 caches
-
-Add the information about L1 and L2 caches on FVP RevC platform.
-Though the cache size is configurable through the model parameters,
-having default values in the device tree helps to exercise and debug
-any code utilising the cache information without the need of real
-hardware.
-
-Link: https://lore.kernel.org/r/20221118151017.704716-1-sudeep.holla@arm=
.com
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Backport
----
- arch/arm64/boot/dts/arm/fvp-base-revc.dts | 73 +++++++++++++++++++++++
- 1 file changed, 73 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot=
/dts/arm/fvp-base-revc.dts
-index 5f6f30c801a7..60472d65a355 100644
---- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
-+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
-@@ -47,48 +47,121 @@ cpu0: cpu@0 {
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x000>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C0_L2>;
- 		};
- 		cpu1: cpu@100 {
- 			device_type =3D "cpu";
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x100>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C0_L2>;
- 		};
- 		cpu2: cpu@200 {
- 			device_type =3D "cpu";
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x200>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C0_L2>;
- 		};
- 		cpu3: cpu@300 {
- 			device_type =3D "cpu";
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x300>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C0_L2>;
- 		};
- 		cpu4: cpu@10000 {
- 			device_type =3D "cpu";
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x10000>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C1_L2>;
- 		};
- 		cpu5: cpu@10100 {
- 			device_type =3D "cpu";
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x10100>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C1_L2>;
- 		};
- 		cpu6: cpu@10200 {
- 			device_type =3D "cpu";
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x10200>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C1_L2>;
- 		};
- 		cpu7: cpu@10300 {
- 			device_type =3D "cpu";
- 			compatible =3D "arm,armv8";
- 			reg =3D <0x0 0x10300>;
- 			enable-method =3D "psci";
-+			i-cache-size =3D <0x8000>;
-+			i-cache-line-size =3D <64>;
-+			i-cache-sets =3D <256>;
-+			d-cache-size =3D <0x8000>;
-+			d-cache-line-size =3D <64>;
-+			d-cache-sets =3D <256>;
-+			next-level-cache =3D <&C1_L2>;
-+		};
-+		C0_L2: l2-cache0 {
-+			compatible =3D "cache";
-+			cache-size =3D <0x80000>;
-+			cache-line-size =3D <64>;
-+			cache-sets =3D <512>;
-+			cache-level =3D <2>;
-+			cache-unified;
-+		};
-+
-+		C1_L2: l2-cache1 {
-+			compatible =3D "cache";
-+			cache-size =3D <0x80000>;
-+			cache-line-size =3D <64>;
-+			cache-sets =3D <512>;
-+			cache-level =3D <2>;
-+			cache-unified;
- 		};
- 	};
-=20
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-ARM-dts-ve=
xpress-align-LED-node-names-with-dtschema.patch b/meta-arm-bsp/recipes-ke=
rnel/linux/files/juno/0004-ARM-dts-vexpress-align-LED-node-names-with-dts=
chema.patch
deleted file mode 100644
index e3828ec9..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-ARM-dts-vexpress-=
align-LED-node-names-with-dtschema.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 4edb625e2256d5761312110e34cbc0164915d772 Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-Date: Fri, 25 Nov 2022 15:41:12 +0100
-Subject: [PATCH] ARM: dts: vexpress: align LED node names with dtschema
-
-The node names should be generic and DT schema expects certain pattern.
-
-  vexpress-v2p-ca9.dtb: leds: 'user1', 'user2', 'user3', 'user4', 'user5=
', 'user6', 'user7', 'user8' do not match any of the regexes: '(^led-[0-9=
a-f]$|led)', 'pinctrl-[0-9]+'
-
-Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
-Link: https://lore.kernel.org/r/20221125144112.476817-1-krzysztof.kozlow=
ski@linaro.org
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Backport
----
- arch/arm/boot/dts/vexpress-v2m.dtsi | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/arch/arm/boot/dts/vexpress-v2m.dtsi b/arch/arm/boot/dts/vex=
press-v2m.dtsi
-index f434fe5cf4a1..def538ce8769 100644
---- a/arch/arm/boot/dts/vexpress-v2m.dtsi
-+++ b/arch/arm/boot/dts/vexpress-v2m.dtsi
-@@ -383,49 +383,49 @@ v2m_refclk32khz: refclk32khz {
- 			leds {
- 				compatible =3D "gpio-leds";
-=20
--				user1 {
-+				led-user1 {
- 					label =3D "v2m:green:user1";
- 					gpios =3D <&v2m_led_gpios 0 0>;
- 					linux,default-trigger =3D "heartbeat";
- 				};
-=20
--				user2 {
-+				led-user2 {
- 					label =3D "v2m:green:user2";
- 					gpios =3D <&v2m_led_gpios 1 0>;
- 					linux,default-trigger =3D "mmc0";
- 				};
-=20
--				user3 {
-+				led-user3 {
- 					label =3D "v2m:green:user3";
- 					gpios =3D <&v2m_led_gpios 2 0>;
- 					linux,default-trigger =3D "cpu0";
- 				};
-=20
--				user4 {
-+				led-user4 {
- 					label =3D "v2m:green:user4";
- 					gpios =3D <&v2m_led_gpios 3 0>;
- 					linux,default-trigger =3D "cpu1";
- 				};
-=20
--				user5 {
-+				led-user5 {
- 					label =3D "v2m:green:user5";
- 					gpios =3D <&v2m_led_gpios 4 0>;
- 					linux,default-trigger =3D "cpu2";
- 				};
-=20
--				user6 {
-+				led-user6 {
- 					label =3D "v2m:green:user6";
- 					gpios =3D <&v2m_led_gpios 5 0>;
- 					linux,default-trigger =3D "cpu3";
- 				};
-=20
--				user7 {
-+				led-user7 {
- 					label =3D "v2m:green:user7";
- 					gpios =3D <&v2m_led_gpios 6 0>;
- 					linux,default-trigger =3D "cpu4";
- 				};
-=20
--				user8 {
-+				led-user8 {
- 					label =3D "v2m:green:user8";
- 					gpios =3D <&v2m_led_gpios 7 0>;
- 					linux,default-trigger =3D "cpu5";
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 64b1e41e..740976e4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -77,12 +77,6 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " file://fvp-bas=
er-aemv8r64.dts;subdir=3Dgit/a
 #
 COMPATIBLE_MACHINE:juno =3D "juno"
 FILESEXTRAPATHS:prepend:juno :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:juno =3D " \
-    file://0001-arm64-dts-Update-cache-properties-for-Arm-Ltd-platfo.pat=
ch \
-    file://0002-arm64-dts-fvp-Add-SPE-to-Foundation-FVP.patch \
-    file://0003-arm64-dts-fvp-Add-information-about-L1-and-L2-caches.pat=
ch \
-    file://0004-ARM-dts-vexpress-align-LED-node-names-with-dtschema.patc=
h \
-    "
=20
 #
 # Musca B1/S2 can't run Linux
--=20
2.30.2


