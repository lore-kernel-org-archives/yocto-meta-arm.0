Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.79])
 by mx.groups.io with SMTP id smtpd.web12.20855.1597420743281205461
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 08:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6gRBcwYB;
 spf=pass (domain: arm.com, ip: 40.107.5.79, mailfrom: damodar.santhapuri@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGIaPlDzxGeWFuk+B0D4zxBmyt9SjBCcPCSWj6uIyvM=;
 b=6gRBcwYBi9532sP4tMBy6exQfQxUVB3+cWRjX8IKaD3eb3DVN9Kiewo69si+zIL4TuM+tOTLZ8IUTKrgze6nRUfau67B3daQr8yyP6cfu5OEy++8EgOJwVjzb1vdq3VlrbhP1v+gWIZ1MAA+PpoMzDnGct04ezPNLMed+4JL9uA=
Received: from AM6PR08CA0028.eurprd08.prod.outlook.com (2603:10a6:20b:c0::16)
 by AM0PR08MB3234.eurprd08.prod.outlook.com (2603:10a6:208:5e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 15:58:59 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::f3) by AM6PR08CA0028.outlook.office365.com
 (2603:10a6:20b:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Fri, 14 Aug 2020 15:58:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 15:58:58 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 14 Aug 2020 15:58:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe4399892f6e6c5b
X-CR-MTA-TID: 64aa7808
Received: from 5e343fd2f665.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CAC19173-3509-4E10-A76F-3DA724839C3E.1;
	Fri, 14 Aug 2020 15:58:49 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5e343fd2f665.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Aug 2020 15:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcnddrWVOJITMUK3qZmTtoME+Xad2WbAJE94xDQ0JONFcpatnSkr8iM/FSUlFWLzxcp7QzikcI+foOCLi8o0T1f/k76iD7s7ekoeQQqkFmBLjvO820A+dSHPT5oxgoHNxIPJT83qj4EPm+X5rVUzy71Tp+lea28euQii+QB/NBZL4dGChhcc7wP0cU890hWotqZpyQwGFZUlPsAr1ufXxIhjAbfJBmEFGnbWDFiGBpq8rCxQQU95tm2IM3BoxrWTutiC5MsHnrFbg0gGj7lnzAheMcTCaG3T6CVrZ4LLdV2kjU3NgyT3D8NdhAe6uBtMeIW6oCFKqpC2MKHziuj7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGIaPlDzxGeWFuk+B0D4zxBmyt9SjBCcPCSWj6uIyvM=;
 b=fXHSr+0P6sIhY6MWb2um/zlDziniucATEHEMZMW1Ody5lGn0ntVcQNQtZWbkH8lb2EqjKnMS7E6ECUrlfTIktafxqW+vqa8PEYigm1pJmpU/kOWrquwr137cBewmfipOg25O7Nmkup3Tx7CjRof4gLDb9AGZDSmQpy5lHRFlLTYYCApwu535Za7fIBZQmIv/9OBZeJSZhaWmqW8TMg42r/PfPx+9tJsojr3onamYkknz9ZnXK+1767a1+qUzzQX9lvk453+0MSLXWSF7k6MeNFSc04IvOz+erqt0d9A9zGNm1kZQfkrk+ydMVyXcLeqV9G52XXAvw/eeKbHPgfrqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGIaPlDzxGeWFuk+B0D4zxBmyt9SjBCcPCSWj6uIyvM=;
 b=6gRBcwYBi9532sP4tMBy6exQfQxUVB3+cWRjX8IKaD3eb3DVN9Kiewo69si+zIL4TuM+tOTLZ8IUTKrgze6nRUfau67B3daQr8yyP6cfu5OEy++8EgOJwVjzb1vdq3VlrbhP1v+gWIZ1MAA+PpoMzDnGct04ezPNLMed+4JL9uA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com (2603:10a6:800:8c::9)
 by VI1PR08MB2976.eurprd08.prod.outlook.com (2603:10a6:803:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 14 Aug
 2020 15:58:45 +0000
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::e0f3:90c7:4af7:aefd]) by VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::e0f3:90c7:4af7:aefd%10]) with mapi id 15.20.3283.022; Fri, 14 Aug
 2020 15:58:45 +0000
From: "Damodar Santhapuri" <damodar.santhapuri@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH] arm-bsp/juno: Move to linux-yocto 5.4
Date: Fri, 14 Aug 2020 21:28:14 +0530
Message-Id: <20200814155814.6202-1-damodar.santhapuri@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BM1PR0101CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::20) To VI1PR0801MB1950.eurprd08.prod.outlook.com
 (2603:10a6:800:8c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a077431.blr.arm.com (217.140.105.56) by BM1PR0101CA0058.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 15:58:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.56]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7510791a-c147-4d80-30fe-08d8406af4c7
X-MS-TrafficTypeDiagnostic: VI1PR08MB2976:|AM0PR08MB3234:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB323462630C23321302908E798A400@AM0PR08MB3234.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:110;OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fhqibO7v2kYKp/1M/rKys20XMDv0LcTp1NNfZwTxQt7kgQVNmiFkzUUCk+Jkhx0XwS8thYF87L1HqT5Age1H+Gz0ZcDsdS6EX2+392dvd9+X3JpIa3NCJf3eo/bz61Q4FHiQX6Jq+Kqf+19eh5qtEnEj3a00zcgp5e7xk5vRzIy0Xnb4Flj+ZlBNjGJauyAoPUzj2psTXAcAcavktBpOV5tWJMGO5UmtWNTEPJtSB/qSCEuB7JY0TTVy1KrbHV05NBwSUkaSO9XukbCrjw8PanBKwYwRqUS+I1Tc4jMVgXEPjZR6vveJ07KJzwbCE9CHb7VFORCAggCk2O22//lE6UyIUQA0P7TSKktNKZCBj5YGN/pRA2lV6fNbtFAJs6IhpC0YlbpXGz/p+YKeosDbCw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB1950.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(2906002)(66476007)(83380400001)(66946007)(66556008)(44832011)(5660300002)(30864003)(36756003)(478600001)(6486002)(4326008)(6916009)(1076003)(16526019)(2616005)(956004)(186003)(86362001)(52116002)(8676002)(6666004)(7696005)(8936002)(26005)(316002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ra2D2NiwB7ESQ3sj5vs/0WS5UA+1dQBF9HRQ5FZpa/GoMY/5H1Dajd+aTVHzTrR/FBmnukIu8Ehz+FUpMpZmBqBGLl9w6GND2nILjgnIUZ+QagQABi33kdNnZUWWNlOL670gHyo8v26CdfeCV4dY1NGvyN8Ao1uFAEF8yVpTiPKBeNE+UwlHBGoeH2psAvjqO/WZQTeICr0eNqV1KAxk/teGEdUzRu7vmofGtEcNoAMo/wpBtuEHZQf7+bUxZOv5dYHC+M0RFDYMUwIp7/TdiRzmu4EMdSE8ZTXWONRPU5DZkBZECxPcDDAWiZBhwcTs1QhbkzUAaQ5rkcj+3Kr4tbS7imA8k6LfUy+VDv8LH48zF5Mm3qgbZQp6LgQcVuZs0x5tUIWaI7BDPzTm980U09O6PMhIDXoFb2FnJgoq0yAe18Y92dYNcmWm1U1Moh/DDrjvD9ogcaa+rJNO3csDFVBJ6ZKciZgbO604CUwXe2m6tWOdxtNEG4szITds2E+SI5r8gUGIX0NFpWv1oTk6mCf/8REof90QfsqcSkTPPGcZ/zHY0YAdP0eweJmsohGQbiM+x5X5KDcHHtBXIgpbO5p82hb2FC3a6BxNB6svvbUFFTmjhCEN5Sgsx154XYfSa9YeFeg8wcRhKvgXN2CDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2976
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Damodar.Santhapuri@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	84817a6f-eeb3-4f2a-8fce-08d8406aec2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZRsp8+yYYn6Fqg/iwqyyTJ19L820Cdjq8/8yu4XAj1yQ0vZ0UPCOHIT5zRXkvTYRhXSIZaTkY4OQeKH40scOmkYQ0SDHBvO0QQaINKdZdcPZKK/A+t5KvUEL7djySFONDcBGURbqbYzXiy8BoytxRVfGsksBJe6AkPCsLgZLydAHeUKAQFbk2uRjUbZ2iYwNBAWMDkZKHv073ykDKqxY6uPEVOgB6wJOpugnKH52KaoRahoWOYpkq3oQywR9ZK0igSDJfKKjgKivc2z3d8V6qs32tS3/3JXUxCRfKL67cXbus9Wk3JcVqkpefo194LQry77dRtfaPKvZORB/wO2teOlHKwagr1W8LUAhfPwOzoOY9eQwVIsOxJyabLGakV2ALZome6ToofvRMnlhU9SB/1GVRAFf7gpUu2xkjH6XdxnYyYZSAS2U7X7c55FIkRtVjXh40PpFA+UNg7SGxuStF1dxjNIf09XeOYsKTdlT80M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(5660300002)(6486002)(83380400001)(6666004)(4326008)(70206006)(86362001)(2906002)(478600001)(82310400002)(356005)(1076003)(81166007)(30864003)(70586007)(36906005)(47076004)(8936002)(82740400003)(44832011)(8676002)(956004)(16526019)(26005)(7696005)(6916009)(336012)(186003)(2616005)(316002)(36756003)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 15:58:58.8791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7510791a-c147-4d80-30fe-08d8406af4c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3234
Content-Type: text/plain

