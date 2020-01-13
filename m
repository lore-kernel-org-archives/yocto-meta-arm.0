Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.63])
 by mx.groups.io with SMTP id smtpd.web09.37304.1578916997242215521
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Jan 2020 04:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QjfgTdsp;
 spf=pass (domain: arm.com, ip: 40.107.3.63, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/77QgOqo5SD/aA9DAwuJxZOQKlml9QTq8GLzX7PrTSc=;
 b=QjfgTdsptxNb8p7Ry1crk3QIzsVl0SHeS7mZBEByh7Sc6XjLwNNlAL2ddpqgcj5WUlAOFUmUzKV0hb0eNhf2rOqAeREWPmMv0lH4f4idVeNlyJq5vo3/jQ/GcZYEYAQUDBb7jm8Qg3g1nXuqwPNEOFoKNvhWNAjNx4RitCin1NE=
Received: from VI1PR08CA0162.eurprd08.prod.outlook.com (2603:10a6:800:d1::16)
 by AM7PR08MB5415.eurprd08.prod.outlook.com (2603:10a6:20b:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10; Mon, 13 Jan
 2020 12:03:15 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0162.outlook.office365.com
 (2603:10a6:800:d1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Mon, 13 Jan 2020 12:03:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 13 Jan 2020 12:03:14 +0000
Received: ("Tessian outbound 1da651c29646:v40"); Mon, 13 Jan 2020 12:03:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bdc823b6d4ed764c
X-CR-MTA-TID: 64aa7808
Received: from 131574d3ba33.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6ED6B832-4463-4472-96B6-5BD44982CD67.1;
	Mon, 13 Jan 2020 12:03:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 131574d3ba33.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Jan 2020 12:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghk+sA0BpqHfTDXtwsndKm+MdIXzSOKD40MOitiO0j7gbbfs94XBey/oIsTuGvEC1CFXYcd2Sa8tRMJIj2r8CcIgdr2v5UUF3GpeIS6MSHE1q7XC8chF9IM43ozJ90ZuzoVvSlWtbCkr6xLRX1czpb4GxANiT+pDPkn3Q66EPmBHm9G77SwtqLxLCvX5lm3VQVv4v12Vx46vqeXQpHLmr3dYbRvDoceBCt664YSOVvuMI5Y303fOqRIj3uhB3KoJWIQ2iHs+sDWY6q0anUu6AiyWRvGYKbzSZxpCD1zQtH8kCxVLnJhtcPVMA9BVSY8AeRZzUDXCskj4bHKPSEO9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/77QgOqo5SD/aA9DAwuJxZOQKlml9QTq8GLzX7PrTSc=;
 b=CwuMGAKKaG7IBnFdBSk5d2IMJ8sNMmbKIKxfE8I8ozlRH53RXmtPdIJ5myQmr5VhgampADQzpIOLBmEtpM0NFWGyLwYdUCE5NgPWY3jqfFlzxlntCfXWF8geoHf4lDMlEfr65I2LXwhv6srb1Q+ZUmDyB7GWfdyDnRhFaFbUZseZWKaCWeq1dpxaXUZ98vz9unYdGbBCbn8SL4SAoEtwPaGhYJNskXgTA15RLRcs8O701LztAHSQ0iYbQcNMCHrNg1P4+MXNvErscnBH4cmaA9oVdBhkNN+CzcwKTROV53U9CTE3znrbOF4YTg0BNYW1zri78uuR8epNxZOdOxqgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/77QgOqo5SD/aA9DAwuJxZOQKlml9QTq8GLzX7PrTSc=;
 b=QjfgTdsptxNb8p7Ry1crk3QIzsVl0SHeS7mZBEByh7Sc6XjLwNNlAL2ddpqgcj5WUlAOFUmUzKV0hb0eNhf2rOqAeREWPmMv0lH4f4idVeNlyJq5vo3/jQ/GcZYEYAQUDBb7jm8Qg3g1nXuqwPNEOFoKNvhWNAjNx4RitCin1NE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3916.eurprd08.prod.outlook.com (20.178.47.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 12:03:07 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::9193:2edc:5e96:ffb2]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::9193:2edc:5e96:ffb2%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 12:03:07 +0000
From: "Bertrand" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] meta-arm layer update
Thread-Topic: [meta-arm] meta-arm layer update
Thread-Index: AQHVygJ3M6R9TDi1TkGO/uAwpJk9N6fofs8A
Date: Mon, 13 Jan 2020 12:03:07 +0000
Message-ID: <6C26394D-A57D-4C55-83AD-B9F8C04007A9@arm.com>
References: 
 <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
 <2596.1578907811326950752@lists.yoctoproject.org>
 <CAP71Wjy3gNpd3XL-qzrnORHLedm7d6t=cX3wsn5dP6sS7D8c9w@mail.gmail.com>
In-Reply-To: 
 <CAP71Wjy3gNpd3XL-qzrnORHLedm7d6t=cX3wsn5dP6sS7D8c9w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [217.140.106.51]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20ab6cca-f556-45aa-e83c-08d7982091b5
X-MS-TrafficTypeDiagnostic: DB7PR08MB3916:|AM7PR08MB5415:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB541531E800EE0E27461573CC9D350@AM7PR08MB5415.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 028166BF91
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(189003)(199004)(40434004)(6512007)(2906002)(15650500001)(8936002)(86362001)(5660300002)(4326008)(6916009)(81156014)(81166006)(2616005)(8676002)(36756003)(6486002)(53546011)(6506007)(966005)(186003)(71200400001)(478600001)(33656002)(66946007)(64756008)(66476007)(66556008)(66446008)(91956017)(26005)(76116006)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3916;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kbjGZ4uItoeemyVTh3ddd1rf3k6LJv/ZLXue1S2BACH9mP3NTgVdJsvC1ZKI92kP7CdRSDHKxuvh/ogzhQqYGKsdxMoyrhKp/JoeylswtTIk+rIeEp/1QQCMxPdz3VFOAr1tuEv4SZSZBvvvPDDtGsEn0BmU4Z5eeWm8He21Y8lmo6U906nETwoD3aGMuA6G5ecKsOw5YO9jyDj1G+qiiqLh3oTqCTeMbetpBgN6Idad/XZWpLDJY83jKdEGnK3hWL0Qg47Q4og8zpyMGaenb1nxlRqU291l9Djbwr+LNgMSxFCR72NGh36dlgd/f16js4Q+lNgU4dhdcJV6XO1cDyocXYipOjbYDGtXIw3DLFoIy05LXD4DWIYQJ6rTbvEkdouivozb6BWr6pWliJTjvbYtVHk1WNISmxTOSp4LSCitV0RImDwo4A6FCZoYlgL+xq9t6x5+pqwmx1zBBvYwPkJnSpHeW+Mi2MEAB5mmGxxTEauFaCWrLw+ky7wtFUVYZZFBxRW+zpURuFnayax44p3H/Xel02sevo5TJfBYJeg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3916
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(40434004)(199004)(189003)(53546011)(6506007)(8676002)(966005)(5660300002)(186003)(33656002)(70586007)(70206006)(36756003)(81156014)(81166006)(8936002)(478600001)(26005)(6512007)(336012)(2616005)(2906002)(86362001)(15650500001)(6916009)(36906005)(26826003)(4326008)(356004)(6486002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM7PR08MB5415;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	20cc848f-d5cb-486a-2083-08d798208d4b
X-Forefront-PRVS: 028166BF91
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M8fstypMQ1Tp/BThEZdtoA3mJUti77427UqA0Xz+Wcfaxlpnjg9m61yl8XEDrn/TRL+cxkLKBFr5gMjIDOwMGgFV+ZBOG1O5TJeihcQmGiiNE4B3BLNosoXBMt5LsZWOYphqbvS5DdlWjni+PH7X5n2tcvVSoAbbnguuKTrgHJLis6Fa0a2fGYHNP1v3T7F20rTt0KgN+QEODakNr9Rea633wq+ok+5PEfI8e1KkAey1ekJjAB5J0aFvOdQ9BF1QCMmsj+5BjaFn2WLj3VUgf4jNEOqYp+15lkchtmjSQfKf9BMTakgwAbALrSeIMv4eGvUDgv8uO4Viqjl07EEqZpPig/7WQPjK6fkroM6FL3cnTRdMuxsazC99fyzDw6OqOZn6qRC8eGw3g2xu3aCu75f+VGHWjCsbSOhWFBOF4IxCOsF8ucTXZsAmvK/50Ju6vyDpMGS3MYuJ99GDFw7YtZKIkvGeqQRWkmmnYuqg1iKbwcao276b+8qODQ54JSRY3R1aI8mXuWZU6CPx0xDrALmzy5taiJIvB7PD+hNZ4XQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 12:03:14.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ab6cca-f556-45aa-e83c-08d7982091b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5415
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <608C5E80CCE15B49A41400B6CC26D1CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCj4gT24gMTMgSmFuIDIwMjAsIGF0IDExOjEzLCBOaWNvbGFzIERlY2hlc25lIHZpYSBM
aXN0cy5Zb2N0b3Byb2plY3QuT3JnIDxuaWNvbGFzLmRlY2hlc25lPWxpbmFyby5vcmdAbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIEphbiAxMywgMjAyMCBhdCAx
MDozMCBBTSBCZXJ0cmFuZCA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPiB3cm90ZToNCj4+IA0K
Pj4gSGkgS2hlbSwNCj4+IA0KPj4gT24gRnJpLCBKYW4gMTAsIDIwMjAgYXQgMTI6MzMgQU0sIE5p
Y29sYXMgRGVjaGVzbmUgd3JvdGU6DQo+PiANCj4+IGhpIEpvbiENCj4+IA0KPj4gT24gVHVlLCBK
YW4gNywgMjAyMCBhdCAxMTozNSBQTSBKb24gTWFzb24gPGpvbi5tYXNvbkBhcm0uY29tPiB3cm90
ZToNCj4+IA0KPj4gVGhlIG1ldGEtYXJtIGxheWVyIGlzIG5vdyBwdWJsaWNseSBhdmFpbGFibGUg
YXQNCj4+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLWFy
bS8NCj4+IA0KPj4gSXQgaXMgc3RpbGwgdW5kZXIgYWN0aXZlIGRldmVsb3BtZW50LCBhbmQgSSBl
bmNvdXJhZ2UgZXZlcnlvbmUgd2hvIHdvdWxkDQo+PiBsaWtlIHRvIGNvbnRyaWJ1dGUgdG8gcmVh
ZA0KPj4gaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL21ldGEtYXJt
L3RyZWUvUkVBRE1FLm1kDQo+PiANCj4+IG1hbnkgdGhhbmtzIGZvciBzdGFydGluZyB0aGlzIGVm
Zm9ydCENCj4+IA0KPj4gU29tZSBpbml0aWFsIGNvbW1lbnRzL3Rob3VnaHRzOg0KPj4gDQo+PiAx
LiBXZSBhcmUgaW50ZXJlc3RlZCBpbiBtb3ZpbmcgdGhlIE9QLVRFRSByZWNpcGVzIHRoYXQgd2Un
dmUNCj4+IG1haW50YWluZWQgaW4gbWV0YS1saW5hcm8gZm9yIHF1aXRlIHNvbWUgdGltZSwgb3Zl
ciB0aGVyZS4gV2Ugd2lsbCBiZQ0KPj4gbG9va2luZyBpbnRvIHRoYXQgc29vbi4NCj4+IDIuIEkg
aGF2ZSB2ZXJ5IHF1aWNrbHkgYnJvd3NlZCB0aHJvdWdoIHRoZSBmaWxlcywgYW5kIG5vdGljZWQg
dGhhdCB5b3UNCj4+IGFyZSBzZXR0aW5nIERJU1RST19GRUFUVVJFUyB3aXRoaW4gbWFjaGluZSBj
b25maWd1cmF0aW9uIG1ldGEgZGF0YQ0KPj4gKGp1bm8uY29uZiksIHRoaXMgcmVhbGx5IG5lZWRz
IHRvIGJlIHJlbW92ZWQsIGFzIGl0J3MgYSBiYWQgcHJhY3RpY2UuDQo+PiBJZiBzb21lb25lIGJ1
aWxkcyB0aGVpciBvd24gZGlzdHJvL2FwcHMgZm9yICdqdW5vJyB5b3Ugc2hvdWxkbid0DQo+PiBj
aGFuZ2UgdGhlaXIgZGlzdHJvIGNvbmZpZy4NCj4+IA0KPj4gSW4gb3JkZXIgdG8gaGF2ZSBhIHdv
cmtpbmcgc2V0dXAgb24gSnVubywgSSBuZWVkIHRvIGVuYWJsZSB1c2IgYW5kIHVzYiBtYXNzIHN0
b3JhZ2UuDQo+PiBUaGUgb3RoZXIgc29sdXRpb24gY291bGQgYmUgdG8gZW5hYmxlIHRoaXMgZGly
ZWN0bHkgaW4gdGhlIGtlcm5lbCBjb25maWd1cmF0aW9uIGFuZCBub3QgdXNpbmcgdGhlIERJU1RS
T19GRUFUVVJFUyBidXQgdGhlIHNvbWVvbmUgYWN0aXZhdGluZyBvciB0dXJuaW5nIG9mZiB0aG9z
ZSBmZWF0dXJlcyB3b3VsZCBub3QgZ2V0IHRoZSB3YW50ZWQgYmVoYXZpb3VyLg0KPiANCj4gVGhh
dCdzIGZpbmUuIElmIHNvbWVvbmUgZGlzYWJsZSB1c2Job3N0IGFuZC9vciB1c2JnYWRnZXQgaW4g
dGhlaXINCj4gRElTVFJPLCB0aGV5IHNob3VsZCBiZSBhYmxlIHRvLiBJZiBKdW5vICdyZXF1aXJl
cycgdGhlc2UgZmVhdHVyZXMgLA0KPiB0aGVuIHlvdSBjYW4gZG9jdW1lbnQgdGhhdCBpbiB0aGUg
UkVBRE1FIGZpbGUgYXMgd2VsbC4NCj4gDQo+PiBXaGF0IHdvdWxkIGJlIHlvdXIgc3VnZ2VzdGlv
biBoZXJlIHRvIHNvbHZlIHRoaXMgaXNzdWUgPw0KPiANCj4gWW91IG5lZWQgdG8gZW5hYmxlIHVz
Ymhvc3QgYW5kIHVzYmdhZGdldCBpbiBNQUNISU5FX0ZFQVRVUkVTICwgd2hpY2gNCj4geW91J3Zl
IGRvbmUgYWxyZWFkeS4gVGhlbiBmb3IgdGhlIHRlc3RpbmcgeW91IG5lZWQgdG8gdXNlIGEgZGlz
dHJvDQo+IHdoaWNoIGhhcyB1c2Job3N0IGFuZCB1c2JnYWRnZXQgYWxyZWFkeSBlbmFibGVkIGJ5
IGRlZmF1bHQgKHdoaWNoIGlzDQo+IHRoZSBjYXNlIG9uIE9FIGNvcmUgbm9kaXN0cm8gYW5kIHBv
a3ksIGlpcmMpLiBJZiB5b3UgdXNlIGEgZGlzdHJvDQo+IHdoZXJlIGl0J3Mgbm90IGVuYWJsZWQs
IHRoZW4geW91IG5lZWQgdG8gcHJvdmlkZSBhIHNldHVwIHNjcmlwdCB0aGF0DQo+IHdpbGwgdXBk
YXRlIHRoZSBkaXN0cm8gYWNjb3JkaW5nbHkuDQo+IA0KPiBCdXQgZm9yY2luZyB0aGUgRElTVFJP
IHZhcmlhYmxlIGluIHRoZSBCU1AgbGF5ZXIgaXMgY29uc2lkZXJlZCBiYWQNCj4gcHJhY3RpY2Us
IGZvciBzdXJlLg0KDQpGb3Igbm93IHRoZSBpbWFnZXMgYnVpbHQgYXJlIHRha2luZyB0aGUgYXNz
dW1wdGlvbiB0aGF0IHRoZSByb290IGZpbGVzeXN0ZW0gd2lsbCBiZSBvbiBhIFVTQiBtYXNzIHN0
b3JhZ2UgKGNvbW1hbmQgbGluZSwgZGV2aWNlIG5hbWUgZXRjKSBhbmQgdGhhdOKAmXMgd2h5IEkg
ZW5hYmxlZCB0aG9zZSBmZWF0dXJlcy4NCkkgd2lsbCBkaXNhYmxlIHRob3NlIGluIGp1bm8uY29u
ZiBhbmQgZ2l2ZSBtb3JlIGRvY3VtZW50YXRpb24gb24gdGhlIFJFQURNRSBmb3IganVubyBvbiB0
aGlzLg0KDQpJIHRob3VnaHQgdGhhdCB1c2Job3N0IHdhcyBub3QgZW5hYmxlZCBieSBkZWZhdWx0
IGFuZCB0aGF04oCZcyB3aHkgSSBmb3JjZWQgaXQgaW4ganVuby5jb25mLiBJIHdpbGwgY2hlY2sg
d2h5IEkgaGFkIGlzc3VlcyBiZWZvcmUgYWRkaW5nIHRoaXMuDQpBbnl3YXkgSSB3aWxsIGZpeCB0
aGF0Lg0KDQo+IA0KPj4gDQo+PiAzLiBXZSBoYXZlIHNvbWUganVubyBtYWNoaW5lIGRlZmluaXRp
b24gaW4gbWV0YS05NmJvYXJkcywgYW5kIHdlDQo+PiBzaG91bGQgbG9vayBhdCBjbGVhbmluZyB0
aGluZ3MgdXAgYSBiaXQgdG8gYXZvaWQgZHVwbGljYXRpb24NCj4+IA0KPj4gRGVmaW5pdGVseSBh
Z3JlZSBoZXJlLiBNYXliZSB0aGUgZGVmaW5pdGlvbiBzaG91bGQganVzdCBiZSByZW1vdmUgaW4g
OTZib2FyZHMgYWZ0ZXIgY2hlY2tpbmcgdGhhdCB3ZSBwcm92aWRlIHRoZSBzYW1lIGZ1bmN0aW9u
YWxpdGllcy4NCj4+IFdoZW4gSSBpbXBsZW1lbnRlZCB0aGUgSnVubyBCU1AsIEkgZGlkIGNoZWNr
IHRoZSA5NmJvYXJkcyBzbyBJIHRoaW5rIHdlIGhhdmUgYXQgbGVhc3QgdGhlIHNhbWUgZmVhdHVy
ZXMgaW4gbWV0YS1hcm0gYnV0IGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhbiBvdGhlciBjaGVj
ayBvbiB0aGlzLg0KPiANCj4gb2ssIHdlIHdpbGwgbmVlZCB0byBoYXZlIGEgbG9vayBhdCB0aGF0
Li4uDQo+IA0KPj4gDQo+PiANCj4+IEFsc28sIHNvbWUgb2YgdGhlIGxheWVycyBhcmUgbm93IHBy
ZXNlbnQgb24gdGhlIE9wZW5FbWJlZGRlZCBsYXllcg0KPj4gaW5kZXguIFNwZWNpZmljYWxseSwN
Cj4+IGh0dHA6Ly9sYXllcnMub3BlbmVtYmVkZGVkLm9yZy9sYXllcmluZGV4L2JyYW5jaC9tYXN0
ZXIvbGF5ZXIvbWV0YS1hcm0tYnNwLw0KPj4gaHR0cDovL2xheWVycy5vcGVuZW1iZWRkZWQub3Jn
L2xheWVyaW5kZXgvYnJhbmNoL21hc3Rlci9sYXllci9tZXRhLWFybS8NCj4+IA0KPj4gVGhlIG1l
dGEtYXJtLWlvdGEgbGF5ZXIgd2FzIHJlamVjdGVkIGR1ZSB0byBub3QgaGF2aW5nIGEgZGlzdHJv
DQo+PiBkZWZpbml0aW9uIGluIGl0LCBhbmQgZ2VuZXJhbGx5IGJlaW5nIGVtcHR5LiBJIHdpbGwg
YXR0ZW1wdCB0byBhZGQgaXQNCj4+IGFnYWluIG9uY2UgY29kZSBoYXMgYmVlbiBwdXNoZWQgdG8g
dGhhdCBsb2NhdGlvbi4NCj4+IA0KPj4gDQo+PiBUaGFua3MsDQo+PiBKb24NCj4+IElNUE9SVEFO
VCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMg
YXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBu
b3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVk
aWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJz
b24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0
aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4NCj4+IA0KPj4gDQo+IA0KDQo=
