Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.47])
 by mx.groups.io with SMTP id smtpd.web10.14204.1585322508594593085
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=SU8YBWFz;
 spf=pass (domain: arm.com, ip: 40.107.7.47, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQqY2yrh3i5cKoqmA0sBCTMIhmnwXO9elpQYZzVjquQ=;
 b=SU8YBWFzVMnMWr2A1zKIkiVTCIzfkpzCggywBELpzHr6rVWM9i2y8ociv+EXfI5aujZbNFwj1nB4efFLxvDO8QGgAkOEl10jtQ3qYXuog1yrxdVwdLabw89SC0kvcizaYbHWuBPw0/3aoJ2n3rAdA5h2cWPoN7n1LKplDZYhKoI=
Received: from AM5PR0502CA0022.eurprd05.prod.outlook.com
 (2603:10a6:203:91::32) by DB6PR0801MB1784.eurprd08.prod.outlook.com
 (2603:10a6:4:39::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 27 Mar
 2020 15:21:42 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::86) by AM5PR0502CA0022.outlook.office365.com
 (2603:10a6:203:91::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18 via Frontend
 Transport; Fri, 27 Mar 2020 15:21:42 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:21:41 +0000
Received: ("Tessian outbound fb361fb66447:v48"); Fri, 27 Mar 2020 15:21:41 +0000
X-CR-MTA-TID: 64aa7808
Received: from 6f1983c401f7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E96A4D93-6DC2-4210-B861-98B589982670.1;
	Fri, 27 Mar 2020 15:21:36 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6f1983c401f7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:21:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGp5yTFPur/xPRU+TkC7+XZXcWB7+u8s7FvUr7YxqcW0NyjT1mgJgQOAQpUDAzMF/v3gYnuiv1SqFZe1CM2WHQD6RCooRof6yoWWqBQ4UC/41+VsksAfDpWwmTPyUO9RizyV5oIxArCymebZx12+BhOEmh9JdhMqilKal23ud47RUJXhk1H4EJVhA+2rn89oqhDL1JF3HZgR8EFJDUdQKVgGLaHk+8SlCJCMX/yu0+5FkJm+d9Rxk5APEVFwtt+3J7zzZA9OOOvVTyh7amYHL1VcA1/+tdupawAtXoyDHevK97Gl6hp5ujRipT6Q5X+OQI30FGVVteOazV53a2l3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQqY2yrh3i5cKoqmA0sBCTMIhmnwXO9elpQYZzVjquQ=;
 b=Jl+SqfPmnxeETQn/L0dPAJmmXtYwf3MBkvvdJE3+wUXsGNaxEMvHgK9ftWwelzk1r+tZ6CzLoVkRZGarFvGFfWAd8ksYPsKo2soTcg4gCXtl5LQJ2KpP9l9QGlGN4athHqAkhGbXikF1fAeKGid0a2/Np/mhKBWFcb9Rw6eRweQRxPQ7KDdDy+5L9eq/u6/JgaZMEfR18UuHqJPNV7AqPw959WvhUo5/oB8nPq4Xk08UGHLHgKXGtPoaJ8mdnXsEBkfZXSjO55IAPBZwr5M6Hot0s9qFgrXSq4a2Y1F+BiYD3a8PKJgWdiLIbav/4iQeVj+gfFZFAcAygs44jAhVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQqY2yrh3i5cKoqmA0sBCTMIhmnwXO9elpQYZzVjquQ=;
 b=SU8YBWFzVMnMWr2A1zKIkiVTCIzfkpzCggywBELpzHr6rVWM9i2y8ociv+EXfI5aujZbNFwj1nB4efFLxvDO8QGgAkOEl10jtQ3qYXuog1yrxdVwdLabw89SC0kvcizaYbHWuBPw0/3aoJ2n3rAdA5h2cWPoN7n1LKplDZYhKoI=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 15:21:35 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:21:35 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/7] arm-autonomy: Create arm-autonomy-host image
Thread-Topic: [meta-arm] [PATCH 3/7] arm-autonomy: Create arm-autonomy-host
 image
Thread-Index: AQHWBCWbywgv8AVr1kivqSSUb3sLw6hcjm+w
Date: Fri, 27 Mar 2020 15:21:35 +0000
Message-ID: 
 <AM0PR08MB39876C8F7158CD33059ABAB792CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
 <20200327105010.400-4-bertrand.marquis@arm.com>
In-Reply-To: <20200327105010.400-4-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: b920a786-934c-463e-a5e9-81613e601a3f.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a00bc46-bd30-4e36-a97c-08d7d2628d84
x-ms-traffictypediagnostic: AM0PR08MB3650:|DB6PR0801MB1784:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB178411B56FBCB984C7EB22C092CC0@DB6PR0801MB1784.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(6916009)(478600001)(55236004)(6506007)(53546011)(81166006)(186003)(55016002)(86362001)(8936002)(5660300002)(7696005)(26005)(81156014)(76116006)(33656002)(66476007)(66556008)(52536014)(66946007)(64756008)(8676002)(71200400001)(4326008)(316002)(2906002)(66446008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YwA8GLZ6sCi/SAg2RXSZH87ntpTXf+wa2KKPdOw2p+W3CJuRtN1m8OPkhM3lK9MD+wrBp7ryGq8mVXvNau/872jiMEJLZswoqwNokBl4uSVA2yVN9/NX7Em8hrR69I+d6DH/+EMlSe0pWo7onVvvGGvSXfGnUJQ799k0bEzqdK9rgnNI2QFZX3hKTYcLZoD/pSam6juNYRBqMBmMfJISiu29X/sPKgUDgHSzKw03L7u0Ep+yMYI418YDMG25SdEA6PixCR4SaDLHuVsdKJOZAetN80HzkFV0LPZBESii0FryoVOTkpeNIFPXpBdS+BE6Aa7VIX9Q3azM8s8P6BtLA3HnZwxoc5usljJTeTYspiEpcAnLahV9XPoERdgJOWHA9E/3Ou/QfP8lVLEoPgfJmV7a04rI9yMz7fa4g63Wf72ym2+F+AxrnVziyyW0Ikuq/SMGA0UIarrOVbZBl8XsNeMaIMtGcxQVgZ0Yf25HCySYV3nY0dvIF6JO/WlI6T4AvI9efp6fb8+1Uotsi7NKqXTwWEFyJqfSf3nx9oHqwbmfiHZnMuoPT2tIKyx5r9YlUEVLTXGvE50w9Hv/uVmb0MeIeyT5ZAWewW34kACli2+ZYYyImdT3D/DzvgYcjgNdOVQALzbCD2mwdtouW7iO5A==
x-ms-exchange-antispam-messagedata: 
 aVBFEGEOL2oPP22X0u/DwUz+GseJUgw7fslxwirYZa82MD5nzSCUfGkV+lIJmroaSbLL/CbW01ZbqQxT77Ste/y0iwRwuYlWiXm+pbHdfminVLS8qkz8VysCjqn+wmXoX+90N36GU6W0zY4cNgU3sw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(82740400003)(47076004)(33656002)(2906002)(5660300002)(26826003)(7696005)(9686003)(6506007)(4326008)(478600001)(52536014)(70586007)(70206006)(55016002)(53546011)(356004)(26005)(36906005)(336012)(316002)(6916009)(86362001)(81166006)(186003)(81156014)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c968abf1-107e-44db-c705-08d7d26289e8
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kFFMUCKE8M/56qroQYaiUwhgS6SVVEchdYvl1RxfPVmg0Y8zdqCeDBJOtrMqm16PBcsbGir6VFpr1bNd7gjtJ7bTAzG1/bWN2HZ7z/aamdh1hHO+GO9r9WfhmBwjFHokahe/J9wX4DQ+OZYv+YBImjJ7xhJqEcdKZGgd3zjYubn2H1h2ROzouekTMNMU83mQhcrOHTbfy2UaqJE8BY9fsXSZ5XRNXmFl6KsXSvk13Qt2PE4C7Buj4OGniGmk3gbp4Z7ccchUZ3PFpbfnXXPq1dr5pUL2QB/5rY0nvczLXJg+bLDonfTfvlOWDz2uGXUvSoxe7XCAzQBqgfjRj6VBXN17y0nvklzs7EBL+ApUUF+VE7hhdvyuBIttACqY8/yvy9NDBeSmWW8VR6MHdx+bnXvTLO6HHKws//1S00cixQBufp4Mq2HQrJBQCwxtemR2kgx/PVn47MPIpFJP80B6+o4qAl5UKrHkmST3zKZDsPv+Krc0p/hN9jMXdVuXOy4q52wRbp2+24alyz9HcFp9SKOUQxF2U1vqZP1Zp+58iKBUBvJZ7BrEIj6c2inDdq2O33iIWU3qCA/czPVNdubfueAqXyNVgDu6s9f63hiHk4o20yHOWfyr5dHgj/FkU2N7oaTFr+bt78N4tNf4mEa+Kt+ViEu2KO6Jo/lLA2qQDEurKZHguQHk9q784p8XLRi3EHAWBJhLPn0qw9TsgttgVA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:21:41.8553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a00bc46-bd30-4e36-a97c-08d7d2628d84
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1784
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLWFybUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBPbiBCZWhh
bGYgT2YgQmVydHJhbmQgTWFycXVpcyB2aWEgTGlzdHMuWW9jdG9wcm9qZWN0Lk9yZw0KPiBTZW50
OiAyNyBNYXJjaCAyMDIwIDEwOjUwDQo+IFRvOiBtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogW21ldGEtYXJtXSBbUEFUQ0gg
My83XSBhcm0tYXV0b25vbXk6IENyZWF0ZSBhcm0tYXV0b25vbXktaG9zdA0KPiBpbWFnZQ0KPiAN
Cj4gQ3JlYXRlIG1pbmltYWwgaW1hZ2Ugc3VpdGFibGUgZm9yIGFuIGFybS1hdXRvbm9teS1ob3N0
IGNvbnRhaW5pbmc6DQo+IC0gdGhlIGJvb3QgcGFja2FnZWdyb3VwDQo+IC0gdGhlIHNzaCBzZXJ2
ZXIgcGFja2FnZWdyb3VwDQo+IC0geGVuIGJhc2UgdG9vbHMNCj4gLSBxZW11IChyZXF1aXJlZCB0
byBzdGFydCB4ZW4gZ3Vlc3RzKQ0KPiANCj4gQ2hhbmdlLUlkOiBJZjg2NGZjNmI3NjhjYmU0Y2Ex
OWJmZTI0NzUzYzAwODE0NmI3NTUwYw0KPiBJc3N1ZS1JZDogU0NNLTc2Nw0KPiBTaWduZWQtb2Zm
LWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQoNClJldmll
d2VkLWJ5OiBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bhcm0uY29tPg0KDQo+IC0tLQ0KPiAg
bWV0YS1hcm0tYXV0b25vbXkvUkVBRE1FLm1kICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKw0K
PiAgLi4uL2ltYWdlcy9hcm0tYXV0b25vbXktaG9zdC1pbWFnZS1taW5pbWFsLmJiIHwgMjcgKysr
KysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspDQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1hcm0tYXV0b25vbXkvcmVjaXBlcy1jb3JlL2ltYWdl
cy9hcm0tDQo+IGF1dG9ub215LWhvc3QtaW1hZ2UtbWluaW1hbC5iYg0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEtYXJtLWF1dG9ub215L1JFQURNRS5tZCBiL21ldGEtYXJtLQ0KPiBhdXRvbm9teS9S
RUFETUUubWQgaW5kZXggMWY4MGEwNS4uZDBjNjE4MSAxMDA2NDQNCj4gLS0tIGEvbWV0YS1hcm0t
YXV0b25vbXkvUkVBRE1FLm1kDQo+ICsrKyBiL21ldGEtYXJtLWF1dG9ub215L1JFQURNRS5tZA0K
PiBAQCAtNDAsNiArNDAsMTEgQEAgSW1hZ2VzDQo+ICAtLS0tLS0NCj4gIFRoaXMgbGF5ZXIgaXMg
YWRkaW5nIHRoZSBmb2xsb3dpbmcgaW1hZ2VzOg0KPiANCj4gKyogYXJtLWF1dG9ub215LWhvc3Qt
aW1hZ2UtbWluaW1hbDogdGhpcyBpbWFnZSBpbmNsdWRlcyBhbGwgZWxlbWVudHMNCj4gK3JlcXVp
cmVkDQo+ICsgIHRvIGNyZWF0ZSBhIG1pbmltYWwgYXJtLWF1dG9ub215LWhvc3Qgc3lzdGVtLiBU
aGlzIGluY2x1ZGVzIHhlbiBhbmQNCj4gK3Rvb2xzIHRvDQo+ICsgIG1hbmFnZSB4ZW4gZ3Vlc3Rz
LiBUaGlzIGltYWdlIGRlcGVuZHMgb24gJ2FybS1hdXRvbm9teS1ob3N0Jw0KPiArZGlzdHJpYnV0
aW9uDQo+ICsgIGZlYXR1cmUuDQo+ICsNCj4gIFJlY2lwZXMgYW5kIGNsYXNzZXMNCj4gIC0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIFRoaXMgbGF5ZXIgaXMgYWRkaW5nIHRoZSBmb2xsb3dpbmcgcmVj
aXBlcyBhbmQgY2xhc3NlczoNCj4gZGlmZiAtLWdpdCBhL21ldGEtYXJtLWF1dG9ub215L3JlY2lw
ZXMtY29yZS9pbWFnZXMvYXJtLWF1dG9ub215LWhvc3QtDQo+IGltYWdlLW1pbmltYWwuYmIgYi9t
ZXRhLWFybS1hdXRvbm9teS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2FybS0NCj4gYXV0b25vbXktaG9z
dC1pbWFnZS1taW5pbWFsLmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAuLmZiMGEwYjcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLWFybS1hdXRvbm9teS9y
ZWNpcGVzLWNvcmUvaW1hZ2VzL2FybS1hdXRvbm9teS1ob3N0LWltYWdlLQ0KPiBtaW5pDQo+ICsr
KyBtYWwuYmINCj4gQEAgLTAsMCArMSwyNyBAQA0KPiArIyBSZWNpcGUgdG8gY3JlYXRlIGEgbWlu
aW1hbCBBcm0gQXV0b25vbXkgc3RhY2sgaG9zdCBpbWFnZQ0KPiArDQo+ICtERVNDUklQVElPTiA9
ICJBcm0gQXV0b25vbXkgc3RhY2sgaG9zdCBtaW5pbWFsIGltYWdlIg0KPiArDQo+ICtpbmhlcml0
IGNvcmUtaW1hZ2UNCj4gKw0KPiArTElDRU5TRSA9ICJNSVQiDQo+ICsNCj4gKyPCoEluY2x1ZGVz
IG1pbmltYWwgc2V0IHJlcXVpcmVkIHRvIHN0YXJ0IGFuZCBtYW5hZ2UgZ3Vlc3QuIFRoZSB4ZW4N
Cj4gK3NwZWNpZmljICMgbW9kdWxlcyBhcmUgbm90IGV4cGxpY2l0bHkgaW5jbHVkZWQgYXMgdGhl
eSBhcmUgYnVpbHQgYXMNCj4gK3BhcnQgb2YgdGhlIGtlcm5lbCAjIGltYWdlIGZvciBwZXJmb3Jt
YW5jZSByZWFzb25zLiBJbmNsdWRlcyBhbGwga2VybmVsDQo+ICttb2R1bGVzIGFueXdheSBhcyBp
dCBtYWtlcyAjIGxpZmUgZWFzaWVyIGFuZCBkb2VzIG5vdCBjb3N0IHRoYXQgbXVjaCBpbiBzaXpl
Lg0KPiArSU1BR0VfSU5TVEFMTCArPSAiIFwNCj4gKyAgICBwYWNrYWdlZ3JvdXAtY29yZS1ib290
IFwNCj4gKyAgICBwYWNrYWdlZ3JvdXAtY29yZS1zc2gtb3BlbnNzaCBcDQo+ICsgICAga2VybmVs
LW1vZHVsZXMgXA0KPiArICAgIHhlbi1iYXNlIFwNCj4gKyAgICBxZW11IFwNCj4gKyAgICAiDQo+
ICsNCj4gK3B5dGhvbiBfX2Fub255bW91cygpIHsNCj4gKyAgICBpZiBiYi51dGlscy5jb250YWlu
cygnRElTVFJPX0ZFQVRVUkVTJywgJ2FybS1hdXRvbm9teS1ob3N0JywgRmFsc2UsIFRydWUsDQo+
IGQpOg0KPiArICAgICAgICByYWlzZSBiYi5wYXJzZS5Ta2lwUmVjaXBlKCJESVNUUk9fRkVBVFVS
RVMgZG9lcyBub3QgY29udGFpbg0KPiArJ2FybS1hdXRvbm9teS1ob3N0JyIpDQo+ICsNCj4gKyAg
ICBpZiBiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3hlbicsIEZhbHNlLCBU
cnVlLCBkKToNCj4gKyAgICAgICAgcmFpc2UgYmIucGFyc2UuU2tpcFJlY2lwZSgiRElTVFJPX0ZF
QVRVUkVTIGRvZXMgbm90IGNvbnRhaW4NCj4gKyd4ZW4nIikgfQ0KPiAtLQ0KPiAyLjE3LjENCg0K
