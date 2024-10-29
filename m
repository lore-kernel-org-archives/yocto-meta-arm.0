Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0F6D3A675
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 17:02:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web10.1822.1730221336999895926
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Oct 2024 10:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=WIiq0q4Y;
 spf=pass (domain: oss.nxp.com, ip: 40.107.22.76, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3ipFHBJEpDeLzZFr01AM9nU4fSNN/+MCAJQjHmRGhx+EjFiJgNvei9a7Z0X2ijMcKxCG25zYxlwEI1KZhX05NixqV3M5ALxcH42vISc2uROeRLckvVXYEqN2/Ep9VxG23VYZVGPNssYAJTqmo5W7Q+4O6Qz+U6VtCYx5WAHyUCAmeZIq54EHwVRl49r2XQkLRPPdUoNHi9RWITvoUhTdH14Jn9MX7s6bqcIkOt+/aNa209X2a6iQg2kCtpge6F1llNC7Oj9NnjTlWtftsdxQop4KNcC+S+TQKaK36C+WUHs17FSjy8QDMHqzzB28R3WQy9mwa4Y4F9n4KqS7PZijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1htTWjzu93aitqk2CVZ7O478xkdNu+6KHoAvordhpM=;
 b=p5R0cqhE24jG6wOSraDgJ8Mb3Q7eo+2RY3yAmgj4FDzY9ExBXSbv0+JT+fvql7ffSf/jHrZY+yDATAwh9ZCu0MgkqCJN2YldU5Suom84NDRg0YtxjR4r+wvEm4XldefRNQ7vWfeBx80Q3rRiRZRNDXddmajPmsKgj1w5+v9f/oSeOtM4m9+P4dmF+Xl6/DL/I+dSWA2QSKLdrDyw8boNgb9HL0wdh31QeK5ijsWch0zE2v/hhoayfoGe1mERVt+erfCPeAUhfuqznJaILezzjAJYcAb73EFkdEJ2wDPEJtf7ooG0zkjitzESsADpQBQBpjvSy5AioI3Fe1NoWXUqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1htTWjzu93aitqk2CVZ7O478xkdNu+6KHoAvordhpM=;
 b=WIiq0q4YzBg8bhLcL3csIHSqJi+PzuqrnJqQ8VpUJ01ASmHPyraUf8t50wDC3mCS9uygnHBiEuLBY1fm3OMdEINk8/U8vnGNywi/HRaiCMoEWgdbladMpFqXFDtDxMSC5MlyMC/yZuq7wOqbkbM1nW/CjD1vlv9V/25nW3bLnDI2n4tck0DC4J01ix/B9j6YZVkeSKFVnSWFX2ZyO6Mrp6SWZvWgLS9B81fMVPhA+h8A2q9Ej7mxz/Pe/DeQMF0HHq7VsB0liwCJEozFOO3CJM/EuijGym/R3HCDNBAC8sQU06h12fdCeF5zWcRnf29PoS1QBxOv/oq8FCblk1Dv0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9444.eurprd04.prod.outlook.com (2603:10a6:10:35c::5)
 by DUZPR04MB10015.eurprd04.prod.outlook.com (2603:10a6:10:4d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 17:02:13 +0000
Received: from DU0PR04MB9444.eurprd04.prod.outlook.com
 ([fe80::70d2:fa8e:4d48:2ba3]) by DU0PR04MB9444.eurprd04.prod.outlook.com
 ([fe80::70d2:fa8e:4d48:2ba3%4]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 17:02:13 +0000
Message-ID: <7c3c9ad1-a1e0-474f-8710-9b77d2a2ea17@oss.nxp.com>
Date: Tue, 29 Oct 2024 12:02:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] optee-client: use udev rule and systemd service
 from upstream
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 Tom Hochstein <tom.hochstein@nxp.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 Sahil Malhotra <sahil.malhotra@nxp.com>
References: <20241017065907.172504-1-mikko.rapeli@linaro.org>
 <PAXPR04MB9448F0D1DE0F84A6634EFBC5E24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkId04rSl5ykKCJ@nuoska>
 <PAXPR04MB9448DC39953E357F3E73D07EE24D2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <ZxkOI7vA6YDQZewJ@nuoska>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <ZxkOI7vA6YDQZewJ@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:806:d3::20) To DU0PR04MB9444.eurprd04.prod.outlook.com
 (2603:10a6:10:35c::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9444:EE_|DUZPR04MB10015:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc74640-56ff-400e-75d1-08dcf83b6f04
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODV6UmxRNk42MnhMUGRxUU1IYnc0bk43dzZ5UXI2SW11KzFoczZJMzYyU1Bu?=
 =?utf-8?B?cXI1TWZlUXZMYlRFTGlLV05yZGc2RU5PMUs4emVIcHpzL04reHJWV2ZkV3JO?=
 =?utf-8?B?RFRvcXNxQnYvRFFpUHE3L3Yzb0Y3L21HcWJKeC9JWE5kNmZlU1o1MlVpbEpF?=
 =?utf-8?B?SG1LaUtYSzB6MnBZWmM5RDBJNGU5WFFCeGVsMlFUenJ3N1V5K25aL3hvdXN1?=
 =?utf-8?B?b2Y0cTFJaUIwaGJEeFpLVFJZTkNLajZmZnd0cFBwbGlBa2ZnMS83TmZlS2RT?=
 =?utf-8?B?Y2tnL090UzdoTHpwWjdua1NIOGplTTdzR0lERkNzeVNucldDekJqMlcrK0ls?=
 =?utf-8?B?QklXRVJjL3E1NWtxVG02eHFDNEhUTnI5ZzZpbkR4MUkydUZGcmQ3TlNkMVpE?=
 =?utf-8?B?VjNvR01ocC83Z2RzbXFIUUpmdFRFZlhLZ2tOOFNKWXFFV05KMlZPZ3VqRXVZ?=
 =?utf-8?B?dmN2SFo5Y0RMRDJPQ25wZys4cm1jbkRYMmNyRGVFUmpyOWpMSy96ZUtGRzAv?=
 =?utf-8?B?QjdTZjBzMGlxQ3pMMlVJNEdPNWdtWi9saklISng5d3ZRVncrNXRRVlQ5U3Fo?=
 =?utf-8?B?Qm1pL1ptMFJuTkJwNG1sOWowcFpja1F5UE5SeTk5cjJudS8wTVFPeThhM2tH?=
 =?utf-8?B?WTNGWVNuVFloQU9oYWJPRzdzU0g3QnNhaVVFcWcrMzd5ODR3dXRLREZ4T3p0?=
 =?utf-8?B?bTU2NkxCL2xQK2plMmJkRmYyWVdQNmdQaXppK3R0SFFsMHhNczJQektTV3dY?=
 =?utf-8?B?ZHJXT0crb1Z6SnRVQVZlZm95ckE0Tzd6MkhRSUc5MXM3OTFrZDJFY2pIRytV?=
 =?utf-8?B?Y2hobDIzalVVTjNtSkJMeWliMUV2eEtUMmdlOXVFdDArWEowQUV3L3lTaTk2?=
 =?utf-8?B?Yzc3M29IcndKVDhjbVhqdFYxeTNqdnVOM3RyaE9CdjJaa2l4NTJGSDByRncx?=
 =?utf-8?B?V01va0N4WCtXUldvS3NhMklpL3pOY2p5L0JqWEVocFB5UzJ1SnRrRCtQM0lY?=
 =?utf-8?B?cVJ3Y2hnNkJXaUQ2c0tkWnV4eGJZZEtxR2xMaTNzYU0xR1gvZ3lZa3VTWEZY?=
 =?utf-8?B?YjZEN3R1ekZnZ0VMUGZOQ2dJYVVUbkJwRDVxMHQ4M1RKUzdGaldjbzNIeDMy?=
 =?utf-8?B?d0tUVWxjZU95YmVaakZrQkRYQVlESFJpVWM5OGliUFFldDZHU3d4UGZkdGU0?=
 =?utf-8?B?QjN4WXNKNUx2YlloQTA5MGt5NlprcTdVR3h0VlRGSHcxc1BTaU1VWXBMUGNh?=
 =?utf-8?B?QWpmdUFhTW5SWFFJeFlDR3YvNW8zVnJHZk9sc2dOR3R6bVR4RVIvU0N0WXdY?=
 =?utf-8?B?aEE5Z3dBdzR2QnF6dzc2Q1ZySERpQVVRbFBVR3lVS0NlUzJCMHpoOXArTGM0?=
 =?utf-8?B?WlNUOVg4bGxBWFU5Q3VoWXlkK3JqTG1IMmIzYkJxK2FXNXpyVWg0M3FKczNU?=
 =?utf-8?B?bm5sL1pONld2aE03bFJab05aU1BRNGljTEVEV2wwOEdycFdCNkNjcVRCaEN6?=
 =?utf-8?B?TmdXaHZRYkJGK1JKUUFJVlVhaHQrWjVxNXhXTzY0Q1hmbHVkbHUrNDdmUTFK?=
 =?utf-8?B?L0VwcTJ6VTBtNFBtdjJ2azRSMmdmZGZGM2NSbVdwblZBeGR3aGdrQ3gvYVpQ?=
 =?utf-8?B?YkFaV2F4anBCWjhWc0dsV3RWOWxJZGFQMEJIaFpwSERtS29wTWY1cFdGdXps?=
 =?utf-8?B?SVZlcjRzeVB3WUFReTI3OXN6NEFpa2FOaW0vNGVLWkNaNC9ONlZTZkljR05p?=
 =?utf-8?Q?kcp3SzyFIbMIJg6P1/WOVGjNSLaaFp1Y7INGW9m?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9444.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eG1CNTJhNGI0ei9SNGlhekVBWURRNG1mbnkrYndqcjhCWW1QcW5lRSs4RVIy?=
 =?utf-8?B?d3VCMW9QYnlQTFN0SUhnNzlpenNmRmI5aU1uZ2xZcEtYOExHelpudWdObnhL?=
 =?utf-8?B?ajVsRmF6TThhc2dJeWppTVFmc2F2czd2VVhibCtHVDd1U0VRMVYya1NieTZq?=
 =?utf-8?B?cWZ3SXkvQ1pMclg5VDVTc3JmazArd1pZUjFJa29XbTJpK1E5N01SS0x3eU5u?=
 =?utf-8?B?dHBhaXpXdGp0dVlINzNTdnNJejE3NHFiN0s2eWcxaWJGdDNmcVE3TGVmTTdz?=
 =?utf-8?B?QkU3d05ua0t1aEpieUVXM3lrRVE0WXBlS0lRKy9HQWpYVHMyNjhyMS93NCtr?=
 =?utf-8?B?ZzBkUG5meWpvczZ5NTV2d1QzMXNxSGxCWmE2VGZhOEVIQW44Q21YbS93VkFB?=
 =?utf-8?B?cGlGNTNCY01EWVJBZzE0ekZBWmF2eklKbEtRbzRBelh5a1JtbmkwV3Nycm03?=
 =?utf-8?B?ZGpKVnlZL2RwQm9zMGI1NXRGRmRlQlROMFEyWDZka1BGRXR6QytsNUJqUUpJ?=
 =?utf-8?B?ZVFhMnRDcVFENmZhY2FDYStxUUlPYjZmU3lXcFBGVGsvRHZEb2ZoaFEyKzd5?=
 =?utf-8?B?TjlEaW00SjEwa0VLZnBGNG13WjNaSzhrOFUrVUIyNkRXMWRybkQ0MCtJTm13?=
 =?utf-8?B?WFJWZjloYno5RTVVN1VKVVZpN2tZL3hSV1RVTzhWOHkrU0ovdHZwZ2pDUG54?=
 =?utf-8?B?eWwrNjIycmlDM2ZmWUpDVllUemVCWTJKUzNERklDdzRqWVMvT1IyRTFZZ0xk?=
 =?utf-8?B?cWFNN25OWUxiWTI1c21EWFBNeHVlWlZqNS9rR1BXd2czV2lBVXd2eFdqL2ZJ?=
 =?utf-8?B?RVRnc0IwQ2F0Q3lBQjJnL2pwKzhsdmZ5akovT2dkRnpQMWlidWFCSUJrOVFR?=
 =?utf-8?B?QmZVNnlPZmk1dXV3SkRWZHBUWHNUU3dsNlEvWUZvdVNCa1JUd3FEUzFLdTQ3?=
 =?utf-8?B?MUlQdXQ0YXhaS1l0Q1J5YnFna2gydnZIS0drM01DeXBpcWthQnpycUxySHhW?=
 =?utf-8?B?c1poRE5BUDhzVVpiY0h3czNEbFhXZjEzTlQxdGZhR3MzWFJPR202UkFrdDhi?=
 =?utf-8?B?RFRxeWRBbmhvaTF1MHJGN3BoQTRxNmhxOGxjRUx4aUJ2azVkR1ArNERLVnE2?=
 =?utf-8?B?Rk9TMk5JZXhWZTAzWHpJQkpvM1R3dGhnY0tST1I1UjhDclQzMEpaUUhCRVU3?=
 =?utf-8?B?UjNVcDRFang1SmNhQVE2TlVoYzc1bFFNN2ZqczRGaCtkUURUOTdpU2ZFSXh6?=
 =?utf-8?B?Q3FIUnlZR2hCQ1M1S1RkcmZiT216d3RvbnFSNVg4N0I4ejVadlhFNGlrcTlr?=
 =?utf-8?B?Nzd3L2ZObzVYNVp3OVRTejMvcWpaTzFUSUR0ZEhSTUFsbmtrTWlCZG1odnV4?=
 =?utf-8?B?d2htTm1BbkIrWWhBSlMyOTgwanFJb1pqSEpHVFN2RVhUNzJJOHF2eWRvb2pj?=
 =?utf-8?B?SDdDSGpheS9yVTZnb09DdXB3TjhTcjNLWUg2THZrK0N2R1FGUi9Ya1NpKzM5?=
 =?utf-8?B?UFNwZGJtTUtmZFVrRjZKTCtYYmxybWE0YUhVTnAxQ0ZFTHBlVFF3ekpIK3hX?=
 =?utf-8?B?UTdYc1Rpb2Eydnl6bzV5dUw5NEVhRWQva1cxR3E4VjRaMytoQmwrdDRBYktl?=
 =?utf-8?B?UFA4N2FlZC9sZ1pmSCt4N01TSllwTS9YNHVndVZiSGpzeGZlaWxVdXJua2xB?=
 =?utf-8?B?YXduRlBQWUd4eHd6ODRFempBTkxpWHJpSG5XalpKV3EzR1RQUGlIZS91cEhO?=
 =?utf-8?B?VUxKcGlpSHlCbnBSa2NHSTlyYmJjVE1NYVI2Sm5Nb2drUjJTOWhQdnErVVU3?=
 =?utf-8?B?TWgxMVEvd0xKUG9vSlJpdndwbHpDRStpdDhoUy8wYWZqUGkzQWV0QjBqMDhJ?=
 =?utf-8?B?Zkw4a1NRSFBvYVN6SWxkUkJCUy9uQy9ZOFQyOU1LdGlEYnpLNnRkRTNHbktp?=
 =?utf-8?B?SUJWc3RCZnlTcW5RR0RCRE9QQXVMZDAxKzdYbzdEWUFDV3VndUpxa3l1YnBE?=
 =?utf-8?B?NDBWQ09QNDE4em1wK2d1MWZkdG1paXJCS0NTa1RUOElURERtMmltT0s2ck5M?=
 =?utf-8?B?c09yTTQrRTIyTlVhUXliYVRMZVp3VFFDNmdUQVF6Ym0xeW40NVZOaStDL3dm?=
 =?utf-8?B?TXNHTHNqMjZHTXl3My9MLzZtbWNpVVl4MDRTdTh1YXZwS3VwME40TGtpRmJH?=
 =?utf-8?B?S0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc74640-56ff-400e-75d1-08dcf83b6f04
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9444.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:02:13.4206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/wxlUsr7QF4d18LEijcOf/IGL2W2uNyPYidU4guSL/TtvRghgDe+DrQFguYQn89ufB/IwL1S0sJy7RdY7i3Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10015
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Oct 2024 17:02:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6236

On 10/23/2024 9:54 AM, Mikko Rapeli wrote:
> Ok got it now.
> 
> ${nonarch_base_libdir} isn't in the CMake toolchain file. We could
> move ${libdir}/systemd unconditionlly to ${nonarch_base_libdir}/systemd
> in the do_install task. Could you test and submit a patch like below?
> 
> --- a/meta-arm/recipes-security/optee/optee-client.inc
> +++ b/meta-arm/recipes-security/optee/optee-client.inc
> @@ -23,8 +23,9 @@ EXTRA_OECMAKE:append:toolchain-clang = " -DCFG_WERROR=0"
>   
>   do_install:append() {
>       # installed by default
> +    mv ${D}${libdir}/systemd ${D}${noarch_base_libdir}/systemd
>       if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> -        rm -rf ${D}${libdir}/systemd
> +        rm -rf ${D}${noarch_base_libdir}/systemd
>       fi
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
>           install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant
> 
> Cheers,
> 
> -Mikko

This works fine in our testing. Sorry for the late response.

Thanks again!

Tom

