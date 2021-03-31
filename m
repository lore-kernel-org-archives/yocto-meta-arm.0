Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.87])
 by mx.groups.io with SMTP id smtpd.web09.5593.1617191655456466826
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 04:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dNQWc6kj;
 spf=pass (domain: arm.com, ip: 40.107.1.87, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al6lYczXFtryQoJgqyvZdOZO4+lLddIWajfilWKnktQ=;
 b=dNQWc6kjnq5Nf9zbgiHd2q0csdD0NcKkuFcmITGfUwW0XolkK8ip9L7Wh5XJ0ZvTkB5nQZfVMF/EVT41xyMFIfIubT+pqm7BFMCE6IT+xHDZ7PaFdZVo6xnwi2u0/NSGYyHvAsMsqdIibgm2HoQuQMyPuHkKsIJ995vKCD+Bzwk=
Received: from AM6PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::34)
 by AM4PR08MB2817.eurprd08.prod.outlook.com (2603:10a6:205:9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 11:54:07 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::7a) by AM6PR10CA0057.outlook.office365.com
 (2603:10a6:209:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Wed, 31 Mar 2021 11:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 31 Mar 2021 11:54:06 +0000
Received: ("Tessian outbound 5d7eb97a0505:v89"); Wed, 31 Mar 2021 11:54:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a2bb31c815866c9
X-CR-MTA-TID: 64aa7808
Received: from 101b76c58f54.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A6A6903C-8AED-48E6-B0D9-860E99B5C9D8.1;
	Wed, 31 Mar 2021 11:53:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 101b76c58f54.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Mar 2021 11:53:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odDEwnJuEJ593iJTBnyactJVYHvnvfTfXWxG9FZm0VVDvVuxJai+YXThlBgyz9/rn07mJZQkQICOJqylxLV2+ygqhc+tHTJmNfNqR0OA1AljCQst5Tf5tfWM1HO92jLV3iXFscQBazLHteptf6gf/f+zafEAllCDl0ZrfTu2Mf0hH1E/xgiUeDyyW72Va1BjOJGn21Mhpl9pS/kIS4jkvtnyqlP27uAvH+6xZ9StLsp11xXFlNg4kSMUXu+WWA+WY0UTVKo0V8eqsqwthy8DBDqPrRQe7Lmw7dqPIRy2+4NFpP5c5+ZBF6oZPzjoC0GRhxmxbELcGLGrOnAwr8tt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al6lYczXFtryQoJgqyvZdOZO4+lLddIWajfilWKnktQ=;
 b=TA08sh3PEqpQEd2/Fjxs3pPU4mds4kHSpijz0pTXp++0BhOXaG4fzXsv6Y4nV/rdt8wjBSqnM5YFoVrWo6q6LW7caQHGB9LVPLJJIN+bK5G3L1xh6JuvN5cqiTkeSiQqai20X/eNsm0fHxotvcc40ek2V4TwdssXuThiZzzYgMYtb+IeCt6yW/9yN2l54hd7ni7PaJdG3cww8DLLqCjeIXBZ5finCONa7W57STnDN72WFI/Zp2MADxMm/rrqFG5TUMA3igKSF6qVZt3DF95R3NXE+DvIEZdK+VJq/hEOgVtgxJLq3omOTfRD3Jg4Z/O7VkVb05LaPFHNp2dQWNYmsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=al6lYczXFtryQoJgqyvZdOZO4+lLddIWajfilWKnktQ=;
 b=dNQWc6kjnq5Nf9zbgiHd2q0csdD0NcKkuFcmITGfUwW0XolkK8ip9L7Wh5XJ0ZvTkB5nQZfVMF/EVT41xyMFIfIubT+pqm7BFMCE6IT+xHDZ7PaFdZVo6xnwi2u0/NSGYyHvAsMsqdIibgm2HoQuQMyPuHkKsIJ995vKCD+Bzwk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 11:53:56 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 11:53:56 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/6] arm-bsp/linux: Introduce arm64 generic config fragment
