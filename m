Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.80])
 by mx.groups.io with SMTP id smtpd.web10.54138.1584974195456140962
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 07:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RMWVk7mL;
 spf=pass (domain: arm.com, ip: 40.107.4.80, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcTkc/CR0RXhY24jIBdNAPHFSqa7Uaoc6XwvUftY5rc=;
 b=RMWVk7mLCUNeglqqcT5r/DXYnfKUkqEZH5ENN5+gxg2Wcf2VSZ7TvpanfTUt/vJ7kS8U0HKWSxm0P2uxsaigS//TFejewANr/7ovpQ+NDYSFDPjqlcP2OpWpiOWeSk6XhzAnxipxqnu2hTbMYnthFHxbuh72U9yz/KYqZvrydcs=
Received: from AM4PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:205:2::18)
 by DB8PR08MB4009.eurprd08.prod.outlook.com (2603:10a6:10:af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 23 Mar
 2020 14:36:33 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:2:cafe::8) by AM4PR08CA0047.outlook.office365.com
 (2603:10a6:205:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Mon, 23 Mar 2020 14:36:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 14:36:33 +0000
Received: ("Tessian outbound aed43bac6b97:v48"); Mon, 23 Mar 2020 14:36:33 +0000
X-CR-MTA-TID: 64aa7808
Received: from ebef402a0d76.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D412E144-28EF-4C53-ADC7-F5A57867D079.1;
	Mon, 23 Mar 2020 14:36:28 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ebef402a0d76.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Mar 2020 14:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz0Q0iBZXQOMykXqZruOamRN5s7PcttUx3CSs5zl/H4rjQmppeojz7xqWJMeh6lmIzSE1a6Jj0Rq+Kgsg2NguT78GH9dsZw1bRYpvEJoYQ0NKFwWhe63Z7hqAAUMXhIHOunYRfHCgFkjmZnA/3ZMrz7Gj8nh6G/9fh7gK/jpLgdj8oVj7pTacPdSoxFU7Wvoby889fmNFuihUMNUvYjy/u/u7q1HoHkYHVqBEqiLaW7iMGJTVKgXW1EhZ9d4BJKdfIAtsJaUPXjnRyKL8NPOw3MeEVVNtiWLB8+wX/ogwtQpmfDbcQmGDaz6MOSmzxA6/eWzryVgz1fYEfO10nXPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcTkc/CR0RXhY24jIBdNAPHFSqa7Uaoc6XwvUftY5rc=;
 b=S8GjNf2C5Imx198z1uFkirZNfmDVVMhMkJm4hz3MHGhBYIDExHPrPoDPm5tr25y9cw7zl5iQelzco2AJ+S/n6CJFgJMpaTSnz/dp/lFQEbopwQjjrr9by0uqcS1uYIx2EveYYlzpJUW03s4ikXFjseLMCojzRPAvEsLtitCUGN5NHz6T+17QVi+/ME0tw+oBlKpR6liRdjsi9uiso1aH2Ha+/reBAbJxrg08yJ3AiIgg4uraRMM7p5dMP3FM0+sbepAZ6b5gqgfO8SZsBIEwOLVgha1hREkig3thc4hdGCnt5yREspY4UlbBi2PSDC90+GKse3KzyLybuFDZkL5duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcTkc/CR0RXhY24jIBdNAPHFSqa7Uaoc6XwvUftY5rc=;
 b=RMWVk7mLCUNeglqqcT5r/DXYnfKUkqEZH5ENN5+gxg2Wcf2VSZ7TvpanfTUt/vJ7kS8U0HKWSxm0P2uxsaigS//TFejewANr/7ovpQ+NDYSFDPjqlcP2OpWpiOWeSk6XhzAnxipxqnu2hTbMYnthFHxbuh72U9yz/KYqZvrydcs=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5236.eurprd08.prod.outlook.com (20.179.39.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 14:36:27 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 14:36:27 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
Thread-Topic: [meta-arm] [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
Thread-Index: AQHWAR5uDZiuST4/+0uEDwiYmJhvGKhWO/YAgAABolA=
Date: Mon, 23 Mar 2020 14:36:27 +0000
Message-ID: 
 <AM0PR08MB39878AF05CF71228FAF5222792F00@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200323142146.30350-1-jon.mason@arm.com>
 <DF312761-3229-498A-8A74-7F95875AE6E8@arm.com>
In-Reply-To: <DF312761-3229-498A-8A74-7F95875AE6E8@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-email-id: 33b24687-7cdc-44cc-af58-fbed06428d2f
x-ts-tracking-id: 56701196-eae4-47f3-8231-e7d6d5b63c09.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e8c8727-8f06-4e16-4ab0-08d7cf379572
x-ms-traffictypediagnostic: AM0PR08MB5236:|DB8PR08MB4009:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB4009FC179095446AD55246FC92F00@DB8PR08MB4009.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0351D213B3
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(199004)(26005)(4326008)(8936002)(71200400001)(76116006)(66476007)(33656002)(66556008)(66946007)(66446008)(186003)(64756008)(9686003)(55016002)(86362001)(966005)(4744005)(316002)(2906002)(7696005)(5660300002)(6506007)(478600001)(6916009)(81166006)(81156014)(8676002)(52536014)(32563001)(16752965003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB5236;H:AM0PR08MB3987.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Z2WpPDJcbaZcR3l4AqSyUx1es6laZsQiytkEDJn9Ar+MYnlGGjA+uP+ESTUE9m7BSwh6wqA91oWRvyTLUlQrUXoRrNMfC/uSpIbOf4V+OWTtmxUl+fcJlBhuVa45YDCDqqqaS4iFhMiKGGUbOdLwv27m7eTOdTfsqf6okBC6eQLe37m00iPSQKn8ZW3/VlXQKShrS+Zs81pfJ7dsLzUuy6DJ8nzA+qKju3RnBL2JZTKERTDKe9vxP61vjulVOf63YJf6hPUAwSL4kN+IhM4Gi90Do86GjeeU1PWX4L8hGvYY30LYG/D4Gbh5kxsSBpyCk7TVT6EQPAl5Ybg4Lh151dX/m3Q/pIdWO3RI2GCWoFbaVKTfPx1whk7jVnl5mXotDdDaViAL6SHmZvaCMkpHossGVg9MZ6WVu+TGz53pwYE7/NY1LE9UdgiRG+bAn+/hYxexJwSZ5bVVrf4zDy0bf5Z+RzQOttDdEXtKNeMEYTaqmuVE74pvWPD8qiJHw+byNdfMs8YYBtR+aIgq4GQls6W7ItxWOEJMSeOIowd1WGq8Bj+dyqSnAnVEytB/xOhpiRJDLt7oMnsigMFa1fDNFyHrL11XxiKK8cSvIuulD+Y=
x-ms-exchange-antispam-messagedata: 
 mQYrwKqwkjZ4cb/QcVLlriP/zVB6qTb10VTfbry4ha09TWD75iF1Tz9wiVhCpTjbAIsjVbhq4eF2REDBU8T9S4MtiMF/FhHkmk584cR2Mtti88R60j8unk/WRPPYYWQZQr2OyYIfTYLgX2XR9ov9lA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5236
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(136003)(396003)(346002)(376002)(199004)(46966005)(9686003)(81156014)(55016002)(8676002)(356004)(81166006)(52536014)(6916009)(70586007)(966005)(70206006)(26826003)(478600001)(336012)(33656002)(86362001)(8936002)(47076004)(2906002)(186003)(26005)(5660300002)(36906005)(7696005)(316002)(6506007)(4326008)(32563001)(16752965003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB8PR08MB4009;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c1983432-553d-4cb5-f709-08d7cf3791ea
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BDYyHLVg5DLP8iNn7Fl1iL2eG/yQwUKFYtxCncsYPO7fY++ARgOdwbmXTgmdmLE7C06F9AEhtc4x4DqhRsnMHywMmsBh3Od25an3SAvDjzKR+5gV/+VpT89kjCPHmEEOEsuJe1poaDo74RpxGnQvhKPT8CgTdwDZ225fX/ULj87kHQvlzBcgUDfXVlj9TGo6W545RnLkunE8+TCPTgu/hea+WLKMjtIqgKy1GbUlT6pOThwenh3UQqQbqJNyvKB2hEhch722XKcjRPRqu5iCjU3xIpBpMHYwmiPCTnudf2jRZhvd9j5GciCyT258O1TSpyuCVAX3Vm5L9tkixcqN96UvM9lqvoUECUPhO1EQpemwE+oLkCOSxY4cClfIFhPydKLg8+YFXJouocuznFGhqCKKaU/MNLfRjBm7fAXwGVJ59NsxHKa/GlH5AHHM6qs88uky7LzVL9bxNdPUhrMDtL503hKf7LkiBu5YHOeLahz9CUN/qFO/MvvfgpjbPKSTcQvvmXKOdVoBG7R9SjLgcyR1WklNfqmboESheZPpqrmXYOQGmqFF+ZkBxYByw3GNx3oqOWHkMkNVYoKEXlyLGMoTBaNDkYfoZE9Tc7w5F8RxRz3Lr2wGRVQ8598CRYPkwwiqcicE3C726LumJCQ7Gg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 14:36:33.3050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8c8727-8f06-4e16-4ab0-08d7cf379572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4009
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 23 Mar 2020, at 14:21, Jon Mason via http://Lists.Yoctoproject.Org <mail=
to:jon.mason=3Darm.com@lists.yoctoproject.org> wrote:

The current WIC references in the A5DS config file are causing a build
break, due to not being defined. =A0These WIC files should be revisited
once the IOTA distro is present.

Change-Id: Ied2cd6f768625d18150ed60bd5fe317e06c7f48a
Signed-off-by: Jon Mason <mailto:jon.mason@arm.com>
Acked-by: Bertrand Marquis <mailto:bertrand.marquis@arm.com>
Acked-by: Diego Sueiro <diego.sueiro@arm.com>

---
meta-arm-bsp/conf/machine/a5ds.conf | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machin=
e/a5ds.conf
index 136105b..fa7d88e 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -14,7 +14,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boo=
t"

SERIAL_CONSOLES =3D "115200;ttyAMA0"

-IMAGE_FSTYPES +=3D "tar.bz2 wic wic.nopt cpio.gz"
+IMAGE_FSTYPES +=3D "tar.bz2 cpio.gz"

EXTRA_IMAGEDEPENDS +=3D "u-boot"

--=20
2.17.1


