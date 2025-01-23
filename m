Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E67C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 20:18:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.74])
 by mx.groups.io with SMTP id smtpd.web10.21177.1737663519630515011
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 12:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qN/GUupf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qN/GUupf;
 spf=pass (domain: arm.com, ip: 40.107.21.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EjQNu+RpP3upNbqWKJpR7GY8fz6uD9J9+ZLHheFGRFraaVtuvBKjTUNN4MRy8p56Yr54hxZDI445ubyQIvABPI7ws49Vf/6id2wDWUlwPparj/gD2/Aka6Bzv8n60LaaNJvz9FcjM/ffn1pViFdI4Xmi0e24tsWLxKT8DPIBCScMlRwgRbYCBVFAaujF0IbItydGQN1pwL7O6RNEjLbrZO2skYnzq/Zi2YPKGFyiPOR+V6rvt8c5qdw27hpXQrspalJFmMxF1S78ai1Uwrn3jE51rqH96FrWT/j2+weUtaVqGSe+gryks8S8/RudM9RN8mXertOO+uH6byAQtJrXUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsmaSlVraH1BgkVsbrwIIdrCIWY+0vXpoRYl7qpc4pA=;
 b=P3iNAHcqAsMkdQ7QPzwzPMbF50Gme0E7IzKMIy1B8tZBwmGxLc4sDlIgLXGjK1s24+Ro850piAGNtY8HszznPpqOJUEg2n9wZCdJ4qVeqr4It3ywTDSRHEEn0bJBaM8cWU/TN1kPgUVVQ8HI4I1q/t5Hlrjc787p2cypUPnzBGfdvev1dM8+cVXUY29Wjd/uuCBB6NbKvV7jnCH0FK9+D33i9KX2ZjqBCyNCKzWYRW/G+IUs06dvRG8urfWfNgkEFYc9OmnkiH0teM+VeVBvogyLQRaUf9AMYamXE2myoggbc71tiK/D3KRXqh1ydeAuB5vafq7V7ik5xs4xC0NXdQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsmaSlVraH1BgkVsbrwIIdrCIWY+0vXpoRYl7qpc4pA=;
 b=qN/GUupf7SW4MtWodfd++lLbp80UFqCjvRKcAsHpXc27D3CbCZwJtXtu3zqk/mYpIRHwwsyorFAQBIFxN3YPFH3j8XRxC2d/l0gWk7XOkj4RUZ6U+4SdtjfEIoF/65wXC3rI11g7cL5Up/OfvczfWWAl5yVNI4WqBRvWYXkwqAc=
Received: from DB6PR0301CA0087.eurprd03.prod.outlook.com (2603:10a6:6:30::34)
 by DU0PR08MB9631.eurprd08.prod.outlook.com (2603:10a6:10:448::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 20:18:33 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::fe) by DB6PR0301CA0087.outlook.office365.com
 (2603:10a6:6:30::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Thu,
 23 Jan 2025 20:18:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Thu, 23 Jan 2025 20:18:33 +0000
Received: ("Tessian outbound e98dd339b993:v554"); Thu, 23 Jan 2025 20:18:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d84747b3adb28cb6
X-TessianGatewayMetadata: /hkvm8Of/jAOX6OOK4e/Xv3ZVDIRpsYrpNNPTXMBYL00mcBdDPGx0PtlNyd8dB7dsoqjrQOb8R3matbtgzfORFOsfwlxuS9buvNRRHk1RS1j39BrXt2gZ6Ia3eQgwN79yTpv2QBxT6HiJoysKwS+oznymiKWlpgtzJfluoba5qA=
X-CR-MTA-TID: 64aa7808
Received: from Lb48c511ef36d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CF21FC5E-FF36-482F-B0B9-517C1F3F7C5F.1;
	Thu, 23 Jan 2025 20:18:26 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb48c511ef36d.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 23 Jan 2025 20:18:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXsx2XMYml5raIsdpHC1AyKnrMwR87grM2/vsXinQJIGRor3lxBFoe2CwiRBn3NnHP4a8mh5OGi6TQ5GdtJwATCS69k4p7Lw5gE8CUlkkR295+jnUrIstn9abseOnmi9Cp2JPnIDpy0XsbtmCWlMCDOHGNCGhvEc6RslO+Qh7TGTpBkH+JVhdLxtV2aIGqNWh+1mFYOJQcoG8vfoUxhwEpx0vfqw87FpO9ySzoXckNJIigP0L5F9edm6Mei9YtIGK1n9DndGw83a+DiaJDWWN6Ro57Kpx1P/QbbCUAfydSjMVbnzHXSCWVbjKc2oH7b1/1XnOfMBF38OR+tWm0CGwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsmaSlVraH1BgkVsbrwIIdrCIWY+0vXpoRYl7qpc4pA=;
 b=Qg3stOJWsT0MW8cD1UA3oWkU0O2DAaEfnKZUOG8DCk+2OIh8kUSW6DLvteLOb/F7S1Sza8c+1UiuZg5KiUhcNw0xe5l1yMqIMoywiez+yrtzdQndAtYo+sNl9FIV5VV/H7V4jbKLIsZWKaFRwMU8OXWJkU+Qv0EIvFBmRXFgad+Y1iyz2EkVijZdFQMZRhQnKmpkvDenckBhkLwSSDJ5itKKNmmfIzm117bSLpVTToRwxlctPHI6KhRZ7oeQZ5e44SVx2KrPlh8D/3i7JsY5MWRJvSaSDbaJpYae+UvL+1OXfe69HEKGgJXQXja+at6MScOCVkxHJCRuMW8NlYahuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsmaSlVraH1BgkVsbrwIIdrCIWY+0vXpoRYl7qpc4pA=;
 b=qN/GUupf7SW4MtWodfd++lLbp80UFqCjvRKcAsHpXc27D3CbCZwJtXtu3zqk/mYpIRHwwsyorFAQBIFxN3YPFH3j8XRxC2d/l0gWk7XOkj4RUZ6U+4SdtjfEIoF/65wXC3rI11g7cL5Up/OfvczfWWAl5yVNI4WqBRvWYXkwqAc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9890.eurprd08.prod.outlook.com (2603:10a6:102:332::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 20:18:24 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 20:18:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>, Sumit Garg <sumit.garg@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] Removal of external-arm-toolchain?
Thread-Topic: [meta-arm] Removal of external-arm-toolchain?
Thread-Index: AQHbbPOqF0Iu+XHtTE2vYvXch245rLMkyPsAgAAE+IA=
Date: Thu, 23 Jan 2025 20:18:23 +0000
Message-ID: <AEF7EB1B-00CA-4038-B625-CC3EF0A6B681@arm.com>
References: <31F864D4-FAF7-4B00-BFAE-B00CB237EBE0@arm.com>
 <20250123200026.GW21836@denix.org>
In-Reply-To: <20250123200026.GW21836@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9890:EE_|DU2PEPF00028D0C:EE_|DU0PR08MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7d4f63-f839-4246-37e6-08dd3beb1c47
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?R3NIdVlTYzNsTGdZM01MSU5MblB1TmFpVFVMaHFFenhlQytCSXFiYVNpRVFR?=
 =?utf-8?B?SUhDVHJZRkt5ckdIY0Z2eXdFUGw4Vmk5RjJvS24yOU9JekFzZ1BTS1d3Kytl?=
 =?utf-8?B?ZDJ1Y2d1NUh0M2tYTnRTd1lmdSsyZHVTUlNjRGxMcEdZVm02S1NpTGVraXk1?=
 =?utf-8?B?RkdVZ1k0bU9QbHVIcnZ5QUJ5Ykwwa3ZBeWFQNFc5TDRjd24xT3R5NnFDMGNk?=
 =?utf-8?B?bVFZVk8zUjhSWG84eXNYcXZvU1B4R1V6cURtZTVKQjdjWDNpOVcrbVZMcWZW?=
 =?utf-8?B?WjdTVGJuU2NyYktaOVhPVE9pdWUxaVY4SnVyVE8zMjhsVWh4M0t3MzFnY1A0?=
 =?utf-8?B?ODNUWW5TcEFWQ3NBcHZuVjBBbEg4UktMdDRwRFpWS0w3aHRKWVNmNGhXNkRj?=
 =?utf-8?B?dGNzVEkyWTEyTFRLQnZ4N1lLMm9iVzFZcVBhclc4TldVWlh1ZkpleUlwOGE0?=
 =?utf-8?B?MHk3MFNDMWFEbEFGdVkzRWwyODYxSnpGUmpKbFd6aXkrU0RZZ2Y1T2hhYkxx?=
 =?utf-8?B?OFB5RUxOekw3ZFFrMCtTcmxLVFMvNWt0cHVTS0NOckEzM2ZKdEJCVmVtMkVS?=
 =?utf-8?B?U2tEeDd1MXRsRVBPVkxSTVdYNE1mZEt5RU5DY09VSk1LbWlhL3h3TkN4c3Ar?=
 =?utf-8?B?TmNGZHhveUJsK2VZYnBZYmFTemZJcEplRTlWN0xQWFQyNis2anlEUFBEclh6?=
 =?utf-8?B?RUVIZTRMLzNVNWVVZldOa2Y3NXUwMjZGVmV3NU5scGY1NHhsUFdpUjNXT1No?=
 =?utf-8?B?UUFSaUVteGczM3ZzRWlLQUFKazdndmtRVXQvQkpBdWNlKzY1aTZDd0tHSzVP?=
 =?utf-8?B?alpHSDV0NlloL1pzSUVEb0ZMZTNwbzl0NFE4cDBCdFp0Tlh4cHhhM2hSQlZN?=
 =?utf-8?B?dU9ZWmV4dkJtK05xZ2ZzbkJ4MHdzOStMWmwzZEpuRXRhczd0QXZpc3JVMUNC?=
 =?utf-8?B?SkE4eFlIbzBZQ3g2L1VCclZUNEtlblVhSk1aYk9tTjZIblhSR1F6RW5uWDZa?=
 =?utf-8?B?aU9oUC9YVmV4Qm51OGpxM0tBWkp1RmQreVp3OEhhZzlOYm9NV0JnMkp5TVNP?=
 =?utf-8?B?RTc2Z0owWHk1SzlQVGZqR0VRT2VKSmdFRUN5aUpic3lkWkhGRzZtSTFkUnQ0?=
 =?utf-8?B?bTBBOFE0Ull3RDBiMGlndmVLRThPR3RZd2lCQmN4VmNjMnJZV3laM1Q0YTdE?=
 =?utf-8?B?L3ZkVTZrbi9lOWRsbWR5NGlDa1k1ZVVGaVZZK1lRYzRsKzF5OUNVK3E3Z2dS?=
 =?utf-8?B?VVM3NGduK3J4Ni9SbzAvVWVYN3pNeGRaVHJLdW9tYlVYY2N4YmRIeVRMRWMv?=
 =?utf-8?B?aWUrRGoxd0c3cGNBZU1hSDM5TERDOGxxaGdUa1B0RDVJZTRMb3lXd2w2NjY2?=
 =?utf-8?B?VGttWGZmSWRsb3JzQlkrYUNPWGU1Tkdmd1A0TmlSMkJEcDZucUFUOUNnZHBS?=
 =?utf-8?B?Snc2dmk3b01CRGQvc2dCbjNzTGJzSW1DTkVqWUpOdUhtWXJQREFNNWJ0YXcr?=
 =?utf-8?B?Q0QwYm5jaDhXUCtOTlZCS1R0YUtERzZjWGNUck5BVUFNUG5XalFDVU9iOVNK?=
 =?utf-8?B?RmFkYzhGSFVvQnl6ZjVWZ0ZoUlJUYzZBQnh1Z013SmZhYUpqM3hKVk5HZ3FF?=
 =?utf-8?B?cm9sVkdkNTRQbGhRMkVWYURzZEVrNEVPeGVqY0ZwL2xhd3FOSUhtTUFydlhx?=
 =?utf-8?B?ZGFRaDBHZDAvd3FOanpoZ1o3elhwTHRVcmJPMFk1SC9PUWg4M2xtK29JejBZ?=
 =?utf-8?B?ek94eFdPWCtPajdINWZnLyt6WTF3Wk9KSXljOTlzMG1WK24yQ2pkVzNPTTBw?=
 =?utf-8?B?RHRPeS9VRHB3Smwwc0NWR3BNYjY1MjVZNkg4RXEyN3JSaHVHTWpvUEttVlRG?=
 =?utf-8?B?WFN3eFZBY1BqSFR4MnQyRU9ESllzUEluVHJEQ1BxZDJiZFp4RUd5S2dMYzhM?=
 =?utf-8?Q?WOSKer55WZSlUTwDM+flUXnV224z+WAf?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B94E3E059ADD64294179FBABFB1E0AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9890
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	449619bc-f857-487e-9ec7-08dd3beb16b0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NGtRQXIvMU56N0pqWnd4RXZUUXNCUUl0QWdmWkdmVTk5OHBiRU95SFdDTXRn?=
 =?utf-8?B?NjIwYktSQTJ5a0hHVnpCYmVSQjFrNHRWNTViRTh4aHhvQms3K21mZVBCMmEz?=
 =?utf-8?B?MW5ydXhHYmpIcVlSL25xZkI3bStjZmtIbTh5USs1NktYTGZjSHh6ZlZSQkN6?=
 =?utf-8?B?cHo0MEJOVjRSbGNQYkVYbS9ncnBLZHdMU1FZVGFOdTVuSFc1bnZKWG5qUEsv?=
 =?utf-8?B?ek9BVEZzN1ZJMHRITU5PM2R3elEra3VxNU0zdEcxcnc0VmV3SmhLb1hiRFBj?=
 =?utf-8?B?VzZ5aWVXSVlVVlFldkpqZlVib3dtQkF6M1FiaEpReUFGQjRSQXBjaHZ5UkJ3?=
 =?utf-8?B?Q0xVbzRhaXY0VEl4SVJwR3puaDI4NjZ0ZFdMSXh1YTA4OVU5L1FMbFMzNXVF?=
 =?utf-8?B?elNZVU5iNkxZL2k4NkdSZFYvUVdHVFNpZ2d6bnU5TnFRd2puK2Uxayt6OXlV?=
 =?utf-8?B?eEVsME9FVWh1dTdXdG9OQ1lpdEc4dllhYUhwTkl6VWJ5YlNPcktaWS9nVU5N?=
 =?utf-8?B?TVBkQU0yb0VmMDRwYlJEWHVPL3orSXorZTBwcUt3VGRYT2QwNUhBQXZ4WWJi?=
 =?utf-8?B?anJ5eVVvM2Vwa0tNcTd0NytWbTQ0N1RSNWcvMDhHamJ3VUdQOEsvYnU4ZXpl?=
 =?utf-8?B?dnE4ZDNkK1RNSHpDd2kxaEhydnVwYktqL0lqTmxENDEwN3ZTT04yYVcwdFUw?=
 =?utf-8?B?RlBmcXRhRkRpWFpWa01yaWM2MEdXSm5zaVNtWi8reWhqS1YrOWVZb1BGbFdQ?=
 =?utf-8?B?U2JZSllwQ0JlRnBUMW9MTUNZWkpMWkJ2QXlVd3lGOUdLSEx1UTlnaGphU1Fu?=
 =?utf-8?B?WCttQVNvUGRNdU5EdUcvSndIOGY5SDJvNnhHVytoT3J4ejdVc0FwcVI5RXZY?=
 =?utf-8?B?K1E4dUNPYUdRQXVEVzd5bkhBV01ueHF0Y0xCRFhIVW9xS3BKS1B1eTF5YW5a?=
 =?utf-8?B?L0k1SUJ2YWJpNnk0czMxaWNGeTYzdzlmZllnNnVFWVEzN1pFY1NxTlpOUE15?=
 =?utf-8?B?VGN1a3VtWGM0M3FyOUE4NUdoN1JxeVVPRG9VZ3hYOUJ4bEFVZVdCSFMyM1R6?=
 =?utf-8?B?MVYxa3UxUFRXb1RhTmZOUVViTC8rOHNOV241R1FaR0JjV0I0QlZ5R3NUU2Fp?=
 =?utf-8?B?ZUhSRTBzcDdlcE9sT2Y3S2lVSUZMbVNXVkNCbE5FeDYzeDF3TjJPTXN1a2dj?=
 =?utf-8?B?MWhySWw5MjVaUksxMWp5aEZETGo0azByRFNCMDV3Q1Z4TmN0SnBSRXRLcEpO?=
 =?utf-8?B?U1pvWktTcWR4V1MwZThJdE0yTExybHJDMUpCaGpBZGhHVVpveGYrQmV5V3d0?=
 =?utf-8?B?Q0tRVXlxMlNSWUxGSFBPc1hyT1lIbFlCaUFTMEp0cHltN3ZtRnJNVkh0SUc0?=
 =?utf-8?B?eGZoZHU0ZktCeWh0MXc5cyt3L2NJQS9yd1pyaHNmNXRaNVBmSXNRZGdoc2sz?=
 =?utf-8?B?SDY1ZmNDdFRZYktIODBtWkNEaXVVL0xiMnV4cjkyMEZLODFEOU0zSSthU01I?=
 =?utf-8?B?c28yamgzVmFheWxJakpJeUwzOWZ1QVhucjZLbnFOSzVNNVl2bnlsZ1E3bHpx?=
 =?utf-8?B?TFBmWlF5WVc5bEtJZFE5THZCWUlrNUtDeG4zdlJoMGRpMi9heXZxTGZxdTBi?=
 =?utf-8?B?Rkp2aDBLWEdrZ3BYN2NoY2ZLdjk1UGkxdStuQS9ZWTdmMXRUSHlTRHR1QThL?=
 =?utf-8?B?Nk1KZUJQT3ppZElzcUdRd0NZNlBLcTViNDE5YmtjMDZMQkJZYVFIYlNDak05?=
 =?utf-8?B?cjlsTkhFMVB2R0QzWGNGelp1OGtQVUh6QmlnL1hKUm9nQ1VBOWJnNmhkb0Vh?=
 =?utf-8?B?NnZxQklETExINHBpdlJ2b3FJRStEL0pFeWdJaGFOTlAxbjJZS1dlbDhXYnE5?=
 =?utf-8?B?bXBPOTlKNERKU01iOTNWRThPN29UaGtOU1JPcjE4SDAvNDc2MXE4d1JBVlk2?=
 =?utf-8?B?aFAzZEZpSFBhVjhNa3hQd0lGTkN0MHlQQk1XRVViWE42MHNYN0JQMXZkazRj?=
 =?utf-8?Q?RM+Asuw4GrWOEWW2CCy0zdZdNhYbwk=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 20:18:33.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7d4f63-f839-4246-37e6-08dd3beb1c47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9631
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Jan 2025 20:18:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6345

T24gMjMgSmFuIDIwMjUsIGF0IDIwOjAwLCBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVuaXgu
b3JnPiB3cm90ZToNCj4gVGhhdCBzYWlkLCBpdCBhcHBlYXJzIHRoZXJlIGFyZSBzb21lIG90aGVy
IHVzZXJzIG9mIGV4dGVybmFsIHRvb2xjaGFpbiAtIHRoZXJlIA0KPiB3YXMgYSBwZXJzb24gZnJv
bSBTbWlsZSByZWNlbnRseSBmaXhpbmcgc29tZSBpc3N1ZXMgd2l0aCB1c3JtZXJnZSBzdXBwb3J0
LiBBbmQgDQo+IEkganVzdCByZWNlaXZlZCBhIHBlcnNvbmFsIGVtYWlsIGZyb20gb25lIG9mIG91
ciBjdXN0b21lcnMgaW5xdWlyaW5nIGFib3V0IGl0IA0KPiBhcyB3ZWxsLiBJbiBvdGhlciB3b3Jk
cyAtIHRoZXJlIGFyZSBvdGhlciBpbnRlcmVzdGVkIHBhcnRpZXMgb3V0IHRoZXJlLi4uDQoNCkF0
IHRoZSB0aW1lIEkgYXNrZWQgU21pbGUgd2hhdCB0aGVpciB1c2VjYXNlIHdhcyBidXQgSeKAmXZl
IGZvcmdvdHRlbiBhbHJlYWR5LiAgSeKAmWxsIHJlYWNoIG91dCBhZ2Fpbi4NCg0KPj4gQWxzbyB0
aGlzIGlzIGEgcHJpbWUgdXNlIGNhc2UgZm9yIHNzdGF0ZSwgaW4gcGFydGljdWxhciB0aGUgDQo+
PiBwdWJsaWMgeW9jdG8gc3RhdGUgc2VydmVyIHdoaWNoIGNhbiBiZSB1c2VkIHRvIGZldGNoIGFs
bCB0aGUgbmF0aXZlIHRvb2xzLCANCj4+IG5vdCBqdXN0IHRoZSBjb21waWxlci4NCj4gDQo+IFRo
aXMgaXMgcHJvYmFibHkgYSB0b3BpYyBmb3IgYW5vdGhlciB0aHJlYWQsIGJ1dCB0aGVyZSBhcmUg
c29tZSBpc3N1ZXMgd2l0aCANCj4gdXNpbmcgc3N0YXRlIGxpa2UgdGhhdCAtIHB1YmxpYyB5b2N0
byBzc3RhdGUgc2VydmVyIGlzIHZlcnkgc2xvdyBhbmQganVzdCANCj4gY2hlY2tpbmcgd2hhdCBp
cyBhdmFpbGFibGUgdGFrZXMgYSB2ZXJ5IGxvbmcgdGltZSwgcGx1cyBjcm9zcyB0b29sY2hhaW4g
aXMgbm90IA0KPiBhIG5hdGl2ZSBwYWNrYWdlIGFuZCBmcm9tIG15IGV4cGVyaWVuY2UgcmUtdXNl
IGlzIHF1aXRlIGxvdyBpbiBvdGhlciBkaXN0cm9zLg0KDQpUcnkgYWdhaW4gaWYgeW91IGhhdmVu
4oCZdCByZWNlbnRseTogaXQgaGFzIHNwZWQgdXAgYSBsb3QgYW5kIEkgaGF2ZSBhIHdlZWtseSBj
cm9uIGpvYiB0byB2ZXJpZnkgdGhhdCBJIGNhbiBidWlsZCBwYWNrYWdlcyB1c2luZyBwdWJsaWMg
c3N0YXRlIGZvciB0aGUgdG9vbGNoYWluLg0KDQo+PiBTbywgd291bGQgYW55b25lIHNlcmlvdXNs
eSBvYmplY3QgaWYgSSBzZW50IGEgcGF0Y2ggdG8gcmVtb3ZlIHRoZSANCj4+IGV4dGVybmFsLWFy
bS10b29sY2hhaW4gcmVjaXBlPyBUaGlzIHdvdWxkIG9ubHkgYmUgZm9yIG1hc3Rlciwgd2Ugd291
bGRu4oCZdCANCj4+IHJldHJvYWN0aXZlbHkgcmVtb3ZlIGl0IGZyb20gdGhlIHN0YWJsZSBicmFu
Y2hlcy4NCj4gDQo+IEFzIG9uZSBvZiB0aGUgbWV0YS1hcm0tdG9vbGNoYWluIGNvLW1haW50YWlu
ZXJzWzFdLCBJIHdvdWxkIG5vdCBvYmplY3QgdG8gDQo+IHJlbW92aW5nIGV4dGVybmFsLWFybS10
b29sY2hhaW4gc3VwcG9ydCAodGhlIExpbnV4IHNpZGUpIGZyb20gdGhlIGxheWVyLg0KDQpUaGFu
ayB5b3UgZm9yIGJlaW5nIGV4cGxpY2l0LiAgQ29weWluZyBpbiBTdW1pdCB0byBnZXQgaGlzIGZl
ZWRiYWNrLg0KDQo+IEJ1dCwgYmVzaWRlcyBleHRlcm5hbC1hcm0tdG9vbGNoYWluLCB0aGVyZSBh
cmUgYWxzbyByZWNpcGVzIGluIHRoZSBsYXllciBmb3IgDQo+IGJhcmVtZXRhbCBjb21waWxlcnMs
IHdoaWNoIGFyZSBub3QgcHJvcGVyIGNyb3NzLSByZWNpcGVzLCBidXQgdGhleSBwcmV0ZW5kIA0K
PiB0byBiZSBuYXRpdmUtIG9uZXMuIFRoYXQncyB2ZXJ5IGhhY2t5IGFuZCB0aGVyZSBhcmUgc29t
ZSBkcmF3YmFja3MsIHdoaWxlIHRoZSANCj4gb25seSBiZW5lZml0IGlzIHNwZWVkLCBhcyB0aG9z
ZSBhcmUgYWxzbyBiaW5hcnkgcHJlLWJ1aWxkcy4gSSB3YXMgcHJldmlvdXNseSANCj4gc3VnZ2Vz
dGluZyByZXBsYWNpbmcgdGhlbSB3aXRoIGEgcHJvcGVyIGJhcmVtZXRhbCBtdWx0aWNvbmZpZyB1
c2FnZSwgbGlrZSBJIA0KPiBkaWQgaW4gbWV0YS10aSBmb3IgSzMgcGxhdGZvcm1zLiBBbmQgYXMg
SSByZWNhbGwsIHlvdSB3ZXJlIGludGVyZXN0ZWQgaW4gdGhhdCANCj4gc29sdXRpb24gYXMgd2Vs
bC4gSWYgdGhhdCdzIHN0aWxsIHRoZSBjYXNlLCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5l
ZWQgYW55IA0KPiBoZWxwIHdpdGggdGhhdOKApg0KDQpUaGF04oCZcyBsaXRlcmFsbHkgYmVlbiBh
biBvcGVuIGppcmEgdGhhdCBJIGZpbGVkIGludGVybmFsbHkgYWJvdXQgdGhyZWUgZGF5cyBpbnRv
IHN0YXJ0aW5nIGF0IEFybeKApiBJ4oCZbSBzdGlsbCBpbnRlcmVzdGVkIGluIHRoYXQgc29sdXRp
b24gc28gcmVhbGx5IHNob3VsZCBoYXZlIGEgbG9vayBhdCB3aGF0IG1ldGEtdGkgaXMgZG9pbmcu
DQoNCkNoZWVycywNClJvc3MNCg0K

