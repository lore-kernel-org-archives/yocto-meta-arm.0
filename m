Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.85])
 by mx.groups.io with SMTP id smtpd.web11.306.1601313992681133360
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 10:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Mt9DjBMY;
 spf=pass (domain: arm.com, ip: 40.107.21.85, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blsFZCmB3+kM4HzCL31v0CgOMQnsZEjrbxjBbhTmTs0=;
 b=Mt9DjBMYB4/RmY63Iu6JUa5x23/Fzo6xGr990Xui6kH+i7a5/7FNe20ln0fx5qwmrLFdh4L+tQDJ7ZC7Fbu4anUrSfMv1+5NMP/ESIUUz+zyVAZUzxezo3cFGLAupG5TrxCpgn95Ib14h5ZwWXw6J7xt+khynEGPfUHmKXJX1xk=
Received: from AM6PR0502CA0049.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::26) by AM4PR08MB2626.eurprd08.prod.outlook.com
 (2603:10a6:205:7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Mon, 28 Sep
 2020 17:26:30 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::34) by AM6PR0502CA0049.outlook.office365.com
 (2603:10a6:20b:56::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Mon, 28 Sep 2020 17:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 17:26:29 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Mon, 28 Sep 2020 17:26:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 39e26d045d018e78
X-CR-MTA-TID: 64aa7808
Received: from bfec3e0c8962.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2D43F376-5AE2-4167-9BFE-D6BDE10769A1.1;
	Mon, 28 Sep 2020 17:26:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bfec3e0c8962.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 28 Sep 2020 17:26:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAOmfab7QwHniV2FXvr1qrbCHMJu3gq3XDU2gH7ugFZkoQGMFqsC5ZRt4fobqu4ihxmF53V2qB233bY2iJNrjpsZcMDzzCvsmpi86TFpOEBNc29GoG8ORN2ZKiBH7oIhpTMs/lzOEKqkQWSeFjobWdGsHD3wpWBjAXgiTMxkTVTrjbaBmzDlcF5cnnk859zRPYE4b0LuTjZNUkWJ4TbGGHGasQEZ/KdYuyPfIZf1QTPKi+3sxbX0cTZfmBVpElrjqYqbJ8ax+/00jwYupUnAaKEfDgriuRkVmq0tfHWwQ8V2Xvm65lImAgj/YXKi/4/VvtrhY4XuPELdXxqZ981Vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blsFZCmB3+kM4HzCL31v0CgOMQnsZEjrbxjBbhTmTs0=;
 b=PX02PfkOZfJ9plD1QrDTJ9VyeykuzndqtzndLXCpCUgCi9HuVMVnCUB3imzSFLFKdtYhPb8dyknu4BSwmmbZ8/OKh8NK2jxMlavY29biN4XCnKFeGdsLGArkjGdb2sXbYshQGTEl3ohMctdi+4tfMKWPcv1W6U3OXjHCtkDR48t8edi1U6eQkBUHFWkFhkxbW80d1L9mSskRnW8FGK3cwUbyFhkKu13pvxuIwD7Efym8KvCh5tfnCJj5Vh4DcDg9y6A5FOZJdu69rOV+fgjYKj2CsB7rYfS0gNiEwf2APIPW4J+6znIG/MEAb8dGzczwcSYWqDxTQCTEZCY/vIwc2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blsFZCmB3+kM4HzCL31v0CgOMQnsZEjrbxjBbhTmTs0=;
 b=Mt9DjBMYB4/RmY63Iu6JUa5x23/Fzo6xGr990Xui6kH+i7a5/7FNe20ln0fx5qwmrLFdh4L+tQDJ7ZC7Fbu4anUrSfMv1+5NMP/ESIUUz+zyVAZUzxezo3cFGLAupG5TrxCpgn95Ib14h5ZwWXw6J7xt+khynEGPfUHmKXJX1xk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3436.eurprd08.prod.outlook.com (2603:10a6:10:44::15)
 by DB7PR08MB3498.eurprd08.prod.outlook.com (2603:10a6:10:4c::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Mon, 28 Sep
 2020 17:26:23 +0000
Received: from DB7PR08MB3436.eurprd08.prod.outlook.com
 ([fe80::b170:fde5:ab0b:2307]) by DB7PR08MB3436.eurprd08.prod.outlook.com
 ([fe80::b170:fde5:ab0b:2307%5]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 17:26:23 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2] arm-bsp/recipes-kernel: Update fvp-base-arm32 BSP definition
Date: Mon, 28 Sep 2020 18:26:10 +0100
Message-Id: <20200928172610.19234-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To DB7PR08MB3436.eurprd08.prod.outlook.com
 (2603:10a6:10:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e110568.arm.com (217.140.99.251) by LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Mon, 28 Sep 2020 17:26:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a0b3d079-bd4a-463f-3321-08d863d3a309
X-MS-TrafficTypeDiagnostic: DB7PR08MB3498:|AM4PR08MB2626:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB26264B0123A0B94D7744AD2C89350@AM4PR08MB2626.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 eTdUq9SitlXwOXuMBasmSiAnMMhWPmCqIRM1ERraqF+YNVj3QV5pnEiB9skF8UvhAUP1rFZ8YYe6mIDnDAU6RijUazSIp+pQ7TS2h7R4pfedvHF9Ujrae0Lzq5VUAbWOdI+Pb+8OugO5+aMKVbzXSGcjLPQvM9oaAZA3qGaxxlHXqqKB6rUWgeLH0CRyoiLN24NoJvnFk9V9axQc6HEaNanbGJYQw1Kzg6oP3c20co+8t37gcQFINvn2tu3mjFytTb8FM6yCih+x2dPma3cOEQUGFnhRmDUmyY+LBbL/rH7ssA2tpoJ54/xxCoIDMtKt2V+LJa+E8v3KvY/6eWTYNSrrBisPsjyYIdNkDMH4F8sy2dXWTsCZDt9ll3CibI8q
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3436.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(366004)(346002)(376002)(1076003)(4326008)(2906002)(6666004)(66476007)(66556008)(66946007)(86362001)(478600001)(83380400001)(186003)(16526019)(44832011)(26005)(956004)(8676002)(2616005)(6486002)(8936002)(6916009)(7696005)(15650500001)(316002)(5660300002)(36756003)(52116002)(19627235002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 4rE4jg4/FFBzDiMVlUkSjterr2S2VxaXWcWlRVje5MxOexmKc0qA36tz+8kpVWmPAFh3N/E2q0/4qeJBHeZ3r9pRBGvzppMIBTqnwAmWGwSVNAraMs0wSdmJzdm1WID014H6wVUELeTpaG8q88t25+XdjnASTg2X48NZyNMK44GywiY7nLtvXjHQCPSVLLaeNnJSR8neB7wrbMPbZMHvzOHMCfAW63SK036ieeuyPMW5AifWdqyoz6XkA/4oNmd/BrUTWP8OmqxqXU7ufcklETJRa6eYRXwSXVHIrieEoUWKYJzlF6VDSzxnzMheNPhnItA2E9z2GHB2btBh5MTCcAl2M6X7h4AkuyEVxC4F1KCsJ03/l13kmdlV+dhEkyv9UCdOEMbZilUxCpqrlbByFKqORKDpx9RtlGT3PE+nPUUQq2FP8GTVNxmCrC5D0vCBdIjBn6zGs03tzPHexGh8o8g3VSwLIOiCOhLbAFNHPyNxU6eler8dcbb0Jc2E2H4p+NdIYCuUGOiF6DUdLFRkgpR4LPQQoPA1ZYcqDCW76cLgORvSv+J49mOM13WuwyStrlC+fg6YfMCKjhJ3RpB1p8Q/4PekfTEs9aFW+iqULTQyFG91cWtbMNO67BsZCcmdgPQvB/kn26TOH7JWToe6eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3498
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5b64cd99-5038-44d5-4191-08d863d39efe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f7u0ce9X6vte3P7a+p8b3un7+V7UraY1DxZITvV/MVGklgnMg698hZrEWUUgM+qa2RGN/vblSUEZknA/TNFQVr3n/GFp5Kwb/RAZAVYnvJLXG33tER1o2wyH982fGV8kPQBM1zRhQHhKbnl5TlPu5A7EUO0N3qZWVpou/yz75yCh+LL21GvgP1PQFEf7R11gcD6Mkx/sCxZqtQvNUnm/Zv23JswhDzVELdLmT8zd8QcSKx0+ngWCFvYSFcU4/0XVmVejYG5qZBKEcghbUMPw1ROVzQX2GgUqbJONK7G2hcZZGhP0woSFm4LCOD83DXgpeAa0Eesp2tBS3XMFfAIbABWGQrtrUL7n/1shD8JtlVyxxURbgKySuFc31iwU20fJi4ZmPiJM7yO4nw6P9fN3ex7kjq2Ey4KxbLnQQzN4D7xEqBGZbivuzzMcSAK2SCFD
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(46966005)(15650500001)(70586007)(83380400001)(47076004)(70206006)(478600001)(44832011)(86362001)(7696005)(26005)(336012)(82740400003)(1076003)(186003)(956004)(16526019)(2616005)(5660300002)(316002)(36906005)(356005)(8936002)(4326008)(82310400003)(6666004)(2906002)(6916009)(6486002)(81166007)(8676002)(36756003)(19627235002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 17:26:29.6364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b3d079-bd4a-463f-3321-08d863d3a309
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2626
Content-Type: text/plain

Update to use the yocto-kernel-cache 'standard' configuration
and edit 'fvp-features.cfg' to remove duplicate configs.

Change-Id: I49617bdac554571aa1242080797cb60327e527da
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../bsp/arm-platforms/fvp-arm32-standard.scc  |  3 ++-
 .../bsp/arm-platforms/fvp-arm32.scc           |  2 --
 .../arm-platforms/fvp-arm32/fvp-features.cfg  | 25 +++----------------
 .../0001-ARM-vexpress-enable-GICv3.patch      |  0
 .../fvp-base-arm32-dts.patch                  |  0
 .../linux/linux-arm-platforms.inc             |  3 ++-
 6 files changed, 8 insertions(+), 25 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32 => files/fvp-base-arm32}/0001-ARM-vexpress-enable-GICv3.patch (100%)
 rename meta-arm-bsp/recipes-kernel/linux/files/{ => fvp-base-arm32}/fvp-base-arm32-dts.patch (100%)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
index a92d945..6569027 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
@@ -1,7 +1,8 @@
 define KMACHINE fvp-arm32
 define KTYPE standard
 define KARCH arm
-define KMETA_EXTERNAL_BSP t
+
+include ktypes/standard/standard.scc
 
 include fvp-arm32.scc
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
index f95b036..85659aa 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
@@ -1,8 +1,6 @@
 include features/input/input.scc
 include cfg/timer/no_hz.scc
 
-patch fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
-
 kconf hardware fvp-arm32/fvp-board.cfg
 kconf hardware fvp-arm32/fvp-features.cfg
 kconf hardware fvp/fvp-net.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
index 42cd476..12e7697 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
@@ -1,26 +1,9 @@
-CONFIG_MODULES=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXT4_FS=y
-CONFIG_BINFMT_SCRIPT=y
 CONFIG_BINFMT_MISC=y
-CONFIG_PRINTK_TIME=y
+CONFIG_BOUNCE=y
 CONFIG_HIGHMEM=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_TMPFS_XATTR=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DEBUG_FS=y
-CONFIG_GENERIC_SCHED_CLOCK=y
-CONFIG_CLKDEV_LOOKUP=y
-CONFIG_NET=y
-CONFIG_NETDEVICES=y
-CONFIG_UNIX=y
-CONFIG_ETHERNET=y
+CONFIG_HIGHPTE=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_NEON=y
 CONFIG_VFP=y
 CONFIG_VFPv3=y
-CONFIG_NEON=y
-CONFIG_KERNEL_MODE_NEON=y
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch
rename to meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 79ef26e..b76d68b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -41,7 +41,8 @@ SRC_URI_append_fvp-base = " file://fvp-base-dts.patch"
 #
 COMPATIBLE_MACHINE_fvp-base-arm32 = "fvp-base-arm32"
 KMACHINE_fvp-base-arm32 = "fvp-arm32"
-SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch"
+SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch \
+                                  file://0001-ARM-vexpress-enable-GICv3.patch"
 
 #
 # Juno KMACHINE
-- 
2.17.1

