Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.48])
 by mx.groups.io with SMTP id smtpd.web12.5260.1589242867711085200
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 17:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=q+A+X5tJ;
 spf=pass (domain: arm.com, ip: 40.107.3.48, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q52hT6adAUnoDRvS8xbWwczKOb9rX58WBFLx1H/yorQ=;
 b=q+A+X5tJGoSNDfh+ItqnMi2rQ0AeICdX9dx4KlqkQquUn08ulKEc4d2TxhV68Gtrh2+N0V/mdfwCV8iwBKFnnl7b6w0GyJdWUdpC8vVsdU8/M9lCVYuPXYXydFCuBKRh3GVLDRyI0rgIiN34NG1IrYpO/rsxgOUjjVJvQq0jseM=
Received: from MR2P264CA0118.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::34)
 by VI1PR08MB3742.eurprd08.prod.outlook.com (2603:10a6:803:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Tue, 12 May
 2020 00:21:05 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::74) by MR2P264CA0118.outlook.office365.com
 (2603:10a6:500:33::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Tue, 12 May 2020 00:21:05 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 00:21:04 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Tue, 12 May 2020 00:21:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4e68645e30ca209
X-CR-MTA-TID: 64aa7808
Received: from fa342344aeba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0EC5269-2557-42A9-8CC0-DEE80C139207.1;
	Tue, 12 May 2020 00:20:58 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa342344aeba.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 00:20:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7LSyBrDbOyRxqSrG1gRKlgfGRvjB3kEO4DeqnHlQDFoe+R5CW2xxHNYQSCHJ94C2VF8g3h1ZSo5KyBtfmlB8xi2SChs2azhhRqNUGhm0xA5BH+fZ/SvQBHjLKP6QmdBygfHWw7VRMs1HL+Ib+vgEo3LuG+bM46KIfLeYq7TxY2ais+mg0TrrGJvu0Pqrw5W8To0jxMYtjWR7yU83IQnw/ock78o3xaKek0z0qHc8sOTA8iF0tzhSc01hlqYz/uWItBRLg/LUod6z6/UbD8JWDXfChWopDWOkioWaD5r8M5Uze9TR1FBfflsqSrAdzAI/gM5fUi7Mso37wmrjfLgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q52hT6adAUnoDRvS8xbWwczKOb9rX58WBFLx1H/yorQ=;
 b=Wh/xDPJ8WgGnndNXtGHaH25AOIW+jtwi9a2YHqFluinzrAEit/lL2bvg/nRXiZV39azPz8MGDkT1VTUlnv2bQZVPTZZYroMLin5aNK/p39LFDC4FpMzrpAs0wnY9JodCUmJbzpFujw5QgsrrMASAfLs3OwgEh5ILQvU6UKGlNAajqpxLBlGK8EjjeWSSL3E2zbejwuNBBzPRIl/iBlhqVtn1I6aqMxdlJ9m2xSvAr1g9lbj7OSQh2oaRfM5T1v8jCgjvCaxFEZKfOUL31l5W1DC8dNPyO22sgdtNpQVZVB13Jp2ACeHae5/B8J+c/C/moZq39J3/NpxXqhewtcMtsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q52hT6adAUnoDRvS8xbWwczKOb9rX58WBFLx1H/yorQ=;
 b=q+A+X5tJGoSNDfh+ItqnMi2rQ0AeICdX9dx4KlqkQquUn08ulKEc4d2TxhV68Gtrh2+N0V/mdfwCV8iwBKFnnl7b6w0GyJdWUdpC8vVsdU8/M9lCVYuPXYXydFCuBKRh3GVLDRyI0rgIiN34NG1IrYpO/rsxgOUjjVJvQq0jseM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB5011.eurprd08.prod.outlook.com (2603:10a6:208:166::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Tue, 12 May
 2020 00:20:57 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5%6]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 00:20:56 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] Add recipes for TF-A versions 2.2 and 2.3
