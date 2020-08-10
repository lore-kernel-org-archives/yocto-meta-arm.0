Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.64])
 by mx.groups.io with SMTP id smtpd.web10.37690.1597028621394731884
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 09 Aug 2020 20:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bRxJz8KH;
 spf=pass (domain: arm.com, ip: 40.107.21.64, mailfrom: damodar.santhapuri@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzeliuVsvqzpUUjEIGu4Fu/ynxz5ybB14ophdI4fCCA=;
 b=bRxJz8KHI/mlxmQwMPMe4SitSa5LoQTvYT7VhGNKiHM945qtbJJmO3gvuKVEhzEumxWzK1XJwPsbg6OnsZmrE8HHD9vWYyBpkPIVadH7TMO8MBN9zE6HXkdzKuPCPvxFNA298MFOvEQFdbB6f2sDie/nrBUu821WZL6JKDb7e7c=
Received: from DB6PR07CA0050.eurprd07.prod.outlook.com (2603:10a6:6:2a::12) by
 DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.18; Mon, 10 Aug 2020 03:03:37 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::2e) by DB6PR07CA0050.outlook.office365.com
 (2603:10a6:6:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.8 via Frontend
 Transport; Mon, 10 Aug 2020 03:03:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 03:03:37 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Mon, 10 Aug 2020 03:03:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 759d79baa1620037
X-CR-MTA-TID: 64aa7808
Received: from 9b3c79d325ca.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F2819082-2C5D-4960-823A-4961AC2432AC.1;
	Mon, 10 Aug 2020 03:03:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b3c79d325ca.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 03:03:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejHhv2J8WVjI6JGh8/w0ZuBA8uHCThbEt22mUgqrIs0Z021h+ilVVz5p3I2djHbhBsC6Jww5xKzvtVUTlvIuZwNXehUaTCDWCQz7PSTHwC6oPCzjxa//3/NIc3qcNYTphsz8Rv4lpEBusdekrVxYby9rCJHFNWwHiZbaR2S9bBSVrF+e1SHAOLew3S6LGOK2HA/UlVqx3qu/bw7F1BgQoyte8DUGyhorvgr2uQoF4gf6fWHeB+rXA3c0RwrZo4AeRgPd5PPVNaatTdFzREtrM5953V78bFwqpr+3p+zvyZG7mAOsEEXqieh8/4huLUYPXXqITyHiwPB6bHti2lg0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzeliuVsvqzpUUjEIGu4Fu/ynxz5ybB14ophdI4fCCA=;
 b=VoVyAOBukwHeBsCXin1ej73TyugkCCXAOUEavpATxiP2FJJXlVf2xj52BlN4aprP/9EqxXdi2TzePysz3ZkHnRU5rJzR/OgwPd30siidqJEvz4jAXRWJ9EYNrOAQKlxQTosgzg2S8oKU+dkK6HXtUt1IyPdDRt+NqKrM9f9T7VxHhorJ+vSjSubyiOLqdz0TmaehZwlkUTa4R4q8SQZqr8nQrrN8tXuFidvpKmhn0UuBm+dLiMCkZgEc+KxPElv9KvAZ4610B1XcincSd/eU3kVAPX9Z0q5iCgYf2Pl1o3BNY3tXBkYqXRsbOXPxabt6vCNuTn/OT30YzWwfgrZDDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzeliuVsvqzpUUjEIGu4Fu/ynxz5ybB14ophdI4fCCA=;
 b=bRxJz8KHI/mlxmQwMPMe4SitSa5LoQTvYT7VhGNKiHM945qtbJJmO3gvuKVEhzEumxWzK1XJwPsbg6OnsZmrE8HHD9vWYyBpkPIVadH7TMO8MBN9zE6HXkdzKuPCPvxFNA298MFOvEQFdbB6f2sDie/nrBUu821WZL6JKDb7e7c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com (2603:10a6:800:8c::9)
 by VI1PR08MB5519.eurprd08.prod.outlook.com (2603:10a6:803:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 03:03:30 +0000
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::24b9:811d:b60b:f5b0]) by VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::24b9:811d:b60b:f5b0%10]) with mapi id 15.20.3261.022; Mon, 10 Aug
 2020 03:03:30 +0000
From: "Damodar Santhapuri" <damodar.santhapuri@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: Add v2.3 support for juno platform
Date: Mon, 10 Aug 2020 08:32:16 +0530
Message-Id: <20200810030216.24798-2-damodar.santhapuri@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810030216.24798-1-damodar.santhapuri@arm.com>
References: <20200810030216.24798-1-damodar.santhapuri@arm.com>
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To VI1PR0801MB1950.eurprd08.prod.outlook.com
 (2603:10a6:800:8c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a077431.blr.arm.com (217.140.105.56) by BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Mon, 10 Aug 2020 03:03:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.56]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7acd6fee-55a1-447b-d1ec-08d83cd9fa00
