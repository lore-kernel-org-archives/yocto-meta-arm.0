Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web09.12291.1604672386211589813
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 06:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wySw/ecB;
 spf=pass (domain: arm.com, ip: 40.107.7.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4dnt5CbBM/RiW4uSIUxb/ajWfoS873PX6WgyKkKpnI=;
 b=wySw/ecBVhzbaV18j0frPYie9gxecmbrvtFZs05IhvZPbUJW5Ibr3h6cloIfATtdoPWa2LPKfuoYEqqutA3CoNi+8giUWQrmZ/nwvoA7zNQKxyLons+cPzZYDTxSl4qa8mBiISMfKm0W4JhP3qCUjjQ+cqQ9Envc2kltdU63qGI=
Received: from DB9PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:10:1d9::20)
 by DB6PR08MB2934.eurprd08.prod.outlook.com (2603:10a6:6:19::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 6 Nov
 2020 14:19:42 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::96) by DB9PR02CA0015.outlook.office365.com
 (2603:10a6:10:1d9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 6 Nov 2020 14:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 14:19:42 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Fri, 06 Nov 2020 14:19:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 18622be7f4b686c4
X-CR-MTA-TID: 64aa7808
Received: from f64b311a5702.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B5F8D174-912D-4F2C-BA67-248903AE642E.1;
	Fri, 06 Nov 2020 14:19:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f64b311a5702.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 14:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdrM3L8SWU9BN+0hwB6YhIsf7H71HStn6K565mLsQoewUkph61DJR9mnggdz87r29RuQbsISFXgZ5DrxEHgXz0MbGHG1Ko6a8OL4F8/R5nLNBJ9+2/V8Z83Ku4PCHAb4d5Bm3a4ueYOtY7m71eBEN8Jvn1UU+TZ8EgTujhKqBYrSmL9s4NGNqLh34d4dKVUDewd/lJzEUXS1xTOxW6zBnA0dwitd1o8tkwWesCFTiGXhya58XNVD2H/LiwRvqiMQSeweuNC+/1UcrPuuUt15YA/rcP5WW6sRn91vXe4lDHI+rXHHHfUPEliScZSFFQDHAsLkaSEUQufl5qk2XmJGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4dnt5CbBM/RiW4uSIUxb/ajWfoS873PX6WgyKkKpnI=;
 b=HnMtzRgLND4cswmabHSNKtitnWslYfRJtJQWj4tWoig1wKHNGxDiBhlfpyyTPBxpYmjxPbPYNdOfNiR69vmJm6TaerQJNFyeVaE0VrXP+MdkaOusLJiklxj/TM5v48u233CpyhRqUPPQrvVNL5YHD1LW0mXksqcWvm/iV3uiP3TeeToGSuUUjOoZrFyTvQ2G4/XYaT9RqPPgRfnKljzCS5j7tYSE3OGH8E4/YI6SBXXvqWyqqnkvrpn9RDB5SNnMYOK3xa6k8qeE2VABB+Mcuj9tvZovdNPK8SQoa7xDX7YHndtS3G9EK2V/ce+0oOlUCp639+WPz0bETCEDfvHWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4dnt5CbBM/RiW4uSIUxb/ajWfoS873PX6WgyKkKpnI=;
 b=wySw/ecBVhzbaV18j0frPYie9gxecmbrvtFZs05IhvZPbUJW5Ibr3h6cloIfATtdoPWa2LPKfuoYEqqutA3CoNi+8giUWQrmZ/nwvoA7zNQKxyLons+cPzZYDTxSl4qa8mBiISMfKm0W4JhP3qCUjjQ+cqQ9Envc2kltdU63qGI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 14:19:03 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 14:19:03 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH 1/2] arm-bsp/u-boot: fix autoboot issue on juno platform
