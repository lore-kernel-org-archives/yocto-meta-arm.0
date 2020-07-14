Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.48])
 by mx.groups.io with SMTP id smtpd.web12.18938.1594731544124202465
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 05:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Vj4SXvPT;
 spf=pass (domain: arm.com, ip: 40.107.8.48, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P9ZeXf9HnKI+oGigNPL5xT+eadfKpjmpZ3RcH0+b20=;
 b=Vj4SXvPTjiSg3fSBA8xg1UmyX5YHKisk7wNACPA5QzXcyTyCBUzrBQ3dCO4kMJWmG6KmCbRwIJzwnvFXa/MNZGd8drav+heLCFy/hCeS8dMP+HzV67MEtsFXI/cBmz2eHeYXLamIXe+5OK/e7rHf/FfN9BYkX7//I7BagN+m6r0=
Received: from AM3PR04CA0134.eurprd04.prod.outlook.com (2603:10a6:207::18) by
 DB6PR0801MB2119.eurprd08.prod.outlook.com (2603:10a6:4:34::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22; Tue, 14 Jul 2020 12:59:00 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:0:cafe::70) by AM3PR04CA0134.outlook.office365.com
 (2603:10a6:207::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Tue, 14 Jul 2020 12:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 12:58:59 +0000
Received: ("Tessian outbound 7de93d801f24:v62"); Tue, 14 Jul 2020 12:58:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a00c9987d1f2b9d
X-CR-MTA-TID: 64aa7808
Received: from d6f7a1fce508.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B36DC724-1FED-42EB-BA3A-853F987C2DC3.1;
	Tue, 14 Jul 2020 12:58:54 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6f7a1fce508.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Jul 2020 12:58:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gouEDsklknWC9b06dPsIpHGFj8HvKIyWpJQn5XjNU/gz4M10sgfvAJ4wEKaF1eVkm6rxYIEAXivFpErhEy2T388s5Oe/5VNkOz3yX9ad3/PfpireN+zLKzRjiEFo6A+Nld9zEUOn5DY2aPJ/FsLODEkiVG0R7i1fJpRmGqWi9ihkSQXiqNdFFPfWHUNS32DTCR+aNxA9ELfBBH8uU9N3fzPibET+wXEMHylWYwipr07XTmYiL97Z0E4nTU54U/leKlC+yN5WzNateKHXOlZJRAjS9euVHO/qiIBl0PiBZZSfrwicYTxe0rTAOsJGc2q91NfJcI+GhoZ5Peh9c8aY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P9ZeXf9HnKI+oGigNPL5xT+eadfKpjmpZ3RcH0+b20=;
 b=fsh+NXWTf2rhyNXGSwPt6BcmVes3J44f+1kFuiYDlomGRmNrArcKgYHyUEXSrVi3oBpyhxnfca7uddZ4nl51Cpcndm/mFa1jNOAQvs1uL4LWIYn/GVnH1YxyQOvY3o0CanIVF20WJvlTjbaXKJMZRL4lI+Dcg1apFcgGvIrqtmy6OLpYS/ymvnzmiN5axjUrCdwi3WZlr0JD80Fk8ak+x6ScOGg5bmzZuP9WykGW2Z5B8CfVsS+EabglD8+0oSpc24OBgZf2GL+D8ytWpcUKfkHc2YZuEv3yZrsnGn3KKCYss3S/kvolNBjBoT8m9ikMHyi3eWKan9aMCfMvqDmbuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P9ZeXf9HnKI+oGigNPL5xT+eadfKpjmpZ3RcH0+b20=;
 b=Vj4SXvPTjiSg3fSBA8xg1UmyX5YHKisk7wNACPA5QzXcyTyCBUzrBQ3dCO4kMJWmG6KmCbRwIJzwnvFXa/MNZGd8drav+heLCFy/hCeS8dMP+HzV67MEtsFXI/cBmz2eHeYXLamIXe+5OK/e7rHf/FfN9BYkX7//I7BagN+m6r0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com (2603:10a6:20b:a3::11)
 by AM6PR08MB3557.eurprd08.prod.outlook.com (2603:10a6:20b:4f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Tue, 14 Jul
 2020 12:58:53 +0000
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44]) by AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44%6]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 12:58:53 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] arm-bsp: Prepare to migrate linaro kernels to meta-kernel
Date: Tue, 14 Jul 2020 08:58:33 -0400
Message-Id: <20200714125834.31338-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714125834.31338-1-jon.mason@arm.com>
References: <20200714125834.31338-1-jon.mason@arm.com>
X-ClientProxiedBy: SN1PR12CA0094.namprd12.prod.outlook.com
 (2603:10b6:802:21::29) To AM6PR08MB3974.eurprd08.prod.outlook.com
 (2603:10a6:20b:a3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN1PR12CA0094.namprd12.prod.outlook.com (2603:10b6:802:21::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 12:58:51 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 14 Jul 2020 08:58:47 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 93154f71-5a1e-463e-3280-08d827f5ad40
X-MS-TrafficTypeDiagnostic: AM6PR08MB3557:|DB6PR0801MB2119:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB2119957D0376F8EFFE4E531CF0610@DB6PR0801MB2119.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:843;OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 COEKLhOYjyZp4YOm4j74tVbixKRFrQKUJwEB5diieq9G48Km/kY1doXyPDAYz+kgbd1gyOW/i8conHmU+GVFj/8lX3bmvdNxY25WlpS2BmwweSzZpo0rYr29LdJFleItB4GkUgHmcpUXoK4NJgKFREkV9TX1y+Ht0Wgp0VyFY0Y69Uc/y1fOxi4fMhp5WeINylm2WYinPDrrhan5ib9WErtT/vp6f80rvwSgKtfDOJUGtZ3LBsU5bVGJqkx5in+RYROWnX7UmuHv6DeK1QuoZjzz7Oc5U/cpDLWwgZMXj2Jh5dB/AsC/aGHVAnnBuYEQtyCoaIg3RjMSpe5a/BGEMvo1iteAy3wP+nSyMmEfa3najLlhFe0cqbBxIYbYGoT7xaIOJaMtCEoC0M0jN50rEQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(26005)(5660300002)(426003)(2616005)(66946007)(186003)(66556008)(8936002)(44832011)(8676002)(86362001)(66476007)(478600001)(52116002)(316002)(1076003)(36756003)(42186006)(83380400001)(6916009)(4326008)(2906002)(6666004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 fmP75cZPuo2JTXYICpw/CUwybzQBMlXdXPHXmKdYBon4R/Q+WhUGnFO8WtQ8g96EDTDRBmaa8P8KL6nPVBamA4A5Gw49qAhwulvdp0RXQP/Fz3pQjlN11G5OlXNYKJ2aAz1uBUzC/FRAIxEv3G/8N3Fhy0Jbd8NYHm4bl7/vUltNj2/GmKeLmY5qQxoA+OZodiZY84V0NwhZon1v2uZrFUzPe2ylFoN/pTwpH2qYafoYvpMOsHvTSHLQXhLQeLjG1fAD5lcC/wVjtEI+tSqfu6KFNnyApJvDGTFm0aWhy/LPq7aEiQJpuMB9Rnp+bNcZZVlJkxnuZni/lbqenztgqOwpGRuiq2IqdKiE8h0KxSxn0SHQfKeTAWbVH37swTA2rUJ2l/6lOCW4HL6qeWIOCOBWO2TH9qsZYBH9Zc6tiqfwrxj2UU3C7UVxGKxXj1AycIzula5jdkkJruQWZnan6V5LU6pPeNKbAcT9+guqCh8=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3557
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(6916009)(42186006)(316002)(36906005)(70206006)(36756003)(1076003)(186003)(5660300002)(82310400002)(478600001)(70586007)(336012)(83380400001)(2616005)(8936002)(8676002)(47076004)(356005)(26005)(2906002)(82740400003)(4326008)(44832011)(426003)(86362001)(6666004)(81166007)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ce88c888-534d-475c-1998-08d827f5a85e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WVdPs/BYke9sXDzt1Kh1pz/V+IOZZhM7JfeDmoVYn3a6bgDrG7DtK/bsOKoeqXxq95DnCyrfAmhz5annbQzId8aztYGIxkdEsgjtNpNd3AXVx0PiJqY1n1/S1OIzaRVCBbxzYqEDLUvv17Jb6ea4uB5GWM2BcYw0V0c5wOVHZk1UFhQ8XyAFnsihQAJIx3FrKVf5+cIx/2E/Q+GWbS3MQ+Bgm9yk1PJMyhVBQ7KNrp1E6GAiOVpbh3EJyAwElDY38SVLLU6kfm/O8wNicaVreKOzLMd+7oYxCpDz0x7eMZrxrvcWf81voZ7yknYRsYn6B10AcAzbgxA9i25QCOHtzfqfKDKWe9FSTOlQaJ34NXWFkPBHaFqUNKhhTTP7jlqKSUP6aWDMQ7yks002UA4sou7ikcFc/mjL0clcB+yoVk38dL/QAGp2LmVhHqAqeWop
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 12:58:59.9531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93154f71-5a1e-463e-3280-08d827f5ad40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2119
Content-Type: text/plain

Reorganize and clean-up the Linaro kernel recipes for migration to
meta-kernel.

Change-Id: I4291ae01b5679ee2c110b1deb38c963bde254177
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-linaro-arm.inc | 19 +++++++++++
 .../linux/linux-linaro-arm_4.19.bb            | 33 +++----------------
 .../linux/linux-linaro-arm_4.19.bbappend      | 10 +++++-
 .../linux/linux-linaro-arm_5.4.bb             | 26 ++++-----------
 .../linux/linux-linaro-arm_5.4.bbappend       |  2 +-
 5 files changed, 40 insertions(+), 50 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
new file mode 100644
index 0000000..1b8d4b2
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm.inc
@@ -0,0 +1,19 @@
+# Recipe for building linaro kernel
+
+SUMMARY = "Linux Kernel Upstream, supported by Arm/Linaro"
+SECTION = "kernel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
+
+inherit kernel
+inherit kernel-yocto
+
+SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;branch=${KBRANCH} \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=${KMETA_BRANCH};destsuffix=kernel-meta \
+           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch"
+
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
+LINUX_VERSION ?= "${PV}"
+S = "${WORKDIR}/git"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
index 089f6cb..df8ba4d 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
@@ -1,32 +1,7 @@
-# Recipe for building linaro provided kernel
+SRCREV ?= "e97e8d868aba53467039dbef3b7436c857433ae3"
+SRCREV_meta ?= "69022e62eb6c7046c84dace4af66ee8a30865865"
 
 KBRANCH ?= "latest-4.19-armlt-19.01"
+KMETA_BRANCH ?= "yocto-4.19"
 
-require recipes-kernel/linux/linux-yocto.inc
-
-
-SRCREV_machine ?= "e97e8d868aba53467039dbef3b7436c857433ae3"
-
-SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
-
-SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
-           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
-          "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.0"
-
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-
-PV = "${LINUX_VERSION}+git${SRCPV}"
-
-KMETA = "kernel-meta"
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+require linux-linaro-arm.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
index ed6fbc3..b1bc72e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
@@ -1,3 +1,11 @@
 # Add support for Arm Platforms (boards or simulators)
 
-require linux-yocto-arm-platforms.inc
+require linux-arm-platforms.inc
+
+KCONF_BSP_AUDIT_LEVEL = "2"
+
+# Functionality flags
+KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
+KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index 516573a..feed922 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -1,22 +1,10 @@
-# Add support for Arm Linaro Kernel 5.4 for Arm Platforms (boards or simulators)
+SRCREV ?= "41e8d7be674f98a0f3bef67b16ea2162109fd522"
+SRCREV_meta ?= "e32057eca987b7abbe3eb47ba36f06af8711278a"
 
-SUMMARY = "Linux Kernel Upstream, supported by Arm/Linaro"
-LICENSE = "GPLv2"
-SECTION = "kernel"
+# KBRANCH is set to n1sdp by default as there is no master or 5.4 branch on the repository
+KBRANCH ?= "n1sdp"
+KMETA_BRANCH ?= "yocto-5.4"
 
-require recipes-kernel/linux/linux-yocto.inc
+SRC_URI_append = " file://fix-bfd-link.patch"
 
-COMPATIBLE_MACHINE ?= "invalid"
-
-# KBRANCH is set to n1sdp by default as there is no master branch on the repository
-KBRANCH = "n1sdp"
-
-SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;nobranch=1 \
-           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
-           file://fix-bfd-link.patch \
-          "
-LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-
-# Refer to commit TAG N1SDP-2020.03.26 since it will not get force pushed
-SRCREV = "137cccb0843e63b031acf67d1ca4f6447b8c417c"
-LINUX_VERSION ?= "${PV}"
+require linux-linaro-arm.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index 0f516c7..dcc6e47 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -15,7 +15,7 @@ SRC_URI_append_n1sdp = " \
     "
 
 # Referring to commit TAG N1SDP-2020.03.26
-SRCREV_n1sdp  = "137cccb0843e63b031acf67d1ca4f6447b8c417c"
+SRCREV_n1sdp  = "41e8d7be674f98a0f3bef67b16ea2162109fd522"
 SRCREV_dts_n1sdp = "3209a868152f348194cc1f20fd87c759d3a97d45"
 
 # Use intree defconfig
-- 
2.17.1

