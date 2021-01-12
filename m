Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.41])
 by mx.groups.io with SMTP id smtpd.web11.8280.1610454920016385025
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 04:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GffdadCK;
 spf=pass (domain: arm.com, ip: 40.107.1.41, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8TQmZikNO73WcOLtZWGtIprgUi1sSsWfGafPR1yLDM=;
 b=GffdadCKsLawPjagkCII6yjUfhWkY+pJa2co6AX3OPMvLeF1bp1oiBdshE+LCpFiYFK/FkaXr46d3IdAvf4es8i/bloHrb17yffQXTUJtPOziCHLZGhI6ekcwAzriuoGgC+vabI0ohba/TMIolfddod/cdopyEd+8vjEmakpQxk=
Received: from AM6P193CA0108.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::49)
 by AM5PR0802MB2547.eurprd08.prod.outlook.com (2603:10a6:203:a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 12:35:17 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::dc) by AM6P193CA0108.outlook.office365.com
 (2603:10a6:209:88::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 12:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 12:35:16 +0000
Received: ("Tessian outbound 4d8113405d55:v71"); Tue, 12 Jan 2021 12:35:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 741b4aed7eca482f
X-CR-MTA-TID: 64aa7808
Received: from 47ec316c4fbf.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 26CCF076-AF4E-4904-8B8E-6B6286BF72C7.1;
	Tue, 12 Jan 2021 12:35:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 47ec316c4fbf.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 12:35:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwBEx/KHlfJR24vC+zfkoKUlwPHcc3wLt1OIyXZ8UkKVzj01qVT33gkidKNB8pWCISEGg7ezfVuGAAjUH7m4WN5npd5GQTKK7SPIeJ/wGJYD43Duo+SM0uK7XU5HLO2u64JcYkNJCO3eF64ZWIvYLxy+ohq/QCI484lHfvLb7T1qveNuvP3s4HMairFKYryIi6mWT32s5pERxoBTgTOvd8lXkz43LN7KNU9eKq/FZ/WbqO2UGPQAQTI6WiK+VL6j0P5rQDZr+yl/y83pqDRm9QrsPa9JhhYnob+FfbZbIY50slKzl0L2YtUAZuJ3LY7LfG20tnHhmjkyqmq1cLKI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8TQmZikNO73WcOLtZWGtIprgUi1sSsWfGafPR1yLDM=;
 b=WZq+W/5RI1kZDTwkCZyO3AObMbZUoLNy/h6Iw9KLstpahgEBrQNANYxSvrXjFDhWxqpn7s76+94A6AAkUIYg+BT9xvyTAFxu+XzBp450T/62CMCcIv/ex2IEqXm1d5H2aCWTSYl4UyAfaM56Jt9C+PVzd7lQkZIeO3XZJn9a/n5iRmP8yArz8tVoaOSdgpEpUDWF/1EBa0SnEegYlE5I9C98N3L5GsANzg3htwKYIgxADGDqfnE9Z8pEw5YHmZQdZxEyj6j7frVPdGaZC5wpMte5BgAbC7FleplJvFUAE5lNn+eYcaqpuoj1ivLcFC8p9Kaph2p07lEcA9RM4S606A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8TQmZikNO73WcOLtZWGtIprgUi1sSsWfGafPR1yLDM=;
 b=GffdadCKsLawPjagkCII6yjUfhWkY+pJa2co6AX3OPMvLeF1bp1oiBdshE+LCpFiYFK/FkaXr46d3IdAvf4es8i/bloHrb17yffQXTUJtPOziCHLZGhI6ekcwAzriuoGgC+vabI0ohba/TMIolfddod/cdopyEd+8vjEmakpQxk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12)
 by AM0PR08MB5508.eurprd08.prod.outlook.com (2603:10a6:208:186::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 12:35:09 +0000
Received: from AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::2d25:da35:b9cf:43f6]) by AM0PR08MB5506.eurprd08.prod.outlook.com
 ([fe80::2d25:da35:b9cf:43f6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 12:35:09 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/fvp-base*: move to u-boot 2020.10
Date: Tue, 12 Jan 2021 12:34:52 +0000
Message-Id: <20210112123452.12408-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::34) To AM0PR08MB5506.eurprd08.prod.outlook.com
 (2603:10a6:208:17e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.49) by LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 12:35:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7184f26-464d-499a-0fda-08d8b6f68415
X-MS-TrafficTypeDiagnostic: AM0PR08MB5508:|AM5PR0802MB2547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2547062EB51A97AD16923A1A89AA0@AM5PR0802MB2547.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:144;OLM:144;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 U0agy9JBRHrxB8oaw5dxxESaAcqnfeHIf6eoNwkGM8EowaRNhHnBE10pcRTRht0SpQ/uqb5wrfhlxYQvLqLYuV0nwpqRr2y7gqcqJ10VfsekreoK3zjFKoVQOcvvWb3v+z2jCk7b1W/KtdKpkZEuVCkmf1eUO4ph5YD49f/MODzSg+834ObkqWQ4sMNqh62DxHCWGL91nov77zgQpe1uHhcuEmkA04twxPSmxPOov3vhORGMp7yKerFbPBwfnlr4qfob+gzE18N0qbH+1aSb6vdhsD5MsJAPb092R+ZJPxoa8MtBRL4V6nsASl9Izuy296gIdFlVzqbELYnDN/WqG7McRoF1/6w6nRV/U9hVeJNYUKCki57IKSZiCCZZVgAc10bXm+BbniHNNwiGMaPZ1A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB5506.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(6666004)(7696005)(8676002)(8936002)(52116002)(66946007)(86362001)(83380400001)(6916009)(4326008)(44832011)(316002)(6486002)(5660300002)(1076003)(36756003)(66476007)(2906002)(66556008)(478600001)(956004)(186003)(26005)(16526019)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?7sv3bn53QIRT9xi7EIbD8qxmUR6UxDDE5hGnIIlVoNW+wlQg2+HvpXZBurfD?=
 =?us-ascii?Q?YPVd0WSoAHNSCxTqgAoD3+WWUK2PZOcQux2MooApK0rrZ4vkP5ZnumV7AJYa?=
 =?us-ascii?Q?Ws8L7H8L2O5ts/ha0CFCJZwHk//9X/Qbij914RK8rdwXc8yYp2IvxwxHmXCT?=
 =?us-ascii?Q?VOZU/k6Oya3arRrpQma/ObEHorWEN8GrG9ZqhDMv3X5aHdvh7WNBRtIYe4Lf?=
 =?us-ascii?Q?t6+Som5IhNp9l5bF7Kv1P4sgP7FM1SRhmiDym+7ZsqgynlSkQQPeoYiy8uKw?=
 =?us-ascii?Q?u1LZRnOhcZdN09eC67gkW93PjZYSE6KHWKgUgKegAH/ofeTqUeMTeTWGUmd5?=
 =?us-ascii?Q?CpMFrFOJW/nuuSZEXtzFOAg5DBwisjRZAbmgh9h9nffnUqdkOHX4240EZT10?=
 =?us-ascii?Q?x4jgc24K6/47sE0w35hYvI6VuABJu6yYZPV65KmlqjziyCqArRSuVk4WJrIZ?=
 =?us-ascii?Q?CxOVOEREFo7PrDNDZB8EnpMyqiO7EvZUjiojmQgvjSf0BTlxsmjo8Tit/EuP?=
 =?us-ascii?Q?TmaZWxmaNzKlyEiyvqz6x5aFI1pNg5nCZbA5QNAsuEqOTtzTpFCQvi1UnvnN?=
 =?us-ascii?Q?NI88cti2RczfzXpplkMe6cpinz9Q2x7jQSIrCox9lsh7d917Oy5zBK1TyHlT?=
 =?us-ascii?Q?oAc+4tvuvcnfbmwaQC30XE1jZEJ15dS9ovvs20QcP6JgbwNUuIBgVtQuvncs?=
 =?us-ascii?Q?TImWzfeljxc+43t5xDTAcRwd1vcdFtnZMJhT8hjNNCUhCS7zAx/e4hYECA6v?=
 =?us-ascii?Q?evipzj302iTftdz4f7MCp5L4gqDACz85DvAmN0huUzLokn1uS2eWqsDL6+0Y?=
 =?us-ascii?Q?MTVw8WzMvBBPzfg3KwGvjd2Hie5K7ObMXRcMRmLsJOs9fh5o5Vm6ixj/sjWA?=
 =?us-ascii?Q?xvmVjTASwBzmdPL5h6KipyVNSQDPs+lHVa2dtGtqcUiFcgO+Bkfz5TgHSDbx?=
 =?us-ascii?Q?KQUPLpG+oLpzVU9jzV+g3nxbERI21yooeX09UznrS53UE8lqU78G61t39XAk?=
 =?us-ascii?Q?9byY?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5508
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	426ba989-a2cb-4baf-8f60-08d8b6f67fc5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y8YzWy0CVZ9eS/JZAYF0Mdhtpy8B8m/snp1JCCGzFS8qQPNBcvJujzoIiNRvYt02gvGnfK2Vd6nmlysXNpeiPBxBtqJ+dy8qEl/LH4YjzkUy1pA1zZZgs0m/r2VIFT4OhBrA5I1wHAgIq+Eb8Wu+Be9JAdUMD3DcSsbmC37OnIKCbLQOG5M6jbk2BGejNlkZHuzIZKqjvejZ3/HEEGQOSloXK2OrbW/ifwQzmKmanfgSJlHGRppfriF+LnZSjNA0bLJj8xDCKDJAdKRUT2RBwYNok8z0CCOMyV4V495YyRiLmV1TiQFhKOfTF6bE5bV44kcqt93cPx6TDiQOJ9Za7nbuvMjlgbw2GPFwy7I9H2AWwb4A6tpCgB0YR08mjFDe1owMfvTY4X63on9a9WkLxCFOzLQnHUYkE6tldw353xjkqAM2cQ3Tisxym9PoZXRP9zTlRxtDW35SCmJTZj65VJ6QWuLQEXSC4ygY2pCjqFsyZf2Q8Vr+2sPSj9O4zGF/
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(34020700004)(82740400003)(47076005)(336012)(7696005)(2616005)(186003)(2906002)(36756003)(356005)(16526019)(6666004)(4326008)(44832011)(8676002)(26005)(82310400003)(316002)(5660300002)(6486002)(8936002)(86362001)(83380400001)(6916009)(70206006)(70586007)(81166007)(478600001)(956004)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 12:35:16.5838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7184f26-464d-499a-0fda-08d8b6f68415
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2547
Content-Type: text/plain

Move both FVP platforms to u-boot 2020.10

Change-Id: If94bb5a343e2709574f84283f39d8d227b32d84d
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc            |  2 +-
 .../0001-Add-vexpress_aemv8a_aarch32-variant.patch  |  0
 .../fvp-base}/u-boot_vexpress_fvp.patch             |  0
 .../recipes-bsp/u-boot/u-boot_2020.07.bbappend      | 11 -----------
 .../recipes-bsp/u-boot/u-boot_2020.10.bbappend      | 13 +++++++++++++
 5 files changed, 14 insertions(+), 12 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.07 => u-boot-2020.10}/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.07/fvp-common => u-boot-2020.10/fvp-base}/u-boot_vexpress_fvp.patch (100%)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 9697de5..cdfb538 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -31,7 +31,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.4%"
 
