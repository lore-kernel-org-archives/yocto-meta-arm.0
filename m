Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9726DE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:42:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.12527.1733928169593328966
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Dec 2024 06:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H011G2G/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=H011G2G/;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TQK3aXTNMR+u2znjc47Sq7Zz1UcGcwjAbHoT8d5/bwSLcWOI/XR8aejki9jcOAy+Py0yUyZ3UA2IOvvMtl2sImNybxYOrvrxK/ehPHyeZ2Qy3XpIOKJyqzTWReNgu6NyhkDDQlQwxoomN6l1Spe2TKV9jPN2AX+/O6gx1vhUm7ZOMA522qeLNGRX0aAiC9VITRTYp/RVHQ9cIIVpwDG409tYcjZpY975gtC7JxSYwEY79K5ttOVD0NQznkkigtgVYK4teVicXbUjJarxh8Eqi5N7MYyf8OmRfgvYoI9Cbqrjne2R5fuPlRjv6wXfGkoFo/2kBMKdDkNL0Qx2qe00BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdMrHH6Wven3UuUm7IMONxlkH/viGmayacD4s2R9Thw=;
 b=ULfK8K7JUTpa7GLY7j4piuplTcjvlfSBZUUwDd1vlLxlmCQGUqljAuppgbqGk5ikd844BCPJXPekk6Ybuzo4IUlna5q/eqj/3klvHlXcH1+jagZOzClpiPBMNGJi8u/Jp9RjoGf5+AAgK+jfcSgwOFdgZVY7q4s0+0vZV4Vv98hfjUZGccZ6iVAuDYRDvUf5yKDSiPvse37fmr+04VBG5sGP40waD8aYI937uPOnjoXzTr5W0aB7A3VgV9QzdNhlk72r+mHFMNG7gbK1hBiT/TL2wUDRhI+y25Ob7Pcub7tmZEQmm0xQxKCWwgd2rmTT/734+EFXzyoF9PyfLUqk8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdMrHH6Wven3UuUm7IMONxlkH/viGmayacD4s2R9Thw=;
 b=H011G2G/cHQYls5e+JdzBOAsueCKqvYHy7qg2hK0k6pFz1+aIVnQjd3EW5YSogrORLuUf5IJCmQqJgwwNGjbiCWoEJK+7aMUQ0GLDGmRW4li+puXgsFRcxRd+NwQMIoweox2xxeuu6dIC5IxSfYGl0KaFXwlQBSd6KlsFbZbEzA=
