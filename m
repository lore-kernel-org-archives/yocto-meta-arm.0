Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.7090.1580827226709123561
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 06:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2MX+++Uh;
 spf=pass (domain: arm.com, ip: 40.107.22.84, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2EarZ2EL+5ldBDoNX5Uzv6xJyE9O5MkLmaOSv38rXQ=;
 b=2MX+++UhA9kMbV5k6ZikDISV5/Zv1SrkSG7n1QO7wkz/P9+i05d/dMep/+SetqwfJdUEtmKPvGRNsqRmHqTk1rnMiYEtxD4OTMLWGpEBQzm23/AUxMfvfAUsLa0ikuvvxGKc3p8E1E10nxeYh7WiZQd/2uK5j8Yxjb18/exCdQc=
Received: from VI1PR08CA0163.eurprd08.prod.outlook.com (2603:10a6:800:d1::17)
 by AM6PR08MB2966.eurprd08.prod.outlook.com (2603:10a6:209:4e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.30; Tue, 4 Feb
 2020 14:40:24 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by VI1PR08CA0163.outlook.office365.com
 (2603:10a6:800:d1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.34 via Frontend
 Transport; Tue, 4 Feb 2020 14:40:24 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.18 via Frontend Transport; Tue, 4 Feb 2020 14:40:23 +0000
Received: ("Tessian outbound da94dc68d1bb:v42"); Tue, 04 Feb 2020 14:40:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d92e11482e04639
X-CR-MTA-TID: 64aa7808
Received: from 9bf4cc94679e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E2C1654B-BEB6-4F91-A50B-9C4586B3CCA1.1;
	Tue, 04 Feb 2020 14:40:17 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9bf4cc94679e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Feb 2020 14:40:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQsCuv0HwGsNAszAIFkEkkOEHOWIddjv1c/psYQksxfITPrMIeYKmWUJB6zV7IUG8cJMmxoQR/OldPvSP+PJWz+W1V9573qkFhRUxx9dKupS5cCiuuq+jobNKaJHx/JBJn8LhJ683oRrUi9pdJWr42si9QkuASQDTv50iNy/CmsJm/a7ATlwQkMVkFctArZTnYCqm88dpMVXg1urU0Cw7F0wJygh5q5cu3eJqSDKUJe1TsqpOOnJixJWCnLlqXlTxythWqHMd8Ke62/9x5Zk8sdbIo+sIbT5NzUXYIEw15BqrfYS+PFg3ee/BpygSmcgcA+TeUtu/u8kJcErzxAq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2EarZ2EL+5ldBDoNX5Uzv6xJyE9O5MkLmaOSv38rXQ=;
 b=EWo+V4Sb1+nB1DC046rJxTJr9poiT2TLvPywevrA4JvukklxV1EE40Y1pl9ZjwgRZ9MyDfQuddZGh7E7hTnu+QVvcAMMP0sI2ZxWalx0FRCu1Sk3JgKzwMrwsPQA6iOc/pWrTvnJ2EJis4Nu/G3Unk4AtW7Yxjq+lklL0JTCbDtVTlJv7+XT/lOUuN2NgGdRYBol80nZhi28WgEt+fJQGo3anZKkXU1g25X8y17cw5PgK92JL7Mj9vr95XJkaJsTa42sJqQlbej+rXiW17b0Wal7rSQMI4uFHVdxILrSysVCoAgpD7tXGUJFW5MTrxeAC+jcRNmsyedD8nknghncSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2EarZ2EL+5ldBDoNX5Uzv6xJyE9O5MkLmaOSv38rXQ=;
 b=2MX+++UhA9kMbV5k6ZikDISV5/Zv1SrkSG7n1QO7wkz/P9+i05d/dMep/+SetqwfJdUEtmKPvGRNsqRmHqTk1rnMiYEtxD4OTMLWGpEBQzm23/AUxMfvfAUsLa0ikuvvxGKc3p8E1E10nxeYh7WiZQd/2uK5j8Yxjb18/exCdQc=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB2954.eurprd08.prod.outlook.com (52.134.109.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Tue, 4 Feb 2020 14:40:16 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::9193:2edc:5e96:ffb2]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::9193:2edc:5e96:ffb2%7]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 14:40:16 +0000
From: "Bertrand" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] Optimize execution on FVP and Foundation platform
Date: Tue,  4 Feb 2020 14:39:57 +0000
Message-Id: <20200204143957.18275-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR06CA0007.namprd06.prod.outlook.com
 (2603:10b6:5:120::20) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by DM6PR06CA0007.namprd06.prod.outlook.com (2603:10b6:5:120::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.27 via Frontend Transport; Tue, 4 Feb 2020 14:40:15 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82f62e3b-bc5a-482a-b660-08d7a9802af1
X-MS-TrafficTypeDiagnostic: DB7PR08MB2954:|DB7PR08MB2954:|AM6PR08MB2966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB2966B8636982363EEBB68F759D030@AM6PR08MB2966.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(199004)(189003)(2616005)(956004)(5660300002)(4326008)(6666004)(6916009)(8936002)(86362001)(6486002)(36756003)(1076003)(44832011)(8676002)(81156014)(478600001)(81166006)(316002)(66556008)(2906002)(66476007)(186003)(16526019)(7696005)(66946007)(52116002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB2954;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HH23He2nWCG2d0/Fm76WFhYKeWSD8aq6zsfj68EZC6/Ig2fk8R4toNRDEBmxxkq8vpPuqmWssts9wj6ZM0Z90C8PJ/B58UuAvQg2IDZvdWODP3WpM5SEFVGQ161/zoAsGgBIH0AYS32hIctUXaIpzq1DkWtWfCTkxp3/uuWvKy8u5lV+RWfCURiE0xYy62pRsUutgo+Tns3ZnlYrDjGu34VeI+ekFGPtPhxfoo+Wkda2qq8TzUPU7BH44AU+TGvzrQcciFJFdLfTpTVGXSE8aDpzfRaXInY6NPWVxE6tNhn/n52G5xPZvrSB79qga3zUqvHC4eLocO1QuSDkhWZ49501k12NA9CKkYgweMWbTQwclOxJgEwW5ditAUucqi/3ZRcfnS0cwiiXVzFTVgq7QPslKwBXzMbrqMqJqYNm+BNX2ogN7AmOM66hMobD7W5p
X-MS-Exchange-AntiSpam-MessageData: 
 S4fPOX1uc1X24ztEqhMp4Oqo1VLWuEVzbdImWbxmywBrz6SDW4XEClVemTm8QQRZxvfxvyobcGrbUBUf4PrjQNKxzUVuAzWd42hMfbNVFfXpRtSB7zd0NXR/qqWXVF8LIjhigmpMY1MNeXcD/s4+kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2954
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(44832011)(956004)(336012)(6916009)(16526019)(186003)(26005)(478600001)(26826003)(70586007)(8936002)(70206006)(5660300002)(2906002)(4326008)(2616005)(81156014)(36756003)(7696005)(86362001)(316002)(81166006)(8676002)(6486002)(6666004)(356004)(1076003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB2966;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5490f174-3230-4794-2852-08d7a9802655
X-Forefront-PRVS: 03030B9493
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ghn0vwK/kdDS2udwoofnMW7vUOmGH4CzRNL25R/QE79uMj4HWc0Sm2HsuV+eDgWeFpC3Lag67/dGVlAP7v6k/kuGcpsjrRmXQiJrCzFLR4E9YSM3Je1pHJfB/6r/FPpY+m0PxjSYTJ3IzoGUO6qUDUKyczWq9hK4uEAinaicVqYqCoGfLKGTFW4RAMtyq0SinNqKhDIBNDLAHa+SFkZeiUy0ZM0l0GVd/ctyds5c5A2ngEc9pgf220QM4dgUoxr/6MY3hjbtA7NgHoD1R4WIqm9keD/rO24qp0dVS7dCUyGX6wwd5xwuNUTfZgUcNVof/DDqQhh8dvWZf1quaSdhd/hrm/H1C42pCBoFmhZEHshYBSeG/9hVr3RZgyhhoGiBVOxmsEW5bqGX4OPtH9+2OvKPWdhm6IwmRgVRuRQdVsXzYz8EOSWIVkTEY1x2ODNn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 14:40:23.6955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f62e3b-bc5a-482a-b660-08d7a9802af1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2966
Content-Type: text/plain

Add an extra partition to the disk image generated for FVP and
Foundation platform (to be used for user data or extra usage). The
partition is created on the hard drive but is not formated.
Speed up running on FVP and Foundation by optimizing model parameters:
- disable options that are already set by default
- disable cache modelling on FVP
- disable secure memory
- disable real time on Foundation (prevents timeout as execution is a
lot slower then on a real system)

Change-Id: I20d613bd8b0f4cb7df87c294d45b9f718f6a8ed3
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc              | 5 +++++
 .../fvp-common/files/start-foundation-armv8.sh            | 4 ++--
 .../recipes-devtools/fvp-common/files/start-fvp-base.sh   | 8 +++-----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
index 606ea32..6bf33f3 100644
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
@@ -27,6 +27,11 @@ DISK_IMG_PARTITION2_SIZE = "2048"
 DISK_IMG_PARTITION2_FSTYPE = "ext4"
 DISK_IMG_PARTITION2_CONTENT = "rootfs"
 
+# Empty third partition (8G - 2048M - 128M)
+DISK_IMG_PARTITION3_SIZE = "6016"
+DISK_IMG_PARTITION3_FSTYPE = ""
+DISK_IMG_PARTITION3_CONTENT = ""
+
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
index 4e45a04..ca39bee 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
@@ -40,10 +40,10 @@ DISK_FILE=""
 FOUNDATION_PLAT_EXE="Foundation_Platform"
 
 # Foundation Platform arguments
+# 4 cores
+# gicv3 emulation (required for hardware virtualisation)
 FOUNDATION_PLAT_ARGS=" \
     --cores=4 \
-    --secure-memory \
-    --use-real-time \
     --gicv3"
 
 # Foundation Platform user arguments
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
index b6e237b..1d3c206 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
@@ -38,13 +38,11 @@ DISK_FILE=""
 FVPEXEC="FVP_Base_RevC-2xAEMv8A"
 
 # FVP arguments
+# enable virtio network
+# disable cache modelling to improve performances
 FVPARGS=" \
     -C bp.virtio_net.enabled=1 \
-    -C pctl.startup=0.0.0.0 \
-    -C bp.secure_memory=1 \
-    -C bp.tzc_400.diagnostics=1 \
-    -C cluster0.NUM_CORES=4 \
-    -C cluster1.NUM_CORES=4"
+    -C cache_state_modelled=0"
 
 # FVP user arguments
 EXTRA_ARGS=""
-- 
2.17.1

