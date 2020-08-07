Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web10.2825.1596792385668035674
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cWkWtXz4;
 spf=pass (domain: arm.com, ip: 40.107.8.40, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL1PL4O/J5NH+mxwk72uEboIKZAS7vgccZR5yQ4eloc=;
 b=cWkWtXz4ZbIuIc1goZYmubeUYKdXG4Mk15PVwNnCePD6Uz+UzTUrCfG0FmNbWhbXc/OirPyVrSGHcES8hmjodMj41saCmN/Y991AjN0gADnnUeObuSxPaT+Z0N1Abg+p+miMf6c/3kdB+sShKjun2iklrm5nhhLJODwS++oPpPg=
Received: from AM5PR1001CA0039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::16) by HE1PR0802MB2603.eurprd08.prod.outlook.com
 (2603:10a6:3:e0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:21 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::61) by AM5PR1001CA0039.outlook.office365.com
 (2603:10a6:206:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:21 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 07 Aug 2020 09:26:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aac9a3af25c574ad
X-CR-MTA-TID: 64aa7808
Received: from a91015f4f14a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 89AF810A-6032-4ABF-8DF0-B1AED816FFFD.1;
	Fri, 07 Aug 2020 09:26:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a91015f4f14a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpnXZ4FZOoPeM6bFcyhG21+YUp588XkkKxjDzKz6oHYBgWkfSfT0kjFURJ8yUOmA5BcBcRUAz3JIP+c7Kvur/BEoHp9u+0UiTD84wk3O/0iz1tx9nxmaHbplHFuVdXkS5jLoMUSdZP5c3f8fT8uSjCSsAauitT1zMBtcPh3ZAL18Wx2/7Lxexp6/KFYebCX258t9UIdmTdg63KcRHXEezWRxfTzqY23fZONCJG1fKsNgbcQTH/3wCt5rO1Tqzsofb56vdF6NbgBXjdjts6VSB9wU1JG7vdLIuxENtimZWdShpjHl5OsH7ajAkxCxcrQIjfqGoapH/ExaPi2OrSAAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL1PL4O/J5NH+mxwk72uEboIKZAS7vgccZR5yQ4eloc=;
 b=N/0hsVlQorA1fBaBj20cX1vOJ/nbvCO6wJvx6TxLlaJcPcZ9jGBweiL7zdObP5ZxuwS762PvA5+TohkOlpR9FTDCAtZ+o9mbduOWSfVXmuW4Qm6/g79U6z6aH4/uhS3glW27nDke/eaCk06tegDtVMGcOE1mlyQOgmmrIO7MUSaeggdq8Af6lidUEtQ27xyS6H8UAFSVpXvvoYn44eMH+B9bLhgSxlwB/5tnlB1QeMf+p9QrE8y/J4KINjM7rLnQd++xSprioC0sZlUpFjL7ssujfDKY2JTmkajLNSSiyd1sD5M6ITO9N40Dsu05dCwEUf6KvMFygMu/xwskpfNG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL1PL4O/J5NH+mxwk72uEboIKZAS7vgccZR5yQ4eloc=;
 b=cWkWtXz4ZbIuIc1goZYmubeUYKdXG4Mk15PVwNnCePD6Uz+UzTUrCfG0FmNbWhbXc/OirPyVrSGHcES8hmjodMj41saCmN/Y991AjN0gADnnUeObuSxPaT+Z0N1Abg+p+miMf6c/3kdB+sShKjun2iklrm5nhhLJODwS++oPpPg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:14 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:14 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 2/9] arm-bsp/machine: adding corstone700-fvp machine
