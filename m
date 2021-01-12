Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web11.10408.1610464874603150840
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=g9Dyunro;
 spf=pass (domain: arm.com, ip: 40.107.22.43, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2grqnjD9nrJCJF/mEdvPPNrWkPtp/I3nqWWV0Py3JM=;
 b=g9DyunrojMwN1x784JlWxCs3/TuJZleeuWTViSM9qkZJLhPnz8cy0pL7GCRxb3ZeJBOsM1uuc+6+zz1KdlGOojONafKUYOHFRnYlj7VHjFmtRlxJK+Vu1WiJDrnwHGEthYntEO/iBq6xqjPuaXqOn/ir1Eu1AnCtvt1qBrSlRM4=
Received: from DB8PR06CA0046.eurprd06.prod.outlook.com (2603:10a6:10:120::20)
 by VI1PR0802MB2464.eurprd08.prod.outlook.com (2603:10a6:800:ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:12 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::61) by DB8PR06CA0046.outlook.office365.com
 (2603:10a6:10:120::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:11 +0000
Received: ("Tessian outbound 2b57fdd78668:v71"); Tue, 12 Jan 2021 15:21:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cfe0cb0411100ae
X-CR-MTA-TID: 64aa7808
Received: from 508110629080.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 49952C60-C853-47EA-935D-F33588BDB8D2.1;
	Tue, 12 Jan 2021 15:21:06 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 508110629080.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpATyeKNlBvfFQhzpWgl+hl6fD+9t8BjZ7hi7WVe3e5sfv00pMd25rz67az2Ah8ifAnijMDdmThdGvsTxwzROOvEoaimgo9QNhxXG/0/Zjn1TYWr2pHvg4uRrT5kROYBoriXede0ld+OXHzU5YPTx8rb4Uz3BV+KfjTumKk21mBrSpo5/5Jb1AyIdwtKA2moShG+8MbOBwFTDOeRZA7i7tIwmzC6/O9voZZemCFNk/Mrlw4KghhPr0h+h3vNqZaAQ88oIV+m5BTSWyaxV/o4Qd3dfDD0tJ+tgRm7UCEDblI6i9HwDbrBnp8t9fJ253tdaW6GbvGxUUw+9egwUItXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2grqnjD9nrJCJF/mEdvPPNrWkPtp/I3nqWWV0Py3JM=;
 b=X/abRcDXWaUd+SCtMZUklC4lGXCtcjFLqlW7kyHKb4uAaNJxHBO3oebuUKD7yUuM9fZow87XrpHNGnM5Oq1E9HMYNwMmqSylj2uO4eJlE9i5QaDkv0NJ+BYl3ScL0LXud96doexpb9uFnRvb5g9GfcuSYAsYtUcMozu6KTiJkYGOvwqYDcaW9wExdlcPioepuPAUyO12YUeTC5HbTtw0ObqLiM7OAxuKY6OAkVyXwcXOXtvmQ153051eda2CAGBNN/CghuQRCkMBS+uIe89xlMRwvfiw57SckC3p9c6FplztqkOPXgeugTCy/2ploGmDwrhdHCg6TsS1+B/uzFKNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2grqnjD9nrJCJF/mEdvPPNrWkPtp/I3nqWWV0Py3JM=;
 b=g9DyunrojMwN1x784JlWxCs3/TuJZleeuWTViSM9qkZJLhPnz8cy0pL7GCRxb3ZeJBOsM1uuc+6+zz1KdlGOojONafKUYOHFRnYlj7VHjFmtRlxJK+Vu1WiJDrnwHGEthYntEO/iBq6xqjPuaXqOn/ir1Eu1AnCtvt1qBrSlRM4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3053.eurprd08.prod.outlook.com (2603:10a6:803:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 15:21:04 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:04 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 08/10] arm-bsp/linux: enable ffa driver for TC0
Date: Tue, 12 Jan 2021 15:20:47 +0000
Message-ID: <20210112152049.3436645-8-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 364ebe01-b5b7-4850-cce3-08d8b70db1d2
X-MS-TrafficTypeDiagnostic: VI1PR08MB3053:|VI1PR0802MB2464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2464655D6C9F7B85D67FD659FBAA0@VI1PR0802MB2464.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2N5k9dxGAh7adW4wCdad0klu4SN/3X/XKWDqNlYHpgfe3mWEvaUSsenidno4XQfVKEn2iENhdwbS/3WUcxQOQqsUCvkS6spKiGlavYtQquYkUu4W4YVryKt8gtjzrpb/IWM3S1RaAjA0gqIunQhYt95nnVJgGwi339TBVTFuQ7cTB1msxDi8+hJ2x/ahATHpEOTt5ZkIRqSsO6GJNP+LZeNF8IEeVSrhgJ0foaSoa1cIV4a1IhTDDf3eXUvtsAVRdWSzJJYKcacE6OfAcRUnuTtvU2AVhKQcO+ndcR51Wy48V31Cl1XvoIvQYREPBzSrvkn6FMjyJNrXu52rymDEGVNpjlUYTmpx5lDfwO5N9ooA7uQMqPGOYVzIKNYp1d82zxu9z4yqeBtkKnuCxQmVeg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(66946007)(1076003)(36756003)(6666004)(4744005)(16526019)(66476007)(44832011)(186003)(5660300002)(8676002)(4326008)(7696005)(52116002)(2906002)(66556008)(8936002)(2616005)(956004)(6486002)(26005)(6916009)(478600001)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mTzCu0XpST00XLm/aPupwrPLYG3YR4v4yyEtLtHYyA4myGgTWekDy0XLakhQ?=
 =?us-ascii?Q?KfJ6nX8XENjz0vTWfUSLpYdo/3V/KmaHH9WtHMtyXZGt12WsI1VIrY1xRpNX?=
 =?us-ascii?Q?2pP/hhF56agGQx/ZL3Tuw0TGIqZS9zU3T7BNYdI6GkjWP7rlqznvwm/SBatq?=
 =?us-ascii?Q?s20glgd0RoeJMNc/kizfAPjv5rniBBKVxmb0uATzeIDEfGmIeXdEGFy59ycr?=
 =?us-ascii?Q?0lzMmWM/3j1bTO3xs3lEdIUZ4wHeAYDWMPzSG1pi8o3JNmgSnepu1R0TaVlM?=
 =?us-ascii?Q?KwNyUB0Ug+d599xv1Pf3wKmELviSighi+jSlq+/7nznz2ISRtawaN6aGp4cf?=
 =?us-ascii?Q?bX0Hell6nnkJm2Rpk8S0+K3hlZ/x5tycFrXq8RM2ZaKWT8DMRuThQzmxtfN8?=
 =?us-ascii?Q?ySDNdVLrFGhhpDBs5ToHpzYK18omd6UmH5hmCOd4kYtmFD43Aj5ZnwVpMZKg?=
 =?us-ascii?Q?QuiOcpnEPH81u96D3OHNyRrESLCS7P91rfZpjiCCUmOacOTymWsbVGdes97H?=
 =?us-ascii?Q?rIeK35j1S8AL5FAetrAhVERCtboJ42DNyobB1W8O+ps28fWydhx3F5SRvkRD?=
 =?us-ascii?Q?ranyQtaG2FEaNIa28FqfwRCKXi90lBv6VZxhXla4HjSa280kNJ9IxEKfyrsl?=
 =?us-ascii?Q?uAQpjBhfGAcedmKb56Odmh/Oj9MXmCbCCMfQIquWoijTUqE0JvXPK+e/wmcG?=
 =?us-ascii?Q?hMAZVu8M9UeG23zzVa2T/QwKkfSZuA1nKuVQM0DfWBz/puzW3m/jGsjnJ41Y?=
 =?us-ascii?Q?ZciG4P9LcwUDF9hVDxW4u/1nZfSkKHLCnXT28pgxQzw2ls9iKF3mky5ZJBGB?=
 =?us-ascii?Q?LiOyLfs4qx+2JEisnEc4XwpxzVmzxoqU9vmgvHa+FGNbi3HpZYeTTy8vbaGe?=
 =?us-ascii?Q?nyWON0akH09OKiDTMnN6XnwRf3Dd3Pme4CEIgZ1FXo0F10Nw8X6lgP9kLyBD?=
 =?us-ascii?Q?4dWYAvWavvx+7SjznnewUc3X//OGYYavkE4UI8f7tpEym+Kv6DUwUatULews?=
 =?us-ascii?Q?1q4L?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	197cc6c2-97d6-42fb-c9b8-08d8b70dadae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jLai9XHCYqMd7TT1wgySGd+ku/JTidHoFmee3QKbyzIqaLVi1rIXmJUq4rKTD5nZ3JQWmn/OLsyuPqv5IrJAVLOaTDqlj21WnZU4mWgJDxbGQPcR36eAYEsUKnnHs8/Z61ifne3Jhed4PJsiydO7LchI/yQM79NWnb1SJzcCEqRmaTCHOic6wkiB8CJWgNJyuzkVbLjLvyP6YoaYPJiJ5g72GDnPZN40LZTGsCkgHbr3YMkn8HqQh7k5v7IHVDLTCw1Zi5h3AXzxMssyJCKUd4zZGuxntTJNPJ6N/j6Igi7FzvRuVWmZWHRfUBn4KQ8Ch7pX0XOgQJ9RlaQNs9nxjmo99UxSsC99oPaDae4NnRaMck5aPN1GCpALGtQMHx3VGpYQ/raxiE9coPrAVvUtzB0N86qKmjC8jxohslDUwuuaY5Odr+8LHybdpvlb2nhaFqt66vAp/3AdfYgUS7H2YhwmhbV6BkCjRYMSSCc+Phgn8On7HrV4pfqT2hsqhqn3
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(46966006)(70206006)(36756003)(356005)(70586007)(47076005)(44832011)(2616005)(81166007)(4326008)(336012)(82310400003)(34020700004)(82740400003)(956004)(316002)(6666004)(6916009)(4744005)(8676002)(5660300002)(6486002)(26005)(16526019)(7696005)(86362001)(478600001)(2906002)(186003)(1076003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:11.8675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 364ebe01-b5b7-4850-cce3-08d8b70db1d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2464
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Enables ffa driver. Sets CONFIG_ARM_FFA_TRANSPORT=3Dy

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I71ffeb6b3bc5b28c34bfab09cdcc66227203c74c
---
 .../recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defc=
onfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
index f858f51..0f44a94 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
@@ -102,6 +102,7 @@ CONFIG_ARM_SCMI_CPUFREQ=3Dy
 CONFIG_ARM_TEGRA186_CPUFREQ=3Dy
 CONFIG_ARM_SCMI_PROTOCOL=3Dy
 CONFIG_ARM_SCPI_PROTOCOL=3Dy
+CONFIG_ARM_FFA_TRANSPORT=3Dy
 CONFIG_RASPBERRYPI_FIRMWARE=3Dy
 CONFIG_INTEL_STRATIX10_SERVICE=3Dy
 CONFIG_INTEL_STRATIX10_RSU=3Dm
--=20
2.29.2

