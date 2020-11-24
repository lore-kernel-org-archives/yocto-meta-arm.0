Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.58])
 by mx.groups.io with SMTP id smtpd.web09.50842.1606217876759801647
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 03:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rPv01Nr8;
 spf=pass (domain: arm.com, ip: 40.107.1.58, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZQmQVpakOqFcFv3lbd7aXDTcNRh5kVpthDwIALFaeg=;
 b=rPv01Nr8QgwQ9vKB9sNsfts6uCYPJzeI9aF+gHDJoNeLzSOs00lYLbxYyEiNhvyNOcr9gOnEIaShijUgMpRTXR4aoplDFQU/HzkruUbvExUr/3cpvvcqIZQ3fTPfYi1BvSKzHAg5JHjYF0HYFUzSm6TXV8N0XDvOOtLaKAJSvRY=
Received: from AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) by VI1PR08MB4477.eurprd08.prod.outlook.com
 (2603:10a6:803:fb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Tue, 24 Nov
 2020 11:37:51 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::7a) by AM5PR0201CA0002.outlook.office365.com
 (2603:10a6:203:3d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 11:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 11:37:51 +0000
Received: ("Tessian outbound 39167997cde8:v71"); Tue, 24 Nov 2020 11:37:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9e94528f34c78fe
X-CR-MTA-TID: 64aa7808
Received: from fac664fe630f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 12FC5FF6-59F5-41BE-BD2C-EE567DC5BD84.1;
	Tue, 24 Nov 2020 11:36:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fac664fe630f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 11:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeNbEhNgV5D8njDC9W68t6BzgoAZzP6YbXpGGZ3FkpPSVJHn4aBteeQ3dpfD47BfxZfoIVXnTTXwBVjrRQbrVj3/5YLrt6WmNjiyWiHuXh9/BN7dsjwELHA1oLi0R/RvFFa29UFJv/di7Gn3BRF54OktcL9GOCvhuc3yhEEoMBybEhKsokEBYTUFzbZt0uk0asEvL5EDFSOt198aIt7h0DQE24CTKEGIZIkBd8jeDWgM1aJconwEvlrbsD5fb81m68Fb5TL4TVMrUkqN6YF24BCIWp5XfXMSVrUBkYJsomlWLg5xfhfTaLBJ3Oi3RezI4pu0oCuGG8GI3sCqjWQqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZQmQVpakOqFcFv3lbd7aXDTcNRh5kVpthDwIALFaeg=;
 b=oT1oHHeBKRBA20wnlKAqx63Qdfv+XH88xukVXge9VR1ZCPyfAzcNNaGMz9vkRwJlLfLhp+mV1NUxBGQr0gXAEC+22LxvpmKvSeM0mekZVcd8W7NkzDOKLWNIRXL9Db/mvBDSkhNbLmbp3iYaXZzLlCTJ4ipW7qqn8mnJLNmAEpzEuZsDiB9ETEFfby0OD8wfuIj/hwsHPWHP6xuk4R6K6gRcxEkmKqrJ5lI/CyuJOJlUVaD37q8Hg4vVXYju/A7vtmD5/tJItYepPwZPWF60GAxsRLXd9nMOdjRpfJBddrhtC01ZHUf8bUgJKACtwf93YF08huHbUc06WIdH3y7XuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZQmQVpakOqFcFv3lbd7aXDTcNRh5kVpthDwIALFaeg=;
 b=rPv01Nr8QgwQ9vKB9sNsfts6uCYPJzeI9aF+gHDJoNeLzSOs00lYLbxYyEiNhvyNOcr9gOnEIaShijUgMpRTXR4aoplDFQU/HzkruUbvExUr/3cpvvcqIZQ3fTPfYi1BvSKzHAg5JHjYF0HYFUzSm6TXV8N0XDvOOtLaKAJSvRY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DBBPR08MB6092.eurprd08.prod.outlook.com (2603:10a6:10:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 11:36:32 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21%7]) with mapi id 15.20.3564.028; Tue, 24 Nov 2020
 11:36:32 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 3/4] arm-bsp/u-boot: enabling the generic timer for Corstone-500