Date: Fri,  7 Aug 2020 10:25:46 +0100
Message-Id: <20200807092553.18876-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
References: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:12 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a633fb5-5eb2-408e-a7a2-08d83ab3f263
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|HE1PR0802MB2603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB26038726F2AD4A736C6CC057FD490@HE1PR0802MB2603.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 M6nuHfWbjFfN/FsP4PaE+VbSmRppQVz9lCIwMhc9R28nr5tQzjFDBkftJn2bPP3slw8XhtCSqoptGs4laLIm4OQ7ttJmB8wQKdjjwwa9dADtEtft3A7qg6V3GZbq9vQUo296ybbdHGr3VVfHUcoEY7FLeBUdpV5D4Smpr6Bc0E3Ix9WJpSvVBpmZkzTPmIxNE2W4P50jkdR2M9S0q6lw8fWHMtULLMS7ddtAhfZzhYv7/PW2XkuXlGmiOqBppUGE/RBUVE7BB6foHJfbDy1rOIk5ofU5uX8Zm1KPcC3xCN8kFCfU32m3lxdkAhRCW+SnVGzTOswCfwijZ6dPCM/wGVQ+FWBJpXpDL0lEw1+ofeGlmYoGVqiCdosk4QokCcA3zUOqiHGLmi7ZIDKkhbj43A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(4326008)(9686003)(6666004)(86362001)(6916009)(8936002)(6486002)(956004)(2616005)(7696005)(16526019)(52116002)(186003)(1076003)(2906002)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(54906003)(966005)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 aCKfIcNOH9Lk89UgkwoPUwUiIeOaeNPdYHJ4/5LxKg3BtYXSvTjzoDAoFvqjX3SE//frSUkdoN7yS2wJbq4pwrmtd2VSK2IcRCkpuY+m28GDgqFDXvgoqWF0AYOTo8u4CrMB2prY8Cr3iJL347PFUh8wrT/Q2mbz24vOU/jmTsP3uffbD25nVUTs97dVSz43PfCBMpLyAoqkAy7uIgSg73ga591WHRS8FxR96X4s4n2cYEDDH8CJnY/aG7bjx9bQgyDiQv4suRYl47wuZGvQ1neMob2cBUSl6fqVefYmqK4J4jLTGXHDibSI5CyffNMGDjtWNZsZufPNRcmaLDFHSXqkiJlntgnl9ra8uxkiWBbBSYQaDzCYjDC9UtWfAsqxbwf+OM8rlVWyAyq69G8xicLmXrIOPU3AtfLGYwwGxfVdORraNKuIzFXtHwDOE/lyNG5t1fCHwx6lKRNCUjEFLXfFK1nKI0MsUd6/Hb6yFAHByAF7JJA0lZbS76UfzM1FAGkfzdTC4AptLxJPHhEucrSE6cjczcILCgBuCELtd+08FQPCxs6PDK6Rw+Z+idgWkZ3e2dlxbuG8jnro21BoCBVDt42gHUSO8fCpDnl+OLFm3f7+jT4fcJbZISIQRhvLLCnB7jJT9zJLDIAt+C8p3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32e73358-bdfe-4d93-0179-08d83ab3ee06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5m4GUiMjO+6j4hB5BJTH23o9eAlmkgIf6uKB3CDrc6jt9xxkqS0ncm9SOyVa4Fk6ToJoHyvC18Ikiu5AROOlANl8HKt/UFwy1E/I8c+fkHMBFDbtxuHdAgopORxCj+LQT4UoExHE8pendClIon4m31XYI7FImsqcSUS7FVfIMh6oyA58l9iJLdBNhvUEYGqYkFa4DOFeTCHOuK8lkvZaq3/gWi9+T+Z/qig7SO92pidYU7kAGAbGsuKjvHLbaN8ZCh0o6nxpxMtEnAGkxeiHbx4X7rdN226QQTMJAyULtR6dt0HIE9DGa5hScQfYxFMNw9E0fPTq1m7TIHTASNg/wTLkin7kV4Thvf5egfmMrDWRdpyN/D+ZqP20DvlOh+MAujzWUFKFKQGpF3YUDGlrVOFGJcM8s/9xXucS5KFUREFRsnmyr0iTfTNgQ5uGESRi0J6pJ3+xf6b2OeZlWjy+ieGKwGROsPcKqAG//gId+BA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966005)(82740400003)(7696005)(82310400002)(8676002)(966005)(47076004)(8936002)(16526019)(2906002)(6486002)(5660300002)(70206006)(70586007)(186003)(81166007)(478600001)(26005)(6666004)(4326008)(356005)(86362001)(54906003)(336012)(2616005)(956004)(36906005)(9686003)(36756003)(316002)(83380400001)(6916009)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:21.2499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a633fb5-5eb2-408e-a7a2-08d83ab3f263
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2603
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This machine provides corstone700 platform on FVP.

For more information about the platform, please check:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444=
/corstone-700

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

diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/=
conf/machine/corstone700-fvp.conf
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
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-b=
sp/conf/machine/include/corstone700.inc
new file mode 100644
index 0000000..67cf153
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -0,0 +1,14 @@
+# Common configuration for all Corstone700 machines
+
+require conf/machine/include/tune-cortexa32.inc
+
+MACHINEOVERRIDES =3D. "corstone700:"
+
+SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
+
+PREFERRED_PROVIDER_virtual/kernel_corstone700 =3D "linux-stable"
+PREFERRED_VERSION_linux-stable ?=3D "5.6%"
+
+VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
+
+WKS_FILE ?=3D "arm-reference-image.corstone700.wks"
diff --git a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks b/meta-ar=
m-bsp/wic/arm-reference-image.corstone700.wks
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
+part --source rawcopy --sourceparams=3D"file=3Dspitoc.bin" --no-table --al=
ign 1 --fixed-size 1k
+
+part --source rawcopy --sourceparams=3D"file=3Dse_ramfw.bin" --no-table --=
align 1 --fixed-size 32k
+
+# Rawcopy of the FIP binary
+part --source rawcopy --sourceparams=3D"file=3Dfip.bin-corstone700" --no-t=
able --align 1 --fixed-size 991k
+
+# Rawcopy of the rootfs
+part --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/arm-referen=
ce-image-${MACHINE}.cramfs-xip" --no-table --fixed-size 2
+
+# Rawcopy of the kernel binary
+part --source rawcopy --sourceparams=3D"file=3DxipImage" --no-table --fixe=
d-size 3
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
