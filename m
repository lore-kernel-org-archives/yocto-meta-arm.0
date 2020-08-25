Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.55])
 by mx.groups.io with SMTP id smtpd.web10.5868.1598322760725374806
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 19:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LMGxGsu1;
 spf=pass (domain: arm.com, ip: 40.107.8.55, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIYKy4G8x2kPH+AJznTO3nb7IID9mcOSufmfldHjQ4o=;
 b=LMGxGsu1EMUJOPlBdmzULfg/8KyG/1Fg3bsyS00loqTz7ysS0E93da5yAFUwOlkSKfGRcW9d9q8hWJNA+zi5URCyWZvpgBnTkVRGAhlsINpjMd0oGlJ7RKuAZJ4u8HyM8gjNFHzLzZ9EVHoKixq47HM1s8FyvKTQO9/4llcGFmw=
Received: from AM6PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:20b:6e::33)
 by AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 02:32:37 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::62) by AM6PR02CA0020.outlook.office365.com
 (2603:10a6:20b:6e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 02:32:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 02:32:37 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Tue, 25 Aug 2020 02:32:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: deca7d774d84d3c7
X-CR-MTA-TID: 64aa7808
Received: from 9745d5484500.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3A886C15-07E8-4A20-BAF9-ED309779A5F5.1;
	Tue, 25 Aug 2020 02:32:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9745d5484500.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Aug 2020 02:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCxczw8T5Q80a+FI+jEzgPnJhyRVCruicvZIB/O1zjOKJtWl4u25Ymyvi6vEZceHwlPXM+2pUwg/LDLCJ1malqPSkC+YblhsSt7XwOkXDW6pA06XjjmjNObEN+6PnjAFl1o2xiWDVP9pBW6lyLyovDu5ICpaLTfI6sGMEABYhUvKotLc/nWKwAAuBFjEZuqGkihFU0N7uQHlgOHSESHnSHluY1EjdcX+9MIg6GiM0PPgy4fhiAt4AKx3xCnxXiMsWuj81FPwybC3MOYhmHUtB0z81b9gpazWGOrkaqgZvomFxFoifMweGKsYu0piPAPK2A/Sz9DArnLQc75BsRy2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIYKy4G8x2kPH+AJznTO3nb7IID9mcOSufmfldHjQ4o=;
 b=Wr+91P3FUwjRCfkycNDOyGKJOa5MHwo8Kdb1r9i2E+fv3Zt8kGAfv0FlG8x7EUrks/QGpZ9DRs9Qe78riLPsl4UJYnaSw9535udI3XliyUYIswKS+J0Hbav5s9JWNYuKQOObIyKnVD7tZC7yR79DsE6GaLFMRxGdSgPKyyiCFk8goaLRXOhz6Kis4c6iX/XlBRRtP3QYxRbavnH+xOpkrb3U+13wTRKYQ7DVEpAKW/m8eS7D28YuVZ9X1UULSI3tS+7Pw8PqEzEvk4Nvr/zD+wbbB4qpS2IIIBHO3fkMMIb/DF2+AReGXb0VgblHy0YueQPwOG6tEqTqC5dxVmrriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIYKy4G8x2kPH+AJznTO3nb7IID9mcOSufmfldHjQ4o=;
 b=LMGxGsu1EMUJOPlBdmzULfg/8KyG/1Fg3bsyS00loqTz7ysS0E93da5yAFUwOlkSKfGRcW9d9q8hWJNA+zi5URCyWZvpgBnTkVRGAhlsINpjMd0oGlJ7RKuAZJ4u8HyM8gjNFHzLzZ9EVHoKixq47HM1s8FyvKTQO9/4llcGFmw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM4PR0802MB2259.eurprd08.prod.outlook.com (2603:10a6:200:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 02:32:27 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 02:32:27 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm: trusted-firmware-a variable name misuse
Date: Mon, 24 Aug 2020 22:32:19 -0400
Message-Id: <20200825023220.27193-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:5:134::23) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.110.7) by DM6PR13CA0046.namprd13.prod.outlook.com (2603:10b6:5:134::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend Transport; Tue, 25 Aug 2020 02:32:24 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 24 Aug 2020 22:32:20 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.110.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce30aa9a-9f10-468e-838f-08d8489f21b7
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2259:|AM0PR08MB3682:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB36827DF18567661513BF9B4CF0570@AM0PR08MB3682.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WdouOoRBv5ZohO3Y18cvo6TkBFbOkp4VSL3Ltr3CuWeMKPubN9aOOQmP2gILwHXTNcFeGEJk75yAqGGy2Tclllho/rScLr8t8DwRCyH6Tx8YVyPkbTUR3H5pCA5MUz5Ve9EtUtPPAArRY9tog+mD/ARAt4tNy4OQOab5uiO1NMxhv3HcS0VuwQcEHXtuFpVzRVw3A4EA9giCPXVfLGsD5KmK41Zc7zmLHv8dcMq7xrezN4gjHwWmWCMgkLVizk4I3tQb/M8oH5qACWJEEd6BdkBASMCZU4ixZLk+/Loi9Qu8rc19kMpUbKVoW8DR7AwPplhzKaFxSwW/i4hChYVJF0DhjEZrqWYBK6zEG93YQ9SKsNW+sG6q6QTvCZ0fMqMl
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(44832011)(42186006)(426003)(36756003)(316002)(478600001)(2616005)(52116002)(26005)(83380400001)(86362001)(186003)(66946007)(66476007)(66556008)(1076003)(8676002)(6916009)(8936002)(4326008)(2906002)(5660300002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 EfRmDEPZUlUAct6jhhs/r/wxef9F9dEDRH3RCz0fwVhuX3XX85+TkazvizSPWyP+Q34h3FkhYsgkoEKa44ZhwYVUitKg4fcivZanqPtvuTxBAvQZsNQwlpXISgkNAwasw8DZpnyEJr2i6VECSNSP5kWziveX4aBVn0t6smcapo9aFVGO/IiusvoNJyQjF/0rre07+hCrPkDdEv44vTVdIcRW4aiM14mLp6BVoqmYcxr8iPpycrE6MI0u9ZLxJTfDPHBQR6MZRH8kJBwqIjQbOXRcqj0SA8vvu08XRXOYBw9gaDU2G4fU433AHkYPi2qXhsRDlFF6vrtoX6zVc6OWu/dV8zv1yuMDMlx50PX59u9jM0rmDZnJC1K9JG8LKyCPOt/WsQRJtfTX9FXKhG+pvmvxFaWCzHEl3eHCrTVuS4FtpHxa5Feqo7ouvv2KJljdyh9BUJc11wftu0dCPZr0WcGZ9e4FAUiEXFNZVcva335uSYmsS52eYkwb4Cr5z25dB1e6Q/3dCN84AkedLjGmjmpJT6OCT6QT7xGihA0SngC9JNgVjw+eb8qb1DhedWPyscA9RyOfYuQfa9AzBuRGVTxBAOblhlC2LDRpYHXOTpW33pTWUpUAE293wNRXXEx2ZlKx6L/PzXpFZRJQT8jovA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2259
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6d34c101-4cb0-41f3-5840-08d8489f1a97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sRjhJUP49/HemILAjWc+Ybfg2zT1Td67HOsHL4DLiYIMDnXBvChunBX10ZU4s2BeGqDSzLjtiy0aFzQ3kW0x4nQZr9xXMTodneTwLbJAcxz5lQ2llUjiYDLSDJBZlH5RAM2xiCpl6eChEejLRrUQ19JqNV3W6+9sm/YKICRIj7I/eMjqpACkyqdyqS3h+IdXO9tLyqVhRA7oP9rj9c9rC0ZPlzX1mt8Ej6G8or77ijrdSACtR9Ov1f4mkIXkViJ/snGw532OWzTRAvokE3OHcqdQom39i3WMlimWTN5AqPAsVgx71v20o1Ft1HqZc5dISRjPKNyWIh3m/3ylKs/kwUtGbQUwbiHbtnXNI4KsTmh2teL1gT4j46TeSKm7jnPRXZIOoczjMGBcMvIGPYKZTRXqxSVc1DtET5rWYjldlTw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(36906005)(82310400002)(26005)(478600001)(8676002)(186003)(81166007)(6916009)(1076003)(83380400001)(42186006)(316002)(356005)(8936002)(70586007)(5660300002)(82740400003)(47076004)(36756003)(4326008)(86362001)(2616005)(426003)(336012)(70206006)(44832011)(2906002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 02:32:37.5000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce30aa9a-9f10-468e-838f-08d8489f21b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3682
Content-Type: text/plain

"processes" should be "processed" in trusted-firmware-a.inc, as it
signifies if the relevant part has been installed/processed.

Change-Id: I2d1ffbb0c6d14d280b6f9c9cc45c04c7c32409a7
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 4956c4f..e1cffdf 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -136,7 +136,7 @@ do_compile_append_aarch64_qemuall() {
 do_install() {
     install -d -m 755 ${D}/firmware
     for atfbin in ${TFA_INSTALL_TARGET}; do
-        processes="0"
+        processed="0"
         if [ "$atfbin" = "all" ]; then
             # Target all is not handled by default
             bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
@@ -150,32 +150,32 @@ do_install() {
             install -m 0644 ${BUILD_DIR}/$atfbin.bin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
             ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
-            processes="1"
+            processed="1"
         fi
         if [ -f ${BUILD_DIR}/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
             install -m 0644 ${BUILD_DIR}/$atfbin/$atfbin.elf \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
             ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
-            processes="1"
+            processed="1"
         fi
         if [ -f ${BUILD_DIR}/$atfbin ]; then
             echo "Install $atfbin"
             install -m 0644 ${BUILD_DIR}/$atfbin \
                 ${D}/firmware/$atfbin-${TFA_PLATFORM}
             ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
-            processes="1"
+            processed="1"
         fi
         if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
             echo "Install $atfbin.dtb"
             install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
                 "${D}/firmware/$atfbin.dtb"
-            processes="1"
+            processed="1"
         elif [ "$atfbin" = "dtbs" ]; then
             echo "dtbs install, skipped: set dtbs in TFA_INSTALL_TARGET"
         elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
             echo "Tools $atfbin install, skipped"
-        elif [ "$processes" = "0" ]; then
+        elif [ "$processed" = "0" ]; then
             bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
             exit 1
         fi
-- 
2.17.1

