Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8E8C3ABCC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 17:23:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web11.56307.1747070621352279894
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 May 2025 10:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PczoeesO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PczoeesO;
 spf=pass (domain: arm.com, ip: 40.107.22.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TfcfHdJIWBxa7Lra5ihIUevAyWATV0ml8E8EupxD8UvNAYbGwGNqT92ZTTzh/y2AJGmscvNmDypAue+4qhDdk7Yn6IDmAm7EKRpYZzImf97TrUin7k/fbwMoPY6KieeVj8oaRYIZP2Y6X3JYJY2NA5mT8a9MHs/XYQ3st1hS7CKb8r5L1ScBNqgXRX1X9yANCbQqhZbusMr9/30APQjxil1PsrAFWzECS7H4XqLD3+O1OjdA0LyI92+iuaDWPBMlxknBDIvzbTIVoIKj8FDnY6qzsdG3q2MD+dUjm4u2CJdZ7vXxlw1ULcAxdUSJ9nm+aIiHyscrKdyve3zk5bAM8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdWVzt8EV0PJ9+LY0JZiNu3ZPITtoSWCalgOJZ8MATE=;
 b=t5TYtzYfHD9W6301FWBI5PuinK4oB+7KsLy2OzVxQ4agE+UPiXWLr+ppvmpB+EmMmhn4UPregVt10Fk5Hn9wuyN2GgfuFrpB41L8UbN4CNV0LrsxxzzPRIieRGKhR7mNgchy3M+sP7vptKJg2hXOGX4v+IyMsKuVr+o7oQ/8Ftpqdub+HGlaPnksyLFUUqPgYTPyRC87ZEQnmw1O/ayvvseKVfd0rWYXUic+RHzFokfr+7weQ/3Wioknrr5g3YnNDDhChU+W5pJBaS/J6DaV8EsIEzkrtyX4977ipF/uAcgnLZFFYZMxZbwK5oA09ECEubSFT0OKAFGp1VqTAC+6Ig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdWVzt8EV0PJ9+LY0JZiNu3ZPITtoSWCalgOJZ8MATE=;
 b=PczoeesOkubEJ3ncdsGY8LDAMN8Q2hz0MfHthATkOrFeifYpOtk5VcYilveQil1UuuSmAOgz7lhrBSJzcM2b1b0AGFpzWqqz5/nb6dlrwxZZvruPJPkF1jZfthYwvnKvopwpxZ8iSEbit/5mwd5rjpg2LX+SfgUAjaan5h19EOw=
Received: from DBBPR09CA0021.eurprd09.prod.outlook.com (2603:10a6:10:c0::33)
 by AS8PR08MB7371.eurprd08.prod.outlook.com (2603:10a6:20b:447::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 17:23:36 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::d6) by DBBPR09CA0021.outlook.office365.com
 (2603:10a6:10:c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Mon,
 12 May 2025 17:23:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Mon, 12 May 2025 17:23:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSn+r1i/vhj2/0TllGvF2VUZ//4xSmMBzxjxN6L0zu7GChyCUmv+3mURjh584bHrNVJojEEq5TF3nkrOAkRbiCqhnOOOdF2ZEXodUkLS55gJmQODmNi3dg7Aw307EBg1Yig5g0YxXm8VLW8eZcCzRfXTKIbMavqg7b9kbBrWrEqRCKrpEoewYsJpo9PZOyOXE/b7cu1l+//w6A8RFlq7J1SqslaB5RLlMHJIxewvVkSFL/+dmsct93DV979sRym+4Nc+260ZgVFhSYbySTkE7PL764BAbTc1cr1bUHXJRgT+87yWxaNiAT7RN9asoJ3++96aB0Iu7mR20vp9ES1OsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdWVzt8EV0PJ9+LY0JZiNu3ZPITtoSWCalgOJZ8MATE=;
 b=Y/f4pgrnO+81rljJyUxBAoD+vQvvahti3Uv/SDSH26EVkQbT4N3U7s2uvg8ZYwyo6bYKqln9dFa1jHMBvS89gwZ05b0uEaStom/tHM02ic+NqD55tdsjPey5DDcLFI8LWdoZmXflWXRiA6RvejVeG+udqGrt4Q1I4EEC84NdIa6Z5YILCI64dfCX7NAwhsZomOaV/vopZWZXsaVSlvoysT54vKAV4PMBqz06ptBaNIkwuEtDG00HUFxftq7EswOXxv5cGWhucXq7pte6kApirhgyhBe5Nvoe9x+jKCPVydKgL+KFqJShQrbCnXegLQBAuM0G8PeSmyabBB5ewrz8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdWVzt8EV0PJ9+LY0JZiNu3ZPITtoSWCalgOJZ8MATE=;
 b=PczoeesOkubEJ3ncdsGY8LDAMN8Q2hz0MfHthATkOrFeifYpOtk5VcYilveQil1UuuSmAOgz7lhrBSJzcM2b1b0AGFpzWqqz5/nb6dlrwxZZvruPJPkF1jZfthYwvnKvopwpxZ8iSEbit/5mwd5rjpg2LX+SfgUAjaan5h19EOw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6321.eurprd08.prod.outlook.com (2603:10a6:20b:366::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 17:23:03 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 17:23:03 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ali Ozaslan <Ali.Oezaslan@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
Thread-Topic: [meta-arm] [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
Thread-Index: AQHbvqdJ7KZwcseCEkOEjoU0gsnFobPPR6wA
Date: Mon, 12 May 2025 17:23:02 +0000
Message-ID: <F73BDBCD-10C3-4B0A-A867-FCD7DC7BCF7F@arm.com>
References: <20250506165045.509-1-ali.oezaslan@arm.com>
 <20250506165045.509-2-ali.oezaslan@arm.com>
In-Reply-To: <20250506165045.509-2-ali.oezaslan@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6321:EE_|DB1PEPF00050A01:EE_|AS8PR08MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: c0caafee-5f14-4e66-c9b2-08dd9179ba8c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?K2NLZDJnZnIwVHJTMkduTzRBa1dnUXJnVGd1WFRsSGc0R0hsZjlyR3cvdkM0?=
 =?utf-8?B?S3NFNUE0YUFhQlhzVnkwdmJQK3FOQXdsVXRJSnZXUVE0NGVhTTRqbjYxSGVt?=
 =?utf-8?B?TmswQ0RlRFFlazRJUzRvaWIzdFVaQTVHUWw0RU9FQ0kyblZpbk1HV1Z1Zjll?=
 =?utf-8?B?eHFBUlR1VFF1ejJtRmlSLzI1N1dJY29RWTlKK0V5UE9SOXpWdThZQ2FremFW?=
 =?utf-8?B?dkFvZERVQTNpNHZuVmloZjVwdGZ4TDhZNmFNeWFPZnM5ZU9qTDQrZTQ0OHZO?=
 =?utf-8?B?dzIzNnpNamdmVzVZT2diSWlyN3h3L3Y1SkhTR1VHZ0V0RG1rc2hCVWNjTXBp?=
 =?utf-8?B?eEI5cjZSTFlKUElPVW5jK1JCQXpSNUFCVWQraXJmOVVtSHA5QU1oekZlak1s?=
 =?utf-8?B?Z0VsR2E4d2VQOFVreTBIVngyMFkwSGdlaXl1T3BsV3dQcEordTQyV1o5SnBj?=
 =?utf-8?B?cXFNeWRUYTd5NmpET2xWOXBISnc2dHdENTg5Y0xERFlvT28vN0FpcDlPUktB?=
 =?utf-8?B?NndLMXBYcG5yazJlUXJXTHRVL3VZUXdUcUhvelZzdjgzd1pmRTNPYVloaWM5?=
 =?utf-8?B?Nm0xbmRoM3pldWtqWTh6Yk5zYUZMV1gyRWNYTitORDkwdE9JemgxdkNLVk1C?=
 =?utf-8?B?a1k1d0JqbXNjSHEyeDk0ZncrczlCNGc0Rk9SV3RXaE1XbGZ4T0JwT2lZUDFz?=
 =?utf-8?B?NzU3YklKbVY4WHZ3VWtlVFowTDF6Q1R1K1pLdVBTVzk5Skd2RFJuSmNJMWlT?=
 =?utf-8?B?ZkRzYWhCWkpycG9nc3ZUY25qUkdZYkFyNHlVV3QyajkyZXZrbTlFMlh0Zi9X?=
 =?utf-8?B?U2NqUjMwcnRwL2piR2dQVkNZUEY2VHgycVVIbUE4QVkrTTRSQUtVRk5DOGVv?=
 =?utf-8?B?ZnpybGc5dGZXZXUxeDMrSS9WN1Jsb2pXaVRRZ0c1emJKOW03RXN3bGJENmdC?=
 =?utf-8?B?TTBNMUxLbDJjZ1RKNXA5WnFhdGowZW9SZldPOTNuZ3A1T1QyU0FhS01JVGM4?=
 =?utf-8?B?NFpGOXQwMTkvTnlYdnpjVGhyck9GQS9qR2grRHZsdG5sVGwzZWs1bFdOc1VN?=
 =?utf-8?B?Z0ViVlovb2VJTEl3dld5dW1LV2FTaVhORGp2UnRCaVNtNzdkRURoVGp6YXB1?=
 =?utf-8?B?N1hvR1FpS0pLRllvbkdOSjgwei9YcU5mVHNrZXNpSHB0ZHZuVHNMblNOV3BF?=
 =?utf-8?B?N0pMZHd4djRabFcxMytlZUV0Vjk1ajEvYmFib3hHRnJaL2gzV0NsckJ0b3hX?=
 =?utf-8?B?L09Gd1A1QTFWbnh1NHlGeWZxYTFCSnpDYlNrZVFPOFBXQ2REK2ExS1I5V2pt?=
 =?utf-8?B?L2piOU9XelgxOURFVEh5Q2N3TFZ1Z0pLdmVEUHBlOVB4OVRqMEExRTFISTNm?=
 =?utf-8?B?ektLS0hpUzB1N0dGNCtxNGxDWC9Fc056MDF4NENYRGhpM3RLSEo2Ym5TT2dY?=
 =?utf-8?B?Vm1FNDIzSFNvM0pNZ1FrcFNienhkT3F2ajdycmVlTGVWUVVlemdWMTRWd1l6?=
 =?utf-8?B?eFcwTll6dUNOWFRGMzVoclRuTHJNVWpQSTV4bEhLaWl4Tm9MaEV4cTd6TTRp?=
 =?utf-8?B?ZlN2TjlBTURiWU1WNytwUWRnTGRYRGN4ZGxOYlBkc3ZFOVhJMnpEc1dEV0Er?=
 =?utf-8?B?eEpKZEQ2Rk1zTTBwaTU2MmtrRS9WMDZQREF0WXZaazU3c1ErNGJtTURzbDZW?=
 =?utf-8?B?YlZROGdsK0Rkd1U5YWo0OVdtYnRnU3E5c1hXS3BzRlBWeElYWUtFNzBmSkRj?=
 =?utf-8?B?WVI3MnBtTEZzdFFmUDhxem93eVlqUVVMODNqTWR0Zk1WM01iSEtwZXptcDdo?=
 =?utf-8?B?ZEszSXN5MzhIczN1dzdJSzlZM3R2SzlMVGRCSVlQek1hcDFTZEtZSi9vdStx?=
 =?utf-8?B?dzR5N01jVFdzQ21BNG1MUlZCaE9QY1BJeFp6UEpCQUlGT1VEeGlkYmFCWnlj?=
 =?utf-8?B?b2J2R3Nmb1gyTnN6d08yQzd6L2xES0R3SExtYVB2ak8xMnhOMllNdlhzY0pt?=
 =?utf-8?Q?JYRKDnLuFXVLJDYI99Bmp+sPlYTR/0=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0ABD361EA4869B4CA64CB5959405F638@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6321
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b3b495e3-615b-4ffb-14c0-08dd9179a688
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|376014|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R2NZOUxtRk1hUDhiOW94c2JLdm9JYXZ2N2kxRitWdE54S3FoRHVpNHBCcVNi?=
 =?utf-8?B?QmZOelRSdGZVcUtPZWFHZlhJL2RucFVjQmJBZXVGblFNQXQ2M3JURXA3Uy9N?=
 =?utf-8?B?bGl4YnpZNE1YV0RtTUtjWjFqejBrQU1hWW4zVzZYT1dyMWJaSVFpak5xVkl2?=
 =?utf-8?B?ME5QWTNDQkF4aDhJV0lFNjRWWVNKZi9YdGFray9CK0VMMEQrTFJjZnlWWHUw?=
 =?utf-8?B?U2RRZ3ByRUQ3ZW1XRkhLTUMyQWViNkYxbGJMeHdrNWdIZ25vVE1NTXFYWFM2?=
 =?utf-8?B?VHdqRzQxOGFBMkVReTdNVDFWbzIzaGVOcitPUEtJbjNFdHdvSUVsKzUzeC9V?=
 =?utf-8?B?dXpMN3RJU0tWU0RxeWt1VDlWU0dLOUFDdFBLRzFoYkZNOS9FWVZFY1VRMlo1?=
 =?utf-8?B?U2JETE9pakpRYTJ3eFkwYkVyTkQrSVBwN3dxNTlEY3FJV1FvTFFGdVo4RVBO?=
 =?utf-8?B?Z0lEVDd0dFlpeE1EcWZLS3NhUk03bnNzZkw1OEVwZEhWVGNRRU54RGpGR2ln?=
 =?utf-8?B?TzhzYS9OdUNHcEwySy8zOWtlWlJUeFQzZlE2Qll0anJKRS9vdVpZL0dPZWJo?=
 =?utf-8?B?ZDFsZlRmWFQva2JEN1N2dURtUmtGbUNLOUc2Tmt3RU54VVRtQzNtTWNxVHBt?=
 =?utf-8?B?QmFyU1NRcFpzVWNvblBLYXNqdlpMcmlqaklXZjJRMzRjUTczR2E2QmYwTnZT?=
 =?utf-8?B?SXdISjkxMUZ5aW5LamdXekdQKzBpRTJtWm1aS29OUngrNU1pVlp0YTQyb0Y1?=
 =?utf-8?B?bHltcUxOeGNteUZzcnlTR0h2NVI4WEV5SVhWcGZ6QzFUSFdrT2wzTXhjQlBP?=
 =?utf-8?B?V2hNbStVZFRQNXVYNmdQS2dJWGdwRTlzTnRSNG11cWtpUnJpRDBobUE1SVhw?=
 =?utf-8?B?ZVFMUFBkOEIwcmpoNXEyNWFPRktWV0hPWk8wWkkrSk5YRUxHZHRaYlVRVSt4?=
 =?utf-8?B?cm14Y0lCME1BUWtnK21xemtaVzlIWENKQTlWYkdlNGVpc24rQzhUQi9Mb1Bw?=
 =?utf-8?B?TDdGem4xam1Vak5ZQXp3WmJUb0Y1U1laSHFrd3BlR083ZVc2YnNvaEpZU1U5?=
 =?utf-8?B?MXJhZjBkdFVDVXlWOFIvQmlvRkZBNlRSMWdrRUVSQ09xT0VUVHBTSEFvaW4w?=
 =?utf-8?B?TjR5ZklEcEU1OVNHdE9LYmtaQUQvT0Q0TjJVVDZKdzBQRlhlb1QzbzZHaDFi?=
 =?utf-8?B?elAzNENvckRXRHFTeE9tUi9yYmRxRXZqTmZLa0hac2thQkpMbk1kWmVzUy8x?=
 =?utf-8?B?VDlxRm5ZRzh3V1AvdHhiVFBzNXh1WHpXdkZYK2Qra1dGZmFDS25tQUJPckl3?=
 =?utf-8?B?Qm40NUpkZ0FRVGV6blREcm5taXlrcCsvbXhQTzFXL3Njb3NhaFRSbmxQQVJP?=
 =?utf-8?B?OUtaWjhyRWdhVzRSbndDWCtaS3dkdjlZT0VENlJqdUpicVc2aU5vTTU4dkNn?=
 =?utf-8?B?L0ZNd1RYRitHQzFtYnVvcE8vRCtWcWovSXNzdVlGWGVpT2d1RFNZZW1QYWJa?=
 =?utf-8?B?V1FRVkF4RS9ZNkdFTE1HNEp5REtpQ3ZsQ3RhaGNIU2xLdGRydm4wY0k1QmEz?=
 =?utf-8?B?cEdFNnBBdGZPSkNIcnBLQ3JIaVBMeHdUSzNLS3BFSlRQY0JDR0lrMkI4bEd4?=
 =?utf-8?B?NVhoZk1weVhoYjFPL1lqdjNqSTd5a0Nmc1FORTBPSHlUekxHVytnbVJNOEpY?=
 =?utf-8?B?aXhCZEtCQ3dTNVFyL0ZFV2RLUnY2OU95L0FwckZUNTlxQXhCdW5ZS0xveFJM?=
 =?utf-8?B?WEVKbnJUVWZ2VFNGZ0U0SDhzako3UWw2Wi8wYU9Yd1FYcGFHWU1qdHYvRVN1?=
 =?utf-8?B?UUwrcHljM3l3bjVpMWlJaDRjU3RDemlVSVFtR1lsRDN5dWJZZTV0UFdHWEl3?=
 =?utf-8?B?S3lJOTU2c1ZIUkFZMkpaYUhkZnVSc2o1UUExM1lrRVVQNy9jNlBydDBzK2lO?=
 =?utf-8?B?MU5EQmpyTFUvRURRZHdWZHROTVUrS2d1c1JFS1RsbmFXZXRVaWZHODQyQlZs?=
 =?utf-8?B?c1paNzFkSXZ2YlRZZGwwY1A5bS9xQmVLVm8wZSthQUJDV0JVTmw3RzB2TTB2?=
 =?utf-8?Q?rb4MG1?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:23:36.2981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0caafee-5f14-4e66-c9b2-08dd9179ba8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7371
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 May 2025 17:23:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6497

T24gNiBNYXkgMjAyNSwgYXQgMTc6NTAsIGFsaS5vZXphc2xhbiB2aWEgbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyA8YWxpLm9lemFzbGFuPWFybS5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3Jv
dGU6DQo+IA0KPiBGcm9tOiBBbGkgQ2FuIE96YXNsYW4gPGFsaS5vZXphc2xhbkBhcm0uY29tPg0K
PiANCj4gVGhlIHBzYV9jbGllbnRfa2V5X2F0dHJpYnV0ZXNfcyBzdHJ1Y3QgaGFkIHRvIGJlIGFs
aWduZWQgd2l0aCB0aGUNCj4gcHNhX2tleV9hdHRyaWJ1dGVzX3Mgc3RydWN0IGluIFRGLU0uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbGkgQ2FuIE96YXNsYW4gPGFsaS5vZXphc2xhbkBhcm0uY29t
Pg0KPiAtLS0NCj4gY29tcG9uZW50cy9zZXJ2aWNlL2NyeXB0by9pbmNsdWRlL3BzYS9jcnlwdG9f
Y2xpZW50X3N0cnVjdC5oIHwgMSAtDQoNCknigJltIGd1ZXNzaW5nIHRoYXQgeW914oCZcmUgZG9p
bmcgZ2l0LWZvcm1hdC1wYXRjaCBhbmQgdGhlbiBnaXQtc2VuZC1lbWFpbCBtYW51YWxseSwgYmVj
YXVzZSB0aGUgY292ZXIgbGV0dGVyIGlzIGNvcnJlY3QgYnV0IHRoaXMgaXMgYSBwYXRjaCBmb3Ig
VEYtTSwgbm90IG1ldGEtYXJtLg0KDQpDYW4geW91IHJlLXNlbmQ/DQoNClJvc3M=

