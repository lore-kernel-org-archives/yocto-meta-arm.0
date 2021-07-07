Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web08.18872.1625650307644758220
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 02:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oXMPm4rY;
 spf=pass (domain: arm.com, ip: 40.107.22.42, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iChnMwOUdSvNA4XlKv8CC+LeVmxXHG7FABqC8dxnisc=;
 b=oXMPm4rYRmhVyGUamD6BAr+l2c3a3SpNrj8qk9D/2+CENI2dKzvpQJsl6mayq8C1W7ZIN3MnTsdCtR76T5eulS9ECjHUi6m7Xk3ATasi3kPHuGSOiuMDU9cIuWqE+QP02K/9uAucrqD4tQDoAx/yRHqOTRXtwkf2kxMmSH8MTo0=
Received: from AM6P192CA0083.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::24)
 by VE1PR08MB4959.eurprd08.prod.outlook.com (2603:10a6:803:110::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 09:31:41 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::6a) by AM6P192CA0083.outlook.office365.com
 (2603:10a6:209:8d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Wed, 7 Jul 2021 09:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 09:31:40 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97"); Wed, 07 Jul 2021 09:31:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77bb67f48034ae6d
X-CR-MTA-TID: 64aa7808
Received: from ad2f37d30938.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B151D635-F4D3-48DF-AE74-DFF04F550EC9.1;
	Wed, 07 Jul 2021 09:31:33 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad2f37d30938.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Jul 2021 09:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6h2vTuKoyHNQxcTfa8CMichsE+GbC6WOvu29nzlKRdXRRpu/heKRJXLIxBE/Jx2cLicscJ9EnFvb5H8uCh2ViUVxHYlFHynPrDQRTD/zvQs8rl56STuDj6pp3FNefIWRFxO6u498q+++XxUYWAqF/Jr70MDjeB6TtsfwKxdCCIbE/EpLWkIHtHYlVF8r70pQDnznDcScD/UbzEF0NVoprwOASG9vO97mFBFp2DbAz+Kj7Ks6mXkqW9B8qrqS/kcxm7ywtiPa91XP8nMCuavbPXs+HUNWfWnLqm7m2zQ8n30HBaWQ7s0lD8DjHxn6Q0T/yGDXwdCknERCEvI4McGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iChnMwOUdSvNA4XlKv8CC+LeVmxXHG7FABqC8dxnisc=;
 b=V3pmlQ+lp9D0cLVIt+lvzXkW5M8UMEBeGih3ZPQqqtOq/PVr/XkHSfb4ihpbeFI38WkLbfBKZ4x32Ihju1O0C2r+2/RkDULOWxVXH2bEdnyipz+WzNZqdUTn1VuDq6rm1XQeQT/MUuRHwxOYegbA4HHMi2C/b0Atifw19YFmhkoQvDj9R/WwOHyDwJLCj7h7GtkNx9y1MuxzDfEPMQKVf/xJRA9VV0jgTWUn+kc2JA4JwNu7leQ7CYhfZE0GG+RyjywZsONEnXpBSYem7u4QwjwqeOA/AIRhOXD1Ki9IjkJkKv6OXeKqlDgukatw+JOlIT8MGJP/4SmJ8Kmd0mAGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iChnMwOUdSvNA4XlKv8CC+LeVmxXHG7FABqC8dxnisc=;
 b=oXMPm4rYRmhVyGUamD6BAr+l2c3a3SpNrj8qk9D/2+CENI2dKzvpQJsl6mayq8C1W7ZIN3MnTsdCtR76T5eulS9ECjHUi6m7Xk3ATasi3kPHuGSOiuMDU9cIuWqE+QP02K/9uAucrqD4tQDoAx/yRHqOTRXtwkf2kxMmSH8MTo0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4802.eurprd08.prod.outlook.com (2603:10a6:20b:cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 09:31:32 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::5814:4d70:f7d9:a6c2%3]) with mapi id 15.20.4242.030; Wed, 7 Jul 2021
 09:31:32 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy: Bump Xen to 4.15
