Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web12.8502.1589879488498596231
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 02:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wU4kOx8g;
 spf=pass (domain: arm.com, ip: 40.107.14.75, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpbML9M/uS4RiSGTA+GDZZF0azq3tkzridtFK5wK6n0=;
 b=wU4kOx8gvWgFsVQCe+PRm1IRbcSA8zo5lxhaOzZS/oJCzxa24qPXPEpxdatuWUeHYXVEh/y17kUU4v63mV0Pzk+6CAwX1cP5Yf2SIJyNMoRmtv+9XinGQFP9s90zbm5srlLOAKzMQ4TZ5u098quzEv7UZRI/P06ANGIeqFErGgY=
Received: from DB8PR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:a0::46)
 by HE1PR0801MB1897.eurprd08.prod.outlook.com (2603:10a6:3:4a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 09:11:25 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::ab) by DB8PR09CA0033.outlook.office365.com
 (2603:10a6:10:a0::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 19 May 2020 09:11:25 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 09:11:25 +0000
Received: ("Tessian outbound d078647f4174:v57"); Tue, 19 May 2020 09:11:24 +0000
X-CR-MTA-TID: 64aa7808
Received: from 9ce4806273e5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 17A203E2-F981-4444-9075-6128CE4EB152.1;
	Tue, 19 May 2020 09:11:19 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ce4806273e5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 May 2020 09:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiGdT86rzwahOvoJHpwNNA1cuEv8sz9uMGBqYKw06pH0o5zl4ImW2+/4kCLH7o4vRlMiUMJAP2Y9VA08xyruYCmJd37wzbHxvCL/tQER9PH7F0oIyPdd3JvompFy+YV0yLtmyWD3ccb976xl/tqBSbpqD4ZtoL34WgsXt3PwyIJHCRIY1tbjxNJri77ZXnzDViogliXPBK541yoNKxgu3rIPr5aDA1JHDPTbJXL7kY1HeR+O+40HXFrNf5H6EAU8QAZ4uHwVID4HH5aGxICg9DvVKA37pZB2pJU4Yr+fa+a74Bq4hxqMxKlvSKsy0uuY7513npqg2dN3Nt/95Ys33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpbML9M/uS4RiSGTA+GDZZF0azq3tkzridtFK5wK6n0=;
 b=aiOWOGe36ugoYb5h8zfSkXGuetVTA8egVVyUFzpz8tUFVc3f2tfSx7tu9WVegBZ2UQxwYA63t8ZhOC/F4ZUXST6tcPB1ga9GjvyLYUThEPeKVMZDWD9YFEnM0I5EWIMptoHuqdgz+wtvbFB5XLXG3XdL9p2Bs+jSwQ4+/BgMdnTKjKLv3JKY0EvWvaDSnyrxPO3YcvSKMJPRpWIaOROl4xF8Z6B17N5zGFDq+yX6GWZmdXh6b+KdEbJfv1CMpMFODl30bauP+H6o3F4ZUDQtHKRsIVIKWe9kON4IPDRdTW1r9o1J6PpgtVIiNsrC7Ky06DLM9GiBPvSaMAsmQNhm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpbML9M/uS4RiSGTA+GDZZF0azq3tkzridtFK5wK6n0=;
 b=wU4kOx8gvWgFsVQCe+PRm1IRbcSA8zo5lxhaOzZS/oJCzxa24qPXPEpxdatuWUeHYXVEh/y17kUU4v63mV0Pzk+6CAwX1cP5Yf2SIJyNMoRmtv+9XinGQFP9s90zbm5srlLOAKzMQ4TZ5u098quzEv7UZRI/P06ANGIeqFErGgY=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3427.eurprd08.prod.outlook.com (2603:10a6:208:d6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Tue, 19 May
 2020 09:11:17 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.033; Tue, 19 May 2020
 09:11:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries artefacts to sysroot/firmware
Thread-Topic: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries
 artefacts to sysroot/firmware
Thread-Index: AQHWF686mYZ7S0t78EeyoJMoUc3KVKiu9imAgAAiMKCAAAkuAIAAKX/g
Date: Tue, 19 May 2020 09:11:17 +0000
Message-ID: 
 <AM0PR08MB398779D080954B526CA3FE3692B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
 <1587454435-46370-3-git-send-email-diego.sueiro@arm.com>
 <20200519040543.GP11927@denix.org>
 <AM0PR08MB39876088695CD79E3EECB31E92B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
 <20200519064056.GQ11927@denix.org>
In-Reply-To: <20200519064056.GQ11927@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: d1cdf538-5938-4dee-87eb-cf0dc286f6d1.0
x-checkrecipientchecked: true
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 88531541-90a1-4d56-aec0-08d7fbd49b65
x-ms-traffictypediagnostic: AM0PR08MB3427:|HE1PR0801MB1897:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB1897F887D0BE7E2934E772F692B90@HE1PR0801MB1897.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
x-forefront-prvs: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OmCSRxYSCJchWF6UUbqg2nGvrcEXD6Vr5qa1uJSwjC/hqmJkbeSaKwuyoFLKDe583leVl6+TRWpfSuKThB6MmyVNoBGk8sSa9ku6wdsOdFwG83UXYgUEDCn08yK79SRrq+3Etzw5DKJ5YWypx6LftepCH7C+npXAhkpkqVnW4TkwRcxoEDjIX4SlZQCK5Un0BsaTw1s5qoIqvebbcxCaXWrSzTO6f3T7KjSO7IJPVEw/XQVG9DK3BgdNljaAdIKUGqDxJa7txs6lmdcdahXSnAfYNZMdbi4UShXflRsgj22D+tJ0SZpR0WUf8bXyzMA97/jtuK6UF6DMO5SbNHW9tpz+mojo+/LUNzUurSn4czySQp5mAcFkfJU77OrY3oHpmGeJ9YsyhUfEUVEHjSBYHjZv+bNoiM4OyW/hkxdEG1Fw9OAAwIw0RrKq3Hnppkxs
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(478600001)(6506007)(186003)(9686003)(53546011)(66446008)(64756008)(52536014)(33656002)(8936002)(6916009)(66556008)(26005)(66476007)(86362001)(66946007)(55016002)(5660300002)(8676002)(54906003)(316002)(7696005)(2906002)(4326008)(71200400001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 yh90OPjjaKifFofC1DrekNYXW3mwtuUpiA/MsWiJioFYy2NEI78osU3j/z5b23YxA4kv4sRc90v/U/g2EH5VALWYmMU10xrYg62PUZLj4DRM5LmbyOnLRRMiEX9shlaVdnN2NySFaDqypGZkSFXUBasOXWDK2Im/BYwaN7NJRUbbczomtD59dRRC2HSaISkkOS5a+UeKRlO11AgmyPa31YCjLEYZf6I4RwdseSP39kJ4O30TWX78tK+M/JxMAAvzeUstO7yjbP0PwCcchpGYwD7ypxQ37fKIKnXF+3gcH9bHJkqyMiD5PIX0s4Qzi6oAsBnaIn4asljgzYiqa8ovQdu+aozzVY2WRE2qIyVB7EXJhkiGA8ZRNuLo0xVLzaa1WO4UrlhoQlS30weoeW1fhoIo9b9pQUBwBxTUhCytBIHxkaRYl1Jww/f4EJWA4H/nzJJhBw8qm7JxF0oxuZIWdnADg/Rr3f2tNTGdww7Axdw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3427
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(5660300002)(47076004)(82310400002)(478600001)(82740400003)(70586007)(70206006)(81166007)(356005)(336012)(6862004)(4326008)(8676002)(8936002)(86362001)(9686003)(33656002)(186003)(6506007)(26005)(55016002)(316002)(7696005)(2906002)(54906003)(52536014)(53546011);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d84ac44-d0bd-4bf3-fdd5-08d7fbd49696
X-Forefront-PRVS: 040866B734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2F6DCdF6i9kat2S0VVVov8dPCFj16R5pa+U/SW9+lFFkmMU2XuOf4Vl2kmN88Q4qxhfp1isd06QaMN5d9Qx0OKRdxBr0PMljR/a/Ha+dzG4Tv+EnwBDC1ZNHq6pDhFwG5qJXo9wHG7ZO/hJ+qNoSbBA8JrfbaGmZLcOsnplzRHAopwNZljbZtrXRzvp332EQOZo3eMnJ6IefSHKGNforbFIuN4EwcCcOKrzThSY84jahh6Xt8uXPA8S9+1AGtC9GRxprSFwMXajU7XfGLX0p4VZSgbRcoueOmdIgGhuQyse6r0PxlqMaPeuVbZOpCVdfN9itKB5CHWes9hQmmmsakKPySTOFmmCxOyZvajmvLdnDqHuRp/3+PIg4pgGOOyFyD5Esrx5AhurzeSCAml9jz7E/T5+iNrispptfsp47KHkpJBZ14244TM22tmVe2UaVESPkXQhr4f4RVh+nxt5DoeB7aY5f7POSMo9zumpRqS/H8F1QsBG9uj04GL8ppSbHQ+UIk+ObxHE3INoyHiVdwQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 09:11:25.4845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88531541-90a1-4d56-aec0-08d7fbd49b65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1897
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Denys Dmytriyenko <denis@denix.org>
> Sent: 19 May 2020 07:41
> To: Diego Sueiro <Diego.Sueiro@arm.com>
> Cc: meta-arm@lists.yoctoproject.org; nd <nd@arm.com>
> Subject: Re: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries
> artefacts to sysroot/firmware
>=20
> On Tue, May 19, 2020 at 06:10:46AM +0000, Diego Sueiro wrote:
> > > -----Original Message-----
> > > From: meta-arm@lists.yoctoproject.org
> > > <meta-arm@lists.yoctoproject.org> On Behalf Of Denys Dmytriyenko via
> > > lists.yoctoproject.org
> > > Sent: 19 May 2020 05:06
> > > To: meta-arm@lists.yoctoproject.org
> > > Cc: nd <nd@arm.com>; Diego Sueiro <Diego.Sueiro@arm.com>
> > > Subject: Re: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver
> > > binaries artefacts to sysroot/firmware
> > >
> > > On Tue, Apr 21, 2020 at 08:33:52AM +0100, Diego Sueiro wrote:
> > > > Make usage of the do_install task to deliver binaries artefacts to
> > > > the `sysroot/firmware` path, making it easier for other recipes
> > > > that depends on it to make usage of those binaries instead of
> > > > copying them from the DEPLOY_DIR_IMAGE.
> > > >
> > > > This recipe still deploys its artefacts to DEPLOY_DIR_IMAGE.
> > > >
> > > > Change-Id: I97b97f90b23746557e981f8de10159c5f475becd
> > > > Issue-Id: SCM-888
> > > > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > > ---
> > > >  .../trusted-firmware-a/trusted-firmware-a-fvp.inc  |  7 +++--
> > > >  .../trusted-firmware-a/trusted-firmware-a.inc      | 31 ++++++++++=
+++--
> -----
> > > --
> > > >  2 files changed, 21 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git
> > > > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-f
> > > > vp.i
> > > > nc
> > > > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-f
> > > > vp.i
> > > > nc
> > > > index 6e7eba3..3e58ecf 100644
> > > > ---
> > > > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-f
> > > > vp.i
> > > > nc
> > > > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware
> > > > +++ -a-f
> > > > +++ vp.inc
> > > > @@ -12,9 +12,9 @@ TFA_MBEDTLS =3D "1"
> > > >  TFA_UBOOT =3D "1"
> > > >  TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fiptool"
> > > >
> > > > -do_deploy[depends] +=3D "virtual/kernel:do_deploy"
> > > > +do_install[depends] +=3D "virtual/kernel:do_deploy"
> > > >
> > > > -do_deploy_append() {
> > > > +do_install_append() {
> > > >      ./tools/fiptool/fiptool create \
> > > >          --tb-fw ${S}/${TFA_BUILD_DIR}/bl2.bin \
> > > >          --soc-fw ${S}/${TFA_BUILD_DIR}/bl31.bin \ @@ -26,6 +26,5
> > > > @@
> > > > do_deploy_append() {
> > > >
> > > >      ./tools/fiptool/fiptool info fip.bin
> > > >
> > > > -    install -m 0644 ${S}/fip.bin ${DEPLOYDIR}/fip-fvp.bin
> > > > +    install -m 0644 ${S}/fip.bin ${D}/firmware/fip-fvp.bin
> > > >  }
> > > > -
> > > > diff --git
> > > > a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > > index d7c4fbf..93ca199 100644
> > > > ---
> > > > a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i
> > > > +++ nc
> > > > @@ -5,7 +5,7 @@ PROVIDES =3D "virtual/trusted-firmware-a"
> > > >
> > > >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > > >
> > > > -inherit deploy
> > > > +inherit deploy nopackages
> > >
> > > I totally missed this ^^^ - may I ask why nopackages was added here?
> >
> > Because this recipe is not generating packages to be installed in the r=
ootfs.
>=20
> So does u-boot, grub, efi, systemd-boot, ovmf, opensbi, optee-os and many
> other recipes that deploy binaries outside of the rootfs. And yet, they d=
o not
> inherit nopackages, because packages are useful for many things besides j=
ust
> rootfs...
>=20

If you think that generating packages for tf-a could be useful I'm happy to=
 accept this change.  ; - )

>=20
> > > >  COMPATIBLE_MACHINE ?=3D "invalid"
> > > >
> > > > @@ -42,12 +42,12 @@ SRCREV_FORMAT_append =3D
> > > > "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
> > > > TFA_UBOOT ?=3D
> > > "0"
> > > >
> > > >  # What to build
> > > > -# By default we only build bl1, do_deploy will install
> > > > +# By default we only build bl1, do_deploy will copy
> > > >  # everything listed in this variable (by default bl1.bin)
> > > > TFA_BUILD_TARGET ?=3D "bl1"
> > > >
> > > >  # What to install
> > > > -# do_deploy will install everything listed in this
> > > > +# do_install and do_deploy will install everything listed in this
> > > >  # variable. It is set by default to TFA_BUILD_TARGET
> > > > TFA_INSTALL_TARGET ?=3D "${TFA_BUILD_TARGET}"
> > > >
> > > > @@ -60,9 +60,8 @@ LDFLAGS[unexport] =3D "1"
> > > >  AS[unexport] =3D "1"
> > > >  LD[unexport] =3D "1"
> > > >
> > > > -# No configure or install
> > > > +# No configure
> > > >  do_configure[noexec] =3D "1"
> > > > -do_install[noexec] =3D "1"
> > > >
> > > >  # We need dtc for dtbs compilation  # We need openssl for fiptool
> > > > @@ -87,27 +86,27 @@ do_compile() {
> > > >      oe_runmake ${TFA_BUILD_TARGET}  }
> > > >
> > > > -do_deploy() {
> > > > -    install -d -m 755 ${DEPLOYDIR}
> > > > +do_install() {
> > > > +    install -d -m 755 ${D}/firmware
> > > >      for atfbin in ${TFA_INSTALL_TARGET}; do
> > > >          if [ "$atfbin" =3D "all" ]; then
> > > >              # Target all is not handled by default
> > > > -            bberror "all as TFA_INSTALL_TARGET is not handled by
> do_deploy"
> > > > +            bberror "all as TFA_INSTALL_TARGET is not handled by
> do_install"
> > > >              bberror "Please specify valid targets in TFA_INSTALL_T=
ARGET or"
> > > > -            bberror "rewrite or turn off do_deploy"
> > > > +            bberror "rewrite or turn off do_install"
> > > >              exit 1
> > > >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
> > > >              echo "Install $atfbin.bin"
> > > >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
> > > > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.bin
> > > > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> > > >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
> > > >              echo "Install $atfbin.elf"
> > > >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
> > > > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.elf
> > > > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> > > >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
> > > >              echo "Install $atfbin"
> > > >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
> > > > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}
> > > > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}
> > > >          elif [ "$atfbin" =3D "dtbs" ]; then
> > > >              echo "dtbs install, skipped"
> > > >          elif [ -f ${S}/tools/$atfbin/$atfbin ]; then @@ -118,4
> > > > +117,10 @@ do_deploy() {
> > > >          fi
> > > >      done
> > > >  }
> > > > -addtask deploy before do_build after do_compile
> > > > +
> > > > +SYSROOT_DIRS +=3D "/firmware"
> > > > +
> > > > +do_deploy() {
> > > > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/ } addtask deploy after
> > > > +do_install
> > > > --
> > > > 2.7.4
> > > >
> > >
> > > >
> >
