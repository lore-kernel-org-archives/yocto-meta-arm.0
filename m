Received: from FRA01-MR2-obe.outbound.protection.outlook.com (FRA01-MR2-obe.outbound.protection.outlook.com [40.107.9.85])
 by mx.groups.io with SMTP id smtpd.web10.4214.1596829403919894542
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EZBmwE22;
 spf=pass (domain: arm.com, ip: 40.107.9.85, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLIFSVON0qFLir6L1ym6bEePt2tmFbo0hVrO1oL++s0=;
 b=EZBmwE22hzOV3fD/3dB+MvlamsjxInEzYfZWcRsodTZvJRj+c8IZ4+sPRgQC82ihfDT1urtc6TBtU25sLGC0iWM3VPpbbEcJrSz8uzkZ3OUk09yt2+3IBBG+1Ob43EZcrCKaa6kfU7SSl2G8uRD0ZazZupKvOaSvKzvPlMg8v5U=
Received: from AM5P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::23)
 by PR2PR08MB4841.eurprd08.prod.outlook.com (2603:10a6:101:27::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 19:43:19 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::fd) by AM5P194CA0013.outlook.office365.com
 (2603:10a6:203:8f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:19 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 07 Aug 2020 19:43:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22789d640cb2dc03
X-CR-MTA-TID: 64aa7808
Received: from c45749869d9f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EF32DC15-02A4-40DC-9380-3900CA3562EE.1;
	Fri, 07 Aug 2020 19:43:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c45749869d9f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFpOQTK6yg+NMOlB2nb2JSamnh0e18mdhoOPNm+TuZlWxT/LSx5zKRHoFRigyfsZdprcfFAKENfrDDOGcdDyS+1eq1O5rNHHXDYpPQex7HxJt+dn6iT39ZxzFG3wBe/GUOSgwSLDzZSW4Yoag1mVJZKdeGDhJRImZZJ2p+O0MM6pFUe4itNd0P44VUhKVYNUwGvAXjUJUTPwqYNhSkOyQK188k06Vi8O/2+RPqaW8dE/tzQjOhfcO+I8P0NVZN4MMltqv7jTIO8pHHKV6ol9P/YaN15CKKrv7KzYHdPJoeV2eDcqbX7Amoc1462Cka2q1oHAGxgcnnTrSed2eQm9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLIFSVON0qFLir6L1ym6bEePt2tmFbo0hVrO1oL++s0=;
 b=KtEpr5EgO/6AS/qsFRSUv8W5r0kGodQIGMIgHQN7BDrrM07sIl1ICVqrCuDIP+jIE7THQAyw1K0fJKJht/NHR+o/ZXSsUo12pVtW2TEpI6TrOxjoO75oMLEq6rrIeg+6HVaxfzm2beBCgtV2u6es/4JBJNiVu/ueP3PhoasZVZzD6t+LLrzWy49MFsMULBMVcWgFL9hXx4WcrKaITyoDI4CX5qYW9jQ/KyGICJgJfAkMe2yK+2oF1l2oM0iFYEraOt7Fsn/K3O8eU4MvGFVCahe2NIvRGvMmw9o9ztSZW6Zh28fidnJlTilNiBGZQGLFDe/8noiQIZpH6we9Z6zAPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLIFSVON0qFLir6L1ym6bEePt2tmFbo0hVrO1oL++s0=;
 b=EZBmwE22hzOV3fD/3dB+MvlamsjxInEzYfZWcRsodTZvJRj+c8IZ4+sPRgQC82ihfDT1urtc6TBtU25sLGC0iWM3VPpbbEcJrSz8uzkZ3OUk09yt2+3IBBG+1Ob43EZcrCKaa6kfU7SSl2G8uRD0ZazZupKvOaSvKzvPlMg8v5U=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:12 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:12 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 2/9] arm-bsp/machine: adding corstone700-fvp machine
