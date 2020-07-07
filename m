Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web10.17261.1594131544966818959
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 07:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E2FZKAEh;
 spf=pass (domain: arm.com, ip: 40.107.7.52, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcnrJEpKwda/pw4UcFWd4GWQJHh5LpHR2zXhdr1bTlQ=;
 b=E2FZKAEhLsL1GQ+VOzb0Y3GzI14dUeZ7wDl6zWNxVIKnpzCYGXTWt0NrsI3VcFijI1lp9w41LLNpNPbDOvmsxJ4A2q3S6AqmeCSlmeLpAyEXJbxqUPm8FUvk+RQj5ealWPgPO+DmjZ4MEN8upflRnx3/R30E89Cvz1Ou7l/GtiM=
Received: from DB6PR07CA0183.eurprd07.prod.outlook.com (2603:10a6:6:42::13) by
 VI1PR08MB2926.eurprd08.prod.outlook.com (2603:10a6:802:1f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Tue, 7 Jul 2020 14:19:02 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::d1) by DB6PR07CA0183.outlook.office365.com
 (2603:10a6:6:42::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.9 via Frontend
 Transport; Tue, 7 Jul 2020 14:19:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Tue, 7 Jul 2020 14:19:02 +0000
Received: ("Tessian outbound f7489b7e84a7:v62"); Tue, 07 Jul 2020 14:19:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 818effb3fc85caf7
X-CR-MTA-TID: 64aa7808
Received: from aae344ed265f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B64DF277-EB7B-41D0-BD7D-AA59C605F92D.1;
	Tue, 07 Jul 2020 14:18:56 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aae344ed265f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Jul 2020 14:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jr04a44eYVdnTLUAfkU+TIBRJ5YoKjGhiE/8wTOuzCrVKbSO1PE/FYBhWo9IVqyg6+Sm/lYLQvdXLjViMXtntm+xm9JRGKgh+GPbKkHCxYiiWqwB8DoZdX54ABdfgva/1UUFOTwyCWxI4+dXTRi2U3ip0ugCkBmY7SjlqwzfwAdTHOu41hE2iVVItKERkMqduibSdjHJ5CQTpU2n0uYcPc713DkpTekO4KxTybeiYxBIPlkxvI/0ECbxS8hr36fnKXeHkOAzdmLYzEDO2OJZw10z/QjBpB79MQlKG1xKH74AC4Ah+aF22znwIo8GY5evnQ1v/S2Whe7ggHn7F69/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcnrJEpKwda/pw4UcFWd4GWQJHh5LpHR2zXhdr1bTlQ=;
 b=En6QAoVe8cgPmMjMH8cE7VNDjd9Q6Eyo5kVD6XDlavbylKpy8hs/a8/zRCgnvSi4KAJ7p3s+9dt6QNFYwfq/NuYAAYfFePFYd21VHWAmBx7LxZRUtBE6v/ojuqXsFCaELLM06GbvGQjC/sHYmguz4hQr+9rQ/XXsSJ0ZFf8sLAd0aN09XQd23HYy+Oc8u7ZLfGX3T6WK8ynfSXzPRWwOoYvip0lcZD8Jd7oKwUo27XUGAN/EhW0/v/7mzI1HvZUnL7NhCVCXBViO/EjecgHM16O65RlKa5ubzdAKtx15zY1jCDrRTI/yodfB9Vb+OcrAx6DPIWTvRmDMeEawPXGWpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JcnrJEpKwda/pw4UcFWd4GWQJHh5LpHR2zXhdr1bTlQ=;
 b=E2FZKAEhLsL1GQ+VOzb0Y3GzI14dUeZ7wDl6zWNxVIKnpzCYGXTWt0NrsI3VcFijI1lp9w41LLNpNPbDOvmsxJ4A2q3S6AqmeCSlmeLpAyEXJbxqUPm8FUvk+RQj5ealWPgPO+DmjZ4MEN8upflRnx3/R30E89Cvz1Ou7l/GtiM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB4220.eurprd08.prod.outlook.com (2603:10a6:10:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Tue, 7 Jul
 2020 14:18:54 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58%6]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 14:18:54 +0000
From: usama.arif@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp/u-boot: Updated platform port for TC0
Date: Tue,  7 Jul 2020 15:18:48 +0100
Message-Id: <20200707141848.36308-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.54) by LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Tue, 7 Jul 2020 14:18:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64df4ec0-8907-476b-f057-08d82280b293
X-MS-TrafficTypeDiagnostic: DB7PR08MB4220:|VI1PR08MB2926:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2926AE06CA3C60322C66A39C92660@VI1PR08MB2926.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:551;OLM:9508;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MvW5RYBstJyAoPs3wrLD2r0Fwg3mTk/w3YeZ3IS7wccglUrw0T8kV90vdH2e6XxkQH+pLu+q+CEHdU9mgXtmixihUIo7uBGYN0RuJKvkpOCxUYLVHUMJBfZGz74zuCyrPJM1u3/icJLEsybWt6FJNTLq/f1is8XNU4wTxWUXpSOooAyqIZe7yE1o18sQaR0BULBhf4wHUwutw9Jl7gZVxvUaCXfHYKRLAk6huqcyTkDedMZ112j0r4btTQgCyaeupAscYPWdvauDPsGxWNzrOCgPNK2K+iV7Kvm4PeEvJHNCOARy7U0c4jkrlBz/l0H07dhHZih16nvtGbRdbZeVyQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(956004)(2616005)(30864003)(83380400001)(1076003)(8936002)(4326008)(478600001)(316002)(5660300002)(36756003)(2906002)(6916009)(6486002)(16526019)(52116002)(7696005)(8676002)(19627235002)(6666004)(66556008)(86362001)(44832011)(186003)(15650500001)(66946007)(26005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 7U/++f1dFmy177Rz76CaS+qrpQU8WnhQtjfN4hc9btf1oGf4BokD1Qu/2TlNJGS8YQeuFasRgUXxvs9qPsEh+wlSYgLlGIchew9IhItNxEdout6L9GIBQrBqR2HSkGQ1G/fMpZZohX3nK+QY+LYwbdXM0RwYmh354IGMtMt8WchEzCMPrajNEkBTUMA0XLUoR/fwWmi9BnuSbDeUxJikSlBtT2Q49BtPOYMkpv4mtyM38+GJG4JIYI6AAZUfdZ+O8+1kjqIOt0wXZm7z3YYKFylquu3FKtO+Sw7d2xy9qB/3Urn2fPEu0/02wn5N1YaYK3tXBs6zqasybC6i8xTJemVaQswobLcmb6AMuE2egytNLPKImPdYxxl8/Dj1T2S9goK+4lgK4OWS7j7fFfVMOp87spT+5u+GW20L3M9WyOmXlhY0jC8DVtJFCB2ZJxnOoIIgLPYCE/UxVn0Sn6w3Tsu4sfdPjfVrUrQLy3R1bTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4220
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966005)(6666004)(44832011)(1076003)(4326008)(19627235002)(26005)(8936002)(8676002)(30864003)(83380400001)(956004)(2616005)(478600001)(7696005)(86362001)(6916009)(70206006)(70586007)(82310400002)(5660300002)(316002)(336012)(36756003)(356005)(186003)(81166007)(15650500001)(16526019)(47076004)(82740400003)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f608dbb6-6523-4110-e3ac-08d82280adae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q0Rmufht9bijiNd/2ICBKdqXC0VwnCH/RYAsJW5BIz7DX7oTINDJmk65ipl+tiYH9MyxcAL/is/uXEDogOJD6YTo6A14TAEAks+2plUyV2QR7AE0DkkL/LIqwn3FQUqoNiopNIdwrZk+umG4Dq36iJX3Jlxrh/10zt8IFwdeZLkF6dso/i0Y+GpoN5Yu0ZxSvSbI2UwB9rTIbX9RCGoo02OClZ3NwnUEM3cisvPbvUZHuUkByqUb+w551QAZsA6kr3xy2G6iTmAqJRLjnhRKCdeasG4/USGFVavptp5EN6ztNL0kDY2bz2/WJgPNqNsTY4RNJUurmddI9gqcREtfTIZWIbiglDbPpUjucLFDgYosDMK6IAaKs6rH6JewnSQSQEwpVH2eocMo9yVZ3bQ7rA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 14:19:02.0053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64df4ec0-8907-476b-f057-08d82280b293
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2926
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This makes the platform port independent of vexpress board
so it applies cleanly on both u-boot 2019.07 (zeus) and
2020.01 (dunfell). The SRCREV that existed in u-boot-tc0.inc
for v2020.07-rc3 has been removed and the default SRCREV is
now used.

Change-Id: Ieb65cb666a1812eeeb2e3e306aec06b5e538cf06
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 .../0001-Add-support-for-Total-Compute.patch  | 307 ++++++++++++++++++
 .../tc0/tc0-config-and-android-boot.patch     | 160 ---------
 .../recipes-bsp/u-boot/u-boot-tc0.inc         |   5 +-
 3 files changed, 308 insertions(+), 164 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-supp=
ort-for-Total-Compute.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-an=
d-android-boot.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for=
-Total-Compute.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-s=
upport-for-Total-Compute.patch
new file mode 100644
index 0000000..692a11f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/0001-Add-support-for-Total-=
Compute.patch
@@ -0,0 +1,307 @@
+From 854c5d7b8a010d47da38735f15a31d0b7d10ae3c Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Fri, 3 Jul 2020 10:26:56 +0100
+Subject: [PATCH] Add support for Total Compute
+
+This includes basic platform patch support and boots
+kernel and ramdisk that have been sideloaded in DRAM.
+
+Change-Id: I2e35a1d983efd1d27572f671cad5a9fe4ad68ee6
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+Upstream-Status: Pending
+---
+ arch/arm/Kconfig                         |  9 +++
+ board/armltd/totalcompute/Kconfig        | 12 ++++
+ board/armltd/totalcompute/MAINTAINERS    |  6 ++
+ board/armltd/totalcompute/Makefile       |  6 ++
+ board/armltd/totalcompute/totalcompute.c | 74 +++++++++++++++++++++++
+ configs/total_compute_defconfig          | 39 ++++++++++++
+ include/configs/total_compute.h          | 77 ++++++++++++++++++++++++
+ 7 files changed, 223 insertions(+)
+ create mode 100644 board/armltd/totalcompute/Kconfig
+ create mode 100644 board/armltd/totalcompute/MAINTAINERS
+ create mode 100644 board/armltd/totalcompute/Makefile
+ create mode 100644 board/armltd/totalcompute/totalcompute.c
+ create mode 100644 configs/total_compute_defconfig
+ create mode 100644 include/configs/total_compute.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 36c9c2fecd0..b423b7655b6 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -635,6 +635,14 @@ config TARGET_VEXPRESS_CA15_TC2
+       select CPU_V7_HAS_VIRT
+       select PL011_SERIAL
+
++config TARGET_TOTAL_COMPUTE
++      bool "Support Total Compute Platform"
++      select ARM64
++      select PL01X_SERIAL
++      select DM
++      select DM_SERIAL
++      select DM_ETH
++
+ config ARCH_BCMSTB
+       bool "Broadcom BCM7XXX family"
+       select CPU_V7A
+@@ -1774,6 +1782,7 @@ source "arch/arm/cpu/armv8/Kconfig"
+
+ source "arch/arm/mach-imx/Kconfig"
+
++source "board/armltd/totalcompute/Kconfig"
+ source "board/bosch/shc/Kconfig"
+ source "board/bosch/guardian/Kconfig"
+ source "board/CarMediaLab/flea3/Kconfig"
+diff --git a/board/armltd/totalcompute/Kconfig b/board/armltd/totalcompute=
/Kconfig
+new file mode 100644
+index 00000000000..8bd8c30a6b5
+--- /dev/null
++++ b/board/armltd/totalcompute/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_TOTAL_COMPUTE
++
++config SYS_BOARD
++      default "totalcompute"
++
++config SYS_VENDOR
++      default "armltd"
++
++config SYS_CONFIG_NAME
++      default "total_compute"
++
++endif
+diff --git a/board/armltd/totalcompute/MAINTAINERS b/board/armltd/totalcom=
pute/MAINTAINERS
+new file mode 100644
+index 00000000000..bb09a90a309
+--- /dev/null
++++ b/board/armltd/totalcompute/MAINTAINERS
+@@ -0,0 +1,6 @@
++TOTAL_COMPUTE BOARD
++M:    Usama Arif <usama.arif@arm.com>
++S:    Maintained
++F:    board/armltd/totalcompute/
++F:    include/configs/total_compute.h
++F:    configs/total_compute_defconfig
+diff --git a/board/armltd/totalcompute/Makefile b/board/armltd/totalcomput=
e/Makefile
+new file mode 100644
+index 00000000000..4c40afef723
+--- /dev/null
++++ b/board/armltd/totalcompute/Makefile
+@@ -0,0 +1,6 @@
++# SPDX-License-Identifier: GPL-2.0+
++#
++# (C) Copyright 2020 ARM Limited
++# Usama Arif <usama.arif@arm.com>
++
++obj-y :=3D totalcompute.o
+diff --git a/board/armltd/totalcompute/totalcompute.c b/board/armltd/total=
compute/totalcompute.c
+new file mode 100644
+index 00000000000..21247e4ef0f
+--- /dev/null
++++ b/board/armltd/totalcompute/totalcompute.c
+@@ -0,0 +1,74 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2020 ARM Limited
++ * Usama Arif <usama.arif@arm.com>
++ */
++#include <common.h>
++#include <dm.h>
++#include <init.h>
++#include <malloc.h>
++#include <errno.h>
++#include <netdev.h>
++#include <asm/io.h>
++#include <linux/compiler.h>
++#include <dm/platform_data/serial_pl01x.h>
++#include <asm/armv8/mmu.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++static const struct pl01x_serial_platdata serial_platdata =3D {
++      .base =3D UART0_BASE,
++      .type =3D TYPE_PL011,
++      .clock =3D CONFIG_PL011_CLOCK,
++};
++
++U_BOOT_DEVICE(total_compute_serials) =3D {
++      .name =3D "serial_pl01x",
++      .platdata =3D &serial_platdata,
++};
++
++static struct mm_region total_compute_mem_map[] =3D {
++      {
++              .virt =3D 0x0UL,
++              .phys =3D 0x0UL,
++              .size =3D 0x80000000UL,
++              .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++                       PTE_BLOCK_NON_SHARE |
++                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
++      }, {
++              .virt =3D 0x80000000UL,
++              .phys =3D 0x80000000UL,
++              .size =3D 0xff80000000UL,
++              .attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
++                       PTE_BLOCK_INNER_SHARE
++      }, {
++              /* List terminator */
++              0,
++      }
++};
++
++struct mm_region *mem_map =3D total_compute_mem_map;
++
++int board_init(void)
++{
++      return 0;
++}
++
++int dram_init(void)
++{
++      gd->ram_size =3D PHYS_SDRAM_1_SIZE;
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
+diff --git a/configs/total_compute_defconfig b/configs/total_compute_defco=
nfig
+new file mode 100644
+index 00000000000..31d97dddc21
+--- /dev/null
++++ b/configs/total_compute_defconfig
+@@ -0,0 +1,39 @@
++CONFIG_ARM=3Dy
++CONFIG_TARGET_TOTAL_COMPUTE=3Dy
++CONFIG_SYS_TEXT_BASE=3D0xe0000000
++CONFIG_SYS_MALLOC_F_LEN=3D0x2000
++CONFIG_ENV_SIZE=3D0x10000
++CONFIG_NR_DRAM_BANKS=3D2
++CONFIG_DISTRO_DEFAULTS=3Dy
++CONFIG_BOOTDELAY=3D1
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 debug user_debug=3D31 earlycon=3Dpl0=
11,0x7ff80000 loglevel=3D9 androidboot.hardware=3Dtotal_compute video=3D640=
x480-32@60 root=3D/dev/vda2 ip=3Ddhcp androidboot.selinux=3Dpermissive"
++# CONFIG_USE_BOOTCOMMAND is not set
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_SYS_PROMPT=3D"TOTAL_COMPUTE# "
++# CONFIG_CMD_CONSOLE is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EDITENV is not set
++CONFIG_CMD_MEMTEST=3Dy
++CONFIG_SYS_MEMTEST_START=3D0x80000000
++CONFIG_SYS_MEMTEST_END=3D0xff000000
++CONFIG_CMD_ARMFLASH=3Dy
++# CONFIG_CMD_LOADS is not set
++# CONFIG_CMD_ITEST is not set
++# CONFIG_CMD_SETEXPR is not set
++# CONFIG_CMD_NFS is not set
++CONFIG_CMD_CACHE=3Dy
++# CONFIG_CMD_MISC is not set
++CONFIG_CMD_UBI=3Dy
++# CONFIG_ISO_PARTITION is not set
++# CONFIG_EFI_PARTITION is not set
++# CONFIG_MMC is not set
++CONFIG_MTD=3Dy
++CONFIG_MTD_DEVICE=3Dy
++CONFIG_MTD_NOR_FLASH=3Dy
++CONFIG_FLASH_CFI_DRIVER=3Dy
++CONFIG_SYS_FLASH_USE_BUFFER_WRITE=3Dy
++CONFIG_SYS_FLASH_PROTECTION=3Dy
++CONFIG_SYS_FLASH_CFI=3Dy
++CONFIG_OF_LIBFDT=3Dy
+diff --git a/include/configs/total_compute.h b/include/configs/total_compu=
te.h
+new file mode 100644
+index 00000000000..54086205db6
+--- /dev/null
++++ b/include/configs/total_compute.h
+@@ -0,0 +1,77 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Configuration for Total Compute. Parts were derived from other ARM
++ * configurations.
++ * (C) Copyright 2020 ARM Limited
++ * Usama Arif <usama.arif@arm.com>
++ */
++
++#ifndef __TOTAL_COMPUTE_H
++#define __TOTAL_COMPUTE_H
++
++#define CONFIG_REMAKE_ELF
++
++/* Link Definitions */
++#define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff0)
++#define CONFIG_ENV_SIZE       0x10000
++
++
++#define CONFIG_SYS_BOOTM_LEN (64 << 20)
++
++#define UART0_BASE                    0x7ff80000
++
++/* Generic Timer Definitions */
++#define COUNTER_FREQUENCY             (0x1800000)     /* 24MHz */
++
++/* Generic Interrupt Controller Definitions */
++
++#define GICD_BASE                     (0x2C010000)
++#define GICC_BASE                     (0x2C02f000)
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN         (CONFIG_ENV_SIZE + (8 << 20))
++
++/* PL011 Serial Configuration */
++#define CONFIG_PL011_CLOCK            7372800
++
++/* BOOTP options */
++#define CONFIG_BOOTP_BOOTFILESIZE
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_LOAD_ADDR          0x90000000
++
++/* Physical Memory Map */
++#define PHYS_SDRAM_1                  0x80000000
++/* Top 32MB reserved for secure world use */
++#define DRAM_SEC_SIZE         0x02000000
++#define PHYS_SDRAM_1_SIZE     0x80000000 - DRAM_SEC_SIZE
++#define CONFIG_SYS_SDRAM_BASE PHYS_SDRAM_1
++
++/* Enable memtest */
++#define CONFIG_SYS_MEMTEST_START      PHYS_SDRAM_1
++#define CONFIG_SYS_MEMTEST_END                (PHYS_SDRAM_1 + PHYS_SDRAM_=
1_SIZE)
++
++#define CONFIG_EXTRA_ENV_SETTINGS     \
++                              "kernel_addr_r=3D0x80080000\0"    \
++                              "initrd_addr_r=3D0x88000000\0"    \
++                              "fdt_addr_r=3D0x83000000\0"       \
++                              "fdt_high=3D0xffffffffffffffff\0" \
++                              "initrd_high=3D0xffffffffffffffff\0"
++
++#define CONFIG_BOOTCOMMAND    "booti ${kernel_addr_r} ${initrd_addr_r} ${=
fdt_addr_r}"
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size =
*/
++#define CONFIG_SYS_MAXARGS            64      /* max command args */
++
++#define CONFIG_SYS_FLASH_BASE         0x0C000000
++/* 256 x 256KiB sectors */
++#define CONFIG_SYS_MAX_FLASH_SECT     256
++
++#define CONFIG_SYS_FLASH_CFI_WIDTH    FLASH_CFI_32BIT
++#define CONFIG_SYS_MAX_FLASH_BANKS    1
++
++#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks */
++#define FLASH_MAX_SECTOR_SIZE         0x00040000
++
++#endif /* __TOTAL_COMPUTE_H */
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-andro=
id-boot.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-an=
droid-boot.patch
deleted file mode 100644
index a66898e..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/files/tc0/tc0-config-and-android-boot=
.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 0867e715d3563b0bc0ee7e04f9ec6b615de626b2 Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Thu, 04 Jun 2020 14:16:02 +0100
-Subject: [PATCH] Introduce Total Compute platform
-
-This is based off vexpress64 platform. It includes support for
-NOR flash and has bootargs setup for android boot.
-
-Change-Id: I965c81001a1c4a1a6788106f0ba2ca577dee4096
-Signed-off-by: Usama Arif <usama.arif@arm.com>
-Upstream-Status: Pending
-Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
----
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 21df1c4..c208a40 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1174,6 +1174,14 @@
-       select USB
-       select DM_USB
-
-+config TARGET_TOTAL_COMPUTE
-+      bool "Support Total Compute Platform"
-+      select ARM64
-+      select PL01X_SERIAL
-+      select DM
-+      select DM_SERIAL
-+      select DM_ETH
-+
- config TARGET_LS2080A_EMU
-       bool "Support ls2080a_emu"
-       select ARCH_LS2080A
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/Kco=
nfig
-index 1d13f54..d59769f 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -1,4 +1,4 @@
--if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
-+if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_TOTAL_C=
OMPUTE
-
- config SYS_BOARD
-       default "vexpress64"
-diff --git a/configs/total_compute_defconfig b/configs/total_compute_defco=
nfig
-new file mode 100644
-index 0000000..1faeb36
---- /dev/null
-+++ b/configs/total_compute_defconfig
-@@ -0,0 +1,40 @@
-+CONFIG_ARM=3Dy
-+CONFIG_TARGET_TOTAL_COMPUTE=3Dy
-+CONFIG_SYS_TEXT_BASE=3D0xe0000000
-+CONFIG_SYS_MALLOC_F_LEN=3D0x2000
-+CONFIG_ENV_SIZE=3D0x10000
-+CONFIG_NR_DRAM_BANKS=3D2
-+CONFIG_DISTRO_DEFAULTS=3Dy
-+CONFIG_BOOTDELAY=3D1
-+CONFIG_USE_BOOTARGS=3Dy
-+CONFIG_BOOTARGS=3D"console=3DttyAMA0 debug user_debug=3D31 earlycon=3Dpl0=
11,0x7ff80000 loglevel=3D9 androidboot.hardware=3Dtotal_compute video=3D640=
x480-32@60 root=3D/dev/vda2 ip=3Ddhcp androidboot.selinux=3Dpermissive"
-+# CONFIG_USE_BOOTCOMMAND is not set
-+# CONFIG_DISPLAY_CPUINFO is not set
-+# CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_SYS_PROMPT=3D"TOTAL_COMPUTE# "
-+# CONFIG_CMD_CONSOLE is not set
-+# CONFIG_CMD_XIMG is not set
-+# CONFIG_CMD_EDITENV is not set
-+CONFIG_CMD_MEMTEST=3Dy
-+CONFIG_SYS_MEMTEST_START=3D0x80000000
-+CONFIG_SYS_MEMTEST_END=3D0xff000000
-+CONFIG_CMD_ARMFLASH=3Dy
-+# CONFIG_CMD_LOADS is not set
-+# CONFIG_CMD_ITEST is not set
-+# CONFIG_CMD_SETEXPR is not set
-+# CONFIG_CMD_NFS is not set
-+CONFIG_CMD_CACHE=3Dy
-+# CONFIG_CMD_MISC is not set
-+CONFIG_CMD_UBI=3Dy
-+# CONFIG_ISO_PARTITION is not set
-+# CONFIG_EFI_PARTITION is not set
-+# CONFIG_MMC is not set
-+CONFIG_MTD=3Dy
-+CONFIG_MTD_NOR_FLASH=3Dy
-+CONFIG_FLASH_CFI_DRIVER=3Dy
-+CONFIG_SYS_FLASH_USE_BUFFER_WRITE=3Dy
-+CONFIG_SYS_FLASH_PROTECTION=3Dy
-+CONFIG_SYS_FLASH_CFI=3Dy
-+CONFIG_SMC911X=3Dy
-+CONFIG_SMC911X_32_BIT=3Dy
-+CONFIG_OF_LIBFDT=3Dy
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_=
aemv8a.h
-index 09cdd3d..e39699e 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8a.h
-@@ -13,7 +13,7 @@
- #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
- /* ATF loads u-boot here for BASE_FVP model */
- #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f000=
00)
--#elif CONFIG_TARGET_VEXPRESS64_JUNO
-+#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOT=
AL_COMPUTE)
- #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff0)
- #endif
-
-@@ -40,7 +40,7 @@
- #define V2M_KMI0                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(6))
- #define V2M_KMI1                      (V2M_PA_CS3 + V2M_PERIPH_OFFSET(7))
-
--#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
-+#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOTAL=
_COMPUTE)
- #define V2M_UART0                     0x7ff80000
- #define V2M_UART1                     0x7ff70000
- #else /* Not Juno */
-@@ -79,7 +79,7 @@
- #ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
- #define GICD_BASE                     (0x2f000000)
- #define GICC_BASE                     (0x2c000000)
--#elif CONFIG_TARGET_VEXPRESS64_JUNO
-+#elif defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOT=
AL_COMPUTE)
- #define GICD_BASE                     (0x2C010000)
- #define GICC_BASE                     (0x2C02f000)
- #endif
-@@ -88,14 +88,19 @@
- /* Size of malloc() pool */
- #define CONFIG_SYS_MALLOC_LEN         (CONFIG_ENV_SIZE + (8 << 20))
-
-+#ifdef CONFIG_TARGET_TOTAL_COMPUTE
-+#define CONFIG_SMC911X_BASE           0x18000000
-+#else
-+
- #ifndef CONFIG_TARGET_VEXPRESS64_JUNO
- /* The Vexpress64 simulators use SMSC91C111 */
- #define CONFIG_SMC91111                       1
- #define CONFIG_SMC91111_BASE          (0x01A000000)
- #endif
-
-+#endif
- /* PL011 Serial Configuration */
--#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
-+#if defined(CONFIG_TARGET_VEXPRESS64_JUNO) || defined(CONFIG_TARGET_TOTAL=
_COMPUTE)
- #define CONFIG_PL011_CLOCK            7372800
- #else
- #define CONFIG_PL011_CLOCK            24000000
-@@ -189,8 +194,17 @@
-                               "fi"
-
-
--#endif
-+#elif CONFIG_TARGET_TOTAL_COMPUTE
-+#define CONFIG_EXTRA_ENV_SETTINGS     \
-+                              "kernel_addr_r=3D0x80080000\0"    \
-+                              "initrd_addr_r=3D0x88000000\0"    \
-+                              "fdt_addr_r=3D0x83000000\0"       \
-+                              "fdt_high=3D0xffffffffffffffff\0" \
-+                              "initrd_high=3D0xffffffffffffffff\0"
-
-+#define CONFIG_BOOTCOMMAND    "booti ${kernel_addr_r} ${initrd_addr_r} ${=
fdt_addr_r}"
-+
-+#endif
- /* Monitor Command Prompt */
- #define CONFIG_SYS_CBSIZE             512     /* Console I/O Buffer Size =
*/
- #define CONFIG_SYS_MAXARGS            64      /* max command args */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc b/meta-arm-bsp/=
recipes-bsp/u-boot/u-boot-tc0.inc
index 6c2ed5f..6594b3f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
@@ -1,6 +1,3 @@
 # TC0 specific Das U-Boot configuration and patch

-SRC_URI_append =3D ' file://tc0-config-and-android-boot.patch'
-
-# v2020.07-rc3 tag commit
-SRCREV =3D "8c48bb21bd6a1778d1f299de30ff62c07929702b"
+SRC_URI_append =3D ' file://0001-Add-support-for-Total-Compute.patch'
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
