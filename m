Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFED7C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 14:02:28 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.41])
 by mx.groups.io with SMTP id smtpd.web10.17074.1711634540809168067
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 07:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8cQVQaiY;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8cQVQaiY;
 spf=pass (domain: arm.com, ip: 40.107.13.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WpS/MbMwuAArkKfmgvQeh/58sj5eur6GqmwcjKxNxmJDAzwwcjjnTGwZcBSiWEmy29fZPU5tA8tRDy0MKwztBHh6rr88vE+MhdMiAN3pt9GkFQNmftUvUH7AcPLSI0KkOqziPG4jgXRn8uCwLL/0TNjiHyXDllm0RMSWgXnjkw8sc3rOhlNbN49DIWnn6mnLA43McyTWsqQ17+SlUTlbeIjUHly2+SiW3xzlAeEjSRkmMkoFwYIbnMpvAGm2GOV0MbB6Gpt5REsnqrj+aE09OCtKG7ucMyQx19c6QBbZs4n4kcT+nTJUIcIpPO1ayi3RMhE58HAblUi+xs51dPE+YA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnEd2yMZ5AnoFa68HBaM3T+RM+/Acea2LersiebntJ4=;
 b=IgWNwm5/MjVRuN+U0/ibTUf4IIqu4kqlCYEXJ+20vSfbMjUcvpw5c2fH6wpEEm/C2HfihA43wa+5YrTMGDkhrYBW8JXOwAjqFBvrNwfuAdx1UWOAF/NxRgUCVHB1dMsJUEJTeot/MFG6y8+jp6qb87dI8wr0ozUGLvW/oT9gQEWfSaqQubehBBE4Js2llqCWV9lM8G1Uexzse+x2WvugXQbzMtdQfUQDJjXlOzB7/LLCokTl8ZjTQ0AW7EO3C6Zt7jEHfyYmSgtUMuSgXi3yHqnIF0JPA9G1wB5gd0c1FU9S1NtGuKppdwufXHXdpwBsJt1YVaQh8FdQN72TNgVvvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnEd2yMZ5AnoFa68HBaM3T+RM+/Acea2LersiebntJ4=;
 b=8cQVQaiYCS9I7zmBxFhCfyEN/Ey+EuH9yOC/lfCbdHw2s+FOEZDQaMbqC0GaIRFloIc7Zj7y7b9p3NbqOQ2zDZp/pYzXqYTyHXjJHKWow1qozIBHmVCoBIloir67vXqwjmR5AbT5AXskwXuN/hh1PifCRBRTff3gMmOEBn2b4jU=
Received: from AS8PR04CA0155.eurprd04.prod.outlook.com (2603:10a6:20b:331::10)
 by AM8PR08MB6339.eurprd08.prod.outlook.com (2603:10a6:20b:317::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 14:02:17 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:331:cafe::11) by AS8PR04CA0155.outlook.office365.com
 (2603:10a6:20b:331::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 14:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 14:02:16 +0000
Received: ("Tessian outbound 9b7417e2a8eb:v300"); Thu, 28 Mar 2024 14:02:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0b62ee7fe0d1c4a2
X-CR-MTA-TID: 64aa7808
Received: from 6f9f750cede9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C6908257-0240-4561-819B-426A37659C59.1;
	Thu, 28 Mar 2024 14:02:09 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f9f750cede9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 28 Mar 2024 14:02:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMWwguR8urSI7Roj5+WIK92ZidEv5B1u1PPkBkoWAEytGHFV+CcZDsZXb53SFwvrDi5HZwuBxGq4BhLIH0yKj4GB4hpshPluTFpDZ8n4xOMC3AQ8vfEUPfCJataabf3N3u0FxXqaR2tXywgAyhTJGR3FAFkxYz2EXw8mvwpThls79zxJ+z7pEgucD4rKh9NjeMQmmzRLPSYLRKsKCykHF0arSDgZQidT8wsP0qLM5q9XZ3Y2WlKmgZYN+T2zBkouq5bE/s7rc0VsrXL6X4qLbcRj2fXpMAqVYqLzdlNJUnV1ndIBiCxaBtUJQaJYILt4r6ZHeJzLa8OlYogBZUN2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnEd2yMZ5AnoFa68HBaM3T+RM+/Acea2LersiebntJ4=;
 b=ReLP1JBwqdQw2nxwGLf/Kr2KiVS0DmShKLOwxBI0U9vibKD1wISbSdwAPdHlpoNuD4AI3P65jdfyUJyPzAEamJiRGVwj6lVJKjqOZoQ6FWlDxA9cJVxJuAxl04CECE1kRgctcLf4C3SOmKfi7qddAOuNBOkpaPkjeYtQhEOrfGBcSuHts+O4YrYbzkp9YqF+pcCcyZpepMAF2s28MPo1zgy1oOJ3UX4cC7MT9+zs2J2JW7utjVOmOHi64qeaUGC+MjGwLvOoqf+O9ulOvvNpDHYLJ97J/uNd0ZnM56ekjpAnewY1GEwnNo5jsUCA17/Hb7HNxu4DGTiraRvx1w+uqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnEd2yMZ5AnoFa68HBaM3T+RM+/Acea2LersiebntJ4=;
 b=8cQVQaiYCS9I7zmBxFhCfyEN/Ey+EuH9yOC/lfCbdHw2s+FOEZDQaMbqC0GaIRFloIc7Zj7y7b9p3NbqOQ2zDZp/pYzXqYTyHXjJHKWow1qozIBHmVCoBIloir67vXqwjmR5AbT5AXskwXuN/hh1PifCRBRTff3gMmOEBn2b4jU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10458.eurprd08.prod.outlook.com (2603:10a6:800:201::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Thu, 28 Mar
 2024 14:02:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 14:02:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Mikko Rapeli <mikko.rapeli@linaro.org>, Jon Mason <Jon.Mason@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH v2] arm/trusted-firmware-rmm: Add bitbake,
 include and patch file for RMM
Thread-Topic: [meta-arm] [PATCH v2] arm/trusted-firmware-rmm: Add bitbake,
 include and patch file for RMM
Thread-Index: AQHaf7sDSdNC+CzmRk6maLephsz8+bFLjzYAgAAKbYCAABeEgIAAAe8AgAF+bgA=
Date: Thu, 28 Mar 2024 14:02:05 +0000
Message-ID: <856C0ACD-0A2E-4C9B-9818-7FD4BD02484E@arm.com>
References: <20240326202001.1075940-1-mathieu.poirier@linaro.org>
 <86E1B306-3BC6-45B7-821B-D24DA64F42B5@arm.com> <ZgQiK6tpa8RdI_cy@nuoska>
 <2D90A79C-0BA3-453F-928D-8D132515F474@arm.com>
 <CANLsYkyNAaJO_RR6tt278mAktQ2gTbMRXT2++GLrugq501f8dQ@mail.gmail.com>
In-Reply-To: 
 <CANLsYkyNAaJO_RR6tt278mAktQ2gTbMRXT2++GLrugq501f8dQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10458:EE_|AMS0EPF000001AE:EE_|AM8PR08MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ba2abe-6fa2-4c3a-3e0f-08dc4f2fad38
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VdpQJcyJJi+nvVmyLr2lErd8IH4PM90hud9yvKuvh6NokS3EgeVcANdNrB5l8W0Lr0vSqKNaRLBI8YCqrRVTPZx61vgEQgkVICYtjGSk4Zpfd6uZvp4/24bCjkL+KY2oBxgIpLHV0LbK45VgbqrQsSqsyPpTMoi+KxoAsVqpduplqVFx31+3e+FyhJeLEpjS9TzRp4iTvFiKedEbzV8ND4mG+knYbdp06csKzjOZmNCCaAka8pKR3/AaPjOTF9hQay32BwftBe2/KFc0QySST8HQMCywDkVbU/kaMs8XKG9lW3FEVYVpsX/J0xWpa2A5AtPaAghobGlULYu/YpeqRiNwMDafc8urdDR4nFQaejYS+iGeFmzZ+GLC1FfePb2GfJvdKq/Td7YcO7+LFYlzkD4etzOk7AUzoN/bS6VKD64yh4S4tAu5g0PNyTNtqnvmm3E49Xgp3a7+GIqAOsjXm/gA4cvd8ZQ2Ave1R1AmqcwMaWZxawqGmoYAApR401UJEjAvJ2umDt2C2cGH69rLlZNoiU7FIg0uL5gzTjydTYzdzJlq5FRkYEUDAt6tx/LrjkHcM8w3K9Vn8oRySOOvLEPgdGb2gdJWthqYKh+zsZ/sswJ1Dgw9O4bk1zh48rfmgFfM45WEUUIw9TBsQc7S3OPa/9vb5iTprJ5RajE9mVLDfLF3GQGOg6CEAoCBhxfABTS2+6+GO+rCuQpn81mlshYPYatX8ij/9xt75AVXNZE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B29A95E0BDF8B24F9E9A5C0E67C54945@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a5c61440-70cc-421d-e203-08dc4f2fa63f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	of+taUNQNkdQ90AiJUUYxC+PjPf3a/omRPcMdXncgJIHKuvCQHYU+JvwVC/SX5MDUWyTCQUyu64f9NdoVwOacheTbwC5oZCYdNtZaXqKoPxdkfTLw3PZvh8kkmHc594ynXeE3nB819perq3bMQqIGQ6T2yIumLbhFfSIV+WTy7MS7jJWbsIvSkAYtx+MMCg0jFHdiIynLC+7No7yhnXZFGD6tzupWIMUfIDYCHyFEEKM5ygXoPIEElGnzI3tgHgrYMHdpaJ+2eQXqHEL3wP+mnoeCoWmu9jGxnNrszPCj6Ry99bYgCo6ACPLyBhDg+Lf2uWa5DJBN/dptem2+lu82QR01ybDlnKv0jyLZ+DcP/UixuijTsPzBzV7c0vcDDUWB2ksrmbX8jVFr32Sr4HIZEyZLeSKgFypUzuz+wuM1TLXMj+GzjE2jLRN/V83chkWo3X7qQ1yVcydy76Ygw6CiGI6c4U5ke+CsVLYUClCZc/4YGObHqX3jmz73MBDZTUyIZPaDiPe+YP22UzJ6Abpeokeb3DIoB7MZr24y+/+FhcpJ6tZS6KQwON/mVSFoT9n1CQ38+rrpyqdIhTRvNVn4TlNIUEPmF8bSoZ+dXlPoPfXccvrpxPw7TW59S24LHjIrkW/IH8rEMKpB4gmGs5lydbL/L7rYXiOVVc2PM43nz0hXyjb71vNUL72RHhDK2lqPCCC61yekwl2QyVIjzgaE28MFuNdb1uL8F4xjGd97KHAJSi/0VaN5CItcCfbCDCU
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 14:02:16.7500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ba2abe-6fa2-4c3a-3e0f-08dc4f2fad38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6339
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 14:02:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5499

T24gMjcgTWFyIDIwMjQsIGF0IDE1OjEzLCBNYXRoaWV1IFBvaXJpZXIgPG1hdGhpZXUucG9pcmll
ckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+IE1heWJlIGluIHRoaXMgY2FzZSB0aGUgc29sdXRpb24g
aXMgdG8gbm90IGluaGVyaXQgY21ha2UgYW5kIHJlaW52ZW50IHRoZSB3aGVlbDogdGhlIGNsYXNz
IHdpbGwgYmUgZG9pbmcgYSBsb3Qgb2YgdGhpbmdzLCBidXQgbW9zdCBvZiB0aGVtIGFyZSBiZWlu
ZyBpZ25vcmVkLg0KPj4gDQo+IA0KPiBNYXkgSSBhc2sgeW91IHRvIGJlIG1vcmUgcHJlY2lzZSBv
biB3aGF0IHlvdSdyZSBleHBlY3RpbmcgaGVyZT8NCj4gT3RoZXJ3aXNlIEkgZmVhciBteSBuZXh0
IHJldmlzaW9uIHdpbGwgY29tcGxldGVseSBtaXNzIHRoZSBtYXJrLg0KDQpXaXRob3V0IHdyaXRp
bmcgdGhlIHJlY2lwZSB0d2ljZSBpdOKAmXMgaGFyZCB0byBnYXVnZSBleGFjdGx5IHRoZSByaWdo
dCB0aGluZyB0byBkby4gQnV0IGVzc2VudGlhbGx5IHRoZSBjbWFrZSBjbGFzcyBpcyB2ZXJ5IHVz
ZWZ1bCBmb3Ig4oCcbm9ybWFs4oCdIHJlY2lwZXMgYnV0IHRoaXMgaXNu4oCZdCBhIG5vcm1hbCBy
ZWNpcGUsIHNvIHRoZSBjbGFzcyBicmluZ3MgbG90cyBvZiBmZWF0dXJlcyB0aGF0IHRoZSByZWNp
cGUgZG9lc27igJl0IHVzZSwgYW5kIG90aGVycyB0aGF0IHRoZSByZWNpcGUgbmVlZHMgdG8gcmVw
bGFjZSBhbnl3YXkuICBJ4oCZbSB3b25kZXJpbmcgd2hldGhlciB0aGUgY29udmVuaWVuY2Ugb2Yg
dXNpbmcgdGhlIGNsYXNzIGlzIG91dHdlaWdoZWQgYnkgaGF2aW5nIHRvIGZpZ2h0IGl0IHRvIGRv
IHdoYXQgdGhlIHJlY2lwZSB3YW50cy4NCg0KVW50aWwgVEYtKiBoYXZlIGEgc3RhbmRhcmRpc2Vk
IHdheSBvZiBidWlsZGluZyB0aGF0IGlzIGZyaWVuZGx5IHdpdGggc3RhbmRhcmQgQ01ha2UgdG9v
bGNoYWluIGZpbGVzLCBlYWNoIG9mIHRoZXNlIHJlY2lwZXMgbWF5IHdlbGwgaGF2ZSB0byBpbXBs
ZW1lbnQgdGhlIGNtYWtlIGdsdWUgdGhlbXNlbHZlcy4NCg0KVGhlIHJlY2lwZSBfYXBwZWFyc18g
dG8gbW9zdGx5IHdvcmsgd2l0aCB0aGUgY2xhc3MgKHdoaWNoIGlzIGJldHRlciB0aGFuIHNvbWUg
b3RoZXIgcGllY2VzIG9mIGZpcm13YXJlKSwgYWx0aG91Z2ggSeKAmW0gc3RpbGwgc3VycHJpc2Vk
IHlvdSBuZWVkIHRvIHBhc3MgaW5jbHVkZSBwYXRocyBleHBsaWNpdGx5LiAgIFlvdeKAmWxsIGxp
a2VseSBuZWVkIHRvIGtlZXAgdGhlIENST1NTX0NPTVBJTEUgYXNzaWdubWVudCAocGxlYXNlIGFk
ZCBhIGNvbW1lbnQgZXhwbGFpbmluZyB0aGF0IHRoZSBwYWNrYWdlIGlnbm9yZXMgdGhlIHRvb2xj
aGFpbikgYnV0IENNQUtFX0JVSUxEX1BBUkFMTEVMX0xFVkVMIHNob3VsZCBiZSBhYmxlIHRvIGJl
IHJlbW92ZWQuDQoNClJvc3M=