Date: Wed,  7 Jul 2021 10:31:25 +0100
Message-Id: <fb930e2876602ec67edc06d9150b859a351dab72.1625650262.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::16) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0292.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 09:31:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60cb7632-8543-400c-effd-08d9412a06d7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4802:|VE1PR08MB4959:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4959B35A84E0079D3A65BBB7921A9@VE1PR08MB4959.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bVgBjePe597c53aGWIrW8Sgebj4IHDaHTr3ak3ObhVW3UH/TD6vtizHhqW/hy4DhdTgWTmQgYwC5ybbFnXBt5/nU4h53CZ1TrdbKphAoJdiguii8PGG9+nqlb1L7wiYbAGvAzsy5PwB0rRSbhcCtjuZHaYPVf4CUfwwBLaltUQHAZy4sFZv4xeai3mAPGuLD5XZqSAglaJgQxugrUH3PgQbCoYbqVConrM8cVYzlvb9j9zSDRGeODJlI3FEGZbySVM+qs+eARFcCty5idy9YNUbfEbbtclghQnN5YfLOHa4cF9y7wtElhsF5MjD0gr30SjcJ8HPEM09sQLbxNKnswVmoyJFXstbysEun0UXm2jzaj7ZUaNRg2uQv5o5uGX1Ej6oNF1OqTXtzt5MRrgOFYptPK2GJjyV1ao0kKNlleaek0NlLIP2kLc8Mb/iSOQqYAgQWChSVCaZ9TEugVtCXt4iuOw9yQ0darFxgBLwuAhbe6W21ljkTtbp6mMeD/Y094vW1B16v89Tm/pNLFWazQITuTLXw20dmSD6axdC2sddPBOB5O/NWpLeaEabkA/ZztihaWRryNmvf1pdzHtCuz8TWT8MMtIpD0qDdS99dd9HRbjXLVOlmxDOejMivXWDHyKwOyY7w0Hkl0hRMQNeMdDpL4FrOAsSZtfjNDMcoX6tRlqU1R296Oi3SfbCWrSjLZv43IjbaWFB7rviDvOjgMg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(186003)(316002)(7696005)(4326008)(956004)(8676002)(5660300002)(52116002)(26005)(38100700002)(66476007)(66556008)(66946007)(2616005)(38350700002)(6486002)(8936002)(478600001)(86362001)(83380400001)(36756003)(44832011)(2906002)(6916009)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?0UTJAlX2dWTIQVI7IW28hsRq/xvmuKxBQMKA7glqgEMd8JtnRx75d4ic5HVf?=
 =?us-ascii?Q?+K42ACbi5UxF3xf30emProo6zsImh10K5J/OgX3EryhukiF8mUbtpcJTUJGe?=
 =?us-ascii?Q?3impVY4ULeX8C4FVxHHToVQoDUo+GDgzcEDhnWlgSw7lIgNCZkfeuFi0Mjbw?=
 =?us-ascii?Q?JDFlZdppZUzK1xv9MdNzMWHHqoNSe/DZjYienO4dfoxvfBPIGGJTAcpjyUj3?=
 =?us-ascii?Q?rKCKL7dPHfv1u3T50fmsBmii73FYNmKhXI4HKQlAskiU/Yonp4f/XLvv84SH?=
 =?us-ascii?Q?UgqTReAleZakwmjV/oo1zyuLnIE6wS3JQBtT4DiO2NIhC5bfvh+Xhl4tyC5y?=
 =?us-ascii?Q?b9mE7ABnSPfuu8klIDiCYN7Htuf6yDx1Mv2zNLEIHkvLlB+T3BlRer4rnVlM?=
 =?us-ascii?Q?+wSm1yp0E7KfZ8KCoIss6GhY0B+V8h2j7MF/IDSLyvXDWu6TOEUAnwKLLjrA?=
 =?us-ascii?Q?PHGrkszWUMh7is6Xsi+S7WRvOnkf+tmjr/rVr3r5mPv1zU901FQUekNEPOkD?=
 =?us-ascii?Q?GmS/p3TbFCOA+FBwCddBfgVlYeafFawigE+5OS065XCtZFf4gDNdLN9rU/NU?=
 =?us-ascii?Q?W7g6PPkX3x7ytDi/bD2Qw9wHXSQLRn+vlfFqBkpPAam/gv0cku1RTWGnwtmN?=
 =?us-ascii?Q?73xR6uCVniaOiExos6K9+pxLOhctvdahU/4p+DSIJ7oMBJgseS2+/soSWder?=
 =?us-ascii?Q?POlv0NHOVAOqRqV3i2G2NTTKlJ7dA73dz+pJw+DrUGlZrytnOpS8UK+1ArP+?=
 =?us-ascii?Q?RKBcGLeXl8ylrcY7YeP0o30EDoJzBuxG2PIuvWvUCSwq4o1R47jZyEvdL/7D?=
 =?us-ascii?Q?+l/0nsFUeGU2R3xe6awJ8mJqfjkSmuicUPUhx3iKrc2jIRARXAAoGas/4XrS?=
 =?us-ascii?Q?3PxpJCgX/AAqWIFmWQzNwCBQSf/ATsJSwHqbh0HcEx0Mdf6k6xauvJJ3Rh2E?=
 =?us-ascii?Q?NkpoQgHvTUVntwUlkWGCnwEbm+1yxcLDy7ZfTEbxWTXFiDrisiIfxe4piy2J?=
 =?us-ascii?Q?wqDx4ynWRvdaGo1O1GCFQd6/VGXUWlEnQlNJy/Vwjw673c6TrhHIDVUoY8ow?=
 =?us-ascii?Q?lQpkJXCbVUDGrBaF/5QQqw1ZcAp5gfxh8PYcX+7VWG2sH63fxI0zNQkRUSuR?=
 =?us-ascii?Q?CIV4CzSrymK/bFMFSpDVlWym1IgsWNnqB3RnIT+e7MnaIkoN5TXlYB0rsyjV?=
 =?us-ascii?Q?L3Bqbvua5cD8LDwRXSVQ7B/ouWSeZpdHsvsp4gYzUPVptj4COizFh2DluXlQ?=
 =?us-ascii?Q?DCm0rTR58fBroA7A24ds/CsnUqy+NgUHnBcbI3lkLF2ojldxJJoPpSsmLL46?=
 =?us-ascii?Q?i2yHsmfIWa+irXw89TUoQ//y?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4802
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7f3305cf-8c44-4fd3-34cc-08d9412a0191
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0aTfQTJbGJ4hS7RYYQEHM4Kdfm625BtE4qcFWB3kZCY11VKAeevu0YP4k3pYiyKDVAtkPzHC/iXYIC+xyTInKNQOPAxtuqAWsDY0jjqWMAew+z0EuSkYNlH6OaRvOb7leQvnyosU2gdw9l9pe471KnKV0vQuZYlSq3P8LLoFEYJNfmGZWD81UEP0mcicBxRik5LuCFjz9QakvjSJBTozGP6gEAfAWM3BbTBApVAM7hg7ndhYrRWoyJCD55/Br7l+8yxUp/gAh69uiGhS5lOMP74oSqlAtIO1GAOrNIOophVQB77usP0/9yXPugOqdogwKRQcga4qzr/YTEple3bVUt05K2SXbvPXH9frnt6YJgyIEZ7071894c1IeJFlcqw6twyOVDH7yoETtwPdldOw1mSivfbI2OyUdDXLVCLR3Nb4yAcXNEVqnMvxEvukLmgVC43f5te6u136DBgprb5chshSchDb3CU27jhEsOiFeJGz/DlHgX9Sm66mIHQVmYHJyxHF6Qaag2HpuY5V3ADfPywvuS6gQnNdJdLqPk4tahvimVzcFD9uv9LlngzwllpRsf8/YFg9JbE/5W1fQxWhT/H8zGhFP/2iRKB+PoFuHymXBAGxOPHWKqnLUozkxJThovaOiEq2Ki4ZcGsvd1KDJZc6vn/6VxiIOt6w8XJZlylJpiyP8vO6q2uF6WHV6zGe7WujglcbpLZuYY67A2gfkA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(82310400003)(36860700001)(8936002)(70586007)(6666004)(82740400003)(70206006)(478600001)(81166007)(86362001)(5660300002)(316002)(6916009)(4326008)(186003)(36756003)(7696005)(6486002)(44832011)(2906002)(83380400001)(47076005)(8676002)(26005)(356005)(336012)(2616005)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:31:40.8292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60cb7632-8543-400c-effd-08d9412a06d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4959
Content-Type: text/plain

