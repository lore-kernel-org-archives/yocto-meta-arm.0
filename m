Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web11.11728.1597330381775207921
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XWTQyNbx;
 spf=pass (domain: arm.com, ip: 40.107.6.56, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2f6zmNyjZ2X5iPcnuPYHBENumguEQhlwXPXkduodi4=;
 b=XWTQyNbxngmSoDEilCTJgmYMlPqe6r632pTg+vb1zwR7aYByHv90CMzRpOpbHVIJ1kbi8B5ERWy1jvtWdGpjkmHhM/J4e2V9mZufxd5xmnMd1yPq/hEsxkI8iw6i3qpIXOFQ2Z7g4KTzBG1tg2OHU1+ybJyGFmLyYCjpQrCqNEE=
Received: from AM6PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:f0::17)
 by AM0PR08MB3169.eurprd08.prod.outlook.com (2603:10a6:208:59::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 14:52:59 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::25) by AM6PR04CA0040.outlook.office365.com
 (2603:10a6:20b:f0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:59 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Thu, 13 Aug 2020 14:52:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9581562418d5852d
X-CR-MTA-TID: 64aa7808
Received: from 618ea1642277.14
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F57653EE-3F9F-4D55-BADA-2871679EC055.1;
	Thu, 13 Aug 2020 14:52:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618ea1642277.14
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJAY0YxO47X+9H9E36SSzvR/cnKme2NRytrh41pUlKLFkkRkKSu5YIssgkCVwCczjL9jIBPxVXWngkTn5H5ipuKwgEi902waWoPqABOU0H0b4eenZWkJoisAhPlwTHHuWVgMNFKelIaFMDzLiUWEZ0cZP+u2fYpP08FQR+6/GhNdCw6xAhyj27mi2eMcleJXXayl3v9ILW7fQlsLY45lncGbhYBKXqORzKCJzj0++Gjo9P/zr4szDpQDL60xR8gV5d1Cu7WirfXbxiKiuECWeI1Xfr4h8nYqvY1tB9oln1ZJxYywddtB+rZMkjhKuhPrSlenn2VFuXzEaLcUAzlb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2f6zmNyjZ2X5iPcnuPYHBENumguEQhlwXPXkduodi4=;
 b=XWSu9vtY0H2MzhxfyTe4UMcATdXJS1MVjULn54ddli/1whxDhyaUw4Jy97tyY8qCER9cq+61ePXxOHo3B/A1qvdZrpG0MNynI0pJTCtlwBhaZjeOHqGlMsSFPsN60jvnG0/aTSmZygPBlOUkvWyIOCX4uvjBVeehOKfttzPPsS5ms9Q8/ly6LmYKVaNQ1X2osGrBZLUgGdyrrgQCnww62wUBHVWlDcNcq7wQ+2DNNM9NeQLTuE3l/Vt3nX5tR42uMCSgN8BCQYnzBsW907IZWmDmk87Rwgq8icmOXz7vEuJf8EfYini5vctl2BT0A4hm5J8Q9XImeIAZxV/R65egrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2f6zmNyjZ2X5iPcnuPYHBENumguEQhlwXPXkduodi4=;
 b=XWTQyNbxngmSoDEilCTJgmYMlPqe6r632pTg+vb1zwR7aYByHv90CMzRpOpbHVIJ1kbi8B5ERWy1jvtWdGpjkmHhM/J4e2V9mZufxd5xmnMd1yPq/hEsxkI8iw6i3qpIXOFQ2Z7g4KTzBG1tg2OHU1+ybJyGFmLyYCjpQrCqNEE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:46 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:46 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH v2 9/9] arm-bsp/linux: Enabling lan9115 Ethernet for corstone700-mps3
