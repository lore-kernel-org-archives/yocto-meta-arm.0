Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web10.349.1589386765827312281
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 May 2020 09:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=h/qDbP5h;
 spf=pass (domain: arm.com, ip: 40.107.8.79, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TlsoQR6r1ZQ9IlNRHve7z9YNb/9ZUkFUtVEBGLyx48=;
 b=h/qDbP5hjDsNcTBUG74RwvTYwpEWLxUsDuXlLfxigzPbnmZVZ/A3Os7E25vNVV/+BjrUaMg2CNts9lOeya3em6sZGAz8iB+fNFL7bqRY7iei5iNkzfKVf9XgVUNwUmkurv03DYkhY3g5nIMGJxJ4oUWJ9KRyzFT4x1zSWe7lTOA=
Received: from DB6PR1001CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::30)
 by VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Wed, 13 May
 2020 16:19:20 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::81) by DB6PR1001CA0044.outlook.office365.com
 (2603:10a6:4:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Wed, 13 May 2020 16:19:20 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 16:19:20 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Wed, 13 May 2020 16:19:20 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8b4c3118aca5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 58E71425-22EF-4779-98CB-DE1B69B3130A.1;
	Wed, 13 May 2020 16:19:15 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b4c3118aca5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 May 2020 16:19:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fho2Uht+uu/kcpTAQ/pzONn/30bvt+1iIJlT91P0lfrfwuucBoH7CL64+HsC+yeRmG353JgZDYW9spvE+Tl+Exig0+K6RgtibdRU6ZIF/V8xaSt+NmvaMX5ktoYvSH6p4eGKudKWH8354wj3Y4B8N4OSdB/KZQEDb/aBMpYg+sUu3FZyZM+hKR4cTHNbjSGNRJQJ7haUPT3qpjBJi2OpzVxZdtpvQIfT57xqcaSLmwXSmG2gX7BTCxHnFWHL7jLAkCJYNTBd2FTK/0lblWEblC4XEpgY6CgUvjBTt2Sw5xTVPfCxw+HX2SKItCCz4tnqJLBg3YVIMmLIIIiiWTYrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TlsoQR6r1ZQ9IlNRHve7z9YNb/9ZUkFUtVEBGLyx48=;
 b=LFgy3ewVTbxfc8t5c3+41hdrRSytDj7xrGefYZbvaiSxt0NaN5r2Y9D7JDwOC9GrVW2d0uBlQMEflzyuHP/VC1dYunpjXIh+lAAOetEKkXNs5yFUWZsPuTwSlVngYrTWbOi1VzcRPhbJhL3meIqHHJLzY44Y9H28SfWZ7JGhd4JadPaOWpL83zPT2ArY/4C6y+VLObRtKB3Dwxysd00p9PD0u39T5cHY/84/SF5RcoT5R0TpWkkahNEeQ4gRP4sLbPSiVRuCQDSI2fXyzl+GOxXWYIAmfxTGuxFiYC4H46xjm9giNLLeEMczIAHq+cTcZi5pClYbwUxIGbC0e6PtnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TlsoQR6r1ZQ9IlNRHve7z9YNb/9ZUkFUtVEBGLyx48=;
 b=h/qDbP5hjDsNcTBUG74RwvTYwpEWLxUsDuXlLfxigzPbnmZVZ/A3Os7E25vNVV/+BjrUaMg2CNts9lOeya3em6sZGAz8iB+fNFL7bqRY7iei5iNkzfKVf9XgVUNwUmkurv03DYkhY3g5nIMGJxJ4oUWJ9KRyzFT4x1zSWe7lTOA=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4945.eurprd08.prod.outlook.com (2603:10a6:208:157::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 13 May
 2020 16:19:13 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3000.022; Wed, 13 May 2020
 16:19:13 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>,
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm][PATCH v3 1/2] trusted-firmware-a: Build out of tree
Thread-Topic: [meta-arm][PATCH v3 1/2] trusted-firmware-a: Build out of tree
Thread-Index: AQHWKT3PPawkEoGG9Eevd0qXPmfVVKimMRmg
Date: Wed, 13 May 2020 16:19:12 +0000
Message-ID: 
 <AM0PR08MB3987CAD563A25F840CBDADBB92BF0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>
 <20200513154707.33747-1-JPEWhacker@gmail.com>
 <20200513154707.33747-2-JPEWhacker@gmail.com>
In-Reply-To: <20200513154707.33747-2-JPEWhacker@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: d77aac5e-6ddb-44a2-9285-5a42bf7371b3.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [94.5.236.244]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d64019d6-8161-485d-3a7d-08d7f7596425
x-ms-traffictypediagnostic: AM0PR08MB4945:|VI1PR08MB3919:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3919811E67E6B52824B27FFE92BF0@VI1PR08MB3919.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1728;OLM:4714;
x-forefront-prvs: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t6iVEfaDGsvr99l90Q7CLhg+JbWDf0n0YzxR5GohpfqsWIYLBL0wYaiYNx6Y67xyxHigplayB3Pa0skdQXYNoCfYAsI+A5/k3q340YGzzt2i06N2A2hDsCEDSvutuXTnQ/OW3PsRM/2D3/xf/Ia7gMNm1YgjOU0sUxoe9afu+UsO0tPShwxMa5GQ6nyToKH4VMRsrlgIL4grxn0klyVgL5BY5aboM6PilStD0Uuk3iaLZyYsJ0BgxhDvQHkJwYKy623PBUBzv0MjpjQZjtXG8CcKKJ4YXd07KN8crOFjLFEVQ/prvJPMbGRTfnoclSUreK/9HE1M9Ce7DRXVyeRQ2XVCA63M6PQ2WBs8GTt6e5VLc1L1UCrQMVEaZd0N2amsILLMXU8sENjlQvF3AAkufnvMb2tJB7q14NA9eL6zN5oiew+JniPYOmNL9ziWQtArqlICwgY9Dp2o83drv/1Q1EhFoJGyOsCD7XDUsZZuONr7gnSrYvpm7ZmzQ7FgQkrpQg2lZhah0FP4Lnja7nhP/Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(33430700001)(33656002)(66556008)(7696005)(55016002)(26005)(186003)(316002)(110136005)(8676002)(2906002)(8936002)(478600001)(71200400001)(86362001)(66476007)(66946007)(9686003)(33440700001)(52536014)(76116006)(5660300002)(53546011)(6506007)(66446008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 ZbnNjOiV9lBjxnOKSlfw5IldCuJsXWEDmaq7Nl9FvFHxkftTABYAuRZdsTxMuORsQ7xHxtTz1el76zMw7RziJonee8Sxe6dOdZv2BcoMC/UIuTQvC4g0dKb2tnHTO8k1iS18KoTUzlfqcsGbkJG4OPOmk7NcNY8nrp/mNjvJGHP04PXZVYPiPiNSzzEWCeFwqsXm60lh7r8Q3j3pXAhns7RxkLlfDp+Qbpxuzl/+owXa2YxvBQMww0py4sPmcxZMjudRkRSJyf87OQAc8ro4tGQrWs/Ygj4gOEFVsTUrMFmzGScWJzZN/5Inx8VL/m6gi6hCe6rLrZLmsEhMFcySBWCW5Wf0DNStrFEj6GueTnTfdo8pAu0GK1Xlc5NDLl1QNOYCOpFgwJolCUXGx1coP23WhX18gA8/zGimIJhBU1l0gfEbJgS/JMZ8GIz7rP9YVbRMHcwi+sDajbvI2wc6zhDdLAW5RtX0NHMxi5N0hnc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4945
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(33430700001)(2906002)(47076004)(5660300002)(316002)(356005)(82310400002)(81166007)(33440700001)(110136005)(82740400003)(52536014)(8676002)(53546011)(6506007)(336012)(33656002)(7696005)(86362001)(478600001)(8936002)(9686003)(70586007)(70206006)(26005)(186003)(55016002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	57c334bb-440c-4537-08da-08d7f7595ffb
X-Forefront-PRVS: 0402872DA1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HbB9hrtsQ9jhmU5FwQufaL0LGz8EvEcTf9+sav2XnRvhr+eNvOB5WJIJGIncjD26R7DlWmjrw/shrLCpE2B9lQcwAvPPxs7lS/UC/MR/X6bIBLXMiAOPHkEmtuWf7tKU7qgwtAsfXLGWHSI9YQFSFZ/Vup1MbepqmuIFegpuOG9/hA5t/zNGLuCRmaLFZnn598ISze7Dbo/jSoRd06jy9ZedcroA4g6RbUa2kxCkJDCfW1sBYfpkdGNoO80whl7X1omeT813YSWPhazx5UJ2dNMnEWpi8mAsVinhKokQ6KK4T5ZbtgvOTZSgkOAO/H2YjGFxWWg8rRz/BBtRMAjXe/0GafPfZd3T/U9RFtyrdzkaXMjUeWzjydKqdOYfErVL2FaTkajbcVuLhHLXUI41PCd+Y8A3VFNYFAOaglMVGDpIfYs4MpjtRCIcnlaBVWMDBVxW08fiJpEXPhjttVwyjKxh/TqyDSqvovF8ZaSihREGwFBZU4sXSWUjgnGtSnE+yi9dmV6kRLUBRBBFfiovCk1WrEe2tgtSFsp/ai4kro6Hhq1JUNDbna54WVSoxJzIYgRJNHRpTKK2h9LmEcDGLg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 16:19:20.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64019d6-8161-485d-3a7d-08d7f7596425
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3919
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The patch itself looks good to me but I haven't tested it (a.k.a build & ru=
n).

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Joshua Watt via lists.yoctoproject.org
> Sent: 13 May 2020 16:47
> To: meta-arm@lists.yoctoproject.org
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Subject: [meta-arm][PATCH v3 1/2] trusted-firmware-a: Build out of tree
>
> Use the BUILD_BASE variable to specify an out-of-tree build. Eliminates t=
he
> need to set the TFA_BUILD_DIR.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../trusted-firmware-a/trusted-firmware-a.inc | 32 +++++++++++--------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc
> b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index e6d48e4..febd8ce 100644
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
> @@ -85,6 +80,8 @@ EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_UBOOT',
> '1', ' BL33=3D${DEPLOY_DIR_IMAG  # TFA is forcing the host compiler and i=
ts
> flags in the Makefile using :=3D  # assignment for GCC and CFLAGS.
>  do_compile() {
> +    cd ${S}
> +
>      # These changes are needed to have the fiptool compiling and executi=
ng
> properly
>      sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},'
> ${S}/tools/fiptool/Makefile
>      sed -i '/^INCLUDE_PATHS/ s,$, \-
> I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile @@ -
> 92,8 +89,15 @@ do_compile() {
>
>      oe_runmake ${TFA_BUILD_TARGET}
>  }
> +do_compile[cleandirs] =3D "${B}"
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
> @@ -102,21 +106,21 @@ do_install() {
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
