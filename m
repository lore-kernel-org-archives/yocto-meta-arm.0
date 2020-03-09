Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web11.51779.1583742470237455454
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Mar 2020 01:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tJd6cOle;
 spf=pass (domain: arm.com, ip: 40.107.21.81, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHpGIk+U9tGOmKbcmJuGLw9lVUeqs8FR2kd8N571+q0=;
 b=tJd6cOlepvXtPpFCUGseZnl8xz8jWIfHkO5A6ZTdqyGYg8PRUPCmb5wXc6WwcWOSJ5rI9pqO7qp+PMlAf+GKy6XbircIQxDEOboX4gcWqVaE+UU0nPJjJJWYVfxFgkqjxJWYUUNyVbiHwtb9OMTp9IkoIDutP3023C+TMUuBJVE=
Received: from DB6P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::11) by
 VI1PR0802MB2413.eurprd08.prod.outlook.com (2603:10a6:800:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Mon, 9 Mar
 2020 08:27:47 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::dc) by DB6P191CA0001.outlook.office365.com
 (2603:10a6:6:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14 via Frontend
 Transport; Mon, 9 Mar 2020 08:27:47 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.11 via Frontend Transport; Mon, 9 Mar 2020 08:27:47 +0000
Received: ("Tessian outbound d1ceabc7047e:v42"); Mon, 09 Mar 2020 08:27:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f43e7d0979641db2
X-CR-MTA-TID: 64aa7808
Received: from 3973507aedc0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 120BF326-9524-4139-AAD5-107172649427.1;
	Mon, 09 Mar 2020 08:27:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3973507aedc0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 Mar 2020 08:27:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWM7c6ypQkEYL2wLkTlo5q+cZ3MCx5jHb296Mq8mxwx9FEpnav77JZQGn7v1G5J8B+tHsWlNKIiq+h4qMjzw3mkIkOnrmR//ACpN7DsNtwVfPjWFGAXVjZAf5DCH0aqHzOQpm1Fdp4WAuID81Bf8LzTpdeSuJ41lWzze6ZSFr9Aip0uJrVLwvDgSecmYtEH3zP6Xy/J5yXiwjgbz7JrcZnCdtySHTFLtaZPjeOXCve1HuCVEg6UqQF5iLV4J94VKnd2XrfCsTQBrHZ+6BF1GopVVBMO+N1IJeCqWGj2kNo7zb2uc8yuz7P8rRo6wp+NKH7IoBiXCYfevA765NloptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHpGIk+U9tGOmKbcmJuGLw9lVUeqs8FR2kd8N571+q0=;
 b=jtxbgvLykWO6ZnyoM/q2bLFy32pkFU85tD+BsTDOivt5dTFMe/hCMVmV5rMBXIihWsLqgYKIFjWAUOiF45HqGEdm45p6Wjeh5GzpT0dtmuT2G5mOE1msutiBOOqKXHjjyJAWO+KcKf+lpGtpknPP52hBHxybGd024Vrhw0NsauF5FANzvSGyHVyoWlrp88rcVi37iad8Ir0XIfUmdn6C84sigrWdw+tIC79dsuBwmAoO+NJ/M1NnM3oAWCS+a2HiTj596B7L6/I8iL6kzA7nEdmeK1UdK3znX8aBKlnC2Cat3uU0siEPrnzjv4Ilzeho0sib1Cdx3fv1g9zE6+/5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHpGIk+U9tGOmKbcmJuGLw9lVUeqs8FR2kd8N571+q0=;
 b=tJd6cOlepvXtPpFCUGseZnl8xz8jWIfHkO5A6ZTdqyGYg8PRUPCmb5wXc6WwcWOSJ5rI9pqO7qp+PMlAf+GKy6XbircIQxDEOboX4gcWqVaE+UU0nPJjJJWYVfxFgkqjxJWYUUNyVbiHwtb9OMTp9IkoIDutP3023C+TMUuBJVE=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from DB6PR0802MB2453.eurprd08.prod.outlook.com (10.172.250.11) by
 DB6PR0802MB2247.eurprd08.prod.outlook.com (10.172.226.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Mon, 9 Mar 2020 08:27:39 +0000
Received: from DB6PR0802MB2453.eurprd08.prod.outlook.com
 ([fe80::c464:a329:1884:325]) by DB6PR0802MB2453.eurprd08.prod.outlook.com
 ([fe80::c464:a329:1884:325%10]) with mapi id 15.20.2793.013; Mon, 9 Mar 2020
 08:27:39 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] meta-arm-bsp:linux-linaro-arm: Fix kernel menuconfig task
Date: Mon,  9 Mar 2020 08:27:35 +0000
Message-Id: <1583742455-36755-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::24) To DB6PR0802MB2453.eurprd08.prod.outlook.com
 (2603:10a6:4:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by LO2P265CA0300.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2793.16 via Frontend Transport; Mon, 9 Mar 2020 08:27:38 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 73028893-2df8-4681-05de-08d7c403bfad
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2247:|DB6PR0802MB2247:|VI1PR0802MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB241304972FF224ECD3444DD492FE0@VI1PR0802MB2413.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0337AFFE9A
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(189003)(199004)(8676002)(6486002)(26005)(44832011)(66556008)(186003)(81156014)(16526019)(81166006)(2616005)(956004)(66476007)(4326008)(8936002)(66946007)(6666004)(36756003)(5660300002)(478600001)(2906002)(86362001)(7696005)(52116002)(6916009)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0802MB2247;H:DB6PR0802MB2453.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2HGsz1DwOnF3qkDBiH4Ok+MfZPzB1n+jt/1ngn5VPYPXhJVqmCECdPUa26MG4UcgEUF5NDl6QZFnmH4iG2MZLU3Al0Wc+TQiFSyfo2HbSB/8JGkoMywyBZhpGf1tLjig17GRwufsZVnKVBIwg2HBwuuxkOE2/niWefLPzCNVXnuKIYghNs7vJhz6NvGIDOLD28toFInR0uJ2fMuFDgWPW21+jCFefObpRwA//whSwIpOx4MadYMaaId+RLsE+iIMFgH7+4+eWQltUDDNvcpCLXVgR3fZU9Fmi7iOe1Wh07GoWyvRYKVIEsvT0Q921rh/bBmMfZsJF/HTfefi4ppc1OlMzr/Lg7q4WV+bAL3DxI9b0pHv1lqiwojEWH1izsrf4Ma6h9zsbeBWZ0Cj3OUDBeCk9lmulo5u+78kRwhHRiADrGBmdo8wx63JpP1Im/FW
X-MS-Exchange-AntiSpam-MessageData: 
 4f0LF9eG0vf3OAN9ED3Tk/WhaFbXjjIv7waqJAyyH95/cX/xx7XNL8s/NsiaimUs/Ui8XPFs/dZO/CFHNiiInyWa7rMKy/K0sY+pH3NBc9uym4WQx2TXDqmMhts8FgOXtCwmwlf0AQBQstbuGoJnhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2247
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(39850400004)(396003)(189003)(199004)(6916009)(6486002)(4326008)(7696005)(6666004)(356004)(2906002)(44832011)(26005)(956004)(2616005)(186003)(16526019)(316002)(70586007)(70206006)(5660300002)(478600001)(26826003)(81156014)(81166006)(8676002)(86362001)(8936002)(36756003)(336012);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0802MB2413;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d633c418-af51-4db8-7129-08d7c403ba60
X-Forefront-PRVS: 0337AFFE9A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d95yZaBaxU4YPVAnOlh5SWYX+weqyaAhYfHGuEkZvsrltcYegz5i+rMpdY9qWIcbIygDiPFQ2BysVd0oh6ROyH5QQz1q7XZQ/0jbOYsUBXsXavJ7Hsr/mU0uP+bZHJhvUwMGKxij5+JHCYZzs5oPRr0y4Q+Npa6QDVz+/t0BDgCoPTRI9uiBjkkBhtnfDS4/PS0+eW4YduVZsKLMAxWsj2KT5zk3nDSremnttscVNF7Kyf03GcrouvIeY3eqPasfraDtSrOinQguOELTumzqLq6sEtd03w1vZklEwOMBffLWmVN4CiNtuVnmXpFfSk05XHxI2A9DIecsEhHy30+41UlsRa8/dOuKu4ME/TgobnRT6SMadqt/FkRg9EVi912Yu71cw6wecydOfBput0Sc8JIUnNJJWLyMPK31u35VzafxpOp6l16i2SDQU0rWrdqg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2020 08:27:47.5877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73028893-2df8-4681-05de-08d7c403bfad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2413
Content-Type: text/plain

When calling `bitbake virtual/kernel -c menuconfig` it fails if the
ncurses-dev package is not installed on the host machine.

This patch makes usage of the ncurses library built by yocto if it
is present.

Change-Id: I6a8c4ca6a7da07ac834b29a2d23e83e6c153efb3
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 ...g-Allow-specification-of-ncurses-location.patch | 52 ++++++++++++++++++++++
 .../recipes-kernel/linux/linux-linaro-arm_4.19.bb  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch b/meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
new file mode 100644
index 0000000..372d0af
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
@@ -0,0 +1,52 @@
+rom d078e29aa31ac3fa4c041bf89c46bc6372c1a02a Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Mon, 2 Jul 2018 23:10:28 -0400
+Subject: menuconfig,mconf-cfg: Allow specification of ncurses location
+
+In some cross build environments such as the Yocto Project build
+environment it provides an ncurses library that is compiled
+differently than the host's version.  This causes display corruption
+problems when the host's curses includes are used instead of the
+includes from the provided compiler are overridden.  There is a second
+case where there is no curses libraries at all on the host system and
+menuconfig will just fail entirely.
+
+The solution is simply to allow an override variable in
+check-lxdialog.sh for environments such as the Yocto Project.  Adding
+a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
+compiling and linking against the right headers and libraries.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+cc: Michal Marek <mmarek@suse.cz>
+cc: linux-kbuild@vger.kernel.org
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ scripts/kconfig/mconf-cfg.sh | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+ mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh
+
+(limited to 'scripts/kconfig/mconf-cfg.sh')
+
+diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
+old mode 100755
+new mode 100644
+index c812872d7f9d..65a9b9e5b8a6
+--- a/scripts/kconfig/mconf-cfg.sh
++++ b/scripts/kconfig/mconf-cfg.sh
+@@ -4,6 +4,14 @@
+ PKG="ncursesw"
+ PKG2="ncurses"
+ 
++if [ "$CROSS_CURSES_LIB" != "" ]; then
++    echo libs=\'$CROSS_CURSES_LIB\'
++    if [ x"$CROSS_CURSES_INC" != x ]; then
++	echo cflags=\'$CROSS_CURSES_INC\'
++    fi
++    exit 0
++fi
++
+ if [ -n "$(command -v pkg-config)" ]; then
+ 	if pkg-config --exists $PKG; then
+ 		echo cflags=\"$(pkg-config --cflags $PKG)\"
+-- 
+cgit v1.2.2-1-g5e49
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
index 496f491..089f6cb 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
@@ -11,6 +11,7 @@ SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
 
 SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
+           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-- 
2.7.4

