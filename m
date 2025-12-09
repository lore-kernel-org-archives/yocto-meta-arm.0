Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328CBD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:28:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10426.1765294082005712599
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 07:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EZ3bLEcL;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=EZ3bLEcL;
 spf=pass (domain: arm.com, ip: 52.101.70.7, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AYwyGsz1DJMse7vWCuiE3U1EpOMWAsja3y5y/1T1endU9H3GmtM16+CIAXz3v4yPsD4eh81C4eHfzj5Ige613KYr1PV3CQ77oOGthVeei5ZX4er+D7YMb9fQaa9D2Cb8SHqahm4DTWnDJ5LyaX9syc3E9mX2C9Zk3XENZ6KPczW6+21PwlNgACaweryJuK3oV8NbxdAeBsPquyXfME4/IdmTM+Mh2jwlfHJBWgluzjUHPR8/HawyI4T8xi+YF2hx5OH6IJ6sdbKMZM1RuecgDnexGWmMXnV5GFAizVZxFIBgrHngOsZMNU1s4K47rdX869U6H5z208TRVcrRiUCXSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOR76XVQu6vMnuiAAZl+r8jPlaXtawiuRk1INe368zc=;
 b=DGQJNYqUVCUk7Y74DTH4Lmu0yTTzSam5gz0lUhAUt+wEHdhbI0SB2Nz48awvp+fHrupWgZMoHLgqvikKuMJtsg01z9YFtSvRiJMRKWk1NkDiAokrTXzzLj4vsfPXbivWCqW/zgi7Bm2BBhtbGXa5wlNIHXKKFUq6jccjOCSV6XX7ax//1+g4fOSSqSSqDx/l+1DqlLg8oI26UFKoRxXM31EHrBfvS/M2g44q0zoyiVq64Z7jLMLK7sOQhAigpYAmP1L94Wz2WLZj1A5zMj3oKeepExu5WexqpcAjmi8Cm9AWtGd1I9dCZnvKD4qEB/D4NqlAkpcr7mX+Zq+tDa43jg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOR76XVQu6vMnuiAAZl+r8jPlaXtawiuRk1INe368zc=;
 b=EZ3bLEcL+NOdmXUcGDlCgCI5BDwEfcU0+biBqOYDsm4lAvuFcG4h+v2PtInh3+znrogy/EO0nxNBOS//qWl4oAWztZKUG3dqPhz3QBQiu69VA7Gvnr46FDtWuOJiGf7tzlV4ED1CuxJI+cPdh20YTtabeNTVeGoxQpU1LxCWeOk=
Received: from DU2PR04CA0069.eurprd04.prod.outlook.com (2603:10a6:10:232::14)
 by DB9PR08MB9826.eurprd08.prod.outlook.com (2603:10a6:10:45d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 15:27:56 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::55) by DU2PR04CA0069.outlook.office365.com
 (2603:10a6:10:232::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 15:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Tue, 9 Dec 2025 15:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5Ei+isVH6GGkPrEDf+KQx8qXD67T8Ptw2Ci+esEsWpHyzimN/cvLnDDdsTiAYq8D/mWEn0L30/uWKDu9SNqkWv6Am8wJ7LOZKLO0H29eBszFWMThKXLifEU+gjXvVj73Ws0Mw+nd0wThCsPiOzGYk9jvOC0aEOciocVv/5VmPL10zkP+fnNuwa9huL/a15L+XzssWRNJVQkd/CmoWxGV89Cha/kwO5Xl1kLwT9oDUOj6OZD8X8I00CLODoTBBy3pQ8FklOHgFCTZcOOfVKZET2edU6LifHdY8R62hpTw8OJRqqn4eVHjGUCj+4pJB2Tw9vvPMQTsrnFsuMvaS+o1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOR76XVQu6vMnuiAAZl+r8jPlaXtawiuRk1INe368zc=;
 b=DCqs6SGBW97qYdXO1YKwAQNvLYeRjJgRyZ/nZWFhBhfX0bKyJKdMxPR5uxVFPMIurrLpPiyKGA5MCHNysQVjnwxn/zRs9LL0mkyjuXbiBbIkSxcBFMJs99/D1HyZ6LZgALCJej6CXmyZ+fBlJnpa/xBsn2iZCQ+G4ioxu+JAm7OK+xKgr2BVrsDyG9+9rDRknZMCT3N3lMYgMdeqvh/m2bwvKjuG1KIYEf9FSa4/0QJlezFmbiZNB8TwAYbLSkX5etEb6LOP/hoYk0D132Gb4WpRB3+vPwG138tGiW1MhUQ14zbAA20+iPIdtQkk3YBCvOHdsL/d64JWvkPCFW8QIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOR76XVQu6vMnuiAAZl+r8jPlaXtawiuRk1INe368zc=;
 b=EZ3bLEcL+NOdmXUcGDlCgCI5BDwEfcU0+biBqOYDsm4lAvuFcG4h+v2PtInh3+znrogy/EO0nxNBOS//qWl4oAWztZKUG3dqPhz3QBQiu69VA7Gvnr46FDtWuOJiGf7tzlV4ED1CuxJI+cPdh20YTtabeNTVeGoxQpU1LxCWeOk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6345.eurprd08.prod.outlook.com (2603:10a6:10:252::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 15:26:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 15:26:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm/fvp-base-a-aem: update to 11.30.27
Thread-Topic: [meta-arm] [PATCH] arm/fvp-base-a-aem: update to 11.30.27
Thread-Index: AQHcaCcB90ZwkK/HuEiJwKrj9rNnLLUYEAUAgADKRgCAAJXSAA==
Date: Tue, 9 Dec 2025 15:26:49 +0000
Message-ID: <CA672035-3F4E-4E29-8E5D-4092AB95D129@arm.com>
References: 
 <SA1PR10MB5885A090DB0B9F373F6A84F6DEA2A@SA1PR10MB5885.namprd10.prod.outlook.com>
 <20251208182626.GH11121@denix.org>
 <69524.1765261824486362826@lists.yoctoproject.org>
In-Reply-To: <69524.1765261824486362826@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6345:EE_|DU2PEPF00028D08:EE_|DB9PR08MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa5e02e-e1ae-4e12-605f-08de373785f5
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZkpHbEsrWDF3OXFNTVM0QXdFTDh3czBSQWk0TG9BQis5WVB5YzVJV0FZZTBo?=
 =?utf-8?B?LzBxWndqelppRlFFditONzZxd0tiNjVMcUc4RWNmS3ZHekFkRVdoNlo2MzBW?=
 =?utf-8?B?S1paRnNJY2c0UEJ1Vy8vTkovRi9HNHRtKzVNa0J0QysvaUZoVUVCbGx2RjNL?=
 =?utf-8?B?STRVZkhKeStLNHJCMG4rVmZSMVZVanA5ZGlqNVBvNjhEY3NYaVkyNmM3VkY5?=
 =?utf-8?B?OTBXYXo5OWUwTWFGdkdFcE1jWU5pZFpIVUMyVUpZZHl2bEhVTW9LT0U0eDZZ?=
 =?utf-8?B?ckpGN2pKTVQ4aW54U044QXVKRlpDaTNZOWVMK0drNW9QSXZlNHBYU2dYQmZ4?=
 =?utf-8?B?TS9MNXNyZlhjSWlqclE5blhVZWJ4MTFmamNSbExlRERXVDJEOGFqUENsd3ha?=
 =?utf-8?B?UVZVcU9VYWUzMm02Y1AyL2FXaWhkZ2RjdVVTQ3laejRTVWQvVVpjdEJ3U0tQ?=
 =?utf-8?B?dldDOTgzUGl0ai9PemtQckdneFRpSko2TGVTVXpiUzhEM3l6VVR6elBsd2tJ?=
 =?utf-8?B?Y3p3cXFWK3VkamVsRkRURU5QNmdtUTZWRnhNOEwzZ0wvSno2emxudWRHUVVV?=
 =?utf-8?B?RmVFbFp2SmQ3QzY3c0pVYWo0ejJIRkxsRHJsMjBBOXFLRUp5SzF4ejRpcXR3?=
 =?utf-8?B?aXROSUdSa3N4S2Q0ZkViU1B4dS9vZ3FJQXBDOG5nZ2tPdDJQRjRoQmVlMjJW?=
 =?utf-8?B?QklROEljdTk3bHNzVWNJNjlYSmk5MWFKOVhzYmgyb1B5bW92aStEYUVVb1hu?=
 =?utf-8?B?d2wvV2hRYXA5Rit1OUdwNDFod21WOWMva2JFK2Q5OVF3L2tZT0hMQXFJMFN6?=
 =?utf-8?B?N2tORFhwNGxIQVFVSXhtWjg5UTZwQkxLODYzellrWVp4cjF2TTlwNG9KM0R6?=
 =?utf-8?B?SFd0MG5MZ0pyeGxmRGozQjc4UXlPUytYNHJ5d0VvYWRTMW01Wk01ZlJnRjJn?=
 =?utf-8?B?M2hKbnB1UVpZNWhuWVkzM2dQUXl4NFJOQ2cwZzdoVVZzbWtDQlpOS0p5NjZW?=
 =?utf-8?B?bCtHK3lZTktPY2tDdlpPT0NleTk1YWxVZW1iU1ZmMXFZSjMzRUhCZ0xjSkRV?=
 =?utf-8?B?N3RGcGFuMjVHbzNURHlDbGZyR21abm1KcGZacFRabjdzK1JkaFRmS3Y2cUpS?=
 =?utf-8?B?cFFzYzVINE5BNEhDU2R1RExMZGpJS0gvQVdIVUVUZW1iTDhUdEk3czJ2ODkv?=
 =?utf-8?B?WCtMTjBVUHI3OVMxSDA0QXc4d1R6RTZaR0lMak9PUkY3aUgxUmdlNDN0RmVL?=
 =?utf-8?B?N3ZvYmlZdzBXaThoVlhvZUxyRDkwQm9kRTI3UFU4RHkvQmVuQUY4c2dmRXpn?=
 =?utf-8?B?bmFzbTFCZWd6Tnk1V2FDYURBNisxZDh4UGpCRk9OSkJkOHF6aGpGZnl3dEx1?=
 =?utf-8?B?d1E2SjNaZG5qOFZKS3d5cVBaaGNQUStKSHEzYkxFZHBzSTdvdHo5eHNRQXBF?=
 =?utf-8?B?MFZPMWphTUp3cTh0M0FGb1ZIdVlHWkxRMk5RUXpOQyt2b24vdzk4REtFYzRK?=
 =?utf-8?B?a2R1VFBXK3VCaFZkRjlnQzQ2eko2OEpZNFhqMzFOUFJVdHZBTWsyUWZpUGJ6?=
 =?utf-8?B?V2xUc0ZickJvNE5IUzZzQXlYK0VlSitLVXNVMHc5NW1KZXpPVDlQQU1UOFVm?=
 =?utf-8?B?bm9JaTVScmtJaXZZRk5reUE2OCtVZ0lmQjd4emZESDUySzV1ZkV1OVJvZ3hu?=
 =?utf-8?B?eWt3WjNRYUhiZ0JiU29TRnJSUHp2cWgxbTJ2Ynl1bzBnTWNwS1RuRGhtemlo?=
 =?utf-8?B?bGxnWk9yTHlUNHYzSXNvQWxwdm5jVk9YV0s2bFhYSlhNNkdwaXB2N21JT0ZY?=
 =?utf-8?B?SGFwS1o1R3Fva1BsL1crL2V5Yk5vMXpDNCttWVRCdjlhalZycUJqT21LT0VD?=
 =?utf-8?B?dE8rNWgxZVJrMjI5bS9UR2hSOTllN2IyWEpYdE45cDZlMmdYM3NJdG1vd1NY?=
 =?utf-8?B?UThOZVM0aitoa1Q0RTVFRm9JK2RXWUVLRCtEVlh6dnF3a0ZGSU85cUx1ekE2?=
 =?utf-8?B?QkZVZHNpQisrL01od1BXRVZHZndFWjl0cUF6RExXUllJTWRlc3BXZndoZkxt?=
 =?utf-8?Q?MM/mqh?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2E385EC7CA2424BA09233E825CE7DB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6345
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9c724d27-3c79-40f2-f47b-08de37375f4c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MHoyRDF1TEs2d2hQOGpGOCswQTlBSjBTWkJJMmpTOUEySVNaaFIycG91WVdx?=
 =?utf-8?B?SjQyaW5QL1hXTmRNY0VTT0xqUDRvV2hMT1h3clpLWnU0aDdjTTJsRFpTZFdv?=
 =?utf-8?B?VVJxbk9xcDIzOWUwdDhoMU9YZkR6dEtFVG5WbUYwRG9oU0pyNEg1S1JVK1pQ?=
 =?utf-8?B?eGU4Y1F5d3JIUUozcFN6SjU1Z0pVeFBILzJhejkxdnBrRXJucTJTeTVHSDk1?=
 =?utf-8?B?ajBxSWEvbHc0aFNtc2RZL2VCU2oxckd1aHhRUDFFeHpFMTlHb0RubmI2Mzls?=
 =?utf-8?B?bVY2VEdTWEE2cERmTFlNdXdIM2FPYVlRRFZ6VmFWQzZnMjk1U2NNRmxmSWZZ?=
 =?utf-8?B?Q0FyUGVHL3pRREFwTG5lRi8rK0h3WGM5Sk1IdzM0bnprM09kcjM4M0gvWnd2?=
 =?utf-8?B?dlRLQm9TTWVSUlRPcHJ1VnNpOWIzclBkVm1pZTdoSGErbmJSSE84RG83R2kv?=
 =?utf-8?B?RjVSM01UTmRPRjNrNmUrdVZla2JoL09VUEpWUk8vRk50eEYzZGMveGxBN1N5?=
 =?utf-8?B?STIyZUsrLzNrZ0padU5NcTlHZkNoNW5kZ1J1NTBJdThGWklpd2kzRjhCS05P?=
 =?utf-8?B?aEdJc2liaHJlQkdsYnI3cmN1R00wR3FPSjUzL2xrYzE5ekwvYWFaWTNKQ1dN?=
 =?utf-8?B?RUpBSFprbEY3RGNTQlA1eHpPQ002UE5MUFVIQVBDbUNMK3gyZWtBTi9QOUdp?=
 =?utf-8?B?MTlGQXZuMHl0cHhqTUZuc25mc2dkU2tTSC9QaXl1cXNIYkJqVFFjazdBNUV2?=
 =?utf-8?B?NldwQnBRbmp2cU1IWlg4Q21pUDNYa0dFbFZESDNCVHJsMWxtYlNIRS8xNWNW?=
 =?utf-8?B?UlhnOFRyakFKVXpDYVRwcDEzeGdrK1JSYUd2SjFIOFpPV0QxMklMTEpPSGky?=
 =?utf-8?B?YlhvME1QOG9hVjBtK25mN3JnZ3Z0WlJhRDRodVI0N3BIWk5QeEthMVhGNmZo?=
 =?utf-8?B?OUxvS3F4SE93V2RwUHdoWWtFL015bVp1RWxxb2JERzh4dFFsZ01jS05tUkd3?=
 =?utf-8?B?ZDNpeXJvMXVrcnhyMkY0YkpkS3E1M2E4dDJoVDNLd0QzS2lKRVRTS3ZUYWE0?=
 =?utf-8?B?ZUlXbjFVMDNjKzBaRllWUSttT3BOOVhXR2YrUzN2dThSR0ZxVW4rNFBxaHF0?=
 =?utf-8?B?RThKRUJEMmRieXVvZ0ZHbTFNOGVXc2F5Y1IyQlZRbGRrZjgvUzFERzdxeUhs?=
 =?utf-8?B?QWxzcmJmeWUwRTI1cG5jeWZINElpOGwzK2dyVzR5SFhDVVR0UWdSZ3VQc3Er?=
 =?utf-8?B?NTdWa2N1Q0ZKNm16VW4vWlFMMTNmU2w0U0Fzelk4NWZkbXBIY2cwVFZONkRm?=
 =?utf-8?B?RnRzWjdsZHQ0L0drWHltL1NYMTdHcWtQUlRYOW4yUFJ5cVVONStSK2x6L00y?=
 =?utf-8?B?aEFvc3ptaWxjV3RuWFhwWURIcGlieVhVRlk2ZTl5V2JHUE11RGNEWTdvUWJE?=
 =?utf-8?B?Tm1pNTE0SnFrQWFWMWFkdzJKODJuUHUwUHV0ZVhrZVU3Q2RmemN4QnZ2WUZj?=
 =?utf-8?B?WXlZcHY0aStCUVBEa0VXNlQ2UHUvYzNQQmJUTmozVm14a04wV00wclloblBP?=
 =?utf-8?B?Z0t1bWFNNklWRExRTmVpRjl5dCs0d3p2SWh4djFCYWwxcXBHMU5abnhjMzBp?=
 =?utf-8?B?T0xwbXJLbjd5dlRlNmhKM0xoNkFhYlNKTjFaS3Z2Z2ZkOHF3cm9RN0xkSStC?=
 =?utf-8?B?MUdsOFF0NTVtK0VOU2ViWUoyKzdjN0VINkFyN2xlUGhMTmdCMUxPeEpDRW80?=
 =?utf-8?B?WHpKdnp3ZnAzNHY2SXBhNy9FakN2c2hoUjZNaXhkSmlESWZaQTNYUE8yVnJQ?=
 =?utf-8?B?Q0ZnMk05MzNUeEhvcTBkTjJ4bVhtVXhxVW1FalhZVlIyZkdSbXhMaW1OVHNG?=
 =?utf-8?B?aTM5TFRObStVeWVhaGd0WGZjTjJRS05MeEhGeTNqTTVmVC9jcG4xdXhBQTBa?=
 =?utf-8?B?dFBoWXR3Y1JmdHBES3VDS0IwYXNrS1VuMk9rZTdmRm81YzRDU2RieTBoUXg1?=
 =?utf-8?B?dVE0TmZyM1VVNVYybXU0U2NSYVViMll5NmVwdWpWV3luS3JkVFY2WVBpOHJa?=
 =?utf-8?B?NkZxWUpuRlNOSGlSa0RHL2Y4TXdERlEybkNZbk81NDV0bDM2NG91RkFsWGxU?=
 =?utf-8?Q?1V0E=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(376014)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:27:54.3019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa5e02e-e1ae-4e12-605f-08de373785f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9826
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Dec 2025 15:28:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6790

T24gOSBEZWMgMjAyNSwgYXQgMDY6MzAsIE1vaGFtbWVkIEphdml0aCBBa3RoYXIgTSB2aWEgbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZyA8bW9oYW1tZWRqYXZpdGhhbT1hbWkuY29tQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IHdyb3RlOg0KPiANCj4gVXBkYXRlIEFybXYtQSBCYXNlIFJldkMgQUVNIEZW
UCB0byBsYXRlc3QgdmVyc2lvbg0KPiAgIFRlc3Rpbmc6DQo+ICAgQWJsZSB0byBib290IG9wZW5i
bWMgZmlybXdhcmUgaW4gdXBkYXRlZCBmdnANCj4gLi9tZXRhLWFybS9zY3JpcHRzL3J1bmZ2cCAt
LWNvbnNvbGUgYnVpbGQvZnZwL3RtcC9kZXBsb3kvaW1hZ2VzL2Z2cC9vYm1jLXBob3NwaG9yLWlt
YWdlLWZ2cC5mdnBjb25mDQo+ICAgTGljZW5zZS1VcGRhdGU6IGNoZWNrc3VtIHJlZnJlc2hlZCBm
b3IgdGhpcmQtcGFydHkgbGljZW5zZSB0ZXh0czsgTElDRU5TRSBmYW1pbGllcyB1bmNoYW5nZWQu
DQo+ICAgU2lnbmVkLW9mZi1ieTogTW9oYW1tZWQgSmF2aXRoIEFrdGhhciBNIDxtb2hhbW1lZGph
dml0aGFtQGFtaS5jb20+DQoNClRoYW5rcyBmb3IgdGhlIHVwZ3JhZGUsIGJ1dCB0aGlzIGJyZWFr
cyBvdXIgdGVzdGluZy4gSWYgeW91IHJ1biB0ZXN0aW1hZ2Ugb24gZnZwLWJhc2UgdGhlbiB0aGUg
dGVzdF9mdnAgdGVzdCBjYXNlIGZhaWxzOg0KDQpod2Nsb2NrOiBzZWxlY3QoKSB0byAvZGV2L3J0
YzAgdG8gd2FpdCBmb3IgY2xvY2sgdGljayB0aW1lZCBvdXQNCg0KSeKAmXZlIG5vdCB5ZXQgZHVn
IGludG8gd2h5IHRoaXMgaGFwcGVucywgYnV0IGl04oCZcyBhIGJsb2NrZXIgdG8gbWVyZ2luZy4N
Cg0KUm9zcw==

