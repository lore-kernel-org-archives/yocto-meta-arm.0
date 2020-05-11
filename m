Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web10.11603.1589203013090373663
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 06:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ryhh+MSl;
 spf=pass (domain: arm.com, ip: 40.107.8.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1Q3OK9wSPCodA0xaVq1PEchDEQjSkX2hEWHDlOwIvk=;
 b=Ryhh+MSlMa1y9yBnp9zWcjABGCFvbqLZTLocAM4UhsU2JEII/qAI5l1wjepvlIpr4be4WVeT0yP743stLkod/JoTUmPy4/5FjXjks6eB/DueQCN2c57m0d0zMU8UQ/4J6CoEyv7DbBwJLl+Y9K3wtxb+QbhRiCy4B1x9+xboHQw=
Received: from DB6PR0501CA0003.eurprd05.prod.outlook.com (2603:10a6:4:8f::13)
 by AM0PR08MB3009.eurprd08.prod.outlook.com (2603:10a6:208:66::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 13:16:38 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::e9) by DB6PR0501CA0003.outlook.office365.com
 (2603:10a6:4:8f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Mon, 11 May 2020 13:16:38 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 13:16:38 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Mon, 11 May 2020 13:16:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9072783d77e987e4
X-CR-MTA-TID: 64aa7808
Received: from 12c4af2bab01.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 50399FFA-D071-4FE7-947D-16621D60DDEA.1;
	Mon, 11 May 2020 13:16:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12c4af2bab01.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 May 2020 13:16:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIt5cqYxzngO42F4/y8tbEIEvi2NOFDnQ47lSGKwpRBZ2w+R4otT/M+GfWan2Z97XikqJ136rnh+K7x3my3ZduhWxWIixco66m58VxUB5OxRGiEtOFr0MAiKFBnuoIm7d5MZmgxFLirU6S5YS4c5IdWlblNUixfH+yGziqFDbrYnr3+BwW2iDjevxpM9rqEaNqUktnJwSj+dtmS/KH5rGaqgG5JZpGFxOV+vcC1LKNSW/pRMfKyRNZDCzqZXYgQ5H+WcSqixxV231o9zmnh4otf+9rmqqxiN6HJ9nV/N1npM/6t+HdrhJXqe4TYT2TdTkVGVX40V7CykMYZF4z6CVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1Q3OK9wSPCodA0xaVq1PEchDEQjSkX2hEWHDlOwIvk=;
 b=i+QrkI5/VNwU2ocghEnD8EZ0tEykXow4R3V9T0eY5SFNe8tSPZB07gzkqN53RtBy/S7dUby2tTIL8na9WEZbpPpDU4/gG7q8JYrBvBt3VZ06pqv/AkbaWasLfAyMtE/KsEyXWYomm1QGz/diXvhz9jsu2KI/CucdPARrhW4nSqiFvXrd5x5sGdLOeNhMOWSegRDF15NxE5C71eOZoT1KAqwyyK6N8iRyN+DspedJv0IF+nGBL9xERz+ukWbG7YX7j2S/DBZOiS3mE3VrlG38xXSBoq7X9sNx6sL72aI8GpDJAAhQKc9hdG83BYaIhODYL0h6lG4WaNQBsfN2/gpyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1Q3OK9wSPCodA0xaVq1PEchDEQjSkX2hEWHDlOwIvk=;
 b=Ryhh+MSlMa1y9yBnp9zWcjABGCFvbqLZTLocAM4UhsU2JEII/qAI5l1wjepvlIpr4be4WVeT0yP743stLkod/JoTUmPy4/5FjXjks6eB/DueQCN2c57m0d0zMU8UQ/4J6CoEyv7DbBwJLl+Y9K3wtxb+QbhRiCy4B1x9+xboHQw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4497.eurprd08.prod.outlook.com (2603:10a6:208:146::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Mon, 11 May
 2020 13:16:31 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 13:16:31 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] arm-autonomy: Add support for N1SDP
Date: Mon, 11 May 2020 14:16:30 +0100
Message-Id: <1589202990-52145-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::28) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0112.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2979.28 via Frontend Transport; Mon, 11 May 2020 13:16:30 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 113d6ed8-a58d-49a5-55d9-08d7f5ad899f
X-MS-TrafficTypeDiagnostic: AM0PR08MB4497:|AM0PR08MB4497:|AM0PR08MB3009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB300970F68AE99046E328A14A92A10@AM0PR08MB3009.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8rgbI78yVKMe6CEv2inXxFRx/NLFre5f3z6XQ5xc0hrKRNj+TnqCiiPBWMfqJn3XEgzvw4F8yGYAz6Q540tKnRH57SQ2Uj6+x1404OjMwuF7dkT3hyXYF7PRbSkb2dukYd/d2Ne2HB99MWp2Qc9SlN+uUHkkldk8f32HTplzPOf3adBs9RdnJBRCMmrkcvJ5gh30y5T2zEKa4RGskWKmcZh2p8rsaDxALsuExxPkHWuKsZpYtcf2cC8kivjJ9QQ3s6MZ8j+qmLqZioPEGfnyuuK5tmsAfCWAhZoPlrU/w31jLHtQDnDTWCkPCd8pUJWs9iZRgs7mWW4Eb5sE3WaY6nngpMhCT1YXbvD+hZ4O+gTfT8ACB/DQZYYxX394nhxzPdW+ngfAmyk+OZ84p8jVUMLnlqtGiKUohckh/vKE65WFK7IF4UJLlWQ4llbsg0lDGJT3x7sogk1fEUF3bKy/MV/nFC8zmyEKbLvwOpHpwoL7i1JIEAG9CLM9qpdUR95WvNpMENcs8yvnH3m/LEtLeLW8d0IKos71O9pFecQi0x/3fpA6mM7CfVSp3/3Kj0J7oPecSN/bQKWCiWOUTLmarRZo8Jzp6/AjqWWfzQ9muKw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(33430700001)(6486002)(4326008)(8676002)(316002)(36756003)(478600001)(86362001)(66556008)(66946007)(66476007)(33440700001)(16526019)(2616005)(186003)(956004)(8936002)(52116002)(7696005)(2906002)(44832011)(26005)(6916009)(5660300002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 k7PUS8KQwVpCl5CQJntfvUb0MaG4jWEobRxEnzccIm+FLeHGJ4PUaBMnA32+s7vMOvjvqSmc3jvx4460lzVX9g3iI7Eqfl0ozkAcfbBUGDArQtI9KSNUUlNJhb4jw1j5bFWoVjZGw1p4mRFzYERhF5wyswO+NdVUuVPn8hOCGSRMR6sQoNZCpCBiHeveEE8gnbc6pv0z+Y9Wod01TJM3Od8izslCBgwoXZ4I8NG2VITgM8fAopBmkvobeQv9YNzheAjcyl24UuUS5pX/lrsTr1gZ0VZ0qJykjdtHmfVb9M/19vMG3DztIb6zx7R3tZTZT+lGX0sIUrUTMyqngA/b+UF6VzYhYmPdEtnz8K97aYXzjrTr0LgsYqEXC4h8yzwH+/0KlG2fOmuFk+OcCcT9bPxHyEbbUNN5+Dp9XJfdQe0NfqOhGjMhWYbp5TyKOZZm/xnXRd0TihiF2cpvQSu7SV3YIXe2rn8eQ56JU7hzao75+g47ZZZ3iC4Hy9rQn8/m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4497
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(33430700001)(44832011)(316002)(86362001)(7696005)(47076004)(956004)(70586007)(70206006)(82740400003)(33440700001)(2616005)(356005)(2906002)(36756003)(8676002)(81166007)(8936002)(336012)(4326008)(6916009)(5660300002)(478600001)(186003)(82310400002)(26005)(6486002)(16526019)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	164103f8-b917-42cd-ab44-08d7f5ad8538
X-Forefront-PRVS: 04004D94E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aK/hnuPcgJMMRu1GnejgzQLraC5jd5GeIkVQxS3Xzb17Dv8iL9A09w2Sm6X305zWhG9keq9gJcxWwtPUa6F8jOTWsagIOLMbImAh8ryTHE29ytnJXuYPIfT4qbJrP3E+ZDMqrb9L82uu9eQCdxnB1QVWeHo3g8djCoxtNJJd4aXQcC4O27ZKRAZ2deYfu+v4SBRExEFWWIPpAYrFGt+mFHLaTve2n48tqvvGWbOSOWBJy/GMpmY66hbxvGGddCsfG3Vc8Tf2MGlXZGbdjwG+zSqi2Th2HE8IlNx1FCmyFgt50Vyvgk7KjBR/ye+s3hI957fzixRsaMqlau7oGVlB3rzje1C+FnNr/9mQxna3YPJtWhdhO5huGAGO6SDF4iJ4DA9ABi12rQKjGZrJyOh05MGZxojE2D+D61XYLeEbVwIZcd4O3pG4llPOdHIuUSYaFsf9dYFHSCDDVAFjqAmXzujCToNngIn74PlEmNMPeG6s65alrhg5YfSt4YSfmC2YSE/aYtb8BKvBDzpoiM0esG3lI0s1YxSMd4V5jgoSzu2kdNaXwkaRbtyoFwCq3GsGnBhELFaqM/GmKB42Zs8kjAa49qCPHUukiFZ0izhlpJGG91kLAoTXUwLAQ48t7QQGWAbWocMEVLTuKkzou9wjhr5fNeQGuJHCUXbnGS64HCw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 13:16:38.3212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 113d6ed8-a58d-49a5-55d9-08d7f5ad899f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3009
Content-Type: text/plain

This patch includes the following changes for n1sdp:

* Add the Xen defconfig and early printk setting;
* Setting the proper Xen device-tree boot args;
* Remove some entries in xen devicetree (PM and SMMU) to make is
compatible with XEN and extra registers settings required for PCI
quirks to communicate with SCP.

Change-Id: Ic968728115787de8d9bfcaaf883fd8573ff6c9c9
Issue-Id: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../xen-devicetree/files/xen-n1sdp.dtsi            |  39 ++++++++
 .../xen-devicetree/xen-devicetree.bbappend         |   7 ++
 .../recipes-extended/xen/files/n1sdp/defconfig     | 100 +++++++++++++++++++++
 .../recipes-extended/xen/xen_%.bbappend            |   5 ++
 4 files changed, 151 insertions(+)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
new file mode 100644
index 0000000..01ec14a
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-n1sdp.dtsi
@@ -0,0 +1,39 @@
+/*
+ * Modify N1SDP DTB to work properly when Xen is used
+ */
+
+/ {
+
+    /*
+     * pmu is using PPI interrupts which are reserved by xen
+     * remove pm nodes
+     */
+    /delete-node/ pmu;
+    /delete-node/ spe-pmu;
+
+    /*
+     * disable IOMMU until we have a proper support in xen
+     */
+    /delete-node/ iommu@4f000000;
+    /delete-node/ iommu@4f400000;
+
+    /*
+     * Set extra registers required for PCI quirks to communicate with SCP
+     * and remove invalid properties due to removal
+     */
+    pcie@68000000 {
+        reg = <0 0x68000000 0 0x1200000>,
+                <0 0x06000000 0 0x80000>,
+                <0 0x62000000 0 0x80000>;
+        /delete-property/ msi-map;
+        /delete-property/ iommu-map;
+    };
+
+    pcie@70000000 {
+        reg = <0 0x70000000 0 0x1200000>,
+                <0 0x06000000 0 0x80000>,
+                <0 0x60000000 0 0x80000>;
+        /delete-property/ msi-map;
+        /delete-property/ iommu-map;
+    };
+};
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
index 191cb13..006d0b7 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -6,10 +6,17 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI_append_juno = " file://xen-juno.dtsi"
 XEN_DEVICETREE_DTSI_MERGE_append_juno = " xen-juno.dtsi"
 
+# Add a dtb snippet to remove pmu and iommu in dom0 on N1SDP
+SRC_URI_append_n1sdp = " file://xen-n1sdp.dtsi"
+XEN_DEVICETREE_DTSI_MERGE_append_n1sdp = " xen-n1sdp.dtsi"
+
 # Board specific configs
 XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
 XEN_DEVICETREE_XEN_BOOTARGS_append_juno = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
 
+XEN_DEVICETREE_DOM0_BOOTARGS_append_n1sdp = " root=/dev/sda1 rootwait"
+XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
+
 XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda2"
 XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart dtuart=serial0 bootscrub=0"
 
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
new file mode 100644
index 0000000..e8a88c1
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/n1sdp/defconfig
@@ -0,0 +1,100 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Xen/arm 4.12.2 Configuration
+#
+CONFIG_64BIT=y
+CONFIG_ARM_64=y
+CONFIG_ARM=y
+CONFIG_ARCH_DEFCONFIG="arch/arm/configs/arm64_defconfig"
+
+#
+# Architecture Features
+#
+CONFIG_NR_CPUS=128
+CONFIG_ACPI=y
+CONFIG_GICV3=y
+CONFIG_HAS_ITS=y
+CONFIG_HVM=y
+# CONFIG_NEW_VGIC is not set
+CONFIG_SBSA_VUART_CONSOLE=y
+CONFIG_ARM_SSBD=y
+CONFIG_HARDEN_BRANCH_PREDICTOR=y
+
+#
+# ARM errata workaround via the alternative framework
+#
+CONFIG_ARM64_ERRATUM_827319=y
+CONFIG_ARM64_ERRATUM_824069=y
+CONFIG_ARM64_ERRATUM_819472=y
+CONFIG_ARM64_ERRATUM_832075=y
+CONFIG_ARM64_ERRATUM_834220=y
+CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=y
+CONFIG_ALL_PLAT=y
+# CONFIG_QEMU is not set
+# CONFIG_RCAR3 is not set
+# CONFIG_MPSOC is not set
+# CONFIG_NO_PLAT is not set
+CONFIG_ALL64_PLAT=y
+# CONFIG_ALL32_PLAT is not set
+CONFIG_MPSOC_PLATFORM=y
+
+#
+# Common Features
+#
+CONFIG_HAS_ALTERNATIVE=y
+CONFIG_HAS_DEVICE_TREE=y
+# CONFIG_MEM_ACCESS is not set
+CONFIG_HAS_PDX=y
+# CONFIG_TMEM is not set
+CONFIG_XSM=y
+CONFIG_XSM_FLASK=y
+CONFIG_XSM_FLASK_AVC_STATS=y
+# CONFIG_XSM_FLASK_POLICY is not set
+CONFIG_XSM_SILO=y
+# CONFIG_XSM_DUMMY_DEFAULT is not set
+# CONFIG_XSM_FLASK_DEFAULT is not set
+CONFIG_XSM_SILO_DEFAULT=y
+# CONFIG_ARGO is not set
+
+#
+# Schedulers
+#
+CONFIG_SCHED_CREDIT=y
+CONFIG_SCHED_CREDIT2=y
+CONFIG_SCHED_RTDS=y
+# CONFIG_SCHED_ARINC653 is not set
+CONFIG_SCHED_NULL=y
+# CONFIG_SCHED_CREDIT_DEFAULT is not set
+CONFIG_SCHED_CREDIT2_DEFAULT=y
+# CONFIG_SCHED_RTDS_DEFAULT is not set
+# CONFIG_SCHED_NULL_DEFAULT is not set
+CONFIG_SCHED_DEFAULT="credit2"
+# CONFIG_LIVEPATCH is not set
+CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=y
+CONFIG_CMDLINE=""
+CONFIG_DOM0_MEM=""
+
+#
+# Device Drivers
+#
+CONFIG_HAS_NS16550=y
+CONFIG_HAS_CADENCE_UART=y
+CONFIG_HAS_MVEBU=y
+CONFIG_HAS_PL011=y
+CONFIG_HAS_SCIF=y
+CONFIG_HAS_PASSTHROUGH=y
+CONFIG_ARM_SMMU=y
+CONFIG_DEFCONFIG_LIST="arch/arm/configs/arm64_defconfig"
+
+#
+# Debugging Options
+#
+# CONFIG_DEBUG is not set
+CONFIG_DEBUG_INFO=y
+# CONFIG_FRAME_POINTER is not set
+# CONFIG_COVERAGE is not set
+# CONFIG_LOCK_PROFILE is not set
+# CONFIG_PERF_COUNTERS is not set
+CONFIG_VERBOSE_DEBUG=y
+# CONFIG_DEVICE_TREE_DEBUG is not set
+# CONFIG_SCRUB_DEBUG is not set
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
index bac391c..bdcb75f 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
@@ -5,6 +5,7 @@ XEN_CONFIG_EARLY_PRINTK_juno = "juno"
 XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
 XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
 XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
+XEN_CONFIG_EARLY_PRINTK_n1sdp = "pl011,0x2a400000"
 
 # Foundation-armv8 support
 COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
@@ -25,3 +26,7 @@ SRC_URI_append_juno = " file://juno/defconfig"
 # Fix problem with number of interrupts on gem5
 SRC_URI_append_gem5-arm64 = " file://4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
 
+# N1SDP support
+COMPATIBLE_MACHINE_n1sdp = "n1sdp"
+
+SRC_URI_append_n1sdp = " file://n1sdp/defconfig"
-- 
2.7.4

