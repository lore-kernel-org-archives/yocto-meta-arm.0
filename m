Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3435C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 13:54:36 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.36])
 by mx.groups.io with SMTP id smtpd.web11.59848.1749477268507611255
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 06:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T3VQiWu8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=T3VQiWu8;
 spf=pass (domain: arm.com, ip: 40.107.162.36, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MhTaQsYm35xT6Ew6IuZU8p/s3w1gtM62UaKpF8ltNd8/fC4dRJt9wqwEQHTcWFDS1yEGflNdaQGqJh8yLD/QSoewnWJnaJyvGglyTn8ygEaaP9wy0PFnhXmoUeYa2OWGb28NUGTQLdSCwrzqfRqDgNy3dFqBoD2YZAhkGKQYe1SmCY0YgE7/r+ozWkyhhTMneNIpREecvPuRpEj0LR8lsZjfuRLHYJtqqRZAcswBkJL0pY0bLS02VtorsYweEsB6MXKIHD2a2tytMkTQKSGILfEzvZA9pRukrDkUI089FiHbs+VjQTiq9hX0PlH6QgDsbjb5vwr7S5Hv5Di4gxbuqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMRH3gCeGjTnEAbgyj/amEnHEZSsZm2afTxgLDV19TE=;
 b=h5Yfq4+smMCcUp2Kzv4shgCzO6s34EUWJ52LaxbHvKCX8/It35lUMGj4RwnJx6n5MTzoRXH9sGExqMqMpPWTtFSPx/tJX0yXqzbGkhJJFaFMaTUiNia6dV/UhgWS2kwNxG6XgpjhhngZvHJrYl/06Zc8icF3yOgIyc549vGDIpGcd/sMJyupIDCdYVPkUtrURtNmbvRckvn+6JRzuWpfwtcwW0gXBpuB5p531dzY/Ct2ZQx7suwbMsWsVXnwhdLF5pFVX0JcbmklLzWYqLnNHICdbwanZkSM4Oubid2m88wYydcBLsjqYxi/rBsveqCtPDH1DcaCs4y8UJ404edS0g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMRH3gCeGjTnEAbgyj/amEnHEZSsZm2afTxgLDV19TE=;
 b=T3VQiWu8R214ofY/zVbN0LjsL4K7mB7zkOvOL24nNPdWDjbVxeTrIeNAaonNb7LOvSKx+ZqAqmid+ZjaFzuuyU0Ahh6nE4aYaJuJtGEEj0H3b1eVuJHCNt5JAZRJeHumrdopKmnSsBXNtX9OjtgXxqiW8UrOPf0Nx0Quj/kkvzY=
Received: from AM0PR02CA0201.eurprd02.prod.outlook.com (2603:10a6:20b:28f::8)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 13:54:23 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::fc) by AM0PR02CA0201.outlook.office365.com
 (2603:10a6:20b:28f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 13:54:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 13:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwewMD8EG/RJI8nFGlfbJPVIwO9PqDwNcltZOP/SGG205LInOlWnHTKhTnBMLsNclSlhA4c/huSddLe/Z/ih9bN4IyxCfLFfWsvki2ZQFxFzrTeCBslI0sj2x89jUlE8RRZIahy3yY2erE2BG8fPT/EmXq4ulsqXSKARNEvLHGdG+Q4lY1ucsveik46OIPEJrhP8UURwL+t0FKePthE7ct7LjvlB0LN2hyBC4PpbPp05LkpqnZhtDPtD1me04VAHMt9RIIuiKnTmS+zWRKJGj2eLqzTTeYNfRXqonQT8ldY+VaEiUJB0kts2cMK3Wifm0Inv/0goJzYbV6eCGGDG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMRH3gCeGjTnEAbgyj/amEnHEZSsZm2afTxgLDV19TE=;
 b=rt9h2HTHlEKJ5D0VY+CLhc4F3cK/GK0w6eXao8ouDhQI+UIqNFnHetncAKlP/7D9UxmrJCuKFlO8CSqmm62JG68SWJF08HpMEaLJjJT2KtyKj3rDo3DM3CG1eqf6w962rqSENsHRbTXkT8Qm5Xr79AcXh3F+0zYGX/B7lGmRMWFAualYXrfU7mJaU5V0n3oAdjhm+yBXgh4kN3xKds8ShVHcs835fUcsyfc04B2Tz9OfswgiMWkNtLEcjBFwrJiyJFBe8VdNHuwDVFfn/Fcp/uDqlmji9j5ffGuNLdKp0H6w/4ltJV7N4AM6+OKXFVX/XMmJNgTv0WRI7IuJsFrVJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMRH3gCeGjTnEAbgyj/amEnHEZSsZm2afTxgLDV19TE=;
 b=T3VQiWu8R214ofY/zVbN0LjsL4K7mB7zkOvOL24nNPdWDjbVxeTrIeNAaonNb7LOvSKx+ZqAqmid+ZjaFzuuyU0Ahh6nE4aYaJuJtGEEj0H3b1eVuJHCNt5JAZRJeHumrdopKmnSsBXNtX9OjtgXxqiW8UrOPf0Nx0Quj/kkvzY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10195.eurprd08.prod.outlook.com (2603:10a6:20b:629::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 13:53:47 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:53:47 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "marek.bykowski@gmail.com" <marek.bykowski@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] fvp-base doesn't support armv8.2
Thread-Topic: [meta-arm] fvp-base doesn't support armv8.2
Thread-Index: AQHb2LIIm5aNjXL4BESv3NgnhtWgs7P62meA
Date: Mon, 9 Jun 2025 13:53:47 +0000
Message-ID: <09231705-62A7-4D39-B395-D670B097BBB0@arm.com>
References: 
 <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
In-Reply-To: 
 <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10195:EE_|AM3PEPF00009B9C:EE_|PR3PR08MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: e91301a3-8e64-43aa-dead-08dda75d2323
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WnYzdFo2Z2JzRlJ3M1c0ejZpLzNZOUJSNUN0YlF3U2VrMG03dUEzZjY5ZFNa?=
 =?utf-8?B?SjVmTWNHaUcvV2o1NUE5eS9DZDU4ejJ6Y01qakhnUWhEUmJPVHRCbXQ4TFk0?=
 =?utf-8?B?d1ZEclNHdHpQeWdsMVVTTHQ3RitmV2lYK1ZobWJWRjNNVkxQcENLRDg4VDBv?=
 =?utf-8?B?djlVZ0d2aDAxWTVOMEgzbkdFaDhmV1E2RmtSVWFlUmpTbVVhYXovbSt5WGR3?=
 =?utf-8?B?MGhPYktOVk5LMmN2ZTFjeGpPYjFxMXVxMnhadTZGVmhDeXFlYkRONUNSREdq?=
 =?utf-8?B?ZnkzWHk4ZklBSzRPVXlFSkRVNzBWOUJCQUxRcmZ6MXEyUFhWT0UwOHoxUFJH?=
 =?utf-8?B?RGhMeHg2cG5UOEdPZzNKYUsyQkh6ZDZFOEsyRFNSM3VhNTVEU0x4c2RNSzJG?=
 =?utf-8?B?dlZicUZRN2ROWHRYYmxFVzFOVmlZcTlSQzR6cHZtMHdZR3RFS1VsWHF1dUtu?=
 =?utf-8?B?dkNjVVNSaksrV1orTFphR0YycEx0R3E0NkNzR2l5WkZ0M2xZNVV3NUZ3OHNx?=
 =?utf-8?B?OVYzQXp5WGxJVFd2dGZ3dklWS2lOTWk5LzY4My9JVnAxbEU1WWRxSi9qT0da?=
 =?utf-8?B?TUN1V0VCL25DZGdhdHNIbjVyTmVBT05qMjBObWtjSEw1dHlLVzlEd1IvblNk?=
 =?utf-8?B?bjZXMkd0TTNjRzJjYm5NaFM4Z0xiUW1zdzFheDM1dkhxTWlDOXUyeUVFSzBR?=
 =?utf-8?B?ZEg2QW03MlJBNU5kV3doWVJMU2NXN1pETDZEWkNXeWh5TmxOdVlpMjZpUHZQ?=
 =?utf-8?B?VWw3am1nSzVkNFVDY2xpMWhzdXdSVllmdUtEVU5KQVowSjduT3RMbTV5WFZ0?=
 =?utf-8?B?OWhtNXo4QXNJMmIwYVVyUVJBam9Zb0hSQUZqMUtBV21lQnF6M1JnMXpueTl6?=
 =?utf-8?B?MTdheXFOOGVqbVpGUzVkUis0cEhwejVGT3FXcVhYcDkxS0NOb0I2QncxdVZF?=
 =?utf-8?B?OW1JNG5PaUJRNFZvbjh6bFFIaWhCcU0rOHZDN3hEYnh2UU0vT0tsSVAxRS9o?=
 =?utf-8?B?WmtDUldhS2V0cUE5bzFXZXFwc05sN0Z6S0pSL25QRHJoWHJsSXNNSjZtSUc1?=
 =?utf-8?B?a295czNIS3ZBTTVGQzdxREo0N3JlUG9ocnlkbk1zc0lNOHlXNW13NS9IUzc4?=
 =?utf-8?B?ajJlSnRzWlMyZk5HQkVHckpicjc3NkxDTmZEVDY4MWJPWGFJZEhsZmxkVlJ3?=
 =?utf-8?B?aXpsbDRjeVMwTkxOcVJIaDhIOUdzbVBSVjhwbG1oNDU4MG1ZWXE3cHBhVExR?=
 =?utf-8?B?ZTNHcjBZZzdnUW1yWGlOQkFpQThTUkFqcEwzTlZXQ3NzVExxWE5VOTNuUnIw?=
 =?utf-8?B?elNEV3A3L3JkclhTNERGcjRzL1NGUlpqZXFpNXdlZlVaaHE0MmR6a1Bidy9D?=
 =?utf-8?B?VkdjMUNWaEVnRjNGK2R3ZEhXTHdVWFJubTBrZjZ0VXJvVnRod3E1QVg1R1Vp?=
 =?utf-8?B?Vk9sYXdnd0l3Y2t4MEN5OFprR2thbklwN3BxK0RxUU00bUkvUmhxK21VZE9H?=
 =?utf-8?B?elA0cEp4Tkk2bXVkY3Nwb0lVM24wSDNzaSsxdkhIZmVUTkhHcWJjaGRqUk55?=
 =?utf-8?B?eGxVMzhXTDRhNHkyOHBkL1F0Zko4UzlWTkZWNUc5WlBuMWhHUEJsTGJ6UUtt?=
 =?utf-8?B?NkRGdGFDZUlJTTRRd2FJTWh4OWl6VGJLQ0d3QVhFUmNaMkJoTU5zT3Zkd0Y3?=
 =?utf-8?B?THB2UStqeTVnSDNIS1p1dFJuKzBwZVlSVVg5eXN1RWZXdGExb1pnV2dyK3JC?=
 =?utf-8?B?MkQ4OTRMYnY0VXZtWTVSNGJRNVNKaWJ1UERMVG5WMXhkVThPRFp6aEhMLzNC?=
 =?utf-8?B?VzN6dERmNFZwQkF1dDNRRE5LWlE3ellVMjRIVUpDL290dVhVTGJBd0JpbDJ3?=
 =?utf-8?B?VUtwZTBpNFZzV3ExQ2tTekJIT3JyNGdYNnlVbUZ4a2Z2ZlZkVmZJL0FwZzJH?=
 =?utf-8?B?NlkycE9XenlNbnpydHBOUU1VcWt5d2FybVNIQnFBRHRlVC9MNXZWRndDU2R3?=
 =?utf-8?Q?hQS8N4q36wEYaiijfHFUTBOobU07ek=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C743DFA87F334A489C44AC323973B91F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10195
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c1abd1f7-0b99-4c07-4c8c-08dda75d0eaf
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|1800799024|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0RMNGMwOWx6V3ZLaTZxVGtNU2QraStmMVFiSGhNNlU3Qm5lWnhKTzNNRVJP?=
 =?utf-8?B?T1NkS0V0OFY3MjZsQ2c4ZXZQcVFuakJHdHBDVzFzSGR0Um84a0p6ZWNiQUdO?=
 =?utf-8?B?NlZoV2c0Qit3SDBkNm1wMCtnSTl5aTVXUW5zbExvYldYTFN6UW5waWVZcU1N?=
 =?utf-8?B?WkJWUUdRc0p1ZWVGV3UvWHVGM0gvRWtHQkE2NkF3TE5KYi9pZVpXNUQzSXpN?=
 =?utf-8?B?ck5URGRPVVAxUFB2RE1ZVFN4ZWVKUGVNZWdFc2pUMXZZR0JCbzFPenpuRVJu?=
 =?utf-8?B?ZE40dkZOV0h2MHl2bW5ZcXRnTFpIcjBFODNxTVRrMWF1ZDRZUE5CWmYzVUJw?=
 =?utf-8?B?WnE0ckEwNmVBN2hjaWdlNS9xd3JqbDhwclhLTlNqTmpLaFJVaE9XeEp5aTEx?=
 =?utf-8?B?VnZtand4eis2QjJnRWVwRkQ4S1dsOTBKQzlxVXE5Nk9FWkFvMTF2c05Lc0dZ?=
 =?utf-8?B?R2owakJ6VzVNSjloaW1YYlE4cU14YUR3MEZMOVlZTmdRdmpCaVFTZEh2UVNP?=
 =?utf-8?B?M2VXbm9qdng0OEZYZFlhZitnR0JMdFVaWXBCczRDWjkwUDhtenpwSFBwZ3VY?=
 =?utf-8?B?bWk2UU9wODNGaEsxNk84TFJEWlY3NEFLYlZObmFtMGdoL2dJRVZWVGVPL2Zl?=
 =?utf-8?B?OVdCRUxTVGNmbXZ2MThkSWt4MytsbHROSERvOVRzTHhqZGZqb1IrV1BtcmtD?=
 =?utf-8?B?Ris1aTR2eC9WSlNPaE40UUVqRDB2b1oxUG9vM3AyRHI2UWZXNG5OVmt1WTZC?=
 =?utf-8?B?cTNOUUxoYU5yU0xVUFN6QnRHRkF1V1NiQlFnMGpxZWhuVjhEdXNGemFlL3BZ?=
 =?utf-8?B?WXpFdFpDcTJZK2dBNVVnbVZFNyt5ZjRldDBkOFArZzAyc1ZERHJIZWsyendi?=
 =?utf-8?B?SGZLd3hac285ZnZtVUdVajJxRjljN2M0dG8xS2Z4cEVDTGdKc293OXdSRGll?=
 =?utf-8?B?NzhZMVc3aklHWktlVDNPbitWTlBldStXR0hhcWFNdFlQL21NTmtFNUE5blpF?=
 =?utf-8?B?VnhRSmUrWXc4aUJVc2JqZERNZllPbTlVTG9NMzRHdFQ1MXRJY2gzOE9pcFdv?=
 =?utf-8?B?YWpXZFQrR2NrOFQ2TEp3UEthWW51bDFxSkIxV0pWSWU4b21yblJkajZBSzMx?=
 =?utf-8?B?RXdmZ0JWV0pua1NvRUhDM2NKYThtTm5NM3YwQm1JVDg1UkZsREhsSklVaFZx?=
 =?utf-8?B?NFhyM0JHNkJCZHh3MHdidzU3czRDSW0vZjBmaG1WeHNsZHV4Z0F3WTY3cFJS?=
 =?utf-8?B?UGtINUt1Y3VGaWN0cXRjWkF0TVpuZm1qVWFIbCs3Q256YlIvSFQvb1dGcHVx?=
 =?utf-8?B?aDZ5RWRqSUtxNTQwajRscW9MdGJaeDJQMks3a1lLSDg0b1NVQWdnbmVHQjJZ?=
 =?utf-8?B?RE4yYlNNMVd6ZDlicDRaY1dTTzAwYTRZZGloeDVQNWZlQ3VScE1EWU1uK2Ft?=
 =?utf-8?B?OGd6K1hxSENoRGFRa25UTkRBQ1dqOVpYOWpYMzRyTU9hOTdTVklnQnhZNGM5?=
 =?utf-8?B?ejNLbzdudUMvQVRwRTdRelRHTjhYZjJrT2VyRVZCdnYwUkJWZlB2ekt6T2Uz?=
 =?utf-8?B?dmxqRDZqU2hLRW1sT0ZVUEFEQ1NLelBzbzRsb3JSYnoxQUR6RzEyUFI0NG5U?=
 =?utf-8?B?TWd0bU51amVraVRZdXhOeEYvVlIyMUxJV1JGd2hrZkdKSExZWWIrN2FCai83?=
 =?utf-8?B?ZUYwbTNyTmpFbFU5ZW1ObmNkN2FRK3pYUzNoN0tKbU9rbWFSbjVBTE1jQk45?=
 =?utf-8?B?WXUzM2ZYRUhwUnJCR0cwLytzaEh0V3dqVXRCS1VwZWdsVXo4NXoybFR5YWU5?=
 =?utf-8?B?enlSTlVBdExBL083UzZpckR3eWhtdk50V3lrYTlES0IvVStMZnNZYWNmbGRt?=
 =?utf-8?B?RHI0ZTB5a25uSjdUaGFlQ2owWDNnWWkxZXpKZWJuSTRxRjRra21HeG1IRnlP?=
 =?utf-8?B?NzZaZXVydU5BeGk2M3AxSWF5TkY4L1Z3Z2FtdmI5VFNmNXQva0dYNkpWQ0RO?=
 =?utf-8?B?M2JSK3hhcEpsTEFHTWMwdGNhOVEvYkk4MmNmdTlOUFl2cDA1azRYbG5pOFdV?=
 =?utf-8?Q?7MB870?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(1800799024)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:54:21.9433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91301a3-8e64-43aa-dead-08dda75d2323
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jun 2025 13:54:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6535

T24gOCBKdW4gMjAyNSwgYXQgMjE6MTQsIE1hcmVrIEJ5a293c2tpIHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDxtYXJlay5ieWtvd3NraT1nbWFpbC5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zz4gd3JvdGU6DQo+IA0KPiBXaGVuIEkgc2ltcGx5IGNoYW5nZSB0byAicmVxdWlyZSBjb25mL21h
Y2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm12OC0yYS5pbmMiIGFuZCAiRlZQX0NPTkZJR1tjbHVz
dGVyMC5oYXNfYXJtX3Y4LTJdID0gIjEiIiBhbmQgIkZWUF9DT05GSUdbY2x1c3RlcjEuaGFzX2Fy
bV92OC0yXSA9ICIxIiAiIHRoZSBGVlBfQmFzZV9SZXZDLTJ4QUVNdkEgZG9lc24ndCBib290IGF0
IGFsbC4gSSBkbyBub3Qgc2VlIGV2ZW4gYSBzaW5nbGUgbGluZSBvZiBsb2cgZXZlbiBmcm9tIGJs
MS4gV291bGQgdGhhdCBtZWFuIHRoZSBTVyBzdGFjay9Zb2N0byBkb2Vzbid0IHN1cHBvcnQgYXJt
djguMiBmb3IgZnZwLWJhc2UgbW9kZWwgcGxhdGZvcm0/DQoNCklmIHlvdeKAmXJlIHVzaW5nIGEg
cmVjZW50IG1ldGEtYXJtIHdoaWNoIHNldHMgdGhlIGJhc2UtZnZwIHRvIHY4LjQgY29yZXMsIHRo
ZW4geW91IGRpZG7igJl0IGFsc28gdGVsbCBURi1BIHRvIHVzZSA4LjIgYW5kIGl0IG1pZ2h0IGhh
dmUgYmVlbiB0cnlpbmcgdG8gdXNlIDguNCBpbnN0cnVjdGlvbnMuICBTZWUgdGhpcyBpbiB0aGUg
VEYtQSByZWNpcGU6DQoNCkVYVFJBX09FTUFLRSArPSAiQVJNX0FSQ0hfTUFKT1I9OCBBUk1fQVJD
SF9NSU5PUj004oCdDQoNClJvc3M=

