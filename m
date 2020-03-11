Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web11.5486.1583924227300638477
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 03:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=od3TE3un;
 spf=pass (domain: arm.com, ip: 40.107.8.48, mailfrom: rui.silva@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LxGQTcaXSeXpx22QoiW067X0svYt3wZVCkdH76oUfM=;
 b=od3TE3unuRDIXmZXdRPlkI6faOnW4ZMqrPE4S1nZ5fNQJhfZd3JTtAgCtdQkWVNAAVbJP0vdlRJEZk6mA2Ltaavu5ULY6FdcgfTpXVcYTUsnByQIeSESpJXC1XPGE65Ox3mUyX8hLOxgiaVjT39Hn9oMAMGpS+xuS0u1fF1tOjA=
Received: from DB8PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:10:a0::26)
 by HE1PR0801MB1660.eurprd08.prod.outlook.com (2603:10a6:3:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16; Wed, 11 Mar
 2020 10:57:04 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::90) by DB8PR09CA0013.outlook.office365.com
 (2603:10a6:10:a0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend
 Transport; Wed, 11 Mar 2020 10:57:04 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Wed, 11 Mar 2020 10:57:03 +0000
Received: ("Tessian outbound 3a0cbd311638:v42"); Wed, 11 Mar 2020 10:57:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d16a24dfd9d26c5
X-CR-MTA-TID: 64aa7808
Received: from f82662642289.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 45080E1B-83F4-4994-9182-F099E4F1A47C.1;
	Wed, 11 Mar 2020 10:56:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f82662642289.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Mar 2020 10:56:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKzDN8OTm0UmhH5NQ4iODHd1HH/vL+MCboAXOtJehuLyTsIjBrN10K5janVkcZPHhRcJfylSLX1VlGBKu0OquifkY4VyeyMVABZetMHVmdX3nRSPoDom9ptTYxe2LEC5Dess3AeybLssDcTviS04HkgcD7wXJA8gXibXgBAUqmahs1pjztZlxCGfgTCQhIOAw68LKHTBaLAADBmEs7oPGCBil6kIMg5bVjEW0nzOa0SYzMxfoY7ixofc/eY22C1uMlZ9ygeABsPaLEisB3MD6c9JOGz+1FEKg4c0MrZ3XgYVO8ba62JGFGjDN4WHgydj5xeJsW/41M/XQeb9lPjt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LxGQTcaXSeXpx22QoiW067X0svYt3wZVCkdH76oUfM=;
 b=bQ+XimqvPRvk5umh5P8lUgBYkFaMIn8GfBgvUoqCQMg8eA8gAh1WIx7zfnnRShTwNfKGw90dHGE8nNiCDu8C5JzWqd+/MqLdsBw7EtgYyKyrmzij6jt1fmF+7LOK6EMdbM8Ty+0c72/4kAG5EvB78IhH7ZhZ1ypAhxnpVbd1gSKsGfmCx8ceXvHcB/VQ7rbiqKVNt6pMPZ1pa+RYDYHbfCnb/jeOnxiMviIqqvnNkQbGF1mZ/4X1X4PATboM0ndVyUf3nCrAi7U5D/aj9/LRzLd3M7y8Tt6A1NNO2/DOKwLNSs27LTyty36B4V0NSbcvGvLNruIM89UtS3zr2jqDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LxGQTcaXSeXpx22QoiW067X0svYt3wZVCkdH76oUfM=;
 b=od3TE3unuRDIXmZXdRPlkI6faOnW4ZMqrPE4S1nZ5fNQJhfZd3JTtAgCtdQkWVNAAVbJP0vdlRJEZk6mA2Ltaavu5ULY6FdcgfTpXVcYTUsnByQIeSESpJXC1XPGE65Ox3mUyX8hLOxgiaVjT39Hn9oMAMGpS+xuS0u1fF1tOjA=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com (10.168.95.21) by
 HE1PR0801MB2028.eurprd08.prod.outlook.com (10.168.98.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.16; Wed, 11 Mar 2020 10:56:57 +0000
Received: from HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be]) by HE1PR0801MB2044.eurprd08.prod.outlook.com
 ([fe80::42b:e060:9180:6be%8]) with mapi id 15.20.2814.007; Wed, 11 Mar 2020
 10:56:57 +0000
