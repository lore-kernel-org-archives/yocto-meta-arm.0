Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.84])
 by mx.groups.io with SMTP id smtpd.web10.8821.1585306258563213517
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AASI+uX1;
 spf=pass (domain: arm.com, ip: 40.107.15.84, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTjLAJ13eNbTFUNWaDPflkHJbDyTpm1tOkEFTbKPWGQ=;
 b=AASI+uX1OimdQ1fj7gNYZ41o5XkX6iLNRxKW73Y46t2l+zzYBymUCR/Q1N3NMU1i8O3G5UiMPkZg3twFqtlbZc3BUUP6ugN+0I0RRF6XkYzfR8fLgrSTyOUnM0epddpIETMdwDz4gVnGgQf0qeQbghAclkFIhB0V/6vU6m4n4EI=
Received: from AM0PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:208:122::17)
 by DB7PR08MB3820.eurprd08.prod.outlook.com (2603:10a6:10:7f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 10:50:56 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:122:cafe::cb) by AM0PR04CA0004.outlook.office365.com
 (2603:10a6:208:122::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:56 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:56 +0000
Received: ("Tessian outbound 8f06d475fc37:v48"); Fri, 27 Mar 2020 10:50:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ece76a9b5b54727
X-CR-MTA-TID: 64aa7808
Received: from 720fe3bc3ad3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38520E54-2686-4B5A-B471-E2E91140E158.1;
	Fri, 27 Mar 2020 10:50:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 720fe3bc3ad3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtqSWBr/UQ0zrvK6W186vdhO+KnyugXvp8mG7XBKw5jNY4zrCvnc8PajdkvAPYyuorCMclNd29vrtx9wxjMquFj9MXhhMyai6kFqT81ZDdomrr3NMdUzBk/QU8KLkfJBND36UbHZTs/pXi0C+toS3NhzLqJBtKoxfSYlMKiLpNb61vY86yPg8ddSJlQ03KKNjKU3G46gczRPLdQ/Q5Ygy5biYxyiRN2NudOF2x1QOqY+HmprLtaezopZUzhNkajKWTQlPjfCS9lgdWG2D69DCswPM/c6H+ZXtK5vPBoF84PMaBBSsZD5xR6zql2gYZsjQpbyaay62kM/KP9wkQHB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTjLAJ13eNbTFUNWaDPflkHJbDyTpm1tOkEFTbKPWGQ=;
 b=O97g+qrKVy1UyEp+Hr+dYQ1jWKNgGKgaPfwbxEGQkIbPVZ/mdzCzL5BIm+PKAp0E0dKqhcXNwqAVeFlELzqNAVE91lske8kZOM08bdJoBywmS1ICpBT5jcrqu+0ZTSIUGKdtsiFN/Lt/YNdtbnYgvs2jnwmG7oakeg2pNJYXw9m+XuxlESyE+OI/ccI5MadyHfTinytasatnedVOCGi0yhoQxOVNg8i9iCXRM3J1NdM0hpSsqQsBUVyQukRXyv1o/vakpiHjjQa42exCyAZ10DIyRHmH49hWsKTpHL5QkFArQ3fJtz+/lCfRfgjye9mEEMxJuaEH1mszMpkgXLuWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTjLAJ13eNbTFUNWaDPflkHJbDyTpm1tOkEFTbKPWGQ=;
 b=AASI+uX1OimdQ1fj7gNYZ41o5XkX6iLNRxKW73Y46t2l+zzYBymUCR/Q1N3NMU1i8O3G5UiMPkZg3twFqtlbZc3BUUP6ugN+0I0RRF6XkYzfR8fLgrSTyOUnM0epddpIETMdwDz4gVnGgQf0qeQbghAclkFIhB0V/6vU6m4n4EI=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:50:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:50:49 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 7/7] arm-autonomy: Create xen-devicetree recipe
