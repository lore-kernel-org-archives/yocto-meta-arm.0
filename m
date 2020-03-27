Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.65])
 by mx.groups.io with SMTP id smtpd.web10.8885.1585306537133335507
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9znezrLP;
 spf=pass (domain: arm.com, ip: 40.107.3.65, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh4DjJhsh3dyA2NxjiLbMdOLqJWrVpdSmr822kGGG+8=;
 b=9znezrLPWJnZo/u74/fs7It0qvGMEeqDq271lMtoiAO5FWaeIuWk8gP0fRijF/cxk5GTT+PfTXggdhx8zUqAuBU8u1V80EykiHSm2P80t6mHlvwKQXizathH5VSs9KLxIRsK7CKbsP73GRXZd5LPyVOqhKutFB09fW9IHB61vYc=
Received: from DB6P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::11) by
 DB7PR08MB3691.eurprd08.prod.outlook.com (2603:10a6:10:75::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:55:34 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::6b) by DB6P195CA0001.outlook.office365.com
 (2603:10a6:4:cb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:55:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:55:34 +0000
Received: ("Tessian outbound d6b3ed9fc62a:v48"); Fri, 27 Mar 2020 10:55:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7427b12d6a54f37d
X-CR-MTA-TID: 64aa7808
Received: from f7bf98211762.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5729BED7-A7FA-4CE4-96DC-224C4150521A.1;
	Fri, 27 Mar 2020 10:55:28 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f7bf98211762.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:55:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzITZxsA6qyIef5HtVshggTPUdcr5JvYgb9UDD76tX3Jlb8wFbynpLzMfMKA7uKqIViYzggNiecYlsPpxOvZhzN3UU28CjPcH+4ZcZvyspMmCEGIXR+HX4I2Cr7BuFXfHP17ov2WUMqDmjYFMKCFy86Ghd+InYBisNwn3ySf0P8MWWloJ994+BQ2d96fTmxEQX5i7y/UJP/bYZzIJGti9j9suUzRm/xB3ZkRVAnFi69wmFdScUoDeTMtpp/EuRpmLhyhl4sVW8Z53QoMp8JRcDGGP8RIPlk8lC4NzJH+8xBksQKQrhLNvKEmIAELhzFeiWiGvj7GIeMDTX2kcW04ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh4DjJhsh3dyA2NxjiLbMdOLqJWrVpdSmr822kGGG+8=;
 b=Pr27w1VNrl5Erj1//WMxs7XYUZqslbP1tg73A3mSfcDmAtU66t3n/VzwlqorJenPZUYGkwvvECC3nWlTTLImgofrOYmZJkXvX7b5Il6Gh24MYeqjvWjfS9sgh1CUOTRoIOEHR+i+OAKxY/mFzrjacyOqvCZR4dPdZvZf/UmcDhRUhAfhSVQ2Z5a0JHH1+r4borlxXr7aQ+vOGppMJ2nfcZ3OtHul3l24bP+7JFQw6ujljcz4/SERXKVmoGDLtq3CW9PAi9DbKBAshrGz7W9l9zYNIp0/W7VDAofiwPtrhxzmoWPEklSXC/K/LMHpMWGaViwIjDwznBySamjCZb9lyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh4DjJhsh3dyA2NxjiLbMdOLqJWrVpdSmr822kGGG+8=;
 b=9znezrLPWJnZo/u74/fs7It0qvGMEeqDq271lMtoiAO5FWaeIuWk8gP0fRijF/cxk5GTT+PfTXggdhx8zUqAuBU8u1V80EykiHSm2P80t6mHlvwKQXizathH5VSs9KLxIRsK7CKbsP73GRXZd5LPyVOqhKutFB09fW9IHB61vYc=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3179.eurprd08.prod.outlook.com (52.135.130.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Fri, 27 Mar 2020 10:55:27 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:55:27 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy: Update quick start guide
Date: Fri, 27 Mar 2020 10:55:13 +0000
Message-Id: <20200327105513.618-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR2201CA0024.namprd22.prod.outlook.com
 (2603:10b6:4:14::34) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM5PR2201CA0024.namprd22.prod.outlook.com (2603:10b6:4:14::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend Transport; Fri, 27 Mar 2020 10:55:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 93a53737-bbf7-4b7d-8d4d-08d7d23d6029
X-MS-TrafficTypeDiagnostic: DB7PR08MB3179:|DB7PR08MB3691:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB36918F5B43DD7CAACB0B452E9DCC0@DB7PR08MB3691.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(8676002)(44832011)(6486002)(4326008)(5660300002)(8936002)(186003)(6666004)(16526019)(26005)(956004)(316002)(2906002)(81166006)(36756003)(66946007)(81156014)(1076003)(478600001)(52116002)(66556008)(86362001)(7696005)(66476007)(6916009)(2616005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AfK6ATNWUTXD/SD32JFZ9mQp0aC/dpev+dc4a2xFWeQcCLbMZxEhXMXVyVd54jFD6NM2s4qH4A2jtd521j2I1MQ472ETe0JnqJG0QdvZY+1ZYfLl+z83Q9U+GJ/siiOtFcKOxllF/+kWpB2nhnrDVytybK1HT5vUZbWzZEinYJ5kOz3N1ndd4csg/mvflDiu7jm+GOBtoBM/FzPVHdKhC+SdEXZ56VM9Md6Vtwjz20Qimg+A/+BhGNj28EptLIsr3lnCxdjekLq754EvhW35jDsf9c4J6lUOyNo4piWfU7u/hx0/ypS3t81bQ8UZZhM7G9qd8ZvBcvOsWTp4SCjRFqNbTlfXJeykJdiv8c43dz/rJPLy2h/skUz99uAnwQno6XwVL0BNv52Ydo9fx2Lj6DfMjgHWu7AsdfiVX4mAL82gbNiyRmVOtDLnWtSxMiOj
X-MS-Exchange-AntiSpam-MessageData: 
 659TK7QHPdJZlUQY3EL5kZOALNHk/Se0WB7AZAGiN6AqYfeW/jYO5lgsTaLrRBVisOIIGUBhwe7Ti2gUDfUNLb4Swh4v0BQ1o0TJIZyHt10DBNjyWpeVwoRETWhinvcAgwMbx0ZNI+Twa8wlIzNi7g==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3179
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(956004)(186003)(316002)(8676002)(36756003)(82740400003)(26005)(47076004)(5660300002)(336012)(6916009)(16526019)(2616005)(44832011)(70206006)(26826003)(81156014)(4326008)(478600001)(8936002)(6486002)(81166006)(86362001)(7696005)(2906002)(6666004)(1076003)(356004)(70586007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	edfddb1a-d5ed-4ddd-3a5d-08d7d23d5be9
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TWW4BVCrxm4JIzanUH20bfZ4onu6ppMJVUqd1eg3QGp/ycRL7EOiF0GPhuE7fX5EIN13iMglwBk/q3NYFaK535Ge1nPQkHwCsoZoIXNrGLzUSuytWIUjEGfhxJZDRjzU4dX/mnvG8i2FCVliNTd0olOVmIKc9aIHBGIt+RaK7+gYjLWYrIcFAiprJESWhyZY17WhQ/KHZ5gWeyAriO6PLEhEAq5lZd96MpZm5yJRUIpRGWGoCFQiBmkUqO0jetfKrNEhmVNhr2++n8iKgn2T1Bk43yEgICiwOweCHlXqfRgQxn8LtJVOpMxUADyyPbc8/YHCa/WrPJkyzWiqY5n+ARHPGBqC1PhDLiUDxUQcEQobDp+2ylEbxlO2hD3VRYICgx4YKo2Yb7Lmsop1oez+3/YKblFMB/Cyc53En7FpgaANyIgUd0o43Ha/yI/S4MhDvSg3ckVT2CjPHLv/eN150w0sS7yb6f58zL1sKGw0JpZq3+P1xr3u9saOnr/i5e5c/z+yAGmyljS5+BUCNAgQjQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:55:34.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a53737-bbf7-4b7d-8d4d-08d7d23d6029
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3691
Content-Type: text/plain

Add more documentation to the quick start guide:
- to include guests images in host image
- to boot the host image
- to adapt the layer to new boards

Change-Id: I07ff13190daf404476d28803f43f330fc190cddc
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../documentation/arm-autonomy-quickstart.md  | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index 2b92996..c688600 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -91,6 +91,19 @@ To create a host project:
 
 4. build the image using `bitbake arm-autonomy-host-image-minimal`
 
+The project will generate a Linux kernel, a root filesystem, a Xen binary and
+a DTB modified to include the required entries to boot Xen and Linux as Dom0
+(this DTB has the extension `-xen.dtb`).
+
+To boot the system using an u-boot base board you will need to:
+- Load the kernel (by default at 0x80080000 unless you modify
+  XEN_DEVICETREE_DOM0_ADDR value)
+- Load the xen device tree (for example at 0x83000000)
+- Load the xen-efi binary (for example at 0x84000000)
+- run using `booti 0x84000000 - 0x83000000`
+
+In this example the addresses might need to be adapted depending on your board.
+
 Guest project
 -------------
 The guest projects are not target specific and will use a Yocto MACHINE defined
@@ -113,4 +126,89 @@ To create a guest project:
 4. build the image you want.
    For example `bitbake core-image-minimal`
 
+The build will create a ".xenguest" image that can be use on an host project
+with the xenguest-manager.
+
+Include guests directly in the host image
+-----------------------------------------
+The layer provides a way to directly include in the host project one or several
+images generated by guest projects.
+
+To use this feature, you must edit your host project `local.conf` file and
+add set ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS to the list of xenguest images
+you want to include in your host. Each xenguest image must be given using a
+full path to it.
+For example:
+```
+ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS = "/home/user/guest-project/tmp/deploy/images/arm64-autonomy-guest/core-image-minimal-arm64-autonomy-guest.xenguest;guestname=myguest"
+```
+This will add the guest and name it `myguest` on the host project image and
+the xenguest-manager will automatically boot it during startup.
+
+Add support for your board
+--------------------------
+Most of arm-autonomy layer is board independent but some functionalities
+might need to be customized for your board:
+
+### Add the kernel configuration for the host
+The layer is using KERNEL_FEATURES to add drivers required to be a Xen Dom0
+system.
+Depending on the kernel used by your BSP and how it is configured you might
+need to add the required drivers to your kernel configuration:
+- if KERNEL_FEATURES system is supported by your kernel, make sure that the
+file `recipes-kernel/linux/linux-arm-autonomy.inc` from the layer is included
+by your kernel recipe.
+- if it is not supported, you must add the proper drivers inside your kernel
+(modules are possible but they must be loaded before xenguest-manager is
+started). You can find the complete list of the kernel configuration elements
+required in `recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg`.
+
+### Define the drive and partition to use for the LVM volume
+The xenguest-manager is creating disk hard drive using LVM on an empty
+partition. The default value is set to use /dev/sda2.
+You can change this for your board by setting XENGUEST_MANAGER_VOLUME_DEVICE.
+
+Check `recipes-extended/xenguest/xenguest-manager.bbappend` for examples.
+
+Please also read xenguest-manager.md.
+
+### Define the interface to add to xenguest network bridge
+xenguest-network bridge is creating a bridge on the host and adds network
+interfaces to it so that guest connected to it have access to external network.
+By default `eth0` is set as the list of interfaces to be added to the bridge.
+Depending on your board or use case you might want to use an other interface
+or use multiple interfaces.
+You can change this for your board by setting XENGUEST_NETWORK_BRIDGE_MEMBERS.
+
+Check `recipes-extended/xenguest/xenguest-network-bridge.bbappend` for
+exmaples.
+
+Please also read xenguest-network-bridge.md.
+
+### Define the network configuration of the xenguest network bridge
+xenguest network bridge is putting the host network interfaces in a bridge
+and is configuring it by default to use dhcp.
+If you need a different type of configuration you can set
+XENGUEST_NETWORK_BRIDGE_CONFIG in a xenguest-network-bridge.bbappend to use
+a different file.
+The recipe will look for the file in ${WORKDIR} so you will need to add it to 
+SRC_URI in your bbappend.
+The recipe will also substitute `###BRIDGE_NAME###` with the bridge name
+configured in ${XENGUEST_NETWORK_BRIDGE_NAME}.
+
+You can find an example configuration file in
+`recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in`.
+
+Please also read xenguest-network-bridge.md.
+
+### Customize Dom0 and Xen boot arguments for you board
+xen-devicetree is writting inside the generated DTB Xen and Linux boot
+arguments as long as the address where Dom0 Linux kernel can be found.
+You might need to have different values for your board or depending on your
+use case.
+
+You can find examples to customize this in
+`recipes-extended/xen-devicetree/xen-devicetree.bbappend`.
+
+Please also read xen-devicetree.md.
 
-- 
2.17.1

