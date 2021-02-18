Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.82])
 by mx.groups.io with SMTP id smtpd.web12.9257.1613664655575335275
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Feb 2021 08:10:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=alPHSS3t;
 spf=pass (domain: arm.com, ip: 40.107.15.82, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9w/bcwCJ/y2M9gnlNKvFe4yzAoEGCoX3cbULwLdea4=;
 b=alPHSS3t3HVHoULgPg8JQL1t9xBbgvdl7IKZqY1KMk/yJJdkvHiMHVp7kEAyPkj+YnPioNUnqU/fVIyymGeMc9fNHFP5nyAHH39dZX/3egD+0YKDZm7NPUlrR0pBSeTI/j9ue6tm28cogcRczkkXxqyM/9uxLOhTpNP6LuvhMgA=
Received: from AM6PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:20b:92::31)
 by DB8PR08MB5130.eurprd08.prod.outlook.com (2603:10a6:10:e9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 16:10:53 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::8e) by AM6PR04CA0018.outlook.office365.com
 (2603:10a6:20b:92::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Thu, 18 Feb 2021 16:10:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 16:10:53 +0000
Received: ("Tessian outbound af2f2718b54d:v71"); Thu, 18 Feb 2021 16:10:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 65f14d66b5a820bf
X-CR-MTA-TID: 64aa7808
Received: from f982c04ca7ea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F3B049A2-F2A5-4EE4-A660-5F6D59AEE6CC.1;
	Thu, 18 Feb 2021 16:10:44 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f982c04ca7ea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Feb 2021 16:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1JckFe8IAIjZE1+TF/2uMlFaq5k/cQZCt8Xl0KQepbLtDgUs4B82jRwITLRrUAcQ4dlaudmuZfh63+yy0gNH0DdQKRTlFBBhBbPiK1br86VoagqgS0JZtQk5fBTVJw645+6Rco4lmiF3JQW7CfF6ok00tydAT32YIfumV8oU9p9oxW2gw8KA0h9K9zEzcMlUF38KPKmSTSTPbiuIHlT0emLxGHpWJPlkRQwVJ09i5s47g5jdGgl8HNgGmH8UbOKoulWyZ0N/xdYHg7c+H+VWtEu6aQpsd0VKz+xRicpL60dY4eO/IQ7kryHDo74XQ+fu9jWjiD21SADUgj7Krxmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9w/bcwCJ/y2M9gnlNKvFe4yzAoEGCoX3cbULwLdea4=;
 b=PpwPKBmfDXFVmzZRygjI2EOL0hwz6FmVmENry1rRtzdKfpoPsdHDSEK4gM6wEfyIGcIDyLheQDkUP0Ox9VoB4a7n3aTiGhjIajrhGsvuwvRvI/nPuKlr/mZZJYfHK8amm9K7/E04tPNrag8ZZBwsFBCeAAtloC5PhecD99omvYcOENaHAjM3EDOCwi0GLWT3ubhuNNQigQysmwDXa94NKPlQQtbTFtvqQowOI/NBRnBB8FRZH2Bi/Vaxm/n2fsz9b9lxr2AQxqbEXnmuRhVaB6oefGCBRvaYN8g09o3tEWu1UM6uq8mSIODvCoha/u1VwymHdwZxDUPXKZ/C2JU7uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9w/bcwCJ/y2M9gnlNKvFe4yzAoEGCoX3cbULwLdea4=;
 b=alPHSS3t3HVHoULgPg8JQL1t9xBbgvdl7IKZqY1KMk/yJJdkvHiMHVp7kEAyPkj+YnPioNUnqU/fVIyymGeMc9fNHFP5nyAHH39dZX/3egD+0YKDZm7NPUlrR0pBSeTI/j9ue6tm28cogcRczkkXxqyM/9uxLOhTpNP6LuvhMgA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4968.eurprd08.prod.outlook.com (2603:10a6:20b:e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 16:10:42 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Thu, 18 Feb 2021
 16:10:42 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 2/2] arm-autonomy: Fix xenbus probe for guest kernels < 5.10.17
Date: Thu, 18 Feb 2021 16:10:36 +0000
Message-Id: <638e1523c752f5290d66881fd2797975bae561c2.1613664505.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <c8089ef6374d54f9946ad3e0081806ee4d8caeb5.1613664505.git.diego.sueiro@arm.com>
References: <c8089ef6374d54f9946ad3e0081806ee4d8caeb5.1613664505.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.36 via Frontend Transport; Thu, 18 Feb 2021 16:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2501904c-1936-4af0-8cc1-08d8d427c415
X-MS-TrafficTypeDiagnostic: AM6PR08MB4968:|DB8PR08MB5130:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5130C82FD5B78663516E1E5192859@DB8PR08MB5130.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AZliKH2rkYj4QcIn4PeBxweXsN3rr/kqD7WdWPP+ZGtcMpIJEgx12alH+hb8/FHASoyC7WbVkic9Gf8rAQl0I+eozWwDTRQLwVLnaGzTxQhAChMP85ZDb6TlY+gslIVff8kpSku0KLITLG6xRY0/xlMa/g65zeMpJCPxGzk9RxXldGDdEDZ9XXa7qWbhY8rTJ/kht2OqtYfqHfyaCkdiUnS71IfnQ0YIMEqQZstisLXek9aXh9K3FSV7Zf2AOJHlBzlVSdnSaqYY7Ic4hXFZQrYYhNiBGfcMMSr0dX0yduNmDwxMK6CJufvCit71G0awSERJaiKcR/RzYQn16sGO8G8WRT3ykVSsWz/qNCnKNec9jqcewQ/26xuv5iXZYvblNVwevAe+xFhWZ1Wal5FjhxvradY11d+K0P42kGU+RePd2Zrv8JnkMSeUKHu5tHHIX7EX0gMhFJSgVwdPby+Ldl9CrIW9Ef8YCtcYb+fE/RYlp04WQCReHB5+jBh7WWXHwbYHGMPHB7x31vPSWuHYsJA4TdZtT7dGLZ1/PgtJvkjSmVVk6MBqLfluQUhbaOd0WxhL4x3R/c5cE0BJN/8luSQF2nURb9usM70lOHsXBzM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(16526019)(26005)(186003)(83380400001)(6916009)(966005)(66556008)(66476007)(2906002)(36756003)(8676002)(8936002)(66946007)(478600001)(86362001)(6486002)(2616005)(4326008)(7696005)(52116002)(6666004)(956004)(5660300002)(44832011)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?yo0fJIpTAhnNwpejqhP6YrEklqOr2EaVub8J5N6tc3iiFqA91zeWZ6IWTXB1?=
 =?us-ascii?Q?w83WzU6DFKx70D8A1WrK1MqKnSWleokoXqC/QAdi2vEFrmxR6BXwJx789gZO?=
 =?us-ascii?Q?WojqmHQbjj3734CZE/j7UqmwiOZGuBKVYZ0eKr34skbl9IhRXSxwmkwpnARa?=
 =?us-ascii?Q?unyMFOyvgxFkxHVpNMGo1bwm965U8EWW8i2bLepcRfR7zFd2vbn6MW1KpHLR?=
 =?us-ascii?Q?vmXIW7XWJVut7LeKRWgR+Cjo61uOtiFTp9Hu76Taa/Eeb1nBmjxgT8BJapdn?=
 =?us-ascii?Q?PIIAAiixhoEV77O46GWQ4bWo2ngigtuMwvIy+D69cwzOMhEDnbj0Uwdn6sj7?=
 =?us-ascii?Q?oW+jG+yB6kUWGfD23G+M5ortfp5xZgabuOmI/N5q2vWCDuQ243hhnI5xnqss?=
 =?us-ascii?Q?1dLGSkfnlC90v49a7FCX/qoofIuEko9s9dRZPXIzpdUYKeWMwe50MtkKde5T?=
 =?us-ascii?Q?APzW6d+yY7xIABY3BNdRf4funqkmEwKwB8pzKHqzsmmxhjrojY8THenFe7ky?=
 =?us-ascii?Q?Z8SHswRuv9Ct4zF9wnzXvpeVzoWYh9GsZ4im55cRW8p0tNzW4WNETquyl4VW?=
 =?us-ascii?Q?AAo9pT7c1+sGntEY7s49Z34zZ84o0HccwbmGKkUSGtXGEx7FO4oXIIU6tfFJ?=
 =?us-ascii?Q?tUNQjTEIv1gDyL82wtPFaZ5GfWi9ZCo5cH0TdT7FHZyv4yZdCsJLxuY8zl18?=
 =?us-ascii?Q?jcoomlZa2UgmagZp9rbAjSUa6EJLIS4Hjnc7YzPbf825q2NFI3Twt7lPHG/U?=
 =?us-ascii?Q?dLGXvmcuZ/A5N106QMi9pajcZOtuN1zNwvHghQyjkPxSIX6TI5ePVE99xy7P?=
 =?us-ascii?Q?BD5FmWlzTK4PjIj2jjhYK6Oe8f0Xt0LrtOksZlVQM+maM/cCiKcU3aLbqK94?=
 =?us-ascii?Q?YsEkbFKBBKnjP0jtp/zLah8WdW5WfYLgriKI7bKdic70MgUQmOnxH+xGpwnc?=
 =?us-ascii?Q?SCYF8TQgws5jSNHbswwuSBbjpdRD7Gx/KLd63pb6TVvW2fqKoy/8Meb/IAlI?=
 =?us-ascii?Q?eXllLvHiKqkxy9VZoAxB6AdtLMB+r1Oda8MMNCBjK/ozDBy4wLcHHyJzNTUE?=
 =?us-ascii?Q?N/KqoFdkbGJ7hyrM1MVj9+uVVuZkWN1D1eNrNT7hfc7tXuKdIooDHtkFEImG?=
 =?us-ascii?Q?Wbv9+gPSNismDDjk7A8mFPUMP9vjNu2qkTB9WnzD+8YIGaMBiM3RVNCU7QKi?=
 =?us-ascii?Q?KwUpTArh0DTi7RCg9156WmqbmLPmzpmaqKCO4faOhWMXR/0/xXICxONhST33?=
 =?us-ascii?Q?LoNcA0RTm+APvRgSv1zKcW3lDZuq6401ty/CGVDiT24zeT8U5+TocG1fKcY8?=
 =?us-ascii?Q?AqcywZ9CvfjzuvBx3pI2BXXG?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4968
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	915f20f1-79a7-4f24-1f75-08d8d427bd84
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	svY/RqbqjUsqq3Xk9vy3ov+bh42lY3bpv/F6nLFwXhzRERwbZj2jkvXK5pSccG7PdGdeU+WSlNI3EZySdnji7+lP9TBxCO0t2EWBqkZGXdOPGbPLWbvyhRUJRkrwNoWKA0gK13ToyU5ul23nqSAmDAQDlI9yRedk106EpcEaeCv6y/vSvzg89UdvxGBlbRmw/8oM8ci2jXqg2/CA1YZkECE3I4Yg1iwuYOlRezjGwpEwFiFsvtnse30yVc/hvCvmlBXD9BEwzzWOr3NlYdbp6eS9gqo1S5X5WrF1eMwm1GNHcGojXVNt6Zz7Jz7KTkSfpC4wSO9gK6OldGNhj3CBT5hIQH1mctEeHPsTz/DMsZW4oTcjyp7i4ZQqlqMV0rYMuXQnDM4wAvkQjBwsqB42z/RQiVFE79MszB7aNitmDng7di3/T680Pr5wuVJc3SmTzbrH61HzR0kWGShHsLqhe4ESW8SYyELtpymJK3r3P7mECM8o9nm8rFXUPIm+VR9izATx4cnXAI5f8uyvth+NYJlkg1hWRueZ86WpOqrYhCBkeE9R4lwuj5VINJ3SdRlp4rUKIoliAw9qwHpEzOzgsxGe+vCE2c0qSvn+9QGOJdpsE7TLqP8UD3cV2VzH7fGDzm88vi9dOOFCdeN7xl9FfMCg+wU5EnOm6vYIXZnpegXOSD7fGrdUSzZKSjzWjm7KyPqhUJjAQhw7rDDQOafnEHWjnC8VpdG7UmK1ixxD9Io=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(4326008)(70206006)(82310400003)(36756003)(47076005)(83380400001)(7696005)(81166007)(356005)(82740400003)(86362001)(478600001)(966005)(70586007)(8676002)(316002)(6916009)(6486002)(26005)(16526019)(186003)(8936002)(2906002)(44832011)(956004)(6666004)(336012)(36860700001)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 16:10:53.0155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2501904c-1936-4af0-8cc1-08d8d427c415
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5130
Content-Type: text/plain

The arm64-autonomy-guest kernel from commit 3499ba8198ca ("xen: Fix event
channel callback via INTX/GSI") are hanging at `xen:balloon: Initialising
balloon driver`.

The arm-autonomy-guest kernels older than 5.10.17 need to backport the
0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch in order
to be able to boot.

Issue-Id: SCM-2151
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I74f58366f42733be4f67ab3841584efa1636abbb
---
 ...obe-xenbus-as-part-of-an-early-initc.patch | 95 +++++++++++++++++++
 .../linux/linux-arm-autonomy.inc              |  5 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch
new file mode 100644
index 0000000..3ec7fa7
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch
@@ -0,0 +1,95 @@
+From 89b0c20d80a1ab8aa155af287ff4af378862964f Mon Sep 17 00:00:00 2001
+Message-Id: <89b0c20d80a1ab8aa155af287ff4af378862964f.1613583742.git.diego.sueiro@arm.com>
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
+index 5a957a9a0984..8ad576ecd0f1 100644
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
+index dc1537335414..2a93b7c9c159 100644
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
+index 18ffd0551b54..8a75092bb148 100644
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
+index 2c43b0ef1e4d..bf3cfc7c35d0 100644
+--- a/include/xen/xenbus.h
++++ b/include/xen/xenbus.h
+@@ -192,8 +192,6 @@ void xs_suspend_cancel(void);
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
index e14ea96..644f563 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -49,4 +49,9 @@ python() {
        and not pn.startswith('linux-linaro-arm') \
        and oe.utils.any_distro_features(d, "arm-autonomy-host"):
         d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
+
+    if kernelVersion and LooseVersion(kernelVersion) < '5.10.17' \
+       and pn != 'linux-libc-headers' \
+       and oe.utils.any_distro_features(d, "arm-autonomy-guest"):
+        d.appendVar('SRC_URI', ' file://files/0001-arm-xen-Don-t-probe-xenbus-as-part-of-an-early-initc.patch' )
 }
-- 
2.17.1

