Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web09.46.1618935905442213141
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 09:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=an9ypSpO;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaM3sL+GNeqe2TnrFLwU0GemrQ5JIaihEE23jhsENU0=;
 b=an9ypSpOXzn3VoLUX1NZQfelk05r3aCG7g1DVkpTJoTjOl8X/d5a+WOKwWq8PxOeewE64OrbEh8/Pw2vsg6Av+6xe92X32U/GmmwQemUjzTO8GZo/Yrg56GBTS+w5xaIrrZJB3qC3rc2vCzscdU67lv5kdERJLVYNFF618aehNM=
Received: from AM6PR10CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::20)
 by AM0PR08MB3268.eurprd08.prod.outlook.com (2603:10a6:208:65::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21; Tue, 20 Apr
 2021 16:25:02 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::dd) by AM6PR10CA0007.outlook.office365.com
 (2603:10a6:209:89::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Tue, 20 Apr 2021 16:25:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 16:25:02 +0000
Received: ("Tessian outbound 34291f7cb530:v90"); Tue, 20 Apr 2021 16:25:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23cc54a528cb8c90
X-CR-MTA-TID: 64aa7808
Received: from fcdbb5a60619.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3795EB7-D616-4F97-9A81-C9194FF02E7C.1;
	Tue, 20 Apr 2021 16:24:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcdbb5a60619.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Apr 2021 16:24:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGFcdPZcomCulu1E1TO45C8VCfuIE8mV9wmxT+ZSfejlvHf1AJnFZKd5Vqek97dccAa5snQkn+b0cY3+GwXhySn11QDw1YvnIUWcYV1ZztCzekKpcg0T/TVz8aIyPWoXcVGC6iaWYcUomOCXDvfHheV1VHxngsdBw9mV/QvJbIB0o0YAgfjTtK0WpR4WwE/spyqb0FexwwY4gGhtBp3WCPBa2PTGzMUmS3ldheVSp87NbTF8NB1x5X0ajhRGBrhUXQ0vas1qENpvdzRYPiGY/UeSlpr6SdIurQ/HGOved9GTP+0SC4TgiAmAFhVcyjmZOWgO7v0yshgyf1w26SjGKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaM3sL+GNeqe2TnrFLwU0GemrQ5JIaihEE23jhsENU0=;
 b=MTNrNJp4h9sSxkVS0Q3qRXnQmT65iSshBcW0sR+pseaXEDqG2Ce4rthWI4vCdZQI2HKPTu/0JM2cUWnyWrf9xLG61LDf4WYDzsPIuOOCI/B6HYrrxMEMvdC1DeTK+BN9HZKgg8Yy/CMtNueXxTc9iOa4Oh712lehwkGNT4/dHjIxbRUhWE2uGLhCFleSCZGqVr5HK/K9CmkjpD2K+kK5ih0bjCeJmBUvF8JXMDO241GFV+m6N2/mmuwFKKwBnQj3tuaXmmys6IldiZs9vAyIBNfK5VpSdiTwijFO6UUj6/1BHxhPz1wlNTCJFdMka+Gsyfhs1BpbGIakusOSMPrYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaM3sL+GNeqe2TnrFLwU0GemrQ5JIaihEE23jhsENU0=;
 b=an9ypSpOXzn3VoLUX1NZQfelk05r3aCG7g1DVkpTJoTjOl8X/d5a+WOKwWq8PxOeewE64OrbEh8/Pw2vsg6Av+6xe92X32U/GmmwQemUjzTO8GZo/Yrg56GBTS+w5xaIrrZJB3qC3rc2vCzscdU67lv5kdERJLVYNFF618aehNM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6615.eurprd08.prod.outlook.com (2603:10a6:20b:335::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 16:24:53 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 16:24:53 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/docs: Updated documentation fvp-baser-aemv8r64 MACHINE
Date: Tue, 20 Apr 2021 17:24:46 +0100
Message-Id: <be6e62ae274fcdd8e1fdd1ee820211f3089edded.1618935838.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <52318b39713ab23b67df4f8dcaa0e288b055dea5.1618935838.git.diego.sueiro@arm.com>
References: <52318b39713ab23b67df4f8dcaa0e288b055dea5.1618935838.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::21) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21 via Frontend Transport; Tue, 20 Apr 2021 16:24:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf391d59-6550-443b-8b8b-08d90418d958
X-MS-TrafficTypeDiagnostic: AS8PR08MB6615:|AM0PR08MB3268:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB32681E02B4E6D4E967796A1A92489@AM0PR08MB3268.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vYdK6wGL/YXYwtiT8GADFVJH8UNU+8CURHMBq0J/JkbGGDcR0gVXuIc1iDnu2i/KDSVHNGkiB25A7NkksZVfqyU46L+bnNLtR1YPlvfjz/gZxbJK21AlJKo1tysfdtALvgXyWac/ZcljFUUfUlKuoEgnpI1ViBmchyKcSJyOPyS6fqafZsk+hlXZJu3N3ZCqpqqJXVCx03yrP0W438KHVBuPCWB1S7YJQRfEvGF7o/evJHKzH6I76mJjBYp58H8HYZzo+QSzWpYOkN1EumXGzeCRiveUS5RoXKHafYrv8wD1h5Wc8ILECGrM4icAU+FOEMFBUlopwpIOK12LAff+wX5/Xk3oEDGy8PM98dTie+s6bQi8LFlP4OYbvosxDcNrO7XRoqtHBiUm6VX3J8aaf5UO05HqUJ5+VYiKc8u+uTTC6gPSNOUEK91BMRwZ3ICviFPsQWyX6A9oykQlDn/k2cdXNE7r2cOJ+5aM82RfLeIh7QNCvppUssmlfEQKyncCJ4CmAfLcjuz4JKuN3iZn2Ty5h0vKct62XT0//UvTtbwocXvqSgcZGSgK/Dzvb5LOt+qnPfJW3LODe6xSAXBMeyU62mE97yDGRYPqyqOB4DCXlJwiczuzVjfJEGYXyiXIL7gHM/7JCTjBCwh5y5CzEN6DaWusxWAtu8aTiHRHOrWVRcdxDWYFdSb0E6HPtgwgKQxum59rVwYVV2oIkAPyShT5eGMbKG9VqcsudATJn3s=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(6666004)(66476007)(36756003)(316002)(44832011)(966005)(478600001)(66556008)(15650500001)(8936002)(38100700002)(5660300002)(7696005)(6916009)(19627235002)(52116002)(2616005)(956004)(66946007)(16526019)(83380400001)(4326008)(186003)(26005)(8676002)(2906002)(6486002)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?eO46cAEqouvRrNtQ+naHZNhHmIhVXOzkGu9BpMXaAb5V9nSMTaoRxxP7b5cV?=
 =?us-ascii?Q?iVc39YGL1NPsev+pUhrWDP/0KR8v+H0i0YyOr8gjISV5hCjBbHHKhOUbGysI?=
 =?us-ascii?Q?5WO86k3A01Ow5ON2ajXx0M2dnWAQmE4CaSFikY4ExwEgGLILtIXBmDPjmpYA?=
 =?us-ascii?Q?i6Ze6aDkjySKNQoemXqWK1l42fZDIpRi1bLq8eDiEj79ac4Ud2PLATKHo/O1?=
 =?us-ascii?Q?IbPqfkGbOsoS+WD3yOOAJ/AyNkWEZe6eu2SOY7BOhNs2Oz9lpLqAbhC2gNcN?=
 =?us-ascii?Q?r8P4f4TgwMvRtc3QFrnhimjYGWMCRS9sGOjnKlc/kjtJgsT2RBPDiAynHM2m?=
 =?us-ascii?Q?SIUj1bAk0NSyYSqHez6cbJTOuvvNtIpF94XmyHvR27hNsy1Cj4uIdKTs9u2t?=
 =?us-ascii?Q?DViHNqtaAJ2YIwPd5jBublvaLXNJlcASnQhthhvS/XVlD7UgP2kapB14a4qi?=
 =?us-ascii?Q?clhht+GajJM+PKxJ3Fa/DedE+trT1KY5gxTr7wU+ZGzYzL1DHL7thZEJLLPK?=
 =?us-ascii?Q?Ua+JDiPYhBCUCdoPxjelIUkKevbpIY/vjiNIVDmkevMJ7qhljDolZoxIdZzm?=
 =?us-ascii?Q?qe094LU64v/N443rD66S+KpVir4manJVHRCDvqr8cMfG/H13fYvXJOgVjID0?=
 =?us-ascii?Q?VkCDQDhNkNyeUUgsZA67FGQ8GIodwlcukJjRTwS4eUkUimEH+ZJ5FKxb1ssJ?=
 =?us-ascii?Q?whgY0O8U2NId/PCuWpDZsakzXxYNnJsQsyFCAeuu8qrdQEY6ifNkY08vX35E?=
 =?us-ascii?Q?MR50mrt+Esyf2L5kssiHKapVb2fiZLG0qOGm9Xaj6WvvHluV1aq51S8AGZaM?=
 =?us-ascii?Q?UvA7owP1VoH5S5E3a+wO9vSs5moH75KW0RYEbws0Lirxux0gRjnH3J2yWqkW?=
 =?us-ascii?Q?FuDR5ylel74H8NpTi3Cx1mDj6FCnbakc8d2cHaioBqEbpu3c/GDXfR1KSecw?=
 =?us-ascii?Q?J7rV9GTTBgurC9IsZ/AY6hi2K3ZVmFnZ3gX0d/5n6+47TUeySY8qY3yNCjw5?=
 =?us-ascii?Q?wNHiuGW/k0cm1bjG9lFw6Z4GsCMYESH1KCIiPFoJ+8WjVpR0pARyqYzcha4J?=
 =?us-ascii?Q?cZMY5yHF3mWVC1+liU0EeC3in0dtiR2KOHzVv6Uj+MkBvaxEU1YImHOhlQT2?=
 =?us-ascii?Q?W5jPi9n4i4tNt13s06G9xzgKksT9GkeV+ZAJnWvtC9dvD17FKAEmRL63yyCA?=
 =?us-ascii?Q?bUTFfGgiE5oaAOSz4eBvQJCsJazOqT2+zk8XzGEIaxsKrcx3Ni7k+NKzApqJ?=
 =?us-ascii?Q?BNisOukpg0EM+uwKStxCuJZFAanUn44S8OPn+7AX42o5HfKszCDm78clLFWX?=
 =?us-ascii?Q?2VqeIUgA8bV6/bFoSobDBSVL?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6615
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6004e2ff-120f-4ad0-bf67-08d90418d3ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Q254D+Vfa2ioxk/ijwu5iHwVLq70NGLDGH6TxZ9foAgtFO3FW9yzqe414zGCcHec82U+zesx8wGMwpXT2Q5lJWdegcKt4haQEWS46WCavD/hg0r2QsfGiaU7JzQeT6HjI0wXTrK7ztQl8GBS2ATYUnpxXo8kqUkY/5YTkytqthwJn7jPGwd6mzHOryveMa35KFWFAlJcnnD3O/n3k1Kj0wan79f9jLQ2DgJIr5Dtl6rrKCL+uFFegDR4YU0gtZJTcnw6CNYgHgVE+ZupSl6HAEi54dL9oug2OWUJpsfyR44bZOsEo0hwol2REnXCKJG7iK4o1myoKRFmJ7IRZ/TIWwmnF1uJg0clZXghOec+Gz91ZnUXX851OHDNAsKXrPHrr5/39B4CsePyENE39K9s1+s+qI00jSOek+8QKS0O8ZoT2nJl3tu+4USA13TBqjivFC5ornCRpKDcWjAOs0gK2MN4M6Suxb6FCbaFQYSCY6t6guuHb3vj8+lmw+zPBdvSh3+RvcQIoxvUGWyf/rfJkMmOEe32tsaOSoVWJQzANCoWEGxSqmTmpbl2WvvoI/ns71uj1bvSMbzUyl9TYYw9+LC646bOGL1/vZHh3RJVcvWGW8UKVaqNVz6wvuy4xzRP/djh3CH9OU78gZ1QpswEaYEyJywS3shVBIZMaXodwRCNYcUXYa0bbQdJz4SHKs7dZMarItLpBaakOqzc4orr3wzzRddumCj3nxDVZiMS+A=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(46966006)(36840700001)(4326008)(44832011)(82740400003)(83380400001)(26005)(186003)(6666004)(82310400003)(8936002)(8676002)(956004)(2616005)(6486002)(966005)(70206006)(36756003)(70586007)(19627235002)(7696005)(478600001)(336012)(36860700001)(81166007)(356005)(47076005)(15650500001)(316002)(6916009)(86362001)(2906002)(16526019)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 16:25:02.0541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf391d59-6550-443b-8b8b-08d90418d958
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3268
Content-Type: text/plain

Added quickstart instructions on how to build a BSP evaluation image using kas.
Updated FVP naming convention as well as information about where to download
and how to run the FVP.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Ia6056194ed23d6e38769a3e300eadf77fc41beb2
---
 .../documentation/fvp-baser-aemv8r64.md       | 49 +++++++++++--------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
index 9701739..18a01af 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -1,4 +1,4 @@
-# AEM Armv8-R64 BaseR Platform FVP Support in meta-arm-bsp
+# Armv8-R AArch64 AEM FVP Support in meta-arm-bsp
 
 ## Overview
 Fixed Virtual Platforms (FVP) are complete simulations of an Arm system,
@@ -6,8 +6,8 @@ including processor, memory and peripherals. These are set out in a
 "programmer's view", which gives you a comprehensive model on which to build
 and test your software.
 
-The AEMv8-R BaseR Platform FVP is the Fixed Virtual Platform of the latest
-Armv8-R architecture features.
+The Armv8-R AEM FVP is a free of charge Armv8-R Fixed Virtual Platform. It
+supports the latest Armv8-R feature set.
 
 This BSP implements a reference stack for the AArch64 support in the R-class
 first announced with the Cortex-R82 processor:
@@ -17,38 +17,45 @@ Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
 https://developer.arm.com/docs/100966/latest
 
 ## BSP Support
-Supported components:
+The fvp-baser-aemv8r64 Yocto MACHINE supports the following BSP components:
 
  - boot-wrapper-aarch64
  - Kernel: linux-yocto-5.10
 
-## Howto Build and Run
+## Quick start: Howto Build and Run
 
-### Configuration:
-In the local.conf file, MACHINE should be set as follow:
-`MACHINE ?= "fvp-baser-aemv8r64"`
+### Host environment setup
+Install the Required Packages for the Build Host:
+https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#required-packages-for-the-build-host
 
-If a quicker boot is required add the following line in the local.conf:
-`INIT_MANAGER = "mdev-busybox"`
+Install the kas setup tool for bitbake based projects:
+https://kas.readthedocs.io/en/latest/userguide.html#dependencies-installation
 
-### Build:
+### Fetch sources
+Fetch meta-arm repository:
 ```
-bitbake core-image-minimal
+mkdir -p ~/fvp-baser-aemv8r64-bsp
+cd ~/fvp-baser-aemv8r64-bsp
+git clone https://git.yoctoproject.org/git/meta-arm
 ```
 
-### Run:
+### Build
+```
+cd ~/fvp-baser-aemv8r64-bsp
+kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
+```
+
+### Run
 To Run the Fixed Virtual Platform simulation tool you must download "Armv8-R
-BaseR AEM FVP" from Arm developer (This might require the user to
-register) from this address:
+AEM FVP" from Arm developer (This might require the user to register) from this
+address:
 https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms/arm-ecosystem-models
 and install it on your host PC.
-**DISCLAIMER:** The AEMv8-R BaseR Platform FVP package will be available for
-download soon.
 
-Once the build is done, do the following run an image:
+To run an image after the build is done:
 ```
-export YOCTO_DEPLOY_IMGS_DIR="<yocto-build-dir/tmp/deploy/images/fvp-baser-aemv8r64>"
-cd <path-to-FVP_BaseR_AEMv8R_pkg-dir/models/Linux64_GCC-X.X/>
+export YOCTO_DEPLOY_IMGS_DIR="~/fvp-baser-aemv8r64-bsp/build/tmp/deploy/images/fvp-baser-aemv8r64/"
+cd <path-to-AEMv8R_base_pkg>/models/Linux64_GCC-6.4/
 ./FVP_BaseR_AEMv8R \
 -C bp.dram_metadata.init_value=0 \
 -C bp.dram_metadata.is_enabled=true \
@@ -82,6 +89,8 @@ cd <path-to-FVP_BaseR_AEMv8R_pkg-dir/models/Linux64_GCC-X.X/>
 -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-baser-aemv8r64.wic
 ```
 
+The terminal console login is `root` without password.
+
 ## Devices supported in the kernel
 - serial
 - virtio disk
-- 
2.17.1

