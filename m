Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.58])
 by mx.groups.io with SMTP id smtpd.web11.2685.1591861950182711704
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 00:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1Uz4Oci7;
 spf=pass (domain: arm.com, ip: 40.107.6.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcJwzjMNTLVWbgv9Hkr7M9erUbLhayw1yAfFBRCGO9w=;
 b=1Uz4Oci7F7jiPfSSAggvIT8WVMCLuAA1rNgMsytIEpwoWW15lLtp1LwRhmEcAInO6sUxqB2PSIYFNb2iby2zxs2ilO6d4fIblapN3o6ci15be9awy6UpQq1ebzME1ogZfSJVaI/wE0U1CmvmzB48SsOxfafRB36UYxuW2FsBUqA=
Received: from MRXP264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::20)
 by AM5PR0801MB1922.eurprd08.prod.outlook.com (2603:10a6:203:4b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Thu, 11 Jun
 2020 07:52:27 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::b3) by MRXP264CA0008.outlook.office365.com
 (2603:10a6:500:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20 via Frontend
 Transport; Thu, 11 Jun 2020 07:52:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 07:52:25 +0000
Received: ("Tessian outbound 8bb15bb571b3:v59"); Thu, 11 Jun 2020 07:52:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5fccbe30739fd4f
X-CR-MTA-TID: 64aa7808
Received: from 8cdccae3c21c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F41474DC-4DF5-42E1-98F4-84D57EC61204.1;
	Thu, 11 Jun 2020 07:52:19 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8cdccae3c21c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 07:52:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drPEBxs5EJIY1E95kn/krtVZGSzb7u75LUp7iuNGYYM5vh2ZSdzvxUR9LBMrx9165YfIiiH3KUj5xcLlyppwzVgrTIK+V5yWwK4hHLdCAwZSJfVh8raL6ZsbfVQeilarulZAGDLlL5VXX02M5NsEHhXdw2ugYzi6hL5s+kEfPxJrspp+DdA4n7w+O/selKpIJ7Fppy/ihOQRYk1QPbOjEFXW3E7c4cs475zuGUwfIganA4OxqczcWuc+pzl7y90dZmSxTJVJqDQgg5YdDrY0XwkNvNDKiBA9wIp368gZFapWBoAD+o3ViMER5QLDRSEIwc/uqgCOsF7YwLHMIsiBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcJwzjMNTLVWbgv9Hkr7M9erUbLhayw1yAfFBRCGO9w=;
 b=J7VkcKMyiamBGEX+TBEct0crwvuhewXCjLMcRLl2FZe9JowKcRieWGGtfUnmEsn784Lv6WVJnR51N9VE3jBtyORcJulFRIwzmLZpLX28czsm8quaRhHZ1AGZhbrGMWd3yPi7sRN9w8EgAgVSkt7YIuxpZoUU5qboX0TF1jCXg3SyC5DxoyrDyBgYZwozeOfem/MTvKZGISv1kRMvI0c9At7rgJrtdwFF0QTw+fyD/vgf34MvOJiaMxsr7TXQNlUymytZ1rnNMR+QcEW86HzAEG8OtmL04nxzVznZdeDydRNfcfG6yy6vOqI33/Jpr70k9vUs28e30AaG1XMcxc/wVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcJwzjMNTLVWbgv9Hkr7M9erUbLhayw1yAfFBRCGO9w=;
 b=1Uz4Oci7F7jiPfSSAggvIT8WVMCLuAA1rNgMsytIEpwoWW15lLtp1LwRhmEcAInO6sUxqB2PSIYFNb2iby2zxs2ilO6d4fIblapN3o6ci15be9awy6UpQq1ebzME1ogZfSJVaI/wE0U1CmvmzB48SsOxfafRB36UYxuW2FsBUqA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB3792.eurprd08.prod.outlook.com (2603:10a6:803:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Thu, 11 Jun
 2020 07:52:17 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::3da2:15b6:9468:e4c7]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::3da2:15b6:9468:e4c7%7]) with mapi id 15.20.3088.018; Thu, 11 Jun 2020
 07:52:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp, gem5-arm64: Update to v20 version
