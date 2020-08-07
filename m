Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.62])
 by mx.groups.io with SMTP id smtpd.web12.5203.1596804156486457701
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3CL8oteP;
 spf=pass (domain: arm.com, ip: 40.107.1.62, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMI27sfvfs/QtepT3eJYVaSC1hASkCWAXKe3EMllVJI=;
 b=3CL8otePw+g7AQlfSaDcCKku3qeb5M6o3+2zFP/RbAERU4LbHpMC7wuz9ZdJTqsck0FnuR7PZIScdnUL88eE2i+Br9iKpfS4kyFQRT3TW360TFjHt/3SaXNmLQhQ7qtPMwDvv0SrIzxYfrQVYYvcaLpnPdiQpzpvBppXos3/SEQ=
Received: from DB3PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:8:1::28) by
 VI1PR08MB2925.eurprd08.prod.outlook.com (2603:10a6:802:19::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Fri, 7 Aug 2020 12:42:31 +0000
Received: from DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::a6) by DB3PR06CA0015.outlook.office365.com
 (2603:10a6:8:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT038.mail.protection.outlook.com (10.152.21.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:31 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 07 Aug 2020 12:42:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7aa5f4f1c0fd793
X-CR-MTA-TID: 64aa7808
Received: from 72ccdf0697a0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E624ECA7-57A6-42AB-AE10-0A9CE19AD171.1;
	Fri, 07 Aug 2020 12:42:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 72ccdf0697a0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYf1bAyALckzAnKIxGkBYsMk7UL5veeOIwqeR110ypD9xcShK3Ps1RBBEERFIJnHhhm0jrBbcs4hI99EtlL722GoXp9TvDmPYMEKZB1jLqQy4DSk3YKDw3pAOwXBKjTN49GdxVbhj61XYIvPNy81ScKkKqhhSO9na7/8M2wkrPFyEjviOZ/6CZrxcF5kmqSqfuG02WDP5euUoWvuenGuSUDapxy3vWThm36IcPzKQUjfGwCK684bu27dU6w0+hL46dtXQbkieMKP6Z1Mb2EGyPzqY6HqqzbIBz3WK1sRLQoaE1OtxagCVCAnixq7gQdJOA7axX8BFPugwrHEiXhq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMI27sfvfs/QtepT3eJYVaSC1hASkCWAXKe3EMllVJI=;
 b=djGF27jHMMFT2I1kKznr0ubmjN7vcYV2K2se7F7mkVTl71nAgP2wLUGjcHMpTzKtODuqAhAEZ2VEJCAzWaaM8syvmNr43iQ0cA0fK2Q0phRQXzEtib0gyr1VTh1V0ArLiRVwChKdMKqPAwqCVNlk0bYVQZ6+aYlQHfLhtJbhKMxwVuiR055lD9LlWAWDpFZZjPxUETwUfLVDW950tV/WWwEGQDL/VUvbU5JqXkAb2V3WTHLvukciJ/hiXjkWg4BDYyaity19mcPdjLtnGxsY3YJRa8tWFrG8i/0pbYKBhUK9sauZUDrYMSWmF3szMtFF/AC+t8YNZMW9OP9IG3wddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMI27sfvfs/QtepT3eJYVaSC1hASkCWAXKe3EMllVJI=;
 b=3CL8otePw+g7AQlfSaDcCKku3qeb5M6o3+2zFP/RbAERU4LbHpMC7wuz9ZdJTqsck0FnuR7PZIScdnUL88eE2i+Br9iKpfS4kyFQRT3TW360TFjHt/3SaXNmLQhQ7qtPMwDvv0SrIzxYfrQVYYvcaLpnPdiQpzpvBppXos3/SEQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:24 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:24 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 6/9] arm-bsp/u-boot: adding corstone700 platform to u-boot
Date: Fri,  7 Aug 2020 13:41:52 +0100
Message-Id: <20200807124155.24198-7-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc2bc216-f7cc-412e-f457-08d83acf5a0a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|VI1PR08MB2925:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB29251C91C150F1A0E0C4EB50FD490@VI1PR08MB2925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GclhGlDNqx6xrHAWUwUZiWjAzjs2Ava/vx/3zw9MuJ+MAUTMYSUTg2GniI2xLr3E7sNKzGs8WP0gv3uRgNfhz3OQln67bFzKWwcrhz/fNRsZ414Yy33XnY0n1II5g4dZM0JyEolosse/PBlxFxG+/9F3/AHXKCNOiZbpsGWpJOZ9t0G2y4oxZ5/H/kAsgUpxO2/WfabiXqPck5KQkMhPDg49oO4/AQSC9DW4+JhV8fKcaNnqR1YI086p+Fw2LqZEjVipc/j834ZBZiGOWcF2MX1k1j5wzERp/u/dX6qze/j+vFYOjRDFhzEpp8QUZtNmUK/hiqfF7TwU3/Ep3irl9Ne4x1E61S9Uw3Nbol0SqSCJzsNGVs3NJqYN2dLd+Tp1HQ51nSmDOHTuyvjncJHMOA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(66476007)(66556008)(36756003)(9686003)(478600001)(8936002)(8676002)(2906002)(83080400001)(6916009)(54906003)(66946007)(316002)(6486002)(966005)(4326008)(6666004)(186003)(26005)(86362001)(1076003)(16526019)(956004)(2616005)(7696005)(52116002)(5660300002)(30864003)(83380400001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Gc/gUn4+RKlcL/LP4++E1J4XkrvGQ4U3eKaVi5lufU8NotF3H5Rnuhzhh5VpFCKnKmIhl3Po3yGgvnlz3bHy+gvXCuqQJAgtwRZipWN4YeYVOjOhxfeOJt8ygx1f9OGhlrEM9Z99XnZWgwUgzKhEy8rOw0WcjBma5edtDf/u9dlNw3WfYNFlZzyMQ6tjH7/67fawmY936TSq1VnXZ9l3aDPz1d6B5+W5TBdvBV8IG75mgkvTJuvoug9a4InlVq7eSZux38LH+t7T/abT1lVujDeufiN0Dno3ms1EocHLC9N85CQPYTz9mYAh6hcL48XKq+jS46DvEgah03+RpWuYFEoRulhDrOgsphbLQ77bNaWb+nthBBNkzAXJGl6VvlrJFEpX/b3Iif1VJmLjjDdZ7vGDvVR1Oid7AzqzBSZY++EJr3SEjk43FbygEjvAbeex+0godzsF4BKXRNHsoMGgKk+OOxOGEGgLKpMiV6p7JZdpORl+fL+JjhVuDG+5Z8vVL1H1Dup/sPHvoXx8++A9Fo25DN/ToRFoX8YMDcBjGO2/Ho9GO3M5W2E6yZIAyWdfcunl79RMLpzmOMvQjQi2Pnct7B+EPhp22j0BFhyjyeZifBLx6tde/N7gMkCSf05Fl67At6JEVJ6cyYqJPg2ynA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1487fb79-9acd-47a2-9e7d-08d83acf55cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UDqSJ7t/F0Rxw4TxvBKIARN5t/Lsqa/DkO4B2d6SVkbpJDZFHcHrlEGZsVh1YkJzjvcw8Jyhh3oj8ZAvhs9ruh5PJznVWwQ6RfL6bUBoW9yLNp7ZofmhDb2mqlen0Ubrid80n/oHEKbKIcQwoWK4t6HXEFkjKwTHjRE5TXc8OmhV9G6DAoIFoRtrdRlhydtVXs5r7ASHK/khxmhoED9NQOdaxAlVqcehTEOoAA5mBtGAs5hphu3Dp4dcDSVrhDPhFNDsC/z7tzhNpNKzCzKnpCjzJ7cx9judPlu7Ng1nVVMquW9kGBVvING/AJscAR/BuawQg4/gBQlvRRT2sZFPBaWMh88WOb9/KHP4wQJeosn43asFgRWtD9fMeAnU3dnppz9N0iG3sMwp1ZDfBW91vAGuqhO1liTXBAdjHPatve/SuBT7AcC2F6E2l8iXzMToGIIKppt4H2rDYTBjm+3VQfwXSGq7xLMaGUXWnvXyTB0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(54906003)(336012)(4326008)(1076003)(9686003)(956004)(2616005)(30864003)(6666004)(316002)(6916009)(107886003)(7696005)(36756003)(6486002)(478600001)(86362001)(26005)(186003)(966005)(16526019)(2906002)(8936002)(47076004)(82740400003)(70206006)(70586007)(83380400001)(356005)(83080400001)(81166007)(8676002)(5660300002)(82310400002)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:31.6153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2bc216-f7cc-412e-f457-08d83acf5a0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2925
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Adding support for the new Arm corstone700 platform family.

The current supported corstone700 machine is corstone700-fvp.

The changes are as follows:

  - Making some adjustments to the mmio timer and to the cortex-a5
    designstart platform to share as much as possible between this
    platforms.

  - Disabling the use of the mmio_timer driver and enabling the
    arch_timer driver.
    The mmio_timer tries a direct access to the Armv8-A CNTFRQ generic time=
r
    frequency register through memory mapping. This can not be done because
    this register is only accessible through memory mapping under a secure
    mode only. u-boot runs in non secure Hypervisor mode. To read the count=
er
    frequency u-boot should use the mrc instruction to read the CNTFRQ syst=
em
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
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-=
armv7-add-mmio-timer.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-=
board-arm-add-designstart-cortex-a5-board.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-=
arm-Add-corstone700-platform.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-=
boot-add-bootx-command-to-start-XiP-images.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-=
boot-starting-the-XIP-kernel-using-bootx-command.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-=
arm-enabling-the-arch_timer-driver.patch
 create mode 100644 meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-b=
sp/conf/machine/include/corstone700.inc
index 4c00c6d..6b02415 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,10 +14,13 @@ PREFERRED_VERSION_linux-stable ?=3D "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"

-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a external-system"
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a external-system u-boot=
"

 WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"

 WKS_FILE ?=3D "arm-reference-image.corstone700.wks"

 VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
+
+UBOOT_MACHINE ?=3D "corstone700_defconfig"
+PREFERRED_VERSION_u-boot ?=3D "2020.04"
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-a=
dd-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/000=
1-armv7-add-mmio-timer.patch
new file mode 100644
index 0000000..3b72faf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0001-armv7-add-mmio=
-timer.patch
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
+@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)     +=3D psci.o psci-common.o
+ obj-$(CONFIG_IPROC) +=3D iproc-common/
+ obj-$(CONFIG_KONA) +=3D kona-common/
+ obj-$(CONFIG_SYS_ARCH_TIMER) +=3D arch_timer.o
++obj-$(CONFIG_SYS_MMIO_TIMER) +=3D mmio_timer.o
+
+ ifneq (,$(filter s5pc1xx exynos,$(SOC)))
+ obj-y +=3D s5p-common/
+diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_tim=
er.c
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
++      gd->arch.timer_rate_hz =3D mmio_read32(CNTCTLBASE);
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
++      endtime =3D lldiv((unsigned long long)usec * gd->arch.timer_rate_hz=
,
++                      1000UL);
++
++      endtime +=3D get_ticks();
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
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-a=
rm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
files/corstone700/0002-board-arm-add-designstart-cortex-a5-board.patch
new file mode 100644
index 0000000..217e52a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0002-board-arm-add-=
designstart-cortex-a5-board.patch
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
+       select OF_CONTROL
+       imply CMD_DM
+
++config TARGET_DESIGNSTART_CA5
++      bool "Support Designstart Cortex-A5"
++      select CPU_V7A
++      select SEMIHOSTING
++      select PL01X_SERIAL
++
+ config TARGET_VEXPRESS_CA15_TC2
+       bool "Support vexpress_ca15_tc2"
+       select CPU_V7A
+@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
+ source "board/armadeus/apf27/Kconfig"
+ source "board/armltd/vexpress/Kconfig"
+ source "board/armltd/vexpress64/Kconfig"
++source "board/armltd/designstart/Kconfig"
+ source "board/cortina/presidio-asic/Kconfig"
+ source "board/broadcom/bcm23550_w1d/Kconfig"
+ source "board/broadcom/bcm28155_ap/Kconfig"
+diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/K=
config
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
+diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/=
Makefile
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
++obj-y :=3D designstart.o
+diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designs=
tart/designstart.c
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
++static const struct pl01x_serial_platdata serial_platdata =3D {
++      .base =3D V2M_UART0,
++      .type =3D TYPE_PL011,
++      .clock =3D CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DEVICE(designstart_serials) =3D {
++      .name =3D "serial_pl01x",
++      .platdata =3D &serial_platdata,
++};
++
++int board_init(void)
++{
++      return 0;
++}
++
++int dram_init(void)
++{
++      gd->ram_size =3D PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++int dram_init_banksize(void)
++{
++      gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
++      gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++void reset_cpu(ulong addr)
++{
++}
++
+diff --git a/configs/designstart_ca5_defconfig b/configs/designstart_ca5_d=
efconfig
+new file mode 100644
+index 0000000000..a2a7567402
+--- /dev/null
++++ b/configs/designstart_ca5_defconfig
+@@ -0,0 +1,37 @@
++CONFIG_ARM=3Dy
++CONFIG_TARGET_DESIGNSTART_CA5=3Dy
++CONFIG_SYS_TEXT_BASE=3D0x88000000
++CONFIG_SYS_MALLOC_F_LEN=3D0x2000
++CONFIG_NR_DRAM_BANKS=3D1
++CONFIG_IDENT_STRING=3D" ca5ds aarch32"
++CONFIG_BOOTDELAY=3D1
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1a200000 root=3D/=
dev/ram0 rw loglevel=3D9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=3Dy
++CONFIG_SYS_PROMPT=3D"ca5ds32# "
++CONFIG_CMD_BOOTZ=3Dy
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_IMLS is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++CONFIG_CMD_MEMTEST=3Dy
++CONFIG_MTD_NOR_FLASH=3Dy
++# CONFIG_CMD_LOADS is not set
++CONFIG_CMD_ARMFLASH=3Dy
++# CONFIG_CMD_FPGA is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=3Dy
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=3Dy
++CONFIG_CMD_PING=3Dy
++CONFIG_CMD_CACHE=3Dy
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=3Dy
++CONFIG_DM=3Dy
++CONFIG_DM_SERIAL=3Dy
++CONFIG_OF_LIBFDT=3Dy
++
+diff --git a/include/configs/designstart_ca5.h b/include/configs/designsta=
rt_ca5.h
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
++ * Configuration for Cortex-A5 Designstart. Parts were derived from other=
 ARM
++ * configurations.
++ */
++
++#ifndef __DESISGNSTART_CA5_H
++#define __DESISGNSTART_CA5_H
++
++#define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x=
03f00000)
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
++#define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSE=
T(2))
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
++#define V2M_RTC                       (V2M_BASE_PERIPH + V2M_PERIPH_OFFSE=
T(34))
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
++#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_=
1_SIZE)
++
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++                              "kernel_name=3DImage\0"           \
++                              "kernel_addr=3D0x80F00000\0"      \
++                              "initrd_name=3Dramdisk.img\0"     \
++                              "initrd_addr=3D0x84000000\0"      \
++                              "fdt_name=3Ddevtree.dtb\0"        \
++                              "fdt_addr=3D0x83000000\0"         \
++                              "fdt_high=3D0xffffffff\0"         \
++                              "initrd_high=3D0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND    "echo copy to RAM...; " \
++                              "cp.b 0x80100000 $kernel_addr 0xB00000; " \
++                              "cp.b 0x80D00000 $initrd_addr 0x800000; " \
++                              "bootz $kernel_addr $initrd_addr $fdt_addr"
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size =
*/
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
++#define CONFIG_SYS_FLASH_PROTECTION   /* The devices have real protection=
 */
