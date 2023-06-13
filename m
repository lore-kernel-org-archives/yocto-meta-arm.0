Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF73EB64DB
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 21:15:11 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.46])
 by mx.groups.io with SMTP id smtpd.web11.2609.1686690904183252680
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 14:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dwilb+PU;
 spf=pass (domain: arm.com, ip: 40.107.105.46, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de39vkEG+H3r5odh5TD1sr5eSfuG7cjTm7oT8J6oaP0=;
 b=dwilb+PUTOGIoN8GOcY4WZmecbx8vKgh8lsz/7H+snjZoZgf1mpi1370Q3Fi+ViZm21m6+RgAeokrL8/VCjmf+rjx2rKCnocqt0aqTW8Eny04qmpbRwO7J2fzhBZkLDwvsNEromyPea+JNk8X77lyj8TZVoo2jAZdE8sLyTzgaY=
Received: from DB6PR07CA0099.eurprd07.prod.outlook.com (2603:10a6:6:2c::13) by
 AS4PR08MB7531.eurprd08.prod.outlook.com (2603:10a6:20b:4fa::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Tue, 13 Jun 2023 21:14:55 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::f3) by DB6PR07CA0099.outlook.office365.com
 (2603:10a6:6:2c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.22 via Frontend
 Transport; Tue, 13 Jun 2023 21:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.27 via Frontend Transport; Tue, 13 Jun 2023 21:14:54 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Tue, 13 Jun 2023 21:14:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71f1e464d9a7ce7a
X-CR-MTA-TID: 64aa7808
Received: from 89f4eb557af9.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BE7A7DC4-398B-445D-A929-7699167D6804.1;
	Tue, 13 Jun 2023 21:14:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89f4eb557af9.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Jun 2023 21:14:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+L2y3XqZlESjiWLDd/7txKXkssL6JhwyVx7mG7uaVivj1+oOVvDVrq+q21Elorf417ShgrpipGDw2CM+Pr72LACwL94x17OSF2JgOXCiOXtl/Qj0w6CTQSXssxVfj3a0AeQ0kvg80AVt/Adpw6tOiOoiY8fzTuOnXuF6Gq4A8dhIK8S/EDvopB5QRzRh+g+9z02cMAXMwVAaBysWKCLwNuMcfS9JB9FVGRooF4lz49NOdMv7VOVf6C34UUsC4bWR7/g+//LLR1TBsUxA7YzLhaiGBAuP9d5vdjw8WrWNdKyZaOhTRSwwX/hP8kPTzoeAC77CrTaCYmYErfnWbhGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de39vkEG+H3r5odh5TD1sr5eSfuG7cjTm7oT8J6oaP0=;
 b=W5XPCFobbcOsG/bTfAnq+Omg4aZ8NqzxbS0Q1wgKplink2t2kBsvZAso9KKqCKqYJD8tCnWCqBYqZ5Exh9tmjze9xRlan1FFrRkKDc4eliKkoT+wBop1d28O18xBsy2OTIWJBCJRlFzF1iW3Ofct3K+afLCsVAFh2hlQC4jgwt+dHmgOI0XgUDVCh2W4fwsBcY3lrnEYwXSHsvJVJxP18XLRl5sHc1hhJ78+Gd+kURygoXJE8hHGZh+VOgDKslc33EBREieGiZY7NUXPRtzMiyoKFr8zlbhlN7wHT8wZ4KMBtgkdhBRN8jEFy+ggmbNCbVtBHpzaltPIv8+nPxxu+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=de39vkEG+H3r5odh5TD1sr5eSfuG7cjTm7oT8J6oaP0=;
 b=dwilb+PUTOGIoN8GOcY4WZmecbx8vKgh8lsz/7H+snjZoZgf1mpi1370Q3Fi+ViZm21m6+RgAeokrL8/VCjmf+rjx2rKCnocqt0aqTW8Eny04qmpbRwO7J2fzhBZkLDwvsNEromyPea+JNk8X77lyj8TZVoo2jAZdE8sLyTzgaY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10240.eurprd08.prod.outlook.com (2603:10a6:102:366::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 21:14:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 21:14:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Gyorgy Szing <Gyorgy.Szing@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS version
Thread-Topic: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS version
Thread-Index: AQHZikR+hmF+V6kO9UOtJvYLrPQvza+H2SkAgAEWqICAAF6VAIAAFSgA
Date: Tue, 13 Jun 2023 21:14:43 +0000
Message-ID: <BC8E801D-C6A8-47D5-8476-9FFFC403F4E9@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
 <20230612214256.GS9226@denix.org>
 <219D22AE-6AAE-493F-B4DE-C340B852C8A2@arm.com>
 <20230613195848.GT9226@denix.org>
In-Reply-To: <20230613195848.GT9226@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10240:EE_|DBAEUR03FT059:EE_|AS4PR08MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e3703c7-cd71-418f-9704-08db6c533c0b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 X8T6ox2cjmRkAUYMhyeihKNGqcq/e4aSOovhZLvpU0q3hP7g2IoZcnuCNG186Wi0OFZGku4gOa1BoHtSNqPE+FVh1VifH10/y6sCmfwN4w3Pj1RxY2NdxxLbTYuzC2htZJQ965RAdgOXYZ4fJPuP099E8WCyQ37BUNpkNAz/0rOP38itVs9ouFaL+wC5GPxP+9RVY/xHGGz8SL3AIW1pAkpx2ZzALgoDt+nVKzYBDZAIHPwYuIQMEvgBWlXAE80pLfNlZZEN+fsFO5YZWXrwH6ohQmUiNoiMDuW09B7hTzX4UXF+b5XJTcZqdGQn+Phyg75mXg8uX1dFdpyzI18HKpW6lESY1HkcHiSbZXFOCAODgNxMR3JHBdzUs8a36pnpVEuL8RQ8zhW//wsRsRvug9i1iNjd/kbWge3rTxC/288WCAAyRxx0JLeKaIIRTsrqLtLQbhOtzEvpF9/v6Uc1OxT1Y1z/87wfDtrVfARWL+FmXTQc0nveSfp3zvv/N065esPRXlvde0qzKG6BFvu910oxWcHQbjQJoaQrwVfKSoPH5ugnAdHuY3lszvL5AgXmfHl4Foqpsbw7ceScEZzK05aEwlzVhtOuJRi/is77H7EqQO3/fEPL10xI7WMSU1T4BI5Wm2s/dnl2bQM4YxDOfQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199021)(54906003)(6916009)(76116006)(4326008)(66946007)(91956017)(66476007)(66446008)(66556008)(36756003)(64756008)(186003)(478600001)(2616005)(2906002)(4744005)(8676002)(316002)(41300700001)(86362001)(6486002)(6506007)(53546011)(38070700005)(33656002)(71200400001)(122000001)(8936002)(5660300002)(26005)(83380400001)(38100700002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6515D505ADC1094592BF0B69A72DC8C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10240
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	24eb2bda-5aae-4168-ecdb-08db6c533526
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5lK6hJFVOD9hQTTgxl5nIxl5QOZs0pgqwM/FLtuwfAcWpClnq9NjjJkkVH+vzUzrN+K7OoW2VzF2+li74Nx55WSfZJwcye87tRMcQP63d8pZpPmJjbgL4qmiq7JZ5CCrDBliXER/+jHP0wza1lnytORiQqeLJwI1t6tAaaQn7DjIK7bzehzNi4eSaJs4qlzKhvTcX860F3UiSSz4UCAa7974SQI3Cx2YOjl/g1A0FvyDptmTagRMYQGpBc5wxIfN/nVZpo8dxidrkPRrRhwLkv/GrLEFABc7rRcl0XQPC7dkn6205JBbXVWg53fj/qLzvhcx0wkb4QmQpHt90lWgRDnosv2ZPamPwSd+l+Q0bthX3VwEnucGc/dgIP9VxHRacUEEGfJS87ZEWhHIMWld28QU8FdPlo8H+g6jFKen7kVg1htqo5uRowU2EFeeOQBFQOaRkAdB0TBMs8Z1VSSDyU4cbPXuJP+VGOSO1A6qbaR5+Tg9p5EiXDKwxGvAhCtDgKCBbgiF9QMGYKrcJ96po2bDTcEk3rZgaYiuqGwgDpPteRVjnsFd9nQinZpMMONFPENc4WSbQHXyGhaTycvs97GABZady2L6nIMH28wV51FkTBn13GH6udFszgiMylT8wqKksqkE0MGBqdhjN5R7gM7VLA4EKzA0MaofEQbvAqkfNRcBs23OJ+keiuSrwMD4duv0XBx/FPrAlK1jsHrzZsQAE5mGn2eEOa5eLEe3gscu5rqR3TkpmMDuAoDTTrS7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(6486002)(107886003)(36756003)(47076005)(83380400001)(336012)(2616005)(86362001)(82310400005)(82740400003)(81166007)(6506007)(33656002)(6512007)(53546011)(26005)(40480700001)(356005)(36860700001)(186003)(2906002)(54906003)(4744005)(70206006)(316002)(8936002)(4326008)(70586007)(41300700001)(478600001)(5660300002)(6862004)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 21:14:54.8378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3703c7-cd71-418f-9704-08db6c533c0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7531
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 21:15:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4774

T24gMTMgSnVuIDIwMjMsIGF0IDIwOjU4LCBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVuaXgu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDAyOjIwOjI4UE0gKzAw
MDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KPj4gT24gMTIgSnVuIDIwMjMsIGF0IDIyOjQyLCBEZW55
cyBEbXl0cml5ZW5rbyB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8ZGVuaXM9ZGVuaXgub3Jn
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEkgd291bGQgbGlrZSB0
byBwcm9wb3NlIHJldmVydGluZyB0aGlzIHNlcmllcyBBU0FQIGR1ZSB0byB0aGUgYnJlYWthZ2Ug
Y2F1c2VkIA0KPj4+IHRvIGRvd25zdHJlYW0gbGF5ZXJzIGFuZCBwbGF0Zm9ybXMuDQo+PiANCj4+
IElzIHRoaXMganVzdCByZWxhdGVkIHRvIHRoZSBFWFRSQV9PRU1BS0UgKz0gIiBDRkdfTUFQX0VY
VF9EVF9TRUNVUkU9eeKAnSBsaW5lLCANCj4+IG9yIHNvbWV0aGluZyBlbHNlIHRvbz8gIE9idmlv
dXNseSB0aGF0IG5lZWRzIGZpeGluZywgYnV0IEkgZG9u4oCZdCB0aGluayB0aGF0IA0KPj4gZGVz
ZXJ2ZXMgYSBidWxrIHJldmVydC4NCj4gDQo+IFRoZSByZWFzb24gZm9yIHRoZSByZXZlcnQgcHJv
cG9zYWwgd2FzIGR1ZSB0byBhIHRvdGFsIHNpbGVuY2UgZnJvbSB0aGUgYXV0aG9yIA0KPiBvbiBt
dWx0aXBsZSBpbnF1aXJpZXMuIFllcywgdGhlIGZpeCBpcyBzaW1wbGUsIGJ1dCBhIGNvbmZpcm1h
dGlvbiBvciBhbnkga2luZCANCj4gb2YgZmVlZGJhY2sgd291bGQgaGF2ZSBiZWVuIGdyZWF0bHkg
YXBwcmVjaWF0ZWTigKYNCg0KQWdyZWVkLCBzaWxlbmNlIGlzbuKAmXQgZ29vZCwgYW5kIGFueSBv
bmUgb2YgdXMgc2hvdWxkIGhhdmUgcmVzcG9uZGVkLiAgQSBwcm9wb3NlZCByZXNvbHV0aW9uIGlz
IHJ1bm5pbmcgdGhyb3VnaCBpbnRlcm5hbCBDSSBub3cgdG8gY2hlY2sgaXQgZG9lc27igJl0IGJy
ZWFrIGFueXRoaW5nIG5vdywgaG9wZWZ1bGx5IGl0IHdpbGwgYmUgb24gdGhlIGxpc3QgdG9tb3Jy
b3cuDQoNClJvc3MNCg0K

