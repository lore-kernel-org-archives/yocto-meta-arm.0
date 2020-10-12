Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.66])
 by mx.groups.io with SMTP id smtpd.web11.37633.1602499501804183030
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 03:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gg70KmL7;
 spf=pass (domain: arm.com, ip: 40.107.22.66, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/LHizd6cKT0Kb4vpJfLb1qd4elPuVIn+Gt0LvhkGG4=;
 b=gg70KmL7oUKL96JjwRRporxhcMY2TdftgwVJQSYdoYX0sFsCF4WUTqEG7zInGPYfdR72QI8kpH6XeAipBfWaEtqkV5X+0gM6glyqL8NHp8OLzmLUE7xN8orK346m4rxa223c56ZySQb/EQzqpTpJc6+1+GuM6qeomw34aP525Sc=
Received: from AM6P194CA0091.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::32)
 by VI1PR08MB5310.eurprd08.prod.outlook.com (2603:10a6:803:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Mon, 12 Oct
 2020 10:44:55 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::76) by AM6P194CA0091.outlook.office365.com
 (2603:10a6:209:8f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Mon, 12 Oct 2020 10:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Mon, 12 Oct 2020 10:44:55 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Mon, 12 Oct 2020 10:44:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c38eedadab04783
X-CR-MTA-TID: 64aa7808
Received: from cf469a307dc3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5C241F33-71B5-48B4-8DD6-D226E158CF3D.1;
	Mon, 12 Oct 2020 10:44:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf469a307dc3.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Oct 2020 10:44:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPHPoWtTm6lYxnbN1yT65WQ27P+/KXR6JLPGfg5xjAJlbjKhdmIsbdP55o5kusg2EcsRV8ohR0z6Nu+inc0E+SO51+APsriirpgTZf2ZhjJiTNRFrUua6rqaCgnHE3Dg6V253z2NMji9ZrA/9eZkM92/srG9j/xVoll1x+95i2xlrlXucdYcvQcyv81YIH7AQMlPXu0PUQROGmiq+Yrf6PNsb4mbpehpyEAdhtXkH2OOVDIVPg/giqlPIqDsWJ0xmE/6lvIOOISXFs2vpwqKZ1ayjmLVSxo9urrqRmQOzPJJwGlg2pZ0qB4+4CxfLfOKXeLXrcLhMvoADbl0wbheGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/LHizd6cKT0Kb4vpJfLb1qd4elPuVIn+Gt0LvhkGG4=;
 b=Um3rcZVeJ8IPc74BmS3ze3WUy/aUHDY/zaPxArjtlGZIyh1QXV91BP47ZehA4GioNzxaJHngFWu/1LRQS7evibdODH/xbd+M0Pwc4vduYILH0pqYH5/hG/lnRUcNsm0kJqCIJ5+NGK40tFHTdU1u9a2cv41nK4HYmaN+IfpVaJQ7Do+i0+kZCvTW8hSoWUNPJaLU6k3CfAjlA/j3if5iXgReQV/ZVD0mcgs3mEkBBvyJ4ViZnvJytqawA4TXuPevwXNnlDJScRQLqEhvKh4pqqxBQQFIZ/63MBdQvpWDLm2oHWRLo5Qc4S6oeczG6C7FNrKLW8maf6AWtzYrY08UUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/LHizd6cKT0Kb4vpJfLb1qd4elPuVIn+Gt0LvhkGG4=;
 b=gg70KmL7oUKL96JjwRRporxhcMY2TdftgwVJQSYdoYX0sFsCF4WUTqEG7zInGPYfdR72QI8kpH6XeAipBfWaEtqkV5X+0gM6glyqL8NHp8OLzmLUE7xN8orK346m4rxa223c56ZySQb/EQzqpTpJc6+1+GuM6qeomw34aP525Sc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4658.eurprd08.prod.outlook.com (2603:10a6:20b:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Mon, 12 Oct
 2020 10:44:48 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3455.030; Mon, 12 Oct 2020
 10:44:48 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] arm-autonomy: Add minimal docker runtime in xenguest images
Date: Mon, 12 Oct 2020 11:44:42 +0100
Message-Id: <6e3d5fa59258837389b397f70d6a642e835cb25c.1602499189.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <3074066cd4d0d95765207943feb2c90d05bfff2e.1602499189.git.diego.sueiro@arm.com>
References: <3074066cd4d0d95765207943feb2c90d05bfff2e.1602499189.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LO2P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::22) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.49) by LO2P265CA0322.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3455.21 via Frontend Transport; Mon, 12 Oct 2020 10:44:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac7a9499-e9f9-43e5-f886-08d86e9bdb68
X-MS-TrafficTypeDiagnostic: AM6PR08MB4658:|VI1PR08MB5310:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB53102F758974D91DC7D114B992070@VI1PR08MB5310.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8MO+FkA4TjBtsIEPLwje/458KCXREVP5biSAi6KspM7EDP5OjX1E6uH/o/o5l2iFSiTLGpVzvORuGBCpURg/G11CBnulviQkFZgE0nILXTxdKjZpc/26yKCDXctK37lQShwJ1FZ7F/F7m39oxf8QpE1/ud8vXj7Q7ret9R0iyKkt7cReldV190F8gyjBj5UiGV6GS64VbwFBEo1EqwyjiqOF9tHWJKZenHTCxwAUEfMLFmwCZ1VapqSgVcM8NnjxVhRf/gjUiOmoIu8y9sSYxsfH2/1+uWq4AnPSXMoMRojMtu1fA14mpR5EnUtMQ803HedlPRuQIeFP4RIUrtt8FQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(66556008)(186003)(36756003)(2906002)(8936002)(66946007)(956004)(8676002)(6916009)(16526019)(26005)(6486002)(6666004)(66476007)(52116002)(7696005)(86362001)(5660300002)(83380400001)(2616005)(478600001)(44832011)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 1LivbIVR87SBl4w4Gv1hNhjOod8UARpskzywEec/0WWqhp5jkdFlrwHu1dqQLi4NvWJhSAZ3bm1HQC0gchg4FExg1fbI6BJGOdvC2pvrIHnNxUu35xxtuWuN3OJRV3Lj4Iate7aAO91ej6onqolua/w7cgFF6AfeaFyy26UEibkGfKBwMLi5SoKK72n8fymA7vDU8u9hBmum+/j5I2RkF5ynVrhSD5+Gc5w4jp3mT2uCBDWx9S2vnghLRV0GviklYKLG+RE8CKJ7PidqtdLpx24QtA4nQ/gzlaW8q/fVHyb8lBVGKuEY9tgIg9/PMNriANcsxGaz0a2KeaKJGbpm2i8r+AtFafX/hmPhG9Ilk3KEjNJ77mkdBr8efRPmRE0BfbqvX2T81ZEod5GQ9aC7vRUViZNLDLl74DEGSpgv4exrtjemm1zd3RtK6CuxweVfrBQY6HNDKP4G06hPdtDD2FimTCWhsy5tpl1AvCPRW90+Up/kKXJXThbQjwyysl5a621D+omavE3WcjOzDLehpjdxCNMh7F/hOl0i1Eeu3TMh2j3lNfHk+XioHnrA7vaWMBUwdHLbsih5YBoR1/6tcRZvErQ/FWckljt6OtCr0KA07+Auqejn097bbXKqjZOxkCixOzI9F+dN7wKHojSHMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4658
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b97a30fc-2a22-4f80-bebc-08d86e9bd74a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TKBxeGHL0jSI7t4Rl5NYVu1Ve8QzClqiihMSsA81AuOfEIzuhtwR4O4qQU0sldMdLKSS2Hq5VJ/7okVg2D2nxSG1pPKDRXvS0jkIhrNolRyOpyhSOE23wCNJpbBZ8UM9tBkigEow4RYEa22qWLvwmb3d4zrwSOwuGOWpQOy2peNoVBhQJoIoA2P6t9ymeCQMYNa2/JUhCW/J7pu+LHER06f7WZcJtQzZtLkbioyH5imojM+mAf6s0roXlFNfSemGWKlvElDZhEnbzMfv8vCWfdUaB8i2FCkNsXOY+KWKNNMoMEBR8eIi9Al/lRt91GAzi3bbOgZeqyB+xNxpqHxYGbSiEGXtjG4lh7H54oMEYVRcsAR+u9sX5YnPXZ0mQB9hVUcPUsgXaV/vgeAc213e7Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(5660300002)(356005)(81166007)(956004)(2616005)(70586007)(70206006)(6486002)(4326008)(7696005)(44832011)(478600001)(16526019)(2906002)(36906005)(336012)(86362001)(186003)(8676002)(26005)(36756003)(82310400003)(6916009)(8936002)(6666004)(82740400003)(47076004)(316002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 10:44:55.2301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7a9499-e9f9-43e5-f886-08d86e9bdb68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5310
Content-Type: text/plain

This patch introduces the 'docker' DISTRO_FEATURE do control whether or not to
have a minimal docker runtime installed in xenguest images.

A new packagegroup and kernel feature were introduced to ensure the minimal
kernel config is applied as well as the packages to be installed in the image.

Change-Id: Id973ca2421c43d5b0978c6f7311e1d0b4db5edca
Issue-Id: SCM-1533
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../conf/distro/include/arm-autonomy-guest.inc     |  4 ++++
 .../packagegroup-docker-runtime-minimal.bb         | 19 ++++++++++++++++
 .../features/arm-autonomy/docker-minimal.cfg       | 26 ++++++++++++++++++++++
 .../features/arm-autonomy/docker-minimal.scc       |  5 +++++
 .../recipes-kernel/linux/linux-arm-autonomy.inc    |  3 +++
 5 files changed, 57 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.scc

diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
index 16b9f7e..8ef0a94 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
@@ -9,3 +9,7 @@ IMAGE_FSTYPES += "xenguest"
 
 # xenguest kernel extension to handle initramfs
 KERNEL_CLASSES += "kernel-xenguest"
+
+IMAGE_INSTALL_append = "${@bb.utils.contains('DISTRO_FEATURES', 'docker', \
+                        ' packagegroup-docker-runtime-minimal', \
+                        '', d)}"
diff --git a/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb b/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb
new file mode 100644
index 0000000..2cbff9c
--- /dev/null
+++ b/meta-arm-autonomy/recipes-containers/packagegroups/packagegroup-docker-runtime-minimal.bb
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2020 Arm Limited
+#
+
+SUMMARY = "Docker runtime minimal requirements"
+DESCRIPTION = "The minimal set of packages required for running Docker"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    docker-ce \
+    docker-ce-contrib \
+    kernel-module-xt-nat \
+    kernel-module-xt-masquerade \
+    kernel-module-xt-addrtype \
+    kernel-module-xt-conntrack \
+    kernel-module-xt-ipvs \
+   "
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg
new file mode 100644
index 0000000..7225c59
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.cfg
@@ -0,0 +1,26 @@
+CONFIG_NAMESPACES=y
+CONFIG_NET_NS=y
+CONFIG_PID_NS=y
+CONFIG_IPC_NS=y
+CONFIG_UTS_NS=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CPUSETS=y
+CONFIG_MEMCG=y
+CONFIG_KEYS=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_VETH=y
+CONFIG_IPV6=y
+CONFIG_BRIDGE=y
+CONFIG_BRIDGE_NETFILTER=y
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_NAT=m
+CONFIG_NF_NAT=m
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
+CONFIG_IP_VS=y
+CONFIG_NETFILTER_XT_MATCH_IPVS=m
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.scc
new file mode 100644
index 0000000..780f661
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/docker-minimal.scc
@@ -0,0 +1,5 @@
+define KFEATURE_DESCRIPTION "Minimal Kernel configs for Docker runtime"
+
+include features/netfilter/netfilter.scc
+
+kconf non-hardware docker-minimal.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 5f55d9b..d59ca8f 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -24,3 +24,6 @@ KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
 COMPATIBLE_MACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
 KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
 
+# Add Minimal Kernel Configs for Docker runtime
+KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
+        'docker', 'features/arm-autonomy/docker-minimal.scc', '', d)}"
-- 
2.7.4