Date: Thu, 11 Jun 2020 08:52:16 +0100
Message-Id: <1591861936-39107-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0156.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::24) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0156.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 07:52:16 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c4da66f-cca2-45e1-4ec9-08d80ddc6185
X-MS-TrafficTypeDiagnostic: VI1PR08MB3792:|AM5PR0801MB1922:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB19227209EA8F241966EE1E0592800@AM5PR0801MB1922.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DjVACHl5F558PLM1ku4crKIkVBTlQ7gi9v+cSBmrciJsSZ9tNlzCdsIkHQxedNw6XIarAtTiJm3JtaZMgD65GzQkmUVDHp+CSGoYnhNRjc9/niP7YILayY8Crj7i2ZigJQkeYrz7hIT7Msq7E8DE6WoBrRq2EnXbROBqrsLijUP6SGxGAX6raWo53Pd6z9K8p2VGMAvFFZ/+r8mbZ0zV62d1Jn90Va8XXBBuWYw7fSoZ4UtoyzHUkWEzTPjqeRSFNx8UURxyHnEwgGw33mTIuwGEpOLwdUfLwIbZiZesWA+rP0MrMZ3VRvB3NcYfeUO+
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(478600001)(83380400001)(86362001)(956004)(66556008)(2616005)(66946007)(44832011)(16526019)(26005)(36756003)(66476007)(186003)(52116002)(7696005)(5660300002)(2906002)(8936002)(316002)(8676002)(4326008)(6486002)(15650500001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Y+0PVzjmim35fvdwzKxIiim5bCNJuFPEyzHrNUea0ejl2buIwJAlWYdJmeHqWV+Yywr+ezeQ+VMC+ZFoajrHE9/OVSqIXdUjrEV5bhldqcToJ9TC/imLRSiIhZ6gnSaLjbDwc+WMJjRpsBIuDef9AwTXPUOxfVsZgJv/Oc00dHSD4wQi9erbXHZRFkTZtMKrCCkqO1erGfENEh+uxhK+3V0htUWZdZq+UiGju9nG/PHuhnroAk6T0WXKseoMcIRQKbOZC3AE5UDNmFDmHQWY1TCwy0dVKaI8rwVDvXEiMHa2kAMdcTETsc/YXCGnUvaefxJwJMTwvt9SaiIbM+kF6buV57wK2OuR46uyL2FWNwze19PPTkNYo4MqstYv0S0Y2oVkh5KtIvqsy9xy3y1xqz7rcAd62YrNp+7CXbmy1OayUiT14t4zZhbAC/bI0LCmpmF3kbBZ/TP0gCUjDz191Ewbp4Hue5frm5LtR3WxCEvoBcnD2P/ylpwmevyOGLDJ
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3792
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(36756003)(4326008)(6916009)(36906005)(82740400003)(316002)(81166007)(83380400001)(2906002)(47076004)(5660300002)(82310400002)(8676002)(7696005)(356005)(15650500001)(26005)(44832011)(956004)(478600001)(86362001)(8936002)(186003)(336012)(16526019)(6486002)(70206006)(2616005)(70586007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b0624c02-95c0-4cfa-3d11-08d80ddc5c8d
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1R5AgKrw0xEazYd7PFYvtObfoRooTN7oxwFzPVC1/a89NaFVxGhNkIjeZDmG/apABOrJSl9tK9t6PiYJOFbhGkqsDEHr6Nle0ycQM42Y9s/+64N+ZEGNASCXuEA5grgeam4S+Sa4gWF1clPuVPkaNlAByZwieou/EE94vT8hWWTDLHXZ4FRoxhuskh7dXgI7X6pwCkd4djf+D8jMNc6Iw51NIx74v5yk4YRzfup8TZxPyUXytSfBBE2DfAAdVDMRQN1OHEBfROIJOJPrL6P1lhF0EC8RL2J53bLjJygMe16bXtLraCzUIRAd7lU4/ztdivid74kemGOBsSJKdgiMAWzrlnNmUoe3CP16aDyIrgSHcZ2FDnWOoSMZfNBWB1oWcxBUop+zYUDhwNkxP1+vaw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 07:52:25.1528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c4da66f-cca2-45e1-4ec9-08d80ddc6185
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1922
Content-Type: text/plain

This patch updates gem5-aarch64-bootloader and gem5-aarch64-native to
the release tag v20.0.0.1.

Also apply populate the right compiler and linker flags to get
gem5-aarch64-native properly building

Change-Id: Icc2203163105373cf030975c1b12f1d4f2fcb03c
Issue-Id: SCM-1014
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../gem5/gem5-aarch64-bootloader.inc               |  8 +-
 ...loader_git.bb => gem5-aarch64-bootloader_20.bb} | 10 +--
 ...SHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch | 85 ++++++++++++++++++++++
 ...h64-native_git.bb => gem5-aarch64-native_20.bb} | 18 +++--
 meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc |  6 --
 5 files changed, 106 insertions(+), 21 deletions(-)
 rename meta-arm-bsp/recipes-devtools/gem5/{gem5-aarch64-bootloader_git.bb => gem5-aarch64-bootloader_20.bb} (60%)
 create mode 100644 meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
 rename meta-arm-bsp/recipes-devtools/gem5/{gem5-aarch64-native_git.bb => gem5-aarch64-native_20.bb} (53%)

diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
index 4c479f5..7e753b2 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
@@ -5,10 +5,12 @@ LICENSE = "BSD"
 
 inherit deploy
 
-PROVIDES = "virtual/gem5-bootloader"
+PROVIDES += "virtual/gem5-bootloader"
 
 COMPATIBLE_MACHINE = "gem5-arm64"
 
+BOOTLOADER_SRC_PATH ?= "${S}/system/arm/bootloader/arm64"
+
 # no configure step
 do_configure[noexec] = "1"
 
@@ -16,11 +18,11 @@ do_configure[noexec] = "1"
 do_install[noexec] = "1"
 
 do_compile() {
-    oe_runmake -C system/arm/aarch64_bootloader all CROSS_COMPILE=${TARGET_PREFIX}
+    oe_runmake -C ${BOOTLOADER_SRC_PATH} all CROSS_COMPILE=${TARGET_PREFIX}
 }
 
 do_deploy() {
-    oe_runmake -C system/arm/aarch64_bootloader install \
+    oe_runmake -C ${BOOTLOADER_SRC_PATH} install \
         CROSS_COMPILE=${TARGET_PREFIX} DESTDIR=${DEPLOYDIR}/binaries
 }
 
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
similarity index 60%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
rename to meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
index a3ab5aa..d960e6c 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_20.bb
@@ -3,16 +3,14 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
-# The recipe is currently using a version in the release staging branch of gem5
-# until version 20 is released
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1"
+RELEASE_TAG = "v20.0.0.1"
+SRCREV = "332a9de33db603e0aefedae1e05134db4257ea3e"
 
