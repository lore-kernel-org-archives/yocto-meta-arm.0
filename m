Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web12.5204.1596804160497008346
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uu1zSZtT;
 spf=pass (domain: arm.com, ip: 40.107.20.48, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJr0KzC5I33s3u7X7BlPgPFY+Xbuer1oyVIdo2v9qFo=;
 b=uu1zSZtTG+KlGuy87VoebUISO7LS+/0lUddMmq2zfbvZIQwajXTlqX6ADw6XyckHoqp4iqLeg1sPZBw+BU3bx9cdw/60Hr5a022yz43biTLUvk2vnLPnT5jHIG0zgJ4ol41BzIHR1XM/cr8194ZWIHlqaDmew/qAG5P9YRk5ydE=
Received: from MR2P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::18) by
 AM5PR0801MB2065.eurprd08.prod.outlook.com (2603:10a6:203:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:37 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::b6) by MR2P264CA0030.outlook.office365.com
 (2603:10a6:500::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:37 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Fri, 07 Aug 2020 12:42:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82989ac15d25aa8a
X-CR-MTA-TID: 64aa7808
Received: from cfed99975a3a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6B88C0A0-C15C-4673-A917-802E79C58EB5.1;
	Fri, 07 Aug 2020 12:42:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cfed99975a3a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZevebzdobMXqC8QPtyAmCeN9oai4X0KEGOhFudxDhtenN498p10KLSXdZYgZzm27uJMzAHrO4kLYH9Ibva1Zqgvbh8QNvfJnb8q+Z13UWhKmbngn9sKccPg0lIxXo4mVOflRFiYO+txxjMpS50Gj6X/2OqY4KSaN6xH+/6lu4FqydquNHOnh3y1P/0qhY0pj9LOV/ZjH7YfMv2STmIZsFFLaPpMCzOMSa/VnW6nTxDhean6nn9cSZgmz6rZtM6aOrmYtwxqVTBHxpK/DEaZsnIx8Uk3y44lpzylTNK3mwVnyO7NFWM2nVVXIef4wE3CnQ751m6G2x1vBvNcc4WVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJr0KzC5I33s3u7X7BlPgPFY+Xbuer1oyVIdo2v9qFo=;
 b=BkoLQpvfZDQEJJgOH/TZTQ7OrqYQHhFsJIvw/ISNvLiV4UIMlWvyXwXmCLSCHJ+VH0edD9jpdAcXOoagl9hZds9Yf+4SNw3PF1B9yyku/HQ2zhk5jhYst7LMlQDlfwl66yqw0weAX90Si6wLEQ5Owc/z53R9aWxxdCRW/T06p1KdGwnwChXmBHC9bxqENL2TAhjSkSY1oDL8ekw7oAc+MC2xV86hnA2JKQEBb0axevbQsA9fAzZTGhMlSahnEeHT5KOH/xaIYe7rx6/MpqFv0goC8DVq66gwp9npBnLznEQuCSRNEzpZQhAZSqBvMO6nZMOlfJjF2XKYZfl/+n5Q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJr0KzC5I33s3u7X7BlPgPFY+Xbuer1oyVIdo2v9qFo=;
 b=uu1zSZtTG+KlGuy87VoebUISO7LS+/0lUddMmq2zfbvZIQwajXTlqX6ADw6XyckHoqp4iqLeg1sPZBw+BU3bx9cdw/60Hr5a022yz43biTLUvk2vnLPnT5jHIG0zgJ4ol41BzIHR1XM/cr8194ZWIHlqaDmew/qAG5P9YRk5ydE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:31 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:31 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 9/9] arm-bsp/linux: Enabling lan9115 Ethernet for corstone700-mps3