Date: Tue, 24 Nov 2020 11:36:20 +0000
Message-Id: <20201124113621.3663-4-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
References: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 11:36:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f455e66-6418-4fd7-b616-08d8906d6028
X-MS-TrafficTypeDiagnostic: DBBPR08MB6092:|VI1PR08MB4477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB44778B0A0390FDB9A970FAC2FDFB0@VI1PR08MB4477.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:313;OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 p6ptpjASusdkZgxJPt4GqqTlaIZ3ujUoDLJaOkDKZgvrdZHl+d2S2KX2xA5Xs1EUXSu3nbLLcM7tU0VKacrMIzsdZiqyO8AzJ/l5x88dceoBt1Ce9Wji5I/vWnhj3SaMDXwK1MN+s7BCXxuaby1oNl5s+9ZA8cv40RlN1FMJMyDZfK8DgXTRXZV/+5W2iGQtdNSR2qpzuaomEBwltkXrFUvZ/J9bpci9wVdrhn1LHxh938DPvX7aRPeqCfGiCKd6C85LqACuNUVatrKbwrtUmF4ej02FHzGvxaFZFrJpDmg+1hits/pbp5utNOCOw44Q90lS0xJE/7ZevqARYiEwQ7tb7DDZCy2M67aN0lgS0C1wGuDX0SK16FGan9t4ddcS
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(83380400001)(956004)(2616005)(4326008)(1076003)(316002)(478600001)(8936002)(86362001)(6486002)(9686003)(8676002)(66476007)(66556008)(66946007)(6666004)(186003)(36756003)(26005)(5660300002)(16526019)(52116002)(7696005)(2906002)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UWgkZ7rPz3yQoHgQZ2YFHDWQFr3fCJclrzHRU6bJxmajhgNbWfn1CpUlyOtDUbPam0sobL/OMh8qWBq7hMxGwyIfsWYD2MRvHKzwIZYFAqjogNSm16l4SI7anW/OvbsoezuF2f6jHhEhZCEdYh2fLe9Ve1HjzijiZjGSTRcMplrx28SL0+op0kTDjxEvyMjEvW4gpWViRy9zJa96xgBwI8ZBS4sG3qW4IE9NJg2uFcGwjIIm2/mwDyL887sR2OGbCjSbnqgvQTPDe6pTbdGmA512nKDNXUzfpGI1ZY4Wg0opZMRZQ5tZbEFNEKVYx3Kl04Z3Ek0GqYsRawGq1oZ5rzFaOpN1Zl4gG14gJcqLSxTEs8LZB6W3fNV8eFjwloJPxRu06qMGGUq4VELwAh6/cBcP9yiuQPxGfzBZ2a70PEc1gpxkFL9FJkG6XCr79XflCDh33wo621ImazTpwvERcC0s7btE6RD8Xs4GHayZ/X0Gp7Cw0cN3eguNCjsR2RM1Tt7grS6MVvFwKXxTQ5pof4K+6yj+K8ZP5YxrqlXegifsBab0RK28tZdc60bLdIu6bEXzS6KDvdiNk9Tb6ADyB+KrdAba+fGaIRyAhF4jt1BBchPnVrPLzuzy8s8rQ5znNZnzrKzgVwxyGd0H+pL/ceZ81rDPpLPYPADhegqGCnT5EUk6EMlOkcdqExhDzddTMZB5R76dyr/dI3VXehLs3/oa0WTWBn23Gobrf1d/IeE9PkIcIqfhMnkj522cDqW6X9rLe9mbgWdEWbQgb8Jyo/Bj4N9CooCUkI6PwBt0Sz8co8rG1mKGNPzpfE1z146aF6MN3T6BjfZ9rPaFlBjELB1mGmJDL4BNxdE+MGAq7vx3nMe65QZvqt8IZ5Zn50gkkg/tkVJa5pRZMMiTuEi3CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6092
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17d67633-9806-43da-309f-08d8906d311d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2mgZ63OVRh1l/0E8NJspVdOMqkLTaeA2RNo96K3ssCvVtLWMwvHJzNg7MLW20gmfLcfZ+22rYRn5RsWWozpEUSN3+y+5/zDJuOfCtoBmEwhE6ZLyohhO6wapYM7FYMokboQy1vqgm+fX/UdmU2PnPlAjfaI3ZICMI8yS/GCW286Puqs+gIZbJSs8uIHj6z3Cai1B56y9M4q3X5WF8VgY9PolZYAdJcgFkiOYD8QaFBvp6hz01gQ5nOrfLtASjatCfPHP9id/hJRvX+fyuPMYfTN5wU+M1dvkgmnS8oLsSd9ufmLqTwQLsxiYFzGu3MYv6ylnymArmNWKKM5uZYcxdipzYKKABg9sITWyr3INwRrc9y3/JwTrwlad4ARHCGTbXLzR/kntg2esio91ZBv8k7HCq10KkqctVJsWphrBNQk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966005)(82310400003)(478600001)(81166007)(83380400001)(36756003)(1076003)(2906002)(86362001)(5660300002)(336012)(6666004)(70586007)(70206006)(356005)(4326008)(6486002)(9686003)(8936002)(7696005)(16526019)(82740400003)(956004)(47076004)(8676002)(26005)(316002)(186003)(2616005)(36906005)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 11:37:51.1331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f455e66-6418-4fd7-b616-08d8906d6028
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4477
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit updates the ARMv7 generic timer driver by configuring
and enabling the timer.

