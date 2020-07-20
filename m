Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web11.3872.1595275375737709667
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 13:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=R8SqPXFd;
 spf=pass (domain: arm.com, ip: 40.107.7.57, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtVkO0pXwWs3WL3xr/3Bko0YHtGkViMJ1smC/chgdUs=;
 b=R8SqPXFdZ3CckzGpP4mJ2HmpeXIDqdopNsHySEt0w8S5cq7pHO21VUencxFndFP/KR1Gh7FdUqM1zEWrP0YJl6oCqzZufUC8oGW/cTNi9i3NW96BvkIMCL5WCmax/FXoGGxsF9ylEVvoodfh1qmWg55ndnDXfOT6SzR6Isq5+5w=
Received: from AM6P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::14)
 by DB7PR08MB3434.eurprd08.prod.outlook.com (2603:10a6:10:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Mon, 20 Jul
 2020 20:02:52 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::34) by AM6P193CA0037.outlook.office365.com
 (2603:10a6:209:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Mon, 20 Jul 2020 20:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 20:02:52 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62"); Mon, 20 Jul 2020 20:02:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c668df9b281ae3c
X-CR-MTA-TID: 64aa7808
Received: from 083f45293751.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FE11B507-68AA-469E-836A-0DEE159D56CB.1;
	Mon, 20 Jul 2020 20:02:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 083f45293751.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Jul 2020 20:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdOlXDr6CFKg7tkAifK9jDEmr2lpQ86+DYiP0FKCfHH3VmWrW9iVRa5LahOduZE4WYFWTRm2R/caymVM23AbfVDOm5+NqEFNWh4Ue9U/nr31YBLpqMMFP18AJ5CGA3Yak/SlgqAx1jrZJJcaicm97NcNMjlzF6N934oT+GJ/ZXpHoou5gg3t4QiwCZjQrmZJVs7x2wFbUpHVvEhXvuwE7IuRCJPQF/3arbF8qHimVs7ty6VvwmvgNpDZViQhmQyVsQQs2gsSIR2z/8jyGvWRtIvfJQToizh5PoIQDEK55IstyFed+pntMMTtB83eKGicVULpyklP5FrtD8IZ+oG2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtVkO0pXwWs3WL3xr/3Bko0YHtGkViMJ1smC/chgdUs=;
 b=QYXivRYDiJpEfbAP/mHNKXDuopMtaYZE0PxmEGNTLOzwQL1zAyCxKydYgD2afrfhSq2sJEjz5F3pMHeNPd5A/FSFQJ6cVxwhnO/0Y9YCdr8XRFwmdEsDk8TcpyZ8fEOiIlc6MRwOL2K8hW+8yb0mi8jSDKq8bPyeEVinC4AxPa1rBUgQDPStpNtxAm7S0vneeznok9I5rRw4LS8Na9ebqfGeLq7BFVxbggsIRRbnyQPZ+ER1l8iriVlh1/LTan9cXJVugX/BWm5WWF70/4KJWRa1sKcOs6B2xla//FrtqUYBizfvzm3DpmqE9ou7Gu1zzHUk/p8xOTs5pB21BQ5URA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtVkO0pXwWs3WL3xr/3Bko0YHtGkViMJ1smC/chgdUs=;
 b=R8SqPXFdZ3CckzGpP4mJ2HmpeXIDqdopNsHySEt0w8S5cq7pHO21VUencxFndFP/KR1Gh7FdUqM1zEWrP0YJl6oCqzZufUC8oGW/cTNi9i3NW96BvkIMCL5WCmax/FXoGGxsF9ylEVvoodfh1qmWg55ndnDXfOT6SzR6Isq5+5w=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM4PR08MB2834.eurprd08.prod.outlook.com (2603:10a6:205:5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Mon, 20 Jul
 2020 20:02:44 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 20:02:43 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH] arm-bsp: u-boot error fixing and file clean-up
Date: Mon, 20 Jul 2020 14:17:35 -0400
Message-Id: <20200720181735.21132-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0096.namprd05.prod.outlook.com
 (2603:10b6:803:22::34) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by SN4PR0501CA0096.namprd05.prod.outlook.com (2603:10b6:803:22::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.17 via Frontend Transport; Mon, 20 Jul 2020 20:02:41 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 20 Jul 2020 14:17:35 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74492644-4431-4871-b3e3-08d82ce7e292
X-MS-TrafficTypeDiagnostic: AM4PR08MB2834:|DB7PR08MB3434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3434AD4E40F7BE510D8861C0F07B0@DB7PR08MB3434.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:163;OLM:163;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KUUwBH4eDcAnR+i39LkvzGWrXRu7KgBFPEVZxlSRKp0U3MD0zIHgE2Ijn/RFnpSXksUPHmhQ8Xnva+pkGKOVeiVp2DgaXqs6eyz3pbbr95oQdkGANqwv1Say2dIdCD8UBGjQ+YVmRZvoMPtg6kth5S6cCiN1Qiz8u6ymsZSlQ11VCK9f9cQ/Rg7bwW9anIZtoKu8Uz5VNA400YzoY/fKxX3NPXXFjIQ+VgDp5dtvG2lA+SNaqH4a7yZ51/hXz1A8z+f56TfcVs6WlVZljSKJVIyyVfV/DNzmOh4F3MvZa1Z48FlVlkSzQmxuoqtxLe2u
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(426003)(52116002)(5660300002)(186003)(8936002)(478600001)(8676002)(1076003)(36756003)(26005)(4326008)(316002)(86362001)(42186006)(6916009)(44832011)(2906002)(66556008)(66476007)(66946007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 fPTwAN8Ies+6gOxfEn2w9uQEi1Sxqj+hFcmhUtjo0TwdffxJmasKb/HlB+voYfNzAVyODYGuDx6lHnFvxlktGJsgPRB0gty4GcT5cYqDa+aQBLw5PxCvzfrYedvZUaHEl5VTwfRg3k5iWoSmVn2/c7eRKBmJn3D5L56swM428UeAABd/8d8EKzH1BsvVvwiENnID6rV8JUUeA5rHG6tHncOeu3XhQFICebPe7QsQDUMdSjKu4UkO72O60420ghRTCvasZOnCBlTaw5B7X3KoxKzSuDdc/UztfYopWt+oaa634J7x1EJTb6nGLzpGqJaU5C7o2n9ev4aqsIxYJXVxmmpjJxH9KIUhULx277Y80kEaEDmn/CQUXnurYMA7VgmFMqaxItccisWTUR95pukUZIpKbnp+WF0V2JK3NOotrUV8QLBBsMbEJ6N+EZXDT+gMfpLfaGDQpGAGYZnHXDu9b5wNIkLFstssLwo21v3dNsZBe1+/BgsFMARUvzLqZDC0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2834
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966005)(36756003)(316002)(6916009)(82740400003)(186003)(36906005)(42186006)(2906002)(86362001)(426003)(8936002)(26005)(336012)(8676002)(83380400001)(356005)(1076003)(70586007)(44832011)(47076004)(70206006)(5660300002)(81166007)(82310400002)(478600001)(2616005)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	42e4b2c6-3492-4653-ff0b-08d82ce7dccb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QNKUasSbyBRhuOJShRPuAp74weKkvk4Xjk8sbpo+Iqd3kMZnM6WaSe67GPO29qux70XWqpipST9NRH/WZiAK9L7Z/D+lq7d6kA+BgGFLCM0OvOYkGrMxQsTvdimG9mPhrBIC2gdtFX6BERMgPwET+g4wvS4767YnGVLOjU35V2qW0KaWRJLR5mW5tROEfZSYzIWIelKJ7WC8uHsY4x8KSEgy4XS1QJRKyrok2dX/IzL4Uk8UuuB1kDVNmqC+ufl3iBIsKnd9q3CtLBuUhY231HNruK604ToJcPrOJSVgc5GljuF7d6WEUHdTODsVlLsI9zODj3gKSlp3RubG9MKnEeb9LJWnUe9jcgVrcrgqU2Fd5nFXsYo70B64DkrbKD791AlS6NUvhQc2LgKj3VYdrA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 20:02:52.2188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74492644-4431-4871-b3e3-08d82ce7e292
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3434
Content-Type: text/plain

This commit fixes the errors while rebasing u-boot src to v2020.07.
Additional work necessary to preserve dunfell functionality.
Consolidate all of the files into a single inc file and single bbappend
file.

Change-Id: I442c843b1fafeb41ea283d2f11393522a48fc9d2
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../juno/u-boot_vexpress_uenv.patch           |  0
 .../juno/u-boot_vexpress_uenv.patch           | 37 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot-tc0.inc         |  3 --
 .../recipes-bsp/u-boot/u-boot_%.bbappend      | 30 ++++++++++++---
 .../recipes-bsp/u-boot/u-boot_2020.%.bbappend | 13 -------
 5 files changed, 62 insertions(+), 21 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/{files => u-boot-2020.01}/juno/u-boot_vexpress_uenv.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/juno/u-boot_vexpress_uenv.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/files/juno/u-boot_vexpress_uenv.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.01/juno/u-boot_vexpress_uenv.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
new file mode 100644
index 0000000..c68c173
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
@@ -0,0 +1,37 @@
+diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
+index 09cdd3dab5..7d6d231bd9 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8a.h
+@@ -136,6 +136,32 @@
+ 				"fdtfile=board.dtb\0" \
+ 				"fdt_alt_name=juno\0" \
+ 				"fdt_addr_r=0x80000000\0" \
++                               "bootenvfile=uEnv.txt\0" \
++                               "bootcmd=run envboot\0" \
++                               "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
++                                "importbootenv=echo Importing environment from memory, size ${filesize}; env import -t ${loadaddr} ${filesize}\0" \
++                                "loadaddr=0x82000000\0" \
++                                "filesize=0x4000\0" \
++                                "loadbootenv=mw.l ${loadaddr} 0 0x1000; afs load ${bootenvfile} ${loadaddr}\0" \
++                                "default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr_r} ; " \
++                                                "if test $? -eq 1; then "\
++                                                "  echo Loading ${kernel_alt_name} instead of "\
++                                                "${kernel_name}; "\
++                                                "  afs load ${kernel_alt_name} ${kernel_addr_r};"\
++                                                "fi ; "\
++		                                "afs load  ${fdtfile} ${fdt_addr_r} ; " \
++                                                "if test $? -eq 1; then "\
++                                                "  echo Loading ${fdt_alt_name} instead of "\
++                                                "${fdtfile}; "\
++		                                "  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
++		                                "fi ; "\
++                                                "fdt addr ${fdt_addr_r}; fdt resize; " \
++		                                "if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
++		                                "then "\
++		                                "  setenv ramdisk_param ${ramdisk_addr_r}; "\
++		                                "  else setenv ramdisk_param -; "\
++		                                "fi ; " \
++		                                "booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}\0"
+ 
+ /* Copy the kernel and FDT to DRAM memory and boot */
+ #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr_r} ;"\
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
deleted file mode 100644
index 6594b3f..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-tc0.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-# TC0 specific Das U-Boot configuration and patch
-
-SRC_URI_append = ' file://0001-Add-support-for-Total-Compute.patch'
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 0df13a4..966f040 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,12 +1,32 @@
 # Machine specific u-boot
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"
+THISDIR := "${THISDIR}"
+FILESEXTRAPATHS_prepend = "${THISDIR}/files/:${THISDIR}/${BP}:"
+FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
+FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
 
+#
+# Cortex-A5 DesignStart KMACHINE
+#
 SRC_URI_append_a5ds = " file://0001-armv7-add-mmio-timer.patch \
-                    file://0002-board-arm-add-designstart-cortex-a5-board.patch"
+                        file://0002-board-arm-add-designstart-cortex-a5-board.patch"
 
-MACHINE_UBOOT_REQUIRE ?= ""
+#
+# FVP FOUNDATION KMACHINE
+#
+SRC_URI_append_foundation-armv8 = " file://u-boot_vexpress_fvp.patch"
 
-MACHINE_UBOOT_REQUIRE_tc0 = "u-boot-tc0.inc"
+#
+# FVP BASE KMACHINE
+#
+SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
 
-require ${MACHINE_UBOOT_REQUIRE}
+#
+# Juno KMACHINE
+#
+SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
+
+#
+# Total Compute KMACHINE
+#
+SRC_URI_append_tc0 = " file://0001-Add-support-for-Total-Compute.patch"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
deleted file mode 100644
index a46e36f..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-# u-boot_2020 patch for fvp machinesboard
-
-#
-# Patch u-boot to change kernel command line
-#
-
-FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
-FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
-FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files:"
-
-SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
-SRC_URI_append_foundation-armv8 = " file://u-boot_vexpress_fvp.patch"
-SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
-- 
2.17.1

