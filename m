Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.75])
 by mx.groups.io with SMTP id smtpd.web10.10446.1588340894140785681
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 06:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eVojef4m;
 spf=pass (domain: arm.com, ip: 40.107.15.75, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktepCWUbhSzqnLYOvHap45oLMCprh0tdTOjESvi+Gk4=;
 b=eVojef4mO7oUQ4ZhRm1eKruXZhsYlyLut13aGsCI4voBRibsnyGh9ZmVhpcnp0Z+UqG7PivifPaIt7E2HNuAYgH7kSdf5gynL8jLgow8p4yMIxuyNyifyoDckXaK9+IVsH8oDvk525zVDIPZ3bgrnpCKZHwxYPF2JLL16ZA4+LI=
Received: from MR2P264CA0093.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::33)
 by VI1PR08MB4079.eurprd08.prod.outlook.com (2603:10a6:803:e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Fri, 1 May
 2020 13:48:11 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::82) by MR2P264CA0093.outlook.office365.com
 (2603:10a6:500:32::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Fri, 1 May 2020 13:48:11 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 13:48:10 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Fri, 01 May 2020 13:48:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19e73759433b29e8
X-CR-MTA-TID: 64aa7808
Received: from 7ff450da11d5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C59A388E-115E-4567-B757-09ABECA14A34.1;
	Fri, 01 May 2020 13:47:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ff450da11d5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 May 2020 13:47:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azaozZjPMesv5u1zOFWNbgx9k01axW5WfbyYkmOgaqLcVin5QIES3BtzD5QsXKRQvqRwgX+QRUtYvCpi1DSX74mFao95gLEMWVhYU5B8Kq+WT+MW18PBstaWXOYZLBO03fdQbkNOwksW+4HGmRSSTXzVokyPsTWo7+sFC5vMDf0LVyZoLdMbWT5us0rGA8IkLaajE4mI5uYl8uuB/bg1CG2FxW3cZrw9DblJd0J2r4nnqAob+eeDuGqF6S7ZEzSujM4VewgZGdzqUVok9Sm6wjuCZ+BCg+9hTiqL0jnpRO0aQspE/DEkcePtFs3vkkl4DQkehKx6dlxlIH4iguosqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktepCWUbhSzqnLYOvHap45oLMCprh0tdTOjESvi+Gk4=;
 b=j2TJ/fUGlFnhIqfDt2YgPDJSmD4CWWJrTafcUiPYkUBn+8dpIe6vv45BP/W3ruH0FuIdCF952CRF2ixDb0uwS0JrKKyjei+ON0WXwxyMY5nyrIjo7n6nGzYHjh153fzpYYPNK51C7dqbXoukp+H3VZDRUsDpBlydoUHOQNL4u4Jo+73mJpYsUe/a0xbJMyG/D/qxqVQeKZXipoqKI9ESxLe7O59lxIdHy4hJ59cIAIO5TE4VERavJAo1J9OcetUG00VbXyN/PbSn/x61u9s3B05oFSPKvuYgf5LLc/fSONw3R6MPoVOw1KNPmN+PKRkt2IImtDT8j42rYmfEwwkTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktepCWUbhSzqnLYOvHap45oLMCprh0tdTOjESvi+Gk4=;
 b=eVojef4mO7oUQ4ZhRm1eKruXZhsYlyLut13aGsCI4voBRibsnyGh9ZmVhpcnp0Z+UqG7PivifPaIt7E2HNuAYgH7kSdf5gynL8jLgow8p4yMIxuyNyifyoDckXaK9+IVsH8oDvk525zVDIPZ3bgrnpCKZHwxYPF2JLL16ZA4+LI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3083.eurprd08.prod.outlook.com (2603:10a6:5:28::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 13:47:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2937.028; Fri, 1 May 2020
 13:47:09 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] meta-arm-bsp: Update gem5 and switch to python3
Date: Fri,  1 May 2020 14:46:50 +0100
Message-Id: <20200501134650.3707-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0155.namprd05.prod.outlook.com
 (2603:10b6:803:2c::33) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by SN4PR0501CA0155.namprd05.prod.outlook.com (2603:10b6:803:2c::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.16 via Frontend Transport; Fri, 1 May 2020 13:47:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 83f119fb-60cf-4f3c-1813-08d7edd6494f
X-MS-TrafficTypeDiagnostic: DB7PR08MB3083:|VI1PR08MB4079:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB407990DF109CC7C00A8F03A99DAB0@VI1PR08MB4079.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DBozMaZPTbsNYOXlwOYix2qGGFMABZ+bJbOzkszKFWlF2nXmbrMLrBQcmJHZvg+3M31V24KTP54g1ASrDdvdjassRGm+Dr1F1AYRRcO31aiFJ7NGh9d76hYFduLw8uIdRexAZyD983znh1VyQqViOy97ceskrP8lh6T/aLs6PuQMp6WwmTnWZmmczGZPBHsE8IFCv3BOe9jspWwVfGp9C7I5JomGl1MGaQmwh/fWQL1QANyruCxnQ9T7zWaK3rCbkwVbL3pQS3OGWeta1rPCVHlTRBaaru8xGugvkNL6tl//KRBaE0mDE3QjU5gIm0n0Ajjqq61F1THDbszjXuFY/KgSegxZpm6iURa9uq7Ploi7QVo5ki0U++HfJeCjeqXTII6tJapBM2hNuvZxxufbFsDqix6UCPNBcPS582L0nEFRRvtseyKGBz+5x+vaUfcZKsk4ozddQf0ZnJym6oAB4CL3jC6V2L+GEbkR3DqUsCwzu78TzH8QO9B4UI/zgtU8CWVXRB5AIVkuDREGldmasOooJYk5RQbE/wdRwbDfSIGYOBX7BtGAoYXwY2g+s+9/MAUeeEP88seL69z8ESKdXLZgL6gozhYDYtQIhGk2tKA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(26005)(478600001)(66556008)(66946007)(5660300002)(19273905006)(44832011)(8936002)(8676002)(2616005)(956004)(66476007)(16526019)(6916009)(316002)(36756003)(1076003)(86362001)(7696005)(52116002)(6486002)(4326008)(6666004)(15650500001)(186003)(2906002)(562404015)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 O7ArUSNxWs06mzXRTyd3KcSjY9qbxY9hWpN8jEBbhb4TPBDXeNiGjkMapcK7C2YUXfLUMCyNpBEdimWn+Cgx/t0fiN5AbV7Wg4B4W+F6ud2H2DFiq+Wi4KcHp0nFexcWp6AgIORjXp7hnET+9IIpcoKmE/jgnGetKoBbzIJzsa5psAE9MqziW/1g9n6T5idHV9+U3efeszz4RL1U7MEyl0B8NNms+RyCkAnwpXcA3JAMLT51SqWcec5+zf4WF0MZa1xuV90yJQPse3HUyhGGh+HeffAHMhlnAkPR7lr1uinrIWR+okX1R0fTDmehJlgFjLi967HU0iD7TBTcdiQtK547QN1qjNim0EdfLPW3aDxk5j3SAeBI5O5pf+1shpCPNO4iRk4J6WxS/vpw/+xi13eT/tY6UiN13yK4HGbRz0XlzDBph02AAtJ+gKRykF8Fg1GXix+jwdH6MrSKXXV+D/R/JRYG/rVhbECMgciHDOnLC5QE3ekneUcWWqWPbGqhoyoINXthvjHiHZv0/eWjV45BNXlwzfkv7O4f6fHsruBZnSP8+AZC9+EEeuvx70eWXd8Zhsu8MqUDiRdoiFQUovnMTp3bsz3WSXgkmIS5UMD7oFfoXRu7VjoNvMJwSAsYjUR9Qsh47lrWadDfbmheWa+XxIjgm5t1B2uMko6WfWiWpNgpYlWmEmzJ0/GtoAEku6wZ9dABFl6b+8Tx/pNqMlxv0bmNzYoDGtGr4gG/sa7ED4KmS/guE6jlpuGcVPJvoGDkco9E3lB3PjToVcIEFr5bI4lkdjodIPtimG4pha8=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3083
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(336012)(26005)(7696005)(16526019)(4326008)(47076004)(82740400003)(6666004)(8676002)(19273905006)(8936002)(478600001)(186003)(44832011)(1076003)(956004)(82310400002)(316002)(2616005)(5660300002)(36756003)(6916009)(70586007)(81166007)(356005)(70206006)(6486002)(2906002)(15650500001)(86362001)(36906005)(562404015)(563064011);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31ea322b-0fbc-4f54-c16d-08d7edd624ca
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JBl3iqs8YujLUEKmR889UqXDHf6Q4zGnmkkjTYg2Ce9TEqqv1+IaHkezOaB6luA1htf//YFt7mCi45T0w9l/sX94Hk7vlO/Oy7+KAJY4UChnfjNVYd4JDQChw+GSeTFVlsrIODVeoR48ywxqeimmvmk75fS5KLX1cf6Bmn/1jCMNC/F4QvVr4eXgTfiYYl26EQMd1AX8GWFfbr4aUitbdl//PgUHpQADjSERXEMf0vw3lVT/ZkEElwkXHXazA/J6bIbj0xbGAfU40YNsmFA1pSvg2GTwtasq0TM4NTQGIyzirNnW5mCvDAB9HwRfQMo1h5hjvB3/a2nlvsU1PiWMs8CXYuRhRWCIws32PWX56wiyF1E2Y6/39vD7uJO8ZKjwBE4aEdsG8AeQ5Sx48B+qik9vw6ATGdjotO/mh20zRi34jO40JvhlB+3VxgnbdNnVf3cah5NNwf3yyHCol6qTANqXYZFf6godjUKpRP69xzl/izf6eCZ0h0JZHXIwkFxz1ilh2iJSBjLSSyL7DMXDdMMWjdz7gnpGiahNPdX/CeXktf3LOTNQ3OvtN86LG4zQAGMeNBMxWobbcQCk/qStgoQC2+RJ6c7uR2FVesBB9By9tHJPtfXzCzkqxp/pbU3wN5and9qajTr3qZj73j3F6A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 13:48:10.3559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f119fb-60cf-4f3c-1813-08d7edd6494f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4079
Content-Type: text/plain

This patch includes several fixes for gem5-aarch64
- Switch to a new version of gem5 supporting python3 and use python3 to
 build it.
 We use a version in develop branch of gem5 for now and we will have to
 switch to release 20 once it is released mid of may.
- Remove scons python2 recipes which were used before by gem5 as a
 workaround until gem5 was updated to support python3
- make gem5-aarch64-bootloader only compatible with gem5-aarch64
- remove unnecessary FILESEXTRAPATHS_prepend in gem5-aarch64-bootloader

Change-Id: Iad9af4f2e6073ef63a51c2c33a05ed3855dd8f08
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../gem5/gem5-aarch64-bootloader.inc          |  3 +--
 .../gem5/gem5-aarch64-bootloader_git.bb       |  9 ++++----
 .../recipes-devtools/gem5/gem5-aarch64-dtb.bb |  5 -----
 .../gem5/gem5-aarch64-native_git.bb           |  6 ++++--
 .../recipes-devtools/gem5/gem5-native.inc     | 21 +++++++++----------
 meta-arm-bsp/recipes-devtools/python/README   |  4 ----
 .../python/python-scons-native_3.0.1.bb       |  8 -------
 .../python/python-scons_3.0.1.bb              | 21 -------------------
 8 files changed, 20 insertions(+), 57 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/README
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb

diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
index 72069ad..4c479f5 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
@@ -7,8 +7,7 @@ inherit deploy
 
 PROVIDES = "virtual/gem5-bootloader"
 
-COMPATIBLE_MACHINE ?= ""
-COMPATIBLE_MACHINE_gem5_arm64 = "gem5-arm64"
+COMPATIBLE_MACHINE = "gem5-arm64"
 
 # no configure step
 do_configure[noexec] = "1"
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
index ffbc2da..dcf45fb 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
@@ -1,16 +1,17 @@
 # gem5 custom bootloader
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
+# The recipe is currently using a version in the development branch of gem5
+# until version 20 with python3 support is released
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
+
 PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "bcf041f257623e5c9e77d35b7531bae59edc0423"
+SRCREV = "0c7f131ed2ce008e8d17aa8530f790f934242713"
 
 BPN = "gem5-aarch64-bootloader"
 
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
index 362a8e0..b97a1b2 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
@@ -9,14 +9,9 @@ DEPENDS = "gem5-aarch64-native"
 do_configure[noexec] = "1"
 
 do_compile() {
-    # Gem5 is requiring a non zero size disk even though it is not required to
-    # generate the dtb. Use /proc/version as disk file.
-
     # generate a dtb using gem5
     gem5.opt \
         ${STAGING_DATADIR_NATIVE}/gem5/configs/example/arm/baremetal.py \
-        --disk-image /proc/version \
-        --kernel "" \
         --dtb-gen
 
     if [ ! -f m5out/system.dtb ]; then
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
index 9c77121..1dc91ab 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
@@ -3,13 +3,15 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https"
+# The recipe is currently using a version in the development branch of gem5
+# until version 20 with python3 support is released
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
 
 PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "bcf041f257623e5c9e77d35b7531bae59edc0423"
+SRCREV = "0c7f131ed2ce008e8d17aa8530f790f934242713"
 
 BPN = "gem5-aarch64-native"
 
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
index 4b02d13..429e18c 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
@@ -11,30 +11,29 @@ GEM5_BUILD_CONFIGS ?= "build/X86/gem5.opt"
 
 # Scons build arguments
 GEM5_SCONS_ARGS ?= "-j ${BB_NUMBER_THREADS} CC=${BUILD_CC} CXX=${BUILD_CXX} \
-    AS=${BUILD_AS} AR=${BUILD_AR} ${GEM5_BUILD_CONFIGS}"
+    AS=${BUILD_AS} AR=${BUILD_AR} ${GEM5_BUILD_CONFIGS} \
+    PYTHON_CONFIG=python3-config"
 
 # Default profile to run
 GEM5_RUN_PROFILE ?= "configs/example/fs.py"
 
-# We are building a native package and we need to use python
-inherit native pythonnative
+# We are building a native package and we need to use scons
+inherit native scons
 
 # the build is using several tools:
-# python: scons and six
+# python3: scons and six
 # google protobuf
 # pkgconfig
 # hdf5
-DEPENDS += "python-native python-scons-native python-six-native \
-    protobuf-native hdf5-native pkgconfig-native boost-native libpng-native"
+DEPENDS += "python3-six-native protobuf-native hdf5-native pkgconfig-native \
+    boost-native libpng-native"
 
-do_configure[noexec] = "1"
+EXTRA_OESCONS = "${GEM5_SCONS_ARGS}"
 
-do_compile() {
+do_compile_prepend() {
     # We need to use the proper native libraries when executing
     # compiled applications
     export LD_LIBRARY_PATH="${STAGING_LIBDIR_NATIVE}"
-
-    scons ${GEM5_SCONS_ARGS}
 }
 
 do_install() {
@@ -58,5 +57,5 @@ EOF
 
 FILES_${PN} = "${datadir}/gem5/* ${bindir}/*"
 INSANE_SKIP_${PN} += "already-stripped"
-RDEPENDS_${PN} += "python-native hdf5-native protobuf-native libpng-native"
+RDEPENDS_${PN} += "python3-native hdf5-native protobuf-native libpng-native"
 
diff --git a/meta-arm-bsp/recipes-devtools/python/README b/meta-arm-bsp/recipes-devtools/python/README
deleted file mode 100644
index b80c757..0000000
--- a/meta-arm-bsp/recipes-devtools/python/README
+++ /dev/null
@@ -1,4 +0,0 @@
-This is added for Gem5 compilation with Zeus as it has been removed from
-OpenEmbedded (and Gem5 needs scons to be compiled).
-
-This should be removed once Gem5 supports properly python3.
diff --git a/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
deleted file mode 100644
index 68b63c9..0000000
--- a/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-scons_${PV}.bb
-inherit native pythonnative
-DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
-
-do_install_append() {
-    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
-}
diff --git a/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb b/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
deleted file mode 100644
index d5084b2..0000000
--- a/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Software Construction tool (make/autotools replacement)"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
-
-SRC_URI[md5sum] = "b6a292e251b34b82c203b56cfa3968b3"
-SRC_URI[sha256sum] = "24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173"
-
-UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-  python-fcntl \
-  python-io \
-  python-json \
-  python-subprocess \
-  python-shell \
-  python-pprint \
-  "
-- 
2.17.1

