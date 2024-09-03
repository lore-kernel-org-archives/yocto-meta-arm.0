Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B387ECA101E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 03:25:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14963.1725333909387580172
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Sep 2024 20:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99768ab3d4=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48330Km0004913;
	Tue, 3 Sep 2024 03:25:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41brd1aj7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 03:25:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMIkSe/UL+l67Kic873IDg8Z8Nkew9LxaWGBzGby8KsXtzhK9q5+cHJ9G7f0NRqupV+wflgwUI6Ac5RTqN6Ll9GVugftfbqTJe2zg3b1CiGjZii2VVbEm5GvPGx2BHrHQ8GSO+KELYFcgRUEz6zqaJkC5TEzqNgkyPPe0AGX9+V1nmV37EsA5lk4wfQlpqx/DIwSoFXNnL9qYyg8/jKUDnDzLNeNn2Y+zRZ0IxT5VfWb6iuZmuqLRoNF3VLllf/LbeS8HYgFNs3r8+p/mTtF0HHoKCZJF5kmUtva1w9YcycnVoDXOVfSaYcpqp4lWEgoQpI2VQhYNL2736pgdumpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkhnvYZ+gDmg8FZacWe/GJles7wOPO4A8MDEZvfowRU=;
 b=tv4TRl0DkVH7PyRCuDfnlfmNI7DGXkbgQwCC0lGvmEzZ2EzeXuCDF21BDT3z5+SgTofrlSm3PykNAE7+D0XdxYpKcA7sgrgE4BupEs1DPmod7h1nvceB0rBikTK31MCj4H+6PbYqvvX18tpch5wZzuTF+sAO+stBNP1aBWNll2/pqQ9N6u8Rtl4dHWUXM1je8CLBnMcu+6GrNZIbMfB7pth7RVtGTJJelIxV9k4ySv+bPeBHQ5tFnc45AoqFILIeoLIXPMZyvT/Q0LnbVlq0rrYhB5CiP3bBXrJTgTi+cFs5Xate3r18S4OukU3tbO1xATLDTkvngjysIDmXWsu6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA0PR11MB4590.namprd11.prod.outlook.com (2603:10b6:806:96::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 03:25:01 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 03:25:01 +0000
Content-Type: multipart/alternative;
 boundary="------------lluOJuUnayQ3B8CMkQBQlCQU"
Message-ID: <0ea706e0-2a9e-4cae-a423-262701df52e8@windriver.com>
Date: Tue, 3 Sep 2024 11:24:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/oeqa/runtime/fvp_boot: move pexpect import into test
 method
To: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org,
        Ross Burton <ross.burton@arm.com>
References: <20240515132252.3923595-1-ross.burton@arm.com>
 <171591536813.1562024.2391704984433468710.b4-ty@arm.com>
Content-Language: en-US
Cc: Changqing Li <changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <171591536813.1562024.2391704984433468710.b4-ty@arm.com>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA0PR11MB4590:EE_
X-MS-Office365-Filtering-Correlation-Id: f071ad7e-e6e5-497f-1501-08dccbc7fe8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OG1wOUNvYW80UENvMVh4TWRNbHIxa2h6Ukh6LyttSGZEMUo3UzZSakg0T3Uz?=
 =?utf-8?B?WWZ5QVJkZ3prSHlyK2J2NWJOVFdxMEpuUWRQTm54NzdOMVFacjJrOVhYOG1Y?=
 =?utf-8?B?TkJMUUVIVXdWUjJVNUk5WDZzcjhhOUlyaDZHZFVDTmdjdlpRc0tyRDB2Q0xE?=
 =?utf-8?B?SmIyY3VhUXNJejVNaWdIMndvOFQ4ZWVOMmVIT0VJZEFsc2xNeHNrSVdpMHlB?=
 =?utf-8?B?ZGtQd2FRTnc1aFNsR0dUaThVYWtWZTYrWkozNE9qSnlGSVJMaUdXS3Z4UWxR?=
 =?utf-8?B?TGg0TEpqbkIrU0EycElHK1ZxR0pEQWRobzlLRTNTVnBWNCtuM3c5bUIrb0hH?=
 =?utf-8?B?UDZxVWlDY1BoRzdRR0NBOGMxQjFiYnhwS05EZXNvekpLRXMzTWNhTUM5WHNO?=
 =?utf-8?B?NkRBY0VkNEk1Z3F5STFLaDNrNWpQSVZKNmxRcmtYeWpyenBxR1VXMnRMRlVW?=
 =?utf-8?B?dUJCS01lak83ZjY3bjltQ3MzVk5sYmVLdG44Z1RCWVdxa2N5NGlIWHdnbFgx?=
 =?utf-8?B?ZWMxcERkdHZjZ0JTUUVtcC9ZSmpWNVhPVnY4N0Z4eHkwVFgrQm01ZS92YUh6?=
 =?utf-8?B?cGliTEZrL0VDOFJ4VkFaN3Z5MCt0Z3VDV3FpdlAzVE1pVW9RdVN4YUNoWTg5?=
 =?utf-8?B?d2xBbUtIVEhNditaVTFjMmJQdEpZYldJaXpFTEkraU56MjlUNWxoQmFFTFds?=
 =?utf-8?B?akFWTmp0YXhHb3RtM2hLS2xWU08vS01sdmI4SkdHUWFTV3JtSlV1eGlab1pv?=
 =?utf-8?B?WDAvSVh1M3FrYW9sMlRab1FsdGFaaW5lM1VQNUxZaEdNMlBkTTZ2N1J6R3My?=
 =?utf-8?B?R3dDWHZVN3NpamRQYWtETzBvZDdvelptSndWUS9oVXF4T1A5S0ZqTnMvU2Nj?=
 =?utf-8?B?SlczU2RxcVNkR3VxMlFHajloK1JObkJqZVJJQi9KUk5zTkw1L1I1Tm9PVHBG?=
 =?utf-8?B?Njh3YkRxVkExZlltcEMwRGNBQTNISTZUeE8vUC9HZ0VPZlRNSDNRRlNjb0Fr?=
 =?utf-8?B?Sk9GVG80M0Q2NG5DLzBMQTB5QjVMTlRSRzdHQ28vc1pXajRJWC96ajZWTVpG?=
 =?utf-8?B?cDZldCt0SnRxaWQ2RzQ5V2JoZ0hNV0xSM2FaUFdvckVZbi9QTk5nQkNrQ045?=
 =?utf-8?B?NHlXdkJiKzY3SnhrRFJNeTdtZmdIWnR2d2xIQ1JOdkZza2xPU2R6NXMrWmdp?=
 =?utf-8?B?dkRmQm1UZVlHbUtpclVxUVhRK0ZJL0J6QzM5Uzhyek1mVWxBTVYvYWE5aS93?=
 =?utf-8?B?R3dVWExRVVF5SGpSZkttc2MwSE42Y2JMVk1yak92dUhlNVNyUDREcG5ZUG9N?=
 =?utf-8?B?WTIwM3FlUDRtT2grbGRQblJrSkNLTTZxamxSbjZvWjloK21waEtoa3labFpW?=
 =?utf-8?B?OTdoc29ybXV0V01OSjFWVWZHQUZjbSt2RXFIVVNkR3B4dGpCcmVEWHlIZ1cw?=
 =?utf-8?B?bFVlQzBCcnc4amZCUWZiU1pTRlk3eDhybm9Wb0UrNU95enpZQzVPNzh0cXlz?=
 =?utf-8?B?ei9kazE2a3hML0tmNTN5eVNuMVQwZHZGUDhqZjgzdGtSNW9yajhONFY4Q01I?=
 =?utf-8?B?cG15aCtsQWg5bEJXTGxrTGo4dVowazZSQnpvNFVRVzU0ejZnaTVIU1RaUVBR?=
 =?utf-8?B?Vk1sQklYeHg2QWltdDZFQjRORTZLdEY1djlLSTJDQXVWNXRXT0dCSWZJZ3By?=
 =?utf-8?B?UHdONEErUGluYWJIYzlqRUZSSXhoOW56MFAvenJkMmxtTVFIUW5hMGtUMVpp?=
 =?utf-8?B?QUIrNVE2eHg0d216UFBGaWw0WDRaSkFUd2tEK1JWWkI1azJ1OUJLNG05dGZ1?=
 =?utf-8?B?c2hHR3JkSEVkT0ZhZlRpZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Sjk4QTFTWjlvbkN3Um5vMzJsVGZpcnkxYkkwSE12OVNMYzBtZXZiN2hEM1pW?=
 =?utf-8?B?WDR0bUpzV2JsZTlOam5GZFVlcURVRGVMU0hPRG1DOEZTZjJDNjNWMC9WcEtj?=
 =?utf-8?B?UldSVEkwUDhxQUVZcGhNR2hhTXF4UWpTZlhRTmtCdHJBQVZvZVh5enZhSitu?=
 =?utf-8?B?Rk9xellSMjBtamZpalUzZWdtd3dnZFlCNURnV2FtbFhJdzVSaDZDL1Fla09s?=
 =?utf-8?B?SUU3SDBxeHdsZTViNmZ1dWt0VzBVZVgzNWh3RWhzZGNWZThOdG9IYkNidzQy?=
 =?utf-8?B?aUFLaGZQemU5cjVCRkp4ZjlsZ1A1WlhEU202S2x6TkxRZWRxSENyRXlYOGNs?=
 =?utf-8?B?VS9MSlY1cTltTDdpSWdpcTh5a25LblJBNGhQL2FwcnNSL0JCTGRUMXZIYmZr?=
 =?utf-8?B?UmlLWFBlSWxydDZySEY3U2QrVlJwWitTcDBMMDg3YTFYbEdpU1ZjQmNUb0tC?=
 =?utf-8?B?VEtOVFhiK0JKdVErTmM3STFjN1FvSWlvVkFXb0hKdHpKcGxvMWtOUEVDeE43?=
 =?utf-8?B?Qyt3RE9SeVE2VmhwQmZjMnJZVDZzR2VOb2JzN1Arc0d4WHNRd1NDOWozMDA1?=
 =?utf-8?B?TS82em5WNzBDeTBLODUrTldWNkgvcnVBN1EzTkJxVUg1TkxlR3VXcldxTC9o?=
 =?utf-8?B?OFR1Z3M3SzB3eE5FSTF6bHJ1ZFdXNmZRN2ZwV1JXVUxKTjBuYmh3Y3BQTUVo?=
 =?utf-8?B?VVBRWm1nV3ErWGRuZ0xFM2FIR1Y5NzBpUG1xWmNZY1NIQUthK1FJSmx0V3BK?=
 =?utf-8?B?SlVRNnFrM2dHdWwxNDlaYzVtR2JBeEEwTHIwYWJvK2FkdEg0RVZlT2pqaXJk?=
 =?utf-8?B?aXU0Y3hrd3JpZnNuTEhqVEdQS0lWMTBYcjZpcEZvWjNldFhOWVJWeW5kdHJC?=
 =?utf-8?B?VEF0VUI2TFFCanJxdVg0elZyTXBpM0daOVNvU0d4bHY5aFZWMXJ0ZjZqMEo0?=
 =?utf-8?B?MVNQQkdmQjRvUFMxZWhkM2dWZG9PbFlBRGhpdTQrRVRIamRwdXM4WS9IUE5X?=
 =?utf-8?B?d0V4U1JuQXhIUUpuZWxxa1BCclJCVzRkK09KdmMxVk1zRXJybGt2dzF4VjZR?=
 =?utf-8?B?MExsYk9FWnNCekZCZVJsdnJSVEVSOFkyTXA1YVlScVA2WE0reWRhWkwzVVZh?=
 =?utf-8?B?bGdpS3lTKzExWnp3dy9pMk9BQjJuODJYSE9PNWJRRGRQY082K3BzSkFDVXJH?=
 =?utf-8?B?Q085bWJ0emxnQ1MxRm44U2NodkFQTm9kTy91WUIwcFFBV1lYSGFnNWVFSzk3?=
 =?utf-8?B?RnNvNEV3SkVNVnZCQTlkUVJkVXJIaDVLaStvS0VnSzdlaEM1aGJmakZ5WG41?=
 =?utf-8?B?bmUzMFdwd1Q2bnRHOGFkUjQ5RDByRkxVdGM1WWhseFllN2tEdG9uZEY1clFW?=
 =?utf-8?B?ajlwM3E3SnBtRVZjaDZ1eDRFTkJhOXNuUkpDU0UvYS9KN0dZa3NqckM5YzN6?=
 =?utf-8?B?UTNnYyt6QWEycEJRK21DZ3lRMmtvelpTZWJ3YVBpYmRzb1FpMlh0QllkZ24r?=
 =?utf-8?B?eXFEbC9sWnFjcXBvVE9tSENXNTRkeVVJODd6cVBWcHpmdFpJeEsyYUJVSmty?=
 =?utf-8?B?WVVQUkk5S0s2M2xIa1JZeTVrMXU2MHJrUFp5dW5KUUU2ZHA4N2trb2JrS0c5?=
 =?utf-8?B?VHovWkh4NGR3cS9KU1M0dnZ4ZFhwb2YyeVhncklYSUpvVnI0cHVIemN1bnd1?=
 =?utf-8?B?SWpLWGRhK3BTVVlHczQwOU5PdVQzYmN0L3ZNYzlYVGRveTVWQ1JrL1hnSzhC?=
 =?utf-8?B?SGV0cWVUbmNRdm9kdk1jWlV6bDlaMGFBU0E0WWZ4TkVzb2hJdytlam9LMnZO?=
 =?utf-8?B?eGRZTituUXJzUVlXVVlPc0cyRGhPTWhkaGZlMDIrYnNTcXphRzM4b0hGclRa?=
 =?utf-8?B?R0NpMkFtQUVTaFcwTk5CRCsycmtEd0dPOTNNUWFWdUpEd21vdGJXbzZuSjM4?=
 =?utf-8?B?U2xRNDRIWEZXYlp5ODlvRTROZlhTZGh4R3hncThLS2tKQnY2R1BLOUtTbHJQ?=
 =?utf-8?B?UXBwZDJyUmNkOWNOcmZJMjNhaUtUR3Z5OWExQUNxRGFWV2FVM21HNmNiNVlx?=
 =?utf-8?B?OGNKd3BJYVZsTGtsNWR6SzA2bTI5UEpHZkMyYU1YU3dHaWdhNDErL2Q3NVo4?=
 =?utf-8?B?ZUpBekc4d2xzWjJBcFh4cEdGSGtIa0dqZkF1M3pBdG9acXY3YUFVVnB4UzRY?=
 =?utf-8?B?VGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f071ad7e-e6e5-497f-1501-08dccbc7fe8d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 03:25:01.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IywiEdY7D5giI7ZVM062bWQrR0gNBZUZnD5VbwYGV/KO7xdm30Nxu0dbQXCjMxBgOiQAKQrZeOy8MXXr5nBtHzQ9oOTNDEIWEqaVY59btmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4590
X-Proofpoint-GUID: Ew7P3AIoSu4C3d6tj3x_2h2IMoOV7Izg
X-Authority-Analysis: v=2.4 cv=Qdk0vdbv c=1 sm=1 tr=0 ts=66d68190 cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=CEztZ7PSQkwK3G8Yt00A:9 a=QEXdDO2ut3YA:10
 a=3GJEsbVqAPbaK1gn9V0A:9 a=NZR_8riLEX4UAfgh:21 a=_W_S_7VecoQA:10
X-Proofpoint-ORIG-GUID: Ew7P3AIoSu4C3d6tj3x_2h2IMoOV7Izg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2409030024
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 03:25:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6049

--------------lluOJuUnayQ3B8CMkQBQlCQU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/17/24 11:09, Jon Mason wrote:
> On Wed, 15 May 2024 13:22:52 +0000, Ross Burton wrote:
>> Move the pexpect import inside the test method so that on machines without
>> pexpect installed we can still parse the test cases, even if this one
>> won't be pass.
>>
>>
> Applied, thanks!

Hi, Jon

Could you also cherry-pick this commit to scarthgap branch?

Thanks

Changqing

>
> [1/1] arm/oeqa/runtime/fvp_boot: move pexpect import into test method
>        commit: 200786d3a84b2c484de6e41c1f51c04173226950
>
> Best regards,
--------------lluOJuUnayQ3B8CMkQBQlCQU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/17/24 11:09, Jon Mason wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">
On Wed, 15 May 2024 13:22:52 +0000, Ross Burton wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Move the pexpect import inside the test method so that on machines without
pexpect installed we can still parse the test cases, even if this one
won't be pass.


</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Applied, thanks!</pre>
    </blockquote>
    <p>Hi, Jon</p>
    <p>Could you also cherry-pick this commit to scarthgap branch?</p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">

[1/1] arm/oeqa/runtime/fvp_boot: move pexpect import into test method
      commit: 200786d3a84b2c484de6e41c1f51c04173226950

Best regards,
</pre>
    </blockquote>
  </body>
</html>

--------------lluOJuUnayQ3B8CMkQBQlCQU--

