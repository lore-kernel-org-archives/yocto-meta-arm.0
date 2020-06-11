Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.88])
 by mx.groups.io with SMTP id smtpd.web10.8332.1591885043161884132
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 07:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bTENt4RG;
 spf=pass (domain: arm.com, ip: 40.107.7.88, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFrLXgtwf10B79Yh5iLLZRnXk8G3/xOJpOTQobm4l3k=;
 b=bTENt4RGSP7TCmrle6Wrm3/ixoKKvH/I2J7JQ6qhJCbpuXTb8LIe4WqD/7vI9C+LmerC6dHusYTl9psKOVO+mj8a3XIdR1opwMXwIWP20JgM2wSGeJKIyi1Was+cbkKPOemkpPxssTka0xVsG0vVzPziYMYB+tvnNtHHLF6O9Dc=
Received: from MR2P264CA0104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::20)
 by DB7PR08MB3113.eurprd08.prod.outlook.com (2603:10a6:5:20::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 14:17:20 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::e0) by MR2P264CA0104.outlook.office365.com
 (2603:10a6:500:33::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Thu, 11 Jun 2020 14:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 14:17:19 +0000
Received: ("Tessian outbound d3ae83885012:v59"); Thu, 11 Jun 2020 14:17:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb88c4f3e83fe94c
X-CR-MTA-TID: 64aa7808
Received: from cd290b9ae997.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 658B228D-1EC2-4473-8610-934592CF0D10.1;
	Thu, 11 Jun 2020 14:17:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd290b9ae997.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 14:17:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XjJVWHD5h4jqvyf1r6U281y3GaW4jygSEULFOWVXYG3WXKnFZIcUyeUbfMkxXCg3ixelZIFX3Vagefj9+80JWCptL7B7mm2tohUHONFqG2laM/uukantTuoO5qh+LXvcLQ3SCHZF+cJKXJQU1Kn+zYaNJULJjbUrxsbv51pRBHatKtxocWc/qKI7FlEmfGf1aCWS+bm68SZ41XqLzhrNbOklF7iqer0tgM3aX8u7V4Hc+yg07MlJ9D4rv/L1cfBuC2Y7DZriKCJ8qkgwHJMeH8U/e5cyKMOsxNQRswC5g2NXiuABaYqnvQIMRKNhedYg5yheI/Ud/qb+MJAwKdDGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFrLXgtwf10B79Yh5iLLZRnXk8G3/xOJpOTQobm4l3k=;
 b=D73yJt8Sy1JlsflMgu6RaUFEqqOZrao5eGNUQhcZLGnuqNlk6VcR6TXRQJ5P6oC5R+AznAfqcWW71CetVwdQv+y2W8M6YtYZdAzCEp+BZCHmBZBqqGV3FrfkACL/SvaNiqiInRolnS9ObxdhY+iKQnUycYhCS4NJtQrcctvsKYfMTUaSUblfi3oZ9bMbOJIOYjfYPCKUpJc5IZZbf/GVeAWk2RfSwbicCFtym0F+mH6Xyl8ONfDbeevOKTABID/L19Rzn5w1R5YIVnDZ77MAJzwrMQdLOcgQbHeJbZSqLGR6Fpeb7aiG6faQxy9N388KnTART4hqQZB4c4rRIIyOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFrLXgtwf10B79Yh5iLLZRnXk8G3/xOJpOTQobm4l3k=;
 b=bTENt4RGSP7TCmrle6Wrm3/ixoKKvH/I2J7JQ6qhJCbpuXTb8LIe4WqD/7vI9C+LmerC6dHusYTl9psKOVO+mj8a3XIdR1opwMXwIWP20JgM2wSGeJKIyi1Was+cbkKPOemkpPxssTka0xVsG0vVzPziYMYB+tvnNtHHLF6O9Dc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB3550.eurprd08.prod.outlook.com (2603:10a6:803:84::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 14:17:13 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::3da2:15b6:9468:e4c7]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::3da2:15b6:9468:e4c7%7]) with mapi id 15.20.3088.018; Thu, 11 Jun 2020
 14:17:13 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] trusted-firmware-a: fiptool build using BUILD_CFLAGS and BUILD_LDFLAGS
