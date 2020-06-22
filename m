Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.82])
 by mx.groups.io with SMTP id smtpd.web12.18475.1592835481968488724
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 07:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vJdSnkI7;
 spf=pass (domain: arm.com, ip: 40.107.6.82, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+J8ixTMLlVINljbBqaOovtQujXAnmZDtN1WH4g2EIA0=;
 b=vJdSnkI76LhMs7A4Hjvv7fFqyAFhfmuPSJVRTdBHvaW9YzIfODFEmeM/JvIuXLsomD2Of3QXL0D4i0s7QEJimEUSxkBP4Wx/nWqV83uf0olrJz9bRrV+IXtqI/340CSPJgwl+x4ZU88zjpbnp9/geoC46cz497bDHgqPYQjksOY=
Received: from AM0PR06CA0112.eurprd06.prod.outlook.com (2603:10a6:208:ab::17)
 by VE1PR08MB5071.eurprd08.prod.outlook.com (2603:10a6:803:111::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 14:17:59 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:ab:cafe::f2) by AM0PR06CA0112.outlook.office365.com
 (2603:10a6:208:ab::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 14:17:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 14:17:58 +0000
Received: ("Tessian outbound da41658aa5d4:v59"); Mon, 22 Jun 2020 14:17:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1714ae82b6f03ae
X-CR-MTA-TID: 64aa7808
Received: from da958739d6a8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 46491D5C-2EFF-4DC4-B741-D73F2211844D.1;
	Mon, 22 Jun 2020 14:17:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da958739d6a8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 14:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDzSrxK6piY8qr/m6akE0XsQ7dn6FVj2XHra+ujLYSvfmvqVcVWOWalLz7F8pAdno26RJ3R7qOFwiIRhogI1pOpfx8lG0k9QCR8I24gXpUCedZyyTnAfjTqx3732GFqZMteVhun9CdFWXT4wuKSxl7m71zinBQYIaUW5D39rUe9PxOft3is92v0roIB0Tr45AP6vm64X8zbTE3Zjj2d/sigt9ZiDqmYim2gIyfUcWP5hKRXeZ7h+J/DMr2O83R9/DclGTcSJTj47hHZJ7oZQ0H8+EHl6ehxk8llJF4403gfLF6Bup/ITagiJRMBmgi8k6YNCejMqM/x1ZUWyfwIJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+J8ixTMLlVINljbBqaOovtQujXAnmZDtN1WH4g2EIA0=;
 b=KN2jHo6pAcUUVkU22pSaw4GfYxb8thCxb3UGxLPThbOWU2YJEbNEeMGwIvv8gKHMtHOvY/1D7rFJVvznyMXOVx/DDhbqlElHodCfRQqpLD/YLp27ekdWoOJ4p3Fao+K5KO+ajHbzbBLzwGhn7WQL/t7+NlfEdg5vnpWWxvcPUZB6dnDp2QkA1IlqfSQrcT9veAPP9DYxMd59k0w+snyz38PhU9xOQYP9hpIPX8WOZNuqmt0yu41TJlNppwkYZi6wP6w31U/7Q5XYaXPWOrCGUrXcyLDNB+T3sncM0gs6nspcyHLdZsDRUvuE3hCDhbgTiurS/n/T0OaC2ZolnD6SRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+J8ixTMLlVINljbBqaOovtQujXAnmZDtN1WH4g2EIA0=;
 b=vJdSnkI76LhMs7A4Hjvv7fFqyAFhfmuPSJVRTdBHvaW9YzIfODFEmeM/JvIuXLsomD2Of3QXL0D4i0s7QEJimEUSxkBP4Wx/nWqV83uf0olrJz9bRrV+IXtqI/340CSPJgwl+x4ZU88zjpbnp9/geoC46cz497bDHgqPYQjksOY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5116.eurprd08.prod.outlook.com (2603:10a6:10:e5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 14:17:51 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 14:17:51 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH 1/2] arm/scp-firmware : allow setting scp log level to INFO or WARN
Date: Mon, 22 Jun 2020 19:47:34 +0530
Message-Id: <20200622141735.4951-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.25 via Frontend Transport; Mon, 22 Jun 2020 14:17:50 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5b3320d9-5ddd-4205-90ad-08d816b710a2
X-MS-TrafficTypeDiagnostic: DB8PR08MB5116:|VE1PR08MB5071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5071E31A1CEFA6A9BA3359B1FA970@VE1PR08MB5071.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;OLM:3173;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WKTFv9EtyifH8FfmOV2NxGK1/L3iNM6QtcvM7fYhSy7hMMedwDc1EqUfnE3CLG69aMM06289PlXt0i0y7S8LcRBh4VkpCdqxuy/Sf2ubTGBDS60f4F4pkP3V6T2jw5bQ+RT5ZzIuCkYw0KlsB4aBPHOIT4+FJCaPWL+LDQb0JgAUC9OWyEW3zeHtQJ5OraMnh4nfCrb+JPhU3iS6B+PxjqBd9CQm33V+wtV+QZWGQLRBIK4sFqGDhyQwBBkSSAzpCC7pkBYvFdr1Af5H20XiHBCpIA5wQRPsYcolQYzIsL2gIRjwUjeRWSqZ4c0x4dIxHG/Qos8bxjv4gUePdC9sBg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(66476007)(66556008)(66946007)(26005)(1076003)(83380400001)(7696005)(8936002)(36756003)(6916009)(5660300002)(478600001)(52116002)(86362001)(2906002)(16526019)(186003)(6666004)(956004)(2616005)(316002)(8676002)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Yyidl+tmChZThGaekxTLz3XIdCJBD5UxfFgS26f6ttT2PwCQ+i6IC71WqI2K2cWdZ4MWcygMA/KrYD+n8F20bUnc+4D8tFA898vrliuj5lc6DeP1wrCMt6QZLzlEr3CZX4OsdPNx8l2FiGFHH/pchZuRZaDQw31CX/FDtZxIpEgvx8XOPIS24P0weIHeRUwLU7jKbZdEroQpsBDJaoQAWMnfudz60m4b5mBoBWIt920sTGdAUV9A8OL1kXwEJeei6u6d654vtDPpsIoNI8vhkCgSRYj8Nr6zB1A6KNg0W0oY0dQZu/xY/dUZD7tOcijcKLN33CLEeAgHrjzNBk1x5xo68wq1HK85X8GKhfJHS7/rIe71Cab29yGTw07GczY8WcR6/XSIlGsTOpqvPq9B6RL2l4Djn2kO4NU8yODTPGwgKnPiFTKXlAGlsSOaQxUYzITA9xT2P2NGxOsl2Aa7CNWj+qTbNhhcTDG60rYu9JYot2E3RH9NdPVHM6ZVCmUq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5116
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(316002)(82740400003)(36906005)(956004)(2616005)(186003)(356005)(16526019)(4326008)(6666004)(82310400002)(6486002)(36756003)(70206006)(70586007)(1076003)(6916009)(81166007)(8676002)(8936002)(86362001)(7696005)(83380400001)(26005)(336012)(5660300002)(47076004)(478600001)(2906002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6b534194-a9c3-4130-f251-08d816b70c42
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gvpHqRzlCOe17wE9IZ2Dyme0fhVLIfAPGTslZmwgPHPkFmGZujQbQMLtsVI1XoHgKctQThKMsiDnOu/tjQezBEgHxqG+hG6AghVa8Ht6puj7GAxjApsvmEhq9AwT4VbwUD7Y2KW/CYCA0GZ3JvNKa508hHk29o3wp8tkQUGmXWevXUR8QOyyT9fCWg/4WKGL4rK+AhYjGJQFiT7FIk9TdbMoXT/Bo1FFIDXa2Q7E3r90xx2uHQGewakHwy1Y/KwSyGbJqCk5Z24EM/vxa2eWx4UjR12EbH8T8CviYZQsSd9TA8VMJZPju+H9rJc2yN6TFdbDtzxrzWiF8ptMg8Hzje3GDk58EOudfdYXseFBSMsh2/T3zHWCozaglA82gsASAVCGw8uM0T5Ki2EC7XRRrA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 14:17:58.6261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3320d9-5ddd-4205-90ad-08d816b710a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5071
Content-Type: text/plain

SCP code has been updated with new logging framework. The patch
is to allow setting of log level parameter to INFO or WARN.

Change-Id: I20ec19a9aa1bdb7f59c067d2344c299c057a088b
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc    | 2 ++
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
index 1873848..2db59d3 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
@@ -6,6 +6,7 @@ SCP_BUILD_RELEASE   ?= "1"
 SCP_COMPILE_VERBOSE ?= "0"
 SCP_PLATFORM        ?= "invalid"
 SCP_COMPILER        ?= "arm-none-eabi"
+SCP_LOG_LEVEL       ?= "WARN"
 
 DEPENDS += "virtual/arm-none-eabi-gcc-native"
 
@@ -39,6 +40,7 @@ EXTRA_OEMAKE = "${SCP_COMP_STR} \
                 BUILD_PATH='${B}' \
                 PRODUCT='${SCP_PLATFORM}' \
                 MODE='${SCP_BUILD_STR}' \
+                LOG_LEVEL='${SCP_LOG_LEVEL}' \
                 CC='${SCP_COMPILER}-gcc' \
                 AR='${SCP_COMPILER}-ar' \
                 SIZE='${SCP_COMPILER}-size' \
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
index 5ff5859..9cb8b64 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1 \
 "
 
-SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
+SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
 SRCREV_cmsis  = "refs/tags/5.2.0"
 SRCREV_FORMAT = "scp_cmsis"
 
-- 
2.17.1

