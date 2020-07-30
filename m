Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.62])
 by mx.groups.io with SMTP id smtpd.web12.11385.1596124350676911075
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bXPiCnwU;
 spf=pass (domain: arm.com, ip: 40.107.4.62, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3zzqKZ0Kh6S0iWGBQ8gtQGjWP/FUJbDI/TOyC42gL4=;
 b=bXPiCnwUa+cvZGIGyCL00AzKCJL45XxB6Yp6IWWFXCj3rGjXWzs//1dW9wcrg++Wcsp/lV4H1shyrHxlVbJSB1TA0xdIPPaZKaeL32o3lkDLVlHOl3D6FXSSoeDfsDhFm6f8YEmu6g3GUcA/7BZ0tngfow6H16ffhER8uHfiLWc=
Received: from AM6PR08CA0026.eurprd08.prod.outlook.com (2603:10a6:20b:c0::14)
 by AM0PR08MB3044.eurprd08.prod.outlook.com (2603:10a6:208:5a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 30 Jul
 2020 15:52:27 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::de) by AM6PR08CA0026.outlook.office365.com
 (2603:10a6:20b:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:52:27 +0000
Received: ("Tessian outbound 2ae7cfbcc26c:v62"); Thu, 30 Jul 2020 15:52:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63be09a86b8a6238
X-CR-MTA-TID: 64aa7808
Received: from e31020da66d9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9871C15E-395B-465B-87C7-79451522E1A1.1;
	Thu, 30 Jul 2020 15:52:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e31020da66d9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9uLtlvfhtzdLiLBG2ZzZlFBs+a6xSDSpDW6x9U7wynH0KR0mzU5q/PL4eCQp492g1UlfGkElUMibLJFG5zHtd4ivdDRMRTPFEi1jD7hP9y/Q7E/5Fl2Le7Bb9u48bI0AVJUHjDBzxFWx+a+IJPiWMmbRR8ZFOxrGkYu3tDgl+0EEtt4qeGujag5ZVg/nzqbmu4hHDJpOqakiJBv4DvK77EcB8c1I8IgwhGJPX4UpVqQJwbR8DTuhblQixpJefltSfl7S47JoJPqSxlN1pRB0tdYIkdUMgHLiV+iuT3OweVhwvK0Jo9Z6j5aCTklIBledcU4UdGDKgExhAPBHqKUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3zzqKZ0Kh6S0iWGBQ8gtQGjWP/FUJbDI/TOyC42gL4=;
 b=lMHr5LeZLf2tprHgptAgjKeGSsO3rigR8K1BacJOzYzJYI/7d++bzwhSq6ko/CdElvQlTTgy6TDFeTcDfO1WhcM4DyF40uKPMHHyZZblWmFjSK3z19vO/w1jE8fCgkWP7bURPDxqjXCQ/VZg1ZU3sGLfHNZlex1gElH8S8ZV3DqEBMDw5147aUvSaWZ/zamvZrH7xjrZDC9QVu78bddQGNoXqgWGvghc2b9OdFVC6zMLxFrSpUpYZ4rs9xl7KV1a1ml6OpC8iKff29XKTHug9oajk9FSohtLsWB2/Y3X2uRgM/jddAbOO6weVxdZUbkbfno7+qz5CMQgUt06tlZQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3zzqKZ0Kh6S0iWGBQ8gtQGjWP/FUJbDI/TOyC42gL4=;
 b=bXPiCnwUa+cvZGIGyCL00AzKCJL45XxB6Yp6IWWFXCj3rGjXWzs//1dW9wcrg++Wcsp/lV4H1shyrHxlVbJSB1TA0xdIPPaZKaeL32o3lkDLVlHOl3D6FXSSoeDfsDhFm6f8YEmu6g3GUcA/7BZ0tngfow6H16ffhER8uHfiLWc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 15:52:20 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 15:52:20 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] arm-autonomy/xenguest-network: Add private network support for xenguest
Date: Thu, 30 Jul 2020 16:52:17 +0100
Message-Id: <1596124338-106961-3-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::33) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.18 via Frontend Transport; Thu, 30 Jul 2020 15:52:20 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75490c24-120f-4f93-da56-08d834a08f38
X-MS-TrafficTypeDiagnostic: AM0PR08MB5425:|AM0PR08MB3044:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3044779E50B81FCB735733A492710@AM0PR08MB3044.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7H7sLTD2VrYuJFm2hkHd5rFEaw3O7sWNwq6xOLfUzPFvyyreLe5wj7dXrrIWL2MXjnpfNNNpahVCXAsepNMSpCxTF2zDrqeskzcoiPl5r+5vZ1dR8bCDHZC0nAwwTB9YMUN8uqdJWvOb5OdXAzmlHkKLOmzbt1oI5StyOAyHJTSRpm5CH//iHWu+125oAqkQ8FrkBsMyszVMmEsyx7VjILWrL7zudaYmt/PxcYd/o5HUoju+bNX64Yl5GJY8vD03fGmeTJRKyfH7HcS04+E10Eij/SfEQvcEsnON+jB9TfsnCyaBJJ0sxhDT7BdAwkK00qeiHhZWWqv5XGbum4HbKg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(66946007)(66556008)(2906002)(8676002)(316002)(478600001)(8936002)(956004)(16526019)(6486002)(26005)(30864003)(6666004)(2616005)(36756003)(186003)(66476007)(52116002)(83380400001)(6916009)(4326008)(5660300002)(44832011)(66574015)(86362001)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 5gBx9eQlrDRFKQL2Fs45Y2rTh7TA0WaZV1qWfxiMwwGfJXge7BNLV9d44x14isiZ37pF/MZGbqBpS/+u5hTJ7XdDo9yKKdJC9+PY3++IHHYl63MYdTeUB8EQyTiU0wMjTXfmcShD+wxvgb8oL9AfDN/O1ZqUiwf6QOh8AiTNVVkZpy56OfVQhpzo+M0rghAHexjKAZzx/otkIRi+/7sWkP+AikKpribSEBimXNCfQDPxyhh7Qp8gQCjPhpCSr1IQl8oc5acXp9ZEN9jf2JUF4hCTVzs/8zb/XXGb/hRq29I0/gPlb07oex+/tIZemh2TLLAA3KQhzseAIpLFg6zIcMTwGxR9M5HGxUuI7mMguWZzfi/p+26mheqNoqmUYVz9PqrgvzlTX0KIoeo+YrGu+QGGd7esD/UShoduojJjA6tqe925cBp7H/VDmBvDNZOjujTS4eNGbrhhsGJhgITpBoCsBWzCjCaHWN9kpWqlvjkgS+LuF3YRS0YtTOLrB9py5ezdgeJQ2iOMddwyXNDXv62zRIryNDp0uDarFJB42aGRmUkp5cM+BNLn3pdKjCT9BBUmMoGtM18H67VYtnMcphHzzrQ5lZ55uTT/ChnEIIP5HOAYPxMVJW44BkVK8MtcfmUxvbhwMDTGZG3jE/Yknw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7e49eab6-ac0f-48f2-301a-08d834a08ada
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l/Av1g5yqJhhMf3YctUsE8pyB2KUIjldu9M2NIbWfV3/eDDKvJLjL2cnskCUn6Pks4NEFGKop7oKXLxe4XsVofX8t9rUv6kTVYFAKdn1Ga66OF5wU0LCgfV1m3TzgO6IajNJGhLghoJ3FkYOkYARUhzIIn/lFMQR9rv0ThyEKJFQHZuk6aC9N6XR4NhR4zzS4cVe/WbC6os8KQXki9lmVxa2RWfrJ93IfiRuFglTFDoxH4g/li1EEpOp8EejqR1pX1DPuEplsYB6Wlar5k0gTB+DyO8yFt6GJgNx09j5Iog3v2lu01csageBJ17NWSR7A3j+Dl5fTq8f0Lh6/b5AYV0YZkO8jhXJEQfKL4a15TtqKh/QafYbiksyAtdN2nCCZmLh1Dh2OAl3cML9MG2JQQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(70206006)(4326008)(66574015)(44832011)(8936002)(956004)(6916009)(7696005)(70586007)(336012)(6666004)(2616005)(2906002)(5660300002)(47076004)(81166007)(6486002)(83380400001)(186003)(8676002)(356005)(30864003)(26005)(316002)(82740400003)(82310400002)(478600001)(86362001)(36906005)(36756003)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:52:27.4431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75490c24-120f-4f93-da56-08d834a08f38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3044
Content-Type: text/plain

Introduce the private/internal network support for xenguest by using NAT
and applying the proper iptables rules to allow the guest to have access
to the external network.

The XENGUEST_NETWORK_TYPE variable was introduced to allow the user to
setup the xenguest network type between "bridge" (default), "nat" and
"none".

Change-Id: I919e5b0fd0809093698b9dec3a9503b598b54828
Issue-Id: SCM-1019
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/classes/xenguest-image.bbclass   |  18 +--
 .../documentation/xenguest-network-bridge.md       |  49 --------
 .../documentation/xenguest-network.md              |  70 +++++++++++
 ...k-bridge.bbappend => xenguest-network.bbappend} |   0
 .../images/arm-autonomy-host-image-minimal.bb      |   2 +-
 .../xenguest/files/00-vif-xenguest.hook            | 130 +++++++++++++++++++++
 .../xenguest/files/dhcpd-params.cfg                |  30 +++++
 .../xenguest/files/network-bridge.sh.in            |  25 +++-
 .../xenguest/xenguest-base-image.bb                |   7 +-
 ...guest-network-bridge.bb => xenguest-network.bb} |  16 ++-
 10 files changed, 283 insertions(+), 64 deletions(-)
 delete mode 100644 meta-arm-autonomy/documentation/xenguest-network-bridge.md
 create mode 100644 meta-arm-autonomy/documentation/xenguest-network.md
 rename meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/{xenguest-network-bridge.bbappend => xenguest-network.bbappend} (100%)
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
 rename meta-arm-autonomy/recipes-extended/xenguest/{xenguest-network-bridge.bb => xenguest-network.bb} (79%)

diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
index e8880f3..be1dde5 100644
--- a/meta-arm-autonomy/classes/xenguest-image.bbclass
+++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
@@ -58,10 +58,14 @@ XENGUEST_IMAGE_DISK_SIZE ??= "${@ '4' if not d.getVar('INITRAMFS_IMAGE') else '0
 # and containing the root filesystem produced by Yocto
 XENGUEST_IMAGE_DISK_PARTITIONS ??= "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:rootfs.tar.gz"
 
-# XENGUEST_IMAGE_NETWORK_BRIDGE can be set to 1 to have a network interface
-# on the guest connected to host bridged network. This will provide the guest
-# with a network interface connected directly to the external network
-XENGUEST_IMAGE_NETWORK_BRIDGE ??= "1"
+# XENGUEST_IMAGE_NETWORK_TYPE can be set to "bridge", "nat" or "none".
+# The "bridge" type will share the physical eth interface from dom0 with the
+# domU. This will allow the domU to have access to the external network.
+# The "nat" type will setup a virtual network between dom0 and domU and also
+# configure and run the dhcpd on dom0 to serve the domU.
+# The "none" type will not affect any networking setting between on dom0 and
+# domU.
+XENGUEST_IMAGE_NETWORK_TYPE ??= "bridge"
 
 # Sub-directory in wich the guest is created. This is create in deploy as a
 # subdirectory and must be coherent between all components using this class so
