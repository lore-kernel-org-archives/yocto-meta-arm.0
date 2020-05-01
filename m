Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web12.10494.1588341779504315973
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 07:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8hV3D71m;
 spf=pass (domain: arm.com, ip: 40.107.20.61, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzGjObH6Ev6S+saOwcuhVczTg/tjk7fJOrF+7T/1c8Q=;
 b=8hV3D71mWnGLQ/oyaMfsTvNaTC39h0x0LePNnFd9gmwr20AboAlqoClaIGem9pVtjFrve+Zl2YbwZP1CcfoaVmj8zyd6rndwy6gOYMlIGWbgZ6YWNHBEq3meBUQkfNjeHy8TNrIbMHZjyPoCLVGjd4XeaoOu9yrNgRZ18vS3xzE=
Received: from DB6PR0301CA0063.eurprd03.prod.outlook.com (2603:10a6:4:54::31)
 by HE1PR0802MB2428.eurprd08.prod.outlook.com (2603:10a6:3:df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 14:02:56 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::3f) by DB6PR0301CA0063.outlook.office365.com
 (2603:10a6:4:54::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Fri, 1 May 2020 14:02:56 +0000
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
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 14:02:56 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Fri, 01 May 2020 14:02:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 90ada7069a7503d6
X-CR-MTA-TID: 64aa7808
Received: from 438654a20843.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 703EF442-8A8E-4C8F-ABA1-BEBE668A7F98.1;
	Fri, 01 May 2020 14:02:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 438654a20843.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 May 2020 14:02:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiEAFlpY8rvK2SvlF4A/xeFCJEarb1LHjhPoxm73VgM+/AgVjG+zsuskCIlSwjh+tdEDp7oFG+bpH9Jc4OztySlLZWmuXK56qddw8Pu/qV148T3JB1DKXl66JOv9NOpiqEvGubgay4PshoYz9F3OAwd9lX1A3z0ZTlDEW0mGZv4PTF/RBS1+NZNe+py1i01idzbzditN2I7NjRYhULlxj0Qoj1Wh5z/l0e3FeHHI+bSoiTpp9YCmaOiMkjkuogBX8MEcGmxf0eE1t6uSPdgktUly42hYpRItgzXEZZ7Ea+AK3GVyiALFoaMLnxlzgHCZzoYZ+XyjU3qF+8OR+EM8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzGjObH6Ev6S+saOwcuhVczTg/tjk7fJOrF+7T/1c8Q=;
 b=X6cRm99JJDZnnZxElpwWAJ++ZxcfkjSOJdPMHrJiMZbhcIuL3m6yyKh006YPkcTmVqCYhfSrFFKbIrePzbwsMESrQ9aOmvbhkuBH+WKEjnuq/KiN3cq2AiBG7RsKJFovsHNRGa7ak9p3fIcQb7QyRa6+p6EvtC8aiAD8ZGY9DdB+gHck28TVnvFeBHTZV4AA4QP2xTUXbuBQk1Q6T6h0H6Ttg9ZVSN9F8SQD/ZphrRXgW1vk3LLSvTEuwwQv0gEqKHkbiCa4EnOz9ChYHPdc2Wtdw/e5I/xBIIB3BlOqFaeg1xe+/FD7zz/FfR3GcdV+N7DCEcAqVMBOR9iHmHN+6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzGjObH6Ev6S+saOwcuhVczTg/tjk7fJOrF+7T/1c8Q=;
 b=8hV3D71mWnGLQ/oyaMfsTvNaTC39h0x0LePNnFd9gmwr20AboAlqoClaIGem9pVtjFrve+Zl2YbwZP1CcfoaVmj8zyd6rndwy6gOYMlIGWbgZ6YWNHBEq3meBUQkfNjeHy8TNrIbMHZjyPoCLVGjd4XeaoOu9yrNgRZ18vS3xzE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3561.eurprd08.prod.outlook.com (2603:10a6:10:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 14:02:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 14:02:49 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] [arm-bsp] firmware-image-juno: Fix dependency loop
Thread-Topic: [meta-arm] [PATCH] [arm-bsp] firmware-image-juno: Fix dependency
 loop
Thread-Index: AQHWH7qeChQfw78cQkyYmp8KamKKwqiTQu4A
Date: Fri, 1 May 2020 14:02:49 +0000
Message-ID: <74EE0ABB-3B22-4930-8B71-BC9C746B1AAA@arm.com>
References: <1588338922-58454-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1588338922-58454-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79dd78ba-be29-465d-9a55-08d7edd8595d
x-ms-traffictypediagnostic: DB7PR08MB3561:|HE1PR0802MB2428:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB242837EEDB70B5ECA4DDBAEA9DAB0@HE1PR0802MB2428.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zNdxcH/MW0l6C8CTagBHJPikAWrpwYMFm8DSYNAk8j0+dc6T7+qqRTHE+iNbl5qOOyGja/UdIHpi5TGARgn6L9vUvIW6JdpXCFNqeWpzGL5DJwNHVKC+exORkGPEDDPtggV1NF8r3vgBFOJkUL3U+Iw1CAGB20f26OjZSUPwGjKgCtciMY0WMWOwQYiZBFdjP5+kxKBPUfZgxeMtfabrEejXWKtwzYXFp1pJ8yW/fQUBPw0e5b86MmD2zVdqrOQTSSRFGRFQhBxkrlQeG47C43oYXwPS++HP80pCUUPxpLDTH9FFT9YrmxjkU7tm+iqbbwqzjx/XrCoBLPgkHh1nI0yvtNKfyP3yXUFBi8lLwZwdXqL/0L3TUcBfHrgrPnnQez8UD2KfqMRCJy11//S/PD22Xr+Ejv++KBvnXapoXK7aEaSBWAWHz0Lp/3p9rwfdd3O1YL/rxp6TWQueDZqMy7A2iZJR7o6W/6ZeAanKb3r1dCZWYDl/pwy5b5YoeHM+anxL83fCUfI+CJgOSps5RA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(66556008)(33656002)(6512007)(6486002)(66446008)(64756008)(8676002)(6916009)(316002)(8936002)(66476007)(91956017)(76116006)(66946007)(186003)(5660300002)(478600001)(966005)(4326008)(26005)(6506007)(53546011)(36756003)(2906002)(86362001)(2616005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 OC7XSBRn51Pfj+3CZ8CsXfxNwQot72+zm7zmVojJLJDuPZPijBymBpSftM5XAjys5lMKaWdPVgqk36h5f3mstFNgd+GICEl6z+9y/DoJ8ZOmcbAjrDPEly9Vm1P28LpC3GCnafJJSjdjm1Un0ws3R1V80eC//VqDttWNLthoDXaRv/gHrH2QCGAt2AkYY4hHDkw0wWUMTx2EVqaWQbR2506Pp4HiqGpj+4x0rdXAGLFEdNifvl19171JumjPOhgb0/1clDeBjlSItwLo/sovViIStjiR6HnBWkET2yWtYB4FvpVk50hJ4iXe+jLf7iVoKNL/TvAAkQ7ukArTledlI7prWLvU5UZS1OsZmJRKsW+/KEQZXnqHa/iGPJviSpNeF8fp/9oP5R1rr1JZNuLmoDs3xoqlJzbVCZOnBQutA//0Hqfw5/V01aCnYSgGVx9KVdfxwE/5qlrHnZZDTm3iH78OMqD+ME9EhIERg77q5EUfvfNeWRnGPpm/r2JInLaKtnPnYfYSO12WpeZZokiVfqfAQVNvgNSDjRMCDkAfGrkwdqifl4+cUx4ULoyErdbUT4zpTb9ipp+XwUojliVe/n4aPdMV0JCujdohMIQCZnpgFmo9xNivxVsA1amcLvmXc/6VCdCFBlJ8cQ9BotUyBG3IJ5BScUNNKRGMEN1JYT5RSj7fWcR35UFZ8ol0fCWzjw0UpDdoYaSkyG4DNydXiVCgUNRjN/CPlLG1el6udw17Uq7C7Nt5jOftG5WRb21NoJzPT8nGC6yYMgE7hXnkBnuw7EZw3ZWW3SZE22Fh5HU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3561
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(86362001)(316002)(33656002)(6486002)(6512007)(966005)(36756003)(4326008)(2616005)(81166007)(53546011)(356005)(26005)(6506007)(336012)(82310400002)(478600001)(186003)(47076004)(8676002)(8936002)(82740400003)(70586007)(5660300002)(70206006)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d6f87c21-4851-4e6c-b617-08d7edd8550c
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dky8U8yQmXv8ZiJy3kKT2uD6L0VKcLtzEwOwsRxvJP4RBrx/HMzDiA4RVXM75dqNxhZeQx6Og351yum9md5Dma/CEoUTSMikI5fZHDhe9kxLq1EFSw7VFP541Z93Tu3w9vcUCKLq4NKnQ81cXp7WBxhherk+soxGBV2ZQT+NQbDfeNkbnbkjdXQ/yLHslawwSxWTUj88XTCuyG0Z2htTJZGC5yu1ux2oSytHf2uKZ2ASqPQjhSkKL2DyM4uw8W040roTx4nTX8mTlfb+TrcAfCkK/3wfsmK1reO7ZpUIAYpW58aXwgq3Ip+usD3DlALVMQhNTfycnyeE+3GHsUwSus+dsYYGJVtpuyaUQpEOqCsprL0HnJkzquPP7XV2DDV5721Ix0V0GSsC3w2wEkASR/6ziiKzkIiDlYp/2q/2srLctIjORrxFfwkBjub12UIeaQPcSiYsk/JyfVNqfxoXn2q5sNXLf+92cG8G0ec23rWW1kZwVGes9fdU92VwYRDbDQsbav6AIwARoVazatZAJ+oHK9j9dyyjlYBOKyglfeyMRxz0+mSlgfrVQCvzsnE/NTYFHnPUp4+ZB+c1be0xwA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 14:02:56.4169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dd78ba-be29-465d-9a55-08d7edd8595d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2428
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1303A85590F5B643A932DECF804417AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 1 May 2020, at 14:15, Diego Sueiro via lists.yoctoproject.org <diego.=
sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Kernel binaries copying have to be performed in the do_deploy task to
> avoid dependency loop between firmware-image-juno do_install and
> virtual/kernel do_deploy when INITRAMFS_IMAGE_BUNDLE is set.
>=20
> Also, copy the kernel image bundled with initramfs to the firmware
> image when INITRAMFS_IMAGE_BUNDLE is set.
>=20
> Change-Id: I66083d294ab4eb77c643ec33cc1333000373125b
> Issue-Id: SCM-987
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../recipes-bsp/images/firmware-image-juno.bb      | 27 +++++++++++++++-=
------
> 1 file changed, 19 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/me=
ta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
> index 9be4005..b0ad14f 100644
> --- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
> +++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
> @@ -29,6 +29,8 @@ inherit deploy nopackages
> do_configure[noexec] =3D "1"
> do_compile[noexec] =3D "1"
>=20
> +# The ${D} is used as a temporary directory and we don't generate any
> +# packages for this recipe.
> do_install() {
>     cp -a ${WORKDIR}/${UNPACK_DIR} ${D}
>     cp -f ${RECIPE_SYSROOT}/firmware/bl1-juno.bin \
> @@ -37,13 +39,6 @@ do_install() {
>     cp -f ${RECIPE_SYSROOT}/firmware/fip-juno.bin \
>         ${D}/${UNPACK_DIR}/SOFTWARE/fip.bin
>=20
> -    for f in ${KERNEL_DEVICETREE}; do
> -        install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
> -            ${D}/${UNPACK_DIR}/SOFTWARE/.
> -    done
> -
> -    cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
> -
>     # u-boot environment file
>     cp -f ${WORKDIR}/uEnv.txt ${D}/${UNPACK_DIR}/SOFTWARE/
>=20
> @@ -52,13 +47,29 @@ do_install() {
>     cp -f ${WORKDIR}/images-r1.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262C/ima=
ges.txt
>     cp -f ${WORKDIR}/images-r2.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262D/ima=
ges.txt
> }
> -do_install[depends] +=3D "virtual/kernel:do_deploy"
>=20
> do_deploy() {
> +    # To avoid dependency loop between firmware-image-juno:do_install
> +    # and virtual/kernel:do_deploy when INITRAMFS_IMAGE_BUNDLE =3D "1",
> +    # we need to handle the kernel binaries copying in the do_deploy
> +    # task.
> +    for f in ${KERNEL_DEVICETREE}; do
> +        install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
> +            ${D}/${UNPACK_DIR}/SOFTWARE/.
> +    done
> +
> +    if [ "${INITRAMFS_IMAGE_BUNDLE}" -eq 1 ]; then
> +        cp -L -f ${DEPLOY_DIR_IMAGE}/Image-initramfs-juno.bin \
> +            ${D}/${UNPACK_DIR}/SOFTWARE/Image
> +    else
> +        cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
> +    fi
> +
>     # Compress the files
>     tar -C ${D}/${UNPACK_DIR} -zcvf ${WORKDIR}/${PN}.tar.gz ./
>=20
>     # Deploy the compressed archive to the deploy folder
>     install -D -p -m0644 ${WORKDIR}/${PN}.tar.gz ${DEPLOYDIR}/${PN}.tar.=
gz
> }
> +do_deploy[depends] +=3D "virtual/kernel:do_deploy"
> addtask deploy after do_install
> --=20
> 2.7.4
>=20
>=20

