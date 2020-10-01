Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.44])
 by mx.groups.io with SMTP id smtpd.web12.2623.1601568506016246936
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Oct 2020 09:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GL2yMNbs;
 spf=pass (domain: arm.com, ip: 40.107.8.44, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFc2kdYr8t3PZj1tNKX7/mqZcCQo6t1qNQwMyCLWTDo=;
 b=GL2yMNbsF9E+PKNnKVt9XFopd9J/Xsh5OCNAuFxoQY272jqotvUcMWUyApwhZsV33wXmyL9vrlFYL4bH3G86jdPTUiYJ3Q47YtJ44kJ3j7g6B8nzT8FZAm2IFL+fK4eMKRu48fd3S2Uh4QtQ8KCTfXu82BU6m6pR5Lap4s/flII=
Received: from AM6PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:2e::42)
 by AM6PR08MB3960.eurprd08.prod.outlook.com (2603:10a6:20b:ad::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Thu, 1 Oct
 2020 16:08:22 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::ed) by AM6PR05CA0029.outlook.office365.com
 (2603:10a6:20b:2e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Thu, 1 Oct 2020 16:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:08:21 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Thu, 01 Oct 2020 16:08:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1fe0d953ee94110d
X-CR-MTA-TID: 64aa7808
Received: from f24ef815694c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 59D1B2C7-2582-452F-BBC9-E21FF4F1E211.1;
	Thu, 01 Oct 2020 16:07:43 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f24ef815694c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Oct 2020 16:07:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvnL2vPrfR0jixypSWTYTLb49XF9TbdtTnsOxZ9liwxWMEQf73wu/Ojca4ocr1ctQfUG40FjIWeoHdoTylSlIMJ+4L33LkccUD/KRx5fRidMmgKzMOiYiHBDr/Wiygmr2DjdDC9N2KDxxZ+zZn7OE55hCSKcIJkjO2qJ4hN1Bz/jx36m0eXma+aH+tUO7guQlkUA+mV9EUbVXUwvy8UTweP+TbIzK3gwEoUV5/Z/s5gp2izW4FjPWQbm4UBRx6HFYnH0nEUSKqp2vhrkOHrItsMId+D9iZvX+Adfsu6yrtSgAWcmKcgN+hTmZVWX/1+ZaI9nDrkH5rsfJ2UxMMm2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFc2kdYr8t3PZj1tNKX7/mqZcCQo6t1qNQwMyCLWTDo=;
 b=XNY0is7TU+XWDDYECKmUBE6wtf3jrlSK88qUBxYfMrPXdQ5jH4dekCl9zUM9JCtemL+mDcvcGGPDtYcDnc4+Ajn6zJ513diHnoGyw54tu2cK20bzHIov5iloCJWzmBVfGeGG+f84onrWJy1DAQUs6eJ3CnJOWaxOeanb6gem/CcpzgUbiKU51asfM7kiM01w9I2O3f65Cy1MFhPMIuQSV4y8cUI59vevfDqdlJV8W/zSsdIfo1sacEeS4i4eSga0qkDCbfzn94hqwMxtIbqn4D5fUFX7ttggoY3ZUDAMgpc6F8N95GbD05A+7vIQBPZ1lwBAPlL0lqfJjR50L9012w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFc2kdYr8t3PZj1tNKX7/mqZcCQo6t1qNQwMyCLWTDo=;
 b=GL2yMNbsF9E+PKNnKVt9XFopd9J/Xsh5OCNAuFxoQY272jqotvUcMWUyApwhZsV33wXmyL9vrlFYL4bH3G86jdPTUiYJ3Q47YtJ44kJ3j7g6B8nzT8FZAm2IFL+fK4eMKRu48fd3S2Uh4QtQ8KCTfXu82BU6m6pR5Lap4s/flII=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3559.eurprd08.prod.outlook.com (2603:10a6:20b:48::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Thu, 1 Oct
 2020 16:07:41 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3412.028; Thu, 1 Oct 2020
 16:07:41 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] arm-autonomy/wic: Deploy Xen related artefacts in the wic boot partition
Date: Thu,  1 Oct 2020 17:07:38 +0100
Message-Id: <2722b0a055731bd2367ea9f8881ba986e88084db.1601568289.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <f01f29dba132ba93d6fc85f87257f2a581b1ee98.1601568289.git.diego.sueiro@arm.com>
References: <f01f29dba132ba93d6fc85f87257f2a581b1ee98.1601568289.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LNXP265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::32) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LNXP265CA0068.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3433.34 via Frontend Transport; Thu, 1 Oct 2020 16:07:41 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6c5c4b23-2fbb-4ae9-b6a2-08d866243817
X-MS-TrafficTypeDiagnostic: AM6PR08MB3559:|AM6PR08MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB39601708BCB6C61320DA3BDF92300@AM6PR08MB3960.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 egKplO07EmwuqWN2Z3tnMGjzvncXEw/Q0f7grriI4BPnEVb8baPRTmQSJovSdOmjNBib7++gak2oeaHFtBV557Nuo+qZhXva98nmBMw6NqAyl3DI7GPf0iezx2u+ILe/Y07E3j7NrI0Sne3t+zQ5YeAkFbabtXICS+SnGBembcMHtU2nfbAfALX2bUEkUFz+DtpKHRQF2zzwa5Rdk0KCOCIe/FF+p3sEh0sC5x1+9Bq+dsIWUeHRUNvCPz5ndiJMpkzXiVGj9Tmocv6ASsnQqwyU8y6Mvl1Xfqf9py2FKGSMCj8RTKRcfTBXSfpFcHN3XI4vFMcfIeaE/yOK4w2QhQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(376002)(396003)(346002)(4326008)(2906002)(2616005)(83380400001)(8676002)(8936002)(956004)(6486002)(478600001)(86362001)(316002)(44832011)(6666004)(7696005)(26005)(36756003)(52116002)(16526019)(186003)(66556008)(5660300002)(6916009)(66946007)(66476007)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 PzzjNoGuvvjCYFYf1LAM5K1LkHxJPLvclyqWOAqljyh4bTp1lF7tlbeKSHY1xADj8zMvSt/zg02tsyqiYPoYObIXrd+UYk7LiUrfR2HIsmPsRiasuhO3qPUuDIhP+A9sZLYBS6ntn5YRQaLvRZlS74FITs9/wZexeEYPun1mO2ke+cSf9g0Q1VjSm2oQGQCp1ls/Y7VRnfUT4HKFvqMdog5/yIYKg4HTIcVzLVabCGqgjFquMvwPiyj1hUFMuy1D+hMTYa5a/ybP9siGJMRZu+PQG/CqnNR8phQKha2VAdeBBHV1zddwfpFbg0lts0yEZxxzWp9si1suQdMOXeE+9xAZgItNSj3BHA0zphXpuGesY2df5RGe5L+hzpkI0m2fxkPgEtZgmnRBUXWZV5tU42R96inM3TbJZWpQYQYw1mq1EiOnO1O1Ml9j0V1ykm5SBV7XbC5VCR/z2UaDbRznUY6uGOQwXVGK7GD6B/WK+YI2AKuelzx3cnToY7o7leuDvBwN9IE07QXL5qqWYTyLv1cpf+SsH/mhzAthF+ZZ5yeQpnSzk7Aancgs1EvJR/th/+CgJL50dMLgzoYAy+RQLSARtKCwQkaGXAVr6BakPk2QX2zJ5C0nICl3OBRUW6MxAALAZx0sxd4CfGEApmMggA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3559
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	37124e61-1ad2-4704-3715-08d86624200c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qJM4RaRXPQDKZvYn1/VtpHWRfmbs3x18Cpp56wRcg7QvSkJzWXFUhd2Ng7OYet4Edt33IbeGEP3FSD8PRoW4r9V3tHwGUDcCjtiMVwV6vQcuKcRstL6T91QVb+OaTXVp1ePKYJHFgHM+x8e6bwGLpXqKksKl7I3/Hd3XmRYosvpE8+iPwuuLPaB2ldAoBqAB2SN5jeRDcCMbmqo9u3QO7WIeddKP0YBhcwyXKcQ1fYW+KpcPYbXV6KTyrYoOxM3NS+28WogeGtG0CjVSwwbzcsMsnxZkhCzz9vNpZwcqI6wxjV5HNQIg7shgVsmHgRLSAUPWxuF2wI6kfbVIN0m4AfsvwWIyryPffKG9GfcuoAWqhLv8WaADNizEedgYd11DfycUqFqXbGz/gedj8eW6Xw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(46966005)(44832011)(6916009)(30864003)(2906002)(316002)(8936002)(36756003)(86362001)(186003)(478600001)(6666004)(336012)(956004)(2616005)(26005)(36906005)(16526019)(70206006)(47076004)(82740400003)(356005)(82310400003)(81166007)(83380400001)(4326008)(5660300002)(8676002)(7696005)(70586007)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 16:08:21.7359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c5c4b23-2fbb-4ae9-b6a2-08d866243817
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3960
Content-Type: text/plain

