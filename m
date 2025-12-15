Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABF7D5B864
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 19:30:50 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3224.1765827043738638479
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 11:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VMkp7fi7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.36, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROfzGt6w+IY3VDli4kC8axjcjHWbUImvsXmKOjlAcZwQyp9vPX3YhfOcA1APe2ds+fUt6lWnhjnLtVfE58mLYyCeFLSKXOqrtnhSdsvRFk8LlOAwBxH3PiswVRADT/9KvNt4KdsCMG62CJHl85DYHH/WiW83eM0sIgMbrkUo3tm79df6W2cso2Lpj3JoE3zNKikVKzUrTowBpLA3uMDk8iHkCREQ9f8KW9NFZK5u/RbOcs9TJ8rE8qmdWVZHgIybrWOuo1DKrvTigxIAD30FX0p9EBjxvpp8ayJl9Iib1XNr3SCK4t6Hq3iM230IGcq7/UJYfeSsGGqv37AvQFmX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FukQgXIEGDsDpn08GfV5/qc88snTWiOWxEItVp1BcG8=;
 b=BzOrvgTq0BNPVpm3a33jqexms15p9dXkj8wOtn2o1ypywrH9TycwwkHYEMI91wU55nRQ70zyylojteXAL3jWTjdJpsiVevVR5wWeW4K+5mb6tSPWYTvd2+qeeZOG+p3CQNF/F0oz5MJYtEeOyPFq1F5JeNoFgqCx/O6brbTUPBwLw1ZTZOGoTW8vSgkkDHsdCVPJ27+ycJvW43zB+hWW4Y1tI9i+HA3hzkS9u2Ixb6yvtNEKmcvmhFvfwMSvyNbmwbnQRHihwhj8FdJRXHSsthX7YM/roPvVrxZzwcHHm4VpQ3tFuSw4SnDT/KbbL2Oie6lRC5bNDpNm0l3n9jMqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FukQgXIEGDsDpn08GfV5/qc88snTWiOWxEItVp1BcG8=;
 b=VMkp7fi7tna8EZu6BN2uPZaJve0fQqKmnNq9L/4COv3E8tf923P3w2oEb0c7sgC+DXXgOz/U1P6sD8Jl1uA7seruaFG6Hm0lQXrvrfJpSiJRVoEn2GwxSgCXOUd7TvTJMOCdcv5krRuNBdtkVLzlQXMdmtFUTlIulCu/EMVftjI=
