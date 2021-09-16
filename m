Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.68])
 by mx.groups.io with SMTP id smtpd.web11.740.1631811777796157158
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 10:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KGsFMBrr;
 spf=pass (domain: arm.com, ip: 40.107.21.68, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2lLSTf6v5EGsYCurKerYmX1O2Du5wjNm1NeyOMkOXo=;
 b=KGsFMBrrz03lo46gLvQR2B3gFLxw2fBOE9KTCF1h7Zq3AZ0UNdqqGyCuKfmAz5DWw2dpFvLI8WEhOAeqWDwCQtkwERr2LyiK6ZfRDVryOt4pDSjPmHtuEZr2HkRAx3oHDhQSTPUmnHtQ7geKlykLjQQ52SqTyEcAtK59w2aICfc=
Received: from AM6P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::25)
 by AM0PR08MB3764.eurprd08.prod.outlook.com (2603:10a6:208:ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 17:02:49 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::9f) by AM6P192CA0012.outlook.office365.com
 (2603:10a6:209:83::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 17:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:02:48 +0000
Received: ("Tessian outbound b324a1dbd9be:v103"); Thu, 16 Sep 2021 17:02:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f8b17389df296b2
X-CR-MTA-TID: 64aa7808
Received: from ff3caddefef1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5E40D825-F881-47E7-87C8-7B5C32A42FC4.1;
	Thu, 16 Sep 2021 17:02:36 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff3caddefef1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Sep 2021 17:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLYTo02eqhZvJzPgsByxHje6acCOJSPwbDO7g4IJpezm3Mh1otBcjFyTBjLR0atMa/QBSawuu3x/LK3X+Pvi8hXEczXF5xdj1TO77vVHXrJt9aHaXpblwWInyQYXFbBxAddKCFE8FOLSE04jIGZdD5XRsLu7lPfBCBAhD/klOeS2Q/XHG0qyNPVSNZy3Wx2vEujfn0Z7vt3IVuS544SZvQjg6vglSO00OOq2JOm310c4De/xWFbtQxLfW+vkL1oDECG5ELhdjvWzkI8x6wR4E3n4VX4lwxm4eSxNW0NJMxkTdz/8Dq07m99bapSl0swXJSx0AwBJ4y9/ce8hSwnqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=X2lLSTf6v5EGsYCurKerYmX1O2Du5wjNm1NeyOMkOXo=;
 b=fj35Cynbsrec8/fKJG1vteQw49N+viCqzUSgb9X8zutwlTKMx08F8wNesFw7zFli1thYngswiaPKsQ5yHdde4WxDGaR2rXGhvGDI1azD4PKIKxlRAV8x+Ajix72rXqlnFOxCI738AcFz+rlv7AsEs6YKRtIuEEGpdZ+stv20LoRhyd8TVjCbi8fTBHxOnJk3glQ5E9NTdRd10sFZScCShKD3oR3xzqlc/7N7yP1ynyXwJ8OGEzyVwVBQ33AXZLdvsf3S7F1AP7rtpTBx/DlBpXyZ1TMPW4NY/e6QK905XbuRUz71G5QTI7HoiTojeAEw20fZ0yCJSugf3sRh3z3JMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2lLSTf6v5EGsYCurKerYmX1O2Du5wjNm1NeyOMkOXo=;
 b=KGsFMBrrz03lo46gLvQR2B3gFLxw2fBOE9KTCF1h7Zq3AZ0UNdqqGyCuKfmAz5DWw2dpFvLI8WEhOAeqWDwCQtkwERr2LyiK6ZfRDVryOt4pDSjPmHtuEZr2HkRAx3oHDhQSTPUmnHtQ7geKlykLjQQ52SqTyEcAtK59w2aICfc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBAPR08MB5847.eurprd08.prod.outlook.com (2603:10a6:10:1a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 16 Sep
 2021 17:02:33 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d36:69bc:4803:eee3]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d36:69bc:4803:eee3%7]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 17:02:33 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm-autonomy: Add missing new override syntax