Date: Fri,  7 Aug 2020 20:42:46 +0100
Message-Id: <20200807194253.14748-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f769b769-232d-4901-2a92-08d83b0a22ee
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|PR2PR08MB4841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB484161099310B5A3427F1F83FD490@PR2PR08MB4841.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +OPe3JcBiyJDAijIirr2uLxwYF/wslaBaXc5QXO+mEVTkc9zG+WZTE9UBHgqxh6hfvXnhIHVcUQeu1FYv/OeO8/i2tSzgbEGO/1rPVT8ngjbOTZB34fW08STx8VBzWfZ+H2gIulbfqXV9dClGK4ZyrUDFfO93HFrSajcwuveiRpU0WhfUsTPUQLQoQXflbl4LDwhG8VqPlguIG5u9saiJYnFa0viMLeuMybmq23t7Ej54jlN1krO8ad96vbz/vRGacHXE0dF3qzw7II1PmBHtZcnqMiZ/wTntZKNAAd25dRfOPwS1kgbKLsV4cqrYEJK/VLBI4+i2bSvpCopaLvzfaZ3EBL7Uv+0lhdMO2m9nO4nyiL8N7QYOaaTaMe3A+lJ3ibcOEOcXu9x4HyTa+mSAw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(8936002)(4326008)(6916009)(1076003)(5660300002)(966005)(956004)(2616005)(8676002)(6486002)(54906003)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 LAjngAilFvjFHN9TBEWHCSQ5OPiOrB4t0MJhk/EyolIYh2iWR34fHP/w0B7tRv7Wjz0uyrMMje47r4RdS+W6cGOlCOqb7v4FCLCRGffNlQIn7NXBueAfOFDAr5AgrooN69j6XEQMMbuW563+7quGXSpfYFjeh9qWTPoXOeQpoU9bzQA1F8aoKD1S32etBH4v4Qyrpi1csf7QUYcaDf+n36Eajo2Y9rsApr4NRXicvc+JcvkNoWuuGnCmQv4hOxTsPRVV7Iind9iPqJDZe//9cDSKrlfl3rUi0YfuV9jcZsSwC5ZpKbVF0vXjFCQZTrapqQmh4lU4+vymoyrqAXeUhpO8z/UqCYbdg7Kn9BsB1Ff4tG4fCmyQWygtjpDlHeh0S9WZEWE8krFEEEhdjcnT4HkfWeDbvbeDyaFoDhJI3OnFPUschSHi0fm4LJCMYaMBMshmy3q+rp5K1BB0lWghNfh5PF94U9T7TQG9aJCvkB0Z0MdjGlyojmAfPRRNxZZBw+YzxY8MunOSXTlMBlPxnpzh2HLlCgvQ+z8mo686ISvsxkNtPxYOagQi4ZEAF4E6tuIgLugbBRurc8weg978LRWk1ubDXtgLADXdo0dXR2Cqrm6Sz4DhNxTGxH0sbbgT0CBzgAi4w/tgGVp931omlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	01d2efe5-6f3c-478f-f266-08d83b0a1eb0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wJdoGkJYZG7Tsp1tEw/RwmoUWTW9KEP+YuagtaVSFBz3efez1R6JveQk9EIoGyJBCTdUyMu68Vqkq+01QB0w9KAd4rP5rqhnmQjtPVzWr1d3GVKVXKCWUGjaY9jjaSgHgviwc6gsjgVXGYQr6uoXPEBnmhvoV1TRKdtRTfaGkaBpfo3K92Ic7D6NgQZc74r6BNWlY2z+fChxANXEtrk/dHn2/bZYRA2lOfeL5jUdAhAB4JIiEsJNt4rTa7LrPPCoCY38B9gFf+RpfWhRc8lsps9neOkY0E2cKUanpwqkKCBeyYx3N41P6qdqWVboT1/kRhfDSE2MeyHm1Xnl1kP9DmPdYo1sjG8h6ebu7jTX5An+WqbjnencdgMI7yHg1yrY9r4fvrfzxQRjMUhGdsFJbIoRl0zAmQ6t7rO4NIp671LSVyEoO+czjqtTiVpTZ8EEXfgMFMPoLnYRtHIuYR/5aTpi2bOokF/Hk4ch8h0CxfY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(6486002)(966005)(316002)(6916009)(9686003)(8936002)(81166007)(478600001)(356005)(4326008)(54906003)(8676002)(1076003)(2906002)(36906005)(47076004)(82310400002)(82740400003)(6666004)(336012)(2616005)(70206006)(70586007)(36756003)(26005)(5660300002)(86362001)(7696005)(186003)(956004)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:19.3571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f769b769-232d-4901-2a92-08d83b0a22ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4841
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This machine provides corstone700 platform on FVP.

For more information about the platform, please check:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444/corstone-700

Change-Id: I1197d3216f37ab8d2c792da82c4f5e7e17d5a09c
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/corstone700-fvp.conf         |  5 +++++
 .../conf/machine/include/corstone700.inc      | 14 ++++++++++++
 .../wic/arm-reference-image.corstone700.wks   | 22 +++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
 create mode 100644 meta-arm-bsp/wic/arm-reference-image.corstone700.wks

diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
new file mode 100644
index 0000000..a6faac7
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
@@ -0,0 +1,5 @@
+#@TYPE: Machine
+#@NAME: corstone700-fvp machine
+#@DESCRIPTION: Machine configuration for Corstone700 FVP
+
+require conf/machine/include/corstone700.inc
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
new file mode 100644
index 0000000..67cf153
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -0,0 +1,14 @@
+# Common configuration for all Corstone700 machines
+
+require conf/machine/include/tune-cortexa32.inc
+
+MACHINEOVERRIDES =. "corstone700:"
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0"
+
+PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-stable"
+PREFERRED_VERSION_linux-stable ?= "5.6%"
+
+VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+
+WKS_FILE ?= "arm-reference-image.corstone700.wks"
diff --git a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
new file mode 100644
index 0000000..39c70ce
--- /dev/null
+++ b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
@@ -0,0 +1,22 @@
+# WIC partitioning for corstone700
+# Layout and maximum sizes:
+#
+# SPITOC: 1 KB
+# SE Ram FW: 32 KB
+# FIP image: 991 KB (composed of FIPTOC, BL32 and DTB)
+# XIP Cramfs rootfs: 2 MB
+# XIP Linux kernel: 3 MB
+#
+
+part --source rawcopy --sourceparams="file=spitoc.bin" --no-table --align 1 --fixed-size 1k
+
+part --source rawcopy --sourceparams="file=se_ramfw.bin" --no-table --align 1 --fixed-size 32k
+
+# Rawcopy of the FIP binary
+part --source rawcopy --sourceparams="file=fip.bin-corstone700" --no-table --align 1 --fixed-size 991k
+
+# Rawcopy of the rootfs
+part --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/arm-reference-image-${MACHINE}.cramfs-xip" --no-table --fixed-size 2
+
+# Rawcopy of the kernel binary
+part --source rawcopy --sourceparams="file=xipImage" --no-table --fixed-size 3
-- 
2.17.1

