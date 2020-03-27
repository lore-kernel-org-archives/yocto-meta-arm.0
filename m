Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.45])
 by mx.groups.io with SMTP id smtpd.web12.14183.1585322587239186598
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YfPx9Zpi;
 spf=pass (domain: arm.com, ip: 40.107.1.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6KfMSUhIFiSn+l76S8KDZFFQqEGJUATP/m+TGHgBQQ=;
 b=YfPx9Zpi1zUzBbEGOdWQ0YNkWMA8jbvj0vIpNaB3JsZxGENgq4rJgYaIzXRibcUswF7LyzCY9ddIRtdefyrhNUbV5lnLD7bvcLASdcMmDpFZ/n0dwNv0YwaCLynOHctDCkLJR6iE02Sdxw1gQb0ujwNexihKoRXssTj878HPYPA=
Received: from AM4PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:205::43) by
 VI1PR0802MB2432.eurprd08.prod.outlook.com (2603:10a6:800:bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 27 Mar
 2020 15:23:04 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:0:cafe::70) by AM4PR05CA0030.outlook.office365.com
 (2603:10a6:205::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:23:04 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:23:04 +0000
Received: ("Tessian outbound d6b3ed9fc62a:v48"); Fri, 27 Mar 2020 15:23:04 +0000
X-CR-MTA-TID: 64aa7808
Received: from f695ceeb28de.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 58D77B93-78BB-475B-9C1C-004913FF639C.1;
	Fri, 27 Mar 2020 15:22:59 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f695ceeb28de.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/jNbtQ/vDBYyEL9RBpj0eEjxA+YPuSA7VdP8hE4po4n1TDqJc2L0Ftl0E1DWI8H8RLG1Xp3uGhYA29vH4OB8K2oZ4/bFWpdLbkAoD/nakZef/yQompJUljVlIGsHbHFFpOQE4Xff7KAJT7SWrglHgsHtyKwlF1sTEUBsSWYoS7jU391OhyC5kiumEe6vnECUn13nto7OXYI9TzfXmPEP8ql/bcv6Ghlcr/HZ461LKC5Kl27w/b8rLH2ZANOJSskQVAXN1v/hV+O8UkAVBPBFixyQqBW8B/0f8YrT2BCcByLD7vLR9u6FS05hUEJcA3woBjhXykZTm7xqvX4STLfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6KfMSUhIFiSn+l76S8KDZFFQqEGJUATP/m+TGHgBQQ=;
 b=k5G0MsbdjMa7VHPlP4wm/RdfINCWS74ue3ZaoJGSDV0kvujgjgRdToaWL9rYNWvifwDoP0HprSe6EY+ikJhdub2/YcK8qy/sCI5KyiZT6PZ8QfDdXNcxQWoY4rKJMUlzNQc0e1xqMKDkY97ciD5zL6hYF49Ni8SqiNmXYCAxyn8qsV2XNPC33Z4EDlgrVgs0f72wLNAMQEygOCExVSxB3kQoHlu2kGfFGoB5znwxnHYdvQNqa6yDCsJII7pGHvQHzYYMBqFeMPhpBziQ74zj5R4XtErdrzl0R6LoFcM6hdtsCG46QxgheRV/Yjk2GIB/MtGmahN9mrmbt8c65glXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6KfMSUhIFiSn+l76S8KDZFFQqEGJUATP/m+TGHgBQQ=;
 b=YfPx9Zpi1zUzBbEGOdWQ0YNkWMA8jbvj0vIpNaB3JsZxGENgq4rJgYaIzXRibcUswF7LyzCY9ddIRtdefyrhNUbV5lnLD7bvcLASdcMmDpFZ/n0dwNv0YwaCLynOHctDCkLJR6iE02Sdxw1gQb0ujwNexihKoRXssTj878HPYPA=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 15:22:58 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:22:58 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 5/7] arm-autonomy: Create arm64-autonomy-guest machine
Thread-Topic: [meta-arm] [PATCH 5/7] arm-autonomy: Create arm64-autonomy-guest
 machine
Thread-Index: AQHWBCWeZBVD8o+wh0GEO9YDGwMSkahcjsng
Date: Fri, 27 Mar 2020 15:22:58 +0000
Message-ID: 
 <AM0PR08MB39871499A1E86BFC3F3CD1A592CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
 <20200327105010.400-6-bertrand.marquis@arm.com>
