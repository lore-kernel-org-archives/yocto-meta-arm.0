Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552FCC19F29
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 01:26:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1401.1659576360746858192
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Aug 2022 18:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=oj4WO+dl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=521578700a=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2741PwUi023265;
	Wed, 3 Aug 2022 18:25:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=t2pOi7UTrMEc/BVTmm9l13NcIxmBR74yGpLAsmKwX9o=;
 b=oj4WO+dlaQx4fyqAldeuGmTEjfNIjI3Ee5KWk4cEGkLF7k6Rzut+9AgCh16LBiMk4EiS
 za6HhO3HbJevuly3nVuZ64b20X7hvsf5ygchZCySnuS+cGSeM1ToNAQtz4tPGhWMP95O
 en8iVg0kRhK20+JvVq19Gk1A810G4n0CdeDkawLGI7AjZJXnY1NDvO5qQPEmUEIulki5
 2BvcIAToDvjlyuwjUAeXTELCRKc9LLdSgJMq6XrZ7fLkh+c3JUTf1eNH13+FcN16/+kZ
 NHgQQYMR7dZyCrZXplx0W4Dr/NwMnOX3MpMyvJg3fVuNztyldY9WSKwdsrq/wl+BmHWT fQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hr3vgg0p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 18:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifHrqhLnhgl4RSlMJQzxwYnzRQE3pcCMkg6GGBY4BE9ungCbLT0+afXmdxagloNFtR4R9XaqNa1dT0UnCUffCVPZO1udi95ZQbSUdITezGZ3TFNIW4qmxh7CIMU5ia5hAQlD+8qZG4gQ0nGiLsAEUQGyWpOCRIQRzz1rwSuF0t5CzwBAuvGA4qtCMMcS4fmvYNaPiza+otuPUFPxoMTC5U/0uKrCRrCLAUY23PKMY/Wq3xz2TEff9gEwMLhBGjdDdFzAo8LIiWklbQbTcT+FdO2gSHfQP+qeVE9o/+20Z7YJKTSz3Lg5SvrSteg/ibgeBRLLwRZxa/Hawwik9fwxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2pOi7UTrMEc/BVTmm9l13NcIxmBR74yGpLAsmKwX9o=;
 b=h7/O3AEX46m5/ENGcp0dOveQ1VmPd6K85GeARC9XiAp3Vme1RGcArrOA9KJHvoQvatWHrhpmzQfFcWjQ62cnqMKwUZ2TMCi1RFvYWNda8opBkfK22dLXU4r2toRbbDocwNqYAhZ63iEGS0OSO7Qh+VmHjx2mWBhWo4btuUphlziVfH9s7zDZfJXD1RlqP0QZ7ziJj2dEMVd1+uLsbjmsLNpPudb8SAbf3pIybLQXiasMYqGq48wHWxUjSfJAsc+0zCWj3lQTjJYIiNSOelKOIy1M5V4CvngBolJhiiiPNX8z8bgeMYK5nLByjAKbaroFXsg7tdM5uzabL8h7RZEGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by DM6PR11MB4042.namprd11.prod.outlook.com (2603:10b6:5:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Thu, 4 Aug
 2022 01:25:56 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::ac93:7dfb:f5af:dc5a]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::ac93:7dfb:f5af:dc5a%7]) with mapi id 15.20.5482.016; Thu, 4 Aug 2022
 01:25:55 +0000
