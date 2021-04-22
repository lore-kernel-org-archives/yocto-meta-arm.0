Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.51])
 by mx.groups.io with SMTP id smtpd.web10.773.1619107647171044436
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 09:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qbZGUF6F;
 spf=pass (domain: arm.com, ip: 40.107.14.51, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm0hHKZsJSpXGuc5K7hKMuR2+C4FDq+T31ITWcS8Emk=;
 b=qbZGUF6FVTiQSNApvEcXiKM6gXPk58y5ucxlD/yUrLjMsu81r07IecMODLw8Mj5WWtrysPfQ3FaGFKQlnTILupO6lpBJn3dTh5WJZrBIsVxdxqoUZzZ8nKQpdsXk5XCqDYrR9CBDxTlsZPElt5u2P04JgfE3Nf9DY/Bpbpu1XqU=
Received: from DB6PR07CA0068.eurprd07.prod.outlook.com (2603:10a6:6:2a::30) by
 AM0PR08MB4482.eurprd08.prod.outlook.com (2603:10a6:208:140::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Thu, 22 Apr
 2021 16:07:24 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::7b) by DB6PR07CA0068.outlook.office365.com
 (2603:10a6:6:2a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend
 Transport; Thu, 22 Apr 2021 16:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 22 Apr 2021 16:07:24 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90"); Thu, 22 Apr 2021 16:07:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ac631af568f21ff
X-CR-MTA-TID: 64aa7808
Received: from 7f94957ce11b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0BD4A4D7-86F8-480F-8AF2-0B424D8743B2.1;
	Thu, 22 Apr 2021 16:07:10 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f94957ce11b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Apr 2021 16:07:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfWDVlRv7pbqAJnFxJiA70dWSk4uHCqoS8MPMX5BvbdPi3L30Tqexr1qzYB8Rhjsql8tBxmZ9dGyPNYY+og+bNDdMu/8/I1i9XjuRt0mnwaX20g23/RRfMWB96ZJ387rSL7A74MEITDyyOIwUl2rKUwjB0yBdVuDfTTZcqjGiwzYS4A1uMeXG1f9yifG1d75u7OpY8pRW6cNPPHQEmXYP3cXJ9wP3OUHrh9eeHjfBRUtfCd0P6wnQQ+JdCcy8+91q53y9/CjCc5UisQGf9GcVUeSNw40uk8x7IGmCO3psDpuFTSLoTTJfZTABntYmwlFK6wRXj1Rdtl9g2RDmFVkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm0hHKZsJSpXGuc5K7hKMuR2+C4FDq+T31ITWcS8Emk=;
 b=GHTROb8BRUHsV8N24hBEcuNttro9WQZ4WSJLm6tBALSnT61IEyAYAgRBWW1PC3Ib5DBF+oNOQLZdWY/G/urIDZ4Yl0S1hiocQygC82FeQtoevW9z7cT0gXLCu+9zyXUt0SyCWjG+LFSqAkYtRwh68ExXWInjlsjmXCmv0pyyep1DzFe7e9Yytx+umPC56Wi8IW2kYGafHpLJvvpcHVHm3S70iPta89OBCF5aoXtwo6cnDVx6OqhAlpHwAYyegKSGUYGqN/aIIGGqD9QsstVSdQqajKAJ1I2H3tAbgNSRmY6QsDw1gc4hYJoWWpv+CYTRC8SpH2lXms/Jv1DST/Eyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm0hHKZsJSpXGuc5K7hKMuR2+C4FDq+T31ITWcS8Emk=;
 b=qbZGUF6FVTiQSNApvEcXiKM6gXPk58y5ucxlD/yUrLjMsu81r07IecMODLw8Mj5WWtrysPfQ3FaGFKQlnTILupO6lpBJn3dTh5WJZrBIsVxdxqoUZzZ8nKQpdsXk5XCqDYrR9CBDxTlsZPElt5u2P04JgfE3Nf9DY/Bpbpu1XqU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VE1PR08MB5277.eurprd08.prod.outlook.com (2603:10a6:803:10c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:07:09 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 16:07:09 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp/scp-firmware: Enabling coresight debug non-secure access
Date: Thu, 22 Apr 2021 21:36:55 +0530
Message-Id: <20210422160655.3720-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.56]
X-ClientProxiedBy: PN2PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::28) To VE1PR08MB4846.eurprd08.prod.outlook.com
 (2603:10a6:802:ae::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.56) by PN2PR01CA0083.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:23::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Thu, 22 Apr 2021 16:07:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a64767de-128b-4bfc-a183-08d905a8b7ad
X-MS-TrafficTypeDiagnostic: VE1PR08MB5277:|AM0PR08MB4482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB448257EB8BCDD266CA5B8A84FA469@AM0PR08MB4482.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TpCjzgxKpx6ma88AK1Ln5MS6M4VIaMmVmv9QhoR83DbqElN38vJdVUieJBoMQ5HF1zEHjmQ4jtiyf7/lS/gv8pxdH8F3Jk5otobrbKyCW3yn9p0UP3/APMTloqFEtOTIzhZrhM6uqxorvWBphUu/txQDUVGYKg5GtkJzwgk12ftqdA3o+SnAeBIrQu6eZqXuG8RV1rZ15em9hwruCUJ48M1fgiCArD5CihCIRLjFJpXg0mapEd5iAgPZIi3gTOo4dSFBFSp5ixIIVxGlscMW7nXK67y+MoG7cAnH3AyosdT4KJKI5+skrUdK0/pw13lCc740yml19eSSXlRJiDqNJ63xFxdjT5Ay9EbH4lNRclQL3vuaSu2l+Ny9oBrKA9jWvilG+zuLA9J1PnDm+PLqlp1FUlDM0KbXOnIc3ISt/0/3rcThbTTGMWlE1aU5hWhIX9aLxyxesK9vtqGRoboVur9lz71k/RnsnT4uq0W+RsvKOdsGZ2BpIMubiSvOXTwp3d6zqkVy2lQUpKkFj5Q9cjqcvDLq1ppRfyaxTYOLdyOKsbGtr/PPqTuNMp5Xw/WGOIX9OJkMfYdXlwiBfJ/Z39ehNAnteSmOG+Vp37p2PZrM4RM3JWmDoTWTJ85L22GyUQXFkhQLipWehlcWbE9A0O0IfUw/5vJjJysg4MLToAz/K2ylop2of61bEqt3/GXhX0T3pULqWYvzyFry02bJYA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(6916009)(7696005)(26005)(316002)(52116002)(4326008)(38350700002)(6666004)(16526019)(8676002)(38100700002)(86362001)(6486002)(2906002)(956004)(478600001)(83380400001)(8936002)(36756003)(1076003)(66556008)(5660300002)(66946007)(186003)(66476007)(2616005)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?CbMiWjWgPm2yayf8sE3n4eFRMqJjF2Fl9GoiLXjoD3L9QLDt6+KK3FZEGe4h?=
 =?us-ascii?Q?s11jTxzumjXrEmYOGF7AU0iuqPinL1BhQscMHHVDaVGgJ/OYT/2mYm3G/qt/?=
 =?us-ascii?Q?mxHbgw0beD76NFiA9fNLzKW7mho65S9JufiZilcctupIlz6/UDr3N1MDsJKx?=
 =?us-ascii?Q?7ckD2t3P2E8cK27pQBO0mETgv4KJkUZc8XtllBSsegLygjSiMAtFe1oyJ9YZ?=
 =?us-ascii?Q?aDHQd6igAn8fj2Mtkx15DQrGRr5RLXVxfwPQtnWxoUT6ICxQ9QlC8bZ2C4JP?=
 =?us-ascii?Q?ggb8Qljd4cnVwZeNO65tQ2ssZTGyYCqNeGWa/XjA4vgHguIC6mpniu1/ZYNh?=
 =?us-ascii?Q?2YE8A16imy8GoL9msgFCnK78MHMp0QAFM7g4oAAGw5fPFOnjKzDbK30Slbm4?=
 =?us-ascii?Q?IttjRl9+FvUmejpARbGQetl3ynq1g58oiFoO2YzhynSe5fCuz65X9uw1tYQ7?=
 =?us-ascii?Q?0Ro36s5YrGTB0arzIfLT79Zang8UwBnenG/l+OeUIwcbx6JFLphH7oigja7h?=
 =?us-ascii?Q?NGuuJcExd23YNTp/W27V9M2STl656JzggTxB8iVROLOD12nloAN5Rcd8xE7K?=
 =?us-ascii?Q?5+R6W3ekkTdkomj20DSmym1gWznOJRxCOcw1omAQvogvABiPeCm9dAfCF2l7?=
 =?us-ascii?Q?RyVb/7MKfDvbxVY1t1KH+vZ2r+mb4uWJjVk16wg88mBuccaiNN3r17h5ZVa5?=
 =?us-ascii?Q?YYdOObdulca4t/o2O5Q18/8tQBy0b0nr+7FkGroXLDgxDln87gSKFFExlG+Y?=
 =?us-ascii?Q?H2rE8gj4RaQdpZiJMY4hqB1Tf60yZ1PeyHR3WBFT74Pf8Uvzc/WuikmdsNCN?=
 =?us-ascii?Q?0qEgyDZYwDzznBDMoOXLuYtlmyBE0qGU+nlQUPbY9bkqmTSHd+l21qmYLLc+?=
 =?us-ascii?Q?51IxtBucZz91NPiCsPfdyjSVuBm4jb8yYqzCK5V9cnFLFK5qA8CjlDAillSo?=
 =?us-ascii?Q?KdHEhXoKO6izmMBtBztr48N26vW3F/qkSQPEIz/4C5qgnuZBJjTqVj05v6xE?=
 =?us-ascii?Q?0N2WnAGxkS0QEDeG3LhvI88weHuu6DKnuAUfjJ9k6vLU2oIRca1wpeAGQfwr?=
 =?us-ascii?Q?kAi30m+Cmf0hbsCsKicJoQ4S7VHs9Q/DrbRlocCo3DAjax+oTWPrGA5AiOlz?=
 =?us-ascii?Q?ffJ9qup7hBKERsjMIFUW+qY9WRYaKIwxyu4C+JYnqD8AspLTOIP8B5G8gtXL?=
 =?us-ascii?Q?1uvbqOd9RQ5yYkmDriMfITmOc1gWm7xkx9FPf5q2+x0F2ivv/8w5SaZAearH?=
 =?us-ascii?Q?qcEDdLFhPYXk6a7lQyOAEUh7A9ebY8bvHeX1N6obk5DCBkY1fuQEKuwr8ssv?=
 =?us-ascii?Q?upx+3IN2Y/rMSM4UbC0pP2I8?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5277
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd7daa8a-1743-4ddb-0b76-08d905a8ae49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	la2AD8o69nfx1jGt3FvLZNYPy/PqOyVT3lGfWffAZcMxxne+XUQx2U2IvX6be35fegVLb73zsRXBjEYDmGLsNeLB59U//5VU7mOxZ39WG/1GDozZ7Gxgvosl2qSWn41NXhVKERslSXzps2sM4n/gYRyrrljxmiH0WbaKAw4RFCjjzry+l7a0JKWcAN0nqS+cUl1ui2kvOLU35XTUp1ycWYZJqCyGsZvhc/31t2HidG5xkRrdv/ZXDLnYRQcG0myfho7Hr0eNBbqtirmaJPDFFD79bioWynVtYXtkYaQsOGiIDJdkDlvIUve2YyPohMgAzdUoYDDJcSqTr8X9YVkb3qmWu1dJ1kU1++sY6GcuxjUrr36qGsy/sbW6hfKMpSLfWxch/zqg5zxcSFJQCO9QEHaGDNpEyA8QbVBjwSoFhwtQhDtyqdyRDhuzEYpT9U+Os8KnCoIbrosQ+BDvkPNMCVQyoXS57A+eLFr6bUe4eELzSb+hEeYo6I0L5GPhS4O5raibv9vpKHyz78ku5O8/dKErE+2Tj2mNnlUHf9TJcgHE81HkWapgyJMUjX9wSogQpz0bMaIsdhlWcgiOi/SOjxc1eANRHCgjjmOzNxKncQh9R+Mn7eRvV0fciX74+qwuQMb/kM2vnE7pa+ojLC2dHYsn594AkPLUtMAt6WMtVXBVLZ3M6pph80iBt/TE5g4JgHKmgqz6rh3H60n/UflF6MMl1l37YYZKdppXV4EaETU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(6916009)(26005)(2616005)(16526019)(34070700002)(70206006)(36860700001)(8936002)(316002)(2906002)(81166007)(70586007)(6666004)(5660300002)(186003)(1076003)(86362001)(82310400003)(478600001)(4326008)(356005)(36756003)(6486002)(8676002)(82740400003)(47076005)(956004)(336012)(83380400001)(7696005)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:07:24.3820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a64767de-128b-4bfc-a183-08d905a8b7ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4482
Content-Type: text/plain

From: Khasim Mohammed <khasim.mohammed@arm.com>

This patch enables coresight to work with n1sdp c2c profile.

Change-Id: Id3a5f92cc1f99cd907111ea858aad4efe561179e
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 ...ng-coresight-debug-non-secure-access.patch | 38 +++++++++++++++++++
 .../scp-firmware/scp-firmware-n1sdp.inc       |  6 +++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch
new file mode 100644
index 0000000..713f4a5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/enabling-coresight-debug-non-secure-access.patch
@@ -0,0 +1,38 @@
+[PATCH] n1sdp: Enabling CoreSight debug non-secure access
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From 194e6239737272c3fadb202deb8015cb6e8df6ec Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Thu, 22 Apr 2021 15:48:02 +0100
+Subject: [PATCH] n1sdp: Enabling CoreSight debug non-secure access
+
+This patch enables coresight to work with n1sdp c2c profile.
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+---
+ product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c b/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
+index 70e2ec3f..ff380ae2 100644
+--- a/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
++++ b/product/n1sdp/module/n1sdp_system/src/mod_n1sdp_system.c
+@@ -466,6 +466,12 @@ static int n1sdp_system_init_primary_core(void)
+             return status;
+     }
+ 
++    else {
++        /* Enable non-secure CoreSight debug access */
++        FWK_LOG_INFO("N1SDP SYSTEM] Enabling CoreSight debug non-secure access");
++        *(volatile uint32_t *)(AP_SCP_SRAM_OFFSET +
++                               NIC_400_SEC_0_CSAPBM_OFFSET) = 0xFFFFFFFF;
++    }
+     return FWK_SUCCESS;
+ }
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index fa3403d..65034d2 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -6,6 +6,12 @@ SCP_LOG_LEVEL = "INFO"
 LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
                     file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
+
+SRC_URI_append = " \
+   file://enabling-coresight-debug-non-secure-access.patch \
+   "
+
 SRCREV  = "6c15afb1b37d0728482c598b063cd69bfc733e93"
 PV = "2.7.0+git${SRCPV}"
 
-- 
2.17.1

