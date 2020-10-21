Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.78])
 by mx.groups.io with SMTP id smtpd.web10.16595.1603305805501321780
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 11:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=47rEInF1;
 spf=pass (domain: arm.com, ip: 40.107.15.78, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp8sVAeDZLVjUQZ/arI/W6V+peDj81zk1+S1eBMPF5M=;
 b=47rEInF1cLZCLpBaH7Tht5SDsN5WT5snYxAsZ4WwocISSQ5tJNF21zXyBoxMRVnG+dShXkfI35gQlNP+4RhFTgP7IBh3KYoSWm7dvYNwBuKnGiyA5iEwgYmAwAjzbdXROzGjhvz5DQSHQmN7q60xNWfWfLpJJni2YP3NFfsD0x8=
Received: from AM5P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::17)
 by AM6PR08MB4487.eurprd08.prod.outlook.com (2603:10a6:20b:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Wed, 21 Oct
 2020 18:43:21 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::42) by AM5P194CA0007.outlook.office365.com
 (2603:10a6:203:8f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 18:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 18:43:20 +0000
Received: ("Tessian outbound a64c3afb6fc9:v64"); Wed, 21 Oct 2020 18:43:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d4d078b9a0908c0
X-CR-MTA-TID: 64aa7808
Received: from d23bbdf25b42.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 822DDE17-ACDA-4CDC-A1C7-2C8B49B21D3D.1;
	Wed, 21 Oct 2020 18:43:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d23bbdf25b42.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Oct 2020 18:43:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezHqMpG962229j/BYgQFepPrjKiEz/sa5532OUC3ThiiRo8bI5PMumvseTXFSHG2AkTJKjyILszyjrtRItupnqIc97g78tnkQQldfOp46mAweNjigtXeASWqkwk2Gf+MoW0NeQobx1zuDeaisPq8oLoG34awb7EMDiL8rf0fPXli0hlTIp79iV0+SxQCqVLRAhpYswvfpZTG5FvJ5t3F/KZBs+BgGeXQ5ISycqMaGfsDQDG5uiXu+P17ToAH2Puzl0qEPTxuSFy1mKaQ2MyOjOjXOFLPgTPQhRlslZKs0uc5sHs/oPelrTlZJSKmg7NxaxeZ9S6RgCOl2fIfieXGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp8sVAeDZLVjUQZ/arI/W6V+peDj81zk1+S1eBMPF5M=;
 b=fJTf8bkCEnlYDhkNQfVcgOs/cSi9uQdGLP8Kke4CCh1rdezobNFpwRq2+ZNWk8PDYmriKvuT7/yrVdJsuIJDPJyFyLxft0YymeYNrk1UW52vrbEy90Ac/KRq+5Q+I87G10zAPlyTp2V1pO4iYI8izShObShKggnDaD8Q1PChHHQCTBhCOngk0sKONQQ+N8aWN89PVQHLK0FkS4mUWg3PofIW8pM6a/csfCoKU9/b/Fjzoun+Sx/3WL9tOm0NJ35NR1aSjLLQwLEthnxY0GnAdU6VCD2AyGsBDqYURg9aIpDiW0psUWhwmMz2xoiR9m4OLjvO5TALWAwXrRiD2ZiDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp8sVAeDZLVjUQZ/arI/W6V+peDj81zk1+S1eBMPF5M=;
 b=47rEInF1cLZCLpBaH7Tht5SDsN5WT5snYxAsZ4WwocISSQ5tJNF21zXyBoxMRVnG+dShXkfI35gQlNP+4RhFTgP7IBh3KYoSWm7dvYNwBuKnGiyA5iEwgYmAwAjzbdXROzGjhvz5DQSHQmN7q60xNWfWfLpJJni2YP3NFfsD0x8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VI1PR08MB5470.eurprd08.prod.outlook.com (2603:10a6:803:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 21 Oct
 2020 18:43:11 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::adae:e557:66ba:2783]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::adae:e557:66ba:2783%7]) with mapi id 15.20.3499.018; Wed, 21 Oct 2020
 18:43:11 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/tc0: Add kernel patches
Date: Wed, 21 Oct 2020 19:42:56 +0100
Message-Id: <20201021184256.40276-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: CWLP123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:59::26) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.52) by CWLP123CA0062.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:59::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 18:43:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d579104e-9c88-4529-992f-08d875f12ef3
X-MS-TrafficTypeDiagnostic: VI1PR08MB5470:|AM6PR08MB4487:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4487FE1C9E35ABA9AC8DBF4A891C0@AM6PR08MB4487.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:534;OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DfnaUJXrOzBGZSbxHgW+BdjjGSL4PigLuJchecHFlLXfC4PP76OgOKCIXdEeWQhK8TB0/p7WyOossWGH1n9RDOndqbevVxkO9LETeKxLkMUi1BbsF9/013ZMWF4v9VsMYm98A0z/iePSvaewZ6g6cdjUt801ycigT6xgA63FaHAsATxrca2QAjAO7Lss/QBLNdxl/8UZ82Z9/9j7aGXa7G26DLmkK/s+1QX8kmSSrO1dBx4uwjttJT2djwAQ3QRsPDwyT+wcN/8z5bG+9EmpAYKhP6NmGx8RWfaqDaEgAAdG7yvWJGa/Xr1wPD8JDsXu/xkAKPuqZPGOBj8VDz+Uv6lYvVWSBafWasblr3H610FY3Oe9zoiNERCo7wZkhpednXyJGwyA992J+nyBBFIHjA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(6916009)(8676002)(8936002)(7696005)(52116002)(4326008)(66574015)(6486002)(86362001)(26005)(2906002)(478600001)(45080400002)(956004)(2616005)(16526019)(83380400001)(186003)(44832011)(5660300002)(30864003)(6666004)(66946007)(66476007)(316002)(36756003)(1076003)(66556008)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 DxUEyeGxTqzgTHQfYiwGVkB2ElVyx4yiumf+1MEE+T14XBj0Mc4d9htoZ9NyGbHuiZOf10aW7mDSEcoVFD19sTztSV2QSZy1U2Sk5j8QrmxO06iUgwN/ODE7DfZmhmQvXtoh5tMq6uaqA2Esa9cry7RNJ81qb3f2ZzYo3GXoJf3F/7/KxkDCVaTJbwnwlngrGgVQOYj0SgbisKismPg2SSUwj17bBU/RPU0HqHUhNxyP1rV+lUnqGFpTNWZQhSYrT+CoOXtHFYHgAhV9/8Bz6cmr9lmRqsBNejBu2aWLfFMI8IidNmNJOjCPYASbVM9a79Z2QZ0Ruhtf7J2o/xX1FD7E0bEjhS+zC6bCY8Z5PXNntnbmWdFJd8JBJohPVSoGDapuc2IwE8+udc/DVqRvl2Nw8DaDGlxdl0nY+kW7OKPZ75O0SABqWiqQQ9dfJRHPPijprVm1HmEq8LoRD/WJSMIj5QjwAwqdZvxynyS++WjXVxAxErJRoPlFSZbHTa972h6ObFPxxDc5VZUXhC4rEvuus8wB6Nw2WxO+gtzRkKrxWrO7/Cg/mmsASh5YaE9cyOlAqexRc6RuQL/y38QhmxKIfAL5BZG3x/qvEw7haySAi4jeOTxuWEBROnO7sOiPjuEjUs3bYsWaVpP3XaK14w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5470
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	70c4d135-a4d1-42ba-d85b-08d875f12915
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2m/MV9Fs2p40aldh8Zcc2Rney2HWe2tfKZKs/RvVHu3o5C0NYgrx6+tBsWenircJDpM95m6HcPQ7r8n31yYphOXva/+AhlvATJIng+aWOvWYth/YwkAtQVWWkWHKa7Ze/7hm/0/8A0/h3tIQ4IqbhHpOQgiHNGhGqx8rTtTtCS4dzBhleqFYMU9G+n7Ii85tAyUb7NYX0UPxyz1EBwi33k85oCPE71fNseUMryD5k+T+DJq4dV1BjBu5x1Oj8DTGBr3fNxYn0FLdF9PgxZq8Wsq88tSvYrmvy+9xS2rH2fXNUvTiED2hejmycBBUhpF4fcoV9EAMwx9bbDvPOV3uvE3EoLiR9cIfqSuZrKHe2wsp6V/mo7d7b4k3jQNLR3J6vULLGBi/ZRzEHR2M0Cmdk1TlKO/ZxxYqLx/lLSvJFlL++Cz6zR5rmwu5GytE1vPnQRcDpOFCxXU1ooEnZgy/z7j8zeGLfWABjcdrkr6gcs8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(30864003)(70206006)(6666004)(6916009)(1076003)(70586007)(5660300002)(82310400003)(2906002)(44832011)(66574015)(86362001)(16526019)(36906005)(8676002)(956004)(336012)(316002)(2616005)(356005)(26005)(83380400001)(6486002)(36756003)(7696005)(478600001)(81166007)(82740400003)(45080400002)(47076004)(4326008)(8936002)(186003)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 18:43:20.6710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d579104e-9c88-4529-992f-08d875f12ef3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4487
Content-Type: text/plain

Add patches for SCMI, MHUv2 and DRM. Also update the kernel config
to enable boot to Android home screen instead of just console.

