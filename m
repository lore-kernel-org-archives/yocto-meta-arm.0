Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.43])
 by mx.groups.io with SMTP id smtpd.web12.5913.1592294796992058666
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 01:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gJka0fRQ;
 spf=pass (domain: arm.com, ip: 40.107.13.43, mailfrom: luca.fancellu@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxFITPnH7CHO9D3s5lqydynwLLiFNtKki1YbporQGCM=;
 b=gJka0fRQv8KNjOI1vFU1CVCy82x2WiYDx8UiWifMob/X5059YqiQQg62JlpVSZ+bHCbcfp+GIKotrF20D9nga34EW24xU6yaT80sP86YNnHpx4Z8wDhacr29AdCLPGgWaQUh0DPmvHMhLTr9+m6MvgP9Z4GOL8vK3FqCDetWkuE=
Received: from AM6P191CA0054.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::31)
 by HE1PR0802MB2330.eurprd08.prod.outlook.com (2603:10a6:3:c8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Tue, 16 Jun
 2020 08:06:33 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::13) by AM6P191CA0054.outlook.office365.com
 (2603:10a6:209:7f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Tue, 16 Jun 2020 08:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Tue, 16 Jun 2020 08:06:33 +0000
Received: ("Tessian outbound 223ba8928d27:v59"); Tue, 16 Jun 2020 08:06:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0348063c241a244a
X-CR-MTA-TID: 64aa7808
Received: from e8d8bd031b88.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0454D06D-64AA-4D58-BE8F-4B5114741BAE.1;
	Tue, 16 Jun 2020 08:06:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8d8bd031b88.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Jun 2020 08:06:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A67y387LUWw6haAf23AsIPsV+O5MI7fETh/wDjSwcc0+i2Ww1L4HO3pWQtbFDIqwzwsHzLsza15378uOmZNLIlyESa19z0dd1Dr2RkiySUIzuTDEIHOBmTjorX1rUXoCbqfbjQOhddQP/IuauwXd0oM5aKjzHGsP8KSZMu4F6OjFeGItj4lQ+rS3GAxim3hr+sJTekJAmxHJudvtAArGGYUaC1P4psNeNZOkBnbmweV3Ociti65xxtVia3Qthi5T8qGRcyQcqkOPR4Dk4/Xkmti70/U+PnKxXFrBF63qUrvgZQgEzITWL6wkoaVT5T2VxTxu1/7SrQAH/nOzVmAdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxFITPnH7CHO9D3s5lqydynwLLiFNtKki1YbporQGCM=;
 b=cL3QSzXEeDw0rLzdal/VpyWLicZixgXCg92EKMjHA/xAzflNixG5+GXBHHz5u/3rRTfCpWC7n8oVZ3P0n5MG4bW4+c6N78qGr2oNtcn26duHxnryD/2Dt3b4yD73NdAApFjfBUIpl/Ijhs1lFq/ROYXy/CZ6z5hdPVkibXUTLLGvxb8IxTgwrkXw3EZb6ZmLeWQDXim2dHdTf4lhAnOFo5GRhbNen6NqjxgJN4Zp4gzcedgr37e5FxW8IdMB1TERWKQoc7hmfeoTmnSoNLi4fjGWyAvANXf+TT/W65Gi1X4FEQdOc9Jv7AW/YZNk7DK/Yn0MzbqzkcVQdI2v1LSCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxFITPnH7CHO9D3s5lqydynwLLiFNtKki1YbporQGCM=;
 b=gJka0fRQv8KNjOI1vFU1CVCy82x2WiYDx8UiWifMob/X5059YqiQQg62JlpVSZ+bHCbcfp+GIKotrF20D9nga34EW24xU6yaT80sP86YNnHpx4Z8wDhacr29AdCLPGgWaQUh0DPmvHMhLTr9+m6MvgP9Z4GOL8vK3FqCDetWkuE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3824.eurprd08.prod.outlook.com (2603:10a6:803:bf::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Tue, 16 Jun
 2020 08:06:26 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::6cfa:9b42:902e:90f3]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::6cfa:9b42:902e:90f3%6]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 08:06:26 +0000
