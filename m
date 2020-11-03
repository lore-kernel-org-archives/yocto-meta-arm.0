Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.44])
 by mx.groups.io with SMTP id smtpd.web08.4502.1604412738614478695
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 06:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Z1+WYUm+;
 spf=pass (domain: arm.com, ip: 40.107.21.44, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvxBVRZRg/YnirseKoI+A30D9l3rMSO1bQwqVMwGl3Y=;
 b=Z1+WYUm+2Eic/E32KvJc6bdqnIDkdeSSsTYTAQt0kEk1nQfOZXSAt3j0+kvwCoHaYGLvpybbo9iyI40XTOIBmhnbcUt564dquNFkLo65su/PHEjy97TUlgD57ilgWzSOyPH7F02o3SJRXtaW02EsjW86aVTGpMzh05MCKbHmCuE=
Received: from AM6PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:2e::21)
 by DB8PR08MB5324.eurprd08.prod.outlook.com (2603:10a6:10:11e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:12:10 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::94) by AM6PR05CA0008.outlook.office365.com
 (2603:10a6:20b:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 14:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 14:12:09 +0000
Received: ("Tessian outbound 7c188528bfe0:v64"); Tue, 03 Nov 2020 14:12:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3ccd341a096e3267
X-CR-MTA-TID: 64aa7808
Received: from e67b4a4fc240.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A22E32D4-D3C3-4777-BF8F-5F6038F845AC.1;
	Tue, 03 Nov 2020 14:11:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e67b4a4fc240.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Nov 2020 14:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcQbobNixGZkPeZOgAn74BzxUabMeJ0EZmae+vLHuz6rVqZ7J8HKjwFcyvy/Ryo64OQXz5k569BOHw8Z+xFmJWjB/JCDqucEQdi8lQm/623PnH8n+Ne0NuDRYOwh5KZGbOogreMj+WRdLgXYty9dy6iBLXe1Tx5PfWd/xgswzS04kkh82am0iPtcASO+KLTA+A6zjBI1wAf9AqREaUr9oPGzXsJGJ6t0k6RWdNxiq2q0e1CA2EdHq8cKdAF3ZIJzVd58OVb02rUnBaqRJ+nGE6rzbtBAWbwlzDlW9WgL5RnDbM3MnG3kln/xsjB4Pa0BvHDtJ120WvEUkgVqVWEuWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvxBVRZRg/YnirseKoI+A30D9l3rMSO1bQwqVMwGl3Y=;
 b=dGJ6XmrvvMWs0rJ2e/dChbHxsqCfCXgWJCuufgFKlX4L4DlDF4zDaiDAej4oyedIzo1fJLhLA7PhgCl9c/gayhnr+Q4POcvHI3JdQjEydiNDjE2AK2D67VggOuQ1AkeQbm5IXL3jtq18CJBKNAC38A8SOlWaYPhxLQOcfLfK28mJVGoSnO23jgGlXk2/JqAjB9UBxVNBToJwm/3GBZZGa2NvO/R8gi/aH4/G6cQZm9ZH2YRLTBGlKzr+qzp2gmzRD6c/e+MtrNzk3/tVlbK2kCJTLc86liVCp/+hK4+hYNRox/E1B67Mxn/UrmwL98OUg4keal+Mlqr3zRXie+v6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvxBVRZRg/YnirseKoI+A30D9l3rMSO1bQwqVMwGl3Y=;
 b=Z1+WYUm+2Eic/E32KvJc6bdqnIDkdeSSsTYTAQt0kEk1nQfOZXSAt3j0+kvwCoHaYGLvpybbo9iyI40XTOIBmhnbcUt564dquNFkLo65su/PHEjy97TUlgD57ilgWzSOyPH7F02o3SJRXtaW02EsjW86aVTGpMzh05MCKbHmCuE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2997.eurprd08.prod.outlook.com (2603:10a6:209:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:11:55 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 14:11:55 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/4] arm-bsp/linux-linaro-arm: Move N1SDP specifics from .bbapend to .inc
Date: Tue,  3 Nov 2020 14:11:41 +0000
Message-Id: <0624b1d5cb32b094405595f69ec1bacee09c7e4e.1604412597.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 14:11:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81e15557-fcb0-432a-8b94-08d8800273d5
X-MS-TrafficTypeDiagnostic: AM6PR08MB2997:|DB8PR08MB5324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5324A6F03B940EC6EBC7456492110@DB8PR08MB5324.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:556;OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 r+SDb+TqNvd26OnlZ5YtBHKjU0GxsY7AiJkaQdHjZuNuvWtOBtESDhnYM5+L2Yme8D+nD7vaeh5t6ZVvoZE0o0qCuwZG3ofwyoVcv4zY3h1sQt3sJpBinZ824bJOjPNzy22kOxqeLC9wUKWfdS3RDnWQBOfNFTTd3LMwv4AUD6anPf5DhnZr+OK1utNKM27Clf2/XmKhNRGPuGavU5Je6CnXL3ZM16lQmZ67LbSeINjMgcTywX+j+9FgijpmEr/fWS0Ltf+E3vqMFO5FdJUMjN6KdNIatgEXhQWvXAyzDvn8gRCa6Y8PO9sVcERs8G2pzWWkRa129KSQnRrL7ZuJ6KnkgZcn+kEpC3OpycXdOIrWCQfqZrDFOIejkB+ywstY2wuim4g/+RpEkwp6K6MhxVQP/k+50VIRvKkjVKYqtgc0hO6EVD4+VLZCnP5Nkr1TS/vRJZyEtbnYyepRp7NVnA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39830400003)(66946007)(66556008)(186003)(26005)(16526019)(66476007)(2616005)(36756003)(5660300002)(44832011)(316002)(86362001)(7696005)(6916009)(6486002)(83380400001)(52116002)(4326008)(956004)(8676002)(8936002)(2906002)(478600001)(6666004)(142923001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 qeqDc2RoUEwmubTCd7dLsI7lgE3OhCzPWQVeEDosh1JMTO4XWpY2Zpjo4nalZop9xQsgOJYRcNH4dk+NbgGFrU3ThF5Ak3qa8HyORvV0xVMkf8gNk2LbknuAHcVlrM2S4pEAY9vTt5/z6LOiXwP0D8OWUZ+24iK6YPtoywEW9wnRRz1pqdeUNZaTjHaObK66TBDeo7Z9QPMu/MXAsWEbjaHsiW4+WZf3frPlvc7rnI2CTNJ1GzM7XW2HTPP2yMrQNlsWSKWD+MNciKIu8eYs1XgS7P3bJ+2zNwAO++4QZorLP4r8s28UzpSc5wZPg60PLiO07gRd6w4hEJ4nySsgQk9hYbsYLd421rhz1Aa8/jnOg7R9GlY72NPbmk5qe2elUZQouqK3Kz72SrBXMTVbk+2HlizuVfcdWPPZchX9o1ro38N0U/B4zO8Px6oOu9fjFJHjw1f4507oUfpE2ig6R7Yb/2iTyIbWHzc5P9RqdO855E79c8KS4a5dEiWXseixbmCZcqxMdssUNCGKtoMW3oHSYqb5BtygWOKIPFdtTxntm6PcU28/lh+y0IFQFC9ZCb+p7omGF9gcrAJDQILGU8RKpg9Bh4E6bFjoX+wMzYpQazm94P5GuYK0/MBgiRuNaFAN8q7c7erLbERt5HcISw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2997
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a6061f7c-2577-46d5-135a-08d880026b02
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	azHA1EfoIVyHLoqiMU3gkK4Jkg8t4JCJdK/kh99nAVARvnf0PBgJ1R34QaehwGgkThdxzD4OtI/iY247saNxxW+2+GhlTfVPTobV2EANbqSnUBfclSWb92tRA1FgDTw5RoltZHJ35r8yy+aSImC3941yLDlX5QSOyKjVnf00DqI7nMJeA6mCNxstTlxtAAQBmbzREjuqNfSvTRxHBCNAVFP9M3fZEyDCQ/p+jMDXbmL0E9qGqOfZ4IWYWCQ2e3urSDpJLDDNxfIgAcMpjzeeHKxFFeA3zA3lBf00FgeNGaHnbfcvpL3+dkqu+Mnhi2Frvkqw49w2Pd4ZjnEFX8pElK0pn91UxkmWEvTrHqFCcBpEcORuY+4iqGZvTUYiRh9vU1QI/HbmIHTdlC0wbl8Assu57d/WV/QdMhyrOIxjds01yYh6d9zwcd++kDsfzsHQopElgRSGh8WjH1sTvbxpEUebrvmyX6swxMyQUPMUMoOdOxqNTJS8Fzp0GeVygh6w
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(376002)(39850400004)(46966005)(83380400001)(81166007)(6916009)(47076004)(82740400003)(5660300002)(8936002)(356005)(36756003)(82310400003)(86362001)(36906005)(70586007)(336012)(26005)(186003)(6666004)(4326008)(6486002)(70206006)(956004)(16526019)(2616005)(2906002)(478600001)(44832011)(316002)(7696005)(8676002)(142923001)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 14:12:09.3556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e15557-fcb0-432a-8b94-08d8800273d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5324
Content-Type: text/plain

Make usage of .inc for N1SDP to concentrate its specifics.

Change-Id: I190eca0e9db0e9ec614588ff33190dba6ee75897
Issue-Id: SCM-1653
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../linux/linux-linaro-arm-n1sdp.inc               | 23 +++++++++++++++++
 .../recipes-kernel/linux/linux-linaro-arm.inc      |  6 +++++
 .../linux/linux-linaro-arm_5.4.bbappend            | 29 ----------------------
 3 files changed, 29 insertions(+), 29 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
new file mode 100644
index 0000000..1a6f0fe
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-n1sdp.inc
@@ -0,0 +1,23 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
+
+SRC_URI_append = " \
+    file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
+    file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
+    file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
+    file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
+    file://enable-realtek-R8169.cfg \
+    file://scripts-dtc-remove-redundant-YYLOC.patch \
+    "
+
+# Referring to commit TAG N1SDP-2020.07.27
+SRCREV = "84baaae9e751c058717d9702438429257f077f03"
+
+# Use intree defconfig
+KBUILD_DEFCONFIG = "defconfig"
+
+# Since the intree defconfig in n1sdp kernel repository is not setting all the configs,
+# KCONFIG_MODE is set to "alldefconfig" to properly expand the defconfig.
+KCONFIG_MODE = "--alldefconfig"
+
+COMPATIBLE_MACHINE = "n1sdp"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
index 1b8d4b2..999f4e7 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
@@ -17,3 +17,9 @@ DEPENDS += "openssl-native util-linux-native"
 
 LINUX_VERSION ?= "${PV}"
 S = "${WORKDIR}/git"
+
+# Add machine-specific settings
+MACHINE_KERNEL_REQUIRE ?= ""
+MACHINE_KERNEL_REQUIRE_n1sdp = "linux-linaro-arm-n1sdp.inc"
+
+require ${MACHINE_KERNEL_REQUIRE}
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
deleted file mode 100644
index 6b13f9a..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ /dev/null
@@ -1,29 +0,0 @@
-#
-# N1SDP MACHINE specific configurations
-#
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
-
-# Apply N1SDP specific patches
-SRC_URI_append_n1sdp = " \
-    file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
-    file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
-    file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
-    file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
-    file://0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
-    file://enable-realtek-R8169.cfg \
-    file://scripts-dtc-remove-redundant-YYLOC.patch \
-    "
-
-# Referring to commit TAG N1SDP-2020.07.27
-SRCREV_n1sdp  = "84baaae9e751c058717d9702438429257f077f03"
-SRCREV_dts_n1sdp = "3209a868152f348194cc1f20fd87c759d3a97d45"
-
-# Use intree defconfig
-KBUILD_DEFCONFIG_n1sdp = "defconfig"
-
-# Since the intree defconfig in n1sdp kernel repository is not setting all the configs,
-# KCONFIG_MODE is set to "alldefconfig" to properly expand the defconfig.
-KCONFIG_MODE_n1sdp = "--alldefconfig"
-
-COMPATIBLE_MACHINE_n1sdp = "n1sdp"
-- 
2.7.4

