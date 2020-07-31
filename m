Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web12.16204.1596193936024348307
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 04:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5Y2V7Tg7;
 spf=pass (domain: arm.com, ip: 40.107.6.56, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMH6c/ayGgtjKTPsJ/GamCPTcfUK6Gz9AvbIrmrFzBY=;
 b=5Y2V7Tg759wo1lErgh4TYI9wORKFOnr/l81Oe6jbnYQAIC4QfNM21iRpiSGNMfgDZGBRHrvcPVXhgZz2gm0D4SHmK9qqKXiZuuiz/aEGSgEaTC+hXUPqUKw3a75FHajmwYQElEGelNNRHElTKO/2FJ6SYEG9kuCDixNd5B4tW7Q=
Received: from AM0P190CA0013.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::23)
 by HE1PR0802MB2441.eurprd08.prod.outlook.com (2603:10a6:3:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 31 Jul
 2020 11:12:13 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:190:cafe::67) by AM0P190CA0013.outlook.office365.com
 (2603:10a6:208:190::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 11:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 11:12:13 +0000
Received: ("Tessian outbound 7de93d801f24:v62"); Fri, 31 Jul 2020 11:12:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0889966a872fb8f1
X-CR-MTA-TID: 64aa7808
Received: from 4f45adb5327b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 05C53A72-9BBE-4657-8047-08838C175634.1;
	Fri, 31 Jul 2020 11:12:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f45adb5327b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Jul 2020 11:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diVXqt72YhfwTb+YbESGNHNwmZcddpo7MhKBeHa7+bAyJXpQJRpSnbHt7/D4tIishVIsaVhISXuJFAWgfi6UuPTWUTk1D6j2avwN9KOGGPGZTp2VuRxu/2XjdaAIEL4v68Z04Rtfk5hT3GL6Qt9EM7dDWNG9UoSTxup8fOaMCwtalyy8JFamitN6mRTo6hxGP+VA7DiQek1iZSg89YqFM4NYodVXNRsZXJ3NFaAkS5k54GksBW8BFc7tHXKjiRTZ5I3o1+Hi0J+09tJtOxSBTdmmfa+MLJygcj7uxRTSPQ2cwRkmj66Y9VydhSCqU+npXm6OlOkPPnOIhTQnWVXQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMH6c/ayGgtjKTPsJ/GamCPTcfUK6Gz9AvbIrmrFzBY=;
 b=ghaFv40DYXA3344Hgv5ZqU1SzB9c3wGWLWEG+pMTk3tEcZfsr4fmNPB9/9zi4QCefSeX+LD5eUXg7Z5kG75Ggrp6n8LXh5gZlh54z5zVYb3ab7kb6lZR0TadKYBJSLCn8pf9IX1T48O9ALH7EMtDvd1+J2dGVj+ZaYwt4UzJgw2sARgG+xDjhtrZJHJKDLJGZz1WidcoahJrBD+/zAw+PE53UM8Uo1FH8ctoU9dm1K/2jM4HPviMVnuYw/HlIxCH17VO/gmbFo5vnJhSeU6QlB3xrDLFT1o+0zud1OTMaingw3fpJS81JSvj4zx0nAz99ROtalNKF2RHX73/nZBrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMH6c/ayGgtjKTPsJ/GamCPTcfUK6Gz9AvbIrmrFzBY=;
 b=5Y2V7Tg759wo1lErgh4TYI9wORKFOnr/l81Oe6jbnYQAIC4QfNM21iRpiSGNMfgDZGBRHrvcPVXhgZz2gm0D4SHmK9qqKXiZuuiz/aEGSgEaTC+hXUPqUKw3a75FHajmwYQElEGelNNRHElTKO/2FJ6SYEG9kuCDixNd5B4tW7Q=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4050.eurprd08.prod.outlook.com (2603:10a6:208:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 11:12:06 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 11:12:06 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2] arm-autonomy: Move gem5-arm64 to dynamic-layers/meta-gem5
Date: Fri, 31 Jul 2020 12:12:05 +0100
Message-Id: <1596193925-20213-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 11:12:05 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cd9bd7f5-c4fc-4f61-4e3e-08d83542937f
X-MS-TrafficTypeDiagnostic: AM0PR08MB4050:|HE1PR0802MB2441:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2441E11A6E43C3A4579B9A66924E0@HE1PR0802MB2441.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Cq1kzDgHnCOM6YOslroW/ivQoA40oxjQY1BYqNpCde0lV6OwojWVCCt3AxkNQa4W+GevHmF+IvKl+yGM335dwgBYiJ9fUzvKoOV9yoAhAMMptfJHTDkLCemDMur/tqC02Q15tgrgN5z7cZK1w2aAbMPYnU7vU45EDFa9E0kSt0YvcVymDkGRmiJ3JfkbpvpbqTz+nQRQp8ZygZAtI3E54KMfMy0CfRvyHASnz5tu+vodLOW35z78lb/LD4dVBdA1qK6SpkSAzJhPTqFxE7zl4AuPFyDkMEJ9/O2mXGnBeUCbuAzqjgOz05K63V1WaHLE/FkwONCt+M7hQiaJPWPshwpJddkFDXJblK3ODXPrOVjIk0AhKtol5lnCEX/sjkgc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(5660300002)(30864003)(8676002)(86362001)(8936002)(316002)(6486002)(66946007)(66556008)(66476007)(186003)(16526019)(26005)(956004)(2616005)(44832011)(6916009)(478600001)(4326008)(2906002)(52116002)(7696005)(36756003)(83380400001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 HiM/ZyP8/spW6RB2T2xOV6eqch3v5hcF3VRj9TT9eiv8lfSINwZr+SseCwjZWN70ffdJ3xc9DJCp31nyttaA4TiYBY8wSAy+4VB9ssS8xY7aSGo6TIu3V3jTQfm+K+JEgf7GH5JskQ1lyqku+0ozffq9G2SIU0vVTHA4JBPththyiVzA1TJVNilIHAlIyKS50Vks2NuaqjFbQdKy1eVLamMo3M1a+Tmh5BEJsNFBs3tcTNWZ2J51iN+/tUnUompefTHALLx9e1i8EAJXzbpQx24BWUi9Ia0KqiLYU68qYwvDFL/+hKCDk9CmBTRzinn0WYAdBdBWpIxeNnrgolNcQO2s4QHhHJy17/MeLzjoorXOw/x1SeTxIB/BvYueBqayFo/uQYIArm9yYOGkJvJowHZTsUIQ2S3Glogw6xQtaWNVRKu67G5Rnjz1pkKTbQJm9esXuvF9k+fAFBBfSfvk+jHz6W+xMNTuP38NAMnYatm3lfi0wS1qUI0Z6iUyhVFFTU5szSMNGcytv+A21VMr9YkyStcOIt1J4eziEgNy8qMir3WHx5M+xjb455mth4NNIUsItQ23jF6PJq+F5a6l8+rnZdKQdbiHDPXNgNfPKZqD0brOpPGHOryF9YHLbpFSICH6RrqNn31GCaFKarDsfg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4050
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5fe3b55b-439c-4ff4-7984-08d835428f18
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2pxHxeZxWfk01PtraJtF7EyPj5ZldsWLzY5Pt4+VTrLEyMAQNQ/mSTFwwjb0yHjjmGYKycv9EkUEMqdCJkuMSNnEsr53uEriJZ+K6QrJu6LVE6RRpxcp4UAxRLz+l9eSGpAh7N2KYeFaMt2Pdb5c//q6rUcSSo1pZInzx+VNUpFeKaymIWizb43TbRyDXZLzxas0q/3WZ15jlEIK4rerZppJQ0gnWqL3Ml+QhjO6RKn7Wv4v9xBqxhNMdPJql6ikRwz5vqLAG4IyHpOr5t4cECdT2DIVDd7zHvun6ma96AqvRecoWiq8Zy2H4l4DhZPgnNJ/EfoNNCowwzEmvD4wPpacfuxaOMSLIUHMv0J2dfGIQwmLfR749p66DgbkfbaDF3TUO0dIv8shgi4DHDLebD+qKKizx5iL8xq31uMR/ic=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966005)(82740400003)(2616005)(82310400002)(47076004)(36906005)(81166007)(70586007)(4326008)(336012)(70206006)(316002)(356005)(956004)(83380400001)(44832011)(26005)(6916009)(2906002)(86362001)(8936002)(7696005)(6486002)(478600001)(30864003)(186003)(5660300002)(8676002)(16526019)(36756003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 11:12:13.0109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9bd7f5-c4fc-4f61-4e3e-08d83542937f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2441
Content-Type: text/plain

Since gem5-arm64 machine implementation was moved from meta-arm-bsp to
meta-gem5, we need to move the specific machine settings to
meta-arm-autonomy/dynamic-layers/meta-gem5.

Change-Id: I773189e7e1ee2ca77e569dcec2d92ecfb93d3719
Issue-Id: SCM-1133
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/conf/layer.conf                  |  1 +
 ...ap-the-number-of-interrupt-lines-for-dom0.patch | 44 ----------------------
 .../recipes-extended/xen/xen_%.bbappend            |  5 ---
 .../xenguest/xenguest-network.bbappend             |  2 -
 .../recipes-kernel/linux/linux-%.bbappend          |  1 -
 .../boot-wrapper-aarch64_%.bbappend                |  0
 .../meta-gem5/recipes-extended/xen/xen_%.bbappend  |  2 +
 .../xenguest/xenguest-network.bbappend             |  1 +
 .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 ++
 .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
 .../recipes-kernel/linux/linux-%.bbappend          | 15 ++++++++
 11 files changed, 26 insertions(+), 52 deletions(-)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
 rename meta-arm-autonomy/dynamic-layers/{meta-arm-bsp => meta-gem5}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 5c13596..2b9e94d 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -31,4 +31,5 @@ USER_CLASSES_append = " arm-autonomy-features"
 
 BBFILES_DYNAMIC += " \
     meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
+    meta-gem5:${LAYERDIR}/dynamic-layers/meta-gem5/*/*/*.bbappend \
 "
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
deleted file mode 100644
index 792bc9e..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a41feccdb6c03f12bddb4fb650a0465f0ed6eeca Mon Sep 17 00:00:00 2001
-From: Lukas Juenger <juenger@ice.rwth-aachen.de>
-Date: Fri, 5 Apr 2019 15:54:04 +0200
-Subject: [PATCH] xen/arm: Cap the number of interrupt lines for dom0
-
-Dom0 vGIC will use the same number of interrupt lines as the hardware GIC.
-While the hardware GIC can support up to 1020 interrupt lines,
-the vGIC is only supporting up to 992 interrupt lines.
-This means that Xen will not be able to boot on platforms where the hardware
-GIC supports more than 992 interrupt lines.
-While it would make sense to increase the limits in the vGICs, this is not
-trivial because of the design choices.
-At the moment, only models seem to report the maximum of interrupt lines.
-They also do not have any interrupt wired above the 992 limit.
-So it should be fine to cap the number of interrupt lines for dom0 to 992 lines.
-
-Signed-off-by: Lukas Juenger <juenger@ice.rwth-aachen.de>
-Acked-by: Julien Grall <julien.grall@arm.com>
----
- xen/arch/arm/setup.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
-index 444857a967..ccb0f181ea 100644
---- a/xen/arch/arm/setup.c
-+++ b/xen/arch/arm/setup.c
-@@ -888,7 +888,13 @@ void __init start_xen(unsigned long boot_phys_offset,
-     /* Create initial domain 0. */
-     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
-     dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
--    dom0_cfg.arch.nr_spis = gic_number_lines() - 32;
-+    /*
-+     * Xen vGIC supports a maximum of 992 interrupt lines.
-+     * 32 are substracted to cover local IRQs.
-+     */
-+    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
-+    if ( gic_number_lines() > 992 )
-+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
-     dom0_cfg.max_vcpus = dom0_max_vcpus();
- 
-     dom0 = domain_create(0, &dom0_cfg, true);
--- 
-2.17.1
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
index bdcb75f..5e58ab1 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
@@ -2,7 +2,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 # Machine specific settings
 XEN_CONFIG_EARLY_PRINTK_juno = "juno"
-XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
 XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
 XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
 XEN_CONFIG_EARLY_PRINTK_n1sdp = "pl011,0x2a400000"
@@ -22,10 +21,6 @@ COMPATIBLE_MACHINE_juno = "juno"
 
 SRC_URI_append_juno = " file://juno/defconfig"
 
-# Gem5 support
-# Fix problem with number of interrupts on gem5
-SRC_URI_append_gem5-arm64 = " file://4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
-
 # N1SDP support
 COMPATIBLE_MACHINE_n1sdp = "n1sdp"
 
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
index de88cce..1efd7c6 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
@@ -4,7 +4,5 @@ XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?= "eth0"
 
 XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?= "eth0"
 
-XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?= "eth0"
-
 # Juno board has 2 network interfaces, add both of them to the bridge
 XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
index 189645a..5231f51 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
@@ -12,6 +12,5 @@ LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURE
                                          'arm-autonomy-host arm-autonomy-guest', \
                                          ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
 
-KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
 KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
 KERNEL_FEATURES_append_foundation-armv8 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
new file mode 100644
index 0000000..9e7ba45
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
@@ -0,0 +1,2 @@
+# Machine specific settings
+XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
new file mode 100644
index 0000000..0283702
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network.bbappend
@@ -0,0 +1 @@
+XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?= "eth0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
new file mode 100644
index 0000000..7e87cab
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
@@ -0,0 +1,4 @@
+# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
+# Linux kernel with a coredump while trying to access ZEN bit of CPACR1 core
+# register.
+# CONFIG_ARM64_SVE is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
new file mode 100644
index 0000000..6bc769c
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
@@ -0,0 +1,3 @@
+define KFEATURE_DESCRIPTION "Disable SVE support"
+
+kconf non-hardware disable-arm64-sve.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
new file mode 100644
index 0000000..0d0047a
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/linux-%.bbappend
@@ -0,0 +1,15 @@
+FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}:"
+
+#
+# arm-autonomy kmeta extra
+#
+SRC_URI_append_gem5-arm64 = " file://arm-autonomy-kmeta-extra-gem5;type=kmeta;name=arm-autonomy-kmeta-extra-gem5;destsuffix=arm-autonomy-kmeta-extra-gem5"
+
+# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
+# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
+# register.
+LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE_gem5-arm64 = "${@bb.utils.contains_any('DISTRO_FEATURES', \
+                                         'arm-autonomy-host arm-autonomy-guest', \
+                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
+
+KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
-- 
2.7.4

