Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web12.12866.1617718975111837674
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 07:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MSmAlTDL;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdgRETsNDyO9RMtBlrsIatoiBoZ5sazs88XYPf6Sm5Y=;
 b=MSmAlTDLN6wKFtByiYI8k8+kKZhNfDif0sQoDIiQOIMYu8SVPtQ8whv+Od/QTmG1ZDqTMztccedIDoO4Ts5RnTp8H6yq3qS0MgbWno0ozxCOCxO4wUsGs69yBN/QfK9Lj9+Zhv183hBGKZ6xxHVwOh1S0MZ3qEVxkt484tl9ti4=
Received: from AM5PR1001CA0055.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::32) by DBAPR08MB5846.eurprd08.prod.outlook.com
 (2603:10a6:10:1b0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 14:22:52 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::6b) by AM5PR1001CA0055.outlook.office365.com
 (2603:10a6:206:15::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend
 Transport; Tue, 6 Apr 2021 14:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29 via Frontend Transport; Tue, 6 Apr 2021 14:22:52 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Tue, 06 Apr 2021 14:22:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24d002790c58ef33
X-CR-MTA-TID: 64aa7808
Received: from 873c64da72db.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CED08CA4-0058-4679-9A60-05D7CDB2B70B.1;
	Tue, 06 Apr 2021 14:22:45 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 873c64da72db.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Apr 2021 14:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJOA1Fy3rAFiiIla2XgSww6cGnqnVF4cqSKDTjhsAYswCkD9S36NY1/2vxUGRgrFVWFVSsT1EiBDx6pp7GnKFf5wk9KuPxooU0KSbIosUkIQb9RYbIdA2WDZacs/Ue2s9V5GIkCGDNA3r1bfzlHySzefWhNzbPkwXQSTTSdBfxo3Hidr1iADJ8DoxMrBIWO1w3sx+p6AF/fNRoiBjvynPQRAHcXh7+vz4TZeUvhqtcAMCgYSIK5gVmbLa0SwWGQE3MIvbpJ8kr3ithK4FVSapgqXrpGm5nXJXLcifCe/hExebM3uFqOL7mV1Bh7QFV+3UoO/59XN2/8n8Fv52WlYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdgRETsNDyO9RMtBlrsIatoiBoZ5sazs88XYPf6Sm5Y=;
 b=dFDdDbmo2Adm5tt/CTOqyveiqGDAjVUusyRwrUOjNoHrVdvpWs8jWCB8lz0Ln2T5UQA2Hju0tTMtNOC+LoWhdvEJyBrornRUWQcuvWkgwvF3b8QzwDWrQjGJ2f92PklQ+EsdvrruaS6hoC5E7Q4c9M/4m9h6H8d012fj/KERqJk+HwGEVHVQFJTXqlS9NchDDGYo3V8zSPJRVNCyNQLrZUcI9465qmqNx0Yw9mRmUIFKufrw/Ei3qnCbgwfAIPKGG6RU7RFLlADvaXPKUAML61urHW/6V+L8lrPJO9enKjKKM+05l1mFV0sLmYoC4mHDSUDqW9KR0m8QpxLQdYcMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdgRETsNDyO9RMtBlrsIatoiBoZ5sazs88XYPf6Sm5Y=;
 b=MSmAlTDLN6wKFtByiYI8k8+kKZhNfDif0sQoDIiQOIMYu8SVPtQ8whv+Od/QTmG1ZDqTMztccedIDoO4Ts5RnTp8H6yq3qS0MgbWno0ozxCOCxO4wUsGs69yBN/QfK9Lj9+Zhv183hBGKZ6xxHVwOh1S0MZ3qEVxkt484tl9ti4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VI1PR08MB5469.eurprd08.prod.outlook.com (2603:10a6:803:132::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 14:22:43 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b%4]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 14:22:43 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/edk2-firmware: remove references to 201911 tag
Date: Tue,  6 Apr 2021 19:52:31 +0530
Message-Id: <20210406142231.7977-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.55]
X-ClientProxiedBy: PN2PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::34) To VE1PR08MB4846.eurprd08.prod.outlook.com
 (2603:10a6:802:ae::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.55) by PN2PR01CA0059.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28 via Frontend Transport; Tue, 6 Apr 2021 14:22:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f178b470-8cc5-44da-691d-08d8f90776b0
