Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web12.4262.1596829414114061027
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ucnJjmPQ;
 spf=pass (domain: arm.com, ip: 40.107.7.88, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z06DNqtJa1b1sxXKX6nT9mH/Q5vJE1lSeoYcjXCb30=;
 b=ucnJjmPQFA+tcqcvhPqrvpnWEzZE3RXa2bZbqR3SQzbvrLb4SMY9+M/NUg3LBPoaozE/P9DpRJ0GGZgetOWw/+seL6VBuQXlf7xJpXBdEmPvkEp8QlkkK2+tvqkx4maKjWSMrPdkhxiYdoW+/IypRr40zcXjzJPufiZV3fqAaVg=
Received: from DB6PR07CA0175.eurprd07.prod.outlook.com (2603:10a6:6:43::29) by
 VI1PR0802MB2256.eurprd08.prod.outlook.com (2603:10a6:800:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Fri, 7 Aug
 2020 19:43:30 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::46) by DB6PR07CA0175.outlook.office365.com
 (2603:10a6:6:43::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:30 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 07 Aug 2020 19:43:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 35d04b951486facf
X-CR-MTA-TID: 64aa7808
Received: from f4db2c5b0c9b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2A0D62F1-B06C-4F69-BB7D-64FEDE305F24.1;
	Fri, 07 Aug 2020 19:43:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4db2c5b0c9b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHCFBA6xKj7jNuQSbvz5uRphWGfMX1kYbo2fHi2txMhZ6wLstg7xXp8jtKzingwZ6ZbVl7Kj+2XZxbcyb+QGTqkKNIKMKhOlzAHAl81ihTs1Q6gNClGERiW/GH+4UzyMC5GaFnk7A/kAR0WEchuLrvEM98iHAFa/CthiAgIVjKkWaDI8bZFbgHn/rD8OulQy5mXnT0XAzAKpJ+0YluHzaChtUhNIqn73zq1n0XVbPL0nwOVKJ9hqxA1volQYUsnnAxqFGVLkK0CMfuM2cyBdlSmVnhKBTCxCLXRRQECvHbG9knwOAwCg575gGeJYnhzHLgT3dpcYX9J95zG0rCnh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z06DNqtJa1b1sxXKX6nT9mH/Q5vJE1lSeoYcjXCb30=;
 b=oVYuIai238YEZyKPT/hL+KCE/U15moOfmPALmX+fnTU1RvDTh8lsEie08ZmtEkYBasgSIrSx8+k2hW8lnkfQpOGqQRC3Nper4hj3kMvqvLFa5ZAbMSK1aVonePU0OVnbblGc5Kf7DKwmy2PDpm/LotYGf6S1xV41o4ng0uEqtZgcss13FGmB+P6cv3y63p8VNLx28IP/OJgYUarUTlJFx+U2DwFL3407rsoXZEvncF9pa4cmWPwAqfCbSAsuVaiwvH7JDdN8aGCCH0kkqj4u/pvfNAV0w90qmXJLyV/Ttxiv4/CFYyQrjlj3xGNB6XMfexwx8DWnEwRo+KfKMZSxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z06DNqtJa1b1sxXKX6nT9mH/Q5vJE1lSeoYcjXCb30=;
 b=ucnJjmPQFA+tcqcvhPqrvpnWEzZE3RXa2bZbqR3SQzbvrLb4SMY9+M/NUg3LBPoaozE/P9DpRJ0GGZgetOWw/+seL6VBuQXlf7xJpXBdEmPvkEp8QlkkK2+tvqkx4maKjWSMrPdkhxiYdoW+/IypRr40zcXjzJPufiZV3fqAaVg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:24 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:24 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 7/9] arm-bsp/scp-firmware: adding scp support for corstone700 platform
Date: Fri,  7 Aug 2020 20:42:51 +0100
Message-Id: <20200807194253.14748-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6a1228b-d756-4e43-1d59-08d83b0a29a7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|VI1PR0802MB2256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2256C38F607E65FD4BB97FEFFD490@VI1PR0802MB2256.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:862;OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6UMHeSNPAuChLsBUVhLOJRqJ2c6J9K6ykQCGsEvXYqTVf0K8I2YX5pFhbG8AWMVlCs8rmQ6oDz6+5/UkMZy2v4SwLFlquvUsObEukYb5SnZ5CaF4aaBsfgEox+nRvtgHL5pVsc3leBGAwJYAiG63YoYXsoAVlJMGBdSLmGuwAMS5sMkwoOFXKbHljAAiLCn6UJUHShR6HCn1a2ylDJG5ND3yF9h3eGm/nXXtqvyvQZJIrZm2FPbxcadTLtUQmXIwQt9/YCq2ZnNymar2xWsFOb9giR7KSACZ7xtdFx3sPDsrQ6CjZmqFCNX2jGBic5+ckQ3ss9rG4jn+kM1WR+pVaQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(83380400001)(8936002)(4326008)(6916009)(1076003)(5660300002)(956004)(2616005)(8676002)(6486002)(54906003)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 9KehYi2Y1b2TmXDMd3zctqTHy5H6CEIa8eiKi7tP/zUNBsG2WYJX91tGznHelMG2tposY3IIhP5xJHuT06UO4QiBi6lz311oVjLl/4gwBrDCVKiuD09vkDJQmCg6B/6UouewmstRtxgWTei4yE0ZpKIsG3ielxrMq5PtTUnIKet6pCCvMH5314tdNegO3/gXDFlEM5BmEIFxkHcyw4vL+5gQSWr8xwSzu4AqRPjNfL8H3WIzhZvqPUp4C7aEBiCQmSzLMxAR353JesRUlbOHSQVBpd/wdWZPccVoiPgs3UZKR0bFknVHN6Tw+4YfnGEw+40DjPM8gnzZFlZ1OS0B9je85kwpz8Cg5vLt0mLDoKCT2A1XsnPpiGuVkB7LpXDe7DzosnoxQsyhUg6gTj7BvYsoY2bxQyfSUF5gd1XDigvzhE89QbICdxFIVqAHKiG2VxFTa28EGo3omvdZtjN3uzMckEnfPSQuZYtdLpfQSIj+d1DjHQinUHXHc+KXYr/J+DkOOVCnSKhu00iF2R/8CjJaqnczQlUFiTJ8NYgu/ZUQGTC8VXrmlDkflM+UiLEudgVsRYEOAkyKUjdieNFxiu6CQQHptslRxpZUY7udIfHGyTJkjPD63LTM714Uv5lKJipJSK4PPLXROVYm6XNTIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bc0b3018-b249-4727-f4c5-08d83b0a25b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aefk/PFzbtzGLIa2FRk2KXodOsmZfe8HzCLDQnQQTat4brPdGjOKv/3kNQMQGT/M5tn4SVe3plqhq+JohDO02Fd34q/VX8CewHAA5S5tB0zR0AoGj2ylsq6X36td52CTrMJJnfa3Vwx6NUVaO5Wn93rP4ip6HZgEJ7JCUtxiqAgcutUyQmhjdyOY4L/guxViJIxUW8+vUfglGdyDhIdHziJdMNjn5XzR4KpZb7+7xZM3eqmAMzeacQzxLNjeGAGvwBqmsdPQT+GXtifyUEsOEWG1EOwNeD+YOQZXwkVRdDO5AYG6nsfkvvelPfMeOhVlQDpbbWOqlbNMVQav/nnkoPMw/Gd62zCm+MxZ2AhaIcRCmdClIDVHNnQW/SALLmO4ulQhtKNwl/KTz2Co2O4D/Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966005)(316002)(54906003)(6486002)(6916009)(16526019)(81166007)(1076003)(86362001)(36756003)(82740400003)(47076004)(5660300002)(2906002)(478600001)(4326008)(83380400001)(8676002)(186003)(82310400002)(7696005)(8936002)(9686003)(6666004)(336012)(70206006)(70586007)(2616005)(956004)(26005)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:30.7384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a1228b-d756-4e43-1d59-08d83b0a29a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2256
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Extend the scp recipe to support corstone700 plaform.

