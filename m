Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.50])
 by mx.groups.io with SMTP id smtpd.web11.395.1591116731625389536
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 09:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IyL2aehK;
 spf=pass (domain: arm.com, ip: 40.107.13.50, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQj+P+gVkMh5KB5B6q7WuPrWBNZ42fVDgWwyPPlwD/8=;
 b=IyL2aehKhndr13h3ThXm66HAHlofxnabKqsFtsLomR1bmzu0bSipYHZevk9YsfmpUMpzg8n1QoMqIh6jMhoYk+fN8LVQ0XAV13SPVHzf16e1rQZLnOwgQLR73OtpYfR7FcmP7UfIovrxF/JExEHkgeeMcwnJNCZWxHg/fZLNSP0=
Received: from DB7PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:10:52::28)
 by AM6PR08MB3798.eurprd08.prod.outlook.com (2603:10a6:20b:82::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 16:52:09 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::a0) by DB7PR02CA0015.outlook.office365.com
 (2603:10a6:10:52::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18 via Frontend
 Transport; Tue, 2 Jun 2020 16:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Tue, 2 Jun 2020 16:52:08 +0000
Received: ("Tessian outbound b157666c5529:v57"); Tue, 02 Jun 2020 16:52:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c11d0b5b4e913ad7
X-CR-MTA-TID: 64aa7808
Received: from bee09cf18730.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E2BE8AB2-0376-42E8-AAAD-98800A7AF947.1;
	Tue, 02 Jun 2020 16:52:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bee09cf18730.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 02 Jun 2020 16:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hg/cnfJ42XkcdRMa4QQObexOxOKfUdp3Qi5HHIxZc3mRX9InhU/ZWRRJvYQtqWjFO21ciHxZDQBTkn8dsslE5RHaOyYwmaiGflNqbuklXrVj9Ryszze0f3W/Kpyc2pJyW/NEAZqCDgu2b7I/MZYpT036TS5jPD7SjoBWZt6eTfqeHL91XTKUdHe0nXPpziuLz0/NYim3z+qtiY7z65Ax9qYTkXYJZ8bxsrwDkRy4aExU/97XYpl8dM2CFm3/FfjVKtaOnvCRyCTgue0THnxfuiDlV3Jf3xk+TBRr0tqT6vAXlBpQnNy2nWryAVlHSM4WXBgWUr0YgbXxu48y+hccwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQj+P+gVkMh5KB5B6q7WuPrWBNZ42fVDgWwyPPlwD/8=;
 b=WPeb3uB5JgVKYBLuMyqTf/wOCZqvV6V32bsKYMvaMXtm2lr0kh06QCQFxNtntc4930F/sAF9JUF1RJzsXap3C1FJVdHTQ/uF+DqGB9J1H76RmR1dlenuNvJo+LvDx3J0F/j/EOFHZ8OvCuE5nB6HtAfUQ6ZJwe9q3iRCrcegOquZ/hjzLdL36S+09vCTXu0GoSvzo8NcHJp1EeP/KT6kl9hPK/srt2QdmiGDQyHZ0Pi3djNzwsXbmafqiLRQq7PSHJqlwUQwCyEhzcecd6wlzD3tfkty475ElCJODtX6s8S2qea2G6K5pJKAjxrkgNVpVdV9IzTq7fZDmOIHWFYazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQj+P+gVkMh5KB5B6q7WuPrWBNZ42fVDgWwyPPlwD/8=;
 b=IyL2aehKhndr13h3ThXm66HAHlofxnabKqsFtsLomR1bmzu0bSipYHZevk9YsfmpUMpzg8n1QoMqIh6jMhoYk+fN8LVQ0XAV13SPVHzf16e1rQZLnOwgQLR73OtpYfR7FcmP7UfIovrxF/JExEHkgeeMcwnJNCZWxHg/fZLNSP0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5034.eurprd08.prod.outlook.com (2603:10a6:10:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22; Tue, 2 Jun
 2020 16:52:01 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 16:52:01 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp: Add trusted firmware support for N1SDP
Date: Tue,  2 Jun 2020 17:51:52 +0100
Message-Id: <20200602165152.27514-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::17) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sudpau01.cambridge.arm.com (217.140.106.49) by LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21 via Frontend Transport; Tue, 2 Jun 2020 16:52:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fbbf1bc5-937c-4403-aacb-08d8071549dc
X-MS-TrafficTypeDiagnostic: DB8PR08MB5034:|AM6PR08MB3798:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB379825D6672745C5EAE8F0B0FA8B0@AM6PR08MB3798.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ktuawpW+PFbqHhge0fmLgA9iqwEtQWKLfxHMSVibt3LwOsfUGpADkSPgXX1IzGfvNOPuE8/ykyyIze1kIFH095BhhIAqGEm+w/eL+gUH9b2xuZVqqh+/oLFTsi60rLDAnNVl18NhSoxoQDDWGsp7a+aNRaHTggj3FPE3A+Tz/nAOr7mX8T9A6eIjlhk56GHmHfki+dWw0LUbL+aserEmpIyeI1aptC0k/Ymrh1l4q3/DdVreQKVKmq3RoQ3AMQfUaZhGx2qbYYoJhLGJ+FaQu3ykP8AYLVbv2jFbp15/mhYCxBv9y4XbgAKst0FE+2gYiTSdQu3y4h3AQpBEvPdvN5kKKEwv5mFFzFAcq5NFi7Ny496pMkNizK+AjGeAcP54tO0aib9JpOi+trPvKQDAhQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(956004)(2906002)(4326008)(2616005)(478600001)(36756003)(86362001)(66556008)(7696005)(26005)(8676002)(52116002)(6916009)(66946007)(66476007)(6666004)(8936002)(1076003)(316002)(83380400001)(5660300002)(16526019)(186003)(6486002)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 VAPj3Y7leJm6bJkJ9zAUfOXafRyBNTbqMT7L0nlF18rSn+g5vsZNNfuI6Wd1HePryDBjhCSXmDKgblgor3oOEs/82FOb/rEPMj4om8rhqdjPhWjjJLXxCXOPwwl/klq3q/KdGgfH5jT8f7ZmDZ6G97dMj+uHmfSgUC7hFX6Tl8x4aOETK4D2patr0mr3mUQ6FmxaWqq/Q5OyFSP81kLkjoHsN1WQhBtuUfDM3WIFKKJJ+kzJuS3uCv48CURuDnIM4neUTizvYVo3uoNcBmOI5NIzZs2c5X/W/OOc3sAeG5MuDBXAbvD2vdgPsLJvsjf3wNMdTtAjxb4jM64+EkebAizfQreIi+2Jxk/YCzmNDwZPT8izC8hJzLwKISeWVp3qX8Jy34b2wAxgKCOdcDmoqE9BOd0WIyJyxT9ZEeoGBDgdaerc2LgtrRCp75KZouhtL6IHh3diC3dgq5dXfAgeDOBDO/lokycDSlCDw2pT3G+JTjtILUvzgF02dBpitbE+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5034
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966005)(8936002)(186003)(336012)(82310400002)(6666004)(83380400001)(956004)(2616005)(81166007)(6486002)(82740400003)(47076004)(1076003)(36756003)(16526019)(316002)(26005)(478600001)(5660300002)(4326008)(70586007)(86362001)(7696005)(70206006)(2906002)(8676002)(6916009)(356005)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ad0a1f3-ad76-4174-ade6-08d807154525
X-Forefront-PRVS: 0422860ED4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tilPa1Ry4E58msM6TkcdxEnOWZ5gxjn/I54jGjA0wCiNq5K8UQxUaf7aoMzcSIgA3BFDAnmcosP9KLbQnVDch6JR0+SAosWjarWXN+m2KPkou0mpTWgLrbF0mVexmjZT71J+Ihe4SheindUvu8HTw8VTaz3yYIG9CjoBiANLL1e62+GbVcePZonjt3bvJcork7Kn1e+jW3axiHtZelvSXxWhcH3QMom3g/pXfHpqSIQAJdVPPkLgrtPdtjAUmhzE5j9l9dqIgM3anRg2Iuwit5cccquWlywNXxWf/SQsVX8JbbdW4KVoexYRm+a/sJLmKHYpGY3dNt2Wy+c+E/cVR7+YLni3y8q8h/gNfczCzW+LmRTe7Hpsewv/oVADvYcZAqHaspMk4TTBSGJTDNOKvot7Hca9m8mW4xR+NBnT5UuQs0XJC8CCrcYuGAK1vuni
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 16:52:08.7761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbf1bc5-937c-4403-aacb-08d8071549dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3798
Content-Type: text/plain

