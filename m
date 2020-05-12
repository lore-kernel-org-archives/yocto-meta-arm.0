Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.60])
 by mx.groups.io with SMTP id smtpd.web12.2192.1589273806023758283
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 01:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uptU8N23;
 spf=pass (domain: arm.com, ip: 40.107.22.60, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzL0/zTcSoUxE8ZRCQEgXvNPERuUgkHFRh0oM8VzUGg=;
 b=uptU8N237Tz0HcOtDiGtY00QNS1peAtrpxZG4SSqPEzWktHKPJAm+zQ0lQkf11BmV9Nljo/+vGAJQVxPa1FCkvTk9ag3pJoIr2Kyta0FyAk3kvLidffZUf2RN/F/42wgHK+OAGftUC1CKtccG7CBhTNpPahURMzl7jMyenFV42g=
Received: from AM6PR10CA0065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::42)
 by DB6PR0801MB2007.eurprd08.prod.outlook.com (2603:10a6:4:78::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 08:56:43 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::bb) by AM6PR10CA0065.outlook.office365.com
 (2603:10a6:209:80::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Tue, 12 May 2020 08:56:43 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 08:56:42 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Tue, 12 May 2020 08:56:42 +0000
X-CR-MTA-TID: 64aa7808
Received: from 38d0c0827127.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5F817D6C-959D-44F1-960B-5AE985DB29A4.1;
	Tue, 12 May 2020 08:56:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38d0c0827127.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 08:56:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHGc8i0Q5vukNDOsH+YVJGKOm4rC51Nf95fvGa9sgBsy0nBu5F2llfj1P/p5kWuLFZpOs0dV0g3UwnRvrlmKLEzSaut6a9mZA0niI7uVNh1iDJvrNTwxcAsBd8vmKOUeYC8L85I5HrVwqBnFUR6SEkHF5YWTe8tldwtE37t9VvJmHGndDqd4F4FTUqpSS56pzk9ZuweUFqznOLraJfxRpyxuSH2dwj+TwXBKAvBCTUtU78erzu4I0oxs0/H/AZNaHgWZvzLiErmjYjiBfdHVVLtHElRDh+LTuvKkBVrn0ZcqjuhdAjd8dBE1HfRuDiQat6FflFiP+fzhZPVuHAeh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzL0/zTcSoUxE8ZRCQEgXvNPERuUgkHFRh0oM8VzUGg=;
 b=XnEQCojD64LV2fk7Xr2QYE/YSC2PO5RW5B+FGJD+ZS71+VmZPrPJOpKCmcDwvKSX/8/crcCBaVqMVaE0heR2s17UUOPqUlmsJPBg73dXaFy6Uo1rBSV/ErVlgptaVUkx86dCsMZbjHH9SOj0Wiz7V87FKLz5Afc3nEAZkak4Z9YymetlVVYxDqxM1WIwZiZwvJn6BYF2rC3gFa9ZSvN+W1GH06m6XiirXvL9WWKSVepPTj0X2zMiqA6JXU1ifVikQ8BLrLuxlLRnx7ZEotnEFsGs7UCTFm0TXgooUvb9gODPpZHiGfeTepyIBKS0XioK9mBPQzRB4kyKbYo01VgGEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzL0/zTcSoUxE8ZRCQEgXvNPERuUgkHFRh0oM8VzUGg=;
 b=uptU8N237Tz0HcOtDiGtY00QNS1peAtrpxZG4SSqPEzWktHKPJAm+zQ0lQkf11BmV9Nljo/+vGAJQVxPa1FCkvTk9ag3pJoIr2Kyta0FyAk3kvLidffZUf2RN/F/42wgHK+OAGftUC1CKtccG7CBhTNpPahURMzl7jMyenFV42g=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5011.eurprd08.prod.outlook.com (2603:10a6:208:166::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Tue, 12 May
 2020 08:56:32 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 08:56:32 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "denis@denix.org" <denis@denix.org>, Jon Mason <Jon.Mason@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] Add recipes for TF-A versions 2.2 and 2.3
Thread-Topic: [meta-arm] [PATCH] Add recipes for TF-A versions 2.2 and 2.3
Thread-Index: AQHWJ/NEh2QeJAfW3UyP3Yy9k91YCaijmVEAgACL2fA=
Date: Tue, 12 May 2020 08:56:32 +0000
Message-ID: 
 <AM0PR08MB3987DB81A9955DA617D5B53A92BE0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200512002050.11739-1-jon.mason@arm.com>
 <20200512003100.GO11927@denix.org>
In-Reply-To: <20200512003100.GO11927@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 21f37942-b927-4b17-a072-60a79035ccc0.0
x-checkrecipientchecked: true
Authentication-Results-Original: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d21e8314-c56b-4c94-a49f-08d7f652644b
x-ms-traffictypediagnostic: AM0PR08MB5011:|AM0PR08MB5011:|DB6PR0801MB2007:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB20075804CDA8894B81F20EBE92BE0@DB6PR0801MB2007.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m7W6pVJDxPf+nN/+VOyNIP5dXOstS9utYjiMMAmRHncxlk1LOCjJ4Xpkh7NM3Wo3l/XTUfJr+TAyLKin45/AH+2ho1Sp0g9mAjuo31/jEO8LiCPoE7+Qp8yp/c1vkI+G+u9xi7aUUwujmE32QOTyzKqGd7GYlXaR66l5CP0I4hdpbFtDVjIKX2AnAEFR6TqyryEZMqaTGaToWl3I8Xn6QizYljMSvyWpgFH4MVKwKobvsA7QDoZqYGDfGH/zhT1swr2rwvt0CS0pp5txkgXia97KkDc8f7GGEyPDl/eEyRdjZrd96SpCM1HOv02M3h6jLirLnU0xcfo3bpdMrvAEW/8EcL3fomkp+sXWlTrxFpDe4l+FLJ/KLF+Oc9TV1A3iC6sC9pGVZXadSeRo2Vm9NN+zADCY6uywviSTugEE4OcQ2Ytk9+AIMAQpg/+7xLaOU9P/aXFd+2pbXpChXBynNG5fsOz+dJQlw6jZcNv5CkBntqNHHoFN8FLnlkMayoaSvJq/xbfV2ftO519GWfYpUw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(33430700001)(33440700001)(186003)(26005)(54906003)(2906002)(6506007)(110136005)(316002)(9686003)(8676002)(6636002)(66476007)(52536014)(5660300002)(66556008)(66446008)(64756008)(66946007)(478600001)(8936002)(33656002)(86362001)(76116006)(55016002)(7696005)(4326008)(30864003)(71200400001)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 K5QK1FKdHlewV6YmdINy81Y5lKDiPCr7knXvjg+Dt8TIKRtAvlhBaRTdZw3zsSj559PonolHrQWzbboOp0p+aQ1cQq9PgDJVnTpSD9d6OVNv8+D+wWqeaPRLrhB3nov3pnVl61cDwuwSuy/gTLIYasPFlunxCOzP95foxi4lubDrYdO0Om8Em3PsaLaCIWPYv27ere14KTJIC9IbWdBG7wBqwtFyZUbHtjOKD4le5yvwDlW7j79TQKqQGaQ8zQafCTgtv4G9dINJ+qc02GsP92qFa8zW9HTfydyn0KUFvT36J0phGmPc3kLlNQINm9okbopm3+73DPJTxrLPdI59gSw5BGXyP5NqX5VWih/f5TRU1yI1FgX41iUzwz5R1h/wg4c8WJdCtiioYjFRbL5LVRBj+yPRLPhsyqIX5NhYPu6ib00JTHGMoDZJQKm6X25oqNCm6NHzAviL/c4teW8FvNGo3iY09mcXHSL1mxOIL/g=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5011
Original-Authentication-Results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(33430700001)(30864003)(33656002)(47076004)(86362001)(54906003)(186003)(110136005)(55016002)(9686003)(6506007)(53546011)(81166007)(336012)(7696005)(6636002)(4326008)(26005)(82740400003)(5660300002)(70586007)(8676002)(70206006)(478600001)(8936002)(82310400002)(316002)(356005)(52536014)(36906005)(33440700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94409a22-a7fc-4176-4f89-08d7f6525e62
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jULyd7MRhvp/jBEeloLBIz78z/3O1zppOOY9ChyFrGDfoLBm3esoGEtoJS4Vg5v1WrmveVZJBqh4zzcbmeoSjMRndCdFrGzatXguZbGAGzKW7fa8oPK7lBIc5imuyTaDwo9lvy7n6aEsNuQ46JA0ViVHcmRfzXUGTBtcGKziHKGl8JbX/LWFxvGfgy5ysSI0SonEkaKwDBSlhY8W0A9gt5d5J2/BecsPWsLGUSW7wL4ZB+8UcRq+U4lAX3h+BDOHVmPkYgxBM8S2OhVaQVBRKm61pU1lh467F+m/sfJLFi9YFudgDtIZqyv72Lt/O76OTML24Q1wgdAoL8uYtw+A7lEVP69+fHf3WuzXfQHvYjOhl3A2C4ViXu+zpPNsvfXgNowRPKeMu+xYGGI4l2gc9HlERzRgCFx2JWLjeyQSI+vOI6TSgLpqtBrsDWm4Oh7JgVqIyBjNJwyNO/BQbwAtlxwvtOweR6TVVo8vPQOWiTcjfopyYxQRYvmFA9mlc38lnUjEJ3kODomtH6Ht6eoZIDTePgrKJB071bfZswL7pX29baDjmKcBFXWuvKNyQ6V1JRqKJXxofnYaR5+UWfcBpA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 08:56:42.5894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21e8314-c56b-4c94-a49f-08d7f652644b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2007
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 12 May 2020 01:31
> To: Jon Mason <Jon.Mason@arm.com>
> Cc: meta-arm@lists.yoctoproject.org; nd <nd@arm.com>
> Subject: Re: [meta-arm] [PATCH] Add recipes for TF-A versions 2.2 and 2.3
>=20
> On Mon, May 11, 2020 at 08:20:50PM -0400, Jon Mason wrote:
> > Add basic recipes for TF-A versions 2.2 and 2.3.  Also, rearrange
> > fields in the various TF-A recipes to make them uniform and move the
> > do_compile_prepend to the inc file.
> >
> > Change-Id: I85e4ac7bdc44ed85449e40fd2c94d73bf3e7d9e8
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta-arm-bsp/conf/machine/juno.conf           |  1 +
> >  .../trusted-firmware-a/trusted-firmware-a.inc | 13 ++++++-
> >  .../trusted-firmware-a_2.1.bb                 | 20 ++--------
> >  .../trusted-firmware-a_2.2.bb                 | 38 +++++++++++++++++++
> >  .../trusted-firmware-a_2.3.bb                 | 38 +++++++++++++++++++
> >  .../trusted-firmware-a_git.bb                 | 29 ++++++--------
>=20
> Any point in keeping git, 2.1, 2.2 and 2.3 around? Can we simplify it int=
o one
> version?
>=20

In the current status, the juno machine still uses the 2.1 version.

>=20
> >  6 files changed, 103 insertions(+), 36 deletions(-)
> >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-
> firmware-a_2.2.bb
> >  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-
> firmware-a_2.3.bb
> >
> > diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-
> bsp/conf/machine/juno.conf
> > index 878b6b1..898a863 100644
> > --- a/meta-arm-bsp/conf/machine/juno.conf
> > +++ b/meta-arm-bsp/conf/machine/juno.conf
> > @@ -20,6 +20,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
> >  # Use kernel provided by linaro (Contains support for SCMi or HDMI)
> >  PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
> >  PREFERRED_VERSION_linux-linaro-arm ?=3D "4.19%"
> > +PREFERRED_VERSION_trusted-firmware-a ?=3D "2.1%"
> >
> >  EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot firmware-
> image-juno"
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > index 93ca199..50a97a7 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> > @@ -81,8 +81,19 @@ DEPENDS +=3D " ${@bb.utils.contains('TFA_UBOOT', '1'=
,
> 'u-boot', '', d)}"
> >  do_compile[depends] +=3D " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-
> boot:do_deploy', '', d)}"
> >  EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_UBOOT', '1', '
> BL33=3D${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
> >
> > -
> > +# The following hack is needed to fit properly in yocto build environm=
ent
> > +# TFA is forcing the host compiler and its flags in the Makefile using=
 :=3D
> > +# assignment for GCC and CFLAGS.
> > +# To properly use the native toolchain of yocto and the right librarie=
s we
> need
> > +# to pass the proper flags to gcc. This is achieved here by creating a=
 gcc
> > +# script to force passing to gcc the right CFLAGS and LDFLAGS
> >  do_compile() {
> > +    # Create an host gcc build parser to ensure the proper include pat=
h is
> used
> > +    mkdir -p bin
> > +    echo "#!/usr/bin/env bash" > bin/gcc
> > +    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS}
> \$@" >> bin/gcc
> > +    chmod a+x bin/gcc
> > +    export PATH=3D"$PWD/bin:$PATH"
> >      oe_runmake ${TFA_BUILD_TARGET}
> >  }
> >
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.1.bb
> > index e8933fb..4d41202 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.1.bb
> > @@ -1,6 +1,9 @@
> >  #
> >  # Trusted firmware-A 2.1
> >  #
> > +
> > +require trusted-firmware-a.inc
> > +
> >  SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-
> a.git;protocol=3Dhttps;name=3Dtfa"
> >
> >  # Use TF-A for version
> > @@ -33,20 +36,3 @@ LIC_FILES_CHKSUM_MBEDTLS +=3D " \
> >
> >  SRC_URI[mbedtls.md5sum] =3D "37cdec398ae9ebdd4640df74af893c95"
> >  SRC_URI[mbedtls.sha256sum] =3D
> "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4
> "
> > -
> > -require trusted-firmware-a.inc
> > -
> > -# The following hack is needed to fit properly in yocto build environm=
ent
> > -# TFA is forcing the host compiler and its flags in the Makefile using=
 :=3D
