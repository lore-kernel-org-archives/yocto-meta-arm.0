Return-Path: <adam.johnston@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BEFC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 08:03:48 +0000 (UTC)
Received: from outbound.mail.protection.outlook.com (outbound.mail.protection.outlook.com [40.107.105.54])
 by mx.groups.io with SMTP id smtpd.web10.2669.1690445026653835397
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jul 2023 01:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iKAiE7Ep;
 spf=pass (domain: arm.com, ip: 40.107.105.54, mailfrom: adam.johnston@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i11KCUagOClofKc0FBaSKOFIfmdLF0L5449ezGoT3ZN8QaPNe+0cSiyqxTv7tKieq1HPV0gJyXY9QLpSpUslqtKmf7KCW2OLUvUL+m3Z20W7P+PwD59rJIiS40PM81t2w2sYMOgGr844y94OFM3Nh4wnSSWM3p/vDgnWgIyKHRgAxKEJxrd7eTTuaaBg0CCCE9pLDPjslExdiU7810OC6b7Zo+/RTVxbYn4rgHFsg2KQKjgvUpBxOqvz4LF66+mUpbp+GEGCPEyPkDdicrgFAHsRFsvrhNrtIWv8qNWGk0Yo6qMIxt7yDic1un7vc8W5VHi2xSitf5d0tzw4CjvRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0FGqJhLNBAHzNMd/2LY2LSSCG4N5E+A0gipRplLB7s=;
 b=mAAMVW9M5T1AMkqgL2E5nGSwgt6rL2ZWSY3T1qmw4/1OVjbOZAEl0QfPmY62gmxZDhvu4uej5lJlv73ivclqw/L/T2dawUnikXA9tzgvmlpPUDBfu+K+UMtnJgEWPsHHuikzm+pJQchzQ+DXNo92BCcBCJ9SvjOQRZlkuOe51ThdrBLQM7vJoQWShonGtHgz/Vo2Rfa5bYQyzeIrohuYvdQCG7L5mYmm2ORVeZ5vnFOQRf+FmSuIMs31WheODQzSXJhF1+mqDNvXXPo+6nRyAIp9IJ9erC701ztdWFneTn5Gv9n66/ps3F0RrCoKuYIZSanMBo/FRTxDeUL76s0ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0FGqJhLNBAHzNMd/2LY2LSSCG4N5E+A0gipRplLB7s=;
 b=iKAiE7EphEg4o/jqqAk6CRAagkacY3qGa7hn0Zh9WnwpOVZkpesbD4z0U718HwysYItWh3iOnwTlIW/bFVJzSftvdHItWt3gvexFy3hHkqctO+Mjsy1SGkoyS+Yg0pa+rzLqfM89mcnxLWsc4lw5JD8idP2G2kI7REcr/eMUqHU=
Received: from AS8PR08MB10271.eurprd08.prod.outlook.com (2603:10a6:20b:629::7)
 by AS8PR08MB6341.eurprd08.prod.outlook.com (2603:10a6:20b:33f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:03:42 +0000
Received: from AS8PR08MB10271.eurprd08.prod.outlook.com
 ([fe80::e4ee:eca5:d8b:c69d]) by AS8PR08MB10271.eurprd08.prod.outlook.com
 ([fe80::e4ee:eca5:d8b:c69d%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:03:42 +0000
From: Adam Johnston <Adam.Johnston@arm.com>
To: Jon Mason <jdmason@kudzu.us>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Ross Burton <Ross.Burton@arm.com>
CC: nd <nd@arm.com>
Subject: RE: [PATCH 0/1] arm-bsp/trusted-firmware-a: Reserve OP-TEE memory
 from NWd on N1SDP
Thread-Topic: [PATCH 0/1] arm-bsp/trusted-firmware-a: Reserve OP-TEE memory
 from NWd on N1SDP
Thread-Index: AQHZv9RWwrljaJtzDUqHTuJLyz4muq/M9V6AgABMWQA=
Date: Thu, 27 Jul 2023 08:03:41 +0000
Message-ID: 
 <AS8PR08MB102713B2B194EB55718D41789E901A@AS8PR08MB10271.eurprd08.prod.outlook.com>
References: <20230726151725.1231013-1-adam.johnston@arm.com>
 <169042855629.3962951.10854273531700490599.b4-ty@arm.com>
In-Reply-To: <169042855629.3962951.10854273531700490599.b4-ty@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 76214D4684E8C244B35EA6CE34F5F760.1
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB10271:EE_|AS8PR08MB6341:EE_
x-ms-office365-filtering-correlation-id: 26a1552d-a299-4ac3-d029-08db8e77fe2d
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iOGSFdJJzlbI1FlZu8Hfv9h1VBNX4PPbIs3o+JrDweOjOzSxOU1fkA9cYlYeQkItR/worSGTxYKB5XOJBCr0gva3CB1nzbE1Y6GW38PFwAXoJ091Kht3X6H6aIFKIJEZhP4g2pdTZ2QsS74hNOMMD8M6aR9DNAuokyT/+N2vGhrxvD7la/hyywmXAjaRn4AzmRZbbc7W3cpGOp2AVwQSmQtKMdX7OlTEX2k1g9EFklfjcjUNAqEd+gSdghOwVCcILDAYr++BAINXEx55LTwihpTWYCu/uNz6p5l8TaWUF5vfJe/jUIoBRz8fPMtJsP8OOqXvYS/sXvK8ev+RxpplK5aOFT/LS/M/f5VjVgnnYHTjLaQkAqQOV/h++zDOHAx9uxEMHOS6KhVYjKZt/Dj/X+yLI2XdYggti2vG4dlcOOSDK6mAuFbb3a0r4YqzVdIUV3erQ3LbpkQ6vEZRnwrOYzJPgzh2yMNxNB/sHUlAGylRXFisACVhF5BeawAdqZz6oT3zrEe79RiK0u2wj3TO9oe/ysHZ5gexnt808xNPd1LUKSsoL3yrLlRSfRz5Lo9xOPiPpQwTXsiV2obFCoN2BSs2+T30qGz+cf7HHwSeGC8AHWjK/6sLtp1zDwLb7mPnsYCrHbyrZAJscsn+I9SfeA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB10271.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(83380400001)(38070700005)(66946007)(86362001)(55016003)(38100700002)(122000001)(66446008)(5660300002)(52536014)(8676002)(316002)(41300700001)(6636002)(64756008)(4326008)(66476007)(66556008)(8936002)(7696005)(9686003)(71200400001)(6506007)(76116006)(53546011)(186003)(26005)(478600001)(110136005)(33656002)(2906002)(4744005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S2NJaGI0S0FnanVTcjQ0d0NWUERwMnA0YnFBa3FWU296c3IyTUNkZHpDYjky?=
 =?utf-8?B?cTZMcVhOUW5zTXZ1bVBTTnl4cWw1V1ljdkgzRDBsZFJyclkyMzlOKzZxaDM0?=
 =?utf-8?B?M2ZlVGgvTTkyd3RQd3ppVWorMG5pdnFLTHN2VUQ2TGxxdHNnWEhqNDBkbno0?=
 =?utf-8?B?Tm9VclRqUGV1clk1czQ1bXM5SXpxUndNSTRtU1UxUVA3elg2dnJrS3B4dlZP?=
 =?utf-8?B?djl6RmJicmxaN3U3QVhGN1ZiSUhYcmtYbnQ2VnBnVU8rNXg1bmt4c29YMEZC?=
 =?utf-8?B?RVorWS9lU2FPM3JsbGVrYjVkdVphSGFrN0pzOStDTFh1WnJjNWJ2UCtXZlVB?=
 =?utf-8?B?OFA3eXphcHVYUkFvVWZ4Q0hUMHdHTDhRRDhEbHlpd00zdUJFSlg0NW5PRFdR?=
 =?utf-8?B?TnVYMEJvaVd4ZEdsUFl1Qnd3MEV3bE9VSkdvclFVaTlOQitNb3pQQ0NEajIr?=
 =?utf-8?B?dkkrdFJMWENDZks4eDBJUWRJYk5OeDlNYXU0V1JvQzB3OUN5UlMyNXRoRURH?=
 =?utf-8?B?cU5QYmU1STlLcGJoM3dqRTRiTmFQZnVhdnhsWmF4UlptRDJBam15U2Y2aHJH?=
 =?utf-8?B?endSOS9udC96bU1HdG5tcVFLSGR6Y05UOHM0MzVDVmtHRGIxbEg2OVppRE40?=
 =?utf-8?B?WEl2QzhySUJRazJlWnFqZ1lyb09IMFZaZURHZTlaWnBLTVViMkFyci9KWEtN?=
 =?utf-8?B?ajEvMS9YbHpiQjd2UUo4OWdhNldOUzVvKzh4WUw1TFEveXl0bllEU1l1eEFR?=
 =?utf-8?B?R1RPRlZIcHpOUUxEMVhhQVBZUEJaaG1XK2w3OUZwaWJvNGZhMkFXc3B6aS9n?=
 =?utf-8?B?UldnOHUrTFduMTdFd2UrdDl6bFozS3lDUU5UcUFYNWVnR2wxaVY3NkFteVAy?=
 =?utf-8?B?bE5pYSt6Y3YwUFBqc1V6UWd1QjZnQy91RHl4b0lJc1NFMWUxajEwTjJEemc2?=
 =?utf-8?B?MVZGREZxaWtXQ1Jwb0pWRHFWVWRzUS96eFBHdmRqdWVtbVZUakFCSEk3ZnBM?=
 =?utf-8?B?NHdpby8vODc1eGZObWdXM3YrOTVjQmtVanhMeGdxMFp4ZDNMSUVvOCtmY1JW?=
 =?utf-8?B?ZlpyTnNyaVk1V2VlcUhFOUV6T0JQeEl2amhndUpxN3ZYWjNhK2xRL3ptVzBT?=
 =?utf-8?B?UnFkbHFuS2pGeUU5RXJlY1BRazl6MU1RY3BoQ0dHdkFocFBjWUQ3cTQzb3d4?=
 =?utf-8?B?NWJPdkllWE8reGI2VXJhME5EdjNzYUxKa3lHbkZ4dDJiS2JYVWJadGoyTWQy?=
 =?utf-8?B?OXh6U2YzM2czZlpVSjhDdVhTWEloZjRtRUowZmY0Yi9vcFptUHBSUmF2Z280?=
 =?utf-8?B?MUE4QThITFp5TytDWjNWYUdZanlSOHZONitGTUFjR0VVckJrZzNYbVhYSmht?=
 =?utf-8?B?NklqNUl1N0g3RW5wYWlDdHhmYzJEV1U5dndYUFBrK2dPeEcxMWM2OXN0N3U3?=
 =?utf-8?B?UllzWWxPbHIwbThVOHBEVWIzT295MzlvT2ZhL3BINWJiYXRnSEp1aDQySEdK?=
 =?utf-8?B?OXhjQ0psL1pUUXNBeWhZR3lyYlIxOHpyZ0NoWUhpTDBwaXgwdkNkaXBDNjdQ?=
 =?utf-8?B?YzBZcldwVjdSVUNIN1FKZ2xFdlBpazNNckE5S2VsWDhPWVl2ZUpGblpod3pJ?=
 =?utf-8?B?SlpCZjhsN3Izb3pKcTFuS3pqeUc1NzJvYnF0NThZcnc5dUx3RmpISmxROWhz?=
 =?utf-8?B?QklMaU5DMGZGbkdXcEswV1VscDNhN25qaDZiOHZWc0FQSXRkcnJrVmVCVms0?=
 =?utf-8?B?MUZUbEk4T3htTTlCYWdBdE5kWkFIdUtwRmJNSnJXbE9PY0NKSlV0SXlVQ0hD?=
 =?utf-8?B?VUxQLzlDcW40REpzUWN3RXBod0lPcjdiV3hvdzI5Zyt5UjlUOXhwS2grQXlT?=
 =?utf-8?B?MmJXV3Y0N0NTMzFFNzVCY1hWdVpOLytleFg4eU44RHQ1R2toZldRSi9jYlRJ?=
 =?utf-8?B?c0lGbU52bkhRUzZIVWd6TGpuQStJV0xkZ1IwU2ZqTjlmUkVGK1lQODVtQnFl?=
 =?utf-8?B?VmZKNHV2UUJhRkZhd09BMnVtMkdOTFpLY0U3YUorMWxLUndSb1AwSlJSUUNh?=
 =?utf-8?B?NktELzE2NDM5UElrYTBaR002MjNlVmtTekRsNGlROUJ1YXdUUVdieW5LaUhF?=
 =?utf-8?Q?4QvZ+Rv9nh+qxWkMdHsLSOe7T?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB10271.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a1552d-a299-4ac3-d029-08db8e77fe2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 08:03:41.9488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9bwv55kIZ2ByzoCKdt1bS1fm3WghQeBKepFCoOiR5Mte31/JLys7VNn6Cxe34LJwmoTaQyDxH/PTU1CyMCpCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6341
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jul 2023 08:03:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4927

Q2FuIHRoaXMgZml4IGJlIGJhY2twb3J0ZWQgdG8gbWlja2xlZG9yZSBwbGVhc2U/DQoNClRoYW5r
cyBhbmQgUmVnYXJkcw0KDQpBZGFtDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBKb24gTWFzb24gPGpkbWFzb25Aa3VkenUudXM+IA0KU2VudDogVGh1cnNkYXksIEp1bHkgMjcs
IDIwMjMgNDoyOSBBTQ0KVG86IG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IFJvc3Mg
QnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPjsgQWRhbSBKb2huc3RvbiA8QWRhbS5Kb2huc3Rv
bkBhcm0uY29tPg0KQ2M6IG5kIDxuZEBhcm0uY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSCAwLzFd
IGFybS1ic3AvdHJ1c3RlZC1maXJtd2FyZS1hOiBSZXNlcnZlIE9QLVRFRSBtZW1vcnkgZnJvbSBO
V2Qgb24gTjFTRFANCg0KDQpPbiBXZWQsIDI2IEp1bCAyMDIzIDE2OjE3OjI0ICswMTAwLCBhZGFt
LmpvaG5zdG9uQGFybS5jb20gd3JvdGU6DQo+IEZyb206IEFkYW0gSm9obnN0b24gPGFkYW0uam9o
bnN0b25AYXJtLmNvbT4NCj4gDQo+IFRoZSBwaHlzaWNhbCBtZW1vcnkgd2hpY2ggaXMgdXNlZCB0
byBydW4gT1AtVEVFIG9uIHRoZSBOMVNEUCBpcyBrbm93biANCj4gdG8gdGhlIHNlY3VyZSB3b3Js
ZCB2aWEgVE9TX0ZXX0NPTkZJRywgYnV0IGl0IG1heSBub3QgYmUga25vd24gdG8gdGhlIA0KPiBu
b3JtYWwgd29ybGQuDQo+IA0KPiBBcyBhIHByZWNhdXRpb24sIGV4cGxpY2l0bHkgcmVzZXJ2ZSB0
aGlzIG1lbW9yeSB2aWEgTlRfRldfQ09ORklHIHRvIA0KPiBwcmV2ZW50IHRoZSBub3JtYWwgd29y
bGQgZnJvbSB1c2luZyBpdC4gVGhpcyBpcyBub3QgcmVxdWlyZWQgb24gbW9zdCANCj4gcGxhdGZv
cm1zIGFzIHRoZSBUcnVzdGVkIE9TIGlzIHJ1biBmcm9tIHNlY3VyZSBSQU0uDQo+IA0KPiBbLi4u
XQ0KDQpBcHBsaWVkLCB0aGFua3MhDQoNClsxLzFdIGFybS1ic3AvdHJ1c3RlZC1maXJtd2FyZS1h
OiBSZXNlcnZlIE9QLVRFRSBtZW1vcnkgZnJvbSBOV2Qgb24gTjFTRFANCiAgICAgIGNvbW1pdDog
MzA4ZTVkNzE0NWYyYTEyOTUyODNkYjQ0NTk3MGRkMTgxZWNkNjdiMw0KDQpCZXN0IHJlZ2FyZHMs
DQotLQ0KSm9uIE1hc29uIDxqb24ubWFzb25AYXJtLmNvbT4NCg==

