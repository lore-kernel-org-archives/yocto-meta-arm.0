Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADF9C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 09:53:14 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.54])
 by mx.groups.io with SMTP id smtpd.web11.82572.1673603584397704130
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 01:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=p7i0Yca/;
 spf=pass (domain: arm.com, ip: 40.107.104.54, mailfrom: emekcan.aras@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADEd53TVoN231+oF8OUJ5b3mC4I3/+nzJ8P5lnCuclk=;
 b=p7i0Yca/Q1Muuw3Viazru7LhW3zAgFmOx1Wj2Ld+CmpTD/asmk1Kh2LCeX0deWciEUR/J0hDC4HhY54Z548YyX+a3+0cE1jXumFz23BeXXzz11ZIfIBkiQBP/LIUU6ALhrDqp8/VsSRgvOgxwoATvsWa4a6EGx/0y7rQLWBPD9o=
Received: from FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::6) by
 AM9PR08MB5940.eurprd08.prod.outlook.com (2603:10a6:20b:281::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 09:53:01 +0000
Received: from VI1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::72) by FR3P281CA0090.outlook.office365.com
 (2603:10a6:d10:1f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 09:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT047.mail.protection.outlook.com (100.127.144.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 09:53:00 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Fri, 13 Jan 2023 09:53:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bb5b65ff355095d
X-CR-MTA-TID: 64aa7808
Received: from 98171678dec2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 47701E04-B0AF-4207-A209-5ED05FF52EE7.1;
	Fri, 13 Jan 2023 09:52:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98171678dec2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Jan 2023 09:52:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EP3jyvkDS1q3SfG0XAYWN11P9F6NA5fejnX/ZspkDr84rIUMZ2r/5A9eQBqj2o3MKeD42Q9kMwUmTnx3HYN5atBkk4TFwnsdhCAI0D5HZvk4WZ/jmEZZk3a5ViMnXeCQcB9eb/lJfkOznSSVtIu56DZ1TtbHv6fFH/J5H71x7p6BykqUgLRSRwBFfAmmI3xqc1icT3XmbxVlOtRlW5gSzrST3JH6q8hrO5/1tgPmsj2XWDbEXcg/NW7DceQw/+QW9H59K8rqyMgsrEzYA9k8LnW0nnDSKwvL4Q0hY78mXUknAgWu6Pgb2WPvFEitu78gpixxlwqcMKpcb5owiJyOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADEd53TVoN231+oF8OUJ5b3mC4I3/+nzJ8P5lnCuclk=;
 b=XqHOxxrKDcTWuOAyzfXeb/WnZetVmaspqQWW8tJrvgT73M/vu3CtSCUYWOvayVqVphBQRa8YqK2d7HYQBwaSkrNZVY0fv6fcPJ8aldKbo0EJ5BGakDEM619sElyXFOgZuV/dkKRuMub0fA1WCclnsiYnU1y6Zso0QDOPEp/Co+1UcGHQiatVP1BU4cJVOMoRqPFVwPOswSeAELoiKR4vHuXMCtjR6zbBceqIWagF/c/UoBFH4iPQOZNg8+m4aniHYuO/g24DiNcCXX7Yx5hC6zasvR8CtizEGzjS53Ol5SZdr5Un6pygZE+aRdT2aVg4NmLGiRCy6I5owxo6e/gL3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADEd53TVoN231+oF8OUJ5b3mC4I3/+nzJ8P5lnCuclk=;
 b=p7i0Yca/Q1Muuw3Viazru7LhW3zAgFmOx1Wj2Ld+CmpTD/asmk1Kh2LCeX0deWciEUR/J0hDC4HhY54Z548YyX+a3+0cE1jXumFz23BeXXzz11ZIfIBkiQBP/LIUU6ALhrDqp8/VsSRgvOgxwoATvsWa4a6EGx/0y7rQLWBPD9o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com (2603:10a6:10:f6::10)
 by PAXPR08MB6656.eurprd08.prod.outlook.com (2603:10a6:102:135::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 09:52:42 +0000
Received: from DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d]) by DBBPR08MB4838.eurprd08.prod.outlook.com
 ([fe80::3cd:ddee:ec77:e09d%7]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 09:52:42 +0000
Date: Fri, 13 Jan 2023 09:52:39 +0000
From: Emekcan Aras <emekcan.aras@arm.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, Jon.Mason@arm.com,
	nd@arm.com
Subject: Re: [meta-arm] [PATCH 2/5] arm/optee: support optee 3.19
Message-ID: <Y8Ep5xNEyubVMHRj@e126835.cambridge.arm.com>
References: <20221221143942.15196-1-emekcan.aras@arm.com>
 <20221221143942.15196-3-emekcan.aras@arm.com>
 <20230112175859.GZ22689@denix.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112175859.GZ22689@denix.org>
X-ClientProxiedBy: LO2P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::13) To DBBPR08MB4838.eurprd08.prod.outlook.com
 (2603:10a6:10:f6::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	DBBPR08MB4838:EE_|PAXPR08MB6656:EE_|VI1EUR03FT047:EE_|AM9PR08MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b339804-869d-4dd4-fa42-08daf54bf4e2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Jx0B5s55YkOlr+N/HLHbd7zRXBnMY74TjKOtaxHnEwbxVQbtfCDzs4XkefqeQE5TceSzryn3Sk2pkUe1lDB1BkTC1hX0S7hmJFI5/UN8xR+gd9wQUxhifWI4uNGXLjE3SZRnughudEgpo+LLayDtYpVV3maCvJz0F5lLTeepG4H7RbgY1g95qT8d86dAZgz1K0/gwXhboyNHATnQqbmnFyOOZFQu9f8mjvETK9myEL+LCPqNpG82V9gYw51hYhoTlVqzb1KtplsrCFrHyAZ2OfyZGuLlpDiy6CeyKz6YW4ey8FoXc8UR1OmC/OmSAKLoIyncCxlnJowr4byv48gExTFQE7p2CfDpuLgz7f1B2tpEiXOXEiQr8yLdI1oBGH+EsMIivHDP/FpcD7FB63R8L3MLS8tcGiw2nqGlUu+T3Y8mREsU9FVDus3FdAh1vPm9Oghoy+apjapHLaDHN5NvvnMzVzFfV3iS0QrfXeV9dRjkIilWxAavlmMfmhP1HQVs0Vg2HNqnMvMp0O4p2lh8KPCPiuP2An3zRfojwiHpxsnf8B3KmqmHm+5o6XL8plHS+7ZgfnVlitAotQBCY++4x+3cMvuwwStLXFZukU6InNwRbRbXZWGTUZK6Z06EnkWkMq9FPFf2q+GK8smcCRi18TLEkvYt92oHLN1xNyhkHaE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4838.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199015)(5660300002)(6666004)(316002)(6506007)(2906002)(38100700002)(6486002)(86362001)(44832011)(6512007)(186003)(478600001)(26005)(83380400001)(8936002)(4326008)(6916009)(8676002)(66946007)(66476007)(66556008)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6656
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d939aa13-ff19-481a-9acb-08daf54be9f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0R/sPxlPc9fr+m2EXh9IvKtv4wvm4/8rzBqRXgYCeEcvIyw5uNv8kZc6eSzjz4Cjie+RRTLP1TA3xWWr8r0dnuAs/lwaqaopYbNb1IcEodrf4YPwXmNNsedB26enW3OylxCKFDD/IuHaRPmVDcwnMO1RinUBbHU+3A5Ne9dLguxu2tbI5sXd0zX+7r90l+0Nedhzeh1GJJO5hRKNDc0/q85L93+NMutngrTJwdHQ8w4k8oUM1N1wgrWotF7Pt/lGpVU45iTZ9/e63+7PLJkd+3UP2UTxi3mEy4nxBLHmGcx0TMjBrhelvNrby4iqzFNmOOK8yEGhkoSddItQbY5Cq5D8zqR2Szr2a4MkQDQxrWXni3CLa0bkMvfCF/MW95ro6Um/gcWZiohrAOVBhOcD2aObCQ1c32AF+sDUWSECnrQDPj6tCF2IZ8aw8ggvylEkn8UeQsRA6djPSZ69ruDxQc+5KyC+qgcvdqP8yCC+PbfcMrwb0NCtqOUjamUheiWI5p2ggx0+Xoi4Lit1jxVCCMp6PjpLMFeWVO/tptIxRVWMgoOYUtvkbr4/Wxr++tULn2yiu6fJlYScZoigiWWs2fQsFLOzwV4+h33PPIFea8NCpnBgEiqruXtbqYbjFV1BQksBpUU1lc/KoJmyp9EO/n172vd7eiPyXr0uYjhVj6CH5cBpm6QEuTSNgZ1K4DKWta8RM237TRUSck5IM2cRwufT60mUdS/nc0/WPRFUNSw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(6666004)(6486002)(478600001)(356005)(86362001)(316002)(40480700001)(40460700003)(6512007)(82310400005)(81166007)(82740400003)(83380400001)(47076005)(336012)(26005)(6506007)(186003)(5660300002)(2906002)(44832011)(41300700001)(36860700001)(8676002)(70206006)(4326008)(6862004)(8936002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:53:00.5121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b339804-869d-4dd4-fa42-08daf54bf4e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5940
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 09:53:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4277

On Thu, Jan 12, 2023 at 12:58:59PM -0500, Denys Dmytriyenko wrote:
> On Wed, Dec 21, 2022 at 02:39:39PM +0000, emekcan.aras@arm.com wrote:
> > From: Emekcan Aras <emekcan.aras@arm.com>
> > 
> > From: Emekcan <emekcan.aras@arm.com>
> > 
> > This commits adds a recipe to support optee-os 3.19.
> > 
> > Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> 
> Unfortunately, this breaks downstream users with own bbappends and 
> customizations on top. Please pay close attention to the naming 
> conventions. Thanks.
> 
Sorry, I'll fix this.

> Also, what about updating optee-client, optee-test and optee-examples 
> to 3.19?
> 
> 
Hopefully, soon we'll update these as well
> > ---
> > diff --git a/meta-arm/recipes-security/optee/optee-os-3_19.inc b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> > new file mode 100644
> > index 00000000..8adb6996
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os-3_19.inc
> 
> While not critical, why does this inc file has "3_19" version in the name?
> 
Okay, I'll fix this.
> 
> > @@ -0,0 +1,82 @@
> > +SUMMARY = "OP-TEE Trusted OS"
> > +DESCRIPTION = "Open Portable Trusted Execution Environment - Trusted side of the TEE"
> > +HOMEPAGE = "https://www.op-tee.org/"
> > +
> > +LICENSE = "BSD-2-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
> > +
> > +inherit deploy python3native
> > +require optee.inc
> > +
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os-3_19:"
> 
> Now, this is critical - why is there "3_19" version in the directory name?
> 
Out-of-tree patches that applies to 3.18 and 3.19 is very similar (naming-wise)
but patches applies to different lines. In order to keep 3.18 patches, we needed
to add 3.19 as a seperate directory.
> 
> > +CVE_PRODUCT = "linaro:op-tee op-tee:op-tee_os"
> > +
> > +DEPENDS = "python3-pyelftools-native python3-cryptography-native"
> > +
> > +DEPENDS:append:toolchain-clang = " compiler-rt"
> > +
> > +SRC_URI = "git://github.com/OP-TEE/optee_os.git;branch=master;protocol=https"
> > +
> > +SRC_URI:append = " \
> > +    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > +    file://0007-allow-setting-sysroot-for-clang.patch \
> > +    file://0008-no-warn-rwx-segments.patch \
> > +   "
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +EXTRA_OEMAKE += " \
> > +    PLATFORM=${OPTEEMACHINE} \
> > +    CFG_${OPTEE_CORE}_core=y \
> > +    CROSS_COMPILE_core=${HOST_PREFIX} \
> > +    CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
> > +    NOWERROR=1 \
> > +    ta-targets=ta_${OPTEE_ARCH} \
> > +    O=${B} \
> > +"
> > +EXTRA_OEMAKE += " HOST_PREFIX=${HOST_PREFIX}"
> > +EXTRA_OEMAKE += " CROSS_COMPILE64=${HOST_PREFIX}"
> > +
> > +CFLAGS[unexport] = "1"
> > +LDFLAGS[unexport] = "1"
> > +CPPFLAGS[unexport] = "1"
> > +AS[unexport] = "1"
> > +LD[unexport] = "1"
> > +
> > +do_compile:prepend() {
> > +	PLAT_LIBGCC_PATH=$(${CC} -print-libgcc-file-name)
> > +}
> > +
> > +do_compile() {
> > +    oe_runmake -C ${S} all
> > +}
> > +do_compile[cleandirs] = "${B}"
> > +
> > +do_install() {
> > +    #install core in firmware
> > +    install -d ${D}${nonarch_base_libdir}/firmware/
> > +    install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> > +}
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +do_deploy() {
> > +    install -d ${DEPLOYDIR}/${MLPREFIX}optee
> > +    install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/${MLPREFIX}optee
> > +}
> > +
> > +addtask deploy before do_build after do_install
> > +
> > +SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> > +
> > +FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> > +
> > +# note: "textrel" is not triggered on all archs
> > +INSANE_SKIP:${PN} = "textrel"
> > +# Build paths are currently embedded
> > +INSANE_SKIP:${PN} += "buildpaths"
> > +INSANE_SKIP:${PN}-dev = "staticdev"
> > +INHIBIT_PACKAGE_STRIP = "1"
> > +
> > diff --git a/meta-arm/recipes-security/optee/optee-os_3.19.0.bb b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
> > new file mode 100644
> > index 00000000..9ad8a148
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os_3.19.0.bb
> > @@ -0,0 +1,5 @@
> > +require optee-os-3_19.inc
> > +
> > +DEPENDS += "dtc-native"
> > +
> > +SRCREV = "afacf356f9593a7f83cae9f96026824ec242ff52"
> > -- 
> > 2.17.1

