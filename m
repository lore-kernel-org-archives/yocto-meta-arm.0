Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.81])
 by mx.groups.io with SMTP id smtpd.web10.3052.1588845682583361183
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 03:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9QB0Bw70;
 spf=pass (domain: arm.com, ip: 40.107.14.81, mailfrom: vineeth.raveendran@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwfDyuBgTbMqHNKGgtlS9zFGKwgu7kP1/qh8PUAzE18=;
 b=9QB0Bw705lmf/2aVy4tvbUIJ+789/ehUJ/FJiffEOXPhdYSsEuaZlQfi1FUqlv+Gm3KSWDGbVgWXyJiyWrnzX50+c4lh0wSFRn/ifcKOU3NuHRjejMSmRuexByJ2SKxyP2s1QB3hhps8nWYsFjV7wNr3/UpMo/OoXMX92o1+Wxg=
Received: from AM7PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:110::21)
 by DB6PR0801MB2102.eurprd08.prod.outlook.com (2603:10a6:4:7a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 10:01:19 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::45) by AM7PR04CA0011.outlook.office365.com
 (2603:10a6:20b:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Thu, 7 May 2020 10:01:19 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 10:01:18 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 07 May 2020 10:01:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70238f8c28b229d0
X-CR-MTA-TID: 64aa7808
Received: from 06258eff31ba.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9E0E11F1-CADC-4453-AF64-75FEEF655942.1;
	Thu, 07 May 2020 10:01:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06258eff31ba.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 10:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sn6AtzhZuccycPXXOtyhZcrCAPuxQT53r84Pqwya1qayQFNCTM3oe4o/oAGCUDzwYWrQ63kdsI5lnVG4BNQe/E7WLFcu9wRbXmR/da4uj/O/1UGBRUKkPfu1pOjsvRuXiM6xNfUxJP7AJaJtBJZtnBhh55aVjyMMh4Pl1GkU9cHj0uwiaxjrxFSTnACHQwqV4Qh1TjcJoMPV6A6zl8dx3R+WNKhyX8MWDcj+1EnNTrPzFof5IlDhAujHl5NAhmjc9mv2LGdS/Cnwk13HEfNS8bupsq366yYNzSmee4dDM5X38ckotplfYEuPFrMjOsKbRkSrgsGiMxIz1Dnq4WM8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwfDyuBgTbMqHNKGgtlS9zFGKwgu7kP1/qh8PUAzE18=;
 b=Q+dUHyQHfChhEhkQZGSpSD/GKhDw08+Vp6/D2S8QRRKRSgDY2TydlLQcg4Up6K8iymO5TzWqS40bHTk903okfcab0O/6PITOYH3K+lpC3Sxcblx42CGBSuFY0Jt8l5/YQy7XyXO/HfC0/Aqqg2cCo/dBu7Wm4fKM9CP88N6XVxRMKxJRhELT2JKo5UIZyofzgepgmeOYNZlD2gXlRaIqZBdD7cvvmyjkySGilE6Kdj7Biqhf1my3m6/G7tTuDyXFh1bfF+lwdNI8kfhbfqjVg3r9/KaedIOBzre7z+YDnxn/FuKUXGIUQSkVeKKBAFgQJgK667Y3kDQaRgEFwmwkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwfDyuBgTbMqHNKGgtlS9zFGKwgu7kP1/qh8PUAzE18=;
 b=9QB0Bw705lmf/2aVy4tvbUIJ+789/ehUJ/FJiffEOXPhdYSsEuaZlQfi1FUqlv+Gm3KSWDGbVgWXyJiyWrnzX50+c4lh0wSFRn/ifcKOU3NuHRjejMSmRuexByJ2SKxyP2s1QB3hhps8nWYsFjV7wNr3/UpMo/OoXMX92o1+Wxg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com (2603:10a6:803:bf::19)
 by VI1PR08MB5343.eurprd08.prod.outlook.com (2603:10a6:803:12d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 10:01:11 +0000
Received: from VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c]) by VI1PR08MB3696.eurprd08.prod.outlook.com
 ([fe80::e106:3936:4db6:627c%3]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 10:01:11 +0000
From: "Vineeth Raveendran" <vineeth.raveendran@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 1/2] [arm-bsp] add dunfell support for fvps, juno and gem5
Date: Thu,  7 May 2020 11:00:53 +0100
Message-Id: <20200507100054.25199-2-vineeth.raveendran@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507100054.25199-1-vineeth.raveendran@arm.com>
References: <20200507100054.25199-1-vineeth.raveendran@arm.com>
X-ClientProxiedBy: SN4PR0501CA0077.namprd05.prod.outlook.com
 (2603:10b6:803:22::15) To VI1PR08MB3696.eurprd08.prod.outlook.com
 (2603:10a6:803:bf::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123640.arm.com (217.140.99.251) by SN4PR0501CA0077.namprd05.prod.outlook.com (2603:10b6:803:22::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend Transport; Thu, 7 May 2020 10:01:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38e618ab-e6d4-47a6-cd57-08d7f26d9676
X-MS-TrafficTypeDiagnostic: VI1PR08MB5343:|VI1PR08MB5343:|DB6PR0801MB2102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB210250E87DE57911E9BD0A379AA50@DB6PR0801MB2102.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:170;OLM:170;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /curZtTqlksThm2No2dca4pLkSHTFriEHUs5yxX+0cI3FOtcK0vIRV9AhYLoIDgOB8rG+tgCV5fS97H7YSSVaN5YThREYpI2TCWQ9S8rMjgTk4xUSSJMkH8Q8pWr1/h9DZiD8MVzfIcdeuEIsIiL3ytw/ULYvjfY6Gw+lmxYgJmkCKB9H5FuUKrWKq4h4MJeZ2YHRwEYYg10i92nNu79NIJxzk4jP+ctxsNgw3/EV657tiyBFckBMRmLzfFU4Xwp2tUKnVN11jiE3EWSBuNBnW8p1wUOus1vZpdXLRkfIS7RK4TFAq6C0ygKdFHLWV7Ex+iawRp7h/LAF/WW3FcDIDvJ7SHyeuDRGCwG2DrE4pkB9HYt3nra/4QJq+BwP+7PUh2Xx31pPe+4NFCUSVjtk2SiKnL0QxnjssnqNs30ABAIBVwIpRi2yxdYDAgstkuKOWnCVVjgfjzFs/OvalopEEed9HUy4antGAQ/siXPUyHfW6N0tDvd/83YVfShHZ/uHlr4bFE4QfWG5D6nirwJLA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(33430700001)(316002)(33440700001)(52116002)(6666004)(6916009)(36756003)(83310400001)(83300400001)(4326008)(6486002)(5660300002)(83280400001)(83320400001)(83290400001)(1076003)(66946007)(66476007)(66556008)(478600001)(956004)(2616005)(44832011)(16526019)(8936002)(186003)(7696005)(86362001)(26005)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 mMrUPyRNTh7vvA6kDtsAlxAA/d89AzWDEOK5NOuF0hxNgWNdgHXXkmgBr5Yb3POpcowDtVtPTpdOJB/Gvo0XIX9mqQvcF4vYyjs9mzdx+fQwmi5Ba8zyIC4OBvyoDNbjATlrj4TYePWsSePsA85u+ABQdXrCK8Y3JdWSvHeWmJzK3kG4XJXM/2v855EqC+ekkBYzcmrqK0EPymJeI6ZyyUZyYDRdBaWVkPEkUgRK2tf5iUuK0ZkSoNNjFg035JbNgNF2mcpB5HSE7hqzoplJkJZQq6adXBLmEITmihg8mJHCRIsM25zH/qDEFZ1I6Jr1JEYTXSnc/1rmGLX8OSeJTSvdWXzvdYxuoAZ+do9qy1Zx2IW3nsCIEuiVuR8hgY8TxPUDxKHStvLoWkPbTDa37DXRYu+usv0ZYJped0uzkvu5ASbNuVM5rbsdUDNrqjY2L6onaTuMRfAD/FcHpbma5dNVeUqtd7otikcvnfwwH+/mX6JNWvnrQz5Yg1CVysvM8NHJ6Tzk7QViIEl5FBvIzp3G4trRpSpg/G4jpMhetXGyD4IcFPlyhKMukmoAioJOIpHUTXOb5s0kcZZocOmYPC3E0DtC2VY8T6NFtNiCdQGhCL0lsBgdj14mHimbWSezEFd39z8T4/OAtDRAAx8jn+AD9ex9xKrh8pnuLHkCfUwZ4nUaHAcQwCjFHu2DckWmmH9WiexD6LZXvhrMLKX/EyQ2buwUOyxx9xPCpixNFeEwrbbkp0msYvKFkXlmmmbSBp5mPptAwMAROHOgarcJK0ekcRpn4PHI1cVWHqmYgpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5343
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Vineeth.Raveendran@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(33430700001)(186003)(36906005)(81166007)(1076003)(2906002)(82310400002)(356005)(86362001)(6666004)(36756003)(6916009)(7696005)(82740400003)(478600001)(70586007)(47076004)(6486002)(70206006)(26005)(8676002)(316002)(5660300002)(956004)(44832011)(16526019)(2616005)(8936002)(336012)(33440700001)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1454cdae-b0f3-4a2e-3f80-08d7f26d9225
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wofmgu1MjN0oAZmthubPit8x3PsfGY5qbseZyr6GXNZXKMUtoI/7GQ8lZ3fcC8SIgod5AQf6FzJMJ9nZU5UWcZqohK7/zQe1kOLYIxpVvwzqpQ2xtnb0X8vl1/adEaRoaM/0h7DKxplILW3T9OcjsMkcrwgp2RAACpyqlHz0clYvXaEBmTqrbZsWLYzPEjqxJGqOaa9jlSdaqnZrpyG9gOY9QUwbdoiGkUpunjP7jDPiqgAuXI0lRyrJWyF+2/J+OxVjrT3w1htl16yAE82bkTwkcD5hmn4fzCy/6rENIooRrk+ZKzkZ2SReyRm2vYAD9boEbXb6RUWCXm9QIuyAs1+8eJSSNj33TYsJldeMgu/t4nowjo4mlT6D7DG5QKAPZxzSFQ4HusYfLpjJmv46jeUR1d8jcar4DWn54d5ZMtgarZ36h5c0BiwvcSVmA4WMlaDUlC7xFK2gMeBx8hkMZ5Ru4p2O9Ok4Xd+h1fxlMT4UfiAnhtaXlnVMbFes3CLUcA3VJs96MbZzTD4esvFrb5AgR0qE5kWQGOuHpiSs4l6J+VplDHbHEcN0/wDp99XTAAP85SY0ioh1j5u3E3hQYQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 10:01:18.4560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e618ab-e6d4-47a6-cd57-08d7f26d9676
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2102
Content-Type: text/plain

Make following machines compatible with dunfell:
- foundation-armv8
- fvp-base
- juno
- gem5

Major changes include moving kernel version to 5.4 and U-BOOT version
to v2020

Change-Id: Ia59ac874de4e4c4ea02c7a4f976e39a9b6996f75
Issue-Id: SCM-833
Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc        |  4 ++--
 meta-arm-bsp/conf/machine/gem5-arm64.conf           |  2 +-
 .../files/fvp-common/u-boot_vexpress_fvp.patch      | 13 +++++++++++++
 .../recipes-bsp/u-boot/u-boot_2019.%.bbappend       |  9 ---------
 .../recipes-bsp/u-boot/u-boot_2020.%.bbappend       | 13 +++++++++++++
 ...yocto_4.19.bbappend => linux-yocto_5.4.bbappend} |  0
 6 files changed, 29 insertions(+), 12 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
 rename meta-arm-bsp/recipes-kernel/linux/{linux-yocto_4.19.bbappend => linux-yocto_5.4.bbappend} (100%)

diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
index 702a1d2..08f8b15 100644
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
@@ -35,9 +35,9 @@ DISK_IMG_PARTITION3_CONTENT = ""
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "4.19%"
+PREFERRED_VERSION_linux-yocto ?= "5.4%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
 # FVP u-boot configuration
-UBOOT_MACHINE = "vexpress_aemv8a_dram_defconfig"
+UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
index e07cc81..4db86c9 100644
--- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
+++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
@@ -20,7 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 EXTRA_IMAGEDEPENDS += "virtual/gem5-bootloader"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "4.19%"
+PREFERRED_VERSION_linux-yocto ?= "5.4%"
 
 
 # Uncomment the following if you need to build gem5 provided bootloader, else
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
new file mode 100644
index 0000000..bdca202
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/files/fvp-common/u-boot_vexpress_fvp.patch
@@ -0,0 +1,13 @@
+diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
+index c9cec8322c..3a339be6a2 100644
+--- a/configs/vexpress_aemv8a_semi_defconfig
++++ b/configs/vexpress_aemv8a_semi_defconfig
+@@ -9,7 +9,7 @@ CONFIG_IDENT_STRING=" vexpress_aemv8a"
+ CONFIG_DISTRO_DEFAULTS=y
+ CONFIG_BOOTDELAY=1
+ CONFIG_USE_BOOTARGS=y
+-CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
++CONFIG_BOOTARGS="console=ttyAMA0 earlyprintk=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
+ # CONFIG_USE_BOOTCOMMAND is not set
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
deleted file mode 100644
index 1dd7d89..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2019.%.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-# u-boot_2019 patch for Juno board (Adding boot env)
-
-#
-# Patch u-boot to add environment variables from Flash
-#
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"
-
-SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
new file mode 100644
index 0000000..a46e36f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.%.bbappend
@@ -0,0 +1,13 @@
+# u-boot_2020 patch for fvp machinesboard
+
+#
+# Patch u-boot to change kernel command line
+#
+
+FILESEXTRAPATHS_prepend_fvp-base := "${THISDIR}/files/fvp-common:"
+FILESEXTRAPATHS_prepend_foundation-armv8 := "${THISDIR}/files/fvp-common:"
+FILESEXTRAPATHS_prepend_juno := "${THISDIR}/files:"
+
+SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
+SRC_URI_append_foundation-armv8 = " file://u-boot_vexpress_fvp.patch"
+SRC_URI_append_juno = " file://u-boot_vexpress_uenv.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-kernel/linux/linux-yocto_4.19.bbappend
rename to meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
-- 
2.17.1

