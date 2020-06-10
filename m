Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.65])
 by mx.groups.io with SMTP id smtpd.web12.75.1591805296670031893
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Jun 2020 09:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xFYAWB5M;
 spf=pass (domain: arm.com, ip: 40.107.4.65, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+PRTp4ZDF05f/GHNWqUzmxG+nazCBmIpP+SJOORORQ=;
 b=xFYAWB5MZvWJ45mBrE+ZdN03s4ur38TvXgUVwHrPVq67yQV8uTQMflgWNIPsBDED6ZGcfsnDTluTflJ46CFJvVTQhflGF+TgZC7ufVmeSNW9xy4L3c8dLgCOIJiSeiProX7GZl4mVQT6Z6hgB+XsCy+DeFjg7qLFt449lBsUcUU=
Received: from AM5PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:203:69::27) by AM0PR08MB4419.eurprd08.prod.outlook.com
 (2603:10a6:208:139::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Wed, 10 Jun
 2020 16:08:13 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::20) by AM5PR0202CA0017.outlook.office365.com
 (2603:10a6:203:69::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Wed, 10 Jun 2020 16:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 16:08:13 +0000
Received: ("Tessian outbound 4f5776643448:v59"); Wed, 10 Jun 2020 16:08:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e970c0a93189f6b
X-CR-MTA-TID: 64aa7808
Received: from ca34764d7bdf.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 03CBD8A6-508C-45EB-B73F-0584AE63147B.1;
	Wed, 10 Jun 2020 16:08:07 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca34764d7bdf.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 Jun 2020 16:08:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEvOMbxMGPUdEOX1Ph7DMbLiCaCIdkZQy1muHg5tNoytS8vglBoKxPZPaiRZgFkkJyTQLh4D673rz73EPmvpKDLCeFe939J9AgxO3kxbt72l9fV/QGLO8l9bllIx8vsg6wzrB6t7WahDcc70J0RM+onzrDEjXyzlfUWrmwggHJya8J0sb54+Po4OnAU+2IObtTDfD+xQUPWJpOO9usduCEVKGf4SNVGBElzXo7NpPNnQ6eqZIxhnBIda3oiaJV+OHYGXk1klbfkgZ7QK5/dcD29F3nGMmhHyazvs2DBDxP/KWo3lKeu5Dp7KyuuheFJ1QfTxVPSgpb0hCzQ/fX366A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+PRTp4ZDF05f/GHNWqUzmxG+nazCBmIpP+SJOORORQ=;
 b=M8mCNkK6ZadcpcLB5czUyCHqYzbCc7D8i6x7CrByj3ccj0LaK/XpUOGnOPM9MYd4TdkxFHXUxJajHrUS6HE9pPQwKyG4GhBoKeXc6gdeHPunsDrm2kQ/GjoX8pZDRajH9Oos+k03iBhW3QPj6mLHbJLR51B3GuLmlxrjvlpqo2WoPLJKQs3mrQtPlRy3QaJ+dRYJhjp6W7ynsMXbpzvMscJmtWq2/504/idinNis/sChYXlRRll8+yW7+vPgKU8ZXLbkfVNusnrn0iWOjbdJ1cFySJkKgdkTEcU4DBGAMFAC2SYecBoM1BF9cZGKaLxaBq38L5byi9WnqE+5xXIzKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+PRTp4ZDF05f/GHNWqUzmxG+nazCBmIpP+SJOORORQ=;
 b=xFYAWB5MZvWJ45mBrE+ZdN03s4ur38TvXgUVwHrPVq67yQV8uTQMflgWNIPsBDED6ZGcfsnDTluTflJ46CFJvVTQhflGF+TgZC7ufVmeSNW9xy4L3c8dLgCOIJiSeiProX7GZl4mVQT6Z6hgB+XsCy+DeFjg7qLFt449lBsUcUU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5305.eurprd08.prod.outlook.com (2603:10a6:10:112::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 16:08:06 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 16:08:06 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] meta-arm: Add UEFI EDK2 support for Arm platforms
Date: Wed, 10 Jun 2020 17:07:58 +0100
Message-Id: <20200610160758.9902-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::35) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sudpau01.cambridge.arm.com (217.140.106.51) by LNXP265CA0071.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 16:08:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a182a336-03c1-4455-3027-08d80d587a5b
X-MS-TrafficTypeDiagnostic: DB8PR08MB5305:|AM0PR08MB4419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB44196F5F4DE233E3FEAB2E51FA830@AM0PR08MB4419.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0LEXKbEyN+3xjuohV5BS0+xN7j7zsBRcvEM1hN1CiNP9Pz8m0g8OmC+/LNT4VwVEc4Ln6Y/sBXeCHW1RxkGh4G/JLXfBWJlxiosCA2weoQ6cZoEKKpU4nEPHaL7lydZlXszGmmk+O3PsAEPe/Zy6OasuKf6OO0VwktyBbYhMqJZAcuZXN5bx+hx/513Eiuyf61d/FMN0CFij9OqbwsTfN4fhllzp6nK85umRE0DmGRqB7asAG3oGJltwNqSY0Cjq/K2NpDCfT1Y7lWPC9JyZNDQkNJQ6vVlcT7JQEc03hMieLR9YFxb5oqwbNVKFZb/3KjSTr7hk0BiqeQzNKPVXiamjyMnQVEXb/j5CnK2Aub+v5KXPvA0XzUyla7WOsNQBEPyMbgYmYaPNzLeBdQaTTw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(6916009)(66556008)(66476007)(26005)(186003)(52116002)(7696005)(15974865002)(2616005)(66946007)(956004)(86362001)(316002)(2906002)(16526019)(478600001)(4326008)(6486002)(36756003)(8936002)(5660300002)(1076003)(6666004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 +0m46b+z1VTGlzvttCWSk/qrKcard/bOs5KiH5PnA68NXWJL7FNIcY5/UPlbUgRHIrVr/dK8nyuhVWqVSw+utdwG5YZxpB7ifhdMvjon/yl3cExdywtLOIAWu20T7KXDYBtvVz1Nye3eh4mAI1KO73Ry15QwfcUpLWaBXFjxQvLtQ2SEnKVnsl1KjNwHk3Ex7Zb6SwHWENtR4UNgV5jD95qWiUxRR9DY1jSkMgo1ihu4nkULQH63kZYjdqflvCFlFV2B+arYQDhyUxsr8zrjvoRW57WhemO7uD3QE+mV5s6bP9Tc8oRBXuW7lF9s0nRH7UsDsYDjVh8ZLU6JZS3ArGd3s7GaHgUHqDstBVdUx++fjtetbsXDhSbu+snwZ6BM33kS4VT/Izp8SDl/Lzu8dYd8GYuneKPqqyMDaJUqjgBibPAOf1kb4DMaKk1wkkC3iu2NkZI02cR99QO3/xgwaVWb3LgoDILjFQmLvNP8vRzQMWalfcLkHQrPjIxahjXK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5305
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(1076003)(336012)(956004)(15974865002)(316002)(6916009)(70586007)(6666004)(8676002)(5660300002)(36906005)(36756003)(70206006)(2616005)(82310400002)(478600001)(26005)(2906002)(186003)(8936002)(16526019)(7696005)(82740400003)(47076004)(356005)(4326008)(6486002)(81166007)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	01c621ea-50c0-4648-01c8-08d80d5875e3
X-Forefront-PRVS: 0430FA5CB7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fWI8NAo0apseKTSLZylXsF3C+/oVNCz88fYyqzazdbPApjlBEerYXUnYNG0NJ+OMzDDSwsMaf5Iqqjbuir7lkzQEaefIoVgcAHQUcmxw1/pyGGocCIL9jMwTPyTaWtaypNyKMhzcHSd1EaGCFjS74j5gayYs2H2viuF2qrcp8Rk3hbo5yk7hz0M30jsTzT0rbdpsQCrFBIGxcAeQeUsNgh+QAZ82psVslFUZE7KrrTWa8sk5Mg8FoZavh0Lbcflt1eGBG/dKr5fkM7yYAjayMw/e4Th2o+CMmMXQpmQ/b18NWTugJU+GpXF3lfXeIPCfkviDT1zvcbOD2NNN9hVr0vzeWikczNMh/tF+JCv3doxCy/E2KTTX5OwimHM4ME0KGQcVuN+FeYNcGMbtEivDbcPNWCxOSOeHmXUkOdatHnuyn/N/G56y9YPvttbaJowwFHooaqbvTj5/OzAkBtX17idEDTlrdjK/HgSbPlTXk2c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 16:08:13.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a182a336-03c1-4455-3027-08d80d587a5b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4419
Content-Type: text/plain

EDK2 Project is a modern, feature-rich, cross-platform
firmware development environment for the UEFI specifications
from www.uefi.org.

This patch adds a new recipe to fetch, configure and build
UEFI EDK2 firmware for Arm platforms.

Change-Id: Icfb157e5b68d87accfd4290f522fc529fe4e849e
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   | 81 +++++++++++++++++++
 .../recipes-bsp/uefi/edk2-firmware_git.bb     | 19 +++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware.inc
 create mode 100644 meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
new file mode 100644
index 0000000..7b9327c
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -0,0 +1,81 @@
+SUMMARY = "UEFI EDK2 Firmware"
+
+PROVIDES += "virtual/uefi-firmware"
+
+EDK2_BUILD_RELEASE   ?= "0"
+EDK2_PLATFORM        ?= "invalid"
+EDK2_PLATFORM_DSC    ?= ""
+EDK2_BIN_NAME        ?= ""
+EDK2_ARCH            ?= ""
+
+EDK2_BUILD_MODE = "${@bb.utils.contains('EDK2_BUILD_RELEASE', '1', 'RELEASE', 'DEBUG', d)}"
+
+DEPENDS += "util-linux-native iasl-native"
+
+inherit python3native
+inherit deploy
+
+B = "${WORKDIR}/build"
+S = "${WORKDIR}/git"
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+LDFLAGS[unexport] = "1"
+
+# No configure
+do_configure[noexec] = "1"
+
+# Set variables as per envsetup
+export GCC5_AARCH64_PREFIX = "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}"
+export PACKAGES_PATH       = "${S}/edk2:${S}/edk2/edk2-platforms"
+export WORKSPACE           = "${S}/edk2"
+export EDK_TOOLS_PATH      = "${WORKSPACE}/BaseTools"
+export PYTHON_COMMAND      = "${PYTHON}"
+export CONF_PATH           = "${WORKSPACE}/Conf"
+
+export BTOOLS_PATH = "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
+
+python __anonymous() {
+    # If GCC Version is greater than 4 then pass GCC5
+    # set GCC5 by default
+    d.setVar('GCC_VER', 'GCC5')
+
+    # Otherwise pass the corresponding version
+    G = d.getVar('GCCVERSION',True).split(".")
+    gcc_vlist = ['1', '2', '3', '4']
+    if G[0] in gcc_vlist:
+        d.setVar('GCC_VER', 'GCC'+G[0])
+}
+
+do_compile() {
+    # Copy the templates as we don't run envsetup
+    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
+    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
+    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.txt
+
+    # Build basetools
+    oe_runmake -C ${S}/edk2/BaseTools
+
+    PATH="${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
+    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
+       -a "${EDK2_ARCH}" \
+       -b ${EDK2_BUILD_MODE} \
+       -t ${GCC_VER} \
+       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
+}
+
+do_install() {
+    install -d ${D}/firmware
+    install "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV/${EDK2_BIN_NAME}" "${D}/firmware/uefi.bin"
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
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
new file mode 100644
index 0000000..4aadc3c
--- /dev/null
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "UEFI EDK2 Firmware for Arm reference platforms"
+HOMEPAGE = "https://github.com/tianocore/edk2"
+
+LICENSE = "BSD-2-Clause-Patent"
+
+# EDK2
+LIC_FILES_CHKSUM = "file://edk2/License.txt;md5=2b415520383f7964e96700ae12b4570a"
+# EDK2 Platforms
+LIC_FILES_CHKSUM += "file://edk2/edk2-platforms/License.txt;md5=2b415520383f7964e96700ae12b4570a"
+
+SRC_URI ?= "\
+    git://github.com/tianocore/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1 \
+    git://github.com/tianocore/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1 \
+"
+SRCREV_edk2           ?= "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
+SRCREV_edk2-platforms ?= "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
+SRCREV_FORMAT         = "edk2_edk2-platforms"
+
+require edk2-firmware.inc
-- 
2.17.1