- Add new bbappend to fetch tfa ver 2.2 required for N1SDP
- Apply additional patch required for N1SDP
- Update machine conf to add image dependency for
  trusted firmware component

Issue-Id: PLATFORMS-3134
Change-Id: Ibf593c1818c9ea08acf71c6b5b80abc4aca79723
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  6 +++
 ...able-workaround-for-N1-Erratum-13157.patch | 46 +++++++++++++++++++
 .../trusted-firmware-a-n1sdp.inc              | 13 ++++++
 .../trusted-firmware-a_2.2.bbappend           | 11 +++++
 4 files changed, 76 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 5fddcad..133fb89 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -21,3 +21,9 @@ PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
 
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
+
+# Trusted firmware v2.2 version
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
+
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch
new file mode 100644
index 0000000..53a6616
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/n1sdp/0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch
@@ -0,0 +1,46 @@
+From 76847eb46e77d094eb8611760dd1ab880f617321 Mon Sep 17 00:00:00 2001
+From: James Yang <James.Yang@arm.com>
+Date: Wed, 4 Sep 2019 10:49:45 -0500
+Subject: [PATCH] n1sdp/arm-tf: disable workaround for N1 Erratum 1315703 and
+ Spectre v4
+
+This patch disables the workaround for Erratum 1315703 so that the N1 CPU
+performance in the N1 SDP better reflects that of released versions of the
+N1 for software that does not require mitigation for Spectre Variant 4.
+
+N1 SDP uses N1 version r1p0, which is affected by Erratum 1315703, which
+is fixed in N1 r3p1.  The workaround for r1p0 disables the CPU performance
+feature of bypassing of stores by younger loads.  This can significantly
+affect performance.  The Erratum is classified "Cat A (Rare)" and requires
+a specific sequence of events to occur.
+
+Disabling this CPU performance feature is also the mitigation for Spectre
+Variant 4 (CVE-2018-3639).  On CPUs that provide the PSTATE.SBSS feature,
+the OS selectively applies the mitigation only to programs that require it,
+leaving the performance of other programs unaffected.  However, N1 r1p0
+does not have the PSTATE.SBSS feature (which is introduced in N1 r3p1), and
+Arm-TF does not provide the interface to to dynamically disable the CPU
+performance feature.  Therefore, applying the workaround penalizes ALL
+software running on N1 SDP, including those that do not require mitigation.
+
+This patch is meant for performance evaluation purposes ONLY and should not
+be used for software that requires a seccomp computing environment.
+
+Signed-off-by: James Yang <James.Yang@arm.com>
+---
+ plat/arm/board/n1sdp/platform.mk | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/plat/arm/board/n1sdp/platform.mk b/plat/arm/board/n1sdp/platform.mk
+index 986bd70a..7e30c857 100644
+--- a/plat/arm/board/n1sdp/platform.mk
++++ b/plat/arm/board/n1sdp/platform.mk
+@@ -66,3 +66,5 @@ include plat/arm/common/arm_common.mk
+ include plat/arm/css/common/css_common.mk
+ include plat/arm/board/common/board_common.mk
+ 
++# N1SDP: disable workaround for Errata 1315703 and global Spectre v4 mitigation
++override ERRATA_N1_1315703 := 0
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
new file mode 100644
index 0000000..ad4af5a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -0,0 +1,13 @@
+# N1SDP specific TFA support
+
+COMPATIBLE_MACHINE = "n1sdp"
+TFA_PLATFORM       = "n1sdp"
+TFA_BUILD_TARGET   = "bl31"
+TFA_DEBUG          = "1"
+TFA_MBEDTLS        = "0"
+TFA_UBOOT          = "0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files/n1sdp:"
+SRC_URI_append = " \
+    file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
+    "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
new file mode 100644
index 0000000..a87999f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
@@ -0,0 +1,11 @@
+# Machine specific TFAs
+
+MACHINE_TFA_REQUIRE ?= ""
+MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
+
+require ${MACHINE_TFA_REQUIRE}
+
+# TFA referred in release tag N1SDP-2020.03.26
+SRCREV_tfa_n1sdp = "cfb3f73344217aa000aaff9d84baad7527af75bf"
+
+PV_n1sdp = "2.2+git${SRCPV}"
-- 
2.17.1

