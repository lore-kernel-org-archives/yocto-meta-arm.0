Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8965EC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 15:29:36 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.68])
 by mx.groups.io with SMTP id smtpd.web10.1299.1721230173778454202
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jul 2024 08:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lD1PGuBX;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lD1PGuBX;
 spf=pass (domain: arm.com, ip: 40.107.103.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DA3MfcP3KLOUMaFzbJvwDFGPlapOm03/7b7AvXs9WJeU73lKOZwgawqiCqkObdBuDHjDNDAhaYQerxq2nmW8D4h3SvNItA/jB/jaENb6uBGCjYwJfDYaQHpcn1dW1x78OQjsAe1tdJxUdDF0gA02Qim6xGHQfmcZ1o9FR0VyYNfCGt1WXrR+SBSUPzcbgtu8YLv2Qi+LsIldtlBBa5eUyAxiEzKw6I5krdthSOFscXHbu4s0P4dz0nJ1R6K9VBkG/RSw5fczHS6d5YIJiBO7AMa8CSki/tXNyQaJzZdMV2GGumrEokEdiHe+ePDkr9t1oe8uVohvrnA+agbjrpT3rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOXKkPSm/Oi94+M8X+WujBnsqeMgpQBHOap99/uqA5Q=;
 b=tD+gO+Xs/4VFnrfmFZiu6JqwtExSylaHOPRlOqRdhbtySmEyIYJF53I6u3B7pRM02hnktfwy1P2jOB3gGbtYbOBDwIWz6AZTlmq+9tGcjTrTHor/d6WK57sxvmYYEBRqoMznzlzEQyBSOoORVuPI8nAmZUw7tcbMglUv9rJtrHT/2zvj0qjXs2ATnLRO9PFeq6kPSyJOP+CLSiNlYxsLj7VPvwCD+Wq4loWsCiwaXB0WqW9if6ZhuP9Wre1rSBjBxiJN1NRwuqAwmVuRw3jcaiMbPJCWDMWZ3mSEH5jptYXS05XDt2TKvRxswUgsxOOXfBpgSNo3tvkC7PhFnlU73A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOXKkPSm/Oi94+M8X+WujBnsqeMgpQBHOap99/uqA5Q=;
 b=lD1PGuBXSawf+alzxsNdN8c7FsVfUgXXPdIcCWl1YEplTfgb+Db55F3/6KGRO6ZlxXw5bgvNEOAoVl/BCwNQV5B7Vbi4j8OYlgl6FnXXPDRhiYFCeIWXf+V6lE2ai1Xnv85NXiYciNGQe4EpiX2A2nMqrLlzD84OhHzdDv+YH+s=
Received: from DBBPR09CA0001.eurprd09.prod.outlook.com (2603:10a6:10:c0::13)
 by PAWPR08MB10238.eurprd08.prod.outlook.com (2603:10a6:102:365::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 15:29:29 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::a4) by DBBPR09CA0001.outlook.office365.com
 (2603:10a6:10:c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Wed, 17 Jul 2024 15:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Wed, 17 Jul 2024 15:29:28 +0000
Received: ("Tessian outbound ab09e808a502:v365"); Wed, 17 Jul 2024 15:29:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 21ba65107c585708
X-CR-MTA-TID: 64aa7808
Received: from Lc5d8f4534293.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54D893F5-1F5B-46C4-8BD4-BBED2AA943F5.1;
	Wed, 17 Jul 2024 15:29:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lc5d8f4534293.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jul 2024 15:29:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8SRLnPICwBqXuUD3oHedHLC34qIXu/raDpK8QtG7YKi95xMmjklFdHjKAiRe4PzcQPUmOnuB8gbHAmUj7owwysyGOkGNSoIcJ/3StsBEaj2doOjzLpuaBBHl5TKJAbCY/A2e/MurBDvnDlYrhdxiE8GomkjjAubFN9+1UL0WKpQwM5dUcGBWcbfguAd6yJ7mJu6+jtd9FaAv2Mh6JvQgC14VCrUyQLgwbfh1P3gaGBi35rP+NoVGegkxst/dfAGK+DnlN/Em5baO7ASNuXTLLQ2Isp7d0Mf/L1GVcH/o3iQPQENlPXAccc99ZliETcq1gT/Kx8mFUZ+ZjYJ2J8A/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOXKkPSm/Oi94+M8X+WujBnsqeMgpQBHOap99/uqA5Q=;
 b=A0rXmQ+g5DkSsO36W8aJO50KZAd9Gc9Kn1WhX1rLbreHWeKiRS6GNECKRBtviGLcI0FMgL84irhSSmrQlvZHivSwyybcCm3Pc3CJZdDFax6rckXccoqmmi2c95Q8ZmJjctGpV4bLnFo1slD2POLcpb8CtkUYO0TlZ8zFqB8+2slau0tOaZVXxtNczQH3cgg8pzBJ5Gt9ZEv5j2eFKdxR4ZDngdXtMoSIyJRtaBXnMEk9yFrYhWT6j4mrbKq0k/1bjI4xwOKIJZTGa+l3AiPBIMTQl277QIlhIdlXOHn5XnwGjeWmu4G9NFiMjEVY5t1CT9peZQIdY7bqKZM8G+AhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOXKkPSm/Oi94+M8X+WujBnsqeMgpQBHOap99/uqA5Q=;
 b=lD1PGuBXSawf+alzxsNdN8c7FsVfUgXXPdIcCWl1YEplTfgb+Db55F3/6KGRO6ZlxXw5bgvNEOAoVl/BCwNQV5B7Vbi4j8OYlgl6FnXXPDRhiYFCeIWXf+V6lE2ai1Xnv85NXiYciNGQe4EpiX2A2nMqrLlzD84OhHzdDv+YH+s=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5416.eurprd08.prod.outlook.com (2603:10a6:20b:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 17 Jul
 2024 15:29:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 15:29:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "javier.tia@linaro.org" <javier.tia@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] qemuarm64-secureboot: Enable UEFI Secure Boot
Thread-Topic: [meta-arm] [PATCH] qemuarm64-secureboot: Enable UEFI Secure Boot
Thread-Index: AQHa1vgHKcU5H+g5K028Wnf8Ur0+qLH7DjKA
Date: Wed, 17 Jul 2024 15:29:20 +0000
Message-ID: <3D6EA368-454B-44CD-9087-7233A4091763@arm.com>
References: <20240715204517.781716-1-javier.tia@linaro.org>
In-Reply-To: <20240715204517.781716-1-javier.tia@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5416:EE_|DU2PEPF00028D0F:EE_|PAWPR08MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: cab522f2-9ccb-4fea-0eb4-08dca6753f9c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?R2VzRTU3UldJcEJheStXdmtqQUo4WUtBd1prWmxKOTdham8waVB5V21lMHJE?=
 =?utf-8?B?Smd5dnIyZVl2VlFsaXVJSWhqZmhqWVNjRmVObUtucjRmRy94TWFEYUJHWHJt?=
 =?utf-8?B?N1pieUc1bXpIQ2VISXlnWFU0S092b0s1SkUxa1o3dUhCZHlqY09nQU9lYklU?=
 =?utf-8?B?WXQybWk3d0thbXk5R0Nqb3o4NEJ3SVFrU3dKNGE5U3hhRnpTOG9rSEwxVkFK?=
 =?utf-8?B?NHJ5VUhySzg4enZxZityOHkvN2JkRGNjOFB3bXh3MnJ0dmtxQXBVN2NuZkx3?=
 =?utf-8?B?Q0IrbFMyWktBRTZnNmR5L1hQekRUcjJnU0psWlk4Z2paM1hvZnVpWGdGdUYz?=
 =?utf-8?B?ckd3blY0Q25aSkRWL2RQR2ptcHkydXVHTm1ueWZjS09SbW1kcVZwTlR2NDVx?=
 =?utf-8?B?b25WbTNNSXc2NFRKZjduNjZXUnVQeXpIdDVJeGs1ajhNcGhmV2FIbWFBY2JM?=
 =?utf-8?B?ejEwMTM2U0FCcmQwL1R5dTdGVzRxRVZvNFlTVStQSy85QzZiVVFwcVJZYndU?=
 =?utf-8?B?a2tqd0pZeCs0TmpveWw5ektYWFRBdXRrTVMyMHZJM3N5UEpPeEFIZ205TU9Q?=
 =?utf-8?B?cjFtSEUzYVNSelJqc2RVd0JmaEpMdjRXQ2RuNmJHNDROaGZOdU94NmxZaER5?=
 =?utf-8?B?S0Fia3NuVkVTVDU4UDg1OFNEcUc2bDlnZ3hMcUVQWjNvQUkvWnpQa1hDSWZn?=
 =?utf-8?B?bkZHSnlQQmZUNngzTXAxMGN6OUdVaWowY2NYOUlzQUt4MDVmd2FIYWpLOERC?=
 =?utf-8?B?ZkNEQ3dWVkhQSXYyV1J5b2lhbmtWYVE0UG1mR3NBNUFFZlROay90NFRiMWpE?=
 =?utf-8?B?dGdLc283a21uVXhZTWFEQlFnVlBnejdRQ0FJQ0swWHd5VnF5SWIzM0FrRWpR?=
 =?utf-8?B?azNsZm8xQktxbFQwZVJnZGloS0ZRRUg4cDU2Wkl0R0lHYWFoT3VieG11S3Vn?=
 =?utf-8?B?emdDWkV2WE1kZm1Hd09zYVpUcW5XdW1nb2pPelBPZWxBeTRuWlZsOHNabUMv?=
 =?utf-8?B?ZW1mMGd3UUNpWHFJVjk0emxFQnF5WkpMeEF3TDVHWFdtcnAxK25vZmlJeHdR?=
 =?utf-8?B?MmUxVVVxcjUyRGFla0R6RlprZTdUZWVhQkZmdG1VNnl6QllSMEJIbnpTc1dM?=
 =?utf-8?B?dncydGpWenErYWk3MjN3R3JRUG5paWlYZVdqdkVib0VIQXQrditBTTNZSkdV?=
 =?utf-8?B?UnZuMXNnN1BPc3FVT3c0M2VGL2R3L3JsOUtsV2tDazMzd0JIVTlvd2daYWpF?=
 =?utf-8?B?UThrRUxBOW5HNnJVOHMvb1JmbThydjNNUXpQM2F4c3I3a1FqbURqeUNmVGk4?=
 =?utf-8?B?NDdVWU5LSG4vTU8yMGdFQzErVzczQXU1ZDhGUjdBUWI4ZHZIb0ZLQ3RQOGpO?=
 =?utf-8?B?M2x5RDFmUjhyb0JQajZJUGJBNGN4K2ZtWDZCVHVyc1hnTm4vNDRUZXZsWFRS?=
 =?utf-8?B?Y211ai9wR2JQVHFuK0JFeS9pR1JBaXRjSlJzMFVyNjdIU0lTTFlha1hWUkdq?=
 =?utf-8?B?dUJ5VG1qYUdaZ3RLbjZVRTNsajRTMzhqSjNZcGlvVGlzR0NCVUgwTGpYWDhh?=
 =?utf-8?B?RU9aeTcwYTBHM1lkdWd5OUtjUk9pMFV6cDBoK1NrTitjVEwrdThWbUgwSWdu?=
 =?utf-8?B?MWFTejNnUGpRbXgveGl1UjBsRGhSWFlBeER3Y2xjdnA1QzNWZnh1VEUvdlBX?=
 =?utf-8?B?bndUcWlMSThHZ0E4ZXR1RHNXRXJuZDhQNGw4UFoycm9tQm1pVTJkR0VNb1py?=
 =?utf-8?B?ZHhiYkZOUFFHTDlkZkdQTXVqVUpjdGJVbFhvUGtUYXVvYXJRUFBLUlh2NTll?=
 =?utf-8?B?R3JYZnZMVGoveVpRZTRnT2I3eTdDR0hUUFd5YmdIeEFOVy96T1g3NllNNWRL?=
 =?utf-8?B?ZzVYTDdkdGw2Sm5IdlhMQUlselUxSGdmaXByWWdNZkNCUWc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF5A97CE36D0914F9F9F6D4C2D9EE271@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5416
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	316ee557-3c3b-43d0-e368-08dca6753a6d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2lVc3FwQVp4WVUwdzdkTHNCTExrNWsvUEdWS2VhdFFNWFN4UkYxclZ0YkZv?=
 =?utf-8?B?MWxyWWkyOERteEVuc3dWeUZuUVNjcmdZK3ozQklKRXdWMTFHL1BGWWRHY3d3?=
 =?utf-8?B?c3dod0hRQWs5aVQ3ZHNIMUVwS04rci8yVFVVRTJlTnFaNFBEYU0yUzdJZUQw?=
 =?utf-8?B?MlZmSUhkbXVFS1J1NytnOGtObFh6eE83b3IzWCt5WFc5Slk3QWlhZlZWelJ1?=
 =?utf-8?B?TU5MTGwvbWxySUpGT1ZBTVZ0N2dCbGV6SXU3WlBob0hEbEJQZ0ZvNC85TGRU?=
 =?utf-8?B?Wmd6YWVTVUxYcmxaU0pBWUc2T0xIdmsxakp2bnQ2R1hmclF5dlhtZ0VaekdE?=
 =?utf-8?B?Zjhhb1hSUWhpMDE2N3BoaUkraUZRMGxnZ2Foa3I1TjRtMC9CNytERkdNRVFh?=
 =?utf-8?B?enNUZ2VOcjcycVRSVU1yY2NnL3hqeHkrVmFnTWoxSWN4MTVuT0F3eHRVSHNW?=
 =?utf-8?B?Z3V4MzVTZ0RBZXlsREdxTXlNa0pDbXluZVk5ckwxSG1kM0VPS25ZeXZZQmtT?=
 =?utf-8?B?MlJBUjRPL2NCUnVjcnRWRHdvYW1XTTZKaEY5b0xPSE5RNk1ETk4vRmNPUER4?=
 =?utf-8?B?SHZxenh0REtiRXBKKys3dUI5YjZETFcxcTJOeWNoQzc5V29NdFBjTkM5U1BL?=
 =?utf-8?B?bHhlb0cwc2hQUnFUZVFUWDI5ZWhBT1doTDlndWZmVVdmMWhpWXZ3ams4L1d0?=
 =?utf-8?B?N3pTWGp5b2UxODNoMjNSWEwwM2NCM1dqZUkwajBndHZmbzZhaGpVSGRzYnJW?=
 =?utf-8?B?YjhNT0JkekVkSTZwWnBqVEd2UXY2Kzl0R0RvZ21kZ080bm83SjA5eG9UMkFa?=
 =?utf-8?B?Z0RMNnFJaWNqK3VPY0owaEQvbVpobDhpemd6b3ZjVHVKZ0FNeVRRSDBLNHVJ?=
 =?utf-8?B?VkZ0WmZ2WGI0UXhmc3ZEc2EySU41SldCNDFXa1FIbUUwcXREdC8wR05SV3hC?=
 =?utf-8?B?amtycE01dkRMbUkyei9vYmRrTUZBYStxQW5WWkk2TXA5VnFTbElzN1ZSLytP?=
 =?utf-8?B?MjY1cWkvMlFiVmdoU0J5VEJuRUNIZEQ1Rm5KdVJMR0FxNkJPc3VRRVhIbDZQ?=
 =?utf-8?B?WXkrNzRvRDJ4OElTblZ6QzIzdUNYSU4vKzJLWWczelV0TGNZY0RCdDFIcU1D?=
 =?utf-8?B?dlljckJ3ODJVVjl6SlN1SkwwNWNvMmQ2U0xqRjY1RVd0ZXBtc3p5c3Y1Tlc2?=
 =?utf-8?B?RENlSWdQN2dyWndTdzRpdWtINW0xQ05rZFJoM25nY1BCdU1mdFhpME5aUURQ?=
 =?utf-8?B?bk9JZVJxNkRUdkc5b3BER0MxQ3VmcnpEc1g5bFhJNnBwNExzNDBUdE1PWnB0?=
 =?utf-8?B?TE5MUHloRGs5NjBST05WNzFUZzVMdndOcy9FdUFFREYxeU9GdDA2ekkzRTJz?=
 =?utf-8?B?VzAyMTdxZGE1SWFXK0ZlUnZjUDJjang1cFFIdDNreWRvWHQ0ekJEUDA1bjJs?=
 =?utf-8?B?SWZWYnVEYWNRRW41cnliQXkvT05SOTlkNjE1SDRUQzdWZWRIelRaZk5BR0xt?=
 =?utf-8?B?K3hDelY3NzBkWEJUMUFQcktoNGdQMFlxWW9rRnRxTlorWUkyaWJVTTVMcUJ2?=
 =?utf-8?B?MDdwRm96SzBGdUpaVFJHRlB1QjFDTm51M01WSFIveGRuaHhkSm0rQm1xMGcr?=
 =?utf-8?B?anNaTXZ2bytxNnVLN0svaTJsNzF4bDZHZmtudVZHWWIwWHloQzhwb0prWFp0?=
 =?utf-8?B?M2kzWWhmWXRnYlV3bUhwbVArKzYrbnAxMmpaNkZ3bUNiZ1ZLd3V2TS9qZ3Jo?=
 =?utf-8?B?OXBrUk9QbHZoMHVEYVhQaXp0UlVyVlk3aERaVklydlBPSHQ2clpvZHNLRkNs?=
 =?utf-8?B?aGZzeVc1NjQyckNKL1pmUWxUbnFPdEgweUNoNHFyMFRYa0hEajcvaStnY2Rk?=
 =?utf-8?B?UzBNbThxQytrTDYwUGpGbUNQUVgrZkxxMFhPR0lPb3lCZGhRUlpHNWYwVUN0?=
 =?utf-8?Q?0ldPNsYczAQbu2kkH+2kbUKEVvrX5qlr?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 15:29:28.8188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab522f2-9ccb-4fea-0eb4-08dca6753f9c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10238
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Jul 2024 15:29:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5892

T24gMTUgSnVsIDIwMjQsIGF0IDIxOjQ1LCBKYXZpZXIgVGlhIHZpYSBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnIDxqYXZpZXIudGlhPWxpbmFyby5vcmdAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3Jv
dGU6DQo+IEludHJvZHVjZXMgdWVmaS1zZWN1cmVib290IG1hY2hpbmUgZmVhdHVyZS4NCj4gDQo+
IElkZWFsbHksIHRoZXNlIGNoYW5nZXMgd291bGQgYmUgc3VibWl0dGVkIHRvIG1ldGEtc2VjdXJl
LWNvcmUsIGJ1dCB0aGUNCj4gY29kZSBjdXJyZW50bHkgZG9lc24ndCBzdXBwb3J0IEFSTS4NCg0K
Q2FuIHlvdSBleHBsYWluIHdoYXQgaXMgbWlzc2luZyBpbiBtZXRhLXNlY3VyZS1jb3JlLCBhbmQg
d2h5IHdlIGRvbuKAmXQganVzdCBmaXggdGhhdCBpbnN0ZWFkIG9mIGFkZGluZyBkdXBsaWNhdGVk
IGNvZGUgaW50byBtZXRhLWFybT8NCg0KPiBTYW1wbGUga2V5cyBhcmUgYWRkZWQgaW4gb3JkZXIg
dG8gYmUgYWRkZWQgaW4gdS1ib290IGFuZCBzaWduIGdydWIgYW5kDQo+IExpbnV4IGtlcm5lbCBp
bWFnZS4gQSBzY3JpcHQgaXMgcHJvdmlkZWQgdG8gZ2VuZXJhdGUgbmV3IGtleXMuDQoNCknigJlt
IF92ZXJ5XyBoZXNpdGFudCB0byBhZGQg4oCcc2FtcGxl4oCdIGtleXMgdG8gbWV0YS1hcm0sIGJl
Y2F1c2Ug4oCcaW5zZWN1cmUgYnkgZGVmYXVsdOKAnSBpcyBhIGJhZCBpZGVhIGFuZCBzb21lb25l
IHdpbGwgZm9yZ2V0IHRvIHN3YXAgdGhlbSBvdXQgaW4gcHJvZHVjdGlvbi4gIEluc3RlYWQgdGhl
IG1vZGVsIHNob3VsZCBiZSDigJx0ZWxsIG1lIHdoZXJlIHlvdXIgc2VjdXJlIGtleXMgYXJlLCBv
ciBJ4oCZbGwgZ2VuZXJhdGUgYnkgb3duIF9mb3IgdGhpcyBidWlsZF/igJ0uICANCg0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS1hcm0tYnNwL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3RfMjAyNy4wNC5i
YiBiL21ldGEtYXJtLWJzcC9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XzIwMjcuMDQuYmINCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAuLjhjOGQ1ZGQ4DQo+IC0tLSAv
ZGV2L251bGwNCj4gKysrIGIvbWV0YS1hcm0tYnNwL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3Rf
MjAyNy4wNC5iYg0KPiBAQCAtMCwwICsxLDUgQEANCj4gK3JlcXVpcmUgcmVjaXBlcy1ic3AvdS1i
b290L3UtYm9vdC1jb21tb24uaW5jDQo+ICtyZXF1aXJlIHJlY2lwZXMtYnNwL3UtYm9vdC91LWJv
b3QuaW5jDQo+ICsNCj4gK1NSQ1JFViA9ICIzZjc3Mjk1OTUwMWM5OWZiZTVhYTBiMjJhMzZlZmUz
NDc4ZDFhZTFjIg0KPiArUFY9IjIwMjcuMDQiDQoNClByZXN1bWFibHkgdGhpcyBpcyBhY3R1YWxs
eSAyMDI0LjA3LCBhbmQgdGhpcyBzaG91bGQgYmUgYWRkZWQgdG8gb2UtY29yZSBpbnN0ZWFkIG9m
IG1ldGEtYXJtLg0KDQpSb3Nz

