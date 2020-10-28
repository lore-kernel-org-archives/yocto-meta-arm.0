Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.82])
 by mx.groups.io with SMTP id smtpd.web10.7225.1603883370689317319
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 04:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9wV0XEdp;
 spf=pass (domain: arm.com, ip: 40.107.7.82, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvVqPzx8s7Q6r95SZgOhM3PxyvnH03+QnFgT2wQRNBw=;
 b=9wV0XEdpRIj3j0uPj9Xt8wXYsA5PGirEeFojy29XPlE3dpHm/HWUtXaQcwS4YOk2KN74cey4fZv9SHS1YSaSAQwqec0gYn33ny10HX6EPUIZj+Hzv6IoxJS6JfgC+zVUYCWDZoFVf1zf94HEiveBa+BbI4/1fdyIYKeTgSpo81g=
Received: from AM0PR02CA0093.eurprd02.prod.outlook.com (2603:10a6:208:154::34)
 by AM0PR08MB4436.eurprd08.prod.outlook.com (2603:10a6:208:13a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 11:09:27 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:154:cafe::c4) by AM0PR02CA0093.outlook.office365.com
 (2603:10a6:208:154::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22 via Frontend
 Transport; Wed, 28 Oct 2020 11:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 11:09:27 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Wed, 28 Oct 2020 11:09:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 649aeed91d803e28
X-CR-MTA-TID: 64aa7808
Received: from 382221675660.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C4BE068F-FA5B-4116-B1DD-C1E390043B19.1;
	Wed, 28 Oct 2020 11:09:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 382221675660.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 11:09:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feruLjYamTedjWnRiCKor5iIM7AA1coR0nfAX16hfnP629SI9FOsHPnY5pGA+ht4CBccP3TkJZHMnImuoGjoS8HHMxooYSOpsDnO0PdtN8jsN3o3gWWbPGnCGtcibBGEVxWci9CixQP1RnuVWS2dehqntMD+8f4W/t6uvdqIXJoztoXXM/PeSAe/EwXPsrfnFef992x+BZcElJEtTsguTqvo9TifBcqYrkgCNq1XPsxFeNpSmjcSdXCFQQxpBws1TuIymkt2JUevKrYzeRGUNSiXY7kNNe5GI6GYqJzBth2VaMI5+ACSq0G0Gp0eC1sMjaxEBNtWNfpyR3KWJlEGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvVqPzx8s7Q6r95SZgOhM3PxyvnH03+QnFgT2wQRNBw=;
 b=iMyb7asN2kYCbC2TmZfvPmdnIUVvVz9//Qnnrg5XSVbAWbvJfOIM1tUAWDu6SQR9GdwvQPEerXK5k5h3KWHcXqVGe9KtasQIuZ0Limb/vu1Ci9pvcjP/UCNE/MRfFXTkpIECNSoyiCoLLWUHhIxzSBHo1oCCC/rjUT5kkn26Qfz1gVBTUUoWI2xZBMCPIsl1w7ga6rWu9Um4A1XHyxrwsTEmbwurgtwk+90yh9A+X/p3PjszNq1qY1vZoSU+59P8yXC4a6qU7R6Y0sh9pnUgPo+ct8aHOhlBCuvRv4meoyvIT71deJZO86lPHBJkK5aWdFbs3Ymh4AkHn+0VVadq0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvVqPzx8s7Q6r95SZgOhM3PxyvnH03+QnFgT2wQRNBw=;
 b=9wV0XEdpRIj3j0uPj9Xt8wXYsA5PGirEeFojy29XPlE3dpHm/HWUtXaQcwS4YOk2KN74cey4fZv9SHS1YSaSAQwqec0gYn33ny10HX6EPUIZj+Hzv6IoxJS6JfgC+zVUYCWDZoFVf1zf94HEiveBa+BbI4/1fdyIYKeTgSpo81g=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB5881.eurprd08.prod.outlook.com (2603:10a6:10:208::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 11:09:20 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd%3]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 11:09:20 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH 2/2] arm-autonomy/xenguest-network: add kea dhcp4 configuration
Date: Wed, 28 Oct 2020 12:07:16 +0100
Message-Id: <20201028110716.22544-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028110716.22544-1-kamil.dziezyk@arm.com>
References: <20201028110716.22544-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.22 via Frontend Transport; Wed, 28 Oct 2020 11:09:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2b7a91ea-0963-47c5-54fa-08d87b31ef8b
X-MS-TrafficTypeDiagnostic: DBBPR08MB5881:|AM0PR08MB4436:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB44364CA813E3FD920DEDE52DFD170@AM0PR08MB4436.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zMzNk01JgWr2gXkMYTp6tle29d1i77euDo91MvRzmH+A2SVsy1Ob5F0KauumRiu50poUxH08pu2gtGAHaElOsEBJrmcnqRRx8KEZFUcajnNv4XegdPWCJPEzEmT2X/GoppXrkZp08Q/3Z0xhxMczi9xvWsycBq7/mhC6PNla1xyl/rqggpWiVhCT9KLhf2aVxDd8rKStvpZXIQq6BAm4ZwgkGNXQ1c2Mq8KGe/mGU3ZkMnx2AVrzQtckAtATHL/hQSbk+qoB9wOgMOr4hOCW8fHnnRECmV0G78zjwDhNDvN/Vw2FJqS/wLWqqqfy36qRegXPSfT83G/REfrpzA2aSw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(7696005)(30864003)(52116002)(6486002)(5660300002)(66556008)(66476007)(66946007)(478600001)(44832011)(66574015)(8676002)(2906002)(83380400001)(8936002)(4326008)(36756003)(6666004)(86362001)(2616005)(956004)(316002)(1076003)(6916009)(26005)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Wy3bAAHbdIYDfPm6IlNPAf2XX2ieadUNn0NfKfOu5M1v5p6+4wnkuF6SWD6ZN1Me7OUlQairn0/zYwwfe+4pH440k3WQ5qv6+pEfXIRQRnQaKT5iwDzWeB4slvKlb2nEIx4DcAcZU7kBKc4Amkg91B5PuIb/Ti/R6a5Yc9/YVPtJfZPo58ihVu2DVo5bmJf059gnfmmXQ6EIRB1SJn84UG8oF87ztqnfxLXPmq7ebhbX1my9Ubl6MEH+HaLHV1XeL6pjS93CH8mi9qKYbqJra3gzgwJvO/6VwglsWSUYiTwaC3IPlrPmeF6BX3AzHtkXGgtd3V1fUOvKPL34GoutGJ8CBG29koT15FoZhC51l9QEExkYLVWs82vvDSIfhGJt47yTObAqC+CneQoLUSuUMLWj3HIDYBFGbzIeGre7t0z/opBpplpXUoR7LPx2FG1nOn6jXMb82+0Qgsm7Hicy6Vgr94MucMhtmaQPqsjqnEWpgTceRxC60xiU4dpck9Z9R07/Jcg5RrQ6ppPSfsou/QloQzdw+qNs7yZRssdGccsD6bALt9lZ/L4F1d2snEl+o+O33Lnac6m8IoX1l/dIDfyykktWcoMR08AXB36N3lci3e7RDmykJvMyMHMjl7HYMJa5iKenNS90OfTK70tH/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5881
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2b9a63ae-27dc-4b8c-2996-08d87b31eaec
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Asj0Mz71LMOKHZgMEKKf/RiSU2TsCFN+QSOqS9AwUFh6+FpQiT+UupllNa+qJ1+tRwDfmR75ki4Tl6t5op9na+IdF5QgG5Ca8n0oM0mwCQcU8rRXf/CLEvpwC3Gz2sAZaJF983BpoTFUaAsoZOyWOOzfPzWd7hfzBGs9FGUpMTWl0IXfe0KD9rVdp4UiraUf878h5OFymqWitAxrDBF+aJzli6aymfRedIgHpNkgtF+OOe/uXaFw+H69JQ8wqe/dnXlu6dV5euHHzbzL5VdzxACvVOzrGNXgsPSj25pRk5+HBjPy3T3QCvaI3/WLIAtbjH3VW0258rTetaSJddcYv1qY4M86UVH+xTICgg7lcdo8MSMnt13GKoyu6WFZr7TPY5oxPz6C7ELEpM7KBvAuFw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(956004)(8936002)(47076004)(26005)(82310400003)(2906002)(8676002)(2616005)(66574015)(6666004)(6486002)(36756003)(186003)(478600001)(336012)(16526019)(7696005)(81166007)(30864003)(36906005)(356005)(70206006)(86362001)(70586007)(82740400003)(6916009)(5660300002)(316002)(4326008)(44832011)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 11:09:27.4595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7a91ea-0963-47c5-54fa-08d87b31ef8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4436
Content-Type: text/plain

Since dhcp-server was removed from oe-core layer,
we decided to add kea dhcp support in meta-arm-autonomy.

This patch introduce following changes:
  (*) replaces all configuration and customization valid for dhcpd,
      with kea complatible one.
  (*) replaces dhcp-server rdependency with kea for xenguest-network recipe
  (*) replaces default kea dhcp4 server configuration with a minimal one.

Change-Id: I4202b5b8f3be6801cbb4f9068061eccfdadee5f0
Issue-Id: SCM-1522
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../classes/xenguest-image.bbclass            |   2 +-
 .../documentation/xenguest-network.md         |  24 +++--
 .../0002-vif-nat-fix-symlink-removal.patch    |  45 --------
 .../recipes-extended/xen/xen-tools_%.bbappend |   1 -
 .../xenguest/files/00-vif-xenguest.hook       | 102 ++++++++----------
 .../xenguest/files/dhcpd-params.cfg           |  30 ------
 .../xenguest/files/kea-dhcp4.conf             |  30 ++++++
 .../xenguest/files/kea-restore-default-config |  29 +++++
 .../xenguest/files/kea-subnet4.json           |  35 ++++++
 .../xenguest/files/network-bridge.sh.in       |  10 --
 .../files/xenguest-network-init-post.sh       |  45 ++++++++
 .../xenguest/xenguest-base-image.bb           |   9 +-
 .../xenguest/xenguest-network.bb              |  33 +++++-
 13 files changed, 235 insertions(+), 160 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
 delete mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh

diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
index be1dde5..93f6578 100644
--- a/meta-arm-autonomy/classes/xenguest-image.bbclass
+++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
@@ -62,7 +62,7 @@ XENGUEST_IMAGE_DISK_PARTITIONS ??= "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:rootfs.ta
 # The "bridge" type will share the physical eth interface from dom0 with the
 # domU. This will allow the domU to have access to the external network.
 # The "nat" type will setup a virtual network between dom0 and domU and also
-# configure and run the dhcpd on dom0 to serve the domU.
+# configure and run the kea dhcp4 server on dom0 to serve the domU.
 # The "none" type will not affect any networking setting between on dom0 and
 # domU.
 XENGUEST_IMAGE_NETWORK_TYPE ??= "bridge"
diff --git a/meta-arm-autonomy/documentation/xenguest-network.md b/meta-arm-autonomy/documentation/xenguest-network.md
index b731f3e..dad2698 100644
--- a/meta-arm-autonomy/documentation/xenguest-network.md
+++ b/meta-arm-autonomy/documentation/xenguest-network.md
@@ -12,9 +12,10 @@ At the moment 3 types of network arrangements are provided:
 
 - Bridge: where the guest vif is added to the created bridge interface;
 
-- NAT: where a private subnet is created for the guest, a dhcpd is started on
-  the host to serve the guest and the proper iptables rules are created to
-  allow the guest to access the external network;
+- NAT: where a private subnet is created for the guest,
+  a kea dhcp4 server is started on the host to serve the guest
+  and the proper iptables rules are created
+  to allow the guest to access the external network;
 
 - None: the guest vif is not connected to the bridge.
 
@@ -55,17 +56,20 @@ The following parameters are available:
   contains the dom0 physical interface giving the guest direct access to the
   external network.
   The **nat** type will setup a private network between dom0 and domU, setup
-  the appropriate routing table, configure and run the dhcpd on dom0 to serve
-  the domU and apply the iptables rules to allow the guest to acess the
-  external network. The dhcpd configuration for the guest can be customised by
-  replacing the
-  "meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg" file
-  in a xenguest-network.bbappend. The dhcpd-params.cfg file is installed in
+  the appropriate routing table, configure and run the kea dhcp4 server
+  on dom0 to serve the domU and apply the iptables rules to allow the guest
+  to acess the external network. The kea dhcp4 server configuration for
+  the guest can be customised by replacing the
+  "meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json" file
+  in a xenguest-network.bbappend. The kea-subnet4.json file is installed in
   the xenguest image and copied to
-  "/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg" when the guest
+  "/etc/xenguest/guests/${guestname}/files/kea-subnet4.json" when the guest
   image is created. It will be consumed by the
   "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" script which is called by
   "/etc/xen/scripts/vif-nat" script when starting/stopping the xenguest.
+  After guest start, "/etc/xenguest/init.post/xenguest-network-init-post.sh"
+  script is called to reload kea dhcp4 server with updated configuration,
+  after virtual network interface is ready.
   In the guest project, the NAT port forward can be customised by changing
   the XENGUEST_IMAGE_HOST_PORT (default: "1000 + ${domid}") and
   XENGUEST_IMAGE_GUEST_PORT (default: "22") variables in local.conf or
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
deleted file mode 100644
index bcd5778..0000000
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0002-vif-nat-fix-symlink-removal.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
-
-Copy temp files used to add/remove dhcpd configurations to avoid
-replacing potential symlinks.
-
-Index: git/tools/hotplug/Linux/vif-nat
-===================================================================
---- git.orig/tools/hotplug/Linux/vif-nat
-+++ git/tools/hotplug/Linux/vif-nat
-@@ -99,7 +100,8 @@ dhcparg_remove_entry()
-   then
-     rm "$tmpfile"
-   else
--    mv "$tmpfile" "$dhcpd_arg_file"
-+    cp "$tmpfile" "$dhcpd_arg_file"
-+    rm "$tmpfile"
-   fi
- }
- 
-@@ -109,11 +111,11 @@ dhcparg_add_entry()
-   local tmpfile=$(mktemp)
-   # handle Red Hat, SUSE, and Debian styles, with or without quotes
-   sed -e 's/^DHCPDARGS="*\([^"]*\)"*/DHCPDARGS="\1'"${dev} "'"/' \
--     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
-+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
-   sed -e 's/^DHCPD_INTERFACE="*\([^"]*\)"*/DHCPD_INTERFACE="\1'"${dev} "'"/' \
--     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
-+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
-   sed -e 's/^INTERFACES="*\([^"]*\)"*/INTERFACES="\1'"${dev} "'"/' \
--     "$dhcpd_arg_file" >"$tmpfile" && mv "$tmpfile" "$dhcpd_arg_file"
-+     "$dhcpd_arg_file" >"$tmpfile" && cp "$tmpfile" "$dhcpd_arg_file"
-   rm -f "$tmpfile"
- }
- 
-@@ -125,7 +127,8 @@ dhcp_remove_entry()
-   then
-     rm "$tmpfile"
-   else
--    mv "$tmpfile" "$dhcpd_conf_file"
-+    cp "$tmpfile" "$dhcpd_conf_file"
-+    rm "$tmpfile"
-   fi
-   dhcparg_remove_entry
- }
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
index 45739ff..51e0dfa 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools_%.bbappend
@@ -1,7 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 SRC_URI += "file://0001-vif-nat-fix-hostname.patch \
-            file://0002-vif-nat-fix-symlink-removal.patch \
            "
 
 PACKAGECONFIG_remove = "\
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
index 7a2fb6f..37ecec0 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
@@ -18,6 +18,8 @@
 domid=$(xenstore_read "${XENBUS_PATH}/frontend-id")
 guestname=$(xenstore_read "/local/domain/${domid}/name")
 bridge=$(xenstore_read "${XENBUS_PATH}/bridge")
