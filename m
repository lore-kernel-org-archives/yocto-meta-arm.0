Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.85])
 by mx.groups.io with SMTP id smtpd.web11.3273.1588847614547794609
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 03:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QFHbQ6qq;
 spf=pass (domain: arm.com, ip: 40.107.7.85, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D22fRoYUkwbvKiAjXdWuEuqShcIHNVRBu6G+3IACN2M=;
 b=QFHbQ6qq2l1abgTaCIThL2BPAwLT1OTCBwrurdF1Dr7DwfTtLDeXolsGPLNL7bwl1Om4c55nK2hjHso8zmPLuQ5CDu4nQjzjE0HaY7dt0DlVh8QcgAFrAmsaSHf90Ez2hjV2WXelBYMTuyZjg2u8NTwECpy8QY+olKM/ZpcfMaw=
Received: from AM6P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::41)
 by DB8PR08MB4057.eurprd08.prod.outlook.com (2603:10a6:10:a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Thu, 7 May
 2020 10:33:30 +0000
Received: from AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::a7) by AM6P195CA0028.outlook.office365.com
 (2603:10a6:209:81::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Thu, 7 May 2020 10:33:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT053.mail.protection.outlook.com (10.152.16.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 10:33:30 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Thu, 07 May 2020 10:33:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 06faf6b53b273ca9
X-CR-MTA-TID: 64aa7808
Received: from c31c68388bb9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 369F3491-F38E-497B-B2CA-16E0E7CCE4BB.1;
	Thu, 07 May 2020 10:33:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c31c68388bb9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 10:33:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTbNOhcfbIDzvN/uGUqLikM14u2yceHqVoAPMBMbtGc+d1uL47ihuMywT1HRR7R+3qeAnuC3YkXoZZpyNwcEsWOk7K/GhTyeDoENh2PJzIYhNaT127UBjsjvGzV+Y/A2sHaJnf1MVy1Js8ztKjKtZq22XTHMaR2rcOTNzX8ABlTlIsfL6Qwg6UiozDGZ7Mex+6ezCqT0E6xNiFDDO39aNNM0pK98akJSLSNnmKSHcRqD3Bu++XIZkf1Gh2GzCB/9nr76/Aeqm9Zg+z7+ryL4BQnDhl89jCKgLOgau3LlguPvCu6rBf2qZkUuyc57lship10RE+LpmejhQUqpQX9osQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D22fRoYUkwbvKiAjXdWuEuqShcIHNVRBu6G+3IACN2M=;
 b=gFvrkYxJ7yBOHigSBz9a9TpOtr4hkQ+ZxfHew/ssBX8PkI1qASJ8DlyZ1GKkjrZ0S6+gFkOwozHhqNzr/67dcvkv192LXb03OgiTvPMorlSwSjGietWY7WUsv4w94UiN+d7RdgHtqXN6uAPr4sMqt5qGaNSdVYOSy+EIM0Xsn2dHdmhivgEXiM89HkfoWxAM2NCUVJS0ehekgWCgFdtyYU71JbUrEyYUltj5OL97B6zZQEFegcGwxLLXTEQ2yZ5SFdL4F7tLvjoEdNHGIwuuy+ZOmJ4RBLs4KCECpIj1pF/4Rqe16GyubJR6jiHjEENYazS9w2ylrGKr0sEZxYLn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D22fRoYUkwbvKiAjXdWuEuqShcIHNVRBu6G+3IACN2M=;
 b=QFHbQ6qq2l1abgTaCIThL2BPAwLT1OTCBwrurdF1Dr7DwfTtLDeXolsGPLNL7bwl1Om4c55nK2hjHso8zmPLuQ5CDu4nQjzjE0HaY7dt0DlVh8QcgAFrAmsaSHf90Ez2hjV2WXelBYMTuyZjg2u8NTwECpy8QY+olKM/ZpcfMaw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3017.eurprd08.prod.outlook.com (2603:10a6:5:1f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Thu, 7 May
 2020 10:33:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 10:33:23 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-autonomy] firmware-image-juno: Add xen-devicetree dependency
Date: Thu,  7 May 2020 11:30:29 +0100
Message-Id: <20200507103029.38305-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::31) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0043.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 10:33:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae23bc93-5469-4776-7910-08d7f27215e3
X-MS-TrafficTypeDiagnostic: DB7PR08MB3017:|DB8PR08MB4057:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB4057C8F12B901CA345252CFD9DA50@DB8PR08MB4057.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6+lHZp/aaFisuoralxjsnVdH2gvLBWh/0/BmrPobq54oKORAKcTD6E7S45hcf+AChZ349qtMcSHWW5VBT+EuVCHtxAIsIHD09yH4dUjSoUcmhgwY1lDb2HE/wG1FjjYsQ8aYQxRr/Wnj5rBXvx09UoGTrhgWapzYXdqSWq6DwnvxgD4ucY6lIjd0w6004Tq1vrW1uxuJDrrL0dCl7eaIaNYiKnXAz6v7eGbTJ2/8JbWaScEkcVRCQfqfRJ4lBGS/ITVeirPtpaz/Xi9eOayPOzzCYmwoDNLz7nyL9y2VnuEq4Voez6xz12ZRJUL1yK/bvkY6HbmiZP9QmKVU+r7rF046ThOUjbg4IdWNlPodzhLj1VB4s5RQU0bYGyVMTI2RTWDF+PP+ZFm7AiKKIQWyFuTfvlNBb+imgKm9GJN0HcGPPCpPsGSJospuHcZ0YD1GpfVRXmGS89ix92IF63xJfaiXsQBDaruqYTBVnGGhXg8wIb1IIuEU7CIoK5wVvB9cH9/+pgiIqS9CGBuWSGSCuw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(33430700001)(33440700001)(498600001)(1076003)(6486002)(6916009)(4326008)(66556008)(16526019)(186003)(26005)(66476007)(36756003)(2616005)(956004)(44832011)(86362001)(83320400001)(83280400001)(83310400001)(5660300002)(52116002)(8676002)(7696005)(8936002)(2906002)(83300400001)(83290400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 9EfOPzXsOO3SRR0kqWubrglOhR487JWtnjUde/HosuHEgGYoAI6DL3JrYeUOA1vKj01XBKBu2ATShqDNLhbkvsGnEvHwsitUey711Lw2zaOiYecOBJIuRDgbFm8gO4u+b9qhV85JsD07mZL/UkE2HQ/lbgRNzW+s1TlMmAJTbku8AU4vbnaOdjwHOKvjKskuAifA8Grm8clkoiBRrgWfCoZVXmROORNFy+/4UpoEHP1K0RQ7FBMkv43Saw82ldLPUCLWHIKLvE+1dGhsAjM8yIILUj8nWdubO2RnRhO+SkUkJlPjjzW9GRxtqROZSVZhIz0ympfgikoqNcOMIzwXdL7NLFe8n919zVO5TvNubuLXgpJcj5QwKrvZ5+3BcWDDqQhuUXahK01ONur9nd0z6w7s7/ETNXhKoxFyMRJEXYNAl23l/epzl1bk0PSPHbnhhn7MeiMSGhCnoR+dKPGR7pvPjDVLPDcR3sndqZZA3SciloZ2HYkveYedMFm0rVqTI7laWvaj/2GkEBPGcfVxL8WKI3sIDyQZldUq+/nNB2QCqiyuHYIOhWA23KEYOCI2gXy/EeZzkh0GxIUxFuQCtkU+w6UvKmFirvNjU3OSvXU04XNrjvQZ700BIF3SxC+B0f2sA5xltx9ET3WiRbXnYpBZj0TOGh/8VMLo+RVZlKerZsJHvlJko4bomALphD14tN3YwQhTxYhPxxbJlccHQ5ylDOzYA/CMK1A2OwX+k6wD44/KzDgEoJKUCcCD3oat/93ovYUJWXk6BVbGKKGnNnWA2YMj3imW+VfJjRx5AQk=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3017
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(33430700001)(44832011)(26005)(6916009)(7696005)(33440700001)(186003)(70586007)(16526019)(5660300002)(70206006)(956004)(1076003)(336012)(4326008)(36906005)(316002)(2616005)(478600001)(82310400002)(8936002)(81166007)(356005)(36756003)(47076004)(6486002)(2906002)(86362001)(82740400003)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb50f252-360a-4f17-bccf-08d7f2721160
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	68LdBi8eb7Km9vv//Dz/Y7s5yLsnsZacn8cDGow2N97XXY0VmVJiRCH4lloPTwtIQW8ul99mskCDAjh9pSlYTCp1BhPWOWh+HA81rkoJ1AYBnoH8OvzyEdYm24bEt80JqRE245H3Eg76uViDmH54AqjgmwQ1OSEKo63HnZREJStPNz3dU6Eix9PvracFsiHcB47EkoIxuDoIyytK2o0+ETh32yf88nAv4IIHs75gO/3fuoPogV0o5BIlAWfRIeDSGFYlkvDIb23Bcb9tp7gA53EBhKSH9s6o7GB6eBcfzzlGSRMCltCEuuMTIwiV17N2272oj7kTNrDpSV3lCMf4/j6sXZqVdaeoUg7CsxkdXYEIW/XBYrmMry9GHCpmQPLFsrCB/L+l7ulpDpmE6PdCg7qqmIHcGRhT04HIxrk7qPAjYxjzzbSKmtGkGaO4yoZ1mGoalAcsEacbsILYXBzxaH0zor0ze6FejZ14zHsyc0vIj4VfrE9nLhVXJyh9ufCIg3sR+HrO18FNgGBK2p9Rgd0NrgyXYUV6XoDj8uX+qAw2S7WoucPGJOTm+YtmZkRYYzEU7ik2xlkgKPxupvqelQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 10:33:30.3067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae23bc93-5469-4776-7910-08d7f27215e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4057
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

The do_deploy task depends on xen-devicetree:do_deploy in order to
include the generated xen dtbs in the firmware image.
To avoid dependency loop between firmware-image-juno:do_install,
xen:do_deploy and xen-devicetree:do_deploy when
INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
xen-devicetree binaries copying in the do_deploy task.

Also Use OVERRIDES to minimize the usage of
"@bb.utils.contains('DISTRO_FEATURES', 'xen', ..."

Change-Id: I8da476435de73445fb6d895ec418d85861b8c46c
Issue-Id: SCM-990
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../images/firmware-image-juno.bbappend       | 27 ++++++++++++-------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
index 2904e0b..b0aae69 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
@@ -1,14 +1,21 @@
-FILESEXTRAPATHS_prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/${PN}:', '', d)}"
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
+OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d)}"
 
