Return-Path: <jan.kiszka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BE3C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 17:01:01 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102.1787850057476260097
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 10:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=RyVsIa9l;
 spf=pass (domain: siemens.com, ip: 52.101.70.60, mailfrom: jan.kiszka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kv7r2AYt3OGoHQwRi24mGVBNYAzL1WXMlwIwY844No46EtkB+ZB1DetwPQ0tRw8K4bcPe9DABfiaUMqClJ+Q0k7qZYEU+JeHiQ9wMXMRBgOhPI30VJALsDRgvZz3rek0azdnXjoCCmqouzH2/RkpxcI2EwcVZq30EOXWx4PVOhF5e+6vAdpdo4CU61BEseTNQF4mQ8y9HkCw6q+mllubvK/41muLs+TD5opfiCIyv12sXQmXdOubiHuGr9tjo2cKvhBRKchGBy5XtDN/fG0mmJM/m6KybQtzaTokprCqJBY2gFiMxgnMk7yzQlIDiheEN4FXUT3vXCC4wIxan/VvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB9UztP83pXn1KP0ndq2+UbmiNRFJ3UanuHZ5TELrp8=;
 b=dJwv2sxVnvJ0rnmgofq9epDdG2MD1qOtJ/lLc1QXgsjiU+a/Vp9U9hAB+jg7zBGa0jDPnP/+hoy20NuQpztCpWe+qqxr8/9q9KSf/emDRM8vVDob/cQkNwYOAU7Sy+xoxo2Ne8RI6bR3aavvWLoG2vNro6VgpidaCYejEHlAG4uTFabFgKA0SILXAdnDOTmNGDXz5kjA7ExS/CbmYwiDiM+jzb/FnvBnIJD1O1fOOSkJshs/ub8uHSaauDgGxw0JqKxVRK0VdAhsrm+SW69Hwyn982Il5GisDmDTnd9upFQeRpymoaY/mJcybOwZQw0F2FjPnuCXmD4WNZ4VDtChTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB9UztP83pXn1KP0ndq2+UbmiNRFJ3UanuHZ5TELrp8=;
 b=RyVsIa9lZeedUvBu4gnftDcfJdmcIWu42LwHgWfBy8OHErgZhpZRTBqsBXBKMvcTVQQ1D+NyGcjBwQOT20rVPsssEyJ/1PMh3HfKFQvdtO6lOt9ZmU0R7vXic72Lk9wiuQXUs79w0G2qNCmyaCk/Hf+GTX1ksy070mwNPEuZGAUzsCvTPXMWD54QMANJHpjKFebJWECXWb90rrr+e2bcnOKC9WQHatdAjtwjMhNXG2vTybhdmnP9O5EYvKgL7ednUDXWWmt0TAVaVSGzn2i2NeEeqaj4rOeGJ0fIys5y6tq54U3RmSimQLa7AhTKfxv/6fDpx5yLtYLc/8bQZIAOUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB9PR10MB9912.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:603::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 17:00:53 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%2]) with mapi id 15.21.0360.006; Thu, 27 Aug 2026
 17:00:53 +0000
Message-ID: <c3832035-67e3-4883-b420-771a9d074c34@siemens.com>
Date: Thu, 27 Aug 2026 19:00:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] optee-ftpm: rewrite its optee-os bbappend to use
 EARLY_TA_PATHS bitbake variable
