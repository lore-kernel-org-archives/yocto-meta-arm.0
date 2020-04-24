Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web11.1015.1587710988006955096
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2020 23:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=x4gkLE9V;
 spf=pass (domain: arm.com, ip: 40.107.21.71, mailfrom: vineeth.raveendran@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6r+RE4n0zBJpizuHdC1c/2eO3PeEw6lxoIX46aMHiU=;
 b=x4gkLE9Vg5jlh8RMM2Qia1QrX9k5m6bP96fSIrxZwtWtS+OjwzigolfY4JeaW71//0OVrgq4xG4eHIph5lxZP1CYBoZCRlNlKC60HRdAPuQZAtZwxQ8WHx3hYkc6tRqZkRdy89nMhfYVXz0tK3/S8WskTFF+5dodxZpiS6NWjnU=
Received: from AM0PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:208:3e::24)
 by VI1PR08MB4096.eurprd08.prod.outlook.com (2603:10a6:803:e1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 06:49:43 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::dd) by AM0PR02CA0011.outlook.office365.com
 (2603:10a6:208:3e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Fri, 24 Apr 2020 06:49:43 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.19 via Frontend Transport; Fri, 24 Apr 2020 06:49:42 +0000
Received: ("Tessian outbound 43fc5cd677c4:v53"); Fri, 24 Apr 2020 06:49:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ff0da1dcf091213
X-CR-MTA-TID: 64aa7808
Received: from 534c94885b40.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 381D368D-AC32-4023-880B-41B53FB201CF.1;
	Fri, 24 Apr 2020 06:49:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 534c94885b40.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Apr 2020 06:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXWHwgZQpMxQUZ06SGkwL/VjQSEMxYvv5rss02XIsbUt7zMwuxBvD5laOC8Yv/hsyq7jv1fOEjJDuk+sn9S0JnAfqekPESSNu3vFhTmoHvvWsqbFKlknuBrQcEvwiXmSy7xEeYouZaMS8KuSi1+0ZS4Oj5tx5mpOQCfbdrnB3Bv3gwxMFf745jTyvutaiks/VqE7PRxR83tTHlI2gK1GKvYcAfMqWVBc/ZTJWTFW34I4zv6T0q5dWANeOrnN9jvlFlsTibQRHOHS1AcaZ75Ny11K90rms6Sp4XyIfB6lGpUnvVBA8ypWbSrA/z8YshB67JSrNQ1AOliQnTw6vfi0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6r+RE4n0zBJpizuHdC1c/2eO3PeEw6lxoIX46aMHiU=;
 b=F48G8JJLRTVhCxUJUR5E87tkOJbiPerW90JNd/xfX0YjrQYs9IMPx6GI8f3ICf6MTGOpO+ynwcdTavNxpzZWOYL7qJDCzsLH19Euj3kl5wtmYgVyou1z9Qo0IHuQ4RVHiHbSSfPK4Ju67OlRIxm5+mNrsr03Jt6qfjnO2A1s6RaLPyPEVTeKYLNYQ26vwn1bv5IADuuFhVJXd7y8OC/JbiZJ/zLifye3ZZLOlgkYGZa0zS+uNpceQB4WVXCgpb36yG2PkSAD6Y3dPCAOFnH2fnmQ2mKdVPAvYTOXBY6OhhUoW8OJqG/PLKdqqDgpI2FiLk77smAmMP7iQjwsb7hgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6r+RE4n0zBJpizuHdC1c/2eO3PeEw6lxoIX46aMHiU=;
 b=x4gkLE9Vg5jlh8RMM2Qia1QrX9k5m6bP96fSIrxZwtWtS+OjwzigolfY4JeaW71//0OVrgq4xG4eHIph5lxZP1CYBoZCRlNlKC60HRdAPuQZAtZwxQ8WHx3hYkc6tRqZkRdy89nMhfYVXz0tK3/S8WskTFF+5dodxZpiS6NWjnU=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Vineeth.Raveendran@arm.com; 
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (2603:10a6:803:bf::19)
 by VI1PR08MB3630.eurprd08.prod.outlook.com (2603:10a6:803:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 06:49:35 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c%3]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 06:49:35 +0000
From: "Vineeth Raveendran" <vineeth.raveendran@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy: add compatibility to dunfell
Date: Fri, 24 Apr 2020 07:49:21 +0100
Message-Id: <20200424064921.30088-1-vineeth.raveendran@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::28) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:bf::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123640.arm.com (217.140.99.251) by LO2P265CA0184.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Fri, 24 Apr 2020 06:49:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f0d7d566-bc12-4b3e-4cff-08d7e81bab33
X-MS-TrafficTypeDiagnostic: VI1PR08MB3630:|VI1PR08MB4096:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4096B567CB9247C316EC4BEB9AD00@VI1PR08MB4096.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 03838E948C
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(16526019)(5660300002)(8936002)(478600001)(6916009)(44832011)(86362001)(6666004)(1076003)(81156014)(2616005)(186003)(8676002)(26005)(956004)(36756003)(2906002)(66476007)(6486002)(66556008)(4326008)(316002)(7696005)(66946007)(52116002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 S9r2DzhXTHxA4w5q9joLHbjEgeKhfqN+zd0Zc0sdZ3dnhFpgMHRYBI4q7++XQz2sgMw/QHuKIq2QjuvepAC8n6Qax7Lz1AmkbwO6n+Hz6dfd6mWknETIyt2pW/8cmUf2n5l2CiGUnkrdPh/M36hi4ujhyiRGxyW9FInDhAJGIl764feFzPcEa6AYFsucU1w7xmPO+pCX1E0nqVXsm130VjR+mpJqj8aJbZPvMRPF2yLCnKgKB2M0DKzIRXHhOlkCgDcwiRoLl4NJro6sYPg6sTmdiKsKV4R0Z8x/77g1z7OaLqjP4Mm3I0g/MtooqSXLyk8Wcn9UhSdO7s8dBXb3Nz0Y84gqOj40ihca+VVf1Uxi9ePeqZpC6FKPOfV0pZDy1sbrgGhe5oR3ickVwqDyqxTrAX04J4Oyu6bMQwq/nYd5K7nuqH/kZpfl8EGAQPoN
X-MS-Exchange-AntiSpam-MessageData: 
 z+NQOTLpv90YPi7GWqp5A88PBsKWipznc4pp5lupZ1p1d+HXMnoxRqR72JihjuG3B7tAsGeiwrugS9D4ORh4CrVh8pUaQa+zxaNRUdr5uCbQH2Tx2F1AvETlHBccT8etoC3ZNMNk5zee/KEYmgN2zg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3630
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Vineeth.Raveendran@arm.com; 
Return-Path: Vineeth.Raveendran@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(478600001)(82310400002)(36906005)(356005)(81166007)(2616005)(7696005)(336012)(316002)(36756003)(16526019)(82740400003)(47076004)(186003)(26005)(956004)(8676002)(86362001)(6486002)(81156014)(5660300002)(6916009)(8936002)(6666004)(70206006)(4326008)(2906002)(44832011)(70586007)(1076003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0aac3234-5aca-4037-84f2-08d7e81ba6ca
X-Forefront-PRVS: 03838E948C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ylz4a5eUul/1LV+xGZ5vUvR1WEzZakkRBL/4odSinytfT5tKTUgXdPQmQxgWSyv4auVTVMk3EWH+hL3+vixgkGGPXTCgT+OCtDK1jK1ueIyDwin8vhhycuOyLE45cEK4bs51A0xrnjkptX6sZBGr7CIUuwrWo6UKtNDhIbLCLz+eYCaIIbHOvbRIj2fbPODcDMqaH/jDXU7/MIW4rK+F9CBjxPXYkFntBEshwlFIuUbFOfd9lOA3e1YFAen6hn++bieziOy5pm+JfqMgxrOMi7i2dFxrXnUCh7Mh9LpQEmcCY6JUaXAthpGdq/r1hKptBL7Au8s9YuGJ89ZTfpZIUzyHWylNZYCsf0xBZQZVdetsUjzFJQcrkmL51uD7UTdz8dtyFSczNCWTjMu7O/CqhJgyNHwBDXhICltYttp7TRACTXt1mi+WCRXag4wJ+yM8O4eyPPiB8BtEpIExPy6vU6loZrwbxsDhLGkqp4BNNPpetEqS/tq4NG7aOmVIyKW0qlE/kLDQ19+l0VnO1w4vBA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 06:49:42.9621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d7d566-bc12-4b3e-4cff-08d7e81bab33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4096
Content-Type: text/plain

    - Remove xen-base from image as it's included via
      xenguest-manager rdepends
    - Use xen-tools in xenguest-manager rdepends for the required
      xen tools and use xen-base only for zeus as it was changed
      in meta-virtualization.
    - Move xen bbappend as recipe was renamed in meta-virtualization.

Change-Id: I439bde0df2c0a16f529436b65f1a96af5a2981af
Issue-Id: SCM-833
Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
---
 meta-arm-autonomy/conf/layer.conf                            | 2 +-
 .../recipes-core/images/arm-autonomy-host-image-minimal.bb   | 1 -
 .../xen/{xen_4.%.bbappend => xen_%.bbappend}                 | 0
 .../recipes-extended/xenguest/xenguest-manager.bb            | 5 ++++-
 4 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-arm-autonomy/recipes-extended/xen/{xen_4.%.bbappend => xen_%.bbappend} (100%)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 19f24ad..de79bdf 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
    openembedded-layer \
    virtualization-layer \
 "
-LAYERSERIES_COMPAT_meta-arm-autonomy = "zeus"
+LAYERSERIES_COMPAT_meta-arm-autonomy = "zeus dunfell"
 
 # We don't activate virtualization feature from meta-virtualization as it
 # brings in lots of stuff we don't need. We need to disable the sanity check
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 978b58f..727abf2 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -39,7 +39,6 @@ IMAGE_INSTALL += " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
     kernel-modules \
-    xen-base \
     qemu \
     xenguest-manager \
     xenguest-network-bridge \
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
rename to meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index 9affae9..2e040a8 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -46,7 +46,10 @@ do_install() {
 }
 
 # Things that we need on the target
-RDEPENDS_${PN} += "bash tar xenguest-mkimage lvm2 xen-xl parted e2fsprogs"
+RDEPENDS_${PN} += "bash tar xenguest-mkimage lvm2 parted e2fsprogs"
+
+# Extend RDEPENDS based on the yocto version we are running against
+RDEPENDS_${PN} += "${@bb.utils.contains('LAYERSERIES_CORENAMES', 'zeus', 'xen-base', 'xen-tools', d)}"
 
 FILES_${PN} += "${bindir}/xenguest-manager \
                ${sysconfdir}/xenguest"
-- 
2.17.1