Change-Id: Ic2af15441667b967ef360d8410de94e83eb73de4
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../linux/linux-arm-platforms.inc             |  13 +-
 ...m-Add-component-aware-simple-encoder.patch | 364 ++++++++
 ...dd-RENDER-capability-to-the-device-n.patch |  31 +
 ...2-add-device-tree-binding-documentat.patch | 134 +++
 ...ilbox-arm_mhuv2-add-arm-mhuv2-driver.patch | 822 ++++++++++++++++++
 ...2-add-doorbell-transport-protocol-op.patch | 156 ++++
 ...2-add-multi-word-transport-protocol-.patch | 271 ++++++
 ...rm_scmi-Add-fast_switch_possible-api.patch |  67 ++
 ...-Set-fast_switch_possible-conditiona.patch |  42 +
 .../tc0/defconfig                             | 444 +++++++---
 .../linux/linux-arm64-ack_5.4.bbappend        |   2 +
 11 files changed, 2208 insertions(+), 138 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0001-drm-Add-component-aware-simple-encoder.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0003-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0005-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch
 rename meta-arm-bsp/recipes-kernel/linux/{files => linux-arm64-ack-5.4}/tc0/defconfig (69%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 644ddc1..62b1dec 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -73,7 +73,18 @@ KCONFIG_MODE_sgi575 = "--alldefconfig"
 #
 # Total Compute KMACHINE
 #
-SRC_URI_append_tc0 = " file://defconfig"
 COMPATIBLE_MACHINE_tc0 = "tc0"
 KMACHINE_tc0 = "tc0"
 KCONFIG_MODE_tc0 = "--alldefconfig"
+SRC_URI_append_tc0 = " \
+    file://defconfig \
+    file://0001-drm-Add-component-aware-simple-encoder.patch \
+    file://0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch \
+    file://0003-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch \
+    file://0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch \
+    file://0005-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch \
+    file://0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch \
+    file://0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch \
+    file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch \
+    "
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0001-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0001-drm-Add-component-aware-simple-encoder.patch
new file mode 100644
index 0000000..7855bee
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0001-drm-Add-component-aware-simple-encoder.patch
@@ -0,0 +1,364 @@
+From 7863ac1515009547bae3a66e0808e72b3bdcf8c8 Mon Sep 17 00:00:00 2001
+From: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Date: Tue, 16 Jun 2020 12:39:06 +0000
+Subject: [PATCH 1/9] drm: Add component-aware simple encoder
+
+This is a simple DRM encoder that gets its connector timings information
+from a OF subnode in the device tree and exposes that as a "discovered"
+panel. It can be used together with component-based DRM drivers in an
+emulated environment where no real encoder or connector hardware exists
+and the display output is configured outside the kernel.
+
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+
+Upstream-Status: Backport [https://git.linaro.org/landing-teams/working/arm/kernel-release.git/commit/?h=latest-armlt&id=15283f7be4b1e586702551e85b4caf06531ac2fc]
+---
+ drivers/gpu/drm/Kconfig               |  11 +
+ drivers/gpu/drm/Makefile              |   2 +
+ drivers/gpu/drm/drm_virtual_encoder.c | 299 ++++++++++++++++++++++++++
+ 3 files changed, 312 insertions(+)
+ create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
+
+diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
+index e67c194c2aca..c95279cd9341 100644
+--- a/drivers/gpu/drm/Kconfig
++++ b/drivers/gpu/drm/Kconfig
+@@ -265,6 +265,17 @@ config DRM_VKMS
+ 
+ 	  If M is selected the module will be called vkms.
+ 
++config DRM_VIRT_ENCODER
++       tristate "Virtual OF-based encoder"
++       depends on DRM && OF
++       select VIDEOMODE_HELPERS
++       help
++         Choose this option to get a virtual encoder and its associated
++         connector that will use the device tree to read the display
++         timings information. If M is selected the module will be called
++         drm_vencoder.
++
++
+ config DRM_ATI_PCIGART
+         bool
+ 
+diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
+index 82ff826b33cc..d2ab6fc64932 100644
+--- a/drivers/gpu/drm/Makefile
++++ b/drivers/gpu/drm/Makefile
+@@ -53,6 +53,8 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
+ 
+ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
+ obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
++drm_vencoder-y := drm_virtual_encoder.o
++obj-$(CONFIG_DRM_VIRT_ENCODER) += drm_vencoder.o
+ 
+ obj-$(CONFIG_DRM)	+= drm.o
+ obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
+diff --git a/drivers/gpu/drm/drm_virtual_encoder.c b/drivers/gpu/drm/drm_virtual_encoder.c
+new file mode 100644
+index 000000000000..4fd2098df286
+--- /dev/null
++++ b/drivers/gpu/drm/drm_virtual_encoder.c
+@@ -0,0 +1,299 @@
++/*
++ * Copyright (C) 2016 ARM Limited
++ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
++ *
++ * Dummy encoder and connector that use the OF to "discover" the attached
++ * display timings. Can be used in situations where the encoder and connector's
++ * functionality are emulated and no setup steps are needed, or to describe
++ * attached panels for which no driver exists but can be used without
++ * additional hardware setup.
++ *
++ * The encoder also uses the component framework so that it can be a quick
++ * replacement for existing drivers when testing in an emulated environment.
++ *
++ * This file is subject to the terms and conditions of the GNU General Public
++ * License.  See the file COPYING in the main directory of this archive
++ * for more details.
++ *
++ */
++
++#include <drm/drm_crtc.h>
++#include <drm/drm_atomic_helper.h>
++#include <drm/drm_crtc_helper.h>
++#include <drm/drm_probe_helper.h>
++#include <drm/drm_print.h>
++#include <linux/platform_device.h>
++#include <drm/drm_of.h>
++#include <linux/component.h>
++#include <video/display_timing.h>
++#include <video/of_display_timing.h>
++#include <video/videomode.h>
++
++struct drm_virt_priv {
++	struct drm_connector connector;
++	struct drm_encoder encoder;
++	struct display_timings *timings;
++};
++
++#define connector_to_drm_virt_priv(x) \
++	container_of(x, struct drm_virt_priv, connector)
++
++#define encoder_to_drm_virt_priv(x) \
++	container_of(x, struct drm_virt_priv, encoder)
++
++static void drm_virtcon_destroy(struct drm_connector *connector)
++{
++	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
++
++	drm_connector_cleanup(connector);
++	display_timings_release(conn->timings);
++}
++
++static enum drm_connector_status
++drm_virtcon_detect(struct drm_connector *connector, bool force)
++{
++	return connector_status_connected;
++}
++
++static const struct drm_connector_funcs drm_virtcon_funcs = {
++	.reset = drm_atomic_helper_connector_reset,
++	.detect	= drm_virtcon_detect,
++	.fill_modes = drm_helper_probe_single_connector_modes,
++	.destroy = drm_virtcon_destroy,
++	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
++	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
++};
++
++static int drm_virtcon_get_modes(struct drm_connector *connector)
++{
++	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
++	struct display_timings *timings = conn->timings;
++	int i;
++
++	for (i = 0; i < timings->num_timings; i++) {
++		struct drm_display_mode *mode = drm_mode_create(connector->dev);
++		struct videomode vm;
++
++		if (videomode_from_timings(timings, &vm, i))
++			break;
++
++		drm_display_mode_from_videomode(&vm, mode);
++		mode->type = DRM_MODE_TYPE_DRIVER;
++		if (timings->native_mode == i)
++			mode->type = DRM_MODE_TYPE_PREFERRED;
++
++		drm_mode_set_name(mode);
++		drm_mode_probed_add(connector, mode);
++	}
++
++	return i;
++}
++
++static int drm_virtcon_mode_valid(struct drm_connector *connector,
++				   struct drm_display_mode *mode)
++{
++	return MODE_OK;
++}
++
++struct drm_encoder *drm_virtcon_best_encoder(struct drm_connector *connector)
++{
++	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
++
++	return &priv->encoder;
++}
++
++struct drm_encoder *
++drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
++				 struct drm_connector_state *connector_state)
++{
++	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
++
++	return &priv->encoder;
++}
++
++static const struct drm_connector_helper_funcs drm_virtcon_helper_funcs = {
++	.get_modes = drm_virtcon_get_modes,
++	.mode_valid = drm_virtcon_mode_valid,
++	.best_encoder = drm_virtcon_best_encoder,
++	.atomic_best_encoder = drm_virtcon_atomic_best_encoder,
++};
++
++static void drm_vencoder_destroy(struct drm_encoder *encoder)
++{
++	drm_encoder_cleanup(encoder);
++}
++
++static const struct drm_encoder_funcs drm_vencoder_funcs = {
++	.destroy = drm_vencoder_destroy,
++};
++
++static void drm_vencoder_dpms(struct drm_encoder *encoder, int mode)
++{
++	/* nothing needed */
++}
++
++static bool drm_vencoder_mode_fixup(struct drm_encoder *encoder,
++				    const struct drm_display_mode *mode,
++				    struct drm_display_mode *adjusted_mode)
++{
++	/* nothing needed */
++	return true;
++}
++
++static void drm_vencoder_prepare(struct drm_encoder *encoder)
++{
++	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_OFF);
++}
++
++static void drm_vencoder_commit(struct drm_encoder *encoder)
++{
++	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_ON);
++}
++
++static void drm_vencoder_mode_set(struct drm_encoder *encoder,
++				  struct drm_display_mode *mode,
++				  struct drm_display_mode *adjusted_mode)
++{
++	/* nothing needed */
++}
++
++static const struct drm_encoder_helper_funcs drm_vencoder_helper_funcs = {
++	.dpms		= drm_vencoder_dpms,
++	.mode_fixup	= drm_vencoder_mode_fixup,
++	.prepare	= drm_vencoder_prepare,
++	.commit		= drm_vencoder_commit,
++	.mode_set	= drm_vencoder_mode_set,
++};
++
++static int drm_vencoder_bind(struct device *dev, struct device *master,
++			     void *data)
++{
++	struct drm_encoder *encoder;
++	struct drm_virt_priv *con;
++	struct drm_connector *connector;
++	struct drm_device *drm = data;
++	u32 crtcs = 0;
++	int ret;
++
++	con = devm_kzalloc(dev, sizeof(*con), GFP_KERNEL);
++	if (!con)
++		return -ENOMEM;
++
++	dev_set_drvdata(dev, con);
++	connector = &con->connector;
++	encoder = &con->encoder;
++
++	if (dev->of_node) {
++		struct drm_bridge *bridge;
++		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
++		bridge = of_drm_find_bridge(dev->of_node);
++		if (bridge) {
++			ret = drm_bridge_attach(encoder, bridge, NULL);
++			if (ret) {
++				DRM_ERROR("Failed to initialize bridge\n");
++				return ret;
++			}
++		}
++		con->timings = of_get_display_timings(dev->of_node);
++		if (!con->timings) {
++			dev_err(dev, "failed to get display panel timings\n");
++			return ENXIO;
++		}
++	}
++
++	/* If no CRTCs were found, fall back to the old encoder's behaviour */
++	if (crtcs == 0) {
++		dev_warn(dev, "Falling back to first CRTC\n");
++		crtcs = 1 << 0;
++	}
++
++	encoder->possible_crtcs = crtcs ? crtcs : 1;
++	encoder->possible_clones = 0;
++
++	ret = drm_encoder_init(drm, encoder, &drm_vencoder_funcs,
++			       DRM_MODE_ENCODER_VIRTUAL, NULL);
++	if (ret)
++		goto encoder_init_err;
++
++	drm_encoder_helper_add(encoder, &drm_vencoder_helper_funcs);
++
++	/* bogus values, pretend we're a 24" screen for DPI calculations */
++	connector->display_info.width_mm = 519;
++	connector->display_info.height_mm = 324;
++	connector->interlace_allowed = false;
++	connector->doublescan_allowed = false;
++	connector->polled = 0;
++
++	ret = drm_connector_init(drm, connector, &drm_virtcon_funcs,
++				 DRM_MODE_CONNECTOR_VIRTUAL);
++	if (ret)
++		goto connector_init_err;
++
++	drm_connector_helper_add(connector, &drm_virtcon_helper_funcs);
++
++	drm_connector_register(connector);
++
++	ret = drm_connector_attach_encoder(connector, encoder);
++	if (ret)
++		goto attach_err;
++
++	return ret;
++
++attach_err:
++	drm_connector_unregister(connector);
++	drm_connector_cleanup(connector);
++connector_init_err:
++	drm_encoder_cleanup(encoder);
++encoder_init_err:
++	display_timings_release(con->timings);
++
++	return ret;
++};
++
++static void drm_vencoder_unbind(struct device *dev, struct device *master,
++				void *data)
++{
++	struct drm_virt_priv *con = dev_get_drvdata(dev);
++
++	drm_connector_unregister(&con->connector);
++	drm_connector_cleanup(&con->connector);
++	drm_encoder_cleanup(&con->encoder);
++	display_timings_release(con->timings);
++}
++
++static const struct component_ops drm_vencoder_ops = {
++	.bind = drm_vencoder_bind,
++	.unbind = drm_vencoder_unbind,
++};
++
++static int drm_vencoder_probe(struct platform_device *pdev)
++{
++	return component_add(&pdev->dev, &drm_vencoder_ops);
++}
++
++static int drm_vencoder_remove(struct platform_device *pdev)
++{
++	component_del(&pdev->dev, &drm_vencoder_ops);
++	return 0;
++}
++
++static const struct of_device_id drm_vencoder_of_match[] = {
++	{ .compatible = "drm,virtual-encoder", },
++	{},
++};
++MODULE_DEVICE_TABLE(of, drm_vencoder_of_match);
++
++static struct platform_driver drm_vencoder_driver = {
++	.probe = drm_vencoder_probe,
++	.remove = drm_vencoder_remove,
++	.driver = {
++		.name = "drm_vencoder",
++		.of_match_table = drm_vencoder_of_match,
++	},
++};
++
++module_platform_driver(drm_vencoder_driver);
++
++MODULE_AUTHOR("Liviu Dudau");
++MODULE_DESCRIPTION("Virtual DRM Encoder");
++MODULE_LICENSE("GPL v2");
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
new file mode 100644
index 0000000..412e982
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0002-drm-arm-komeda-add-RENDER-capability-to-the-device-n.patch
@@ -0,0 +1,31 @@
+From 190c6354a0d80c31214550553cfbee25571e1942 Mon Sep 17 00:00:00 2001
+From: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Date: Wed, 17 Jun 2020 10:49:26 +0000
+Subject: [PATCH 2/9] drm: arm: komeda: add RENDER capability to the device
+ node
+
+this is required to make this driver work with android framework
+
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+
+Upstream-Status: Inappropriate [Product specific configuration]
+---
+ drivers/gpu/drm/arm/display/komeda/komeda_kms.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+index ae274902ff92..238bd8466206 100644
+--- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
++++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
+@@ -56,7 +56,7 @@ static irqreturn_t komeda_kms_irq_handler(int irq, void *data)
+ }
+ 
+ static struct drm_driver komeda_kms_driver = {
+-	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
++	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_RENDER,
+ 	.lastclose			= drm_fb_helper_lastclose,
+ 	.gem_free_object_unlocked	= drm_gem_cma_free_object,
+ 	.gem_vm_ops			= &drm_gem_cma_vm_ops,
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0003-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0003-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch
new file mode 100644
index 0000000..060be39
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0003-mailbox-arm_mhuv2-add-device-tree-binding-documentat.patch
@@ -0,0 +1,134 @@
+From bca81c4c54765565651634b6de5edb6a191577a3 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Thu, 27 Jun 2019 11:16:22 +0100
+Subject: [PATCH 3/9] mailbox: arm_mhuv2: add device tree binding documentation
+
+This patch adds device tree binding for Message Handling Unit
+controller version 2 from Arm.
+
+Change-Id: I8c46dd7cd1a48450020c33721ea7cce9f8b8e64f
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Cc: robh+dt@kernel.org
+Cc: mark.rutland@arm.com
+Cc: devicetree@vger.kernel.org
+Cc: jassisinghbrar@gmail.com
+
+Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
+---
+ .../devicetree/bindings/mailbox/arm,mhuv2.txt | 101 ++++++++++++++++++
+ 1 file changed, 101 insertions(+)
+ create mode 100644 Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
+
+diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
+new file mode 100644
+index 000000000000..5b8a2ab21ae0
+--- /dev/null
++++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.txt
+@@ -0,0 +1,101 @@
++Arm MHUv2 Mailbox Driver
++========================
++
++The Arm Message-Handling-Unit (MHU) Version 2 is a mailbox controller that has
++between 1 and 124 channel windows to provide unidirectional communication with
++remote processor(s).
++
++Given the unidirectional nature of the device, an MHUv2 mailbox may only be
++written to or read from. If a pair of MHU devices is implemented between two
++processing elements to provide bidirectional communication, these must be
++specified as two separate mailboxes.
++
++If the interrupts property is present in device tree node, then its treated
++as a receiver frame, otherwise a sender frame.
++
++An MHU device must be specified with a transport protocol. The transport
++protocol of an MHU device determines the method of data transmission as well as
++the number of provided mailboxes.
++Following are the possible transport protocol types:
++- Single-word:	An MHU device implements as many mailboxes as it
++		provides channel windows. Data is transmitted through
++		the MHU registers.
++- Multi-word:	An MHU device implements a single mailbox. All channel windows
++		will be used during transmission. Data is transmitted through
++		the MHU registers.
++- Doorbell:	An MHU device implements as many mailboxes as there are flag
++		bits available in its channel windows. Optionally, data may
++		be transmitted through a shared memory region, wherein the MHU
++		is used strictly as an interrupt generation mechanism.
++
++Mailbox Device Node:
++====================
++
++Required properties:
++--------------------
++- compatible:	Shall be "arm,mhuv2" & "arm,primecell"
++- reg:		Contains the mailbox register address range (base
++		address and length)
++- #mbox-cells	Shall be 1 - the index of the channel needed.
++- mhu-protocol	Transport protocol of the device. Shall be one of the
++		following: "single-word", "multi-word", "doorbell"
++
++Required properties (receiver frame):
++-------------------------------------
++- interrupts:	Contains the interrupt information for the receiver frame
++
++Example:
++--------
++
++	mbox_mw_tx: mhu@10000000 {
++		compatible = "arm,mhuv2","arm,primecell";
++		reg = <0x10000000 0x1000>;
++		clocks = <&refclk100mhz>;
++		clock-names = "apb_pclk";
++		#mbox-cells = <1>;
++		mhu-protocol = "multi-word";
++	};
++
++	mbox_sw_tx: mhu@10000000 {
++		compatible = "arm,mhuv2","arm,primecell";
++		reg = <0x11000000 0x1000>;
++		clocks = <&refclk100mhz>;
++		clock-names = "apb_pclk";
++		#mbox-cells = <1>;
++		mhu-protocol = "single-word";
++	};
++
++	mbox_db_rx: mhu@10000000 {
++		compatible = "arm,mhuv2","arm,primecell";
++		reg = <0x12000000 0x1000>;
++		clocks = <&refclk100mhz>;
++		clock-names = "apb_pclk";
++		#mbox-cells = <1>;
++		interrupts = <0 45 4>;
++		interrupt-names = "mhu_rx";
++		mhu-protocol = "doorbell";
++	};
++
++	mhu_client: scb@2e000000 {
++	compatible = "fujitsu,mb86s70-scb-1.0";
++	reg = <0 0x2e000000 0x4000>;
++	mboxes =
++		// For multi-word frames, client may only instantiate a single
++		// mailbox for a mailbox controller
++		<&mbox_mw_tx 0>,
++
++		// For single-word frames, client may instantiate as many
++		// mailboxes as there are channel windows in the MHU
++		 <&mbox_sw_tx 0>,
++		 <&mbox_sw_tx 1>,
++		 <&mbox_sw_tx 2>,
++		 <&mbox_sw_tx 3>,
++
++		// For doorbell frames, client may instantiate as many mailboxes
++		// as there are bits available in the combined number of channel
++		// windows ((channel windows * 32) mailboxes)
++		 <mbox_db_rx 0>,
++		 <mbox_db_rx 1>,
++		 ...
++		 <mbox_db_rx 17>;
++	};
+\ No newline at end of file
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch
new file mode 100644
index 0000000..f357935
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0004-mailbox-arm_mhuv2-add-arm-mhuv2-driver.patch
@@ -0,0 +1,822 @@
+From 364539028799290814a35aa10d32d850486f0b4a Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Thu, 27 Jun 2019 11:17:14 +0100
+Subject: [PATCH 4/9] mailbox: arm_mhuv2: add arm mhuv2 driver
+
+This commit adds a driver for the ARM MHUv2 (Message Handling Unit).
+The driver registers itself as a mailbox controller within the common
+mailbox framework.
+
+This commit implements the single-word transport protocol;
+In single-word mode, the mailbox controller will provide a mailbox for each
+channel window available in the MHU device.
+Transmitting and receiving data through the mailbox framework in
+single-word mode is done through a struct arm_mbox_msg.
+
+Change-Id: I718253ceb902a2d53f7199a746063a36129b0fa6
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Cc: jassisinghbrar@gmail.com
+Cc: devicetree@vger.kernel.org
+
+Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
+---
+ drivers/mailbox/Kconfig                  |   7 +
+ drivers/mailbox/Makefile                 |   2 +
+ drivers/mailbox/arm_mhu_v2.c             | 707 +++++++++++++++++++++++
+ include/linux/mailbox/arm-mbox-message.h |  37 ++
+ 4 files changed, 753 insertions(+)
+ create mode 100644 drivers/mailbox/arm_mhu_v2.c
+ create mode 100644 include/linux/mailbox/arm-mbox-message.h
+
+diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
+index ab4eb750bbdd..0a0dce01098c 100644
+--- a/drivers/mailbox/Kconfig
++++ b/drivers/mailbox/Kconfig
+@@ -22,6 +22,13 @@ config IMX_MBOX
+ 	help
+ 	  Mailbox implementation for i.MX Messaging Unit (MU).
+ 
++config ARM_MHU_V2
++	tristate "ARM MHUv2 Mailbox"
++	depends on ARM_AMBA
++	help
++	  Say Y here if you want to build the ARM MHUv2 controller driver,
++	  which provides unidirectional mailboxes between processing elements.
++
+ config PLATFORM_MHU
+ 	tristate "Platform MHU Mailbox"
+ 	depends on OF
+diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
+index c22fad6f696b..78377f459421 100644
+--- a/drivers/mailbox/Makefile
++++ b/drivers/mailbox/Makefile
+@@ -11,6 +11,8 @@ obj-$(CONFIG_IMX_MBOX)	+= imx-mailbox.o
+ 
+ obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+= armada-37xx-rwtm-mailbox.o
+ 
++obj-$(CONFIG_ARM_MHU_V2)	+= arm_mhu_v2.o
++
+ obj-$(CONFIG_PLATFORM_MHU)	+= platform_mhu.o
+ 
+ obj-$(CONFIG_PL320_MBOX)	+= pl320-ipc.o
+diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
+new file mode 100644
+index 000000000000..d809076eb47b
+--- /dev/null
++++ b/drivers/mailbox/arm_mhu_v2.c
+@@ -0,0 +1,707 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Arm Message Handling Unit Version 2 (MHUv2) driver
++ *
++ * An MHU device may function in one of three transport protocol modes
++ * (single-word, multi-word and doorbell).
++ * This transport protocol should be specified in the device tree entry for the
++ * device. The transport protocol determines how the underlying hardware
++ * resources of the device are utilized when transmitting data.
++ *
++ * The arm MHUv2 driver registers as a mailbox controller with the common
++ * mailbox framework. Each mailbox channel represents a separate virtual
++ * communication channel through the MHU device.
++ * The number of registered mailbox channels is dependent on both the
++ * underlying hardware - mainly the number of channel windows within each MHU
++ * frame, as well as the selected transport protocol.
++ *
++ * Copyright (C) 2019 Arm Ltd.
++ */
++
++#include <linux/slab.h>
++#include <linux/module.h>
++#include <linux/amba/bus.h>
++#include <linux/mailbox_controller.h>
++#include <linux/mailbox/arm-mbox-message.h>
++#include <linux/of_address.h>
++#include <linux/interrupt.h>
++
++/* Maximum number of channel windows */
++#define MHUV2_CHANNEL_MAX 124
++/* Number of combined interrupt status registers */
++#define MHUV2_CMB_INT_ST_REG_CNT 4
++#define MHUV2_CH_UNKNOWN -1
++
++/* Channel window status register type */
++typedef u32 mhuv2_stat_reg_t;
++#define MHUV2_STAT_BYTES sizeof(mhuv2_stat_reg_t)
++#define MHUV2_STAT_BITS (MHUV2_STAT_BYTES * __CHAR_BIT__)
++
++#define LSB_MASK(n) ((1 << (n)) - 1)
++
++#ifndef PAD
++#define _PADLINE(line) pad##line
++#define _XSTR(line) _PADLINE(line)
++#define PAD _XSTR(__LINE__)
++#endif
++
++/* ====== Arm MHUv2 register defines ====== */
++
++/* Register Message Handling Unit Configuration fields */
++struct MHU_CFG_t {
++	u32 NUM_CH : 7;
++	u32 PAD : 25;
++} __packed;
++
++/* Register Implementer Identification fields */
++struct IIDR_t {
++	u32 IMPLEMENTER : 12;
++	u32 REVISION : 4;
++	u32 VARIANT : 4;
++	u32 PRODUCT_ID : 12;
++} __packed;
++
++/* Register Architecture Identification Register fields */
++struct AIDR_t {
++	u32 ARCH_MINOR_REV : 4;
++	u32 ARCH_MAJOR_REV : 4;
++	u32 PAD : 24;
++} __packed;
++
++/* register Interrupt Status fields */
++struct INT_ST_t {
++	u32 NR2R : 1;
++	u32 R2NR : 1;
++	u32 PAD : 30;
++} __packed;
++
++/* Register Interrupt Clear fields */
++struct INT_CLR_t {
++	u32 NR2R : 1;
++	u32 R2NR : 1;
++	u32 PAD : 30;
++} __packed;
++
++/* Register Interrupt Enable fields */
++struct INT_EN_t {
++	u32 R2NR : 1;
++	u32 NR2R : 1;
++	u32 CHCOMB : 1;
++	u32 PAD : 29;
++} __packed;
++
++/* Sender Channel Window fields */
++struct mhu2_send_channel_reg {
++	mhuv2_stat_reg_t STAT;
++	u8 PAD[0xC - 0x4];
++	mhuv2_stat_reg_t STAT_SET;
++	u8 PAD[0x20 - 0x10];
++} __packed;
++
++/* Sender frame register fields */
++struct mhu2_send_frame_reg {
++	struct mhu2_send_channel_reg channel[MHUV2_CHANNEL_MAX];
++	struct MHU_CFG_t MHU_CFG;
++	u32 RESP_CFG;
++	u32 ACCESS_REQUEST;
++	u32 ACCESS_READY;
++	struct INT_ST_t INT_ST;
++	struct INT_CLR_t INT_CLR;
++	struct INT_EN_t INT_EN;
++	u32 RESERVED0;
++	u32 CHCOMB_INT_ST[MHUV2_CMB_INT_ST_REG_CNT];
++	u8 PAD[0xFC8 - 0xFB0];
++	struct IIDR_t IIDR;
++	struct AIDR_t AIDR;
++} __packed;
++
++/* Receiver Channel Window fields */
++struct mhu2_recv_channel_reg {
++	mhuv2_stat_reg_t STAT;
++	mhuv2_stat_reg_t STAT_PEND;
++	mhuv2_stat_reg_t STAT_CLEAR;
++	u8 RESERVED0[0x10 - 0x0C];
++	mhuv2_stat_reg_t MASK;
++	mhuv2_stat_reg_t MASK_SET;
++	mhuv2_stat_reg_t MASK_CLEAR;
++	u8 PAD[0x20 - 0x1C];
++} __packed;
++
++/* Receiver frame register fields */
++struct mhu2_recv_frame_reg {
++	struct mhu2_recv_channel_reg channel[MHUV2_CHANNEL_MAX];
++	struct MHU_CFG_t MHU_CFG;
++	u8 RESERVED0[0xF90 - 0xF84];
++	struct INT_ST_t INT_ST;
++	struct INT_CLR_t INT_CLR;
++	struct INT_EN_t INT_EN;
++	u32 PAD;
++	mhuv2_stat_reg_t CHCOMB_INT_ST[MHUV2_CMB_INT_ST_REG_CNT];
++	u8 RESERVED2[0xFC8 - 0xFB0];
++	struct IIDR_t IIDR;
++	struct AIDR_t AIDR;
++} __packed;
++
++/* ====== Arm MHUv2 device tree property identifiers ====== */
++
++static const char *const mhuv2_protocol_dt_identifiers[] = { "single-word",
++							     "multi-word",
++							     "doorbell" };
++
++static const char *const mhuv2_frame_dt_identifiers[] = { "receiver",
++							  "sender" };
++
++/* ====== Arm MHUv2 data structures ====== */
++
++enum mhuv2_transport_protocol { SINGLE_WORD, MULTI_WORD, DOORBELL };
++
++enum mhuv2_frame { RECEIVER_FRAME, SENDER_FRAME };
++
++/**
++ * Arm MHUv2 operations
++ *
++ * Each transport protocol must provide an implementation of the operations
++ * presented in this structure.
++ * Most operations present a struct mbox_chan* as argument. This channel will
++ * correspond to one of the virtual channels within the MHU device. What
++ * constitutes a channel within the MHU device is dependent on the transport
++ * protocol.
++ */
++struct arm_mhuv2;
++struct mhuv2_ops {
++	int (*read_data)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan,
++			 struct arm_mbox_msg *msg);
++	int (*clear_data)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan,
++			  struct arm_mbox_msg *msg);
++	int (*send_data)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan,
++			 const struct arm_mbox_msg *msg);
++	int (*setup)(struct arm_mhuv2 *mhuv2);
++	int (*last_tx_done)(struct arm_mhuv2 *mhuv2, struct mbox_chan *chan);
++	struct mbox_chan *(*get_active_mbox_chan)(struct arm_mhuv2 *mhuv2);
++};
++
++/**
++ * Arm MHUv2 mailbox channel information
++ *
++ * A channel contains a notion of its index within the array of mailbox channels
++ * which a mailbox controller allocates.
++ */
++struct arm_mhuv2_mbox_chan_priv {
++	u32 ch_idx;
++};
++
++#define mhuv2_chan_idx(_chanptr)                                               \
++	(((struct arm_mhuv2_mbox_chan_priv *)(_chanptr)->con_priv)->ch_idx)
++
++/**
++ * Arm MHUv2 mailbox controller data
++ *
++ * @reg:	Base address of the register mapping region
++ * @protocol:	Transport protocol, derived from device tree
++ * @frame:	Frame type, derived from device tree
++ * @irq:	Interrupt, only valid for receiver frames
++ * @mbox:	Mailbox controller belonging to the MHU frame
++ * @ops:	Pointer to transport-protocol specific operations
++ * @dev:	Device to which it is attached
++ */
++struct arm_mhuv2 {
++	union {
++		struct mhu2_send_frame_reg __iomem *send;
++		struct mhu2_recv_frame_reg __iomem *recv;
++	} reg;
++	enum mhuv2_frame frame;
++	unsigned int irq;
++	struct mbox_controller mbox;
++	struct mhuv2_ops *ops;
++	struct device *dev;
++};
++
++#define mhu2_from_mbox_ctrl(_mbox) container_of(_mbox, struct arm_mhuv2, mbox)
++#define mhu2_from_mbox_chan(_chan) mhu2_from_mbox_ctrl(_chan->mbox)
++
++/* Macro for reading a bitfield within a physically mapped packed struct */
++#define readl_relaxed_bitfield(_regptr, _field)                                \
++	({                                                                     \
++		mhuv2_stat_reg_t _regval;                                      \
++		BUILD_BUG_ON(sizeof(*(_regptr)) > sizeof(typeof(_regval)));    \
++		_regval = readl_relaxed((_regptr));                            \
++		(*(typeof((_regptr)))(&_regval))._field;                       \
++	})
++
++/* Macro for writing a bitfield within a physically mapped packed struct */
++#define writel_relaxed_bitfield(_value, _regptr, _field)                       \
++	({                                                                     \
++		mhuv2_stat_reg_t _regval;                                      \
++		BUILD_BUG_ON(sizeof(*_regptr) > sizeof(typeof(_regval)));      \
++		_regval = readl_relaxed(_regptr);                              \
++		(*(typeof(_regptr))(&_regval))._field = _value;                \
++		writel_relaxed(_regval, _regptr);                              \
++	})
++
++static inline int __find_set_bit(uint32_t val)
++{
++	const uint32_t trailing_zeros = __builtin_ctz(val);
++	return trailing_zeros == 32 ? -1 : trailing_zeros;
++}
++
++/**
++ * Get index of a set bit within the combined interrupt status registers
++ *
++ * The function will calculate the index being the offset from the LSB of the
++ * first combined interrupt status register.
++ *
++ */
++static inline int mhuv2_combint_idx(struct arm_mhuv2 *mhuv2)
++{
++	int ch_idx = 0;
++	int set_bit_index, reg_idx;
++
++	for (reg_idx = 0; reg_idx < MHUV2_CMB_INT_ST_REG_CNT; reg_idx++) {
++		mhuv2_stat_reg_t stat_reg;
++
++		stat_reg =
++			readl_relaxed(&mhuv2->reg.recv->CHCOMB_INT_ST[reg_idx]);
++		set_bit_index = __find_set_bit(stat_reg);
++		if (set_bit_index == -1) {
++			ch_idx += MHUV2_STAT_BITS;
++		} else {
++			ch_idx += set_bit_index;
++			break;
++		}
++	}
++	return (ch_idx >= (MHUV2_CMB_INT_ST_REG_CNT * MHUV2_STAT_BITS) ?
++			MHUV2_CH_UNKNOWN :
++			ch_idx);
++}
++
++/* ================ Single word transport protocol operations =============== */
++static inline int mhuv20_get_non_zero_ch_idx(struct arm_mhuv2 *mhuv2)
++{
++	/* Locate a channel window with a non-zero STAT register */
++	int ch_idx;
++	int ch = MHUV2_CH_UNKNOWN;
++
++	for (ch_idx = 0;
++	     ch_idx < readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
++	     ch_idx++) {
++		if (readl_relaxed(&mhuv2->reg.recv->channel[ch_idx].STAT)) {
++			ch = ch_idx;
++			break;
++		}
++	}
++	return ch;
++}
++
++static inline int mhuv2_get_non_zero_ch_idx(struct arm_mhuv2 *mhuv2)
++{
++	/* Identify index of channel window containing non-zero data */
++	switch (readl_relaxed_bitfield(&mhuv2->reg.recv->AIDR,
++				       ARCH_MINOR_REV)) {
++	case 1:
++		return mhuv2_combint_idx(mhuv2);
++	default:
++		return mhuv20_get_non_zero_ch_idx(mhuv2);
++	}
++}
++
++static inline int mhuv2_read_data_single_word(struct arm_mhuv2 *mhuv2,
++					      struct mbox_chan *chan,
++					      struct arm_mbox_msg *msg)
++{
++	const u32 ch_idx = mhuv2_chan_idx(chan);
++
++	msg->data = kzalloc(MHUV2_STAT_BYTES, GFP_KERNEL);
++	if (!msg->data)
++		return -ENOMEM;
++
++	*(mhuv2_stat_reg_t *)msg->data =
++		readl_relaxed(&mhuv2->reg.recv->channel[ch_idx].STAT);
++	msg->len = MHUV2_STAT_BYTES;
++	return 0;
++}
++
++static inline int mhuv2_clear_data_single_word(struct arm_mhuv2 *mhuv2,
++					       struct mbox_chan *chan,
++					       struct arm_mbox_msg *msg)
++{
++	const u32 ch_idx = mhuv2_chan_idx(chan);
++
++	writel_relaxed(readl_relaxed(&mhuv2->reg.recv->channel[ch_idx].STAT),
++		       &mhuv2->reg.recv->channel[ch_idx].STAT_CLEAR);
++	return 0;
++}
++
++static inline int mhuv2_send_data_single_word(struct arm_mhuv2 *mhuv2,
++					      struct mbox_chan *chan,
++					      const struct arm_mbox_msg *msg)
++{
++	const u32 ch_idx = mhuv2_chan_idx(chan);
++	int bytes_left = msg->len;
++	char *data = msg->data;
++
++	if (ch_idx >= readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH))
++		return -ENODEV;
++
++	while (bytes_left > 0) {
++		mhuv2_stat_reg_t word = *(mhuv2_stat_reg_t *)(data);
++
++		if (bytes_left < MHUV2_STAT_BYTES)
++			word &= LSB_MASK(bytes_left * __CHAR_BIT__);
++
++		if (!word) {
++			dev_err(mhuv2->dev,
++				"Data transmitted in single-word mode must be non-zero\n");
++			return -EINVAL;
++		}
++		writel_relaxed(word,
++			       &mhuv2->reg.send->channel[ch_idx].STAT_SET);
++		while (readl_relaxed(&mhuv2->reg.send->channel[ch_idx].STAT))
++			continue;
++		bytes_left -= MHUV2_STAT_BYTES;
++		data += MHUV2_STAT_BYTES;
++	}
++
++	return 0;
++}
++
++static inline int mhuv2_last_tx_done_single_word(struct arm_mhuv2 *mhuv2,
++						 struct mbox_chan *chan)
++{
++	const u32 ch_idx = mhuv2_chan_idx(chan);
++
++	return readl_relaxed(&mhuv2->reg.send->channel[ch_idx].STAT) == 0;
++}
++
++static inline int mhuv2_setup_single_word(struct arm_mhuv2 *mhuv2)
++{
++	int i;
++	const u32 channel_windows =
++		readl_relaxed_bitfield(mhuv2->frame == RECEIVER_FRAME ?
++					       &mhuv2->reg.recv->MHU_CFG :
++					       &mhuv2->reg.send->MHU_CFG,
++				       NUM_CH);
++
++	mhuv2->mbox.num_chans = channel_windows;
++	mhuv2->mbox.chans =
++		devm_kzalloc(mhuv2->dev,
++			     mhuv2->mbox.num_chans * sizeof(struct mbox_chan),
++			     GFP_KERNEL);
++
++	for (i = 0; i < mhuv2->mbox.num_chans; i++) {
++		mhuv2->mbox.chans[i].con_priv =
++			devm_kzalloc(mhuv2->dev,
++				     sizeof(struct arm_mhuv2_mbox_chan_priv),
++				     GFP_KERNEL);
++		mhuv2_chan_idx(&mhuv2->mbox.chans[i]) = i;
++	}
++
++	if (mhuv2->frame == RECEIVER_FRAME) {
++		/* Ensure all status registers are unmasked */
++		for (i = 0; i < channel_windows; i++) {
++			writel_relaxed(0x0,
++				       &mhuv2->reg.recv->channel[i].MASK_SET);
++		}
++	}
++
++	return 0;
++}
++
++static inline struct mbox_chan *
++	mhuv2_get_active_mbox_chan_single_word(struct arm_mhuv2 *mhuv2)
++{
++	const u32 ch_idx = mhuv2_get_non_zero_ch_idx(mhuv2);
++
++	if (ch_idx >= mhuv2->mbox.num_chans) {
++		dev_err(mhuv2->dev,
++			"Invalid active channel in single word mode\n");
++		return ERR_PTR(-EINVAL);
++	}
++	return &mhuv2->mbox.chans[ch_idx];
++}
++
++static const struct mhuv2_ops mhuv2_single_word_ops = {
++	.read_data = mhuv2_read_data_single_word,
++	.clear_data = mhuv2_clear_data_single_word,
++	.send_data = mhuv2_send_data_single_word,
++	.setup = mhuv2_setup_single_word,
++	.last_tx_done = mhuv2_last_tx_done_single_word,
++	.get_active_mbox_chan = mhuv2_get_active_mbox_chan_single_word,
++};
++/* ========================================================================== */
++
++/*
++ * MHUv2 receiver interrupt service routine
++ *
++ * This routine will be called whenever a reception interrupt is raised on the
++ * MHU device. Given that an MHU device may manage multiple mailboxes, it is
++ * up to the protocol-specific operations to determine:
++ * - What is the active mailbox channel
++ * - Read the data within the MHU corresponding to the channel
++ * - Clear the data within the MHU corresponding to the channel
++ *
++ * These operations must also ensure to not overwrite any data which may belong
++ * to a different mailbox channel. For instance, if data is received in two
++ * channel windows in single-word mode, the ISR will read and clear the data
++ * from one of these channel windows within a pass. This will result in a status
++ * register being non-zero upon returning from this routine, which in turn
++ * will keep the interrupt asserted for a second round.
++ */
++static irqreturn_t mhuv2_rx_interrupt(int irq, void *data)
++{
++	struct arm_mbox_msg msg;
++	int status;
++	struct arm_mhuv2 *mhuv2 = data;
++	struct mbox_chan *chan = mhuv2->ops->get_active_mbox_chan(mhuv2);
++
++	msg.data = NULL;
++	msg.len = 0;
++
++	status = mhuv2->ops->read_data(mhuv2, chan, &msg);
++	if (status != 0)
++		goto rx_exit;
++
++	if (!chan->cl) {
++		dev_warn(
++			mhuv2->dev,
++			"Warning: Received data on channel not currently attached to "
++			 "a mailbox client\n");
++	} else {
++		mbox_chan_received_data(chan, (void *)&msg);
++	}
++
++	status = mhuv2->ops->clear_data(mhuv2, chan, &msg);
++
++rx_exit:
++	kfree(msg.data);
++
++	return status == 0 ? IRQ_HANDLED : IRQ_NONE;
++}
++
++static bool mhuv2_last_tx_done(struct mbox_chan *chan)
++{
++	struct arm_mhuv2 *mhuv2 = mhu2_from_mbox_chan(chan);
++
++	return mhuv2->ops->last_tx_done(mhuv2, chan);
++}
++
++static int mhuv2_send_data(struct mbox_chan *chan, void *data)
++{
++	struct arm_mhuv2 *mhuv2 = mhu2_from_mbox_chan(chan);
++	struct arm_mbox_msg *msg = data;
++	int ret;
++
++	if (!mhuv2->ops->last_tx_done(mhuv2, chan))
++		return -EBUSY;
++
++	ret = mhuv2->ops->send_data(mhuv2, chan, msg);
++	return ret;
++}
++
++static int mhuv2_startup(struct mbox_chan *chan)
++{
++	struct arm_mhuv2 *mhuv2 = mhu2_from_mbox_ctrl(chan->mbox);
++
++	writel_relaxed(0x1, &mhuv2->reg.send->ACCESS_REQUEST);
++	while (!readl_relaxed(&mhuv2->reg.send->ACCESS_READY))
++		continue;
++
++	return 0;
++}
++
++static void mhuv2_shutdown(struct mbox_chan *chan)
++{
++	struct arm_mhuv2 *mhuv2 = mhu2_from_mbox_ctrl(chan->mbox);
++
++	writel_relaxed(0x0, &mhuv2->reg.send->ACCESS_REQUEST);
++}
++
++static int mhuv2_recv_startup(struct mbox_chan *chan)
++{
++	return 0;
++}
++
++static void mhuv2_recv_shutdown(struct mbox_chan *chan)
++{
++}
++
++static int mhuv2_recv_send_data(struct mbox_chan *chan, void *data)
++{
++	dev_err(chan->mbox->dev,
++		"Trying to transmit on a receiver MHU frame\n");
++	return -EIO;
++}
++
++static bool mhuv2_recv_last_tx_done(struct mbox_chan *chan)
++{
++	dev_err(chan->mbox->dev, "Trying to Tx poll on a receiver MHU frame\n");
++	return true;
++}
++
++static const struct mbox_chan_ops mhuv2_receiver_ops = {
++	.send_data = mhuv2_recv_send_data,
++	.startup = mhuv2_recv_startup,
++	.shutdown = mhuv2_recv_shutdown,
++	.last_tx_done = mhuv2_recv_last_tx_done,
++};
++
++static const struct mbox_chan_ops mhuv2_sender_ops = {
++	.send_data = mhuv2_send_data,
++	.startup = mhuv2_startup,
++	.shutdown = mhuv2_shutdown,
++	.last_tx_done = mhuv2_last_tx_done,
++};
++
++static struct mbox_chan *mhuv2_mbox_of_xlate(struct mbox_controller *ctrl,
++					     const struct of_phandle_args *pa)
++{
++	struct mbox_chan *chan;
++
++	if (pa->args_count != 1)
++		return ERR_PTR(-EINVAL);
++
++	if (pa->args[0] >= ctrl->num_chans)
++		return ERR_PTR(-ENOENT);
++
++	chan = &ctrl->chans[pa->args[0]];
++	return chan;
++}
++
++static int mhuv2_probe(struct amba_device *adev, const struct amba_id *id)
++{
++	int err;
++	struct device *dev = &adev->dev;
++	const struct device_node *np = dev->of_node;
++	struct arm_mhuv2 *mhuv2;
++	const char *mhuv2_protocol_str;
++
++	/* Allocate memory for device */
++	mhuv2 = devm_kzalloc(dev, sizeof(*mhuv2), GFP_KERNEL);
++	if (!mhuv2)
++		return -ENOMEM;
++
++	mhuv2->dev = dev;
++
++	/* Assign transport protocol-specific operations */
++	err = of_property_read_string(np, "mhu-protocol", &mhuv2_protocol_str);
++
++	if (err) {
++		dev_err(dev,
++			 "Probe failed: no transport protocol specified\n");
++		return -ENODEV;
++	} else if (strcmp(mhuv2_protocol_str,
++		mhuv2_protocol_dt_identifiers[SINGLE_WORD]) == 0) {
++		mhuv2->ops = &mhuv2_single_word_ops;
++	} else {
++		dev_err(dev,
++			"Probe failed: '%s' is not a valid transport protocol specifier\n",
++			mhuv2_protocol_str);
++		return -ENODEV;
++	}
++
++	/* Get MHU type specific properties from device tree */
++	if (adev->irq[0]) {
++		mhuv2->frame = RECEIVER_FRAME;
++		mhuv2->reg.recv = (struct mhu2_recv_frame_reg *)of_iomap(
++			(struct device_node *)np, 0);
++		if (!mhuv2->reg.recv)
++			goto io_fail;
++		mhuv2->irq = adev->irq[0];
++	} else {
++		mhuv2->frame = SENDER_FRAME;
++		mhuv2->reg.send = (struct mhu2_send_frame_reg *)of_iomap(
++			(struct device_node *)np, 0);
++		if (!mhuv2->reg.send)
++			goto io_fail;
++	}
++
++	/* Mailbox controller setup */
++	mhuv2->mbox.dev = dev;
++	mhuv2->mbox.txdone_irq = false;
++	mhuv2->mbox.txdone_poll = true;
++	mhuv2->mbox.txpoll_period = 1;
++	mhuv2->mbox.of_xlate = mhuv2_mbox_of_xlate;
++	mhuv2->mbox.ops = mhuv2->frame == SENDER_FRAME ? &mhuv2_sender_ops :
++							 &mhuv2_receiver_ops;
++	/*
++	 * Transport protocol specific setup
++	 * Setup function _must_ allocate mailbox channels according to the
++	 * number of channels provided in the given transport protocol mode.
++	 */
++	err = mhuv2->ops->setup(mhuv2);
++	if (err)
++		return err;
++
++	/* Request an interrupt if this is a receiver frame */
++	if (mhuv2->frame == RECEIVER_FRAME) {
++		err = devm_request_threaded_irq(dev, adev->irq[0], NULL,
++			mhuv2_rx_interrupt, IRQF_ONESHOT, "mhuv2_link", mhuv2);
++		if (err) {
++			dev_err(dev, "unable to acquire IRQ %d\n", mhuv2->irq);
++			return err;
++		}
++		/*
++		 * For minor version 1 and forward, the combined interrupt of
++		 * the receiver frame must be explicitly enabled during startup.
++		 */
++		if (readl_relaxed_bitfield(&mhuv2->reg.recv->AIDR,
++					   ARCH_MINOR_REV) > 0) {
++			writel_relaxed_bitfield(1, &mhuv2->reg.recv->INT_EN,
++						CHCOMB);
++		}
++	}
++
++	amba_set_drvdata(adev, mhuv2);
++
++	err = devm_mbox_controller_register(dev, &mhuv2->mbox);
++	if (err) {
++		dev_err(dev, "failed to register ARM MHUv2 driver %d\n", err);
++		iounmap(mhuv2->frame == RECEIVER_FRAME ? mhuv2->reg.recv :
++							 mhuv2->reg.send);
++		return err;
++	}
++
++	dev_info(dev, "ARM MHUv2 %s frame (%s) Mailbox driver registered\n",
++		 mhuv2_frame_dt_identifiers[mhuv2->frame],
++		 mhuv2_protocol_str);
++
++	return 0;
++
++io_fail:
++	dev_err(dev, "Probe failed: failed to map '%s' frame\n",
++		mhuv2_frame_dt_identifiers[mhuv2->frame]);
++	iounmap(mhuv2->frame == RECEIVER_FRAME ? mhuv2->reg.recv :
++						 mhuv2->reg.send);
++	return -ENOMEM;
++}
++
++static int mhuv2_remove(struct amba_device *adev)
++{
++	return 0;
++}
++
++static struct amba_id mhuv2_ids[] = {
++	{
++		.id = 0x4b0d1,
++		.mask = 0xfffff,
++	},
++	{
++		.id = 0xbb0d1,
++		.mask = 0xfffff,
++	},
++	{ 0, 0 },
++};
++MODULE_DEVICE_TABLE(amba, mhuv2_ids);
++
++static struct amba_driver arm_mhuv2_driver = {
++	.drv = {
++		.name	= "mhuv2",
++	},
++	.id_table	= mhuv2_ids,
++	.probe		= mhuv2_probe,
++	.remove		= mhuv2_remove,
++};
++module_amba_driver(arm_mhuv2_driver);
++
++MODULE_LICENSE("GPL v2");
++MODULE_DESCRIPTION("ARM MHUv2 Driver");
++MODULE_AUTHOR("Morten Borup Petersen <morten.petersen@arm.com>");
+diff --git a/include/linux/mailbox/arm-mbox-message.h b/include/linux/mailbox/arm-mbox-message.h
+new file mode 100644
+index 000000000000..112b4f927c1a
+--- /dev/null
++++ b/include/linux/mailbox/arm-mbox-message.h
+@@ -0,0 +1,37 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Arm Mailbox Message
++ *
++ * The Arm mailbox message structure is used to pass data- and length
++ * information between a mailbox client and mailbox controller, through the
++ * provided void* of the common mailbox frameworks send- and receive APIs.
++ *
++ * This will be utilized when a mailbox controller is able to transmit
++ * more than a single word within a transmission, allowing the controller
++ * to fully utilize its available resources.
++ * No message protocol is enforced through this structure - a utilizing mailbox
++ * client driver shall implement its own message protocol, which may then be
++ * transmitted through an arm_mbox_msg.
++ *
++ * Given a message protocol of size A and an arm_mbox_msg containing data of
++ * length B, a mailbox channel may callback with B < A. In this case, the
++ * message protocol driver must implement a state machine which allows for
++ * multiple callbacks that provides parts of a full message of size A. This
++ * state machine must account for, that the length of the arm_mbox_msg received
++ * may vary between callbacks based on the underlying hardware as well as the
++ * transmitted data.
++ *
++ * Copyright (C) 2019 Arm Ltd.
++ */
++
++#ifndef _LINUX_ARM_MBOX_MESSAGE_H_
++#define _LINUX_ARM_MBOX_MESSAGE_H_
++
++#include <linux/types.h>
++
++struct arm_mbox_msg {
++	void *data;
++	size_t len;
++};
++
++#endif /* _LINUX_ARM_MBOX_MESSAGE_H_ */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0005-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0005-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch
new file mode 100644
index 0000000..a548d49
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0005-mailbox-arm_mhuv2-add-doorbell-transport-protocol-op.patch
@@ -0,0 +1,156 @@
+From 515a936531a25a0c48a97efe3828962ed8d781dd Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Wed, 19 Jun 2019 16:55:20 +0100
+Subject: [PATCH 5/9] mailbox: arm_mhuv2: add doorbell transport protocol
+ operations
+
+In doorbell mode, the mailbox controller will provide a mailbox for each
+flag bit available in the combined number of channel windows available
+within the MHU device.
+
+When in doorbell mode, the MHU should be used solely as an interrupt
+generating mechanism. If data is to be transmitted, this must be done
+out-band, ie. through shared memory, by a driving utilizing the mailbox
+for interrupt generation.
+
+Change-Id: I8410b21471743c0b624c873388f9629ea0863789
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Cc:Jassi Brar <jassisinghbrar@gmail.com
+Cc: devicetree@vger.kernel.org
+
+Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
+---
+ drivers/mailbox/arm_mhu_v2.c | 108 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 108 insertions(+)
+
+diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
+index d809076eb47b..efde7a71a3f7 100644
+--- a/drivers/mailbox/arm_mhu_v2.c
++++ b/drivers/mailbox/arm_mhu_v2.c
+@@ -429,6 +429,111 @@ static const struct mhuv2_ops mhuv2_single_word_ops = {
+ };
+ /* ========================================================================== */
+ 
++/* =================== Doorbell transport protocol operations =============== */
++
++static inline int mhuv2_read_data_doorbell(struct arm_mhuv2 *mhuv2,
++					   struct mbox_chan *chan,
++					   struct arm_mbox_msg *msg)
++{
++	return 0;
++}
++
++static inline int mhuv2_clear_data_doorbell(struct arm_mhuv2 *mhuv2,
++					    struct mbox_chan *chan,
++					    struct arm_mbox_msg *msg)
++{
++	const u32 ch_mbox_idx = mhuv2_chan_idx(chan);
++	const u32 ch_window_idx = ch_mbox_idx / MHUV2_STAT_BITS;
++	const u32 ch_window_reg_idx = ch_mbox_idx % MHUV2_STAT_BITS;
++
++	writel_relaxed(BIT(ch_window_reg_idx),
++		       &mhuv2->reg.recv->channel[ch_window_idx].STAT_CLEAR);
++	return 0;
++}
++
++static inline int mhuv2_send_data_doorbell(struct arm_mhuv2 *mhuv2,
++					   struct mbox_chan *chan,
++					   const struct arm_mbox_msg *msg)
++{
++	const u32 ch_mbox_idx = mhuv2_chan_idx(chan);
++	const u32 ch_window_idx = ch_mbox_idx / MHUV2_STAT_BITS;
++	const u32 ch_window_reg_idx = ch_mbox_idx % MHUV2_STAT_BITS;
++
++	writel_relaxed(
++		readl_relaxed(&mhuv2->reg.send->channel[ch_window_idx].STAT) |
++			BIT(ch_window_reg_idx),
++		&mhuv2->reg.send->channel[ch_window_idx].STAT_SET);
++	return 0;
++}
++
++static inline int mhuv2_last_tx_done_doorbell(struct arm_mhuv2 *mhuv2,
++					      struct mbox_chan *chan)
++{
++	const u32 ch_mbox_idx = mhuv2_chan_idx(chan);
++	const u32 ch_window_idx = ch_mbox_idx / MHUV2_STAT_BITS;
++	const u32 ch_window_reg_idx = ch_mbox_idx % MHUV2_STAT_BITS;
++
++	return (readl_relaxed(&mhuv2->reg.send->channel[ch_window_idx].STAT) &
++		BIT(ch_window_reg_idx)) == 0;
++}
++
++static inline int mhuv2_setup_doorbell(struct arm_mhuv2 *mhuv2)
++{
++	int i;
++	const u32 channel_windows =
++		readl_relaxed_bitfield(mhuv2->frame == RECEIVER_FRAME ?
++					       &mhuv2->reg.recv->MHU_CFG :
++					       &mhuv2->reg.send->MHU_CFG,
++				       NUM_CH);
++
++	mhuv2->mbox.num_chans = MHUV2_STAT_BITS * channel_windows;
++	mhuv2->mbox.chans =
++		devm_kzalloc(mhuv2->dev,
++			     mhuv2->mbox.num_chans * sizeof(struct mbox_chan),
++			     GFP_KERNEL);
++
++	for (i = 0; i < mhuv2->mbox.num_chans; i++) {
++		mhuv2->mbox.chans[i].con_priv =
++			devm_kzalloc(mhuv2->dev,
++				     sizeof(struct arm_mhuv2_mbox_chan_priv),
++				     GFP_KERNEL);
++		mhuv2_chan_idx(&mhuv2->mbox.chans[i]) = i;
++	}
++
++	if (mhuv2->frame == RECEIVER_FRAME) {
++		/* Ensure all status registers are unmasked */
++		for (i = 0; i < channel_windows; i++) {
++			writel_relaxed(0x0,
++				       &mhuv2->reg.recv->channel[i].MASK_SET);
++		}
++	}
++
++	return 0;
++}
++
++static inline struct mbox_chan *
++	mhuv2_get_active_mbox_chan_doorbell(struct arm_mhuv2 *mhuv2)
++{
++	const u32 ch_window_idx = mhuv2_get_non_zero_ch_idx(mhuv2);
++	const u32 ch_window_reg_idx = __find_set_bit(
++		readl_relaxed(&mhuv2->reg.recv->channel[ch_window_idx].STAT));
++	if (ch_window_reg_idx == -1)
++		return ERR_PTR(-EIO);
++
++	return &mhuv2->mbox.chans[ch_window_reg_idx +
++				  ch_window_idx * MHUV2_STAT_BITS];
++}
++
++static const struct mhuv2_ops mhuv2_doorbell_ops = {
++	.read_data = mhuv2_read_data_doorbell,
++	.clear_data = mhuv2_clear_data_doorbell,
++	.send_data = mhuv2_send_data_doorbell,
++	.setup = mhuv2_setup_doorbell,
++	.last_tx_done = mhuv2_last_tx_done_doorbell,
++	.get_active_mbox_chan = mhuv2_get_active_mbox_chan_doorbell,
++};
++/* ========================================================================== */
++
+ /*
+  * MHUv2 receiver interrupt service routine
+  *
+@@ -591,6 +696,9 @@ static int mhuv2_probe(struct amba_device *adev, const struct amba_id *id)
+ 	} else if (strcmp(mhuv2_protocol_str,
+ 		mhuv2_protocol_dt_identifiers[SINGLE_WORD]) == 0) {
+ 		mhuv2->ops = &mhuv2_single_word_ops;
++	} else if (strcmp(mhuv2_protocol_str,
++		mhuv2_protocol_dt_identifiers[DOORBELL]) == 0) {
++		mhuv2->ops = &mhuv2_doorbell_ops;
+ 	} else {
+ 		dev_err(dev,
+ 			"Probe failed: '%s' is not a valid transport protocol specifier\n",
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch
new file mode 100644
index 0000000..9fd327f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch
@@ -0,0 +1,271 @@
+From 31140984e2ead5d56b072d0fed0b5f18a1e7e825 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Wed, 19 Jun 2019 17:00:31 +0100
+Subject: [PATCH 6/9] mailbox: arm_mhuv2: add multi word transport protocol
+ operations
+
+When in multi-word mode, the mailbox controller will provide a single
+mailbox. It is required that the MHU device has at least 2 channel windows
+available for the MHU to function in multi-word mode.
+
+Transmitting and receiving data through the mailbox framework in
+multi-word mode is done through a struct arm_mbox_msg.
+
+Change-Id: Ibcf352d19ae3908093b20350853b16cf6a7933a2
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
+Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
+Cc: jassisinghbrar@gmail.com
+Cc: devicetree@vger.kernel.org
+
+Upstream-Status: Denied [https://lkml.org/lkml/2019/7/17/615]
+---
+ drivers/mailbox/arm_mhu_v2.c | 225 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 225 insertions(+)
+
+diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
+index efde7a71a3f7..e73e829d4f1e 100644
+--- a/drivers/mailbox/arm_mhu_v2.c
++++ b/drivers/mailbox/arm_mhu_v2.c
+@@ -429,6 +429,228 @@ static const struct mhuv2_ops mhuv2_single_word_ops = {
+ };
+ /* ========================================================================== */
+ 
++/* ================ Multi word transport protocol operations ================ */
++static inline int mhuv2_read_data_multi_word(struct arm_mhuv2 *mhuv2,
++					     struct mbox_chan *chan,
++					     struct arm_mbox_msg *msg)
++{
++	int ch;
++	const int channels =
++		readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
++
++	msg->data = kzalloc(MHUV2_STAT_BYTES * channels, GFP_KERNEL);
++
++	for (ch = 0; ch < channels; ch++) {
++		/*
++		 * Messages are expected to be received in order of most
++		 * significant word to least significant word.
++		 * (see mhuv2_send_data_multi_word)
++		 */
++		const mhuv2_stat_reg_t word =
++			readl_relaxed(&mhuv2->reg.recv->channel[ch].STAT);
++		((mhuv2_stat_reg_t *)msg->data)[channels - 1 - ch] = word;
++	}
++
++	msg->len = channels * MHUV2_STAT_BYTES;
++	return 0;
++}
++
++static inline int mhuv2_clear_data_multi_word(struct arm_mhuv2 *mhuv2,
++					      struct mbox_chan *chan,
++					      struct arm_mbox_msg *msg)
++{
++	int ch;
++	const int channels =
++		readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
++
++	for (ch = 0; ch < channels; ch++) {
++		/*
++		 * Last channel window must be cleared as the final operation.
++		 * Upon clearing the last channel window register, which is
++		 * unmasked in multi-word mode, the interrupt is deasserted.
++		 */
++		writel_relaxed(
++			readl_relaxed(&mhuv2->reg.recv->channel[ch].STAT),
++			&mhuv2->reg.recv->channel[ch].STAT_CLEAR);
++	}
++	return 0;
++}
++
++static inline int __mhuv2_mw_bytes_to_send(const int bytes_in_round,
++					    const int bytes_left)
++{
++	/*
++	 * Bytes to send on the current channel will always be MHUV2_STAT_BYTES
++	 * unless in the last round and
++	 *	msg->len % MHUV2_STAT_BYTES != 0
++	 */
++	if (bytes_in_round % MHUV2_STAT_BYTES != 0) {
++		const int bts = bytes_left % MHUV2_STAT_BYTES;
++		return bts == 0 ? MHUV2_STAT_BYTES : bts;
++	} else {
++		return MHUV2_STAT_BYTES;
++	}
++}
++
++static inline int mhuv2_send_data_multi_word(struct arm_mhuv2 *mhuv2,
++					     struct mbox_chan *chan,
++					     const struct arm_mbox_msg *msg)
++{
++	/*
++	 * Message will be transmitted from most significant to least
++	 * significant word. This is to allow for messages shorter than
++	 * $channels to still trigger the receiver interrupt which gets
++	 * activated when the last STAT register is written. As an example, a
++	 * 6-word message is to be written on a 4-channel MHU connection:
++	 * Registers marked with '*' are masked, and will not generate an
++	 * interrupt on the receiver side once written.
++	 *
++	 * uint32_t *data = [0x00000001],[0x00000002],[0x00000003],[0x00000004],
++	 *		    [0x00000005], [0x00000006]
++	 *
++	 *  ROUND 1:
++	 *   STAT reg      To write    Write sequence
++	 *  [ STAT 3 ] <- [0x00000001]       4 <- triggers interrupt on receiver
++	 * *[ STAT 2 ] <- [0x00000002]       3
++	 * *[ STAT 1 ] <- [0x00000003]       2
++	 * *[ STAT 0 ] <- [0x00000004]       1
++	 *
++	 *  data += 4 // Increment data pointer by number of STAT regs
++	 *
++	 *  ROUND 2:
++	 *   STAT reg      To write    Write sequence
++	 *  [ STAT 3 ] <- [0x00000005]       2 <- triggers interrupt on receiver
++	 * *[ STAT 2 ] <- [0x00000006]       1
++	 * *[ STAT 1 ] <- [0x00000000]
++	 * *[ STAT 0 ] <- [0x00000000]
++	 */
++	int bytes_left, bytes_to_send, i, ch_idx;
++	const int ch_windows =
++		readl_relaxed_bitfield(&mhuv2->reg.recv->MHU_CFG, NUM_CH);
++	const size_t round_capacity = ch_windows * MHUV2_STAT_BYTES;
++
++	bytes_left = msg->len;
++	mhuv2_stat_reg_t *data = msg->data;
++
++	while (bytes_left > 0) {
++		/* Note: Each entry of this loop indicates a new ROUND */
++		if (*(u32 *)data == 0) {
++			dev_err(mhuv2->dev,
++				"values in *data aligned on NUM_STAT boundaries must not be zero to ensure that receiver interrupt is triggered\n",
++				ch_windows);
++			return -EINVAL;
++		}
++
++		const int bytes_in_round = bytes_left > round_capacity ?
++						   round_capacity :
++						   bytes_left;
++
++		for (i = (ch_windows - 1); i >= 0; i--) {
++			ch_idx = ch_windows - 1 - i;
++			/*
++			 * Check whether data should be transmitted in register
++			 * of index 'ch'.
++			 */
++			if (bytes_in_round > (i * MHUV2_STAT_BYTES)) {
++				mhuv2_stat_reg_t word = data[i];
++
++				bytes_to_send = __mhuv2_mw_bytes_to_send(
++					bytes_in_round, bytes_left);
++
++				if (bytes_to_send != MHUV2_STAT_BYTES) {
++					word &= LSB_MASK(bytes_to_send *
++							 __CHAR_BIT__);
++				}
++				while (readl_relaxed(
++					       &mhuv2->reg.send->channel[ch_idx]
++							.STAT) != 0)
++					continue;
++
++				writel_relaxed(
++				    word,
++				    &mhuv2->reg.send->channel[ch_idx].STAT_SET);
++				bytes_left -= bytes_to_send;
++			}
++		}
++
++		data += ch_windows;
++
++		for (ch_idx = 0; ch_idx < ch_windows; ch_idx++) {
++			while (readl_relaxed(
++				   &mhuv2->reg.send->channel[ch_idx].STAT) != 0)
++				continue;
++		}
++	}
++	return 0;
++}
++
++
++static inline int mhuv2_last_tx_done_multi_word(struct arm_mhuv2 *mhuv2,
++						struct mbox_chan *chan)
++{
++	int ch_idx;
++	bool tx_done = true;
++
++	for (ch_idx = 0;
++	     ch_idx < readl_relaxed_bitfield(&mhuv2->reg.send->MHU_CFG, NUM_CH);
++	     ch_idx++) {
++		tx_done &= readl_relaxed(
++				   &mhuv2->reg.send->channel[ch_idx].STAT) == 0;
++	}
++	return tx_done;
++}
++
++static inline int mhuv2_setup_multi_word(struct arm_mhuv2 *mhuv2)
++{
++	int ret, i;
++
++	const u32 channel_windows =
++		readl_relaxed_bitfield(mhuv2->frame == RECEIVER_FRAME ?
++					       &mhuv2->reg.recv->MHU_CFG :
++					       &mhuv2->reg.send->MHU_CFG,
++				       NUM_CH);
++	if (channel_windows < 2) {
++		dev_err(mhuv2->dev,
++			"Error: at least 2 MHU channel windows are required for using the multi-word transfer protocol");
++		return -ENODEV;
++	}
++
++	if (mhuv2->frame == RECEIVER_FRAME) {
++		/*
++		 * The multi-word transport protocol mandates that all but
++		 * the last status register must be masked.
++		 */
++		for (i = 0; i < (channel_windows - 1); i++) {
++			writel_relaxed(-1,
++				       &mhuv2->reg.recv->channel[i].MASK_SET);
++		}
++	}
++
++	mhuv2->mbox.num_chans = 1;
++	mhuv2->mbox.chans =
++		devm_kzalloc(mhuv2->dev,
++			     mhuv2->mbox.num_chans * sizeof(struct mbox_chan),
++			     GFP_KERNEL);
++
++	return 0;
++}
++
++static inline struct mbox_chan *
++	mhuv2_get_active_mbox_chan_multi_word(struct arm_mhuv2 *mhuv2)
++{
++	return &mhuv2->mbox.chans[0];
++}
++
++static const struct mhuv2_ops mhuv2_multi_word_ops = {
++	.read_data = mhuv2_read_data_multi_word,
++	.clear_data = mhuv2_clear_data_multi_word,
++	.send_data = mhuv2_send_data_multi_word,
++	.setup = mhuv2_setup_multi_word,
++	.last_tx_done = mhuv2_last_tx_done_multi_word,
++	.get_active_mbox_chan = mhuv2_get_active_mbox_chan_multi_word,
++};
++/* ========================================================================== */
++
+ /* =================== Doorbell transport protocol operations =============== */
+ 
+ static inline int mhuv2_read_data_doorbell(struct arm_mhuv2 *mhuv2,
+@@ -696,6 +918,9 @@ static int mhuv2_probe(struct amba_device *adev, const struct amba_id *id)
+ 	} else if (strcmp(mhuv2_protocol_str,
+ 		mhuv2_protocol_dt_identifiers[SINGLE_WORD]) == 0) {
+ 		mhuv2->ops = &mhuv2_single_word_ops;
++	} else if (strcmp(mhuv2_protocol_str,
++		mhuv2_protocol_dt_identifiers[MULTI_WORD]) == 0) {
++		mhuv2->ops = &mhuv2_multi_word_ops;
+ 	} else if (strcmp(mhuv2_protocol_str,
+ 		mhuv2_protocol_dt_identifiers[DOORBELL]) == 0) {
+ 		mhuv2->ops = &mhuv2_doorbell_ops;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch
new file mode 100644
index 0000000..9369d78
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch
@@ -0,0 +1,67 @@
+From 68ce2dfe4c6f3806001fb8d682d6e99a9580dc2a Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Wed, 24 Jun 2020 11:16:01 +0100
+Subject: [PATCH 7/9] firmware: arm_scmi: Add fast_switch_possible() api
+
+Add a new fast_switch_possible interface to the existing
+perf_ops api to export the information of whether or not
+fast_switch is possible in this driver.
+
+This can be used by the CPUFreq driver and framework to
+choose proper mechanism for frequency change.
+
+Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
+Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/firmware/arm_scmi?id=1909872ff20fc378ec6a44ea1a2b2966d834e504]
+---
+ drivers/firmware/arm_scmi/perf.c | 12 ++++++++++++
+ include/linux/scmi_protocol.h    |  2 ++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
+index 601af4edad5e..c9350bb2ba1f 100644
+--- a/drivers/firmware/arm_scmi/perf.c
++++ b/drivers/firmware/arm_scmi/perf.c
+@@ -691,6 +691,17 @@ static int scmi_dvfs_est_power_get(const struct scmi_handle *handle, u32 domain,
+ 	return ret;
+ }
+ 
++static bool scmi_fast_switch_possible(const struct scmi_handle *handle,
++				   struct device *dev)
++{
++	struct perf_dom_info *dom;
++	struct scmi_perf_info *pi = handle->perf_priv;
++
++	dom = pi->dom_info + scmi_dev_domain_id(dev);
++
++	return (dom->fc_info && dom->fc_info->level_set_addr);
++}
++
+ static struct scmi_perf_ops perf_ops = {
+ 	.limits_set = scmi_perf_limits_set,
+ 	.limits_get = scmi_perf_limits_get,
+@@ -702,6 +713,7 @@ static struct scmi_perf_ops perf_ops = {
+ 	.freq_set = scmi_dvfs_freq_set,
+ 	.freq_get = scmi_dvfs_freq_get,
+ 	.est_power_get = scmi_dvfs_est_power_get,
++	.fast_switch_possible = scmi_fast_switch_possible,
+ };
+ 
+ static int scmi_perf_protocol_init(struct scmi_handle *handle)
+diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
+index 881fea47c83d..b1f4a88219c5 100644
+--- a/include/linux/scmi_protocol.h
++++ b/include/linux/scmi_protocol.h
+@@ -114,6 +114,8 @@ struct scmi_perf_ops {
+ 			unsigned long *rate, bool poll);
+ 	int (*est_power_get)(const struct scmi_handle *handle, u32 domain,
+ 			     unsigned long *rate, unsigned long *power);
++	bool (*fast_switch_possible)(const struct scmi_handle *handle,
++			struct device *dev);
+ };
+ 
+ /**
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch
new file mode 100644
index 0000000..e392242
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch
@@ -0,0 +1,42 @@
+From 47300d8385801913709eda5fd237d54f51477546 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Wed, 24 Jun 2020 11:25:02 +0100
+Subject: [PATCH 8/9] cpufreq: arm_scmi: Set fast_switch_possible conditionally
+
+Currently the fast_switch_possible flag is set unconditionally
+to true. Based on this, schedutil does not create a
+thread for frequency switching and would always use the
+fast switch path.
+However, if the platform does not support frequency
+fast switch, this may cause the governor to attempt an
+operation that is not supported by the platform.
+
+Fix this by correctly retrieve the fast_switch capability
+from the driver which knows if the platform can support
+this feature.
+
+Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
+Signed-off-by: Nicola Mazzucato <nicola.mazzucato@arm.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/cpufreq?id=fb3571276b970cbe7b45ecdc762e92f3f305ad6d]
+---
+ drivers/cpufreq/scmi-cpufreq.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
+index e6182c89df79..931fcf0ef221 100644
+--- a/drivers/cpufreq/scmi-cpufreq.c
++++ b/drivers/cpufreq/scmi-cpufreq.c
+@@ -198,7 +198,8 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
+ 
+ 	policy->cpuinfo.transition_latency = latency;
+ 
+-	policy->fast_switch_possible = true;
++	policy->fast_switch_possible =
++		handle->perf_ops->fast_switch_possible(handle, cpu_dev);
+ 
+ 	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
similarity index 69%
rename from meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
rename to meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
index 69a9a0a..f858f51 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/defconfig
@@ -6,18 +6,14 @@ CONFIG_PREEMPT=y
 CONFIG_IRQ_TIME_ACCOUNTING=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
-CONFIG_TASKSTATS=y
-CONFIG_TASK_DELAY_ACCT=y
-CONFIG_TASK_XACCT=y
-CONFIG_TASK_IO_ACCOUNTING=y
-CONFIG_PSI=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
+CONFIG_UCLAMP_TASK=y
 CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
-CONFIG_MEMCG_SWAP=y
 CONFIG_BLK_CGROUP=y
 CONFIG_RT_GROUP_SCHED=y
+CONFIG_UCLAMP_TASK_GROUP=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y
@@ -26,15 +22,17 @@ CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_PERF=y
 CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_FHANDLE is not set
 CONFIG_KALLSYMS_ALL=y
 CONFIG_BPF_SYSCALL=y
-CONFIG_BPF_JIT_ALWAYS_ON=y
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
+CONFIG_ARCH_ACTIONS=y
+CONFIG_ARCH_AGILEX=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_BCM2835=y
@@ -49,6 +47,8 @@ CONFIG_ARCH_HISI=y
 CONFIG_ARCH_MEDIATEK=y
 CONFIG_ARCH_MESON=y
 CONFIG_ARCH_MVEBU=y
+CONFIG_ARCH_MXC=y
+CONFIG_ARCH_QCOM=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
@@ -72,31 +72,48 @@ CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
 CONFIG_ARM64_SW_TTBR0_PAN=y
 CONFIG_COMPAT=y
+CONFIG_ARMV8_DEPRECATED=y
+CONFIG_SWP_EMULATION=y
+CONFIG_CP15_BARRIER_EMULATION=y
+CONFIG_SETEND_EMULATION=y
 CONFIG_RANDOMIZE_BASE=y
-CONFIG_HIBERNATION=y
-CONFIG_PM_DEBUG=y
+CONFIG_PM_AUTOSLEEP=y
+CONFIG_PM_WAKELOCKS=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
 CONFIG_ENERGY_MODEL=y
 CONFIG_ARM_CPUIDLE=y
+CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
-CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=m
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
 CONFIG_CPUFREQ_DT=y
 CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
+CONFIG_ARM_IMX_CPUFREQ_DT=m
+CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
+CONFIG_ARM_QCOM_CPUFREQ_HW=y
+CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
+CONFIG_ARM_SCMI_CPUFREQ=y
 CONFIG_ARM_TEGRA186_CPUFREQ=y
+CONFIG_ARM_SCMI_PROTOCOL=y
 CONFIG_ARM_SCPI_PROTOCOL=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
+CONFIG_INTEL_STRATIX10_SERVICE=y
+CONFIG_INTEL_STRATIX10_RSU=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_SCU=y
+CONFIG_IMX_SCU_PD=y
 CONFIG_ACPI=y
 CONFIG_ACPI_APEI=y
 CONFIG_ACPI_APEI_GHES=y
+CONFIG_ACPI_APEI_PCIEAER=y
 CONFIG_ACPI_APEI_MEMORY_FAILURE=y
+CONFIG_ACPI_APEI_EINJ=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
 CONFIG_ARM64_CRYPTO=y
@@ -111,21 +128,18 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_AES_ARM64_BS=m
-CONFIG_KPROBES=y
 CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_KSM=y
 CONFIG_MEMORY_FAILURE=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_XFRM_USER=y
-CONFIG_XFRM_INTERFACE=y
-CONFIG_XFRM_STATISTICS=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
@@ -134,22 +148,19 @@ CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
-CONFIG_NET_IPGRE_DEMUX=y
-CONFIG_NET_IPVTI=y
 CONFIG_INET_ESP=y
-CONFIG_INET_UDP_DIAG=y
 CONFIG_INET_DIAG_DESTROY=y
 CONFIG_IPV6_ROUTER_PREF=y
 CONFIG_IPV6_ROUTE_INFO=y
 CONFIG_IPV6_OPTIMISTIC_DAD=y
+CONFIG_INET6_AH=y
 CONFIG_INET6_ESP=y
 CONFIG_INET6_IPCOMP=y
 CONFIG_IPV6_MIP6=y
-CONFIG_IPV6_VTI=y
+CONFIG_IPV6_SIT=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_NETFILTER=y
 CONFIG_NF_CONNTRACK=y
-CONFIG_NF_CONNTRACK_SECMARK=y
 CONFIG_NF_CONNTRACK_EVENTS=y
 CONFIG_NF_CONNTRACK_AMANDA=y
 CONFIG_NF_CONNTRACK_FTP=y
@@ -160,22 +171,14 @@ CONFIG_NF_CONNTRACK_PPTP=y
 CONFIG_NF_CONNTRACK_SANE=y
 CONFIG_NF_CONNTRACK_TFTP=y
 CONFIG_NF_CT_NETLINK=y
-CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
 CONFIG_NETFILTER_XT_TARGET_CLASSIFY=y
 CONFIG_NETFILTER_XT_TARGET_CONNMARK=y
-CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=y
-CONFIG_NETFILTER_XT_TARGET_CT=y
 CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
-CONFIG_NETFILTER_XT_TARGET_LOG=m
 CONFIG_NETFILTER_XT_TARGET_MARK=y
 CONFIG_NETFILTER_XT_TARGET_NFLOG=y
 CONFIG_NETFILTER_XT_TARGET_NFQUEUE=y
 CONFIG_NETFILTER_XT_TARGET_TPROXY=y
 CONFIG_NETFILTER_XT_TARGET_TRACE=y
-CONFIG_NETFILTER_XT_TARGET_SECMARK=y
-CONFIG_NETFILTER_XT_TARGET_TCPMSS=y
-CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
-CONFIG_NETFILTER_XT_MATCH_BPF=y
 CONFIG_NETFILTER_XT_MATCH_COMMENT=y
 CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=y
 CONFIG_NETFILTER_XT_MATCH_CONNMARK=y
@@ -187,18 +190,17 @@ CONFIG_NETFILTER_XT_MATCH_LENGTH=y
 CONFIG_NETFILTER_XT_MATCH_LIMIT=y
 CONFIG_NETFILTER_XT_MATCH_MAC=y
 CONFIG_NETFILTER_XT_MATCH_MARK=y
-CONFIG_NETFILTER_XT_MATCH_OWNER=y
 CONFIG_NETFILTER_XT_MATCH_POLICY=y
-CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
 CONFIG_NETFILTER_XT_MATCH_QUOTA=y
-CONFIG_NETFILTER_XT_MATCH_QUOTA2=y
 CONFIG_NETFILTER_XT_MATCH_SOCKET=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
 CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
 CONFIG_NETFILTER_XT_MATCH_STRING=y
 CONFIG_NETFILTER_XT_MATCH_TIME=y
 CONFIG_NETFILTER_XT_MATCH_U32=y
+CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_MATCH_AH=y
 CONFIG_IP_NF_MATCH_ECN=y
 CONFIG_IP_NF_MATCH_TTL=y
 CONFIG_IP_NF_FILTER=y
@@ -213,13 +215,15 @@ CONFIG_IP_NF_SECURITY=y
 CONFIG_IP_NF_ARPTABLES=y
 CONFIG_IP_NF_ARPFILTER=y
 CONFIG_IP_NF_ARP_MANGLE=y
+CONFIG_NF_LOG_IPV6=m
 CONFIG_IP6_NF_IPTABLES=y
 CONFIG_IP6_NF_MATCH_RPFILTER=y
 CONFIG_IP6_NF_FILTER=y
 CONFIG_IP6_NF_TARGET_REJECT=y
 CONFIG_IP6_NF_MANGLE=y
 CONFIG_IP6_NF_RAW=y
-CONFIG_L2TP=y
+CONFIG_IP6_NF_NAT=m
+CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_VLAN_8021Q=m
@@ -227,30 +231,33 @@ CONFIG_VLAN_8021Q_GVRP=y
 CONFIG_VLAN_8021Q_MVRP=y
 CONFIG_NET_SCHED=y
 CONFIG_NET_SCH_HTB=y
-CONFIG_NET_SCH_NETEM=y
-CONFIG_NET_SCH_INGRESS=y
 CONFIG_NET_CLS_U32=y
-CONFIG_NET_CLS_BPF=y
 CONFIG_NET_EMATCH=y
 CONFIG_NET_EMATCH_U32=y
 CONFIG_NET_CLS_ACT=y
+CONFIG_QRTR=m
+CONFIG_QRTR_SMD=m
+CONFIG_QRTR_TUN=m
 CONFIG_BPF_JIT=y
 CONFIG_BT=m
 CONFIG_BT_HIDP=m
 # CONFIG_BT_HS is not set
 # CONFIG_BT_LE is not set
 CONFIG_BT_LEDS=y
+# CONFIG_BT_DEBUGFS is not set
 CONFIG_BT_HCIBTUSB=m
 CONFIG_BT_HCIUART=m
 CONFIG_BT_HCIUART_LL=y
 CONFIG_BT_HCIUART_BCM=y
-CONFIG_CFG80211=m
+CONFIG_BT_HCIUART_QCA=y
+CONFIG_CFG80211=y
 CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
-CONFIG_RFKILL=m
+CONFIG_RFKILL=y
 CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_IOV=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_HOTPLUG_PCI_ACPI=y
@@ -259,21 +266,32 @@ CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCI_XGENE=y
+CONFIG_PCIE_ALTERA=y
+CONFIG_PCIE_ALTERA_MSI=y
 CONFIG_PCI_HOST_THUNDER_PEM=y
 CONFIG_PCI_HOST_THUNDER_ECAM=y
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
+CONFIG_PCIE_QCOM=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_PCIE_KIRIN=y
 CONFIG_PCIE_HISI_STB=y
+CONFIG_PCIE_TEGRA194=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_USER_HELPER=y
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
 CONFIG_HISILICON_LPC=y
 CONFIG_SIMPLE_PM_BUS=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
+CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_DENALI_DT=y
+CONFIG_MTD_NAND_MARVELL=y
+CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
+CONFIG_SPI_CADENCE_QUADSPI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_BLK_DEV_RAM=y
@@ -281,16 +299,17 @@ CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
 CONFIG_SRAM=y
-CONFIG_UID_SYS_STATS=y
 CONFIG_EEPROM_AT25=m
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SAS_ATA=y
 CONFIG_SCSI_HISI_SAS=y
 CONFIG_SCSI_HISI_SAS_PCI=y
-CONFIG_SCSI_UFSHCD=m
-CONFIG_SCSI_UFSHCD_PLATFORM=m
-CONFIG_SCSI_UFS_HISI=m
+CONFIG_SCSI_MPT3SAS=m
+CONFIG_SCSI_UFSHCD=y
+CONFIG_SCSI_UFSHCD_PLATFORM=y
+CONFIG_SCSI_UFS_QCOM=m
+CONFIG_SCSI_UFS_HISI=y
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
 CONFIG_SATA_AHCI_PLATFORM=y
@@ -303,13 +322,14 @@ CONFIG_SATA_RCAR=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_PATA_OF_PLATFORM=y
 CONFIG_MD=y
+CONFIG_BLK_DEV_MD=m
 CONFIG_BLK_DEV_DM=y
-CONFIG_DM_CRYPT=y
-CONFIG_DM_SNAPSHOT=y
-CONFIG_DM_UEVENT=y
+CONFIG_DM_MIRROR=m
+CONFIG_DM_ZERO=m
 CONFIG_DM_VERITY=y
+CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=y
+CONFIG_DM_VERITY_AVB=y
 CONFIG_DM_VERITY_FEC=y
-CONFIG_DM_BOW=y
 CONFIG_NETDEVICES=y
 CONFIG_MACVLAN=m
 CONFIG_MACVTAP=m
@@ -319,17 +339,26 @@ CONFIG_VIRTIO_NET=y
 CONFIG_AMD_XGBE=y
 CONFIG_NET_XGENE=y
 CONFIG_ATL1C=m
+CONFIG_BCMGENET=m
+CONFIG_BNX2X=m
 CONFIG_MACB=y
 CONFIG_THUNDER_NIC_PF=y
+CONFIG_FEC=y
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
+CONFIG_HNS3=y
+CONFIG_HNS3_HCLGE=y
+CONFIG_HNS3_ENET=y
 CONFIG_E1000E=y
 CONFIG_IGB=y
 CONFIG_IGBVF=y
 CONFIG_MVNETA=y
 CONFIG_MVPP2=y
 CONFIG_SKY2=y
+CONFIG_MLX4_EN=m
+CONFIG_MLX5_CORE=m
+CONFIG_MLX5_CORE_EN=y
 CONFIG_QCOM_EMAC=m
 CONFIG_RAVB=y
 CONFIG_SMC91X=y
@@ -338,7 +367,7 @@ CONFIG_SNI_AVE=y
 CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
 CONFIG_MDIO_BUS_MUX_MMIOREG=y
-CONFIG_AT803X_PHY=m
+CONFIG_AT803X_PHY=y
 CONFIG_MARVELL_PHY=m
 CONFIG_MARVELL_10G_PHY=m
 CONFIG_MESON_GXL_PHY=m
@@ -349,13 +378,11 @@ CONFIG_PPP=y
 CONFIG_PPP_BSDCOMP=y
 CONFIG_PPP_DEFLATE=y
 CONFIG_PPP_MPPE=y
-CONFIG_PPTP=y
-CONFIG_PPPOL2TP=y
 CONFIG_USB_PEGASUS=m
 CONFIG_USB_RTL8150=m
-CONFIG_USB_RTL8152=y
+CONFIG_USB_RTL8152=m
 CONFIG_USB_LAN78XX=m
-CONFIG_USB_USBNET=y
+CONFIG_USB_USBNET=m
 CONFIG_USB_NET_DM9601=m
 CONFIG_USB_NET_SR9800=m
 CONFIG_USB_NET_SMSC75XX=m
@@ -364,41 +391,33 @@ CONFIG_USB_NET_PLUSB=m
 CONFIG_USB_NET_MCS7830=m
 CONFIG_ATH10K=m
 CONFIG_ATH10K_PCI=m
+CONFIG_ATH10K_SNOC=m
 CONFIG_BRCMFMAC=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_PCIE=m
 CONFIG_WL18XX=m
 CONFIG_WLCORE_SDIO=m
+CONFIG_INPUT_JOYDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_CROS_EC=y
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_INPUT_JOYSTICK=y
-CONFIG_JOYSTICK_XPAD=y
-CONFIG_JOYSTICK_XPAD_FF=y
-CONFIG_JOYSTICK_XPAD_LEDS=y
-CONFIG_INPUT_TABLET=y
-CONFIG_TABLET_USB_ACECAD=y
-CONFIG_TABLET_USB_AIPTEK=y
-CONFIG_TABLET_USB_GTCO=y
-CONFIG_TABLET_USB_HANWANG=y
-CONFIG_TABLET_USB_KBTAB=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_INPUT_MISC=y
-CONFIG_INPUT_UINPUT=y
+CONFIG_INPUT_PM8941_PWRKEY=y
 CONFIG_INPUT_HISI_POWERKEY=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_AMBAKMI=y
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVMEM is not set
+CONFIG_LEGACY_PTY_COUNT=16
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_BCM2835AUX=y
 CONFIG_SERIAL_8250_DW=y
+CONFIG_SERIAL_8250_OMAP=y
 CONFIG_SERIAL_8250_MT6577=y
 CONFIG_SERIAL_8250_UNIPHIER=y
 CONFIG_SERIAL_OF_PLATFORM=y
@@ -409,42 +428,86 @@ CONFIG_SERIAL_MESON_CONSOLE=y
 CONFIG_SERIAL_SAMSUNG=y
 CONFIG_SERIAL_SAMSUNG_CONSOLE=y
 CONFIG_SERIAL_TEGRA=y
+CONFIG_SERIAL_TEGRA_TCU=y
+CONFIG_SERIAL_IMX=y
+CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_MSM=y
+CONFIG_SERIAL_MSM_CONSOLE=y
+CONFIG_SERIAL_QCOM_GENI=y
+CONFIG_SERIAL_QCOM_GENI_CONSOLE=y
 CONFIG_SERIAL_XILINX_PS_UART=y
 CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=y
+CONFIG_SERIAL_FSL_LPUART=y
+CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
+CONFIG_SERIAL_FSL_LINFLEXUART=y
+CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE=y
 CONFIG_SERIAL_MVEBU_UART=y
+CONFIG_SERIAL_OWL=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
+CONFIG_IPMI_HANDLER=m
+CONFIG_IPMI_DEVICE_INTERFACE=m
+CONFIG_IPMI_SI=m
 CONFIG_TCG_TPM=y
 CONFIG_TCG_TIS_I2C_INFINEON=y
 CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_BCM2835=m
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_I2C_GPIO=m
 CONFIG_I2C_IMX=y
+CONFIG_I2C_IMX_LPI2C=y
 CONFIG_I2C_MESON=y
 CONFIG_I2C_MV64XXX=y
+CONFIG_I2C_OWL=y
 CONFIG_I2C_PXA=y
+CONFIG_I2C_QCOM_GENI=m
+CONFIG_I2C_QUP=y
 CONFIG_I2C_RK3X=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
-CONFIG_I2C_VERSATILE=y
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SPI=y
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_BCM2835=m
 CONFIG_SPI_BCM2835AUX=m
+CONFIG_SPI_NXP_FLEXSPI=y
+CONFIG_SPI_IMX=m
 CONFIG_SPI_MESON_SPICC=m
 CONFIG_SPI_MESON_SPIFC=m
 CONFIG_SPI_ORION=y
 CONFIG_SPI_PL022=y
 CONFIG_SPI_ROCKCHIP=y
+CONFIG_SPI_QCOM_QSPI=m
+CONFIG_SPI_QUP=y
+CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
+CONFIG_SPI_SUN6I=y
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MAX77620=y
+CONFIG_PINCTRL_OWL=y
+CONFIG_PINCTRL_S700=y
+CONFIG_PINCTRL_S900=y
+CONFIG_PINCTRL_IMX8MM=y
+CONFIG_PINCTRL_IMX8MN=y
+CONFIG_PINCTRL_IMX8MQ=y
+CONFIG_PINCTRL_IMX8QXP=y
+CONFIG_PINCTRL_IPQ8074=y
+CONFIG_PINCTRL_MSM8916=y
+CONFIG_PINCTRL_MSM8994=y
+CONFIG_PINCTRL_MSM8996=y
+CONFIG_PINCTRL_MSM8998=y
+CONFIG_PINCTRL_QCS404=y
+CONFIG_PINCTRL_QDF2XXX=y
+CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
+CONFIG_PINCTRL_SDM845=y
+CONFIG_PINCTRL_SM8150=y
+CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_MB86S7X=y
 CONFIG_GPIO_PL061=y
@@ -452,11 +515,13 @@ CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_UNIPHIER=y
 CONFIG_GPIO_XGENE=y
 CONFIG_GPIO_XGENE_SB=y
+CONFIG_GPIO_MAX732X=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_MAX77620=y
 CONFIG_POWER_AVS=y
 CONFIG_ROCKCHIP_IODOMAIN=y
+CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_XGENE=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_SYSCON_REBOOT_MODE=y
@@ -464,38 +529,73 @@ CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_BQ27XXX=y
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_LM90=m
+CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_INA2XX=m
+CONFIG_SENSORS_INA3221=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
+CONFIG_QORIQ_THERMAL=m
 CONFIG_ROCKCHIP_THERMAL=m
+CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
+CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
 CONFIG_TEGRA_BPMP_THERMAL=m
+CONFIG_QCOM_TSENS=y
+CONFIG_QCOM_SPMI_TEMP_ALARM=m
 CONFIG_UNIPHIER_THERMAL=y
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
+CONFIG_DW_WATCHDOG=y
+CONFIG_SUNXI_WATCHDOG=m
+CONFIG_IMX2_WDT=y
+CONFIG_IMX_SC_WDT=m
+CONFIG_QCOM_WDT=m
 CONFIG_MESON_GXBB_WATCHDOG=m
 CONFIG_MESON_WATCHDOG=m
 CONFIG_RENESAS_WDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_BCM2835_WDT=y
+CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
+CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
 CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
+CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK808=y
 CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_ROHM_BD718XX=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_BD718XX=y
+CONFIG_REGULATOR_BD9571MWV=y
+CONFIG_REGULATOR_FAN53555=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_HI6421V530=y
+CONFIG_REGULATOR_HI655X=y
+CONFIG_REGULATOR_MAX77620=y
+CONFIG_REGULATOR_MAX8973=y
+CONFIG_REGULATOR_PFUZE100=y
+CONFIG_REGULATOR_PWM=y
+CONFIG_REGULATOR_QCOM_RPMH=y
+CONFIG_REGULATOR_QCOM_SMD_RPM=y
+CONFIG_REGULATOR_QCOM_SPMI=y
+CONFIG_REGULATOR_RK808=y
+CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_VCTRL=m
 CONFIG_RC_CORE=m
 CONFIG_RC_DECODERS=y
 CONFIG_RC_DEVICES=y
 CONFIG_IR_MESON=m
+CONFIG_IR_SUNXI=m
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
@@ -505,17 +605,23 @@ CONFIG_VIDEO_V4L2_SUBDEV_API=y
 # CONFIG_DVB_NET is not set
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_SUN6I_CSI=m
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
+CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
 CONFIG_DRM=y
 CONFIG_DRM_LOAD_EDID_FIRMWARE=y
-CONFIG_DRM_I2C_NXP_TDA998X=y
+CONFIG_DRM_I2C_CH7006=m
+CONFIG_DRM_I2C_SIL164=m
+CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_HDLCD=y
-CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_KOMEDA=y
+CONFIG_DRM_VIRT_ENCODER=y
 CONFIG_DRM_EXYNOS=m
 CONFIG_DRM_EXYNOS5433_DECON=y
 CONFIG_DRM_EXYNOS7_DECON=y
@@ -530,14 +636,26 @@ CONFIG_ROCKCHIP_DW_HDMI=y
 CONFIG_ROCKCHIP_DW_MIPI_DSI=y
 CONFIG_ROCKCHIP_INNO_HDMI=y
 CONFIG_DRM_RCAR_DU=m
+CONFIG_DRM_SUN4I=m
+CONFIG_DRM_SUN8I_DW_HDMI=m
+CONFIG_DRM_SUN8I_MIXER=m
+CONFIG_DRM_MSM=m
 CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_SII902X=m
+CONFIG_DRM_TI_SN65DSI86=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_VC4=m
+CONFIG_DRM_ETNAVIV=m
 CONFIG_DRM_HISI_HIBMC=m
 CONFIG_DRM_HISI_KIRIN=m
 CONFIG_DRM_MESON=m
-CONFIG_FB_ARMCLCD=y
+CONFIG_DRM_PL111=m
+CONFIG_DRM_LIMA=m
+CONFIG_DRM_PANFROST=m
+CONFIG_DRM_LEGACY=y
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_EFI=y
 CONFIG_BACKLIGHT_GENERIC=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_LP855X=m
@@ -547,78 +665,41 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
+CONFIG_SND_HDA_TEGRA=m
+CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_SOC=y
 CONFIG_SND_BCM2835_SOC_I2S=m
+CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_SOC_ROCKCHIP=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
+CONFIG_SND_SUN4I_SPDIF=m
 CONFIG_SND_SOC_AK4613=m
+CONFIG_SND_SOC_ES7134=m
+CONFIG_SND_SOC_ES7241=m
+CONFIG_SND_SOC_PCM3168A_I2C=m
+CONFIG_SND_SOC_TAS571X=m
 CONFIG_SND_SIMPLE_CARD=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
-CONFIG_HIDRAW=y
-CONFIG_UHID=y
 CONFIG_HID_A4TECH=y
-CONFIG_HID_ACRUX=y
-CONFIG_HID_ACRUX_FF=y
 CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
 CONFIG_HID_CHICONY=y
-CONFIG_HID_PRODIKEYS=y
 CONFIG_HID_CYPRESS=y
-CONFIG_HID_DRAGONRISE=y
-CONFIG_DRAGONRISE_FF=y
-CONFIG_HID_EMS_FF=y
-CONFIG_HID_ELECOM=y
 CONFIG_HID_EZKEY=y
-CONFIG_HID_HOLTEK=y
-CONFIG_HID_KEYTOUCH=y
-CONFIG_HID_KYE=y
-CONFIG_HID_UCLOGIC=y
-CONFIG_HID_WALTOP=y
-CONFIG_HID_GYRATION=y
-CONFIG_HID_TWINHAN=y
+CONFIG_HID_ITE=y
 CONFIG_HID_KENSINGTON=y
-CONFIG_HID_LCPOWER=y
 CONFIG_HID_LOGITECH=y
-CONFIG_HID_LOGITECH_DJ=y
-CONFIG_LOGITECH_FF=y
-CONFIG_LOGIRUMBLEPAD2_FF=y
-CONFIG_LOGIG940_FF=y
-CONFIG_HID_MAGICMOUSE=y
+CONFIG_HID_REDRAGON=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
-CONFIG_HID_MULTITOUCH=y
-CONFIG_HID_NTRIG=y
-CONFIG_HID_ORTEK=y
-CONFIG_HID_PANTHERLORD=y
-CONFIG_PANTHERLORD_FF=y
-CONFIG_HID_PETALYNX=y
-CONFIG_HID_PICOLCD=y
-CONFIG_HID_PRIMAX=y
-CONFIG_HID_ROCCAT=y
-CONFIG_HID_SAITEK=y
-CONFIG_HID_SAMSUNG=y
-CONFIG_HID_SONY=y
-CONFIG_HID_SPEEDLINK=y
-CONFIG_HID_SUNPLUS=y
-CONFIG_HID_GREENASIA=y
-CONFIG_GREENASIA_FF=y
-CONFIG_HID_SMARTJOYPLUS=y
-CONFIG_SMARTJOYPLUS_FF=y
-CONFIG_HID_TIVO=y
-CONFIG_HID_TOPSEED=y
-CONFIG_HID_THRUSTMASTER=y
-CONFIG_HID_WACOM=y
-CONFIG_HID_WIIMOTE=y
-CONFIG_HID_ZEROPLUS=y
-CONFIG_HID_ZYDACRON=y
-CONFIG_USB_HIDDEV=y
 CONFIG_I2C_HID=m
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
+CONFIG_USB_CONN_GPIO=m
+CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_TEGRA=y
@@ -640,16 +721,15 @@ CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_ISP1760=y
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_NOP_USB_XCEIV=y
-CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
 CONFIG_USB_CONFIGFS=y
-CONFIG_USB_CONFIGFS_UEVENT=y
 CONFIG_USB_CONFIGFS_F_FS=y
-CONFIG_USB_CONFIGFS_F_ACC=y
-CONFIG_USB_CONFIGFS_F_AUDIO_SRC=y
 CONFIG_USB_CONFIGFS_F_MIDI=y
+CONFIG_TYPEC=m
+CONFIG_TYPEC_TCPM=m
+CONFIG_TYPEC_FUSB302=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
@@ -659,11 +739,14 @@ CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_ARASAN=y
 CONFIG_MMC_SDHCI_OF_ESDHC=y
 CONFIG_MMC_SDHCI_CADENCE=y
+CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
 CONFIG_MMC_SDHCI_F_SDH30=y
 CONFIG_MMC_MESON_GX=y
+CONFIG_MMC_SDHCI_MSM=y
 CONFIG_MMC_SPI=y
 CONFIG_MMC_SDHI=y
+CONFIG_MMC_UNIPHIER=y
 CONFIG_MMC_DW=y
 CONFIG_MMC_DW_EXYNOS=y
 CONFIG_MMC_DW_HI3798CV200=y
@@ -672,6 +755,8 @@ CONFIG_MMC_DW_ROCKCHIP=y
 CONFIG_MMC_SUNXI=y
 CONFIG_MMC_BCM2835=y
 CONFIG_MMC_SDHCI_XENON=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
@@ -685,6 +770,7 @@ CONFIG_EDAC_GHES=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
+CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_DS3232=y
 CONFIG_RTC_DRV_EFI=y
@@ -694,13 +780,21 @@ CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
 CONFIG_RTC_DRV_ARMADA38X=y
 CONFIG_RTC_DRV_TEGRA=y
+CONFIG_RTC_DRV_SNVS=m
+CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=m
+CONFIG_DMA_SUN6I=m
+CONFIG_FSL_EDMA=y
+CONFIG_IMX_SDMA=y
 CONFIG_K3_DMA=y
+CONFIG_MV_XOR=y
 CONFIG_MV_XOR_V2=y
+CONFIG_OWL_DMA=y
 CONFIG_PL330_DMA=y
 CONFIG_TEGRA20_APB_DMA=y
+CONFIG_QCOM_BAM_DMA=y
 CONFIG_QCOM_HIDMA_MGMT=y
 CONFIG_QCOM_HIDMA=y
 CONFIG_RCAR_DMAC=y
@@ -715,26 +809,73 @@ CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_ASHMEM=y
 CONFIG_ION=y
+CONFIG_ION_SYSTEM_HEAP=y
 CONFIG_MFD_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
 CONFIG_CROS_EC_SPI=y
 CONFIG_COMMON_CLK_RK808=y
+CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_CLK_QORIQ=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_CLK_RASPBERRYPI=m
+CONFIG_CLK_IMX8MM=y
+CONFIG_CLK_IMX8MN=y
+CONFIG_CLK_IMX8MQ=y
+CONFIG_CLK_IMX8QXP=y
+CONFIG_TI_SCI_CLK=y
+CONFIG_COMMON_CLK_QCOM=y
+CONFIG_QCOM_A53PLL=y
+CONFIG_QCOM_CLK_APCS_MSM8916=y
+CONFIG_QCOM_CLK_SMD_RPM=y
+CONFIG_QCOM_CLK_RPMH=y
+CONFIG_IPQ_GCC_8074=y
+CONFIG_MSM_GCC_8916=y
+CONFIG_MSM_GCC_8994=y
+CONFIG_MSM_MMCC_8996=y
+CONFIG_MSM_GCC_8998=y
+CONFIG_QCS_GCC_404=y
+CONFIG_SDM_GCC_845=y
+CONFIG_SM_GCC_8150=y
+CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
+CONFIG_IMX_MBOX=y
+CONFIG_ARM_MHU_V2=y
 CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
+CONFIG_QCOM_APCS_IPC=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
+CONFIG_ARM_SMMU=m
 CONFIG_ARM_SMMU_V3=y
+CONFIG_REMOTEPROC=y
+CONFIG_QCOM_Q6V5_MSS=m
+CONFIG_QCOM_Q6V5_PAS=m
+CONFIG_QCOM_SYSMON=m
 CONFIG_RPMSG_QCOM_GLINK_RPM=y
+CONFIG_RPMSG_QCOM_GLINK_SMEM=m
+CONFIG_RPMSG_QCOM_SMD=y
+CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y
+CONFIG_IMX_SCU_SOC=y
+CONFIG_QCOM_AOSS_QMP=y
+CONFIG_QCOM_GENI_SE=y
+CONFIG_QCOM_GLINK_SSR=m
+CONFIG_QCOM_RMTFS_MEM=m
+CONFIG_QCOM_RPMH=y
+CONFIG_QCOM_RPMHPD=y
+CONFIG_QCOM_SMEM=y
+CONFIG_QCOM_SMD_RPM=y
+CONFIG_QCOM_SMP2P=y
+CONFIG_QCOM_SMSM=y
+CONFIG_QCOM_SOCINFO=m
+CONFIG_ARCH_R8A774A1=y
+CONFIG_ARCH_R8A774C0=y
 CONFIG_ARCH_R8A7795=y
-CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77980=y
@@ -746,17 +887,21 @@ CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_K3_AM6_SOC=y
-CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
+CONFIG_ARCH_K3_J721E_SOC=y
+CONFIG_TI_SCI_PM_DOMAINS=y
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_EXTCON_USBC_CROS_EC=y
 CONFIG_MEMORY=y
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
+CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
 CONFIG_IIO_CROS_EC_SENSORS=m
 CONFIG_IIO_CROS_EC_LIGHT_PROX=m
+CONFIG_SENSORS_ISL29018=m
 CONFIG_IIO_CROS_EC_BARO=m
+CONFIG_MPL3115=m
 CONFIG_PWM=y
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_CROS_EC=m
@@ -764,27 +909,51 @@ CONFIG_PWM_MESON=m
 CONFIG_PWM_RCAR=m
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_SAMSUNG=y
+CONFIG_PWM_SUN4I=m
 CONFIG_PWM_TEGRA=m
+CONFIG_RESET_QCOM_AOSS=y
+CONFIG_RESET_QCOM_PDC=m
+CONFIG_RESET_TI_SCI=y
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
+CONFIG_PHY_QCOM_QMP=m
+CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_USB_HS=y
+CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
+CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
 CONFIG_PHY_ROCKCHIP_PCIE=m
 CONFIG_PHY_ROCKCHIP_TYPEC=y
+CONFIG_PHY_UNIPHIER_USB2=y
+CONFIG_PHY_UNIPHIER_USB3=y
 CONFIG_PHY_TEGRA_XUSB=y
+CONFIG_ARM_SMMU_V3_PMU=m
+CONFIG_FSL_IMX8_DDR_PMU=m
 CONFIG_HISI_PMU=y
+CONFIG_QCOM_L2_PMU=y
+CONFIG_QCOM_L3_PMU=y
 CONFIG_ANDROID=y
 CONFIG_ANDROID_BINDER_IPC=y
+CONFIG_NVMEM_IMX_OCOTP=y
+CONFIG_NVMEM_IMX_OCOTP_SCU=y
+CONFIG_QCOM_QFPROM=y
 CONFIG_ROCKCHIP_EFUSE=y
+CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_UNIPHIER_EFUSE=y
 CONFIG_MESON_EFUSE=m
+CONFIG_FPGA=y
+CONFIG_FPGA_MGR_STRATIX10_SOC=m
+CONFIG_FPGA_BRIDGE=m
+CONFIG_ALTERA_FREEZE_BRIDGE=m
+CONFIG_FPGA_REGION=m
+CONFIG_OF_FPGA_REGION=m
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_EXT2_FS=y
@@ -793,23 +962,23 @@ CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
 CONFIG_BTRFS_FS=m
 CONFIG_BTRFS_FS_POSIX_ACL=y
-CONFIG_F2FS_FS=y
-CONFIG_F2FS_FS_SECURITY=y
 CONFIG_FANOTIFY=y
 CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
 CONFIG_QUOTA=y
-CONFIG_QFMT_V2=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_CUSE=m
-CONFIG_OVERLAY_FS=y
-CONFIG_MSDOS_FS=y
+CONFIG_OVERLAY_FS=m
 CONFIG_VFAT_FS=y
 CONFIG_HUGETLBFS=y
 CONFIG_EFIVAR_FS=y
 CONFIG_SQUASHFS=y
-CONFIG_PSTORE_CONSOLE=y
 CONFIG_PSTORE_RAM=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
@@ -817,16 +986,17 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_HARDENED_USERCOPY=y
 CONFIG_SECURITY_SELINUX=y
-CONFIG_CRYPTO_GCM=y
-CONFIG_CRYPTO_SHA512=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=32
+CONFIG_CRYPTO_USER_API_RNG=m
+CONFIG_CRYPTO_DEV_FSL_CAAM=m
+CONFIG_CRYPTO_DEV_QCOM_RNG=m
+CONFIG_CRYPTO_DEV_HISI_ZIP=m
+CONFIG_CMA_SIZE_MBYTES=256
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_PANIC_TIMEOUT=5
-CONFIG_SCHEDSTATS=y
+# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
-CONFIG_ENABLE_DEFAULT_TRACERS=y
+# CONFIG_FTRACE is not set
 CONFIG_MEMTEST=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend
index f765661..55dac37 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend
@@ -1,3 +1,5 @@
 # Machine specific configurations
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
+
 require linux-arm-platforms.inc
-- 
2.17.1