@@ -147,10 +151,10 @@ xenguest_image_create() {
         call_xenguest_mkimage update --set-param=GUEST_AUTOBOOT=0
     fi
 
-    if [ "${XENGUEST_IMAGE_NETWORK_BRIDGE}" = "1" ]; then
-        call_xenguest_mkimage update --set-param=NETWORK_BRIDGE=1
+    if [ -n "${XENGUEST_IMAGE_NETWORK_TYPE}" ]; then
+        call_xenguest_mkimage update --set-param=XENGUEST_NETWORK_TYPE="${XENGUEST_IMAGE_NETWORK_TYPE}"
     else
-        call_xenguest_mkimage update --set-param=NETWORK_BRIDGE=0
+        call_xenguest_mkimage update --set-param=XENGUEST_NETWORK_TYPE="none"
     fi
 }
 
diff --git a/meta-arm-autonomy/documentation/xenguest-network-bridge.md b/meta-arm-autonomy/documentation/xenguest-network-bridge.md
deleted file mode 100644
index 6653fe8..0000000
--- a/meta-arm-autonomy/documentation/xenguest-network-bridge.md
+++ /dev/null
@@ -1,49 +0,0 @@
-xenguest network bridge
-=======================
-
-Introduction
-------------
-
-xenguest-network-bridge is creating a network bridge to allow some guests to
-have a direct connection to the external network.
-To do this, a bridge is created on the host using brctl with the network
-interfaces added to it so that the bridge is connected to the external network.
-It is also adding a guest init script which will, for guests configured to use
-it, create a virtual network interface for the guest and connect it to the
-network bridge on the host.
-
-Usage
------
-
-On the host the package xenguest-network-bridge must be included in your image.
-
-On the xenguest image of your guest, the parameter NETWORK_BRIDGE must be set
-to 1 (using xenguest-mkimage --set-param=NETWORK_BRIDGE=1).
-
-Bitbake parameters
-------------------
-Several parameters are available to configure the xenguest network bridge
-during Yocto project compilation (those can be set in your project local.conf,
-for example).
-
-The following parameters are available:
-
-- XENGUEST_NETWORK_BRIDGE_NAME: This variable defines the name of the network
-  bridge that is created on the host during init.
-  This is set by default to "xenbr0".
-
-- XENGUEST_NETWORK_BRIDGE_MEMBERS: This variable defines the list of network
-  interfaces that are added to the bridge when it is created on the host during
-  init.
-  This is set by default to "eth0".
-
-- XENGUEST_NETWORK_BRIDGE_CONFIG: This variable defines the configuration file
-  to use to configure the bridge network. By default it points to have file
-  configuring the network using dhcp.
-  You can provide a different file using a bbappend and make this variable
-  point to it if you want to customize your network configuration.
-
-- XENGUEST_IMAGE_NETWORK_BRIDGE: This variable can be set to 0 or 1 on guest
-  projects to enable or not the connection of the guest to the host bridge.
-  This is set by default to "1".
-
diff --git a/meta-arm-autonomy/documentation/xenguest-network.md b/meta-arm-autonomy/documentation/xenguest-network.md
new file mode 100644
index 0000000..c61a11a
--- /dev/null
+++ b/meta-arm-autonomy/documentation/xenguest-network.md
@@ -0,0 +1,70 @@
+Xenguest Network
+================
+
+Introduction
+------------
+
+The xenguest-network package is primarly creating a network bridge to share
+the host eth physical interfaces with the guests virtual interfaces (vif).
+This way the guests can have access to the external network.
+
+At the moment 3 types of network arrangements are provided:
+
+- Bridge: where the guest vif is added to the created bridge interface;
+
+- NAT: where a private subnet is created for the guest, a dhcpd is started on
+  the host to serve the guest and the proper iptables rules are created to
+  allow the guest to access the external network;
+
+- None: the guest vif is not connected to the bridge.
+
+Usage
+-----
+
+On the host project the package xenguest-network must be included in your
+image, and on the guest project the XENGUEST_NETWORK_TYPE needs to be set to
+"bridge", "nat" or "none".
+
+Bitbake parameters
+------------------
+
+Several parameters are available to configure the xenguest network bridge
+during Yocto project compilation (those can be set in your project local.conf
+or xenguest-network.bbappend, for example).
+
+The following parameters are available:
+
+- XENGUEST_NETWORK_BRIDGE_NAME: This variable defines the name of the network
+  bridge that is created on the host during init.
+  This is set by default to "xenbr0".
+
+- XENGUEST_NETWORK_BRIDGE_MEMBERS: This variable defines the list of the
+  physical network interfaces that are added to the bridge when it is created
+  on the host during init.
+  By default no physical interfaces are added.
+
+- XENGUEST_NETWORK_BRIDGE_CONFIG: This variable defines the configuration file
+  to use to configure the bridge network. By default it points to have file
+  configuring the network using dhcp.
+  You can provide a different file using a bbappend and make this variable
+  point to it if you want to customize your network configuration.
+
+- XENGUEST_IMAGE_NETWORK_TYPE: This variable can be set to "bridge" (default),
+  "nat" or "none".
+  The **bridge** type will add the domU vif interface to a bridge which also
+  contains the dom0 physical interface giving the guest direct access to the
+  external network.
+  The **nat** type will setup a private network between dom0 and domU, setup
+  the appropriate routing table, configure and run the dhcpd on dom0 to serve
+  the domU and apply the iptables rules to allow the guest to acess the
+  external network. The dhcpd configuration for the guest can be customised by
+  replacing the
+  "meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg" file
+  in a xenguest-network.bbappend. The dhcpd-params.cfg file is installed in
+  the xenguest image and copied to
+  "/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg" when the guest
+  image is created. It will be consumed by the
+  "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" script which is called by
+  "/etc/xen/scripts/vif-nat" script when starting/stopping the xenguest.
+  The **none** type will not affect any networking setting between on dom0 and
+  domU.
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 9731c7c..188e31d 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -41,7 +41,7 @@ IMAGE_INSTALL += " \
     packagegroup-core-ssh-openssh \
     qemu-system-i386 \
     xenguest-manager \
-    xenguest-network-bridge \
+    xenguest-network \
     "
 
 # Build xen binary
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
new file mode 100755
index 0000000..32d5976
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/00-vif-xenguest.hook
@@ -0,0 +1,130 @@
+#============================================================================
+# ${XEN_SCRIPT_DIR}/vif-post.d/00-vif-xenguest.hook
+#
+# Script for performing local configuration of a vif.
+# This script will be sourced by, e.g., vif-bridge after the hotplugging
+# system calls vif-bridge. The script is here and not simply executed as
+# a udev rule because this allows simple access to several environment
+# variables set by the calling vif-* script.
+#
+# Environment vars:
+# command     (add|remove|online|offline)
+# dev         vif interface name (required).
+# main_ip     IP address of Dom0
+# ip          list of IP networks for the vif, space-separated
+# XENBUS_PATH path to this device's details in the XenStore (required).
+#============================================================================
+
+domid=$(xenstore_read "${XENBUS_PATH}/frontend-id")
+guestname=$(xenstore_read "/local/domain/${domid}/name")
+bridge=$(xenstore_read "${XENBUS_PATH}/bridge")
+
+if [ ! -f /etc/xenguest/guests/${guestname}/params.cfg ]; then
+    log debug "No /etc/xenguest/guests/${guestname}/params.cfg. Exiting."
+    return
+fi
+
+# Source the params file to get the choosen XENGUEST_NETWORK_TYPE
+. /etc/xenguest/guests/${guestname}/params.cfg
+
+# We need to get the xenguest subnet prefix to set the subnet and
+# the fixed ip to assing to the guest.
+get_subnet_prefix() {
+    # ${vif_ip} is set in the vif-nat script
+    echo ${vif_ip} | awk -F. '{print $1"."$2"."$3}'
+}
+
+subnetprefix=$(get_subnet_prefix)
+
+dhcpd_remove_conf_entry()
+{
+    local tmpfile=$(mktemp)
+
+    # Remove the the xenguest dhcpd config file inclusion in the dhcpd
+    # main config
+    grep -v "include \"${XENGUEST_DHCPD_CONF_FILE}\";" \
+            "${dhcpd_conf_file}" >"${tmpfile}"
+    if ! diff "${tmpfile}" "${dhcpd_conf_file}" >/dev/null
+    then
+        cp "${tmpfile}" "${dhcpd_conf_file}"
+    fi
+    rm ${tmpfile}
+
+    # Remove the generated the xenguest dhcpd file
+    rm ${XENGUEST_DHCPD_CONF_FILE}
+}
+
+# This function removes the dhcpd options added by the vif-nat script and
+# adds the user provided options under the ${XENGUEST_DHCPD_HOST_OPTIONS}
+# variable set in "/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg"
+# file.
+dhcpd_add_conf_entries()
+{
+    # We need to remove the previous added entry from vif-nat script
+    dhcp_remove_entry
+
+    # Include the xenguest dhcpd config file in the dhcpd main config
+    echo >>"${dhcpd_conf_file}" "include \"${XENGUEST_DHCPD_CONF_FILE}\";"
+
+    # Generate the xenguest dhcpd file
+    echo -e "$(eval "echo -e \"$(cat ${XENGUEST_DHCPD_PARAMS_FILE})\"")" \
+            >> "${XENGUEST_DHCPD_CONF_FILE}"
+
+    # Re-add the dhcpargs entries removed by dhcp_remove_entry call
+    dhcparg_add_entry
+}
+
+dhcpd_online(){
+    log debug "dhcpd_online"
+    claim_lock "vif-nat-dhcp"
+    dhcpd_add_conf_entries
+    release_lock "vif-nat-dhcp"
+   "$dhcpd_init_file" restart || true
+}
+
+dhcpd_offline(){
+    log debug "dhcpd_offline"
+    claim_lock "vif-nat-dhcp"
+    dhcpd_remove_conf_entry
+    release_lock "vif-nat-dhcp"
+    "$dhcpd_init_file" restart || true # We need to ignore failure because
+                                       # ISC dhcpd 3 borks if there is nothing
+                                       # for it to do, which is the case if
+                                       # the outgoing interface is not
+                                       # configured to offer leases and there
+                                       # are no vifs.
+}
+
+case "${XENGUEST_NETWORK_TYPE}" in
+    nat)
+        XENGUEST_DHCPD_PARAMS_FILE=${XENGUEST_DHCPD_PARAMS_FILE:-"/etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg"}
+        if [ ! -f ${XENGUEST_DHCPD_PARAMS_FILE} ]; then
+            log debug "No ${XENGUEST_DHCPD_PARAMS_FILE} file. Aborting"
+            return
+        fi
+
+        XENGUEST_DHCPD_CONF_FILE="/etc/dhcp/dhcpd.dom$domid.conf"
+
+        case "$command" in
+            online)
+                dhcpd_online
+
+                # Enable ip forwarding and NAT for the ${bridge} interface
+                sysctl -w net.ipv4.ip_forward=1
+                iptables_w -t nat -A POSTROUTING -o ${bridge} -j MASQUERADE -m comment --comment "dom${domid}"
+                ;;
+            offline)
+                dhcpd_offline
+
+                # Remove the NAT iptables rules created for the dom${domid}
+                guest_ipt_rule=$(iptables_w -t nat -vL POSTROUTING -n --line-number | grep -w dom${domid} | awk '{print $1}' | tac)
+                for rule in ${guest_ipt_rule}; do iptables_w -t nat --delete POSTROUTING ${rule}; done
+
+                # If there is no more NAT iptables rules we disable ip forwarding
+                ipt_nat_rules=$(iptables_w -t nat -vL POSTROUTING -n --line-number | grep MASQUERADE | awk '{print $1}')
+                [ -z "${ipt_nat_rules##*[!0-9]*}" ] && sysctl -w net.ipv4.ip_forward=0
+               ;;
+        esac
+
+        ;;
+esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg b/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
new file mode 100644
index 0000000..0495fbd
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/dhcpd-params.cfg
@@ -0,0 +1,30 @@
+# This file holds the guest dhcpd options running on Dom0.
+# The "/etc/xen/scripts/vif-post.d/00-vif-xenguest.hook" called in the end of
+# the vif-nat script will use this file to generate the final dhcpd
+# configuration.
+
+# This file is added in the xenguest image and installed in dom0 under
+# /etc/xenguest/guests/${guestname}/files/dhcpd-params.cfg when the guest
+# image is created.
+# Any customizations to it should be performed by replacing it via a bbappend.
+
+# The \${hostname}, \${mac}, \${vif_ip} and \${router_ip} variables are set in
+# the vif-nat script context. The \${subnetprefix} variable is set in the
+# 00-vif-xenguest.hook script context.
+
+# The "subnet" configuration node is mandatory in order to have the dhcpd
+# properly running.
+
+host ${hostname} {
+    hardware ethernet ${mac};
+    fixed-address ${vif_ip};
+    option routers ${router_ip};
+    option subnet-mask 255.255.255.0;
+    option broadcast-address ${subnetprefix}.255;
+    option domain-name-servers 8.8.8.8;
+    option host-name \"${hostname}\";
+    option domain-name \"example.com\";
+}
+
+subnet ${subnetprefix}.0 netmask 255.255.255.0 {
+}
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
index 2a36096..752f498 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
@@ -9,7 +9,24 @@ BRIDGE_NAME="###BRIDGE_NAME###"
 # get guest parameters
 . ./params.cfg
 
