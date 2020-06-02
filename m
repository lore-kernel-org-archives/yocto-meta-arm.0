Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.58])
 by mx.groups.io with SMTP id smtpd.web11.414.1591116783030138355
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 09:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3Akv9vG0;
 spf=pass (domain: arm.com, ip: 40.107.21.58, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UHV7aES+P/e/96F799LR1ytUSW4Lhim3B0nLWjIFR4=;
 b=3Akv9vG0ibsrmqiVUGdbWJnPjA13CLZXwSSBxdEohAQWoR7QZPWZbiXiAnlfLqjlpG+hjG5VhLgmFwWbf/a+y61HhRq56Dkn0bSxS7YCU9trEiOzxqweDOogf+WxKwIk/vn8LC4piHAp+Lz3i5XKy636Q22Vk2A/72A6FoQXumQ=
Received: from AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39)
 by VE1PR08MB5229.eurprd08.prod.outlook.com (2603:10a6:802:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Tue, 2 Jun
 2020 16:53:00 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::6) by AM6PR02CA0026.outlook.office365.com
 (2603:10a6:20b:6e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Tue, 2 Jun 2020 16:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Tue, 2 Jun 2020 16:52:59 +0000
Received: ("Tessian outbound 444e8e881ac1:v57"); Tue, 02 Jun 2020 16:52:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ca048116b3ebbec
X-CR-MTA-TID: 64aa7808
Received: from 5182708f10a4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DDF8BEC1-12E3-4B17-99CA-60991A644CE0.1;
	Tue, 02 Jun 2020 16:52:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5182708f10a4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 02 Jun 2020 16:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEeYx1DM3b5akVfg2+TAg9FQf4A9/CDQ3j7ZRsPT8VCDBc8mPlqMaDBngcbDd3Krud350Z/O9H10KB2TcITCSsMy3rB+TAk4tflchJbBCpb+ePiycl0rJ3jKxOCCW0VmU2KtmzNFnAiOrWOxuqINS5Arwsoy1fVAw6zjqykn1D3AAgEn2dnD61gKN70aNV+wwufq2Po0l/egkHkyuEvnx7V2z0fZiW2ceBwiVSyhdTDJKiMx7ZkiHtRxSP173zUps9XXIfz8EhE0rdFz0DUOqn1EJJSsO1ptIqM1rz16x2cTpHIk9W1u39TwbvisLP3eDZrEb5KJCs6XDTa+JXDOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UHV7aES+P/e/96F799LR1ytUSW4Lhim3B0nLWjIFR4=;
 b=lpH4IhThxux7aUyNj4YdTrzuZ6NmQ32OM7ot6NK6/k2QqetsNe1Vx3oCh5ittjN2wRs8DcZ8bXc0M2rdhAHpb8blJUq5MsuITu/Y0j9CF/oJh50I23OrYdvS9nEpgshu4s9xO9PK/RlQW+MBEy6qTW6ZmCQ7SWsaQSgLkXtqY2YUTg4JXyFp2Ec62fpuzpJIzUVSS+lAzvJGm7yzEBX7p/oqIOu0EaPEiXJjZunIfJrDh2C0Ba7IGRiBKnOeJRZUSC4KDW8T6mJiAhm4q2aCXSaU5ZM9+JrrNb8pPoz+oui5GbwVESAS45t+Rsr+WvhjDQw+qpzDj6E6CBypiKHvoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UHV7aES+P/e/96F799LR1ytUSW4Lhim3B0nLWjIFR4=;
 b=3Akv9vG0ibsrmqiVUGdbWJnPjA13CLZXwSSBxdEohAQWoR7QZPWZbiXiAnlfLqjlpG+hjG5VhLgmFwWbf/a+y61HhRq56Dkn0bSxS7YCU9trEiOzxqweDOogf+WxKwIk/vn8LC4piHAp+Lz3i5XKy636Q22Vk2A/72A6FoQXumQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5034.eurprd08.prod.outlook.com (2603:10a6:10:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Tue, 2 Jun
 2020 16:52:53 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:52:53 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Patrik Berglund <patrik.berglund@arm.com>
Subject: [PATCH] meta-arm: Add SCP MCP build support
Date: Tue,  2 Jun 2020 17:52:44 +0100
Message-Id: <20200602165244.27561-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::24) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sudpau01.cambridge.arm.com (217.140.106.54) by LO2P123CA0012.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend Transport; Tue, 2 Jun 2020 16:52:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15e866b9-60fa-46d5-f18c-08d807156856
X-MS-TrafficTypeDiagnostic: DB8PR08MB5034:|VE1PR08MB5229:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5229F699C2684C4A76A1DD2FFA8B0@VE1PR08MB5229.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7/gqSk3smJ7nHMoMsBK1Kx3BRbO1mr5EQh3mBx0QXde3kMrOFzwE0qRkMVvikpmsrLt/xkHPVzGCOwRFJcYXANxiTzQQ/oIgA1fKiSg8aMg7VqIpwIbwSrL8x3phlQRmPNXYNs57t8HZHRSVsmDpwTp5LvCECxWnhe5aygDomcnk5iefBEdbdDtney4llH7Sypgw7j4ZbIsQpfeYFgH4JL0pl0o454ZDItNTC1f/wJvM38GwpeyncRnmFfVDlyszH4ltkwHYyzJ+JOUd7QBdNKM7YU+CtquyJtBdkX1w3Js0ufnyhV9IJ9MbOW5vGIP9u/qru1J+dcOFLE4LPNnT039ltUaJUhCqn8qABxTMCw7U7lPupckz0eBdhdGcp5bf+kK2ZRrAGPjKi2RE/PVkbA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(956004)(2906002)(4326008)(2616005)(478600001)(36756003)(86362001)(66556008)(7696005)(26005)(8676002)(52116002)(6916009)(66946007)(66476007)(6666004)(8936002)(1076003)(316002)(5660300002)(16526019)(186003)(6486002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 WzZWmcGBawfQEuUIqh0psicMIa1+J9iLOwHvwqssyOdJJGEiWKuXpYoUSEmz/0XtGtNXavFfRmb5WgjuGe5h32oyrB4h3ZjPCKFtjmLJv2j7E8bqSEcrVW8273euVXlnWkGH+3UEz8s4eP9KTlF7XFkNXvUfX03JyQojlqigujSpzbhWImSe3C8GyZxZ2bArE1cCemEEb5xt36raUyP/yxVEjYtvM419we/oOZaSi8Y4lRjIVGMyCmXBocYya4tG2gQLhHm4769sqS5yDh/TmIZodwYjbQ86twkBeKvKaQwbE9FfGCIWRikn3avkwvadsLQuAff3x5GTRMHCqib7vQc1R6Y+VK/IyJidt5CQL/wGjpl/rqXHLBBAxLOqoWWxapxGnom2xhfo+5tewoCOLKBjbEXRJ8zvLvfL/gxlvMDhnJP9EAsrxvrlLBNGlbGaz8bC5XrRXXSVnl60oGetQMs6Z9i1zZSsvd8EdQeUfpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5034
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966005)(81166007)(1076003)(336012)(6486002)(478600001)(82740400003)(5660300002)(7696005)(2906002)(36756003)(8676002)(356005)(6916009)(6666004)(8936002)(82310400002)(70586007)(26005)(186003)(47076004)(2616005)(4326008)(956004)(16526019)(86362001)(316002)(36906005)(54906003)(70206006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	951b5171-64cb-43c3-9901-08d807156419
X-Forefront-PRVS: 0422860ED4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gdlfffLInXW3LCP8pRYW1fpvfeHNofELTf695yfWCrGfXsrjT1FBwb2F2wJSM2LMucO9r/ylxcK3/yVKVxaJtOk3ujcaNca/5ZWBRkRgq021tslQ7II0yZSA/zd6FKKqX+8DdHtBCShHIFdxG2O56pauEI+4GMC9ATVVs7WukdGEiyz7vGXtFKG+92NtBoXv4TF5AKgO3Qiov3hu2GWkNcnKLF6kMDtEs6K2oP5JPF9LYfZaCE8rY0T1YrpdAut9eg4w9G4Si61Q7B4c4ERhIDOCfEd934xagKrpSm4Y3/Z2Ex3jFwQH/pSgNmfGMOzC2tKDD8M+1YZ3GIOwJ4VOm4XvyOy4Q/qlj6vxDgYrZGsTy9JfAAK29M17omNh0ZltPbB14YZaZ3eROGvXCezzF9CW0rWg9GfNYGN8fhMf6RAe80/ZNveE7esxn2O0rKZrh/YB7gXLbcuOo0KtQGw4/1VJcc3D6oqtF/1cfbN8jzg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:52:59.8312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e866b9-60fa-46d5-f18c-08d807156856
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5229
Content-Type: text/plain

SCP-firmware provides a software reference implementation for
the System Control Processor (SCP) and Manageability Control
Processor (MCP) components found in several Arm Compute
Sub-Systems.

This patch set adds support to fetch and build SCP and MCP
firmware binaries

Issue-Id: PLATFORMS-3134

Change-Id: Ic7259bb430c9e7e9711c9c8bc3283aafaacdf707
Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../recipes-bsp/scp-firmware/scp-firmware.inc | 71 +++++++++++++++++++
 .../scp-firmware/scp-firmware_git.bb          | 20 ++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
 create mode 100644 meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
new file mode 100644
index 0000000..1873848
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
@@ -0,0 +1,71 @@
+SUMMARY = "SCP and MCP Firmware"
+
+PROVIDES += "virtual/control-processor-firmware"
+
+SCP_BUILD_RELEASE   ?= "1"
+SCP_COMPILE_VERBOSE ?= "0"
+SCP_PLATFORM        ?= "invalid"
+SCP_COMPILER        ?= "arm-none-eabi"
+
+DEPENDS += "virtual/arm-none-eabi-gcc-native"
+
+SCP_BUILD_STR = "${@bb.utils.contains('SCP_BUILD_RELEASE', '1', 'release', 'debug', d)}"
+SCP_COMP_STR  = "${@bb.utils.contains('SCP_COMPILE_VERBOSE', '0', '', 'V=1', d)}"
+
+inherit python3native
+inherit deploy
+
+B = "${WORKDIR}/build"
+S = "${WORKDIR}/src"
+
+# Allow platform specific copying of only scp or both scp & mcp, default to both
+FW_TARGETS ?= "scp mcp"
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+LDFLAGS[unexport] = "1"
+
+# The gcc-arm-none-eabi version does not support -fmacro-prefix-max
+DEBUG_PREFIX_MAP_pn-scp = "\
+    -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+"
+
+# No configure
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = "${SCP_COMP_STR} \
+                BUILD_PATH='${B}' \
+                PRODUCT='${SCP_PLATFORM}' \
+                MODE='${SCP_BUILD_STR}' \
+                CC='${SCP_COMPILER}-gcc' \
+                AR='${SCP_COMPILER}-ar' \
+                SIZE='${SCP_COMPILER}-size' \
+                OBJCOPY='${SCP_COMPILER}-objcopy' \
+                "
+
+do_compile() {
+    oe_runmake -C "${S}" ${EXTRA_OEMAKE}
+}
+do_compile[cleandirs] += "${B}"
+
+do_install() {
+     install -d ${D}/firmware
+     for FW in ${FW_TARGETS}; do
+        for TYPE in ramfw romfw; do
+           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
+        done
+     done
+}
+
+FILES_${PN} = "/firmware"
+SYSROOT_DIRS += "/firmware"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP_${PN} = "textrel"
+
+do_deploy() {
+    # Copy the images to deploy directory
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
new file mode 100644
index 0000000..5ff5859
--- /dev/null
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Firmware for SCP and MCP software reference implementation"
+HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
+
+LICENSE = "BSD-3-Clause & Apache-2.0"
+
+# SCP
+LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731"
+# CMSIS
+LIC_FILES_CHKSUM += "file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = "\
+    git://github.com/ARM-software/SCP-firmware.git;protocol=https;name=scp;destsuffix=src;nobranch=1 \
+    git://github.com/ARM-software/CMSIS_5.git;protocol=https;name=cmsis;destsuffix=src/cmsis;lfs=0;nobranch=1 \
+"
+
+SRCREV_scp    = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
+SRCREV_cmsis  = "refs/tags/5.2.0"
+SRCREV_FORMAT = "scp_cmsis"
+
+require scp-firmware.inc
-- 
2.17.1

