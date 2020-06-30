Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.61])
 by mx.groups.io with SMTP id smtpd.web12.21394.1593610049829381991
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IlLAbowe;
 spf=pass (domain: arm.com, ip: 40.107.2.61, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XoH7nAeJF1I7tYdAadzSnMumkwJ9eHpvaV9OgB3T1s=;
 b=IlLAbowexRnZmmkdcVQHtOTBLm4LKLBH4bhRO+KKM2bK6B2cdNn8vC05VwukHkhlwmlRHl0SGAAg3HdThxxpQO3qc9An9T2RtSIFodoSvEO3zCmSL99iWz4dDJQ1eVxqhGZann6ijkQHLQPnD5iccpBpV86ojQaRfFSZbaudp7s=
Received: from DB6PR07CA0196.eurprd07.prod.outlook.com (2603:10a6:6:42::26) by
 DB8PR08MB5291.eurprd08.prod.outlook.com (2603:10a6:10:ad::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Wed, 1 Jul 2020 13:27:25 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::92) by DB6PR07CA0196.outlook.office365.com
 (2603:10a6:6:42::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.8 via Frontend
 Transport; Wed, 1 Jul 2020 13:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 13:27:25 +0000
Received: ("Tessian outbound 8239f48e56bd:v62"); Wed, 01 Jul 2020 13:27:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 497295c904986a97
X-CR-MTA-TID: 64aa7808
Received: from ad3bdd210ffd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1E8D7717-8FEF-46BE-993F-5AC751E822AB.1;
	Wed, 01 Jul 2020 13:27:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad3bdd210ffd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=batfoQWBkrDWJqF6IlwW31pUacnZejZflpImSwdozawJWKQgCanBIoM3l2+MW3BFUrilpvGTZzMUXWs961mmB803pw28SnCegMVwU9rxxdMiQyxvRvnIInVzHRLmSYZpMjO4rkfDVLJF8xxpi+v/vK5KTsLOVY7sArgM82qdNZKjN2lnD9DIj0WM7wyyYm6SBegGeEAim5HWXOvNv7H5+C75d77Cc5KjWJznwdtbjcBu9UJhj92Rlf7Lkte0DbP09/n0nv/dvsxL3V8gXHkjqBwEu8mMplN6RTwtv1MPVOksdI3CFreZ0ADqzHP1hFxj58zP+KqFAdEBdvXL44fvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XoH7nAeJF1I7tYdAadzSnMumkwJ9eHpvaV9OgB3T1s=;
 b=Q3OqsA0XhICgs407SVo1Ssuk1eazj3omUVE0Rj7ziD42UUzY6cwMbragDU6rgSg/uuI7m3F7GErpViCVgMZdbukjYbc/2v8qTWXpBMXpgT2pT2zquU9oyhzb8LNtyqaDRl/0x+f/xcYlToYuP6qPHZok5PadXLT52AkjhfehVg5chiChyHz92x/MtU29bJZyWQ+1K1I/eSY3uOpUyX7U7N/1743fPh4PQQXpw8k0I8+QyDwzINwY4MFm+sX0d9FtD+2zihg3aT3cmwRZGZMltfw+po4Sm6zowIqejaZmk5JtJQgp5E671vIcHXzD5hihTva713Z1/9iJMBEKs9ZdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XoH7nAeJF1I7tYdAadzSnMumkwJ9eHpvaV9OgB3T1s=;
 b=IlLAbowexRnZmmkdcVQHtOTBLm4LKLBH4bhRO+KKM2bK6B2cdNn8vC05VwukHkhlwmlRHl0SGAAg3HdThxxpQO3qc9An9T2RtSIFodoSvEO3zCmSL99iWz4dDJQ1eVxqhGZann6ijkQHLQPnD5iccpBpV86ojQaRfFSZbaudp7s=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB4082.eurprd08.prod.outlook.com (2603:10a6:208:12e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Wed, 1 Jul
 2020 13:27:18 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 13:27:18 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] gem5: add dunfell support
Date: Tue, 30 Jun 2020 15:19:31 -0400
Message-Id: <20200630191932.31241-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::23) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by DM6PR17CA0010.namprd17.prod.outlook.com (2603:10b6:5:1b3::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Wed, 1 Jul 2020 13:27:16 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 30 Jun 2020 15:19:32 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc632d8f-3b7b-42c0-99a3-08d81dc27e95
X-MS-TrafficTypeDiagnostic: AM0PR08MB4082:|DB8PR08MB5291:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB52913D72AD3EDB416EA4F7CDF06C0@DB8PR08MB5291.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;OLM:3513;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 j3ta1CDoAIBj3KrxyK9AgXGsJhJ2Q3fBS+My/TLsVQrMMQeueqINXZ2Ngeb3JJvsgIL6PLkHN+VLUayIHvvF0u6DfY+AgzmGrzoVUKBn4grqFpBIMGcDQbOkdTvxzLSshSrHIgE43fK6MfffUqP5qJCQCGMOKWFBCObAcnrzoCF4ECe3ZBWnq3v8oUPEboSmMGg/w2YfhTYWNxNGvsXI981XWrtspqr+kY5J9eNlz93P7FI4ktOF+Dk2kdFHP1pmCrU+jjtPvjWTipS4lyCC+Sdj3xzWfLfVQYB+Nu9B1akj9MeXPJ0vqDoyBESZwOuXDLlcpzggC9o6vCAQnOUTVg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(52116002)(66476007)(8676002)(66556008)(2616005)(26005)(186003)(66946007)(44832011)(4744005)(6916009)(86362001)(478600001)(5660300002)(4326008)(2906002)(42186006)(83380400001)(8936002)(316002)(36756003)(1076003)(426003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Xf5eO+D8zHS9c/6btmxxzbHl8ABI2dguwerhIl+IrFP8IX2Vq90V0j3oXryOoZ5BGUCrzrPUdTTGcOHNdb71BxpqHbAqiYXD6vhlwKqvZkLPuHSt8GzljclQf8WiVlDDZ9/1rSGjryKN4yXsy/3mDLenDeKqHfqWzTaYxTd4kJsC/pQoSodjpap6hDUqWiGhGs4QIzCNnEAGne4ja7WPhg4KSkH12TuE3AYdwYFHVgqCGHdX8wbrkPGdi0w0mrMQGDYxtKn1matRZTwsx+GKL+UNvdicEpBod7FSql5BV6MKzvVF6UzTN0D4ZRCkpjl9i7kTD4qGuYC4BeYoKtzHi/CGRhS/YzHnW3X8dSi7eVTA9QaSHPXs+QRcxQNUDnK7pogc9wCcYfXSgZi7Q3XSDk3Iv/ps62Sm9bZ3Oo2B8QT/O9iKOGha1YfWKdQSLOEDfV7P9ikv0UNREFZMVavFHk2kGqT3g5vvRyqNrm5tbX8=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966005)(47076004)(356005)(82740400003)(8936002)(2906002)(8676002)(5660300002)(1076003)(36756003)(4744005)(4326008)(81166007)(42186006)(316002)(2616005)(44832011)(26005)(70586007)(70206006)(336012)(83380400001)(6916009)(82310400002)(86362001)(186003)(478600001)(426003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	322590aa-926b-4634-881d-08d81dc27998
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yzhULoaCFRPeeboV9TggPiCJTvkBgqkOvTefErxlMQfixfnaIo2oWHzqAsKvS6IDiALFqsTlQFxdshaO3789Rwh9G7tNRqO5saGjgJX8x6wruZk0JpMzcrE7Fpb4+C2W1Q33PD3ETCCWnFiu7tBg4cjXCgARfLXv2bM+qonKDtzMyG/SNwfgSAsdM9auJCc5n9Bv3LDT/+Pkq9upp8R9g3R0YtAU4zHqXVd1Af4ZMURkf+qrasroZjbrRCXDHgVdHz24vAZU0uA7+tNNhm3FtG8RG0a+AJKs5JQnJXsLLSEe/s1MgXcFHx7lyTG6rTmNaU6r0jn3O+SfHz4ml4eBijTfHlEyLaABSMsfhyPzmDyf6IvkL6DwzOt++14eoYUqHRT2DaC08bCSluN8EiX8+g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:27:25.7449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc632d8f-3b7b-42c0-99a3-08d81dc27e95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5291
Content-Type: text/plain

Add dunfell support to meta-gem5.  This allows for the master to work
with stable dunfell branches.

Change-Id: Ie43bd7ca0a145fd30d92d0c241431dfc0a307dd5
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index 58242c3..439444c 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "6"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer"
-LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
+LAYERSERIES_COMPAT_meta-gem5 = "dunfell gatesgarth"
-- 
2.17.1

