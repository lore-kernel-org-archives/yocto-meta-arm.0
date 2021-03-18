Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web10.7721.1616068617525938872
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Mar 2021 04:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IEmbQIeJ;
 spf=pass (domain: arm.com, ip: 40.107.20.89, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OirWv4qx1uOV7t/UdJQiX4xlf7A/c9fLuY1UgEpk2YM=;
 b=IEmbQIeJfBBGza6j2mZXHwAbWeKhiHkGm+U6JfKvpp3WfXH6z8nAe3RuF+vTok3EB9XzZ2rFnfpksBcfalnaaH/OYoI5I25cU39IqYZdL/NEoJTxIJh2s4v3rtgjjwZPeGAGXYG+fjcuKoLQNZrfhnd5ce6ZuXowPmu7MUDkyo0=
Received: from DB8PR03CA0032.eurprd03.prod.outlook.com (2603:10a6:10:be::45)
 by AS8PR08MB6214.eurprd08.prod.outlook.com (2603:10a6:20b:29f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 11:56:55 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::fd) by DB8PR03CA0032.outlook.office365.com
 (2603:10a6:10:be::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 11:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 11:56:55 +0000
Received: ("Tessian outbound 10f3eddefbbf:v87"); Thu, 18 Mar 2021 11:56:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b5887f4345bea26
X-CR-MTA-TID: 64aa7808
Received: from 195a09008d6b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4D2172A6-1C43-45C8-BE7E-CBC4396BCA20.1;
	Thu, 18 Mar 2021 11:56:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 195a09008d6b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Mar 2021 11:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=babuqBLNei+Fs+FcHO9yv0W5vzgVC03ZK2lNfnI5COvxirERaMX7aMVSSKBeua63o1g4Ygtn3RutZRNYKghDUEDowMzOv7RcoqfDovPXueiIY7tjSVeAC/AljeHFivuj+ZBOkPFXF8nfjEkxZDMaHn46Ys3YwVWv+trWl3VgFuIRa5Igeac4D3SIaCctxGkX6vCb6AhyBoqpS8+wkZF+wfq/2jCbUxPyhtz4GUrM3/mEcGRn2C8d3n3Zt8g0vUFrVPHTFi9vLMyR9QCI4W3czB7V+zjuzNjcxQ4DZX8pBLOBoaqUDcW9ci4JhhpEh0z5XAqo1ZbzDd8n/FFsuzaebg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OirWv4qx1uOV7t/UdJQiX4xlf7A/c9fLuY1UgEpk2YM=;
 b=e+IyjFkts++7eL2QA5R4M/NSSVlPDsQrN8OCmObbtq7kizCb25k/v4Eqk90LtqoipqIkTnICxZisqj7CElbRCNjwsXseRJccVKykD8sLr6lv+7Z7WsI14RggGvJaimqVJd1pFXKcY89jw1+1XX7NUhmTdTM5Q3PMoZwZu4+CztcIWINlG5gD06u2MPqkAxfcqqj+4xL66IM6Ot5uKoAKDTBraq21Nc45Omgnt7gMst/Zqxm9XXY3ttpsQY/MRzZaC8HAlZn8RB3I9ueNLnye79lfkCrjt49QqBXXR4VftLPUrv2E0K1Uq+WipWOgusM6BzjgFi/6NEyevzV9enpouw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OirWv4qx1uOV7t/UdJQiX4xlf7A/c9fLuY1UgEpk2YM=;
 b=IEmbQIeJfBBGza6j2mZXHwAbWeKhiHkGm+U6JfKvpp3WfXH6z8nAe3RuF+vTok3EB9XzZ2rFnfpksBcfalnaaH/OYoI5I25cU39IqYZdL/NEoJTxIJh2s4v3rtgjjwZPeGAGXYG+fjcuKoLQNZrfhnd5ce6ZuXowPmu7MUDkyo0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VI1PR08MB5470.eurprd08.prod.outlook.com (2603:10a6:803:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 11:56:47 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b%4]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 11:56:47 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp/trusted-firmware-a: bump to latest master branch
Date: Thu, 18 Mar 2021 17:26:34 +0530
Message-Id: <20210318115634.29604-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.55]
X-ClientProxiedBy: BMXPR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::22) To VE1PR08MB4846.eurprd08.prod.outlook.com
 (2603:10a6:802:ae::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.55) by BMXPR01CA0012.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 11:56:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a32a7dd1-fa77-4815-320c-08d8ea04ed3c
