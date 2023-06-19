Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05213EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 16:10:55 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.55])
 by mx.groups.io with SMTP id smtpd.web11.11509.1687191043843170945
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 09:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hJnyAy5P;
 spf=pass (domain: arm.com, ip: 40.107.105.55, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AojrBTQ8Z//iJBS458JwFMbBM8DEiuomDuwWBY2sAwg=;
 b=hJnyAy5P6jGBaKcg79Xmh21lBr5/Qoo4mZ4G8Icw+TT8UaK4a2UZc/WjfyCeKxarzT3qa3n8kkuAuAaG7kndiT1VzpONji/EemYCpUuPAdqp+4QSaEIXQ39I2ZuAUmT26JnhG9yisUj0yiZGHPS46FcFom07Qg6QzKo+7p+sorU=
Received: from DUZPR01CA0260.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::8) by DB9PR08MB9681.eurprd08.prod.outlook.com
 (2603:10a6:10:45c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 16:10:39 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::c7) by DUZPR01CA0260.outlook.office365.com
 (2603:10a6:10:4b9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36 via Frontend
 Transport; Mon, 19 Jun 2023 16:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.20 via Frontend Transport; Mon, 19 Jun 2023 16:10:39 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Mon, 19 Jun 2023 16:10:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5d2b0ddfaab4db2
X-CR-MTA-TID: 64aa7808
Received: from 5b9d5e6bd842.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F2D193F5-D5DD-4564-B567-42FB6482475B.1;
	Mon, 19 Jun 2023 16:10:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b9d5e6bd842.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 19 Jun 2023 16:10:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpDN9Tp7sou4qF1pGyB0wSk9rhb6RmkjHtbJefRnAg6rCzk6WcUpXpzgz2dT/3JstmylM/zMS7GKHsFLJ/HalVh/XZM4qFH6RYBDp6+q18PweQtnknLU0QkpcbttOW8hPukqTKKbz0BTKJyFercqzCYIZ7HnCbNDbrzqnrHpG2BTajcmTaKUPx4MqBqJ8BsXoq5TUAi21fwSmPxd3C9Lo6+6ZocFGAEXXKa9ex/7cRKYwcoJHG+98ftlQ4gSgF8I/KL9HCdUjIsf/pMY16FexLF5+HMBFQvJuNL4KZNPKw8fPUUDpTdAhku3dC5YSpmvYwLLdh8+15ywvF18PsA2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AojrBTQ8Z//iJBS458JwFMbBM8DEiuomDuwWBY2sAwg=;
 b=aACxRwHN3g6X8OMjFlWDdYcLZLsdLIjnX0buwlw+HqNSdsr2MDHxVjbv3D6umCMbrV5bL/QgShYHY60RPceYqZnYUZhalgrP9SROULYRnd9dB/FTEEx/VAN0hoX2cw8pWw6fnsVJzzsHZrBTMMZjKO0Fo28XPQ4CIGJIbW/tSGLhmB7Vlbs5EvdRCdO9i2z55CyHErw5pn2lsvVv8OQydS+fbUakD2ozpZIuqt65c7OF6GWJyAameDW/kLolfJtM8k8QHMfauOY1nVsNYaIOrO8jNtVHejOqXagr6Vl+D6GBggXnWtoxxFq4uvG4UpHi7OrqGs9qqCS3mQ5Dh/BaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AojrBTQ8Z//iJBS458JwFMbBM8DEiuomDuwWBY2sAwg=;
 b=hJnyAy5P6jGBaKcg79Xmh21lBr5/Qoo4mZ4G8Icw+TT8UaK4a2UZc/WjfyCeKxarzT3qa3n8kkuAuAaG7kndiT1VzpONji/EemYCpUuPAdqp+4QSaEIXQ39I2ZuAUmT26JnhG9yisUj0yiZGHPS46FcFom07Qg6QzKo+7p+sorU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10313.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 16:10:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%6]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 16:10:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 2/2] gn: Fix build with gcc13
Thread-Topic: [meta-arm] [PATCH 2/2] gn: Fix build with gcc13
Thread-Index: AQHZoH76beZwg9tMlUuln53pqp+ZB6+SUBqA
Date: Mon, 19 Jun 2023 16:10:31 +0000
Message-ID: <301A7EFA-1C6B-453D-B616-83274136E013@arm.com>
References: <20230616181712.4168591-1-raj.khem@gmail.com>
 <20230616181712.4168591-2-raj.khem@gmail.com>
