Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.web12.14586.1625000540252577002
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 14:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=m3x1x2E1;
 spf=permerror, err=parse error for token &{10 18 _spf4.garmin.com}: limit exceeded (domain: garmin.com, ip: 205.220.177.212, mailfrom: timothy.mertz@garmin.com)
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TKZMwT024594
	for <meta-arm@lists.yoctoproject.org>; Tue, 29 Jun 2021 16:02:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pps1; bh=1XlPRSfQF2QXkqlomEeP4Qw/cZiZOi5gKdzGZHrYaP8=;
 b=m3x1x2E1lJ0OKCMzrd2PXqa0MQw1Uc1XWKvzB9hGZq6RIjJpHfQ4lfcKfYOtETEgZ5E4
 75NIhc5wqMIxjwk58MaXLg+T5yac7Plqk0R0XyrWb/aeWJkFXemI2F+PogVCVVAQxmx2
 M6te3o4WRo7d0wArvtXSuogNpJt8xNiO0wmvt1XXye3ZNwgSWhUIuaqdIRXi8vdqnoMw
 zMIx9LliapLzLVGYlizI6ISSY9w4zvaj8FZlqEKqFYry93qv1KznoUL6I82wmnFgU8KA
 KQfE9j6L+CitXXuNwhwZi4t3lVuGDxpPS3nbwNVklDQsrOsGf7t0O5CmSMLtodZcIJVu wA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-000eb902.pphosted.com with ESMTP id 39f92hbh18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-arm@lists.yoctoproject.org>; Tue, 29 Jun 2021 16:02:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dv7y593zRxFt33ege+0Ldx1aVt3GUSy02vQOQh+J5d830j8ifFyzDCBYA3zFpTXErdK462vyf/WQmqnpeJdJ20me5OXNYmsR4VxmGnncOe9TSElh/iKeQvoz24VW/h/+DkZS3xZwgVgAHuKEfZRIih3U4VnDpAmbbsnNCAJftjXHPHSh/k8X6Cfxc+DumXh0HptHW2CelkbsU/rm+S2NUhFFIuqv2eAnFw7wig9eUzu7NpxQcbdj2HdWmTUkPzeNy462HNV4dABrNk1TwqIyXSxOIlAHjeFab4r/5g0ZVO8GHzKeKCjqGXzepDrhlZvGA7pKBEQEEFoa3gAJrhm8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XlPRSfQF2QXkqlomEeP4Qw/cZiZOi5gKdzGZHrYaP8=;
 b=SCAblMJVP1aILmqQD5wyeu0MT1nzI7DFleV0fbNougMekiZIi//jsneg4CBHW2SMutca03aBkDXuo3ZyNoGg8yaDwhhVWxSqIXLIbgmrDSFm8/C/ngdfqHljrEmTr1clvNAtTBRVIsm+lwaa/CrvRwOTj0uCcimBYxp8pGBtWlFBnzzzzITbfapmG5+9stlxYVcMWHtKubKSv9hl1CmbJGGPTbj5ZTR1VXtQHf7m0zlFZnVw36dm42E7OGJRibXtl+zh/xhfy5AK2Hv/QHNyatc7b+IQ8gQ4d/tzyFAgjSX53dzMAFHPWfJszIl4cQHqZzMUzcyW7cIZKnf3t/hUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XlPRSfQF2QXkqlomEeP4Qw/cZiZOi5gKdzGZHrYaP8=;
 b=MJRzVO4vu4mm7ch/tgpHL8fIz1zPT6oIrhHWUTwARup1LTkv/bif3nWxnWYArYPFMD2xgueKOzaip86inxjdO7iV2exwXJTZgKqSPiagE5lKXBAlO6imvm1y2zqb66pFiwi72rMqLCSrRmB6mw02oPm3rR3BeJ6t4XDsXSC2BBCrkCuI73pPlWz/8H52F94WWizSb2nUJaO5Q9lqTTTFIu3hEpIhzYo0BdS9EQ2RMYAThHKyboUtZAWuyzN91euHEWnvmCazVNq5V3VwE6P1poiDKp4V+w/h8W/FG1Le9e4EFT1AXkzQqc9LSasQiW52zcvkA+oZLskib0sK3YPuUQ==
