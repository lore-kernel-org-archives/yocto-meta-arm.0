Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web10.7718.1616068592599566007
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Mar 2021 04:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QxGqrml8;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVmBJA4KQJ0rzmn35Bs91TtKv5jAOLDLEdi3z3h2QUY=;
 b=QxGqrml8vam4S0IwgybxbCUBz+CSLBidWtiyf24NROavL+jU0TnM/sVxiz983tO6qJIdqPR7b1u5+cjFdi6ULlGoJXY4y99UkG61WyuBtXMw97y8MuHKwfBACgnRo+3Z+NZZURDGZggV5yJOlMfba/BrJrTe+pPwLY2crzUKNa4=
Received: from AM5PR1001CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::27)
 by PAXPR08MB6909.eurprd08.prod.outlook.com (2603:10a6:102:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 11:56:28 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::7) by AM5PR1001CA0014.outlook.office365.com
 (2603:10a6:206:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 11:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 11:56:27 +0000
Received: ("Tessian outbound 26664f7d619a:v87"); Thu, 18 Mar 2021 11:56:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1942bd954e939c7
X-CR-MTA-TID: 64aa7808
Received: from 4d1531dea61f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 78185C7E-1B48-47B8-8909-FDDB1E6CB4D9.1;
	Thu, 18 Mar 2021 11:56:21 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d1531dea61f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 Mar 2021 11:56:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QK0PzBPabbbvRHbcim8c9Q09afk0WijCp08UBYOrIDTOYjAQEc9Q+AHPQslYw4n3+FfVG8Mt9tG6Ngq0N73jhSrQAdMt0PqrOyfP8h9g83pQ4x7W+fVLJOCYEPsnWZq70NH7Xl1c/Rpc6zRM6+ofHvdJeX5H0UeNPZjaVD5DOBMZrm10EiQlq6Wis6Q07knbShUQCOdjR73P8jBgEK0ECmkO84bd5vLpW5P8Tt3YS2rEuk/rZYXFkclV9grq9KFxF0Wbm1qb5NWNov0Eg3xtnLczQDGiTPO4NblsVZhDq3hYDUGCvgfWifiXosbkE8DTBwVG0jZQyM0L0zR0TD8YWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVmBJA4KQJ0rzmn35Bs91TtKv5jAOLDLEdi3z3h2QUY=;
 b=POJG3sMJ1Ol/PYXYHHx8YECmqPvErQ8Dnt8JDeTr7s8XvW2TnT9OEAeeutDJ/Z/smIjwrgNpE3ixmaSrt/uavM/5GhwJpf4Ix78hpm9srscc8fO0sSgqKTNhfyeRVu3Gkdf25PFSswEppSMGLt8Kn6dwlQhJzi+wRov3xse5QzYFqQfrPlkY1Qv66Ac5Meh6kfN6/SuCuuHvxTSmyYLIOafO7Wq+2qtCfsytVEMHTjem6sv+cdLvmvJ1Hr0Q05DLKzKF5boHVScOarcihAXI6khxL/G5jlqEzDu9K9zVkJkFAJ4doRzP+Y2TuoUx6dD7Nr7vhMaMvhUTD0d+t14k2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVmBJA4KQJ0rzmn35Bs91TtKv5jAOLDLEdi3z3h2QUY=;
 b=QxGqrml8vam4S0IwgybxbCUBz+CSLBidWtiyf24NROavL+jU0TnM/sVxiz983tO6qJIdqPR7b1u5+cjFdi6ULlGoJXY4y99UkG61WyuBtXMw97y8MuHKwfBACgnRo+3Z+NZZURDGZggV5yJOlMfba/BrJrTe+pPwLY2crzUKNa4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VI1PR08MB4013.eurprd08.prod.outlook.com (2603:10a6:803:e6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 11:56:18 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b%4]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 11:56:18 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp/scp-firmware: bump to latest master branch
Date: Thu, 18 Mar 2021 17:26:05 +0530
Message-Id: <20210318115605.29547-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.55]
X-ClientProxiedBy: PN2PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::17) To VE1PR08MB4846.eurprd08.prod.outlook.com
 (2603:10a6:802:ae::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.55) by PN2PR01CA0132.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 11:56:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cf623c0e-7e25-414b-0e9a-08d8ea04dc94
