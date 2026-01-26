Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1373D13C2F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 15:10:07 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21697.1769440198053212594
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 07:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=HPVSyeFH;
 spf=pass (domain: cherry.de, ip: 40.107.162.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KswTgjye/hQM/9xBPaX9+e8ALf77NvnlCX7WU2EFry4RM1zJd5/GytvU7FkJDfD460yHQHCt9kzKyodp01LEHNL10FAAtSzoashUYQJ48LToLK84kWsG6oP+Sa3W9xr9Gg9OuJ0fdibac4KKbUXg26bKGpF3fVmEmqOUONa/7lefR0NVDBDUxihQHcLWgdlD0DZCvTXcnhWd8SR8SJp7OaRaV07p6BpTlrS2+NPeYMVog4ixRpVenRgoyhLyET/CkDEcfF/XYbQdzdmPped2nYC8WP5AaizTyuxNjAUewZSbESaY0CR3mlBnjDHL80hgXNH1Yf/JfS46jGu17tC5xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eP9FIOPmysLyo6z6AsYQC4c6+FADNdrU+PmibVFA0og=;
 b=ATL/nkpuYtr9LUksLSQdcY9+oDiU+xHCcZREqRLC7xNxTbohCnYibGZ27fyZ8X++95xQSxf/qJuPPAp4sZh6qgOQljOhx+qSaJBfSsPzSgW4XV2+BV4zguxQwfvN/D9F1g+mRogfn38ghZg+cI0d5rFb/J422UzOcfDs64rFCFhUF1e56oGiDCHjSHlxvsEAqEq8GnOlbMLLdsBvxWlc7sz1oROpj3IqATi05owS+XWD1w2/n3Af1vapfkzhJyOzZyWOh0mEdgyuASp9pTL07YRARpnhp8JtO6YeWghozsfAJpoU2sp7aucIby4ClCRstQJOsJjT+/CtnQwkFkii4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eP9FIOPmysLyo6z6AsYQC4c6+FADNdrU+PmibVFA0og=;
 b=HPVSyeFHMXE9e0vwkjxaiVIfEV/jRUjFPxsMcBtnZYS7XxVNGGNJKHvn0QzZIk3lm0J0FCgVuAXlj2S6kAbguS8nXcQ7fCemNoYx2xxWi2ThIK8KFjMzlAPHuK9yd3rUXZkpptpDVs7Sn8pEy30V4QAyTpJtL94J/1CgtfvCOKE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB12005.eurprd04.prod.outlook.com (2603:10a6:800:310::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 15:09:54 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 15:09:52 +0000
Message-ID: <3d875646-f7da-46ea-8503-3f5b5f4e435b@cherry.de>
Date: Mon, 26 Jan 2026 16:08:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arm] [PATCH 1/3] arm/arm-bsp: optee: add version 4.9.0
To: Denys Dmytriyenko <denis@denix.org>
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
 meta-arm@lists.yoctoproject.org
References: <20260121140356.16818-1-hugues.kambampiana@arm.com>
 <20260121140356.16818-2-hugues.kambampiana@arm.com>
 <5577d221-3d0b-4e1f-8106-0c657c07f195@cherry.de>
 <20260126145627.GE11121@denix.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260126145627.GE11121@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB12005:EE_
X-MS-Office365-Filtering-Correlation-Id: 748f3345-319f-4c8a-4ea8-08de5cecf520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MnFhYU5GK1kwUWtkS3JUN2MxcDMrOENLZXNVVjB0RWcwYmxHU1V2NnA4Q0dD?=
 =?utf-8?B?dEFVZzVsOFNSTjE3UXowUi94TFVIa1dMa0Z5S2RwMElGeFBMNkxTU2xpYUJQ?=
 =?utf-8?B?bkxQZzlFZVpVcmVBNGZpcjVnei9uUjFLa3RtbDdQN29QRXNoYXBlVlhGRWkx?=
 =?utf-8?B?S0Z6aHBieWtIbjh5UVRMR1FocFlRWHdJTmVCMzdRRnYwTHRDZWRLRWxqeGVm?=
 =?utf-8?B?ZS9MRGZ1ZWE1anZ2bk01VlNFRHdKRlpJMVFmdjRyd2Nha1hnNlMraFlUd0lz?=
 =?utf-8?B?cS96TkZoVnREK1RYNnpIWUFMdXlraXNKOUJHOHFIaDZYK0dnbHI1NFdYdnBP?=
 =?utf-8?B?TWhBdXRsbHpkOEFaQzdKUFVxWlFSQlNGZGxwV2t2NmE5UllVTWdTdnAzRXFj?=
 =?utf-8?B?VC9Eb2ZMTDVPTGM0OGM1YWpUNDZFUHcxWFJNVGZJYWNnQkI3dC9hclhKVG8y?=
 =?utf-8?B?UmQ3SjM3ZEcrdFQxdnB4QWhBU0QxK3FMMzZhNGRFZjlBV2hqZlZpSFlEUnlV?=
 =?utf-8?B?bHNXK3REbHMwQmMyWFd1a3pjSHh0NjNiMGk2SW5ZZVhaK3FPcC9la2s4emZE?=
 =?utf-8?B?RlJqcnNLeGJsVWhEdHJoTXZZeVJVWDEvZ2o3SHhvbTBZdHdUNlNwWjFKcnZW?=
 =?utf-8?B?c01aakw1dmZoSFBEOHR4RWFnbWFXcHVucS9QY1dEaEwycWsyWlYvS2Y3Rnpz?=
 =?utf-8?B?cVBUd09TL1hrNUJQa2t2NzZlYTRNZlFpdmd4aXpib2MzZjBCN0phNFdSblln?=
 =?utf-8?B?ek14VU5XQmJSbFprUnNveUpvVG9oZ1JCT0xpK3ZkMGd1V2w2a1JPRXB6TklN?=
 =?utf-8?B?NitwZUFUM3FHNVoyZ2Y0Q0dmSkVOaFJTMThXSUg0dE1CdGdYVTRtbEQxSFhL?=
 =?utf-8?B?YUJ4MEM5Ritsa0lvUFdRQ1BhbE43RnA5QzN3RWhBMGhpZEljR1VyRzVWQXlJ?=
 =?utf-8?B?dVVQR2Nkbml5L0YvcS9aTkhxZEkvVndlei8xeGx0MXduYktVMW1qUENzN2Js?=
 =?utf-8?B?TVZQb0FnZTB2WW5hSkxFREtoemFSUFdsYk1oNWpCVGR6V0Z6bVllRGFEclVX?=
 =?utf-8?B?WHZla2wycGtPRGo1OWtLRXI5YnJSLzllMkxTSWJpYmc1QXhZaWlMT0FURXVV?=
 =?utf-8?B?c1BBWjJSRVlwa2xzMVVMbHQ3VHhVdlN0dzBmTGp5eENWYnZHMkxrOC9IRFFH?=
 =?utf-8?B?aDVGNzc0VE9JQTVoU3QwTmNuTkFCRkZ2L0QxR1hMcUYrcEp4OWJMVXRkc3ln?=
 =?utf-8?B?bGZIMmRSWWdjQnNqTUIwS1cwY0h6dUFNcThSMXM2S2RJbjdnWGkwQjl3TTlm?=
 =?utf-8?B?bDJRYTRKY1VXZ2J5VElLWUpYQ2pOOUJPZ0J2eFJVMEZhYzFhS3MwMXBRRGFs?=
 =?utf-8?B?MmxqWGRZekxEVGxpTEdYWlRzS0N0UkRIelBqbWQ0ditzNXRvWmpaN2s3a3Ja?=
 =?utf-8?B?dk1OTm56UnBpOFlpY2ZsNTZ3TTZxSlY1OXRCemkzZXQrUTQvUkRRaW56Zm1D?=
 =?utf-8?B?Wks1QTJEREpTNmVsVDczZllUTFFsTG52NnJNUEZrLzE2YW9FRUEvaUpWYWJL?=
 =?utf-8?B?UXBlalJGRWNqYldtcVdsaWZza1lrc0lWNGViMTE3MTk4RTd6L0tZcHM5dTdO?=
 =?utf-8?B?OWlRK3Y0VzU2am85bWozMjB3Q0d5eVVPMGJ2TGpveitaYjVFVlVZZjlnV0Q1?=
 =?utf-8?B?ZUUyVWFNbzhwZUNveElUSnlpbllJMEl4TVZVMThpWFZCOEc4Sm1pazZXT1U5?=
 =?utf-8?B?aUVpR0puTzQrTlRaZGRDdHBIOWNUUDIzZWliOTlINGxtcmJPNmdWK1U1U1Vy?=
 =?utf-8?B?Mm1CSld2UVZlbjB4L1dzVE1PTXArd254azEvQisrRWZOb3p4UERxM1VnOGgr?=
 =?utf-8?B?TGdvZmhBK1hQTTAwMmpobStZTmVqdjk5cE5admFTL0tWNFZJU3JENGR2bVE2?=
 =?utf-8?B?eDNCZjlZWlArUWYxR1RlRFV5R1NkTi9NT1QwUDdJWkorcW5pVDYwWGdweXVZ?=
 =?utf-8?B?NVJCVld0VmluRHUyd1g4ME93QkJqRnMrb3drZkRIMnoyMVpKb2cwcG1EUWUx?=
 =?utf-8?B?WERYNi94M1krZENNa3d5K080NUZrOS9HOXR5c3J1S3QyM2FUSEF2OHF6Ukk5?=
 =?utf-8?Q?WlRY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXNzcWR2UXl5dFRCc1VJNms5VDh6YjZzSUJ6aGd0d3Q1eVBEQmFqRHNvbzE4?=
 =?utf-8?B?VjF2LytjeTgzZmVhV1p5OWhnUTUyQ3RuNWFXR1dGT3BZVmI2QWRsLzJ1clVR?=
 =?utf-8?B?a0hIWjdwZ2VjV2haakJ6SVFvTElzbEV2S3FhL2NZQkk0NjVSVWhNcEsreFpD?=
 =?utf-8?B?alozQlFwdDNaZ2N2d0VMTUFZb0lWd2J4QmNVbFJ3QXZVRDdUV0tSTXd4SUpo?=
 =?utf-8?B?ZGFhTnZiUHJvWWlwRmJ5TVA4SHNhVitqa0FmcGptem0wcVFHTFVveUFaaFhl?=
 =?utf-8?B?M04zb05WSVlHek9BVzU3MWN5RzJ3MU5mSUcxUWRSRTUvVlEvVW1UdnNDemRn?=
 =?utf-8?B?MEJIZk82MG1zOW5HOWhEUmVPaGxyc00zT0JFNFpET3dYdTZJaWRJNnVua3N1?=
 =?utf-8?B?WVA4K200eXZ5N0JpNFdsT3FQZm9LeElaaEZ6T0g5M0dDVmhjSkVDZC9NbXVW?=
 =?utf-8?B?YjRob1JQejFqRlBVTDZKYVY4YXo3OGhIeXVzRlprYXRreFZwS21ZQUdnQXRH?=
 =?utf-8?B?MkpnMUkyd2ZzMkI0UExUNFYrUXVEUW5SMktpdjBDQzRSV3Q3Y04vclZIa1l1?=
 =?utf-8?B?MVpQSzVrQW9SL1RURGkwNUxqOENFbFE2d0VyQS9KK1htV2xvbDFmZW91aWlV?=
 =?utf-8?B?OW5UZUt1UGdGVUE3TTNQTXNBZ2RucTgxczZDQ2hpdGdvVHQyQzJndmVJL3ZH?=
 =?utf-8?B?V1V5ZGNpekxHYmIzRktnSjl1eWRoR2NsM2ZXYUJsL3FPaittOFFvUVBvalpO?=
 =?utf-8?B?a25URDdkYnFpL3FpZXc4SUpGMVc5SjVtdGJSOUZBNGF1cC9mV3U5MXFjdjBW?=
 =?utf-8?B?R09NSXNQbS81bCtrbFkxSVFZZVV1OW8zTnkwRzNhaFpMRE1nbGRvUUJBaDUr?=
 =?utf-8?B?NlpQT0tFVnlhS2sxTEJQMmVmMHU1TnMyQkZHQmovTjVscGEwbC8rWlo1SFZX?=
 =?utf-8?B?R25tUDFFMlc1OCszRzYzeFQzVisxaDNzOHhwbGlFbmw2OUphaFV0N0lnUGdz?=
 =?utf-8?B?d1JNaExIVlM2QmJyMk9VQ3AxRlYraUp1ZjJVMmhxd2p5TGJrMm5YTy9HYlNL?=
 =?utf-8?B?dXBFL2JvMEw4dERVd0hSdThUSjd5UUxiQS9TQzdRcEszbUx5NisrQnZNMW5U?=
 =?utf-8?B?VzdudHd6VnVDVDF1RFF2SGVzSlNDV0Y2aTlzNFB5TDFYRkVpZG1wYWoxZ3FI?=
 =?utf-8?B?OU4yNzFHVFovTjU2TVVYVlc1VjJxWjZSZ0Y3dko1Y2xIMytmNHlMa3dYODRY?=
 =?utf-8?B?RjVYaWQzeFFTY3htOVY5d243aWVSdDlnNkRsY1BoTzdWaFVjVmk0YytQQVRY?=
 =?utf-8?B?YlBwSE5rZjJuVXRBeERWdE1yVmhPREJYdUtKSktIM05MQ2l5aW1JYVp2a2Rt?=
 =?utf-8?B?M0syaTcwL0dDeDZZVHBaRWZnZjBXcWtCWW1Dd3BTMkd0WWJMV055K3B2N0RZ?=
 =?utf-8?B?RDVwcUE3MFA5RHV6cjhzSVF3Z2pIVWJ0cW1KbStKNVJoMFFXa1FWL3h6Und1?=
 =?utf-8?B?SjdsclA2MmZpc0Zsdk1qZmNTckFLUjkyN2NLYThPYjJmTTI4bFU5TDdWVUd3?=
 =?utf-8?B?WU02c3QwZ0RUS3ErWUJ4ZW1OVk5hWmQ5NWJHOVNmMmdvK0YvVytLSFVmVjk1?=
 =?utf-8?B?YTh1T3pYVjZSQ2ZDaHNxc1RUVlZ1QmpkOUlITlcyWnQ5MSthOU9oalZrTUlU?=
 =?utf-8?B?bWE4R2Z3VllZSkhoNk1PRm1pYU9ZZHhZOUJuYW1udThCVmVtdDdZTWZPQXRE?=
 =?utf-8?B?bVMzeFFFNGgwZjdUOHc2TWlmVUVUcCsybjZQTFdQVlFkekZBVmhhS2JhVjdy?=
 =?utf-8?B?c2t5eE92c2Eva3ViWkZZaHpxRklyNFYvYUJZRGd4eFdsYnNGVEpTeEp1VDNM?=
 =?utf-8?B?Mm1Tc2RPcUhmblcza3g4VnRvYXo4WHlRbDFLMi94bG0vS0J6RlR6YlMwbEpY?=
 =?utf-8?B?VHhmTkkrYVh3VitlUkJkUXJUNGdnbXZ5ZndwS0xYRGtjTTY0alFITnhZZTA2?=
 =?utf-8?B?c1dCYWFpK0RzWWVueXVyZ1pHTlRNT2l0NHRNbWVkQ1pzYU9RczVWVnlKbFJK?=
 =?utf-8?B?eDM4TnFmeGFPUTVQOTVUMWFxMG9aRzZSS01LTGJkWGd6QmF0eittMzNRV3ZN?=
 =?utf-8?B?N1BaNi8zQkh2Q3NzOENteXlFenFVa1dKVEtYeVAyWjFuS0ZERHg1akJjVHdZ?=
 =?utf-8?B?UnZ2azVRNXpMa3F4MTNXN3JmeExKZUY1b0tEWkI4ODBMVVJrWlNwTnhidXhO?=
 =?utf-8?B?TnB6bFJhcEU3UFdoa1A0Rzh3UC90MWFwNXZRa1dmNGpTRmdnKzEwZTZrSmpo?=
 =?utf-8?B?V2hJRDJzUlNYV3FsRm05LzU2cmJqOVpIWFVxTnltS2MvdTNqeTZ6K3JLdWQ3?=
 =?utf-8?Q?u26AtDv/g1AqSTVE3PUmDiU+LXBXZ1y7aR9I+?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 748f3345-319f-4c8a-4ea8-08de5cecf520
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 15:09:52.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1zO/NN6QlUskgluQbdTuhGLCEuXUR/45+85IZ/brV//vgvPY5kONiZaX4pCRpSnrgmTMRJD7EmT26s1Zx/Gpgv6LXF3NCZP+2oWJXTFopQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12005
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jan 2026 15:10:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6873

Hi Denys,

On 1/26/26 3:56 PM, Denys Dmytriyenko wrote:
> On Mon, Jan 26, 2026 at 02:48:29PM +0100, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Hugues,
>>
>> On 1/21/26 3:03 PM, Hugues KAMBA MPIANA wrote:
>> [...]
>>> diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
>>> new file mode 100644
>>> index 00000000..8e64a636
>>> --- /dev/null
>>> +++ b/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
>>> @@ -0,0 +1,8 @@
>>> +require recipes-security/optee/optee-os.inc
>>> +
>>> +DEPENDS += "dtc-native"
>>> +
>>> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>>> +
>>
>> We don't need that line anymore as there are no in-tree patches for
>> optee-os anymore.
> 
> This is not a bbappend, but a standalone recipe, so the line is not needed
> even with local patches.
> 

Indeed, good catch.

> 
>>> +# 4.9.0
>>> +SRCREV = "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
>>> diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
>>> new file mode 100644
>>> index 00000000..ddb574fc
>>> --- /dev/null
>>> +++ b/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
>>> @@ -0,0 +1,14 @@
>>> +require recipes-security/optee/optee-test.inc
>>> +
>>> +# v4.9.0
>>> +SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
>>> +
>>> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
>>> +
>>
>> This isn't the actual license but a file pointing to other files. I
>> would suggest to add LICENSE-BSD and LICENSE-GPL as well so that we
>> can catch modifications to those files.
>>
>> I've checked all commit hashes, they match the tags.
>>
>> I've run `xtest` on Rockchip PX30, RK3399 and RK3588 and they all pass, so:
>>
>> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # xtest on
>> PX30, RK3399, RK3588
>>
>> We should probably think about also passing ;tag=${PV} to the
> 
> Will this require network connectivity every time the recipe is parsed to
> resolve the tag, even when you have a corresponding snapshot available
> locally?
> 

It used to, but not anymore as far as I understood. Many recipes in 
OE-Core now do have ;tag=${PV} in their SRC_URI and I would expect that 
the project doesn't require network access by default.

See commit d591d7633fe8 ("fetch/git: Rework tag parameter handling") in 
bitbake, available since Walnascar (5.2), which seems to hint that this 
is now possible.

This adds an additional check that the commit hash does really match the 
tag. If the tag moves, then new builds will fail and you'll know that 
something happened upstream and likely requires your attention.

Cheers,
Quentin

