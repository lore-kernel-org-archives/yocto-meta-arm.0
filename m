Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.83])
 by mx.groups.io with SMTP id smtpd.web12.4353.1586416019621435392
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2020 00:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YFXrUU5n;
 spf=pass (domain: arm.com, ip: 40.107.4.83, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wdpWylLJ3c+pUKcSY/xHOhYHDgNDX5E8gVWW1tnKXs=;
 b=YFXrUU5nMtY8s34NbH2+Yl+a8ngshlgf0GgZ4/+wNKcIvTl0KUklGQSyqch6R/P1oWwr61hGb7FvkFIzdB1z12ROB7Lrpl54vhAyzZ+jZZxzOCT2Amp7Q1VbrUPCI9kVQRYJ0fZ5ONjWzin1TSVBuUnZ+I2lfQUgbVRAQYBD9FA=
Received: from VI1PR09CA0161.eurprd09.prod.outlook.com (2603:10a6:800:120::15)
 by VI1PR08MB3341.eurprd08.prod.outlook.com (2603:10a6:803:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 9 Apr
 2020 07:06:55 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:800:120:cafe::b1) by VI1PR09CA0161.outlook.office365.com
 (2603:10a6:800:120::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Thu, 9 Apr 2020 07:06:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Thu, 9 Apr 2020 07:06:55 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Thu, 09 Apr 2020 07:06:55 +0000
X-CR-MTA-TID: 64aa7808
Received: from 3b8caed0882e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 04A91ACF-338E-4E59-AA9D-D20ECE1C7AD8.1;
	Thu, 09 Apr 2020 07:06:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3b8caed0882e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Apr 2020 07:06:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaCpLYGJdDznRj3suUPkbhIMeafqS67D17NJBPVdzC9abRtQNVT5HHtBYD8vU8q4y516GCF+P9KXBma1FfjplZuc73tzHGICpiVXllr2+ryJKs+PB7VVOll+5QryHVQZ/uHMoV8f6kv4LV3anpNnNkDLM8DFPJ5tMYPh9RJ/mYqi9cEOGEeo5kQdwl3lOfwHi3oAgWbHpVTib8DSg2nx9BAG9vkcFRAvwoFDqNy9lYpU4PfFHqNyq24tC+Swl3Ao3QL1Aco4X1rK2fU2X22UOjY9/eUPrkQDyBg95VQgiu4LIg9zVI8U9WjmnBv+DoUpj5n+vL92MPrm6qeIUH1vJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wdpWylLJ3c+pUKcSY/xHOhYHDgNDX5E8gVWW1tnKXs=;
 b=S7xvj+w6fY5WuS2jXR9muKqy71XRkmESc2m1hla4SWz62TV3TEhvMWL9MbNPtjT/XzIgLuY3MQyxaNZwpFPSjIUiK2z8ZqIfpUl0V2zhTQKDhuCTU5/JxOIUntk8fodKxgNhMmqD6GoNAt/WwTNKhwOWTF2A96uWCjrRyesnEEjwH896vITaClKiujfzjZ0QXLZuu4CqPidfX2OyTTN9Cb399N1YC3rX/p0ZVJB8oYo0DPmCto4Hb+hTR/680HkGdUjqZMtn8j29cE9mX79FhLGQ6Q/5tue6gz2xqucmWgtHMzgAGu+9giSWfIzP6LqBvG7M6kFl94zch4Srw1ysUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wdpWylLJ3c+pUKcSY/xHOhYHDgNDX5E8gVWW1tnKXs=;
 b=YFXrUU5nMtY8s34NbH2+Yl+a8ngshlgf0GgZ4/+wNKcIvTl0KUklGQSyqch6R/P1oWwr61hGb7FvkFIzdB1z12ROB7Lrpl54vhAyzZ+jZZxzOCT2Amp7Q1VbrUPCI9kVQRYJ0fZ5ONjWzin1TSVBuUnZ+I2lfQUgbVRAQYBD9FA=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5252.eurprd08.prod.outlook.com (2603:10a6:208:15a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Thu, 9 Apr
 2020 07:06:49 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2900.015; Thu, 9 Apr 2020
 07:06:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Jon Mason <Jon.Mason@arm.com>, "nicolas.dechesne@linaro.org"
	<nicolas.dechesne@linaro.org>, "riku.voipio@linaro.org"
	<riku.voipio@linaro.org>, "denis@denix.org" <denis@denix.org>,
	"daniel.thompson@linaro.org" <daniel.thompson@linaro.org>, Sumit Garg
	<sumit.garg@linaro.org>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball insted of svn
Thread-Topic: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar
 ball insted of svn
Thread-Index: AQHWDjhGcV6Deo57UEmNCJnzx13GhahwW4lA
Date: Thu, 9 Apr 2020 07:06:49 +0000
Message-ID: 
 <AM0PR08MB3987BA60B6716249954D79A592C10@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: c4278216-f909-4a40-a3ca-65c1da0a6a34.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07951a75-f3cc-49e6-48c0-08d7dc5496a0
x-ms-traffictypediagnostic: AM0PR08MB5252:|AM0PR08MB5252:|VI1PR08MB3341:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3341B30EAF8C0C864C8349BC92C10@VI1PR08MB3341.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
x-forefront-prvs: 0368E78B5B
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(64756008)(54906003)(55016002)(316002)(81166007)(52536014)(9686003)(33656002)(81156014)(66556008)(8936002)(8676002)(478600001)(6916009)(66446008)(66476007)(86362001)(71200400001)(53546011)(4326008)(26005)(186003)(2906002)(6506007)(66946007)(5660300002)(76116006)(7696005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 07aYEWYVnA+IhBuRDGe5bBphfB6TGAyHsOsew2ILo/BwDTZWDarhbkXz7ieFP3jD+eB3nvZcczgHERrB6ETBKEyBmFDx6kgAdJzh0nrAC+35XBVp0/M1krABcRbqn9lFewfBBic4uWvsedA8IF0CpmbpZmChbeF9+EaiE6YYVf+0tYk3P4vO4sQK21hrqMpHFizMeB9vZT8e8ylti2jKkuyK0cyKWtkkLjHoDMp4QGZeMkwIk1/WPfXtHqkCaBv3zspGNrquX8zb3wEREWutaAOXz0LFamfCooT9o4bodZxDb8eTAdxbvDP7Tv1iOIs/Rd8LE+3XHHw3zLwgv3bHg7P7X+nLzqitRW0rM4fs7YEq5LW6mfaCiUrSxapxQ6BAKuxjDY1tAAhqLFc2KQ+hKdu6okYeOAhToJYWxpje3rDjGY+LiyVQ1aMRqImiYBbl+Ze2dLU27gQKYyJXNW6Pc6FEnsFZ3ii/5IFzjMCLdjCyFFt6DNwapvG9iZALnM5/oAw6mSzFKT+1dS66WXyS9A==
x-ms-exchange-antispam-messagedata: 
 sAmiQ0URh2CgAopuaHD4ryA77eznjOMUFDQ0UtpBTWQkt1Rk9Whkaz7/lQgj568ABuCT3oLpqczVjnpWz3TJT4kDod8haeV+lfNR4GtF5+v/fom8XTL9sRVuEZZIhzU4uxxx1aUQQbsafHRVTJQtGQ==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5252
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966005)(316002)(6916009)(82740400003)(36906005)(8676002)(7696005)(336012)(26826003)(8936002)(9686003)(53546011)(26005)(54906003)(81156014)(4326008)(356004)(186003)(47076004)(6506007)(52536014)(70206006)(2906002)(86362001)(5660300002)(478600001)(81166007)(70586007)(33656002)(55016002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1194a5c0-1fc8-4d6e-8825-08d7dc5492c6
X-Forefront-PRVS: 0368E78B5B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yIJQNseHl0HrPr7GBcQbKlh0Q8OIErIX2oaMuOKF8eTdi/jPFAxI8NogDFHw/bGTvGi+W0hdzLHlLby85UjRyqgm9ES/BxSj5FS4qA6GDuzSiwe+d9nZMpe6l8X0O3k+I0auTF8h0WTlCIpjrLwzl5a7i0vcQGX7EA+Xut/SdNrwS308C42MKOss+/ZsSsxvbUYhrFBGnJ49ozF8+B7jintHXqkvXGBYtn3Ct8SZyPuCQLcFDLtq4Y34p8cOpS+2gi2CP+tL8g711yrAicq169oNNhLzhNUQdkVsFyNCLFQ0OOXQse4IOoscIfiZHmJs07EGJQviRy4GavoA+FFfFKEPL1b6NSv9ggc/pDH5x8VLfFU8VwEVkobtx6cv9026uzuyMEsxV8k4oQEFb5umbXUZnvzV8aXPWsvrZgcgyX5kWpz9WGKCqgwpFNCROyYPJrlCy55rIMQdvT+ha6EolmNmc3WHVLp+XygoKGZv0uIX1tUIEXjxt4LYrBfL1zbqccnueJdscKsjoszVtQY7jGJX0L7tom19Yvvm33kQKPZa8+IGnzYlAjIt0g+CrOUz10Y9DqZ95enOGemZPWuruQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 07:06:55.7624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07951a75-f3cc-49e6-48c0-08d7dc5496a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3341
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Sumit Garg via lists.yoctoproject.org
> Sent: 09 April 2020 07:30
> To: meta-arm@lists.yoctoproject.org
> Cc: Jon Mason <Jon.Mason@arm.com>; nicolas.dechesne@linaro.org;
> riku.voipio@linaro.org; denis@denix.org; daniel.thompson@linaro.org;
> Sumit Garg <sumit.garg@linaro.org>
> Subject: [meta-arm] [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ba=
ll
> insted of svn
>=20
> GCC 9.2 source fetch from svn is quite slow as compared to source tar bal=
l.
> So switch to fetch GCC 9.2 source tar ball instead.
>=20
> Reported-by: Riku Voipio <riku.voipio@linaro.org>
> Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/me=
ta-
> arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> index 366a070..08e8f7f 100644
> --- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
> @@ -27,10 +27,7 @@ LIC_FILES_CHKSUM =3D "\
>      file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \  "
>=20
> -#BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> -#RELEASE ?=3D "5a5ca2d"
> -#BASEURI ?=3D "https://repo.or.cz/official-
> gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=3Dgcc-
> ${RELEASE}.tar.gz"
> -BASEURI ?=3D
> "svn://gcc.gnu.org/svn/gcc/branches/ARM;rev=3D277439;module=3Darm-9-
> branch"
> +BASEURI ?=3D "https://developer.arm.com/-/media/Files/downloads/gnu-
> a/9.2-2019.12/srcrel/gcc-arm-src-snapshot-9.2-2019.12.tar.xz"

Any specific reason for having a softer assignment here? Are we expecting
the user to customize this variable?

>  SRC_URI =3D "\
>             ${BASEURI} \
>             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \ @@ -71,7
> +68,9 @@ SRC_URI =3D "\
>             file://0036-Re-introduce-spe-commandline-options.patch \
>             file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch=
 \  "
> -S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch"
> +SRC_URI[md5sum] =3D "9c570fc4286825b4e6f67b3d34aade23"
> +
> +S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-9.2-
> 2019.12"
>=20
>  # For dev release snapshotting
>  #S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
> --
> 2.7.4