-PV = "git${SRCPV}"
+PV = "${RELEASE_TAG}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
-
 BPN = "gem5-aarch64-bootloader"
 
 require gem5-aarch64-bootloader.inc
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
new file mode 100644
index 0000000..4303a40
--- /dev/null
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native/0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch
@@ -0,0 +1,85 @@
+From 1303d0497bad151f9389ee30c37dc5f9fe325f6e Mon Sep 17 00:00:00 2001
+From: Giacomo Travaglini <giacomo.travaglini@arm.com>
+Date: Thu, 04 Jun 2020 12:45:52 +0100
+Subject: [PATCH] scons: Add MARSHAL_XXFLAGS_EXTRA for the marshal object
+
+We already provide to the user the CCFLAGS_EXTRA, LDFLAGS_EXTRA
+variables to pass flags to scons when compiling/linking gem5.
+Those variables are not passed to the marshal object.
+We add an extra pair:
+
+MARSHAL_CCFLAGS_EXTRA, MARSHAL_LDFLAGS_EXTRA
+
+to add flag injection capabilities to the marshal object.
+
+The patch is also renaming base_py_env to marshal_env.
+This happens for 2 reasons:
+
+1) At the moment the marshal compilation is the only task
+making use of the base python environment.
+
+2) Consistency with the EXTRA variable names added with this patch.
+I could have named them as BASE_XXFLAGS_EXTRA, but it seems too much
+generic and users might be confused by that, as they might think
+the BASE_XXFLAGS_EXTRA is a subset of the XXFLAGS_EXTRA so that
+setting it will affect gem5 compilation as well.
+
+Change-Id: I3e420caa897059455ff8f35462db2b38da050e93
+Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
+---
+
+diff --git a/SConstruct b/SConstruct
+index 3a03af4..5a66bba 100755
+--- a/SConstruct
++++ b/SConstruct
+@@ -276,6 +276,8 @@
+     ('CXX', 'C++ compiler', environ.get('CXX', main['CXX'])),
+     ('CCFLAGS_EXTRA', 'Extra C and C++ compiler flags', ''),
+     ('LDFLAGS_EXTRA', 'Extra linker flags', ''),
++    ('MARSHAL_CCFLAGS_EXTRA', 'Extra C and C++ marshal compiler flags', ''),
++    ('MARSHAL_LDFLAGS_EXTRA', 'Extra marshal linker flags', ''),
+     ('PYTHON_CONFIG', 'Python config binary to use',
+      [ 'python2.7-config', 'python-config', 'python3-config' ]),
+     ('PROTOC', 'protoc tool', environ.get('PROTOC', 'protoc')),
+@@ -734,7 +736,9 @@
+ 
+ main.Prepend(CPPPATH=Dir('ext/pybind11/include/'))
+ # Bare minimum environment that only includes python
+-base_py_env = main.Clone()
++marshal_env = main.Clone()
++marshal_env.Append(CCFLAGS='$MARSHAL_CCFLAGS_EXTRA')
++marshal_env.Append(LINKFLAGS='$MARSHAL_LDFLAGS_EXTRA')
+ 
+ # On Solaris you need to use libsocket for socket ops
+ if not conf.CheckLibWithHeader(None, 'sys/socket.h', 'C++', 'accept(0,0,0);'):
+@@ -1285,7 +1289,7 @@
+     # to the configured variables.  It returns a list of environments,
+     # one for each variant build (debug, opt, etc.)
+     SConscript('src/SConscript', variant_dir=variant_path,
+-               exports=['env', 'base_py_env'])
++               exports=['env', 'marshal_env'])
+ 
+ # base help text
+ Help('''
+diff --git a/src/SConscript b/src/SConscript
+index 7cd628a..aa233c8 100644
+--- a/src/SConscript
++++ b/src/SConscript
+@@ -1140,7 +1140,7 @@
+ # Build a small helper that marshals the Python code using the same
+ # version of Python as gem5. This is in an unorthodox location to
+ # avoid building it for every variant.
+-py_marshal = base_py_env.Program('marshal', 'python/marshal.cc')[0]
++py_marshal = marshal_env.Program('marshal', 'python/marshal.cc')[0]
+ 
+ # Embed python files.  All .py files that have been indicated by a
+ # PySource() call in a SConscript need to be embedded into the M5
+@@ -1196,7 +1196,7 @@
+     code.write(str(target[0]))
+ 
+ for source in PySource.all:
+-    base_py_env.Command(source.cpp, [ py_marshal, source.tnode ],
++    marshal_env.Command(source.cpp, [ py_marshal, source.tnode ],
+                         MakeAction(embedPyFile, Transform("EMBED PY")))
+     Source(source.cpp, tags=source.tags, add_tags='python')
+ 
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
similarity index 53%
rename from meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
rename to meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index d36f24f..638baf3 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -3,21 +3,27 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
-# The recipe is currently using a version in the release staging branch of gem5
-# until version 20 is released
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1 \
+           file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch"
+RELEASE_TAG = "v20.0.0.1"
+SRCREV = "332a9de33db603e0aefedae1e05134db4257ea3e"
 
-PV = "git${SRCPV}"
+PV = "${RELEASE_TAG}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
-
 BPN = "gem5-aarch64-native"
 
 require gem5-aarch64-native.inc
 require gem5-native.inc
 
+# Get rid of compiler errors when building protobuf
+GEM5_SCONS_ARGS_append = " CCFLAGS_EXTRA='-Wno-error=unused-variable' --verbose"
+
+# Get rid of linker errors and have a faster link process
+GEM5_SCONS_ARGS_append = " LDFLAGS_EXTRA='${BUILD_LDFLAGS}' \
+MARSHAL_LDFLAGS_EXTRA='${BUILD_LDFLAGS}' --force-lto "
+
 do_compile_prepend() {
     # Gem5 expect to have python in the path (can be python2 or 3)
     # Create a link named python to python3
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
index 429e18c..1df94d0 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
@@ -30,12 +30,6 @@ DEPENDS += "python3-six-native protobuf-native hdf5-native pkgconfig-native \
 
 EXTRA_OESCONS = "${GEM5_SCONS_ARGS}"
 
-do_compile_prepend() {
-    # We need to use the proper native libraries when executing
-    # compiled applications
-    export LD_LIBRARY_PATH="${STAGING_LIBDIR_NATIVE}"
-}
-
 do_install() {
 
     install -d ${D}${datadir}/gem5
-- 
2.7.4