Date: Wed, 31 Mar 2021 12:53:44 +0100
Message-Id: <c233b5214d687b017e44a4a5bff4c1af89b8a953.1617191477.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
References: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend Transport; Wed, 31 Mar 2021 11:53:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c26bf41-59fd-4379-0533-08d8f43bb00f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6536:|AM4PR08MB2817:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2817E6188357347B2AE2DC95927C9@AM4PR08MB2817.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7Su5Nrw8T2gV7C7v+xjztNdLKXdTkstJ20dAcfCgod6+mdNTc2t4haiw2aLnkx51JMD/p3coyYMTki/PxwQp6u5uHrdWRbBG15uO9fyCoRmk7wENOdl5xa/ZzIAodmRlotSipAVOYKZXPNeXLEF+GjZGJ2xjTCmWOnQgvaP3edTv0pKUgnSpjGKHxFRzGPcBRy702/yaNSfulq/l09/K81Hmd+vNCEVw4tJrFNRASQqkYluvutDR7QXW8Esj8BJwivyJXTdPchBTdUD0O2vR7lx51S+kuCp6F6WDN6jC2MWDFLNZNbBzEVAq9LaC9/O31+WyfXSo276lUz7Rmtgwyf06pnugm1JRbsh/mdK13PoVN0ryByLhLuX9qnA9TnLNPmfllzXNS2UhybfqMVHxta0enhj5x58AgLDQAzlJpTJpJZhTnqqXozomtGhH++KQXxbnr5VKggpJ+5IKteVmEYERK91cCj0IKsle9ZAVBwqtbnpICZCAlLV0qJ44hp66xNI6UEoQtn4loDKii1oRN7qYvSEnqwJhN5iTcIIN9tMMexmaI4MeFxYWho3QpK7OxDXPcNPRn9UryPQZBqR3naT1789lyBCSXDuAih8LV2LMhi0PwIzhZQOi8g2TVxEBrbTCxfTN+Y/zDrRG32xFNfnXyKvSUux+KswslQC2uVbaLXZrhpuq4ISYJvN6VvLX
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(6486002)(316002)(66946007)(36756003)(186003)(6666004)(86362001)(4744005)(2906002)(7696005)(5660300002)(66476007)(66556008)(26005)(52116002)(44832011)(16526019)(956004)(2616005)(4326008)(6916009)(478600001)(8936002)(8676002)(38100700001)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?cjmSj2zLzY8BQlSexNS7vg6V9qDdhX49qS0CayjEYD2qQJxsvEUqpnumyNQZ?=
 =?us-ascii?Q?fsSEMKMpx3nXu+xeHhe+Z27HvWy5eFSVC7WYElMVV/aOIYEAyzJT+JKNWFaX?=
 =?us-ascii?Q?GRO0WiweqKa78GxzJX58h9MGb6fYHD0dyuJ/TpyRoWYCQMZPl27TxInLfXpa?=
 =?us-ascii?Q?rAhqwAnuYqqHELDwzvgaYeve06bPVggKH0DKYbKJCdgWE785RvdxM6XkJ1iK?=
 =?us-ascii?Q?i23NK2O5cyXNWxKhaGcjLVl19+0YiHp97GyXVYl+fCxUbwnE/uagjTcH8FWf?=
 =?us-ascii?Q?EfSHFKBHlq4jwLR7yf3iiyFgXUY2a+pfurur14Qr/wDCtcFPCRtumJrUVEFV?=
 =?us-ascii?Q?tSKOJXYTvFSR/8bHJzF9MCDjH5rGfANEq57sHn9LNlk5K0++9xEK2NL8o0T+?=
 =?us-ascii?Q?7XIBhGU89e2eExeUK2UT0K2E1YfdH44fNCdKgb0FdO0UYe6ibGxAGhQUsJPC?=
 =?us-ascii?Q?5MVRCrXmQi20GGxOMfPp6w0oTEjg5+awERBRTafihiBdYlcVC2EvVvFD9lg+?=
 =?us-ascii?Q?6thCH8XpiGUaqjlSBnoykhLUGveO5Gm3rHQBP0M43E7/U9h3FRpKSYvbNskk?=
 =?us-ascii?Q?/3ptvJJf9vZciOdR4qFgizm3ej+RPgPBG1S0vDOhvJQVuFwI5xDpafLQFDMH?=
 =?us-ascii?Q?IHjKJuBCRobRzR44NSn1mkgJf+bFU0Hbs5jNEgbsNCOoRxPiks70arZGO7+R?=
 =?us-ascii?Q?H3heQTzfQQfFFA4GpbSbuLVNJ/74uDDm88KWUVNQAAO6ejgWE2AzEmtdLiN8?=
 =?us-ascii?Q?2JbwvLhBHEp2Ruf6S2qBfs0FTfR03er96yp1GjTOwoTKSoImkPO2WlXOlt4v?=
 =?us-ascii?Q?0xfwKThfWY38GnBDv6AiqnKmxNTnugbZUI041Ns/1gcRZpJq32XiOM3RokzS?=
 =?us-ascii?Q?zsDHLph07LHn2iTs3LYAs7skYHQIz0M6jTUEP6Kr/f2PQhUgWnNVKnYxQlSy?=
 =?us-ascii?Q?SyJYqLby1Zueg7wEAzp5H1Mm78gm8Zu+8XFHIX0E/qxs/3G5AyIw1w73aCfV?=
 =?us-ascii?Q?VjcBojzbBStMOB/etUgibwfx3KgbIg05KceeboaYEC5mfXLKDQyog414T8xi?=
 =?us-ascii?Q?Gn/s/NMaPMu/Icr8KPytMrUbyyWcRliqy5BZdIuna91DRgV8DeTkzy8INZPV?=
 =?us-ascii?Q?GTubRFzo4pY5AQCCzgUBvht4GEGw/CbJ3J3GmVC3fIqFQvxa10uoWRojMR8a?=
 =?us-ascii?Q?tXp/noC0LTn+YPRCkF8uAE1fyDds2onFuohmLEtyzcHJ5XtPJNnnty1MD1K/?=
 =?us-ascii?Q?jnShyBKbNF7yuat9s9y4bBig88GgWT0xHycNbpLuDNMR8IEu43rrUm59j/gU?=
 =?us-ascii?Q?7UYYgwKFFwDgoer8Ss0maIoJ?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ea267bfa-4c7d-4ad2-136b-08d8f43baa06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KVPgLTCYL+kTG5wsmLDLoCdtjAxQcqwR7uxqdw7EQpY3Lq6pSpLVx8u7WqrEsiKH9u7lvlV3MjN+2ZLqleBYBpQc5C1q/Yqnz3RE+gMMIG5lSRuDMccBjOp/qST7xpxsfel3/9V3CZF+TD7wHzA73xTIiaZijOQdQlPJz7tdHSCmPyIVoQSQxSt2B/6z7ubz2bSxkJVSNg4kZ8B1iSd2ECUznB1pPVphCo1PZq4tl7Hg+AtXC4MFsUIF63Bmi9wY/bl/SqGR7XQbINkU0DVXZMvuy/hQDB5WKmdy5aUBnQ+jmh+v6B0wGIkOELrcPRjiK6g89e8YSzj/vt9ODSL7o2HF0fWEW02KhD5VOxXjUb6TW20+yihFmn8aF1gvAz2b0RvHqxydPkOYpYA05R6cZklBGHDt9D1I2dbuHzytvVQhrsKZqTOlGM0jr/o08uytTlwrA2/nF9L30z6iM2P7Ocn2fVYWEnQ2Sd9Ibxemmva4NOLIHUpGODR4hhM68aPi6kx1qvFmb4bINCiwZxSI1GaS8WKy6iyfMs2oOJB6ReG7ldVkccN2LRqjsR/NmNBLlhydCmm9R2kxq5IrsvENwdEyAQrJ//LAjDcB4uaRq0oRBnpcjv+3uED2Szv0qAZhIafmexZft9HajdIlrQcJfU7HXLYTxyFgZBuoK6J/QYeFbJ5dbXt5tlM7b4znaMKv
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39830400003)(396003)(36840700001)(46966006)(70206006)(70586007)(336012)(6666004)(86362001)(186003)(36756003)(356005)(16526019)(82310400003)(6486002)(7696005)(2906002)(8676002)(5660300002)(44832011)(316002)(2616005)(8936002)(956004)(4744005)(26005)(6916009)(47076005)(36860700001)(478600001)(4326008)(81166007)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:54:06.5657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c26bf41-59fd-4379-0533-08d8f43bb00f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2817
Content-Type: text/plain

Issue-Id: SCM-2121
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I6bead3d86747874af5db3a4d6ae57b74abf4f796
---
 .../bsp/arm-platforms/arm64.cfg                 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/arm64.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/arm64.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/arm64.cfg
new file mode 100644
index 0000000..62c0238
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/arm64.cfg
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: MIT
+#
+# ARM64
+#
+CONFIG_ARM64=y
+CONFIG_64BIT=y
+CONFIG_ARCH_VEXPRESS=y
+
+#
+# Bus support
+#
+CONFIG_ARM_AMBA=y
+
+#
+# Bus devices
+#
+CONFIG_VEXPRESS_CONFIG=y
-- 
2.17.1

