Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.74])
 by mx.groups.io with SMTP id smtpd.web08.50311.1624294954041534730
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 10:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=W2sTaCm2;
 spf=pass (domain: arm.com, ip: 40.107.22.74, mailfrom: anastasios.kavoukis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwWY1BnhL6xpVso1A5GBjSCBhGtxrHARzkSL2JMSxzs=;
 b=W2sTaCm2H9phwQIgoiFcGfA7iQYzfwcwkKYMRehy7OH0JpLY1Bqf+Ugs92DfErRb3ezjIZW80kyS3J7d5vNQUDO73b9DO14jmaOy13a0hKiw66fA32gP0UqTjL88fLoyBT/uPEhyH2EZtrGybeUx3LFHSptLOQD/s08NNiD/qw4=
Received: from DB6PR1001CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::14)
 by PR3PR08MB5724.eurprd08.prod.outlook.com (2603:10a6:102:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 17:02:31 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::c8) by DB6PR1001CA0004.outlook.office365.com
 (2603:10a6:4:b7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 17:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 17:02:31 +0000
Received: ("Tessian outbound 92494750bf3c:v96"); Mon, 21 Jun 2021 17:02:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4008b0636ab84c85
X-CR-MTA-TID: 64aa7808
Received: from b9a0e8046591.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38B4EB02-10DA-4D8E-9102-E1F7316ED909.1;
	Mon, 21 Jun 2021 17:02:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9a0e8046591.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Jun 2021 17:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTgvkyASaqa9dXJa+sS9tDLaoV4S5hY0JvwZFh8LqPhh5ip7XHYhNmymx9TQf07CmRvFUAso5nUbdXTl92qNMVsKLXKtiTVwmNOCvLsIo07ctmXS1PElRWvq2S+4PXVdEW0nBClDLladjW04MCV7gDa3m9tUHLvOQe6V7sf3W8JTHLemcvw/5zy5k9jeispueI2gMOvWttjRMTSNc8wMq27aJTO5bXOvTrOMeQO7+pRvnHbB+V4iH/sqPVgO8EqTArGwl7JmYeL3hZ5hBEn5kOPv2TUWd8UhkPjgIt6EblD275fKQeESPCOCkk+oD3LGDSw743Adrc685zc9Ov4GlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwWY1BnhL6xpVso1A5GBjSCBhGtxrHARzkSL2JMSxzs=;
 b=nyfkCQxFJBWOxNUIVPvtgctxycYduHYbGAT5TX+/CO4HNTu4oREh53y/m0Dugxe2sRHwGRwHjX47SGWi9V1sneWGHcE8KprFZv9wALLPC7usBfQ6qIn3wwiGb74N8k3+lN9AuemK44YVlJDIbzVbYiK8WiJWwDs2dqgTxv+jwp3/k8oQi815EnKN8b9dJ03ZX16KC64VfclmEvlj02QefuwurWHtO/QQO9ronbqIFukwA0ZKeqEIdZIr7VPG7jcZJtWz1o9O6/fCs9SMjQJtfd1Qh6hIJ2Eg9U2eDv/2Ei07CwjIK3BUTkuWqYaXGzaJ4W7YLyfr1kaNwjFycXMfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwWY1BnhL6xpVso1A5GBjSCBhGtxrHARzkSL2JMSxzs=;
 b=W2sTaCm2H9phwQIgoiFcGfA7iQYzfwcwkKYMRehy7OH0JpLY1Bqf+Ugs92DfErRb3ezjIZW80kyS3J7d5vNQUDO73b9DO14jmaOy13a0hKiw66fA32gP0UqTjL88fLoyBT/uPEhyH2EZtrGybeUx3LFHSptLOQD/s08NNiD/qw4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) by
 DB8PR08MB4027.eurprd08.prod.outlook.com (2603:10a6:10:a7::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Mon, 21 Jun 2021 17:02:23 +0000
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::dc93:4d2a:adae:f0a]) by DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::dc93:4d2a:adae:f0a%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 17:02:23 +0000
From: anastasios.kavoukis@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] CI: enable debug-tweaks IMAGE_FEATURE
Date: Mon, 21 Jun 2021 18:02:14 +0100
Message-Id: <20210621170214.31675-1-anastasios.kavoukis@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.13]
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To DB7PR08MB3082.eurprd08.prod.outlook.com
 (2603:10a6:5:1d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e124468.arm.com (217.140.106.13) by LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 17:02:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 337a409b-ec55-4b41-498a-08d934d65ba5
X-MS-TrafficTypeDiagnostic: DB8PR08MB4027:|PR3PR08MB5724:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB57249D661A31A88AFC8EFDA6FC0A9@PR3PR08MB5724.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hEf4fMrNaFVv4J5H4WWBuKortuu19Ut4DCpmTHrf1epN8eLYg9yaunhpNLtRLCK0xKlKtM8++sN6s2Kk5YLtfTsfimUiVqQB2cO9jC2XTuu3sQqurM7Y27Q3J9vbkSgUvwFR0r2CbJB3MDQPqdlVrcTgYAqznLHn+tpYaEh+6TwFTEMa9oZTIr6txPyIFkxln8EUZP8yAnCgNUZzwv6GYjlzpCR6mfWuyd/FIZPTgIdJEBrYhrp+wghv2lBeXKVpWN5H4EcJmO7aX6YIoL0AXpJKegQnWH6mCFAsqTC468xcr/3WaVNRQCmoYTUMsZQCtNzAhA3eQGAqwLCOu5cEGpyrRu37moPhWMFpcpIDPqFlR5n2aSY8jdQHdSDUzueRwW8dpG00p4BpdLltriFq5sxlf5E8A5GDFAWYTirYioYwXe7BleuU6eSwAAm/9h8StaQ0I6lMcJ/9e4BqQDxy2xUNunExDJwtjRhN8u9PunshXgJG2JcCTaYNyeIlMCIUBJ4L1E7E/anpOvF043r1/HC4yNowJWaeNj5Q8fsUEryKTRX40SeUs00H8rgZrqirZyEn8wZ791k42GJ7fCcP/f6f08Awuh5b6aEVU6Gdb1a3ehvMv/N/ZtdiOVr6anvSk1SQc5TI29rIXVlm2b8c7Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3082.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39840400004)(186003)(16526019)(26005)(6916009)(83380400001)(1076003)(4744005)(52116002)(6666004)(4326008)(7696005)(38100700002)(38350700002)(8676002)(2616005)(36756003)(86362001)(44832011)(478600001)(66476007)(66556008)(8936002)(2906002)(6486002)(316002)(5660300002)(956004)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?+McWTXZQuA1KhNqL74owxZUQsMUIHEpVlUGeF+cdUdNzCDOvrJ+Uy+zOHEj6?=
 =?us-ascii?Q?DeujpohZBQ0dCkTXbY2PM2dKWsGcOKru5/FavE0TYfKLyr5IYkFpxBLqH95D?=
 =?us-ascii?Q?4tkIKNgTKNXqq8mcz+njOwrSQ+TEKn6q3owl9MFkkEeawvvVS+AQFdyfBzf9?=
 =?us-ascii?Q?UY5KJ4S5KJ8h1dzaIqmXe+++jieeKRpPzyhPVP3F84CjRWJyCkPtk/WCCtMg?=
 =?us-ascii?Q?za835PA3bxdFPHxAIKDUxO6caH5Tz5p5p5+TWCQq9yc1iOXlMmXywdyqrWvn?=
 =?us-ascii?Q?9PnFL5alnHGWCh0L4LcTWFj58//J+/vdeOfnC36tgfDyfbwKlV5lAbjIKpdO?=
 =?us-ascii?Q?I1UitxumffxBK5y69I/XhD2AFH7jAR9x3N21edbhFq3AwBV08vZNIVw5kNSe?=
 =?us-ascii?Q?ZTG1a2w7gLxdAEWElKUzGgsnuVFUO+Giqg5GNRhWL0Ve7RUMSbF9d9Tg9B8v?=
 =?us-ascii?Q?BCmkcFRN0fWtakLzDQTSZOnFsW5baSwC1o4yYcFmVLWGv5Lm83667D3EhvFJ?=
 =?us-ascii?Q?/A5ztCvsR7RcwGMX/3EUMyGCCrV2z05PH2E/XFkVhJeVSkuYIhlXy57Nl/t7?=
 =?us-ascii?Q?5WugTP3NyRnYQ0JNDj6hFFvfbmSKZXSdSzVv/PlxxDFSbfLimRZYtPLmOsTl?=
 =?us-ascii?Q?CagFFLgRhr8SRUdukEnh3cVpd48UEDG4PRLM+zPGqJvLa8l8+WpAflcxMqZJ?=
 =?us-ascii?Q?k14mlBvYFWYGKDOlBe/BoZYw1kSVdPiaP27KKbwnnhFUSFYtxiSea27psP7Z?=
 =?us-ascii?Q?kGG33pP80Y0a3QBSxTuY2fq9NbUrzDB/kmKSQKPxgB60aa4B0Dh9lqA87xXC?=
 =?us-ascii?Q?hQrMrA2cvQJjTQ3zpLqabv03ITjBSo/AFfhoVYzvQBy4z2czDLoBsJ8s4+oZ?=
 =?us-ascii?Q?Lcu7CQgt+EazWUbVB7DD60rOJs3r8QOGgebOjpzTotLkTtXdjcuSEgItt1Qj?=
 =?us-ascii?Q?R/Pw34lUVEHiw/viqn+dJonhpMLpS8Bqc7/oxmetVcjfhDW89iTctMRve6LN?=
 =?us-ascii?Q?BfJ8tUoUpcw3VHG47tBE5oIIXzhOTJpKfc6FQrUyZWN8CFGleb8mVXzM2TlA?=
 =?us-ascii?Q?dwiAtKr/jTCIRua5ZYsSzKQKNeTVFQe95o/HTzKJM3BBVsq71JaYqnrIO6Cl?=
 =?us-ascii?Q?JYrEdgotj72GgTPhZyCEcgwxs34m8UOANV9FI7UjywzHmlaUqz0AzGKfb1x9?=
 =?us-ascii?Q?ZqoBnOLqUqi7tq6xQ5UO4NFsKvuy7Ocj26zoGCMjZ3p6+bP2fSyS9jkXwgFE?=
 =?us-ascii?Q?lWVzGgNNjn8VC7z10SG3fbFuDxJpbTthnAs8pclZLdq5TmeFwosvU/kA95gs?=
 =?us-ascii?Q?sc1PumDzou9ftpV1IaHHS2gX?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4027
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anastasios.Kavoukis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	afce018d-b54a-4862-4590-08d934d656df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vK1xyKITLVg/A7aN6usPCr+P4UOR1iq1l5vv/x158ifxTsf57BPpjWG4WIlf4Y/tgdpctw/YR6MQEwjSe0ImbuUE2xCl+DtZHkjGNRB14f6QdRdUdHYkLrLCECzDS094uO29Rz2cHyPCteVlDBVIz1FTPsjC1xo72JTSE6eYAkME4mPF+7j04f7vQgOBCZj5JbKR37DTg7/nykVfPrfSdYyK/Hkyo542cHiagN79KeaEkt8heyzOq++7yQuwkY6wWuo68yyA0a5WKBV2hOaUfL84INEk05X6pUKOpjllwZlgdn7AqCgQ4p/jx+DL6mRI/uNRX69NY9JQG9lKU3GErfdjQij+cmSYV7ojItOjhPfv9l8myhU/FR4kuKBWueSSay5NH14ss/LTuJEJCkMg9yJw2Wb3FqBv4fKB7d1pvrHH2xGc6MPyUYDit1E6A4DRUfo6ftr6czXcHWe+4feBWY67Ig9OgFibjAMDO+EYxF53v5Y6Cw591gHK/BZRAWH4g95aPEbNWqgsR8ZDPgPv99uCmJJbSm45rS5zBfYbAjN4H37mhOnmZZgOk3HECi9amW/Se5egA0nnHvozFXJ81u1eqmnWhDLNPS8KDr1ZP1ni9SlHQgvBICU10zGL+ticMHcYQQSka7lxZouR76xJbw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39840400004)(36840700001)(46966006)(70586007)(83380400001)(70206006)(6666004)(1076003)(4744005)(5660300002)(81166007)(44832011)(2906002)(7696005)(4326008)(2616005)(956004)(8936002)(8676002)(82310400003)(36756003)(26005)(6916009)(16526019)(186003)(47076005)(356005)(86362001)(336012)(316002)(36860700001)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 17:02:31.4770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 337a409b-ec55-4b41-498a-08d934d65ba5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5724
Content-Type: text/plain

This makes the images suitable for development and test,
debug-tweaks includes settings like empty root password.

All CI image builds inheriting from base.yml will
have this include this setting.

Signed-off-by: Anastasios Kavoukis <anastasios.kavoukis@arm.com>
---
 ci/base.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ci/base.yml b/ci/base.yml
index 0ae2436..2113dc4 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -30,6 +30,7 @@ local_conf_header:
     PACKAGE_CLASSES = "package_ipk"
     LICENSE_FLAGS_WHITELIST += "armcompiler"
     PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
+    EXTRA_IMAGE_FEATURES_append = " debug-tweaks"
     BB_NUMBER_THREADS = "16"
     PARALLEL_MAKE = "-j16"
     INHERIT += "rm_work"
-- 
2.17.1

