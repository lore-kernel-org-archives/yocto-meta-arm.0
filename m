Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web11.8684.1585306255311093983
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fthXn9hF;
 spf=pass (domain: arm.com, ip: 40.107.8.42, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzQ6YwckSQk46wdKKTYQv6TLaD9eXoJkVjdB0y1vb8I=;
 b=fthXn9hF+V356wsMc1BCEMHXX+KuIJsnhvnKmrtc5paxxs/nguJ+kQP9/ImqKlw6kN8gybe8K1y3ZPs9AcIxbLCtKnnSNzWywQyszSH3YvWafNEDURQ9WDwFxQCH3LwHmP5AVVHhiOeuH3WhIo6hc1hRJz/hSx5r4gS90XWtVHw=
Received: from AM7PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:20b:100::21)
 by VI1PR08MB2670.eurprd08.prod.outlook.com (2603:10a6:802:25::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 10:50:52 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::d4) by AM7PR02CA0011.outlook.office365.com
 (2603:10a6:20b:100::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:52 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:52 +0000
Received: ("Tessian outbound fb361fb66447:v48"); Fri, 27 Mar 2020 10:50:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 239d0015223d7f57
X-CR-MTA-TID: 64aa7808
Received: from 00a0cd4a8231.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A61FDC1D-8B61-488D-92FC-3FB5C9198D7B.1;
	Fri, 27 Mar 2020 10:50:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00a0cd4a8231.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmS5IX/N9MSU/SS12nQm/M3DLD0XJRYVCb58/RUv+VSaBl2bX7lW7nIcklz4BLCWRDZIknq70H1iEfjarnU/H2oVNfw8Vwd3WBxT6zid+/hemKhX5n22iTnSDom2AIqgDMmUNdv2Rebub/7/c5PtOw3PpEz8jw60sxgRmBK2ezC0x0/MiU7gYzKd2WvmEKmpB7Se+CBe19mXNA1UIzelkJ7GOwa8HOJSnPoXYrn4xLJrYA5iQa+hb/ROMq6gUd3JzGxd5lf3MnnBj3PxaYINm6u7siofCvqw3TTgzYOzdXxK8sskvUmmLdFdIbiSIWiUtfdGarG9nlnbw16bRyl70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzQ6YwckSQk46wdKKTYQv6TLaD9eXoJkVjdB0y1vb8I=;
 b=nOvzM5U/x1HxZ/3AL0GjbPbZA9K6Z0z19kxjuJpGeMWaVuEBxXZIDFR3KROizPV/QJbW1xerQoysjW+AyN29MBIlBsMFJehjlpC8C7yoxj1GU2OE5OdlolOuJH/iq60ZARHw5aLObW1Dwh+iYtU7vuGTqFfEtj8C+N5MxI+OL7a2eHvQJKEqu+ZCK0C6/D4HS3EwpH1+dRIj8WHveZ752Ih1susIYMVAcu8EiaKM2AIJwHYPvNLVE7ZxvLd3+y+cLcp5iIEBZyRPkTBrkzKsrmuBQ6PpEf+PAQaUvrm8vf4k6HeUXf/jOKB+sDkcxbvhAmr6PgMwiUIUn5kpFmzigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzQ6YwckSQk46wdKKTYQv6TLaD9eXoJkVjdB0y1vb8I=;
 b=fthXn9hF+V356wsMc1BCEMHXX+KuIJsnhvnKmrtc5paxxs/nguJ+kQP9/ImqKlw6kN8gybe8K1y3ZPs9AcIxbLCtKnnSNzWywQyszSH3YvWafNEDURQ9WDwFxQCH3LwHmP5AVVHhiOeuH3WhIo6hc1hRJz/hSx5r4gS90XWtVHw=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:50:46 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:50:46 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/7] arm-autonomy: Create arm-autonomy-guest feature
