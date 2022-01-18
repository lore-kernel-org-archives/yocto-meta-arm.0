Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C06C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 17:04:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web12.15354.1642525469125125548
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 09:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=lsJf3Kyz;
 spf=pass (domain: arm.com, ip: 40.107.21.68,
 mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm8NFR4YD6O+2DOTG7fHSpaI6a+zD3ggH1HwZ8vsDWY=;
 b=lsJf3Kyz51n8QEzp5MAFI1ILVIG8moL0B9O5SkyZLRF5K9apRnWGD87oQ5KiTV0WSxx9ITRnCLScb6zJ9CS8dRcSDnUV6O5qS0qIpQZQAYRnN2pjUKN0qlTZuH8oapE1UbRIFMdsqhBK3CGnuba2Iea/NgHYOUzuzgKHDVjrIqk=
Received: from DB8PR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:a0::48)
 by PAXPR08MB6687.eurprd08.prod.outlook.com (2603:10a6:102:132::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 17:04:12 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::96) by DB8PR09CA0035.outlook.office365.com
 (2603:10a6:10:a0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 17:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 17:04:11 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Tue, 18 Jan 2022 17:04:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48e53392789fcc5c
X-CR-MTA-TID: 64aa7808
Received: from 678618884cec.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E477CB3D-6DB9-4B8C-8192-5DDC2F501065.1;
	Tue, 18 Jan 2022 17:04:04 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 678618884cec.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jan 2022 17:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVvXzllSGgxOiaGpOV6xe2+n8lk/PfAlJ7kHZlzqWMEPSM8a5DbWJ6DSXxGLHHXwR2or/HdVsRjjRwSm41BTTfcf6Cz8oM4dVyYt+l4Ez/XbXJx28a+8lawcEc9LomqXx0s5Xky0Az2DcplNJxfoTexpB4t7LDWl+b14+GTTkoNCB8xwx92o+GyGnSYp54Iq5rKK6yw4H4r1rBhs+qy4AmcNtalPzijmo1PbW9xpzw/ohRcsfPiuTYYrUSh7ziNMdiH+ldZxIaUMSZ1OL8DIos9GxV5wbq8srWN28Jcd+mmQxWMXHpkJMiV0+5+AxV2Pd5tIw2Afhsu4iNW6hbXUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fm8NFR4YD6O+2DOTG7fHSpaI6a+zD3ggH1HwZ8vsDWY=;
 b=SUB/4dZRvloIHY7YqR4oZPXWEGoWGAX2C79RojFT7m5jW8pCRJcawAsyXX7I7MkllijphwwCcrKL9ZA1180aH2dWyo/BAWFoEAsu5T4gIXhbrA/2geifFow2RD4IT709HVrV/w2I9RKdkjbJS1YxcV+0oFm49sTsDDOBmp47mTfD/nqtl/kMV3ddU0RK1TB3bL8LOyFjU0fVbvsE/e7tPUxwgp45IhXiXKiJ8I4ppf14BzG/du9Y6SeeyscFwKnKwKSmq5HK9b5Fvv8eNlc6pLPc7jtgciFLTuD19dFTsWH40/YEjVMF3SOr3JOoWvepSAZ6yPuquAzMyf1uue9kAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm8NFR4YD6O+2DOTG7fHSpaI6a+zD3ggH1HwZ8vsDWY=;
 b=lsJf3Kyz51n8QEzp5MAFI1ILVIG8moL0B9O5SkyZLRF5K9apRnWGD87oQ5KiTV0WSxx9ITRnCLScb6zJ9CS8dRcSDnUV6O5qS0qIpQZQAYRnN2pjUKN0qlTZuH8oapE1UbRIFMdsqhBK3CGnuba2Iea/NgHYOUzuzgKHDVjrIqk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by AM5PR0802MB2596.eurprd08.prod.outlook.com (2603:10a6:203:98::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 17:04:03 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::8126:bcfb:4535:3450]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::8126:bcfb:4535:3450%4]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 17:04:03 +0000
From: Anders Dellien <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2 2/3] arm-toolchain: Support linux-arm64-ack build with
 Android Clang
