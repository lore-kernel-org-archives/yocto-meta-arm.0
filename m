Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC7DD26D85
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:30:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16858.1767983443794957538
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ZcklTWgv;
 spf=pass (domain: cherry.de, ip: 52.101.70.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+DfVDRunHqzWEfzLBiZ4i3ad5/pxqsF5RBzFEYwc+r4EKZU+QrcfMFoGrXyYPqIyhVl6HnzIMdKDEUEiFMCHJ7NjYKux2ot1CSIH34sgDRUhFk0PJQpdJcZSIJOvET9aSYB6FJwTKokzl5A442XBrm+IOiBwy5q8I2fGSzX/YGI2NwO7O/yz0dBq6Kw/NJRoA5HHz/2AGKNTyTf/4qtL8QsnzV0B2K3G2gbexZBIXUWA5Vauf2d6b+FjBMGEWJ5bhH/QMsf0YFaTRPIFi4qTJTwldKCQAXVE7709q8AWaW+pN51dvKJpb5HwuhQnNaPiTGWA0mVbhvM4DKi0JLs0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qKTldN3n8G/4zDHOmNI1aQgj2Hm69ceXfbPE0BqMnw=;
 b=O2t5zrhso2z/f+XbM7wjobnP9iz0Cu30+eOs7sgSIsRDoYt//3blSYQhoK7OCDDnVlmO6Li1RC1J4e5YQVMxsOGn1NALaPPisbqqADUoyIr9pMTnokg9TZpgE3703X4bZiZBJqKyTy5nAysol5iCXgNZEwxhGmAPBjxymqW2jNetUgxvuB3UrP9sxg3LMFD6GIkoZ+TTtHQ2pFjX/y+ALqJmvVXv0nC359ZZ00RpgO+4eGVXzvGKjSWIH89wjCRyxNCRk/l36oPKEsSEoD4SKhoxPKEYaeUhWmihnR7R9FLssFyHLP1SL84MhKIE5Gk7k7JjeTNASe2m2BWxSRQYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qKTldN3n8G/4zDHOmNI1aQgj2Hm69ceXfbPE0BqMnw=;
 b=ZcklTWgvvhDbEjgkp/41IvUiICcgkHg89TzdFilAzQbXq5E/l1WhIUTGzQE3JdM1CcxAHm8um6eHcUBETrPEdTkmjmVxC2tMEftjs07NIfeunsVCAs1nwLz6lWJb5ws1saWy8c40SXWNvx06RlSTgp4RsuiTM86YXZC/jbetSCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 18:30:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 18:30:39 +0000
Message-ID: <28377373-a3e8-4416-aa7f-488cdfdbcf55@cherry.de>
Date: Fri, 9 Jan 2026 19:30:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in TF-A installed/deployed artifacts
To: Peter Hoyes <peter.hoyes@arm.com>, meta-arm@lists.yoctoproject.org
Cc: Trevor Woerner <twoerner@gmail.com>
References: <4d7e8527-be0e-48e1-bc96-fbd64ae1ac5f@cherry.de>
 <c2617697-0407-494e-bb1f-9f586608c808@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <c2617697-0407-494e-bb1f-9f586608c808@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:803:14::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cec719d-e3d0-4b6a-361e-08de4fad3090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVVSeGpFMFJUcy9sMGJhTXhJRkxwM2FTT2RlYjZxQTVyTGJVVXkyaWhTSG9Z?=
 =?utf-8?B?YWFJdlJxSVhBSFNWL1lxbWtmc0xaTStXdzlPWWVWMGFCbjA3SklKNWM1NDh6?=
 =?utf-8?B?NDhVSFVGUE9BZlhGanNMeTFCdkYxTUhyZ1dhNXVoK1ZNWmNVNmE5ZnIwVU1U?=
 =?utf-8?B?VkIxejgrV2ZBMlpxY1k1dFlXcE5uQVhhWEprRU1vSmhwd09waFA5Qm5PUTla?=
 =?utf-8?B?bW1KYXNVbGw0VG1XSzlxYlhmRzdDK1owdmhnTVZXeEl2aHdJNkhIMFFBbVRS?=
 =?utf-8?B?d0t5VkI1YnVCbERZZzM3OHgxZ2NYbGtMSDYzVEpSdEdrVmhsb1p0SnRUWC9X?=
 =?utf-8?B?ZmNlNENaYmlmZWJsenRPNTRhaXNCV2hBL0tqVWFWVEUwWllpOUovWkxPSFZ0?=
 =?utf-8?B?SzJKcDVNdE92dk9iY1RuWE9xTDdFZTI2V1k2QVRRUkdGenhYaCtCZXJ2SG5Z?=
 =?utf-8?B?NDlPL0pTV09Pd3VCK2ZCakUvVFNNbnNLTllsU2EvY05YbkpIUUlVcXhEd0lv?=
 =?utf-8?B?VXZlblo3RVY5RlZmbXhHNndoOTJDMHhyTjdDcnpXcnYxRjd2cmd6UXhyY2xo?=
 =?utf-8?B?aHJKb3huZGRnTmxwaklmNW9BSDZ6TzBlY1ZCMmgrblZ2T1h6dC9CTEJvdEYw?=
 =?utf-8?B?OEtSYnRSTU5LQWJ3RzBaL2l1T2lTUkdzTDdlaGR2UHN0VzlZVlAxdUQ1eStk?=
 =?utf-8?B?Qk5DVGVGVTgwN3l4dk1wL2V2cHAxeTlpOURLeDhRWmpvSUo1OUlDd0d3SFdj?=
 =?utf-8?B?Z0hkZEF6b1pBM0t4S3BCWHptcWVZTFFWczJIemVuZ2NRUDhOSWZOSzI4eEx0?=
 =?utf-8?B?SHEwQXJLZ1R6RFFLK2lIbUo3dEhVOURJM2xkdTN1aXN5UTZuSlVQanIzVW5j?=
 =?utf-8?B?bVowRGtnSXFHUU9wK0pYQzByam1XdUtmS0oyOVRhVkZDd1oyUUEyVUcvd21J?=
 =?utf-8?B?b2lvVGNqM3lZZ3c5SnMwdnNJNGZadGhqVXhsL0tEdW10SjFHR1ZpOFdLMFZz?=
 =?utf-8?B?Tk1IRHorTjlNMVR5OWg1a25YVHZSZWZwN21RQWUxSk9CWEtuVHl5N1lySjBP?=
 =?utf-8?B?UUdraHRkZXdFaHFHV1gvTnh2cHpHUjQycmtzVGF1QmRnWnlYRnJmUFVhdzJk?=
 =?utf-8?B?Ky9waDk0czUrMEZzejFycUcvandSdjd4eVB0dmJpUWFEajVObEI5LzI2WndP?=
 =?utf-8?B?WTBIUDI5dkNOa3Z3aEtGS2EzcFVOMlk3dC9rR3hqS1JPVEM0SExNdnl2MnhQ?=
 =?utf-8?B?ditDSzJPZ1h6NEhnOG1nZjR5TzRuMk03bWNLbXJWelRtdXUxMVcxeXFMaFlX?=
 =?utf-8?B?aVY3K3IyeFhrWU4vUnZIeHY3eklzU01vK2FoUWowT3g0YUtaeExzQVNRaXVs?=
 =?utf-8?B?YWJtWU1iQldoMjNiakY0S0JJRUpVR0gvQnVlUkFtWFpEUHJzK3pQSUx0K0V1?=
 =?utf-8?B?eVByOVRoTFpoTWtETk43OHpBV0tMS04vaUhFMXVqa2Z5WHNrZC9zZ3RsTkQ1?=
 =?utf-8?B?L1IwSkhib1IzYjZtYSszdEdxaVVna3FaNG01WGx5NFZhanZSMjAwSjQvaTdV?=
 =?utf-8?B?azcrZ3dwOGtwdjZKZGJucSsxQ1pLTTlpV01RdG1zZm9HbUdkTTJ3UDZOUUtZ?=
 =?utf-8?B?ZlJyeW5tSXhVL3BzYjc5bExWcFpFYlp6ZGFsOVd6N2VvNTA5UHc5ZHhrQnVH?=
 =?utf-8?B?UzBVT3R1Vm1qcWxrU2hRR3pBU1RlWXN3amVkS3poM0JQOEhlY1U4M05CWGVr?=
 =?utf-8?B?Vy9QTy80eldpa1J6K0hKb2gvSGFOMFJ1TlJLN2p5cVQ3MDdpOWY1bVJwKzJU?=
 =?utf-8?B?Y0NsSUtGOWtjMCtsSE1hY0wyTG45clhjekV6YVNYaWd3dFYzbkpvSXBKOFdv?=
 =?utf-8?B?SXc0WVJaTzlZVkpqdmJmNW9ZZmRvNlErdVIwVXl1TUpzZjJIcUN2TTZrdjZ3?=
 =?utf-8?Q?fK4CFrtiqTrzcYVAMb5S3QOGmypSJIMF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkVKVU1vSEM4Y05ZQ2J3d1BzZnNLRnQ2QlpLb2NaWm02R2FXRExubzBLWW5B?=
 =?utf-8?B?MzlIYlpGTWZCVHgyZTYzbDFlOE5JaldCNTh2aTAydUVtbFBEQm1uWmpnZG5w?=
 =?utf-8?B?Z3JLNmQ1eUxQTGdTVW8yRGlCQlhwOFkrSHoxVi8waG45MCtmSTFiVVBwbjVi?=
 =?utf-8?B?MXFzSlFmbkJocjdsblVjellQcVNRNjFmZHZTbXNSOUJNTHFDSnU2OEYySmN5?=
 =?utf-8?B?dWJMY0NVMDlWNklGMHg2V3BtZE5aUWFmUmhSUzNBMStRU21JdnpFbHAyc3Aw?=
 =?utf-8?B?bVJFUDl5MkhUdG9xR1kxRktMNWMyS0MyUmYxNXQyd1dVL29SWm4xVkVIek1z?=
 =?utf-8?B?c2krZlNyZUdSb2c2ckc0UVhrNi95NWNmNU82TnVHYmRkSU82aUNWYk9JVVJh?=
 =?utf-8?B?WHFrV2Z0TmRFYkY2cVREMDhVaFQyalphZWJIOVRWZGwvMDJwY2gvMkFjM004?=
 =?utf-8?B?b2F6T0tZUTdhQzEvKzgrYmdQNFhTR0FiM0hTMjFnMnFjMkJpekt5R09IdERs?=
 =?utf-8?B?aUdFYXlBMkJkc3I4aG1PUjE0eGFvaExjeXdHZkU3NjdhbTR6N3pvU3NHdjBt?=
 =?utf-8?B?YkpneS95Q2pMdHJ5aW5UWEhNNGMzUXNLeTJReEs2cU11UUFEb29KaEpqWFBY?=
 =?utf-8?B?NlJ4ck5MTXBaSlFnRFM5SW9iUi90dTNid0pyWG8yMGFUL0cyMWNHcURPT0FB?=
 =?utf-8?B?Y0MzNENOSE1LRUhTUzl2VUY2MmlzYVowclBXdm4wTnU3RGkySGlKN3o4RmQ2?=
 =?utf-8?B?Q29sdmpoM0F6ekM5YVZ6cmtTMXNQZTIvNEU5Z0tOczJXOHZRYm5GWnpMdTZC?=
 =?utf-8?B?MWl6TDhvQUh0TmxPQXdTaWczeDJKam9FaG5ydzh2c2gyNnZnZ1FlbUhDbnNl?=
 =?utf-8?B?T2xSNE5NV0VHTmpxU0NxVEQ4NjdxeDF0WWNYS3NhT2lrMnhwZTFJbXpzSXRE?=
 =?utf-8?B?U2pnVDNJWG0zVFF3N2d5OEtaSUJDN3RRTURYNHlMM1gyQmtWcWJDQ0w1bWR1?=
 =?utf-8?B?SFFQMm5uOVdHbG9VNXp1ZGY2elMyRFlUK3lWbjNEWEc3U3dYeU9wRGplZ3NB?=
 =?utf-8?B?Y25iQmdXOXFSS3JuNm8vRzB3UU1HemIwYXhKZkZVT01Vdk5QOWxRNXNCdHFM?=
 =?utf-8?B?akcwY0QzalZTcjZYTklDb3ZObDFnUlo5M0NBQk9TMnoyYTNQcFA0OEdsOFVR?=
 =?utf-8?B?ZWVFTVhCR3RjT3VockpyZi94SGRTUkgrdWJpdEVrbW1HWjhIRUh4Q0g4R1Zm?=
 =?utf-8?B?Q29oQ2VNam54cDl1UzQ1bk5qaHFZWkZOcXE0L1Fld3c5czI4Vk9kUXBpaHla?=
 =?utf-8?B?WmwrWVNkR3UyVGw5SHhvZWx6aGo4c1lwQTZGZThsbStTK2tRRWlTSXVqZHhG?=
 =?utf-8?B?djU3NUxTNGRocHB1c1FaVTJrQUMzcU5UaXo0VENhR1haQ3BHMzlBU3d5bWpD?=
 =?utf-8?B?S2ZrYno3R0JURTV6dlB6RkxiY2V1Z2NYYVJHWC8xV0FncVdsMVlmci82U3JW?=
 =?utf-8?B?NGRuU0w3cDYyRmZZMytWYytjN0tocUdDWWwvenJTQlJPQ2I4NUZyRkJodjEv?=
 =?utf-8?B?OWY4U1B3RzlRaWpacW9YY3drY2toNnFsRGRROVhINnRyRUEzZ0FuRlRCNWdR?=
 =?utf-8?B?US9rZnpwOCtoczhjVWxuckRsK0NIOGlnak5FT3NiVjQ4R3lDZmdHSHVRZzk2?=
 =?utf-8?B?ZTNheHpINXYvK0VPYVpVb25YTCtyVTJVVmhLdWhkS3pCSkVIUk1qbVNTWHlV?=
 =?utf-8?B?VGFlSnZmeGVhM2J3WjZyS2M4TS90THZMdmIvejJzL2htcForOEpnWlFBR3Fk?=
 =?utf-8?B?SHRUaUUxSGRMNTlTUnFMVkRFTGZqYWhLSUxaVndVRlR0SVBQbkw5enFzUXV4?=
 =?utf-8?B?cHdqdURNWHlwUkFDSW1KbHFKdU8xcHVlUyt1UVVoR2JXZHFCMGZkQlgrMUhw?=
 =?utf-8?B?NG1STXkwN0VuNkpTOEJPaVJRN0duWGxncEFlY2Q3bnkwNklPZkVxcXVuKzdX?=
 =?utf-8?B?bk5FUEZYT09pa2VoMXVseHFsTFQ2b1BlQWdIU2VwQU9qY3A5MUJUcEwxc1c1?=
 =?utf-8?B?cHBGejg0OFBWSS96VlR6Rk9YcGFUZnNMY21zRnZrODM5Ui92TnVlam85aHNo?=
 =?utf-8?B?Uk1CcWo4cnFSSElud1AvdldGaDRhelhJVXppOUk1Vm93WkV0OVd6NjAya0k2?=
 =?utf-8?B?eHhGMXhXUDgxM2RFUjhLSzlGU1pKaEV3bFc4WHRtYzFFWlhMMFJhd3YxYTQz?=
 =?utf-8?B?blYrMlNvRjhyUERLRTI5cUdadnY4YVJNRDFsMnRUL3FzVFZDaDdhZnJtMldQ?=
 =?utf-8?B?Ykt0ajRubG5GMDdZSW1QQ01MTXJHNVZtUTRIWFh0WDNCeDhFaCtDTkxLM3pE?=
 =?utf-8?Q?XCnBK6MmQlbn4uz0=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cec719d-e3d0-4b6a-361e-08de4fad3090
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:30:39.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2eAILGO/pmHPABXDGdZ8BsOC7rwUUS1v6Y5KecnCGYArSkdi5f9N7HvpDNg9jck0UGkuo79jf28FF1h3qrNbUvEi/NthESj85dPDvPn4jig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:30:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6829

Hi Peter,

Thanks for the prompt answer :)

