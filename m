Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.53])
 by mx.groups.io with SMTP id smtpd.web10.292.1601313960437821877
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 10:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ENNcCsC8;
 spf=pass (domain: arm.com, ip: 40.107.2.53, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blsFZCmB3+kM4HzCL31v0CgOMQnsZEjrbxjBbhTmTs0=;
 b=ENNcCsC8qiNsgPXfNhvxCI09Uchgj22/9qXTJZdaZBpvB7kfuQ2e7w4/dpgv7/4aUdrmeCVkbgaOTmA+eaScGQxoTeswWsst0FmPgXYDTmDT1kBUI2nzIMVT2ZPtKVgi3VwvZVPTbsf9V2jAVbw37tA7MS2XSt1C6+nBmwqdap4=
Received: from AM6PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:20b:b2::30)
 by AM4PR08MB2852.eurprd08.prod.outlook.com (2603:10a6:205:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Mon, 28 Sep
 2020 17:25:57 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::5c) by AM6PR08CA0018.outlook.office365.com
 (2603:10a6:20b:b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Mon, 28 Sep 2020 17:25:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 17:25:56 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Mon, 28 Sep 2020 17:25:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ff702e17871b0db
X-CR-MTA-TID: 64aa7808
Received: from 30ca43a1fa27.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 572B6B28-4CBF-480F-BE12-5967745275FF.1;
	Mon, 28 Sep 2020 17:25:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30ca43a1fa27.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 28 Sep 2020 17:25:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIKZJER1tbkibckeCXDrftasOqy6tKEXlPV4WwFJ015Trs9x27kE8QlD7kY3qprOiwIlCwNu3tAq6O79VNTAxyjwy4JXzvBIMmkneW1amHsnBPnEDLiau+eEXZ3ZF3fTty/+3p+aQkmITbAjXi1nsLBt0qmnrorGhgrbC1EQu44ryym/iS0iHP81mXBLqCxhdqVgbzJMheD13N6MbI541b/ZeYIRDHkToYLZw0I37R4lilDUhdWXCasy/lBuD1Zed8lPI7OHcUfilk907TgR2I5AxzkppKe7qPgdrCSc4ob4IDcL0Tw8quPYtxvhDa+RSiLIlXDBIn/NqCRFxshWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blsFZCmB3+kM4HzCL31v0CgOMQnsZEjrbxjBbhTmTs0=;
 b=ei59t2cwABGC9RoWzEDlA8+nZMWq8/3CYOUttH8C3A1EoXYAYBPFlmZgc1URdTc1ynGgOy1GkzW7/mb+V5O8aqbx/pEADsrV7k05apcnPD3fud4nS6WEaWpRDtV2J3DfCpkiLNmJn+t7uxxVd3OB2dqFHvu16Y5QAawFlT9F+pIG7sR+QBic/58v7JBd8KcGOFUzJ+1B6dYGnGS1rc2HZ4nXsidKktKw3tWVjr/TOTVJXjOWxZe5Faa3FJ5kf3VRmpjn4JI102NwlZW1xcizfUISLSaqsrsbaa18vGk/vsbStiq0rZQIHKMxSils3GJUYD1z0bRZqkeD5RfOcHs37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blsFZCmB3+kM4HzCL31v0CgOMQnsZEjrbxjBbhTmTs0=;
 b=ENNcCsC8qiNsgPXfNhvxCI09Uchgj22/9qXTJZdaZBpvB7kfuQ2e7w4/dpgv7/4aUdrmeCVkbgaOTmA+eaScGQxoTeswWsst0FmPgXYDTmDT1kBUI2nzIMVT2ZPtKVgi3VwvZVPTbsf9V2jAVbw37tA7MS2XSt1C6+nBmwqdap4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3436.eurprd08.prod.outlook.com (2603:10a6:10:44::15)
 by DB7PR08MB3498.eurprd08.prod.outlook.com (2603:10a6:10:4c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Mon, 28 Sep
 2020 17:25:49 +0000
Received: from DB7PR08MB3436.eurprd08.prod.outlook.com
 ([fe80::b170:fde5:ab0b:2307]) by DB7PR08MB3436.eurprd08.prod.outlook.com
 ([fe80::b170:fde5:ab0b:2307%5]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 17:25:49 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2 1/1] arm-bsp/recipes-kernel: Update fvp-base-arm32 BSP definition
Date: Mon, 28 Sep 2020 18:25:35 +0100
Message-Id: <20200928172535.18807-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:5:80::34) To DB7PR08MB3436.eurprd08.prod.outlook.com
 (2603:10a6:10:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e110568.arm.com (217.140.99.251) by DM6PR08CA0021.namprd08.prod.outlook.com (2603:10b6:5:80::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Mon, 28 Sep 2020 17:25:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2471f560-0eec-4b43-7601-08d863d38f94
X-MS-TrafficTypeDiagnostic: DB7PR08MB3498:|AM4PR08MB2852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB285293C758F6F0C48702E32389350@AM4PR08MB2852.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IHsIVVNFO7hxP5A1FK+WxcBeoGUQYhqmTyrBVJmbME9M2CfUUt8Q8MUz+cK9YNeykv44ketSBA0T4Qjbp6h5yJDU/J8gdkxzp5RrDQy9lB+nR/pRb5vExBjp2/rg4aDcuyTu2PpT6y38QCFVuWVNpfdnX9F2Dys/sGZZfuYAH28lSjp2Ko2F5rgZUrrfr24Ef9f7051jng36PGJ68vzP22mNy8fDoX768Ut7BpuUEOL8STApGaxkPMeEZn2RjVeaMryHW9b8xCRFeBMPTzGZ+bPzooSHz8HH+K+RMl9qsZ5YhSCWQNfaWe3ozj2pWFk8HHc/vMMbpN0j8+IThoAQl0dsjaTgQqr3GFafMGvWoHkaQ5P4opUW+ErFq4qZxGHZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3436.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(346002)(376002)(1076003)(4326008)(2906002)(6666004)(66476007)(66556008)(66946007)(86362001)(478600001)(83380400001)(186003)(16526019)(44832011)(26005)(956004)(8676002)(2616005)(6486002)(8936002)(6916009)(7696005)(15650500001)(316002)(5660300002)(36756003)(52116002)(19627235002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 OlHoYhwL2dFMtQeuRgP+6pqh87Gxt3o3io6WgvU3+WxeYKOtFyZ0mX4z7toxn+RVaB6wtVcYIGbPWSfpHsF2I/c7aHAy+yJTycaIuylai4njXY4DgBjrjRjBJb0BL55G4zbWl1uDQmGJX3aaju9aC8bCpsmgWOMD9Rsd2Oxd3ByUULvJDZagBUF/TtkUKLeOwKK2iyqzLEF7HYuqKQ13QrLOCdejM34zBz7ggMwvGIxtmOFN0Py8lSlRkihXDnfE9L7gu+tgz7kRcoJUia++GgwDcrNr1ONesSRo/iLdW9U0wg2buKrUONuPuJzG2tmB2RwWDqCwcKZoJyHCBMxXMQ6BReSmX95u7t+JiqtJqqJqvu//rhkaDyRLeX41jxSK8ILNl8D6GAIGZDt03gGgVp2xjAX7o6yFdDyzfzCTNWKUbA699T8yhi5B68XLp0inYExv+NN/Bm7Aer2+QYhO4hW1yOxAKdcqQYVl5UtB5Ea+Rf8Z14w7aHIH3B/+FENpdok3NftBIIwebuLcXr6ITbShzoXuCjvwfwMYTrKggN87GnAxltPGY1ubCA+IKK3x6le+yVBVR1uXTV3/LMAmIOf55hWi/ju/NOMMG14NeUr/y8LpzMSANI09EpoLg0PBch2lrrGsxWo+eOzzHpU/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3498
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7efc559e-5843-4e45-5cf3-08d863d38ae3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p+8I82WsY6hTpqXCKlMoPTCCaSHxm+7qJqNNts9ii2oUiDIRJ5P1qJlwn3b7t7KhdolGzDrjP2a3bGl8JrTSXbYyJ+AM0T+t5OyOZUAbkCA0ouqbgiT3XMzPekSzhl2bIXzvTeVP+lwr5a3fUJ03V4HM/fep82sXY5SOrktv0t11BeDSv7rjFPZRRvyhA85R6AvlGrTH7geX9pjQxFN9N1c4ayv62Fz6aTTJbXKdAMOLgRsgNJPiJoUXqjKRImtITGFe4ucWbT+ivIxGPzs8SLqiWzBPU+3fzglxD5C463kYBJM3bZafEZf9uqDurgDiWhr09Sg65hUuBU/SEnMbwG4T07mjiNBjLCOtqn/MDwhbHpdOOpB4NgahR+KJuMM/XplswSpFlMhaxwYpgrpgmJtz5E2DQMxH3TMnpkKzYN/a/oWMYDM8BymKfdeYcUR/
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(376002)(396003)(46966005)(44832011)(4326008)(2906002)(86362001)(8936002)(6916009)(15650500001)(5660300002)(8676002)(6486002)(316002)(186003)(16526019)(70586007)(70206006)(26005)(36906005)(6666004)(336012)(2616005)(956004)(19627235002)(478600001)(1076003)(7696005)(36756003)(81166007)(47076004)(82740400003)(82310400003)(356005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 17:25:56.9546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2471f560-0eec-4b43-7601-08d863d38f94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2852
Content-Type: text/plain

Update to use the yocto-kernel-cache 'standard' configuration
and edit 'fvp-features.cfg' to remove duplicate configs.

Change-Id: I49617bdac554571aa1242080797cb60327e527da
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../bsp/arm-platforms/fvp-arm32-standard.scc  |  3 ++-
 .../bsp/arm-platforms/fvp-arm32.scc           |  2 --
 .../arm-platforms/fvp-arm32/fvp-features.cfg  | 25 +++----------------
 .../0001-ARM-vexpress-enable-GICv3.patch      |  0
 .../fvp-base-arm32-dts.patch                  |  0
 .../linux/linux-arm-platforms.inc             |  3 ++-
 6 files changed, 8 insertions(+), 25 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32 => files/fvp-base-arm32}/0001-ARM-vexpress-enable-GICv3.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/files/{ => fvp-base-arm32}/fvp-base-arm32-dts.patch (100%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
index a92d945..6569027 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
@@ -1,7 +1,8 @@
 define KMACHINE fvp-arm32
 define KTYPE standard
 define KARCH arm
-define KMETA_EXTERNAL_BSP t
+
+include ktypes/standard/standard.scc
 
 include fvp-arm32.scc
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
index f95b036..85659aa 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
@@ -1,8 +1,6 @@
 include features/input/input.scc
 include cfg/timer/no_hz.scc
 
-patch fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
-
 kconf hardware fvp-arm32/fvp-board.cfg
 kconf hardware fvp-arm32/fvp-features.cfg
 kconf hardware fvp/fvp-net.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
index 42cd476..12e7697 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
@@ -1,26 +1,9 @@
-CONFIG_MODULES=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXT4_FS=y
-CONFIG_BINFMT_SCRIPT=y
 CONFIG_BINFMT_MISC=y
-CONFIG_PRINTK_TIME=y
+CONFIG_BOUNCE=y
 CONFIG_HIGHMEM=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_TMPFS_XATTR=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DEBUG_FS=y
-CONFIG_GENERIC_SCHED_CLOCK=y
-CONFIG_CLKDEV_LOOKUP=y
-CONFIG_NET=y
-CONFIG_NETDEVICES=y
-CONFIG_UNIX=y
-CONFIG_ETHERNET=y
+CONFIG_HIGHPTE=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_NEON=y
 CONFIG_VFP=y
 CONFIG_VFPv3=y
-CONFIG_NEON=y
-CONFIG_KERNEL_MODE_NEON=y
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 79ef26e..b76d68b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -41,7 +41,8 @@ SRC_URI_append_fvp-base = " file://fvp-base-dts.patch"
 #
 COMPATIBLE_MACHINE_fvp-base-arm32 = "fvp-base-arm32"
 KMACHINE_fvp-base-arm32 = "fvp-arm32"
-SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch"
+SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
+                                  file://0001-ARM-vexpress-enable-GICv3.patch"
 
 #
 # Juno KMACHINE
-- 
2.17.1

