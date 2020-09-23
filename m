Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web11.1621.1600882885270063530
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Sep 2020 10:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TFS4b6ts;
 spf=pass (domain: arm.com, ip: 40.107.22.82, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV/LREvOWPabvGS7W7ykTep7nmwF4AkeACXBYTUrZSc=;
 b=TFS4b6tsjq/ECBxq1xxMczgtffJTAAlgp9JS9clLxWK3XTSWU4rMCRVf4kcquvAEaneWoAXBpMLYscmrp4Nycwa9Lao49CyRzDfuApn/jk50ZtjrtH/Uf92HUNhD1ssiqjS2XHqyKzNLRMp2kGuZEWLvCvwWSj/MCdW1Zo1bN50=
Received: from AM6P193CA0072.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::49)
 by VI1PR08MB4381.eurprd08.prod.outlook.com (2603:10a6:803:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Wed, 23 Sep
 2020 17:41:22 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::f1) by AM6P193CA0072.outlook.office365.com
 (2603:10a6:209:8e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Wed, 23 Sep 2020 17:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Wed, 23 Sep 2020 17:41:21 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Wed, 23 Sep 2020 17:41:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38f27eeb95ae5f3b
X-CR-MTA-TID: 64aa7808
Received: from 017acf081547.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E196BD36-4E7C-46EC-8971-4C9432578F1A.1;
	Wed, 23 Sep 2020 17:41:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 017acf081547.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Sep 2020 17:41:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhF/OIIc4+3QtNto/TBKOoO555GH2ShaRwaOZsepwVRuXFLQyWSk1KSfv+LpUjFesREe5IKyJW72WdJP55jGTuzpr4+c6jzqNik0zH7exNJBC7zrq98AlMszaGe9WN8Le1Gr6ZYa+KRVzip8u9CeamngPfeGjh3fWL5AbZU/HgdhJL4hgNQ0hlwltQpKFIHJMkEhwNpqigS7QqxV+0utthiGzVxtjk9OnWO/Hc4ahNX0GvPnoxig53+s4MDGE8sTn/+Mef/ey922KTTwcf2bHBnPZQ9hF9P8JE4Xx1rAIZr1L/g9DGcGvL3GhoUCPX8C7GPkkna5eofOZ7IE9iO6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV/LREvOWPabvGS7W7ykTep7nmwF4AkeACXBYTUrZSc=;
 b=kxoT5VwIbqHyvVEMUH4T1VFgouNBGIPCh6sbNJ88+QU/p4gBljqyPr112t9ZeZthop2R4nNRSw5pUwcxkVkDd2IPIEgXMUvDswWu1+OOQ4FnXvBPYq51y5UZBLsKKl0m0f9AfJ6Ffs1wKEcnG0NRy64q8hOLLzhJS1R1nJa3lgwZZs5VeAfYwif34at11q0gl8hF4t4MN/cI7xUAwvDrs96KQcQw4mI7Eb4PrNyoLj4D/xaoTGd5cm6wQeDXTccTbyw+4+tK173s5+98rUdFDqYWTg9/DaNPHmaHkdDzBnKMm9cY6HFQ4Lcdm1mkhN0IzYfm16trNIpX1moYsbj1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV/LREvOWPabvGS7W7ykTep7nmwF4AkeACXBYTUrZSc=;
 b=TFS4b6tsjq/ECBxq1xxMczgtffJTAAlgp9JS9clLxWK3XTSWU4rMCRVf4kcquvAEaneWoAXBpMLYscmrp4Nycwa9Lao49CyRzDfuApn/jk50ZtjrtH/Uf92HUNhD1ssiqjS2XHqyKzNLRMp2kGuZEWLvCvwWSj/MCdW1Zo1bN50=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Wed, 23 Sep
 2020 17:41:13 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc%8]) with mapi id 15.20.3412.020; Wed, 23 Sep 2020
 17:41:13 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp/machine: move kernel version for tc0 to 5.4
