Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web11.2581.1596536953349670077
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lFq0Qeol;
 spf=pass (domain: arm.com, ip: 40.107.6.63, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbuFQeWtnlqQ1AMoaBMoUAQeFjVfwE0qW9MS5P0Vt4k=;
 b=lFq0QeoltMHdTqfsV2mt8WhFdyUTdzA8+EvP1vyk+n8Ssjov/G7hjz1t77a3DNrfLOixeGYeR8EWcCl+4T276sZMEircBnzAmxysxR5iPZSNXNb0AmYpA0eUj7mb+zzrMA3zhLTRYTCVdHf1Gs4UcwXKshSDnHeojleYYSWNEwg=
Received: from PR3P193CA0009.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::14)
 by AM4PR08MB2931.eurprd08.prod.outlook.com (2603:10a6:205:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Tue, 4 Aug
 2020 10:29:08 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:50:cafe::c6) by PR3P193CA0009.outlook.office365.com
 (2603:10a6:102:50::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Tue, 4 Aug 2020 10:29:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 10:29:07 +0000
Received: ("Tessian outbound 55d887bbc0e0:v63"); Tue, 04 Aug 2020 10:29:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70d02058a4a9db23
X-CR-MTA-TID: 64aa7808
Received: from 2fc4fbdfb8c8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FEFA3746-8128-482F-8AFD-36FA812A3BC9.1;
	Tue, 04 Aug 2020 10:29:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fc4fbdfb8c8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Aug 2020 10:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXxTeHO0fXFO+6ZcYsEyqdGSpshWTlEnepmEFQxK71J0FqtgYa15E/NieaTRxNQKGp6RlXgGL6gVgAJRTmlnU4OxwEe//RuZRKFzmsABcPB0jF2WpYvWwn26sW+zso2dsR8oRX8E4iZuLZ/YVky3S6ckSYlDN7+jfhmOiIRip06oVRwvohtoCeQanTXcpG3bqM7sTuX5O6wVP17w358Zgfmz746warAKyl5MZbFJM7GDuRAbG/22OqZV4uJ3CSAOmwxPKHt7EGUkySVjZC2cBpyuTvIu/gAebT6z3pBnBHPcDlHbTOScyLulDiY3llP6+6IE9xv4J1zMJ3iGY+vRVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbuFQeWtnlqQ1AMoaBMoUAQeFjVfwE0qW9MS5P0Vt4k=;
 b=lWKYXLfnWycybGGScuDYlWJWRj46iCLPtb4NQ0caCM9T7WFUdykpYrnja8l5fbstvwJ0V9g0GfNstGYbvHKr1gyazEQmOT6h/vpeAkeTiLJgDZrlA6F4uLSWRwWw3alqCuE+IitFLW92uLA7iJny+89N5V/wdRYjqo3sYw3TRO52TRJRe1dDnTJDQ93FdBV1xUULb4uMoSBllD+MLwrcBgdGW7MUuCXNqqP/sh2LozKLTSD9nxbMC5hKVf5+3bcB6swjRg1WL8eP5o/NWbecHw1pjNnkbvlKU+EXyDJLc/ZGYtr0wz19PeKKq3ahTQWsehlaa0hf44jB3Nyt9tXIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbuFQeWtnlqQ1AMoaBMoUAQeFjVfwE0qW9MS5P0Vt4k=;
 b=lFq0QeoltMHdTqfsV2mt8WhFdyUTdzA8+EvP1vyk+n8Ssjov/G7hjz1t77a3DNrfLOixeGYeR8EWcCl+4T276sZMEircBnzAmxysxR5iPZSNXNb0AmYpA0eUj7mb+zzrMA3zhLTRYTCVdHf1Gs4UcwXKshSDnHeojleYYSWNEwg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Tue, 4 Aug
 2020 10:29:01 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 10:29:01 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-a: generate single-chip and multi-chip dtbs for N1SDP
Date: Tue,  4 Aug 2020 15:58:49 +0530
Message-Id: <20200804102849.18636-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::30) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP265CA0090.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend Transport; Tue, 4 Aug 2020 10:28:59 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b7db2ca-e43a-43e0-dd49-08d838613856
X-MS-TrafficTypeDiagnostic: DB7PR08MB2987:|AM4PR08MB2931:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB29310AD064F486603A7F3D4BFA4A0@AM4PR08MB2931.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:372;OLM:372;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +STo7kpXgzTMsP/Vwd0me/smUAOPrfrOFFHAgNmRwOvUhsOOSbfN6fF3cgVGtIIV9BB8g3DsJ7tFEQSbA5fXf6V/LHLwzX/B+JPJf1uvwLLadwbVnaGhL+zXW7Q9+XMGZMQ1JtITv+7yWQo2rAYvCgWa6UZLIHbH+thgR7bkXAC2B/w6tzGNZgl7WpfeMqepwbmXuc/BBFX6Q9o9x+A12egn4f2u4XH4gEJ+/JWr2F/gO5rOFIribM+EoLy+yZW/VF7rp6hwkh5sDdnI6gECY8JWKt6+D7uTCdNqVvP1iYuk2+VvUuT0O80wzJpLcruZunVJDsVbc37BrO53rqG/wi77KBX3ae8RMFOZGTfd9Lf8Tv0gnDEzACkr2PlkCFU3UdfzshCVRL7wWvuj+QwJeQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(16526019)(52116002)(6666004)(7696005)(8676002)(186003)(2906002)(86362001)(478600001)(6486002)(1076003)(2616005)(956004)(5660300002)(66946007)(66556008)(66476007)(4326008)(8936002)(26005)(83380400001)(316002)(36756003)(6916009)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 P2Gy0bXFNPcS9BUtLpVdGdrXHRE+dnocgDtj2JfjtamSRMrNr6/JClk0b8Qolca6uI7S8wCyzN0EwV950Bbg3+MkX12OsVG7TIHTzvGceeiikBHju53RlgxtpIKkWWT9dnXF7uwS2uE+wrC8JcMg3ZYGS0i0fWLYGwiBkRrJO1kpMuad2CPMn6wVi/mlfOOeqUMtevBWUm1C92bT/7vBs8lM9ocJDow36q64mJGaDVYaz11CrjdKN9opmoIm5tJt7b2G5zDAALhScruqIpCiA6R2Pv+3tK8aRENoCd9B6R0qOIAn38VeeullodJqiQ8PK05GOBPvzOO3Qu0cD4T3IV9kxVcs3wf3lOPSOEWCaLVd3pzxMDpoV2WIx4MzBN2QaxlHZNYE5/yDAGWvDaCd890weH0LXZ8/KQxQfL2Laj2JRrxtS8Sh9LMhFGG6jCUv3ko0CEtkET9DKv2nDCRETMdsghN4vz+90Q4l8p2xUjrwl5Rwoh9lld9lLeZqTyNNFHAYqq+xuF61TvVFWJn4RklshFBnL29gxcMRGNfARj76EhAx4VSfZ1ECy7FdGpXIf1ksBrSbbt312X1u+RhHrnSxVfEE5d/rxDp7EEdUFO7ObylRRNcSqaCTKEv4oq3FVVu2Ch2mIjM/izC5oAKsxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2987
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f9d15c2c-f744-46bc-1ba6-08d838613400
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zD3era0YUzHs+rI8dmxHwdLtgKX6K2mN/0ivt2JMs3licxyopJotdnreJjJRJMce7WM7P7EPc02BzZtvP5++y03ktIMxelIKzmJZzLJR6BTi6twEWAf/5f2NFrx2DhAYmDDf+qHVtJYAKwbIn+Q0Fqpb5smuRNKRtev8XC0yixeJQPDjWZOHhY2cf5a0yBF2EzPMS7iOiZZdAd4wa6TcPzwJapQDVDrWKre9fRw8I3b5ciwnTyH8xDNhhvaMV6aFh0GT+YAD1qBru1bNswtVor6YNLm69LSFrA2owyEdQX9TYFuqDOovF01LgHbtbT7rXSFRxSwxVL6vIxJUPlvzOnG+loP/usD9Ec+3VMbzf2HBc17xyTkIYPnukNaaqIrEcXBM/UdKFJA5FsvvXCSTYASoWyGe/V/CzNu+M//AIcpJlg37yhnzIjSnvsOtG1Vo
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(2616005)(956004)(4326008)(6916009)(6486002)(36756003)(47076004)(26005)(86362001)(6666004)(83380400001)(336012)(82740400003)(82310400002)(2906002)(8676002)(5660300002)(1076003)(70586007)(7696005)(36906005)(16526019)(186003)(316002)(81166007)(478600001)(70206006)(8936002)(356005)(32563001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 10:29:07.9955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7db2ca-e43a-43e0-dd49-08d838613856
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2931
Content-Type: text/plain

N1SDP supports both single-chip and multi-chip environment.
 - Updated SHA to latest TFA patchset to add support for both DTS files
 - generate dtbs for both single and multi-chip environment
 - remove trusted-firmware-a_2.2.bbappend as it was only used by N1SDP
 - Migrate N1SDP to use trusted-firmware-a version 2.3 as base line

Change-Id: I4b92e1680750041421fb9fbc9cef448250581f94
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                  |  4 ++--
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc   | 11 ++++++++++-
 .../trusted-firmware-a_2.2.bbappend                   | 11 -----------
 .../trusted-firmware-a_2.3.bbappend                   |  1 +
 4 files changed, 13 insertions(+), 14 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index d651270..a31f33d 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -26,9 +26,9 @@ PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
 
-# Trusted firmware v2.2 version
+# Trusted firmware v2.3 version
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index ef71ae5..c26cc78 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -2,7 +2,7 @@
 
 COMPATIBLE_MACHINE = "n1sdp"
 TFA_PLATFORM       = "n1sdp"
-TFA_BUILD_TARGET   = "bl31"
+TFA_BUILD_TARGET   = "bl31 dtbs"
 TFA_DEBUG          = "1"
 TFA_MBEDTLS        = "0"
 TFA_UBOOT          = "0"
@@ -10,3 +10,12 @@ TFA_UBOOT          = "0"
 SRC_URI_append = " \
     file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
     "
+
+SRCREV_tfa = "f0b1864f8e309a41d2eb1c9510f8cd3c7aacbb1d"
+
+PV = "2.3+git${SRCPV}"
+
+do_install_append() {
+    install -m 0644 "${BUILD_DIR}/fdts/n1sdp-single-chip.dtb" "${D}/firmware/n1sdp-single-chip.dtb"
+    install -m 0644 "${BUILD_DIR}/fdts/n1sdp-multi-chip.dtb" "${D}/firmware/n1sdp-multi-chip.dtb"
+}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
deleted file mode 100644
index a87999f..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?= ""
-MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
-
-require ${MACHINE_TFA_REQUIRE}
-
-# TFA referred in release tag N1SDP-2020.03.26
-SRCREV_tfa_n1sdp = "cfb3f73344217aa000aaff9d84baad7527af75bf"
-
-PV_n1sdp = "2.2+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index f37c589..6f67b49 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -5,5 +5,6 @@ MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
 MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
 MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
+MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
 
 require ${MACHINE_TFA_REQUIRE}
-- 
2.17.1

