Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.53])
 by mx.groups.io with SMTP id smtpd.web12.4267.1596829430509061251
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AkoMz+8o;
 spf=pass (domain: arm.com, ip: 40.107.5.53, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkQCzz0wK+RCOcDajuhsk0LDHWXj4t/H44s6kk+rGsw=;
 b=AkoMz+8oYBfgIQpbde0nQNnpLbRtZmU15VaumXWQOSIqEX0m2vBY5B0XcyUea/1wYFX5aiDPkT1qPnajWyXXCuo25gDwTorBvw158EBs9Sg1n0VL1YcEVY7QP9b5a8xO4AUABaklBFWKPrs25T7RW/imUEI0A7x/LvJInx2e5NQ=
Received: from DB8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:10:110::22)
 by AM5PR0802MB2466.eurprd08.prod.outlook.com (2603:10a6:203:97::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 19:43:24 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::c) by DB8PR04CA0012.outlook.office365.com
 (2603:10a6:10:110::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:24 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 07 Aug 2020 19:43:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4a88b442e58431f
X-CR-MTA-TID: 64aa7808
Received: from 0b51f9194c5f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BDBF7729-C8C6-4120-B1C0-B0DACB28DF01.1;
	Fri, 07 Aug 2020 19:43:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b51f9194c5f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=il46d4B3M0R+blHgcKDESaPX9Nz6NUDY6RGuVrYRRHydSgNWPoQJEsiNgodhtn5P90XSOa+oOlsy+r/CREsxNtEfbiBsd+xKvCoLWMbWfx84j+8SX1gZ5QptbZLZJQ/BEzxv//5NYFfix3aa+fjWUU/Z4S/LQXkLUODBV6ZR2UUEmEj1Paw5SXIAuWmp0IL1q5b8gBWauCChvhZ/iAkil3mIzdv5h4jjbS7PQxy5305JqZYgIgFtkCuA/F+KWugXf+YEsDYm2ZWPMt1ypNRzbBlCT43hFit8QG1rMUgUESTmugPoAr8ALNulfT9Hsll9EdU7ZH1zq5629ECmFF7gMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkQCzz0wK+RCOcDajuhsk0LDHWXj4t/H44s6kk+rGsw=;
 b=HguvHXwSk6p38XDYsncGk4Quc+Aj41SnkVmuA/IHhG9Bt1/+s0d3nEiw8XrqXB3UNOnxilfA2PFerX6QtdBBvnksUQTx0Bg+22mzljKFtfrjGTeH3EP0e2Na9XpijaviOOSLCB6iXwWmb95+GNtfwy0Ul5A4b18OYU/M8DrIybOzZ0+ZMxnmEJrjiZ1zvAk3D0vaO1ATRwMYmnZJw6jUPCOkYg4+tRyatWCQvptZFJewGqrLQthcvK5VhXdEgEBdupru0sRHdsao1PNcz5VWKl2SUv70ntmmhU/dNU/Fb8OwbD4y2MosWOxuNmKXjtErpSHL21uZsyyYl5qx9Di//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkQCzz0wK+RCOcDajuhsk0LDHWXj4t/H44s6kk+rGsw=;
 b=AkoMz+8oYBfgIQpbde0nQNnpLbRtZmU15VaumXWQOSIqEX0m2vBY5B0XcyUea/1wYFX5aiDPkT1qPnajWyXXCuo25gDwTorBvw158EBs9Sg1n0VL1YcEVY7QP9b5a8xO4AUABaklBFWKPrs25T7RW/imUEI0A7x/LvJInx2e5NQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:18 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:18 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 4/9] arm-bsp/trusted-firmware-a: adding support for corstone700 platform
