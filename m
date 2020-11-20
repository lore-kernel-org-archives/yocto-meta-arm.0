Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.72])
 by mx.groups.io with SMTP id smtpd.web11.24143.1605872264275134434
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 03:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mPCkaZvV;
 spf=pass (domain: arm.com, ip: 40.107.1.72, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGQxAaKU9Bou1ZKuqQ6PPsgVoVf5A3gp1pAQ4BDI+zk=;
 b=mPCkaZvVjXAgSf8twRn6XDHvb5nFwsaqa6rrVRv132ONL8f3KHFz++wYbGPuqjaEgfVAhYz/hNzYJ2JMExC89GLQa/MMzU4khx9q+Ty9kOR+6eHvHpjh7x0H8g7o8D/s4BRbmvOyOZpzcKEWDUe38JDPKdB17g68pngx7nlhYR4=
Received: from MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::36)
 by DB7PR08MB4585.eurprd08.prod.outlook.com (2603:10a6:10:7b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 11:37:39 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::8e) by MR2P264CA0144.outlook.office365.com
 (2603:10a6:500:30::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 11:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:37:39 +0000
Received: ("Tessian outbound 13ed5f5344c0:v71"); Fri, 20 Nov 2020 11:37:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e327015ce22f68b6
X-CR-MTA-TID: 64aa7808
Received: from 0a580dc13a4c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 12617A37-FAFC-4A3D-9991-E06BBA35CAAF.1;
	Fri, 20 Nov 2020 11:37:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a580dc13a4c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Nov 2020 11:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4ppam89LCDQLuouqeigWggrtnLNg5FA66q4wXCcmMOxdHBrXd0qJEZ6+So5vS7cWc30YbTie+BAt3sboEEXUBbkzL9cLZkFyt/qGb4qwkpQ/tyoMMt/+BcnusWR9XAT5XA+gMoc2AJxXu2Dqpo5mvgQBxkpTFiD1ws8/Jfe29sWtgRQClkm66EYo4SgSLqrm4c4ctVH4U5V9hj8s2s5UJD4H2S2LJzCNpQsl/U3xF4XjFdsIXcAn+xXaN2VSzT83nW9MtTRL7+QoIdr3WUNwD3YvVqknmqkzDvp+w6gPvmLWNss1vStyVetH8tBjaCgZKjfY4lckpkHhOG/BP2frQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGQxAaKU9Bou1ZKuqQ6PPsgVoVf5A3gp1pAQ4BDI+zk=;
 b=n4K+JbOuIm8OgeHXyILWn1FaBxGzoaeEgWR3gxpZpVOxpWZVM5tx8ygtpaeSx3XouoRjR4/9WAhvMPDV6cA/S/+mUjOf2NJY6lh3hft0VKlZn+/JboCjereu1xyE0zpi4Tj0kcfQsIHnwSadI3O/qjcoM/Lh11r7JoxKY5sK2XdRPhlPNiW9f59wzrIHHi/jATwtv4C1UphHefIw259PrEAdAFcuBnip1tbyTDkp6yOOiT6ZYo63rN64wtQ/RIaoLkGKMeboVia8PK3MwEvCA3UsTCz7YbgpSBJGJJMWQdkVzgXFVSaVGFMinmXMMIhfLdJ2zAGTv2UdRK4vn/MxMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGQxAaKU9Bou1ZKuqQ6PPsgVoVf5A3gp1pAQ4BDI+zk=;
 b=mPCkaZvVjXAgSf8twRn6XDHvb5nFwsaqa6rrVRv132ONL8f3KHFz++wYbGPuqjaEgfVAhYz/hNzYJ2JMExC89GLQa/MMzU4khx9q+Ty9kOR+6eHvHpjh7x0H8g7o8D/s4BRbmvOyOZpzcKEWDUe38JDPKdB17g68pngx7nlhYR4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB8PR08MB5516.eurprd08.prod.outlook.com (2603:10a6:10:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 11:37:32 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:37:32 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy/firmware-image-juno: update offset addresses for NOR flash images
Date: Fri, 20 Nov 2020 12:37:24 +0100
Message-Id: <20201120113725.30265-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::11) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO2P265CA0486.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:37:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afe61999-b20f-44fd-0e72-08d88d48af87
X-MS-TrafficTypeDiagnostic: DB8PR08MB5516:|DB7PR08MB4585:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB45859B9E8D2E08A466CBEBC1FDFF0@DB7PR08MB4585.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lPcrmSlBdAAo5Ehd+fMaxqkNhvECjZYGrRjfFfz7eu5jM8ixUZ0Z9naewwFocxJJU9aMkDszipVUqVxj3gQ7D9U+USO2Pb5efq+ueLJoPFvj0DhmcYy5gfFFDOF23/VmHzwUMXvmQljl5mdYX5IHYGaHsIc65YX63J7f+ThTbbVr1lfe6oYFQweeYvQwV+yjh60k3xuXYNiNkbJo2fTDnC0aJu0I315ssRTsaQt82Yr1fzhWodUs/JhddnDOzPrg7+ejeNcrpLlp+29S6PhEGdwtF2JA27IZr78MKF1wkV1/sRsl1XmkZIMF9GaZRNQH
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(26005)(44832011)(4001150100001)(1076003)(8936002)(2616005)(36756003)(8676002)(6486002)(956004)(478600001)(86362001)(316002)(186003)(15650500001)(30864003)(2906002)(16526019)(83380400001)(7696005)(52116002)(4326008)(6666004)(66946007)(66476007)(66556008)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 iUUeuGIMRVz0FkAy0p4h1DI0gdEJU0reCeKx57/29W4ZOGLxZk8N4d31lKs1HyaCQ0BPgKJvEPae+YAvCCHtiDIPltu8eXzmSre/gJAGKRaD3Sb/KvGSy1vsnPYI3p5Z6xHuqPDxM1rNMEgz9LxhJgoqBkF91B8G/39Lxxuu9Ln99IM4Ot8QxR1xDbraWlKJfmQs8ZPIRS0HlYimE+K5OvgZ0Gd9nK2rxWWBD2ZVPHpqd5KPjeJsrqp8a3SUe4bNDmhkXkCR/4bP2Won83k/yqusSNT+JV7fm4Y84Exis+FT2ZM+Jpjw3O4dkika5D55u56NoES20GPG3j9n9gBby9qJecDF3JAcOKjdJ3FIlg4MU/mtmkU5DXLOcgpKdQ4irwjuFkoL9u2v7TnPMuq/FK9/k5pWtd9O2DPCx8bSR0LuC4Iz7DTcQNViSaGExEsVvbc48KgBLOyBb9Qq+lojiBlL7LOulruJKQP+Kd0POy25vaknnK2OXxyj+6Q1JspU20jV3GdFPBDF0NSFq4MO3twwdn04kay9B36ysvdF4imke+9FXocgmxnaqnOmJLrEz8PUiqJeNXBKSHpv3uNRZAw6zz6UBIlytMOTcdyQZQbFeMn61dAXLctBJRybkqgKgQFdPn1492O4g4oRuvJI/L5mPBi7k95oOdXtRPXYI7h2eHSryTTtUQCdyQ3loPeRRdjxHuPU/qsy+RE5rZVCru8DHNkAq+MRrEdw00tFQYOwINkANnIEkuHDjeqYPUYqaARSCT9L6xTBqYld5qtH9rMG03RJkM1Ia1iMJ9vCvSu5nih7wIkqXT4DqhIWICG8OZVNiMswLBo0yrPrPtRJcoIM3vaVbP1GioLdxwI/Z+RcjVJWEVHnxf8sf8V/0KuMddLCdawXpqBRgqdv89SmOQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5516
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1efa9ec5-1ecf-4632-f2ab-08d88d48aad8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l61PJeYF6t7LfOLyADviD79PvBz+fy66xqoNBxzQyCL7wjqJ03KY96TGPsWZE6ec5CDXWZY2VThBCzPLLE0RB3n7zbd3zEoOcrCeIxzAY/CYiZ+/u/JhBMYn+S/kkKdKjIBB/cKXIMfwFBPsTaGsh8SEK2ZA3Y9BX7QVI4JW3ofNqShIIHfdnHPyd/cccoCIAvsoUDdUqpTnu/gRwFAF76oeVPdUPBwc4vm9TuOECsoRKV4GIuf81NJn5rJEDjvhgE8jWpnXu3EGBZHCp+jm+Y0VR4fruuz3UA5a1Mo7cAs/ZYQjf59rCr8p6On258scPRySBn+m5CMjxw/kM5Krv7fcSXg/ylKrfSEak5et9mlDjgsNkT0HAeffqrurwBTFX9T/MO6ox7vWjAy+iEN2GA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(6916009)(478600001)(44832011)(1076003)(4001150100001)(26005)(186003)(16526019)(15650500001)(8936002)(8676002)(2906002)(82310400003)(81166007)(356005)(83380400001)(5660300002)(7696005)(30864003)(6486002)(36756003)(4326008)(336012)(316002)(956004)(2616005)(86362001)(6666004)(70206006)(47076004)(82740400003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:37:39.3261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afe61999-b20f-44fd-0e72-08d88d48af87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4585
Content-Type: text/plain

This patch brings following improvements:
 * Remove images-r[012].txt and uEnv.txt source files
   and move all customization to add-xen-support.patch.
 * Move juno*-xen.dtb and xen binaries under dedicated
   'XEN' directory to be compatible with 8.3 format.
 * Increase XEN_DEVICETREE_DOM0_SIZE to 36 MiB.

Change-Id: I3d3ff963f97c738dcf2d90ba825729232d63ad06
Issue-Id: SCM-1567
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../conf/machine/juno-extra-settings.inc      |   1 +
 .../images/firmware-image-juno.bbappend       |  29 +++-
 .../firmware-image-juno/add-xen-support.patch | 140 ++++++++++++++++++
 .../images/firmware-image-juno/images-r0.txt  |  78 ----------
 .../images/firmware-image-juno/images-r1.txt  |  78 ----------
 .../images/firmware-image-juno/images-r2.txt  |  78 ----------
 .../images/firmware-image-juno/uEnv.txt       |  15 --
 7 files changed, 166 insertions(+), 253 deletions(-)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
 delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
index 02600c5..110865d 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
@@ -2,3 +2,4 @@
 
 # Juno board has 2 network interfaces, add both of them to the bridge
 XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0 eth1"
+XEN_DEVICETREE_DOM0_SIZE ?= "0x02400000"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
index b0aae69..847e252 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
@@ -4,6 +4,19 @@ OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d
 
 FILESEXTRAPATHS_prepend_xen := "${THISDIR}/${PN}:"
 
+DEPENDS_append_xen = " dos2unix-native"
+
+SRC_URI_append_xen = " file://add-xen-support.patch;patchdir=../"
+
+do_install_append_xen() {
+    mv -v ${D}/${UNPACK_DIR}/SOFTWARE/uEnv.txt \
+          ${D}/${UNPACK_DIR}/SOFTWARE/uenvfile
+    for dir in $(ls ${D}/${UNPACK_DIR}/SITE1/)
+    do
+        unix2dos ${D}/${UNPACK_DIR}/SITE1/${dir}/images.txt
+    done
+}
+
 DEPLOY_EXTRA_DEPS ??= ""
 DEPLOY_EXTRA_DEPS_xen = "xen:do_deploy xen-devicetree:do_deploy"
 
@@ -14,8 +27,16 @@ do_deploy_prepend_xen() {
     # xen:do_deploy and xen-devicetree:do_deploy when
     # INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
     # xen-devicetree binaries copying in the do_deploy task.
-    cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
-        ${D}/${UNPACK_DIR}/SOFTWARE/xen
-    cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
-        ${D}/${UNPACK_DIR}/SOFTWARE/
+
+    mkdir -p ${D}/${UNPACK_DIR}/SOFTWARE/XEN
+    cp  -v ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
+        ${D}/${UNPACK_DIR}/SOFTWARE/XEN/xen
+
+    for dtb in $(basename -s .dtb ${KERNEL_DEVICETREE})
+    do
+        cp -v ${DEPLOY_DIR_IMAGE}/${dtb}-xen.dtb \
+            ${D}/${UNPACK_DIR}/SOFTWARE/XEN/${dtb}.dtb
+    done
+
+    bbnote "Xen binaries added under SOFTWARE/XEN directory"
 }
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch
new file mode 100644
index 0000000..04098e1
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch
@@ -0,0 +1,140 @@
+arm-bsp/firmware-image-juno: add xen support
+
+This patch adds xen and dtbs binaries entries to images-r[012].txt files.
+These images-r[012].txt files contain NOR filesystem entries details,
+like file offset, name, path etc.
+
+It also adds customization for uEnv.txt file, that allows to autoboot xen.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
+
+diff -r -u a/images-r0.txt b/images-r0.txt
+--- a/images-r0.txt	2020-11-13 17:26:27.945942230 +0100
++++ b/images-r0.txt	2020-11-13 17:26:43.221881902 +0100
+@@ -1,7 +1,7 @@
+ TITLE: Versatile Express Images Configuration File
+ 
+ [IMAGES]
+-TOTALIMAGES: 10                  ;Number of Images (Max: 32)
++TOTALIMAGES: 11                  ;Number of Images (Max: 32)
+ 
+ NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR0ADDRESS: 0x00000000          ;Image Flash Address
+@@ -24,7 +24,7 @@
+ 
+ NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR3ADDRESS: 0x02900000          ;Image Flash Address
+-NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
++NOR3FILE: \SOFTWARE\XEN\juno.dtb ;Image File Name
+ NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
+ NOR3LOAD: 00000000               ;Image Load Address
+ NOR3ENTRY: 00000000              ;Image Entry Point
+@@ -64,8 +64,13 @@
+ NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR9ADDRESS: 0x02A80000          ;Image Flash Address
+ NOR9NAME: uEnv.txt
+-NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
++NOR9FILE: \SOFTWARE\uenvfile     ;Image File Name
+ NOR9LOAD: 00000000               ;Image Load Address
+ NOR9ENTRY: 00000000              ;Image Entry Point
+ 
+-
++NOR10UPDATE: AUTO                ;Image Update:NONE/AUTO/FORCE
++NOR10ADDRESS: 0x03000000         ;Image Flash Address
++NOR10FILE: \SOFTWARE\XEN\xen     ;Image File Name
++NOR10NAME: xen
++NOR10LOAD: 00000000              ;Image Load Address
++NOR10ENTRY: 00000000             ;Image Entry Point
+diff -r -u a/images-r1.txt b/images-r1.txt
+--- a/images-r1.txt	2020-11-13 17:26:27.945942230 +0100
++++ b/images-r1.txt	2020-11-13 17:26:43.221881902 +0100
+@@ -1,7 +1,7 @@
+ TITLE: Versatile Express Images Configuration File
+ 
+ [IMAGES]
+-TOTALIMAGES: 10                  ;Number of Images (Max: 32)
++TOTALIMAGES: 11                  ;Number of Images (Max: 32)
+ 
+ NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR0ADDRESS: 0x00000000          ;Image Flash Address
+@@ -24,7 +24,7 @@
+ 
+ NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR3ADDRESS: 0x02900000          ;Image Flash Address
+-NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
++NOR3FILE: \SOFTWARE\XEN\juno-r1.dtb ;Image File Name
+ NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
+ NOR3LOAD: 00000000               ;Image Load Address
+ NOR3ENTRY: 00000000              ;Image Entry Point
+@@ -64,8 +64,13 @@
+ NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR9ADDRESS: 0x02A80000          ;Image Flash Address
+ NOR9NAME: uEnv.txt
+-NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
++NOR9FILE: \SOFTWARE\uenvfile     ;Image File Name
+ NOR9LOAD: 00000000               ;Image Load Address
+ NOR9ENTRY: 00000000              ;Image Entry Point
+ 
+-
++NOR10UPDATE: AUTO                ;Image Update:NONE/AUTO/FORCE
++NOR10ADDRESS: 0x03000000         ;Image Flash Address
++NOR10FILE: \SOFTWARE\XEN\xen     ;Image File Name
++NOR10NAME: xen
++NOR10LOAD: 00000000              ;Image Load Address
++NOR10ENTRY: 00000000             ;Image Entry Point
+diff -r -u a/images-r2.txt b/images-r2.txt
+--- a/images-r2.txt	2020-11-13 17:26:27.949942214 +0100
++++ b/images-r2.txt	2020-11-13 17:26:43.221881902 +0100
+@@ -1,7 +1,7 @@
+ TITLE: Versatile Express Images Configuration File
+ 
+ [IMAGES]
+-TOTALIMAGES: 10                  ;Number of Images (Max: 32)
++TOTALIMAGES: 11                  ;Number of Images (Max: 32)
+ 
+ NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR0ADDRESS: 0x00000000          ;Image Flash Address
+@@ -24,7 +24,7 @@
+ 
+ NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR3ADDRESS: 0x02900000          ;Image Flash Address
+-NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
++NOR3FILE: \SOFTWARE\XEN\juno-r2.dtb ;Image File Name
+ NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
+ NOR3LOAD: 00000000               ;Image Load Address
+ NOR3ENTRY: 00000000              ;Image Entry Point
+@@ -64,8 +64,13 @@
+ NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR9ADDRESS: 0x02A80000          ;Image Flash Address
+ NOR9NAME: uEnv.txt
+-NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
++NOR9FILE: \SOFTWARE\uenvfile     ;Image File Name
+ NOR9LOAD: 00000000               ;Image Load Address
+ NOR9ENTRY: 00000000              ;Image Entry Point
+ 
+-
++NOR10UPDATE: AUTO                ;Image Update:NONE/AUTO/FORCE
++NOR10ADDRESS: 0x03000000         ;Image Flash Address
++NOR10FILE: \SOFTWARE\XEN\xen     ;Image File Name
++NOR10NAME: xen
++NOR10LOAD: 00000000              ;Image Load Address
++NOR10ENTRY: 00000000             ;Image Entry Point
+diff -r -u a/uEnv.txt b/uEnv.txt
+--- a/uEnv.txt	2020-11-13 17:26:27.949942214 +0100
++++ b/uEnv.txt	2020-11-13 17:26:43.221881902 +0100
+@@ -1,3 +1,5 @@
++xen_name=xen
++xen_addr=0x84000000
+ uenvcmd=run mybootcmd
+ mybootcmd=echo Loading custom boot command; \
+ echo Loading kernel; \
+@@ -7,5 +9,7 @@
+ afs load  ${fdtfile} ${fdt_addr_r}; \
+ if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfile}; \
+ afs load ${fdt_alt_name} ${fdt_addr_r}; fi; fdt addr ${fdt_addr_r}; fdt resize; \
+-booti ${kernel_addr_r} - ${fdt_addr_r};
++echo Loading Xen; \
++afs load  ${xen_name} ${xen_addr}; \
++if test $? -eq 0; then echo Booting Xen; bootefi ${xen_addr} ${fdt_addr_r}; fi;
+ 
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
deleted file mode 100644
index ec32ca2..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-TITLE: Versatile Express Images Configuration File
-
-[IMAGES]
-TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-
-NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR0ADDRESS: 0x00000000          ;Image Flash Address
-NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
-NOR0LOAD: 00000000               ;Image Load Address
-NOR0ENTRY: 00000000              ;Image Entry Point
-
-NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
-NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
-NOR1LOAD: 00000000               ;Image Load Address
-NOR1ENTRY: 00000000              ;Image Entry Point
-
-NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR2ADDRESS: 0x00500000          ;Image Flash Address
-NOR2FILE: \SOFTWARE\Image        ;Image File Name
-NOR2NAME: norkern                ;Rename kernel to norkern
-NOR2LOAD: 00000000               ;Image Load Address
-NOR2ENTRY: 00000000              ;Image Entry Point
-
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-xen.dtb ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-
-NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x01D00000          ;Image Flash Address
-NOR4FILE: \SOFTWARE\xen          ;Image File Name
-NOR4NAME: xen
-NOR4LOAD: 00000000               ;Image Load Address
-NOR4ENTRY: 00000000              ;Image Entry Point
-
-NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR5ADDRESS: 0x025C0000          ;Image Flash Address
-NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
-NOR5LOAD: 00000000               ;Image Load Address
-NOR5ENTRY: 00000000              ;Image Entry Point
-
-NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR6ADDRESS: 0x03E40000          ;Image Flash Address
-NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
-NOR6LOAD: 00000000               ;Image Load Address
-NOR6ENTRY: 00000000              ;Image Entry Point
-
-NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
-NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
-NOR7NAME: startup.nsh
-NOR7LOAD: 00000000               ;Image Load Address
-NOR7ENTRY: 00000000              ;Image Entry Point
-
-NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
-NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
-NOR8NAME: BOOTENV
-NOR8LOAD: 00000000               ;Image Load Address
-NOR8ENTRY: 00000000              ;Image Entry Point
-
-NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02600000          ;Image Flash Address
-NOR9FILE: \SOFTWARE\selftest     ;Image File Name
-NOR9LOAD: 00000000               ;Image Load Address
-NOR9ENTRY: 00000000              ;Image Entry Point
-
-NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR10ADDRESS: 0x02780000          ;Image Flash Address
-NOR10NAME: uEnv.txt
-NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-NOR10LOAD: 00000000               ;Image Load Address
-NOR10ENTRY: 00000000              ;Image Entry Point
-
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
deleted file mode 100644
index 1372bc3..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-TITLE: Versatile Express Images Configuration File
-
-[IMAGES]
-TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-
-NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR0ADDRESS: 0x00000000          ;Image Flash Address
-NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
-NOR0LOAD: 00000000               ;Image Load Address
-NOR0ENTRY: 00000000              ;Image Entry Point
-
-NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
-NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
-NOR1LOAD: 00000000               ;Image Load Address
-NOR1ENTRY: 00000000              ;Image Entry Point
-
-NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR2ADDRESS: 0x00500000          ;Image Flash Address
-NOR2FILE: \SOFTWARE\Image        ;Image File Name
-NOR2NAME: norkern                ;Rename kernel to norkern
-NOR2LOAD: 00000000               ;Image Load Address
-NOR2ENTRY: 00000000              ;Image Entry Point
-
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r1-xen.dtb  ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-
-NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x01D00000          ;Image Flash Address
-NOR4FILE: \SOFTWARE\xen          ;Image File Name
-NOR4NAME: xen
-NOR4LOAD: 00000000               ;Image Load Address
-NOR4ENTRY: 00000000              ;Image Entry Point
-
-NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR5ADDRESS: 0x025C0000          ;Image Flash Address
-NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
-NOR5LOAD: 00000000               ;Image Load Address
-NOR5ENTRY: 00000000              ;Image Entry Point
-
-NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR6ADDRESS: 0x03E40000          ;Image Flash Address
-NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
-NOR6LOAD: 00000000               ;Image Load Address
-NOR6ENTRY: 00000000              ;Image Entry Point
-
-NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
-NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
-NOR7NAME: startup.nsh
-NOR7LOAD: 00000000               ;Image Load Address
-NOR7ENTRY: 00000000              ;Image Entry Point
-
-NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
-NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
-NOR8NAME: BOOTENV
-NOR8LOAD: 00000000               ;Image Load Address
-NOR8ENTRY: 00000000              ;Image Entry Point
-
-NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02600000          ;Image Flash Address
-NOR9FILE: \SOFTWARE\selftest     ;Image File Name
-NOR9LOAD: 00000000               ;Image Load Address
-NOR9ENTRY: 00000000              ;Image Entry Point
-
-NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR10ADDRESS: 0x02780000          ;Image Flash Address
-NOR10NAME: uEnv.txt
-NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-NOR10LOAD: 00000000               ;Image Load Address
-NOR10ENTRY: 00000000              ;Image Entry Point
-
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
deleted file mode 100644
index def465e..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
+++ /dev/null
@@ -1,78 +0,0 @@
-TITLE: Versatile Express Images Configuration File
-
-[IMAGES]
-TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-
-NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR0ADDRESS: 0x00000000          ;Image Flash Address
-NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
-NOR0LOAD: 00000000               ;Image Load Address
-NOR0ENTRY: 00000000              ;Image Entry Point
-
-NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
-NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
-NOR1LOAD: 00000000               ;Image Load Address
-NOR1ENTRY: 00000000              ;Image Entry Point
-
-NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR2ADDRESS: 0x00500000          ;Image Flash Address
-NOR2FILE: \SOFTWARE\Image        ;Image File Name
-NOR2NAME: norkern                ;Rename kernel to norkern
-NOR2LOAD: 00000000               ;Image Load Address
-NOR2ENTRY: 00000000              ;Image Entry Point
-
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r2-xen.dtb  ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-
-NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x01D00000          ;Image Flash Address
-NOR4FILE: \SOFTWARE\xen          ;Image File Name
-NOR4NAME: xen
-NOR4LOAD: 00000000               ;Image Load Address
-NOR4ENTRY: 00000000              ;Image Entry Point
-
-NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR5ADDRESS: 0x025C0000          ;Image Flash Address
-NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
-NOR5LOAD: 00000000               ;Image Load Address
-NOR5ENTRY: 00000000              ;Image Entry Point
-
-NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR6ADDRESS: 0x03E40000          ;Image Flash Address
-NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
-NOR6LOAD: 00000000               ;Image Load Address
-NOR6ENTRY: 00000000              ;Image Entry Point
-
-NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
-NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
-NOR7NAME: startup.nsh
-NOR7LOAD: 00000000               ;Image Load Address
-NOR7ENTRY: 00000000              ;Image Entry Point
-
-NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
-NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
-NOR8NAME: BOOTENV
-NOR8LOAD: 00000000               ;Image Load Address
-NOR8ENTRY: 00000000              ;Image Entry Point
-
-NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02600000          ;Image Flash Address
-NOR9FILE: \SOFTWARE\selftest     ;Image File Name
-NOR9LOAD: 00000000               ;Image Load Address
-NOR9ENTRY: 00000000              ;Image Entry Point
-
-NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR10ADDRESS: 0x02780000          ;Image Flash Address
-NOR10NAME: uEnv.txt
-NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-NOR10LOAD: 00000000               ;Image Load Address
-NOR10ENTRY: 00000000              ;Image Entry Point
-
-
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
deleted file mode 100644
index 4307b69..0000000
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-xen_name=xen
-xen_addr=0x84000000
-uenvcmd=run mybootcmd
-mybootcmd=echo Loading custom boot command; \
-echo Loading kernel; \
-afs load ${kernel_name} ${kernel_addr} ; \
-if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kernel_name}; afs load ${kernel_alt_name} ${kernel_addr}; fi; \
-echo Loading device tree; \
-afs load  ${fdtfile} ${fdt_addr}; \
-if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfile}; \
-afs load ${fdt_alt_name} ${fdt_addr}; fi; fdt addr ${fdt_addr}; fdt resize; \
-echo Loading Xen; \
-afs load  ${xen_name} ${xen_addr}; \
-if test $? -eq 0; then echo Booting Xen; bootefi ${xen_addr} ${fdt_addr}; fi;
-
-- 
2.17.1