Date: Tue, 18 Jan 2022 17:03:49 +0000
Message-Id: <20220118170350.23361-2-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220118170350.23361-1-anders.dellien@arm.com>
References: <20220118170350.23361-1-anders.dellien@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c703483c-d502-43bf-b754-08d9daa48c83
X-MS-TrafficTypeDiagnostic: 
	AM5PR0802MB2596:EE_|DB5EUR03FT030:EE_|PAXPR08MB6687:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6687F7531440B28E3157903C89589@PAXPR08MB6687.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SEGkJFWwLfCphzqL3Qf18LtVxkojsDuAbabhTXikvw00IxVlwNmQhmk0hYjNf74KpaitYyuBRkDeqmCadCyzKWYy8xmZc3Hzw8LFhu4KLW6RH+m6ooO0cygGZi+8LajqvF8n21tOyuofuckZj3cIfA0MJoCjArLwEhB4crRgK3bMLbB1Ft0uFrqw8WjMSTjznv5dttIjG61Sg06B39zvb5YvUUxoKgs2DhxEmm/mr7HoChRE2Sfvg1GT5oQKnbwjqiFLwHEZF64rDsGEHXuo4aoYqwWKtMlMKAwJcfbLovp1E4bK/OrG343KdGndo8AOIBASWc3aQ6WPxHiEZbZVchZaemxhcs+bf5IYF3I83gSKqz3ZTdyj1nEe7vANmO3nbUHyARGuNvJ17nvX10hvcdhQctPZnzUNFE94ZFWWXXnsfJj+wto+4cUFreXCe3OsP4HuoVVf8AjuRvsLa3ruhAOpkIT1T5oQoeFjjuKRgEOqbF5Slv1Mg0JdEItpz9a41z08fSaUKVVOz5VbxsqsOxnU5ZNrZIwRjSOwl3ic87EY8GCTWC//9JmUKN35+YaL8UXapKk9rVRArfeNfNN0UltmMzGGTFxQRCGHAMjU/rOsZlo8GostU9BRBfymodmSG9DO0k8oIOR71AyIJ9gNWKoXEEub5G7M1MRePS4x95f/xEh1zqVr59HJxwdkosifF96ROdVw5cIw8BY+nZPChg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(2906002)(186003)(52116002)(316002)(1076003)(6916009)(5660300002)(508600001)(36756003)(8676002)(8936002)(6666004)(26005)(86362001)(66946007)(66476007)(66556008)(4326008)(2616005)(6512007)(44832011)(38100700002)(6486002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	87de1e98-ec0a-47ca-f819-08d9daa48734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tOIYDnWsHMNbyD1mP5ShIDBn5EFPt2C2Q/o8yD0CPAoVlkljj90JAE0aBT5QTnPNeI43TKjAX6SbmvOpj/E0Pnfr/g+WQNnP6i0qcTXwgw0V3k0sw7HGKd1A/zSkVjhUTa0IxpJDaMzx9GxLcB+u16aRJhpxWOX72k2jYuGIFx07a5hVFaA9UszSuJr24D0hGafKQ1lgARwqt6WTvzUlOsjjqvdFDFh3b3GQYPPchz4BjZExvIj74iosdVEePy000KOOW61O0KeSpmT5spPpUAGI2cqrq2BiEAtZAlEpfdx2FZf75GorrsDMkjgyHqC9i+z7DloweIBspUie1ADXFh0setEqL6ud68obk3Wt/tIEtVBWyzXEKXYGoKuRSwageQlYZjUBlKDYmSiw/OMsLUwIbyY4+cOGtfPoI+Mfhu5zN7GHEtJrUqfa7rxFCn54KMkywyapMi05rBRWJxixDz3IqDGtc9Pj/OzUunT7JKNiy19rq32YC8CzKRML+9zYH/tg3EXYKjrJ97NmkHDe5utfYwk0FQhIolmNLPSpau0UfOFmHe7MJw2HqqVSF5Y/wmaXGgtdOzFYDo+36/06wnSNCGSJIfGl9rz6i/MWr1KiXBz4rUN3nvAI8tZz3ca488d4XfjNJ9LDgnPa8JwIpWxgA68F9/XDMF4BnCleSntaOWdAkQcywEF5SYpCgAUFzvczO+4ugLpViWALkZnNNQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6506007)(316002)(36860700001)(4326008)(6666004)(81166007)(2616005)(6916009)(336012)(2906002)(6512007)(1076003)(36756003)(70206006)(86362001)(70586007)(8676002)(82310400004)(5660300002)(356005)(47076005)(26005)(6486002)(508600001)(8936002)(186003)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 17:04:11.6413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c703483c-d502-43bf-b754-08d9daa48c83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6687
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 17:04:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2860

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


