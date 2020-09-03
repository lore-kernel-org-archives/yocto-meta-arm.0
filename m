Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.19710.1599154601617332111
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 10:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gdz8PEzl;
 spf=pass (domain: arm.com, ip: 40.107.22.55, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8QOXvfX2m4THcXSb6/thoE/O3KTseYpww+ZBDFY7Vo=;
 b=gdz8PEzloYTXpvcWF7s7p/6rV7rtCP54iPonTpp8tnbfYl4NZh84+mFWH/d7eeNq+I6WzLEVpyul11vlaq/EFzxPD2sjn6CI3THEVCuU4OMvLhLqkI3hULPUYN7atSg7d+gWEimS0PUjGisq08CZW5w2n5FVy0tTDYy9LFkqhG0=
Received: from AM6PR04CA0049.eurprd04.prod.outlook.com (2603:10a6:20b:f0::26)
 by DBAPR08MB5573.eurprd08.prod.outlook.com (2603:10a6:10:1a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 17:36:39 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::2f) by AM6PR04CA0049.outlook.office365.com
 (2603:10a6:20b:f0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Thu, 3 Sep 2020 17:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 17:36:39 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Thu, 03 Sep 2020 17:36:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: deb8e3863860bfa3
X-CR-MTA-TID: 64aa7808
Received: from 2113565e4c19.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7BA66D1A-2BC4-4CB2-8B72-8F5F224B2E80.1;
	Thu, 03 Sep 2020 17:36:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2113565e4c19.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 17:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cncZw6r63sQhWBrJSU/CZG72XFmGVRdwl8xTKZOjnUGukeDLcp7d8xxyxt/hY78LXryQtiZD30ytev0v4TyGuomnhJOl8SGvUPS/9+5nmpzsAJp2azJ1LV+8guFr5WnuLmTZ/tyaGYnMAFKHoXqvU1uPbil4cyoeIubUvKqPiwdTKdtRhX8AfevvJBNDSnuI7ZKXdKc0wXebNsthpwOcKEWi+ttxMTRJqH+63bOOTGxslGXfQIq8Js+189Hyf9upvQZFuwsAFbxOyG9BaY7Ab9T0oG/pLnsCbNbCuBadslS6Sjg+LQKA6QhjzgydWQQaZ/ACbJLff7WNuKYxlL/qmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8QOXvfX2m4THcXSb6/thoE/O3KTseYpww+ZBDFY7Vo=;
 b=kmy3aDseMbOZgAhUUx1rYs/kPDTdBfPecZKiX+E6ksWIXJpEGVcSvxBCQ80r0i/AeUJZ3m0CLfCGYMs/laX/i2ytQAmp+g9c/UlCiOYnAQX6tzf5A6VpnfvRE/z6kgdCOAbdSiaxsaJnmqe31ZFRFa/olb6+eqCYCvZqTb0vYQb0ZFoGEz3QAuR6OaNS0UBKHASaE+oaT9yBGn46B5eFyi73Ov/SteYxW+qWr0r9kLY3cC49KdyHF+cRp7gNb1Tp7pOErCfC7XYZnfTjaDO7zpnArkSFpY7UnLYXLboYlkq/GKdukshBpVDv15INta5Ox0RXe1XXEAFu16NULk0PQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8QOXvfX2m4THcXSb6/thoE/O3KTseYpww+ZBDFY7Vo=;
 b=gdz8PEzloYTXpvcWF7s7p/6rV7rtCP54iPonTpp8tnbfYl4NZh84+mFWH/d7eeNq+I6WzLEVpyul11vlaq/EFzxPD2sjn6CI3THEVCuU4OMvLhLqkI3hULPUYN7atSg7d+gWEimS0PUjGisq08CZW5w2n5FVy0tTDYy9LFkqhG0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2940.eurprd08.prod.outlook.com (2603:10a6:7:30::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 17:36:31 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b%12]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 17:36:31 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 2/4] arm-bsp: ARMv8-2a: Add tuning files
Date: Thu,  3 Sep 2020 13:36:16 -0400
Message-Id: <20200903173618.2910-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903173618.2910-1-jon.mason@arm.com>
References: <20200903173618.2910-1-jon.mason@arm.com>
X-ClientProxiedBy: DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31)
 To HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 17:36:29 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 03 Sep 2020 13:36:25 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db8bd586-e0a4-43f3-929b-08d8502fe9ec
