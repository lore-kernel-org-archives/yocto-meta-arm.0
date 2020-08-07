Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.58])
 by mx.groups.io with SMTP id smtpd.web10.4219.1596829413830810457
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=m7i/q5HV;
 spf=pass (domain: arm.com, ip: 40.107.21.58, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXe2EcRoQcbtvSiM0HC7eqxpG/L2t/6LIi14sogGe+8=;
 b=m7i/q5HVxDoXkdv4rrRwK2bcY6FWX9+bGgFxUoc5/uYEvgnVPOwqr55nROSmRpTDdNeMP/Htt9yeSfXEa6UkpGVk0XFW+afH/6dFSU7eMsItSsDUirrbTLIQNpCMIuUM53ymYkMeKuu5+DFKaecc8Fm2AWk2nw2ue/lp8voKAT4=
Received: from DB8PR03CA0005.eurprd03.prod.outlook.com (2603:10a6:10:be::18)
 by VI1PR08MB4558.eurprd08.prod.outlook.com (2603:10a6:803:ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Fri, 7 Aug
 2020 19:43:30 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::24) by DB8PR03CA0005.outlook.office365.com
 (2603:10a6:10:be::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:29 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 07 Aug 2020 19:43:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7c1c187103f3384
X-CR-MTA-TID: 64aa7808
Received: from 46085ef1e567.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 17D8E56A-504F-4D87-8009-116D4F99D869.1;
	Fri, 07 Aug 2020 19:43:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46085ef1e567.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lx5KT6oYWT1u++4nO3mLgzsTmVBb9nic3dgiw8vYaQeYWeyFqGXmMl4iXfPLw3VXkDy2Lwa4z2I703TtHOXWSS3uJinl40TgXVJpVZYIQMJjqJju4VP5Ve7KKthcLeQcOylZCUvg1MsZ3ubicjD1dEYnTS4eqiNxC1yyXwWbbPHmT0Gg51UDAT/hP5+yM4Znb6GSuGmj/Jl2NoQXEYApD62p8twraHD2OZ0kZ+M/ggaoFI/bctidsK3geGrXK171Mbgi19Nvdi2WTx3JCR/8K4J9q77GfZgL/33Q5rPPiGELY3znL5FBNLvnUfctX+1jC6tPL8iym9pZ/UpnVLy7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXe2EcRoQcbtvSiM0HC7eqxpG/L2t/6LIi14sogGe+8=;
 b=h7pk9UeZVOXVZ1KjDXsyagScPuchaC5//GoM2Ld92+o+yeP2ElW6JwN93l74PKpSjX4L5YZnV2doAj8So8iyBbx1avLsP6cAhxMoqQrTkaQ1HhXnMtNbIN81edkh/lPmvJkkUBgYYEt0pqkO5KKjHpa6UEom/JGKnUz4fD4zlfjLyhiXvriBWmGsv6Hjt/JZnOBmTsqJjbBtiPoY+ogUdAbyhnY2lmpwK262/e535E/FQlifLU3uIgaH1Yht+1B2DtSqJ17DriaD6clqQ0oWxlL09LaZs0w6aKKCgiHjALoNrogIJL0dRW812VB3OrNBQe/oEdCy7rROyyxtz/PWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXe2EcRoQcbtvSiM0HC7eqxpG/L2t/6LIi14sogGe+8=;
 b=m7i/q5HVxDoXkdv4rrRwK2bcY6FWX9+bGgFxUoc5/uYEvgnVPOwqr55nROSmRpTDdNeMP/Htt9yeSfXEa6UkpGVk0XFW+afH/6dFSU7eMsItSsDUirrbTLIQNpCMIuUM53ymYkMeKuu5+DFKaecc8Fm2AWk2nw2ue/lp8voKAT4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:22 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:22 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 6/9] arm-bsp/u-boot: adding corstone700 platform to u-boot
Date: Fri,  7 Aug 2020 20:42:50 +0100
Message-Id: <20200807194253.14748-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b5e4e5a8-e71a-4e05-2fe1-08d83b0a28e9
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|VI1PR08MB4558:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB455883CA1A9B3F7BE82876D2FD490@VI1PR08MB4558.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5vJONVRYCqc0h/bUilmlblNs/h5Af008cX3USMSOYT2PWBCP+aOyjMIU3h4njRJG+4Fn3wGJS3dQZAoTOB0gfPchgDibl8ThMEIJbOXztrgoj8Fik5gM8BDWfPIaIcGD6pGf3Vk5qYXxoV3oQdBl+L9EJXxTmiC+2nZcYr0b4eZcdlk4ijvaw5ePm0TTdwK0YkIdnhIa3UsuhhZQMCu6YhnYQIXx0pj6/6EA/cVi5eJDKnQRe1HWPgLcDymBXIoa8F1KPqxLoOpLxJrvhzDRTALkM9NS4t+7RdOgvJFACAsjXCr7AGBP2AzzckpNdVVWJZmSRoHsSzs5HFEElnZyNk3zKZJFUn0XltP8BBK429Dgg2Lj34FZd/kPX8473YdVIY0Vk3pKx3pw9P50pOMDVg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(83380400001)(8936002)(4326008)(6916009)(1076003)(5660300002)(966005)(956004)(2616005)(8676002)(6486002)(30864003)(54906003)(26005)(86362001)(83080400001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 z05rAnStKFjFCWSmL0RypP5XSeyGjK7c+197wGm1ZT+/WVZfCk1N8z0S8UNLH91RIjPfFTi9/tVFsllR7tNG7J7l+hU7EO0BMi6eRgm2XhCFKRzCb1bLXr4IructVrclmZtBaHtjR6LKdyPIeAku3nR7RQAt6EHe8qTR0NRtuTZ9nXoTH8sNdU1E4mPw/SA5EQsgVdX2UPB8A2XTUY3QlH9m1r/qx6LFdPTbQ9Ahu5QSpfeu2fYvw+yfJE6xuQEpuq4+5fnkE7Yc3gUvQuGA+2/qBmY27LJn0gt67vT3kKZlw/977LnxZ/79dOSKNDNiWme/eUzi5GGPpeOja2YQB4yQ3YDyMDAk/Wv6JVIHR7HwFVN0D1K7i9i/H936EigzgBYt3KZLdRzETFPT+qNEh0KTdcsThMwwypJF7HMcXSdM1t/CYl2fZDRN3e1J8f/f+jjIZCST/qUVpbTKr1DArwrsHXz8YLPD1I1pFBvo/YEu52bnouR+hIJgbX277KR2oM32DL/s667hw7usFgRTWDvu2gVo7djKGlTpW1zxsnRz6BevYyuzET+8+u2itTMyDtGvGMyU9kwhOveORy5FMHxMx/eArxYVDogupdqZKf3dkc6K5lMjzTj4mhnbSYKo3IYl7iUD6T/eO0w9u7e8BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	da672856-d0b8-432a-008c-08d83b0a2471
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	13k2b7NxVXOwuGiwGUciRuaaEteUUSP+xMApRzMSUgq8iX54IEfvP53tmjaiV0w/aO5N9H0WBt/wPcL5EhktcUQBLHrISrv2nWMv2yYFYOaYKP9jISgW9aNgT8jTr7z03coj9DfS0s0glEtPcTndnY04pZv8W+3lGRcr6ORSxWmvHmYC74bGDclPX+7GZsFunnrGjlm3+llY/xuhLmSKXyNZntFBrCRgl/oZmOP7lzxejr7ivNiDdt6WeyL8umU3pFUCtXBmvsOkDJT0iWYcRGSWhVeArGZmv0Hbqs0NIhzHUSEi//pBnl6BZQ24XuLc55l9hOMMcmowBSoru+QBXHddxY9UyeYSUfFCHEKrBolS/LXRlSvcDHagXtpTEEwq2xdR0wmQRSY7iLZavQtItbQ7yGQpab4VE/VnHHC9zu9DsOT4mpV3s1lCTH8AVP7hdx/YjP5qKWQGpk1xtUrx8Fq4ziWW1nhGtmiEvCmc+ao=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(1076003)(36756003)(16526019)(26005)(8936002)(336012)(8676002)(966005)(186003)(2906002)(956004)(6666004)(478600001)(86362001)(2616005)(30864003)(82740400003)(47076004)(81166007)(54906003)(356005)(316002)(82310400002)(6486002)(70586007)(70206006)(107886003)(7696005)(9686003)(83080400001)(83380400001)(4326008)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:29.4937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e4e5a8-e71a-4e05-2fe1-08d83b0a28e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4558
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
 .../0001-armv7-add-mmio-timer.patch           | 108 ++++++
 ...-arm-add-designstart-cortex-a5-board.patch | 312 ++++++++++++++++++
 .../0003-arm-Add-corstone700-platform.patch   | 301 +++++++++++++++++
 ...dd-bootx-command-to-start-XiP-images.patch | 136 ++++++++
 ...g-the-XIP-kernel-using-bootx-command.patch |  39 +++
 ...6-arm-enabling-the-arch_timer-driver.patch |  61 ++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  12 +
 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb |  26 ++
 9 files changed, 999 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
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
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
new file mode 100644
index 0000000..3b72faf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio-timer.patch
@@ -0,0 +1,108 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From 4a47e29e8c0dd7d063b44fafff7db06f00c42fc0 Mon Sep 17 00:00:00 2001
+From: Rui Silva <rui.silva@linaro.org>
+Date: Wed, 5 Aug 2020 18:57:03 +0100
+Subject: [PATCH 1/6] armv7: add mmio timer
+
+This timer can be used by u-boot when arch-timer is not available in
+core, for example, Cortex-A5.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/cpu/armv7/Makefile     |  1 +
+ arch/arm/cpu/armv7/mmio_timer.c | 56 +++++++++++++++++++++++++++++++++
+ scripts/config_whitelist.txt    |  1 +
+ 3 files changed, 58 insertions(+)
+ create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
+
+diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
+index 8c955d0d52..82af9c0312 100644
+--- a/arch/arm/cpu/armv7/Makefile
++++ b/arch/arm/cpu/armv7/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
+ obj-$(CONFIG_IPROC) += iproc-common/
+ obj-$(CONFIG_KONA) += kona-common/
+ obj-$(CONFIG_SYS_ARCH_TIMER) += arch_timer.o
++obj-$(CONFIG_SYS_MMIO_TIMER) += mmio_timer.o
+ 
+ ifneq (,$(filter s5pc1xx exynos,$(SOC)))
+ obj-y += s5p-common/
+diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
+new file mode 100644
+index 0000000000..5d6f661723
+--- /dev/null
++++ b/arch/arm/cpu/armv7/mmio_timer.c
+@@ -0,0 +1,56 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright (c) 2019, Arm Limited. All rights reserved.
++ *
++ */
++
++#include <common.h>
++#include <asm/io.h>
++#include <div64.h>
++#include <bootstage.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++#define CNTCTLBASE    0x1a020000UL
++#define CNTREADBASE   0x1a030000UL
++
++static inline uint32_t mmio_read32(uintptr_t addr)
++{
++      return *(volatile uint32_t*)addr;
++}
++
++int timer_init(void)
++{
++      gd->arch.timer_rate_hz = mmio_read32(CNTCTLBASE);
++
++      return 0;
++}
++
++unsigned long long get_ticks(void)
++{
++      return ((mmio_read32(CNTCTLBASE + 0x4) << 32) |
++              mmio_read32(CNTREADBASE));
++}
++
++ulong get_timer(ulong base)
++{
++      return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
++}
++
++void __udelay(unsigned long usec)
++{
++      unsigned long endtime;
++
++      endtime = lldiv((unsigned long long)usec * gd->arch.timer_rate_hz,
++                      1000UL);
++
++      endtime += get_ticks();
++
++      while (get_ticks() < endtime)
++              ;
++}
++
++ulong get_tbclk(void)
++{
++      return gd->arch.timer_rate_hz;
++}
+diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
+index 6908431d03..186001ecfb 100644
+--- a/scripts/config_whitelist.txt
++++ b/scripts/config_whitelist.txt
+@@ -3108,6 +3108,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+ CONFIG_SYS_MMC_U_BOOT_OFFS
+ CONFIG_SYS_MMC_U_BOOT_SIZE
+ CONFIG_SYS_MMC_U_BOOT_START
++CONFIG_SYS_MMIO_TIMER
+ CONFIG_SYS_MONITOR_
+ CONFIG_SYS_MONITOR_BASE
+ CONFIG_SYS_MONITOR_BASE_EARLY
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
new file mode 100644
index 0000000..217e52a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
@@ -0,0 +1,312 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From a9f0c9861d49a7b14fa10c53192850f46bd8b9b1 Mon Sep 17 00:00:00 2001
+From: Rui Silva <rui.silva@linaro.org>
+Date: Wed, 5 Aug 2020 18:58:40 +0100
+Subject: [PATCH 2/6] board: arm: add designstart cortex-a5 board
+
+Arm added a new board, designstart, with a cortex-a5 chip, add the
+default configuration, initialization and makefile for this system.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/Kconfig                       |   7 ++
+ board/armltd/designstart/Kconfig       |  12 +++
+ board/armltd/designstart/Makefile      |   8 ++
+ board/armltd/designstart/designstart.c |  49 ++++++++++
+ configs/designstart_ca5_defconfig      |  37 ++++++++
+ include/configs/designstart_ca5.h      | 122 +++++++++++++++++++++++++
+ 6 files changed, 235 insertions(+)
+ create mode 100644 board/armltd/designstart/Kconfig
+ create mode 100644 board/armltd/designstart/Makefile
+ create mode 100644 board/armltd/designstart/designstart.c
+ create mode 100644 configs/designstart_ca5_defconfig
+ create mode 100644 include/configs/designstart_ca5.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index bbb1e2738b..ed7ee146ac 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -636,6 +636,12 @@ config ARCH_BCM6858
+ 	select OF_CONTROL
+ 	imply CMD_DM
+ 
++config TARGET_DESIGNSTART_CA5
++      bool "Support Designstart Cortex-A5"
++      select CPU_V7A
++      select SEMIHOSTING
++      select PL01X_SERIAL
++
+ config TARGET_VEXPRESS_CA15_TC2
+ 	bool "Support vexpress_ca15_tc2"
+ 	select CPU_V7A
+@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
+ source "board/armadeus/apf27/Kconfig"
+ source "board/armltd/vexpress/Kconfig"
+ source "board/armltd/vexpress64/Kconfig"
++source "board/armltd/designstart/Kconfig"
+ source "board/cortina/presidio-asic/Kconfig"
+ source "board/broadcom/bcm23550_w1d/Kconfig"
+ source "board/broadcom/bcm28155_ap/Kconfig"
+diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
+new file mode 100644
+index 0000000000..a9564e8655
+--- /dev/null
++++ b/board/armltd/designstart/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_DESIGNSTART_CA5
++
++config SYS_BOARD
++      default "designstart"
++
++config SYS_VENDOR
++      default "armltd"
++
++config SYS_CONFIG_NAME
++      default "designstart_ca5"
++
++endif
+diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/Makefile
+new file mode 100644
+index 0000000000..d2dc2b74ed
+--- /dev/null
++++ b/board/armltd/designstart/Makefile
+@@ -0,0 +1,8 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2020 ARM Limited
++# (C) Copyright 2020 Linaro
++# Rui Miguel Silva <rui.silva@linaro.org>
++#
++
++obj-y := designstart.o
+diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designstart/designstart.c
+new file mode 100644
+index 0000000000..658057a003
+--- /dev/null
++++ b/board/armltd/designstart/designstart.c
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
++      .base = V2M_UART0,
++      .type = TYPE_PL011,
++      .clock = CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DEVICE(designstart_serials) = {
++      .name = "serial_pl01x",
++      .platdata = &serial_platdata,
++};
++
++int board_init(void)
++{
++      return 0;
++}
++
++int dram_init(void)
++{
++      gd->ram_size = PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++int dram_init_banksize(void)
++{
++      gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
++      gd->bd->bi_dram[0].size = PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++void reset_cpu(ulong addr)
++{
++}
++
+diff --git a/configs/designstart_ca5_defconfig b/configs/designstart_ca5_defconfig
+new file mode 100644
+index 0000000000..a2a7567402
+--- /dev/null
++++ b/configs/designstart_ca5_defconfig
+@@ -0,0 +1,37 @@
++CONFIG_ARM=y
++CONFIG_TARGET_DESIGNSTART_CA5=y
++CONFIG_SYS_TEXT_BASE=0x88000000
++CONFIG_SYS_MALLOC_F_LEN=0x2000
++CONFIG_NR_DRAM_BANKS=1
++CONFIG_IDENT_STRING=" ca5ds aarch32"
++CONFIG_BOOTDELAY=1
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1a200000 root=/dev/ram0 rw loglevel=9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=y
++CONFIG_SYS_PROMPT="ca5ds32# "
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_IMLS is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_MEMTEST=y
++CONFIG_MTD_NOR_FLASH=y
++# CONFIG_CMD_LOADS is not set
++CONFIG_CMD_ARMFLASH=y
++# CONFIG_CMD_FPGA is not set
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
++CONFIG_DM_SERIAL=y
++CONFIG_OF_LIBFDT=y
++
+diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
+new file mode 100644
+index 0000000000..6db5b1cf4a
+--- /dev/null
++++ b/include/configs/designstart_ca5.h
+@@ -0,0 +1,122 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * (C) Copyright 2020 ARM Limited
++ * (C) Copyright 2020 Linaro
++ * Rui Miguel Silva <rui.silva@linaro.org>
++ *
++ * Configuration for Cortex-A5 Designstart. Parts were derived from other ARM
++ * configurations.
++ */
++
++#ifndef __DESISGNSTART_CA5_H
++#define __DESISGNSTART_CA5_H
++
++#define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
++#define CONFIG_SKIP_LOWLEVEL_INIT
++
++/* Generic Timer Definitions */
++#define CONFIG_SYS_HZ_CLOCK   7500000
++#define CONFIG_SYS_HZ         1000
++#define COUNTER_FREQUENCY     CONFIG_SYS_HZ_CLOCK
++
++#ifdef CONFIG_DESIGNSTART_MEMORY_MAP_EXTENDED
++#define V2M_SRAM0             0x00010000
++#define V2M_SRAM1             0x02200000
++#define V2M_QSPI              0x0A800000
++#else
++#define V2M_SRAM0             0x00000000
++#define V2M_SRAM1             0x02000000
++#define V2M_QSPI              0x08000000
++#endif
++
++#define V2M_DEBUG             0x10000000
++#define V2M_BASE_PERIPH               0x1A000000
++#define V2M_A5_PERIPH         0x1C000000
++#define V2M_L2CC_PERIPH               0x1C010000
++
++#define V2M_MASTER_EXPANSION0 0x40000000
++#define V2M_MASTER_EXPANSION1 0x60000000
++
++#define V2M_BASE              0x80000000
++
++#define V2M_PERIPH_OFFSET(x)  (x << 16)
++
++#define V2M_SYSID             (V2M_BASE_PERIPH)
++#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++#define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
++#define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
++#define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
++#define V2M_TIMER0            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(5))
++
++#define V2M_WATCHDOG_CTL      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(16))
++#define V2M_WATCHDOG_REFRESH  (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(17))
++
++#define V2M_UART0             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
++#define V2M_UART1             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
++
++#define V2M_RTC                       (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
++#define V2M_TRNG              (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
++
++/* PL011 Serial Configuration */
++#define CONFIG_CONS_INDEX     0
++#define CONFIG_PL011_CLOCK    7500000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1          (V2M_BASE)
++
++/* Top 16MB reserved for secure world use */
++#define DRAM_SEC_SIZE         0x01000000
++#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN (CONFIG_ENV_SIZE + (8 << 20))
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_LOAD_ADDR  (V2M_BASE + 0x10000000)
++
++#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
++
++#define CONFIG_SYS_MMIO_TIMER
++
++/* Enable memtest */
++#define CONFIG_SYS_MEMTEST_START      PHYS_SDRAM_1
++#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE)
++
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++                              "kernel_name=Image\0"           \
++                              "kernel_addr=0x80F00000\0"      \
++                              "initrd_name=ramdisk.img\0"     \
++                              "initrd_addr=0x84000000\0"      \
++                              "fdt_name=devtree.dtb\0"        \
++                              "fdt_addr=0x83000000\0"         \
++                              "fdt_high=0xffffffff\0"         \
++                              "initrd_high=0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND    "echo copy to RAM...; " \
++                              "cp.b 0x80100000 $kernel_addr 0xB00000; " \
++                              "cp.b 0x80D00000 $initrd_addr 0x800000; " \
++                              "bootz $kernel_addr $initrd_addr $fdt_addr"
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size */
++#define CONFIG_SYS_MAXARGS            64      /* max command args */
++
++#define CONFIG_SYS_FLASH_BASE         0x80000000
++/* 256 x 256KiB sectors */
++#define CONFIG_SYS_MAX_FLASH_SECT     256
++/* Store environment at top of flash */
++#define CONFIG_ENV_ADDR                       0x0A7C0000
++#define CONFIG_ENV_SECT_SIZE          0x00040000
++
++#define CONFIG_SYS_FLASH_CFI          1
++#define CONFIG_FLASH_CFI_DRIVER               1
++#define CONFIG_SYS_FLASH_CFI_WIDTH    FLASH_CFI_32BIT
++#define CONFIG_SYS_MAX_FLASH_BANKS    1
++
++#define CONFIG_SYS_FLASH_USE_BUFFER_WRITE /* use buffered writes */
++#define CONFIG_SYS_FLASH_PROTECTION   /* The devices have real protection */
++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
++#define FLASH_MAX_SECTOR_SIZE         0x00040000
++#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
++#define CONFIG_ENV_IS_IN_FLASH                1
++#endif
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
new file mode 100644
index 0000000..8e4817d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corstone700-platform.patch
@@ -0,0 +1,301 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From e480b0327de3bdab378d2c8c7117f409f29bf74b Mon Sep 17 00:00:00 2001
+From: Rui Silva <rui.silva@linaro.org>
+Date: Wed, 5 Aug 2020 19:01:29 +0100
+Subject: [PATCH 3/6] arm: Add corstone700 platform
+
+Add support to the new Arm corstone700 platform family.
+
+Make some adjustments to the mmio timer and to the cortex-a5
+designstart platform to share as much as possible between this
+platforms.
+
+Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+---
+ arch/arm/Kconfig                       |  7 +++
+ arch/arm/cpu/armv7/mmio_timer.c        |  4 +-
+ board/armltd/corstone700/Kconfig       | 12 ++++
+ board/armltd/corstone700/Makefile      |  8 +++
+ board/armltd/corstone700/corstone700.c | 49 ++++++++++++++++
+ configs/corstone700_defconfig          | 37 ++++++++++++
+ include/configs/corstone700.h          | 78 ++++++++++++++++++++++++++
+ include/configs/designstart_ca5.h      |  2 +-
+ 8 files changed, 194 insertions(+), 3 deletions(-)
+ create mode 100644 board/armltd/corstone700/Kconfig
+ create mode 100644 board/armltd/corstone700/Makefile
+ create mode 100644 board/armltd/corstone700/corstone700.c
+ create mode 100644 configs/corstone700_defconfig
+ create mode 100644 include/configs/corstone700.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index ed7ee146ac..84b79d79b9 100644
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
+ config TARGET_DESIGNSTART_CA5
+       bool "Support Designstart Cortex-A5"
+       select CPU_V7A
+@@ -1827,6 +1833,7 @@ source "board/armadeus/apf27/Kconfig"
+ source "board/armltd/vexpress/Kconfig"
+ source "board/armltd/vexpress64/Kconfig"
+ source "board/armltd/designstart/Kconfig"
++source "board/armltd/corstone700/Kconfig"
+ source "board/cortina/presidio-asic/Kconfig"
+ source "board/broadcom/bcm23550_w1d/Kconfig"
+ source "board/broadcom/bcm28155_ap/Kconfig"
+diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
+index 5d6f661723..a81e28c41a 100644
+--- a/arch/arm/cpu/armv7/mmio_timer.c
++++ b/arch/arm/cpu/armv7/mmio_timer.c
+@@ -11,8 +11,8 @@
+ 
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+-#define CNTCTLBASE    0x1a020000UL
+-#define CNTREADBASE   0x1a030000UL
++#define CNTCTLBASE	V2M_COUNTER_CTL
++#define CNTREADBASE	V2M_COUNTER_READ
+ 
+ static inline uint32_t mmio_read32(uintptr_t addr)
+ {
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
+diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
+index 6db5b1cf4a..9837ba0cd0 100644
+--- a/include/configs/designstart_ca5.h
++++ b/include/configs/designstart_ca5.h
+@@ -42,7 +42,7 @@
+ #define V2M_PERIPH_OFFSET(x)  (x << 16)
+ 
+ #define V2M_SYSID             (V2M_BASE_PERIPH)
+-#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++#define V2M_SYSCTL            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
+ #define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
+ #define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
+ #define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
new file mode 100644
index 0000000..bc27f66
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
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
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
new file mode 100644
index 0000000..6b735ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-command.patch
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
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
new file mode 100644
index 0000000..719fa28
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-the-arch_timer-driver.patch
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
index 5ab505b..f2d23b5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -35,3 +35,15 @@ SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
 # Total Compute KMACHINE
 #
 SRC_URI_append_tc0 = " file://0001-Add-support-for-Total-Compute.patch"
+
+#
+# Corstone700 KMACHINE
+#
+FILESEXTRAPATHS_prepend_corstone700 := "${THISDIR}/files/corstone700:"
+
+SRC_URI_append_corstone700 = " file://0001-armv7-add-mmio-timer.patch \
+                               file://0002-board-arm-add-designstart-cortex-a5-board.patch \
+                               file://0003-arm-Add-corstone700-platform.patch \
+                               file://0004-boot-add-bootx-command-to-start-XiP-images.patch \
+                               file://0005-boot-starting-the-XIP-kernel-using-bootx-command.patch \
+                               file://0006-arm-enabling-the-arch_timer-driver.patch"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
new file mode 100644
index 0000000..5fee543
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
@@ -0,0 +1,26 @@
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
+SECTION = "bootloaders"
+DEPENDS += "flex-native bison-native"
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

