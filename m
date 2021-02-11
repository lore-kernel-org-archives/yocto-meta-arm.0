Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web08.5764.1613032046751210893
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 00:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RJ6fgcTi;
 spf=pass (domain: arm.com, ip: 40.107.7.57, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57sF3GmDRh0qaPxDdsCHIveJLNWKrxtw1X9AMmr/gZE=;
 b=RJ6fgcTiMu9Nmxmvk8B14lwVakcgtZy+mQJBkR8BKn0GKDSKo0YUpRFKT8d1eZaWAv7tjjdd8qgxrJS+myGlUcC0eOe0OlJ76LUKwjKy7iluUBwIx4ZLsVdo4Cy8KYsJKmMqCQxceGnpyZ+CPpH99TACUevV0+VMkYI1oTcjIps=
Received: from DB3PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:8::35) by
 AS8PR08MB6405.eurprd08.prod.outlook.com (2603:10a6:20b:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Thu, 11 Feb
 2021 08:27:23 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::b4) by DB3PR08CA0022.outlook.office365.com
 (2603:10a6:8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28 via Frontend
 Transport; Thu, 11 Feb 2021 08:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:27:22 +0000
Received: ("Tessian outbound 4d8113405d55:v71"); Thu, 11 Feb 2021 08:27:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4e15c7de11631f2c
X-CR-MTA-TID: 64aa7808
Received: from 6c99ccb6fcf0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5D4F2B77-B848-4733-97FE-5F68573DC330.1;
	Thu, 11 Feb 2021 08:27:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c99ccb6fcf0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Feb 2021 08:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDzyvGb6e57F12PmYEFyOzAM3ni7M6OHZMIHjs5ee4Cuki1T+TlVl9ikluuThuUUt8nu4c911I7eWSrPyz93fkV5+bCfJc8MZblLo58XQyZ0oq/X8cYp4FYaprhLhscnzE+BjsygNvXpLaxuvXV/KCDibUbnmPnS/lDqEv6Oh7kN0HQyp0OUugIQx64O3Deop58n3eBGm3GlnOA0+GNjGOkyW/HFY0YgBXVMMvURyQ+laly5oJFuZqwB04HqYveiL87Sc7rIBnDiIjfOjikCDu2mUm03XhwxlKrxbJfZrYqWGlpRhMErPhHcKnAPzamJl/W3vMU5Nho1ydCoHFIAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57sF3GmDRh0qaPxDdsCHIveJLNWKrxtw1X9AMmr/gZE=;
 b=dscEHSa32Rj0h2PLiVtcc7Nt6M84vDFQBaO/9hyMDklxceampVhFdIEAy+ArwvnJbyY52vEhfjqBzZh0Ezd1KJVwNQcfsNFNd8U00g2RTCsTqSV5aQYVm3vPVMvI85Kd8x51ngFQr+yzaDo+zeP9YhTsu0eDBj21KzVWZVpEWSch4K5AB3FOp3+woVeE1zOCjhQegeAJ4r2c1IWwSSlut2nBibHXHomZ88Y1KsdJfeE+PkNXUFcwid0tv8wvzLa8gBwLA54KS9gEgZQB/9e9acx2i1wC7fxsSFRhieGUDQN0Ee/fLe+VtGqvIDBCUrrZHcCROkGp9BWqLHPISCZ1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57sF3GmDRh0qaPxDdsCHIveJLNWKrxtw1X9AMmr/gZE=;
 b=RJ6fgcTiMu9Nmxmvk8B14lwVakcgtZy+mQJBkR8BKn0GKDSKo0YUpRFKT8d1eZaWAv7tjjdd8qgxrJS+myGlUcC0eOe0OlJ76LUKwjKy7iluUBwIx4ZLsVdo4Cy8KYsJKmMqCQxceGnpyZ+CPpH99TACUevV0+VMkYI1oTcjIps=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Thu, 11 Feb
 2021 08:27:11 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3825.023; Thu, 11 Feb 2021
 08:27:11 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm/boot-wrapper-aarch64: Bump to the latest SHA
Date: Thu, 11 Feb 2021 08:26:55 +0000
Message-Id: <690eb8f0285c8962fa79e16d4cfe6582ab3b5fa3.1613031976.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <7338df76627e2651b0e32ff75e898419032b37bc.1613031976.git.diego.sueiro@arm.com>
References: <7338df76627e2651b0e32ff75e898419032b37bc.1613031976.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: SN4PR0501CA0017.namprd05.prod.outlook.com
 (2603:10b6:803:40::30) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by SN4PR0501CA0017.namprd05.prod.outlook.com (2603:10b6:803:40::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Thu, 11 Feb 2021 08:27:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c3571ab-00ce-4f0b-4ed2-08d8ce66daff
X-MS-TrafficTypeDiagnostic: AM6PR08MB2998:|AS8PR08MB6405:
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB640572D1CE43B6FBE4470B4B928C9@AS8PR08MB6405.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3ARCwlb9lmmAI4FlgbiyBjTsDlDqvkGigags8D2hCZSqtELCvvx8f0PTOsgoc6G4KS5XPo7wiVVkvnLlVE0WjYxxeuT97tWU6XSAKd7bWKA0Tt3yGOh9S/nfpnnEzp0RsCXou30NbVlx8pW3sz8S+wWsTkjT8pqBeXjEuSSFUWTuUdvr5NOxn1s73MUIPlt9aBrJXB5YchdjOohViTCJGNwCms2CogQZr9hon+tmwkGKO/NlMgV7l7n8ENm7TxPJELmQ3epBsucfeMxU7KGo1Kk2qv1Xr9TRK2xz23ZZeSsjXHCxTSQqT6JPI8uJptCStwgI7/M96R3tiXYfrf8O0dzI3gQIQAXiiHEfSZTkXTm2C43ZzsGXYbUsWd4QUhRUtndCDV84QA42jeAPlnGxkUGsYsRws2APg89iB8K7KMcsWn5/FgE4hG2ea0aCV/0yFVuy83vnleeYGIBh1m4ptpnOhTFjLzGgEF7pXkWsdhVjNdxHdym78NzDobnE+S4keqUxU2xMyCAz/fW1HYqeUw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39850400004)(376002)(2906002)(956004)(8936002)(4744005)(2616005)(86362001)(26005)(5660300002)(36756003)(6486002)(52116002)(7696005)(316002)(6666004)(6916009)(186003)(4326008)(66556008)(66476007)(83380400001)(478600001)(16526019)(66946007)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?V8nOOzUWdYU4vJgqhDrJEc/69/NOhnCFdKqOg8IgMKrmFVOTYJT9pqEuIsvj?=
 =?us-ascii?Q?U6X7a9BvVZTGJhsueAb/PxotGMMCM1QSpiNPGEkwl7MhZz4cQiMW86SnJ6a1?=
 =?us-ascii?Q?Mf69Q2UbXXAo6J5GPQobJJ6cUnKtQsohPh7ATB5Bx4Kzah/MFXwmuOT5IHvf?=
 =?us-ascii?Q?m8tg8kv4A4E6AvgPwybK1o6z4sUVsrwH1sY9+XvGrE2QoWikW6jiBFns7Obf?=
 =?us-ascii?Q?OjU+ulDuKQkRPvcfrzHjOPBQ5N2mQJxt/dnNEBiE6Ym9vEtYZ49AmKWu70Ls?=
 =?us-ascii?Q?wdP62JK5uIMmFOQOe9lTBVdcrfEL53899/Zo/nZxxhHF6OzYw7A68Ay2BdOT?=
 =?us-ascii?Q?s/VnZVGer0Y2z6juuVMcwXEEsxYKPWgKwPCoLQggP50nPWai0X0SZ9qS46kA?=
 =?us-ascii?Q?PcTJdOO+u3zDSPoJ1KU20KM1Ec9dHhyjLmGxUS9ntIXKPHaSaEQ2D92bJPeq?=
 =?us-ascii?Q?k27QCioRKpLh8QLdleNp3095yKBvwBNf5bVfXx8IlJUFJV960agqmn99T5M8?=
 =?us-ascii?Q?IKqyXFBGtCqsl51fOmKTiAaaXyh71LZQFj2775IRiDYKZMRX5DMpkDy+l09+?=
 =?us-ascii?Q?k/CWHgJgYN09Uyg0qz527DLoRIL94xiWZVt2zdRmHt8/oVFbaKb4LCjMeT+A?=
 =?us-ascii?Q?cySdhn4HMjuUOlX9TbIWMe1upTKaxV8eBIdXFA231KyM87J0NIC1j4X13c2o?=
 =?us-ascii?Q?uL8JU05oruyTDeHkjuy7FP8/D3K2D8442thit1Wv1ve+Dn4MkzQyPN6WudL4?=
 =?us-ascii?Q?k8Ua1L3CcoU7ZT36Te9wtZTEhadGHGp5PHagmUKCIvEhqvacTuITlkUgXgKw?=
 =?us-ascii?Q?NbVZoiGka0DwRWuHXH2hhocdAR0zFbCQZm8l3mOkENhoqoOkIlYVkpb2wlxt?=
 =?us-ascii?Q?6OR20m+yIFTtgwF/q+IWKXTrHOBJ23dqQFROT6wCZ/zHKmMFjbTpF+eJ35B6?=
 =?us-ascii?Q?QxyNNH3Kju1++yPJuk4g4r+3u9virbgA5460dkBumT8q5kzTdftsGmS8+1HR?=
 =?us-ascii?Q?JI0xnDGV+/Ovx3tOZv/rF1WdSQVDrhsCfQHnBmCUMm32xPLw56y5MHpGcgdA?=
 =?us-ascii?Q?aWjJUXoQcgLRed/YcXZTMVQRMNFZNG1i8engnN9lvELBs3BH/klQNR2IOkLb?=
 =?us-ascii?Q?Pqrc2mp63uK2whJ8mdOl4Hy36Dk9Me2QvlC19OjYc3XYiDvWv9b3ZCmNvX76?=
 =?us-ascii?Q?RtcVGfdbRmcdMtgmEIfr7xIFrt7VD5B0aepEw1B+EFj46xij820aFDdG1E8w?=
 =?us-ascii?Q?tvv2s90BxN3zJM3X4iERtnK8rQl/q6GihL8j1R0g7NZ2IrbqRVXhUWBWXV5W?=
 =?us-ascii?Q?zhmuAgL9JTAaAbOGOEwVnFrH?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd499bc3-3bc5-4190-3ab8-08d8ce66d3a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YJWQgihMoXs1H5wBmwVkdT6U0kygj4mIB+Bm9z1MMrazFaK00StFbLQkzoI7G9SzcjezUoQGJ8bLrcwSw2KDGlIilSjN4NzPpBrX8A93NW+9b8+pfi0AQ2/X7LYqVmmkQRdWuUgYtZ2X8MvWNZo/vOTDBFcsC9MwsOGigfnpuZ30tCrQ6qpA29rPKCEe48LfBIDZSTyTqtEaJ3rxgG1fKHipXy+YhVz9DNohtgza3HDolPdpnFc6J3LoDC+IyaSym/lglbSHXkPD3AN2jAs2TX+qmCLrTzxIuV+WJmjcMA5tBFeeK+RVATRak4kWBm882TnqXgs9n0WU7XPgPVSlXkgz4TDWUF0miAWVULkFYZVL/z9Q0VqwaQk5GjhoCS3zc9W/wWcHmiVHz6KKZ2ug5EtOrJjiSXUNu/2onc1aTT04FObkQdhKoTYlWSdlHwOaO7Zx4YKmu2HT5qPiy7dpZYO3SF2KXURsWuxdM1sko8qBVWSo6Muq23LX8gGkxcgo2O/sdCrryJdonjvMCx1gA8b5LjeinrDpGihB+cZ4heITjihiqFD5Cau2oM2TGXOFH+83lCK4lZrLhB1MzAXOqAoK49e83Nl/Mph3Qn4S8ZAwFpgz1x8cfe68zdGhxoDUa3Nut+c6iBllHRpi+dY82g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(136003)(396003)(46966006)(36840700001)(4744005)(82740400003)(2906002)(36756003)(5660300002)(70586007)(47076005)(70206006)(8936002)(8676002)(6916009)(336012)(956004)(7696005)(16526019)(186003)(478600001)(4326008)(26005)(83380400001)(316002)(356005)(36860700001)(6486002)(86362001)(2616005)(6666004)(44832011)(82310400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:27:22.9006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3571ab-00ce-4f0b-4ed2-08d8ce66daff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405
Content-Type: text/plain

Issue-Id: SCM-2080
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I823114be82efd02ff7b14fda304668e29facd092
---
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
index 322c9ad..3e4751e 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bb63326febfb5fb909226c8e7ebcef5c"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git"
-SRCREV = "fd74c8cbd0e17483d2299208cad9742bee605ca7"
+SRCREV = "8d5a765251d9113c3c0f9fa14de42a9e7486fe8a"
 
 PV = "git${SRCPV}"
 
-- 
2.17.1

