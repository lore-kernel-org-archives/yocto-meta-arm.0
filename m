Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.87454.1597841964407232052
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 05:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eFiOU8Im;
 spf=pass (domain: arm.com, ip: 40.107.6.51, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQi6NUg4FdvLPpq4zxtndeHIUdvTMvRSAjsu4Zlmc7s=;
 b=eFiOU8ImyBxrvwuqjtV5lpGxxS4fSZRjrjHWEAZ9tvDcweLFglZLuCfFn8HTNNfx/Dz2vjFgvBqU1shqBmNdKdEoG+WMJeBSkVrEWnMo3ed3Z4YNEIGSoSZTKhWAVuNYW/LE685lwM5rQxoI5z0XqylQiUoH170+KOeqP/MhzEE=
Received: from DB6PR07CA0003.eurprd07.prod.outlook.com (2603:10a6:6:2d::13) by
 AM6PR08MB4882.eurprd08.prod.outlook.com (2603:10a6:20b:c5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16; Wed, 19 Aug 2020 12:59:21 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::c5) by DB6PR07CA0003.outlook.office365.com
 (2603:10a6:6:2d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.16 via Frontend
 Transport; Wed, 19 Aug 2020 12:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 12:59:21 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Wed, 19 Aug 2020 12:59:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 540f4d001d68d712
X-CR-MTA-TID: 64aa7808
Received: from 37f7eaa4caf6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 73E41745-0124-4B90-94A9-2A1D3B6CA282.1;
	Wed, 19 Aug 2020 12:59:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37f7eaa4caf6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Aug 2020 12:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoZ6ujDeJ44nBp7fTF2wKcu7Hh964ieTI5Mb4xds7toIVRfQRtX120rCYqPNsjCvC8KKWftgrnTw1e2IMT3nGKElCOg2QU8ZSU6UG2S3uDBOM+pceNl/rXcdCoATAkCaLsaXwulxus3BWLbWC32MHLs2bsg6hkndUhbRpN5JiI/2LAgdWFmT0sWPMT922U9RDGnGigq9LJ04ZGAQ2N2fxiGImu1GvF65tbQu+MLOOGwaUIp0P+RWVh3uF+0ngs/XNFMWsCVvOSoYj1++jS1pXldTPV9E6Jie2QeIXkQjVdV8YNyTdTYbKCoWoDndeVwGQjwk9uEVcZybwWqWJawHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQi6NUg4FdvLPpq4zxtndeHIUdvTMvRSAjsu4Zlmc7s=;
 b=P2hFfBxlwLLo6dWR9EPfQwDdbW+OEPVWsJJ2pk7PzP73Y+QyyiMBWxuUxqiDGFSw8aSgm86yPtxAhgWWKteu9b/i5Mc1KOq/W6HJ4X99qme3GE6fec2ZEsK4zPTpcnC1fu1bRD29iPGoAIjkQOmohdrSmAUFZvmzFTACgP8e5SOsBbLxlf8qlXVL8H7ddrMdoP7Ifa1TtU4hG07EjohapYbtfXcPXA3/CGwteyINhXxtI/Tz7UVF3wdpGFaOw9fb8gLWR8CZowLZ4/8yrY3YxqerUoR2+aHL+bD8czv2nvaH01agZl6oZGUq1Uc755yj5LEFWL+qUbwKZVhJr3t0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQi6NUg4FdvLPpq4zxtndeHIUdvTMvRSAjsu4Zlmc7s=;
 b=eFiOU8ImyBxrvwuqjtV5lpGxxS4fSZRjrjHWEAZ9tvDcweLFglZLuCfFn8HTNNfx/Dz2vjFgvBqU1shqBmNdKdEoG+WMJeBSkVrEWnMo3ed3Z4YNEIGSoSZTKhWAVuNYW/LE685lwM5rQxoI5z0XqylQiUoH170+KOeqP/MhzEE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB2961.eurprd08.prod.outlook.com (2603:10a6:208:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 12:59:10 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 12:59:10 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Remove unused kernel recipe
Date: Wed, 19 Aug 2020 08:59:03 -0400
Message-Id: <20200819125904.23179-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR22CA0003.namprd22.prod.outlook.com
 (2603:10b6:3:101::13) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.110.7) by DM5PR22CA0003.namprd22.prod.outlook.com (2603:10b6:3:101::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 12:59:08 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 19 Aug 2020 08:59:04 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.110.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f95bd557-0fe0-45e9-5938-08d8443fb0df
X-MS-TrafficTypeDiagnostic: AM0PR08MB2961:|AM6PR08MB4882:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4882B24C9CA04F4D6AF61BFCF05D0@AM6PR08MB4882.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rvDTEL0ESF+IlLNRHym+OhbU8PSljBWrkYpE9nlX7e2xj9YS1Ggj/QFFhLdhHUdH5aQnDhkb3c4xS2amS4PpgjHMzAGrHw57h1HluBaU2+Xyl2FMGfJUq9smFAgcjYRxvR849DYucrV24eQPrakd6sifDNwcR7joMnP3rrhG3Gt4EeM7sm/f/u4gyodNpjZYZKSuXLcNCBUuyd8z78IV/En5wrU5cn75uMMKuexsckDiG8zRzQlSUP8gk2W29wHP9mRcqkuCnlBO+qelLluBsR5IaGFtfz3WmZZOf0Lbnmfgkn45PVJSEd44Eq4i0XdGaQCy5cWCfuOLcMqKq8xJ3w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(66476007)(86362001)(478600001)(66556008)(66946007)(1076003)(52116002)(426003)(2616005)(5660300002)(316002)(44832011)(26005)(2906002)(8936002)(4326008)(36756003)(8676002)(83380400001)(42186006)(6916009)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 57ZcfyxVmmyKg38pB0wmldJqs2A9I1DZ4W1VLXhaN8Yz2OPDmAc6rC8raFNMlG//c9jC9ioKqybZLDFtm33SrhghG7/R1n6r7vWqtS4hp46J6i/3rQaxz/cdHvoX8B7hZFGvnyrzfF2tyZsyAilAVw1auZ4cd/bSjzY7pUoaYGXZbi9uDtfbcP1TKJcs0puruOodez3Ts4CWnPS4Yyghk9ydhnMR8CjEmzlZnE13wwvFpSqkPgUh0rdAR/7dcQ+Ns6U2yTCLsdX+4nUQzqcRvjuddoRoVt0CglO0SkcSgaW7xdiEIQFHxFojSaSUpl3+zCass3B+EmsbRHQcUV9NDVGTamwyhotzsXnpG4PB4FDBRCsu3z6WjCjucMDcfQJU2arSQBwLYy3Iv5Wpb4DUYsM7BDdsHGROI86iVXfViVHNkqs7abfINos/++NUT+LD+fWY6KK3KYF3lDq8RfUl+7UVF9IvaT75y9zOluIbbWYW4s6I/Q4EcJoxjDwkHWK5WG+8BQJXwM2wLoTFQq8uB8AliIAXdJbhLmJDm54H4OFXMiFuLgRKQw0sPLzgIYoP/dutZt+Xa4jO2ybEm7zRuIL+RRLXlvi5yVMfecCcLXrgwOsRdyKeu3S6Na7nA+9nhky2iCfxIgDzCr2sesf+AA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2961
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9f3fc308-3cec-48ba-fd67-08d8443fa98f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wrMiQ2oYb7e1fZpRVy4AWDqtGTy410brqmyrrADZoSQYBg+W6okdbxT4lKZ8dZc2mTZgdng0NayQq1+qcO7ReJNvFZ0wjP494dpp2u49znTSFzIvSGNwNanzZiv5h6cTcl/XSd16vLo/km/4QebMJ0l3etUTKV2ykRI8pfRvcdSRvin4Rec01uCFPeJnNHQyJYmS6GCGnpv5IeaWcgEf9qGiH0gScvy7J/x3hS1et2nDBQo9LoLYPhPPsmuDODFXpPwUECjZ02zi45DboBY64eyw1ZGaZAk8IRDdjPAYJcVFiodYV00wJKoggttZMX05TYmVThcCO0Kt29W/1KPCj6Orbk/UJbFMEo+vYmuuB4TUslIeXlZ+KbwLXjajoXEheC/zCUuILJayPuwRRXN37g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(316002)(426003)(70586007)(186003)(83380400001)(5660300002)(44832011)(42186006)(70206006)(8676002)(2906002)(2616005)(336012)(26005)(4326008)(1076003)(6916009)(82310400002)(36756003)(86362001)(81166007)(8936002)(478600001)(47076004)(356005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 12:59:21.3911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f95bd557-0fe0-45e9-5938-08d8443fb0df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4882
Content-Type: text/plain

Change-Id: I4203a6d4536702a701055b511fc2b9a27868082f
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-linaro-arm_4.19.bb     |  7 -------
 .../linux/linux-linaro-arm_4.19.bbappend              | 11 -----------
 2 files changed, 18 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
deleted file mode 100644
index df8ba4d..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SRCREV ?= "e97e8d868aba53467039dbef3b7436c857433ae3"
-SRCREV_meta ?= "69022e62eb6c7046c84dace4af66ee8a30865865"
-
-KBRANCH ?= "latest-4.19-armlt-19.01"
-KMETA_BRANCH ?= "yocto-4.19"
-
-require linux-linaro-arm.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
deleted file mode 100644
index b1bc72e..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-# Add support for Arm Platforms (boards or simulators)
-
-require linux-arm-platforms.inc
-
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.17.1