Date: Wed, 23 Sep 2020 18:41:05 +0100
Message-Id: <20200923174105.54366-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::17) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Wed, 23 Sep 2020 17:41:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c2fd4570-2de6-4664-e9bd-08d85fe7e2bb
X-MS-TrafficTypeDiagnostic: DB7PR08MB3500:|VI1PR08MB4381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4381CD4DE5C205DF6B80C2A592380@VI1PR08MB4381.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:173;OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Hy+nQzbjpbiEWpifJI0Ng9Z7/CimQA0WcXRgV4KgTc24t7ieUcuFTJuTP4Go0sXsb7oefCD3A0c6PsjVV69O4tnzZwHMr6aGgT7cyO+A4WoIRbR+ySP7CxXEfskbUCKTX6KGUAUcphJbz9i1M+Pr0igIs7E6ONBn5+f1Dpve+ibAf0PduYdXwXKE6soLeDkG/DSOE80oT2PCthgyzXsdxQY2yKFC/0Jvqro13DY5VFVr/3OmFf58h+ONP5aSzZ/kIvri2rkaVLF3Iy6+yMWUndz6j6zwSZWgTST8zlHoD3HMTFE3gGOZPyjMb5NCpSa6CoVWQva3LehGjconYJ6KI5eZh8EwVOv788h/4hsIQid2fFwiHuXpgek4S04NvxKQ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(8676002)(66476007)(8936002)(5660300002)(186003)(316002)(83380400001)(66556008)(66946007)(2906002)(44832011)(6486002)(4326008)(6916009)(26005)(956004)(6666004)(86362001)(36756003)(1076003)(30864003)(478600001)(52116002)(7696005)(2616005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 oMUpU/FJC2r9Vt6hBlpW9WxrRbuvqlLxjp3DpxaUyJk/XsSFZAGb+UD+fWWaItBY7KyiV6ibSPpYysYsciC7Ztb4cRQuEIGoBF4NPMd0lF/A06UuBb7ZISUYYVvWw7PgLqxnvdm8ykiTV89UDXsx4wHLPIC3Px+cVMYM2QUZyoCas2yLR1eAjR8cpSpPYROc64gnmUiJvTSwrdwr0GT2cdmfP1OZ+f/EhTX2tJsB2pCZmDOndRYtLyxkyavEBJPW/Zxbj8PKMSlvaV64c1tZNQpUAfYLMTS90tfgaA5ph72EHec3mwQdfEpHAsIZ0Ot54qGQQyzDwmw1Xr9EQLTA/UJyWUfsBRmpNPSkTRU7hCipn34SmoBghoUVvh9fQgMipwpQeC6Va8Yu8Zwbfas6e2yT7rnNl1Gl6Kwk2GphS8hoq0XuWWSc8FKT9CGsDmjxyVA97l5fTKGy61xj2EgGapjGgxsJRWETLW5q5LgLdQZzjWa1Q+0B0T3aA3XKRGJym5XF4U7L16DojOcSmsTVgbZU4V/azlAbuMuRTwaKzYgvUNwelBGHFNj9ce5Ed2Gog0xedtq1TEkM5LcSBCfE8y9mhQ9mQCDAxCxIhiGI832c+Rr1hV0HMGAlFUhrXj5rwwcUKvGUUGRjWQP1eX7SjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3500
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2c5ee987-e909-41b9-f8d1-08d85fe7ddaa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VoJnJkysh4tu2YAKeojib/xoj2Q8Ys2tMbtgzMOHcbsSasS0zZO8QXY+V6eNTTxTuhzUnMYxLihm9iymeBGzwgJQ0pE5Fx/npnXP8ctoBqOVfRJq2sOHhaSX6pXEgSyRYs/kyklXC1yOSn3kUBWhtmAwRx2fhjnsmZTJEC5cp/NzYEkPEB1cRIsexC+aSmFMVkEkCXvd9e5MJRzNQREE1k6UanVzGnjWUZWs3YN+oVM0WiQem0fMRlC7Q2Pr3nXTOeXieHJVIzHauPY7Y12ctqMkR/6R2/sLSQOFicmHc5lTaRkaXem9w6mOe3e5HndZ5jyoAT9I6+47nO2SHhQNCXraWlMs3rjayGAF86BqZoPYpIaDiNwZWcoKZOPRpzNtqQtBqH2b4L1mETPsMmrYpSN4K29sGBaDm89jy1Vd/pNf/c6UJdCCL8X0/zXqpGnv
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(186003)(478600001)(8676002)(83380400001)(6486002)(47076004)(82740400003)(356005)(5660300002)(81166007)(8936002)(336012)(82310400003)(6916009)(70206006)(70586007)(44832011)(7696005)(1076003)(316002)(30864003)(2906002)(36756003)(26005)(956004)(86362001)(6666004)(4326008)(2616005)(36906005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 17:41:21.8185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fd4570-2de6-4664-e9bd-08d85fe7e2bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4381
Content-Type: text/plain

As the ack-4.19 patches are no longer used, they can
be removed.

Change-Id: Iecbfe86107b7b142f17af6bdfbee086b9590fc1a
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm-bsp/conf/machine/tc0.conf            |   2 +-
 .../linux/linux-arm-platforms.inc             |   5 -
 ...m-Add-component-aware-simple-encoder.patch | 368 ------------------
 ...-red-and-blue-colors-in-HDLCD-driver.patch |  43 --
 .../linux/linux-arm64-ack_4.19.bbappend       |   2 -
 5 files changed, 1 insertion(+), 419 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch

diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index 2de99cd..1eb3d87 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -14,7 +14,7 @@ UBOOT_MACHINE ?= "total_compute_defconfig"
 # Trusted firmware A v2.3
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
-PREFERRED_VERSION_linux-arm64-ack ?= "4.19"
+PREFERRED_VERSION_linux-arm64-ack ?= "5.4"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 79ef26e..ee720fd 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -76,8 +76,3 @@ COMPATIBLE_MACHINE_tc0 = "tc0"
 KMACHINE_tc0 = "tc0"
 KBUILD_DEFCONFIG_tc0 = "defconfig"
 KCONFIG_MODE_tc0 = "--alldefconfig"
-SRC_URI_append_tc0 = " \
-    file://0001-drm-Add-component-aware-simple-encoder.patch \
-    file://0002-swap-red-and-blue-colors-in-HDLCD-driver.patch \
-    file://defconfig \
-    "
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
deleted file mode 100644
index 96cc651..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0001-drm-Add-component-aware-simple-encoder.patch
+++ /dev/null
@@ -1,368 +0,0 @@
-From 6fd66138c44107786879d0adebe78ca94cf6292f Mon Sep 17 00:00:00 2001
-From: Liviu Dudau <Liviu.Dudau@arm.com>
-Date: Wed, 1 Apr 2020 12:10:14 +0100
-Subject: [PATCH 1/2] drm: Add component-aware simple encoder
-
-This is a simple DRM encoder that gets its connector timings information
-from a OF subnode in the device tree and exposes that as a "discovered"
-panel. It can be used together with component-based DRM drivers in an
-emulated environment where no real encoder or connector hardware exists
-and the display output is configured outside the kernel.
-
-Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
-[Backported to gem5's 4.3 kernel]
-Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
-[Ported to gem5's 4.9 kernel. Added dep. on VIDEOMODE_HELPERS.]
-Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
-[Ported to gem5's 4.14 kernel.]
-Signed-off-by: Andreas Sandberg <andreas.sandberg@arm.com>
-Upstream-Status: Backport
-Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
----
- drivers/gpu/drm/Kconfig               |  10 ++
- drivers/gpu/drm/Makefile              |   3 +
- drivers/gpu/drm/drm_virtual_encoder.c | 297 ++++++++++++++++++++++++++++++++++
- 3 files changed, 310 insertions(+)
- create mode 100644 drivers/gpu/drm/drm_virtual_encoder.c
-
-diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
-index e44e567..6e95357 100644
---- a/drivers/gpu/drm/Kconfig
-+++ b/drivers/gpu/drm/Kconfig
-@@ -255,6 +255,16 @@ config DRM_VKMS
- 
- 	  If M is selected the module will be called vkms.
- 
-+config DRM_VIRT_ENCODER
-+	tristate "Virtual OF-based encoder"
-+	depends on DRM && OF
-+	select VIDEOMODE_HELPERS
-+	help
-+	  Choose this option to get a virtual encoder and its associated
-+	  connector that will use the device tree to read the display
-+	  timings information. If M is selected the module will be called
-+	  drm_vencoder.
-+
- source "drivers/gpu/drm/exynos/Kconfig"
- 
- source "drivers/gpu/drm/rockchip/Kconfig"
-diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
-index a6771ce..733ad62 100644
---- a/drivers/gpu/drm/Makefile
-+++ b/drivers/gpu/drm/Makefile
-@@ -46,6 +46,9 @@ drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
- obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
- obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
- 
-+drm_vencoder-y := drm_virtual_encoder.o
-+obj-$(CONFIG_DRM_VIRT_ENCODER) += drm_vencoder.o
-+
- obj-$(CONFIG_DRM)	+= drm.o
- obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
- obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
-diff --git a/drivers/gpu/drm/drm_virtual_encoder.c b/drivers/gpu/drm/drm_virtual_encoder.c
-new file mode 100644
-index 00000000..2e2c51d
---- /dev/null
-+++ b/drivers/gpu/drm/drm_virtual_encoder.c
-@@ -0,0 +1,297 @@
-+/*
-+ * Copyright (C) 2016 ARM Limited
-+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
-+ *
-+ * Dummy encoder and connector that use the OF to "discover" the attached
-+ * display timings. Can be used in situations where the encoder and connector's
-+ * functionality are emulated and no setup steps are needed, or to describe
-+ * attached panels for which no driver exists but can be used without
-+ * additional hardware setup.
-+ *
-+ * The encoder also uses the component framework so that it can be a quick
-+ * replacement for existing drivers when testing in an emulated environment.
-+ *
-+ * This file is subject to the terms and conditions of the GNU General Public
-+ * License.  See the file COPYING in the main directory of this archive
-+ * for more details.
-+ *
-+ */
-+
-+#include <drm/drmP.h>
-+#include <drm/drm_crtc.h>
-+#include <drm/drm_atomic_helper.h>
-+#include <drm/drm_crtc_helper.h>
-+#include <drm/drm_of.h>
-+#include <linux/component.h>
-+#include <video/display_timing.h>
-+#include <video/of_display_timing.h>
-+#include <video/videomode.h>
-+
-+struct drm_virt_priv {
-+	struct drm_connector connector;
-+	struct drm_encoder encoder;
-+	struct display_timings *timings;
-+};
-+
-+#define connector_to_drm_virt_priv(x) \
-+	container_of(x, struct drm_virt_priv, connector)
-+
-+#define encoder_to_drm_virt_priv(x) \
-+	container_of(x, struct drm_virt_priv, encoder)
-+
-+static void drm_virtcon_destroy(struct drm_connector *connector)
-+{
-+	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
-+
-+	drm_connector_cleanup(connector);
-+	display_timings_release(conn->timings);
-+}
-+
-+static enum drm_connector_status
-+drm_virtcon_detect(struct drm_connector *connector, bool force)
-+{
-+	return connector_status_connected;
-+}
-+
-+static const struct drm_connector_funcs drm_virtcon_funcs = {
-+	.reset = drm_atomic_helper_connector_reset,
-+	.detect	= drm_virtcon_detect,
-+	.fill_modes = drm_helper_probe_single_connector_modes,
-+	.destroy = drm_virtcon_destroy,
-+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-+};
-+
-+static int drm_virtcon_get_modes(struct drm_connector *connector)
-+{
-+	struct drm_virt_priv *conn = connector_to_drm_virt_priv(connector);
-+	struct display_timings *timings = conn->timings;
-+	int i;
-+
-+	for (i = 0; i < timings->num_timings; i++) {
-+		struct drm_display_mode *mode = drm_mode_create(connector->dev);
-+		struct videomode vm;
-+
-+		if (videomode_from_timings(timings, &vm, i))
-+			break;
-+
-+		drm_display_mode_from_videomode(&vm, mode);
-+		mode->type = DRM_MODE_TYPE_DRIVER;
-+		if (timings->native_mode == i)
-+			mode->type = DRM_MODE_TYPE_PREFERRED;
-+
-+		drm_mode_set_name(mode);
-+		drm_mode_probed_add(connector, mode);
-+	}
-+
-+	return i;
-+}
-+
-+static int drm_virtcon_mode_valid(struct drm_connector *connector,
-+				   struct drm_display_mode *mode)
-+{
-+	return MODE_OK;
-+}
-+
-+struct drm_encoder *drm_virtcon_best_encoder(struct drm_connector *connector)
-+{
-+	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
-+
-+	return &priv->encoder;
-+}
-+
-+struct drm_encoder *
-+drm_virtcon_atomic_best_encoder(struct drm_connector *connector,
-+				 struct drm_connector_state *connector_state)
-+{
-+	struct drm_virt_priv *priv = connector_to_drm_virt_priv(connector);
-+
-+	return &priv->encoder;
-+}
-+
-+static const struct drm_connector_helper_funcs drm_virtcon_helper_funcs = {
-+	.get_modes = drm_virtcon_get_modes,
-+	.mode_valid = drm_virtcon_mode_valid,
-+	.best_encoder = drm_virtcon_best_encoder,
-+	.atomic_best_encoder = drm_virtcon_atomic_best_encoder,
-+};
-+
-+static void drm_vencoder_destroy(struct drm_encoder *encoder)
-+{
-+	drm_encoder_cleanup(encoder);
-+}
-+
-+static const struct drm_encoder_funcs drm_vencoder_funcs = {
-+	.destroy = drm_vencoder_destroy,
-+};
-+
-+static void drm_vencoder_dpms(struct drm_encoder *encoder, int mode)
-+{
-+	/* nothing needed */
-+}
-+
-+static bool drm_vencoder_mode_fixup(struct drm_encoder *encoder,
-+				    const struct drm_display_mode *mode,
-+				    struct drm_display_mode *adjusted_mode)
-+{
-+	/* nothing needed */
-+	return true;
-+}
-+
-+static void drm_vencoder_prepare(struct drm_encoder *encoder)
-+{
-+	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_OFF);
-+}
-+
-+static void drm_vencoder_commit(struct drm_encoder *encoder)
-+{
-+	drm_vencoder_dpms(encoder, DRM_MODE_DPMS_ON);
-+}
-+
-+static void drm_vencoder_mode_set(struct drm_encoder *encoder,
-+				  struct drm_display_mode *mode,
-+				  struct drm_display_mode *adjusted_mode)
-+{
-+	/* nothing needed */
-+}
-+
-+static const struct drm_encoder_helper_funcs drm_vencoder_helper_funcs = {
-+	.dpms		= drm_vencoder_dpms,
-+	.mode_fixup	= drm_vencoder_mode_fixup,
-+	.prepare	= drm_vencoder_prepare,
-+	.commit		= drm_vencoder_commit,
-+	.mode_set	= drm_vencoder_mode_set,
-+};
-+
-+static int drm_vencoder_bind(struct device *dev, struct device *master,
-+			     void *data)
-+{
-+	struct drm_encoder *encoder;
-+	struct drm_virt_priv *con;
-+	struct drm_connector *connector;
-+	struct drm_device *drm = data;
-+	u32 crtcs = 0;
-+	int ret;
-+
-+	con = devm_kzalloc(dev, sizeof(*con), GFP_KERNEL);
-+	if (!con)
-+		return -ENOMEM;
-+
-+	dev_set_drvdata(dev, con);
-+	connector = &con->connector;
-+	encoder = &con->encoder;
-+
-+	if (dev->of_node) {
-+		struct drm_bridge *bridge;
-+		crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
-+		bridge = of_drm_find_bridge(dev->of_node);
-+		if (bridge) {
-+			ret = drm_bridge_attach(encoder, bridge, NULL);
-+			if (ret) {
-+				DRM_ERROR("Failed to initialize bridge\n");
-+				return ret;
-+			}
-+		}
-+		con->timings = of_get_display_timings(dev->of_node);
-+		if (!con->timings) {
-+			dev_err(dev, "failed to get display panel timings\n");
-+			return ENXIO;
-+		}
-+	}
-+
-+	/* If no CRTCs were found, fall back to the old encoder's behaviour */
-+	if (crtcs == 0) {
-+		dev_warn(dev, "Falling back to first CRTC\n");
-+		crtcs = 1 << 0;
-+	}
-+
-+	encoder->possible_crtcs = crtcs ? crtcs : 1;
-+	encoder->possible_clones = 0;
-+
-+	ret = drm_encoder_init(drm, encoder, &drm_vencoder_funcs,
-+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-+	if (ret)
-+		goto encoder_init_err;
-+
-+	drm_encoder_helper_add(encoder, &drm_vencoder_helper_funcs);
-+
-+	/* bogus values, pretend we're a 24" screen for DPI calculations */
-+	connector->display_info.width_mm = 519;
-+	connector->display_info.height_mm = 324;
-+	connector->interlace_allowed = false;
-+	connector->doublescan_allowed = false;
-+	connector->polled = 0;
-+
-+	ret = drm_connector_init(drm, connector, &drm_virtcon_funcs,
-+				 DRM_MODE_CONNECTOR_VIRTUAL);
-+	if (ret)
-+		goto connector_init_err;
-+
-+	drm_connector_helper_add(connector, &drm_virtcon_helper_funcs);
-+
-+	drm_connector_register(connector);
-+
-+	ret = drm_connector_attach_encoder(connector, encoder);
-+	if (ret)
-+		goto attach_err;
-+
-+	return ret;
-+
-+attach_err:
-+	drm_connector_unregister(connector);
-+	drm_connector_cleanup(connector);
-+connector_init_err:
-+	drm_encoder_cleanup(encoder);
-+encoder_init_err:
-+	display_timings_release(con->timings);
-+
-+	return ret;
-+};
-+
-+static void drm_vencoder_unbind(struct device *dev, struct device *master,
-+				void *data)
-+{
-+	struct drm_virt_priv *con = dev_get_drvdata(dev);
-+
-+	drm_connector_unregister(&con->connector);
-+	drm_connector_cleanup(&con->connector);
-+	drm_encoder_cleanup(&con->encoder);
-+	display_timings_release(con->timings);
-+}
-+
-+static const struct component_ops drm_vencoder_ops = {
-+	.bind = drm_vencoder_bind,
-+	.unbind = drm_vencoder_unbind,
-+};
-+
-+static int drm_vencoder_probe(struct platform_device *pdev)
-+{
-+	return component_add(&pdev->dev, &drm_vencoder_ops);
-+}
-+
-+static int drm_vencoder_remove(struct platform_device *pdev)
-+{
-+	component_del(&pdev->dev, &drm_vencoder_ops);
-+	return 0;
-+}
-+
-+static const struct of_device_id drm_vencoder_of_match[] = {
-+	{ .compatible = "drm,virtual-encoder", },
-+	{},
-+};
-+MODULE_DEVICE_TABLE(of, drm_vencoder_of_match);
-+
-+static struct platform_driver drm_vencoder_driver = {
-+	.probe = drm_vencoder_probe,
-+	.remove = drm_vencoder_remove,
-+	.driver = {
-+		.name = "drm_vencoder",
-+		.of_match_table = drm_vencoder_of_match,
-+	},
-+};
-+
-+module_platform_driver(drm_vencoder_driver);
-+
-+MODULE_AUTHOR("Liviu Dudau");
-+MODULE_DESCRIPTION("Virtual DRM Encoder");
-+MODULE_LICENSE("GPL v2");
--- 
-2.7.4
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
deleted file mode 100644
index 621209f..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-4.19/tc0/0002-swap-red-and-blue-colors-in-HDLCD-driver.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 064807d22a0a2865a930d4cc48b61f917f4bf15f Mon Sep 17 00:00:00 2001
-From: Anders Dellien <anders.dellien@arm.com>
-Date: Fri, 17 Apr 2020 16:06:03 +0100
-Subject: [PATCH 2/2] swap red and blue colors in HDLCD driver
-
-The HDLCD drivers is configured to use BGR888 but Android needs
-RGB888 - so we need to swap the red and blue components.
-
-Change-Id: Ib47ddff9280a53757925f6c1b1f373089d038025
-Signed-off-by: Anders Dellien<anders.dellien@arm.com>
-Upstream-Status: Inappropriate [Color swap needed for TC0 only]
-Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
----
- drivers/gpu/drm/arm/hdlcd_crtc.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
-index e69d996..a46ba4f 100644
---- a/drivers/gpu/drm/arm/hdlcd_crtc.c
-+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
-@@ -110,15 +110,15 @@ static int hdlcd_set_pxl_fmt(struct drm_crtc *crtc)
- 	 * pixel is outside the visible frame area or when there is a
- 	 * buffer underrun.
- 	 */
--	hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->red.offset |
-+	hdlcd_write(hdlcd, HDLCD_REG_RED_SELECT, format->blue.offset |
- #ifdef CONFIG_DRM_HDLCD_SHOW_UNDERRUN
- 		    0x00ff0000 |	/* show underruns in red */
- #endif
--		    ((format->red.length & 0xf) << 8));
-+		    ((format->blue.length & 0xf) << 8));
- 	hdlcd_write(hdlcd, HDLCD_REG_GREEN_SELECT, format->green.offset |
- 		    ((format->green.length & 0xf) << 8));
--	hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->blue.offset |
--		    ((format->blue.length & 0xf) << 8));
-+	hdlcd_write(hdlcd, HDLCD_REG_BLUE_SELECT, format->red.offset |
-+		    ((format->red.length & 0xf) << 8));
- 
- 	return 0;
- }
--- 
-2.7.4
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
index 4b1aaa0..f765661 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
@@ -1,5 +1,3 @@
 # Machine specific configurations
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/linux-arm64-ack-4.19:${THISDIR}/files:"
-
 require linux-arm-platforms.inc
-- 
2.17.1