+mac=$(xenstore_read "$XENBUS_PATH/mac")
+kea_conf_file="/etc/kea/kea-dhcp4.conf"
 
 if [ ! -f /etc/xenguest/guests/${guestname}/params.cfg ]; then
     log debug "No /etc/xenguest/guests/${guestname}/params.cfg. Exiting."
@@ -36,63 +38,48 @@ get_subnet_prefix() {
 
 subnetprefix=$(get_subnet_prefix)
 
-dhcpd_remove_conf_entry()
+kea_remove_conf_entry()
 {
-    local tmpfile=$(mktemp)
-
-    # Remove the the xenguest dhcpd config file inclusion in the dhcpd
-    # main config
-    grep -v "include \"${XENGUEST_DHCPD_CONF_FILE}\";" \
-            "${dhcpd_conf_file}" >"${tmpfile}"
-    if ! diff "${tmpfile}" "${dhcpd_conf_file}" >/dev/null
-    then
-        cp "${tmpfile}" "${dhcpd_conf_file}"
-    fi
-    rm ${tmpfile}
-
-    # Remove the generated the xenguest dhcpd file
-    rm ${XENGUEST_DHCPD_CONF_FILE}
-}
+    log debug "kea_remove_conf_entry"
+    claim_lock "vif-nat-kea"
 
-# This function removes the dhcpd options added by the vif-nat script and
-# adds the user provided options under the ${XENGUEST_DHCPD_HOST_OPTIONS}
-# variable set in "/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg"
-# file.
-dhcpd_add_conf_entries()
-{
-    # We need to remove the previous added entry from vif-nat script
-    dhcp_remove_entry
+    # Remove the the xenguest kea config file inclusion in the kea main config
+    sed -i "/${kea_guest_config//'/'/'\/'}/d" "${kea_conf_file}"
 
-    # Include the xenguest dhcpd config file in the dhcpd main config
-    echo >>"${dhcpd_conf_file}" "include \"${XENGUEST_DHCPD_CONF_FILE}\";"
+    # Remove interface entry 1st case: [ "dev1", "dev_to_remove" ]
+    sed -i "s/,\ \"$dev\"//" "${kea_conf_file}"
+    # Remove interface entry 2nd case: [ "dev_to_remove", "dev1" ]
+    sed -i "s/\"$dev\",\ //" "${kea_conf_file}"
+    # Remove interface entry 3rd case: [ "dev_to_remove" ]
+    sed -i "s/\[\ \"$dev\"\ \]/\[\ \]/" "${kea_conf_file}"
 
-    # Generate the xenguest dhcpd file
-    echo -e "$(eval "echo -e \"$(cat ${XENGUEST_DHCPD_PARAMS_FILE})\"")" \
-            >> "${XENGUEST_DHCPD_CONF_FILE}"
+    # Remove the generated the xenguest kea subnet conf file
+    rm ${XENGUEST_KEA_SUBNET_CONFIG}
 
-    # Re-add the dhcpargs entries removed by dhcp_remove_entry call
-    dhcparg_add_entry
-}
+    keactrl reload
 