To: Rasmus Villemoes <ravi@prevas.dk>, meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Jan Luebbe <jlu@pengutronix.de>
References: <20260827133720.3246210-1-ravi@prevas.dk>
 <20260827133720.3246210-2-ravi@prevas.dk>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <20260827133720.3246210-2-ravi@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::17) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB9PR10MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 8032ba0f-547c-4c60-7a62-08df045cc0d7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|4143699003|5023799004|11063799006|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iAR3UDDa7EtSvD/JYNjCxeUqGSSgTD9m+rXoEGxbKJoXyShUtmvb+I9O4gV+JWIEVk8MjX9YsDrsUIGRD8wsyxC/hAUzSaWSiR4M7I6kNwCUvkvu4tcZibdCYPtvqALiGM1CO+VSTPvkKRXPA9dypOTqeXu0joWGmxzxXOYLLOfP64VemEoVXrjPMinnzQ2sIxFcD9Ido3Nl6UGk+WtJ7xGDf+oAutEUwcgCAmF1ywg30FqaY/JRCHfJdBuYBHS+iGUfGQIkJpNTrSTRgv7SLjAe3zOL4eo03+oYmh/zLRLNTe5oWiYYsW60GrfiyFbgIqnLiD/0bGIzaY7dEZqWp/eEKQcd5qiZCYfwJ9Q//FLwANd9E76rCbjOKEOTiLE9a6Q9/ZtVU9AFVtdv5WF4B++aP9IZRk7f6fpuc+tID1GKmCVZOSIvdU89XIuCJQ/NZUiKtGishJoaGu18mLZb3Lg6Ic3NPFFCm+eu/q13oNDzo4nWkHWeCcaK+ZRGUTKooSAoNeHhZaPDQnvxBDwZZnr0tzllThimTx9H7auSBsLEkHrTErjPmkOO+mbZpE3mE5fBNg20C/IEutXCzoaF3gEd0GZxHdzFD+jTTOVkBUTz3qox5yYaQiJ7YICHu6F3iXzaKDSUL5KPI3/L4hkHcxGJf3p5s/mzI4Kg+iDbYFM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WklxaWRIVDg2b0piOEVPbHBXM2ErMElXK3o0NGFTL0hFYkR5QTNjS0hpS0pn?=
 =?utf-8?B?eWJiTWJCZkRESWRnNGIveEY2d2IwT1dabURxdEV1VXdaejlPOEJWczVKd3NB?=
 =?utf-8?B?WUV3bmJDVFBERkgwWkhmN3RDSG5ObTF5c21jN3pXb0VXbTAyS3lJNlp4ZWhS?=
 =?utf-8?B?SFFwOUIzdVpoNWZhK2xrL1JBRmh1SnZENUR6eDJjVEhwOWZHQm5oRzRuc2dt?=
 =?utf-8?B?ODFaTVFOb2NQVllXanJqeW5tUk01dmx3d1RWdldFSU4yNFpoN3lIZjF1aGdv?=
 =?utf-8?B?enppaHlsaFF3ZlVRUnF4MitPWEtSYkt4R3hrMzlBS3BEUUd5YmpFaW54dGts?=
 =?utf-8?B?b3d1WVIrTHZVbnh6UnlRRTU0ZmtsM3liY2RyZUtJeUtHRUtMaEZnQ3VtWmI2?=
 =?utf-8?B?Q2FIYVJSQTR1cVFBVXIyUVpPOU0yMC9id0hZaElaMllHQjQ1cmZka2ZGVzlZ?=
 =?utf-8?B?SytDMjdNZW5icFUzKzlzcHBjaEI0RG5ibndFTk12YnR3L2hLM2FuQXFwcTZu?=
 =?utf-8?B?TUx6dzgyUWtiUGtHMCt1bmROOVlTVktrdEo2NlZMdDlsajZZQnNwTkNGay9J?=
 =?utf-8?B?OU1oSk5NUndaTmJ6czlEdERmWTNqNnFKU1FpN1cxc0hrR0p1WEdyc0pRRWFl?=
 =?utf-8?B?aEdHSkxTbEkzRW53VEVIT1FQV2NJU0E2QWJZanpFcm0zZ2N0aU9sL3E1ODFz?=
 =?utf-8?B?aTdiWHd1UVVVSGZzUGRZNnUrcm1EQUUwVkp4SlFhRlNnMytGRGhyZzdIa2NS?=
 =?utf-8?B?eCtONmZRWXFZc1p0NmJEdG9DZENMbEJ2bS9UOUxjMXdvb2dva2xyN2RVbnY0?=
 =?utf-8?B?T0F6c2pOSzNPUWRjb09iVVJwaXdPUDF5d25qa3Y4U3hzMUpaU1V0NE5wL1or?=
 =?utf-8?B?NWdzeXF6RlllRmg5RmF1VDlid2dUaURvZk5ORDJxRlVrS2RDMThRK0V6UjJO?=
 =?utf-8?B?NXJnMmYyRWFZSlBMcjVybzlBbmczU2tGb3FOUFcwRnFuVkd5c2syeWxsamlS?=
 =?utf-8?B?U1VnMThmNDlIMDVSK01QWi9HUEZPMkp0YWVIUTd0a2VUa0ovdWdCS0dpNkFQ?=
 =?utf-8?B?NC9zWjlVVFNxekJ5bUkrSlRCY05uTk02WU9vOEVxbVVzVjhjUThPYi9tL3Fi?=
 =?utf-8?B?U3cxM1h2ZWJEV3BjVWZHaGMveFpyRVZWWUtSM0ZhZG5KMHJOOE4zSTVlRENL?=
 =?utf-8?B?VC9obG1jRXd1YzVZTjJ5SFc3QmFzTFNRaisySnFLRkh5Q0xPMVNmZkFtN29J?=
 =?utf-8?B?M0hBYzNaLy9iUHBLUzlsNlB2QzRYdFB3eVhUcy83VE83V1c0WDNMcCs1NXIr?=
 =?utf-8?B?YStHeFJ0YW9RbXRtOFlBZ3A1WWRtT3BUY3ZWcDZzNkR1V0hLbm1qV3BPV082?=
 =?utf-8?B?TVVmeWplT1VNWFlIb0gya1NuZ2FKNGIwbFZ5TkZUQmF6c0RMOXpwSVJlcHZo?=
 =?utf-8?B?S1R5bHZqd3k4MU1aenZJUkxXM0owZWVKeDJpRE9QbXIvKzFrSmdvampYd1lH?=
 =?utf-8?B?b2FZWElSSU41UTI2MUxWOHZsbXIrQ2VpQ2ZTc0Y0YUVXK1crc1B6K2lEVm0w?=
 =?utf-8?B?MzJkZG9lb2xNS2dhMC9sTmQ3cERKZWxTd0trRE5raTVpWTBoQlhwZ3IxTkRa?=
 =?utf-8?B?azJOZ2ZrRytlTUFkNHFpTzJhK2pnaHh1cEdIVTRWcThISVhFS2VUS0Z4TFox?=
 =?utf-8?B?NjdNV2tZaGhHb3IySzdzMnk0S0xKMGpGWFFWdXFhS0NoNTV1TXo5ZU9iM3dY?=
 =?utf-8?B?MTlQVGJjU1lqaFN0Y0NBRno1YTRSNUM0d1NVeEU1TmRzNnhPYmUwanVlUnpB?=
 =?utf-8?B?Sy9wQTUxVitpNnAvZ3lBVUxFTCtNVWVYa1dKaEt4M1lwTEhWRFY4dDdoM3ph?=
 =?utf-8?B?OVVJTmNIQnFIQmZaS2o1UUdiRnJZN2hwK3ZJVVVTbk1pRnJhWnZPOFBrZ0NK?=
 =?utf-8?B?Mzh4V3lkcVVJdU5zb1hWMVJUR3BvdjB1ejNDOU1LczZFT3NCQUhMbFJmc3pk?=
 =?utf-8?B?UnMyT0ZNMVJnbEFKakl1bEpSMTR0UEJxOEVBQklydzFwVlRvVld4Vk1vSEwx?=
 =?utf-8?B?Zkl4NU9jbEVRK3dWcFE3aHFNeGJxR0xCamt2OXhlMGFhNXRyYkR0aXlESTdB?=
 =?utf-8?B?TVhLWmNMMXZ1b0tGb05IZVZmK0EvRjhTcjlpbUovOFZJbGFOeUFoazZ2KzJP?=
 =?utf-8?B?VEdLS0FmRUR3akhqREJEZlljNTJYNFNQaTZJbzdFR1dvbzMwdGl3RlpzVi9N?=
 =?utf-8?B?a1RxOFl6aGFlcjVWUERDbzJZWmxxcy96QW5CTzBSR29rRG5kYlYxajBzSFc2?=
 =?utf-8?B?eEo5KzBuTFdURCsyMWgrWjJxeDZ6RGM1Znh3VWEraDdTaysrOWNwQT09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8032ba0f-547c-4c60-7a62-08df045cc0d7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:00:53.0005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8WLOXsHTK0qo0HA89cN9lHixcjh7BUMUL4rxRycdCetCm92YJfNn7NLufW6ZnGBV3avGRq0sLxCzVYjvDmIdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB9912
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Aug 2026 17:01:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7147

