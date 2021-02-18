Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web09.9235.1613665034004072788
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 08:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=juNsC2WC;
 spf=pass (domain: arm.com, ip: 40.107.15.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9am23F6uvP4FWxhJ+oHD9PcqKigSsbg9dc9oJgwb80=;
 b=juNsC2WC54W0oLfmlkqPyMJVcdUEScUiE2xWYAwWP5M41aUsmN59+/PrUU6scMp5ZlZqVF6jt5TIHMbfMYgXiL38yfd5JUP4X04enqi/SwD9oS3dC2aEHlX5XvfQxSb4aBAv2GjUAN+uWjvfEmKRZFP5Ol1rdywWfNPK7TPvzzw=
Received: from DB6PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:4:29::18)
 by AM0PR08MB3219.eurprd08.prod.outlook.com (2603:10a6:208:60::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 18 Feb
 2021 16:17:11 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::6d) by DB6PR0202CA0008.outlook.office365.com
 (2603:10a6:4:29::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 16:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 16:17:11 +0000
Received: ("Tessian outbound f8d85101260a:v71"); Thu, 18 Feb 2021 16:17:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40d59dde622f2d5d
X-CR-MTA-TID: 64aa7808
Received: from 01a3e61fd269.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8D05DC36-6BD1-43E6-A05E-1A4D6B1971E9.1;
	Thu, 18 Feb 2021 16:16:59 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01a3e61fd269.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Feb 2021 16:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CF3NcYDKCb+qjPBEdMnn7VAtVHjpD5bJqpXTtcn1xECmPLMz6vEs73HbmdPK5E/s8O6bhyijf+MbVrj+a5pu4fcxYRmGzddCQv5uwD/9Yow6I+CzqXgmoaAZkc7PcoN27VCSS73pQLA8u8Ojh6zEDP8TCxvS0dtq9rTChmBGT2PfJotHAtOhn50X+Csp4nUm5xxzjap2JC6hTDbcbjhf5tzKKJNuF7cZ3uDaRpIpxCmIFY6yIDeyFVIwinludr52Ci68Vm3LFlnF9fFLuPFf1qwrC1HRREE9Z09eKkUP5kQcO1p6UpR5VtX75XiP57OnTqi/65SP7Qq340aHvlTFRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9am23F6uvP4FWxhJ+oHD9PcqKigSsbg9dc9oJgwb80=;
 b=cFKPwqa17g+esPiAZspWBYFukXi/gXHCgf4Fdhh61eOldm1zr0kmQh7G8NFYhVSQW/qZ+Z//K1XU/lX8DttuenZ71+sV7IejRZT8HT/zLCqgmmFBkvTJ9iVe67MerL/1dD3+wxshxYguwEGSIgtB08xv/Jhul9maJvOi/l+N3a/aPePdmWZKikHdKoc+WvowyeQgNGD6qTkHMSnTbaTvOXRf8yWsbJTvaqqwHSHzRf8FdMCFJbxYbHieLh9aDulqVqqrlCnhbpJKLutfzRNv8XlgUHJHblIuca+vIyNVyR4o8En8ca+TUsjmt+kesSRoOzN26Semrqi3tb8U/XdWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9am23F6uvP4FWxhJ+oHD9PcqKigSsbg9dc9oJgwb80=;
 b=juNsC2WC54W0oLfmlkqPyMJVcdUEScUiE2xWYAwWP5M41aUsmN59+/PrUU6scMp5ZlZqVF6jt5TIHMbfMYgXiL38yfd5JUP4X04enqi/SwD9oS3dC2aEHlX5XvfQxSb4aBAv2GjUAN+uWjvfEmKRZFP5Ol1rdywWfNPK7TPvzzw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4296.eurprd08.prod.outlook.com (2603:10a6:20b:b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 18 Feb
 2021 16:16:57 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 16:16:57 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [gatesgarth 3/3] arm-autonomy: Fix xenbus probe for guest kernels < 5.4.99
Date: Thu, 18 Feb 2021 16:16:51 +0000
Message-Id: <499ac25a313371973a3a03f9039a1de4548324c3.1613664627.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6241cb3cdc3684df1c5b8542c4b5aa7cb44bd3e3.1613664627.git.diego.sueiro@arm.com>
References: <6241cb3cdc3684df1c5b8542c4b5aa7cb44bd3e3.1613664627.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO2P265CA0182.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::26) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.55) by LO2P265CA0182.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend Transport; Thu, 18 Feb 2021 16:16:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a35c3f0-7917-45e4-cf1b-08d8d428a589
X-MS-TrafficTypeDiagnostic: AM6PR08MB4296:|AM0PR08MB3219:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB321910EB406CF5D5F6F7B8F892859@AM0PR08MB3219.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RjV7bQ4U6AIq5qFlq5XdZU7niP3jHeesUPKUesEQ70oLFdxE9Dd88kS068cik2baR3nhnL9FEfiHAppjj2trMobHsdqd8sTnbpECtoeIJdPzMV9PNcrstD2yp5wNn+XRyI4P7bqIWHldDB6KkMNKusdr2a9H5s1azT+YO0FaLD9cRVY+vmoimjDn17zbQ0yQpFLLX9gyXm3gFjvAvQ1kLIo4HRfXY8PDaODcqH3zA+63pJlDqGe6GOlku82cBGVlk7DGuh37VXbLH/6uIoSmHCX7Iq56Y2bbT8FGvZcZaUFKHKGT2D/NqU2A++4xDHrc3cK/y3OparzuNzpkeQ0oOz7Nx0gmi7VNwggElRAhJC7NC6iemvf+0/1LYr1BkzCzOHePhni/xikIoYR2PIHvt+IE9fUW0bnP4ZjcjN9GQOqGPOlOG0N+SlPiHI5URejNp6OB57fpNM5Cleu7dTzRq6meA7Pz/F+N6d/aP0MPCIkNicH2knIZUyKusK1wBlW/0eEhjuMGJFUbiPgtrMW/jC5QfMAYdyQcH/qvKhK+Nu92t9hhMdClrDd6KHIfnPy7C+/BL7mCkr+G8LL8NJskP6R0Z7cqRIptyGVQLD9b8h8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(966005)(956004)(2906002)(44832011)(66946007)(86362001)(6486002)(52116002)(2616005)(6666004)(478600001)(8936002)(83380400001)(16526019)(186003)(66556008)(7696005)(66476007)(6916009)(26005)(316002)(36756003)(8676002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?QURw2fP5icnlUpotmjPG1cKaANPmKnEzLEIJhHb4131DGJZgvCigmgeJBhar?=
 =?us-ascii?Q?C+MMiGmabMiqNr+67+xk1j1zEhrJp2mFv4/m9QnsJMVu/DKa/5CpoVsxJhhg?=
 =?us-ascii?Q?jsmA+Vwe32mzrEBs8HahShTJs3wXYbkTLxmjaoanPQ6H3EzRIX3uSoofkacx?=
 =?us-ascii?Q?fGtqdMJ9pP5J339xuBSOnY9CWPFCKr0fBnhYXZWZTp1i0zMVYW3P9YyoGuUX?=
 =?us-ascii?Q?uhtk0o8eV8ICyYRLjAr7XlEE8SYtQa3DswJiKHyXNcZ7aNni2jt0fsD4Gjfi?=
 =?us-ascii?Q?GucM3UD2KrbDweAKaAg8Uas82LrzitQYUNRzt0DYaDkl0HfHDBpe+RGgDDJm?=
 =?us-ascii?Q?czEtd/bhTNJKZHuNvsHcsU/D/8MfJHcQI+5RPqn3NVUMO1DRRu0fOYSfXBIC?=
 =?us-ascii?Q?v92HoWvcUH3kOIcalLKJzkaPt28y3qlwkucbapndzeeDErIKiajy6YoNwErG?=
 =?us-ascii?Q?ILg/0x0wKsqLlFH6YoM6at4rh7fBcTYfxHWyWiK/hf7NQjO7GA2t0MCiBoQt?=
 =?us-ascii?Q?TcANKyqL9aNBK4UqdX9tU9EnuMLXOzeyuVKTOJOjwdNwwXmZmIne9dugC/XH?=
 =?us-ascii?Q?5eJWYwkT53p46LqCeydQadnRZ6Qubea2/Hh0H3qMYpepvxG2+BjXcD321XCU?=
 =?us-ascii?Q?5p/YwAUWtCnNBkbnWGhiOyVnFSVkQQANaWZX2tX/0/XShQZkVPaup4ATC7B0?=
 =?us-ascii?Q?Zsv19ZufemqI74kerVHtcQy7URrMMPK/oX3WfGoCiN75YpEFEh9TdvTvYri+?=
 =?us-ascii?Q?RTlxIle+KNjm9Wkf7zHKjKwFM/Z9qRGdVEnzOU6JC2zB8uZ6L4SacoIB0IyH?=
 =?us-ascii?Q?WjK6xXxMz17t0oEBGkGLamYnyRTkCMcVoidS7Wi98wSWeMraSs/c33PPNwRS?=
 =?us-ascii?Q?JX/CflwRRGc8Fi1f1VC93yu/nuDk8OBS+F7bnCX5OKewgf6CpVeso4x4jcYx?=
 =?us-ascii?Q?RH2BlwUO35WipqzVC06YyfZlduwmTeHFv3hKcO7lt77MHnVDeepCqdw4qEBY?=
 =?us-ascii?Q?1RKDkrVORryl+D3AzB6wlFF+I8KxWyRRpQ9Qi9Ea/KyHZMAoueiDtDw/EbDT?=
 =?us-ascii?Q?yzeWT09M9pFTgFYo7yfv1eCNlNw8gWcIb7VIuZQU8EQw9XfmBNwR+iG5XMnb?=
 =?us-ascii?Q?/UMmn49zEu16A1TLwIpVuZmbr6OSBGIOLKSt0CYqMAJ7ftY3nuEtKEbIuiYx?=
 =?us-ascii?Q?/wj+YOOiwsZih/ycB1sIQJvQ+wdzoF1JJgJM+A3ApKUuFa5EyyjZvAfBGxy/?=
 =?us-ascii?Q?do0zOrOeUZ7+tV4jIaQdGpE8lKBN2tvzXjQfw7mDbYxEQWFaCKx/BuxI/J3b?=
 =?us-ascii?Q?Z1z0/2CcX7Uo6nIlp/9RTcX5?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4296
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f4e23930-f95d-4df5-23ce-08d8d4289d1f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9MJOnY0V2ZPnwz7Jd0tFHitvt27OwjExxzC/lZUubMKINmKr7O7/KgvVE5xNWVKRO1M1DL22Y9BJzbR0WS2pvT8rc+TS33fuM+Zw6StSrLJLR4pd6ur/vms3u3nraiUNlVbV2A6Icw9k7QZCrv6c1K+FdKgPNW1q1bUSt5m9QlMZhBbXx75jnLI8JAPr6ofcVTHKrWevymW9u/1K14R71XUKiFxmtzeI1YdkjK/fDTEDTW/kTlNHvJAYBM3YCv/WGqkkIXLvyQmHXt8Y6aYvTEkqD9Yjxh1Je4mA9CKsAEKHknYAkSMrm81ZGJVdOGPLeERuVQPOP8Cy0fPS/ZfXib6CbeE8y0YuDrAJX8Dv1KxjmuxHTryNLn09wDozcmDs4WKE53xi7Hc2Sm7WgyA1evO69hYKNLtwt73h62TpjQQBYXIL7xQosc+1HmyJccLGh1wpzrC09NsxX3wiapU3qa698OuojrGGi5QKQtqmujtM8R3Kq/wE2JICmuKmu/+wpifXDhsdTcRa6o2v7ncwMrqdJdSo1Vl5gUyKVBZ6HCUm7t1+6i7axbsX0eg8A2VF+l7mUrgdXs+hLZKu5h3ekOC78lipUymfifEuj9hfAU7Dc/y/PrSORw7kLzIjor4QK124nfo7lRDRRaidw9FZmxlAAvpqH+UXv3PFxaRVsSe7NRQIx+wHQpklV5FCLhgq7/D4yiWqAsJVsN38r8FvJpH5M1PULEaZW1lxpSvvKfk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(36840700001)(46966006)(82310400003)(26005)(36756003)(356005)(956004)(81166007)(83380400001)(82740400003)(44832011)(70586007)(8936002)(2616005)(6486002)(47076005)(966005)(336012)(316002)(8676002)(478600001)(5660300002)(6666004)(86362001)(36860700001)(16526019)(186003)(6916009)(70206006)(4326008)(7696005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 16:17:11.3897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a35c3f0-7917-45e4-cf1b-08d8d428a589
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3219
Content-Type: text/plain

The arm64-autonomy-guest kernel from commit a09d4e7acdbf ("xen: Fix event
channel callback via INTX/GSI") are hanging at `hw-breakpoint: found 6
breakpoint and 4 watchpoint registers.`.
The arm-autonomy-guest kernels older than 5.4.99 need to backport the
0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch in order
to be able to boot.

Issue-Id: SCM-2151
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I56c558f518336567eadd5dc69fd9334c23b19cd8
---
 ...obe-xenbus-as-part-of-an-early-initc.patch | 95 +++++++++++++++++++
 .../linux/linux-arm-autonomy.inc              |  5 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch
new file mode 100644
index 0000000..c38798f
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch
@@ -0,0 +1,95 @@
+From 18d691d837b340c941ad778bc8dfa77446e48bb4 Mon Sep 17 00:00:00 2001
+Message-Id: <18d691d837b340c941ad778bc8dfa77446e48bb4.1613579395.git.diego.sueiro@arm.com>
+From: Julien Grall <jgrall@amazon.com>
+Date: Wed, 10 Feb 2021 17:06:54 +0000
+Subject: [PATCH] arm/xen: Don't probe xenbus as part of an early initcall
+
+commit c4295ab0b485b8bc50d2264bcae2acd06f25caaf upstream.
+
+After Commit 3499ba8198cad ("xen: Fix event channel callback via
+INTX/GSI"), xenbus_probe() will be called too early on Arm. This will
+recent to a guest hang during boot.
+
+If the hang wasn't there, we would have ended up to call
+xenbus_probe() twice (the second time is in xenbus_probe_initcall()).
+
+We don't need to initialize xenbus_probe() early for Arm guest.
+Therefore, the call in xen_guest_init() is now removed.
+
+After this change, there is no more external caller for xenbus_probe().
+So the function is turned to a static one. Interestingly there were two
+prototypes for it.
+
+Cc: stable@vger.kernel.org
+Fixes: 3499ba8198cad ("xen: Fix event channel callback via INTX/GSI")
+Reported-by: Ian Jackson <iwj@xenproject.org>
+Signed-off-by: Julien Grall <jgrall@amazon.com>
+Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
+Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
+Link: https://lore.kernel.org/r/20210210170654.5377-1-julien@xen.org
+Signed-off-by: Juergen Gross <jgross@suse.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ arch/arm/xen/enlighten.c          | 2 --
+ drivers/xen/xenbus/xenbus.h       | 1 -
+ drivers/xen/xenbus/xenbus_probe.c | 2 +-
+ include/xen/xenbus.h              | 2 --
+ 4 files changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
+index f45bff158fc2..57dfc13b2752 100644
+--- a/arch/arm/xen/enlighten.c
++++ b/arch/arm/xen/enlighten.c
+@@ -370,8 +370,6 @@ static int __init xen_guest_init(void)
+ 		return -ENOMEM;
+ 	}
+ 	gnttab_init();
+-	if (!xen_initial_domain())
+-		xenbus_probe();
+ 
+ 	/*
+ 	 * Making sure board specific code will not set up ops for
+diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
+index a9bb5f91082d..88516a8a9f93 100644
+--- a/drivers/xen/xenbus/xenbus.h
++++ b/drivers/xen/xenbus/xenbus.h
+@@ -115,7 +115,6 @@ int xenbus_probe_node(struct xen_bus_type *bus,
+ 		      const char *type,
+ 		      const char *nodename);
+ int xenbus_probe_devices(struct xen_bus_type *bus);
+-void xenbus_probe(void);
+ 
+ void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
+ 
+diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
+index 786494bb7f20..652894d61967 100644
+--- a/drivers/xen/xenbus/xenbus_probe.c
++++ b/drivers/xen/xenbus/xenbus_probe.c
+@@ -683,7 +683,7 @@ void unregister_xenstore_notifier(struct notifier_block *nb)
+ }
+ EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
+ 
+-void xenbus_probe(void)
++static void xenbus_probe(void)
+ {
+ 	xenstored_ready = 1;
+ 
+diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
+index fe9a9fa2ebc4..14d47ed4114f 100644
+--- a/include/xen/xenbus.h
++++ b/include/xen/xenbus.h
+@@ -187,8 +187,6 @@ void xs_suspend_cancel(void);
+ 
+ struct work_struct;
+ 
+-void xenbus_probe(void);
+-
+ #define XENBUS_IS_ERR_READ(str) ({			\
+ 	if (!IS_ERR(str) && strlen(str) == 0) {		\
+ 		kfree(str);				\
+-- 
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index bef56d2..77cea96 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -49,4 +49,9 @@ python() {
        and not pn.startswith('linux-linaro-arm') \
        and oe.utils.any_distro_features(d, "arm-autonomy-host"):
         d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
+
+    if kernelVersion and LooseVersion(kernelVersion) < '5.4.99' \
+       and pn != 'linux-libc-headers' \
+       and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
+        d.appendVar('SRC_URI', ' file://files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch' )
 }
-- 
2.17.1