X-MS-TrafficTypeDiagnostic: VI1PR08MB5469:|DBAPR08MB5846:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB584682AB938EF909DA14850BFA769@DBAPR08MB5846.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:341;OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FMJWhgAHGHdaw0izS8BYy4g1VFIpqHFugKhw3NM1RcpUGRCM4cZusk9YZKl5yGEu0PjyWWrszCT+VXLKFM3IfrYHLvq/0J4FC8WV/198utg+3TXF/oj35OVjHbh3ioxLCwCWxhgp+/fl9k2vQ7DYty+6K67GXr/5jnDJOmTIOzATPmGP814KJcB63w4ac6X/3FeC1W/Emx1T2yKzWwgT0Z9kZBjHBEVk3jaZECdk7KXINXd88XWr8g8QqNBkdjcXNWgTZafuXZVQjKE1JvovZN9Hjtq69uucyzPIPKi5bnU/kNskk5/JxDsSVKJ5fLHhwI22i5PG0FgZwU6banRHUz31dtqFIg/hJEXB2Mh9Sg1WBLrnMDk+eVU6XrpAtAIaSMvLr11cvkDkpIiuDHOP/B9ct/o1fDsFW7UtqK36PZ/jaXdu74LSJ8vbQnv/y4DLhB7nsuiapfyQJ3PnlbFvFm00ZELixOhhHgdvTmDozDNonn7PLX+Y5Px3hQTI3YF+RBgxgSE/FfSJmib0zSYHe+k0SbU9B4MfoQ+8mWyG2H/udNKJmVRsmRaLlYYOVg6B4cwzP/GjL30AtemLNW00F2zX+U8K4GWbKnxqOcyv/9Xla96h0ovuA+RU8iuILWlrAFGqh4UIeb4Lcbafi1EyYGIuW1z3XQYTzYqJZJwzFykDB7DgUl/zWvQVbMuinb4wbtxHn6zn+fRnIHMt4KhQLs0wzL6Rz6Bm59AcHdkGNeYorxmGO8pXzgZ/dyrLC6SM
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(2616005)(66476007)(66556008)(83380400001)(86362001)(8676002)(478600001)(38350700001)(36756003)(2906002)(6486002)(4326008)(316002)(1076003)(6916009)(16526019)(52116002)(38100700001)(66946007)(7696005)(186003)(26005)(5660300002)(956004)(8936002)(6666004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?fmKs5Mg3R6WbzDNggXrftioblbkp34MTCWTxDaM2V1QKVSfu9bSFsko/CMOr?=
 =?us-ascii?Q?avzXJGCN8yQd/d+t0mkl8qK/v0rb0m9HBQm79rdzBw9igzLK+m2kJv9Sf9w9?=
 =?us-ascii?Q?60HuFUA17i5d5+K1hML9Q9REWalUvI6kwQ7kPnU72bMKVfxIHbDEEGuQD/2o?=
 =?us-ascii?Q?sPcpTXCCLOeAOIOK+iPGM8/DTDJOw9qRJhiihXMfiWF/VB95wdoWDMzRd7YL?=
 =?us-ascii?Q?cwZ//vfrK/DLH093xT5SrZ0XA4T5RcCpPKXdBjYW3NIffJnoF+zx9Yqlri+F?=
 =?us-ascii?Q?bMx2qRF6i6OIys7j91I5vjYTQ6AVamD9vqJ3nU6orFBZU19U2wV/JrSPNNX/?=
 =?us-ascii?Q?3hc0eHjz6mAIYO0FeW37GaaLAAZcj5Y2Lm8FWTTJIeG/VYvMhRkK5+TEYgjE?=
 =?us-ascii?Q?A3TWRF7cGFvYgLmrsHkOzLZWFMvJBP8kfUIJZKZS+8e3XtLYX38pBeKMhoj+?=
 =?us-ascii?Q?KvJErvfhfTMPOBbDzxa8cPESIplALRgfgd5jD+26BSbDDVpqo43obNLli2Uo?=
 =?us-ascii?Q?q8B/KyrhMM7I9c1h6fGVxS0p22qNeziSwsIvsjfPsTtvMjCUlSxidsXsuerC?=
 =?us-ascii?Q?YQByTSeqhpR0v+WIgeP/QJ9UcbqmhFrS8DmwTDzQmvCQg9c7fEEtY4LK/PNW?=
 =?us-ascii?Q?rC2jQ82T5j9cP/Zo3KrT3ZXtpVcYQ/u+0pg+HsKSY0E3abqia5yT1zh9Tko6?=
 =?us-ascii?Q?4Ve2mzOizK6Z4wv/jRv121YIHmeZsoki9Yd+pl4nyTWkvPXvLE1JZrjTs2e4?=
 =?us-ascii?Q?8z5IvGGzB0/xIqjJl8pSL6KsJN6bEwFzRZ2Ub0Zdbysg3xIajOBPv5dY40Bb?=
 =?us-ascii?Q?jeg/CfrSUQLJVNTDptRRkCIwysfhJJ0BNljDvrlyVFKScvx2m6Gmgk10p5Lo?=
 =?us-ascii?Q?gfA6u4Vn5JXRQeVLml6BcjbgROjFA6KME6VE9E4dyeMUwZiouG/wvu/W+ZmI?=
 =?us-ascii?Q?8xkQDAJ9SeRBwzikTuiSV5qnlxYxpnRbEaUwembLh6G4alxhurBzPimrpJkI?=
 =?us-ascii?Q?VDBORig5PCnGkSUHFNENiZrWu3/i5tu3Y1eImv60eziplpE6tpwprodowgAf?=
 =?us-ascii?Q?pB7spe0UInqpqR1lAX9x3nsgMI05x0OnS6ZEQlIo+dAyzvpajnIr1tlA52c6?=
 =?us-ascii?Q?U8ovNxNoJwlAbTwhv2q1ONs5Jr2aR/rYs2F8I+EF+Xwetr1Fct3+7Ytc7kLn?=
 =?us-ascii?Q?9NQEalR5Z2XHKtmzzDaKLqocp808XIN7AaAbIebPfZWFUE1zW+j+7VvjHSti?=
 =?us-ascii?Q?iioyUgVHrkIz4M0YOBMpBwJkxfN7plbVismvZzOAKOeuR32NNPFHy+t6zbE6?=
 =?us-ascii?Q?O6Ce2uQMdrWJfKDNgfPUSiaE?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5469
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	82f305f5-d08c-4288-26c0-08d8f907712b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6rt8LN/TQMiNLyOiMbMGLQBvy2uelXX0h1igDNazBa5gzpnTcdGamxISKhKsCDNc/6QYq44lCJdE626Bjj05TDhBnAvqnf1NhuVO4NaJEUEEbbarFjJokUXReba6H+U4LLCBelivFNYNPPLtixLpjW7xmZbuLLD82cHH43HcZt8Cqlu9sQ86CeDsqHFOzZhJrfYLMo7P7Pm9z9dQpTS2OnRi/HIH18G2TR/+gKeUXwTszFNyT5o+No6NYSs/ZF3/JubokyJixmf0IkibPbNsiYpAg4r5X1tdYj2w06Qmv9vjaG8EvfiyGruEjxy+UwBisbwZBrHfBiCwCIQ1CJ/uOl2n1YUN1kDwNtPcnv9NprKa69HBTi0ssjTq6y1LsXXHtGc19qgPsnu1egu2SZ/ZmII7ZFhn4VauNQspTP1Be8mZlhw6Acw7f7wyQvULFEKCdiUIAoMzKvZC8rmu9Iw5MRXTb70MCyBT2s4j4rFZx9AleVhK+cEctcfKRKr+k+1VERuSMDwqxaCAIqCgwmB1CuCcWvFYlrWqKvtxUqPHcfm88XK2hRP20CSNApF71CBlLdgpGgEcHAiLiaD/ZSoA1Pbg/e6QhzN/RxBmktiORnqLIhHToOHNijYESGGRcpr2Jk+iJ5OhLAnk2MJbuhnrJ7cwYK04KAdSLlckCp8CNSOxkSC7cGx1RDVBm2O7dRhqufgIaiqvtNvcS1B0R6xHQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(36840700001)(36756003)(8676002)(83380400001)(5660300002)(16526019)(47076005)(70586007)(70206006)(956004)(6916009)(81166007)(6666004)(2906002)(7696005)(26005)(478600001)(4326008)(6486002)(36860700001)(8936002)(1076003)(186003)(316002)(2616005)(82310400003)(86362001)(356005)(82740400003)(336012)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 14:22:52.2995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f178b470-8cc5-44da-691d-08d8f90776b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5846
Content-Type: text/plain

edk2-firmware for n1sdp is ported and upgraded to 202102 version and since
no other platform is using 201911 version of edk2 firmware. This patch removes
the corresponding bb files.

Change-Id: I91b0e98a3df499fa86c5ea836c96de193f18990e
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware_201911.bbappend        | 8 --------
 meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb         | 5 -----
 2 files changed, 13 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
 delete mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
deleted file mode 100644
index cc25ee0..0000000
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_201911.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-EDK2_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2.git"
-EDK2_PLATFORMS_SRC_URI = "git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git"
-
-# TAGS and commit ID as per N1SDP-2020.03.26 release
-SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
-SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
-
-require edk2-firmware-n1sdp.inc
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
deleted file mode 100644
index 1ff24ff..0000000
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_201911.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-SRCREV_edk2           ?= "bd85bf54c268204c7a698a96f3ccd96cd77952cd"
-SRCREV_edk2-platforms ?= "46df7b29afeb846ee664e48949f9c8161abf1f2f"
-
-require edk2-firmware.inc
-
-- 
2.17.1

