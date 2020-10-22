Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.49])
 by mx.groups.io with SMTP id smtpd.web08.6438.1603349410093298413
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 23:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7gK/WxQO;
 spf=pass (domain: arm.com, ip: 40.107.1.49, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKDxKo7LcUDWbGQ+aPQzr8Y/joUH+e43wDNqQ3FlM84=;
 b=7gK/WxQO5Q8AW46DZZ/EVRqI2tvs4s958NviJBJL9pDGIVybgtruzI/OvrXv2myL9TEIqXgOJ0L7S9kRYDpiz8igxnpXgrSIbY5ucwXVZlE7VyB+wBzI845u+swevDH3iUQoSZN+hcPQD7u8NMzRdS5HI34oNnIv2O/Cber3vIU=
Received: from AM4PR0202CA0011.eurprd02.prod.outlook.com
 (2603:10a6:200:89::21) by VI1PR08MB3088.eurprd08.prod.outlook.com
 (2603:10a6:803:3f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 22 Oct
 2020 06:50:05 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:89:cafe::36) by AM4PR0202CA0011.outlook.office365.com
 (2603:10a6:200:89::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 22 Oct 2020 06:50:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 06:50:04 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Thu, 22 Oct 2020 06:50:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37567b0fbebbb8ef
X-CR-MTA-TID: 64aa7808
Received: from 2bd8b10820f9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8DDE93B9-CAD4-4CCC-B985-EC38D893A1A3.1;
	Thu, 22 Oct 2020 06:49:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2bd8b10820f9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Oct 2020 06:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTRv/5dWSM1O6hsqW97hgn3Giva3em1qvZoIXwxlV9jaa1fQVVEDTMZX0dU6xzv1RmhFYBtZB81ar0vgBm9SFKfHtoboNKlxIzSrgNCWdcrNlWE+eAiZdvdo3JBEFFmSKAPZqVVQGI2cHH0q2eQa2HOGK72B6sPTozyP/Bh5wGChqdS0LQhn0QUgjjEn1tEx0UYjbDECCqTvuLQDVwRJAqCZjbWa25pphYgIP3JjaGL+z/YsXT6MQ/62DvF35WCb24WLl1pjYpmtE23Ds9TL7+OgOxXrzIHLqJS0ZSoBccpEuBBTn6ld6A0VTwUBJdahyftlE9Exn02GnZnoq3PnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKDxKo7LcUDWbGQ+aPQzr8Y/joUH+e43wDNqQ3FlM84=;
 b=faIPD26KGMF80JxbRLarKYbn/VuoscdAkU7Fg45nDfK2PHwoWF+YSPsLvRaj5gBQuDWCe0C0iOnJC6K/zsTtq6zX+GsF9jMEDL6xVjU7URIYtq+FMzWNECcwEeEZSM19k6Cb+DmnX4R1195ilX9E1zW7JtyF5n1OnP7ivPNbv5y71ov1JDPawKRKrj5+p0C034riwz0DMsgoVWc7v7hDO0DRG0COI2zHHWPtt+AVem/1lcmOzigCaHcYivd9gOZR4ZcOtfY74+SGuzwTMSRPYajBVBVxIfRF7sQKhb63PiXsFKEdtvta3G6hoSun72nw1lXmAxCmbQ+weJcqSey8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKDxKo7LcUDWbGQ+aPQzr8Y/joUH+e43wDNqQ3FlM84=;
 b=7gK/WxQO5Q8AW46DZZ/EVRqI2tvs4s958NviJBJL9pDGIVybgtruzI/OvrXv2myL9TEIqXgOJ0L7S9kRYDpiz8igxnpXgrSIbY5ucwXVZlE7VyB+wBzI845u+swevDH3iUQoSZN+hcPQD7u8NMzRdS5HI34oNnIv2O/Cber3vIU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6181.eurprd08.prod.outlook.com (2603:10a6:20b:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 06:49:55 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 06:49:55 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH v2 1/2] arm-autonomy/xen: Backport improvements to xen 4.14
Date: Thu, 22 Oct 2020 07:49:49 +0100
Message-Id: <273cf71a35491c97c19ac7bc32ec7ebbb8c7acc6.1603349281.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3477.22 via Frontend Transport; Thu, 22 Oct 2020 06:49:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1ffa645e-8ab3-4d9b-ba70-08d87656b4ec
X-MS-TrafficTypeDiagnostic: AS8PR08MB6181:|VI1PR08MB3088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB308885FC53B99F111F53CCCA921D0@VI1PR08MB3088.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 U7CezaR0qgOBcyXdzfZDNMwQxFZx/QacEfsmULIOVzfQqIKMALABKDHC3oiFAKgfDQHrK5kmP+SxlXNEbr6lidfsRK/dJPp5tkhQdfU/rnwp78u+3bJrcrUjRPp9xrQj7wnVIPbEg2/lo6xAIK3cg3QaWIkD0X3+gXul9UDaYxIXQ4xBkjchog1hsrh/bTmy9jEBpe8+Bk4gAsJ9X3jx7UOCv5RX8JGfpuKnpxFbACfvlCsrMjRFKjnsQLDNyP5d5C2nRe2ChKBxEARlNKBxzs+b9gsQsVNVgROaRbSkbYT897p2B3buNT4XfddWVDGlYT4MMQcppBaeG+yF/2tI8Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(36756003)(6916009)(8936002)(19627235002)(66476007)(44832011)(66946007)(66556008)(956004)(2616005)(4326008)(316002)(83380400001)(2906002)(30864003)(5660300002)(86362001)(7696005)(16526019)(186003)(52116002)(8676002)(6486002)(26005)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 7aAm/3v/axjw1LFn/0faVUNy8mDON9ylZJXl3vc8E8r9sB+LcMF1y4uLXbUBJ+u7fjONtlB1BK0T5rMpZ68uFJ4HXNVcu3kjQ1MQFqJyequ80TKa5Yvi9lm4CZpmeHott27b+5O20O+diJF309CVT4O/B9PlUFuYsPMCCpCQMXZSlmtqM/xiK7ErjNJSjHR+hzJE5YYjqsH4r7qSP8Wk3GYX1whP0nIxMndmraY9kGf3cyEO+/8WHYbAzqDL3hG99DiNhGb2s2hOu5ZjjIoVKCxrAfDyNK07Lvy3UsTULrRaRvlHOOKPtdScYic3x9Hf+Y6kCdPFYQRm7912PuSlcxIHSmH5WC/bWe9EP/ci2A7yNzsrmiHVaA1y37SYZrz4/EI7Uiz5kq1jCbXVWnPE4OLMrQHcz2sVg9wS0ynuC7GPeazn23g+to1GgvBvbOa1XHYirmQDbHPlbHdVamtVjBsD60c/g/dkETBD8IgLpQJRidZldsndC9Zj50i0x+HeJ+x0MGFRklddUyagMFERE7fa5qge26MGolhnDQ3mXBK2Nxz/ZuxWlLeUhnBuX0ZYUySVRzYofLtOgXCK/agmZae4y1/OtgOc8/kztaz4CIi3vuBnINF4Ahmhdka7m17//re6fjREY/rzebvj30i1YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6181
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e845c5bb-ad75-4196-4534-08d87656aef7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nOcPGgJwYkwvUvnXgvToCdWdR1CBCg8Xljp69krud56niKh3zWtaz/ssw75sZpAQPMlg0zh+Lsy3O5Wng04M03paU6NeB+OK4bBd7J7WYvtUXARilg7d0cQH9Vde+Y/xDV2/tA9LRbDU5FdcAj+UlnGhWMBvKpTvUZiV1UDwYol6q6bIbQK3G/tzHwhhuoPGAF2ObZSBWS/QUCpdJBVZLPQCmij7nXKn21JINaivLq9wGIgGLfPMAFH4FdhrF4LBzAvLCwgN7ffh5YxAFdpPPx5ytj9tiugxl1qa/32xZ3mAfcrhqLBTMxWCrzb0OIXY5tH28LyBfkerIJ5qlt6C8KASumW2qJDc6643LSe8ASJ5a8Zdr5y+iLVwluRcgNEcfD1W5r/hIjLZCqD2Ol+acg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(30864003)(356005)(70206006)(6666004)(70586007)(82740400003)(47076004)(19627235002)(82310400003)(83380400001)(16526019)(8936002)(2906002)(26005)(478600001)(81166007)(5660300002)(336012)(6486002)(316002)(36756003)(7696005)(2616005)(186003)(956004)(4326008)(86362001)(44832011)(6916009)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 06:50:04.6894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffa645e-8ab3-4d9b-ba70-08d87656b4ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3088
Content-Type: text/plain

These patches improve the overall stability of Xen.

Change-Id: I40c93f1c28fe9bd9548883c1cc0c38e1be7f56c3
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 ...-Add-Neoverse-N1-processor-identification.patch | 40 +++++++++++++++++
 ...m-Enable-CPU-Erratum-1165522-for-Neoverse.patch | 42 ++++++++++++++++++
 ...ate-silicon-errata.txt-with-the-Neovers-A.patch | 35 +++++++++++++++
 ...sing-N1-A76-A75-FP-registers-in-vCPU-cont.patch | 51 ++++++++++++++++++++++
 ...ow-messages-for-unknown-FP-SIMD-implement.patch | 51 ++++++++++++++++++++++
 .../recipes-extended/xen/xen_4.14.bbappend         |  9 ++++
 6 files changed, 228 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
 create mode 100644 meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
new file mode 100644
index 0000000..df5e73e
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0001-arm-Add-Neoverse-N1-processor-identification.patch
@@ -0,0 +1,40 @@
+From 3b418b33265402aab0cb1bf2b745a25724bae2d8 Mon Sep 17 00:00:00 2001
+Message-Id: <3b418b33265402aab0cb1bf2b745a25724bae2d8.1602684880.git.diego.sueiro@arm.com>
+From: Bertrand Marquis <bertrand.marquis@arm.com>
+Date: Tue, 18 Aug 2020 14:47:38 +0100
+Subject: [PATCH] arm: Add Neoverse N1 processor identification
+
+Add MIDR and CPU part numbers for Neoverse N1
+
+Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Julien Grall <jgrall@amazon.com>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ xen/include/asm-arm/processor.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xen/include/asm-arm/processor.h b/xen/include/asm-arm/processor.h
+index aa642e3..3ca67f8 100644
+--- a/xen/include/asm-arm/processor.h
++++ b/xen/include/asm-arm/processor.h
+@@ -58,6 +58,7 @@
+ #define ARM_CPU_PART_CORTEX_A73     0xD09
+ #define ARM_CPU_PART_CORTEX_A75     0xD0A
+ #define ARM_CPU_PART_CORTEX_A76     0xD0B
++#define ARM_CPU_PART_NEOVERSE_N1    0xD0C
+ 
+ #define MIDR_CORTEX_A12 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A12)
+ #define MIDR_CORTEX_A17 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A17)
+@@ -68,6 +69,7 @@
+ #define MIDR_CORTEX_A73 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A73)
+ #define MIDR_CORTEX_A75 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A75)
+ #define MIDR_CORTEX_A76 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A76)
++#define MIDR_NEOVERSE_N1 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N1)
+ 
+ /* MPIDR Multiprocessor Affinity Register */
+ #define _MPIDR_UP           (30)
+-- 
+2.7.4
+
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
new file mode 100644
index 0000000..0ac4049
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch
@@ -0,0 +1,42 @@
+From 858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c Mon Sep 17 00:00:00 2001
+Message-Id: <858c0be8c2fa4125a0fa0acaa03ae730e5c7cb3c.1602684183.git.diego.sueiro@arm.com>
+From: Bertrand Marquis <bertrand.marquis@arm.com>
+Date: Tue, 18 Aug 2020 14:47:39 +0100
+Subject: [PATCH] xen/arm: Enable CPU Erratum 1165522 for Neoverse
+
+Enable CPU erratum of Speculative AT on the Neoverse N1 processor
+versions r0p0 to r2p0.
+Also Fix Cortex A76 Erratum string which had a wrong errata number.
+
+Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Julien Grall <jgrall@amazon.com>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ xen/arch/arm/cpuerrata.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
+index 0248893..6c09017 100644
+--- a/xen/arch/arm/cpuerrata.c
++++ b/xen/arch/arm/cpuerrata.c
+@@ -477,8 +477,14 @@ static const struct arm_cpu_capabilities arm_errata[] = {
+     },
+ #endif
+     {
++        /* Neoverse r0p0 - r2p0 */
++        .desc = "ARM erratum 1165522",
++        .capability = ARM64_WORKAROUND_AT_SPECULATE,
++        MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 2 << MIDR_VARIANT_SHIFT),
++    },
++    {
+         /* Cortex-A76 r0p0 - r2p0 */
+-        .desc = "ARM erratum 116522",
++        .desc = "ARM erratum 1165522",
+         .capability = ARM64_WORKAROUND_AT_SPECULATE,
+         MIDR_RANGE(MIDR_CORTEX_A76, 0, 2 << MIDR_VARIANT_SHIFT),
+     },
+-- 
+2.7.4
+
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
new file mode 100644
index 0000000..24b52f0
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch
@@ -0,0 +1,35 @@
+From 1814a626fb5811184eda64fe22f0055df4600211 Mon Sep 17 00:00:00 2001
+Message-Id: <1814a626fb5811184eda64fe22f0055df4600211.1602684203.git.diego.sueiro@arm.com>
+From: Julien Grall <jgrall@amazon.com>
+Date: Tue, 25 Aug 2020 18:38:10 +0100
+Subject: [PATCH] xen/arm: Update silicon-errata.txt with the Neovers AT
+ erratum
+
+Commit 858c0be8c2fa "xen/arm: Enable CPU Erratum 1165522 for Neoverse"
+added a new erratum but forgot to update silicon-errata.txt.
+
+Update the file accordingly to keep track of errata workaround in Xen.
+
+Signed-off-by: Julien Grall <jgrall@amazon.com>
+Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Stefano Stabellini <sstabellini@kernel.org>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ docs/misc/arm/silicon-errata.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
+index 11e5a9d..e15d092 100644
+--- a/docs/misc/arm/silicon-errata.txt
++++ b/docs/misc/arm/silicon-errata.txt
+@@ -51,4 +51,5 @@ stable hypervisors.
+ | ARM            | Cortex-A57      | #1319537        | N/A                     |
+ | ARM            | Cortex-A72      | #1319367        | N/A                     |
+ | ARM            | Cortex-A76      | #1165522        | N/A                     |
++| ARM            | Neoverse-N1     | #1165522        | N/A
+ | ARM            | MMU-500         | #842869         | N/A                     |
+-- 
+2.7.4
+
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
new file mode 100644
index 0000000..673c63a
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch
@@ -0,0 +1,51 @@
+From 968bb86d04913f52d7678a842474f2a674a8b23e Mon Sep 17 00:00:00 2001
+Message-Id: <968bb86d04913f52d7678a842474f2a674a8b23e.1602683678.git.diego.sueiro@arm.com>
+From: Wei Chen <wei.chen@arm.com>
+Date: Fri, 28 Aug 2020 02:34:03 +0000
+Subject: [PATCH] xen/arm: Missing N1/A76/A75 FP registers in vCPU context
+ switch
+
+Xen has cpu_has_fp/cpu_has_simd to detect whether the CPU supports
+FP/SIMD or not. But currently, these two MACROs only consider value 0
+of ID_AA64PFR0_EL1.FP/SIMD as FP/SIMD features enabled. But for CPUs
+that support FP/SIMD and half-precision floating-point arithmetic, the
+ID_AA64PFR0_EL1.FP/SIMD are 1 (see Arm ARM DDI0487F.b, D13.2.64).
+For these CPUs, xen will treat them as no FP/SIMD support, the
+vfp_save/restore_state will not take effect.
+
+From the TRM documents of Cortex-A75/A76/N1, we know these CPUs support
+basic Advanced SIMD/FP and half-precision floating-point arithmetic. In
+this case, on N1/A76/A75 platforms, Xen will always miss the floating
+pointer registers save/restore. If different vCPUs are running on the
+same pCPU, the floating pointer registers will be corrupted randomly.
+
+This patch fixes Xen on these new cores.
+
+Signed-off-by: Wei Chen <wei.chen@arm.com>
+Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Reviewed-by: Julien Grall <jgrall@amazon.com>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ xen/include/asm-arm/cpufeature.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
+index 674beb0..10878ea 100644
+--- a/xen/include/asm-arm/cpufeature.h
++++ b/xen/include/asm-arm/cpufeature.h
+@@ -13,8 +13,8 @@
+ #define cpu_has_el2_64    (boot_cpu_feature64(el2) >= 1)
+ #define cpu_has_el3_32    (boot_cpu_feature64(el3) == 2)
+ #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
+-#define cpu_has_fp        (boot_cpu_feature64(fp) == 0)
+-#define cpu_has_simd      (boot_cpu_feature64(simd) == 0)
++#define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
++#define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
+ #define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
new file mode 100644
index 0000000..3679ead
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-4.14/0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch
@@ -0,0 +1,51 @@
+From f4c1a541fa351e4f613471bbf397931f9e1ddd27 Mon Sep 17 00:00:00 2001
+Message-Id: <f4c1a541fa351e4f613471bbf397931f9e1ddd27.1602683707.git.diego.sueiro@arm.com>
+From: Wei Chen <wei.chen@arm.com>
+Date: Fri, 28 Aug 2020 02:34:04 +0000
+Subject: [PATCH] xen/arm: Throw messages for unknown FP/SIMD implement ID
+
+Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
+FP/SIMD implementations. Currently, we exactly know the meaning of
+0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
+features presented. If there is a value 0x2 bumped in the future,
+Xen behaviors for value <= 0x1 can also take effect. But what Xen
+done for value <= 0x1 may not always cover new value 0x2 required.
+We throw these messages to break the silence when Xen detected
+unknown FP/SIMD IDs to notice user to check.
+
+Signed-off-by: Wei Chen <wei.chen@arm.com>
+Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Julien Grall <jgrall@amazon.com>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ xen/arch/arm/setup.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
+index 7968cee..f16b33f 100644
+--- a/xen/arch/arm/setup.c
++++ b/xen/arch/arm/setup.c
+@@ -133,6 +133,18 @@ static void __init processor_id(void)
+            cpu_has_simd ? " AdvancedSIMD" : "",
+            cpu_has_gicv3 ? " GICv3-SysReg" : "");
+ 
++    /* Warn user if we find unknown floating-point features */
++    if ( cpu_has_fp && (boot_cpu_feature64(fp) >= 2) )
++        printk(XENLOG_WARNING "WARNING: Unknown Floating-point ID:%d, "
++               "this may result in corruption on the platform\n",
++               boot_cpu_feature64(fp));
++
++    /* Warn user if we find unknown AdvancedSIMD features */
++    if ( cpu_has_simd && (boot_cpu_feature64(simd) >= 2) )
++        printk(XENLOG_WARNING "WARNING: Unknown AdvancedSIMD ID:%d, "
++               "this may result in corruption on the platform\n",
++               boot_cpu_feature64(simd));
++
+     printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
+            boot_cpu_data.dbg64.bits[0], boot_cpu_data.dbg64.bits[1]);
+     printk("  Auxiliary Features: %016"PRIx64" %016"PRIx64"\n",
+-- 
+2.7.4
+
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
new file mode 100644
index 0000000..bc3b60d
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_4.14.bbappend
@@ -0,0 +1,9 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
+
+SRC_URI += " \
+    file://0001-arm-Add-Neoverse-N1-processor-identification.patch \
+    file://0002-xen-arm-Enable-CPU-Erratum-1165522-for-Neoverse.patch \
+    file://0003-xen-arm-Update-silicon-errata.txt-with-the-Neovers-A.patch \
+    file://0004-xen-arm-Missing-N1-A76-A75-FP-registers-in-vCPU-cont.patch \
+    file://0005-xen-arm-Throw-messages-for-unknown-FP-SIMD-implement.patch \
+    "
-- 
2.7.4

