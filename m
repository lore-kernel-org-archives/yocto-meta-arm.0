Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web10.909.1589350936395661169
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 23:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BcEdRH3B;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5ydMC/5W+WR6tBEBvigztoqtL+6gwhq6uxofKOyRGQ=;
 b=BcEdRH3BYQlIiQK5Qyi4uvYX/0eCRlStL0jNzyqI9V4yhvJBiYRaALyffrlN39G05jdQxQuzT0HLPMS7XsyVL43R71lOBVIqEMwuc1ZLwwEMHLk8j05scyE0QFyeIy27QbI7XuGlyK/HfjP4025xojwpwMRt/tciDIuMuvQObpc=
Received: from AM5P194CA0022.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::32)
 by VI1PR08MB4238.eurprd08.prod.outlook.com (2603:10a6:803:f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 13 May
 2020 06:22:13 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::94) by AM5P194CA0022.outlook.office365.com
 (2603:10a6:203:8f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 06:22:13 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 06:22:12 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Wed, 13 May 2020 06:22:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from 806839cf2fc5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FFFC5F3F-60D4-473A-875C-B4CE3A0A604C.1;
	Wed, 13 May 2020 06:22:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 806839cf2fc5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 May 2020 06:22:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GopL7tMygchEhiIksr1FVSiA003HO8ZC1LVyGQGo+4CNW4TFtEswCMGWz2oTRyowPRX1nABbNbeHvj+tQKoN3+KYrfBFYj8BCoRp6Scge1x9Duega0Y8Ye3idpAXg6zw3djc7k+8cqDUG64hMH8UrpQtPhoK+glMsvTYcexpQopQAKA4CZHrjd4iZIK9NkS5syRc3Zwtb8nA1lrEsGJxCOtSEe5DisF50cQZ3FBes4nvA/2jXSCFEgUrKlleR8cdZI/kEnkatTTfYLTNsy32JsgmT2CMg6kqCr7HDTr19gNXJrVzOiSznqAA050v6RSyzzcrGG4Gj4Xwy54foOtZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5ydMC/5W+WR6tBEBvigztoqtL+6gwhq6uxofKOyRGQ=;
 b=JDw095hr8H7S52jgg/L6CE4kFJWP0pJgT3I+hI8rC/y72ppYY7mh/RzdxUDThIuuyd7OPAJ0egY7oqV2unanBCaUC9Dfz0YmvzmdB5FWT0C7hq/s0cWFDHfvA/AAo6nS/BUK7OQrU4itYj3blsc6IAy9txQDaywnDmT60Wo7x1NKzWU6wkOspeRLMx8eBq3eOfP+4BfAEt783QxF8YNbDpsSv5zP4Hf0G7NwHvAIAnH4cIppf7szYoLG3Eu5YmjSL4W/CmONJcClkjlRc/IKw5/bm8PiHeMUwMz0Y5qGmUrgy7Uk1qJTH9Xw5W3A1BME1fxAxYEc71llYp29C8rgnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5ydMC/5W+WR6tBEBvigztoqtL+6gwhq6uxofKOyRGQ=;
 b=BcEdRH3BYQlIiQK5Qyi4uvYX/0eCRlStL0jNzyqI9V4yhvJBiYRaALyffrlN39G05jdQxQuzT0HLPMS7XsyVL43R71lOBVIqEMwuc1ZLwwEMHLk8j05scyE0QFyeIy27QbI7XuGlyK/HfjP4025xojwpwMRt/tciDIuMuvQObpc=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0SPR01MB21.eurprd08.prod.outlook.com (2603:10a6:208:50::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Wed, 13 May
 2020 06:22:05 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.022; Wed, 13 May 2020
 06:22:05 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
Thread-Topic: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
Thread-Index: AQHWKKIXAqGgjJ8ARkGXKYiFmiBQ+qiljBJw
Date: Wed, 13 May 2020 06:22:05 +0000
Message-ID: 
 <AM0PR08MB39875A36D047820F57F17C6A92BF0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200512211219.19262-1-JPEWhacker@gmail.com>
 <20200512211219.19262-2-JPEWhacker@gmail.com>
In-Reply-To: <20200512211219.19262-2-JPEWhacker@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: ac414ced-8e31-4551-9600-2229af5b2412.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d607bc88-93ed-4ebb-7a6b-08d7f705f97b
x-ms-traffictypediagnostic: AM0SPR01MB21:|VI1PR08MB4238:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB42385CD7DD7A6E4439D080F892BF0@VI1PR08MB4238.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:9508;
x-forefront-prvs: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +onGA5HDgqXw4HImxef+Me/ZIFLpIdfEUdlaWgLIwDYY6YzGnVJ/BZ82q67Dlk/xjuMRuwqk+30IHzP331ioaeQgy3l3grRmsyWb8vzAG026K36exUU6Ajh2bfuc+YFmc+vdXt5v8HyqQ11h/PYjlWhyy3Wzy9MkEASOW9Nl+9dVNXtDl9UGJTZ5dl/gNR9BteZVEwLWOlCUM22NnAjPUr82eJnJV34ha7IUBaaOIK7gRNHo7z5ZXie5V5//55v1UqQvSVpxKZ/4IWTSFXhqXVpPXuW0xMJiK2Pke03YRb0oRLBQ0+48V3l76264VRIjvuJZ6geTBra2HBhDCpUTGRs7fbTNdEjmjZjEVL+EcbV7h2xAroFfBW1xkHXQLLzRAIDcpd6YOyjUg9Lx+dlcCMnN7IEZeN+NXbOKEudM2Yj8PFstq9qTgFMSU5UrtC5YIjIoOfsMczHBlUopzQAQ8TB9GRm1YP2jyrsmhxk8f5oMLgH+Ij+6+d3reiqCEp0q4y54lt7GXBZFhHes+Wg59A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(33430700001)(8936002)(8676002)(55016002)(6506007)(9686003)(316002)(110136005)(26005)(186003)(7696005)(86362001)(53546011)(33656002)(5660300002)(2906002)(66946007)(71200400001)(478600001)(66476007)(66556008)(33440700001)(76116006)(66446008)(52536014)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 /pqD3972G0za3rAcEOBGD73gMK2Y/WXuQvpsIEEX4V9rd8nPeo4vo6KyLcn/pB/LmC5BNUJqBKN3KAp6+YX1r9c+mUUggYYOe+YK2PoV85LaT6PofkJDmIUKJMATs7ln3NuzuiHq/d7qymC0XfZl8klz/lknZSTQyzv/aWTKqMXryUhpekgQuQME2z1kourXto8a522AoRBGSOXQMqHg4rxqexFqEzCeGbiNbALp4vs9hZqCgQiIeBRWyC2+C4cbynAFRMg2ib6OyaUmN6gtpZn/qpT4sMDKsVrDOt8htumDHCnZwV3PkFt4iAVJCYDrsgRZYWx6MHUu22is3F9N5KIw3g8ZNJaGasP7w8PDe5Et0wonTYPjqaNR8UkIeigiHnQdznwuaBH3v9zm/Ys5PcTaWNN1AfKxcgoXUmv4xakJsuj5prIUsc/ipqgZ6zbaK/qj16ZoXWIhyhbJczjMWst5hsEeVYTTsmthTHkftzU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0SPR01MB21
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(33430700001)(33656002)(8936002)(86362001)(478600001)(53546011)(70586007)(8676002)(70206006)(5660300002)(7696005)(9686003)(55016002)(52536014)(316002)(82310400002)(81166007)(186003)(33440700001)(82740400003)(2906002)(336012)(26005)(356005)(6506007)(47076004)(36906005)(110136005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	65c9888c-81e9-4cb3-e23a-08d7f705f51e
X-Forefront-PRVS: 0402872DA1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	08oHMxSX8powHhC/cuGIvofzoUTmkPuTDUhBmfPQBVqw6wlvTq0ANE72C/anfpEQSZI3Ko1fzliZpB9HaAMtdSHqec6sWuJ5nh8w94jfIa9NTnSTnM8uLUJyVe7+9QpcRsBr+eHDNDsZjjPdMOgHWPqf2euKg/AGVMe8IwIpB0jFuDZGEFgH9Si8SGt2o0qvAuRfGKfsWDE5IJcHPQhTsR3uWm0hJBk9Kn2hEXfOXS8HmKBre7L6jP47Z3n2OheKtzRBWuh953wHU8Jnj6yPQ7Uf/z0OIosYpUS+FUj3dTp1TsZ8Pu4LSyGmIld/SvUX9P9PHnsyKsXlBUm8b3s39ggrXJtIxKZhi9/OXdhEYHTONy/+o8WwGW87hHs3DXp0yyCVmUOpk0JtwVvePbupfiMsSt/E7J+eW7WBxPUX+i9l2loy17sl9TEGqg2N0JNCu/2aCB7i7oWPR+J4YdnR1ROZUm5wJlk/3Bd1pEpaF2pRcGtm/VpQwL39p2IIJ7ZKEmStc5HaqdWmf6qFn8ObV1JjCLYipmiKLIHxF4+4MZFmYmKhmQ9C8zLyVNiHQN+x/oyravQqHkBoSAqVioIrew==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 06:22:12.7651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d607bc88-93ed-4ebb-7a6b-08d7f705f97b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4238
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Joshua Watt via lists.yoctoproject.org
> Sent: 12 May 2020 22:12
> To: meta-arm@lists.yoctoproject.org
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Subject: [meta-arm][PATCH v2 1/2] trusted-firmware-a: Build out of tree
>
> Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates t=
he
> need to set the TFA_BUILD_DIR.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../trusted-firmware-a/trusted-firmware-a.inc | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index e6d48e4..5600568 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -15,12 +15,7 @@ TFA_PLATFORM ?=3D "invalid"
>  # Build for debug (set TFA_DEBUG to 1 to activate)  TFA_DEBUG ?=3D "0"
>
> -# Sub-directory in which to build.
> -# This must be coherent with BUILD_PLAT make parameter so that deploy
> can find -# the produced binaries -TFA_BUILD_DIR ?=3D "build-
> ${TFA_PLATFORM}"
> -# set BUILD_PLAT depending on configured BUILD_DIR -EXTRA_OEMAKE +=3D
> "BUILD_PLAT=3D${TFA_BUILD_DIR}"
> +B =3D "${WORKDIR}/build"
>
>  # mbed TLS support (set TFA_MBEDTLS to 1 to activate)  TFA_MBEDTLS ?=3D
> "0"
> @@ -68,7 +63,7 @@ do_configure[noexec] =3D "1"
>  DEPENDS_append =3D " dtc-native openssl-native"
>
>  # Add platform parameter
> -EXTRA_OEMAKE +=3D "PLAT=3D${TFA_PLATFORM}"
> +EXTRA_OEMAKE +=3D "BUILD_BASE=3D${B} PLAT=3D${TFA_PLATFORM}"
>
>  # Handle TFA_DEBUG parameter
>  EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_DEBUG', '1', '
> DEBUG=3D${TFA_DEBUG}', '', d)}"
> @@ -90,10 +85,16 @@ do_compile() {
>      sed -i '/^INCLUDE_PATHS/ s,$, \-
> I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
>      export
> LD_LIBRARY_PATH=3D${STAGING_DIR_NATIVE}${libdir}:$LD_LIBRARY_PATH
>
> -    oe_runmake ${TFA_BUILD_TARGET}
> +    (cd ${S} && oe_runmake ${TFA_BUILD_TARGET})

I'm just wondering, why you need to run this in a subshell?

>  }
>
>  do_install() {
> +    if ${@"true" if d.getVar('TFA_DEBUG') =3D=3D '1' else "false"}; then
> +        BUILD_PLAT=3D${B}/${TFA_PLATFORM}/debug/
> +    else
> +        BUILD_PLAT=3D${B}/${TFA_PLATFORM}/release/
> +    fi
> +
>      install -d -m 755 ${D}/firmware
>      for atfbin in ${TFA_INSTALL_TARGET}; do
>          if [ "$atfbin" =3D "all" ]; then
> @@ -102,21 +103,21 @@ do_install() {
>              bberror "Please specify valid targets in TFA_INSTALL_TARGET =
or"
>              bberror "rewrite or turn off do_install"
>              exit 1
> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin.bin ]; then
>              echo "Install $atfbin.bin"
> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
> +            install -m 0644 $BUILD_PLAT/$atfbin.bin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin.elf ]; then
>              echo "Install $atfbin.elf"
> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
> +            install -m 0644 $BUILD_PLAT/$atfbin.elf \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
> -        elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
> +        elif [ -f $BUILD_PLAT/$atfbin ]; then
>              echo "Install $atfbin"
> -            install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
> +            install -m 0644 $BUILD_PLAT/$atfbin \
>                  ${D}/firmware/$atfbin-${TFA_PLATFORM}
>          elif [ "$atfbin" =3D "dtbs" ]; then
>              echo "dtbs install, skipped"
> -        elif [ -f ${S}/tools/$atfbin/$atfbin ]; then
> +        elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
>              echo "Tools $atfbin install, skipped"
>          else
>              bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
> --
> 2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
