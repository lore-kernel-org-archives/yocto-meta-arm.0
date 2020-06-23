Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.63])
 by mx.groups.io with SMTP id smtpd.web12.2374.1592898473677312961
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Jun 2020 00:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FwNwb+65;
 spf=pass (domain: arm.com, ip: 40.107.21.63, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg1F094DneDUWrh2gUhk2FNgte0F0IJGmmPpu+5KEds=;
 b=FwNwb+65EUUgVuZYaew2qyPO73zzlsR2+1EpP93HmrryIW8PaCnFM9R33rj3unREocli9C2YgyU8jQpx3qBKavcvhtp1nmytYtCk73qMpaNpoXIUavwDVSRyfWyonFIc96q3xGH2X/7TwcHja3qKl25nJWCCzzaP4GmkGtd/80M=
Received: from MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::33)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Tue, 23 Jun
 2020 07:47:51 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::af) by MRXP264CA0045.outlook.office365.com
 (2603:10a6:500:14::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.24 via Frontend
 Transport; Tue, 23 Jun 2020 07:47:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 07:47:50 +0000
Received: ("Tessian outbound 8fb20e43acb7:v59"); Tue, 23 Jun 2020 07:47:50 +0000
X-CR-MTA-TID: 64aa7808
Received: from d6ab6871fb6c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 37FA41D8-C024-47EA-BF27-88301176AFEA.1;
	Tue, 23 Jun 2020 07:47:45 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6ab6871fb6c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Jun 2020 07:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGytXWNZ66i/6dWo8C9VcAHQAPI7UjZHiYInE4EpRwbP16TpXlLjevkdqWSLVMpJ25mBMHpLP1iI3iIJqpbfPWfuZEK5ZsedWBrKnGwfWMGPotHPWiSKZENcJAxTFRMeojAbLKo1e1HM80tqDnG0AbDeOHQvcUECAJHJAWBeHXnEZQ1F9ew6HcNT+IacE5IaCjgFjlDr3Dknbws9c7mQhpTS4zNWHeZ6xFgkiyWXl6R1kewEnut2HxFT8n4Kokyp2M0p5iY94f+5Q84NFQ8Z2jPV5I2l4IJcNlm1hDF5ZRaxL7KQc102tpULC9JyEdKW/gq/hrUd5SAuLu+dmwXZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg1F094DneDUWrh2gUhk2FNgte0F0IJGmmPpu+5KEds=;
 b=lg5xZaGr1x+obMfUs5dXVaQgl1G8HMkiCHXpw//ak/ja8IKaVZwkYSGIiXssqgwZc6kT+szK1nnasErvObWfZhxc4k+ZkYqBDeFiftuQYM/6U6kLZqUGS9bARldYZoyU2MOPL7RFygMi4ww5mYE6FjXRKprBCCoNV34m1vwpqZKPwatn1UNgt8KgX09/W/jtnLuMxZSudw3V6uksEkhyxoAhtbvOTRMonCh8fdWgIaSEDaPKlvnphFlp2nmf/pfvUUyJe5HKWEns9uCgdrmHi+9wnme6eeD9zWdlavYB9/Jardlpiur7iIYY2xRXBzWrbd7SyrmammAqX5x2cuqFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg1F094DneDUWrh2gUhk2FNgte0F0IJGmmPpu+5KEds=;
 b=FwNwb+65EUUgVuZYaew2qyPO73zzlsR2+1EpP93HmrryIW8PaCnFM9R33rj3unREocli9C2YgyU8jQpx3qBKavcvhtp1nmytYtCk73qMpaNpoXIUavwDVSRyfWyonFIc96q3xGH2X/7TwcHja3qKl25nJWCCzzaP4GmkGtd/80M=
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2512.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 07:47:44 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Tue, 23 Jun
 2020 07:47:43 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: Ross Burton <ross@burtonini.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/6] arm-toolchain: armcompiler: Add Arm Clang recipe
