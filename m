Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web11.7944.1589443039179156476
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 00:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Wgmw43RU;
 spf=pass (domain: arm.com, ip: 40.107.22.77, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uoipht5PSsMUlWkm6O5NbyCHjA+lIi4D3VfbypqNkE=;
 b=Wgmw43RU0WaKy3mrK8tZYeTJYsY4lJrZOq6+YmO5GDNVUJnBdKFxrLZRhjRJBJL/y/01Umo4JDrzTELtaCIdSReuD+hJgEPAw4e3qLnK+uyYct2Cpc25rwD70+qZUQ9E0mbrjKLSzrrHMMuY6AtSLdMklxmiqaFFHZjGxvUTRXo=
Received: from AM7PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:20b:130::40)
 by DB6PR0802MB2455.eurprd08.prod.outlook.com (2603:10a6:4:a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Thu, 14 May
 2020 07:57:16 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::49) by AM7PR03CA0030.outlook.office365.com
 (2603:10a6:20b:130::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Thu, 14 May 2020 07:57:16 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Thu, 14 May 2020 07:57:15 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Thu, 14 May 2020 07:57:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d609bd7b1928c5b7
X-CR-MTA-TID: 64aa7808
Received: from 753b01fd9a95.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3B777B80-18A8-4FBA-BBC0-64F4A495D393.1;
	Thu, 14 May 2020 07:57:10 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 753b01fd9a95.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 May 2020 07:57:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxt0TZBVfkzE7o4Nmcc8JidWRZmCONpPk28RLxpzuUy89D0bD8QTwiYlovDZYDhyg4L3C9U/QXGTtXQGlZjxqWyPTv+0BzlGwup/VePQG0eMQhGEwRKcJ4RHRjfwOnMVik79+fyLGj0PiU4eBu0rNMTXILPbwopgEjxooaj5Bh4vf3F/VBUl77PCfp+984jG0j/EIHf+osd06wceyRa0qMl6PJ9OSo3Ce6VVjfTjW2HARezGzSo8QQhUmioy4f+Gf8dd0j1QGcwHoyKxzdZ+O/h8aM5IqxOAuY0dxYQfDFIgfvaYrf3sfDP7zY2JeRBPNY9ZSzuJgYm1x55PRg5qsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uoipht5PSsMUlWkm6O5NbyCHjA+lIi4D3VfbypqNkE=;
 b=a2aO/uQvxg9gslPXkzLJyo40vgZAFTFmhlECSRIK+KmbHTQjMZmH0mQtZkwhjXYBZ8nAel7pbJIL4tWfvZtTwXsSenHjxYYpAS59ZIhLpcM26wkZJWHDw3T2/VQ/QhnJjZA2HDBGXbNYi68McUWXAPiZAo8IkhH3IVlfHHjzB9FglhS5i1sHyrX+GwHigSjNWhCkjDPeP8lsqBSa9DdhO01Mkrw4VqQ5HRy/eZwo/vxtiuIbi2LKPjOEaRHcpge6cucQOLwftwtEn1L80GcSNUPbqLjT7wj5b4nc2eFQws3l0U+S+PWo172Hj5U4DQMKOko129W4h0f4EcuxDCT8WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uoipht5PSsMUlWkm6O5NbyCHjA+lIi4D3VfbypqNkE=;
 b=Wgmw43RU0WaKy3mrK8tZYeTJYsY4lJrZOq6+YmO5GDNVUJnBdKFxrLZRhjRJBJL/y/01Umo4JDrzTELtaCIdSReuD+hJgEPAw4e3qLnK+uyYct2Cpc25rwD70+qZUQ9E0mbrjKLSzrrHMMuY6AtSLdMklxmiqaFFHZjGxvUTRXo=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB4138.eurprd08.prod.outlook.com (2603:10a6:10:a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Thu, 14 May
 2020 07:57:08 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4%6]) with mapi id 15.20.3000.022; Thu, 14 May 2020
 07:57:08 +0000
From: khasim.mohammed@arm.com
To: Jon Mason <jdmason@kudzu.us>, "sumit.garg@linaro.org"
	<sumit.garg@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Thread-Topic: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add
 recipe
Thread-Index: AQHWKZpZhtZUb4xZakaKPLPJUSRU5KinBvEAgAAvGj4=
Date: Thu, 14 May 2020 07:57:07 +0000
Message-ID: 
 <DB8PR08MB4969B9107EA587468CEBD944FABC0@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: 
 <20200514024932.19962-1-jdmason@kudzu.us>,<CAFA6WYNWT3pAPSFEsUietGvfNiDx1qBsD2jpqXYZW=ioYFrsZA@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYNWT3pAPSFEsUietGvfNiDx1qBsD2jpqXYZW=ioYFrsZA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 614ecea4-70dd-4929-3e81-08d7f7dc6b3c