X-MS-TrafficTypeDiagnostic: HE1PR08MB2940:|DBAPR08MB5573:
X-Microsoft-Antispam-PRVS: 
	<DBAPR08MB5573B91A0DA160E5184FDAF5F02C0@DBAPR08MB5573.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GrD8Ey3eSYanuupBNYue0elLTpd5OiaYXjjKdiZkNNDs06ux9g0/gtnvEPfjvs2V/eHrJx+jllySJ6dZLSYPSOTntJmxzZhP723x/EuEnRIr1wOxh+smUGhuYz8iQ6J9MEkTXtuTcDZxBEGqS/7BfdDnRpXwXraTT/KKg7XeuTyqEqPlpUR4juJkwkf80WJc6xgdWWDE08nUl7SnJqmxuebCmahTTPlxOR/ux0sdhCqrjE1yLTFoCqGdLe/FzOc+RywyVkukXbEmQCy2SXZ6XpWS/4pstTb1jGgwlI2ZzPK34AYUTMa23GbAXoi2U7hpIuqTm+bEX7lZ4SPLXh39Xg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(1076003)(44832011)(19627235002)(36756003)(86362001)(2616005)(426003)(8936002)(52116002)(8676002)(6666004)(6916009)(316002)(4326008)(66946007)(42186006)(478600001)(66556008)(2906002)(66476007)(186003)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 juNx6Im5gHs04bl+ZSsbLtMBVdfGvkeuoJ0KlCks332TDZOpssLbnYt1a4GSUxE71LgcluonbJFdYHDu0tt3TmQSTV0oUveGQj1Y7WRz6C8npkVvjQXcsDhxc//btiPFHQfg7DbxFOhM9BzxpJTVcT9irFXP8Kj/feGFdx2/es4DlONWTngN7m2EqNnFRvXlDB/ahXcd6nqc0aL9slfJD1U90xJmQHSTD/MCoyXEZMQ1Diake8lGF1jzLIqzWt8S8PMDlkqcjbmWpKoAm0/4hK7ryooeY8TZvnjarNdTfnc7HOkLJiehbXJCo2EGqmiA0qtwoVYzGQQk4CTsn8KU2M7cCC7RYz6MTbXjlGo5R4Yjp5tSuHi9jL+v40vvUU1KjA1isl4bnr62GY6P0m1Jh8T8CAm32T39DxG3VcsqErr69F5sE4fPL9kZov7rRHp8k0kTN1vKBDFP2pZ+afhVFe/KNB3b0RrCviVSDYBCEoJ7ld37RC+vcfkoGKp07F8DIJmmVE0/Qz1G2q1yMJG5JWuBMzCa1DIPa028gJvm0fQ6b+jWO5A9BsCehG9CzQLni370cb1uVO7oKFSJgOIHDsYkhgUatp70ASkr//0r46OkUC0pAKy6iNyaNXwlMuWX8/qYPi4Cl8K4FvrsFA8vWQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2940
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e3bfe4d-e377-4dcd-95ff-08d8502fe4b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jodMhKoRg/H5+yKoIKQr+SScZtmUCwLMNj8s888CG0u1FzqdJtIyRNRboS/1vXkw0znBySkoYktNZ9dAPf6VaL7Ex15r/rdS/NdP/qiSm4+UXKtZEpxoHi9SiFnkoINW64Pa6jSq2PfP3wKOgk3WKB1dl7IVF7oFTu5Cc55h5L4K7ejn6udDJ1020kFfg8qoDOvq/hvVJ8oAcGf5yJIMzn6Mj3RcfrpEyzpl5Q1o9RNLo7xssgEuMtGM8kP1kY9P5cZH3B0Yhf1kSQabWnAyPg03kQ7IgNGnraGBh+ebnndZFMN47X3EUAV3CwY1+ubdrGTL/AjqPZdf5HU1YW5iSaXnTIQ85pLl+jNXzaVWJeLUlRnqSvempvVaZw4R6ENZfOTNgMTKDqeEfhRFN5ZX8w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966005)(36756003)(47076004)(19627235002)(8676002)(2906002)(478600001)(8936002)(81166007)(82310400003)(82740400003)(70206006)(356005)(26005)(1076003)(186003)(44832011)(6916009)(4326008)(426003)(2616005)(5660300002)(336012)(6666004)(42186006)(316002)(70586007)(86362001)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 17:36:39.0455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db8bd586-e0a4-43f3-929b-08d8502fe9ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5573
Content-Type: text/plain

Add all the available ARMv8.2 tunings from GCC.  This belongs in
OE-Core, but adding here so that it can be used while trying to upstream
there.

Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
 .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
 .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
 .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
 .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
 .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
 6 files changed, 93 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc

diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
new file mode 100644
index 0000000..af4bfbe
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "cortexa75-cortexa55"
+
+TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# cortexa75.cortexa55 implies crc support
+AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa75-cortexa55                  = "cortexa75-cortexa55"
+ARMPKGARCH_tune-cortexa75-cortexa55-crypto           = "cortexa75-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc cortexa75-cortexa55"
+TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc crypto cortexa75-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
+BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
new file mode 100644
index 0000000..58a3019
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa75"
+
+TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa75"
+ARMPKGARCH_tune-cortexa75             = "cortexa75"
+TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
+BASE_LIB_tune-cortexa75               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
new file mode 100644
index 0000000..7c27d21
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "cortexa76-cortexa55"
+
+TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# cortexa76.cortexa55 implies crc support
+AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa76-cortexa55                  = "cortexa76-cortexa55"
+ARMPKGARCH_tune-cortexa76-cortexa55-crypto           = "cortexa76-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc cortexa76-cortexa55"
+TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc crypto cortexa76-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
+BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
new file mode 100644
index 0000000..70f9770
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa76"
+
+TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa76"
+ARMPKGARCH_tune-cortexa76             = "cortexa76"
+TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
+BASE_LIB_tune-cortexa76               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
new file mode 100644
index 0000000..672c8d5
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa77"
+
+TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa77"
+ARMPKGARCH_tune-cortexa77             = "cortexa77"
+TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa77    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
+BASE_LIB_tune-cortexa77               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
new file mode 100644
index 0000000..04e28ee
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "neoversen1"
+
+TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
+# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "neoversen1"
+ARMPKGARCH_tune-neoversen1             = "neoversen1"
+TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
+BASE_LIB_tune-neoversen1               = "lib64"
-- 
2.17.1