This commit includes
1. Move from linux-linaro-arm 4.9 to linux-yocto 5.4
2. MHU patches for SCMI
3. add patch to remove stale configs in v5.4

Observed the below error in kernel boot

[    7.177114] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
[    7.197984] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
[    7.201125] smsc911x 18000000.ethernet eth1: SMSC911x/921x identified at 0xffff800012a70000, IRQ: 8
[    7.206968] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
[    7.206978] arm-scmi firmware:scmi: mbox timed out in resp(caller: scmi_power_state_set+0x78/0xc0)
[    7.216073] arm-scmi firmware:scmi: message for 5 is not expected!

Change-Id: I4651a142bcee06ba95faa315e3caaf871f406b5a
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |   6 +-
 .../bsp/arm-platforms/juno/juno-board.cfg     |   2 -
 .../bsp/arm-platforms/juno/juno-drm.cfg       |   1 -
 .../bsp/arm-platforms/juno/juno-sound.cfg     |   1 +
 ...ort-for-doorbell-signal-mode-control.patch |  93 +++
 ...box-add-bindings-to-support-ARM-MHU-.patch |  98 +++
 ..._mhu-migrate-to-threaded-irq-handler.patch | 106 ++++
 ...re-factor-data-structure-to-add-door.patch | 338 ++++++++++
 ...u-add-full-support-for-the-doorbells.patch | 224 +++++++
 ...add-support-to-read-and-record-mbox-.patch |  67 ++
 ...fconfig-add-all-SCMI-related-configs.patch |  79 +++
 ...dd-mhu-doorbell-support-and-scmi-dev.patch | 592 ++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |  12 +
 13 files changed, 1613 insertions(+), 6 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 5f74535..50c9d2f 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -17,9 +17,9 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
-# Use kernel provided by linaro (Contains support for SCMi or HDMI)
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
-PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
+# Use kernel provided by yocto
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "5.4%"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg
index 73ea076..654efa4 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-board.cfg
@@ -31,8 +31,6 @@ CONFIG_CPU_IDLE=y
 CONFIG_ARM_CPUIDLE=y
 
 CONFIG_CPU_FREQ=y
-CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
-CONFIG_ARM_DT_BL_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 
 CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg
index fb5e855..1216297 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-drm.cfg
@@ -1,5 +1,4 @@
 CONFIG_DRM=y
-CONFIG_DRM_ARM=y
 CONFIG_DRM_HDLCD=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_FB=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
index 399c77d..d3419ef 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/juno/juno-sound.cfg
@@ -2,6 +2,7 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SEQUENCER=y
 CONFIG_SND_SEQ_DUMMY=y
+CONFIG_SND_OSSEMUL=y
 CONFIG_SND_MIXER_OSS=y
 CONFIG_SND_PCM_OSS=y
 CONFIG_SND_SEQUENCER_OSS=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch
