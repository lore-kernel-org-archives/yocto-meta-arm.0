Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.68])
 by mx.groups.io with SMTP id smtpd.web12.37389.1597028814761899847
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 09 Aug 2020 20:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hfXqzoVL;
 spf=pass (domain: arm.com, ip: 40.107.22.68, mailfrom: damodar.santhapuri@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxecRsZcBCzUI+CxlaqU0ERjGlSR125KyeJvyN06dl4=;
 b=hfXqzoVLLYOf2wQ8CsmAyX9G0COFM8x79SLjKI6uojK2fKYg2H90Bq9bSt/udUH5QHLc55dnrRZNYLqLKiw4F9SI+gkaZFKc0z/wwi6lkwwroNSAjn+LyCJhXw76JRNV9SesDur3Fm5TLbD/ff4MDpo5tOC+hQ2HqFBA89klIhE=
Received: from AM6PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:2e::31)
 by VI1PR08MB4222.eurprd08.prod.outlook.com (2603:10a6:803:c0::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Mon, 10 Aug
 2020 03:06:52 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::bc) by AM6PR05CA0018.outlook.office365.com
 (2603:10a6:20b:2e::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Mon, 10 Aug 2020 03:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 03:06:52 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Mon, 10 Aug 2020 03:06:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c759855df44c359c
X-CR-MTA-TID: 64aa7808
Received: from a50593261888.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 302AD033-9E08-4594-84B3-65EBE7050F59.1;
	Mon, 10 Aug 2020 03:06:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a50593261888.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 03:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heWVUTxttDyi/MxPgqlguDrnYUa3MnnPaSOrhXdMSM29YdR93iyEkBhE+0Riyjg8C7s8PJj5EqthFRHSEPMyOymV9pqKi+wSPTmNsq4n1yPSM/iatJc4FehnWWxBni+XdgzyZc0GVuDvBC7JjWz7v9G16OcopU+tQWjUsInzfGUxA5ZteF6bBrerKIXUM6zi58ya/Q+Q63fAtWH3DeHkJCxmuLmiAwkaUT1o9LgWBcGZV4hAcFWTMWJ8P5Lc3rsaPnq2O5vKEX7aZV42WtqF1VbHC6HtQAHGhszxCA6FweX4pJTbYC+e5fXQ+i/3JkWnT4FHO3o+Z/V0l197QfhiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxecRsZcBCzUI+CxlaqU0ERjGlSR125KyeJvyN06dl4=;
 b=oIbCUggS2Xb3nkH1Ip/nexVRsZRqSmOX2lEXu7B7rg9fAPajq5vtlPa+839n2uXLPcOU21OJLBwed4sssf1c6B8H5+090QF1BlFbAKFGcS+zAUwCT1DqtfIb2KyENOWJj+5wYXcm+RrBXzwnsQKmU/F2wNQceZcPQr0IfL1jDV+rWE18cUP6gUCoBPvS/wwFWwvnzgpEVCS6KIob+ofwMZe0OSyWjUg45MNYLV5BXotJpjdxJlmsd/l5XnzZY2UvITGH/Rrl1Epq7u8jCM6lUuXk4bxDIfv62TQg2Fy2/bWBYyoFyfVbMFWsWNQ9amdgVUF06jgNp0XRqtVR8gdKFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxecRsZcBCzUI+CxlaqU0ERjGlSR125KyeJvyN06dl4=;
 b=hfXqzoVLLYOf2wQ8CsmAyX9G0COFM8x79SLjKI6uojK2fKYg2H90Bq9bSt/udUH5QHLc55dnrRZNYLqLKiw4F9SI+gkaZFKc0z/wwi6lkwwroNSAjn+LyCJhXw76JRNV9SesDur3Fm5TLbD/ff4MDpo5tOC+hQ2HqFBA89klIhE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com (2603:10a6:800:8c::9)
 by VI1PR08MB5519.eurprd08.prod.outlook.com (2603:10a6:803:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 03:06:45 +0000
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::24b9:811d:b60b:f5b0]) by VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::24b9:811d:b60b:f5b0%10]) with mapi id 15.20.3261.022; Mon, 10 Aug
 2020 03:06:45 +0000
From: "Damodar Santhapuri" <damodar.santhapuri@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH] arm-bsp/scp-firmware: Introduce FW_INSTALL variable
Date: Mon, 10 Aug 2020 08:36:33 +0530
Message-Id: <20200810030633.24926-1-damodar.santhapuri@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BMXPR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::35) To VI1PR0801MB1950.eurprd08.prod.outlook.com
 (2603:10a6:800:8c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a077431.blr.arm.com (217.140.105.56) by BMXPR01CA0071.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 03:06:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.56]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0d46ccb5-62d8-4806-c2ce-08d83cda6e38
