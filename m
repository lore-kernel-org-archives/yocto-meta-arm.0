Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web10.10945.1624984411045923256
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 09:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Zmn4gb0z;
 spf=pass (domain: arm.com, ip: 40.107.20.71, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPpebrMCNDs3l15aNN6XftFB15Pqv2qNn1LNhdM+vmo=;
 b=Zmn4gb0z2XpJGQ4maTlWUERDWWlvGTZyfbarcAtkbuX856HeRttvaRNI0X0kM+hgzgv2KNHuOfC4vS1zXhSefjONozBlx1MlMwdHOymo5dxTfI9FhUms2hnuqz7ifpzSFuvW1nxW+zCDxPkvLu66vgRmmgPHrpA1Kik8xeY2+pY=
Received: from AS8PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:20b:311::18)
 by DB6PR0802MB2518.eurprd08.prod.outlook.com (2603:10a6:4:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 29 Jun
 2021 16:33:28 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::4d) by AS8PR05CA0013.outlook.office365.com
 (2603:10a6:20b:311::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Tue, 29 Jun 2021 16:33:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 16:33:27 +0000
Received: ("Tessian outbound c4dbd805523b:v97"); Tue, 29 Jun 2021 16:33:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 58f65b204479ee54
X-CR-MTA-TID: 64aa7808
Received: from 039cf4fb7cb3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 36C0F823-61FE-4DBF-A178-EF431D82F716.1;
	Tue, 29 Jun 2021 16:33:09 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 039cf4fb7cb3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 29 Jun 2021 16:33:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/my2B3/NR7jSXUFv2A6wWm7TAHVbYUjugdoe1y836V4zH7HnTbi4sHcbVYNMKwNpDIZtp9ob+rGdXXLu+rfgZQdq7gVk/sp3VC5JVzSycdvzBLXWJsVXtomEn4uelVrOOfvTDMelu6fP2lHXQc/gxHePKsrQ3OU6Ny89jLem7SC5rtRqVuegL1V2Xsbu+r7f1EiHXbjEwB6imriIMuwrOHxqpyBmJgTW2/NTbfgPvTSegLOvhOjZU0iH9xwgOMMwSonJgLOuqApRkA4W2UAbj+z8EwLlISwRYcyDycACxtu8bdlE52QCGZld10CKYjC44TnLdX4tHk2oYPXNyKfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPpebrMCNDs3l15aNN6XftFB15Pqv2qNn1LNhdM+vmo=;
 b=lhRVAkGtfXh1u/SWG6a1TKkpRTtuAHNoDNe8yEINzFVn1Q9051E+samEe0yhcQWCgmyQyzFQuvGMp4c1pJsTmquQFJQk9DHE6hNb2T6g+7hJ295tl27nj4YXXkc/F2mGamRnu/LKMvW3QMvXCoU/kGnQWrfeB7o02GwKvxQoK2uARhJyuTBFw91DwlbsiCu2BSIUmZUMuqfCiIMrKhhxcorrBDVu24kRjlFXzjWeRM5h1St5rnfJdWCe8IdLMXvlzKUUIlMsuGvabCjEeUQ6SWHGVsHqyrIT8KmQQoRqHo1hBbhOnsnI0GqFXTNvV7DjqqGWlqaG5auokMAko3FxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPpebrMCNDs3l15aNN6XftFB15Pqv2qNn1LNhdM+vmo=;
 b=Zmn4gb0z2XpJGQ4maTlWUERDWWlvGTZyfbarcAtkbuX856HeRttvaRNI0X0kM+hgzgv2KNHuOfC4vS1zXhSefjONozBlx1MlMwdHOymo5dxTfI9FhUms2hnuqz7ifpzSFuvW1nxW+zCDxPkvLu66vgRmmgPHrpA1Kik8xeY2+pY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB8PR08MB5195.eurprd08.prod.outlook.com (2603:10a6:10:bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 29 Jun
 2021 16:33:07 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60%3]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 16:33:07 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH][hardknott] arm-bsp/u-boot/fvp-base: Make usage of config fragments to set CONFIG_BOOTARGS
