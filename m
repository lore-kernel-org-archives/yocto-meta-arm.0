Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web12.3246.1594071533766870803
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 14:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dTXIqzM2;
 spf=pass (domain: arm.com, ip: 40.107.7.70, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iJNLnHJdzONMPlnfRxt5YKNKJn059vWpL8Hs9itBCE=;
 b=dTXIqzM2ESwNOJ7Aafl5PiTwvmHsnFcPPJmsxit0+FSVyiWMhXbHE9tnb3KQwH8EhUOaJcpPyjt9jUvA1QuGUyNn23UYgaeuwLv2bHnw4BAaS9NLEiIKeboA9SWi27dqZcEJz0DjtPAwRANqUtnfulhiI02SRPYLBiLC+Tt6dDA=
Received: from DB6PR07CA0175.eurprd07.prod.outlook.com (2603:10a6:6:43::29) by
 DB8PR08MB5513.eurprd08.prod.outlook.com (2603:10a6:10:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Mon, 6 Jul 2020 21:38:47 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::ff) by DB6PR07CA0175.outlook.office365.com
 (2603:10a6:6:43::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.8 via Frontend
 Transport; Mon, 6 Jul 2020 21:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Mon, 6 Jul 2020 21:38:46 +0000
Received: ("Tessian outbound 2dd9eeca983c:v62"); Mon, 06 Jul 2020 21:38:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d8022b918ad0737
X-CR-MTA-TID: 64aa7808
Received: from 84f502ceb100.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E4736C77-270F-4C0B-84F1-52EF698C903B.1;
	Mon, 06 Jul 2020 21:36:41 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84f502ceb100.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 06 Jul 2020 21:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvKK7TbEc3NW8ghzPQt7i32YfYV9cAyAygPYR+guE9Q1XAGZCre3ckQzeZsVHjTs4RKRteLGjFITJtBPw6PmlLu5AZfX4RdzKFvvcNYE32DbeYPwp5MOjrYHev/EFahQ0RzrlFhugzSAMS+HeKOBgvsimht9aSRHv8QaLqHQwwmmJ6co+txR97momOjmob/WN7N4To3auQs0QC65hMhic36oXXwsyYOEHfFmU3X2Zva1SRYDFUr3Q0hPvy2miDA+7ydBWmqkz0PY93d5bvnwo5LfXSu0ULvxAuxAO5WM5TPnp1X+UfOX35Wq0C8fySvSbdDD2hwv5RGwH9+FA3ZTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iJNLnHJdzONMPlnfRxt5YKNKJn059vWpL8Hs9itBCE=;
 b=n+cJ5xY5uHWUz2yNeUiPbg60WhGTYyh74NHb9SjCJ3fmw3LmqnmFd2lj276ZYpN4owLX9o0yurZTHrKGCDQXBSX7QzwwjSc9/qup0o4LP001jzJUi/PSOI+4IdKgVbSK0J2fN1U8zsGMHo/+odnqz5/t0wKx1M+NDFz1gr+OtlvPMQkX6iJfWuT3ql9lyjVRtJf3r76lE8qXSICFv1lejqNXR8+2jLxO2EK5QaXoF5r1f2AdvSZZSoMB3YZHcylL2IqGu3XM71xYWoQpMZK/iYVDwaxtMqaHqCvYfvhaV3brKYiSJ2eXsi+YV3XogfyniwSvaF+UKJUONHTOpvWevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iJNLnHJdzONMPlnfRxt5YKNKJn059vWpL8Hs9itBCE=;
 b=dTXIqzM2ESwNOJ7Aafl5PiTwvmHsnFcPPJmsxit0+FSVyiWMhXbHE9tnb3KQwH8EhUOaJcpPyjt9jUvA1QuGUyNn23UYgaeuwLv2bHnw4BAaS9NLEiIKeboA9SWi27dqZcEJz0DjtPAwRANqUtnfulhiI02SRPYLBiLC+Tt6dDA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB5361.eurprd08.prod.outlook.com (2603:10a6:208:18d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Mon, 6 Jul
 2020 21:36:40 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 21:36:39 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: yocto-check-layer fixes
Date: Sat,  4 Jul 2020 11:43:01 -0400
Message-Id: <20200704154301.15546-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SA9PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:806:a7::13) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by SA9PR10CA0008.namprd10.prod.outlook.com (2603:10b6:806:a7::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28 via Frontend Transport; Mon, 6 Jul 2020 21:36:37 +0000
Received: by vm (sSMTP sendmail emulation); Sat, 04 Jul 2020 11:43:01 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd06c4b9-2aee-449a-a1bf-08d821f4f6c1
X-MS-TrafficTypeDiagnostic: AM0PR08MB5361:|DB8PR08MB5513:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB551350EDDD10BF29F0D3B74AF0690@DB8PR08MB5513.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:475;OLM:475;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8NeyYtG1PPlEL8262llWiyoUGKk9awDljXNzbRtfcsTfZLeZR/SaoQTj6EzAHqaVXk5reb6GyTehBve5KoCWpPFqM3YAMr59I/d0eW87GTLzcQj5swG9/4gTLcmajZyZpWYsovtoCxSzPncjC50Zjab70CtFh9k2fHKYICL7j1Sm68eChQKOmG3GLdG1LAytU/0Qd9LbRynsP35Wrv/TPALzDwAqKNMo9d3P9a1DQZcydrFtHsql117s4NGNER7rqMyLo41OSrw/BNqrKfLG6YOUcu0KQH9UtAwGKXFgmz5bif5mMztvJzUYPoj+S1fCDhIdrs3K5XZBQNxh5SdHXg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(44832011)(426003)(316002)(186003)(5660300002)(66946007)(66476007)(42186006)(8936002)(86362001)(66556008)(26005)(2906002)(8676002)(1076003)(36756003)(2616005)(478600001)(83380400001)(6916009)(52116002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 8rVL70Ht4K9atabc7iNTBlkLIWMdIvK723LHqnSX51Se0lTmASx4622W76sZ/Wp5C2Oo4rK1VNED3gK5qBF/et/TDjxQsjiwXFRRJD1Erh8fffpCQ3NmLK2MjwQXk2yPA2iVezOAOyxLxHyIAB3dRxBqOV+d/Ht2NcC1FqLF0/QbqQW1RZoqYEuP5QfzpWRdBmwcckN7NnloaIQ8vfEzzhBuXAtpn/EQ47cv8406V/uKR52bHNgYuin0O1DzpsmIhNGBSlJPjsCW8lmFm3I832JyEWo2B/nnYBy9Ft2E+XDiXrRSjLr558wPxk7bdIllzvC8YGOL5S6WB/tkYqlLFnH+InkPcR3OhD+awqNvHrJ26Puiw9ILs77/wLSrAN/+O5FzTKdmGTahNesoqu5cs5WxLs6Jl0Z6EOMnBBfXLZB0pbB6/luEKM+kbduAPYr7EjX1mUpbnGJGamnQKn4joqvN26hK0e/PzjGSK8zLVhPDZaIZ7GjSDxFwyJ8L8Gzt
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5361
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(70586007)(70206006)(186003)(36756003)(2906002)(4326008)(6916009)(5660300002)(8936002)(1076003)(26005)(83380400001)(82740400003)(86362001)(356005)(47076004)(8676002)(82310400002)(426003)(316002)(42186006)(2616005)(44832011)(478600001)(336012)(81166007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17b686e5-323f-4ee2-d04c-08d821f4aa45
X-Forefront-PRVS: 04569283F9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bu3HCxnQLSzmVddyCsYb13LLdO/gQsCoEseuYrJmh5Pmu+tZp4ZU++qyDo23apCCJi0x9LXIdutj3IelGMv+xc51n0thWaTpW1lYQK6EvAbnEj33/89AhZflVQqXSdln+ELyPMOCzskj6NHbGNFWkEaBGP9MmvVys4fmWrk65CDf7I1SoSBhgCUjNH0/0ogyudLggZVPUcRjyjmWg/slZNs4ftxWV7rERy5gA0Fax3m5XSJXbdsN8AKAni+aG834KqQbPDH2K+qwk2BDrLCo9cM76sW5tfYICvnfEjpwEQrg+mSdk88j4d0RZoBDk1sEd3GIO6tRBMbfrDLEeaEj7U3YuDQe1o2IAnW9IwBknVMnLboWbhYaDe2zcQ329t1L2FemPLmHq7eTl8ifLzkHEw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 21:38:46.8487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd06c4b9-2aee-449a-a1bf-08d821f4f6c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5513
Content-Type: text/plain

Changes necessary to get yocto-check-layer to pass

Change-Id: Ie9ea5047ab1344d14a585552277fdbd6b2bc48ab
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/README.md                                     | 1 +
 .../recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend  | 3 ++-
 .../recipes-kernel/linux/linux-yocto-arm-platforms.inc     | 7 ++++++-
 meta-arm/README.md                                         | 1 +
 4 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/README.md
 create mode 100644 meta-arm/README.md

diff --git a/meta-arm-bsp/README.md b/meta-arm-bsp/README.md
new file mode 100644
index 0000000..490ddca
--- /dev/null
+++ b/meta-arm-bsp/README.md
@@ -0,0 +1 @@
+See ../README.md
diff --git a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
index 8b5120f..2c5f61a 100644
--- a/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ b/meta-arm-bsp/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
@@ -3,5 +3,6 @@
 #
 # Enable second network interface on startup
 #
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files/juno:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
index 4d20a91..3ddebb9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-arm-platforms.inc
@@ -8,7 +8,12 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
 
 # Arm platforms kmeta
-SRC_URI += "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
+SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
+SRC_URI_append_foundation-armv8 = " ${SRC_URI_KMETA}"
+SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
+SRC_URI_append_juno = " ${SRC_URI_KMETA}"
+SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
+SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
 #
 # FVP FOUNDATION KMACHINE
diff --git a/meta-arm/README.md b/meta-arm/README.md
new file mode 100644
index 0000000..490ddca
--- /dev/null
+++ b/meta-arm/README.md
@@ -0,0 +1 @@
+See ../README.md
-- 
2.17.1

