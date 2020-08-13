Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.86])
 by mx.groups.io with SMTP id smtpd.web12.11542.1597330373430115024
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2fUKQmwJ;
 spf=pass (domain: arm.com, ip: 40.107.6.86, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67Q8oKvCbsmF5wwRay0uqgISqiCTZSXWMA3JxxxBzqc=;
 b=2fUKQmwJL5pazIXCBUIZ2FABzjnHljSn1UXIlPV6MIJVxCEZi9dh4kAbvBNHTVK5wB+sC37H7CfOASvYZYkaQLM2ND2oxiDpUu2PEwkvQzQcGWrnoEfj5BHxo37RRX6hCitLjYma7cPKrl17MKNHLVjdps47cE49JqT7xTB7EfU=
Received: from AM6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::26)
 by DBBPR08MB4396.eurprd08.prod.outlook.com (2603:10a6:10:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Thu, 13 Aug
 2020 14:52:49 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::8e) by AM6P191CA0013.outlook.office365.com
 (2603:10a6:209:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:48 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Thu, 13 Aug 2020 14:52:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4195d4f898fae29e
X-CR-MTA-TID: 64aa7808
Received: from da33eb56ae30.4
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 222155DD-45E7-4BAA-9995-638D438D5BC0.1;
	Thu, 13 Aug 2020 14:52:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da33eb56ae30.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvR2fVjkRvAFFm4AgIy5qOUeXYJn7XzY0Sixoqd5XWkKEQFSYlhw99nOx0XXJ+001R1QnmhS9JQtnXWZZSv4mFPyhJB3BYes2Vdz1sS9GizHl4zNQPKVo/5pAj2LVfsqt8gaUuyFYdQ312cU673aoN7xj2rDDlYusyAVYcyOSUVne2TutdJVl0tjE47F6KpxRMknlTUN2lBy7oSt/2uNiyrtVz2pXi57h6DI8GZRZ5sUSIykGa2+hKlpSA2/m/CzzWL7dzMgWqU4IYUuhQWT9LRJ5AQglZHdFUzQsOD1YGO3Iw+DioTBIHhdenDg/vl0GD89Dt/++c7DAsYLrLCjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67Q8oKvCbsmF5wwRay0uqgISqiCTZSXWMA3JxxxBzqc=;
 b=hihcyP8DwrzeMZdDDddU7d+nS/4bR6URiHr8BE/85WvHu1TeEThGlzo/QxDWk4YzBkngzOuOoRV9aPIeC5NneLFtDAaonCQCkOVoUaJ1mXVgAzHtc0QgIxiFMPxHULrlhCHz8I6L6VSjCE+D1J8sHY/l7Gwf5npnaoX3mDqiFt5BHJEjcMQXLf2WbM5NoBbvbKf8X90TUkhtn2O8d4s2nBBUp/IqPMe0fibPwrUuxnZoIgZdCMKbWNPy0CAz38/ohBXNhspButV02Qc1ZToNaP99Ap4YpG/BsGzybIg3H43Odbh2gl+xXY61BCABODhtLRtHKIw7txURbzh7H6WZ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67Q8oKvCbsmF5wwRay0uqgISqiCTZSXWMA3JxxxBzqc=;
 b=2fUKQmwJL5pazIXCBUIZ2FABzjnHljSn1UXIlPV6MIJVxCEZi9dh4kAbvBNHTVK5wB+sC37H7CfOASvYZYkaQLM2ND2oxiDpUu2PEwkvQzQcGWrnoEfj5BHxo37RRX6hCitLjYma7cPKrl17MKNHLVjdps47cE49JqT7xTB7EfU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:41 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:41 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH v2 1/9] arm-bsp/external-system: add external system recipe
