Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.75])
 by mx.groups.io with SMTP id smtpd.web08.50613.1606217944082338767
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 03:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d5uDNFpQ;
 spf=pass (domain: arm.com, ip: 40.107.21.75, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeW93YdJUs7U7Oo5h6XT7gJb6SFw/2BNc20EBYSoMeA=;
 b=d5uDNFpQlGqmDhqh2iy3y6Lz66htuG3On8SuG9XCA0T6uogPJR1PQkrLOU5X0l1D19yTe/b8ZLpSehamj0okH8/t/vVzlaqEhIBGs79oPykZkgim5iRvJmg/GW3qWCiXHw6MgyIQDcgAGP6aYao+CJdFSvxerUNKgD8Lg1vUcmU=
Received: from AM6PR08CA0044.eurprd08.prod.outlook.com (2603:10a6:20b:c0::32)
 by DB6PR08MB2678.eurprd08.prod.outlook.com (2603:10a6:6:1b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 24 Nov
 2020 11:38:19 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::9f) by AM6PR08CA0044.outlook.office365.com
 (2603:10a6:20b:c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 24 Nov 2020 11:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 11:38:16 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Tue, 24 Nov 2020 11:38:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6537e876fa538c17
X-CR-MTA-TID: 64aa7808
Received: from 288887b00414.4
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CD1DDF68-B78A-425E-A014-A9B118D973B3.1;
	Tue, 24 Nov 2020 11:36:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 288887b00414.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 11:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnMJS2RI80QQ5eEJKRHr4iG923ZeYcdl5FHxE8b63KV/LaXp5+bdrBVK45xMl/y6iSdpy0hgY0wJ1mPrezmT+WhSZcD42Ksb+EnopuERUpOcU0QVkraFSF0HGA7mi5tHPb5lrTOoiFYCz17+wRjvjC3WadsoLdPITW3TitK+N0R3m68l/6MOt3e9TDh9S0rJaAYjD+HedWxbBBO31R7+lOL1mnZxNvxHmaYOpvF48qfEp6BPem6BpjvD8ohYFV67kXAu6vufB4sR7UCqnckVZGrJi2ly1ExmoTso8tp8YxOSvXG4pekDm5wq4/3AhUJYLcgLoL+ZiCKYvytDXKLQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeW93YdJUs7U7Oo5h6XT7gJb6SFw/2BNc20EBYSoMeA=;
 b=TZ//D2949a1ioqm8LT/lexRPWjO5qy3wKh0snl7ilZOJu+MAhRnWsPfmFdXxsUUcHRIYVKCHA858l2v8TP5wPLpMhGa9ZjuN6wLHDTDkG8gY9ieKx4/VpMwe3WGPjRz72EmOLvWCFNSOJqJyYcpA5NlZBy2tcsQfrVqAF0xND2raxBgL7fredJjUdNJN5gSSlDpQ2NKCbQTfnsUlnmRLsPUml7gZPdW8IIYQ0Gg8T/KxG5geuIc9VX00bSoisqkSO/w3yGdYXPbeeVTGGKtFrtS8Rg9AoLb0xY4iJjeNE5etJWaf2jQE2bwQR3KLtIR0MXoKaymNdjBENsOzJOk+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeW93YdJUs7U7Oo5h6XT7gJb6SFw/2BNc20EBYSoMeA=;
 b=d5uDNFpQlGqmDhqh2iy3y6Lz66htuG3On8SuG9XCA0T6uogPJR1PQkrLOU5X0l1D19yTe/b8ZLpSehamj0okH8/t/vVzlaqEhIBGs79oPykZkgim5iRvJmg/GW3qWCiXHw6MgyIQDcgAGP6aYao+CJdFSvxerUNKgD8Lg1vUcmU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DB6PR0801MB1878.eurprd08.prod.outlook.com (2603:10a6:4:76::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Tue, 24 Nov
 2020 11:36:31 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::f80f:8053:9756:6b21%7]) with mapi id 15.20.3564.028; Tue, 24 Nov 2020
 11:36:31 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 1/4] arm-bsp: branding CA5DS to Corstone-500