The scp runs on the boot processor (Secure Enclave).

Change-Id: I24289533a72367ebd2d2150c5230d9f435b4212f
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone700.inc      | 10 ++++-
 .../scp-firmware/scp-firmware-corstone700.inc | 37 +++++++++++++++++++
 .../scp-firmware/scp-firmware_%.bbappend      |  1 +
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 6b02415..91f290f 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,7 +14,15 @@ PREFERRED_VERSION_linux-stable ?= "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
-EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system u-boot"
+PREFERRED_PROVIDER_virtual/control-processor-firmware ?= "scp-firmware"
+PREFERRED_VERSION_control-processor-firmware ?= "2.6.0"
+
+EXTRA_IMAGEDEPENDS += " \
+                      virtual/trusted-firmware-a          \
+                      external-system                     \
+                      u-boot                              \
+                      virtual/control-processor-firmware  \
+                      "
 
 WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
new file mode 100644
index 0000000..16437c5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
@@ -0,0 +1,37 @@
+# Corstone700 specific SCP configurations and build instructions
+
+SUMMARY = "Boot Processor firmware"
+DESCRIPTION = "Boot Processor firmware"
+DEPENDS += "virtual/trusted-firmware-a"
+
+LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0 \
+                    file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+COMPATIBLE_MACHINE = "(corstone700-*)"
+SCP_PLATFORM = "corstone-700"
+
+# boot-firmware project is a fork of scp-firmware
+SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmware.git;protocol=https;branch=master"
+SRCREV = "a4dd1b60218b5172a94e6f44c96384b84a77588c"
+PV = "0.1.0~git${SRCPV}"
+
+B = "${WORKDIR}/build"
+
+EXTRA_OEMAKE = "PRODUCT='${SCP_PLATFORM}' \
+                BUILD_PATH=${B} \
+                CROSS_COMPILE='arm-none-eabi-' \
+               "
+do_compile_append() {
+   oe_runmake -C ${S}/tools/spitoc CC=${BUILD_CC} clean all
+}
+
+do_install() {
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_ramfw/release/bin/firmware.bin ${D}/firmware/se_ramfw.bin
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_romfw/release/bin/firmware.bin ${D}/firmware/se_romfw.bin
+    ${S}/tools/spitoc/spitoc \
+    --seram ${D}/firmware/se_ramfw.bin \
+    --offset 1  \
+    --fip ${RECIPE_SYSROOT}/firmware/fip.bin-${TFA_PLATFORM} \
+    --offset  33 \
+    --out ${D}/firmware/spitoc.bin
+}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 33ae7fe..c971c5c 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -4,5 +4,6 @@ MACHINE_SCP_REQUIRE ?= ""
 
 MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
+MACHINE_SCP_REQUIRE_corstone700 = "scp-firmware-corstone700.inc"
 
 require ${MACHINE_SCP_REQUIRE}
-- 
2.17.1

