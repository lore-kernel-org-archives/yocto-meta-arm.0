Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D90CE9D63
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:36:31 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92515.1767713786234530560
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=J22BG3qb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=J22BG3qb;
 spf=pass (domain: arm.com, ip: 52.101.70.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ddjy0BbK92Be788x+V/XkOO0EwrJ2aq3ZFWzDn63bEVfXqcNroUkzvBJGZ83P0Jm9wjFzh2RyKmTEAodowjORBHoC1h45cdCS5AEaZkoPRX8q02hoCFTJdS7fJGqojcqHAGktW3hXxJ3eoBsgHnUOQbvYBh6Nuyjz1U/KQi+O+75ND8voDKit/e+hUOOLR+2F2reuTY617DclmzHGUgGn6qxGABk0ieIPp0Vd7T9jUcmT1oRibZW7vFiR4mQzZKf3GL/5KAjK8+GwOvrndeXuRdFvkhgfE15L4gRZOZkTMNR7cZibunUbppjq66AUNZnQJ+8IKHCV+QyCQKCvmMaYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hkx+H+kIDYNzpyRJpaJYL9VQ0b1cQGQrxyiHlLDibM=;
 b=c0BGGqZU/tmJ0IADlczvkgQI3jltny43EVP7aWX9UaBKI5Vnqf9ZUXWvxB86zENB65fUB/Ox8eR2U1JKrYhHPndNHAusRyDMaS+sIGaftYP8auXLvP3xB4ZtlRMxPF8CDB5RMRqxFQYSV6deTb3CgumI3QXmAAMaGlA9dY4kvFEqojbLXJQ8JQMGIt+RHpiU2yChsUGNLgjRbXNFxNAXXU+g25o53r7cC53q8N1tYjhks1bPl7J8gPZ58rgGTa0tHpR0VUuV1jwtS612YgYyn9EKVFGHaDAxmT/gkwJAXySvIQvnGTtYDynf+ZM+HYpEV8r7pz1CxTF+q4n3Vvmc6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=smile.fr smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hkx+H+kIDYNzpyRJpaJYL9VQ0b1cQGQrxyiHlLDibM=;
 b=J22BG3qbhq2Mb/BL7eNOm9g4sHvoba9QOrPOuvgRxn+YISCNqXI6fo88Edl8DQ6xKfdEhVCU6C+UOpm7JbTRM6ZnN2A2r8muogHXKnLUDGhpbHcjLKUrL2Ev/z16w4Cva9pU16itzFFB3/1wUyBrqKCNTrtTLt7j/fZtt8KRkcE=
Received: from DU6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::18)
 by DU0PR08MB9227.eurprd08.prod.outlook.com (2603:10a6:10:41a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 15:36:21 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::ff) by DU6P191CA0005.outlook.office365.com
 (2603:10a6:10:540::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 15:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Tue, 6 Jan 2026 15:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvEZUfuXBkMt7kGoYqMQ+VB/fmIntgCeF8GE7Q3BTGFhZlgfN6LwfaST5G1gQs56BOW5tBqLgZUbzGVmn5RseVvdUuggQpylm2zN/VqC3/3GHQeBWpO6HDgzBPdEufst/Ns98Qk8/7FOUIbUQ/v0o0vxYgNeOHeOVQ3yrLzTZaYRSnwOE+/i7dNIz3ZukYZRHzv6o6vubYhJSJr1RSFhaq1yB5nXEEX5HnVM9mevuDWpaELdArSKgzmq380ftcAZHkUgDxSA5uwrsT0XRTd5ENZ9HHeHodZGXNYTHH1XyH/LTLgnVEJu9lWr6cgbr4gfb+yQDDJVFsfBQ7R0d5IRqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hkx+H+kIDYNzpyRJpaJYL9VQ0b1cQGQrxyiHlLDibM=;
 b=ScaBdLivqEXby/jFJdx7MLM/jwRuO33oUtZUOJ6ppPYaoeYGtgrWj19uCkCS3FveDp/VESOW10UcuRlyFcN2VexEiIcZ3LW2+F1rvuHF5E99ZsBeER4o9ivkTLqgDFWj0klPqB5DchE6gFU30/dnc3nOEmIRJs3yW2Mou0FW1b+qQcIc/Z8dazGN0z7WD/7to1/JaJ0UvGJZ6+sgkh2MBsFoB07v9D82QtsZBdU2EtzPWh7Xcf4SbK3cF75xS3g4/h0R71yhzks44Q/zgGykc8cWI8jpFM3cUy4eQoV4Td5rM+QGk2YzKDoMQDjt/xps0KA/a26z9WxMblQPeHBupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hkx+H+kIDYNzpyRJpaJYL9VQ0b1cQGQrxyiHlLDibM=;
 b=J22BG3qbhq2Mb/BL7eNOm9g4sHvoba9QOrPOuvgRxn+YISCNqXI6fo88Edl8DQ6xKfdEhVCU6C+UOpm7JbTRM6ZnN2A2r8muogHXKnLUDGhpbHcjLKUrL2Ev/z16w4Cva9pU16itzFFB3/1wUyBrqKCNTrtTLt7j/fZtt8KRkcE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5754.eurprd08.prod.outlook.com (2603:10a6:102:91::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 15:35:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 15:35:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH][whinlatter] CI: use whinlatter branches
Thread-Topic: [meta-arm] [PATCH][whinlatter] CI: use whinlatter branches
Thread-Index: AQHcfyHrVa1qdyetR0OUKIDor+rTb7VFRc6A
Date: Tue, 6 Jan 2026 15:35:17 +0000
Message-ID: <455A2D06-05F0-4BE4-9291-1A580C17B135@arm.com>
References: <20260106152046.578426-1-ross.burton@arm.com>
 <CAMSfU+4Eubk2dukntVZ=8HVk3nXBz45w=t2u90qJXHscE2QrBA@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+4Eubk2dukntVZ=8HVk3nXBz45w=t2u90qJXHscE2QrBA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5754:EE_|DU2PEPF00028D04:EE_|DU0PR08MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: a57bdf3f-44b1-43f0-7f10-08de4d3957dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TVBrQ01HelhpVVF6MWs0UDF4MHU4ZkQvMmEwUlZneXdsd0NIaXVwU1JxN21o?=
 =?utf-8?B?WW9zMTR0R3NiY0FFSUhYZnRDZ3Q5djZCSW9nWmJ2NVB3N3cxOGY4c3h6bFg1?=
 =?utf-8?B?eEJFZGdSMkdmQ2IzN1pXV0R5NkovY0VkOUdqRmRaT3NoMlJ1RGE4ekw2QjA0?=
 =?utf-8?B?Uk5QZTN1Wi9QU05zOG8rZVF3MHpkb0V4aVpPd1hBcEFJaVc4MHRNVlMxU3ZG?=
 =?utf-8?B?bkI2VmNFRnVmRHgzbC9BWGlRUnNRaWp5RDk4SGh6b1BRTXFqSm9PVm9XR3Zv?=
 =?utf-8?B?OHFiWGoxc3BxaE5zak84cUh2dHNwZ21MNUZkbG5LUEJnNTBTZG4wbklBNVht?=
 =?utf-8?B?Nm8vdVVGOVFFaFZzcmhiaTh0Yk01OXFPZmhNdVdkSHFVZEY5ZkIrZ3RaOEZm?=
 =?utf-8?B?elg0S1BVdjg2a28vbXJVMEdMbkN3OXR3ZXlVdDg5OW01TUpSYk5ubDEvbGkw?=
 =?utf-8?B?ZnVjT3Z6RHAyaitNU0lzdkx1S29ENkRGeWRVSnJvb3NRNjdZZGpQWTNsNFRZ?=
 =?utf-8?B?L1lTWGg3TWZGc1ppaE52RUM3Y2UrZUhVb1JRbzIvU1FjK0Y5U3ZyaVd1NnJu?=
 =?utf-8?B?Z0gxUG14cEtiODk1bjhKYy9CSzZWUXJ4TVgvVDQrcVFINEI5a1dxakFMY0dK?=
 =?utf-8?B?aDdTVkRSRVlVZjh5TjhzVGUvcXBlc3dGU0h4ang4bHlaMngvNVVYZThEc0F4?=
 =?utf-8?B?VVBuOVFjSHJEdzV0L2s5SjNHYXNhb1cwODlaY2hWS2YvVkR5R1piVlMxNTFS?=
 =?utf-8?B?dFZiOXlXKzcyY0lOa2lnK3VYNHkzRG52NytFNWNuT2Q3VEF3aUVaWXhPaG1M?=
 =?utf-8?B?NVBLc08yWkpKYUE1Yk5na2JBSGo1SjhGWFpOTEh3alZIQ3huWVBrU2xhZ0Z1?=
 =?utf-8?B?MUtYZ1hreXNhdHc2OCtLYkZXMS9qQzZmQWNSYXJyRWt6MjRHOXlyWTdwMU1V?=
 =?utf-8?B?TGtGV2dDY2JCUEVSYmdZWFh1amRQVDVEd3h0a2tsdmQydWgybVFCZThjazBJ?=
 =?utf-8?B?aWtvV3JiZFFTaFBwbnM2Ky9LeFZGYjdtbCtleHlTWGt3K3FCaFE1b1VFb1lG?=
 =?utf-8?B?MU5TOVRiZUpxTXFON0tkNENqZTlSTjRuT2NrbFZxbnRVdG1OcCtyK2Q2RlRE?=
 =?utf-8?B?MGtva21tQ1Q1NHF1SFBMVG02WmwwL2xRYmlLSmx2aGxCNWNwdThhSVZOdTVC?=
 =?utf-8?B?K0M1cW9rQ3prc3V1Z3c4Wk95OFNiVmR3Slp4RzZqYkQvd01aSU9pV0NRYURs?=
 =?utf-8?B?OXZzNXMxVkJRbU5xNGh2RG5PVFFDSmI5S0lhQ0VxcDFWRFRLK1ZtRjk2bDJJ?=
 =?utf-8?B?S2RNQitxS3lBbll1V0RUNnMwQVJNS2dWUUVBcGMrZnJXNy91Mm42NkZheGpk?=
 =?utf-8?B?MDVkbkFMRS92WVF6KzRteFdJS3cxdHdWamYvMXZ0dmh4Q2RqdUhYTGlOYnVh?=
 =?utf-8?B?Skp6M3JqeWUrSWpmSlRJbXB3R3pNeWxrQWplMFErb1E0VG90VXdoWXNKdWor?=
 =?utf-8?B?aGFleFR6Z0lUNHQvT0swY25WVHV2c3ZmdFV2TjBMVU84a01TZGVWTExuOTZi?=
 =?utf-8?B?YXFhckRmZlQ4ci9NY3hzM2NtM0JnTlkzTzkwSURHSS85MUNidjJFazA2alRW?=
 =?utf-8?B?N1kvL2VwMzRUTWNjM2FsbXhKV2dOZCtTdjZabmlDY0d6WC90b095a0RpVFBq?=
 =?utf-8?B?ZXRQSEQ2aFNIbkFqc2RTTFNFMVRXUGlKVmppbHlYVENST2xoNjFvRTRHalNU?=
 =?utf-8?B?MllTSEpoTEdTVXgwbkVNRW9WeUVBd21McklkcEIvZlQ3T1M0ZGhHMXIwcjNs?=
 =?utf-8?B?WlpCYmV1R0lwbzgvb0wySU9Na3BnZUhZdy9tdnorTkloN3VVOEw1LzQyMzBP?=
 =?utf-8?B?SWFIYmdmQlVkaTBGNmd3N1NITEFvOW0vSGloR1hHa0l1QWpZZEx2RzN1aVgr?=
 =?utf-8?B?RTBFMHJMSkdTOXlWQThJblZwb3hIS1RXS3ZXTk5zZUppZ0FjMFhublpWSzUy?=
 =?utf-8?B?UlVxd2tBazVUaHYzblBOUXBwMHIxWXRkb2d1dmpveVc5KzE4N2p1K3J2YmVX?=
 =?utf-8?Q?cQwVOm?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00474B98013FA74E9C3FFCCC32D467C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5754
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dc864abb-642a-4418-a01f-08de4d393190
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|82310400026|36860700013|376014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YlprZFByNWZsVnJWVFFIbnAvSEJCS2J3Sm16Z0JVSW56SjBSZmVIa09hQnBV?=
 =?utf-8?B?U2ZKcmNtSStOOEQ3UU1wVDIvbjMxbW5RTVB6Zmdxa2xURTJTRVJMNi84UEhP?=
 =?utf-8?B?UFpaY2llN0lGNDBXY1FYYVVrK3l2eEhHQnJoNWQ1QkFsb2dNNkVFbzRWWmRk?=
 =?utf-8?B?cnVwTW1wVzZrKzc3YXhPdGJhQVhsd2FtNzF2MWkvTzRDa3JzM1VCV0o5YTg5?=
 =?utf-8?B?UWdXVURBVGF0WnNiZzhpdXZFWE5TZTcxVU9uNndkVGE5bVJQMkhXa3U2Wkcr?=
 =?utf-8?B?RkpLVFZCZTY5NkJUR3YxZGxzRWl2aTYxL3BiYTBQSG5kcTZnL3hLTGdWK25y?=
 =?utf-8?B?OW1yTmdTTmlWMVlpUDVuUUxRUndrWkYzOWhxaWhuU3pRNjBoWEp0WVEzV21y?=
 =?utf-8?B?NTdpVGtRbElEYVhjMzc3UGhaampZLzlQdXVlVnVLWmN2T3dVY2daejhJeFMx?=
 =?utf-8?B?K1ZOK0NOeHZzNjIxcG9ER1licmlJTXR6U25INGVMYjRmdXNuWVpiN3c0cldP?=
 =?utf-8?B?Q252Qi9QMnAvNFJWZVNMeUVxR2hpc1hhbGV3OFg5M3p3cWtYWkw3eHN5eEhr?=
 =?utf-8?B?UEV3NFBmWnJReVVIZDFhZVVDMnlxMllHejVPV2l3TUhmM0Y4UEE3aVZySndI?=
 =?utf-8?B?SVN0dFplOU9XTEtrbTE3cXEyZmdXSytQcmxuYTlZa3BCU0tOdW4xOCtxckFX?=
 =?utf-8?B?ajNrQkM2TWVvc2RoSW04VithRkdtSm5GeUNGRFltZ3NPS1ovT01IbEwyU3Jx?=
 =?utf-8?B?VzliN05jc2Rnd3JWaXZCZmw5eXRMNU5ocXIvTGhjK3MyYUJoNWQ1ZTlXd09Z?=
 =?utf-8?B?SGlTQWl0YUdWak11R043SmNFMndhazdlZ0tlRnB5VWNTN3M1TlpsdjBCN1lt?=
 =?utf-8?B?SklwcWxYenhkK1U0aG1KZ2MycEpzK1FqcHIxczRnZC9qNDF3SThiUkpSRng2?=
 =?utf-8?B?STN2YUtXZXhkeFRSbEFwK3JNdjMwRlVvbG9YTkpyRXdQb051Q1UrYnJoL3pX?=
 =?utf-8?B?UUhza296dXRBWSsyeTg2Q1FoQmdiNkpmUGsyMnAwMnhONnNZcm1BaWZhYWhT?=
 =?utf-8?B?TFBIVkUvZ25VeFFuVEVBclJaRmQycFV6Uk5UUVFHR3JoNGpJWks5bkNsTTNa?=
 =?utf-8?B?UVBDcGtsTDVlTW4vM1RlTEJpNFhONTV0R1BNS3NFbktQQ2hldHJYR1JqYVdE?=
 =?utf-8?B?bXVqcHhkNVVCbmZsR1dTdk83SFJiOHZlL3lKdWdwQ1l1NjMvMm5nc0ErOVc3?=
 =?utf-8?B?WlVBTE9RMDU4RDBoNVN6L3YxUDlzV1paUnJYN09qWDAraldzN1NDdCtjVWUv?=
 =?utf-8?B?OGNOazZrTkM4MjltN3FHNHpiSWdUeWMzVUZobjJ2US9QVUpiVnlBaVdpS2pi?=
 =?utf-8?B?ajgrR2xRTVc3cldJUkdMa3RaNHJkanRyeVM2QU9MQ0lsK1ZyVTlodkhGVGtr?=
 =?utf-8?B?ZXlHWSt2VTc3WjQyTDYrVUpDalVHZk9zZjZvWjQwaXcvZjFzc3FxSGZSRHVx?=
 =?utf-8?B?Y2d5bnhUNDRUTkVHSjdPK1pyZE5oSUNPYXhJS1BXaXIxZDRxY2dtUzM3d3Y2?=
 =?utf-8?B?K3Z2UVZMN0xCYWtBYk8rdHdhK1ltNzltS05CM3BvTUxKZGlCQXZjWmxhVHAv?=
 =?utf-8?B?VU9EL1o2UUhZM1ZZNlp6QjVkTHZZazQ0Uzdua2pibmtnODliL0c5V3ZheW9H?=
 =?utf-8?B?OXJ0c2orN2tQVGhiT0U5WVhaS3JlZVFoYTFTeVlSSjd2eVV1MzF3MFBpSzZx?=
 =?utf-8?B?MGQ2SXVJakhaUGY1ZWxsRmsrRGlKOVFGbmdlQitON0pkMlpZM0VhM1E0c3E0?=
 =?utf-8?B?eTNjRnpiYzlYamRBN2VKWFZIL3ljb0hiSzRtYmdybkRoSUhzTS82OFd2MFVt?=
 =?utf-8?B?UnhMMWZNVTRpYVZaMTdCakpaL0tLWDJFUnk2bGxGQk9Ya2RvRjdTY3E3bXlL?=
 =?utf-8?B?TnpwcUFhRjduWW94ZG1UV2l3eGJyRGtYbTNkNHJXeUJlbWdvSmQyU3ZNaDIw?=
 =?utf-8?B?Y1NWcyswT1FvblJCNlVwdE8valBDaHdROEdneDdHajUzOTc2OGYzV3hHR2M5?=
 =?utf-8?B?dE90N2tubUV3cm1zbmFwazNxVDhkV2NqdTBsRGFSWTB4b2RNYkNHWEpPMHFI?=
 =?utf-8?Q?1Tr4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(82310400026)(36860700013)(376014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 15:36:21.5244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a57bdf3f-44b1-43f0-7f10-08de4d3957dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9227
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:36:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6816

T24gNiBKYW4gMjAyNiwgYXQgMTU6MzMsIFlvYW5uIENvbmdhbCA8eW9hbm4uY29uZ2FsQHNtaWxl
LmZyPiB3cm90ZToNCj4gDQo+IEZZSSwgd2hpbmxhdHRlciBpcyBiYXNlZCBvbiAyLjE2IA0KPiAN
Ck9oLCB0aGF04oCZcyBmdW4sIEkgd29uZGVyIGhvdyBpdCBidWlsdCA7KQ0KDQpSb3Nz

