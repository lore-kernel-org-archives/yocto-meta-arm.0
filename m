Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ACDC021A4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 00:41:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.752.1740444075280055225
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 16:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=415121843a=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ONuEq1015314;
	Tue, 25 Feb 2025 00:41:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2k1ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 00:41:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiGiRD5rnp1NdhI50A41/N11nJ/B7qF/5VeqzxYh5FmKjusce4zFTXNcst7900xy2Q4vfrce8jZMHmaTCn7m3r5G8vjDrnMfEoIRYDl1BlY81kSI/2ZdHNauNHjLKG1lmvRzdYg0bCo+DqyJuJuXR8v8sh5KIZINM+S/DPVzl5q0ZcNcV8JVdXzFXCgdo733jB3+npH4NmYJPpFtgrdOICsEhzIYkvMhULa0y0J/olmlQiZwoggYSQLmXglElFvSKYf2Tahs7PksNqybDj+gexrfCrkEd9wlE2U3tOFdodiawwV4so5QHz885UergKNJmgKorf+1MhfCXii2fLpX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCHRjjkbnppzvUpje8WFFOFAepNM8GU8okwRH7Fv5k4=;
 b=yMMHyxeEGWrTTPk9VrD7jR0B5Te0/YRVy13VLlJQYzBPN3VWsLK68poEy/V2EXxugtXoCQDjTYD5EABJldwpQXelsApGtmduhN63XFdliveUpxCcpXnIRLQbqy1SBgBzloJv87CiL+UhoQ/xndQ4XITTm8nJjNTEj3QlxjmIMD2cc4750pqLBRtMvSOscNmstkXm4Fbcjagyi+pezycRlAelwqtJoZjVqTAjtb1ZYFgmM7f2B7a1F6T2yRmp5U9gfn0u0M2cvy+ss9nMFPXy/5bVXnFN655Kb7N1ELKt6w5r1kYB593vVv/NEGbi4dp30AmURIskdEy6cw8vyPbMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 00:41:10 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 00:41:09 +0000