Change-Id: I1fc1df83f40e28869d8dd41ff7b202f6fa177a1f
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 ...g-generic-timer-access-through-MMIO.patch} | 48 +++++++++++++------
 .../u-boot/u-boot_2020.07.bbappend            |  2 +-
 2 files changed, 35 insertions(+), 15 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/{0001-armv7-add-mmio-timer.patch => 0001-armv7-adding-generic-timer-access-through-MMIO.patch} (58%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
similarity index 58%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-add-mmio-timer.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
index e59afea..8ba35be 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-add-mmio-timer.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
@@ -1,21 +1,33 @@
-From 4449a6c2de38bdeb09e3158f6d9318812966243a Mon Sep 17 00:00:00 2001
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From b6879fc62b5ec01e3c87c2772d3a5e0f51c35f1c Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH 1/2] armv7: add mmio timer
+Subject: [PATCH] armv7: adding generic timer access through MMIO
+
+This driver enables the ARMv7 generic timer.
+
+The access to the timer registers is through memory mapping (MMIO).
+
+This driver can be used by u-boot to access to the timer through MMIO
+when arch_timer is not available in the core (access using system
+instructions not possible), for example, in case of Cortex-A5.
 
-This timer can be used by u-boot when arch-timer is not available in
-core, for example, Cortex-A5.
+This driver configures and enables the generic timer at
+the u-boot initcall level (timer_init) before u-boot relocation.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 ---
  arch/arm/cpu/armv7/Makefile     |  1 +
- arch/arm/cpu/armv7/mmio_timer.c | 56 +++++++++++++++++++++++++++++++++
+ arch/arm/cpu/armv7/mmio_timer.c | 64 +++++++++++++++++++++++++++++++++
  scripts/config_whitelist.txt    |  1 +
- 3 files changed, 58 insertions(+)
+ 3 files changed, 66 insertions(+)
  create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
 
 diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
-index 8c955d0d5284..82af9c031277 100644
+index 8c955d0d52..82af9c0312 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
 @@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
@@ -28,10 +40,10 @@ index 8c955d0d5284..82af9c031277 100644
  obj-y += s5p-common/
 diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
 new file mode 100644
-index 000000000000..5d6f66172398
+index 0000000000..82ff3937b6
 --- /dev/null
 +++ b/arch/arm/cpu/armv7/mmio_timer.c
-@@ -0,0 +1,56 @@
+@@ -0,0 +1,64 @@
 +// SPDX-License-Identifier: GPL-2.0+
 +/*
 + * Copyright (c) 2019, Arm Limited. All rights reserved.
@@ -47,22 +59,30 @@ index 000000000000..5d6f66172398
 +
 +#define CNTCTLBASE    0x1a020000UL
 +#define CNTREADBASE   0x1a030000UL
++#define CNTEN         (1 << 0)
++#define CNTFCREQ      (1 << 8)
 +
 +static inline uint32_t mmio_read32(uintptr_t addr)
 +{
 +      return *(volatile uint32_t*)addr;
 +}
 +
-+int timer_init(void)
++static inline void mmio_write32(uintptr_t addr, uint32_t data)
 +{
-+      gd->arch.timer_rate_hz = mmio_read32(CNTCTLBASE);
++      *(volatile uint32_t*)addr = data;
++}
 +
++int timer_init(void)
++{
++      gd->arch.timer_rate_hz = COUNTER_FREQUENCY / CONFIG_SYS_HZ; /* calculating the frequency in ms */
++      mmio_write32(CNTCTLBASE + 0x20, COUNTER_FREQUENCY); /* configuring CNTFID0 register: setting the base frequency */
++      mmio_write32(CNTCTLBASE, CNTFCREQ | CNTEN); /* configuring CNTCR register: enabling the generic counter and selecting the first frequency entry */
 +      return 0;
 +}
 +
 +unsigned long long get_ticks(void)
 +{
-+      return ((mmio_read32(CNTCTLBASE + 0x4) << 32) |
++      return ((mmio_read32(CNTREADBASE + 0x4) << 32) |
 +              mmio_read32(CNTREADBASE));
 +}
 +
@@ -89,7 +109,7 @@ index 000000000000..5d6f66172398
 +      return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index 916768f361d9..c8fd8c6e355a 100644
+index 916768f361..c8fd8c6e35 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
 @@ -3075,6 +3075,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
@@ -101,5 +121,5 @@ index 916768f361d9..c8fd8c6e355a 100644
  CONFIG_SYS_MONITOR_BASE
  CONFIG_SYS_MONITOR_BASE_EARLY
 -- 
-2.28.0
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index c4bd3d2..1a1df27 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -9,7 +9,7 @@ FILESEXTRAPATHS_prepend_foundation-armv8 = "${THIS_DIR}/${BP}/fvp-common:"
 # Corstone-500 MACHINE
 #
 SRC_URI_append_corstone500 = " \
-                   file://0001-armv7-add-mmio-timer.patch \
+                   file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \
                    file://0002-board-arm-add-corstone500-board.patch"
 
 #
-- 
2.17.1

