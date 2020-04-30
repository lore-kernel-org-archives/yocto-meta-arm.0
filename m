Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web12.3047.1588234643687732543
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 01:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mfrZ/eaQ;
 spf=pass (domain: arm.com, ip: 40.107.8.70, mailfrom: vineeth.raveendran@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLdXGaz+uiv3t1zxERkEvl+IjO8CZ9jZYOLRj77SpaU=;
 b=mfrZ/eaQbHltuT5mA+63j5VfvNE8+5/D1aYuJa6pTF9hbDj/ibTxXkjfgRwBPUqyAivcUTx4TPNNd2V1w7E1ou0nybowGaCnVD2cSbtbtP2beVHG4cpDD76WHK9BK2n321Z0xWwi7aPjHd1PTeL0G2CTjZZtfK+H6QF0Z4l0Blc=
Received: from PR1PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::39) by VI1PR0802MB2159.eurprd08.prod.outlook.com
 (2603:10a6:800:a3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 08:17:20 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:0:cafe::89) by PR1PR01CA0026.outlook.office365.com
 (2603:10a6:102::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 08:17:20 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 08:17:19 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Thu, 30 Apr 2020 08:17:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 292d8add54baf396
X-CR-MTA-TID: 64aa7808
Received: from 9c31cb06b8a6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9B582C28-CCD6-4923-9CF0-B9FA160CACDD.1;
	Thu, 30 Apr 2020 08:17:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c31cb06b8a6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 08:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8kBFj5S4FsXpnmCyOpXx5NZexc8MI428JJtVVs2uUYfwPa5CuGqbJ86hFVFZfHan9GHyfPCgh21kPWNFYx6t7y/i4AikL5OVt/gKlO9IC18z8O2na6GCXeUp7IgLYmWDGp0U7f2k7fz24KlTRjB8wpp9+zr2nqRb4oqgv3Oi4HVBLAUJL248QDnVxMbKvmL1hbCPQ8uJ6PTq+LCw6xMLJMqVZMeqesOupmP405nFo21g61q456dG5dimts0X5BQuNl9gQHGfdTvYvpNBzvpBzJl4h51K1U4RqO0+S7rMq9eT0DWFUMcPNwiK+Rkabvohavu2k5Y8R+MHzQyRM4HeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLdXGaz+uiv3t1zxERkEvl+IjO8CZ9jZYOLRj77SpaU=;
 b=YSo6xTRNijebsebhnJ5qv7Y2wcZ/29mj0ovuRsfh7+OmAwJi4j8upPtKNXzsRHWA4vCvDgZB21PGA83UJv93yEvxrUwrNTU3i7VAHezxKctIHC/7U2hcjpXq/O5P0DgdHjyzmiH4tYV49DqjQJrFlg89DUrZtqfgaXz4dKPfzRESficShCBRmVdzQH5/6SS/YYYRP46FQQ7Vd6W/rIIpg2OywZ+Z77WRHd6zc6Pe8DH4cMdcwTyp4UZjyN0vKhWFrYau2dpYnvx2LDGMqyLzs+dRmPNfvf6mBEFM2EmfB0ZVJTGoI6xykTiLbbpfEA9kDmtUWdExkwOIsiTsdJvPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLdXGaz+uiv3t1zxERkEvl+IjO8CZ9jZYOLRj77SpaU=;
 b=mfrZ/eaQbHltuT5mA+63j5VfvNE8+5/D1aYuJa6pTF9hbDj/ibTxXkjfgRwBPUqyAivcUTx4TPNNd2V1w7E1ou0nybowGaCnVD2cSbtbtP2beVHG4cpDD76WHK9BK2n321Z0xWwi7aPjHd1PTeL0G2CTjZZtfK+H6QF0Z4l0Blc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (2603:10a6:803:bf::19)
 by VI1PR08MB3486.eurprd08.prod.outlook.com (2603:10a6:803:8a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 08:17:12 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c%3]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 08:17:12 +0000
From: "Vineeth Raveendran" <vineeth.raveendran@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] meta-arm-bsp: add dunfell compatibility to fvps and juno
Date: Thu, 30 Apr 2020 09:17:00 +0100
Message-Id: <20200430081700.548-1-vineeth.raveendran@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::22) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:bf::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123640.arm.com (217.140.99.251) by LO2P265CA0058.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 08:17:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b51d8c1f-3164-4a54-ec01-08d7ecdee6e7
X-MS-TrafficTypeDiagnostic: VI1PR08MB3486:|VI1PR0802MB2159:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB21591DD1F9AFD8DC5917826A9AAA0@VI1PR0802MB2159.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:190;OLM:190;
X-Forefront-PRVS: 0389EDA07F
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(36756003)(26005)(478600001)(4326008)(66556008)(66476007)(86362001)(66946007)(5660300002)(2906002)(186003)(16526019)(6666004)(6916009)(44832011)(8936002)(8676002)(6486002)(7696005)(316002)(1076003)(2616005)(52116002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1+jbPsaq9b8bTzrYBEKv3VlI6XNAbc9hcJ5JyV9ONBRkj1qym60VHVcaUzkrwIEjGzF1MQUVwXlimCLa5dz8+dqCjtNLuizQpxh1F/DgYNF4QnWGtwseOWvs4dgwh5x1N+lCog+Rt3arsoHtRkbDYHx7iPsJnilnnE8+1VGpAwpJCKs1ksuF1V/9ZVTGky5YCqhrsHOiIko1ryEHnjN2WxyR7yReLpCsKOL168yxkRjH1rh4mHi00rVQmUJAAJ9YLKnba7nSK8HEiWiXtWNAtXQxjTkPToCxW/w2AQclId76Npt10yKEuTFtc+g5KNrXxuflCSJlYfNxT5hb+g71rbRqC1ThhqxHNMM/efW2viDUqMj7iA95ZEN/Bag3Nd9lkjlOOk04wJmAl0oP+ob0Kp3wZ8d+SIzihZmucThfjbRhaGzNWC7SfZ1oDMX5Q8/u
X-MS-Exchange-AntiSpam-MessageData: 
 FvOU0JJoPQAUFvS6pmDpC40OS0x/8ia63Mt+D7xPtjpBOxiOBIdB+X3wJ28owIRPC3Hyh7/q7tBXVZImkb5fdsWcsMpI9EZfI9wVOOt6LKsSLGt98XccmPnhyJBIkvmN3CR+i+5XJWPo51yKT3nHXic20x/POR2n05Vgtn5XZON0Ezv9yPuG2x2wL2zeVsMn5ke6Oo/N88komC2sT6s0u2pfm6Oeo5powSb/S1LSIWhkQb5cozEXacy0Fm6lcoZext9p1OJJ6TZN8vAkCzO+zBVSOXo4BUv9dMJFc/r2RnqHa4+TZvSf8JHkd3aSfZdnb73z84TentRP7t/Cr3DJpq1+R7Lveoa5nTt8BP03BlALEYH5xiycXgfzQjQb5EerBxFiqtPx6uh4s3CUCv1khsspPqSS/Jcgv1Ty+emyMuAWJbnUNtvPadxrXeE0ZP/FpnxSCSbCBhZKFkvjZlQutzmo2UsKkrlumSyGykstsuz2zVHKTridvAQoSBY1iixJAW3E3vyzNpaMoZaIGo8kYLsNqTrrnFxU8fpnLsBlbB60H0kUNzRsdK1Ua26vTLdu9S6g/DO8n3CekjwQLgDjWmKYrRxSRrr1SwVVZAlby1RFftWfUwFevYONTa6Pvunll5AV/nn4Kz4JfiHm19d2yO8R9ezt0iWccn1/tzBHynGrBPlu/yRIEbcYjuwQd07Z+/PPHhTiIHxfdT6JKdkSpHWEgQg1qdVkWHNR8NP1+6nz/zQpLqx9W+3W6b35tLscLC4UM9dSbm3S7B3u8XEjvVG8Z+r5Ic2cBEJuIhaj8pQ=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3486
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Vineeth.Raveendran@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(26005)(36756003)(6486002)(70586007)(16526019)(186003)(6916009)(70206006)(4326008)(316002)(82740400003)(36906005)(47076004)(7696005)(81166007)(6666004)(82310400002)(1076003)(478600001)(86362001)(8676002)(356005)(44832011)(956004)(5660300002)(2616005)(2906002)(336012)(8936002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c0a28fd8-c19e-4828-8c70-08d7ecdee270
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cLEQdZGQeAwclO3O5nxQf4mSNp01jH1VqMHeUXoP6p+zbwqTUMA15DFxB3QkUlRU0XdWPcpMb0B8q7rEeyRxLAZMPK3WqUYn1vXXxz4bcFdFh7H9NWvwc8ITBXQ1Kk8+M3a6XBmGNto91VIBJJRfaoZ3pfjObMjv+iX1LqMc4f4n8mQ+pqRPoR07hQtDH5c6kBGu81eLN54aOsFb8E7Z2SnjSDbGIJ07X1hnY131erQfiahymO3ttWJ8WdXAicFmFShlNX3467xz8g3USlpCSAsxeQCfocv2JQvZ1m7wWwQ91k3KwS1QArDJMWJBIq6DkyWkRR2rtv5MpCtQbfdMBMKF6NhmDEL5QutLqwDIPgIJYS3wlpImMUQ7eYdisJvOWf+FQMNQ91hT4p8Fz0EjpwGEjECZmCkK5zluzVLdBipMGD5MlFIjkfce4KkLY5P6tLD21cX/psfkUarXKncawyusLHgwi3wpA1lfcuH5Hd8W96Sqx63yOO3BNSBqgm+K9MIroaQFU/vcM1nsposRpA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 08:17:19.5628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b51d8c1f-3164-4a54-ec01-08d7ecdee6e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2159
Content-Type: text/plain

Make following machines compatible with dunfell:
    - foundation-armv8
    - fvp-base
    - juno

Major changes include supporting kernel version 5.4 and U-BOOT version v2020

Change-Id: Ia59ac874de4e4c4ea02c7a4f976e39a9b6996f75
Issue-Id: SCM-833
Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
---
 meta-arm-bsp/conf/layer.conf                        |  3 +++
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc        |  6 ++++--
 .../files/fvp-common/u-boot_vexpress_fvp.patch      | 13 +++++++++++++
 .../recipes-bsp/u-boot/u-boot_2020.%.bbappend       | 11 +++++++++++
 .../recipes-kernel/linux/linux-yocto_5.4.bbappend   |  3 +++
 5 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 1a54ddc..5257195 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -11,3 +11,6 @@ BBFILE_PRIORITY_meta-arm-bsp = "6"
 
 LAYERDEPENDS_meta-arm-bsp = "core openembedded-layer meta-arm"
 LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
+
+# Place holder for yocto version compatibility
+OVERRIDES_append = ":${LAYERSERIES_CORENAMES}"
diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
index 702a1d2..d1a59cc 100644
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
@@ -35,9 +35,11 @@ DISK_IMG_PARTITION3_CONTENT = ""
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "4.19%"
+PREFERRED_VERSION_linux-yocto ?= "5.4%"
+PREFERRED_VERSION_linux-yocto_zeus ?= "4.19%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
 # FVP u-boot configuration
-UBOOT_MACHINE = "vexpress_aemv8a_dram_defconfig"
+UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
+UBOOT_MACHINE_zeus = "vexpress_aemv8a_dram_defconfig"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
new file mode 100644
index 0000000..bdca202
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
@@ -0,0 +1,13 @@
+diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
+index c9cec8322c..3a339be6a2 100644
+--- a/configs/vexpress_aemv8a_semi_defconfig
++++ b/configs/vexpress_aemv8a_semi_defconfig
+@@ -9,7 +9,7 @@ CONFIG_IDENT_STRING=" vexpress_aemv8a"
+ CONFIG_DISTRO_DEFAULTS=y
+ CONFIG_BOOTDELAY=1
+ CONFIG_USE_BOOTARGS=y
+-CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
++CONFIG_BOOTARGS="console=ttyAMA0 earlyprintk=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
+ # CONFIG_USE_BOOTCOMMAND is not set
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
new file mode 100644
index 0000000..d69943b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
@@ -0,0 +1,11 @@
+# u-boot_2020 patch for fvp machinesboard
+
+#
+# Patch u-boot to change kernel command line
+#
+
+FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
+FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
+
+SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
+SRC_URI_append_foundation-armv8 = " file://u-boot_vexpress_fvp.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
new file mode 100644
index 0000000..ed6fbc3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
@@ -0,0 +1,3 @@
+# Add support for Arm Platforms (boards or simulators)
+
+require linux-yocto-arm-platforms.inc
-- 
2.17.1