Date: Tue, 29 Jun 2021 18:30:36 +0200
Message-Id: <20210629163036.14878-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::26) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0254.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 16:33:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8e05e2c-8d95-422a-98ab-08d93b1b9fad
X-MS-TrafficTypeDiagnostic: DB8PR08MB5195:|DB6PR0802MB2518:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2518E077AB7553F4C8451915FD029@DB6PR0802MB2518.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:275;OLM:275;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rWS72Ni5tr9LEbcTBlf8vQ1BTUZW6tmUYmYgPr77Itokl/+EpI9iCQgk48lermxBXbrwJYlunfurdg1yi26+L7q64tRiIM1kam2VxWRtioDOUEthgOjRubzJvmMKD3Km8FTzEooeoDyl4CCiFg0wiExuMLYaohYfr+/lFtoSa52eWlHHBtr9xMbYsFvhobEn34f3rDsX+vAmPz63ORC9vLXSwnayxsVZLqPAv3HgS0xX8UMdhUlKF7xkNt5+YzyQtize6Z8UhhsKEVsRgGc2sPw6/hH5hta3eHr0e5LdPLiuk2ry8eJMAiZ1BvGtcDfRuyqlPWnw1BpNBEJwLLlWD1G30oJGsBBqNcc5VNYajTpK3AZVtz+lQK26ntceVXPBojWm/FYAQoP3fWz8B+chAFTIT0Ogz8kOOlcnfVWnTXVYNWYprGkHM/JlWq9xaYORg9plF2F0QhrFnr8qCEsRRGClpSUVF/xqOkHvl3GnzKNkhx++Yurl13HxVnqHY+zhrZW/Nmc52nZgqa3GIFIXvhMYbnhSE8gq3JCJPBiuIC5ZXFUEjfksm3/2y12NSKdjFZLlumTZZpvKnPd93cx9U8l9e1PhmLISpd8iZaUbJ4CQZ3U3iCXuqTSczztk7J3y1TNh42NHOMjIG/+VRSo8hLFKloOHHTdgKf9xC6IaTxh6+R0RdQMUPHF9e3TGSV2yneP4JWAm8d6z31EHQPrkMQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(4326008)(52116002)(6666004)(7696005)(66556008)(66476007)(66946007)(26005)(186003)(16526019)(6916009)(38100700002)(83380400001)(8676002)(86362001)(2906002)(38350700002)(5660300002)(44832011)(6486002)(36756003)(2616005)(316002)(8936002)(1076003)(478600001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?yU3SwCTL/ukSaLnuDkZJzl6/WSDsUik7XB0DP1m9Nv3IC4KZJqJJlh0YFElN?=
 =?us-ascii?Q?+573nB828uBcGms1z/M5hEmxb12S2ncpbSd+Vn6Z8IM98GS+20xBXNjf300s?=
 =?us-ascii?Q?iDDvnK3lscNyuJztURJdG1SONng+aqE1GcPNqKjz1T0EczEUFkef57LyBuIn?=
 =?us-ascii?Q?hgKs5HRXWPY3xvjduQMHowphitIb2tJJYK3g3ViCNvZAL86dFS0vzevmixia?=
 =?us-ascii?Q?yvf9INKrLlzjtrde7rMRtuniLTFOVrDqegYEG77Ak3Og4qcfLgpAz/2iTM/O?=
 =?us-ascii?Q?j9lK78/Q7QLyf8voc6d2jEzVcsJ5w1ca+6nArFtD9+LLEZ8LFqHbvnggZCGU?=
 =?us-ascii?Q?/bv2ZEGqtWM/AUQHokmGMscjQu8LslD3dRE1oYFY6beERzbmBs9Ge0afm6yE?=
 =?us-ascii?Q?3B+/YXdCVFHqMMd7y6I0+xHbW/ARpRxTUl8P4JPeYSdcorYYYxTAfYmoxTyN?=
 =?us-ascii?Q?5ggZAHawcjZ2PmByPphN7f2Ofqb9XHn1S1hFJrnoilfm8kbOj7YC++Xa4FG+?=
 =?us-ascii?Q?ARJWM/pWY6+brAgBGGihHP7x843Ti9yWEu8rwc66g5orGxp5d/jNdL4cCWaw?=
 =?us-ascii?Q?sUn4nygclGcHhI+QIhYT+/l5eGR7qaulRmL6aDG5tq0TwZg5ipmS1xLLIpq7?=
 =?us-ascii?Q?t0LxxlfckiQr9PzBjnlljylE5TujoXYVrGjrn3sEkhkeOZvZW6L7X0A5KU8B?=
 =?us-ascii?Q?gvIlPtkA94B8MYcTw18GejQVld/KCyyivuPibr8ydTgPvZ+E3pISXwbPRLF2?=
 =?us-ascii?Q?l5Ytf/PMCnfBKtXV//+rFyJFAh9/9fOvNtgTTci5OEeWq2G5hVGS76BQIsX6?=
 =?us-ascii?Q?RIN+jMdRfawPiu4pPbQdJC/ARVYQUS574ov3ZfYixC26NRjnrqdfNYXrQH/9?=
 =?us-ascii?Q?ZScilRqDrHREyAhKLqZjd7mahoc7YNfzrJkcOQeB0ZwbDwEI+8NZZL3JA/50?=
 =?us-ascii?Q?JHIYVJMl4PA/zxlmMD5xOhTd8dQNdlyIfYTqR4LQT+acgGeLvvxQcg2sCah9?=
 =?us-ascii?Q?i1ghLTOW2vJYEaNhEPejBG7/grTmiZLzmKRgAIUW/a/XnVh3ZelPQPs0Ro04?=
 =?us-ascii?Q?Aol0g0Q4namlXzGao/yMLwzEcTu12lZwEXginlLMJ0TncauhZ4KtGwzclGFE?=
 =?us-ascii?Q?dSSVZcbaSgPrDs2eTHSQXHjqsXdSYp3RL1m9+xqu5+BhRRkTsFN6odVzoFRK?=
 =?us-ascii?Q?XUMOIcxoDzEVnyci7loJOmyPYA0g9JaNGlYG1xTJFGeEzSwedN6JFQpx70Mn?=
 =?us-ascii?Q?3pfEgwMWqMifkd+mILC0VbYItn+GLoBB4hs/cw4n7q1GU/pQoxTMZclAsQUv?=
 =?us-ascii?Q?gWmfxed4rB0R1hk8JTGLuRIh?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5195
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b16549ee-951b-4a9f-a4f8-08d93b1b9327
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bZkNLqLvGk5pE8+jt6O1UO24cnoJKXFkzwdaLRskiEj4kk9hvzWhj1C9HqTVdkfGDW73/fIV0fYrVrxPhPOqMHjXaXm1lZ0pm+onDc0kn4FY1WD0wPUBpwtApKoBH4dBVJq9cG5Ig4ercwvs+D7DwH48e4ZpQGq8bv8Z0ArYu6KPBruPXc3aSj3Efey7sVU90u7Bn7uu+0sevLOqA7kw0NFdX1VDHU9ZqH1zohYmu/preu/zoTRRpBUhPzJuiiYN35H+AucpuyuzS9Ljt76dHyR207zM5bCT5+DehvcN95QkwF/a2EWtpWa7OX6JOkzSAoSBPzoTvna2/M4m96GaoAhF9MGgXirz1870zHhJGxBnZCuc3N0MNIOO0iftGB7n89989ZjWu4Jlql/8Df73OZX9NsIfQbNAkY57w4BWpIzkhlUW9E9HM93IlC5xYt/57cHdTBwQPzNv69tQbpS5Ikz3py06ifXJMGJvlAkrao6r9tGUYAdvXWJdd1lpJdns4CEbTs1m3+tpdxYeEovT3lWcMTQ0MftxKyMYiger/LQ5qtLPngUuG4GU4WOvtnyEU7f0ygDXnMajAHuq9fywmYE4v7gVpRrPYnZBFrSY/ipNm8zACO6YgfD/2/tCuWauAzlquYf6HBj0m9OSKXSGjrECmtLFR38Dq8u7oC4LUoieMHc4EA3gYuMqmLwULbmvLnk5vwsSigcUQqy0FrPr2w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(46966006)(36840700001)(8676002)(81166007)(6486002)(186003)(86362001)(356005)(70206006)(16526019)(36756003)(26005)(336012)(82740400003)(7696005)(70586007)(83380400001)(8936002)(316002)(82310400003)(4326008)(478600001)(47076005)(36860700001)(6916009)(44832011)(1076003)(956004)(2906002)(5660300002)(2616005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 16:33:27.7596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e05e2c-8d95-422a-98ab-08d93b1b9fad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2518
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

Since u-boot recipe supports using config fragments let's use it instead of
patching the vexpress_aemv8a_semi_defconfig file.

Issue-Id: SCM-2329
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: I7feba5d23a6eab501cade38c188cb8414d0b86bd
(cherry picked from commit 1a46824760db5e2d8fb0399c5bd741f80d0d0bc8)
---
 .../u-boot/u-boot-2021.01/fvp-base/bootargs.cfg |  1 +
 .../fvp-base/u-boot_vexpress_fvp.patch          | 17 -----------------
 .../recipes-bsp/u-boot/u-boot_2021.01.bbappend  |  2 +-
 3 files changed, 2 insertions(+), 18 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/bootargs.cfg
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/bootargs.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/bootargs.cfg
new file mode 100644
index 0000000..f899053
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/bootargs.cfg
@@ -0,0 +1 @@
+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda2 rw rootwait"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
deleted file mode 100644
index 0934e40..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
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
-+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
- # CONFIG_USE_BOOTCOMMAND is not set
- # CONFIG_DISPLAY_CPUINFO is not set
- # CONFIG_DISPLAY_BOARDINFO is not set
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
index fb4f192..bc3df10 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
@@ -5,7 +5,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
 #
 # FVP BASE
 #
-SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch \
+SRC_URI_append_fvp-base = " file://bootargs.cfg \
                             file://0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch \
                           "
 
-- 
2.17.1

