Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.43])
 by mx.groups.io with SMTP id smtpd.web11.4548.1604412803729373399
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 06:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UF2FMtuw;
 spf=pass (domain: arm.com, ip: 40.107.7.43, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYSVOi21MoOtcXRDYbjtAIT4O89LPXZJJBXvfOAf/L4=;
 b=UF2FMtuwTdYcOMAahHTOsY35IibPtvr96rRDq7P4wlCWy4roAg1GFf7kOVNJdEQQc6ZeBqbQh4XQPEQJ6aQEcIwgF4uorjLJ/LZiFvR9EO7sSTE9X5fOeBRb5ORCRqUK+aIk6+nR6QXy7kKl3poOKztiS/yQMD73M4Ugkab++yw=
Received: from AM6P195CA0074.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::15)
 by AM0PR08MB3266.eurprd08.prod.outlook.com (2603:10a6:208:66::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:13:20 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::87) by AM6P195CA0074.outlook.office365.com
 (2603:10a6:209:86::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 14:13:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 14:13:19 +0000
Received: ("Tessian outbound d5e343850048:v64"); Tue, 03 Nov 2020 14:13:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 168edc7a9ec3e9db
X-CR-MTA-TID: 64aa7808
Received: from 3cf93859264d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 89B3D4FA-5F64-42B9-A380-08A1D9950DBB.1;
	Tue, 03 Nov 2020 14:12:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3cf93859264d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Nov 2020 14:12:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWR/iTBKfQOhG1UaDkkiAZBNrFKUB03lLg9Y1/T250HHLj36nFI97bEfSj1Wcl9Nzfl3x69qG5Fbdm58WxohxBgV0/yy2TStxfu1gEEOpbTWwvDiELqRnVQPO7tLq989UeHy2uz6SJxHbodd66GoNgNBMlhkeq7cTH5fg/afjheT6QSasoeV00fVG5YUicdxrXECRJ+NivtAWYTAiPawJ+RxPbD8e/qW6TK8YT7z7X04awqpgmeNfI9IQg4oHVFqZ8mZccxJ5iZpwXDQcNeFFawgYuhx8FYSGJ4h3LUEFHx4GMtJ3W4aoXhkonoDCvN73R5SJzkrVT02Uet0ujhx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYSVOi21MoOtcXRDYbjtAIT4O89LPXZJJBXvfOAf/L4=;
 b=Rqj7xcJDxY38EG1X+Bi0E8b7KEJjARzPENEhcKLDBnyKnT1HFJebNjXLlH4F2bY5WRygihZZgmUBpNsc1iLLUXmDAxdoo4i86addr/9qWQps5S7thuUnZvFN/NqKITJjs73q+99aTEMyEXkFhcgA8ibBV0tg9OArpKPCI/le0siWGn8Nd0sBd6gePTOMjVM1Ka7GaegRslz62B0rbaOYinPSoGRQPMlhVu54Q423V2SjCGE7ICTCMKx+srvsna4W1hmV3jr2iFJuc0rGCjpIDuR7QA5rshyhC37GIcAYeLGg1aziUQ3VJtSoMGE3+QIUXh4mloh1gnCBeEsJa+M2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYSVOi21MoOtcXRDYbjtAIT4O89LPXZJJBXvfOAf/L4=;
 b=UF2FMtuwTdYcOMAahHTOsY35IibPtvr96rRDq7P4wlCWy4roAg1GFf7kOVNJdEQQc6ZeBqbQh4XQPEQJ6aQEcIwgF4uorjLJ/LZiFvR9EO7sSTE9X5fOeBRb5ORCRqUK+aIk6+nR6QXy7kKl3poOKztiS/yQMD73M4Ugkab++yw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5527.eurprd08.prod.outlook.com (2603:10a6:20b:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:12:37 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 14:12:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 4/4] arm-bsp/n1sdp: Add support for Kernel PREEMPT_RT with linux-linaro-arm-rt
Date: Tue,  3 Nov 2020 14:11:44 +0000
Message-Id: <4c706fbc60d5524f6c07d6629bc243d31cd5f30f.1604412597.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <0624b1d5cb32b094405595f69ec1bacee09c7e4e.1604412597.git.diego.sueiro@arm.com>
References: <0624b1d5cb32b094405595f69ec1bacee09c7e4e.1604412597.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 14:12:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf7a0858-de11-4d6e-3da4-08d880029d7e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5527:|AM0PR08MB3266:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB326611F813CB9B5481B59EDB92110@AM0PR08MB3266.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 y05aeP1HbnAWoQkrVHUF0c/5V8vo5U0KfaiKvtZqWwyOv3Sa+b6M+uLTwCOxb3ZMFi5ow69rlWs7nAAEMFex2WyxI4zaf4Jt9jaKEsD0CKvcoQ6P5PBs+IbFPZ5qYGXu7barYqODvACYNSjU+MFhuMKIgvOzU0A2wMyndGSAy4ETpdxuc+lv/sYnqs9Qwp37SPjdnXwZR9Q9eC8uj1qey9dDSv3MF6QhuKW7uvcs5L6E3MVURGGXKHlDdoRecfC1tSyJUhLmNMlLSdaFGR35q/jC6sQ+987mqFTZ7QpM6ucMuQV/GFK2H+AKANPYMuPFL8k3wTfPWWFqQKWO46RkKKVAcypImQxEeP+hDP3iWfk1DWcDZ4c+ilvYWdViy59bfWIuMRqUNWTbje3CjX1YSg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(396003)(366004)(26005)(83380400001)(186003)(316002)(2616005)(66946007)(66556008)(478600001)(66476007)(956004)(16526019)(4326008)(8676002)(8936002)(6486002)(52116002)(7696005)(36756003)(44832011)(5660300002)(6916009)(86362001)(2906002)(6666004)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 muyzL6kz24NH1wswUt6uUjvaByfeMI2jNoyqMo32thOyEdoFTNKTWIuqlmBfOq8jQZ93cjrI+pwHra0FrXGOufRCz63s3N1oYcF8kQMmafEo2w082DSZfGY/v+wuFQdsjTsjeH4lB0g0etg6cV8Mg5NXOdjV40u9WcCLBawRhNVMObVXxbje2Ott/jKEe4hYXjGRV7mfoume+YOQmoGeetUzuCV+x5+iub22KDt3KqwfYeM/1FaIeKEb8meUOd5SCkW6JmEBO6epRvtexsWwppeis1KYH73Tten+3MzXrRdu4VLCZ/rg4lvO4qh3lavVnxXKuLjLa+Z+Lzbu1OeL853x7/S8fHHv3Nx8tgWezsTcl+lw1AzZsa4hQVlRczU8oVLp63GxqZS10xyGWUaKHHPwZU33ZBvY+545zCrt9wM0Th6g/teKjtr33+Z2u9o6TogVTkvLN+bekbs9nXIeNxnkoHFhMi4jQ3W2KmITEuAVPSFDQLrK8A+EBfJPW1U0oAmHdGLo6RnMn0gVI4xj7voGwZum4ipE1ctfSpUY8XbPdc/iPAaYrCvu8qYZPLJNXQGpwbe8Uk1oGnK+omJ96YutwNJZzvsx8q3PQQw0ageKi+9aPaZ36APnUz52JCCLUF9uYSu4+coRKNeBzOsQgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5527
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	473a5b94-58b6-490e-38df-08d880028393
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wxd/MrIoQvRwufhlGIJeQcwA+mk+gQZzNVFhNbEmHychswseQO7Oc/WUXza0Bspmxk3XdBFGTrUfDE+40AKOYeuHLtMTu8oCBjN5l9FjyJysoFgTafFZFmNcrh/dTFuusJshiFrXfe6M7WpkJllb28UJpKjgP+0Fg/z7nIrAHis1H4HvG3AsIXPOLJYJ9sIhYFDLG3H+rISevFQYZtixYCmsZzRc9M+eAq8kSHufQk3zdColGDLT6FZIwP5xItaGowJrpXFYRkAQz1LKa4GzQdOeyh8Xpcdvjw3wXT5GdxGr6gbesPxNOS0dKlsYdlRZZro1KH2yFRzkkeJK/gHK6M9LjttC2FIb7QoeThNfLu8iukdup5KiuW+7tdGAtV3nMb04lwFV6vbCxlt69e5ln3dtVStaGcn/3XVandhrDmW03g/kBJ8grs2lRIRTf3o8
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39830400003)(396003)(346002)(136003)(376002)(46966005)(26005)(186003)(336012)(16526019)(478600001)(44832011)(36906005)(6486002)(956004)(316002)(2616005)(6666004)(6916009)(8936002)(8676002)(36756003)(70206006)(70586007)(5660300002)(7696005)(83380400001)(356005)(81166007)(4326008)(47076004)(86362001)(2906002)(82310400003)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 14:13:19.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7a0858-de11-4d6e-3da4-08d880029d7e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3266
Content-Type: text/plain

