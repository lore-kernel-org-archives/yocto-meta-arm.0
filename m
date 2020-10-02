Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.78])
 by mx.groups.io with SMTP id smtpd.web12.14270.1601650199456333059
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 07:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KkjzgfQL;
 spf=pass (domain: arm.com, ip: 40.107.3.78, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhpK5FIFpUzhp34h+0KuXBBt2uzQlpILZhRlpuQltMM=;
 b=KkjzgfQLwS2REFVV77HGmXooTb14Y+T+b/xAJ435kPvbuDg6U2uVsxzDi6A+tYG9tVlg3TAfoLdfd7vfQlo+GHDo07xb+G+2MJsXliqgUDs9OyM9E6A8WPNF3Qy3qRugj2xZuxb1vk8ImSb1w21qY+Lna/F06wP5UWtBanxUcIg=
Received: from DB6PR07CA0202.eurprd07.prod.outlook.com (2603:10a6:6:42::32) by
 AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34; Fri, 2 Oct 2020 14:49:56 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::df) by DB6PR07CA0202.outlook.office365.com
 (2603:10a6:6:42::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.18 via Frontend
 Transport; Fri, 2 Oct 2020 14:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:49:56 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 02 Oct 2020 14:49:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f03da80f8feae2d6
X-CR-MTA-TID: 64aa7808
Received: from 79aecebfa683.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6FBB1B9A-C4F9-4173-B3A1-FF9DA624928E.1;
	Fri, 02 Oct 2020 14:05:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79aecebfa683.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:05:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mw5hyuRW+sODeqoXO6JhPEyCsPC8omHe+sXMv8fZLLA+jBNQV+vOriOmshOj+XUW/UFcs++jso5EHnwPnIqrjtN1RbDZFXUzl6osoRC9rSQFiZY57gKwjXBkQ7QChK2UzI8f93Vukcqj9dk2BiQobgJ+H6CtyyxFK4g8Lu2nuejn1uxzqaDEff3PB+SivPWAIDcnipiJehm1trXG+oP2/9n6Q4Jc2EEkc+ty3W2ZzYVWc3FpEBEz8P+M9GZtH1Y71nESA1hw8Xm8UBu+s9qiMEhUwnFAoaAda/D86vQYZuM+YybzdgI54r0zNhHzrwqwpL4w1/IyYj16tkKdF5b2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhpK5FIFpUzhp34h+0KuXBBt2uzQlpILZhRlpuQltMM=;
 b=Q+jk4n4JpVrkuzOiJUD+7ww4hBXP6htt7JC9HKboMIUYON8JfVdUQtwOovcOODZnTgHuKhnNRKPQHNEdYH3a3+0kUrCZc5kucD9LeglvUwqAegWfH52DqKJuUyD6qSxrauuNDIwNyUKyTYyxY90MNrbHO7y4iSfXaTyh/kJ9Nl79oP2Zp9BuJ9MM0pQPIKiTCxUW7Ycprv58E8m+SvN7q1EEyCJS5gwPFHjQTyhDJPZHsvuEzw0x6jciIU1hatJX4/F6bUynRtAarmjUuyAlFibntZ7NBxgFGAwMskzV+gq9TuReNITiCVcfd5xB5j7o8kGituCtyKZh4YzuFZXWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhpK5FIFpUzhp34h+0KuXBBt2uzQlpILZhRlpuQltMM=;
 b=KkjzgfQLwS2REFVV77HGmXooTb14Y+T+b/xAJ435kPvbuDg6U2uVsxzDi6A+tYG9tVlg3TAfoLdfd7vfQlo+GHDo07xb+G+2MJsXliqgUDs9OyM9E6A8WPNF3Qy3qRugj2xZuxb1vk8ImSb1w21qY+Lna/F06wP5UWtBanxUcIg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 14:05:04 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3433.037; Fri, 2 Oct 2020
 14:05:04 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] arm-bsp: musca-b1: Add Zephyr support