On 1/9/26 6:52 PM, Peter Hoyes wrote:
> Hi Quentin,
> 
> On 1/9/26 15:27, Quentin Schulz wrote:
>> Hi,
>>
>> I believe there's been a regression since commit 7bce36a2c64b ("arm/ 
>> trusted-firmware-a: Use firmware.bbclass") where the installed name 
>> isn't bl31-<platform>.elf anymore, but simply bl31.elf.
>>
>> This commit removed -${TFA_PLATFORM} from the installed firmware 
>> filename (and the symlink). The commit log seems to hint that this was 
>> intended "Drop the redundant ${TFA_PLATFORM} suffixes."... which isn't?
>>
>> Changing TFA_INSTALL_SUFFIX to the value of TFA_PLATFORM (it currently 
>> is the empty string) would help with that but then you either have 
>> bl31.elf or bl31-rk3399.elf (for example). I don't mind about that, 
>> but still odd to remove a symlink.
> 
> The changes are intentional and mainly motivated by the fact that we now 
> have TF-M, TF-A and sometimes SCP-firmware all putting files in 
> DEPLOY_DIR_IMAGE with similar filenames (bl1.bin, bl2.bin etc) and it 
> was getting quite confusing for people to know which binaries originate 
> from which project. So I felt that some sort of additional namespacing 
> was needed.
> 
> The ${TFA_PLATFORM} redundancy comment relates to the whole filename - 
> tmp/deploy/images/rk3568/trusted-firmware-a/bl31.bin is already 
> guaranteed not to clash with tmp/deploy/images/rk3566/trusted-firmware- 
> a/bl31.bin if you are sharing TMPDIRs.
> 

