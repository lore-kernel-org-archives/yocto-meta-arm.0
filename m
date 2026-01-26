Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DA4D13C0F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:49:17 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20322.1769435350534153754
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 05:49:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bJtnTWDd;
 spf=pass (domain: cherry.de, ip: 52.101.83.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJ3HkUgaI2r7Pb8XeOgomUhA99yiqTApqht7UMsjMAHILT74OdUgFWwHAmLwpJDAekfRcqhDgQoOHSoCix6aeIjezCv3h+ChsE/bmU9zgrp9JQeNeU2uwIN3PP1X3FtocLBx4CfSsqr9v+36Wn5woWL4BfwpGfaRP5OcTPzu8PeoHx9vRZoQRHXbtUuw9B92CmDywu50cOxz7eg3yjtcxGLvILgcHSlO0p8oLZh4+lZmbXmApvtcrCtCdQcrmgIX7foXHOAbUfmmvwI0xs3vHs4Xv1oWEEberSGakIuxYO9rAsD7QDqPibR0cR/8lvdyg5yTpm7bx+ZJsl0qscs3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLcxBdXa1d2PTlkGj134CIz0+g2F88Y0JiackSzyqAg=;
 b=lUbcQqggG5Pp3If9yLwvrgi95bp3Acaqh4avW6HCHpdAFEVhWnyhW32kAPI5nW2Tprn/jAatTfOSWPXoct3e3wtRh750pqUEYNGqC51uVssWCbTRWv/EC5bd/tiKQhsppjnylPXZ+upRGSLswIXcVcBkv9DfPoNdKO6O7sRkKjHY8MMlqGCE/DsxMXQu/FI7ys4rq2ha/8u59hGbPuGHxBXUut6cupFbGwtEao28LvGt8Mtr/KmTx6kh3VOlMn7QCa1WKYwG/5f84OljyhMY6IYswBfwRpzH1/prj04Cy/hC1o5X2MSG8wlVbWLzbccuAyJglBCUjMszTXluVWrgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLcxBdXa1d2PTlkGj134CIz0+g2F88Y0JiackSzyqAg=;
 b=bJtnTWDdBUKwT9g8dA97AZUFWOL78ZVMFJO2OXr+5Kbns5poqT5faIRnwnkGAGzoF/epGiBRqwahxzcKNad7D4UMtpiC3LvuLOfxY6EMUWgoelZXxykVLyiFi1s3e+DWkroUdUFt3ir2/JjD2FZklvpQjyaXnBaTCLSlf3EbGrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8076.eurprd04.prod.outlook.com (2603:10a6:10:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:49:06 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:49:06 +0000
Message-ID: <d62131b9-a531-4a54-8cc6-8268f9f5924b@cherry.de>
Date: Mon, 26 Jan 2026 14:48:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm/arm-bsp: optee: drop version 4.7.0
To: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
 meta-arm@lists.yoctoproject.org
References: <20260121140356.16818-1-hugues.kambampiana@arm.com>
 <20260121140356.16818-4-hugues.kambampiana@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260121140356.16818-4-hugues.kambampiana@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 905f731f-49db-48e2-7374-08de5ce1ac44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aHlPQWRuemhjTHEzYkJhUkNsdzJHcGtTNlJNN2IyUVZ3cGJpMXdrS29Fa0Ew?=
 =?utf-8?B?NGhwWWdMUXhnZjdDZ3JNK2VtU3FRMmEyOFZrQzE1WmJ6NGtDZkhWeGNnMkxh?=
 =?utf-8?B?L3BZL1VVYmh1UURxSkVpUWxHRHk4cEdicGVIWFJiWk5TcVkrYkpkNSt1cEJ3?=
 =?utf-8?B?bjhLZllLU2ZRcjdaci9vTGFKSWZUc0w3RVB6QmNsdkNCN25WRHVnYTFBOXFW?=
 =?utf-8?B?cFA4aytOUU5mb2N4RHBpK2xOUFhlQVE5eWpMTUdQdTBnSkFrcitBbURlTzEy?=
 =?utf-8?B?SXNFNnlEKzM0MkhtK09kVEZaVWVESmNxblk3U2ZuS0RCUUZGRjJzRjg5Rld5?=
 =?utf-8?B?amhNeFlJL1MxWU5IMTR4M1M3RE1aTXFVVjQ4K0U5SjdKNFdrMWttSTd1aGxk?=
 =?utf-8?B?VUFBWFRPZmJPV3Exb01EREErNCtYcDAxdnVtR0R4MzF2NTF2TmwvNXNHVXVU?=
 =?utf-8?B?NHBLTlFiQnVuaVhSNkxoVmk1T0dDeUxBWitGL1NVT080ODRocEYwZ3E4ZFhw?=
 =?utf-8?B?dDFCdkxVdk1XdlJhTEdQdS9zYkNJRG9MU2R6OVRNVUtRMTFlQU8rcU40Y2lv?=
 =?utf-8?B?L0VsR0YwUFlQdncrWU5XTWZrVVQrQXc0RlJoaUx4SWw0dWt6U0kvMUloS0d0?=
 =?utf-8?B?RFJiUTB5bG1yaEJidys4UFZoVENiVkNRS2ZVMngwYk13VWp4a2NDNEVFSDFm?=
 =?utf-8?B?Z1d3Qk9GTkxUb0ZvTklmL3RNY3BtWVpMM09IaFoxdFlwbHlwVTBKWVFES3VT?=
 =?utf-8?B?cWhlengvejdkckpzUHdrd2NVQTF0aVZJY1NBTkxxdFRwVDdlKzc4Z0hJdXdk?=
 =?utf-8?B?eWgxR2RVMXVYa3pXSTRDL1hFWHp2TE9JaTA0M1NScmt0SDNJbEhhV0JFSk9Z?=
 =?utf-8?B?aFYzWmZaSlBTNXk1bUtRaUxFQ2ZBdU9iTHArZHdXeVB0WVVSbHpNMDBQTVVF?=
 =?utf-8?B?VWY1THJhVU5Lb1luSTJoQ01QT1d0bkI1QmZuRmFScTFYZEg0VlN3eEI2ZHhZ?=
 =?utf-8?B?WTY0Zy83K1FuMXFrc3FFaWt3Ri9pQ0o5c2hLQ0pEbllzZWo4dEx1S0U2ZjJZ?=
 =?utf-8?B?RG42TU5qMklKL1psc0t6QURzeGtjVkZCMmZYWER4R3UySnVXQnIrR1JGWmpz?=
 =?utf-8?B?U1JYU2hTc2RZbCtkQjlOdnFKOWhZVzNFOGlOKzZsRzh4Q3Q4OHMxNnptQTJE?=
 =?utf-8?B?Y3FYMEl5NXNrNHNaSDVIRkNZUVhZSy84d0FuNmRWckxqb3RQTEZsQTVzYWtv?=
 =?utf-8?B?WkZxOGNPSDRiMlBmM3BuVjRRY01DeWJwUFVQWDJkSERDUDJzSDBqSDRqeVdn?=
 =?utf-8?B?cm5kNER0TDhveDg0V25GdHIrNE1GeGE3b3djSnhtYVJ5MVNpaHZIcG9nZ3U2?=
 =?utf-8?B?R3Nub0tDbDMwMFVJTm5RaXpyeW5FSU9iZ09wL1AzbG9zNzhlYnduTEtDSll0?=
 =?utf-8?B?WUJmVThHTDVDRjZDRUljU1NnZTFhejhhTjRKS2x3ME9TN3padUJMNU02RzZl?=
 =?utf-8?B?QzltSmdQZWtQK0h0RndPVlFmamIrYnBmZSs2Vm1jTnpjcWFSZ3d6SzFaa0dJ?=
 =?utf-8?B?aWE0NFJkUVovUEl0L25Kb3FTK01kOVVBV1B0TnR6RlA1TVZNZjJLM1p3MGNN?=
 =?utf-8?B?RC82c2NZVmJCVjdxRitlVTVvS3I1YWZZakxWazd0Q3VpSzlXL1FLZDl2c2hl?=
 =?utf-8?B?elY5MXQ2MGpvY1BRZGIwMVZvandRK01ZS05FZWVqN2ZiS1dSTUlORXZIUE8w?=
 =?utf-8?B?eWV0OEVYb0grTE9lMnRLbk1kZnh1M0dlMEFsNnhsc0NkTXNRdElTYy9HdDNv?=
 =?utf-8?B?VC9HbWZiU0xxMlhTREZuQTBrdWNxWWEycUdySkVEdnM3WkRNTTlDTmtpVyt3?=
 =?utf-8?B?RE9tZUFUOXVTOE5hMWN5UTlqWUtSdnR6VCswT0tUMWtvKyt5MDdDaGJLYVNZ?=
 =?utf-8?B?cWgyMUtXanZsVEgwL2F1SFJnRXV4SzhuL0pzeG9kRlQ3emxUV2NlcENXbGFT?=
 =?utf-8?B?Zm1KUW5VSElZZVRqMFhvVEN0aTNhOS83VTVSQ1VMNzJzd2syajVHcFphcGR6?=
 =?utf-8?B?cDJGTlo5Zjl6c2VDQ2tOcVhLdUJHUEZyYXUxVVEvVFNRYklLSzRZTkJFZ21w?=
 =?utf-8?Q?oyFU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGJPUlFXK25iQjcyK2FHaENUUlJwdTFBYXorMHJsS3BiL0lackwzTWJUalFu?=
 =?utf-8?B?SFptUCtpaGVKeFhXaTRrQWFER0V0UUQybDErUSt4cjlOS0wzR080QjkrNk1l?=
 =?utf-8?B?eGNsVG9UaGg4cUNHbUJ3a2FtN2RCc1RJMU50SE5ybWRNR2pGd0lMMlhPVDkx?=
 =?utf-8?B?V3BXYmI2YTlHeXR0d0xjaUJWeGlmMEpqdG9JRmJXT3lpZm91VWdVN0RmMXlt?=
 =?utf-8?B?ckVjUlRsR1g0d0FXaFJ3OUVubk12NFhXb000d0JxYjVqb1NFOHdsbG5DM2FF?=
 =?utf-8?B?UDFBS2hJandqZDlwM2w2QXJZdjM1QzhOOWliNXB1YVRUY2tvWHVJeFVwa05a?=
 =?utf-8?B?Q0l1R0Q0bk5SWmxwZm5EZlkxbTdpd011aEdFc1dGOU1DQU9oODZ6TzRUbU1F?=
 =?utf-8?B?Z0FETTZjRnRjWE1vRWlmNWkzSGo4QmVQVWtydWRtdVJtOW03VXRKMnVwNjJ2?=
 =?utf-8?B?RmMzMDd0b3NtQ08vZGRNK1ZKdDA0d2tkbmRjbXVRVW1MUTlSUzBxbXZXaTlK?=
 =?utf-8?B?eUlOUUZpa2ZIYUx1UkNGWDhkQ0ZRRzNoSzZScXJ1eDhxdGs1ckhHWDdweEtP?=
 =?utf-8?B?amxvY1doeWRaSGRMYkFGdUlYV2kySGluRjNhWEwyVVovWjd4eXgzWWxITEVH?=
 =?utf-8?B?YmtaWjBram5vZ3RRNStjUTBCaTJvMk5TMTlnaDl6TlVVbTdEbCtuOHN6SW5C?=
 =?utf-8?B?Z0JjUjdDQzVBa2JTNkRiUG50Qm4ydVFjRE5DZ25ZYnJWVDZaOVNTR0tLbVhv?=
 =?utf-8?B?RzdmNEg0ZisycGRxMXFhZWhBM3JuT1JJWkMxM08rZ3lOMEN3NTBwYTV2Szc4?=
 =?utf-8?B?TDZBTHYrQW1nRDBTQlJNNzdWSTJ3bkZMZFVQUzl0Rm93aXdGMVRDYUtOL3Z5?=
 =?utf-8?B?UzNKNTY3cTFYcS81WGl3SHpOazd5azFIa0ZrUGJGYk9mWHNzdEs2Q1FHNnVq?=
 =?utf-8?B?OTl3NDNHN2kyUHBEU2VYWnFINk5MTEZ5cXJTVDVpRUxxem1vUVoyRmNpTzU1?=
 =?utf-8?B?RTBLMi9yL3ZqTXoyUFdybWtUOWhBQThkc012MCs1bUh4MnZFZXVaT01hTVpO?=
 =?utf-8?B?K3RQcDdtNmxORE1HQ2tHU1Ewek5pMWpTdm1qcG9zUVFKSTR0YXRBNTVCSW9W?=
 =?utf-8?B?MFFhdnFaUTlMTVkvWGNBWGZkT2NLVjMraHVXTkl0UE81elNMcHlDcGs5eUxt?=
 =?utf-8?B?SjNIdHVUK0NBQ3lqbWxZRlJFeXIveE9BcHZHRnNmTEkvOEVINkxlV1FxV3J5?=
 =?utf-8?B?eUI4WDZLYkFxeDIzNUk5a1pmb1VCdnloMnIzekRtOXFXZWlXQUtROXFnT3By?=
 =?utf-8?B?V2ZGT1VNeFI1TjFsUXppbTZOVy9JZktCajhUMFFncVJJMVpMS010ckdSVDJx?=
 =?utf-8?B?MzJ5clRmcVZVMlErUmF5S0dybHNlUTZHYnpPQ1dvYTBzMlFIaHovN1hRM2V4?=
 =?utf-8?B?bzcrdXp4SUlZem5uWW41Tmt1N2FleW5McG9VblduWXhZUGQyS0lJUEdMb0hp?=
 =?utf-8?B?Y2plZ3JGSktLWkpReU9IMXltQ3h3bndvODU5SnlIN2RyT2FCS2JOc2hLQ0FV?=
 =?utf-8?B?QUZFS0pqTzA5Q3cwcVMyMWRlN2RURVVGWTV5TUk1RTlvWk9ZMldqTWJ0UGtv?=
 =?utf-8?B?ZmFoZ2w2cHFHMmhvemp6SHdBejZ0K2JVUmJRZEw3UTNJNlplZEVsRm8xdEMx?=
 =?utf-8?B?OHdVTGVjTjI4OGUzT0xkM05xRlM4S0QrMS9Fb3ZVMGRUb24rWFc5SVlpbVF2?=
 =?utf-8?B?NEI3WlIxSS9raEtXaUord2VjWnJKYnA5TWgrWFl6QmtJWVM5NVYwejZsbjh5?=
 =?utf-8?B?Tkl1cWRCZ1VTTTVkU1M5cWluQzFIYmtDbkd3WE1MeW9OMWpmYkZkd01RNkFX?=
 =?utf-8?B?QkJtNFRmTlAyUGdzZlQwa2YvNXZjam9PeTRSTGlQbWg5ZTZISXVQOTQ1SHhF?=
 =?utf-8?B?SXhpMEt0MFByYkhrTW5oQ3E0SHpaZ05kU1FpdVo1eHpUT2ZNZzJGbkNDd0ph?=
 =?utf-8?B?NUptbnpUTXBGSEQ0RVROOHpyL2VpeU5aZTZJVW0yVUZkZlFXUGxwN0RuT05E?=
 =?utf-8?B?Q1drSm14RjZzSnlOVkd2REdxaFozaU40Zlo4Z0FDYnpDVEZPRisxNjJtN2xZ?=
 =?utf-8?B?VEYrVW1Fb3p2RnJHcmVMYWVBSEFjU21XZE1TdTE2cmtGWDNmOU9IczFXZGVp?=
 =?utf-8?B?Zkp2Wll6anVzRzZZMzNsZExpNk5UNDV2azhNRjRLbGhWUExpOE1sZURUWXg3?=
 =?utf-8?B?RzRjYng2dWF6RXUvMWUrSVMwbDRUaC9zWmRQL2RFbzBUTFZVZFo1TVg3L2Vr?=
 =?utf-8?B?V2FRRXRoQ016NmFZVG11MWJLZkk5ZWRHcVpHYmJXZ0J5OXFTSElwSzUyZGl1?=
 =?utf-8?Q?PSBljb6tyUFTTdTu9FJHsGsHdEVEKgtUc1WNY?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 905f731f-49db-48e2-7374-08de5ce1ac44
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:49:06.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fn6MCRrQGDafLgLl7QAtcbsKjAza7QJUALeJrpCruBHFIR+U3flo2YTKEvrEwofH4KSZf6nCxtIJ3XGZLwi+snV5mZfTV+qxy4SA+PErUyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8076
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jan 2026 13:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6870

Hi Hugues,

On 1/21/26 3:03 PM, Hugues KAMBA MPIANA wrote:
> Drop support for OP-TEE version 4.7.0 from the layer as
> version 4.9.0 is present.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

