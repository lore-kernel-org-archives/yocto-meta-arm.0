Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD11CC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 15:01:55 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web11.12325.1642431713638850946
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 07:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=3b/k9ZAp;
 spf=pass (domain: arm.com, ip: 40.107.2.43, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm8NFR4YD6O+2DOTG7fHSpaI6a+zD3ggH1HwZ8vsDWY=;
 b=3b/k9ZAp2MHxB1063uZKHcc41u1JCCHjn3YIKzpOduO9tRNCZw7rqB7M/F1eitAEZ6CYU/7m2TF5kMzeDPobsK+tv2UM1v1Kpq3vVInSKhqfDK3Tnl8RqhCrS4/yfFlbR+ZeO4eQ6SFh6nv1wMjgYXOilpx4QIPEaR0O6yVpiKE=
Received: from DB6PR0601CA0006.eurprd06.prod.outlook.com (2603:10a6:4:7b::16)
 by VI1PR08MB3632.eurprd08.prod.outlook.com (2603:10a6:803:79::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 17 Jan
 2022 15:01:50 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::89) by DB6PR0601CA0006.outlook.office365.com
 (2603:10a6:4:7b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Mon, 17 Jan 2022 15:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 15:01:49 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Mon, 17 Jan 2022 15:01:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35c6496f382579a6
X-CR-MTA-TID: 64aa7808
Received: from 18b848494729.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D7EBC6C-A8C2-4BC8-8452-858C3BB571B5.1;
	Mon, 17 Jan 2022 15:00:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 18b848494729.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Jan 2022 15:00:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gke8sQIfk39sSd8ebxP69xVPAjv854o3aWdEaR0Anb624tt5rEFZcn+d0AwKUAUaXe2P/HejnIDa91hORKwjcNz1t3dikH6aN1htoV+WgtGlcnDcsK0/WzF0Wk69u1ihy0zXe02qwcLswH/n3QZ/guPqMy6Jh6zl/YHN0vgEnTBxUaV/hj1mzvE+E5vlEywfRlzrQUEkDpF1tHJS0fJ4YVl2EL/cKaQYJd3B3GIq99qpVoFgiV4su20FngHI8XLjhEB/AUdUU4CV0WjnNi0dU5q2I6EGKGBl1TwMfO5RBy4zDklbG6YDYStnwVluuNvBc5YvN+6qVcQ6GJH8FpjXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm8NFR4YD6O+2DOTG7fHSpaI6a+zD3ggH1HwZ8vsDWY=;
 b=HCM0VuzOb0FTvP835Jas5Y7HxMv0pBrIbjos+rk25+5SudhS0aQ6BvcaujSX6JI61IGyHMWRUeoGNtuSIfwmKX8gHTe/ruBHGdjmJ+jdv9JbM1CybAhO04tlqdp/TnZku/AFl58W51TtnxPTP/OZX9JwmSLDOEoajx6V+AG/WZ714w1ndnV1Xj+VTP6jAIC13MlZhfWcbMTP2muIKtoZINmXcOJrcnwhMmTWtzKV+O+kZtCrsbfuJO5wEcamVZIhZ7g0xk8zzntSHHdt4yQ3tmSsvdqi7SpH/GX7IMzDpH659aI+V3z7jInArpkPCM2Rm4vJ/Eq9nx7R3Xqa2o6ypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm8NFR4YD6O+2DOTG7fHSpaI6a+zD3ggH1HwZ8vsDWY=;
 b=3b/k9ZAp2MHxB1063uZKHcc41u1JCCHjn3YIKzpOduO9tRNCZw7rqB7M/F1eitAEZ6CYU/7m2TF5kMzeDPobsK+tv2UM1v1Kpq3vVInSKhqfDK3Tnl8RqhCrS4/yfFlbR+ZeO4eQ6SFh6nv1wMjgYXOilpx4QIPEaR0O6yVpiKE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12)
 by DB9PR08MB6844.eurprd08.prod.outlook.com (2603:10a6:10:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Mon, 17 Jan
 2022 15:00:16 +0000
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::d1d1:2adb:bad1:bb96]) by AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::d1d1:2adb:bad1:bb96%6]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 15:00:16 +0000
From: Anders Dellien <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 2/3] arm-toolchain: Support linux-arm64-ack build with Android
 Clang
Date: Mon, 17 Jan 2022 15:00:01 +0000
Message-Id: <20220117150002.16976-2-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220117150002.16976-1-anders.dellien@arm.com>
References: <20220117150002.16976-1-anders.dellien@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::26) To AM0PR08MB5506.eurprd08.prod.outlook.com
 (2603:10a6:208:17e::12)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 258c5cc0-a0c7-404f-20ea-08d9d9ca4a12
