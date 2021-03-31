Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.52])
 by mx.groups.io with SMTP id smtpd.web12.5549.1617191648869284428
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 04:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0cC2Kmzh;
 spf=pass (domain: arm.com, ip: 40.107.8.52, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVaVvySF8cxyQI7vKjkvxRQZLEtguokOriRuV678arw=;
 b=0cC2KmzhYF/7JwHMmfetmZ/YBR19Ymu1fLhT8nsxFvgodtqQocnNE6WPaI4192Zw3L5gAUSUd2gmfGPBduqya6OkwHWYSuL5zYNaYk2xEBlMekBswQBHZFQ5xQ6Ok3nU25kUCBW4EXgonSI+h4Ax4vGgqYLxWA8odrkHNaWr2tQ=
Received: from AM0PR02CA0179.eurprd02.prod.outlook.com (2603:10a6:20b:28e::16)
 by AM5PR0801MB2017.eurprd08.prod.outlook.com (2603:10a6:203:42::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 11:54:05 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28e:cafe::a3) by AM0PR02CA0179.outlook.office365.com
 (2603:10a6:20b:28e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 31 Mar 2021 11:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 31 Mar 2021 11:54:05 +0000
Received: ("Tessian outbound 9681ff6f21f7:v89"); Wed, 31 Mar 2021 11:54:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a429af14ec880ed
X-CR-MTA-TID: 64aa7808
Received: from f73491d59770.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 691CD56C-D031-4A8E-B6D5-B07C8033FDCF.1;
	Wed, 31 Mar 2021 11:53:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f73491d59770.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Mar 2021 11:53:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDDWAA7mqbepl5MG40RIJ4UzY66ngCkQU3z3QmBFAAhdFAmwkxVUTXHOL/08tI6mkN0pUDpqwk75nZtNv+Mb7YQudqmCsY4b9FOcxbYjP0m2elhZihJrxhs38DjFfzU6b7LT9OrLZOoSrIx/BT5AOrbeupjYFNkGDj+MZSYnb0ij4d/F9pgF4/MlzC692XjqyRX8oDZ8BcIyYWBFWN2eRGYEmEzKCFknx08FFFkjRAcC3lIjqcvthS7Xb0/Eq8sfsrgjyPFQ7edmWd/WsihtMQi8knAM9DB0SCnqPzXj9C3dbrPjdMQ0NK7q1QKM9FKg+cRiLeBhz0ZE7jIqRB8VPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVaVvySF8cxyQI7vKjkvxRQZLEtguokOriRuV678arw=;
 b=QSm/9CPBEiEC6ZsHzEn/mZdFiH+dS9DmpRCNOBtxc0diZBRKjHv9bQisLISlxe4MiLqdENBgMsDc787wlBxGpZPe+2Q8UKCOkTPEOYVg6/J8FivmI0fTBX6hVPhkQWQkmYKzMa0gRSlt1ChcNGjIFqrzNPUymrWUr4wOWtmpDgxDjZNpc41wUfcb5y9lGt3J5ocRb5VJ6rnz841XcJWF6Ob/LTVB/K/cg/jUh9nt7RRsdHF+kVLZ2CQkplIUzN8gQ6dUlxPJYzzijaBISgSIMogNn1xjv8sJ09zV48OTnYZsnFepakqPU9qz8KHncqOMdpTbV6oAxrpgWEzk6ctuxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVaVvySF8cxyQI7vKjkvxRQZLEtguokOriRuV678arw=;
 b=0cC2KmzhYF/7JwHMmfetmZ/YBR19Ymu1fLhT8nsxFvgodtqQocnNE6WPaI4192Zw3L5gAUSUd2gmfGPBduqya6OkwHWYSuL5zYNaYk2xEBlMekBswQBHZFQ5xQ6Ok3nU25kUCBW4EXgonSI+h4Ax4vGgqYLxWA8odrkHNaWr2tQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 11:53:54 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 11:53:54 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/6] arm-bsp/arch: Introduce support for armv8-4a arch
Date: Wed, 31 Mar 2021 12:53:42 +0100
Message-Id: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend Transport; Wed, 31 Mar 2021 11:53:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b730d4c1-ebcf-41b9-c1e8-08d8f43baf45
X-MS-TrafficTypeDiagnostic: AS8PR08MB6536:|AM5PR0801MB2017:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB20170B969F6CF09770CEE6B3927C9@AM5PR0801MB2017.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nXTy8WwuFkZ3UVtNfrcr9qbF/5OOwgMq5VFnt46RNRGs9vWenxAwXH1Fy+BjVh59geppUdMrE1mzufqXiUgUyk6e7aXaaK/6ddIPm1p567pKZ5n1stzuljHxrLAD1aInUNNsMdgpiYcwwDhPeVgA4Ka+Y6iVfk5krLy5yuGGkQJqiUvoK0tZsuKdNPIQ7fXMlcLbkM3FyXMciAlYQ9EKbd3jpAPAW51i1KufgZQuDyD31YL2n8GZLngt/YYkkF0QkKMFeyBt4uALpw1RCtl47VBQAeQ65GB5YEd+t8BY0gd5W/YtW7NvwlJEtkiqlMsFQGp5MKhcDnB1USSUpmaYq9toz6IK54BKO2eln3GmlC3wZnLKJPv3zG270HrKbrZoctCLh1YeiqjF5gfeIPbWwRV4t5QYiQzQk8X6fRSmgIedwJiF929W8O6++Olp9yZUCmIXnGgssk3ZJETiHgXYzvTd8XTzHuxSQ5jibq0ZTDlahyfFRlvhI+WgG1cbxNUtS1xu1qOWxzJDH9YlaZ6g8hV4CSZojpUacyu4tmZqLQ0FVCKjzbbscWtdQy50vBil95zFMmkxU9YSXMWeWPKbWE8o9MlLQuvKNV52wlGYidMjB/ckCL4zUT23HBd0nGa4KSP41e2VfvRiEumD3Io+NA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(6486002)(316002)(66946007)(36756003)(186003)(6666004)(86362001)(2906002)(7696005)(5660300002)(66476007)(66556008)(26005)(52116002)(44832011)(16526019)(956004)(2616005)(4326008)(6916009)(478600001)(8936002)(8676002)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?K4b9Z1HRd6At74udCTLrcHAFerC3fEwlAJ7GbdY9lqchTjmSWrzL+EpzgQys?=
 =?us-ascii?Q?4TS8OU6aD1ctJFgKO76441qhi8AqdKZFURilyYBV+AiqluC5xmTSZ1TlVqxp?=
 =?us-ascii?Q?TXfL/MOEha4VX3dkQ+VlLscO3imS2SNFFXSHEPlBY+tdyY+U+gvP6VjllTFg?=
 =?us-ascii?Q?GANewNFFFh7ONBlLAPOaAFXpuapvUMaJosyqL/ZLtd09KsyOelp00nWyzOsj?=
 =?us-ascii?Q?dkBEguDSmKq0r81CjOoMluBxo1dkhSXcp9E0TqtKP/97TJB3Od1p8MDPEzkv?=
 =?us-ascii?Q?LPonvuAlI4d7ZNs9/FtqNcJyKdYawzVa5f37CHxESAat5eejX8PEQoBGR7k3?=
 =?us-ascii?Q?N+tiyrAik3GMMETp4iXmdmSDGRihhYY+LCybfSmLAXN+FJlovR+X65RX3ywg?=
 =?us-ascii?Q?Q7oiE2qYUa626d05SfDxOsisvzRFG475SZjLZlN5bKNGwoWCCpSTH9HDaHeD?=
 =?us-ascii?Q?uDpJOrYBWyYXwyjZv/gXLwl+ApOl3oynqwBA15zfTh1QwDesFLmIPzUQlGBc?=
 =?us-ascii?Q?wcA0Nyq4+BZ1YELQalK91VvJMQ90Lvq9K8iflNoApKIxhdcHsfCnHwpG6Bch?=
 =?us-ascii?Q?ehKZGCXcA3kguTRWERQnStvtqboFUxe8qRtp77d7zMnBV9roKFWmqy7utOwY?=
 =?us-ascii?Q?9pVn6yQyGEcWBrZQ3yVIRcITmkybdvEWs1Ij1KBse5tBcxpdtEzCBjHZXli6?=
 =?us-ascii?Q?/lS74H2Uw4uPf7LZAkkzVL2s8LISzh9Z2zsVm5IZTYZ0v1QuLvQt9psLLEy/?=
 =?us-ascii?Q?G+thOCsSRJPPInbd5rmgl2mCkKIn9a0Zb1Faj+QK4iDKv+KqxdsGLNJuFo1O?=
 =?us-ascii?Q?783eawrtpu3IQOZjZVo7Mod/NOECv5a95Xxr7g3z3xKS+6KBswwyas/uZxUM?=
 =?us-ascii?Q?0fUfRK1JNJtRBZEqZpaZq+So71/fHAJsjeMw3nu7pivbEXp9bsEZKOHVRdy4?=
 =?us-ascii?Q?aud2b4nxe8iIs67gvO9BEsZ9i1/yKhIZEflympPuiqg/Phmn72kfrzY6sW0R?=
 =?us-ascii?Q?5cQWSpDH0IxcF7t9Lf00v8caffAul9FWFpIgJcCSLhqMyq+htIdgvAZUVbhp?=
 =?us-ascii?Q?iYXWV2c09ZVS5uSlp2tfEKc8fXqOWnHCJZekdR7tkMwKWy21GtFrpNHQOtcX?=
 =?us-ascii?Q?73c6pHkKOn26bpApVZGfLOZzoOtSlmA8cmpH4WJXxJouEom5v5/S82uLShhf?=
 =?us-ascii?Q?x7hIq08Kp/w5KGHTDzpZgVwYFEoas3Jcp4IvYZ89b+/20gJbAv/V6DFg/nh8?=
 =?us-ascii?Q?5lMzbRsJeODRtaOYb2PIRx7W6+4ySo/fLbR+ZT25h7g5hGAxULUqwvc0mH1s?=
 =?us-ascii?Q?xpN3ALFBo0nRcWKsERmoaksT?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	91f10bc3-ab66-41d7-efa2-08d8f43ba8e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	htUkz7YvC6j6AatBhtjDKvxBpAp8L4UndTD49W06E3AgwYvCSBmj6cp04LZhSSA7a318P/EhmXXVdfUb2pUqIzYo6NZDSre/1FKfwlHwaXVUskYbYwaYtUODTNYnxomidEc6g6ErQ5OC9GMT5SXx24xhjTKaH4crP0Yc1yS4H2+DaUrGGDapxc+C8W2sewyy6pf4Jb8I9fSuSDXtR6fm3BTFiirLt8CaipAQmybd+nE+DDdTVp9LZ7gl/dMdyXDdhC7FkdeOwh1J+168yzuj1U95RMqr2UOFz6BfAjqGisfa6jx1H5xfoxYRfjzyGOF45Ail6DFoYQd0q2Djxk9YyE8O9X0O9zAtPLZb1lLOZtzUkfk3ZsNhJ1vb5fNYSJhGBOfRSvCGiJjhFgSie65OiGD+SbmM0Ad8IIQeynPdo+8+YsFyKjHcnpiQXOc0p2jNXhgw6yRD++DrB6dcsjaTjYBG5Xrc9d4xDoiqB3V7XRYD7nuVmOh6oT9fFs4HdKydnCfEaWfjgb/DHImmUj4/68oa+XKvpQILHKun3SUUi/0jXX6iOKc3YJJbRCeJNqU7+bXh4BC8fVu5S23+9VX9IP+Z4Bt69r0Fcych+PU165OsK34+J1NZN63uYppox+c90YsF/wC6ahIqlNxwfMfY5g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(36840700001)(46966006)(356005)(2906002)(8676002)(36860700001)(4326008)(8936002)(6916009)(70206006)(2616005)(36756003)(478600001)(956004)(316002)(86362001)(336012)(81166007)(47076005)(44832011)(6486002)(82310400003)(6666004)(7696005)(70586007)(82740400003)(26005)(16526019)(5660300002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:54:05.3097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b730d4c1-ebcf-41b9-c1e8-08d8f43baf45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2017
Content-Type: text/plain

Issue-Id: SCM-2121
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Ieaf6b41fddb819e32a40c641ab3f6231fb1de9e6
---
 .../machine/include/arm/arch-armv8-4a.inc     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc

diff --git a/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
new file mode 100644
index 0000000..a4f2ca2
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/arch-armv8-4a.inc
@@ -0,0 +1,19 @@
+DEFAULTTUNE ?= "armv8-4a"
+
+TUNEVALID[armv8-4a] = "Enable instructions for ARMv8.4-a"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-4a', ' -march=armv8.4-a', '', d)}"
+# TUNE crypto will be handled by arch-armv8a.inc below
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-4a', 'armv8-4a:', '', d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv8-4a armv8-4a-crypto"
+ARMPKGARCH_tune-armv8-4a                    ?= "armv8-4a"
+ARMPKGARCH_tune-armv8-4a-crypto             ?= "armv8-4a"
+TUNE_FEATURES_tune-armv8-4a                  = "aarch64 armv8-4a"
+TUNE_FEATURES_tune-armv8-4a-crypto           = "${TUNE_FEATURES_tune-armv8-4a} crypto"
+PACKAGE_EXTRA_ARCHS_tune-armv8-4a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-4a"
+PACKAGE_EXTRA_ARCHS_tune-armv8-4a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-4a} armv8-4a-crypto"
+BASE_LIB_tune-armv8-4a                       = "lib64"
+BASE_LIB_tune-armv8-4a-crypto                = "lib64"
-- 
2.17.1

