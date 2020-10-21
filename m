Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web11.13052.1603291886230531249
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 07:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rMVX920s;
 spf=pass (domain: arm.com, ip: 40.107.8.50, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emy8T+ZFpyoCkJbER7xQ0IbXSooER38FUiNlbKTCSDo=;
 b=rMVX920soy/1lu6ylw3fbjWNPvsQbc+WV8qd/HDrVqMgqqtEtzBT3KBSxSivqtfVdoJi+WT30eqzCwibOHJ6Dv2oWX/x3fl+0eI9eLIVNVUJpbmkNf5iXvLvrJrmUszTMLDgG/UDki4FimNH6R/o9APqCtYZpGdApAWLTKzVMgc=
Received: from AM6P192CA0087.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::28)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 21 Oct
 2020 14:51:23 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::c4) by AM6P192CA0087.outlook.office365.com
 (2603:10a6:209:8d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 21 Oct 2020 14:51:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 14:51:22 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Wed, 21 Oct 2020 14:51:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 008b1b92561b0c58
X-CR-MTA-TID: 64aa7808
Received: from be54c6b439ff.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0F0FCB28-CDDD-4B5E-8C13-224940077AB4.1;
	Wed, 21 Oct 2020 14:51:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be54c6b439ff.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Oct 2020 14:51:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oddYFbqc6YhjHPw0Cym0jNFoHTeHztlrCQSSzVRxObuWN1KCz1qA0NHBlePm60nFRkb5IzSmZik5G13HhLOSar5oLV1JwQjUdTZv29s4qWnD0dWT4V8npXvpyJGKbX1mFOJ/4Bk7O17YxnfuAIQy1RsWfUPNAuTwhxZk89eddeyrrudpcCoR7CNHG2TDYvzzvJIIYeMKw7MIkuu/bOmLeQIpX2p2YXk/ynb9B5MP1UK02cJxVsVu3jdyDrToviW5xpfL8YA0aobae7dWb0EDSx8aP3DgohWlS80mFq6q948c3BeYj37l4FbsIPZtJMTOMEB5kRlOZdfDh5M9J3Sr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emy8T+ZFpyoCkJbER7xQ0IbXSooER38FUiNlbKTCSDo=;
 b=WH3ASX+FYcl0Lbwxhvh220pRHs6+9+8rok2oeQz+RpNEWqfxNebMGWvkKPbvtG5nQDMDR1eEXrO9df4C9wva1gU7BIMV9l5iZyYoy+P4JpPH8Lq4Hpo2DGeIoFwfej8vmHNKiusdlivphbyIbZ0r1V3Bv4S3wwoRMTvo2SytjHHBao9/Mlw9V5vU8piE/sLjL6F/HPwXbuZFrIBaC78QmjfsjSqdD79rdHs0i0uHCKcpjlUhi9DlWXpqio8CAUdnAMWEdUyaam1rHBwvjtToWcHIhfTbf/C+ImNk9fdOUwOhsPjiAO3p4x/7DJ/OlyhuwQm5zXe82NQuKI52QjyCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Emy8T+ZFpyoCkJbER7xQ0IbXSooER38FUiNlbKTCSDo=;
 b=rMVX920soy/1lu6ylw3fbjWNPvsQbc+WV8qd/HDrVqMgqqtEtzBT3KBSxSivqtfVdoJi+WT30eqzCwibOHJ6Dv2oWX/x3fl+0eI9eLIVNVUJpbmkNf5iXvLvrJrmUszTMLDgG/UDki4FimNH6R/o9APqCtYZpGdApAWLTKzVMgc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 14:51:14 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 14:51:14 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/2] arm-autonomy/xen: Backport improvements to xen 4.14