-PREFERRED_VERSION_u-boot ?= "2020.07"
+PREFERRED_VERSION_u-boot ?= "2020.10"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/fvp-common/u-boot_vexpress_fvp.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index 30d1db8..add6a78 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -2,7 +2,6 @@
 
 THIS_DIR := "${THISDIR}"
 FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
-FILESEXTRAPATHS_prepend_fvp-base = "${THIS_DIR}/${BP}/fvp-common:"
 
 #
 # Corstone-500 MACHINE
@@ -11,16 +10,6 @@ SRC_URI_append_corstone500 = " \
                    file://0001-armv7-adding-generic-timer-access-through-MMIO.patch \
                    file://0002-board-arm-add-corstone500-board.patch"
 
-#
-# FVP BASE KMACHINE
-#
-SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
-
-#
-# FVP BASE ARM32 KMACHINE
-#
-SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
-
 #
 # Juno KMACHINE
 #
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend
new file mode 100644
index 0000000..6067981
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend
@@ -0,0 +1,13 @@
+# Machine specific u-boot
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BP}:"
+
+#
+# FVP BASE
+#
+SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
+
+#
+# FVP BASE ARM32
+#
+SRC_URI_append_fvp-base-arm32 = " file://0001-Add-vexpress_aemv8a_aarch32-variant.patch"
-- 
2.17.1