X-MS-TrafficTypeDiagnostic: VI1PR08MB5519:|VI1PR08MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB42227C4F2EEA3B816D6FF19B8A440@VI1PR08MB4222.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KOHGCyRcMjQffN3Hen7MngtDWTCVDDoz3OhFIzpNOf7MHNYb4rZW1KCRD0WzwoY7XjunlVFtr04qV3mlMBa1XM3NKWWcZGljD4dha/9rwME0CNSZo6g5PDNGCbHkeAusrNaUXNnSNAA7qUC5Se2rtGQiPi8jmDpNTXwmRMEuw4Uv/rqHQhmdkXf/hJJlfEgfw+13r6uv4DFrBbPsTNxwjpzCCKKUqBjtLC9rvzksWsYJ70G+0PSyvGeK8ePRAY5D4r+wEN/dK3xpCuJQWkAG/77QFriYgBiM42nL7papnrc3tSES2fyDk7L//0wTN1+S3stGxLskkDJOziAZLGecmg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB1950.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(366004)(4326008)(6916009)(316002)(2906002)(6486002)(956004)(2616005)(26005)(478600001)(52116002)(7696005)(186003)(16526019)(44832011)(5660300002)(1076003)(36756003)(8676002)(66946007)(66476007)(8936002)(86362001)(6666004)(66556008)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Yau3APWOkyEslcMec6DL6ztMXYOgAexWWx9gxWT7zTMFvWypZv23WhioPMZ1XWaFPZJH1VEENnrV2PPGVqnV7nHJvSBPIKqB9cUphFQIgM1uKMl/d3gsQi/NZU2Vp1aA4Rb3+MOnWn04zdqTEYpIkk7z1Nq0hR/aK0j9xL77Z2XXuaCfN6WkXPmBlQqIJSAan+Po3yc+Ej5PMRISrfkBLmlxsyxJW0UCHU/a9jnXcwppaefGkVK6F3ReUbLo50KcU4Gh8UFHgud6pNvIrolyoRZJv/c+wLvVIJ6BDBzi4bAdv/xOSORgiU2CMbWCc3K/gHdgr/EstR81yPv0lD8iX/hPVmpYrf2MGSw985F6BNDwix/HUjRUz2c8Ebm3Xh0sYItQz9DLlTne5Es+PQWJYOCIJFPOIljfdLKtejhU/6cYxCvChPwVNBob8LiBtSRbCvYkaAKCyZGP+w1efBnuVeCbSMZGVVbNeXNAoljAkgkXwNc+qtJGS6T9y6qb0PJ4Wz/ZO6D3SNoI6Dar50Lt7qsnSYV9k82RLUf/SLZZSsve5HRvgCqbiEempmP7DoXikz9mL948SCm6AfeY0J8Q052BMzxFFpwcWhHI2atxAS1jSmOVNp9ttl8dd1jhi1YumnzMqmRr+222A5N6OmJBiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5519
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Damodar.Santhapuri@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6c351980-2277-421a-178e-08d83cda69e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f1rEAesUTxv4v+rLCqFb+CQEv/JA8Y7EbIcDvSNQH0UCNmNE5xsHavcodibFuuEmDJtl0g5auLjnQ97zuknbUrbR9/WkIYQ6wMqBHYcvH00ld4zXGfDU9p/EXHhPFO89gex4ZRj8Z7creahPFYZiMfu53aYkeLsEUtKOL/JxgdDFHCAb6V+aF6ujeU3aKArXOd7qi48z9yKFjL6T1h6RMRaJuPjIRAj5cMW9Jn0a1urYqDqTEtU1AmnelAK6SKVt+3BsXp7OVqDvROmzs23aab1ov1JGjyG0aBaOvmUud0DVngow0T8QR5Khvtzh2Iz71WDcnsCrLqt5YWi+f8HlHW565DPj/XF/sA4OVFU765iZQmBn+1LGqRgHqUtLD9MnUKV9XXssq71MvzXk4o4Fvw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(46966005)(956004)(2616005)(6486002)(36906005)(86362001)(316002)(82310400002)(478600001)(44832011)(70206006)(70586007)(356005)(83380400001)(6666004)(8936002)(36756003)(1076003)(5660300002)(82740400003)(2906002)(81166007)(47076004)(8676002)(6916009)(186003)(4326008)(7696005)(16526019)(26005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 03:06:52.2026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d46ccb5-62d8-4806-c2ce-08d83cda6e38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4222
Content-Type: text/plain

Use the FW_INSTALL variable to select which firmware
binaries should be installed in the target.

Change-Id: I6bffa3db9adc27a5ee43b316a12a758c48acb43f
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
index 6abe4ae..47b09aa 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
@@ -28,6 +28,7 @@ S = "${WORKDIR}/git"
 
 # Allow platform specific copying of only scp or both scp & mcp, default to both
 FW_TARGETS ?= "scp mcp"
+FW_INSTALL ?= "ramfw romfw"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?= "invalid"
@@ -56,7 +57,7 @@ do_compile[cleandirs] += "${B}"
 do_install() {
      install -d ${D}/firmware
      for FW in ${FW_TARGETS}; do
-        for TYPE in ramfw romfw; do
+        for TYPE in ${FW_INSTALL}; do
            install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
         done
      done
-- 
2.17.1

