Return-Path: <ben.horgan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02258C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 16:51:58 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.58])
 by mx.groups.io with SMTP id smtpd.web12.305.1643907116462187346
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Feb 2022 08:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=4gv1LIdL;
 spf=pass (domain: arm.com, ip: 40.107.5.58, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JTrUDjEoHM65mLc0HU6K+sPrtPS8perchD+utzpSnI=;
 b=4gv1LIdLVhTH8CJGcr7IFivky1ftW/Rpa3AVSsV00OhYXqfBeqSWkMBrrQ6ykQ78zzaZIK/me6laoCyxgaZWueAcCt5G1fVEsofJFfUqW7Ydh83tjPZizTk5p8U90rQhy7UZQhdabj5ebNTF/Bi5GhGvYpB8V7lK+QjsvdmDvNA=
Received: from DU2PR04CA0264.eurprd04.prod.outlook.com (2603:10a6:10:28e::29)
 by DB9PR08MB6444.eurprd08.prod.outlook.com (2603:10a6:10:23c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 16:51:53 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::51) by DU2PR04CA0264.outlook.office365.com
 (2603:10a6:10:28e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22 via Frontend
 Transport; Thu, 3 Feb 2022 16:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 16:51:53 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 03 Feb 2022 16:51:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59ca4bf39572de3d
X-CR-MTA-TID: 64aa7808
Received: from 844974ead7cd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EFCC0BD0-6FF8-4D14-A3AE-A0807DD0C411.1;
	Thu, 03 Feb 2022 16:51:47 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 844974ead7cd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Feb 2022 16:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9AePDQV69GztAIUrdgXBf/1HyZMwTfL8GYEuyQmZ3zG5yfBBuW7bxSzNRbiMpTH1MhoLUaNRIwRSt0OHjWT4XlSPx14GRwrZp+yU8Hx99XIMn/wox5L7/HuHleRHFEFgBQlwgJRPzd3O3v5RGHifmfPmexwezXvxY/e/55mIMiX4Y/aqMNdgrhEExLpaUK9eti99r8xWaOClIZQbYnEyKr2iNN8oFAQPXZG8brGUI9NCCqQzKGQi3MY/FJrHOXot1bHgmSDcKYViuPZF6Hfupk/+n2fnxs3rVLfcJyXkTwzEnHYZaO1r/u1SZv2QoblZTo/J+rXAKQixmehpoKDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JTrUDjEoHM65mLc0HU6K+sPrtPS8perchD+utzpSnI=;
 b=HYRycBg8stJ7cW81778JSlnEkgSRKnk88Ep4Lv/sgB2gWkYE1XurU6aSUgMygIeRR/lrbTahQmSD0Ia9Plvc3qRNunKSK93Jg+RBAbr7FsWwTXeHiQoNcxQzg6xQgjaYQkkUSxZ6i3cy8wv7cDRvilI6LlzdNB3EpURSXWlkpxVpW1JCFTBsD19pVOkjkrJg3ptb5InYnxxJ1df8hoXZW5BWZXUGHMhaAQWQQVAwXQEj8XhrZW1mgI8OUcjVmSMOZ6b7Q1m2AIHjjYT+rvSjPJ9KkmBZJTfXLV1DHZD3N9WiSxIqgVZYY+F5M4Xk9pov7X82t66Vnk9TVS2meG57cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JTrUDjEoHM65mLc0HU6K+sPrtPS8perchD+utzpSnI=;
 b=4gv1LIdLVhTH8CJGcr7IFivky1ftW/Rpa3AVSsV00OhYXqfBeqSWkMBrrQ6ykQ78zzaZIK/me6laoCyxgaZWueAcCt5G1fVEsofJFfUqW7Ydh83tjPZizTk5p8U90rQhy7UZQhdabj5ebNTF/Bi5GhGvYpB8V7lK+QjsvdmDvNA=
Received: from AM0PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:208:122::30)
 by PA4PR08MB7388.eurprd08.prod.outlook.com (2603:10a6:102:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 3 Feb
 2022 16:51:45 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:122:cafe::3) by AM0PR04CA0017.outlook.office365.com
 (2603:10a6:208:122::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Thu, 3 Feb 2022 16:51:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 16:51:45 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 3 Feb
 2022 16:51:45 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 3
 Feb 2022 16:51:42 +0000
Received: from android-wfh-server-benhor01.stack04.eu02.mi.arm.com
 (10.58.246.229) by mail.arm.com (10.251.24.31) with Microsoft SMTP Server id
 15.1.2308.20 via Frontend Transport; Thu, 3 Feb 2022 16:51:45 +0000
From: Ben Horgan <ben.horgan@arm.com>
To: <meta-arm@lists.yoctoproject.org>
CC: Ben Horgan <ben.horgan@arm.com>
Subject: [meta-arm][PATCH] arm-bsp/optee-test: tc: Limit xtest to a single
 thread
Date: Thu, 3 Feb 2022 16:51:35 +0000
Message-ID: <20220203165135.26872-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 63c7c75c-5edf-488b-fe33-08d9e7357b3b
X-MS-TrafficTypeDiagnostic: 
	PA4PR08MB7388:EE_|DB5EUR03FT034:EE_|DB9PR08MB6444:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB6444F761BCD7AA9D9FC5848E91289@DB9PR08MB6444.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K1tgCThs/3i6QMH4DIbiMrnncRxkBIZRaTwjKT9V3GSUrKUwpLaF654EgY3s3ct5fFGTOjrd0sMALNVcZjjataO43YhHsJxK2GS2jM5xQaEvnE2SeXPWAyDsrfIYiNe94VnLJEKNyTwy6KzdJGoA3E80bhPWZju7SubP1sJNlUYXbDeK9CsnymwPhKVLpz0g6t/l0TN7OUPLWtppGrD80gn5xpj76BJWIQVDeydjOIduOo4rFpKiR4NKvxgtlslB0hmhpbYxywmxRtwrymhksr8ThVNUxkdXvtjN5QzBYmmuAgegU314MBINbvqWXHk5J7WKulOTjHNXCFH3SeMxV2JdmFiJIyGxhziS1NUMq7Inmnul2wtvL9xsLZFt8of2TUWRF6h8ic40O4Kqci5Pt3OxQDo+UDcKBbA55X1Xjbwnw0+yWkRq9esN6JuX1JqLVWhMUSf0PD4V89nMxpiJiWraz2PK11PnlaC+xNt6xiYcs6aacvccs4Y2MntUN8bDF5f9ZrYEjXSkUw5Y2EaWemuEbAQQ4/WrBnsq1wdmUmsqNXpXPBJKuvyOMN99yVXOvkq/mdSdQ1CdiFS1ooJMihznDNnGsrvNJmtY/gSwC5xgXtj/oUGNIagGhEvn2190ovoMuTyRCr51Mncg+rTM6Y4v3miYXqviQWKJJLFijKfxP58jMxeRiAaFjkHMi8PGrfkyI4m8O0PRAX5+yxJm9Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400004)(426003)(336012)(47076005)(508600001)(6916009)(83380400001)(186003)(1076003)(7696005)(2616005)(6666004)(4326008)(86362001)(70586007)(316002)(44832011)(70206006)(36860700001)(8676002)(36756003)(40460700003)(26005)(2906002)(81166007)(356005)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7388
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	874d8c24-16eb-4efd-722c-08d9e735762a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w8yZSdBLbq8mmvJor/O2C8Q44du9UgjDCCLDS+Yykvvw4z9DFitlwI4dIxD7ECinew0IqzUwYCNOROAkmDvc6+zj+FeSZ9gG8NjONYbiET6XHnpkUsxLtqtUxYyNx3oyizCxrVi8XBD9w7IAu7RehehX2c3VVLQA8y/LJ1Bm6rAjLV8vOs6w4+lMEZvQYSiXdo1Ovcl684ZwPYUNWhYjdnWeH1TMz+rkck+LuxOyvXnZP7Mb260GZ5lsRgBmrsXrB1PU+1nDnzLNlONUAWR6MMYzgInV+3XsO0S92J/esGLeUwRE9yX867XVX5W77L20VUA2QYQUQkg8hffZoKo9vripMRx2L7e5uNBTpxEepR7E8xguhrWT6foDiRv0LlXDFYJElfjNulWRK8qCYfz22ongOLakQjDXyzNvn2z3V+4mufYdrYEXzgo1QVBGOo/tCE6eTD4yMkOU2kIbnbZDUBdT2rUCDvJBFCa6OTAWH8R9GoJ2fPjXjMb6tp/zfZMvo4OliAsUNqpH7iQHGW+duKZJq3ynzvbql+ZPfELBjjuRqzt197EfJyZdFx2AJARWTrjIHNsz17+u3b2lpaUqshTpD0hf3Y0/u76EZUGQzTRMrJRMwKuayFZssGF//pd/KceD8RG/uKOljbLvlP/eZmgyYZzHy/v/ielraUtBfK2h0jkalnin2ni2CZUfiSq7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6666004)(82310400004)(47076005)(36860700001)(86362001)(83380400001)(70206006)(316002)(6916009)(508600001)(81166007)(4326008)(8676002)(70586007)(40460700003)(8936002)(2616005)(2906002)(44832011)(5660300002)(36756003)(186003)(336012)(426003)(1076003)(26005)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 16:51:53.6448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63c7c75c-5edf-488b-fe33-08d9e7357b3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6444
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Feb 2022 16:51:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2946

When multiple threads are allowed xtest will fail and
leave the system in a bad state after repeated runs.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Change-Id: I16f07df1a362540560975deaa5a291a68c332bfb
---
 ...xtest-Limit-tests-to-a-single-thread.patch | 55 +++++++++++++++++++
 .../recipes-security/optee/optee-test-tc.inc  |  7 ++-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch b/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch
new file mode 100644
index 0000000..370a81c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-test/tc/0001-xtest-Limit-tests-to-a-single-thread.patch
@@ -0,0 +1,55 @@
+From 73bef38c5697cd6bd3ddbe9046681087f4f6454e Mon Sep 17 00:00:00 2001
+From: Ben Horgan <ben.horgan@arm.com>
+Date: Thu, 27 Jan 2022 10:33:04 +0000
+Subject: [PATCH] xtest: Limit tests to a single thread
+
+Signed-off-by: Ben Horgan <ben.horgan@arm.com>
+Upstream-Status: Inappropriate [Workaround for intermittent failures]
+---
+ host/xtest/regression_1000.c | 2 +-
+ host/xtest/regression_2000.c | 2 +-
+ host/xtest/regression_6000.c | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/host/xtest/regression_1000.c b/host/xtest/regression_1000.c
+index 9ee9d02..82d1def 100644
+--- a/host/xtest/regression_1000.c
++++ b/host/xtest/regression_1000.c
+@@ -1080,7 +1080,7 @@ static void *test_1013_thread(void *arg)
+ 	return NULL;
+ }
+ 
+-#define NUM_THREADS 3
++#define NUM_THREADS 1
+ 
+ static void xtest_tee_test_1013_single(ADBG_Case_t *c, double *mean_concurrency,
+ 				       const TEEC_UUID *uuid)
+diff --git a/host/xtest/regression_2000.c b/host/xtest/regression_2000.c
+index 0591a42..a9f4b95 100644
+--- a/host/xtest/regression_2000.c
++++ b/host/xtest/regression_2000.c
+@@ -499,7 +499,7 @@ out:
+ 	return NULL;
+ }
+ 
+-#define NUM_THREADS	3
++#define NUM_THREADS	1
+ 
+ static void xtest_tee_test_2002(ADBG_Case_t *c)
+ {
+diff --git a/host/xtest/regression_6000.c b/host/xtest/regression_6000.c
+index ca1c254..d67ea7f 100644
+--- a/host/xtest/regression_6000.c
++++ b/host/xtest/regression_6000.c
+@@ -1568,7 +1568,7 @@ exit:
+ }
+ 
+ 
+-#define NUM_THREADS 4
++#define NUM_THREADS 1
+ static void xtest_tee_test_6016_loop(ADBG_Case_t *c, uint32_t storage_id)
+ {
+ 	struct test_6016_thread_arg arg[NUM_THREADS] = { };
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
index 62fa0a0..af73675 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-test-tc.inc
@@ -1,3 +1,8 @@
-# TC0 specific configuration
+# TC specific configuration
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-test/tc:"
+SRC_URI:append:tc = " \
+    file://0001-xtest-Limit-tests-to-a-single-thread.patch \
+    "
 
 COMPATIBLE_MACHINE = "(tc?)"
-- 
2.17.1


