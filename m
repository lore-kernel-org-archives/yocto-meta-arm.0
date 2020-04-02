Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.71])
 by mx.groups.io with SMTP id smtpd.web10.1486.1585812001013246373
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 00:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WnvBEy1N;
 spf=pass (domain: arm.com, ip: 40.107.2.71, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyyXQuVp3VsRG+dUCLxymG411fcmrgN6ExgpNaKLJw8=;
 b=WnvBEy1NQR7xdWlcDzu1ve7fowb8+AIQl7oT9XnUR9PFzvf6cgEGsdvmyyIrKy0oGzdlLKqeYP4U8vKHeJVhNdv5Z2Ikv3Nq3Meud3Ghfw9UA8iUJJMagamocZrNYwFSkc6sRl465M4BtURw4yalxUJn+Mt7mrQe8XbFNNN1uOE=
Received: from DB7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:10:52::24)
 by DB6PR08MB2837.eurprd08.prod.outlook.com (2603:10a6:6:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 2 Apr
 2020 07:19:58 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::42) by DB7PR02CA0011.outlook.office365.com
 (2603:10a6:10:52::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 07:19:58 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 07:19:58 +0000
Received: ("Tessian outbound af37c2b81632:v50"); Thu, 02 Apr 2020 07:19:58 +0000
X-CR-MTA-TID: 64aa7808
Received: from 5ff6a4869f59.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EA86D41C-DA71-4482-A27C-6593CB13C228.1;
	Thu, 02 Apr 2020 07:19:53 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5ff6a4869f59.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 07:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3gSHx+MgN/TpUeNvl0varEP3D786POhGvmOV0JP1bi/jqYgCjNZQOYoLVv7Kwe+5eUbJ2kSX2fQ6mYt23kZZzOiZptXKBhvD6dHxoer5Wyx6jHP1RJlJonHVlL2FagqvWDQHxbSbutIlqKCBo+YGwSStBxWhxb0xfZbv3QXbQ0fjTDzHA7sVxKMvPJr69qwbk3lJJ+osxQJZf0AM26rJCab0t46vmwzh5VB1OfLoNWtmJsGsz7H3p/Pxg8wQgDDFd/QaSO761i5gcOCU0ZAXXnImCuUuJWJXiKXXmtFJEGjLq8iSNKJpnD7qO52lY6d08Y41hKgpVPqFbS7oi5xNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyyXQuVp3VsRG+dUCLxymG411fcmrgN6ExgpNaKLJw8=;
 b=U3zYEK5tjF9U8vfqUYy9vtTB6FiGG3uWHF6zYEEZ/FF7/6/kw0cv+NL09Ekph6v0brTaFFutyT6ysQDW80qVxHOfnRM07m+e3V30amkHAuGRYlKZYyfpS8XJUghjQWNt/fXePWRPbjTdazuKnAUh1egeJXla7psHhyRBmwYOF7+8clwErye1AUJEDiikMSZfgiXE1OEq1SbknSHFjbUzYOuBeJfMguEMyPPZqVqUdaocFoD8Y9x1GvG9TmiR5qrjJ+6k8ilUCIYwOlnktTNH+SdxLxOAwm4ThsXH++TdeiicNCKzK1IJoAt9+ouI2JPVuDNjErqjMC9dFy6v6LElYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyyXQuVp3VsRG+dUCLxymG411fcmrgN6ExgpNaKLJw8=;
 b=WnvBEy1NQR7xdWlcDzu1ve7fowb8+AIQl7oT9XnUR9PFzvf6cgEGsdvmyyIrKy0oGzdlLKqeYP4U8vKHeJVhNdv5Z2Ikv3Nq3Meud3Ghfw9UA8iUJJMagamocZrNYwFSkc6sRl465M4BtURw4yalxUJn+Mt7mrQe8XbFNNN1uOE=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4147.eurprd08.prod.outlook.com (20.178.119.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Thu, 2 Apr 2020 07:19:52 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 07:19:52 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/5] layer.conf: add meta-python to LAYERDEPENDS for optee components
Thread-Topic: [meta-arm] [PATCH 1/5] layer.conf: add meta-python to
 LAYERDEPENDS for optee components
Thread-Index: AQHWCHskcCQ+wgVltUubhJRX2RijS6hlaUnA
Date: Thu, 2 Apr 2020 07:19:52 +0000
Message-ID: 
 <AM0PR08MB3987DACA79FEC5A7EBED5C4292C60@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-1-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 0f4be9bf-ae21-4911-8ab2-86da17575b72.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15e7754a-ae15-49ba-a828-08d7d6d64056
x-ms-traffictypediagnostic: AM0PR08MB4147:|DB6PR08MB2837:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB28374BF8B652CDC54CE52ED992C60@DB6PR08MB2837.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1923;OLM:1923;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(64756008)(66446008)(66556008)(66476007)(71200400001)(4326008)(316002)(66946007)(55016002)(76116006)(7696005)(6506007)(53546011)(8936002)(54906003)(81156014)(81166006)(8676002)(26005)(9686003)(6916009)(5660300002)(186003)(52536014)(33656002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 btIvtBQkk1Ax0KP3B1qIgbTCFsyoS9ptWsaKOCpqyUEDktSGowdwPUJA/R4abEbQBfnumZ0GRDY+Jomknj10n0n+oJpPd2bmgsqXpv2uazc1M3yOf6NdBh2ZKWs1o+0YNC9jHvwvuaXVQsuWl+lLU3ZOTpBe2RS+f0nNXGa7sWSDlNmj/LT5+cGsqK8FyF87AM6jAaVGPhHKcx8hflZLOLcAnMhyBx0KSN57ZQWD+2uv9vMWzxMUZqxgbqc4Dp7VdLUl5TIxd8gADz4cJyzslv3Lja9ZO708AvyNd2XQxNzvMgTyA1nXFKX0/TE/yCe/+mZE0ZFuIm1f75NfYa33S7vysIkJrSZEMOKpPpcJJTVevMHEZqmTpY/2TpnQLybuwsQlRtykD/SpBjVw16ZBCHmyZhFdT1vqKLJaocyhMsR4JB8LVoJTnY2pjfUlkkiJ
x-ms-exchange-antispam-messagedata: 
 b/7fbJU/MW0uB+HR4o7N75vZNYG9XxmNOHxxUmWO1NkDI4YZB5SGFDkTZKl8WCptzK9p9DI394eurmTy6C0J5Hkvn6zfhQ7+sBJpf/COnYm5lFXWtmOU4O3JRJuo+UwSWV8QTZJquW0wqf6zOj3EWg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(26005)(4326008)(47076004)(336012)(82740400003)(33656002)(356004)(186003)(86362001)(55016002)(9686003)(2906002)(5660300002)(6916009)(316002)(26826003)(54906003)(8936002)(478600001)(70206006)(70586007)(6506007)(7696005)(81166006)(81156014)(53546011)(52536014)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3dd50267-1000-4106-069d-08d7d6d63c85
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8P1YDZObbj/tNzZTZi4oSoDKbSoTh2Oj05mVLv8WBLThc/x7r3qDYBezsdDhbXrjxTpJEHuvr4Hwl0mYXNSPnSoxF0KoxpGz1Q/8YM3EjPmTkdzq6TChE3dsCCED4IIPTr3qfkYUcgHoZ/CMLDyRa6dGU+yoWT4vx9oPEeT25d9YAg0J4jA3TrMJlo5y5H28uqqJwMFYqedti1QGbr21hJmPSJi4Yw6cOGLly6cRiIKxGQexaCZhcqtMUw4S+hDYohvoQlmfCHyVCsgriHUxPlxPVgtbhl81TjiEWPn8TnpOS/yWZ2Zd62gpg3hyqmiRPLwHcS/p2DDMIs5UMfMT6gJZdaRNnhEBC9oca3hsrfdl+V1iHzCZMlxFDNzs2iXV1YFy7eTcvBSwvGCsf0abHtv6Mo9eJH08x3m42XcJq25fa8O2jPy3zKX1OPg+W8N+cEZSzBFAVDT6bRaNvB16EFAqgq4qc054bYNccW/I7SyleT1AqZS/KP+KltdHaylx6xKh+Kexy5hTP0CJk1Xhyw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 07:19:58.6920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e7754a-ae15-49ba-a828-08d7d6d64056
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2837
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 02 April 2020 00:13
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 1/5] layer.conf: add meta-python to
> LAYERDEPENDS for optee components
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> optee components use pycrypto, pycryptodomex and pyelftools from meta-
> python layer
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm/conf/layer.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf index
> 0b93e8d..d96e9f1 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -9,5 +9,8 @@ BBFILE_COLLECTIONS +=3D "meta-arm"
>  BBFILE_PATTERN_meta-arm =3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm =3D "6"
>=20
> -LAYERDEPENDS_meta-arm =3D "core"
> +LAYERDEPENDS_meta-arm =3D " \
> +    core \
> +    meta-python \
> +"
>  LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus dunfell"
> --
> 2.7.4

