Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F9DC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 17:15:11 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.70])
 by mx.groups.io with SMTP id smtpd.web08.10507.1645636505614357469
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 09:15:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Q9FjSzJw;
 spf=pass (domain: arm.com, ip: 40.107.4.70,
 mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Hh+T6yPHSUUlIM6W/XAy5Sajq9x99xd7M3Vbz44QHE=;
 b=Q9FjSzJwMA6B1G2Ydp624P0XnNj7EPgXQUI832g4R0RUqdc4eOm1H42580pXKkAomzCu/muklg4xX954yC/C5WJlTEEcsNGhqN1o42cYUtdu52WjJAr6FqArt/y5FF7kvwuySkHWJR63zpr656wNUTR4WNaWr3sg4UHHGy9mQIk=
Received: from AM6P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::38)
 by DB7PR08MB4604.eurprd08.prod.outlook.com (2603:10a6:10:34::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 23 Feb
 2022 17:15:00 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::ff) by AM6P191CA0025.outlook.office365.com
 (2603:10a6:209:8b::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Wed, 23 Feb 2022 17:15:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.20 via Frontend Transport; Wed, 23 Feb 2022 17:15:00 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 23 Feb 2022 17:14:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d5c575c6198950c
X-CR-MTA-TID: 64aa7808
Received: from 3ecd27ee459b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F08B6905-79BB-45DA-804E-40F9ED2C8651.1;
	Wed, 23 Feb 2022 17:13:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3ecd27ee459b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Feb 2022 17:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX9UtXyaJl/1B7psnKDrgqiMECTi5oNAuD6wDPaKSuwyhG7yzmZ60+MlusyjiiNr96oTiUk1NZgyUzuPiPJ2gxRuXQefE1wnSGwKkTOEA0ES6iP4o4Q5euHnOQXRYhb9tWWwrH3ZTp+lWT21aJRZrCs/YBAnLC31At7xONeTnrz5DSD8BRib1k8LoldGHdJPzxtttc1JJISnUQZQ9hQjqd7itmZDVk4RpNw3ZAd52z4KWTvsV2orMNJtUu20gJzr0iC567cIr7LmzrhjQ3r+nJ/ukS/XVZVHnbv7bBKqhZBwyzi5tAbIGDytwt/FSm+fXP0ofoJzs5DU2PPCN0VN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Hh+T6yPHSUUlIM6W/XAy5Sajq9x99xd7M3Vbz44QHE=;
 b=aagoy2w2gHXCkQc6T44FOxt1WSKpZiFdbFUrkUMPh1i+o7gIdeJDrUIR4MYVYhGvM715Gski130qFGpIKtAVGnPGK5Fx+EeLDnklqWFPnGh5vAkoN6YU4wU3/TqB1ZK7qF1q8wz/+JpyaNo2SRGeYRHyazcg8dMtiDvD8cqA8KlEjLOYTU5reJj3w3LIDGJGakwQwcNlMH2l+rBlNCN3YstuQM4snrLMAS6XAfQ0BgIFHdjT4iY/ldurbvLc3oUMl6eyak3AUPjVD8a1qVVl5zwCxt97fKDRoEFA3u9EluohhL+ms3Z++EP5ZifB1OJ7mtrLH0TVxTNLf6rZC42PDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Hh+T6yPHSUUlIM6W/XAy5Sajq9x99xd7M3Vbz44QHE=;
 b=Q9FjSzJwMA6B1G2Ydp624P0XnNj7EPgXQUI832g4R0RUqdc4eOm1H42580pXKkAomzCu/muklg4xX954yC/C5WJlTEEcsNGhqN1o42cYUtdu52WjJAr6FqArt/y5FF7kvwuySkHWJR63zpr656wNUTR4WNaWr3sg4UHHGy9mQIk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by VI1PR08MB5423.eurprd08.prod.outlook.com (2603:10a6:803:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 17:13:09 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::30e1:4bc:62f3:7a4b]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::30e1:4bc:62f3:7a4b%3]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 17:13:09 +0000
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 1/2] arm-bsp/linux-yocto: enable autofdo config only for TC1
Date: Wed, 23 Feb 2022 17:12:50 +0000
Message-ID: <20220223171251.3156859-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::34) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4191f6e6-c966-4027-8c77-08d9f6f005e9
X-MS-TrafficTypeDiagnostic: 
	VI1PR08MB5423:EE_|VE1EUR03FT064:EE_|DB7PR08MB4604:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB4604E93D41580E9F5A60DDB4FB3C9@DB7PR08MB4604.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oL5e1nIzpQK7aQh+Y3pVgpIyeM0xYDeaLXQPrUet8GjPvlNABBN96i/4KaMk93QvnMipqn+hU3LTZNDB4Twr0v6kS6IfFhI+SQX2r6L33xO6DOK8bvRmN3kDkXUb6ZEKu+hT44BsxSH31WMAsm0aLnKJGO5qItb3b0F2XubY54PFgtAuJecLQzv9WeNXxGkm9gPg70/3xEMyi9Ma4nAOy/xuSeWnnLZE8B2B7ongcWLsYkTsi+MPkd8XwORDu+5B0zqQsa4+HtqvjDQEHAPHPGogni1ABvpBtxnLrDRG52MEHqXguhGIp06QEEx3ywK2u5YvxPo2pZUGyWMTpVf4PmzkQAbSPi9ygqIWosPA6U3K2kLHZrlXJUXtaqJyQ9LTOc3Gn29PEQlWAygvs6mg8R9apttuqSeBz/IEGA59CMVGFhdPvrYs0Lwmm65VoVCCEkUZkRbcuRa5UDeFkpjUaSye+Y5R9cLndVAC1owDcqdkLz6iBbnUdrfhKBAqIi4WFzJIXmCLfrCpY+6NEflIjZTNaoOu1m+wATMj3MFtkUCzxLdjyrjx4L5e7gYX+BaIqe8HcnFTBlBojvlC4y169vSnn+BEanPXY5DRcWLPmMfL3uDW0oE41YsGg586rApXt5qGoxJg+Ids/LvNB35lhOZuhgE8U2KFJHVHqFRPDQH6+/XrB4vGDV8MI+gXtJQtEQZrYCmUJhv0lgR5L44wSw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(6506007)(86362001)(6916009)(508600001)(52116002)(6486002)(36756003)(44832011)(2906002)(5660300002)(83380400001)(1076003)(66476007)(66556008)(8676002)(2616005)(316002)(26005)(66946007)(186003)(38100700002)(6512007)(6666004)(4326008)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5423
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	791e6c32-2bda-455c-5fb2-08d9f6efc34c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j/BRzoX93146M9DEtbigB3/Tn8FmwWqG1qfGwjCvh+JG1NkFSuAQLNPOvXuWpfn9Hl7xePxIyDm5WpZkXi1lLgMYK7IzIgq8FvQ1k+6LrjA2gV24JvIM7Adp3fQ1t8UnLMh0Kvi31vHFoTV7nsrV0VUTklPLh9ZpOUXf8WPSRBvafx7xUr/9ZPiHN0lfJrEexTqT5siQEnYjVL3+sLQgllljfD/U8lmgMsIn6bKyUryQuUnHUaJG/3+g2C+VgbgLkqhEn9AcAMzWvcx9rIE5aVQK5gVZJo20tZ43HlqsoHUtbsqSkUlgNVgg0iP9HThqM1shRo+Qf6/fqgYaYvk1VYtoiaP5G7nZgMXmeX3YqTHQ1/iNp0g+MMNBXEBtkDP8u9vITjFjcJVRsAaYFvAY6sb7o8IyVIIPSKE3/rLuNAie4iLMT2j24NfIUHp6jdifHpze23MdT2L6CXSem4O/5VDvxKp07GlRiXzuwQJ9OhjaN5SBB4v1Z3QHh4p6kWkQYpcbD1CnlnX+zY1t2dMpxNRpJHzE0oL6UMouyq30Zd+YG2ZO9RQ80rYYvFwwemus57bCoZHGXVvUupHC/qrkBl3RKGSxlWOKLT8MFFwXLn/Yjj3NIEo534LQGO46H/eF5inxIVHBDWXuAOH8G3o27mpGMRfDaMS7zvEyhUazaaxu0Lw5YxQEdXZU9vu6EPj/
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8676002)(8936002)(86362001)(6916009)(356005)(44832011)(4326008)(40460700003)(5660300002)(316002)(82310400004)(336012)(36756003)(6506007)(6512007)(36860700001)(2906002)(186003)(1076003)(83380400001)(26005)(2616005)(70586007)(70206006)(508600001)(6666004)(6486002)(47076005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 17:15:00.0318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4191f6e6-c966-4027-8c77-08d9f6f005e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4604
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Feb 2022 17:15:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3045

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I75219f174f2fd0a9fa67007a4bc45acecc324390
---
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/tc-autofdo.scc   | 1 +
 .../linux/arm-platforms-kmeta/bsp/arm-platforms/tc.scc           | 1 -
 meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc        | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/tc-autofdo.scc

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/tc-autofdo.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-=
kmeta/bsp/arm-platforms/tc-autofdo.scc
new file mode 100644
index 00000000..5b20b6c0
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/tc-autofdo.scc
@@ -0,0 +1 @@
+kconf non-hardware tc/autofdo.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/tc.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bs=
p/arm-platforms/tc.scc
index 62748e1c..86e450c6 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/tc.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/tc.scc
@@ -5,4 +5,3 @@ kconf non-hardware tc/gralloc.cfg
 kconf non-hardware tc/mali.cfg
 kconf non-hardware tc/tee.cfg
 kconf non-hardware tc/virtio.cfg
-kconf non-hardware tc/autofdo.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 6db68b1b..c68060af 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -190,3 +190,4 @@ SRC_URI:append:tc =3D " \
     file://0023-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch=
 \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
+KERNEL_FEATURES:append:tc1 =3D " bsp/arm-platforms/tc-autofdo.scc"
--=20
2.30.2