Message-ID: <152e3bb6-2a81-4754-9d3c-9476082475e2@windriver.com>
Date: Tue, 25 Feb 2025 08:41:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arm][PATCH 1/1] optee-client: disable build on qemux86-64
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
References: <20250221013348.2622293-1-haixiao.yan.cn@eng.windriver.com>
 <CAPoiz9xmFk9zq_aCYBfRD7UfWLDXrUbZe4jJK2TGqGGwevqR1w@mail.gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <CAPoiz9xmFk9zq_aCYBfRD7UfWLDXrUbZe4jJK2TGqGGwevqR1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:404:42::31) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: abf7a4a8-2592-47ae-aa3b-08dd553518d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Yzk1d1prRnd4UDE2S2psUnhKTEdXWGQvVTZWUHAxL09xVFVxRjJ4WStTS2ty?=
 =?utf-8?B?ZEZHL1JxclJtUkx0ak9nT01wT1I4KzBaZ043YkFHdnRkZ2dTa3VrZnlxMml6?=
 =?utf-8?B?VFpWT3VpdllYNzI5OWxjVWRCRU5GcUNFb0NESHBPM2g0b1dlSU1reTJTWDlh?=
 =?utf-8?B?dWdtYmVjcWxRYlVkaUlZWmNzQUlUT0NRQ0JHUTh1NE1JaGcwS1NreFBXTXlj?=
 =?utf-8?B?NlBFZElrbFlTTWJpSVhKSHVSVkhPYUh0TVBLTXRxZXBkencyNUJGV00wd2s2?=
 =?utf-8?B?bXZENzQvejRhaDZWOFlxbDk1VzhzdjdiQStJdGkxTVlNSUhOUVdGcE5mNnYr?=
 =?utf-8?B?WFdLRHF2Y0lWSzdQK0NQRnR3WjdSRElMSVdFVHZUbWp0Y1pCalJoU1h6QzN6?=
 =?utf-8?B?ZkdPYnQ1V1B2cUlhYW5PV2NqdEdHOGNVUk05MEw1cFZQM3labkp0NjlOQ2gy?=
 =?utf-8?B?QTZsY1Q3UHUyUEIvYnp6RC9CQXBSQjl6dUQ2c3R3aWJYZVhiV3RsTHN4S0NI?=
 =?utf-8?B?YkkvbXJlZkZUQk1sRzUyQ0xPWlR1bkxkaVVPYVJzT0FzOFFxdVZSeHRJbEVk?=
 =?utf-8?B?djMzdURRVzRXd1JqTDl5NjRDd3I5NkJZMnU3RWhIaDU5YktjMWczR3lvNmtj?=
 =?utf-8?B?bnRpZXBaZE5SelhmMmNZa3M3R3RKYlo1eG9JdDJpczdrb3dTTVVnVGx6NDdw?=
 =?utf-8?B?ZHB6OVl1RmR1cFdJeGd1R3ZWcUs0aXNiY21la3hCcVJYWXo5L2pZMncwbzAy?=
 =?utf-8?B?S05NcVp4ejlZK0k1UmMyYmNCSXdkT2dhNTEvOVdLTWFOZjRNTVN6dHFaY21O?=
 =?utf-8?B?ZzVCNEttVmN5QmZhNWozdW9iS2trY1NKNFpNdVQ5ZGx1VFk0cTJuakFnRVNm?=
 =?utf-8?B?ajFrb1dqRlJ3OGk1QkhLa3hLUnJrUlpOdFZFMW5EN0xhNWErTEZiZnJMQTJO?=
 =?utf-8?B?UzhrK2hOeUZsWlY1dWk1Yi93QWJqaFpDNDdnSzUxSEZQOGkvTldrenRZSy9h?=
 =?utf-8?B?QlV5L1RCSU05eWRMODNwTzRjV3kzZ3RlemhQQ0hwMVFzdVgzZXZya2QrY1gv?=
 =?utf-8?B?VlVIakoxQnErSElmeEdZTkFXYnpPR3MweWtaYmN1SGdMTVNhQU12VVlYKzlh?=
 =?utf-8?B?QitpTHJ1akN1bWREYUZMRjhnSlMyOFpBMTVaaEN1dzJiUDVPUzR4bFR6ai9L?=
 =?utf-8?B?c1VJWUJrczBybmlIVWV2YUMrL0srNEFIblpnOFFRREp6SU1ZUUR2ekxyaEdO?=
 =?utf-8?B?NUJlUTd5Ym12N2xZZ24rRGQzTHNXQmRyZFBuZEV5Sy9BZXRUV0FockN5Ti9E?=
 =?utf-8?B?RTY1RU00Umc5WkV4NnVvOEZlNk1aNHVhL2VuVlFBT29NUkFYL0t0bGpDM2di?=
 =?utf-8?B?YkZES2VYVzArbWl3cTh4WUxzZ0ppTnZSNm43NzVYRGhiT1RRekt2Z0lXNk5m?=
 =?utf-8?B?YXNpczZhbEdaM01XNnFMaTZMbHA4L3NaM2lEbU5Sb1QvQ0U5cFhXOW12dm5W?=
 =?utf-8?B?a3dMUC8yT2pSdEM2eFVRRHZ6UnRUWjhWcHVtQkVZSDUxNlM5UUszQ1FXdi9y?=
 =?utf-8?B?U2hOOVNpT0lJNjdIZmZ0ZTBKaG9DcUtOak1OUEk0bUVMR01PRnBaZjExc0Nu?=
 =?utf-8?B?TU45bW5kMTE2MmJtODhiNng2aElOVnNqeUh1N21weFdHaVUwam5rMU5mSjht?=
 =?utf-8?B?UlhRMmxUTDR3NytHQWpEMDhFMGZaNWp1NG1qa004RDJXY0RBczA1VmROS082?=
 =?utf-8?B?Ujc1bjd0ckV2WDlObFQ1Yk1Ba1BkY1FiTVNvRVNjTm11NUc4eXF6OWJtUTJy?=
 =?utf-8?B?bHh6ZEh2b25VSnNxWWFDQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjNSVEFkRXFQLzhBZ1R2WUNIT05zbS9hV3VxVDdMWEtpNnhKMlhvdENSQnVF?=
 =?utf-8?B?S1JWVzU0THozNE5xbzVnSTFjQVNLYXdIeFRrRjNwR2QxaGZGVDdRWTdTSzVY?=
 =?utf-8?B?b1VmekdwMVRVOHRqNEUzK2d4UEI1cGZVZ2tWV2JZNDZaMkVqcGtrZXdBQVdl?=
 =?utf-8?B?ZnlBWlBSU3BsbC9GZ2RFTmhUUGxLQXVaUWVVU3lhQUFYMGo2am1iQVhUd1hw?=
 =?utf-8?B?ZTJXRGdod3dBeUQ3eEhOOTNBaDJJWkFlZngzM2hBcE5wKyswMkF5MS95Yit5?=
 =?utf-8?B?YWhtMU83N0QyYnhaNTZMdWZDV2dsSHJpZHM2aGcvMGVVaUdRc2Z1SS8raXgv?=
 =?utf-8?B?WC9RVi9QQk1hV1lrZ2o2eGxRTi96WGF1eUFtbm04bHhrQnFMOFIxS000UGh6?=
 =?utf-8?B?bFZuR1QzK0RoQXBMK3RUTTJRRU5pcnc0QjRBU1F6Tlo1NlB2VDhUZmRsWWhQ?=
 =?utf-8?B?cEhlZUhhc1krL0JXU2hqb2srUjhFRGFCU1V4N29rYldHVGZjMi9JRXNLVEZO?=
 =?utf-8?B?WVNvNEpXRWNHeEhPYjVuWktkL21CNWkvY0VlZ0hELzk3RG1aRVVJZmxRZFln?=
 =?utf-8?B?Ry8vRks2YnIxbDVYNGE4TERjRHNSaTFjL083azl3YS85MGJTT2ZzMnFmbzhK?=
 =?utf-8?B?TWJETGN5ckpoSGFvU2hERHlaSzVjOUJnREF6dmhhd01vcFpkN0NvcTFpL0py?=
 =?utf-8?B?aVYzLzFmdDlBV1Myeng2ZHk5MDhwcUswa3A0VTIrcEFhdVU1Z3NLTEFKS2l6?=
 =?utf-8?B?bkthYWM5RXRZcC9JbFQzVFgvQzR6VE1qMDYzTi92TkttbUtoNHFsUWVIZXFK?=
 =?utf-8?B?bzVlRWIyWjIvSXFLelQ5WFBrc1RTR0R1cHpHZmpML0VCbjg3UE9sbEFGTE4z?=
 =?utf-8?B?T2lLMkNsRWRzY09nbVE4Nkw1TzN3eFhwcGljMG5sZm1Odzk4ZGNSQmJXZjgw?=
 =?utf-8?B?U01SRXdycVBFeU9pZVhuSkk5SVlYbGM5VmF6VlpXTHNFblBMbnA2NHhIT2t2?=
 =?utf-8?B?ZGRVUFZrY2RrYjYybm5wQnJodHAwWHFUTnFrRGg0eHB3M0MrNHA0a0hUVnVL?=
 =?utf-8?B?QkZFbzdoNkhlZ291bU5aN2M3WVZXUW5Ldmh1OFRmaWZxNlNSY1k5UXNqRXVJ?=
 =?utf-8?B?bTZHMy9POE5EQ0Z3b0QyZnJsMjhyUzZiVjVRYWE2NExGNnVpTVhmMUkrdk1o?=
 =?utf-8?B?SkpwL1BtdDVINmpuR3M2MCtVTDZiWmdXQUFhblZrcjVjblVyRllLME10VEhs?=
 =?utf-8?B?eENFNko5S3RTWWZCSDFBWkNyS0d4OE9QNnZNQWZ1ZGlEd1E3b3ExQlpoNWx3?=
 =?utf-8?B?ZlhGWWpEM2VJY0VVT0JqcGxId0pnUStXMzJsblQ3RE5aK1lWRHZjUVI5UC9t?=
 =?utf-8?B?dElYUlJYM0wwUVVnald6dzZQcElvUVpFNEJlTlBkVGxwS2NjV0Jib3FsV3d1?=
 =?utf-8?B?Q21tZ0dBREhrWjZCcWZOcGdDMU9jNDVtTFhzeG1pc3RrSW5iMU0wSnBpU1pR?=
 =?utf-8?B?MVRtUjlPSlN6V0p2c2hPbGZaQkJtTlZuNUZvU3hJM3B6bnBGSG0yZDZ4ZGta?=
 =?utf-8?B?WWczQ1hYRy96WHE1RGlVeTFwVGRvL2lOZThONDVpTE9XOG1ZWEZ1RlBsVlFW?=
 =?utf-8?B?T3ZCMFMzNTE5YnY3ZG82emx5UnB0cm02RWZObUZpY0g3RUNMSTZjSWZ5UWhU?=
 =?utf-8?B?LzB4OEsxV1I2M0ZWZmtRbmNZUWVueFBvUTdoeE9QZVNXSENHcTVpbE1UUjY0?=
 =?utf-8?B?c1UwUlpUTmFCYTFOeGEvaytQVGZLeVg4cHhnQml0eTV4RDZzOGRhYlpoN1Uv?=
 =?utf-8?B?VEhOaGc4TVczUXRqQ3FDVGo1eS9QaDNpT1d1M3N3cldzVFdQNU5HZHZmN05x?=
 =?utf-8?B?ODlsU0hoNzhlZCtyd1pDKzZ0REZwcTh4QlJpWWswNFRvZEF5VDhwZy95NU5U?=
 =?utf-8?B?WXc3T1FZK3pCbHVQejNDV0R2VVpZUjZhakFrWFpkOHBPcVZyb2F3aDNLK2cx?=
 =?utf-8?B?eGNqaEpNV3NienJGWHpiK3NBUHR5dGREQ3B2bGtYRVA3ZGltUUlNSGdFQmlK?=
 =?utf-8?B?ZFUwRjV2MUhmYUNnMWpqdzNkd1BYR2xKaEd0bkdaaHdSUmdnUVp1cUxnenpE?=
 =?utf-8?B?QVE1Z2tpdU01NGVTWEQrNTk4VGp5MXhjVDJlajVkanRKaStFRzJyQlUxb2VP?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf7a4a8-2592-47ae-aa3b-08dd553518d2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 00:41:09.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbD2nHhBE+OtWu753y1adFWs/o1iUOMkROUjcIUjkAuUSMJoYhUjBTy53TMB5TbxQQtcc4IzRds+wDDKIEznHSVzX8vrughUtmFpSdtorwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