Date: Mon, 11 May 2020 20:20:50 -0400
Message-Id: <20200512002050.11739-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM3PR12CA0096.namprd12.prod.outlook.com
 (2603:10b6:0:55::16) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by DM3PR12CA0096.namprd12.prod.outlook.com (2603:10b6:0:55::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Tue, 12 May 2020 00:20:54 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 11 May 2020 20:20:50 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ab0d8a5-efe8-4096-b54b-08d7f60a5bb9
X-MS-TrafficTypeDiagnostic: AM0PR08MB5011:|VI1PR08MB3742:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3742F8750F8CC4CF58BE2BB2F0BE0@VI1PR08MB3742.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hhlGMA6yqdPVfMI0BqPIOn1eSa0x/DWcBMSQc0USJ9T6OKapJ6GhauzRWOTn71o89CBj2wwlFmnOiSUEbuSZ8eA1gk+hAeaZqPaRqG22g0ZIYRi9mikrGgXcvw8/sD1GhDduut9lsYQh/Nhr7zUYgP5HPppxv2d2D3j/3BhUY8W8IP1xVRTJmcpw3EKmOe37p/tV7XtDzQCUgncfAsvhhJ/zjtw7bKH8k65giDR4VVso717sgjrJyf8vgytkQHpRX234idk+G3xVR1uZQm4Lr1SO/FS0DXMSIZ0bVbuIRvzqxtxwh9fAuNjeqvpvm3H33UAm8EVRJPdWAmis/agantbiDlyk3q/mimVcsvL2ENvzo4TNisO6u+Bfkn5GkQE9Cz0WKXvvSSPijNTK/L+vtCrK78q4U5YHaZwCBe8Z7NWTruZqThvE2o4iIdW2qu+F6iJcP3rpMaUU/X7GOf96NATtm/lyv9MVxwZxsN/tSFAIvB7NSKRR+NjX43F5CKa/Mb4nknskFBMgmShaIkd+Vw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(33430700001)(86362001)(44832011)(42186006)(33440700001)(186003)(26005)(2616005)(2906002)(316002)(426003)(5660300002)(66556008)(66476007)(6916009)(8676002)(36756003)(66946007)(8936002)(478600001)(1076003)(4326008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 WtKtIZc3TLN2fnuGfOIzsVr8LyOvJu7U3eOkbLglRv/SIWJdKihpVT9vLehy8pGHlsndOM2vWe0ZgPi8/Vivozi1PcqQAwvKjfEKKLrgMcacS6z/pCx3gBlZJSpHNvpJrB+LNkRr7qeNgBHpd6VQqqOlufSljgnZiASojy1XRUiNfbt1zFpNsZ3W5K47Nc5qm81J60lGD6maSVD8x4eJZtvvTPv21UHMNxc23hFF5Nnj9hoMZ6bTnG1oiAtRwYR7TsUBWSr1nSMyA5gaLUnSZZslbDE4F6ln99o9/WifztNO3gvC4ivx3KxEl78BywFb/uiWsCTkHNvHsg1lTD8easNhUi+pLC9rp/amTqDtwizuW+5wgLfvGJXOhdGv3FpeWekfqucOZ1n0xKnqNibtU/7hDQcwC6frQTBCFqmJ1YTDiswV+8U1ZWx1hGC/gkcZt/nmFh5YLNIi1/5j7JA9Yy+Y5oIXm6g1qxdvCSrTf5g2D8ACNmjUsgg0dgRxfGAb
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5011
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(33430700001)(82310400002)(33440700001)(426003)(336012)(36756003)(5660300002)(1076003)(478600001)(186003)(26005)(2616005)(44832011)(2906002)(36906005)(86362001)(47076004)(316002)(8676002)(356005)(42186006)(70206006)(82740400003)(8936002)(6916009)(4326008)(70586007)(81166007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ee23f15-3abf-4669-94cc-08d7f60a565a
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0O9zxFqLNmiOfAE154dsN8DcZqddm8q9Hv0PKcjZxrl6t1r5t+XX22aHtqyK3bMLzYcNTE0VWaiHh0lI/r0a4ngFoDGSOweQ1nTw3xnqcxYqFtWGjsok/sl7Ae8ex+72i7Bp23tN+E6+suR8Teaae02Vzd8GETBHhntQ/G7J+l0nIKlywtd08IYq8iKW0eqkzQPGmVDNfyH7lUm6dq2fxDdbcx5Poj12Hygom7Y3NluQzJkHIEgk3qHQbqFbw6v0IqjI1s+kTQy0kNdfCiX/VjQOWXxTgtUn1GDUwmM+c4wnihP/hnPURIDzrEWsKGsSHR/QlqMuAyeM9QQ9qh1ZPXcm7ng8r4QJlhOPa7O93nCbnzG4xSa+kd0Wv0ZF4jiAhHWpUgAsel451R61Xiro3yOlgm6NhtV3JDHn8fzaEMGpk1uy9yRdXTMcDSNSUyX/uTco77y1uhFDeNordUHlQgHKJCu7Wayo/4a8wavDHD+XOecE9lzJ7TniDWHmVbf9G275cwOGqIWEfV5KXiwavj7NWAgeYs8y/srUTlpwSBkJso62lOhZM8DouzRhx91WH/8eWj06ikI0oIMbh/A1ug==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 00:21:04.3848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab0d8a5-efe8-4096-b54b-08d7f60a5bb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3742
Content-Type: text/plain

Add basic recipes for TF-A versions 2.2 and 2.3.  Also, rearrange fields
in the various TF-A recipes to make them uniform and move the
do_compile_prepend to the inc file.

Change-Id: I85e4ac7bdc44ed85449e40fd2c94d73bf3e7d9e8
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |  1 +
 .../trusted-firmware-a/trusted-firmware-a.inc | 13 ++++++-
 .../trusted-firmware-a_2.1.bb                 | 20 ++--------
 .../trusted-firmware-a_2.2.bb                 | 38 +++++++++++++++++++
 .../trusted-firmware-a_2.3.bb                 | 38 +++++++++++++++++++
 .../trusted-firmware-a_git.bb                 | 29 ++++++--------
 6 files changed, 103 insertions(+), 36 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 878b6b1..898a863 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,6 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.1%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 93ca199..50a97a7 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -81,8 +81,19 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
 
-
+# The following hack is needed to fit properly in yocto build environment
+# TFA is forcing the host compiler and its flags in the Makefile using :=
+# assignment for GCC and CFLAGS.
+# To properly use the native toolchain of yocto and the right libraries we need
+# to pass the proper flags to gcc. This is achieved here by creating a gcc
+# script to force passing to gcc the right CFLAGS and LDFLAGS
 do_compile() {
+    # Create an host gcc build parser to ensure the proper include path is used
+    mkdir -p bin
+    echo "#!/usr/bin/env bash" > bin/gcc
+    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
+    chmod a+x bin/gcc
+    export PATH="$PWD/bin:$PATH"
     oe_runmake ${TFA_BUILD_TARGET}
 }
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
index e8933fb..4d41202 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
@@ -1,6 +1,9 @@
 #
 # Trusted firmware-A 2.1
 #
+
+require trusted-firmware-a.inc
+
 SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
 
 # Use TF-A for version
@@ -33,20 +36,3 @@ LIC_FILES_CHKSUM_MBEDTLS += " \
 
 SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
 SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
-
-require trusted-firmware-a.inc
-
-# The following hack is needed to fit properly in yocto build environment
-# TFA is forcing the host compiler and its flags in the Makefile using :=
-# assignment for GCC and CFLAGS.
-# To properly use the native toolchain of yocto and the right libraries we need
-# to pass the proper flags to gcc. This is achieved here by creating a gcc
-# script to force passing to gcc the right CFLAGS and LDFLAGS
-do_compile_prepend() {
-    #Create an host gcc build parser to ensure the proper include path is used
-    mkdir -p bin
-    echo "#!/usr/bin/env bash" > bin/gcc
-    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
-    chmod a+x bin/gcc
-    export PATH="$PWD/bin:$PATH"
-}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
new file mode 100644
index 0000000..4d5316e
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
@@ -0,0 +1,38 @@
+#
+# Trusted firmware-A 2.2
+#
+
+require trusted-firmware-a.inc
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# Use TF-A for version
+SRCREV_FORMAT = "tfa"
+
+# TF-A v2.2
+SRCREV_tfa = "7192b956bde11652a835eee0724dca0e403fee90"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
+SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
+
+#
+# mbed TLS source
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+
+# mbed TLS v2.16.2
+SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
+    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+    "
+
+SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
+SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
new file mode 100644
index 0000000..bfda87b
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -0,0 +1,38 @@
+#
+# Trusted firmware-A 2.3
+#
+
+require trusted-firmware-a.inc
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# Use TF-A for version
+SRCREV_FORMAT = "tfa"
+
+# TF-A v2.3
+SRCREV_tfa = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
+SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
+
+#
+# mbed TLS source
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+
+# mbed TLS v2.18.1
+SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
+    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+    "
+
+SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
+SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 4bf3ae5..c443ecd 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -9,30 +9,23 @@ DEFAULT_PREFERENCE = "-1"
 require trusted-firmware-a.inc
 
 SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# Use TF-A for version
 SRCREV_FORMAT = "tfa"
-LIC_FILES_CHKSUM ?= "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
 
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+#
 # mbed TLS source
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
 SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
-LIC_FILES_CHKSUM_MBEDTLS ?= " \
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
     file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
     file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
     "
 
-S = "${WORKDIR}/git"
-
-# The following hack is needed to fit properly in yocto build environment
-# TFA is forcing the host compiler and its flags in the Makefile using :=
-# assignment for GCC and CFLAGS.
-# To properly use the native toolchain of yocto and the right libraries we need
-# to pass the proper flags to gcc. This is achieved here by creating a gcc
-# script to force passing to gcc the right CFLAGS and LDFLAGS
-do_compile_prepend() {
-    # Create an host gcc build parser to ensure the proper include path is used
-    mkdir -p bin
-    echo "#!/usr/bin/env bash" > bin/gcc
-    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
-    chmod a+x bin/gcc
-    export PATH="$PWD/bin:$PATH"
-}
-- 
2.17.1

