Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web11.1291.1600788512005437601
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 08:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fT1rSDmn;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw1O6vFhc1l41ooccYOK3GT9T6j8vS5xIA6RBI/sU/Y=;
 b=fT1rSDmn/ErtoGBcVyBvrZDV01/cRC368P6cqk18LLo1tv7nZQXMXA61Pr6ZOuSTsqFJ0+4bt8HLZZmxVPHufxpHFIDENhEMHJNnX9aLJWcWOstzTbk14b6C7QngDcMWuW3zZ9EtLpWGFsdr6wCrLxcn8MeaoIb7kzjZFcgrmXU=
Received: from MRXP264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::26)
 by DB7PR08MB3226.eurprd08.prod.outlook.com (2603:10a6:5:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Tue, 22 Sep
 2020 15:28:29 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::cc) by MRXP264CA0014.outlook.office365.com
 (2603:10a6:500:15::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Tue, 22 Sep 2020 15:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 15:28:28 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Tue, 22 Sep 2020 15:28:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c24b2c15e07af2d5
X-CR-MTA-TID: 64aa7808
Received: from e88027f2b75c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6DD3D96F-2E9D-4547-9559-EE2C040E857B.1;
	Tue, 22 Sep 2020 15:28:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e88027f2b75c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Sep 2020 15:28:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjBVrdWGqbKxHm4TLRHgrUn7CquYeVHzRD58CxZIfZql6KNNGa6uo8ezntBs+HrnC7/Bwf84DTOiZbDlAZBcW0qqdPkclOVfLtSXSxsrT9t2PegpF4vWeW7iQrTQJSCb9/WrrWqLtWCLqrDs7AeR0QoTdkpHYJ7yYms5iYBWAUsyMWPLeJwnh6AeJTax2PrdRxGlt5UCmw60qpuo2y17Ab9R5RPM5rG2J5ddnooqNBCgK75MgucuUWl3bYBfk4/q1T9UQZoYKpWPmhkXDU2x7c8sRXOAj4cR6wSrc/oE+MVvsEhbzulxNbA/pljI74tcOEECVWkCAVEABE0PLJFTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw1O6vFhc1l41ooccYOK3GT9T6j8vS5xIA6RBI/sU/Y=;
 b=OKIxr4lLoeZjjiMhdMfn3jXeqMxkr8s1QlFRkEROTu4ZM/zzvZJeor48jRJXFeFQAnAshCpqkkEyZ+UcDXKqIwwES3vwc/S2ZhRxC7pkQo+9RfBYpbO+f/OZrb8YL1FSxaWgzZTaLosi0f3dUxcOXFXpw1GVQUyMdrk1eSq8VN+2wLznQ0hsHUPt/vvJymZHWSaLBe0w27bm8zMjOM2OtmJvTtVBxNGVythmeaxvqwob9IlGYYnnXLa0JQSf0yrZC8OUT6hMd7JijNCXFJZgOOCAU9kOPU/kwpmihOKgK/I7X+KNBO3ZJ2tYnv8FHPPuaBXQOQj8FO9QgAM5DHOOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw1O6vFhc1l41ooccYOK3GT9T6j8vS5xIA6RBI/sU/Y=;
 b=fT1rSDmn/ErtoGBcVyBvrZDV01/cRC368P6cqk18LLo1tv7nZQXMXA61Pr6ZOuSTsqFJ0+4bt8HLZZmxVPHufxpHFIDENhEMHJNnX9aLJWcWOstzTbk14b6C7QngDcMWuW3zZ9EtLpWGFsdr6wCrLxcn8MeaoIb7kzjZFcgrmXU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3436.eurprd08.prod.outlook.com (2603:10a6:10:44::15)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 15:28:20 +0000
Received: from DB7PR08MB3436.eurprd08.prod.outlook.com
 ([fe80::b170:fde5:ab0b:2307]) by DB7PR08MB3436.eurprd08.prod.outlook.com
 ([fe80::b170:fde5:ab0b:2307%5]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 15:28:20 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/recipes-kernel: Update fvp-base-arm32 BSP definition
Date: Tue, 22 Sep 2020 16:27:57 +0100
Message-Id: <20200922152757.26272-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0401CA0015.namprd04.prod.outlook.com
 (2603:10b6:803:21::25) To DB7PR08MB3436.eurprd08.prod.outlook.com
 (2603:10a6:10:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e110568.arm.com (217.140.99.251) by SN4PR0401CA0015.namprd04.prod.outlook.com (2603:10b6:803:21::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 15:28:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fcfb8f6-eddf-4919-f624-08d85f0c27f9
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:|DB7PR08MB3226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB32268B3AE5F8CF0FC791A482893B0@DB7PR08MB3226.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zVPSnQ0s+EbGSnStD1455i0/GfDna7dma/bMEjBl2nE8WNMCCnEgesLHgJhoAL2bB3MjlvmIUq/YDdlhdSfYuRN2242tP042i1zQ+uMygIcmsZm/rCth2b7jS0XkUMaAwSyZqgbSXXrKRyeWP+Gl5g4zHq++Jde2lkJyvjRmra0hDNSNmbafM5adXA1wz0ShAQR9utx8ZdbsCqBy5iUpB91wv3uQ1boTftl9K9tJ759WykT50lNv5H/uScxmVPnmUKohb8s3cQwZpB/VMcxa7Z11exWeHUh+NlmEChAZjpI/jTQUin5c7RKUOGyunPnL//yWWpkba7ysmIOQte+ETFTsgdd9Vf8fL64ssL45CX2QKwM2D6x/EPRwymIII900
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3436.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(39850400004)(396003)(478600001)(83380400001)(86362001)(44832011)(6486002)(26005)(66946007)(66476007)(66556008)(7696005)(52116002)(19627235002)(186003)(1076003)(16526019)(6916009)(36756003)(2616005)(316002)(2906002)(5660300002)(15650500001)(8936002)(4326008)(6666004)(8676002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 v3pBAegXThs0bTcu6ySZmY1AdNs8H3wQBiW1SEJHQSl9ih3oPbW7ALQAjb1S/ucqQnQzclRd20OV6I9ueQOeaobbjC90daRqCljc+gGz1cvdlauVktRvHLnpvtuBNGQqyfWafRnD1hFee6h6YiIMQ5gLY/Hx9zN1sr8bmbdKWobZNOh7KQd1WZKpMiuGyqvfEq9iPTjYE2eL0z0wz57ikSNKiEuBbzQuKl+YyDm6BDhvJAxTmXS+0IutqY8apnc7vMU9elk0z5j57jaIhReiDSUSKXREkDQSRBiApAIu1Q7Ji0Pt5ub5lybusmCCl1S5PUrO5ECFXF7Ve+uXzeVzbtLHpjC7Dvug+3sJZZeQ3QnTP7Va9pyRgl1IS7e7+h8Qt7fnjiYjkX2iaGpDiiiNfltqq/Jgu16gZAscctoacIMdu9W1nQ1D/uXjM1z2+rDq7Ypd2Z4wXa9lCqJNQk6Wja5tLnBOLXIJIn24vO4VaZkButD8hm5xG8Y7vX+lKTZ1dHavrGaWNbYquW6Tz1UJ4NsgSViDN1nhpwpSHxDvA0gb525UsIaJbESVBigyrfmBILTFVz0UFo+S+3iEZUFQYjb4bAoig+LCyNwqdJkpYeN2Yi+M444w+TpWS222sha2Q0yXJfiE/Z4uAh/mrXGP3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	306c2cab-c285-41fb-6ab4-08d85f0c2307
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	COIRJzVI0zTCSMDUoBYQkTeaORbs2uIDoBYa4R6v29pSDOYmVLQ6+i1mh1iz++qrkLNC5cHvHyqtAapnhLVnlel4lUAktYOLb4E8K4CFsz3CAi6EIWuxhQP/4TKbxmb9ir9s+ye6A1dPo+QEvJp+Vq9+8gr0vp3ITGBvDMmzjXkDTHMnCuwTnVltYr/Uuy5J131+HY9hqwwIjkU6u/dA/yDmKxBqV42Rff+DlDEHEKmYt+jY19JyN5VHWggjUWnrFbu4EvERMdqjz1kG/tCx0GXGf3fUaJo44KB+bMEq5ts8BCuOmjKoq97GnSqSezalAv9FeW42t3KAgi/1y1NX4gpxXbQ+Qwb5bQeyypOTNJRK/NuDlna5BAC6JGyrTLBkMm72cyc16ppT3nmjHHm0Gg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(8676002)(6486002)(6666004)(81166007)(16526019)(26005)(356005)(7696005)(19627235002)(36906005)(86362001)(82310400003)(186003)(478600001)(70586007)(70206006)(8936002)(6916009)(316002)(83380400001)(15650500001)(36756003)(82740400003)(956004)(5660300002)(47076004)(2616005)(2906002)(1076003)(336012)(4326008)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 15:28:28.6714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fcfb8f6-eddf-4919-f624-08d85f0c27f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3226
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
 .../linux/linux-arm-platforms.inc             |  3 ++-
 5 files changed, 8 insertions(+), 25 deletions(-)
 rename meta-arm-bsp/recipes-kernel/linux/{arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32 => files/fvp-base-arm32}/0001-ARM-vexpress-enable-GICv3.patch (100%)

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

