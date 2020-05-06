Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.4326.1588783142780236213
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 May 2020 09:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ncEbdrE2;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T++Io+V1lBCKfx/Kawp1YzT34U63Dj7/b+XM5g6PGt0=;
 b=ncEbdrE2GYMRRh1bvHow0VB8pfs5o9cNivR7pVvV5X8MKbCcJ1qa1p/0Rx12iatcijODoZlQ+XQk2Af92fdq0JAem6lecfyoPx6OPEv5x5Pyx5gD1nlx/lPeofqMBvxAqfAKLPSjXS0R7Sk7UovUMQdiHTK2yHTNnBF7NOFO33s=
Received: from AM6P191CA0074.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::15)
 by VE1PR08MB4767.eurprd08.prod.outlook.com (2603:10a6:802:a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Wed, 6 May
 2020 16:38:59 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::48) by AM6P191CA0074.outlook.office365.com
 (2603:10a6:209:8a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Wed, 6 May 2020 16:38:59 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 16:38:59 +0000
Received: ("Tessian outbound b3a67fbfbb1f:v54"); Wed, 06 May 2020 16:38:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c781ef3092f5838f
X-CR-MTA-TID: 64aa7808
Received: from 701dee555e61.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 65A3A654-8437-47A5-8C8A-53EAA6917677.1;
	Wed, 06 May 2020 16:38:53 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 701dee555e61.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 May 2020 16:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0GDScQ30mcb24OSVTjFg9FtzdF9Q+SUUPV3cZCwiDllWimhQI7JZRbydLys6kCFEdH7F38LzR6y6o/F24G9Xs0Yj1Yhwkh6bfE4ZZtMMg9LBS1WxAcWWth3AVgwE7MqEPPJf85Y34zjqS1TnRD5Gaq31mwoehxnKkAiavb3+g/BzsKJWxfrelwv+J1qlWs0HF2E9ASnibjEaqYBY5SxsuOirmegYkFOotuKLe9YgZ1f60F7PKoCWUJDzNiBwR9WJQ9V4E0AOh/FY4VT4QNOm7YY4ExyoN0Ykk5vYqSrTUR0Jh8Gtfkyu1Oesl4DwJiQ2zs53GAbpZ97Wx9bsKXpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T++Io+V1lBCKfx/Kawp1YzT34U63Dj7/b+XM5g6PGt0=;
 b=TrKu5eqfu5CNhLSGqG5PRdawXLBbe0Xvhj2i5eoek5/4UHzyWOxCefCUwfwt4DsbrgL3fa8VkA0Qt2Ei/c8JOKR4yaMyj3gMn0UoeDpkAE/oiFppEH/lYrxLN6qiIEYGIsIHM3odIIp3XZLWKCW8oJJsz3CwkDu7bGZjHFOkZf4S7l3fLOE+1i/fd2EfYqkUJ2WuffBQtF3ag55cEbqVjtWPDjVQ5/a4SZLM97QjkSgD7gWqsZvzxfvossjucvvRizs3gZdCK/GmkPYyU0WlwHvnWHdblvF/bFtHId0TzDYNuJ+HC0czxF0usINgOMRcRsEygUwNi7mWeDOnqbnRoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T++Io+V1lBCKfx/Kawp1YzT34U63Dj7/b+XM5g6PGt0=;
 b=ncEbdrE2GYMRRh1bvHow0VB8pfs5o9cNivR7pVvV5X8MKbCcJ1qa1p/0Rx12iatcijODoZlQ+XQk2Af92fdq0JAem6lecfyoPx6OPEv5x5Pyx5gD1nlx/lPeofqMBvxAqfAKLPSjXS0R7Sk7UovUMQdiHTK2yHTNnBF7NOFO33s=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4620.eurprd08.prod.outlook.com (2603:10a6:10:34::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Wed, 6 May
 2020 16:38:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 16:38:52 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: Update gem5 and switch to python3
Thread-Topic: [meta-arm] [PATCH] meta-arm-bsp: Update gem5 and switch to
 python3
Thread-Index: AQHWH78CD9P2OHRqN06RjhwnQSW476ibPmAAgAABuoCAAAoNgA==
Date: Wed, 6 May 2020 16:38:51 +0000
Message-ID: <D9520898-E03E-4271-B73D-6E3B54F5B8C9@arm.com>
References: <20200501134650.3707-1-bertrand.marquis@arm.com>
 <20200506155642.GA22996@kudzu.us>
 <DA38ACAC-A14B-45FB-9A12-4C78BBB7F153@arm.com>
In-Reply-To: <DA38ACAC-A14B-45FB-9A12-4C78BBB7F153@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 929f19ca-bb42-4179-63e7-08d7f1dbfa1e
x-ms-traffictypediagnostic: DB7PR08MB4620:|VE1PR08MB4767:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB476745D2920A8167FD54A6149DA40@VE1PR08MB4767.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uVAntQyoH3eUzK+q5lOqDQ7XyXRh9h8RKq4h21TJVeNe6+ChLTrZebg4pKq3Nq4MfvffJcpwxPuFBVk7tSl0w5H5JddEpvY1GoiVUUw44XMc8ABycYKNHurNcJevVsJNVtKv6FFsQbr80Y/g4VLLj/iMtByPjLs3UPnpBzGgzRMZpPN9rJ3LXTm6MXiWgdgR4e7/Ssu+QTvIdPat9Zy29LLRMKALtUkCwyuUxjrx5Wylw6nA4ZrOvFcC8aYCzfJt1zaHVf/Y23q26pm5aOEQ85F+Wx3RI0TTxAMSdue+CErAh/QWQxf52SYVUZbdQu/QnjufKcAaM0ecHUY2cbkqyiGZRtExRDP1i5Hd4UDrt1F3JB3KHOI+4UBvVrwO9CqbnBIei5VX7fkrKTu1FJLqRsoRRO50TGY7BNHYa3+YFbdRxn7xjIFk+Kvb1MptAd7jckmaD9Mfo/FqOOMxiIZ5LmQBXJqLPy83Btma32ggfa2ufdTvOr0cez32tNrpD14l6CRdorhmsfvxrnzufogTSw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(33430700001)(8936002)(8676002)(66446008)(15650500001)(186003)(66556008)(91956017)(76116006)(2906002)(66946007)(4326008)(66476007)(64756008)(26005)(6486002)(86362001)(5660300002)(6512007)(33440700001)(71200400001)(316002)(36756003)(33656002)(53546011)(2616005)(6916009)(6506007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Xwh8lEJMl4dyFxuV0bRtRkExg2u6mEv8mrOn/P8xQ6R0t7ZgCMrPoi4gLU8rBMyJOTaIn5yBOtMrTpoiI7WWVYNMXwEcOIES/aR8BANY9QmAmtH8LzkhGlnBTynG6G34LkhhLBvBUxV9Sac24rWeFqjTeix4/Ka/01tIWuaLD2FNGNuqm1EQBPAuKKi4vWWZoosAI2DdCy45p6pizIpI2iv7MoVsRTvv1zTJO32c1mI9y3IQn6cEpOmr9Qhq/wimL1VmLH9XuCEXvPmdWrtIv+NjGI+forxL2XuZsv22XTCOIM4FC7zXMY4IhOkz5NEcd4iv+w2u3VKDyd3pbu4PwlWZi+A17NP5nlhyvIbRjLfWgk5AXp0TN2+Cxm86npvg0C7oKRkO+vkvn6919iC8zdVW+O1r7bwpfNm9lDbGZSRgkyVbUl6dOwouSVobNuHyhaLqs/eJNYVeV/WwRZhsPxEJR7EWyMcSir9bIO3EyB1ULRst3cPCjsyaVJ4ISbp1XOKx41RqkYS4w5hz7jaXVonGZUK3pIuGXj5qdQsodlV23K57P93cAXXx5guOfLHt2mBpKG1KTB5otc4gEYbz/ZVwPXBpsWPQsFq+rGrUuX1Uoat6rpq5jq9bbCZoeKo8vrYxspSQQ+r0Zd43YtjwBvOJGr9q0mmOEVScLFJ4GwcESzFye0sL1HulPe5E2XuegzbkeScoe/iHSTEs6+GAo/IWev3w3qAOF0NnhSTnJzQaeyyd9/79NwXFVt4YtdSrJcB6vjgWkVQGpuAmNLIFfu9SsMxR5wjsqek3q60xELg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4620
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966005)(33430700001)(6916009)(26005)(186003)(86362001)(6506007)(53546011)(6486002)(70206006)(70586007)(33656002)(5660300002)(6512007)(316002)(36906005)(33440700001)(8936002)(336012)(15650500001)(36756003)(4326008)(2616005)(82310400002)(47076004)(82740400003)(2906002)(478600001)(356005)(81166007)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	76101fa5-5f3e-4716-b495-08d7f1dbf5e5
X-Forefront-PRVS: 03950F25EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Elyz4Er1QEHJrOTXD2GsMq6gttl2JOXQ3HpYqFnyz9Y63hjKUpMMHiOywteCQTwvuy2LrSqvj0UlZ2EHulQVfT4ZBsd5QxzpTKQgrQbzeKgPYn5k2A7zu8fLZB418PIzLtoiCG+IWWmWg8O0+RRYXxxlUtLm/nr+hwDwvF/tpX8/QtYqLpUpvaCMBuZMTx0qeC3/CRyYec+JYeUGKhb3nmA0uXFUvpUgu7nJN5fWvFMS09RX/YZkGj2CEyJlORPQuoTS8yVvjHmINK+gHhVaNYJUUe0v7FVWzYfT3xSJvFCSesGBJh9RMr1QVG7EEFwWgtPInHFCx/ei0IoDV4o69F82FBOHi4AWsrbaad2BWHccK+zn9IaLEwyVmWSqdEDpQsV1w7zctSxNGFOmslhi1XSuAowt2AKX4kQP157tTsYNkBaZnPa/k8AaewDsDabwaXN7w1I4xHick5k6AeCKHhgg5W/TmQJqkj98qNqDnxztgp1a1bXmZpjwbR/z8d+XLPA/Bmwx0FRlvHCmSOdXF6+H4sEC5d9AVklnfQaLREFqaJU9BJTe0ZSpZ8MOJcym2cLOUeVrhHcvqjZRBKK4nw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 16:38:59.2012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 929f19ca-bb42-4179-63e7-08d7f1dbfa1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4767
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C2CCD670489BC4C912A71F86CF64565@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCj4gT24gNiBNYXkgMjAyMCwgYXQgMTc6MDIsIEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5k
Lm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiA2IE1heSAyMDIwLCBh
dCAxNjo1NiwgSm9uIE1hc29uIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxqZG1hc29uPWt1
ZHp1LnVzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPj4gDQo+PiBPbiBGcmksIE1h
eSAwMSwgMjAyMCBhdCAwMjo0Njo1MFBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0K
Pj4+IFRoaXMgcGF0Y2ggaW5jbHVkZXMgc2V2ZXJhbCBmaXhlcyBmb3IgZ2VtNS1hYXJjaDY0DQo+
Pj4gLSBTd2l0Y2ggdG8gYSBuZXcgdmVyc2lvbiBvZiBnZW01IHN1cHBvcnRpbmcgcHl0aG9uMyBh
bmQgdXNlIHB5dGhvbjMgdG8NCj4+PiBidWlsZCBpdC4NCj4+PiBXZSB1c2UgYSB2ZXJzaW9uIGlu
IGRldmVsb3AgYnJhbmNoIG9mIGdlbTUgZm9yIG5vdyBhbmQgd2Ugd2lsbCBoYXZlIHRvDQo+Pj4g
c3dpdGNoIHRvIHJlbGVhc2UgMjAgb25jZSBpdCBpcyByZWxlYXNlZCBtaWQgb2YgbWF5Lg0KPj4+
IC0gUmVtb3ZlIHNjb25zIHB5dGhvbjIgcmVjaXBlcyB3aGljaCB3ZXJlIHVzZWQgYmVmb3JlIGJ5
IGdlbTUgYXMgYQ0KPj4+IHdvcmthcm91bmQgdW50aWwgZ2VtNSB3YXMgdXBkYXRlZCB0byBzdXBw
b3J0IHB5dGhvbjMNCj4+PiAtIG1ha2UgZ2VtNS1hYXJjaDY0LWJvb3Rsb2FkZXIgb25seSBjb21w
YXRpYmxlIHdpdGggZ2VtNS1hYXJjaDY0DQo+Pj4gLSByZW1vdmUgdW5uZWNlc3NhcnkgRklMRVNF
WFRSQVBBVEhTX3ByZXBlbmQgaW4gZ2VtNS1hYXJjaDY0LWJvb3Rsb2FkZXINCj4+IA0KPj4gDQo+
PiANCj4+IEknbSBzZWVpbmcgYW4gZXJyb3Igd2hlbiBjb21waWxpbmcgdGhpcywgd2hpY2ggSSB3
YXNuJ3Qgc2VlaW5nIGJlZm9yZS4NCj4+IA0KPj4gDQo+PiANCj4+IEVSUk9SOiBnZW01LWFhcmNo
NjQtbmF0aXZlLWdpdEFVVE9JTkMrMGM3ZjEzMWVkMi1yMCBkb19jb21waWxlOiBzY29ucyBidWls
ZCBleGVjdXRpb24gZmFpbGVkLg0KPj4gRVJST1I6IGdlbTUtYWFyY2g2NC1uYXRpdmUtZ2l0QVVU
T0lOQyswYzdmMTMxZWQyLXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlvbiBvZiAnL2hvbWUvamRtL3lv
Y3RvL3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2dlbTUtYWFyY2g2NC1uYXRpdmUv
Z2l0QVVUT0lOQyswYzdmMTMxZWQyLXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuNTQ5MCcgZmFpbGVk
IHdpdGggZXhpdCBjb2RlIDE6DQo+PiBzY29uczogUmVhZGluZyBTQ29uc2NyaXB0IGZpbGVzIC4u
Lg0KPj4gVHlwZUVycm9yOiBvYmplY3Qgb2YgdHlwZSAnbWFwJyBoYXMgbm8gbGVuKCk6DQo+PiAg
RmlsZSAiL2hvbWUvamRtL3lvY3RvL3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2dl
bTUtYWFyY2g2NC1uYXRpdmUvZ2l0QVVUT0lOQyswYzdmMTMxZWQyLXIwL2dpdC9TQ29uc3RydWN0
IiwgbGluZSA0MDU6DQo+PiAgICBjb21wYXJlVmVyc2lvbnMoZ2NjX3ZlcnNpb24sICc4LjEnKSA8
IDA6DQo+PiAgRmlsZSAiL2hvbWUvamRtL3lvY3RvL3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0
LWxpbnV4L2dlbTUtYWFyY2g2NC1uYXRpdmUvZ2l0QVVUT0lOQyswYzdmMTMxZWQyLXIwL2dpdC9z
cmMvcHl0aG9uL201L3V0aWwvX19pbml0X18ucHkiLCBsaW5lIDEzOToNCj4+ICAgIGlmIGxlbih2
MSkgPCBsZW4odjIpOiByZXR1cm4gLTENCj4+IFdBUk5JTkc6IGV4aXQgY29kZSAxIGZyb20gYSBz
aGVsbCBjb21tYW5kLg0KPj4gDQo+PiBFUlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBp
bjogL2hvbWUvamRtL3lvY3RvL3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2dlbTUt
YWFyY2g2NC1uYXRpdmUvZ2l0QVVUT0lOQyswYzdmMTMxZWQyLXIwL3RlbXAvbG9nLmRvX2NvbXBp
bGUuNTQ5MA0KPj4gTG9nIGRhdGEgZm9sbG93czoNCj4+IHwgREVCVUc6IEV4ZWN1dGluZyBzaGVs
bCBmdW5jdGlvbiBkb19jb21waWxlDQo+PiB8IHNjb25zOiBSZWFkaW5nIFNDb25zY3JpcHQgZmls
ZXMgLi4uDQo+PiB8IFR5cGVFcnJvcjogb2JqZWN0IG9mIHR5cGUgJ21hcCcgaGFzIG5vIGxlbigp
Og0KPj4gfCAgIEZpbGUgIi9ob21lL2pkbS95b2N0by9wb2t5L2J1aWxkL3RtcC93b3JrL3g4Nl82
NC1saW51eC9nZW01LWFhcmNoNjQtbmF0aXZlL2dpdEFVVE9JTkMrMGM3ZjEzMWVkMi1yMC9naXQv
U0NvbnN0cnVjdCIsIGxpbmUgNDA1Og0KPj4gfCAgICAgY29tcGFyZVZlcnNpb25zKGdjY192ZXJz
aW9uLCAnOC4xJykgPCAwOg0KPj4gfCAgIEZpbGUgIi9ob21lL2pkbS95b2N0by9wb2t5L2J1aWxk
L3RtcC93b3JrL3g4Nl82NC1saW51eC9nZW01LWFhcmNoNjQtbmF0aXZlL2dpdEFVVE9JTkMrMGM3
ZjEzMWVkMi1yMC9naXQvc3JjL3B5dGhvbi9tNS91dGlsL19faW5pdF9fLnB5IiwgbGluZSAxMzk6
DQo+PiB8ICAgICBpZiBsZW4odjEpIDwgbGVuKHYyKTogcmV0dXJuIC0xDQo+PiB8IEVSUk9SOiBz
Y29ucyBidWlsZCBleGVjdXRpb24gZmFpbGVkLg0KPj4gfCBXQVJOSU5HOiBleGl0IGNvZGUgMSBm
cm9tIGEgc2hlbGwgY29tbWFuZC4NCj4+IHwgRVJST1I6IEV4ZWN1dGlvbiBvZiAnL2hvbWUvamRt
L3lvY3RvL3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2dlbTUtYWFyY2g2NC1uYXRp
dmUvZ2l0QVVUT0lOQyswYzdmMTMxZWQyLXIwL3RlbXAvcnVuLmRvX2NvbXBpbGUuNTQ5MCcgZmFp
bGVkIHdpdGggZXhpdCBjb2RlIDE6DQo+PiB8IHNjb25zOiBSZWFkaW5nIFNDb25zY3JpcHQgZmls
ZXMgLi4uDQo+PiB8IFR5cGVFcnJvcjogb2JqZWN0IG9mIHR5cGUgJ21hcCcgaGFzIG5vIGxlbigp
Og0KPj4gfCAgIEZpbGUgIi9ob21lL2pkbS95b2N0by9wb2t5L2J1aWxkL3RtcC93b3JrL3g4Nl82
NC1saW51eC9nZW01LWFhcmNoNjQtbmF0aXZlL2dpdEFVVE9JTkMrMGM3ZjEzMWVkMi1yMC9naXQv
U0NvbnN0cnVjdCIsIGxpbmUgNDA1Og0KPj4gfCAgICAgY29tcGFyZVZlcnNpb25zKGdjY192ZXJz
aW9uLCAnOC4xJykgPCAwOg0KPj4gfCAgIEZpbGUgIi9ob21lL2pkbS95b2N0by9wb2t5L2J1aWxk
L3RtcC93b3JrL3g4Nl82NC1saW51eC9nZW01LWFhcmNoNjQtbmF0aXZlL2dpdEFVVE9JTkMrMGM3
ZjEzMWVkMi1yMC9naXQvc3JjL3B5dGhvbi9tNS91dGlsL19faW5pdF9fLnB5IiwgbGluZSAxMzk6
DQo+PiB8ICAgICBpZiBsZW4odjEpIDwgbGVuKHYyKTogcmV0dXJuIC0xDQo+PiB8IFdBUk5JTkc6
IGV4aXQgY29kZSAxIGZyb20gYSBzaGVsbCBjb21tYW5kLg0KPj4gfA0KPj4gRVJST1I6IFRhc2sg
KC9ob21lL2pkbS95b2N0by9tZXRhLWFybS9tZXRhLWFybS1ic3AvcmVjaXBlcy1kZXZ0b29scy9n
ZW01L2dlbTUtYWFyY2g2NC1uYXRpdmVfZ2l0LmJiOmRvX2NvbXBpbGUpIGZhaWxlZCB3aXRoIGV4
aXQgY29kZSDigJgx4oCZDQo+PiANCj4+IA0KPiANCj4gQ291bGQgeW91IHByb3ZpZGUgbW9yZSBp
bmZvcm1hdGlvbiBvbiB5b3VyIHRlc3RpbmcgZW52aXJvbm1lbnQgPw0KPiBXaGljaCB2ZXJzaW9u
IG9mIFlvY3RvLCB3aGF0IGNvbmZpZ3VyYXRpb24gPw0KPiANCj4gVGhpcyB3YXMgY29tcGlsaW5n
IHByb3Blcmx5IGxhc3QgdGltZSBJIHRyaWVkIGl0IHdpdGggWmV1cy4NCg0KVG8gZ2l2ZSBtb3Jl
IGRldGFpbCBvbiBteSBzZXR1cDoNCg0KLSBtZXRhLW9wZW5lbWJlZGRlZCBhbmQgcG9reSB2ZXJz
aW9uIHpldXMgdXAgdG8gZGF0ZQ0KDQotIG1ldGEtYXJtIHdpdGggbWFzdGVyIHN0YXR1cyBpbmNs
dWRpbmcgZXZlcnl0aGluZyB5b3UgbWVyZ2VkIHRvZGF5DQoNCi0gYmJsYXllci5jb25mIHdpdGgg
dGhlIGZvbGxvd2luZyBsYXllcnM6DQpwb2t5L21ldGEgXA0KcG9reS9tZXRhLXBva3kgXA0KcG9r
eS9tZXRhLXlvY3RvLWJzcCBcDQptZXRhLW9wZW5lbWJlZGRlZC9tZXRhLW9lIFwNCm1ldGEtb3Bl
bmVtYmVkZGVkL21ldGEtcHl0aG9uIFwNCm1ldGEtYXJtL21ldGEtYXJtIFwNCm1ldGEtYXJtL21l
dGEtYXJtLWJzcA0KLSBsb2NhbC5jb25mIHdpdGg6DQpNQUNISU5FID89ICJnZW01LWFybTY04oCd
DQoNCi0gYml0YmFrZSBjb3JlLWltYWdlLW1pbmltYWwNCg0KQ291bGQgeW91IGdpdmUgbW9yZSBp
bmZvcm1hdGlvbiBvbiBob3cgeW91IGdlbmVyYXRlIHlvdXIgZXJyb3IgYmVjYXVzZSBJIGNvdWxk
IG5vdCByZXByb2R1Y2UgaXQgPw0KDQpCZXJ0cmFuZA0KDQo=
