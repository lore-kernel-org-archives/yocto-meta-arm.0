Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C98C77B6C
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:05:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.51])
 by mx.groups.io with SMTP id smtpd.web10.167690.1680807898183504007
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 12:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OJH3FCjh;
 spf=pass (domain: arm.com, ip: 40.107.20.51, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOFTZhgVVU9d2ilQjQXtKUfJ4q0A7EETRbB4cJRoQhg=;
 b=OJH3FCjhmKsOJoCW6QIpx8jMkOQfHvTVegsTcF+1eNxO5yBjvpgU1/zku1IYqIP58fLKx98e4HWp74lhwzpGSP/vbqqPu71iZEpK75NrUJkGaYd/lFzADvzm9JyurmMmjuI8wsitbu8AvLBp6wrotKxJMug8tXOtGJtGgIueLmc=
Received: from DB6PR0501CA0035.eurprd05.prod.outlook.com (2603:10a6:4:67::21)
 by PAXPR08MB6526.eurprd08.prod.outlook.com (2603:10a6:102:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 19:04:44 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::8f) by DB6PR0501CA0035.outlook.office365.com
 (2603:10a6:4:67::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Thu, 6 Apr 2023 19:04:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.31 via Frontend Transport; Thu, 6 Apr 2023 19:04:43 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Thu, 06 Apr 2023 19:04:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e81adf9417b650a6
X-CR-MTA-TID: 64aa7808
Received: from b05e7526d096.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1E11C8DA-F087-4534-9E0F-FDF6D321CB76.1;
	Thu, 06 Apr 2023 19:04:32 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b05e7526d096.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Apr 2023 19:04:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gj8ORzBTIm3jMkIei5L7llUAjmZ7LcLdrrTwfM48cobT11Qv6ohp30f+zfFPmxXW3wa8NJIrVLcAc+xFAqO3yXmtYIZVB3D6p20Ng7We0VjUdXeyco8w03Pn2Q2iWLFycfprHMnDT/PcPCvUcCmTU9bYwJalSaVT7gw1ENxdkuc9DQIfX8OTDa5tWJRbtjSAM00CrK8w3KPOPKqQOaIumgqHo5T3aJkemUXnRKBWF1Uh1vGWIrwaf0NobsV/oJngodIW4xmSkxTvhG8sfNBJA0We/W5cmaFn+eQTXW72QLYmPwO1CjqZ871elQD12aSYIQEhAaF74TP76TKDPFlraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOFTZhgVVU9d2ilQjQXtKUfJ4q0A7EETRbB4cJRoQhg=;
 b=RphILkIpyn7UKgrtQ8nGKEXC/YApGV5cOv28sJIqU4isnVLF1sLUChTlof7WjcWyzb53/XEj3LKj1dDJyAwHhn6jKClQklGRczWPVxjRszaz/TfIpHjzMzNK23G+oSctX8NDMBFbJefVrS1Os94GY4Pk5Fbr2f0f7ma5Ja/7U9hWlNlhXZ1yw7yH2qSxMJ74gzvaf/M5DiL36zxGMdKlw0q5vjtZVGVhQpRgtlFZxjMI0kakbsWPznwLbemx/QvfhNDnnWXH+NeXS+PveJIrl9xS5VBpTN0kxy7rMv1ld1aNSq3JKzo1pRvRtvVJj6Blv2WyTRHGgrButRmZdXgkLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOFTZhgVVU9d2ilQjQXtKUfJ4q0A7EETRbB4cJRoQhg=;
 b=OJH3FCjhmKsOJoCW6QIpx8jMkOQfHvTVegsTcF+1eNxO5yBjvpgU1/zku1IYqIP58fLKx98e4HWp74lhwzpGSP/vbqqPu71iZEpK75NrUJkGaYd/lFzADvzm9JyurmMmjuI8wsitbu8AvLBp6wrotKxJMug8tXOtGJtGgIueLmc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8030.eurprd08.prod.outlook.com (2603:10a6:10:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 19:04:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%7]) with mapi id 15.20.6254.028; Thu, 6 Apr 2023
 19:04:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: akuster808 <akuster808@gmail.com>
CC: Denys Dmytriyenko <denis@denix.org>, Jon Mason <jdmason@kudzu.us>, Adam
 Johnston <Adam.Johnston@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Yocto TSC <tsc@lists.yoctoproject.org>
Subject: Re: [tsc] [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA
 devkit to 3.20 for N1SDP
Thread-Topic: [tsc] [meta-arm] [PATCH 1/1] arm-bsp/optee: Update OP-TEE TA
 devkit to 3.20 for N1SDP
Thread-Index: 
 AQHZZkML30ucqym+hEKIWGuQtS7vpq8aRfKAgACLNQCAAINRAIABCQwAgAC7csGAAAHJgIAASckAgACB2YCAAKqDAIAAF8UA
Date: Thu, 6 Apr 2023 19:04:30 +0000
Message-ID: <FDFF991E-5A01-415D-8CC9-A1E12FAFC4CC@arm.com>
References: <20230403154306.3422-1-adam.johnston@arm.com>
 <20230403154306.3422-2-adam.johnston@arm.com>
 <20230404000559.GA9226@denix.org>
 <PAXPR08MB6432BC10804AF2B98275C3E6E9939@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230404161414.GC9226@denix.org>
 <PAXPR08MB6432BA9D89EC85F016E440FDE9909@PAXPR08MB6432.eurprd08.prod.outlook.com>
 <20230405150847.GD9226@denix.org> <ZC3IXbJDPZYoaVHh@kudzu.us>
 <4C217F66-AD65-48CF-8850-78CC7034F21F@arm.com>
 <20230405234414.GJ9226@denix.org>
 <F89D5BFB-F76A-4F58-A894-FD3D28C90569@arm.com>
 <b287eda0-72e1-3138-1031-76a3e68b77cc@gmail.com>
In-Reply-To: <b287eda0-72e1-3138-1031-76a3e68b77cc@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8030:EE_|DBAEUR03FT060:EE_|PAXPR08MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9ac4a6-7c9a-44ef-b60c-08db36d1c836
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ubhQLPuQ1Lz8Q2w3zcW54LATDWBpSqK7m1BqSsRcuYsFQtdKkbUhwwvx3bDzksir3mQ7xUjLqKFnpA/5O+WQ3aDUSXn2m1aapAOA1WFliHyQ/NsHFeObQ/Za+UkZG2GjloUzUV8KtsV3zYAlbqvk/TdsgIIxI1QCXYnpAwmbzCnWQQvFW8Yxckg2OyGOlBrka3NDSovhLuEDPO5woPcEn+8bo8pIKiVlxsjnhJP6u7fdFTuMD9xgSfAEUFix/awoWZMBUrcmyH/kNq5XPJQrQgVLZm6C4ENa9Oa1o4E6GZxDUt4pyb9Bot/jDQE1IYIobWxP717u+PlVNnHUtCYR61bjeGC7uiWeknRfWdfWCo1+pJWdb83uYJOMo7b2dI2f9p3IkfFJNod09roQyntrwMGBZ8pKtrLePsPNyt2sOJ3wU2QqcwAxrTVUemnDHALiZ/tNPzLenhcRge5wv6MoYeLdXs7m6C0T+5V6gPPNUo5+IFL+Z3+OK2asxOBUeEpNYxOY1iIuIlMhaDtTIJLX3wXdUvcBJkzJ8CmvQWmewq9Gf3x4e/7qiySigZgBzErM9s4CXNgTe2IH6+8XtvKlVmHFIJDKoQaeLPBL1XmH4nnNulKw6IQT4qbhlYjcaagAXn+7GxC/DchicWC3Yd0eHtSv1XRNMnr7i5SxAIXsUFo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(451199021)(15650500001)(2906002)(86362001)(5660300002)(66446008)(66946007)(41300700001)(33656002)(2616005)(8676002)(4326008)(76116006)(316002)(478600001)(8936002)(66556008)(66476007)(6916009)(71200400001)(91956017)(6486002)(36756003)(64756008)(122000001)(83380400001)(186003)(53546011)(54906003)(6506007)(6512007)(38070700005)(38100700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B42C1FCA7EB1324089793FF722994F3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8030
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5f91adc5-c8b4-4d33-c6e7-08db36d1c064
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pplZ7AL0BI6sosCvrra6yMT3wcjoBttoj1mRhJ23fmtnhhiiy3SMOKEl9eBNe2mud8jEZYwQLRF10HewRjUUwmtgRBVu9IerxhZV1J7Gw79c+TpofJEmCSLFuFSMU/bZeUW3SEZD7nrYWg7ybhWfWtPY2sOtyWmS0iR8YAPylrmVaiREp9kEnraFqKc13SWnVbIU52073yW1Ze7dzzlhQF43DfCB1eao8FNq6IhE89kY180566O5ySbjFOJreaS047X/SlAL2mRjyzXMe2spHwQkx27xa43ex1/LudQkeL0RBWbS6+DyJFqsoqOtPLlXD3CordI5H/weNKxzIepRBnm5n9M5txWQW5Z6sP6KG84fALA6DHujQYyDRX0rH7SvVQYXbg48j3XpumYi695iL3PISXitZ/E8VRc0GGgwdQTontv/Eg3C4b9+0wAhf2gp6XZgx3AbHswZgqdU+4L68qi3gjygvrtbLjfqYfqdbjbJVEWxe8PS4T2hI3iP92m667DKjKLD5JjB4gnjSiKu+LHwwHV7P7S1fYd3k5UCuhAPLM0RNFcWFTYKj/1a2bsBS8/Or9FpI/8WL38wBi44WDedtFr8cLNDulibw5hjKjXYlmBSDRBZNREeb1BZNMzB4CUjd+a1mfJrC1xLJ/LsnF80IfUR1Fp7om4vZHU9suawAUpT+GJB6+dS6k5Vky9nlu2wwbDSQCBqov74FacdGKYVxM/3H0ezisU72qE5hfU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(6486002)(83380400001)(47076005)(82310400005)(4326008)(15650500001)(70586007)(70206006)(6506007)(53546011)(450100002)(86362001)(8676002)(186003)(2906002)(36860700001)(82740400003)(316002)(478600001)(356005)(33656002)(336012)(81166007)(6512007)(26005)(41300700001)(40460700003)(54906003)(8936002)(6862004)(36756003)(5660300002)(40480700001)(2616005)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 19:04:43.7994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9ac4a6-7c9a-44ef-b60c-08db36d1c836
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6526
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Apr 2023 19:05:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4563

T24gNiBBcHIgMjAyMywgYXQgMTg6MzksIGFrdXN0ZXI4MDggPGFrdXN0ZXI4MDhAZ21haWwuY29t
PiB3cm90ZToNCj4+IFRoZSB2ZXJ5IHNob3J0IHZlcnNpb24gaXMgdGhhdCBmcm9tIHVzZXJzcGFj
ZSB5b3UgY2FuIGFzc3VtZSBVRUZJICh0aGUgZW1iZWRkZWQgYmFuZCBpcyBtb3JlIGZsZXhpYmxl
IHRob3VnaCkuICBIb3cgdGhhdCBoYXBwZW5zIGlzbuKAmXQgcmVhbGx5IHJlbGV2YW50LCBidXQg
aXQgbWVhbnMgdGhhdCBmb3IgZ2VuZXJpYy1hcm02NCB3ZSBnZXQgdG8gaWdub3JlIHRoZSBwcm9i
bGVtLCBsaWtlIHdlIGlnbm9yZSBmaXJtd2FyZSBvbiB4ODYgdGFyZ2V0cy4NCj4gDQo+IElzIHRo
ZXJlIGFueSByZWFzb24gdG8gdHJlYXQgb3AtdGVlIGRpZmZlcmVudGx5IHRoYW4gdS1ib290PyBJ
ZiBPcC10ZWUgd2hlcmUgaW4gY29yZSwgd291bGQgdGhhdCBoZWxwIGFueXRoaW5nID8gVjg2ZCBp
cyBpbiBjb3JlIGFuZCBpdHMgWDg2IG9ubHkuIFdoeSBhcmUgd2UgdHJlYXRpbmcgQXJtIGRpZmZl
cmVudGx5Pw0KDQp2ODZkIGlzIGEgZGVwZW5kZW5jeSBvZiB0aGUgcWVtdXg4NiBtYWNoaW5lcywg
c28gYXBwZWFycyB0byBiZSBuZWVkZWQgdGhlcmUgKHRoaXMgbWF5IG5vdCBhY3R1YWxseSBiZSB0
aGUgY2FzZSkuICBVLUJvb3QgaXMgYSBnZW5lcmljIGJvb3Rsb2FkZXIgZm9yIG11bHRpcGxlIGFy
Y2hpdGVjdHVyZXMuDQoNClRoZXJlIGlzIGFsc28gYSBkaWZmZXJlbmNlIGJldHdlZW4gbWV0YS1p
bnRlbCBhbmQgbWV0YS1hcm0uICBtZXRhLWludGVsIGNvbnRhaW5zIEJTUHMgZm9yIEludGVsIGJv
YXJkcywgd2hlcmVhcyBtZXRhLWFybSBjb250YWlucyBnZW5lcmljIEFybS1zcGVjaWZpYyBjb21w
b25lbnRzLg0KDQpTcGVha2luZyBhcyBhIG1ldGEtYXJtIG1haW50YWluZXIgSSBsaWtlIGJlaW5n
IGFibGUgdG8sIGZvciBleGFtcGxlLCBjYXJyeSB0aHJlZSB2ZXJzaW9ucyBvZiBvcHRlZSBiZWNh
dXNlIGRpZmZlcmVudCBCU1BzIGhhdmUgZGlmZmVyZW50IHJlbGVhc2UgY2FkZW5jZXMuICBXZSB3
YW50IHRvIGhhdmUgaXQgZG93biB0byBvbmUsIGJ1dCB0aGF04oCZcyBub3QgYWx3YXlzIHJlYWxp
c3RpYy4NCg0KQnV0IHRoaXMgaXMgYSBkaWdyZXNzaW9uLiAgSSBkb27igJl0IGJlbGlldmUgYSBy
ZWNpcGUgZm9yIG9wdGVlIHdvdWxkIGJlIF9uZWVkZWRfIHRvIGJvb3QgYSBTeXN0ZW1SZWFkeSBi
b2FyZC4gIFRoZSBwb2ludCBvZiBTeXN0ZW1SZWFkeSBpcyB0aGF0IHRoZSBmaXJtd2FyZSBpcyBh
IGtub3duIHF1YW50aXR5IGFuZCB2ZXJpZmllZCB0byBiZSByZWFzb25hYmxlLg0KDQpSb3Nz

