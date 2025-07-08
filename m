Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D53C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 15:33:04 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.34])
 by mx.groups.io with SMTP id smtpd.web10.21780.1751988780402831435
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 08:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EYSRNcmV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EYSRNcmV;
 spf=pass (domain: arm.com, ip: 52.101.70.34, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ynqP+dpNu6Gerix9MK4HPSxP58kGNf6+QB67M8pRnAr3XVvpbBTMtkRR96VElnGx3G4GBnN1ZbB38c2xm3PCGnz2J5SxUh3FGHnNjqKaz2k5Tnh9sTy2zaCWWnQvH9G1h8YXVl9Bdu0CFRGP6u2s47If1eUNZ38fIOLLtinB488Oq9USyMgX0phsdjIXZivbrQUt8gmtpFvIdbmrxDCejHaa75lhYnIbL9NEsNaDnnbDKRFQWPyss7fOh4Ceas3jh1YEuZ8LDNlw7o/uac+vEhkSzRCZaCAqmQsX+sB232kAmkpchK7OFkVq+7rjrTg9F9WSSjVKZJek+MAD63aSDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLk1UU1YOGTqzuioNb4NshHE3M2ESx62kXOZ/ON38Pk=;
 b=ZIxevGTXhpnVtFR4dAmb5Sg83k2Z16/NaGX9bRW7nR59s8PGPY5bZStm36UvVQMoXKxtgOFILt77ovkQ6sG92ixeaQDidWUggk0RxuetE90FFD7D1BsVUPIPKYBnZh3UYMrXpQBERjhkHXndQA9h5z65IhMLS5kDa0u4N+q3uhNmxutcMTdCfnBKv+43E9wAZ+ruxmdVG/fQen6MmF512//oKZTZZUD/3tfUrDRSdQ5gpYCqoIeQxct82NnKX1UMaA3LYbEn6t3NGx9q/5DxABbXO5FKLPgpcm4fZ+ocbUAgAK1Lcb4gLQsmncCUKiy7ZCEMVh8EWN7xyawj8ke59Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLk1UU1YOGTqzuioNb4NshHE3M2ESx62kXOZ/ON38Pk=;
 b=EYSRNcmVrXc1S7hvuFJZDQSFN63BdAKz22XyTDqrcslHXwLwkg49fXBSJhqHzeBNzJE9yNYnzZtsLsQMGkfL3TZ04AauFN6UjylQJ1wF40yF/tGsxX/7e5jijDHPpPyfBMtnlRdEl3+zIQS7vkt8JNOhnoiNS+lEfEhG1ha5gA4=
Received: from DU7P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::34)
 by AS8PR08MB6133.eurprd08.prod.outlook.com (2603:10a6:20b:298::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 15:32:56 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::f3) by DU7P251CA0013.outlook.office365.com
 (2603:10a6:10:551::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 15:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20
 via Frontend Transport; Tue, 8 Jul 2025 15:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c14aExqi1x83aaiC3FUtx/4sKWQXEPno8ub7bv8EwdU7C6N7jVaF0/u4YHv0aaSlH5wFkbeC0ePzDZEgTI6ypShmkHfX/G0duMugjbAZRH/bhWpN1nWRMi00UIhBzwmxPXT/7nBSQnRfemMCUjeZHWG+SpdcSUdj10K/a5OqpzciDoFYASCbfHflFd9FE+6M/ScAWn3FwFFyAjlhSYIdDjdDmFbh/VYd+S4OP03Ds91SWJAgpMg/CjNvrolqF+lVCMYb8g0CbUCKSfR2HVHpj057ABDEbCJPuR6HaFMXlRjOVq1O0kaz6ufEZvp9kS0Uz2cvuWys6bbUK5qrIrfByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLk1UU1YOGTqzuioNb4NshHE3M2ESx62kXOZ/ON38Pk=;
 b=xQVSvykcIGMwxUrFjwvj/cBlRIQdQ/AjLxhcGtylpZtN5uD8UaY/ZwMUcaOwl5/SRGx+X/8H4ex/OaA68EimETZEr7LI68nnLZnWyLdqOfcGWr91e2Gk0QKtIPmd3oVOCOUomSix9nZbLVTO+zyiD9QLEPElw7DymYA5iVrqyILlbDBEbpUtrWhIBRVFLg62ivbmwTU/MrWco8FZYuqo1loif+NMLe7IDawsI/wS+qvgYsl2yk9AD8O2JxM7nW3NincrZikd1d2kgDfJEyRDdCic76S3anagERR906CUOn6+/9Is4YgK/9mkbEWm4bmNakS8OiSzyMXfIBOU7/OOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLk1UU1YOGTqzuioNb4NshHE3M2ESx62kXOZ/ON38Pk=;
 b=EYSRNcmVrXc1S7hvuFJZDQSFN63BdAKz22XyTDqrcslHXwLwkg49fXBSJhqHzeBNzJE9yNYnzZtsLsQMGkfL3TZ04AauFN6UjylQJ1wF40yF/tGsxX/7e5jijDHPpPyfBMtnlRdEl3+zIQS7vkt8JNOhnoiNS+lEfEhG1ha5gA4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8658.eurprd08.prod.outlook.com (2603:10a6:20b:564::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Tue, 8 Jul
 2025 15:32:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 15:32:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-systemready/ir-acs: Update URL
Thread-Topic: [meta-arm] [PATCH] arm-systemready/ir-acs: Update URL
Thread-Index: AQHb8A/xd+in3EeGZUWey4mFmDEOIrQoWtSA
Date: Tue, 8 Jul 2025 15:32:23 +0000
Message-ID: <04ADA2D9-978A-4FE2-8E48-4E1BFBD42E3C@arm.com>
References: <18504B2CE0C96EFD.27764@lists.yoctoproject.org>
In-Reply-To: <18504B2CE0C96EFD.27764@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8658:EE_|DB1PEPF000509EB:EE_|AS8PR08MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c49236d-92a1-4276-3162-08ddbe34b672
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?sFgl5OKniUHV9OfjkymmrKOxxtNmB2F1lGXVk4Gal52RVAhHC7UxybvuA9ek?=
 =?us-ascii?Q?bk4agSKbTKJMYotZz7PpXqzMW/1nqP21h6MVWw6kAXDQ6nQ4GjyG0un3M4lC?=
 =?us-ascii?Q?FbHd0Vqm9OumemxpSPUBSJXGftxHiqCvZo8BAoIkE50wNu/NBTNu0FYPUIZl?=
 =?us-ascii?Q?A9pfvb5Kb+6s7TYCEWm6yv5gV7XFW4q3XLRPYKwq3MuTwq76k3QeeTyul0DA?=
 =?us-ascii?Q?XmnXxqrr544hoG94hXoqqbBYBszlfzSTmfH8LQCtxSC+kh9S66SJYzmUZ8Gh?=
 =?us-ascii?Q?V5lQgN5P6XgHxJr2NK3GLwNg0Dha7+jQJSLAPqiuwR2QpTIOgiLI+/5ika1v?=
 =?us-ascii?Q?xVINTjck311qDYVQ8EGz1YDWzeauxrfGxMvc9xZsad9IUFKFunKkPw+EokXL?=
 =?us-ascii?Q?cWsIWkYZGz4T52Zt+fdtBbvvY76jFVuJX575JDHu4oO4FcOsmGaFyBJiHINw?=
 =?us-ascii?Q?wu2IFaxFi4dDebycEWqupAtECw6wpLavBDJB9OLy3wGq9+ZVv2D2jXzLmiTy?=
 =?us-ascii?Q?yd1Xxqt+1/FdAepiLhXQSmhwQ2F3ksV5nfu01V89N1LYuY7rB//+r0YcQzr3?=
 =?us-ascii?Q?f/qU9cn/mJRthWONfY2tqeKyQItcDVP0KvN5RcKdTHsXAwNEPt2gZ0GqncaA?=
 =?us-ascii?Q?9KYdo+2qN0hFjHY26/+M2wQI7i69sNAkHlAwuFvQVziRTPKmYa1/2zjIWM3F?=
 =?us-ascii?Q?G5A/39gnzdVkl3WpXOFK4uSFNeJ1ckaBhdb5yORJE9RVgefNjLlpO/vmb+Yt?=
 =?us-ascii?Q?v7OUIrw1jZCbY+jBTBvGgNexV9/tJWKEU/Om81wh3UhML/R8hR6atG22i5Hy?=
 =?us-ascii?Q?OR1Jm9/djN+/ygi6KCRzyz2b0s/JCbDiCj6j0m5ujMOuoyiMEtY/9oZXUuQC?=
 =?us-ascii?Q?CLcLWaiV2dQCshjMWPvWHG+oZu8xwYLtNxKRdgA3Arh+WyLxGY80pmh4bGNb?=
 =?us-ascii?Q?Jzx0bwtT0WsSn6cNh3Hxv4Ts2h0Ja9vnFpBQp4xR1e/1TP1aYWQkbCQStuMk?=
 =?us-ascii?Q?c02rxmClZzZZ7LkImP3JZnu1i12SP8svg2hZd4/j0miTgjOmWJs694jRQtOS?=
 =?us-ascii?Q?PZdiyAMkazl+YKwH/EI1xFLWVVJETVwRt6X5cLT655hAzQgygpiVIOnFgUCD?=
 =?us-ascii?Q?N6Y7tu8Ix6izFmfkhZE4RqpPs6M548OjzHFcBCvMJL7KewAZJh86jKxgmsKg?=
 =?us-ascii?Q?r7yJ6zZllTuoMF6dhkojgGe5V+ZCHqqVIrCAjO+Ctw2vUYusG0pMWK+MlT/q?=
 =?us-ascii?Q?44oUSDeUX489B/xQYk64Bitv67u4MRu1tueEjBtFRS/A+O3dcb/zS0mHBkCN?=
 =?us-ascii?Q?oFJyoA/0lQv7t+oAogM0cFy2jo7Mhs/CRfb1Nv+5TIG0LCabwjlFgukHGqqV?=
 =?us-ascii?Q?BbLc2aGqCM2Sr9Qrdp1IyaO8IezIwvS61oS0p7g7E0QiK4tPIQldlVmMWjxS?=
 =?us-ascii?Q?DQECSYoymDSrj+pCjyTkuHiNRpcLTszZ?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0FE68B1EF43CF043843BFD44AD6AD344@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8658
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5af65c22-037b-4db2-b283-08ddbe34a2b7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026|4022899009|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Od+NI1yHRGHc80iztfyVqaETg5Grub8XSYWx3Z5Q54foPEbLFzwp5zh9gDyw?=
 =?us-ascii?Q?CCiplWiQKCK3TrHaNNGoQDqwVz16UPu3yKof47v/U6SCn6Q6abe8jBUyxIhG?=
 =?us-ascii?Q?GLU621a/QtDjhwDyZufePyrXxIuQDrgn95u9PFFUEA7487RLnofAfJZiFwNY?=
 =?us-ascii?Q?Osjm6RvfWq0VRrwjIz4SxZb2ufBSCv2Z4VCvjT/eYog7HhruJABwAvHRTjRy?=
 =?us-ascii?Q?cN3QxOHRDsY9Nlw9DsIg0/XBdQ5ADelWAKzTbuiItB+BlnKoiur/Erq04ri0?=
 =?us-ascii?Q?KHsjFfNkwUO+QlT/95EYqBHlpidRYzjg8BzBiAVKflwm8ssNVQ9384PORyUm?=
 =?us-ascii?Q?x8vmkFKSJaWx/wsrLC9VxsADhsd0jeZYz49KO3L5TtPgoXvpIHOg14bF4WVa?=
 =?us-ascii?Q?kj8Gtvsngi/fzb/HvtRRjwRt8AMOubQ/8EGh5m2t6eb9SpzpFqlXpzKI+lT7?=
 =?us-ascii?Q?CnyauEJuh9vOzp0258xHYyyio5aGpohnJittoUy0aPBAQ3X+e8PNWKST41Xs?=
 =?us-ascii?Q?vb8nioKBFocJR7x+ivwD1lu8ISnVjI7KOkSuaPAwiCELHoNaLqeENUWnJai6?=
 =?us-ascii?Q?9+hC+qQ7BoIRBA9vX7mgK85JQG9fMxN/+w4S7NGdxg6baYExjdYhwdQHh/cl?=
 =?us-ascii?Q?YUtf+mM5jRHziXZ2+77neuq3FgEEVY0/WcHfmvKeh/lqrIvJ5b+3irP0SsTu?=
 =?us-ascii?Q?QQDzR+GDNU3hu+cw9q4/fw/MMMKDDvmhEq7z8Q27bMTLdu3sK//snTUgaAyW?=
 =?us-ascii?Q?PESVL5zbMCwdXoqomGG8YOA5GXqca4cSOS0U8C7XnECJXn5n5Y6YQdCzlMhA?=
 =?us-ascii?Q?aGzbVVFCljLDSMh7MqWaIp5VNlpN3+pv22Oaxk4BwvUXkZ/rkdVzM7cpG8Rm?=
 =?us-ascii?Q?eCgc1IhfSmNiv1aQOpCyOwrG0Ia8BcBjGzIDEthNOp8Pqhqajh5HhW0gLJ2W?=
 =?us-ascii?Q?32DPVUTmgpN5laig2Z3Xdu7optZzyr/BZ3WAMZXXURyGeK8YAj/PzH0nBkST?=
 =?us-ascii?Q?s3/1wpaTRq0OJCa3XTNK872mnDoFva7G/Pl4Od0gcxzU0j2ay80SiLysMZlF?=
 =?us-ascii?Q?M6Br3KTXUdztUquDWVjMC4b8FXJCoRRi+we3YXHrS77sYq5/sd5/830TtH+f?=
 =?us-ascii?Q?A1FPcTQYf79cuQbSWGullOpkHOH8F3xoxEBhMIXVKlPR00QUGS0bVL3xma2y?=
 =?us-ascii?Q?Rko8U3G7rOgESWYd1LHSDZD+miGCxbBPBV/32nP2Hyi4D4GLUrke+eoivKxF?=
 =?us-ascii?Q?qb3bxU4lL1Mevy5f0L69j6AcK5dx2upU74CIvy+SGR8X6oKSnnjprUshAiGT?=
 =?us-ascii?Q?M6WGDx1HaSG3GR9VoWDKo5WRRk+AwYSlbt4aINgv2+6TPs90qurBlDoU/dc9?=
 =?us-ascii?Q?Z1MHqwkGzZ/FaR4MMLC2CUdSl8Ytnk1PebpYXuIS1I0EIiDnhJMQadZpmbi1?=
 =?us-ascii?Q?kFaxqRSw4bFeIqd2NaPeR6WZ4SLTHrkWyY/HgOmOABnEdZ+1/9sCnA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026)(4022899009)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 15:32:56.4571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c49236d-92a1-4276-3162-08ddbe34b672
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6133
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Jul 2025 15:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6604

Sorry, this was meant for [walnascar].

> On 8 Jul 2025, at 14:55, Ross Burton via lists.yoctoproject.org <ross.bur=
ton=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Jon Mason <jon.mason@arm.com>
>=20
> The github URL where the image was located has gone away on the master
> branch.  Update the URL to point to the legacy branch, which should stay
> around (according to the documentation).
>=20
> Fixes: aebe535aa8c3 ("arm-systemready: Introduce the Arm SystemReady laye=
r")
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> .../recipes-test/arm-systemready-acs/arm-systemready-ir-acs.bb  | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-acs=
/arm-systemready-ir-acs.bb
> index eef1c0456c..3558d4a08e 100644
> --- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
> +++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
> @@ -48,7 +48,7 @@ TEST_SUITES =3D "arm_systemready_ir_acs"
> PV =3D "2.0.0"
> PV_DATE =3D "23.03"
> FULL_PV =3D "v${PV_DATE}_${PV}"
> -ARM_SYSTEMREADY_IR_ACS_BRANCH ?=3D "main"
> +ARM_SYSTEMREADY_IR_ACS_BRANCH ?=3D "legacy_systemready"
> IMAGE_FILENAME =3D "ir-acs-live-image-generic-arm64-${PV}.wic"
> SRC_URI =3D " \
>     https://github.com/ARM-software/arm-systemready/raw/${ARM_SYSTEMREADY=
_IR_ACS_BRANCH}/IR/prebuilt_images/${FULL_PV}/ir-acs-live-image-generic-arm=
64.wic.xz;name=3Dacs-img;downloadfilename=3D${IMAGE_FILENAME}.xz \
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6603): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6603
> Mute This Topic: https://lists.yoctoproject.org/mt/114046582/6875888
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross.burton=
@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