Date: Fri,  2 Oct 2020 10:04:05 -0400
Message-Id: <20201002140405.7896-7-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002140405.7896-1-jon.mason@arm.com>
References: <20201002140405.7896-1-jon.mason@arm.com>
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: BMXPR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::27) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by BMXPR01CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Fri, 2 Oct 2020 14:04:56 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 02 Oct 2020 10:04:49 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4b173ad7-e7a3-497a-267c-08d866e26dd6
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|AM7PR08MB5494:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB5494B55B61D00A3CA12AF92CF0310@AM7PR08MB5494.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 k8SAwwGtBeQkxLW5Duuwa0pVH4y2/lpqw9tMSvDjHag2WjJDerf53KLLNA8HGq5XYdAkSIV1IPLm3P47epVJt7u/7oE91NMj3VypImCHO/edjnT5gmTlNC2t3nYOGIkOkDSVlLFSMMiSwRw9c87wjGKCAp/KdX0sQLjganzSZWishVRcVASaRXH4H6C/c/BRwBCNp55NMZOpVL8vcyC2SsypwGOaG2wlVO/34Ruf1ACtH5AefpbAO0d0C4kopFxZMbnENlWN1wEVEp0lTyY1LCxU5TZexunfZfugjDO19h5s/1Vqnx6w6tZau3ndilVCmrHhdgOtxqVgA/QcsJsmIg0nrwh0wCM/4/3v+abzFjOrPWPz08OipUPqDFqg3RSIANi2bSDBQk24nmQMoTRNQ3KTyQn4Ukum8OlkZvJwFKGHEU8C9V6iUwuycvIGn8xLhY0OW0NK4pTZ/kAx9syzrg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(186003)(26005)(1076003)(2616005)(44832011)(6666004)(426003)(66476007)(86362001)(66556008)(52116002)(66946007)(36756003)(5660300002)(8676002)(6916009)(478600001)(8936002)(42186006)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 vGGRPNSiDLknN3j0tHldTV1tuDSzBi3M5FdmlVbcSqWI/kUfHrGwUK4MBL9f8ThdGJqdNaFd3MNoijL09TSwQmndi2i5V1qA/PCvL1A4Itv+HZAARaA16tRTYTgrWwXZlo62fEKPFzERhlbU1u73FGkafec+D8GLLXcYQ3QXFfS09ZOvTF3nBZKjkwXdMJfA9lxCATLRm+Pau/ysQgl2+vL1KDc1sn5I587hA/80dVzKvMNeW4C43jCrqWE0+D1Hrl3tAWYsT1FBHfOSMv1v1hmxTPX/s4KcjfOHQk1KVnuNYcJUCcZ0ArSLUPvwXE9YdqkJJy6BheYmc663bY0sGPbw282eiUkqqBvXwCd1ZWPicQqWgApW7mTO+FuxdfyFBo7cwvPQ2oGCnSE0CrFVZWbOL6y/Vra0GN1HiEp7SiA1z7dGiIBDc+FokgluPcLTEoR6jNdir1ml55Vtv93zMeYUw+ZDtO7HkcW5flr1lhXvT4gd8iHazVHYz3AQ6k3ZXVbveppvcr63BtTi2/CNOqISEmrwtj9JnBFB+y6bmmfBUPfxh8ZnVo6g6RMgt08371IYDBjrYNb/qK5+DOn/0c7JnhX5X/Yc0QNdxSMf+TSRUksmMDatKk1Dtkelx+FXTfh2VuTriziLYjQW2JDooQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4333e2cc-2634-4a13-14da-08d866dc24df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DvnSsWIzIejJ7biDl0qkRb/CgWQY2vQpBS5ZKn4woaEcnj/gKjCG3ATdQoN1a2B7DLekpm/3Ocp1G7PPSH0IUAP4Y4umaPo9JXWxuFqUM4phpPSAIicxp/+jao1EENINhNWe9G8olv3VjfPPjb61yFIVpIbGHE3V3d0mi0NwxC2YdNiCNuS/p/fT5EBh5TvKCcphezx3FKt33iaJnSAVT8gokEVKkv6Ez4ZjjbBqmMHI3RsY6UnGmVvSrywowP7vplqsggSXc2JISRmMOvIXOKK/qHyzfUvdkO+JOlhWHaofZxHHvJEmSz4hZOGCS2far7+sPDo110FP7YxhOTow0mHhdo7jCVjwcT+T9CF/hrIrhr0Pgk/AaH7xaHro/NkskUUw71eq9dmiwkQveAdQIRnUanzgV2MSHQqV7nRkUaTCvdco7WCfTWSgh4dYiyrEyGKRjB/GO+h9LUE4DtGsH522Z6APCxGecGLeEe3+Ccs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(36756003)(83080400001)(82310400003)(82740400003)(6916009)(2616005)(356005)(316002)(86362001)(2906002)(81166007)(42186006)(47076004)(70586007)(26005)(5660300002)(478600001)(426003)(336012)(44832011)(186003)(6666004)(8676002)(70206006)(1076003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:49:56.4258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b173ad7-e7a3-497a-267c-08d866e26dd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Content-Type: text/plain

Zephyr supports Musca B1, and QEMU has an emulated Musca B1 board.  Add
the relevant parts to get this compiling with meta-zephyr and (in
theory) run QEMU.

Change-Id: I9af4aea03e31e96f8eee17f44913e747b1241891
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/musca-b1.conf | 13 +++++++++++++
 meta-arm-bsp/documentation/musca-b1.md  | 26 +++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-arm-bsp/documentation/musca-b1.md

diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index e7320ba..c7b818a 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -11,3 +11,16 @@ require conf/machine/include/tune-cortexm33.inc
 
 # GLIBC will not work with Cortex-M.
 TCLIBC ?= "baremetal"
+
+# For runqemu
+require conf/machine/include/qemu.inc
+QB_SYSTEM_NAME = "qemu-system-arm"
+QB_MACHINE = "-machine musca-b1"
+QB_CPU = "-cpu cortex-m33"
+QB_OPT_APPEND = "-nographic -vga none"
+QB_MEM = "512k"
+
+# Zephyr RTOS settings
+ZEPHYR_BOARD = "v2m_musca_b1"
+ZEPHYR_INHERIT_CLASSES += "zephyr-qemuboot"
+ARCH_musca-b1 = "arm"
diff --git a/meta-arm-bsp/documentation/musca-b1.md b/meta-arm-bsp/documentation/musca-b1.md
new file mode 100644
index 0000000..9fde10a
--- /dev/null
+++ b/meta-arm-bsp/documentation/musca-b1.md
@@ -0,0 +1,26 @@
+# Musca B1
+
+## Overview
+For a description of the hardware, go to
+https://developer.arm.com/tools-and-software/development-boards/iot-test-chips-and-boards/musca-b-test-chip-board
+
+For current supported hardware by Zephyr, go to
+https://docs.zephyrproject.org/2.3.0/boards/arm/v2m_musca/doc/index.html
+
+For emulated hardware, go to
+https://www.qemu.org/docs/master/system/arm/musca.html
+
+## Building
+In the local.conf file, MACHINE should be set as follows:
+MACHINE ?= "musca-b1"
+
+To build for Zephyr:
+```bash$ bitbake-layers layerindex-fetch meta-zephyr```
+```bash$ bitbake zephyr-philosophers```
+
+To build the trusted firmware-m (and not Zephyr):
+```bash$ bitbake trusted-frimware-m```
+
+## Running
+To run Zephyr on the QEMU based machine, execute the following command
+```bash$ runqemu qemu-musca-b1```
-- 
2.17.1

