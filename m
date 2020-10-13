Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.68])
 by mx.groups.io with SMTP id smtpd.web11.8232.1602582391511471057
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 02:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ox052v9l;
 spf=pass (domain: arm.com, ip: 40.107.22.68, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0zJSWHL/iv0PG+jU14vu3+RsDWxenlfODxQIi1BQhU=;
 b=Ox052v9lf1vl4/lMZ2OA6JtTO3Mg/JtlA7dpOYHPlRA58NQufm8z9p3yo6OuKybiI61xi9aOfjICd/ixdvdjK0nEShjXy7W+p6yYgguIIZzRF1QW1pZ7uAG8ID+JPpb1/f5alKjFFn/h9hFJ4K95bCQNbvVLSwUwCBhC6z7rkKo=
Received: from MR2P264CA0082.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::22)
 by AM0PR08MB4996.eurprd08.prod.outlook.com (2603:10a6:208:15a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Tue, 13 Oct
 2020 09:46:28 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::21) by MR2P264CA0082.outlook.office365.com
 (2603:10a6:500:32::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Tue, 13 Oct 2020 09:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 09:46:27 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Tue, 13 Oct 2020 09:46:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 196c3410c69c4936
X-CR-MTA-TID: 64aa7808
Received: from 0b5ce300c075.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B56A6F83-94C8-4EE2-A0F9-6636B3CD18B7.1;
	Tue, 13 Oct 2020 09:46:22 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b5ce300c075.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 09:46:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBzTesPWP75XSeZMYRsaLuAxJgvGYcUOwb0JN97kZk4gXFwpKyxw0uyrEHqae63Q8yXtWbcBX/aIyrBtMAnllr7sw9SClmIQdg233pDo2+qYaw4n720KOpaLNt9RXJ/UjR7jE0Jr+uJasHp2xhzuCFDXZr4T/ehp6wz3yHQJ010/GTm6gAGdjiTX1zyH7xJu6A32FS50lR/W+3F9k89hMi7ipVJKzQRtjvREgnQBZiVm6nAIaNX3bWkzB+QwY779ryxe8/ZAgLyZiwcj90V5W9FADX51xnscrO31ivWkB5DWTdnEd5d8CXmODYiEMsVnXiceNtwPXpy6dXZMXG+1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0zJSWHL/iv0PG+jU14vu3+RsDWxenlfODxQIi1BQhU=;
 b=IvDNMtH806/WljdBq3vLf99zfh+5agZtaa4MdcQs4jt0tHUSAeeEzRvstbieL0pPREZEbV517gBD3ITHIeqSQmc81DjYOdqT4qQxpVkv4MuLT4LS1zK8Sfk10iMakrydihDx3O2U75wjhlpBxXlVaLiz5eajW/9xonspLvugpsiWKjGU9j3nKadT0p9VcA6Ru/ofCWolVsaNvOiMj3Zfx3mXfUmGp1rOOEYWEHph0Y25EA9anxtJMA2QuUSeZQg5f2Y1WfhCAv0bPm30ZdVgAMNxv1lQYgQKtg7WMSQoP7bdJqKrMW2Fj0Tve2eCOoRif8UyU1MoA2G9KUyTIDB3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0zJSWHL/iv0PG+jU14vu3+RsDWxenlfODxQIi1BQhU=;
 b=Ox052v9lf1vl4/lMZ2OA6JtTO3Mg/JtlA7dpOYHPlRA58NQufm8z9p3yo6OuKybiI61xi9aOfjICd/ixdvdjK0nEShjXy7W+p6yYgguIIZzRF1QW1pZ7uAG8ID+JPpb1/f5alKjFFn/h9hFJ4K95bCQNbvVLSwUwCBhC6z7rkKo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PA4PR08MB5981.eurprd08.prod.outlook.com (2603:10a6:102:e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Tue, 13 Oct
 2020 09:46:21 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 09:46:21 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 2/2] arm-autonomy: Move machine override soft assignments to inc files
Date: Tue, 13 Oct 2020 09:45:46 +0000
Message-Id: <20201013094546.11726-2-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013094546.11726-1-Nathan.Dunne@arm.com>
References: <20201013094546.11726-1-Nathan.Dunne@arm.com>
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::31) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.52) by LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Tue, 13 Oct 2020 09:46:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61f3fb3e-f800-4b89-b712-08d86f5cdb37
X-MS-TrafficTypeDiagnostic: PA4PR08MB5981:|AM0PR08MB4996:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4996EAE6511984730A4322098D040@AM0PR08MB4996.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wwEtmrcQQ/Ho7bLyAUX0XvMMR1cdur4ccteL2iTBKDISXMqb1AgEnddnFMNu0bGBDSyH4toyL0270BXFmkYM8BapX6Rh+liTiH34an6Qa8g+c40lzQv0X3PoP1E/y3G4KfEYDp2PMyB+9Rv8WWmur/AdQu4ulq2jtG3ihp1T1eKYk5vuxb+qndNNE7d3xvLzuRE487CCfY/Td1XB7j52qX1XEQvKL4XoHsCTtj88CpiQbQKZShJEIGkUcCyaKWA9g1FU2V++AmqqRgHQ7etAp3dXzOHHS0BaEKC1HMfAsucCVnJpcUa3b9SBgL9FF+X+tUQ/6ENxlkkt/nP62sVVVaHaoxznL7JEJJgZJvuStT1Iedvl5jgE9nvE7DKWNfTKGmxW7QHg8X1esfZQ5CNG0Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(26005)(316002)(6916009)(66946007)(7696005)(8936002)(478600001)(52116002)(86362001)(4326008)(2616005)(2906002)(36756003)(6666004)(6486002)(8676002)(66556008)(66476007)(1076003)(83380400001)(16526019)(956004)(186003)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ycECY0v8tJ1TVMOpIOxQsWFdvjVCJ6bwPxT0mBWobHyCyDJs+UDcONnhHPCFJHbLQiQNZCV51W4H+/1QnyMLzP2FSreBhGxuEt9WemgD196c5fFUbnVRcyRApaxW6fPAP72n9hkBpRSjqjvvO2t32fSxf3THA+PX+LTdfaFxjXk1DlBUYC9vft1xIAoixh1lxf1WeXy1PYkcEEFJioSKh2tD/gs23uqWv6lCRR97pTjjJB4cdh34l1tmKNzL3D7hlU93CkY5cri93c+Lv1iUTI7LLZeHPI6G0WTfefKwyzrWBV4jFgUXgjtfTnJ6TDn+9pYEYdY+wl6pwn15B7a72isEhuOKasPnncmaO3cltY99JZbEKE5p+RQE4o1aVZTSWe2+/TJS6rrBJ1/t/lQt02NssumXv6Y44tiqXjfC4qFnStbaulrMgKDN0gJCtGS1JP5RDfpvlL6MxhgJNRJdmILGpL9wBFb53rQ13GRmno+WKRKkPuMHeBg9aUzlcy/COMM30wnRSBW1mEXeOUMG+cFdhEv4wxD8NchvZV/QPUeb0YChbnrUvE1Ju3m3WaLCzPrIEhR/37dKEFc/1R4MJxNPx6GGre0CZN7JK8H+rKgD0szqXOxkEF/ecDyrrkMq5sbOXh1A9+v3Ai+UpcaWeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	97a8a29c-0c63-4238-34b0-08d86f5cd724
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QfVh5SJma7yiaT5yIlBakUYuAcK8hgoV9qlUh6qQSlwfTTaOmfvlsHquXD6xJ/zY+cHLwYzIFqXovtZcmzWpW+7hEQE8xLVV8Y6eIP20p7ir67B1CDnriLlABle1UuVjQfvHuGLuLKAbbDvZLwP7/PzZxT9HgtRVddjX7V6jYV0NHVtaBUN3i4WeKS6TMJHNa/jbUnWHU8HUhoSWmZ2siSFo318fJZ6cSvhuAEmzzOYT9FN4gCovamRrXCvEtAqwEcI7t1Y03KwwHua2NynunFRr5SpKF8zO+OP8bCEDFc5Xi/b8V2Y//cynMM+ofdkb5uREGPxjy5WsPc3DJUTtFt8BxQzU1bZkSOG3tZiWAmP4yelw+hE8euL5Q4wEXXa/STZwIHCVCOP2Yb++yynRTRDA0vFrMhaOc6yO5WYbMEcJ6pI/bh8EBkWM1UMLP9pnNZYPPA+7CP7ebqfSGBa9gw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(186003)(6666004)(2616005)(26005)(86362001)(83380400001)(2906002)(81166007)(82310400003)(16526019)(8676002)(4326008)(36756003)(8936002)(6916009)(6486002)(7696005)(5660300002)(316002)(1076003)(478600001)(956004)(356005)(47076004)(70206006)(82740400003)(336012)(70586007)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 09:46:27.7331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f3fb3e-f800-4b89-b712-08d86f5cdb37
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4996
Content-Type: text/plain