This patch brings the following changes:
* Documentation about how to customize the wic image for N1SDP
* Introduce a custom wks and grub.cfg file for N1SP when building with
  `DISTRO_FEATURES += "arm-autonomy-host"` to include Xen artefacts and boot
  option.
* Introduce a mechanism to include extra global settings for machines defined
  in meta-arm-bsp when building with `DISTRO_FEATURES += "arm-autonomy-host"`.

Change-Id: Ic9f36bae3bf04df1ee6a6c543e812f27c5c537a0
Issue-Id: SCM-1065
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../conf/distro/include/arm-autonomy-host.inc      | 11 +++++++
 meta-arm-autonomy/conf/layer.conf                  |  5 ++-
 .../documentation/n1sdp-image-customization.md     | 29 +++++++++++++++++
 .../arm-autonomy-machine-extra-settings.inc        |  5 +++
 .../conf/machine/n1sdp-extra-settings.inc          | 36 ++++++++++++++++++++++
 .../xen-devicetree/xen-devicetree.bbappend         |  4 +--
 .../wic/arm-autonomy-n1sdp-efidisk.wks.in          | 14 +++++++++
 .../meta-arm-bsp/wic/arm-autonomy-n1sdp-grub.cfg   | 28 +++++++++++++++++
 8 files changed, 129 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-autonomy/documentation/n1sdp-image-customization.md
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-grub.cfg

diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
index fcebd2d..822677d 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -12,3 +12,14 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= ""
 # Until we don't move to use the kea dhcp-server we build dhcp_4.4.2.bb recipe
 # which depends on bind_9.11.22.bb recipe.
 PREFERRED_VERSION_bind ?= "9.11%"
+
+# Require extra machine specific settings from meta-arm-bsp dynamic-layers only
+# if meta-arm-bsp is in the bblayers.conf
+# Directory for meta-arm-autonomy/dynamic-layers/meta-arm-bsp machine extra settings
+ARM_AUTONOMY_ARM_BSP_DYNAMIC_EXTRA_CFGDIR = "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/conf/machine"
+ARM_AUTONOMY_MACHINE_EXTRA_REQUIRE ?= \
+"${ARM_AUTONOMY_ARM_BSP_DYNAMIC_EXTRA_CFGDIR}/arm-autonomy-machine-extra-settings.inc"
+
+require ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-arm-bsp', \
+                             '${ARM_AUTONOMY_MACHINE_EXTRA_REQUIRE}' , \
+                             '', d)}
diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 2b9e94d..5a439e2 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -23,8 +23,9 @@ LAYERSERIES_COMPAT_meta-arm-autonomy = "dunfell gatesgarth"
 # otherwise the user will see a warning on each build.
 SKIP_META_VIRT_SANITY_CHECK = "1"
 
