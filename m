Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.47])
 by mx.groups.io with SMTP id smtpd.web10.3056.1601406414474270880
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Sep 2020 12:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bGow8x5r;
 spf=pass (domain: arm.com, ip: 40.107.22.47, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3OAUCvlMc9kLn1Ozk88NEV0BqtcPLg4/8sxCq/HM1o=;
 b=bGow8x5rGbh6Jdqrxuz5tD6otBwAt4wxIb7+olOTmsL3KHOEu6zsN9xBBU69+sXbu554r6tYp27BamGiPCm1KmgHFllMwsqw6UcCYyfCzkkg7Tz6pm6yiqfIDNd/8O14iWRenLuDVc/q9yDmBvsr4BGtVr0UPndYBSpKe3bFqJQ=
Received: from AM7PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:110::28)
 by AM6PR08MB3655.eurprd08.prod.outlook.com (2603:10a6:20b:46::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 19:06:51 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::79) by AM7PR04CA0018.outlook.office365.com
 (2603:10a6:20b:110::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Tue, 29 Sep 2020 19:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Tue, 29 Sep 2020 19:06:51 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Tue, 29 Sep 2020 19:06:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 342b4f1410f447d2
X-CR-MTA-TID: 64aa7808
Received: from f24ecbd73e48.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 324D209F-4770-4144-B832-9273A3F8DCEF.1;
	Tue, 29 Sep 2020 19:06:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f24ecbd73e48.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 29 Sep 2020 19:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7k/5AE8t0gSVVk8YxNjHmG7ck+QhprSbBKX6OIYqk6EMsWkMhdSkkiMjWYdbsPPAT/iIhKWBcNwXYb79OrKzK4ygYNiRFD7JWdM0HQjGxQ/PUhKAArajhYtx/EBrqevwrHSciaDRdHalMasE/LVCX5Uf9N7b87wUCTTJtetsTnyQ1Oa55WbswBsd4ao1qD2EuPuVlDznS5/8OoHeqjYFmdCfcRe6xkaPj4YfrLSKqPZbB7fPB2WNS5VZ7ouRcdvvaTupG9tBWRQRtU6mV9nqhRPCNb9EK+O8GsAPuC/A3HF/G2MO7p9P/OPYWWPAD94fhLG2gdVpo0yTZFCEmix0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3OAUCvlMc9kLn1Ozk88NEV0BqtcPLg4/8sxCq/HM1o=;
 b=kI5xBUlfjzzccgBE+yB3Az38mlJ3dUKzR3OXSh6n4sLYMcNLydOUFFvIz+/0nGmhQoiP276mGy61iRTavh1RrGVNv0lshuGkZmjhOM0vT+XEeEV/vcSyX6aM6UVkg5hDGC6QhDdleoQgCm68k+WAE0Qsi0iBHPOHKCcsD59RTx62Q5cqXMOPNMDgl6eQSWSFFNGeWBYhBcVqBORo8Iz4/OHziW5epNT3B98VrC6wn6z9focXmyQsSK3b3p4462ZRRFYIOJqalVtP5mPPa70zkCVN3JEH0tVml65YEm1BHH+Bt5U6jmy1RsI31MgHf66Vi0OZgpQ75ju1mKcJC4Povw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3OAUCvlMc9kLn1Ozk88NEV0BqtcPLg4/8sxCq/HM1o=;
 b=bGow8x5rGbh6Jdqrxuz5tD6otBwAt4wxIb7+olOTmsL3KHOEu6zsN9xBBU69+sXbu554r6tYp27BamGiPCm1KmgHFllMwsqw6UcCYyfCzkkg7Tz6pm6yiqfIDNd/8O14iWRenLuDVc/q9yDmBvsr4BGtVr0UPndYBSpKe3bFqJQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14)
 by AM6PR08MB3270.eurprd08.prod.outlook.com (2603:10a6:209:50::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Tue, 29 Sep
 2020 19:06:43 +0000
Received: from AM7PR08MB5301.eurprd08.prod.outlook.com
 ([fe80::cc0b:29bb:52b6:20b]) by AM7PR08MB5301.eurprd08.prod.outlook.com
 ([fe80::cc0b:29bb:52b6:20b%9]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 19:06:43 +0000
Date: Tue, 29 Sep 2020 20:06:40 +0100
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/u-boot: fix patches for a5ds
Message-ID: <20200929190640.qiejusonu2ad5jdp@arch-thunder.localdomain>
X-ClientProxiedBy: MRXP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::21) To AM7PR08MB5301.eurprd08.prod.outlook.com
 (2603:10a6:20b:dd::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.localdomain (109.49.46.234) by MRXP264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Tue, 29 Sep 2020 19:06:42 +0000
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 658156b2-cd82-4f1e-b135-08d864aad27c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3270:|AM6PR08MB3655:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3655CCB376F565D755DDCD38EA320@AM6PR08MB3655.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:218;OLM:218;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MOkKbpDRa5ttF45pTbrwc9bqzUZz8t0O+0sCE2kbfM5ZY888WjmRSsL8P0MjwuuNSe14kxhIqSlePV0+jzE0mWrg3DBjAVJii5Z4Z+9SnfOaGmReQpLN0K1jRkkmNhtec/k6CxadG4uKXaP7Jc/P51eJ10bEPoRz3HCGSJ859I5UVjJVeL8YAL+ErKCqBBhBJBhgUhGFUMPjI2IaEHasFOrF21kJl2j/8l+CO0qqNORkD7UnxQp2b1Rc9XLTgYcudCPE3voVu/caLhH6ajNjlXUFeWRE3la3kLBB5Wq82tXixi+u0wU1LPPGa1zhnxTeid8MGglmADaV1RuELXQkPYdEfH1ktZCCgMiv6wkmh3BE2O3/2CuTyerUkKhQmgARr2r73hhBLtGicRAXLMAeoKTDMzOAn9j58Kiq+YX0GHU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5301.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(83380400001)(316002)(4326008)(16526019)(186003)(2906002)(7696005)(956004)(6506007)(52116002)(1076003)(66556008)(66476007)(55016002)(8676002)(8936002)(6916009)(9686003)(86362001)(26005)(5660300002)(478600001)(66946007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 1vGhqjbvgCSqTxv35yYgXIyGz2YOh90o+l18wdZJ5fgVD6FuK9v4R6ux7hnF3qINPc6UK4382knDy/bOJPNJa0PQhsbSKEz0zIoXjaVGnGQRu1nSyoTRfhsUz87BSK8mZ+T1ypwqgx/7e1On+ExXkNmnyvw6+bndbisqBD2mh0aPe7te+ywf6UhDjq2KVDYz1FrJFeeBrjwZ/1OrqaZFBGxz3Q7TM3Lg0wF7TLy7sOmyMLuuoCOfyyDNq2dSIkPBn390BzRdLwE03xAL16VnyCvTyZ1/wwXVz4Mk5Ip8di+JdIc60ZP0fHSgEniU0yP24RYon6pFQezqSkG8ypCJkMHXbZaIU3gXFt5bayJ2GUhNckvVZGMDgNwoVImKZx5oBqOSc+nI342LFl3O6V0RxE/1CwagH7E++3Plu/yA63RscmLaT8Mchf+7KmOWUTEovHEKw2xgLxGBMK6Ffv/AxStfFY5mpDTIvVlKMPm3HZH6FZLyaWiDBZ4xZR7utADotP6brf/YNK6AyDjV1gQK5IiaUviVoP+NWP1AfuDtvmurnaDIVqeZhIiQcaSrhQHXeg7d3btajTLLQ8p/9dwe6xNDrpi1UkJwDvG9+0n6xq8sk1oaJ+gN4mHBixyj60Kus3KwSGow0oStfjrYchwELA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3270
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	499f1c3d-378b-4425-0f10-08d864aacdaa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4KUAoCrRC7f79oW5XBsgzOAWYo53oovflCiKYCXFG8784K0po7tO1oRu3Ymscd6An2/0NFVvfzZxMFPK3BvGGiTSdARTFdLOCzGmdNia44Dmto/7+n0kTLmWtBdQ4ikUM2+GRa7G7khVCRNqAMAFDShSJyj/oTZdCc7kqiIF0yKkzkYsuJHBUa07Cz0OCnEbjPLQTi1KbsahErD6M/TgBmu98KqQaAbBVBESdzNf8sWe50Z30HMGRF1YMfD8DQRiasaZ46Vt5uYnHCcEsoTWwfOyuPfhgtnSNGdFpemcAfmBH3GJiEwulcqNF6HTbwEiU/Gm8iLYRyFtMvkUoerY51To6UJssPzLBmyx6YEP6Jz/4jZ1tcN1K8cFHeTsu3lMHMu3njkGJuxcZLjB5UCBvn/Zod2zZjSyT6Gi0GRBqJQrNTKfJzH36+WpLOmHWKjI84DwHGgtqhxYhMF6c346Ww==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(46966005)(356005)(70206006)(82310400003)(70586007)(4326008)(81166007)(8676002)(478600001)(6916009)(47076004)(82740400003)(186003)(83380400001)(1076003)(16526019)(7696005)(86362001)(8936002)(55016002)(956004)(9686003)(336012)(2906002)(5660300002)(36906005)(6506007)(26005)(316002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 19:06:51.0357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 658156b2-cd82-4f1e-b135-08d864aad27c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3655
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Some of the patches for u-boot do not apply without
fuzz in 2020.07, rebase them so we do not have the
ugly warnings during do_patch

Change-Id: I0c89b18ed66adad66c7cf41373ca7cdd3fdea3da
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
---
 .../a5ds/0001-armv7-add-mmio-timer.patch      | 16 +++++-----
 ...-arm-add-designstart-cortex-a5-board.patch | 32 +++++++++----------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
index fe61ed5..e59afea 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
@@ -1,7 +1,7 @@
-From 864749afaf9b3f71ddaa519f4a770ce43e206912 Mon Sep 17 00:00:00 2001
+From 4449a6c2de38bdeb09e3158f6d9318812966243a Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH 1/3] armv7: add mmio timer
+Subject: [PATCH 1/2] armv7: add mmio timer
 
 This timer can be used by u-boot when arch-timer is not available in
 core, for example, Cortex-A5.
@@ -18,12 +18,12 @@ diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
 index 8c955d0d5284..82af9c031277 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
-@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
+@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
  obj-$(CONFIG_IPROC) += iproc-common/
  obj-$(CONFIG_KONA) += kona-common/
  obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
 +obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
-
+ 
  ifneq (,$(filter s5pc1xx exynos,$(SOC)))
  obj-y += s5p-common/
 diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
@@ -89,10 +89,10 @@ index 000000000000..5d6f66172398
 +      return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index 6908431d03cf..186001ecfb8c 100644
+index 916768f361d9..c8fd8c6e355a 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -3108,6 +3108,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+@@ -3075,6 +3075,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
  CONFIG_SYS_MMC_U_BOOT_OFFS
  CONFIG_SYS_MMC_U_BOOT_SIZE
  CONFIG_SYS_MMC_U_BOOT_START
@@ -100,6 +100,6 @@ index 6908431d03cf..186001ecfb8c 100644
  CONFIG_SYS_MONITOR_
  CONFIG_SYS_MONITOR_BASE
  CONFIG_SYS_MONITOR_BASE_EARLY
---
-2.26.2
+-- 
+2.28.0
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
index e8e1088..204bdb3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
@@ -1,7 +1,7 @@
-From d74c2d6f475bef05c114e859ab52bd721fbee7b2 Mon Sep 17 00:00:00 2001
+From eed15d394137616a18add204a85b0e9dd5b00e0b Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
-Subject: [PATCH 2/3] board: arm: add designstart cortex-a5 board
+Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
 
 Arm added a new board, designstart, with a cortex-a5 chip, add the
 default configuration, initialization and makefile for this system.
@@ -22,23 +22,23 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/designstart_ca5.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index bbb1e2738bfe..8f918f6e0375 100644
+index 54d65f84889f..7bc12f0b4300 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -636,6 +636,12 @@ config ARCH_BCM6858
-       select OF_CONTROL
-       imply CMD_DM
-
+@@ -665,6 +665,12 @@ config ARCH_BCM6858
+ 	select OF_CONTROL
+ 	imply CMD_DM
+ 
 +config TARGET_DESIGNSTART_CA5
-+      bool "Support Designstart Cortex-A5"
-+      select CPU_V7A
-+      select SEMIHOSTING
-+      select PL01X_SERIAL
++	bool "Support Designstart Cortex-A5"
++	select CPU_V7A
++	select SEMIHOSTING
++	select PL01X_SERIAL
 +
  config TARGET_VEXPRESS_CA15_TC2
-       bool "Support vexpress_ca15_tc2"
-       select CPU_V7A
-@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
+ 	bool "Support vexpress_ca15_tc2"
+ 	select CPU_V7A
+@@ -1866,6 +1872,7 @@ source "board/Marvell/gplugd/Kconfig"
  source "board/armadeus/apf27/Kconfig"
  source "board/armltd/vexpress/Kconfig"
  source "board/armltd/vexpress64/Kconfig"
@@ -304,6 +304,6 @@ index 000000000000..6db5b1cf4ac2
 +#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
 +#define CONFIG_ENV_IS_IN_FLASH                1
 +#endif
---
-2.26.2
+-- 
+2.28.0
 
-- 
2.28.0