Received: from AS4PR10CA0001.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::17)
 by GV1PR08MB8216.eurprd08.prod.outlook.com (2603:10a6:150:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 14:42:43 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::bc) by AS4PR10CA0001.outlook.office365.com
 (2603:10a6:20b:5dc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 14:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 14:42:42 +0000
Received: ("Tessian outbound 6eb473597b98:v524"); Wed, 11 Dec 2024 14:42:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cf570d39fffcffe
X-TessianGatewayMetadata: VaJx3KbiCHvFjs2N7KpsMH+5BEMVAKyo5eJPrpFteWoP2zrVhhqG0bGXTRMZ6Yp+mecTrMQXtdVErD0NY/FUGsBV6HevaS2pxNQ4YcBVk0GrElh0PkfBdap3wusLzQmK1/HVkTWBbTkyON9aYXUr3I9hMt6DLIBD9qimUmKjizk=
X-CR-MTA-TID: 64aa7808
Received: from Lac2e98ea8362.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E718384B-FADD-45DE-B2C7-BE79F2DBED7C.1;
	Wed, 11 Dec 2024 14:42:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lac2e98ea8362.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 11 Dec 2024 14:42:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mR4ZwSdNjher0AMOGaEpUkP1FzRFF7I437EiUVXXWn9Nyq51vxBWFJnKyuLjc3kOM6LRbF04c4RL9v7zRFbV3PBEVMcG0jD17G8wq1HqvIhQJMainFswTHKJweyHzAgJYpfduo3TkUOoF6gi3l3bOGQbwZRQdMF20wVcFqFWQSAm+OGSzTSh/Z88nptITwytOd11/rRX3vNF9izL/aC0Sq4rps3fjKgH1ACouDacr3S+kxJPDnlXuonQJpkSjQQ0hbJuw6OVnTAkNtIjlpOd1JgglU1gGNj0XrJM1LXr42BfwV2ivhywaD5lVR6yCGrObHUiUspTy1fL9ZuRXQepUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdMrHH6Wven3UuUm7IMONxlkH/viGmayacD4s2R9Thw=;
 b=XTlDugRDLMTDYPgXgWxaRl8PGoQtyfOwHob/WSpci80Cxj0eQD0p/6bgsX/BH7r5fjHErgo3l5YlChkwmY+jgd9A/OrcY7t8SJ5e7Uuq8vnKSdr4BtpUXmUfZ1FPhIit95Pbl8LEaHs6uaRXOZgAs9PRU0dy3SNbc7ywDINUKBUlMljxxIYdRkPww91IMdhp6OSfYF841U7EUVTUFwxsPbKRH3CoIWrTVXe6DGekS600ZqsdpeRsTo+xqPYCwj3eqB57vR3bpuEzmkpZTe5Ew9PcBIlW1vgl+NWSHg2dZ24CpmBT/byPXMb1BBbHStEGW2cSTob89ap4k0iJXGDcPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdMrHH6Wven3UuUm7IMONxlkH/viGmayacD4s2R9Thw=;
 b=H011G2G/cHQYls5e+JdzBOAsueCKqvYHy7qg2hK0k6pFz1+aIVnQjd3EW5YSogrORLuUf5IJCmQqJgwwNGjbiCWoEJK+7aMUQ0GLDGmRW4li+puXgsFRcxRd+NwQMIoweox2xxeuu6dIC5IxSfYGl0KaFXwlQBSd6KlsFbZbEzA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB11087.eurprd08.prod.outlook.com (2603:10a6:102:46b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 14:42:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 14:42:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: Gyorgy Szing <Gyorgy.Szing@arm.com>, "tom.hochstein@oss.nxp.com"
	<tom.hochstein@oss.nxp.com>, Tom Hochstein <tom.hochstein@nxp.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Sahil
 Malhotra <sahil.malhotra@nxp.com>
Subject: Re: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and systemd
 service from upstream
Thread-Topic: [meta-arm] [PATCH v3 1/2] optee-client: use udev rule and
 systemd service from upstream
Thread-Index: 
 AQHbIGIeo0698kpj+UajIIrL6gkkY7KUbTgAgAACKoCAAAbgdYAJkYSAgAD7i4CAKuJWgIAXj1KA
Date: Wed, 11 Dec 2024 14:42:25 +0000
Message-ID: <DE072CF0-DFD9-444B-8682-83C083921565@arm.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkId04rSl5ykKCJ@nuoska>
 <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkOI7vA6YDQZewJ@nuoska> <7c3c9ad1-a1e0-474f-8710-9b77d2a2ea17@oss.nxp.com>
 <AS8PR08MB589517BA3B9BD14644DEF4CE91542@AS8PR08MB5895.eurprd08.prod.outlook.com>
 <Z0XhVyhlU8uIU1W8@nuoska>
In-Reply-To: <Z0XhVyhlU8uIU1W8@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB11087:EE_|AM2PEPF0001C70C:EE_|GV1PR08MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2b1b07-5ddd-4576-28aa-08dd19f211bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d2tmd3JKTmlQS3ZCLzZBYTgzWVpLYXJZSDVFbjRoNmM5TlprcnJTVFVTWWRC?=
 =?utf-8?B?R0xqZTRzY1Q3K1ZMdVh0aDZlcFlVcE5wcjhvUE5qMjkvVDlnY2tVc3JxKzkz?=
 =?utf-8?B?bWVFanptYmZXWWU1Ym9ZWEdDU0paMzgyTHpnbVBsTEJ6cHBCWEZVcW1RT3Y1?=
 =?utf-8?B?UllnNzhXUzVqZjBnQ0hIVXdFTjl5aFROVGhiU1lIdDduMzkvZHAvYmJXVEdu?=
 =?utf-8?B?a2xnU1VrNWx4OEM5U0VmQWVXV2t4VGQvYkpkSGNKM1QvTXV0emZScTJKTEdx?=
 =?utf-8?B?RXhKT0dIOHB1SGsvNVVmbnFLUGd3OVlIU3NLV2U1V05MWThNOGVrT0ZEa2Zt?=
 =?utf-8?B?SUhIRGFmNTNWTE5hUzVvV3QwaTZIOXJuV09xc1dVOUtoM0RnL0xtVVlpY1Nt?=
 =?utf-8?B?Z0pYS2EyNW91Y3c5UVZkVDR1RWUyakozbStGRWVhSm1mcDJrL0k5VzkyUVNj?=
 =?utf-8?B?TEdmS3luSkNud1QwRFV5aTMwdmFuQ20vcEsxejJyTmdob1YwaDdyN252NzRp?=
 =?utf-8?B?RVg2eGt0Sk5pdGJvTFZkc1pEcnNIbHNSREVsSlJyait2ZTVrMklWTU1SMHZY?=
 =?utf-8?B?WVcvM25tbHhMWTRFbGpiNmdUWGJBRVBPaUVqWEFleDRDNXRNRzRKQVhYTnlM?=
 =?utf-8?B?THBjN1dhUzNSMzkyOU4wWmVEcytNTHFheE8vTWoxWVBTK0U2dkovVHZDekRr?=
 =?utf-8?B?dDNzb21YUFJYWUN2a0lZSDIxOEFhV1ZJMjRxNVlXNjZ4ZXZzT1pCRHAvOVNR?=
 =?utf-8?B?U2Q3WGNDd2pITkxUVEtMaVhFTjhQV0VTemdiZ3BCNHRaNnp3YnBqTDIyMkhL?=
 =?utf-8?B?Rlc2SzdxbDJReVJTOS91RklYcE5XNTRuU2Z5Tm50bGhWdEhjNk5heERaN1RU?=
 =?utf-8?B?Tk1QNHRGRjBBSEIzM0FHZzJBU3dwTDMyNXk4ZUY2R3l1aEViZmdTNm0zRUpx?=
 =?utf-8?B?dUlMeEkxQ3FEYU9sL0FwTGV4ZGhRUjRMOUlrUVIwc2Nub012OE9ic0VhWUJM?=
 =?utf-8?B?dTJaMGxCRVhlL3A3cVB1VXNYRWk2amNSdjJtRklRWitteGtzQnhEMWhrbDF2?=
 =?utf-8?B?Ukc4UnhCQWVuMW1PcTJON0U2VFBlQmZQZEpIQkl1RzRZOFZ5KzRWSjdrSkta?=
 =?utf-8?B?Y3dsQWtjcDNrZHIvYmRRTzhQd2oyb3RvTGsyTVZMQ0tnWlZETkRVRGNDYTRH?=
 =?utf-8?B?MTNRS2ZHU2laRWZNaFRXTFlxZ2tFWThNUjBseDZlUnZ3MmdaZitpbEdUUHNO?=
 =?utf-8?B?Wit2YUpOS0JxclQ4MHNFRXdoWStnYWFiSmYrejBKbXpIcWVDRzZJSDByOXFp?=
 =?utf-8?B?ajZONmJYRDdKL2NTYVcvTEZ5cGozcWkxYUtOQlVmYnlJb09RMnFKd3FMNVhV?=
 =?utf-8?B?bGM4RnNGTFh6T0FMbmt3UTVQY1hKUFZESTdWNGcrTzJOeXBNVmVHK0NEK2Z2?=
 =?utf-8?B?Vm5DSzlnbmgvMThlVU5xV0FxQUpYQlBhK0MvRHA4eVZYeUJKV0FRa0ZsYnVk?=
 =?utf-8?B?WFgrZXFqYTRKQkRYV3VnTFpQcUVaMWVtRGkra0xxbGxMQ1Z6eFp0d1Y4RjNv?=
 =?utf-8?B?aGdmZElWRnZZLzM0Yk0zWVcxQUluZmZzMnlyUjVOUWdISlNrSmFodm5heVh0?=
 =?utf-8?B?RG5SaG53bWR3TkVsRHd6T0lYemJvQTcwLzVhcjhkM1R6UWlUMW4yYkZrNzAx?=
 =?utf-8?B?M0NsbUo1Z0hldDQ0dmZDTFVQdUtPeFJtY0doUXhxVE9hNnFkRDl6UkxJbnhL?=
 =?utf-8?B?VStTS0dXRm9hOTdadWhId083a3I4dGoyNDZjWlBzYTE5WFZvZGo4MTBieUQ3?=
 =?utf-8?B?ZWE3dW1YYldKNXI3ZXdSenBLa1lPOHFFTlltVUxvbFlnMWxTbXpLWXZKSTRJ?=
 =?utf-8?B?V05RWVAyMmZIQ2lqVnhscEI4WklyOUJKUWg5MU9qQ0tNQmc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3A8FBB0AFCD3D4289F9EB3F8E469F41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11087
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f15a6641-3fd0-4411-5437-08dd19f207a6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NURBRmNEUlN6aDI2Vkw2ajArSE91SnNSK1RyYjV3MVRyQStBOVljYWYwYWpR?=
 =?utf-8?B?TlhURGxacUdFYis5bGJkY2pTcXgxYXVyRU50bThzd1RuV0VrSWcyb25BekFJ?=
 =?utf-8?B?R0xLcFpGdnMrbzVlYWxaczB1S1hVVVREUS9CSy9nWnkxQnN3RmNEYmhjc00w?=
 =?utf-8?B?NE9neUs2M1RWaWdaNUxVQSsvR3JXWUhZR3UvMHZVeDg4dHo4UkxJMmg4U0d4?=
 =?utf-8?B?L2tKQUw4WDE3MU8vaENFOEVGc0dUdmJHT0NrdkpRUHZKbDBOenNBVk5USW1L?=
 =?utf-8?B?aDVSUy8yaTNqdTN0cVg4b1dIY0R3K0poRzBNNXVSd2VHMnNHOVZGaGdCbi91?=
 =?utf-8?B?Rk02bm0vTEE2dmJPT1FHd2RNS0FSY20rcTBxQ2dtRDlYL0xyOC9BSDlqVmJO?=
 =?utf-8?B?aDU3NUIwUWp1VVdxSnZJcUY2OVM3cU5wY0R4TWk2aGpoaEdOU2NFeHFvWW43?=
 =?utf-8?B?bmcvTENBK1hQcWt5c1JmeXhMTnlYRXdqdm5nM3dYaXlDTWxiNHFydHZvMC96?=
 =?utf-8?B?NVpmTFdVL2cyZVlqY1RLRlEvUGhmYWxmMStKNkduNHFQcHJpVy8wK2NKNzFR?=
 =?utf-8?B?TzJZbnNkTGk2bmZqcUM5UHhKSDZKaGc1MmQwS0hEd1JVeHNGQ3FDa1ltOWdx?=
 =?utf-8?B?TS9BY2I3T3JyeEUrRlVIVURZWGR2STc4ekljR2RaOGNuNTM2azlINlpFdDBs?=
 =?utf-8?B?T0FJMUQwZk9WeXBKQzA4MUhVeTg5TUdWQklBaWd0U2NpTjNwVDhlOXJ5bWFU?=
 =?utf-8?B?VlJBUmNaemVJaXNVRk93cUVjVzl6Y0RqVkl5TGFnZ3piVjd1RUZFZzdiUnlW?=
 =?utf-8?B?VXpNMEcxTXlqR2Jma1hiRzBVaGhvcFE5S0hXZm9hRW1paldXMWVuaUR1K25p?=
 =?utf-8?B?eGxhZFkxajM0c2xWMkpFRUVWbTZzNzhad0dVT05FWjdMK0RkTGpMcmRlaCt1?=
 =?utf-8?B?aXEzMTh1enUvdUg2dm9LYkg4ZFVKY0tPbURpZmxwZU15TDQ0M1h5YWZ0ME11?=
 =?utf-8?B?Y2RvTUpXeGFSa3F1Y3BpTStDU2pCcCtNK3REYkdJRzZqb0REY0lZRWNGazNX?=
 =?utf-8?B?MzB2dXVHWmM5WFd5dkRjZ0praGNjbXRtMHdqYkZ2L3VnNGRIY3RTbGNBQ0do?=
 =?utf-8?B?ZkhMdDRsWFI4c1p6bHJCQUhKY3VVVUxBelNOTWhKMGtmU1ZsMmVLVEpmQWtW?=
 =?utf-8?B?d2YvelluUzRSOGkyUCt2emY3SGdtRk1ZV1hmYSs1dXUxTmEyQkV6aXhZVFJr?=
 =?utf-8?B?Rno2dXJXT0dXTkU2NnpPeVU5MlBnOFpwWWRZQnUzd1h6dmdrZU55NHphVi8y?=
 =?utf-8?B?bUNUVkhKZytmMEk1MGhBSWhUU04zTmd2a1Rac0dsOW5CYUF1QlBmUWNYU0ZC?=
 =?utf-8?B?OWFqSmo3aUIzRUtOUlpjQUhHRWV4MjVXWUtYQ2pJT2lRVUM5OWN2UnYxVlkr?=
 =?utf-8?B?YzlRN2VPZEQ0RWx3NzRrd0xCaVRHVEJHaFROZU1jL0phbDZIZVlDcy9lbkJ5?=
 =?utf-8?B?ZEJHV2JrYkx0eVlWNnVRQkhXUWpsTkV4MDIybUxXbWJ6Y0FUVXVvSnZweGJi?=
 =?utf-8?B?VlhOakdzN0NZcWNQY3Y1SGFYdldrb0RFbWIzZDRXOGFyeEdUdFZETkZYOThJ?=
 =?utf-8?B?Q1BjSStraFdCNUZHS1ZOQ2UyWWJiRjd1RlR3andHOUZkZExYWG9QVDB0OHpT?=
 =?utf-8?B?aXpPSmZEVEx6RGEyN2lzMHBsRVlvVDg3RjlVQWdvTm9PdXFFS0FDdHp4RmIr?=
 =?utf-8?B?aFJiTy8vNWRIWncxMVJQTFFRK2diU2VROXJqREd4SU1RVFRORUczK21Wa0Fo?=
 =?utf-8?B?SlVub3RYL1kwWlNXOWp5MWtmNVhXRVl2MlZvbnUrdVVpa0Z3djg1dkZEN0Vs?=
 =?utf-8?B?ZTJqSkJqQW9CTFhsTFBMUmQ5QmEvWGQ2NGcvRXpYYWd4Zlo5a3NBbk1QVUlC?=
 =?utf-8?B?cVlkV3I5YXZmTnNBbmo2anR3ck9qTnJHb2ExK2RQckcvYS8wZXB5QWxsa3VS?=
 =?utf-8?B?Si92dHJSQUF3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 14:42:42.6242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2b1b07-5ddd-4576-28aa-08dd19f211bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8216
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Dec 2024 14:42:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6282

T24gMjYgTm92IDIwMjQsIGF0IDE0OjU1LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
IHdyb3RlOg0KPiBUaGlzIHdvdWxkIG9ubHkgd29yayBpZiBvcHRlZS1jbGllbnQgaGFzICJzeXN0
ZW1kIiBidWlsZCB0aW1lIGRlcGVuZGVuY3kgaW4gREVQRU5EUy4NCj4gSSBkb24ndCB0aGluayB3
ZSBzaG91bGQgYWRkIHRoaXMgZGVwZW5kZW5jeS4gVGhlIHNkX25vdGlmeSgpIHN1cHBvcnQgZm9y
IGV4YW1wbGUNCj4gZGxvcGVuKCkncyBzeXN0ZW1kIGxpYnMgYXQgcnVudGltZSB0byBhdm9pZCBt
YWtpbmcgc3lzdGVtZCBhIGhhcmQgYnVpbGQgdGltZQ0KPiBkZXBlbmRlbmN5LiBJIGRvbid0IHRo
aW5rIHdlIHNob3VsZCBhZGQgdGhpcyBkZXBlbmRlbmN5IGR1ZSB0byBzeXN0ZW1kDQo+IHNlcnZp
Y2UgZmlsZSBpbnN0YWxsIHBhdGhzLg0KDQpJZiB0aGlzIHdhcyBhbGwgbXkgY29kZSwgSeKAmWQg
YmUgZmxleGlibGU6IGFkZCBhIGNtYWtlIG9wdGlvbiBzbyB0aGUgY2FsbGVyIGNhbiBkbyAtRFNZ
U1RFTURfVU5JVF9ESVI94oCmLCBidXQgaWYgdGhhdCBpc27igJl0IHNldCB0aGVuIGFzayBwa2ct
Y29uZmlnIGZvciB0aGUgc3lzdGVtZHN5c3RlbWNvbmZkaXIuDQoNClRoZW4gaW4gb3VyIHJlY2lw
ZXMgYXMgd2Uga25vdyB0aGF0IHBhdGggaXMgZml4ZWQsIHdlIGNhbiBzaW1wbHkgcGFzcyAtRFNZ
U1RFTURfVU5JVF9ESVI9JHtzeXN0ZW1kX3N5c3RlbV91bml0ZGlyfSB3aGVuIGNvbmZpZ3VyaW5n
IGFuZCB3ZSBkb27igJl0IG5lZWQgdG8gYWRkIGEgREVQRU5EUyBvbiBzeXN0ZW1kLiAgIFlvdSBj
YW4gYWx3YXlzIHBhc3MgdGhhdCBvcHRpb24gdG8gY21ha2UsIGFuZCBpbmhlcml0aW5nIHRoZSBz
eXN0ZW1kIGNsYXNzIHdpbGwgcmVzdWx0IGluIHRoZSB1bml0cyBiZWluZyBkZWxldGVkIGlmIHN5
c3RlbWQgaXNu4oCZdCBhY3R1YWxseSBlbmFibGVkIGluIERJU1RST19GRUFUVVJFUy4NCg0KUm9z
cw==

