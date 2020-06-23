Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.41])
 by mx.groups.io with SMTP id smtpd.web11.3076.1592902806709283577
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 02:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OtUKkOuy;
 spf=pass (domain: arm.com, ip: 40.107.13.41, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz0VJYZqoNdl2kHY+Ub8G6ANVKb9qliLldJB1Iboc0Q=;
 b=OtUKkOuyTHTy6iJcZYrLI3Cf1l+y7yJepU7eaFt9eEdYdRw1e5W3gPs82mdN0+cKDAXjgW/VrYj4w6JOrAKkz7LnG8rU7JIXmCNcFymM+Q+/my1rk3iEaxGaEocU4ZOO+cpUQ/ukeYODmwld6VI8MGfx2tuBqfrVxMO22FfJu1w=
Received: from AM6P191CA0046.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::23)
 by AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 09:00:03 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::b3) by AM6P191CA0046.outlook.office365.com
 (2603:10a6:209:7f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.25 via Frontend
 Transport; Tue, 23 Jun 2020 09:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 09:00:03 +0000
Received: ("Tessian outbound 8fb20e43acb7:v59"); Tue, 23 Jun 2020 09:00:03 +0000
X-CR-MTA-TID: 64aa7808
Received: from 0ddaa940ac27.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 14B720D5-5665-4F65-AD85-34FAD6CD9D1C.1;
	Tue, 23 Jun 2020 08:59:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ddaa940ac27.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Jun 2020 08:59:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8FSiA8znp+4TgWZJEGiuUYwLq+NP0fjnV88M+rZW3iBgdoA9siSAEExpvKaZ3iQtvj+IAhN6NejkINdI2SAZ0f00v4UA8vNVnPZr20mjBDUjeriuZ7+wqCoHel2m9z6yN9TjWzhNiEwao0QsgeKSN6J/qxYURIY3Yy4OLoK6+mgKVlZ3JHeuwZ/x11hrvBEqfqkfzvTKRFGCj24TBRZw/anwXGBTT+djxFnTO1LYI/5aQOiLUYUR+0hRmO08x+thetYJUV5eJtvBXKFpiyYyrbbTzTHxwngUfSXXfqvoZ54sja9eviAMKWzrNiNOlHreWxRatRSwiWPIDvQSJG7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz0VJYZqoNdl2kHY+Ub8G6ANVKb9qliLldJB1Iboc0Q=;
 b=fgZKQ2/YyG089iiIJ7f/NUM534aA7DluyjR84DBHpiywCQlgSwHn29wJU0vGUDbZ0e+nrPopH4kj8QJrjEbXGFuwNDPg2svShw2FcH41sRwevn9MA/zROb8XbFXwbxYgRLlFUA7rAxQ2SSMj2k+r36Wmoo161vU7QdslvjNkIDSIccY6OpSJCA4yTvJtiKwmfRNFuweT/jb0NP3QkvnXouSStNM1OYSRoQWa6Dg8hnPlHJDITBGqoTZjQqHeWC1mJym320dG2pETnw+Eizz422P14hF9OvmON1BGBZAiMAcevI7goWnS6481FypCmoDpmGnKTmX5LRKMAaR/SB6Xkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz0VJYZqoNdl2kHY+Ub8G6ANVKb9qliLldJB1Iboc0Q=;
 b=OtUKkOuyTHTy6iJcZYrLI3Cf1l+y7yJepU7eaFt9eEdYdRw1e5W3gPs82mdN0+cKDAXjgW/VrYj4w6JOrAKkz7LnG8rU7JIXmCNcFymM+Q+/my1rk3iEaxGaEocU4ZOO+cpUQ/ukeYODmwld6VI8MGfx2tuBqfrVxMO22FfJu1w=
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2447.eurprd08.prod.outlook.com
 (2603:10a6:800:af::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Tue, 23 Jun
 2020 08:59:56 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Tue, 23 Jun
 2020 08:59:56 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>, Denys Dmytriyenko
	<denis@denix.org>, Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Thread-Topic: [meta-arm] [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Thread-Index: AQHWSGTWWYMHST/aLkO9hVJaZcAaJqjk2W8AgAAKbACAAAKYgIAAB80AgAD3FBA=
Date: Tue, 23 Jun 2020 08:59:56 +0000
Message-ID: 
 <VI1PR0802MB2414E9F9AB2A65D5B27A7DE68E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
 <20200622071401.2570-5-gabor.abonyi@arm.com>
 <20200622164936.GF17660@denix.org> <20200622172654.GC14044@kudzu.us>
 <20200622173611.GG17660@denix.org>
 <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
In-Reply-To: <e4cd2080-3747-9ead-d307-6394caba82d1@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 6da6394a-ddf9-4d24-8919-164ecaaa14fd.1
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d9ca790-6b07-4c3e-5ed3-08d81753d12e
x-ms-traffictypediagnostic: VI1PR0802MB2447:|AM0PR08MB3987:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3987976B9C603BB91A29C1458E940@AM0PR08MB3987.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rX713qAmqgqtNW6dUDC5dYyP9Wc8CZ8Xmxo0t8ucmi+C4wptNguDRuT0tULVMzGazsbb1DVEHdlJuZm6y+LsbA0N1fM/Wb3P0/5o/pk+NJGVADmh9GdDlOnZlQXX7zCg/Uo8esO6TFMvZh3F2ruVDwr0qyTso+dnSTYNcN3HqYcmGcnkwTvHoPha18M7/UP+ft4xq/x1t0gjzTSNwXO/Vjso9aEDW1tBX3trCBJjoufodWfK8RCOc6YwldM5ArgrX05R3WWcqS0pNukht1ZZNpi8LX3cWx+j/0yJ6Q4+6/tMPUGoR94XX8QARMK7R7kBliAXXjmJ86GwneazU2b8Mg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(7696005)(55016002)(53546011)(6506007)(9686003)(4326008)(26005)(86362001)(33656002)(66946007)(66476007)(66556008)(64756008)(52536014)(71200400001)(5660300002)(186003)(66446008)(54906003)(478600001)(76116006)(2906002)(83380400001)(8676002)(316002)(110136005)(66574015)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 0kjt//OT0KUBvD1C5k4VxzlKMK9og+AxWz15AX7xdWodSqncZap9UBu6XA3D/J7ZFLPDxMupNGEHDOtHOXG5QQRnZgkLKPGR7Ehff37Aueo+bKeDb0B/NwdTYZ8K1Up1o1FrhjZe7Q1a9m/Ixqym1bxUOPro8BEuURo+uKGwvq3ib3FHP6F0FN+1IXnrIMIUB5/AriaM+BEN5xiM91OoI5VMvayNiPYsMsqBMTQpR9NF6I0gpOV0aGjVp3b7lWmRnFur/1kH8F+A+rWE4UgOu5LCbEp3kqIKejzdCo7HYbO+9IzJSxeNVyfDJulFBV0uOQ7qy8C4MHnPPlvSpEcme7AzbCxWcvskmZ1MwnNfvbgYUp3OTBDqD94ksHJ5RCKANV03lGwvfPVpnqKnwpkRt0Aa5grhtIq+doB08gj3LFPVIf8n2pnZxW0bRuNdXw0JsvTLy9HZDPv49IBtAyAvMu1QqB4waUAJm7XkHizLipQLvx9lueEIVGEqiq00tqDg
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2447
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966005)(316002)(336012)(36906005)(81166007)(478600001)(83380400001)(82310400002)(86362001)(356005)(7696005)(52536014)(5660300002)(110136005)(54906003)(70206006)(66574015)(70586007)(186003)(26005)(55016002)(2906002)(9686003)(53546011)(4326008)(47076004)(8676002)(82740400003)(8936002)(33656002)(6506007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3f93492a-c08d-4ecc-d1f2-08d81753cd36
X-Forefront-PRVS: 04433051BF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uwrX3Sns6uPVuy6lMAybU8sm1B7dLBsU3y+pHG9n38M/dSMWYd5KqmKFg60fH3Mb5LmT/2AYx/TyTRVehi19Wd8tYammxXtQVb+IDfmGIQvHUUNxJq5kIrCdpabmoI+N0Fwy5qxZY0u1aPOq7Dxh5mGnadFg7DA+Fai4kTvdCEhHK71yAzWeJrL3m3ip3w0PF4zYIX1wXW2MWqNJPgLF6qdS5Hj/n6mH/8ZyYN2EOmY64gqobm2YMW0gk4H6KxDeBxyUXEPQvUlWulC0MwSNZwsnDkg3JLFLSX4VvgDdpvXTxdSFssN/L65XlUBg7neeSlfBOPwVrlGG2Ccj4pNBoaE6rv9P9e4754SZ77ObK0GRm6+BG8EZFM+zGo5OP2kURBRlX+EYDrLXblDupc9gjw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 09:00:03.1283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9ca790-6b07-4c3e-5ed3-08d81753d12e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3987
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SWYgSSBtb3ZlIFRGLU0gdG8gbWV0YS1hcm0tYnNwLCB0aGVuIG1ldGEtYXJtLWJzcCB3b3VsZCBo
YXZlIHRoZSBkZXBlbmRlbmN5IG9uIGFybS10b29sY2hhaW4uIFdvdWxkIHRoYXQgYmUgYmV0dGVy
Pw0KKEkgZG8gbm90IHVuZGVyc3RhbmQgd2h5IG1ldGEtYXJtIGRlcGVuZGluZyBvbiBhcm0tdG9v
bGNoYWluIGlzIGEgYmFkIHRoaW5nLCBleHBsYW5hdGlvbnMgYXJlIHdlbGNvbWUgOikgKQ0KIA0K
SSBleHBlcmltZW50ZWQgd2l0aCBCQkZJTEVTX0RZTkFNSUMsIGJ1dCBpdCBpcyB2ZXJ5IHVuaGVs
cGZ1bCBmcm9tIGVuZC11c2VyIHBlcnNwZWN0aXZlIChpZiBhcm0tdG9vbGNoYWluIGlzIG5vdCBp
biBiYmxheWVycyk6DQoiRVJST1I6IE5vdGhpbmcgUFJPVklERVMgJ3RydXN0ZWQtZmlybXdhcmUt
bScuIENsb3NlIG1hdGNoZXM6DQogIHRydXN0ZWQtZmlybXdhcmUtYSINCkNvbXBhcmVkIHRvIHRo
ZSBjdXJyZW50IG9uZToNCiJFUlJPUjogTGF5ZXIgJ21ldGEtYXJtJyBkZXBlbmRzIG9uIGxheWVy
ICdhcm0tdG9vbGNoYWluJywgYnV0IHRoaXMgbGF5ZXIgaXMgbm90IGVuYWJsZWQgaW4geW91ciBj
b25maWd1cmF0aW9uIg0KDQpJIGFtIG9wZW4gdG8gYW55IHN1Z2dlc3Rpb25zLg0KIA0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgPG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKb3NodWEg
V2F0dCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU2VudDogMjAyMC4gasO6bml1cyAyMi4s
IGjDqXRmxZEgMjA6MDQNClRvOiBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVuaXgub3JnPjsg
Sm9uIE1hc29uIDxqZG1hc29uQGt1ZHp1LnVzPg0KQ2M6IEdhYm9yIEFib255aSA8R2Fib3IuQWJv
bnlpQGFybS5jb20+OyBtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBuZCA8bmRAYXJt
LmNvbT4NClN1YmplY3Q6IFJlOiBbbWV0YS1hcm1dIFtQQVRDSCA0LzZdIGFybTogdHJ1c3RlZC1m
aXJtd2FyZS1tOiBBZGQgcmVjaXBlDQoNCg0KT24gNi8yMi8yMCAxMjozNiBQTSwgRGVueXMgRG15
dHJpeWVua28gd3JvdGU6DQo+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDAxOjI2OjU0UE0gLTA0
MDAsIEpvbiBNYXNvbiB3cm90ZToNCj4+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDEyOjQ5OjM2
UE0gLTA0MDAsIERlbnlzIERteXRyaXllbmtvIHdyb3RlOg0KPj4+IE9uIE1vbiwgSnVuIDIyLCAy
MDIwIGF0IDA5OjEzOjU5QU0gKzAyMDAsIEdhYm9yIEFib255aSB3cm90ZToNCj4+Pj4gQWRkcyBh
IHJlY2lwZSB0byBwdWxsIGRvd24gdGhlIHRydXN0ZWQtZmlybXdhcmUtbSByZXBvc2l0b3J5IGFu
ZCANCj4+Pj4gdGhlIG9uZXMgaXQgZGVwZW5kcyBvbi4gVGhlIHJlY2lwZSBjYW4gZWl0aGVyIHVz
ZSANCj4+Pj4gZ2NjLWFybS1ub25lLWVhYmktbmF0aXZlIG9yIGFybWNvbXBpbGVyLW5hdGl2ZSBD
bGFuZyB0b29sY2hhaW4gdG8gY29tcGlsZSB0aGUgZmlybXdhcmUuDQo+Pj4+DQo+Pj4+IENoYW5n
ZS1JZDogSTM3YTRiYTM4OTgyYjViMWQzODdlY2NiYjI2YmI1Yzc5YmRkYWIwZjcNCj4+Pj4gU2ln
bmVkLW9mZi1ieTogR2Fib3IgQWJvbnlpIDxnYWJvci5hYm9ueWlAYXJtLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+ICAgbWV0YS1hcm0vY29uZi9sYXllci5jb25mICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsNCj4+Pj4gICAuLi4vdHJ1c3RlZC1maXJtd2FyZS1tL3RydXN0ZWQtZmlybXdhcmUtbS5p
bmMgfCAxMTggKysrKysrKysrKysrKysrKysrDQo+Pj4+ICAgLi4uL3RydXN0ZWQtZmlybXdhcmUt
bV8xLjAuYmIgICAgICAgICAgICAgICAgIHwgIDI1ICsrKysNCj4+Pj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDE0NCBpbnNlcnRpb25zKCspDQo+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtYXJt
L3JlY2lwZXMtYnNwL3RydXN0ZWQtZmlybXdhcmUtbS90cnVzdGVkLWZpcm13YXJlLW0uaW5jDQo+
Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IA0KPj4+PiBtZXRhLWFybS9yZWNpcGVzLWJzcC90cnVz
dGVkLWZpcm13YXJlLW0vdHJ1c3RlZC1maXJtd2FyZS1tXzEuMC5iYg0KPj4+Pg0KPj4+PiBkaWZm
IC0tZ2l0IGEvbWV0YS1hcm0vY29uZi9sYXllci5jb25mIGIvbWV0YS1hcm0vY29uZi9sYXllci5j
b25mIA0KPj4+PiBpbmRleCAzMzQxOTcyLi4xMGE3OTUxIDEwMDY0NA0KPj4+PiAtLS0gYS9tZXRh
LWFybS9jb25mL2xheWVyLmNvbmYNCj4+Pj4gKysrIGIvbWV0YS1hcm0vY29uZi9sYXllci5jb25m
DQo+Pj4+IEBAIC0xMSw1ICsxMSw2IEBAIEJCRklMRV9QUklPUklUWV9tZXRhLWFybSA9ICI2Ig0K
Pj4+PiAgIA0KPj4+PiAgIExBWUVSREVQRU5EU19tZXRhLWFybSA9ICIgXA0KPj4+PiAgICAgICBj
b3JlIFwNCj4+Pj4gKyAgICBhcm0tdG9vbGNoYWluIFwNCj4+PiBUaGlzIG1heSBiZSBwcm9ibGVt
YXRpYy4uLg0KPj4gWWVzLCB0aGlzIHdhcyBmbGFnZ2VkIGFzIGEgcG90ZW50aWFsIHByb2JsZW0g
aW50ZXJuYWxseS4gIA0KPj4gRm9ydHVuYXRlbHksIG1ldGEtYXJtLXRvb2xjaGFpbiBjdXJyZW50
bHkgaGFzIG5vIG90aGVyIGxheWVyIA0KPj4gZGVwZW5kZW5jaWVzLiAgU28sIGl0IHNob3VsZG4n
dCBodXJ0IHRvbyBtdWNoLiAgQ2NpbmcgSlBFVyBkaXJlY3RseSANCj4+IG9uIHRoaXMsIHNpbmNl
IGhpcyBpbnNpZ2h0IGhhcyBiZWVuIGhlbHBmdWwgaW4gdGhlIHBhc3QuDQo+Pg0KPj4gVEYtTSBy
ZXF1aXJlcyBBcm0ncyBMTFZNL0NsYW5nIGJhc2VkIHRvb2xjaGFpbiB0byBjb21waWxlLCB3aGlj
aCBpcyANCj4+IHRoZSBzZWNvbmQgcGF0Y2ggb2YgdGhpcyBzZXJpZXMuDQo+IE9uZSBvZiB0aGUg
b3B0aW9ucyBpcyB0byBtb3ZlIFRGLU0gdG8gbWV0YS1hcm0tYnNwLi4uDQoNCllhLCBJIHdvdWxk
bid0IHdhbnQgdG8gbWFuZGF0ZSBtZXRhLWFybS10b29sY2hhaW4gaGVyZS4gWW91IGNvdWxkIGVp
dGhlciBtb3ZlIGl0IHRvIG1ldGEtYXJtLWJzcCBhcyBEZW55cyBzdWdnZXN0ZWQgb3IgcG9zc2li
bHkgdXNlIEJCRklMRVNfRFlOQU1JQz8NCg0KDQo+DQo=