Date: Fri, 27 Mar 2020 10:50:07 +0000
Message-Id: <20200327105010.400-5-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c56ab6b-5c22-4a80-b5c1-08d7d23cb819
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|VI1PR08MB2670:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB267044CBBE07CA8ADEAC88EA9DCC0@VI1PR08MB2670.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lWG/RqF4qETz+amv+kqnzh2Av9HZsJlmgo091i36mbySPPHdukP3aRD77+rdiFIHk+9a7ajqT76IrVPuwnkBvdmBPayMUhcFVsGRphY57y3lFVMpViWK3YwPvbBcCAazkTzw0394KI3ozpWchvXIZ31r3EX/dK48W2JI8cE3mAq3qzDzxmcim8uY3eOImLTk4sIkIr7WaJfi7bY6q5OHJwOhlE6xwu+U3K1C11C/8mNnD1b+FmRpYOW/NVY3G+ryU7xPRWBqAfXV/ORRZTUMyeeXtVxhJhb4W3jAmL1swZdpy7vRryZWE4ODcGvw+XhTZeoZhcXPX+RmPR45wLfWhKEvUfkqgH7qF3OXyp9sL6/OXJc3RcefDRz58sQtP6eMf39VYmYbsmIxdi38WWfEoeZyHX08amFCEKEQrDZFHFgOLX22QvTHy6m12+qv72wEk13Nrabz8PBfLoQ9ZbUlv1IXYew4PMpI3MA1cNT99SbnP1dJahD+17Fe1PiPYYpEzG5K4P1DsctQrwWzrXdNuNN7IsH0v2v6SoDZHNDS5+wU27NPrmepPY2S7UhksFWpUyWZBl7tsPVwbpEx2lWCvRlFEv/64ia13B6ZRy6MDh8EQ485GSm+o+igMpjj10Ec
X-MS-Exchange-AntiSpam-MessageData: 
 1dUHChhgMRJajvNzWlG0RBQdEfDkA7Nr2u6jRX+KjcAvT2h3d673B7513F1x6J4ULEAcXtOcszVukb/hXjtiXN0OKTynilXfIwSyay5ISkYXt0tClPUWVoulvew50ce60Tol928AuIEthxXAeyFQug==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(4326008)(356004)(86362001)(336012)(316002)(70586007)(81156014)(6666004)(70206006)(81166006)(186003)(36906005)(6486002)(82740400003)(47076004)(8936002)(1076003)(36756003)(5660300002)(7696005)(2906002)(478600001)(26826003)(6916009)(26005)(8676002)(44832011)(956004)(16526019)(2616005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b6739e05-2562-4e9d-1976-08d7d23cb39d
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	031PjL0RbdOYbf3DsfdbfggcGw2M9yyfZr6SJdd2bGyhMbbX0d8ZymnhB9lLF9uMBSwDGcgDFjF3gnYPVKZ6U8LHcL4q+6a40wakngWhekCfoNSnFUGpcaMpXR0BHMlwVKLiEhAVzdxCwiBk+sZ1puGyVSTWu/xA8N4vJ5RnzRTQ9RdiSBk2AbK1IXz39TjNbgHKIgBQKHNt1lZ6U36LcTkaJm0z6TiMio9wp9przey2BtjLvQ72lyqNdEqLKymc0wiyX0iSiqnaU/alhsFhfWUyfi10Vs1TkY+q40iodWc9tT2+J3Vw7u9RgD3No6pcds7JazQdunQZR1hi34eDf4dg9VQMXK7CYkoNB9pc7h0VuBdAfojUXlbNzWFkxDFT+D0kCgtKLSAwWXMXXgbDIR6wNj4lFn7B34BD2uFLuUUlCHZ02sGebZ69tce3K2rVfLecD14mVaypm4rnr5YN9qIdzCcmHtqBa6+ooLwDo3lXKZJU5Ox/iI+pP1GgLUnd1f+13WtYMOEqAjyOKSN8ikIavmmbydkP7QQGzdouz8Cagg1VS2MMNkHaSPh1kfo4Lt+Os1amDO+7bvXvDoZD1gKXaYMHY/UcXUwH3u3D94yjF4D9g/uL4Ew/p7DhXpvMkqAyU3WSwu/U/tr3nW6EH5zOCPOn0q1B2zX6htziapC7/IpuZRLC/tF/6XagC0JeMAFXFFrwQ+Ve4ZYM5pmu1g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:52.4127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c56ab6b-5c22-4a80-b5c1-08d7d23cb819
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2670
Content-Type: text/plain

Introduce DISTRO_FEATURE arm-autonomy-guest which is:
- enabling ipv4 in distro features
- enabling xen frontend driver in the linux kernel using a kernel
feature
- enabling console over hvc0

Change-Id: Idd9a708799b35e483dbba22279ce677d9674ef09
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |  6 +++
 .../classes/arm-autonomy-features.bbclass     |  1 +
 .../distro/include/arm-autonomy-guest.inc     |  5 ++
 .../sysvinit/sysvinit-inittab_2.%.bbappend    | 16 ++++++
 .../features/arm-autonomy/xen-guest.cfg       | 54 +++++++++++++++++++
 .../features/arm-autonomy/xen-guest.scc       |  4 ++
 .../linux/linux-arm-autonomy.inc              |  3 ++
 7 files changed, 89 insertions(+)
 create mode 100644 meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
 create mode 100644 meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index d0c6181..e5ad6ed 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -23,6 +23,12 @@ This layer is adding the following Yocto DISTRO_FEATURES:
   - add 'xen' and 'ipv4' to DISTRO_FEATURES.
   - add xen backend drivers to linux kernel configuration.
 
+* arm-autonomy-guest: this feature activates functionalities to run as guest
+  of an autonomy system. It is doing the following:
+  - add 'ipv4' to DISTRO_FEATURES.
+  - add xen frontend drivers to linux kernel configuration.
+  - add console on hvc0 during init.
+
 Bitbake variables
 -----------------
 Some recipes and classes in this layer are introducing variables which can be
diff --git a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
index 38441e4..15549d8 100644
--- a/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
+++ b/meta-arm-autonomy/classes/arm-autonomy-features.bbclass
@@ -1,4 +1,5 @@
 # Include arm-autonomy distro config files if the distro features are set
 
 require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', '${ARM_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-host.inc', '', d)}
+require ${@bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-guest', '${ARM_AUTONOMY_DISTRO_CFGDIR}/arm-autonomy-guest.inc', '', d)}
 
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
new file mode 100644
index 0000000..d961b40
--- /dev/null
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
@@ -0,0 +1,5 @@
+# This files is added when DISTRO_FEATURES contains arm-autonomy-guest
+
+# We need to have ipv4 activated
+DISTRO_FEATURES_append = " ipv4"
+
diff --git a/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend b/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
new file mode 100644
index 0000000..7b0c647
--- /dev/null
+++ b/meta-arm-autonomy/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
@@ -0,0 +1,16 @@
+# if arm-autonomy-guest is activated, we are running as a xen guest so we must
+# have a console on hvc0
+# This is normally done in meta-virtualization if xen is activated but here
+# we don't have xen activated.
+#
+
+SYSVINIT_ADDHVC0 = "${@bb.utils.contains('DISTRO_FEATURES', \
+    'arm-autonomy-guest', 'true', 'false', d)}"
+
+do_install_append() {
+    if ${SYSVINIT_ADDHVC0}; then
+        echo "" >> ${D}${sysconfdir}/inittab
+        echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> \
+            ${D}${sysconfdir}/inittab
+    fi
+}
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
new file mode 100644
index 0000000..e4e44a9
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.cfg
@@ -0,0 +1,54 @@
+CONFIG_PARAVIRT=y
+CONFIG_XEN=y
+
+CONFIG_BLOCK=y
+CONFIG_XEN_BLKDEV_FRONTEND=y
+
+CONFIG_SCSI=y
+CONFIG_XEN_SCSI_FRONTEND=y
+
+CONFIG_NET=y
+CONFIG_XEN_NETDEV_FRONTEND=y
+
+CONFIG_INPUT=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
+
+CONFIG_HVC_IRQ=y
+
+CONFIG_HVC_XEN=y
+CONFIG_HVC_XEN_FRONTEND=y
+
+CONFIG_WATCHDOG=y
+CONFIG_XEN_WDT=y
+
+CONFIG_FB_SYS_FILLRECT=y
+CONFIG_FB_SYS_COPYAREA=y
+CONFIG_FB_SYS_IMAGEBLIT=y
+CONFIG_FB_SYS_FOPS=y
+CONFIG_FB_DEFERRED_IO=y
+CONFIG_XEN_FBDEV_FRONTEND=y
+
+CONFIG_XEN_BALLOON=y
+
+CONFIG_XEN_DEV_EVTCHN=y
+
+CONFIG_XENFS=y
+CONFIG_XEN_COMPAT_XENFS=y
+
+CONFIG_XEN_SYS_HYPERVISOR=y
+CONFIG_XEN_XENBUS_FRONTEND=y
+CONFIG_XEN_GNTDEV=y
+CONFIG_XEN_GRANT_DEV_ALLOC=y
+CONFIG_SWIOTLB_XEN=y
+
+CONFIG_XEN_EFI=y
+CONFIG_XEN_AUTO_XLATE=y
+
+CONFIG_DRM=y
+CONFIG_DRM_XEN=y
+CONFIG_DRM_XEN_FRONTEND=y
+
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_XEN_FRONTEND=y
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
new file mode 100644
index 0000000..935e78f
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-guest.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable XEN Guest Frontend Drivers"
+
+kconf non-hardware xen-guest.cfg
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 0332387..b2245a5 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -11,3 +11,6 @@ SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
         'arm-autonomy-host', 'features/arm-autonomy/xen-host.scc', '', d)}"
 
+# Add xen guest drivers to kernel if arm-autonomy-guest is activated
+KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
+        'arm-autonomy-guest', 'features/arm-autonomy/xen-guest.scc', '', d)}"
-- 
2.17.1

