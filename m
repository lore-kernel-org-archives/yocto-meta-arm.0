Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.62])
 by mx.groups.io with SMTP id smtpd.web12.12219.1592810111607703155
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 00:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aM5IfSst;
 spf=pass (domain: arm.com, ip: 40.107.6.62, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNe8L6gjfzqYTLH2ZAeBrfhfx04I/PGDIqVLspCgPo8=;
 b=aM5IfSstRfBUWUOY/1E2ECJrTgG2oSu430iv2rkW7QP8t7f4rHnraPyzr+EPh4h6PFZOnFu7Yo02rTieAPww9lcE9nmpeTr8gdY3vkanW8h6ZgeH8Kt27HFj/yTaOiU8kSJSV01uYUe641pye6570gtI/7VyBCdbZNqqzEWNnpQ=
Received: from DB6P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::14) by
 VE1PR08MB5198.eurprd08.prod.outlook.com (2603:10a6:803:10d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:15:09 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::f9) by DB6P193CA0004.outlook.office365.com
 (2603:10a6:6:29::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 07:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:15:09 +0000
Received: ("Tessian outbound 8fb20e43acb7:v59"); Mon, 22 Jun 2020 07:15:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8bed20ac1f4e13e7
X-CR-MTA-TID: 64aa7808
Received: from 39c93633beb0.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ADD400EC-3751-4839-9C3C-0ACDAFF62952.1;
	Mon, 22 Jun 2020 07:15:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39c93633beb0.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 07:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+h7ux6EFOCmTVdcuXAQdxEqDd4eDzUuaYUnJVN4cAoaoTjhRgIBxFBAPPF21XcDtm4jdx5DYUNkgbgL1vr2tM99fD4v7N73Gt2l1RCb7Qx+2o8Jhqho0w7oDb+R7F1wf6tCBXk96gB1mmhgMn5qB3dAjzejT+0h+tOyg7rXEmxF1qT+RvQzbprqlk05TP8GpFVZUt/qaJ8cFKN0uur0iayqvhMcriHZBFWyRHjNi3E4IKIx2q3ni0Rm0CCHG6H4jrGX4c5YdwXhpEvC4Y/lYhzqeIV06S/x//5C3gbUezlxzoH/CepdEBVKV13vuGS/A2O5AFn9FGBJ7mPZIPui/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNe8L6gjfzqYTLH2ZAeBrfhfx04I/PGDIqVLspCgPo8=;
 b=GtxRKN5Cgu9qJyi/DB1ZKm+3NYMxkRX0nXTDu4D/XIj2RFhDdeopqpE81bbM1XADmAArwSAXbHi0M9nzHjbS5ww1SiuWMVorod8gIc32Et4cP5+iFpo3iiyTscAdBg2RytnhxMEni8jF8f/PAjMHQQIY1sSa5rmOo27Gmh6QOegqj6gYalOMMCBOrySuFQOHcyj7Wl/sQssPxS5MuYofyPPLsMplRM+O0wDFajhjlyoyqltZ8ZFJB64avZZm/vky4OAkYxgM9kjBNgKhjoMPL8vIoPxNI7XvJncb/KTx3YxZQjCOT0qdHDbW7/FJtSutByHhywNvaZwe4qouhS7saA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNe8L6gjfzqYTLH2ZAeBrfhfx04I/PGDIqVLspCgPo8=;
 b=aM5IfSstRfBUWUOY/1E2ECJrTgG2oSu430iv2rkW7QP8t7f4rHnraPyzr+EPh4h6PFZOnFu7Yo02rTieAPww9lcE9nmpeTr8gdY3vkanW8h6ZgeH8Kt27HFj/yTaOiU8kSJSV01uYUe641pye6570gtI/7VyBCdbZNqqzEWNnpQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2493.eurprd08.prod.outlook.com
 (2603:10a6:800:b3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:15:02 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Mon, 22 Jun
 2020 07:15:02 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH 6/6] arm-bsp: musca_s1: Add machine
Date: Mon, 22 Jun 2020 09:14:01 +0200
Message-Id: <20200622071401.2570-7-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622071401.2570-1-gabor.abonyi@arm.com>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (217.140.99.251) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:15:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7958829d-d6cb-442f-c691-08d8167bff56
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2493:|VE1PR08MB5198:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB519879D7E99D455D83B689A98E970@VE1PR08MB5198.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V8wu7ruLVLDIm45PDyfCVsJS+bN1szTdD5DRb0noodXGk29v9Gvg45c7OJKZRduDc7RQCpHHAe6OcOpy7Y9jX8xGwqyFtu58F25Ge4sinAtxIyAPoalSTaW4peILWKQ2YY+d1mPUyUP9zbVnLem1hEgqyX27yndQ7moqULKV+ceZj0gY8edoLM8ReUsmZGa07bjoR/rCNo+NENX6dFxMgIsrmvXZ5CPvLFcMkfxv0VQwB49tlSY3NWf33z7wdPiclG9T/XFkMBkoLo4HhOIwqIWi0EeUh+sJPI8lz7FvCSLVvQaoK2y9dT7iueGy+bT78Nn3SssD2CO3nB0z8NRNHg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(66556008)(66476007)(1076003)(26005)(36756003)(83380400001)(7696005)(8936002)(5660300002)(478600001)(86362001)(6916009)(2906002)(52116002)(186003)(16526019)(956004)(2616005)(66946007)(316002)(44832011)(8676002)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 MBbAZHotxpW3RRglFIkhUUEGKwSHfPUNJyIZdO0swBOiKzJdEzZxBDvt9TLiOuTq3OIO+nd2R5dupO/g2wFK2I2YtxFaw4DdZtaf78hN+/sdK95/tf/VsZLcZWl4306+1OUsc9RqjPStUsgiZKJWn05tmizMfC3ok/R/sQAwujOLAEg1Y9Lblvx/KQVvXUp0vOTQl4cI3qNYhlpXejy50bF6zZdG3NbzSyEFPxtCmRRHlje2hu5vDBf/a7sFLFcytA1Sw49mebZFXJALjMF+txlSYL2Aeo9Z2uDp4k8tGLtlK+YWPRsu1zoqE0d08xVk9aQvLHUfjFWgBAx5Cj6gjFUX1ujVym5i9tC6rmq4BC1pU8IMBNqV3/8rsTb8bptW7L4AxTZLVrluZ7d3IyWgmSYF3085FuDboaa32u1ZkN2R65oKPwOB5GDHTtPneYSaqZY3aYyLqi4rxvsaH6SU2GRB1pHXQDaUxQF7n/m85Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2493
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966005)(4326008)(44832011)(70586007)(36756003)(7696005)(956004)(2616005)(70206006)(1076003)(316002)(86362001)(6916009)(6486002)(8676002)(8936002)(336012)(478600001)(5660300002)(83380400001)(82740400003)(186003)(356005)(26005)(47076004)(82310400002)(81166007)(2906002)(16526019);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	86583617-b66c-41e1-ad13-08d8167bfb24
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	idKo/igYbxkzuw4gMHOpGrgPdOpIPmRz2IDW81v4kjCASj4imo02I+422/fwcngzZws6ILTVOWt1IEf5BZefADy33GzXBHqRb66YcTuDxscdMhh2bDvboV6L+W0vQTp9OQyIY03gWC62ZNCYyHdGq7j00oFfeQ/GOPFs/iKsnUdq7gu+IneVu6tGogRZh4sXNUJF/ajuO41Ueo00pfEaEvtSxD5Qdc9fhczBHWaSfLLtCk/mONEhE6TjGIX4qKbm9fVZmkl1Y0qU2OPxSBReIPXl9ldwDDnseGYHey0kVvQKnVlJvjnKig1a42cl6vISM8GOsea/4x1U8morZhYC0SoX1cq7BvWEmJCb1aWn21LhQseop9TwStr8VRybdqtFyw2ER4xLj2G6y9XTAkEKKQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:15:09.3530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7958829d-d6cb-442f-c691-08d8167bff56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5198
Content-Type: text/plain