++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
++#define FLASH_MAX_SECTOR_SIZE         0x00040000
++#define CONFIG_ENV_SIZE                       CONFIG_ENV_SECT_SIZE
++#define CONFIG_ENV_IS_IN_FLASH                1
++#endif
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add=
-corstone700-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/corston=
e700/0003-arm-Add-corstone700-platform.patch
new file mode 100644
index 0000000..8e4817d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0003-arm-Add-corsto=
ne700-platform.patch
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
+       select OF_CONTROL
+       imply CMD_DM
+
++config TARGET_CORSTONE700
++      bool "Support Corstone700"
++      select CPU_V7A
++      select SEMIHOSTING
++      select PL01X_SERIAL
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
+diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_tim=
er.c
+index 5d6f661723..a81e28c41a 100644
+--- a/arch/arm/cpu/armv7/mmio_timer.c
++++ b/arch/arm/cpu/armv7/mmio_timer.c
+@@ -11,8 +11,8 @@
+
+ DECLARE_GLOBAL_DATA_PTR;
+
+-#define CNTCTLBASE    0x1a020000UL
+-#define CNTREADBASE   0x1a030000UL
++#define CNTCTLBASE    V2M_COUNTER_CTL
++#define CNTREADBASE   V2M_COUNTER_READ
+
+ static inline uint32_t mmio_read32(uintptr_t addr)
+ {
+diff --git a/board/armltd/corstone700/Kconfig b/board/armltd/corstone700/K=
config
+new file mode 100644
+index 0000000000..ae625d96ad
+--- /dev/null
++++ b/board/armltd/corstone700/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_CORSTONE700
++
++config SYS_BOARD
++      default "corstone700"
++
++config SYS_VENDOR
++      default "armltd"
++
++config SYS_CONFIG_NAME
++      default "corstone700"
++
++endif
+diff --git a/board/armltd/corstone700/Makefile b/board/armltd/corstone700/=
Makefile
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
++obj-y :=3D corstone700.o
+diff --git a/board/armltd/corstone700/corstone700.c b/board/armltd/corston=
e700/corstone700.c
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
++static const struct pl01x_serial_platdata serial_platdata =3D {
++      .base =3D V2M_UART0,
++      .type =3D TYPE_PL011,
++      .clock =3D CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DEVICE(corstone700_serials) =3D {
++      .name =3D "serial_pl01x",
++      .platdata =3D &serial_platdata,
++};
++
++int board_init(void)
++{
++      return 0;
++}
++
++int dram_init(void)
++{
++      gd->ram_size =3D PHYS_SDRAM_1_SIZE;
++
++      return 0;
++}
++
++int dram_init_banksize(void)
++{
++      gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
++      gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
++
++      return 0;
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
++CONFIG_ARM=3Dy
++CONFIG_ARM64_SUPPORT_AARCH32=3Dy
++CONFIG_TARGET_CORSTONE700=3Dy
++CONFIG_SYS_TEXT_BASE=3D0x02100000
++CONFIG_SYS_MALLOC_F_LEN=3D0x2000
++CONFIG_NR_DRAM_BANKS=3D1
++CONFIG_IDENT_STRING=3D" corstone700 aarch32"
++CONFIG_BOOTDELAY=3D3
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=3Dy
++CONFIG_SYS_PROMPT=3D"corstone700# "
++# CONFIG_CMD_CONSOLE is not set
++CONFIG_CMD_BOOTZ=3Dy
++CONFIG_CMD_BOOTM=3Dy
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++# CONFIG_CMD_ENV_EXISTS is not set
++# CONFIG_CMD_ARMFLASH=3Dy
++# CONFIG_CMD_LOADS is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=3Dy
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_MII=3Dy
++CONFIG_CMD_PING=3Dy
++CONFIG_CMD_CACHE=3Dy
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_FAT=3Dy
++CONFIG_DM=3Dy
++# CONFIG_MMC is not set
++# CONFIG_MTD_NOR_FLASH=3Dy
++CONFIG_DM_ETH=3Dy
++CONFIG_DM_SERIAL=3Dy
++CONFIG_OF_LIBFDT=3Dy
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
++#define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x=
03f00000)
++#define CONFIG_SKIP_LOWLEVEL_INIT
++
++#define CONFIG_SYS_HZ_CLOCK   320000000
++#define CONFIG_SYS_HZ         1000
++
++#define V2M_SRAM0             0x02000000
++#define V2M_QSPI              0x08000000
++
++#define V2M_DEBUG             0x10000000
++#define V2M_BASE_PERIPH               0x1A000000
++
++#define V2M_BASE              0x80000000
++
++#define V2M_PERIPH_OFFSET(x)  (x << 16)
++
++#define V2M_SYSID             (V2M_BASE_PERIPH)
++#define V2M_SYSCTL            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++
++#define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSE=
T(32))
++#define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
++
++#define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
++#define V2M_TIMER_BASE0               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSE=
T(35))
++
++#define V2M_UART0             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
++#define V2M_UART1             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
++
++#define CONFIG_SYS_MMIO_TIMER
++
++#define CONFIG_PL011_CLOCK    32000000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1          (V2M_BASE)
++#define PHYS_SDRAM_2          (V2M_QSPI)
++
++/* Top 16MB reserved for secure world use (maybe not needed) */
++#define DRAM_SEC_SIZE         0x01000000
++#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
++
++#define PHYS_SDRAM_2_SIZE     0x02000000
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN (CONFIG_ENV_SIZE + (8 << 20))
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_LOAD_ADDR  (V2M_BASE + 0x10000000)
++
++#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size =
*/
++#define CONFIG_SYS_MAXARGS            64      /* max command args */
++
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++                              "kernel_name=3DzImage\0"          \
++                              "kernel_addr_r=3D0x80000000\0"    \
++                              "fdt_name=3Ddevtree.dtb\0"        \
++                              "fdt_addr_r=3D0x82000000\0"               \
++                              "fdt_high=3D0xffffffff\0"
++
++#define CONFIG_BOOTCOMMAND    "echo Booting Kernel...;" \
++                              "bootz $kernel_addr_r - $fdt_addr_r"
++
++#endif
+diff --git a/include/configs/designstart_ca5.h b/include/configs/designsta=
rt_ca5.h
+index 6db5b1cf4a..9837ba0cd0 100644
+--- a/include/configs/designstart_ca5.h
++++ b/include/configs/designstart_ca5.h
+@@ -42,7 +42,7 @@
+ #define V2M_PERIPH_OFFSET(x)  (x << 16)
+
+ #define V2M_SYSID             (V2M_BASE_PERIPH)
+-#define V2M_SYCTL             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
++#define V2M_SYSCTL            (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
+ #define V2M_COUNTER_CTL               (V2M_BASE_PERIPH + V2M_PERIPH_OFFSE=
T(2))
+ #define V2M_COUNTER_READ      (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
+ #define V2M_TIMER_CTL         (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-ad=
d-bootx-command-to-start-XiP-images.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/files/corstone700/0004-boot-add-bootx-command-to-start-XiP-images.patch
new file mode 100644
index 0000000..bc27f66
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0004-boot-add-bootx=
-command-to-start-XiP-images.patch
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
+       help
+         Boot the Linux zImage
+
++config CMD_BOOTX
++      bool "Support booting XiP Kernel Image"
++      default y
++      help
++        The bootx command is used to boot an XIP kernel.
++
+ config CMD_BOOTI
+       bool "booti"
+       depends on ARM64 || RISCV
+@@ -294,7 +300,7 @@ config CMD_BOOTI
+
+ config BOOTM_LINUX
+       bool "Support booting Linux OS images"
+-      depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI
++      depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI || CMD_BOOTX
+       default y
+       help
+         Support booting the Linux kernel directly via a command such as b=
ootm
+diff --git a/cmd/Makefile b/cmd/Makefile
+index f1dd513a4b..ce75b6112c 100644
+--- a/cmd/Makefile
++++ b/cmd/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_CMD_BOOTCOUNT) +=3D bootcount.o
+ obj-$(CONFIG_CMD_BOOTEFI) +=3D bootefi.o
+ obj-$(CONFIG_CMD_BOOTMENU) +=3D bootmenu.o
+ obj-$(CONFIG_CMD_BOOTSTAGE) +=3D bootstage.o
++obj-$(CONFIG_CMD_BOOTX) +=3D bootx.o
+ obj-$(CONFIG_CMD_BOOTZ) +=3D bootz.o
+ obj-$(CONFIG_CMD_BOOTI) +=3D booti.o
+ obj-$(CONFIG_CMD_BTRFS) +=3D btrfs.o
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
++ * SPDX-License-Identifier:   GPL-2.0+
++ */
++
++ #include <common.h>
++
++/* XIP Kernel boot */
++int do_bootx(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
++{
++      ulong machid =3D 0xFFFFFFFF;      /* Device Tree Boot */
++      void (*kernel_entry)(int zero, int arch, uint params);
++      ulong r2;
++      ulong img_addr;
++      char *endp;
++
++      /* need at least two arguments */
++      if (argc < 2)
++              goto usage;
++
++      img_addr =3D simple_strtoul(argv[1], &endp, 16);
++      kernel_entry =3D (void (*)(int, int, uint))img_addr;
++
++#ifdef CONFIG_USB_DEVICE
++      udc_disconnect();
++#endif
++      cleanup_before_linux();
++
++      r2 =3D simple_strtoul(argv[2], NULL, 16);
++
++      /* The kernel expects the following when booting:
++       *  r0 - 0
++       *  r1 - machine type
++       *  r2 - boot data (atags/dt) pointer
++       *
++       * For more info, refer to:
++       *  https://www.kernel.org/doc/Documentation/arm/Booting
++       */
++
++      printf("Booting Linux...\n");
++
++      kernel_entry(0, machid, r2);
++
++      return 0;
++
++usage:
++      return CMD_RET_USAGE;
++}
++static char bootx_help_text[] =3D
++      "x_addr dt_addr\n    - boot XIP kernel in Flash\n"
++      "\t x_addr: Address of XIP kernel in Flash\n"
++      "\tdt_addr: Address of Device Tree blob image";
++U_BOOT_CMD(
++      bootx,  CONFIG_SYS_MAXARGS,     1,      do_bootx,
++      "boot XIP kernel in Flash", bootx_help_text
++)
+diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconfig
+index ee29a1eabf..655af3f058 100644
+--- a/configs/corstone700_defconfig
++++ b/configs/corstone700_defconfig
+@@ -14,6 +14,7 @@ CONFIG_HUSH_PARSER=3Dy
+ CONFIG_SYS_PROMPT=3D"corstone700# "
+ # CONFIG_CMD_CONSOLE is not set
+ CONFIG_CMD_BOOTZ=3Dy
++CONFIG_CMD_BOOTX=3Dy
+ CONFIG_CMD_BOOTM=3Dy
+ # CONFIG_CMD_XIMG is not set
+ # CONFIG_CMD_EDITENV is not set
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-st=
arting-the-XIP-kernel-using-bootx-command.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/files/corstone700/0005-boot-starting-the-XIP-kernel-using-bootx-comm=
and.patch
new file mode 100644
index 0000000..6b735ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0005-boot-starting-=
the-XIP-kernel-using-bootx-command.patch
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
+ #define CONFIG_EXTRA_ENV_SETTINGS     \
+                               "kernel_name=3DzImage\0"          \
+-                              "kernel_addr_r=3D0x80000000\0"    \
++                              "kernel_addr_r=3D0x08300000\0"    \
+                               "fdt_name=3Ddevtree.dtb\0"        \
+-                              "fdt_addr_r=3D0x82000000\0"               \
++                              "fdt_addr_r=3D0x80400000\0"       \
+                               "fdt_high=3D0xffffffff\0"
+
+-#define CONFIG_BOOTCOMMAND    "echo Booting Kernel...;" \
+-                              "bootz $kernel_addr_r - $fdt_addr_r"
++#define CONFIG_BOOTCOMMAND    "bootx $kernel_addr_r $fdt_addr_r"
+
+ #endif
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-ena=
bling-the-arch_timer-driver.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/c=
orstone700/0006-arm-enabling-the-arch_timer-driver.patch
new file mode 100644
index 0000000..719fa28
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/corstone700/0006-arm-enabling-t=
he-arch_timer-driver.patch
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
+@@ -36,3 +36,6 @@ CONFIG_DM=3Dy
+ CONFIG_DM_ETH=3Dy
+ CONFIG_DM_SERIAL=3Dy
+ CONFIG_OF_LIBFDT=3Dy
++# CONFIG_SYS_HZ_CLOCK is not set
++# CONFIG_SYS_MMIO_TIMER is not set
++CONFIG_SYS_ARCH_TIMER=3Dy
+diff --git a/include/configs/corstone700.h b/include/configs/corstone700.h
+index cb9ca8af8e..0fb606f1ed 100644
+--- a/include/configs/corstone700.h
++++ b/include/configs/corstone700.h
+@@ -14,7 +14,6 @@
+ #define CONFIG_SYS_INIT_SP_ADDR               (CONFIG_SYS_SDRAM_BASE + 0x=
03f00000)
+ #define CONFIG_SKIP_LOWLEVEL_INIT
+
+-#define CONFIG_SYS_HZ_CLOCK   320000000
+ #define CONFIG_SYS_HZ         1000
+
+ #define V2M_SRAM0             0x02000000
+@@ -39,8 +38,6 @@
+ #define V2M_UART0             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
+ #define V2M_UART1             (V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
+
+-#define CONFIG_SYS_MMIO_TIMER
+-
+ #define CONFIG_PL011_CLOCK    32000000
+
+ /* Physical Memory Map */
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-b=
sp/recipes-bsp/u-boot/u-boot_%.bbappend
index 5ab505b..f2d23b5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -35,3 +35,15 @@ SRC_URI_append_juno =3D " file://u-boot_vexpress_uenv.pa=
tch"
 # Total Compute KMACHINE
 #
 SRC_URI_append_tc0 =3D " file://0001-Add-support-for-Total-Compute.patch"
