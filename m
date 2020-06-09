Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web12.7126.1591709271495808228
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jun 2020 06:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=C7V3k4Vp;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxBAvpOWK0SXhfgLtTxhxXr1nb2Sdjy1KIBr6MneIrY=;
 b=C7V3k4Vppr2V9O+kiDY2W1Tf/6sfA/l2AsJCxPsOfxyifiG+wykfLaIkhZY06cAzNxliAopCk3NMCgZnDspLXrOAKby6lAz7uYG2RXw+83pP0qXl2eyPFCajBM1JJqRbY+WAduA1ppA6TeP1e758sEsiQf8GVHOre6giN4BVllw=
Received: from AM5PR0601CA0076.eurprd06.prod.outlook.com (2603:10a6:206::41)
 by AM6PR08MB3527.eurprd08.prod.outlook.com (2603:10a6:20b:41::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 13:27:48 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::c8) by AM5PR0601CA0076.outlook.office365.com
 (2603:10a6:206::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Tue, 9 Jun 2020 13:27:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 13:27:48 +0000
Received: ("Tessian outbound 1145f7a293ca:v59"); Tue, 09 Jun 2020 13:27:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e57fb1a478d3b31
X-CR-MTA-TID: 64aa7808
Received: from f9c9d35918c0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2471BED8-E992-4522-A670-1B161C6DAAA3.1;
	Tue, 09 Jun 2020 13:27:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f9c9d35918c0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Jun 2020 13:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKb2UEYb7GdrxGGdQHmLSz067XeGKEvOjxQhIqWpHN9znk4eSaRqGMxjmf86Mj+vVeckRmbjKb8B2XT2QhiiKV8DO4zVbOBvhnR7cJZFUD5i+SijNlVUL7eHZzKllhWWm7c/uA8sVqcF/3UGOpBZrH5FFonYAC33wLVPEcHWU/3NKiU0sLSpuELZ0wrPyEkHxDduX8bGG+vp9ZY/vMHsNMgx2OSavwuTvorpwTaw5AUgoRB+LW/X8tTOjCm1Marjfw/vzd6G4hMfDqxDNdBszyjDJQoPKwKOJIEmYtU1Y2XgWdONqvLejdrtfjx3NfWNNrVYCiraqduu1GejeLfpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxBAvpOWK0SXhfgLtTxhxXr1nb2Sdjy1KIBr6MneIrY=;
 b=A6U+e5ywlNKtIf+YpKEiwotp1ZX5Lpl4PuTMQS7K/eIE7woyOqiZqpRgEb2HM6CGkIs5rtFmwQZVk7FsBbs2wlG7NGjqCauEGSMB1WenqGEdZ79SyLxs/pTe9GOjvdtsQhMVc/5W1RLvCMQDZdTuv4om9w7LHfDOfmhkInl1NgdErQ6UJSfS1MYMI/24MR9093h1WWDrYy6cOaN/cuOesHnWXcpl0WQZeG/CmB22tEw1y6AGe703eexperOk2jDSNnAl+JftkLjztD3hm69q4U4vDYvODVd6gPEqCVE3ZkVhgQZYYZX0Nd3BXtumTRCs3bCWYuO15OHaQg4H2KZF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxBAvpOWK0SXhfgLtTxhxXr1nb2Sdjy1KIBr6MneIrY=;
 b=C7V3k4Vppr2V9O+kiDY2W1Tf/6sfA/l2AsJCxPsOfxyifiG+wykfLaIkhZY06cAzNxliAopCk3NMCgZnDspLXrOAKby6lAz7uYG2RXw+83pP0qXl2eyPFCajBM1JJqRbY+WAduA1ppA6TeP1e758sEsiQf8GVHOre6giN4BVllw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB4578.eurprd08.prod.outlook.com (2603:10a6:208:100::21)
 by AM0PR08MB3666.eurprd08.prod.outlook.com (2603:10a6:208:dd::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 9 Jun
 2020 13:27:40 +0000
Received: from AM0PR08MB4578.eurprd08.prod.outlook.com
 ([fe80::18f:639d:1723:4968]) by AM0PR08MB4578.eurprd08.prod.outlook.com
 ([fe80::18f:639d:1723:4968%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 13:27:40 +0000
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH] arm-bsp: u-boot: rebase a5ds patches
Date: Tue,  9 Jun 2020 14:27:11 +0100
Message-Id: <20200609132711.68599-1-rui.silva@arm.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: MR2P264CA0065.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::29) To AM0PR08MB4578.eurprd08.prod.outlook.com
 (2603:10a6:208:100::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.local (109.49.46.234) by MR2P264CA0065.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 13:27:39 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4bc269c4-c0a2-4a1b-623f-08d80c78e702
X-MS-TrafficTypeDiagnostic: AM0PR08MB3666:|AM6PR08MB3527:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3527664B92793FAE0132A716EA820@AM6PR08MB3527.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:109;OLM:8882;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5uGxmOD8sCwtNmK+F58eNOLEUySM1u39/R8MpviM9/inboEKu/wymhk4eLf+JykXsp81sGp0w7t8uHs6UK0BbpZMRuFz1ydUNj106s/QTvgJIz8JUkssNPilF89s3P2zib93Mmkgmd0/7yrrH3x/BNZRCONS3XEcjIZv9rYldMvURK7U1boXNxlPQgzAZJyp88fQqEp1r2YH9y+v5/5F2x5z7BszEWGrfBuSijDxEEf4P7plNi2ZxwMk9exoM0BxgjZRggxlbOJqJuTUuE5mKinZmJEaVoJ7EB73Q7yhXwYLUPZ71N5j0iqDJamC13OMJOx10HmNjYcKVXwcUASwy/wlGYevx1raF/AmlP/ggmaNyYgRa4ulo5AW4iGD/hyiW9RtZVwKIX+jK1ii+D5Ozw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(36756003)(1076003)(5660300002)(316002)(66946007)(66556008)(66476007)(86362001)(956004)(6506007)(186003)(52116002)(4326008)(6512007)(8936002)(6916009)(16526019)(478600001)(83380400001)(8676002)(6486002)(26005)(2906002)(6666004)(2616005)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 p2b1v27jMwIY9/aSshX+3ya6s2ISXtX0j75+YS5JbMauGa84hbjNRBmUl4tejtulAOZiHuSG37KGHQwmP3TCFPV2YrYVKdX7gWNUSBaC8TwBZC4ex2kOW5WsuboOITk+I7VGs9buvcWOBvnPsGpHzLxlHaDCNeszO1Nlusp29uZ1wYeEzVQo2vfg4Mz9IqYHdDcXd5jD7Jph21rgk940bdujwEtOuzYVrQRSx1wov83qcOmLXOZWcNVgCkfW4QXY7U625MZ94EUeWR1V9VgmlFXVbWCr+os5ehXjwdWTwVlf9oCur75qpGkndJ3WEhnm421DIl6Z3Rqdfhih5xgqUxX6yNyUk+ENtW18I9r7Rcdf7O2oS6eSOJjw/E8powpBZMGtoVaXRsuYV7LvCyDgX2VpMk/A6mEkSsRXLWyXiLckOG/IggoaGb9yfSq24Ogpm4wO1YAlB5YtYWel1gdmEAwt10071L14WHt0c5LdNwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3666
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(70206006)(6916009)(356005)(6512007)(81166007)(82310400002)(5660300002)(36756003)(478600001)(8676002)(8936002)(956004)(1076003)(70586007)(82740400003)(47076004)(2616005)(2906002)(4326008)(336012)(186003)(6486002)(83380400001)(6506007)(16526019)(36906005)(6666004)(26005)(86362001)(316002)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eeb85f5f-38fc-4eb5-8ea8-08d80c78e1ed
X-Forefront-PRVS: 042957ACD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/iRX0W5Od56DsK0xt1Q4NgRHEr2Hha9eZPzVOG6KvH0D+FdQTzd9UVC8LaKilbMQPgdAZEwMfi/l2pzTJ5e3DPcJOFozHFc+bCC116EStTydS4zP8NPgA2dFyQDwohyniVcGNIJXnGNLIGaocViGD3VUqC3ddY6nW8oUXITInimro1vZwEHk51ylsHYmv5eYod2U1iXHUNfotz4dh0a/eIVL+J+MQLfmGOpsKIhc+VBEIrF3aXo+P8HBj/c1pObV6lKj3k7INaKLZTJqA3HN+uxvzjSuOEeZ/n9pfAtb8I9wLEMw+5X6wSiF2GDNZ91B9WnTmr/AJO5hd6W+CFreZ0oO6/KhG2dwEzjAbhb2+oXZv4y7qQ5JHHszkRkusD3aMhJcCuyqXqafgbUEEp6HbFHaM3Dwyh6GeSdXsciwMh4FnYJrc86+aEngHjkKKrfp
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 13:27:48.3577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc269c4-c0a2-4a1b-623f-08d80c78e702
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3527
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Rebase a5ds u-boot patches so, they apply clean in top of
latest u-boot.

Change-Id: I12e596ef8460429b540777e2a8646ed64f81fbac
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
---

Jon, when ok, please apply this also to dunfell branch.
Thanks.

 .../a5ds/0001-armv7-add-mmio-timer.patch      | 18 ++++----
 ...-arm-add-designstart-cortex-a5-board.patch | 42 +++++++++----------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio=
-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mm=
io-timer.patch
index fbf8a14fdf59..9dfb3094220c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.=
patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.=
patch
@@ -1,7 +1,7 @@
-From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 2001
+From 864749afaf9b3f71ddaa519f4a770ce43e206912 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH 1/2] armv7: add mmio timer
+Subject: [PATCH 1/3] armv7: add mmio timer

 This timer can be used by u-boot when arch-timer is not available in
 core, for example, Cortex-A5.
@@ -18,17 +18,17 @@ diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu=
/armv7/Makefile
 index 8c955d0d5284..82af9c031277 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
-@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     +=3D psci.o psci-common.o
+@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     +=3D psci.o psci-common.o
  obj-$(CONFIG_IPROC) +=3D iproc-common/
  obj-$(CONFIG_KONA) +=3D kona-common/
  obj-$(CONFIG_SYS_ARCH_TIMER) +=3D arch_timer.o
 +obj-$(CONFIG_SYS_MMIO_TIMER) +=3D mmio_timer.o
-
+
  ifneq (,$(filter s5pc1xx exynos,$(SOC)))
  obj-y +=3D s5p-common/
 diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_tim=
er.c
 new file mode 100644
-index 000000000000..1b905db8bb19
+index 000000000000..5d6f66172398
 --- /dev/null
 +++ b/arch/arm/cpu/armv7/mmio_timer.c
 @@ -0,0 +1,56 @@
@@ -89,10 +89,10 @@ index 000000000000..1b905db8bb19
 +      return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index cf1808e051c8..8624714ae7a6 100644
+index 6908431d03cf..186001ecfb8c 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -3138,6 +3138,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+@@ -3108,6 +3108,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
  CONFIG_SYS_MMC_U_BOOT_OFFS
  CONFIG_SYS_MMC_U_BOOT_SIZE
  CONFIG_SYS_MMC_U_BOOT_START
@@ -100,6 +100,6 @@ index cf1808e051c8..8624714ae7a6 100644
  CONFIG_SYS_MONITOR_
  CONFIG_SYS_MONITOR_BASE
  CONFIG_SYS_MONITOR_BASE_EARLY
---
-2.25.0
+--
+2.26.2

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-=
designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/a=
5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
index 3c527ae23a4a..7d02e5fee860 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designs=
tart-cortex-a5-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designs=
tart-cortex-a5-board.patch
@@ -1,7 +1,7 @@
-From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 2001
+From d74c2d6f475bef05c114e859ab52bd721fbee7b2 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
-Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
+Subject: [PATCH 2/3] board: arm: add designstart cortex-a5 board

 Arm added a new board, designstart, with a cortex-a5 chip, add the
 default configuration, initialization and makefile for this system.
@@ -22,33 +22,33 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/designstart_ca5.h

 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index f9dab073ea14..2cc9413114de 100644
+index bbb1e2738bfe..8f918f6e0375 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -628,6 +628,12 @@ config ARCH_BCM6858
-       select OF_CONTROL
-       imply CMD_DM
-
+@@ -636,6 +636,12 @@ config ARCH_BCM6858
+       select OF_CONTROL
+       imply CMD_DM
+
 +config TARGET_DESIGNSTART_CA5
-+      bool "Support Designstart Cortex-A5"
-+      select CPU_V7A
-+      select SEMIHOSTING
-+      select PL01X_SERIAL
++      bool "Support Designstart Cortex-A5"
++      select CPU_V7A
++      select SEMIHOSTING
++      select PL01X_SERIAL
 +
  config TARGET_VEXPRESS_CA15_TC2
-       bool "Support vexpress_ca15_tc2"
-       select CPU_V7A
-@@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
+       bool "Support vexpress_ca15_tc2"
+       select CPU_V7A
+@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
  source "board/armadeus/apf27/Kconfig"
  source "board/armltd/vexpress/Kconfig"
  source "board/armltd/vexpress64/Kconfig"
 +source "board/armltd/designstart/Kconfig"
+ source "board/cortina/presidio-asic/Kconfig"
  source "board/broadcom/bcm23550_w1d/Kconfig"
  source "board/broadcom/bcm28155_ap/Kconfig"
- source "board/broadcom/bcm963158/Kconfig"
 diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/K=
config
 new file mode 100644
-index 000000000000..6446fe3f4492
+index 000000000000..a9564e8655e2
 --- /dev/null
 +++ b/board/armltd/designstart/Kconfig
 @@ -0,0 +1,12 @@
@@ -66,7 +66,7 @@ index 000000000000..6446fe3f4492
 +endif
 diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/=
Makefile
 new file mode 100644
-index 000000000000..b64c905c7021
+index 000000000000..d2dc2b74ed85
 --- /dev/null
 +++ b/board/armltd/designstart/Makefile
 @@ -0,0 +1,8 @@
@@ -80,7 +80,7 @@ index 000000000000..b64c905c7021
 +obj-y :=3D designstart.o
 diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designs=
tart/designstart.c
 new file mode 100644
-index 000000000000..b0400f110ce2
+index 000000000000..658057a00330
 --- /dev/null
 +++ b/board/armltd/designstart/designstart.c
 @@ -0,0 +1,49 @@
@@ -178,7 +178,7 @@ index 000000000000..a2a756740295
 +
 diff --git a/include/configs/designstart_ca5.h b/include/configs/designsta=
rt_ca5.h
 new file mode 100644
-index 000000000000..79c4b36060d2
+index 000000000000..6db5b1cf4ac2
 --- /dev/null
 +++ b/include/configs/designstart_ca5.h
 @@ -0,0 +1,122 @@
@@ -304,6 +304,6 @@ index 000000000000..79c4b36060d2
 +#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
 +#define CONFIG_ENV_IS_IN_FLASH                1
 +#endif
---
-2.25.0
+--
+2.26.2

--
2.26.2

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