Date: Thu, 13 Aug 2020 15:52:30 +0100
Message-Id: <20200813145230.22140-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 548296df-60d9-4b04-0f96-08d83f98924b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|AM0PR08MB3169:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB31697FFB6733D07329167002FD430@AM0PR08MB3169.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EwCdSXe4goRqH+Y5o99vp/oKktTgnXs2/pqqaqIteX6uWjg5msvqspvGtEN2dQ0ZdHru4bs9tKoxhr45PA+aY2rPAPObJyrCtmlmFPmpqJ3/5D8740gTA5RT3CNyQstOst+3ZtWgGvCgs8dRxnrhII+6gxgLy44ZE1vZV/7A8tAlRPWPCbyowWrAsxI4GQyYwtXawcnepE3c5wBex1+ODhPg47JMKMXKmf5BW9wm9WG9HR5D5ToqHN6WBkTPnUkcLyWmtSbSObusZ4ZgPywl47b0Os+fLGR8tAiVmR0Xhd4Tq7Fik+gPYzL3XVxzxJyJwvdThekjnckvYJhi0djiIw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(7696005)(2616005)(956004)(316002)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 R4UTUSOA3d+W/M9s/fvbaacX1bvTg7c3KUZH0HCPI6mqS3E9h6yd24rNZlv+nb7lb3vvEWmiAsgoEo/thEI5F7pZv0mFAQNaTzhAcUgmisVjc2GZKetElXhhgfNERlWDmetZuPrS0S+MWFHs5cqTdvZdh4AVpPHzlvZSgd4ETapJ7MnD2DuR6u/iJo5AJzc/kbYrfa/dFv77xnq0qWZkCXebdxycy2vs9m/Tewmkjz+fuQWSvTWE+c49oi3Ob0YlnZwW3FdZJiX2qhS/BVSvU9qM3OpTq8O1oC2gPED5SgXLBDrvJHImPMmcITrsvhvd71yzg1TtcOiii7PEU9fzve8mPQ/MMqb/t2kUyd6rb1cf5NUOuP/SNoE+nrEDIh/VPt1AdW9ZlXXdn6qclKKfCmmwRyhQS2f7bLKfau4CKE96mFZfW50NVBxkS5g9yrUPa7UaNVlHgbQCTSv2OFsFQUGNRrF7O3OZTehVsxrPTtQRPjzUYi0YXDGf4SiLQlezmLXQEhifwKB7kzXKRThvneCebmp0P81eeKM8R1nLx0ohdHfX0pogOgwd9PtDCFXAvwULGlZqE2IPoDozMXCJ606aysAMnp5GEKZh8mPlIiumuKClbCf0vhu4vSdfz/EsnorkR9GAu1FX3rxef7DR4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f8fb26c9-1bd4-49d3-ecd0-08d83f988a78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oK4wCv6oc3ZJn6hSW8n1/xpWK7F5aD+EkzYGlhWu+SllGAjqQ6OQeFO0BfNBdYpDMaCFp5vGvn+2OCkbgWSmfXImUp/Ol3uVIgJI4ok59rB237Y6XjsiinPjTxYyMqQQswF1zlCzH0fvtVdSCSVC2gzdsYONAkWG6NhljJRS4K8U9R+LBYjOYnsMHw7ALHF64RtmLtUvZch36S7q/hVLRh7rtVdVDUC4+ve6tAc/A/aoDFOEsmC4JmH8mED8rGOlP42dDGMOsdZzoWi09mZhSN0ZDfmBmcSwBf98dO9moqaMgeTdWpeD9peqUbk1kAENx+/cfm9PGsd50+UjYkfQvVqc5umUwm6OKeBH90naLZYSqGEy2+8re+Ecvh5Tv+eL9BGMg7RjRcDnXDaUTwMYqg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(70206006)(7696005)(5660300002)(186003)(16526019)(36756003)(36906005)(26005)(316002)(86362001)(336012)(4326008)(70586007)(6916009)(6666004)(1076003)(956004)(2616005)(6486002)(478600001)(2906002)(47076004)(82740400003)(8936002)(356005)(82310400002)(9686003)(81166007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:59.4297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548296df-60d9-4b04-0f96-08d83f98924b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3169
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit enables lan9115 Ethernet in the v5.6 kernel
as a machine feature.

Change-Id: Ib8e724a64b24db3048a2b12973824bba9f3eecc4
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/corstone700-mps3.conf           | 5 +++++
 .../bsp/arm-platforms/corstone700/eth_lan9115.scc         | 4 ++++
 .../bsp/arm-platforms/corstone700/lan9115.cfg             | 1 +
 .../recipes-kernel/linux/linux-stable-corstone700.inc     | 8 ++++++++
 4 files changed, 18 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
index 28d7050..88ef5c1 100644
--- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -4,4 +4,9 @@
 
 require conf/machine/include/corstone700.inc
 
+# default feature used: eth_lan9115
+# add the following line to local.conf to disable the feature:
+# MACHINE_FEATURES_remove = "eth_lan9115"
+MACHINE_FEATURES += "eth_lan9115"
+
 TFA_TARGET_PLATFORM = "fpga"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
new file mode 100644
index 0000000..94cb13e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Ethernet feature using lan9115"
+
+kconf hardware pnp.cfg
+kconf hardware lan9115.cfg
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
new file mode 100644
index 0000000..cd77ec3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
@@ -0,0 +1 @@
+CONFIG_SMSC911X=y
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
index 63f48df..95a8bab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
@@ -52,3 +52,11 @@ KERNEL_FEATURES_append_corstone700-fvp = " \
                           bsp/arm-platforms/corstone700/eth_lan91c111.scc', \
                          'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
                           d)}"
+
+KERNEL_FEATURES_append_corstone700-mps3 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'eth_lan9115', \
+                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
+                          bsp/arm-platforms/corstone700/eth_lan9115.scc', \
+                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
+                          d)}"
-- 
2.17.1