Date: Fri,  7 Aug 2020 13:41:55 +0100
Message-Id: <20200807124155.24198-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7b16a8d4-91a0-4342-8242-08d83acf5d64
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|AM5PR0801MB2065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB20651EC71E8D9A019083A162FD490@AM5PR0801MB2065.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /A1NOtYLekYRD1RTS4IZxKcGB7jD4g+cSSwEhtN6GTQzPdxL3lYi3v5bCI/ngEYpPFkcgsgdKgbVfYSCiAgdQDOPhtjyaoD0xldNETeJAnDNxUDFUZpNkiCmrCDZcqKxVOFiNVbU8cuM/3gObO8ZjjNVfbEBI/tjbKDEEoGpabuw+Zfw/4SWm+lLeMsM0Ji2JrRAc2osrcI0GbaQuS99HTq+ma/ToaPRIvmb51RQahXtsh3tWHJOMrbYbh3M+MhuVh2w+5CT6tvo75fpBXJ+x4dI2NkozG43MRVcYgxADubAiaarH/b59Z1YVQFwTE5C7s+yBMAB6bouDidDAR3CFw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(66476007)(66556008)(36756003)(9686003)(478600001)(8936002)(8676002)(2906002)(6916009)(66946007)(316002)(6486002)(4326008)(6666004)(186003)(26005)(86362001)(1076003)(16526019)(956004)(2616005)(7696005)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 HpxHCtAM8KRBshc10egW94KsqcHvl4Y+QprdBB4UqsmyQR2FTMH6ErCE/wLW1hIU1VBBfp/NVDBQvQb1czOhg7a5zjMrjbtkg+ydFF1cBjqYt2MyAe+UUyP2N4nCXRYxcTO3BsvTomMdpHkgomD+lvN7cQzTUVHA/xjuyDhdaF/NX+HvImQabGrhzib8QpWqRa+DDdubKfsKYurYElRKOU4wYpFEeIi9I5oFIOBEDaMudgzbpUiu+wAIjsL/MOJCQyg3F+gh9tsSipgP59grolqAE2TSBHzRKgWiuHjXYa46zPlHpl0I+QZeB5COv8/eKtSqKgRU4pj2+mg0/cbb4oeEiZhT3lN5IK8RcgPwDV9e2nCXySPAzc6mmF6pZT8InVZPaXMHIJnASP26EvxKL5Oa3i7ukBefpAkyVk9SmT7KxKCQ9TLHeIP35eovTvqVAb37/twj1cTUc7Hua4nCyDdQtHhqQ2ArvTHFsArvV6iqcSsyPPd+UUvz1Uo4D6zui4Y5jYGW+6VTQPPymIkb0JGqnLmXYqJ5UINs8pkV+johs8SgttPjBCqGsvTyPg4DlBPYEe/4bCotl5ktzgy5/Ekm/VxHNfgCxMxI6NbBy1oM0WQrTfjE97hxYYnARrPAw7m0/EJAAN4W4NRyHuoseA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	92c97829-1241-4789-a567-08d83acf598f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zGbbOyG6g0aBZxV3Lw/ea9oxzdm6PF4OcMX5h4YyELtlIfTO6vfPIC4c3cq7snKtaxS2uWvbFcpkX+vqNGdyVU7qa5JW4lQA7EVKGe0GZPSOlEt5iX80F80+EvS/Bejk2qZK4Cqncv3xAHKI/SGsk2OQXcnh5J+EzG39y9AGxWYk+xCq4GgXuyKmtsYNKmwvVetgx2+ifGAYmDlEnEQYfvIkF0b+35fvYU/zRZIAIZScb5A1HYrpHmS4kQiJgZPl5vrog7ilrFD94sEYm5pwdICAWhWigbRE/va7uSb+5TTYtX3dTPaQmfWL8N/5P0xTSswaWqlisTVRMH3yDexHbH/RDkhCkyenaPGHchJz5MoqSAd3iIyjT6waXj/ANqv01XJcwqpBqhvAf2B1Q7XXkg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966005)(1076003)(2616005)(83380400001)(36756003)(8936002)(316002)(26005)(82310400002)(81166007)(356005)(956004)(9686003)(4326008)(16526019)(5660300002)(7696005)(336012)(47076004)(186003)(82740400003)(70206006)(70586007)(6666004)(36906005)(8676002)(478600001)(6486002)(2906002)(86362001)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:37.1305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b16a8d4-91a0-4342-8242-08d83acf5d64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2065
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

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
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/eth_lan9115.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/lan9115.cfg

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp=
/conf/machine/corstone700-mps3.conf
index 28d7050..88ef5c1 100644
--- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -4,4 +4,9 @@

 require conf/machine/include/corstone700.inc

+# default feature used: eth_lan9115
+# add the following line to local.conf to disable the feature:
+# MACHINE_FEATURES_remove =3D "eth_lan9115"
+MACHINE_FEATURES +=3D "eth_lan9115"
+
 TFA_TARGET_PLATFORM =3D "fpga"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/corstone700/eth_lan9115.scc b/meta-arm-bsp/recipes-kernel/linux/a=
rm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
new file mode 100644
index 0000000..94cb13e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/corstone700/eth_lan9115.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Ethernet feature using lan9115"
+
+kconf hardware pnp.cfg
+kconf hardware lan9115.cfg
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/corstone700/lan9115.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
new file mode 100644
index 0000000..cd77ec3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/corstone700/lan9115.cfg
@@ -0,0 +1 @@
+CONFIG_SMSC911X=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc=
 b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
index 63f48df..95a8bab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
@@ -52,3 +52,11 @@ KERNEL_FEATURES_append_corstone700-fvp =3D " \
                           bsp/arm-platforms/corstone700/eth_lan91c111.scc'=
, \
                          'bsp/arm-platforms/corstone700/xip_cmdline.cfg', =
\
                           d)}"
+
+KERNEL_FEATURES_append_corstone700-mps3 =3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'eth_lan9115', \
+                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.c=
fg \
+                          bsp/arm-platforms/corstone700/eth_lan9115.scc', =
\
+                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', =
\
+                          d)}"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