Date: Thu, 13 Aug 2020 15:52:22 +0100
Message-Id: <20200813145230.22140-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fb449c5-8379-454d-7195-08d83f988bf0
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|DBBPR08MB4396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4396ED81B5E92C451DFCD34CFD430@DBBPR08MB4396.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w7keSAT4Htz18sdsTq87Ye0RCFYOwnPSLC2/fyupCp3+yU6Qq3DmkXDsadu1nkjMFktJdvSx3PPGT8XYWjq94ejL7fM1vV3wv/d+yiZVlPFHBs5nu5gGbENrj6SoDe0f7AjpUw43v6Psgzhaux806Q1MqE83PNAeZooHOLXqt7J8ZHT7tgPeQT6OhrLKyWwh3AQYiMrZlCuKPNiht6tKOYxiK0QnGGWAUneaSOHvVc49pUnpJFwLeXDftjWY08VcCDENVh+n9ah7wKkZ1YAiY9zJ8D3Y0p28HxTgXxRZmXLqa3dyhe+gKPauiCf3NXBwBg9wEagMrhQCOF8brbRhmZGIP57b+0+VSTfFtfuBUoqjGAvN3hBcYR9YI85B6fjV36mG+V5DhLjKWJfZ3YHKBw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(7696005)(2616005)(956004)(316002)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 5lXk3tlpRDAWx/EqbnzR/d1HhhUoDofRH+YX/Yu/jVdjYtj1XbYbV5r3bgutG9mDNEY+NAvftfnO9s1wdUINX1f7CBEVIde4hNUiRHilBC12zeU/WHBXlRIo16HHUqXUMDqR+XkSOKdOI2S3GWUHkZh5XiqsOHtcss0h7SZ5y5rtE9TT5skh/S1Pzuvz2t7izRuMFnxe/rbUa+o5nCevM/215k3JDDa3TomqIKa8czV8/kiYQNjMMVCbDWpXEhGghvhzdrbZxfKMG3TkXltPlk/luxPXg+PO/ZRq5oQKamncTIGFjDPxUrKxR+85aRsGivjXcWUCobtcgnwPiKrvojO6Q2sCNnT+ASw0sMeScXgddtsVHSnyyKNXQrwSNVlGTaeytuDOS/U0vOjRWxb5Gjb5Xcvo7GjxWwLyxuA8I024fwbi4Q3P7/fpGYncvT8ybcdiX0Xqfl7V4jXg3ptiqIxPuVkgqx5Vx46+orxP26inFlqAMSB9ixmJ9uiPEBi4qZlob58vn2KyGbZdm6HCfe8uVucI+2y7zxv45UrgyfyKlHBY3xoKdbFi3jOmBwytgY+PC3dpeSpMQYhgFs29YgcO1yInnyxLcvf89GrEB/4dYl/iq3IuxQudp8bgABWlukpQ5g/mCmkmUmsZE/oJVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	567d4fc1-2883-40c4-a79a-08d83f988781
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1GrCL8o6or4mHaRf9EI2FRY9QTWUfsn2iDiQgbWcB53t+sx1phiQDghsddcUW5VSevMbK1+Z3yzXPOZRm1IJRAMW/1GaFdnYBNzzlcLYsbmCXZWsgTd9bRtd4q+UeuYvRYMPShB/mF4iIen0DwKi+cKobE55ioGXsYFJRwkaXR1+eGZcZnwR8lOIMAsH16krBhWS4TQYzT/2k3em5fvrpV7MdV20q5s8MHEwU8kwTTHx+IoLm3j0Pljg5fR6dD6NHsVbPgFgVchxk+1WN/oJ8kVwUqCSKWtHPSMCaWKQr3eZoJz2EsnUMF7CocZEF4avyfO7eau/TfVuySKG4u7a3WY1FJPVa2lC5oOQsbRdLICPWmV35hOyOtoPuGFqbhlpgyeHL1xHU7h2NYGimcjv/1rbA9QlQ9we5DuQHYlycOeHTaSc5sizb14exAXbfD0dn8eO1GgbbBCMdlQa6mtlt7Yfv0f4te3st11Wa/Kfdyc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(47076004)(82740400003)(6486002)(316002)(81166007)(6666004)(4326008)(478600001)(7696005)(36906005)(2906002)(9686003)(2616005)(82310400002)(8676002)(8936002)(956004)(336012)(86362001)(70586007)(1076003)(16526019)(186003)(70206006)(356005)(6916009)(36756003)(26005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:48.7185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb449c5-8379-454d-7195-08d83f988bf0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4396
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