-dhcpd_online(){
-    log debug "dhcpd_online"
-    claim_lock "vif-nat-dhcp"
-    dhcpd_add_conf_entries
-    release_lock "vif-nat-dhcp"
-   "$dhcpd_init_file" restart || true
+    release_lock "vif-nat-kea"
 }
 
-dhcpd_offline(){
-    log debug "dhcpd_offline"
-    claim_lock "vif-nat-dhcp"
-    dhcpd_remove_conf_entry
-    release_lock "vif-nat-dhcp"
-    "$dhcpd_init_file" restart || true # We need to ignore failure because
-                                       # ISC dhcpd 3 borks if there is nothing
-                                       # for it to do, which is the case if
-                                       # the outgoing interface is not
-                                       # configured to offer leases and there
-                                       # are no vifs.
+kea_add_conf_entries()
+{
+    log debug "kea_add_conf_entries"
+    claim_lock "vif-nat-kea"
+
+    # Include vif in the interfaces 1st case - no other entries:
+    search_for='\"interfaces\": \[ '
+    sed -i "/${search_for}\"*\"\ */ s/\ \]/,\ \"${dev}\"\ \]/g" "${kea_conf_file}"
+    sed -i "s/${search_for}]/${search_for}\"${dev}\"\ \]/g" "${kea_conf_file}"
+
+    # Include the xenguest kea subnet conf file in the kea main config
+    search_for='\"subnet4\": \['
+    sed -i "/$search_for/a $kea_guest_config" "${kea_conf_file}"
+
+    # Generate the xenguest kea subnet conf file
+    echo -e "$(eval "echo -e \"$(cat ${XENGUEST_KEA_SUBNET_TEMPLATE})\"")" \
+            > "${XENGUEST_KEA_SUBNET_CONFIG}"
+
+    release_lock "vif-nat-kea"
 }
 
 call_extra_hooks() {
@@ -111,24 +98,29 @@ call_extra_hooks() {
 
 case "${XENGUEST_NETWORK_TYPE}" in
     nat)
-        XENGUEST_DHCPD_PARAMS_FILE=${XENGUEST_DHCPD_PARAMS_FILE:-"/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg"}
-        if [ ! -f ${XENGUEST_DHCPD_PARAMS_FILE} ]; then
-            log debug "No ${XENGUEST_DHCPD_PARAMS_FILE} file. Aborting"
+        XENGUEST_KEA_SUBNET_TEMPLATE=${XENGUEST_KEA_SUBNET_TEMPLATE:-"/etc/xenguest/guests/${guestname}/files/kea-subnet4.json"}
+        if [ ! -f ${XENGUEST_KEA_SUBNET_TEMPLATE} ]; then
+            log debug "No ${XENGUEST_KEA_SUBNET_TEMPLATE} file. Aborting"
             return
         fi
 
-        XENGUEST_DHCPD_CONF_FILE="/etc/dhcp/dhcpd.dom$domid.conf"
+        XENGUEST_KEA_SUBNET_CONFIG="/etc/kea/kea-subnet4.dom$domid.json"
+        if [ ! -d "$(dirname ${XENGUEST_KEA_SUBNET_CONFIG})" ]; then
+            log debug "No kea configuration directory. Aborting"
+            return
+        fi
+        kea_guest_config="\ \ \ \ <?include \"${XENGUEST_KEA_SUBNET_CONFIG}\"?>"
 
         case "$command" in
             online)
