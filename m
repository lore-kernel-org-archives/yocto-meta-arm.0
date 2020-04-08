Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web12.12050.1586354721585774578
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 07:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o757wM3t;
 spf=pass (domain: arm.com, ip: 40.107.21.56, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k3VriuogUjgMZz9dBmcxen9eO9lc+qF6R0N4iyyLIc=;
 b=o757wM3tShVCKVCUD2eJVSM/kXcrhx7PkUNPaSqTYrKYXyAuYS7hxri9fEfLDsZqaTIrSx2mkm39vBgWZYwRxP6w/OXLrthUdGyrbrzBdnkcaRDvf3sVlVfMa3mNGmmtXddlgniP2hio6N7p/E3Yniq8hkl8LNqUpr7cxDKtjoM=
Received: from DB8P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::13)
 by AM4PR08MB2817.eurprd08.prod.outlook.com (2603:10a6:205:9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.21; Wed, 8 Apr
 2020 14:05:19 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::b9) by DB8P191CA0003.outlook.office365.com
 (2603:10a6:10:130::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 14:05:18 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 8 Apr 2020 14:05:18 +0000
Received: ("Tessian outbound e2c88df8bbbe:v50"); Wed, 08 Apr 2020 14:05:18 +0000
X-CR-MTA-TID: 64aa7808
Received: from 6c618c172b2e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 92AE268C-AFA9-42D5-9190-B952D07742AB.1;
	Wed, 08 Apr 2020 14:05:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c618c172b2e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Apr 2020 14:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVdVXNVpa4umClg61esI67EIFX7G+uPMA0DODzMzgTp0WRLRnxfrj8OuEqHq4dgyGxKDBr1QXlPb5lAlhaErtHfLbNlzhPHUYeMEJsnsht3ejZBx6XAug+HlMgmAC1wYllRaA3aP/p0fORSxZrA3R0M19wbdBtwoPlOT1PTmJxgdrDaBnXroSzfYH8Eish5tooavcCL7HCq3j84DNd3LrVXSOAkiH9K5Lt/nxNLPRHSSa9ta4/p3dRNRJBN3cLpFXtigZJ/HedP/BJsjIJNlZWWu5qFZ+Bc4Y0fQaLa2q4Q+jjMzuvjvmdQhiyTGa8zjinM6Kcwa3l4aHr3aH/M6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k3VriuogUjgMZz9dBmcxen9eO9lc+qF6R0N4iyyLIc=;
 b=lfKHMZHpTZIywgftKvnEPNMDIM6rJMcYpwimPsy2sHPb8kNBxP2T62GPOnK4XZqQ0aRmOuJB8/WLK26nfLNKo2EHeavt8i32k24aTSsvC4soO4W88fmkIFZLD60c5TtAldlX2L9wZ8E9WWURNJPhNI8kqFeWnvDRjHC1o+l6HMWz6wRXfnRtj/2cExfwXTKLH2jlNZVhzU+jYTlRKxZLtzg5K/1PRjBddov3cInVMG37G6S3+nGU/2pijG98i4DHeH9qm1Ct1tfxakCjpW4alKjwcEOGJTig6lIdrX0FLKVnx01Q/ltgGELDC45fZ2MKvLMaZJ7Ql1FsxLx8yq9yyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k3VriuogUjgMZz9dBmcxen9eO9lc+qF6R0N4iyyLIc=;
 b=o757wM3tShVCKVCUD2eJVSM/kXcrhx7PkUNPaSqTYrKYXyAuYS7hxri9fEfLDsZqaTIrSx2mkm39vBgWZYwRxP6w/OXLrthUdGyrbrzBdnkcaRDvf3sVlVfMa3mNGmmtXddlgniP2hio6N7p/E3Yniq8hkl8LNqUpr7cxDKtjoM=
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB4559.eurprd08.prod.outlook.com (2603:10a6:803:100::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Wed, 8 Apr
 2020 14:05:11 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358%7]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 14:05:11 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Jon Mason <jdmason@kudzu.us>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 0/2] Move Xen specifics from meta-arm-bsp to meta-arm-autonomy
Thread-Topic: [meta-arm] [PATCH 0/2] Move Xen specifics from meta-arm-bsp to
 meta-arm-autonomy
Thread-Index: AQHWDYknkJLoSMt8yEGULwTTSTodaahvQI8AgAABFjA=
Date: Wed, 8 Apr 2020 14:05:11 +0000
Message-ID: 
 <VI1PR08MB3998606049A7AD406F32B40392C00@VI1PR08MB3998.eurprd08.prod.outlook.com>
References: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
 <20200408135843.GC1355@kudzu.us>
