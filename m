Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web11.15635.1594906664165715660
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 06:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PKZL0+Fb;
 spf=pass (domain: arm.com, ip: 40.107.22.74, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JavfhyXnYGxUPSchdNTxXRBY5oOXy7DkJSeOzW2Fis=;
 b=PKZL0+FbHWOrpg1yOgaREIJP89oBV/3ZT2/r+UFz/giv74k4KVb+xg1tFgfSWA8yW85kx+qPNpgsh/kI8bvqlk0kGRthcTG5dl6KIIXr0xAxUpsOTPt7AK/87npMrYjeTcICYVww/TNNrEZPbGk9DeYrTO0xsHlFBg5dKRDVKBw=
Received: from MR2P264CA0048.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::36) by
 VI1PR08MB3056.eurprd08.prod.outlook.com (2603:10a6:803:3d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17; Thu, 16 Jul 2020 13:37:40 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::a8) by MR2P264CA0048.outlook.office365.com
 (2603:10a6:500::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Thu, 16 Jul 2020 13:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 13:37:38 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Thu, 16 Jul 2020 13:37:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5665a412f11b5f1e
X-CR-MTA-TID: 64aa7808
Received: from fa00456fea1a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 679E2114-ADEC-4FE9-9495-3EBD9CDD7A5C.1;
	Thu, 16 Jul 2020 13:37:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fa00456fea1a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Jul 2020 13:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcblLtKeOJg3L/TVni6zPqr8mhpdwttH2jHgXOAPdXAYKPj2vJ69hLvvy/UFVzC3WUVDwuwVQvpg9RIjavWoAPwZXOS5l5LsKbmCqaK1tBieD87alyqquMkKdAU2WFwM3Q+ydkwP9RIFWnG6W6VXrISnn3/mRndrG0QdBLx1YFEOZ6KmpPBpJWGAdM5G9woJBRLx/gqAa4NlbNxCwSupRNjlM+lRp3Dp4KwL+6iJygs2wzCLKecltklV1PyHu+zOFB/2KUv9pgNGMQfhnkyPh4VctXiyHEZ87AlJ/iGa0RO6mPdNBL48/iu0qfriAmV+tX/ewXvvBEn4KCnxdrHKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JavfhyXnYGxUPSchdNTxXRBY5oOXy7DkJSeOzW2Fis=;
 b=WgoeFsCYOTu43sNYnltiF1SF9MNJiKXFrccH/6Ub6Yu7FamkFzVg6IVBH5XwaKpSLbVEX5FN0mI9zm110bI05zrnCtdEyfKsAR0LoO6RB2+D1ROEfB0zkl9AaTAU4Pg55OTcWxvUMNp32f5wnxPSYouAKK5pxjFmcBI7V0YvYoN1KvAmIM7b8fn6TG7ZfC8YHhYY275kLgYQdpz0wMNwnsQBt1FRepj1hOEKEj1F63gv3a9zARS11oirD0FSMi+HZlVXQVeRKQIVWl+JCHVbrRKJ3jDZXo0Dtn77v+jEDbDr7THRP+YnPZf98LwiKfjTQby6QnxgbE2vplAVbeNZig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JavfhyXnYGxUPSchdNTxXRBY5oOXy7DkJSeOzW2Fis=;
 b=PKZL0+FbHWOrpg1yOgaREIJP89oBV/3ZT2/r+UFz/giv74k4KVb+xg1tFgfSWA8yW85kx+qPNpgsh/kI8bvqlk0kGRthcTG5dl6KIIXr0xAxUpsOTPt7AK/87npMrYjeTcICYVww/TNNrEZPbGk9DeYrTO0xsHlFBg5dKRDVKBw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5345.eurprd08.prod.outlook.com (2603:10a6:208:18c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Thu, 16 Jul
 2020 13:37:31 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::e04c:44c6:7baf:a3b7]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::e04c:44c6:7baf:a3b7%7]) with mapi id 15.20.3174.027; Thu, 16 Jul 2020
 13:37:31 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/qemu: Install qemu-system-i386 instead of qemu-xen
