Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.83])
 by mx.groups.io with SMTP id smtpd.web12.1268.1596220556754334022
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 11:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ojV9L3r1;
 spf=pass (domain: arm.com, ip: 40.107.5.83, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwasX6SkI7AJBeX688IYd4fG+bxFRj5AjTETWfVAnas=;
 b=ojV9L3r16AxO+x6r2XYrsRGUfdW69KRiF/8dL0e+uCGq/ZJfKw1omALaEJjPdRwu6UdVBb5jOCnwvCPnM0TqLmyGdKy02qSlXAkCFer6n6zfSRBiTI2O4s6wNUm+guFERKU3EhwbtJHvpMwhSpknvEBVV9yP47SCVlLt80SYnvE=
Received: from MRXP264CA0033.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::21)
 by VE1PR08MB5839.eurprd08.prod.outlook.com (2603:10a6:800:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.26; Fri, 31 Jul
 2020 18:35:53 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::29) by MRXP264CA0033.outlook.office365.com
 (2603:10a6:500:14::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 18:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 18:35:52 +0000
Received: ("Tessian outbound 8f45de5545d6:v62"); Fri, 31 Jul 2020 18:35:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 42833691fcb3a86e
X-CR-MTA-TID: 64aa7808
Received: from 6c32dfea305c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F8E8956C-C8D6-494F-B2DE-3693147F0128.1;
	Fri, 31 Jul 2020 18:35:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c32dfea305c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Jul 2020 18:35:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3o5VgtgBXApCiY0B2CxtxDYTHbccmAf7ceooHpJGBskmDLjBM4MNvShXF/FND9x55RUfysBpHZyJXrmBdSrnqyMf4HUmggpiRyS0aTPZMvpPzwSjC3JS2RUQFmtO1nfps2WKWLE3QlBTShB+QZNW/Leqbz1WrjAXJOJQb/UwbtIIpUjt3fTPQYt9pCaTTPxF6FwVhan05lb64qjrtzszTXJSijDjxMUzr38G/uunvkAx4sTc5sb5RFnyeepFfgkda/aGWZyDz2UZ9UWYtNMUnJZvCrHTqBmyth2r2ebaIcm8SXshK2MUCnMda1Gk6sheV/PGyZB+ICLGmk2+5qeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwasX6SkI7AJBeX688IYd4fG+bxFRj5AjTETWfVAnas=;
 b=UlK0/Nrf4i7N2h7CwIVsuJvM6wV+HEMMwqTSJ2hCWj2dMiroXm77RKI9UjGf7POkF39U2AEEIixzc9FijwUxQ9roIC7BHP7slLIopoCbd6AeJFZOlXieklnI/FmF31/aaJiGPs+8Go1+BXjZqsG6A+dABYX2CG7Qb2QauI/eqkFJBTx2gDHhC1TZVE5ypQTM1y7WQqxBksnMZpuszdrFxrMsRS/rPF5YehzjEbTMzobJP5vGiJwiGwnF9gJ/snPEy0WG1LMTyfkDjA6hQ81lLnx03QcbZ7nbadvcvgyu6tisMdDdCc3lc4zlTeiV4Fu87BPSWYR3csjblBMJ+Eiozg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwasX6SkI7AJBeX688IYd4fG+bxFRj5AjTETWfVAnas=;
 b=ojV9L3r16AxO+x6r2XYrsRGUfdW69KRiF/8dL0e+uCGq/ZJfKw1omALaEJjPdRwu6UdVBb5jOCnwvCPnM0TqLmyGdKy02qSlXAkCFer6n6zfSRBiTI2O4s6wNUm+guFERKU3EhwbtJHvpMwhSpknvEBVV9yP47SCVlLt80SYnvE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
 by VE1PR08MB4816.eurprd08.prod.outlook.com (2603:10a6:802:a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 31 Jul
 2020 18:35:45 +0000
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e]) by VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e%6]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 18:35:45 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 1/3] arm-bsp/u-boot: Add support for 32-bit FVP BASE machine
Date: Fri, 31 Jul 2020 19:35:36 +0100
Message-Id: <20200731183538.40948-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::23) To VI1PR08MB4334.eurprd08.prod.outlook.com
 (2603:10a6:803:f1::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.53) by LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 18:35:45 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a41c153-aedf-400d-8ade-08d835808e25
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|VE1PR08MB5839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB58397703B8856A26718D8411894E0@VE1PR08MB5839.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V2wSKKJ26pkAInLs/JoEGfTWAXFr1wNC8befRMc3h2lMiJ+74hU6WPzF2BzWpEkMaLsiOVSyDDaDp/GS3a8Zh5hhuP0DiLAHZRXPxL/P9/2e1QqInC3fdhRKeWNUFBjgJtDJy7frp+5bjKx8zGienMr1AbSDrI2iMU30ckjdlGQToxT/udgUEVOe7th1YiwLns4iVQ5deQ1CVO0gSeZf0sINeqUa9T/vC1yAz0/xhTcJmnGD6KZhhZzdtd4Jpt+cFotz5z30yHCrv7SubsdqVSN4bft3FT2T06poh8luKHFgvtDcBJoUtZcqH3AEqjh7ZuGpprM1kI32QmufkgOz5S7Wtket1/9oEb0OEleiG7ExgjM6khAORbz7ek9onzvrn29CRdd3jJpJSLTxcBw4uQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4334.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(66556008)(86362001)(66946007)(2616005)(4326008)(6666004)(956004)(66476007)(5660300002)(44832011)(1076003)(8676002)(8936002)(316002)(36756003)(6916009)(83380400001)(186003)(16526019)(52116002)(7696005)(6486002)(478600001)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 N0mCrH3C894MGBS69HbMkb+2TJUV83FH4lclHNXrGxOlUM2XkU3rNcJBZ+Jm2RPXN1CoZ45psr8ssF4NJoRV6J8/10EHPqe1GZNuNrIdLkH20QZskRXoC9fImkkB9xcCjQ+mG5nFlp7+6aAxsNjnuPoPmX4uq3iRka6ekaPv2yZaowndDhx8pQ9A+EULi+NhqokOiamJyP+ppNd0kwdNjaOUBMsDP8M7ZWnJ95+J+gAh/wwdrqGuIuLFsCrOMMcD+PT9x5/r+PkmJ/Y8UHdtLT4I6wygxkS62DSIljdpXOO28JQ6v0B0H74VbR/kMKnElKjv1g2DbPIL0tZ+6Kt3Ng4kZPSbjWkPZ9v5GlKLOKSiY0lITV4WSTQ3zDHgxqgm1IEnkFJwFqTUYPiMeqOJyoasYCMqKpzlwGL3n+ymrPfeVhrQKPCsgGUTJQ+3QYZ8TYpYkf87ULPNr/z4A97yEOz5HqnXpo/SNyRcgBwI1mA9Uls3n/srBjWnmwYPhjlf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	23c8649d-ad29-4bb3-6677-08d835808979
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M1+Dd03iv0EvYP10kNORcv7mrsNGOOd4Knf2okoU44a19BFEmiHib9y1qWq11OSVL1stDYV7fI15dBr3w2wm6jTetCeLH3FcVDSEaJWsVqSWeiGV9dskAVTTyN5/Cwq405DDIz+Y/5l9dqHihs0FGcNVIpOnDN52Tudo5IwfV/k8UnQMANvLOlub06YNnpyvaFtAYlhPzBe9S2+2bBjTcV/8T2sf/nC4NUOvraCV27kKANHhC0Mq0s8Pmtla0zY3hKZzLiX2yVzzeHXYZpMmqHjtFgYAkfrAMGp2afwzTMI0cxU8g5j+UQLQ6darHKcvnlViLfpg4PYqd4SHpd1H5A9XTDlDTMo26J4HB4pZjT9uyIJE1B+fc7PcZ4L2HnXntWLXMzXg5Qe1Eec5ESgaftsotyJDf6e7i2sizquo0N/5D+YfN5EnELq/DejQ8qKNkG4/o3v9JQihVoAmH83xtcjy+h/DnFHjHVVFR71nHQ0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(82310400002)(82740400003)(478600001)(81166007)(26005)(336012)(5660300002)(316002)(2906002)(7696005)(44832011)(956004)(2616005)(47076004)(86362001)(186003)(16526019)(6916009)(36906005)(356005)(6486002)(4326008)(70206006)(70586007)(8936002)(6666004)(36756003)(83380400001)(8676002)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 18:35:52.8426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a41c153-aedf-400d-8ade-08d835808e25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5839
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Change-Id: I48ec5607c216b1c15d2fedc1375f3f0a914c9937
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 181 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   5 +
 2 files changed, 186 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/00=