In-Reply-To: <20200327105010.400-6-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 114cad31-8544-4b1e-8656-ddb673c7a490.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61091194-8bc4-488a-5df6-08d7d262be86
x-ms-traffictypediagnostic: AM0PR08MB3650:|VI1PR0802MB2432:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2432F6660A162F306081F32B92CC0@VI1PR0802MB2432.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(6916009)(478600001)(55236004)(6506007)(53546011)(81166006)(186003)(55016002)(86362001)(8936002)(5660300002)(7696005)(26005)(81156014)(76116006)(33656002)(66476007)(66556008)(52536014)(66946007)(64756008)(8676002)(71200400001)(4326008)(316002)(2906002)(66446008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vDgdmcEbJbguGANIaG0JDXMGJzZIDnm1Ng5qO14Q23SZORbbBwPxY9yp+0PVljjKZfx2nQkks0R4BNDoKEDSTozIKzzkIdYSQRGnwtc6NE1ZDzSKVeNczwInwQ74yOZgQHF7YFf1PUxnMW+8RO5aAH9dtNdEnGDwyT+LSdOeTHdfJWAqALG4ASqlaTGbrq0hlQ7xLpV4ZK2BeuHOpYHl9bV1m3rjcme9ZJVXH82/y3kCgVK/BW/18Vv0GvlaXcdrGZrQNqFX02LeIagl3SjGpojkJgfmVhOj2XKuuH8FgFQe54iHCUdbCPNHNEweJ/6e5dqvpDr0XLomWdf4A7HohD5mIZswteLWAZV49j0JxoCPDrd7ceA4i4fFx5Tku/OaPGvEnE3YSpUbQTAzjM8LS/eTYdpiNVZmseBsh/h7PfiDo7BrJcPFv9jZ/Y1uxYQAMICZpStRuiEXISumSZL09SEEvKnWWUk0Kne/ElyUnwq5YBjbUSP11FNws902oq/QLyfbnbN9+PYMzXf6Or2BV7Jm9BnoBWyYTWE7zO3zzZgmeHFdIXEW40EfB8h9NPVjNbTJK15uZtzXavTQBskyuPNgctY3bQC/Hh2agWPuPX/BFHxaATwSdktgLf7zwy88LS8XwPvxfSW5cHtkiQtxFw==
x-ms-exchange-antispam-messagedata: 
 npAKv8PLh2c486TeqUZ0JFLqnj1gZ5h2UdEnpdZVfWuPCFuw1piRjJaFQ4EnpHRZzeb2RQYtk9EOjJ+7M5QmK5FhHfbr2ro9XxI0DlGrZQMg8OK9TO5Y01ShL6JcRMQ9vUtvqQIeIBhs9LrZltk3Hw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966005)(47076004)(36906005)(81166006)(33656002)(8676002)(81156014)(52536014)(9686003)(55016002)(336012)(316002)(8936002)(186003)(4326008)(478600001)(26826003)(6916009)(2906002)(82740400003)(356004)(70586007)(86362001)(6506007)(53546011)(5660300002)(70206006)(26005)(7696005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1a668ca0-d6f6-4821-44fb-08d7d262baf6
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ti4zjboP6c6XyrcIrLSjEKRBqvpXswNAlTRqNze5cuf7cWkl2Q9jVpwO2H3SHzpPGYr4VY+x+FXppMnW/9cWuFDafArWRy1Ef8VHVoOLkB9JtGyltBT0YlA+jpehRj7TTwMbStafoY17YkjcwC8WEe84xbMF7yfAArZ+B70h6mBSboGUQtYG7khBZqYsx/MqHmRn+33Js/SNrn6fIfI/k632e/c03cVGEq1picWD3zw3yovo2KaKrHeKS+OFq7lzyQfpcB8Pj6LRHY2OomXU62Fop6+TazLh4xFApewf8F+ElzOuGzP7CcFLQyl5i3f3x3BxjeFNgWkhz66C8Lf3jtp5/nRTmvVW/4+9vSZLnRlOZgKGPSZG1efWkdWg2cQuTLcNa4/lvO78+Q04XnBgHfIVr2hZWvUKfOYVvTfUFA84gKwJXkXvi2DbJquPhXpVI0BvJNk9f7kMx/pM3wCFMx4ZpHFaYE042wBX5K+0SZH9LuSoJFZST9Q3/qgCjsVbym+aH6TQI5EfkveMj6qIUmjn49UEBNfeL+M1yQgieQsoZyV5sSG6zA3TTTwaW/orfR3gaIh+J7itM7+gyv/UBGYYjgskOSEcpAbu4LrociYg0KRj3ycQ4k0InieK2qd5JcWc/OKUqm7O4nKOWJ+eGcpqSJt0h9iQKY+MxhwKA7l0uaNqZDKt8OXukX9BZ3yqjjyTMZYo794tiG3sozi3fQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:23:04.0688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61091194-8bc4-488a-5df6-08d7d262be86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2432
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:50
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 5/7] arm-autonomy: Create arm64-autonomy-
> guest machine
>=20
> Create a minimalistic BSP to be used as an arm-autonomy-guest on ARM64.
> The BSP is enabling ARM64 and SMP in the kernel configuration and is
> enabling the arm-autonomy-guest in DISTRO_FEATURES.
> Rework README.md file.
>=20
> Change-Id: I7ef0176a3426748c4b66cdec5801aa34229187ba
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                     |  5 +++++
>  .../conf/machine/arm64-autonomy-guest.conf      | 17 +++++++++++++++++
>  .../arm64-autonomy-guest-standard.scc           |  5 +++++
>  .../bsp/arm-autonomy/arm64-autonomy-guest.cfg   |  2 ++
>  .../bsp/arm-autonomy/arm64-autonomy-guest.scc   |  6 ++++++
>  .../recipes-kernel/linux/linux-arm-autonomy.inc |  5 +++++
>  6 files changed, 40 insertions(+)
>  create mode 100644 meta-arm-autonomy/conf/machine/arm64-autonomy-
> guest.conf
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-
> autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-
> autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
>  create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-
> autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index e5ad6ed..ed9d6c9 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -42,6 +42,11 @@ BSPs
>  ----
>  This layer is adding the following machines:
>=20
> +* arm64-autonomy-guest: this machines creates a minimal BSP suitable to
> +be used
> +  as an autonomy guest. It is in fact only activating ARM64
> +architecture and
> +  SMP in the linux kernel and is enabling the DISTRO_FEATURE
> +  arm-autonomy-guest.
> +
>  Images
>  ------
>  This layer is adding the following images:
> diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
> b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
> new file mode 100644
> index 0000000..cb72c60
> --- /dev/null
> +++ b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
> @@ -0,0 +1,17 @@
> +#@TYPE: Machine
> +#@NAME: Autonomy Guest ARM64 machine
> +#@DESCRIPTION: Machine configuration for ARM64 Autonomy Guest
> +
> +TUNE_FEATURES =3D "aarch64"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +KERNEL_IMAGETYPE =3D "Image"
> +
> +IMAGE_FSTYPES +=3D "tar.bz2"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
> +PREFERRED_VERSION_linux-yocto ?=3D "4.19%"
> +
> +DISTRO_FEATURES +=3D "arm-autonomy-guest"
> +
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc b/meta-arm-
> autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-
> autonomy/arm64-autonomy-guest-standard.scc
> new file mode 100644
> index 0000000..7c75d99
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/bsp/arm-
> +++ autonomy/arm64-autonomy-guest-standard.scc
> @@ -0,0 +1,5 @@
> +define KMACHINE arm64-autonomy-guest
> +define KTYPE standard
> +define KARCH arm64
> +
> +include arm64-autonomy-guest.scc
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg b/meta-arm-
> autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-
> autonomy/arm64-autonomy-guest.cfg
> new file mode 100644
> index 0000000..fcdad98
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/bsp/arm-
> +++ autonomy/arm64-autonomy-guest.cfg
> @@ -0,0 +1,2 @@
> +CONFIG_ARM64=3Dy
> +CONFIG_SMP=3Dy
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc b/meta-arm-
> autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-
> autonomy/arm64-autonomy-guest.scc
> new file mode 100644
> index 0000000..e887b4e
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-
> kmeta/bsp/arm-
> +++ autonomy/arm64-autonomy-guest.scc
> @@ -0,0 +1,6 @@
> +include ktypes/standard/standard.scc
> +include features/input/input.scc
> +include features/net/net.scc
> +include cfg/timer/no_hz.scc
> +
> +kconf hardware arm64-autonomy-guest.cfg
> diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.in=
c
> b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> index b2245a5..8191079 100644
> --- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> +++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
> @@ -14,3 +14,8 @@ KERNEL_FEATURES +=3D
> "${@bb.utils.contains('DISTRO_FEATURES', \  # Add xen guest drivers to ke=
rnel
> if arm-autonomy-guest is activated  KERNEL_FEATURES +=3D
> "${@bb.utils.contains('DISTRO_FEATURES', \
>          'arm-autonomy-guest', 'features/arm-autonomy/xen-guest.scc', '',=
 d)}"
> +
> +# Add support for arm64-autonomy-guest machine
> +COMPATIBLE_MACHINE_arm64-autonomy-guest =3D "arm64-autonomy-guest"
> +KMACHINE_arm64-autonomy-guest =3D "arm64-autonomy-guest"
> +
> --
> 2.17.1