Date: Fri, 27 Mar 2020 10:50:10 +0000
Message-Id: <20200327105010.400-8-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dfee536f-4926-4207-7578-08d7d23cba40
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|DB7PR08MB3820:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB38205B26CDB31DB7239233F79DCC0@DB7PR08MB3820.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;OLM:2276;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(30864003)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8E/+gjSaSrUTf/X8Nt7mGU2kwHqFFSit6ZfhdahKU2APM6qEQxX3jjcrVhpq80UB6z538x6YFx+NHnNGN4wZkhwvnfOxYEZdbLRTjXDCm02t+UUd+V8jaclKBTpu6vZ8WmzEaLRPjwH5nskclpov5k4ltJzhRShymUhuyV6Eeia7Vz2bhsrg5tuXu/YwC3jngh174+84WLqTU8LOX5OOCoW3w3mQWRPWOJAi3SOcyMaCAOo9q+BeBSU9ylh1c+alv+ExVvFp4e7faG5+QMdASxtE7f88Fl6HbWodZtFexsKzt0EI8IqK2QbUo2PlNnPPsR20crOaFei/0i/7HJi0Pioqf3v3LIuxW1uzIff1gE9wQxj+NP9RrniWvcliVpdZQkOQlkPTdbyZuZCbUWpv7K64hqGzpPaOk2Ru0DHZtLkznRvXbkYLrmC21wVLgWoxoGT0MtQZMgHaLOr8jpXxDz0bSVGF+QspqgJq7RIWsE+mXIKsA7O9rHhvcoHXy/rNZo+XT3qH2AXorktk0A7AfHIMXPMS0SkSg2BYGnppTGWUdM2qLeqsB1wI9ZtnhjThutLHqPAisGTnSQXkhZ6e9iMKSDj7SzooWFkh+Jva1l6XjcLGoQvpAzUXD77Rs3mTYstmGECHoj2R0kqH2i6B5w==
X-MS-Exchange-AntiSpam-MessageData: 
 0BFh/7MAxyb2K5V0F7IvjTCJtIjqR9TMFsh8lirbb6Kx4Xojkk4CD0J7kRougcFFK7aZiYwL8rtp8DXjUw7uhvgPKSTD8uZck8vp1aFtMjPxI8NQUnKR0yuQfjbNEylZ0ybqt+e5gagqIuX3MlBBQA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(30864003)(1076003)(44832011)(186003)(6486002)(5660300002)(356004)(4326008)(8936002)(6666004)(16526019)(82740400003)(26005)(36906005)(2906002)(36756003)(956004)(316002)(8676002)(26826003)(478600001)(47076004)(81156014)(70586007)(86362001)(81166006)(70206006)(2616005)(7696005)(336012)(6916009);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d7dda36-4282-4323-cee8-08d7d23cb5e3
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y3Vheq7Kbnz7uDQiDWZrnMt84RQu/Y2BpGlMQqnXPe4dNq1tXPhk3W2O8+ghqxIWg1vbAiIXgpRdjNiDidIPQ/wXuE3UA8ExJDEfiJNb+7KuzoH2Z9fnBwAsAEQXydwF5V4wvbu8P4HeMjzoHMIo0e8IZbQhsda4ePUQKEfsQExsWRFqDpI22fCjHJVmrKuTpRFk7+rRnXS/unuoiyGAf+bC3LMWJzHp3Da1j2TOd3OGnlMhETwM1zV18hqo+umpSCqmDit9uHQ+GCRIzK5oy/JhqH3U4VFI9nTiLbWVWUOeYbZlG/ebntVjb9OD1XtkLDfcJfTBnOKh8QSu0KDfPoZI3nQdcStLciG3jmHZA5KE86+RXYpm17BCgSSBRrCylLnwLbejrOL4s6hoC8s04YD/yMWpOuID6U/0Fl7fYoXkq3kB0mF4POdDgpJzPEheRpNG5y0MiPaeqigbd5N6xoBxR0GCeWqTQYqKw9xcaxbu+GRLA7vnPOq/kVN9oELel4peEsfKHwFaTlWDiKxxJbdYQ4uoALjVO9sV8cfYuiDPg1zbxvdys7zsk0JXkitZHqDUa1quV5dLlqp1KQ7FsTVXMZxl9qF4f+5swYX5zabEJmnSasTB619xkwS6BhMIZJWMHYmKtS+TvIBOTw+MS3Dzs5P1AGj0b+mR6meQ51FwGgACvj4oeZDSJdc+ZKnEle//9/PbJdU6eUCyDG4OGQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:56.0061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfee536f-4926-4207-7578-08d7d23cba40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3820
Content-Type: text/plain

