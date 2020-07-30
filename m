Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web11.11098.1596124509428473488
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=z6lOB2+v;
 spf=pass (domain: arm.com, ip: 40.107.20.80, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3rgjo8jKndsctlfFiAsaUD1D8HkTMU7F12AfIT8HL0=;
 b=z6lOB2+vcakD3EqV2+Nx5WMQulIJ39YL5pkZoHZIl/xF5TJSVtTziLt0Hyi+Aih3j7mS4AXG8sOJVFssP1KiFWbfw9ZP6y7gC2EABNiZEIhPZ4b4YTL6B9jmMAKfctyEGZctgwxJXPENSuHwO5Fd6ZFiBUaarC8tOm8Qra7jjbU=
Received: from MR2P264CA0060.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::24)
 by DB7PR08MB3243.eurprd08.prod.outlook.com (2603:10a6:5:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 15:55:06 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::db) by MR2P264CA0060.outlook.office365.com
 (2603:10a6:500:31::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:55:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 15:55:06 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Thu, 30 Jul 2020 15:55:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 03295358023fe4d0
X-CR-MTA-TID: 64aa7808
Received: from 34fc4e7cce82.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BE11619E-FBEB-4A26-9005-E52F7DB1B3B8.1;
	Thu, 30 Jul 2020 15:55:00 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34fc4e7cce82.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:55:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXr9RWLYfiUJvLnYz4FWXsgS/qD7Vij/pvFgf6soQ8awv2vZbWalODPqf8bdkp0Y6RYf1Ig11nmqVoaFTMR51b1ES990lRbUPHS8xC8o1Yf/wfGSkrDj5kmWL/I9ajV8JEh2kMlka2QS129UPVLMNKtWxqzOfpf9N2wQ4UWJsqEwfMkzlGNzD2Bsf52ol1uxxMGjGGWKvq1/Q+fHTz72REEm6IzeOnRcOmfLJ+7rpUgln9kKmKVDp5hygFB5tGCiNYkvsow7z3Hw5SMljseEQEHTAIQnV+/VEFQHbwK0tN5hAbdUixAR+JEOlhAQVB6aAUuFajhexSfLf27hB73UlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3rgjo8jKndsctlfFiAsaUD1D8HkTMU7F12AfIT8HL0=;
 b=hAp2JH3u8kPdR+vV6haPQV+hfjPXHCRV73ZzHYnd8lp78Cz2HbnZ3qYM3KAF2Da3QEhbvXVb10958YbPIcQr1BBwOUSfttXUsytyl5KNLoVeqcgqTajuboWNvM0VxLnmJ9uki5mBQpCq/ALeAF0PVzjT1xYHnnGAfbLC54+hWtkNN3XAldZpBN/ZzpUc+46V+nQ/wHKurJRI+lA9VvFll6rMIze6uCXNjWH5eFCcnRsrwlIahiJaX/PbF39HSLkuMOLMETYnwJtwuX787sswKeUU6xN1TKlFoHt9wK5gyASz5ZrOzDl/1mFvFRnzJLvgtUH3CNx6hEjgX4CxDpK85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3rgjo8jKndsctlfFiAsaUD1D8HkTMU7F12AfIT8HL0=;
 b=z6lOB2+vcakD3EqV2+Nx5WMQulIJ39YL5pkZoHZIl/xF5TJSVtTziLt0Hyi+Aih3j7mS4AXG8sOJVFssP1KiFWbfw9ZP6y7gC2EABNiZEIhPZ4b4YTL6B9jmMAKfctyEGZctgwxJXPENSuHwO5Fd6ZFiBUaarC8tOm8Qra7jjbU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4930.eurprd08.prod.outlook.com (2603:10a6:208:157::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Thu, 30 Jul
 2020 15:54:59 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 15:54:59 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy: Move gem5-arm64 to dynamic-layers/meta-gem5
Date: Thu, 30 Jul 2020 16:54:58 +0100
Message-Id: <1596124498-110662-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 15:54:59 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 107308cc-b7cb-47c0-67b8-08d834a0edec
X-MS-TrafficTypeDiagnostic: AM0PR08MB4930:|DB7PR08MB3243:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB324397185639023D5DBC2E4892710@DB7PR08MB3243.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fRnIuPqg5ZOfstudYzfsj8RR6VLoUngVnJ68IxB8js30mcNw5HbWWZu3TYjcT8NzY9Gz7kYofCYA3EvnItgLpP2oUYOPw0ii8arPq4owcH9cMdaLOzTgAQpBwVrWLmcKbI6E3JScvkjVM6OLhRXPFPFm/vG/WBZRW5rkVfELTK+rXx4pUx5gwi5HdWrMhi8fT9MYVMvWALNKlQ/Ot1Htj6pqBF4xhBwV2Y7GZ8M4px2r3CMoqrabexXMGlxfpzKnTh6YDtcsstsv4jF+gV2Xhv+Gz4YFAFUuEM/ODHT4lz877zKRp0rlmb9RNiT8uW9H7JINmtmnNovF3WStaRSE4UTdER1uo0pJxxihDU1QzVr4UjfOZIvG6r6Ymqmmqa8E
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(66946007)(2906002)(478600001)(16526019)(66556008)(186003)(6916009)(52116002)(26005)(36756003)(7696005)(66476007)(316002)(2616005)(83380400001)(4326008)(8936002)(8676002)(5660300002)(30864003)(44832011)(6486002)(86362001)(956004)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 9ZtRv4XUYDef/uycRTv6HMWbKRk07NlMhs4xP9YjdMWhCd6wIX2muSnTCECWqudIi4CV9DDI7uUIqZTGprFfMR/Iufs1Hg6xAjqzEoMg3avuZ7WIrKnShIAAMeiwbMvGllEEySueVMaBr1Tqd2ptavezHqwRAh5F3U08aW6fYm83+YDGPVs4VfkzkRnkDa4UijiAehh4IlFrlQh6XF90+bgrR1g9pLaaBgqRWkyP/DXCx6002rXKmHA7bwIGW/AMZPwQhQ+04h6wTEWqfzZOCxX28Ly4Vly+BXsh2XewuL6ZTuEWnPLjSJb6FbigC8vPC+5BD/6QLl5WmSpWW7opBEJ5+eaqahrhEIBsKWOr4aHyJQdwcHOzs3SKDLgAPov3s5WklhpakUpnEiGR4DzacY8FOGNc0jRI3r/mLnvcqjetB/4kHHoMvCSy+Siye7KfGZ3VEzr26JoNX56nSYtuOctQ5D+316gm6vdLB8YRsgTZpg4apjJiIVd0uXBwARNq/2hlu0XZnONOptkm5NUYJHcwUzCvkq+j6SJPTkCDKltiW2rarGEr8/nYebAzUYAJh3vDd9QGvYsqXaQaZpdnho1DRJgfTkJiMM4HKcGBhqWfLCKEmD6tzVUWqYItFljvjtOmw2wB3Blwz5Kta9KNag==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4930
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ba50d6bd-d9a3-4f4a-1bbd-08d834a0e9c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SNmVfOMmyor3KzxDlNiMHzpRXbFHq1sPmBpaU2e90H0hLDh95L2MAPFkFemvfilIIqSVZkXE0qPWPM58BPD9nIDsC+monxP0gvcL6tnGKoPr00rqKuKvoahvtDsigSHbHta1S39ognxuyz+QpYHV1y9u6vUzpi/SQe7FxVMGJQY6WD49P1IUeWEik7EKtqPq0gY0FbONGE7ChRH9kjuXeIPUouLYef75v08J+96MG8kHR6qvQxKKVdGjDHjL0PXN8DhW7u2icmZAPwKmjxQ/IRrJAF+lkHr/nS2zUbql1d5X614YsudMx0lFmVuGnYBRyk81sxu/YuY1j9BKEx0mo/3tUK7Ic5TEHIDaIudYFJ7Wc8qg94bWE9FIj8TVusPBqHUrlg3293W9N3l6xD+u3mqcGj1WHkiyRrI8u6GVDqw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(2906002)(356005)(86362001)(956004)(36756003)(70206006)(47076004)(82310400002)(81166007)(30864003)(2616005)(336012)(82740400003)(83380400001)(44832011)(7696005)(70586007)(8936002)(36906005)(6916009)(6486002)(316002)(186003)(16526019)(26005)(8676002)(5660300002)(478600001)(4326008)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:55:06.2500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 107308cc-b7cb-47c0-67b8-08d834a0edec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3243
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
 .../xenguest/xenguest-network-bridge.bbappend      |  2 -
 .../recipes-kernel/linux/linux-%.bbappend          |  1 -
 .../boot-wrapper-aarch64_%.bbappend                |  0
 .../meta-gem5/recipes-extended/xen/xen_%.bbappend  |  2 +
 .../xenguest/xenguest-network-bridge.bbappend      |  1 +
 .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 ++
 .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
 .../recipes-kernel/linux/linux-%.bbappend          | 15 ++++++++
 11 files changed, 26 insertions(+), 52 deletions(-)
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
 rename meta-arm-autonomy/dynamic-layers/{meta-arm-bsp => meta-gem5}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network-bridge.bbappend
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
 
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
index de88cce..1efd7c6 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
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
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network-bridge.bbappend
new file mode 100644
index 0000000..0283702
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xenguest/xenguest-network-bridge.bbappend
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

