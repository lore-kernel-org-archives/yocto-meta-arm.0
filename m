Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.42])
 by mx.groups.io with SMTP id smtpd.web12.14269.1601650199180026569
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 07:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kiLM9MHr;
 spf=pass (domain: arm.com, ip: 40.107.3.42, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRTHG4v0HVzLHxR68C/4pTsQJJrHNUrruunyFzWM1oI=;
 b=kiLM9MHrZgyuVfu6yL5TUG1/8fbiRbYwdFeS83tr/FjJ68unFzG0HQnkCSfrYO1PzbcWYP7gqrKlSeGWdWoSWmi0WJFz8jpjlx1ysN6d0VT0oWZJ/t0hMY43w4UNrxXW0sWH3ba61HMUfZHkb4/IJsGml1vtQVHjRVn5RkO54/g=
Received: from DB6PR0301CA0076.eurprd03.prod.outlook.com (2603:10a6:6:30::23)
 by VI1PR0802MB2240.eurprd08.prod.outlook.com (2603:10a6:800:9d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 14:49:56 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::62) by DB6PR0301CA0076.outlook.office365.com
 (2603:10a6:6:30::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Fri, 2 Oct 2020 14:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:49:56 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 02 Oct 2020 14:49:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e1be5ec3fc032976
X-CR-MTA-TID: 64aa7808
Received: from a8e889f3db35.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9D82C24C-2769-4EE0-9451-A2FFE336767B.1;
	Fri, 02 Oct 2020 14:04:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8e889f3db35.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:04:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zpck/YtHphOeRc92PDKNPnQjaHxPHuIv279woc7p+dGc32waUMl4dG+A73DxUlDqVYdTwW3B1MtMva4ISj57If1JCxIvlesIaafeMsY6CMj0j8v08mLKoauiN9x2NVKJ3VXhq1Fw99fIp22bMNHPO0VlnBHi8cUl/UmzujhZs4U9mR3/TEHic5GxtqWe9WIUtotAkPUGt39Tyrq41ETEHRd2PcQ9hQuv6Ay+8RP2mJ8ij4fDgWjbtVoBCby1rr5sWhiPaoVRjO5QCghJnnfFxd4OsEOqKlgo013V7Gvx/C9t1q8o0zVa9QPYq3QAQRGxieeFMUjwLrgYk2D0xx3Vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRTHG4v0HVzLHxR68C/4pTsQJJrHNUrruunyFzWM1oI=;
 b=SeJAhPRI17hiL1hoYjHhqJCqRUYKlQG3bI2WKx/wpzhnbtWJ71+aHAAPoVUZTF+me+2qDTudFskdtCA+K7WVmis6SfwJYvyp6PHRRf3Xk6276RJUmQwxdmb/uZ4ZXi1h0txm5rnBo5c96wHr2u4MY3Tn8wl0B5Aw9kFk9l/+hOqzj8/1vLDz2qWvQ3zgqZq7aU1tvfP55/JB8HT1huB0FyPkGkeVOtTgcJ58JPR/kRRdW9IZNiRgi4bPzT6/zHqSzPKI5wsNi4iO/HqHW/mjp0x/ePXPS/B3g40huh1kWFBM2he/wrBMiY9tqLcS0a8B2kJuwu0PgqTIGO7fdPT/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRTHG4v0HVzLHxR68C/4pTsQJJrHNUrruunyFzWM1oI=;
 b=kiLM9MHrZgyuVfu6yL5TUG1/8fbiRbYwdFeS83tr/FjJ68unFzG0HQnkCSfrYO1PzbcWYP7gqrKlSeGWdWoSWmi0WJFz8jpjlx1ysN6d0VT0oWZJ/t0hMY43w4UNrxXW0sWH3ba61HMUfZHkb4/IJsGml1vtQVHjRVn5RkO54/g=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 14:04:34 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3433.037; Fri, 2 Oct 2020
 14:04:34 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/7] arm-bsp: Add cortexm tunes
Date: Fri,  2 Oct 2020 10:04:02 -0400
Message-Id: <20201002140405.7896-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002140405.7896-1-jon.mason@arm.com>
References: <20201002140405.7896-1-jon.mason@arm.com>
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: SN4PR0501CA0004.namprd05.prod.outlook.com
 (2603:10b6:803:40::17) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN4PR0501CA0004.namprd05.prod.outlook.com (2603:10b6:803:40::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13 via Frontend Transport; Fri, 2 Oct 2020 14:04:32 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 02 Oct 2020 10:04:28 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c8ac8082-c9b7-4ae2-4c39-08d866e26db0
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|VI1PR0802MB2240:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB224025439B14FE7944575100F0310@VI1PR0802MB2240.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:826;OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RbuAlealFWg9ebVZ9aeI7Jlib0nVovU5Cq3FBqyVPxXy2HF9O/1xdHDZyxNb+tNIAC960H63G9zFRx+UzoQIl2ZMMsLr+T6CvbPHi9GDeuST7vIUNMpg29oqmJdcB/IfQ6/rDrCvIKUwRCW/BFQUpJzVC5AT6PZyXq6k2hsijyrvU61kO3F++FGAwAEAXVOvsp6LaMYLjq6o/2ifKeE/3J1Q3ISFIjvMYReCWaFKKDWkJ0O4vBFYNFASVZIavKV/fYhCtfxrIYxPsJ7S+BiHRDgATUjbVSzvAJZBNRR/q8aSSLZ3i4DC2c41+ZICsTd+DNh4ApG4g6FzoGQnxl/RdDLq7Bnt9wPrczcS1eOF56nmPMfv0UjssIMsXh2/gVVr1MlRpwf8mfdLp965JW2uEoMFfRXogcFguVOBTTEzKhYMxsDEYBd7da9zUmukO8Pwi2Qd4EwI/htY1X2x3DnblA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(186003)(26005)(1076003)(2616005)(44832011)(6666004)(426003)(66476007)(86362001)(66556008)(52116002)(66946007)(36756003)(5660300002)(30864003)(8676002)(6916009)(478600001)(8936002)(966005)(42186006)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UFjVATAzZxGEAMGWkQoYG07eCfHn7Xlu89JIhHXXoBksQca6JssKs6x78jJ7lKRX/WmKKevJg4YPvCW5j9AGXEflrBKt72QxfYbMfL2b6gFbjM/HhlOsGX0xwN8lJLlUz4A0MN3RRMFDeM9i9nf1A8ma25VQvrXTaSIx97fSyuJc6Bd9A/J7nN8rsxDkpUMbI69tuMiEAmvB+deAC7X/WWDkghSI/hb2uGh/YaU6hZjGOpcXc725g3C9xUJniCBD7cxJo78Z+x1VVjQ8pKKI4VOIoc8Rl/YcfBv0dluS+OGbuvcrd49hVAx1j/iuN8Gedc9ozy6qZexaBejjMVYNl9xIi8ghzU8I/9HC31t3qwOWGd+8ijMskV3F2fAGCGidkCHqdILVl2T3XfhM805UVRSukhUdkcdx+qaHwMWLs6HMlVmkxeiGtghpcSZ6lWZAZGYUpFZtkV3tDxqqOS6rKUwoKe2X59D1hqLngek5XEmMMx9qmT7i6qYsL/Y/MWFszQeZ9OLr7mADXl8zHu1XgiXwQYPLOQx+MMu9IcsPDNKHQqDdn07jH2fg6yOSCVk1+awp1KooP6dgDHz/Anr1hVUim0XFq8c9SrgpSLCEm4Z9ah7oZ6AtmU0j2YvYhDCZ1qPVv+SV5Hm/JopEjCF7vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a5496fab-e8ea-4ca6-5a0d-08d866dc16c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3yYfJpM1lpCqiOd5pica7MmzcxzwvLWzF1yWgLLqmVMfirODcFmhfag/LyC29/xOP23T7CbS99FpgNplc7UtAdFQQklBhlTZMlxktyLJtBtEniiyVKfZ47VhY97BAVHhExy7+11oLuK8O5ZAjLWX3ecgzL4QkacARmKEM6A8Dpa+thVKK7c6SojZ4Q8GD4akrjPeAeKANj+cjahm2wed6eKPoGipddZNZ7leWdMiDfNVWj1ND6eomSwv9+x0e7tfOKznBcd2XS0ahUy86WzAQJxS+bi7lY2U+vbhehCIi77YRY6PGjinW35xN/dUOI6qlhdw2E2qhQbcl78VBBZWvI/mLd5iLRQIec9BJyhe6joyGaNjgbjBnZEg8TADnkClG5zgzCZlEinW6yFmHtBVnQ9eG4Xncc0FicRxr8sL7nqo4uHcYx809jjqp+jJd5xaYDBhfoEzh8V8N/t28Yr9WFla+4C8fQzuLACNA7TrQ70=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(396003)(346002)(46966005)(426003)(83080400001)(356005)(47076004)(966005)(2906002)(82740400003)(8936002)(336012)(82310400003)(81166007)(2616005)(6666004)(478600001)(44832011)(8676002)(42186006)(86362001)(316002)(36756003)(186003)(1076003)(6916009)(26005)(5660300002)(30864003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:49:56.1757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ac8082-c9b7-4ae2-4c39-08d866e26db0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2240
Content-Type: text/plain

Until accepted into oe-core, add the cortex-m tunes here so that they
can be used in meta-arm-bsp.

Change-Id: Iaa74937da61cd8d35c27beae7e09351e996a262e
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/include/arm/arch-armv6m.inc  | 19 ++++++++++++
 .../conf/machine/include/arm/arch-armv7em.inc | 18 +++++++++++
 .../conf/machine/include/arm/arch-armv7m.inc  | 30 +++++++++++++++++++
 .../include/arm/arch-armv8-1m-main.inc        | 19 ++++++++++++
 .../machine/include/arm/arch-armv8m-base.inc  | 18 +++++++++++
 .../machine/include/arm/arch-armv8m-main.inc  | 19 ++++++++++++
 .../conf/machine/include/tune-cortexm0.inc    | 14 +++++++++
 .../machine/include/tune-cortexm0plus.inc     | 14 +++++++++
 .../conf/machine/include/tune-cortexm1.inc    | 15 ++++++++++
 .../conf/machine/include/tune-cortexm23.inc   | 15 ++++++++++
 .../conf/machine/include/tune-cortexm3.inc    | 15 ++++++++++
 .../conf/machine/include/tune-cortexm33.inc   | 15 ++++++++++
 .../conf/machine/include/tune-cortexm35p.inc  | 15 ++++++++++
 .../conf/machine/include/tune-cortexm4.inc    | 15 ++++++++++
 .../conf/machine/include/tune-cortexm55.inc   | 15 ++++++++++
 .../conf/machine/include/tune-cortexm7.inc    | 15 ++++++++++
 16 files changed, 271 insertions(+)
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
 create mode 100755 meta-arm-bsp/conf/machine/include/tune-cortexm7.inc

diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
new file mode 100755
index 0000000..739550d
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv6m.inc
@@ -0,0 +1,19 @@
+# Tuning for ARMV6-m defined in ARM v6-M ArchitectureReference Manual
+# at https://static.docs.arm.com/ddi0419/d/DDI0419D_armv6m_arm.pdf
+DEFAULTTUNE ?= "armv6m"
+
+TUNEVALID[armv6m] = "Enable instructions for ARMv6-m"
+TUNECONFLICTS[armv6m] = "armv4 armv5 armv6 armv7a"
+
+# Use armv6s-m instead of armv6-m to avoid gcc bug "SVC is not permitted on this architecture".
+# SVC is a valid instruction.
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '', d)}"
+
+require conf/machine/include/arm/arch-armv5.inc
+
+# Little Endian
+AVAILTUNES += "armv6m"
+ARMPKGARCH_tune-armv6m             = "armv6m"
+TUNE_FEATURES_tune-armv6m          = "armv6m"
+PACKAGE_EXTRA_ARCHS_tune-armv6m    = "armv6m"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
new file mode 100755
index 0000000..4f21c6a
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7em.inc
@@ -0,0 +1,18 @@
+#
+# Defaults for ARMv7e-m
+#
+DEFAULTTUNE ?= "armv7em"
+
+TUNEVALID[armv7em] = "Enable instructions for ARMv7e-m"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', ' -march=armv7e-m', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7em', 'armv7em:', '', d)}"
+
+TUNECONFLICTS[armv7em] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv7m.inc
+
+
+AVAILTUNES                            += "armv7em"
+ARMPKGARCH_tune-armv7em                = "armv7em"
+TUNE_FEATURES_tune-armv7em             = "armv7em"
+PACKAGE_EXTRA_ARCHS_tune-armv7em       = "armv7em"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
new file mode 100755
index 0000000..af82e6c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv7m.inc
@@ -0,0 +1,30 @@
+#
+# Tune Settings for Cortex-M3
+#
+TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
+
+
+AVAILTUNES                            += "cortexm3"
+ARMPKGARCH_tune-cortexm3               = "cortexm3"
+TUNE_FEATURES_tune-cortexm3            = "${TUNE_FEATURES_tune-armv7m} cortexm3"
+PACKAGE_EXTRA_ARCHS_tune-cortexm3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7m} cortexm3"
+
+#
+# Defaults for ARMv7-m
+#
+DEFAULTTUNE ?= "armv7m"
+
+TUNEVALID[armv7m] = "Enable instructions for ARMv7-m"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', ' -march=armv7-m', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7m', 'armv7m:', '', d)}"
+
+TUNECONFLICTS[armv7m] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv6m.inc
+
+
+AVAILTUNES                            += "armv7m"
+ARMPKGARCH_tune-armv7m                 = "armv7m"
+TUNE_FEATURES_tune-armv7m              = "armv7m"
+PACKAGE_EXTRA_ARCHS_tune-armv7m        = "armv7m"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
new file mode 100755
index 0000000..505897a
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-1m-main.inc
@@ -0,0 +1,19 @@
+#
+#
+# Defaults for ARMv8.1-M.main
+#
+DEFAULTTUNE ?= "armv8-1m-main"
+
+TUNEVALID[armv8-1m-main] = "Enable instructions for ARMv8.1-m.main"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', ' -march=armv8.1-m.main', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-1m-main', 'armv8-1m-main:', '', d)}"
+
+TUNECONFLICTS[armv8-1m-main] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv8m-main.inc
+
+
+AVAILTUNES                            += "armv8-1m-main"
+ARMPKGARCH_tune-armv8-1m-main          = "armv8-1m-main"
+TUNE_FEATURES_tune-armv8-1m-main       = "armv8-1m-main"
+PACKAGE_EXTRA_ARCHS_tune-armv8-1m-main = "armv8-1m-main"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
new file mode 100755
index 0000000..5df1728
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-base.inc
@@ -0,0 +1,18 @@
+#
+# Defaults for ARMv8-m.base
+#
+DEFAULTTUNE ?= "armv8m-base"
+
+TUNEVALID[armv8m-base] = "Enable instructions for ARMv8-m.base"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', ' -march=armv8-m.base', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-base', 'armv8m-base:', '', d)}"
+
+TUNECONFLICTS[armv8m-base] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv7m.inc
+
+
+AVAILTUNES                          += "armv8m-base"
+ARMPKGARCH_tune-armv8m-base          = "armv8m-base"
+TUNE_FEATURES_tune-armv8m-base       = "armv8m-base"
+PACKAGE_EXTRA_ARCHS_tune-armv8m-base = "armv8m-base"
diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
new file mode 100755
index 0000000..a03c01c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8m-main.inc
@@ -0,0 +1,19 @@
+#
+#
+# Defaults for ARMv8-M.main
+#
+DEFAULTTUNE ?= "armv8m-main"
+
+TUNEVALID[armv8m-main] = "Enable instructions for ARMv8-m.main"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', ' -march=armv8-m.main', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8m-main', 'armv8m-main:', '', d)}"
+
+TUNECONFLICTS[armv8m-main] = "armv4 armv5 armv6 armv7a"
+
+require conf/machine/include/arm/arch-armv8m-base.inc
+
+
+AVAILTUNES                          += "armv8m-main"
+ARMPKGARCH_tune-armv8m-main          = "armv8m-main"
+TUNE_FEATURES_tune-armv8m-main       = "armv8m-main"
+PACKAGE_EXTRA_ARCHS_tune-armv8m-main = "armv8m-main"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
new file mode 100755
index 0000000..7849ff6
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M0
+#
+DEFAULTTUNE ?= "cortexm0"
+
+TUNEVALID[cortexm0] = "Enable Cortex-M0 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0', ' -mcpu=cortex-m0', '', d)}"
+
+require conf/machine/include/arm/arch-armv6m.inc
+
+AVAILTUNES                            += "cortexm0"
+ARMPKGARCH_tune-cortexm0               = "cortexm0"
+TUNE_FEATURES_tune-cortexm0            = "${TUNE_FEATURES_tune-armv6m} cortexm0"
+PACKAGE_EXTRA_ARCHS_tune-cortexm0      = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
new file mode 100755
index 0000000..83f8cac
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm0plus.inc
@@ -0,0 +1,14 @@
+#
+# Tune Settings for Cortex-M0+
+#
+DEFAULTTUNE ?= "cortexm0-plus"
+
+TUNEVALID[cortexm0-plus] = "Enable Cortex-M0 Plus specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0-plus', ' -mcpu=cortex-m0plus', '', d)}"
+
+require conf/machine/include/arm/arch-armv6m.inc
+
+AVAILTUNES                            += "cortexm0-plus"
+ARMPKGARCH_tune-cortexm0-plus          = "cortexm0-plus"
+TUNE_FEATURES_tune-cortexm0-plus       = "${TUNE_FEATURES_tune-armv6m} cortexm0-plus"
+PACKAGE_EXTRA_ARCHS_tune-cortexm0-plus = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0-plus"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
new file mode 100755
index 0000000..0bcdbe2
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm1.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M1
+#
+DEFAULTTUNE ?= "cortexm1"
+
+TUNEVALID[cortexm1] = "Enable Cortex-M1 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm1', ' -mcpu=cortex-m1', '', d)}"
+
+require conf/machine/include/arm/arch-armv6m.inc
+
+
+AVAILTUNES                            += "cortexm1"
+ARMPKGARCH_tune-cortexm1               = "cortexm1"
+TUNE_FEATURES_tune-cortexm1            = "${TUNE_FEATURES_tune-armv6m} cortexm1"
+PACKAGE_EXTRA_ARCHS_tune-cortexm1      = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm1"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
new file mode 100755
index 0000000..12d4c14
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm23.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M23
+#
+DEFAULTTUNE ?= "cortexm23"
+
+TUNEVALID[cortexm23] = "Enable Cortex-M23 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm23', ' -mcpu=cortex-m23', '', d)}"
+
+require conf/machine/include/arm/arch-armv8m-base.inc
+
+
+AVAILTUNES                          += "cortexm23"
+ARMPKGARCH_tune-cortexm23            = "cortexm23"
+TUNE_FEATURES_tune-cortexm23         = "${TUNE_FEATURES_tune-armv8m-base} cortexm23"
+PACKAGE_EXTRA_ARCHS_tune-cortexm23   = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-base} cortexm23"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
new file mode 100755
index 0000000..605c9a7
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm3.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M3
+#
+DEFAULTTUNE ?= "cortexm3"
+
+TUNEVALID[cortexm3] = "Enable Cortex-M3 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm3', ' -mcpu=cortex-m3', '', d)}"
+
+require conf/machine/include/arm/arch-armv7m.inc
+
+
+AVAILTUNES                            += "cortexm3"
+ARMPKGARCH_tune-cortexm3               = "cortexm3"
+TUNE_FEATURES_tune-cortexm3            = "${TUNE_FEATURES_tune-armv7m} cortexm3"
+PACKAGE_EXTRA_ARCHS_tune-cortexm3      = "${PACKAGE_EXTRA_ARCHS_tune-armv7m} cortexm3"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
new file mode 100755
index 0000000..d9c88aa
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm33.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M33
+#
+DEFAULTTUNE ?= "armv8m"
+
+TUNEVALID[armv8m] = "Enable instructions for ARMv8-m"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8m', ' -march=armv7-m', '', d)}"
+
+require conf/machine/include/arm/arch-armv8m-main.inc
+
+AVAILTUNES += "armv8m"
+ARMPKGARCH_tune-armv8m ?= "armv8m"
+TUNE_FEATURES_tune-armv8m = "armv8m"
+PACKAGE_EXTRA_ARCHS_tune-armv8m = "armv8m"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
new file mode 100755
index 0000000..562ee81
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm35p.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M35P
+#
+DEFAULTTUNE ?= "cortexm33p"
+
+TUNEVALID[cortexm35p] = "Enable Cortex-M35p specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm35p', ' -mcpu=cortex-m35p', '', d)}"
+
+require conf/machine/include/arm/arch-armv8m-main.inc
+
+
+AVAILTUNES                          += "cortexm35p"
+ARMPKGARCH_tune-cortexm35p           = "cortexm35p"
+TUNE_FEATURES_tune-cortexm35p        = "${TUNE_FEATURES_tune-armv8m-main} cortexm35p"
+PACKAGE_EXTRA_ARCHS_tune-cortexm35p  = "${PACKAGE_EXTRA_ARCHS_tune-armv8m-main} cortexm35p"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
new file mode 100755
index 0000000..74aa27c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm4.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M4
+#
+DEFAULTTUNE ?= "cortexm4"
+
+TUNEVALID[cortexm4] = "Enable Cortex-M4 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm4', ' -mcpu=cortex-m4', '', d)}"
+
+require conf/machine/include/arm/arch-armv7em.inc
+
+
+AVAILTUNES                            += "cortexm4"
+ARMPKGARCH_tune-cortexm4               = "cortexm4"
+TUNE_FEATURES_tune-cortexm4            = "${TUNE_FEATURES_tune-armv7em} cortexm4"
+PACKAGE_EXTRA_ARCHS_tune-cortexm4      = "${PACKAGE_EXTRA_ARCHS_tune-armv7em} cortexm4"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
new file mode 100755
index 0000000..3f7f3d7
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm55.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M55
+#
+DEFAULTTUNE ?= "cortexm55"
+
+TUNEVALID[cortexm55] = "Enable Cortex-M55 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm55', ' -mcpu=cortex-m55', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-1m-main.inc
+
+
+AVAILTUNES                            += "cortexm55"
+ARMPKGARCH_tune-cortexm55              = "cortexm55"
+TUNE_FEATURES_tune-cortexm55           = "${TUNE_FEATURES_tune-armv8-1m-main} cortexm55"
+PACKAGE_EXTRA_ARCHS_tune-cortexm55     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-1m-main} cortexm55"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
new file mode 100755
index 0000000..8409108
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexm7.inc
@@ -0,0 +1,15 @@
+#
+# Tune Settings for Cortex-M7
+#
+DEFAULTTUNE ?= "cortexm7"
+
+TUNEVALID[cortexm7] = "Enable Cortex-M7 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm7', ' -mcpu=cortex-m7', '', d)}"
+
+require conf/machine/include/arm/arch-armv7em.inc
+
+
+AVAILTUNES                            += "cortexm7"
+ARMPKGARCH_tune-cortexm7               = "cortexm7"
+TUNE_FEATURES_tune-cortexm7            = "${TUNE_FEATURES_tune-armv7em} cortexm7"
+PACKAGE_EXTRA_ARCHS_tune-cortexm7      = "${PACKAGE_EXTRA_ARCHS_tune-armv7em} cortexm7"
-- 
2.17.1

