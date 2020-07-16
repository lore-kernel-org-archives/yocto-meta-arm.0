Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.77])
 by mx.groups.io with SMTP id smtpd.web11.13806.1594900427379732967
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 04:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AWThB1wt;
 spf=pass (domain: arm.com, ip: 40.107.7.77, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NivMSIeDo2im08RM7BM9OMgejcYnPPwrzq1CMXn6mAU=;
 b=AWThB1wtap30fEbPkxtsZjKhfiD8byEbM/aVHYPaWUN+LKvYe3rO89+crAY0uSG9WT2dl9NkAzgSi4s+QFrfGN4MVYqUAG41sBTY5/VK1xaPckSefJM6lT4RL+/IHVZcTb5E5ijGQbD0FxOMjmyGiESNX1NSx/+LB4W9kD6a1s4=
Received: from MR2P264CA0091.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::31)
 by VI1PR08MB2976.eurprd08.prod.outlook.com (2603:10a6:803:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 16 Jul
 2020 11:53:43 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::20) by MR2P264CA0091.outlook.office365.com
 (2603:10a6:500:32::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Thu, 16 Jul 2020 11:53:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 11:53:42 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Thu, 16 Jul 2020 11:53:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf535698496cd795
X-CR-MTA-TID: 64aa7808
Received: from 4bf74a6f6d5b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 02FD6587-7444-4171-9F8F-7D366AD44893.1;
	Thu, 16 Jul 2020 11:53:37 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4bf74a6f6d5b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Jul 2020 11:53:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLTsrTZ8m0M6LuFubEnFlKX2xsS1TuY9YNh6jh+4PeCLpiE+LOZaGqzgodnLQ6ShG8EZavj15Tzn+ZqMJz76uWVAMAOh3/mZOeu1LpAeqJi8R70K0W44tj+jfgtPI/37Eq63+Dk9vPkfvu8GjIHNnu8J6wAvK15SMKYPi44uwBDiG6LlrpJ7b1rZRoprNgJsavf5uDOQVAwT2VdRf3qfbOoHrBnD6nr+Gi68pf97kCpjH+UwnmcjhX1HIDI4sCVjfMJVE7LoK5fI5qDzXqW0YvV7kOOnjGBC3Id6vNRCVOKc2PQ4jaFER7/KrBRIRnmO9qjOL5qFVKObtmQvQwXtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NivMSIeDo2im08RM7BM9OMgejcYnPPwrzq1CMXn6mAU=;
 b=Heoub5N38xXPR2DjZOVv2mCg1eJ7mIZiLM7yIqVAhyJoU8WSguh1ixQLuDDdTuqAUtti9xttrV8UKSwypbRL2zo1GskeLdlkB1KbDC2lQ3qGN2EOEOIAYlwUU72B64xhOOz239Abl2pmFe4NS9OpHU/QJmKYjCII2pNcICA/X2xpHJoFpKb1Mbq7D4hTCXasmjgaxM92AUKZ36Z9iD3ACtBcLzDkMduK64qEPoPmRWc7Gc5xZNvwKRT630M/EsHJGFcH6TM/gQHeI6nyMGP/2kFiBTHsNo9diP2e5fFzmsTN2CYqURtv24tTvRnm6nAKFcOk6fcaVWtoGYt7G/A1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NivMSIeDo2im08RM7BM9OMgejcYnPPwrzq1CMXn6mAU=;
 b=AWThB1wtap30fEbPkxtsZjKhfiD8byEbM/aVHYPaWUN+LKvYe3rO89+crAY0uSG9WT2dl9NkAzgSi4s+QFrfGN4MVYqUAG41sBTY5/VK1xaPckSefJM6lT4RL+/IHVZcTb5E5ijGQbD0FxOMjmyGiESNX1NSx/+LB4W9kD6a1s4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB8PR08MB4940.eurprd08.prod.outlook.com (2603:10a6:10:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 16 Jul
 2020 11:53:35 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::e1ab:56e9:2119:8cc5]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::e1ab:56e9:2119:8cc5%5]) with mapi id 15.20.3195.019; Thu, 16 Jul 2020
 11:53:35 +0000
