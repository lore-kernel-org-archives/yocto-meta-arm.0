Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34A0C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:36:50 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10247.1788514605627623926
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Sep 2026 02:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=ADGpXbVr;
 spf=pass (domain: prevas.dk, ip: 52.101.70.22, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xod1e3IjSvPjDwsPH9y2ix28KjoVa6lXv+0GO5w+wR6jrZ1h1LW7xf8C28wUQO8PK5f1MXx0216iFNKLNm5JFrvQ7vaJW9YiwaJpAdfzP2RqTUXTxMsFody6Zbt41UnNUUIMN4iHysc6E8VWJ8z2/Fg+BM0Ob9UHVFpOdDWS07t5lFD7BVwu7Xn/hoW6aOzOi83nfRHLNOebzQbHEEKh2L6MbsND09HFZ4l3eqXuAXXM+MHHNuxdMDNcGizlccwI2JK1fsythSJ25YOW647iaHfJsMOY6VT+FYIyizy4fepRtbF9zq6bg5le61RduBkOedVf4EvaDWNJQ+0cXiIGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa5jyurtPhWHJrQ8Ki7oV+KYypLjybRxCcoBlVvf/as=;
 b=d1bwL0sj4PorUAhC6GEOvEwcj0WVKTIGYSBHD1Rw/OHErrEiaGG0N1r+awIVz9vJcvqaCQm1DAUkXRbCht/W7cXQvHAiOmhNEXus6pU42N5bSiSX441QU+6VaZ7tKb91fp/SbB+hhimtyPi0v6carTcRpHm9YjzILzOC9MHakSQVkN+zjqprPxMZXbGh7xm57KXNMK1CrgladA+uN7X35e9wZcp32Fu5IhvPaL2mtcIIAJFGbKul4Qftj71qBT1V9nJzPxIzwKR4+sznfEI2r6XwGkx90laJxgebw2Xwwh3McieogtZj/H7bhiONX3k89ve1mEONAP+yH7RgMpodIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa5jyurtPhWHJrQ8Ki7oV+KYypLjybRxCcoBlVvf/as=;
 b=ADGpXbVrYGpmX1PqHFSTzpaC1Ok9kulkJrWMau2QrXusaPhbXCiIww3jBS0tbswE8l59C8z32pab35xDfHz55qjtmmh4UETTprZWUZeOkm9/+RKZfbtpMfV867cextQ569X7osR+P8BMT016AP8aKWOZX3fSU5uDbyJTASLCNeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PA2PR10MB9077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:36:39 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:36:39 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: <meta-arm@lists.yoctoproject.org>,  Jon Mason <jon.mason@arm.com>,  Jan
 Luebbe <jlu@pengutronix.de>
Subject: Re: [PATCH 2/2] optee-ftpm: rewrite its optee-os bbappend to use
 EARLY_TA_PATHS bitbake variable
In-Reply-To: <c3832035-67e3-4883-b420-771a9d074c34@siemens.com>
Organization: Prevas
References: <20260827133720.3246210-1-ravi@prevas.dk>
	<20260827133720.3246210-2-ravi@prevas.dk>
	<c3832035-67e3-4883-b420-771a9d074c34@siemens.com>
Date: Fri, 04 Sep 2026 11:36:38 +0200
Message-ID: <87ld9h9x3t.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: CPAP307CA0007.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::12) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PA2PR10MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 855d01da-49ee-42e9-b426-08df0a68053c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|5023799004|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	EkGCghsmssTL0s9kWT9bOILWzzlkvac4AS6FJUcxLjH8V15pXzoeY+1zL0hRRzh1OIbxR6Y9nwMXLBkFWn/cGLtFStkyi3G+f4r86UPoFNPCFie4puWsqqEowQzx1vMCrIfEXBdMH1L+PFmWYl+wY5BmJXJvuMLjsrKdXn0pggyCZjw5UUiP+fxoWAhfAO+xl0F9vhFuX2kRJZ7TPFVgOfIfHoJDMZLP+/O9q8nroQMUfi+0e0fTJxb2AY/2nsDe+do494Qhe6XQL2klrGhX9vEHOIOox1y59wn/USacITj9e/HabFcD6NHxtEDkvL/iT44oUiuz7HpQwWelNfVwCvJUzAm3i49yKXVas5KnHY9WvXwjJ7gTkboLyBM+F7gjOhcJQ/YEE9kcNpK0fGe7CX/UcPR+0lfPrTCFSZBAEEXrHKvXMDfEQoOnrOgFysBMmkC8ASkKDVqmAT4BG0DmbyId+RwFuSYptdwBnA//1rxjm1Zwham1h1tZHF71zc4+qsQSWOE61fkNEPPxbMxd/7IaETVsuP0x92/1k9fH+t6NdvlWRRvyb6DniRC+GFMHPZUloDeeg4Ojk2VjKDKxsIk3hGUfcEQeynNACevzhSOt1+SNVVARXU78eUZmA8C4XvL55M4vhDEnLxobRMBWs2YgwzY0iGAhKesUTZbW0kU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(5023799004)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zvaCTyH+4exTkXmOgg8Sv5hDEV1zuu6sGdTCvD1glDczNP3EuM9heNivQOdV?=
 =?us-ascii?Q?Y0lSqeonxx3O8A+ZuXv5ef9yr8/lNr1K9cqgm9HFHzCx3VfKQK1LjKs49EuT?=
 =?us-ascii?Q?ijy6TowO3RmMNkz7X1cj/DQxz1toMhhpk72m8w80BIgHEheDBXuxLjnQanG3?=
 =?us-ascii?Q?jmU7XhGPpQ3rUQ9GTMW5lK+EUPgQ6tYCuCp+pRfKwO+cWKvRbS0+SSWgwk78?=
 =?us-ascii?Q?+FJ6s+9dC3VEStQY0HcjkV7mpka2FHOryro1ZyPtRte7YdaLAE4nf6h4Izr0?=
 =?us-ascii?Q?fLYu2O18jEEYwwf8TnDFcn8iRNcrb4wbA/y6eaOaSIkulLB/ETYaAsuYlIRa?=
 =?us-ascii?Q?TkWEtFiguRSe0hx9A74h8HMAk9NATaCNplnMm8x12JEgJPVVpo/BtYvxsXUW?=
 =?us-ascii?Q?y+/aE1z1ipPNHwLpSRhsQuDLF1XyrCa+4VjlhYblKBzV0oRzxaRaC6G9DEno?=
 =?us-ascii?Q?J1CgUHQij47u6Y7+6vpObbh5Hs7I5CqNZNPIf7uRwJYPAbNQFN/BZZNs7xUF?=
 =?us-ascii?Q?LljSNjsEq0aWbAFM4MsQNHdF4l/HDgssV2gatiNDFraayL/sP7DgNFFzZwMV?=
 =?us-ascii?Q?DI/CL0nIgUVkRTBVjlh3wubDreaDjsjFk7n2wUupi6VDpu9YWJvLMQPXcDRm?=
 =?us-ascii?Q?DwUKF+A9Z/vOfvvWw4mbNPGwNh9c5eWhdNckuR1/49oznpH8hiJDNQhPUmDl?=
 =?us-ascii?Q?PA41Ea+2eCLijAP++iDW+bD04Bj7w/h0viEQ7qgrznfKUKg10ZOk2k1euZJh?=
 =?us-ascii?Q?5nINFE9A0x70hifxKvl9XBwuT9dQqsetjstmZWou8t5/LIdx3hBDmbaNJXrm?=
 =?us-ascii?Q?b9FhBH2Ci7JudH6bCo3s46G3i1DZxBmVi8esGPavzvIKyHqI903F0OFwN9jy?=
 =?us-ascii?Q?A+x3ywAdgP58EcxKkBAnQuUplY9xHw3upX+voHtGlIwR5lEHIeQEAW3omuwU?=
 =?us-ascii?Q?XPvuo2fLzMiqghWEXXpafWJ5CwdMs6OhD3u9/VfVvhX2SZ97dSuMXdRUAym8?=
 =?us-ascii?Q?2A1yc8Faoh25q5og0AM0UnVD/35LgmcABcgDk8fAhGQVrI2Gzuv6pjhtG4l/?=
 =?us-ascii?Q?sK2YzWu3Dqd5wx+HERz1Vodbr7qJP0wYYGlX01RJLbNtYp2YStWt/q3uKPLw?=
 =?us-ascii?Q?+O3W+3tT+3bUrr28QmHtek4UeIzuztsEOiDff16h2sh6ZE/CjSk8pkUXS1UT?=
 =?us-ascii?Q?WlHk86w29ZZofDMPzVOBk/o2e4RQdtf4S3cZaJMewuBq8baDS2KzQuCUnDfY?=
 =?us-ascii?Q?gIDx5xEw2h64mkdvsbYRC+1Tu9P3zNlBzvrjWN3ooW5hidyc0gAlQ2fPssbS?=
 =?us-ascii?Q?vT9m4MlPi96MHn+KCLUcNnVEHuqPila0CgkOd/sjp5kfBmN9Kr0maDAQWa0j?=
 =?us-ascii?Q?vcmMTN8zKouk6+mjjh8Kay8SjOqB/DX1ZxBU4hBlFuRk4roZw2eT+SnlL182?=
 =?us-ascii?Q?8E8Rzm8/4HXK7OI82sJC21YU6iQn3pwB/g31M/mjmiYSlc/2pkr4fWCj3nvK?=
 =?us-ascii?Q?fqGQbnAsq2mV26ld/BtafHU5PM9xQFAi9joh6Z9KBGi/9GrxE982epjW3Sye?=
 =?us-ascii?Q?rdt+AJ4HiklcKcKe0t2OY3fZbdc+JN78q7nf+bZ7fUABvE6k2W7ZGlCn0p+0?=
 =?us-ascii?Q?jEfF0UAapMvD9OP9mAxsgRkL0yr+g31A4AtO31qr3b4DOxEX9qTSJvJ+3PEJ?=
 =?us-ascii?Q?27nlmBh43vpyBL/uKwo41RaIZ0Q+MfOXR1wNUvQzJfG1cLKoJ6QXeCgFuHuY?=
 =?us-ascii?Q?RgUWYuXs5P53QpiqnHsDz/ZlI4GefdA=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 855d01da-49ee-42e9-b426-08df0a68053c
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:36:39.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j83A5NKiq5wxtnjHOWdYmios1ecnJskMFJW4kjzP5jfPXgFbpcrQXhcw9kozALWkks5JxbNboS5341da6fKNugq3ykMdWuAOjdtODTlhuRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9077
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Sep 2026 09:36:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7157

