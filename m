Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web11.8785.1602060927043584926
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Oct 2020 01:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o1wzwUaf;
 spf=pass (domain: arm.com, ip: 40.107.8.78, mailfrom: lakshmi.kailasanathan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=063zm/wVYyj3tXLDDSH9VUmWUXsECGvKfUrT0P2mrRc=;
 b=o1wzwUafhPiVikSBSrYsd4NaQcYlNKIZT3hKeEeAso/BAT47UmViMtavmh3PYUcJNAIUm+2Uv3yecYc4x0YQLblKaCqEZ4GlZ+FT0cR/P/ymIM0MWypZo069KqdbV9Ud6UvGNNGajhKBJgiFaxCNAnCtTzVhesljrCt+A9Lj4ZQ=
Received: from AM6PR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::39) by VI1PR0802MB2141.eurprd08.prod.outlook.com
 (2603:10a6:800:99::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 7 Oct
 2020 08:55:24 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::31) by AM6PR01CA0062.outlook.office365.com
 (2603:10a6:20b:e0::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend
 Transport; Wed, 7 Oct 2020 08:55:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Wed, 7 Oct 2020 08:55:23 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Wed, 07 Oct 2020 08:55:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd616303eff4525d
X-CR-MTA-TID: 64aa7808
Received: from 75b6785e0d84.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 01F3FF56-4F77-47EB-B0DB-6BF2D85A5D49.1;
	Wed, 07 Oct 2020 08:55:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75b6785e0d84.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Oct 2020 08:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rtc65GgnCiZHc5R2Cc7pu+1FyykJ3/TCbhqsDBp88oQzNv1k3A6onw+UTj2gATol53B32YXxtu5Nk4azPiYcdgHMi+lJH2WaBM6xvHhnaIKLtxZ7w2xc3N/C5vUJSKSNitqhMPKj4abXTOgLvBc+A/v1ZeoEvJfZeaYID52Ok+KAJl4aQticRxdsqT7aIFa1e+jdKcLyBsYL/GYr+dj6yLBXfV45BWUbzUHZJgCbBgekmCM9xcS+01iJO9TAnJQzyKw4Nuepnor6ldULr5V+lpG9BefhduHTG68o91nKP/4GxR9RwdLq/I76A8QR31VGzvUrKkEbxAUn1SgkWL3jAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=063zm/wVYyj3tXLDDSH9VUmWUXsECGvKfUrT0P2mrRc=;
 b=NhlFr7EOwo7VDTOaNU7yxuIhaIgwfGFbjpE7oQPeYiQdmUvyRl/b6qll/HJPizTxzLI8B4opNIyqfK5WU5vkwRd9hBj+AxqY/WBz7SpzW+UMKMmnWKAb+ZnQlst7xlWtl0mNimUqQH9ti2d28AJ5+6ADbd1dlbfY3Gk1UqaLOoGfPo0aNaIK7Rzd3i9T3jRDHa8O10+78XDthY1Rhbch73Rxo9AdRFK/iI0CzTROj/BPTCZGTKoDNfAK0BVGV/lDyGj7YSR8W0LG59fyQeFe4s8WoI1OfO790R4v01O77/BZ1UUAI/UOIg3Ser2SseXsZAMLqrzGr0tpzWjUeXFhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=063zm/wVYyj3tXLDDSH9VUmWUXsECGvKfUrT0P2mrRc=;
 b=o1wzwUafhPiVikSBSrYsd4NaQcYlNKIZT3hKeEeAso/BAT47UmViMtavmh3PYUcJNAIUm+2Uv3yecYc4x0YQLblKaCqEZ4GlZ+FT0cR/P/ymIM0MWypZo069KqdbV9Ud6UvGNNGajhKBJgiFaxCNAnCtTzVhesljrCt+A9Lj4ZQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB5123.eurprd08.prod.outlook.com (2603:10a6:208:15b::23)
 by AM0PR08MB5441.eurprd08.prod.outlook.com (2603:10a6:208:17d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 7 Oct
 2020 08:55:05 +0000
Received: from AM0PR08MB5123.eurprd08.prod.outlook.com
 ([fe80::a119:73e2:d24:afe8]) by AM0PR08MB5123.eurprd08.prod.outlook.com
 ([fe80::a119:73e2:d24:afe8%5]) with mapi id 15.20.3433.046; Wed, 7 Oct 2020
 08:55:05 +0000
From: lakshmi.kailasanathan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
Subject: [PATCH] arm-bsp/corstone700-mps3: Enabling NXP ISP1763 USB host controller in linux
Date: Wed,  7 Oct 2020 09:54:55 +0100
Message-Id: <20201007085455.26838-1-lakshmi.Kailasanathan@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::34) To AM0PR08MB5123.eurprd08.prod.outlook.com
 (2603:10a6:208:15b::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123856.arm.com (217.140.99.251) by LO2P265CA0454.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend Transport; Wed, 7 Oct 2020 08:55:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fb6286a4-a93f-4a88-0169-08d86a9eba56
X-MS-TrafficTypeDiagnostic: AM0PR08MB5441:|VI1PR0802MB2141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB21413B36573356D9FC3120B6FC0A0@VI1PR0802MB2141.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VAdH91/hZqqKljmtqYAX9iT4QkrxLAQHxB+7eL1tyo98z4rgZqLQYQ847HPenAWq0/GpNwOc2gC0yLg40bTNLcGrr+Sr3u7sIv0pinUpoA9UcWyt7mjhntIpe2Tl5FDEAlm6ne6BeAML3OnuCUbqZKg10fNlT+j/BJj+DuJkTzxxomxpIp7nZ67vLUN30AHoiEt2pAbbrzWl+NugjyHKhlk1JeAvdvnvb3eSBy9DD9oNliQfxE12l0AVYD2Wcs1x4qc8RxWB5Ri1w57WLaXXmZzDrm6LGpi4VgxESw5se2UC6RGmecrNnCj5DmTZyY0gx5jULPGHrTkM/x67NQcp7w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB5123.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(66476007)(6666004)(66556008)(4326008)(52116002)(8676002)(7696005)(6486002)(8936002)(5660300002)(956004)(478600001)(2616005)(316002)(86362001)(2906002)(83380400001)(36756003)(6916009)(26005)(66946007)(186003)(1076003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 iiFRTG47aUFBMIdI/9/ZlqJmcFT9xgdtehZW79A9e65Q2io9nJB19HKHTnGZOy0l+CVZCh8QcdJ/M+VvyEzYOdR8r5cD5JSzos8bjnh4Ap1E/2zC8tBfBXXNpT1El3sfpFYW2+isCE7iPcLM5E4AgJja5kHrfLyTMfHEK/XkNknZXxuGLys/xoUG9Efa6l/E2PHLQ2Txt3RsqXpmUL4Kand/DMn8c80Zusy5EDDAUhbbalWJHsk3XAQUZnb1gKjbwILKyEeNJmPYKZCYOBTjNWn+jexA6tGbJu+QqAu7ZkgJJOiJy1POdgP4gkNgpnIu0lqTm34sJNEW0BSeu20KNUUKYwrLIsOpqTbgu4k6+tbB0HJ/hQMQr17mAv6r8Fp+Rt9n+HiIraDr1vejRrTvPZ6Hyve+cubxxo8L5YAvqtN1kJRha7aCjrhDMNlIIYV3Pd3r1I5DDZh+arPV4FQ0GHVV9Y8s7cKMOlzBvfDrPgQsTQzaKNt1FIGFuzFANvjIUNcT1nRGv2gZGNImlVzDvf3pLua8sQ0rSdHYr1IH2hFVZYn+zmJGMtMwFhlmX75KZDMOlUhf8TvJIHDFLRGF7mNjBLe+pvzWc03AzjMdqju9dPF4LRvsTxNaB9FWh23OSmK2Gs74E5D8h83RxPWnRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5441
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Lakshmi.Kailasanathan@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bc57dee6-ea6d-4c4a-4564-08d86a9eaf07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LGsws8xlgldX2/PmLBVtNs3yaB+UaYScWTB06LFNNL/NBqFu/kBSL/Cqte3yRyJW9JMprdmoRbpcZbLxKhYCfYTWQQ7s96afr2h6OUr4qR26l+xgM47Q1uZP/RlnqA2fqegKKM2lcOVo18O8GE9I8BVznKmRuEpyBERdR3Q5BotDSX7H4ONp7rBozzUtMJDk7ye9uFI1/Hlvs42+aQWujCtQNJhlTfYVzDYfWHsYYoqlam5REDiGELyhQYtsxIbWkrZE5nQIh8lw915NfpSmeWg5KM/c05RSufERHZZSyHMkgaJ0FaGXwMD/LxamhbU6cYvNSbwxq8w2WF2YxCTbIyX6ZRogTqVTv6ehVF6ICX89SLRDREyyNTZ0i79Advj+ciabiiBTOCE5cJ6l4AG7FA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(46966005)(316002)(1076003)(336012)(6666004)(478600001)(86362001)(2616005)(5660300002)(6916009)(956004)(8676002)(83380400001)(6486002)(82740400003)(356005)(186003)(81166007)(16526019)(70586007)(26005)(36906005)(82310400003)(4326008)(2906002)(7696005)(47076004)(70206006)(8936002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 08:55:23.5361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6286a4-a93f-4a88-0169-08d86a9eba56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2141
Content-Type: text/plain

This commit adds  usb host in the v5.6 kernel as a machine feature
to support the USB host controller and mass storage for MPS3 board.
The kernel binary size increase with this hence wks file updated.
The node for USB controller is added to device tree in the TF-A and
updated the sha to reflect it.

Change-Id: Iad3348f8dc599d5642ddfa0c5199485eeaca0991
Signed-off-by: lakshmi Kailasanathan <lakshmi.Kailasanathan@arm.com>
---
 meta-arm-bsp/conf/machine/corstone700-mps3.conf           | 5 +++++
 .../trusted-firmware-a/trusted-firmware-a-corstone700.inc | 4 ++--
 .../bsp/arm-platforms/corstone700/usb_host.cfg            | 8 ++++++++
 .../recipes-kernel/linux/linux-stable-corstone700.inc     | 5 +++++
 meta-arm-bsp/wic/arm-reference-image.corstone700.wks      | 2 +-
 5 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
index 88ef5c1..9aaa17c 100644
--- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -9,4 +9,9 @@ require conf/machine/include/corstone700.inc
 # MACHINE_FEATURES_remove = "eth_lan9115"
 MACHINE_FEATURES += "eth_lan9115"
 
+# default feature used: usb_host
+# add the following line to local.conf to disable the feature:
+# MACHINE_FEATURES_remove = "usb_host"
+MACHINE_FEATURES += "usb_host"
+
 TFA_TARGET_PLATFORM = "fpga"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
index 175e333..f48ac64 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
@@ -10,8 +10,8 @@ TFA_INSTALL_TARGET = "fip.bin"
 LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
 
 # TF-A v2.3 is not used because the following commit is needed:
-# corstone700: splitting the platform support into FVP and FPGA
-SRCREV_tfa = "ef93cfa3a2591084307a41e64f1cbba327310749"
+# fdts: corstone700: add NXP isp1763 node to device tree
+SRCREV_tfa = "a6f65b11529b618ff04017f64054dc661c489068"
 
 PV = "2.3+git${SRCPV}"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg
new file mode 100644
index 0000000..de4752e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg
@@ -0,0 +1,8 @@
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_USB=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_ISP1760=y
+CONFIG_USB_ISP1760_HOST_ROLE=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_MASS_STORAGE=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
index 95a8bab..975a93f 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
@@ -59,4 +59,9 @@ KERNEL_FEATURES_append_corstone700-mps3 = " \
                          'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
                           bsp/arm-platforms/corstone700/eth_lan9115.scc', \
                          'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
+                          d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'usb_host', \
+                         'bsp/arm-platforms/corstone700/usb_host.cfg', \
+                        '', \
                           d)}"
diff --git a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
index 39c70ce..af03b05 100644
--- a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
+++ b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
@@ -19,4 +19,4 @@ part --source rawcopy --sourceparams="file=fip.bin-corstone700" --no-table --ali
 part --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/arm-reference-image-${MACHINE}.cramfs-xip" --no-table --fixed-size 2
 
 # Rawcopy of the kernel binary
-part --source rawcopy --sourceparams="file=xipImage" --no-table --fixed-size 3
+part --source rawcopy --sourceparams="file=xipImage" --no-table --fixed-size 4
-- 
2.17.1

