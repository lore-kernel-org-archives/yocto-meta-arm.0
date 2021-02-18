Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.55])
 by mx.groups.io with SMTP id smtpd.web10.9266.1613664884292346098
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 08:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1cXUaIwb;
 spf=pass (domain: arm.com, ip: 40.107.6.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwUzA/eOe/3wQ/BdSR1xu3wgblLrKRACuEbBEaGKw84=;
 b=1cXUaIwbXIZikpZNxjgeNpvUvU5AgDeAFEIdr4XfMFZbw60sh6dBftluDA755zP8yIj0LChcsS9BNiythceRIZn2tRuZAm83dPBWWW3JK9mR9cFHxdjxNcZevpeDPUMk0kU0uB7jYHDFlXsyrqa0Wpd8IeBQr3KePS+UYOnRDMM=
Received: from AM5PR0701CA0070.eurprd07.prod.outlook.com (2603:10a6:203:2::32)
 by VE1PR08MB4861.eurprd08.prod.outlook.com (2603:10a6:802:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28; Thu, 18 Feb
 2021 16:14:41 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::b0) by AM5PR0701CA0070.outlook.office365.com
 (2603:10a6:203:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend
 Transport; Thu, 18 Feb 2021 16:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 16:14:41 +0000
Received: ("Tessian outbound e7cb4a6f0881:v71"); Thu, 18 Feb 2021 16:14:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ed94b342512744d
X-CR-MTA-TID: 64aa7808
Received: from 8ac02056a1ba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 32DCFFE8-E20C-4487-8F2E-CA180B3B0A2D.1;
	Thu, 18 Feb 2021 16:14:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ac02056a1ba.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Feb 2021 16:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiNeJ16HjSJflifaYESgBMVN/dj2agDac73FCJG4CoeaoLrBYiUOQ0oMyVQGKVbKP6BXpjnIYsBodmOgSK3N+jNi9SDtLi4IkcNPtJYc27WTLDQJ5MX/k3mgYuRRPZTFcSZX1L/MbTCPE3T0DiqKVAlr1QOPkXWw8cAXEfa1dXuWHCck6H8RD5m7BpiS4D+KSMWoZ9ApCtINb/7skQFBWr/0YAhzwz27+LdGHsTBSXv/OTDaoD2ZXD0h71TOMePAJApja6acVWPwvkriDmUXDqZSfp6LH/bNfRLgfApxhIYNJcjnez5frnwIkpOZQr9DuyGVqjiBRBF7XGbAfwcxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwUzA/eOe/3wQ/BdSR1xu3wgblLrKRACuEbBEaGKw84=;
 b=nMW1iqx5h5ZGt2WGi8QaZVlQ/mjyp3R/T33qUe4GMnxqqd/rM6LOK1zpQPxvsop41ycSj0JvqiEjJ9iNbq1g+zTtu/9EE5up+Alocu1VWEeHPxfdVMxgRkhizHQdJdgv4dH+WICs1T1Hs22MhvKaxbzWNSK3WJkKMZ3WfhCc/yQtes6Wo6wY3y1RkCarRoiSOV6wAdjKj0aLDvxGlbZ/v6vYvU3EOYfS2tcvYjUsDjtwZmatYRNN0SaqpdxG7Xgo5NCobcMt/SFUF3irnO6BOGyYa9yrZyqvG7enZby1f/8DNthJgan09PrgMG3GoaUnBQl46HzLO60gZcrcKOAZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwUzA/eOe/3wQ/BdSR1xu3wgblLrKRACuEbBEaGKw84=;
 b=1cXUaIwbXIZikpZNxjgeNpvUvU5AgDeAFEIdr4XfMFZbw60sh6dBftluDA755zP8yIj0LChcsS9BNiythceRIZn2tRuZAm83dPBWWW3JK9mR9cFHxdjxNcZevpeDPUMk0kU0uB7jYHDFlXsyrqa0Wpd8IeBQr3KePS+UYOnRDMM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 16:14:31 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 16:14:31 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [gatesgarth 1/3] arm-autonomy/linux-arm-autonomy: apply runstate fix to kernels older than 5.10
Date: Thu, 18 Feb 2021 16:14:24 +0000
Message-Id: <6241cb3cdc3684df1c5b8542c4b5aa7cb44bd3e3.1613664627.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO4P123CA0159.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::20) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.55) by LO4P123CA0159.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:188::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Thu, 18 Feb 2021 16:14:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc29fa6c-4bb9-425c-428b-08d8d4284c15
X-MS-TrafficTypeDiagnostic: AS8PR08MB5976:|VE1PR08MB4861:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB48612AA1A013C7EC60645BDF92859@VE1PR08MB4861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XY4t5gajjMuuXCJsz2M9PVJtTZpSw9z2sLLQInrAXCITAU+4Xe4mnxWyYikABsj1rLQXJJBvWzXIOuSV/z/bMqOtsMBvUOgApAfNtnyGaU89aLryxGQn4uPvndY4nh3MbUMEIYj4deGX27QMSPd4zT/mjWCkFnGyMm8NIuxXnf+mBEDIgiEjHY0/afJFemaVAqrtKi5FcFFZE7WgsU3ymJGAVxd3xElPu1Xve6bPzA/tLm+xhxq5Pr1T15ri3lPUQp/GXXWM/XknchdK1V1ZSSjLcwQKQz7zb0NuBglI/8UWBznOV8XI1YMuQa0ZnBFHhQWuxukUGz1xS75aaq+Y8pjMb9dYIATjnViZ34GIG9egC2PnTTYLUs/QGqgMLToTL+zzffeD8WBslIeDObFpzpNZ7zrNSNVDjfflo2h9C1U5QpgdyenBtg6jEJtu+WIGvrE5p6FzrB3IdvSPWnxbugjeVIG96JHtWFkz5yHBxT4DFRrtjanKFIeCfCWKoL+XIS6ZuNuSIe9GOnQOlGFejA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(8676002)(4326008)(66946007)(6486002)(66476007)(44832011)(186003)(52116002)(16526019)(316002)(478600001)(5660300002)(26005)(66556008)(956004)(2616005)(6916009)(8936002)(7696005)(36756003)(2906002)(83380400001)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?E9b3xXPxRAI78FeNZHBv70tMerCVmN6osRpZToRvj1dKh/F8kaVYzH6FDMf3?=
 =?us-ascii?Q?2qQmEvJtjAPHDDRZhFpSRkD+EhybceQpK28GxVHWYWJfnUfhi3HAvhLmA0FT?=
 =?us-ascii?Q?FNzoWGPGsHiq/Zh4qtuL1A3Ce+KPC5LU3KaPYNr1w55LiCr1v/78arAgAq8s?=
 =?us-ascii?Q?0xs4c2uQdSu9CP2GYaBOUHFPibJUdoJYsfc5IpX/K33wiDuMMbogGBk4uaXC?=
 =?us-ascii?Q?CklFWIa+f0GUebVAtsiSuXOL5IQ+PwylR1mb2x4RKrUkcEJk6jvMtTtF/kCE?=
 =?us-ascii?Q?FG7qkdtpuDLMqLRXISYo/R27hrPzXGgW0IRHaAT7fk3+CCwkKbGK2f6E07Gu?=
 =?us-ascii?Q?uRemfjR6wlOPypcYIjEs9mcAHt6BUzKml2T9IHcUu8dgaJA0hPTDGAwPqp/s?=
 =?us-ascii?Q?afEMvYBcHbr/+yw+VBunPOCPYgwKssddKaAZQ8HlvIyQZpsyCcSWwXn7zzdo?=
 =?us-ascii?Q?h80Luq6x8eNsfFQxRURbYe5FU7S/gQ+1psbDmRr5CYFb6PGO34lUw8uszCtO?=
 =?us-ascii?Q?usxJQZSF8wx39Rwg7oxPTSIrMjfqzGQCMbteEHHwE1GrrbmoEjpBb4lBSLoK?=
 =?us-ascii?Q?GOVqkh7dKxZp4+AH4fY5+Ta3OEqu0FineC5Lj/yOyogXBCS0th10BJwRK/RB?=
 =?us-ascii?Q?nfNyEBjx4R9VmYPjPScTIuFanMZTIV97kcqIEe6Z6zgJZLA4KtkqZPzKmpOu?=
 =?us-ascii?Q?W9SAWFyYL8g8qhNuBgyf1Sei4Z4r5jn258RQYov7Q//m9wgpcg+BEVzeMdrp?=
 =?us-ascii?Q?bKSRH2kJQIA4t+OAmPpno4AUX0k4FEbLLUMxYA9tMgLR+5KJU8+1KWmMnh4Q?=
 =?us-ascii?Q?bo7g0+4ookcZA2H1my2bg96d5WFG9SNzdh2IAnwpScnmVtE7Pzb0ust9jI3u?=
 =?us-ascii?Q?KiK4kGNwT13RsRcim4Q09fvAJ+wyaf4y/BIjoDtMHjKKHGaWS7aezaRLguyW?=
 =?us-ascii?Q?wQ/31SqtQRVmY39c/imFRqzBob4yk7jqQDV/kj3juMcBpBI4BBFDBf7AMGt/?=
 =?us-ascii?Q?1ScY14abO5d+oqCfvvywLJwF3bLMhLG536iAzQL26vC8DvARjZSBVAtLVJKd?=
 =?us-ascii?Q?A8EuFTQ60iKv2cnZI9RrKZyRGMozFk7FROvWbK0JDIjd50SAdK0RWtcnLae1?=
 =?us-ascii?Q?/1p4Xt1eOR4HBQJb5zjkFg7bunmvul2XCiPsnxzgEAkzk0GgLFpZV4UBCLw6?=
 =?us-ascii?Q?UtAf5nkW5/KrO3kvY3ZzuR+8w8aHS/wnSpqsAP3pk2nn7CFzYPqYZHCBtJBX?=
 =?us-ascii?Q?uB2CX81qYPKwYR9QQXb2c/h4jDEj5C1yKk3aAL/1JvZvtf1MpxzwwgtYNQpH?=
 =?us-ascii?Q?RlQGAwLAM8gQjoMLo4utUZxu?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	988e6f00-65f4-4d74-fcba-08d8d4284646
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qz7bRxn6byGhURALEhPjeqv78Mu2xAc1qYaAFMiqf22z7+IsFOJhLLS/rCEL5TbNdHwt6z8LPnPcTRWs2TJGNutiRUTTT6Zy8aStkd7OQKXWsLQCWxVAOZVJnWX1bG4/TWptg0cc8N12HkC92IahjUGwuGhd4vk/Kqrehowm14syO4XXhtwGCaupAjOsNQ4/2M7on5e7k/yTEyxNGn1BgDz6DrobhqER4yp2c/Q18GLDJH2ctnP5BQPcxLfh050W2nBAZweI+FI5q/CG489FXJiAVGZv5f3g+sOYrZB7/OGJSsP7i4qPPINHjogFXf1YL3uSa9RK/Ng+1gbeQjOeD7/rD76MZZIvMQKsV2hnr80ckY9yfjZIzjWL7rWrffZns0gK1WzuQ4M60PJTQbo+SMsp93wxN4tK9JgWVLK1azmOMP6enTmjX2wcwGen9rn9ybxAguPatl7BQH98kgQ1HGW+eXJGkbcNPFtAmT2lCydZNw5gjpNnCDPchZg33KatrmB9KZkRbYB1I0+hQBOX2j0GPJA1breI56BPTuZ2gNrogtu/AiHjgNte2LO/b0tgbVSnpF+JCLBziMKzv0eO1tAatLg8TdU4ABiXFS8fYu8oZ8F4piDNlZMOCcdUYnvYXu6hJGe6GvkLrcPQh670GHJyFWJX+y99NXMLVKYnEaQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(956004)(2616005)(336012)(16526019)(186003)(5660300002)(8936002)(356005)(26005)(81166007)(7696005)(4326008)(83380400001)(82740400003)(82310400003)(6916009)(36860700001)(478600001)(44832011)(8676002)(6486002)(86362001)(70206006)(47076005)(70586007)(2906002)(316002)(6666004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 16:14:41.1877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc29fa6c-4bb9-425c-428b-08d8d4284c15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4861
Content-Type: text/plain

The patch introduced in 82ffc86 is a backport from the 5.10 version. Hence,
just apply it for kernels older than 5.10.

Issue-Id: SCM-2033
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I6bccc0c75d931d8046260c61afb53395bb9d2d1b
---
 .../features/arm-autonomy/xen-common.scc               |  2 --
 ...-do-not-setup-the-runstate-info-page-if-kpti-.patch |  0
 .../recipes-kernel/linux/linux-arm-autonomy.inc        | 10 ++++++++++
 3 files changed, 10 insertions(+), 2 deletions(-)
 rename meta-arm-autonomy/recipes-kernel/linux/{arm-autonomy-kmeta/features/arm-autonomy => files}/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch (100%)

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
index beee091..f359d8c 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
@@ -1,5 +1,3 @@
 define KFEATURE_DESCRIPTION "Common XEN (Host and Guest) configs and patches on autonomy systems"
 
 kconf non-hardware xen-common.cfg
-
-patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
rename to meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index c5cb66d..89c9fce 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -33,3 +33,13 @@ KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
 # Add Minimal Kernel Configs for Docker runtime
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
         'docker', 'features/arm-autonomy/docker-minimal.scc', '', d)}"
+
+python() {
+    from distutils.version import LooseVersion
+
+    kernelVersion = d.getVar('LINUX_VERSION')
+
+    if kernelVersion and LooseVersion(kernelVersion) < '5.10':
+        if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
+            d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
+}
-- 
2.17.1

