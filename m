Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D239EE81BA7
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:59:18 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46012.1770638353289766285
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 03:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YOmgn7n5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=YOmgn7n5;
 spf=pass (domain: arm.com, ip: 52.101.83.20, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HCk9z5cM8DnrDikRajp1XfuSvT0+bHyIn8oE7PMrkSwBpDznU/zOexgo/fQae465EO4Kbs3ndtYh61ZX+mcmf1q00cHX1KHeQxl0I1x2lQ9eURQufuFc98gNhTAdunhGt9wijCU0Lel/T456bU8U6OBEOF+lQ7vn80LNEYUt2kXu/P4ixihHm0C3P0baYX9FSnA3VGnHxYWwl5frIk3GvUracbntEY0RqF3RDzvnTjOaJDAcBf9JbOKjzGszI+vFXV4Vhe2u+TgDFOial/FG0W9/zs4h/x3Rroathqa0yeii4IEDl1pwVW0cEbgW8t3vNQlmCeNQZPLbcG9UcVpTHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugU/8e6VJeEJm9WYKD2Jq8dnPaysQDj1jbcAI174nWM=;
 b=n7YIhhfUbmbzD8/o3y/Wbb4FyrlMBy2LWyED1YcC5whjiAYKac5cIIJ3o31GffhxqA3/+c7uHRiitJdvwzh9kVY5itHmyRFx7doDGUsI7Hpds/FCibO+T8ib/dRXi48TAX5X6L+y3RBBhO3WFHcJ48sjqRP32Dp+iyrplAeqzKB17CtwxUGvVGiKCMuEAy03WAqgmuSFbrdQfX5tXsyenciT96oWOPyOpOrHPCXhbGf0sn+ESfdBS5I9v0xR1Dov57RbrQlDq90WmFk/P0ofeFOinUpJJiGcdHjM3DT2xulCheZwftEQ2eFGKXTZpaWenhbC35KnzF+KbsGV7XBbZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=denix.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugU/8e6VJeEJm9WYKD2Jq8dnPaysQDj1jbcAI174nWM=;
 b=YOmgn7n5rhfFTZmJE6F3UwMLzkcez6YpLXqNjnD5eA9paco1VCbsGjVRrUiQ8Zk85BuV6AHrol8pzIbtMSEHQTNhPsEnDIAThYEo9uAwky+If6Ld+IUvdoXmn8Xp0qeiSBZ1t78dzDiZEcXP83NdBjAxBXFyhG2AIh1tOU82OF4=
Received: from CWLP265CA0351.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::27)
 by PA4PR08MB6222.eurprd08.prod.outlook.com (2603:10a6:102:e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 11:59:04 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:401:5a:cafe::c) by CWLP265CA0351.outlook.office365.com
 (2603:10a6:401:5a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 11:58:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 11:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMpiCIv0bXP02pOvhRI8mY+zP3BvpfBjUFMuSiza/RrGmKJeVcJX0YCyP0MLNZEkxtH5nO3dQa1Rm/XCEQKYBGS5TototjxKjsq8B6SiAL8HIUB/eWsx/qz9qCUzKajNCDgidupwY4MD41PFgNJGAe9mfr1jzG54Xhkx96OXnmayGbUbrblV6Z4Ced0sDWhVbEGbaC/Zp/LVg4lv8QVhHaLaF7vlI7laCG1mZM6oTpjXVgwxwi4L2uxWIxl5bvzfOSVK0y8NX1+osYKNSn91wDA0iAWJDZiyx0X+8tvMJyc3mLaG5O3QUSo6ipaq90OSlixifigCjzl1vJMT5uHQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugU/8e6VJeEJm9WYKD2Jq8dnPaysQDj1jbcAI174nWM=;
 b=jIDjBzjPwTpRNSqMVxXk1RtVAJSLoH2u9+3c7oSCPDWhMHrxhWvBYl56Pp3V25dLia2h+ZgJgTHr3sO+rJeXiWRXjO6PvjJ1Zyxb/bOiTFKHPQrTvwCIiQpXi1iIU7IkUCoH0P8GxpKbe2dud7jwe504dxZqecaD1wCWbVsjiCAn6m7yLsHHDF8EAIKRNKJEKzRpv7nhvTOC7hE4BIX9GU5s/mQqtABhDlJnscPTGffOeWz0c7j7d0MxdU/NAlIW+dWdwPsfiM60gs1AtL0hOt9ytzgB2bb+pmFKYzelJ22sZReSLP9EC0LcO5/1MoEiQeNBqUIG1HUJrYFjQV9uHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugU/8e6VJeEJm9WYKD2Jq8dnPaysQDj1jbcAI174nWM=;
 b=YOmgn7n5rhfFTZmJE6F3UwMLzkcez6YpLXqNjnD5eA9paco1VCbsGjVRrUiQ8Zk85BuV6AHrol8pzIbtMSEHQTNhPsEnDIAThYEo9uAwky+If6Ld+IUvdoXmn8Xp0qeiSBZ1t78dzDiZEcXP83NdBjAxBXFyhG2AIh1tOU82OF4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB11423.eurprd08.prod.outlook.com (2603:10a6:150:2e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 11:57:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 11:57:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp/external-system: remove redundant
 DEBUG_PREFIX_MAP fiddling
Thread-Topic: [meta-arm] [PATCH] arm-bsp/external-system: remove redundant
 DEBUG_PREFIX_MAP fiddling
Thread-Index: AQHcl4SEShDPNfAf1UKxuxMwwKEWLrV6R4sA
Date: Mon, 9 Feb 2026 11:57:51 +0000
Message-ID: <95D55B48-57F9-4820-8F05-43C8CA8902FB@arm.com>
References: <20260206144402.1583348-1-ross.burton@arm.com>
 <20260206162025.GD11121@denix.org>
In-Reply-To: <20260206162025.GD11121@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB11423:EE_|AM2PEPF0001C708:EE_|PA4PR08MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 270db097-327c-4239-6d43-08de67d29e65
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UWZKRWtmb1Rxd2doZFJ1Zk5ZNW9nRkZHY1EwWTdEK01xWHNlMHY0TlpTazFL?=
 =?utf-8?B?dkVRNHVRMGdaT002am1ic1phZE5ldUtWaGYvSjZwcU5tRU1MRVpxVllHd1Va?=
 =?utf-8?B?Zng5aVpYR21lelJoOGg4Sm40bCtxYzVhK3pHSFZHcEtEVytwZzZYSDR2bVRx?=
 =?utf-8?B?emw5NVpPbHVMdmx2Qkl4RmZhdTRaSEJYeWsvY0w3TkUyMURmYnNLN0tkLzR0?=
 =?utf-8?B?dDlqaUszQ3p6MVJQdWFpRGp0SW5BM2Q4SVpaUHBWeXVYOUV6MVQrcjNHUThs?=
 =?utf-8?B?dXhkUU9va2NsL0Y3WkxjMmVrYTU2OVZoek0wZU53SHVkVFZDV3U0bGJvcmky?=
 =?utf-8?B?MDk5MUU4VmhjUzVYL1lldWVjRFV0VjZJSEE1MUp0dVRTcVdCVXUzSGNBOVhS?=
 =?utf-8?B?R1Q1d2hzQXo0UVV1ODhMUVNsbHgrbElmNlNob1k0STBTR2x2TGQ0MU9DK1Bv?=
 =?utf-8?B?RmVQVkkwNERvUEVldThyRWNDZ21NVWhZOGxRejFiU1p1OXdvMUsydjJ3cFU3?=
 =?utf-8?B?cWo2V1V2WTh4Q2xiOEtxRTdOdktUTGt5b1gxa2lFY1dzbDZQRnlZdW8rQkNV?=
 =?utf-8?B?RzZBTk5ILzd6OUFFcklZeW1sWFllRk5ZMFk5WUxoUjFHRm1BM3VKZm16VUY4?=
 =?utf-8?B?bVpmUWp6NjhuaW9vME92U0VXK0tCTmk2NWNFazEzSnBsR0FOeHlMdEVqdXda?=
 =?utf-8?B?REd1Wmxyc2xhNHRualdQWUo2ajUvLzhGSEZlMVVqYkVjNVVyeXJ4eU9ja1FY?=
 =?utf-8?B?NnZSRkY5K1dPdXRDNnQxWFkvYkxKOFZ0NHl0aFhvaWMvQVJjem1QU0I5T3RU?=
 =?utf-8?B?aXkwOHJmazhxUW9sRmNCTEVlWUR0RExNSUlVa3ZWMHhPSDNIeE5uc1JVRER2?=
 =?utf-8?B?cTNRb2hOYTdqZzNjN3BhVWJHajJCZlVHak1hdHNzV3dhT0FLTkl5dm9GdnVK?=
 =?utf-8?B?K3N3Mnk5TitnWEhRT2tTUDZRdC9DbTRHTVhYcWZKOFBsc3FqK25pZ0xjZ3VH?=
 =?utf-8?B?WGxlQUlRM3FRd3U3SGlRTFMrM2NWalBMWTA2a2h4RG9GSUppRElEQ3RHWWtU?=
 =?utf-8?B?eHdzOWZOaXk0Wkk0ang1TEpRaHVyei9QdXBXSlNkN1Ezb1NPcHdQaDNMT3FV?=
 =?utf-8?B?MU1TNVdUZGJEZFJGUVViZmNwS2RZTlloVUlWUFpxdFFIYnpSV0dOaDBHSEFZ?=
 =?utf-8?B?OFByamFSdHN1WmdvTVFIUlpuQ3crUnUrNVRac0tzWHdHRmRsVS9ZWTI0NTBw?=
 =?utf-8?B?dFdFNmZCdGdZOGxESGxoc3lYbS9wQnN3VlViSytuVlpmMm9JWkphRFZna0xC?=
 =?utf-8?B?aUoxR1FTZURDV3BMY0dWM1luUkRydmZFeDVGbjZUQmNLK0YxdVBwWWE3VS9K?=
 =?utf-8?B?UlZTUEZ1VTcwajBJblFCMlRnZ3ZNQ0xuTkxHS2d6SHhhZWJiSkE5T1M3Ullz?=
 =?utf-8?B?aDZ2anlOQ2pERUJSQjIxaFRBUkpYUkp0cHFnNWNMbG90M2tQcUpwZ0FVMkNM?=
 =?utf-8?B?U1l1UmVTNVkzdUxoQ2xneDBzZGt2Y0ZaWktQMnlKenU4Rk01RjBvUTdxTEd6?=
 =?utf-8?B?TE5QU2dDemdKa3NaNGt4ODNmSFZSSDZNUWpqWXIxM21ZZmFCbGIxZ1g3WWRi?=
 =?utf-8?B?bG85UUVCUERKNlNaYUdQemovbG94bDZqaU8rOGpvcTBVdW1OMitsK0NSVU1L?=
 =?utf-8?B?M1pETndnSkY0STRsckNBVVJUS21MN2FZMVY0WTg3Vy9vcEppWEVlSFdCbU5Y?=
 =?utf-8?B?NXozdDJKSzBQbytCSjdPS3dmZ0hubVo0Y0JDd0ZEUzlRRGtyL3BpMmZpdVdT?=
 =?utf-8?B?UWlpZzdzNEtpRmxtWk9kSEdCajNQSUc4cFM4dTYvdGlHdWIrYmJOL29WcFJJ?=
 =?utf-8?B?SUpETVBPVEEreXFnV2lUVnNjcHdkVmJjMkRkRm9DZ25Ca2tBdkh5ZFpLRTNX?=
 =?utf-8?B?ZFBMT3doaWtTekRFSmJiQjBaOXFlYm01c2lMcDJVYjMyVldyUlY1bVVMZ0Zl?=
 =?utf-8?B?RGpTd3VLSkxKVjNIcmwrZEFUcjVZWWxBQXhjRmUwUEczSXliRXhkOFVFWG1C?=
 =?utf-8?B?MVNoSWV4TTM0TS9YLzlMcmNIWHNqV1ZLVGlIdFo0SXMzWnBkY25GWENNazEz?=
 =?utf-8?B?Y012cm9WZzNuSjl2MjIzWEZ4SlFwUzYrdHB2VzJqUFFiMER5UlkzUy84Q2xW?=
 =?utf-8?Q?mkGdmVFx9S4BOT+Nafq04fo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <237C528F7870AF4287FDEB5016F19583@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11423
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35e52ad6-0a55-4777-777a-08de67d27390
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|82310400026|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SXBRb1JINmlmaEs3M0w1Yk9kZ05KQXdlNFdkdlFJSHd1U3VUNTlMZHg0TXFQ?=
 =?utf-8?B?bzFGU3J6Q2gvUnJML0pBZ1NtS08yai92RkN0K1RTOGU2WXV6VHIzTnNvK0Ns?=
 =?utf-8?B?dncrWDh1OTY5c2U3YWxyMVZmQ1JlVU54eTREUW5uKzE4WncyTjJrbjZyM0NG?=
 =?utf-8?B?aFZ1dklMcWJsbGZtZWQzcFFnS3dBdlNTTndvVGd3WWUrckxsZXVaTE1RSFJa?=
 =?utf-8?B?bksxZm5XLzl0OTVDelNhakdtYU9EbjdCYXUzMUtYTHRaVWV5dU5yd21mbjJk?=
 =?utf-8?B?dTFNeUtiVU04LzhCTjEwblRIVlg2cElqZGQ1RjVSVWlXb2oyRFd2eGVGRFRj?=
 =?utf-8?B?eDN4Z3ZWOGxDL1Rqbm5NL09ZVkIwbExqV2ZudXNlNmJZd0VvK04wb3RkaFNP?=
 =?utf-8?B?SVZQSitWUG1VTnJ2dWJvRmVYaXJLc3FJUHJEMUNkaXlKdjdyckxoVFRjUTdB?=
 =?utf-8?B?VmNmR1pjNVhZaFJEUU1LK0d5aUhUR3pSb2szUXVWeDZFUlc1T2VJd3lnc0ZV?=
 =?utf-8?B?SU4vL1QwbC9ucWRRUHZpYWRkQnExVnNFV0c4Q3YzUzJCNStZUmRjbkIxNnY3?=
 =?utf-8?B?UVJOelpnT1VDTTZkWms4SW15N21HUU5mdTkwQU9iZFFIS0JJaGg1YXMxZHFW?=
 =?utf-8?B?YkVoUEI5Mkg5UkhiR1dQS2JlbU1rKzZyL0RQbzlsSkJlTElOVDZpTUp0bWtT?=
 =?utf-8?B?SHdiUWtGL0ZNSUFSMVhTSDcrb3F2SWJXMUNlREhXUVNHZlpaVjk1dWtKRG0r?=
 =?utf-8?B?VVNOVzV3L3BUZXJoUHkzcHR2RzBXY1RhWUptQmxtS014ZlRIQUhxdVBLZHJk?=
 =?utf-8?B?WEp4eUJVeURDcEkrQktxL09va0FHUUpHZmczd0YxL0RTMnFrWnYwRnhGeWpL?=
 =?utf-8?B?cG1hK2FpamxHanptTFR3T0U2QnB0bGZuMm56WC94bXp0ZDh0Nk5EbkRRaUNp?=
 =?utf-8?B?Z0kxaGp1TTJ5NllRZlJqZmtaUFlFU0VlbncwVVVZM3N1ck51WG1JUmFZRkt0?=
 =?utf-8?B?c2JUMlc5NTYwV25zK0RDWGlVYk8zK0JXRUxmaHdlMXlzcVU4RlJ4MnV2OW5u?=
 =?utf-8?B?T3JVemRMdXYyVGlodXNwcVR1dGJGS21ncDVmRjNFVm0wUk44ZlErNXFGTENn?=
 =?utf-8?B?WGhSeHFkNS9oZHp5dkQ1ck8xa25xZGVtNmRtUEZobGZSb0d4R3AvMG9acXdw?=
 =?utf-8?B?Mm1mK3V4ZXIzT0dQdkVLRDJVSjNIWXRxczgwYzY1bzZNcDFqeUYwRi8yMFZv?=
 =?utf-8?B?djZPVEtyTEFIY0lNUjFQd1phTExRNk1VOTd4cFdrUDlCVUZ5Z3FFOHZpZEMy?=
 =?utf-8?B?SmIwSERvRjFPOFg2d0k4a1E3OFBNeHZmNzNKUzYrcHVuTUNscm9IKzZMVmpu?=
 =?utf-8?B?cWUyVjJrWGpSRTVpWmY2UmJ2UnFjd3VydnkzR2RaSHN2Ri9jdjVMTUR1WGdG?=
 =?utf-8?B?T3JML1FUbkhhRUU0YzdlRHJIRjRsd0VkZTI4eitIYkpleTlsOWx3eU1kWVFi?=
 =?utf-8?B?NjF5NS9SRjk3dXZDOGlJc1VsN3Bad3hvMzNtRDFSZ2NZRlpuenM3cWRDdDd2?=
 =?utf-8?B?cGUxTUlvcDRzWGdFaDg1Z1JTWUdYbmJPQVd3Y2JHTytOcE5sZ3JOemJjNURV?=
 =?utf-8?B?TE0xNDJNRjh4RE1KanJlMEJROUZ6Yk5MbElsNHVFanhqVGZQbDRGUXVRTk5D?=
 =?utf-8?B?WUYrbHhIdTdzYlVXN01iSXViWVg0NzcxcGxRQy9xSW5nRmtYNWhSK0V5S0kz?=
 =?utf-8?B?R2k2SUU0blZwczFHZnhJV0I2STNJcWpQQjJxM1FFbnB2Z0YwbGpCc2M5dHJi?=
 =?utf-8?B?QlMrQXlUSy8rek1RNzQ0SllEUEJCbWlua2tCUjFrZm1BS3ZTZVNTQ1BlSGFn?=
 =?utf-8?B?ZEJiMTcxN01zeVZlaWdNWG4zT1ZFaVJXK1FKd1Q0QjIxUnBVdkZTblJKMGZO?=
 =?utf-8?B?UW5XUVphOW16RW8xRW01cCt4MU5YcEV2T0V4K1FPZkZwT2V1OFVLTTdvb2ZX?=
 =?utf-8?B?dzNPK3dMMU5WYjdpWm1mYmQ3SlFRU0YraUE4UFRCZDNqYW9laHhWS0RSNWxL?=
 =?utf-8?B?eTVBRms2RmRlcUVONEs3eVIwY21JaGQyRGtzWEVMekdYSjQyc0xVZ2x5OHZG?=
 =?utf-8?B?UGhEK2RtWkd2U2VRVzFtcWU2UXEycjhMbTY3KzhPazAyS1BoY1FvNUdyR002?=
 =?utf-8?B?NFZXaFVCM2xrTGE1SHhSRkVXcDZ0R1A1b1JjclVkTXNIVkdNL2l3UThRZU45?=
 =?utf-8?B?b0pDeDNDYlBOTDJTaGtzUDUvTUVnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(82310400026)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	1RfZEhntEM8HlgW8tloyso65UYSyytLtjNkHluUtAUtyJPMuAYjus7L3Gb+B3JnpqeXQeVPYyfrx7bgFHZHJbqN37Cfhbbgd9SjUlEKj1iB74S1GCwDFeGSBGwJWTAlksKOW4PrAiJVYCBdWOX+ysu8E1PcK3Ps40NAToibJNjCEpmxGjSYbx9HPNbp0xe6Gr2hGw/w1XlyUXdf0NCDmtOuhv/Ixwmp5wYhX+jtRsfGNB+OwD/g6DyCaE2vWWF5zsQ36I5+fOjPNBVQBYNK8h01YKjHczJEWqzZE/zWkCpAjCDzS5qVyX5GFPcjKHJ2nJ4ap9Q0l4DNMEOdqpb9vae/7pSdNAGCQqY4hXppgdhinY061GfofxXxc+QY0PmAG03/MgRJKNjW+jKkqtxvQc/cTKrGqNWDZVPMXL4ai9N8Qov83WdoSyrNOGfTsY+sj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 11:59:03.1109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 270db097-327c-4239-6d43-08de67d29e65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6222
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Feb 2026 11:59:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6894

T24gNiBGZWIgMjAyNiwgYXQgMTY6MjAsIERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5v
cmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBGZWIgMDYsIDIwMjYgYXQgMDI6NDQ6MDJQTSArMDAw
MCwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+PiBXZSBo
YXZlIGEgbmV3ZXIgZ2NjLWFybS1ub25lLWVhYmkgbm93LCBzbyB0aGlzIGNhbiBiZSByZW1vdmVk
Lg0KPiANCj4gU3RpbGwgbm8gcGxhbnMgZm9yIGEgcHJvcGVyIGJhcmVtZXRhbCBtdWx0aWNvbmZp
Zz8gUHJvbWlzZXMsIHByb21pc2VzLi4uIDspDQoNClBsYW5zLCBhYnNvbHV0ZWx5ISAgUHJvYmFi
bHkgdGhlIGZpcnN0IGppcmEgdGlja2V0IEkgc2VsZi1hc3NpZ25lZCB3aGVuIEkgc3RhcnRlZCBh
dCBBcm3igKYNCg0KUGF0Y2hlcyB3ZWxjb21lIDopDQoNClJvc3M=