X-Authority-Analysis: v=2.4 cv=eoIlzppX c=1 sm=1 tr=0 ts=67bd11a9 cx=c_pps a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=iGHA9ds3AAAA:8
 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=lNpUmbGVMH7auv-5N48A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rzKKZhBX38tGUcWHaYuuv8g4tZXg1_ky
X-Proofpoint-ORIG-GUID: rzKKZhBX38tGUcWHaYuuv8g4tZXg1_ky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_12,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=845 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250002
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51ONuEq1015314
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Feb 2025 00:41:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6383

My local branch is mickledore. tee-supplicant.service start failed on=20
qemux86-64.

https://git.yoctoproject.org/meta-arm/commit/meta-arm/recipes-security/op=
tee/optee-client.inc?id=3D1bff41eee67d6dafc7c58b0c88923a3c6f7a2a7c=20


this commit can resolve my issue.

My question is could we add the COMPATIBLE_MACHINE for optee-client?=C2=A0=
 So=20
for qemux86-64, if there is no OP-TEE supplicant device, optee-client bui=
ld

can skip.


root@qemux86-64:~#=C2=A0 systemctl status tee-supplicant.service

x tee-supplicant.service - TEE Supplicant

 =C2=A0=C2=A0=C2=A0=C2=A0 Loaded: loaded (/lib/systemd/system/tee-supplic=
ant.service;=20
enabled; preset: enabled)

 =C2=A0=C2=A0=C2=A0=C2=A0 Active: failed (Result: exit-code) since Sun 20=