Moved assignments of the form:
     MYVAR_$MACHINE ?= "val"
to a machine specific .inc file, as the above will still set the
value when the base variable has been set in local.conf, e.g:
     MYVAR = "local_val"
despite the weak assignment.

Issue-Id: SCM-1524
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I3ba77453be785ec92ab45255cbd34d7d77bbcf37
---
 .../conf/machine/arm-autonomy-machine-extra-settings.inc   | 2 ++
 .../meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc  | 7 +++++++
 .../meta-arm-bsp/conf/machine/juno-extra-settings.inc      | 4 ++++
 .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc     | 4 ++++
 .../recipes-extended/xenguest/xenguest-manager.bbappend    | 5 -----
 .../recipes-extended/xenguest/xenguest-network.bbappend    | 6 ------
 6 files changed, 17 insertions(+), 11 deletions(-)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
index fc24ee8..5f3d8f8 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/arm-autonomy-machine-extra-settings.inc
@@ -1,5 +1,7 @@
 # Require extra machine specific settings
 ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE ?= ""
 ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_n1sdp = "n1sdp-extra-settings.inc"
+ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_fvp-base = "fvp-base-extra-settings.inc"
+ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE_juno = "juno-extra-settings.inc"
 
 require ${ARM_BSP_DYN_MACHINE_EXTRA_REQUIRE}
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
new file mode 100644
index 0000000..eb16bc8
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
@@ -0,0 +1,7 @@
+# Extra machine settings for fvp-base
+
+# FVP uses vda as hard drive and partition 2 is the
+# default rootfs, so use vda3 for guest lvm
+XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/vda3"
+
+XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
new file mode 100644
index 0000000..02600c5
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
@@ -0,0 +1,4 @@
+# Extra machine settings for juno
+
+# Juno board has 2 network interfaces, add both of them to the bridge
+XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0 eth1"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
index 41c9433..472dd2a 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
@@ -1,3 +1,5 @@
+# Extra machine settings for n1sdp
+
 # We need to extent the wks search path to be able to find the wks file set in
 # ARM_AUTONOMY_WKS_FILE.
 WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
@@ -19,6 +21,8 @@ GRUB_CFG_FILE ?= "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy-n1sdp-gru
 # the "/" partition is /dev/sda2.
 XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda3"
 
+XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
+
 # The XEN_DEVICETREE_DEPEND and XEN_DEVICETREE_DTBS variables aftect the
 # xen-devicetree.bb recipe
 XEN_DEVICETREE_DEPEND = "virtual/trusted-firmware-a:do_deploy"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
deleted file mode 100644
index d9c88fb..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-# Board specific configuration for the manager
-
-# FVP uses vda as hard drive and partition 2 is the
-# default rootfs, so use vda3 for guest lvm
-XENGUEST_MANAGER_VOLUME_DEVICE_fvp-base ?= "/dev/vda3"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
deleted file mode 100644
index 1698d23..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?= "eth0"
-
-XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?= "eth0"
-
-# Juno board has 2 network interfaces, add both of them to the bridge
-XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
-- 
2.17.1