-if [ "${NETWORK_BRIDGE:-}" = "1" ]; then
-    echo "vif = ['${BRIDGE_NAME}']" >> ${guestname}.cfg
-fi
-
+case "${XENGUEST_NETWORK_TYPE:-}" in
+    nat)
+        # Create the symlinks for the files that vif-nat script expects
+        if [ ! -f /etc/dhcpd.conf ]; then
+            ln -s dhcp/dhcpd.conf /etc/dhcpd.conf
+        fi
+        if [ ! -f /etc/init.d/dhcp3-server ]; then
+            ln -s dhcp-server /etc/init.d/dhcp3-server
+        fi
+        if [ ! -f /etc/default/dhcp3-server ]; then
+            ln -s dhcp-server /etc/default/dhcp3-server
+        fi
+        echo "vif = ['script=vif-nat']" >> ${guestname}.cfg
+        ;;
+    bridge)
+        echo "vif = ['script=vif-bridge,bridge=${BRIDGE_NAME}']" >> ${guestname}.cfg
+        ;;
+    *)
+        echo "${@}: XENGUEST_NETWORK_TYPE=$XENGUEST_NETWORK_TYPE invalid"
+        ;;
+esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
index fb66566..8516fe8 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
@@ -35,7 +35,12 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 XENGUEST_IMAGE_SRC_URI_DISK_FILES ??= ""
 
 # Add xen files