+
+#
+# Corstone700 KMACHINE
+#
+FILESEXTRAPATHS_prepend_corstone700 :=3D "${THISDIR}/files/corstone700:"
+
+SRC_URI_append_corstone700 =3D " file://0001-armv7-add-mmio-timer.patch \
+                               file://0002-board-arm-add-designstart-corte=
x-a5-board.patch \
+                               file://0003-arm-Add-corstone700-platform.pa=
tch \
+                               file://0004-boot-add-bootx-command-to-start=
-XiP-images.patch \
+                               file://0005-boot-starting-the-XIP-kernel-us=
ing-bootx-command.patch \
+                               file://0006-arm-enabling-the-arch_timer-dri=
ver.patch"
diff --git a/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm/recip=
es-bsp/u-boot/u-boot_2020.04.bb
new file mode 100644
index 0000000..5fee543
--- /dev/null
+++ b/meta-arm/recipes-bsp/u-boot/u-boot_2020.04.bb
@@ -0,0 +1,26 @@
+HOMEPAGE =3D "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION =3D "U-Boot, a boot loader for Embedded boards based on PowerP=
C, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
+SECTION =3D "bootloaders"
+DEPENDS +=3D "flex-native bison-native"
+
+LICENSE =3D "GPLv2+"
+LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D30503fd321432fc713238f5=
82193b78e"
+PE =3D "1"
+
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV =3D "36fec02b1f90b92cf51ec531564f9284eae27ab4"
+
+SRC_URI =3D "git://git.denx.de/u-boot.git \
+          "
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+do_configure[cleandirs] =3D "${B}"
+
+require recipes-bsp/u-boot/u-boot.inc
+
+DEPENDS +=3D "bc-native dtc-native"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
