Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A374D26D7D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 17:54:01 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16067.1767981236638520614
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 09:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W6JRPgdh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W6JRPgdh;
 spf=pass (domain: arm.com, ip: 52.101.66.54, mailfrom: peter.hoyes@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nKG6ks+EI9x8NNW7nJ3G30zbhwe1cClgeZMfb+UNOhIearQH1zMYu1FfsOc21i1a3T3iLesSGBGfQhrAadgAFkMg/AjBjpBcQUKLe8tstQ3LrIn07j0T7SQuwvtjg1BpKSfz4zuvZtWo0RFdUd0LchtsSCCR609AqSYheZeZ5q9xcczZC9jrQLBzkzcSEadkW/YtCUcvMVytV2dKyR7KpAkaNEKMFETJsrNS07fzMyNWlDwDNQO/aHESNIPt7l7imTTZr7ItVX9o4vgk6O5/YBjgFd67ZXKbZf/TCBRen8QtGiRBfMyq/41dpaZoDDKGTOEK+CYD6V3bxi9FkoDrzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GPvzvHR1WvfX5s2KKvQCZd/snIigarX2oJYbHKcWbA=;
 b=UMun4fholRDbcveQcg37fEG9mU97Dk/IEqgcyQ2GOIstlCb695FNpMqSnSb2AVkiWIDj2ye5rQmXpqHl4izq7eBgqqkyPAn8EBwmDgYHhpdk6ihiQD2q27iEMAE2wqXsIZlZjtWoxdfPuFp0I+umEiufwd0B/e4YRcGBI8fDk9GGk2uInFCuSHUz2BF8hznBnA1TDsct04urxcnigizNUDEDBe/tp7CQgAG8BY77BTrd0IHqj3s31jP0G5Rcszls1/9Y9T391k8SB8K5+s8bIHt6LQU6xcCnr17TITWN0cWWCvY2iG4mJNmo7zHXjGt/lyTo2u+UtWivdMYmhvENSQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GPvzvHR1WvfX5s2KKvQCZd/snIigarX2oJYbHKcWbA=;
 b=W6JRPgdhouX137GKFBSiQtO5fXlKrN+kZStnFgQ/ZDEBscL6RSLGOhN1Zw/yLuH/K+PQsM83DCyUlio4LJ+NYrQidcVPAjUBcO4EfvkEjSvxuX9FkPYSUrD+LNwNtqM775hiOhj6c4VHrHtZN7J3j0vgdJd7HxWVkWV8a7JsU34=
Received: from DUZPR01CA0203.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::16) by PA6PR08MB10664.eurprd08.prod.outlook.com
 (2603:10a6:102:3cc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 17:53:52 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::50) by DUZPR01CA0203.outlook.office365.com
 (2603:10a6:10:4b6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 17:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 17:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSgJ1fRJ6Z4VZ2J/v/x+muqACJDWZTfOcl62c2fJ94QnqypgC8VxY0Bo4q14iPxz0Gm0YeoH+6u1HCqsXHSGNtXwIUXZzx0ICSPIP7J8BuWIDQ2fR8V6KCK0DpGPOlF2JC4J+zlo0VTOJjldN+wkykoQA1/k9611rP4e4x6CKVWxVnaQQgaYAtIS8vVUpOOAdjLSIbgLHE/vfppyMPFWFDVJooUTNJP8c00MOgDs97lVRUIRnXID99fw6gW7WzCl5nrdXSLntgl/Aay2SV3LBivFzqC87WG8DTcRg+fwb1Pm7bcq/5d0saEQVgMFwr79HHrsoAXPc3VnkPfKgJ/qWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GPvzvHR1WvfX5s2KKvQCZd/snIigarX2oJYbHKcWbA=;
 b=DefO3Ph3mgDnNSUrx9T3qtBGQiIqNRgfE4CWYccRJIgMeYxz7fqqwGtdn1Wz0HJGvh/IPZKKNnkpM5VibLi89YGQ12y9cY9n+jkeMzzBeJmtN12BayqnAQiCCOIS8c3CNvNAZ2qzkPgIFfN/hyybXPbTNxLGQviAHvHMV2xQgPgqWs1IY5Gk5TUlxSNwY6XGEF2pBsx6J+rTqd6lXUuzXtK1X5593+78eZhDy8d0+shVAKlVztKIEmf6jlB88dOo2mf0AuB1oA7jFc3KoBkQElpV2LCPdEnhgdsr4Be4rlgVOaIx2aQicOUzImcOjE9sZOirJn01buYBvfw2/IB8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GPvzvHR1WvfX5s2KKvQCZd/snIigarX2oJYbHKcWbA=;
 b=W6JRPgdhouX137GKFBSiQtO5fXlKrN+kZStnFgQ/ZDEBscL6RSLGOhN1Zw/yLuH/K+PQsM83DCyUlio4LJ+NYrQidcVPAjUBcO4EfvkEjSvxuX9FkPYSUrD+LNwNtqM775hiOhj6c4VHrHtZN7J3j0vgdJd7HxWVkWV8a7JsU34=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5307.eurprd08.prod.outlook.com (2603:10a6:10:114::8)
 by PA4PR08MB6142.eurprd08.prod.outlook.com (2603:10a6:102:ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 17:52:48 +0000
Received: from DB8PR08MB5307.eurprd08.prod.outlook.com
 ([fe80::75a:31ca:819e:c772]) by DB8PR08MB5307.eurprd08.prod.outlook.com
 ([fe80::75a:31ca:819e:c772%6]) with mapi id 15.20.9499.001; Fri, 9 Jan 2026
 17:52:48 +0000
Message-ID: <c2617697-0407-494e-bb1f-9f586608c808@arm.com>
Date: Fri, 9 Jan 2026 17:52:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in TF-A installed/deployed artifacts
To: Quentin Schulz <quentin.schulz@cherry.de>, meta-arm@lists.yoctoproject.org
Cc: Trevor Woerner <twoerner@gmail.com>
References: <4d7e8527-be0e-48e1-bc96-fbd64ae1ac5f@cherry.de>
Content-Language: en-US
From: Peter Hoyes <peter.hoyes@arm.com>
In-Reply-To: <4d7e8527-be0e-48e1-bc96-fbd64ae1ac5f@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To DB8PR08MB5307.eurprd08.prod.outlook.com
 (2603:10a6:10:114::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	DB8PR08MB5307:EE_|PA4PR08MB6142:EE_|DU6PEPF0000B622:EE_|PA6PR08MB10664:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0a9139-8a2d-4ef1-f512-08de4fa80cdb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MERlOE91dXkzOW1ReHZLaVVXVFhKVUNQVFR2cHBuYmhjdnRsSEdvbElFOWdS?=
 =?utf-8?B?ejlWOTJCcWZqSkVPT3ljM1gwWmUvVEFxamRROWlRMTVtazZzcGg4cTJ4VGxa?=
 =?utf-8?B?NGVVaFFPTWpDVHlDQTdaWWJTKzBkdTJsUldWNTRHc1BtZ3FoWW40aFpOYkxS?=
 =?utf-8?B?QlJBSUxyK1k3UkhZRTUrK3ZMMGFnWUt1ektXSDM4NWFNVi9uVGRZeEJHSkdj?=
 =?utf-8?B?bHY5M2tVSEs1blZNZVhzY3J3WWV0L0NobW80UFcvdnVYOXV4NG50d21SQ3d5?=
 =?utf-8?B?NlpIelNKU1hGUmowWUwzVkNHbGF1S25sblc1N1VidXVGbW5KVCtUcWloUGtu?=
 =?utf-8?B?RUdoeWlqUllSb1ZpQjN0R0E4L1FtR3FzLzluM2R5OWQyN1M2R29TdS9MN3Vj?=
 =?utf-8?B?aUVXM2pZaXB1OFJNa0pQN0hqTm9SWE9HcmhUVmlUZUhSOHcrMXpjYTlBK3JW?=
 =?utf-8?B?MkRnMDJQWStRV1BJU3dlbk9JQ0lkQ25JT2NoQ2pxd3ZJSGk0KzRIWHU4cmht?=
 =?utf-8?B?S0Nmek5GWWRsdk5ZWTBnUXlpYXBiQ2NRa2M1UTFaUWFiaStKVXZ0bEZ5a1NN?=
 =?utf-8?B?RzlWeHd6WHF4UkdybjVzTnVVam9tZ0ZKTlBNZ3RPRFZiOFhBNHFLK1ZMWjFv?=
 =?utf-8?B?Vm5nblhOaGtub0xJRGgzS1ZLcGhpcVhvK2hJajBPclJIbzZZM2Jndk02WWNs?=
 =?utf-8?B?eUJkL1M0OHZlM3o0d3h3bHZxOGQ5eG1nK3pjN2NHTUFMYXJSYitWVjd1d3ZN?=
 =?utf-8?B?L2loZkhQMVRHeGt6ZFBwUHpsU0xrdmlsaHpqcUNQOHo1VFkxb3FEYkpieURv?=
 =?utf-8?B?UGpEK1lxNk5WdXpUclJCaE9sTVdXN3BmY0Qwb0NxOENMSGFUb25XQlRzL1FL?=
 =?utf-8?B?OWZkcGhRRy9Ga0crWXJoSFVZRC8vTlBTMVpnZUp3dkUvZ1cydGw2WGtJM0Ur?=
 =?utf-8?B?bGZSTVA4czNrTDc1L2pweE1pcUhPN0tPdHhXK0RBdWZsMEVqdlNXRHZDREJs?=
 =?utf-8?B?NDAweHc4VTFmaEtUQloyUkREdUxIV3NSSDAxTkxTWTF4N0xZRG1wazExblQz?=
 =?utf-8?B?ckdKK1hJT0hQLytWcDk0dTFkTzBnM2VvOHowRXlib0pReHQ5d3NYUWFBUFB0?=
 =?utf-8?B?U1hQY1ZBRkVzU0dQNzZaa0pzU3AzTnJUNC8yZ3czeEhVU0MvRUk1U3FFZlBl?=
 =?utf-8?B?YnJreVI1WDYwVjRyUWhsZTR0amRheGNIbUEzRUw5eUtrSUFVcldaUXI5NDdo?=
 =?utf-8?B?VUdHUTUzRjV0a3NTNUJDVzZpVk92bmx4cC8zK0REbHdoajdYdVJNMHoxanp0?=
 =?utf-8?B?SlF3OHBvYnBKWURnTDlLWEs0czU1bSsxVnhaSWNIamdLUm52Ui9oUjBLaDBM?=
 =?utf-8?B?d3lJUndrUFdwUVEwRndzTnhMdm1IWGsrdHYyNnJMU2RzYTlSMGhISkhSNVBj?=
 =?utf-8?B?RHZVc1krenZrenVoaG8ySmZ5UjNWWGladlRRV2lnZldFanFlVnNHUzFsNkh6?=
 =?utf-8?B?bGI4SUNROGJHRDNBc3pmUE5kOXBpZmM1bW5xdGd0LzlPL08wQ0ZPMGV5OVZ1?=
 =?utf-8?B?aWExY2xoRkJsNjV3MjhERzdBOXNaYjhGQ0NqTTVvakxyY2l2WXRzYU1hNW1S?=
 =?utf-8?B?Qk9lMnFEeXhhdGRzaU01QnRMdTNwMW9CaEFPcFNRWFd6SHRJdXpQSGJLbmdz?=
 =?utf-8?B?TllqbzZmbGMvcncxVW5Dc2NQZ3pKVU9zYS9vNEVJM2FKb3FoSU92T2t1WG9T?=
 =?utf-8?B?MWFrSU4wYmNKR0M4ODZGQ2FZRUVXQTJhY2Y0T1dFNGQ2dmp1MFlEbDExMVl5?=
 =?utf-8?B?ZzlLRHlaT0hOT1ZrWE5RTEtiM0MxMGJxSS9wQUd0RXY5MUtlS1dONm9iLzBP?=
 =?utf-8?B?YkxNTW05YWViUi9aS0NtWW9yQTlQdzd3MU1QVEZHbWEyem5BQnAzdjJmUUpO?=
 =?utf-8?B?OXdSV2Njc3NQS2hyNUg3NEpxaXpjRndDMVB1YlNnRzU5NGsyL3JPeGRWWC9S?=
 =?utf-8?B?Zm1jU2k0NTdnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5307.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ad1ff892-cd4c-4415-5947-08de4fa7e6d7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|35042699022|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SHBEN211NnNSYkRmUHdOK1JzSkNEWmpwelFZazRPVDlQR3J1TXlBMCs2UlMr?=
 =?utf-8?B?SnFMWWU5a3hPZm5CTEdCUlV0UjliMVArK1RpZXozcjBNVDNwV1RhN1JKM01s?=
 =?utf-8?B?dDY0MDV0VDVvQ3J5OHNXV1dUNHBGeEpTRzR4VWRSVXRxbU55My9wYWtHVDgw?=
 =?utf-8?B?cHJJdkhHQmVVRUdvcjN5VnlzNVR1Zk9oeG9DN2UyL2pWVWZtVGZ0YkNLWUlF?=
 =?utf-8?B?V08yS292aG9XaDZuSElZaHlHZW10V2crS3FSNitwanRoZ0lVUzNSVkpKTVFW?=
 =?utf-8?B?WWF0cWxPZTlBRWcycHFDb0xQbCtIZUpaWEpJVHR6eS8xQmlpRkpjdkkxYWw2?=
 =?utf-8?B?TkdSMVZmL0ROK3BXOTZLV2o2S3k1WUhyN1V3ZWVXYklBbHZpdkNQbG12d2FF?=
 =?utf-8?B?bWVZMkI3ejJ3dzh5V2s4N2orSWNYcWg4ZklRNFVJSzZib3QveFlTQUN5S2p3?=
 =?utf-8?B?TUYvT2JVSkpCSnU1blh2c3FCSXFOUFVSL29MOVBEYVNKdWx1Q0tqdW8wenNw?=
 =?utf-8?B?YXdUaUE1S2MvQ2xBUFFxbDRwYjJyUTBnNDU4NVEvdXdsaXhidktqVFUyd1VZ?=
 =?utf-8?B?amw4SVlGb2xJc3ZyU3IzZG1pZXZmK0c1cmtRMUd6K2ROWmpVL2xRRG1TMDln?=
 =?utf-8?B?MFRhTEczcCttYXp6Z1ZpUXZLYmVRUG9yV3VqbExUd2NvYng5U3Vhc3c0U2hV?=
 =?utf-8?B?bEo2ckpZNHNLbm1rWGs2VnhrQVVMdjErR25KdVRpcGRTKzhLMjdyYkxtMjQ0?=
 =?utf-8?B?bFhyT1kyeDd3ZUhGS09oQXVuSWxyalk5ZlVROVBhem9ObVRCK0haQ2t0aEdP?=
 =?utf-8?B?dUxla0ZCTU9remsxY2trNlNqUFUxZkRocDhRYzByS005dEtPR3o4NTdJK1pN?=
 =?utf-8?B?MDhveEgrdGY3Qll6NDZERXdvc21lV1VhTFdjVGdrS0x5bElGL2c1eU1EL0Vi?=
 =?utf-8?B?ejJrQk93MjM0eU1ySDhyRHJqeVRsUzVzZ2ZaN0cycDh1RWpCditZbDFjMGZ5?=
 =?utf-8?B?R1VGTnNUcTdFNHU1UHFkT256aVY0eDBIemdOWVpCblY0Uk9VZlZ6WXdoa25y?=
 =?utf-8?B?Zmpzam94R1BpM01kOWp3WWEyT2RhRjhxY1pyd2xvTSt2S29FemM4NzVQMlVV?=
 =?utf-8?B?S2k5SWhxVzRmeWx5dXBSZEFhK3o5cjNhT3U2dnVaS2xMTEVBZzg1c2U1b3JN?=
 =?utf-8?B?Y2lwdUtNeEZCWHVnKzNTdlBWaTArT1pLZmZlYkwrVmtCK2JXM0hEeW1QL29H?=
 =?utf-8?B?OUdYRmd2Y3ZBbWVBQ1FWbnJYbFBIdmZQR0lzbUorRTNxN2NiTHNmTEp3Smtv?=
 =?utf-8?B?d2NNamJQRCtFeWplVFRSTEdLOWM2RS9QVHh4S1pQTXd0VVZ4Z3FVbkZnazQz?=
 =?utf-8?B?UjdYVUh1QjlTSlFBdjFrS3g4aGo2U05zMTZBaVp1ekRnK1lkRTB6YzRhdWhX?=
 =?utf-8?B?QTdOVk9MbFEreFJvbEJqTTQ0TlUxZGY5S280NjN6TlRUV3NuU3FrUzdvdHZy?=
 =?utf-8?B?MGIwa0RubURLR0xUNzMvQ3hCb3krTm9YK0hoVVI1ZXl1YlNjVFhUcEp5cXkz?=
 =?utf-8?B?M1ZIMm40SkpJbEJyL3M5aEZoRjRPbXp2cWlLNjVNSEFIbmlPRFBRcjZPVGJO?=
 =?utf-8?B?TjBkei9wb0xranlJN09BR0R1c2MycVBTa1RxTXprdUZSbWVaR3J2Wm9Ba3Rq?=
 =?utf-8?B?Z2hTbXNia0RXa1YzcStPU0FDdlZ6ZXl2RWlVVzVjN3pmRjJjT0YrY2lKUnFU?=
 =?utf-8?B?bld2bkRkZC9JNXVMaWtXbHY0SWd4VklsVHAxVGl0STB2SzllbVdWVnBPYUFI?=
 =?utf-8?B?NnJXazFLUkpVNHRIL2paVWQxajlNZXFYWFBFZER3bE9ablNuTTNaKytaVGVS?=
 =?utf-8?B?cTVIOWI1ZHhsb2pmaGlBSEFUbUVmN3hQdVQycGkrb2hkNVdDZzF6RWx3MUhV?=
 =?utf-8?B?UzE5aHRJNmNMbW5QKzQ3aURTTjk4WlVvY2tvcENDb0pMY1lYbzdFZm9VM0pp?=
 =?utf-8?B?VVJVUVRkbWxFdlZZZklweSs0UUExV3VtLy9nRHhhWG5sSVFLTkxFNHVUaWk4?=
 =?utf-8?B?ZE4yR0luUWdKZkk1WXp3cFMzL1VRakJLMHpPSGNhZGhPTTNjU3BuanBFOE9L?=
 =?utf-8?Q?2mWY=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:53:52.1050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0a9139-8a2d-4ef1-f512-08de4fa80cdb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10664
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Jan 2026 17:54:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6828

Hi Quentin,

On 1/9/26 15:27, Quentin Schulz wrote:
> Hi,
>
> I believe there's been a regression since commit 7bce36a2c64b 
> ("arm/trusted-firmware-a: Use firmware.bbclass") where the installed 
> name isn't bl31-<platform>.elf anymore, but simply bl31.elf.
>
> This commit removed -${TFA_PLATFORM} from the installed firmware 
> filename (and the symlink). The commit log seems to hint that this was 
> intended "Drop the redundant ${TFA_PLATFORM} suffixes."... which isn't?
>
> Changing TFA_INSTALL_SUFFIX to the value of TFA_PLATFORM (it currently 
> is the empty string) would help with that but then you either have 
> bl31.elf or bl31-rk3399.elf (for example). I don't mind about that, 
> but still odd to remove a symlink.

The changes are intentional and mainly motivated by the fact that we now 
have TF-M, TF-A and sometimes SCP-firmware all putting files in 
DEPLOY_DIR_IMAGE with similar filenames (bl1.bin, bl2.bin etc) and it 
was getting quite confusing for people to know which binaries originate 
from which project. So I felt that some sort of additional namespacing 
was needed.

The ${TFA_PLATFORM} redundancy comment relates to the whole filename - 
tmp/deploy/images/rk3568/trusted-firmware-a/bl31.bin is already 
guaranteed not to clash with 
tmp/deploy/images/rk3566/trusted-firmware-a/bl31.bin if you are sharing 
TMPDIRs.

> meta-rockchip has support for TF-A binary blobs from Rockchip, which 
> we do name bl31-rk3399.elf and since this filename needs to be 
> consistent between upstream tf-a and blob tf-a (and we cannot modify 
> U-Boot's BL31 variable from TF-A's recipe due to variable scope), this 
> broke builds of meta-rockchip and forced the following (yet 
> incomplete) band-aid patch 
> https://git.yoctoproject.org/meta-rockchip/commit/?id=2a13a49da4af4487ee71db6aff19364220da694a. 
> I'm now trying to figure out how to properly fix that.
>
> Additionally, the binaries are now forced into a subdirectory named 
> after the recipe (see do_deploy in firmware.bbclass) and cannot be 
> modified. So I need to patch our TF-A blob recipe to install in the 
> identically named directory (that is, trusted-firmware-a/) so that 
> U-Boot can find the binary named the same in the same location 
> regardless of the kind of TF-A we're building. It does feel kinda 
> wrong doing that.

This would be my suggestion. Looking at u-boot-rockchip.inc, this might 
simplify the logic there as you no longer need to handle 
machine-specific differences between ${SOC_FAMILY} - it'll always be 
just "${DEPLOY_DIR_IMAGE}/trusted-firmware-a/bl31.elf"?

I could add a variable to firmware.bbclass (say, FIRMWARE_INSTALL_DIR ?= 
"${PN}") so that the subdirectory can be customized from the recipe?

Thanks,

Peter



