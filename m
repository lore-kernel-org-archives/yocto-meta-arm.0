Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web10.8159.1602582369755626451
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 02:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OXFOYJVO;
 spf=pass (domain: arm.com, ip: 40.107.7.57, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SrPx/zlPG9TS9hkTmb8Uu8iFNAWVnAQCVaYuPo+VSU=;
 b=OXFOYJVOjUL+4rQDFadYHnpcD5wGar4sMa5ZNgoRPYO+vbPojOIoWOyy4ZAaiuBor+j5jkh5mV5lFzDNsjO/thKPPgO5LDwVfhS6AT89uX2FNKUlkoxJrunGdK6FXkumQn/CGXI9hdqOqM+sWrj88UxWMx3fMh9llyTbcx1y670=
Received: from DB6PR0801CA0060.eurprd08.prod.outlook.com (2603:10a6:4:2b::28)
 by DB7PR08MB3164.eurprd08.prod.outlook.com (2603:10a6:5:24::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Tue, 13 Oct
 2020 09:46:06 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::ae) by DB6PR0801CA0060.outlook.office365.com
 (2603:10a6:4:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Tue, 13 Oct 2020 09:46:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 09:46:06 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Tue, 13 Oct 2020 09:46:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82de5e803026e4de
X-CR-MTA-TID: 64aa7808
Received: from 9f9889eb0f3c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DD3278BA-BC41-437A-B6A0-9473B3D27992.1;
	Tue, 13 Oct 2020 09:46:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9f9889eb0f3c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 09:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvmzSjTI8TtRPDW5KuaT9cOAJ5ivnEQzbMO5mdnDWOhF4+nZlnGQgAJc0s+oCPZMAqLSXjAwWSj5d8DUhQOa5R/3PcIhLcmE+FFYxjgWLAaq14UABH2BUI657un2SMGXLo7PUHPN3uHeesVdSQWTTJcLzpx1Dyj9x+CxRSi7X3sOtwKnbxy1XIHVkIzmyJaiDhbo81S87izCG6txiCczMHu030sN8ZPhvGyaGxsExTjYPFx7t7ttlSua1oQCdE7HkEGNXbCcxbMhcoeX028+NcBRRDRqph/mMr9DqIRL398fIX4Zy6qAViqn04+SspUjz3IW98xMkLv8lOZkT/Ex/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SrPx/zlPG9TS9hkTmb8Uu8iFNAWVnAQCVaYuPo+VSU=;
 b=GxF5LnykP2HhLa/VBxQKdwXfNHwi/5rmeuar4yQzYslv7u2oU9mN5D9XnHJ5jMpLShqOLHxJzsNhXBnhp1APVbqUZckgpAX4J+1gTTDvF4DM+OgnM9MothfLFdfmEOyYJCEmd2Qzt4S9fRh9YYRo5gdEOcpdkIOxyW5Me7qEdgcPf2DoNrvbZKdYd/oYbLVOeLAdn1MtE9oviRg3YgjnNsVBVdSv0hgLUcwLcHwQIM7k5UVlzc+ioR5YHrWT91t14S5CX8GJwm0ufliB/STKpag9vKa9Kv1H5X7DenVCoQ88FoQUVOs+0UTg06bly5ks2CrvGG9MWZzcU5nI+cF+hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SrPx/zlPG9TS9hkTmb8Uu8iFNAWVnAQCVaYuPo+VSU=;
 b=OXFOYJVOjUL+4rQDFadYHnpcD5wGar4sMa5ZNgoRPYO+vbPojOIoWOyy4ZAaiuBor+j5jkh5mV5lFzDNsjO/thKPPgO5LDwVfhS6AT89uX2FNKUlkoxJrunGdK6FXkumQn/CGXI9hdqOqM+sWrj88UxWMx3fMh9llyTbcx1y670=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PA4PR08MB5981.eurprd08.prod.outlook.com (2603:10a6:102:e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Tue, 13 Oct
 2020 09:46:00 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 09:46:00 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 1/2] arm-autonomy: Drop foundation-armv8 support
Date: Tue, 13 Oct 2020 09:45:45 +0000
Message-Id: <20201013094546.11726-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::31) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.52) by LO2P265CA0259.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Tue, 13 Oct 2020 09:46:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c76e165-8a69-457e-6db4-08d86f5cce8b
X-MS-TrafficTypeDiagnostic: PA4PR08MB5981:|DB7PR08MB3164:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB31644BDAFD4F977683C606E28D040@DB7PR08MB3164.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QIgdITgIW5FXDDEGHRBwxUELAz5ciKMShhyve+N1h4qE9yDTFfHcY2Z+y02/ANnNUprhEEcCNU2BTbzcXeikpUr4oi4/o/Z4boBEEf7fVpm2YgHopNV68KjBWtIgVWHTdTXM77TG36ZoLoxA6ldvUTZwBZtrzSPk/ehnG1Z18uVhF3FJ4O+HR1ohmOiJxkj4TX+CZ47j9i6Xay4GdxQNe4QjhBvn6O9nfALOxyJF5scVnk8RL91x2WUAr0oav+gXUw+HQ6NMqw73AAa9ZVWFpz5DZ8K0uThzG0PQOt6Dn4m8W4sajeYOJEErLqBWM0A30mA1iTzrifu4YGus8asESg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(5660300002)(26005)(316002)(6916009)(66946007)(7696005)(8936002)(478600001)(52116002)(86362001)(4326008)(2616005)(2906002)(36756003)(6666004)(6486002)(8676002)(66556008)(66476007)(1076003)(83380400001)(16526019)(956004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 kMkVden3SE38UJo+R12j6DpIY/0ZMKU1L+i4ojxr7F05aWoh+7D/l91jPJDk8+3E4cqp0OCeRQbnmBVIcvAeOoiW90w/VwA6FpvzyJFfiZak8tt2C5NqjnKZNSdcnM4d0MTrjlt7I7obN091+uiab1RzGIPFEK4PMVQQudMxOJX+5WL2yaXiIruxQvx54HwuNjSCZxpBUN0hCYjz9I1agpKR31vaT19j7D51ZKhTQq+wk8fdVEb+lvT6HQBt7eyx5GruRH/AM/NeQj6Oz9EZvSzUx0kDuGRcNU+mXwqpJCqk1K3UIfbWVhoRC5B3SK6Ph9+7zKgEw+dHu9ErT86BzOsgbxozyauRrytKmT5X3R/eUkx3FhBPeSqHTFKpMCKgWqyD7/IpwhYAk7jXMg2ozvZuL+4iGIJNY2sB8dfG0P0CGn7BMDZ+VniacrsoKEN1D/r968XQYmtNRPK5L2FF6YzC+oKHo6GsP27HRCfJbapAmoYxIDq4ZCYnzCPwnyzUQiiSKgM4IhIevu4uhjp5K1fPtk9wO7R61KMvmzUX7Xh5scwzM58A4Es8g48waxn3Ll3YdZyb1jFpDo2ZvyJQkw7G7T0eiArt6JZq/lkMF0q/a5YPRuzbRoclz9bSSAqxZETUVlW0RrlI5vGM3VUDfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3dbf8890-7eff-4c37-f889-08d86f5ccab2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GQQBbqKEIo0eZnRLFMo7acuPniM6XlnkFXyZatt9UkrkgfEVTUaDulfxii8jkHlvxWwcTR9i31NtKWEXmPIAvxigDMRz3IcmyLpBl66k3kLCaS9+UsLTV9nTlWF8bU0VvPSXtoRXnuL95ZN0lRovIHWa/x6FKylz++ss+uALDO7rihNPyCU76sWFUZBMR23Yhzty9Jw8J0ufxHfSj8PF/OleCNQR83wvJC/oeoknUWsQvCZ4GEoFFtXd7Pq8P2VWfmx0kiGhJIQda22d3ZeJ/mM2evdG7dhyKQFH//NNKhtKk/IQuuFToezjuqfmU+1GU3he++o02qL45RXyAT+J0BlNUwywjpvC7jD867FC/bat17eUd+OmUOeKcgVgJ+DUyIKcU6MISHLssf4tfVlXWA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(1076003)(356005)(316002)(6666004)(336012)(2616005)(36756003)(47076004)(7696005)(956004)(6486002)(16526019)(86362001)(2906002)(4326008)(82310400003)(8936002)(81166007)(26005)(70206006)(478600001)(186003)(6916009)(82740400003)(5660300002)(83380400001)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 09:46:06.5768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c76e165-8a69-457e-6db4-08d86f5cce8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3164
Content-Type: text/plain

Remove foundation-armv8 overrides from arm-autonomy recipes.

Change-Id: I7913ccdb3383bdf40b608fc852428716e1538318
Issue-Id: SCM-1525
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 .../xen-devicetree/xen-devicetree.bbappend                 | 4 ----
 .../xen/files/{fvp => fvp-base}/early-printk.cfg           | 0
 .../meta-arm-bsp/recipes-extended/xen/xen_%.bbappend       | 7 +------
 .../recipes-extended/xenguest/xenguest-manager.bbappend    | 3 +--
 .../recipes-extended/xenguest/xenguest-network.bbappend    | 2 --
 .../meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend     | 1 -
 6 files changed, 2 insertions(+), 15 deletions(-)
 rename meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/{fvp => fvp-base}/early-printk.cfg (100%)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
index 8284c63..2c875a9 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
@@ -21,7 +21,3 @@ XEN_DEVICETREE_XEN_BOOTARGS_append_n1sdp = " console=dtuart dtuart=serial0 boots
 
 XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base = " root=/dev/vda2"
 XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base = " console=dtuart dtuart=serial0 bootscrub=0"
-
-XEN_DEVICETREE_DOM0_BOOTARGS_append_foundation-armv8 = " root=/dev/vda2"
-XEN_DEVICETREE_XEN_BOOTARGS_append_foundation-armv8 = " console=dtuart dtuart=serial0 bootscrub=0"
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp-base/early-printk.cfg
similarity index 100%
rename from meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/early-printk.cfg
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp-base/early-printk.cfg
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
index 89130a6..ef3cc23 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
@@ -1,11 +1,6 @@
-# Foundation-armv8 support
-COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
-FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp:"
-SRC_URI_append_foundation-armv8 = " file://early-printk.cfg"
-
 # FVP Base support
 COMPATIBLE_MACHINE_fvp-base = "fvp-base"
-FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp:"
+FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files:"
 SRC_URI_append_fvp-base = " file://early-printk.cfg"
 
 # Juno support
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
index 874cfed..d9c88fb 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
@@ -1,6 +1,5 @@
 # Board specific configuration for the manager
 
-# FVP and Foundation are using vda as hard drive and partition 2 is the
+# FVP uses vda as hard drive and partition 2 is the
 # default rootfs, so use vda3 for guest lvm
-XENGUEST_MANAGER_VOLUME_DEVICE_foundation-armv8 ?= "/dev/vda3"
 XENGUEST_MANAGER_VOLUME_DEVICE_fvp-base ?= "/dev/vda3"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
index 1efd7c6..1698d23 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network.bbappend
@@ -2,7 +2,5 @@ XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?= "eth0"
 
 XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?= "eth0"
 
-XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?= "eth0"
-
 # Juno board has 2 network interfaces, add both of them to the bridge
 XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
index 5231f51..c8eaad7 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
@@ -13,4 +13,3 @@ LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURE
                                          ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
 
 KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
-KERNEL_FEATURES_append_foundation-armv8 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
-- 
2.17.1

