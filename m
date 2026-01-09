Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83F5D26D67
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:28:49 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12424.1767972523610367857
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 07:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=BTM5JGjq;
 spf=pass (domain: cherry.de, ip: 40.107.162.28, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmEjTbQxuT6msSiQOHzv6G5B7l2MukaDAG12YHYHAGJmM/+mzWsTIrchIaHO7VzTCN/Wv1D0vfAhforpW7NTW6Ie4wzvHr1r3U4d24kT5H71fTdn+ETR6xwTlG3kujmYgj7G0F4ua2zObrCAIOEuQZB0T1ouW2qvzPX0CkCzJ+OLuFoOQ/BQYv3VIzGt8icBk8Rb7JUz7BnCPJ+LZXoEtX34TMJTa6MNWBE+NcQ1hnsgdvHlmYHPUOY1frfwR9PZchNhYhHRBxTYnOeXDcdntru4wtX8u92nflRsZtdpwEoCZlHMqQzYIGaId8Q/28FTBP212b16Sp+OlhBzAt/HAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+duApypX/t7dLOlPEAqUtKdv+F3oc1TOnvRcq92m94M=;
 b=f21+m7/jDeBtbdObubnzoPUWE1ejFLlgi150F1T3gtq/cYzKLHCOfMsXoq8I11GP+/kVH0FS2Zv13auHevXF0ugdnjixmDORx9107dDysXeEMXiyW1NnNGHEbWcH5zMmEN4JoM1RJBpFjw+L8dc+DYGOxe1GDNd9/IOUmjtmot6cozClxqv/XQIxDMroOG9Uz2AmkywRFb1AzG2C2bOTA4r6hoAiwdryG5dCLn4ZIVp3ThA0k835f/TZwc+C/4c+qU7ar5inBJJ5oMUY4tNNl9IfZ97FB5j3v2vwyJEIoXQOxT5MEGAdqzA8qcR90mLhzxQ25pdLnZi474JglBadYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+duApypX/t7dLOlPEAqUtKdv+F3oc1TOnvRcq92m94M=;
 b=BTM5JGjqxD8t0thBxl1l5fyfb+++NZZZpLpRbYOXdmHLww6oplWpL0dEB4LaMxDNgoSBH3f1s+d6VHprNYXeTaHlTceOvz2m+b/GdUMHuZNTMZbHjzlpcNh1JQrPQlWej/Bfkv8z4nn+eQ5v+S5uTLxeqnpaeFC4NQ4RUnyolpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7515.eurprd04.prod.outlook.com (2603:10a6:10:202::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 15:28:39 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 15:28:39 +0000
Message-ID: <4d7e8527-be0e-48e1-bc96-fbd64ae1ac5f@cherry.de>
Date: Fri, 9 Jan 2026 16:27:43 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
From: Quentin Schulz <quentin.schulz@cherry.de>
Subject: Regression in TF-A installed/deployed artifacts
Cc: meta-arm@lists.yoctoproject.org, Trevor Woerner <twoerner@gmail.com>,
 Peter Hoyes <peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0161.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc18f96-9b7b-477e-18f7-08de4f93c37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?djVzUGFqanVaUVRESUhQRDB0bUs1OG00c3FPUHhWZyszVVhZZ2Z4bWZHT1Bq?=
 =?utf-8?B?Q2V5Sk9aM0E0bGxGZk5rdkV1a0VTQk1ab1ZrdkNZako1K2lvYW1tR3FSaDZW?=
 =?utf-8?B?NHovUEtuRjhNNXMyTlc5MUNTbGJEUzJEZDFMSXB4UFlYWFU0aDI3bnoyUXZo?=
 =?utf-8?B?b3dCY3IwaWRzTHN6bXdhT0dGT2o0d1Nybk9DSElxMURsZ3hsM0l1TEFZRXpS?=
 =?utf-8?B?YjdRUHhIN1cwRHdRUE1HcjBpdUh2YkFLaXl2dnd1NmE5eklOaUVNb0VmOHp6?=
 =?utf-8?B?TU1jZWIzQ0FXRG1UajJvbzIzUnJmTXJGZFlPNEEzajBRckIwcXZPREFDMUJ1?=
 =?utf-8?B?a0lIMEN4UHRINE4vTVJKSTFKbnh5UWkrMGhlYjN5VDJpN2IrMzJjTWF2aENu?=
 =?utf-8?B?dVhhai9tUEhXU0VreWY5WVIzamo4SDdnOTdkVno3YWNlM2J1enJpQm4rYUtu?=
 =?utf-8?B?bGN1UUxlcmhlNStFSlFITTNZUmMvV0tuTVUwd09PUFQxYkx0L3haUGhPMUNo?=
 =?utf-8?B?VFN3MmZNRkZvZFRrUis5b1dJRVp3NFNodlV0eTFkdzVTZVROaEUxWDByUEMz?=
 =?utf-8?B?MlZnS1M4UWZ1NklvOVBDaUptamY1ZDNIcUE2ZW1JaHA2N3o1SEFQNWt5ek52?=
 =?utf-8?B?Nk1lTXZCd2h1MktBNkt3US8wMzZraTMwcGJTTG9naVFreiszWEtaSmhvdEx0?=
 =?utf-8?B?TVB1eEJ1U3BUK1F0K0NzQ0JML1MzekoyL2lzYStnU1RTUktYQ3FQSHc5Tk1F?=
 =?utf-8?B?dVZyU3NVcGJWTzUwYXJCcmphWThZc2lOMWdodmQvdDVNYUliUWloRXJ5bDBu?=
 =?utf-8?B?eS9kdjlCNEdBYmlBUnB5UFl6V0VjWUpLMmdmODFNU2Z1K0w3ZVRLeEZaZWVE?=
 =?utf-8?B?blBFbzJEelh0RytmWG1KbWxKS3NGYWFDTXppdnI0RFBvSlA5aDliRVJ5Z3RG?=
 =?utf-8?B?a1Bldkk4RXdObCtoZWc4T1ROeDVCbDlqWjhZN092RnpOSDEzZFZPdEh6alJo?=
 =?utf-8?B?YnNHdXJtT284VjlFRmt4dEhTaUMxdWdhZm1lRTZHK2o3eWl4N1YwQ0xORHRZ?=
 =?utf-8?B?djdrcXJoVkZ6OUQ4clhoMXBQbGtxdWJ1ZTZOQlJrZEFYZVJGVDZWbmtHbk9k?=
 =?utf-8?B?QWFYR3VPWndINlNUcElRelFQZEJiYlYwaGFZa2NmaWtPcW9hN2xha24vRjlZ?=
 =?utf-8?B?RHNxOGRnOXhpRC9HRW9YbnJRNTkzSFFZSHgyeXZ0ajNyNXRMVnJXTzNTWW1l?=
 =?utf-8?B?Tkd4VmxsK1kxbkJqZlVGcGdocmJ1eVRQRXpHN0NCZjZNMmFrNThrMklCUHdB?=
 =?utf-8?B?US9wVDd5OWdQNGNxUE1uTVlvQUNmMHZCTmhFT3ViQktXUEx0d0FVQ09FVzNp?=
 =?utf-8?B?L2tmamFHdWxRODRRZkRBd054eFk0aDB0ald3Qi9KNEM5VnJxamVmeXZFdWFu?=
 =?utf-8?B?YktzQVJzeWpsM1hJVmJPY25ZQmZjUnlOLy83cklseEVsdFZ1UCtNSGNVZmxG?=
 =?utf-8?B?NExtbFh3TW1YalV3aVQvYklnbVBMdllnWWxRWWR1YUF2MzdSL3U4bVhSVkR4?=
 =?utf-8?B?Q2ZLWkVGM0prYk9oQXlSRTRZMy9FUWlYWG52STlHcmJUVmdSQjVOY1RXcVBu?=
 =?utf-8?B?SXh2TGNaS21kUTdMZ29qMFhJVFl2N0lwOCtlRW02L0g4VndOWkMzMlNjaHRh?=
 =?utf-8?B?TUpiVlRuVS9NRlE5Z1lqcXpKRkRjWjd4VzhkdEsydEY5RmJVRmxFanVIcU9w?=
 =?utf-8?B?Tno3RjhveVgxaHBaYmlqbGRXTnpCM3lzd2xNZWJqMzY5RVpJL2k3aDZYbEJn?=
 =?utf-8?B?VzlycjhBM0hKYlBraUNxUUN2akxLenpoWUZ1WWZKem1jRC9TaWEvcjdpOXU1?=
 =?utf-8?B?bWtneGpLNFdDM3Q1V2FiL2dKWHNrS0RmZEhuT3d5MWN1Zm45WjFDczNmcEJz?=
 =?utf-8?Q?vxKddfFBFiI9sio+rbwnCU1OF6ANn+zr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTAySkYyQzhXVlpCY3Q3MkUvZ2g1RXdiMytBRlBUUHlrUlZNd3ZheWNmRHBh?=
 =?utf-8?B?cXFQRUlPaE5pVXpnMXlMUlFyM3pzNmhOcnorRThDRDZ2T0d1Q1hoVGs3RXEv?=
 =?utf-8?B?WUQ2SUZQRWpucjQwc2xmYndVb29jcHVuTlpsU3FJVFlqWEJBVEVoYXpUdWJR?=
 =?utf-8?B?YXRhVXhadERmMDhtWWNhTVcwVDRpZ2EwTnBGcmtFbGgxcjFFZ1pDcE13QVk2?=
 =?utf-8?B?TmlyOXpjT2xpWUJaMmRjL01NZGdiOW5Sb09uWVN6djlkZy9ObUxwdE05azF3?=
 =?utf-8?B?bUhTSTRaS1ZHL0tWZG1BRlZldlFnbUduSGNYeFhtV3ZmVE0yaVduYmFnQm5T?=
 =?utf-8?B?VkNwOHNWOTk0ay80WTc0V01oTTNmTFVTT0p2YlN0bXIveHNCUXdKVVRhK09H?=
 =?utf-8?B?WTA0aWhvUUZDRDZId0JORDdiajBBRVplR2Z6clZmZG1ZUnI0cjUxT3p2aU9s?=
 =?utf-8?B?QlBYVFhlQi90VnF5YmQzZ1NTMEt1M1dmTDV1RXQ4T1B3M0NBODBPaHlMVC9I?=
 =?utf-8?B?blhiTXVrR2Q0TDhGbXlETm84bmI0VkVjRUx2SjE3Y2hOWnlCKzRZTEJleWJl?=
 =?utf-8?B?TFlpeVVpRUJseUI2T2JWbHMyVjYxcGxwR3RYdndaVkZNdWo4ZHpJNnZUQjFX?=
 =?utf-8?B?ZUM1bDM4dHIxQnJKM3UxN2NXajdsUHJwWEIzeWQ1VzZQU0JRL1Q2ak1VVm1D?=
 =?utf-8?B?K05MUXp3a3FNQTBIcndPTHBtZjlJSS9tVHZTOXZvcjZTa3Qxc2hORE03c2Zh?=
 =?utf-8?B?TC9rZm1YcVRjQk5JTC9pazRSVGdLN2NMYmM5SkN4WTNVTDRvNGNId1Vpdzhq?=
 =?utf-8?B?VWQyR2w5b0ZLV094akhLWTd0ekJLYjFlM2NNOEVmMmIySlBrQ3lWL29wQUNJ?=
 =?utf-8?B?dVVBakI5NXFObkVSZmNrRkRoc1Faa0VQbzA1MVEvWHp5emtkQXd6d1ZwOGZw?=
 =?utf-8?B?TStjZXUzb0ZKY0ROTEZiWEdQV21uY2VLOGsvMmhOTVJRaUpPR2Z0S3dONTBJ?=
 =?utf-8?B?ZHFTR2EzY2VEVVd3OEJVS3VpWHdDZENlWFk3a1FQdjFvYk1QejRaZVoxUm1z?=
 =?utf-8?B?UWMrcWZCNjJOTWNHYjFxWGJKZnJhaVFLYTVUUmRRQ0ljakNERGVTUGZ0bE9S?=
 =?utf-8?B?N0hPOFREOHQwUDFjV1lSVkgxcDVUTjRoOUxlc0d4QkhNMkFlcnZobjRibEt0?=
 =?utf-8?B?TExPTkpocDdhL3VBSklDRkF2YXhyaWlHNnpnbmJCRkpqN0VBdGZNdFZXd1Ji?=
 =?utf-8?B?YUtTWDZnWSt5L1h6STVMRitKMFNBbFAvV0lkMm1BT3haTUpJTzdMU29UeUNy?=
 =?utf-8?B?cHMzK1NDK05LOEJtbFVaN1ZsSU1yYkZsTnRQSVNHRFhPd2s5TFB4aWptV3VR?=
 =?utf-8?B?VWxKNWNXZ3BzclF3dnRBVjd4OXhBQnRCbkx0bnR6NG1sWGZZWFpMbldoVFhK?=
 =?utf-8?B?SnM2MXRqYmhYUDdZcldFMVpkSUtoWEgwZXhNZml3MGlzNkQ1b0VzQ0oyNnJz?=
 =?utf-8?B?d0Q0cTQrNExGaGhiR2dZbmJvbU0rV2Rta0g4ZmM0SCt4RHZOTmx6bUZPaXVT?=
 =?utf-8?B?WXMrY2NTZ1BGTDZRZkFFUmgzdE1XczhLZGpFejNqRllnUnk0Z1FaTENtelJZ?=
 =?utf-8?B?bUI4Ty9LRTl0Rlk0Z215ZkpyaUErTDdPWWx4d1dJTm1lTDNvQ3p2TDUyczNR?=
 =?utf-8?B?SzIzQ29WaHdpUXd5Y1pmeHd2VXRhZ1c3NE5scDhNeFErVHJsSStvRzVXUUxl?=
 =?utf-8?B?NlIzL21aTVdDUk5tS28wL3k4ZXVLUjJZWVMzYk1PR0s1K0pIN2lCNWdrSDcr?=
 =?utf-8?B?RjZtMnYxMmNibGxiOE41QkRLTktlQzY4YUtqeG52amVOeVNuWEdNOGtucTZX?=
 =?utf-8?B?VTVNc29OQldOanl4T0xjMXAyN0JSU2k5SjRlRm5xalgwdFNuUDQzcFB5TFVB?=
 =?utf-8?B?Zk45NEhReENtby8wcGlmNHlKVmFLYjNrUjIydThmNG9pWi9JcXpsT09DRSts?=
 =?utf-8?B?QktmZFhTMzFsN256TWVTQ1RCa3NNNjIyVldIOEx3SXlGbDExS0NWY04vZnBv?=
 =?utf-8?B?YTRzWjQ1NDhEZ2dvZlN0YWJaNUxBZG1aTFhZNWdObWcrVjRjWEZ0cTZwWFMr?=
 =?utf-8?B?eUg0UlZhT1o2SjRDS1duSnJWYmlqMFBzZ1BGYk5SMm5LZGN0RnhMVzJVTXkr?=
 =?utf-8?B?WGZTUW9JYW1qczFYdElNZE1JWmEzcWREb0NVNnJSUjFyUmx2UWJVUUFqOTBC?=
 =?utf-8?B?ZThDZ1pUSUNFRytNOTdheXJxdkdxdm5lekhJeFNTQ3lHK1U3bDNHVmNGSDM3?=
 =?utf-8?B?aUNSM0JTNTdVeHJFdjJZbmRqWExGZ1dkTDBZcjhRamQ0cWVMcDFNRDFzVklL?=
 =?utf-8?Q?vjIP2s/prAPRaFdc=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc18f96-9b7b-477e-18f7-08de4f93c37a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:28:39.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2zvnKgZaWDwV3pkRLD/EoNSAAcWctbKUtvjD0roJacZ8S95RYn+iGV3zWmkW6QxYVpRpcZ86Sy98DIXnldP0Mr3mZz5MjXRWT9Ds/lAIl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7515
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Jan 2026 15:28:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6827

Hi,

I believe there's been a regression since commit 7bce36a2c64b 
("arm/trusted-firmware-a: Use firmware.bbclass") where the installed 
name isn't bl31-<platform>.elf anymore, but simply bl31.elf.

This commit removed -${TFA_PLATFORM} from the installed firmware 
filename (and the symlink). The commit log seems to hint that this was 
intended "Drop the redundant ${TFA_PLATFORM} suffixes."... which isn't?

Changing TFA_INSTALL_SUFFIX to the value of TFA_PLATFORM (it currently 
is the empty string) would help with that but then you either have 
bl31.elf or bl31-rk3399.elf (for example). I don't mind about that, but 
still odd to remove a symlink.

meta-rockchip has support for TF-A binary blobs from Rockchip, which we 
do name bl31-rk3399.elf and since this filename needs to be consistent 
between upstream tf-a and blob tf-a (and we cannot modify U-Boot's BL31 
variable from TF-A's recipe due to variable scope), this broke builds of 
meta-rockchip and forced the following (yet incomplete) band-aid patch 
https://git.yoctoproject.org/meta-rockchip/commit/?id=2a13a49da4af4487ee71db6aff19364220da694a. 
I'm now trying to figure out how to properly fix that.

Additionally, the binaries are now forced into a subdirectory named 
after the recipe (see do_deploy in firmware.bbclass) and cannot be 
modified. So I need to patch our TF-A blob recipe to install in the 
identically named directory (that is, trusted-firmware-a/) so that 
U-Boot can find the binary named the same in the same location 
regardless of the kind of TF-A we're building. It does feel kinda wrong 
doing that.

Maybe you can explain the rationale behind those choices? And what's the 
best course of action for meta-rockchip?

Thanks!
Quentin