new file mode 100644
index 0000000..8ebaf8f
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0001-mailbox-add-support-for-doorbell-signal-mode-control.patch
@@ -0,0 +1,93 @@
+From e9ba9ad0a4f7084bd775f3246f553e18fbb18c4d Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Wed, 1 Nov 2017 16:15:27 +0000
+Subject: [PATCH 1/8] mailbox: add support for doorbell/signal mode controllers
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970337]
+
+Some mailbox controllers are lack FIFOs or memory to transmit data.
+They typically contains single doorbell registers to just signal the
+remote. The actually data is transmitted/shared using some shared memory
+which is not part of the mailbox.
+
+Such controllers don't need to transmit any data, they just transmit
+the signal. In such controllers the data pointer passed to
+mbox_send_message is passed to client via it's tx_prepare callback.
+Controller doesn't need any data to be passed from the client.
+
+This patch introduce the new API send_signal to support such doorbell/
+signal mode in mailbox controllers. This is useful to avoid another
+layer of abstraction as typically multiple channels can be multiplexied
+into single register.
+
+Cc: Jassi Brar <jassisinghbrar@gmail.com>
+Cc: Arnd Bergmann <arnd@arndb.de>
+Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+---
+ drivers/mailbox/mailbox.c          | 11 ++++++++++-
+ include/linux/mailbox_controller.h | 11 +++++++++++
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
+index 0b821a5b2db8..a1f916a6e044 100644
+--- a/drivers/mailbox/mailbox.c
++++ b/drivers/mailbox/mailbox.c
+@@ -74,7 +74,10 @@ static void msg_submit(struct mbox_chan *chan)
+ 	if (chan->cl->tx_prepare)
+ 		chan->cl->tx_prepare(chan->cl, data);
+ 	/* Try to submit a message to the MBOX controller */
+-	err = chan->mbox->ops->send_data(chan, data);
++	if (chan->mbox->ops->send_data)
++		err = chan->mbox->ops->send_data(chan, data);
++	else
++		err = chan->mbox->ops->send_signal(chan);
+ 	if (!err) {
+ 		chan->active_req = data;
+ 		chan->msg_count--;
+@@ -480,6 +483,12 @@ int mbox_controller_register(struct mbox_controller *mbox)
+ 	/* Sanity check */
+ 	if (!mbox || !mbox->dev || !mbox->ops || !mbox->num_chans)
+ 		return -EINVAL;
++	/*
++	 * A controller can support either doorbell mode or normal message
++	 * transmission mode but not both
++	 */
++	if (mbox->ops->send_data && mbox->ops->send_signal)
++		return -EINVAL;
+ 
+ 	if (mbox->txdone_irq)
+ 		txdone = TXDONE_BY_IRQ;
+diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
+index 36d6ce673503..476bb9d2ee88 100644
+--- a/include/linux/mailbox_controller.h
++++ b/include/linux/mailbox_controller.h
+@@ -20,6 +20,16 @@ struct mbox_chan;
+  *		transmission of data is reported by the controller via
+  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
+  *		sleep.
++ * @send_signal: The API asks the MBOX controller driver, in atomic
++ *		 context try to transmit a signal on the bus. Returns 0 if
++ *		 data is accepted for transmission, -EBUSY while rejecting
++ *		 if the remote hasn't yet absorbed the last signal sent. Actual
++ *		 transmission of data must be handled by the client and  is
++ *		 reported by the controller via mbox_chan_txdone (if it has
++ *		 some TX ACK irq). It must not sleep. Unlike send_data,
++ *		 send_signal doesn't handle any messages/data. It just sends
++ *		 notification signal(doorbell) and client needs to prepare all
++ *		 the data.
+  * @flush:	Called when a client requests transmissions to be blocking but
+  *		the context doesn't allow sleeping. Typically the controller
+  *		will implement a busy loop waiting for the data to flush out.
+@@ -45,6 +55,7 @@ struct mbox_chan;
+  */
+ struct mbox_chan_ops {
+ 	int (*send_data)(struct mbox_chan *chan, void *data);
++	int (*send_signal)(struct mbox_chan *chan);
+ 	int (*flush)(struct mbox_chan *chan, unsigned long timeout);
+ 	int (*startup)(struct mbox_chan *chan);
+ 	void (*shutdown)(struct mbox_chan *chan);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch
new file mode 100644
index 0000000..e830093
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch
@@ -0,0 +1,98 @@
+From 890fedb91e4b81bdb2384c7bb36580d25859191f Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Fri, 28 Apr 2017 11:28:24 +0100
+Subject: [PATCH 2/8] dt-bindings: mailbox: add bindings to support ARM MHU
+ doorbells
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970343]
+
+The ARM MHU has mechanism to assert interrupt signals to facilitate
+inter-processor message based communication. It drives the signal using
+a 32-bit register, with all 32-bits logically ORed together. It also
+enables software to set, clear and check the status of each of the bits
+of this register independently. Each bit of the register can be
+associated with a type of event that can contribute to raising the
+interrupt thereby allowing it to be used as independent doorbells.
+
+Since the first version of this binding can't support doorbells,
+this patch extends the existing binding to support them by allowing
+"#mbox-cells" to be 2.
+
+Cc: Jassi Brar <jaswinder.singh@linaro.org>
+Cc: Rob Herring <robh+dt@kernel.org>
+Cc: devicetree@vger.kernel.org
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+---
+ .../devicetree/bindings/mailbox/arm-mhu.txt   | 39 ++++++++++++++++++-
+ 1 file changed, 37 insertions(+), 2 deletions(-)
+
+diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
+index 4971f03f0b33..ba659bcc7109 100644
+--- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
++++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
+@@ -10,6 +10,15 @@ STAT register and the remote clears it after having read the data.
+ The last channel is specified to be a 'Secure' resource, hence can't be
+ used by Linux running NS.
+ 
++The MHU drives the interrupt signal using a 32-bit register, with all
++32-bits logically ORed together. It provides a set of registers to
++enable software to set, clear and check the status of each of the bits
++of this register independently. The use of 32 bits per interrupt line
++enables software to provide more information about the source of the
++interrupt. For example, each bit of the register can be associated with
++a type of event that can contribute to raising the interrupt. Each of
++the 32-bits can be used as "doorbell" to alert the remote processor.
++
+ Mailbox Device Node:
+ ====================
+ 
+@@ -18,13 +27,21 @@ Required properties:
+ - compatible:		Shall be "arm,mhu" & "arm,primecell"
+ - reg:			Contains the mailbox register address range (base
+ 			address and length)
+-- #mbox-cells		Shall be 1 - the index of the channel needed.
++- #mbox-cells		Shall be 1 - the index of the channel needed when
++			not used as set of doorbell bits.
++			Shall be 2 - the index of the channel needed, and
++			the index of the doorbell bit within the channel
++			when used in doorbell mode.
+ - interrupts:		Contains the interrupt information corresponding to
+-			each of the 3 links of MHU.
++			each of the 3 physical channels of MHU namely low
++			priority non-secure, high priority non-secure and
++			secure channels.
+ 
+ Example:
+ --------
+ 
++1. Controller which doesn't support doorbells
++
+ 	mhu: mailbox@2b1f0000 {
+ 		#mbox-cells = <1>;
+ 		compatible = "arm,mhu", "arm,primecell";
+@@ -41,3 +58,21 @@ Example:
+ 		reg = <0 0x2e000000 0x4000>;
+ 		mboxes = <&mhu 1>; /* HP-NonSecure */
+ 	};
++
++2. Controller which supports doorbells
++
++	mhu: mailbox@2b1f0000 {
++		#mbox-cells = <2>;
++		compatible = "arm,mhu", "arm,primecell";
++		reg = <0 0x2b1f0000 0x1000>;
++		interrupts = <0 36 4>, /* LP-NonSecure */
++			     <0 35 4>; /* HP-NonSecure */
++		clocks = <&clock 0 2 1>;
++		clock-names = "apb_pclk";
++	};
++
++	mhu_client: scb@2e000000 {
++		compatible = "arm,scpi";
++		reg = <0 0x2e000000 0x200>;
++		mboxes = <&mhu 1 4>; /* HP-NonSecure 5th doorbell bit */
++	};
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
new file mode 100644
index 0000000..e3bc571
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch
@@ -0,0 +1,106 @@
+From 620e29a3323608c23fe370744b79e2fd19fc4ee0 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Tue, 2 May 2017 11:12:43 +0100
+Subject: [PATCH 3/8] mailbox: arm_mhu: migrate to threaded irq handler
+
+Upstream-Status: Submitted[https://patchwork.kernel.org/patch/10970345]
+
+In preparation to introduce support for doorbells which require the
+interrupt handlers to be threaded, this patch moves the existing
+interrupt handler to threaded handler.
+
+Also it moves out the registering and freeing of the handlers from
+the mailbox startup and shutdown methods. This also is required to
+support doorbells.
+
+Cc: Jassi Brar <jaswinder.singh@linaro.org>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+---
+ drivers/mailbox/arm_mhu.c | 46 +++++++++++++++++++--------------------
+ 1 file changed, 22 insertions(+), 24 deletions(-)
+
+diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
+index 9da236552bd7..d7a0b25df372 100644
+--- a/drivers/mailbox/arm_mhu.c
++++ b/drivers/mailbox/arm_mhu.c
+@@ -76,33 +76,16 @@ static int mhu_startup(struct mbox_chan *chan)
+ {
+ 	struct mhu_link *mlink = chan->con_priv;
+ 	u32 val;
+-	int ret;
+ 
+ 	val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
+ 	writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
+ 
+-	ret = request_irq(mlink->irq, mhu_rx_interrupt,
+-			  IRQF_SHARED, "mhu_link", chan);
+-	if (ret) {
+-		dev_err(chan->mbox->dev,
+-			"Unable to acquire IRQ %d\n", mlink->irq);
+-		return ret;
+-	}
+-
+ 	return 0;
+ }
+ 
+-static void mhu_shutdown(struct mbox_chan *chan)
+-{
+-	struct mhu_link *mlink = chan->con_priv;
+-
+-	free_irq(mlink->irq, chan);
+-}
+-
+ static const struct mbox_chan_ops mhu_ops = {
+ 	.send_data = mhu_send_data,
+ 	.startup = mhu_startup,
+-	.shutdown = mhu_shutdown,
+ 	.last_tx_done = mhu_last_tx_done,
+ };
+ 
+@@ -124,13 +107,6 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 		return PTR_ERR(mhu->base);
+ 	}
+ 
+-	for (i = 0; i < MHU_CHANS; i++) {
+-		mhu->chan[i].con_priv = &mhu->mlink[i];
+-		mhu->mlink[i].irq = adev->irq[i];
+-		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
+-		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
+-	}
+-
+ 	mhu->mbox.dev = dev;
+ 	mhu->mbox.chans = &mhu->chan[0];
+ 	mhu->mbox.num_chans = MHU_CHANS;
+@@ -147,6 +123,28 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 		return err;
+ 	}
+ 
++	for (i = 0; i < MHU_CHANS; i++) {
++		int irq = mhu->mlink[i].irq = adev->irq[i];
++
++		if (irq <= 0) {
++			dev_dbg(dev, "No IRQ found for Channel %d\n", i);
++			continue;
++		}
++
++		mhu->chan[i].con_priv = &mhu->mlink[i];
++		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
++		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
++
++		err = devm_request_threaded_irq(dev, irq, NULL,
++						mhu_rx_interrupt, IRQF_ONESHOT,
++						"mhu_link", &mhu->chan[i]);
++		if (err) {
++			dev_err(dev, "Can't claim IRQ %d\n", irq);
++			mbox_controller_unregister(&mhu->mbox);
++			return err;
++		}
++	}
++
+ 	dev_info(dev, "ARM MHU Mailbox registered\n");
+ 	return 0;
+ }
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch
new file mode 100644
index 0000000..137493d
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch
@@ -0,0 +1,338 @@
+From a75e42a4aa52ff0c8d24594a2510e9e7edcc810d Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Tue, 2 May 2017 11:50:59 +0100
+Subject: [PATCH 4/8] mailbox: arm_mhu: re-factor data structure to add
+ doorbell support
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10970347]
+
+In order to support doorbells, we need a bit of reword around data
+structures that are per-channel. Since the number of doorbells are
+not fixed though restricted to maximum of 20, the channel assignment
+and initialization is move to xlate function.
+
+This patch also adds the platform data for the existing support of one
+channel per physical channel.
+
+Cc: Jassi Brar <jaswinder.singh@linaro.org>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+---
+ drivers/mailbox/arm_mhu.c | 209 ++++++++++++++++++++++++++++++++++----
+ 1 file changed, 187 insertions(+), 22 deletions(-)
+
+diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
+index d7a0b25df372..24999bb9dc57 100644
+--- a/drivers/mailbox/arm_mhu.c
++++ b/drivers/mailbox/arm_mhu.c
+@@ -12,6 +12,8 @@
+ #include <linux/io.h>
+ #include <linux/mailbox_controller.h>
+ #include <linux/module.h>
++#include <linux/of.h>
++#include <linux/of_device.h>
+ 
+ #define INTR_STAT_OFS	0x0
+ #define INTR_SET_OFS	0x8
+@@ -22,7 +24,8 @@
+ #define MHU_SEC_OFFSET	0x200
+ #define TX_REG_OFFSET	0x100
+ 
+-#define MHU_CHANS	3
++#define MHU_NUM_PCHANS	3	/* Secure, Non-Secure High and Low Priority */
++#define MHU_CHAN_MAX	20	/* Max channels to save on unused RAM */
+ 
+ struct mhu_link {
+ 	unsigned irq;
+@@ -32,53 +35,175 @@ struct mhu_link {
+ 
+ struct arm_mhu {
+ 	void __iomem *base;
+-	struct mhu_link mlink[MHU_CHANS];
+-	struct mbox_chan chan[MHU_CHANS];
++	struct mhu_link mlink[MHU_NUM_PCHANS];
+ 	struct mbox_controller mbox;
++	struct device *dev;
+ };
+ 
++/**
++ * ARM MHU Mailbox platform specific configuration
++ *
++ * @num_pchans: Maximum number of physical channels
++ * @num_doorbells: Maximum number of doorbells per physical channel
++ */
++struct mhu_mbox_pdata {
++	unsigned int num_pchans;
++	unsigned int num_doorbells;
++	bool support_doorbells;
++};
++
++/**
++ * ARM MHU Mailbox allocated channel information
++ *
++ * @mhu: Pointer to parent mailbox device
++ * @pchan: Physical channel within which this doorbell resides in
++ * @doorbell: doorbell number pertaining to this channel
++ */
++struct mhu_channel {
++	struct arm_mhu *mhu;
++	unsigned int pchan;
++	unsigned int doorbell;
++};
++
++static inline struct mbox_chan *
++mhu_mbox_to_channel(struct mbox_controller *mbox,
++		    unsigned int pchan, unsigned int doorbell)
++{
++	int i;
++	struct mhu_channel *chan_info;
++
++	for (i = 0; i < mbox->num_chans; i++) {
++		chan_info = mbox->chans[i].con_priv;
++		if (chan_info && chan_info->pchan == pchan &&
++		    chan_info->doorbell == doorbell)
++			return &mbox->chans[i];
++	}
++
++	dev_err(mbox->dev,
++		"Channel not registered: physical channel: %d doorbell: %d\n",
++		pchan, doorbell);
++
++	return NULL;
++}
++
++static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
++{
++	unsigned int pchan;
++	struct mhu_mbox_pdata *pdata = dev_get_platdata(mhu->dev);
++
++	for (pchan = 0; pchan < pdata->num_pchans; pchan++)
++		if (mhu->mlink[pchan].irq == irq)
++			break;
++	return pchan;
++}
++
++static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
++					const struct of_phandle_args *spec)
++{
++	struct arm_mhu *mhu = dev_get_drvdata(mbox->dev);
++	struct mhu_mbox_pdata *pdata = dev_get_platdata(mhu->dev);
++	struct mhu_channel *chan_info;
++	struct mbox_chan *chan = NULL;
++	unsigned int pchan = spec->args[0];
++	unsigned int doorbell = pdata->support_doorbells ? spec->args[1] : 0;
++	int i;
++
++	/* Bounds checking */
++	if (pchan >= pdata->num_pchans || doorbell >= pdata->num_doorbells) {
++		dev_err(mbox->dev,
++			"Invalid channel requested pchan: %d doorbell: %d\n",
++			pchan, doorbell);
++		return ERR_PTR(-EINVAL);
++	}
++
++	for (i = 0; i < mbox->num_chans; i++) {
++		chan_info = mbox->chans[i].con_priv;
++
++		/* Is requested channel free? */
++		if (chan_info &&
++		    mbox->dev == chan_info->mhu->dev &&
++		    pchan == chan_info->pchan &&
++		    doorbell == chan_info->doorbell) {
++			dev_err(mbox->dev, "Channel in use\n");
++			return ERR_PTR(-EBUSY);
++		}
++
++		/*
++		 * Find the first free slot, then continue checking
++		 * to see if requested channel is in use
++		 */
++		if (!chan && !chan_info)
++			chan = &mbox->chans[i];
++	}
++
++	if (!chan) {
++		dev_err(mbox->dev, "No free channels left\n");
++		return ERR_PTR(-EBUSY);
++	}
++
++	chan_info = devm_kzalloc(mbox->dev, sizeof(*chan_info), GFP_KERNEL);
++	if (!chan_info)
++		return ERR_PTR(-ENOMEM);
++
++	chan_info->mhu = mhu;
++	chan_info->pchan = pchan;
++	chan_info->doorbell = doorbell;
++
++	chan->con_priv = chan_info;
++
++	dev_dbg(mbox->dev, "mbox: created channel phys: %d doorbell: %d\n",
++		pchan, doorbell);
++
++	return chan;
++}
++
+ static irqreturn_t mhu_rx_interrupt(int irq, void *p)
+ {
+-	struct mbox_chan *chan = p;
+-	struct mhu_link *mlink = chan->con_priv;
++	struct arm_mhu *mhu = p;
++	unsigned int pchan = mhu_mbox_irq_to_pchan_num(mhu, irq);
++	struct mbox_chan *chan = mhu_mbox_to_channel(&mhu->mbox, pchan, 0);
++	void __iomem *base = mhu->mlink[pchan].rx_reg;
+ 	u32 val;
+ 
+-	val = readl_relaxed(mlink->rx_reg + INTR_STAT_OFS);
++	val = readl_relaxed(base + INTR_STAT_OFS);
+ 	if (!val)
+ 		return IRQ_NONE;
+ 
+ 	mbox_chan_received_data(chan, (void *)&val);
+ 
+-	writel_relaxed(val, mlink->rx_reg + INTR_CLR_OFS);
++	writel_relaxed(val, base + INTR_CLR_OFS);
+ 
+ 	return IRQ_HANDLED;
+ }
+ 
+ static bool mhu_last_tx_done(struct mbox_chan *chan)
+ {
+-	struct mhu_link *mlink = chan->con_priv;
+-	u32 val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
++	struct mhu_channel *chan_info = chan->con_priv;
++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
++	u32 val = readl_relaxed(base + INTR_STAT_OFS);
+ 
+ 	return (val == 0);
+ }
+ 
+ static int mhu_send_data(struct mbox_chan *chan, void *data)
+ {
+-	struct mhu_link *mlink = chan->con_priv;
++	struct mhu_channel *chan_info = chan->con_priv;
++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
+ 	u32 *arg = data;
+ 
+-	writel_relaxed(*arg, mlink->tx_reg + INTR_SET_OFS);
++	writel_relaxed(*arg, base + INTR_SET_OFS);
+ 
+ 	return 0;
+ }
+ 
+ static int mhu_startup(struct mbox_chan *chan)
+ {
+-	struct mhu_link *mlink = chan->con_priv;
++	struct mhu_channel *chan_info = chan->con_priv;
++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
+ 	u32 val;
+ 
+-	val = readl_relaxed(mlink->tx_reg + INTR_STAT_OFS);
+-	writel_relaxed(val, mlink->tx_reg + INTR_CLR_OFS);
++	val = readl_relaxed(base + INTR_STAT_OFS);
++	writel_relaxed(val, base + INTR_CLR_OFS);
+ 
+ 	return 0;
+ }
+@@ -89,14 +214,47 @@ static const struct mbox_chan_ops mhu_ops = {
+ 	.last_tx_done = mhu_last_tx_done,
+ };
+ 
++static const struct mhu_mbox_pdata arm_mhu_pdata = {
++	.num_pchans = 3,
++	.num_doorbells = 1,
++	.support_doorbells = false,
++};
++
+ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ {
+-	int i, err;
++	u32 cell_count;
++	int i, err, max_chans;
+ 	struct arm_mhu *mhu;
++	struct mbox_chan *chans;
++	struct mhu_mbox_pdata *pdata;
+ 	struct device *dev = &adev->dev;
+-	int mhu_reg[MHU_CHANS] = {MHU_LP_OFFSET, MHU_HP_OFFSET, MHU_SEC_OFFSET};
++	struct device_node *np = dev->of_node;
++	int mhu_reg[MHU_NUM_PCHANS] = {
++		MHU_LP_OFFSET, MHU_HP_OFFSET, MHU_SEC_OFFSET,
++	};
++
++	err = of_property_read_u32(np, "#mbox-cells", &cell_count);
++	if (err) {
++		dev_err(dev, "failed to read #mbox-cells in %s\n",
++			np->full_name);
++		return err;
++	}
++
++	if (cell_count == 1) {
++		max_chans = MHU_NUM_PCHANS;
++		pdata = (struct mhu_mbox_pdata *)&arm_mhu_pdata;
++	} else {
++		dev_err(dev, "incorrect value of #mbox-cells in %s\n",
++			np->full_name);
++		return -EINVAL;
++	}
++
++	if (pdata->num_pchans > MHU_NUM_PCHANS) {
++		dev_err(dev, "Number of physical channel can't exceed %d\n",
++			MHU_NUM_PCHANS);
++		return -EINVAL;
++	}
+ 
+-	/* Allocate memory for device */
+ 	mhu = devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
+ 	if (!mhu)
+ 		return -ENOMEM;
+@@ -107,14 +265,22 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 		return PTR_ERR(mhu->base);
+ 	}
+ 
++	chans = devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
++	if (!chans)
++		return -ENOMEM;
++
++	dev->platform_data = pdata;
++
++	mhu->dev = dev;
+ 	mhu->mbox.dev = dev;
+-	mhu->mbox.chans = &mhu->chan[0];
+-	mhu->mbox.num_chans = MHU_CHANS;
++	mhu->mbox.chans = chans;
++	mhu->mbox.num_chans = max_chans;
+ 	mhu->mbox.ops = &mhu_ops;
+ 	mhu->mbox.txdone_irq = false;
+ 	mhu->mbox.txdone_poll = true;
+ 	mhu->mbox.txpoll_period = 1;
+ 
++	mhu->mbox.of_xlate = mhu_mbox_xlate;
+ 	amba_set_drvdata(adev, mhu);
+ 
+ 	err = devm_mbox_controller_register(dev, &mhu->mbox);
+@@ -123,7 +289,7 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 		return err;
+ 	}
+ 
+-	for (i = 0; i < MHU_CHANS; i++) {
++	for (i = 0; i < pdata->num_pchans; i++) {
+ 		int irq = mhu->mlink[i].irq = adev->irq[i];
+ 
+ 		if (irq <= 0) {
+@@ -131,13 +297,12 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 			continue;
+ 		}
+ 
+-		mhu->chan[i].con_priv = &mhu->mlink[i];
+ 		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
+ 		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
+ 
+ 		err = devm_request_threaded_irq(dev, irq, NULL,
+ 						mhu_rx_interrupt, IRQF_ONESHOT,
+-						"mhu_link", &mhu->chan[i]);
++						"mhu_link", mhu);
+ 		if (err) {
+ 			dev_err(dev, "Can't claim IRQ %d\n", irq);
+ 			mbox_controller_unregister(&mhu->mbox);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
new file mode 100644
index 0000000..0bc2eb3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch
@@ -0,0 +1,224 @@
+From eed2fcf3a44c672805daf1bb2940744f4eff9145 Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Tue, 2 May 2017 12:07:28 +0100
+Subject: [PATCH 5/8] mailbox: arm_mhu: add full support for the doorbells
+
+Upstream-Status: Submitted[https://patchwork.kernel.org/patch/10970349]
+
+We now have the basic infrastructure and binding to support doorbells
+on ARM MHU controller.
+
+This patch adds all the necessary mailbox operations to add support for
+the doorbells. Maximum of 32 doorbells are supported on each physical
+channel, however the total number of doorbells is restricted to 20
+in order to save memory. It can increased if required in future.
+
+Cc: Jassi Brar <jaswinder.singh@linaro.org>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+---
+ drivers/mailbox/arm_mhu.c | 129 ++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 125 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
+index 24999bb9dc57..5bdc494dc4ef 100644
+--- a/drivers/mailbox/arm_mhu.c
++++ b/drivers/mailbox/arm_mhu.c
+@@ -10,6 +10,7 @@
+ #include <linux/err.h>
+ #include <linux/interrupt.h>
+ #include <linux/io.h>
++#include <linux/kernel.h>
+ #include <linux/mailbox_controller.h>
+ #include <linux/module.h>
+ #include <linux/of.h>
+@@ -86,6 +87,14 @@ mhu_mbox_to_channel(struct mbox_controller *mbox,
+ 	return NULL;
+ }
+ 
++static void mhu_mbox_clear_irq(struct mbox_chan *chan)
++{
++	struct mhu_channel *chan_info = chan->con_priv;
++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].rx_reg;
++
++	writel_relaxed(BIT(chan_info->doorbell), base + INTR_CLR_OFS);
++}
++
+ static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
+ {
+ 	unsigned int pchan;
+@@ -97,6 +106,95 @@ static unsigned int mhu_mbox_irq_to_pchan_num(struct arm_mhu *mhu, int irq)
+ 	return pchan;
+ }
+ 
++static struct mbox_chan *mhu_mbox_irq_to_channel(struct arm_mhu *mhu,
++						 unsigned int pchan)
++{
++	unsigned long bits;
++	unsigned int doorbell;
++	struct mbox_chan *chan = NULL;
++	struct mbox_controller *mbox = &mhu->mbox;
++	void __iomem *base = mhu->mlink[pchan].rx_reg;
++
++	bits = readl_relaxed(base + INTR_STAT_OFS);
++	if (!bits)
++		/* No IRQs fired in specified physical channel */
++		return NULL;
++
++	/* An IRQ has fired, find the associated channel */
++	for (doorbell = 0; bits; doorbell++) {
++		if (!test_and_clear_bit(doorbell, &bits))
++			continue;
++
++		chan = mhu_mbox_to_channel(mbox, pchan, doorbell);
++		if (chan)
++			break;
++	}
++
++	return chan;
++}
++
++static irqreturn_t mhu_mbox_thread_handler(int irq, void *data)
++{
++	struct mbox_chan *chan;
++	struct arm_mhu *mhu = data;
++	unsigned int pchan = mhu_mbox_irq_to_pchan_num(mhu, irq);
++
++	while (NULL != (chan = mhu_mbox_irq_to_channel(mhu, pchan))) {
++		mbox_chan_received_data(chan, NULL);
++		mhu_mbox_clear_irq(chan);
++	}
++
++	return IRQ_HANDLED;
++}
++
++static bool mhu_doorbell_last_tx_done(struct mbox_chan *chan)
++{
++	struct mhu_channel *chan_info = chan->con_priv;
++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
++
++	if (readl_relaxed(base + INTR_STAT_OFS) & BIT(chan_info->doorbell))
++		return false;
++
++	return true;
++}
++
++static int mhu_doorbell_send_signal(struct mbox_chan *chan)
++{
++	struct mhu_channel *chan_info = chan->con_priv;
++	void __iomem *base = chan_info->mhu->mlink[chan_info->pchan].tx_reg;
++
++	/* Send event to co-processor */
++	writel_relaxed(BIT(chan_info->doorbell), base + INTR_SET_OFS);
++
++	return 0;
++}
++
++static int mhu_doorbell_startup(struct mbox_chan *chan)
++{
++	mhu_mbox_clear_irq(chan);
++	return 0;
++}
++
++static void mhu_doorbell_shutdown(struct mbox_chan *chan)
++{
++	struct mhu_channel *chan_info = chan->con_priv;
++	struct mbox_controller *mbox = &chan_info->mhu->mbox;
++	int i;
++
++	for (i = 0; i < mbox->num_chans; i++)
++		if (chan == &mbox->chans[i])
++			break;
++
++	if (mbox->num_chans == i) {
++		dev_warn(mbox->dev, "Request to free non-existent channel\n");
++		return;
++	}
++
++	/* Reset channel */
++	mhu_mbox_clear_irq(chan);
++	chan->con_priv = NULL;
++}
++
+ static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
+ 					const struct of_phandle_args *spec)
+ {
+@@ -214,16 +312,30 @@ static const struct mbox_chan_ops mhu_ops = {
+ 	.last_tx_done = mhu_last_tx_done,
+ };
+ 
++static const struct mbox_chan_ops mhu_doorbell_ops = {
++	.send_signal = mhu_doorbell_send_signal,
++	.startup = mhu_doorbell_startup,
++	.shutdown = mhu_doorbell_shutdown,
++	.last_tx_done = mhu_doorbell_last_tx_done,
++};
++
+ static const struct mhu_mbox_pdata arm_mhu_pdata = {
+ 	.num_pchans = 3,
+ 	.num_doorbells = 1,
+ 	.support_doorbells = false,
+ };
+ 
++static const struct mhu_mbox_pdata arm_mhu_doorbell_pdata = {
++	.num_pchans = 2,	/* Secure can't be used */
++	.num_doorbells = 32,
++	.support_doorbells = true,
++};
++
+ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ {
+ 	u32 cell_count;
+ 	int i, err, max_chans;
++	irq_handler_t handler;
+ 	struct arm_mhu *mhu;
+ 	struct mbox_chan *chans;
+ 	struct mhu_mbox_pdata *pdata;
+@@ -243,6 +355,9 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 	if (cell_count == 1) {
+ 		max_chans = MHU_NUM_PCHANS;
+ 		pdata = (struct mhu_mbox_pdata *)&arm_mhu_pdata;
++	} else if (cell_count == 2) {
++		max_chans = MHU_CHAN_MAX;
++		pdata = (struct mhu_mbox_pdata *)&arm_mhu_doorbell_pdata;
+ 	} else {
+ 		dev_err(dev, "incorrect value of #mbox-cells in %s\n",
+ 			np->full_name);
+@@ -275,7 +390,6 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 	mhu->mbox.dev = dev;
+ 	mhu->mbox.chans = chans;
+ 	mhu->mbox.num_chans = max_chans;
+-	mhu->mbox.ops = &mhu_ops;
+ 	mhu->mbox.txdone_irq = false;
+ 	mhu->mbox.txdone_poll = true;
+ 	mhu->mbox.txpoll_period = 1;
+@@ -283,6 +397,14 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 	mhu->mbox.of_xlate = mhu_mbox_xlate;
+ 	amba_set_drvdata(adev, mhu);
+ 
++	if (pdata->support_doorbells) {
++		mhu->mbox.ops = &mhu_doorbell_ops;
++		handler = mhu_mbox_thread_handler;
++	} else {
++		mhu->mbox.ops = &mhu_ops;
++		handler = mhu_rx_interrupt;
++	}
++
+ 	err = devm_mbox_controller_register(dev, &mhu->mbox);
+ 	if (err) {
+ 		dev_err(dev, "Failed to register mailboxes %d\n", err);
+@@ -300,9 +422,8 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 		mhu->mlink[i].rx_reg = mhu->base + mhu_reg[i];
+ 		mhu->mlink[i].tx_reg = mhu->mlink[i].rx_reg + TX_REG_OFFSET;
+ 
+-		err = devm_request_threaded_irq(dev, irq, NULL,
+-						mhu_rx_interrupt, IRQF_ONESHOT,
+-						"mhu_link", mhu);
++		err = devm_request_threaded_irq(dev, irq, NULL, handler,
++						IRQF_ONESHOT, "mhu_link", mhu);
+ 		if (err) {
+ 			dev_err(dev, "Can't claim IRQ %d\n", irq);
+ 			mbox_controller_unregister(&mhu->mbox);
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch
new file mode 100644
index 0000000..3749499
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch
@@ -0,0 +1,67 @@
+From af51d09655236217ffa349ac776a4e16890e1bef Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Tue, 2 May 2017 12:08:36 +0100
+Subject: [PATCH 6/8] mailbox: arm_mhu: add support to read and record
+ mbox-name
+
+Upstream-Status: Submitted [https://lore.kernel.org/patchwork/patch/791692]
+
+It's sometimes useful to identify the mailbox controller with the name
+as specified in the devicetree via mbox-name property especially in a
+system with multiple controllers.
+
+This patch adds support to read and record the mailbox controller name.
+
+Cc: Jassi Brar <jaswinder.singh@linaro.org>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+---
+ drivers/mailbox/arm_mhu.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
+index 5bdc494dc4ef..21259b252004 100644
+--- a/drivers/mailbox/arm_mhu.c
++++ b/drivers/mailbox/arm_mhu.c
+@@ -39,6 +39,7 @@ struct arm_mhu {
+ 	struct mhu_link mlink[MHU_NUM_PCHANS];
+ 	struct mbox_controller mbox;
+ 	struct device *dev;
++	const char *name;
+ };
+ 
+ /**
+@@ -249,8 +250,8 @@ static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
+ 
+ 	chan->con_priv = chan_info;
+ 
+-	dev_dbg(mbox->dev, "mbox: created channel phys: %d doorbell: %d\n",
+-		pchan, doorbell);
++	dev_dbg(mbox->dev, "mbox: %s, created channel phys: %d doorbell: %d\n",
++		mhu->name, pchan, doorbell);
+ 
+ 	return chan;
+ }
+@@ -380,6 +381,10 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 		return PTR_ERR(mhu->base);
+ 	}
+ 
++	err = of_property_read_string(np, "mbox-name", &mhu->name);
++	if (err)
++		mhu->name = np->full_name;
++
+ 	chans = devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
+ 	if (!chans)
+ 		return -ENOMEM;
+@@ -431,7 +436,7 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
+ 		}
+ 	}
+ 
+-	dev_info(dev, "ARM MHU Mailbox registered\n");
++	dev_info(dev, "%s mailbox registered\n", mhu->name);
+ 	return 0;
+ }
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch
new file mode 100644
index 0000000..2a60e68
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0007-arm64-defconfig-add-all-SCMI-related-configs.patch
@@ -0,0 +1,79 @@
+From 40cecdd2a60706782bc84b6cecf44f3701dbec33 Mon Sep 17 00:00:00 2001
+From: Damodar Santhapuri <damodar.santhapuri@arm.com>
+Date: Tue, 21 Jul 2020 16:17:11 +0530
+Subject: [PATCH 7/8] arm64: defconfig: add all SCMI related configs
+
+Upstream-Status: Pending [yet to submit]
+
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+---
+ arch/arm64/configs/defconfig | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index c9a867ac32d4..8322b217d1a1 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -75,18 +75,20 @@ CONFIG_ARM_CPUIDLE=y
+ CONFIG_ARM_PSCI_CPUIDLE=y
+ CONFIG_CPU_FREQ=y
+ CONFIG_CPU_FREQ_STAT=y
+-CONFIG_CPU_FREQ_GOV_POWERSAVE=m
++CONFIG_CPU_FREQ_GOV_POWERSAVE=y
+ CONFIG_CPU_FREQ_GOV_USERSPACE=y
+ CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
++CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
+ CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+ CONFIG_CPUFREQ_DT=y
+ CONFIG_ACPI_CPPC_CPUFREQ=m
+ CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
+ CONFIG_ARM_SCPI_CPUFREQ=y
+ CONFIG_ARM_IMX_CPUFREQ_DT=m
++CONFIG_ARM_SCMI_CPUFREQ=y
+ CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
+ CONFIG_ARM_TEGRA186_CPUFREQ=y
++CONFIG_ARM_SCMI_PROTOCOL=y
+ CONFIG_ARM_SCPI_PROTOCOL=y
+ CONFIG_RASPBERRYPI_FIRMWARE=y
+ CONFIG_INTEL_STRATIX10_SERVICE=y
+@@ -430,6 +432,7 @@ CONFIG_POWER_RESET_SYSCON=y
+ CONFIG_SYSCON_REBOOT_MODE=y
+ CONFIG_BATTERY_SBS=m
+ CONFIG_BATTERY_BQ27XXX=y
++CONFIG_SENSORS_ARM_SCMI=y
+ CONFIG_SENSORS_ARM_SCPI=y
+ CONFIG_SENSORS_LM90=m
+ CONFIG_SENSORS_PWM_FAN=m
+@@ -686,6 +689,7 @@ CONFIG_XEN_GRANT_DEV_ALLOC=y
+ CONFIG_CROS_EC_I2C=y
+ CONFIG_CROS_EC_SPI=y
+ CONFIG_COMMON_CLK_RK808=y
++CONFIG_COMMON_CLK_SCMI=y
+ CONFIG_COMMON_CLK_SCPI=y
+ CONFIG_COMMON_CLK_CS2000_CP=y
+ CONFIG_COMMON_CLK_S2MPS11=y
+@@ -851,11 +855,18 @@ CONFIG_CRYPTO_ANSI_CPRNG=y
+ CONFIG_DMA_CMA=y
+ CONFIG_CMA_SIZE_MBYTES=32
+ CONFIG_PRINTK_TIME=y
++CONFIG_DYNAMIC_DEBUG=y
+ CONFIG_DEBUG_INFO=y
+ CONFIG_DEBUG_FS=y
+ CONFIG_MAGIC_SYSRQ=y
+ CONFIG_DEBUG_KERNEL=y
++CONFIG_SOFTLOCKUP_DETECTOR=y
++CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
++CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
++CONFIG_WQ_WATCHDOG=y
++CONFIG_PANIC_ON_OOPS=y
+ # CONFIG_SCHED_DEBUG is not set
+ # CONFIG_DEBUG_PREEMPT is not set
+-# CONFIG_FTRACE is not set
++CONFIG_FUNCTION_TRACER=y
++CONFIG_FUNCTION_PROFILER=y
+ CONFIG_MEMTEST=y
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch b/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch
new file mode 100644
index 0000000..146ecb1
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/juno/0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch
@@ -0,0 +1,592 @@
+From 037f26919a5f3e1050395396de729dc42cab98ba Mon Sep 17 00:00:00 2001
+From: Sudeep Holla <sudeep.holla@arm.com>
+Date: Thu, 20 Apr 2017 11:58:01 +0100
+Subject: [PATCH 8/8] arm64: dts: juno: add mhu doorbell support and scmi
+ device nodes
+
+Upstream-Status: Pending [yet to submit]
+
+Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
+Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
+---
+ arch/arm64/boot/dts/arm/juno-base.dtsi    | 129 ++++++++++++----------
+ arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |   6 +-
+ arch/arm64/boot/dts/arm/juno-r1.dts       |  12 +-
+ arch/arm64/boot/dts/arm/juno-r2.dts       |  12 +-
+ arch/arm64/boot/dts/arm/juno.dts          |  12 +-
+ 5 files changed, 91 insertions(+), 80 deletions(-)
+
+diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
+index c47f76b01c4b..6a5be4a72746 100644
+--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
++++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
+@@ -23,13 +23,14 @@
+ 	};
+ 
+ 	mailbox: mhu@2b1f0000 {
+-		compatible = "arm,mhu", "arm,primecell";
++		compatible = "arm,mhu-doorbell", "arm,primecell";
+ 		reg = <0x0 0x2b1f0000 0x0 0x1000>;
+ 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+ 			     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+ 		interrupt-names = "mhu_lpri_rx",
+ 				  "mhu_hpri_rx";
+-		#mbox-cells = <1>;
++		#mbox-cells = <2>;
++		mbox-name = "ARM-MHU";
+ 		clocks = <&soc_refclk100mhz>;
+ 		clock-names = "apb_pclk";
+ 	};
+@@ -53,7 +54,7 @@
+ 		#iommu-cells = <1>;
+ 		#global-interrupts = <1>;
+ 		dma-coherent;
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 	};
+ 
+ 	gic: interrupt-controller@2c010000 {
+@@ -113,7 +114,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 
+ 		in-ports {
+ 			port {
+@@ -137,7 +138,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		in-ports {
+ 			port {
+ 				tpiu_in_port: endpoint {
+@@ -154,7 +155,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 
+ 		out-ports {
+ 			port {
+@@ -191,7 +192,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		arm,scatter-gather;
+ 		in-ports {
+ 			port {
+@@ -210,7 +211,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				stm_out_port: endpoint {
+@@ -225,7 +226,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 
+ 		out-ports {
+ 			#address-cells = <1>;
+@@ -260,7 +261,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 	};
+ 
+ 	etm0: etm@22040000 {
+@@ -269,7 +270,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster0_etm0_out_port: endpoint {
+@@ -285,7 +286,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster0_funnel_out_port: endpoint {
+@@ -320,7 +321,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 	};
+ 
+ 	etm1: etm@22140000 {
+@@ -329,7 +330,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster0_etm1_out_port: endpoint {
+@@ -345,7 +346,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 	};
+ 
+ 	etm2: etm@23040000 {
+@@ -354,7 +355,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster1_etm0_out_port: endpoint {
+@@ -370,7 +371,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster1_funnel_out_port: endpoint {
+@@ -417,7 +418,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 	};
+ 
+ 	etm3: etm@23140000 {
+@@ -426,7 +427,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster1_etm1_out_port: endpoint {
+@@ -442,7 +443,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 	};
+ 
+ 	etm4: etm@23240000 {
+@@ -451,7 +452,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster1_etm2_out_port: endpoint {
+@@ -467,7 +468,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 	};
+ 
+ 	etm5: etm@23340000 {
+@@ -476,7 +477,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				cluster1_etm3_out_port: endpoint {
+@@ -494,14 +495,24 @@
+ 		#size-cells = <1>;
+ 		ranges = <0 0x0 0x2e000000 0x8000>;
+ 
+-		cpu_scp_lpri: scp-shmem@0 {
++		cpu_scp_lpri0: scp-shmem@0 {
+ 			compatible = "arm,juno-scp-shmem";
+-			reg = <0x0 0x200>;
++			reg = <0x0 0x80>;
+ 		};
+ 
+-		cpu_scp_hpri: scp-shmem@200 {
++		cpu_scp_lpri1: scp-shmem@80 {
+ 			compatible = "arm,juno-scp-shmem";
+-			reg = <0x200 0x200>;
++			reg = <0x80 0x80>;
++		};
++
++		cpu_scp_hpri0: scp-shmem@100 {
++			compatible = "arm,juno-scp-shmem";
++			reg = <0x100 0x80>;
++		};
++
++		cpu_scp_hpri1: scp-shmem@180 {
++			compatible = "arm,juno-scp-shmem";
++			reg = <0x180 0x80>;
+ 		};
+ 	};
+ 
+@@ -529,37 +540,37 @@
+ 		iommu-map = <0x0 &smmu_pcie 0x0 0x1>;
+ 	};
+ 
+-	scpi {
+-		compatible = "arm,scpi";
+-		mboxes = <&mailbox 1>;
+-		shmem = <&cpu_scp_hpri>;
++	firmware {
++		scmi {
++			compatible = "arm,scmi";
++			mbox-names = "tx", "rx";
++			mboxes = <&mailbox 0 0 &mailbox 0 1>;
++			shmem = <&cpu_scp_lpri0 &cpu_scp_lpri1>;
++			#address-cells = <1>;
++			#size-cells = <0>;
+ 
+-		clocks {
+-			compatible = "arm,scpi-clocks";
++			scmi_devpd: protocol@11 {
++				reg = <0x11>;
++				#power-domain-cells = <1>;
++			};
+ 
+-			scpi_dvfs: scpi-dvfs {
+-				compatible = "arm,scpi-dvfs-clocks";
++			scmi_dvfs: protocol@13 {
++				reg = <0x13>;
+ 				#clock-cells = <1>;
+-				clock-indices = <0>, <1>, <2>;
+-				clock-output-names = "atlclk", "aplclk","gpuclk";
++				mbox-names = "tx", "rx";
++				mboxes = <&mailbox 1 0 &mailbox 1 1>;
++				shmem = <&cpu_scp_hpri0 &cpu_scp_hpri1>;
+ 			};
+-			scpi_clk: scpi-clk {
+-				compatible = "arm,scpi-variable-clocks";
++
++			scmi_clk: protocol@14 {
++				reg = <0x14>;
+ 				#clock-cells = <1>;
+-				clock-indices = <3>;
+-				clock-output-names = "pxlclk";
+ 			};
+-		};
+ 
+-		scpi_devpd: scpi-power-domains {
+-			compatible = "arm,scpi-power-domains";
+-			num-domains = <2>;
+-			#power-domain-cells = <1>;
+-		};
+-
+-		scpi_sensors0: sensors {
+-			compatible = "arm,scpi-sensors";
+-			#thermal-sensor-cells = <1>;
++			scmi_sensors0: protocol@15 {
++				reg = <0x15>;
++				#thermal-sensor-cells = <1>;
++			};
+ 		};
+ 	};
+ 
+@@ -567,40 +578,40 @@
+ 		pmic {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+-			thermal-sensors = <&scpi_sensors0 0>;
++			thermal-sensors = <&scmi_sensors0 0>;
+ 		};
+ 
+ 		soc {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+-			thermal-sensors = <&scpi_sensors0 3>;
++			thermal-sensors = <&scmi_sensors0 3>;
+ 		};
+ 
+ 		big_cluster_thermal_zone: big-cluster {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+-			thermal-sensors = <&scpi_sensors0 21>;
++			thermal-sensors = <&scmi_sensors0 21>;
+ 			status = "disabled";
+ 		};
+ 
+ 		little_cluster_thermal_zone: little-cluster {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+-			thermal-sensors = <&scpi_sensors0 22>;
++			thermal-sensors = <&scmi_sensors0 22>;
+ 			status = "disabled";
+ 		};
+ 
+ 		gpu0_thermal_zone: gpu0 {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+-			thermal-sensors = <&scpi_sensors0 23>;
++			thermal-sensors = <&scmi_sensors0 23>;
+ 			status = "disabled";
+ 		};
+ 
+ 		gpu1_thermal_zone: gpu1 {
+ 			polling-delay = <1000>;
+ 			polling-delay-passive = <100>;
+-			thermal-sensors = <&scpi_sensors0 24>;
++			thermal-sensors = <&scmi_sensors0 24>;
+ 			status = "disabled";
+ 		};
+ 	};
+@@ -677,7 +688,7 @@
+ 		reg = <0 0x7ff50000 0 0x1000>;
+ 		interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+ 		iommus = <&smmu_hdlcd1 0>;
+-		clocks = <&scpi_clk 3>;
++		clocks = <&scmi_clk 3>;
+ 		clock-names = "pxlclk";
+ 
+ 		port {
+@@ -692,7 +703,7 @@
+ 		reg = <0 0x7ff60000 0 0x1000>;
+ 		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+ 		iommus = <&smmu_hdlcd0 0>;
+-		clocks = <&scpi_clk 3>;
++		clocks = <&scmi_clk 3>;
+ 		clock-names = "pxlclk";
+ 
+ 		port {
+diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
+index eda3d9e18af6..e6ecb0dfcbcd 100644
+--- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
++++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
+@@ -6,7 +6,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				csys1_funnel_out_port: endpoint {
+@@ -29,7 +29,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		in-ports {
+ 			port {
+ 				etf1_in_port: endpoint {
+@@ -52,7 +52,7 @@
+ 
+ 		clocks = <&soc_smc50mhz>;
+ 		clock-names = "apb_pclk";
+-		power-domains = <&scpi_devpd 0>;
++		power-domains = <&scmi_devpd 8>;
+ 		out-ports {
+ 			port {
+ 				csys2_funnel_out_port: endpoint {
+diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
+index 5f290090b0cf..89c2f86890b2 100644
+--- a/arch/arm64/boot/dts/arm/juno-r1.dts
++++ b/arch/arm64/boot/dts/arm/juno-r1.dts
+@@ -96,7 +96,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <256>;
+ 			next-level-cache = <&A57_L2>;
+-			clocks = <&scpi_dvfs 0>;
++			clocks = <&scmi_dvfs 0>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <1024>;
+ 		};
+@@ -113,7 +113,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <256>;
+ 			next-level-cache = <&A57_L2>;
+-			clocks = <&scpi_dvfs 0>;
++			clocks = <&scmi_dvfs 0>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <1024>;
+ 		};
+@@ -130,7 +130,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 		};
+@@ -147,7 +147,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 		};
+@@ -164,7 +164,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 		};
+@@ -181,7 +181,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 		};
+diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
+index 305300dd521c..b1c304ce0181 100644
+--- a/arch/arm64/boot/dts/arm/juno-r2.dts
++++ b/arch/arm64/boot/dts/arm/juno-r2.dts
+@@ -96,7 +96,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <256>;
+ 			next-level-cache = <&A72_L2>;
+-			clocks = <&scpi_dvfs 0>;
++			clocks = <&scmi_dvfs 0>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <1024>;
+ 			dynamic-power-coefficient = <450>;
+@@ -114,7 +114,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <256>;
+ 			next-level-cache = <&A72_L2>;
+-			clocks = <&scpi_dvfs 0>;
++			clocks = <&scmi_dvfs 0>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <1024>;
+ 			dynamic-power-coefficient = <450>;
+@@ -132,7 +132,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <485>;
+ 			dynamic-power-coefficient = <140>;
+@@ -150,7 +150,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <485>;
+ 			dynamic-power-coefficient = <140>;
+@@ -168,7 +168,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <485>;
+ 			dynamic-power-coefficient = <140>;
+@@ -186,7 +186,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <485>;
+ 			dynamic-power-coefficient = <140>;
+diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
+index f00cffbd032c..a28316c65c1b 100644
+--- a/arch/arm64/boot/dts/arm/juno.dts
++++ b/arch/arm64/boot/dts/arm/juno.dts
+@@ -95,7 +95,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <256>;
+ 			next-level-cache = <&A57_L2>;
+-			clocks = <&scpi_dvfs 0>;
++			clocks = <&scmi_dvfs 0>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <1024>;
+ 			dynamic-power-coefficient = <530>;
+@@ -113,7 +113,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <256>;
+ 			next-level-cache = <&A57_L2>;
+-			clocks = <&scpi_dvfs 0>;
++			clocks = <&scmi_dvfs 0>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <1024>;
+ 			dynamic-power-coefficient = <530>;
+@@ -131,7 +131,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 			dynamic-power-coefficient = <140>;
+@@ -149,7 +149,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 			dynamic-power-coefficient = <140>;
+@@ -167,7 +167,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 			dynamic-power-coefficient = <140>;
+@@ -185,7 +185,7 @@
+ 			d-cache-line-size = <64>;
+ 			d-cache-sets = <128>;
+ 			next-level-cache = <&A53_L2>;
+-			clocks = <&scpi_dvfs 1>;
++			clocks = <&scmi_dvfs 1>;
+ 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
+ 			capacity-dmips-mhz = <578>;
+ 			dynamic-power-coefficient = <140>;
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 9224dde..79ef26e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -48,6 +48,18 @@ SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch"
 #
 COMPATIBLE_MACHINE_juno = "juno"
 KMACHINE_juno = "juno"
+KBUILD_DEFCONFIG_juno = "defconfig"
+KCONFIG_MODE_juno = "--alldefconfig"
+SRC_URI_append_juno = " \
+    file://0001-mailbox-add-support-for-doorbell-signal-mode-control.patch \
+    file://0002-dt-bindings-mailbox-add-bindings-to-support-ARM-MHU-.patch \
+    file://0003-mailbox-arm_mhu-migrate-to-threaded-irq-handler.patch \
+    file://0004-mailbox-arm_mhu-re-factor-data-structure-to-add-door.patch \
+    file://0005-mailbox-arm_mhu-add-full-support-for-the-doorbells.patch \
+    file://0006-mailbox-arm_mhu-add-support-to-read-and-record-mbox-.patch \
+    file://0007-arm64-defconfig-add-all-SCMI-related-configs.patch \
+    file://0008-arm64-dts-juno-add-mhu-doorbell-support-and-scmi-dev.patch \
+    "
 
 #
 # SGI575 KMACHINE
-- 
2.17.1

