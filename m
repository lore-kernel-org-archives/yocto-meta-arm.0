Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.82])
 by mx.groups.io with SMTP id smtpd.web12.7392.1594822033080876414
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jul 2020 07:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lYdMbaZF;
 spf=pass (domain: arm.com, ip: 40.107.7.82, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO0NEJOmXXDt6toZJOAXFLdHaXzufzVYAsyMKLBamIo=;
 b=lYdMbaZFQCiqckyeHUvfpeMRK0l9qBYyD8cHwbxgy6j0hys6iszZ/J37yM64Fud3KVaEmL3syapiQ3Q7nvXgyEwtLPeOnGoM9K5G+E+Bk5hWYK1N8/eBbwpQ1qJYk8AetPMtwyy3No/vhfSUSpWVv7suGKu5Y6wpmpCa6OT4vQk=
Received: from AM6PR10CA0106.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::47)
 by DBBPR08MB4508.eurprd08.prod.outlook.com (2603:10a6:10:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 14:07:10 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::ad) by AM6PR10CA0106.outlook.office365.com
 (2603:10a6:209:8c::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Wed, 15 Jul 2020 14:07:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 14:07:09 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Wed, 15 Jul 2020 14:07:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91b7d0168321e235
X-CR-MTA-TID: 64aa7808
Received: from 9cfff3c195fb.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4B835B4E-300F-4408-BF9C-7E82B59C06D5.1;
	Wed, 15 Jul 2020 14:07:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cfff3c195fb.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Jul 2020 14:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7nBsDKv3h9hUlrHg1QN8a2Ntma9WAFHyMDjHctNIUgw41BmL9ymhqV5PJFVA/iIk0K/SbGwNV0/NxftRUi7Zq4H+WaTwHhpZvRMP5zH7fVG1wcqOe2H1qsdGS+cozZCGG5ZsUkaeavJkKIM9piXObus2ti1sACZd+Y6rj7+xwzxwwc8uCHsn+8xjKU6e7BWEPNL6fcu82B5dmm7m4MO/UBK4kDoYUbQVaIVJAvxOeqaYJ/wXAqwEah83V/P6xExmQqWYogcEefo8dJ0Yq1LmikDlPf1P8sk3+/rWA0j6oCVHJLimZOTkngcy4Qvs5WoSMtNDLOddQTOWHg170j5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO0NEJOmXXDt6toZJOAXFLdHaXzufzVYAsyMKLBamIo=;
 b=eI1eRldofqFNMB82IUi8T4FaOlYEoynxgUqufPISebiMDOUL+dcIHlb6yOmU8dlMmQaJSOsK6vMQuRic+u4AXWEyAJEJnXg9fxOZi6RAMWiGiYvTUXiEdVel0P3sLSulJEM4PuVV62aeA8WHT//c8wo+yfvsVV8E//QQNOhL8QgfGlXDFQer6ICCsuKESn82kScklJRf7n95HAXNkyCsqvt/9dej84vCwm7YsMn6eaCMQRYsjNM9pN7tvTZMU9/PdUAtQJwj/LWbSNtWhKA+1JTgQkDa3k28/U/6wOUfA0fg+UY6F0OF50lgGneldHLqCyf7w7TDkEvFy/jmGTVktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO0NEJOmXXDt6toZJOAXFLdHaXzufzVYAsyMKLBamIo=;
 b=lYdMbaZFQCiqckyeHUvfpeMRK0l9qBYyD8cHwbxgy6j0hys6iszZ/J37yM64Fud3KVaEmL3syapiQ3Q7nvXgyEwtLPeOnGoM9K5G+E+Bk5hWYK1N8/eBbwpQ1qJYk8AetPMtwyy3No/vhfSUSpWVv7suGKu5Y6wpmpCa6OT4vQk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5307.eurprd08.prod.outlook.com (2603:10a6:10:114::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 14:07:03 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 14:07:03 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/wic : add wic image support for N1SDP
Date: Wed, 15 Jul 2020 19:36:51 +0530
Message-Id: <20200715140651.18822-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27 via Frontend Transport; Wed, 15 Jul 2020 14:07:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e1a8a982-f40e-467c-a7bf-08d828c85d77
X-MS-TrafficTypeDiagnostic: DB8PR08MB5307:|DBBPR08MB4508:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB45080CB2F3F08B08B5C70CC4FA7E0@DBBPR08MB4508.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:561;OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Y9YDwvhrtSUSBPaMFIXaznZqWljUHNcV5V/GsDxCF3yOFlegZQNBSlxY4TZEs8YSbst5QjO0D0GyJGLsFyTBfm2y+gbbs+KJOZOSUHNhvNi+/sEpbz9OUy7Z1uEE/MOIY4JcuhPgqlIEvTovDwownAsmT4G3ehG9/0wcOJvU8xpVSoUDT7qSkys8Gg8yYu31OXAwMpZ8vk5ByvazdQAaEHbf7TgTrWRGJhpvYbo8p8H8bCD/gXGibwpKIn2QOu7gQLWCzKyKa/TjoVWTwv2qdXif898CwG6iyC57JR7+PLlFAzpnxU2g/Yv6SvgKCiyF6O1iA1o33rsj7mYTaEcgdYKQLGx3H4F6y30ahyQO9D4iAiG9c6nCqsgALf+1wJyz
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(8676002)(16526019)(1076003)(6486002)(4326008)(6666004)(83380400001)(8936002)(478600001)(2906002)(956004)(6916009)(36756003)(316002)(7696005)(52116002)(2616005)(5660300002)(26005)(66946007)(66556008)(66476007)(86362001)(186003)(4744005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 U3910viqxPOqk/frg9yn0dO/wqZdv1k1KTomwc+EozrA/4+ZcZ7JTE+gtd1lcvwcaGQrA43GNZnlhSxLxRrsyl2h0WQecEs06GaZDnyv0/vGjKxK4asQZ0+7B5qnkQ287zIYc9jOF/whSFW2QZ53Zl7LFqxy+GpZDN7lHqTb8JKiILmua+BnmLRS+Cr5TQoQ7DIG8cdJgsS2whopLQh/ZRIt460igJc/3/iUm6bN+N/7WJmKSoGO7t3dah7+GLP7/EbIZ/xQ8m9KiJdAY5Hh3HcPeEJPhQEZpjj/bYXsdWN2hS91y1ApQHsYSp0HkRSXWnqWCTloYxwYbKrXYX1huuwzPfLgQXxiAAEofa3eRUgd8i//RYarjkQCp3XgG/iiwljRlO2l9gKg3+sYwrJKZPe5Nv4ozy8RtZLZIAnBiKVk2qUfPg19N7Ep0X7Aq7/sSiV6h4xzSDKjmXp30BEJJMpJCrRCaNEqCxrQ1i3xKJAEcMhNwzn7NF0mcKshYP/c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5307
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(336012)(47076004)(2906002)(82310400002)(1076003)(7696005)(6666004)(4326008)(956004)(6486002)(82740400003)(478600001)(356005)(2616005)(4744005)(8936002)(186003)(81166007)(86362001)(70206006)(26005)(6916009)(70586007)(8676002)(83380400001)(36906005)(36756003)(16526019)(5660300002)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3aff034f-f4a1-4f0d-3791-08d828c85909
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bTEZxf1LgoG8UNmRj+A6EwBojyLs/9FVFQMKeXMz7rSc32Avlr+IHukXj5HnNyCvAgKMCN/YoGen5Xfjh4IiPbYJdgtWHtjbenu/8gqhybFcNowEprhC33xebZmOh6xX0dewv7iNqtQrAlrmSiDogGe0dtsXkpc8rzrDtEvK684oqPvGXZwP6mlaY+qfALv7YWL1d46jGe6bRetU5YqGDAsMTYbZIV2eRz0/sWPtiYbNQxCbj66Kpfsy8FCamo+DMmj3IKu1s+wdHnTCh0m1zTFs0Ukvbar536ipPQA7L0Yt8zZe7IEkopV8gDrty5eRx/7ash+l9aMhkvYoah7ixw3em88UMVCM3+CrzrYB99bJxgH9g0H7LMxjcQ7yMVXSlRzeU6WNyuRd28K+rbYfpFwcs5v/IkidrO5Z/8ysgqI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 14:07:09.8448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a8a982-f40e-467c-a7bf-08d828c85d77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4508
Content-Type: text/plain

- Update IMAGE_FSTYPES to generate a wic image
- Update MACHINE_FEATURES to include efi as supported feature on N1SDP

Change-Id: I8c75171270e3b643794af74b734825e1739999e5
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 96a3859..139f619 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -11,7 +11,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 KERNEL_IMAGETYPE = "Image"
 KERNEL_DEVICETREE = "n1sdp/n1sdp.dtb"
 
-IMAGE_FSTYPES += "tar.bz2 ext4"
+IMAGE_FSTYPES += "wic tar.bz2 ext4"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
@@ -37,3 +37,4 @@ EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
 
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
+MACHINE_FEATURES += "efi"
-- 
2.17.1