Date: Thu, 16 Jul 2020 14:37:30 +0100
Message-Id: <1594906650-4962-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::20) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.49) by LO2P265CA0296.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 13:37:31 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8352338-6a25-486f-9856-08d8298d67e1
X-MS-TrafficTypeDiagnostic: AM0PR08MB5345:|VI1PR08MB3056:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3056F4895B1CB8D8AA9CF636927F0@VI1PR08MB3056.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mH7K3CPwSV6PTWim01KAaOWDvOfoNwWCbDQkDGz8bSYlm2hAT4dKmf8xLtteL/rRclMU9DxCXX6TnAV1eEd6+T2aNE42Pvz4bOrYu4E6+gKSvGPd3UGWoLFXkGV7+S5YH9ClC06tQIkoOl8DpNs0GR/X8Xh4MbIxV/fFi2lLy0KjlGyta3G4XGK/1HYhVqiAlo4dZj4CPGjW3GUh1u+s2lKwgQldA4yRnNF/eeW5PGYZjmZJGYLCxET313q/TrO7vFVP4dIkd2NTSHzU6PSCA560lVLLv6spMv5VEpGjsCVjAPPS7DbBpH9pqhC7vyTlPDdLxuz8fcsl16na/yb0Sw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(2616005)(16526019)(8676002)(8936002)(956004)(26005)(186003)(83380400001)(6916009)(478600001)(7696005)(52116002)(5660300002)(4326008)(2906002)(6486002)(44832011)(66476007)(66556008)(316002)(36756003)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 vvzaByeTZkfldHxsiZ7StB6anhIH7ELjjuZIjqSqbVENmBf9tCFJNx10z45yIX541y6MOZPdFFcsIjcbFK123UjHw67Llj3eGYYQbpmRf7Fuxrg1pW+z8rWBCPOsV8bL2XKUPwR9PJn1e+oc98fKRgsmQyJ9E84vSW1K5tT1DfGZ4wNH+NtM4BcKpCEhmFaURjBPGDmJWRMJBWCDLxaAAqXq322rH9PYiOjGrYTchyhH/rRRC9+q8xC0nWshh8IVhHEiYq69o2WxbsrEPgs0X/1SupfVwr2Q1Rym1TYYXOjyLaaDHZPLkDvAaVT+utlNSABwES4cQsybg87CKxoASo05IqaiIGqyUmBvu09r3plt4mspOY0ycdxxjPLuj2bPd0RlgYwau8saT8nk8XommbzUAD3dL2diqVGrx+JN1FMfeSAJvhvTCfCMiGzJX1YDgWl3+D+LXQRDFKXNtOU2RzZ1qr9G3YYV8SU7xs0P000Z16IROb8JKsT89soaCquu
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5345
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(4326008)(186003)(8936002)(956004)(336012)(6916009)(47076004)(5660300002)(83380400001)(81166007)(316002)(2906002)(16526019)(2616005)(70586007)(7696005)(70206006)(44832011)(36756003)(356005)(82310400002)(82740400003)(36906005)(478600001)(26005)(8676002)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7244ff02-9fdd-46d9-94a2-08d8298d63a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YZuo76XzCUNhaqjQpL6lFdYRGUIELsOJid6cCXz21ZLfhj3cfUu2AIN4E2M7CA8vtRd6SxCi7Xw1adPSKDinR+jzmS0tOXC1brzR8h1vnAoK2u0zvGBD506ni112y2r+yxaHAoSQODfW42gzFZ3Pq6Iy5L5iAM6+C2jgZZeR3ykMz6ho1SDT+1rBn0FDsMXzf0wEvYMRVI3lNmTx36sownvVC0rvYSGx23Gk6OCXSlAEVBcbjHcCjCh0r7brpyQHwmdW9FAZoYVo/ZbZeOz6l18bgLP5LVAv7qQwhDiLKi4cF2Dup7DcRnoHi87Eqdt7/03YTVTiDNjZgKs0DNSvE0dKCCl+vX4jqAsJoJv6jnXOADr47yFJ4SGSZPP25iQasDGy1ouD7uGb8/ovLYbkTg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 13:37:38.1717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8352338-6a25-486f-9856-08d8298d67e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3056
Content-Type: text/plain

This patch cleans the qemu_%.bbappend and uses the already provided
qemu-system-i386 package from meta-virtualization to include only the
/usr/bin/qemu-system-i386 binary.

Change-Id: I6f1fc4db458d0b09c54013c1512398521cb349e2
Issue-Id: SCM-889
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-core/images/arm-autonomy-host-image-minimal.bb   |  2 +-
 meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend      | 12 +++---------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 5b20fa0..9731c7c 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -39,7 +39,7 @@ ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??= ""
 IMAGE_INSTALL += " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
-    qemu-xen \
+    qemu-system-i386 \
     xenguest-manager \
     xenguest-network-bridge \
     "
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
index ed63a4e..dbd89aa 100644
--- a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
+++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
@@ -6,13 +6,7 @@ OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d
 QEMU_TARGETS_xen = "i386"
 
 PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
-PACKAGECONFIG_append_xen = " virtfs noaudio"
-PACKAGECONFIG_remove_xen = "sdl"
+PACKAGECONFIG_append_xen = " noaudio"
+PACKAGECONFIG_remove_xen = "fdt sdl kvm"
 
-# Reduce the qemu package size by splitting it into
-# qemu and qemu-xen packages
-PACKAGES_prepend_xen := "${PN}-xen"
-RDEPENDS_${PN}_xen += "${PN}-xen"
-FILES_${PN}-xen_xen = "${bindir}/qemu-system-i386"
-RDEPENDS_${PN}-xen_xen += "xen-tools-libxenstore xen-tools-libxenctrl \
-    xen-tools-libxenguest"
+require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'recipes-devtools/qemu/${BPN}-package-split.inc', '', d)}
-- 
2.7.4