Add Musca S1 machine. Also add it to the supported targets
for Trusted Firmware M.

Change-Id: I58cee5f71d695e364b324b7c92db920b4b1a3b69
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 meta-arm-bsp/conf/machine/musca_s1.conf               | 11 +++++++++++
 .../trusted-firmware-m/trusted-firmware-m_%.bbappend  |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/conf/machine/musca_s1.conf

diff --git a/meta-arm-bsp/conf/machine/musca_s1.conf b/meta-arm-bsp/conf/machine/musca_s1.conf
new file mode 100644
index 0000000..4b6b575
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/musca_s1.conf
@@ -0,0 +1,11 @@
+# Configuration for Musca-S1 development board
+
+#@TYPE: Machine
+#@NAME: Musca-S1 machine
+#@DESCRIPTION: Machine configuration for Musca-S1
+
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
+
+PREFERRED_VERSION_trusted-firmware-m = "1.0"
+
+require armv8m.inc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
index f86e2b1..32b50b7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
@@ -1,2 +1,4 @@
-COMPATIBLE_MACHINE = "musca_b1"
+COMPATIBLE_MACHINE = "musca_b1|musca_s1"
+
 TFM_PLATFORM_musca_b1 = "MUSCA_B1"
+TFM_PLATFORM_musca_s1 = "MUSCA_S1"
-- 
2.17.1

