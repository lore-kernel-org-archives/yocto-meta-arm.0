Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.77])
 by mx.groups.io with SMTP id smtpd.web10.10480.1591890406177970463
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 08:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YN2wH860;
 spf=pass (domain: arm.com, ip: 40.107.22.77, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpx2ij73lSi5e6IEL+oumAjv8129uwL9f5PMRBYc59w=;
 b=YN2wH860BR1s3q5EnTG1UtP84i5wcBN9Z033Db+BI51brjVvP2ndKq5ky0m4OCoA5Z45ORQWXQ94Gyrka1T+4HP7x3tNoiSFhxcD3hmsrx11ZLzxO3/pvKiJXXTJBcZdzwDP3pM25qpMzdSUhdUsMgqwj8NDzQRD/t70vj1EksQ=
Received: from DB6PR0402CA0013.eurprd04.prod.outlook.com (2603:10a6:4:91::23)
 by HE1PR0802MB2489.eurprd08.prod.outlook.com (2603:10a6:3:d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Thu, 11 Jun
 2020 15:46:43 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::fd) by DB6PR0402CA0013.outlook.office365.com
 (2603:10a6:4:91::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 15:46:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 15:46:43 +0000
Received: ("Tessian outbound 8bb15bb571b3:v59"); Thu, 11 Jun 2020 15:46:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50f64be6351e138f
X-CR-MTA-TID: 64aa7808
Received: from a696bf66e821.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8C455C75-B721-4505-B78B-002F940318EB.1;
	Thu, 11 Jun 2020 15:46:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a696bf66e821.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 15:46:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfUrXJfHar5gzpaHwdjww6eGVtWkE2vtxp2sI0QNnMiqxZv175feij5wK5ftLpjbjNnaJsa2eq0nD3snE86nBmljBMHuMte2JbcUx1NtWczFweAS5en7iTXLtcvx8qIGVzWaece8SCecBkvYUuNpI9beazOXT+K7oBnfMQr1hIXgnJvVXuGxgMLvGBKxC5pV4jzJTRZ0/MlRy1oeVJzJjqHKIY8KJbswU/B8tQ8VB1abyEFc8Aa5ZOkHS9Ktn9yXz57C2hQtzsfB7rvpZckUWh1wNIbzRamwRv0LUQPvSNszVKoDUQAFu1bhhCGPy/9y9t4k7K0qk71/9MC4Q9TXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpx2ij73lSi5e6IEL+oumAjv8129uwL9f5PMRBYc59w=;
 b=bLZjatD3aoiGayWM67Nn5pKrA2H/B94o4b1uhP0kdCvmbwUo7LJ3alfJsa76SuSiBUd1JB1SN8nPFsiBoMAGX0GwfA2eNk8EwbEw2Ml9LePNWkrVx9sBPp/UiW1ld29YxD8AWaoaueUMh/2AaJoVLXMHCBXW/NMEWkhR+ZWZIxWXwbKgN3ZFs47dycni9WqgfJ5DELXRiyfeCf3FLiRCpSBAGWAViGI20eU+ZUqIcF+vH/l2lidbD00LFsD3B1kyx2uLty2HcnbCk7QmphpzOjb8jft4JkIflMMaRQqej1sh/jPMKH4+QWtpv3qRxJp/3d6GIcvWvwimbVz+BiQQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpx2ij73lSi5e6IEL+oumAjv8129uwL9f5PMRBYc59w=;
 b=YN2wH860BR1s3q5EnTG1UtP84i5wcBN9Z033Db+BI51brjVvP2ndKq5ky0m4OCoA5Z45ORQWXQ94Gyrka1T+4HP7x3tNoiSFhxcD3hmsrx11ZLzxO3/pvKiJXXTJBcZdzwDP3pM25qpMzdSUhdUsMgqwj8NDzQRD/t70vj1EksQ=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5145.eurprd08.prod.outlook.com (2603:10a6:10:eb::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 15:46:36 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 15:46:36 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "jdmason@kudzu.us" <jdmason@kudzu.us>, Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] meta-arm: Add UEFI EDK2 support for Arm platforms
Thread-Topic: [meta-arm] [PATCH] meta-arm: Add UEFI EDK2 support for Arm
 platforms
Thread-Index: AQHWP0FTbq8TcF97LE2HTiBxOpi3BKjTVv4AgAActgCAAByXmQ==
Date: Thu, 11 Jun 2020 15:46:36 +0000
Message-ID: 
 <DB8PR08MB4969C10F23F416CF55ADD288FA800@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: <20200610160758.9902-1-khasim.mohammed@arm.com>
 <3097.1591878054403513670@lists.yoctoproject.org>,<20200611140339.GD17598@kudzu.us>
In-Reply-To: <20200611140339.GD17598@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [223.186.138.81]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13d056df-a3c2-487d-f9fb-08d80e1ea3ce
x-ms-traffictypediagnostic: DB8PR08MB5145:|HE1PR0802MB2489:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB24894C1500F3DF0137AC9E3CFA800@HE1PR0802MB2489.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:9508;
x-forefront-prvs: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CBxmO/0SO6qxVDRN+68ZItI7on7PSYKJFr1zyC7PVDIJaHQ+w0q+s2/v83j8EU7f3PQ2Zi5Uz80q6dFnMhfTH+Ma2O7vsUPPvBR1hgLbeStCRXu2EOmM+0LnOQNtuFhDgOgsmNPPh0Yy8ljmKu5IeBiQkCb88u5mTEX2UFt7mpDqbxYYrYRnjC2qn8ugAQ9CvqyUG8kA8bWwDIWCs43lrp2+RRDZxVT9jCDUXy9wjFuztIu/xxTO8GvATJ/6cuQlqh9PuoSs+oI6kbs+3pT7XAPj4ACP9ZZo+P9d3W0ugoF9TQTMRDZwljHpfoKfGrr0IxL2b6/V0eRRXUJInsCVedynPabtkx4HjVKvihHHidomAPaYHpVpav0wMDvKbK6kIj5beZBJKb+unhMWXPOwDA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(55016002)(26005)(71200400001)(2906002)(9686003)(186003)(7696005)(53546011)(33656002)(6506007)(86362001)(66476007)(5660300002)(110136005)(66556008)(6636002)(66946007)(83380400001)(8676002)(64756008)(478600001)(91956017)(4326008)(45080400002)(66446008)(76116006)(8936002)(316002)(166002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 ZdyfYwzhQFei4S5NJIzHReDEVStKx6sCaFyNsNLoXweEPdZSmMEpgOqPqrjYkWPax1PDCwLefKplFQPct+Z9wlbQ7N0UuQib3gfq+nrHN4+ZYuY7kBL03PaIJoKzqng/wLPn2dd0HWIKrvWHjB0RcycxxHrj/5XnihludtQeubnFk5eCVng+vWsvPUDHiQQTdRDfFHyXDpqx83cK26Ym2FfKcV6r/2Yee8tucR5txMC2LYMp9Kmn/GQ6eovD2/v7DXfwEymwP6RzkE2iZLHJcH77/3XsD+xMUI6hSqwU0xyGzD9mxqv/FAHj7+L4uecQE+q3damiMy2OnOq4/Lb0hLDhkZB32OYOam0mZiZ9y1YkUIPOw1PEfAuJDUHaVVAWvwqFJ0PUT2XY7umzQC/VdGMS1WzFdsXgZ97j+7hWxC0dujzZDSpvXZVQbfHHDcywxQnphIfFoCr6gzzC1daqGu0Ag6/zbfaGAckwgDCKj78=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5145
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966005)(81166007)(47076004)(82310400002)(83380400001)(5660300002)(2906002)(8676002)(8936002)(166002)(33656002)(30864003)(82740400003)(70206006)(70586007)(15974865002)(356005)(52536014)(86362001)(478600001)(110136005)(45080400002)(186003)(7696005)(26005)(4326008)(9686003)(6506007)(6636002)(53546011)(336012)(55016002)(316002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	86395d1d-0769-4343-b60e-08d80e1e9fdf
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/bPqKoKFRJDyf+nmz+wPXlHPkt5mEb4xYmKRagGKJ3xo1ulHogrqgI5mAzYByp2skh3qGxgoLbEQ2cYAeytPz2XOSNPC4vHScXgD90tRgARcD9FccfySienRL8cm5ehoZ6YR/x7QZXIWQiPN0qpPYmJ6CXOQZGf0wXYnp3MIBblUUufjtvpuRTil/pKy2B83JOvVqE/qR5+ZvDyO+B9/7xqOLTJHPqkhxPQbCK5ebTlZ092K47kvwIUyC9VEda3eYfo4wLhwmMteYw/+2CM5dgmjEtcYkenT+k9C4G0yJNBHVUF5UYIYtZSzR+23XMDrnhXtAzHc64YYEqw/ccLkGjvIz71Yz2LqmzgcNO3Xw3QaUsZg2Hm90kTTnX1e64bjLkFf07Jr0nHHp6mrDqhTRS0l2AOaiDNP/bydY6YaZcGkMJhrF8HgqzdtNvXTk74/h89ph/Ql3UbsOMLDg6tYsGZ9vNBeGkJfJkPP7VwkBtc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 15:46:43.2903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d056df-a3c2-487d-f9fb-08d80e1ea3ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2489
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB8PR08MB4969C10F23F416CF55ADD288FA800DB8PR08MB4969eurp_"

--_000_DB8PR08MB4969C10F23F416CF55ADD288FA800DB8PR08MB4969eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Please apply this patch to dunfell branch as well.

Thanks

Regards

Khasim

Sent from Outlook Mobile<https://aka.ms/blhgte>
________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Jon Mason via lists.yoctoproject.org <jdmason=3Dkudzu.us@lists.yo=
ctoproject.org>
Sent: Thursday, June 11, 2020 7:33:40 PM
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] meta-arm: Add UEFI EDK2 support for Arm pla=
tforms

On Thu, Jun 11, 2020 at 05:20:54AM -0700, Diego Sueiro wrote:
> On Wed, Jun 10, 2020 at 05:08 PM, Khasim Mohammed wrote:
>
> >
> > EDK2 Project is a modern, feature-rich, cross-platform
> > firmware development environment for the UEFI specifications
> > from www.uefi.org<http://www.uefi.org>.
> >
> > This patch adds a new recipe to fetch, configure and build
> > UEFI EDK2 firmware for Arm platforms.
> >
> > Change-Id: Icfb157e5b68d87accfd4290f522fc529fe4e849e
> > Issue-Id: PLATFORMS-3134
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
>
> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

Applied to the master branch.

Thanks,
Jon

>
> > ---
> >  meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 81 +++++++++++++++++++
> >  .../recipes-bsp/uefi/edk2-firmware_git.bb     | 19 +++++
> >  2 files changed, 100 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> >  create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> >
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > new file mode 100644
> > index 0000000..7b9327c
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
> > @@ -0,0 +1,81 @@
> > +SUMMARY =3D "UEFI EDK2 Firmware"
> > +
> > +PROVIDES +=3D "virtual/uefi-firmware"
> > +
> > +EDK2_BUILD_RELEASE   ?=3D "0"
> > +EDK2_PLATFORM        ?=3D "invalid"
> > +EDK2_PLATFORM_DSC    ?=3D ""
> > +EDK2_BIN_NAME        ?=3D ""
> > +EDK2_ARCH            ?=3D ""
> > +
> > +EDK2_BUILD_MODE =3D "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', '=
RELEASE',
> > 'DEBUG', d)}"
> > +
> > +DEPENDS +=3D "util-linux-native iasl-native"
> > +
> > +inherit python3native
> > +inherit deploy
> > +
> > +B =3D "${WORKDIR}/build"
> > +S =3D "${WORKDIR}/git"
> > +
> > +COMPATIBLE_MACHINE ?=3D "invalid"
> > +
> > +LDFLAGS[unexport] =3D "1"
> > +
> > +# No configure
> > +do_configure[noexec] =3D "1"
> > +
> > +# Set variables as per envsetup
> > +export GCC5_AARCH64_PREFIX =3D "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}"
> > +export PACKAGES_PATH       =3D "${S}/edk2:${S}/edk2/edk2-platforms"
> > +export WORKSPACE           =3D "${S}/edk2"
> > +export EDK_TOOLS_PATH      =3D "${WORKSPACE}/BaseTools"
> > +export PYTHON_COMMAND      =3D "${PYTHON}"
> > +export CONF_PATH           =3D "${WORKSPACE}/Conf"
> > +
> > +export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
> > +
> > +python __anonymous() {
> > +    # If GCC Version is greater than 4 then pass GCC5
> > +    # set GCC5 by default
> > +    d.setVar('GCC_VER', 'GCC5')
> > +
> > +    # Otherwise pass the corresponding version
> > +    G =3D d.getVar('GCCVERSION',True).split(".")
> > +    gcc_vlist =3D ['1', '2', '3', '4']
> > +    if G[0] in gcc_vlist:
> > +        d.setVar('GCC_VER', 'GCC'+G[0])
> > +}
> > +
> > +do_compile() {
> > +    # Copy the templates as we don't run envsetup
> > +    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template
> > ${WORKSPACE}/Conf/build_rule.txt
> > +    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template
> > ${WORKSPACE}/Conf/tools_def.txt
> > +    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target=
.txt
> > +
> > +    # Build basetools
> > +    oe_runmake -C ${S}/edk2/BaseTools
> > +
> > +    PATH=3D"${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
> > +    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
> > +       -a "${EDK2_ARCH}" \
> > +       -b ${EDK2_BUILD_MODE} \
> > +       -t ${GCC_VER} \
> > +       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
> > +}
> > +
> > +do_install() {
> > +    install -d ${D}/firmware
> > +    install
> > "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${ED=
K2_BIN_NAME}"
> > "${D}/firmware/uefi.bin"
> > +}
> > +
> > +FILES_${PN} =3D "/firmware"
> > +SYSROOT_DIRS +=3D "/firmware"
> > +# Skip QA check for relocations in .text of elf binaries
> > +INSANE_SKIP_${PN} =3D "textrel"
> > +
> > +do_deploy() {
> > +    # Copy the images to deploy directory
> > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > +}
> > +addtask deploy after do_install
> > diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> > b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> > new file mode 100644
> > index 0000000..4aadc3c
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
> > @@ -0,0 +1,19 @@
> > +DESCRIPTION =3D "UEFI EDK2 Firmware for Arm reference platforms"
> > +HOMEPAGE =3D "https://github.com/tianocore/edk2"
> > +
> > +LICENSE =3D "BSD-2-Clause-Patent"
> > +
> > +# EDK2
> > +LIC_FILES_CHKSUM =3D
> > "file://edk2/License.txt;md5=3D2b415520383f7964e96700ae12b4570a"
> > +# EDK2 Platforms
> > +LIC_FILES_CHKSUM +=3D
> > "file://edk2/edk2-platforms/License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
> > +
> > +SRC_URI ?=3D "\
> > +
> > git://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}/edk2;=
nobranch=3D1
> > \
> > +
> > git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;des=
tsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1
> > \
> > +"
> > +SRCREV_edk2           ?=3D "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
> > +SRCREV_edk2-platforms ?=3D "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
> > +SRCREV_FORMAT         =3D "edk2_edk2-platforms"
> > +
> > +require edk2-firmware.inc
> > --
> > 2.17.1
> >
> >

