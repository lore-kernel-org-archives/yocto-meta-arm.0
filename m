Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web11.1431.1585812117228102573
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 00:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=V+vYD95m;
 spf=pass (domain: arm.com, ip: 40.107.20.43, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTsrHEP0qt0ADHPa075ilu3DVaF4C2yHEPzmuZQDaHs=;
 b=V+vYD95m5Z2kJ23VzZo5w1AnbvazRPmdYnOQFd1G8uj7jJic1G8VOMs7yFKxdVEf94rPfb1WhX3IWLHMAqe9Ym1C7wUZCFk/Y2pXcQaDAo1ZjNOtpzOFk/crcaqXQ27Z5pEP/3rkg4qm0xMKYADhhj5zxr+maTsr+144AhCxvWI=
Received: from AM0PR0102CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::17) by AM0PR08MB3491.eurprd08.prod.outlook.com
 (2603:10a6:208:d3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 07:21:54 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:0:cafe::5a) by AM0PR0102CA0040.outlook.office365.com
 (2603:10a6:208::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 07:21:54 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 07:21:54 +0000
Received: ("Tessian outbound af37c2b81632:v50"); Thu, 02 Apr 2020 07:21:54 +0000
X-CR-MTA-TID: 64aa7808
Received: from f0eae1c42dda.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8B10C86B-597E-419D-B1CF-42BFB4CD119D.1;
	Thu, 02 Apr 2020 07:21:49 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f0eae1c42dda.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 07:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkD2EdFKi7/GtHK/Xf456+g6BiVP4o198LYt2NKKlcyRb2XhqmmZwV460rHfaVrsV28mbJ1UY1yyV623oNHOR8exK+Tq5tL+RyXDJ/Rtru9VJf5URaUXi8HEkd+xeZ4QFWGaMVDSPFE7XYGkXRmCbq5i5bwkKt6ueRiN/R4lWzOvMIbn6gNCr5SqXFB1oIP92KqHjFJk3E8xoouPR2NzBAavFLJS6DfnyHtvInLNT33D36NmuNqzFNZUuaMkbazCfJ8/qCs3BdS/LY1LEbxc786uofijHa3eOyqFRVBpiAYA5UAdEdPlNE22wGDat9k/Px2qi1EZM8iYxgUzD9RroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTsrHEP0qt0ADHPa075ilu3DVaF4C2yHEPzmuZQDaHs=;
 b=FmeZVEV4Ybku03e6GSrw2HER//DbxXk9uN2iPjpvJ0QtiVvMpjvfOSd38w3T7i3IkLwxFeK0YJPGtewm9DtWVHkw3n3fdS22p/GnHKZnZb04JsO9lsxoVBw8IfMesYYmsHSwSPGFM2e1IPXRON+qNC969e2Yx8qmCCIWnsTWVs6CJ8VeebF1GyFrLqfknjDSsC1aCleXCkjuBQsC6Rv+Dvt1g2rdISsbcG+BJHKEQ7F0ZzzRUNPwQ+hYwPchzyLxxQc8Yxse0unyZ+b8/spP0CTf02Bdl514oww0Ua4n8rstvX6bR6VYuILEyI83sEbRhrM5fsYGX/qE6Uc2bSlQ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTsrHEP0qt0ADHPa075ilu3DVaF4C2yHEPzmuZQDaHs=;
 b=V+vYD95m5Z2kJ23VzZo5w1AnbvazRPmdYnOQFd1G8uj7jJic1G8VOMs7yFKxdVEf94rPfb1WhX3IWLHMAqe9Ym1C7wUZCFk/Y2pXcQaDAo1ZjNOtpzOFk/crcaqXQ27Z5pEP/3rkg4qm0xMKYADhhj5zxr+maTsr+144AhCxvWI=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3794.eurprd08.prod.outlook.com (20.178.23.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Thu, 2 Apr 2020 07:21:47 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 07:21:47 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 5/5] optee-examples: cleanup
Thread-Topic: [meta-arm] [PATCH 5/5] optee-examples: cleanup
Thread-Index: AQHWCHstLHJ42e9bpU+gR1TdyLqBYqhla31A
Date: Thu, 2 Apr 2020 07:21:47 +0000
Message-ID: 
 <AM0PR08MB3987297CAB3B18639C55F34892C60@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-5-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-5-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 5eb8e2e8-8453-4cdd-8c88-41a63bc35ec4.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9bd5707-a46a-4289-834c-08d7d6d6855a
x-ms-traffictypediagnostic: AM0PR08MB3794:|AM0PR08MB3491:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB34917BB8F609C60423323BC092C60@AM0PR08MB3491.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1079;OLM:1079;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(66446008)(64756008)(66476007)(66946007)(76116006)(26005)(55016002)(186003)(9686003)(478600001)(81156014)(8676002)(8936002)(81166006)(2906002)(6916009)(6506007)(52536014)(7696005)(71200400001)(54906003)(316002)(4326008)(53546011)(5660300002)(33656002)(86362001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IjPXd2RECf7btfN34k3xCKFQYXmEl/CigM9Qn62G0PSh6beWqglM9ljJd5jCSyb7mYe7dxH9H7vj0jTyttzwqWAN9GxDdVdwhrGaMjCMR/lCMaIal/3TJHFxyjpY5TvXTbm2XZhj+GbQr3q0ayWaz0d3m9BCc89wQLjZV+PbssqUEDdSWC53HobsSoB2BYsD/VY1UTMzhBzeGN7B+0YjxGmwISrabrFrG6WLF1rwnpY0Wpp3pQa9lSRAt8npOLct1hbDXbcMxn0Cs6fOD59omZDpKPIrpl2iPHWnSNIcTG7QPq0VtkPbo1uSFuwNQBHvELFrJjRW404enSMvyp7UjVCAWqHk44TY/3Yb5IdQhn3ZA22fvVccYG1mNKFSD1hQ8rcz+g/c4D0tqjHD45wAyfAApSjFgUlq7o9JlP9bg56gvGKdyX0xzNeVava5btxaZedJCSDnOmCVM467EvoMQh4+Qzyyey+B/veLWYI4nYiy4fCYCZ1yCfxTNJxX02HNKR1TTn6kUN8SmkjkwHf72w==
x-ms-exchange-antispam-messagedata: 
 bVnvg/Zxq44rF25nk9KTgcOF/NIXMpyPm3XVwdheTCJ3RCbewfBKCkF0sAkrM9PNvRB1XF9hL1oyuS6AP4WHdRFvYYwqt9XrAstQp2UzsGCdDzQoocVwUEy0It96mlCMijQRhpmDc/eq1XsE+6TgMQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3794
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(54906003)(53546011)(81156014)(186003)(81166006)(26826003)(33656002)(36906005)(47076004)(478600001)(2906002)(26005)(316002)(52536014)(356004)(82740400003)(86362001)(9686003)(7696005)(55016002)(8676002)(336012)(6506007)(4326008)(8936002)(70586007)(70206006)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	36e951a3-6199-4d70-4f08-08d7d6d68128
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BI5RuLGMeKkc29ry6ilzVbp2t2/NAgI23meuXirbdKtUDDuwTxc0YluNyaX/dj7ikCZOa462IVDpDpbYVviADriXteB8rkxAloLsqgazicm6Hnj1ekvYvqtdaZjfwMaDMJBPfk3xyU6aO0tOIo3Ph6QrezYnQJKnt9KA22Sz0UWaxh1f6h9CSa8YMiP54oLkuUrT+2ve3iB92dJ2P/w0aRsPnXnjM67WzW/ox02AnxHqCIzg0mDUoDG9sDpjNwe2pG6iZB5X7Qq0CltpOB7d81l7gHF5SAISfxbTVB9d2PsK9SXhRb5qgudaW68goAeahnmF4wa55agIshYpTsFW1O7CydB9VYCkQqKuaNhKKIbhQeOQ+2IjwRHf6xXNe3TeJWOY6FV3WySPNxa9dhL1DYvMJ8EdZEfKfOAz23mFC5xp4aNnkI5dNl90T3I4mLb4cltWcUFKVEWPlguDa97DHxIIv960rRAoNTfisJMogz17LcTOdZ+WlAY4Kx3cOIctmz1s/3jiUESStRemZaKl+cEPO4mXXE750QTIJMpKkyVGJ0ZkhQAAcxVKSh5qh7gJgpT1Erzlf6W50FC02PlY8Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 07:21:54.3780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9bd5707-a46a-4289-834c-08d7d6d6855a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3491
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 02 April 2020 00:13
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 5/5] optee-examples: cleanup
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Rename with _git suffix to match other optee recipes
> * Set PV
> * Add DESCRIPTION
> * Depend on Python3 version of PyCryptodomex instead of Python2 version
> of PyCrypto
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Can we take this opportunity to upgrade this recipe to 3.8.0 as well?

> ---
>  .../optee/{optee-examples.bb =3D> optee-examples_git.bb}               |=
 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)  rename meta-arm/recipes-
> security/optee/{optee-examples.bb =3D> optee-examples_git.bb} (87%)
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-examples.bb b/meta-
> arm/recipes-security/optee/optee-examples_git.bb
> similarity index 87%
> rename from meta-arm/recipes-security/optee/optee-examples.bb
> rename to meta-arm/recipes-security/optee/optee-examples_git.bb
> index aaec4c4..768a55b 100644
> --- a/meta-arm/recipes-security/optee/optee-examples.bb
> +++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
> @@ -1,10 +1,13 @@
>  SUMMARY =3D "OP-TEE examples"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sample
> Applications"
>  HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples"
>=20
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc453d70c30"
>=20
> -DEPENDS =3D "optee-client optee-os python-pycrypto-native"
> +PV =3D "3.8.0+git${SRCPV}"
> +
> +DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
>=20
>  inherit python3native
>=20
> --
> 2.7.4

