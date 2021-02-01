Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.75])
 by mx.groups.io with SMTP id smtpd.web12.33721.1612186077198598829
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Feb 2021 05:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BQ7ligU4;
 spf=pass (domain: arm.com, ip: 40.107.6.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+To8HVx2l4Sq/Pj29Kwg+spkP8VFNBAZWgwrUlWZlJA=;
 b=BQ7ligU4CLOa5+zVJchdFzBybbLUnfBljKfiKNS6JIMnN8j4mTxsF3MMNvFnrZqZ/oJDdqFjyscsDsS0pEkRH5gw+XMR6uy4wPQOGUUIySrygCOhq4Ui8ag9gFE1ta4rN6qR+sgTN5zr0id/N79zUZQm7CXCbKcDmb+laFNcF0w=
Received: from MRXP264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::27)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Mon, 1 Feb
 2021 13:27:54 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::b7) by MRXP264CA0039.outlook.office365.com
 (2603:10a6:500:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19 via Frontend
 Transport; Mon, 1 Feb 2021 13:27:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 1 Feb 2021 13:27:53 +0000
Received: ("Tessian outbound f362b81824dc:v71"); Mon, 01 Feb 2021 13:27:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac1e9a5a2ed192da
X-CR-MTA-TID: 64aa7808
Received: from 28b195c02338.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC7F90E0-062D-4C7D-A2FC-D9AB3F11E7CA.1;
	Mon, 01 Feb 2021 13:27:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28b195c02338.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 01 Feb 2021 13:27:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QW2mpg/Bqo/qetOPdApztill14jJD/0GVKIqt2CoCC/VYDLnllx++L0e+EdtR+leBlfxS9fqlSC8aXI/G3C+W6wD0uMOlX//HNk/UcMOqTtC0cq+Bhou+WXCsZmAwoo1eYzsU06PatABDP3sq058wEcFJfuaA4ptB6WaMC/uQZriUf0M2QQrRB3fsTlNfLtxhMS0i8fgeYKtb6AUeHU72qvGj71jo1hNA08FmQo5FLpMQ8vkw3ChlqDF7ZXaHqfffX1W7klAsh1zIcuSeH6Kjoe6IoPaiX5hveLzSPzs5tY9J3PZGQEai9SVTD7Ut16wSHoCJDdzNQhTz9nIz1QTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+To8HVx2l4Sq/Pj29Kwg+spkP8VFNBAZWgwrUlWZlJA=;
 b=APGdM8RhlucYBsFEqBYoueFXetSAk4T0XAQAAiaoEFQ62kIuN9LCGZiMZ16hT4UMKoCxxhJiC2+pc0oGrHGir06eq3CWbpaVUCwMAEkQ+vcUDTwB23TOyBEdto/UMaP5ydxNaipwMgrS3dKyXEBTz0kbIB825JLjmHscbzVCS69nZK8xCOg/jYerfY/ACvCRSisE7n+vz5F3gtTS35Kkfuf+4FlCzBNz466BgWvMduDnhUyjUCkkUbeb9HPpHXK7qIFeYnNbBZ3gzqS8dnI38ljE4J2VbrgtNrz1iux/lGdLEL+kHQblByOrLsfTAqZ8WVOp9pnzbtE6tAvPuAQtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+To8HVx2l4Sq/Pj29Kwg+spkP8VFNBAZWgwrUlWZlJA=;
 b=BQ7ligU4CLOa5+zVJchdFzBybbLUnfBljKfiKNS6JIMnN8j4mTxsF3MMNvFnrZqZ/oJDdqFjyscsDsS0pEkRH5gw+XMR6uy4wPQOGUUIySrygCOhq4Ui8ag9gFE1ta4rN6qR+sgTN5zr0id/N79zUZQm7CXCbKcDmb+laFNcF0w=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Mon, 1 Feb
 2021 13:27:39 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3784.020; Mon, 1 Feb 2021
 13:27:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] gem5/gem5-native: Fix INSANE_SKIP mechanism for native-last QA check