>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DB8PR08MB4969C10F23F416CF55ADD288FA800DB8PR08MB4969eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Hi Jon,</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Please apply this patch to dunfell branch as well.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Thanks</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Regards</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
 text-align: left;" dir=3D"auto">
Khasim</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
Sent from <a href=3D"https://aka.ms/blhgte">Outlook Mobile</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-arm@lists.yoctop=
roject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Jon Mason v=
ia lists.yoctoproject.org &lt;jdmason=3Dkudzu.us@lists.yoctoproject.org&gt;=
<br>
<b>Sent:</b> Thursday, June 11, 2020 7:33:40 PM<br>
<b>To:</b> Diego Sueiro &lt;Diego.Sueiro@arm.com&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Subject:</b> Re: [meta-arm] [PATCH] meta-arm: Add UEFI EDK2 support for =
Arm platforms</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, Jun 11, 2020 at 05:20:54AM -0700, Diego Su=
eiro wrote:<br>
&gt; On Wed, Jun 10, 2020 at 05:08 PM, Khasim Mohammed wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; EDK2 Project is a modern, feature-rich, cross-platform<br>
&gt; &gt; firmware development environment for the UEFI specifications<br>
&gt; &gt; from <a href=3D"http://www.uefi.org">www.uefi.org</a>.<br>
&gt; &gt; <br>
&gt; &gt; This patch adds a new recipe to fetch, configure and build<br>
&gt; &gt; UEFI EDK2 firmware for Arm platforms.<br>
&gt; &gt; <br>
&gt; &gt; Change-Id: Icfb157e5b68d87accfd4290f522fc529fe4e849e<br>
&gt; &gt; Issue-Id: PLATFORMS-3134<br>
&gt; &gt; Signed-off-by: Khasim Syed Mohammed &lt;khasim.mohammed@arm.com&g=
t;<br>
&gt; <br>
&gt; Reviewed-by: Diego Sueiro &lt;diego.sueiro@arm.com&gt;<br>
<br>
Applied to the master branch.<br>
<br>
Thanks,<br>
Jon<br>
<br>
&gt; <br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta-arm/recipes-bsp/uefi/edk2-firmware.inc&nbsp;&nbsp; | 8=
1 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; .../recipes-bsp/uefi/edk2-firmware_git.bb&nbsp;&nbsp;&nbsp;=
&nbsp; | 19 &#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; 2 files changed, 100 insertions(&#43;)<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware.=
inc<br>
&gt; &gt;&nbsp; create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_=
git.bb<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc<br>
&gt; &gt; b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..7b9327c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc<br>
&gt; &gt; @@ -0,0 &#43;1,81 @@<br>
&gt; &gt; &#43;SUMMARY =3D &quot;UEFI EDK2 Firmware&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;PROVIDES &#43;=3D &quot;virtual/uefi-firmware&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;EDK2_BUILD_RELEASE&nbsp;&nbsp; ?=3D &quot;0&quot;<br>
&gt; &gt; &#43;EDK2_PLATFORM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?=3D=
 &quot;invalid&quot;<br>
