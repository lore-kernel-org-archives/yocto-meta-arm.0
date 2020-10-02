Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.83])
 by mx.groups.io with SMTP id smtpd.web12.13229.1601647544200305176
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 07:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=y8jckFKQ;
 spf=pass (domain: arm.com, ip: 40.107.3.83, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB/RYNo3hpYRAe3qEw2nlqxy4Pkx1Nn9yjWpziLS/5I=;
 b=y8jckFKQAbmXBa/pDBe20tqRMYp/X56rjdkwHqJvRuvIFtmGbDpKETUm7pC7qNhPyitUi8/XmPVX8lXkmnu2+LcIzGP9j4BwuhSXSbyyAb9SRxIwthvrtXJyF79zBGaytlOMN9I8jI2xQFZv6xkr4a5VlWxVcNrmWOEkKGXy3yc=
Received: from AM5PR0301CA0024.eurprd03.prod.outlook.com
 (2603:10a6:206:14::37) by DBBPR08MB5546.eurprd08.prod.outlook.com
 (2603:10a6:10:c3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Fri, 2 Oct
 2020 14:05:39 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::63) by AM5PR0301CA0024.outlook.office365.com
 (2603:10a6:206:14::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Fri, 2 Oct 2020 14:05:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:05:38 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Fri, 02 Oct 2020 14:05:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1bbd935edd7d661d
X-CR-MTA-TID: 64aa7808
Received: from 8c03d8990c83.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 36189A0D-C2BC-4A85-80AA-5873490D2A20.1;
	Fri, 02 Oct 2020 14:05:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c03d8990c83.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:05:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODKn3/6DaSNYGPt86olJIPGunZQ9GONXWz2gjm8zyzQJURZ0mUIKG7QgGPTGHAFDrgDy3dE7ApJH5Ic4OfQYlq17i612wZYT70MV7/keVwBzwbeqQojTgHFP3ECg8SEMtyQ4szLM4R42rPiHufjZXQOMVnK2HKJpz4k1LFtHYBSPRyPmHKXS50SUfz2cmZLZG9196cVXQ5Px4cKofmjVEoBFnWCzi7agbrMTVa+sQkcJUlABoQZCe+E5gbTW81msqAiD448qWGcEkuCwxtKB1u7Rt8c3ulfwNxtjpj+vsOefxEa9Ml00aWARvQHvkvhfY4W1NN/HqSAqv+H28oMZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB/RYNo3hpYRAe3qEw2nlqxy4Pkx1Nn9yjWpziLS/5I=;
 b=I17PbjQD/4CqbeYqNtV+s3g+lIe8wO/r734i7VpHXDxdEnleij19tJ+ZXY5LD3yeAevOWaH9SHu/7LwjyxFX1RpEZyuaCZmmJU7O+KDy8WdzobE+sRRAE6yEA2tpiOhqEbEZnvFsmOxZC6kG2wi2AkVlcYHGNJHN4R4WIy/Tr378EEMFfbjpBCHB93BZtkGIZQhCjcYSa/6TOjDCY7joihRXOzZbwcgi5o/0YDAu3CrWQUU/9SkuBVtsnglq52v15w5kJSnhZWJKCRd74TlYkFpT3UEYfxq4AALVVxsMuyVfkxJ8ncpM0Skv1yUGTMofcdt6/HwuXWC75j2JUaN1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB/RYNo3hpYRAe3qEw2nlqxy4Pkx1Nn9yjWpziLS/5I=;
 b=y8jckFKQAbmXBa/pDBe20tqRMYp/X56rjdkwHqJvRuvIFtmGbDpKETUm7pC7qNhPyitUi8/XmPVX8lXkmnu2+LcIzGP9j4BwuhSXSbyyAb9SRxIwthvrtXJyF79zBGaytlOMN9I8jI2xQFZv6xkr4a5VlWxVcNrmWOEkKGXy3yc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 14:04:41 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3433.037; Fri, 2 Oct 2020
 14:04:41 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/7] arm-bsp: rename musca_b1 and musca_s1
Date: Fri,  2 Oct 2020 10:04:03 -0400
Message-Id: <20201002140405.7896-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002140405.7896-1-jon.mason@arm.com>
References: <20201002140405.7896-1-jon.mason@arm.com>
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: SN6PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:805:f2::33) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN6PR04CA0092.namprd04.prod.outlook.com (2603:10b6:805:f2::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37 via Frontend Transport; Fri, 2 Oct 2020 14:04:39 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 02 Oct 2020 10:04:35 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6268c276-50af-4c5f-3dee-08d866dc3da5
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|DBBPR08MB5546:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB5546FE9B9C50684FE9C5C2EFF0310@DBBPR08MB5546.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DCC7sPCCPDx4WXntqbyUHuuBrns9dYR6OVLKkAzrvHp7KclNlRBRz5DTCe+z2qjVMuaPPVgwymwm02K4+/9DfxRcs3fdkM9tzIYsH4KOa03aFSj9grhccY2cQPaC1x4B8Wih0qvvZo4RBzsOpsow1ZqF86E1smlS6w97kdYJ4HhU4orWh+nAJXwVS9nqiMAeFrYzFZFq1B0o0XB3D4t9lOvpu2J9LhhriHVuP8CsVW9GEwAUAT4kzO5n2L1bOfsVF/6wkhWyHn9+Y/W5FuJ7OGXT5eG+r4cQ2on8wNCNgpaFHCtXQpZDsa0bAiC1WEapOevuui2SazHAdNJ+UoFUODoLhObOPassjuD4IFBzn4W8zOBHR04N+ASgjmD8QFl6
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(186003)(26005)(1076003)(2616005)(44832011)(6666004)(426003)(66476007)(86362001)(66556008)(52116002)(66946007)(36756003)(5660300002)(8676002)(6916009)(83380400001)(478600001)(8936002)(42186006)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 dwR47eAFe81UCwGXFud30OAGZiN5SY4luyMqnRc1Oy0G7a68Pdhc7xe2NRiG4KC9LXnCkUAeFoy1SKmKzP7a8mikmikQcD3+AROgJceYi5JWlBaGzBci1sdFoY1dGY6IT+K/bg5RJSzCKPYAxFAi0KW3q9YCEPMmQmJ9mESdexIoY9wuGKmE4NC9PQ8DSN8YNahSnMaqbcJLRqEbDY0bHSM6UHHTgUJVNhwUeYP0OLxhnfiXtfSRqBiDEqB30FhsQwa1iub6P+2ydIlUcP6q10P6T79jUu8do80Cs1RuOzfP4bHSU8abplxilO030MXj3oxCeIP2YvUmf2M4Gdyk+iwplV+IMt8J/jXBkkc+JVnToOKMAFZqA1fCbKe2YJBQwcKHKePY0fr4yqR+JUKTvE45GmGLI7YiWUnnLCUNlm+yluHxvpWTHmHJo6ydnideDdObbSFgRzQET/Rh0hu0PBtwYAXNi+p8QBGUAQl+IvOZiCvgsuo+2Ffkq6J88EVAqTZxUTq9i7m37XWlWfg+g37b69BRvV//ona54PYnuy0U0OujEHZIRvH2C6hxAIHYkoDkYPzivPi3zxhieLpIf+i9bQz+07wA4bEbH/AOEivoaw/a+uv26xvZdpb7UEcC0JvNxrv8HyRDzNRNFTUh9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	55dbb1f7-63a2-49b5-83f7-08d866dc1ac4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z2zOL/5Mg8oTwWlQeqrxGOXlYTiMguaA0uu1YJTxKjqmrJwjUVJsgnG0qEEgZ7oUSJ/1wOea3XuFS4+r7xgBJPfpOs+eeB5dur524rssLU4vjRGKbYcGXdEcLDSEOs2lTJsfzgkNBzZPSdXPsHf5w7bjwuz4ezOeWGCVkCHT7cdTGakyINodsNR3nEneXV0YCqMj+Mi7Jmgij8X40IhBmQL2qRkPuanrdRRhwV7ka+NHirpchodAS7Q+aIEwSCAtKJwrMM+zoxGbptNGBnrQsNsi59G6HB6Ezm7XW5hUngbUE/lP7fmsJ85x67OtsNi7YuBEHjRc7DjkLqHYD4J/U2cIJSPwLBteRD374KLFw32Jvk9sE7hPwdC3Dj7zOA8YhddzgP/VflVVhci1JhYSsw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(426003)(6916009)(42186006)(316002)(36906005)(2616005)(6666004)(8936002)(36756003)(336012)(86362001)(186003)(70586007)(478600001)(44832011)(26005)(70206006)(1076003)(2906002)(47076004)(5660300002)(82740400003)(81166007)(82310400003)(356005)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:05:38.4513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6268c276-50af-4c5f-3dee-08d866dc3da5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5546
Content-Type: text/plain

Rename musca_b1 and musca_s1 machines to have the standard hyphen
instead of underscore.

Change-Id: Ifd43d4f68cd964f5acd546a8380f165cc53588ab
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/{musca_b1.conf => musca-b1.conf}  | 0
 meta-arm-bsp/conf/machine/{musca_s1.conf => musca-s1.conf}  | 0
 .../trusted-firmware-m/trusted-firmware-m_%.bbappend        | 6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/conf/machine/{musca_b1.conf => musca-b1.conf} (100%)
 rename meta-arm-bsp/conf/machine/{musca_s1.conf => musca-s1.conf} (100%)

diff --git a/meta-arm-bsp/conf/machine/musca_b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
similarity index 100%
rename from meta-arm-bsp/conf/machine/musca_b1.conf
rename to meta-arm-bsp/conf/machine/musca-b1.conf
diff --git a/meta-arm-bsp/conf/machine/musca_s1.conf b/meta-arm-bsp/conf/machine/musca-s1.conf
similarity index 100%
rename from meta-arm-bsp/conf/machine/musca_s1.conf
rename to meta-arm-bsp/conf/machine/musca-s1.conf
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
index 32b50b7..d7a099e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
@@ -1,4 +1,4 @@
-COMPATIBLE_MACHINE = "musca_b1|musca_s1"
+COMPATIBLE_MACHINE = "musca-b1|musca-s1"
 
-TFM_PLATFORM_musca_b1 = "MUSCA_B1"
-TFM_PLATFORM_musca_s1 = "MUSCA_S1"
+TFM_PLATFORM_musca-b1 = "MUSCA_B1"
+TFM_PLATFORM_musca-s1 = "MUSCA_S1"
-- 
2.17.1

