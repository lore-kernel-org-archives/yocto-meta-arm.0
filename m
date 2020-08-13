Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.52])
 by mx.groups.io with SMTP id smtpd.web12.11544.1597330375617731735
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=43wqEV58;
 spf=pass (domain: arm.com, ip: 40.107.1.52, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWiBjlykyExaOuylMUUzo6fC++yikVizhEvAcv5mqoc=;
 b=43wqEV58JoXKGxmiRAhyWMKUBr3tda4CCp6nqWOC9n9i8dXtE2B7teG3SOWdnfjHiZZ7BDOorKk5QYwfTNhVZQaam7R3uwwMiEPRq+sJwTeEOjmqlxrCPauq37UMKosg35R4GZMUhif6rFoQ8xN+CpUSOepg18877ZTS/ZfR7yc=
Received: from DB6PR0202CA0002.eurprd02.prod.outlook.com (2603:10a6:4:29::12)
 by HE1PR0802MB2154.eurprd08.prod.outlook.com (2603:10a6:3:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.22; Thu, 13 Aug
 2020 14:52:52 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::24) by DB6PR0202CA0002.outlook.office365.com
 (2603:10a6:4:29::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:52 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Thu, 13 Aug 2020 14:52:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5c38d4ef0e632bd
X-CR-MTA-TID: 64aa7808
Received: from 618ea1642277.6
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4B7CEB76-22D3-484D-BC59-FC2062FE660E.1;
	Thu, 13 Aug 2020 14:52:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618ea1642277.6
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FT101AmJfU5zvGp3PD3TBdwMnGkcxl03OKM9au8NRKQQ2xrCgJff/iaE0JHqiBamp1RvhcfS1j6pt7heQRsJUQqlg7jkS+QJ74rtZbKa8gOdj3aOVUeWVW7+fprsjqekt8z5yrUWDoLyvD9zN1QXg+uu+6p5/cVs6WpQg7WGEehm8KwcvRv41laGukN8+cS26VELvNWWbFyf67cy01NBkTpGlNfKI1Q8YAPNMElNk16YAvl9XUAs30bzsqFA7nv/V2y1NvZOlY/7eZL1D2Vo7ApMVQZ/xnTXulfSND8ULiSYKh0W/fLyiW9MkZS10KeytEqgytEWq3WcUZkpgGyHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWiBjlykyExaOuylMUUzo6fC++yikVizhEvAcv5mqoc=;
 b=lu8vi+s2GciB9Kul2w4YAqEwztfMMRnABzRKbJExgXmWv8il18fJSFJuv8JYX9t9UbS7yiL+c1EqAmmWc9LObbD+IVTlndc0Hzt45Wln73HUxxYnHJfZIaTQbAYTisYy+1jSVBSUwyIwxvkSqbThiaNuUlsVIBpl6rfth+C1rG1FbRyHWeltyO9j6amiGl1+KLCf+1WKuBDKEjUind9yj8n1py+h2DW1kxTpUrR5dx/RifsacJNaXeXGbVdhR+pNaDKa64Z8YrPvTF6OoUHD7bQH9ylxgexLc4aLaUEaRA8rsJGiKzRdGllzaPKY7hQLg8qlpIOhd9sz/y4xRcX4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWiBjlykyExaOuylMUUzo6fC++yikVizhEvAcv5mqoc=;
 b=43wqEV58JoXKGxmiRAhyWMKUBr3tda4CCp6nqWOC9n9i8dXtE2B7teG3SOWdnfjHiZZ7BDOorKk5QYwfTNhVZQaam7R3uwwMiEPRq+sJwTeEOjmqlxrCPauq37UMKosg35R4GZMUhif6rFoQ8xN+CpUSOepg18877ZTS/ZfR7yc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:45 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:45 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 6/9] arm-bsp/u-boot: adding corstone700 platform to u-boot
Date: Thu, 13 Aug 2020 15:52:27 +0100
Message-Id: <20200813145230.22140-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8898ef92-3c3e-4c6f-8102-08d83f988df2
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|HE1PR0802MB2154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB21548173088E8CB91B85B90AFD430@HE1PR0802MB2154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xTl5Q4ZRx0nGLVnXWE4dZoGfCRIahiQy6H5Bpvqw+YBOYZYWgGUrDJX5P9TuX5gZH3jYweg/u1hVxOvT7zyRV5k9TLMeMuRgOb6DbP6Zv65Cyg/uUt6bgFz6pJvMTAWYQJDH2sjUDOMnN9IFhaGZuHNCNFWXgAb+jam/a+d0PwGmbCpAHVP4LRncxDv4wFW19MEk3ky2wEZkBeSaQrDq36m5Eo6GwPHmc5huIQVjuwyznQyRXtVK1B2t7LTgmmyjqmRfa0l55eb30DfFm5KH+nnltv8IW6pemBydQ68IYxWNOyiyo6BIP9oEQYMeoZ6m/AsV0R4BPfIPcKSkn4GuS6SkZRiWnoaQLooQquZAlRWTyPwcTj3apVJuAL2CoGgmB6rLiISZN3onIXo09hSQ5A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(83380400001)(7696005)(2616005)(956004)(316002)(54906003)(52116002)(83080400001)(30864003)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(966005)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 exS9ka3G3uxNLNPQCnfuf/69ZDFnYTBw0Ryq3NIngC7DFGRPoGy3C8mHtvsN6oOQA5HSaXLqoBAS3qhs++pGtMsStDVxYaHghLTErMTHMuFpiRJ0DidcMbnRqfLjyJ6qTh5wXDFKQ36+S2YUOujZRvfUGGM144SRqSUvg0JpwBArkiv9/9LNQf9FbOXYJDYgb5+0D4QqgM6Md286lM8+FYItW+YGXNLjuIwH9uEt5986v+AXP2SVH5fY42t9/v2pOHMqrL+nfLuRF0j/DviW11nYerZ1lnXG2aS5FGUZ2lVSU+Ef+MNcrql2NpDoiUi1TCvRkDDCtqXGFhtv15X6rc+Vjdo/oyPy/+C/ckjuHY8R9CM+F/xCRyj9MHJbWLu1lRt2iq2W2L+tRhmKCH2AtN//DVubQqPbXcSUq6i3lZfl2V9dRABsEBrAHnlcNY05X7XkDfjDCo4YED1SN8kPCGdpXlZtWBL8tmYaYAMGFScdhtRS3n/Ak5j3YFuuE+9YuDIlk1+L6ZYQxzV8jdILNVw0B4QT+bPIcjLBMr2cDz+F681d3ixBeUgURhN9LVJgpPa1x0O87sjzsOiCMyV2fZsgt/tSiFuJl2te6986ywlG/1Q9CI3bguwh9AEPkWtLgV6Vc5ZyrU+PnU0eAZo2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	38528435-8a3a-40e3-34d6-08d83f988980
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u4Pu7xfjbR0bK3MIzxKTh/nSj+P2EZp0mJ2VKtcsrEwC1YO4AEjCbiOZFD0e/U4R63YeuF0GfqYrCTGI+C7WdXuZEsZ9QBDA/TeL4KLovE07X2fIiqAbMNrgjzHc0GSOPG85Vq9Hmdlc+5b43uDuPJfhyU0Nd60hNUIOPAhqA5wyh9d3LAJERwIeG9SmZtAC2XDiqewkMwmaW8E+9EALEugYrZW6RRhLQJjFpgFSD22QTVpD5NTEudTOmSnfrO1aXeMwptqUllUPZxDr4hU3Gzj/BS85mEGg6QtIjly8iezSWR9UMwqyRAb1z/D30ZgpAk6XeZTexo9bJpayaz9fuMZlZTczEW5C5Khc0FSHGZTgI8G5bxJcqyZ9Ext7jgYaJMTTbBubTTlwIPJgFNZJzNaK2CYB370jjNl1nmEmEF10VehJiurdl5tOOziBcW3cPCTNGNteuU4VbjPFffwUZakvIwkJW2Aq+BlMNwhzdho=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966005)(36756003)(82310400002)(2906002)(356005)(5660300002)(2616005)(47076004)(83380400001)(81166007)(83080400001)(82740400003)(70586007)(70206006)(956004)(107886003)(6666004)(16526019)(966005)(8936002)(1076003)(4326008)(336012)(86362001)(54906003)(6916009)(6486002)(30864003)(9686003)(316002)(8676002)(7696005)(26005)(478600001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:52.1904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8898ef92-3c3e-4c6f-8102-08d83f988df2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2154
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding support for the new Arm corstone700 platform family.

The current supported corstone700 machine is corstone700-fvp.

The changes are as follows:

  - Making some adjustments to the mmio timer and to the cortex-a5
    designstart platform to share as much as possible between this
    platforms.

  - Disabling the use of the mmio_timer driver and enabling the
    arch_timer driver.
    The mmio_timer tries a direct access to the Armv8-A CNTFRQ generic timer
    frequency register through memory mapping. This can not be done because
    this register is only accessible through memory mapping under a secure
    mode only. u-boot runs in non secure Hypervisor mode. To read the counter
    frequency u-boot should use the mrc instruction to read the CNTFRQ system
    register. The arch_timer driver reads the CNTFRQ register using the mrc
    instruction.

  - adding bootx command to start XiP images

Change-Id: I40f5e91cfb8865e2904b0f5ac9920df75705b593
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone700.inc      |   5 +-
 .../0001-arm-Add-corstone700-platform.patch   | 268 ++++++++++++++++++
 ...dd-bootx-command-to-start-XiP-images.patch | 136 +++++++++
 ...g-the-XIP-kernel-using-bootx-command.patch |  39 +++
 ...4-arm-enabling-the-arch_timer-driver.patch |  61 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  10 +
 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |  28 ++
 7 files changed, 546 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 4c00c6d..6b02415 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,10 +14,13 @@ PREFERRED_VERSION_linux-stable ?= "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
-EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system"
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system u-boot"
 
 WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "arm-reference-image.corstone700.wks"
 
 VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+
+UBOOT_MACHINE ?= "corstone700_defconfig"
+PREFERRED_VERSION_u-boot ?= "2020.04"
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch
new file mode 100644
index 0000000..cdad7a6
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-arm-Add-corstone700-platform.patch
@@ -0,0 +1,268 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 4b33e25ebb708faa987c903c1bbc70f6752ad543 Mon Sep 17 00:00:00 2001
+From: Rui Silva <rui.silva@linaro.org>
+Date: Thu, 13 Aug 2020 12:23:47 +0100
+Subject: [PATCH] arm: Add corstone700 platform
+
+Add support to the new Arm corstone700 platform family.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ arch/arm/Kconfig                       |  7 +++
+ board/armltd/corstone700/Kconfig       | 12 ++++
+ board/armltd/corstone700/Makefile      |  8 +++
+ board/armltd/corstone700/corstone700.c | 49 ++++++++++++++++
+ configs/corstone700_defconfig          | 37 ++++++++++++
+ include/configs/corstone700.h          | 78 ++++++++++++++++++++++++++
+ 6 files changed, 191 insertions(+)
+ create mode 100644 board/armltd/corstone700/Kconfig
+ create mode 100644 board/armltd/corstone700/Makefile
+ create mode 100644 board/armltd/corstone700/corstone700.c
+ create mode 100644 configs/corstone700_defconfig
+ create mode 100644 include/configs/corstone700.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index bbb1e2738b..ab2d246e29 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -636,6 +636,12 @@ config ARCH_BCM6858
+ 	select OF_CONTROL
+ 	imply CMD_DM
+ 
++config TARGET_CORSTONE700
++	bool "Support Corstone700"
++	select CPU_V7A
++	select SEMIHOSTING
++	select PL01X_SERIAL
++
+ config TARGET_VEXPRESS_CA15_TC2
+ 	bool "Support vexpress_ca15_tc2"
+ 	select CPU_V7A
+@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
+ source "board/armadeus/apf27/Kconfig"
+ source "board/armltd/vexpress/Kconfig"
+ source "board/armltd/vexpress64/Kconfig"
++source "board/armltd/corstone700/Kconfig"
+ source "board/cortina/presidio-asic/Kconfig"
+ source "board/broadcom/bcm23550_w1d/Kconfig"
+ source "board/broadcom/bcm28155_ap/Kconfig"
+diff --git a/board/armltd/corstone700/Kconfig b/board/armltd/corstone700/Kconfig
+new file mode 100644
+index 0000000000..ae625d96ad
+--- /dev/null
++++ b/board/armltd/corstone700/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_CORSTONE700
++
++config SYS_BOARD
++	default "corstone700"
++
++config SYS_VENDOR
++	default "armltd"
++
++config SYS_CONFIG_NAME
++	default "corstone700"
++
++endif
+diff --git a/board/armltd/corstone700/Makefile b/board/armltd/corstone700/Makefile
+new file mode 100644
+index 0000000000..4f38135612
+--- /dev/null
++++ b/board/armltd/corstone700/Makefile
+@@ -0,0 +1,8 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2020 ARM Limited
++# (C) Copyright 2020 Linaro
++# Rui Miguel Silva <rui.silva@linaro.org>
++#
++
++obj-y	:= corstone700.o
+diff --git a/board/armltd/corstone700/corstone700.c b/board/armltd/corstone700/corstone700.c
+new file mode 100644
+index 0000000000..b6f3e660a8
+--- /dev/null
++++ b/board/armltd/corstone700/corstone700.c
+@@ -0,0 +1,49 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ */
++
++#include <common.h>
++#include <dm.h>
++#include <dm/platform_data/serial_pl01x.h>
++#include <malloc.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++static const struct pl01x_serial_platdata serial_platdata = {
++	.base = V2M_UART0,
++	.type = TYPE_PL011,
++	.clock = CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DEVICE(corstone700_serials) = {
++	.name = "serial_pl01x",
++	.platdata = &serial_platdata,
++};
++
++int board_init(void)
++{
++	return 0;
++}
++
++int dram_init(void)
++{
++	gd->ram_size = PHYS_SDRAM_1_SIZE;
++
++	return 0;
++}
++
++int dram_init_banksize(void)
++{
++	gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
++	gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
++
++	return 0;
++}
++
++void reset_cpu(ulong addr)
++{
++}
++
+diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconfig
+new file mode 100644
+index 0000000000..ee29a1eabf
+--- /dev/null
++++ b/configs/corstone700_defconfig
+@@ -0,0 +1,37 @@
++CONFIG_ARM=y
++CONFIG_ARM64_SUPPORT_AARCH32=y
++CONFIG_TARGET_CORSTONE700=y
++CONFIG_SYS_TEXT_BASE=0x02100000
++CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_NR_DRAM_BANKS=1
++CONFIG_IDENT_STRING=" corstone700 aarch32"
++CONFIG_BOOTDELAY=3
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0 loglevel=9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=y
++CONFIG_SYS_PROMPT="corstone700# "
++# CONFIG_CMD_CONSOLE is not set
++CONFIG_CMD_BOOTZ=y
++CONFIG_CMD_BOOTM=y
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++# CONFIG_CMD_ARMFLASH=y
++# CONFIG_CMD_LOADS is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_CACHE=y
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=y
++CONFIG_DM=y
++# CONFIG_MMC is not set
++# CONFIG_MTD_NOR_FLASH=y
++CONFIG_DM_ETH=y
++CONFIG_DM_SERIAL=y
++CONFIG_OF_LIBFDT=y
+diff --git a/include/configs/corstone700.h b/include/configs/corstone700.h
+new file mode 100644
+index 0000000000..32238e4057
+--- /dev/null
++++ b/include/configs/corstone700.h
+@@ -0,0 +1,78 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ * Configuration for Corstone700. Parts were derived from other ARM
++ * configurations.
++ */
++
++#ifndef __CORSTONE700_H
++#define __CORSTONE700_H
++
++#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
++#define CONFIG_SKIP_LOWLEVEL_INIT
++
++#define CONFIG_SYS_HZ_CLOCK	320000000
++#define CONFIG_SYS_HZ		1000
++
++#define V2M_SRAM0		0x02000000
++#define V2M_QSPI		0x08000000
++
++#define V2M_DEBUG		0x10000000
++#define V2M_BASE_PERIPH		0x1A000000
++
++#define V2M_BASE		0x80000000
++
++#define V2M_PERIPH_OFFSET(x)	(x << 16)
++
++#define V2M_SYSID		(V2M_BASE_PERIPH)
++#define V2M_SYSCTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++
++#define V2M_COUNTER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
++#define V2M_COUNTER_READ	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
++
++#define V2M_TIMER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
++#define V2M_TIMER_BASE0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
++
++#define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
++#define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
++
++#define CONFIG_SYS_MMIO_TIMER
++
++#define CONFIG_PL011_CLOCK	32000000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1		(V2M_BASE)
++#define PHYS_SDRAM_2		(V2M_QSPI)
++
++/* Top 16MB reserved for secure world use (maybe not needed) */
++#define DRAM_SEC_SIZE		0x01000000
++#define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
++
++#define PHYS_SDRAM_2_SIZE	0x02000000
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN	(CONFIG_ENV_SIZE + (8 << 20))
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_LOAD_ADDR	(V2M_BASE + 0x10000000)
++
++#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
++#define CONFIG_SYS_MAXARGS		64	/* max command args */
++
++#define CONFIG_EXTRA_ENV_SETTINGS	\
++				"kernel_name=zImage\0"		\
++				"kernel_addr_r=0x80000000\0"	\
++				"fdt_name=devtree.dtb\0"	\
++				"fdt_addr_r=0x82000000\0"		\
++				"fdt_high=0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND	"echo Booting Kernel...;" \
++				"bootz $kernel_addr_r - $fdt_addr_r"
++
++#endif
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
new file mode 100644
index 0000000..bc27f66
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-boot-add-bootx-command-to-start-XiP-images.patch
@@ -0,0 +1,136 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 42d975e5be4435799fb2cf2af48b4dd90aa637f0 Mon Sep 17 00:00:00 2001
+From: Rui Silva <rui.silva@linaro.org>
+Date: Wed, 5 Aug 2020 19:03:30 +0100
+Subject: [PATCH 4/6] boot: add bootx command to start XiP images
+
+Add boot command that will jump to xip kernel entries.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ cmd/Kconfig                   |  8 ++++-
+ cmd/Makefile                  |  1 +
+ cmd/bootx.c                   | 58 +++++++++++++++++++++++++++++++++++
+ configs/corstone700_defconfig |  1 +
+ 4 files changed, 67 insertions(+), 1 deletion(-)
+ create mode 100644 cmd/bootx.c
+
+diff --git a/cmd/Kconfig b/cmd/Kconfig
+index 6403bc45a5..c974f6b33d 100644
+--- a/cmd/Kconfig
++++ b/cmd/Kconfig
+@@ -285,6 +285,12 @@ config CMD_BOOTZ
+ 	help
+ 	  Boot the Linux zImage
+ 
++config CMD_BOOTX
++	bool "Support booting XiP Kernel Image"
++	default y
++	help
++	  The bootx command is used to boot an XIP kernel.
++
+ config CMD_BOOTI
+ 	bool "booti"
+ 	depends on ARM64 || RISCV
+@@ -294,7 +300,7 @@ config CMD_BOOTI
+ 
+ config BOOTM_LINUX
+ 	bool "Support booting Linux OS images"
+-	depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI
++	depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI || CMD_BOOTX
+ 	default y
+ 	help
+ 	  Support booting the Linux kernel directly via a command such as bootm
+diff --git a/cmd/Makefile b/cmd/Makefile
+index f1dd513a4b..ce75b6112c 100644
+--- a/cmd/Makefile
++++ b/cmd/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_CMD_BOOTCOUNT) += bootcount.o
+ obj-$(CONFIG_CMD_BOOTEFI) += bootefi.o
+ obj-$(CONFIG_CMD_BOOTMENU) += bootmenu.o
+ obj-$(CONFIG_CMD_BOOTSTAGE) += bootstage.o
++obj-$(CONFIG_CMD_BOOTX) += bootx.o
+ obj-$(CONFIG_CMD_BOOTZ) += bootz.o
+ obj-$(CONFIG_CMD_BOOTI) += booti.o
+ obj-$(CONFIG_CMD_BTRFS) += btrfs.o
+diff --git a/cmd/bootx.c b/cmd/bootx.c
+new file mode 100644
+index 0000000000..b6e06eab3f
+--- /dev/null
++++ b/cmd/bootx.c
+@@ -0,0 +1,58 @@
++/*
++ * Copyright (C) 2017 Renesas Electronics
++ * Copyright (C) 2017 Chris Brandt
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++ #include <common.h>
++
++/* XIP Kernel boot */
++int do_bootx(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
++{
++	ulong machid = 0xFFFFFFFF;	/* Device Tree Boot */
++	void (*kernel_entry)(int zero, int arch, uint params);
++	ulong r2;
++	ulong img_addr;
++	char *endp;
++
++	/* need at least two arguments */
++	if (argc < 2)
++		goto usage;
++
++	img_addr = simple_strtoul(argv[1], &endp, 16);
++	kernel_entry = (void (*)(int, int, uint))img_addr;
++
++#ifdef CONFIG_USB_DEVICE
++	udc_disconnect();
++#endif
++	cleanup_before_linux();
++
++	r2 = simple_strtoul(argv[2], NULL, 16);
++
++	/* The kernel expects the following when booting:
++	 *  r0 - 0
++	 *  r1 - machine type
++	 *  r2 - boot data (atags/dt) pointer
++	 *
++	 * For more info, refer to:
++	 *  https://www.kernel.org/doc/Documentation/arm/Booting
++	 */
++
++	printf("Booting Linux...\n");
++
++	kernel_entry(0, machid, r2);
++
++	return 0;
++
++usage:
++	return CMD_RET_USAGE;
++}
++static char bootx_help_text[] =
++	"x_addr dt_addr\n    - boot XIP kernel in Flash\n"
++	"\t x_addr: Address of XIP kernel in Flash\n"
++	"\tdt_addr: Address of Device Tree blob image";
++U_BOOT_CMD(
++	bootx,	CONFIG_SYS_MAXARGS,	1,	do_bootx,
++	"boot XIP kernel in Flash", bootx_help_text
++)
+diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconfig
+index ee29a1eabf..655af3f058 100644
+--- a/configs/corstone700_defconfig
++++ b/configs/corstone700_defconfig
+@@ -14,6 +14,7 @@ CONFIG_HUSH_PARSER=y
+ CONFIG_SYS_PROMPT="corstone700# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_BOOTZ=y
++CONFIG_CMD_BOOTX=y
+ CONFIG_CMD_BOOTM=y
+ # CONFIG_CMD_XIMG is not set
+ # CONFIG_CMD_EDITENV is not set
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
new file mode 100644
index 0000000..6b735ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 9f4e54e2bc619124602584e0ec8e268ac6f6221e Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 5 Aug 2020 19:05:08 +0100
+Subject: [PATCH 5/6] boot: starting the XIP kernel using bootx command
+
+bootx command is used as the default command to
+start the XIP kernel
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ include/configs/corstone700.h | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/include/configs/corstone700.h b/include/configs/corstone700.h
+index 32238e4057..cb9ca8af8e 100644
+--- a/include/configs/corstone700.h
++++ b/include/configs/corstone700.h
+@@ -67,12 +67,11 @@
+ 
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 				"kernel_name=zImage\0"		\
+-				"kernel_addr_r=0x80000000\0"	\
++				"kernel_addr_r=0x08300000\0"	\
+ 				"fdt_name=devtree.dtb\0"	\
+-				"fdt_addr_r=0x82000000\0"		\
++				"fdt_addr_r=0x80400000\0"	\
+ 				"fdt_high=0xffffffff\0"
+ 
+-#define CONFIG_BOOTCOMMAND	"echo Booting Kernel...;" \
+-				"bootz $kernel_addr_r - $fdt_addr_r"
++#define CONFIG_BOOTCOMMAND	"bootx $kernel_addr_r $fdt_addr_r"
+ 
+ #endif
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
new file mode 100644
index 0000000..719fa28
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-arm-enabling-the-arch_timer-driver.patch
@@ -0,0 +1,61 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From a008f06b49a96dfd98943696ddc10134947fed91 Mon Sep 17 00:00:00 2001
+From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Date: Wed, 5 Aug 2020 19:06:16 +0100
+Subject: [PATCH 6/6] arm: enabling the arch_timer driver
+
+This patch disables the use of the mmio_timer driver
+and enables the arch_timer driver.
+
+The mmio_timer tries a direct access to the Armv8-A CNTFRQ generic timer
+frequency register through memory mapping. This can not be done because
+this register is only accessible through memory mapping under a secure
+mode only. u-boot runs in non secure Hypervisor mode. To read the counter
+frequency u-boot should use the mrc instruction to read the CNTFRQ system
+register.
+
+The arch_timer driver reads the CNTFRQ register using the mrc instruction.
+
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+---
+ configs/corstone700_defconfig | 3 +++
+ include/configs/corstone700.h | 3 ---
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconfig
+index 655af3f058..58e03db044 100644
+--- a/configs/corstone700_defconfig
++++ b/configs/corstone700_defconfig
+@@ -36,3 +36,6 @@ CONFIG_DM=y
+ CONFIG_DM_ETH=y
+ CONFIG_DM_SERIAL=y
+ CONFIG_OF_LIBFDT=y
++# CONFIG_SYS_HZ_CLOCK is not set
++# CONFIG_SYS_MMIO_TIMER is not set
++CONFIG_SYS_ARCH_TIMER=y
+diff --git a/include/configs/corstone700.h b/include/configs/corstone700.h
+index cb9ca8af8e..0fb606f1ed 100644
+--- a/include/configs/corstone700.h
++++ b/include/configs/corstone700.h
+@@ -14,7 +14,6 @@
+ #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
+ #define CONFIG_SKIP_LOWLEVEL_INIT
+ 
+-#define CONFIG_SYS_HZ_CLOCK	320000000
+ #define CONFIG_SYS_HZ		1000
+ 
+ #define V2M_SRAM0		0x02000000
+@@ -39,8 +38,6 @@
+ #define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
+ #define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
+ 
+-#define CONFIG_SYS_MMIO_TIMER
+-
+ #define CONFIG_PL011_CLOCK	32000000
+ 
+ /* Physical Memory Map */
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 5ab505b..bf57242 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -35,3 +35,13 @@ SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
 # Total Compute KMACHINE
 #
 SRC_URI_append_tc0 = " file://0001-Add-support-for-Total-Compute.patch"
+
+#
+# Corstone700 KMACHINE
+#
+FILESEXTRAPATHS_prepend_corstone700 := "${THISDIR}/files/corstone700:"
+ 
+SRC_URI_append_corstone700 = " file://0001-arm-Add-corstone700-platform.patch \
+                               file://0002-boot-add-bootx-command-to-start-XiP-images.patch \
+                               file://0003-boot-starting-the-XIP-kernel-using-bootx-command.patch \
+                               file://0004-arm-enabling-the-arch_timer-driver.patch"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
new file mode 100644
index 0000000..e54e34a
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
@@ -0,0 +1,28 @@
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
+SECTION = "bootloaders"
+DEPENDS += "flex-native bison-native"
+
+COMPATIBLE_MACHINE = "(corstone700-*)"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
+PE = "1"
+
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "36fec02b1f90b92cf51ec531564f9284eae27ab4"
+
+SRC_URI = "git://git.denx.de/u-boot.git \
+          "
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+require recipes-bsp/u-boot/u-boot.inc
+
+DEPENDS += "bc-native dtc-native"
-- 
2.17.1

