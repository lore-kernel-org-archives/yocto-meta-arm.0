Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.47])
 by mx.groups.io with SMTP id smtpd.web11.8683.1585306254661444089
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VJocGTK0;
 spf=pass (domain: arm.com, ip: 40.107.1.47, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFLM57Jf6+wZqdINmtmUddQCuLbEgiGwnr4sWTrOnyY=;
 b=VJocGTK0L5DKdFvLhBaooywb8G1Kk3TfA78JlbhJNu8KWQt4eADVVQtWKt9gZBfVwdTOh00TP8cFEGmf/yEosjUCZe5wAxMrCvdUZ+n1bTmV0ndi+LHcFtd5qIJrKiBuWFhCb4W4u1R2xLyBPdIac0M/0F1LU9K8HIWH+7hHh5Y=
Received: from AM6PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:20b:6e::34)
 by AM0PR08MB5057.eurprd08.prod.outlook.com (2603:10a6:208:165::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 10:50:52 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::84) by AM6PR02CA0021.outlook.office365.com
 (2603:10a6:20b:6e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:51 +0000
Received: ("Tessian outbound 19f8d550f75c:v48"); Fri, 27 Mar 2020 10:50:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 33c5b94f60a3d377
X-CR-MTA-TID: 64aa7808
Received: from 9425e7b3f164.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 974A6061-6F02-4929-8F89-48971EF57C08.1;
	Fri, 27 Mar 2020 10:50:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9425e7b3f164.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vp1Eexp0xWg1EsflgqjPEw0lapduoItrA0l1J6xmIuXeP/QpbNCeiqwWTYvP4RHz9ez1Jk2GdNjS2CyWYcXB0iudmud0Nwex0DC31MUQdOdEg91pn76YGgZN2u9IREYYZ6PLPerxF5CcCQrRCpb6/n9vprk7+MKdRD4Umm8hCWrb93rHGjTn1vcehHpDhmJ0HU8oexFg69Gaym7t6n4drbna0xvsqAqfuaLn3FC+6Lb5gzDttGbV04SDfK4sC7LdTvMlVDFrnRoc6cAW2nhjf9Xv59PLI7NlriX72E0JT+MpzRs+OykYWq3RdoFOg1BKgIY7zX97ZV/VaHfy+TAm6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFLM57Jf6+wZqdINmtmUddQCuLbEgiGwnr4sWTrOnyY=;
 b=Qa5x/0sGW8jvfaH+PlfcH76w0Gv5YlkY9WidV8TvIb/f64mFpjzeeWt+BdNYm7KmvFvJTzCNoA/inip2gAL+4J/gS56LYkAt8AiwO/suGfUy6k/Q5BrFlZOUXBHubaT3/LgFB7xqQalMhK2kiKI6z1oD/soSCFfeSemMNzQWqq2mVGmaCsJ3v8GddblDki6pPXKQmrUt5dYiz2GnY1hARjcCgpxcClTvScqws+YrEmdUyPwbTiBOaPFtLi7e0d3Qgcx2sYHOC7GXTLTrnq1SaUxl16Ws8MqK0JGst8QYoaRhuBDsPmpBST0uejlsLDyUgLlK9Oa2R/T9NOLrkGao6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFLM57Jf6+wZqdINmtmUddQCuLbEgiGwnr4sWTrOnyY=;
 b=VJocGTK0L5DKdFvLhBaooywb8G1Kk3TfA78JlbhJNu8KWQt4eADVVQtWKt9gZBfVwdTOh00TP8cFEGmf/yEosjUCZe5wAxMrCvdUZ+n1bTmV0ndi+LHcFtd5qIJrKiBuWFhCb4W4u1R2xLyBPdIac0M/0F1LU9K8HIWH+7hHh5Y=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:50:42 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:50:42 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/7] arm-autonomy: Create arm-autonomy-host feature