Thread-Topic: [meta-arm] [PATCH 2/6] arm-toolchain: armcompiler: Add Arm Clang
 recipe
Thread-Index: AQHWSGTTzX+/3XTa5EG1Pa/5+ltH5Kjk81MAgADezVA=
Date: Tue, 23 Jun 2020 07:47:42 +0000
Message-ID: 
 <VI1PR0802MB2414F98E1E5A0DAB62E798BC8E940@VI1PR0802MB2414.eurprd08.prod.outlook.com>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
 <20200622071401.2570-3-gabor.abonyi@arm.com>
 <CAAnfSTvpWeYMN-X8csZLBqsgHtZbu0XTvuG7QTdW-44BPoGeMg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvpWeYMN-X8csZLBqsgHtZbu0XTvuG7QTdW-44BPoGeMg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: c35ce2d6-d3c5-4258-b995-22b89028606a.1
x-checkrecipientchecked: true
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c9a7191-d58f-49a8-4ade-08d81749bacc
x-ms-traffictypediagnostic: VI1PR0802MB2512:|AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3841CE607102857B3ED47C218E940@AM0PR08MB3841.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sAzaEnfgSa+p/fcygLX0XQKwgBCoYvwTVmZvnmEFZPP3IfAND4+TOSdChEpkYdXwqulTPruHt+hJLQXOrn1ko4KfOSUdWCj3MYCv1TgwAqXyfxxumRuW4Q/LrDump80ZJY1I+lwaJiYdn7NqEB0S72jIce6xx4bI86YVttcDuzDYaGh1OIq+EWauJvrKy6PlX0Y52QbAMx7mBWiu8fZLhc0fMYv5ztDivoscrj3ioa4Le9lAWDU2GrgXzIQ+7Rk8Uo4FxkCVSnLaND1ZZvNhKblLYGguo6hqeXZPuUJGIl1HktAdiNiZJZrNNXsUOarj475PRe93Ex5mHED22mW6FA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(52536014)(53546011)(6506007)(6916009)(4744005)(83380400001)(86362001)(186003)(5660300002)(26005)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(478600001)(2906002)(33656002)(7696005)(71200400001)(316002)(4326008)(8936002)(9686003)(54906003)(8676002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 OcgZg4SOJOfClziWSz1pkrK3Yjz5yzUFw0e/fKedbnZe45MbcJ/rw9V/fOID6hpg/sFVJMfA//l6QZX0GQIkiChVNjEqFfxH2agsVRgdLvLMBpgIIXSbNK71tyxkOLZ3yWbftU4yzzb/7OgK9vJO4MuRk7iwx5/ZIHVLq582KmD+71Gj7G0nYxvUKAHin2a1LRWYyNFQMT1a82oSOI+b2mbfB/+ymnCmYWS7+lA9MTfQLVnSgCEYVTluqSxOUzRamyRMccjqyhzSy4arKUoUk4sZQE3Fq5y9N0FGdMRUe3Br5zMXq3Aye0sVVuU0WNb18hKU7Ju+3379dN5cFhBhd3uUP32s6SW9kBn1vcbdZSmN6Aw38IYuzlwcklxaSzOBA6BZ7dk12/6aAeFTNlQrLIbYhZWjWgMsyRKg+Wz3RDKbFMgFINDf4Xjw9e/26J4Cl90u/cIZwnsqOaIgnh1OfyfDGMMFLnZPhdVQKbcde2g=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2512
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(36906005)(26005)(33656002)(54906003)(9686003)(70586007)(70206006)(82310400002)(55016002)(83380400001)(86362001)(5660300002)(4326008)(6862004)(6506007)(53546011)(7696005)(47076004)(478600001)(2906002)(186003)(336012)(52536014)(316002)(4744005)(356005)(81166007)(82740400003)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed7f230f-3b68-4bca-665a-08d81749b639
X-Forefront-PRVS: 04433051BF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SFJrLSDm2miM8nKWqOZpARlB8DQapFU0fTsQVxx3EzFJhnPda84DzGL88KXxChy0ZqCbuSlU9AAprApxhuSwe4OjcqTVwzDZF6Y/ygrHxafJNTHEg6SsY7T8NAyQ2libz2Uqp3B5WDbOZmDse6e6704PlendoigVFZssmi+huh711AQ9awiyCTOa4Zdfoh5AaoVze7RaLYAaVgpxO1fLmBjDvU2i9EZWBQR0ilg03dFljnEXooqL6CbHGHTydXWphLSYFXvL1/O+DRfWL10r+9PHO8mKZIsxVED+LCGla4GldZINCAGJm34kAjtOPueKIZURRmS1YvYY7FHtMZFGIJgI6AC0tBee6STNaJYLAshAxUQy+3WV7Dop2HrcglLO5t2eU5dmI5YAXVRp8IHjsw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 07:47:50.5827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9a7191-d58f-49a8-4ade-08d81749bacc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXQgaXMgcmVxdWlyZWQgZm9yIGNlcnRhaW4gb3B0aW1pemF0aW9ucy4gVXN1YWxseSBBcm0gQ2xh
bmcgcmVzdWx0cyBpbiBzbWFsbGVyIGNvZGUgc2l6ZSwgd2hpY2ggY2FuIGJlIGtleSB0byBNLWNs
YXNzLg0KVXN1YWxseSBzb21lb25lIGRlYWxpbmcgd2l0aCBURi1NIG9uIGEgbW9yZSBzZXJpb3Vz
IGxldmVsLCB1c2VzIEFybSBDbGFuZyBhdCBzb21lIHBvaW50IG9mIHRoZSBkZXZlbG9wbWVudC4N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvc3MgQnVydG9uIDxyb3NzQGJ1
cnRvbmluaS5jb20+IA0KU2VudDogMjAyMC4gasO6bml1cyAyMi4sIGjDqXRmxZEgMjA6MjINClRv
OiBHYWJvciBBYm9ueWkgPEdhYm9yLkFib255aUBhcm0uY29tPg0KQ2M6IG1ldGEtYXJtQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmc7IG5kIDxuZEBhcm0uY29tPg0KU3ViamVjdDogUmU6IFttZXRhLWFy
bV0gW1BBVENIIDIvNl0gYXJtLXRvb2xjaGFpbjogYXJtY29tcGlsZXI6IEFkZCBBcm0gQ2xhbmcg
cmVjaXBlDQoNCk9uIE1vbiwgMjIgSnVuIDIwMjAgYXQgMDg6MTUsIEdhYm9yIEFib255aSA8Z2Fi
b3IuYWJvbnlpQGFybS5jb20+IHdyb3RlOg0KPg0KPiBBZGRzIEFybSBDbGFuZyByZWNpcGUgdG8g
cHVsbCBkb3duIHRoZSBwcmVidWlsdCBBcm1jb21waWxlciBmb3IgDQo+IGNvbXBpbGluZyBmb3Ig
Q29ydGV4LUEsIENvcnRleC1SLCBhbmQgQ29ydGV4LU0gcHJvY2Vzc29ycyBmcm9tIEFSTS4NCj4g
VGhpcyB0b29sY2hhaW4gaXMgcmVxdWlyZWQgdG8gYnVpbGQgQXJtIHRydXN0ZWQtZmlybXdhcmUt
bSB3aXRoIA0KPiBkaWZmZXJlbnQgb3B0aW1pc2F0aW9ucyB0aGFuIEdDQyBjYW4gcHJvdmlkZSBm
b3IgTS1jbGFzcyBwcm9jZXNzb3JzLg0KDQpSZXF1aXJlZCB0byBidWlsZCB0Zm0sIG9yIG9wdGlv
bmFsbHkgdXNlZnVsIGlmIGJ1aWxkaW5nIHRmbT8NCg0KUm9zcw0K