> > -# assignment for GCC and CFLAGS.
> > -# To properly use the native toolchain of yocto and the right librarie=
s we
> need
> > -# to pass the proper flags to gcc. This is achieved here by creating a=
 gcc
> > -# script to force passing to gcc the right CFLAGS and LDFLAGS
> > -do_compile_prepend() {
> > -    #Create an host gcc build parser to ensure the proper include path=
 is
> used
> > -    mkdir -p bin
> > -    echo "#!/usr/bin/env bash" > bin/gcc
> > -    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS}
> \$@" >> bin/gcc
> > -    chmod a+x bin/gcc
> > -    export PATH=3D"$PWD/bin:$PATH"
> > -}
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.2.bb
> > new file mode 100644
> > index 0000000..4d5316e
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.2.bb
> > @@ -0,0 +1,38 @@
> > +#
> > +# Trusted firmware-A 2.2
> > +#
> > +
> > +require trusted-firmware-a.inc
> > +
> > +SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-
> a.git;protocol=3Dhttps;name=3Dtfa"
> > +
> > +# Use TF-A for version
> > +SRCREV_FORMAT =3D "tfa"
> > +
> > +# TF-A v2.2
> > +SRCREV_tfa =3D "7192b956bde11652a835eee0724dca0e403fee90"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://docs/license.rst;md5=3D189505435dbcdcc8caa63c46fe93fa89"
> > +
> > +SRC_URI[tfa.md5sum] =3D "75c8f4958fb493d9bd7a8e5a9636ec18"
> > +SRC_URI[tfa.sha256sum] =3D
> "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
> > +
> > +#
> > +# mbed TLS source
> > +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> > +#
> > +
> > +SRC_URI_MBEDTLS =3D
> "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protocol=3Dhttps;des=
t
> suffix=3Dgit/mbedtls"
> > +
> > +# mbed TLS v2.16.2
> > +SRCREV_mbedtls =3D "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
> > +
> > +LIC_FILES_CHKSUM_MBEDTLS +=3D " \
> > +    file://mbedtls/apache-
> 2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> > +    file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
> > +    "
> > +
> > +SRC_URI[mbedtls.md5sum] =3D "37cdec398ae9ebdd4640df74af893c95"
> > +SRC_URI[mbedtls.sha256sum] =3D
> "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4
> "
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.3.bb
> > new file mode 100644
> > index 0000000..bfda87b
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_2.3.bb
> > @@ -0,0 +1,38 @@
> > +#
> > +# Trusted firmware-A 2.3
> > +#
> > +
> > +require trusted-firmware-a.inc
> > +
> > +SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-
> a.git;protocol=3Dhttps;name=3Dtfa"
> > +
> > +# Use TF-A for version
> > +SRCREV_FORMAT =3D "tfa"
> > +
> > +# TF-A v2.3
> > +SRCREV_tfa =3D "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://docs/license.rst;md5=3D189505435dbcdcc8caa63c46fe93fa89"
> > +
> > +SRC_URI[tfa.md5sum] =3D "75c8f4958fb493d9bd7a8e5a9636ec18"
> > +SRC_URI[tfa.sha256sum] =3D
> "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
> > +
> > +#
> > +# mbed TLS source
> > +# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> > +#
> > +
> > +SRC_URI_MBEDTLS =3D
> "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protocol=3Dhttps;des=
t
> suffix=3Dgit/mbedtls"
> > +
> > +# mbed TLS v2.18.1
> > +SRCREV_mbedtls =3D "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
> > +
> > +LIC_FILES_CHKSUM_MBEDTLS +=3D " \
> > +    file://mbedtls/apache-
> 2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57 \
> > +    file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
> > +    "
> > +
> > +SRC_URI[mbedtls.md5sum] =3D "37cdec398ae9ebdd4640df74af893c95"
> > +SRC_URI[mbedtls.sha256sum] =3D
> "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4
> "
> > diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_git.bb
> > index 4bf3ae5..c443ecd 100644
> > --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
> > +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-
> a_git.bb
> > @@ -9,30 +9,23 @@ DEFAULT_PREFERENCE =3D "-1"
> >  require trusted-firmware-a.inc
> >
> >  SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-
> a.git;protocol=3Dhttps;name=3Dtfa"
> > +
> > +# Use TF-A for version
> >  SRCREV_FORMAT =3D "tfa"
> > -LIC_FILES_CHKSUM ?=3D
> "file://docs/license.rst;md5=3D189505435dbcdcc8caa63c46fe93fa89"
> >
> > +S =3D "${WORKDIR}/git"
> > +
> > +LIC_FILES_CHKSUM =3D
> "file://docs/license.rst;md5=3D189505435dbcdcc8caa63c46fe93fa89"
> > +
> > +#
> >  # mbed TLS source
> >  # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
> > +#
> > +
> >  SRC_URI_MBEDTLS =3D
> "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protocol=3Dhttps;des=
t
> suffix=3Dgit/mbedtls"
> > -LIC_FILES_CHKSUM_MBEDTLS ?=3D " \
> > +
> > +LIC_FILES_CHKSUM_MBEDTLS +=3D " \
> >      file://mbedtls/apache-2.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57
> \
> >      file://mbedtls/LICENSE;md5=3D302d50a6369f5f22efdb674db908167a \
> >      "
> >
> > -S =3D "${WORKDIR}/git"
> > -
> > -# The following hack is needed to fit properly in yocto build environm=
ent
> > -# TFA is forcing the host compiler and its flags in the Makefile using=
 :=3D
> > -# assignment for GCC and CFLAGS.
> > -# To properly use the native toolchain of yocto and the right librarie=
s we
> need
> > -# to pass the proper flags to gcc. This is achieved here by creating a=
 gcc
> > -# script to force passing to gcc the right CFLAGS and LDFLAGS
> > -do_compile_prepend() {
> > -    # Create an host gcc build parser to ensure the proper include pat=
h is
> used
> > -    mkdir -p bin
> > -    echo "#!/usr/bin/env bash" > bin/gcc
> > -    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS}
> \$@" >> bin/gcc
> > -    chmod a+x bin/gcc
> > -    export PATH=3D"$PWD/bin:$PATH"
> > -}
> > --
> > 2.17.1
> >
>=20
> >