01-Add-vexpress_aemv8a_aarch32-variant.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-=
vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/fil=
es/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
new file mode 100644
index 0000000..712f7f0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-base-arm32/0001-Add-vexpres=
s_aemv8a_aarch32-variant.patch
@@ -0,0 +1,181 @@
+From d627bdf9b11964b694aaf464c5c88ad9b339f03f Mon Sep 17 00:00:00 2001
+From: Anders Dellien <anders.dellien@arm.com>
+Date: Thu, 23 Jul 2020 17:32:55 +0100
+Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
+
+The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
+support is enable per-CPU when launching the model, eg:
+
+-C cluster0.cpu0.CONFIG64=3D0
+
+This patch adds a new defconfig and some variant specific selections in
+vexpress_armv8a.h.
+
+This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
+
+Upstream-status: Denied
+
+For upstream discussion, please visit
+https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
+
+Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
+Signed-off-by: Asha R <asha.r@arm.com>
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+---
+ arch/arm/Kconfig                          |  5 +++
+ board/armltd/vexpress64/Kconfig           |  2 +-
+ configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
+ include/configs/vexpress_aemv8a.h         | 28 +++++++++++-----
+ 4 files changed, 65 insertions(+), 10 deletions(-)
+ create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 36c9c2fecd..99972cdf65 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1088,6 +1088,11 @@ config TARGET_VEXPRESS64_BASE_FVP
+       select PL01X_SERIAL
+       select SEMIHOSTING
+
++config TARGET_VEXPRESS64_BASE_FVP_AARCH32
++        bool "Support Versatile Express ARMv8a 32-bit FVP BASE model"
++        select CPU_V7A
++        select SEMIHOSTING
++
+ config TARGET_VEXPRESS64_JUNO
+       bool "Support Versatile Express Juno Development Platform"
+       select ARM64
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kco=
nfig
+index 9014418433..75545e9ea1 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -1,4 +1,4 @@
+-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_VEXPRES=
S64_BASE_FVP_AARCH32
+
+ config SYS_BOARD
+       default "vexpress64"
+diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_=
aemv8a_aarch32_defconfig
+new file mode 100644
+index 0000000000..cf1e8d5cae
+--- /dev/null
++++ b/configs/vexpress_aemv8a_aarch32_defconfig
+@@ -0,0 +1,40 @@
++CONFIG_ARM=3Dy
++CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=3Dy
++CONFIG_SYS_MALLOC_F_LEN=3D0x2000
++CONFIG_IDENT_STRING=3D" vexpress_aemv8a fvp aarch32"
++CONFIG_BOOTDELAY=3D1
++CONFIG_SYS_TEXT_BASE=3D0x88000000
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 debug us=
er_debug=3D31 systemd.log_target=3Dnull root=3D/dev/vda2 rw androidboot.har=
dware=3Dfvpbase rootwait loglevel=3D9"
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_HUSH_PARSER=3Dy
++CONFIG_SYS_PROMPT=3D"fvp32# "
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
++CONFIG_FLASH_CFI_DRIVER=3Dy
++CONFIG_SYS_FLASH_CFI=3Dy
++CONFIG_SYS_ARCH_TIMER=3Dy
++CONFIG_DM_SERIAL=3Dy
++CONFIG_PL01X_SERIAL=3Dy
+diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_=
aemv8a.h
+index 9a9cec414c..cf0e4a951c 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -7,7 +7,8 @@
+ #ifndef __VEXPRESS_AEMV8A_H
+ #define __VEXPRESS_AEMV8A_H
+
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #ifndef CONFIG_SEMIHOSTING
+ #error CONFIG_TARGET_VEXPRESS64_BASE_FVP requires CONFIG_SEMIHOSTING
+ #endif
+@@ -15,8 +16,17 @@
+
+ #define CONFIG_REMAKE_ELF
+
++#ifdef CONFIG_ARM64
++#define HIGH_ADDR                       "0xffffffffffffffff"
++#define BOOT_TYPE                       "booti"
++#else
++#define HIGH_ADDR                       "0xffffffff"
++#define BOOT_TYPE                       "bootz"
++#endif
++
+ /* Link Definitions */
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ /* ATF loads u-boot here for BASE_FVP model */
+ #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f000=
00)
+ #elif CONFIG_TARGET_VEXPRESS64_JUNO
+@@ -82,7 +92,8 @@
+ #define GICR_BASE                     (0x2f100000)
+ #else
+
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #define GICD_BASE                     (0x2f000000)
+ #define GICC_BASE                     (0x2c000000)
+ #elif CONFIG_TARGET_VEXPRESS64_JUNO
+@@ -169,7 +180,8 @@
+                               "booti ${kernel_addr} ${initrd_param} ${fdt=
_addr}"
+
+
+-#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
++        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
+ #define CONFIG_EXTRA_ENV_SETTINGS     \
+                               "kernel_name=3DImage\0"           \
+                               "kernel_addr=3D0x80080000\0"      \
+@@ -177,8 +189,8 @@
+                               "initrd_addr=3D0x88000000\0"      \
+                               "fdtfile=3Ddevtree.dtb\0"         \
+                               "fdt_addr=3D0x83000000\0"         \
+-                              "fdt_high=3D0xffffffffffffffff\0" \
+-                              "initrd_high=3D0xffffffffffffffff\0"
++                              "fdt_high=3D" HIGH_ADDR "\0"      \
++                              "initrd_high=3D" HIGH_ADDR "\0"
+
+ #define CONFIG_BOOTCOMMAND    "smhload ${kernel_name} ${kernel_addr}; " \
+                               "smhload ${fdtfile} ${fdt_addr}; " \
+@@ -186,9 +198,7 @@
+                               "initrd_end; " \
+                               "fdt addr ${fdt_addr}; fdt resize; " \
+                               "fdt chosen ${initrd_addr} ${initrd_end}; "=
 \
+-                              "booti $kernel_addr - $fdt_addr"
+-
+-
++                              BOOT_TYPE " $kernel_addr - $fdt_addr"
+ #endif
+
+ /* Monitor Command Prompt */
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-b=
sp/recipes-bsp/u-boot/u-boot_%.bbappend
index 966f040..5ab505b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -21,6 +21,11 @@ SRC_URI_append_foundation-armv8 =3D " file://u-boot_vexp=
ress_fvp.patch"
 #
 SRC_URI_append_fvp-base =3D " file://u-boot_vexpress_fvp.patch"

+#
+# FVP BASE ARM32 KMACHINE
+#
+SRC_URI_append_fvp-base-arm32 =3D " file://0001-Add-vexpress_aemv8a_aarch3=
2-variant.patch"
+
 #
 # Juno KMACHINE
 #
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
