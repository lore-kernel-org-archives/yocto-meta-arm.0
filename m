Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FEFD13C13
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:49:17 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20322.1769435350534153754
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Jan 2026 05:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=liCAIbHc;
 spf=pass (domain: cherry.de, ip: 52.101.83.51, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNUiX0hL2ETSJz0vbW/iDr8EVnkXs518Apo18iKL3nKlBzjc9NB5NOXAxZ0MedRuvfsFogcWrCzA/wWY72Z/d4JuNTUFDPSiml4HE4Ue6pyMborqIPqM8oR2kM7VhxCcpAT2agk/IzdXjqbM2Sqk7R1Wv5lO7NrcxQaNKQxbDs+zh+wEFj+AW9fzIG0V5vUr3bgJF02nB3hLDclSHws7speCun+K7ACIuEDtQFFuMHKWIdFUuRhOFIlIq8FO0E8gKHQhGsENZotoOk1dz8FKU+ZuenYmFxnV5Pnw9TT+Kk5+3uwoVazLpSLZh3IgJPQENzJGF/ZVHk91mDTMlLv0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUi2I5kJtp7jSGUWg3nsxPMHv718Tl9eKX380MQ+EPA=;
 b=YmYwY2R61bzlZ6H/FykjLRnqPCDAShy/XA34LRX+lBqKFIUhoElf61cWzjP1zsS3VSy79RbXykiao5FyDyT/Juep67BHeo0/eEwgJNsrgA3vFlSpAYjpPqq0C1KAxSCkwDsFm4CuX6OoSdkTGqS0NUz1eyhooy8Sq+R6iBtY5qlisYrIDIv0oOzROGgWtGmO1wB8QDNn/+4BO6vezSRm296ltP/1a3iUwYYmzg2H2A2th96Hcm+1QD35RmYNtUMKEMCON2/3HW4+bBZ5A3btAWW2brTZt5Yx9AECPgmODiU2JMmIeNTMPw5Fhwz8h6JQ7iIQ2TJ1W6M7aJbYZYxCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUi2I5kJtp7jSGUWg3nsxPMHv718Tl9eKX380MQ+EPA=;
 b=liCAIbHc9MdI2qmS9ZFWqRj7T+W1buzntcaPCQA+Ge6VjynAtWi+OcvYhK7dPntg4RBvETMs9uQrq86X23pnY7ou1fCW4AlbC0Odk93k9wiQTGD1KS58/TYxv8bvdQEG5hF5fuPpYKXRwPDaEoaIS+ndyQYCEVDTHZGd2RTviX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB8076.eurprd04.prod.outlook.com (2603:10a6:10:246::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:49:04 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:49:04 +0000
Message-ID: <5577d221-3d0b-4e1f-8106-0c657c07f195@cherry.de>
Date: Mon, 26 Jan 2026 14:48:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm/arm-bsp: optee: add version 4.9.0
To: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
 meta-arm@lists.yoctoproject.org
References: <20260121140356.16818-1-hugues.kambampiana@arm.com>
 <20260121140356.16818-2-hugues.kambampiana@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260121140356.16818-2-hugues.kambampiana@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cada64-d55b-46a3-e60a-08de5ce1ab35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dk1tS1dRaFhFRWdlM2diQzhiZ2tMSjl3UkRoTnFSbUN2K2NqbWZWcllrdzVr?=
 =?utf-8?B?enI0dHFVbTRNc2JmcW41UGU1VW9sdkRvRmwyekdub2ZMZ1ROWUIrc2NFOWRs?=
 =?utf-8?B?dG1CTjY1dVZQaTVKZ3h4S1dONEdrTS85RzVrRkFYVHBYdjd4UW51ZzlRQTli?=
 =?utf-8?B?ajNoNDBNMHM3M0ZncU1nVTkvZWx0VjFrdFlqREwrdnNxL3lDWlJCS3F0emlk?=
 =?utf-8?B?Z29VRStHSlhOOWhCd090QmFYV0dGd3dzbnRUNFM3aG9WOHRQalBUTXZTOVRk?=
 =?utf-8?B?dTduSUNCcndmYmw3SHBBWWl0MXQ1VmluVDJsQUtYcnE0ZFM4dko5UnBZK2Ry?=
 =?utf-8?B?ZGt0MFo0L21scWh1aUFJZWNGYS9YemdEQ2NuV2xwNi91Sm1FMVYyRXh2Q2ox?=
 =?utf-8?B?a2prNW9pMGpzQS9ibWlnS0VYSHFCQzQwN1dlRTFzT3BuM0tReVhocndKTE81?=
 =?utf-8?B?R2xDNGR3L3FkOWN4WVVYajZGMFZ4WWVjOTgzWStUckJ0cnhtaWF6bzhiSjhq?=
 =?utf-8?B?bTBhK3VHTUtTR3BPTlBKV0N4T0FyOHBRdG1LZFJ5ZTQ0VkhXL3prZ091M3F6?=
 =?utf-8?B?Z21PVHdUY1IwRXNqeDh4TUNlNEFyamN5Vnc5dThjOG0yVTNFTXhMUm5zczF1?=
 =?utf-8?B?SVc2anZPNzZVSjFyS1dyMFdpZld0QmFRNjRhL1pLa1VpSnlvd1NpM1J6ZW9W?=
 =?utf-8?B?bXVxUEllYWsxSFZ0MGk1ODhrMSs0RjlYekkyV0JZU0tKbUZyTjAxekkyRzhZ?=
 =?utf-8?B?V3RjRDJ3UU9QaW53TzlPd1Z4c2cxZGRGNzlqdW5iN2NoU0tuT1cyUTBTamZa?=
 =?utf-8?B?bUpaUWMxNlZPZGtibmhhVlBKb1FaVjVBa29jcmYzdDJiQ28zb2kvWWJyb3Yv?=
 =?utf-8?B?NkJXQlMvYUNDbHFvNHNzbmhQaTJQeU9lNFJJOHlQc3Z2T3FscHRkQ0FDbDNE?=
 =?utf-8?B?NE1IWVhLQ1NzS21ORlFIVGlYOFlNVENMVkZVTnMrazVmcWpqVzFTaUNtcEdi?=
 =?utf-8?B?aFBDbUU2Y05sL0NHWkxJTVpNamNxNmJXOFZNdjE3L1pScDRxaWlIRUlNRGtJ?=
 =?utf-8?B?amhYOEZ0OWdTQzU4QjhmTllyU1VPS0prZE55NWVxV0MrbGxoMllWY0tzNkJ0?=
 =?utf-8?B?VmdSM2hvS3RlTEZyZVYxeHFQR3JXOXk0TFhXR1dMNUxSb1o1LzhhUDQwUG1v?=
 =?utf-8?B?WmUxSTVwL2g1RFBZNHJQK1VkY2RqUlZrZHhQTHQ5dDI4QzdmY2kvRVMzWHA2?=
 =?utf-8?B?dDRPVWVWS0tmaS9rSjY3bFFPc0J0Q1V0UTdJWUNZUS92UWFIclNma01NSDJX?=
 =?utf-8?B?aW93Vzh5RUIySVpnVEg2blFWdmxPNVZrSThSZlBjaFNwQUVXWEhHb2NUTG9n?=
 =?utf-8?B?d2M5anBEdTVEenkySTVacHB4a1o2WjMrNFp3MDRwWk5SbUJOTEtFQ3VRSXBq?=
 =?utf-8?B?WExmeWsrMnQ0eGkxUmVDbXRvWjRwQ3FWNTEySVZ2NlJDNEo5M0JNS0FXa3Rh?=
 =?utf-8?B?MDJTamcwQnkxZ1UrVmFxZURkM0YzY3F2Ui9ydklzYWV1RzRhOERYdGh2Mnhi?=
 =?utf-8?B?ZzdJdzVXTmlUK1V1MWEzQWlEUE5vUW5VdjBLMXZCd21uaGplQlg5WTVYdytZ?=
 =?utf-8?B?djJ5THRka25zTldCV3ZCWGZuZERZTGp2MGtoRU80bTJWdlNCQzkzbk15R3pt?=
 =?utf-8?B?UEJ5cDBTWnZnMGovaDkreGZYTVF0ZnJRWi9KNy9vTEE0SE1CWDN4VVN2NGdH?=
 =?utf-8?B?d2RKSVk4N20rYUY3UDVCenJsc0dmOWh1ZTVibWNhcEFhV2lsQkVxbi9Sc2F1?=
 =?utf-8?B?bVdzL0VacWt3MjREZlUyMTFESXRTUC9zc0VwUFpTZDAwbHd5cHdRSjhYVVFF?=
 =?utf-8?B?Nm5xbXJGWExENTZyd3NYQnBjcE90UVV6L2hsYVd0bHpydDJBZDAxRTJYUlZD?=
 =?utf-8?B?SEFWcy81YWJiTytXQ2FPVE1DVGswT21lY0ZzY3BFVzJtSnhYci9UNWROQW1j?=
 =?utf-8?B?TW01VklYOGNCTmlZRnRjZDBlZ0hiYWN5M0x0ckhld01JdE1GeHZFRXhkUHN6?=
 =?utf-8?B?bG1KalIyVUJ0eXJZT1lVQjRkRCtKMkt6TTRNSUhVdE9icXBOYTZVTDNsRll5?=
 =?utf-8?Q?gISs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2JnWXJXWmt1QjZvWE5jbjFKMU82M0ZWckoxamc1eFdRdUxjeTRudTlMMytC?=
 =?utf-8?B?NHNvNHhRRHVIVHdkOWY1NkdFZS85OU54eHBTT09vRU5vb3YxZmkwNW9uT2Zm?=
 =?utf-8?B?SlJtQ0d6NlU1dnVkeWhlOFNaN2p6M0F5Y2hRdHg3Y3NyM0V0elQvOS9rd3BP?=
 =?utf-8?B?OGlTdm9IWXN2RWZkUzd3KzFtRWk0OFhUb2U1QVFPUm9ZVXRQRzhneUZEckxH?=
 =?utf-8?B?a040UmR6ZkxhRUttQ0F4ZkNGVDFiejBUVE1YWnRkcTVmU2hGQXROQjNJS2hl?=
 =?utf-8?B?d085alI5S0VDQ01IeG45UW56aXg5SGNaZ0xpOHlJZTBXZUxqMG5FNU5zMk43?=
 =?utf-8?B?eFhFaXo1eEVaaHhrOHNnOU1yNWthUTZjS2FWd0VoVU1RdjJ0S0h0TGdMeWZs?=
 =?utf-8?B?WkRmUWsvTVMyL1pkL3VSaFA4TFRQbzc5NEk5Vk9MZENBZ0dFU1U3dlJreW5S?=
 =?utf-8?B?eU1BQVdDak5xbjNHRWVRR2JLS3NkY2xrMHRlVG1wUG8vcnM3SEs2dU5Zejhl?=
 =?utf-8?B?ak9hSzBseUREQjZIWmppNXpzSjJFaDRKRG85WTFidVdXUkZxdWNpakUwS3dE?=
 =?utf-8?B?UmFqZDBRYWtiMkFGZDhQdmJOY0tyMHUxb1ZXVUpvdEsvbFR3RGhtRDVHbWth?=
 =?utf-8?B?RFYyYnpickEzRlJrTHRHY0lKSHd4SVNGL0RxQkIwR1gxOTQxNU03ZlNMZWI0?=
 =?utf-8?B?Lzd4dklXVzltaHJPT3NrZXdjamExQ2ZMTlJkL29sRGxXMGFTZnRuK05BUSto?=
 =?utf-8?B?NkpXSCtybWhxaHF0L3FaaU1oV2xCOU9OeHlGRkNORmhNME9xWndoZWNNdXNL?=
 =?utf-8?B?bG8xam41RlpQQVpScWxJb1U1RmN6YkRYVFhZaWhrcUY5SXdwc29ySVQ0MnJj?=
 =?utf-8?B?YUlyN2JreDBTRTRyLzZxb0tlaXJZK2F0UmpKTGxGNTlvaDN6aFM2dVFDSERI?=
 =?utf-8?B?OGk4NGxsY0w0UFU4bkdBY0xxZU4rWUlmZDBZWE5JeXZEai9TaXNCMkhVN2tM?=
 =?utf-8?B?Nkk0TjJuc1RZNUtmb0JKd0V6TE00a0dIaitHeUxCamhRNXpjVVNOb2ZsRlZX?=
 =?utf-8?B?V3BySDUwZjRaU1hXWk0wcHRab2V5Y0kxVVd2UHRhTkVidkNnLzFIV2UwZFQ4?=
 =?utf-8?B?Yko1NzlPUUdLRDdHb1kxV1kvQWQ3NERJTVpTdHRydVhzd1lWcDduUzRtRzRt?=
 =?utf-8?B?ZUkvR2kvZDQ5Y1FzRGQrVW9kemlFbzJTdldpRTZTK1RyeXFjU1VoYzBkcEY5?=
 =?utf-8?B?V1pwd1Y4Y0N2b3V2Ui9WTEF4MzE2K2M0Nmt4dGo5ZTJtRkNEVUlmRVVJSGxE?=
 =?utf-8?B?MDloWURhOG02T0ZCaHFsL1RNa1MraTE0TGNOejhMOGZJZWJUd0dsNjEydkpK?=
 =?utf-8?B?YjZxbHVId1F1QW5jMWYvRzlGK21nbnNKbkVrS3VnUHN6YnhrV2ExeHFyUFRo?=
 =?utf-8?B?R3phYWNJbC9yN3RaRjY5WUZaRE85VVlCWjdKdTFrV2FVUkIxdTVqdjB5RFRy?=
 =?utf-8?B?cnU1TjdJeFI4c0tza2xQVjZTRVlVSU9COUkyZmNBWml1VGZiYlJYcXBnU01j?=
 =?utf-8?B?Vit2K053bytBbVR6U29DNVNIcitTVFU0THQ3MFdodWd4dVhIUEt6WWRFSDVH?=
 =?utf-8?B?ZWlyTlNDRStWSHRRT2FhR1c2YzhCQ24yN1lYSm5NRzdQekhWM1FwUGhGMXEr?=
 =?utf-8?B?aUdRNnZUV0FpM0tQcVVWRm1hNTRJMUFXQ2Q5NHNMVnRycEVpQ3cyNnRwd0xJ?=
 =?utf-8?B?bjFTZzVYcGJuN1N5UlpTUDYvK0tQRXdRK1AvakVWR0VJekhoNzdKZmdnYkgx?=
 =?utf-8?B?c1pQUnpuV3ZGRi9sb1gxZTlyZVE2V2lwaVFZWFRJRDhpclRRSnd3MDh2Wjhl?=
 =?utf-8?B?ZWJaZ3o1UzNmZFVZbkp0SDZjMUN0M0JwTzNsZjU3RGx6QU1QVU5DTUNVdkxL?=
 =?utf-8?B?ZWk3cER0SXhoQXBjWVV0cjRjeVhKNFg5bVNuNjNLTGhRVFozUWFFZG1QT2px?=
 =?utf-8?B?VmJ5eHVFNDc2QjFuSFhqWm9DTVhDWTFWKzMxVkYwWDFTOGFGSlJhSWpTR1RN?=
 =?utf-8?B?eS9SRkI1aG1NNDF1Ry81UzZvcHhNK1JaenY3L20rdmN4V0Zpa0JpVjhMN2Qr?=
 =?utf-8?B?OThNb2RWeGMwZTRabm8xRmJIUE1LZG9QQi91cFBsNHNtNEwrQzhhMFUwQ3JO?=
 =?utf-8?B?VEdPWGtqOUwrdTlQM3N1ZUtSQzhlekliNkd6QlpESldvUGlWb1NlcWw2dEhl?=
 =?utf-8?B?TEZiVzd4SlBzN2hNWGU0ZG55SHBGVUZvZVFxWEo5bkJ4SlVTcWR6M1JzUWVk?=
 =?utf-8?B?S0g2eHNxbWZIMzZoNXFxZjYrNGkzRjg4amZtU1FKOXhzdVl1NmNYdVdKd2hV?=
 =?utf-8?Q?YOHYgEWR+7fpZaIm0UGIzsZRV7h0o+U1OASA6?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cada64-d55b-46a3-e60a-08de5ce1ab35
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:49:04.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUmdHFVt3YRNIOlu1bpXWYqR2GbIwYlReFvLle7Z8/A2rlQy8Yc/erWTQzyRC5qrX2rAG88su4A9QUX4+yDJQZfNzxswMw3xTdBLdqKr+oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8076
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Jan 2026 13:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6871

Hi Hugues,

On 1/21/26 3:03 PM, Hugues KAMBA MPIANA wrote:
[...]
> diff --git a/meta-arm/recipes-security/optee/optee-os_4.9.0.bb b/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> new file mode 100644
> index 00000000..8e64a636
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-os_4.9.0.bb
> @@ -0,0 +1,8 @@
> +require recipes-security/optee/optee-os.inc
> +
> +DEPENDS += "dtc-native"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
> +

We don't need that line anymore as there are no in-tree patches for 
optee-os anymore.

> +# 4.9.0
> +SRCREV = "c2b0684fcd89929976a8726e6e3af922b48dd2c7"
> diff --git a/meta-arm/recipes-security/optee/optee-test_4.9.0.bb b/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> new file mode 100644
> index 00000000..ddb574fc
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee/optee-test_4.9.0.bb
> @@ -0,0 +1,14 @@
> +require recipes-security/optee/optee-test.inc
> +
> +# v4.9.0
> +SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
> +

This isn't the actual license but a file pointing to other files. I 
would suggest to add LICENSE-BSD and LICENSE-GPL as well so that we can 
catch modifications to those files.

I've checked all commit hashes, they match the tags.

I've run `xtest` on Rockchip PX30, RK3399 and RK3588 and they all pass, so:

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # xtest on PX30, 
RK3399, RK3588

We should probably think about also passing ;tag=${PV} to the SRC_URI 
via a variable such that we can not pass it when building the _git.bb 
variant of the recipes.

Thanks!
Quentin

