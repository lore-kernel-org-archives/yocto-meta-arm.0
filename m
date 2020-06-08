Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.51])
 by mx.groups.io with SMTP id smtpd.web12.34104.1591633811412874081
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Jun 2020 09:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PhvBGvVB;
 spf=pass (domain: arm.com, ip: 40.107.5.51, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M33eXXnb7I0SB6oXvEVdZCNxT1LkcNE3BnUCKnqqz8=;
 b=PhvBGvVBr1VpF42oxgU8wekbntW4awiDIKvclak3MEAESAw5TdgLvsncchucl7rCxFA+iwydgO64nKZmv0aRbbccxPoo8YO5ucIrRJWCjsPzw1suoWwRQVTAUiPa8YrjJpmu+prlvvnj7LDUqPQFxi9MiMr+JMAX5xTDcJxjkB8=
Received: from DB6P193CA0007.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::17) by
 DB7PR08MB3692.eurprd08.prod.outlook.com (2603:10a6:10:30::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.20; Mon, 8 Jun 2020 16:30:08 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::dc) by DB6P193CA0007.outlook.office365.com
 (2603:10a6:6:29::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Mon, 8 Jun 2020 16:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 16:30:08 +0000
Received: ("Tessian outbound fb809da9b456:v59"); Mon, 08 Jun 2020 16:30:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e506856fdfb2d68a
X-CR-MTA-TID: 64aa7808
Received: from 60721a8373f5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3C2700D7-A8CA-44B7-9DB9-200E72906677.1;
	Mon, 08 Jun 2020 16:30:03 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60721a8373f5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 08 Jun 2020 16:30:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wirlsv4fUxqZ/d+5UCIoke35dhgFyT1HZ3O+OJWlD1Ei6d/2QM65AaT8KoHneNrTwte7Ql+0yDAR/lOTCHawpHeiss6zwYa1TCfvFsrIFUnSWb/LvtFntuEP1v69Ofvk2sinhh6HQmodjtSCMdRIaJuZpcTAWKtoP3x0fRKGGNcoN5txsJZs7TlFbcWMm3s13jjR+/jwcJUC1KpfZe/YHCXa5xxJvhVxhqr+TzcLEGOvXDTlih0sdMKdwZKWA1AqXKDCweREVkmD07a2QgYYiH+zqT/+2k34LHWVrfdZUMGPbBfaTezub2e+6ZaTGcqzUjdC1yzG59aLXdZ1w8rORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M33eXXnb7I0SB6oXvEVdZCNxT1LkcNE3BnUCKnqqz8=;
 b=cpxF0ebaqd1lBRbMecD5iUGQSElldOoV6F68W6hNVqPnwyQ+XPOlxQSuhH+sFL1JKzXUMcoEcWVD7Ij2a7SidU6fB+IYPDWwzR4cs4sGutjiPMTSSuufoCeudvnUDSUXM6JdwWW1LcoeQASNb/2yWDIVHVi3xcRtJsLufDk9ZdUNCixEkumoIlZ16MpFZF1NrrI+ha1FKucjl2Zh4ZIcirAvIdHF2y7akg6SUMzj7lvzvgp2R22iLEdT+ZSvRoR/sSkYnQ5i5eh/YVexxEFVcpcItfsTLZAUCkoLncoM88VeUtGnraBu3gIryU6NZomGOGc9EaQ1Y8SL2AwFV4rC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M33eXXnb7I0SB6oXvEVdZCNxT1LkcNE3BnUCKnqqz8=;
 b=PhvBGvVBr1VpF42oxgU8wekbntW4awiDIKvclak3MEAESAw5TdgLvsncchucl7rCxFA+iwydgO64nKZmv0aRbbccxPoo8YO5ucIrRJWCjsPzw1suoWwRQVTAUiPa8YrjJpmu+prlvvnj7LDUqPQFxi9MiMr+JMAX5xTDcJxjkB8=
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5403.eurprd08.prod.outlook.com (2603:10a6:10:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Mon, 8 Jun
 2020 16:30:00 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3066.023; Mon, 8 Jun 2020
 16:30:00 +0000
Message-ID: <0ede12def629fe952cddcb122f879992ea0793f1.camel@arm.com>
Subject: Re: [meta-arm] [PATCH] meta-arm: Add SCP MCP build support
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com, Patrik Berglund
	 <patrik.berglund@arm.com>
Date: Mon, 08 Jun 2020 21:59:50 +0530
In-Reply-To: <20200608155014.GE15959@kudzu.us>
References: <20200602165244.27561-1-khasim.mohammed@arm.com>
	 <20200608155014.GE15959@kudzu.us>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-ClientProxiedBy: DM3PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:0:54::29) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.37.8.169] (217.140.96.140) by DM3PR11CA0019.namprd11.prod.outlook.com (2603:10b6:0:54::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Mon, 8 Jun 2020 16:29:57 +0000
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 606b9582-66c4-4627-b616-08d80bc93555
X-MS-TrafficTypeDiagnostic: DB8PR08MB5403:|DB7PR08MB3692:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB369211A728DF5704FB91BA38FA850@DB7PR08MB3692.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 042857DBB5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aRmbe21m/dXnNzITfeRbzaNVo/gQ62LgWvYvwM0297lILeZbSG6zNRJDnfLe9+tQvOvQw7Qa0osvw+AfKbf+KKFHjYcrHQLXVNha0QDNpfd0pCgI+8PRsmna+HVurmXsAOVEeB/ABC77xMzDmDlgAbp5ECa3xLYDvDo6AHU7XW676B4zAg6Qb3th7Bab2NchcO/1XKo+V65mO2FlTPp4QkebdJmiYP9SRRfju4V246IX3yrBYAXPDJGTmXGNcM6xwUhk/cGzS0RwMcIwWmxP2nkkR6K96PJwCTHLCvo64DyXpqNvPsL/NWJrPLJSjkJg0JLT1chn4pUyKvs8eOhN24sAIDT5xeWsVKnsKRINTroKsKSNK7HefjsxPi3im4hx+SEqBx88IlYcHsytJb7GA2rzGCtaviuSUdHgJoqfLnZ4KLnIBN30LN4ExkLKVQYP
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(966005)(2616005)(52116002)(8936002)(16526019)(6486002)(66476007)(186003)(86362001)(44832011)(478600001)(26005)(956004)(83380400001)(66946007)(316002)(8676002)(2906002)(6916009)(6666004)(66556008)(36756003)(16576012)(5660300002)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 WA9pzXGHy6OxK7v9KrITmOccXg+q57JwbbG7wtpI7w8HOlhHMs2v4DvFs2nC5vQ/2LKVk69urd4uGYCvKB09E9ccXAxRB+Ma/g+iGfcH8caQfLRdaEw3cLeWv6HiY6J30DteDCTEtMWUGrzLJ+vD7nf9v2gSoUSFBgGjw7nxeDPImgjF5SWTd4K2BA/u+A/cABAjZ9LNVliBddo3RMzboZv1gLOMQoIxzFby7MeAdwslbUqkp/qkPMJQBdXS84eUsW8bRWtLMhF+2h+GoH3UjZJTGn+eoYcJ++0PhTLpat1GyHHlx4R0LwmjCUUQossnp12M6D5KzI84O74NeBK5yzy0cU2x0ePF6UApwCKsXRcLWPn8/wZ8Bq2SzpZm2zPqUiHpX87pEHdUeFK+rYYDDsHnZ4upZl3jzeHItWmwf4iAEHb8H0G2852DwPZ2Lz7F2K5YMPTWpTXzAoWhUMG5exdgbH24xozrI+P79Vnk0ucAk55r/vpDnP4Q0aDZENoN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5403
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966005)(186003)(16526019)(26005)(4326008)(6862004)(966005)(6486002)(44832011)(16576012)(336012)(478600001)(316002)(8936002)(47076004)(70586007)(70206006)(82310400002)(83380400001)(81166007)(86362001)(82740400003)(2906002)(36756003)(6666004)(8676002)(956004)(2616005)(5660300002)(356005)(99106002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b345df87-dd3c-4edc-bea8-08d80bc93043
X-Forefront-PRVS: 042857DBB5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PFavKTrC0DEPkBkMuWkyhHSqwqzBKoFyN1pbxG8Quq+NzlE9yKXRLH32uk/kAhA1zv++0RpKPisDZ1v4VqV1/QBf6+rjua/mTBipRx6pW2dH+rbVfnZPySjM84CEyeCDPdcjn2Nr4lslRqvnNxwP0X/MhTX8WIgWSOgBCXgQtRU379lKAGeSpQu8mpibmqD5dZxp3mKkYn8jl11qReeOTWu1fs+1pQqWkS8pEY+H+NzMulor+B5dX9MR7Yfw3+8HdI7M9kxK38mUUAlIbb/sgaiqVbC1iMOcKCnMqqfbj7x1ov2USbl898qm4OlRmU3hQNiQjfRZnXhTfIzgVeTVd3i5SmPLOOki5dJ1k/zAdXcH5QQXdx4z0+mZ78W7/6XVqhI+kaPTT/lRVaY+fpHD6XC5WkyriXYVEptR/dLhs95207VhplAL6aBdIGHAbWxFUG1ekCpr3A9bEAX/f30Cy32E/sKmDgxL96Mbz17oLbdn40iwuH0ia0b5OhJsrql/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2020 16:30:08.3996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 606b9582-66c4-4627-b616-08d80bc93555
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3692
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Jon,

On Mon, 2020-06-08 at 11:50 -0400, Jon Mason wrote:
> On Tue, Jun 02, 2020 at 05:52:44PM +0100, Khasim Mohammed wrote:
> > SCP-firmware provides a software reference implementation for
> > the System Control Processor (SCP) and Manageability Control
> > Processor (MCP) components found in several Arm Compute
> > Sub-Systems.
> > 
> > This patch set adds support to fetch and build SCP and MCP
> > firmware binaries
> > 
> > Issue-Id: PLATFORMS-3134
> > 
> > Change-Id: Ic7259bb430c9e7e9711c9c8bc3283aafaacdf707
> > Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
> > Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
> 
> Pulled into master branch
> 

Can you please pull this on Dunfell branch as well ?

Thanks,

Khasim

> Thanks,
> Jon
> 
> > ---
> >  .../recipes-bsp/scp-firmware/scp-firmware.inc | 71
> > +++++++++++++++++++
> >  .../scp-firmware/scp-firmware_git.bb          | 20 ++++++
> >  2 files changed, 91 insertions(+)
> >  create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-
> > firmware.inc
> >  create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-
> > firmware_git.bb
> > 
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > new file mode 100644
> > index 0000000..1873848
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
> > @@ -0,0 +1,71 @@
> > +SUMMARY = "SCP and MCP Firmware"
> > +
> > +PROVIDES += "virtual/control-processor-firmware"
> > +
> > +SCP_BUILD_RELEASE   ?= "1"
> > +SCP_COMPILE_VERBOSE ?= "0"
> > +SCP_PLATFORM        ?= "invalid"
> > +SCP_COMPILER        ?= "arm-none-eabi"
> > +
> > +DEPENDS += "virtual/arm-none-eabi-gcc-native"
> > +
> > +SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1',
> > 'release', 'debug', d)}"
> > +SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0',
> > '', 'V=1', d)}"
> > +
> > +inherit python3native
> > +inherit deploy
> > +
> > +B = "${WORKDIR}/build"
> > +S = "${WORKDIR}/src"
> > +
> > +# Allow platform specific copying of only scp or both scp & mcp,
> > default to both
> > +FW_TARGETS ?= "scp mcp"
> > +
> > +COMPATIBLE_MACHINE ?= "invalid"
> > +
> > +LDFLAGS[unexport] = "1"
> > +
> > +# The gcc-arm-none-eabi version does not support -fmacro-prefix-
> > max
> > +DEBUG_PREFIX_MAP_pn-scp = "\
> > +    -fdebug-prefix-
> > map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> > +    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> > +    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> > +"
> > +
> > +# No configure
> > +do_configure[noexec] = "1"
> > +
> > +EXTRA_OEMAKE = "${SCP_COMP_STR} \
> > +                BUILD_PATH='${B}' \
> > +                PRODUCT='${SCP_PLATFORM}' \
> > +                MODE='${SCP_BUILD_STR}' \
> > +                CC='${SCP_COMPILER}-gcc' \
> > +                AR='${SCP_COMPILER}-ar' \
> > +                SIZE='${SCP_COMPILER}-size' \
> > +                OBJCOPY='${SCP_COMPILER}-objcopy' \
> > +                "
> > +
> > +do_compile() {
> > +    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
> > +}
> > +do_compile[cleandirs] += "${B}"
> > +
> > +do_install() {
> > +     install -d ${D}/firmware
> > +     for FW in ${FW_TARGETS}; do
> > +        for TYPE in ramfw romfw; do
> > +           install -D
> > "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYP
> > E}.bin" "${D}/firmware/"
> > +        done
> > +     done
> > +}
> > +
> > +FILES_${PN} = "/firmware"
> > +SYSROOT_DIRS += "/firmware"
> > +# Skip QA check for relocations in .text of elf binaries
> > +INSANE_SKIP_${PN} = "textrel"
> > +
> > +do_deploy() {
> > +    # Copy the images to deploy directory
> > +    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
> > +}
> > +addtask deploy after do_install
> > diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > new file mode 100644
> > index 0000000..5ff5859
> > --- /dev/null
> > +++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
> > @@ -0,0 +1,20 @@
> > +DESCRIPTION = "Firmware for SCP and MCP software reference
> > implementation"
> > +HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
> > +
> > +LICENSE = "BSD-3-Clause & Apache-2.0"
> > +
> > +# SCP
> > +LIC_FILES_CHKSUM =
> > "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731
> > "
> > +# CMSIS
> > +LIC_FILES_CHKSUM +=
> > "file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
> > +
> > +SRC_URI = "\
> > +    git://github.com/ARM-software/SCP-
> > firmware.git;protocol=https;name=scp;destsuffix=src;nobranch=1 \
> > +    git://github.com/ARM-
> > software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis
> > ;lfs=0;nobranch=1 \
> > +"
> > +
> > +SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
> > +SRCREV_cmsis  = "refs/tags/5.2.0"
> > +SRCREV_FORMAT = "scp_cmsis"
> > +
> > +require scp-firmware.inc
> > -- 
> > 2.17.1
> > 
> > 
> 
> 