X-MS-TrafficTypeDiagnostic: VI1PR08MB4013:|PAXPR08MB6909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6909CB13A2CFDD303C6263BCFA699@PAXPR08MB6909.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qQCkhUcfNVgfohadtHxkqkrKd1xum0nsW7fdPfteGvbC8IRavd2GGrCTqUekIq121mCcktMaTRa7VzQCSxi7ly8saivsHFhtD4+3sE+WbQgpAzScOdTvZs6YxlVOY67rqIFB+8r4U0UluHoEbbb+VvG9ZEHWXE0hIyExZGtej8+JBftlk7B3cRs3YMG89JW6SPZ5mJC9KyR/aWhbNY1tltg62hR6ziA3mZYGXURPCylycIdPJp2b421bNIfI2mqPYLUaI0WThaVheDMctNz64Xk9wTGWkB2YmOR3YeM0QX6dcYeAVNQv8mSGwcYhruWZUjb1cLdCmomteEgFpzAFpaKvKzwTHaDanJqK/MrHNN/zFhq1bW2wmKHAZDTJTH9snWNMstc2leABf0EPpI+CKnYFSf17zVD6mp0ewsw5i1jM/OLTsLXlG/gD9Uv6hhhoVGbIBO+EsUHbuiptbH4POz0eqVw0rlpu+clBN++6GBinPsnJnbRRmpz51eMvCbz9NDPjk3lLSMXJEvOn6/67A/r6cpAe3cZz7icHb41j+mz2gc2UQx85k1wAvphZ4yTdVd4ot+8qFEbn7ldK8YdU79ZbXOGLtPTN7OKsnQgnTgQrHX2QHNBz3PREt08Xceh3QFUpik9HOKvM17dAl3WJpA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(7696005)(36756003)(52116002)(316002)(26005)(8676002)(19627235002)(6486002)(5660300002)(66946007)(6666004)(6916009)(4326008)(8936002)(2906002)(478600001)(83380400001)(16526019)(66476007)(38100700001)(66556008)(86362001)(1076003)(2616005)(956004)(186003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?oqBstHEnRjcgJtEkGMFWpXgdg3v+tnxH6hbjwQZUzDpnfs+J2Lw0kF7j1a8s?=
 =?us-ascii?Q?OY2VvxVkbJMxd54vKtLgrGX7U5/Ue4eYcgQ6bnBsndy0ctipLVZg81C4cTkw?=
 =?us-ascii?Q?/PQmtdSKMw1i+apIRZPnJTynRsBHksBnkrFAimPfNWTuHth6nNqFugJa6jQt?=
 =?us-ascii?Q?An6/MRXPCKvC8y00EISFQH590qdk7i3/lDmWZ7XdfnXF3uroX7v11jCBoAsm?=
 =?us-ascii?Q?HADy4JXi5xLtqwldAo0nNzD6r99bVItMw7zo2dMkOUZjMDsB8iK/Ao5pVURU?=
 =?us-ascii?Q?vHyAZVKPh3cnRfoUzLZsVLZBJ3K8zTckABEHls6PEqL3RvuXKcJFuz8xfvyL?=
 =?us-ascii?Q?LUBItTHwrLdIVZc+JRk9lt5moIin55kKjm/W1Lxsk9kl0seZJJJD7Duob8FW?=
 =?us-ascii?Q?nSHuzSnw2fEqq3LJhdl981mBB91xF1oRXL8RhQ5wS4nuoRnkU0MiL6Xw9Mgj?=
 =?us-ascii?Q?l/v3yc9QOBPNH1PizeXUXqr4gpnyDDVV3qaEFhJvNqg9vbRrqwbz0oNjitW2?=
 =?us-ascii?Q?GlzMgTVGPvPX4yvPv636OkcNsV0gcHfvoMJykzTx8bNDubw7b+Koi+M4T3k2?=
 =?us-ascii?Q?QkB6Y/NP38FY0hvQ3kozenkS97YYZFKedgSdm146Ue5FK5375iEnAu4pmpnN?=
 =?us-ascii?Q?WCIGJ1Fn0KvQN3A3Gw9tcYppnI5ywBJBENdLHrepZwYF/y74BRUQEny7SnCO?=
 =?us-ascii?Q?kXgPUIvPSf/3mtjxVL9zy9EL8MRkiQ7tqxbRMX/gXsOJebEADg4ABeFxjiLt?=
 =?us-ascii?Q?Kl+y7c8jR6p4uZwtdGRp3dzzL4ZupWtH1Blxnj2kS2OwykrOLtFyIWL+uQLw?=
 =?us-ascii?Q?nBplyti7UUrKbpilwv7fIsYvRJare2KI9ir3lRIhfUSCPZhw0X1v9lhFDjoi?=
 =?us-ascii?Q?YwRygYKZeVYL6xceicdSkzU0+In39VsDUp+lEvzTlfbJEC4uqT5yygi/Kt5R?=
 =?us-ascii?Q?uUHwSObaNgvRrJUNts3nBxmDQdTG9E2pZlUdFL3gKpMAGOzO1h1dO80yNVpW?=
 =?us-ascii?Q?smjuMN8CIL3eWQNDCMFqc2zxk9Y/oNhdWiexGaKD60pxZLPIQD1wXvCTrBIg?=
 =?us-ascii?Q?vE1fgF74VFY8Eref9KZZyMKdD7JDY6/wEyNTk+wzghoFiCZC+TnJh8hcK4UA?=
 =?us-ascii?Q?g6rMkLTy2oLjJgcQrGhsajOJZVroLvpIVJCV/yg6zpyo8OQaqhFiCbCk5LtL?=
 =?us-ascii?Q?vHOknF++S2iaP+zn9K5PF2tYNSknws4/mQi1dOvHaGVHHfNS6lEDWfEcNe2L?=
 =?us-ascii?Q?cywhxtoqfYdIWocYZjTgaRznGFJpDeZnOD6IOA/KaXIaqD2QYmOz+rKXvUN1?=
 =?us-ascii?Q?BbzzKq4Y8YHHQRV6gyq1vxbW?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4013
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94a3570e-fc9c-45a7-c280-08d8ea04d716
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S8xUx5bHn+K3kXzSjBSuQK5nJrV0iYXeEljx56NYGGt6KP8czGk4IQ4/mB3SgATdJhCbB+xrns74bymg/nBhUD2OzHFCIv6/hltDS0aeagnDg+vjcpYQfTRE4vRd9tqtMAfg7bD/UyLAC4//gQ7w+Y+/efPbA6M/Oo7kcdLNZk1H9+qPOBawYbOr3H3zfL30K4VplQ56Bf0BdYzQWBeETnlGW3X+xtbBFHPtnR1tDjQpdwVnQ/SPaskUQzpkPpQSnMwUVKx61X2h34SH1kl0lIYG0781TdONUJH8ZwBUwOsg2gu0nTugiRQScOfSTWyDGszKjqpviYTC/Z7CqR4DFawGh1GY7nTZV/kWxQ82p5BX/3livsqY+PVCwHjj1UwI/Pt67c9hsQyKY0xbKqBTyVo+N/DUH+fzJIfStnvAHwrAhxKzkemw4Es7iZT9tOgyOsfi25EG0NLAtkLlkgUCOt3k8jfASdOG0xpDR6pFgchWXy6fgJgw5Y4LDv2KJtek6g1QAZPcZfUCnODDZaYpK6QQea4iV3YO/5Wjyrs/kjvimDOlVNtW4ocj8JkoXpQBD0MHzKwTMT7YPuWS01TUYxFyhIjbbkOIb0Rar3zA0kfG1tJYghEFBMCrNdA4XQJt1z4sLlOLCZeAGoF4KfdDf7j5OwB1u9SA3MTyQSe2TyfolH4GOksdRqx2p3i1ONGr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(36840700001)(46966006)(956004)(478600001)(6486002)(2616005)(16526019)(36756003)(1076003)(2906002)(82310400003)(336012)(186003)(36860700001)(47076005)(6666004)(82740400003)(5660300002)(26005)(356005)(83380400001)(86362001)(81166007)(19627235002)(4326008)(8936002)(8676002)(7696005)(6916009)(316002)(70586007)(70206006)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 11:56:27.3770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf623c0e-7e25-414b-0e9a-08d8ea04dc94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6909
Content-Type: text/plain

SCP firmware recipes are updated to build latest SCP firmware,
the previous release version is 2.7.0.

New features required for N1SDP are integrated in SCP firmware repository, this mandates
us to migrate to latest master.

Change-Id: I1fb44ed790ca17f713333a0e371dce10c9399424
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 ...t-CCIX-speed-to-GEN3-to-work-with-in.patch | 78 -------------------
 .../scp-firmware/scp-firmware-n1sdp.inc       |  8 +-
 2 files changed, 4 insertions(+), 82 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
deleted file mode 100644
index 1f6f696..0000000
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
-
-From 3deb59c5f4c64aa092bb3a4ebc018acf3f746f47 Mon Sep 17 00:00:00 2001
-From: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
-Date: Tue, 10 Nov 2020 12:31:04 +0530
-Subject: [PATCH] product/n1sdp: set CCIX speed to GEN3 to work with interposer
- C2C setup
-
-Set CCIX speed to GEN3 to work with interposer C2C setup
-In this use case set downstream/upstream port transmitter
-preset value to 4.
-
-Signed-off-by: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
-Change-Id: I635566574babbb7591b5bba97105f76f1f8e550a
----
- .../module/n1sdp_pcie/src/mod_n1sdp_pcie.c    | 30 ++++++++++++++-----
- 1 file changed, 23 insertions(+), 7 deletions(-)
-
-diff --git a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
-index 901e0464..ba02144f 100644
---- a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
-+++ b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
-@@ -206,7 +206,12 @@ static int n1sdp_pcie_phy_init(fwk_id_t id)
-     if (dev_ctx == NULL)
-         return FWK_E_PARAM;
- 
--    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
-+    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
-+        pcie_ctx.c2c_api->is_slave_alive())
-+        gen_speed = PCIE_GEN_3;
-+    else
-+        gen_speed = PCIE_GEN_4;
-+
-     lane_count = LAN_COUNT_IN_X_16;
- 
-     FWK_LOG_INFO("[%s] Initializing PHY...", pcie_type[did]);
-@@ -239,7 +244,12 @@ static int n1sdp_pcie_controller_init(fwk_id_t id, bool ep_mode)
-     if (dev_ctx == NULL)
-         return FWK_E_PARAM;
- 
--    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
-+    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
-+        pcie_ctx.c2c_api->is_slave_alive())
-+        gen_speed = PCIE_GEN_3;
-+    else
-+        gen_speed = PCIE_GEN_4;
-+
-     lane_count = LAN_COUNT_IN_X_16;
- 
-     if (ep_mode) {
-@@ -282,12 +292,18 @@ static int n1sdp_pcie_link_training(fwk_id_t id, bool ep_mode)
-     if (dev_ctx == NULL)
-         return FWK_E_PARAM;
- 
--    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
-+    if ((n1sdp_get_chipid() != 0x0) || !dev_ctx->config->ccix_capable ||
-+        pcie_ctx.c2c_api->is_slave_alive()) {
-+        gen_speed = PCIE_GEN_3;
-+        down_stream_tx_preset = PCIE_RC_TX_PRESET_VALUE;
-+        up_stream_tx_preset = PCIE_RC_TX_PRESET_VALUE;
-+    } else {
-+        gen_speed = PCIE_GEN_4;
-+        down_stream_tx_preset = CCIX_RC_TX_PRESET_VALUE;
-+        up_stream_tx_preset = CCIX_RC_TX_PRESET_VALUE;
-+    }
-+
-     lane_count = LAN_COUNT_IN_X_16;
--    down_stream_tx_preset = dev_ctx->config->ccix_capable ?
--                            CCIX_RC_TX_PRESET_VALUE : PCIE_RC_TX_PRESET_VALUE;
--    up_stream_tx_preset = dev_ctx->config->ccix_capable ?
--                          CCIX_RC_TX_PRESET_VALUE : PCIE_RC_TX_PRESET_VALUE;
- 
-     if (gen_speed >= PCIE_GEN_3 && !ep_mode) {
-         FWK_LOG_INFO(
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 635ec39..d365dc6 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -3,11 +3,11 @@
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
+LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731 \
+                    file://contrib/cmsis/git/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-SRC_URI_append = " \
-   file://0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch \
-   "
+SRCREV  = "6c15afb1b37d0728482c598b063cd69bfc733e93"
+PV = "2.7+git${SRCPV}"
 
 COMPATIBLE_MACHINE_n1sdp = "n1sdp"
 
-- 
2.17.1