25-02-23 22:41:08=20
UTC; 32s ago

 =C2=A0=C2=A0 Duration: 191ms

 =C2=A0=C2=A0=C2=A0 Process: 468 ExecStart=3D/usr/sbin/tee-supplicant $OP=
TARGS=20
(code=3Dexited, status=3D1/FAILURE)

 =C2=A0=C2=A0 Main PID: 468 (code=3Dexited, status=3D1/FAILURE)

Feb 23 22:41:08 qemux86-64 systemd[1]: Started TEE Supplicant.

Feb 23 22:41:08 qemux86-64 tee-supplicant[468]: ERR [468] TSUP:main:884:=20
failed to find an OP-TEE suppli>

Feb 23 22:41:08 qemux86-64 systemd[1]: tee-supplicant.service: Main=20
process exited, code=3Dexited, status=3D>

Feb 23 22:41:08 qemux86-64 systemd[1]: tee-supplicant.service: Failed=20
with result 'exit-code'.

Thanks,
Haixiao


On 2/21/2025 11:06 PM, Jon Mason wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Feb 20, 2025 at 8:34=E2=80=AFPM Yan, Haixiao (CN) via
> lists.yoctoproject.org
> <Haixiao.Yan.CN=3Dwindriver.com@lists.yoctoproject.org> wrote:
>> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>>
>> optee-client will be built on qemux86-64, there is no OP-TEE supplican=
t
>> device on this platform.
> I don't think I understand what you mean.  More verbosity in the
> commit message might help in the future.
> I was able to add optee-client to qemux86-64 and it compiled without is=
sue.
>
> Either way, this patch breaks corstone1000 and fvp-base (with
> fvp-base-ts).  You can see it in
> https://gitlab.com/jonmason00/meta-arm/-/jobs/9203534679
> https://gitlab.com/jonmason00/meta-arm/-/jobs/9203534694
>
> Thanks,
> Jon
>
>> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
>> ---
>>   meta-arm/recipes-security/optee/optee-client.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-a=
rm/recipes-security/optee/optee-client.inc
>> index f387c80574b0..aafb1efcf726 100644
>> --- a/meta-arm/recipes-security/optee/optee-client.inc
>> +++ b/meta-arm/recipes-security/optee/optee-client.inc
>> @@ -6,6 +6,7 @@ LICENSE =3D "BSD-2-Clause"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D69663ab153298557a59c67a60=
a743e5b"
>>
>>   inherit systemd update-rc.d cmake useradd
>> +require optee.inc
>>
>>   SRC_URI =3D " \
>>       git://github.com/OP-TEE/optee_client.git;branch=3Dmaster;protoco=
l=3Dhttps \
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#6376): https://lists.yoctoproject.org/g/meta-arm/m=
essage/6376
>> Mute This Topic: https://lists.yoctoproject.org/mt/111301214/3616920
>> Group Owner: meta-arm+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@=
kudzu.us]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

