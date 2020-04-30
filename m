Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.40])
 by mx.groups.io with SMTP id smtpd.web11.3216.1588235260659172713
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 01:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0wYutc6+;
 spf=pass (domain: arm.com, ip: 40.107.5.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qECDLdbknNH1PN3m0+FHvrgI1Nl2XfTc+WVmZIJyRsg=;
 b=0wYutc6+MaaqcvBJGp0AsbqmLUTzZM/zHm6RPH9sQGoi+LTaU2LT/MtsgN1XmCW+AG1UNbw8NBGMq4ox4HctbPlCv/RFyExXqX87OS9Bi8jZEn2SUWE8mTXVj0gekMZqO2uYY49vWIgRe9ALZcPm/F+JduflzOizeGejlmSDVVk=
Received: from DB6PR0202CA0035.eurprd02.prod.outlook.com (2603:10a6:4:a5::21)
 by VI1PR08MB3357.eurprd08.prod.outlook.com (2603:10a6:803:45::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 08:27:38 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::e0) by DB6PR0202CA0035.outlook.office365.com
 (2603:10a6:4:a5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 08:27:38 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 08:27:37 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Thu, 30 Apr 2020 08:27:37 +0000
X-CR-MTA-TID: 64aa7808
Received: from f4a1a4c45022.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AD06D236-F96B-45B9-9CE6-F6CDF88E9FA9.1;
	Thu, 30 Apr 2020 08:27:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4a1a4c45022.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 08:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQFuDwAEHl++xl7dzoe2yFkp8HxVTfaij5H8acC3Qw6e15RxGgwgko5Zjl4bXc3O9OkutiVx6MU5FVnaTUb5xTuNW4ij5ZFxnujE/iHnkgaKohcq+X6wzA3aF36Zog5TVJ6L5modmpNy7tbcl4BphLnUi+2r8Yc26/2ol6nPx7rQAdiE6VsbPrnCFbwp4MRXjyexHkj9n4i0WfI7F4rYFA8UZ6BUMDPP0nj6nbkBCrdNMQlJ1oWi7IwtaQAFBgO2/XFyMBPq0CYl0/7IssuDKP0vuXxulOU9VdGG+2NXu8oUQdhdxQEZTbliokE2CA/cFd3/wYWldbQ2rSxaygOVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qECDLdbknNH1PN3m0+FHvrgI1Nl2XfTc+WVmZIJyRsg=;
 b=bO5HRiwtJrh1q8ZEIY2VvK6cPU2Ys6/r5FGPyQbeYjDQ+pbJI7e+JivjwvS8Os5QLhFo2kdj3AACBZaKVwyK4cT98PH4MzsGqImFWxtG9UzST/rFs5VTX88lbgU8d3yLlWCRxwIghZyB8ooW0ktdu3u1T0hjWYRy87CwkCabm+4hn/rlHzG5fHwtmgn/cs96P/bEoQ1SpVwB9VbRkTOABkeRIiQU8J9wzN9ih1ZwltxzmED7orsn7wzQu+j9bnrHBfPWmVMKevOGFHi0GPTd7guILpvFB8JBNAxqQ0cEMV09odNJN5AGK7Ve8JN49HtXAiJ/lLD1T5sNicTsvcd8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qECDLdbknNH1PN3m0+FHvrgI1Nl2XfTc+WVmZIJyRsg=;
 b=0wYutc6+MaaqcvBJGp0AsbqmLUTzZM/zHm6RPH9sQGoi+LTaU2LT/MtsgN1XmCW+AG1UNbw8NBGMq4ox4HctbPlCv/RFyExXqX87OS9Bi8jZEn2SUWE8mTXVj0gekMZqO2uYY49vWIgRe9ALZcPm/F+JduflzOizeGejlmSDVVk=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5540.eurprd08.prod.outlook.com (2603:10a6:208:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 08:27:31 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 08:27:30 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to fvps and juno
Thread-Topic: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to
 fvps and juno
Thread-Index: AQHWHsfLcAq6bPlvtEuJbsxdu5gNLqiRVK8A
Date: Thu, 30 Apr 2020 08:27:30 +0000
Message-ID: 
 <AM0PR08MB3987F59909EC00767325548992AA0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200430081700.548-1-vineeth.raveendran@arm.com>
In-Reply-To: <20200430081700.548-1-vineeth.raveendran@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 85bacd88-b252-4b0b-a820-5e9284212b16.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc478359-7790-4c13-630c-08d7ece0575d
x-ms-traffictypediagnostic: AM0PR08MB5540:|VI1PR08MB3357:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB335793853918C018053BBA7292AA0@VI1PR08MB3357.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:215;OLM:215;
x-forefront-prvs: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mVqnz8c0IcHRbnUghTUFjWJ5JFuCYJJ56DidS9E294HkxljUM0XyCjG4hvOQYkpLDKJb6HAmFslBDMMLyoiMIu0y/10AFOYG66ccR3uqGJFvCxBvXFEbQK/1fFmwfpbLPPLSBNo2AVs1OMnFkEtpSyOy3RFwy7cG9Oqyr0k/ApWajGGZPH8GqBxgjFCj0Nrgw1/k/FuuiL+vhgXJtQlxYhi3UhUQctewFLagcr7DzHOn7Lc4hrph0+tvj4/ExxRVPkkCewRs+ic8e6GL/IyRNx6knl+FpeBvWQgBmRhxLb2bJrHXXB+OFpnaNaB+l05E7RvFcFlzqAl3Z2kB+3w/tElfrTIW9WI0bRTAscTKmaKwOcoypD4QW9Y4Uw48PLStDOPO0CjA4g98oebuFtkj9Wf5hRWm8f80jG6Gz76OiUKHzG2x9CMr/h3U9kiZgXyE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(66476007)(186003)(6916009)(76116006)(5660300002)(8936002)(316002)(26005)(71200400001)(52536014)(53546011)(6506007)(8676002)(9686003)(66556008)(55016002)(7696005)(4326008)(33656002)(66946007)(2906002)(66446008)(86362001)(64756008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 epkUAp33CZjk/ZYCh9TpuyvN5wZz3Xqp4jVBwT5WVtkADWLKNhJh4VVSIrVsr4gSSJGWCsPmI35eTohREubtuCJ/Ihh8MZN1PjNX8Q+YPRY4yum2R2cezYsAW81xieSvOFA+kEbwUzccfLwW+rE7y32/+Y6stwvd19VjqCVe6Iaxs+rUwZ2p8zxFmkz/50vjrqmxFpmqDabiOgeSF8slGR3L9pjOTtz1JChyIoIfvwpNThAh0kIJw7nmtvWqcDanr0q6U77D0Wwja/PGZ7fIZjEIuPp9CwyLXp4YU1FQaPFao1znfyibilTMw6gy5QzgsszUmj/6yxKd2+pKQ2ILKGNkdvyzztgxEj0TfFvmTBl9MzaCjfcMBUh4VQxlfPXJSV7DzXdcvKDAp/zWRXMWUIPBxEotopFvHLX4cQ3RGIu0WxHpugYE6v5Lv3cAHeaBR0sYVscu9oxY/2rO37stT8iS1A/DPrYJTTcOjhHo5QATXx/OMJ9oD1Fqvq1M/gGPq/zSzTWqvmAkxGgFLec+90kNahd3g1/K4LYL8EJqGwQfOeVwBDBxNUJSiRvRafC/v0VDH5eaBKX6jidOzmSWS5EP0ZhCf8nPvEGZHIWExtQE/MKDf5J8u0yhDLCi7AD5m31WohPnCaUr6cslSPnEt9PCEN0hllIeSJgcoTO/vDuLasb7YaB5QiMRwrRGhpbo2ufFfUdsD0JobPNu0wVjkYDbC3esulQu9X9IyGqX5BkYdvNihaHbzUgIRAUd/6f7JX5NGX6aXNk9Ozo2PEqMY2EfKN5eJ8spEQIqFB1JFwg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5540
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(7696005)(8676002)(9686003)(8936002)(53546011)(6506007)(186003)(55016002)(33656002)(26005)(5660300002)(81166007)(82310400002)(6916009)(356005)(82740400003)(336012)(478600001)(2906002)(47076004)(316002)(70206006)(86362001)(52536014)(70586007)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b88c4dc9-9f46-4500-a399-08d7ece05340
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A4lfU7gpHz850t+QsXMOcPiE0b+eRIvEPK5QuPJzHSoeMpdTfcUNB6zuZwmJ8l1jHQs9AynCfWj/41i8saBQ5hGAk86YdWu3g8OSjqtABd6tRoh357tSts8Qt2t1QE7K5RoRiwNKGzqwporBycrJag4oIPs7Jrv37d1E8ASGGrGMKAOk0YeJkxyhbQGjczPzKnoao5wdeXEMXRP5R7wV1NKtm2ZQ0y4AL5yBjA5h1YDEt6L246+M5f5Jwbg5oWG600/GDYV8SCXCCFJKoHPtjkJfcmLnYCmvj2O7nsOcoxcoRaKccDMChdyJRFrR8o71dMqyNVj/g5OnY0GzohN3h/oOxPBr1rotmcWKt54rTg78O7LD0y0muU3+JvrOtCezGFhOGMVjiXR0C85LmFtAq0b56U8aLAG4mP/ub5ByIdT/Vvjp1w0iJpChq2DeXyTA+31oLtRGxkK39P3Zuq0plJhl4TOPNe04gFhL1rtXF5Rbz6CpfU7uYNYAzJJMpgEwSOzm/+VC/PULu/Lb1e73nQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 08:27:37.8721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc478359-7790-4c13-630c-08d7ece0575d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3357
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Vineeth Raveendran via lists.yoctoproject.org
> Sent: 30 April 2020 09:17
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH] meta-arm-bsp: add dunfell compatibility to fv=
ps
> and juno
>=20
> Make following machines compatible with dunfell:
>     - foundation-armv8
>     - fvp-base
>     - juno
>=20
> Major changes include supporting kernel version 5.4 and U-BOOT version
> v2020
>=20
> Change-Id: Ia59ac874de4e4c4ea02c7a4f976e39a9b6996f75
> Issue-Id: SCM-833
> Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-bsp/conf/layer.conf                        |  3 +++
>  meta-arm-bsp/conf/machine/fvp-common/fvp.inc        |  6 ++++--
>  .../files/fvp-common/u-boot_vexpress_fvp.patch      | 13 +++++++++++++
>  .../recipes-bsp/u-boot/u-boot_2020.%.bbappend       | 11 +++++++++++
>  .../recipes-kernel/linux/linux-yocto_5.4.bbappend   |  3 +++
>  5 files changed, 34 insertions(+), 2 deletions(-)  create mode 100644 me=
ta-
> arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-
> boot_2020.%.bbappend
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-
> yocto_5.4.bbappend
>=20
> diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
> index 1a54ddc..5257195 100644
> --- a/meta-arm-bsp/conf/layer.conf
> +++ b/meta-arm-bsp/conf/layer.conf
> @@ -11,3 +11,6 @@ BBFILE_PRIORITY_meta-arm-bsp =3D "6"
>=20
>  LAYERDEPENDS_meta-arm-bsp =3D "core openembedded-layer meta-arm"
>  LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus dunfell"
> +
> +# Place holder for yocto version compatibility OVERRIDES_append =3D
> +":${LAYERSERIES_CORENAMES}"
> diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-
> bsp/conf/machine/fvp-common/fvp.inc
> index 702a1d2..d1a59cc 100644
> --- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> +++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
> @@ -35,9 +35,11 @@ DISK_IMG_PARTITION3_CONTENT =3D ""
>  SERIAL_CONSOLES =3D "115200;ttyAMA0"
>=20
>  PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> -PREFERRED_VERSION_linux-yocto ?=3D "4.19%"
> +PREFERRED_VERSION_linux-yocto ?=3D "5.4%"
> +PREFERRED_VERSION_linux-yocto_zeus ?=3D "4.19%"
>=20
>  EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"
>=20
>  # FVP u-boot configuration
> -UBOOT_MACHINE =3D "vexpress_aemv8a_dram_defconfig"
> +UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
> +UBOOT_MACHINE_zeus =3D "vexpress_aemv8a_dram_defconfig"
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-
> boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-
> common/u-boot_vexpress_fvp.patch
> new file mode 100644
> index 0000000..bdca202
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-
> boot_vexpress_f
> +++ vp.patch
> @@ -0,0 +1,13 @@
> +diff --git a/configs/vexpress_aemv8a_semi_defconfig
> +b/configs/vexpress_aemv8a_semi_defconfig
> +index c9cec8322c..3a339be6a2 100644
> +--- a/configs/vexpress_aemv8a_semi_defconfig
> ++++ b/configs/vexpress_aemv8a_semi_defconfig
> +@@ -9,7 +9,7 @@ CONFIG_IDENT_STRING=3D" vexpress_aemv8a"
> + CONFIG_DISTRO_DEFAULTS=3Dy
> + CONFIG_BOOTDELAY=3D1
> + CONFIG_USE_BOOTARGS=3Dy
> +-CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 debug
> user_debug=3D31 loglevel=3D9"
> ++CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlyprintk=3Dpl011,0x1c090000
> debug user_debug=3D31 androidboot.hardware=3Dfvpbase root=3D/dev/vda2 rw
> rootwait loglevel=3D9"
> + # CONFIG_USE_BOOTCOMMAND is not set
> + # CONFIG_DISPLAY_CPUINFO is not set
> + # CONFIG_DISPLAY_BOARDINFO is not set
> diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
> b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
> new file mode 100644
> index 0000000..d69943b
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
> @@ -0,0 +1,11 @@
> +# u-boot_2020 patch for fvp machinesboard
> +
> +#
> +# Patch u-boot to change kernel command line #
> +
> +FILESEXTRAPATHS_prepend_fvp-base :=3D "${THISDIR}/files/fvp-common:"
> +FILESEXTRAPATHS_prepend_foundation-armv8 :=3D "${THISDIR}/files/fvp-
> common:"
> +
> +SRC_URI_append_fvp-base =3D " file://u-boot_vexpress_fvp.patch"
> +SRC_URI_append_foundation-armv8 =3D " file://u-boot_vexpress_fvp.patch"
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> new file mode 100644
> index 0000000..ed6fbc3
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
> @@ -0,0 +1,3 @@
> +# Add support for Arm Platforms (boards or simulators)
> +
> +require linux-yocto-arm-platforms.inc
> --
> 2.17.1

