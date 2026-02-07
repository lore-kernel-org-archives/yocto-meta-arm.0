Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7306DEE6B70
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 00:41:20 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54.1770424878375256182
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 16:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=UlZ61em3;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.64, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0U65zVl02Y7WywjFb+bnyFrXyv147p4XwQBY9tFy8vrY8gowGVbc09HvVXjWgzsaCXd+yTkx7S6uZ9qejomnVNwUl2WdDEXQpgxQktF/uO4fvOaHL/foULA2A4p3xV4yH3gmDdMNPcD54V4+6lOzKfYfJr1ltUNQYcr8EOmknVgV9QJIjBruOW1kPB3EPlJ1TdV4r9B+rVh/skpA8V1V0/t+IdlqD0a4DgT2XKxOjvj1/03RQ9mPlOBwSgKvCXKWQShCmJ97N5wkmNOvxTAt9Bkvbm8e+5ai9ACDV9sgUx29XW0BYFVFGp+sofuTFZgM4rcJJG8xQ7I/Pa0KmJ2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+rFHe/0MUWCNGxOVkvj3u9Km/i7XRRhvm+77ZXKrO8=;
 b=K11ZVD4KVDnNOtx3TjkXOfuV2ZeDEF70f3TW3vfVYiipkjxGhFxQ37oMhab1OAmwP8U8XDzNiB3Ny0EMEs5XIQ7K+r30qUoEmq3V1L3u/yrVFbNfg5UUUgCWWrpAjSdAI5+CG34WLVnPVXCWni/qdN1R/OhZ1O/zgYIcbe5qhcUjzj6Edwlp5ZyNKvc2K/5pi/5u7ekBabjB7GSavEx+j7iapEK0VgRM9bgVLxgp6cR8ytGBdH3Adu87obfnj5GvqV8Ny8wRANG8Nfdt/Iuqj/jnT4oN6xBgpG5T/TmjtV2pqlvs9MXA9zwNjFq2gjTDfexc+b4Z+ZEpxB8gPEI8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+rFHe/0MUWCNGxOVkvj3u9Km/i7XRRhvm+77ZXKrO8=;
 b=UlZ61em3+IY91JX/DzK95d1QUTXXzvTIPotipnzLGsHit6C5+IG1LtrBs7f1SBnTHojbe2LGGbXyr4Sv3/L4Wi267qBxDhrK+sOQJP9Mfe4tvmFTTYoLZQYo6SvXbnxQMxX8zAIFuUE1UFKyqiwKE6eoF4Em6jeqY0UVTXERzkY=
Received: from AS4P191CA0041.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::14)
 by VI1PR06MB6432.eurprd06.prod.outlook.com (2603:10a6:800:11e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Sat, 7 Feb
 2026 00:41:12 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:657:cafe::d7) by AS4P191CA0041.outlook.office365.com
 (2603:10a6:20b:657::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Sat,
 7 Feb 2026 00:41:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Sat, 7 Feb 2026 00:41:10 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 7 Feb 2026 01:41:10 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: meta-arm@lists.yoctoproject.org,
	jon.mason@arm.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH] meta-arm: fixup new override syntax usage