Add N1SDP settings and configurations for the kernel with PREEMPT_RT support
using the linux-linaro-arm-rt recipe.

Also, change linux-linaro-arm-n1sdp.inc to enable sharing commom patches for
N1SDP when building linux-linaro-arm or linux-linaro-arm-rt.

Change-Id: I101b2e6ffefa4f908389110048778aaf5226d5d0
Issue-Id: SCM-1653
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc               |  6 ++++++
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc   | 10 +++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc
new file mode 100644
index 0000000..414732c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/n1sdp/n1sdp-preempt-rt.scc
@@ -0,0 +1,6 @@
+define KMACHINE n1sdp
+define KTYPE preempt-rt
+define KARCH arm64
+
+kconf non-hardware ktypes/developer/developer.cfg
+kconf non-hardware ktypes/preempt-rt/preempt-rt.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
index 1a6f0fe..820ce71 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/linux-linaro-arm-5.4:"
 
 SRC_URI_append = " \
     file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
@@ -21,3 +21,11 @@ KBUILD_DEFCONFIG = "defconfig"
 KCONFIG_MODE = "--alldefconfig"
 
 COMPATIBLE_MACHINE = "n1sdp"
+
+# RT kernel machine description
+FILESEXTRAPATHS_prepend_pn-linux-linaro-arm-rt := "${THISDIR}:"
+SRC_URI_append_pn-linux-linaro-arm-rt = " file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
+
+# Since we use the intree defconfig and the preempt-rt turns off some configs
+# do_kernel_configcheck will display warnings. So, lets disable it.
+KCONF_AUDIT_LEVEL_pn-linux-linaro-arm-rt = "0"
-- 
2.7.4