Create a xen-devicetree recipe to add entries required to boot Xen and a
Dom0 inside a DTB.
The recipe is introducing XEN_DEVICETREE_* parameters to define the xen
command line, the dom0 command line, the dom0 memory size, the dom0
kernel load address and size.
The recipe can also be extended using bbappend to adapt the device tree
and the parameters.
Adaptation are provided to support Juno, fvp-base and foundation-armv8
boards from meta-arm-bsp.
Add xen-devicetree as EXTRA_IMAGEDEPENDS to
arm-autonomy-host-image-minimal

Change-Id: Ibcfbd02c2377a9abcbd20caa47ea833b5308fbac
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |   4 +
 .../documentation/xen-devicetree.md           | 104 ++++++++++++++++++
 .../images/arm-autonomy-host-image-minimal.bb |   3 +
 .../xen-devicetree/files/xen-juno.dtsi        |  11 ++
 .../xen-devicetree/files/xen.dtsi.in          |  17 +++
 .../xen-devicetree/xen-devicetree.bb          |  68 ++++++++++++
 .../xen-devicetree/xen-devicetree.bbappend    |  18 +++
 7 files changed, 225 insertions(+)
 create mode 100644 meta-arm-autonomy/documentation/xen-devicetree.md
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index 9b12993..78a7281 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -40,6 +40,7 @@ Each recipe introducing such variables has a chapter "Bitbake parameters" in
 its documentation.
 
 Those documentation files should be checked for variables:
+- [xen-devicetree](documentation/xen-devicetree.md)
 
 BSPs
 ----
@@ -63,6 +64,9 @@ Recipes and classes
 -------------------
 This layer is adding the following recipes and classes:
 
+* [xen-devicetree](documentation/xen-devicetree.md): this is a recipe to modify
+  a device tree blob to add information required to boot xen and a Dom0 linux.
+
 Contributing
 ------------
 This project has not put in place a process for contributions currently. If you