x-ms-traffictypediagnostic: DB8PR08MB4138:|DB6PR0802MB2455:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2455A973CA6B1A8B8C184C95FABC0@DB6PR0802MB2455.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:9508;
x-forefront-prvs: 040359335D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 D/jg3Oq7anrZccie+nYV+8MjKiwmR8vy1kbDSh3ydDa1xAVZuVJwJnmuDZqDVhqIKiV7ZBnd+HDKfTp7cWhLDqrZ+LSbDIVzBTBkdjtqtIxnLk9siEKLKrsA0ZStiyrfh8nVplg0UMoXTIsFn1HIVMr5R56GBuiWVX5RMsGesReLbhMw8J9yBgz+LoHkxxQE/CRRiAvkGEOreuiXgcKLj/s/OfCdHfOElVhzYSHam4ErRQLYlyVrBqwZnbv/IfiUAOj/dt63rNINgFExprasYS9emHx7qpcr/GASed22h+ZJkgx44pHwVQQwWnM2qBVnh15l/r7p+EkpPGaCAnzCVdlphiT2SflvqhXQjnqcgHb5ajqiHgRYdCxc+z84LQ0bKcc07hzMSYHy/JL16hIvouy8kIH/LUzVa1Ul/Ze9dFpchHXnQcCbSgJyEVs4bKWZi1pfOxiy9QuN6W3s8UQa4s3iZzlnNYQBFms7Jcr2lg+PT0j5HLPK6qCiMlO1BZFXWK6h444SdxsJCtHlZKIQMA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(9686003)(66556008)(19627405001)(66946007)(4326008)(8936002)(55016002)(66446008)(52536014)(33656002)(5660300002)(66476007)(64756008)(478600001)(166002)(76116006)(71200400001)(54906003)(6506007)(110136005)(26005)(8676002)(7696005)(316002)(86362001)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 ii3dttUWXdkiOYLcPV2ji29vOd5G6L2yEJwii/MesXVsSuyXrGk7i/fmUQtuqoQUtgTrZ8kAHwaht0kakFHTsta2bMyfMinzuWuPp7HPbXXbXyCwLKVrrvR5jUmYe2/NZxD4J+ckS6JY8LNCzISW9/hsxNM1woeD340yMqVh5yGhOfcIa71cOayyr2zRR+5WB2PL+noPNo4xLnMAJYEv/LS/e633+kaR3hpI0y1CXIPJO6OVzBc35rpYdz0w1jimF5anBht+NQo5MCPoNZmxuV57u7dAbIDx/wiZkum7rc288wA5J4DE7YHP4994aGHvOAM1JXNcyKDYFuWteGK3vr6YIIlhpANmuvJ+VaN51WPU3TyJSU+iVBsK96Xgmf3boRDEJ827f/xDTYUeZi3PTRk80IV5lwyM6yo3KONSfIidaNQBShyNEsJ6yKrOQ6TRluJPLOqEVUOZ3sRjv5lqAbQoxzd6iIszOYpZB6Tx/xHxDMEeZbzeeEq6S2Ijs9a1
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4138
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966005)(81166007)(82740400003)(186003)(166002)(19627405001)(8676002)(55016002)(70206006)(70586007)(2906002)(52536014)(107886003)(47076004)(86362001)(7696005)(33656002)(478600001)(316002)(4326008)(336012)(82310400002)(356005)(6506007)(9686003)(5660300002)(26005)(36906005)(8936002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	64119573-854d-4e44-b31e-08d7f7dc6674
X-Forefront-PRVS: 040359335D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rA9zpn11YlqqODcT/LRKsLCOv3l37h4D22cHntTbebrB/D6TAkhxawwyqqjALu9pwivbJnTEve9GRSKmsuwzWaKz/WGMT70ZB7H+MfbL1JnCQccM1Jb5CGGQKfzVe7GvgNtmwn64+0HRwOEztYFe564RHi7RqDL7X3IJylE+EnbI7dD3WdzRY1iHXS77fXD5h5g90V2zHK8TG9qUtKIy3fDmqCWH4VKiwSpY9GQmo+EtdwstfRe7Hrc5fqe5oOpPlp4MMWufVgWMWKZLu9UuP70TYyIdenpEkzh1C2QeruCiOjlcdPOpI0p6Z2IZ1OrsJsU7A0TXV57m7imLw1S/NsLSm6zP9vdy/YocQHSjDHOwdX0d0rXha3nmmbfRJXgP7PdCwI8LOF4OO9W0aP/qFakbp9X0sSZxSCy76OPbKuvueQaB05DZHEpVvi2QS3z3aKPrjIFlwBxOvqfps+6Fz/UWZqHI9jsdTf3t64wZyX2RBNyO0gabDdsXy2O8vMj+Lfj7xCWmtNd0BNOwWMcOVFqktatRTtsJw/N/K8T0rPy6TxwHXT18kpM1q1QtoaFouK7BbL9VVsbDdMcsgi62oQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2020 07:57:15.9341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 614ecea4-70dd-4929-3e81-08d7f7dc6b3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2455
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB8PR08MB4969B9107EA587468CEBD944FABC0DB8PR08MB4969eurp_"

--_000_DB8PR08MB4969B9107EA587468CEBD944FABC0DB8PR08MB4969eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Sumit / all

<replying inline>
________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Sumit Garg via lists.yoctoproject.org <sumit.garg=3Dlinaro.org@li=
sts.yoctoproject.org>
Sent: Thursday, May 14, 2020 10:33 AM
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Josh=
ua Watt <JPEWhacker@gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Ad=
d recipe

Hi Jon,

On Thu, 14 May 2020 at 08:19, Jon Mason <jdmason@kudzu.us> wrote:
>
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-=
eabi-native_9-2019-q4-major.bb
>
> diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-na=
tive_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-n=
one-eabi-native_9-2019-q4-major.bb

> This recipe seems to install the pre-built (external) GCC tool-set for
> Cortex-R and Cortex-M. So I would suggest you to import it under
> "meta-arm-toolchain/recipes-devtools/external-arm-toolchain/"
> directory rather than "meta-arm-toolchain/recipes-devtools/gcc/"
> directory as it is meant for recipes used to build ARM GCC tool-set
> from source.

Isn't the external folder importing meta-linaro which is again building fro=
m source ? Please correct me if I am wrong here.

So, should we introduce another folder to differentiate the bb recipes that=
 are pulling prebuilt toolchains released by ARM ?

arm-embedded-gcc-arm-none-eabi  < include bb recipes to fetch ARM prebuilt =
toolchains>
external-arm-toolchain   <include recipes for toolchains built by third par=
ties>
gcc <include recipes for building toolchain from source >

-Sumit

Regards,
Khasim



> new file mode 100644
> index 0000000..a0c832d
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi-native_9-=
2019-q4-major.bb
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidaries
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "Baremetal GCC for ARM-R and ARM-M processors"
> +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM =3D "file://share/doc/gcc-arm-none-eabi/license.txt;md5=
=3Dc18349634b740b7b95f2c2159af888f5"
> +
> +PROVIDES =3D "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-=
2019q4/RC2.1/${BPN}-${PV}-x86_64-linux.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] =3D "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b2527=
1e83ec4ff41d177a"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +inherit native
> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +do_install() {
> +    install -d ${D}${datadir}/arm-none-eabi/
> +    cp -r ${S}/. ${D}${datadir}/arm-none-eabi/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/arm-none-eabi/bin/arm-none-eabi-*; do
> +        lnr $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +INSANE_SKIP_${PN} =3D "already-stripped"
> +
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> --
> 2.20.1
>
>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DB8PR08MB4969B9107EA587468CEBD944FABC0DB8PR08MB4969eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Sumit / all<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&lt;replying inline&gt;<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> meta-arm@lists.yoct=
oproject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Sumit Gar=
g via lists.yoctoproject.org &lt;sumit.garg=3Dlinaro.org@lists.yoctoproject=
.org&gt;<br>
<b>Sent:</b> Thursday, May 14, 2020 10:33 AM<br>
<b>To:</b> Jon Mason &lt;jdmason@kudzu.us&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Joshua Watt &lt;JPEWhacker@gmail.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-nat=
ive: Add recipe</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Hi Jon,<br>
<br>
On Thu, 14 May 2020 at 08:19, Jon Mason &lt;jdmason@kudzu.us&gt; wrote:<br>
&gt;<br>
&gt; Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R<=
br>
&gt; and Cortex-M processors from ARM. This toolchain is required to build<=
br>
&gt; Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compil=
e<br>
&gt; some firmware for the M0 coprocessor.<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;JPEWhacker@gmail.com&gt;<br>
&gt; Signed-off-by: Jon Mason &lt;jdmason@kudzu.us&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...cc-arm-none-eabi-native_9-2019-q4-major.bb | 37 &#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;<br>
&gt;&nbsp; 1 file changed, 37 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 meta-arm-toolchain/recipes-devtools/gcc/gcc-a=
rm-none-eabi-native_9-2019-q4-major.bb<br>
&gt;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none-eabi=
-native_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/gcc/gcc-ar=
m-none-eabi-native_9-2019-q4-major.bb<br>
<br>
&gt; This recipe seems to install the pre-built (external) GCC tool-set for=
<br>
&gt; Cortex-R and Cortex-M. So I would suggest you to import it under<br>
&gt; &quot;meta-arm-toolchain/recipes-devtools/external-arm-toolchain/&quot=
;<br>
&gt; directory rather than &quot;meta-arm-toolchain/recipes-devtools/gcc/&q=
uot;<br>
&gt; directory as it is meant for recipes used to build ARM GCC tool-set<br=
>
&gt; from source.<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Isn't the external folder importing meta-linaro wh=
ich is again building from source ? Please correct me if I am wrong here.</=
div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><font size=3D"2"><span style=3D"font-size:11pt">So=
, should we introduce another folder to differentiate the bb recipes that a=
re pulling prebuilt toolchains released by ARM ?
<br>
</span></font></div>
<div class=3D"PlainText"><font size=3D"2"><span style=3D"font-size:11pt"><b=
r>
</span></font></div>
<div class=3D"PlainText"><font size=3D"2"><span style=3D"font-size:11pt"></=
span></font>arm-embedded-gcc-arm-none-eabi&nbsp; &lt; include bb recipes to=
 fetch ARM prebuilt toolchains&gt;<br>
</div>
<div class=3D"PlainText">external-arm-toolchain&nbsp;&nbsp; &lt;include rec=
ipes for toolchains built by third parties&gt;<br>
</div>
<div class=3D"PlainText">gcc &lt;include recipes for building toolchain fro=
m source &gt;<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">-Sumit<br>
</div>
<div class=3D"PlainText"><font size=3D"2"><span style=3D"font-size:11pt">
<div><br>
</div>
<div>Regards,</div>
<div>Khasim<br>
</div>
<div><br>
</div>
</span></font><br>
</div>
<div class=3D"PlainText"><br>
&gt; new file mode 100644<br>
&gt; index 0000000..a0c832d<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-none=
-eabi-native_9-2019-q4-major.bb<br>
&gt; @@ -0,0 &#43;1,37 @@<br>
&gt; &#43;# Copyright (C) 2019 Garmin Ltd. or its subsidaries<br>
&gt; &#43;# Released under the MIT license (see COPYING.MIT for the terms)<=
br>
&gt; &#43;<br>
&gt; &#43;DESCRIPTION =3D &quot;Baremetal GCC for ARM-R and ARM-M processor=
s&quot;<br>
&gt; &#43;LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<br=
>
&gt; &#43;<br>
&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://share/doc/gcc-arm-no=
ne-eabi/license.txt;md5=3Dc18349634b740b7b95f2c2159af888f5">file://share/do=
c/gcc-arm-none-eabi/license.txt;md5=3Dc18349634b740b7b95f2c2159af888f5</a>&=
quot;<br>
&gt; &#43;<br>
&gt; &#43;PROVIDES =3D &quot;virtual/arm-none-eabi-gcc&quot;<br>
&gt; &#43;<br>
&gt; &#43;SRC_URI =3D &quot;<a href=3D"https://developer.arm.com/-/media/Fi=
les/downloads/gnu-rm/9-2019q4/RC2.1/${BPN}-${PV}-x86_64-linux.tar.bz2">http=
s://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/RC2.1/${BPN}-=
${PV}-x86_64-linux.tar.bz2</a>&quot;<br>
&gt; &#43;<br>
&gt; &#43;SRC_URI[md5sum] =3D &quot;fe0029de4f4ec43cf7008944e34ff8cc&quot;<=
br>
&gt; &#43;SRC_URI[sha256sum] =3D &quot;bcd840f839d5bf49279638e9f67890b2ef3a=
7c9c7a9b25271e83ec4ff41d177a&quot;<br>
&gt; &#43;<br>
&gt; &#43;S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
&gt; &#43;<br>
&gt; &#43;inherit native<br>
&gt; &#43;<br>
&gt; &#43;COMPATIBLE_HOST =3D &quot;x86_64.*-linux&quot;<br>
&gt; &#43;<br>
&gt; &#43;do_install() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/arm-none-eabi/<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; cp -r ${S}/. ${D}${datadir}/arm-none-eabi/<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${bindir}<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; # Symlink all executables into bindir<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; for f in ${D}${datadir}/arm-none-eabi/bin/arm-=
none-eabi-*; do<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lnr $f ${D}${bindir}/$=
(basename $f)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; done<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt; &#43;INSANE_SKIP_${PN} =3D &quot;already-stripped&quot;<br>
&gt; &#43;<br>
&gt; &#43;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt; &#43;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt; &#43;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt; <br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB8PR08MB4969B9107EA587468CEBD944FABC0DB8PR08MB4969eurp_--
