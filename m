Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web11.1075.1589351803230103676
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 23:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HyRK4vNG;
 spf=pass (domain: arm.com, ip: 40.107.21.51, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grXekLahefJ3Ivw7jtGUb3RGqmtqwTSHsJZbzyviK2k=;
 b=HyRK4vNGlip/HdvRi6dvWhBhYOU1w7blDC7np7ZqcdmplVaYwVz/fYk51NV/EuGSzq4ofNBXouHKTsr3opHLODThCJx1vM0hU1hjAOJwR/XIYQ2g5/5QZomO93Ms3UN5n42wA3unvOtEGVaJhdbann4yn76EjI4LbTHXDECZ+JQ=
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by AM5PR0801MB1795.eurprd08.prod.outlook.com (2603:10a6:203:2f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 13 May
 2020 06:36:40 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::93) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 06:36:40 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 06:36:39 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Wed, 13 May 2020 06:36:39 +0000
X-CR-MTA-TID: 64aa7808
Received: from a74bb6dd838c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E16E2C29-06D2-4A54-8DCD-7C2833EBFAE6.1;
	Wed, 13 May 2020 06:36:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a74bb6dd838c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 May 2020 06:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK7OPBc4K+yqApe5j961xweDu4IciI67Eezbnsy2lr2njXppkpCIxknriKkxhDVu9p0pJHNDl2lblHZ+G+/LBmYoPFMPYoTN3TY6HILlPWEyFUGNIh0YYFa4WKhwyJ3Y7HMiTDMqKUw9xxMsugDffQt1vrlqIF9KSPmSo+QYi27iCeu4bg1bYl8aSW0A9mlSiTV+sXVJtNRQ5iZH1m/GN3agk5Ui/3HX7OlLO58k/nQdAoPNtxpf1qLnygmhYcQKP2rLizttbduciWRQLGk9LgoDHuP49o4Q25ER8X4C+mqcG7ZKI9+QEy0EUN/3oN7lz9diFbc0fqiCbDzLYYSezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grXekLahefJ3Ivw7jtGUb3RGqmtqwTSHsJZbzyviK2k=;
 b=JsTw4DQvvoq9vqzCLkDZXBdOMikmT2i1EYrNXauK2hj08ExsDg0J2bJUqLqDcJ4UElhpWK0k2n3WX7SZA0P8JNyXaIs441zUMgdW3YFS0+JDIjlvm+wk3iIgnkI5QI4rJYUaiLEg4gjkWFYt751tI+npJVynBG92+HtGt1g9/xxG+14DVHAhXEXUyq1qy3EO19MpaLLsJAKb9FR9OZTSvUASXJALK9reAoaBmm7C+XPnLNH8wiGQADMkzDFIstWPBivQCUexN4HjR1gkC0W1vZPxnR+NZdiLqpKegcGz5i/VFeIV3LeXsflQguodc+rZMiU8WiK6rCEwhioAhqQi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grXekLahefJ3Ivw7jtGUb3RGqmtqwTSHsJZbzyviK2k=;
 b=HyRK4vNGlip/HdvRi6dvWhBhYOU1w7blDC7np7ZqcdmplVaYwVz/fYk51NV/EuGSzq4ofNBXouHKTsr3opHLODThCJx1vM0hU1hjAOJwR/XIYQ2g5/5QZomO93Ms3UN5n42wA3unvOtEGVaJhdbann4yn76EjI4LbTHXDECZ+JQ=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3553.eurprd08.prod.outlook.com (2603:10a6:208:de::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 13 May
 2020 06:36:32 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.022; Wed, 13 May 2020
 06:36:32 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "ross@burtonini.com" <ross@burtonini.com>, Joshua Watt
	<JPEWhacker@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
Thread-Topic: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
Thread-Index: AQHWKKIXAqGgjJ8ARkGXKYiFmiBQ+qik9YqAgACW3UA=
Date: Wed, 13 May 2020 06:36:32 +0000
Message-ID: 
 <AM0PR08MB39876358C6145076A5ED500192BF0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200512211219.19262-1-JPEWhacker@gmail.com>
 <20200512211219.19262-2-JPEWhacker@gmail.com>
 <CAAnfSTvCvLvO_8cPMvCkCkN7r5HxMzR2TPx0aqWkS2WY9JPLYg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvCvLvO_8cPMvCkCkN7r5HxMzR2TPx0aqWkS2WY9JPLYg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 485a2515-41d2-4607-8bf9-81b6524a16eb.0
x-checkrecipientchecked: true
Authentication-Results-Original: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d11738d-5670-4312-7869-08d7f707fe0e
x-ms-traffictypediagnostic: AM0PR08MB3553:|AM5PR0801MB1795:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB179546586770408664AF914392BF0@AM5PR0801MB1795.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:10000;
x-forefront-prvs: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qJhJPpL8cAIEGrW52Dx2c15LbDoHNXHpngxPfqg5eBw1EwYO+QhdKU8vTB0Xf/KhmrowJ9yhcPiJ5JonNPbUiYbEoJGrMVJcnFyVSSe9fbhuCpRK1QXpgM0bAEWeeYieVECDIeM/64vllWenAbIsiwDdTH4aG57K4m0Tm+dU4QcTfOv45IIpC/B8hkRDuwDeB6TsIBAMH3SC7V+k/pIXF6aT46cYg8fwtd/QWBSOkRAYiPs8Vnx61rW7Q1rV75aSr4zcUQsMKZJ6oNdobhocQydlYsNVfbAHBy8OVG6TXSizoy7e2byWNmcv2+/kdNmCqj/uE3cR5I8j2cch1ETdVa72d/Cu1cLw9wa9vOEk07GpjwVxoYYoBCKJFZIIdeaAoannsyCSd8+x5a6irJo1mW5dkxRCsPtYQPfmiJfLApfxagqbblgKldRL0XuJtCgoJikVu5q3WLj8F8BLuEtqUucDthkp7TxfQNJp29s13292eQhoq5Edyyz9/rHk3N4dwbSOiGitQiXeBJ/LteA+UA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(33430700001)(53546011)(33656002)(66476007)(2906002)(4744005)(110136005)(66446008)(64756008)(66556008)(86362001)(66946007)(76116006)(5660300002)(8936002)(6506007)(316002)(7696005)(71200400001)(26005)(9686003)(52536014)(33440700001)(478600001)(4326008)(186003)(8676002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mtuY+BfAzQVW3Ejo1SF9PA8n5Q03/N36DvF2m/yyCdgOW0mnUhOaadj/PCMHTSeB3cQwbHfFpEEZz/d99nU9sLAAEmkY0KGx4E55aobaOfo2WcPPeUQb19vOqPJ6VIcWiOqQnE2j8Rd4di6jzlAp0cokjxLGanVz+ClTZxypTuny2dbdzE4dOkavDKrv2BNYambTgV5HmDEU9JovU9ImgqNPqpR0sGZMZqQft8posgYf51T62R9Zk1bneH8JtBBVjI5wb7jdJhFQfJTbvaItRWX00aP7JSexMKkPluayJ3GZ8cW4CsMGuQJpEd1ya8RZScEGKweut8jvKe0Uj2P7n4cLc6gM0OOLpJ0aW1fofJgB6JsBp3AmsC7Yy87kL+LpPAl9QU9ivMjvd4o5HiOMQs0yb0kTqyTFyt2YPp9bPxjREzyRbvHRC1qVoXu5LlcR9Ivi/SsNYG1YdwlXW9+3VlHVJbdblGxyvKM7QdvVyHQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3553
Original-Authentication-Results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966005)(33430700001)(186003)(52536014)(478600001)(47076004)(8676002)(70206006)(2906002)(70586007)(86362001)(36906005)(7696005)(6506007)(4326008)(33656002)(81166007)(55016002)(336012)(9686003)(356005)(33440700001)(8936002)(82310400002)(53546011)(26005)(82740400003)(316002)(5660300002)(4744005)(110136005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9b54dda-622d-4e80-de4b-08d7f707f9fd
X-Forefront-PRVS: 0402872DA1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C3V0GvaQ/784UB/WqJ4BikSz5nB5Za8XAxCVRP+NY8sr1BH7iG5Eu1xbRff3noBMBV/flSqbLG1k67UmBwoYzgWZvoqJGFx2rqdC9/SqWBx3+NE/K1F5RLHlMyXRSxaxV0VvqIO1Cd7IqX8FkJgET208SlcdM6qx5AcEiiQpLvwZrps8pGTA5osYGEognTK774BI87skt4+ks3J6lCsgRQLpovVhstXphv9I+XjF/qlq+iF9loelwIwBDygrsE5k2Ecsxb6SP16NzXRdhpdxSthKWaH+pY0GU0u4VTDkUQBASm1BFyQP6KqVfpXXKfSGBt9vkuDi3qM1Px99RpOsIMMlBA3/HoOsoaDA2QJ9ldpy4nclu1Sq6ffVSJowmV0hLuMCZ63rccZha9ycvqp5ovwH37IRs9W0KkuIvx4PrUBp33L0C46Wvdy3/oNKyDzvJVcamB3zdIPz1r9hlWZkbCdslOaSAZJfD4U+Tj2iLxxbqYpw1OTr8vHK3+Goewn4ylk8Xi+R4H49SR2kEt02cvaOFCIF1rYSlLwpY4HSPA+S1QxqIKN0Ytvk63ZA2bFIndOdlXD4cMnmQa/xks4oSQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 06:36:39.4357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d11738d-5670-4312-7869-08d7f707fe0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1795
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBtZXRhLWFybUBsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxtZXRhLWFybUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBPbiBCZWhh
bGYgT2YgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU2VudDogMTIg
TWF5IDIwMjAgMjI6MjINCj4gVG86IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT4N
Cj4gQ2M6IG1ldGEtYXJtQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtt
ZXRhLWFybV1bUEFUQ0ggdjIgMS8yXSB0cnVzdGVkLWZpcm13YXJlLWE6IEJ1aWxkIG91dCBvZiB0
cmVlDQo+DQo+IE9uIFR1ZSwgMTIgTWF5IDIwMjAgYXQgMjI6MTIsIEpvc2h1YSBXYXR0IDxKUEVX
aGFja2VyQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gK0IgPSAiJHtXT1JLRElSfS9idWlsZCINCj4N
Cj4gWW91J2xsIHdhbnQgdG8gZG9fY29uZmlndXJlW2NsZWFuZGlyc10gPSAiJHtCfSIgdG9vLCBy
aWdodD8NCg0KU2luY2Ugd2UgaGF2ZSBkb19jb25maWd1cmVbbm9leGVjXSA9ICIxIiwgd2lsbCB0
aGlzIHdvcms/DQoNCj4NCj4gUm9zcw0KSU1QT1JUQU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9m
IHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkg
YWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9z
ZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9z
ZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsg
eW91Lg0K