From: "Rui Miguel Silva" <rui.silva@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Silva <rui.silva@arm.com>
Subject: [PATCH 1/3] arm-bsp: add upstream kernel inc and v5.3 recipe
Date: Wed, 11 Mar 2020 10:56:41 +0000
Message-Id: <20200311105643.159467-2-rui.silva@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311105643.159467-1-rui.silva@arm.com>
References: <20200311105643.159467-1-rui.silva@arm.com>
X-ClientProxiedBy: MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::32) To HE1PR0801MB2044.eurprd08.prod.outlook.com
 (2603:10a6:3:50::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from arch-thunder.local (109.49.46.234) by MRXP264CA0020.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend Transport; Wed, 11 Mar 2020 10:56:56 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [109.49.46.234]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4045a878-5b62-4335-2d99-08d7c5aaeee3
X-MS-TrafficTypeDiagnostic: HE1PR0801MB2028:|HE1PR0801MB2028:|HE1PR0801MB1660:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB16602E56255EE99B42158515EAFC0@HE1PR0801MB1660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:9508;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(199004)(4326008)(6512007)(26005)(66476007)(36756003)(52116002)(66946007)(186003)(66556008)(2906002)(478600001)(1076003)(6506007)(316002)(8676002)(81156014)(6486002)(16526019)(6666004)(86362001)(2616005)(81166006)(6916009)(956004)(8936002)(5660300002)(966005);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB2028;H:HE1PR0801MB2044.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ijE41wm0TlX+4Ffrs4oduLhvvxV81ykXTcVd0Gjy3hS5G+AKEhf2gCr2xgCh/fxVUFx0DOKn3X+QKGUoVU0nsrBQTtMRRIqwZeon8LqKtxSw0TsH3KksT/SjEtDTnw6mti7l+5yRtoAo3cMOs95F47GwhmC28d7OFDrH3EQgH3bKjwZXdOWhWatdEGlnf/0x5ZmTGT9PhAU67lEJKnunfHuD8mJvHvgRiU8RgLDz3y8EpFO+hl0IO18NlwkL9y5j4NJswJqw9/hshDy7dgW8xUuQCu239VgFIkpCxg+bPeAmCmGjYQn8m4uDcy+TIRQD9GhvIDB/vTyjmt+cJzbnmJxrIhlMSBzNWlShcu3T2t7YZW1MWxa1tpn3jwoxIyYN9Hla8WwjjBtXXn28s/ejHYNn4dW7jxG5aN7Qa+yZCAqiuHiFoUcS3qiSAaPGgeSi6qBxIshHypARECBhZPv/yvVdicp42iqTq+c3/YAKtruhvUKhNqpr6TWFydbDRLm8aga7xtUh5+299dM/AirwQQ==
X-MS-Exchange-AntiSpam-MessageData: 
 e6UXHUhlTjxId5zd+AIz1tPkeyV0t1/BlGoAmj78Pu2IQbSDYAFDlHHm6RfADD7FwI3ZRCKwnN/5IhBOxc+df+6tXQgWnVHBG6cDIRc42TVnM6H/cF9oKCmn/xrQmDudSZNQxB3HKVLDlKVJonmVxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2028
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rui.Silva@arm.com; 
Return-Path: Rui.Silva@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(199004)(6916009)(2616005)(26826003)(81166006)(81156014)(5660300002)(6666004)(478600001)(956004)(356004)(2906002)(336012)(966005)(1076003)(316002)(86362001)(4326008)(26005)(70586007)(6512007)(36756003)(6506007)(70206006)(186003)(16526019)(8676002)(8936002)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0801MB1660;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78887038-8cab-47d2-44a7-08d7c5aaeacd
X-Forefront-PRVS: 0339F89554
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r2ZXseotcBFtKDsjjYd2oIttZ2XJnjux0TCQKvDkCLUlht4h5oqhO9hB/5iVGjVB68ekpkhwhj80EiAAdnPFLMJwuTt5l/q8WvXpb1QZD4Bi2dbCfwfgi8UnLWTmkEfms9/xCaEoUGk7+wlC42DH4fz6eTLQzEPz+fbKqBONwCYUYFzGQaT7+HpdtHZd4oDgXByIX4Uhi++M785UJxopUyOxkR3BKA6iqU3+GQfiUYGvdN8AJEOmNUy6wC4DC96Zlnk03xtmqfFnO9FnObOkwXaMGu5LcMkg1Nj4NttvPGs42WhgvOoQguQfEd9RsY5KHY+VM51AFPmiFPpLSn02UsJQIg1TNNeCXaTLmIgr231alWBhXxJhfqO4t3XAWNKZ23hZ+vDh2CpZ/NjqAhZ7mRM2GWw/x0eJm7DNjyeAIqTqPxnIGpgkWUJfaCoxrfkRbw5joox0L7GeE290hW9d/Rpuh24/thoNlgtOKWLdvQ18qCWAN5MNyJS8VoFNHY4vUyYJEMbUNOGEWsOrfkFDiA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 10:57:03.9122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4045a878-5b62-4335-2d99-08d7c5aaeee3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1660
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Rui Silva <rui.silva@arm.com>

Add support to build using the upstream (Linus tree) and as first user
add recipe for v5.3, which will be later.

Change-Id: I0f30a45002adca7c0b95a0421e0291a6852295eb
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
---
 .../linux/linux-upstream-arm-platforms.inc    | 24 +++++++++++++++++++
 .../linux/linux-upstream-arm_5.3.bb           |  8 +++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-pl=
atforms.inc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.=
3.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms=
.inc b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
new file mode 100644
index 000000000000..7b73e7536d19
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
@@ -0,0 +1,24 @@
+DESCRIPTION =3D "Linux Kernel based on upstream tree"
+SECTION =3D "kernel"
+LICENSE =3D "GPLv2"
+SRCREV_FORMAT =3D "kernel"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+KERNEL_VERSION_SANITY_SKIP =3D "1"
+
+S =3D "${WORKDIR}/git"
+
+# Override do_kernel_configme to avoid kernel being assembled into a linux=
-yocto
+# style kernel
+# https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-=
tasks-kernel_configme
+do_kernel_configme[noexec] =3D "1"
+
+# Make sure no branch is defined since here we track a specific version
+KBRANCH =3D ""
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b881=
4"
+
+SRC_URI =3D "\
+        git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;proto=
col=3Dhttps;nobranch=3D1 \
+        "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb b/=
meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
new file mode 100644
index 000000000000..88a06c4bb3c0
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm_5.3.bb
@@ -0,0 +1,8 @@
+# Add support for Upstream Kernel for Arm Platforms (boards or simulators)
+
+SUMMARY =3D "Linux Kernel Upstream, supported by Arm/Linaro"
+
+require recipes-kernel/linux/linux-upstream-arm-platforms.inc
+
+SRCREV =3D "v${PV}"
+LINUX_VERSION ?=3D "${PV}"
--
2.25.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
