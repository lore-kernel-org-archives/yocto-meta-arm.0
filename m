Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.84])
 by mx.groups.io with SMTP id smtpd.web11.15434.1600950009788490444
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 05:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MdJVqIqe;
 spf=pass (domain: arm.com, ip: 40.107.8.84, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmEl1bgPiW6USLVKxH9BUuxRuCUG4cfFDQRPRhFaLyM=;
 b=MdJVqIqeeKGQPib+T8Tx4fVEZzvgYP9zo5aTyTLUtHZCzffJPSerJv8ELWQMvK0+upxLwDFhDYvRd7mQdM6ADdXXjyaUbQMU/NdujPnZp1qdOpXYEnaTHJklBLC6b0Va19fdOfOrycmasCYNF+ya8x5yniCRideq6o9udx+qTpg=
Received: from DB7PR05CA0039.eurprd05.prod.outlook.com (2603:10a6:10:2e::16)
 by AM0PR08MB5411.eurprd08.prod.outlook.com (2603:10a6:208:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 12:20:02 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::af) by DB7PR05CA0039.outlook.office365.com
 (2603:10a6:10:2e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 12:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 12:20:02 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Thu, 24 Sep 2020 12:20:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 296bce6d31383c6d
X-CR-MTA-TID: 64aa7808
Received: from 86aaf420749c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 71148E09-461A-4C51-A028-EFEDB84553C5.1;
	Thu, 24 Sep 2020 12:19:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86aaf420749c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Sep 2020 12:19:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAbeVFSu50qkn+ASbusVa8tgcd52ceAmNcgRfFcXuNG1IEjEtYqK7wGT5cLDX2PXHkxFtEVwyvYOkOUL1L2UiC+PSYoPgIR7Wsxb1Pk7c+9yAVk4jSk05A5/SWwkocr0OWqB+eMp4JUR8DDT/fGBEZOcBZwBZLPqcHsXFSmOLjyUNFqyhe1M//yNaCna21h2hrJBnPvyrAQ7J7ag7FSlb9gpHhttTICLDJkLrp5zitgg9DbDpk6rYdLdyhxQe/mGmnCkj2UwwlMFjARU+2H4hxqDYcttK3ZKGT+w4ZbOruWVBQxCPT5+6T3Pp3O6DOQYcVfSYns/E67qWzrLdbILGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmEl1bgPiW6USLVKxH9BUuxRuCUG4cfFDQRPRhFaLyM=;
 b=GmxptvRM5W5DUrZv5nC3neSMB/5URj+convnsLHLUrOcb/DWIFG7Efxhh4A/tntd13jCcfBPQTrQ6zW7hpfGUZY+jAoLSg2H118uIH9hhNHlIX9HF2X+4+aueYH8+JMYRVokbT45aqXYCh2TY7KArcER+qsUBRjuF4qJs9sg1lmJ1z0eL40xbyGVo2dOmSrYq7/FnHSwU3WCXgAVx702pNN3M7u2IhRqboIdlWjGyIvux9sRTTmCtzDzkjyuDN/8qmxIoUYRh9HYH7cR3mNIW/oCnvRmDljPK9PLO9+vevc6iR9bdvk+l+qykrCDRsuN1iIoRqHSr1Ssb+y/+5qk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmEl1bgPiW6USLVKxH9BUuxRuCUG4cfFDQRPRhFaLyM=;
 b=MdJVqIqeeKGQPib+T8Tx4fVEZzvgYP9zo5aTyTLUtHZCzffJPSerJv8ELWQMvK0+upxLwDFhDYvRd7mQdM6ADdXXjyaUbQMU/NdujPnZp1qdOpXYEnaTHJklBLC6b0Va19fdOfOrycmasCYNF+ya8x5yniCRideq6o9udx+qTpg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 12:19:54 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc%8]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 12:19:54 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm/linux-arm64-ack: update branch to 5.4 version
Date: Thu, 24 Sep 2020 13:19:45 +0100
Message-Id: <20200924121945.4074-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::17) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 12:19:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3960d820-5158-433b-f413-08d8608429b7
X-MS-TrafficTypeDiagnostic: DBAPR08MB5717:|AM0PR08MB5411:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB541169D92ABA892C9003D0B992390@AM0PR08MB5411.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:85;OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6Np+4wTtRio2DO9d3GqKvZQU1FZC64M2ZSrv3MmOSc0WZI2HQq4/h/EGQ0qSbwM2XbYP5QH5kBt2RP2fjjXu9XFMPi5Vakg41TaVVSciDCLVNtVsuCzvHHmQ6QhORSlmdCdVYyZtAm0q2CMVhYv2uWb0NAhLJv1J3OOgkrCaYkbY6Fzpvx2ZktKJJvfB+PLJ3cIsS6qaTv86oU/+sz76yu8LdyDTFcgSkjT1BCWpJ9kUIAFitfPjzZx1ntreEM1NV26ARL265DeHvUtgcUiLKRCJ9UEnwJ19xK8GPpyaU9uGjxA+zWIOhpZ5cNzOCljH1lZVwyaQbA+rl9TM+8QwpQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(39850400004)(346002)(83380400001)(6486002)(5660300002)(2906002)(8936002)(15650500001)(1076003)(66946007)(66476007)(6666004)(66556008)(4744005)(86362001)(6916009)(26005)(16526019)(52116002)(7696005)(36756003)(4326008)(316002)(2616005)(956004)(44832011)(186003)(478600001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 vLWpdg1CXD723wnJjB3fcKqel9ASRzsctVbQ6guwR757l1xKPhB8x6HmWYcGMmEPWSGnWuCfpQ8LlY6Rst9A3ShR7FrK0+vF3DC7I6ArfLomTXXCies1usoVkHHvyUS+gsz5kwOZQSeALDetNMsDjv7C5UhrQDCKZJ4QljwiBpIdt9n2Gj2p9urdz4RltPDX5BymMcKPByzZdm2dUV+DEsewWOVxWKBpLiqhvFas2QxsyCwpyCFJy23uylImA+azG+neLxr06qAso3ohz5pCGavec67W444m0roFGF0LEh0O1bQl8lmSQXZoxmTPngr8iKs5mHn/rX3dxOOS0Xy9RFy1rEAKr+GWbUsm7GYweUSRzm4wX6RTFSUhgzuuhKsjXWdLtstGfvRdFwRWLj0BDVSgs6rlQeef97rpxp7wUtDT42nJjGquYpkBqL3uXO8nbwjK+xfkNLSCoXi2BXDT7d3C1U8GnMIZUDVgR7qGNEDXXBfAqvUywGh6dKBEzIFNzYmL8HN6RhBbdURToeJ4jzSTXDrmBkUpdYfpDQJPHpEybDbJvxeQ5kOBcXGB4rRt1R9vL8TyOU2gy6LSu4/8AeybY6k2P35A3UU6O3KvZZvD8xZle5pb3HIf8SfbOzTPGgBgrpkEnw4MyCfSSh+Ouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e4b56bfb-1984-43ed-88e3-08d8608424d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Be2Xwj47YrJ+Ar/Vdg89g6mavS3II9BIsU8nvx9pdmKIa5KKGCgMkDn6LuzVg9XhGm0rjeRq+MX/CsswWFdmw0W0IPdtiv+eQbWl2RC5RIo8a37Y/25CDQ8wTg7OB7VDB+uDOHLRl+V1X8pWnRWzQFqnj6/IKt4b3drPhCCLsEtRXnMNl9H6smt2AMGDGk3hhUWM2pVRS7fmRbPuQQ8kZAkrv3cqKnZoaicXU7PBgpypu/D7NX6XbDgAujPiNNbDxoDNx0JU+iW4GPDLzELHneBbVJ5D25jay03sJDIenQLmF3qBgsucO1HK2fOEO7h7jcGfzo4xN4n424/MsgkD/49e7jxRr1MDwo58J1/cJlWmc47xCjNBinApu/JueCRQuhPWTBtL5Wl953KRfqAQmQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(8936002)(82740400003)(1076003)(44832011)(2906002)(6916009)(6666004)(70206006)(70586007)(6486002)(7696005)(15650500001)(2616005)(4744005)(5660300002)(478600001)(956004)(356005)(82310400003)(81166007)(316002)(336012)(86362001)(16526019)(47076004)(26005)(186003)(36756003)(83380400001)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 12:20:02.4726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3960d820-5158-433b-f413-08d8608429b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5411
Content-Type: text/plain

android-5.4-stable branch has been deprecated.
Update to new branch.

Change-Id: I6912005380e89cf62baf0f49404367a1492a45e3
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
index 908873d..99b9b9f 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
@@ -5,7 +5,7 @@
 require linux-arm64-ack.inc
 
 SRC_URI = " \
-    git://android.googlesource.com/kernel/common.git;protocol=https;branch=android-5.4-stable \
+    git://android.googlesource.com/kernel/common.git;protocol=https;branch=android11-5.4-lts \
     "
 
 # ASB-2020-06-05_5.4-stable tag commit
-- 
2.17.1

