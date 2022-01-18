Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1FBC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 09:01:25 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.49])
 by mx.groups.io with SMTP id smtpd.web09.10331.1642496483208828110
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 01:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ZXR/0ooR;
 spf=pass (domain: arm.com, ip: 40.107.7.49, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+akRw/nPaYdZio1wIXkdv/XeRqAZeJCYX3vJuASqC3o=;
 b=ZXR/0ooRzcxCAJPjIfHlbVQ5gCf0G5UVy8jDPkY1r6k1WewASKroL/HkyKU5f3n5ygx5GWcCaTg+1zqdenayxmoR4wtN0Y5BgdW+O13mVvtjFWvmjewjqC/FcJ/kxQ7Ty42aofaV0wxj519HLl4T1lJVhhFUMXGl35+0vpGyBh8=
Received: from DB9PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:1da::9)
 by AM0PR08MB3121.eurprd08.prod.outlook.com (2603:10a6:208:60::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 09:01:19 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::6c) by DB9PR05CA0004.outlook.office365.com
 (2603:10a6:10:1da::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 09:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 09:01:18 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Tue, 18 Jan 2022 09:01:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89a44a49fef7367b
X-CR-MTA-TID: 64aa7808
Received: from f6fc963ed9bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B375B884-2103-45B9-B639-226DAABAABC3.1;
	Tue, 18 Jan 2022 09:01:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 f6fc963ed9bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jan 2022 09:01:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8GkJ0ji0oNFUzMG238orlTyHE/kUbU7+FCtGzp/KvkfseEWZCq0ysSfA6zEcuPUfVg396IZxypE3uVZEOOPp51aW6VNhdaGY+VzQ3N+AstgKNxWh+2eHrUwoBeq/Isv4rdsJoRvSmdLG015xPH+3F3e8dCEjHAg/h2iuR2HHLixvV23pyI6TAMMckXZY4aTh7kbgHTSJC208WFLpiltsKhTXG+voBg+F0sdhvphq/LAe7h62aNP5Z6ckYadg/0Zdu2GKPa5E911gqCKZ7YMFkGHX+D6ce0oO+lBJsNsS41ihGYjZPyUqbydYlKpHJgtt0gh2SpuwgVDey/q8pzx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+akRw/nPaYdZio1wIXkdv/XeRqAZeJCYX3vJuASqC3o=;
 b=aPcijVLIDWpZMis/FzLw4UmG39MobHoP5DLmVWuWHx7BZjWufvXOOmCDDu7aoO1HjPkFJ2ZN9P0zed2aD+grVglBfZBL/32tA//CbJ1DVyoCSKTWLL4LWEyhjL+S5Uzr6VuZVV7YaRF8N2wlikBKndibbBp+6A0B5MMTscPr4PIEl2HU+U3nYZUjNMbb/D5A1sHf5pGImBgs05EHSAHcJYbNAj02l18fX338MVxRYnI4oYYM7phTRezm6aV/kDf6UVxVa2Qms+vDlBCcqpUmpni7nEzyFgrB0feeHpdH2Ak+8uWg8xIrjCszpmj7LTRkVbo27hqMxZmMiMAlWDPXig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+akRw/nPaYdZio1wIXkdv/XeRqAZeJCYX3vJuASqC3o=;
 b=ZXR/0ooRzcxCAJPjIfHlbVQ5gCf0G5UVy8jDPkY1r6k1WewASKroL/HkyKU5f3n5ygx5GWcCaTg+1zqdenayxmoR4wtN0Y5BgdW+O13mVvtjFWvmjewjqC/FcJ/kxQ7Ty42aofaV0wxj519HLl4T1lJVhhFUMXGl35+0vpGyBh8=
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by DB9PR08MB6441.eurprd08.prod.outlook.com (2603:10a6:10:252::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 09:01:09 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::8126:bcfb:4535:3450]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::8126:bcfb:4535:3450%4]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 09:01:09 +0000
From: Anders Dellien <Anders.Dellien@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain: Fetch prebuilt Android
 Clang, version r416183b
