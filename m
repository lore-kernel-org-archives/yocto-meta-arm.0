Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.87])
 by mx.groups.io with SMTP id smtpd.web10.723.1596645616318080510
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 09:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ccfOxq2g;
 spf=pass (domain: arm.com, ip: 40.107.6.87, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/a+M+mpTtQYaH5oGP/sWcBCcBuE/fBgcyMtvdu86O8=;
 b=ccfOxq2gbCQkGfbgvyL6MAkNT84ANpr4PhMoSyIP8AcgQ+/NxyaddrI1E8dWSdydxxq/Z6hFA7ECJmw2biZ6TJtSqLX6NbXibXfaHCiHG7LbVTnYiLQLAW/n/He0WKN1A/SXRyZhl5QaO4J2nAe/0ylG3CACjDCuYm/uEhyvS3Y=
Received: from AM6P194CA0084.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::25)
 by VI1PR08MB4240.eurprd08.prod.outlook.com (2603:10a6:803:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Wed, 5 Aug
 2020 16:40:12 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::f9) by AM6P194CA0084.outlook.office365.com
 (2603:10a6:209:8f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Wed, 5 Aug 2020 16:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 16:40:11 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Wed, 05 Aug 2020 16:40:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbc127d6917d8f8f
X-CR-MTA-TID: 64aa7808
Received: from 82a40bf1b219.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9A3CD7B6-C4AA-4590-8BA8-E0D36BCE0505.1;
	Wed, 05 Aug 2020 16:40:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82a40bf1b219.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 16:40:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6c6OLJ5Zo18TaCQjWOZrPJLRIYq9nKdGD9lns9fTmrutLjNejJ1UDjHkgq6T3cyvgBD/qsrSZ4gQBv8fEVzD8tGJIPTYuyhVtXWVFPWzs2G+ZYQuZPBoEFGo4GVRqdkFDOmC/mzChyBN0mvpVFZkddgYO67eQncFEL3dBTSpZXRd0WdWtCy7gRQ0NJptZgL3yoPKYCl8GXbGdZu5H0EYu2SriFvHuPeoczTKCDWphEJlAUlV7AN46u4te6W0ClASqPrJMV3WUYLTOc5wVgJ8pXlCBkCXuxpHkQHEmWiDdxZTYAJ0XKE2HC9zI9lux9Y+T5Yg2dyggqrbWg6qvBclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/a+M+mpTtQYaH5oGP/sWcBCcBuE/fBgcyMtvdu86O8=;
 b=TuqKMUQsX/jOQ6HIctxxRNMLtxDF7l74oK16NIRu2sptsxufuoja6YNkZJbhBX8Wfh5ci3RBO4fCb109LinPw6WxPENFy0N9j/f0lvGLG+Tub/qBOIw+3kgRRtLIXY08Sq8vONKqFaL/tEY7jI91ShK+kanLeRdp9rHJjODuPoil5nzpcWy88GZwoH6I8n9s/uToi6q1f3zm0z1agqWCatFfcmrDwKr1tCYboNT0a1GV1kIy51tphcjYh2ZitLFrdZj8ZqTPa5ERDzxjrXVDWaM+kkGRay6FFaOwlp2EW76Z9F3XDGPMJVD+cGDP2X81/lLivPYXONYnLLb2nAMGrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/a+M+mpTtQYaH5oGP/sWcBCcBuE/fBgcyMtvdu86O8=;
 b=ccfOxq2gbCQkGfbgvyL6MAkNT84ANpr4PhMoSyIP8AcgQ+/NxyaddrI1E8dWSdydxxq/Z6hFA7ECJmw2biZ6TJtSqLX6NbXibXfaHCiHG7LbVTnYiLQLAW/n/He0WKN1A/SXRyZhl5QaO4J2nAe/0ylG3CACjDCuYm/uEhyvS3Y=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB4219.eurprd08.prod.outlook.com (2603:10a6:10:34::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Wed, 5 Aug
 2020 16:40:04 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 16:40:04 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp/recipes-kernel: Enable FRAMEBUFFER_CONSOLE for tc0
Date: Wed,  5 Aug 2020 17:39:51 +0100
Message-Id: <20200805163951.33593-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0469.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::25) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.52) by LO2P265CA0469.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.22 via Frontend Transport; Wed, 5 Aug 2020 16:40:04 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b047ed4-d181-46a2-44b4-08d8395e391e
X-MS-TrafficTypeDiagnostic: DB7PR08MB4219:|VI1PR08MB4240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4240C7C223913EB5B514664F924B0@VI1PR08MB4240.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 o6PuqzOo0IosG3vkoiXnqRrnVF1vzHF/Hi98xlu0eD9KILo3is/BNkfPWwJ0EiGtmGRxvHPr2PywVVevgGiuVyZvUlIeuMl+AIiVN1JcI2ljrjZz0JqSTkfSx1OhzaWMdWUHqo8UoFJUN1FlEDVV6W5mUjdxZ4MPvQw5/qUZ/8JAP5iAK8chKS3ZNDhACExtT6AFATF8oRLnWCyp3VPobnIuc8H6LN/DpjTznadAG0M672Yn9dg7NJ7hFkMmijezmMVuxYl1wbUsJtX+lAI6PVmywh8hOGBr/GXJazUatP1xS3hnpvpjSkjK2ykAkhLxcLfIye+TLBi05hAFsPF5WQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(2616005)(956004)(6666004)(36756003)(4326008)(83380400001)(86362001)(8936002)(1076003)(7696005)(6916009)(44832011)(8676002)(52116002)(16526019)(5660300002)(478600001)(6486002)(316002)(2906002)(66476007)(66556008)(66946007)(26005)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 S6e7xCjFX78UepMC8CUYheKLa0crEXmqbrvTYlS1nqF4wMPeC3tSpYKOHp4pMX8spHxGlt/MFQKtXihz72imRaUpHv+L6whpo4gkpzWrAGs09TuqwReQveYBXMXn+bo7WNw/78mwBtdsdwogNu01BYl/ydf5A6+kvmIVooC3uWDljhSJjiV8p/kgQnuHSgnAP5VW8zHAp9PtppIkZssIqhjzPl08+vHZaSsqMDFQFP0SICI9ASwJZ4hn7oZwUY1Qzjs/19/PrO4PRYi9AbRyRjebZgfmsP2nRZEHZyZXVOTPL4nWUVh3GUSbivvHQ/PZzXZjS39o4uThdrv9lNBRUw19hoYzAoqaFaviK6Vz5IPSBAlQW4ONRw3EFafMJzBcNYPsdmthbSSitkBIgtashWBaEXAP1vW1pwopeB6PZxUqBjGMNcUkV+dPnvuqUAedwufMhnCIxrKXiVYWAFXjvae6ggfSqXR1bLu6KX6srr7LELZ2JF2chx2rWwhnpd+8Ve4/4bNSjAJMXuVKGaAw2T1xlNunf4mQP3Cc0cl+/p3m+3vjFU4fHonEg0s6Aafcl5eEVQWjzJ/Cew70mZeCMqz38IOuSq2t7g4ZqWWr6PSgCDlGqVHY3iMhJppldQx3ukPl04HaS96pj0QdpIvp9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4219
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	efe97dfb-69d2-443a-f6ff-08d8395e346f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DBzdKfZ9+bcHDPmbyKZOYHK973h4e9ZL5jvkAJWDQ94Kf8+/JzqbIYksrtLuCqmpRu3n26lFa2BG9F0dIdxt12rz3QEduAOPEcJ3N3ue0TWSBcblhIu0j+lepojeZJjNFLJ3m2VVy/pvrspufV4R9WO+tpNuXjKJzwCf+D9iIqb46grc/sCD/tDL2x6nMRG2afb5F32cQVx7JmWChn2U9B7/MQIY3ywz1GYV46tuqMBD99vZ0EJQ8uaZj36J59eif816wFCOdC+C+gSqx5rugl/5owHi7eZsm0N5WokcCL4pzi9T4+K1zCNSE3Rx8T8lzr1gs9IFZk2Nnv5HxEZR8o4s7ADNDYeeApngYmH9HQOYBuQHC9hLUs/rLAjY9ZZWE9gzKKoxdaLAkyErzLS0Hw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(1076003)(8676002)(336012)(5660300002)(316002)(956004)(4326008)(6666004)(2616005)(82740400003)(36906005)(2906002)(86362001)(8936002)(47076004)(81166007)(6916009)(82310400002)(186003)(7696005)(26005)(70586007)(70206006)(44832011)(478600001)(6486002)(16526019)(356005)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 16:40:11.9689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b047ed4-d181-46a2-44b4-08d8395e391e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4240
Content-Type: text/plain

This enables extra ttys that are required by sysvinit 2.96 used
in dunfell.

Change-Id: I4ee0d1a3ec98665fd19cb8022b66c53c3d559499
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
index f981b3f..1f3b1d2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/files/tc0/defconfig
@@ -415,7 +415,6 @@ CONFIG_INPUT_UINPUT=y
 CONFIG_INPUT_HISI_POWERKEY=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_AMBAKMI=y
-# CONFIG_VT is not set
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_DEVMEM is not set
 CONFIG_SERIAL_8250=y
@@ -599,6 +598,7 @@ CONFIG_FB_ARMCLCD=y
 CONFIG_BACKLIGHT_GENERIC=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_LP855X=m
+CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-- 
2.17.1