Indeed. It wasn't clear from the commit log what you were talking about, 
thanks for explaining. I sometimes forget the deploydir is 
machine-specific as I've been bitten in the past by different images 
stepping on each other's toes. Not an issue for TF-A as this isn't 
image-specific :)

>> meta-rockchip has support for TF-A binary blobs from Rockchip, which 
>> we do name bl31-rk3399.elf and since this filename needs to be 
>> consistent between upstream tf-a and blob tf-a (and we cannot modify 
>> U-Boot's BL31 variable from TF-A's recipe due to variable scope), this 
>> broke builds of meta-rockchip and forced the following (yet 
>> incomplete) band-aid patch https:// 
>> eur02.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fgit.yoctoproject.org%2Fmeta- 
>> rockchip%2Fcommit%2F%3Fid%3D2a13a49da4af4487ee71db6aff19364220da694a&data=05%7C02%7Cquentin.schulz%40cherry.de%7C0373d36d1ba14647cfed08de4fa80e79%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639035780376094222%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=qVjkKpHFgYhWnTPwyKJW%2BiwCnU2hinm1s%2F7zOhpHg68%3D&reserved=0. I'm now trying to figure out how to properly fix that.
>>
>> Additionally, the binaries are now forced into a subdirectory named 
>> after the recipe (see do_deploy in firmware.bbclass) and cannot be 
>> modified. So I need to patch our TF-A blob recipe to install in the 
>> identically named directory (that is, trusted-firmware-a/) so that U- 
>> Boot can find the binary named the same in the same location 
>> regardless of the kind of TF-A we're building. It does feel kinda 
>> wrong doing that.
> 
> This would be my suggestion. Looking at u-boot-rockchip.inc, this might 
> simplify the logic there as you no longer need to handle machine- 
> specific differences between ${SOC_FAMILY} - it'll always be just 
> "${DEPLOY_DIR_IMAGE}/trusted-firmware-a/bl31.elf"?
> 