Message-ID: <e52bc6bc-3392-50d9-a31d-c6b3b56894de@windriver.com>
Date: Thu, 4 Aug 2022 09:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [kirkstone][meta-arm][PATCH] optee.inc: update setting for
 OPTEE_ARCH
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
References: <20220802062807.4039040-1-changqing.li@windriver.com>
 <YurYpbtFhSOH2/n7@kudzu.us>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <YurYpbtFhSOH2/n7@kudzu.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41f85d99-6680-40b2-2b32-08da75b8471c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4042:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2h47ZTTtPfiRxSWEFhw8tipF9BjWKn+Ow5EincmXRZsrTJ2bsRdL9wVJxN+U8LSCMWHnVh4hptI0ujoO3MShLP6W7Ms2Q/ZYZ/SV0+CgFzZU1jQxRbPeXa0dO/lcMQ/dt1y13KxqVGtbyDWM/jl8da/ILqaiM2sY0jODI8sHvUZ8kZ9deVxUDRJKa4iKow6nvD6X/y4r3CmAg3ZUQ+qVdrBrZsNN1L1p6u9pOCJsNwapcmBvs8ldLNM/0xWMsG2TOf4Yx0c5PsHv95A8f5WfSVrLo2A5wW6OFmlKR8i3eq2EcN3BwSwBNCeZOC7Zcqkit52dr8ZSzbQQBEYykqFKBFs1t30VUBoe4ZDMektO+k0p2H15fOWWB599ctVIEYm6uwdybuGYYxomSTNMcjS9x7vTAlWRgF2tIANtWeQLWouEe7ep/oaimZZCcqXW8qBMI7NSTxP8rCf3dF1/zVU8+1CA1BYA5kPXSuc3bws/2ugpXsSaep8dXd4SeDZfRB5MjWy63XLAi3Jz7/PhO00CjnKKMRIVRwD8nKhYp9+vreuvvOpL2GwiieTmiaY455YPunI6fTM5oFUWw18xPiBzz2z9HHkzgSYe7T6j7JY2gfIF2HxbvWKtEXwKU8MJmT2DC6nDoxYYrSoNw2g1z6LE0/O4qxyNACffezVcjvR7ExgpLykrjurSblBkHa/3dHFy+WQxplOwafaAlegi8x2Kk4EoP1vOwx0ZC0Me9DSciEosv4nx5PXRHbQO7dpnAUXfXRLGhux4HrhN3DM+5V0cTAPcWHEdpdrsKFDugw7Xmmxbi+mdqtRUTkNuAzR4tfA8WBOeM98ey87Nj9h8AMmNyQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(346002)(39850400004)(376002)(6506007)(5660300002)(6512007)(41300700001)(26005)(38100700002)(53546011)(15650500001)(36756003)(186003)(31696002)(6486002)(31686004)(44832011)(83380400001)(316002)(478600001)(2616005)(66946007)(4326008)(8676002)(66476007)(86362001)(66556008)(6916009)(8936002)(6666004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTZxc09TWUJNdWFrUzRZMmpQOHJjV2xhNmMzWTZFeXVPYXJ5Zm41aWhnZjlp?=
 =?utf-8?B?NndONk9WTDV2bythYlVuVWNlcFY5N1FpNnRQWWtYQXNDTDYxZC9taVAzZkZp?=
 =?utf-8?B?VXA2b2JXRUozcWp4QnhzVWNHWkVOS0YxS24xUzFRYmJOYitFQmppcHRBMjc5?=
 =?utf-8?B?RlR1L25OVG9xcnV6QVNnT2tONjdkMC81Z0hVQ2RDdmd3YkRoMlpLbUY0SnJv?=
 =?utf-8?B?NXBOZUZCRzc4SFdldTZ4aVptdGQwd0RqZWdDOERWZGQwcmNWblFCUnF1TGJj?=
 =?utf-8?B?WThYWFhNdjJTVHIvREU3ZFR4MGFnSW4wdUhLbFVXQmdoSy9CUms0ZmdWSlFa?=
 =?utf-8?B?QWl0YWpLa1RLbkVCOE1KdHczMjMxUXdyM21PUnpjYS8veDVneHNlZEk5Z2tJ?=
 =?utf-8?B?b0U3b3JVWVJvTW9QZnBZWElsenF3RnRXRkxsWGJ2ZEJKazZWdzkyZ1dmM01D?=
 =?utf-8?B?RllHeHVJeklucWhocUo1UUJPbUlVQmJWUitqdVIyOWF5VkttWUgyQWJJZlhO?=
 =?utf-8?B?SXVib3BTVkpCMWdHNHZid2NpV3MvakZOT20yNGNyNlZ3SDZhcEluT1NVSHUr?=
 =?utf-8?B?ZmhpbDlNcnlwWGl1bUs1Y09VQmw3UWZuZU43ajB4OU9EMWJCaDVMY1oybTV4?=
 =?utf-8?B?QnAwbjBNaUJlNmVFb3FuRWc2NlBtd0x4RDdid1Y0V05TWHp1SU9WRDRqeXBt?=
 =?utf-8?B?ZlFIUmZSb0JWeldwa0ROczFZdEtDMEpRVkpndzhiajJnRUVkNmp0NElHMWU3?=
 =?utf-8?B?ZkZNYnl3WHV5VDZYZk5iWHNoMmZ3UjFDOWhmaXczN0xlKzgrVzcwNWxNNGJj?=
 =?utf-8?B?QVU3ZUlwdmlkZjl4bVBSR1RCdk5yRStPUVkyaDRxRVNLaWtkQXJJTGhsRUFj?=
 =?utf-8?B?R0k1bkZNTWxHUkNidWxxaDlZaG9oR25od05qM0w3U0MvWTFOZnZaeFduQVBD?=
 =?utf-8?B?bGVmQTNMMzBkaWR0d0xWRmUzZDUvNkVhdWFtUEN0V3pmMEl6bHd2clZLTEtv?=
 =?utf-8?B?UmVjYnQxRVlvRHN0SEVGdGZGMDlVWXJCUGVmMlZ0Ry9RV1BwNXBPaEtjRG9p?=
 =?utf-8?B?bXRvZWI3OWZQMlg5bmRHZzdWMFVRMDZndUl2WFFjV0VZUUc3a2FxTlRqMnds?=
 =?utf-8?B?UkErSWlYcExGVm1RNE1zYm5TYm5WaS9pS2MrSjY5OFhqUXZSSlpxSFJrb3hz?=
 =?utf-8?B?ZHhjbkg5N2tWck5UM1dUN0lJKzg1K0Z3WWx0S3RYcFRqN0JSL3dtV2JZQzF3?=
 =?utf-8?B?VVJ4bGRrWkFHY25wRUk2bXpXQVovSlp5TUhWUHZWdUJIT2VrUzZ6SnNxYXZ3?=
 =?utf-8?B?d3R1LytrVXBkcmUxQlhPZjBsMGJpSlRYdDZ5Tm5NU0lEamFmMEQzSUZQZnBa?=
 =?utf-8?B?cWZ2anFoYWZHNUVvbFhPdlpPcTRUM1FVbjA2SFNadW90aVU4djNjdjBYOVVm?=
 =?utf-8?B?cTZrVHkzc2JncUtBbG1odk1jYlNaSWJFQW41eFdwQWFrd0p0VXcvRHpydk5h?=
 =?utf-8?B?aGsvSWZFcmRPNWcremdYVWM4ZWVkRUVrNnVTazJEclg2eVhsSVJCMnNrcHQ5?=
 =?utf-8?B?VDMvTGxKV3ROcWZRb1ZKQW1paWEvV0lYeDBYemV0MkhpSmo1K291T1Z3a015?=
 =?utf-8?B?Z2VYWjFZT2VYZTR3djFIVVVEU003enV6U0ZvTFo5VFVjT0hjekQ4VHdPMVps?=
 =?utf-8?B?VlErSWE3MFZMYjJpN1kzT0pnNnFiZU1Jc3lqaE5yZ2Vrd2x3OEZqaWZ4dTJl?=
 =?utf-8?B?aVdEV05jamNZNXRVcXFUVEZlNTFyRFRGWEl2Vk1IcW1zRGRiVjZaTEF5TlFx?=
 =?utf-8?B?M25iT3l1MVdXbEVBbFNncG5vWWpzZlJmbm1OMW9nTXlMN3ZCeDhReXpJRDJ0?=
 =?utf-8?B?ZWhsNXFrZ0JubTdYT1IvTWRnaFdoUmQxOXZxbnAwdUhzaG83VlFOd0VKWEtl?=
 =?utf-8?B?YW1yZThsYkZ2bTU2cFplS0VmeVprbXVITUtTT2ptT0ZGMW5QRXdTTStUOWVt?=
 =?utf-8?B?Y1VrUnd6T2Q2Y2g0U1pCcVg1V3ovekRVUi9vVVdNUEtJdytxM2VQQURGOXJT?=
 =?utf-8?B?MWJFQ2ZpTjJ5ZDFXem04UEhNZXFlck04aHd5MnBaRThZODQ2L2g1OHlDemdJ?=
 =?utf-8?B?R0Nodkxjcmp2ZTlTaU5uek9WdDVPL0pRM3N2OSt2ektvMGxTTjhwdDVqZGZC?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41f85d99-6680-40b2-2b32-08da75b8471c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 01:25:55.7556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Yur+6j9iPTfTwaSRLXBKtiTf89A1DtmsApDVGJxqOVsXMx5iLGtQ4DPrjD7eR1bI7pl9x9wpDJ3niTXuC5W/gh6tjZXLZDqVHApEsWoC8Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4042
X-Proofpoint-GUID: -wwPsxdaI6vQ-KqExqJeVpnnq4WcHMsv
X-Proofpoint-ORIG-GUID: -wwPsxdaI6vQ-KqExqJeVpnnq4WcHMsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_07,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 clxscore=1011 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040004
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2741PwUi023265
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Aug 2022 01:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3640


On 8/4/22 04:20, Jon Mason wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Is this needed on the master branch as well?

No,=C2=A0 master already have this fix.

Regards

Changqing

>
> Thanks,
> Jon
>
> On Tue, Aug 02, 2022 at 02:28:07PM +0800, changqing.li@windriver.com wr=
ote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> lib32-optee-os do_compile failed since OPTEE_ARCH is not set correctly.
>> In file included from lib/libutee/include/link.h:9,
>>                   from lib/libutee/arch/arm/tcb.c:37:
>> lib/libutee/include/elf.h:67:2: error: #error Unknown architecture
>>     67 | #error Unknown architecture
>>        |  ^~~~~
>> In file included from lib/libutee/arch/arm/tcb.c:37:
>> lib/libutee/include/link.h:13:9: error: unknown type name 'Elf_Addr'
>>     13 |         Elf_Addr dlpi_addr;                     /* module rel=
ocation base */
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-arm/recipes-security/optee/optee.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/reci=
pes-security/optee/optee.inc
>> index beae366..2ad7c95 100644
>> --- a/meta-arm/recipes-security/optee/optee.inc
>> +++ b/meta-arm/recipes-security/optee/optee.inc
>> @@ -9,7 +9,7 @@ OPTEEMACHINE ?=3D "${MACHINE}"
>>   OPTEEMACHINE:aarch64:qemuall ?=3D "vexpress-qemu_armv8a"
>>
>>   OPTEE_ARCH =3D "null"
>> -OPTEE_ARCH:armv7a =3D "arm32"
>> +OPTEE_ARCH:arm =3D "arm32"
>>   OPTEE_ARCH:aarch64 =3D "arm64"
>>   OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
>>
>> --
>> 2.25.1
>>
>>