On Thu, Aug 27 2026, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 27.08.26 15:37, Rasmus Villemoes wrote:
>> From: Rasmus Villemoes <ravi@prevas.dk>
>> 
>> If anything else in the BSP also wants or needs to add an early TA to
>> optee, that will conflict with this .bbappend adding its own
>> EARLY_TA_PATHS="..." argument to EXTRA_OEMAKE.
>> 
>> Instead, add the path to the ftpm TA to the newly introduced
>> EARLY_TA_PATHS bitbake variable, which the main recipe will use to
>> produce the make argument.
>> 
>> Passing CFG_EARLY_TA=y explicitly is not needed, as optee-os' build
>> system sets that automatically if the EARLY_TA_PATHS list is
>> non-empty.
>> 
>> CFG_CORE_HEAP_SIZE is somewhat harder to make play along nicely with
>> other .bbappends that might have an opinion on its proper (minimum)
>> value. For now, keep adding it explicitly to EXTRA_OEMAKE.
>> 
>> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
>> ---
>>  .../recipes-security/optee-ftpm/optee-os_%.bbappend    | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
>> index 92c11157..74bde25e 100644
>> --- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
>> +++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
>> @@ -4,8 +4,8 @@ DEPENDS:append = "\
>>      ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'optee-ftpm', '' , d)} \
>>  "
>>  
>> -EXTRA_OEMAKE:append = "\
>> -    ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
>> -        'CFG_CORE_HEAP_SIZE=131072 CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"', \
>> -        '', d)} \
>> -"
>> +python() {
>> +    if bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', True, False, d):
>> +        d.appendVar('EARLY_TA_PATHS', ' ${STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf')
>> +        d.appendVar('EXTRA_OEMAKE', ' CFG_CORE_HEAP_SIZE=131072')
>> +}
>
> Both patches look good to me, but I currently have no nothing in place 
> to test.

Thanks. I have tested locally that the resulting op-tee works as
expected with this refactoring, and inspected the run.do_compile scripts
to see that they are sensible.

Anything more I need to do on my end to get these merged? And when that
is done, are they eligible for backporting to wrynose if I then resend
with [wrynose] in $subject?

Rasmus

