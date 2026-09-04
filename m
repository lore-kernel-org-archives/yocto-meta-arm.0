Return-Path: <jan.kiszka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A482EC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:47:30 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10375.1788515246472162130
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Sep 2026 02:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=JL0pLMDP;
 spf=pass (domain: siemens.com, ip: 52.101.72.49, mailfrom: jan.kiszka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVy+77BhsjqRBpoThV5CDMJOnxnVP1PtdOLbhQw/ktrImCyUaMbIEm3bdN+je50qqv+WNZn5KZwwndfb7WYZTNGbAGdOOJwq5irJbans3+OAnzHvfYtcbnP3hccMeJw6Xg42YOC1/VnPSxd6JvOGZ3atJ1cvKfkDlVIK+q2RHbmFMRmaJQe4rtKIdxF6lr2S4PQZYEbLW/9RrQLpzu1MZktwXE0rPNYR1XvlQXzZoIKcWSApUCGNe1lznwJYgYddTzl+PvjquRKRI/Us5qHRnPhm68QcHwkMTd88F1WHULRlyi59dP63nS4V+9p9g6zevgij5Uabu5afn5Xj/hKSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ja8O65u2B7aO8XSwpNY5zSQ/P0v/TMSatcjynrYn1g=;
 b=eOtWm4IXOlsFhP/mg07WRWtgb53vPnbiFFYDDz5A87t3yM9R5ptNWq82oWHD+MhdWGYOPKxS0JJmrNIcJNIVa9xN0NjxSmAUntLahiZoBnYx2b7UBBi6dflk5N4WPUdWaYMaKiY86lhsYTI25IaAlrJ4tvhwOoi2BWu77467jfyvvjlMBhepmvCSFM3gH5gn5noLjEC646nUWntwsCW6q4O1M3A7VMQDC++Kes/pvwUax577gL5jnMYd6y7eLVbjx9587sC5TI9X0n8C5WwJPFQNye/Lju46UDvrQcV89NwRMVgv55ejIpfPiCJ/7PsN/s0z2viIZTt15CFAeDJnXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ja8O65u2B7aO8XSwpNY5zSQ/P0v/TMSatcjynrYn1g=;
 b=JL0pLMDPjDNwG6WAA9L3CbVFlDKv0TymlIy/tVEYkxRibdGViKEKb0UQD1L8MYPVlNsvNoOXFSsMuF/tHattX6SwFJMr6gGdLjMFLlR/fvur5K/5VsUez2SRIamzV2RHQeZ+4hIUGFGyP8gBRx1KWjAS/lvsw4lRNfyG0tanS5pmMRvLOjP1P2nlQCly7upykVLwYs51r8ZWiglkWc+QzUH02RqiG47v02p+Vfpq/ykUyJ1wuj3gQ1JWE8BO/ZjtOktEwPXmeE+F3Yd4zEb3rII1pO3UQIujqrdKXxipVQypmCjMGYw49Fajl/Ah5awCo2Fa1FqaqzqHAEw/VUM5zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by VE1PR10MB3901.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:164::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:47:19 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::be9f:e8ca:ee9:83e1%2]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:47:19 +0000
Message-ID: <52828337-83b7-41f9-86f6-4fa72e00f877@siemens.com>
Date: Fri, 4 Sep 2026 11:47:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] optee-ftpm: rewrite its optee-os bbappend to use
 EARLY_TA_PATHS bitbake variable
To: Rasmus Villemoes <ravi@prevas.dk>, meta-arm@lists.yoctoproject.org
Cc: Jon Mason <jon.mason@arm.com>, Jan Luebbe <jlu@pengutronix.de>
References: <20260827133720.3246210-1-ravi@prevas.dk>
 <20260827133720.3246210-2-ravi@prevas.dk>
 <c3832035-67e3-4883-b420-771a9d074c34@siemens.com> <87ld9h9x3t.fsf@prevas.dk>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <87ld9h9x3t.fsf@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::15) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|VE1PR10MB3901:EE_