X-MS-TrafficTypeDiagnostic: VI1PR08MB5470:|AS8PR08MB6214:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB6214677F2DD73FFF60EDFEECFA699@AS8PR08MB6214.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 o5TJE7FDn2fVRHZpFU0dV6Hv+JzwOFYbGIDGfux4zXPL3IGpKLw8xfkDJyg+DGYpQYV+Nlq5PPy9j0NuTvxVu2gF+1QeLn22lEoerO55SeXYYMQMcgVCE0bby46y1QzdusDVZoNpB6GOrjjl5bShCpfMq7nf6abJ9C+Jf3EdRnAJ3NYRSbXrJJNGK63eHqnbFPEW2Yumw5EBp8DhPW47clWdRxyt7NmLAl6fiKDt1V/7tEYXKbz1tY3tr3mWMp3Ab3Ihumd0Zr4YQj2U4rCk3pH99e7E0p2v5SAI+Kb/+Qtct+zpC3KLEmsC+f5M4FpScrM0V9lSxugNeAPAKugy9jtfClHhUYXEzUzSB+LCUrU/CFMeegCnqcx3Yk4MRCPpggN9VmdDseZEBv81JwSG+CsOj9CbkjDxr1L3f1l9btliCOUf4nS68GlLkk6PvyqkAVdxsk3t9Di6vl4jL9zb4gAeByFfkQ80lkfItDnjLb7/uMRMrrviNHUaZThplaQuAMoaERFVlYPkJDDAfmJa0LAYjF54lpIH5yJD1nmEAxNTmMbdgHKxSvPQpulDPU2vs4LLw6BNxV+G9WcmRDQo2WM1dydyNVShsOJMzZFFgQkDQVye2dxDZFxRiwEOTgYh
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(316002)(66476007)(66556008)(8936002)(6666004)(26005)(186003)(66946007)(16526019)(7696005)(52116002)(5660300002)(1076003)(86362001)(36756003)(38100700001)(4326008)(956004)(2906002)(478600001)(83380400001)(8676002)(2616005)(6486002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?VDfwNhGWEe/kH5cTX8GgPb+zgivqkolL1Paj5Ntjbwors0nPpfGVImQ8Ef49?=
 =?us-ascii?Q?rr742pUE0/yToR0bfrK7lcUKaxsRDAWH78BJQVeKp/QEMtOE9fhXkig969EG?=
 =?us-ascii?Q?7D78fI3lu/KQJ3rXjyZKFTUtaqqSbaa+nVGY8EtEq6i6fNWrBLuHj+o+RpgH?=
 =?us-ascii?Q?VI6VXHrBhhzpd7zicSyeinQusKs+V1sM2RBuNtlYLTDHgWboM0uR7FmX0GXi?=
 =?us-ascii?Q?S4q5uA4fFNk5VyjXSbSw5/LhhCnp5Fw4WDcfeaSCdmBHRnhYanwOvym7Gsmj?=
 =?us-ascii?Q?BAKbRLddbGlBuFDudWMy3XBCQfWUjO9m/yc/6oFuwogoQ+w9+2Gekd7vFCJf?=
 =?us-ascii?Q?D+cjYnYtJSB2dVTEP8Ur1hsVJHMYH7U/rPqs02Li6vfwNpZpeSA0uNLZfMnV?=
 =?us-ascii?Q?ovMtBSOQATt467GM4iSpRMhTC1UrahxGxsm+wtW1lxYu51qzuhvotgxdKwHD?=
 =?us-ascii?Q?VmA+xrMY0KOLNfltnptMHu60r2u6cqp8aEcytUIDn7anwWfLBCBQH3+QS46I?=
 =?us-ascii?Q?ADySwKURpLSM2GKwHMOCHo9b3N4oNEQ0UwFGVVcoelSd+c0Qu5+gmiwRZGO9?=
 =?us-ascii?Q?0/k/lwRSlVFSDkkrtnxmFiwiVZJWi82wl9BZqEplYIYR2zUApH3+v2QEFf/2?=
 =?us-ascii?Q?BFkmWO8GvJt9n56rqQuYMicpCBbNYvg7nqMnRFHwZOxVwi+x6zGpOVNkjLfZ?=
 =?us-ascii?Q?jI6uD5w/RroZc1BtckXeEH4AtFvxdhqziIsMb4SXoc56o8q81uya6X3+fxAM?=
 =?us-ascii?Q?AJS4ub8arkKOcX2V0zQWxTdRKkJ74Mm7LDZgqiBpkwqL6s5+foIsEjIDb42/?=
 =?us-ascii?Q?/pZepdAp4Oz0qiYmVjds7g+YfA8PT05iIDS3hBYTzhIrdxNfrq1xCyXM8fu/?=
 =?us-ascii?Q?X1X5RJle6shJSj2KjjN69cPgeI3/jLeoQxOV1F4UyEPiTBcnaqLY1w6lmeVP?=
 =?us-ascii?Q?2XF4h3QJhLuqo7MlAqgenpfCboV7+KL5MHorSOQdBfiQWBsvxcbvncJKwN65?=
 =?us-ascii?Q?RrUW/c9xfg8L7c1zq/+gwPoig0XIy92P0Yi7Vq6iyfHZBvOuhF5DGGkHSEGU?=
 =?us-ascii?Q?xXAJXwhq+KU0LJ2jRVPBWnyzn7V936de59C0j7LYs8injtCie5xPK4/E2qC/?=
 =?us-ascii?Q?iRILt600AeAx+UFpgfkhmMRg3YdMqYGCJIQ5hvxdHPhlynWRPgI3wEckAUUR?=
 =?us-ascii?Q?TKypJYCkIXlAZ+Cl22ZtzwuxEhgCV3e0zeXOBKyhmMeSr5OH9wnJay8PKBp+?=
 =?us-ascii?Q?RrHeHWVyTYjg4neUKGZvrbet7MNYmzrlcGJUlwcMMCydjeQW3LfMEsjyZaz0?=
 =?us-ascii?Q?T4sUxcNESOliOAi/du4Tho25?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5470
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	62d49025-e7a0-4371-e5fb-08d8ea04e871
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PZi2UqsJB8YTeSnD2At6CLkgYQVurUfbo6zN2qDuNZSnSQjGLm8lJ3SJBlbWkamK03DiDIUKknwCW4emzSf+lR1ab4CeYIcQWgAZyAUXI5BgsG1JNKXOTK3p5/90Jicw+RaoW1VuoBfenFYJEmXDF91n6JxMTscln5DrpIXm6I2OeTbFWpIjN9NgQBXC4FcH706sjjuBOzkWFXLmVH8eqbnf4vN+zox2tZNOdVBpQ8HCBMJgxc31zNgvvwuUbH3tq5M9NUuoGrAltxosKQEF1fVxsCacLMKwaRNC5737LD1nnIPdJEs5kVUL5d5j5oznuFxtHYMZdSnB8XVRYL2ReaJFa6E3nJmfnPfdAgj9+ny2IPjJwQT7j6BYrxedxuL0wVQRRm2jVmRKMhjGE7LF6x4k1tfYx2Q4mIZXadQQQ6Hukc0lKvzz7JWr58dMSWyQ7IlfJuLsh+ESnMhkh+JnauIGY0YvT62114EHzE0ZssbqfPv2NWEX7rIOWgBXRmaDbKiLFKPvA18k8xIh0V7k17UBIP8ieHMMaNsinUbcER0Vj4TGDzW32PVehBRMFqYTAG0JEji2e+NScf/3GGlj+pIBoUMdnK3BySzxLyICgf1i2uE2o/WbPtiAEimN8nqdQPVvGG5Jad2vnLSuB9Wq8A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(81166007)(36756003)(6486002)(8936002)(82740400003)(2616005)(47076005)(70206006)(6916009)(478600001)(83380400001)(36860700001)(70586007)(82310400003)(6666004)(16526019)(356005)(7696005)(5660300002)(2906002)(4326008)(956004)(86362001)(8676002)(316002)(26005)(336012)(1076003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 11:56:55.3459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a32a7dd1-fa77-4815-320c-08d8ea04ed3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6214
Content-Type: text/plain

The current version is 2.4, there are quite a few new features added to the master
branch of the repository and these are required for N1SDP.

Change-Id: If45402b567b786b072583c13ee9fe95bb52d27bd
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 ...able-workaround-for-N1-Erratum-13157.patch | 47 -------------------
 .../trusted-firmware-a-n1sdp.inc              |  5 +-
 2 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch
deleted file mode 100644
index c199a7b..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 76847eb46e77d094eb8611760dd1ab880f617321 Mon Sep 17 00:00:00 2001
-From: James Yang <James.Yang@arm.com>
-Date: Wed, 4 Sep 2019 10:49:45 -0500
-Subject: [PATCH] n1sdp/arm-tf: disable workaround for N1 Erratum 1315703 and
- Spectre v4
-
-This patch disables the workaround for Erratum 1315703 so that the N1 CPU
-performance in the N1 SDP better reflects that of released versions of the
-N1 for software that does not require mitigation for Spectre Variant 4.
-
-N1 SDP uses N1 version r1p0, which is affected by Erratum 1315703, which
-is fixed in N1 r3p1.  The workaround for r1p0 disables the CPU performance
-feature of bypassing of stores by younger loads.  This can significantly
-affect performance.  The Erratum is classified "Cat A (Rare)" and requires
-a specific sequence of events to occur.
-
-Disabling this CPU performance feature is also the mitigation for Spectre
-Variant 4 (CVE-2018-3639).  On CPUs that provide the PSTATE.SBSS feature,
-the OS selectively applies the mitigation only to programs that require it,
-leaving the performance of other programs unaffected.  However, N1 r1p0
-does not have the PSTATE.SBSS feature (which is introduced in N1 r3p1), and
-Arm-TF does not provide the interface to to dynamically disable the CPU
-performance feature.  Therefore, applying the workaround penalizes ALL
-software running on N1 SDP, including those that do not require mitigation.
-
-This patch is meant for performance evaluation purposes ONLY and should not
-be used for software that requires a seccomp computing environment.
-
-Upstream-Status: Inappropriate
-Signed-off-by: James Yang <James.Yang@arm.com>
----
- plat/arm/board/n1sdp/platform.mk | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/plat/arm/board/n1sdp/platform.mk b/plat/arm/board/n1sdp/platform.mk
-index 986bd70a..7e30c857 100644
---- a/plat/arm/board/n1sdp/platform.mk
-+++ b/plat/arm/board/n1sdp/platform.mk
-@@ -66,3 +66,5 @@ include plat/arm/common/arm_common.mk
- include plat/arm/css/common/css_common.mk
- include plat/arm/board/common/board_common.mk
- 
-+# N1SDP: disable workaround for Errata 1315703 and global Spectre v4 mitigation
-+override ERRATA_N1_1315703 := 0
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index fbc4358..9a49c00 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -8,6 +8,5 @@ TFA_DEBUG          = "1"
 TFA_MBEDTLS        = "0"
 TFA_UBOOT          = "0"
 
-SRC_URI_append = " \
-    file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
-    "
+SRCREV_tfa = "332649da478147b3d03132deb3783dd62fd475d7"
+PV = "2.4+git${SRCPV}"
-- 
2.17.1

