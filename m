Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web10.12153.1592810109670510910
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 00:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ac8/FRT2;
 spf=pass (domain: arm.com, ip: 40.107.20.87, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1ApCjIk/cjtuKDwjtdwJyV8zSjtEmatjtntBVGoKfA=;
 b=Ac8/FRT2y/YvSUl+GBmVasGv5wMP3Z937kTa7LNfJJ37+EDAA+9vxMjUIhBcXtqmMoUT0DCdv0Xmmn8XOO7GhQpGOOhG3aZAFoYLtMOwQyoFG3ElRUMmbz1xkpT3ayj5y8TCB8OgHXBSgwyvVSnXnHn92VIs8PZep6d1GqtHCzk=
Received: from DB6PR07CA0091.eurprd07.prod.outlook.com (2603:10a6:6:2b::29) by
 VE1PR08MB5056.eurprd08.prod.outlook.com (2603:10a6:803:116::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:15:06 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::cd) by DB6PR07CA0091.outlook.office365.com
 (2603:10a6:6:2b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.11 via Frontend
 Transport; Mon, 22 Jun 2020 07:15:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:15:06 +0000
Received: ("Tessian outbound da41658aa5d4:v59"); Mon, 22 Jun 2020 07:15:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5f8f2ac1db1bb4d
X-CR-MTA-TID: 64aa7808
Received: from 6482eab3eabf.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A0D29F80-99A1-4370-989A-EDD88A7C607D.1;
	Mon, 22 Jun 2020 07:15:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6482eab3eabf.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 07:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVxUPsdfeY1PX7y+ho9LR9iOPwFWHv8GZ7ktrSony2a31x3sZ3xAvYGomJbBUU02y1xiXbOBB1bltt3rGxZHDhJloKO6lUAZ3fFjVTD1CqN6AONdMaJ5TBFnpO+M7+2bMukXt65Lj3sH4pndtUBgBi9cH6T83Vy9p1EgMa7EMxz3YUj4brM5VQdnvJWREO9YCKhY1CvKgrsCnkldWUGZCbi19IaJ/DfpONBoRWOTWQofjHx99HXguxIj9zu1uH5Wnhk51z6x3dInAumjz2tTwaHndzPmY8k8J+O6YJ0qjubeTt8KNALs/Zv9J29sQehzE/ThbiOLvBIN6YJjhnkMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1ApCjIk/cjtuKDwjtdwJyV8zSjtEmatjtntBVGoKfA=;
 b=hM+azsxqr8eIIzOxV0YJBuZ2ObnPMF9U+ndzd70HLkKBBNbnPXrrNCJa+Cp7Pm3Jm1SGT8gyiSM9hVXyykhulPx0Rlua3SplJMrLhTtwxoWWLKNC1F9cbrR052eBF0WdqCuJ2vaXoWyHbSY5k8OD02UVky4ji8Y95GGKr1BAdHbngakfEkjgQCmPE2H4dpkrXn9fYivlBQs7wR7xhpnOi/RUm+mm0ikbRG2XRDqq/bOjO8BeFSAHt2/jyYzpnZC+mv6IiASF76qabpJ+2plq20mqqLJVJBHwUDN8F8o66jv7sK1JyJBvdCUJvvAhnqVTYgPU3Rti12wW8whCE0fthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1ApCjIk/cjtuKDwjtdwJyV8zSjtEmatjtntBVGoKfA=;
 b=Ac8/FRT2y/YvSUl+GBmVasGv5wMP3Z937kTa7LNfJJ37+EDAA+9vxMjUIhBcXtqmMoUT0DCdv0Xmmn8XOO7GhQpGOOhG3aZAFoYLtMOwQyoFG3ElRUMmbz1xkpT3ayj5y8TCB8OgHXBSgwyvVSnXnHn92VIs8PZep6d1GqtHCzk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2606.eurprd08.prod.outlook.com
 (2603:10a6:800:bb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:14:58 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Mon, 22 Jun
 2020 07:14:58 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH 4/6] arm: trusted-firmware-m: Add recipe
Date: Mon, 22 Jun 2020 09:13:59 +0200
Message-Id: <20200622071401.2570-5-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622071401.2570-1-gabor.abonyi@arm.com>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (217.140.99.251) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:14:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 12a89be3-a32d-454a-9e34-08d8167bfd63
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2606:|VE1PR08MB5056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB505635F9428A85BE8FB407078E970@VE1PR08MB5056.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 he0ev+kQXyuXfsZFmG1Jbq8jf6VRKM0UrCeZ5WoCbAFfOmHMPKcskdjU9blP8CnMS52LTJBsdJIrQ4NoDU+AAXYkuscy+kfLwWtDqGtQXZBUmZiTas8Sepk+kC39Im4JQVGFY+GtIE6aov8pjfqaUFEcNjyuPJP+tM7Kf5J3VY5WG23lBGU0Pg4LSDRWbZFNUTJNXC1wPElnvDgcC0pM6G0Pl87oUGRCmvEemx+JtrHa60K6UntjOVi8KS2Qfk7TmUq6fq7E6oNTxwdOt5IZh8tBpNqMFZYEF6Eb1VDC0ks6T0d9xbbSLn1KvYfRX8enJyPaOLLGCrByRJslfCl5QNCKwRCwCDfuWm+CGmljBsgrVUYDNAB3eFn9waoaCN58iFtOh8XwaXrkhhZyTm2k7A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(346002)(376002)(366004)(136003)(1076003)(316002)(2906002)(86362001)(478600001)(2616005)(44832011)(66476007)(66556008)(66946007)(6486002)(5660300002)(956004)(26005)(16526019)(8936002)(186003)(8676002)(52116002)(6916009)(7696005)(83380400001)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 SweNjzcSMTdE1snLB/kSo0wDvvgKU4f8TGCJSNmf5acRnb9rn+kFVV9NCAcr4WUQIOPeW2i3dHwpwgKedGKohPVD188/pNlAuPi6iFa27tV2HEktOFXSyp8xwfErsmTWkLp44beO5Lw4a3xyP9TGeMTAVhiYGeuHgaXE5kSzrSdcetVFg0CbHYKfvDNFgwhA5mxhl/TcFudJZPP8mresTDJ/X/4Qju0HL/7abFkt2PmnHUfPs4cmkz0Bczobqul1YjLdF0FigvFv9z1PUckehDGXuEVvnXCIY2i24Uktud2QASaJk8ggQJheORkEsUNF7YrVRHz73hqngh49mnVp0E8zn7dl5mUKT2o3Hnd6xwEZXCewB4b3BsXJTI26JgIRXB2/c1sHoEO/QeFzMFe/xG/hlt9E4SFI0f3fD2TCaCwBy9lS8gQfvWTY5fkFjlZKkA6snWRFmqP+P3gAcJPVm6b3Nxp+pm5TNfYjo/E4Bxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2606
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966005)(336012)(316002)(2906002)(86362001)(1076003)(956004)(5660300002)(478600001)(82310400002)(44832011)(6486002)(70206006)(70586007)(2616005)(16526019)(47076004)(26005)(8936002)(186003)(81166007)(82740400003)(8676002)(356005)(7696005)(4326008)(83380400001)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	93f037ce-6f75-414c-c391-08d8167bf8a3
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wGQnCujoU8FpLbDfLeKSUhnCc6t43udxBjMK8xpLkLlJxS+yZAh6b1KaBSWfyOxkyfhsbf33VQULABhB6EdPo23T45mgog66Q0t/8Vw5uT1JqHIm/1W6v2mfka4nHJvn7XjJtJGNLVGOEEDbzqbHFZGeJzuvKlfCMpa9Cz7lq9ZIvcvLgQG4VvGEW2Bov9C5iPxMXaXksS+XmaM6igzflygJc4UseOayLplh40NxGd3zp0X9V9t22+3pDwZLsVv3Pe8WyOTsBcu9tVUBfraVR9lheBjw47ZR0BhPCn5MvOd/QFYm1+2r8d3eZiD8W6AcXmN0ltBI9qEjXB2mKggBAfmLV9KRPodOMGwuPS+XJWNdDeW/M4Qv1zpYfoK1XP894tEyEJgZcR/wnI0dnhi+Y6E1+zPM5XFgV8zxVNxB9xDUeMhgVUZDGvojxQ4YEH2/00zfToDJL/brzwwWLXXrorDGkM6PIYin+LuE2eTsMas=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:15:06.0807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a89be3-a32d-454a-9e34-08d8167bfd63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5056
Content-Type: text/plain

Adds a recipe to pull down the trusted-firmware-m repository and the
ones it depends on. The recipe can either use gcc-arm-none-eabi-native
or armcompiler-native Clang toolchain to compile the firmware.

Change-Id: I37a4ba38982b5b1d387eccbb26bb5c79bddab0f7
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 meta-arm/conf/layer.conf                      |   1 +
 .../trusted-firmware-m/trusted-firmware-m.inc | 118 ++++++++++++++++++
 .../trusted-firmware-m_1.0.bb                 |  25 ++++
 3 files changed, 144 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 3341972..10a7951 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -11,5 +11,6 @@ BBFILE_PRIORITY_meta-arm = "6"
 
 LAYERDEPENDS_meta-arm = " \
     core \
+    arm-toolchain \
 "
 LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
new file mode 100644
index 0000000..a7c4319
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2020 Arm Limited
+#
+
+SUMMARY = "Trusted Firmware for Cortex-M"
+DESCRIPTION = "Trusted Firmware-M"
+HOMEPAGE = "https://git.trustedfirmware.org/trusted-firmware-m.git"
+PROVIDES = "virtual/trusted-firmware-m"
+
+inherit python3native cmake deploy
+
+TFM_DEPENDS ?= ""
+DEPENDS += "${TFM_DEPENDS}"
+DEPENDS += "python3-cryptography-native python3-pyasn1-native"
+DEPENDS += "python3-jinja2-native python3-cbor-native python3-pyyaml-native"
+
+S = "${WORKDIR}/git/tfm"
+# Sub-directory in which to build.
+BUILD_DIR = "cmake_build"
+B = "${S}/${BUILD_DIR}"
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+# Build for debug (set TFA_DEBUG to 1 to activate)
+TFM_DEBUG ?= "0"
+# Set target config
+TFM_CONFIG ?= "ConfigDefault.cmake"
+# Platform must be set for each machine
+TFM_PLATFORM ?= "invalid"
+
+# Uncomment, or copy these lines to your local.conf to use the Arm Clang compiler
+# from meta-arm-toolchain.
+# Please make sure to check the applicable license beforehand!
+#LICENSE_FLAGS_WHITELIST = "commercial_armcompiler-native"
+#TFM_COMPILER = "ARMCLANG"
+# Uncomment the line below to use the license from your host machine:
+#inherit armcompiler-host-license
+# Otherwise you have to set and export the following variables manually.
+# ARM_DS_DEFAULT_TOOLKIT_KEY, ARMLMD_LICENSE_FILE, LM_LICENSE_FILE
+
+# Setting GCC as the default TF-M compiler
+TFM_COMPILER ?= "GNUARM"
+DEPENDS += "${@'armcompiler-native' if d.getVar('TFM_COMPILER', True) == 'ARMCLANG' else 'gcc-arm-none-eabi-native'}"
+
+# Add platform parameters
+EXTRA_OECMAKE += "-DTARGET_PLATFORM=${TFM_PLATFORM}"
+
+# Add compiler parameters
+EXTRA_OECMAKE += "-DCOMPILER=${TFM_COMPILER}"
+
+# Handle TFM_DEBUG parameter
+EXTRA_OECMAKE += "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUILD_TYPE=Debug', '', d)}"
+EXTRA_OECMAKE += "-DPROJ_CONFIG=${S}/configs/${TFM_CONFIG}"
+
+# Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a standalone application
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+# This is needed because CMSIS_5 source package originally has .pack extension not .zip
+# and bitbake checks this dependency based on file extension
+do_unpack[depends] += "unzip-native:do_populate_sysroot"
+
+do_configure[prefuncs] += "do_check_config"
+do_check_config() {
+    if [ ! -f "${S}/configs/${TFM_CONFIG}" ]; then
+        bbfatal "Couldn't find config file '${TFM_CONFIG}' in '${S}/configs/'"
+    fi
+}
+
+do_configure() {
+    cd ${S}
+    python3 "tools/tfm_parse_manifest_list.py"
+
+    if [ ! -d "${B}" ]
+    then
+        install -d ${B}
+    else
+        rm -f ${B}/CMakeCache.txt
+    fi
+
+    cd ${B}
+    cmake -G"Unix Makefiles" --build ${S} ${EXTRA_OECMAKE}
+}
+
+do_compile() {
+    if [ -d "${B}" ]
+    then
+        oe_runmake -C ${B} install
+    else
+        bbfatal "TF-M CMake not generated!"
+    fi
+}
+
+do_install() {
+    if [ ! -d "${B}/install/outputs" ]
+    then
+        bbfatal "Output not found in '${B}/install/outputs'!"
+    fi
+
+    install -d -m 755 ${D}/firmware
+    cd ${B}/install/outputs
+    for dir in *;do
+        install -D -p -m 0644 $dir/* -t ${D}/firmware/$dir/
+    done
+}
+
+FILES_${PN} = "/firmware"
+SYSROOT_DIRS += "/firmware"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP_${PN} = "textrel"
+
+addtask deploy after do_install
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
new file mode 100644
index 0000000..5779c08
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -0,0 +1,25 @@
+# Trusted Firmware-M 1.0
+
+# TF-Mv1.0
+SRCREV_tfm = "TF-Mv1.0"
+LICENSE = "BSD-3-Clause & Apachev2"
+
+LIC_FILES_CHKSUM ?= "file://license.rst;md5=07f368487da347f3c7bd0fc3085f3afa"
+LIC_FILES_CHKSUM += "file://../mbed-crypto/LICENSE;md5=302d50a6369f5f22efdb674db908167a"
+LIC_FILES_CHKSUM += "file://../mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a"
+LIC_FILES_CHKSUM += "file://../CMSIS_5/LICENSE.txt;md5=c4082b6c254c9fb71136710391d9728b"
+
+SRC_URI  = "git://git.trustedfirmware.org/trusted-firmware-m.git;protocol=https;branch=master;name=tfm;destsuffix=${S}"
+SRC_URI += "git://github.com/ARMmbed/mbed-crypto.git;protocol=https;branch=development;name=mbed-crypto;destsuffix=${S}/../mbed-crypto"
+SRC_URI += "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=mbedtls-2.7;name=mbedtls;destsuffix=${S}/../mbedtls"
+SRC_URI += "https://github.com/ARM-software/CMSIS_5/releases/download/5.5.0/ARM.CMSIS.5.5.0.pack;name=cmsis;subdir=${S}/../CMSIS_5;downloadfilename=ARM.CMSIS.5.5.0.zip"
+
+SRC_URI[cmsis.md5sum] = "73b6cf6b4ab06ac099478e6cf983c08e"
+SRC_URI[cmsis.sha256sum] = "fc6e46c77de29ed05ef3bfd4846a2da49b024bc8854c876ac053aaa8d348ac52"
+
+SRCREV_FORMAT ?= "tfm_mbed-crypto_mbedtls_cmsis"
+SRCREV_mbed-crypto ?= "mbedcrypto-3.0.1"
+SRCREV_mbedtls ?= "mbedtls-2.7.14"
+SRCREV_cmsis ?= "5.5.0"
+
+require trusted-firmware-m.inc
-- 
2.17.1

