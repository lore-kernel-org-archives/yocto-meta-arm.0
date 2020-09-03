Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.49])
 by mx.groups.io with SMTP id smtpd.web11.11853.1599133282444663008
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=U+fqy0dH;
 spf=pass (domain: arm.com, ip: 40.107.13.49, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EGRgMDesWgzmxo+9cf2Xb/xy/xFgzxs5gP4he/tDKA=;
 b=U+fqy0dH5qgdeM+nNkZoEZOgKZQKltwyVErD/VV2/7e26H7TelRedAa36io0qIi+ZHQ+dSHULJVnLCdR9Fhy8+jgYBQqSV0x2bRSMKH4f+RBZ9Ro9bBhQeNB7U8vULm4/Ba6RIdeOmvP4S3Odsl9I+laQd2/ovYamtAOBF66oRw=
Received: from AM6PR10CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::19)
 by AM0PR08MB4418.eurprd08.prod.outlook.com (2603:10a6:208:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 11:41:19 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::eb) by AM6PR10CA0042.outlook.office365.com
 (2603:10a6:209:80::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 3 Sep 2020 11:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:41:18 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 03 Sep 2020 11:41:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a69bb7920f93a55
X-CR-MTA-TID: 64aa7808
Received: from adf5eb66d691.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BC813C53-3D29-4634-9A02-C1F8D29C9D54.1;
	Thu, 03 Sep 2020 11:40:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id adf5eb66d691.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c76O6pYYqNXj3RvBSuCMEwfd3iS/yanaA4MxPvKM5AGdyuwx2Gyi5O3cfGeBHes9sbhxvDCPq1wMZRmwN4YiVBIJADZKH97dmSrookHNfGIKB/P8/hNe2gLOC67A/5EWzF/O/H1eNJs2E7mr2Z5q0UKjk/qaJ8+KL0/wPC3Kr2MNryues1ysY+k4Av2c0RjklTn/jO+yoAxPVOIwHLwaLSx5qChVOnNKztoUPrpabDJDG0KV2vILzg3Z0rSEUArsW6My0qIpfRq869ERF475JxgxnwnBCv1CMzIUsb7ibbJhA5NKRFrlU4iYTKgSmIqVhoobrDLOM5oLLtmbo0BIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EGRgMDesWgzmxo+9cf2Xb/xy/xFgzxs5gP4he/tDKA=;
 b=N72Yx7XxLi9YoDkDyqiQCFjy1vFt7OSrCm3DiOGjXtuiNhp446GTUB/jsZ/RHwvRLypAyijCcHEM6l6CaguR6sVCdjDMWPdOEFMw0ypsuBllWmi/ZW3FNESCkM5hk4iHTk7M5TIlAncMAEj8nReLgAhLzNlMxPiV6QwRYEqkoTNybaKGtbSJxcIFbBNEbOj593o6tVX1Ekcd/Tm/QVCXe0rldbi0h6k3goZ+vBYTBWuoYoWCIt59I3vJvFS2NZNJXtEvw/yPBpfuEXcM5c24N6FPsSb684jGjEWTNqBAhgDK43jRn7/jjhSEPXSHbyKg91O6E/t4ARLjBld08NxlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EGRgMDesWgzmxo+9cf2Xb/xy/xFgzxs5gP4he/tDKA=;
 b=U+fqy0dH5qgdeM+nNkZoEZOgKZQKltwyVErD/VV2/7e26H7TelRedAa36io0qIi+ZHQ+dSHULJVnLCdR9Fhy8+jgYBQqSV0x2bRSMKH4f+RBZ9Ro9bBhQeNB7U8vULm4/Ba6RIdeOmvP4S3Odsl9I+laQd2/ovYamtAOBF66oRw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3688.eurprd08.prod.outlook.com (2603:10a6:20b:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 11:40:39 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:39 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 8/9] gem5: Backport pointer authentication fixes
Date: Thu,  3 Sep 2020 12:40:29 +0100
Message-Id: <841931e4c6482d21c1cad92088036699fcf72b6f.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:35 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69b17ed8-12fc-42a4-cddd-08d84ffe45bf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3688:|AM0PR08MB4418:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4418637491C5B48DD2E3D871922C0@AM0PR08MB4418.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m5obvibMKl0BLMVpuTn6ZfK3CfaABIiKuU8zkT8xEpDODg6RsS+gF3u/QZJiS1tzZsS/Fyo7F5l+PbyJBXkTjlKwG3vsp9//g0eFasv0Zbm2n14u50DsHN6cNa7NyZ5fWy4IqNJVnMtFbXZg09M16fs1N1nlKmkcLhVaNMz7cRwHuMEbghkNbFS6QiLNXVdjoVpjBsBQ91lo4SHSndrPx3GcuaYuDNGReaBRAaF0dgBTWzC6uGna7PsRw63FvOA6LW0cgm/ppEBdncYtRDgP2LNd5ydeFOTAr5M4iQeQ1dchiK1UPb4lArGSZZFaEayJiOuHR1JFOP6WrevFXV4mGEfxXzUUd6nQ+oxrT3JO6YZGTWa1knPBeV/p6RlFbkP6EAUanUGtgoQhonMHBFHm9A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52116002)(8936002)(44832011)(6666004)(86362001)(966005)(30864003)(8676002)(478600001)(19627235002)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(6486002)(5660300002)(186003)(83380400001)(26005)(16576012)(6916009)(956004)(316002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 xYLYwONYAGvWi7akvEqeUTa/U3VAApNsAI1x0BGDwL79nyMqBSor+IPc6d7iSo2XHMzQVm62hPPACwILmi0H5TJqcpO1omjWh27FRpooCxmo7kXxmLK5TVhzaDKn6HnLoVlrlA5k7X6KFr2JiE87/Xrz3RbEmrFanmuAXKZHxDHiXHzXnbb+oZfJAwGeNJNiIgRb4RftHUweel0CmGBQMgFbKyFaV85LOZ0dkgkA7GmWFx8tZbt8ZmjVaysNCE92kMRoGLTaapkNRvkDiOarJDiyuEa1udPYmI68Kkz7o2p16g78qRtX066nUEFbHxV6AnlnVNzyxJ2R+uE8tABcjpu22V8eVr13L0wnrarPJLncDLDB0AW3TepeM5hOo4sSvs9wOJXWPMIDx1VsapkOeIpyI27mLpAk19lbsK/3k3HIalBbv8pylrtNyfXOSYJNlUn1qS9o7ev0TYel7Z77WEDDbCPoCfBqseSk+sTqq2mJ7CkLfznGWA1VeMmIq3QZLEaaHnDLK5Ah/EdhlPVJsXmUnYBDC32xDNkDX2x12L7SPM5henX/BbR5kZ4hWVF2sXNKbUkV97DRDUfhrxdSkT1vTFAFj6gOGKTMauqjl6gvDiOzuiOd7SgeXBF6WPKc3WP5/lPkGsU4NOzW08AnCA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3688
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a2d861ba-b1ac-4a4e-5802-08d84ffe2c7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MkwBjJ+jHjDVGYZX/+KmlRbWJAl0IZNtFihVSgvgfzwTv/FQXJqpsvOiGGc/BZ7I8vK6QvtdqvzpqhZXtzPY6thqyAvZbvcUudIAoH00zP89o13tGo0lPjGUK6xVSdfWe14BkkvGMxtGdnHZ8ttgCKaWQ7a0fuyLWurGErtvujOkLbIh4DT/5yIXU8Ydb3P5USw75OAi63/Nei7jM9pYm09/19/BeRSrh6t1LnmSalH7X7QHbA+3KzYxI5c/UgqbKKYp42qoDYBgDuvsOTx/qktM0cYjDNckycdoxUb8Kd1fl75nHED5xP1cnrif6sjrc6hRWLYpI6MvAU/ejn85eOc1TkVtyDRjS7R4ULpQZSjM70cM25OiYpy8ZP3rOs+VN0xS4wuMRb2nt8tdsUQ2+vNiMoNn9UkA5ZPFIhE/OEk0persPUeSOBVj14QqQlu+KBW7wwOM0k/8pPP0e6p4wkAcmHBHjH3zUxtFBbLfcZM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(82740400003)(6486002)(47076004)(44832011)(36906005)(8936002)(478600001)(316002)(2616005)(956004)(81166007)(82310400003)(8676002)(186003)(6666004)(4326008)(83380400001)(19627235002)(30864003)(16576012)(5660300002)(966005)(36756003)(86362001)(6916009)(356005)(26005)(336012)(70206006)(2906002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:41:18.2846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b17ed8-12fc-42a4-cddd-08d84ffe45bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4418
Content-Type: text/plain

Change-Id: I5152895f992e9bc85b24a9190e4affb3c74e44cd
Issue-ID: SCM-899
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 ...0002-arch-arm-Introduce-HavePACExt-helper.patch |  55 +++++++
 ...PAC-is-implemented-before-executing-insts.patch | 174 +++++++++++++++++++++
 .../gem5/gem5-aarch64-native_20.bb                 |   5 +-
 3 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Introduce-HavePACExt-helper.patch
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0003-arch-arm-Check-if-PAC-is-implemented-before-executing-insts.patch

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Introduce-HavePACExt-helper.patch b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Introduce-HavePACExt-helper.patch
new file mode 100644
index 0000000..9d46f8a
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0002-arch-arm-Introduce-HavePACExt-helper.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Backport [https://gem5.googlesource.com/public/gem5/+/6d15745532df2dd306ecc15bd0e9f79914be1682]
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+From 6d15745532df2dd306ecc15bd0e9f79914be1682 Mon Sep 17 00:00:00 2001
+From: Giacomo Travaglini <giacomo.travaglini@arm.com>
+Date: Tue, 25 Aug 2020 12:15:17 +0100
+Subject: [PATCH] arch-arm: Introduce HavePACExt helper
+
+This will check for presence of pointer authentication extension.
+According to the reference manual, Pointer authentication is
+implemented if the value of at least one of
+
+ID_AA64ISAR1_EL1.{APA, API, GPA, GPI}
+
+is not 0b0000.
+
+Change-Id: I4e98e65758e8edc953794e5b618d2c6c3f6000ae
+Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
+Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/33454
+Reviewed-by: Andreas Sandberg <andreas.sandberg@arm.com>
+Maintainer: Andreas Sandberg <andreas.sandberg@arm.com>
+Tested-by: kokoro <noreply+kokoro@google.com>
+---
+
+diff --git a/src/arch/arm/utility.cc b/src/arch/arm/utility.cc
+index ad0a3da..a189c4a 100644
+--- a/src/arch/arm/utility.cc
++++ b/src/arch/arm/utility.cc
+@@ -315,6 +315,14 @@
+ }
+ 
+ bool
++HavePACExt(ThreadContext *tc)
++{
++    AA64ISAR1 id_aa64isar1 = tc->readMiscReg(MISCREG_ID_AA64ISAR1_EL1);
++    return id_aa64isar1.api | id_aa64isar1.apa |
++        id_aa64isar1.gpi | id_aa64isar1.gpa;
++}
++
++bool
+ HaveVirtHostExt(ThreadContext *tc)
+ {
+     AA64MMFR1 id_aa64mmfr1 = tc->readMiscReg(MISCREG_ID_AA64MMFR1_EL1);
+diff --git a/src/arch/arm/utility.hh b/src/arch/arm/utility.hh
+index f00f606..f17ebc5 100644
+--- a/src/arch/arm/utility.hh
++++ b/src/arch/arm/utility.hh
+@@ -151,6 +151,7 @@
+     return opModeToEL((OperatingMode) (uint8_t)cpsr.mode);
+ }
+ 
++bool HavePACExt(ThreadContext *tc);
+ bool HaveVirtHostExt(ThreadContext *tc);
+ bool HaveSecureEL2Ext(ThreadContext *tc);
+ bool IsSecureEL2Enabled(ThreadContext *tc);
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0003-arch-arm-Check-if-PAC-is-implemented-before-executing-insts.patch b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0003-arch-arm-Check-if-PAC-is-implemented-before-executing-insts.patch
new file mode 100644
index 0000000..4410d97
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native/0003-arch-arm-Check-if-PAC-is-implemented-before-executing-insts.patch
@@ -0,0 +1,174 @@
+Upstream-Status: Backport [https://gem5.googlesource.com/public/gem5/+/b50d61fb9ff5d94f401af98bb0b7f8e25d21d012]
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+
+From b50d61fb9ff5d94f401af98bb0b7f8e25d21d012 Mon Sep 17 00:00:00 2001
+From: Giacomo Travaglini <giacomo.travaglini@arm.com>
+Date: Tue, 25 Aug 2020 13:10:23 +0100
+Subject: [PATCH] arch-arm: Check if PAC is implemented before executing insts
+
+If Armv8.3-PAuth (PAC) extension is not supported, most instrucions
+will trigger an Undefined Instruction fault; except for a group of
+them living in the HINT space; those should be treated as NOP.
+
+Change-Id: Idec920ed15e0310ec9132a3cb3701cdb7e7cf9d1
+Signed-off-by: Giacomo Travaglini <giacomo.travaglini@arm.com>
+Reviewed-on: https://gem5-review.googlesource.com/c/public/gem5/+/33455
+Reviewed-by: Andreas Sandberg <andreas.sandberg@arm.com>
+Maintainer: Andreas Sandberg <andreas.sandberg@arm.com>
+Tested-by: kokoro <noreply+kokoro@google.com>
+---
+
+diff --git a/src/arch/arm/isa/insts/pauth.isa b/src/arch/arm/isa/insts/pauth.isa
+index 4c5b371..4806e6a 100644
+--- a/src/arch/arm/isa/insts/pauth.isa
++++ b/src/arch/arm/isa/insts/pauth.isa
+@@ -1,5 +1,6 @@
+ // -*- mode:c++ -*-
+ 
++// Copyright (c) 2020 ARM Limited
+ // Copyright (c) 2020 Metempsy Technology Consulting
+ // All rights reserved
+ //
+@@ -41,20 +42,39 @@
+     decoder_output = ""
+     exec_output = ""
+ 
++    def pacEnabledCode(hint):
++        if hint:
++            code = """
++                if (!HavePACExt(xc->tcBase())) {
++                    return NoFault;
++                }
++                """
++        else:
++            code = """
++                if (!HavePACExt(xc->tcBase())) {
++                    return std::make_shared<UndefinedInstruction>(
++                        machInst, true);
++                }
++                """
++        return code
+ 
+-    def buildPauthObject(mnem, templateBase, opcode, optArgs=[]):
++    def buildPauthObject(mnem, templateBase, opcode, hint, optArgs=[]):
+         global header_output, decoder_output, exec_output
+-        pac_code = '''//uint64_t val = 0;
+-                uint64_t res;
+-                fault = %(op)s(xc->tcBase(), %(op1)s, %(op2)s, &res);
+-                XDest = res;
+-                '''
++        pac_code = '''
++            %(enabled)s
++
++            uint64_t res;
++            fault = %(op)s(xc->tcBase(), %(op1)s, %(op2)s, &res);
++            XDest = res;
++            '''
+         if templateBase=='DataX2Reg':
+-            code = pac_code % {"op1": 'Op164',
++            code = pac_code % {"enabled": pacEnabledCode(hint),
++                               "op1": 'Op164',
+                                "op2": 'Op264',
+                                "op":  opcode }
+         else:
+-            code = pac_code % {"op1": 'XDest',
++            code = pac_code % {"enabled": pacEnabledCode(hint),
++                               "op1": 'XDest',
+                                "op2": 'Op164',
+                                "op":  opcode }
+ 
+@@ -63,13 +83,15 @@
+         decoder_output += eval(templateBase + "Constructor").subst(iop)
+         exec_output += BasicExecute.subst(iop)
+ 
+-    def buildXPauthObject(mnem, optArgs=[]):
++    def buildXPauthObject(mnem, hint, optArgs=[]):
+         global header_output, decoder_output, exec_output
+         templateBase = "XPauthOpRegReg"
+ 
+-        code =  'uint64_t res;\n'\
+-                'fault = stripPAC(xc->tcBase(), XDest, data, &res);\n'
+-        code += 'XDest = res;'
++        code = pacEnabledCode(hint) + """
++            uint64_t res;
++            fault = stripPAC(xc->tcBase(), XDest, data, &res);
++            XDest = res;
++            """
+         regoptype = 'RegOp'
+ 
+         iop = InstObjParams(mnem, mnem, regoptype, code, optArgs)
+@@ -78,42 +100,42 @@
+         exec_output += BasicExecute.subst(iop)
+ 
+ 
+-    buildPauthObject("Pacda",  "DataX1Reg", 'addPACDA')
+-    buildPauthObject("Pacdza", "DataX1Reg", 'addPACDA')
+-    buildPauthObject("Pacdb",  "DataX1Reg", 'addPACDB')
+-    buildPauthObject("Pacdzb", "DataX1Reg", 'addPACDB')
+-    buildPauthObject("Pacga",  "DataX2Reg", 'addPACGA')
++    buildPauthObject("Pacda",  "DataX1Reg", 'addPACDA', hint=False)
++    buildPauthObject("Pacdza", "DataX1Reg", 'addPACDA', hint=False)
++    buildPauthObject("Pacdb",  "DataX1Reg", 'addPACDB', hint=False)
++    buildPauthObject("Pacdzb", "DataX1Reg", 'addPACDB', hint=False)
++    buildPauthObject("Pacga",  "DataX2Reg", 'addPACGA', hint=False)
+ 
+-    buildPauthObject("Pacia",     "DataX1Reg", 'addPACIA')
+-    buildPauthObject("Pacia1716", "DataX1Reg", 'addPACIA')
+-    buildPauthObject("Paciasp",   "DataX1Reg", 'addPACIA')
+-    buildPauthObject("Paciaz",    "DataX1Reg", 'addPACIA')
+-    buildPauthObject("Paciza",    "DataX1Reg", 'addPACIA')
++    buildPauthObject("Pacia",     "DataX1Reg", 'addPACIA', hint=False)
++    buildPauthObject("Pacia1716", "DataX1Reg", 'addPACIA', hint=True)
++    buildPauthObject("Paciasp",   "DataX1Reg", 'addPACIA', hint=True)
++    buildPauthObject("Paciaz",    "DataX1Reg", 'addPACIA', hint=True)
++    buildPauthObject("Paciza",    "DataX1Reg", 'addPACIA', hint=False)
+ 
+-    buildPauthObject("Pacib",     "DataX1Reg", 'addPACIB')
+-    buildPauthObject("Pacib1716", "DataX1Reg", 'addPACIB')
+-    buildPauthObject("Pacibsp",   "DataX1Reg", 'addPACIB')
+-    buildPauthObject("Pacibz",    "DataX1Reg", 'addPACIB')
+-    buildPauthObject("Pacizb",    "DataX1Reg", 'addPACIB')
++    buildPauthObject("Pacib",     "DataX1Reg", 'addPACIB', hint=False)
++    buildPauthObject("Pacib1716", "DataX1Reg", 'addPACIB', hint=True)
++    buildPauthObject("Pacibsp",   "DataX1Reg", 'addPACIB', hint=True)
++    buildPauthObject("Pacibz",    "DataX1Reg", 'addPACIB', hint=True)
++    buildPauthObject("Pacizb",    "DataX1Reg", 'addPACIB', hint=False)
+ 
+-    buildPauthObject("Autda",     "DataX1Reg", 'authDA')
+-    buildPauthObject("Autdza",    "DataX1Reg", 'authDA')
+-    buildPauthObject("Autdb",     "DataX1Reg", 'authDB')
+-    buildPauthObject("Autdzb",    "DataX1Reg", 'authDB')
++    buildPauthObject("Autda",     "DataX1Reg", 'authDA', hint=False)
++    buildPauthObject("Autdza",    "DataX1Reg", 'authDA', hint=False)
++    buildPauthObject("Autdb",     "DataX1Reg", 'authDB', hint=False)
++    buildPauthObject("Autdzb",    "DataX1Reg", 'authDB', hint=False)
+ 
+-    buildPauthObject("Autia",     "DataX1Reg", 'authIA')
+-    buildPauthObject("Autia1716", "DataX1Reg", 'authIA')
+-    buildPauthObject("Autiasp",   "DataX1Reg", 'authIA')
+-    buildPauthObject("Autiaz",    "DataX1Reg", 'authIA')
+-    buildPauthObject("Autiza",    "DataX1Reg", 'authIA')
++    buildPauthObject("Autia",     "DataX1Reg", 'authIA', hint=False)
++    buildPauthObject("Autia1716", "DataX1Reg", 'authIA', hint=True)
++    buildPauthObject("Autiasp",   "DataX1Reg", 'authIA', hint=True)
++    buildPauthObject("Autiaz",    "DataX1Reg", 'authIA', hint=True)
++    buildPauthObject("Autiza",    "DataX1Reg", 'authIA', hint=False)
+ 
+-    buildPauthObject("Autib",     "DataX1Reg", 'authIB')
+-    buildPauthObject("Autib1716", "DataX1Reg", 'authIB')
+-    buildPauthObject("Autibsp",   "DataX1Reg", 'authIB')
+-    buildPauthObject("Autibz",    "DataX1Reg", 'authIB')
+-    buildPauthObject("Autizb",    "DataX1Reg", 'authIB')
++    buildPauthObject("Autib",     "DataX1Reg", 'authIB', hint=False)
++    buildPauthObject("Autib1716", "DataX1Reg", 'authIB', hint=True)
++    buildPauthObject("Autibsp",   "DataX1Reg", 'authIB', hint=True)
++    buildPauthObject("Autibz",    "DataX1Reg", 'authIB', hint=True)
++    buildPauthObject("Autizb",    "DataX1Reg", 'authIB', hint=False)
+ 
+-    buildXPauthObject("Xpacd")
+-    buildXPauthObject("Xpaci")
+-    buildXPauthObject("Xpaclri")
++    buildXPauthObject("Xpacd", hint=False)
++    buildXPauthObject("Xpaci", hint=False)
++    buildXPauthObject("Xpaclri", hint=True)
+ }};
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
index 638baf3..101e6ef 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
 SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;nobranch=1 \
-           file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch"
+           file://0001-scons-Add-MARSHAL_XXFLAGS_EXTRA-for-the-marshal-object.patch \
+           file://0002-arch-arm-Introduce-HavePACExt-helper.patch \
+           file://0003-arch-arm-Check-if-PAC-is-implemented-before-executing-insts.patch \
+          "
 RELEASE_TAG = "v20.0.0.1"
 SRCREV = "332a9de33db603e0aefedae1e05134db4257ea3e"
 
-- 
2.7.4