Date: Fri,  6 Nov 2020 14:18:58 +0000
Message-Id: <80b1626dd2d1f10caf155a533b858c0ef5a663ba.1604672207.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.28 via Frontend Transport; Fri, 6 Nov 2020 14:19:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 434624d8-c195-4a4c-ff23-08d8825f0135
X-MS-TrafficTypeDiagnostic: AM7PR08MB5525:|DB6PR08MB2934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB2934266055FEC59E426F4C8992ED0@DB6PR08MB2934.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:295;OLM:295;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0pQnNbt//vzW1u6EI6jbVAM3MmldY+Qw6hVDyuWuQOi7z3xxzRj0V7TE4okn09AxIQLamW7VkNq/S8EQQFH6vBmJRB0ZxgdeeOUUacx+g2vUcnAml8jnvLFvuf3UCGYDokJXLK9V6yG0DPtlIwOC4EmR5vzJgHeCxUoZl1HEIw1OjgP+kza/6jdC1Vf0yNVqjQuDEJ7CYOmfS3HXu68ZGNMgtQ7gLRnW0o1rtqrFEmstAbGRbrMDyHI27pYWFeq1JLuRh91NVwBFR3ZHLijHo0ekn/BLNu8PI7a66q8PquISRCbA7g0AEDXv0wUrhXPRiO1zY2GOLfLPhf0IyZrgQA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39840400004)(376002)(2616005)(44832011)(52116002)(2906002)(36756003)(83380400001)(186003)(16526019)(26005)(6916009)(5660300002)(8936002)(478600001)(7696005)(8676002)(66946007)(956004)(6486002)(316002)(6666004)(86362001)(4326008)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 RqHp0W1FVEyT33ZD5QBhBd8yUgj8sVfyi2BDQlDP1B6tagsvKURDLsF/eQHkJ7Z5tmw0w2jnPUDLcBnpGZ0PlQ4CVo6ut7txli4Z2xqG/EEa0TWST3FBbNiiiI0/ujOqnhDYIs9hEPuOvJs8Esui58oCw1UlXe1HzBD7g5zwLOTRN5fjDSWjTahaQdGzjJLC8nuY0O86rCmwHflLVaI6KiKlouSFcnQOjaybE1GTMJQmE4RW5wh5zgDuP2qWtzaAyGuWNSyMr/vmX1tfsgnZgz04knejc/xmL/K+Q+kQaSPDsgksw4L8n6IE8cbUEGNGYCSO4jRtLtibh1pz7JeQoSGrLNmu3IloXI9g/RbWm1f8MrPqhyB/G2YcMdVvKma4GzKLNo5fpYa6hDbSyXZW48nZ+IdYqX0/hmJfCTluyyfeX1HLsKG9gx3gTc/Hva45aQoYh1dLzoJMShzRPuDkuouJcsjgXshJiT3FVctKQaPSthZ1gBAlJFY1PSowPHPadgu07y0IujemlJMaIr+lqGG95AwG72mNHTSh6z8OBkTMD5M9NfHiJGscPplMW7QoEHYsKlx/SwB/nl8kTpSY3Ctz91nIrGJaP4uRYNZY2t+ALTBb+C/BR901M/UExz/0Wxg18VmiGwvB2Q7eTuiSMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8cf0ddac-e825-477a-9658-08d8825ee98a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5YC+2yB6xuWLIhxDIVNwR3IoUheMsYArclVSA31Lm+LAj1183glvyZxI92NZglv89/kktzEQkOUl36+Jl76lpCwZAa375r2KG/jS6CEJkzBwmLZ7/41w10za6vxTdIk8YSOqfD9alAjaU4tperwh78Dq70IZk/zdyzJe276nWlBdh/iAW+L/Yc53CTd3tSAQj8jeHMCzlUkG/D8+QRdF3WwLWowPR3Nf0L3A1MDknLy5r6j1yig+FGnroI6X8A76TnIh1HhjRj+Ai/2TJDyL28+cexWfpaaEBPiohHNZ+rq4y4bP2hxrbYaOoaatqqSjk39SfopnpL4xtBgcoAcfCu0Jq2GZa4HzEIaTomkIGVIXxCtZg4ieU0ZFqASJe7Pi1JLeuzDH/FoPfBEx+DJTZA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(46966005)(70586007)(82310400003)(83380400001)(82740400003)(316002)(5660300002)(2906002)(81166007)(47076004)(26005)(6916009)(6666004)(44832011)(8676002)(70206006)(8936002)(4326008)(36756003)(956004)(336012)(7696005)(86362001)(2616005)(16526019)(356005)(6486002)(478600001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 14:19:42.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 434624d8-c195-4a4c-ff23-08d8825f0135
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2934
Content-Type: text/plain

From: Damodar Santhapuri <damodar.santhapuri@arm.com>

this commit fixes memory corruption of uEnv.txt's DRAM memory at
${loadaddr} , by giving enough memory to kernel Image.

