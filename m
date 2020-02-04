Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web12.8595.1580833562165550848
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 08:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vqNZQ3fl;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: vineeth.raveendran@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0YzNSLh4J/bfEqIFWQcTIzGrRhp3beGKByy2QHy2Qw=;
 b=vqNZQ3flWpmFxByX1eRjhHi5V3X7kVjtpDWp/fjYHR9pUKPNgYE/ikIbAmcQKJBDj8kKlmi5R3Uj9iyOwA4JVqD05b7qdf5t+YPWfnQGaH1NKyDi+y5vmIf9C3UExfc/weYxnxy/TBY1kHEJhS+Dd7o1ZueWAGe5cX+6oKXwdNk=
Received: from VI1PR0802CA0024.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::34) by VI1PR08MB2703.eurprd08.prod.outlook.com
 (2603:10a6:802:25::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.34; Tue, 4 Feb
 2020 16:25:59 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by VI1PR0802CA0024.outlook.office365.com
 (2603:10a6:800:aa::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.32 via Frontend
 Transport; Tue, 4 Feb 2020 16:25:59 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Tue, 4 Feb 2020 16:25:58 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42"); Tue, 04 Feb 2020 16:25:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9cab38937d430690
X-CR-MTA-TID: 64aa7808
Received: from 9d91a0dbe475.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A8CB5215-F643-45C6-9BCB-66723649FBBB.1;
	Tue, 04 Feb 2020 16:25:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d91a0dbe475.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Feb 2020 16:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYaQygOe8860PFp8zyhnU1X7I0IFGBGQ6CPcLZzhv6p5JZsjKNLPm0xGGPZ2wa54cYsbgyXZZF2OV1Hu8teSj250aBGOAbCd0iPTwsrjXEJNctQplheBKdo7i7xVFIMtIvX9LfKneR0bQFyUir3WRHM3Js/+ZivXQkYbJi4/lVEzYPBkxA4R2HwaMruWiPtJJFNeC1GiSTviebbQYaPpy8zncmE58Yz1yTYoqaGakkCKWYxiZ0+f3HLnHxbGW7ny2M5pxYoyIbrOhcnvwLM+LPuWCh1is4m6FHvqna98JqFI85EJfQp7JkeFNCva2gsTHxv1RHOatnjg1Zlp3zsZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0YzNSLh4J/bfEqIFWQcTIzGrRhp3beGKByy2QHy2Qw=;
 b=lS3cCwTGkxGb/TSPw27MX9PSu7NXLil5H6sN5MIP9h+qNN6IViyIZSITzqJ0VP9gxqhw8rJ1w0SdFPCmIRySYlv1JO0RfbkpkKG66b6aI7gBEO873rzeCp9lymGbIf1ntQqCSUvw8EAIC+SgLoJh17PCQwmNu11PK/qqc14dG47Ns/n/wKxnS6lVtIx1rjqwx3eBarjMMopBsTm9M/GE2Jj7OD2RDjDXVkK0nPJGUZ3XJDD4dhu1wjs3qGPAPhFsxWNyQjCQhFnpifieiVP07Cp+CCLlmpboK5AFg8AEaF7nkhKsSCw8R7SbjFSgqn3xD8A9Haf+kdXNgDVHGZIW4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0YzNSLh4J/bfEqIFWQcTIzGrRhp3beGKByy2QHy2Qw=;
 b=vqNZQ3flWpmFxByX1eRjhHi5V3X7kVjtpDWp/fjYHR9pUKPNgYE/ikIbAmcQKJBDj8kKlmi5R3Uj9iyOwA4JVqD05b7qdf5t+YPWfnQGaH1NKyDi+y5vmIf9C3UExfc/weYxnxy/TBY1kHEJhS+Dd7o1ZueWAGe5cX+6oKXwdNk=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Vineeth.Raveendran@arm.com; 
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (20.178.15.211) by
 VI1PR08MB4494.eurprd08.prod.outlook.com (20.179.25.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Tue, 4 Feb 2020 16:25:50 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::283d:f53d:b931:4134]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::283d:f53d:b931:4134%6]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 16:25:50 +0000
From: vineeth.raveendran@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Vineeth Raveendran <vineeth.raveendran@arm.com>
Subject: [PATCH] Fix to improve boot time on Emulators
Date: Tue,  4 Feb 2020 16:25:30 +0000
Message-Id: <20200204162530.11719-1-vineeth.raveendran@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0471.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::27) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:bf::19)
MIME-Version: 1.0
Received: from e123640.cambridge.arm.com (217.140.106.50) by LO2P265CA0471.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.34 via Frontend Transport; Tue, 4 Feb 2020 16:25:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 51cd3573-9404-4177-a217-08d7a98eeb10
X-MS-TrafficTypeDiagnostic: VI1PR08MB4494:|VI1PR08MB4494:|VI1PR08MB2703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB27035423453C731241267C559A030@VI1PR08MB2703.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:238;OLM:238;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(5660300002)(2616005)(86362001)(66946007)(66476007)(2906002)(66556008)(956004)(44832011)(4326008)(6916009)(1076003)(6666004)(478600001)(81166006)(8676002)(81156014)(36756003)(8936002)(6486002)(16526019)(186003)(26005)(7696005)(316002)(52116002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB4494;H:VI1PR08MB3696.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0GxWWXTfAeZrxxhluByOzOyhcrVnMrSJCKxlUi1jgD4tOonTRNIcfWhZGIOukfrxMwceUC40fR20567wR8h72aqw/7XOrFJgg/R0noaS2JDR8yMwAfWTsajoRNKI5qzU8w9xNrQ7t8h6htDBzHmUXK42FP7vdrrlMnMOD9J6pi133JJUBcTV/iZHmAx2CTnM/hR425jx1wseGUdlYzlKNX79E9X92r6fB8pAr/cYygqLcL6mAVPEbu0VTwkwllT5Hwof15w4n1u7W0rVPQK0lmB0VM6G/uqSWgC9ozjLj2HwcF5CFuZg3C9tv90dzdjdYeHdHB8ydATdXrIv5Wbc/PavCs+nZ0RqspsjkqlQXr15eXJiFSh/FKhT3NEK+jRawY3pPqLHVwGuS7UZCaZV9G+FkZD4bvuOykaIDy2VOsUQZkSrcUusaiRMwmyITu5M
X-MS-Exchange-AntiSpam-MessageData: 
 +z4D7CgcALwz0n/33wOvOgtGhpXafgF5QMXVO5ZHclfYyPkxjDeCMxFt2ykElissE78Bd17L+QdfNb98GuPgDX80JnH63RW+ERJ4RW4HMt5ULqAjPLORiLNP0PmCTmAqqrOxVFjJE86babIbKgygAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4494
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vineeth.Raveendran@arm.com; 
Return-Path: Vineeth.Raveendran@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(199004)(189003)(70206006)(70586007)(6916009)(8936002)(478600001)(26826003)(6666004)(356004)(6486002)(2616005)(4326008)(7696005)(2906002)(5660300002)(1076003)(16526019)(186003)(26005)(86362001)(81156014)(81166006)(316002)(8676002)(44832011)(956004)(36756003)(336012);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR08MB2703;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ab562554-79be-4a38-af87-08d7a98ee598
X-Forefront-PRVS: 03030B9493
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XBL+MYyeTk6dAk1rIOFqvyjm0e2MtQe9JV5CO6QZwSinilPEVJgpZqHCXNyMY4P0Z4XoTIIripLEyPtVFR2l1ULUUAduO2G0I799MbCwbDJXlT92UTZ9wPSaPOVeS43ymL9GJnLniaTBxxUxx5ohc2KNk5IiKMSCbM52pp/qFk0hBkpd4UrgM5R02rbd1A8uClP6n5p61dMtSdXG1ApAZWYII03Axlga9Zup3cgvh4d3ghx0Y4cyU5VvnOFleH/Ggop2HIEAqxP2V9ymo/XbAIJq9SzehXQhYmgnLgFw2qOTde4QYIvZojmabBXHBHJVlCrZ1GhhKgVzVzTKakZzJdEa/2kkX4tX8Gjn3ajEBvXk3rwx4KvmNn7dcu/m+/JqQKHbYk1zCZ+niZmQB4D7+/t7n8amNVreTxgTS1TC3C+uFZmKSPCt4NK585sI75Hu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 16:25:58.9880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51cd3573-9404-4177-a217-08d7a98eeb10
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2703
Content-Type: text/plain

Use haveged instead of rngd (That gets added when adding ssh) since rngd
init is taking ~7 mins during boot time

Change-Id: I038c42b8a7c025959248d78940483322421ad5ef
Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
---
 meta-arm-bsp/conf/machine/foundation-armv8.conf | 5 +++++
 meta-arm-bsp/conf/machine/fvp-base.conf         | 5 +++++
 meta-arm-bsp/conf/machine/gem5-arm64.conf       | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp/conf/machine/foundation-armv8.conf
index 9a3f43f..10d3eea 100644
--- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
+++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
@@ -8,3 +8,8 @@ require conf/machine/fvp-common/fvp.inc
 
 KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
 EXTRA_IMAGEDEPENDS += "foundation-armv8-native"
+
+# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
+# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
+PACKAGE_EXCLUDE_append = " rng-tools"
+IMAGE_INSTALL_append = " haveged"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 5592dc1..4c79250 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -8,3 +8,8 @@ require conf/machine/fvp-common/fvp.inc
 
 KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
 EXTRA_IMAGEDEPENDS += "fvp-base-native"
+
+# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
+# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
+PACKAGE_EXCLUDE_append = " rng-tools"
+IMAGE_INSTALL_append = " haveged"
diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
index 54f7ede..4775940 100644
--- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
+++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
@@ -56,3 +56,7 @@ XEN_CONFIG_EARLY_PRINTK = "vexpress"
 BOOT_WRAPPER_AARCH64_XEN_CMDLINE = "noreboot dom0_mem=256M console=dtuart \
     dtuart=/uart@1c090000 bootscrub=0"
 
+# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
+# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
+PACKAGE_EXCLUDE_append = " rng-tools"
+IMAGE_INSTALL_append = " haveged"
-- 
2.17.1