Yeah, I don't know the historical reasons for going with the SoC family 
in the filename in meta-rockchip. It seems like it's coming from 
d26980364900 ("Use TF-A recipe from meta-arm") in meta-rockchip, maybe 
bl31-TFA_PLATFORM.elf was the only file deployed by meta-arm back then. 
In a way, it makes it explicit that if you have a bl31-rk3568.elf for an 
RK3399-based board, something's gone awfully wrong :)

> I could add a variable to firmware.bbclass (say, FIRMWARE_INSTALL_DIR ?= 
> "${PN}") so that the subdirectory can be customized from the recipe?
> 

I'll let Trevor (maintainer of meta-rockchip) speak his mind if he wants 
to, but considering someone will need to patch rockchip-rkbin-tf-a in 
any case, at first glance I don't mind if it's in a subdir. After all, 
*we* control where we can put rockchip-rkbin-tf-a's blob, and it can be 
in a trusted-firmware-a/ directory :)

On another topic, I'm not sure we actually support using upstream OP-TEE 
OS in meta-rockchip (I don't see a TEE=/path/to/bl32.bin mentioned 
anywhere in the code; and Rockchip's blob won't work with upstream 
U-Boot AFAIR), something I maybe should be looking into. You do also 
have a subdir for OP-TEE OS so a similar logic should be followed. /me 
thinks.

I'm inclined to say that nothing needs to be done from meta-arm's side 
and we shall fix things up in meta-rockchip.

Thanks again for the prompt answer and the explanations.

I'll look into patches for meta-rockchip next week if I don't forget.

Have a nice weekend,
Cheers,
Quentin

> Thanks,
> 
> Peter
> 
> 