-                dhcpd_online
+                kea_add_conf_entries
 
                 # Enable ip forwarding and NAT for the ${bridge} interface
                 sysctl -w net.ipv4.ip_forward=1
                 iptables_w -t nat -A POSTROUTING -o ${bridge} -j MASQUERADE -m comment --comment "dom${domid}"
                 ;;
             offline)
-                dhcpd_offline
+                kea_remove_conf_entry
 
                 # Remove the NAT iptables rules created for the dom${domid}
                 guest_ipt_rule=$(iptables_w -t nat -vL POSTROUTING -n --line-number | grep -w dom${domid} | awk '{print $1}' | tac)
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg b/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
deleted file mode 100644
index 0495fbd..0000000
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
+++ /dev/null
@@ -1,30 +0,0 @@
-# This file holds the guest dhcpd options running on Dom0.
-# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the end of
-# the vif-nat script will use this file to generate the final dhcpd
-# configuration.
-
-# This file is added in the xenguest image and installed in dom0 under
-# /etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg when the guest
-# image is created.
-# Any customizations to it should be performed by replacing it via a bbappend.
-
-# The \${hostname}, \${mac}, \${vif_ip} and \${router_ip} variables are set in
-# the vif-nat script context. The \${subnetprefix} variable is set in the
-# 00-vif-xenguest.hook script context.
-
-# The "subnet" configuration node is mandatory in order to have the dhcpd
-# properly running.
-
-host ${hostname} {
-    hardware ethernet ${mac};
-    fixed-address ${vif_ip};
-    option routers ${router_ip};
-    option subnet-mask 255.255.255.0;
-    option broadcast-address ${subnetprefix}.255;
-    option domain-name-servers 8.8.8.8;
-    option host-name \"${hostname}\";
-    option domain-name \"example.com\";
-}
-
-subnet ${subnetprefix}.0 netmask 255.255.255.0 {
-}
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
new file mode 100644
index 0000000..0a1cc6a
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-dhcp4.conf
@@ -0,0 +1,30 @@
+# This file holds the minimal kea dhcp4 server configuration.
+# It replaces existing kea dhcp configuration file via
+# "/etc/init.d/kea-restore-default-config" on every system boot.
+# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the end of
+# the vif-nat script will append each xenguest configuration to this file,
+# to generate the final dhcp configuration.
+# This file can be replaced with xenguest-network.bbappend.
+{
+"Dhcp4": {
+    "interfaces-config": {
+        "interfaces": [ ]
+    },
+    "lease-database": {
+        "type": "memfile",
+        "persist": false
+    },
+    "subnet4": [
+        {
+            "subnet": "192.0.2.0/24"
+        }
+    ],
+    "loggers": [
+        {
+            "name": "kea-dhcp4",
+            "output_options": [ { "output": "/var/log/kea-dhcp4.log" } ],
+            "severity": "INFO"
+        }
+    ]
+}
+}
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config
new file mode 100755
index 0000000..424fd0a
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config
@@ -0,0 +1,29 @@
+#!/bin/sh
+#
+# Xenguest Restore default kea dhcp4 configuration
+# This script restores a dhcp4 server configuration, to prevent
+# kea startup failures after random board hangs or powercuts.
+#
+
+case "$1" in
+  start)
+        ret=$(keactrl status | grep -i "dhcpv4 server" | cut -d ' ' -f 3)
+        if [ "$ret" = "active" ]; then
+            echo "WARNING: cowardly refusing to replace dhcp4 configuration"
+            echo "kea dhcp4 server is up and running!"
+        else
+            echo "Resetting kea dhcp4 configuration."
+            cp -f /etc/kea/kea-dhcp4.conf.original /etc/kea/kea-dhcp4.conf
+        fi
+        ;;
+  status|stop|reload|force-reload|restart)
+        true
+        ;;
+  *)
+        # do not advertise unreasonable commands that there is no reason
+        # to use with this device
+        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
+        exit 1
+esac
+
+exit $?
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
new file mode 100644
index 0000000..9dacbb1
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-subnet4.json
@@ -0,0 +1,35 @@
+# This file holds the guest kea dhcp4 server options running on Dom0.
+# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the end of
+# the vif-nat script will use this file to generate the final dhcp
+# configuration.
+
+# This file is added in the xenguest image and installed in dom0 under
+# /etc/xenguest/guests/${guestname}/files/kea-subnet4.json when the guest
+# image is created.
+# Any customizations to it should be performed by replacing it via a bbappend.
+
+# The \${vif_ip} and \${router_ip} variables are set in
+# the vif-nat script context. The \${subnetprefix} and \${mac} variable are set in the
+# 00-vif-xenguest.hook script context.
+
+# The "subnet" configuration node is mandatory in order to have the dhcp
+# properly running.
+        {
+            \"subnet\": \"${subnetprefix}.0/24\",
+            \"option-data\": [
+                {
+                    \"name\": \"routers\",
+                    \"data\": \"${router_ip}\"
+                },
+                {
+                    \"name\": \"domain-name-servers\",
+                    \"data\": \"8.8.8.8, 8.8.4.4\"
+                }
+            ],
+            \"reservations\": [
+                {
+                    \"hw-address\": \"${mac}\",
+                    \"ip-address\": \"${vif_ip}\"
+                }
+            ]
+        },
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
index 27306e4..46d230e 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
@@ -10,16 +10,6 @@ BRIDGE_NAME="###BRIDGE_NAME###"
 
 case "${XENGUEST_NETWORK_TYPE:-}" in
     nat)
