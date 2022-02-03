Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230F1C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 15:44:38 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.77])
 by mx.groups.io with SMTP id smtpd.web09.10788.1643903075814667141
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 07:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=I9VYig64;
 spf=pass (domain: arm.com, ip: 40.107.0.77,
 mailfrom: davidson.kumaresan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QETZVZQSmS6B9HUckwcN80QJj8E/uqIo64VGZLOCJbA=;
 b=I9VYig64vvCdsw87/yrVKAjQftoZoSy2N34LcRcmAIzKqq3YvfmvRTKV+RGlNhxOU0s3qKrF2gRL0+I70noUjzL0UR/JMwVKAhTQa6SfW92KW2ZpKbHQAP1zLHU49KE0tsTtm3wSEdVcgHDz+jXIrOG1Q6JQsExdP4mWe4SQsIo=
Received: from AS9PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:20b:48b::9)
 by DBBPR08MB4645.eurprd08.prod.outlook.com (2603:10a6:10:dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 15:44:30 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::7c) by AS9PR04CA0063.outlook.office365.com
 (2603:10a6:20b:48b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 15:44:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 15:44:29 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 03 Feb 2022 15:44:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 839d52ea1afe4cb0
X-CR-MTA-TID: 64aa7808
Received: from 3c93b79b3a5e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99CF475F-2DC8-4CD7-BAC9-186BEB6867DC.1;
	Thu, 03 Feb 2022 15:44:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 3c93b79b3a5e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Feb 2022 15:44:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hX6OCzr5XMhkBWbIuXema1ygmYqwH25sfDgEpl5BAaGwQQOCPRJWmGLFucdRDhXHvNGQiigTo7wRlmj6Qc3EMY4au6xoKoE37goXQr8j4eqOCfSZ1EO8b26bhtR8P5T6Ggm7jA7w1hTiHFOjkNgR/S5DVJ/YzMYOway0nxVPRXAiOERSueMqknl0yQs4lu/X+Ucj7uQO414Dzmwprd+759duSbvrynBICRfhMf1Q+H39/H0EGePPkiqDT7QjEYCJNY7iDwdR8gIUPk+BR7aaZEUYnkvpX5yAo2VEQxWH7AJOIOiDryKjy+OOCcLeN1QYQOB6r+Uaszi7GNxjWprYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QETZVZQSmS6B9HUckwcN80QJj8E/uqIo64VGZLOCJbA=;
 b=fbf8FSpjunNBLIBiQSKVLRLNk+Sp2v54fjrJ93qyVL6y//iNSYuswUBPwnxBHjINeC1oh4L7QfJbNl2TtffKbmiKMAw+BMTL+5BhcW9fQNYpkXx39Nqm8hF6aahpLjM72ZEOLeC6ToZMozHeH947EcdinkzQE8WlkiToheW7eVdSqows8zrWIezX0+dUGiIRz7MfGTWwWr/dYa03OMf2axYGFT6pVa1N6b46iKMdsm2WopWlCkH9tRIOa5vWT8zcYxMJ8oWFWjzvHcTkP5ZabhQyHIf3+pe9cofyqp/Ip0kAdEjNaa9BEPhdZvrNdHdFk7FezzbBRDyqAG+QQbBXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QETZVZQSmS6B9HUckwcN80QJj8E/uqIo64VGZLOCJbA=;
 b=I9VYig64vvCdsw87/yrVKAjQftoZoSy2N34LcRcmAIzKqq3YvfmvRTKV+RGlNhxOU0s3qKrF2gRL0+I70noUjzL0UR/JMwVKAhTQa6SfW92KW2ZpKbHQAP1zLHU49KE0tsTtm3wSEdVcgHDz+jXIrOG1Q6JQsExdP4mWe4SQsIo=
Received: from AM6P194CA0072.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::49)
 by AM4PR08MB2786.eurprd08.prod.outlook.com (2603:10a6:205:9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 15:44:21 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::1) by AM6P194CA0072.outlook.office365.com
 (2603:10a6:209:84::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 15:44:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 15:44:20 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 3 Feb
 2022 15:44:07 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 3
 Feb 2022 15:44:04 +0000
Received: from a076574-lin.blr.arm.com (10.162.16.64) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 3 Feb 2022 15:44:05 +0000
From: Davidson K <davidson.kumaresan@arm.com>
To: <meta-arm@lists.yoctoproject.org>
CC: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH] arm-bsp/tc: enable tracing in Total Compute
Date: Thu, 3 Feb 2022 21:13:45 +0530
Message-ID: <20220203154345.36540-1-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: feee0672-8a43-4b24-1f05-08d9e72c10e9
X-MS-TrafficTypeDiagnostic: 
	AM4PR08MB2786:EE_|AM5EUR03FT006:EE_|DBBPR08MB4645:EE_
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB46458ADBE57ED469A68D81BC90289@DBBPR08MB4645.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:127;OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TQgdEISHY7OY1ZsC8Q18KJCcJ2CkXCGOM1sa4KJbl1hnnargrKigAwCrngvL6pNEtySs1Tu33SPMlCXzghED4zeTBkdXVEZDWBlobPp16ncnamnTkGbelrojHFjJJd8EuU/JILDVSxvVaQpI1yZKBW5WszMueGmhXBJY9opYz14FQZ45jbwVw1AG2L+J662GZD1hABcSNKOcrbdWgXBIQo4cEzHWNHjjFfh4KYmnjnhWSVhYCsI5ZPIJozNEBP7jxqmN7jf+vwEpFmcT+ROgP5tCU8oU/EcsTxuvLuUB1jjqE3xagasuFKHGY4Pwn0wz8QaDYmqXWnmj+qRtwDrlDd3jFDXYr82Jk0URjqWbLgapURXQcbxrLgWmBsdCtDF55UPvNry5tIpMohzq9KI9eOHU7Kqpjud3HaC4m3oSjVfN9ZxWmJ2myan5LkJzUGZdMCsTBCve2z7cOj9Z7ZpGucaqBQ5Gj1qDI3iuNHcc+wiPPcZ8lQEZTivTbiKfn+pn5kSgZ2ucKUQ0T6v+7buwpd8LTBfZqEizR7Tv2ZPwW8tyoDYQmupXA35ibSv+aARX4TBzcROPInrpJEPqJrFW8heUbHVCU36OCRiHfy18wrqdWbGiFwPuTaz1XNTS1j0z5SzXqTIAXz7ujWKwEQPDaIDfEJiHCEYYGxkmT7x6NoRpM10THRy6USNdFBc5lc4R/atRBLHlRmEKkwPgZlcQgD1GkJZ1xJubm3OPTjg+FffkDPYcl0CU0vFzfsNRbQJMd5wqDR7DIUpmaI5YLxS+H/WBt0YBeYvwOWWIjptGlJ4kgZLFkUQ7oDvJHy8VGlw2GBbOEEKx6T5KJBAop60KjQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(81166007)(4326008)(356005)(70206006)(70586007)(8676002)(26005)(336012)(966005)(40460700003)(508600001)(83380400001)(7696005)(82310400004)(6666004)(186003)(1076003)(426003)(5660300002)(2616005)(2906002)(19627235002)(316002)(47076005)(6916009)(36860700001)(86362001)(30864003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2786
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a8d5127-7917-4115-a677-08d9e72c0b92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TbfcyZ2ebnGi+vYGgZvcg7+Y+46jwLzU6HfqPcKpZH7kRs/3rCESRIpXH4JFWYTXqpRXcyBcilQjD7ZIhhAFrRu+lWeLZGCU/qLwXJr2bN4daGz2v2KKcbFVkXwuG1qO/S3os85GhHqHrTT6Euf3ZOwj62N+Ewb1wi8tSoRLIvT7EJl012xJtefdaRnz/MDz2lRNa6Q0bxc6Yp1yXxVthMsUJXDbq3apbcaPaTey/2vw+cMA7ZGPYbzq2aK5cH4i8nVKzZDEtt4srnC5Z0qLc9sM/10nJskFEbrJ/P+onUllUQJfUGUKZeRUTPoMnq+RT4H1L1CUhIL6Ijhw9DTLgsqHdqBv/IQaxyWq5mDVrgsHuIcD2WKSVWJN4nXoQALqpb0ZuBYjNJzaSTmin1uwL9008atsy4RR0tmE/P68PTMSdgdphZMGTIoYFoFEc9bPUdkSXk48tPAOwdMBCfgsKaI3TtIo/EmnYQ0QpuLaDMSnQDc+4J1iTOVezEbIlfAQnigKsGWTqfMGDifYyxL2pzA4kf0g8mhihxmDJCbJXsFqmmmT5jYGmFAjAtm4mH+VOPhEPpEkiX1sZjHTpyaJtC4UANu4eB21vOLNomx9YOaitTNXR79OksATPmMhjvHRFUxBG9vkU4FrA3ndAl+oxyJIcr8GmmNlvg1ZuntL7f/wVSooyJ2IYHmVUp6i/fPjfHCq9T8/fUD9F7Cho2yukvAGyESpHwrxr3GgKLWSZ9wRY9yi75/EgVy0GvdWRoG6NkTw/ZhF9B5j0M2EMKfOUGqO4z/WsbAcaldjGt84IQwvpV4TNyYxzxV9upEZnU9c
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(966005)(86362001)(186003)(83380400001)(7696005)(6916009)(6666004)(40460700003)(19627235002)(508600001)(316002)(30864003)(47076005)(336012)(2906002)(8676002)(36756003)(5660300002)(4326008)(70206006)(70586007)(426003)(26005)(2616005)(1076003)(81166007)(82310400004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 15:44:29.7145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 feee0672-8a43-4b24-1f05-08d9e72c10e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4645
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Feb 2022 15:44:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2944

Enable coresight components in the config and also port the patches
which were upstreamed in later version of the linux kernel.

Change-Id: I27983abd5f2945328f7465cc1b2af4f8e848b69b
Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
---
 .../bsp/arm-platforms/tc.scc                  |   1 +
 .../bsp/arm-platforms/tc/autofdo.cfg          |   3 +
 .../linux/linux-arm-platforms.inc             |   2 +
 ...resight-etm4x-Save-restore-TRFCR_EL1.patch | 181 ++++++++++++++
 ...Use-Trace-Filtering-controls-dynamic.patch | 227 ++++++++++++++++++
 5 files changed, 414 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/tc/autofdo.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc/0022-coresight-etm4x-Save-restore-TRFCR_EL1.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc/0023-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/tc.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bs=
p/arm-platforms/tc.scc
index 86e450c6..62748e1c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/tc.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/tc.scc
@@ -5,3 +5,4 @@ kconf non-hardware tc/gralloc.cfg
 kconf non-hardware tc/mali.cfg
 kconf non-hardware tc/tee.cfg
 kconf non-hardware tc/virtio.cfg
+kconf non-hardware tc/autofdo.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/tc/autofdo.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-=
kmeta/bsp/arm-platforms/tc/autofdo.cfg
new file mode 100644
index 00000000..8530c884
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/tc/autofdo.cfg
@@ -0,0 +1,3 @@
+CONFIG_CORESIGHT=3Dy
+CONFIG_CORESIGHT_SOURCE_ETM4X=3Dy
+CONFIG_CORESIGHT_TRBE=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 418ea3dd..0f62011c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -220,5 +220,7 @@ SRC_URI:append:tc =3D " \
     file://0018-optee-add-a-FF-A-memory-pool.patch \
     file://0019-optee-add-FF-A-support.patch \
     file://0021-arm_ffa-add-support-for-FFA-v1.1.patch \
+    file://0022-coresight-etm4x-Save-restore-TRFCR_EL1.patch \
+    file://0023-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch=
 \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022=
-coresight-etm4x-Save-restore-TRFCR_EL1.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.10/tc/0022-coresight-etm4x-Save-restore-TRFCR_EL1.=
patch
new file mode 100644
index 00000000..e67658fa
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0022-coresi=
ght-etm4x-Save-restore-TRFCR_EL1.patch
@@ -0,0 +1,181 @@
+From 7150eac72ee0c2c7da03f53a90a871c3d6d4e538 Mon Sep 17 00:00:00 2001
+From: Suzuki K Poulose <suzuki.poulose@arm.com>
+Date: Tue, 14 Sep 2021 11:26:32 +0100
+Subject: [PATCH 1/2] coresight: etm4x: Save restore TRFCR_EL1
+
+When the CPU enters a low power mode, the TRFCR_EL1 contents could be
+reset. Thus we need to save/restore the TRFCR_EL1 along with the ETM4x
+registers to allow the tracing.
+
+The TRFCR related helpers are in a new header file, as we need to use
+them for TRBE in the later patches.
+
+Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
+Cc: Anshuman Khandual <anshuman.khandual@arm.com>
+Cc: Mike Leach <mike.leach@linaro.org>
+Cc: Leo Yan <leo.yan@linaro.org>
+Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
+Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
+Link: https://lore.kernel.org/r/20210914102641.1852544-2-suzuki.poulose@ar=
m.com
+[Fixed cosmetic details]
+Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/commit/?id=3D937d3f58cacf377cab7c32e475e1ffa91d611dce]
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+---
+ .../coresight/coresight-etm4x-core.c          | 43 +++++++++++++------
+ drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
+ .../coresight/coresight-self-hosted-trace.h   | 24 +++++++++++
+ 3 files changed, 57 insertions(+), 12 deletions(-)
+ create mode 100644 drivers/hwtracing/coresight/coresight-self-hosted-trac=
e.h
+
+diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/=
hwtracing/coresight/coresight-etm4x-core.c
+index 90827077d2f9..b78080d169f8 100644
+--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
++++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
+@@ -39,6 +39,7 @@
+=20
+ #include "coresight-etm4x.h"
+ #include "coresight-etm-perf.h"
++#include "coresight-self-hosted-trace.h"
+=20
+ static int boot_enable;
+ module_param(boot_enable, int, 0444);
+@@ -990,7 +991,7 @@ static void cpu_enable_tracing(struct etmv4_drvdata *d=
rvdata)
+ 	if (is_kernel_in_hyp_mode())
+ 		trfcr |=3D TRFCR_EL2_CX;
+=20
+-	write_sysreg_s(trfcr, SYS_TRFCR_EL1);
++	write_trfcr(trfcr);
+ }
+=20
+ static void etm4_init_arch_data(void *info)
+@@ -1528,7 +1529,7 @@ static void etm4_init_trace_id(struct etmv4_drvdata =
*drvdata)
+ 	drvdata->trcid =3D coresight_get_trace_id(drvdata->cpu);
+ }
+=20
+-static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
++static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
+ {
+ 	int i, ret =3D 0;
+ 	struct etmv4_save_state *state;
+@@ -1667,7 +1668,23 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvd=
ata)
+ 	return ret;
+ }
+=20
+-static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
++static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
++{
++	int ret =3D 0;
++
++	/* Save the TRFCR irrespective of whether the ETM is ON */
++	if (drvdata->trfc)
++		drvdata->save_trfcr =3D read_trfcr();
++	/*
++	 * Save and restore the ETM Trace registers only if
++	 * the ETM is active.
++	 */
++	if (local_read(&drvdata->mode) && drvdata->save_state)
++		ret =3D __etm4_cpu_save(drvdata);
++	return ret;
++}
++
++static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+ {
+ 	int i;
+ 	struct etmv4_save_state *state =3D drvdata->save_state;
+@@ -1763,6 +1780,14 @@ static void etm4_cpu_restore(struct etmv4_drvdata *=
drvdata)
+ 	etm4_cs_lock(drvdata, csa);
+ }
+=20
++static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
++{
++	if (drvdata->trfc)
++		write_trfcr(drvdata->save_trfcr);
++	if (drvdata->state_needs_restore)
++		__etm4_cpu_restore(drvdata);
++}
++
+ static int etm4_cpu_pm_notify(struct notifier_block *nb, unsigned long cm=
d,
+ 			      void *v)
+ {
+@@ -1774,23 +1799,17 @@ static int etm4_cpu_pm_notify(struct notifier_bloc=
k *nb, unsigned long cmd,
+=20
+ 	drvdata =3D etmdrvdata[cpu];
+=20
+-	if (!drvdata->save_state)
+-		return NOTIFY_OK;
+-
+ 	if (WARN_ON_ONCE(drvdata->cpu !=3D cpu))
+ 		return NOTIFY_BAD;
+=20
+ 	switch (cmd) {
+ 	case CPU_PM_ENTER:
+-		/* save the state if self-hosted coresight is in use */
+-		if (local_read(&drvdata->mode))
+-			if (etm4_cpu_save(drvdata))
+-				return NOTIFY_BAD;
++		if (etm4_cpu_save(drvdata))
++			return NOTIFY_BAD;
+ 		break;
+ 	case CPU_PM_EXIT:
+ 	case CPU_PM_ENTER_FAILED:
+-		if (drvdata->state_needs_restore)
+-			etm4_cpu_restore(drvdata);
++		etm4_cpu_restore(drvdata);
+ 		break;
+ 	default:
+ 		return NOTIFY_DONE;
+diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtra=
cing/coresight/coresight-etm4x.h
+index e5b79bdb9851..82cba16b73a6 100644
+--- a/drivers/hwtracing/coresight/coresight-etm4x.h
++++ b/drivers/hwtracing/coresight/coresight-etm4x.h
+@@ -921,6 +921,7 @@ struct etmv4_save_state {
+  * @lpoverride:	If the implementation can support low-power state over.
+  * @trfc:	If the implementation supports Arm v8.4 trace filter controls.
+  * @config:	structure holding configuration parameters.
++ * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
+  * @save_state:	State to be preserved across power loss
+  * @state_needs_restore: True when there is context to restore after PM e=
xit
+  * @skip_power_up: Indicates if an implementation can skip powering up
+@@ -973,6 +974,7 @@ struct etmv4_drvdata {
+ 	bool				lpoverride;
+ 	bool				trfc;
+ 	struct etmv4_config		config;
++	u64				save_trfcr;
+ 	struct etmv4_save_state		*save_state;
+ 	bool				state_needs_restore;
+ 	bool				skip_power_up;
+diff --git a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h b/d=
rivers/hwtracing/coresight/coresight-self-hosted-trace.h
+new file mode 100644
+index 000000000000..303d71911870
+--- /dev/null
++++ b/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
+@@ -0,0 +1,24 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Arm v8 Self-Hosted trace support.
++ *
++ * Copyright (C) 2021 ARM Ltd.
++ */
++
++#ifndef __CORESIGHT_SELF_HOSTED_TRACE_H
++#define __CORESIGHT_SELF_HOSTED_TRACE_H
++
++#include <asm/sysreg.h>
++
++static inline u64 read_trfcr(void)
++{
++	return read_sysreg_s(SYS_TRFCR_EL1);
++}
++
++static inline void write_trfcr(u64 val)
++{
++	write_sysreg_s(val, SYS_TRFCR_EL1);
++	isb();
++}
++
++#endif /*  __CORESIGHT_SELF_HOSTED_TRACE_H */
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0023=
-coresight-etm4x-Use-Trace-Filtering-controls-dynamic.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.10/tc/0023-coresight-etm4x-Use-Trace=
-Filtering-controls-dynamic.patch
new file mode 100644
index 00000000..4d5a719b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0023-coresi=
ght-etm4x-Use-Trace-Filtering-controls-dynamic.patch
@@ -0,0 +1,227 @@
+From 55228b0522bfb7d945019a8931742ab9b063b6c9 Mon Sep 17 00:00:00 2001
+From: Suzuki K Poulose <suzuki.poulose@arm.com>
+Date: Tue, 14 Sep 2021 11:26:33 +0100
+Subject: [PATCH 2/2] coresight: etm4x: Use Trace Filtering controls
+ dynamically
+
+The Trace Filtering support (FEAT_TRF) ensures that the ETM
+can be prohibited from generating any trace for a given EL.
+This is much stricter knob, than the TRCVICTLR exception level
+masks, which doesn't prevent the ETM from generating Context
+packets for an "excluded" EL. At the moment, we do a onetime
+enable trace at user and kernel and leave it untouched for the
+kernel life time. This implies that the ETM could potentially
+generate trace packets containing the kernel addresses, and
+thus leaking the kernel virtual address in the trace.
+
+This patch makes the switch dynamic, by honoring the filters
+set by the user and enforcing them in the TRFCR controls.
+We also rename the cpu_enable_tracing() appropriately to
+cpu_detect_trace_filtering() and the drvdata member
+trfc =3D> trfcr to indicate the "value" of the TRFCR_EL1.
+
+Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
+Cc: Al Grant <al.grant@arm.com>
+Cc: Mike Leach <mike.leach@linaro.org>
+Cc: Leo Yan <leo.yan@linaro.org>
+Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
+Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
+Link: https://lore.kernel.org/r/20210914102641.1852544-3-suzuki.poulose@ar=
m.com
+Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/commit/?id=3D5f6fd1aa8cc147b111af1a833574487a87237dc0]
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+---
+ .../coresight/coresight-etm4x-core.c          | 63 ++++++++++++++-----
+ drivers/hwtracing/coresight/coresight-etm4x.h |  7 ++-
+ .../coresight/coresight-self-hosted-trace.h   |  7 +++
+ 3 files changed, 59 insertions(+), 18 deletions(-)
+
+diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/=
hwtracing/coresight/coresight-etm4x-core.c
+index b78080d169f8..b804d4413b43 100644
+--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
++++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
+@@ -237,6 +237,45 @@ struct etm4_enable_arg {
+ 	int rc;
+ };
+=20
++/*
++ * etm4x_prohibit_trace - Prohibit the CPU from tracing at all ELs.
++ * When the CPU supports FEAT_TRF, we could move the ETM to a trace
++ * prohibited state by filtering the Exception levels via TRFCR_EL1.
++ */
++static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
++{
++	/* If the CPU doesn't support FEAT_TRF, nothing to do */
++	if (!drvdata->trfcr)
++		return;
++	cpu_prohibit_trace();
++}
++
++/*
++ * etm4x_allow_trace - Allow CPU tracing in the respective ELs,
++ * as configured by the drvdata->config.mode for the current
++ * session. Even though we have TRCVICTLR bits to filter the
++ * trace in the ELs, it doesn't prevent the ETM from generating
++ * a packet (e.g, TraceInfo) that might contain the addresses from
++ * the excluded levels. Thus we use the additional controls provided
++ * via the Trace Filtering controls (FEAT_TRF) to make sure no trace
++ * is generated for the excluded ELs.
++ */
++static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
++{
++	u64 trfcr =3D drvdata->trfcr;
++
++	/* If the CPU doesn't support FEAT_TRF, nothing to do */
++	if (!trfcr)
++		return;
++
++	if (drvdata->config.mode & ETM_MODE_EXCL_KERN)
++		trfcr &=3D ~TRFCR_ELx_ExTRE;
++	if (drvdata->config.mode & ETM_MODE_EXCL_USER)
++		trfcr &=3D ~TRFCR_ELx_E0TRE;
++
++	write_trfcr(trfcr);
++}
++
+ #ifdef CONFIG_ETM4X_IMPDEF_FEATURE
+=20
+ #define HISI_HIP08_AMBA_ID		0x000b6d01
+@@ -441,6 +480,7 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdat=
a)
+ 	if (etm4x_is_ete(drvdata))
+ 		etm4x_relaxed_write32(csa, TRCRSR_TA, TRCRSR);
+=20
++	etm4x_allow_trace(drvdata);
+ 	/* Enable the trace unit */
+ 	etm4x_relaxed_write32(csa, 1, TRCPRGCTLR);
+=20
+@@ -724,7 +764,6 @@ static int etm4_enable(struct coresight_device *csdev,
+ static void etm4_disable_hw(void *info)
+ {
+ 	u32 control;
+-	u64 trfcr;
+ 	struct etmv4_drvdata *drvdata =3D info;
+ 	struct etmv4_config *config =3D &drvdata->config;
+ 	struct coresight_device *csdev =3D drvdata->csdev;
+@@ -751,12 +790,7 @@ static void etm4_disable_hw(void *info)
+ 	 * If the CPU supports v8.4 Trace filter Control,
+ 	 * set the ETM to trace prohibited region.
+ 	 */
+-	if (drvdata->trfc) {
+-		trfcr =3D read_sysreg_s(SYS_TRFCR_EL1);
+-		write_sysreg_s(trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE),
+-			       SYS_TRFCR_EL1);
+-		isb();
+-	}
++	etm4x_prohibit_trace(drvdata);
+ 	/*
+ 	 * Make sure everything completes before disabling, as recommended
+ 	 * by section 7.3.77 ("TRCVICTLR, ViewInst Main Control Register,
+@@ -772,9 +806,6 @@ static void etm4_disable_hw(void *info)
+ 	if (coresight_timeout(csa, TRCSTATR, TRCSTATR_PMSTABLE_BIT, 1))
+ 		dev_err(etm_dev,
+ 			"timeout while waiting for PM stable Trace Status\n");
+-	if (drvdata->trfc)
+-		write_sysreg_s(trfcr, SYS_TRFCR_EL1);
+-
+ 	/* read the status of the single shot comparators */
+ 	for (i =3D 0; i < drvdata->nr_ss_cmp; i++) {
+ 		config->ss_status[i] =3D
+@@ -969,15 +1000,15 @@ static bool etm4_init_csdev_access(struct etmv4_drv=
data *drvdata,
+ 	return false;
+ }
+=20
+-static void cpu_enable_tracing(struct etmv4_drvdata *drvdata)
++static void cpu_detect_trace_filtering(struct etmv4_drvdata *drvdata)
+ {
+ 	u64 dfr0 =3D read_sysreg(id_aa64dfr0_el1);
+ 	u64 trfcr;
+=20
++	drvdata->trfcr =3D 0;
+ 	if (!cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_TRACE_FILT_S=
HIFT))
+ 		return;
+=20
+-	drvdata->trfc =3D true;
+ 	/*
+ 	 * If the CPU supports v8.4 SelfHosted Tracing, enable
+ 	 * tracing at the kernel EL and EL0, forcing to use the
+@@ -991,7 +1022,7 @@ static void cpu_enable_tracing(struct etmv4_drvdata *=
drvdata)
+ 	if (is_kernel_in_hyp_mode())
+ 		trfcr |=3D TRFCR_EL2_CX;
+=20
+-	write_trfcr(trfcr);
++	drvdata->trfcr =3D trfcr;
+ }
+=20
+ static void etm4_init_arch_data(void *info)
+@@ -1177,7 +1208,7 @@ static void etm4_init_arch_data(void *info)
+ 	/* NUMCNTR, bits[30:28] number of counters available for tracing */
+ 	drvdata->nr_cntr =3D BMVAL(etmidr5, 28, 30);
+ 	etm4_cs_lock(drvdata, csa);
+-	cpu_enable_tracing(drvdata);
++	cpu_detect_trace_filtering(drvdata);
+ }
+=20
+ static inline u32 etm4_get_victlr_access_type(struct etmv4_config *config=
)
+@@ -1673,7 +1704,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvda=
ta)
+ 	int ret =3D 0;
+=20
+ 	/* Save the TRFCR irrespective of whether the ETM is ON */
+-	if (drvdata->trfc)
++	if (drvdata->trfcr)
+ 		drvdata->save_trfcr =3D read_trfcr();
+ 	/*
+ 	 * Save and restore the ETM Trace registers only if
+@@ -1782,7 +1813,7 @@ static void __etm4_cpu_restore(struct etmv4_drvdata =
*drvdata)
+=20
+ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
+ {
+-	if (drvdata->trfc)
++	if (drvdata->trfcr)
+ 		write_trfcr(drvdata->save_trfcr);
+ 	if (drvdata->state_needs_restore)
+ 		__etm4_cpu_restore(drvdata);
+diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtra=
cing/coresight/coresight-etm4x.h
+index 82cba16b73a6..3c4d69b096ca 100644
+--- a/drivers/hwtracing/coresight/coresight-etm4x.h
++++ b/drivers/hwtracing/coresight/coresight-etm4x.h
+@@ -919,7 +919,10 @@ struct etmv4_save_state {
+  * @nooverflow:	Indicate if overflow prevention is supported.
+  * @atbtrig:	If the implementation can support ATB triggers
+  * @lpoverride:	If the implementation can support low-power state over.
+- * @trfc:	If the implementation supports Arm v8.4 trace filter controls.
++ * @trfcr:	If the CPU supports FEAT_TRF, value of the TRFCR_ELx that
++ *		allows tracing at all ELs. We don't want to compute this
++ *		at runtime, due to the additional setting of TRFCR_CX when
++ *		in EL2. Otherwise, 0.
+  * @config:	structure holding configuration parameters.
+  * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
+  * @save_state:	State to be preserved across power loss
+@@ -972,7 +975,7 @@ struct etmv4_drvdata {
+ 	bool				nooverflow;
+ 	bool				atbtrig;
+ 	bool				lpoverride;
+-	bool				trfc;
++	u64				trfcr;
+ 	struct etmv4_config		config;
+ 	u64				save_trfcr;
+ 	struct etmv4_save_state		*save_state;
+diff --git a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h b/d=
rivers/hwtracing/coresight/coresight-self-hosted-trace.h
+index 303d71911870..23f05df3f173 100644
+--- a/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
++++ b/drivers/hwtracing/coresight/coresight-self-hosted-trace.h
+@@ -21,4 +21,11 @@ static inline void write_trfcr(u64 val)
+ 	isb();
+ }
+=20
++static inline void cpu_prohibit_trace(void)
++{
++	u64 trfcr =3D read_trfcr();
++
++	/* Prohibit tracing at EL0 & the kernel EL */
++	write_trfcr(trfcr & ~(TRFCR_ELx_ExTRE | TRFCR_ELx_E0TRE));
++}
+ #endif /*  __CORESIGHT_SELF_HOSTED_TRACE_H */
+--=20
+2.34.1
+
--=20
2.34.1


