Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1663E6BF35
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 18:33:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1057.1769798031670162556
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 10:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Kah3c4BI;
 spf=pass (domain: cherry.de, ip: 40.107.130.44, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDVkBjASm4oPaV1/T60sBZlaQlIgSpEOT44XfmWe+zbG7U6xB9Xn9r9hC47mZuuXjQ4Osuwrc5lQW+n4jN/f8UyxA4YMB8qLZq7P3I0VFHMrAonDcxXS36YO8i7bNYtmfAoOQlBXlvVa7IlrZkQdnVV6uSGTR+Cz4/VeeQPDz5/A8SB0jFjmDyfD+s7qj2tuXgEhjyp54CiALuXWMtCzZQOVsCwri6L0W9nB49ToTiLFF1ExZjxw43bu+jHIaAytjdfGzzRIl/Q1fxC3ya1+btga2j/zTAXzEXby66EL+cSc6Q8280JN4jOzNafKpq9SuDw+h/7iU3Lv+ikR/yr84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swyl51UrCQm6mhDU6Vt+anPCeOlNwVDDZp8sxh0XgpA=;
 b=b6HgZuSpM3Bhut++RjF1gLiIqKfy4fxAASo1QOvQkCjUNdJQgToKchXtC3hUP8phIIQ/eiZzIZefXjTjfKLx8TPF6/XhrXDIZKJ56LZW26f0Sf36qrvz/BTMtvNWd4uTRvDsN6KB38X5JzlZZ7b3aQTfTv7PnGjuk2QkYb0Ksf60n9cEKqe550Vv9M6ya8YNIx0CX4M7KzvODUGGEt/86BlBmYtCjtOr8G+21DSUDcr+2d9itSCJS3rbQkF2hm/EkOQAQL5kVG0qpSCxUJ8lZs5aHZQL1kuURxInAWrsx0Jf5vsC7B2QD0JBsLMqC/z4HGCw+6TzceN2uChxxJg3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swyl51UrCQm6mhDU6Vt+anPCeOlNwVDDZp8sxh0XgpA=;
 b=Kah3c4BIlL3+EX4zvFhBM0MIvIsaVgkc7e4a7qtHt/i9+XBog0CuzsLX3ecB/EOdXwUjpTTRPrOxkkyOldsNmkThmPd5FwgKSuhDYhzFMO7Ld2TGt14Qu/dg/r1QOlhlHW+zgGnRzv6RpEPnIZkJDkRo7pLhoiMyBRMUHMlwXqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AMBPR04MB11743.eurprd04.prod.outlook.com (2603:10a6:20b:6f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 30 Jan
 2026 18:33:47 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:33:47 +0000
Message-ID: <a8338666-ed68-467a-a9ac-d32c03f4dc82@cherry.de>
Date: Fri, 30 Jan 2026 19:33:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm/arm-bsp: optee: add version 4.9.0
To: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
 meta-arm@lists.yoctoproject.org
References: <20260127154532.27572-1-hugues.kambampiana@arm.com>
 <20260127154532.27572-2-hugues.kambampiana@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260127154532.27572-2-hugues.kambampiana@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AMBPR04MB11743:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d149fb9-dabe-4244-a18f-08de602e1b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c29kRnZxTE1KODBZSTBudkxmdjNnMEJibjFZQzZ2ZmwvMElMRFk4L25EL1N1?=
 =?utf-8?B?M09ydmpPSDFndWF5MDBEZ0o3eVptSkhtaGp3WmwwU3ZnVTVWb01mWDRrWkY4?=
 =?utf-8?B?Ymt5KzFJVVVHUFpIcEZWUGFVZk9ENFdHT2JGZEgrejZCM0hOTVBRc2JnOStE?=
 =?utf-8?B?UEU3T1p2ZnR5TTdMT001ekxIQnhsNkhOOE5XUFR4ZDhqVjdWUDJNU0Vtb0ty?=
 =?utf-8?B?M3VnZG9uUmwydEMrd1o2M3phdHJ1Q1kvNWVVMWdVeVYreTBkb01ZQ2E5QzZm?=
 =?utf-8?B?NzRCa2xESXd3OEtvd2ZieWViQVkzbnFYWmJwRnBXa0RkNkNMWWNNbjFmTHJZ?=
 =?utf-8?B?cGl2aXJRLy9jeExHYUhYeUFNNUhpTiswRjQzNDNla2VjVlJqeXBtdVF0Snk2?=
 =?utf-8?B?ZHFaU0E1K1RXWHdCdS9DRE0yS25VdUFEV3cwR3QyTThnUGw2ZlFaWnpWWFhx?=
 =?utf-8?B?bGlzS1VpQ2VtSWFvbXdUZTcwMnl1NFl0ZlAwSzREWEtBaUlzN3kzY2hMNk0y?=
 =?utf-8?B?eUlxYkNRQ1JDbGJYUjFua1VvemY5aFM0VDdwa0YxOUhFdGd3R1VwMUJueHFX?=
 =?utf-8?B?NisvQm1uamZNTVpZajI4Q1J2Nk5NMzY0ZVVOSUpyQVJwMlBGMURXQTlDejlI?=
 =?utf-8?B?UWUwT1RHME4zeVBSVjZvTmtDQkVuN1JZbUkxQ25VMEVlTFdQSkZ0WXhnUHpn?=
 =?utf-8?B?eTBPUWhMMVQ0dmxqREk3YWJ4ZjIrSnVHbU1yNUp3SUlRQ2VHQUovMHRSek0w?=
 =?utf-8?B?dFFHbFdHY3JJTmlDVjlOdjA2MkcwSjRGbDAzdEo1RnVheVRkbHF0bHdYeXhj?=
 =?utf-8?B?aU1Ha2ExVXdka2wxRFNyVUMvVTVCbldpZGJoRjNRczIrOTNqd1UwelVRMVNC?=
 =?utf-8?B?R1V2SjkvNHZMR1J3QWR6dmY5bnFMKzFLSi9pNXkrNnhyUTlkMVZBOURzTFY4?=
 =?utf-8?B?dEpvb0NIT29oaTk5RG9ZYkg4T1dha1NSU2RKUlJPU3F2OHNlaUQ1MjJ0a1RS?=
 =?utf-8?B?bVI1L1F5cTRJcTM3SDFqbmdGWTM2VEZ1eU5vck11RnVBZU9nMGFSeTUrdjcx?=
 =?utf-8?B?b0J3ajJ6QTJWQkVxa05mV0trSk8xeERpbzAxSVIvSEUvUmkrSThSV2ptTzk2?=
 =?utf-8?B?Y2ovbEFuc1o5MXUwRXdDWVdNN0ZNb1dNTkhkUmtyTHpiWStPOG5wTmJMSmZ1?=
 =?utf-8?B?QVc4NWh5NnE2REs4MFBvQlkreWwvSTFPN0p2SktKeE5Ma2F0UFpjWlRFYmda?=
 =?utf-8?B?bEwvdmtGRVZ1N1BSTXg5UDBQSUZEVlVPbHB1QXpFOWk3RHJCSHQvRERYUkZL?=
 =?utf-8?B?RlI3QjUrUFVtOGZtaU5ycUxaM28xbHdtQkIxbC8xTCtMYkQxK3BkM2NvbktQ?=
 =?utf-8?B?Q0tCa1JSZEVnNjFiSlpqQzZwV29oeStiY0wyVG9DU2Qvb0gzTm9IaW1PNGpF?=
 =?utf-8?B?eWN6ZU1hWGErc2ZkS1hlempKOHUzZXZ5cXJJTzh5U1FvaGd6M3NwL2twWXBh?=
 =?utf-8?B?bExEZ2s5MkI3dkNVei9WSXJ4L29XSUdpdngvVSs4c0FHOFZCOHNTWHd2Ry9K?=
 =?utf-8?B?b05ScVZ5RldJelNORFF3NVRPNzZud0dLTEFTQW1lMWNCb0tUSzg4L0hKQ0ZN?=
 =?utf-8?B?bTNZNW02eU50VW9oejJVUkkvcFNuemRxUktUcGRHNkFTajZpUHJaQk5xQ29H?=
 =?utf-8?B?SEhBRmE3eEN0M1dQYTgva2FCTmlzY0VhWXRhak1DbWh1bkNUMjhVVkpwWFE3?=
 =?utf-8?B?aG5sM3ErTjN2OVUrVDh5R2J4aEk4TGxrU081VnB0Y1FXNUFPSDMrWSt4ZDlS?=
 =?utf-8?B?TGdISmE4aEUxRC9ZT2xxaS9ycmpreGZVK0N6dXUyVU9mNUg5VnZocGRLTUhF?=
 =?utf-8?B?am9OT1BLWGZPVlcycTV0T2xrQzRpQmxFamdKalpYWkpRRVd5VFRGSVJJUisz?=
 =?utf-8?B?QnVVUStnSTBvdUxwOUx5bXVBVGlGaG9ITWJqc2hQaUNhMzJjQzNSb1RaaXdR?=
 =?utf-8?B?blh0Z05zS2ZjS1RWMC9ZWUFxaHBnS29JWDRJS0VvL2ZDNHpNc1lMa0VzMGdP?=
 =?utf-8?Q?/wrjkD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHhkbWMyemplNXNpNDc3S3VDcEtpYkhlNFNCc2Y2LzVRNjZmVGVVZ2RvVUtZ?=
 =?utf-8?B?U2RvNzRVSTBVNjZTU2xHWnRyNUFhMlR6WkIrNk04Nnd6ZVRCcGczd0lkWGFr?=
 =?utf-8?B?S0pBOXU5dUZrcjNVb3IyU1RtWHVDYkFaY0lpMjdVU2I1ZHF5TmErSEJWQ2N4?=
 =?utf-8?B?L3hkT05RY0FrWGUweGx3MEtwekpqQUVuQkZpWnl0OHRER29TR2tXdG1BVkFU?=
 =?utf-8?B?NUNrUXdYSVZueXNBRmJRMk5ZOXh5cGpmMTJMYjU2eVdLQXVIeWVhYUVQR0Rh?=
 =?utf-8?B?S3pmWUdIUFlDRGxWeS9KYWZxNDBTYUFHUTc0djJuRFRNajVqbDVadEVrakFz?=
 =?utf-8?B?MUZwcncwUjU3S1NaeGsvSVUvOERIYzhOTDd3TlVUT3VxcnQxWHA0WVRmcHFv?=
 =?utf-8?B?OVVHaE9XR3dEdkNVaHB1ZWNuNEpNKzNQemdIOGZ2a21zZnhsVElTc2RKR0J2?=
 =?utf-8?B?b2ZGSDBrOE15YTNIamhVU3JrWmV0eUN5SHgzeklmMmh6WlZ0b2xkV3A0T3BQ?=
 =?utf-8?B?dEQwZ0FzR1gwQUpwWGR3YW9yNkRmK01iTFFaSGRHRnZrUlNWSmQyTHBOSnVi?=
 =?utf-8?B?WVRtOU1ubGtva2JNTTdDdGJ0NG01WGljMi9NcmhUbmFWN1ZnenZyN3FqKysw?=
 =?utf-8?B?SWlFL0lxazBwTDMwVnhLRDd5Q1MrbEVuMEZVUDZTL0NxYXY3Z2R2WEMwbm5i?=
 =?utf-8?B?dkFHaGU1NnE5UXY2RXN0cm9sWmdPVVVtVGtMVk01KzlqVnNNUExRSGJMK1dD?=
 =?utf-8?B?a3dxbWpKY1p0dUdqZW5DRVE4R09vMXo3NlFXVGZsNVE2RWVubEdEUkYvL2VP?=
 =?utf-8?B?ajR2VHo0V0VINTk5QlBWY3lRMDdTK2dxemlzZEQ2a2lwUnJ6eUlVMC8yU1RW?=
 =?utf-8?B?eGU2QWU1K09ndHYrcndUTVlQT2ZwZStUTEZBbWdXRXE1ZnZLalpBNTRIMHRo?=
 =?utf-8?B?YjRreHN1US9JSU1kSjVzT084dVdiNFNMVXdVR1N3VXRxV2M5THp3Y1piSG1a?=
 =?utf-8?B?aTBQWGMwcE1uMDNNMkJPUzFJMnVZUFJqS2xCMmE0Qmp3NFpRUUJFcDBrWERT?=
 =?utf-8?B?MWJPOUtzRE9jQmE4Ri9UUjBkOGRWYVRndXRYUEVwbTZpTU15VUxNckoxakVl?=
 =?utf-8?B?cEUwQjQ4RmYzaWQ4L3pkelA0ZVB0VjFvSURkc1psNEpFM3ErMm03RllxSUZ1?=
 =?utf-8?B?NU5NdkMzMDBGTXA1R3diWmRTb1ZnZTluQ0hhMDg3ZFRFYm96eE9OL1pQNTJo?=
 =?utf-8?B?dWc4VUYvQk5kQm1YMWN4OE8vc3U0MHdBUktvR0wrUzdmOWVhZGxZREFHd2Ez?=
 =?utf-8?B?Z29WT2tzUm8vR2dWeFljWk1FTFk2NjlRTnFjekxMem1NeEZQdDd5UEdvZVFD?=
 =?utf-8?B?Rit0Wld2RzcxM1VCYzNIeHRlazNzQzNMczl1MngwblR0dTU3anFkMmtBWHFS?=
 =?utf-8?B?N3IwVnhnNWdZSHBJRzdvZXBoK1VldlRUdFFIb3YwTkpLTk1BSjVjYmRwVGZP?=
 =?utf-8?B?MHJGeDBLUmFwMmZLQVB5VTZBZGFncG1Sb29CWFphNnIrbGovUUxjN3BmZnVF?=
 =?utf-8?B?dlM0bEpXaW1XT0FKUEdXOFkvcERmbmhmNEJhQVZyUytlUWZSdTlqTkZsNlNM?=
 =?utf-8?B?T2c2K05VMjJhRmhjTHVvWkltUnFxczBPTzJlZXVtc0hMVEtSS1V5RUxrRTFN?=
 =?utf-8?B?MUpUTXFCcGlSOHJkbG1oR2p0L1pMcnBxR3lKYmIxaUsrSEpoZmVobHlyV1la?=
 =?utf-8?B?RFY3bElNSmlNQW00QkNrUlhzdHhLc09XU1BnNGlNaFdvMkkzNUNUek8xNE9V?=
 =?utf-8?B?d3VWZlE3eGppbDF2a0lyL1d1aU1rSlVLNGkvTGVsOGMyUENiRTFuWERWZFRj?=
 =?utf-8?B?VkJpQjB0Qy94Sk1uWnYvZTlEQlh3MVpLM2o2RFJDajNVdkQ2MmV5K2N3My93?=
 =?utf-8?B?UlZpRVE3TnNOWFZrc2lmTlR1YXJDeVpROXpkNUlZSVpDcmFnT2RyVGFFaHRm?=
 =?utf-8?B?Wk5zdEprc3MyM2pJRnNTb0lvaGhNZFdQd2xuMldGRDN6OFE2TlNYcCttejFO?=
 =?utf-8?B?ZmRvbS85S1EwcFdhVWpNSzdjc2xOWkMxR2NXTW11RVgxY08xZlFSRHJ5Vmhh?=
 =?utf-8?B?UENIbGJIUGRHckpxOTdWcDNkWFNlc3NUVVVzN21PSkVMSkhPUEdESWpGbmV0?=
 =?utf-8?B?NVcrSHFFWWhyN0Z2TzlpNlBNS2tVRUJRaFBCajkvc1pqTVM0d253cFU0UXNC?=
 =?utf-8?B?Tk5KS1RBNmR3aGo4L2dTY0pQemp5MjQrUzRTUVFMOSsrQVZVSERqMXR5WjlP?=
 =?utf-8?B?Z2daczlIMEpQUW8wVnErSzFkWUV0K2dWVVBSR2pTMmxzN1FsMHJSUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d149fb9-dabe-4244-a18f-08de602e1b29
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:33:47.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykkiyPB3+sFaGWgvp4eBG77kvdkAMFgVyHZcil+43sB/WCXP+NLmTAoc4YG+CLA9vMd7C65pkmZpG538hXuSDOiePuwz1lv0gHZNZG3K+Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11743
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Jan 2026 18:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6884

Hi Hugues,

[...]

> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
> new file mode 100644
> index 00000000..0cbefcee
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
> @@ -0,0 +1,94 @@
> +SUMMARY = "OPTEE fTPM Microsoft TA"
> +DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
> +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
> +COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
> +COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
> +COMPATIBLE_MACHINE:qemuarm-secureboot = "qemuarm"
> +
> +inherit deploy python3native
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
> +LIC_FILES_CHKSUM += "file://optee-ta/LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
> +
> +DEPENDS = "python3-pyelftools-native optee-os-tadevkit python3-cryptography-native"
> +DEPENDS:append:toolchain-clang = " lld-native"
> +
> +FTPM_UUID = "bc50d971-d4c9-42c4-82cb-343fb7f37896"
> +
> +SRC_URI_ms-tpm   ?= "gitsm://github.com/Microsoft/ms-tpm-20-ref;protocol=https"
> +SRC_URI_optee-ta ?= "gitsm://github.com/OP-TEE/optee_ftpm.git;protocol=https"
> +
> +SRCBRANCH_ms-tpm    = "main"
> +OPTEE_TA_GIT_TAG ?= "tag=${PV};nobranch=1"

Same remark as below.

> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
> index 4dc24154..9bad64bd 100644
> --- a/meta-arm/recipes-security/optee/optee.inc
> +++ b/meta-arm/recipes-security/optee/optee.inc
> @@ -1,5 +1,8 @@
>   UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
>   
> +# Use tags for versioned recipes, but keep _git recipes on master.
> +OPTEE_SRC_URI_BRANCH_OR_TAG ?= "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"

Phew.. I'm worried this will introduce much bigger downloads instead of 
just downloading the tag we need.

The obvious difference I could see from the BitBake fetcher is the few 
lines after 
https://git.openembedded.org/bitbake/tree/lib/bb/fetch2/git.py#n470. But 
having a branch= parameter means we would anyway download all branches 
and tags, so I'm quite confused.

Should we simly have tag=${PV};branch=master by default for 
OPTEE_SRC_URI_BRANCH_OR_TAG then?

Cheers,
Quentin

