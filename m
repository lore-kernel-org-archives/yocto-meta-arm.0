Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.73])
 by mx.groups.io with SMTP id smtpd.web10.23409.1589726634399661865
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 17 May 2020 07:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JypElXhi;
 spf=pass (domain: arm.com, ip: 40.107.0.73, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRJvww5OaSMWJHYbdi27g7LmaN3g9VwFHIkcmg+1hZk=;
 b=JypElXhiRE4rjHVxHIEQQ5IOxKe87Yv+KFZPiqKYdvi8nCUKBtKFLVtM78tRJy2aJ1hz0+NR/PA4i6vfJyVtKA1AzCjphWzpSUfngCQK3/g+ir1YH1KLAV7t8TlIg54ZGCjPx/dvP1+xaxFUsS9PGnidiuqfVwWaGj5e22Q+uxY=
Received: from DB6PR0301CA0029.eurprd03.prod.outlook.com (2603:10a6:4:3e::39)
 by AM4PR08MB2643.eurprd08.prod.outlook.com (2603:10a6:205:5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Sun, 17 May
 2020 14:43:51 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::9c) by DB6PR0301CA0029.outlook.office365.com
 (2603:10a6:4:3e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Sun, 17 May 2020 14:43:51 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Sun, 17 May 2020 14:43:51 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Sun, 17 May 2020 14:43:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25bd4b0e080b5947
X-CR-MTA-TID: 64aa7808
Received: from e790054260df.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4D23C70F-0E32-45A3-A329-08C906EBF4F5.1;
	Sun, 17 May 2020 14:43:45 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e790054260df.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Sun, 17 May 2020 14:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgbiU5P0yAiElkIgLmFggT6006DtghhGre337IVWHw8xYYAWthKD6Rc+T3eWTYmlpwBkhTdOh1VVKYu1VLSW69tAO2cCRpvGil1IwH2N8e96WlSiLIgtkiu+1/ys4az0svzCz1wGxQddOGXt/k6c9IYg01C05nugerzXE2PDj6j7Z7g0ra7mActwgFrrbhqd0QyDh0Jv0pokY+qPioYjncmWjdBBf6qoU0iXTAOXZ4uJOUXsBjjvKLOu9Iq4+TfrWW848WeuveWP4M9WiypclPBFEB5HJE36hO+a+L4bZRJ5bKPX9b1owVOL2PPf6QuXqOjf/KpbGGzAyw77K93k5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRJvww5OaSMWJHYbdi27g7LmaN3g9VwFHIkcmg+1hZk=;
 b=iNZSSRxKdWTwQrWHgN13QlQziRPprpDqg7uh8deTM/VEyWPc0I0bWw1aDzgyE2cQaalp/BfqSJNfNUf9mjhMtPFab1Tb1i0BJ17GBrNIqTTrWM2kw812QEVe2Lir4aKxXTm39O4jMzrsA3C966LuBd+JXzdLDHsvEDLjYdrh8u1pTDMLXluzxDpD5th8hziFKIZr4AZjTjLn8LdKhOW8oJ8MrNoh338ZCWfQ+FhSheSEObYlq5QDu095qGqDaVY0a0AAc8MXP0M/VBon+A98f0df94ffrM1ZQg+Ix2qljWrWQnQu7NUutksl7gU5FS7x7tRxQlEAAhDYb1P1yuv2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRJvww5OaSMWJHYbdi27g7LmaN3g9VwFHIkcmg+1hZk=;
 b=JypElXhiRE4rjHVxHIEQQ5IOxKe87Yv+KFZPiqKYdvi8nCUKBtKFLVtM78tRJy2aJ1hz0+NR/PA4i6vfJyVtKA1AzCjphWzpSUfngCQK3/g+ir1YH1KLAV7t8TlIg54ZGCjPx/dvP1+xaxFUsS9PGnidiuqfVwWaGj5e22Q+uxY=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5017.eurprd08.prod.outlook.com (2603:10a6:10:ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Sun, 17 May
 2020 14:43:44 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::2406:7bd5:fa7f:e8f4%6]) with mapi id 15.20.3000.022; Sun, 17 May 2020
 14:43:44 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Diego
 Sueiro <Diego.Sueiro@arm.com>, Khasim Mohammed <Khasim.Mohammed@arm.com>
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
Thread-Topic: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native:
 Add recipe
Thread-Index: AQHWKllIxvRkKSlB/EOF6JHb5qSa1aioxFEAgAN0OK6AACU1bQ==
Date: Sun, 17 May 2020 14:43:44 +0000
Message-ID: 
 <DB8PR08MB496999D8C3226CA0370A8124FABB0@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: 
 <1589506580-40706-1-git-send-email-denis@denix.org>,<23216.1589528602075061452@lists.yoctoproject.org>,<160FD0B211B491C0.9570@lists.yoctoproject.org>
In-Reply-To: <160FD0B211B491C0.9570@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: baaf2804-683a-4542-69bf-08d7fa70b722
x-ms-traffictypediagnostic: DB8PR08MB5017:|AM4PR08MB2643:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB26430F7ED584B176B222F3D8FABB0@AM4PR08MB2643.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 040655413E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zaAlqTieuXLCWYJFu/MAyapcxioVoscp++Xn/MNWBw05SeAqZJcJYN83RmuCF0TOrbbE6HY/34gccQvzM+1rNyA6dHVXAo5Wwn0CKKomn1VWs9Q+4HMEuuEEP4pMOqxWaFhHtP2SlaRCKYQJLSCGW5EKpvjKYQQzUIfnpksOeQvCm+n+WARb7ugTblgR55xRZryRSZoc35Anv+ZfNnNJQgSQbsF6Yi3+N1zQujo35xAuGnH9sTE8bTU4FPew2jhyV/WpzTlTJZRPEHs1eSSKh3hRfRpWnyB7yaMCeqIFqiJNNw4gyWcPilhhJ1lHn/PQ5E9N+8DxH4rjfUWjv2w4cBTJX4GL8uDjDDgkCCPHHVEKbdSDvJaDFfcG3Kfmc5G5F8ao2iPOGSXbUJS/CkaSVkjxzuzk/pFTH36szHtY7TOD+A+v4YTdwFOst37mXC6fB7bK1BG3PT2SJKN4OgmZIWxZDjIdNeLibyvFUP8HxxuCllwymagaofieTTPtErFQTas3bedO6wJN1fwAGhd5ED+StW2nIMK6isHbAS+z/bI87+aG8LkpsvWs1s3WLYTYfD7IAv6dxnk07triUjPjMexKfwdHCpeW8GI/sA6RX89iw37NQ0ZoHS0vkEL8VRlA
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(366004)(396003)(39850400004)(376002)(52536014)(6506007)(55016002)(71200400001)(53546011)(8936002)(316002)(7696005)(9686003)(186003)(2906002)(33656002)(5660300002)(66946007)(66476007)(66556008)(64756008)(66446008)(478600001)(110136005)(76116006)(26005)(86362001)(8676002)(586874002)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mQNTFyRD3TfKsh2Gd98ney+riAyytn3f5/TsFf1WZon6svrj2j0LvlgJ1NltUBgaosxZIOjj9b/E5aXzBAn8VzyexwSgyOSqWspghzuaX1rHMZPnmIVVQJbLWXpx1xXviSHdAwBuHSN4yIugxTbAvOD93BtfyFi8XuVPKqhjHe0b6HBuH7NtPVpmJV7h7oxVxBfqnaIpxzcY3Ap+WLoLeUvVrEAtDfuUFb6KQmrIAFVI7jIn8SvqR2elWOTEsShesU+j0E2IrN6sBXyw8O1b6fhsPV/jDJDkGv6fARYDfPXjqW3kT31y6SoxMV3WRJbqGhGym4xPQ2wxo92QSzsFyCxoa+JV9CLmukcOLWSPX/s+bz1C1ZVvn0Ut7u0aKTz+iwmjy/p7PWESsl5EEr9nnu3LoM7fTAFZDBT4prcyCo6I7Pc4VWbXOBB2Htg6ob1jjy43IfM0KWTVrTXKvZ/5KoEGjD0H1toWi7OmJrHzcIYBIX04isBkUCBCIsT7mdJO
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5017
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(46966005)(478600001)(2906002)(70586007)(53546011)(6506007)(52536014)(316002)(70206006)(336012)(26005)(110136005)(186003)(55016002)(9686003)(7696005)(47076004)(8676002)(33656002)(8936002)(82740400003)(86362001)(5660300002)(81166007)(82310400002)(356005)(586874002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	199e612b-4d79-4759-f975-08d7fa70b319
X-Forefront-PRVS: 040655413E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iSFD71EifhXdhTPl0LuG0vSUx2COC5+ZCzQu3eLz56J7PCyaw14BF8ImtOjTRu9e6Xt+PBJPcOhMvi/vEi6OXliXSWRXa8nVzQrSjgO6meGGmf1aqjzknCJ1gqQKyKWihrGC+vWmcJLdZIRwSFDS9xYgvITO9M2+Zr7lvDeUO4h7eoJeUZPiAIyC+kvdvEsAigEb5/iCzN3NDaW0LPs3WvOhjstWGRgucCp/L1NTjp9Wzf41w2QKd5JuUVzNo4E0yzDAxOP0sx/5KqA4KZpYSAxCQZnPEsPbxuztt7iidvHReYFNp0nPfTwmuH50NhIYYli07p/eZu9ZQD6HhoZ2va1UHIAcvABp0xA4kVBcKV6wU5pg2CXDRSLEQDsWPv0yyAHjFoT3u9QGEm9qUg7zviZnOFjcL+pjbXIPUA9Yb4fpcKiF1tq0Q8TZpQSALMYwJVJHHzmjc3SjE9E/CwnvEEU20qRkeWvhkgoaBE6aWj/AOyjPLWYpAqw8dIaboPuZu7ZMOxcm/wYCQ8HQFOcve/gOS3SeJsfZh3Z0nPqtXkwP7rZfJOcQW4CLIqWde00sPLEIkugqPDdmJ1O6+7vhTMgvBRxcFNrCgxMWoSzkO7++wyLAaMuKsAO6AtjsQbbVwxzJN3RHqh/ZyiNX9XKa2S64lDO6aVSQ+yBa+E/mfMA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2020 14:43:51.1911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baaf2804-683a-4542-69bf-08d7fa70b722
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2643
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Khasim Mohammed via lists.yoctoproject.org <khasim.mohammed=3Darm=
.com@lists.yoctoproject.org>
Sent: Sunday, May 17, 2020 6:00 PM
To: meta-arm@lists.yoctoproject.org; Diego Sueiro
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native:=
 Add recipe



________________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Diego Sueiro via lists.yoctoproject.org <diego.sueiro=3Darm.com@l=
ists.yoctoproject.org>
Sent: Friday, May 15, 2020 1:13 PM
To: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v3] arm-toolchain: gcc-arm-none-eabi-native:=
 Add recipe

On Fri, May 15, 2020 at 02:36 AM, Denys Dmytriyenko wrote:

>
> From: Jon Mason <jdmason@kudzu.us>
>
> Adds a recipe to pull down the prebuilt GCC for compiling on Cortex-R
> and Cortex-M processors from ARM. This toolchain is required to build
> Arm Trusted Firmware for the Rockchip rk3399 SoC, since it must compile
> some firmware for the M0 coprocessor.
>
> This was originally taken from meta-rockchip, but has been modified from
> mailing list feedback.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> I observe one issue when building for n1sdp,
> gcc-arm-none-eabi PROVIDES virtual/arm-none-eabi-gcc but was skipped: inc=
ompatible with host aarch64-poky-linux (not in COMPATIBLE_HOST)

Actually I found two issue
1) gcc-arm-none-eabi PROVIDES virtual/arm-none-eabi-gcc but was skipped: in=
compatible with host aarch64-poky-linux (not in COMPATIBLE_HOST)
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +

changed to : "x86_64.*|aarch64.*" to build.

2) ERROR: gcc-arm-none-eabi-9-2019-q4-major-r0 do_package_qa: QA run found =
fatal errors. Please consider fixing them.
added below line to fix :

inherit native

Regards,
Khasim
> ---
> v3 changes:
> * rename recipe to not contain -native in the name
> * fix typo in "subsidiaries" word
> * use SUMMARY instead of DESCRIPTION
> * remove inherit native
> * add FILES_${PN} for nativesdk package
> * add extra INSANE_SKIP_${PN} due to prebuilt binary package
>
>  .../gcc-arm-none-eabi_9-2019-q4-major.bb           | 39
> ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644
> meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-e=
abi_9-2019-q4-major.bb
>
> diff --git
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none=
-eabi_9-2019-q4-major.bb
> new file mode 100644
> index 0000000..84f6dba
> --- /dev/null
> +++
> b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none=
-eabi_9-2019-q4-major.bb
> @@ -0,0 +1,39 @@
> +# Copyright (C) 2019 Garmin Ltd. or its subsidiaries
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
> +LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
> +
> +LIC_FILES_CHKSUM =3D
> "file://share/doc/gcc-arm-none-eabi/license.txt;md5=3Dc18349634b740b7b95f=
2c2159af888f5"
> +
> +PROVIDES =3D "virtual/arm-none-eabi-gcc"
> +
> +SRC_URI =3D
> "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/${BPN}=
-${PV}-x86_64-linux.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "fe0029de4f4ec43cf7008944e34ff8cc"
> +SRC_URI[sha256sum] =3D
> "bcd840f839d5bf49279638e9f67890b2ef3a7c9c7a9b25271e83ec4ff41d177a"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +

Can this be changed to : "x86_64.*|aarch64.*"

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
> +FILES_${PN} =3D "${datadir} ${bindir}"
> +
> +INSANE_SKIP_${PN} =3D "already-stripped libdir staticdev file-rdeps"
> +
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.7.4
>
>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