Date: Tue, 24 Nov 2020 11:36:18 +0000
Message-Id: <20201124113621.3663-2-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
References: <20201124113621.3663-1-abdellatif.elkhlifi@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::10) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P265CA0005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Tue, 24 Nov 2020 11:36:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 21c45290-7f81-4129-4124-08d8906d6f0b
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1878:|DB6PR08MB2678:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB26785A083974A857563FAC3AFDFB0@DB6PR08MB2678.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KHfHF2iaQQCTcB/7BS5847JqIU2LLrMA3/zg4oBZEsjOJOP9RlLZRsFw/PZkRK+uOapUMkgHDfYwVGRgxPxBbzbHQi34T7u4QgFSifozHc/s+mUPL8VO5M6zVoj5A9PdGRt1+QEsHBQDs4GyvV5eXgvJuauQsLInfpJQW4jGAdM131p+S68kcDBQq9zUc3rRQUa3jbI4WlRRAFpNyjfp0vgH3u6ek+lrb04izRTiGAjUjVzlesAcB50qRdrX/rcHuJMLJpyS8kLRoyLFZYuRgfQAIa/SrH4YhQ6lVt2PgWpTP7bIbDQAoJiCfIGtRxs2+dhRRglJqS27+TpuzqoiFMDXfH0fSNLUA9X080QkqmeYSM7ihaYFrBdjVuwQiyl7
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(7696005)(66476007)(52116002)(9686003)(66946007)(83380400001)(8676002)(66556008)(4326008)(8936002)(2906002)(5660300002)(186003)(16526019)(316002)(86362001)(956004)(2616005)(30864003)(478600001)(6666004)(53546011)(1076003)(6486002)(36756003)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ZhyiInahXMK7/n9fpQCCIwkv2mwHEPwGPYLSMe3tbFmTK791IxYxdw/hlE7XVV1bkU0kJxStIOwMzV2aUnKLKLQHxTUZS25fnrR7HW9MQWmpT64lJT+VfkKRI6vi2GhZaWhGva2q1TKPnx3Ubkb0VMcstfcIuNGuFnAJ8qgmxagghNEt4W59zMhHl4n2KHWxukfDtji75cDhx2NRjJdoiW8/LoXbunC2fOUo978Kb6mFVFq8NB0BQRK4nb1G/czqX9y6XIx/YIsmnEOswgTZ+aCqmye8M/dHR8QuHOsfUufnbBiAS02ZEt51C/qoUoe+QVYz/IecOXKkYdxR8cGIhAO4gAMIGPQ63187MBzl0tzpDxGlCeZFyPk1749rSEemmOHBjkpRZ5rui0evi4QOKrTU3umK6aaafFG/x8NDHCpWItdNNHHPXgWSj3/KYUiIaD3jSjivQAC/ijiuHDO2cE27IWz7n6s/4CkdmHEQhUqa6KazfxrDYwGT/NIjFBKK2H6EzOUxkgqwIHMVnibu3HU8kypLYm8RzDleLJ43EK0iD3HPQmaqOVWdz3/GVekjOHs8dant8vEqMCIJ9JGCDpvYnBUszNVRVZNv5S0lUZcI8Xrg+GsNguDygFHjAm9dW8S8BWsAdv2o9VdlAQgwZRxaRfHIFUysY75bJqhmSQZ0kS/KSFHa+akfb0VlmV0Z0yHdBNDlOc4VnkaXxsb2XCS8esJF/Lqb+YFHnRi5e+XzC0KCzrYneWOQqHvYk7YSgcX3OoD/ffOM1nPiJVN74xf9baoMmQ3sOLaqpN43B/kVdD57i2kfId1HugwFus2Wo6ZcCIjwRuPg9fkoop3P7j1NzE21DzqAGxAi/MAtHJMJpVqxoSUY4zXIpmnbcrbNfp5EkCfBzWQnprQl2YCc1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1878
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9c65d2df-9eba-445f-7d15-08d8906d3032
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ic7aZxraT5miiDGGvyNPxvopHFNnp4zPvE0M8PU/CslPT/5cU8vo4xF0yEWfBHBeb49hc5Xh177F0yRhACiCOfRCWUy8TnLazm1vxtEDdIniJjN3/sx+dKYPVCNNlVDHvmxhXgHHB+34h6vlk+QwTVlyt6hBPUhO9csS02gJNl9RURX5dt+L8Lsh7ltZtdjNW0EzSnRxkaS6U2t31c2InBqFqz+PxGM44gpgAJj9NhlQSHWd7pDB8FXaQ5Q0n6gwPzmDry7T0zDx4pse3t7je2IbkHPMiuJwAIhg7gLzFW5RV3btoQea106RP+8KUtl6tCpik9pubFPUohad08DrGXmx9qyMsfGzjourBOMWdEsk9KxDWwa5NrmANx3q7G4wMiMdabeieLrmYyxKUiyMh/vV3UQJDfaTlVb1g/ac250=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966005)(8936002)(6486002)(186003)(6666004)(53546011)(70586007)(70206006)(956004)(26005)(2616005)(36756003)(5660300002)(82310400003)(83380400001)(4326008)(336012)(30864003)(16526019)(9686003)(478600001)(2906002)(356005)(316002)(7696005)(8676002)(81166007)(47076004)(1076003)(86362001)(82740400003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 11:38:16.0049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c45290-7f81-4129-4124-08d8906d6f0b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2678
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit changes the name of CA5DS platform to Corstone-500

Change-Id: I7fc687aea8ce6bba6d7021963ad4cb38f30858d5
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../machine/{a5ds.conf => corstone500.conf}   | 13 +++++--------
 .../documentation/{a5ds.md => corstone500.md} | 12 ++++++------
 ...inc => trusted-firmware-a-corstone500.inc} |  4 ++--
 .../trusted-firmware-a_2.3.bbappend           |  2 +-
 .../0001-armv7-add-mmio-timer.patch           |  0
 ...002-board-arm-add-corstone500-board.patch} | 19 +++++++++++--------
 .../u-boot/u-boot_2020.07.bbappend            |  7 ++++---
 .../linux/linux-arm-platforms.inc             |  5 ++---
 8 files changed, 31 insertions(+), 31 deletions(-)
 rename meta-arm-bsp/conf/machine/{a5ds.conf => corstone500.conf} (64%)
 rename meta-arm-bsp/documentation/{a5ds.md => corstone500.md} (67%)
 rename meta-arm-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a-a5ds.inc => trusted-firmware-a-corstone500.inc} (85%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/{a5ds => corstone500}/0001-armv7-add-mmio-timer.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/{a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch => corstone500/0002-board-arm-add-corstone500-board.patch} (96%)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/corstone500.conf
similarity index 64%
rename from meta-arm-bsp/conf/machine/a5ds.conf
rename to meta-arm-bsp/conf/machine/corstone500.conf
index 8a4b36d..0358f1c 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -1,12 +1,10 @@
-# Configuration for Cortex-A5 DesignStart development board
-
 #@TYPE: Machine
-#@NAME: a5ds machine
-#@DESCRIPTION: Machine configuration for Cortex-A5 DesignStart
+#@NAME: Corstone-500 machine
+#@DESCRIPTION: Machine configuration for the Corstone-500 platform
 
 require conf/machine/include/tune-cortexa5.inc
 
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.3%"
 KBUILD_DEFCONFIG = "multi_v7_defconfig"
 KCONFIG_MODE = "--alldefconfig"
@@ -19,9 +17,8 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 IMAGE_FSTYPES += "tar.bz2 cpio.gz"
 
-# Cortex-a5 u-boot configuration
-PREFERRED_VERSION_u-boot ?= "2020.07"
+# Corstone-500 u-boot configuration
 UBOOT_MACHINE = "designstart_ca5_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
 UBOOT_IMAGE_LOADADDRESS = "0x84000000"
-
+PREFERRED_VERSION_u-boot ?= "2020.07"
\ No newline at end of file
diff --git a/meta-arm-bsp/documentation/a5ds.md b/meta-arm-bsp/documentation/corstone500.md
similarity index 67%
rename from meta-arm-bsp/documentation/a5ds.md
rename to meta-arm-bsp/documentation/corstone500.md
index 38c719a..92f8a98 100644
--- a/meta-arm-bsp/documentation/a5ds.md
+++ b/meta-arm-bsp/documentation/corstone500.md
@@ -1,19 +1,19 @@
-# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-bsp
+# Corstone-500 Platform Support in meta-arm-bsp
 
 ## Howto Build and Run
 
 ### Configuration:
 In the local.conf file, MACHINE should be set as follow:
-MACHINE ?= "a5ds"
-DISTRO ?= "iota-tiny"
+MACHINE ?= "corstone500"
+DISTRO ?= "poky-tiny"
 
 Or set environment variables with that values:
 
-MACHINE "a5ds"
-DISTRO "iota-tiny"
+MACHINE "corstone500"
+DISTRO "poky-tiny"
 
 ### Build:
-``bash$ bitbake iota-tiny-image```
+``bash$ bitbake arm-reference-image```
 
 ### Run:
 To run the result in a Fixed Virtual Platform please get:
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
similarity index 85%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
rename to meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
index d892794..4d3432c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-a5ds.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone500.inc
@@ -1,6 +1,6 @@
-# Cortex-A5 Designstart specific TFA support
+# Corstone-500 specific TFA support
 
-COMPATIBLE_MACHINE = "a5ds"
+COMPATIBLE_MACHINE = "corstone500"
 TFA_PLATFORM = "a5ds"
 TFA_DEBUG = "1"
 TFA_UBOOT = "1"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index 0e6fb1e..02e69a8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -2,7 +2,7 @@
 
 MACHINE_TFA_REQUIRE ?= ""
 MACHINE_TFA_REQUIRE_tc0 = "trusted-firmware-a-tc0.inc"
-MACHINE_TFA_REQUIRE_a5ds = "trusted-firmware-a-a5ds.inc"
+MACHINE_TFA_REQUIRE_corstone500 = "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-add-mmio-timer.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0001-armv7-add-mmio-timer.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0001-armv7-add-mmio-timer.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch
similarity index 96%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch
index 204bdb3..33e1b15 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/a5ds/0002-board-arm-add-designstart-cortex-a5-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.07/corstone500/0002-board-arm-add-corstone500-board.patch
@@ -1,4 +1,7 @@
-From eed15d394137616a18add204a85b0e9dd5b00e0b Mon Sep 17 00:00:00 2001
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+From f58e263f575c0520926e4737694e11da31cb4886 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
 Subject: [PATCH 2/2] board: arm: add designstart cortex-a5 board
@@ -22,7 +25,7 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/designstart_ca5.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 54d65f84889f..7bc12f0b4300 100644
+index 54d65f8488..7bc12f0b43 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
 @@ -665,6 +665,12 @@ config ARCH_BCM6858
@@ -48,7 +51,7 @@ index 54d65f84889f..7bc12f0b4300 100644
  source "board/broadcom/bcm28155_ap/Kconfig"
 diff --git a/board/armltd/designstart/Kconfig b/board/armltd/designstart/Kconfig
 new file mode 100644
-index 000000000000..a9564e8655e2
+index 0000000000..a9564e8655
 --- /dev/null
 +++ b/board/armltd/designstart/Kconfig
 @@ -0,0 +1,12 @@
@@ -66,7 +69,7 @@ index 000000000000..a9564e8655e2
 +endif
 diff --git a/board/armltd/designstart/Makefile b/board/armltd/designstart/Makefile
 new file mode 100644
-index 000000000000..d2dc2b74ed85
+index 0000000000..d2dc2b74ed
 --- /dev/null
 +++ b/board/armltd/designstart/Makefile
 @@ -0,0 +1,8 @@
@@ -80,7 +83,7 @@ index 000000000000..d2dc2b74ed85
 +obj-y := designstart.o
 diff --git a/board/armltd/designstart/designstart.c b/board/armltd/designstart/designstart.c
 new file mode 100644
-index 000000000000..658057a00330
+index 0000000000..658057a003
 --- /dev/null
 +++ b/board/armltd/designstart/designstart.c
 @@ -0,0 +1,49 @@
@@ -135,7 +138,7 @@ index 000000000000..658057a00330
 +
 diff --git a/configs/designstart_ca5_defconfig b/configs/designstart_ca5_defconfig
 new file mode 100644
-index 000000000000..a2a756740295
+index 0000000000..a2a7567402
 --- /dev/null
 +++ b/configs/designstart_ca5_defconfig
 @@ -0,0 +1,37 @@
@@ -178,7 +181,7 @@ index 000000000000..a2a756740295
 +
 diff --git a/include/configs/designstart_ca5.h b/include/configs/designstart_ca5.h
 new file mode 100644
-index 000000000000..6db5b1cf4ac2
+index 0000000000..6db5b1cf4a
 --- /dev/null
 +++ b/include/configs/designstart_ca5.h
 @@ -0,0 +1,122 @@
@@ -305,5 +308,5 @@ index 000000000000..6db5b1cf4ac2
 +#define CONFIG_ENV_IS_IN_FLASH                1
 +#endif
 -- 
-2.28.0
+2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index c1f8b01..c4bd3d2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -6,10 +6,11 @@ FILESEXTRAPATHS_prepend_fvp-base = "${THIS_DIR}/${BP}/fvp-common:"
 FILESEXTRAPATHS_prepend_foundation-armv8 = "${THIS_DIR}/${BP}/fvp-common:"
 
 #
-# Cortex-A5 DesignStart KMACHINE
+# Corstone-500 MACHINE
 #
-SRC_URI_append_a5ds = " file://0001-armv7-add-mmio-timer.patch \
-                        file://0002-board-arm-add-designstart-cortex-a5-board.patch"
+SRC_URI_append_corstone500 = " \
+                   file://0001-armv7-add-mmio-timer.patch \
+                   file://0002-board-arm-add-corstone500-board.patch"
 
 #
 # FVP FOUNDATION KMACHINE
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 62b1dec..5d71bab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -18,10 +18,9 @@ SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
 
 #
-# Cortex-A5 DesignStart KMACHINE
+# Corstone-500 KMACHINE
 #
-COMPATIBLE_MACHINE_a5ds = "a5ds"
-KMACHINE_a5ds = "a5ds"
+COMPATIBLE_MACHINE_corstone500 = "corstone500"
 
 #
 # FVP FOUNDATION KMACHINE
-- 
2.17.1

