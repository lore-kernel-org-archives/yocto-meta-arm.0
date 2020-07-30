Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.83])
 by mx.groups.io with SMTP id smtpd.web12.10325.1596121489306874864
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JNalxo5e;
 spf=pass (domain: arm.com, ip: 40.107.8.83, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsk15akv6hANVBk6GAspYz27QmNO+dYhKvy4QrS8rj8=;
 b=JNalxo5e0xoW/KZ0kggoY6l1FksLqGdkpdajVcYlZbs0bvaAC2NahAb2P+htoZGKRNePbeORLayiK2jH9I7weWf/JWi6qsiZEY8FP0ty7Jie+zLqnrU4UoPWNt/rKm4mSwptGY3WYxBiFMWY2OSZpGeX8cClDyf2OjQACKqz7Ho=
Received: from DB6PR0202CA0030.eurprd02.prod.outlook.com (2603:10a6:4:a5::16)
 by VI1PR08MB3165.eurprd08.prod.outlook.com (2603:10a6:803:45::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Thu, 30 Jul
 2020 15:04:46 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::9b) by DB6PR0202CA0030.outlook.office365.com
 (2603:10a6:4:a5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Thu, 30 Jul 2020 15:04:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 15:04:45 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Thu, 30 Jul 2020 15:04:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 847e3d0bb7418bd0
X-CR-MTA-TID: 64aa7808
Received: from 9b4019aa9cd4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0BFF6601-9B6F-4CB8-9F62-DDA0BA55695E.1;
	Thu, 30 Jul 2020 15:04:40 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b4019aa9cd4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:04:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2GiV+QR7P+A/6yQMP2X+1SHOUBeZKAC35T5/x2n47FkDsPCTOwHyChUGTZFgpvQW17LmJ5nOLSbv0FLaMYUTFxs4/VTihzslEUs8/E2V7QfCDjieUBbo3BqVuKS4ViBErRwjMd1F10PCqO0nS3hP+0gTL/J2ePbq/dBT3SGZC+vof0ATOIke7OtvwtHhPrzLJUaXYZ6Ev8J1H6aE8TJAR2Hv+fEtOhIsGWWZr1KvOGhCAVwxDQ/KJjJKBr8kWLbFZ5lKh/7s8bNRlmvqZyeLEwm1Hl6HnnZRZ3ZTpdy/L+YHL6lrkrbS/cURPB5IZ4LqbWBxJbe7gZOKor0Rk6kUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsk15akv6hANVBk6GAspYz27QmNO+dYhKvy4QrS8rj8=;
 b=Zx4HrTPw1056zQHI+KBoypArSqtrSz6YIUCfrLijAwRtc+i2LVMVMZl4pV+DOvpeFSWSEVCET6/sfChTodtWyav/m0jsd0wWs0uPrGPs0UAAihqDBYcXlljOVzGCPcKfz9dQxBX+p0LN3pkjiFpk4SYs9YX2e/C9wQmKlfZMSDgF5BAdELi5N6d9UhGLXw3Y4nD9opcU5gX5eGKx7tLRuVlG1boUYNtYduzG7VHvm8FjIJt1mOyg6X6cAPcP3YD9rQuBplWaHTgXxcIgXAHyIO3fSNuSXyoPKNSu8Tx2dnLsTC+d0gAhmqubgRHqZJ57Q5tfAnRlN3Wx0Adv8Fqxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsk15akv6hANVBk6GAspYz27QmNO+dYhKvy4QrS8rj8=;
 b=JNalxo5e0xoW/KZ0kggoY6l1FksLqGdkpdajVcYlZbs0bvaAC2NahAb2P+htoZGKRNePbeORLayiK2jH9I7weWf/JWi6qsiZEY8FP0ty7Jie+zLqnrU4UoPWNt/rKm4mSwptGY3WYxBiFMWY2OSZpGeX8cClDyf2OjQACKqz7Ho=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB7PR08MB3706.eurprd08.prod.outlook.com (2603:10a6:10:7f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 15:04:38 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 15:04:38 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/linux-linaro-arm: remove disable of CONFIG_EXTRA_FIRMWARE for N1SDP
Date: Thu, 30 Jul 2020 20:34:26 +0530
Message-Id: <20200730150426.27645-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::24) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 15:04:36 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b66fe4a4-a8d9-413d-5c04-08d83499e577
X-MS-TrafficTypeDiagnostic: DB7PR08MB3706:|VI1PR08MB3165:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3165DC31FA665A404B1D2C6CFA710@VI1PR08MB3165.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:529;OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MQXzTomhAl3l4cvS9BZsOLLbwM/mggJgo6+S2pwk6IT+Qp+1IjRSZ/fFjfS8+tVDLuip3TfEJDLZSwcn6FWARFunSDAaT+NS548WI0b4mFKZDQRLoUmOTELMApNtXYR/24H2xZIyeenT10L8vQ8XsHmfXep1yqtaluqN0HazEpm5FCbtLUtREWtVAuokPLOOkAxENPtdtmLXh5Eq7yOfexzvXbC1N+Y4hCpdYtO/R+oTuYlAm5eAPdbxJpHMjVwDGbztxDU0poY4QkAQf0GHS6HUC6c/xFEsKh7TDlqc7Vr9uxpHwGFtnAxdAKeUBCVX+fcApZw6sP88c8kr51l3I/5cquxb19OOf2rdxa7UYKFB2Lfm1Qh6Vo29+h7LtrjW
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(36756003)(6666004)(1076003)(8676002)(66946007)(66556008)(5660300002)(66476007)(8936002)(86362001)(2906002)(4326008)(2616005)(956004)(7696005)(52116002)(186003)(16526019)(6916009)(6486002)(478600001)(83380400001)(316002)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 o4Yo5GbLgihB59AU/RAAlRJ4qp39U+K1Sh+VOic+1xBMH6N+busWfFEAYwle8RIUIi0jLR1++9su/jAt99csSUXMRHe70ufw6PPRE/2naDuayQP+6VKNscRu9RwEONiqH5ccoqawDXaEx/bil+68ohmiwxZ/YJK+DD2MW4OwDuT5iIqtuwrjunVcCcdBl118X4uqH22dS7inEWARR3AzYDR+RuLSH9dvmKwJgsYMENhiursFzegBoFOCx6ZS6SkDdC4NFXPVDHy/bJ/ptakbvpVJ4H3RavCLifFsOaSDa/xANYNTV1ijL9ooG9LitKOP+aDKCJ+gOGUEJNis6RQk/44zoBPbsE/4cI9qFCnp5fJgNUtmOZfDYKf0Hs1bXcPTioDYS/5V0p1yVeWmPVGZIl9BHvB8eRsASE1x0OZ/S64smS7R0g6jKjVA6IN+IFECtIviNP3TexNraqKrvfQtW3qBQwzgbgnUTNuWSw8TRczx7OWUM9VYLfTwXXhnrZj4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3706
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	095775ca-0be4-4497-d6a4-08d83499e0a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5YRh1UsNlIVkqugs4qkAwLMw+ALaOE7GrUheZzDwpERbD6oZ1OiAa7+4g5yzCJA+HGa60d9aIAe0KjbLrOf7U4CTX3q2+oQAKTr93kEhIAzGqpzQM/7x9t4VqQ6V3FXvl6b0IEubvwCtAWn1L+ynTQcmdMMf0KFDYWbSxs4vYbEXhkKg3AFfz1jdNteMQ/kLJRQFY53m/LCdO20Zdbvq3t9CrfDW227A6C8XxY/ZToqS043lSl7RZT8rKpHNwPdBsTOyYtiCbkwgD5nl4UxZXs7yauf8czKclxuVn575NW6QVUOT2U7LvY2UpJAta1mTL5LD31LoH3Kf2jBaPJ5zdtvBBkT5HuFwsgxjYDDp8HYcgMbtOZ/J0q6vwes8O6onL6YO9D1JHmxXp3Kl7wbL0IarTBD2FDG+tKDInuTHVI0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(356005)(70586007)(82310400002)(70206006)(83380400001)(2906002)(47076004)(5660300002)(316002)(8676002)(8936002)(956004)(1076003)(86362001)(4326008)(478600001)(36756003)(7696005)(6916009)(186003)(336012)(82740400003)(16526019)(6486002)(2616005)(26005)(81166007)(6666004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:04:45.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b66fe4a4-a8d9-413d-5c04-08d83499e577
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3165
Content-Type: text/plain

The kernel defconfig has removed enabling of CONFIG_EXTRA_FIRMWARE,
disabling the CONFIG_EXTRA_FIRMWARE isn't required.

Change-Id: I032b1aa7dd84c63f6aece5f24dbab43d14da278c
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg       | 2 --
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
deleted file mode 100644
index 35afddd..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/disable-extra-fw.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-# We don't want to build firmware blobs into the kernel binary
-CONFIG_EXTRA_FIRMWARE=""
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index dcc6e47..029dbbb 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -11,7 +11,6 @@ SRC_URI_append_n1sdp = " \
     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
-    file://disable-extra-fw.cfg \
     "
 
 # Referring to commit TAG N1SDP-2020.03.26
-- 
2.17.1