Received: from PH7P220CA0031.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::32)
 by BN0PR10MB4903.namprd10.prod.outlook.com (2603:10b6:408:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:30:41 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:510:32b::4) by PH7P220CA0031.outlook.office365.com
 (2603:10b6:510:32b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 19:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 19:30:40 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 13:25:32 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 13:25:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 13:25:32 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFJPWwp2943104
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 13:25:32 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vVECK-0000000BmWN-1kzM
	for meta-arm@lists.yoctoproject.org;
	Mon, 15 Dec 2025 13:25:32 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <meta-arm@lists.yoctoproject.org>
Subject: [meta-arm][PATCH] arm/trusted-firmware-a: Add TFA_INSTALL_SUFFIX to install targets
Date: Mon, 15 Dec 2025 13:25:32 -0600
Message-ID: <20251215192532.2808116-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|BN0PR10MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 6699c332-e3aa-4e89-e593-08de3c106ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jfMifI9yo5lNrunTCEAtxbPvSssx/oMxxLyZwXkoA6AK1U/c6yWY2OPGu5fS?=
 =?us-ascii?Q?NpsjyPoRAksWJr+TDPdJunBSzL0PuYr3WGLy30qB2HbYrRJwgNicKMYVXJ5W?=
 =?us-ascii?Q?kwEMAjrwi47DIjUrBAKuagD1m3QNDFQDrS9+7CpZMyJyoZrj8OJ7ZjlYgaJc?=
 =?us-ascii?Q?zDK3Pg843L5iplrdb4oOS2opeoi8zmjlYO/r681dqMIJrSwLiyJg6+DjWban?=
 =?us-ascii?Q?/GJjZZeo9dME+zoMautPMeNetTwhuvB8ZEU38FE4sHaAGvSXJOxxUqWnYklQ?=
 =?us-ascii?Q?gSkAOPLJI3Sju9+18UshGEWUi1St71TYAw2Rx2Qrny0u6lPZfQSlYN9MVUGB?=
 =?us-ascii?Q?YUS1Ir3OjZ1j+XH0oadbwDQnZmiQmpiP+FjE9aLBCEJ6eiSMEolkHuD8759u?=
 =?us-ascii?Q?N191ZhXZdJ2G3YA/bCA9NaXbxKJP8giyQA+tHtT2EiToHGOFt6Sy0I5y7O8z?=
 =?us-ascii?Q?ClFg6J7DmMoggA3LNrTqgv7Kfe2iEUwIj37Rl7+ekEgKfVkTc1sDWvLPZPrJ?=
 =?us-ascii?Q?BNZnm/5wzMr/sFneJ4Exu4mWINf3xrm4R+PBxVfYaScgbUlWW6mYuOe8UupW?=
 =?us-ascii?Q?8i/JNsi4M6ocOQx3CaqQqIOrJGAZygLgG3vFYfowMrd1PPeZzTYswpSvC8Ir?=
 =?us-ascii?Q?D4+uDIbfEU65UifhRN6WRc0dEZtO7VK53RC+aFUmSR0yCp+knggBTMx4okx5?=
 =?us-ascii?Q?bKqZ6Q7ucEVAB2hz9N5KeO6xkr7T/O0Ij5QjJFRvKsDm52kXOSR9+jx7GdgJ?=
 =?us-ascii?Q?TFzs68QbQroAfiNUkr3VYGYEm+ffYuPX5Es6L7ODJKVYfRluiMHcKV94S7DJ?=
 =?us-ascii?Q?NPGHE6j5LlsEGaNbie60BsRixAqX34yqM5vcS7eNcpvCVNifIGS4ADFOYVHP?=
 =?us-ascii?Q?dD+D10zGAnQGLctOGPn6exaznfpopwJiaieK9O8LUi0ogltcLrMs+O5CjpwE?=
 =?us-ascii?Q?pSFyLkd2l7lXXtVxKeCpswDLKv2s8s08nhiS+QYq6bo0OB8gpZoHX7EUmFm3?=
 =?us-ascii?Q?J5Pg9dcqmyDuASmbANenlw29ThNEK25VCfin3m+gyxi5+ynbatdR48oqn8G4?=
 =?us-ascii?Q?hCtaJPvRg+y2Ax4aSFp6pbVwZiaHBi9zaoqXVS4OO76GiUJda+pnLM8G2io9?=
 =?us-ascii?Q?CNNvOP5lipOfLw2FMKWbmLOy6wZCebUkITGOsRaDfqlo6FRn8+B+WARjlmH6?=
 =?us-ascii?Q?6A8G8WmhI0ezAkH5INlurDziV5MyX5Xf0re2Cpz/IK2bfKR8vxm4BohqTpMr?=
 =?us-ascii?Q?xKIrsRsNGLObaZXwWvIzelVSNuCz2X6dBN38LFw0ewhbf6/8s1EDizbs2cy7?=
 =?us-ascii?Q?dp1FNLZoYCTN1eci7+9WVnGFUUmIszK/98/B7eHZJPAfsDJXK0a6pHJ9pXZF?=
 =?us-ascii?Q?jZbY3PJT9L0qx+bcddj6UsKmF4BYuAEosOsjyXWCkV0ehpiQaqCj3S7gKxMj?=
 =?us-ascii?Q?b03pxV63QsDjUiDNbuDYegcjpAWId4CBtr0rrebGdsij5kKxs9jokAE8Z7yb?=
 =?us-ascii?Q?UFo8D+ekwrHy9JqNT6GzHq1ILNkB34TRSlyg6IMoL7JhHFxV/VEUAbGh0Ogp?=
 =?us-ascii?Q?JSG4McnAvigfmLC9s14=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:30:40.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6699c332-e3aa-4e89-e593-08de3c106ed4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4903
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 19:30:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6800

There are times where we need to produce multiple versions of the
trusted-firmed binaries in a given build, but the names for the binaries
are hard-coded in the Makefile and do_install().

This patch adds a new variable, TFA_INSTALL_SUFFIX, that is added to
do_install() that can uniquely name the resulting binaries.  By default,
the suffix is empty so that default behavior is not changed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../trusted-firmware-a/trusted-firmware-a.inc | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=
 b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 1e2120ae..983f48e3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -76,6 +76,11 @@ TFA_BUILD_TARGET ?=3D "bl1"
 # variable. It is set by default to TFA_BUILD_TARGET
 TFA_INSTALL_TARGET ?=3D "${TFA_BUILD_TARGET}"
=20
+# How to name installed files
+# If we need to uniquely name the files that are produced, we can add
+# TFA_INSTALL_SUFFIX to all targets.  By default, set to "" for no suffix.
+TFA_INSTALL_SUFFIX ?=3D ""
+
 # Requires CROSS_COMPILE set by hand as there is no configure script
 export CROSS_COMPILE =3D "${TARGET_PREFIX}"
=20
@@ -194,28 +199,28 @@ do_install() {
         if [ -f ${BUILD_DIR}/$atfbin.bin ]; then
             echo "Install $atfbin.bin"
             install -m 0644 ${BUILD_DIR}/$atfbin.bin \
-                ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
-            ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
+                ${D}/firmware/$atfbin-${TFA_PLATFORM}${TFA_INSTALL_SUFFIX}=
.bin
+            ln -sf $atfbin-${TFA_PLATFORM}${TFA_INSTALL_SUFFIX}.bin ${D}/f=
irmware/$atfbin${TFA_INSTALL_SUFFIX}.bin
             processed=3D"1"
         fi
         if [ -f ${BUILD_DIR}/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
             install -m 0644 ${BUILD_DIR}/$atfbin/$atfbin.elf \
-                ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
-            ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
+                ${D}/firmware/$atfbin-${TFA_PLATFORM}${TFA_INSTALL_SUFFIX}=
.elf
+            ln -sf $atfbin-${TFA_PLATFORM}${TFA_INSTALL_SUFFIX}.elf ${D}/f=
irmware/$atfbin${TFA_INSTALL_SUFFIX}.elf
             processed=3D"1"
         fi
         if [ -f ${BUILD_DIR}/$atfbin ]; then
             echo "Install $atfbin"
             install -m 0644 ${BUILD_DIR}/$atfbin \
-                ${D}/firmware/$atfbin-${TFA_PLATFORM}
-            ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
+                ${D}/firmware/$atfbin-${TFA_PLATFORM}${TFA_INSTALL_SUFFIX}
+            ln -sf $atfbin-${TFA_PLATFORM}${TFA_INSTALL_SUFFIX} ${D}/firmw=
are/$atfbin${TFA_INSTALL_SUFFIX}
             processed=3D"1"
         fi
         if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
             echo "Install $atfbin.dtb"
             install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
-                "${D}/firmware/$atfbin.dtb"
+                "${D}/firmware/$atfbin${TFA_INSTALL_SUFFIX}.dtb"
             processed=3D"1"
         elif [ "$atfbin" =3D "dtbs" ]; then
             echo "dtbs install, skipped: set dtbs in TFA_INSTALL_TARGET"
--=20
2.43.0