On 27.08.26 15:37, Rasmus Villemoes wrote:
> From: Rasmus Villemoes <ravi@prevas.dk>
> 
> If anything else in the BSP also wants or needs to add an early TA to
> optee, that will conflict with this .bbappend adding its own
> EARLY_TA_PATHS="..." argument to EXTRA_OEMAKE.
> 
> Instead, add the path to the ftpm TA to the newly introduced
> EARLY_TA_PATHS bitbake variable, which the main recipe will use to
> produce the make argument.
> 
> Passing CFG_EARLY_TA=y explicitly is not needed, as optee-os' build
> system sets that automatically if the EARLY_TA_PATHS list is
> non-empty.
> 
> CFG_CORE_HEAP_SIZE is somewhat harder to make play along nicely with
> other .bbappends that might have an opinion on its proper (minimum)
> value. For now, keep adding it explicitly to EXTRA_OEMAKE.
> 
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> ---
>  .../recipes-security/optee-ftpm/optee-os_%.bbappend    | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> index 92c11157..74bde25e 100644
> --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
> @@ -4,8 +4,8 @@ DEPENDS:append = "\
>      ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'optee-ftpm', '' , d)} \
>  "
>  
> -EXTRA_OEMAKE:append = "\
> -    ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
> -        'CFG_CORE_HEAP_SIZE=131072 CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"', \
> -        '', d)} \
> -"
> +python() {
> +    if bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', True, False, d):
> +        d.appendVar('EARLY_TA_PATHS', ' ${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf')
> +        d.appendVar('EXTRA_OEMAKE', ' CFG_CORE_HEAP_SIZE=131072')
> +}

Both patches look good to me, but I currently have no nothing in place 
to test.

Also good to know that CFG_EARLY_TA=y can be dropped - I have it 
elsewhere redundantly in use as well.

In case you are currently using optee_ftpm, I hope you are aware that
this layer probably needs more updates. See [1] and [2] for what we did 
in isar-cip-core to update the TPM core and add recent CVE fixes. If all 
goes well, at least optee_ftpm patch will become part of the next optee 
release. But there is more.

Jan

[1] https://gitlab.com/cip-project/cip-core/isar-cip-core/-/commit/d233084880dffef3fd5037b3159c88e3b35259ac
[2] https://gitlab.com/cip-project/cip-core/isar-cip-core/-/commit/77f75df8c69868f335ffa36f671fe06b1f983247

-- 
Siemens AG, Foundational Technologies
Linux Expert Center

