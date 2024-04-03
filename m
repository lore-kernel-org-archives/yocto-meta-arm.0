Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB0ECD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 16:39:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.99])
 by mx.groups.io with SMTP id smtpd.web10.16437.1712162342266998384
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Apr 2024 09:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=FCxhFF9s;
 spf=pass (domain: nxp.com, ip: 40.107.6.99, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+NqNRHqZOYmSRHAeiKc6I+7DomB9GRc+TX80wlkP43Dgkj1oV36qaUXP2QbYWQBYFOzwkwHKsjeMfx2i0PA5j4V0FeK4BLpP4nMR3Iw22dk4kAdGQy+wXyQsRq70Dr3T78/JALnVrUHu1WcT1ejmCul82CXqc7aUT9X1MNGMWnVbyLRm8VxlMQxDondqhDWDGsjwbuxUXadk4TAj57PdS8rb1lBblT8lvSS8Q8P4bS1RudpvOT0PH6WwT0KlAZgI2oOzThx2Z/CPTNfC+D9TgJzQbJhQSZrO+FWacIwyvMjGk2WRmOOZ8H38U7VUmspXFXo6OpXP4eZ6YCxTsDSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4fTnPs6aoKkNjc7a4nl+t714BpX5KMjK6viTVScW/A=;
 b=Ht2YDESao0gWUvd9Z0wedsGpq4f9Ivt1EwfCI1i0W50qLwIGqjYvLhWOZ2zsd9ZJG4Jz/yP2noUQevpW5FARswnZaRM9GNLPCxyvaEk8EoSsSoGdGbns3et8hoAUpgaEnV2Q4Tr/QZIyAXAdBUD7bfVph6EEIrsBfralMviDybkauSjnI40vcAd16gXcrcHtQhxfAzJkI5cwC6CdRHVocl/T4DcSrCrReWZ8S4BfDz3d11f+wjvap2QgHX5tcgP8ebjeg3NAETL9s03p72SMFzW/Zr5VHleqifMZsg0Kx+jHS7WmUHNcxCuekeft2yneFX9ekiqUZ163Q5PyMgj+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4fTnPs6aoKkNjc7a4nl+t714BpX5KMjK6viTVScW/A=;
 b=FCxhFF9syAP3gwWvQON7grNyY1VdVv/J0Y0N5MWfABERnZ16wKuxOBP/PT0pocRXWQuwRU1kK/CjY1pA5GFjoAspILGOz0NlUSTIJBZUIjVvGMb8qZ+HjGUqKDeYZ7otrsftPrYUo/wV75nhFT76dbDvYsrWKYnGLZG9D+rX3lc=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8818.eurprd04.prod.outlook.com (2603:10a6:20b:42d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 16:38:59 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 16:38:59 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: meta-arm@lists.yoctoproject.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH] arm/patrace: Add new package
Date: Wed,  3 Apr 2024 11:38:13 -0500
Message-ID: <20240403163814.1978415-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB8818:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BEl921gv9r5xo7Tm5InMQknf2vW2450JgHi7tAc8oEDOSuLr0i8MgyWn4YUN3ifN0tbQ0GTNGFua9xuPhaUoWuculWZ8dLdDu8tK3XHIrVOOr0s2B2m2lJPYIrkqDcIvl4n7JThMydnXMaNFL2Q+nwOGso1dPk21CygQ7aKHOqyaOB/bHvRbqZdEifK7ZwTOxtY1jaoSgku/dvthbP66WZDypP1HTaz/KkMDLgJl5j8GhkmrCj0QGo6FOXFkm8mhmW8mSZ9F4x24huiTqdI65YwpKcnoBNsIgCh52y2gU55wqdTV+vh2WWc/BxvmWo3OUfHeFRr0ximyTAyoRkgGSeuObgzPpOJxCnnnxYKKYtWMa9B3YLkOtCsvoYBZGC8djN8MEFgCM5itmDYTFsvkI0LB0DuC9+aSIEJkTa4KRAcMgGcJanhyB0dDabtuPvQBXK0X69qyfSwETeGyy1hfm79CtRKzZV+kLoWyiUSIub2VNptG1zzUGiLwPatFn62Qyucjn4Jkaxzt/3nsP5W6o7jLKzMIUrEDF4Tjo4TtKOiZR/pbaOt8hclMy84C8yYeviQcfyuBSax865rVf1V9bNrMz4s1ugeYZ7ag6nkarC6u1NQ0+hmUPAtgd4773yZQkHsobcYgTxCPKidmL7tRcnPcbeCTqE/bR1P8zYU6KlypRGQLYBRKNwuR9vj0qcAY8Jc6IitS15w0LlstZi+lkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tFnQl9rOJuA6xMQb90CQ4ffknnbdLgmEh/wxYRahIlqRg5JOyGT+hORrPOSx?=
 =?us-ascii?Q?my8sRuvLX7aP/0DL81FQEmbSFsudnsAhdAo7/TQsZi+IZDF0uYfojW7Wdgd1?=
 =?us-ascii?Q?HWpvI3fhTfrjDVToj97xrWXcNaccrhVSS5Xqq5AcPt4jJO4LHBlj3LaGORVT?=
 =?us-ascii?Q?7PtZ3+XRSFuumHELVk+piTS6bGd+hkykwjmh1489k1ozWejEPGiebaT0J5tI?=
 =?us-ascii?Q?9dixunSFloGfFr4fxeF8R/bCJZhLjsYPRV7nSbije+0xyqqkkfzYFQWc47eH?=
 =?us-ascii?Q?/pCH7SJ+DZI+2X+UBt5wdAgavKTIc1AcH4HlKuEpG5gJ4PPvU0FUZnEHSLFN?=
 =?us-ascii?Q?6x8AboCXIyOtaEJSaA668HZRfn8cXDkKBIB44kOZwBoT2KHAkj8fiM+g9mZV?=
 =?us-ascii?Q?SKMPz79bmGBfHqRAYRndtRclqt0MhWEsqdjMJhp388DLJv0E4grz9bINWoSX?=
 =?us-ascii?Q?f7pWlczZLAkMKRoGYtEBOkZNIKtr1VklyvslYczZQ4wqCHnzgt8eaUj1rktI?=
 =?us-ascii?Q?7/bBXb527DQ+zkzn36aiQNRDl3MSpajmcXCec+VE12Y6++qt1lDnPtuVnZNO?=
 =?us-ascii?Q?iLPMYmRbCNSNvVab656pCZ/P7dPu4rR406hoaYBlz/1UPnEgraKcdLSoyIvg?=
 =?us-ascii?Q?GmW7aGdjgNT56+S19S8M+/skTlxu63t/6zPKVpcyK/tFmiTUoFXaj1qKfQPy?=
 =?us-ascii?Q?8mR3iE55k27NfDDpGuMHTxU/TdL5acDTnhQkt6tegSwPsAi6EL+dnRYeGmfR?=
 =?us-ascii?Q?raf3FT7uifYpgTdS+G84y7oZqLdbvnIWvntyHvTArqcKgwjmQmfnXworBnCq?=
 =?us-ascii?Q?u/lyhU83h40CnIgYXVdW5iWrEyPujstc0GEWhHYhhDRvw//ZP7Wi7PRc+4nS?=
 =?us-ascii?Q?qoc4nc90T+CLt0c3KepXPqgBn+2pp71cLv1rVNr1wTP4O4h+JABi5U37P8FI?=
 =?us-ascii?Q?3NlU3GO2mioCdQ1K2p19Z9nNCuaXqBB13XrBscIpoIt+iRwlwQ3rnj/8p+pd?=
 =?us-ascii?Q?u8NdfZ5LfQdgz+3fddeqfDGb+yHo8XC+VoyveOYbMIJeSK7uXHZuI4tuhhhy?=
 =?us-ascii?Q?Z8EWXMExOCMZVgmRzB4rDrJoXu5K+o7wl8g4jtslmwIIY+T8yGp8gTAEJ2V/?=
 =?us-ascii?Q?P6iSh8ROZUBeUf7D1l1Xgf6b+zMXRIq9dNVARv4p49AJ73uOhHbIoZQbrkGb?=
 =?us-ascii?Q?L2qyEF5ExJ6ka7G3TKd7YYB70ud17XpEgzocKZ16s4X8yvWdFQf6abGKOt1/?=
 =?us-ascii?Q?gjLA4TIGdiylr8Otp7XKTqMb13SY7MvluBgEFsR8tRO/Iog02F+X1gZaO1Dq?=
 =?us-ascii?Q?mpg7Fn7/Aef+WKPL9d9hLlDczThMn9LlWrMXDKNnL6QcKeYZMN43AiY7U5dB?=
 =?us-ascii?Q?3w8sCBT2m/qu6VIbXIAAmifjpTqMOzkjt74RRgdDXxmghgbLWx9tIz3rGKzo?=
 =?us-ascii?Q?XnJdXYkTyWhmgte++9I/VoMHXVLt43qStri3GUbp55SvIBu/rOCgTjW9M0gZ?=
 =?us-ascii?Q?yd/VS31COvwmTZj79iRi1OFVr0+I/GfT9nKj2PWMF8XjozqNpG/0GVqiNloj?=
 =?us-ascii?Q?l7lIiJExsi1P8ZTZyYyRDF7NUyTzsfUKroSK+mBb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91abb5b-3ae6-4424-da2f-08dc53fc8fec
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 16:38:59.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1GgYO16oGjLybqmNy/LYOIvhu+Px9O5r9cdeFYtqA4m/Iqy3lxz0ToVELTW1tkEux1Fd4sjvOu+B71oOC0wuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8818
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Apr 2024 16:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5508

From: Tom Hochstein <tom.hochstein@oss.nxp.com>

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 ...001-CMakeLists.txt-Switch-to-python3.patch | 27 ++++++++++++++
 .../recipes-devtools/patrace/patrace_5.1.0.bb | 36 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/patrace/patrace/0001-CMakeLis=
ts.txt-Switch-to-python3.patch
 create mode 100644 meta-arm/recipes-devtools/patrace/patrace_5.1.0.bb

diff --git a/meta-arm/recipes-devtools/patrace/patrace/0001-CMakeLists.txt-=
Switch-to-python3.patch b/meta-arm/recipes-devtools/patrace/patrace/0001-CM=
akeLists.txt-Switch-to-python3.patch
new file mode 100644
index 00000000..8504443a
--- /dev/null
+++ b/meta-arm/recipes-devtools/patrace/patrace/0001-CMakeLists.txt-Switch-=
to-python3.patch
@@ -0,0 +1,27 @@
+From c6946a8f96a73fadf4ad1bc9b28cf5568feba473 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@oss.nxp.com>
+Date: Mon, 22 Jan 2024 17:34:17 -0600
+Subject: [PATCH] CMakeLists.txt: Switch to python3
+
+Upstream-Status: Pending
+Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
+---
+ patrace/project/cmake/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/patrace/project/cmake/CMakeLists.txt b/patrace/project/cmake/=
CMakeLists.txt
+index 8704beb..3edd4a9 100644
+--- a/patrace/project/cmake/CMakeLists.txt
++++ b/patrace/project/cmake/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ cmake_minimum_required (VERSION 2.8.4)
+=20
+ project (patrace)
+-set (PYTHON_EXECUTABLE python)
++set (PYTHON_EXECUTABLE python3)
+=20
+ message(STATUS "main ar: ${CMAKE_AR}")
+=20
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-devtools/patrace/patrace_5.1.0.bb b/meta-arm/=
recipes-devtools/patrace/patrace_5.1.0.bb
new file mode 100644
index 00000000..c95b0691
--- /dev/null
+++ b/meta-arm/recipes-devtools/patrace/patrace_5.1.0.bb
@@ -0,0 +1,36 @@
+SUMMARY =3D "Software for capturing GLES calls of an application"
+DESCRIPTION =3D "\
+PATrace is software for capturing GLES calls of an application and \
+replaying them on a different device, keeping the GPU workload the \
+same. It's similar to the open source Apitrace project, but optimised \
+for performance measurements."
+SECTION =3D "console/tools"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da1fcde5f6838616beb564260554a388=
f"
+DEPENDS =3D "wayland"
+
+SRC_URI =3D " \
+    gitsm://github.com/ARM-software/${BPN}.git;branch=3Dmaster;protocol=3D=
https \
+    file://0001-CMakeLists.txt-Switch-to-python3.patch"
+SRCREV =3D "06ab2eb1be315408f9ac652715f2f19c5c4b3182"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+OECMAKE_GENERATOR =3D "Unix Makefiles"
+
+OECMAKE_SOURCEPATH =3D "${S}/patrace/project/cmake"
+
+EXTRA_OECMAKE =3D " \
+    -DWINDOWSYSTEM=3Dwayland \
+    -DCMAKE_INSTALL_PREFIX:PATH=3D/opt/${BPN}"
+
+# FIXME: Don't ignore problems
+CFLAGS +=3D "-Wno-maybe-uninitialized"
+CXXFLAGS +=3D "-Wno-range-loop-construct -Wno-unused-variable"
+
+SOLIBS =3D ".so"
+FILES_SOLIBSDEV =3D ""
+
+FILES:${PN} =3D "/opt"
--=20
2.25.1