&gt; &gt; &#43;EDK2_PLATFORM_DSC&nbsp;&nbsp;&nbsp; ?=3D &quot;&quot;<br>
&gt; &gt; &#43;EDK2_BIN_NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ?=3D=
 &quot;&quot;<br>
&gt; &gt; &#43;EDK2_ARCH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ?=3D &quot;&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;EDK2_BUILD_MODE =3D &quot;${@bb.utils.contains('EDK2_BUILD_R=
ELEASE', '1', 'RELEASE',<br>
&gt; &gt; 'DEBUG', d)}&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;DEPENDS &#43;=3D &quot;util-linux-native iasl-native&quot;<b=
r>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;inherit python3native<br>
&gt; &gt; &#43;inherit deploy<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;B =3D &quot;${WORKDIR}/build&quot;<br>
&gt; &gt; &#43;S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;COMPATIBLE_MACHINE ?=3D &quot;invalid&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;LDFLAGS[unexport] =3D &quot;1&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;# No configure<br>
&gt; &gt; &#43;do_configure[noexec] =3D &quot;1&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;# Set variables as per envsetup<br>
&gt; &gt; &#43;export GCC5_AARCH64_PREFIX =3D &quot;${STAGING_BINDIR_TOOLCH=
AIN}/${TARGET_PREFIX}&quot;<br>
&gt; &gt; &#43;export PACKAGES_PATH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=
 &quot;${S}/edk2:${S}/edk2/edk2-platforms&quot;<br>
