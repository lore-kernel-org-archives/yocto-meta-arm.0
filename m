Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.59023.1622559169094356819
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Jun 2021 07:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4roRh1rP;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDR18MD1rT4VBvWJkBfOsvW8Cr43RiRgMpdHuX8uFHg=;
 b=4roRh1rPpsL8ppYiF5kv5CoMLsRERAWzv7sxxnEp0+SSaOKULJjv2drEwP7TmXPfOickAbrRHMp6jO35y6bAkMAmEPw1+RMCO0MUtvntcXnQpxbgz1eJcP3aT3pS6xuAY8ZWo8uIFyj+GVPbE29Jp0ApqcetncmvMOVgp7sSkgg=
Received: from DU2PR04CA0307.eurprd04.prod.outlook.com (2603:10a6:10:2b5::12)
 by AM4PR08MB2884.eurprd08.prod.outlook.com (2603:10a6:205:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Tue, 1 Jun
 2021 14:52:47 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::b6) by DU2PR04CA0307.outlook.office365.com
 (2603:10a6:10:2b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Tue, 1 Jun 2021 14:52:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.30 via Frontend Transport; Tue, 1 Jun 2021 14:52:46 +0000
Received: ("Tessian outbound 5e4f56e125a9:v93"); Tue, 01 Jun 2021 14:52:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eaf2d3c4bcdf7b3b
X-CR-MTA-TID: 64aa7808
Received: from d162d7abf7f9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2A285154-7471-447A-8F61-8E7F6C667575.1;
	Tue, 01 Jun 2021 14:52:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d162d7abf7f9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Jun 2021 14:52:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA6UcLyXrmn/v4saj1tO/1IcCthrt4KXF90QGMXqgnqH7yy9fZf5xhb4gm0FlG8iuMiPqPWWkfbOPTIWtGhNNYg2Fbuby0WJ4gSt5DzwLbDxMES3gYqM5XAyMxKAWSauA4TNcKAwA8a6kxjtYG8CDzzBOz2ZM8ppc3JsSNv1P1hqjzHZxKbXjDC+0TwD0r0HPME5/oOg4kmvlHUL/3dBcZWGckbvOkTz3y/CS37gkBSBviD4kCTl3aE2gJrZr/WrWPZ/5KSZ6kWU+qc9c8dABdgydsN4dJMdvBCKPejMlAD1IRTRGSakKDAuTcCv7QWYSJucPnnp6bHQOAuz5PGDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDR18MD1rT4VBvWJkBfOsvW8Cr43RiRgMpdHuX8uFHg=;
 b=VPj8t2cvUtxKTa884ZL+Ea6z5hwVjQNrOiwyVdqh8ee9rQ5FHeGBW/GNGbh+IY/dsaGMBTF+NWXlA2APg4Pts3njvTKw8SB1JZY/kf83TKsAW6GP4s3RM6plJ7QPcKTgiIxSoTSquyQOgKB7uWHPNZlvnJe8TEtVPrV0RO54RyIB7wWuujOYDLpa0VLda9M9eVotePniFbMFYDoyhwe2KV35ZDF4h4J/MfrOCOjdIYoHINRqUJxVykyw0oMY0tUwxAPvGhWs7oiSID/+0DNLBUu2U+txWyuV4XwZaCdCwfV0oa82FWrfGtpXQ+HuZVkGSkL4U4fzsDAg4pJalQOIpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDR18MD1rT4VBvWJkBfOsvW8Cr43RiRgMpdHuX8uFHg=;
 b=4roRh1rPpsL8ppYiF5kv5CoMLsRERAWzv7sxxnEp0+SSaOKULJjv2drEwP7TmXPfOickAbrRHMp6jO35y6bAkMAmEPw1+RMCO0MUtvntcXnQpxbgz1eJcP3aT3pS6xuAY8ZWo8uIFyj+GVPbE29Jp0ApqcetncmvMOVgp7sSkgg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB5143.eurprd08.prod.outlook.com (2603:10a6:20b:ed::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 14:52:36 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 14:52:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp/u-boot/fvp-base: Make usage of config fragments to set CONFIG_BOOTARGS
Date: Tue,  1 Jun 2021 15:52:30 +0100
Message-Id: <f604d60d0b558bc8415e9e48627c9961ea7765b6.1622559119.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0165.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0165.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 14:52:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8149bf7-e9c6-4fb0-3768-08d9250ceb58
X-MS-TrafficTypeDiagnostic: AM6PR08MB5143:|AM4PR08MB2884:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2884795CD65DA40777BE4833923E9@AM4PR08MB2884.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HxyTcCPgTWAwJdNVFdtL+SHaxahz37d3bI6eulFEKI0hjvI68vzqmzXqH0HziK4kYymH+pvJF6jtCp50hncFP6GehgGSJccgHIyhgKrkfhtO0znLC5ttm/NVlotg5Oi2/BkkDdh1KcAqOsEkP0mE7Seza5YY1SjZlyz4jzqJhS+SLHNbcwbZEVXEAGyptq/+GWhuGf8go32Dhg57AtildaZGxWai5MgN4bxcv3qUEebX6xhNxm4qwPYQIROkMy40GN2VGY70SmoWF1+OFFEfYwbEFR9Kn1oq27ITpO08pAWBQHsTAfJnBySuLAs25Kozm9/FiJmhzyoK8sXl51juMDE9GfSynM5YwL8sSosfCHDVBe4oJmwvie/sm2IXOnWS25xyzKnfPq5KDHXiIB2TqkWPAFGB4lHRgB1FV1mweib+cCto+bLiJTw0tE+N+nr4z6GVNGAh002yWP5G2ZqdInd02DE8NsAKP7/izuHvGTbWljymMjqwL2xUk9YGmSD0LkR+R6puYZMYOM0j569ZvdbbP2NqOTJKfgxlRuYbVdAP43n7nt0vWk7JlSR2QwpvaC4mmCl/LSL+SWZU3cZBwYyRT/Js3/7pGawYiBtdUbBhQz2gf/MKo+Q9ybsRmYXUmtFK3Vq8Bv/qDeNoX/WCVQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(956004)(66556008)(38100700002)(6486002)(66476007)(52116002)(8676002)(4326008)(7696005)(2616005)(8936002)(2906002)(36756003)(38350700002)(316002)(26005)(83380400001)(186003)(44832011)(5660300002)(86362001)(478600001)(6916009)(66946007)(6666004)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?rZZGAdTsbkJJb0SatBuEiSdFUPODPN+V6okl/04DErwlVzXkSw5gY53Ws5gP?=
 =?us-ascii?Q?hDV40Xenn0VCp7wIiib9mRxLxojtysrTp67JCN7KY2vWHaLX2C7Yr6+qkRah?=
 =?us-ascii?Q?HkW2Jm1PcNmzHaWlIWrYD+ugR3jFK+a1d9LJVlrw74OCYaFXf4C2ygsQe6dB?=
 =?us-ascii?Q?N4M8QvlEd9MrI8NIgoY6dicOh333Krvlrsja5P3A2fn+pCWv1YWVu2PhenzC?=
 =?us-ascii?Q?UPsxzaI4921bg6sPQ2Wm6qlAR4psED8FQjky+BuaxwHX9kQNaaflOBf04gSp?=
 =?us-ascii?Q?HiGCGmPOv17KrWEY5lQjxE65JK9vwBYn/EIuWXyMUsbaKLD7+ADCfFbT34ZT?=
 =?us-ascii?Q?wjxYI5dk4FIkGolTCg2PYHqB1pEzKHmrjP7ADWvS51SW/AF0LeOWXWGwabZD?=
 =?us-ascii?Q?d5prtKE92atpHtA15r5eBXD65NZx2pQ1/S2qESFtyW71DQaZhaw6HT3nrk0Q?=
 =?us-ascii?Q?nMZqdT7eo91OgFtqb38xaz916F/Vu8UdYkg6Kw37aZfjR/9TdWL11SVzTDh0?=
 =?us-ascii?Q?UT1tsvnT3lEavApO1SnL3jWZwCN+XlRDvfEX+WXTdv9+ofuGhzln/6nYqHuP?=
 =?us-ascii?Q?uw5v3VnJmuDdJR8bxfYDRXtPn2FcFfZ3Y5IcEWLm76YG+yionIKUujE6mjon?=
 =?us-ascii?Q?VbW03OVph2Fd5CakngZlGbxS8IFbST9oAvye8Mci0WDVbnJdSOlaZcRxx3iF?=
 =?us-ascii?Q?oGz+x48uhARle70RA4G/AcBnyjAl7jqJJkvEX5G/cUkHiygA83dc6uws6rDX?=
 =?us-ascii?Q?WbKM5bSC7CJdj+83EbqJKrbpBTFt8WE8BqlfAiY+qnc3uhfynPC2CVDZSyL8?=
 =?us-ascii?Q?jY/2c1N6jwIeKdivMbJZS2h47g+kIAXpRafj3ikOSB73gqLdoOrVOUz5YX6S?=
 =?us-ascii?Q?fj1QxNkfKu3VvXZLbBEDWhx2SEdLe6QTgZsZ7e9mUrT1Zx9ibvmHwNM2+uBO?=
 =?us-ascii?Q?3QSAcT3ZoeVwiQ9D+JsZKXMmsVziCSRTYnr8Cxg8Laf2pEKc98W9fCHmq2d7?=
 =?us-ascii?Q?fQAMf9lw6jT9EJ5SnCY9GMJlhcJ1XGG3E55GPD704MDgGb1EvB1/v21NW31E?=
 =?us-ascii?Q?54MQor4GPuHc7FYBxyk2GlmW7s8gsan3pYvZOhEEHse234OT/dD0p4Ycs34V?=
 =?us-ascii?Q?tmtheGy63DQ89ASYXq3UR2z9aE/wFHDQ06fVafgb1982+bIhz/gdQ0B0A4qa?=
 =?us-ascii?Q?xpjdsrgrcUILhia2tgBhWc6unY4VNmF5dC591PKGtRQ0LzEe6yWCbt1iuZyC?=
 =?us-ascii?Q?WSvnRiDXRz3R8eaAxurJGLkIFSMsLJQRp5qj1qzI6yO2Rk7ohVM6giYGjBzm?=
 =?us-ascii?Q?jIu9u/EnPU5E2K+qnWoA3mY7?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5143
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	14ade38f-08b7-4e20-6efb-08d9250ce4f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+/tbShTKea8xwN8SitJ+Je4LsBv6l0U8yxunDRNu58BaWwmpoa1aJ1jdU7i4TxBhzh9myMWsvlqHYG21cdPtuVQyEUwGuFI+ZrS43xNs+xjLm8n9YA8AttWufazoaNEJ5G5OqK2gkLVkqvQy+atIzYOwkOwG5aI22MJUa5wKJlUHLIX1Pdfig6GkFosfkKD+AHRmv5ETB3y4AW2hljCtyvDfgoGxHcfTrMidjqCy+jJtSmE6FKw5xEf9xLHMHwfFijwljTo/2AxrRcLVLkwXBBbL5eHFfXKYkv8A6XTmMbdDSQNjbJPo1zovxdtHI3iXRI9P8kI2Qd33ACREpJZZ/aHimP1OARXiS7V2qt9H9hYme9PMN8J4wfqqIkdZKNl8i8K/2QGVUuwgup/Yjqeh5nY6HojMEON5nIy5bplJs/SOQeDZ/9PRIjbsZXdkp4kLuFeBHnM8NSioWwsT1/+r/duoBx5Cycwxf45ab+d3nYCKMnN2BRnnFwZzv4wUTy8yY6iNqBAzvBXr9tsNSo9MZ67B2Ea3fkyG4bWMzZ7ON9qS18FKyXAPuQUPth+AYMYPIHp/4XAfYLuj28ElcafZ7QtqzxxpNeaNMZnbrTvwzYX4b+4jkUAM9gbkawQ3O3MtchcoSpQhuUEezGfdgUb7I3ah+at0zqVdJvJTkceCLe4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(6486002)(36860700001)(4326008)(16526019)(44832011)(5660300002)(8676002)(36756003)(356005)(86362001)(83380400001)(498600001)(70206006)(6916009)(82310400003)(6666004)(81166007)(8936002)(2616005)(47076005)(2906002)(186003)(7696005)(70586007)(956004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 14:52:46.7828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8149bf7-e9c6-4fb0-3768-08d9250ceb58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2884
Content-Type: text/plain

Since u-boot recipe supports using config fragments let's use it instead of
patching the vexpress_aemv8a_semi_defconfig file.

Issue-Id: SCM-2329
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I7feba5d23a6eab501cade38c188cb8414d0b86bd
---
 .../u-boot/u-boot/fvp-base/bootargs.cfg         |  1 +
 .../u-boot/fvp-base/u-boot_vexpress_fvp.patch   | 17 -----------------
 .../recipes-bsp/u-boot/u-boot_%.bbappend        |  2 +-
 3 files changed, 2 insertions(+), 18 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/u-boot_vexpress_fvp.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
new file mode 100644
index 0000000..b7510f4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
@@ -0,0 +1 @@
+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda1 rw rootwait"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/u-boot_vexpress_fvp.patch
deleted file mode 100644
index b0cbe0d..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/u-boot_vexpress_fvp.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [OE config specific]
-Signed-off-by: Anders Dellien <anders.dellien@arm.com>
-
-diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
-index f0ac2f9da3..93fcd3026a 100644
---- a/configs/vexpress_aemv8a_semi_defconfig
-+++ b/configs/vexpress_aemv8a_semi_defconfig
-@@ -10,7 +10,7 @@ CONFIG_DISTRO_DEFAULTS=y
- CONFIG_ANDROID_BOOT_IMAGE=y
- CONFIG_BOOTDELAY=1
- CONFIG_USE_BOOTARGS=y
--CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
-+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda1 rw rootwait loglevel=9"
- # CONFIG_USE_BOOTCOMMAND is not set
- # CONFIG_DISPLAY_CPUINFO is not set
- # CONFIG_DISPLAY_BOARDINFO is not set
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index a572347..692b4eb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -5,7 +5,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 #
 # FVP BASE
 #
-SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
+SRC_URI_append_fvp-base = " file://bootargs.cfg"
 
 #
 # FVP BASE ARM32
-- 
2.17.1