diff --git a/meta-arm-autonomy/documentation/xen-devicetree.md b/meta-arm-autonomy/documentation/xen-devicetree.md
new file mode 100644
index 0000000..a44dca7
--- /dev/null
+++ b/meta-arm-autonomy/documentation/xen-devicetree.md
@@ -0,0 +1,104 @@
+Xen device tree
+===============
+
+Introduction
+------------
+
+xen-devicetree recipe can be used to modify an existing Device Tree Blob,
+produced by Linux kernel or another recipe, to include in it entries required
+to start Xen and a Dom0 Linux on top of it.
+
+The recipe will do the following processing:
+- generate a xen.dtsi file with entries required for xen based on parameters
+- turn DTBs in ${XEN_DEVICETREE_DTBS} back to dts
+- include in xen.dtsi and all other dtsi from
+  ${XEN_DEVICETREE_DTSI_MERGE} (check Bitbake parameters for more information
+  on this).
+- use dtc to create a new DTB file
+
+The recipe will generate new files in deploy/images and name them with the
+extension "-xen.dtb".
+For example **machine.dtb** will generate **machine-xen.dtb**.
+
+Entries added to the DTBs
+-------------------------
+
+When a DTB is processed by the recipe, the following block is added:
+```
+    chosen {
+        xen,dom0-bootargs = "VAL";
+        xen,xen-bootargs = "VAL";
+
+        modules {
+            #size-cells = <0x00000001>;
+            #address-cells = <0x00000001>;
+
+            module@0 {
+                reg = <VAL VAL>;
+                compatible = "multiboot,module";
+            };
+        };
+    };
+```
+Each occurence of **VAL** is replaced by the content of the variables listed in
+this documentation.
+
+Bitbake parameters
+------------------
+
+Several parameters are available to configure the xen-devicetree during Yocto
+project compilation (those can be set in your project local.conf, for exmple).
+
+The following parameters are available:
+
+- XEN_DEVICETREE_DEPEND: This variable can be used to indicate which recipe
+  task is generating the DTBs that xen-devicetree will modify. This makes sure
+  the xen devicetrees are properly regenerated if the source DTBs are changed.
+  This variable is set by default to "virtual/kernel:do_deploy" to use DTBs
+  generated during the compilation of the Linux kernel. This must be changed
+  if the machine your are using is not using a DTB listed in KERNEL_DEVICETREE.
+
+- XEN_DEVICETREE_DTBS: This should be set to the list of DTBs you want to be
+  modified by xen-devicetree. Those must be files that xen-devicetree can find
+  in the ${DEPLOY_DIR_IMAGE} directory using only the basename of the entries.
+  For example "mydir/board.dtb" will make the recipe look for
+  ${DEPLOY_DIR_IMAGE}/board.dtb.
+  This variable is set by default to "${KERNEL_DEVICETREE}" to process the DTBs
+  generated by the Linux kernel.
+
+- XEN_DEVICETREE_DOM0_MEM: Memory size to allocate to Dom0.
+  This variable is only used if XEN_DEVICETREE_XEN_BOOTARGS has a value
+  containing "dom0_mem=${XEN_DEVICETREE_DOM0_MEM}" as the memory assigned to
+  dom0 is defined using Xen boot arguments.
+  This variable is set by default to "1024M".
+
+- XEN_DEVICETREE_DOM0_BOOTARGS: Boot arguments to pass to Dom0 Linux when
+  booting it.
+  This variable is set by default to "console=hvc0 earlycon=xen".
+
+- XEN_DEVICETREE_XEN_BOOTARGS: this variable should be set with the boot
+  arguments to be passed to Xen on boot.
+  This variable is set by default to
+  "noreboot dom0_mem=${XEN_DEVICETREE_DOM0_MEM}".
+
+- XEN_DEVICETREE_DOM0_ADDR: This is the address from which the Linux kernel to
+  be used for Dom0 will be copied. When using u-boot, this is the address at
+  which you will load the kernel Image before starting Xen.
+  This variable is set by default to "0x80080000".
+
+- XEN_DEVICETREE_DOM0_SIZE: This is the size of the kernel loaded at
+  ${XEN_DEVICETREE_DOM0_ADDR}. Xen will copy this amount of data inside the
+  guest before starting it so the size must be at least equal to the kernel
+  size but can be bigger. You must be careful not to have a value too big as it
+  could slow down boot or copy other parts with it (like the DTB).
+  You might need to increase this if you use a kernel with a bundled initramfs.
+  This variable is set by default to "0x01000000".
+
+- XEN_DEVICETREE_DTSI_MERGE: This variable contains the list of dtsi files that
+  must be included inside the generated DTB file. By default the only one
+  include is the "xen.dtsi" generated by the recipe.
+  If your board or project needs to include more fixes or entries in the DTB,
+  this variable can be appended from a bbappend file to include other dtsi. The
+  files must be inside the recipe workspace during Yocto compilation.
+  You can check xen-devicetree.bbappend for an example.
+
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index fb0a0b7..5e09eac 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -18,6 +18,9 @@ IMAGE_INSTALL += " \
     qemu \
     "
 
