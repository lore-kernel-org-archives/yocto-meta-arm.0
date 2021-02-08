Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.52])
 by mx.groups.io with SMTP id smtpd.web08.34574.1612787259166713319
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Feb 2021 04:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WCYNRxp2;
 spf=pass (domain: arm.com, ip: 40.107.6.52, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybf4atB50xeO4D1ZaYBgzFgrteXpOJBZGF8GPF+ye+0=;
 b=WCYNRxp2nEX+mcO9jaV0caXPweP77uvypWXgbIPmFVqYVYpIvDWD29U+OnAjSNudRMMMXTCccmkHy0Da6X0jvl98lKIR/uk1MUDlDQ/msua2SjFMXrI9GamVwt8OkWEAxmFBhErzfrVUXA4ndCJN3vzCVWeqJgwcD6uTDdtmBz0=
Received: from MR2P264CA0131.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::23)
 by AM0PR08MB5457.eurprd08.prod.outlook.com (2603:10a6:208:180::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Mon, 8 Feb
 2021 12:27:36 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::63) by MR2P264CA0131.outlook.office365.com
 (2603:10a6:500:30::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27 via Frontend
 Transport; Mon, 8 Feb 2021 12:27:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 8 Feb 2021 12:27:36 +0000
Received: ("Tessian outbound e989e14f9207:v71"); Mon, 08 Feb 2021 12:27:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e0aeb33a7ef363a
X-CR-MTA-TID: 64aa7808
Received: from a975f0d6bece.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B68F080C-2DA0-45B9-87FB-A47C8CE9CB1A.1;
	Mon, 08 Feb 2021 12:27:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a975f0d6bece.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Feb 2021 12:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVhtagNLRDNXf4223I88SqSXu0pSK/BCpnOorW8Xrm6QWHf6Sgx/0dxAbqKQNxbtDdsy1q9JXKrQ6nLENr3GbYnwtU753liDpGJtH6VTb71KqRaQXW+yg8POniOsC1HwskdXadZR1v8O1SWfbRlEO2NToFzU7ncOJaVLfLSK9TKFlVpyYpWrupao12oOwx8hfEXW3K6odcy88uc63/QAohRRed6sm272lg11brnU+YTgQVJ4GSIf5qA14UuucA6U3c6n/ZYuEqf41e2qkrci0miXRyBXE2MNRSleH9wdbFZfbnKrNDoWbI/UPa1in+nRJT74idhdFv2/lZ4ZaNLunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybf4atB50xeO4D1ZaYBgzFgrteXpOJBZGF8GPF+ye+0=;
 b=mnzr2BUACFUhqVZ5SnPmJMwTrIikOyBjBAI5h71dssAIP9FgU3Xz2OVq0N9DIsqVfuIlUYWWLjfQwOjS/IJVVLzqYFNq4gqSGL5cDVErxsgQbK6s8PfsfzzhDuSVMdjgLBsZD91D4TJOUmDKjexRG/XgRmWAalGx4V8m1+QjI9wjv4kauppaBAu566HHynLb7aLMgQ/7YNfmApoy9y+4eSyN5CqfjRea6z0aZWCSPibIEO6imls7UlaleKtc3tqjtgHTDkedjS03LNSzLkYhwlIcBDG8ms8j5tOdtCXgpfTHUQQFER+hRwRkkepXzSymASPzQNlvdxdiXDctlC4HbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybf4atB50xeO4D1ZaYBgzFgrteXpOJBZGF8GPF+ye+0=;
 b=WCYNRxp2nEX+mcO9jaV0caXPweP77uvypWXgbIPmFVqYVYpIvDWD29U+OnAjSNudRMMMXTCccmkHy0Da6X0jvl98lKIR/uk1MUDlDQ/msua2SjFMXrI9GamVwt8OkWEAxmFBhErzfrVUXA4ndCJN3vzCVWeqJgwcD6uTDdtmBz0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VE1PR08MB5855.eurprd08.prod.outlook.com (2603:10a6:800:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.25; Mon, 8 Feb
 2021 12:27:28 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::cac:e7b3:c805:602]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::cac:e7b3:c805:602%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 12:27:28 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 1/2] arm-bsp/linux: add asymmetric AArch32 EL0 support for TC0
