Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.49])
 by mx.groups.io with SMTP id smtpd.web11.1122.1596646704752716212
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 09:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gCibVLF+;
 spf=pass (domain: arm.com, ip: 40.107.8.49, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZB23mMsCY/wewZJnMiAF+IdIbqO28g0+FZgh3RQcHM=;
 b=gCibVLF+7MWIHUu7HNwtEBYpvpHITt3qFeHFgpSJgys/cILhFJ6kogp42Wc70903RvLTXempLU37wtGM6D/SF1GZDU885Ur5hM7YUbJtfKiYmXasZ+URvZ5izz6jqu067y1QzqitdptFm1nF++F6GlbjuoKL4BE+KlQdO56lXXw=
Received: from AM5PR0101CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::18) by VI1PR0802MB2591.eurprd08.prod.outlook.com
 (2603:10a6:800:bb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Wed, 5 Aug
 2020 16:58:21 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::49) by AM5PR0101CA0005.outlook.office365.com
 (2603:10a6:206:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Wed, 5 Aug 2020 16:58:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 16:58:20 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Wed, 05 Aug 2020 16:58:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0526279b0585bf3
X-CR-MTA-TID: 64aa7808
Received: from d43d59abc686.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2F8881C2-7EFD-47E4-A8D0-D1A59E52CF2E.1;
	Wed, 05 Aug 2020 16:58:12 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d43d59abc686.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 16:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ac/VSOHTWB0juEi31k6r91ZJ3xMqkUi+CiNdW5s6WwsH9ORwZnMi2JIYNCp6VsIr6JLg9Zgh+70bQfaADcRh8MEAEitrxDaqfWUHYDvODyIMdeEd379/2x0tKqsSoyIhTw6ntyK+i0V4bI/9v1x6ZeKEJFcADw8ILkG/IdP4hsPhx6RGfUS06tDER+QhrfgqwxhIuItLClbHmIvkmSEweggCPXRXMHtJ6vbkjqr0bXkq8k7mA3I3J4H/f1M9Mec4EFqyEr0SJbcGA9X87/CSUAxKmyIeM3AuUENVruReN7kf6FVavbr8/biB1Ga8m4C+o4p0RzPoMUp5u3AX9nMJ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZB23mMsCY/wewZJnMiAF+IdIbqO28g0+FZgh3RQcHM=;
 b=ZrhJczRSDvhZQcKooTgRTh7INB/mmWHEu0LqjQuX7a4J5fxGmXN/M46TvlnwDvAIKLJxa9uMWRfZgVORC6IF3SObKkdlUHZ2HWH3FupznsM7KMSSaRZl1WDC3uTuyDWESFIZZQidawVqTDif12wSq7ymnxIBonJXZbi4IIFMlzdw+Ju8vVEjTEKAQYld5K+ZRRmlGUTxq4RYzpXlgD23XiMHNBcAZfOHeziLf1SX+dVn/sD8ayy1wXAQAm5dt/dwBiREAgE+Tx1MB2YbZh4AF+X4d7zECEiE3lHPrJTC8gRVX2N81SNY4XlkqImmC582U0MxvovPvrzgnNPCySAM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZB23mMsCY/wewZJnMiAF+IdIbqO28g0+FZgh3RQcHM=;
 b=gCibVLF+7MWIHUu7HNwtEBYpvpHITt3qFeHFgpSJgys/cILhFJ6kogp42Wc70903RvLTXempLU37wtGM6D/SF1GZDU885Ur5hM7YUbJtfKiYmXasZ+URvZ5izz6jqu067y1QzqitdptFm1nF++F6GlbjuoKL4BE+KlQdO56lXXw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB7PR08MB3836.eurprd08.prod.outlook.com (2603:10a6:10:76::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 16:58:10 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3261.017; Wed, 5 Aug 2020
 16:58:10 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2] arm-bsp/trusted-firmware-a: generate single-chip and multi-chip dtbs for N1SDP
Date: Wed,  5 Aug 2020 22:27:59 +0530
Message-Id: <20200805165759.23669-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0352.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::28) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0352.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend Transport; Wed, 5 Aug 2020 16:58:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ab64a35-35f8-4f6f-c581-08d83960c21a
X-MS-TrafficTypeDiagnostic: DB7PR08MB3836:|VI1PR0802MB2591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB25912FF0BBA5ADE2A65D116CFA4B0@VI1PR0802MB2591.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:327;OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Wa0wb+rX0vOW4w/EQPYl7/G8ZZNB3vR0qgRzY2fPjpJHojqAas282Q8TSxWZCVp4McxrIb/yLXvKNj67p4cWDjjoYPFLKKRXsZKMgo5utymcvu0VO9235biDRUKV2yr1sBTUpUaSOoqaZWc5OLa+vlPkekOPEk74uqRi4PPpm6z8nezkxEXIlAO0NuqBnTl7BJc00gRStGwV3zBFntWcqVHqXmKIROzFjuuWouJTOrHD6Rduvv0tYtoG13dLH483LGY7DisOx6Kj5CaCQGPMqI4eeqyDWj8KRD6P/q0UVs6hQ98zGyyAVwknVHISDlSo0FbQcayHOQ5PbUA4pOwFl0SNCKEnz31GISamIKB2HSragkFuBWleH+JNQyfVsIXJhsMmauytyZrTGk50pZV/tA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(8936002)(4326008)(478600001)(6486002)(1076003)(186003)(26005)(83380400001)(7696005)(52116002)(16526019)(2906002)(2616005)(956004)(66946007)(86362001)(6666004)(6916009)(316002)(66556008)(66476007)(8676002)(36756003)(5660300002)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 5aFoEN8cFPqspszYOpNHMEsjyQQXd/gY2nsjeNVBSkaAqVUbEiundfglxsymEMbmEuSooG03Z04WryodNr6JyV124pbxFxv4D2u66MF23LuFLqL9rrdVP+pcx+TTJ/i3Fk6eBEInhNQtfd6o16x6e3/2LkEuXdqUCLOkGo+o6hPT2H+SOJjDzm7kC2VPzNsdbF7NBKSYUZ5FATC3VePsVjpgb2R/fbVFAMPCSqDXpp1+rDaZg876tcp6t7J8VKwCT2dQIOeHtlUOpj6zHv8Bw7Vpn622r5xCKLimROqv4MvbibXql9L0DMaXqdUxVAkpHIjQy4TM0zGkp7+qT282BZCBhWoT3+rz4Yq9KKZ4ePiAF39tgHtO5W3cGtTG+OcwRsM9JU28s+8HHCpfMT/8Xx8IS9VN48oGo0qRUnD6z+fu3gxdQObhsqBiHbRMcHxaiSUV66cAF1Zr91MNu2aeQRS99yZrGWcrb2Jj+kf7G3bTpNLGP37oFWMwibPjGqYHB5CWPTeWZElye8wXyv3BZND6hF5AslDKujaG8qLeWByPl1+6VXAuy46YEISSRfkk2AnyTAiG2Rt+CvDx04ibjo4+OrN7l7dxiz0uIDpjT1T/BF/zZwIcdgrOaz7ync7ISVbj4/Ys1nJ0+vSIQDmvLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3836
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	315f468e-e9de-4ddc-cc44-08d83960bbd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o8mQcAkhQvwOP4QhXxUKoE4pQUyu8j9R+ES1MTGURcBD71LblF5RG3pWJo7z7iNaz6NyDCJydbXnYJfL/VUKg59p7bu8C96j7Zj/OVT4Hp6hUBMF5hTUDwICFm4zKZcf4hXLK+OQZOGUn8BfkirroIUdPYaKTeVhqFW17MPhMXz9N4pL+1JL3OVFFfjIkN9ZZTmTFCTlVdTkFmLdqoA6GORE9FdMPKYTkaDBCaiB5+AKdvVPQxg0L7365GJUEaYbrBYCoFdkUP/mzDrydd4fCwbS+xeJG2Y+WVbAEvdxj4T8oHYpVafRDkkVk3vuWF5hpXDtwnVbZFqa12gd3FffpK73GTuKpc/Sys24UERJb52LbvehwsMVgVkMc5jgnL5uQgvJMH0T2tDt/kn5/ufax623dnRgV9D4c1RPdyN+7nFUFxzQTrgUOV2toFn9NMe2
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(2616005)(956004)(356005)(336012)(81166007)(478600001)(83380400001)(36906005)(82740400003)(6666004)(82310400002)(4326008)(316002)(8936002)(26005)(8676002)(36756003)(7696005)(70206006)(70586007)(5660300002)(47076004)(2906002)(86362001)(186003)(6916009)(1076003)(6486002)(16526019)(32563001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 16:58:20.8513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab64a35-35f8-4f6f-c581-08d83960c21a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2591
Content-Type: text/plain

N1SDP supports both single-chip and multi-chip environment.
 - Updated SHA to latest TFA patchset to add support for both DTS files
 - generate dtbs for both single and multi-chip environment
 - Migrate N1SDP to use trusted-firmware-a version 2.3 as base line

Change-Id: I4b92e1680750041421fb9fbc9cef448250581f94
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                  |  4 ++--
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc   | 11 ++++++++++-
 .../trusted-firmware-a_2.2.bbappend                   |  6 ------
 .../trusted-firmware-a_2.3.bbappend                   |  1 +
 4 files changed, 13 insertions(+), 9 deletions(-)

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
index 81138d3..6ede847 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
@@ -1,12 +1,6 @@
 # Machine specific TFAs
 
 MACHINE_TFA_REQUIRE ?= ""
-MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
 
 require ${MACHINE_TFA_REQUIRE}
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

