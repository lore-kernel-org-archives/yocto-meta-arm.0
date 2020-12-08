Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.72])
 by mx.groups.io with SMTP id smtpd.web12.8841.1607436371338003983
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 06:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kKvKIwxs;
 spf=pass (domain: arm.com, ip: 40.107.22.72, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/KoylgAzMazZtxu/Ccsq1rIMa5Mqh/dSWLtCVzrZis=;
 b=kKvKIwxsttANYAfByGnNoXwYvwOZZUHg/2wLH4KHhy2FbeQ1OU/dvwARqK6OlLADjFbYjG4oW/VsZ5ETHDQOVh1kvrdagvG5aGL/AGiGUDk3s304MclSlWXl0PbwQ7q7ykTmpdsZIx5smLEE63/D3aaHZnLnN0AJvUMKMqBGJKo=
Received: from DB6P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::27) by
 DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Tue, 8 Dec 2020 14:06:01 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::4) by DB6P195CA0017.outlook.office365.com
 (2603:10a6:4:cb::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 14:06:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 14:06:01 +0000
Received: ("Tessian outbound 6af064f543d4:v71"); Tue, 08 Dec 2020 14:06:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b5b125345a4eb47
X-CR-MTA-TID: 64aa7808
Received: from c829d652dfe4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54A3616D-07A1-4E86-B4C3-E78B575DD034.1;
	Tue, 08 Dec 2020 14:05:38 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c829d652dfe4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Dec 2020 14:05:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMe7yJvk2PVrwiG0QCVqjt/V21EJ1bOGQvaapyk0caKdKL3rGrlgxcEgwEpxb1Fd1/FyR1EYm4fZlhtWoCYFJr84gLOJyfLgpJ+05Quyv/6s92NtG9OG43RAuotsJG8IqGqmlKdmaMmKASdwRN59q1RdLM3xX2wWZULoo4LVYWc/G0aSQRLsf9r9jesQp8vdIuwQcZVmmdmDcMkFv+r4ROCWAzrBHxMzW4FZZ0LTFhJrn1EIHGFyybk7jYD7nlTQONXZ818ZhjRJc2RKfFvrQWELtO5/COB7praVL6eKVBjNUiVu/2QIv8te5/5N9VdvR+DrQ8pv/lIsgSGWXTIm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/KoylgAzMazZtxu/Ccsq1rIMa5Mqh/dSWLtCVzrZis=;
 b=J0Jn3tSd8IcShq+Qaqy0pQL6/WYaEkl0dCdr8QepWzCSWjsEDMnYSPvA4P2m/H5T1UUEwCwEd6Tdv1LyE+BfoZKSAUpO6QlgV1aNiltGFAymO2UZ+32+dd9aAKezRxWr02ntEreXWlVpfUC3zzuf3toR0nvsI02ybGU4Pg3S82o7k1fCfNwUUmihlUlUGoSoNO7FXeiMp04gkLpmQ24kqNiv8tgSQDLkaogMlO5YpcryQdT+VBmlJ9T8P1D7mD/URvCP1yad2gsDflni5cnqYte2jUtyZY9RaTL/7qlgk6cInl3QQw6JdRFPGck744Uf/f/km2brR9Xw2a9igDT3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/KoylgAzMazZtxu/Ccsq1rIMa5Mqh/dSWLtCVzrZis=;
 b=kKvKIwxsttANYAfByGnNoXwYvwOZZUHg/2wLH4KHhy2FbeQ1OU/dvwARqK6OlLADjFbYjG4oW/VsZ5ETHDQOVh1kvrdagvG5aGL/AGiGUDk3s304MclSlWXl0PbwQ7q7ykTmpdsZIx5smLEE63/D3aaHZnLnN0AJvUMKMqBGJKo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6135.eurprd08.prod.outlook.com (2603:10a6:20b:29f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 14:05:37 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 14:05:37 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy/init: Revert Change execution order between modutils.sh and checkroot.sh
Date: Tue,  8 Dec 2020 14:05:30 +0000
Message-Id: <a3921c6f414d6c11b9721a17f196e30f5b50a600.1607436255.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2584bb9172dd000f8162f27be6a90c9f2a5147e2.1607436255.git.diego.sueiro@arm.com>
References: <2584bb9172dd000f8162f27be6a90c9f2a5147e2.1607436255.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0190.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::34) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0190.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 14:05:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5cff4a9-843d-458f-d67b-08d89b8264db
X-MS-TrafficTypeDiagnostic: AS8PR08MB6135:|DB7PR08MB3881:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB38818241F995B4CEF9D94A0892CD0@DB7PR08MB3881.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:248;OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uFlv2QqVN4p5FsgtRrqshWlAYMjiBoBNoGmrPP/4gjSo/skMcfzdPk4E+Apr/KxIFGUNH2Ei/4sudGBpjVvsBFEiILuqjO9I4h4St73YLl2muGJd4OD+tcz0QewC89RT143QEqLKLseInsVEJWNvCi7k/W8WMDDld02z/yVin+iaIWhtNxDjgUTWC3yQqv0LBt7UY+7NDFYiDfU/ZJp75obKRoxmX6i7nS9jHO+z13E59pmK86HM1QDdOcZt/NPtGtwdtPAduRmRsOIGWuPxav9LfISfUWQHE+KQgaDiEFVaY6P7meWoO3sWO6fNQ5zYlNOkdH89sVOUTT9NV2eXqys3gNl7Uiskz36ajJwRioQ/dvGRxRvLQdBTNW7tv6Dq
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(4326008)(2906002)(34490700003)(86362001)(2616005)(5660300002)(6486002)(956004)(52116002)(186003)(66946007)(66476007)(66556008)(7696005)(83380400001)(8676002)(26005)(6666004)(508600001)(6916009)(16526019)(44832011)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?OnPFQ5jRasUTr5ODnc3YhbRlZ/0PkcNfVIKowrdXpGass+62MlotXTFAfaLk?=
 =?us-ascii?Q?rNvNfGdkoxb68YlhvQdMr2s+ZDNjPQRlhYnEsMC3MiNwJng+4s1HFvXmUClv?=
 =?us-ascii?Q?T9+x9xCndqmb3mvOROv0hYTup285MoMOmyTotN87ak4RlEG9s8g9LS8sCbs7?=
 =?us-ascii?Q?TIdlWOXRKO7LzaEDyIuIsn2haKJKLlP2DwZunHxbOCVB8zsX6fweO6lEVMCp?=
 =?us-ascii?Q?YLjCapTWsjV+2YB8wLITwEOwJ8T2V431U9zAPhG8FNkd8dY1bdXL8SzYz3y7?=
 =?us-ascii?Q?QP371y3rzgJ8LkMIotTsJjwwyJ3EbYzQMs3eivFDqMcybo1MyegQbjtE/GNr?=
 =?us-ascii?Q?asZVUgx7kkGgK3hYH93+Nl7e1wPfuy2jKTlzmpPonC9cACRUwjF2Iln2gwNp?=
 =?us-ascii?Q?6IxdRffGzsyFOwXpEto8JyDWby+mbVIhmiyg5Ix+FAUjxipTKrl+p0IHT2/i?=
 =?us-ascii?Q?OCN82/qT+mEZZFurJFgG62XexgnuVpT3fbsaItXH/THxHFzkfsVDnIYWKG/6?=
 =?us-ascii?Q?yhPw5j8HVqfoVLdkQ6H4ErVmkryc4QFy8HqAuzX6z+LX012uPYW+XsCj4F9n?=
 =?us-ascii?Q?tDX/jWowIXYc/pHpF+H11jnOxHxd9eD37zwcVTOkqpnHHw67NFUBoDyi4aNf?=
 =?us-ascii?Q?wxyeT12vTY86aKlCdIF4CjLCU6OPfmkWTpoIZFWm8xGBfHHxct2hVaJpdRpW?=
 =?us-ascii?Q?hkOkaT2ZuRsWVGrm0/hVxXN3yRI099dKZHZXUgg55wQaSu/ht0GVZXM6Fi2v?=
 =?us-ascii?Q?3HFyrE63vC5ac7P4smlTVltO5X7V+cRZMwI3szocwc5A+9QuIUnYI1hmLCMt?=
 =?us-ascii?Q?m0EFAGHnUPcrVEl1G5uBv0RkyFhRfN8SuWaj6qlSwbsxEihUuUqZkh+wEZOq?=
 =?us-ascii?Q?JfkiojeGustdLrk6nn9qQNjRmpcty5fCR0QT2LZsNWKSYhE8C5b/TbOqxaMz?=
 =?us-ascii?Q?U6Xq5ud501drQQBovCEFX6QiWK2S9GXIJwdMdXZMw4sb2Lgnha9YefDl8OEM?=
 =?us-ascii?Q?mvc+?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a9278d9-49c0-4ef3-7a3a-08d89b8256bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8UiuQsmT8tW+341sg63ZoZx86YFGr96JpmpryVd3IClAES7zXLpoM/iOC2oUJapi4qRccSVxZLOA0UGa3S6pW+kjYMwRXnvs86x5Y50Zzwbt/rOyKRKBL8Qs0f47yrYTVIFoOuWFHr4lpP8ecXNCN0suXuIZyNlCIhE1WHvqzSw0N+jYdHtYEAPw9dFzAgeKbVVoi+8dIgj2GWF7PubYWmTWWFydh7pltPZQQZkmcCDyQk0hCsJCTTx79hnMupHnx2bhNDJRKlr80J2Bicj6uRiUzYfOqmLUt48Uw0XttE79RkodCAvCMWXpALP9Q2g8z4m+MHO7JznMb+VHwg712xIc8kgYc1SF+JbLvWD5cDKM3pQZDWYSI1pnopllueYjauMupalM3P7RD90122k27w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(46966005)(4326008)(81166007)(83380400001)(47076004)(7696005)(336012)(36756003)(6666004)(8676002)(86362001)(356005)(70586007)(70206006)(2906002)(508600001)(956004)(186003)(6486002)(16526019)(5660300002)(44832011)(2616005)(8936002)(26005)(82310400003)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 14:06:01.3037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cff4a9-843d-458f-d67b-08d89b8264db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881
Content-Type: text/plain

This reverts commit a996166e851a9245688fdbbcaf839e239edb5ed4.

The fix was merged in oe-core as: 39f16d7dc42dcfe4a3fcceb8e476ac3c1e0ba3a2

Change-Id: Iab8f7d7b49fe62f04a5c77c1b48ec7c4fcf5c617
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-core/initscripts/initscripts_1.0.bbappend        | 5 -----
 .../modutils-initscripts/modutils-initscripts.bbappend       | 2 --
 2 files changed, 7 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
 delete mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend

diff --git a/meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend b/meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
deleted file mode 100644
index 5fb2197..0000000
--- a/meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-do_install_append() {
-    # We want to have checkroot.sh running before modutils.sh (06)
-    update-rc.d -r ${D} -f checkroot.sh remove
-    update-rc.d -r ${D} checkroot.sh start 05 S .
-}
diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
deleted file mode 100644
index 2a2fd20..0000000
--- a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-# We want to have modutils.sh running after checkroot.sh (05)
-INITSCRIPT_PARAMS = "start 06 S ."
-- 
2.17.1

