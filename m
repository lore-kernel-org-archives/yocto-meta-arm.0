Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE4BC76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 07:29:33 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.152791.1680766170795385284
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 00:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9jXoGeKL;
 spf=pass (domain: arm.com, ip: 40.107.20.46, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHoLaswnfseyC2yTJbxlSmqiJLrG7qapP1dvfBYtFGI=;
 b=9jXoGeKLdQRMBR9by8LHOb8x2SALG16/5Tqx4k8ujExRAde5ulvdcjYS4Jl80TEkiP1tXLEoM5/gAaGPCABcGfdVLFKj0Srw6oZP8YyzDxMq2iedVZkI4uL14bPw8RArMR8P6z3kjqTVFSpP46sPE9bIWG4+epWp4BOZxCFqqAk=
Received: from AS9P194CA0001.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::9)
 by DU0PR08MB9027.eurprd08.prod.outlook.com (2603:10a6:10:470::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 07:29:24 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::a3) by AS9P194CA0001.outlook.office365.com
 (2603:10a6:20b:46d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.37 via Frontend
 Transport; Thu, 6 Apr 2023 07:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.18 via Frontend Transport; Thu, 6 Apr 2023 07:29:24 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Thu, 06 Apr 2023 07:29:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b0aba122c9f9ffb
X-CR-MTA-TID: 64aa7808
Received: from a3ac38645386.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8A410FD8-97D4-447F-B699-9C4A3A0E9AA5.1;
	Thu, 06 Apr 2023 07:29:15 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3ac38645386.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Apr 2023 07:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7jGXhHdLfxZ+mc3JEBFka95WwTNu02EBF6qNI8mAjzGKStrjUHWa8MRlv6nw9k2JPJuUh3VHlNdJhAGiwO+4elW0Dbu7PlWL43sgEiRbaXBva69H2v9zmY9kUfjpILZeDmapCszJrodvA4wlGw0H+P9e3+DwiiC0+OY+hceGxoDFWOB0a/g7z1u9qQse/FC3jJfR4RdKFNry4nhIqw3HNRqNTe9UCfTybXYxx2vfOBUMs4pYVc6qBf7MNZGZMpj47O88Nf2lpVlaPm28ixfja4D2LssFbpAZk4DazgvqRI7AJ2FB+hH6tnL0QXuk7+DylEJmJ5939hRabGzmPE8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHoLaswnfseyC2yTJbxlSmqiJLrG7qapP1dvfBYtFGI=;
 b=dxfrzdSVQQXkz4UrdVHJpxTqtQZ6Ng0908SjVtle0HKvvOYjJCksORjIcRL19Yo1nhpKYcKW3Jckh7m4PyMR4cNa+j2bZzvn7S6NItTzDYkRVVkfSHBnUQhpKcNvy6YrYkU8EBzMaGBbdN5yl7jo/g7tTFNzKT19yhquYXzDcFBgj4wgYX35RB7XBOmwFWY/ksHba2hnIg52KmfhV1q77NnGdSZyLJHxaewcyCT28vfElSzpSsEUd4DztqvBojYcSOlJi2ZAppg45UyEbtFUIffNSPmJ49wyvu5R4TOh47iUUIYxyyBOAKWdCLtsv42y2lMcrNgiEXFegAfotJ5BDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHoLaswnfseyC2yTJbxlSmqiJLrG7qapP1dvfBYtFGI=;
 b=9jXoGeKLdQRMBR9by8LHOb8x2SALG16/5Tqx4k8ujExRAde5ulvdcjYS4Jl80TEkiP1tXLEoM5/gAaGPCABcGfdVLFKj0Srw6oZP8YyzDxMq2iedVZkI4uL14bPw8RArMR8P6z3kjqTVFSpP46sPE9bIWG4+epWp4BOZxCFqqAk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB10331.eurprd08.prod.outlook.com (2603:10a6:102:32a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.29; Thu, 6 Apr
 2023 07:29:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%7]) with mapi id 15.20.6254.028; Thu, 6 Apr 2023
 07:29:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Jon Mason <jdmason@kudzu.us>, Adam Johnston <Adam.Johnston@arm.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Yocto
 TSC <tsc@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Topic: [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA devkit to
 3.20 for N1SDP
Thread-Index: 
 AQHZZkML30ucqym+hEKIWGuQtS7vpq8aRfKAgACLNQCAAINRAIABCQwAgAC7csGAAAHJgIAASckAgACB2YA=
Date: Thu, 6 Apr 2023 07:29:09 +0000
Message-ID: <F89D5BFB-F76A-4F58-A894-FD3D28C90569@arm.com>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230404161414.GC9226@denix.org>
 <PAXPR08MB6432BA9D89EC85F016E440FDE9909@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230405150847.GD9226@denix.org> <ZC3IXbJDPZYoaVHh@kudzu.us>
 <4C217F66-AD65-48CF-8850-78CC7034F21F@arm.com>
 <20230405234414.GJ9226@denix.org>
In-Reply-To: <20230405234414.GJ9226@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB10331:EE_|AM7EUR03FT017:EE_|DU0PR08MB9027:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e888757-f125-402c-9d7a-08db3670a566
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NURiIp18pkhzdS0eRxNSAAZgkPtI4uXpVUR/tUGP8MT+nQedyxtGfbhphz/118yFkvXp9zTuHq1LjVvW8agImJV6QWQsoge18aIzSKDEUMjK4aVpd6Bsvm3COl0IM0YNNZivnZhGECmYYC10Uz28eJBIPGdfjj+2wPO8d9ErTMnuimX03W0emDU/ITgoD4eKoaHDoCH5lHU0vU5eEtj669k0mo2KpBSbHMUa5Ru8zaahbJF4jysNin7t33/jfGk6uTF9akNrnirWjETw9kakKDZER77dozL6UYgdzWJDUAez/K61rPlncrCRr9tG7UPjdxQ/dsPE2wiDAd/1+6Y5JpvFpQ0S80KNhukc/PbzhNwwy6z03ghN1Yc9cxsQMGNWiqkpeWS9z0T/u2C/w2s6+TqaJqMzN7GmF9A5t7b7rxAHs6w8HV4DJqZPNX8qOIO+wBMCX5+cJpmenplFRkION1c9MENCfllrmCeqx52sJelS8ckhl3TI+PTTaiB7bWs7TyQrfAopVo++c0gYrqGjwQW1ahwZvbmVmhGEsGgua9g0tSsIpYO/r9Pponp9smAY+Eq6BSy1AQBkofEN0ObtfjJgwc4/NsHPu/Aah4MnHh+CgzFNJoWplD3UoO9S+Haa6AUmy9qL99GoZCNJesVDqCzVPh0JLjf5W/6pEFvBRPw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199021)(86362001)(36756003)(66899021)(33656002)(478600001)(54906003)(71200400001)(122000001)(41300700001)(38100700002)(8936002)(66476007)(6916009)(316002)(8676002)(64756008)(4326008)(66556008)(66446008)(91956017)(76116006)(66946007)(2616005)(83380400001)(6512007)(53546011)(6486002)(6506007)(26005)(186003)(2906002)(38070700005)(5660300002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F31AAA71C4EDC348AFB7417A38A9EF6C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10331
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b8960ff7-817c-40a8-722b-08db36709c8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AdsXvIxObgIejY5gCGOh81z/I57SBROpemjjUMVlYez4Xx25s+TYSvD/3EtQ8iwIkbiwCKzBVntiKQbX3R8MyLEh7B6yHLLsJ0GCZoxxI3eGATCVY47A6hVuW9bNG26nsuZEaIF5i1v/hVBK1hZyneEiRw8MtOGq30M8xhTyYBLTA6ytIk7pC2JUcYIM5qFP6is14p9WCWCj+dTShLaMUhvr4kQac92/ujVGwTKy3nFYSU+pJCk7KChT/u8RViRfmiJSocsROrobgrt7t3/OBv1ZQ0Ppq2DpTo5RjWg7Z3i/fw3XCrFju6SQE0Wt0ELxlMFI/phU5B8iHfH4A3TlnP/H7sgNhMvMlkOn5Qucae5wYetRZELdssJYJ3HNxQ6w1WHmIa7UEeO12SrtzCwZWK8f26JbE/tnonHaj54wepCByuGypOfZzBwnixjnXU5W2pIiIvOcnTmsh2HwldZri57RBIpdxu8H8fZyMxzx9ooFy8iVS0Yf8NyiLR9fxEUd98JOONoqUih7UGpGg0uoAUWfOJyNaaYMqNQp5ThNHuB6MT/EITwWxhOJ05L6C3IwzOM0Qpuu+mTfjLGBziFYukNIeeuFvV9BnvfWkDEtmEcMpNjKn68zIKAnHzXGG3KWVAGEntdd+lYyPdBTAGNcv/mQSeWBr2AS9dDuvjkforwCmYeO/LhunkIrVnHjSEMIRiJcyb0d9wX66kp5oE7I51KrI7ZoOT7JxpozMmgeXJw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(53546011)(6512007)(6506007)(6486002)(6862004)(8936002)(2616005)(47076005)(83380400001)(41300700001)(336012)(5660300002)(186003)(450100002)(2906002)(70206006)(70586007)(4326008)(478600001)(316002)(54906003)(36756003)(40480700001)(8676002)(26005)(356005)(82740400003)(86362001)(33656002)(82310400005)(36860700001)(81166007)(66899021)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 07:29:24.1634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e888757-f125-402c-9d7a-08db3670a566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9027
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 07:29:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4558

T24gNiBBcHIgMjAyMywgYXQgMDA6NDQsIERlbnlzIERteXRyaXllbmtvIDxkZW5pc0BkZW5peC5v
cmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBBcHIgMDUsIDIwMjMgYXQgMDc6MjA6MjBQTSArMDAw
MCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBPbiA1IEFwciAyMDIzLCBhdCAyMDoxMywgSm9uIE1h
c29uIDxqZG1hc29uQGt1ZHp1LnVzPiB3cm90ZToNCj4+PiANCj4+Pj4gQXQgdGhlIFRTQyBtZWV0
aW5ncyByZWNlbnRseSB3ZSd2ZSBkaXNjdXNzZWQgdGhlIHBvc3NpYmlsaXR5IG9mIG1pZ3JhdGlu
ZyANCj4+Pj4gVHJ1c3RlZCBGaXJtd2FyZSBhbmQgT1AtVEVFIGNvbXBvbmVudHMgZnJvbSBtZXRh
LWFybSB0byBvZS1jb3JlIGluIG9yZGVyIHRvIA0KPj4+PiByZWR1Y2UgZGVwZW5kZW5jaWVzIG9u
IHRoZXNlIGNvcmUgY29tcG9uZW50cyBieSBvdGhlciBCU1BzLg0KPj4gDQo+PiBNeSBvcGluaW9u
IGhlcmUgaXMgdGhhdCBpbiB0aGUgaWRlYWwgd29ybGQgYSBnZW5lcmljLWFybTY0IEJTUCB3b3Vs
ZG7igJl0IG5lZWQgDQo+PiBhbnl0aGluZyBleHRyYSBpbiBvZS1jb3JlIHRvIHdvcms6IGFzc3Vt
ZSB3b3JraW5nIGZpcm13YXJlIChTeXN0ZW1SZWFkeSksIA0KPj4gbWFpbmxpbmUga2VybmVsLCBt
YWlubGluZSBVLUJvb3QsIGV0YyBhbmQgaXQgd2lsbCB3b3JrLiAgSXQgbWF5IG5vdCBiZSBhcyAN
Cj4+IGZ1bGx5IGZ1bmN0aW9uYWwgYXMgeW914oCZZCBnZXQgYnkgYWRkaW5nIGN1c3RvbSBvcHRl
ZS90ZiBwaWVjZXMgYnV0IHRoYXTigJlzIA0KPj4gd2hlcmUgbWV0YS1hcm0gc3RlcHMgaW4sIHdo
aWNoIHdhcyBkZXNpZ25lZCBleHBsaWNpdGx5IHRvIGJlIEJTUC1hZ25vc3RpYy4NCj4gDQo+IFVu
ZGVyc3Rvb2QgYW5kIGFncmVlLiBJJ20gbm90IHlldCB0aGF0IG11Y2ggZmFtaWxpYXIgd2l0aCBT
eXN0ZW1SZWFkeSBmaXJtd2FyZSANCj4gc3BlY2lmaWNzIC0gZG9lcyB0aGF0IGluY2x1ZGUgVHJ1
c3RlZCBGaXJtd2FyZT8gTm90IHNvIHN1cmUgYWJvdXQgT1AtVEVFLCBidXQgDQo+IHdoYXQgZG9l
cyB0aGUgc3BlYyBzYXkgYWJvdXQgaXQ/DQoNClRoZSB2ZXJ5IHNob3J0IHZlcnNpb24gaXMgdGhh
dCBmcm9tIHVzZXJzcGFjZSB5b3UgY2FuIGFzc3VtZSBVRUZJICh0aGUgZW1iZWRkZWQgYmFuZCBp
cyBtb3JlIGZsZXhpYmxlIHRob3VnaCkuICBIb3cgdGhhdCBoYXBwZW5zIGlzbuKAmXQgcmVhbGx5
IHJlbGV2YW50LCBidXQgaXQgbWVhbnMgdGhhdCBmb3IgZ2VuZXJpYy1hcm02NCB3ZSBnZXQgdG8g
aWdub3JlIHRoZSBwcm9ibGVtLCBsaWtlIHdlIGlnbm9yZSBmaXJtd2FyZSBvbiB4ODYgdGFyZ2V0
cy4NCg0KUm9zcw==

