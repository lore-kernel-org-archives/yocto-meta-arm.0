Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EBFD2D8DF
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:52:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7040.1769507576202712846
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 01:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=M+BVtZX/;
 spf=pass (domain: cherry.de, ip: 40.107.159.7, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fh5HKZVE7sc9fJ60nZ6IBOxWe/GMu38uVCCvkCh7+OB0fBoFH1a5H+ZflkIJRXHpN15XopM56yE64Qsy40dj+1QDRlv3YAoHKeEJSxlpjf7FG/VbQdT0cyA/FBd1DjayT8hEFxkaFrMUTIaqRVwG3ns2i+bh6bve+PZ/F714qEeYT0/B11YT4CxaN889Z+d5UgJmkJJZ+ERuC06nzhdixT+16N17CG1K0qB86x/cmcj3cB3h4055nV0gY7uo0T34yjyeH3d+0vKCKopGDYPzY//1R7ptQjdekkA1og622WHx+AsNUfchI8EAc0d5emU4kLcDu26qB4NSubS5s+jShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83DpefMrjzOIbpz6xxxN+HzyvdcAwhEWSqNCBo1v5qQ=;
 b=J2SRLrWZtCgmlUGBubbantKieU7HVbFWbe4TdFEWuEePN6jBudVFT8aknmHtQxvmI25UwSbGeZtLmzTQKOe3FEtOlc3+Q1BCGUIFNKUY1/FVq88J1xcTMiXzgwg0g0Qletf/QNVF3/w5Gec98HRwsXRRGrc7feYoE5bv838W4YQC6s3J2fdqPT2OUMZbnz/eldVrb3FEYLHHOzQAscFrFuRWOKKLZNZ+oeiWk29DBjAB1VDomFvRmEbTSYvhFgqRw30obljO+YiCNHi3pmAtR0mcJ/ruan952Z/9B2f6icZ4Fh7TOXiACRfMJ8ZerTtnAbwtrLpV+NsASyJ0YKzSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83DpefMrjzOIbpz6xxxN+HzyvdcAwhEWSqNCBo1v5qQ=;
 b=M+BVtZX/YO3PTJBymGzBze2+EeTLDghJ+QeSfWqHR0lP1KjsTTmT8H/1RFOVIy/St4ZLjODM8tQvw4eTmAXIWkMDf4gPCmXNNuaZ9vFL8E1Vcvwf50ZwdwHNYToDbXGO1ZihJfH7V5f59YKF7ZOzp28zZBJZuO6YwxzbEWpRub4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV4PR04MB11356.eurprd04.prod.outlook.com (2603:10a6:150:298::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 09:52:50 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 09:52:50 +0000
Message-ID: <84a15067-cde7-4728-8914-3e09d10aea95@cherry.de>
Date: Tue, 27 Jan 2026 10:52:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm/arm-bsp: optee: add version 4.9.0
To: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>,
 meta-arm@lists.yoctoproject.org
References: <20260126171658.40998-1-hugues.kambampiana@arm.com>
 <20260126171658.40998-2-hugues.kambampiana@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260126171658.40998-2-hugues.kambampiana@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV4PR04MB11356:EE_
X-MS-Office365-Filtering-Correlation-Id: 55394776-10d6-4df8-d8d2-08de5d89d4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDhVWmVXM0lEM3Avd0xTUENKRmFDWVFXVmNDVHl3aGJqMWcvT1B6ZGl4KzRO?=
 =?utf-8?B?aDFpRzBjU3VnRXI1eFRaRTRDYTNRMUZvTXFaKzFla0MwMks2Y2FjcGNNeEpR?=
 =?utf-8?B?dnF1NktrSC9RU0krVllpTG0yRzBrRjExa0loQTNHaUVlaEppMmQvS1RuWUlR?=
 =?utf-8?B?MElEMmMyYXJKN2g4SDVZTlVnOUhtOHE2OFM5QU1XVmhYQnp5SG9DNzA1MDVi?=
 =?utf-8?B?d3hMRlZYdmV1YnN0SDArL0ZVOU43dGIrdCtWS0FxaUtMRG00MjVzT0krbDhM?=
 =?utf-8?B?MDRlS25PejQralpiRCtxT3ZnYURGWFcyVXp1K3UxTVpjUGM5UVhaZjN2YWlR?=
 =?utf-8?B?TW5sS1EvM2IwVlp1V004bEdaSE5TWkVNMHRSdFV2VENJQjcrUlBJTXZiVzQ3?=
 =?utf-8?B?KzlRYXBQU1habXJURWZNaEhuYVYyQXkraDAwQlRsMlA1cVI5WEhKTkFvUFVO?=
 =?utf-8?B?Q3RSUmFPTFVDaFdlSmg5U004TkhrMXRBSWlHK1hWN1loQWFVdG9DVkVibmtC?=
 =?utf-8?B?L3k2VnpkUXNlSFB0ODd1T1BYbW83Q3NBSW52Zmg3Y2xJSVh3YjVkdFJISEN5?=
 =?utf-8?B?dEhlWk1LTU9UOXFMaXY4UzN0NGVTaitib3NUQlllM2RkWnlQc1o2dXgzWU5Y?=
 =?utf-8?B?Z3IxV2VtVkxERFRjSld3RXEyVFpQVGxRZGpIQzhiVm54aDhEaTN2NENTSDVp?=
 =?utf-8?B?TWJ1ajZMS1o4ZTBXVDJNUXpQbmZKOGRldlV3N1ptSHBxdFdwczU4K1laUjRj?=
 =?utf-8?B?THlHTEFEa3MrMldadU9UR1BRU3ZXRnc0THltWHRoSTR4RDJYNFR0VStIVWZo?=
 =?utf-8?B?RXRNeStGbUVxckwzUWdnbGNqRm01cFVVbUVVRDlQSjJRcnhmSlNiNnhCZW1o?=
 =?utf-8?B?NGRwbkowa1hVNW1QV3VxZ1BoZUdhem5tYUdRWEFnKzNjUmtuVm8vTU9vWFox?=
 =?utf-8?B?cFhhbWx6ZWN0cHBNZ094clE5eDdLOHhjaS9YTXZucWtJanVkRHl3OUNwaEdt?=
 =?utf-8?B?Y3BFNTcyVStodkZTaEVLaHYwdDBGRXlMK1RCeGRSVEtvc3hzMVlzTWlqck5t?=
 =?utf-8?B?d2RDMElwQ2llN2Q2U0Q4blBPTHRwZkRHRGFxdTJHTzNRVUJJcFJFUmNhVkU4?=
 =?utf-8?B?MXZiWndEVVJUZWhkYjRBb3M3LzdtdEloUCtMcEt2ZHVaQ2F4UnZUeXdPQXZI?=
 =?utf-8?B?Y01FVkhaSDJCNmlZZ1dGQ0NBejNTUG5OYjlSaEdOVDR5OWRNZFZkMEZ5eEhi?=
 =?utf-8?B?TzFyYVRIUDZRdytUT05oNG1Nb2pXVnhHcmg5REF6UjdYQ3NRY3V6bU9GM2F6?=
 =?utf-8?B?VnNJWFZIc1NLQUx1NVNGQVZ4UUlqbkMvNFVCMzZybTViZW5mc05kb0JXM1hy?=
 =?utf-8?B?azVjM0VkRXFQb252dFRPc1BwQkdDU1p5cE01TUtnTStXYittY1E1TThqeDZG?=
 =?utf-8?B?QnF6R3J5RXpmWEp1QnNadDAzSDhMeUQzMHBiNk1HNm14TEtrdWVwbDZucUhV?=
 =?utf-8?B?SlAzcUU4OFh5ejRxU0wxUWc4UHA2WGpsWjk5SG1WZFZNcWtVTEYzYlFFS2o5?=
 =?utf-8?B?VnF3T09ZUlBEb3RXV3ZDV1ZIMTFROWJoazI2Q0JRT3lla3lUSmplbW54OXlw?=
 =?utf-8?B?RmE3bFhKVkpzaVZ5azkvdTYvaDZDM3NZUDVmT3BtaE5WMWpjeWtwN0hIRU1T?=
 =?utf-8?B?NTdsWGdzOC9kTEhORHIwTDdibG9pR3BTb0NsRzk0RU50b0V3WXhPUFlDT3Iw?=
 =?utf-8?B?S2UyaXU3UnVlUFN1VmFpSHRoOFNyQWZ1UlgxdzZ4bDVqVHFseGNXRmhlZy9U?=
 =?utf-8?B?TXZKekF4TDZmMHUrZmtRQWl3YkN1SCsyWllLeWlqcE1vT2k4eDkvei9ROXYx?=
 =?utf-8?B?aG1kbTlLaXpsK0plVENSdGhYbnd3eVNlcXoyT0lUNVZkejBnd2lmai9oMTdt?=
 =?utf-8?B?TnFoN0o2QW5SZnJoWGIwM0NwNTI3Zyt5SVNEUlNSUklLMlJ3Q0ZOejRXckc0?=
 =?utf-8?B?aDBrck8wU01RNW16aSt6TzJXUWtQNVRXVVBkTzVDRFBlYXB6cmU3SXhsUU4v?=
 =?utf-8?B?ZmJQejMxUG1DWUQzeEM1cWR3Z2Zqd3N4R0ZZS3ArMWNGeld0V1diakU2WXRZ?=
 =?utf-8?Q?uF5Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VldnSk90M3JLeVFYaHBtNWsyTk01NDJyeStxU0V6YTdCZnI0MUdEVi9YZ29w?=
 =?utf-8?B?U0c5aDFpMWhlcHorSG9taG1CY3g3NFNSSFE1eXJKOHdLdTFTOE94M0R1M0Jm?=
 =?utf-8?B?T2VvclVrYmtGa3E0SzVJRHZ5L3puSEgxNTB5akdJdW1uMmc2dEs4RVVEdHN5?=
 =?utf-8?B?NHFVSW5lNmFZNFdHYUdzNVBhYlpKS0h2NE9mUFJrWUgzMDFSRGNnZ1p5K0FI?=
 =?utf-8?B?NUpFblF0QTk3d2RjUnplUjNTQzI4Q0gwSWRzQ0ZWUG9vbGwvRWxFYWI4dTRz?=
 =?utf-8?B?WkhiVERZb3ZKWkV4WURzTjVqY2k3WTBLbUhGMFoyYzBzL2tnaGRseGVHbldQ?=
 =?utf-8?B?Mjk3bXQ4ZnAzT1lZZ0NQMElEdUVxVllkNmQyK1h3bkNXc2l2RUx0Zkt1M1lZ?=
 =?utf-8?B?ejNhK0ZhcXluYzJtTEx2cTVZR21nNjk3N2NGSFVEK2lqdDYvaDhBR2NCVWh3?=
 =?utf-8?B?MlVnaFB5ZXlGQTRjRVkxaVJyV1lMcDNaUFFUdGhvWnI5VS9mNEgzV3BWbVFr?=
 =?utf-8?B?UVFGNUo1UTRiZmxYeHpPZTREZ3RRa2RFb3pDYkZzckQrd2l2aWwzVVBHdDNJ?=
 =?utf-8?B?aTVLeklncnNUaHBuRGRxUURSOGk3cW1DQ1UwTDRER3lhMC92N0dsT0ZDWURz?=
 =?utf-8?B?RnNLMEZwZTVZS2Z3YUNuU1c5OFR5U3FnS21UMzVLMzVHa2xsamtXUS9hUkFK?=
 =?utf-8?B?Nlo1U1V5aWd1R1VWSlpBV3FxTzhmR05GSTQ5c0hzNzJ3ZDVPN0dzYWtjOURa?=
 =?utf-8?B?VnkxL2tzWWFmeVFBODVScWFUNndtV1JLcnJReTE5eEdkUFk0NjZpMlh0S0RV?=
 =?utf-8?B?aGZzS2RxVG1BdEpKTjVkVktNWURMMVlIRU1XTEJIV21PSm1naWlHeWJwOXlW?=
 =?utf-8?B?QkJ1dk0yZUNyelJiWE9OVnVseXBQY0N4VTU0ZDBFTWM5Q2JnR3d0dktxR0VM?=
 =?utf-8?B?NjZrcGxNYjFlR2ZiTGhUVHc1eUVZL295QnVNVTJOa2drcG9VUHJqTkNxQVVw?=
 =?utf-8?B?SHA1bzhqWENYT1MxQkgrMk5rTzFRNzJxSzAwWmttN3NJTk8xa3QxQ0dTcmM2?=
 =?utf-8?B?b1k0S0JqbUxhb05kK3RBQURqTmJNbk5VYU42cFJONlR0ZndkUC84RHM2YmpS?=
 =?utf-8?B?YzIyTGFxeXlGRGlXejltbGVKNVp6TXdlWWpwRmRnUVduRm5ZTjY5VmR1cTZI?=
 =?utf-8?B?Mk1TQlBQT0htZzdPb3daTFF0UzRIRlJzeEpSbVNZS2R0VDI3VXBORVZRV0xm?=
 =?utf-8?B?TzJ4aEcwZ1pCbHBzNGdZNWo3S2RPeDBOYzRFUHoyMFR2N0J5Q09mNnNjZ1Vo?=
 =?utf-8?B?Y3MwL1I4YnRGTmNOc0R0bWRGRTdURmYrOU43a0NBempqeE1HQU5heFQwRXdp?=
 =?utf-8?B?eG5PdUxDSzJpOU02WXNTdUk5YWVoVEoydmwzaGZ2TW16QUNMZFo4cmVWcXcy?=
 =?utf-8?B?bjFXMXdHbVZ0ZGc1QkhHTStRTWVDcDhDTTRrNk9WN1ltVHA2U0graWNiVSto?=
 =?utf-8?B?WXdObFRpMndvMmd5Zm9TeGs3eXNuRVFJNmhMeXJpandKOTd4V2NvRUpGdXNV?=
 =?utf-8?B?SUd1T00zdE1PbFIxeVFMZElzVGRYc1Q2VlBFYmxLK2swemZaV2thWTNXUVE2?=
 =?utf-8?B?Vm91RWo0REhvOWp6SWhXK2VGZnRBYUJ1a3F5VTJ1MHM2NlZJMXZxU0ZZNUF0?=
 =?utf-8?B?OHFadm9ISGlJUmxvaGU3bi8ydlZXTzM3Um1saCtkQWs1L2UwUDhYY3JkZ2kv?=
 =?utf-8?B?VE4ra0IxcFNJanhzVFJEbkN4aUovcDJ3Myt0R3dVOGZKcGxpdTFSL1JLUmZD?=
 =?utf-8?B?TUt4UGxabFZYSDd2NkprQ1Q4SGlmc1BDaGZabm9BZGxpSEJ6QzRvalRwcE5h?=
 =?utf-8?B?SHBKaDA1WmJUdmc5b2JYdzk2amtBRncydVBwN0hyUiszWTFSZW5jbTkyVUJC?=
 =?utf-8?B?L1R5eTQ0R3FLeGZ0UXpna2RXR0IyQ3UwNVdjSEVkZ0x5MFRSOXcxV0lJbU5G?=
 =?utf-8?B?cFk1bm9idkUzVkNJNjJLb2tkb25Jd3hsMnQ5WU91NkQvdUlyamV1N2FkbmpR?=
 =?utf-8?B?NU9iVm9UM25rYUxqN3NzdU1IVW03RlBJODBzSW5TbzJFeitMdkVKSjJQamVX?=
 =?utf-8?B?VU1vTnFvbzQvK05sNy9KblNmYld1OTUxWGNDVjBEVE1rRU4ycjRkLzd3SHNU?=
 =?utf-8?B?b3k2NzNodUgwSFB3bmFFSWlNWGpHcUhoVk94dHlEc2dURnBITDRyMElPR2Ni?=
 =?utf-8?B?emlNNjlHWDV4c1Vib1cyTFRWNTkwTElOYkNQaUdPcmlQNXYvRWNoaXA5Zk91?=
 =?utf-8?B?RWcwVkJzUUFIc0EwdHhiUXJNK0tyaUNpYU5zSFdXYVJwTFB4d1grZ0ZvZmt4?=
 =?utf-8?Q?7nmi2O/ehYwrjhOjxurwR4ZI37VjucA0H9f3X?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55394776-10d6-4df8-d8d2-08de5d89d4e5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:52:49.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nquUDcCpD0KZH+gl40KfG0ON1CUvuZSn0Pswt24avqeIcUD7cPi3vHjaAGmF7HmkbwVhg53MdAIHZX7qCzKydf76LGlRaWYs4wWgXRrAODo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11356
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 27 Jan 2026 09:52:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6878

Hi Hugues,

On 1/26/26 6:16 PM, Hugues KAMBA MPIANA wrote:
[...]
> diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
> new file mode 100644
> index 00000000..5dfc88c6
> --- /dev/null
> +++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.9.0.bb
> @@ -0,0 +1,94 @@
> +SUMMARY = "OPTEE fTPM Microsoft TA"
> +DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
> +HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
> +
> +COMPATIBLE_MACHINE ?= "invalid"
> +COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
> +COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
> +COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
> +COMPATIBLE_MACHINE:qemuarm-secureboot = "qemuarm"
> +
> +inherit deploy python3native
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
> +LIC_FILES_CHKSUM += "file://optee-ta/LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
> +
> +DEPENDS = "python3-pyelftools-native optee-os-tadevkit python3-cryptography-native"
> +DEPENDS:append:toolchain-clang = " lld-native"
> +
> +FTPM_UUID = "bc50d971-d4c9-42c4-82cb-343fb7f37896"
> +
> +SRC_URI_ms-tpm   ?= "gitsm://github.com/Microsoft/ms-tpm-20-ref;protocol=https"
> +SRC_URI_optee-ta ?= "gitsm://github.com/OP-TEE/optee_ftpm.git;protocol=https"
> +
> +SRCBRANCH_ms-tpm    = "main"
> +SRCBRANCH_optee-ta  = "master"
> +

Maybe we should use a ;tag= for optee-ta since we have tags and use them?

[...]

> diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> index 397515f9..922911ad 100644
> --- a/meta-arm/recipes-security/optee/optee-test.inc
> +++ b/meta-arm/recipes-security/optee/optee-test.inc
> @@ -11,7 +11,9 @@ require optee.inc
>   DEPENDS = "optee-client optee-os-tadevkit python3-cryptography-native openssl"
>   DEPENDS:append:toolchain-clang = " lld-native"
>   
> -SRC_URI = "git://github.com/OP-TEE/optee_test.git;branch=master;protocol=https \
> +OPTEE_TEST_GIT_TAG = ";tag=${PV}"
> +

We could have this in optee.inc I believe? It applies to all recipes for 
which we have a tag and want to use that tag.

Also not entirely sure it makes sense to pass both branch=master and 
tag=${PV} (but the former is most welcome when the latter isn't 
specified, so maybe something like

in .inc files:
SRC_URI_BRANCH_OR_TAG ?= "tag=${PV}"

in _git.bb files:
SRC_URI_BRANCH_OR_TAG = "branch=master"

SRC_URI = 
"git://github.com/OP-TEE/optee_test.git;protocol=https;${SRC_URI_BRANCH_OR_TAG}"

for example (not tested!). Or maybe even

SRC_URI_BRANCH_OR_TAG ?= "${@'tag=${PV}' if d.getVar('PV') != 'git' else 
branch='master'}"

such that if the recipe filename ends with _git it automatically is 
branch=master, otherwise it is the version number taken as a tag (again, 
not tested).

This can be a separate patch. No blocker for merging this in my opinion.

Cheers,
Quentin

