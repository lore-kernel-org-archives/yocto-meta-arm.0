Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D542ACD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:46:39 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.80])
 by mx.groups.io with SMTP id smtpd.web10.41.1712756798524098893
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 06:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aRjKm6p2;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aRjKm6p2;
 spf=pass (domain: arm.com, ip: 40.107.8.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JqAvTHP1TKuGt1NVVyTGtH/OjzSJ5CVX8R+ByI357NkinEJTfZeMvLljXik2unktyuldZiJPvRXQC64ohUe9AXZGC6N3T6oPrteXsOdNdKRqXEaCaih5CESGFCmA/ZwpLI5hcy8AzP5xRJzGNrKggIV5v0e1qyjDSau7aZIgRdMHEHGyZzzEIKBJYLAXr+ovm1LpYSwGqD92bBOqEjq7Wuz+vBRBahdcWxVVebnPInVaW94ysCo8QAikchkiYoP+ZUTiEFfxLTHFw5wlXni//URZPypVgbk4a6XmVpwHMX/YIXuU11fcXGofJWhiD+BLgJLdKQ/f9dUl+UoBnFvNEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGaZMyqTfG+G0G/XAkLtH5wku0FKVx0/Gh/qHDYyQDQ=;
 b=KjngQQD+T5aTytizfpdxdqcgdTjr4wSn3jWmWM7BCGWyMULo9U6cfX12BFZVcmeOL+e+O1qGtvhHo+9KiksCCrPeW5Daq6XDS0Yd+N2WJgBZbvoh7ns3figJuQMCNAHCgrggjhnOc5sXx9HKzvSwZax2Ebxjqv2gBT1wVO99N5fcZkUZAHyrT5YTTRqh5NlLhZsNo/Sbz2rw90sa0UPBDHfMGPhjw5iZPRZdhtrvw0tbUofcLNsWsXMnSP0Co2wJVN+RfRGzBCs4Ht5UGIplpkbDuB3ESdQpMlTEolgaa88BtMwVMOKjdR+2O14OJwmy+IlImePT81RD8lMrVWWktA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGaZMyqTfG+G0G/XAkLtH5wku0FKVx0/Gh/qHDYyQDQ=;
 b=aRjKm6p2s5/xyMoYCGzNjVgAuW9Z5g67hQyhUHKK+hKe8ks3SjVomXtZq+Rzu8x6fc5ZoIv3Uei6vCa1VJFh30hre/9dP7o93evOF59JqE8m4/6JNdwVKj96vBr953XJsEj5AOCTToHCdwn65gMTngdU6HjKqHBnqatf5jF3PBw=
Received: from AS9PR05CA0237.eurprd05.prod.outlook.com (2603:10a6:20b:494::30)
 by PA4PR08MB7524.eurprd08.prod.outlook.com (2603:10a6:102:26d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 13:46:34 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:494:cafe::8) by AS9PR05CA0237.outlook.office365.com
 (2603:10a6:20b:494::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 13:46:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 13:46:33 +0000
Received: ("Tessian outbound f0b355493f75:v300"); Wed, 10 Apr 2024 13:46:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f10f369fc1e495cb
X-CR-MTA-TID: 64aa7808
Received: from 626a6b994827.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 248B39C3-84AA-4B5D-8CE2-787E678D5B6C.1;
	Wed, 10 Apr 2024 13:36:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 626a6b994827.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 Apr 2024 13:36:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbIyqFpmX77uEfUbEgwfvi5RiDhToiiW8z2eLiCWoPoFSapcWAXs/w2zH3PuDXxX5IsiBn5IeytKVGmPJf1GvpXH5FEL1BEGgAXwn/4E3JP4tU3dhaXkm7tRLi4mFKg0rUgsQWGk7dACHSm2KodJHd8PJ04t1n7IDY2+m0BV57/uVBBYOySOSmpqrQ1TuC4y9uArKGtrWf50k41BIQzyw2ZVS1Vk38yYlIKp5rpUKd9XrMbGGmZ0RlB4PdMEoT7tMKF2IlDI/Qti19kj9+IdmCHcis9bp6ohhZZL09BECdfvqLNqBw5L255h5uErCeHPDSwdQRizh3z7ME7/y4ub1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGaZMyqTfG+G0G/XAkLtH5wku0FKVx0/Gh/qHDYyQDQ=;
 b=jo52/swVXKUoTZksaHdTS/GY/X2wZCQoU6ZKxhp91OGIQavUDQ7cp+4fZLWAesuB0MVGDCEf7p7jTFNYHj+++CivLZSin6s5WHP7S9t2tVa1glqsI9U3NlrmQV4gdqx6qlOcgYNtGOB2Vq71M2t49l2tzTA5p52A0qkT48V+lrOCgchGUQzpXanyVP2y7p22QQnbQb+087WPVFqH/yb3zoytYQy7sPbzVRKcF/+HHhYRTWKFNUh9gT5+GS5o/nXdbjRRqxH3ny0393e/oVXNAWGW0POYsEWreNnCFVeMR5kGbI8pQRb8Oh7JaOEiE8ck3y7O//O90dg9vIXcB89gDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGaZMyqTfG+G0G/XAkLtH5wku0FKVx0/Gh/qHDYyQDQ=;
 b=aRjKm6p2s5/xyMoYCGzNjVgAuW9Z5g67hQyhUHKK+hKe8ks3SjVomXtZq+Rzu8x6fc5ZoIv3Uei6vCa1VJFh30hre/9dP7o93evOF59JqE8m4/6JNdwVKj96vBr953XJsEj5AOCTToHCdwn65gMTngdU6HjKqHBnqatf5jF3PBw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9379.eurprd08.prod.outlook.com (2603:10a6:102:300::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 13:36:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 13:36:08 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tom.hochstein@nxp.com" <tom.hochstein@nxp.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm/patrace: Add new package
Thread-Topic: [meta-arm] [PATCH] arm/patrace: Add new package
Thread-Index: AQHaheWEx43UFiYRhUCoLGSOFi7A2bFhjD8A
Date: Wed, 10 Apr 2024 13:36:08 +0000
Message-ID: <B3D7C5E1-36C9-432B-9AED-05E4E3AC90C6@arm.com>
References: <20240403163814.1978415-1-tom.hochstein@nxp.com>
In-Reply-To: <20240403163814.1978415-1-tom.hochstein@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9379:EE_|AM4PEPF00027A60:EE_|PA4PR08MB7524:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 idYvsQAxK/W5JA9f0u4R7qJwlM5hE/c9IJ5fSH1ogEB5FXPaaRmh7LHtk9E4zAxo+UzJmMeDZ9CMz1qFNLDnrAlMhTQv3+qjzkPbTdL7O+V9Q81D405SFsP7e+dY1GP28DSZFwnQ0MWVKDV7OObd2vhhR+zc9B3HE6xSX3EJxGNBPPaZci8QgiiLCwuihn4KSUhyKc78KscMeLiYvNYrC92TaTC8ucL0z5kvd70LsIP+ug5Tn6I7iwEat5iZEF1cXaCPfBZUqyvQtRS6JY99NN5uIIkb0uLToutI7tQxW0bju/4HNNOKvgr+GAh5z3SDDXzSJe8UAbAS/3dUzVXc9rP7hnJ0fVIkb7pDpCTrZ38wBAzgs6JU+jkaqTNrAdMeLIKOHKzd+4X6K5R9+R0uDSkk1eVlwEpfll+QxhJfvriS8XJkmHjRVI7KpD9rNjC731l+7d50YUgTWU9XrHOEI8OCHkolilvdhsSkZVifBvN8Og5nNdPzYU1cZYMDa04T/sN+Gn4Q9fXBaQBELbwRdkpbPt2SEqEDqubMm6hvJARgE+5qmAOOiWJQ9Rhj0wMxS/snBQ0Xifkxqzeov8LG6N791z5D2n6krdYq3u8OzHwRUMmqr+pAVN4NRHphbXeESxXojbzmOwcGFSN5ER/BLTsLcRKFcTToMFqVw/1MzZc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E093049CEF5D646B397D7D7D21595F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9379
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa9dfcd2-c7b4-4462-66dc-08dc5964a26b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P1PlpkfvqzuGxDR/fAEV+Lzt3Mbbdlr/O7cH2LbtEbBa4bP26f760nVZ+sAmw4nR4dDvb2gzkhq5oIJGl3OeQhWVbvzXI80P7+kWK8/dbJOASAGY84pw5N5Sdt/QXlgGlS/RRqQN3FvIr96ymi8+QIC7GeNkzWBLHT4ErU59xMZt53uj8U8EO4OtparSL50cJ+M8BdnCr3iA2JLaAzEsa2piy/VCRoy2x4gOPQqdH/STX2soLdLKw12pbR8flF6VGQZUGXRjIY4Mgo8S9Q6pFGI/ucJe/V7MgxI/k4N4n6W2BLJCk4OVthcqmMR75WWnJn6s2zXaJNCzvRLkJ9sSUvljBhXqgD/zsIMKSIFTcleKe7rtQJgU17am8XyOosCnDyb38sp9MUEDS0Xs6sDx9Z/Q86J4/VS115eVuIP0480pZVioEEwvI+KT/UroRudPXUeRzOpTKpHGlg2SPm1up+0dawB0XTNL15rMB2zqUQLfq/MszKiEC/XIndaeph2w+WuVAKObRT9244F5FhDi7ySA7uzvHBibW8zMJCwTLB2nsAs7BgNuHkgc4qMeMMrvOsaysDSN7YaVp0VqaY2MwXgSE+t3GKYrJKRR5Kq8JbrFHj6FuaKU4Y+FbJuaMM4e8xb4baAI7kPE+8kNeAZa+6VtzkDL39UuidZCyYiIrZM7zsTZKnPCWKTRb9+Q8zEOD77pxPZYc35m++jnZ+0iH5Wb5UmypTVhuPNwC+EdzIoYL3BSew8mwEzCASiNwZQs
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 13:46:33.5692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9dfcd2-c7b4-4462-66dc-08dc5964a26b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7524
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Apr 2024 13:46:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5513

T24gMyBBcHIgMjAyNCwgYXQgMTc6MzgsIFRvbSBIb2Noc3RlaW4gdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPHRvbS5ob2Noc3RlaW49bnhwLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3
cm90ZToNCj4gKysrIGIvbWV0YS1hcm0vcmVjaXBlcy1kZXZ0b29scy9wYXRyYWNlL3BhdHJhY2Vf
NS4xLjAuYmINCj4gQEAgLTAsMCArMSwzNiBAQA0KPiArU1VNTUFSWSA9ICJTb2Z0d2FyZSBmb3Ig
Y2FwdHVyaW5nIEdMRVMgY2FsbHMgb2YgYW4gYXBwbGljYXRpb24iDQo+ICtERVNDUklQVElPTiA9
ICJcDQo+ICtQQVRyYWNlIGlzIHNvZnR3YXJlIGZvciBjYXB0dXJpbmcgR0xFUyBjYWxscyBvZiBh
biBhcHBsaWNhdGlvbiBhbmQgXA0KPiArcmVwbGF5aW5nIHRoZW0gb24gYSBkaWZmZXJlbnQgZGV2
aWNlLCBrZWVwaW5nIHRoZSBHUFUgd29ya2xvYWQgdGhlIFwNCj4gK3NhbWUuIEl0J3Mgc2ltaWxh
ciB0byB0aGUgb3BlbiBzb3VyY2UgQXBpdHJhY2UgcHJvamVjdCwgYnV0IG9wdGltaXNlZCBcDQo+
ICtmb3IgcGVyZm9ybWFuY2UgbWVhc3VyZW1lbnRzLiINCg0KSXMgdGhpcyBhY3R1YWxseSBBcm0t
c3BlY2lmaWM/ICBJZiBpdOKAmXMgbm90IHRoZW4gaXQgZmVlbHMgbGlrZSBtZXRhLW9lIGlzIGEg
YmV0dGVyIGhvbWUgZm9yIGl0LiAgSWYgaXQgaXMsIHRoZW4gaXQgbmVlZHMgYSBDT01QQVRJQkxF
X01BQ0hJTkUgb3Igc2ltaWxhciB0byBzdG9wIGl0IGJ1aWxkaW5nIG9uIHBsYXRmb3JtcyB0aGF0
IGFyZSBub3Qgc3VwcG9ydGVkLg0KDQo+ICsgICAgLURDTUFLRV9JTlNUQUxMX1BSRUZJWDpQQVRI
PS9vcHQvJHtCUE594oCdDQoNCklzIHRoZXJlIGEgZ29vZCByZWFzb24gd2h5IHRoaXMgY2Fu4oCZ
dCBiZSBpbnN0YWxsZWQgaW50byAkcHJlZml4PyAgSWYgc28sIHRoZW4gYSBxdWljayBjb21tZW50
IHdvdWxkIGJlIGdvb2QuDQoNClJvc3MNCg0K