Date: Fri,  7 Aug 2020 20:42:48 +0100
Message-Id: <20200807194253.14748-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 93ff1c67-a39b-401e-b564-08d83b0a25e1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|AM5PR0802MB2466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2466D97D7CE404CF418E2040FD490@AM5PR0802MB2466.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:612;OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 H5Nza11p3rbJwD0Fq3UpeCmr7bfCpCq9PUFrozXJZRIMycHsZCRAJdQrExTaiXGJu747WJODwzfahkJmRk5XHvM3p4Y/zcGWoxp+r/x7G0rWTjLSF5NTP4iDVe5XTTARXwPgvJga2h7CbKJ5xRCEHJHx+Vy/M1aL/KDQnZLmlH7RFcydelL9dhnQpRF3c78qiMD2zIqvy4aF3S6tMe9Rm3eMlvRweefKQ+q+J5ZSgs11rxPUKsvUgSi2H/vPmMeIGE/bO/P2HywEFEEbVWMSm0LuNgSes1F9KUKn9LRvugCzXvRDrZ5JySFE/7SGvRHvWZoszsOf0lMAAQSZfp8y5Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(83380400001)(8936002)(4326008)(6916009)(1076003)(5660300002)(956004)(2616005)(8676002)(6486002)(54906003)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Jwxn8zaYwp1eRoHfwgHMcT0Cu2xXHd4BmCu55Ci9+X/N9Pfya1AmIoMi15M1FkPwnBGyUHJVbZH16LSrmXYX/tk8XEbVtR7IIZfrqb1KddyhnN08kr0upJpyCLwhciZ2yrujsPG/kjb18HETaqfa+kCC/kNbwzKHgs2PNhIg9wOEZebQMQlOoUmR8c/6R/hsHkZF6m/FcW5OGiGAuqZWIldxKPqG9Ghq3vNL97Uipy0tMGVdsUflJs/Z5B4QqAzh9p5eXku8sEoKFG9+0CTkNGLVtQ0XSptE4NFnSivRLLWWZPhGRZRtaEV3ypZVnNAXMdXC7KRObGpL9p32dDXoC9RDa+3VRB9qrNn+86z5m0QLbYnRV/8MVpYcnTECdDRWKTD6v3iOOxsuXwnG6ULzn0cE6j2BvLFBS417KiZdLiQfdR+T1fvcS0UYS6tRItde7riTjhhNoox7Mv9NdMRBB/SMNb/wIDa7XjaPotVZm+l02BoZpXJhlFkbp834Oj5vuXQehYNxPXSOy8gkiNHw80GJJXeh99Ex8lcWmrW/9J1XvlMwJXp82vW4GIb2w0mOyt9xAujRLuOXYzZTXfJMSICV8D1FA4Ad1SUXLLwsod2SmVnsGiu1PMzmZiE+92V1AYS858e00jFBwwQvZcZJYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac5ffd27-ee9e-4233-84ef-08d83b0a21de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JLQwm5D+HfOmxsstpuQlSZE4gNXg9n/m1yE0BELqzBfi0UJEQYp6evv39d91kec0bYUQQaxgzKRTbQffdCc6OObK95qe+Q01ZSQU+Z03qCr6WxcveyyOG2BQ06VPaoS+rlsrbS+aNC3umqqcoSu2ipqThPuegpRl208fq8YNrHfRZadzSQMvjrYN/OoK0XFdJFkyCZWUGLemcQ20xB6yfw822qDfbt3XX3fSiWthFRG+C0BX75C3fqB/vUk25+wuOfAyMlXDrOQM7l8wggx4q2vY2DcYR1fSGyDVAykhS5WE3N1/E2ozUtJjfECkA+sCZ9eR+4JsL9WMff21gu9oDlkwfSWn1JoaUq2CX5kZuhGpC8td9jZduF5O15I9Ihydpy3M4wIvootnTSc8181xow==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(54906003)(86362001)(336012)(9686003)(2616005)(956004)(6916009)(1076003)(36756003)(316002)(83380400001)(8676002)(16526019)(8936002)(2906002)(7696005)(82740400003)(82310400002)(47076004)(4326008)(5660300002)(478600001)(26005)(186003)(81166007)(356005)(6666004)(70586007)(6486002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:24.4125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ff1c67-a39b-401e-b564-08d83b0a25e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2466
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds support for trusted-firmware-a to the corstone700
platform.

The trusted-firmware-a runs on the host processor.

Change-Id: I70ae2715e640bf50c756229a734dcb663c2d8e4d
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/corstone700-fvp.conf         |  2 ++
 .../conf/machine/include/corstone700.inc      | 11 +++++++-
 .../trusted-firmware-a-corstone700.inc        | 26 +++++++++++++++++++
 .../trusted-firmware-a_2.3.bbappend           |  1 +
 4 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc

diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
index a968b39..2ee3b52 100644
--- a/meta-arm-bsp/conf/machine/corstone700-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
@@ -8,3 +8,5 @@ require conf/machine/include/corstone700.inc
 # add the following line to local.conf to disable the feature:
 # MACHINE_FEATURES_remove = "eth_lan91c111"
 MACHINE_FEATURES += "eth_lan91c111"
+
+TFA_TARGET_PLATFORM = "fvp"
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 67cf153..495fc30 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -4,11 +4,20 @@ require conf/machine/include/tune-cortexa32.inc
 
 MACHINEOVERRIDES =. "corstone700:"
 
+TFA_PLATFORM = "corstone700"
+
 SERIAL_CONSOLES ?= "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-stable"
 PREFERRED_VERSION_linux-stable ?= "5.6%"
 
-VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
+
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+
+WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "arm-reference-image.corstone700.wks"
+
+VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
new file mode 100644
index 0000000..175e333
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
@@ -0,0 +1,26 @@
+# Corstone700 machines specific TFA support
+
+COMPATIBLE_MACHINE = "(corstone700-*)"
+
+TFA_DEBUG = "1"
+TFA_UBOOT = "1"
+TFA_BUILD_TARGET = "all fip"
+TFA_INSTALL_TARGET = "fip.bin"
+
+LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
+
+# TF-A v2.3 is not used because the following commit is needed:
+# corstone700: splitting the platform support into FVP and FPGA
+SRCREV_tfa = "ef93cfa3a2591084307a41e64f1cbba327310749"
+
+PV = "2.3+git${SRCPV}"
+
+EXTRA_OEMAKE_append = " \
+                        ARCH=aarch32 \
+                        TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
+                        AARCH32_SP=sp_min \
+                        ARM_LINUX_KERNEL_AS_BL33=0 \
+                        RESET_TO_SP_MIN=1 \
+                        ENABLE_PIE=1 \
+                        ARM_PRELOADED_DTB_BASE=0x80400000 \
+                        "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index 6f67b49..70c0a6d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -6,5 +6,6 @@ MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
 MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE_corstone700 = "trusted-firmware-a-corstone700.inc"
 
 require ${MACHINE_TFA_REQUIRE}
-- 
2.17.1