Thread-Topic: [meta-arm] [PATCH 1/3] arm-toolchain: Fetch prebuilt Android
 Clang, version r416183b
Thread-Index: AQHYC7LusiGBoL9T1UWNU9eAej8d26xoU7EAgAAn91g=
Date: Tue, 18 Jan 2022 09:01:08 +0000
Message-ID: 
 <VI1PR08MB55178D7541D3AF160D7C1D8789589@VI1PR08MB5517.eurprd08.prod.outlook.com>
References: <20220117150002.16976-1-anders.dellien@arm.com>
 <CAFA6WYNCb7udyr=ei_tSb4fWH=cY-JuD5ZVQGLutNYuC=GUnGA@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYNCb7udyr=ei_tSb4fWH=cY-JuD5ZVQGLutNYuC=GUnGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 7723bc6d-85ce-78db-e72b-0224e8ac9869
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e5a980a9-b31a-47b4-21cc-08d9da6116f0
x-ms-traffictypediagnostic: 
	DB9PR08MB6441:EE_|DB5EUR03FT009:EE_|AM0PR08MB3121:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB31216B0CE91F1F76A04B674789589@AM0PR08MB3121.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V24mzuIVD9094OVupVAWQdXasdl4pvoHFldACRl28kCHp3AI2FSQ+AzWqB0pkYNqZe62S7SumhyfC/JFPzsUeOi3gNmI6BdMwbdcLEABc6Lpn1kehjDJ3Zzhv4cEtBjVPmSc9MR5/BIvD9nsmBfQlKnWptA/vF+m7pw3V90Jw0bw0knlewzNqU4FFtA/+elPsy3mPfFaGAf0Qjrsp26Bb+qSqXgOwswwKEPtBkxY0VvhoUNzKu/vw3Wsw0kRX6FH8IRNFAB4jrU/j/QQrl/c+Q0LEThPG+7E6Wd2m3xLG7V5Jx2UIL7ucwAjyw6Nf3MoPvOS0p5HZbLNyjLqqCi4voLMICrPnF8betxAIse/YW8Eoc+QQwwhPaJ/kuml9gpS/dkcI4xeS8yCqWIoCFTOKe6GoxewIxRUGLSQ7LmSyKWXZp60kVtIPyV1+cF+x/ESccQQLgHX8zffUKu+wNlYRBoJPE7W6UJ19MwaClqABgjopEVuBOWWH6gmWCnRZXTGRPI1ohb2C1VaKVcBjbwtKLs42dqjWsGZFhgDday7SIKwHytutY7p6hjARIy4ubKjyEcL26FvlLCpIY+GJLsCsGRw+QU4uM8X4AO7bvsud4eOKRbGftRgv1n6q93pKewPPOVSs/roO4xuUO+90EBLcD9gYP3AZJIACDrryOu4ehiPaqB2MdDYuFRsMIPomJkPA87h+916OWAbDNF/PIXFy7WmIFT2JpBG9y1sQBJpLld7SSK/ouq4acHEAyt/kVRK4tM0amknlgYXbC7e+l3E/KL8xPUEo8HNffozBphr3zBnh14Jkjt//UuZ+K6vs51G
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(8936002)(53546011)(38100700002)(166002)(19627405001)(66946007)(508600001)(55016003)(5660300002)(83380400001)(71200400001)(122000001)(186003)(7696005)(76116006)(8676002)(966005)(66446008)(316002)(6506007)(2906002)(110136005)(9686003)(64756008)(91956017)(86362001)(33656002)(66476007)(38070700005)(66556008)(26005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB55178D7541D3AF160D7C1D8789589VI1PR08MB5517eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	27b9e6d6-b7ae-4ce2-b0af-08d9da611198
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5UGQKdOxm3JrolwveDm3dzYjF4bGgXzlDcLWzYIjwX7V7d6wu6/dyuyJFT2GPWNmDDssYLiL/Sh+B8gTDEaIgOWOTWIc0yisWt5uP/C2HIjxdBDidSDqzv7ETm6UfJZqdeBD8ilN6MUBoe6FRv+WNRCgwN030V4LPl30xb1+jO24zOzAJ113iFLmfPt+TxYa67c9tbL84xY3/w6Afs83r9JsF0sFC5cyrbOodE13mAqs52ZV06mjLGs72rSW+vHsBurzOmCQy7WlqbxWjtIE7Q13LqJ1kNsdp5+9ITBpOrFJsYA/EEkajF0QUp49HYRdnPMTEK9H5e7974Xjn5QBYhsRi/rARUmVpx5H3juZVv8DCYaXnZ/S81VtSy0AZjHEI236EErXa52d/5R64o6VkyEc6U/lAtCYNU1U/Ic//Q96j6CKkGe9SCnsaQXu48XVa6JUNM1tM3b8MzJiCyAHwa6LuNm+z0AtTbheCCC4+KED3lMgemrcJtDsLEMwnRRzSbQ7WUNx/PUebeDs8v2gRpn1VWgJZasPNNSlfqu9v+f0SJkLe6wRwoXicE7M8Q2wHt3GMvg3FeeSHNZEu4DSdmbNpSEg80X6y0N0Lkz7lMDH1NE4aTkFaN3svVukOFi9LyDBQBccZt5mtuyU5LgJ30O4SVJw+LCPfWTB6iBH0SA8YYhNpWMS8mtK0xj95CTx9krNyJR9LtiMwHqu50vlyjWsXutcY6OvOC7ml3tvyHCyh4/AuiDaiMKwIpRLf5i8XVg2JBgglI7FYRfHwXKJPUVk/pM29e4n1NhCI2lKDgCIjRXzTICQXZUabVX4QivtxOxTjQDzPfEEtwYvsBUDgQ8EYZAsdTAm/3kqTJBkNsBs+UR1du4BrYSM/SZV4ZPQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(52536014)(336012)(86362001)(110136005)(40460700001)(5660300002)(70586007)(70206006)(83380400001)(82310400004)(36860700001)(9686003)(316002)(47076005)(55016003)(26005)(186003)(8676002)(356005)(33656002)(81166007)(8936002)(508600001)(7696005)(6506007)(53546011)(2906002)(19627405001)(966005)(166002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 09:01:18.0998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5a980a9-b31a-47b4-21cc-08d9da6116f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3121
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 09:01:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2853

--_000_VI1PR08MB55178D7541D3AF160D7C1D8789589VI1PR08MB5517eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The reason we need this is that we would like to use a Yocto-built BSP to b=
oot our Android stack
(which includes GPU support), and for that to work we need to build it with=
 this specific compiler.

Thanks,
Anders
________________________________
From: Sumit Garg <sumit.garg@linaro.org>
Sent: Tuesday, January 18, 2022 6:35 AM
To: Anders Dellien <Anders.Dellien@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Usam=
a Arif <Usama.Arif@arm.com>
Subject: Re: [meta-arm] [PATCH 1/3] arm-toolchain: Fetch prebuilt Android C=
lang, version r416183b

On Mon, 17 Jan 2022 at 20:32, Anders Dellien <anders.dellien@arm.com> wrote=
:
>
> From: Usama Arif <usama.arif@arm.com>
>
> This Clang version is present in Android master
> (as of October 8, 2021)
>

Is there any specific motivation to use a pre-built Android clang
compiler rather than one built from source using meta-clang?

-Sumit

> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Signed-off-by: Anders Dellien <anders.dellien@arm.com>
> Change-Id: I957742ee943ef68119fd7c7e2bd8ee62b717b31c
> ---
>  .../androidclang_r416183b.bb                  | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-tool=
chain/androidclang_r416183b.bb
>
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/a=
ndroidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-arm-=
toolchain/androidclang_r416183b.bb
> new file mode 100644
> index 00000000..316cbb93
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidc=
lang_r416183b.bb
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (c) 2021 Arm Limited
> +#
> +
> +SUMMARY =3D "Android Clang compiler"
> +DESCRIPTION =3D "Android Clang compiler, version r416183b. This is based=
 on Clang 12.0.5 \
> +Intended usage is to build kernel images that match the output of the An=
droid (hermetic) \
> +build system"
> +
> +LICENSE =3D "MIT"
> +
> +LIC_FILES_CHKSUM =3D "file://MODULE_LICENSE_MIT;md5=3Dd41d8cd98f00b204e9=
800998ecf8427e"
> +
> +ANDROID_CLANG_VERSION =3D "clang-r416183b"
> +ANDROID_CLANG_HASH =3D "bd96dfe349c962681f0e5388af874c771ef96670"
> +
> +COMPATIBLE_HOST =3D "x86_64.*-linux"
> +
> +SRC_URI =3D "https://android.googlesource.com/platform/prebuilts/clang/h=
ost/linux-x86/+archive/${ANDROID_CLANG_HASH}/${ANDROID_CLANG_VERSION}.tar.g=
z;subdir=3D${ANDROID_CLANG_VERSION}"
> +
> +# We need to set the checksum to "ignore" because the tarball is dynamic=
ally generated and has a new checksum every time
> +# (the contents are the same, but the time stamp differs)
> +BB_STRICT_CHECKSUM =3D "ignore"
> +
> +S =3D "${WORKDIR}/${ANDROID_CLANG_VERSION}"
> +
> +do_install() {
> +    # We should really use ${libexecdir} here, but that as some files ha=
ve invalid RPATH
> +    # this results in lots of warning. So using ${datadir} for now
> +    install -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/
> +
> +    cp --no-preserve=3Downership -r ${S}/. ${D}${datadir}/${ANDROID_CLAN=
G_VERSION}/
> +
> +    install -d ${D}${bindir}
> +    # Symlink all executables into bindir
> +    for f in ${D}${datadir}/${ANDROID_CLANG_VERSION}/bin/*; do
> +        ln -rs $f ${D}${bindir}/$(basename $f)
> +    done
> +}
> +
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +INSANE_SKIP:${PN} =3D "already-stripped libdir staticdev file-rdeps arch=
 dev-so"
> +
> +INHIBIT_SYSROOT_STRIP =3D "1"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2840): https://lists.yoctoproject.org/g/meta-arm/mess=
age/2840
> Mute This Topic: https://lists.yoctoproject.org/mt/88485376/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@=
linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_VI1PR08MB55178D7541D3AF160D7C1D8789589VI1PR08MB5517eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,<br>
<br>
The reason we need this is that we would like to use a Yocto-built BSP to b=
oot our Android stack<br>
(which includes GPU support), and for that to work we need to build it with=
 this specific compiler.<br>
<br>
Thanks,<br>
Anders<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sumit Garg &lt;sumit.=
garg@linaro.org&gt;<br>
<b>Sent:</b> Tuesday, January 18, 2022 6:35 AM<br>
<b>To:</b> Anders Dellien &lt;Anders.Dellien@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Usama Arif &lt;Usama.Arif@arm.com&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH 1/3] arm-toolchain: Fetch prebuilt An=
droid Clang, version r416183b</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 17 Jan 2022 at 20:32, Anders Dellien &lt;a=
nders.dellien@arm.com&gt; wrote:<br>
&gt;<br>
&gt; From: Usama Arif &lt;usama.arif@arm.com&gt;<br>
&gt;<br>
&gt; This Clang version is present in Android master<br>
&gt; (as of October 8, 2021)<br>
&gt;<br>
<br>
Is there any specific motivation to use a pre-built Android clang<br>
compiler rather than one built from source using meta-clang?<br>
<br>
-Sumit<br>
<br>
&gt; Signed-off-by: Usama Arif &lt;usama.arif@arm.com&gt;<br>
&gt; Signed-off-by: Anders Dellien &lt;anders.dellien@arm.com&gt;<br>
&gt; Change-Id: I957742ee943ef68119fd7c7e2bd8ee62b717b31c<br>
&gt; ---<br>
&gt;&nbsp; .../androidclang_r416183b.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 50 +++=
++++++++++++++++<br>
&gt;&nbsp; 1 file changed, 50 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-arm-toolchain/recipes-devtools/external-=
arm-toolchain/androidclang_r416183b.bb<br>
&gt;<br>
&gt; diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchai=
n/androidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-a=
rm-toolchain/androidclang_r416183b.bb<br>
&gt; new file mode 100644<br>
&gt; index 00000000..316cbb93<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/andro=
idclang_r416183b.bb<br>
&gt; @@ -0,0 +1,50 @@<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +# Copyright (c) 2021 Arm Limited<br>
&gt; +#<br>
&gt; +<br>
&gt; +SUMMARY =3D &quot;Android Clang compiler&quot;<br>
&gt; +DESCRIPTION =3D &quot;Android Clang compiler, version r416183b. This =
is based on Clang 12.0.5 \<br>
&gt; +Intended usage is to build kernel images that match the output of the=
 Android (hermetic) \<br>
&gt; +build system&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://MODULE_LICENSE_MIT;md5=
=3Dd41d8cd98f00b204e9800998ecf8427e">file://MODULE_LICENSE_MIT;md5=3Dd41d8c=
d98f00b204e9800998ecf8427e</a>&quot;<br>
&gt; +<br>
&gt; +ANDROID_CLANG_VERSION =3D &quot;clang-r416183b&quot;<br>
&gt; +ANDROID_CLANG_HASH =3D &quot;bd96dfe349c962681f0e5388af874c771ef96670=
&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST =3D &quot;x86_64.*-linux&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://android.googlesource.com/platfor=
m/prebuilts/clang/host/linux-x86/+archive/${ANDROID_CLANG_HASH}/${ANDROID_C=
LANG_VERSION}.tar.gz;subdir=3D${ANDROID_CLANG_VERSION}">https://android.goo=
glesource.com/platform/prebuilts/clang/host/linux-x86/+archive/${ANDROID_CL=
ANG_HASH}/${ANDROID_CLANG_VERSION}.tar.gz;subdir=3D${ANDROID_CLANG_VERSION}=
</a>&quot;<br>
&gt; +<br>
&gt; +# We need to set the checksum to &quot;ignore&quot; because the tarba=
ll is dynamically generated and has a new checksum every time<br>
&gt; +# (the contents are the same, but the time stamp differs)<br>
&gt; +BB_STRICT_CHECKSUM =3D &quot;ignore&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/${ANDROID_CLANG_VERSION}&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +&nbsp;&nbsp;&nbsp; # We should really use ${libexecdir} here, but tha=
t as some files have invalid RPATH<br>
&gt; +&nbsp;&nbsp;&nbsp; # this results in lots of warning. So using ${data=
dir} for now<br>
&gt; +&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/${ANDROID_CLANG_VERSION}=
/<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; cp --no-preserve=3Downership -r ${S}/. ${D}${datad=
ir}/${ANDROID_CLANG_VERSION}/<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; install -d ${D}${bindir}<br>
&gt; +&nbsp;&nbsp;&nbsp; # Symlink all executables into bindir<br>
&gt; +&nbsp;&nbsp;&nbsp; for f in ${D}${datadir}/${ANDROID_CLANG_VERSION}/b=
in/*; do<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ln -rs $f ${D}${bindir}/$(=
basename $f)<br>
&gt; +&nbsp;&nbsp;&nbsp; done<br>
&gt; +}<br>
&gt; +<br>
&gt; +INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +INSANE_SKIP:${PN} =3D &quot;already-stripped libdir staticdev file-rd=
eps arch dev-so&quot;<br>
&gt; +<br>
&gt; +INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt; +INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt; +INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#2840): <a href=3D"https://lists.yoctoproject.org/g=
/meta-arm/message/2840">
https://lists.yoctoproject.org/g/meta-arm/message/2840</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/88485376=
/1777089">https://lists.yoctoproject.org/mt/88485376/1777089</a><br>
&gt; Group Owner: meta-arm+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsu=
b">https://lists.yoctoproject.org/g/meta-arm/unsub</a> [sumit.garg@linaro.o=
rg]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR08MB55178D7541D3AF160D7C1D8789589VI1PR08MB5517eurp_--