-XENGUEST_IMAGE_SRC_URI_XEN_FILES ??= ""
+# Any extrafiles files to be added to XENGUEST_IMAGE_SRC_URI_XEN_FILES should
+# be performed via XENGUEST_IMAGE_SRC_URI_XEN_FILES_append.
+# The dhcpd-params.cfg holds the dhcpd configuration for Dom0. And it is used
+# when XENGUEST_IMAGE_NETWORK_TYPE="nat". Any customizations to it should be
+# performed by replacing it via a xenguest-network.bbappend.
+XENGUEST_IMAGE_SRC_URI_XEN_FILES = "file://dhcpd-params.cfg"
 
 # Add xen configuration elements
 XENGUEST_IMAGE_SRC_URI_XEN_CONFIG ??= ""
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
similarity index 79%
rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
rename to meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index c6c2242..fa4f93f 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -1,5 +1,5 @@
 # Recipe to handle xenguest network configuration
-DESCRIPTION = "XenGuest Network Bridge"
+DESCRIPTION = "Xenguest Network"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://xenguest-network-bridge.in \
     file://xenguest-network-bridge-dhcp.cfg.in \
     file://network-bridge.sh.in \
+    file://00-vif-xenguest.hook \
     "
 
 # Bridge configurator needs to run before S01networking init script
@@ -49,8 +50,19 @@ do_install() {
     install -d -m 755 ${D}${sysconfdir}/xenguest/init.pre
     install -m 755 ${WORKDIR}/network-bridge.sh \
         ${D}${sysconfdir}/xenguest/init.pre/.
+
+    install -d ${D}${sysconfdir}/xen/scripts/vif-post.d
+    install -m 755 ${WORKDIR}/00-vif-xenguest.hook \
+        ${D}${sysconfdir}/xen/scripts/vif-post.d/.
 }
 
-RDEPENDS_${PN} += "bridge-utils"
+RDEPENDS_${PN} += "bridge-utils \
+                   iptables \
+                   dhcp-server \
+                   kernel-module-xt-tcpudp \
+                   kernel-module-xt-physdev \
+                   kernel-module-xt-comment \
+                  "
 FILES_${PN} += "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
 FILES_${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
+FILES_${PN} += "${sysconfdir}/xen/scripts/vif-post.d/00-vif-xenguest.hook"
-- 
2.7.4

