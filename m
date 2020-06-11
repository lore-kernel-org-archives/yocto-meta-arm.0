Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.56])
 by mx.groups.io with SMTP id smtpd.web11.2713.1591862179043985678
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 00:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gxYTZXGK;
 spf=pass (domain: arm.com, ip: 40.107.1.56, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0cil1/1rKDHGM9BGJ0lTwFCILqGVF7YP4ZUd554Z2I=;
 b=gxYTZXGKtpsuXV89lnJ9nhCKUo5oXcHszThZclHDYeRbToEyAOT31n+wa3hg31VvIuXv6A8f42dU7A5/y7Ppy2TyAu6l2CNG6VnVqVMQVZmSyGYTwrBBmkVplK/aHDKUHsQK7DyoRYb31cuPa5mmYsSYo6dw8eqYHcys24UQncI=
Received: from AM5PR0201CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::17) by HE1PR0802MB2540.eurprd08.prod.outlook.com
 (2603:10a6:3:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 11 Jun
 2020 07:56:16 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::52) by AM5PR0201CA0007.outlook.office365.com
 (2603:10a6:203:3d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20 via Frontend
 Transport; Thu, 11 Jun 2020 07:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 07:56:15 +0000
Received: ("Tessian outbound 4f5776643448:v59"); Thu, 11 Jun 2020 07:56:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98d927c7bfb4fdc1
X-CR-MTA-TID: 64aa7808
Received: from b512ea32ec47.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0CD13171-4B76-4FA1-B2B5-4D88FCDFAFFB.1;
	Thu, 11 Jun 2020 07:56:10 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b512ea32ec47.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 07:56:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZW86UuPeN5k/449cYDRWYLDeGL0lOwMosuYYFN5zDGTMl5m86tTnYnn1iPYG+VKFL7uRHE+CquL/wQwWwVlQuoMeZWczO+JiVOmqXITqtthhVi7oIENUtt1j6j345+9guRm/0RbV4TKMFik7zebjdjZ6WU8E2fs2QwN71Nd17VSKOuvufH3S8Kna0aql/uvTlWAjaWjgRAfFkG26rfv4zfRraUh0SV8hYa0iRH2ZUH78/Kjl60fF51mCoEi3GvdhfWQTKpzTfqn2BAMA8bidSVnN6DAaTomC/sUhoCgV87+h08/fEx4G0GZeC0MBRp0HXXiMrd39Eae3qYXr/ipCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0cil1/1rKDHGM9BGJ0lTwFCILqGVF7YP4ZUd554Z2I=;
 b=XqN1wswuLQ498bX9nkBgJ671muZjafABt5rU9L861eMnyBlukDORWba6I9UMiva5RQ0V2fT4PP27latkoqf0DzVfpZCaC+iDa5Aah/NWMZtRVJLcYdim7ukQPnlQE+/8nKNBYBgiR3uf94fAo8fwWMKjWSTiZGc2tkTN0Z43+haoo1Iv7iSFV6RoelEAe4+z7VnCxsU+BrM19Xypes66unWgBnFAtj4Q9PNsZAXZCjeHXdDmM/kH116KtfTkUJL+WFDQZ/bNO+l10POiuUR3rFnkDuGDXqF+s4ENPbqsOsGsYKJ1kpRBYV9fKMkN4enidLyUOFqf7v7vhRvW+fSGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0cil1/1rKDHGM9BGJ0lTwFCILqGVF7YP4ZUd554Z2I=;
 b=gxYTZXGKtpsuXV89lnJ9nhCKUo5oXcHszThZclHDYeRbToEyAOT31n+wa3hg31VvIuXv6A8f42dU7A5/y7Ppy2TyAu6l2CNG6VnVqVMQVZmSyGYTwrBBmkVplK/aHDKUHsQK7DyoRYb31cuPa5mmYsSYo6dw8eqYHcys24UQncI=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3659.eurprd08.prod.outlook.com (2603:10a6:10:4a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 11 Jun
 2020 07:56:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 07:56:08 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-bsp, gem5-arm64: Update to v20 version
Thread-Topic: [meta-arm] [PATCH] arm-bsp, gem5-arm64: Update to v20 version
Thread-Index: AQHWP8VPs/5B5unW/EqyMbw5VO9Z2KjTC/uA
Date: Thu, 11 Jun 2020 07:56:08 +0000
Message-ID: <8B40A7FE-2A88-41EB-9060-663CF712CAA6@arm.com>
References: <1591861936-39107-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1591861936-39107-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b068e423-9953-48cf-04fa-08d80ddceb12
x-ms-traffictypediagnostic: DB7PR08MB3659:|HE1PR0802MB2540:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2540C1CBEA1BF1E8CDED25C09D800@HE1PR0802MB2540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 681FfBxdGirOXvnUYfBbPfRRcrjdiTMbeaVXh+C0HVdskW9+lGD4pgQD7hzLSqr8CS4uksgasGaqrwo520etRp/APFp1mwpENcITaWFjqzVoli3Gcg0zS+5MI1qsoZMiTFG/i4Mxj2+EeYaEXe7GaCF5gus7EkM7NgbP+cFr+F5pp9FsUDoGK2rGP+ov/DCTYPm6KkY1oMAg6lcp5P4aPLj+UaypktSJLy6FABS3Lbg6riaUEVwZwbN+3jFsrclzS3SepZwqeDBsSwZaWVWQrVMEaRQE4hW/FldD5Mcod6OiQ1naJ7lh8uCf583UuF4wXB+38+e08Z7otzZACuBAv5+6r3ng+sCeb48Rs7bYJ+3Z3ifYntCZ4n/9oJQ7+7fR4PnPqU3x95Ly4N6gqny32Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(186003)(26005)(478600001)(4326008)(86362001)(83380400001)(8676002)(8936002)(5660300002)(76116006)(36756003)(33656002)(91956017)(54906003)(316002)(6636002)(37006003)(30864003)(6862004)(6512007)(66446008)(6486002)(2906002)(71200400001)(66476007)(53546011)(66556008)(966005)(64756008)(15650500001)(66946007)(2616005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 2572Cmqea5eWxdGIRXQhLDIyG7VkL43mmBGruXFc3d+WdXeuP2BQU7c+MIrU7MwK08+lXHQJT/YIT05pCzgV5E8hmFuCYULUfw4L7lsgoqYHHrvwZOkmmK0izfyu5gYf48r2bwOIaKZcuQsR5sMFo7tt3IcUPwYajhN3ay3WFUpTRP5Tnh7FUokLWdQY5ypR36x8rlb009MgwsrQaVQ0FFUQ42+dVYSKaAkvSbffAs5QKIYTSxJK+5PkunCmPJyS8sUKwdTTuKD9kkk4iIsoRXqL6bw6Wo97dvHBOPOGNQk06212rZjk9p6notrWkx0rC3tTovsPAED0QUwm4i1yFdVYPqjYIA0DBs2VX92D/qdiYqFva1U6yJ6ysqOd3E6i7EOuGTrY1zP1xyoJfrSLiAMaF842VKsEuuEb132mYtMNzbqE3VQf+gcQUFm3s2myGtWkt7ZeRTEZsOx4QwHKabVJgogLU0cEhfNM+DGMqFVSQwwKKik+cUvdrZSoW84r
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3659
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(6506007)(81166007)(336012)(53546011)(8676002)(54906003)(316002)(2906002)(37006003)(478600001)(15650500001)(6636002)(36906005)(82310400002)(83380400001)(26005)(186003)(6512007)(356005)(4326008)(30864003)(47076004)(36756003)(82740400003)(8936002)(70206006)(5660300002)(70586007)(6862004)(33656002)(966005)(2616005)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	812deee0-34ad-45e5-b483-08d80ddce66d
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lkfLxSQVSk6kOeigUzTPZ4MFA7A74crpmQ1acZzx816wyrgfvthKDbmtELSQRHnf0IIKmvQaCxGRRmBS/4I/VtYqQdpoMlU3ORhCWRXmrhxVBLXgtbj9Gi0V5EoYzdmqD68h3T6+iWOnVLiEJppy4Lgu7O5zmXNzeEkKFmGf8n5jiaGneGF/R5agKjWhpSAy8pPa8YCSgwMemhMZrBiBYlFzMwi4mr00TO/M0uOhp65OtSpK2hzdElA60Ih4U44Kh0V0nVLg3vpZoeFifOwmqZKXO3pMqzX4FqqltjDGV7Rk7Uy4EkdHZjTjANNGzvlCJIcsTlP3fR9rtItfdpy8BvfqZzo+7Y25d6K2I8k/GfQ0UDj3I5B74K4smVGGGFpYrxekZQTKuqsgL17kX3IUbi8eLMhzi9DYTy+Jp7PK36dwX1cNWJvB4O7AHL+xUOrZzs6wNdKP7oUbpDfOshpIoRnkgYubccAxk4Pz3dT/jlQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 07:56:15.9858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b068e423-9953-48cf-04fa-08d80ddceb12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2540
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <21B0F543F860304A8F0FD1BA96A8C3FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 11 Jun 2020, at 08:52, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This patch updates gem5-aarch64-bootloader and gem5-aarch64-native to
> the release tag v20.0.0.1.
>=20
> Also apply populate the right compiler and linker flags to get
> gem5-aarch64-native properly building
>=20
> Change-Id: Icc2203163105373cf030975c1b12f1d4f2fcb03c
> Issue-Id: SCM-1014
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../gem5/gem5-aarch64-bootloader.inc               |  8 +-
> ...loader_git.bb =3D> gem5-aarch64-bootloader_20.bb} | 10 +--
> ...SHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch | 85 ++++++++++++++++=
++++++
> ...h64-native_git.bb =3D> gem5-aarch64-native_20.bb} | 18 +++--
> meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc |  6 --
> 5 files changed, 106 insertions(+), 21 deletions(-)
> rename meta-arm-bsp/recipes-devtools/gem5/{gem5-aarch64-bootloader_git.b=
b =3D> gem5-aarch64-bootloader_20.bb} (60%)
> create mode 100644 meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-nativ=
e/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
> rename meta-arm-bsp/recipes-devtools/gem5/{gem5-aarch64-native_git.bb =
=3D> gem5-aarch64-native_20.bb} (53%)
>=20
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.=
inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> index 4c479f5..7e753b2 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> @@ -5,10 +5,12 @@ LICENSE =3D "BSD"
>=20
> inherit deploy
>=20
> -PROVIDES =3D "virtual/gem5-bootloader"
> +PROVIDES +=3D "virtual/gem5-bootloader"
>=20
> COMPATIBLE_MACHINE =3D "gem5-arm64"
>=20
> +BOOTLOADER_SRC_PATH ?=3D "${S}/system/arm/bootloader/arm64"
> +
> # no configure step
> do_configure[noexec] =3D "1"
>=20
> @@ -16,11 +18,11 @@ do_configure[noexec] =3D "1"
> do_install[noexec] =3D "1"
>=20
> do_compile() {
> -    oe_runmake -C system/arm/aarch64_bootloader all CROSS_COMPILE=3D${T=
ARGET_PREFIX}
> +    oe_runmake -C ${BOOTLOADER_SRC_PATH} all CROSS_COMPILE=3D${TARGET_P=
REFIX}
> }
>=20
> do_deploy() {
> -    oe_runmake -C system/arm/aarch64_bootloader install \
> +    oe_runmake -C ${BOOTLOADER_SRC_PATH} install \
>         CROSS_COMPILE=3D${TARGET_PREFIX} DESTDIR=3D${DEPLOYDIR}/binaries
> }
>=20
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_=
git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
> similarity index 60%
> rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_g=
it.bb
> rename to meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.=
bb
> index a3ab5aa..d960e6c 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
> @@ -3,16 +3,14 @@
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
>                     file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
>=20
> -# The recipe is currently using a version in the release staging branch=
 of gem5
> -# until version 20 is released
> -SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;b=
ranch=3Drelease-staging-v20.0.0.0"
> +SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;n=
obranch=3D1"
> +RELEASE_TAG =3D "v20.0.0.1"
> +SRCREV =3D "332a9de33db603e0aefedae1e05134db4257ea3e"
>=20
> -PV =3D "git${SRCPV}"
> +PV =3D "${RELEASE_TAG}"
>=20
> S =3D "${WORKDIR}/git"
>=20
> -SRCREV =3D "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
> -
> BPN =3D "gem5-aarch64-bootloader"
>=20
> require gem5-aarch64-bootloader.inc
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001=
-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch b/meta-arm-bs=
p/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_=
EXTRA-for-the-marshal-object.patch
> new file mode 100644
> index 0000000..4303a40
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-=
Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
> @@ -0,0 +1,85 @@
> +From 1303d0497bad151f9389ee30c37dc5f9fe325f6e Mon Sep 17 00:00:00 2001
> +From: Giacomo Travaglini <giacomo.travaglini@arm.com>
> +Date: Thu, 04 Jun 2020 12:45:52 +0100
> +Subject: [PATCH] scons: Add MARSHAL_XXFLAGS_EXTRA for the marshal objec=
t
> +
> +We already provide to the user the CCFLAGS_EXTRA, LDFLAGS_EXTRA
> +variables to pass flags to scons when compiling/linking gem5.
> +Those variables are not passed to the marshal object.
> +We add an extra pair:
> +
> +MARSHAL_CCFLAGS_EXTRA, MARSHAL_LDFLAGS_EXTRA
> +
> +to add flag injection capabilities to the marshal object.
> +
> +The patch is also renaming base_py_env to marshal_env.
> +This happens for 2 reasons:
> +
> +1) At the moment the marshal compilation is the only task
> +making use of the base python environment.
> +
> +2) Consistency with the EXTRA variable names added with this patch.
> +I could have named them as BASE_XXFLAGS_EXTRA, but it seems too much
> +generic and users might be confused by that, as they might think
> +the BASE_XXFLAGS_EXTRA is a subset of the XXFLAGS_EXTRA so that
> +setting it will affect gem5 compilation as well.
> +
> +Change-Id: I3e420caa897059455ff8f35462db2b38da050e93
> +Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
> +---
> +
> +diff --git a/SConstruct b/SConstruct
> +index 3a03af4..5a66bba 100755
> +--- a/SConstruct
> ++++ b/SConstruct
> +@@ -276,6 +276,8 @@
> +     ('CXX', 'C++ compiler', environ.get('CXX', main['CXX'])),
> +     ('CCFLAGS_EXTRA', 'Extra C and C++ compiler flags', ''),
> +     ('LDFLAGS_EXTRA', 'Extra linker flags', ''),
> ++    ('MARSHAL_CCFLAGS_EXTRA', 'Extra C and C++ marshal compiler flags'=
, ''),
> ++    ('MARSHAL_LDFLAGS_EXTRA', 'Extra marshal linker flags', ''),
> +     ('PYTHON_CONFIG', 'Python config binary to use',
> +      [ 'python2.7-config', 'python-config', 'python3-config' ]),
> +     ('PROTOC', 'protoc tool', environ.get('PROTOC', 'protoc')),
> +@@ -734,7 +736,9 @@
> +=20
> + main.Prepend(CPPPATH=3DDir('ext/pybind11/include/'))
> + # Bare minimum environment that only includes python
> +-base_py_env =3D main.Clone()
> ++marshal_env =3D main.Clone()
> ++marshal_env.Append(CCFLAGS=3D'$MARSHAL_CCFLAGS_EXTRA')
> ++marshal_env.Append(LINKFLAGS=3D'$MARSHAL_LDFLAGS_EXTRA')
> +=20
> + # On Solaris you need to use libsocket for socket ops
> + if not conf.CheckLibWithHeader(None, 'sys/socket.h', 'C++', 'accept(0,=
0,0);'):
> +@@ -1285,7 +1289,7 @@
> +     # to the configured variables.  It returns a list of environments,
> +     # one for each variant build (debug, opt, etc.)
> +     SConscript('src/SConscript', variant_dir=3Dvariant_path,
> +-               exports=3D['env', 'base_py_env'])
> ++               exports=3D['env', 'marshal_env'])
> +=20
> + # base help text
> + Help('''
> +diff --git a/src/SConscript b/src/SConscript
> +index 7cd628a..aa233c8 100644
> +--- a/src/SConscript
> ++++ b/src/SConscript
> +@@ -1140,7 +1140,7 @@
> + # Build a small helper that marshals the Python code using the same
> + # version of Python as gem5. This is in an unorthodox location to
> + # avoid building it for every variant.
> +-py_marshal =3D base_py_env.Program('marshal', 'python/marshal.cc')[0]
> ++py_marshal =3D marshal_env.Program('marshal', 'python/marshal.cc')[0]
> +=20
> + # Embed python files.  All .py files that have been indicated by a
> + # PySource() call in a SConscript need to be embedded into the M5
> +@@ -1196,7 +1196,7 @@
> +     code.write(str(target[0]))
> +=20
> + for source in PySource.all:
> +-    base_py_env.Command(source.cpp, [ py_marshal, source.tnode ],
> ++    marshal_env.Command(source.cpp, [ py_marshal, source.tnode ],
> +                         MakeAction(embedPyFile, Transform("EMBED PY"))=
)
> +     Source(source.cpp, tags=3Dsource.tags, add_tags=3D'python')
> +=20
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.=
bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> similarity index 53%
> rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.b=
b
> rename to meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> index d36f24f..638baf3 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
> @@ -3,21 +3,27 @@
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d9514d69d8abf88b6e9125e759bf=
0ab \
>                     file://LICENSE;md5=3Da585e2893cee63d16a1d8bc16c6297e=
c"
>=20
> -# The recipe is currently using a version in the release staging branch=
 of gem5
> -# until version 20 is released
> -SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;b=
ranch=3Drelease-staging-v20.0.0.0"
> +SRC_URI =3D "git://gem5.googlesource.com/public/gem5;protocol=3Dhttps;n=
obranch=3D1 \
> +           file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-=
object.patch"
> +RELEASE_TAG =3D "v20.0.0.1"
> +SRCREV =3D "332a9de33db603e0aefedae1e05134db4257ea3e"
>=20
> -PV =3D "git${SRCPV}"
> +PV =3D "${RELEASE_TAG}"
>=20
> S =3D "${WORKDIR}/git"
>=20
> -SRCREV =3D "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
> -
> BPN =3D "gem5-aarch64-native"
>=20
> require gem5-aarch64-native.inc
> require gem5-native.inc
>=20
> +# Get rid of compiler errors when building protobuf
> +GEM5_SCONS_ARGS_append =3D " CCFLAGS_EXTRA=3D'-Wno-error=3Dunused-varia=
ble' --verbose"
> +
> +# Get rid of linker errors and have a faster link process
> +GEM5_SCONS_ARGS_append =3D " LDFLAGS_EXTRA=3D'${BUILD_LDFLAGS}' \
> +MARSHAL_LDFLAGS_EXTRA=3D'${BUILD_LDFLAGS}' --force-lto "
> +
> do_compile_prepend() {
>     # Gem5 expect to have python in the path (can be python2 or 3)
>     # Create a link named python to python3
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc b/meta-a=
rm-bsp/recipes-devtools/gem5/gem5-native.inc
> index 429e18c..1df94d0 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> @@ -30,12 +30,6 @@ DEPENDS +=3D "python3-six-native protobuf-native hdf5=
-native pkgconfig-native \
>=20
> EXTRA_OESCONS =3D "${GEM5_SCONS_ARGS}"
>=20
> -do_compile_prepend() {
> -    # We need to use the proper native libraries when executing
> -    # compiled applications
> -    export LD_LIBRARY_PATH=3D"${STAGING_LIBDIR_NATIVE}"
> -}
> -
> do_install() {
>=20
>     install -d ${D}${datadir}/gem5
> --=20
> 2.7.4
>=20
>=20