X-MS-TrafficTypeDiagnostic: 
	DB9PR08MB6844:EE_|DB5EUR03FT013:EE_|VI1PR08MB3632:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB36324906968A39294D8BAC0F89579@VI1PR08MB3632.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w2q4+55zI3Bs5yLsBwzARF1Wdcdu9ANkz3oYKJwO9Qgayiz8/2kiGv0utwip0SIcYwPXXCfiG/0o5yJQYuoh426Ideps7UWmm+Pk8mWyQKeeLR0aImMQ01+L8eb2tdem2IYiS5jQC+GfC9Fhh7g5ntx3KbschhtC0EIDpmE8uyf16qVnNfm5XCyDPfJ51QhAyr/a/1FirBcdDnIDB6ebRIfMKcMEAHH8F1YacLXZC5roE/I4AUkotVc8DNAGzXrL/8WEilnOg14kvWBiPZkHkPpPofcxMXj4lptKMPxXF8OFDoAdpB5iqc7MlalcsfNv9RyP+Yl80aFrgZoHDSSU7cNuYxfTxaDbaPoSrYJYv30qsLpx51K7bP3ngv1xj57+WMQHk1vr0MG3umk4B16HBnnlUCLG7N6d9Pu4bbBVe+Cgnh9kMoMsNmNJ7hnP8IXLSK1l8irOVPkND/2cw4gG0j4pfLOgTee5v3wZs6FpNCC17WUPAUUwBvRsh6VXF4fZ5GCKdCvD1idgMUjHPP/m24qvy8sTamkIsI16Q19rJw4Oj91yFRnxaUClyGrK/nwfeqdwHkYBESqDzyiiSp9BRhfLhskwT0NhfaVBsZ4NU9d4yU7G2AomU9V/Ck4NvPF+i4HQVcMncPwEZ9AbEtIpxSdZeWggU7S5DUaqLly4zSRzeOwfGYHe0QSyiFHsCkPRzoqRhlJbu2Uxr37ocfYkiQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB5506.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(1076003)(36756003)(44832011)(2616005)(508600001)(6512007)(6666004)(4326008)(26005)(316002)(66946007)(6506007)(66556008)(66476007)(8936002)(52116002)(6916009)(2906002)(5660300002)(6486002)(8676002)(38100700002)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6844
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	86b7317a-16b5-49f9-c323-08d9d9ca1251
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/CvMO3NB07dwzP9Q7iVY34An8ua46qU1KmjWmRsjd1Mc1A2OyziWdcRA9nPRGkJir3XemW9sDLnUNPzo9LqcY0yzF8W+TZ295Mjd7XGfDraXibWwngDr/DUjqnnSUqdEtvWzy9OBl5uso63p3icp7jzL1DzTyUpnyCjzrTqsYNsPhUInepynndt33wv9HrYSml8swbY9xXhhAmYOUezbP/x6MK+sZK8p4cj82eWar3wyOu4V+UQI++FdRot4TVyvVzeCrOjt83gPUiFCV7suLahI1QqMo9/H+b8UnpIGHJ1pBDRcBRbcsQLV26orRBr6J/UnmBoaT+hWhCDnBcdz3WY9ttghxzgcptlXCy5qykmJhvQEjay/FNGGusSn3hKSrn0u96frCWlDmmE4g0UFZR7sKx+eHHPArbBOB3r+g+5zhzpnsocLK10g0Pc3Zm3OLgY7dmr2s3tQMhIk4bh+VMqeUcMR4ptdMmzlX7L1wWwP4eAvp3XjujiNYuMGa/5ZvVq28CKZmMsQ9CmCzzXXcDdwB5rc0V6zblIDj1uVFNRw/y/JaEQKQXkX1TMGOWR3CSsxOC9/GCZzQsVY7H8+Hs/DmrpQfXwTAzSti5m3BPCr1xu3+XYgsvUX3ySm8xhH6xr/+olDTAWA/eRCptwDtPksZU1L1jrabR/rlofot/b5h3PdM6FgJryJydsVQi25opElf4fL9LQk0SUBFWbYdg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6506007)(6512007)(47076005)(26005)(186003)(82310400004)(6916009)(44832011)(508600001)(6486002)(8936002)(2616005)(4326008)(336012)(8676002)(86362001)(70206006)(70586007)(5660300002)(81166007)(2906002)(6666004)(316002)(356005)(1076003)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 15:01:49.8959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 258c5cc0-a0c7-404f-20ea-08d9d9ca4a12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3632
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 17 Jan 2022 15:01:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2839

This commit introduces a configuration variable, LINUX_ACK_TOOLCHAIN_CLANG,
that (if set) switches the kernel build to use the Android Clang compiler

Change-Id: Iab362916159bf6e8096061f1b7281a7513001d61
---
 .../recipes-kernel/linux/linux-arm64-ack-clang.inc        | 8 ++++++++
 .../recipes-kernel/linux/linux-arm64-ack_%.bbappend       | 3 +++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_%.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc
new file mode 100644
index 00000000..c5b74634
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-clang.inc
@@ -0,0 +1,8 @@
+# Clang-specific configuration of kernel build
+
+# We need to add this dependency as the kernel configuration depends on the compiler
+do_kernel_configme[depends] += "androidclang-native:do_populate_sysroot"
+
+DEPENDS:append = " androidclang-native"
+
+KERNEL_CC = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_%.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_%.bbappend
new file mode 100644
index 00000000..301041bc
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_%.bbappend
@@ -0,0 +1,3 @@
+LINUX_ARM64_ACK_TOOLCHAIN_REQUIRE = "${@oe.utils.ifelse(d.getVar('LINUX_ACK_TOOLCHAIN_CLANG'), 'linux-arm64-ack-clang.inc', '')}"
+
+require ${LINUX_ARM64_ACK_TOOLCHAIN_REQUIRE}
-- 
2.17.1


