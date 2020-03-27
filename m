Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web10.8872.1585306471982535758
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cDxJxrhL;
 spf=pass (domain: arm.com, ip: 40.107.21.81, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WHEaAZMHbqMoX37Dpi6yLcIdYOOe7EAR2P1MCPREiM=;
 b=cDxJxrhLtdtxFkyLNyG9jE75P/UiIUhc3LkH082OKga3bDTeCdZt6AAw2ImOCr63p24vZTUL+xe5/e0w/T0LMYS8v30+ctbxqB7xB5pWgPULgGZBzCo6EySsKyUaKBm1kEcu3cAsMSYFIaVmys1ox3QTVkIzi/Cfi9KUvAZPr3U=
Received: from AM4PR08CA0061.eurprd08.prod.outlook.com (2603:10a6:205:2::32)
 by VE1PR08MB5181.eurprd08.prod.outlook.com (2603:10a6:803:10d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 10:54:29 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:2:cafe::9c) by AM4PR08CA0061.outlook.office365.com
 (2603:10a6:205:2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:54:29 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:54:29 +0000
Received: ("Tessian outbound e13acb17570e:v48"); Fri, 27 Mar 2020 10:54:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a09e27547a34d9b
X-CR-MTA-TID: 64aa7808
Received: from b826b5d6f0ea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3B7D0255-90F2-405F-9B0C-A8DE199594C2.1;
	Fri, 27 Mar 2020 10:54:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b826b5d6f0ea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:54:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4xJf/6WIr5Fs2eCpHjVDg4WDIIHP7bA79Y8ffWT6opWxhS/3Rn8jVhynvQd4Gi76bULu3S1s0FuS4WFVabY9kY4qVEMLBbpY/M803tV7/HWtLRGeg67+GEEJwaiEMAT3p6ujWkw7m/8BTlMoEdgsx1++H4kv2iwuljr9vRPaYHiGPZayulp0mPVLkboPGdzCf8GUT6zreFWlvbrS2NTSuhzgm8KWoTsQxFoLvAAd9yGFhY7yATWbayKFZxCUuPrYDvP/Rjt1mUUcPv0SUV3B5S2SDcduXaksE/9GILmHtNZCzUAXfF9Gri9LNx9tJqa//Ma1WLbzjjpPgy3fp8f0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WHEaAZMHbqMoX37Dpi6yLcIdYOOe7EAR2P1MCPREiM=;
 b=eEomfatifoMzMFEQMTwsuM8V562NI+6np79poperZnQYjpqenMM/CHRiJc9x7Gzwk3iy12w7nD2WsL6nVGoQhZGbbchC9azFQiByltVHMdG9YvUlPeA5vknlNvlV5nWM2Vigf23wdntGTggfDR/Ve+l3+bAcTHLOHyJv3yV1ZmXkAGye3aeyU59jdJcLoo6na/mDY/Y8bjolSYymVIz+/3Qlbo/nPkL2VTpfV5kHaVDPUajeVjM3EnlAfMIvwhFPHG1V4mWKEDJq1suLH588Cb8NfsCKU5H4fciMVe6NWaH4SzvhRDcdFgFRZ7VdfS62h3EbogEkRA7KVy5lqc6uFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WHEaAZMHbqMoX37Dpi6yLcIdYOOe7EAR2P1MCPREiM=;
 b=cDxJxrhLtdtxFkyLNyG9jE75P/UiIUhc3LkH082OKga3bDTeCdZt6AAw2ImOCr63p24vZTUL+xe5/e0w/T0LMYS8v30+ctbxqB7xB5pWgPULgGZBzCo6EySsKyUaKBm1kEcu3cAsMSYFIaVmys1ox3QTVkIzi/Cfi9KUvAZPr3U=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:54:22 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:54:22 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy: Create xenguest network bridge
Date: Fri, 27 Mar 2020 10:53:58 +0000
Message-Id: <20200327105358.507-3-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105358.507-1-bertrand.marquis@arm.com>
References: <20200327105358.507-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: SN4PR0501CA0057.namprd05.prod.outlook.com
 (2603:10b6:803:41::34) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.49) by SN4PR0501CA0057.namprd05.prod.outlook.com (2603:10b6:803:41::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.11 via Frontend Transport; Fri, 27 Mar 2020 10:54:21 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3349aa6f-9028-4ca0-8a4d-08d7d23d3945
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|VE1PR08MB5181:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5181744C425A1D4BA66014E09DCC0@VE1PR08MB5181.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;OLM:2089;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(30864003)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t3A8yfxkdZQh5KPH7AOYp8eJRHsw/tEzAmF9blazBDjU70i1Lzr37G/vS3Cv6Ig0cH0Bm27QWvK7E2KjjQtA+wFzfra0fLJmy5Wz49mzmEkmfdvS4456og786gro5D84NWFebeGjA2/1n8Q8lGo1GX6zNUKgiVI4WlBH6CLaZOz5348E1lBO2RBq06kXpZA2aPSWcGvpeXHZWTQ7NsZ7nFsARe4BEUbff/U35kONisfkG9mjO9bgYp53PuYR7gwoO6JnA8TOHdGWMlzpJL8N5ch2yN+s7OAmbl2BTm56VIFlL/JWSErt97/42/Ag4eEglRCuiLLXihc9mP2BHcPf00D89ZFhpxySCL6j0Ta114MvTj2t/NTVKrCdWGRou4IpXpZ2Csj9Jzb8rXbfnD33cu16QirEUkBXyt8UtZblakUQQTv+1wsAhQh7YsSDySDK8xAtafUFXCxKEOd4Ez+8MVHTn0rdVhqUHNH4Iv6fi4W6bl60aEx4ML5VEA99ZvJoAu58TdnmETjVhYEsjympTcu8iqbUMadO7OGz7icRqXSY5NQ0W2QzJA8X8x7tOEH4CsN2r/qom6HHTzIUZ6rHVdx35Y85+qQagV29o/VOf41BlZOiMDKZkVJsjjLqmY4fjlZUMTAHRXDH4tLv7NqJ2Q==
X-MS-Exchange-AntiSpam-MessageData: 
 6iM7/7iPHt7LGnCNpasoH7Phgm4shpQW+2wvd/znLRnC101TACDfO43OOqEnvK2RY9v/BlK/m3J+V8Yvp0Q4Z6GCZFTH8vDoCbiDyMOKL7oH7yndCTRcGGxMwm8/9OR3ViTRXlGrKVcdHsSrFDgV6Q==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(26005)(2906002)(316002)(70586007)(478600001)(1076003)(36906005)(186003)(81166006)(8936002)(8676002)(16526019)(6916009)(81156014)(26826003)(7696005)(70206006)(5660300002)(6486002)(36756003)(6666004)(2616005)(356004)(4326008)(86362001)(82740400003)(30864003)(956004)(47076004)(44832011)(336012);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	298e79ad-4d33-4e9e-6928-08d7d23d352f
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UOT3cAZbXJTAz6m6jyia3eJvsNJhe5Hw1VQGdpwMAqktEHB8V+WbFbcfqvSDNEVkJbDc8xSkSHHKeWf6WbXpg2jxsYySWA+ZqRmQdkWmbSNHx9oZqhbYt6RXGINp5ojV0i+1lc5vbYzueu4MbPhg/vw2cVZCY0owJMJniDjpyQkgJ3SNxnkRxt8+s6jgpOwrG3AA2wYCRsiGgThgpHHkFo78GBAVfv3F75C4IWqHCMasrVHRKTjktBWHSu9Suolg7FepUHQU7lm+M9cIgI4Fb2L3jnv3QLQNesFoFHQ4ALM2JL5ma2l2HKQ1vmqFL6uMRWJpdnYC7NbF9gcDFU/0lsR41lF3XAco4mCLblD8Xz3euxoKvk/Z0NK1aW39UxsihIBUx6th3VcSpUV0yUw2GCcgjP7UqwSVpIlri2NoLNlD7pSlu187xBXTHdww4y3E6Y0dDt3CWUIn18AlhaCI0Ks9j6h6+1O62ncABs6NjZporSFbIhNfyVXqa8e5PksxGucrUx2NN48jsR6rHEirhwzyj3bx1pzv41WVv2INppZ98w7KSqV2vVLnp5iZ8hWAzBi/CuEnbaZLgp62WptScASEBeJA9N9KtfTHifzQnLzQTFt+ScPyBmUaTgJQkz4B8NNC8ZyAP2N5uLs0bcBVp2Q9vYOWE2RdR7ZNO6orMYLj3C5/J9wR3cQj5TJtyUt2dH+HYVOKWkI3EhY0cfdNaw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:54:29.1130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3349aa6f-9028-4ca0-8a4d-08d7d23d3945
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5181
Content-Type: text/plain

Add a xenguest-network-bridge script to create a network bridge with the
host interfaces.
Add a xenguest init script to create a xen network interface connected
to the bridge
Add a network interfaces configuration file to have dhcp configuration
on the network bridge
Add xenguest-network-bridge to the default host image
Add XENGUEST_IMAGE_NETWORK_BRIDGE parameter to xenguest-image to let
user setup if a guest should be or not connected to the bridge

Change-Id: Id15fde234386376e89c2562e1ffa935c51affa5b
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |  5 ++
 .../classes/xenguest-image.bbclass            | 11 ++++
 .../documentation/xenguest-network-bridge.md  | 49 +++++++++++++++++
 .../images/arm-autonomy-host-image-minimal.bb |  1 +
 .../xenguest/files/network-bridge.sh.in       | 15 ++++++
 .../files/xenguest-network-bridge-dhcp.cfg.in |  3 ++
 .../xenguest/files/xenguest-network-bridge.in | 44 ++++++++++++++++
 .../xenguest/xenguest-network-bridge.bb       | 52 +++++++++++++++++++
 .../xenguest/xenguest-network-bridge.bbappend |  2 +
 9 files changed, 182 insertions(+)
 create mode 100644 meta-arm-autonomy/documentation/xenguest-network-bridge.md
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index 93b5723..836d459 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -42,6 +42,7 @@ its documentation.
 Those documentation files should be checked for variables:
 - [xen-devicetree](documentation/xen-devicetree.md)
 - [xenguest-manager](documentation/xenguest-manager.md)
+- [xenguest-network-bridge](documentation/xenguest-network-bridge.md)
 
 BSPs
 ----
@@ -74,6 +75,10 @@ This layer is adding the following recipes and classes:
 * [xenguest-manager](documentation/xenguest-manager.md): this is a tool to
   create/remove/start/stop xen guest generated using xenguest-mkimage.
 
+* [xenguest-network-bridge](documentation/xenguest-network-bridge.md): this
+  recipe add tools and init scripts to create a bridge connected to the
+  external network on the host and allow guests to be connected to it.
+
 Contributing
 ------------
 This project has not put in place a process for contributions currently. If you
diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
index fecf1ae..b4d4122 100644
--- a/meta-arm-autonomy/classes/xenguest-image.bbclass
+++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
@@ -61,6 +61,11 @@ XENGUEST_IMAGE_DISK_SIZE ??= "${@ '4' if not d.getVar('INITRAMFS_IMAGE') else '0
 # and containing the root filesystem produced by Yocto
 XENGUEST_IMAGE_DISK_PARTITIONS ??= "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:rootfs.tar.gz"
 
+# XENGUEST_IMAGE_NETWORK_BRIDGE can be set to 1 to have a network interface
+# on the guest connected to host bridged network. This will provide the guest
+# with a network interface connected directly to the external network
+XENGUEST_IMAGE_NETWORK_BRIDGE ??= "1"
+
 # Sub-directory in wich the guest is created. This is create in deploy as a
 # subdirectory and must be coherent between all components using this class so
 # it must only be modified from local.conf if needed
@@ -144,6 +149,12 @@ xenguest_image_create() {
     else
         call_xenguest_mkimage update --set-param=GUEST_AUTOBOOT=0
     fi
+
+    if [ "${XENGUEST_IMAGE_NETWORK_BRIDGE}" = "1" ]; then
+        call_xenguest_mkimage update --set-param=NETWORK_BRIDGE=1
+    else
+        call_xenguest_mkimage update --set-param=NETWORK_BRIDGE=0
+    fi
 }
 
 #
diff --git a/meta-arm-autonomy/documentation/xenguest-network-bridge.md b/meta-arm-autonomy/documentation/xenguest-network-bridge.md
new file mode 100644
index 0000000..6653fe8
--- /dev/null
+++ b/meta-arm-autonomy/documentation/xenguest-network-bridge.md
@@ -0,0 +1,49 @@
+xenguest network bridge
+=======================
+
+Introduction
+------------
+
+xenguest-network-bridge is creating a network bridge to allow some guests to
+have a direct connection to the external network.
+To do this, a bridge is created on the host using brctl with the network
+interfaces added to it so that the bridge is connected to the external network.
+It is also adding a guest init script which will, for guests configured to use
+it, create a virtual network interface for the guest and connect it to the
+network bridge on the host.
+
+Usage
+-----
+
+On the host the package xenguest-network-bridge must be included in your image.
+
+On the xenguest image of your guest, the parameter NETWORK_BRIDGE must be set
+to 1 (using xenguest-mkimage --set-param=NETWORK_BRIDGE=1).
+
+Bitbake parameters
+------------------
+Several parameters are available to configure the xenguest network bridge
+during Yocto project compilation (those can be set in your project local.conf,
+for example).
+
+The following parameters are available:
+
+- XENGUEST_NETWORK_BRIDGE_NAME: This variable defines the name of the network
+  bridge that is created on the host during init.
+  This is set by default to "xenbr0".
+
+- XENGUEST_NETWORK_BRIDGE_MEMBERS: This variable defines the list of network
+  interfaces that are added to the bridge when it is created on the host during
+  init.
+  This is set by default to "eth0".
+
+- XENGUEST_NETWORK_BRIDGE_CONFIG: This variable defines the configuration file
+  to use to configure the bridge network. By default it points to have file
+  configuring the network using dhcp.
+  You can provide a different file using a bbappend and make this variable
+  point to it if you want to customize your network configuration.
+
+- XENGUEST_IMAGE_NETWORK_BRIDGE: This variable can be set to 0 or 1 on guest
+  projects to enable or not the connection of the guest to the host bridge.
+  This is set by default to "1".
+
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index ffe5bce..10c6e4b 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -17,6 +17,7 @@ IMAGE_INSTALL += " \
     xen-base \
     qemu \
     xenguest-manager \
+    xenguest-network-bridge \
     "
 
 # Build xen-devicetree to produce a xen ready devicetree
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
new file mode 100755
index 0000000..2a36096
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
@@ -0,0 +1,15 @@
+#!/bin/sh
+# This script is setting up a virtual network interface connected to the
+# xenguest-network-bridge if NETWORK_BRIDGE is set to 1 in the guest params
+
+guestname="${1}"
+
+BRIDGE_NAME="###BRIDGE_NAME###"
+
+# get guest parameters
+. ./params.cfg
+
+if [ "${NETWORK_BRIDGE:-}" = "1" ]; then
+    echo "vif = ['${BRIDGE_NAME}']" >> ${guestname}.cfg
+fi
+
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in
new file mode 100644
index 0000000..6e06379
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in
@@ -0,0 +1,3 @@
+# Xenguest Network Bridge interface configuration
+auto ###BRIDGE_NAME###
+iface ###BRIDGE_NAME### inet dhcp
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
new file mode 100755
index 0000000..2278b80
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
@@ -0,0 +1,44 @@
+#!/bin/sh
+#
+# Xenguest Network Bridge init
+# This script creates a network bridge and add host interfaces to it
+# It will then be used by xen guests to connect to the external nework
+#
+
+INTFS="###BRIDGE_MEMBERS###"
+BR_INTF="###BRIDGE_NAME###"
+
+case "$1" in
+  start)
+        echo "Starting $BR_INTF"
+        brctl addbr $BR_INTF
+        for intf in $INTFS; do
+            echo "Adding $intf to $BR_INTF"
+            brctl addif $BR_INTF $intf
+        done
+        ;;
+  status)
+        true
+        ;;
+  stop)
+        echo "Stopping $BR_INTF"
+        ifdown $BR_INTF
+        brctl delbr $BR_INTF
+        ;;
+  reload)
+        echo >&2 'Reload not available; use force-reload'; exit 1
+        ;;
+  force-reload|restart)
+        echo "Restarting host-bridge"
+        $0 stop
+        $0 start
+        ;;
+  *)
+        # do not advertise unreasonable commands that there is no reason
+        # to use with this device
+        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
+        exit 1
+esac
+
+exit $?
+
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
new file mode 100644
index 0000000..babd694
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
@@ -0,0 +1,52 @@
+# Recipe to handle xenguest network configuration
+DESCRIPTION = "XenGuest Network Bridge"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+S = "${WORKDIR}"
+
+# Please refer to documentation/xenguest-network-bridge.md for documentation on
+# those parameters
+XENGUEST_NETWORK_BRIDGE_NAME ?= "xenbr0"
+XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
+XENGUEST_NETWORK_BRIDGE_CONFIG ?= "xenguest-network-bridge-dhcp.cfg.in"
+
+SRC_URI = " \
+    file://xenguest-network-bridge.in \
+    file://xenguest-network-bridge-dhcp.cfg.in \
+    file://network-bridge.sh.in \
+    "
+
+# Bridge configurator needs to run before S01networking init script
+# Prefix with a_ to make sure it is executed in runlevel 01 before others
+INITSCRIPT_NAME = "a_xenguest-network-bridge"
+INITSCRIPT_PARAMS = "defaults 01"
+
+inherit update-rc.d
+
+do_install() {
+    cat ${WORKDIR}/xenguest-network-bridge.in \
+       | sed -e "s,###BRIDGE_MEMBERS###,${XENGUEST_NETWORK_BRIDGE_MEMBERS}," \
+       | sed -e "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
+       > ${WORKDIR}/xenguest-network-bridge
+    cat ${WORKDIR}/${XENGUEST_NETWORK_BRIDGE_CONFIG} \
+       | sed -e "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
+       > ${WORKDIR}/xenguest-network-bridge.cfg
+    cat ${WORKDIR}/network-bridge.sh.in \
+       | sed -e "s,###BRIDGE_NAME###,${XENGUEST_NETWORK_BRIDGE_NAME}," \
+       > ${WORKDIR}/network-bridge.sh
+    install -d -m 755 ${D}${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/xenguest-network-bridge \
+        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+    install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
+    install -m 755 ${WORKDIR}/xenguest-network-bridge.cfg \
+        ${D}${sysconfdir}/network/interfaces.d/.
+    install -d -m 755 ${D}${sysconfdir}/xenguest/init.pre
+    install -m 755 ${WORKDIR}/network-bridge.sh \
+        ${D}${sysconfdir}/xenguest/init.pre/.
+}
+
+RDEPENDS_${PN} += "bridge-utils"
+FILES_${PN} += "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
+FILES_${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend
new file mode 100644
index 0000000..dc84921
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend
@@ -0,0 +1,2 @@
+# Juno board has 2 network interfaces, add both of them to the bridge
+XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
-- 
2.17.1