In-Reply-To: <20200408135843.GC1355@kudzu.us>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 609192cc-80c7-4ff9-bf51-425c1fc0206c.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eca9a449-e275-41d8-5bf9-08d7dbc5debd
x-ms-traffictypediagnostic: VI1PR08MB4559:|AM4PR08MB2817:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2817684DD55EF9784C189AAB92C00@AM4PR08MB2817.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0367A50BB1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(8936002)(53546011)(7696005)(33656002)(4326008)(81156014)(6506007)(8676002)(55016002)(9686003)(52536014)(64756008)(26005)(66476007)(71200400001)(66446008)(66946007)(316002)(81166007)(66556008)(110136005)(86362001)(478600001)(966005)(186003)(76116006)(5660300002)(2906002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K4yt1Q+iByUHZbMpdOAspCreKuMY3+GJdmj85S026jCzW47ZnKipJ8MWdYE/TJ2w1OTTGwbl0dsTLBLCRuTLf5us4UIU0Vd/uh6+1AKq8oIFI6ZbrVlWNwCJo8ZNPxLgywKSIqSe1vi1l73Q4Ruue6fopfYF6Jg56LDTad1FHvE/HN3r5IgijMbaRWEFlA6L3IBM8R/3AHhDH1jHqIw0khxK5GMTWwf9zurbS4xtLvTOxjZk2Nu9dBW5R5oUMNqSbteDEv9lft9eqjldk2sXaXw6LS8tl2F3Okg8IhvO0UGUCTCCx+Lh14Hy5BdFy9YB/iHXPiNibxEGExy8tFAooRMva5z4bQEtOjJ5uPLrh6DEupNVK+W0NfCyKk2/YLN99FLWHx4BrJVaPggBz6n9D69PeBuX3tgencLC2/r6BgPnDfeFQe9MWM54bGOVDvgWt4bgEwmQONqP3Hv5nJ5jSSIFv3Ordn4EqZ1zRBtd0Wf5tvGC6JlXQPyFox0EPm8iTrhY+99epHYOfCdpsseHTw==
x-ms-exchange-antispam-messagedata: 
 AyTBxBhdKzB8YlE0Tjbh5RXU6Vj2YBra//G1bgW2/d6wj6mFVxgsQj0P2BqFdtY/rz0z3PZJiTmQtgzJJ5xyybRKcABDY/m0IE5VHoi3cPMPfUKuo9HoJmkOjpmz6tXNcfv9eVeXJUOgoGtJsbRizg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4559
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(5660300002)(70586007)(47076004)(33656002)(2906002)(966005)(52536014)(4326008)(82740400003)(356004)(86362001)(53546011)(186003)(81156014)(110136005)(70206006)(26826003)(316002)(336012)(7696005)(6506007)(81166007)(8936002)(55016002)(26005)(478600001)(8676002)(9686003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	321cc0a6-d149-424d-d672-08d7dbc5da90
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AFRVL2ikTgGz5zwTk4QLYNQgTvpjVGVamfA9WHpxV8fTkn+w8LKV/i//sWSgZQp9S8O7fEEnAn7iyV1oiKlo91+sKaJbPAjc+i2baBGI1bKwp11zlqjNo0lcJPZbrsq+2TZmTYtx3HruNyZ+MwNtTNZVWDKxL5aPY5d1ErPhhf5bzdI8JNdb0Vmoy3+kK+MxRjz80FC6aQhp1kaSRnpAaOVPtn2cCsv1tsJG+dq1n6v0DVpAlZ3blICC5pkShq9JzWyRWDtSg8umP+sr7Caug9EjJXbkoISAIt7uerDBO0nYeBpG5INY5ZLYMmYvyzTIM6uiw0HG92mVOsieCvNlh6fOgvUFJEkda8nppjqjee+k1/g5P3ub5Ir6Smf2Ge6JjBIOk2H9WyO9pNqSHljyQQvSYfgQO7pB+8YqNHj4h7i6TXBSKRc7lwxCMd/gjeLycvDpUNyf/MAlSvP6TIoe7Xc3DL0aVG2Pqg+iRtHMju/Bs9qe6+PY6U0TIRWB5GOih5m0hCpjS8zDEEn6KnOiXGtBUdjB/G5ujwHbZJoRQRLsbBK8W0LB56KGoq8UOs8n+bdscN4vqonPW8gqJipNZw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 14:05:18.8136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eca9a449-e275-41d8-5bf9-08d7dbc5debd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2817
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Jon Mason <jdmason@kudzu.us>
> Sent: 08 April 2020 14:59
> To: meta-arm@lists.yoctoproject.org
> Cc: Diego Sueiro <Diego.Sueiro@arm.com>
> Subject: Re: [meta-arm] [PATCH 0/2] Move Xen specifics from meta-arm-bsp
> to meta-arm-autonomy
>=20
> On Wed, Apr 08, 2020 at 10:36:11AM +0100, Diego Sueiro wrote:
> > This patch series is to remove Xen specifics from meta-arm-bsp and add
> > to meta-arm-autonomy.
>=20
> Applied to the master branch.  I had to do some minor rebasing to get it=
 on
> top of Denys' changes.  So, please sanity check what's upstream
> :)

That looks OK.
I think that the conflict was in the "meta-arm-bsp/conf/layer.conf"
file in the " LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus dunfell" "=
 line.

Cheers,
*dS

>=20
> Thanks,
> Jon
>=20
> >
> > Diego Sueiro (2):
> >   meta-arm-bsp: Remove Xen specifics
> >   arm-autonomy: Add Xen specifics from meta-arm-bsp
> >
> >  .../boot-wrapper-aarch64_%.bbappend                | 32
> ++++++++++++++++++++++
> >  .../trusted-firmware-a/files/juno}/images-r0.txt   |  0
> >  .../trusted-firmware-a/files/juno}/images-r1.txt   |  0
> >  .../trusted-firmware-a/files/juno}/images-r2.txt   |  0
> >  .../trusted-firmware-a/files/juno}/uEnv.txt        |  0
> >  .../trusted-firmware-a_2.%.bbappend                | 13 +++++++++
> >  .../4.12.0/0001-trace-fix-build-with-gcc9.patch    |  0
> >  ...ap-the-number-of-interrupt-lines-for-dom0.patch |  0
> >  .../recipes-extended/xen/files/fvp}/defconfig      |  0
> >  .../recipes-extended/xen/files/juno}/defconfig     |  0
> >  .../recipes-extended/xen/xen_4.%.bbappend          |  7 ++++-
> >  .../recipes-extended/xen/xen_4.12.0.bbappend       |  0
> >  .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 +++
> >  .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
> >  .../recipes-kernel/linux/linux-arm-autonomy.inc    | 14 +++++++++-
> >  meta-arm-bsp/conf/layer.conf                       |  5 ----
> >  meta-arm-bsp/conf/machine/fvp-common/fvp.inc       |  3 --
> >  meta-arm-bsp/conf/machine/gem5-arm64.conf          | 15 ++--------
> >  meta-arm-bsp/conf/machine/juno.conf                |  3 --
> >  .../boot-wrapper-aaarch64/boot-wrapper-aarch64.inc | 21
> > +-------------  .../trusted-firmware-a/trusted-firmware-a-juno.inc |  =
9 +-----
> >  .../bsp/arm-platforms/fvp/fvp-board.cfg            |  5 ----
> >  .../arm-platforms/gem5-arm64/gem5-arm64-board.cfg  |  5 ----
> >  23 files changed, 76 insertions(+), 63 deletions(-)  create mode
> > 100644
> > meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-
> aarch
> > 64_%.bbappend  rename
> > {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D>
> > meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-
> r0
> > .txt (100%)  rename
> > {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D>
> > meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-
> r1
> > .txt (100%)  rename
> > {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D>
> > meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/images-
> r2
> > .txt (100%)  rename
> > {meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen =3D>
> > meta-arm-autonomy/recipes-bsp/trusted-firmware-a/files/juno}/uEnv.txt
> > (100%)  create mode 100644
> > meta-arm-autonomy/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.
> > %.bbappend  rename {meta-arm-bsp =3D>
> > meta-arm-autonomy}/recipes-extended/xen/files/4.12.0/0001-trace-fix-bu
> > ild-with-gcc9.patch (100%)  rename {meta-arm-bsp =3D>
> > meta-arm-autonomy}/recipes-extended/xen/files/4.12.0/0001-xen-arm-
> Cap-
> > the-number-of-interrupt-lines-for-dom0.patch (100%)  rename
> > {meta-arm-bsp/recipes-extended/xen/files/juno =3D>
> > meta-arm-autonomy/recipes-extended/xen/files/fvp}/defconfig (100%)
> > rename {meta-arm-bsp/recipes-extended/xen/files/fvp =3D>
> > meta-arm-autonomy/recipes-extended/xen/files/juno}/defconfig (100%)
> > rename {meta-arm-bsp =3D>
> > meta-arm-autonomy}/recipes-extended/xen/xen_4.%.bbappend (75%)
> rename
> > {meta-arm-bsp =3D>
> > meta-arm-autonomy}/recipes-extended/xen/xen_4.12.0.bbappend (100%)
> > create mode 100644
> > meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm
> > -autonomy/disable-arm64-sve.cfg  create mode 100644
> > meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/features/arm
> > -autonomy/disable-arm64-sve.scc
> >
> > --
> > 2.7.4
> >
>=20
> >=20