In-Reply-To: <20230616181712.4168591-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10313:EE_|DBAEUR03FT030:EE_|DB9PR08MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb800a0-2327-4ce5-3bcb-08db70dfb98b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 37wZhgrszw7DNbb/FMk24p7S+ejY7xvJhuKSPe8gfqVhuK+1P9Qz/aHm9QL+09RkXJQHz83ltzzT7fKtjLevBB+QhQdo9nCkrt0i8XKhaHgTScR4OTmu1485Rd5a42VV5i8tVnPUYZCe32DhFk1nETdtcJagGMWHD3TfgqpnHkn2qw8U/ocu/+JARx9VOyF2pf6bNCMtgRgqKNXB2Fg7YRHqqKBlliYxA7aguWLcusMv2DzLKgXHxO0XNQE5kQ3OqbmF4mf1TxsaH9t1LpI0aZ47/jE5nQ0nwGpMY+ykt76+sr465oPloczCoi9jike6EdSJ0tnHaPBlhpqOtcA33xrI+idnrHK8UG1mEHfE4/omANSOS0a6hZfAq8nsGaBbog3P9t1yUQZB6+LbWH9UVAMXGjT08IyFV0jjzQP84pCmZ2QM1uT7OIer5qhdfMxTjEIoFauFOx4ni8f4t8HTghcq9joZ9BmW2Ddi/EZ9szgfJ4X7i5xcHWkNvPMovtSvMEMzXzuhAN8PWpPsPCBRF8glwybBndSY6ZX14lEYCp3+MVD9XU7SQ6xmEuY8sM87E8miyJz7vlTH8b7yJVfU5Gao0Ah6Yf9VYKFaYrzy8gI3JwBtJW+PAVykgZrQLXJR
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(4326008)(71200400001)(478600001)(76116006)(91956017)(6506007)(53546011)(6512007)(26005)(6486002)(186003)(966005)(36756003)(2906002)(8676002)(41300700001)(38070700005)(8936002)(66946007)(66446008)(64756008)(66556008)(66476007)(6916009)(316002)(5660300002)(66899021)(83380400001)(38100700002)(33656002)(86362001)(122000001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA7A1214FF96CA4E85344860C01CBE23@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10313
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ba4b3a27-da1b-44bb-6e8a-08db70dfb4b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4ZPrYC3lUDw7wQVuhZefZjAU3B9FerJOT8ri0YmKMAaPh8EYwa4TDwiftzSZfOnWYKUqzY6kPTca1MGrZ7OAhEOU8ERyEFB5KuielRbOWZLyhvqLBWsEgio+WcbQ0xwsOGgX/A1125100Z1YMpVnNZRuIjlOTEmobVrfLRCdSgOoDcZ6uncUDFMA7Ni6mlT2rOSKCdH1OEEgdO5gnQ09cu1HoDU8tSndLUd+T4Vy/Hq54HY0x1+jAzZsRFQJzwg4jIZu2W2AEWWizXeF4oR8IrK83ox8stjB5XOc97sPAW3uB0P9+sVjQy8LAPN+00deTKsphNQKSev+hebfJ3BHALb4DIY0EOX0ZTVnaxMChSR90z1TsR2oP7eOO+gCjDygb6ckjHZyiif4GfYlTnVH7HDvpY632QvQaVKj3vgTKu8fraaIRLfRDKM8ZX+pcZ+eaE0uAdzQZLgOr7+50C1EKvAiQOdKfO6KtokpjA9PCJTSog9aEdup+CD4GgRUzSLq0Mv6Z6jiAfcFkzSA+GiKCx+pyIPEQQGPMdfZg1waZEGl7dyaLeZBp1KI6KuTK8MgwBbn+uls8b6U9iIOsPfLK08mJkclPe/ziXuINAq5Rumxoc+7hUaZaPC7fA2jGdsGQqUixJ8l9ppEc3T7bOdEU67QHaFPERFjgrGmLfiZyY9pg3pF9NQC4khewRIJFJbaz+wG/alHzEdDDtC81vFetubFE/HWrleSChp5sNkRUnM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(83380400001)(47076005)(6486002)(316002)(8676002)(8936002)(2616005)(36756003)(6862004)(6506007)(6512007)(86362001)(26005)(4326008)(33656002)(186003)(336012)(41300700001)(5660300002)(82310400005)(53546011)(70586007)(70206006)(40460700003)(82740400003)(356005)(966005)(66899021)(81166007)(40480700001)(478600001)(36860700001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 16:10:39.5828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb800a0-2327-4ce5-3bcb-08db70dfb98b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9681
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Jun 2023 16:10:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4805

VGhpcyBicmVha3MgdGhlIGJ1aWxkIHdpdGggZ2NjMTIuMiB0aG91Z2g6DQoNCjIwMjMtMDYtMTkg
MTQ6NDg6MDcgLSBJTkZPIC0gfCAuLi9naXQvc3JjL2duL2Rlc2NfYnVpbGRlci5jYzogSW4gbWVt
YmVyIGZ1bmN0aW9uIOKAmGJhc2U6OlZhbHVlIHthbm9ueW1vdXN9OjpCYXNlRGVzY0J1aWxkZXI6
OlRvQmFzZVZhbHVlKGNvbnN0IFNjb3BlKinigJk6DQoyMDIzLTA2LTE5IDE0OjQ4OjA3IC0gSU5G
TyAtIHwgLi4vZ2l0L3NyYy9nbi9kZXNjX2J1aWxkZXIuY2M6MTgwOjEyOiBlcnJvcjogdXNlIG9m
IGRlbGV0ZWQgZnVuY3Rpb24g4oCYYmFzZTo6VmFsdWU6OlZhbHVlKGNvbnN0IGJhc2U6OlZhbHVl
JinigJkNCjIwMjMtMDYtMTkgMTQ6NDg6MDcgLSBJTkZPIC0gfCAxODAgfCByZXR1cm4gcmVzOw0K
MjAyMy0wNi0xOSAxNDo0ODowNyAtIElORk8gLSB8IHwgXn5+DQoyMDIzLTA2LTE5IDE0OjQ4OjA3
IC0gSU5GTyAtIHwgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL2dpdC9zcmMvZ24vY29tbWFuZHMu
aDoxNCwNCjIwMjMtMDYtMTkgMTQ6NDg6MDcgLSBJTkZPIC0gfCBmcm9tIC4uL2dpdC9zcmMvZ24v
ZGVzY19idWlsZGVyLmNjOjEwOg0KMjAyMy0wNi0xOSAxNDo0ODowNyAtIElORk8gLSB8IC4uL2dp
dC9zcmMvYmFzZS92YWx1ZXMuaDozNjc6Mzogbm90ZTogZGVjbGFyZWQgaGVyZQ0KMjAyMy0wNi0x
OSAxNDo0ODowNyAtIElORk8gLSB8IDM2NyB8IFZhbHVlKGNvbnN0IFZhbHVlJikgPSBkZWxldGU7
DQoyMDIzLTA2LTE5IDE0OjQ4OjA3IC0gSU5GTyAtIHwgfCBefn5+fg0KMjAyMy0wNi0xOSAxNDo0
ODowNyAtIElORk8gLSB8IC4uL2dpdC9zcmMvZ24vZGVzY19idWlsZGVyLmNjOiBJbiBpbnN0YW50
aWF0aW9uIG9mIOKAmGJhc2U6OlZhbHVlIHthbm9ueW1vdXN9OjpCYXNlRGVzY0J1aWxkZXI6OlRv
QmFzZVZhbHVlKGNvbnN0IHN0ZDo6dmVjdG9yPFQ+JikgW3dpdGggVCA9IFZhbHVlXeKAmToNCjIw
MjMtMDYtMTkgMTQ6NDg6MDcgLSBJTkZPIC0gfCAuLi9naXQvc3JjL2duL2Rlc2NfYnVpbGRlci5j
YzoxOTQ6NDQ6IHJlcXVpcmVkIGZyb20gaGVyZQ0KMjAyMy0wNi0xOSAxNDo0ODowNyAtIElORk8g
LSB8IC4uL2dpdC9zcmMvZ24vZGVzY19idWlsZGVyLmNjOjE3MToxMjogZXJyb3I6IHVzZSBvZiBk
ZWxldGVkIGZ1bmN0aW9uIOKAmGJhc2U6OlZhbHVlOjpWYWx1ZShjb25zdCBiYXNlOjpWYWx1ZSYp
4oCZDQoyMDIzLTA2LTE5IDE0OjQ4OjA3IC0gSU5GTyAtIHwgMTcxIHwgcmV0dXJuIHJlczsNCjIw
MjMtMDYtMTkgMTQ6NDg6MDcgLSBJTkZPIC0gfCB8IF5+fg0KMjAyMy0wNi0xOSAxNDo0ODowNyAt
IElORk8gLSB8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi9naXQvc3JjL2duL2NvbW1hbmRzLmg6
MTQsDQoyMDIzLTA2LTE5IDE0OjQ4OjA3IC0gSU5GTyAtIHwgZnJvbSAuLi9naXQvc3JjL2duL2Rl
c2NfYnVpbGRlci5jYzoxMDoNCjIwMjMtMDYtMTkgMTQ6NDg6MDcgLSBJTkZPIC0gfCAuLi9naXQv
c3JjL2Jhc2UvdmFsdWVzLmg6MzY3OjM6IG5vdGU6IGRlY2xhcmVkIGhlcmUNCjIwMjMtMDYtMTkg
MTQ6NDg6MDcgLSBJTkZPIC0gfCAzNjcgfCBWYWx1ZShjb25zdCBWYWx1ZSYpID0gZGVsZXRlOw0K
MjAyMy0wNi0xOSAxNDo0ODowNyAtIElORk8gLSB8IHwgXn5+fn4NCg0KSXMgdGhlcmUgYSBzb2x1
dGlvbiB3aGljaCB3b3JrcyBmb3IgYm90aD8NCg0KUm9zcw0KDQo+IE9uIDE2IEp1biAyMDIzLCBh
dCAxOToxNywgS2hlbSBSYWogdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHJhai5raGVtPWdt
YWlsLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAuLi5SZW1vdmUtcmVk
dW5kYW50LW1vdmUtaW4tcmV0dXJuLXN0YXQucGF0Y2ggfCA0MyArKysrKysrKysrKysrKysrKysr
DQo+IG1ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiICAgICAgICB8ICAxICsN
Cj4gMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL2duL2duLzAwMDEtZGVzY19idWlsZGVyLmNjLVJl
bW92ZS1yZWR1bmRhbnQtbW92ZS1pbi1yZXR1cm4tc3RhdC5wYXRjaA0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ24vMDAwMS1kZXNjX2J1aWxkZXIuY2Mt
UmVtb3ZlLXJlZHVuZGFudC1tb3ZlLWluLXJldHVybi1zdGF0LnBhdGNoIGIvbWV0YS1hcm0vcmVj
aXBlcy1kZXZ0b29scy9nbi9nbi8wMDAxLWRlc2NfYnVpbGRlci5jYy1SZW1vdmUtcmVkdW5kYW50
LW1vdmUtaW4tcmV0dXJuLXN0YXQucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggMDAwMDAwMDAuLmY3MTIwMzdhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS1hcm0v
cmVjaXBlcy1kZXZ0b29scy9nbi9nbi8wMDAxLWRlc2NfYnVpbGRlci5jYy1SZW1vdmUtcmVkdW5k
YW50LW1vdmUtaW4tcmV0dXJuLXN0YXQucGF0Y2gNCj4gQEAgLTAsMCArMSw0MyBAQA0KPiArRnJv
bSA0NTY3M2Y0ZjYyZWIwNjNkNmQ1YWEwYWQ2OGE2MTcxOTM2YWQ5MzQ3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQ0KPiArRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gK0Rh
dGU6IFR1ZSwgMjQgSmFuIDIwMjMgMDA6MTM6NTcgLTA4MDANCj4gK1N1YmplY3Q6IFtQQVRDSF0g
ZGVzY19idWlsZGVyLmNjOiBSZW1vdmUgcmVkdW5kYW50IG1vdmUgaW4gcmV0dXJuIHN0YXRlbWVu
dA0KPiArDQo+ICtGaXhlcyBidWlsZCB3aXRoIGdjYzEzDQo+ICsNCj4gKy4uL2dpdC9zcmMvZ24v
ZGVzY19idWlsZGVyLmNjOiBJbiBtZW1iZXIgZnVuY3Rpb24gJ2Jhc2U6OlZhbHVlIHthbm9ueW1v
dXN9OjpCYXNlRGVzY0J1aWxkZXI6OlRvQmFzZVZhbHVlKGNvbnN0IFNjb3BlKiknOg0KPiArLi4v
Z2l0L3NyYy9nbi9kZXNjX2J1aWxkZXIuY2M6MTc5OjIxOiBlcnJvcjogcmVkdW5kYW50IG1vdmUg
aW4gcmV0dXJuIHN0YXRlbWVudCBbLVdlcnJvcj1yZWR1bmRhbnQtbW92ZV0NCj4gKyAgMTc5IHwg
ICAgIHJldHVybiBzdGQ6Om1vdmUocmVzKTsNCj4gKyAgICAgIHwgICAgICAgICAgICB+fn5+fn5+
fn5efn5+fg0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9nbi1y
ZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2duLysvMTUwMDBdDQo+ICtTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiArLS0tDQo+ICsgc3JjL2duL2Rlc2NfYnVp
bGRlci5jYyB8IDQgKystLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9zcmMvZ24vZGVzY19idWlsZGVyLmNj
IGIvc3JjL2duL2Rlc2NfYnVpbGRlci5jYw0KPiAraW5kZXggNDQ0YTVlMDIuLjNlZjE3MGMzIDEw
MDY0NA0KPiArLS0tIGEvc3JjL2duL2Rlc2NfYnVpbGRlci5jYw0KPiArKysrIGIvc3JjL2duL2Rl
c2NfYnVpbGRlci5jYw0KPiArQEAgLTE2Nyw3ICsxNjcsNyBAQCBjbGFzcyBCYXNlRGVzY0J1aWxk
ZXIgew0KPiArICAgICBiYXNlOjpMaXN0VmFsdWUgcmVzOw0KPiArICAgICBmb3IgKGNvbnN0IGF1
dG8mIHYgOiB2ZWN0b3IpDQo+ICsgICAgICAgcmVzLkdldExpc3QoKS5lbXBsYWNlX2JhY2soVG9C
YXNlVmFsdWUodikpOw0KPiArLSAgICByZXR1cm4gc3RkOjptb3ZlKHJlcyk7DQo+ICsrICAgIHJl
dHVybiByZXM7DQo+ICsgICB9DQo+ICsgDQo+ICsgICBiYXNlOjpWYWx1ZSBUb0Jhc2VWYWx1ZShj
b25zdCBTY29wZSogc2NvcGUpIHsNCj4gK0BAIC0xNzYsNyArMTc2LDcgQEAgY2xhc3MgQmFzZURl
c2NCdWlsZGVyIHsNCj4gKyAgICAgc2NvcGUtPkdldEN1cnJlbnRTY29wZVZhbHVlcygmbWFwKTsN
Cj4gKyAgICAgZm9yIChjb25zdCBhdXRvJiB2IDogbWFwKQ0KPiArICAgICAgIHJlcy5TZXRLZXko
di5maXJzdCwgVG9CYXNlVmFsdWUodi5zZWNvbmQpKTsNCj4gKy0gICAgcmV0dXJuIHN0ZDo6bW92
ZShyZXMpOw0KPiArKyAgICByZXR1cm4gcmVzOw0KPiArICAgfQ0KPiArIA0KPiArICAgYmFzZTo6
VmFsdWUgVG9CYXNlVmFsdWUoY29uc3QgVmFsdWUmIHZhbCkgew0KPiArLS0gDQo+ICsyLjM5LjEN
Cj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1hcm0vcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhLWFybS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYg0KPiBpbmRleCA0ZTdm
YTlmNy4uNDRhN2YzYTYgMTAwNjQ0DQo+IC0tLSBhL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMv
Z24vZ25fZ2l0LmJiDQo+ICsrKyBiL21ldGEtYXJtL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0
LmJiDQo+IEBAIC01LDYgKzUsNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSINCj4gTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MGZjYTAyMjE3YTVkNDlhMTRkZmUyZDEx
ODM3YmIzNGQiDQo+IA0KPiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXA0KPiArICAgICAgICAgICBmaWxlOi8vMDAwMS1k
ZXNjX2J1aWxkZXIuY2MtUmVtb3ZlLXJlZHVuZGFudC1tb3ZlLWluLXJldHVybi1zdGF0LnBhdGNo
IFwNCj4gICAgICAgICAgICBmaWxlOi8vMDAwMS1SZXBsYWNlLWxzdGF0NjQtc3RhdDY0LWZ1bmN0
aW9ucy1vbi1saW51eC5wYXRjaCINCj4gU1JDUkVWID0gIjRiZDFhNzdlNjc5NThmYjdmNjczOWJk
NDU0MjY0MTY0NmYyNjRlNWQiDQo+IFBWID0gIjArZ2l0JHtTUkNQVn0iDQo+IC0tIA0KPiAyLjQx
LjANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCM0ODAzKTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS1hcm0vbWVzc2Fn
ZS80ODAzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L210Lzk5NTc2NTUzLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG1ldGEtYXJtK293bmVyQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL21ldGEtYXJtL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPiANCg0K

