Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.59])
 by mx.groups.io with SMTP id smtpd.web12.14424.1585323055731751180
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o4WaX0ld;
 spf=pass (domain: arm.com, ip: 40.107.0.59, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqwnXvxw1u4CZyiZr2Xq5rbjYgctXyJ+I7u/dRU4+4Y=;
 b=o4WaX0ldkljoqG5GvG0Wax79oICWxpoVTk8sRgZWtbK81kG9F8TEjC/LiaaLb/zUnNmQjddnHdRwM5c/hLctRjVIQZKnyHij7CErxWv0951X70ps8NDtCLGKHJuG3kHllskzaHSEFS2wQyBQV0tk3OQs1D6czcs6GcRAjyXTb8k=
Received: from AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) by DB8PR08MB5434.eurprd08.prod.outlook.com
 (2603:10a6:10:116::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Fri, 27 Mar
 2020 15:30:53 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::9) by AM5PR0201CA0002.outlook.office365.com
 (2603:10a6:203:3d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:30:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:30:52 +0000
Received: ("Tessian outbound d6b3ed9fc62a:v48"); Fri, 27 Mar 2020 15:30:52 +0000
X-CR-MTA-TID: 64aa7808
Received: from f7d02c1d9478.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 65CAADDD-2CE3-400D-98E1-6AAB303C924C.1;
	Fri, 27 Mar 2020 15:30:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7d02c1d9478.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfKDPKkAsCVrPqPsLzfFBPjbKyvFhAaQ/BEVxvkUe5/Tlk+Jz5jU5ZOLmoaGsCnZtIx49SYlDdO+77/TPP7Trh50tYvAtz04xK9qwySRAR4wjNAuQujfd4OWyGGh6PeujDsrUZ/n7mLcbWqXyjp+HRvhqiNbLKKnHGa5euWpia+wtUSz2lkuB2zmpGjHK1E19Sr5+j5oF6N97hE4W+BiJl83iS1TJQEnen3gZcVTI3Vzobq4IzUtRHIScSTbZeZbq5mt7wQ65w4VQj78fRAvGfEMIXnDyhmB05BbcpmEbibcCj3ENZolUdIO29+5f6dQJVZk83gZg+NEX0+C13SLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqwnXvxw1u4CZyiZr2Xq5rbjYgctXyJ+I7u/dRU4+4Y=;
 b=Qn5fDYgykp7h18odGpvkBNzMHu5TkH2W5R9nNqU9l+klAmmg7XAuw49xgLJ0zbxIyZ7pqtJhYx0bnlqpfognyU2KaIpx5f/9KJ9rqVyiYdYtu02YA4BIEOrXqGDYW0fNGLWwnGIReql6MTiVcaNSb3Lgt6omSDceMWrc/H9B8GSCiyT0wcXI/3Bvei+Fz12MG0GbSo4zjwTx97ep8bknBqEVaTiZKwi7VvLYMZ/HmCDVqRNACKrckZsr8ufA0dBjh1cErD28X+DmCM4KynEkz3VtVG7tO3N7BnnHiOKRZZJxJ5yUJTF0pn0xxhqRIKg33janEF3fPFKmy0d6yyPtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqwnXvxw1u4CZyiZr2Xq5rbjYgctXyJ+I7u/dRU4+4Y=;
 b=o4WaX0ldkljoqG5GvG0Wax79oICWxpoVTk8sRgZWtbK81kG9F8TEjC/LiaaLb/zUnNmQjddnHdRwM5c/hLctRjVIQZKnyHij7CErxWv0951X70ps8NDtCLGKHJuG3kHllskzaHSEFS2wQyBQV0tk3OQs1D6czcs6GcRAjyXTb8k=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.215.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:30:47 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:30:47 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Add external guests to host image
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: Add external guests to host
 image
Thread-Index: AQHWBCY2zI14rx+CVUe1n1HMOeiS1qhckQDw
Date: Fri, 27 Mar 2020 15:30:46 +0000
Message-ID: 
 <AM0PR08MB398763EB1289823FFE04FEB692CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105453.561-1-bertrand.marquis@arm.com>
In-Reply-To: <20200327105453.561-1-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 0e2c6c97-8bff-4b53-ba72-adf1ced481c0.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 165f922e-459a-4fe9-8053-08d7d263d601
x-ms-traffictypediagnostic: AM0PR08MB5393:|DB8PR08MB5434:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5434F62E560C3DC7C5669ABB92CC0@DB8PR08MB5434.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(66476007)(55016002)(81166006)(52536014)(64756008)(9686003)(5660300002)(966005)(8676002)(2906002)(7696005)(66556008)(478600001)(81156014)(76116006)(26005)(55236004)(6916009)(66446008)(8936002)(4326008)(86362001)(186003)(71200400001)(316002)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 G9SJT7e8xHpaus93Dq4CFicKzirt/AVj6Bh4MWIp5kf6EXue0NfXKiAacxaQ/3Z9KkpV45QXmN6462f5oPbGHstkzQ6PkUNWEamcU6p3aVUr4vCm/RNQfDGHSwV9t/VcFTVZXZuexCOmL4PxqMksQqYmDlIbDUr7Qw8kbCHHLKNa4xrxM3PIaD6FlHtXIxiB+XAmNBYINcU/0zYIjPqBfqLxAF3ioPAXsRESaa58SDiHpScRAYba4/EO+ZhQxP69mfw2yZSPM8I+hEl8MfSyWoIsX7DNEaEmJIvke5nHGCod+C10d6jjcI+aXIZH059mLQaFwUBHbfJeAfX3QpDAKGDMVFTmvS7CoyfU8sik0rbkt0Jy7aI//eyBq1rn5r20j3wpncouPQDBfhlMw2TuTpdJzqgX3wxzUBiRvbCC+tTGL2d5f7o9HzpsheREkSn/ZzcsOYBaUOpMHtG4vffllEoJwiKt7HYJw0l6Mwi75CK3dI6Xr796sW6K/UGwAkbuT//MMTjt+JbjEG5y5dh9AA==
x-ms-exchange-antispam-messagedata: 
 twSME+uRLgNvFJ2FqmC57vi65XrTCzBZreqWkz7g8/1Z/oTpesuxjKZqn2Cf4ZGrk9VzCcNBiGqgD1IfqbQkBgUzt5e9H0n2kwwIrMLF3r83/zB1nAbHMdyp2JVL9M0gVGad8S+jrpxYEzmO1fsG8A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(82740400003)(6506007)(47076004)(966005)(478600001)(7696005)(53546011)(8676002)(5660300002)(33656002)(26826003)(336012)(186003)(4326008)(26005)(55016002)(8936002)(70586007)(6916009)(70206006)(52536014)(9686003)(316002)(81156014)(81166006)(2906002)(356004)(36906005)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	df414df3-4ec7-46f5-a5b2-08d7d263d26e
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aGzA0jVb7VxfyLYgDhHlP5Uk1FkTzZ03kD9djEaOtqKo9Gms8UKoQNU+SCGXYDZ6cbM7w9nbg7x64vWGd25r6vlUeuZljTc/5P6qKK/VMKepvXaIG47K6iF/QprHUDmA2MbqvI7wLlDhLxVWFCzxaVWJq7Dm1P5zPn+PvbkJTN1yhvTCUUP1rH3cHY2HkroRuAvacdQg6V8nD6bxnwZzokF33eC/pRPZy1OKQgwxiERr3N/kc0ivVarEHvhdeYQqqbNmamXgHIbv4eecl83PopymLLkBHEoiXGtRhncVrp7/oo2I30HML8XZaRop9E5I8sOA7fRe3wWcfpF/fdkc1+OysqRXMLbSMQ6/3ycEdyHtjyiFCHYCVpavQOlwQmKNdN56c8LNPP55l7Pil6VZYopaB/Jz8qFLK+VEYbhfAdsRPyCD+BNKOC2E/4uxfoLgl0M9QDlttZiJRTkF94ynRkmpqrhLK2mQa55esCcHyXScHO7FyheuMKHXNzYykSjZSufvzOJK7aFRmGcMCPzDwvpv3KrOgAkZWGIAodW/bxe6diXrPbfh476AjXlekJVmobvc9kXs3meInjLPWfeijhszdfWV9qbXW4Dh22qyDvM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:30:52.8851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 165f922e-459a-4fe9-8053-08d7d263d601
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5434
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLWFybUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBPbiBCZWhh
bGYgT2YgQmVydHJhbmQgTWFycXVpcyB2aWEgTGlzdHMuWW9jdG9wcm9qZWN0Lk9yZw0KPiBTZW50
OiAyNyBNYXJjaCAyMDIwIDEwOjU1DQo+IFRvOiBtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogW21ldGEtYXJtXSBbUEFUQ0hd
IGFybS1hdXRvbm9teTogQWRkIGV4dGVybmFsIGd1ZXN0cyB0byBob3N0DQo+IGltYWdlDQo+IA0K
PiBBZGQgQVJNX0FVVE9OT01ZX0hPU1RfSU1BR0VfRVhURVJOX0dVRVNUUyB2YXJpYWJsZSB0byBs
ZXQgdXNlcg0KPiBzcGVjaWZpeSBhIGxpc3Qgb2YgZ3Vlc3RzIHRvIGJlIGluY2x1ZGVkIGRpcmVj
dGx5IGluIHRoZSBob3N0IGltYWdlLg0KPiBUaGUgdmFyaWFibGUgY2FuIGJlIHNldCB0byBhIHNw
YWNlIHNlcGFyYXRlZCBsaXN0IG9mIGZ1bGwgcGF0aCB0byB4ZW5ndWVzdCBpbWFnZQ0KPiBmaWxl
cyBvciBTUkNfVVJJIGNvbXBhdGlibGUgdXJscy4gRWFjaCBlbnRyeSBjYW4gYWxzbyBoYXZlIGEN
Cj4gJztndWVzdG5hbWU9TkFNRScgYXJndW1lbnQgdG8gc2V0IHRoZSBkZXN0aW5hdGlvbiBuYW1l
IG9mIHRoZSBndWVzdCBhZGRlZC4NCj4gDQo+IENoYW5nZS1JZDogSTRmYzVlNTNkZjk3OWI3OTJh
ZDkzMDA2NmEwNjhhZDFkNDUxMmM5OTENCj4gSXNzdWUtSWQ6IFNDTS03NjcNCj4gU2lnbmVkLW9m
Zi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpSZXZp
ZXdlZC1ieTogRGllZ28gU3VlaXJvIDxkaWVnby5zdWVpcm9AYXJtLmNvbT4NCg0KPiAtLS0NCj4g
IC4uLi9pbWFnZXMvYXJtLWF1dG9ub215LWhvc3QtaW1hZ2UtbWluaW1hbC5iYiB8IDg1ICsrKysr
KysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS1hcm0tYXV0b25vbXkvcmVjaXBlcy1jb3JlL2ltYWdlcy9hcm0t
YXV0b25vbXktaG9zdC0NCj4gaW1hZ2UtbWluaW1hbC5iYiBiL21ldGEtYXJtLWF1dG9ub215L3Jl
Y2lwZXMtY29yZS9pbWFnZXMvYXJtLQ0KPiBhdXRvbm9teS1ob3N0LWltYWdlLW1pbmltYWwuYmIN
Cj4gaW5kZXggMTBjNmU0Yi4uOTc4YjU4ZiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1hcm0tYXV0b25v
bXkvcmVjaXBlcy1jb3JlL2ltYWdlcy9hcm0tYXV0b25vbXktaG9zdC1pbWFnZS0NCj4gbWluaW1h
bC5iYg0KPiArKysgYi9tZXRhLWFybS1hdXRvbm9teS9yZWNpcGVzLWNvcmUvaW1hZ2VzL2FybS1h
dXRvbm9teS1ob3N0LWltYWdlLQ0KPiBtaW5pDQo+ICsrKyBtYWwuYmINCj4gQEAgLTUsNiArNSwz
MSBAQCBERVNDUklQVElPTiA9ICJBcm0gQXV0b25vbXkgc3RhY2sgaG9zdCBtaW5pbWFsDQo+IGlt
YWdlIg0KPiAgaW5oZXJpdCBjb3JlLWltYWdlDQo+IA0KPiAgTElDRU5TRSA9ICJNSVQiDQo+ICtM
SUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly8ke0NPTU1PTl9MSUNFTlNFX0RJUn0vTUlUO21k
NT0wODM1YWRlNjk4ZTBiY2Y4NTA2ZWNkYTJmN2INCj4gNGYzMDIiDQo+ICsNCj4gKyMgVGhlIEFS
TV9BVVRPTk9NWV9IT1NUX0lNQUdFX0VYVEVSTl9HVUVTVFMgdmFyaWFibGUgY2FuIGJlDQo+IHVz
ZWQgdG8NCj4gK2luY2x1ZGUgaW4gdGhlICMgaW1hZ2Ugb25lIG9yIHNldmVyYWwgeGVuZ3Vlc3Qg
aW1hZ2VzLg0KPiArIyBUaGUgbGlzdCBtdXN0IGJlIHNwYWNlIHNlcGFyYXRlZCBhbmQgZWFjaCBl
bnRyeSBtdXN0IGhhdmUgdGhlDQo+ICtmb2xsb3dpbmcgIyBmb3JtYXQ6IFVSTFs7Z3Vlc3RuYW1l
PU5BTUVdICMgIC0gVVJMIGNhbiBiZSB0aGUgZnVsbCBwYXRoDQo+ICt0byBhIGZpbGUgb3IgYSBZ
b2N0byBjb21wYXRpYmxlIFNSQ19VUkkgdXJsICMgIC0gZ3Vlc3RuYW1lPU5BTUUgY2FuIGJlDQo+
ICt1c2VkIHRvIHNwZWNpZnkgdGhlIG5hbWUgb2YgdGhlIGd1ZXN0LiBJZiBub3QNCj4gKyMgICAg
c3BlY2lmaWVkIHRoZSBiYXNlbmFtZSBvZiB0aGUgZmlsZSAod2l0aG91dCAueGVuZ3Vlc3QgZXh0
ZW5zaW9uKSBpcyB1c2VkLg0KPiArIyAgSGVyZSBhcmUgZXhhbXBsZXMgb2YgdmFsdWVzOg0KPiAr
IyAgL2hvbWUvbXlkaXIvbXlndWVzdC54ZW5ndWVzdDtndWVzdG5hbWU9Z3Vlc3QxDQo+ICsjICBo
dHRwOi8vd3d3LnVybC5jb20vdGVzdGd1ZXN0Lnhlbmd1ZXN0DQo+ICsjDQo+ICsjICBJZiB5b3Ug
YXJlIHVzaW5nIHRoZSBvdXRwdXQgb2YgYW4gb3RoZXIgWW9jdG8gcHJvamVjdCwgeW91IHNob3Vs
ZA0KPiArdXNlIHRoZSAjICBmdWxsIHBhdGggc3ludGF4IGluc3RlYWQgb2YgdGhlIFlvY3RvIFNS
Q19VUkkgdG8gYmUgYWJsZSB0bw0KPiArdXNlIHRoZSAjICBzeW1saW5rIHZlcnNpb24gb2YgeW91
ciBpbWFnZSAoYXMgdGhlIHJlYWwgZmlsZSBoYXMgYSBuZXcNCj4gK25hbWUgb24gZWFjaCAjICBi
dWlsZCBhcyBpdCBpbmNsdWRlcyB0aGUgZGF0ZSkuIFlvdSBtdXN0IG5vdCB1c2UNCj4gK1NSQ19V
UkkgdHlwZSBmaWxlOi8vIGFzICMgIGl0IHdpbGwgdHJ5IHRvIGluY2x1ZGUgdGhlIHN5bWxpbmsg
YW5kIG5vdA0KPiArdGhlIGRlc3RpbmF0aW9uIGZpbGUgd2hpY2ggd2lsbCAjICBiZSBkZXRlY3Rl
ZCBieSB0aGUgcmVjaXBlIGFuZCBvdXRwdXQgYW4gZXJyb3INCj4gJ0d1ZXN0IGZpbGUgaXMgYSBz
eW1saW5rJy4NCj4gKyMNCj4gKyMgIEd1ZXN0cyBjYW4gYWxzbyBiZSBhZGRlZCB1c2luZyBhIGJi
YXBlbmQgdG8gdGhpcyByZWNpcGUgYnkgYWRkaW5nDQo+ICtlbnRyaWVzICMgIHRvIFNSQ19VUkkg
d2l0aCBwYXJhbWV0ZXIgO2d1ZXN0bmFtZT1OQU1FIHRvIHNwZWNpZnkgdGhlDQo+ICtkZXN0aW5h
dGlvbiAjICBndWVzdG5hbWUuIFRoZSBwYXJhbWV0ZXIgZ3Vlc3RuYW1lIG11c3QgYmUgcHJlc2Vu
dCBhcyBpdA0KPiAraXMgdXNlZCB0byBkZXRlY3QgIyAgZ3Vlc3RzIHRvIGJlIGFkZGVkDQo+ICtB
Uk1fQVVUT05PTVlfSE9TVF9JTUFHRV9FWFRFUk5fR1VFU1RTID8/PSAiIg0KPiANCj4gICPCoElu
Y2x1ZGVzIG1pbmltYWwgc2V0IHJlcXVpcmVkIHRvIHN0YXJ0IGFuZCBtYW5hZ2UgZ3Vlc3QuIFRo
ZSB4ZW4gc3BlY2lmaWMgICMNCj4gbW9kdWxlcyBhcmUgbm90IGV4cGxpY2l0bHkgaW5jbHVkZWQg
YXMgdGhleSBhcmUgYnVpbHQgYXMgcGFydCBvZiB0aGUga2VybmVsIEBAIC0NCj4gMjksNCArNTQs
NjQgQEAgcHl0aG9uIF9fYW5vbnltb3VzKCkgew0KPiANCj4gICAgICBpZiBiYi51dGlscy5jb250
YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3hlbicsIEZhbHNlLCBUcnVlLCBkKToNCj4gICAgICAg
ICAgcmFpc2UgYmIucGFyc2UuU2tpcFJlY2lwZSgiRElTVFJPX0ZFQVRVUkVTIGRvZXMgbm90IGNv
bnRhaW4gJ3hlbiciKQ0KPiArDQo+ICsgICAgIyBDaGVjayBpbiBBUk1fQVVUT05PTVlfSE9TVF9J
TUFHRV9FWFRFUk5fR1VFU1RTIGZvciBleHRyYQ0KPiBndWVzdHMgYW5kIGFkZCB0aGVtDQo+ICsg
ICAgIyB0byBTUkNfVVJJIHdpdGggeGVuZ3Vlc3QgcGFyYW1ldGVyIGlmIG5vdCBzZXQNCj4gKyAg
ICBndWVzdGxpc3QgPSBkLmdldFZhcignQVJNX0FVVE9OT01ZX0hPU1RfSU1BR0VfRVhURVJOX0dV
RVNUUycpDQo+ICsgICAgaWYgZ3Vlc3RsaXN0Og0KPiArICAgICAgICBmb3IgZ3Vlc3QgaW4gZ3Vl
c3RsaXN0LnNwbGl0KCk6DQo+ICsgICAgICAgICAgICAjIElmIHRoZSB1c2VyIGp1c3Qgc3BlY2lm
aWVkIGEgZmlsZSBpbnN0ZWFkIG9mIGZpbGU6Ly9GSUxFLCBhZGQNCj4gKyAgICAgICAgICAgICMg
dGhlIGZpbGU6Ly8gcHJlZml4DQo+ICsgICAgICAgICAgICBpZiBndWVzdC5zdGFydHN3aXRoKCcv
Jyk6DQo+ICsgICAgICAgICAgICAgICAgZ3Vlc3RmaWxlID0gJycNCj4gKyAgICAgICAgICAgICAg
ICBndWVzdG5hbWUgPSAnJw0KPiArICAgICAgICAgICAgICAgIGlmICc7Z3Vlc3RuYW1lPScgaW4g
Z3Vlc3Q6DQo+ICsgICAgICAgICAgICAgICAgICAgICMgdXNlciBzcGVjaWZpZWQgYSBndWVzdG5h
bWUNCj4gKyAgICAgICAgICAgICAgICAgICAgZ3Vlc3RuYW1lID0gZ3Vlc3Quc3BsaXQoJztndWVz
dG5hbWU9JylbMV0NCj4gKyAgICAgICAgICAgICAgICAgICAgZ3Vlc3RmaWxlID0gZ3Vlc3Quc3Bs
aXQoJztndWVzdG5hbWU9JylbMF0NCj4gKyAgICAgICAgICAgICAgICBlbHNlOg0KPiArICAgICAg
ICAgICAgICAgICAgICAjIG5vIGd1ZXN0bmFtZSBzbyB1c2UgdGhlIGJhc2VuYW1lDQo+ICsgICAg
ICAgICAgICAgICAgICAgIGd1ZXN0bmFtZSA9IG9zLnBhdGguYmFzZW5hbWUoZ3Vlc3QpDQo+ICsg
ICAgICAgICAgICAgICAgICAgIGd1ZXN0ZmlsZSA9IGd1ZXN0DQo+ICsgICAgICAgICAgICAgICAg
IyBpbiBjYXNlIHdlIGhhdmUgYSBsaW5rIHdlIG5lZWQgdGhlIGRlc3RpbmF0aW9uDQo+ICsgICAg
ICAgICAgICAgICAgZ3Vlc3RmaWxlID0gb3MucGF0aC5yZWFscGF0aChndWVzdGZpbGUpDQo+ICsN
Cj4gKyAgICAgICAgICAgICAgICAjIG1ha2Ugc3VyZSB0aGUgZmlsZSBleGlzdCB0byBnaXZlIGEg
bWVhbmluZ2Z1bGwgZXJyb3INCj4gKyAgICAgICAgICAgICAgICBpZiBub3Qgb3MucGF0aC5leGlz
dHMoZ3Vlc3RmaWxlKToNCj4gKyAgICAgICAgICAgICAgICAgICAgcmFpc2UNCj4gKyBiYi5wYXJz
ZS5Ta2lwUmVjaXBlKCJBUk1fQVVUT05PTVlfSE9TVF9JTUFHRV9FWFRFUk5fR1VFU1RTDQo+IGVu
dHJ5IGRvZXMNCj4gKyBub3QgZXhpc3Q6ICIgKyBndWVzdCkNCj4gKw0KPiArICAgICAgICAgICAg
ICAgICMgSW4gY2FzZSB0aGUgZmlsZSBpcyBhIHN5bWxpbmsgbWFrZSBzdXJlIHdlIHVzZSB0aGUg
ZGVzdGluYXRpb24NCj4gKyAgICAgICAgICAgICAgICBkLmFwcGVuZFZhcignU1JDX1VSSScsICAn
IGZpbGU6Ly8nICsgZ3Vlc3RmaWxlICsgJztndWVzdG5hbWU9JyArDQo+IGd1ZXN0bmFtZSkNCj4g
KyAgICAgICAgICAgIGVsc2U6DQo+ICsgICAgICAgICAgICAgICAgIyB3ZSBoYXZlIGEgWW9jdG8g
VVJMDQo+ICsgICAgICAgICAgICAgICAgdHJ5Og0KPiArICAgICAgICAgICAgICAgICAgICBfLCBf
LCBwYXRoLCBfLCBfLCBwYXJtID0gYmIuZmV0Y2guZGVjb2RldXJsKGd1ZXN0KQ0KPiArICAgICAg
ICAgICAgICAgICAgICAjIGZvcmNlIGd1ZXN0bmFtZSBwYXJhbSBpbiBpZiBub3QgYWxyZWFkeSB0
aGVyZQ0KPiArICAgICAgICAgICAgICAgICAgICBpZiBub3QgJ2d1ZXN0bmFtZScgaW4gcGFybToN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGd1ZXN0ICArPSAnO2d1ZXN0bmFtZT0nICsgb3Mu
cGF0aC5iYXNlbmFtZShwYXRoKQ0KPiArICAgICAgICAgICAgICAgICAgICBkLmFwcGVuZFZhcign
U1JDX1VSSScsICcgJyArIGd1ZXN0KQ0KPiArICAgICAgICAgICAgICAgIGV4Y2VwdDoNCj4gKyAg
ICAgICAgICAgICAgICAgICAgcmFpc2UNCj4gKyBiYi5wYXJzZS5Ta2lwUmVjaXBlKCJBUk1fQVVU
T05PTVlfSE9TVF9JTUFHRV9FWFRFUk5fR1VFU1RTDQo+IGNvbnRhaW5zIGFuDQo+ICsgaW52YWxp
ZCBlbnRyeTogIiArIGd1ZXN0KQ0KPiAgfQ0KPiArDQo+ICtweXRob24gYWRkX2V4dGVybl9ndWVz
dHMgKCkgew0KPiArICAgICMgRGVzdGluYXRpb24gZGlyZWN0b3J5IG9uIHRoZSByb290ZnMNCj4g
KyAgICBndWVzdGRpciA9IGQuZ2V0VmFyKCdJTUFHRV9ST09URlMnKSArIGQuZ2V0VmFyKCdkYXRh
ZGlyJykgKyAnL2d1ZXN0cycNCj4gKw0KPiArICAgICMgUGFyc2UgU1JDX1VSSSBmb3IgZmlsZXMg
d2l0aCA7Z3Vlc3RuYW1lPSBwYXJhbWV0ZXINCj4gKyAgICBzcmNfdXJpID0gZC5nZXRWYXIoJ1NS
Q19VUkknKQ0KPiArICAgIGZvciBlbnRyeSBpbiBzcmNfdXJpLnNwbGl0KCk6DQo+ICsgICAgICAg
IF8sIF8sIHBhdGgsIF8sIF8sIHBhcm0gPSBiYi5mZXRjaC5kZWNvZGV1cmwoZW50cnkpDQo+ICsg
ICAgICAgIGlmICdndWVzdG5hbWUnIGluIHBhcm06DQo+ICsgICAgICAgICAgICBpZiBvcy5wYXRo
LmlzbGluayhwYXRoKToNCj4gKyAgICAgICAgICAgICAgICBiYi5mYXRhbCgiR3Vlc3QgZmlsZSBp
cyBhIHN5bWxpbms6ICIgKyBwYXRoKQ0KPiArICAgICAgICAgICAgYmIudXRpbHMubWtkaXJoaWVy
KGd1ZXN0ZGlyKQ0KPiArICAgICAgICAgICAgZHN0bmFtZSA9IHBhcm1bJ2d1ZXN0bmFtZSddDQo+
ICsgICAgICAgICAgICAjIEFkZCBmaWxlIGV4dGVuc2lvbiBpZiBub3QgdGhlcmUNCj4gKyAgICAg
ICAgICAgIGlmIG5vdCBkc3RuYW1lLmVuZHN3aXRoKCcueGVuZ3Vlc3QnKToNCj4gKyAgICAgICAg
ICAgICAgICBkc3RuYW1lICs9ICcueGVuZ3Vlc3QnDQo+ICsgICAgICAgICAgICBiYi51dGlscy5j
b3B5ZmlsZShwYXRoLCBndWVzdGRpciArICcvJyArIGRzdG5hbWUpIH0NCj4gKw0KPiArSU1BR0Vf
UFJFUFJPQ0VTU19DT01NQU5EICs9ICJhZGRfZXh0ZXJuX2d1ZXN0czsgIg0KPiArDQo+IC0tDQo+
IDIuMTcuMQ0KDQo=