Date: Thu, 11 Jun 2020 15:17:04 +0100
Message-Id: <1591885024-1856-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::33) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by BM1PR01CA0139.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3088.19 via Frontend Transport; Thu, 11 Jun 2020 14:17:11 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: adcb7f6e-9877-4b75-03f8-08d80e1226da
X-MS-TrafficTypeDiagnostic: VI1PR08MB3550:|DB7PR08MB3113:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB311390D979323F7B158AF21E92800@DB7PR08MB3113.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:185;OLM:185;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aJgezFJpqxKIdMio3JZosZbL1HRMi3+ItUWVsPY32ejF531plrlldY3eorlKYUXOFJ06+KFJ04ArZhhRAnpUBYfkh7JcZ2vxIlKqloMrbbe75fPXaGHwPYTaPy21HOQ7hGAJBeBNFusvQpHUA4FIIpdIPFjuu94KB1NoQpDS7UTlk3JZwnVeRbmNxK7zsmHaEd8a3Vv93GBRdNWKArr1U+Kg/cjUJ/y181qqtv3h5lsmpvtkgpIGHtHqf4kYIKsNmZFSxYdX2vZSJhcudRAZraqCaHExH3lfQDFjLZewwK97Xcq9yLKhjz/qNo8yXqPWmSKlcMGFeWM90PTJNbEf1g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(86362001)(16526019)(36756003)(26005)(66476007)(66946007)(186003)(83380400001)(6916009)(66556008)(956004)(44832011)(6666004)(2906002)(4326008)(5660300002)(2616005)(7696005)(52116002)(6486002)(316002)(478600001)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 J4ZN+Q8xHz86Sugkp8eHyxZ7/DSBESBRSFZd41v/jJ9033iT+pNuWgZcw07c6I6okiFAGh27i4wusUy3G5riO0dbYpoL7SV5Us8Uj4CmsgmV7knsMioR/wEQ9KOuHzH8p281m8XJjTDJsd7uftqHMfN8sEh4R8zaL1gEJCwOWhr4ORjeO5p1WHLA012YR6ypr2r71j2ucsOiiMeI8QHHfxAN8xYZqUTFtyZK8yC5f6vh9lLIGbv9HuvWw/aeMQEAsvWhGDkLMW5fpTp+ZcdIlxzwRW3wLAdBy+B094IdUKiFYLP88R6ZfB8qkg4yZVv/bbsZH9Sg6Eb2/w+8JvHvRKQ8jYT5HpLB75vLC6rfu+N8z/FyjbrjTEibMuCzVAu+g8WzKS34Q3X2DXcIMv2x4PQ5WfaAYAp6PdkQ6YiphwUyIJXe2w25n/eIx01nigoKq5LIz58ZYywkenlG39s1wJxT3eIAFmVc0YFLULronViBYPWqtT/d8sZthWBIJ2m6
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3550
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(36756003)(81166007)(6666004)(8676002)(6916009)(2616005)(16526019)(6486002)(70206006)(83380400001)(956004)(2906002)(70586007)(44832011)(36906005)(316002)(5660300002)(8936002)(86362001)(4326008)(47076004)(186003)(82310400002)(478600001)(336012)(26005)(82740400003)(356005)(7696005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f19a3b2-d4eb-4bc3-9546-08d80e1222a8
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IZeV6MQFYubb5C+SOcbs7XbeMysN7WTK3YuELjYKA0ljUyUw7n1KKMrfcVFVxfHDgXgRsGd+u8qlbmXiTy/SRiRAvdv4LIE4/jzjDJ7siZmv3TYBUgMTFyDCVHOy7bLhnNlLW0jNbmbFc1AgZ2qmIn77ct5xzTJ0316zmGHrgMAJYIaCckR/LYS0w8FEiGI3ONgxLIhAH2JmqdRcSWKUEmhTj64PTfmBwAXg3SohC3CkjRYyWv5hZ6tIIQVjU4qwJ1w96a78t1C3bUCNtJb89iYVf4F23KRJgYOXc8w2377Q3/fPubwGrOM8kU9tBXbdklAWl7OYX3LvbuRKSsPi8pBqwZ9pm61fIi9ffDmaesNstTs4It/gSbk7khAXEnMo8kiNKMNc8C7p55n/0+Mc9A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 14:17:19.5839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adcb7f6e-9877-4b75-03f8-08d80e1226da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3113
Content-Type: text/plain

Since the TF-A fiptool is native tool we should be using the
BUILD_CFLAGS and BUILD_LDFLAGS flags to proper build and execute it.

Change-Id: I9634604dbc42ba7da85d9b9449f1ed94ecb38df2
Issue-Id: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 6f64773..e57d3fe 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -116,9 +116,8 @@ do_compile() {
     cd ${S}
 
     # These changes are needed to have the fiptool compiling and executing properly
-    sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},' ${S}/tools/fiptool/Makefile
-    sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
-    export LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}${libdir}:$LD_LIBRARY_PATH
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
 
     oe_runmake ${TFA_BUILD_TARGET}
 }
-- 
2.7.4

