Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.54])
 by mx.groups.io with SMTP id smtpd.web10.40841.1598613768333622675
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 04:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Kul+4iVR;
 spf=pass (domain: arm.com, ip: 40.107.7.54, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV7WFFzfLxnhTd17avVwYhUNehmaKkZLdi7j+rphX9w=;
 b=Kul+4iVRZyeLFFBv+2HESVlrpLvvGf1r9a2dDTQgUIyAjVZOvDkiRprt7qsqp0lSnCZWdYHK0seuuPTCCFnKz8VnM3b1faiDNzQDWGZPaG1sHWk0IEbMyFRFSZ12o0Q3VoqIlINM5xbYNQNkQTRAdBq+cd7x9pC6go0p24WNzcA=
Received: from DB6PR0601CA0021.eurprd06.prod.outlook.com (2603:10a6:4:7b::31)
 by HE1PR0802MB2185.eurprd08.prod.outlook.com (2603:10a6:3:ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 28 Aug
 2020 11:22:45 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::f7) by DB6PR0601CA0021.outlook.office365.com
 (2603:10a6:4:7b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 28 Aug 2020 11:22:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 11:22:44 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Fri, 28 Aug 2020 11:22:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d944086601b54540
X-CR-MTA-TID: 64aa7808
Received: from 7638f89250bc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9B788F31-B848-43DC-8B73-996546F56A07.1;
	Fri, 28 Aug 2020 11:22:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7638f89250bc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Aug 2020 11:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSmsEPDRhoM+TQbVWEpbICzX76m3sV43a2xz2rxwizkaqDFrk0dGpofHQWmLppX6xOfLQWpBssfy+QQHQdoF68/xGH0W18uEjbrVB6P4FVHYQ1HMMDBMGSIfGaXAHOPwiNf3f2YjRnpcC9zbR8mt7aeTKfUNgaSAmciT2FkhabU3TCapYEeeaF1d9Jap7mkXXgmQLJfjjcuhBidUPK/sPyCvYzATp/29oZ9Q1QYilE1FlTSrLmWbkdR+jb3Uw2uqGNcMDV4VMF88aUYARtLS2ZjxDk0ieh6+kENnTxEdQowL/p3Wro73RJ1YVJdlNAErw8EdLFRnLGCIDKO66shuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV7WFFzfLxnhTd17avVwYhUNehmaKkZLdi7j+rphX9w=;
 b=XQ9b0WNSRJuAq3EXRnV1Khx5qk07uRcQOcRYkj8BFk0LFfkMiGF3wCXOCzdQClB94sNkH0Y974Npfc7N9p7U22Ckk5qAKSc58ArPCCBrZ9HaIXy0fRKifJloc6bt1KlcoTfLpUyG0jBS1SD3gAvL54owrK/76jksSaIQuJdrxSJxQiX2RBiNr3H3GBUfc6oVmLli6PzZQ1SZV8pfzcqUKsnOLXX9QMt0SzXqvDUXymzauwyN0cp8whPZZB6dYPRlqzQGgrBi44rOxMCMeUiuiZwal+a+BJjIXQznx+KykrwXjxyrwrQ2TsCUppbmBuqBSHHvJKyUsCpDaDxy8mEFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MV7WFFzfLxnhTd17avVwYhUNehmaKkZLdi7j+rphX9w=;
 b=Kul+4iVRZyeLFFBv+2HESVlrpLvvGf1r9a2dDTQgUIyAjVZOvDkiRprt7qsqp0lSnCZWdYHK0seuuPTCCFnKz8VnM3b1faiDNzQDWGZPaG1sHWk0IEbMyFRFSZ12o0Q3VoqIlINM5xbYNQNkQTRAdBq+cd7x9pC6go0p24WNzcA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR08MB2645.eurprd08.prod.outlook.com (2603:10a6:6:24::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 28 Aug
 2020 11:22:16 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 11:22:16 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH 2/2] arm/kernel: Introduce 5.4 Android Common Kernel
Date: Fri, 28 Aug 2020 12:21:57 +0100
Message-Id: <20200828112157.33380-2-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828112157.33380-1-usama.arif@arm.com>
References: <20200828112157.33380-1-usama.arif@arm.com>
X-ClientProxiedBy: LNXP265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::19) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LNXP265CA0031.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 11:22:16 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d5a39203-daeb-4e90-b242-08d84b44af88
X-MS-TrafficTypeDiagnostic: DB6PR08MB2645:|HE1PR0802MB2185:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2185FF80E2C34185D60C641492520@HE1PR0802MB2185.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:221;OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IokfIq2BQktLx6alKmm4AyvckriAOiS7TIFpoGkkfIFcODAvDw7Dg2eJtzIIeigaL427iirsGsQqIhlAVJ0qg8Tbfa1TKyiivue33NhFIQld/LiHc8CHycpY2FSq9utx8wwvukmRV2BZ8LOCkv1FRdaKpZ1w2yeUb0MM5wecTlhkOEtsCFdmxuxC4QKwH+Cn+lWejvUdFHDBScUp8xESVqgmX7gGa4FghmN5mtr0GlDQlBGLebw0vRHz+CXL5zv+yKRRMBpPqf9HFEclf+uGLaB9vZmViUMoOOjqUh07WoGSvdORsdHBA1QHSPFpZN9k
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(956004)(52116002)(6916009)(83380400001)(316002)(2906002)(7696005)(16526019)(44832011)(8936002)(186003)(66946007)(478600001)(66476007)(26005)(8676002)(86362001)(2616005)(6486002)(5660300002)(4326008)(6666004)(66556008)(1076003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 j46p38x8jTRFBC3rLTkCXo5lV97sblY2g99NSSBboScVWH0iFkUtLByxODF+zHV2BgjlkWS1f9hzuswMYbE9EWjoWmo7eg9RvpodlMr4SHPt7TMF81iBL+C+l8Udhbf44lRcGJGMMoYiMastWWLrCflPkpZ+I3g+GEzMt3Sh43eFY1rkuZe6eRvnCOs0AXF6blTvs2DHhmC1le1MTn1juxzuh4mZ9y4ISbyRj9f84pv2RJpkySn9D/WadEanzZXg4iD3YYL6yN3LSK3hojb2eR/f+17X2kHdiZ4cQhkcrchLsr2P9UcW+0rU9EPANJdv7KyqInRkqVdFtv1O+ZoFQfD0CRLJKhxmdQ3XgT81p+sdTRFd8cGUyehOaZzGzrRn04sVjyb0sPXmdh+FxdSXIJBXmPlLMt8VoCH7HQrftUaPw4RAfL301DfirjTq60dOcSBnrYCy/DjYBPahVcvQEIUwSzvpjtKQZTMFPQs7V1k4oaLv7iCPY2b1H1DmhCixtFh467qewA17skoNGBEgtPUchVsqvHmTd+WlQ2CwJ38yIFpfMGd7iElqaNYAKGlECE8t/cM8Wqn7GUNtIRzMtNt4RRtf24ZS1KVkPZEl39uZBSxIkWhR/sDUJfu5q5oUW6c5Ws8Ng6MDTXOIPd0nJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2645
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de91d29e-23e1-409b-af2e-08d84b449e85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OhZdvGEDNfBzTGzb7RH9Rpk8nGXudk5eWuYcrze6nUQtN+6bbO1sU+bToIwWdARfiO4Tu4Yh6zH7xKCYYm5AT8YjkI/p+dad88PmheQPxFqSv9Z5nNVADXGmAHphrFmXkVmlSE1bGjpSDOY3w9xpQxN3B96Y4TH24X2YSMtdKYU3SCVC22YynEzo7+gzKEIpSy9Tw3r4y+O3y6hMh3XA65RUznkXLczchufV6RoUgqOo0nTXt27v96VYd98WAdSugUEYmc/X6E5lktqsWF4IXmtroRWyfSeU81rrPe70Ve2bXrL5pkNfQZDxXkPQuv/cIFNr6JZcvvwWIXkCXo37wmzvUSMeJp4GLrV91xw7RKciB1Ojkr6LuLI/J7cEGCQ9/dGKwY6oIJI4TcWpv7+s5g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(6666004)(8936002)(1076003)(8676002)(5660300002)(6486002)(86362001)(26005)(316002)(36756003)(356005)(16526019)(186003)(82310400002)(478600001)(83380400001)(82740400003)(2906002)(44832011)(336012)(70206006)(2616005)(4326008)(956004)(70586007)(47076004)(81166007)(7696005)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 11:22:44.7685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a39203-daeb-4e90-b242-08d84b44af88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2185
Content-Type: text/plain

This recipe targets machines based on arm64. The patch
also adds an .inc file to for common code between different
ACK recipes.

The base commit is based on tag refs/tags/ASB-2020-06-05_5.4-stable

Change-Id: I5b5f1eeb8336910355fc9880670c729453a8096a
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 .../linux/linux-arm64-ack_5.4.bbappend        |  3 +++
 .../recipes-kernel/linux/linux-arm64-ack.inc  | 21 +++++++++++++++++++
 .../linux/linux-arm64-ack_4.19.bb             | 18 +---------------
 .../linux/linux-arm64-ack_5.4.bb              | 12 +++++++++++
 4 files changed, 37 insertions(+), 17 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend
new file mode 100644
index 0000000..f765661
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_5.4.bbappend
@@ -0,0 +1,3 @@
+# Machine specific configurations
+
+require linux-arm-platforms.inc
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
new file mode 100644
index 0000000..a9d561b
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack.inc
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: Apache-2.0
+#
+# Copyright (c) 2020 Arm Limited
+#
+
+DESCRIPTION = "Linux Android Common Kernel"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+COMPATIBLE_MACHINE ?= "invalid"
+
+ARCH = "arm64"
+
+S = "${WORKDIR}/git"
+
+LINUX_VERSION ?= "${PV}"
+KERNEL_VERSION_SANITY_SKIP = "1"
+KBRANCH = ""
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
index 4eb17e2..989b055 100644
--- a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
@@ -2,17 +2,7 @@
 #
 # Copyright (c) 2020 Arm Limited
 #
-
-DESCRIPTION = "Linux Android Common Kernel"
-SECTION = "kernel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-require recipes-kernel/linux/linux-yocto.inc
-
-COMPATIBLE_MACHINE ?= "invalid"
-
-ARCH = "arm64"
+require linux-arm64-ack.inc
 
 SRC_URI = " \
     git://android.googlesource.com/kernel/common.git;protocol=https;branch=android-4.19-q-release \
@@ -20,9 +10,3 @@ SRC_URI = " \
 
 # ASB-2020-06-05_4.19-q-release tag commit
 SRCREV = "ebd43352dd92e56f14a4985a3c99de767fc8f9cf"
-
-S = "${WORKDIR}/git"
-
-LINUX_VERSION ?= "${PV}"
-KERNEL_VERSION_SANITY_SKIP = "1"
-KBRANCH = ""
diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
new file mode 100644
index 0000000..908873d
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_5.4.bb
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: Apache-2.0
+#
+# Copyright (c) 2020 Arm Limited
+#
+require linux-arm64-ack.inc
+
+SRC_URI = " \
+    git://android.googlesource.com/kernel/common.git;protocol=https;branch=android-5.4-stable \
+    "
+
+# ASB-2020-06-05_5.4-stable tag commit
+SRCREV = "2068976fd7b172b64020006efde1ee57af6bbf99"
-- 
2.17.1