Received: from MWHPR17CA0078.namprd17.prod.outlook.com (2603:10b6:300:c2::16)
 by MN2PR04MB5549.namprd04.prod.outlook.com (2603:10b6:208:db::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 21:02:17 +0000
Received: from MW2NAM10FT031.eop-nam10.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::c) by MWHPR17CA0078.outlook.office365.com
 (2603:10b6:300:c2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 21:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; lists.yoctoproject.org; dkim=none (message not
 signed) header.d=none;lists.yoctoproject.org; dmarc=pass action=none
 header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=olawpa-edge5.garmin.com;
Received: from olawpa-edge5.garmin.com (204.77.163.244) by
 MW2NAM10FT031.mail.protection.outlook.com (10.13.155.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 21:02:16 +0000
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 29 Jun 2021 16:02:10 -0500
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
 OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.10; Tue, 29 Jun 2021 16:02:15 -0500
Received: from OLA-8C2BN23.ad.garmin.com (10.5.84.15) by smtp.garmin.com
 (10.5.144.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P521) id 15.1.2242.10 via Frontend
 Transport; Tue, 29 Jun 2021 16:02:15 -0500
From: timothy.mertz@garmin.com
To: <meta-arm@lists.yoctoproject.org>
CC: Timothy Mertz <timothy.mertz@garmin.com>,
        Joshua Watt
	<Joshua.Watt@garmin.com>
Subject: [PATCH v2] external-arm-sdk-toolchain: Fix parsing error with INCOMPATIBLE_LICENSE
Date: Tue, 29 Jun 2021 16:02:07 -0500
Message-ID: <20210629210207.32008-1-timothy.mertz@garmin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511150609.15943-1-Joshua.Watt@garmin.com>
References: <20210511150609.15943-1-Joshua.Watt@garmin.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6d9faa3-6713-44f1-2b63-08d93b412d57
X-MS-TrafficTypeDiagnostic: MN2PR04MB5549:
X-Microsoft-Antispam-PRVS: 
	<MN2PR04MB5549C3E616AFEB468C2D6DBD8B029@MN2PR04MB5549.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:48;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QL/iWGvQQg0alrQWkSMlPENYIaeGMsseyu9WUlJwY827/AGrezyUg6ZLcqIK6KGcl9JsqKh4FXkfJZjyIDsUAC2dtcTetaIc450n6QnJnc1UJQTcChAHq7ethKxktutoSW1wlAJjhp/aXdEUUHsQccyG6vch4Gmw6N0PmqbzsW21/gYZrtTwLco67MWlDD76SKhbXKYqjR+saqx7nI4Lsc35Uu9ENu+b+FjG0/7Ny0dED4QzPdhs7m9pdKrLZjv8uew4LdMUsbor7fdHyqP5ZFwL7Fe9PpfBvZQBvBi1PY/wv0ofwqtdlC1qGGCPe5OT4d65tFYs5uz+0x/VLWpgXfXxG8GY1DuhyOojTkyH59aemCF6w4MkXCs+VWT04FoCAF4tk3+th/C8WxmTgEEamxz02Fh2ryN5D9MnxmA+mbq12/qFP+UXyyAe2ar1n8DgxLlIn7960BBH+qGftjHnMHMti9kiPvimH4zs8XbgUm0sR/uZYzRrcybs01MTB3pRG5aYl8xY8hm2OilURnKDYPhp55g/sTOmtTsCihbzNZYt/aqfbYuz1fAIT6Or0dP3f9Sw85JmNf5WDVkf147cK/iDlJ77ctnWIqq2mxasENDYbv9Fw64qOCF4btm4BuOLdM8Swk4PPTg/egj46bUg3ry8oyeXEctFQ6pHdR0dldWK8w89H/F0tynqSm+YtA+dIc6ooh+U0K9OA3wNEnR74g==
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:olawpa-edge5.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(39860400002)(346002)(136003)(396003)(376002)(46966006)(36840700001)(7636003)(336012)(36756003)(82310400003)(82740400003)(44832011)(2616005)(426003)(70206006)(36860700001)(83380400001)(356005)(47076005)(5660300002)(6666004)(1076003)(86362001)(70586007)(8936002)(8676002)(316002)(107886003)(7696005)(4326008)(478600001)(6916009)(54906003)(2906002)(186003)(26005);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 21:02:16.7687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d9faa3-6713-44f1-2b63-08d93b412d57
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[olawpa-edge5.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM10FT031.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5549
X-Proofpoint-ORIG-GUID: GqTjMupJAlZTFrE8Ol0XVPj5DIsINu0s
X-Proofpoint-GUID: GqTjMupJAlZTFrE8Ol0XVPj5DIsINu0s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_14:2021-06-29,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290128
Content-Type: text/plain

This change fixes parsing error that occurs when INCOMPATIBLE_LICENSE =
"GPLv3" by defining EAT_BFD_LICENSE, EAT_GDB_LICENSE and EAT_RLE_LICENSE
in license.inc and requiring it in external-arm-sdk-toolchain.bb

Definitions in external-arm-toolchain-versions.inc are made redundant so
they are removed.

Signed-off-by: Timothy Mertz <timothy.mertz@garmin.com>
Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
---
 .../include/external-arm-toolchain-versions.inc    | 14 --------------
 .../external-arm-sdk-toolchain.bb                  |  5 ++---
 .../external-arm-toolchain/license.inc             |  3 +++
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index 9d4f967..a89f2f0 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -139,19 +139,5 @@ python external_arm_toolchain_version_handler () {
     d.setVar('EAT_VER_KERNEL', eat_get_kernel_version(ld))
     d.setVar('EAT_VER_GDB', eat_get_gdb_version(ld))
     d.setVar('EAT_VER_BFD', eat_get_bfd_version(ld))
-
-    lc_libc = "LGPL-2.1"
-    lc_gcc = "GPL-3.0"
-    lc_rle = "GPL-3.0-with-GCC-exception"
-    lc_gdb = "GPL-3.0"
-    lc_bfd = "GPL-3.0"
-
-    d.setVar('EAT_LIBC_LICENSE', lc_libc)
-    d.setVar('EAT_GCC_LICENSE', lc_gcc)
-    d.setVar('EAT_RLE_LICENSE', lc_rle)
-    d.setVar('EAT_GDB_LICENSE', lc_gdb)
-    d.setVar('EAT_BFD_LICENSE', lc_bfd)
-
-    d.setVar('EAT_LICENSE', "%s & %s & %s & %s & %s" % (lc_libc, lc_gcc, lc_rle, lc_gdb, lc_bfd))
 }
 addhandler external_arm_toolchain_version_handler
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
index 3f12b4d..4f0adce 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
@@ -1,5 +1,7 @@
 inherit cross-canadian
 
+require license.inc
+
 PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
 BPN = "external-arm-sdk-toolchain"
 PV = "${EAT_VER_MAIN}"
@@ -10,9 +12,6 @@ INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_SHLIBS = "1"
 
-EAT_LICENSE ??= ""
-
-LICENSE = "${EAT_LICENSE}"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 # Skip packaging QA checks for prebuilt binaries
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
index b6ee42c..fcc9268 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
@@ -1,7 +1,10 @@
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3 & GPLv2 & LGPLv3 & LGPLv2.1 & LGPLv2"
 
+EAT_BFD_LICENSE = "GPL-3.0"
 EAT_GCC_LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+EAT_GDB_LICENSE = "GPL-3.0"
 EAT_LIBC_LICENSE = "GPLv2 & LGPLv2.1"
+EAT_RLE_LICENSE = "GPL-3.0-with-GCC-exception"
 
 LICENSE_${PN} = "${EAT_LIBC_LICENSE}"
 LICENSE_${PN}-dev = "${EAT_LIBC_LICENSE}"
-- 
2.17.1

