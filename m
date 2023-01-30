Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D80EC54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 13:22:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.86])
 by mx.groups.io with SMTP id smtpd.web10.40616.1675084943266439627
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 05:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kNlI+LCH;
 spf=pass (domain: arm.com, ip: 40.107.21.86, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPHWLtYEAWHH/QAr835UTwhjTit11RSTQLj06V61Z7k=;
 b=kNlI+LCHoOKVL5fzPRIfC6gakZ9+vZySvBth4Xz8gsp9braiMbOlcCmE8IvEgMRA/iB+FaR/6XLF29qgzKV1mfyEElST1nXabUyZZczrMEYDb+gm2+ps8lhirfIz8H5vC+y1F/t/dBlD9mRnEh/qu6Fm+zWbLATZO25AmSBqlWc=
Received: from DB6PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::19)
 by DB9PR08MB6619.eurprd08.prod.outlook.com (2603:10a6:10:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 13:22:19 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::d7) by DB6PR1001CA0033.outlook.office365.com
 (2603:10a6:4:55::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.31 via Frontend
 Transport; Mon, 30 Jan 2023 13:22:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36 via Frontend Transport; Mon, 30 Jan 2023 13:22:19 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Mon, 30 Jan 2023 13:22:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bef8b879bfeb7883
X-CR-MTA-TID: 64aa7808
Received: from b7a1ba10bf0c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0A6769C1-2695-4328-9DD6-966E3F749E1A.1;
	Mon, 30 Jan 2023 13:22:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7a1ba10bf0c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 30 Jan 2023 13:22:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxhWTFfm52r+Cdo0N19tfihMZImfPoUbMibeITsk2zt9Se2/Gtu053lDuqxAMX3UkU556to31kxmmBXCM5q2D2q2SCwg2CZn21gl15dGtd6WRqRwpx/CO32DSkpWD9MEDQz10Eu9dCnC9Ie7mr99DESgCuvSr+DJzFWh7pX5IJI1FLW66f1KhKR1w0SUnWoJFyFr3ytxljm3j7mFUw2ZatEdqzn3bx++DARycKbJCzp3S6xvcm6RssGP0xuE+PlzcVlkcGy6PMgcgVCrw6hauWqoBE5JYsYkXnCZa/7ZcDZ0CBCxxApZAjlXb7Qz5O0nSmjgHydrAMJv0t42SBbtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPHWLtYEAWHH/QAr835UTwhjTit11RSTQLj06V61Z7k=;
 b=b9v5YTSav4kUiBphFPJlcYNuKWSeQ8Fl229vj8VLnoYCLsQk6qSp7Epn4zot1SKkJhuwLU8a1qT3SvXuWR4WNZlM/QtXBDCDbLQhdhCGMX0oapyFezE7T4agc0WoM+icAreSSx4VSYbrskDtv8ZsW66XrNCp1zy7v1i48+9OAr7x2JT2tXlwKteGmOMLAgzDoy7i0/pagUL5aRd87FcKsL2y1XIetev+FzqX9ZOdQk7YWBJBKs4ed4p4clsl0HT5vvj0WT1sP0Ql27pLDdOr4qW4bHYPu0uM40RKuu8ZUzgaGCyDRlIauq0tLMvcTKOaZcygwMGACDROmxkFTsfytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPHWLtYEAWHH/QAr835UTwhjTit11RSTQLj06V61Z7k=;
 b=kNlI+LCHoOKVL5fzPRIfC6gakZ9+vZySvBth4Xz8gsp9braiMbOlcCmE8IvEgMRA/iB+FaR/6XLF29qgzKV1mfyEElST1nXabUyZZczrMEYDb+gm2+ps8lhirfIz8H5vC+y1F/t/dBlD9mRnEh/qu6Fm+zWbLATZO25AmSBqlWc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB8PR08MB5420.eurprd08.prod.outlook.com (2603:10a6:10:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Mon, 30 Jan
 2023 13:22:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 13:22:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gsonvin@yahoo.com" <gsonvin@yahoo.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] yocto multilib: 32-bit libraries support
Thread-Topic: [meta-arm] yocto multilib: 32-bit libraries support
Thread-Index: AQHZMmg18SvrZ4WurUm++zAI3nbmo6629toA
Date: Mon, 30 Jan 2023 13:22:10 +0000
Message-ID: <253613DE-9912-45F3-9212-08B921D2DFA3@arm.com>
References: <792563674.226679.1674835077915.ref@mail.yahoo.com>
 <792563674.226679.1674835077915@mail.yahoo.com>
In-Reply-To: <792563674.226679.1674835077915@mail.yahoo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB8PR08MB5420:EE_|DBAEUR03FT057:EE_|DB9PR08MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 75cebc7f-729c-4194-b129-08db02c503a3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F4hUVHEfX38CjtCMo6wOE0pc9zKFrn2LMjqjSO9lwav9yJ0nYQ5WpvKYst0f4GJMRAuAp56fohj1Xuo08PBwzOTz912nQ4wi6KKwbmXL0WR4TsmjmtGd137JVXZ3aJhBToiKqRTlKujob1RYIfwat7qtcx4upyc0UF/FZv1TF0KZ3mBa9GqhHdbHlu1vy+xVtKaCtUA+wJ7D3xNvSxLWlkUsuokDLczpjmC9AQoJw10zAGuLfdLx5ZSiHdwKYOjyE/mTGmAvc4zbFNnG8H6IzHLeyscaJNfGJTFtrt2MxvQQypEtapd5Fx4Yv/rXzVv/Mf2E1eK/OTO1p1N3jJRyUDQadcY8Vd3pwSG+zC8DsYHm+i1wcRflFbxg9cbi42kSUw0VA5kzqevM0H5fsIl8UfGVuYfv2EuAkXT9tlq2qi+HzjdfyfUN3mEjUugSWsJ5P4So1qx/FjYv97EvviFbU2ys06VTBHD3nmyvSNJm+4Na+7fDylHU82Obt+mlL5tzCjr/8nmiJVtmSEZZfCrJyyvGO14b6uoAjk5TQK2CsVlISYu5giTCCAadpSDDmLrUejZAgxosV7J/LhVrr0Nf+dHzwqNrrlKIpYGYD+eXeNlhQ3JUiUNJi2KLwwj8e2I3pKDIyN1MMSToo/CJHxJ2LT4FpYyUFaQ/1NswjfWkhrG24/GBLiRQExwvoq5eXwbwtW+tfMm48B4EIqdYIUucQpPcu9DrgKN1283rvLKqGIo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199018)(8936002)(2906002)(4744005)(66946007)(41300700001)(5660300002)(66446008)(64756008)(66556008)(66476007)(6916009)(4326008)(76116006)(91956017)(316002)(8676002)(26005)(53546011)(36756003)(6486002)(2616005)(6506007)(478600001)(33656002)(6512007)(186003)(71200400001)(38070700005)(38100700002)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C80C9544AB45C444844B12C7331F6946@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5420
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78b1f42f-ee86-4ada-cde1-08db02c4fe7a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WTgr5bMclEyPv7mISjfWnbsuj5jz/Uv20f1Eq9uAKYzX9g3t/MZ4GnH75KAWKMDGHj7HRzE3OJrV2DWbuVHpnVG5CID2Wf4bt8Dal0GuC/ZdfYR4j6VlcXaSOmQeU+0aJ4pN2bF53extmuQTXO0Ubnb1tvkmbR9vCEtf4hAHvvYLmc5NNK4IHjOYyIahLAAeIuZRVY3ugxKwe51yXWEBbGxrsfEuuqMiQwJhqlu7vLkHdEmQrV2Qy285aEoNdJB2nJVgSJMu37LPkJl0AJv9dUvlw3Q0g+aBXEYiG+ErOs5BtgAjAifivnG2azwD8j2s+lhT02dnd7CQZ1Y9vijJVgjuCS+e/+Fq00MAWhe3O7uoV5md/1S3hvBGbPrjRPRdLIVMmh9sfiLje8+GXX6E39uRH3nDlgeV3yePcgJg48jgOvKMDgtoBoSUoDgiR8XTMsP/IQE5hSJgNlFOAWhks5BymefrRfzdKipb+6seMqtdufUjs1+OLW5nS2lK62kDfe2s2A7yl1Ru71onFn/SvztXU0f4VNUExGADyFCSStqGeN7TDkSZ1+G5dthBUzKfxzFYHWqZ60SAFgg6b/Fulu7U6Zn5sydC0csdygiDZN3P7oEgJtsdW4pokVJJcTMyFMe3VUCZL2WFMymIjBHlsodCLe6QQ1pO5/NUEWw+kyA7QT2VJ1/8z2nMataxY6+9UM1A09wwDVpv1RSOlzAThQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199018)(46966006)(36840700001)(40470700004)(478600001)(6486002)(2616005)(41300700001)(336012)(26005)(6512007)(186003)(6506007)(53546011)(47076005)(316002)(4326008)(70586007)(40460700003)(70206006)(8676002)(2906002)(5660300002)(82740400003)(6862004)(36756003)(356005)(36860700001)(86362001)(81166007)(82310400005)(8936002)(4744005)(33656002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:22:19.5773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cebc7f-729c-4194-b129-08db02c503a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6619
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Jan 2023 13:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4341

T24gMjcgSmFuIDIwMjMsIGF0IDE1OjU3LCBBbXkgU21pdGggdmlhIGxpc3RzLnlvY3RvcHJvamVj
dC5vcmcgPGdzb252aW49eWFob28uY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3RlOg0K
PiANCj4gSGksDQo+IEknbSB0cnlpbmcgdG8gYnVpbGQgMzItYml0IGxpYnJhcmllcyB0byBzdXBw
b3J0IGJvdGggMzItYml0IGFuZCA2NC1iaXQgdXNlciBhcHBsaWNhdGlvbiBvbiA2NC1iaXQgYWFy
Y2g2NCB0YXJnZXQuIEkgaGF2ZSBtb2RpZmllZCB0aGUgY29uZi9sb2NhbC5jb25mIGFzIGJlbG93
LiBiaXRiYWtlIGZhaWxzIGF0IHJvb3RmcyAoZGVzY3JpYmVkIGJlbG93KS4gQW55IGhlbHAgd291
bGQgYmUgcmVhbGx5IGFwcHJlY2lhdGVkIGluIGZpZ3VyaW5nIG91dCB0aGUgaXNzdWUuDQo+IA0K
PiBUaGFua3MsDQo+IEFtYXkNCj4gDQo+IGZyb20gZmlsZTogY29uZi9sb2NhbC5jb25mIC0tLS0N
Cj4gDQo+IHJlcXVpcmUgY29uZi9tdWx0aWxpYi5jb25mDQo+IE1VTFRJTElCUyA9ICJtdWx0aWxp
YjpsaWIzMiINCj4gREVGQVVMVFRVTkVfdmlydGNsYXNzLW11bHRpbGliLWxpYjMyID0gImFybXY3
YSINCj4gSU1BR0VfSU5TVEFMTF9hcHBlbmQgKz0gIiBsaWIzMi1iYXNoIGxpYjMyLWdsaWJjIGxp
YjMyLWxpYmdjYyBsaWIzMi1saWJzdGRjKyvigJ0NCg0KRmlyc3QsIG11bHRpbGliIGJ5IGRlZmlu
aXRpb24gaXMgbXVsdGlwbGUgKmxpYnJhcmllcyosIHlvdSBjYW7igJl0IGluc3RhbGwgYSAzMi1i
aXQgYmFzaCBhcyB0aGV5IGJvdGggaW5zdGFsbCBpbnRvIC91c3IvYmluLg0KDQpUaGlzIGlzIG1v
c3QgbGlrZWx5IGEgZ2VuZXJpYyBjb25maWd1cmF0aW9uIGVycm9yIGFuZCBub3QgcmVsYXRlZCB0
byBtZXRhLWFybS4gIFdoYXQgaXMgeW91ciBNQUNISU5FPyAgVGhlIHByb2JsZW0gaXMgdGhhdCBi
b3RoIHRoZSA2NC1iaXQgYW5kIDMyLWJpdCBlbnZpcm9ubWVudHMgYm90aCB0aGluayB0aGF0IHRo
ZWlyIGxpYmRpciBpcyAvdXNyL2xpYi4NCg0KUm9zcw==