-        # Create the symlinks for the files that vif-nat script expects
-        if [ ! -f /etc/dhcpd.conf ]; then
-            ln -s dhcp/dhcpd.conf /etc/dhcpd.conf
-        fi
-        if [ ! -f /etc/init.d/dhcp3-server ]; then
-            ln -s dhcp-server /etc/init.d/dhcp3-server
-        fi
-        if [ ! -f /etc/default/dhcp3-server ]; then
-            ln -s dhcp-server /etc/default/dhcp3-server
-        fi
         echo "vif = ['script=vif-nat']" >> ${guestcfgfile}
         ;;
     bridge)
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
new file mode 100755
index 0000000..aa43ce8
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+# This script is to reload kea dhcp4 server when guest interface will be ready
+
+# include locking functions
+. /etc/xen/scripts/locking.sh
+set +u
+
+# $1 is vif name, e.g. "vif/15/0"
+# returns 0 on success,
+# 1 otherwize
+#
+
+check_if_vif_is_ready() {
+    ret=($(xl network-list "${guestname}" | grep  "${1}"))
+    # ${ret[4]} is network interface status value
+    # 1 means vif is not ready
+    # 4 means vif is ready
+    [ "${ret[4]}" = "4" ] && return 0
+    return 1
+}
+
+case "${XENGUEST_NETWORK_TYPE:-}" in
+    nat)
+        vif_name="$(xl network-list ${guestname} | grep -o vif.*)"
+
+        for try in {1..20}
+        do
+            if check_if_vif_is_ready "${vif_name}"; then
+                claim_lock "vif-nat-kea"
+                keactrl reload
+                release_lock "vif-nat-kea"
+                exit 0
+            fi
+            echo "Waiting for ${vif_name} - network interface is not ready..."\
+                 " try #${try}" >> "${LOGFILE}" 2>&1
+            sleep 1
+        done
+        echo "ERROR: Failed to get ${vif_name} "\
+             "network interface ready!" >> "${LOGFILE}" 2>&1
+        exit 1
+        ;;
+    *)
+        echo "No action needed" >> "${LOGFILE}" 2>&1
+        ;;
+esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
index d164a81..4cc96aa 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
@@ -47,12 +47,13 @@ XENGUEST_IMAGE_SRC_URI_DISK_FILES ??= ""
 # Add xen files
 # Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XEN_FILES should
 # be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES_append.