Change-Id: I0243b121f1e56b06b8d2f2a21420c594598fad31
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 .../u-boot-2020.07/juno/u-boot_vexpress_uenv.patch | 63 ++++++++++++++++++----
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
index c68c173..68433ed 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/juno/u-boot_vexpress_uenv.patch
@@ -1,16 +1,39 @@
+From 5372743bab931e0f31e37c3767077abd504eca2b Mon Sep 17 00:00:00 2001
+From: Damodar Santhapuri <damodar.santhapuri@arm.com>
+Date: Thu, 5 Nov 2020 22:40:48 +0530
+Subject: [PATCH] arm: juno: add custom bootcmd to autoboot from uEnv.txt file
+
+enable autoboot support with custom bootcmd loads uEnv.txt
+from NOR to DRAM and import.
+
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+Upstream-Status: Pending
+---
+ include/configs/vexpress_aemv8a.h | 40 ++++++++++++++++++++++++++-----
+ 1 file changed, 34 insertions(+), 6 deletions(-)
+
 diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 09cdd3dab5..7d6d231bd9 100644
+index 09cdd3dab5..9c9f8dfd16 100644
 --- a/include/configs/vexpress_aemv8a.h
 +++ b/include/configs/vexpress_aemv8a.h
-@@ -136,6 +136,32 @@
+@@ -131,11 +131,39 @@
+ 				"kernel_name=norkern\0"	\
+ 				"kernel_alt_name=Image\0"	\
+ 				"kernel_addr_r=0x80080000\0" \
+-				"ramdisk_name=ramdisk.img\0"	\
+-				"ramdisk_addr_r=0x88000000\0"	\
++				"initrd_name=ramdisk.img\0"	\
++				"initrd_addr_r=0x88000000\0"	\
  				"fdtfile=board.dtb\0" \
  				"fdt_alt_name=juno\0" \
  				"fdt_addr_r=0x80000000\0" \
-+                               "bootenvfile=uEnv.txt\0" \
-+                               "bootcmd=run envboot\0" \
-+                               "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
++				"fdt_high=0xffffffffffffffff\0" \
++				"initrd_high=0xffffffffffffffff\0" \
++                                "bootenvfile=uEnv.txt\0" \
++                                "bootcmd=run envboot\0" \
++                                "envboot=if run loadbootenv; then echo Loading env from ${bootenvfile}; run importbootenv; else run default_bootcmd; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd;fi;\0" \
 +                                "importbootenv=echo Importing environment from memory, size ${filesize}; env import -t ${loadaddr} ${filesize}\0" \
-+                                "loadaddr=0x82000000\0" \
++                                "loadaddr=0x84000000\0" \
 +                                "filesize=0x4000\0" \
 +                                "loadbootenv=mw.l ${loadaddr} 0 0x1000; afs load ${bootenvfile} ${loadaddr}\0" \
 +                                "default_bootcmd=echo running default boot command; afs load ${kernel_name} ${kernel_addr_r} ; " \
@@ -26,12 +49,32 @@ index 09cdd3dab5..7d6d231bd9 100644
 +		                                "  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
 +		                                "fi ; "\
 +                                                "fdt addr ${fdt_addr_r}; fdt resize; " \
-+		                                "if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
++		                                "if afs load  ${initrd_name} ${initrd_addr_r} ; "\
 +		                                "then "\
-+		                                "  setenv ramdisk_param ${ramdisk_addr_r}; "\
-+		                                "  else setenv ramdisk_param -; "\
++		                                "  setenv initrd_param ${initrd_addr_r}; "\
++		                                "  else setenv initrd_param -; "\
 +		                                "fi ; " \
-+		                                "booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}\0"
++		                                "booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}\0"
  
  /* Copy the kernel and FDT to DRAM memory and boot */
  #define CONFIG_BOOTCOMMAND	"afs load ${kernel_name} ${kernel_addr_r} ;"\
+@@ -151,12 +179,12 @@
+ 				"  afs load ${fdt_alt_name} ${fdt_addr_r}; "\
+ 				"fi ; "\
+ 				"fdt addr ${fdt_addr_r}; fdt resize; " \
+-				"if afs load  ${ramdisk_name} ${ramdisk_addr_r} ; "\
++				"if afs load  ${initrd_name} ${initrd_addr_r} ; "\
+ 				"then "\
+-				"  setenv ramdisk_param ${ramdisk_addr_r}; "\
+-				"  else setenv ramdisk_param -; "\
++				"  setenv initrd_param ${initrd_addr_r}; "\
++				"  else setenv initrd_param -; "\
+ 				"fi ; " \
+-				"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}"
++				"booti ${kernel_addr_r} ${initrd_param} ${fdt_addr_r}"
+ 
+ 
+ #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
+-- 
+2.17.1
+
-- 
2.7.4