X-MS-Office365-Filtering-Correlation-Id: 5692a53f-0b42-49c3-3c06-08df0a6982fa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|5023799004|56012099006|10067099003|22082099003|4143699003|11063799006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: 
	qOxlvnaz35j4PSPM+uYc2msGM3X055Fyx7h60JfgFKLD5h5sC6W38it5cNIBzqjAmGpq110Ph8ousnMyJvI33eM/3vENLaKpmmrdIdqVmNeugHFH7B5CLMhPPCA0na4yex136LbSGax0po8W4UPFOUkabd+j7Y/Rxv1DZvwl9YrijEYN59cUmUichCZwH0xoi2dtjTeVYTO5sBrW2+JN7VhqRzeVCyMgaZGHaZvFTaCsAUpp9Ia827T0Bd2JOuJQNYkSMVPObl/Qx4gZd0Eq8kM7qMR+/yx5fJ6lj/UXThzUrvL5NLbiQHC2qOEJmaROOK2tQLZT9aF/DEM12Tfoc67HOBjSko3bWBSeokzcbob0/anv63X3i9sX8TEBhVKI2ohzWoT3tG3+90mY67cxx8XLqCol8M2HOiOJFl9NGDA1d2Jze08zCKUHzjo16cvtB+hveKh82NiQUNOqSOozRVpFIlZ+g8XkTghWl7QajvuujllQEOuJn4a7y0SlAZQKf4HD+nvsVcui69fSIRhKXIgVVY6VPI3RiWeLfXeVjMneo1rRImbamfVeJnih3Kl29ipUIdGre/hh3jyvE3S3r3P4rwGAQVdVaOpdBa8vb8CyyvGSngViScjyu6LzPoJ4Q1OHz1Ds/Te/W757v/Z+AoNTH/HX8t40iUDaJudc26A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(5023799004)(56012099006)(10067099003)(22082099003)(4143699003)(11063799006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aXd6SUFVNk5FM0hobTg5T2tuOGxDdWV6MmRtVURpZGNSY1dxaG0wY3lZS3hp?=
 =?utf-8?B?WWl1SndXUzgwRFQrNzA4Ty9LRlVtTTl1N2FzcTRQdU9uNE16Q1lyMEZWcnVO?=
 =?utf-8?B?OVowY2J3Wkx4clpYYkE0eUkrU1M2OE41T1daUVJoRXZDTThBK1EyTWZKM3VN?=
 =?utf-8?B?ZHNTb1doMm9NbWx0TjRwUDdiWWQvUDl0WlpubjlPTTU1YzJIRWNYSk1FOGpr?=
 =?utf-8?B?Tmd2UGtBelRIZVMraTNvYW4zTmhxVk9hdEFFblRHNTN3TWsyMUU3aUlRanUy?=
 =?utf-8?B?NnoxSnFLMElvNmdtakduWFFycTArZllERlN2Ri9vV0tXcGJjcUk3cFZXdVI1?=
 =?utf-8?B?T3p4RVgwWmJuZEo3ZFpKZEdYbGJEZTVQVUMyczRBWXVoL3hIRklNcUFQR2Zm?=
 =?utf-8?B?ME1hOGFLZlBqaXROSk9TSndMMTI3NFY1bFE0QmtwM0JZSGJta2UrQUJnOC8r?=
 =?utf-8?B?OW9HdDRpMjFJQ0VlK0NoN2R5cUNZVi8xYTc3Q0JsUmdqTkZMZmRMMzlVZzQ1?=
 =?utf-8?B?b1p5OFN1SGo0NUcrYThzMStDVUFiUlVKbWRmU0hPSGRkK0xSMnl5clNtR3ZJ?=
 =?utf-8?B?ZVZXV2tDOThIeXA3Ty8wWXZFZ1AvTmFSOTROWmFteHNQTktqejlLUlk2ZzZN?=
 =?utf-8?B?eUhGNGlpcVFYSmZ2cWpEdHVSU2tKYjRVU3hySW5zbEJTeTBmSURvemZoakhw?=
 =?utf-8?B?eTVvYjhid3d1WTN1KytGNDlLeis1WThBa1FGcU44cVJLbFk0QnRFZnp3Qzhp?=
 =?utf-8?B?bVNzTmtSMUd1RlJGSjZGQVhxTkpITFFzN0h2VUs3QzhEVmF5UEEvVWIyS3dB?=
 =?utf-8?B?bzRLRVBoM3BjOUU5alJXd25VSUtYdUdVMHI4eUtRWXBtN2JLLzlQekd0dUJj?=
 =?utf-8?B?dHZ2YncxY1VZb0xUSlZPanRYUThFdlFUWlNmb1hCVmdCeWFtU1l6LzIvR2JX?=
 =?utf-8?B?eHJKRHN0Sk1Db2hjS2xVQjBSWG03WWxlQkNEbnAyZjJ5WXN0R0NqVlZOZXl2?=
 =?utf-8?B?dW4wVGlqUGtaL2JSQmVQTmZjbUpyY240TVVzbG4xOHVtNE45dVBpTlNVbEFV?=
 =?utf-8?B?c1kveU1vcFdXMW1yNDdyYlJZOHRYNG96NERIRXpPVDVLV2lCSkttNU5rVzl6?=
 =?utf-8?B?UWJtUC9Vc0pCL2wxbzRacEFTRjBqV0FObFgxNTdzN1oxUzF4TWVPOFI1TmRN?=
 =?utf-8?B?NjNuNm1GclBUQ0twYkt3S1dxcHpCR3FsWkg2V2xiYUNjMS9TYlZlUUhXOHRi?=
 =?utf-8?B?UGZmM04wWWY1TkFMazBpYVA4RlIwVjEyRDFROFJ0SkcxVzVRcHoyNXgvR2RM?=
 =?utf-8?B?MGU5MFNaYktJckoyQWxOQWNSR3FPWXpFc2dVRUM4VkhqZlpxd05QYy9DYjQr?=
 =?utf-8?B?V3h3NHUvdTdHaVdjenRKR21mdGZKUXlycWZnM2JDdGRScnJRd1NaWWs0V3RB?=
 =?utf-8?B?dEcrZlpLblJLbXdobURlL015TkdSdVF1RmlwMEpUaHlNbk96WjlSQnlXOGNJ?=
 =?utf-8?B?a2s5R1lmR0U3SWdaa2ZWSytWM2h0ZmFqOVRMb1M2aE9XLy9BU2Q4dDhtejVF?=
 =?utf-8?B?ZU4rWEF3K2Z3bG1uNWpQRlhLOE1venpTV1IxeGFDVnIxVUlnNWZwT1g1amd0?=
 =?utf-8?B?QmlqNFNMOXdPMWdpU1k3UnU2djAxS3lDR2VSMWplckxpY05udDZUcjk4eXdj?=
 =?utf-8?B?Q3Q3V0FJMithcmpYUFZhRlFYeStFK1Q3cXpxSGRKTVgvYkc3TGlxNHFkY0dL?=
 =?utf-8?B?UGFqTGd3eFhQVTVNVkhHYm16QXovSjBsN1VmbnQwQmdSaUVtS0RIWHFkaTV3?=
 =?utf-8?B?M0hpRjVtdHdQcitUYTdyekcyaEZNWmVqenZPM0pxQkZYUWhoLzA2b0kwQUJz?=
 =?utf-8?B?VzlQNW9XVVBnekE2ZWRUa2dyMDdaek9hQlV3VjhUck8zVkZEcW5kN0RhN3g4?=
 =?utf-8?B?aHFyUUVralhJajZOREdHblAzZXdZWG5ZS2pLcFdmcEpjUFdkdG5HQUgxR1Rs?=
 =?utf-8?B?YXRtMUlYaFdyUHd1ejlDZmFqcXVLOHRibWRpWFRzVWo1RnlsZjlBZzVYNmVD?=
 =?utf-8?B?UjJucWE0TFNEbFRjaUdvYXNtSGgrZGVCRi9FYUp3S0xPWG1xZUJFcFM3b3dZ?=
 =?utf-8?B?bHJkejNjbm5oMTZVNXRKTFpwVUI2N1RvVUdFSDBJcmRLa0lCNWlrYWlCRmdh?=
 =?utf-8?B?MUx2cDlyN1hGRkEwTk5RWVpBMzhndk5zeUdWaXQxVlppYmdnVndmd3BkOU8r?=
 =?utf-8?B?ODBEWTNrVlRveEVmd3puanBzWmZjdWJaQTJqS3kvNnhhMTMxZ3ViQzh0VVlO?=
 =?utf-8?B?aDVPcmUwRUp0RE4va0UxVm9tSUl3TG16aUR1M2VjYytvRGorVXZ6Zz09?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5692a53f-0b42-49c3-3c06-08df0a6982fa
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:47:19.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29jAyCkIk2IoGMTdMx1or9owBp/T7I1L4n0Q4/vUfoM6LRKbDBhQ/W+01eQfzSBQrcAVnXvC48H0k2PO6xxvQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3901
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Sep 2026 09:47:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7158

On 04.09.26 11:36, Rasmus Villemoes wrote:
> On Thu, Aug 27 2026, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> 
>> On 27.08.26 15:37, Rasmus Villemoes wrote:
>>> From: Rasmus Villemoes <ravi@prevas.dk>
>>>
>>> If anything else in the BSP also wants or needs to add an early TA to
>>> optee, that will conflict with this .bbappend adding its own
>>> EARLY_TA_PATHS="..." argument to EXTRA_OEMAKE.
>>>
>>> Instead, add the path to the ftpm TA to the newly introduced
>>> EARLY_TA_PATHS bitbake variable, which the main recipe will use to
>>> produce the make argument.
>>>
>>> Passing CFG_EARLY_TA=y explicitly is not needed, as optee-os' build
>>> system sets that automatically if the EARLY_TA_PATHS list is
>>> non-empty.
>>>
>>> CFG_CORE_HEAP_SIZE is somewhat harder to make play along nicely with
>>> other .bbappends that might have an opinion on its proper (minimum)
>>> value. For now, keep adding it explicitly to EXTRA_OEMAKE.
>>>
>>> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
>>> ---
>>>  .../recipes-security/optee-ftpm/optee-os_%.bbappend    | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
>>> index 92c11157..74bde25e 100644
>>> --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
>>> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
>>> @@ -4,8 +4,8 @@ DEPENDS:append = "\
>>>      ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'optee-ftpm', '' , d)} \
>>>  "
>>>  
>>> -EXTRA_OEMAKE:append = "\
>>> -    ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
>>> -        'CFG_CORE_HEAP_SIZE=131072 CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"', \
>>> -        '', d)} \
>>> -"
>>> +python() {
>>> +    if bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', True, False, d):
>>> +        d.appendVar('EARLY_TA_PATHS', ' ${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf')
>>> +        d.appendVar('EXTRA_OEMAKE', ' CFG_CORE_HEAP_SIZE=131072')
>>> +}
>>
>> Both patches look good to me, but I currently have no nothing in place 
>> to test.
> 
> Thanks. I have tested locally that the resulting op-tee works as
> expected with this refactoring, and inspected the run.do_compile scripts
> to see that they are sensible.
> 
> Anything more I need to do on my end to get these merged? And when that
> is done, are they eligible for backporting to wrynose if I then resend
> with [wrynose] in $subject?
> 

I'm not the maintainer here :)

Jan

-- 
Siemens AG, Foundational Technologies
Linux Expert Center

