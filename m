Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.55])
 by mx.groups.io with SMTP id smtpd.web12.7106.1589868657159392818
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 23:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pQdSOyRT;
 spf=pass (domain: arm.com, ip: 40.107.0.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZhzUvZC6HFC0pZjqBQ/lu25vdXpF5riK+7pGf2LL7k=;
 b=pQdSOyRTAw/PqCsBcz/FfYt+GxiOmMkC9ManBrVPMqNBxR21WFT6fbcrzATaN0nruZhZM2kDdKL5bk9FJH3gt2PG/mmpSU0+4wyqNKU+3MaK5KTYSEw6LyyW3kEO29VWP4azf7oE9eT5ErEb2iwhBcjRTByurLmCSaMCbQaRGuQ=
Received: from AM5PR0601CA0060.eurprd06.prod.outlook.com (2603:10a6:206::25)
 by AM5PR0802MB2388.eurprd08.prod.outlook.com (2603:10a6:203:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Tue, 19 May
 2020 06:10:54 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::ee) by AM5PR0601CA0060.outlook.office365.com
 (2603:10a6:206::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 19 May 2020 06:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 06:10:53 +0000
Received: ("Tessian outbound 14e212f6ce41:v57"); Tue, 19 May 2020 06:10:53 +0000
X-CR-MTA-TID: 64aa7808
Received: from f08ec2b29a1e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1103E9CA-D1DE-4570-ABAE-3F6CAD3D50EF.1;
	Tue, 19 May 2020 06:10:48 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f08ec2b29a1e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 May 2020 06:10:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLH30/tJbMXk81UHFV3eIRqzePFOgwaod+E5cFqyVTE+UgjXOJHRUZvmIhvnH1VTZo0dggrXoBQoNJNXSk4vxw6wEXM2NZG3mnKyWSvv8twK3S/eZNt9JiGGCVNS6xyu1SBU1zmXucupHLNHm+uL4Gw785uzARN5U0y0xVaRmqEBLWyfgfHmn0EiNkl9/yVkbxbKpwe8uMRHoxNWrqmdqknCLbG+84e09BrLPUOm52ASMAxWpr4yaZW+1ZGHqKfiJHBrBnfQT0otD0g0Qw9WqCO4X2gH4X+JJIT+U8qT1nZzcmn/DEn0rkQD8vPjSgyJXojBGEpVZlIxUxGG8N10tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZhzUvZC6HFC0pZjqBQ/lu25vdXpF5riK+7pGf2LL7k=;
 b=AWBB8p+DUQOxEAR3z0vFqa/5wcotdL9TpOAmD4CfrGNTCFt9RUzmYHHI3knNaMjhpooSojsRsUsKOK2jjf7U2Ama1nejnfGL9j67ZPjyjEtpsQl44pEXCKcPmz2e2sauIn3OYlCYLNZi4i+CvMcnEvq6ISzY3atHllcvwQP3CILOKlRJLq2c7dtwB2hcZfTuWYhTZ0tTh3PcXfHsGyXh+UNI3oLdh1ZWfUxQG4jpbELCzRF+DcjVqgEHS5KpcvfDdharZ1RBb8JebEX8BvoN6ur4eYHUHzpdAP36dWu/Qj6y+vtCaQNKvFBCiIt4VH6R7DAnacMJRtBakF04PWZugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZhzUvZC6HFC0pZjqBQ/lu25vdXpF5riK+7pGf2LL7k=;
 b=pQdSOyRTAw/PqCsBcz/FfYt+GxiOmMkC9ManBrVPMqNBxR21WFT6fbcrzATaN0nruZhZM2kDdKL5bk9FJH3gt2PG/mmpSU0+4wyqNKU+3MaK5KTYSEw6LyyW3kEO29VWP4azf7oE9eT5ErEb2iwhBcjRTByurLmCSaMCbQaRGuQ=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5348.eurprd08.prod.outlook.com (2603:10a6:208:189::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Tue, 19 May
 2020 06:10:47 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.033; Tue, 19 May 2020
 06:10:47 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "denis@denix.org" <denis@denix.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries artefacts to sysroot/firmware
Thread-Topic: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries
 artefacts to sysroot/firmware
Thread-Index: AQHWF686mYZ7S0t78EeyoJMoUc3KVKiu9imAgAAiMKA=
Date: Tue, 19 May 2020 06:10:46 +0000
Message-ID: 
 <AM0PR08MB39876088695CD79E3EECB31E92B90@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
 <1587454435-46370-3-git-send-email-diego.sueiro@arm.com>
 <20200519040543.GP11927@denix.org>
In-Reply-To: <20200519040543.GP11927@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 134636a1-8427-4374-afe8-154c8ed35a4a.0
x-checkrecipientchecked: true
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e7b21c1-038c-43c6-1c28-08d7fbbb631a
x-ms-traffictypediagnostic: AM0PR08MB5348:|AM5PR0802MB2388:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB23883E703C3ABD3F7B4AA4F692B90@AM5PR0802MB2388.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 l3ziqF78/s0KQXbz6IIxs2gWyPWlAfXXi/Edb5W3IStTrmqic8d0rzaZ6FLu3vd5A9Wr0dKFbi7CjM1w3BLLcrPFPowE4rw53OaNLrfLZv8G/VkptQjEJ75qxAxbblgWJI5wdiWB0OsRrZ4Rx+B0Km2WS7XQjBcbUq6q0nqeAoaeij9oWLO3wt65Qi3kzwKG9ZZ8ex7AB11CjkbSeI5iH6vi1B0bECLqVq/bLoVmP3JHJ711OidwKUve00Rl4B+3dwHlQQ/gfnG74DOb3mtW6p0sY0904kRk2QmaxMQHBXzm3PhV+0P+Tw73kNAoe3BmgJwsT6JgFqDvM5AXRRP402NpLbGg8QP9xQ2hN9Hx68YfUzPFgDRK+/q/aMkm8n8xtIdqND0DlQYMK/nKNa63dKssooh173Tgmy0pT/mx8UDuk/qrzP52Pd8+3Xtf5+tr
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(4326008)(9686003)(55016002)(53546011)(6506007)(76116006)(8676002)(316002)(71200400001)(8936002)(66476007)(2906002)(26005)(186003)(110136005)(64756008)(66446008)(66556008)(7696005)(66946007)(52536014)(86362001)(478600001)(33656002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 auMY3bFE00kphi91UUB2gNZn2JHmInJ8Eeb1CHkEriBclnaaufyNUKfozYyKqntvRxlCO4SfKCyLJKx0IbIxsY1+dxtdiiUzV/UoRg7gOndcI9uDNCErnNEURbvZT1pc5V7Aq22+ZP9z+AoToZFtx0IVIrGFdSZtvuiit18Ygq2eNUsmhP5iogma4koR5QxPg8MZYGWIbHtW0nFhR77rFw6rrsNeDNtgGll23iReIOrBHYn8+XBqay6Lvpr7R3n56XHf6ePJ+45febN7q9sZR+f2o9HBByjcfCzwurRDt/0vy18AzFSUGPjIRCx+o7WBNcO/Y4es8UDoeR78eAhNqhD4Q5NkCs4Uq8LSIG/s7vPs+38tzjTKX9AlFN6R40xnj74Km1fMImRTLwngBime1Fekc+S8bzjxxSJO4d9GzqjCx2dzq7Qvz9NrNZPVk75AOy3CRLx4MtEyFTU2CKka0hvAAe40po9FlNrho5hG1kc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5348
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966005)(8676002)(478600001)(356005)(186003)(81166007)(6506007)(9686003)(110136005)(53546011)(26005)(52536014)(82310400002)(33656002)(8936002)(86362001)(82740400003)(70586007)(336012)(55016002)(70206006)(5660300002)(4326008)(7696005)(2906002)(36906005)(316002)(47076004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2166bf90-a746-4972-afa1-08d7fbbb5f2f
X-Forefront-PRVS: 040866B734
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zxWdggEA9LNGeiq8vm8vRVW8D2sXio1qRRUpKYytvxiXjz1E3KP3VIT8zojkrHTm4F3mYgJ3uqAqfmuR/QIRgAQWqRwVJCION2gCCxdaveVzDIrxJaODvZYTLubpNPRbsdGFTwrd4Zxy8kOmAsAZ6D5vhTElENGocLDYiWPAlmx6xWHUFmgTHn1tsjqVtrudIvQpeTaRLC13ik57TREmRjtG2CHOhR8b5OwiGMRDPXZF+IGD6KbC90gydUtY6DtUCHfATKnluSHK3ZBsDOa836JFyI8ke88PQxe9CyjSSZwWqi88n6wnEILgqZWtZLMHlmwQ29HkVH1qFkbnpHo/u0gp7S5YT++gRkasvR9+OIq24V8twoZBDvCAHm+QZeef2cxR/pOBsDCEs6tg23JQ+2r1BFRLtp8AWNJqQjMf6qj79bl2EnFvcAQgOabsnhap8GUSxHgbkVA7YL+RvF5Nf+GsNPmQjpFL71hgQ1YR1M4gXo2aMkVFYmCZ1z2ew+trR1d7jZ7a6v1ddsGvKvTETg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 06:10:53.5226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7b21c1-038c-43c6-1c28-08d7fbbb631a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2388
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 19 May 2020 05:06
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>; Diego Sueiro <Diego.Sueiro@arm.com>
> Subject: Re: [meta-arm] [PATCH 2/5] trusted-firmware-a: Deliver binaries
> artefacts to sysroot/firmware
>=20
> On Tue, Apr 21, 2020 at 08:33:52AM +0100, Diego Sueiro wrote:
> > Make usage of the do_install task to deliver binaries artefacts to the
> > `sysroot/firmware` path, making it easier for other recipes that
> > depends on it to make usage of those binaries instead of copying them
> > from the DEPLOY_DIR_IMAGE.
> >
> > This recipe still deploys its artefacts to DEPLOY_DIR_IMAGE.
> >
> > Change-Id: I97b97f90b23746557e981f8de10159c5f475becd
> > Issue-Id: SCM-888
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  .../trusted-firmware-a/trusted-firmware-a-fvp.inc  |  7 +++--
> >  .../trusted-firmware-a/trusted-firmware-a.inc      | 31 +++++++++++++-=
------
> --
> >  2 files changed, 21 insertions(+), 17 deletions(-)
> >
> > diff --git
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.i
> > nc
> > b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.i
> > nc
> > index 6e7eba3..3e58ecf 100644
> > ---
> > a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.i
> > nc
> > +++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-f
> > +++ vp.inc
> > @@ -12,9 +12,9 @@ TFA_MBEDTLS =3D "1"
> >  TFA_UBOOT =3D "1"
> >  TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fiptool"
> >
> > -do_deploy[depends] +=3D "virtual/kernel:do_deploy"
> > +do_install[depends] +=3D "virtual/kernel:do_deploy"
> >
> > -do_deploy_append() {
> > +do_install_append() {
> >      ./tools/fiptool/fiptool create \
> >          --tb-fw ${S}/${TFA_BUILD_DIR}/bl2.bin \
> >          --soc-fw ${S}/${TFA_BUILD_DIR}/bl31.bin \ @@ -26,6 +26,5 @@
> > do_deploy_append() {
> >
> >      ./tools/fiptool/fiptool info fip.bin
> >
> > -    install -m 0644 ${S}/fip.bin ${DEPLOYDIR}/fip-fvp.bin
> > +    install -m 0644 ${S}/fip.bin ${D}/firmware/fip-fvp.bin
> >  }
> > -
> > diff --git
> > a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index d7c4fbf..93ca199 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -5,7 +5,7 @@ PROVIDES =3D "virtual/trusted-firmware-a"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > -inherit deploy
> > +inherit deploy nopackages
>=20
> I totally missed this ^^^ - may I ask why nopackages was added here?

Because this recipe is not generating packages to be installed in the rootf=
s.

>=20
>=20
> >  COMPATIBLE_MACHINE ?=3D "invalid"
> >
> > @@ -42,12 +42,12 @@ SRCREV_FORMAT_append =3D
> > "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',  TFA_UBOOT ?=
=3D
> "0"
> >
> >  # What to build
> > -# By default we only build bl1, do_deploy will install
> > +# By default we only build bl1, do_deploy will copy
> >  # everything listed in this variable (by default bl1.bin)
> > TFA_BUILD_TARGET ?=3D "bl1"
> >
> >  # What to install
> > -# do_deploy will install everything listed in this
> > +# do_install and do_deploy will install everything listed in this
> >  # variable. It is set by default to TFA_BUILD_TARGET
> > TFA_INSTALL_TARGET ?=3D "${TFA_BUILD_TARGET}"
> >
> > @@ -60,9 +60,8 @@ LDFLAGS[unexport] =3D "1"
> >  AS[unexport] =3D "1"
> >  LD[unexport] =3D "1"
> >
> > -# No configure or install
> > +# No configure
> >  do_configure[noexec] =3D "1"
> > -do_install[noexec] =3D "1"
> >
> >  # We need dtc for dtbs compilation
> >  # We need openssl for fiptool
> > @@ -87,27 +86,27 @@ do_compile() {
> >      oe_runmake ${TFA_BUILD_TARGET}
> >  }
> >
> > -do_deploy() {
> > -    install -d -m 755 ${DEPLOYDIR}
> > +do_install() {
> > +    install -d -m 755 ${D}/firmware
> >      for atfbin in ${TFA_INSTALL_TARGET}; do
> >          if [ "$atfbin" =3D "all" ]; then
> >              # Target all is not handled by default
> > -            bberror "all as TFA_INSTALL_TARGET is not handled by do_de=
ploy"
> > +            bberror "all as TFA_INSTALL_TARGET is not handled by do_in=
stall"
> >              bberror "Please specify valid targets in TFA_INSTALL_TARGE=
T or"
> > -            bberror "rewrite or turn off do_deploy"
> > +            bberror "rewrite or turn off do_install"
> >              exit 1
> >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
> >              echo "Install $atfbin.bin"
> >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
> > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.bin
> > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
> >              echo "Install $atfbin.elf"
> >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
> > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.elf
> > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> >          elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
> >              echo "Install $atfbin"
> >              install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
> > -                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}
> > +                ${D}/firmware/$atfbin-${TFA_PLATFORM}
> >          elif [ "$atfbin" =3D "dtbs" ]; then
> >              echo "dtbs install, skipped"
> >          elif [ -f ${S}/tools/$atfbin/$atfbin ]; then @@ -118,4
> > +117,10 @@ do_deploy() {
> >          fi
> >      done
> >  }
> > -addtask deploy before do_build after do_compile
> > +
> > +SYSROOT_DIRS +=3D "/firmware"
> > +
> > +do_deploy() {
> > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/ } addtask deploy after
> > +do_install
> > --
> > 2.7.4
> >
>=20
> >