From: luca.fancellu@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Move to linux-linaro-arm for fvp-base and foundation-armv8
Date: Tue, 16 Jun 2020 08:06:16 +0000
Message-Id: <20200616080616.5509-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: CWLP265CA0321.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:57::21) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (217.140.106.54) by CWLP265CA0321.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:57::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Tue, 16 Jun 2020 08:06:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd4bc457-23d4-4409-ebee-08d811cc2f22
X-MS-TrafficTypeDiagnostic: VI1PR08MB3824:|HE1PR0802MB2330:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB233025549A2C3919826079CAE49D0@HE1PR0802MB2330.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-Forefront-PRVS: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Q7DD6Csd+230GbJATIqgOzUKtaHXkeilrdc2tGeILmnShwBoWCawBpsJ4PeN9fjlsq3SlgSMLbGHID3nxysnwFK5aqJAYUhtTWxwM9fBQi1qH7mKuysrddK3FP6or9bi1r4A+6b4ywJxwF07dXZsxm8M05vHl4JU+ZfMb/pSf5Qzm+H9O1+K1JU80EQQT4D7YFLkzETL2SNOtrWONDIUJcJBnKSYWe218JkdvdUFGjY1tMun1p9QFgDCjiTnqkcNzQZSml9iszTsb2KwDhkiA8x31RlWXvBW3Nh42JyZR9qFPPjcOYJSgriUwl+lXdwcsTUZ3roDJWN+N8rRbrF3KrlFWb8yzUOWn+EV2pQIEMGmyCn76CLyAceXHI+XU0eX
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(36756003)(6506007)(6666004)(1076003)(6512007)(69590400007)(52116002)(6486002)(66556008)(66946007)(86362001)(316002)(66476007)(30864003)(6916009)(8676002)(5660300002)(4326008)(478600001)(16526019)(83380400001)(8936002)(26005)(2906002)(2616005)(956004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Tr5G2AUbnOVjVxDINRIgUfL1eHYOov4dDKomClF17kCzhf3b9GZI8xxr5fNh9GVAozcCmWjmNmdyV7w69Hh2IPTU0+JKe+2Bfbd67Z7Dylx975nXp9BU9/lpgnvPFRbhZiPpt2lt0ypmMI0EZ6F2V0HcBORACP6onedNJ2Fn9+9XVjXJfPh9M4/+iqKk+ZAPczQfqHZECnslk9qQYk6U34iZtHrsYfi3tLGf55ASntKmhVQEDSA8CH0z8bipNVU9VtKe4wZtNRFNtZOEtRVJlKASImtvcsYOAAKhY5J0OW/WBtt5fSU8F46f3tLws9JKyWvZ0cG/mOVCFVbRZ6uL7HJbbIGFo6vm2GP2NBB2GDHxtJMLOrYhXnoWG3903cyIPGHzWucSY6hTKrbLW2n8cnn3//t4Zn4m9VZ1uW0JSTQytkYa9+QuczsvldMmoBpyjAIG/WBJ9jlyWkDqLsv2UOtWgm196Th5glP3H0sRw60=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3824
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Luca.Fancellu@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(8676002)(6512007)(36756003)(69590400007)(6506007)(47076004)(70206006)(70586007)(8936002)(6486002)(2906002)(6916009)(82740400003)(4326008)(86362001)(956004)(478600001)(1076003)(186003)(30864003)(6666004)(16526019)(2616005)(36906005)(82310400002)(5660300002)(336012)(26005)(83380400001)(316002)(81166007)(356005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26c3bd6e-3902-4a29-659b-08d811cc2ad8
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HWmFNgJKhpLyBJmDJY2XVa/YVEFTIJyyFjL9unoi5RA1yQ5Cz30kFXwnSWBOZHRs+5OVUUFRCehOZpOtRKLJfAYVTlvPvrHgfDSsjcsA7TdtgVDHjIBDWV2C5m7zDWhHtB+n67jMtVQzElBgTyQ3ZME6+1AZZyFQw/1WBOHPJw7Y25TnsMUjlJH+BNw6QwAF3h2do6Inzogv21KJmbgF3cDlieCYafBc8l3iMpsC5bpWfVX9q0zudu9zAwfuAW28rFmFHFJaaF91ybvBqashcHfqrqF7SMpd9NHC0A7BuaP2Onlec/m3DHqqKVJNl5RqZGQ5cokHPYIn5Ko1omAujklIS1Xkyy4Ihq8VXBJB270Z/urlyHD77x8U7Kx3+zDhXc7AUpbLtQgOnWRBtxRbZ4N+ErlAuuMeeYW4zff5zF0T1Av1hJLiOVUvTYfmTv/A
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 08:06:33.3983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4bc457-23d4-4409-ebee-08d811cc2f22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2330
Content-Type: text/plain

Change fvp-base and foundation-armv8 kernel from linux-yocto_5.4
to linux-linaro-arm_4.19 because some drivers are not available.
Furthermore, for fvp-base the linaro kernel comes with the dts
file removing the needs to support it on our side.

Change-Id: I844d92f173406542c2bad8d89793513f8bc28fd1
Signed-off-by: luca fancellu <luca.fancellu@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |   2 +-
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc  |   4 +-
 .../fvp-base-gicv3-psci-common-custom.dtsi    | 264 ----------------
 .../dts/arm/fvp-base-gicv3-psci-custom.dts    |   9 -
 .../dts/arm/rtsm_ve-motherboard-nomap.dtsi    | 282 ------------------
 .../linux/linux-yocto-arm-platforms.inc       |   6 -
 6 files changed, 3 insertions(+), 564 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-custom.dts
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-motherboard-nomap.dtsi

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 3039644..ae6b28c 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -6,7 +6,7 @@
 
 require conf/machine/fvp-common/fvp.inc
 
-KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
+KERNEL_DEVICETREE = "arm/fvp-base-aemv8a-aemv8a.dtb"
 
 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
index 08f8b15..f8a2584 100644
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
@@ -34,8 +34,8 @@ DISK_IMG_PARTITION3_CONTENT = ""
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.4%"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
+PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
deleted file mode 100644
index 1e056be..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
+++ /dev/null
@@ -1,264 +0,0 @@
-/*
- * Copyright (c) 2017-2018, ARM Limited and Contributors. All rights reserved.
- *
- * SPDX-License-Identifier: BSD-3-Clause
- */
-
-/memreserve/ 0x80000000 0x00010000;
-
-/include/ "rtsm_ve-motherboard-nomap.dtsi"
-
-/ {
-	model = "FVP Base";
-	compatible = "arm,vfp-base", "arm,vexpress";
-	interrupt-parent = <&gic>;
-	#address-cells = <2>;
-	#size-cells = <2>;
-
-	aliases {
-		serial0 = &v2m_serial0;
-		serial1 = &v2m_serial1;
-		serial2 = &v2m_serial2;
-		serial3 = &v2m_serial3;
-	};
-
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
-		method = "smc";
-		cpu_suspend = <0xc4000001>;
-		cpu_off = <0x84000002>;
-		cpu_on = <0xc4000003>;
-		sys_poweroff = <0x84000008>;
-		sys_reset = <0x84000009>;
-	};
-
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		cpu-map {
-			cluster0 {
-				core0 {
-					cpu = <&CPU0>;
-				};
-				core1 {
-					cpu = <&CPU1>;
-				};
-				core2 {
-					cpu = <&CPU2>;
-				};
-				core3 {
-					cpu = <&CPU3>;
-				};
-			};
-
-			cluster1 {
-				core0 {
-					cpu = <&CPU4>;
-				};
-				core1 {
-					cpu = <&CPU5>;
-				};
-				core2 {
-					cpu = <&CPU6>;
-				};
-				core3 {
-					cpu = <&CPU7>;
-				};
-			};
-		};
-
-		idle-states {
-			entry-method = "arm,psci";
-
-			CPU_SLEEP_0: cpu-sleep-0 {
-				compatible = "arm,idle-state";
-				local-timer-stop;
-				arm,psci-suspend-param = <0x0010000>;
-				entry-latency-us = <40>;
-				exit-latency-us = <100>;
-				min-residency-us = <150>;
-			};
-
-			CLUSTER_SLEEP_0: cluster-sleep-0 {
-				compatible = "arm,idle-state";
-				local-timer-stop;
-				arm,psci-suspend-param = <0x1010000>;
-				entry-latency-us = <500>;
-				exit-latency-us = <1000>;
-				min-residency-us = <2500>;
-			};
-		};
-
-		CPU0:cpu@0 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x0>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		CPU1:cpu@1 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x1>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		CPU2:cpu@2 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x2>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		CPU3:cpu@3 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x3>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		CPU4:cpu@100 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x100>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		CPU5:cpu@101 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x101>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		CPU6:cpu@102 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x102>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		CPU7:cpu@103 {
-			device_type = "cpu";
-			compatible = "arm,armv8";
-			reg = <0x0 0x103>;
-			enable-method = "psci";
-			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
-			next-level-cache = <&L2_0>;
-		};
-
-		L2_0: l2-cache0 {
-			compatible = "cache";
-		};
-	};
-
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x00000000 0x80000000 0 0x7F000000>,
-		      <0x00000008 0x80000000 0 0x80000000>;
-	};
-
-	gic: interrupt-controller@2f000000 {
-		compatible = "arm,gic-v3";
-		#interrupt-cells = <3>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-		interrupt-controller;
-		reg = <0x0 0x2f000000 0 0x10000>,	// GICD
-		      <0x0 0x2f100000 0 0x200000>,	// GICR
-		      <0x0 0x2c000000 0 0x2000>,	// GICC
-		      <0x0 0x2c010000 0 0x2000>,	// GICH
-		      <0x0 0x2c02f000 0 0x2000>;	// GICV
-		interrupts = <1 9 4>;
-
-		its: its@2f020000 {
-			compatible = "arm,gic-v3-its";
-			msi-controller;
-			reg = <0x0 0x2f020000 0x0 0x20000>; // GITS
-		};
-	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <1 13 0xff01>,
-			     <1 14 0xff01>,
-			     <1 11 0xff01>,
-			     <1 10 0xff01>;
-		clock-frequency = <100000000>;
-	};
-
-	timer@2a810000 {
-			compatible = "arm,armv7-timer-mem";
-			reg = <0x0 0x2a810000 0x0 0x10000>;
-			clock-frequency = <100000000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-			frame@2a830000 {
-				frame-number = <1>;
-				interrupts = <0 26 4>;
-				reg = <0x0 0x2a830000 0x0 0x10000>;
-			};
-	};
-
-	pmu {
-		compatible = "arm,armv8-pmuv3";
-		interrupts = <0 60 4>,
-			     <0 61 4>,
-			     <0 62 4>,
-			     <0 63 4>;
-	};
-
-	smb@8000000 {
-		compatible = "simple-bus";
-
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges = <0 0 0 0x08000000 0x04000000>,
-			 <1 0 0 0x14000000 0x04000000>,
-			 <2 0 0 0x18000000 0x04000000>,
-			 <3 0 0 0x1c000000 0x04000000>,
-			 <4 0 0 0x0c000000 0x04000000>,
-			 <5 0 0 0x10000000 0x04000000>;
-	};
-
-	panels {
-		panel {
-			compatible	= "panel";
-			mode		= "XVGA";
-			refresh		= <60>;
-			xres		= <1024>;
-			yres		= <768>;
-			pixclock	= <15748>;
-			left_margin	= <152>;
-			right_margin	= <48>;
-			upper_margin	= <23>;
-			lower_margin	= <3>;
-			hsync_len	= <104>;
-			vsync_len	= <4>;
-			sync		= <0>;
-			vmode		= "FB_VMODE_NONINTERLACED";
-			tim2		= "TIM2_BCD", "TIM2_IPC";
-			cntl		= "CNTL_LCDTFT", "CNTL_BGR", "CNTL_LCDVCOMP(1)";
-			caps		= "CLCD_CAP_5551", "CLCD_CAP_565", "CLCD_CAP_888";
-			bpp		= <16>;
-		};
-	};
-
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-custom.dts b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-custom.dts
deleted file mode 100644
index 984dbca..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/fvp-base-gicv3-psci-custom.dts
+++ /dev/null
@@ -1,9 +0,0 @@
-/*
- * Copyright (c) 2013-2017, ARM Limited and Contributors. All rights reserved.
- *
- * SPDX-License-Identifier: BSD-3-Clause
- */
-
-/dts-v1/;
-
-/include/ "fvp-base-gicv3-psci-common-custom.dtsi"
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-motherboard-nomap.dtsi b/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-motherboard-nomap.dtsi
deleted file mode 100644
index 739af57..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/dts/arm/rtsm_ve-motherboard-nomap.dtsi
+++ /dev/null
@@ -1,282 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * ARM Ltd. Fast Models
- *
- * Versatile Express (VE) system model
- * Motherboard component
- *
- * VEMotherBoard.lisa
- *
- * This is a duplicate of rtsm_ve-motherboard.dtsi but not
- * using interrupt-map as this is not properly supported in
- * xen right now
- */
-/ {
-	smb@8000000 {
-		motherboard {
-			arm,v2m-memory-map = "rs1";
-			compatible = "arm,vexpress,v2m-p1", "simple-bus";
-			#address-cells = <2>; /* SMB chipselect number and offset */
-			#size-cells = <1>;
-			ranges;
-
-			flash@0,00000000 {
-				compatible = "arm,vexpress-flash", "cfi-flash";
-				reg = <0 0x00000000 0x04000000>,
-				      <4 0x00000000 0x04000000>;
-				bank-width = <4>;
-			};
-
-			v2m_video_ram: vram@2,00000000 {
-				compatible = "arm,vexpress-vram";
-				reg = <2 0x00000000 0x00800000>;
-			};
-
-			ethernet@2,02000000 {
-				compatible = "smsc,lan91c111";
-				reg = <2 0x02000000 0x10000>;
-				interrupts = <0 15 4>;
-			};
-
-			v2m_clk24mhz: clk24mhz {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <24000000>;
-				clock-output-names = "v2m:clk24mhz";
-			};
-
-			v2m_refclk1mhz: refclk1mhz {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <1000000>;
-				clock-output-names = "v2m:refclk1mhz";
-			};
-
-			v2m_refclk32khz: refclk32khz {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <32768>;
-				clock-output-names = "v2m:refclk32khz";
-			};
-
-			iofpga@3,00000000 {
-				compatible = "simple-bus";
-				#address-cells = <1>;
-				#size-cells = <1>;
-				ranges = <0 3 0 0x200000>;
-
-				v2m_sysreg: sysreg@10000 {
-					compatible = "arm,vexpress-sysreg";
-					reg = <0x010000 0x1000>;
-					gpio-controller;
-					#gpio-cells = <2>;
-				};
-
-				v2m_sysctl: sysctl@20000 {
-					compatible = "arm,sp810", "arm,primecell";
-					reg = <0x020000 0x1000>;
-					clocks = <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&v2m_clk24mhz>;
-					clock-names = "refclk", "timclk", "apb_pclk";
-					#clock-cells = <1>;
-					clock-output-names = "timerclken0", "timerclken1", "timerclken2", "timerclken3";
-					assigned-clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_sysctl 3>, <&v2m_sysctl 3>;
-					assigned-clock-parents = <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
-				};
-
-				aaci@40000 {
-					compatible = "arm,pl041", "arm,primecell";
-					reg = <0x040000 0x1000>;
-					interrupts = <0 11 4>;
-					clocks = <&v2m_clk24mhz>;
-					clock-names = "apb_pclk";
-				};
-
-				mmci@50000 {
-					compatible = "arm,pl180", "arm,primecell";
-					reg = <0x050000 0x1000>;
-					interrupts = <0 9 4 0 10 4>;
-					cd-gpios = <&v2m_sysreg 0 0>;
-					wp-gpios = <&v2m_sysreg 1 0>;
-					max-frequency = <12000000>;
-					vmmc-supply = <&v2m_fixed_3v3>;
-					clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
-					clock-names = "mclk", "apb_pclk";
-				};
-
-				kmi@60000 {
-					compatible = "arm,pl050", "arm,primecell";
-					reg = <0x060000 0x1000>;
-					interrupts = <0 12 4>;
-					clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
-					clock-names = "KMIREFCLK", "apb_pclk";
-				};
-
-				kmi@70000 {
-					compatible = "arm,pl050", "arm,primecell";
-					reg = <0x070000 0x1000>;
-					interrupts = <0 13 4>;
-					clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
-					clock-names = "KMIREFCLK", "apb_pclk";
-				};
-
-				v2m_serial0: uart@90000 {
-					compatible = "arm,pl011", "arm,primecell";
-					reg = <0x090000 0x1000>;
-					interrupts = <0 5 4>;
-					clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
-					clock-names = "uartclk", "apb_pclk";
-				};
-
-				v2m_serial1: uart@a0000 {
-					compatible = "arm,pl011", "arm,primecell";
-					reg = <0x0a0000 0x1000>;
-					interrupts = <0 6 4>;
-					clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
-					clock-names = "uartclk", "apb_pclk";
-				};
-
-				v2m_serial2: uart@b0000 {
-					compatible = "arm,pl011", "arm,primecell";
-					reg = <0x0b0000 0x1000>;
-					interrupts = <0 7 4>;
-					clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
-					clock-names = "uartclk", "apb_pclk";
-				};
-
-				v2m_serial3: uart@c0000 {
-					compatible = "arm,pl011", "arm,primecell";
-					reg = <0x0c0000 0x1000>;
-					interrupts = <0 8 4>;
-					clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
-					clock-names = "uartclk", "apb_pclk";
-				};
-
-				wdt@f0000 {
-					compatible = "arm,sp805", "arm,primecell";
-					reg = <0x0f0000 0x1000>;
-					interrupts = <0 0 4>;
-					clocks = <&v2m_refclk32khz>, <&v2m_clk24mhz>;
-					clock-names = "wdogclk", "apb_pclk";
-				};
-
-				v2m_timer01: timer@110000 {
-					compatible = "arm,sp804", "arm,primecell";
-					reg = <0x110000 0x1000>;
-					interrupts = <0 2 4>;
-					clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_clk24mhz>;
-					clock-names = "timclken1", "timclken2", "apb_pclk";
-				};
-
-				v2m_timer23: timer@120000 {
-					compatible = "arm,sp804", "arm,primecell";
-					reg = <0x120000 0x1000>;
-					interrupts = <0 3 4>;
-					clocks = <&v2m_sysctl 2>, <&v2m_sysctl 3>, <&v2m_clk24mhz>;
-					clock-names = "timclken1", "timclken2", "apb_pclk";
-				};
-
-				rtc@170000 {
-					compatible = "arm,pl031", "arm,primecell";
-					reg = <0x170000 0x1000>;
-					interrupts = <0 4 4>;
-					clocks = <&v2m_clk24mhz>;
-					clock-names = "apb_pclk";
-				};
-
-				clcd@1f0000 {
-					compatible = "arm,pl111", "arm,primecell";
-					reg = <0x1f0000 0x1000>;
-					interrupt-names = "combined";
-					interrupts = <0 14 4>;
-					clocks = <&v2m_oscclk1>, <&v2m_clk24mhz>;
-					clock-names = "clcdclk", "apb_pclk";
-					arm,pl11x,framebuffer = <0x18000000 0x00180000>;
-					memory-region = <&v2m_video_ram>;
-					max-memory-bandwidth = <130000000>; /* 16bpp @ 63.5MHz */
-
-					port {
-						v2m_clcd_pads: endpoint {
-							remote-endpoint = <&v2m_clcd_panel>;
-							arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
-						};
-					};
-
-					panel {
-						compatible = "panel-dpi";
-
-						port {
-							v2m_clcd_panel: endpoint {
-								remote-endpoint = <&v2m_clcd_pads>;
-							};
-						};
-
-						panel-timing {
-							clock-frequency = <63500127>;
-							hactive = <1024>;
-							hback-porch = <152>;
-							hfront-porch = <48>;
-							hsync-len = <104>;
-							vactive = <768>;
-							vback-porch = <23>;
-							vfront-porch = <3>;
-							vsync-len = <4>;
-						};
-					};
-				};
-
-				virtio-block@130000 {
-					compatible = "virtio,mmio";
-					reg = <0x130000 0x200>;
-					interrupts = <0 42 4>;
-				};
-			};
-
-			v2m_fixed_3v3: v2m-3v3 {
-				compatible = "regulator-fixed";
-				regulator-name = "3V3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-			};
-
-			mcc {
-				compatible = "arm,vexpress,config-bus";
-				arm,vexpress,config-bridge = <&v2m_sysreg>;
-
-				v2m_oscclk1: oscclk1 {
-					/* CLCD clock */
-					compatible = "arm,vexpress-osc";
-					arm,vexpress-sysreg,func = <1 1>;
-					freq-range = <23750000 63500000>;
-					#clock-cells = <0>;
-					clock-output-names = "v2m:oscclk1";
-				};
-
-				reset {
-					compatible = "arm,vexpress-reset";
-					arm,vexpress-sysreg,func = <5 0>;
-				};
-
-				muxfpga {
-					compatible = "arm,vexpress-muxfpga";
-					arm,vexpress-sysreg,func = <7 0>;
-				};
-
-				shutdown {
-					compatible = "arm,vexpress-shutdown";
-					arm,vexpress-sysreg,func = <8 0>;
-				};
-
-				reboot {
-					compatible = "arm,vexpress-reboot";
-					arm,vexpress-sysreg,func = <9 0>;
-				};
-
-				dvimode {
-					compatible = "arm,vexpress-dvimode";
-					arm,vexpress-sysreg,func = <11 0>;
-				};
-			};
-		};
-	};
-};
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
index eeb0571..5622ae7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
@@ -21,12 +21,6 @@ KMACHINE_foundation-armv8 = "fvp"
 #
 COMPATIBLE_MACHINE_fvp-base = "fvp-base"
 KMACHINE_fvp-base = "fvp"
-SRC_URI_append_fvp-base = " file://dts/arm;subdir=add-files"
-
-do_patch_append_fvp-base() {
-    tar -C ${WORKDIR}/add-files/dts -cf - arm | \
-        tar -C arch/arm64/boot/dts -xf -
-}
 
 #
 # Juno KMACHINE
-- 
2.17.1