+# Build xen-devicetree to produce a xen ready devicetree
+EXTRA_IMAGEDEPENDS += "xen-devicetree"
+
 python __anonymous() {
     if bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', False, True, d):
         raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'arm-autonomy-host'")
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi
new file mode 100644
index 0000000..0f9af21
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi
@@ -0,0 +1,11 @@
+/*
+ * Disable IOMMU on juno board when Xen is used
+ */
+
+/ {
+
+	/* turn off iommu */
+	iommu@2b600000 {
+		status = "disabled";
+	};
+};
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
new file mode 100644
index 0000000..42d12fa
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.in
@@ -0,0 +1,17 @@
+/ {
+    chosen {
+        xen,dom0-bootargs = "###XEN_DOM0_BOOTARGS###";
+        xen,xen-bootargs = "###XEN_XEN_BOOTARGS###";
+
+        modules {
+            #size-cells = <0x00000001>;
+            #address-cells = <0x00000001>;
+
+            module@0 {
+                reg = <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
+                compatible = "multiboot,module";
+            };
+        };
+    };
+};
+
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
new file mode 100644
index 0000000..0bb9def
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -0,0 +1,68 @@
+# This recipe can be used to modify one or several DTBS to add
+# entries required to declare and boot Linux as Dom0 from Xen
+
+SRC_URI = "file://xen.dtsi.in"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "\
+    file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302 \
+    "
+
+S = "${WORKDIR}"
+
+DESCRIPTION = "Add entries in DTB for Xen and Dom0"
+
+# Please refer to documentation/xen-devicetree.md for documentation on those
+# parameters
+XEN_DEVICETREE_DEPEND ?= "virtual/kernel:do_deploy"
+XEN_DEVICETREE_DTBS ?= "${KERNEL_DEVICETREE}"
+XEN_DEVICETREE_XEN_BOOTARGS ?= "noreboot dom0_mem=${XEN_DEVICETREE_DOM0_MEM}"
+XEN_DEVICETREE_DOM0_MEM ?= "1024M"
+XEN_DEVICETREE_DOM0_BOOTARGS ?= "console=hvc0 earlycon=xen"
+XEN_DEVICETREE_DOM0_ADDR ?= "0x80080000"
+XEN_DEVICETREE_DOM0_SIZE ?= "0x01000000"
+XEN_DEVICETREE_DTSI_MERGE ?= "xen.dtsi"
+
+# Our package does not generate any package for the rootfs but contributes to
+# deploy
+inherit nopackages deploy
+
+DEPENDS += "dtc-native"
+
+do_compile() {
+    cat ${WORKDIR}/xen.dtsi.in \
+        | sed -e "s,###XEN_DOM0_BOOTARGS###,${XEN_DEVICETREE_DOM0_BOOTARGS}," \
+        | sed -e "s,###XEN_XEN_BOOTARGS###,${XEN_DEVICETREE_XEN_BOOTARGS}," \
+        | sed -e "s,###XEN_DOM0_ADDR###,${XEN_DEVICETREE_DOM0_ADDR}," \
+        | sed -e "s,###XEN_DOM0_SIZE###,${XEN_DEVICETREE_DOM0_SIZE}," \
+        > ${WORKDIR}/xen.dtsi
+
+    # Generate final dtbs
+    for dtbf in ${XEN_DEVICETREE_DTBS}; do
+        rdtb=`basename $dtbf`
+        if [ ! -f ${DEPLOY_DIR_IMAGE}/$rdtb ]; then
+            die "Wrong file in XEN_DEVICETREE_DTBS: ${DEPLOY_DIR_IMAGE}/$rdtb does not exist"
+        fi
+        dtc -I dtb -O dts -o ${WORKDIR}/dom0-linux.dts ${DEPLOY_DIR_IMAGE}/$rdtb
+
+        # Add external includes
+        for inc in ${XEN_DEVICETREE_DTSI_MERGE}; do
+            echo "/include/ \"$inc\"" >> ${WORKDIR}/dom0-linux.dts
+        done
+
+        rdtbnoextn=`basename $dtbf ".dtb"`
+        dtc -I dts -O dtb \
+            -o ${WORKDIR}/${rdtbnoextn}-xen.dtb ${WORKDIR}/dom0-linux.dts
+    done
+}
+do_compile[depends] += "${XEN_DEVICETREE_DEPEND}"
+
+do_deploy() {
+    # install generated dtbs
+    for dtbf in ${XEN_DEVICETREE_DTBS}; do
+        rdtbnoextn=`basename $dtbf ".dtb"`
+        install -m 644 ${rdtbnoextn}-xen.dtb ${DEPLOYDIR}/.
+    done
+}
+
+addtask deploy before do_build after do_compile
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend
new file mode 100644
index 0000000..191cb13
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -0,0 +1,18 @@
+# Platform dependent parameters
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+# Add a dtb snippet to turn off iommu in dom0 on Juno board
+SRC_URI_append_juno = " file://xen-juno.dtsi"
+XEN_DEVICETREE_DTSI_MERGE_append_juno = " xen-juno.dtsi"
+
+# Board specific configs
+XEN_DEVICETREE_DOM0_BOOTARGS_append_juno = " root=/dev/sda1 rootwait"
+XEN_DEVICETREE_XEN_BOOTARGS_append_juno = " console=dtuart dtuart=serial0 bootscrub=0 iommu=no"
+
+XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda2"
+XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart dtuart=serial0 bootscrub=0"
+
+XEN_DEVICETREE_DOM0_BOOTARGS_append_foundation-armv8 = " root=/dev/vda2"
+XEN_DEVICETREE_XEN_BOOTARGS_append_foundation-armv8 = " console=dtuart dtuart=serial0 bootscrub=0"
+
-- 
2.17.1