Date: Wed, 21 Oct 2020 15:51:08 +0100
Message-Id: <a151eaf39d450b9461ea9d259206956bd5a9fd49.1603291792.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::23) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0275.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 14:51:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03096255-c08e-4116-a877-08d875d0c75a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6182:|AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB5333D9DD7EB84C4F96FCCD00921C0@AM7PR08MB5333.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YBtEe2rDLE4kCBCWj2yZe23R4DAWbwff6KLGfd8j1k/+RC0ciBWg554Vwm0EThd3wl0SVhBX0rRQrwILL3scK2X6tpKeKVw1LA8JblO1JBx2Nsz6x0O7pdwFXPnAg0HM998ShEWnpd+Bjwxv9Pck20DldedcxwuPR8ZejcE/eMx/yU1YvqVe9/PSuy7VO0SIpBb6Pxu8o9y3VgW02O7cCANJxqAHxs3Cuzi7Y+TZgd727oCHD7N/nGTmlXss+DdZBWMZ+f4TRcvZtD8aJPMgJIdSbKcDiFY/g0wT4y2HI6eUf1yfy9ItWgI1qkL0OO4TLa/jQsQ6UP0o2KjcEkxV5Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(8936002)(6486002)(19627235002)(2906002)(4326008)(478600001)(186003)(86362001)(83380400001)(16526019)(36756003)(316002)(26005)(8676002)(6916009)(30864003)(956004)(44832011)(6666004)(66556008)(66946007)(66476007)(5660300002)(52116002)(2616005)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 CMQY1YARtKx3aQbhJnQsiopxSvT6sygbupORZA8pzqD3b0aE967Av8h1HleKoP17N4LGRbrNtVgB1y6LAywYVUWsS/auCAdclqzgoNAhSXlOgSTkOqcIV12t1I2w7R+djTNe26K5XZRg8bXGrcsebcy8IfTB43dFmMx+1oiMWiqIXM1f15XbS/rYK8lmkg8Hag34EDcR21ZgyUZH3huzE1t3BzWfj1684mnB6+o9B34QVcmiI5ivTVjkxnCzVLEA0ikpYUsyJ6xpGUz6JZDqRLQ/CIoV0w2eAp3cKl3Op9TMui3vVPEX4vw5fC3rZJFCcFZ8vJpK+px/b2JRZXCskdVRAW5uzA0mzb6JpTAOHBhkbZPDDZRF/6uTvEgnulp4nn2rmNyfOSRt6KYiar8lw1eZT9wITGHSZxZJOE5NCBMfjpt8EreEorX56xqaLYizCFMNBNeLYP0nm/yD1AqfoXZqvSrRPrWzbeDA/tXMGS81Dc6DK35ZQsReB0h63GJOoTbrVsUZTx+ff0WRHm5KvOXRLQ3jXJ9722eg52QyoncakliJbBxM1oL/bILDB5VnLmHov3BJGCHaNYmsUnS3XIP5eGyZvhCCaRgFN5utb5cW5uog1n1TvWwdpz+opEMQRO0TvvWIXxS0yKAw+MhLxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e1df8ae4-5f82-453a-1c9e-08d875d0c20f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v/eVMVteG/yseAHMslDrgCFWOr115Za4caV7gyKiwv1vKslkUTpejydm0Et1fRlZrbEdgvthmAL3r9YG8iER0aW/0yOP+2pUIBT38tJ8fM09MdHmzARvUS6siZEYD57LnOUdJhg0NIdQBB6gKry1oQKRUN20TbE00vk7zNRujmsjtWoIW5UKKsqK+opJxxYv6pAxAWzmeFujsM/koO37wgYklVBEjSQYBH5FMLMTIzezwdvTTlJpKSVKRgg1vrMpweILS6BRhDHE7wVLii/lnt3slraackjaMCtKIo72N7Lhlk8e1xoMy962oATr6UyvOE81qoBZw68NQ3u0rCceXQNE8bueyP1y1hITtfE1lqMC15QWSrfwSm35Nh6pRtclQhOu+aS2qzdoEfylPD0qSA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(70586007)(6666004)(16526019)(8676002)(2616005)(956004)(4326008)(70206006)(186003)(478600001)(30864003)(47076004)(8936002)(6916009)(36906005)(82310400003)(82740400003)(316002)(83380400001)(6486002)(19627235002)(7696005)(36756003)(2906002)(86362001)(336012)(356005)(5660300002)(44832011)(26005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 14:51:22.9610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03096255-c08e-4116-a877-08d875d0c75a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
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
index 0000000..d50e77e
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
+Upstream-Status: backport
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
index 0000000..2793b60
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
+Upstream-Status: backport
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
index 0000000..4fedf5a
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
+Upstream-Status: backport
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
index 0000000..35c6e3e
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
+Upstream-Status: backport
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
index 0000000..fdd5feb
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
+Upstream-Status: backport
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

