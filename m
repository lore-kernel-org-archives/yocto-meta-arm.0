Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web12.18759.1600959079929943537
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 07:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MzfXnve7;
 spf=pass (domain: arm.com, ip: 40.107.7.80, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu/Z/voii2hrQ2UjCYGMlv5nYC3jaCa8IHMtpeQKmfI=;
 b=MzfXnve7IQ+q1t5X9V27I12HUXgwAkxbuE4LPMwRO4PWW0ckyhoybh/vOHjLxKbkXt46djI8rIEUAhOEM5swmDBdEn3ZU6s4UI1qY/SOQNMACjRqlzyekSIQN7JbkvqGQiEJ4sVT9KZwgg1JSmUn4KCcDeP/r4eZQJGqsyk9nas=
Received: from AM4PR0302CA0013.eurprd03.prod.outlook.com (2603:10a6:205:2::26)
 by VI1PR08MB3792.eurprd08.prod.outlook.com (2603:10a6:803:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 14:51:10 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:205:2:cafe::62) by AM4PR0302CA0013.outlook.office365.com
 (2603:10a6:205:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Thu, 24 Sep 2020 14:51:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 14:51:09 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Thu, 24 Sep 2020 14:51:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e5de2663f821c92
X-CR-MTA-TID: 64aa7808
Received: from a64628e83b51.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 34D54EA4-9E73-45E3-AD15-D2B77217BFF8.1;
	Thu, 24 Sep 2020 14:51:04 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a64628e83b51.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Sep 2020 14:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYT7BGV+GKlb2xecCZP+ZK+cWYCQnOQC3j6TA2wHe7pgz+BJ7yazTQc0wXcfU/cTsUpj+Wlhn85F6cMcacve3nNHHMP0JJ7jHXu6Q8vP4S5YNHr9+1xDHLZpDUVLdjbr7cngeWFr+61Lgq9QdJW0XUK4j9KWWATl3DHgpZVrs7r3OIbXRBzo3jNTXRoewlYg5zjTdQ9gD38vqBDxboIPKK8MS9ycBLRZ/so/kNhUFLpQ4SBFHYHVCLijHiBdHdw4BsiATn1vDGNjINjmIIysF6GiFjKqbXtE4qx7c2jUwfbuw9v3EA8xgloQBJlBxWgdOs5QZ11CpwfRH/LsUbVMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu/Z/voii2hrQ2UjCYGMlv5nYC3jaCa8IHMtpeQKmfI=;
 b=P8c26U8tYa2QvgK4MPkqK476Q5fWFHz9o5E+rSwJ+0cAZ6PNwJBKPEm6FbGNyPjL6yYpf5nFn9elnpPY0I2+8yMA+HuReFAuK4u/Xjr9vdvEbX20rNjFzd88NT94V9IKvio8eddOT9lyT94SsxS17EJC/kb4tlTrAlLAtkbKijuqt+Cvds1V7+X1jLo/C+Bpcqob3dIzU4jHnfcvibankgnYWspWPTS47CZXz/X7MJo2nypQs5Fno/hSyWJ+smWT1ekm/jgdgUYAXjTe2i2L/kSBT9YV+nsZ+JrbWiCTLrZ3m/A5x54B4NeMiNnFdfRQSCzGzvRithQnv7QJzyF7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pu/Z/voii2hrQ2UjCYGMlv5nYC3jaCa8IHMtpeQKmfI=;
 b=MzfXnve7IQ+q1t5X9V27I12HUXgwAkxbuE4LPMwRO4PWW0ckyhoybh/vOHjLxKbkXt46djI8rIEUAhOEM5swmDBdEn3ZU6s4UI1qY/SOQNMACjRqlzyekSIQN7JbkvqGQiEJ4sVT9KZwgg1JSmUn4KCcDeP/r4eZQJGqsyk9nas=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PR3PR08MB5849.eurprd08.prod.outlook.com (2603:10a6:102:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 14:51:02 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 14:51:02 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: Use IMAGE_EFI_BOOT_FILES instead of IMAGE_BOOT_FILES
Date: Thu, 24 Sep 2020 14:50:26 +0000
Message-Id: <20200924145026.14906-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO3P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::18) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.52) by LO3P265CA0013.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 14:51:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63c2466e-e0e6-408e-5e4e-08d860994626
X-MS-TrafficTypeDiagnostic: PR3PR08MB5849:|VI1PR08MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3792C6E77960CDE9707D16A18D390@VI1PR08MB3792.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:293;OLM:293;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 m+BQB32pDO0Qtjs6BZbcclsv34sGMJ0bQ/3U6GGSmliTJFqIVEDu5yRsrV3T5FAbOtx678SdkjQ3QHrEAedQYPEssAj1fI1xZ6KzZFh+EKZmyCtmWeTMRskaFG5MqfQj9Fg4g62eRDNYsrIMOtnc0G6ghyQh3U5OQ5AnHjmjxlXBSeqyCQfe6MOzukwzOfuMsF7U465rnon0f5mlkQpCRZLJMKljweI78/ZMK0FvJUydj3JrqwFtC7ItJZKy4/tobye6xAXPnhFc48E3kq1Bv7n3inSwe6hmHVzvBNp1KxIv/iimN7yhSi9ZVVYDAPuWQeH1d2qYm/QKiwseVKTf/1+0DUheL+TX7u0oYWuAYbua0kJJHu7SSW/thGVAhwED
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(26005)(4326008)(478600001)(956004)(2616005)(6666004)(186003)(316002)(86362001)(6486002)(5660300002)(16526019)(8676002)(4744005)(1076003)(6916009)(7696005)(66476007)(83380400001)(66556008)(52116002)(36756003)(66946007)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 GBwa73FY7tfR6HiQRFW8MScS3Zz7UQ+1p4aMT491rAe1SfDEiooHKUoFShG9NTSek4v7l72ch1sY7xlXpqxhvIgw/STpxlosL6EdJ3nODNzf0+tlipfw+v2cJ7kBkIvojSjn9BjMfsZHXf6GxY5VyB5IvblcF9F8AeiVNHeXnjSXvHSwFCFldjw0IYRY/gf+EtXh31ZLKalgLwHGEM2o9PVEwZnHVFk1IScVaFSs6YXX3w9XTHePhpoFLQ1hFE/GaAVSEDcr/a3494b03NktzU8R8jSO7DgDkaRU8rTWJMeQIw3Xx1+j3dn+Ko78Zjgz2/VMmkfGDgG7ZCkcmtOkYmb4SNUTYUzz06wwsR/QUUI565ul+jznJmiYJ3uzKAzDuRvLOmpYUI3hHMslncO7I2b4K752sjqPf6TAJIh2GbsyOncfUUpkci/XCd7zvCNOEcyL77os/he2+1m2QtyqKOkaAAKRZeIcILo0DGDe8pCIF0nufnZEAoxxCH/d8+N00/PlfG2zD6xJJXV6+CDEvOOBQSdiLSaPopHAMm0TPl2s5dKeUIolrcmTEStAWBOjNqiK29KLTiCdOVP4g5eyHq17U9Vpg8MCksexeSIyoDrMvo//Y6TBdMdiBC6DNOgM+P8se8OQO7ItGxljAPSHwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5849
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e0e2b70-cd94-487f-34b5-08d8609941e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mg4myblrYVPLLbfbv/J1eezxeh0aQI5ght32257M0BhJ0fYulUlfyr/A2l/NG5nIxzXtoltNhgnMnvIzoVDCJf6jO/pL2gUF6rdiaDmLTd0ROAu/IoUOT5SZP4qk/JSdcNIOMsFOr+ober5sxordNEXkOABJhJRhc06lzACwUq24B/tl+6ebA2/k/U07ourrKXFdP5mD2wp6BxeZKBrCuYLsN2gLd/DzyWdS8hbFoRsXymd+FYB5vxbIiYmhyFG4iy+p0xc7Oo/g8bW/poF67ircWsA0cfazJkIRCCjhaTmK/6N5tqQoppxPyDM6iqn5qo6Qmjo4y1ZfwSxb2h8luNyVnxPSRcqw0k6fUXjqfSaB//kSQq9vcFum/n4BhUB3SHrWjvWNE3DbScQL1MvHpS852vVyGKAdXfpyG1iXyeLPgKoB0pxHOCvCV+GW4v4P
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(6666004)(478600001)(47076004)(81166007)(356005)(36906005)(82740400003)(36756003)(1076003)(4326008)(86362001)(4744005)(6916009)(186003)(6486002)(2616005)(70586007)(8936002)(5660300002)(7696005)(26005)(16526019)(316002)(2906002)(8676002)(70206006)(956004)(82310400003)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 14:51:09.5477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c2466e-e0e6-408e-5e4e-08d860994626
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3792
Content-Type: text/plain

Replaced IMAGE_BOOT_FILES variable with IMAGE_EFI_BOOT_FILES
in the machine config file for N1SDP, in line with commit
85574ce0cf84eaf828334dd2fafadc18909e73b5 from oe-core.

Change-Id: Ib7b76c01870dc10f49be4bb9c0b7623bd2819d46
Issue-Id: SCM-1300
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index e4e6663..9df3e50 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 # Set default WKS
 WKS_FILE ?= "n1sdp-efidisk.wks"
-IMAGE_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
+IMAGE_EFI_BOOT_FILES ?= "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
 WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
-- 
2.17.1

