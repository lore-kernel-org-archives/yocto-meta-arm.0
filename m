Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E274FC3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 14:56:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web10.78225.1747148203669719456
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 May 2025 07:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cuUQ6fyH;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cuUQ6fyH;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: ali.oezaslan@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VxAjV2PPtq8oFIlCI4RHXUxZnSJJrFcLXWSnbJsxuh+7mV+nJVY/w8dUnySp3t6BBBf814BkOO+W167WPM/6OmnTNm+Sfrsxu/wrQsd0wslTXKjny4HwaethUV+QxrUBRZJ5LSx9wekOcsPMWGE8k9j1+psKsK9eBN2m5HNUNrTvLRkCRXGI6j/JsBJR3eBjiR/K06F8bCBZAUK2LSUyXPVqeLB0zHQXrhzQtaV/SGjW9fC3lmOer2rjUJu434eORDq51Nc14fmyM7HO2KOcKuoq01mWjcoMzP0wew3pgfJJPATb3378cQw+qGDP2LEAblWtLcuqIND+l+OXoIDUFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LznqQcc8Wy3SDD9xy+g7RYD7Q/xQf3VuHBLV7Jm/Il8=;
 b=ctof2ihfTFOZmx+YAntnA43VzHD0Uh75nRiFl1/9qvwB3LajSXB2a/S5EwZ2H3jBZnggO1SytSc9RYglm8bRsasntf02U6dhLmO1fEJWDZ4l713JJlFTe3jKJ80SzQFT1eBTDfrLwkzX0TiBI4jjWezmpWA3L3BKgKAbGYKyVuWjjHCRt22KEhgUuUUOIC088SksCUl7aMTJSurAEOzxymSku82qGH3ErDda/aYchiEFO2KAD1SlBqkTymfXaEKdy/JcH79aYiKS3XmUHBYa0oSiLLafSLbDDA5mMEsUymxhQes7T6OxkytyTo37SuWa23SPeGKL4NO0tvudC2KkqA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LznqQcc8Wy3SDD9xy+g7RYD7Q/xQf3VuHBLV7Jm/Il8=;
 b=cuUQ6fyH3SRXuSkR1v00u1KukBhT4qnbvhfWPi3MluU/B3SRTwI5U4m4K2immaG+VvuCSruYHfJQjG68vb0EAq1uId18kjNzkQjS3f3TthZhuHvAWYrwnkuxaCNXAhxEsLxFr12uV+cyp7BFSBFNicbuTamXGIZwOzLIKN0AG+E=
