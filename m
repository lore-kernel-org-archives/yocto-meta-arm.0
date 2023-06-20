Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DC7EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 12:01:36 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web11.8418.1687262494283670436
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 05:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vP2gS6GO;
 spf=pass (domain: arm.com, ip: 40.107.22.50, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaLrwAmQkeAzc6GIeQ13qViR98QIzWg15jfXCUF2Ypg=;
 b=vP2gS6GOqkn94bX3/Msrm/0hF7/swv9OZDqjBhXkEAdA19bb0EkXfiInarKggdXVrbfzxVNko1KIgZ3yHVwyKlKIWnbCzdhNYnI8MYE78qzLZzD1HXnuqkOCNCXkyAgjy8/RttHb1xP2xZJwMj2zNag+5KkczOna0Ut495YJPRg=
Received: from AS9PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:20b:488::17)
 by DU0PR08MB10325.eurprd08.prod.outlook.com (2603:10a6:10:471::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 12:01:32 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::3d) by AS9PR05CA0021.outlook.office365.com
 (2603:10a6:20b:488::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 12:01:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 12:01:30 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Tue, 20 Jun 2023 12:01:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03f1fe1263d4d73d
X-CR-MTA-TID: 64aa7808
Received: from 97013f5d1b9e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5DE7543C-69BA-4B52-970E-E06AD0ACDDB5.1;
	Tue, 20 Jun 2023 12:01:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 97013f5d1b9e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Jun 2023 12:01:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3JCLvOpGOR+AWFqMo25CBik/jXPEi6KuanevpI+4ajtZ250SjwPP/42M1f+iwl/0g2IegXP9fyQJeyIRWqVu4984u8Qc62SPx6LFR9XWan8WaJ0S0P+pvepUc9ljf6VgRzB4vHa6S2a3hkpKkv1/bsaDzetuj5ObbdFZf0QP/Qn6yxJ7ZVeya/0yU0y5ZuMiZrxpoi5ftunVyJWgyBXfk8aVsC2PY/i/7lR0F44lAY87z+J3uxcsTT6vRhO2gNvuIGiVHVvSVMaiAA5K3gBNx9VxNibuTV6zFAUOnShKk2u7Ae7519x4HgCJp+s0wgpoJ9XGxJrqsyMysrmr8lS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaLrwAmQkeAzc6GIeQ13qViR98QIzWg15jfXCUF2Ypg=;
 b=TUk4DEJMfYtHw6kBMdcRjyomOZD8Y7qDhyJ1mTJZxXiVUat88P5gwkekxfF7XNTsn28uOt+ig3F5lnLDVB6n93abwflthv43ncTuSrWpE4omGi1dQRo8SqcDAoZgpUDQafFIZy+CG3XvbtRmdTo7LYq9gRanWZLqFpArfAj7NRvhEt+rb7EElZgImFWs0ntVm23hLlPWBDEO8rTrxmyTVbUprV/3ySCfY1pSuHUeXiub20/D1cvhyZOvzAlXkr2mcq1O6jqMyBD2h4woPx01ayeBc7gBjqu7yYFTWC59864E6g7vwjOFJNO32V26L3zF4erSmvHNeWsfdEV3o2rueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaLrwAmQkeAzc6GIeQ13qViR98QIzWg15jfXCUF2Ypg=;
 b=vP2gS6GOqkn94bX3/Msrm/0hF7/swv9OZDqjBhXkEAdA19bb0EkXfiInarKggdXVrbfzxVNko1KIgZ3yHVwyKlKIWnbCzdhNYnI8MYE78qzLZzD1HXnuqkOCNCXkyAgjy8/RttHb1xP2xZJwMj2zNag+5KkczOna0Ut495YJPRg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8703.eurprd08.prod.outlook.com (2603:10a6:150:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 12:01:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 12:01:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jesus Jimenez Sanchez <Jesus.JimenezSanchez@verifone.com>
CC: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [yocto] meta-arm-toolchain: SUPPORTED file not found #toolchain
Thread-Topic: [yocto] meta-arm-toolchain: SUPPORTED file not found #toolchain
Thread-Index: AQHZosvMH8OS8Q69kEWXpYjGcJANdq+TaLiAgAAJOnGAACZEAA==
Date: Tue, 20 Jun 2023 12:01:22 +0000
Message-ID: <E87041DC-8642-49BE-91F5-0FEF0A0D1BF1@arm.com>
References: <5H3q.1687192403619815582.2AB4@lists.yoctoproject.org>
 <9C18040F-78ED-420B-A526-04FF2A5D839E@arm.com>
 <PH0PR03MB57519A02EB09E9ADE77FF75DF95CA@PH0PR03MB5751.namprd03.prod.outlook.com>
In-Reply-To: 
 <PH0PR03MB57519A02EB09E9ADE77FF75DF95CA@PH0PR03MB5751.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8703:EE_|AM7EUR03FT029:EE_|DU0PR08MB10325:EE_
X-MS-Office365-Filtering-Correlation-Id: b72d30a9-aa23-4282-74d6-08db71861568
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 W6uQnLBULZPB2yKxI6AbUnsT7ExN+NHIUf4qoAqZTT5Crf2007vE2gSVi6YClpv+ZLPTb6ZHJEZVnG5dm0Lj+7lhPTwtvntXG0qFVRa1PfpsH+Pax7kKqLI8dU795trS32x6O1j/L7CWqzcxf5SQtbNnkAkmJJw8TZuIBkDtK23vB7iH/JH39M/50f6ZsKF6aa3p/gDKl1HlWx/TDflyxEztVMSGZ2jRXXl7x3eg8jRgd8JDWNPmLh1CrCbtM0YQ/sZe5HXz4OoRDJlSKnZ4LJpIb4HlKOGUbOnm6n3OCkL398z3qXmtxwg1StL/9PjHln2I4dvby+GDqsOeRxyhyP4oucB+cclbsXf07CxkDKg/dJ3im664rZFlAP+DSxHbT/W3TySkeQUR28JrRi62PY+hW0NGOUR3Y4RvVUt2I29qXo5gakDB/ZvPbJ3DTC6ZO/Gm0JvippEBvaoVmQqskMDzRIEvbaRhHw7QkghUeTVMPpNjFQ/rODfC+S2ga1/SVHJxp0QYL7fJFx/bREhdnhgNpQ+yUVoK0KuA7F4BBM727tzE6EEty9M0wnKy/PxJ0qK2EsiHxCW3eactk4adPat4XDwF157o4FMEfSJrFtA9IBocsv3p7PURZNpcoff2zSTAkFBvAnzGvDKQv5iHSw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(6486002)(478600001)(2616005)(71200400001)(83380400001)(54906003)(26005)(6512007)(53546011)(6506007)(186003)(2906002)(4744005)(5660300002)(33656002)(36756003)(38100700002)(122000001)(91956017)(4326008)(66946007)(316002)(76116006)(86362001)(8936002)(8676002)(41300700001)(6916009)(66446008)(66476007)(64756008)(38070700005)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <040CC21726F43C4F9EE4E5A966AB3969@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8703
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	57b2a050-b8d3-4788-e877-08db718610d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JQ0RmLV2QKxzAFW/W5XS+cmq/50hWjLfx+n9Y1YoZtJBnbyiGYO0KKmAhs49sml0V/brq+o5LMv5MJWnGHfy/JNfTacNoTCID/MvXxTQnYXxtRuCfoMj3gmgDu0PftTN/I5A8/HY31GByJb8Cy1Ooe1uT9e25z4i7UYZI3XGai/KdqSfOoSWGYAQS9Dr8iOBzzU8gVPG1oi15pypusSanMDyoANmWjB27+kWXmPkUbkeWFOMQVRqaBzp0liimeqtS/P3qeDwxc2XIqdsUI+a5MJFuSpbkTHjIYYjsnxqVZ//4Ra8BX9UVdRYB72j18zLCBSQGFLLipk7XUggWlRlES3TZbVw0rDtw7uNVMY9zHN4v6xm2pjf0mXGyVm3h1GcngX8o1XJMArWSN8Xrs/sZKj9qmtn1EdthZXsewqKOgT1GaaFL3/GmKlRJpP8pguvGoxZ+I3tWvQeCth+OhTe47ODHCuUHx7S1DHyUFtlR2e6fF1jEEe4YEMQf4tKA42MhyAOu3mc1DvQ/eAyVFGJD8HZAvBCx+b5J0gmMLTVGbvh50Lb9jRog7GyEAcxybjBY5sQgWGOeUhFRp2RLXXixxa/76aTs0hPkVPJjGmmzzOlAS6+JS+zZj9wy687Q6CySzz8WokV9NC3B2bu8mmI1oK8+Q/OGTqyzdkIlec+E3PJZOdLDeKU+BCzdyQeSxBLNE6xKNVAHATALZIkDCTLXMLnGz7tIAGF61VC5iN3P6KX1twKuIN0pHtLmf18oPim
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(47076005)(83380400001)(6486002)(54906003)(316002)(8676002)(8936002)(2616005)(6862004)(6506007)(36756003)(450100002)(86362001)(26005)(4326008)(33656002)(6512007)(186003)(336012)(41300700001)(5660300002)(82310400005)(53546011)(70586007)(70206006)(40460700003)(82740400003)(356005)(81166007)(40480700001)(478600001)(36860700001)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 12:01:30.0999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b72d30a9-aa23-4282-74d6-08db71861568
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10325
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Jun 2023 12:01:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4808

T24gMjAgSnVuIDIwMjMsIGF0IDExOjM1LCBKZXN1cyBKaW1lbmV6IFNhbmNoZXogPEplc3VzLkpp
bWVuZXpTYW5jaGV6QHZlcmlmb25lLmNvbT4gd3JvdGU6DQo+IA0KPiB8IGNwOiBjYW5ub3Qgc3Rh
dCAnLi4uL3RtcC1nbGliYy93b3JrL2NvcnRleGE3dDJoZi1uZW9uLXZmcHY0LW9zdGwtbGludXgt
Z251ZWFiaS9leHRlcm5hbC1hcm0tdG9vbGNoYWluLzIwMjIuMDItcjAvaW1hZ2UvbG9jYWwvU1VQ
UE9SVEVEJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KDQpUaGF04oCZcyB0aGUgbGluZSB3
aGljaCBjb25mdXNlcyBtZS4NCg0KTXkgbGluZSBpczoNCg0KICAgICAgICBjcCAtZnBQUiAveW9j
dG8vcm9zcy9idWlsZC90bXAvd29yay9jb3J0ZXhhMTV0MmhmLW5lb24tcG9reS1saW51eC1nbnVl
YWJpL2V4dGVybmFsLWFybS10b29sY2hhaW4vMTIuMi5SZWwxLXIwL1NVUFBPUlRFRCAkZGVzdA0K
DQpEbyB5b3UgaGF2ZSBsb2NhbCBjb25maWd1cmF0aW9uPyAgSSBqdXN0IGdyYWJiZWQgcG9reSBh
bmQgbWV0YS1hcm0ga2lya3N0b25lLCBzZXQgdGhlIHR3byB2YXJpYWJsZXMsIGFuZCBpdCBidWls
dCBmaW5lLg0KDQpSb3Nz