Date: Sat,  7 Feb 2026 00:41:09 +0000
Message-ID: <20260207004109.2880231-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 07 Feb 2026 00:41:10.0593 (UTC) FILETIME=[74605310:01DC97CA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AD:EE_|VI1PR06MB6432:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ca584cd-24cc-4944-b5f0-08de65e196fb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|30052699003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pAmG91lBunZe1e+LdPaf2t691jeDz//xPiTBNSN+ddh7v+7n7+S9if9xOuAq?=
 =?us-ascii?Q?mUx0cHdwanMZS6lCdieLFPlZdFpyga7vwo1MPQxtGkVWBNkivAZmkqRX8ASN?=
 =?us-ascii?Q?aYAunZnuIQeNsqhLrkuf/dIvjh9+4AVOg4bWc9RCk+dnn+MDvIfGbaIZ/a94?=
 =?us-ascii?Q?QxQX630CCco2HW3BiH4i6hll3wn8KT24au9XZuGTS9lxbxHW/dztJGHMUWrM?=
 =?us-ascii?Q?8Mt3O2485AcOBC7CkXf9oXgCawxbWRHtzYutqpuazW+/wBZtsZAhtu/nDIvT?=
 =?us-ascii?Q?buMWi/sYjyDMI1kuCx/nG1QvRJ0UNlkHEt5ZF2wtzk08FACVjAaXty2nFCfF?=
 =?us-ascii?Q?exVF+NwLb1ZGDLr57/DS3FTP1oyFaLWwQyOJXqLtC1yMPGCxbr8MKVg5bWr2?=
 =?us-ascii?Q?l3wAPTsW9RkIiv+MMgpTz2wzDy6QSqZ0ywrGbloeKqO2WoVdBBZecT8f/B5v?=
 =?us-ascii?Q?HP/9BL7Th4EXCDCopxSMYYDdo9O/DfIYZWybAD9k8/BeKHpMlgBDtwHbItan?=
 =?us-ascii?Q?d6eT2psY83nrok67nRpYINJ3kBTaqL9MWWTcx0cDTvyi4sPgi1RXmy1JKcnT?=
 =?us-ascii?Q?BRtvb48I4+vXH2/Dy2eJ3A59px+Jix3+uOoDhZve0GHOzKJktsbm8VS2A7mI?=
 =?us-ascii?Q?7MC4e6gu/2kdjOm/qXiAMq8kYKlApvGj2KMv7lVE3Jp6u7SNPEE0cyfU8HfU?=
 =?us-ascii?Q?GDuIyqFSYYbw1HFpLfriIJRBG3izW6I84Ng8t8zS3zttt/qDmnKsaqtQU62J?=
 =?us-ascii?Q?YM2Ht5icFx8AGpGpTZeGse48cLe9PnV6ydIGGjf9LYGZpPXF73irQpeLie0V?=
 =?us-ascii?Q?Mhq4BXmUR8jTH+phTlftjVs+LeOalGbIQbsNE8at/RR/ToPN12fml+RiONMy?=
 =?us-ascii?Q?5nbLw6rM9x6A9qbPvWGIlS+ZFOziJYKS20kMzFGjcCXeJbICzffgmyEN7zYI?=
 =?us-ascii?Q?ZEuF8Q5eai4Z2RKbqqu7vhYJMqyG+7D8t0qHpUJ6J1lvrd0jMjAvtXiNn+YM?=
 =?us-ascii?Q?k8wyILzAuSZx4Fvffwo9CivOQ/tdITD8tMFrvovr5gt5/IzGed/fDGqvyk6a?=
 =?us-ascii?Q?DWYdObg9+d6fkGLWX7xCRX0MQvl7nXz93Y/Te9Z4vvpjWwS0V3NXmN3BBtKb?=
 =?us-ascii?Q?KVlcjQkf+v15pFWjk9vViKUpt2nnCAXgnta2DwL3C/x19soKqD4/BaavAptv?=
 =?us-ascii?Q?qREnGxgHrGBq7xAMKa4eCVUTTFdttBf23WSD57SXjEM6pJQNHIrlFoXX1J6r?=
 =?us-ascii?Q?IZjG7X21vw6FVWecExZ3c0B0thZsWKC15cOsyIPcI5i+08SnsK/COjirdnT/?=
 =?us-ascii?Q?Ozw+vgLteeADLpauolStZWnI3A8Qd+/PS5kObwL8C66yjyyfEMMSEpqNy8bx?=
 =?us-ascii?Q?JJhFNvQyiH4Mv2Hq5yeZWB3sHz3CyIZJdt1anH3WwRVwMVwP73oAxq43nuf5?=
 =?us-ascii?Q?MsrudAFIHSBMUHmmBuP+ceDCL9AXt+QGXAqFDyjbySD6gGYjUqJgvVKeAEBK?=
 =?us-ascii?Q?sJebZlU77jZckFkJUUSQRFIZr3OtO7ot9L7NnPVpQvOGOoq0xjnnjEa4yQEF?=
 =?us-ascii?Q?7A8r2bkaxHGQfiJGXVFZqIf6p56V2adn1WK8687pAM2pkV4mCt4PHbl+RQXr?=
 =?us-ascii?Q?3CA35drWci27N2GWVgkK8ipNfd0F87TwOp1HmXiFmW2zZ64eQPNRLMxG+SaP?=
 =?us-ascii?Q?VMiDqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(30052699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O0mFkAQBOx79XE8c7lBH0a/NcBxwtfVu9ScKdAhn8pCLmqoIiTS5O7gMPJHQ9I69co/WTrQFsonUdGEN0lMwQJy3NaQQlpZu1feVeJKlbIZbFY4yh6AFaXwzDAi8HnQEDIT/9dO9+lyerY2spC8l8D+fth6Th1klXOL90fcMJlYSQbtdFNn6XY/TGnSoDRUm7DXQ7GUHjp7EHlLeT5UBj6qI6Wt2cra+Ls/4YDLfQrcIyIJw377VCVDgJE1T21WjZ4dgM8YOOHmIwv23p8ZPvmYIMJpovH7Ti65ys5yX/Hmf96Jf/u4gTKmJRmqUV9t4+IF/OWMCkiKg5AKyM7+L1kHP2HwOHG54+oVYLOcerGwZKBV7kLguseu2dCoxVUVp9GlAx5fj8/2gxfK2kJi+GvJndMzKEl1+V4AzeeASV+0H564P7MWI3Fc2ZiLNOMQX
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 00:41:10.7960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca584cd-24cc-4944-b5f0-08de65e196fb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6432
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 07 Feb 2026 00:41:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6891

The placing of ' ' in combination with inline python variable
expansion can lead to missing/skipping the license file checksum
verification.

Fix this by using '+=3D' (which itself adds a space) instead of :append
(which concatenates strings without inserting a space)

Fixes: 8dfdacd75c6c ("meta-arm: Convert to new override syntax")
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>

---

By chance we had an incorrect checksum set as
meta-geosurv-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-leica_2.=
13.bb
LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58=
af8d19bee1"

Which 'bitbake -e' would resolve correctly:

 # $LIC_FILES_CHKSUM [3 operations]
 #   set /workspace/layers/openembedded-core/meta/conf/documentation.conf:2=
68
 #     [doc] "Checksums of the license text in the recipe source code."
 #   :append /workspace/layers/meta-arm/meta-arm/recipes-bsp/trusted-firmwa=
re-a/trusted-firmware-a.inc:57
 #     "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDT=
LS}', '', d)}"
 #   append /workspace/layers/meta-geosurv-bsp/recipes-bsp/trusted-firmware=
-a/trusted-firmware-a-leica_2.13.bb:41
 #     "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1"
 # pre-expansion value:
 #   " file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58af8d19bee1${@bb.=
utils.contains('TFA_MBEDTLS', '1', ' ${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 LIC_FILES_CHKSUM=3D" file://docs/license.rst;md5=3D83b7626b8c7a37263c6a58a=
f8d19bee1"

Note the missing space in the pre-expansion value.

But the oe-core/meta/classes-global/license.bbclass check would miss.

This went unnoticed for a long time and over many clean-builds, as
it would only very rarily raise the QA error.

Sidenote:
I've looked over the meta-layer, but didn't spot any similar problems.

---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=
 b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 6a2c0da9..987b7a66 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -49,10 +49,10 @@ SRC_URI_MBEDTLS ??=3D ""
 # This should be set to MBEDTLS LIC FILES checksum
 LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
 # add MBEDTLS to our sources if activated
-SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_M=
BEDTLS}', '', d)}"
+SRC_URI +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI_MBEDTLS}=
', '', d)}"
 # Update license variables
 LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-2.=
0', '', d)}"
-LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' ${=
LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
+LIC_FILES_CHKSUM +=3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '${LIC_FIL=
ES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
 SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedt=
ls', '', d)}"


base-commit: be599f9523c5784904274cec12596ae31e20121f
--=20
2.43.0