-# The dhcpd-params.cfg holds the dhcpd configuration for Dom0. And it is used
-# when XENGUEST_IMAGE_NETWORK_TYPE="nat". Any customizations to it should be
-# performed by replacing it via a xenguest-network.bbappend.
+# The kea-subnet4.json holds the kea dhcp4 subnet configuration for Dom0.
+# And it is used when XENGUEST_IMAGE_NETWORK_TYPE="nat".
+# Any customizations to it should be performed by replacing it
+# via a xenguest-network.bbappend.
 # The XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT file is only added if the
 # variable is set.
-XENGUEST_IMAGE_SRC_URI_XEN_FILES = "file://dhcpd-params.cfg \
+XENGUEST_IMAGE_SRC_URI_XEN_FILES = "file://kea-subnet4.json \
     ${@ "file://" + d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') \
       if d.getVar('XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT') else "" } \
     "
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index 6442687..d0517b6 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -21,12 +21,22 @@ SRC_URI = " \
     file://xenguest-network-bridge-dhcp.cfg.in \
     file://network-bridge.sh.in \
     file://00-vif-xenguest.hook \
+    file://xenguest-network-init-post.sh \
+    file://kea-dhcp4.conf \
+    file://kea-restore-default-config \
     "
+PACKAGES =+ "${PN}-kea-dhcp4"
 
 # Bridge configurator needs to run before S01networking init script
 # Prefix with a_ to make sure it is executed in runlevel 01 before others
-INITSCRIPT_NAME = "a_xenguest-network-bridge"
-INITSCRIPT_PARAMS = "defaults 01"
+INITSCRIPT_PACKAGES = "${PN} ${PN}-kea-dhcp4"
+INITSCRIPT_NAME_${PN} = "a_xenguest-network-bridge"
+INITSCRIPT_PARAMS_${PN} = "defaults 01"
+
+# Kea configuration needs to be restored before kea init scripts:
+# Kea dhcp4 server is 30, so lets use 20, to have higher priority
+INITSCRIPT_NAME_${PN}-kea-dhcp4 = "kea-restore-default-config"
+INITSCRIPT_PARAMS_${PN}-kea-dhcp4 = "defaults 20"
 
 inherit update-rc.d
 
@@ -43,7 +53,7 @@ do_install() {
        > ${WORKDIR}/network-bridge.sh
     install -d -m 755 ${D}${sysconfdir}/init.d
     install -m 755 ${WORKDIR}/xenguest-network-bridge \
-        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+        ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}}
     install -d -m 755 ${D}${sysconfdir}/network/interfaces.d
     install -m 755 ${WORKDIR}/xenguest-network-bridge.cfg \
         ${D}${sysconfdir}/network/interfaces.d/.