Date: Thu, 16 Sep 2021 19:02:10 +0200
Message-Id: <20210916170212.26705-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ae::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:02:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b10dc76a-faf8-47a8-4917-08d97933cfab
X-MS-TrafficTypeDiagnostic: DBAPR08MB5847:|AM0PR08MB3764:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3764E357DD59FE1238FD22F1FDDC9@AM0PR08MB3764.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kCsbHfWVDNzLj8X2N0hyp/9wKDC0hr2TrelqbLct+wa6mP7DeZt78uWuIKuhuwAct4WquTMmTwEgeQeUYCYedHVBWe0AEyO1lR2Ud4e7whb4hZxxej03sMAM/X9J/WLUtnA/glJb5sS8A0HLSbjh1G0lcOu/UrJvNaJN1Sb+EygRFQbVIzl1EKHEipbAAG//atUe3Bywq4VW9uaxUWRzkyp5PMxawcbTbgMw67g0zSRvP4h4VuQQQwu5dRilq5J6+XJS4nd8wVLdsovFD4Jjn6EwBX5t6zxHAmfW9BEcHnzaWYVFEo1PCQQgL0UMF/O96W92R5sp8qKmBZTJYGwX0WCin1jApOuFYhpS+WdfFoHEiDJiVR47l2T62UdQOrs5Yz0LbQtYL6WTLjW7POk1tVKvvNtY7hzErCmhy82zy8+NKq8xxD7yf6fGf5eRTTzYHhWilZF5o62VjoTTJtCfclkm1CjFdNfIjWZVwlZw3oqns9mcLCOQST9qNX9aeIkHHZmrOFfdU1Gidvai98LKmhNxxQ88Kgm4pkHQhFwpOR3yNuD3MP/8j2KdZtrYZQ1mCC8KoB8YW0CHIMteAW/aJ5kjw40nf5bmhcfeB2qMjkoubyK7BDtZ2Egv49fc2eVXUBxNf5cZUvYidzHYPwNSkj8XjBjLrMertzdJDnnp0dxnSaLl1P7DqYD1q6MVxeJRhjdmsAqM5D6nueK9TXQsmA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(66476007)(86362001)(5660300002)(8676002)(66556008)(66946007)(2616005)(52116002)(6666004)(83380400001)(478600001)(186003)(38100700002)(956004)(6916009)(44832011)(4326008)(8936002)(6486002)(26005)(316002)(2906002)(1076003)(38350700002)(7696005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5847
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b340e41e-71d5-4ab5-5a8c-08d97933c6ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KiPabFYO+Aa4FoidcvkXGgokvuuPO3Ohht0QRrYTFcqg1Jz6lmr26CVjUvCDtE3WzPG0sMkMNLSfYe8huOw/k5nvhdfJORrm8bApyeBCy/nmTbF6/T0/oRNZp1pbu42uRN/duXXrdqFu8Rz9nIv09HPEqp1q/mJ085ucJlRQzCDogycyerdTztD1VIG5wjiVKK8nF7Rxij7T2sG/DDUo/bhB4hSL1YgK3dQlkcQGm4xa+IxOeDrubtFPzA649u9JPHBF6448JaJOZD1SZYPSKF7m057TCTK9q7tj2Qjc+UXNz2+oIzjFSMPGuG46WUvnLaAJzsv4HskjRzNn6lHLZUHzOWSnToKQAqctR8yO63BDjFm8wim/CKOMK+Lvd2bYGtVmd7bknhRHfl5jiA+OV5bcXMHwqFN/ofVn3HQMeScV+99pptjSJZTEAqzGTmOPVhRb5OXdWsWUlbXPdz7YgarMpopLTML8DPt7cHqJ3diM4zL/a02I0cdlhbEgUFzbfx5RVqtqeX454nglvuKRa//Y0QGLAfUyFadXh32cQufcrZUGp2aI+kU0i4wLtZDDjkxNiCiiAbpSbxVkME+VDo+XTL4+4mAekRAk5ZeJitYS5+kh23Kd7GaO88cJnQZx2LV+NgwTG6ecsD75FB104oNKS01PbL3vNJQ/+4PYDCDf14kVBxzcNYTMRLKHfvywskMar13WgrB1kbeXXEsFMA==
X-Forefront-Antispam-Report: 
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(36756003)(336012)(5660300002)(956004)(2616005)(8936002)(6486002)(86362001)(186003)(1076003)(36860700001)(70586007)(82310400003)(81166007)(356005)(316002)(82740400003)(70206006)(6666004)(47076005)(478600001)(6916009)(4326008)(44832011)(8676002)(26005)(83380400001)(7696005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 17:02:48.3228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b10dc76a-faf8-47a8-4917-08d97933cfab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3764
Content-Type: text/plain

Issue-Id: SCM-2987
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: I8d200f1594005f0f9288683d4f1a5f31c2f29b44
---
 meta-arm-autonomy/classes/image_types_xenguest.bbclass      | 6 +++---
 .../recipes-bsp/images/firmware-image-juno.bbappend         | 2 +-
 meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend       | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-autonomy/classes/image_types_xenguest.bbclass b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
index 2b9505f..152658f 100644
--- a/meta-arm-autonomy/classes/image_types_xenguest.bbclass
+++ b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
@@ -22,7 +22,7 @@ xenguest_image_add_kernel() {
 # Add rootfs file to the image
 xenguest_image_add_rootfs() {
     call_xenguest_mkimage partial \
-        --disk-add-file=${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${IMAGE_TYPEDEP_xenguest}:rootfs.${IMAGE_TYPEDEP_xenguest}
+        --disk-add-file=${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${IMAGE_TYPEDEP:xenguest}:rootfs.${IMAGE_TYPEDEP:xenguest}
 }
 
 # Pack xenguest image
@@ -57,7 +57,7 @@ do_bootimg_xenguest[depends] += "xenguest-base-image:do_deploy"
 do_bootimg_xenguest[depends] += "${PN}:do_rootfs"
 
 # This set in python anonymous after, just set a default value here
-IMAGE_TYPEDEP_xenguest ?= "tar"
+IMAGE_TYPEDEP:xenguest ?= "tar"
 
 # We must not be built at rootfs build time because we need the kernel
 IMAGE_TYPES_MASKED += "xenguest"
@@ -158,7 +158,7 @@ python __anonymous() {
             # do_bootimg_xenguest will need the tar file
             d.appendVarFlag('do_bootimg_xenguest', 'depends', ' %s:do_image_tar' % (d.getVar('PN')))
             # set our TYPEDEP to the proper compression
-            d.setVar('IMAGE_TYPEDEP_xenguest', 'tar' + (rootfs_file.split('.tar', 1)[1] or ''))
+            d.setVar('IMAGE_TYPEDEP:xenguest', 'tar' + (rootfs_file.split('.tar', 1)[1] or ''))
 
         if kernel_needed:
             # Tell do_bootimg_xenguest to call xenguest_image_add_kernel
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
index f582b47..324c0c5 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
@@ -18,7 +18,7 @@ do_install:append:autonomy-host() {
 }
 
 DEPLOY_EXTRA_DEPS ??= ""
-DEPLOY_EXTRA_DEPS_autonomy-host = "xen:do_deploy xen-devicetree:do_deploy"
+DEPLOY_EXTRA_DEPS:autonomy-host = "xen:do_deploy xen-devicetree:do_deploy"
 
 do_deploy[depends] += "${DEPLOY_EXTRA_DEPS}"
 
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index 36e0236..0cece2b 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -5,6 +5,6 @@ OVERRIDES:append = "${ARM_AUTONOMY_HOST_OVERRIDES}"
 # Make Xen machine specific
 # This ensures that sstate is properly handled and that each machine can have
 # its own configuration
-PACKAGE_ARCH_autonomy-host = "${MACHINE_ARCH}"
+PACKAGE_ARCH:autonomy-host = "${MACHINE_ARCH}"
 
 PACKAGECONFIG:remove:autonomy-host = "sdl"
-- 
2.17.1

