Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.61])
 by mx.groups.io with SMTP id smtpd.web11.19160.1594731536319600449
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 05:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2kKfmjQg;
 spf=pass (domain: arm.com, ip: 40.107.1.61, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jpMq8pScGOoE7jRBUyfHT8RtupjP+RyKGxE1pm7Cbo=;
 b=2kKfmjQgYyGRy9JJNuH9VBPlG3JfRjyUo3hkX7jI7+54B+7GStlfqSNTdmx2CSCwgJqFwei9t7rq5M8G9I7nl7pF/zDhAakFMuYK/UMwbvOMgy3+45C09S+hHLISn63pmg9aPEdShjrdKd1S48Fxf/1+WwVbxohkxulMXNwYDqU=
Received: from DB6PR0802CA0035.eurprd08.prod.outlook.com (2603:10a6:4:a3::21)
 by AM6PR08MB4566.eurprd08.prod.outlook.com (2603:10a6:20b:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Tue, 14 Jul
 2020 12:58:53 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::95) by DB6PR0802CA0035.outlook.office365.com
 (2603:10a6:4:a3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Tue, 14 Jul 2020 12:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 12:58:53 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Tue, 14 Jul 2020 12:58:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8965ed46c8916be9
X-CR-MTA-TID: 64aa7808
Received: from 92056e812faa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 75E0D3D9-AF49-4589-80EF-2C3E121E0A21.1;
	Tue, 14 Jul 2020 12:58:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92056e812faa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Jul 2020 12:58:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/ujHNgQT9FYJaK7QAiN9bebOQNSgZ5SvFjSbu/uALQUBnBKpDE6eJtlHQWpCKHveri0QJlsW6MdpGsTl+AyaxZu4wKTZFTTpKjMeL2xv503etf4zfBkVgUFFJROdab3QCf0H2wrdiIH8cNMqLqP2kAZhGkku6POgYl7mGeDvuJxuBsNFGHPDHU28YjiPUaARIdfc064JzDlaw3ECWUdClswHnIooaL3pqWiCR0As9Dtqp59B0JzZxQzw95rcTOplWE4CwWfbeB+dzeK+C5ynnWeEz97wlCgyJMI/36igPpuB8m7fgaRDZ3PyD3bN4n8PnvU5qxX/EK7ez3jvisZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jpMq8pScGOoE7jRBUyfHT8RtupjP+RyKGxE1pm7Cbo=;
 b=gzUsddnbXyzE0gbzY1Lbax+g3qJsHccaMBCMnwT72xLEr4JsI/0mz565wVgFTr7CZcGYKUTHzEshU+I4ISl88JufRzA+vObESP0Gq29meIL1hWfClWt7gso5wC5dP5bawy6M64USpUL5MFD9y+xAduy68iHk7qOqoMh+3B4HmqXcn8wLMhon18WQ8UTPU/OsHQlXg1r8W0XyiajYgwir2anMjiUrlJivt+zBmyjMqP6PJXHC55H6k3nZGRkD2mg8kdhZBZ9YMwTrps8bSMQjTM6u0hXEW4zH9PTF/0X4tDR1amE9qAv2BF0IdWOBCFUN01jAYLo7Fc6hW0por8VjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jpMq8pScGOoE7jRBUyfHT8RtupjP+RyKGxE1pm7Cbo=;
 b=2kKfmjQgYyGRy9JJNuH9VBPlG3JfRjyUo3hkX7jI7+54B+7GStlfqSNTdmx2CSCwgJqFwei9t7rq5M8G9I7nl7pF/zDhAakFMuYK/UMwbvOMgy3+45C09S+hHLISn63pmg9aPEdShjrdKd1S48Fxf/1+WwVbxohkxulMXNwYDqU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com (2603:10a6:20b:a3::11)
 by AM6PR08MB3557.eurprd08.prod.outlook.com (2603:10a6:20b:4f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Tue, 14 Jul
 2020 12:58:46 +0000
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44]) by AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44%6]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 12:58:46 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] arm-bsp: Fix tc0 compile
Date: Tue, 14 Jul 2020 08:58:32 -0400
Message-Id: <20200714125834.31338-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714125834.31338-1-jon.mason@arm.com>
References: <20200714125834.31338-1-jon.mason@arm.com>
X-ClientProxiedBy: SN6PR01CA0033.prod.exchangelabs.com (2603:10b6:805:b6::46)
 To AM6PR08MB3974.eurprd08.prod.outlook.com (2603:10a6:20b:a3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN6PR01CA0033.prod.exchangelabs.com (2603:10b6:805:b6::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 12:58:44 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 14 Jul 2020 08:58:40 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d41e3ad6-0d5d-452f-0650-08d827f5a95b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3557:|AM6PR08MB4566:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4566715DC7FF1CC89CC57B36F0610@AM6PR08MB4566.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0DFfrTMeQFDU3bGdXIRBJgYtU8ilTc9DboTTZTDuGGwNnr1Dgs2fAn8cHrLvlTsOVZrrUnXnm2LBL+IlNkfc3W/ovUOzUDyI/3YZ7+TP+Iy8zvVqGhegNu0kyH4t00sxZlgUewdgrZtRGtz9tSguITwgsbWclZ8K+wBAEBHjRAwC5Afhu4K53PJLu1XVnrOuPA9VCgNjKU8OMCMEUkftx1/7Sc83Y8tuaGBt58PYY/OkJDhU52QdgpuLKT045TA9rsxzzd/4PfKGsRpJiM4EBJ6wlZLbVAvdEjzClV9hq2SVsyxfu46xplq7WGTvJUaI
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(26005)(5660300002)(426003)(2616005)(66946007)(186003)(66556008)(8936002)(44832011)(8676002)(86362001)(66476007)(478600001)(52116002)(316002)(1076003)(36756003)(42186006)(83380400001)(6916009)(4326008)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 WpXf1n4Qr6ILHgILvEbYyPHiPfLgvS4PANiFhYJRGM7KNZOrNB+iPPnQKg7Fn94rjluQcI4w5HJq7eFqQayP0TEQjlqM6U2MuuqBk5SUvb25wiT9V8T2cTcJxUvXhAzKjgMECwmkE0cuUMuGyAsaz378tXC11Af3GVSPvIrxbaH52znnSDQIokw3R+Gv6Om6FllKNhFoblub+b7AWUxNv7Ue1od8LHoatuT/CxDlgSKx0tLmbhUGwcwmQO1dpMJ33m1F7EqCOL98RV9a+JepepfOthNm2fhFsQjRiFScmKcoMaOiOO0H+HomCTBFhD5S+oP1qfhnLp1C8WWEMiBTVpdOjkM46sCO3TjPScPF3HWP5rqpqXXoWxJk+Xxbi2X/hCLKKqP3ijffnfCOuYCsWuJAugqNFqz1FUTlqHM7maILa0wS6p15dNmqtz0kKrFR/0Pr60RKwuVJv3I75DPs4Qd6l74/34psysJDoDc9u5M=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3557
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(44832011)(186003)(82740400003)(1076003)(8676002)(356005)(86362001)(6666004)(6916009)(81166007)(8936002)(336012)(426003)(82310400002)(316002)(42186006)(2616005)(478600001)(4326008)(2906002)(70586007)(26005)(5660300002)(47076004)(70206006)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2f6b5da9-6e88-4948-5ba9-08d827f5a48b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8f8Lu8QbUAudPGbVl5sQ1jP+dnP81yhBfuA4R2yHGigZ+Mw7IYqZEHuX4DV3e2pqeMNMGJmSqlwRXKvNXWotm1NnoBkoCb9CP5RxuN4r55qMbZIexISs3kC5wimIrgWwe/bK3Rpqa/d93dR6r17MATuOAA26wGBASGI3bG3xH0t0R4SKeqLUOoptB/TbpmdZnNwX1HWi7RFV8JDzwVBVniVwWZuy0Ugy3MjxiNXYl674tbxTiB5eZhDSfYoRtnCQFSQj0To7+FtzS8/z5KB5mh8hQVZ0+2I7q3nQP4mv7hXvfpc+ST2law6gPldC+mS/2OrJQSgsGWCC80FDE+Agnimi4rSZzry57AivbswDnOW1rFolVDs/+wq7q7uqEIE1U4TZe/DCyrxbkFcTuoYOjQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 12:58:53.4640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d41e3ad6-0d5d-452f-0650-08d827f5a95b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4566
Content-Type: text/plain

TC0 does not compile on the latest master branch.  Clean-up the recipe
and get it compiling again.

Change-Id: I9eda0db826727ca33cac5a1f0be68024a8827900
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-arm-platforms.inc  | 13 +++++++++++++
 .../recipes-kernel/linux/linux-arm64-ack-tc0.inc  | 15 ---------------
 .../linux/linux-arm64-ack_4.19.bbappend           |  5 ++---
 .../recipes-kernel/linux/linux-arm64-ack_4.19.bb  |  1 -
 4 files changed, 15 insertions(+), 19 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index fb37610..6f16f49 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -38,3 +38,16 @@ KMACHINE_fvp-base = "fvp"
 #
 COMPATIBLE_MACHINE_juno = "juno"
 KMACHINE_juno = "juno"
+
+#
+# Total Compute KMACHINE
+#
+COMPATIBLE_MACHINE_tc0 = "tc0"
+KMACHINE_tc0 = "tc0"
+KBUILD_DEFCONFIG_tc0 = "defconfig"
+KCONFIG_MODE_tc0 = "--alldefconfig"
+SRC_URI_append_tc0 = " \
+    file://0001-drm-Add-component-aware-simple-encoder.patch \
+    file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
+    file://defconfig \
+    "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
deleted file mode 100644
index a8fe6ff..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-tc0.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# TC0 MACHINE specific configurations
-#
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:"
-
-SRC_URI_append = " \
-    file://defconfig \
-    file://0001-drm-Add-component-aware-simple-encoder.patch \
-    file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
-    "
-
-KCONFIG_MODE = "--alldefconfig"
-
-COMPATIBLE_MACHINE = "tc0"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
index 4df4831..4b1aaa0 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
@@ -1,6 +1,5 @@
 # Machine specific configurations
 
-MACHINE_ACK_REQUIRE ?= ""
-MACHINE_ACK_REQUIRE_tc0 = "linux-arm64-ack-tc0.inc"
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:"
 
-require ${MACHINE_ACK_REQUIRE}
+require linux-arm-platforms.inc
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
index 99db960..4eb17e2 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
@@ -3,7 +3,6 @@
 # Copyright (c) 2020 Arm Limited
 #
 
-
 DESCRIPTION = "Linux Android Common Kernel"
 SECTION = "kernel"
 LICENSE = "GPLv2"
-- 
2.17.1

