Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web12.37934.1602499468189021615
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 03:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Nx6WYyBZ;
 spf=pass (domain: arm.com, ip: 40.107.21.83, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfEGsEiXIi+hMcnBAo07vC1QiPXSkmx4jn3XXXIcIts=;
 b=Nx6WYyBZ16kXEDlkMXljBooY6Hq7QbtNMtXIKEHhCxuuSzirsA/ZN2PGVBez3DxF4H5Cgz0qVvYFYxsm14rPQYyOrCOFDeWVRBqh79Kx363glCkV8UWTEnygWm0+FhzNvYhlggG+HKfqge8XyQ/FIBvFM+uVXdcMmXkhNhpJ7+M=
Received: from AM6P191CA0090.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::31)
 by VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Mon, 12 Oct
 2020 10:44:25 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::ba) by AM6P191CA0090.outlook.office365.com
 (2603:10a6:209:8a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21 via Frontend
 Transport; Mon, 12 Oct 2020 10:44:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Mon, 12 Oct 2020 10:44:24 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Mon, 12 Oct 2020 10:44:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eeed7cedbae68b7a
X-CR-MTA-TID: 64aa7808
Received: from 693a4bd58626.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE5B008D-0E56-460D-BF6E-94F9A5E90239.1;
	Mon, 12 Oct 2020 10:44:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 693a4bd58626.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Oct 2020 10:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKUDsI0e4PSsIGA5gs8YGYIEAWAxG0v/VY2/TnY6oIZDB+WSk5jYiYszTxkmUv13EXZwdzpxGnOQROTOwkhkZR6gElxF/TgOJnKW4h+U8SWJszqbZU0SrdnP5QywByEJ4+8wr7NYz8VpYa1wSWkPk46QnqzE9nxf9qdR5mzYFThr/EAjXshAF0RNO4UTkK6k5WPYMpFkeDzPIac4vHnvHJXp8tc1pShxbh0P1CMxPpd+7+HMOZErGK6rtAWRuF2HaDulEsNKMvMh2sXNzmIcpFUXnGCU9ohb02YzfKRbBt39ETZ6yX/i5J13sma9TZMyuvI2gFg73ZL7SMYVE9ox5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfEGsEiXIi+hMcnBAo07vC1QiPXSkmx4jn3XXXIcIts=;
 b=cBlN5QnykVzmiwcfu+F0Z6xw3tMm69mxS4q7AuSOLqsI7wVmYtDQVmv5wKWunH+zNn+69KgF1gnElDQzz3hqZ4FsWVA3VRkMtOm4eJgCotqoYDG5FgJT5Y5XoswwKW3xiUaiV+raFTAemh5GIN04Ne6a565axjnVoI2+1B+urM/TqX2mAv8C5rcS6YkyH9ozGOTSsvg/HcwUHEfhs7BSiFPLN5WXgUmuNkgildLhB/Dz//Cc5TfE1HKyLzGLv0Srjyh7UUga7ZC4wYdwsfbB5G3lM0vpNtr0h2iptOnf3VvdZRY2JufKra25sFxbExh0R/0IOEUtg0+RKjmiarIYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfEGsEiXIi+hMcnBAo07vC1QiPXSkmx4jn3XXXIcIts=;
 b=Nx6WYyBZ16kXEDlkMXljBooY6Hq7QbtNMtXIKEHhCxuuSzirsA/ZN2PGVBez3DxF4H5Cgz0qVvYFYxsm14rPQYyOrCOFDeWVRBqh79Kx363glCkV8UWTEnygWm0+FhzNvYhlggG+HKfqge8XyQ/FIBvFM+uVXdcMmXkhNhpJ7+M=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4658.eurprd08.prod.outlook.com (2603:10a6:20b:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Mon, 12 Oct
 2020 10:44:17 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3455.030; Mon, 12 Oct 2020
 10:44:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/2] arm-autonomy: Update Maintainers list
Date: Mon, 12 Oct 2020 11:44:07 +0100
Message-Id: <3074066cd4d0d95765207943feb2c90d05bfff2e.1602499189.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::34) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.49) by LO2P265CA0142.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3455.22 via Frontend Transport; Mon, 12 Oct 2020 10:44:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4122ec9e-1efd-49e2-2be0-08d86e9bc8f5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4658:|VI1PR08MB3998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3998F8726AD68DAE9554D73892070@VI1PR08MB3998.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 i6XDrZpDeiTHrqEzua+/XUQR4B6BT4GYRkDntv2zHToEseF0zfx1P4xWw4lKTaNkzZyy20ZP01imcLG+zVMOa+pMAgrlVt4TMdYjUWWVL0BVo1OnGn2CIkNheow4OhS061OGUkj1y4mub/60pzmKrhIhNDOiOQpy8E8jcd5vIkeQzCC4keve4BRDz/zBxfgmGYOxGB8f2GX+ONuJHMHWp1dBxpjFBaGwnDvuOgsneY57G05vyTUO9tYYPU8EEbDE2KTdnvTY/QQdqMeq/sPG/ZfvjUyd3RJjGcdO7YrIiOAxu1tO0yX82EG5QJeKjSvANiRsYlduSHUuk9lCWUPQPg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(66556008)(186003)(36756003)(2906002)(8936002)(66946007)(956004)(8676002)(6916009)(16526019)(26005)(6486002)(6666004)(4744005)(66476007)(52116002)(7696005)(86362001)(5660300002)(83380400001)(2616005)(478600001)(44832011)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 dZBMbIXSdKWzfC/z2sRLsgGA+3j/+q3w+XFFEmJmpLrzcsUjGf6XUwQMpYmHNrHhGZ6mMcbc2b7+CL8Yhu+FWt0+oiAQNOELNd+eUtdxJkw/0gCngGvR9gnFwoN0jB+WfnWViORWnV9OQxd+GrJAZDWue60Jd857lYuTT5Y5NRWCzLVuvSmboa9RHqQOIPpsmI4Tfol9n4ahwk18mgPPIt1IMi5AHot+K5HHNaTpeHtE5sEb4MuCBBbd8uACB5nqnJVTK6mu/QkiP4NC46+z5bdbIGLvXmeJxrFwhgThNZI7y/8Nusjnh89hHW4NCcUCkYXL/bCbtqRpr7oXayTC/JIhRLQUCcwcu0hjYa78Tz0bsmkCqNDN6BcRnm5KAK5zqo1KjkjUR7Lf9+aDrIxoBiIvH8KGjutMyUBvZdhpcSUa36TricZLILZT7lGvQaXbsk02OsQoxPLbmRaD7UWYumUMy+mx4mH+9SMvY+L3ytRx60sD2Me03++eG4krAT8n4P8DyVrD2ty3FNPTeeMDjQCD46REM1xo3eoB0r+DyKEFYa1rU/f7ipikCH4v1vjcYgzbIuINZHZKC6dZ5LuCbnXtWz7G4Q2qUPRI/2rBHRailobDkN8sd/eCevENuFYydz5lshJTQVxDfRqKmqjrUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4658
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6f972a82-7c8d-42f7-7fb0-08d86e9bc4b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Aeep5BQswdjoZESpLHIkshkTKHD17lRxKkXo5kGuCyP9210hZJW8pAy8W1txOCzUXXmOFhXsCRJdpB8xjgV0KE7pp3G1sk6HfPVw5ayJOj56pRPdM/z/o9rmyI1C5hHGwYSPlyt26PzbN41P1B5xy7MFSaptmq7za0kFTl5DIbC/gc6YcZTA6HQ+qABbQZVWwmsQ2uT6rbyhyvNNpsyHO/STgMooreZgr4Hrh3VzmSh5yA9bNJwoIWulRXO9OSZYYfo5tUTbNGxYxaim7DZG8eE07A5ac5qMVvYzao6Nztr6ynKmTP4dIUH0Ul2SjKHjwLzgIlrWZ/kGHzDEFnuOT6K30YL6MNDdHM34Jhty/cd9OTPeXs9oBro9mqoVRv1gi2oSXfgfIQUUawkLcYAWjg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(26005)(186003)(16526019)(6916009)(5660300002)(44832011)(6486002)(316002)(4326008)(336012)(8676002)(8936002)(956004)(2616005)(7696005)(4744005)(478600001)(70206006)(70586007)(86362001)(81166007)(83380400001)(82310400003)(36756003)(6666004)(356005)(47076004)(2906002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 10:44:24.2332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4122ec9e-1efd-49e2-2be0-08d86e9bc8f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3998
Content-Type: text/plain

Change-Id: If01fcd1aaf971d0e58894661df7fe9f6ab7e5f4a
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index 785f278..f882b7c 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -88,5 +88,5 @@ would like to contribute, please contact the maintainers
 
 Maintainer(s)
 -------------
+* Diego Sueiro <diego.sueiro@arm.com>
 * Bertrand Marquis <bertrand.marquis@arm.com>
-* Filipe Rinaldi <filipe.rinaldi@arm.com>
-- 
2.7.4