&gt; &gt; &#43;export WORKSPACE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D &quot;${S}/edk2&quot;<br>
&gt; &gt; &#43;export EDK_TOOLS_PATH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quo=
t;${WORKSPACE}/BaseTools&quot;<br>
&gt; &gt; &#43;export PYTHON_COMMAND&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quo=
t;${PYTHON}&quot;<br>
&gt; &gt; &#43;export CONF_PATH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =3D &quot;${WORKSPACE}/Conf&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;export BTOOLS_PATH =3D &quot;${EDK_TOOLS_PATH}/BinWrappers/P=
osixLike&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;python __anonymous() {<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; # If GCC Version is greater than 4 then p=
ass GCC5<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; # set GCC5 by default<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; d.setVar('GCC_VER', 'GCC5')<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; # Otherwise pass the corresponding versio=
n<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; G =3D d.getVar('GCCVERSION',True).split(&=
quot;.&quot;)<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; gcc_vlist =3D ['1', '2', '3', '4']<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; if G[0] in gcc_vlist:<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.setVar('GCC_VER=
', 'GCC'&#43;G[0])<br>
&gt; &gt; &#43;}<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;do_compile() {<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; # Copy the templates as we don't run envs=
etup<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; cp ${EDK_TOOLS_PATH}/Conf/build_rule.temp=
late<br>
&gt; &gt; ${WORKSPACE}/Conf/build_rule.txt<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; cp ${EDK_TOOLS_PATH}/Conf/tools_def.templ=
ate<br>
&gt; &gt; ${WORKSPACE}/Conf/tools_def.txt<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; cp ${EDK_TOOLS_PATH}/Conf/target.template=
 ${WORKSPACE}/Conf/target.txt<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; # Build basetools<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; oe_runmake -C ${S}/edk2/BaseTools<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; PATH=3D&quot;${WORKSPACE}:${BTOOLS_PATH}:=
$PATH&quot; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; &quot;${S}/edk2/BaseTools/BinWrappers/Pos=
ixLike/build&quot; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -a &quot;${EDK2_ARCH}&q=
uot; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -b ${EDK2_BUILD_MODE} \=
<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -t ${GCC_VER} \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -p &quot;${S}/edk2/edk2=
-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}&quot;<br>
&gt; &gt; &#43;}<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;do_install() {<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}/firmware<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; install<br>
&gt; &gt; &quot;${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_V=
ER}/FV/${EDK2_BIN_NAME}&quot;<br>
&gt; &gt; &quot;${D}/firmware/uefi.bin&quot;<br>
&gt; &gt; &#43;}<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;FILES_${PN} =3D &quot;/firmware&quot;<br>
&gt; &gt; &#43;SYSROOT_DIRS &#43;=3D &quot;/firmware&quot;<br>
&gt; &gt; &#43;# Skip QA check for relocations in .text of elf binaries<br>
&gt; &gt; &#43;INSANE_SKIP_${PN} =3D &quot;textrel&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;do_deploy() {<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; # Copy the images to deploy directory<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; cp -rf ${D}/firmware/* ${DEPLOYDIR}/<br>
&gt; &gt; &#43;}<br>
&gt; &gt; &#43;addtask deploy after do_install<br>
&gt; &gt; diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb<br>
&gt; &gt; b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..4aadc3c<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb<=
br>
&gt; &gt; @@ -0,0 &#43;1,19 @@<br>
&gt; &gt; &#43;DESCRIPTION =3D &quot;UEFI EDK2 Firmware for Arm reference p=
latforms&quot;<br>
&gt; &gt; &#43;HOMEPAGE =3D &quot;<a href=3D"https://github.com/tianocore/e=
dk2">https://github.com/tianocore/edk2</a>&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;LICENSE =3D &quot;BSD-2-Clause-Patent&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;# EDK2<br>
&gt; &gt; &#43;LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;<a href=3D"file://edk2/License.txt;md5=3D2b415520383f7964e9=
6700ae12b4570a">file://edk2/License.txt;md5=3D2b415520383f7964e96700ae12b45=
70a</a>&quot;<br>
&gt; &gt; &#43;# EDK2 Platforms<br>
&gt; &gt; &#43;LIC_FILES_CHKSUM &#43;=3D<br>
&gt; &gt; &quot;<a href=3D"file://edk2/edk2-platforms/License.txt;md5=3D2b4=
15520383f7964e96700ae12b4570a">file://edk2/edk2-platforms/License.txt;md5=
=3D2b415520383f7964e96700ae12b4570a</a>&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;SRC_URI ?=3D &quot;\<br>
&gt; &gt; &#43;&nbsp;&nbsp; <br>
&gt; &gt; git://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}=
/edk2;nobranch=3D1<br>
&gt; &gt; \<br>
&gt; &gt; &#43;&nbsp;&nbsp; <br>
&gt; &gt; git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platfor=
ms;destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1<br>
&gt; &gt; \<br>
&gt; &gt; &#43;&quot;<br>
&gt; &gt; &#43;SRCREV_edk2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; ?=3D &quot;6ff7c838d09224dd4e4c9b5b93152d8db1b19740&quot;<br>
&gt; &gt; &#43;SRCREV_edk2-platforms ?=3D &quot;ed4cc8059ec551032f0d8b8c172=
e9ec19214a638&quot;<br>
&gt; &gt; &#43;SRCREV_FORMAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; =3D &quot;edk2_edk2-platforms&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;require edk2-firmware.inc<br>
&gt; &gt; -- <br>
&gt; &gt; 2.17.1<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
&gt; <br>
<br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB8PR08MB4969C10F23F416CF55ADD288FA800DB8PR08MB4969eurp_--
