Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.62])
 by mx.groups.io with SMTP id smtpd.web12.22034.1595433189210947618
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jul 2020 08:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bIxuoDbH;
 spf=pass (domain: arm.com, ip: 40.107.5.62, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tSSi3uIhQFWM0UITYKP0OSnb44uE524CYkWJjqlR3U=;
 b=bIxuoDbH/AUnVbUpl8OqeL5VPq0UFFtBMObt8Bf6IaI0dWkQcIWlhBwsF36cyWE29wTv4ruCuPyOCZU9ymX/srbLYx/4DG0Rjw42Ehpjl6y+Emww4HmUTmzFK4yD8aGM4VQjzZqFeIyy3kVd29P8LqiJJJDCWmyB41joINZxo9I=
Received: from AM6PR05CA0034.eurprd05.prod.outlook.com (2603:10a6:20b:2e::47)
 by AM6PR08MB3496.eurprd08.prod.outlook.com (2603:10a6:20b:4e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Wed, 22 Jul
 2020 15:53:06 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::9e) by AM6PR05CA0034.outlook.office365.com
 (2603:10a6:20b:2e::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Wed, 22 Jul 2020 15:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Wed, 22 Jul 2020 15:53:05 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Wed, 22 Jul 2020 15:53:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b34cdecd3a6361f4
X-CR-MTA-TID: 64aa7808
Received: from 03fd4ae88476.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 936832E0-3C89-42B6-803D-1D3EEF69AE69.1;
	Wed, 22 Jul 2020 15:52:59 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03fd4ae88476.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 22 Jul 2020 15:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR7PsgfAQ9hTJOnovoDBW32zF++1ePM2fP/eRAyghDGcg+3S7oLX5Ps4JZr0f7ix6Qp8PEATZdo7puUWdS4gceCSQYiR74ar9btdIxGkmM5vC1Qv3aOoWoYqBMwsWrKQeuLAmnFLSr+I9caVNMtv8Sf0I1HzEL5HxhYMbfVJIdTB1zmgIPGKagSvfkfOAqYsfyVplG9hV6Bt6NUAWV3XmOlzFFFyZr70mvVY32A1i5khH4j/rzGkVOhRUhGwU9xje7IBiBbkCcJ/NCm2UDXOHeNHi9TnSYcWCnO3IGH9lhSOgLJ8LQRWmZLcMFbC4RDGbAOmXJqc0QY06IShDtEOTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tSSi3uIhQFWM0UITYKP0OSnb44uE524CYkWJjqlR3U=;
 b=MXt1Toh2IGRJXaU9ky8iH2OCyahiId64KVgQqV42P4XXGQEJjwJCkALgT/O4/3/gjpH/peHvKiX2HYxL8ZEaByhpWJjzFFRFBnQtky/aypyTpVeFZXXD8rEXoVYRqSspjCMi1kscnn0NL96DbvpMmXmwBw3X5inngUoM7nttVYsSGAgfzliTSg2hXpCHyiOdxAIYE0UHIBKWkaBkt/8Xm1oQbTmzGSAAYG+LN8ZfVE54XOocM4aO6TEgkR2nfPA4fOTz9GQj5rgCHx8XIXnRObRRWWRlEaN4e0c9X0FBGZjyDoKZb019LWSNXPyvfbIGS7edzc/gKcOxLXWL9mtgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tSSi3uIhQFWM0UITYKP0OSnb44uE524CYkWJjqlR3U=;
 b=bIxuoDbH/AUnVbUpl8OqeL5VPq0UFFtBMObt8Bf6IaI0dWkQcIWlhBwsF36cyWE29wTv4ruCuPyOCZU9ymX/srbLYx/4DG0Rjw42Ehpjl6y+Emww4HmUTmzFK4yD8aGM4VQjzZqFeIyy3kVd29P8LqiJJJDCWmyB41joINZxo9I=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3681.eurprd08.prod.outlook.com (2603:10a6:208:fd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 22 Jul
 2020 15:52:57 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3216.020; Wed, 22 Jul 2020
 15:52:57 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Fix a5ds dunfell support
Date: Wed, 22 Jul 2020 11:52:50 -0400
Message-Id: <20200722155250.27552-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN6PR2101CA0005.namprd21.prod.outlook.com
 (2603:10b6:805:106::15) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by SN6PR2101CA0005.namprd21.prod.outlook.com (2603:10b6:805:106::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.1 via Frontend Transport; Wed, 22 Jul 2020 15:52:55 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 22 Jul 2020 11:52:50 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d70f06f-1783-4e5b-4c2f-08d82e5752d6
X-MS-TrafficTypeDiagnostic: AM0PR08MB3681:|AM6PR08MB3496:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3496754A81BE3DD07EE90A05F0790@AM6PR08MB3496.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 s78LVh8UU+JR4m/g1oOlnExr31YqFpSglLH97kQt7J6eiPuBClxztdw6vDsJqa5fioyRxbTW3IpQvkTMaeFbFNWo/3wRFLx1odLlfCMR4DJiEGXpcLj/mZ13CD66JoO+kvM2fBeojYATNGMFfEzwGxjvEK/L3w4zfyrxyDiLBUJ4rd77rr/vUk66ill6PC4f1/ZGo/2VN57+6BVyWi5pHfRFpehNYyfAh9W5S/PPSzvcNndRDCNV0c/YG8yj4v3zAS5BdbS1NimUAPWVkDxcBtP7g8yX8CcbmHG/E4dbApdcF9wrJEVbAzuARvcy5+Os5BSYxEOiLF+2/zMIwlhOs7ruxRyaDA3rDWzTgXsXJlLPhJ5vYAM0HTZlYaPMiUTWm92sdU0Hki/hojgOZYYHcw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(44832011)(186003)(66946007)(66556008)(26005)(66476007)(2616005)(426003)(478600001)(36756003)(6916009)(30864003)(83380400001)(5660300002)(4326008)(86362001)(42186006)(316002)(8676002)(1076003)(2906002)(52116002)(8936002)(42413003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 tRb1W4R2cYvL4FKm1Ne9wSNnj4SFdsqG86CLSUsAljS9gvMEqtWWXqpMrSMtyMho9KYbXsFYXpoeWGkZQJI0rD+JOcm4LRiDfnged7ZbxC/lplp2PIAcl65DU3gpK87TZrG7LqUuSRsJClLjF/cvFVamNP6FTz1TsV8fmBxmfS9PAzAwJdCAVsm8Y32UEGBhzr6nnj+ZffQvtCsAueIpz34OZbmlH4vI2ru4m6JyXH75+Wwep/304pV71OpdjYpTNnYdKnBdbW8OtTeH749D5fOvnulN/A4h3OnzJNETZWu3BkgjQ2QlXljgxYWhtNrJfeV120ha+RtJ8Y4s/Bqvb89fy9SL5aOy3K7wHwSsENaj63arxpLQ9bbLuSnX7wME/BT8S1a1gjVTAzWD/8SmAgD++ccBMQnLRQQFZ/+SL9lXW/Ckz7bOUwTgTzULRrK8ctDUo+LQeWdeRnsyyAExvKAThNkWxDBED9ioui6FkjcO9AsuAn3IWSVG9Q0eAQXq
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3681
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95d0fc92-042a-4567-4fe5-08d82e574d3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yFQb2vE4rxwB843b/iwbzlOMkYgBwL9gKXt8aliJrHDwVMqDirwF8gukeIcBY9umb6OMsAGx4UoQ3k+gqg18grFcO0UVtUTGlFVbQbpPnDiaTBaLwzsIVjPpdx9j6Jj0/AT1lq3r7+YrIYk0xPdAWjjvZrDkHtP0QhITiMZNvTTbz1FvdeuEQ8YDLskynVoZaZzYTPSyltFRMCSbE0JI8HqKMUJ8a+xlSgyCukDrNqgtqJH4wEOAtllDoDKiKNlJSF+B9uyi3GrJIk/sLyAhw825dj6HF4hig/ONjEVmZSpo8LL7PZZI7hQGzV+zPAjzirHNFUZrKck/Ol3Sh/4DD+jOPhOSl873PPz2Rr2R4pPsJT4BII2hGEpu4EaYHLXqTxKHEsfu+mBfZ+E3VqDlFCglcrw07g1/XHcijGjzh2RrCwhk/c80QP2ivdeQhgx5
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(356005)(478600001)(81166007)(336012)(82310400002)(8676002)(86362001)(8936002)(36756003)(47076004)(2906002)(82740400003)(4326008)(83380400001)(6916009)(186003)(30864003)(1076003)(70206006)(44832011)(70586007)(26005)(36906005)(2616005)(5660300002)(42186006)(426003)(316002)(42413003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 15:53:05.8953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d70f06f-1783-4e5b-4c2f-08d82e5752d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3496
Content-Type: text/plain

Commit 65d336c807bf updated the u-boot patches to work with newer
u-boots, but broke dunfell support by them not cleanly applying on
u-boot 2020.01.  To address this, take the original version of the
patches and put them in a location that will uniquely apply to the
dunfell version of u-boot.  Also, move the newer version of the
patches to a place that will only apply for it.

Fixes: 65d336c807bf ("arm-bsp: u-boot: rebase a5ds patches")
Change-Id: I993ee097de709aa51ff28a6b00b7b4330bebd1ff
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../a5ds/0001-armv7-add-mmio-timer.patch      | 105 ++++++
 ...-arm-add-designstart-cortex-a5-board.patch | 309 ++++++++++++++++++
 .../a5ds/0001-armv7-add-mmio-timer.patch      |   0
 ...-arm-add-designstart-cortex-a5-board.patch |   0
 4 files changed, 414 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.07}/a5ds/0001-armv7-add-mmio-timer.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.07}/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch (100%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
new file mode 100644
index 0000000..fbf8a14
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0001-armv7-add-mmio-timer.patch
@@ -0,0 +1,105 @@
+From 8525c72c438b0aa66f1f38db37bd7aacf7e3ce34 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 18 Dec 2019 21:52:34 +0000
+Subject: [PATCH 1/2] armv7: add mmio timer
+
+This timer can be used by u-boot when arch-timer is not available in
+core, for example, Cortex-A5.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/cpu/armv7/Makefile     |  1 +
+ arch/arm/cpu/armv7/mmio_timer.c | 56 +++++++++++++++++++++++++++++++++
+ scripts/config_whitelist.txt    |  1 +
+ 3 files changed, 58 insertions(+)
+ create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
+
+diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
+index 8c955d0d5284..82af9c031277 100644
+--- a/arch/arm/cpu/armv7/Makefile
++++ b/arch/arm/cpu/armv7/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     += psci.o psci-common.o
+ obj-$(CONFIG_IPROC) += iproc-common/
+ obj-$(CONFIG_KONA) += kona-common/
+ obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
++obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
+
+ ifneq (,$(filter s5pc1xx exynos,$(SOC)))
+ obj-y += s5p-common/
+diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
+new file mode 100644
+index 000000000000..1b905db8bb19
+--- /dev/null
++++ b/arch/arm/cpu/armv7/mmio_timer.c
+@@ -0,0 +1,56 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright (c) 2019, Arm Limited. All rights reserved.
++ *
++ */
++
++#include <common.h>
++#include <asm/io.h>
++#include <div64.h>
++#include <bootstage.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++#define CNTCTLBASE    0x1a020000UL
++#define CNTREADBASE   0x1a030000UL
++
++static inline uint32_t mmio_read32(uintptr_t addr)
++{
++      return *(volatile uint32_t*)addr;
++}
++
++int timer_init(void)
++{
++      gd->arch.timer_rate_hz = mmio_read32(CNTCTLBASE);
++
++      return 0;
++}
++
++unsigned long long get_ticks(void)
++{
++      return ((mmio_read32(CNTCTLBASE + 0x4) << 32) |
++              mmio_read32(CNTREADBASE));
++}
++
++ulong get_timer(ulong base)
++{
++      return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
++}
++
++void __udelay(unsigned long usec)
++{
++      unsigned long endtime;
++
++      endtime = lldiv((unsigned long long)usec * gd->arch.timer_rate_hz,
++                      1000UL);
++
++      endtime += get_ticks();
++
++      while (get_ticks() < endtime)
++              ;
++}
++
++ulong get_tbclk(void)
++{
++      return gd->arch.timer_rate_hz;
++}
+diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
+index cf1808e051c8..8624714ae7a6 100644
+--- a/scripts/config_whitelist.txt
++++ b/scripts/config_whitelist.txt
+@@ -3138,6 +3138,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+ CONFIG_SYS_MMC_U_BOOT_OFFS
+ CONFIG_SYS_MMC_U_BOOT_SIZE
+ CONFIG_SYS_MMC_U_BOOT_START
++CONFIG_SYS_MMIO_TIMER
+ CONFIG_SYS_MONITOR_
+ CONFIG_SYS_MONITOR_BASE
+ CONFIG_SYS_MONITOR_BASE_EARLY
+--
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
new file mode 100644
index 0000000..3c527ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
@@ -0,0 +1,309 @@
+From 2417d0991f73ee2c83946fcac208a7d6894f4530 Mon Sep 17 00:00:00 2001
+From: Rui Miguel Silva <rui.silva@linaro.org>
+Date: Wed, 8 Jan 2020 09:48:11 +0000
+Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
+
+Arm added a new board, designstart, with a cortex-a5 chip, add the
+default configuration, initialization and makefile for this system.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/Kconfig                       |   7 ++
+ board/armltd/designstart/Kconfig       |  12 +++
+ board/armltd/designstart/Makefile      |   8 ++
+ board/armltd/designstart/designstart.c |  49 ++++++++++
+ configs/designstart_ca5_defconfig      |  37 ++++++++
+ include/configs/designstart_ca5.h      | 122 +++++++++++++++++++++++++
+ 6 files changed, 235 insertions(+)
+ create mode 100644 board/armltd/designstart/Kconfig
+ create mode 100644 board/armltd/designstart/Makefile
+ create mode 100644 board/armltd/designstart/designstart.c
+ create mode 100644 configs/designstart_ca5_defconfig
+ create mode 100644 include/configs/designstart_ca5.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index f9dab073ea14..2cc9413114de 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -628,6 +628,12 @@ config ARCH_BCM6858
+       select OF_CONTROL
+       imply CMD_DM
+
++config TARGET_DESIGNSTART_CA5
++      bool "Support Designstart Cortex-A5"
++      select CPU_V7A
++      select SEMIHOSTING
++      select PL01X_SERIAL
++
+ config TARGET_VEXPRESS_CA15_TC2
+       bool "Support vexpress_ca15_tc2"
+       select CPU_V7A
+@@ -1782,6 +1788,7 @@ source "board/Marvell/gplugd/Kconfig"
+ source "board/armadeus/apf27/Kconfig"
+ source "board/armltd/vexpress/Kconfig"
+ source "board/armltd/vexpress64/Kconfig"
++source "board/armltd/designstart/Kconfig"
+ source "board/broadcom/bcm23550_w1d/Kconfig"
+ source "board/broadcom/bcm28155_ap/Kconfig"
+ source "board/broadcom/bcm963158/Kconfig"
+diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
+new file mode 100644
+index 000000000000..6446fe3f4492
+--- /dev/null
++++ b/board/armltd/designstart/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_DESIGNSTART_CA5
++
++config SYS_BOARD
++      default "designstart"
++
++config SYS_VENDOR
++      default "armltd"
++
++config SYS_CONFIG_NAME
++      default "designstart_ca5"
++
++endif
+diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/Makefile
+new file mode 100644
+index 000000000000..b64c905c7021
+--- /dev/null
++++ b/board/armltd/designstart/Makefile
+@@ -0,0 +1,8 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2020 ARM Limited
++# (C) Copyright 2020 Linaro
++# Rui Miguel Silva <rui.silva@linaro.org>
++#
++
++obj-y := designstart.o
+diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designstart/designstart.c
+new file mode 100644
+index 000000000000..b0400f110ce2
+--- /dev/null
++++ b/board/armltd/designstart/designstart.c
+@@ -0,0 +1,49 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/platform_data/serial_pl01x.h>
++#include <malloc.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++static const struct pl01x_serial_platdata serial_platdata = {
++      .base = V2M_UART0,
++      .type = TYPE_PL011,
++      .clock = CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DEVICE(designstart_serials) = {
++      .name = "serial_pl01x",
++      .platdata = &serial_platdata,
++};
++
++int board_init(void)
++{
++      return 0;
++}
++
++int dram_init(void)
++{
++      gd->ram_size = PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++int dram_init_banksize(void)
++{
++      gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
++      gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++void reset_cpu(ulong addr)
++{
++}
++
+diff --git a/configs/designstart_ca5_defconfig b/configs/designstart_ca5_defconfig
+new file mode 100644
+index 000000000000..a2a756740295
+--- /dev/null
++++ b/configs/designstart_ca5_defconfig
+@@ -0,0 +1,37 @@
++CONFIG_ARM=y
++CONFIG_TARGET_DESIGNSTART_CA5=y
++CONFIG_SYS_TEXT_BASE=0x88000000
++CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_NR_DRAM_BANKS=1
++CONFIG_IDENT_STRING=" ca5ds aarch32"
++CONFIG_BOOTDELAY=1
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1a200000 root=/dev/ram0 rw loglevel=9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=y
++CONFIG_SYS_PROMPT="ca5ds32# "
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_IMLS is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_MEMTEST=y
++CONFIG_MTD_NOR_FLASH=y
++# CONFIG_CMD_LOADS is not set
++CONFIG_CMD_ARMFLASH=y
++# CONFIG_CMD_FPGA is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_CACHE=y
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=y
++CONFIG_DM=y
++CONFIG_DM_SERIAL=y
++CONFIG_OF_LIBFDT=y
++
+diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
+new file mode 100644
+index 000000000000..79c4b36060d2
+--- /dev/null
++++ b/include/configs/designstart_ca5.h
+@@ -0,0 +1,122 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ * Configuration for Cortex-A5 Designstart. Parts were derived from other ARM
++ * configurations.
++ */
++
++#ifndef __DESISGNSTART_CA5_H
++#define __DESISGNSTART_CA5_H
++
++#define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
++#define CONFIG_SKIP_LOWLEVEL_INIT
++
++/* Generic Timer Definitions */
++#define CONFIG_SYS_HZ_CLOCK   7500000
++#define CONFIG_SYS_HZ         1000
++#define COUNTER_FREQUENCY     CONFIG_SYS_HZ_CLOCK
++
++#ifdef CONFIG_DESIGNSTART_MEMORY_MAP_EXTENDED
++#define V2M_SRAM0             0x00010000
++#define V2M_SRAM1             0x02200000
++#define V2M_QSPI              0x0A800000
++#else
++#define V2M_SRAM0             0x00000000
++#define V2M_SRAM1             0x02000000
++#define V2M_QSPI              0x08000000
++#endif
++
++#define V2M_DEBUG             0x10000000
++#define V2M_BASE_PERIPH               0x1A000000
++#define V2M_A5_PERIPH         0x1C000000
++#define V2M_L2CC_PERIPH               0x1C010000
++
++#define V2M_MASTER_EXPANSION0 0x40000000
++#define V2M_MASTER_EXPANSION1 0x60000000
++
++#define V2M_BASE              0x80000000
++
++#define V2M_PERIPH_OFFSET(x)  (x << 16)
++
++#define V2M_SYSID             (V2M_BASE_PERIPH)
++#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++#define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
++#define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
++#define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
++#define V2M_TIMER0            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(5))
++
++#define V2M_WATCHDOG_CTL      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(16))
++#define V2M_WATCHDOG_REFRESH  (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(17))
++
++#define V2M_UART0             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
++#define V2M_UART1             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
++
++#define V2M_RTC                       (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
++#define V2M_TRNG              (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
++
++/* PL011 Serial Configuration */
++#define CONFIG_CONS_INDEX     0
++#define CONFIG_PL011_CLOCK    7500000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1          (V2M_BASE)
++
++/* Top 16MB reserved for secure world use */
++#define DRAM_SEC_SIZE         0x01000000
++#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN (CONFIG_ENV_SIZE + (8 << 20))
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_LOAD_ADDR  (V2M_BASE + 0x10000000)
++
++#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
++
++#define CONFIG_SYS_MMIO_TIMER
++
++/* Enable memtest */
++#define CONFIG_SYS_MEMTEST_START      PHYS_SDRAM_1
++#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE)
++
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++                              "kernel_name=Image\0"           \
++                              "kernel_addr=0x80F00000\0"      \
++                              "initrd_name=ramdisk.img\0"     \
++                              "initrd_addr=0x84000000\0"      \
++                              "fdt_name=devtree.dtb\0"        \
++                              "fdt_addr=0x83000000\0"         \
++                              "fdt_high=0xffffffff\0"         \
++                              "initrd_high=0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND    "echo copy to RAM...; " \
++                              "cp.b 0x80100000 $kernel_addr 0xB00000; " \
++                              "cp.b 0x80D00000 $initrd_addr 0x800000; " \
++                              "bootz $kernel_addr $initrd_addr $fdt_addr"
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size */
++#define CONFIG_SYS_MAXARGS            64      /* max command args */
++
++#define CONFIG_SYS_FLASH_BASE         0x80000000
++/* 256 x 256KiB sectors */
++#define CONFIG_SYS_MAX_FLASH_SECT     256
++/* Store environment at top of flash */
++#define CONFIG_ENV_ADDR                       0x0A7C0000
++#define CONFIG_ENV_SECT_SIZE          0x00040000
++
++#define CONFIG_SYS_FLASH_CFI          1
++#define CONFIG_FLASH_CFI_DRIVER               1
++#define CONFIG_SYS_FLASH_CFI_WIDTH    FLASH_CFI_32BIT
++#define CONFIG_SYS_MAX_FLASH_BANKS    1
++
++#define CONFIG_SYS_FLASH_USE_BUFFER_WRITE /* use buffered writes */
++#define CONFIG_SYS_FLASH_PROTECTION   /* The devices have real protection */
++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
++#define FLASH_MAX_SECTOR_SIZE         0x00040000
++#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
++#define CONFIG_ENV_IS_IN_FLASH                1
++#endif
+--
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0001-armv7-add-mmio-timer.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
-- 
2.17.1

