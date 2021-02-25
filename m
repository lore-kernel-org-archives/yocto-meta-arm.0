Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.53])
 by mx.groups.io with SMTP id smtpd.web12.13872.1614270211249362809
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Feb 2021 08:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DskEXxUp;
 spf=pass (domain: arm.com, ip: 40.107.6.53, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qGjNs2I0txeuYB77wEP67h3pa09LQoiypNbrrmiguQ=;
 b=DskEXxUpCp11q5lrPfYN4yiaRDd69mS+oqsGdXw8sou+dxiI+GsFBcfTu2szwFtRlMXyZud0u8rAMJ+SZU7utjLdFwTkhj4bMgkd89BMI6gFvaJba/ViLCmVtwc3sqO7tEUcXOLcri1a11tkBq/6EXbwKnwKOsYKGJ42K70dgMk=
Received: from DB8PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:10:be::48)
 by AM8PR08MB6579.eurprd08.prod.outlook.com (2603:10a6:20b:356::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Thu, 25 Feb
 2021 16:23:28 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::d1) by DB8PR03CA0035.outlook.office365.com
 (2603:10a6:10:be::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend
 Transport; Thu, 25 Feb 2021 16:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 16:23:28 +0000
Received: ("Tessian outbound 9eff4099a602:v71"); Thu, 25 Feb 2021 16:23:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b18ad66728bfd9e5
X-CR-MTA-TID: 64aa7808
Received: from 52d5428a3727.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B14E0876-0B49-4C4D-9B23-31099E2ACD55.1;
	Thu, 25 Feb 2021 16:23:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 52d5428a3727.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Feb 2021 16:23:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3WVZJLlAheqNk4AQraEt3IrL7TZRgjY0Ghekdb/0xCfdaYoRTCICcvDO2G0+kbkEk4OJj3I0v9YEqndQ2TR/EolGUMkCu66YkqobEfP3EXKbo9fGakfSemW7f3rfFGeFKmYrCdAOmGW7ooVel/riBQo04KkrR6jSkpe4Bp+0PtbaD9oFm9nZD6kAkuQKsNLnzNubNfSuGVHEKneLOZjSLnbTDCw/WVaHULI5+4o/ip944874Cey3iF5YH1ZdBYHvL2c9pUclJt8ALYGrfHzmtW289pjIS1hIHCu1DVi5Y41KnsdjKtp5q3ypn/wZFjQdSMPyQYsnRQofhbhJPWbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qGjNs2I0txeuYB77wEP67h3pa09LQoiypNbrrmiguQ=;
 b=M7piSmNY3RDOLpROyzcKOVqu6FHLOCX6yaRBC17YzrUGW4d+WXwXndfn20+68QP/gFeiQmTikpxweqrfWxRaOc9e2RPY0+MuYLZwY6bpAXov18Lg3ew8sTmqZgeu05WIK34Q+nzArYkNXtMxpmSEGDXckf9aesl7M+sBHJlsVCriY8/NhTK6jWgfvgtpGUnGZagTRdoWZrzqgsg0/g6i1oJIUQ84W6t2GIdg1bFHF02vohqWuPqw01CQ2OxKIs0w9EH6vbibJZoV/eybKy4J/jt00BY6uutSyCT9VuNsa/I6HTVmI8tJvSeCQl4zDUiE4q762qM3WLUGuHD2qVDRfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qGjNs2I0txeuYB77wEP67h3pa09LQoiypNbrrmiguQ=;
 b=DskEXxUpCp11q5lrPfYN4yiaRDd69mS+oqsGdXw8sou+dxiI+GsFBcfTu2szwFtRlMXyZud0u8rAMJ+SZU7utjLdFwTkhj4bMgkd89BMI6gFvaJba/ViLCmVtwc3sqO7tEUcXOLcri1a11tkBq/6EXbwKnwKOsYKGJ42K70dgMk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4502.eurprd08.prod.outlook.com (2603:10a6:20b:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.37; Thu, 25 Feb
 2021 16:23:21 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 16:23:21 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-bsp/fvp-base/u-boot: Set DRAM to 4G to match with kernel devicetree
Date: Thu, 25 Feb 2021 16:23:13 +0000
Message-Id: <742087716902d81051dd3340f8787e3412a3ee81.1614269958.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ff23c6e49ff925107b7378afe0430ed4c6950b63.1614269958.git.diego.sueiro@arm.com>
References: <ff23c6e49ff925107b7378afe0430ed4c6950b63.1614269958.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0295.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30 via Frontend Transport; Thu, 25 Feb 2021 16:23:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1727b81-18fe-432e-2365-08d8d9a9af51
X-MS-TrafficTypeDiagnostic: AM6PR08MB4502:|AM8PR08MB6579:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB6579196661D267A276990C52929E9@AM8PR08MB6579.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fneYQc0S1/j7LzhXbF71HaYkHMLUgQlgRR4HQ7hb1pcVrMJJlQzZ9c+dow9n1rBraQu1Uy30PSxIWAzDJLvwWG0TYwZ5BM7IpDR1XJXIesSqLKnQWLO90LsiQPAdzY5sY0d5WKJhJg8r/yAGTQM/JEW3IBFQ6VCKcZS80MiKYfwflMEns291r+nNhdtlnzAa7PRxfGgGLY+tuLqixV5dIpV8m16JR+NE8nHBMH9yGK+oTBZvfjH7c8vBI7icR7NmISDfbh/uvnjFaIlmy3gO7QDGrhmxxOb197wTz2n2+D9/l2pb/3s6OgYprbL9akVCAqluODexZEDO+vjY3oO5e8K4DNNd4NRNXzt3CyZvCAbk4oMxeBzd93iPVuY0to9IfyqA04ZgNSl75eVTdvm79Kl/TU3AR5cZprYNKvKemxphGtQEKV3t39NEqb1gB6+YZXpqgBnNvN9DlmPR28QGHJEgLsa/4Jkgg8fIgPPs+ZEAO59ENZ8AHGB9Qnwbv2d4WOBO35zc2NFDbvIdW1y5eg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(83380400001)(16526019)(8936002)(66946007)(66556008)(7696005)(6916009)(52116002)(86362001)(186003)(66476007)(26005)(2906002)(19627235002)(956004)(6666004)(316002)(5660300002)(44832011)(6486002)(4326008)(8676002)(478600001)(2616005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?uEnhwUdUzllvgrb2axf2E2oC4zq0FmNNPWfoGwB+4sV2KRSuuodqmOnjH0mC?=
 =?us-ascii?Q?lxgHc2aIjZkVGHJgj3EkmlXY7YoJwk+LhBcaqHSkPMIzjX0GXZb5LGa0gzEO?=
 =?us-ascii?Q?OTjZSNrr5P2o4T3oJLrZZcDGpSlOHsQr02Ar3YdHeIlWi+awZAb+BQQW1z/h?=
 =?us-ascii?Q?plt6vRWxhgfsFuG1GT3UpPsbz04hS18G0ITjrAL18bQgLdf0cGY8Hg3ylNcO?=
 =?us-ascii?Q?u3av/FAVLYNp/C5dClPEX8053Ks4xLejxeSLAYIckEf+2W3wpLa50a04TAwQ?=
 =?us-ascii?Q?8z2KPVSU7CG9QzooxhMOSE24xL1Sw8MeNgCx1nNGPEFjU9g2+uuKsxnu9tJA?=
 =?us-ascii?Q?JHSJlGgLVWJ/HAWHBRmJPH7WsKFm6RRi090GXvwzOxwm18g79QAvDirojDd5?=
 =?us-ascii?Q?b/a4GhWUBMRtM+URqsPzR2N6XVKxe12pSInEn7ZZP6/k3kTU87vdTqmLb8/K?=
 =?us-ascii?Q?+4uNqsB7HLjRslnoOvrDhpI6kHEWftshKrrG4hiEsjtJGGYtTtiM7Pe+YKHl?=
 =?us-ascii?Q?/a4sYC1jqbBP5l7nbvQCCPfkaWyl/zKNLn8n5C83iUyEN9Ck0eXgSbvz0WvD?=
 =?us-ascii?Q?d+fnK/ejswmaY3lx/FQ/GmZInPYHiVPeonuZgYpwyXI7wXmNjtT84sR+6Z2E?=
 =?us-ascii?Q?KL/EyCxzBotZ16Gzn/YytDbSRXTUTqwQSs6XRCxXEapSHM39+iSVQvnX77TM?=
 =?us-ascii?Q?Bk/+UlZwt1Ax1u56IL2S/mJj+MGAu+22w70LArHh9S/MPc8pk2LwNkWXL7if?=
 =?us-ascii?Q?+RwvBcfwC25MBV6HtDdz7M6ZxOqkTmPxBVZ9lNBd1W/ZdAB61mrdmSRFx6/6?=
 =?us-ascii?Q?CqUpp7b5q7gfSNnfaNQ7m+n7JzrOKYD4bct/eUfhlIrQ29C035T/pQfEZxNX?=
 =?us-ascii?Q?8K329sD2ctLSA0wSnAhM1KP6mAos+ebKrVKgRnFXtn/wXc9Z2ZSEUz6CF/8Z?=
 =?us-ascii?Q?bxCn6IgbxPtZvlXXdWQPSen9p+QydfX0zTxurwo39KpmPDCZsKzU1GsUczuD?=
 =?us-ascii?Q?8zbuWr0LggjRybQMhmqfHtbQq5WE7Erp1RhRohc8kvm4LheY4KssQr4Nw1m7?=
 =?us-ascii?Q?+gH5M0C3+3wavvteZE4Qe+RSeYmyUXopxVYT67pNOKx8RRv/lS4nEy/haBgb?=
 =?us-ascii?Q?tU7UBGpAu+BYhHsj+DiL/e1mqrBAVTOQE/rmoG1uN2J+7pZTq9JCBz8gqg+H?=
 =?us-ascii?Q?+CzPCfplRElKzcmDLdlE2SThHh1iYBhpYf+xkU+Y7un4xy8oFx1xpkWU2Q8L?=
 =?us-ascii?Q?sw4U3nPPszy9O0NbfQ+PcdmSfDvjZwIs2Uq0/ubkF9hJtgswm+2e32/iVIPt?=
 =?us-ascii?Q?LEKkJF1WefMiKxUA7XIFfqN8?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4502
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cfaa0c3d-3600-4d27-7cf4-08d8d9a9aab1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BxLvuNkHcJpEGpDRjGct06JR3XfEmkpfRjiCV2+9VkR7ygS8AEIX1yzZ65pZjyGUzo4qLleTNfMb41Yc8JjAwswyrJNtV1s0SsBQJTOVWP1rYmmsKETr1HFITCBeSk1q4Z1CsW2Fh8nNqw1WeCoOT3SvTgzpGnAbVuRdQz3dL7JzpoOIIdqCAOefG27V/7iS7oKzMUhMaPGi0pXzQES1IKA1T20XhTAnCOQcsZCdRHfXFrJ7ESz8El3hxpZUoqXHGrrn22+SdAcoyX0ItbtkVkPg0nkM1U9TsVmdbD8n9yAVZwdzu1Zoq3mQVDD/EyxD1l4XWNBn2fkrYpMNHbJdScv9j8qzsqvCHY2J+mQvSPpn5+g7cO4EDuuWPQA30JbW5KBV+hNxazJVWM4BJJTOqZ0ln/344nvIGZnMPf375ILdPQTFYDaMGrMpq1S1P/mAsZ46XzeEX9QMHD1oCYdytsMwwNqKIRx133iKWX3+LWDybmxhcsv+15neUFueVK72dBK8VgoRJlWLW6wlRFCmNP1bq0ZP5Kx1wHB6Myclv5t24ETQOxPk7fP87grGNfhqHlGrU2rzq0WUNwQVjtjiMPiZZGxP2oI6K3w6HgiPzJCFu9AL8ynxmBhGiIJMjynsjrVS6IS8mcFiARJqgpHvyDvIlPxUVjCNKL3qTDmLNBg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(4326008)(36756003)(5660300002)(83380400001)(7696005)(2906002)(316002)(70206006)(82310400003)(16526019)(44832011)(47076005)(6666004)(6486002)(478600001)(81166007)(82740400003)(86362001)(6916009)(8676002)(356005)(8936002)(36860700001)(70586007)(956004)(336012)(186003)(26005)(19627235002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:23:28.6885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1727b81-18fe-432e-2365-08d8d9a9af51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6579
Content-Type: text/plain

Add 0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch backport
patch for u-boot 2021.01.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I0c3d48fcf43ff3eab9b5a547d8d792572908e978
---
 ...et-DRAM-to-4G-to-match-with-kernel-d.patch | 48 +++++++++++++++++++
 .../u-boot/u-boot_2021.01.bbappend            |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
new file mode 100644
index 0000000..541927c
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
@@ -0,0 +1,48 @@
+From 9abe5e68033dab0d521475090ffd0cef9cb2c581 Mon Sep 17 00:00:00 2001
+Message-Id: <9abe5e68033dab0d521475090ffd0cef9cb2c581.1614260356.git.diego.sueiro@arm.com>
+From: Diego Sueiro <diego.sueiro@arm.com>
+Date: Mon, 15 Feb 2021 07:27:57 +0000
+Subject: [PATCH] vexpress64_fvp: Set DRAM to 4G to match with kernel
+ devicetree
+
+Currently, the kernel devicetree is setting the DRAM size to ~4G.
+
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ configs/vexpress_aemv8a_semi_defconfig | 2 +-
+ include/configs/vexpress_aemv8a.h      | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
+index a26137ef5d..2ecb7762ce 100644
+--- a/configs/vexpress_aemv8a_semi_defconfig
++++ b/configs/vexpress_aemv8a_semi_defconfig
+@@ -2,7 +2,7 @@ CONFIG_ARM=y
+ CONFIG_TARGET_VEXPRESS64_BASE_FVP=y
+ CONFIG_SYS_TEXT_BASE=0x88000000
+ CONFIG_SYS_MALLOC_F_LEN=0x2000
+-CONFIG_NR_DRAM_BANKS=1
++CONFIG_NR_DRAM_BANKS=2
+ CONFIG_SYS_MEMTEST_START=0x80000000
+ CONFIG_SYS_MEMTEST_END=0xff000000
+ CONFIG_ENV_SIZE=0x40000
+diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
+index 566bee5b87..7318fb6c58 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -117,6 +117,9 @@
+ #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ #define PHYS_SDRAM_2			(0x880000000)
+ #define PHYS_SDRAM_2_SIZE		0x180000000
++#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP && CONFIG_NR_DRAM_BANKS == 2
++#define PHYS_SDRAM_2			(0x880000000)
++#define PHYS_SDRAM_2_SIZE		0x80000000
+ #endif
+ 
+ /* Enable memtest */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
index 6067981..fb4f192 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
@@ -5,7 +5,9 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
 #
 # FVP BASE
 #
-SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
+SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch \
+                            file://0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch \
+                          "
 
 #
 # FVP BASE ARM32
-- 
2.17.1

