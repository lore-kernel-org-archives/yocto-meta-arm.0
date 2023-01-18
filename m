Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0C9C32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 15:55:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19278.1674057297173915430
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jan 2023 07:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C10C169C
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:55:39 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B17DA3F67D
	for <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 07:54:56 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH kirkstone 2/2] arm-bsp/linux-yocto: Update juno patch
Date: Wed, 18 Jan 2023 10:54:52 -0500
Message-Id: <20230118155452.592-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230118155452.592-1-jon.mason@arm.com>
References: <20230118155452.592-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jan 2023 15:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4299

Update the juno kernel patch to work with the latest kirkstone kernel,
and remove the workaround.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../files/juno/juno-dts-mhu-doorbell.patch    | 70 ++++++++++---------
 .../linux/linux-yocto_5.15.bbappend           |  3 -
 2 files changed, 37 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorbell.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorbell.patch
index ca0ba6f9..1100e610 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorbell.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/juno-dts-mhu-doorbell.patch
@@ -21,7 +21,7 @@ Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
  5 files changed, 96 insertions(+), 85 deletions(-)
 
 diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
-index 6288e104a089..36844f7d861e 100644
+index a00b0f14c222..8da7fe6fd157 100644
 --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
 +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
 @@ -23,12 +23,13 @@ frame@2a830000 {
@@ -40,7 +40,7 @@ index 6288e104a089..36844f7d861e 100644
  		clocks = <&soc_refclk100mhz>;
  		clock-names = "apb_pclk";
  	};
