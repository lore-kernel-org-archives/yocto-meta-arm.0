Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFA7EC1EBF
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 14:06:21 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21411.1770300371900490125
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 06:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GhxminbB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GhxminbB;
 spf=pass (domain: arm.com, ip: 52.101.69.6, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aTvjmbVkOi3xZ8Hc1V3dojoEjOft+GWJXzSAPjnPp4WvtxQBE5ZiXw8tpP4oXv2m0rSLIIIPptlBK/fDNA6/ecUvnLx5i463Gwt+UPImHGllIgR9ZeZt+Kij1McynuBSoqwBZFPCMPzd72L3kDsYITp6eiXtSaQpcfsM4/II2xfOkMoNuStSY9ENmD1oMZ1V3QmF4+aEl3a6TSdfAGscGw9SF6rBxnBzxxLGfsuMBGvH8VChpMywmjTad2hGiW0QvuA0aPrynLmRNek7ZnqD4jEWBkvKFrFCA4FXqkeigyuvYLLZ+HzQuMMdhtRvzUfpR6nYz2Gg1FED22uXO+wOlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNCOLmEIdFM3oW45g+aX6109sjrjBjlO6WupdxnDhk0=;
 b=rgZrYiNBklG63B7GapNzO3PQqOtXXbveY79gifmx6tHCVrLqn/tL67uO8W1Z38MBmQOkPBYVxfch8kZur9JiL4skRTKmM/6fscCbhea3v638Uu7mcfPPzsGnnvrg+36oDxyPdkkJRpODNghdIywfHZVZ7YCdbJ+lqCKRWvZBwzva6uv9byEtQ23aiLjfX36cBNffS9JguGBBC1eNE0Yxw0OOI6nElQeT0UxNCo6CQGk1e4RRM3kwK99yyr+oQEFsM3dM9MzekZvA+6OPCgp0hrvHqgn2JMHcdxZDISt8yc6E5eHVEV4FbRQjLsw1ZCX15pDCTWYqHWR9unOrQxffag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNCOLmEIdFM3oW45g+aX6109sjrjBjlO6WupdxnDhk0=;
 b=GhxminbBVd/4Gd1NxAMcJPUgHsaonafeAhukXIU/953iBLYjfXbKJUgt4ovEkAIjqyW/qUEbdT8iQOStvcmq5zM2WohmTV0oOF8c4GDaODx18MotZbcohrivmoHrGihtE1RDo8+mwFs0JxwSUAmWUtCZqhJKs00SCcIOg6e+bEk=
Received: from PA7P264CA0460.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:398::24)
 by FRZPR08MB11190.eurprd08.prod.outlook.com (2603:10a6:d10:139::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 14:06:04 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:102:398:cafe::5a) by PA7P264CA0460.outlook.office365.com
 (2603:10a6:102:398::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 14:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.0 via
 Frontend Transport; Thu, 5 Feb 2026 14:06:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3ENC3571p3Jihk/r0b2UhRJuyhUiPBjjVWcEX2uIH2ANZiQaV3/li3FCIP1A8gyg7vsA9f+v7358OAp5RKeicZmoDy6ccEm7HhuiqRnMQ9v6XJXtb/4LKO2fac8K11s1+KJysnVGVYDW6FkyjeKl4WDiF+XqH1looethiI5n7yx6rDrJMA9e3yySFP2qxLgmhpYnuSZLIaEDp7CDqVVj4iMMqaTYbwAZ+jmO9R+7P31VsokUIhr4U8QjgCJQQRFbIN2Bh3038ZfwGwmvN5+rKp1HGk49W2NMEgluBpGKUQJHA4L2Ne8PugxQ0OP4WUGbB8/vy5HRd4jaRlbDeNiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNCOLmEIdFM3oW45g+aX6109sjrjBjlO6WupdxnDhk0=;
 b=qa2eLNBNpNTwrDlrF0r71XChJ5+x0JP56vnhu1qjgXNnZytVw5LxWtbpLdn9TkHBzI/nFtJdaBRXTbYLyCKleonjCMzPzbHR76gN4pvhwOzjbFwWJPE1buH8iBwfEGD3cHvggQdhL4P9AsodEaF8JoDC9kMUPghJ2mk4zkb12tjBr0NfSkwbwIuJMPKvilboRYbfgxAaz3F1duNGCHLL0YF9G9PQ2ecgDBRqh+0zAL05DrfpSqNSh1UZi4CKh2B/sFIqDu8iCJR+E3yAuQHDmLI6hAvl3NV6/2fCnf/PgXRcuHChxaljCWVqAGcb5dH9ui48eUcSqxQkqD/jWLMDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNCOLmEIdFM3oW45g+aX6109sjrjBjlO6WupdxnDhk0=;
 b=GhxminbBVd/4Gd1NxAMcJPUgHsaonafeAhukXIU/953iBLYjfXbKJUgt4ovEkAIjqyW/qUEbdT8iQOStvcmq5zM2WohmTV0oOF8c4GDaODx18MotZbcohrivmoHrGihtE1RDo8+mwFs0JxwSUAmWUtCZqhJKs00SCcIOg6e+bEk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB8940.eurprd08.prod.outlook.com (2603:10a6:10:431::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 14:04:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:04:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Proposal: remove meta-arm-systemready
Thread-Topic: Proposal: remove meta-arm-systemready
Thread-Index: AQHclqhq6uGhWXci9U2YEuBjlvvXnw==
Date: Thu, 5 Feb 2026 14:04:59 +0000
Message-ID: <1C990F17-F73E-46A1-9B4B-4F818BB24E13@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB8940:EE_|AM4PEPF00025F99:EE_|FRZPR08MB11190:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf58cab-dee5-44d5-061a-08de64bfb24d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|3613699012|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OVpMTlNNaG9QUS9JTlNPT0ZpTTFsaEVJWFdmb1gwVHByZzk5ZTJ3cUkwYTA5?=
 =?utf-8?B?eGVEZCtuY3E1SlBTcmk5MWs1ekh5dHh0TUx0SXE0eVFUcWNzQ3hqUy9lV0kr?=
 =?utf-8?B?K050QkxjaWtkRkVWNEpYcWZUNG5CYlRpcDF3T0h4anRGamFsU2hOU25tNHNJ?=
 =?utf-8?B?WXhGb3FLeGRyM01iT1ZUeUZRUWJHN3Y5Y0RmaGkzQmlTVlpvNjdlRHFqODhW?=
 =?utf-8?B?V3Z0M011bWNWTjlqemxyOHJOcVpqbnJrQTBzOEYzU0U1Qzl4VzdqSXd3Tk4x?=
 =?utf-8?B?Z1N0SmE2V2NhUkxNK3MzemhvaEVNWVBPWFZDVnRSY1cvenRqbjIyRm1FWjFK?=
 =?utf-8?B?V2p3NHdLRy8zL0JKOU9DWGxKazdOSWtlOUx4ZkFvbTA1ZjEya1JVNTNadURu?=
 =?utf-8?B?QTFHTlFOdUp6cEJnV3psU0VURGFad05XY3VXTW5VOWxhVVNHOXl1Nk52SjN0?=
 =?utf-8?B?MkhDc0d6TFN0S2tFY1IrWjJJL1BoaE9LWUsxSlk5YjdRbkpmWTZjcnQzNWRu?=
 =?utf-8?B?dVpDMitjNWFuK3lCUm8vVThuWEtNVFVDME5CYjBpKzZpT1Q1SEh6eTlwOVp2?=
 =?utf-8?B?WFA1RDF4WlZCMURlemlqREc1RnF1VGpWNlZjWVlvL0JRbDJYYy9MWVBLQm1q?=
 =?utf-8?B?akVwU09JNzh3NXFRa3hmZ0ZWSjc4aS82emF4MXJBMWRQMFNIK0w4L3hoVTlB?=
 =?utf-8?B?c1JIbUV3cG91VFhBK1Z6NEYzOC96OG5Ia1lZSnV3QlFURERseko5SUYwTkVQ?=
 =?utf-8?B?TlBNRzRWOXVkYjI4aHByQ0xsOTVRSlRMR00vUlNPTnJBNC8xNG1XbGZWOEsz?=
 =?utf-8?B?c3RFbk1aeUQzYWpTYlBGMDNibFlGNkZKRkhXcDRxdy9Dc09LaGZYRjAyU09V?=
 =?utf-8?B?OVNGQ3dnWWdpS2tTc1B4VWZ6MGpld1g1N3AzK2ErSlRCa1lyRVQxSm1ZZEdY?=
 =?utf-8?B?bXFiVDYzOHJvWWVMaW5ITUh0WW5FTmtTL3RMbVFkeklJalNnRW11NVA2dldQ?=
 =?utf-8?B?dUtwM2lSK0N4Z2xqWGFNWWhIK3hGdlo5Q0RkSmY0d2tmeklJN2d5aEZlSkhi?=
 =?utf-8?B?NEtpYnNydFBoOWtKcG5LVmMwTGlVcW5SdE9ObEtlbE00UnQvZXZ3QndjRFZ1?=
 =?utf-8?B?THB2U09zNXRWTWMwaS95NllrZjZ1U0E4TzcxSFZ2djhacTNINWhneHkzNTQ2?=
 =?utf-8?B?TFJibzFpNDhyd1dkb2pFNkFFWFFZS2xMSTJ5bDNGWVdxZ1JIeG9zL2ptQnA0?=
 =?utf-8?B?RHMzbDJrR1FIMnl4S3dqMmZrdEd5cHhsb3lucnRFWnBjbm4zYzE0VlNuQ2dQ?=
 =?utf-8?B?MFUzTWFlZHk2UTRBdHF0NDg3d2dGN3FCODIyY3phMFVxRUdpWlBiSEx3WnR3?=
 =?utf-8?B?RjdUQUhtUWZ4QkdtZUtlYkh6VDZ2WGh4Z2lKSWs4K3JyWHNKaVE5TjM4UHdh?=
 =?utf-8?B?Zy9BMG1qMDM4LzVIUzZneWx5clJ3N245emRUTjlTZnAwZm5LMGJPY0dKOXpB?=
 =?utf-8?B?cDdrMWQxcmNnaVRscU80TXlkaEI5THJRVTdhRW5YUnJhSDBFYzFWS1lrR0dL?=
 =?utf-8?B?NkxweTZDalNSMHVzVEswdVMyL2hweEwxcDYxb3hTWEJpMVk0TElrWis4bTVt?=
 =?utf-8?B?TUU4MjZoRnhNYzIrVmt6aVlxcm45em8walJQVVVNaWxWdjVUdlZxYW5sVVdt?=
 =?utf-8?B?VThab2F2dlJmZ0tsTmRXaGJrUzY4YStBZVZ6aldjbEJPcWlmQkM5dW9adWZh?=
 =?utf-8?B?Y1l4WFNCZEFLVlFzZEk2RzF5SExwMmZML3p6NjNDdjk3SnZSNHdqYlBGbUJz?=
 =?utf-8?B?MDRKUFVTTVM0V2dUcmw2ZXdRRURiVE9uazBzMlRyK1VhMDA1a3FrT0M2OThh?=
 =?utf-8?B?aVBMajk3MzdOeTVpNHBHcEpieDVmd2ZRek80Z3FHWGRpZ0hBSTlhK0J2VTJ3?=
 =?utf-8?B?NjZINm5VTHN1YkRIZ2o1NUE5YVYwd3ZIZHBDNFVEK1VNYm1PdGY3dXYvdCt4?=
 =?utf-8?B?bXJYWThYWDE0bG5SdFkxK1BIUXN6STZlL1kyYU9xK05qMGl4a3A2aGhIbFBo?=
 =?utf-8?B?ZnJmT3hSbXlISklCdDlJckJUQlk5cStpNnM2WjRzNUVKUkx3dWpsSHN1SWR1?=
 =?utf-8?B?RTMzV2lvMnZjMlFaaVhDaGlGcnVjZHlYRlU0M2xZUUNVb1Y2dTNKdkxBRXYv?=
 =?utf-8?B?WGxsTzFnaXhlallPMDhpSHZ2WW5NSmVpcGFyclpMek9xSHdzMkFhSFZmMXpl?=
 =?utf-8?B?KzVNdHRRd1pRQU91Q3B4aWpUREp3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3613699012)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B5439B1615DD644975476A633975648@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8940
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3b04cd01-1083-40a1-a9d6-08de64bf8c91
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|376014|35042699022|1800799024|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NXh6UkdFUUxRQlE5bmJLcGhIa2xjRTVObUo3eDZteWJjcmlTckRlL3Q4bERl?=
 =?utf-8?B?cWhLbEk4ekQwL2VRRkZZYzlTZ2d3TGdWTFNzaStibXpSMSs3U21VQnBaTGNE?=
 =?utf-8?B?d2VJNmxjaDJXN0RBS0hyQ3c1ZDBqUzFnM3RQUzlnMmhHZ1U2SVpDMEo4aGdT?=
 =?utf-8?B?eGtaY2xYUEptdUM5clNZTkVjaWpabnI5ZXRzUGJvVjdoQ2duY0RTYXpXYVFj?=
 =?utf-8?B?ZFpBaW5ZTjAxQXRJbE5OSUZIbmptbDM4T1dWaGtrQVlyV3d2d2RkaHRNV1Bt?=
 =?utf-8?B?aEIzWndRc1dSc3NvYXFqWHJuZkdxcEZDbWdRSUNWZ1Y3VTM0czNjVEhmbW5u?=
 =?utf-8?B?RUlNbWxySy9wVDhFT3NnalhuaGxBMXpZQ3lEaVR4cDJ4T1ZMMEFFMFpXNDE5?=
 =?utf-8?B?MDA0b1JMRkV5eE1MbGEzdkhyRjN2cSs5NHdYNWQ4ME5rTVBJVnpndUZWbzlF?=
 =?utf-8?B?ZEZJbUtRM2RhTEdGK2kvaWtWNjlUYjl5SUhpclhLV0F6TGdvbFdPWmxCRGhy?=
 =?utf-8?B?cHlhaitNS293ZkZ2M1lJM1pJSDBweGJkeCs0bSs2ZW54Njl6Nm12ZFIvMnNJ?=
 =?utf-8?B?QUx0cGxSY1dBVkt4ZHEzVFlDL1RnZnNVbDd3TEZCcnpFSnI1VzgzbXhpdkhX?=
 =?utf-8?B?eE9BUE1lTE55UzllWTlHQmJtamNnTXp3R0FMeXBwL002UjVhK3BXYlQ5L3RP?=
 =?utf-8?B?NnJQbHdMMm9RTTJoRllPKzhXVGloVXhGU2ZsdGNJcGRXV1V1cFNpd3FEVml0?=
 =?utf-8?B?ejYzdXJFbVZaV0xmQ0hpbjBCdFVoNTdMNmFzNGxUMkFSWUVmbEJqS3RsM0Fy?=
 =?utf-8?B?SkJUU0JHNVkrVitGMFJONmpjMXV1T3FGN1c3MWo1VHpRTVgyYTVMV3R3T1Bi?=
 =?utf-8?B?M3R3YnZ4MnlNY0FjWFFGOHBIWnVtREhQRk5pRkJiaUl4azRGRGd1RnFZbVVm?=
 =?utf-8?B?SEtHSlZpMWd1OWNvMDcrSUlyK1gwM3dKLzJabWZEcC9BWkRxK3pwejZtNytT?=
 =?utf-8?B?UnJhUzZIUDZXQXBlbmp0bXlMaFNxMURoSEtTNkxjanpZT1AyUkpyeHVzekNC?=
 =?utf-8?B?Qytvd1RSN3FJWGZSUExkWTJkVjY1c0FjWXdGbnArNFlIUEFtd2lyejNJLzNM?=
 =?utf-8?B?b2pPd3lEcXdzbTQrSW43QmYvSFR6RTdTR0tLRHJ3dGdrcjdDNnhjU0lnTHJz?=
 =?utf-8?B?TGNkRUJMSFdOYWhyNFBwbHRMZXU5L3cvbDRFbnJrVTRnODY0aFdUUUVsS3Nj?=
 =?utf-8?B?cTEzN0l1OGtoVmFJUkYwWHR2d3E0ZUgvajd6UHp4bk1ZWlBpNXd1ZnM5RmV0?=
 =?utf-8?B?bUI2VlpObHBIbGZaT1JweHBQY0ZqV3E4MkxPWkhyK3A4ZlBVZlZmVGdQZ0lN?=
 =?utf-8?B?K2pOWTVrNncvcUlBUVRBL2d5OStUb2lHYitmUCtSbDdxUmluZGViYWkwN1BM?=
 =?utf-8?B?eExjRDdna1pTOVhRcmRzQkVUUFE4bXJ5cEt1cDBjemlNSWZRbUxxVVpYUlJT?=
 =?utf-8?B?TkFmRHY1Vk5VS2FUSWdZS3V4ZW1PSHMxRXowN3dMK2NiNU5LK0ZOL0xrNElL?=
 =?utf-8?B?VWJqUEorN3luSUdmSWgzRGZFQWhyK3V0WUhPak4yaUsxR1NvT1ZXbE1pT2hZ?=
 =?utf-8?B?OVA3VUlZdmd3YlNxbmk3TkluUTBlWFVDdWxnVlh5OW9SMXp0bzFYVFpmQ3JS?=
 =?utf-8?B?OEthREFaNWcwVm9JNGprUnZzdEdjcFpDdUVRSHdJd09SVWRheDYyZTJDVmlX?=
 =?utf-8?B?ODRkYlFzeXkxejBZeE9iOUR5Vmx6d0JBNUp3SDVCMk1YWnBjVGZ1d0lERDVh?=
 =?utf-8?B?b1NkYTI5bFdaV0VvY05LZUxramRYNzBwV3AzU1dTRjBCTWcxaXg5Q1daYkJx?=
 =?utf-8?B?am85aTlNUGJMcUVWdjgwSEoxQzJZVC9IUTNodExPVzBRMWhMT01rLzBwSDJZ?=
 =?utf-8?B?ODAzd05mYkxTTHUvbzdFV2IzNXp1Q0ZpSm00aTIxQk5KblhZQmgyYStRWUg0?=
 =?utf-8?B?dk1SazZBRzZnMm1JYlcwRmhScHZsRjNlbFRHemNRUEtkOU40Y0VTNlVpdks5?=
 =?utf-8?B?aWxzYUsyZmRSTi9uSHhwRlZxamJ0WUJEbnJQaE91MUdmSHlyNVQ0TFVHdy9j?=
 =?utf-8?B?bHlrdlRibFlhWmdzY1RVWjQ4cnVKYkdwcFNMQmRLaGtGRXZxaHlhODArcDVl?=
 =?utf-8?B?TkM0aEZIK2sxVHRDRTBBOHpnSHl1bUpLWEhSd2E1UXBIbVgrZTJCeDFCT3dr?=
 =?utf-8?B?UXhwT01TNEFKSll4ZmNraE81TUp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(376014)(35042699022)(1800799024)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cw9H9n3i/VHbPFoux4Ae6pLolqsMJaIWFFa+jA8y56jpuUUcOxawjZKauPTN8oTG5u4Wa0UmqRjlx1B2RQEyLhSTAeNXxrcKVp29GHFaBteTscupNlag8LWDpYrRS3QOHvbgVawipx4M6jYprJzrqMWbHsxPPpj7gNVHZ00zeFIIgBu57sH6OyI59DoyToc99hVf5LyPE5YzDkk+U2yPvtNHj9UIqK4W2VzR4nt38dJTHtGPZYqWy9iCkvkol5Tw4XGGlneMWLu63X8jhpB7btCfLRD0gWFIWeGn6gbt09nn2jfajZdONbjuj3IeS7Hb6YdwQFtQfI1sx0QdjjVq3/HnuA1r1lyMHYSysQkn4Gva+7ZvddPaF9SUe6Dk7NWN8ZT5Pig+Mg/enMGt8PNUHAjibCXDx3M+O5bnnvM1AKfmfN5NY15uWlWwOgrKIPLx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:06:02.5791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf58cab-dee5-44d5-061a-08de64bfb24d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11190
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 05 Feb 2026 14:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6887

SGksDQoNCkkgcHJvcG9zZSB0aGF0IHdlIHJlbW92ZSBtZXRhLWFybS1zeXN0ZW1yZWFkeSBmcm9t
IHRoZSBtZXRhLWFybSByZXBvc2l0b3J5LiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgcmVhc29ucyBm
b3IgdGhpczoNCg0KMSkgVGhlIHRlc3RzIGhhdmUgYmVlbiBmYWlsaW5nIGluIENJIGZvciBzZXZl
cmFsIG1vbnRocywgYnV0IG5vYm9keSBoYXMgcm9vdC1jYXVzZWQgdGhlIHByb2JsZW0geWV0LCBz
dWdnZXN0aW5nIHRoYXQgbWF5YmUgaXTigJlzIG5vdCBhY3R1YWxseSB1c2VkLg0KDQpUaGlzIGlz
IGxpa2VseSBiZWNhdXNlLi4uDQoNCjIpIEl0IG9ubHkgc3VwcG9ydHMgdGhlIDIuMCByZWxlYXNl
IG9mIHRoZSBJUi1iYW5kIEFyY2hpdGVjdHVyZSBDb21wbGlhbmNlIFN1aXRlICAoQUNTKSBmcm9t
IDIwMjNbMV0uIFRoZSBTeXN0ZW1SZWFkeSBzcGVjaWZpY2F0aW9uIGFuZCB0ZXN0cyBoYXZlIGNo
YW5nZWQgc2luY2UgdGhlbiwgc28gdGhlcmXigJlzIGlzbuKAmXQgbXVjaCB2YWx1ZSBpbiBhIDIu
MCB0ZXN0IHdoZW4gdGhlIHF1YWxpZmljYXRpb24gcmVxdWlyZXMgMy4wLg0KDQpUaGlzIHN1Z2dl
c3RzIHRoYXQgYW4gdXBncmFkZSBpcyBuZWVkZWQsIGhvd2V2ZXLigKYNCg0KMykgQXMgdGhlIEFD
UyBjb21wbGlhbmNlIHRlc3RpbmcgdGFrZXMgYSBfdmVyeV8gbG9uZyB0aW1lICh0aGUgQ0kgcnVu
cyBmb3IgMTIgaG91cnMgYmVmb3JlIGJlaW5nIGtpbGxlZCksIHRoZSB2YWx1ZSBvZiBydW5uaW5n
IGl0IF9pbnNpZGVfIGEgWW9jdG8gYnVpbGQgaXMgdmVyeSBsaW1pdGVkLiAgSW5zdGVhZCwgc2Vw
YXJhdGUgaW5mcmFzdHJ1Y3R1cmUgdGhhdCB0YWtlcyBhbiBpbWFnZSBhbmQgcnVucyB0aGUgdGVz
dHMgb24gZGVkaWNhdGVkIGhhcmR3YXJlIGlzIG1vcmUgY29tbW9uLg0KDQpEdWUgdG8gdGhlc2Ug
cG9pbnRzLCBJIGRvbuKAmXQgYmVsaWV2ZSB0aGF0IGFueW9uZSBpcyB1c2luZyBtZXRhLWFybS1z
eXN0ZW1yZWFkeS4gIEkgcGxhbiBvbiByZW1vdmluZyBpdCBhdCBzb21lIHBvaW50IGluIHRoaXMg
cmVsZWFzZSBjeWNsZSwgc28gaXQgd29u4oCZdCBiZSBwcmVzZW50IGluIHRoZSBuZXh0IG1ldGEt
YXJtIHJlbGVhc2UuDQoNCkFueSBvYmplY3Rpb25zPw0KDQpDaGVlcnMsDQpSb3NzDQoNClsxXSBo
dHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJlL2FybS1zeXN0ZW1yZWFkeS9yZWxlYXNlcy90
YWcvdjIzLjAzX0lSXzIuMC4w

