Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web12.1029.1585722511295374569
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 31 Mar 2020 23:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mHuoKQG5;
 spf=pass (domain: arm.com, ip: 40.107.22.56, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITSZxKSDydLK+kKXrEpDkMZATgiUxxnYn1VUXDjSxs4=;
 b=mHuoKQG5zW9qaA2DqQ/CrFZeuqbS+rLV6Kjsn1F1QbVqeReuM6itOjgc3wiWiw4KnOm+XxKAU1Ttd8+FOtMBSS4nA0UBDJN7+sxxCNG+TbaYsAcUcoaoota5RVyCIUo+6WkxhpFcMpW0N+3TnGAIYUmW5a/v/7TJr6jaP3DCKD0=
Received: from AM6PR0502CA0068.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::45) by HE1PR0801MB1625.eurprd08.prod.outlook.com
 (2603:10a6:3:7f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Wed, 1 Apr
 2020 06:28:27 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::8a) by AM6PR0502CA0068.outlook.office365.com
 (2603:10a6:20b:56::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Wed, 1 Apr 2020 06:28:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 1 Apr 2020 06:28:27 +0000
Received: ("Tessian outbound 55454527ea3b:v50"); Wed, 01 Apr 2020 06:28:27 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8cbf17747667.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9775B4C1-7D80-4833-8DD9-C91BB7BCE70C.1;
	Wed, 01 Apr 2020 06:28:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8cbf17747667.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Apr 2020 06:28:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH1k40KcYnUcp+HCLBLDvM2wwv9HfWNQAXqUvgiPFx+rXklcqmwSIc7ANDeZAb+MdZU28mR+V1eL0JnXLXOn/weK/maKjqKWdvIYuXFYhzKeUQjIIN2iOk5URphN6JCS/8lwAyOqy8lrsIUDVP82XqX36sjAvVJLn4yeCyo+llRZaoQEB+OTUv4VHmTM+6YHDvpQijYUQC/6gDwU56KKyP8QZsaRn++Uuj1BKIcsIv6XXpWF3Q9Uewxmjnq0Au47rCxgdy5ZnhgBCb/qEjw9hH9rXoRsMbnfGNrHKFfRE1jUFVD+D1wOU/R2lawLITf8c6QrktW8vAvpvKYr1yLuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITSZxKSDydLK+kKXrEpDkMZATgiUxxnYn1VUXDjSxs4=;
 b=beyl+5JU2SsDqnzxixvT7FYxHGZfIXgI//6v/JRG80ykzSoN+Ks+HfwVFirc6c/DjLY5LgpioChb6G6wL9z5nHYWRyqRei86qJJTBNwJLQJRhgeVNw4rk+xW6AeqRsjS2J9M4Vtsq9H3DxMigaeIGPKfjtAAJmM2U3xpl8mLUF2/bFgpYMEwTXB471gPnD8aO83d2ILYcmZCCef6e0xyu1JDbjBBR84kchgxjkEyP06b8YClRgRuYJVRl7t4irOwsY0xb64IEjBBrYCk4ThVr22yrCmzofMa22m3555iAIXv/TtDOODd1ExEl+Slxhmr6OtYhIQT116EWaKJ+xlXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITSZxKSDydLK+kKXrEpDkMZATgiUxxnYn1VUXDjSxs4=;
 b=mHuoKQG5zW9qaA2DqQ/CrFZeuqbS+rLV6Kjsn1F1QbVqeReuM6itOjgc3wiWiw4KnOm+XxKAU1Ttd8+FOtMBSS4nA0UBDJN7+sxxCNG+TbaYsAcUcoaoota5RVyCIUo+6WkxhpFcMpW0N+3TnGAIYUmW5a/v/7TJr6jaP3DCKD0=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3282.eurprd08.prod.outlook.com (52.134.93.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Wed, 1 Apr 2020 06:28:21 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 06:28:21 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
Thread-Topic: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for
 dunfell
Thread-Index: AQHWB5aaJ200BzhCe0uM5L3Bj4OOCKhjzgFQ
Date: Wed, 1 Apr 2020 06:28:21 +0000
Message-ID: 
 <AM0PR08MB3987AF1787DAB39B57840B6F92C90@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1585684637-53492-1-git-send-email-denis@denix.org>
In-Reply-To: <1585684637-53492-1-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 967b9656-0ea9-4cf5-9a2b-337abd1a80c9.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9797e43f-71b4-4759-be38-08d7d605e38f
x-ms-traffictypediagnostic: AM0PR08MB3282:|HE1PR0801MB1625:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB162526A06A8D42BD4E125CBA92C90@HE1PR0801MB1625.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 03607C04F0
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(9686003)(6916009)(66946007)(15650500001)(33656002)(316002)(478600001)(71200400001)(8676002)(86362001)(6506007)(66446008)(26005)(76116006)(66556008)(4326008)(64756008)(55016002)(2906002)(8936002)(7696005)(53546011)(54906003)(81166006)(81156014)(5660300002)(52536014)(66476007)(186003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fWLZC4Hjizm5qSEWA22J0r/9UN4GS3nrknvTJ7VxVFTp61s0p3M8w0vU6SkSLocscULkg31AbrGBDXKrNPpKdImPiCn8SALv/DJ3Nw9N5dYdRGz7Dt8gn5QaFaU6NAjzbDqXnFdezCsMYt0OcxSGKZYNhamYJyi2wa5VxY82j0Gn42IT2PNBaaU48W6teQbXgoj5kv+byqt5dzPqRuu4jo2juV4QRJ+038Yq7W8IQBtUPJrXbGFOKmhcb5rstaWUQQL2hLbtS/P8zlv4s16S8l7W6uUwsSz8BX5lJAJi26YfjojWYUHDlai69K0ldNumo+F4GRIZjDrZVsPrjT52oh67gGjKgBqHhzUmL4b3rKfdTny3qxxYGdcscBzUcaRrXsS821k49F38w1e5raIhrM+85pxE6D1j6QOaNN3n9yVUKxLQxqF9Qv7p04aTtyUL
x-ms-exchange-antispam-messagedata: 
 BAfupxpOHMSlb57ydP2vIS/Yb3/WMkpZ51pZnMzSnOoJhUF7rHLShG/PAqKWij3YcDEawCS5Jpv+l7gY0HQ/R4PRPT/i7oOyc6b8LnYnOMm3adYYIHBpMbo5Ox5yb4k63xENKDp64B/ZTvjvTZwV1Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3282
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(478600001)(55016002)(8936002)(81156014)(2906002)(356004)(33656002)(6916009)(15650500001)(54906003)(316002)(6506007)(47076004)(8676002)(26005)(186003)(81166006)(36906005)(82740400003)(4326008)(70586007)(336012)(7696005)(9686003)(53546011)(26826003)(86362001)(5660300002)(70206006)(52536014);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	12d5e1a1-9771-47f2-1e7c-08d7d605dfeb
X-Forefront-PRVS: 03607C04F0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	evKWI9W3pq+paIAfQFlERXY1MJEjjIdh2g+JoCogVNdS4YGWvoSgAfgBYxUuLCbnkjKtfCvBzsp+sGuuDYZ83hB8reeKSfMOp2CCYzpmVOb8/GUar43+lGip/Fkqric496st2kY/+RNj1OuX7vN8OMSdOrRZCtEZqcPXVQBVW9CMt3qJydwv4TWwDrcV0c5eoTEpFqstqn6b/yY5ooN7pqR0AmPkqCik2zWYjMKhlgpMI/raVLnBrA8sh6hpJlIK/z1J/D1SmcPr+YDmkmHGJXAf2pYQ1AJfXXhdfkivYDifWFERw+yI7nIMPdKy8kIJWCr1CiNa1Ok0D4n2qmOSP66DRwzCUVv+qwe1tbKkKcrmeEVTuA5F79SRyHD74gxqNkm4XlfJyoqhL01dU6QHLt0rDMiihy3JRsqYNf82ZW1zmvDu0QqMoHecHjmNJr4Jw6ug1UIaaJtqp3S2WYRDI3JRySjEjjnqrKhmC5pH8JkobC2iIrdLZOzt9/SUm/UPqYw0Xe6Tjx01mB9PJnnSsw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 06:28:27.6662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9797e43f-71b4-4759-be38-08d7d605e38f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1625
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via Lists.Yoctoproject.Org
> Sent: 31 March 2020 20:57
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH] layer.conf: update LAYERSERIES_COMPAT for
> dunfell
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-bsp/conf/layer.conf       | 2 +-
>  meta-arm-toolchain/conf/layer.conf | 3 +--
>  meta-arm/conf/layer.conf           | 2 +-
>  3 files changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 0632ba3..8afcbe5 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-arm-bsp =3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm-bsp =3D "6"
>=20
>  LAYERDEPENDS_meta-arm-bsp =3D "core openembedded-layer meta-arm"
> -LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus dunfell"
>=20
>  # We have patches for xen but meta-virtualization might not be there so =
filter
> # out recipes-extended/xen unless xen is activated in the features diff -=
-git
> a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
> index a247dc1..3a4c4f0 100644
> --- a/meta-arm-toolchain/conf/layer.conf
> +++ b/meta-arm-toolchain/conf/layer.conf
> @@ -8,8 +8,7 @@ BBFILE_COLLECTIONS +=3D "arm-toolchain"
>  BBFILE_PATTERN_arm-toolchain :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_arm-toolchain =3D "30"
>=20
> -LAYERSERIES_COMPAT_arm-toolchain =3D "zeus"
> +LAYERSERIES_COMPAT_arm-toolchain =3D "zeus dunfell"
>=20
>  # do not error out on bbappends for missing recipes
> BB_DANGLINGAPPENDS_WARNONLY =3D "true"
> -
> diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf index
> 65ccd15..0b93e8d 100644
> --- a/meta-arm/conf/layer.conf
> +++ b/meta-arm/conf/layer.conf
> @@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm =3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arm =3D "6"
>=20
>  LAYERDEPENDS_meta-arm =3D "core"
> -LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus"
> +LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus dunfell"
> --
> 2.7.4

