Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web10.4211.1596829402047623823
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WhVy3mrx;
 spf=pass (domain: arm.com, ip: 40.107.21.75, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67Q8oKvCbsmF5wwRay0uqgISqiCTZSXWMA3JxxxBzqc=;
 b=WhVy3mrxzqzDREG53wETuqK0vPpalyZFXR+rDrQz3MSiTTOKrH0n+ScAqlYNiFr9dkGflGxYvy2tNKVF6eL6XWXgj2oegvXr4M6hYfH/8CU5OVnWI98Byub6cIGrgaTVypgBeUH2Q4NNFhbFF5DsMFaIjCCV0HFFWI1FX3uwJ/A=
Received: from AM5PR0701CA0004.eurprd07.prod.outlook.com
 (2603:10a6:203:51::14) by VI1PR08MB3854.eurprd08.prod.outlook.com
 (2603:10a6:803:c2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 19:43:18 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::f5) by AM5PR0701CA0004.outlook.office365.com
 (2603:10a6:203:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.10 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:18 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 07 Aug 2020 19:43:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eae28bc23e5b888c
X-CR-MTA-TID: 64aa7808
Received: from 46b48031c973.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A494EECD-4C1F-4361-AD97-4F5151700179.1;
	Fri, 07 Aug 2020 19:43:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 46b48031c973.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i39S1S0LOcuzQ5M9tn7nae1X0lnb0YadJSNycLR1bQhYnJOtkJ/vpVJaR+u/5AWuMSbNQjPvgfwKSl9DfBn1sKTBkdeglGLDmmt9K3P5t4mgXpo4wvFrJ327//2O9LH6FM1LzEMcX/rRDnFT5Cwe7125ALi7syPugr4Rmm18WtEUGefrTRvYBUVbrUmbbUH56g8NLsGGnUq0M6GrQXcPC3aU5Qpp4nY1LqMT5l92aAaXjKVbD8YEks2bM/bEsLPgdv/pvq8U8y2VJekw1+pk+ACMICcyeKXpkqEhovKbqt6OR66tvqetKLy4KjqX/HV+CZcLjxaAtXRLl0QMSarr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67Q8oKvCbsmF5wwRay0uqgISqiCTZSXWMA3JxxxBzqc=;
 b=HWKD5vMN+ugAWTQCjwVU0X2oy7hf1Asc0yq8Mmuzny8qKVNtswrLwx+IPJsNeaBeMOK8FAZ5zmoxE1Zij8Dss5UhO3Buz3tzUaMKWGzofGfgRFhrRow0lNZVn5u9p6IdTzkz37/wuaQQa/+hUnYWvBL6H3ww0pZQbgcM3tVdX90NUwVfTCoNABalxczKyUWlZVKtkdK1ShaUZbJnK6/SVZ6LAT9HHr5i64EJsQ/7HNseJKs6jJRyzUlTjKmPI1PSeRcOsWJIIuct2EqXv38M/cJ8XkyufsUU9Qe1jBOQQBLmX0YY1Sq7IwUreK4tOr1rdUiOo6R1jyfJJyNdRhjtlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67Q8oKvCbsmF5wwRay0uqgISqiCTZSXWMA3JxxxBzqc=;
 b=WhVy3mrxzqzDREG53wETuqK0vPpalyZFXR+rDrQz3MSiTTOKrH0n+ScAqlYNiFr9dkGflGxYvy2tNKVF6eL6XWXgj2oegvXr4M6hYfH/8CU5OVnWI98Byub6cIGrgaTVypgBeUH2Q4NNFhbFF5DsMFaIjCCV0HFFWI1FX3uwJ/A=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:10 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:10 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 1/9] arm-bsp/external-system: add external system recipe
Date: Fri,  7 Aug 2020 20:42:45 +0100
Message-Id: <20200807194253.14748-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 47e1dd01-9aa0-45d5-e4fe-08d83b0a225e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|VI1PR08MB3854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB385476C9C770559E061A2B7BFD490@VI1PR08MB3854.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FiGM7hrDBQpjTQuNCdwT0VwW3YUTo5Eytlbk3S6aYCws7jLrzAW7dSZzvOb0ZHHAck8PqhJIDAExAT/J30Hpp8KWbOA+Q29bmnAFHDfFcaqpvkxt21PpOlKwGpBsottIi7QRQPvBiSyromuOmY9e/z58SH3s3cxITua9HCppDM7MtFkynyNUuwN3QuhzJsQh9tH2ErxRLelghVo6FS0fDJCAR58stz8YdqKSDYD7CN5B+2AgHzvLnP+dn9ara1ic5gKT01Li/zufRqG4G8hKSI1nFB6loYwuuzxf9/xjU25YiDi65ZeRFEh9+EqLjrm0AAAUeIT1fAcZ1YurY5AAIgBT9yRNsD2Dcq1LosjRrTy44Ffl7BHtfE1ifRbyciET/eyMaUr3eX6eInQIHFpZNA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(8936002)(4326008)(6916009)(1076003)(5660300002)(956004)(2616005)(8676002)(6486002)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 K9Wsvesvq3gL/4L/yV2HLhD1iBMDo9uBaZX0Cz+NptEV2mfAy8noWY/o9jf1umgvBNron3Srre7Y3zqxXeY3PISoOs/YouUJBVMXb2LyCTxffXZ6+N5CbyW2uKxQdm7rwfdE9sfolpOeuLotUEi8TmkN4UvDUeXFIxEfRpJGnSbwgNibNcqgFZ2MaOXoh9sJbf7uNhDQUh6ZxJktxODvA9zvuVeSFN6iwTWuEcvURAVlTZzEjk1o07U1+q55GJpeqDhkcqSaDKYqwzRu3MY7IsyPKj9Xt3AwWQqoYACm2hkn2o5Jg/9YIyFPI7caJrUhB1vWHwMYINoJ+Rr00BbFZ/ftLcnPd/UgtgbQMSynq+eHT2k/nyb40J5nXjuBRszgnMEOKcX4qJjpJLc9a/sMh81D/EEn41MU7oF+iWDoQDX4wxNkdMw28qSfVToFn7eIuJarWRTwk1Ls9YIs/rq88aPzVEDTYUA1qC83hbp14g6EqQszwIRS+hwDHZuUqnUnB27qLa5bzhGfBpl3t74/EvO8bfD8uOvvolSvpVHOpX3fkH0R2r+fxBQHLqDnUqq+8Hsw+coOHIHJwEmYbw1Pnw8mupIrmHSbXmCnAEoc+PPOsTeicFs/XGf4OkFIVeclJnmezHd9gGOFooXRrwI1nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dbdf0693-a1ee-4d41-e873-08d83b0a1d6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	16x7ku3mQdrWa3xuBYHK5AHKgj9ny6rc376kwna23rVnbwT6yCf30zEEz65i4IckBvlNOLueDzTiX7h+Qr4w3ReTM3MY8VdiVHnV68xtZ0AOxJib/yu/AtrZSHrBFe0z12AEfNSAZQ/nq1n0KYqQZDhXUtKksxxVp4I15fW8YILD6JDWmYto50rM/fa9wFz3UyRW2dxLKQcAxYhtVubh2SrIyuCa2Y3HVLw8b19kse4a4TYYcTTQ6odTlYiPbMW1kY3/qdw+czOLu2G2uf7EtgNFjcoj4trWa0wGlaTAiw+MO9/3To+tyhvYH2ZgZTdBDFJv5P6OYr4NKn5Qw5tWU9FKJA/mIR7LjiC+tLMH/xSvDK5e2x551zcjWa4nOG3fg0R8DxQ+nfbomQ0xt5nvleoSRIX9IQAId1umqCc0q8KRjYgGBPGi0vFNPVNpQ+CUnCxqHkXxR3LQSdglL0yQdA5Rm17K6gvblQTM9xU8tWE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966005)(82310400002)(6916009)(186003)(16526019)(86362001)(2616005)(336012)(478600001)(26005)(36756003)(956004)(8676002)(7696005)(1076003)(8936002)(36906005)(6666004)(316002)(47076004)(6486002)(81166007)(82740400003)(356005)(5660300002)(4326008)(9686003)(70586007)(70206006)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:18.4161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e1dd01-9aa0-45d5-e4fe-08d83b0a225e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3854
Content-Type: text/plain