+ARM_AUTONOMY_LAYERDIR := "${LAYERDIR}"
 # Directory of our distro config files
-ARM_AUTONOMY_DISTRO_CFGDIR = "${LAYERDIR}/conf/distro/include/"
+ARM_AUTONOMY_DISTRO_CFGDIR = "${ARM_AUTONOMY_LAYERDIR}/conf/distro/include/"
 
 # Add class to handle arm-autonomy distro extensions
 USER_CLASSES_append = " arm-autonomy-features"
@@ -33,3 +34,5 @@ BBFILES_DYNAMIC += " \
     meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
     meta-gem5:${LAYERDIR}/dynamic-layers/meta-gem5/*/*/*.bbappend \
 "
+# Root directory for the meta-arm-autonomy/dynamic-layers/meta-arm-bsp
+ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR = "${ARM_AUTONOMY_LAYERDIR}/dynamic-layers/meta-arm-bsp"
diff --git a/meta-arm-autonomy/documentation/n1sdp-image-customization.md b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
new file mode 100644
index 0000000..9e4186c
--- /dev/null
+++ b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
@@ -0,0 +1,29 @@
+Customizing Arm Autonomy Host image layout for N1SDP
+====================================================
+
+When buiding with `DISTRO_FEATURES += "arm-autonomy-host"` the user can
+perform a couple of customizations in the generated wic image:
+
+1. Set the guest partition size (default: 4iG) via `GUEST_PART_SIZE` and
+   `GUEST_PART_SIZE_UNIT` (M or G) variables to be set in any conf file. The
+   value of these variables should be aligned with the sum of all
+   XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metadata is
+   1 MiB per physical volume, hence it needs to be taken into account when
+   setting GUEST_PART_SIZE.
+
+2. The wic image partition layout and contents with a custom wks file via
+   `ARM_AUTONOMY_WKS_FILE` variable (default:
+   arm-autonomy-n1sdp-efidisk.wks.in which is affected by GUEST_PART_SIZE,
+   GUEST_PART_SIZE_UNIT and GRUB_CFG_FILE variables).
+
+3. Custom grub.cfg file via `GRUB_CFG_FILE` (default:
+   arm-autonomy-n1sdp-grub.cfg) variable to be set in any conf file. The full
+   path or relative to `ARM_AUTONOMY_WKS_FILE` should be set.
+
+The `arm-autonomy-n1sdp-efidisk.wks.in` and `arm-autonomy-n1sdp-grub.cfg` files
+are located at `meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic`.
+
+Other variables can also be custmized to set what files need to be included
+in the wic image boot partition. Please refer to
+`meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc`
+for more details.
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
new file mode 100644
index 0000000..fc24ee8
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
@@ -0,0 +1,5 @@
+# Require extra machine specific settings
+ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE ?= ""
+ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_n1sdp = "n1sdp-extra-settings.inc"
+
+require ${ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE}
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
new file mode 100644
index 0000000..41c9433
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
@@ -0,0 +1,36 @@
+# We need to extent the wks search path to be able to find the wks file set in
+# ARM_AUTONOMY_WKS_FILE.
+WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
+
+ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-n1sdp-efidisk.wks.in"
+WKS_FILE = "${ARM_AUTONOMY_WKS_FILE}"
+
+# Set the wks guest partition size and unit. It must be aligned with the sum of
+# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metadata is
+# 1 MiB per physical volume, hence it needs to be taken into account when
+# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value is 4GiB.
+GUEST_PART_SIZE ?= "4097"
+GUEST_PART_SIZE_UNIT ?= "M"
+
+# The GRUB_CFG_FILE affects arm-autonomy-n1sdp-efidisk.wks.in file
+GRUB_CFG_FILE ?= "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy-n1sdp-grub.cfg"
+
+# From arm-autonomy-n1sdp-efidisk.wks.in, the /boot partition is /dev/sda1, and
+# the "/" partition is /dev/sda2.
+XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda3"
+
+# The XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS variables aftect the
+# xen-devicetree.bb recipe
+XEN_DEVICETREE_DEPEND = "virtual/trusted-firmware-a:do_deploy"
+XEN_DEVICETREE_DTBS ?= "n1sdp-single-chip.dtb"
+# XEN_MOD_DEVICETREE_DTBS are the generated devicetrees for Xen. By default the
+# xen-devicetree.bb recipe adds '-xen' suffix to it
+XEN_MOD_DEVICETREE_DTBS ?= "n1sdp-single-chip-xen.dtb"
+
+# When generating the wic image we need to have the xen deployed
+do_image_wic[depends] += "xen:do_deploy"
+
+# Select the extra files to be included in the boot partition
+IMAGE_EFI_BOOT_FILES += "xen-n1sdp.efi;xen.efi"
+IMAGE_EFI_BOOT_FILES += "${XEN_MOD_DEVICETREE_DTBS}"
+
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
index 91af506..8284c63 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -9,8 +9,8 @@ XEN_DEVICETREE_DTSI_MERGE_append_juno = " xen-juno.dtsi"
 # Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP
 SRC_URI_append_n1sdp = " file://xen-n1sdp.dtsi"
 XEN_DEVICETREE_DTSI_MERGE_append_n1sdp = " xen-n1sdp.dtsi"
