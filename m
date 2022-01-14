Return-Path: <ben.horgan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACE9C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 09:12:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.61])
 by mx.groups.io with SMTP id smtpd.web09.5010.1642151548421706610
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 01:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=tsUJS8HY;
 spf=pass (domain: arm.com, ip: 40.107.20.61, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A4T42m5p4cpMPutE8JJTmxesriCTI33Q9wwkkwEQxw=;
 b=tsUJS8HYRLAz+wfY9pdwhvSMdxytdyFaNIgveANUWk6ZPRFtH6qgyJnEunm/ZoG5e1xwEZs/M9bIzAMeYdG0Xhcbf03PIbvYfYQqNGx8xFu8r8lkeYFiJZPEfM71TuzEeF1vXihsExnsFAvAKYBvJr4NFYBw/TK0EsNAqSu2pIc=
Received: from DU2PR04CA0207.eurprd04.prod.outlook.com (2603:10a6:10:28d::32)
 by AM6PR08MB5253.eurprd08.prod.outlook.com (2603:10a6:20b:ec::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 09:12:25 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::a3) by DU2PR04CA0207.outlook.office365.com
 (2603:10a6:10:28d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Fri, 14 Jan 2022 09:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 09:12:25 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Fri, 14 Jan 2022 09:12:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22e630b6de55f206
X-CR-MTA-TID: 64aa7808
Received: from ddd31d434c86.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6CE708F-65C4-40C5-B65F-CC0CD76AA35A.1;
	Fri, 14 Jan 2022 09:12:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ddd31d434c86.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Jan 2022 09:12:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv9j+X6DCbM2wsDf2d7s+28K5I3kNN1xczIXvbawvMR17SJfrTtQJwGShsF19AXpog6IwMm0RD7xfcqmQ0gnLvMb1W24WZg7B67GDywPYgt2WymjM072N3PzsJIb+vkQkqbXhyvU/Cf9rRxeAObR1CAb2E76HXE4VQtYGj930eHXBwW890JcdXpY7LAlBBPxUVCEUALVSk117mHFxMuqxLgYJ7RAvstaq/3Eb29nO0scPx/RZJj7QVABiKhUxbYPChpC3Mp5DlwPaPyBEkSKEIvlJDg++II7su6sYFWrxvY/GT3zRxvl308iW3zTBfvNZ3Se5SJ3JjoBlpbgBTqF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A4T42m5p4cpMPutE8JJTmxesriCTI33Q9wwkkwEQxw=;
 b=APWrKNkX4JY1rfizdoagDQzeUOrv23MADScjLhcOXcrRT+Cr9chUMwG2LidRMJ1+FL/ar7LCtTm8lYHXW77MSQnb3EVmIt/x0U4KTz1j1PVfmJo4n6evUSoXJ+A+c3g+BeVXQpkTA2mJI3pkqIlxNS/T4pVjY73kVnceVKvE984rSj2fujNxoXISWY2LOUO6r/naiTDyno55ot7IdqDOzska6XHBQCFPUG9/zyC7tSoI5L0X4HRxUXRwpUgOPrbFwN7ggYUBNwveCjkNZazIpX8H0Up1EtXWSbbVBFhR22eGYCG9+2z/vHBPXdzrsRcYfHEi10M8WLCu0qSR9pKOgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A4T42m5p4cpMPutE8JJTmxesriCTI33Q9wwkkwEQxw=;
 b=tsUJS8HYRLAz+wfY9pdwhvSMdxytdyFaNIgveANUWk6ZPRFtH6qgyJnEunm/ZoG5e1xwEZs/M9bIzAMeYdG0Xhcbf03PIbvYfYQqNGx8xFu8r8lkeYFiJZPEfM71TuzEeF1vXihsExnsFAvAKYBvJr4NFYBw/TK0EsNAqSu2pIc=
Received: from DB7PR02CA0005.eurprd02.prod.outlook.com (2603:10a6:10:52::18)
 by AM0PR08MB3156.eurprd08.prod.outlook.com (2603:10a6:208:64::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 09:12:16 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::80) by DB7PR02CA0005.outlook.office365.com
 (2603:10a6:10:52::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Fri, 14 Jan 2022 09:12:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 09:12:16 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 14 Jan
 2022 09:12:15 +0000
Received: from android-wfh-server-benhor01.stack04.eu02.mi.arm.com
 (10.58.246.229) by mail.arm.com (10.251.24.31) with Microsoft SMTP Server id
 15.1.2308.20 via Frontend Transport; Fri, 14 Jan 2022 09:12:14 +0000
From: Ben Horgan <ben.horgan@arm.com>
To: <meta-arm@lists.yoctoproject.org>
CC: Ben Horgan <ben.horgan@arm.com>
Subject: [meta-arm][PATCH] arm-bsp/optee-os: total-compute: Exchange patches
 to fix managed-exit
Date: Fri, 14 Jan 2022 09:11:48 +0000
Message-ID: <20220114091148.5140-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 609ad798-701e-4867-038c-08d9d73dfb12
X-MS-TrafficTypeDiagnostic: 
	AM0PR08MB3156:EE_|DB5EUR03FT036:EE_|AM6PR08MB5253:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB52536A1C015953E1FFEC74C491549@AM6PR08MB5253.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 9UDa4nXreRs2LLozRnJ8jxF92pjPSBtAgbKOnYg33bqBo0PPR39i0UkYcLTkojTD7LcWFVHWbpEuK1mbC4jtKNqiBBTstvrDaIuwDp5hkHXsZRfogHQXiSXZF0vLoGdh22PUzgUMj77aQLgrUpD7zHChqDWoNyZD0pLu85RMPCbKyVhf31qVmXzAEAvqbUXcqEhrqjm6udfMPDsjuw1YUFS+ftfWrKvPD1d8tGRa0MWAeUl1GV0Zmi2V/leYtTwsRmA3wTgdBYUw2gsNEg0NMYAqioUkNg/NVA9SVHvnz28SKKRDELY8BxlS1YdFO8h8Wwe61mDxTgrQw6C6pGWe1jTmzSv2rFZaetZzCN1pSudvYS0WQFIpY4+QqpJh77CqMj06uKbXcUGkOpJdFUuJY6l1MALAUc02CxAUHqqKcJtYfELGKezcwxpap15ccthQPKLW+71enOREwrFjYXVAXD2WcDfrpy/d/c8YY1BboYlLZjQaPTWixICNQQbDx/pef82/72DjIAuW8l8Uyg+lY6DG85xnynG2vpIdheqQ7UlqwfxpnCWD/Ae3qjlDVani2cfhdeZByOUqE/86x4QBTte1S9MGYdFXE1ibc+s8O9NioJwgRbww7SXPoAne3KtJEExIbURMo0Mr4x8wCWVkCDCzJPANeQKaJsvmH9N2qwlVjVEhw113M0E0dxlgF4T3v2ybz5iVV//lirU5134l6XCddF6pUdfkwjg8YABXG5zkzv50i7U2Bh1OjssLPPZoFxBvBMuGIyP2RVD9WbZWnoDE44Qz5sGwYSFMmBAXxJA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(40470700002)(36840700001)(46966006)(336012)(6666004)(8936002)(316002)(5660300002)(6916009)(47076005)(36860700001)(186003)(2616005)(86362001)(36756003)(70586007)(7696005)(26005)(82310400004)(40460700001)(1076003)(4326008)(44832011)(81166007)(356005)(70206006)(83380400001)(426003)(508600001)(2906002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3156
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e2e8e20c-a022-4701-bc1f-08d9d73df585
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TPM0NtTpzjdtKKtDVEjXb+Lg7mwAUU0YhKhpE+vSaF2bkDQOv2F3N+kMrCRCenqiNiMoPadFWHG6JVlCmzouZiYDniOkLb6WLGAeodVxlWfTvSFJlHihFplvRO/LkUdR4zu/C3MuVX+Uh/8Ff24p+XO0An309t4abw4h7qZ2+JwrIUug9trRcD+lKANfkVuFCC5dzSFVgsahBybO7Kpm317CndfswKbCO3INzwKHyWIGSqTqYasuW2TvS+PuwISfAdkEfoHwpHRIkiddKF9Tlj5y/THZCbaK2oTQikT1KPGEwM8FS/pMxtDIoR5Kzg6kUbUHvR+Ms+R64nLuDe7NLd1aHD98jVNy3G1fZ0JJYpXrx1GDxCgNCgWoSca5pTk31FsxHfsI+H6F0yVAurTcju1YO7q3+iOK57licj1cFTh6g0fsOpNpTGKDO/yQLFDcCUfmYEqT9xloQ/eXtUaf2EZTT43VbD3if+gzK4HRK3a0WIU/2F4MxPnUV5FT7ZmfyevII0MEjs7HkAQ/Lui2IBTFUqr9+L9fWZeH5hu8JoQOX+BcJZy8uQccDPE1nEETjpYvz3w+AzVvJzKrluYGByB3PKOoWQKsepAN5p1NNpWS6anwfOJ5ap5fTG4mHJ2YtDS0bmFVlhiMsjxs3t1ytasqHtVCvP9Vs0SYesZ4e+V4uXjj4fEqIyU4ULHL5YNbf84S1ifO2/4ZLXl4T7Ro+g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(36860700001)(6916009)(186003)(2906002)(26005)(508600001)(5660300002)(47076005)(2616005)(1076003)(81166007)(426003)(82310400004)(316002)(336012)(44832011)(4326008)(83380400001)(8936002)(70206006)(36756003)(70586007)(7696005)(8676002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 09:12:25.4799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 609ad798-701e-4867-038c-08d9d73dfb12
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5253
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 09:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2828

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Change-Id: I1e47c7b87450258840c68e045194e07e66b35478
---
 ...e-Specify-managed-exit-in-the-partit.patch | 29 +++++++++++++++++++
 ...e-Update-messaging-method-for-manage.patch | 27 -----------------
 .../optee/optee-os-generic-tc.inc             |  2 +-
 3 files changed, 30 insertions(+), 28 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-plat-totalcompute-Specify-managed-exit-in-the-partit.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-plat-totalcompute-Specify-managed-exit-in-the-partit.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-plat-totalcompute-Specify-managed-exit-in-the-partit.patch
new file mode 100644
index 0000000..ff16e79
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-plat-totalcompute-Specify-managed-exit-in-the-partit.patch
@@ -0,0 +1,29 @@
+From c68ac212ec130811662bb60344793b1442be7d34 Mon Sep 17 00:00:00 2001
+From: Ben Horgan <ben.horgan@arm.com>
+Date: Thu, 16 Dec 2021 14:48:08 +0000
+Subject: [PATCH] plat-totalcompute: Specify managed-exit in the partition
+ manifest
+
+Upstream-Status: Not suitable (Update to 0001-WIP-Enable-managed-exit.patch)
+Signed-off-by: Ben Horgan <ben.horgan@arm.com>
+---
+ core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+index 04847c4d..1bb4cea8 100644
+--- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
++++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+@@ -23,7 +23,8 @@
+ 	entrypoint-offset = <0x1000>;
+ 	xlat-granule = <0>; /* 4KiB */
+ 	boot-order = <0>;
+-	messaging-method = <3>; /* Direct messaging and managed exit supported */
++	messaging-method = <3>; /* Direct request/response supported */
++	managed-exit; /* Managed exit supported */
+ 
+ 	device-regions {
+ 		compatible = "arm,ffa-manifest-device-regions";
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch
deleted file mode 100644
index 7439927..0000000
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-plat-totalcompute-Update-messaging-method-for-manage.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 31b4fb3fd52408d53ba5fd934f1506b01cda2e7a Mon Sep 17 00:00:00 2001
-From: Usama Arif <usama.arif@arm.com>
-Date: Wed, 11 Aug 2021 11:51:38 +0100
-Subject: [PATCH] plat-totalcompute: Update messaging-method for managed exit
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Usama Arif <usama.arif@arm.com>
----
- core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-index 04847c4d..2fb07862 100644
---- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-+++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
-@@ -23,7 +23,7 @@
- 	entrypoint-offset = <0x1000>;
- 	xlat-granule = <0>; /* 4KiB */
- 	boot-order = <0>;
--	messaging-method = <3>; /* Direct messaging and managed exit supported */
-+	messaging-method = <11>; /* Direct messaging and managed exit supported */
- 
- 	device-regions {
- 		compatible = "arm,ffa-manifest-device-regions";
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
index da6a06f..644af42 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
@@ -9,8 +9,8 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/tc:"
 SRC_URI:append:tc = " \
     file://sp_layout.json \
     file://0001-WIP-Enable-managed-exit.patch \
-    file://0002-plat-totalcompute-Update-messaging-method-for-manage.patch \
     file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
+    file://0001-plat-totalcompute-Specify-managed-exit-in-the-partit.patch \
     "
 
 COMPATIBLE_MACHINE = "(tc?)"
-- 
2.17.1