Date: Mon,  8 Feb 2021 12:26:51 +0000
Message-ID: <20210208122652.2122054-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.50) by LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend Transport; Mon, 8 Feb 2021 12:27:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c6ec6507-0ae9-404d-fc57-08d8cc2ceac2
X-MS-TrafficTypeDiagnostic: VE1PR08MB5855:|AM0PR08MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB54578164DB2407FFBF4EF758FB8F9@AM0PR08MB5457.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wLRj7TxZFz3Zk0q4sXzaiRMkAnPlNqS+kPqCz0Ogn6m0nZT6qnB545MzxFvM8OYCfXwQKxCu01o/fe7FFk4HYYJfhGjEo68JYb5yo/umowq90EGYmYOYsknJ9kgzBDfKf+wh3wtXnUAUHRh71kfAqGr6QpSWI7p2JcNGuWWGg/1PL3KdkdN3PPmcCrM8grlMVr09EtIX1/AsINxtWPHDM95rM1OD7X/JYXeqswhwztsU2/JcOhic7BvjiLAhr/Lu2ZCuQ7v2WjyUIstjzkefOAGKdyYx6qrrDfOvvaquY1ZlZME3jPpKTwwymkqZMM3kghIgVg8RuDQZS5fcLopCbNFA4I5/Rvj5F+vDkzJZttPaH9kqi3cvUMV4oHc3Yua6vo9tjQDn219JSQj4yLWlLUyBJgWdDMfPdJgg59eYrBB1mbcGTW1dLVg+Peh5+uLjhEJ0k5fhNL6721SDI045RyNdZH7V2zaMetvfNGV8X9YHMJpPf1tzrI/dNIMoh3ZMxibWSP+7ERbsItWMm+5FyT+A5I9IErJavVM0iuflDJ+laGrzA1TdpojzVBalKOlmMeGH6JBwsdR56wGh7tjRJX9WAH+KuyPa/IhCJKNkYV8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(4326008)(956004)(2616005)(478600001)(26005)(7696005)(86362001)(6916009)(66946007)(66556008)(66476007)(8676002)(6666004)(2906002)(44832011)(30864003)(316002)(36756003)(16526019)(6486002)(186003)(5660300002)(83380400001)(8936002)(1076003)(19627235002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DKGm2p3LXVTsaAH0D4ScENgDz9sCo4QtRk6wulu1FBnpRmmMPZvdCYLnnK/x?=
 =?us-ascii?Q?EU0JCfu445bKYJirWubfv+Z7CRWXf3cFbOprOP9tQwv8oRYCFQzyRAZzR+BS?=
 =?us-ascii?Q?c6EfEzclLeG+rIJPsXbegGc2gdgeyJUjXmhQq32mG2sDrKmLoE5EBCN2lP3S?=
 =?us-ascii?Q?QoU4EIDd5+0A0XltDv78wTzcFvYKd2M7pR2cFBGLxGuEJM2ag88swfPzOmi6?=
 =?us-ascii?Q?GSeyAVORiqPpMD3ui4pwp6TOmw5zkxQu1hSR/vj8ToJv5lFQ3TwKbJaZ4wmB?=
 =?us-ascii?Q?tnnBvNupLpLRZdwGvb5yKWPAiO9caDhgBoWulvNYSqAobM4ci8tfxqlRt1HW?=
 =?us-ascii?Q?jA886+5Js/raTn6RdSdsa85DxWF4W3vWU9w6jV6yTjS2wgdOVNDThdS0KcAH?=
 =?us-ascii?Q?lFmM28+VHrB6T6Fd0P6SMQ8NYkgNQzUXtc5H0B4zjytCq5bVyT9ZvhLuHEso?=
 =?us-ascii?Q?l0cYss1dXsnuQFF2VChrIqaVGT6m//FXNdwqBMMP9zKVx1+2o9gc+ziLF/9l?=
 =?us-ascii?Q?VXGfv+bv37mPfHdel/gB84dfpgND+KPb5DnuWza1jcOIYm3pGmsOtfSmPqzo?=
 =?us-ascii?Q?68jJ6HKtZDVgDklbfyOQZY4Bz06R9lKAqIKUwKS9K21pM4XFuepMNd9fBo2v?=
 =?us-ascii?Q?45rv1a7b8FEsm2twA3+jXCMtFbrDpPFYxA7sCq/zYa+lY+Xg1p2f/UN6EtHk?=
 =?us-ascii?Q?7+ToUPQmkvm44+Yq5+cabR4ZAgap6/0jm91m+8iOBr7SGhqDqdzX1h0WncPO?=
 =?us-ascii?Q?YyrNH0DrlossnnBQnYJbBWERx9vumXSzRQIkAYDqy3BjsD5eSTJCIflToufi?=
 =?us-ascii?Q?kupeivE5XKn7EJ0BbciRz98mRk7KXUPNreM8zTpYB1Zf11+AtpaKhI3eocPk?=
 =?us-ascii?Q?NUMBSrmArm+uOKwzBHhMYiM2mM0+O3Ct17uOgcldj+MZnPcSnwxlAD3GvHkH?=
 =?us-ascii?Q?SSYncnNYpBne/bxFoGrj3JFHeEjdrKdS9ol2zX97xsOeIhVGAH1Kv9jnU3Tv?=
 =?us-ascii?Q?/FlbOIOPM2yLOQtjClAKxZ5DqgK1gOaIOCbWTlU/YM5ndtPgSQ/unQ9TR3xg?=
 =?us-ascii?Q?6B9+RBDvGfSGjJEXQJzokAJAxzOHrsqZqX5XLfA3zfvtRCUn9wPcmxymYDwF?=
 =?us-ascii?Q?ndh5hp9tiFRxzAUgKTnWGNdxDl7Fcs3FAdEKtCgSdeJ3UotVMD33y0EEh85u?=
 =?us-ascii?Q?zh2YI1U+HH287d31QYXKKIWlm4t5RIzXx5WNyUR5a+/d49IvWeyJteGJ6xQG?=
 =?us-ascii?Q?brbRQtUgXVNx3JTtjbYcbcISZkTs6jNcgJaEaNgwWiTw8wJImwBClZxKaWnm?=
 =?us-ascii?Q?BtT7M7l6OFkKU9hhoa+K723q?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5855
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	493e5fb5-14b1-46c8-941e-08d8cc2ce5b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eFuG+UBr5AyX/Evk24kl+qydkJemxKX1WrEqxVGuCCQCVIuurL3g6gFYTotSvtpT9F3PcoHBUMyxW0ICW6qK5nDuJw6gc/VXRGaNoe1P+Tzcj64QH/GP40T4RfkGZjnYNDYxzR5+fh4Hxlvu5MU+J2eNNrEC7/h+70J3+8Hp2q/xRnHe1GG3zSrrZRcgHW4/j37m8CiG/mYaUQYeJ+nTG2C8w88Xyfeg9tQjC099KkNjpkTrxkUG35WfAQ1xjZfqOgw/MNZIdhpHRdf3zz7XQ1N1soOmlGwxIjv0YRnzcE7FNG5Y4a/WUaLz82z+oXv+yc/36YYuoU8DRvW2CTU+dg2+MzJZxOuuixGuofnI+NyxYTkv0gU0hLmp3XSx/Eofj2J9UExLphImZSnAZIlqIiImht/usijRlOH0IKkkyfPrUwKdwpl6/K6lNMv15XDoLktjEzrhmDLjd5w1qBrB45RQ5Gt+2Ns2pKs7A7RpfJW2y7izZwo98B0eInTaaBxqktpHq3XR+b4QcVE8N+REMpTqQZUtiG7THGDyudIXCYejwJNtPTbu+hYplNyJyl7KuK018r+rsYg0Vzhq7FC7FM2vQtgFJLAPWIdY5QAUbMMyGJhiZe/hEbdwilNMah07hRZuOqPE2JF6GjJ+ftSXyEzuJ+L4MHrmtQWAYW/W7VeQjhPhk3ovYfqQOWn80nsQ/OxI4Xx/g+pKqdQVvhgXKygAH/9IhaxNcEj06m2s3mU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(478600001)(2616005)(8676002)(30864003)(47076005)(956004)(44832011)(8936002)(6666004)(7696005)(336012)(6916009)(316002)(16526019)(36860700001)(86362001)(186003)(82310400003)(26005)(70586007)(83380400001)(2906002)(4326008)(19627235002)(81166007)(356005)(70206006)(1076003)(36756003)(6486002)(5660300002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 12:27:36.0360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ec6507-0ae9-404d-fc57-08d8cc2ceac2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5457
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This adds patches for asymmetric AArch32 EL0 configuration support for
android11-5.4-lts kernel. And enables CONFIG_ASYMMETRIC_AARCH32 and
disables CONFIG_KVM in TC0 defconfig.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Iab94b5c48b60aca4a71267ba1be1cb1836002d10
---
 .../linux/linux-arm-platforms.inc             |   2 +
 ...t-for-asymmetric-AArch32-EL0-configu.patch | 462 ++++++++++++++++++
 ...t-hotplugging-the-last-AArch32-able-.patch |  89 ++++
 .../linux/linux-arm64-ack-5.4/tc0/defconfig   |   2 +-
 4 files changed, 554 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0014-arm64-Add-support-for-asymmetric-AArch32-EL0-configu.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0015-arm64-smp-Prevent-hotplugging-the-last-AArch32-able-.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 9aba762..b852644 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -81,6 +81,8 @@ SRC_URI_append_tc0 =3D " \
     file://0011-tee-optee-Add-support-for-session-login-client-UUID-.patch=
 \
     file://0012-driver-optee-Support-for-ffa-transport.patch \
     file://0013-tee-optee-fix-mem-handle-removal-in-ffa_shm_unregist.patch=
 \
+    file://0014-arm64-Add-support-for-asymmetric-AArch32-EL0-configu.patch=
 \
+    file://0015-arm64-smp-Prevent-hotplugging-the-last-AArch32-able-.patch=
 \
     "
=20
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0014=
-arm64-Add-support-for-asymmetric-AArch32-EL0-configu.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0014-arm64-Add-support-for-asy=
mmetric-AArch32-EL0-configu.patch
new file mode 100644
index 0000000..7ca9c07
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0014-arm64-=
Add-support-for-asymmetric-AArch32-EL0-configu.patch
@@ -0,0 +1,462 @@
+Upstream-Status: Backport [http://www.linux-arm.org/git?p=3Dlinux-power.gi=
t;a=3Dcommit;h=3Dce7d6e205568b7949ff26f2b3c65dc4db1c15b96]
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+
+From 0316669bc2a0e1279427b7a3ed01313b70544756 Mon Sep 17 00:00:00 2001
+From: Catalin Marinas <catalin.marinas@arm.com>
+Date: Thu, 20 Jun 2019 17:59:25 +0100
+Subject: [PATCH 1/2] arm64: Add support for asymmetric AArch32 EL0
+ configurations
+
+There is a non-negligible chance that we may see asymmetric big.LITTLE
+configurations where only the LITTLE CPUs have AArch32 support at EL0.
+While Linux currently handles such configurations by not allowing
+AArch32 tasks, there is a strong marketing push to investigate the
+possibility of allowing compat applications. This patch is aimed to
+facilitate internal testing and NOT FOR UPSTREAM.
+
+When the CONFIG_ASYMMETRIC_AARCH32 option is enabled (EXPERT), the type
+of the ARM64_HAS_32BIT_EL0 capability becomes WEAK_LOCAL_CPU_FEATURE.
+The kernel will now return true for system_supports_32bit_el0() and
+32-bit tasks will be migrated to the capable CPUs during
+do_notify_resume(). If the last CPU supporting 32-bit is offlined, the
+kernel will SIGKILL any scheduled 32-bit tasks (the alternative is to
+prevent offlining through a new .cpu_disable feature entry).
+
+In addition to the relaxation of the ARM64_HAS_32BIT_EL0 capability,
+this patch factors out the 32-bit cpuinfo and features setting into
+separate functions: __cpuinfo_store_cpu_32bit(),
+init_cpu_32bit_features(). The cpuinfo of the booting CPU
+(boot_cpu_data) is now updated on the first 32-bit capable CPU even if
+it is a secondary one. The ID_AA64PFR0_EL0_64BIT_ONLY feature is relaxed
+to FTR_NONSTRICT and FTR_HIGHER_SAFE when the asymmetric AArch32 support
+is enabled. The compat_elf_hwcaps are only verified for the
+AArch32-capable CPUs to still allow hotplugging AArch64-only CPUs.
+
+Cc: Suzuki K Poulose <Suzuki.Poulose@arm.com>
+Cc: Morten Rasmussen <Morten.Rasmussen@arm.com>
+Cc: Valentin Schneider <valentin.schneider@arm.com>
+Cc: Qais Yousef <qais.yousef@arm.com>
+Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
+Signed-off-by: Qais Yousef <qais.yousef@arm.com>
+---
+ arch/arm64/Kconfig                   | 13 ++++++
+ arch/arm64/include/asm/cpu.h         |  2 +
+ arch/arm64/include/asm/cpufeature.h  |  3 ++
+ arch/arm64/include/asm/thread_info.h |  5 ++-
+ arch/arm64/kernel/cpufeature.c       | 64 ++++++++++++++++++----------
+ arch/arm64/kernel/cpuinfo.c          | 61 +++++++++++++++++---------
+ arch/arm64/kernel/process.c          | 17 ++++++++
+ arch/arm64/kernel/signal.c           | 30 ++++++++++++-
+ 8 files changed, 150 insertions(+), 45 deletions(-)
+
+diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
+index 71d23b5d10d4..068e9e9ffc40 100644
+--- a/arch/arm64/Kconfig
++++ b/arch/arm64/Kconfig
+@@ -1680,6 +1680,19 @@ config DMI
+=20
+ endmenu
+=20
++config ASYMMETRIC_AARCH32
++	bool "Allow support for asymmetric AArch32 support"
++	depends on COMPAT && EXPERT && !KVM
++	help
++	  Enable this option to allow support for asymmetric AArch32 EL0
++	  CPU configurations. Once the AArch32 EL0 support is detected
++	  on a CPU, the feature is made available to user space to allow
++	  the execution of 32-bit (compat) applications by migrating
++	  them to the capable CPUs. Offlining such CPUs leads to 32-bit
++	  applications being killed.
++
++	  If unsure say N.
++
+ config SYSVIPC_COMPAT
+ 	def_bool y
+ 	depends on COMPAT && SYSVIPC
+diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
+index d72d995b7e25..39dbf5827070 100644
+--- a/arch/arm64/include/asm/cpu.h
++++ b/arch/arm64/include/asm/cpu.h
+@@ -15,6 +15,7 @@
+ struct cpuinfo_arm64 {
+ 	struct cpu	cpu;
+ 	struct kobject	kobj;
++	bool		aarch32_valid;
+ 	u32		reg_ctr;
+ 	u32		reg_cntfrq;
+ 	u32		reg_dczid;
+@@ -60,6 +61,7 @@ void cpuinfo_store_cpu(void);
+ void __init cpuinfo_store_boot_cpu(void);
+=20
+ void __init init_cpu_features(struct cpuinfo_arm64 *info);
++void init_cpu_32bit_features(struct cpuinfo_arm64 *info);
+ void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
+ 				 struct cpuinfo_arm64 *boot);
+=20
+diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/=
cpufeature.h
+index 9cde5d2e768f..d00d673d423b 100644
+--- a/arch/arm64/include/asm/cpufeature.h
++++ b/arch/arm64/include/asm/cpufeature.h
+@@ -17,6 +17,7 @@
+ #ifndef __ASSEMBLY__
+=20
+ #include <linux/bug.h>
++#include <linux/cpumask.h>
+ #include <linux/jump_label.h>
+ #include <linux/kernel.h>
+=20
+@@ -370,6 +371,8 @@ cpucap_multi_entry_cap_matches(const struct arm64_cpu_=
capabilities *entry,
+ 	return false;
+ }
+=20
++extern cpumask_t aarch32_el0_mask;
++
+ extern DECLARE_BITMAP(cpu_hwcaps, ARM64_NCAPS);
+ extern struct static_key_false cpu_hwcap_keys[ARM64_NCAPS];
+ extern struct static_key_false arm64_const_caps_ready;
+diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm=
/thread_info.h
+index 8c73764b9ed2..54a4c912a7ab 100644
+--- a/arch/arm64/include/asm/thread_info.h
++++ b/arch/arm64/include/asm/thread_info.h
+@@ -66,6 +66,7 @@ void arch_release_task_struct(struct task_struct *tsk);
+ #define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
+ #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
+ #define TIF_FSCHECK		5	/* Check FS is USER_DS on return */
++#define TIF_SET_32BIT_AFFINITY	6	/* set thread affinity for asymmetric AA=
rch32 */
+ #define TIF_NOHZ		7
+ #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
+ #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
+@@ -95,11 +96,13 @@ void arch_release_task_struct(struct task_struct *tsk)=
;
+ #define _TIF_UPROBE		(1 << TIF_UPROBE)
+ #define _TIF_FSCHECK		(1 << TIF_FSCHECK)
+ #define _TIF_32BIT		(1 << TIF_32BIT)
++#define _TIF_SET_32BIT_AFFINITY	(1 << TIF_SET_32BIT_AFFINITY)
+ #define _TIF_SVE		(1 << TIF_SVE)
+=20
+ #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
+ 				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
+-				 _TIF_UPROBE | _TIF_FSCHECK)
++				 _TIF_UPROBE | _TIF_FSCHECK | \
++				 _TIF_SET_32BIT_AFFINITY)
+=20
+ #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
+ 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
+diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature=
.c
+index da92693b202c..c0d656cfe5b8 100644
+--- a/arch/arm64/kernel/cpufeature.c
++++ b/arch/arm64/kernel/cpufeature.c
+@@ -8,7 +8,6 @@
+ #define pr_fmt(fmt) "CPU features: " fmt
+=20
+ #include <linux/bsearch.h>
+-#include <linux/cpumask.h>
+ #include <linux/crash_dump.h>
+ #include <linux/sort.h>
+ #include <linux/stop_machine.h>
+@@ -164,7 +163,11 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[] =
=3D {
+ 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL=
3_SHIFT, 4, 0),
+ 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL2_S=
HIFT, 4, 0),
+ 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_S=
HIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
++#ifndef CONFIG_ASYMMETRIC_AARCH32
+ 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL0_S=
HIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
++#else
++	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_HIGHER_SAFE, ID_AA64PFR0_E=
L0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
++#endif
+ 	ARM64_FTR_END,
+ };
+=20
+@@ -509,7 +512,7 @@ static void __init sort_ftr_regs(void)
+  * Any bits that are not covered by an arm64_ftr_bits entry are considere=
d
+  * RES0 for the system-wide value, and must strictly match.
+  */
+-static void __init init_cpu_ftr_reg(u32 sys_reg, u64 new)
++static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
+ {
+ 	u64 val =3D 0;
+ 	u64 strict_mask =3D ~0x0ULL;
+@@ -590,25 +593,6 @@ void __init init_cpu_features(struct cpuinfo_arm64 *i=
nfo)
+ 	init_cpu_ftr_reg(SYS_ID_AA64PFR1_EL1, info->reg_id_aa64pfr1);
+ 	init_cpu_ftr_reg(SYS_ID_AA64ZFR0_EL1, info->reg_id_aa64zfr0);
+=20
+-	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
+-		init_cpu_ftr_reg(SYS_ID_DFR0_EL1, info->reg_id_dfr0);
+-		init_cpu_ftr_reg(SYS_ID_ISAR0_EL1, info->reg_id_isar0);
+-		init_cpu_ftr_reg(SYS_ID_ISAR1_EL1, info->reg_id_isar1);
+-		init_cpu_ftr_reg(SYS_ID_ISAR2_EL1, info->reg_id_isar2);
+-		init_cpu_ftr_reg(SYS_ID_ISAR3_EL1, info->reg_id_isar3);
+-		init_cpu_ftr_reg(SYS_ID_ISAR4_EL1, info->reg_id_isar4);
+-		init_cpu_ftr_reg(SYS_ID_ISAR5_EL1, info->reg_id_isar5);
+-		init_cpu_ftr_reg(SYS_ID_MMFR0_EL1, info->reg_id_mmfr0);
+-		init_cpu_ftr_reg(SYS_ID_MMFR1_EL1, info->reg_id_mmfr1);
+-		init_cpu_ftr_reg(SYS_ID_MMFR2_EL1, info->reg_id_mmfr2);
+-		init_cpu_ftr_reg(SYS_ID_MMFR3_EL1, info->reg_id_mmfr3);
+-		init_cpu_ftr_reg(SYS_ID_PFR0_EL1, info->reg_id_pfr0);
+-		init_cpu_ftr_reg(SYS_ID_PFR1_EL1, info->reg_id_pfr1);
+-		init_cpu_ftr_reg(SYS_MVFR0_EL1, info->reg_mvfr0);
+-		init_cpu_ftr_reg(SYS_MVFR1_EL1, info->reg_mvfr1);
+-		init_cpu_ftr_reg(SYS_MVFR2_EL1, info->reg_mvfr2);
+-	}
+-
+ 	if (id_aa64pfr0_sve(info->reg_id_aa64pfr0)) {
+ 		init_cpu_ftr_reg(SYS_ZCR_EL1, info->reg_zcr);
+ 		sve_init_vq_map();
+@@ -627,6 +611,26 @@ void __init init_cpu_features(struct cpuinfo_arm64 *i=
nfo)
+ 	setup_boot_cpu_capabilities();
+ }
+=20
++void init_cpu_32bit_features(struct cpuinfo_arm64 *info)
++{
++	init_cpu_ftr_reg(SYS_ID_DFR0_EL1, info->reg_id_dfr0);
++	init_cpu_ftr_reg(SYS_ID_ISAR0_EL1, info->reg_id_isar0);
++	init_cpu_ftr_reg(SYS_ID_ISAR1_EL1, info->reg_id_isar1);
++	init_cpu_ftr_reg(SYS_ID_ISAR2_EL1, info->reg_id_isar2);
++	init_cpu_ftr_reg(SYS_ID_ISAR3_EL1, info->reg_id_isar3);
++	init_cpu_ftr_reg(SYS_ID_ISAR4_EL1, info->reg_id_isar4);
++	init_cpu_ftr_reg(SYS_ID_ISAR5_EL1, info->reg_id_isar5);
++	init_cpu_ftr_reg(SYS_ID_MMFR0_EL1, info->reg_id_mmfr0);
++	init_cpu_ftr_reg(SYS_ID_MMFR1_EL1, info->reg_id_mmfr1);
++	init_cpu_ftr_reg(SYS_ID_MMFR2_EL1, info->reg_id_mmfr2);
++	init_cpu_ftr_reg(SYS_ID_MMFR3_EL1, info->reg_id_mmfr3);
++	init_cpu_ftr_reg(SYS_ID_PFR0_EL1, info->reg_id_pfr0);
++	init_cpu_ftr_reg(SYS_ID_PFR1_EL1, info->reg_id_pfr1);
++	init_cpu_ftr_reg(SYS_MVFR0_EL1, info->reg_mvfr0);
++	init_cpu_ftr_reg(SYS_MVFR1_EL1, info->reg_mvfr1);
++	init_cpu_ftr_reg(SYS_MVFR2_EL1, info->reg_mvfr2);
++}
++
+ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
+ {
+ 	const struct arm64_ftr_bits *ftrp;
+@@ -1264,6 +1268,16 @@ static bool can_use_gic_priorities(const struct arm=
64_cpu_capabilities *entry,
+ }
+ #endif
+=20
++#ifdef CONFIG_ASYMMETRIC_AARCH32
++cpumask_t aarch32_el0_mask;
++
++static void cpu_enable_aarch32_el0(struct arm64_cpu_capabilities const *c=
ap)
++{
++	if (has_cpuid_feature(cap, SCOPE_LOCAL_CPU))
++		cpumask_set_cpu(smp_processor_id(), &aarch32_el0_mask);
++}
++#endif
++
+ static const struct arm64_cpu_capabilities arm64_features[] =3D {
+ 	{
+ 		.desc =3D "GIC system register CPU interface",
+@@ -1340,7 +1354,12 @@ static const struct arm64_cpu_capabilities arm64_fe=
atures[] =3D {
+ 	{
+ 		.desc =3D "32-bit EL0 Support",
+ 		.capability =3D ARM64_HAS_32BIT_EL0,
++#ifndef CONFIG_ASYMMETRIC_AARCH32
+ 		.type =3D ARM64_CPUCAP_SYSTEM_FEATURE,
++#else
++		.type =3D ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
++		.cpu_enable =3D cpu_enable_aarch32_el0,
++#endif
+ 		.matches =3D has_cpuid_feature,
+ 		.sys_reg =3D SYS_ID_AA64PFR0_EL1,
+ 		.sign =3D FTR_UNSIGNED,
+@@ -1983,7 +2002,8 @@ static void verify_local_cpu_capabilities(void)
+=20
+ 	verify_local_elf_hwcaps(arm64_elf_hwcaps);
+=20
+-	if (system_supports_32bit_el0())
++	if (system_supports_32bit_el0() &&
++	    this_cpu_has_cap(ARM64_HAS_32BIT_EL0))
+ 		verify_local_elf_hwcaps(compat_elf_hwcaps);
+=20
+ 	if (system_supports_sve())
+diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
+index 05933c065732..bda37687bb66 100644
+--- a/arch/arm64/kernel/cpuinfo.c
++++ b/arch/arm64/kernel/cpuinfo.c
+@@ -351,27 +351,6 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 =
*info)
+ 	info->reg_id_aa64pfr1 =3D read_cpuid(ID_AA64PFR1_EL1);
+ 	info->reg_id_aa64zfr0 =3D read_cpuid(ID_AA64ZFR0_EL1);
+=20
+-	/* Update the 32bit ID registers only if AArch32 is implemented */
+-	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
+-		info->reg_id_dfr0 =3D read_cpuid(ID_DFR0_EL1);
+-		info->reg_id_isar0 =3D read_cpuid(ID_ISAR0_EL1);
+-		info->reg_id_isar1 =3D read_cpuid(ID_ISAR1_EL1);
+-		info->reg_id_isar2 =3D read_cpuid(ID_ISAR2_EL1);
+-		info->reg_id_isar3 =3D read_cpuid(ID_ISAR3_EL1);
+-		info->reg_id_isar4 =3D read_cpuid(ID_ISAR4_EL1);
+-		info->reg_id_isar5 =3D read_cpuid(ID_ISAR5_EL1);
+-		info->reg_id_mmfr0 =3D read_cpuid(ID_MMFR0_EL1);
+-		info->reg_id_mmfr1 =3D read_cpuid(ID_MMFR1_EL1);
+-		info->reg_id_mmfr2 =3D read_cpuid(ID_MMFR2_EL1);
+-		info->reg_id_mmfr3 =3D read_cpuid(ID_MMFR3_EL1);
+-		info->reg_id_pfr0 =3D read_cpuid(ID_PFR0_EL1);
+-		info->reg_id_pfr1 =3D read_cpuid(ID_PFR1_EL1);
+-
+-		info->reg_mvfr0 =3D read_cpuid(MVFR0_EL1);
+-		info->reg_mvfr1 =3D read_cpuid(MVFR1_EL1);
+-		info->reg_mvfr2 =3D read_cpuid(MVFR2_EL1);
+-	}
+-
+ 	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
+ 	    id_aa64pfr0_sve(info->reg_id_aa64pfr0))
+ 		info->reg_zcr =3D read_zcr_features();
+@@ -379,10 +358,46 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64=
 *info)
+ 	cpuinfo_detect_icache_policy(info);
+ }
+=20
++static void __cpuinfo_store_cpu_32bit(struct cpuinfo_arm64 *info)
++{
++	info->aarch32_valid =3D true;
++
++	info->reg_id_dfr0 =3D read_cpuid(ID_DFR0_EL1);
++	info->reg_id_isar0 =3D read_cpuid(ID_ISAR0_EL1);
++	info->reg_id_isar1 =3D read_cpuid(ID_ISAR1_EL1);
++	info->reg_id_isar2 =3D read_cpuid(ID_ISAR2_EL1);
++	info->reg_id_isar3 =3D read_cpuid(ID_ISAR3_EL1);
++	info->reg_id_isar4 =3D read_cpuid(ID_ISAR4_EL1);
++	info->reg_id_isar5 =3D read_cpuid(ID_ISAR5_EL1);
++	info->reg_id_mmfr0 =3D read_cpuid(ID_MMFR0_EL1);
++	info->reg_id_mmfr1 =3D read_cpuid(ID_MMFR1_EL1);
++	info->reg_id_mmfr2 =3D read_cpuid(ID_MMFR2_EL1);
++	info->reg_id_mmfr3 =3D read_cpuid(ID_MMFR3_EL1);
++	info->reg_id_pfr0 =3D read_cpuid(ID_PFR0_EL1);
++	info->reg_id_pfr1 =3D read_cpuid(ID_PFR1_EL1);
++
++	info->reg_mvfr0 =3D read_cpuid(MVFR0_EL1);
++	info->reg_mvfr1 =3D read_cpuid(MVFR1_EL1);
++	info->reg_mvfr2 =3D read_cpuid(MVFR2_EL1);
++}
++
+ void cpuinfo_store_cpu(void)
+ {
+ 	struct cpuinfo_arm64 *info =3D this_cpu_ptr(&cpu_data);
+ 	__cpuinfo_store_cpu(info);
++	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
++		__cpuinfo_store_cpu_32bit(info);
++	/*
++	 * With asymmetric AArch32 support, populate the boot CPU information
++	 * on the first 32-bit capable secondary CPU if the primary one
++	 * skipped this step.
++	 */
++	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) &&
++	    !boot_cpu_data.aarch32_valid &&
++	    id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
++		__cpuinfo_store_cpu_32bit(&boot_cpu_data);
++		init_cpu_32bit_features(&boot_cpu_data);
++	}
+ 	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
+ }
+=20
+@@ -390,9 +405,13 @@ void __init cpuinfo_store_boot_cpu(void)
+ {
+ 	struct cpuinfo_arm64 *info =3D &per_cpu(cpu_data, 0);
+ 	__cpuinfo_store_cpu(info);
++	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
++		__cpuinfo_store_cpu_32bit(info);
+=20
+ 	boot_cpu_data =3D *info;
+ 	init_cpu_features(&boot_cpu_data);
++	if (id_aa64pfr0_32bit_el0(boot_cpu_data.reg_id_aa64pfr0))
++		init_cpu_32bit_features(&boot_cpu_data);
+ }
+=20
+ device_initcall(cpuinfo_regs_init);
+diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
+index cc1d8b1025b1..35f0c93699ce 100644
+--- a/arch/arm64/kernel/process.c
++++ b/arch/arm64/kernel/process.c
+@@ -494,6 +494,15 @@ static void entry_task_switch(struct task_struct *nex=
t)
+ 	__this_cpu_write(__entry_task, next);
+ }
+=20
++static void aarch32_thread_switch(struct task_struct *next)
++{
++	struct thread_info *ti =3D task_thread_info(next);
++
++	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) && is_compat_thread(ti) &&
++	    !cpumask_test_cpu(smp_processor_id(), &aarch32_el0_mask))
++		set_ti_thread_flag(ti, TIF_SET_32BIT_AFFINITY);
++}
++
+ /*
+  * Thread switching.
+  */
+@@ -511,6 +520,7 @@ __notrace_funcgraph struct task_struct *__switch_to(st=
ruct task_struct *prev,
+ 	ptrauth_thread_switch(next);
+ 	ssbs_thread_switch(next);
+ 	scs_overflow_check(next);
++	aarch32_thread_switch(next);
+=20
+ 	/*
+ 	 * Complete any pending TLB or cache maintenance on this CPU in case
+@@ -569,6 +579,13 @@ void arch_setup_new_exec(void)
+ 	current->mm->context.flags =3D is_compat_task() ? MMCF_AARCH32 : 0;
+=20
+ 	ptrauth_thread_init_user(current);
++
++	/*
++	 * If exec'ing a 32-bit task, force the asymmetric 32-bit feature
++	 * check as the task may not go through a switch_to() call.
++	 */
++	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) && is_compat_task())
++		set_thread_flag(TIF_SET_32BIT_AFFINITY);
+ }
+=20
+ #ifdef CONFIG_ARM64_TAGGED_ADDR_ABI
+diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
+index dd2cdc0d5be2..d8cdd3211d68 100644
+--- a/arch/arm64/kernel/signal.c
++++ b/arch/arm64/kernel/signal.c
+@@ -8,6 +8,7 @@
+=20
+ #include <linux/cache.h>
+ #include <linux/compat.h>
++#include <linux/cpumask.h>
+ #include <linux/errno.h>
+ #include <linux/kernel.h>
+ #include <linux/signal.h>
+@@ -896,6 +897,29 @@ static void do_signal(struct pt_regs *regs)
+ 	restore_saved_sigmask();
+ }
+=20
++static void set_32bit_cpus_allowed(void)
++{
++	int ret;
++
++	/*
++	 * Try to honour as best as possible whatever affinity request this
++	 * task has. If it spans no compatible CPU, disregard it entirely.
++	 */
++	if (cpumask_intersects(current->cpus_ptr, &aarch32_el0_mask)) {
++		cpumask_t cpus_allowed;
++
++		cpumask_and(&cpus_allowed, current->cpus_ptr, &aarch32_el0_mask);
++		ret =3D set_cpus_allowed_ptr(current, &cpus_allowed);
++	} else {
++		ret =3D set_cpus_allowed_ptr(current, &aarch32_el0_mask);
++	}
++
++	if (ret) {
++		pr_warn_once("No CPUs capable of running 32-bit tasks\n");
++		force_sig(SIGKILL);
++	}
++}
++
+ asmlinkage void do_notify_resume(struct pt_regs *regs,
+ 				 unsigned long thread_flags)
+ {
+@@ -910,7 +934,11 @@ asmlinkage void do_notify_resume(struct pt_regs *regs=
,
+ 		/* Check valid user FS if needed */
+ 		addr_limit_user_check();
+=20
+-		if (thread_flags & _TIF_NEED_RESCHED) {
++		if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) &&
++		    thread_flags & _TIF_SET_32BIT_AFFINITY) {
++			clear_thread_flag(TIF_SET_32BIT_AFFINITY);
++			set_32bit_cpus_allowed();
++		} else if (thread_flags & _TIF_NEED_RESCHED) {
+ 			/* Unmask Debug and SError for the next task */
+ 			local_daif_restore(DAIF_PROCCTX_NOIRQ);
+=20
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0015=
-arm64-smp-Prevent-hotplugging-the-last-AArch32-able-.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0015-arm64-smp-Prevent-hotplug=
ging-the-last-AArch32-able-.patch
new file mode 100644
index 0000000..774721e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0015-arm64-=
smp-Prevent-hotplugging-the-last-AArch32-able-.patch
@@ -0,0 +1,89 @@
+Upstream-Status: Backport [http://www.linux-arm.org/git?p=3Dlinux-power.gi=
t;a=3Dcommit;h=3De6b567c1cc07dd1690e5d34b6a93ab9819ab2eeb]
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+
+From d6acb605de7d40c295ada9b1f4c8336e4db71ae4 Mon Sep 17 00:00:00 2001
+From: Valentin Schneider <valentin.schneider@arm.com>
+Date: Thu, 5 Sep 2019 17:53:19 +0100
+Subject: [PATCH 2/2] arm64: smp: Prevent hotplugging the last AArch32-able=
 CPU
+
+EL0 AArch32 tasks are now sigkilled when they can't run on any
+compatible CPU, either because there aren't any left (hotplug) or
+because they aren't allowed to run on those left (task affinity).
+
+However, it has been deemed valuable to prevent the loss of
+functionality resulting in offlining the last AArch32-compatible CPU.
+
+Add arch-specific hook in _cpu_down() that allows checking whether we
+can offline a cpu or not and use that hook to veto offlining the last
+AArch32 CPU.
+
+Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
+Signed-off-by: Qais Yousef <qais.yousef@arm.com>
+---
+ arch/arm64/kernel/smp.c | 22 ++++++++++++++++++++++
+ kernel/cpu.c            |  9 +++++++++
+ 2 files changed, 31 insertions(+)
+
+diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
+index 038ce6263d1c..c8ab4ee29f32 100644
+--- a/arch/arm64/kernel/smp.c
++++ b/arch/arm64/kernel/smp.c
+@@ -85,6 +85,28 @@ static inline int op_cpu_kill(unsigned int cpu)
+ }
+ #endif
+=20
++bool arch_allows_cpu_disable(int cpu, int tasks_frozen,
++			     enum cpuhp_state target)
++{
++	/*
++	 * Don't let the last AArch32-compatible CPU go down unless the request
++	 * is related to suspend (!tasks_frozen) then allow it to be offlined
++	 * or we'll break suspend-to-ram functionality.
++	 */
++	if (IS_ENABLED(CONFIG_ASYMMETRIC_AARCH32) &&
++	    !cpumask_empty(&aarch32_el0_mask) &&
++	    !tasks_frozen) {
++		cpumask_t online;
++
++		cpumask_and(&online, &aarch32_el0_mask, cpu_online_mask);
++
++		if (cpumask_weight(&online) =3D=3D 1)
++			return false;
++	}
++
++	return true;
++}
++
+=20
+ /*
+  * Boot a secondary CPU, and assign it the specified idle task.
+diff --git a/kernel/cpu.c b/kernel/cpu.c
+index 261b5098f81c..4fae9b61f442 100644
+--- a/kernel/cpu.c
++++ b/kernel/cpu.c
+@@ -134,6 +134,12 @@ static struct cpuhp_step *cpuhp_get_step(enum cpuhp_s=
tate state)
+ 	return cpuhp_hp_states + state;
+ }
+=20
++bool __weak arch_allows_cpu_disable(int cpu, int tasks_frozen,
++				    enum cpuhp_state target)
++{
++	return true;
++}
++
+ /**
+  * cpuhp_invoke_callback _ Invoke the callbacks for a given state
+  * @cpu:	The cpu for which the callback should be invoked
+@@ -985,6 +991,9 @@ static int __ref _cpu_down(unsigned int cpu, int tasks=
_frozen,
+ 	if (!cpu_present(cpu))
+ 		return -EINVAL;
+=20
++	if (!arch_allows_cpu_disable(cpu, tasks_frozen, target))
++		return -EBUSY;
++
+ 	cpus_write_lock();
+=20
+ 	cpuhp_tasks_frozen =3D tasks_frozen;
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defc=
onfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
index 0f44a94..c8caa05 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
@@ -2,6 +2,7 @@ CONFIG_POSIX_MQUEUE=3Dy
 CONFIG_AUDIT=3Dy
 CONFIG_NO_HZ=3Dy
 CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_ASYMMETRIC_AARCH32=3Dy
 CONFIG_PREEMPT=3Dy
 CONFIG_IRQ_TIME_ACCOUNTING=3Dy
 CONFIG_BSD_PROCESS_ACCT=3Dy
@@ -116,7 +117,6 @@ CONFIG_ACPI_APEI_PCIEAER=3Dy
 CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
 CONFIG_ACPI_APEI_EINJ=3Dy
 CONFIG_VIRTUALIZATION=3Dy
-CONFIG_KVM=3Dy
 CONFIG_ARM64_CRYPTO=3Dy
 CONFIG_CRYPTO_SHA1_ARM64_CE=3Dy
 CONFIG_CRYPTO_SHA2_ARM64_CE=3Dy
--=20
2.29.2

