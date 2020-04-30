Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.59])
 by mx.groups.io with SMTP id smtpd.web12.3219.1588235885429340918
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 01:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=I3ksqimF;
 spf=pass (domain: arm.com, ip: 40.107.4.59, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chH3v+A7T2ywvkR5gs43953BDyzU1k5Qi5xsrLvDYhE=;
 b=I3ksqimFe3kVBwppDGI4JMNhRdPCq0oap2ol+rI5cL+eEhthQOlHIff3aLIVnpotaJgMv/hSBJ8BOAvNMGp0++x6oz0T+zGpCQrzuqmH7MAtMiXCP8OJowVvGfFsZULyfDtVpKxgC24ooouNM3xtLDJkrnDOqT7Q+6QfEVw9O+U=
Received: from AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::27)
 by AM0PR08MB3811.eurprd08.prod.outlook.com (2603:10a6:208:107::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 08:38:03 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::6c) by AM6PR10CA0050.outlook.office365.com
 (2603:10a6:209:80::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 08:38:03 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 08:38:02 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Thu, 30 Apr 2020 08:38:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 009ad4e349302a61
X-CR-MTA-TID: 64aa7808
Received: from a28b3375f410.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 12DA779F-D7C0-42A6-9D68-BD83A8C69C0C.1;
	Thu, 30 Apr 2020 08:37:56 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a28b3375f410.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 08:37:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwaRFa4RY2l4w+SEAHNX6dWKBmZhdcxYk5sH/PTkf/J16POMF3tvPPIrrd7s8urnNRU2j94quQTSvfRr4YhK+YxI356MEjhRT9ygnhjeZocKraDNfdEShbdmpPMlHIN+8W3lhhuA2w2F1LAFP6HAiPGdTk1gRxK9z3q2ebKOGBLvzpK/TouvqGykunCwofC+a2UL8rGowwu52/g0lspGtX4I31HZryaTMiH2jVYoMtINix9CtANCkZ40jXB8xd+TTL+f2QU4JVixEwrCH4wVPNRvd7F8xnfrvXvrMT556eq3FNUdHEC2lHPmwJ7IwjpYfy48GmJJF7ikkGcvNIFZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chH3v+A7T2ywvkR5gs43953BDyzU1k5Qi5xsrLvDYhE=;
 b=f08QZYj8ZUUifLKcAlJ2uR28stCZ8Iy8f3HHpIUME2ykGObDTS8k9w+AB1T1R4/b8rAyR+FJEWGQR7+l9lXBjCSH9fs9IdvpoRWl5Sw2iloxhqNpJOthXZmdqFISCBjB+gbijhPFT6BMHWQ7cfs5FV+JOctPN2APsnHi1NQfm8/U4+Rosisj8pbeIpMfSATI+sDEtMGulmPvzb63N0FQ57Qjbwtuy3XSi76piQXIrPk2guHWOePWzLKcnQAQRdIkfgsKEOkcVGTU2IxVguqIVGdeHvW9GWeZS6o4m+MKQe44nqP/NZP2HuBdjNUrxUSFjfL402EhSUZKLPPMEVta+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chH3v+A7T2ywvkR5gs43953BDyzU1k5Qi5xsrLvDYhE=;
 b=I3ksqimFe3kVBwppDGI4JMNhRdPCq0oap2ol+rI5cL+eEhthQOlHIff3aLIVnpotaJgMv/hSBJ8BOAvNMGp0++x6oz0T+zGpCQrzuqmH7MAtMiXCP8OJowVvGfFsZULyfDtVpKxgC24ooouNM3xtLDJkrnDOqT7Q+6QfEVw9O+U=
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com (2603:10a6:803:ba::25)
 by VI1PR08MB3277.eurprd08.prod.outlook.com (2603:10a6:803:3f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 08:37:54 +0000
Received: from VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926]) by VI1PR08MB3693.eurprd08.prod.outlook.com
 ([fe80::c892:51a9:6c7f:3926%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 08:37:54 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to fvps and juno
Thread-Topic: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to
 fvps and juno
Thread-Index: AQHWHsfLyHQ2qIITzUSG5G9Fw4Y+PKiRV7gA
Date: Thu, 30 Apr 2020 08:37:54 +0000
Message-ID: <9798D650-48AA-4386-B0EE-DF3DA8606A29@arm.com>
References: <20200430081700.548-1-vineeth.raveendran@arm.com>
In-Reply-To: <20200430081700.548-1-vineeth.raveendran@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2fb5b8d4-0580-4eaf-4fb3-08d7ece1cbad
x-ms-traffictypediagnostic: VI1PR08MB3277:|AM0PR08MB3811:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3811EC6C499D754EAAEDFD579DAA0@AM0PR08MB3811.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1201;OLM:1201;
x-forefront-prvs: 0389EDA07F
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3693.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(5660300002)(8936002)(186003)(66446008)(64756008)(66556008)(66476007)(8676002)(316002)(2616005)(6512007)(53546011)(33656002)(2906002)(6506007)(4326008)(36756003)(6486002)(966005)(86362001)(71200400001)(66946007)(26005)(91956017)(76116006)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nv6BX0Rs4navOGZ0FKzYSLIYV9SvHlaJevzVFUV2BaZkSaAOF0VCdYGM0ISoCnj/W46kHWoFjHKoK4K8Bd4Z1urc2UX7lpIPYT6hEl4A2F240HCFQ4LFrxpQc7LpOrkGuHsigIcLDkeCKyL9Ad9rdPT9B+hG2hohF0iBcU4oINJaMTIFIlrbMvTFL95qLJpl84e8Sc0ZRCCLwDCL81BZ02f1amFgsXGmtCFHT7Pnih6XYDc0vMNYmHpGvtvpEH6jtYkCp/BKByO0K9efqAnw5vMVz1h93Pb2uOSvvTHFbyUIAjVyL6Jvr0v/6yQfDMgvwMCmS76CtcU5vqozBEEGDRPc2JxOVwKPbXGUCyIf1zATbB1jFCqF8G01Jw6If918HX4DKyGeem1ybAg5owM0iEzy68rcrumcFamQsVswUNOQCZovAJpTRcNzqXqF4K3EzOsqEPdcJ79QxcqvZC+gQPl2pSdnEZt1QM0Vb1cauB3XpKcZaMWC2NLPCp/gHJMuq5fdc3CZc/vykjcFKO4U/A==
x-ms-exchange-antispam-messagedata: 
 4yGuodZ39PaeRWlC6rU3O74hPNocLK42OLUJVc85dl8do252SK0ctIR9Ww6Nxoyfgf1jjQCbnWaSd9vVSfdt+lLN9HmxIl7lrrP25zIfDjmnXuESyhamxh589D+7zYFjB46P30iwFTKqnTO8f9Fu7TX4vSuarrkz/vbThlfdzIlsI+YFrQtw56EWG451Ccr2SB2Pl98I3GBFca8njZdNTnnJ/KW3n+6yldM8VkV2l5dv9dhH26BN9gEiqIHfQbxfBKMEi2BP9pKfD/WufEvcrOSctdZ284xu1vtGtDvDq5wr6ZSeqgGDFMqK+IidKYDS4dC21F2SLo0KqLXSZKHq9Jup6obwSY+RIpZRRi/2WwzHigumnnvMbUmgfNjFPwNV5YOH5Fc0M28SPx5N3x3s3m23LQ4a/chW+whMi4latXXkcLFZNWH65xhthQ9BUqfUqpXPkKdmI6fD2qjNKsrtzc7US+Lf/vkX+oWwUmyIiP6LDbQsoCjRh+RV38edZGYEmVmzGrDHlQqYDJTfhjEZXKTeJbVfhYwimnaxxB1yOhcAcETLBQO9QKOyRxbMCYcIxXW+RnkUF/fOlkDwTYp5P6VdOY9F6QtsZIn6a6Zi1Tnl5jJWlURSlivb6VkSvLRr5wexdYlUNygqAkEQaRCGPzRB9lW+MUTrCa9tUMgaIeiTQjHB1r5M7WcwsX3GpNKGDuxjaHqHCAZW36EPelVepyKCoe6UwESyVQLSIfC+YlGGMrjZBTcAU7DddvOHTJYcb6a8bIvG9BlHy2ekcqN9D3Q/ZJONfIzSCYB3GHSdksU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3277
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966005)(47076004)(2616005)(6486002)(316002)(186003)(36906005)(478600001)(966005)(33656002)(6512007)(4326008)(70586007)(356005)(82740400003)(81166007)(82310400002)(5660300002)(6506007)(86362001)(6916009)(336012)(26005)(70206006)(8676002)(2906002)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8e7dd883-4a08-4df3-5eaf-08d7ece1c712
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N8RB12mqAMKbGukwbtlLumf6Acm+fO5N7W8L/C4KT19GwnUEfBcFby3OtvIvCcNaj37O/gIzxVWzkvzpjzQaFXxD1n3I/EoP1N32ANoP4XQdKQBENnsEHlCEDNtUbUlnptUQHFosAvx+nTv50tKc5/HoxL993F5ko2V/+hENiPn0eOuzAJL5WI7kSgHe+2ZjKIBMJfxluv5X8Smxo4cBlZ7Mt1ewYAmdS2Bq0fUGkFaYdvVcbxT7j/y5FjneQEAUUvUmhokuqFzd/+Ct6S6KUBPpdnOayyY/JQsjuW1adNyX30h1nwxyi2imik7go3O4Lb0Gz1O8VhjnGPAuEaK9P4JMqDZ84eg1DZhu1RLzlVe49RMS5rDDgRYSTzmaSPlmUJqBFTO630w1GgvUSvp6H3l/EgAAmQqU21ltoJBfFEcvF+5teSZF8WV00NfDK/fUbTTlC3LvhOhoSeCdGrJmlX/CAHe4xY83CicFRQkN7RaCPKlTpoZORearcT+KPA8mFNozCUGEWXalZ0rU7uHq4rrDphxQVP5Tr3SwyF2XrDyreOjrdcO9zBpelXZZVrT1HpCi18l9hdQ6vnayOb22Xg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 08:38:02.4494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb5b8d4-0580-4eaf-4fb3-08d7ece1cbad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3811
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <606587B82321FA4FA958F5DC1F9CAF61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Apr 2020, at 09:17, Vineeth Raveendran via lists.yoctoproject.org =
<vineeth.raveendran=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Make following machines compatible with dunfell:
>    - foundation-armv8
>    - fvp-base
>    - juno
>=20
> Major changes include supporting kernel version 5.4 and U-BOOT version v=
2020
>=20
> Change-Id: Ia59ac874de4e4c4ea02c7a4f976e39a9b6996f75
> Issue-Id: SCM-833
> Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-bsp/conf/layer.conf                        |  3 +++
> meta-arm-bsp/conf/machine/fvp-common/fvp.inc        |  6 ++++--
> .../files/fvp-common/u-boot_vexpress_fvp.patch      | 13 +++++++++++++
> .../recipes-bsp/u-boot/u-boot_2020.%.bbappend       | 11 +++++++++++
> .../recipes-kernel/linux/linux-yocto_5.4.bbappend   |  3 +++
> 5 files changed, 34 insertions(+), 2 deletions(-)
> create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-bo=
ot_vexpress_fvp.patch
> create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappen=
d
> create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bba=
ppend
>=20
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 1a54ddc..5257195 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -11,3 +11,6 @@ BBFILE_PRIORITY_meta-arm-bsp =3D "6"
>=20
> LAYERDEPENDS_meta-arm-bsp =3D "core openembedded-layer meta-arm"
> LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus dunfell"
> +
> +# Place holder for yocto version compatibility
> +OVERRIDES_append =3D ":${LAYERSERIES_CORENAMES}"
> diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp=
/conf/machine/fvp-common/fvp.inc
> index 702a1d2..d1a59cc 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> @@ -35,9 +35,11 @@ DISK_IMG_PARTITION3_CONTENT =3D ""
> SERIAL_CONSOLES =3D "115200;ttyAMA0"
>=20
> PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> -PREFERRED_VERSION_linux-yocto ?=3D "4.19%"
> +PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
> +PREFERRED_VERSION_linux-yocto_zeus ?=3D "4.19%"
>=20
> EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
>=20
> # FVP u-boot configuration
> -UBOOT_MACHINE =3D "vexpress_aemv8a_dram_defconfig"
> +UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
> +UBOOT_MACHINE_zeus =3D "vexpress_aemv8a_dram_defconfig"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vex=
press_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_v=
express_fvp.patch
> new file mode 100644
> index 0000000..bdca202
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_f=
vp.patch
> @@ -0,0 +1,13 @@
> +diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_=
aemv8a_semi_defconfig
> +index c9cec8322c..3a339be6a2 100644
> +--- a/configs/vexpress_aemv8a_semi_defconfig
> ++++ b/configs/vexpress_aemv8a_semi_defconfig
> +@@ -9,7 +9,7 @@ CONFIG_IDENT_STRING=3D" vexpress_aemv8a"
> + CONFIG_DISTRO_DEFAULTS=3Dy
> + CONFIG_BOOTDELAY=3D1
> + CONFIG_USE_BOOTARGS=3Dy
> +-CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 debug=
 user_debug=3D31 loglevel=3D9"
> ++CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlyprintk=3Dpl011,0x1c090000 de=
bug user_debug=3D31 androidboot.hardware=3Dfvpbase root=3D/dev/vda2 rw root=
wait loglevel=3D9"
> + # CONFIG_USE_BOOTCOMMAND is not set
> + # CONFIG_DISPLAY_CPUINFO is not set
> + # CONFIG_DISPLAY_BOARDINFO is not set
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
> new file mode 100644
> index 0000000..d69943b
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
> @@ -0,0 +1,11 @@
> +# u-boot_2020 patch for fvp machinesboard
> +
> +#
> +# Patch u-boot to change kernel command line
> +#
> +
> +FILESEXTRAPATHS_prepend_fvp-base :=3D "${THISDIR}/files/fvp-common:"
> +FILESEXTRAPATHS_prepend_foundation-armv8 :=3D "${THISDIR}/files/fvp-com=
mon:"
> +
> +SRC_URI_append_fvp-base =3D " file://u-boot_vexpress_fvp.patch"
> +SRC_URI_append_foundation-armv8 =3D " file://u-boot_vexpress_fvp.patch"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend =
b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> new file mode 100644
> index 0000000..ed6fbc3
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> @@ -0,0 +1,3 @@
> +# Add support for Arm Platforms (boards or simulators)
> +
> +require linux-yocto-arm-platforms.inc
> --=20
> 2.17.1
>=20
>=20