-XEN_DEVICETREE_DEPEND_n1sdp = "virtual/trusted-firmware-a:do_deploy"
-XEN_DEVICETREE_DTBS_n1sdp = "n1sdp-single-chip.dtb"
+# For N1SDP, the XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS variables are
+# being set in meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
 
 # Board specific configs
 XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
new file mode 100644
index 0000000..d91d568
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
@@ -0,0 +1,14 @@
+# short-description: Create an EFI disk image
+# long-description: Creates a partitioned EFI disk image that the user
+# can directly dd to boot media. Uses a custom grub.cfg file to configure the boot.
+
+# First boot partition normally populated as /dev/sda1
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
+
+# Second rootfs partition normally populated as /dev/sda2
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
+
+# Third partition to accomodate guests images normally populated as /dev/sda3 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
+part --label guests --source empty --ondisk sda --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
+
+bootloader --ptable msdos --configfile="${GRUB_CFG_FILE}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-grub.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-grub.cfg
new file mode 100644
index 0000000..f4f8cd0
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-grub.cfg
@@ -0,0 +1,28 @@
+set term="vt100"
+set default="3"
+set timeout="5"
+
+set kernel_cmdline="earlycon=pl011,0x2A400000 console=ttyAMA0,115200 root=/dev/sda2 rootwait"
+
+menuentry 'N1SDP ACPI Boot' {
+    linux /Image $kernel_cmdline acpi=force
+}
+
+menuentry 'N1SDP Single-Chip Boot (Device Tree)' {
+    devicetree /n1sdp-single-chip.dtb
+    linux /Image $kernel_cmdline
+}
+
+menuentry 'N1SDP Multi-Chip Boot (Device Tree)' {
+    devicetree /n1sdp-multi-chip.dtb
+    linux /Image $kernel_cmdline
+}
+
+menuentry 'N1SDP Arm Autonomy (Xen) Single-Chip Boot (Device Tree)' {
+    # no_argumants under here is a workaround for a bug
+    # also any kernel or dom0 cmdline arguments has to be passed via dtb
+    # because any arguments put here will be ignored by xen
+    xen_hypervisor /xen.efi no_arguments=use_dtb_for_xen_or_kernel_cmdline
+    xen_module /Image
+    devicetree /n1sdp-single-chip-xen.dtb
+}
-- 
2.7.4