Date: Fri, 27 Mar 2020 10:50:05 +0000
Message-Id: <20200327105010.400-3-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4cbbb5be-f681-4523-bcea-08d7d23cb7ad
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|AM0PR08MB5057:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB505769CFFD90837CE704ED359DCC0@AM0PR08MB5057.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 U7pUvHWiSZ2mIoBk2Sykd+QLCqwNYpqJ0vZ5Ze4AJvU8Aq53mw+2n2Vm8iN8Tt6OHIqI1IV6ZxX0zefiEZEcVOw1B6QQiDQZgnBbM7USoHot0bQl0+AgxqaGz/hl2ZJ3rn6DptHmMW1R+c+9hmBThAE3DVpGLNzFeG4ypEwCoJip3M/WP1Hc0yBb9atBWh+hBlaU6hpMrAsinWfSDuYTyMGIqzxhmqkUENU9LcUSrSvtYE3gGmaRrBDzzzkghzy17hUASKAdi8+pmuTeIJ4UFeqxT2umi5iccObwrPB3fI2yzWxjsUPX0KETp56W3jB0uhxEmL9yyGNh4XEeJr5t1L9VhzHCWVtqqRGfoT9TcV756PH4cMWBKNUL+T6Gt+mE0UcdBdqzpsmwGpYnLWDfgIK/7XLBz709pfmsOCfuIYhDHS1/rghiR0nfT3OynabKJ3AukEc8S8HMrduflXhusmPSqBqlizqurVUyRLpfDTXaxEP3JgY8POr+1pqH7yhRjsYeyfRFo/CCdAwelAJkL791uThQyaNWm27XVLCMkLVOQQ6/6iFNjZ3YP4cvZUqploQRsz16/YHWyhATSsllgZoZUwQUuGI14OTZCwd2Sx7FW07j/BIiQdPA5DW6LFuJZ7yOr/9/IVz5NKgfmNCjQg==
X-MS-Exchange-AntiSpam-MessageData: 
 Ssi2lyOAfRt2W7HPhV5JyEIlsczRv1hSg0HCYYluKSBhcQZxcmVQHG5XJPqcdjTu2r3bgsPZh9H4hPmpQxBBgwdMOK2C6WpIB64JrhMkhlDaTupmZd6KqgHT53S/TGCkfN9boiNCnaMegDfkZV2avA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(70586007)(44832011)(70206006)(6916009)(82740400003)(36756003)(2906002)(478600001)(5660300002)(26826003)(7696005)(86362001)(356004)(1076003)(6666004)(8936002)(16526019)(47076004)(36906005)(186003)(26005)(4326008)(6486002)(316002)(8676002)(81156014)(956004)(336012)(81166006)(2616005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f890f37f-dd64-4e0a-0520-08d7d23cb20c
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WyRVryR4zR8xOcFH3Htc/whYLcO3iaU9HlbtBJOwd/xD08xkTBw2ME1TKM/Sy2PFiVSQ4ALzQKzkDEhkuTnk7N52nQVAbWJ0K2ML/a5tEqxXNY47laE/N0SgVQcMkp3WBahqX5umZEclxfZ/XIqKfAtACKx1sKNh3ntivK5CqppK07nzBFfipBL6wygZxYSlf/kVw3OndK7HPbD/gfQh0nlzYoFz7MCS8AHKSQkyjnl+A+QiIpKCHQPJVmOdjeV2BxTijsKNaJ57xPiYOuOPgxSrgW0d2yqntG1fLq7TXObc84AGP5sHT6m8CYCHKzJ/APu9Sev2Jml1zTlIMFFfkaVoZwSUqf/IndQhfzE9McI5Fv7tMaE4MVd4Bd4k96p21CpgTZPPnRD0NHWnTtIYgx/b+bfaXCdZsvos68+pZ5chPgdrMrrYHJRnbSqIabRwUKaJr6l5Td1XEZko0GkwZU/Hj/+DqO0+1z3c1PJH9eJL5w06IlZakTrn4QR+lwzxnMJcqKJDEVsOjy0g5ttVFgjjtIVQWV1UYlNudRHL/UG3A7ug3P0Pa1i6sMgZjnSciOxt8OuCbBfgDqzGcGki5M1j8Lmb7vZD0N8m/ikrI+93H34EyCTUaFLKHpi0hMsZDG2KE73hG4k8EEwoQH/m7E9A6N1i9tkbN+itFAJj/uGoqTOButUO8G8QZeTKIKNDkDh2WJenCL8ulvgbcqRnzA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:51.7121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbbb5be-f681-4523-bcea-08d7d23cb7ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5057
Content-Type: text/plain

Create a new distribution feature to enable functionalities for autonomy
host systems:
- enable xen and ipv4 in distribution features
- enable xen backend drivers in Linux kernel using a kmeta feature

For the feature to work properly, create a class inherited when the
layer is included to enable required parameters

Change-Id: Ia0cdaa2b69bc030515ea16d67c47fec6b1ea0897
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |  5 +++
 .../classes/arm-autonomy-features.bbclass     |  4 +++
 .../conf/distro/include/arm-autonomy-host.inc |  5 +++
 meta-arm-autonomy/conf/layer.conf             |  6 ++++
 .../features/arm-autonomy/xen-host.cfg        | 35 +++++++++++++++++++
 .../features/arm-autonomy/xen-host.scc        |  4 +++
 .../recipes-kernel/linux/linux-%.bbappend     |  3 ++
 .../linux/linux-arm-autonomy.inc              | 13 +++++++
 8 files changed, 75 insertions(+)
 create mode 100644 meta-arm-autonomy/classes/arm-autonomy-features.bbclass
 create mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index f8a1404..1f80a05 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -18,6 +18,11 @@ Distribution Features
 ---------------------
 This layer is adding the following Yocto DISTRO_FEATURES:
 
+* arm-autonomy-host: this feature activates functionalities required to build
+  an autonomy host system. It is doing the following:
+  - add 'xen' and 'ipv4' to DISTRO_FEATURES.
+  - add xen backend drivers to linux kernel configuration.
+
 Bitbake variables
 -----------------
 Some recipes and classes in this layer are introducing variables which can be
diff --git a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
new file mode 100644
index 0000000..38441e4
--- /dev/null
+++ b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
@@ -0,0 +1,4 @@
+# Include arm-autonomy distro config files if the distro features are set
+
+require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', '${ARM_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-host.inc', '', d)}
+
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
new file mode 100644
index 0000000..236fbe9
--- /dev/null
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -0,0 +1,5 @@
+# This files is added when DISTRO_FEATURES contains arm-autonomy-host
+
+# We need to have xen and ipv4 activated
+DISTRO_FEATURES_append = " xen ipv4"
+
diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 2dc24a2..19f24ad 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -23,3 +23,9 @@ LAYERSERIES_COMPAT_meta-arm-autonomy = "zeus"
 # otherwise the user will see a warning on each build.
 SKIP_META_VIRT_SANITY_CHECK = "1"
 
+# Directory of our distro config files
+ARM_AUTONOMY_DISTRO_CFGDIR = "${LAYERDIR}/conf/distro/include/"
+
+# Add class to handle arm-autonomy distro extensions
+USER_CLASSES_append = " arm-autonomy-features"
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
new file mode 100644
index 0000000..2affab9
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
@@ -0,0 +1,35 @@
+CONFIG_PARAVIRT=y
+CONFIG_XEN=y
+
+CONFIG_BLOCK=y
+CONFIG_XEN_BLKDEV_BACKEND=y
+
+CONFIG_SCSI=y
+CONFIG_TARGET_CORE=y
+CONFIG_XEN_SCSI_BACKEND=y
+
+CONFIG_NET=y
+CONFIG_XEN_NETDEV_BACKEND=y
+
+CONFIG_HVC_IRQ=y
+
+CONFIG_HVC_XEN=y
+
+CONFIG_WATCHDOG=y
+CONFIG_XEN_WDT=y
+
+CONFIG_XEN_BALLOON=y
+
+CONFIG_XEN_DEV_EVTCHN=y
+
+CONFIG_XENFS=y
+CONFIG_XEN_COMPAT_XENFS=y
+
+CONFIG_XEN_SYS_HYPERVISOR=y
+CONFIG_XEN_GNTDEV=y
+CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_SWIOTLB_XEN=y
+
+CONFIG_XEN_EFI=y
+CONFIG_XEN_AUTO_XLATE=y
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
new file mode 100644
index 0000000..6fdbabc
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable XEN Host Drivers on autonomy systems"
+
+kconf non-hardware xen-host.cfg
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
new file mode 100644
index 0000000..add7042
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-%.bbappend
@@ -0,0 +1,3 @@
+# Add arm-autonomy kernel support
+require linux-arm-autonomy.inc
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
new file mode 100644
index 0000000..0332387
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -0,0 +1,13 @@
+# Add arm-autonomy specific features to the kernel
+
+FILESEXTRAPATHS_prepend := "${THISDIR}:"
+
+#
+# arm-autonomy kmeta
+#
+SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
+
+# Add xen host drivers to kernel if arm-autonomy-host is activated
+KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
+        'arm-autonomy-host', 'features/arm-autonomy/xen-host.scc', '', d)}"
+
-- 
2.17.1

