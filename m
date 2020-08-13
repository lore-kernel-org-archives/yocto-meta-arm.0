Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web11.11726.1597330376508670265
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CeLA5UuD;
 spf=pass (domain: arm.com, ip: 40.107.22.55, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0gwyDKoqtUnefSYnIzVN/gYucavQrzR1xEd6FEUIv4=;
 b=CeLA5UuD7rEyvPwYgxrp3+o+mnVcb9P/UtWrQm/Gvm2naNDo4N5cFeVJWQuj7h46H4bdEtd9XzBWTmuIqjJAfgQ4fDVakBFvPoNvZnL2WbhZwO2VWkqb5I4Sfk8W5w+D85qgAKby0OiXS7JZxXx7u3Uq6WqOBUiz7CuVeBDJoHs=
Received: from DB6PR0601CA0014.eurprd06.prod.outlook.com (2603:10a6:4:7b::24)
 by AM5PR0801MB1633.eurprd08.prod.outlook.com (2603:10a6:203:3c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 14:52:53 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::df) by DB6PR0601CA0014.outlook.office365.com
 (2603:10a6:4:7b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:53 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Thu, 13 Aug 2020 14:52:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93d6cdee08a50d04
X-CR-MTA-TID: 64aa7808
Received: from 618ea1642277.11
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A12649F4-B721-4250-A246-E8B42BFDB8AF.1;
	Thu, 13 Aug 2020 14:52:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618ea1642277.11
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHPfjuI/r9txjLMMnixPFICm33ssJjChXb7k9dkSeIHvvx2tz7UwonM5QpXQ1EYypvnwjqMoqD+fdcFOf+B6UZaaP1lHh5vl4hh/5WalkpLwlOcUmdSEqB+EUbHaRVtYF0O37UK+xskEE0aKhKrIum/KQr5AcfvxkAe+bV+VRox/CGPYSLhh8/GbcdK+5SuCFCmm3c4ktk31vzgkxwFqGkYPYLsmlDEx80gyJvFOl5ry/UJVK1eKHS1r5zWsb5T8stKxYzgGtrmz2ww7dnE0wsRyRRl8EIsYRXGQFA7viG1W73wf5O0/4LJEVDEWpTyxNSAFwm148WnCJaLzPlNXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0gwyDKoqtUnefSYnIzVN/gYucavQrzR1xEd6FEUIv4=;
 b=ekXFERJDiaHcbyNsb4DaB3dOl+j30dCOiRnPjsugkQD7WfgV35mXa/+aOnKJ6FRvd/BxI3f44FN1CSq8y8NWMg5ctehC8HJujTQi4+pNfX7V5PlUx2tHlUdoqb38TSTVNyFvTqq1mvIpKgU1/cTtTAo7GuYJClhoKXZT2IwIGdeCwGCmrdoxO6JZdfDi9v1N6D4+wdvm8r7rNbhVSLwPd7t3LWFqqmpY2m1xHDxXmdYgKk9JvwVHtRCVR8IkcH5NWKfKZlalTeaSMRy78NfXRZQt2CnJ7O9R75dcGmIPk4ZQxn4Ayv9d4HBAHDIA+LEUjrMey12D6jwMXnOX858M2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0gwyDKoqtUnefSYnIzVN/gYucavQrzR1xEd6FEUIv4=;
 b=CeLA5UuD7rEyvPwYgxrp3+o+mnVcb9P/UtWrQm/Gvm2naNDo4N5cFeVJWQuj7h46H4bdEtd9XzBWTmuIqjJAfgQ4fDVakBFvPoNvZnL2WbhZwO2VWkqb5I4Sfk8W5w+D85qgAKby0OiXS7JZxXx7u3Uq6WqOBUiz7CuVeBDJoHs=
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
Subject: [PATCH v2 5/9] arm-bsp/external-system: enabling corstone700 platform support
Date: Thu, 13 Aug 2020 15:52:26 +0100
Message-Id: <20200813145230.22140-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d06a20ae-42d6-4374-bfbc-08d83f988eec
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|AM5PR0801MB1633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1633127DAD980EB74BF5E8E3FD430@AM5PR0801MB1633.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:205;OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O7w/Isi9vd+EG7t5GdlFOExjhgehfPWm7sbNsA1SkjZ5L531qcejvO25RI/cDVLFoPxNSLvBs4AVvbcQl6XD05q1228tskHzUcEc4Iw/aooFvTtWe+K44+Yy9G09TbiZoLtK4Qr956sslyTtsXPs6X9aqmXbtJ3d/vzjqYKHwF2MSfFanO5T4pAcdlL4BYv3YSPfQ77rs1c2QPO7/J5RhWzFxwG/ul4xF1wVjBHD1El049UDMbfkpmQQl+cykj8ASBmg7XICec0vYhrQhPKwaLwp3oZoL8MwwH9OSmO+IC1hzw41P80svLZMwDsqF8I7
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(83380400001)(7696005)(2616005)(956004)(316002)(54906003)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 dMBxB5aI5gsbfEalnuF4jx5unsyrAagiUNg4ANYiBcNzhGTyfCmeHCuwxkTQ+OnrL/EV3sfuM86Ei6k+qIXy6Xt7McKQP6HEyzeLVlIEvbr/01h3NIY8rnISb0E6vkM4vlFBpILGNRK+9PhPd0OK9tC8XrTeHPlPMO1c1W4VIG1NRA4GbATTVC+qLxEK68k8KBL4lP5SKqFnrbMntPW6StTu4Xk/skBWIW9fWcEPBiIQS3iHam3ulVIOstrKvMgQPXmw2aE1oBa7W8RHaphBzykXeTB8Kn1tfMRGA2os2CO27fq04sZlY6ueDhV9GYgSNZ4VBZyCfFpFuieLe+dVAXf9xrTlWEDYEGTgmPvmmVNCV6w/gPUQ2QW7NxWYbz43R6Ch6oALQ3whAKvUbdAt/o1xgqtwMZ10jlN/DEVXGq9vJ8qPfcirctxi7tSajKnpbZ261QEVGb7kABAZAXB45i077zZh+j6X/6B6Np0dV8hxyxJPrhY5VwXvmHzReVEIAauQ0xQyKFMLuuCyV2x2Mae+kvIqlU3V2R8LAzam62Z4e+mLFynOcvcg+tgx/knyqhI41gIxmSvOQ47tevNJBoTNCtE3o6rFxjSB3XS+xyOpj97mrAvT9oLXG+kHByJkVrwLGqcGBrOv9xFCA9w1MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	61815396-61f2-4cd0-4c98-08d83f988930
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hcwJ2dX4hK8v76qZrNJNu+zOXfbzIFtw+aktLiihZeWVJX/EZ9aK4U3CeRFn5IyD2ZNw7n3+Zw/jcZuRROzhYXV/U1pr4QJTeccLzyLwnx3IZeLgxw1zq/aXFXPdk9sOy53ixahr02pjwgUg6MgR4F63VRLZ29RNzGhU4vF6crH3NOjUDu6ONg8UVSKG/zkwmSKZ/Iw+t4gZ6DcQukKNvEvuW1ctvlmWT2VkqbrhQQei60B/GDxdcfyw+LBb6Q5rJ5UHx8lgzlkPa2DzSSHrYMo3tPr7/34g1c/yPFJqtT2yTfuo8Y3PF+MFoUmP0WBz6E1b5ssV/vkSPflReQOhR01v9+VSiltQU6iaCS5heqN6BR7PESf34hzQ1UjWNsYKzEsJkdLK42pbLfMD3lus7w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966005)(81166007)(82310400002)(6486002)(86362001)(7696005)(336012)(2616005)(36756003)(82740400003)(47076004)(186003)(956004)(4326008)(16526019)(356005)(1076003)(5660300002)(54906003)(9686003)(8936002)(8676002)(83380400001)(316002)(478600001)(6666004)(70586007)(6916009)(70206006)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:53.8314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d06a20ae-42d6-4374-bfbc-08d83f988eec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1633
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit allows the external-system firmware to be used on the
corstone700 platform.

Change-Id: I746a970dcdceee60d91152e4315afa072ca843d3
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone700.inc             | 2 +-
 .../recipes-bsp/external-system/external-system_0.1.0.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 495fc30..4c00c6d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,7 +14,7 @@ PREFERRED_VERSION_linux-stable ?= "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
-EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system"
 
 WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 0aab8ad..84da7ce 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -10,10 +10,10 @@ SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/external-system.git;
 SRCREV = "41ef76951c5119729c1ea305406f74776da90866"
 PV .= "~git${SRCPV}"
 
-COMPATIBLE_MACHINE = ""
+COMPATIBLE_MACHINE = "(corstone700-*)"
 
 # PRODUCT is passed to the Makefile to specify the platform to be used
-PRODUCT = ""
+PRODUCT = "corstone-700"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.17.1