Received: from DU6P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::9) by
 PAVPR08MB9771.eurprd08.prod.outlook.com (2603:10a6:102:31f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Tue, 13 May
 2025 14:56:35 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::7b) by DU6P191CA0009.outlook.office365.com
 (2603:10a6:10:540::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Tue,
 13 May 2025 14:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 14:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHcK6sAGI+ciE5iVrPVpFzSDS9UHh6V3uRdmlJLeLTjxo40onrHToiaVg+z/lKkuktXSGQg5KA9jmV4KRZpgQVMn19t5dhLDC4W+8WpVki0SEKZIJRmd2Blm1xD+JIQEOGKIYZDW272U30vbTYJcltI7nhnS6NgYhGD9yr+jvXvIwtk1e8hRdM9ZFvTrMwnFXO0JVRfB+pg6LSMfgoL0l/Fp+Rl9ZibM37IG43p0pXM5tbdqJ6EM69RQMTErfxX2ahg9IHWQvT3XFO1TeyFIIAMMXx5r7sV6TtJvG1a3x9uKxyers+6+WVlwU9QDAP+qAAQRJTkQgn7kDiyoViUpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LznqQcc8Wy3SDD9xy+g7RYD7Q/xQf3VuHBLV7Jm/Il8=;
 b=Ntop7WAVBpTechAcFSipNY75V/KIZTLW7AB01CiRRIrbMTOztVfunR83qZ9zmygPbMQTfQNXjpUFX6aY4u1jujzjGzgKmrp7n5Ry4YBtHB+S8FxNR1BhpOxx2wh1sF3gfQQc3IFzjmoGWzmKKP0t4NNoTtan6gbvWnKdW1nuxUGPEiKJN+nwT5sveWUj7whi6OY57ebCaWZG4foTyzsrs0XLhY4KIWIfU6/OHoUiUx27MDkEM9+SLxFl/iqNJQGO2mjNOXwPwGJdlV+p2wscAnEMKj5s3x8aBGftmyr3QRoFbOPXmsdkhqqlyXSzyo4GoGlkvVgMAjgYewPumrU7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LznqQcc8Wy3SDD9xy+g7RYD7Q/xQf3VuHBLV7Jm/Il8=;
 b=cuUQ6fyH3SRXuSkR1v00u1KukBhT4qnbvhfWPi3MluU/B3SRTwI5U4m4K2immaG+VvuCSruYHfJQjG68vb0EAq1uId18kjNzkQjS3f3TthZhuHvAWYrwnkuxaCNXAhxEsLxFr12uV+cyp7BFSBFNicbuTamXGIZwOzLIKN0AG+E=
Received: from GVXPR08MB7895.eurprd08.prod.outlook.com (2603:10a6:150:17::6)
 by PAVPR08MB9236.eurprd08.prod.outlook.com (2603:10a6:102:307::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 14:56:01 +0000
Received: from GVXPR08MB7895.eurprd08.prod.outlook.com
 ([fe80::e00e:5b16:8aff:a8e3]) by GVXPR08MB7895.eurprd08.prod.outlook.com
 ([fe80::e00e:5b16:8aff:a8e3%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 14:56:00 +0000
From: Ali Ozaslan <Ali.Oezaslan@arm.com>
To: Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Hugues Kamba Mpiana <Hugues.KambaMpiana@arm.com>, Ross Burton
	<Ross.Burton@arm.com>
Subject: Re: [meta-arm] [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
Thread-Topic: [meta-arm] [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
Thread-Index: AQHbvqcdbbNgGwb6eEaA66ffO4uxu7PPR7kAgAFI0gCAABy0HA==
Date: Tue, 13 May 2025 14:56:00 +0000
Message-ID: 
 <GVXPR08MB7895E7946BC9908A676ABAF88096A@GVXPR08MB7895.eurprd08.prod.outlook.com>
References: <20250506165045.509-1-ali.oezaslan@arm.com>
 <20250506165045.509-2-ali.oezaslan@arm.com>
 <F73BDBCD-10C3-4B0A-A867-FCD7DC7BCF7F@arm.com>
 <CAPoiz9zBSn4QrBMQj2F9eughYYqpuWSO-_zoCLMpWv19yaSxng@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9zBSn4QrBMQj2F9eughYYqpuWSO-_zoCLMpWv19yaSxng@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	GVXPR08MB7895:EE_|PAVPR08MB9236:EE_|DB5PEPF00014B9C:EE_|PAVPR08MB9771:EE_
X-MS-Office365-Filtering-Correlation-Id: 063d23a4-4f68-4a21-510a-08dd922e5a99
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|38070700018|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?wXS/y1qmxm4lbdR6jWpXshzbGSJstOPIOl0l7Dh9axeYIkG11IHgs5q1bxjq?=
 =?us-ascii?Q?UoV4J4nGrMGf1WB16x2nhB0oP+T2xHWSPULU5mZ0Ed7ywBaIrfGOggWBD3u/?=
 =?us-ascii?Q?EsYLpjdk9SF0TlHbfZ1e5fUqen3ATMEsfj1bhxoF5gGusaOLWS3oG0fwWUvL?=
 =?us-ascii?Q?wcZC0VEFT4yPt9xQJLVAeHYGXRovH2UA4/oiuypSaIarLJCoTVl60mANGjI2?=
 =?us-ascii?Q?bIPQyO/XcDmtYUcU7o130//93RwrQJWxIoji/peoTXOeXaVIGDRHj1T6c+MQ?=
 =?us-ascii?Q?p/V8zIqqXxs4CkjN/gmR/kPhf4zb+XxNBruDdflU/1v6q2/fo6QV4feWlW2+?=
 =?us-ascii?Q?Kq/wiuJERawGoDxXjjf9jN975yGE1TrRSbrZngALkxdBfWKfPeCrcmpwn5DK?=
 =?us-ascii?Q?rAsbryqOhNO5gGRsiL1eAZCK4K5RPsRWSGpOSsSVdaUrmiV6rHi3E3wqz+Pl?=
 =?us-ascii?Q?XgTqUtwUVSKeTRPG6IWq27pi5MAiSgREMTeKK0QA6ligxcVCrtECC1lCLCo4?=
 =?us-ascii?Q?9JElFojVq9HkU+cadYlCu1MgbpM8IdjeXdJDJBWolW292iezj9rOUeeXjuwQ?=
 =?us-ascii?Q?rdkHGn1xHcGX67UP604HoWRe/RDUZ2k479NkBWrPJARyYd/PKg0UYG215oTr?=
 =?us-ascii?Q?37mR5C7RbbNhXUxjea7ne0MZLzJLBvI69H4ypNSKJ1RfxkhDnDjmOoRnvEhY?=
 =?us-ascii?Q?Vx9NKrYNGG0yk3eFHFgz0lVK24fKCkJ1FXXlMZJ4LySsnYeXEgx6wlTwkxS6?=
 =?us-ascii?Q?Zu3b1uAoGE3HyVd+57Hcmc54TpxS5lCHyJ/14I1UX2QeQywYh2p3oQNwRk3H?=
 =?us-ascii?Q?xThEXq094TRjgsZDKpsq6gMmZ1WwVdXA93qAX1X89+zZvlVIOjbIEkS6fOLc?=
 =?us-ascii?Q?lxYJXLMg3oR4gHCpX9P8ihTH5vvIT7j7EHrh9KGGLZ1/AyDdy7l9kfNZsLbg?=
 =?us-ascii?Q?+wU/Xo6b1w7TikYSckTOv0EE86QFVdXRa4/IrXjhcxoLNf0vsqW9G+ArIFGf?=
 =?us-ascii?Q?JTEvAwNBLQj+Hrs+hFRlK5QIIe/7bqm2n9q4e0558PWihLsJErsROJIMUm1P?=
 =?us-ascii?Q?m8kW4FWoExONO3sZPD9HqTD2EV1IXrk88m+W6ixkvgqdeKNEgRHtKPPm3ORg?=
 =?us-ascii?Q?fvh+VshYBv1afcMvquT5JjyMazW1JUgffLGeD2BkgczKdjWFoVSa0/kLVwc/?=
 =?us-ascii?Q?I3JtHstTMTbzk+oZMenmTsPr/gTX3Fu4kMturUNObVms1t4Y3+CPvpraxLXJ?=
 =?us-ascii?Q?TEiKVQO33YBZS65y7pSM9vQtNlCpj+gAJ04Uhw8LdTX8ktxcbKeWoP49QmPv?=
 =?us-ascii?Q?4ok0X6RqwUxjgh5Y6WO44ASWyZUYtMq1UzBVz4xRYx3M0XH1c4+ha+nv1MOj?=
 =?us-ascii?Q?qIimXCuwnzhj2I+5fyUhS7fL7i0GT73o0uQglyIalbmSEsQIXgB/MXodUzjY?=
 =?us-ascii?Q?h7jwPPgL7w8EGaclBxKhTAyEL9Pq7x4E?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB7895.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(38070700018)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_GVXPR08MB7895E7946BC9908A676ABAF88096AGVXPR08MB7895eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9236
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5c6d37e9-c8df-47d5-4860-08dd922e467b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|4022899009|14060799003|1800799024|36860700013|376014|35042699022|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVhBdzVkdUdYS2ZnSEVwSXZaWlRQVDRrRG5oVUtVY2Z0cE9NR2t2K2ZCOGY0?=
 =?utf-8?B?NnB3cC8zSjJVREE5M3hoeU1XSnoxd1c1NmxFQ3UvbXMrNnJqcGdTT3FHZFF3?=
 =?utf-8?B?Y2tabzBJNFZyRXk0dUowQlZabUVocFNlWm42MjhwaGl0T3pFTGNDN1plSHp0?=
 =?utf-8?B?bHRXVHMyVWorWExMczR2RVNQdERXNUgxM0MwUkdaVEtERDNZbVpDaHZFc21u?=
 =?utf-8?B?bDVOT3UzZThMM05BS1RRVkJPajRJTU9IR2NzZCs1RHNPZ0hMa2llMTdvaHNV?=
 =?utf-8?B?dWNuUVZ0ckpjanhJWTMwaFJEOTVnbTI0QnNMY2Zld0Y4YzdycE5xd0ZXd3lG?=
 =?utf-8?B?RDdGSlRSZVlkSmpUYzBzOEN5cVpydDFDMFZ5aWowSmEvd2hsdEExc1pmQWcy?=
 =?utf-8?B?T2hvbzlxWVpEc25jL2xlV1pYaUhjbldQUTlUWisvUi84cWZYemZHY3JubmQ4?=
 =?utf-8?B?S3ZmTjFLT3VreVVjRjBWK0FXd2tZd21XdVhoSlhoK1Z1Rm9sUEpQNWdOYjI0?=
 =?utf-8?B?bUFXekxxVUR3YVExZ3BOS3BTWFEyZHROMzRrTGNQaUZ3UksvOHhjalRET3V4?=
 =?utf-8?B?R2xBSng3SnZOalYrWnF2Q3lJTnVMUGhlZVdvdWptZkY1ODVBSHp0TW1pY3d4?=
 =?utf-8?B?WDlnendOOVYwanlodkpxS1BJclpsazBpVlpuTXR0RlBlLzRvbXVvWHJkYXVY?=
 =?utf-8?B?L0hjcnQxMUxUMU52OUVkWlBRbHpvemJ1T3V4cUhzNkFQZXpEOTNsdHQ3dFlI?=
 =?utf-8?B?VTE4VnZ3Z3l1cmdlTnZlZ2duUGxuK0RrZW1xTWlnRGtGdFNBbWh0Y2p2cTV4?=
 =?utf-8?B?dFl6cDVaQTExdUFBOXRqRC9GZDE2VkVTbTgxd1E1cWVhVG5LVGhrcGN2MkF6?=
 =?utf-8?B?Z1I0N3pFWUpzNDVOczRsMXYzeE1pUUozWENKMGxEdHpxZGxRS0d2VlhsTlZu?=
 =?utf-8?B?cnJDTW8xYkJMaDU5cy81ZXg5eUQycXhOVkh1aCs2N3lPMDhYeUdBV3gyWFZ5?=
 =?utf-8?B?NUZFbTU0cHhMemlDZ2t6akpLV0Y2blphcU00T1h5ckNSQXJRSjh1Q1dlWE1y?=
 =?utf-8?B?Tm14bGhNOXBqcG44RkNBYmEvdlhNWnZVYjlpZTAxNlVJcVpiNzZqWU1pQ2tD?=
 =?utf-8?B?RXdTM3Y3TGI3RmtvZHJSN3NkbXkzSkE0eTl4Q3RVRVpUUEIzY29UWFZVUXlv?=
 =?utf-8?B?TVFjeVhuT1cxSTR2WGIrazE4ZDBBRE5kTVRmUm80WU8zS09MTHM3a0YzNFQv?=
 =?utf-8?B?SjNjN2ZycjJQN0JTZ0xINno1UEJ6Y1VlYXhyN056TUNwUSttRnNxQWNMWFNQ?=
 =?utf-8?B?ckEwalVOMnhXYjZFY2I1bm1UR0VteUZyY0FoeG1Ua3NZZmFvUkN2c3FTRS9t?=
 =?utf-8?B?K2o5YU1rekdvQjBOMzl1K05pUnpWSEhJUkVJMzBweUF3Snd5U2FDdWNrOHVq?=
 =?utf-8?B?UllmYndjUTNxWi9xYk5IK01YSm5UTkpYcmx3ZUJEbmxnK1drdkRVamVDL1R6?=
 =?utf-8?B?N1F1NldSZ2V0NXBlaDJLSC84OEFIN1lhcHBkWGJWeHQwUXJLVlB0M21vY042?=
 =?utf-8?B?ZVg5aDdEVHptQnBOZG1sdnNocE5qeWF6b0l5Rko4eEtqVm9UNW0xeGlIRy9l?=
 =?utf-8?B?Vk43cFdsYU5yOXhqbjM1NCtDQ2V4TWRFZFkxUzJETlB2eUhiandvdU5zZW9Z?=
 =?utf-8?B?NGh0TzRiczZUWkdvK3kxTEtTb1dVTmJFSVIwZ1cyNFlLTHBNUHZaanFEb3dZ?=
 =?utf-8?B?aDFMdlE2c2hBOGgvNW9wUmFNSm1iK09qQjZRSWFvMExSajZOU0p3aE1IaGw5?=
 =?utf-8?B?RFhUU1V5OGNlY1l3UDI0YWFLSzMwMHQyL2FMTWNtK0o4dzhPbDdyR0JOdzl0?=
 =?utf-8?B?MEVHbVF5NkcwL2FvZDJuTVFxOFVaanIrS0FEUUpwQzVYdnlmZjdTS3hVNC9i?=
 =?utf-8?B?Mis0aTlxSHdJTTRnOE9nbHFwV2dCNEdRZXlaRHU4S3V0V04rUThyazdDRjRU?=
 =?utf-8?B?WE8rcHU4SkJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(4022899009)(14060799003)(1800799024)(36860700013)(376014)(35042699022)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 14:56:34.2066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 063d23a4-4f68-4a21-510a-08dd922e5a99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9771
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 May 2025 14:56:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6501

--_000_GVXPR08MB7895E7946BC9908A676ABAF88096AGVXPR08MB7895eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciB0aGUgZmVlZGJhY2sgYW5kIGZvciBhcHBseWluZyB0aGUgd2FsbmFzY2FyIHBh
dGNoIHRvIG1hc3Rlci4NCkFzIGZvciB0aGUgcGVuZGluZyBpc3N1ZSB5b3UgbWVudGlvbmVkLCBp
dCB3aWxsIGJlIGFkZHJlc3NlZC4NCg0KWW91J3JlIHJpZ2h0IOKAlCBJIGhhZCBtYW51YWxseSBw
cmVwYXJlZCB0aGUgcGF0Y2ggdXNpbmcgYGdpdCBmb3JtYXQtcGF0Y2hgIGFuZCBgZ2l0IHNlbmQt
ZW1haWxgDQoNCkFsaSBDYW4gT3phc2xhbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCkZyb206IEpvbiBNYXNvbiA8amRtYXNvbkBrdWR6dS51cz4NClNlbnQ6IFR1ZXNkYXksIE1h
eSAxMywgMjAyNSAxOjU5IFBNDQpUbzogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+
DQpDYzogQWxpIE96YXNsYW4gPEFsaS5PZXphc2xhbkBhcm0uY29tPjsgbWV0YS1hcm1AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZyA8bWV0YS1hcm1AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NClN1Ympl
Y3Q6IFJlOiBbbWV0YS1hcm1dIFtQQVRDSF0gQWxpZ24gUFNBIENyeXB0byBzdHJ1Y3RzIHdpdGgg
VEYtTXYyLjEuMQ0KDQpJIGFwcGxpZWQgdGhlIHdhbG5hc2NhciBvbmUgdG8gbWFzdGVyIChhbmQg
YW0gY3VycmVudGx5IG1lcmdpbmcgYm90aCkuDQpUaGUgUGVuZGluZyB0aGluZyBpcyBhbiBpc3N1
ZSB0aGF0IG5lZWRzIHRvIGJlIGFkZHJlc3NlZCwgYnV0IHdlIGNhbg0KZG8gdGhhdCBhZnRlciAo
Z2l2ZW4gdGhlIHByb3hpbWl0eSBvZiB0aGUgcmVsZWFzZSkNCg0KT24gTW9uLCBNYXkgMTIsIDIw
MjUgYXQgMToyM+KAr1BNIFJvc3MgQnVydG9uIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo8
cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4NCj4g
T24gNiBNYXkgMjAyNSwgYXQgMTc6NTAsIGFsaS5vZXphc2xhbiB2aWEgbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZyA8YWxpLm9lemFzbGFuPWFybS5jb21AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3Jv
dGU6DQo+ID4NCj4gPiBGcm9tOiBBbGkgQ2FuIE96YXNsYW4gPGFsaS5vZXphc2xhbkBhcm0uY29t
Pg0KPiA+DQo+ID4gVGhlIHBzYV9jbGllbnRfa2V5X2F0dHJpYnV0ZXNfcyBzdHJ1Y3QgaGFkIHRv
IGJlIGFsaWduZWQgd2l0aCB0aGUNCj4gPiBwc2Ffa2V5X2F0dHJpYnV0ZXNfcyBzdHJ1Y3QgaW4g
VEYtTS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsaSBDYW4gT3phc2xhbiA8YWxpLm9lemFz
bGFuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gY29tcG9uZW50cy9zZXJ2aWNlL2NyeXB0by9pbmNs
dWRlL3BzYS9jcnlwdG9fY2xpZW50X3N0cnVjdC5oIHwgMSAtDQo+DQo+IEnigJltIGd1ZXNzaW5n
IHRoYXQgeW914oCZcmUgZG9pbmcgZ2l0LWZvcm1hdC1wYXRjaCBhbmQgdGhlbiBnaXQtc2VuZC1l
bWFpbCBtYW51YWxseSwgYmVjYXVzZSB0aGUgY292ZXIgbGV0dGVyIGlzIGNvcnJlY3QgYnV0IHRo
aXMgaXMgYSBwYXRjaCBmb3IgVEYtTSwgbm90IG1ldGEtYXJtLg0KPg0KPiBDYW4geW91IHJlLXNl
bmQ/DQo+DQo+IFJvc3MNCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSBy
ZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25s
aW5lICgjNjQ5Nyk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtYXJtL21l
c3NhZ2UvNjQ5Nw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZy9tdC8xMTI2NTI4MzQvMzYxNjkyMA0KPiBHcm91cCBPd25lcjogbWV0YS1hcm0rb3duZXJA
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0
b3Byb2plY3Qub3JnL2cvbWV0YS1hcm0vdW5zdWIgW2pkbWFzb25Aa3VkenUudXNdDQo+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+DQo=

--_000_GVXPR08MB7895E7946BC9908A676ABAF88096AGVXPR08MB7895eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29m
IiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01T
Rm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAx
MnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjayBhbmQg
Zm9yIGFwcGx5aW5nIHRoZSB3YWxuYXNjYXIgcGF0Y2ggdG8gbWFzdGVyLjwvZGl2Pg0KPGRpdiBj
bGFzcz0iZWxlbWVudFRvUHJvb2YiIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0Vt
YmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5z
LXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij4NCkFzIGZvciB0
aGUgcGVuZGluZyBpc3N1ZSB5b3UgbWVudGlvbmVkLCBpdCB3aWxsIGJlIGFkZHJlc3NlZC48L2Rp
dj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9z
LCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZl
dGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+
DQo8YnI+DQpZb3UncmUgcmlnaHQg4oCUIEkgaGFkIG1hbnVhbGx5IHByZXBhcmVkIHRoZSBwYXRj
aCB1c2luZyBgZ2l0IGZvcm1hdC1wYXRjaGAgYW5kIGBnaXQgc2VuZC1lbWFpbGA8YnI+DQo8YnI+
DQo8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIiBzdHlsZT0iZm9udC1mYW1pbHk6
IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9udFNlcnZpY2UsIENhbGlicmks
IEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAs
IDApOyI+DQpBbGkgQ2FuIE96YXNsYW48L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9k
aXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9
Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxp
YnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48
Yj5Gcm9tOjwvYj4gSm9uIE1hc29uICZsdDtqZG1hc29uQGt1ZHp1LnVzJmd0Ozxicj4NCjxiPlNl
bnQ6PC9iPiBUdWVzZGF5LCBNYXkgMTMsIDIwMjUgMTo1OSBQTTxicj4NCjxiPlRvOjwvYj4gUm9z
cyBCdXJ0b24gJmx0O1Jvc3MuQnVydG9uQGFybS5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBBbGkg
T3phc2xhbiAmbHQ7QWxpLk9lemFzbGFuQGFybS5jb20mZ3Q7OyBtZXRhLWFybUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnICZsdDttZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnJmd0Ozxicj4N
CjxiPlN1YmplY3Q6PC9iPiBSZTogW21ldGEtYXJtXSBbUEFUQ0hdIEFsaWduIFBTQSBDcnlwdG8g
c3RydWN0cyB3aXRoIFRGLU12Mi4xLjE8L2ZvbnQ+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPC9kaXY+
DQo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTFwdDsiPg0KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij5JIGFwcGxpZWQgdGhlIHdh
bG5hc2NhciBvbmUgdG8gbWFzdGVyIChhbmQgYW0gY3VycmVudGx5IG1lcmdpbmcgYm90aCkuPGJy
Pg0KVGhlIFBlbmRpbmcgdGhpbmcgaXMgYW4gaXNzdWUgdGhhdCBuZWVkcyB0byBiZSBhZGRyZXNz
ZWQsIGJ1dCB3ZSBjYW48YnI+DQpkbyB0aGF0IGFmdGVyIChnaXZlbiB0aGUgcHJveGltaXR5IG9m
IHRoZSByZWxlYXNlKTxicj4NCjxicj4NCk9uIE1vbiwgTWF5IDEyLCAyMDI1IGF0IDE6MjPigK9Q
TSBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzxicj4NCiZsdDtyb3NzLmJ1
cnRvbj1hcm0uY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcmZ3Q7IHdyb3RlOjxicj4NCiZndDs8
YnI+DQomZ3Q7IE9uIDYgTWF5IDIwMjUsIGF0IDE3OjUwLCBhbGkub2V6YXNsYW4gdmlhIGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcgJmx0O2FsaS5vZXphc2xhbj1hcm0uY29tQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcmZ3Q7IHdyb3RlOjxicj4NCiZndDsgJmd0Ozxicj4NCiZndDsgJmd0OyBGcm9tOiBB
bGkgQ2FuIE96YXNsYW4gJmx0O2FsaS5vZXphc2xhbkBhcm0uY29tJmd0Ozxicj4NCiZndDsgJmd0
Ozxicj4NCiZndDsgJmd0OyBUaGUgcHNhX2NsaWVudF9rZXlfYXR0cmlidXRlc19zIHN0cnVjdCBo
YWQgdG8gYmUgYWxpZ25lZCB3aXRoIHRoZTxicj4NCiZndDsgJmd0OyBwc2Ffa2V5X2F0dHJpYnV0
ZXNfcyBzdHJ1Y3QgaW4gVEYtTS48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgU2lnbmVk
LW9mZi1ieTogQWxpIENhbiBPemFzbGFuICZsdDthbGkub2V6YXNsYW5AYXJtLmNvbSZndDs8YnI+
DQomZ3Q7ICZndDsgLS0tPGJyPg0KJmd0OyAmZ3Q7IGNvbXBvbmVudHMvc2VydmljZS9jcnlwdG8v
aW5jbHVkZS9wc2EvY3J5cHRvX2NsaWVudF9zdHJ1Y3QuaCB8IDEgLTxicj4NCiZndDs8YnI+DQom
Z3Q7IEnigJltIGd1ZXNzaW5nIHRoYXQgeW914oCZcmUgZG9pbmcgZ2l0LWZvcm1hdC1wYXRjaCBh
bmQgdGhlbiBnaXQtc2VuZC1lbWFpbCBtYW51YWxseSwgYmVjYXVzZSB0aGUgY292ZXIgbGV0dGVy
IGlzIGNvcnJlY3QgYnV0IHRoaXMgaXMgYSBwYXRjaCBmb3IgVEYtTSwgbm90IG1ldGEtYXJtLjxi
cj4NCiZndDs8YnI+DQomZ3Q7IENhbiB5b3UgcmUtc2VuZD88YnI+DQomZ3Q7PGJyPg0KJmd0OyBS
b3NzPGJyPg0KJmd0OyAtPS09LT0tPS09LT0tPS09LT0tPS09LTxicj4NCiZndDsgTGlua3M6IFlv
dSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuPGJyPg0KJmd0OyBWaWV3
L1JlcGx5IE9ubGluZSAoIzY0OTcpOiA8YSBocmVmPSJodHRwczovL2xpc3RzLnlvY3RvcHJvamVj
dC5vcmcvZy9tZXRhLWFybS9tZXNzYWdlLzY0OTciPg0KaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL2cvbWV0YS1hcm0vbWVzc2FnZS82NDk3PC9hPjxicj4NCiZndDsgTXV0ZSBUaGlzIFRv
cGljOiA8YSBocmVmPSJodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTEyNjUyODM0
LzM2MTY5MjAiPg0KaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL210LzExMjY1MjgzNC8z
NjE2OTIwPC9hPjxicj4NCiZndDsgR3JvdXAgT3duZXI6IG1ldGEtYXJtK293bmVyQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmc8YnI+DQomZ3Q7IFVuc3Vic2NyaWJlOiA8YSBocmVmPSJodHRwczovL2xp
c3RzLnlvY3RvcHJvamVjdC5vcmcvZy9tZXRhLWFybS91bnN1YiI+aHR0cHM6Ly9saXN0cy55b2N0
b3Byb2plY3Qub3JnL2cvbWV0YS1hcm0vdW5zdWI8L2E+IFtqZG1hc29uQGt1ZHp1LnVzXTxicj4N
CiZndDsgLT0tPS09LT0tPS09LT0tPS09LT0tPS08YnI+DQomZ3Q7PGJyPg0KPC9kaXY+DQo8L3Nw
YW4+PC9mb250PjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_GVXPR08MB7895E7946BC9908A676ABAF88096AGVXPR08MB7895eurp_--

