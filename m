Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.87])
 by mx.groups.io with SMTP id smtpd.web10.35316.1610377745839317534
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 07:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=F4ksktnf;
 spf=pass (domain: arm.com, ip: 40.107.21.87, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN6ZubUhkl31TrSL+yHOcDZvEGrChkISWGFFz7+6xKs=;
 b=F4ksktnfNmw49+LXTOab7bpnv+auG4AJuMBozXgq1nb9lhZs20J5ds39QYY8A1qqNdjGLW569Xv2Kwsx//m69Inkcw1jpBHxTe6sjHvKXtHPCkn8cRZ7/UfWXPvHikyRN7MciMegDLxC7CSEpZhT1qIwMfyM2Tj8b/sze16brZk=
Received: from DB6PR0402CA0004.eurprd04.prod.outlook.com (2603:10a6:4:91::14)
 by AM5PR0801MB1683.eurprd08.prod.outlook.com (2603:10a6:203:3a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 15:09:03 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::df) by DB6PR0402CA0004.outlook.office365.com
 (2603:10a6:4:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 15:09:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 15:09:02 +0000
Received: ("Tessian outbound 587c3d093005:v71"); Mon, 11 Jan 2021 15:09:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f2c7f65c9b8efad
X-CR-MTA-TID: 64aa7808
Received: from cc4ff2fbaaf0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 69541EAE-234F-4A98-B88C-ED7420367014.1;
	Mon, 11 Jan 2021 15:08:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc4ff2fbaaf0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Jan 2021 15:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIfmmxB1Q+BTZbV4/qRu1TDI6AYYUwJ2aFDrghjGtRaeGKsfpfbq1vOifHCvbXGGWPWXIxE5Jt4XFMK79Dc8+HpKGxeOuYd0l17dL6D2jzIOEyBGIo6gHkZGKX+Nx9tFbwqN+uaESuwp9H//fiHnYrSPb6WojkJ9bGh6nfCc/ExXTIhmineBRBhTyTLF4zYZyxBKcy6A8AszN7Q8GnJc0UU32nRoqxpaObnRE1r6W3HVJKAQPIBXtGqqHZdQv5gC8mAl7HMbsrhssa1huMnWxuYkqB7eo5YZUTqe3IJRegURAt6ZCAeFEpw1yeh/hl6qUKpVBwE72iXT85ctBI4k2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN6ZubUhkl31TrSL+yHOcDZvEGrChkISWGFFz7+6xKs=;
 b=iCVvNoMIqLQmjZCAPg3n5ohcA7mw8dIqWisugIEn6BE8Pmd3vqPkEtKhYjjXMFG1dYSpaH0aHgyqcSXENWSn4VphEJcfjsgw013vu9uwmXG1V+K3azJ9CTzoRScgBM96XPOjI4zFX2NVgJU34UHEjz54YYGjqd5ZifmI5G0XHFgG7PxqRzFWmNvZnAvPce/3unEHZlNAcCD2ZuO82P4TxryWjX/H6SJoKDxY1iSN2niYIwSo/P2Lguou9ERuLL+HMaaKMWHUfHY/qO5KYyr80F7vLkAYt2CsHMd+47P+0cBl4hZ3y16D/BIYJcT6tlnvq5XQRjdXO/75PgSajckxBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VN6ZubUhkl31TrSL+yHOcDZvEGrChkISWGFFz7+6xKs=;
 b=F4ksktnfNmw49+LXTOab7bpnv+auG4AJuMBozXgq1nb9lhZs20J5ds39QYY8A1qqNdjGLW569Xv2Kwsx//m69Inkcw1jpBHxTe6sjHvKXtHPCkn8cRZ7/UfWXPvHikyRN7MciMegDLxC7CSEpZhT1qIwMfyM2Tj8b/sze16brZk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1617.eurprd08.prod.outlook.com (2603:10a6:203:39::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 15:08:50 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 15:08:50 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/linux-arm-autonomy: apply runstate fix to kernels older than 5.10
Date: Mon, 11 Jan 2021 15:08:43 +0000
Message-Id: <774e38d247b9c20e78133a64e8216748596f44d0.1610377554.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0462.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::18) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.52) by LO2P265CA0462.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 15:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25c6eae1-e832-4080-330e-08d8b642d4ed
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1617:|AM5PR0801MB1683:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB168389E3A60AEE51EC81BA0592AB0@AM5PR0801MB1683.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mDNQ0maWgXRysbTpwcrSgzeCwUctE+o3QSvzwwl42lVe+aTwjlWksr5x+kJdtX4kObldGI4caZfGmtxKQXqKD04Yeaq3A0jRWBGOJcGTbqYe7mSizljTMUycYUqYW9YoEcjEtEM8uTsvI83CXkPlr6WIWF3Asjz4qeJTFlHKstSGzvh+mmTg6mpZU5vKoKZCBTF7g/CUrXIlDcQHzfgwIMbr6kKYrjPaNPQaSvf8HkIEOaz1tpqxC/VllqN+cb3InbO98WGDE07n4cJe7YpTtX/FFsq1c1Z5pqSYTfdaa6Xv+elYue/r1xQ3L8wKXNjzuIAYHKFRy3MD5/DQbPQDdDOdBYsmdA3QC3Z8zWHUHx4PpFWoOCB0qtd7io6CPsvuayYdoIM0l9VEt7anVeUPTw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(478600001)(36756003)(44832011)(5660300002)(2906002)(4326008)(6666004)(2616005)(66946007)(66476007)(66556008)(6916009)(8936002)(956004)(83380400001)(16526019)(186003)(86362001)(26005)(316002)(8676002)(6486002)(52116002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?CLZLPtEhWsieqgz7DaO5dm0qR7qHrolb6pbyT5eRqbcrzCEVWQMWH+JLZElf?=
 =?us-ascii?Q?vcrHEw5HqT1/BSDQo0YaiNrFJubyxnV4A/Xn+ywdJGylWy03+CP4oNLfpDHb?=
 =?us-ascii?Q?Gitmdw5Teo6olKC2Y7ovvved1IV+0+5OjBIQ1G/a2MWld/EepOb0IIHKU4Eo?=
 =?us-ascii?Q?gIOwQgYzsyqjRoIgLhfpZOigaix2DYMZJGrZvOOX8sJeKdBQ56KuY0Tyygta?=
 =?us-ascii?Q?O6cEfN96IDi5wYbOgrD4pjX00rV9Zrl26xkSAYCqMZX70glGmJCQNm004mTu?=
 =?us-ascii?Q?XoES6YIoB94w3FTgZ2kHtbOxEAniIC6WYZg3/jI2hWb0PSrAAOmRBhG6+ki8?=
 =?us-ascii?Q?BwxYqBERIAJTvCo6b5WUntyWBtlZxd41CrVgBsofMREFMTapFf9adUmS9PjF?=
 =?us-ascii?Q?A1Lz/vxMmbm960aKfVGZM7q2HjlY3nKzNDjZMpI65sB98HOlz5aZurMTg7d0?=
 =?us-ascii?Q?Lsswvlp8UeHqEqNp/gCJ3i1gUukSqXw7MARCYrL/IlkISvmRhv+DDAfcSfXC?=
 =?us-ascii?Q?5uDB48217xxwIxIat2tj3b9YYevR2WxIoXiGrRI86OXM1/xyg+9YSpO4HcrQ?=
 =?us-ascii?Q?zk6RxoX9PTvjc2YRXFp6eFckKoitpIna3LrPnmwucOch6cA8PihttMLHrQwW?=
 =?us-ascii?Q?IPcovw6pLBW6JhiPF52XBmZ8RRsqV4eNdw+11B8QAUERa3blGbxELZ/KCODc?=
 =?us-ascii?Q?N4oiCJv4Y2U3c707U/EfBejLkSJYXJuRhnhda1qplP7M0+QIeDBZKVZnBVY4?=
 =?us-ascii?Q?g2tynYxtK/obXbioqMEdjhUzZ73AYSekgVDprJAllSTNY+h7I0pU25llh+Ot?=
 =?us-ascii?Q?lDMqBa3AiNYBH4FqcgzukYnFm2kAzPTtlJuLMSp1GcqCTkiuC3UEgbPdgIMU?=
 =?us-ascii?Q?lbhVBKEicogZfvLfxBbwxt7uilEDvKPWF4qtWcvt++SsvL2NQqW1/BlRwoFO?=
 =?us-ascii?Q?I8+GAycyy0kSLOEq6eecAExYlp6VQqeK1KzOlAki9NT+ol5IWDawbW/Zw76u?=
 =?us-ascii?Q?wRHN?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1617
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	485de2ac-fec1-478a-e6c0-08d8b642cd46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c7s/hbLoTHL4YF+H5GY3uIEuj1ntrwYlsQrFMxzI0ACQQPTIbadNCU7fMoVIYWAf5BB9B3pwuOHInDVdBndAszfPDGfZ1nmnuCDHlKhcGlvxsjc0x5EuYzojKwxQ+7SZJaQVX6LXiUp9RIVtaqSHRafCCJiGTvq9XzXfcA7vOMGzVBFMVqU3rbAqW1HSonk0gL590jD/WmHmRoI9R+f/Ly2R9eDMFbFRWv/oVmH9a3P+wttO9FIW4oMITSpaSpkMs7fzTjz8ZehAuQNRK7vwNp1OJPVSpObmeDC0nLxjDVpyckS4zD1aAKXR7+oHolWHU3KLQRCk/1l3Plq8ekUnuWq8CNr9KinBQqJ5rwtmwGuCN9eLvjxzCamzQb6sxIO6DeNAfyDqB5LNvdr9x/JLs69+J2HWaDMKD57I+vNjkxriyHk+utmjlLjS/aFJn/m0EkaEGWBYuJP9Yvrqp8n2u69Uts1WTZ0Pw8Nx4T3wgN70ittUY82NUMpImSuGf68K
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(47076005)(956004)(4326008)(7696005)(186003)(6486002)(8676002)(316002)(44832011)(2906002)(6916009)(478600001)(8936002)(82740400003)(81166007)(356005)(6666004)(5660300002)(336012)(83380400001)(86362001)(36756003)(2616005)(16526019)(26005)(70206006)(82310400003)(70586007)(34020700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 15:09:02.9266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c6eae1-e832-4080-330e-08d8b642d4ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1683
Content-Type: text/plain

The patch introduced in 82ffc86 is a backport from the 5.10 version. Hence,
just apply it for kernels older than 5.10.

Change-Id: I6f442f540913b5e24bea533a436b4a3104d098e9
Issue-Id: SCM-2033
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../features/arm-autonomy/xen-common.scc               |  2 --
 ...-do-not-setup-the-runstate-info-page-if-kpti-.patch |  0
 .../recipes-kernel/linux/linux-arm-autonomy.inc        | 10 ++++++++++
 3 files changed, 10 insertions(+), 2 deletions(-)
 rename meta-arm-autonomy/recipes-kernel/linux/{arm-autonomy-kmeta/features/arm-autonomy => files}/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch (100%)

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
index beee091..f359d8c 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-common.scc
@@ -1,5 +1,3 @@
 define KFEATURE_DESCRIPTION "Common XEN (Host and Guest) configs and patches on autonomy systems"
 
 kconf non-hardware xen-common.cfg
-
-patch 0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
rename to meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index c5cb66d..89c9fce 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -33,3 +33,13 @@ KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
 # Add Minimal Kernel Configs for Docker runtime
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
         'docker', 'features/arm-autonomy/docker-minimal.scc', '', d)}"
+
+python() {
+    from distutils.version import LooseVersion
+
+    kernelVersion = d.getVar('LINUX_VERSION')
+
+    if kernelVersion and LooseVersion(kernelVersion) < '5.10':
+        if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
+            d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
+}
-- 
2.17.1