-@@ -39,7 +40,7 @@ smmu_gpu: iommu@2b400000 {
+@@ -40,7 +41,7 @@ smmu_gpu: iommu@2b400000 {
  			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
  		#iommu-cells = <1>;
  		#global-interrupts = <1>;
@@ -49,7 +49,7 @@ index 6288e104a089..36844f7d861e 100644
  		dma-coherent;
  		status = "disabled";
  	};
-@@ -63,7 +64,7 @@ smmu_etr: iommu@2b600000 {
+@@ -64,7 +65,7 @@ smmu_etr: iommu@2b600000 {
  		#iommu-cells = <1>;
  		#global-interrupts = <1>;
  		dma-coherent;
@@ -58,7 +58,7 @@ index 6288e104a089..36844f7d861e 100644
  	};
  
  	gic: interrupt-controller@2c010000 {
-@@ -123,7 +124,7 @@ etf@20010000 { /* etf0 */
+@@ -124,7 +125,7 @@ etf@20010000 { /* etf0 */
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -67,7 +67,7 @@ index 6288e104a089..36844f7d861e 100644
  
  		in-ports {
  			port {
-@@ -147,7 +148,7 @@ tpiu@20030000 {
+@@ -148,7 +149,7 @@ tpiu@20030000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -76,7 +76,7 @@ index 6288e104a089..36844f7d861e 100644
  		in-ports {
  			port {
  				tpiu_in_port: endpoint {
-@@ -164,7 +165,7 @@ main_funnel: funnel@20040000 {
+@@ -165,7 +166,7 @@ main_funnel: funnel@20040000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -85,7 +85,7 @@ index 6288e104a089..36844f7d861e 100644
  
  		out-ports {
  			port {
-@@ -201,7 +202,7 @@ etr@20070000 {
+@@ -202,7 +203,7 @@ etr@20070000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -94,7 +94,7 @@ index 6288e104a089..36844f7d861e 100644
  		arm,scatter-gather;
  		in-ports {
  			port {
-@@ -220,7 +221,7 @@ stm@20100000 {
+@@ -221,7 +222,7 @@ stm@20100000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -103,7 +103,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				stm_out_port: endpoint {
-@@ -235,7 +236,7 @@ replicator@20120000 {
+@@ -236,7 +237,7 @@ replicator@20120000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -112,7 +112,7 @@ index 6288e104a089..36844f7d861e 100644
  
  		out-ports {
  			#address-cells = <1>;
-@@ -270,7 +271,7 @@ cpu_debug0: cpu-debug@22010000 {
+@@ -271,7 +272,7 @@ cpu_debug0: cpu-debug@22010000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -121,7 +121,7 @@ index 6288e104a089..36844f7d861e 100644
  	};
  
  	etm0: etm@22040000 {
-@@ -279,7 +280,7 @@ etm0: etm@22040000 {
+@@ -280,7 +281,7 @@ etm0: etm@22040000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -130,7 +130,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster0_etm0_out_port: endpoint {
-@@ -295,7 +296,7 @@ funnel@220c0000 { /* cluster0 funnel */
+@@ -296,7 +297,7 @@ funnel@220c0000 { /* cluster0 funnel */
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -139,7 +139,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster0_funnel_out_port: endpoint {
-@@ -330,7 +331,7 @@ cpu_debug1: cpu-debug@22110000 {
+@@ -331,7 +332,7 @@ cpu_debug1: cpu-debug@22110000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -148,7 +148,7 @@ index 6288e104a089..36844f7d861e 100644
  	};
  
  	etm1: etm@22140000 {
-@@ -339,7 +340,7 @@ etm1: etm@22140000 {
+@@ -340,7 +341,7 @@ etm1: etm@22140000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -157,7 +157,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster0_etm1_out_port: endpoint {
-@@ -355,7 +356,7 @@ cpu_debug2: cpu-debug@23010000 {
+@@ -356,7 +357,7 @@ cpu_debug2: cpu-debug@23010000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -166,7 +166,7 @@ index 6288e104a089..36844f7d861e 100644
  	};
  
  	etm2: etm@23040000 {
-@@ -364,7 +365,7 @@ etm2: etm@23040000 {
+@@ -365,7 +366,7 @@ etm2: etm@23040000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -175,7 +175,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster1_etm0_out_port: endpoint {
-@@ -380,7 +381,7 @@ funnel@230c0000 { /* cluster1 funnel */
+@@ -381,7 +382,7 @@ funnel@230c0000 { /* cluster1 funnel */
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -184,7 +184,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster1_funnel_out_port: endpoint {
-@@ -427,7 +428,7 @@ cpu_debug3: cpu-debug@23110000 {
+@@ -428,7 +429,7 @@ cpu_debug3: cpu-debug@23110000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -193,7 +193,7 @@ index 6288e104a089..36844f7d861e 100644
  	};
  
  	etm3: etm@23140000 {
-@@ -436,7 +437,7 @@ etm3: etm@23140000 {
+@@ -437,7 +438,7 @@ etm3: etm@23140000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -202,7 +202,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster1_etm1_out_port: endpoint {
-@@ -452,7 +453,7 @@ cpu_debug4: cpu-debug@23210000 {
+@@ -453,7 +454,7 @@ cpu_debug4: cpu-debug@23210000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -211,7 +211,7 @@ index 6288e104a089..36844f7d861e 100644
  	};
  
  	etm4: etm@23240000 {
-@@ -461,7 +462,7 @@ etm4: etm@23240000 {
+@@ -462,7 +463,7 @@ etm4: etm@23240000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -220,7 +220,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster1_etm2_out_port: endpoint {
-@@ -477,7 +478,7 @@ cpu_debug5: cpu-debug@23310000 {
+@@ -478,7 +479,7 @@ cpu_debug5: cpu-debug@23310000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -229,7 +229,7 @@ index 6288e104a089..36844f7d861e 100644
  	};
  
  	etm5: etm@23340000 {
-@@ -486,7 +487,7 @@ etm5: etm@23340000 {
+@@ -487,7 +488,7 @@ etm5: etm@23340000 {
  
  		clocks = <&soc_smc50mhz>;
  		clock-names = "apb_pclk";
@@ -238,7 +238,7 @@ index 6288e104a089..36844f7d861e 100644
  		out-ports {
  			port {
  				cluster1_etm3_out_port: endpoint {
-@@ -503,8 +504,8 @@ gpu: gpu@2d000000 {
+@@ -504,8 +505,8 @@ gpu: gpu@2d000000 {
  			     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
  			     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
  		interrupt-names = "job", "mmu", "gpu";
@@ -249,7 +249,7 @@ index 6288e104a089..36844f7d861e 100644
  		dma-coherent;
  		/* The SMMU is only really of interest to bare-metal hypervisors */
  		/* iommus = <&smmu_gpu 0>; */
-@@ -519,14 +520,24 @@ sram: sram@2e000000 {
+@@ -520,14 +521,24 @@ sram: sram@2e000000 {
  		#size-cells = <1>;
  		ranges = <0 0x0 0x2e000000 0x8000>;
  
@@ -342,21 +342,25 @@ index 6288e104a089..36844f7d861e 100644
  		};
  	};
  
-@@ -596,40 +607,40 @@ thermal-zones {
+@@ -596,7 +607,7 @@ thermal-zones {
  		pmic {
  			polling-delay = <1000>;
  			polling-delay-passive = <100>;
 -			thermal-sensors = <&scpi_sensors0 0>;
 +			thermal-sensors = <&scmi_sensors0 0>;
- 		};
- 
+ 			trips {
+ 				pmic_crit0: trip0 {
+ 					temperature = <90000>;
+@@ -609,7 +620,7 @@ pmic_crit0: trip0 {
  		soc {
  			polling-delay = <1000>;
  			polling-delay-passive = <100>;
 -			thermal-sensors = <&scpi_sensors0 3>;
 +			thermal-sensors = <&scmi_sensors0 3>;
- 		};
- 
+ 			trips {
+ 				soc_crit0: trip0 {
+ 					temperature = <80000>;
+@@ -622,28 +633,28 @@ soc_crit0: trip0 {
  		big_cluster_thermal_zone: big-cluster {
  			polling-delay = <1000>;
  			polling-delay-passive = <100>;
@@ -389,7 +393,7 @@ index 6288e104a089..36844f7d861e 100644
  			status = "disabled";
  		};
  	};
-@@ -705,7 +716,7 @@ hdlcd@7ff50000 {
+@@ -719,7 +730,7 @@ hdlcd@7ff50000 {
  		reg = <0 0x7ff50000 0 0x1000>;
  		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
  		iommus = <&smmu_hdlcd1 0>;
@@ -398,7 +402,7 @@ index 6288e104a089..36844f7d861e 100644
  		clock-names = "pxlclk";
  
  		port {
-@@ -720,7 +731,7 @@ hdlcd@7ff60000 {
+@@ -734,7 +745,7 @@ hdlcd@7ff60000 {
  		reg = <0 0x7ff60000 0 0x1000>;
  		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
  		iommus = <&smmu_hdlcd0 0>;
@@ -613,5 +617,5 @@ index f00cffbd032c..a28316c65c1b 100644
  			capacity-dmips-mhz = <578>;
  			dynamic-power-coefficient = <140>;
 -- 
-2.25.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
deleted file mode 100644
index b0bbfeff..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# This is only needed until the juno patches are updated to the latest 5.15 release.
-LINUX_VERSION:juno = "5.15.72"
-SRCREV_machine:juno = "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-- 
2.17.1