@@ -54,11 +64,22 @@ do_install() {
     install -d ${D}${sysconfdir}/xen/scripts/vif-post.d
     install -m 755 ${WORKDIR}/00-vif-xenguest.hook \
         ${D}${sysconfdir}/xen/scripts/vif-post.d/.
+
+    install -d -m 755 ${D}${sysconfdir}/xenguest/init.post
+    install -m 755 ${WORKDIR}/xenguest-network-init-post.sh \
+        ${D}${sysconfdir}/xenguest/init.post/.
+
+    install -m 755 ${WORKDIR}/kea-restore-default-config \
+        ${D}${sysconfdir}/init.d/.
+    install -d -m 755 ${D}${sysconfdir}/kea/
+    install -m 755 ${WORKDIR}/kea-dhcp4.conf \
+        ${D}${sysconfdir}/kea/kea-dhcp4.conf.original
 }
 
 RDEPENDS_${PN} += "bridge-utils \
                    iptables \
-                   dhcp-server \
+                   kea \
+                   ${PN}-kea-dhcp4 \
                    kernel-module-xt-tcpudp \
                    kernel-module-xt-physdev \
                    kernel-module-xt-comment \
@@ -68,3 +89,7 @@ RDEPENDS_${PN} += "bridge-utils \
 FILES_${PN} += "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
 FILES_${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
 FILES_${PN} += "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hook"
+
+FILES_${PN}-kea-dhcp4 = "${sysconfdir}/kea/kea-dhcp4.conf.original"
+FILES_${PN}-kea-dhcp4 += "${sysconfdir}/init.d/${INITSCRIPT_NAME_${PN}-kea-dhcp4}"
+FILES_${PN}-kea-dhcp4 += "${sysconfdir}/xenguest/init.post/xenguest-network-init-post.sh"
-- 
2.17.1

