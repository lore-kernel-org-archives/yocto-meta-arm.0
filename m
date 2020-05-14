Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.70])
 by mx.groups.io with SMTP id smtpd.web11.7220.1589437333062484057
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 23:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=70DChVZf;
 spf=pass (domain: arm.com, ip: 40.107.5.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB3BNVoyA0lMy3CMqziujwRaALtDcI3kR6WCEAE55GY=;
 b=70DChVZfozH7qO1boAPbAFAeU7Gkwsi/4/lltcYHIqWC2Flf+ZRQhR949mZSqsP4iMXUGMwhf4p3D3fxexHn8RSbgftN29vIxzrdMDU6RN+hmVeGmOL4S/dqff0tou2WET5hfN4XgAGQuUeg6FAjRE+Cdlis8v5ymZGJ5GDezq4=
Received: from AM6PR10CA0097.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::38)
 by AM0PR08MB3235.eurprd08.prod.outlook.com (2603:10a6:208:57::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Thu, 14 May
 2020 06:22:10 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::a2) by AM6PR10CA0097.outlook.office365.com
 (2603:10a6:209:8c::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Thu, 14 May 2020 06:22:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 06:22:09 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Thu, 14 May 2020 06:22:09 +0000
X-CR-MTA-TID: 64aa7808
Received: from eda571dddbca.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B5EA8641-1441-408D-B593-5F190B18D2FA.1;
	Thu, 14 May 2020 06:22:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eda571dddbca.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 May 2020 06:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/S5BhmGo+TJj/Wh430dcB8b6amtDpb9tsuODP+wwNSNi8Sm2MMYDZDIEPOuQiqnlAPIM740uVxCbTFY38DnP2dZu48KXeQ1K6soCbVQ4ZQEnodKL6jezOei6/T5Ox2EMljF7/dSkeerg9P/xmghIzbOcCyGkYwQd55nKdzr0/agbla+2ckocIxYbWP2dlul8udmJiN/bldh3RUqtnMK8wA5Kbfiu6nGfZnbQUxwSelDZQIJYlkJAEayIL/D6bgEbqIJ90qHbz1/Is48ZsIDQ1DBBHjcczyf2I6gwlwzGxBRV4VO829oHPh6/4s5YYjPH8N7Nte6dNPZBFmtpwB5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB3BNVoyA0lMy3CMqziujwRaALtDcI3kR6WCEAE55GY=;
 b=nhzJIrW6Plc/qolTe5wsz1axigvkBqVRtdmeakxsJOwRZBXxqYWsRvhrosPHJ7wPxBxq4oQtNQnjNAnSVX0+eok1Z1W0+39VuG5I6iVrbW5E/gpmQ9LIokVG8tNNKd2Zu8wGkzE24izwJE3nTu8YEJCQn9MD1iCGIbMuNf1v2wIv/Bx6EjLmG3mJDg0XOFNDEsA9c+BYCP4H0rwofgIOmZOA5GPetsBroIUxZNE6W3s2djHX++0oml0xjvowRmRgYPYZ52lxG1covboACw9JAxHGa288DndVt821o9/TBkk9nQsGOAHVCahDvXi8b6k/A3/3lqZotN4u6tybnv6yzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB3BNVoyA0lMy3CMqziujwRaALtDcI3kR6WCEAE55GY=;
 b=70DChVZfozH7qO1boAPbAFAeU7Gkwsi/4/lltcYHIqWC2Flf+ZRQhR949mZSqsP4iMXUGMwhf4p3D3fxexHn8RSbgftN29vIxzrdMDU6RN+hmVeGmOL4S/dqff0tou2WET5hfN4XgAGQuUeg6FAjRE+Cdlis8v5ymZGJ5GDezq4=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4132.eurprd08.prod.outlook.com (2603:10a6:208:127::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Thu, 14 May
 2020 06:22:02 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 06:22:02 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "denis@denix.org" <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] trusted-firmware-a: support multi-board platforms
Thread-Topic: [meta-arm] [PATCH 1/2] trusted-firmware-a: support multi-board
 platforms
Thread-Index: AQHWKX6Jt+SPqaizeEepccNkcBQTvqimrekAgAAFmwCAAGkEUA==
Date: Thu, 14 May 2020 06:22:02 +0000
Message-ID: 
 <AM0PR08MB3987239EA87234650DFF48CE92BC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1589412620-56223-1-git-send-email-denis@denix.org>
 <CAJdd5Gbd6Sia48u64zYNB=f0cDNcFy=-oQ-2Y60YbjS4MXy3yA@mail.gmail.com>
 <20200514000436.GW11927@denix.org>
In-Reply-To: <20200514000436.GW11927@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 10738423-ae3b-49f6-a3ab-0f48e9bb01ff.0
x-checkrecipientchecked: true
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e31e6c09-434d-4a8b-62ec-08d7f7cf21cf
x-ms-traffictypediagnostic: AM0PR08MB4132:|AM0PR08MB3235:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3235713651A5D3EB3946292192BC0@AM0PR08MB3235.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tg1Z/dbD0DguVDwES4732afQ+ywtUbkQPCHAHmelXEnHnJ3iqN20K+cBEm/gOtoqi9ws2Weojt1ddWKNTj8rNGCAt1Bf6KZnC4M4ArZss80+/5UKZrpIogktyfZM+c6rBMZXRjt3Zlx+cDB4EykuqX5iBBXzzPpYLFLFszEEXkyHO0Mc1tG+Flh7m/BgN/jhNNfRheO6itdl2w+MOGVOF8WlJ+4WT9opL9flM6yaMtu9b2XkT9Kh2vALRQutmZKw4ZUpTQRsTv5l0k93Tmnlzpf9it8bUKpcaTBnKW+oyZYirojJGpFPfn0CSssBvD7CJgAW2hQp6op5P/yRByqicSJ9FksRNsXygTAbeRfO7d/+cJx3/GwVljzXmtaEppxfsdAxXQdV5CwwQKOeOTxRy4iTpM2SiQMnWjACCvWMTJ0qbqRfjSi/rOsidQe0Llpc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(26005)(4326008)(55016002)(76116006)(66556008)(33656002)(9686003)(66446008)(66946007)(110136005)(66476007)(54906003)(478600001)(64756008)(316002)(6506007)(53546011)(86362001)(52536014)(7696005)(5660300002)(71200400001)(186003)(8936002)(2906002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 r8sy+xZuAwE+wj2bhjGAtEJZyq7wk7PaSwkrGRjSqiOoDxwpFzJOQ2THYs6rALZDH6PVRuvrPDbUD3AFlHIaXOmUhWdGvql8pOc/KizUBwt/8smCd3Dq/9oSdVSywYo0kMxGu3bTO6P364xUnfs8kXHlbJhmL0AKDypR8bF47K4e4qGQCCUtGIR9HGz1pNNvGvM+RDVOjzZWknh6Z3ufhelApA/ce2usihP/TRnXLn4G1mXlpzbhUU4gt4E7gt/iJMpSu8a1SBToQaIm4ggVmOwYoYslBuDE7DHy0Umge+DLOky+GLzs+CYKn1mPPNvmt/pAzej4ZQFE1LDDczENQeLglhM3OJiiRqvv1iEjI/b11kLJsDJkBgty1+kaCeBfCSgjdXswyCRFNSUoZ4cB8I2c9pff6eswR5EqJhrY2/Y830UgPXXdEbfDX4BMvld/MpScmEFcLuRky71X1Yh2mpyZqwJypO9FXo+yqOIWKX8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4132
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(36906005)(8936002)(54906003)(82310400002)(7696005)(4326008)(8676002)(336012)(82740400003)(47076004)(356005)(110136005)(5660300002)(81166007)(6506007)(53546011)(86362001)(478600001)(52536014)(2906002)(55016002)(26005)(33656002)(9686003)(186003)(70206006)(70586007)(316002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f72d7457-aa23-48fb-1f68-08d7f7cf1db9
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	holFspcXzt/AUEg9wdCOgYcAGguqFAKFICj7CFVNwh9+0TTHcj7Kan6TkVLt53xG5DGBC32gBwHPtcHGWYD67AH086gvPhQlLsIfFstrdNRGtXCzXFNToF0fiui3Pe8c/nq+mm//Z7Q3jjG0WAfF54T3WIb65eQQl1+q3/Ndf097FHusgsVMdQaEGqdTGdrldATbDXRdz+RIYeS6bTPTOZNu34PJBgCp7hnvWcUgm4DF4gIMQ5zRHwIIOlre2t42PMxVG86JF5QmpoaGzyki3u3fMmKS2D05W63axdqVn6rT3QbXGChy+Fntl8ZbHsC+8SOcL/pMOyQXMmsQ8Eh+vfRU2n61WP9HNwW94Ef509NmSYWwfB7BjtxtWw1pi3GDVKTDdafp8fVEL5c2Gf0V+vF2j4MpfiRBm9CQGmS1O05kocyRyIXtnB//C2nW5IiV+0tWlItSafJQVt6BinM6S7Fr9lIo2ZGeRcd5ZWEKZ0vvL0iB/K2eo3fF2JLMtuZt3WxOff45fSmZcvf8BU7nQQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 06:22:09.2695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e31e6c09-434d-4a8b-62ec-08d7f7cf21cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3235
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 14 May 2020 01:05
> To: Joshua Watt <jpewhacker@gmail.com>
> Cc: meta-arm@lists.yoctoproject.org
> Subject: Re: [meta-arm] [PATCH 1/2] trusted-firmware-a: support multi-
> board platforms
>=20
> On Wed, May 13, 2020 at 06:44:32PM -0500, Joshua Watt wrote:
> > On Wed, May 13, 2020, 6:30 PM Denys Dmytriyenko <denis@denix.org>
> wrote:
> >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Some platforms can have multiple board configurations, passed as
> > > TARGET_BOARD=3D""
> > > that also becomes an extra directory level in the build output hierar=
chy.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 12
> > > ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git
> > > a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > index 4b5da7a..b88b514 100644
> > > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > > @@ -12,6 +12,10 @@ COMPATIBLE_MACHINE ?=3D "invalid"
> > >  # Platform must be set for each machine  TFA_PLATFORM ?=3D "invalid"
> > >
> > > +# Some platforms can have multiple board configurations # Leave
> > > +empty for default behavior TFA_BOARD ?=3D ""
> > > +
> > >  # Build for debug (set TFA_DEBUG to 1 to activate)  TFA_DEBUG ?=3D
> > > "0"
> > >
> > > @@ -65,6 +69,10 @@ DEPENDS_append =3D " dtc-native openssl-native"
> > >  # Add platform parameter
> > >  EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}"
> > >
> > > +# Handle TFA_BOARD parameter
> > > +EXTRA_OEMAKE +=3D "${@['',
> > > 'TARGET_BOARD=3D${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
> > > +BUILD_DIR =3D "${@['${TFA_PLATFORM}',
> > > '${TFA_PLATFORM}/${TFA_BOARD}'][bool(d.getVar('TFA_BOARD'))]}"
> > >
> >
> > I noticed you're doing the Boolean index trick. A little more pythonic
> > and IMHO easier to read would be:
> >
> >  "${TFA_PLATFORM}${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
>=20
> Hmm, I saw OE-Core using the Boolean index trick in bitbake.conf and othe=
r
> places quite a lot - I was just following the tradition.
>=20
> For me personally pure pythonic is too much of a brain twist - booleans,
> simple arrays and such are more natural for me to understand... :)
>=20
> But if required, I can change - just let me know.
>=20

I vote for keeping the consistency with the rest of the recipe.

>=20
> > >  # Handle TFA_DEBUG parameter
> > >  EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_DEBUG', '1', '
> > > DEBUG=3D${TFA_DEBUG}', '', d)}"
> > >
> > > @@ -93,9 +101,9 @@ do_compile[cleandirs] =3D "${B}"
> > >
> > >  do_install() {
> > >      if ${@"true" if d.getVar('TFA_DEBUG') =3D=3D '1' else "false"}; =
then
> > > -        BUILD_PLAT=3D${B}/${TFA_PLATFORM}/debug/
> > > +        BUILD_PLAT=3D${B}/${BUILD_DIR}/debug/
> > >      else
> > > -        BUILD_PLAT=3D${B}/${TFA_PLATFORM}/release/
> > > +        BUILD_PLAT=3D${B}/${BUILD_DIR}/release/
> > >      fi
> > >
> > >      install -d -m 755 ${D}/firmware
> > > --
> > > 2.7.4
> > >
> > >
> > >