From: kamil.dziezyk@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm-bsp/image_types_disk_img: do not force 'ext4' FS by default
Date: Thu, 16 Jul 2020 13:53:29 +0200
Message-Id: <20200716115329.19153-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::11) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO3P123CA0006.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Thu, 16 Jul 2020 11:53:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19da8820-89ea-46c3-306f-08d8297ee36e
X-MS-TrafficTypeDiagnostic: DB8PR08MB4940:|VI1PR08MB2976:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB29763F9BDADC50F55FCD6631FD7F0@VI1PR08MB2976.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:486;OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FmFvSEPgnx0Fo0/mJdFirUeUUXZbhXyJSdGOtQ1wFZntNe8krYUWyPB7TLhnH90+2uQedJRYzljitqIlMZFjzWBcZqUdr9WEvEQljs1sC1mioWqf0cRk0OrineRRHwEAcW9purAizqxXYdGpd0VV+ddykzkt5zRRcVWvjzFwJR9o7fG0yejrf8AInhb+RhGgIvBcCCeklFORhSwowQUl03pLCsknpRYvDfOmMsP7oBJtdZRBvyX94UHy1utYA26GUHHchhUvAsjH8dr2bSsCZBZ5OgqFi3d3US9lldS8cf4H2ZimzEgDOVch7zz6pJ/LgruYeoh45N/0/qBiOyQUGQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(52116002)(478600001)(1076003)(66556008)(4744005)(44832011)(83380400001)(8676002)(2906002)(86362001)(8936002)(4326008)(66476007)(66946007)(956004)(7696005)(186003)(316002)(2616005)(6486002)(5660300002)(26005)(36756003)(6916009)(16526019)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 U7wfSlquCXBt4u+ptKU+s6zUBWFCxovkPhKiNxssnUdIYZYrVqpckgjFtzVn79BPApXk7fVcR1IOS1QJzmF4FBlpEtrNvYRJYhTVL7B5Cc7WriAVUdQP8wdVnzUkSQ9muCDqYDJz/YRVpbOHq+fZcZ+pxxWiyNO7qZtLegunFPWA8Xc8S9y9vsbvSHPQiaaILq7ZXY5zD8lgi9ERcRRFV1YWUCNirUle0vg3vffPQwqFf4rV3OYQY24Ivrl/v3Idcg/dWkLdIfq7sT/I8y9WAULRiJ9tiK9qsh4deda0+st46avb+BWAS5ClvW3d2Ume7uyR3JPC5UjgkxPGI6/zVlpxUwBJ8oosUSqp3ClzaLFW/9ugTwoc6pUF1wrbJRFxyR3yiKRY932FvklXIcFKpB8HW8aIW4hyer7VxPD2oZ+/RVHYeeaEoioR4yowFLLhn66Ye70SDyDxq7Sz0h6kRVu72RjarM6JbseL5j9WFPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4940
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(4326008)(82740400003)(316002)(7696005)(336012)(36906005)(47076004)(86362001)(356005)(4744005)(6666004)(6916009)(82310400002)(956004)(81166007)(70586007)(8676002)(478600001)(1076003)(2616005)(44832011)(36756003)(16526019)(5660300002)(186003)(2906002)(26005)(70206006)(8936002)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f1d208a0-484c-4b1d-1943-08d8297edef4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B4+VmEnDxN6kDFSR28ShQ2+XxCgA9W/FVkL/LwSy7LTEyQod5C+obhA+DLVVibOHkIA8wNr2xBO52hS1MohnQifWuhi/9f7wZF+cbZ8pS948Sq8rfEQI/a+QYrze/prYX7jnG4PXPU6zLAnNbF6IgZbjM4slM1JLObNRQncw1UoqHFad+4n6HeFYmsEyYFWQiReqtuwEIZHq/u0mBEUthfwyQAXW4aycHq/M1tE+L9dkwJ680QO2/crhoGf+pviBzLUC1tSwnonowvuI8OeuJiK73ea8UYaedZLCXXMwU7ARRkdDkqnfuZ9y9oBy6TBatH6vy9koLHm5sQmHDAn9ljzYxdo0SKXOZ84oB69B+LzG4y0mnzD0SZAI0vN5YPdWolGM/SvG5TFov8G1EZv5nA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 11:53:42.9733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19da8820-89ea-46c3-306f-08d8297ee36e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2976
Content-Type: text/plain

In some cases user doesn't want to create any file system on a specific partition.

Change-Id: I4596d97b95034952436cfd0a267a3f6ae4c0401d
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 meta-arm-bsp/classes/image_types_disk_img.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/classes/image_types_disk_img.bbclass b/meta-arm-bsp/classes/image_types_disk_img.bbclass
index ea7ba86..78cc0d8 100644
--- a/meta-arm-bsp/classes/image_types_disk_img.bbclass
+++ b/meta-arm-bsp/classes/image_types_disk_img.bbclass
@@ -51,7 +51,7 @@ disk_img_createpart() {
     local imagefile="$1"
     local start="$2"
     local size="$3"
-    local fstype="${4:-ext4}"
+    local fstype="${4:-}"
     local content="${5:-}"
     local formatargs=""
 
-- 
2.17.1

