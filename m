Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.88])
 by mx.groups.io with SMTP id smtpd.web12.11543.1597330374596945634
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c+yL4ay+;
 spf=pass (domain: arm.com, ip: 40.107.5.88, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYkacbdh7pzO+iee5cG6WMMU+gUZC4+06m3P/I6JfHc=;
 b=c+yL4ay+9RwYU/gdDdHS4VugJlxvSqbnlNTKojhWhtZJ7/dlUusl+x/3ndRkLGsverHYuLtqhK36ecp32IHyu2x+Bm0i4P2qRe9RXZQ3SY90jqdgFt03xl81Ph5I7RqAruaSo8+EJzdsYEKKFx0BOJTbJhiUYsr1sIs0F6CxlCE=
Received: from MR2P264CA0060.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::24)
 by AM6PR08MB3671.eurprd08.prod.outlook.com (2603:10a6:20b:46::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 14:52:51 +0000
Received: from VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::16) by MR2P264CA0060.outlook.office365.com
 (2603:10a6:500:31::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT033.mail.protection.outlook.com (10.152.18.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:50 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Thu, 13 Aug 2020 14:52:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ea48cb89edf20ab
X-CR-MTA-TID: 64aa7808
Received: from 618ea1642277.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 360DA692-0D58-4014-9719-CB4E6FF7CFA5.1;
	Thu, 13 Aug 2020 14:52:45 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618ea1642277.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeSnoUuV5B7GLM0bEtplgVAiAssObw79QyKCDKnIiUbQXUKOKuXgowEcUIBeLf8EvNHRZDbArBTckWBE3t9h+Xrsdyfx3auRftZWLY9jZ2FXN8xcrKHhm5AhwEaCB3Up/HvaFZc2ulbNwUIE1eCKzVmn2R9rXjNvRar5xw4Z2HaRT8iLjGo0vBKg9NjMVIxhHrX0jNFNALHhl/8IJr7GSjDmBAOrUmLaLpoFAq2gWN3bLhDoN5LXHLrYkdOeSEzfJrBYd9RU/3TwfAg9zBpdkDjNASi841Y3DngH4nsDesov6C0ctRWSm2VXtSLHUiq3Reo7Zl3T/+ruxlR0nCLmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYkacbdh7pzO+iee5cG6WMMU+gUZC4+06m3P/I6JfHc=;
 b=e0ZOVIoipohmBX58HDhDjyr7AjFfy90Jlln/pzUy9AQ/sZKgd7SrMCza6lSwhaUWcvPNYDHv2p2VClpVfxzG0hgDHBKe5vpTpegDi084zQPTamtJi+EXfr7sn8nOijFcVcD7/YLtyESaNKf6UGnFyD5kDYi0k7TgLS+Il/QpbDrlAsVy3DH5RjmZNCpQsoMeCOLAW/bRSzDEbQvcWC8ih+F2/kTeCbARuFojn9vZso0Tb5nQH1MQbQWP9EVET/C716NVUarSX4SdemPXQ9Bz32xhTKPXrKxhAuq9EoUQO4MZiuCgTsuYoGhQ2Zs0pl1JLyPQCRwU6d8QoRX8KUfFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYkacbdh7pzO+iee5cG6WMMU+gUZC4+06m3P/I6JfHc=;
 b=c+yL4ay+9RwYU/gdDdHS4VugJlxvSqbnlNTKojhWhtZJ7/dlUusl+x/3ndRkLGsverHYuLtqhK36ecp32IHyu2x+Bm0i4P2qRe9RXZQ3SY90jqdgFt03xl81Ph5I7RqAruaSo8+EJzdsYEKKFx0BOJTbJhiUYsr1sIs0F6CxlCE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:44 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:44 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH v2 4/9] arm-bsp/trusted-firmware-a: adding support for corstone700 platform
Date: Thu, 13 Aug 2020 15:52:25 +0100
Message-Id: <20200813145230.22140-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: df95382a-7b7a-4508-79aa-08d83f988d40
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|AM6PR08MB3671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3671256068DE38993162BA4BFD430@AM6PR08MB3671.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:612;OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WkT6s5nQOGoCWqX7jdlpoJ1cHNh4vpaq+JjS9AywfR9paP+f9YAOHeqtzeRGbisWA5QlqpeNshE+ILvPg8KUQ/U8SSPWuNZ3mVnTVhFWps2crkECPzSIM350wf62z3x0aWE0r4yxe5T2bbt9LpDh3bdKqQ0OVyML5ZTb3K5Gtxpt+Xv61cgbmMBj7t/iolq6rcnw7IgWQDB4i0GBO3eK0XkFae0WDq0Yf93xe8pNXH3qObj3B0AaoOzU5qi049WPn6qE0xkDfz8oiFhmRjPkznHufeTTKiDgGvIUt/i65saWiVuzWCg5OFlV/tZ/i82XUrfi64fvFC/xzh0xmjFslQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(83380400001)(7696005)(2616005)(956004)(316002)(54906003)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 F5euF82kNBu6vT9NRfqq6Xflt0+9hLbrUHXAe4njBwU2GAdTB670aC3iyEolVVDg+YRJINwj5YRb1u1Wt0y/0reMfcEeOifZ9H/1m1E+K+x5ii0aGUT82XiFMZ0vU03VGXmhOGmyD7G0b+Y8dGd9uAlYSMyABOWx+xzMX3A8AbbPaWmNSxrg4k/8lzlJH/K1c2IJxkRI82U6wacxMjmWb4vBbScbjsTlTQ5KPFRMi1/DHvtE2MUMbMzyDoGXMrIWpho1pYTpw7MTSSAmSpgpraEuURSx/w4nbnKo5/rAw4QsYF9lrEdp3yR9kGezKE21AEGnpss3uAEs11hvBpRPWOhy4Da5TcyoPd726p1u9vJ0rxlXF8mb7UIVh9mLXhW/nbRIgozDNh7CUThRM3ZsBFuHtd4FgWuW9BM6YzLPsLCvEiwNIxR4BFFnvcmMR9LaaLjY59WTWhz98juSv2DSH9zsLv5k67ixhw5gdnbT9sGCqYFK0bhBTbqROahgpt/jafFKZdDw3cO3LekcNp9MgXX64+UrO7m1zQsFSLkpptmrw90a89fWCEANgejQY0wxUaU+Onau0EdRv5B4ogHkUxfcDOx90l6I3GcL6Wj1zg9HzMTYqPxUHAjZ+OY4GOAbihiVOynaqp7EGz/jNVWwzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	437138cf-e841-4c2d-8fec-08d83f9888de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DnEetKa5hyEoB0g1SNrn9Ij+ZF6MKaXoP/kHYGJamB0X3q82ig7NBP8UUSujwQRKclVO2og/I/5NdeiYdXC1O04pgEVJEoZDwwyLe8AOYrugU8J7hfu9sk+VZAtT7QoArzYEkdMpVsp14r+lpi2dBfFPxzEtNeMw0ZhETMzgNrNRJ41KoZnzFEpCJ8ZMWNaEgAphGpgRXKn/POHJ51j4K94vj/AmY2rz+7zcIleknVKMLN+kUGrSAkHC30mNP/tiIFQm7foy5e5qWHIvNz+3MV+cSYuqKHiGynZkmbeSB/QU+dnTov0IXHbjHJ68lWY2yLLQdJdg4thw7+uou+nfr8z8XpqHyD74Xp0rsyElXUGH84Ign63FtbcO+V0S1b403XIxee8EV8CDmP1L8cikig==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(70206006)(7696005)(5660300002)(186003)(16526019)(36756003)(36906005)(26005)(54906003)(316002)(86362001)(336012)(4326008)(70586007)(6916009)(6666004)(1076003)(956004)(2616005)(6486002)(478600001)(2906002)(47076004)(82740400003)(8936002)(356005)(82310400002)(9686003)(81166007)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:50.9197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df95382a-7b7a-4508-79aa-08d83f988d40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3671
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds support for trusted-firmware-a to the corstone700
platform.

The trusted-firmware-a runs on the host processor.

Change-Id: I70ae2715e640bf50c756229a734dcb663c2d8e4d
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/corstone700-fvp.conf         |  2 ++
 .../conf/machine/include/corstone700.inc      | 11 +++++++-
 .../trusted-firmware-a-corstone700.inc        | 26 +++++++++++++++++++
 .../trusted-firmware-a_2.3.bbappend           |  1 +
 4 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc

diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
index a968b39..2ee3b52 100644
--- a/meta-arm-bsp/conf/machine/corstone700-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
@@ -8,3 +8,5 @@ require conf/machine/include/corstone700.inc
 # add the following line to local.conf to disable the feature:
 # MACHINE_FEATURES_remove = "eth_lan91c111"
 MACHINE_FEATURES += "eth_lan91c111"
+
+TFA_TARGET_PLATFORM = "fvp"
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 67cf153..495fc30 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -4,11 +4,20 @@ require conf/machine/include/tune-cortexa32.inc
 
 MACHINEOVERRIDES =. "corstone700:"
 
+TFA_PLATFORM = "corstone700"
+
 SERIAL_CONSOLES ?= "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-stable"
 PREFERRED_VERSION_linux-stable ?= "5.6%"
 
-VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
+
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+
+WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
 WKS_FILE ?= "arm-reference-image.corstone700.wks"
+
+VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
new file mode 100644
index 0000000..175e333
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corstone700.inc
@@ -0,0 +1,26 @@
+# Corstone700 machines specific TFA support
+
+COMPATIBLE_MACHINE = "(corstone700-*)"
+
+TFA_DEBUG = "1"
+TFA_UBOOT = "1"
+TFA_BUILD_TARGET = "all fip"
+TFA_INSTALL_TARGET = "fip.bin"
+
+LIC_FILES_CHKSUM = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
+
+# TF-A v2.3 is not used because the following commit is needed:
+# corstone700: splitting the platform support into FVP and FPGA
+SRCREV_tfa = "ef93cfa3a2591084307a41e64f1cbba327310749"
+
+PV = "2.3+git${SRCPV}"
+
+EXTRA_OEMAKE_append = " \
+                        ARCH=aarch32 \
+                        TARGET_PLATFORM=${TFA_TARGET_PLATFORM} \
+                        AARCH32_SP=sp_min \
+                        ARM_LINUX_KERNEL_AS_BL33=0 \
+                        RESET_TO_SP_MIN=1 \
+                        ENABLE_PIE=1 \
+                        ARM_PRELOADED_DTB_BASE=0x80400000 \
+                        "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
index 8743ec5..0e6fb1e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bbappend
@@ -7,5 +7,6 @@ MACHINE_TFA_REQUIRE_foundation-armv8 = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base = "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_juno = "trusted-firmware-a-juno.inc"
+MACHINE_TFA_REQUIRE_corstone700 = "trusted-firmware-a-corstone700.inc"
 
 require ${MACHINE_TFA_REQUIRE}
-- 
2.17.1

