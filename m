Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.70])
 by mx.groups.io with SMTP id smtpd.web11.1414.1585812041987931320
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 00:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=a9TUuMcU;
 spf=pass (domain: arm.com, ip: 40.107.14.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9+bZMrp+hDvOpr0dxMlKQNnn+X0Ch2qC6C1g2g6F80=;
 b=a9TUuMcUmHl92Z0DGTRPDgb5v01s2nyIYANp8lGy/Dnp1EXCNUzqUcs7ngwVNxteo/OopQhwuqf11EpqKdQM6RUErOmcdJ9t0wBSYPGShK5DxG3cy8KyJ0vYKG3lNi4hto48vcCcfWpana9Zz4cGDn/ErDvkL7kVp9gtWVDIOuI=
Received: from DBBPR09CA0027.eurprd09.prod.outlook.com (2603:10a6:10:d4::15)
 by VI1PR0801MB1742.eurprd08.prod.outlook.com (2603:10a6:800:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 2 Apr
 2020 07:20:39 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::98) by DBBPR09CA0027.outlook.office365.com
 (2603:10a6:10:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 07:20:39 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 07:20:39 +0000
Received: ("Tessian outbound 55454527ea3b:v50"); Thu, 02 Apr 2020 07:20:39 +0000
X-CR-MTA-TID: 64aa7808
Received: from 6c8c6452fbce.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B3E50174-59BC-4028-921D-752674DECAE1.1;
	Thu, 02 Apr 2020 07:20:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c8c6452fbce.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 07:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi2+nyo+OLqsbe4p9WgvFkqjLtol9mcOWIvRtNhtaHzLR5EEIsK7CDy2hPyPAL28P3LFvrLTiM+uYX1NOILLAlBP4yluZAjs4qITikCDA1w9C6yho1Z8wjjGuiTMkwVBLFPfztVDT1+6XMB54aBq2dNM1jtC6MMjj2UgKGSAJw188SZIZ8kFg14TMHUkoGsqW8t029pkx8Ywo05cKJ0CxU55HbTLYA/8pnuQgsNIBM67aXgB94jRKrJgkPdm/fkVWFzMnx2DY0K//CmbazFWmNjCIfPM2Ydo/8ky5TVskHnw17ww1Lm7J6VEGUBzwTF+iIWT3MoSnIEupGKrLO5V7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9+bZMrp+hDvOpr0dxMlKQNnn+X0Ch2qC6C1g2g6F80=;
 b=CLr4rLKD0/b5Aon3fXfHpdoon5CM4fg+2vy/cNd1ltwb0XzXIkN3G8O+W6TxhHkL1UwFbCCVQsH7C5lIYiOcmEPLGEZ8UCfeA7BIjz3EmhdLMzS4gtQQDjE5P/9JT2dXxjuZFkTDhUoKKSF6odj2PoCmreLe9Rh7jVskG71ba3z04+oIpCyp5RlFafBUeaH2AKkx2EhkBT0OM7MMTdDg1st7J9y1TiVrcnL37Cxz0uyVs+ciky678toUEch0Ym9ig8tWjEHAfNtwIwWhv3eyMKb1FPj+ScruFEZ10kKYSd0Ak+wiL2v0Z2t0i7JcZaPRSAVJPL0jNyJRa1ZDIpTloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9+bZMrp+hDvOpr0dxMlKQNnn+X0Ch2qC6C1g2g6F80=;
 b=a9TUuMcUmHl92Z0DGTRPDgb5v01s2nyIYANp8lGy/Dnp1EXCNUzqUcs7ngwVNxteo/OopQhwuqf11EpqKdQM6RUErOmcdJ9t0wBSYPGShK5DxG3cy8KyJ0vYKG3lNi4hto48vcCcfWpana9Zz4cGDn/ErDvkL7kVp9gtWVDIOuI=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4147.eurprd08.prod.outlook.com (20.178.119.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Thu, 2 Apr 2020 07:20:33 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 07:20:33 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/5] optee-os: upgrade 3.7.0 -> 3.8.0, cleanup
Thread-Topic: [meta-arm] [PATCH 2/5] optee-os: upgrade 3.7.0 -> 3.8.0, cleanup
Thread-Index: AQHWCHskBulUei3rkkWIisOMTIReIahlaVTg
Date: Thu, 2 Apr 2020 07:20:33 +0000
Message-ID: 
 <AM0PR08MB39870357825A6CA3C3619DBC92C60@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-2-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-2-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 3742418c-7184-4bbc-a443-6d0ba9cbf929.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c7eb506-3d99-4ae6-de56-08d7d6d65888
x-ms-traffictypediagnostic: AM0PR08MB4147:|VI1PR0801MB1742:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1742A2ED24F0EFE0EFA0047C92C60@VI1PR0801MB1742.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(64756008)(66446008)(66556008)(66476007)(71200400001)(4326008)(316002)(66946007)(55016002)(76116006)(7696005)(6506007)(53546011)(8936002)(54906003)(81156014)(81166006)(8676002)(26005)(9686003)(6916009)(5660300002)(186003)(52536014)(33656002)(478600001)(2906002)(86362001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RtmSIEL7D46OAXyTYoF4M6A32pmrglQiFvnAaJ7DWHKuudjfk2iw3KsOGmxd/zqSNec2ErpzwNg32Nge4qo+tsAtln8wmCI9xERwD1/PMvr1nZ6/zSD8zkO2AjmTT3pe6NoK3emOw6gsC+3jWu/avFwbuxX1crIFizonmDdpLDGlado2qTWzFSD/n8zRWyZYJO3Cg/j9SnUeOhhWmjZ28bYuEB4QG13qOcUOMG66RnkYfofzQXil1cMp0aJW+oN6JE6h+p14xFjhucBNdA1anoCffmWgtZ+VlHBgY2LWwz4dL+3F3blw52NgoO3idfTxWGzhDOjNoZiBVI5d1b+0kggrlm+eHXxaoeU3F/27yHzKAeWNonku8OVbKlB5eixGSkLgZtAdHwmIu3gUQEcLvXhseJkmzp88q+Az8lFtPfbOsywtSSDXSWSbyBg8fPlWpwFoBu47Pu53cFstukRP0DHaSU8ajeJgpJpzLE9iWnBBYt15fr463vcFdmaDmEvwuJFipBp4/lH/2VLdkLnUYA==
x-ms-exchange-antispam-messagedata: 
 DzahfVFZ4zsw75ub2KkBF2UPXAJHZcWVsC8WRpj8HqKbuCNr9PwyvRH4Q9naoJIdu4edHjd/FuS5YYazx45Idnt6JaaUSbewwiGMuSqJEyWu9juWs3N8Pxx17dzkbym5YJoFDjJn7gLAV6HMfQVxmw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(82740400003)(356004)(86362001)(186003)(336012)(26005)(8936002)(7696005)(47076004)(81166006)(81156014)(54906003)(8676002)(316002)(6506007)(70206006)(70586007)(33656002)(53546011)(5660300002)(6916009)(4326008)(478600001)(2906002)(26826003)(52536014)(9686003)(55016002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	06ebd39f-9f12-4eb5-7c00-08d7d6d654f9
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PCBIOHNolIylgOMrbSqKHjLH+jj5MwcGw1jrXF7Jg5KJ0qihSUSV/TOHHIZcU8w+EvjuMLxxUnq9h2MwGADJ1J15F+KYMDP56JoVmGjrFHftTcVjmEMaPhUVZo7nxMu6DuoOtXdXtXw2ImkNKr0pb7R4dUa87EZ1pl4lKftuO2BJ9ckZEthIMrj+wFxkofUKOvlz3g8EKmNU8nll9auZLPFEa/pjDM7E0geC4Zhn9Go/vYxMRdcOvQnCG1ijW+UhwCab/g09wAs86ynpAnT8ggs3JDNIO7C3fTb7a3NH+nzsf8gghgoYRAdzjKaTkjsliNXt/r+vW6BTXH1FfFUtrN/XftESPCqrB+TRGUUXUcrx8/oYqFeDf0d3FHql9Xitd2Wh91NLRcsZFrzN4xHM+BDdetD1NdmQx54HImKRQqfDN5N1wWHzMG9tHOsjCnNCFY/rlJYHe7V9MV31Y5XGLNTbusuK1cJTjk9IOKZ1G9PygXP6NKrZJJDFu1Rq8HZs40P1qfnED7sw8uXHA+w3BMes4ygzdN79TjtaQtGRmkbwPLkOOwVCZL7ZpLnkh/McY+wUcn6n57WePDBzmLsmqXArWC//xb9097XdtqwkMk0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 07:20:39.2854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c7eb506-3d99-4ae6-de56-08d7d6d65888
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1742
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 02 April 2020 00:13
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 2/5] optee-os: upgrade 3.7.0 -> 3.8.0, cleanup
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Cleanup the recipe - add HOMEPAGE, update DESCRIPTION, indentation
> * Depend on PyCryptodomex, but old PyCrypto is still required
> * Ensure full support for arm32 platforms - build corresponding core and =
TA
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm/recipes-security/optee/optee-os_git.bb | 63 ++++++++++++++-----=
--
> ----
>  1 file changed, 36 insertions(+), 27 deletions(-)
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-
> arm/recipes-security/optee/optee-os_git.bb
> index 872fd48..47ced12 100644
> --- a/meta-arm/recipes-security/optee/optee-os_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-os_git.bb
> @@ -1,52 +1,63 @@
>  SUMMARY =3D "OP-TEE Trusted OS"
> -DESCRIPTION =3D "OPTEE OS"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted s=
ide
> of the TEE"
> +HOMEPAGE =3D "https://www.op-tee.org/"
>=20
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec173"
>=20
> -PV=3D"3.7.0+git${SRCPV}"
> +PV =3D "3.8.0+git${SRCPV}"
>=20
>  inherit deploy python3native
>=20
> -DEPENDS =3D "python3-pycrypto-native python3-pyelftools-native"
> +DEPENDS =3D "python3-pycrypto-native python3-pyelftools-native python3-
> pycryptodomex-native"
>=20
> -SRCREV =3D "a2fa5018cb595a9cd9ab62e82c7485ca57a62084"
> -SRC_URI =3D "git://github.com/OP-TEE/optee_os.git \
> -           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> -          "
> +SRCREV =3D "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> +SRC_URI =3D " \
> +    git://github.com/OP-TEE/optee_os.git \
> +    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \ "
>=20
>  S =3D "${WORKDIR}/git"
>=20
>  OPTEEMACHINE ?=3D "${MACHINE}"
>  OPTEEOUTPUTMACHINE ?=3D "${MACHINE}"
>=20
> -EXTRA_OEMAKE =3D "PLATFORM=3D${OPTEEMACHINE} CFG_ARM64_core=3Dy \
> -                CROSS_COMPILE_core=3D${HOST_PREFIX} \
> -                CROSS_COMPILE_ta_arm64=3D${HOST_PREFIX} \
> -                NOWERROR=3D1 \
> -                ta-targets=3Dta_arm64 \
> -                LDFLAGS=3D \
> -                LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \
> -        "
> -
>  OPTEE_ARCH_armv7a =3D "arm32"
>  OPTEE_ARCH_aarch64 =3D "arm64"
> +OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
> +
> +EXTRA_OEMAKE =3D " \
> +    PLATFORM=3D${OPTEEMACHINE} \
> +    CFG_${OPTEE_CORE}_core=3Dy \
> +    CROSS_COMPILE_core=3D${HOST_PREFIX} \
> +    CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
> +    NOWERROR=3D1 \
> +    V=3D1 \
> +    ta-targets=3Dta_${OPTEE_ARCH} \
> +    LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \ "
> +
> +CFLAGS[unexport] =3D "1"
> +LDFLAGS[unexport] =3D "1"
> +CPPFLAGS[unexport] =3D "1"
> +AS[unexport] =3D "1"
> +LD[unexport] =3D "1"
> +
> +do_configure[noexec] =3D "1"
>=20
>  do_compile() {
> -    unset LDFLAGS
>      oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0  }
>=20
>  do_install() {
> -    #install core on boot directory
> +    #install core in firmware
>      install -d ${D}${nonarch_base_libdir}/firmware/
> -
>      install -m 644 ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/core/*.bin
> ${D}${nonarch_base_libdir}/firmware/
> -    #install TA devkit
> -    install -d ${D}/usr/include/optee/export-user_ta/
>=20
> -    for f in  ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-
> ta_${OPTEE_ARCH}/* ; do
> -        cp -aR  $f  ${D}/usr/include/optee/export-user_ta/
> +    #install TA devkit
> +    install -d ${D}${includedir}/optee/export-user_ta/
> +    for f in ${B}/out/arm-plat-${OPTEEOUTPUTMACHINE}/export-
> ta_${OPTEE_ARCH}/* ; do
> +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
>      done
>  }
>=20
> @@ -54,15 +65,13 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
>  do_deploy() {
>      install -d ${DEPLOYDIR}/optee
> -    for f in ${D}${nonarch_base_libdir}/firmware/*; do
> -        install -m 644 $f ${DEPLOYDIR}/optee/
> -    done
> +    install -m 644 ${D}${nonarch_base_libdir}/firmware/*
> + ${DEPLOYDIR}/optee/
>  }
>=20
>  addtask deploy before do_build after do_install
>=20
>  FILES_${PN} =3D "${nonarch_base_libdir}/firmware/"
> -FILES_${PN}-dev =3D "/usr/include/optee"
> +FILES_${PN}-dev =3D "${includedir}/optee/"
>=20
>  INSANE_SKIP_${PN}-dev =3D "staticdev"
>=20
> --
> 2.7.4