X-MS-TrafficTypeDiagnostic: VI1PR08MB5519:|DB8PR08MB5097:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB509769176E8ACEBF599D9C1B8A440@DB8PR08MB5097.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:155;OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PsmECXE0t4wMwqttr4bXVeK6aMXAZyc3NMMYSIW1m+oF6Lek1gI1YZqkNiUytlAhK1OSzntkc9URJXM4f8W625Mo1my291k6eNzC6v7rJ96hq2jm1rBeP0DmUEc8uQM//5OcK2aSJSLemXsAH/3OalKbgZGzM/sBs3/dD1X4ECIpC8yr6OG50YVRLWdVE+VxVfsX5U770j8D10v0Nl1aG/bKpqo9p3jYNMl/aod3FIY0n90MIgRSknRDJTljuNioHRbmMcsCCSALKQZ+T7pE2E2gVf4h153sWQIxkho7iI3IK/+XX7cK/rIvBVJNSFiP
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB1950.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39850400004)(1076003)(5660300002)(6666004)(8936002)(86362001)(66556008)(83380400001)(36756003)(66946007)(66476007)(8676002)(6916009)(316002)(4326008)(2906002)(52116002)(7696005)(186003)(16526019)(44832011)(2616005)(26005)(6486002)(956004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 R3+TZDwHq393WrVK+bMB75Oa7hsHEyjJ+Xsfsxx3gnzs100JP7PFZRak2gGBF/noJCJsro8wZzznOtVb1jojIEQFJKvxhNRJ5/e/CfY/P7YoSaKmzF6H43lme7L1E1Tg14C+YQqyNhnYL9U2oSEAb4xqikU9/UX8Dvva9LxaR2yxXs+r/CVDRQAMpE8B64loM6TwwwmoASAh++Ask0/+H0gWFNo1uEZUbLmwW3yo0k3b/BU/VAayIaXyYh7HeQjcszPXN2i0mV6g5F4FawatuYSuTjouM1BDWzmIfsHXwq3+ThKXS89aTDypwNsY4BzC9A2wM+s2PTTQjI5yR/t0b5Vg5a1uzb5Cin642lE6iGA9SnnIZP0ohbCNPbmo/BDB6G7ZBKnnvaAum0cFoCoDBETiKA4qRKuoSe9ZkCV9eh6fAjcCefF4Jio2XHBf1HxbWhLZgSEyUf8VsVJLgIVxqyKysl43n52nnNunqpHX1csG1Dh4a9MTrPdpq8XXrT7pG/lsO2CLMcbIHA5FwMtUBeTuwV7LWeQfseeOWvUSUw1NPY6e09aAhmdJT7zIHxhTHMs71pB8bc2xiiS4fvVgmgVST3tMF9yg1l2lZazKWE/cuay0A60yqiRPvr4yJJU7xIqBIwsWYMl3IR5riLIqAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5519
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Damodar.Santhapuri@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	beb196a1-01be-4fce-d844-08d83cd9f5ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r5pVpJo/B+0TOz5i3HL2dxatZAO/hpOIY1YWkR/PSgMuMvc7P3l8Sn3xcVC5ukKZ5na5RUQ6HU414bB43ZcFUU/rUH76SHPvfGYA03UILLie6CXTOph0UFmmLcJeePiiSP8Ld37NJrWRzUdz048W806onaYdvj0/diagxLQ2JL7SXfXudNuXH6KRHWhq8SYs3Fqh6+Kr/ardM98wjTRr3cIzV8DuJzbhd+XNUBMjRTm/NUoCcTS2PGhxUpT+IUAtQGBFXL01QMP/4GhGV1gPYtafjCco3iJkjj+cLgRq2FayiNJ3COBfcpyyRkYwDQJLG67wV3UVx5JVop7pInxiVT3GVYs2LwKVVMG3goCHE1pub4IEFojfPeBNm05jgzEM7NiarezGrAFVnH9SZ/UXQA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(46966005)(36756003)(316002)(7696005)(83380400001)(8676002)(6916009)(5660300002)(70586007)(70206006)(86362001)(336012)(1076003)(16526019)(186003)(956004)(8936002)(4326008)(82310400002)(356005)(2616005)(81166007)(478600001)(26005)(44832011)(2906002)(47076004)(82740400003)(6666004)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 03:03:37.2732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acd6fee-55a1-447b-d1ec-08d83cd9fa00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5097
Content-Type: text/plain

Update machine/juno.conf to support tf-a v2.3

Change-Id: Ieced15e83818687c879d927bce2c4604a72b9b1e
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf                         | 2 +-
 .../trusted-firmware-a/trusted-firmware-a-juno.inc          | 2 +-
 .../trusted-firmware-a/trusted-firmware-a_2.1.bbappend      | 6 ------
 .../trusted-firmware-a/trusted-firmware-a_2.3.bbappend      | 1 +
 4 files changed, 3 insertions(+), 8 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 898a863..5f74535 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,7 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
-PREFERRED_VERSION_trusted-firmware-a ?= "2.1%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
index a6d8ded..c685d7d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
@@ -5,7 +5,7 @@ TFA_PLATFORM = "juno"
 TFA_DEBUG = "1"
 TFA_MBEDTLS = "1"
 TFA_UBOOT = "1"
-TFA_BUILD_TARGET = "bl1 fip"
+TFA_BUILD_TARGET = "bl1 bl2 bl31 fip dtbs"
 
 # Juno needs the System Control Processor Firmware
 DEPENDS += "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
deleted file mode 100644
index f5f1632..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific TFAs
-
-MACHINE_TFA_REQUIRE ?= ""
-MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
-
-require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index 6f67b49..8743ec5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -6,5 +6,6 @@ MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
 MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
 
 require ${MACHINE_TFA_REQUIRE}
-- 
2.17.1

