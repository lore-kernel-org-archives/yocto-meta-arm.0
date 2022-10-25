Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D53C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 18:02:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web08.1272.1666720929431849253
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 11:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tsBonIwY;
 spf=pass (domain: arm.com, ip: 40.107.21.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LyewM6QcuJDJCFa8+blafD9qyPiGXAA50akB+SqJFgIUuotmpQMBdK0F3Cf71GxbOzM1Dqy1CiBBjDkevH6+sV/oP8M08lpLK/jWxgX1UK8LQNZMtshKv9A5zT7mMv+6I6cp31+dmTTmF8U7vQ0HOKtH7hExoVgP1CtGPIakWyPRL4/+lzHJOHXZNxOjdbzIgyJE4TPB0/0H6SXmFaJ2FEmEihCyfjVzF6q94LF/WOrzt3YVGCfU8iZ8OKtA1PqyqsAZd5tVOSj9BeG2q8dCt4cebiVAg8tmYFZ0ZRJsAONLZtwHfmkpRaaS5W3cbeBt47iC+QNPqDU4HdIPIsTcyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg+wb/gAgFSjjngRMBWhKSS5EBUYZrRRA6wgddl7+70=;
 b=JaHW+zd7Fi2tAjLZLR+dBF4hPVZ3DABbaB5L01XUR8wLHSogPaMbRJVnLEcfUgUhXdjRyZet9pFQq/ZRReCzj9cnK7BPiU0Ytftgdtc7IuFSkMIofOy79xzr9T3rAgy2YTDZK99ATKDZVtye+BCAe9RFYax1bNxQFeDiO0VbqUf31IGnFaxOycMdyjXbXNrKgXa0+1/PAJ8VY3R30QuCkXG2NQSyIoXRkMqdf+a9iGO/XN/s5d0xwooyFo/t9PgbwIYQBk57BcrxomnBEeAMUQmIfykHg727KVusE4paSlLpZcPwkR8EOrElurSTbcTaqj8qe7Bb0NYLx4erDDhR8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg+wb/gAgFSjjngRMBWhKSS5EBUYZrRRA6wgddl7+70=;
 b=tsBonIwY4kzFUKhvAWPA4bHyxvWaE3jQ5BrD3F0+C9V/HsIXebcWhC+IP5hRuH4pR0xpYSd4MD+Qg4Nx6YCENjCjqL3jq6HKu13dZqEoK648TpL+6/sqkbXauT0VfTCKZEZ7Q8HHQZYMQpr8Hg6pxEfe1SHX8WEdPKL/vNhZys4=
Received: from DB6PR0301CA0043.eurprd03.prod.outlook.com (2603:10a6:4:54::11)
 by DU2PR08MB10303.eurprd08.prod.outlook.com (2603:10a6:10:491::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 18:02:05 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::ad) by DB6PR0301CA0043.outlook.office365.com
 (2603:10a6:4:54::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Tue, 25 Oct 2022 18:02:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 18:02:05 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130"); Tue, 25 Oct 2022 18:02:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1316e218ef2a4f84
X-CR-MTA-TID: 64aa7808
Received: from c489957b7fc3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E763A618-F818-4D59-BD35-521951770391.1;
	Tue, 25 Oct 2022 18:01:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c489957b7fc3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Oct 2022 18:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsKnv8Du4/15F6umnuhD0wtormlbgeB4UYalvrTXKhmtextCNPAY5IHPPs6gueGjX/fZmCMnD/yWsZdtY4DiUSdXjQSaf26I1HITUDXP+do8sRYu/or5xwRt0dnxSBnd6unLq2Z47frGwQcSUkhaVHScs93xke+cS4WDmCjOPv4EbxyEvJMRvlywxhcLYD7tzDKM/MbHmMsLtBTGVJWyRZ6cxOreB6ijcIJTaTyZm+ZR86jzSRWGqw+ajp1VGI/9d0QFlC1JVytWXCDorZ3iLBRGN6crvtavDntlh7GFZ27M5S1sZca3qzO2whg6LiAMUkoA6RLThJ6jFDZNF4Rtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg+wb/gAgFSjjngRMBWhKSS5EBUYZrRRA6wgddl7+70=;
 b=W6cCF777Ox1NhMB5AK0fjkK02V5XWQ0phtYwE9f563Jvag6vBlSCXzaUY1evD9KgGv/Dibb53mk5NoLf+bv1fPc55C+1bzmVzyCotCPGkaVL6gZ8SF/EUbFmcQSueFFYQVAJYb/TS7/6g9Zs3nP2JnJZOjxuHbKhaayzpAPQcxoeSuM9yV2w5/8sexiQHOowxwkjh4pkFWPgFmSXjJyq3O8Y2WmkwYWe2NUvqYTMd43BNvvoMeWABO+YfHu0ijBHsQADFq28NTzWxyRmKTTIUvKpy8pBOHrqIjMdmq/SIaW31nwojbWE+CjBskRJXFQr2aCF8NGYww5cxHy4kw1hkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg+wb/gAgFSjjngRMBWhKSS5EBUYZrRRA6wgddl7+70=;
 b=tsBonIwY4kzFUKhvAWPA4bHyxvWaE3jQ5BrD3F0+C9V/HsIXebcWhC+IP5hRuH4pR0xpYSd4MD+Qg4Nx6YCENjCjqL3jq6HKu13dZqEoK648TpL+6/sqkbXauT0VfTCKZEZ7Q8HHQZYMQpr8Hg6pxEfe1SHX8WEdPKL/vNhZys4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7501.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 18:01:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 18:01:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] meta-arm langdale release
Thread-Topic: [meta-arm] meta-arm langdale release
Thread-Index: AQHY570iQZ+DibYquUe3FGj9SbleD64faEAA
Date: Tue, 25 Oct 2022 18:01:55 +0000
Message-ID: <D84E6C50-F22C-4EB7-ACD8-72566839C159@arm.com>
References: <Y1auz43IW/C0KJm5@athena.kudzu.us>
In-Reply-To: <Y1auz43IW/C0KJm5@athena.kudzu.us>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7501:EE_|DBAEUR03FT054:EE_|DU2PR08MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: 905be475-0373-44f1-cfe6-08dab6b30676
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0+Q8eTtnpJisp3xR4IFF2jKPSViIwuZ38JNIcU6cRqjICq5rg9mizloogzMjNW2a9+i0Ji5MGzuRCNQ1KlxOrJbEKZvgQm7UrzGrQ8kRFE8sXqz3iJy/D33sKnCiRX7qEaHx1W1ECaaAXKZQaR79gyDwDHM1tl6W1G8Wgk1lQ3jw2vSKeXm+N/zLdPe39+Xq0Oyu/kJsmnDCfFHf9Fh+b1co3Ne7B04gFK/mUx7Gw0/zW9wNnCvf6LwPok17HLILUCWwXfo+ibQKlSMBb6fwVCMbNvfQ38h5Rcs3/1GHmDxdO7P2cX3aDEJSJUujhk3S/B8+f/zh8kl9DfMh4KrDoJEADP8cgBKEZkFQQbUlz4H70Y5bIFswjHyMOVvXlg3VC0He52DCI+5GjrKCWYA/TqRlsjpQKw42OMLQS54ke4xrqsKZnb1OQqyKuA5vP6mLfxEtjbAiOUJswn5Exo6df1oH2HQnceSsAWIa1440xCN9yaYdA8qlHyikVivZXgoXWrvTpOR+6AUYoDRvZWhvfoIv0M85YeZTsTrbc7TK3Fc3+MdEpDuRbqt1JXrLkf6beQPPujoe7licmB9/wSZnQTP8pH/HCiq3aFUfdjeWZSSrSdEeCiBuuD2x3sOym83XFZAUpH+Inb70qxgzbeY1fhKPetgBfwNWlt+dvdOeKdob1qtdpJBUZsshjp42C5FSq0XWlaJiSU0P2njPdTRzQ+Z8119P1lk60yVTE7+cj2D4vcdDu5njnUJldTui3Ys5kkLoW1LnvxRl/tDIwD4BZtux3wKI10eqqq1LzvnKZKs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(5660300002)(478600001)(36756003)(2906002)(66446008)(316002)(76116006)(66476007)(41300700001)(4744005)(66946007)(8676002)(8936002)(64756008)(6916009)(71200400001)(6486002)(33656002)(66556008)(91956017)(38070700005)(83380400001)(38100700002)(86362001)(6506007)(53546011)(122000001)(6512007)(186003)(2616005)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F27A98499BBCF84C9102F4A555DD71B7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7501
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	53f4fb01-ed90-44e3-f648-08dab6b300a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	py4lxsbg4p0at+omIvrGUEQcxWHS1esZodclTxgKOEKXuve85DIL0Q6jFL0qXqjp2FZRUQDweEaE24I2LIbbscB3wrU3B8gFdozEMIbVSzLuwFYQh1/sXPhVySGedel/5kLJpbTowmcJr53FuNnhM6cHsfONNjEiYMejDttzOXO8WKONX0UOvR+UcqQoRlvguZwjiZnPku4hOaP3SsFXnhazLnXbckrcnN5ck34348CPzIwXoS/+JgJYIad5XHl/Wf1QGJlh3hur4qEXSlCv7PEChExHzdcplbk9kwibLMDDxS0girAbhIW5+K8a1Jfdn2lkhMEogqCHK9uNvAQJ5BVC9P3uUErhQmkR8UavRP3Vf/JA+iNfRKWIxE0FXV0CpvuzS/EA3wnBHnDmIwPsHE7G5v/27R6NKMclaa4WSANwwIM64vThtQ5tceslHUUqMEJGbTCm84PIJN6AAnDu8fh3QMlxskQrPY6AOT4XpbnSP1aDPN8bczgGkZ4+N2VeV7/TvGw4NYPvBrZAvcyaN4lXgNiaO4eTOGiDq/lme2B9wheMvuo2iFjg1MlYfOOKlbsHuHzKzaPX136nxd9NX2nhZPqZ/aS7DQ5qSp54eCIsENnv8HppyJ6PTkQvtUtIqJcesGoJXXJoiVKRR8LMKR1qOUkQKy6iN95UYCNIwuElTP91d3tHZd4VFpXSe/Z77EzfLeyjwgZj6N6Ep2JzGXSvdvIRcGzGKDqXplOQJgAvDS3+PJVYtu44/YYJwY4fYIIqOeznTOBUYgUewuPLBg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(70206006)(5660300002)(33656002)(36756003)(6916009)(8676002)(86362001)(41300700001)(26005)(6506007)(316002)(8936002)(40460700003)(70586007)(2906002)(6512007)(53546011)(47076005)(81166007)(36860700001)(83380400001)(186003)(2616005)(40480700001)(336012)(82310400005)(356005)(478600001)(6486002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 18:02:05.0041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 905be475-0373-44f1-cfe6-08dab6b30676
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10303
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Oct 2022 18:02:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4034

T24gMjQgT2N0IDIwMjIsIGF0IDE2OjI3LCBKb24gTWFzb24gdmlhIGxpc3RzLnlvY3RvcHJvamVj
dC5vcmcgPGpkbWFzb249a3VkenUudXNAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+
IA0KPiBtZXRhLWFybSBoYXMgcmVsZWFzZWQgdGhlIGxhbmdkYWxlIHN1cHBvcnQgYnJhbmNoLiAg
VGhlIGJyYW5jaCB3YXMgDQo+IGZvcmtlZCBvbiAyNCBPY3QgMjAyMiBmcm9tIHRoZSBtYXN0ZXIg
YnJhbmNoIGFuZCB3YXMgdGFnZ2VkIGFzICI0LjEiLiAgVGhlIA0KPiB0YWcgaXMgR1BHIHNpZ25l
ZCBhbmQgbXkgcHVibGljIGtleSBjYW4gYmUgcHJvdmlkZWQgaWYgc29tZW9uZSB3YW50cyB0byAN
Cj4gdXNlIGl0IHRvIHZlcmlmeS4gIFBlciB0aGUgcHJldmlvdXMgcHVibGljIGRpc2N1c3Npb24g
b24gdGhpcyBsaXN0LCANCj4gbGFuZ2RhbGUgd2lsbCBvbmx5IGJlIHRha2luZyBidWcgZml4ZXMg
YW5kIGJlIHBhc3NpdmVseSBtYWludGFpbmVkDQo+ICh3aXRoIGtpcmtzdG9uZSBiZWluZyB0aGUg
YWN0aXZlbHkgc3VwcG9ydGVkIExUUykuDQoNCknigJlsbCBqdXN0IGxpa2UgdG8gdGhhbmsgZXZl
cnlvbmUgd2hvIGNvbnRyaWJ1dGVkIHRvIHRoaXMgcmVsZWFzZToNCg0KQWJkZWxsYXRpZiBFbCBL
aGxpZmkNCkFkYW0gSm9obnN0b24NCkFuZHJlaSBHaGVyemFuDQpBbnRvbiBBbnRvbm92DQpBcnVu
YWNoYWxhbSBHYW5hcGF0aHkNCkJlbiBIb3JnYW4NCkJlcnRyYW5kIE1hcnF1aXMNCkNoYW5ncWlu
ZyBMaQ0KRGF2aWRzb24gSw0KRGVueXMgRG15dHJpeWVua28NCkVtZWtjYW4NCkdvd3RoYW0gU3Vy
ZXNoIEt1bWFyDQpKaWFjaGVuZyBUYW5nDQpKaWFtZWkgWGllDQpKb2UgU2xhdGVyDQpKb24gTWFz
b24NCkthbWlsIER6aWV6eWsNCktoZW0gUmFqDQpMZW8gWWFuDQpNb2hhbWVkIE9tYXIgQXNha2Vy
DQpQZXRlciBIb3llcw0KUWkgRmVuZw0KUmljaGFyZCBQdXJkaWUNClJvc3MgQnVydG9uDQpSdWkg
TWlndWVsIFNpbHZhDQpSdXBpbmRlcmppdCBTaW5naA0KU2F0aXNoIEt1bWFyDQpTdW1pdCBHYXJn
DQpWaXNobnUgQmFuYXZhdGgNClh1ZWxpYW5nIFpob25nDQoNClRoYW5rcyB0byB5b3UgYWxsIQ0K
DQpSb3Nz

