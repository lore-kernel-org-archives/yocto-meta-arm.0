Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.60])
 by mx.groups.io with SMTP id smtpd.web12.11948.1599133251397438641
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=B2TNGhKu;
 spf=pass (domain: arm.com, ip: 40.107.22.60, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AYbeAQFB3ETpEiR+FOnuVxnvrfb2xTaKKhrCEGRu/0=;
 b=B2TNGhKuq6BNZStUahYPZGBxi0/gyXry9cjfzgI4G1mMvWZJ0j5i6JK4xnkplPihbwXcFCaNoXbEl2zMMHCEeNtGiUpmRe4Cbl5N6XpBBSf0o3uNa2o8wlF3n1e40sCPHF+jBe2NJ7mYHDf2AFSGMQPnTawoNMFmTGNHrEUDo+0=
Received: from AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16)
 by AM0PR08MB4932.eurprd08.prod.outlook.com (2603:10a6:208:162::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 3 Sep
 2020 11:40:48 +0000
Received: from VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::6c) by AM6P191CA0075.outlook.office365.com
 (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Thu, 3 Sep 2020 11:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT042.mail.protection.outlook.com (10.152.19.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:40:46 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Thu, 03 Sep 2020 11:40:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32af4717f41281ec
X-CR-MTA-TID: 64aa7808
Received: from 6d58ddc491c5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 022443DD-8EFF-4277-9092-94A81FD20D14.1;
	Thu, 03 Sep 2020 11:40:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d58ddc491c5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTPlqOFKJMGKuK0f9qDpf/1kHFAPJ3h3Z3pcKvLM+1S1RFEx8XguQqBLwH/RMzbWh42DgcIKnZpOrP8n6nKKpssisAaInix9RMDXz/pUKmYeR/Pdol9TDDDoYedBM0fwHVj8kahmtk4zSot+J6XoeFAymKjKXrxHtPlGfAHUSrRhSmbQZijb40KMj+af+kQGaEa/RPWzT61eqWik0AYsmSY3F9IlLl1LC/+yeeIGMJmCRHXm7F0RwlYMuZcTBBdrndTJebabFBvkk7cJRmoMaUGMvxy7uRl2DsnX6I/0Sh28FGPHyn8ly7ZH6SSUAnidXtEHk8Snfk746G/OGE2qpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AYbeAQFB3ETpEiR+FOnuVxnvrfb2xTaKKhrCEGRu/0=;
 b=mnzMkhQk4ywCLaiNI2zmpXn4BezLVE/iDfG6YSEyarbjfuHEiDTSDguE3Gy6Vvjl2WKBNGOfhzPO6R+6xHcjLn7VNAgUEAjYskmrH5WxRF/gaRo02I5T3UAAWLj+axlcLVFvF7IbPLniUqwdOSeWWkqfjtSFCaxsBANHxZiFendFpDBUm5ROnK29Tem9htVnmEfndSdfH8VE9Siwow2MHldma5tI982TZklZYojSkg0seEDUzJJYqtuqCEJJICKcqSLK1bYUATTh6ZeLmtwU5XBjn2hJiNPjK0tyKKdrqk/aenmIrzknF1pKJt+4NCqA31XTe8JF6hpoboacbmiDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AYbeAQFB3ETpEiR+FOnuVxnvrfb2xTaKKhrCEGRu/0=;
 b=B2TNGhKuq6BNZStUahYPZGBxi0/gyXry9cjfzgI4G1mMvWZJ0j5i6JK4xnkplPihbwXcFCaNoXbEl2zMMHCEeNtGiUpmRe4Cbl5N6XpBBSf0o3uNa2o8wlF3n1e40sCPHF+jBe2NJ7mYHDf2AFSGMQPnTawoNMFmTGNHrEUDo+0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3688.eurprd08.prod.outlook.com (2603:10a6:20b:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 11:40:38 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:38 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/9] arm-autonomy: Introduce arm-autonomy-host DISTRO_FEATURES_NATIVE
Date: Thu,  3 Sep 2020 12:40:27 +0100
Message-Id: <3d83f526a4fe30c8cf006f128a181ac502bc22dc.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26ac7b7f-de9c-404b-a911-08d84ffe32bf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3688:|AM0PR08MB4932:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4932BDDC2E8EA123BDF00892922C0@AM0PR08MB4932.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 B7X/FhXaCA+NycHID0Pe7yWaFCeWAypPqnT7gmzcimdh5oQlSrnvU0I75d6jcaXwMlgqdDdLQCC0w+OndaaHYh9C+PPP+/jwQVdLy3fxX4WheB3QvozTZ3SNIhQKoiC+K4hoKiqFQj56FGTEhx1TZCtzFz6t8QVddrSxotVvVXHs6FJLYEmb7kOtBu/FZw6etGjZSdShf2GWzlbu+yiJL8bTN6Kb5287OtaEzfzDSLNcWcjp4kPqXUePmqFcnU8gAUr64p2hBHhrSJVaD+Ii01dvsC5VIjZfbsIlvRX9ri2qltTaW1JsmerDgwM6Zis/yXa1k/nXwf+PqQSII5nzig==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52116002)(8936002)(44832011)(6666004)(86362001)(8676002)(478600001)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(6486002)(5660300002)(186003)(83380400001)(26005)(16576012)(6916009)(956004)(316002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Z1Le+RsBuC3juIG9x2ERdl4L6215mQSth6JQdjzqtFCQ1NhhHbyN2kNAkWFuL8j6plLM1bqmHI9hgQpR+1p76JX4XSXtvXB7a/rNGOE2B9OCxy01OIJE4Jymyk8x8XpIESbemERtYJq7FSIiLORceXlH+E6Hv7a9oSZbzH4zUDfo3l7ndlXB8gE30WyAvGIpRLmPMeJbeHLUTvP4kfBOzxViQzF7nCWHF+sswmc3xft+l996nY1wcyyuhoiV/P/qqwYycPCzx3wYhABTReKeDbQh5JzchbeNj6YiZ1t3cbU0tct32I6qS40U3ebZ1xbavU539fKEGpEF45DhXskWE+hg/NQ3p61s2BKbYWvG9ycl+qcIaLrUYuP3y1vmtQRN8QlrrcWVFDlurk09r6yzPVJ1GcSYC2SFRHi3Vr7ycU2eHBI/CLv5urAaazkpM7g6m2LdrNxYUpkxl3mxAG6z6x9IdLTEjmxjDrc02hO++hOdXwq27jF0LVD187rZEV0SGpaLfoFozwqOKxdVwSlWZEMetMeLERv8wSwvJ4iKRImQi1RE9Z8Ww+a9p9TbqL9nUv1BYHTtXGQd39pnI3KHMLoe548SpcEv4zn01Ggi4JXMsLbWj0+zCLnFNXGgTymHkI8NPSU1oqtlGEB1HdOWDg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3688
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	37dfe8d9-258e-4f06-2b4c-08d84ffe2bdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cFkAwP6wTdHuZrnovk+wyML7fGgseTOEnCRnXLgXCtWBpUguJ9X3s3lWU+zbb9jkKigGvd+iqQBh8FhOYPyfaY836FvhlMUQMOLEkle9xTdPkIfe4RKrLBLxevQOehqfJKiFtT0wnwMy87T1uIJJmqtcdGnJJm5M7dl2VTyA6BSeOjlOwJBeClD+uQVRSK91BStgMP/fMV9e/pUkEPdVMygoN29prWz+Zt44QwhWGia8uXnmKJsYY3ZK4RTG7KMCXn4Fo1yNY7jq95jcD7WYDo/c5DlxMZPVv0WZhCdCZJqxHMQl2PZs1JuxP1RUrJhfpFNT6ReuMfzIEBTD05Uk4K65OwxG5jG52y1Av/kJzOfukSqSQrs4xJOFEKAgUVTHHth1vBjo6HujRCD5YaVOjQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(356005)(83380400001)(16576012)(2906002)(2616005)(478600001)(186003)(6916009)(8676002)(86362001)(26005)(956004)(6486002)(82740400003)(316002)(5660300002)(44832011)(336012)(47076004)(6666004)(36756003)(82310400003)(70206006)(70586007)(8936002)(81166007)(4326008)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:40:46.3064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ac7b7f-de9c-404b-a911-08d84ffe32bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4932
Content-Type: text/plain

Some native recipes might want to apply specific settings when the
arm-autonomy-host or xen DISTRO_FEATURES is enable for the target build.
In this case the arm-autonomy-host needs to be also added to
DISTRO_FEATURES_NATIVE.

Change-Id: I11a8c4bbb99333d62520afc2c12a183cf08d6e1a
Issue-Id: SCM-899
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
index bd98ae2..8b27f92 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -2,6 +2,7 @@
 
 # We need to have xen and ipv4 activated
 DISTRO_FEATURES_append = " xen ipv4"
+DISTRO_FEATURES_NATIVE_append = " arm-autonomy-host"
 
 # Don't include kernels in standard images when building arm-autonomy-host
 # If the kernel image is needed in the rootfs the following should be set from
-- 
2.7.4

