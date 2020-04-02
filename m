Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.44])
 by mx.groups.io with SMTP id smtpd.web11.1420.1585812073350991589
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 00:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zw1zgJi2;
 spf=pass (domain: arm.com, ip: 40.107.6.44, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHNnBInQ0EoXTFzBmnvn/LEU8eGhdsQnu9v6iozKWgE=;
 b=zw1zgJi2nLGlI3ND5Fu1edt3JHU8IvSxel63c/UvCLO2/f0fjS7FM5F1Y/+yjlAHERLBaiToTLD1XyECFdNfSq6edvsbPmrXF3ueOfOU9vCa6YdVHjtemu0zrcJft2wKbbbArd/6QPPkbW7MLzpxVvn9eNjyJMrjzC8Ip0NFj8w=
Received: from DB8PR06CA0028.eurprd06.prod.outlook.com (2603:10a6:10:100::41)
 by DB8PR08MB4124.eurprd08.prod.outlook.com (2603:10a6:10:b0::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Thu, 2 Apr
 2020 07:21:10 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::21) by DB8PR06CA0028.outlook.office365.com
 (2603:10a6:10:100::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Thu, 2 Apr 2020 07:21:10 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 07:21:10 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Thu, 02 Apr 2020 07:21:10 +0000
X-CR-MTA-TID: 64aa7808
Received: from 6052269b9d43.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EDF0A243-F7E1-4452-87E1-D8B75B624EF8.1;
	Thu, 02 Apr 2020 07:21:05 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6052269b9d43.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 07:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3EgwT5mcGIb72uHEeoDjR2c9e4f76muaT5VJ5HKoXt5NbmGLPZk/CdUe/ptbw/pL6IyvvXRLL0i8hhibdfq+IZjAZ2OgUdDValE2hokdz9P65PwHGfDbkrP5hXrgoYlIVxuh6GAmVDnn37Imk3BdpsC1SwqDCboBluWzutsrNRWV5Y1pugBpE7f8TGtXsNqtrye9cg57F1UvD0U87k5EGpHcfdLxXIVS/sn8+CDXLx7oWhG0NU9XiI3Pu/sEv70KPzkjWL/b7vExujA6tshLnneB+6/60MFlOKXinXKl31gtYZx1YDq8b72ydL7/ofghdoXASH+QziHkKwIYSxzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHNnBInQ0EoXTFzBmnvn/LEU8eGhdsQnu9v6iozKWgE=;
 b=QGbESquXZISns2PmCk5eWorIemNZywRl/KFZ6gw3ovWiBGxLB7Pu25cUZtPihqLbW/X2HGAqatzUnTmoyXtNXzRMY0ceFV9Cpsirbn7Whf0k0aUhI08eaF82J/StrDfoOEreS/UUx+r9GkrARiuVZeze75kp/nbtmee4KUkSwNxERIKFYjGhTCm08dPm6NJ/r1PWZzOih9bj/hJ8b2pvV/jQAlSP7OrNfhWmuJ8tUeuxRP8/FtzLCGN4ZQumKfov0WEXK0MempKYfeYT155wYqKizg2xeyNrfuvnIKAYDbEYzrH5yvOsNVP/7cr4CdhsUcurh8mvsjzmU1MqvzqnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHNnBInQ0EoXTFzBmnvn/LEU8eGhdsQnu9v6iozKWgE=;
 b=zw1zgJi2nLGlI3ND5Fu1edt3JHU8IvSxel63c/UvCLO2/f0fjS7FM5F1Y/+yjlAHERLBaiToTLD1XyECFdNfSq6edvsbPmrXF3ueOfOU9vCa6YdVHjtemu0zrcJft2wKbbbArd/6QPPkbW7MLzpxVvn9eNjyJMrjzC8Ip0NFj8w=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3794.eurprd08.prod.outlook.com (20.178.23.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Thu, 2 Apr 2020 07:21:03 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 07:21:03 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/5] optee-client: upgrade 3.7.0 -> 3,8,0, cleanup
Thread-Topic: [meta-arm] [PATCH 3/5] optee-client: upgrade 3.7.0 -> 3,8,0,
 cleanup
Thread-Index: AQHWCHsr0QAPyHPsD0ysYLPZoc3g9ahlapmQ
Date: Thu, 2 Apr 2020 07:21:03 +0000
Message-ID: 
 <AM0PR08MB3987CA7F0214B4CEC87FC37292C60@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-3-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-3-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: ec9a873b-33b8-4a1a-adbf-d04475881654.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22ab3bf3-0064-43f5-dba6-08d7d6d66b54
x-ms-traffictypediagnostic: AM0PR08MB3794:|DB8PR08MB4124:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB4124B672955E4B6FDA61189F92C60@DB8PR08MB4124.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:323;OLM:323;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(66446008)(64756008)(66476007)(66946007)(76116006)(26005)(55016002)(186003)(9686003)(478600001)(81156014)(8676002)(8936002)(81166006)(2906002)(6916009)(6506007)(52536014)(7696005)(71200400001)(54906003)(316002)(4326008)(53546011)(5660300002)(33656002)(86362001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3ML+sEG/H0o2/trBp7JOhsitvFpE+IUryB2ky1eWDRGIfUtU4/nwhpFqHQk7ftmoQJ2i1IMgt7IBa2iy0YfxCSykDqnugSDsUaEUkDLBa9+QX1dddnRkoHWmkZH26QVN2sStG6d4XHryMxxXcRf7X0dcedguYUz3K9IrGcXavfhXfAmYOG4ckGyqi8AwJ/wXU+R820MlItwP53kIxeZn8xpianPIqcoDIfZ9/nXqnDaSiSOZ47P30FziTli2p9GqecMeOJ9DdU6Ebm1a7jcav5y31JxGMR98ghZ0oC0nS9CYA9bHoIiBXCSXuma9V7AI7kHxj1/zeTCSbnoaqv8OUg47oOOi/JBCPJyQNig8vk6w/UcaF3iIDZ36qIJWttVaXPVmMbC8KFmLvXIDI6932lkLe/QaJlj0c5XrA9X5oEGEIM+wc6yFuSLNl0NQ+cHAUoUWb17CiGn8a0v0ANeLj59mpKHBZ7vbBoFyr8jOH5lNkb/s8XXc+IfSeQNha5iXODY3mv4T6Tx8XSb9ZF78jg==
x-ms-exchange-antispam-messagedata: 
 TMAm7Co1pJP4cn2Ikzs1zvOQUgWtQJB12vmcRXti1YnNBMgK4mOEU5qvItQvzcrJDvQKnYNCTp0iEPj5eWG6Q07k3CDCKMfvkPagUGqYiUkLxlKlR4ykETAoQtorr4Dzuej9lbsEf6FCCdaa5KlYwA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3794
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(86362001)(5660300002)(8676002)(186003)(9686003)(52536014)(26005)(55016002)(356004)(4326008)(8936002)(81166006)(82740400003)(316002)(47076004)(33656002)(54906003)(26826003)(2906002)(81156014)(478600001)(70206006)(53546011)(336012)(7696005)(70586007)(6506007)(6916009);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fe8b1110-7f1b-4dc5-9864-08d7d6d666c5
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rk7R2WI3dlmB4IiySkUrtwLycSamplnILxchaFKnTOnPshAE4a5UwZy9CfYWNfiEa/x4vj8zNr2X1rLMtLbB3RcHI8K5NQdAbzl7cXQS26dVruogqvL6qcm/8eXXcgfXSsd82oADVYzC4CeBenAA5KljwZbgdIznVb9RzwIV2q+qh6CfesMX5kSx0tNAx1fgcTKjKoolJDlbowFrJwPxViAbvrD9vf/MrhgAZdUoY25XEqats4bi5IVgSSYK5wbzvPhgr+b/bAFqIWngCq0BlDerb88VOEXv8PYRm9qlPWEdx/RpHy9ovNIcczaQZ4AZInuFK6Q486ROQ+eVx9QJAsxHRRqujyYWalJ6KrmM4dnWGtI8rQwqsmXwAZmysl0XaQDrN/Ptu0NIPcBqxkYDdOcP7ckMbYCcyqROfrPZog9WvKJ1xk6dZtaLbnbSdivXQnTQx4eBeFSRu4h/hml0jKLhMdSoEVAi3GWarrgMwgppxYZ8s9FSp7mD5vUZLU5HPpYm+g6PwFN76SXOB0uqbTda0Q5vieJERbDYhw0S1v4psD4wduaDIFXQcVcrVB7NDKTchmp8Hh5gM6ySTitNwA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 07:21:10.8213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ab3bf3-0064-43f5-dba6-08d7d6d66b54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4124
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 02 April 2020 00:13
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 3/5] optee-client: upgrade 3.7.0 -> 3,8,0, cle=
anup
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Rename with _git suffix to match other optee recipes
> * Add DESCRIPTION
> * Use common HOMEPAGE
> * Use install command for header files instead of cp -a
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../optee/{optee-client.bb =3D> optee-client_git.bb}   | 20 ++++++++++++=
--------
>  1 file changed, 12 insertions(+), 8 deletions(-)  rename meta-arm/recipe=
s-
> security/optee/{optee-client.bb =3D> optee-client_git.bb} (63%)
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-client.bb b/meta-
> arm/recipes-security/optee/optee-client_git.bb
> similarity index 63%
> rename from meta-arm/recipes-security/optee/optee-client.bb
> rename to meta-arm/recipes-security/optee/optee-client_git.bb
> index 519683a..a25d343 100644
> --- a/meta-arm/recipes-security/optee/optee-client.bb
> +++ b/meta-arm/recipes-security/optee/optee-client_git.bb
> @@ -1,18 +1,21 @@
> -SUMMARY =3D "OPTEE Client"
> -HOMEPAGE =3D "https://github.com/OP-TEE/optee_client"
> +SUMMARY =3D "OP-TEE Client API"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Normal
> World Client side of the TEE"
> +HOMEPAGE =3D "https://www.op-tee.org/"
>=20
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60a743e5b"
>=20
> -PV =3D "3.7.0+git${SRCPV}"
> +PV =3D "3.8.0+git${SRCPV}"
>=20
>  inherit python3native systemd
>=20
> -SRC_URI =3D "git://github.com/OP-TEE/optee_client.git \
> -           file://tee-supplicant.service"
> -S =3D "${WORKDIR}/git"
> +SRCREV =3D "be4fa2e36f717f03ca46e574aa66f697a897d090"
> +SRC_URI =3D " \
> +    git://github.com/OP-TEE/optee_client.git \
> +    file://tee-supplicant.service \
> +"
>=20
> -SRCREV =3D "bc0ec8ce1e4dc5ae23f4737ef659338b7cd408fe"
> +S =3D "${WORKDIR}/git"
>=20
>  SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
>=20
> @@ -25,7 +28,8 @@ do_install() {
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
>      ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
>=20
> -    cp -a ${S}/out/export/usr/include ${D}/usr/
> +    install -d ${D}${includedir}
> +    install -p -m0644 ${S}/out/export/usr/include/*.h ${D}${includedir}
>=20
>      sed -i -e s:/etc:${sysconfdir}:g \
>             -e s:/usr/bin:${bindir}:g \
> --
> 2.7.4