Date: Mon,  1 Feb 2021 13:27:32 +0000
Message-Id: <07fa1f2131b65ee369e8f02ae287b1ba8d0b01d5.1612185962.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18e::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 13:27:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5b27989-6e3a-4d1c-3938-08d8c6b52dbb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6536:|AS8PR08MB6374:
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB6374DF42EE9E532BF15E01A292B69@AS8PR08MB6374.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:741;OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NPA+TpVfXX6shT6iXCWKhrfPDOWk6rzV6gaZ4qVOsvmbg5RD86hT7F6lh/pEa5YoUFkanlhszbRFJFYVgeKLPrFn1BP7AVYbuyieGFzHPOhKAyyNn3oBD14irFWrBip7H30AxLu/kUj/+6ECv+0rMpgTqBgn/JQtBGQH5mVWmdcrdBjgd3OA9xKrwSMLnUoNKuJQF6I1Bk+xUI1YRoCAA7xLJGA8wK3t/m0iUTxRRI/G3e1fbbBGPX5l1kwBvPTm3BGEPGZyYVHOP99qaa67YD2+BNCHaS1Hs77lvlrGUaY93P6PNE6aoQOWBt6gXmu7OgxrT9JAX9L0SygjT2ueOPcZ3hdf5QrapvwS3VoMQH7eaTxIWAzLCKJNsLCvxLhXjiIgLbSaiCzTXA2O0/Vv9jKQiQtSvQJdNIFRf5yKXp7SuBMJEpjyE5Y7ULyc8XkGHKAd6XPeCIvAubMTFxk4U8YqJ44hOUwz3P1MqonI+nf6oZtw3DnQaV0luID6wJMHWILctSxRKu/LxHYmLjNQhA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(396003)(346002)(136003)(2616005)(186003)(52116002)(8676002)(66946007)(8936002)(7696005)(44832011)(6916009)(83380400001)(4744005)(956004)(5660300002)(16526019)(316002)(86362001)(26005)(66476007)(66556008)(4326008)(2906002)(36756003)(478600001)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?ef76jdgF0npabtj7rxYR/MvCvnGHIcF1hYZq6tbBSXtmA+HEYCkpOjr8nRMI?=
 =?us-ascii?Q?fFxPKEhkY6PIBiC/cF0j0PHKx9plmXBJ/OWJyH7en61pQMLtSXh0d2Kf238y?=
 =?us-ascii?Q?wtjEMS49k0mbvPUDWgm4LDgDNob5MjQ83b1OIwa1r/MjR6oFJ9Jyel1DDaAz?=
 =?us-ascii?Q?icHUz5Y+ye7ioLScdSHX3uVT5DNrxBgxOScdTDUzZdXZQLiWLrpmh0X/5X0x?=
 =?us-ascii?Q?i5UHVlyQXt6JTAYYt3WOPyx9njEbSN2zYxED8P9xdQ3IYCR70lo7mAnHFYPK?=
 =?us-ascii?Q?9tCkyYC496omceUzcQD0ao6ROH87CtSAHmbT3YMup4IRjqkHjPUrcFt7QvqV?=
 =?us-ascii?Q?xub4aAtk9TsRoYddzbtqljmORgmvulcwOD2drAz2fe16YbQcVcFRpqbueTCy?=
 =?us-ascii?Q?0Iyjew/724fzYsigcrpM3dNn3kPwIpyLTQiAMH/3brzFvWo/pgeOWgiXjA9x?=
 =?us-ascii?Q?1KhBB3ImxZkljZKcDkBNSAomF0Uuepev/65vcGmIHQf6F04LTd+oXf5PnAkC?=
 =?us-ascii?Q?jkQI3SuInLVtWSBhqpY3FSTahiv6h+gjZuGlbJ34eniny5hyCFYLdG0PZMVk?=
 =?us-ascii?Q?+j1sAL46edNIk+XJmVePmr6DSgoRw8ifoL03+BhOfZP399ZjlIWJ1SxBBRZi?=
 =?us-ascii?Q?tCEkN5BkAxzeKwyCcVnLiKpqKDyZ/w39dfI4sOblVK7q8TE+8cIJiEcPoWXv?=
 =?us-ascii?Q?vGOgMQRI8gZJeUH9BnZv76rkHTfwbaxXo6rPPPAxPURMUctrms+eAcnzwAgw?=
 =?us-ascii?Q?/N5VoFsAn1fF6o+u4YUZYxf3TRbVfWWo04aUQ1a9sD18G3xbAYgY7oaczbGd?=
 =?us-ascii?Q?ggjhRwM5Rt3WmzmZ0oHMjANsDBVpzyCl4C2qSrWwVE+j/komGzJ0EpqiR1IX?=
 =?us-ascii?Q?sbmKiWnQA+C4ONLC2tb5bOuBYx2BFPgBKJus8hXj0muetjx+tBU3AAyKKPBL?=
 =?us-ascii?Q?yxX7OkKoXMt46Qo0tlvOtrNKSQhhZ8LRRZ/nkvf5hra5PAwGeba+AQ9lzEz9?=
 =?us-ascii?Q?lPuKRAVRqz8+UGvAe0GYcLUyopTYI696Yp9HzU7JuvzvlUuwBwweg5hta5SN?=
 =?us-ascii?Q?CiX5RMv7?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8842376a-e3a9-430a-7aa9-08d8c6b5250d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rj6YcJ9hq4yIOWCpmT7MTIQB+o3mAOAhb2clbejIl05vzVk1spAKi0vDTFPKU1zw2Tsbov+tILFu2vYtoIvPgZBTks41IEkm7ZzX64SmSJ9sumgufvXWGvF3McPvTGCWVKEpqtbDmhELhREhOj6zzZFlT2g/o9dXW9mz/bFnkgxkCwTHYqmRDdoSjgNIGbQE8gxumHVmWRYTkHVUZ0MVF2Z/iRgbr+FqsS7kTsgIYunm980FU1IlNUItvzuu44BV05Nmqk1RclqhXDNlAyUeTvu+wqTrUc17H7GQxzc97XKExB0pe/VuaTlxQ66YytkhAsQVIl55kZ5CCaWBRjLEPavx7RgIOTeUgyDPIecut9P032liyVvdkUQvZeYzoRGqmj1tAwf7rCmm5V9K5E5VUEaNENpgVIN0yQXC1NwPPpJ5QxKkZChLAXlsHdDyozz/Ne2qKYzqCHREoCnot/TEQhYSVnx62LCQdTuwiM5gc7FRQQkJxeEHesmvRDC/5624QItvlcQVXPrzMavFjtXGTeA0D3phuCtp2J30Fe0t0vhSs03ggql9etgX20KU0jWPNtKxsqHu0QEvAeAd9geDUdTzZwQYisGj5hWgM4+QdSs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(396003)(46966006)(316002)(36756003)(6666004)(6486002)(8936002)(82310400003)(83380400001)(7696005)(5660300002)(478600001)(16526019)(356005)(26005)(186003)(82740400003)(6916009)(86362001)(2906002)(4744005)(8676002)(44832011)(336012)(70206006)(70586007)(81166007)(4326008)(47076005)(2616005)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:27:53.0240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b27989-6e3a-4d1c-3938-08d8c6b52dbb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Content-Type: text/plain

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Ic1c92e145694abd30fdd99fd073eeacce917c55e
---
 meta-gem5/recipes-devtools/gem5/gem5-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-native.inc b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
index 3c891ba..3cad1eb 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-native.inc
@@ -18,7 +18,7 @@ GEM5_SCONS_ARGS ?= "CC=${BUILD_CC} CXX=${BUILD_CXX} \
 GEM5_RUN_PROFILE ?= "configs/example/fs.py"
 
 # We are building a native package and we need to use scons
-inherit native scons
+inherit scons native
 
 # the build is using several tools:
 # python3: scons and six
-- 
2.17.1

