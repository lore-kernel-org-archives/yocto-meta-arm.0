Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.13984.1602773180529555217
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 07:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zrRUnpgh;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJlt7+Gve3+f7fpEl6gY8D2B+6GCuPBFpcve5BTV7N8=;
 b=zrRUnpghAcJwxrZKRagLDV7YG4/PM8qGgfC5P2QpCOcEAt4wAxg5C3TTAtXvL2Ko2a5fvFlE+x1mPULdvZblbCFkTC+/pN0GpRPbl4QisZdOEEmTisKACL2TR//qcaBa5vsICVytEYuvgVE52G/EMu5LmE+ODaxUbLBl/WseY20=
Received: from DB6PR1001CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::33)
 by DB7PR08MB3562.eurprd08.prod.outlook.com (2603:10a6:10:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 14:46:17 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::3) by DB6PR1001CA0047.outlook.office365.com
 (2603:10a6:4:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Thu, 15 Oct 2020 14:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 14:46:17 +0000
Received: ("Tessian outbound 68da730eaaba:v64"); Thu, 15 Oct 2020 14:46:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c14108f3d1bdf877
X-CR-MTA-TID: 64aa7808
Received: from 9660de65610b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 79395DF9-4410-4E71-A220-822FCA6A4702.1;
	Thu, 15 Oct 2020 14:45:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9660de65610b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Oct 2020 14:45:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngfWfYOVdYMJAdlqCEd6UIrj5p/P2svRe6yOHwa/W4dP9BgXBoqt/xUkmfGRRSwuKVYd/GzGHtz0ihERqpxT4dM53ExsvYcCpzF629o4LTh3go8MIEXVJjuJtvukbEIPwrvIoMEkVvX2g84eFxAroRroeWZwqS/dUjxTTPCHaICPlTH01LvkXf+l901tisE17e923M8CT7fXCQtMou3W1Zj386jeVj4K5CkXsFhv6WSYco2qEriioVef1e5iU04g9BCp/lYgMVvUz5ht+oqtM13y2TAWeWusX4f7ahQQUbTgWkWw1ryCaprYkWoLVPrAyLhuo5O4FSuyVg07wvW7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJlt7+Gve3+f7fpEl6gY8D2B+6GCuPBFpcve5BTV7N8=;
 b=ajdLM/UXgs8NOENYKU0pVU3v1dGJXx2CM8DlnMV5z9h78WGLU+lLk5QpTo5WVHHzifcZXLvKMEsnO+7l/5o8E/JqI/1m3HHYPiQGGJWOu2soQNBT67aOnLJqiJcubjaZd5SCR/xgFLVc/Jfl938q7p9S7T2BlTiHt8ueAsKhnb597CTsh1P8efoP7Vv9ujve96tme/vxujktwloNPuFP0grCwH3aWxHWXKq7BP9MCQh3dpr57NdsvB9BjxQQ4pMZIfcSXtJsPqA1Tr+DiP5aVq5ar4zPHUIkzqlmdfoXzECfNAoeTdI9N1KWdT5qBdAbAMGtswwhKY4vxis5I/zyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJlt7+Gve3+f7fpEl6gY8D2B+6GCuPBFpcve5BTV7N8=;
 b=zrRUnpghAcJwxrZKRagLDV7YG4/PM8qGgfC5P2QpCOcEAt4wAxg5C3TTAtXvL2Ko2a5fvFlE+x1mPULdvZblbCFkTC+/pN0GpRPbl4QisZdOEEmTisKACL2TR//qcaBa5vsICVytEYuvgVE52G/EMu5LmE+ODaxUbLBl/WseY20=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5405.eurprd08.prod.outlook.com (2603:10a6:803:12f::11)
 by VI1PR08MB5550.eurprd08.prod.outlook.com (2603:10a6:803:f3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 15 Oct
 2020 14:45:37 +0000
Received: from VI1PR08MB5405.eurprd08.prod.outlook.com
 ([fe80::d505:51f4:5d9:5bf8]) by VI1PR08MB5405.eurprd08.prod.outlook.com
 ([fe80::d505:51f4:5d9:5bf8%4]) with mapi id 15.20.3477.020; Thu, 15 Oct 2020
 14:45:37 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: sgi575: update tune location
Date: Thu, 15 Oct 2020 10:45:31 -0400
Message-Id: <20201015144531.18273-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: SN4PR0501CA0075.namprd05.prod.outlook.com
 (2603:10b6:803:22::13) To VI1PR08MB5405.eurprd08.prod.outlook.com
 (2603:10a6:803:12f::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN4PR0501CA0075.namprd05.prod.outlook.com (2603:10b6:803:22::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.4 via Frontend Transport; Thu, 15 Oct 2020 14:45:35 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 15 Oct 2020 10:45:31 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f191448-b1a2-4e84-eb8a-08d871191289
X-MS-TrafficTypeDiagnostic: VI1PR08MB5550:|DB7PR08MB3562:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3562F8C59B4123859DD60A14F0020@DB7PR08MB3562.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 U+eoNRNndi87Fo+4UEwnFHpVBvgBXxPbqSRsOk6C8C7h+9B+8YNfKe0Tk1W9jOfj+gn18QD7UuYc5gEGucsZxinpXfjXBQeeF50RM5was4SjNPpAOdzO98ClvCu0QTjbscSZA/3OfPvvKScAi2c49OLq1nPrsbtJERxoDm6tO3CPpZrnyLkcyrEYJhjwzf6SY2oTgg6nbJebE0AVJosd2ld9gg9S5kUF+mhHSw0fIWPRzy3B3hZsklrucLwwueVCtDBp1r5ruDDOCUq/V/pfqHRDNZAG5Z9nn1VRQjJmnZ6f5LPV8/qE9XC11dfsdqGYcY6ocz88M8Eifq2Wod5Gjw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5405.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(44832011)(66476007)(42186006)(66946007)(8676002)(83380400001)(66556008)(5660300002)(316002)(26005)(1076003)(426003)(8936002)(2616005)(4744005)(2906002)(86362001)(6916009)(52116002)(186003)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 CebNCS9q12t0qZENoWSD9fpmN7jldndX8iemcePQ1qKyS1AEM6ukF2ldJcd1xFc4FfiFhs7z766ZgTdv4IiCLWoBS3anbP+ORrJrA05YLDb75FAqCXLLKB1AIC9spvdJpVYz9AREE4SAtKOs0GBoiqK1TuY28C+mKplhPPL9Cvm/FX8Jz/eFUp28HkKPxFEBuCiE61xiz9z2GYTyyoG+RoleXPrSlqq6LKjHHdiZXl/MsR0un8jy/Jj4ipU7yEYvZcCZgSBLXbCdATcA4uj/Oi5SaXGK7wvSLlSu6aC/ea8qesGQPeGjvZ2eQfmG3x0upvESIPnCtM7t8j2CK3pxzG3OAc0gPqBe4VU2A2WuUFyF7Y2Cgvy34FjaiGxV8Qc4OEANebC0nKgpzjcuRm+zt1+v/2udqrTTQUCITPffat/WnW2Q9wj93VkVl+QbYULt3xnH8OTLpWxBQ/gJSVk+AxoyZ8Wk3hHdvuQof903rr8ZEkO/KsGPdzIOirqHFoaVez3xRLxjTG/ER0mL1fz2IFDfmcZLcSmyzJ4DWPmTsi5+ifhkojd09jHGTVP57Nr48A2z0qJ/Btpnxbh2Gz0w4cVtYB7Ykkf8lJ18Fjj+G2knwCrm9CEoQeLshCg6HWNd/+u32LiJan5XzWeMSQPI/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5550
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	335e6f82-80b2-4853-07c6-08d87118fa34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vqNB9Frb3a3UnapQFjJ13YQ2lAI+1dxezZlDVNA9WkYLeavZaAfZpwgpWoXX8MwwydNFW4ME10pIbdn/4G7pAj5P9ztxb2UeUMcdADv3kNW/O/+dNOwcE6CTT380tdl2nUMXZZOId3WhjLT7u3R4w5UvNQetqAm8F2lHmppncrRInCp2A7SVLNO65rv/L/Mxvg2gbWrfQ8UeK8PJnAnTO6SpmF5hYunjZ6QUOKCTHMesW9Fc98wjbCYLz9Bxt/pAI/AYyXb1xC/NPjq3GWNvMskmf20P7bDRlS7K0V9i9cpUbRnlqsRilaRDcbtbAQ9+j3CXVy6UJ8kclPUANJVyFO8+sMmtahxmuvatsXVLtKONuPnxgA8dsxlwrZfv5Cki2w0xGttF5eWXpdjM/yAY6Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966005)(83380400001)(82740400003)(4744005)(1076003)(86362001)(8936002)(47076004)(426003)(5660300002)(2906002)(186003)(316002)(42186006)(2616005)(6916009)(36756003)(70206006)(44832011)(82310400003)(356005)(8676002)(26005)(336012)(478600001)(81166007)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 14:46:17.2004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f191448-b1a2-4e84-eb8a-08d871191289
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3562
Content-Type: text/plain

cortex-a75 location was upstreamed to a different location that
specified in this file.  Modify it so that the references the correct
location.

Change-Id: Ia2082e8368444b2355e6be6635f299a6383a7284
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index 163c3b3..1b6498c 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -4,7 +4,7 @@
 #@NAME: SGI575
 #@DESCRIPTION: Machine configuration for SGI575
 
-require conf/machine/include/tune-cortexa75.inc
+require conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
 
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
-- 
2.17.1