-INSTALL_EXTRA_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen:do_deploy', '', d)}"
+FILESEXTRAPATHS_prepend_xen := "${THISDIR}/${PN}:"
 
-do_install[depends] += "${INSTALL_EXTRA_DEPS}"
+DEPLOY_EXTRA_DEPS ??= ""
+DEPLOY_EXTRA_DEPS_xen = "xen:do_deploy xen-devicetree:do_deploy"
 
-do_install_append() {
-    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
-        cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
-            ${D}/${UNPACK_DIR}/SOFTWARE/xen
-        cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
-            ${D}/${UNPACK_DIR}/SOFTWARE/
-    fi
+do_deploy[depends] += "${DEPLOY_EXTRA_DEPS}"
+
+do_deploy_prepend_xen() {
+    # To avoid dependency loop between firmware-image-juno:do_install,
+    # xen:do_deploy and xen-devicetree:do_deploy when
+    # INITRAMFS_IMAGE_BUNDLE = "1", we need to handle the xen and
+    # xen-devicetree binaries copying in the do_deploy task.
+    cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
+        ${D}/${UNPACK_DIR}/SOFTWARE/xen
+    cp ${DEPLOY_DIR_IMAGE}/*xen.dtb \
+        ${D}/${UNPACK_DIR}/SOFTWARE/
 }
-- 
2.17.1

