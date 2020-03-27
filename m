Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.42])
 by mx.groups.io with SMTP id smtpd.web12.8838.1585306256322474154
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1dIsE2fF;
 spf=pass (domain: arm.com, ip: 40.107.14.42, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p51GguqWUUp8eysCOzU8wQNGXI6cEZ3fDREvyR961mI=;
 b=1dIsE2fFz9MrXevKI2qCAYVi08H5PddzrHSqAnePyCTLakH3BqAAliNtSuJ4Kmev4Hcd7z9Ma7JLscEmA0GPMegmXhJrdbLLIaXQNom0d+oIlibTOglmenbTS5KIMh4WTZQzklEsHvPuve2s46bGYR7ZePdGhXyNmQTP3Zvj0M0=
Received: from DB8PR03CA0014.eurprd03.prod.outlook.com (2603:10a6:10:be::27)
 by VI1PR08MB2959.eurprd08.prod.outlook.com (2603:10a6:803:40::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 10:50:53 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::d6) by DB8PR03CA0014.outlook.office365.com
 (2603:10a6:10:be::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18 via Frontend
 Transport; Fri, 27 Mar 2020 10:50:53 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:50:53 +0000
Received: ("Tessian outbound d6b3ed9fc62a:v48"); Fri, 27 Mar 2020 10:50:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9782858467059997
X-CR-MTA-TID: 64aa7808
Received: from df50409bfd7b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0602608F-5469-4D22-8226-F406A150C458.1;
	Fri, 27 Mar 2020 10:50:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df50409bfd7b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKTdRel44pbYCy7NlB/WW6S+5XaWhyfd4mHeMgI8VB6K+G5/EfztPtzcLjegZqIr3WmVQLGhjByf6z2AMICZVi1H9C334rQ4WqJXbHdrAfp5eOOSzUEZy0EEUStqFYaVsby1+AI9IrBTgyF7ZVUMmGKmEfcMTjTlwSBf0GiB/Sfqq3t858dtI4GHXDByurWXZvcsm0uXyr4Glq8XrUsn2o8ufkHPEjhBDQxIxJIwlVKOHvRAi3OBQLjK+ysAQs2k3N4iVemhjVAHYdB3HM8CHZJfu74gQzVYVu6nUPzImpqCFF6yusOAjuSBZ9fG+3rQYPa+vahoqhKvtwDKosqGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p51GguqWUUp8eysCOzU8wQNGXI6cEZ3fDREvyR961mI=;
 b=bZ520jYuy8pBXwLLLmaDtDR+BXvZJ4EVSPve1xgDbOWZ9WBe7A/SbVXNiUjKatvwUMFar4qTHC1eOld3eaMSOk4XcL0KeNkE7azFTWh064dV1g56NX1sg0yGIWey9bstk+zeUgm2kAc9fdnfJRf4ZrehO7iIXNo/IalTu64l4X6eW1anBiIjx22sbxfbpimwSIXbnGMVvQCYWOLNt0VNFIq9Sv0gdciPO/ZvP1Jy01Aq3E1dQ6Q406AhBCKWWioPRnmSpOSC7B7lbWKbnAaOxeGm4BfORZx3gc2xFj6CCeU2SEvHjQ4E2XgrabYBFu/ocY7FrXRE+QCrKFNFbUPpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p51GguqWUUp8eysCOzU8wQNGXI6cEZ3fDREvyR961mI=;
 b=1dIsE2fFz9MrXevKI2qCAYVi08H5PddzrHSqAnePyCTLakH3BqAAliNtSuJ4Kmev4Hcd7z9Ma7JLscEmA0GPMegmXhJrdbLLIaXQNom0d+oIlibTOglmenbTS5KIMh4WTZQzklEsHvPuve2s46bGYR7ZePdGhXyNmQTP3Zvj0M0=
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
Subject: [PATCH 5/7] arm-autonomy: Create arm64-autonomy-guest machine
Date: Fri, 27 Mar 2020 10:50:08 +0000
Message-Id: <20200327105010.400-6-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105010.400-1-bertrand.marquis@arm.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: DM6PR12CA0036.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::49) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:50:45 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9a3037bc-5653-4539-524c-08d7d23cb86b
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|VI1PR08MB2959:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB29595CF169454C466374D9599DCC0@VI1PR08MB2959.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 S3mMJo7HZHsIGXJOFcvg2g2deySrGtQe0HSHT82JjBs6PQei7c6mqZ0zeQR30rYm44blkg4c/RogIUmp/HCheZYFTn4dGyeXSI9hIgbqn7MJXYRowXc2EmPeVlXqLl6RLXi9bIGmokd8q0lcC3tcrGlIhs8fWMKOycvfDGCReEw+7S4IQiqfs9yW45UKjhsbC/ZJGZeCl73D7RfX/2foqdR7McwDWtwyfjqI7P7tFCgCFN9xfxy5/50G0uQep4f9MKtUM1/DbtR+j33wm/ixIveGxDDWH9fXawjmOreZtgzeJF7tx1oLeLOmom8qPnDSBEYHxl9wOd2cuEvMWp/unlLtZA0ZqppWuMU4py1Xq9pRE9n53K0+JBD5po6pcNi7w8LkDBDqh6OpXQVOOdVANmTFlw9IriSiPevgsUV6q/4JHs58eApXGQdK8hXOza0eCTtvU6y/Pc0etFumEdGqW5oOyOdENLSzXHN5Pzqi7IHZ/o2yuAmhJ2+PhnoTXIRbazrnh77DlmecReGpNLdKbYm+v3pcACovZlj5z1hSFPa4iXDmBg2XCviPEtv0hS6zOQcHyEmClfE+QVGE2+4PR0Zx5+4zTtATGnid9ccy7D8yOk/Tz7/jMJ3WqdcGosTjfPY2t5ygfADmwFH0r1tIvg==
X-MS-Exchange-AntiSpam-MessageData: 
 B5S1XUox5vxHm/geo29Xwh6CaL3t/OC2GdbHiKbNX0KRsaapWvqgswLM2aRpBThPo07c3Hlh1ZzuEThDfSIfzxvGcNWWpXDdvzpWnyBOWVICgf5pvGhKtJyEj0pYDuKhZlcBy3Sa9UEO5j3KhGCg7Q==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(44832011)(26826003)(2616005)(186003)(316002)(956004)(4326008)(478600001)(16526019)(6486002)(7696005)(26005)(6666004)(1076003)(336012)(6916009)(70586007)(356004)(47076004)(86362001)(70206006)(81166006)(5660300002)(81156014)(82740400003)(8676002)(2906002)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	adbff7a8-676d-41ac-743c-08d7d23cb460
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V5zb/272CRCLAAAHyqJEP3R7EZhhdMPy7IMMc2Rmx7WKPKHdjDRWkQfTgSHq12STAFx5yToREE6a05z+FCOztWUd/QHvtn7gMmP+JJk/5i5qBpVmHZtrLLFiRAQXHOeB/X1zBt3YPlmkWKjngARELXnvFcwzhSdq+D2xKyz5Iorc5O7aF85gwaSIB28vsijXPd1MRV/EIh86Cw9FcxrSO5iLJhLs3xWmgS6GbIrB8vum0e0MroWtJvOoXIn9qg++MeXNi2R+i03mZOJuRhTkiS1/g6datnLCIkQZnmobKPVhx/rjJ+ted3cdJr4plyzEn+DCBSP7+Cen4syPJAFLJtY6n+nc/RXmI+sj7XCfdKSSy8jWOLQtPKwpQ79SjGfp0WwUIbMZyaZkAOpzc2GcYuN9GZ8KaM5ChzzMJsDDoIMODWbMsHoPi654XnqLY5Jn/sdZdCip9X0Ia+GqQ/FM9iKDiuFn1DGX3DKhh0/nlcJbgbTOK2dhjJb1D2Fsee2PLBqF99Qq/n9lrlbh4uCn8/pp6+1/44JkrIkQfAW+Wud3JoZpoyWgLjmuFypkyYP5x1Lw+NTouf4ZgFh8mWO5AZAOKDwVTZbw1gFZX4/T40g0LzgSFKwP85TqGXAJvSOaVpC47erqYNxAnnQAphNO9ILmnFX/5NkAAadUuCusQsmH3iHePamYJ5EdItyLV9IFSgU/IYFk19+iRQ66tQddIA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:50:53.0066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3037bc-5653-4539-524c-08d7d23cb86b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2959
Content-Type: text/plain

Create a minimalistic BSP to be used as an arm-autonomy-guest on ARM64.
The BSP is enabling ARM64 and SMP in the kernel configuration and is
enabling the arm-autonomy-guest in DISTRO_FEATURES.
Rework README.md file.

Change-Id: I7ef0176a3426748c4b66cdec5801aa34229187ba
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                     |  5 +++++
 .../conf/machine/arm64-autonomy-guest.conf      | 17 +++++++++++++++++
 .../arm64-autonomy-guest-standard.scc           |  5 +++++
 .../bsp/arm-autonomy/arm64-autonomy-guest.cfg   |  2 ++
 .../bsp/arm-autonomy/arm64-autonomy-guest.scc   |  6 ++++++
 .../recipes-kernel/linux/linux-arm-autonomy.inc |  5 +++++
 6 files changed, 40 insertions(+)
 create mode 100644 meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index e5ad6ed..ed9d6c9 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -42,6 +42,11 @@ BSPs
 ----
 This layer is adding the following machines:
 
+* arm64-autonomy-guest: this machines creates a minimal BSP suitable to be used
+  as an autonomy guest. It is in fact only activating ARM64 architecture and
+  SMP in the linux kernel and is enabling the DISTRO_FEATURE
+  arm-autonomy-guest.
+
 Images
 ------
 This layer is adding the following images:
diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
new file mode 100644
index 0000000..cb72c60
--- /dev/null
+++ b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
@@ -0,0 +1,17 @@
+#@TYPE: Machine
+#@NAME: Autonomy Guest ARM64 machine
+#@DESCRIPTION: Machine configuration for ARM64 Autonomy Guest
+
+TUNE_FEATURES = "aarch64"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+KERNEL_IMAGETYPE = "Image"
+
+IMAGE_FSTYPES += "tar.bz2"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?= "4.19%"
+
+DISTRO_FEATURES += "arm-autonomy-guest"
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc
new file mode 100644
index 0000000..7c75d99
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest-standard.scc
@@ -0,0 +1,5 @@
+define KMACHINE arm64-autonomy-guest
+define KTYPE standard
+define KARCH arm64
+
+include arm64-autonomy-guest.scc
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
new file mode 100644
index 0000000..fcdad98
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.cfg
@@ -0,0 +1,2 @@
+CONFIG_ARM64=y
+CONFIG_SMP=y
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc
new file mode 100644
index 0000000..e887b4e
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/bsp/arm-autonomy/arm64-autonomy-guest.scc
@@ -0,0 +1,6 @@
+include ktypes/standard/standard.scc
+include features/input/input.scc
+include features/net/net.scc
+include cfg/timer/no_hz.scc
+
+kconf hardware arm64-autonomy-guest.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index b2245a5..8191079 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -14,3 +14,8 @@ KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
 # Add xen guest drivers to kernel if arm-autonomy-guest is activated
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
         'arm-autonomy-guest', 'features/arm-autonomy/xen-guest.scc', '', d)}"
+
+# Add support for arm64-autonomy-guest machine
+COMPATIBLE_MACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
+KMACHINE_arm64-autonomy-guest = "arm64-autonomy-guest"
+
-- 
2.17.1

