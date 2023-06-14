Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F382EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:59:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web10.7766.1686736774180869984
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 02:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DeX1AZNe;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QeM2SteWrBt6AtkYy6KqMQWTBb9CMCucqpkfU60th8=;
 b=DeX1AZNejXCoVKCJZWNSNkm8QiLriwC5WlyfUCHvr7pva03p0aNad66PKJbhkK0PvJTjylvni6N2Sds+6YE0XKhcmffJjyk2UHvM7gLjf6ZXQZYr8wcyZdVxrz089xLmUR/Rlz/cj9x9OAZNBNTq7S1VMa+A95Ga8h4xs1fEum0=
Received: from AS4P190CA0050.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::12)
 by DB9PR08MB7724.eurprd08.prod.outlook.com (2603:10a6:10:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 09:59:28 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:656:cafe::ce) by AS4P190CA0050.outlook.office365.com
 (2603:10a6:20b:656::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.36 via Frontend
 Transport; Wed, 14 Jun 2023 09:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Wed, 14 Jun 2023 09:59:28 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Wed, 14 Jun 2023 09:59:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 86f1f9d56f1e66a2
X-CR-MTA-TID: 64aa7808
Received: from 34f75571f384.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9EF6BDC4-726A-4E3C-B360-7BA39A3EF8DC.1;
	Wed, 14 Jun 2023 09:59:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34f75571f384.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Jun 2023 09:59:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek6r0I3SQKTLWOu+hb8RMnH/ulxNmlrJ1G4ANYbTLIop+TYHGPwKOtV3/47l74T+U5bOx7BIIRPYeGo4FagaWZxcPLvkLodn4TBdUWhwewYkpfov+/lUND6SItdctg70l9j8idP1z/doTENqfne9slSBUD+SSlabHIWOVkuU46cTrrK8+2u34zGuP7tU7jOF14AS+5ZlQzEfw1PXpsszPwsE7TVnAqQVGYeHAGK0vnpf0+6/XMA14uPPBQoucbDoGPyLkWnPhM5aN9Ue2i6bsVLhlaJXijV0jxiqxv6Tvy6iuOUdH5UUD8w6QPHiG/vIDZ1edVHlC7h+p1wAlbOhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QeM2SteWrBt6AtkYy6KqMQWTBb9CMCucqpkfU60th8=;
 b=jxgABKpyp+wQP4MJBAT64q8LZb+dtj01fuL6+c7DGNCOO4I8WaR0UGfj8+QoBludrDuOlFwE3LhWtVVuR3/oBplw6l8PyB95okb83ah/lRXA8fdGPYrHcv24Ng0mzWu/167Y5DR9XefbpCIJuGBnu6QqdIY8DtYBcQjSfgqi0cATvBdR24DkaeTplQzqtPL1kGCIamvjCcZ1cYCGRBMnkozTDcYzsGw6mZ/GlN9EU4NIH2o6IhUParPO1qA0ZqIAbqOuKRtAfIHve2Jrca0GL/HNdsvqytrLzYY1SYAtq+W/oVFui1mV3J+5Mp7BnDNY14Xq85ha57ez4MRCmx1K0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QeM2SteWrBt6AtkYy6KqMQWTBb9CMCucqpkfU60th8=;
 b=DeX1AZNejXCoVKCJZWNSNkm8QiLriwC5WlyfUCHvr7pva03p0aNad66PKJbhkK0PvJTjylvni6N2Sds+6YE0XKhcmffJjyk2UHvM7gLjf6ZXQZYr8wcyZdVxrz089xLmUR/Rlz/cj9x9OAZNBNTq7S1VMa+A95Ga8h4xs1fEum0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5569.eurprd08.prod.outlook.com (2603:10a6:20b:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 09:59:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 09:59:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Gyorgy Szing <Gyorgy.Szing@arm.com>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS version
Thread-Topic: [meta-arm] [PATCH 01/16] arm/trusted-services: update TS version
Thread-Index: 
 AQHZikR+hmF+V6kO9UOtJvYLrPQvza+H2SkAgAEWqICAAF6VAIAAFSgAgAADdQCAANIqAA==
Date: Wed, 14 Jun 2023 09:59:16 +0000
Message-ID: <9F6967B3-969A-4D1F-B360-F1B37BF6B3DC@arm.com>
References: <20230519112400.340-1-Gyorgy.Szing@arm.com>
 <20230612214256.GS9226@denix.org>
 <219D22AE-6AAE-493F-B4DE-C340B852C8A2@arm.com>
 <20230613195848.GT9226@denix.org>
 <BC8E801D-C6A8-47D5-8476-9FFFC403F4E9@arm.com>
 <20230613212654.GU9226@denix.org>
In-Reply-To: <20230613212654.GU9226@denix.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5569:EE_|AM7EUR03FT019:EE_|DB9PR08MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c918eac-66f2-4fe3-c0bb-08db6cbe0aad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4GxINO16rPn3vyqnw8xMZoH8WAfe4RKx8kUxwJo5pjguhpjgZkyUq6FMnRS1P6UsXOXMV7dWg3u4aup2YlbUZyV8SOshA9CD7YoUxPReBUMvlnIIpD6SxNZHqXc+SF9XF3r74yq4FBrAtYyGNPkWTett292pw+vwxZ7nCuBnKoBLZw/50EQz3w/awcr1VbPWtMdhIstYIFaabAqKgQ415KQQY0rRVUDaw3q2Tf5Mnymo5iYeNNszoGU+jwNDa13HayUR+RGSYJiFRY7uxzp6JMcTpxCQnXx6dskEDKYF6dSE467gnJgkzhJXnyKhRWO6FlkEWIkUpy63crLZwIYyYaskB6vdDAPMJrj0G9nJbgQb9ps5kbeFXIttfzJ82fG7bd8K9IWb6MVYGoF5oanKYqQd9rOBtOgNazpChPoTIIb/Jzdpn0UIsxetev3k7l7J87P8vpGsfqA90tN10p4GyAotJFl8/3IAx2PMTb5sglAMzMJDS8uYD4YOHa3dTOhS+fKKSRNmdcWGTxXnaDZ/zbnXjkqz14LLAoQuSUOJ0fNTL91kFzizN5xDEh12L7mve6XcHRUoH9wCn02gIbrHcC9q92RSLxadMNkBelcKtJRpOZHPENUEsc8ytELW0nBL8cF+R6Tv3rzMinaoWgvJtA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(966005)(6486002)(478600001)(71200400001)(2616005)(186003)(26005)(6512007)(6506007)(53546011)(41300700001)(8676002)(8936002)(4744005)(5660300002)(36756003)(316002)(54906003)(64756008)(4326008)(91956017)(76116006)(66446008)(66946007)(66556008)(6916009)(33656002)(38070700005)(38100700002)(2906002)(86362001)(122000001)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC76799A472941409077767351C78E07@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5569
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3410ec08-5853-45bb-afcf-08db6cbe03dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SsTzLTYnBYqoYMG13tLfcgu8YnxEbzjSaSs0kKquVRf6lD8u9uVz8SA2avyC50PLLZKPedluBB6DE6KleIlpLDINwb6hGGZIITTRkd5tv00uGwm1f+hAAZjz7/xq2hVR9Y9WyJBqljKuvFkdxmo9XFg82R1AzocMXkV5wez9b+/OdHKjUhqF/BnTMA29CXx57byVya52AxdQPgHLNCDB8h2k6vhBme8ISPq4CuRFW93uWjUnkRQobjj+uWKnij/J8XoJkQF/8qjIAT3I6t4wVNOqKGCHbn4XWScwbd59f0mBTQawAWDfMdFRRs2U01B4H+/ULbVtm35ke4m+4vtqYjC7sqqfdsbvUyF9S8+R+Ab+t1nUweL96fShzoqxA9AvK4AmOgEkLrOcqwloxrgOO3qqOmo5XoOJ1UJA5bLC3XGqr7Lcx4tVD5XCyTX5J3fHrI8YqweTbhIBEIrQ6nVuheRYH6qzCPUtdkk3IFvxPNBspsH9Ibgay1pJPl8v26VMr3Po/kWm34Z47lIfcmebJqHAGK+SZdp0dvjwNi7vOHOY5wIPCUuYphbktWyhaVJNzFs+nXiZBkwMKtMQpdFCjYPuMsB35uNZS9dSzc1j507m4rBotbPQrPVJW7vY/GP4wLHvVGgjToihaxJl5PBW9nvxPNagfN352WyoEYVo9NoLaX+L0GFR1rdZa6z4u2J188SAo2J5h34126poV2TjpqgMRbyWxTXwdODH/6QsuJU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(2616005)(966005)(40460700003)(107886003)(54906003)(81166007)(356005)(6486002)(41300700001)(5660300002)(6862004)(8936002)(8676002)(82740400003)(4326008)(70586007)(478600001)(316002)(70206006)(186003)(36860700001)(47076005)(26005)(6506007)(6512007)(336012)(53546011)(33656002)(86362001)(2906002)(82310400005)(4744005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 09:59:28.1177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c918eac-66f2-4fe3-c0bb-08db6cbe0aad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7724
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 09:59:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4777

T24gMTMgSnVuIDIwMjMsIGF0IDIyOjI2LCBEZW55cyBEbXl0cml5ZW5rbyA8ZGVuaXNAZGVuaXgu
b3JnPiB3cm90ZToNCj4+IEFncmVlZCwgc2lsZW5jZSBpc27igJl0IGdvb2QsIGFuZCBhbnkgb25l
IG9mIHVzIHNob3VsZCBoYXZlIHJlc3BvbmRlZC4gIEEgDQo+PiBwcm9wb3NlZCByZXNvbHV0aW9u
IGlzIHJ1bm5pbmcgdGhyb3VnaCBpbnRlcm5hbCBDSSBub3cgdG8gY2hlY2sgaXQgZG9lc27igJl0
IA0KPj4gYnJlYWsgYW55dGhpbmcgbm93LCBob3BlZnVsbHkgaXQgd2lsbCBiZSBvbiB0aGUgbGlz
dCB0b21vcnJvdy4NCj4gDQo+IFRoYW5rcy4gSXMgaXQgYW55IGRpZmZlcmVudCBmcm9tIG15IHBy
b3Bvc2FsPw0KPiBodHRwczovL3BhdGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3QvYXJt
L3BhdGNoLzIwMjMwNjEzMTgxNzIzLjE3MTEyMTItMS1kZW5pc0BkZW5peC5vcmcvDQoNCkl0IGlz
IG5vdCA6KQ0KDQpSb3Nz

