Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490A1C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 17:33:12 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.44])
 by mx.groups.io with SMTP id smtpd.web11.49659.1737567184778885549
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 09:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LFNHo4er;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LFNHo4er;
 spf=pass (domain: arm.com, ip: 52.101.65.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bhWsch0HA+URHIE9W6VhDuE4K7rJghzCZhwyIUpd/RExN+ER9lu4jJp3V9gyJiUS8WJ1ZknpNMWKxX/puZREieRMNuhH3dNjIa17X2eydBkAVeNxJv8qKvg82CTNZm2ho73G79/TxIyDzE9ABnj9rKY1tLfCVVEz3pyz4L/yK83pMJE4BNhWySfbdFyOedBlhSNHubxbezOMyoWLxKMdU0R3x0mYovwrFbJ3imAH0Td0nbJL6/rC8X3ZcyfyIGB3qkH4iw2M0VRyz0Omafo105Ps/iWC4LLLSXttAvILItlTXRgklxUDCQd3DzFuf4afGWi27Aw+v1UfHCGUPgjvCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAbUVNSPzikAITFA8wZkSZQQTEyVHVREA4gCjcGV7MM=;
 b=iZmbgS0kmVvRGLXqa9i+MxRbB960440H9h4L6LB6pZGI1rl61lnrCWT8yFHSKtuadK6irxkErHvHdOhOeso4GEiADvshGzG1iukwk8mEvdYHpRNdx1WhBgq6xXlnI6B8YtIpvjAcm0nIAsrUMlDRHbogzaA/eIRryuhAXFyl6g6t+vCM/u2JtF0ozUa/EOgPIFutWZT3W+/mrhJyAOYxhqnuExEj8iGmk9UOifjrr0p4W+4gdH8wW4gJU7kh5okCjs5QKAwRv9xPvZuZejDJMjaZLpctDLUavepHYnaownZcHbazbA5GvJDcO61l0yzKEfv4UXxl8Tjp9GOkQk8DYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAbUVNSPzikAITFA8wZkSZQQTEyVHVREA4gCjcGV7MM=;
 b=LFNHo4ermjZi6RLjx0tPIR5zMKTofabYGXCaCTSZzzUlKfHOaJuca+uYgUIC0Lr5KAB4o1IE68bRPrFqivT2N/ichPssaMM8CMlkF9xGnR75HXI8RkkGw/JIPHAw7T2N83imdQL/1lZaAKiTetm03q8+WKpZ9mS8nqUzxmZ9AD0=
Received: from DB9PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:10:1d9::7)
 by DB9PR08MB6346.eurprd08.prod.outlook.com (2603:10a6:10:25b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 17:33:00 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::e9) by DB9PR02CA0002.outlook.office365.com
 (2603:10a6:10:1d9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 17:33:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8 via
 Frontend Transport; Wed, 22 Jan 2025 17:33:00 +0000
Received: ("Tessian outbound ad07758b3bb4:v543"); Wed, 22 Jan 2025 17:33:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ffbe000b91b577c
X-TessianGatewayMetadata: 2Mph2Zs+np37Pje8uXLKIwAd+qvgxzqsedETKDNP3BSiFgVlkQmVftpx/ztg4FQG6E0qGW9KapGNrGwhG2BKNi4Y5JZ6O+CGdmUlpiAeFh7e0BYcvxx/843c6CQVTIkUuS1t0h+YwTslrd9mQiL0V7cmZzfDGYSFXu//kgei3JE=
X-CR-MTA-TID: 64aa7808
Received: from L38576fd4c877.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 789B0AEE-8CB6-4134-BE27-C437CADA61D4.1;
	Wed, 22 Jan 2025 17:32:54 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L38576fd4c877.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 22 Jan 2025 17:32:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cyjb+BRRIn64BtEhxrnSXYeE9Jayg6x9quPYh4mlyb3gsSUhWRZhvmtzFFuteYQETv1o4LdLvhEVqHMKvHh7bUlnVUOn5WuDsay8y3fiNgi7DxBhfxfgW1jOY6JWrkrq9cBGQRv7m51MNICS/QAD6I6le/VBBY9UDSRmSf+ahHY2GVrYYGIDv3jyT65oPYrxeBlGLH/66M4buqoHH/rQHoKPhkmtGvZkw1QBH6tye+xx0UC9bj/bGmAUhK2Pq54xga923q27JZLIP+OqSvRFzSHopVHEWZjGHmphkDKrszvn6jiXTRiEq+nNOspNUkRwgXtIJIG4ya0fe+EZQAEWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAbUVNSPzikAITFA8wZkSZQQTEyVHVREA4gCjcGV7MM=;
 b=dBjHhmK1WNd3K3nhJc8AuksCqnFK+MoUDkV8Dr9xlbiXV5aqwUvA/Wp08UAuQ2J8ZJeB1UNtQjMJa4256YA9Vp/W6NQbXId2JkN0fcPggdmg+dQuaidAeN9f5Psr2t275bmwcDqLE+dZ4hosOFK8N7TGX8DcMoX9Wu/XsjDU/wlwwi0UAZ1JiR1u2fzHkJ51HC+PmOxfA8/AH7Ji2va01i9QsN48PwZH7vuL4BrICkSYf82Nwg7EmNJ8vqNit93bLvZBceFfaKN8ZTyv4BMD/RPEqijPCzrzdLMEkU9rUKJetGyGnELi+E6XtRFK4EePHxmdpDZk+wbhaIc3Et7TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAbUVNSPzikAITFA8wZkSZQQTEyVHVREA4gCjcGV7MM=;
 b=LFNHo4ermjZi6RLjx0tPIR5zMKTofabYGXCaCTSZzzUlKfHOaJuca+uYgUIC0Lr5KAB4o1IE68bRPrFqivT2N/ichPssaMM8CMlkF9xGnR75HXI8RkkGw/JIPHAw7T2N83imdQL/1lZaAKiTetm03q8+WKpZ9mS8nqUzxmZ9AD0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB11085.eurprd08.prod.outlook.com (2603:10a6:102:471::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 17:32:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 17:32:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Removal of external-arm-toolchain?
Thread-Topic: Removal of external-arm-toolchain?
Thread-Index: AQHbbPOq2o39Uzdzpk6APR7D9oz+aQ==
Date: Wed, 22 Jan 2025 17:32:52 +0000
Message-ID: <31F864D4-FAF7-4B00-BFAE-B00CB237EBE0@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB11085:EE_|DU6PEPF0000A7E2:EE_|DB9PR08MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: c182d388-0fea-4137-27c0-08dd3b0ad144
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?S3pXRjRNUzZjZGtJTnF4STMyU2hxckRURnROWjdHWGlNMEFKendLUUFsT3hw?=
 =?utf-8?B?bjVxNjJBQ25ldHQwUmszdGpQZWZsbEFYQngvdyt0bDBDWk1rVm9OM2ZvKzli?=
 =?utf-8?B?eEg3bFE5dW1wL0NSbmM3VWoxRU4zNDMxUE8xQVpCbVVhUVFPdUUwWU5XQlFT?=
 =?utf-8?B?cENUU2ozbHh0bmVqVUVCTjhDa2RVbGt1SGdtZkxkN0kvSlFRdUFkWmRtcHZU?=
 =?utf-8?B?UHdGSXZxRkhSVTVWWlE1TEV5anhYbWR0WXVpamZSRDNYT0YweHBFRlRhTFVX?=
 =?utf-8?B?ZXFGcEVNam91Wnk2TnR4NkhYRmFjeDNzRk0xSk1SYWZPMkQ0aElzbjR6Q0t0?=
 =?utf-8?B?RXNoOUZyNFlXSnhYY3JLTnZSaWRHMXNvZURYVXhJYXJ0aVdTdzcwNVVZdjJa?=
 =?utf-8?B?RHM4bGN5OFVJTHFNcmc5TmJsR2NZd0hHb2lad0RlbVVWdVZKSStlM2hHNXQ2?=
 =?utf-8?B?eXhxY2pGcklIMFBwbTJGaUdKb3g0M2NrVGxyMEQwa1hqUmZSNENmN2hsNmIr?=
 =?utf-8?B?bjdvQzU5OTdLRk0yaVQ3Q1F5YXZlTEdnYkZRWVplTzhvSEs4VW9VSENZWWhl?=
 =?utf-8?B?SkJUZCtJME5pWkFNby8zOHYzRlYvYWdEdC9lb0tDVm1iNExOOUx4ek5nZXVS?=
 =?utf-8?B?ZjNmZVZIZDFhNWNhZ1BraEsrOURZZ2tUM1pDM2gxb2ppa2lKQzhwVnhRdGRX?=
 =?utf-8?B?MkFIS0NQOEdKU3RPSlVJR1k1c0JrQlhoanM4elV2RjZrWmVDM3FrVHFDYmp1?=
 =?utf-8?B?NjNGZFczMUpLUEtER1dHNHFNVFRTYXMydlpnNTFFemRsdGQ5ek9VdjZYYTV0?=
 =?utf-8?B?V0JkOURTVTJiaXVWVzd1NEU3dTBhaGdsdjBMTWQ2bXkxVUxCZTF1c1VxQ1dj?=
 =?utf-8?B?eW56dTN0Q2diYko4aXdqb0lCL0NoWHdlSjdqU09JaXVqbUU1S3c3ZUg2QWZa?=
 =?utf-8?B?NklJSGtVZktCUTRHRkRZeW94UlZqT1JPbUVISGVHdDdRbmZjQUV5aXVpLzBy?=
 =?utf-8?B?ZzM4NEJPUU1nZk1wUzJQcXM3ckhZZzN0ejlnNXY3aytOQ0N1TkVHTExuMFBB?=
 =?utf-8?B?emZ2cW9QSzNhL0tKVHNjbzNLbjJSRk1BQ0RMcmpsamZkTTRlUDh3N2ZsdHBh?=
 =?utf-8?B?V1M5bnQybFQ4WUVjZ0VSYzhacmxNTjJBZm12dzEwNXRUV1VyT3l5YWlQcHVY?=
 =?utf-8?B?TnNQeWZ6WW1iSWJ0NFFhNXFiQU8yVmpuQlhvN3dCbnRuTWhkYUVucmxZTGF0?=
 =?utf-8?B?bEZZeDROQmlQNnFIRXpwMHkzQzAyajdVREQxVTRmcFdVVUNOSU55UUFVdzlJ?=
 =?utf-8?B?dCtUQUwraFBPOGdzYXlLZlhRRVBEeUE2MENGbkp1bGNwWkNGQjdIU2NsbmQ5?=
 =?utf-8?B?amQrVGhwY0tlYTJSbks0U0lCVkowRmJvZmtsUTk4NjFFMTZ6b0RGd3dYMW9z?=
 =?utf-8?B?VlF3K1JMUkI5VHAvOXZGZ3ZzZjltWkFyaFA4UWtQYjVoZkRma2JpQldhcTF5?=
 =?utf-8?B?Y0xZd3RlOCthU1NoMjZsbkRuS1FML3N1Rzhyb2s1dkNiRjdTL09PYjZCOElq?=
 =?utf-8?B?KytOemVEUFVtMnEvYkhYcmp1aHRWaTc3ZTU3dmVFa3E5SVYxR0J1MDIzRmF5?=
 =?utf-8?B?TWl4eHJSSjIxVGRwcTN4ZXJkYzUzZWMzVzBEcmlobVAzYjdsYlRPSFNuS0Zm?=
 =?utf-8?B?ZERYREFkcXpiMm1HYVFRM2g5SCt5Y0h0c01JUG1JWXFsdFRnOUxJZGJ2Q0tE?=
 =?utf-8?B?d1NjUFV1Zm5RWjRiUHZRL2R0OUZseVRlL0plQVBaZno2VUZhYlVNQ2xLVmpX?=
 =?utf-8?B?MW5LTjYxSFdxYnd2VXhLaDYwVk90d0YveXEwMlBUTkV6d2wxN3JiT0NxL1k5?=
 =?utf-8?B?K0RxTXlLanZUMFNCMFhKT2Q1SFlidnRaNnRzNjExYzBlbVVqdm1vamhrN1hl?=
 =?utf-8?Q?wDnbw+fBIQhLtLNvOa2d7yCMMXA/7PTC?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5AB901029A49340BC993D4FC2783DAB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11085
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b8f5d443-c553-4dd3-28d5-08dd3b0accd5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|35042699022|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eFFuTjh5ZG1iNmpaWU5OWXg5MkZFNUFNZ0JGQkZ4TlZPYTJTNndKZXV6ZG9H?=
 =?utf-8?B?b2tKSkFXdUpJYWdNaFpBY1krY3lDS1l4QXNoWGd4QkRsL2lvVmlMTnM2QmpU?=
 =?utf-8?B?eFJzU1BzYmJCR1daZVBpd2pOSWM0SGZsVUZ5QWV4ek15dXJOZ1JIZk9LWUly?=
 =?utf-8?B?OFpUcStZRkhpclV3ckltU083YTV0U0RDRGVCVS9zNEVBbitxNitBTHBoa3hx?=
 =?utf-8?B?VlV2RGlMam1pWnpGR2FnS0pnTk1wRzJmS0I3Uyt2UWtTcmJVT2JLMmtuU0tk?=
 =?utf-8?B?b3NTNURrQ0lkSEVOakt0cjBmU2xiNGZvZXUwMGNGT05pZ21uYjhUMUxRMURO?=
 =?utf-8?B?U0tDK2M5RTJDT1ovQUR6WUJ0a0F2SEJhdjlYUWcvdHR2L0dzWFRzYytTaTNP?=
 =?utf-8?B?OGJWV01BcTVPMTNyQlZUNzdRWktsYnJTdEpsK0JkNm12TC9VNDBzTUdJRXFo?=
 =?utf-8?B?ZXlTeC9KOW93dWttV3hQVEIxTmthK0ZjY2N0ZENGdlNuMzJpbUJyYWkxYjBs?=
 =?utf-8?B?RGk2bUJzRFl0NkRZUlY1ZHFEVmluSTU0aHVQNG1mRnl6QzBxdndaNW9vVzU4?=
 =?utf-8?B?OEszTjRTVlQvZW85S0ErVlNqNGw2TW1JQXBxeXpDV3NkR3c1cW1ROXpzQytM?=
 =?utf-8?B?K29NTjBZTGZwVUFBdTd2TnZmZkFtVTRESnpacGhDWFh2amtqRnpRZXZPMnVU?=
 =?utf-8?B?R0EwNWlsT2JLU09nMVJzQlZhdlNiOVR3MEdBNnBaSTZ6c01BVDY0bjgwNTIy?=
 =?utf-8?B?Zyt4SFh2cFJTUXBlTzI4ZTVXREhGc2kxK0hneUIvK0VwYXlQR29vZnViRUZs?=
 =?utf-8?B?YUhXZmFpUXcrOXlscXU5czNyMVZBYlBXOHZpaVJVVmVpcWpkalBkWm05K1Nj?=
 =?utf-8?B?UWkrU3hMRnBHZktsSW5XWFNNVTAyRWhpVGU3WU9RNXVwUUZXcXA3NDRFeVZL?=
 =?utf-8?B?ajM0eHBGSGx0SjBrbzBOZjZzZ2N4bEFwQ1grZTRtZmxvZHEwY0NndGRPemdv?=
 =?utf-8?B?eFJ0dTd5QnBtTjVabTE2Qmt3YVBwQUN0SjEvQXhLWXR5a1A3VVUvL1o2d2Fo?=
 =?utf-8?B?VHlsdUhKQ2cyRlR6MTV1MGxyaUQveThNdjFpZnBuYkdmZmZWeEsyT0Yrd0NJ?=
 =?utf-8?B?Q1NWSCsva1dYZHlEYmFheWRGcDdVc2ljaGtRQmpUWE5TdFVIUDBZRnkzckxn?=
 =?utf-8?B?SUNlL3ppb0ZTUDZBb21ZMmhQS3gya0xKQSt6QkFMbURnS2U4MmhqYTlNYzFH?=
 =?utf-8?B?VDRXWXBualVlTlVWKzQzcnJEeGJiaS9Mc0xWN1pWMU42Qm83Rm1ubU9VRWtM?=
 =?utf-8?B?Y2dJd0YzSjdGK0drM2VHME0wZFE3NGpMbkxCNjluUDFZUktkY2JPZWFkRDlP?=
 =?utf-8?B?MUo4QU81WjZNYlJhSUFQSnEzZ0hsRWFRSEZBMEhXMnVBV0hkQWtnejNRQlo4?=
 =?utf-8?B?KzF6Y0tnMDdpTXl1K3l4dGRpb1JjUHllSW80TmFtYkh0UHpOcnJjVEdWUHYy?=
 =?utf-8?B?OWE5M3BUMTlsdWdUK29QaXoyOTdVeVlPZU5wdHNsRHNrWkJLbUxJd3M5UlFQ?=
 =?utf-8?B?RkFvb2wzK1cwcGFmQ0VKdVZaSVJJY1ZUTnNCSHAraEJpREhheWNDSEFUVWpS?=
 =?utf-8?B?MmRralJGQXlVeGVuZGduRzlzQ3dqekVpaEhLM1c5SVMyYlU5NUJqd1RTY1dv?=
 =?utf-8?B?SWo1aTI3NXdIUWNhUjVwVlBaK01QQVBIb1VhOFJVR1dobnRnTTBobXdTVCt6?=
 =?utf-8?B?RlZ0RUwxL2Fpa0k5VlRYUjhEUHFYeUNoclpQZHNhK24wbXNaUDNscTYwVHRJ?=
 =?utf-8?B?b013eDZKNVI0M29GaVpHSlAvR1FSY1d0ZC9xb2l5SENKKzJ3ZkdycWF6UEVJ?=
 =?utf-8?B?SnVUR0NjODd3MXBkeFJwMmdqTk9aVWEvcGxwV2E4cXNKWCtHcHo5ckRJVkNq?=
 =?utf-8?B?YzZFZUpXU2dNT1RRZmdxTzhWZlpzRGI0ek91OG9iQVNWNWgwNWpBSVZ4Wmlr?=
 =?utf-8?B?SUpQaTliS2F3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(35042699022)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 17:33:00.2626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c182d388-0fea-4137-27c0-08dd3b0ad144
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6346
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jan 2025 17:33:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6342

SGksDQoNCkl04oCZcyB0aGF0IHRpbWUgb2YgdGhlIHllYXIgd2hlcmUgSSBncnVtYmxlIGFib3V0
IGV4dGVybmFsLWFybS10b29sY2hhaW4uICBUaGlzIGlzIHRoZSByZWNpcGUgdGhhdCBsZXRzIHlv
dSB1bnBhY2sgdGhlIEFybSBiaW5hcnkgR0NDIHJlbGVhc2VzLCBhbmQgdGVsbCB5b2N0byB0byB1
c2UgdGhhdCBkaXJlY3RvcnkgYXMgdGhlIGNyb3NzIGNvbXBpbGVyLg0KDQpUaGlzIHRpbWU6DQoN
CjEpIHN5c3RlbWQgZmFpbHMgdG8gY29tcGlsZSBhcyB0aGUga2VybmVsIGhlYWRlcnMgaXQgaGFz
IGRvbuKAmXQgaW5jbHVkZSBTSU9DR1NUQU1QX09MRCAoYWRkZWQgaW4gbGludXggNS4yKQ0KDQoy
KSBUaGVyZSBpcyBubyByZWFsIHN1cHBvcnQgZm9yIGxvY2FsZXMuIEl0IHNoaXBzIGxvY2FsZSBm
aWxlcyBidXQgdGhleeKAmXJlIGdlbmVyYXRlZCBieSBhIHNlcGFyYXRlIHJlY2lwZSBpbiBjb3Jl
IGFuZCB0aG9zZSBwYWNrYWdlcyBkb27igJl0IGdldCBnZW5lcmF0ZWQgYnkgZS1hLXQuICBUaGlz
IG1lYW5zIG1hbnkgb2Ygb2UtY29yZeKAmXMgcHRlc3QgcmVjaXBlcyBmYWlsIGJlY2F1c2Ugb2Yg
dW5leHBlY3RlZCBkZXBlbmRlbmNpZXMgb24gZWcgbG9jYWxlLWJhc2UtZW4tZ2IuDQoNCjMpIFRo
ZSB2aXJ0dWFsIG5hbWVzcGFjZSBjaGFuZ2VzIHRoYXQgbGFuZGVkIHllc3RlcmRheSBpbiBjb3Jl
IG1lYW50IGl0IG5lZWRzIHVwZGF0aW5nLg0KDQpJ4oCZdmUgc3RhcnRlZCB3b3JrIG9uICgzKSBi
dXQgZGlzY292ZXJlZCAoMSkgYW5kICgyKSB3aGlsc3QgdHJ5aW5nIHRvIGRvIGEgdGVzdCBidWls
ZC4NCg0KU28gSeKAmW0gYWdhaW4gdGhpbmtpbmcgd2Ugc2hvdWxkIHJlbW92ZSBleHRlcm5hbC1h
cm0tdG9vbGNoYWluIGZyb20gbWV0YS1hcm0uIE15IGFyZ3VtZW50IGZvciByZW1vdmluZyBpdDoN
Cg0KMSkgV2hpbHN0IGl04oCZcyBhIGJpbmFyeSByZWxlYXNlIG9mIEdDQyBmcm9tIEFybSwgaXTi
gJlzIGFjdHVhbGx5IGFsbW9zdCBpZGVudGljYWwgdG8gdXBzdHJlYW0uIFlvY3RvIGNhbiBhbHJl
YWR5IGJ1aWxkIGEgbmV3ZXIgdmVyc2lvbiBvZiB1cHN0cmVhbSwgd2hpY2ggY2FuIGJlIHBhdGNo
ZWQgcmFwaWRseSB0byBmaXggYnVncy4NCg0KMikgU29tZSBwaWVjZXMgb2YgdGhlIGJpbmFyeSBy
ZWxlYXNlIGNhbiBiZSB2ZXJ5IG9sZDogdGhlIGtlcm5lbCBoZWFkZXJzIGluIHRoZSAxMy4yIGJ1
aWxkIHdlcmUgZnJvbSBsaW51eCA0LjE5Lg0KDQozKSBUaGUgYmluYXJ5IHJlbGVhc2UgaGFzIGxp
bWl0ZWQgcGxhdGZvcm1zOiB5b3UgY2FuIG9ubHkgdGFyZ2V0IDMyLWJpdCBhcm0gb24geDg2LTY0
IG9yIGFhcmNoNjQgaG9zdHMsIGFuZCA2NC1iaXQgYXJtIG9uIHg4Ni02NCBob3N0cy4NCg0KNCkg
VHJ5aW5nIHRvIGZvcmNlIGEgcm91bmQgcGVnIChiaW5hcnkgdG9vbGNoYWluKSBpbnRvIGEgc3F1
YXJlIGhvbGUgKHRoZSBpbXBsaWNpdCBpbnRlcmZhY2UgZXhwb3NlZCBieSB5b2N0b+KAmXMgZ2Nj
IHJlY2lwZXMpIGlzIGdvaW5nIHRvIGJlIGEgY29uc3RhbnQgYmF0dGxlLg0KDQo1KSBHaXZlbiB0
aGUgcHJvYmxlbXMgSSBmb3VuZCBpdCBhcHBlYXJzIG91dCBDSSBpcyB0aGUgbWFpbiB1c2VyIG9m
IGl0LCBhbmQgdGhhdCBDSSBjb3ZlcmFnZSBpcyBleHBsaWNpdGx5IG1pbmltYWwgKGRpc2FibGVz
IHB0ZXN0IGJlY2F1c2Ugd2UgY2Fu4oCZdCBidWlsZCBhIHRhcmdldCBnY2MgZWl0aGVyKS4NCg0K
TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IFRJIHdlcmUgYWN0aXZlIHVzZXJzIG9mIHRoZSBiaW5h
cnkgdG9vbGNoYWluIGZvciBjdXN0b21lcnMgd2hvIGFwcHJlY2lhdGVkIHRoZSBzcGVlZCBpbXBy
b3ZlbWVudCBieSBub3QgaGF2aW5nIHRvIGNvbXBpbGUgYSBjcm9zcyBjb21waWxlciwgYnV0IEkg
ZG9u4oCZdCBiZWxpZXZlIHRoZSBsYXRlc3QgcmVsZWFzZXMgb2YgdGhlaXIgcHJvZHVjdCBzdXBw
b3J0IHRoaXMuICBBbHNvIHRoaXMgaXMgYSBwcmltZSB1c2UgY2FzZSBmb3Igc3N0YXRlLCBpbiBw
YXJ0aWN1bGFyIHRoZSBwdWJsaWMgeW9jdG8gc3RhdGUgc2VydmVyIHdoaWNoIGNhbiBiZSB1c2Vk
IHRvIGZldGNoIGFsbCB0aGUgbmF0aXZlIHRvb2xzLCBub3QganVzdCB0aGUgY29tcGlsZXIuDQoN
ClNvLCB3b3VsZCBhbnlvbmUgc2VyaW91c2x5IG9iamVjdCBpZiBJIHNlbnQgYSBwYXRjaCB0byBy
ZW1vdmUgdGhlIGV4dGVybmFsLWFybS10b29sY2hhaW4gcmVjaXBlPyBUaGlzIHdvdWxkIG9ubHkg
YmUgZm9yIG1hc3Rlciwgd2Ugd291bGRu4oCZdCByZXRyb2FjdGl2ZWx5IHJlbW92ZSBpdCBmcm9t
IHRoZSBzdGFibGUgYnJhbmNoZXMuDQoNCkNoZWVycywNClJvc3M=