Also remove disabling CONFIG_ARM64_SVE in the kernel since it is now supported
in xen 4.15+

Issue-Id: SCM-3027
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I8fa09a10d16e892ea24e6abc77678d2fb1947e43
---
 .../conf/distro/include/arm-autonomy-host.inc   |  5 -----
 .../features/arm-autonomy/disable-arm64-sve.cfg |  4 ----
 .../features/arm-autonomy/disable-arm64-sve.scc |  3 ---
 .../recipes-kernel/linux/linux-%.bbappend       | 17 -----------------
 4 files changed, 29 deletions(-)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend

diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
index a7fe523..d2aaabf 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -6,11 +6,6 @@ ARM_AUTONOMY_HOST_OVERRIDES = ":autonomy-host"
 DISTRO_FEATURES_append = " xen ipv4"
 DISTRO_FEATURES_NATIVE_append = " arm-autonomy-host"
 
-# Since meta-virtualization master branch bumped to 4.15+stable we need to
-# force the 4.14+stable selection until we validate the new version
-PREFERRED_VERSION_xen = "4.14+stable%"
-PREFERRED_VERSION_xen-tools = "4.14+stable%"
-
 # Don't include kernels in standard images when building arm-autonomy-host
 # If the kernel image is needed in the rootfs the following should be set from
 # a bbappend: RDEPENDS_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-image"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
deleted file mode 100644
index 7e87cab..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
-# Linux kernel with a coredump while trying to access ZEN bit of CPACR1 core
-# register.
-# CONFIG_ARM64_SVE is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
deleted file mode 100644
index 6bc769c..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
+++ /dev/null
@@ -1,3 +0,0 @@
-define KFEATURE_DESCRIPTION "Disable SVE support"
-
-kconf non-hardware disable-arm64-sve.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
deleted file mode 100644
index f590e71..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
+++ /dev/null
@@ -1,17 +0,0 @@
-# Use OVERRIDES to minimize the usage of
-# ${@bb.utils.contains('DISTRO_FEATURES', 'autonomy-host', ...
-OVERRIDES_append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
-
-FILESEXTRAPATHS_prepend_autonomy-host_fvp-base := "${THISDIR}:"
-
-#
-# arm-autonomy kmeta extra
-#
-SRC_URI_append_autonomy-host_fvp-base = " \
-    file://arm-autonomy-kmeta-extra;type=kmeta;name=arm-autonomy-kmeta-extra;destsuffix=arm-autonomy-kmeta-extra"
-
-# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
-# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
-# register.
-KERNEL_FEATURES_append_autonomy-host_fvp-base = " \
-    features/arm-autonomy/disable-arm64-sve.scc"
-- 
2.17.1