From: Rui Miguel Silva <rui.silva@arm.com>

Add recipe that allows building the external system firmware.

The external system is a Cortex-M3 platform provided by the partners
and intended to implement the sensor/realtime part of the IoT system.

Change-Id: I271eafcc90e44efb8090f8b2cc1c8acfd15eb929
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
---
 .../external-system/external-system_0.1.0.bb  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
new file mode 100644
index 0000000..0aab8ad
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -0,0 +1,45 @@
+SUMMARY = "External system Cortex-M3 Firmware"
+DESCRIPTION = "Firmware to be loaded and run in External System Harness in\
+               support to the main application CPU."
+HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/external-system.git"
+DEPENDS = "coreutils-native gcc-arm-none-eabi-native"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0"
+
+SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/external-system.git;protocol=https;branch=master"
+SRCREV = "41ef76951c5119729c1ea305406f74776da90866"
+PV .= "~git${SRCPV}"
+
+COMPATIBLE_MACHINE = ""
+
+# PRODUCT is passed to the Makefile to specify the platform to be used
+PRODUCT = ""
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+
+LDFLAGS[unexport] = "1"
+
+do_compile() {
+    oe_runmake -C ${S} V=y \
+        BUILD_PATH=${B} \
+        PRODUCT=${PRODUCT} \
+        CROSS_COMPILE=arm-none-eabi- \
+        all
+}
+
+do_compile[cleandirs] = "${B}"
+
+do_install() {
+    install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/firmware.bin ${D}/firmware/es_flashfw.bin
+}
+
+FILES_${PN} = "/firmware"
+SYSROOT_DIRS += "/firmware"
+
+inherit deploy
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
-- 
2.17.1

