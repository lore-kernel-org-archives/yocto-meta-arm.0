Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.8308.1586338598987122229
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 02:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E6zR4PKJ;
 spf=pass (domain: arm.com, ip: 40.107.22.59, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0gNyEQ4uviNSBkX5AGJfAHFfiM7bPts0Hb8lVoQd+c=;
 b=E6zR4PKJ/W85kf9S3nj+XCjx/Ef0M7zFF9aK+Ghr53/ZgSPNOvEOoV+28RaYeIep3VE43r4De8hjx0iGgHHtQJjOY7YEMKcUDtUdkpqd45GuZTQY2nC5tPjDcuaE+KbUmemXC9rV1AAPYg0c72sqxad4EIOmcHoDRYfzdrrPl3U=
Received: from AM6P194CA0034.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::47)
 by DB6PR0802MB2341.eurprd08.prod.outlook.com (2603:10a6:4:89::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 09:36:31 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::af) by AM6P194CA0034.outlook.office365.com
 (2603:10a6:209:90::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 09:36:31 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Wed, 8 Apr 2020 09:36:30 +0000
Received: ("Tessian outbound 4b84da486446:v50"); Wed, 08 Apr 2020 09:36:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c43df9cc0ac96554
X-CR-MTA-TID: 64aa7808
Received: from 4a1d5a0f2403.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4B533B68-D3BB-418C-8AC2-F14148B1C072.1;
	Wed, 08 Apr 2020 09:36:24 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a1d5a0f2403.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Apr 2020 09:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPGamZvduee+8t6PqnPb7xQpPhWp0thdAZ9ITcJjMucNLsylo2RtJ50Yp1iypio/fwrQarFgxknKVmO05n/NBEx/blIvajW0T9+XpHnEy/AsKojud487qzrJFSNjL5+HofFGKLrh1hqF1x38YyHflfXs5qhcneXxEowMj9HVMGx4YU0LR1w5nPet7+Abz7icuTDiVMEf6L8ECHPPAguDCmzZ+geQhOpHz2rzDhWNd15ouwIiAPRtcrnwR+aZGqRnnXy+FaCbv2sDWMEIPMe0hbnzvoP3ILNkErUqqtCvxauDbWOsGL52V7RdmmmR1/HzQ3eEonu0CkAYgET2VBkNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0gNyEQ4uviNSBkX5AGJfAHFfiM7bPts0Hb8lVoQd+c=;
 b=kVT1xtQT+9u2vw7QpEgzHVM7PvMUM/XXGWplxgWqJIIwqjCbcuoEl5RmuUg5goy3WZgkYYUCd/8/P2dpFQIuS6oU+CrJeo/g50FDTO1wKBvqKUHqn3ci+ixcbyprk6OJIcJLjktfEXOyDJ5oOFh2n1nke8VrBcYNtvYSNc+5beNu00kmNJWFIRblQjrnPI+6VtkykQmi69OyiV4ygyfNWQ23AryFai54Pa1pkylLHUfmZ8mgX2TrMCnzg6hCn9BMPcgzqJUg7alQWSFC20qX8xqOV0l7+CDIA5ttt5YezYYK+Yqzd36/ZYzeq1lvBdBtZwAH24HWpNqFxFX7KssG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0gNyEQ4uviNSBkX5AGJfAHFfiM7bPts0Hb8lVoQd+c=;
 b=E6zR4PKJ/W85kf9S3nj+XCjx/Ef0M7zFF9aK+Ghr53/ZgSPNOvEOoV+28RaYeIep3VE43r4De8hjx0iGgHHtQJjOY7YEMKcUDtUdkpqd45GuZTQY2nC5tPjDcuaE+KbUmemXC9rV1AAPYg0c72sqxad4EIOmcHoDRYfzdrrPl3U=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB3103.eurprd08.prod.outlook.com (2603:10a6:803:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Wed, 8 Apr
 2020 09:36:22 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::18b3:4e3f:17e9:b358%7]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 09:36:22 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/2] meta-arm-bsp: Remove Xen specifics
Date: Wed,  8 Apr 2020 10:36:12 +0100
Message-ID: <1586338573-27238-2-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
References: <1586338573-27238-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 09:36:21 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a41dc377-d225-490c-59be-08d7dba051a5
X-MS-TrafficTypeDiagnostic: VI1PR08MB3103:|VI1PR08MB3103:|DB6PR0802MB2341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB23411EE0A4CBAA0FF518E46992C00@DB6PR0802MB2341.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(66556008)(66476007)(66946007)(478600001)(186003)(2616005)(6486002)(44832011)(26005)(6666004)(81166007)(4326008)(6916009)(30864003)(36756003)(956004)(66574012)(86362001)(2906002)(8676002)(52116002)(81156014)(7696005)(8936002)(16526019)(5660300002)(316002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RlokcdsFge1VKENUkG3WZPtxeKaYJToDvGHnZ1k3J4STMQbKol6yD45ElHcnt2wqYcEslmfSu/shyrgkl2lkfvG+G2aZTK4EafLmB28/GhI6+nix054Md68V9FRUcyWASuU8uNpQWuue7BxteoWrCEaSCsW6tD6H8Fvtggv+0zHONKCBishpxZcbpfDzDDHALnj1QuQe9EjSdD6cjR2YII1+xqJwYikZ9oo6J87zQ7Ho56whE5oS5ihYHXR/pi/tOogwqiBBJQyQKSt55SASXRP65hswvTbKgdgwyyt6qcdyJydP/ugy5RbH62O8IfltwuSb4T8t5iNFkVGPRS+zH57skNVRL0WPY31B3ncHo5Satlp8+Dyu7XzGeSyVoP+pN8Eg/EtBnjd4VmDkoFobkzUqH4DQtTovTduT8AEdoqthEI9w38kIvpzc5nhD/Dkk
X-MS-Exchange-AntiSpam-MessageData: pZCy7p2ZqXDz+AeS15VbbQ7bvp6Z5L92+8JHc3ObYipb/VYjRAPjiysHyUNmkEB6tEYt/B6ezI0eB0DmxrXFT7i8Ntn1iAjNnaeh9cwof5zqABvN7HdoOW+3oBqK4yJcm4WslYjZwfxt/K1SeT1I2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3103
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(2906002)(478600001)(70586007)(70206006)(26826003)(5660300002)(86362001)(82740400003)(47076004)(30864003)(36906005)(6916009)(81166007)(36756003)(316002)(7696005)(16526019)(186003)(4326008)(8936002)(8676002)(956004)(2616005)(66574012)(26005)(44832011)(6666004)(6486002)(336012)(356004)(81156014);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a96fede6-fb09-4c5d-0ec0-08d7dba04c85
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4ruI4CzhQaDOsbNJNnie1gAMhe1+y6CqIQVdFxj++NWd5R/dasHpWqaQtVeaA/cDR2q6xnBKuyYHk/GoF9JBjUFWzd0M9OLtOftFK7efbfh0xYTB3KJKVaf797HeKRiDXasAvE7mI1n48nvC+7iLtdW6UGpoqaMk/vOgXiJPuqaj+jnre/Cq/Uox0njQFPcAZKLvPOw2UysqGlBWVdrSkxIwxe2iyKRWxCvwN19msPMiCadKHOwgEEJPLjcZvnrpB2d3cmBZF7tZ/4EnS+a+ht5zrFlXdYup43BYiKFa5OZASsG/HP+XbN7JwEo5BcTzq86Ur59olrbL+dkEGyu7NcuyaiX9JjIHslj8PHGDKV3/hzNaB5GqwZToFafoF2rn3NQskEAd/r4OYTwmlamgGDxtXcW1z3/1tibO5SMtrWisj5YZ8s+hYgMIIEolDNfXhKCAiKhqm0U+H4+eFuiyaHyp4nYd6Y08HByXjHsaubB6J46jTv5NsHzabp9T5kuGr3iSwxR2zjnjRfe4+2+JJA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 09:36:30.6475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a41dc377-d225-490c-59be-08d7dba051a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2341
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Remove all variables, settings and operations specific to Xen from
meta-arm-bsp.

These implementations will be added later in another separate layer.

Change-Id: I971a6898f985f5ec7264da5ad5e4b6436067e3dd
Issue-Id: SCM-769
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/layer.conf                       |  5 --
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc       |  3 -
 meta-arm-bsp/conf/machine/gem5-arm64.conf          | 15 +----
 meta-arm-bsp/conf/machine/juno.conf                |  3 -
 .../boot-wrapper-aaarch64/boot-wrapper-aarch64.inc | 21 +-----
 .../files/juno-xen/images-r0.txt                   | 78 ------------------=
----
 .../files/juno-xen/images-r1.txt                   | 78 ------------------=
----
 .../files/juno-xen/images-r2.txt                   | 78 ------------------=
----
 .../trusted-firmware-a/files/juno-xen/uEnv.txt     | 15 -----
 .../trusted-firmware-a/trusted-firmware-a-juno.inc |  9 +--
 .../4.12.0/0001-trace-fix-build-with-gcc9.patch    | 56 ----------------
 ...ap-the-number-of-interrupt-lines-for-dom0.patch | 44 ------------
 .../recipes-extended/xen/files/fvp/defconfig       | 73 ------------------=
--
 .../recipes-extended/xen/files/juno/defconfig      | 73 ------------------=
--
 meta-arm-bsp/recipes-extended/xen/xen_4.%.bbappend | 28 --------
 .../recipes-extended/xen/xen_4.12.0.bbappend       | 10 ---
 .../bsp/arm-platforms/fvp/fvp-board.cfg            |  5 --
 .../arm-platforms/gem5-arm64/gem5-arm64-board.cfg  |  5 --
 18 files changed, 5 insertions(+), 594 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-=
xen/images-r0.txt
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-=
xen/images-r1.txt
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-=
xen/images-r2.txt
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-=
xen/uEnv.txt
 delete mode 100644 meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-tra=
ce-fix-build-with-gcc9.patch
 delete mode 100644 meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen=
-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
 delete mode 100644 meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
 delete mode 100644 meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
 delete mode 100644 meta-arm-bsp/recipes-extended/xen/xen_4.%.bbappend
 delete mode 100644 meta-arm-bsp/recipes-extended/xen/xen_4.12.0.bbappend

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 0632ba3..6d6862e 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -11,8 +11,3 @@ BBFILE_PRIORITY_meta-arm-bsp =3D "6"
=20
 LAYERDEPENDS_meta-arm-bsp =3D "core openembedded-layer meta-arm"
 LAYERSERIES_COMPAT_meta-arm-bsp =3D "warrior zeus"
-
-# We have patches for xen but meta-virtualization might not be there so fi=
lter
-# out recipes-extended/xen unless xen is activated in the features
-BBMASK +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'xen', '', \
-    '${LAYERDIR}/recipes-extended/xen/', d)}"
diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/co=
nf/machine/fvp-common/fvp.inc
index a02890d..702a1d2 100644
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
@@ -41,6 +41,3 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boo=
t"
=20
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_dram_defconfig"
-
-# Xen configuration
-XEN_CONFIG_EARLY_PRINTK =3D "fastmodel"
diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/=
machine/gem5-arm64.conf
index e2f58ad..e07cc81 100644
--- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
+++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
@@ -35,12 +35,9 @@ PREFERRED_VERSION_linux-yocto ?=3D "4.19%"
 # dtb (gem5-aarch64-dtb.bb)
 PREFERRED_PROVIDER_virtual/gem5-bootloader =3D "boot-wrapper-aarch64"
=20
-# Fix command line in the axf file
-BOOT_WRAPPER_AARCH64_CMDLINE =3D "${@bb.utils.contains('DISTRO_FEATURES', =
'xen',\
-    'console=3Dhvc0 root=3D/dev/vda rw', \
-    'earlyprintk=3Dpl011,0x1c090000 console=3DttyAMA0 root=3D/dev/vda rw m=
em=3D1G', \
-    d)}"
-
+BOOT_WRAPPER_AARCH64_CMDLINE ?=3D "\
+    earlyprintk=3Dpl011,0x1c090000 console=3DttyAMA0 root=3D/dev/vda rw me=
m=3D1G \
+    "
 # Use baremetal profile and axf file so dtb is in axf file
 GEM5_RUN_PROFILE =3D "configs/example/arm/baremetal.py"
 GEM5_RUN_KERNEL =3D "linux-system.axf"
@@ -50,12 +47,6 @@ GEM5_RUN_CMDLINE =3D ""
=20
 EXTRA_IMAGEDEPENDS +=3D "gem5-aarch64-native"
=20
-# Xen configuration
-XEN_CONFIG_EARLY_PRINTK =3D "vexpress"
-
-BOOT_WRAPPER_AARCH64_XEN_CMDLINE =3D "noreboot dom0_mem=3D256M console=3Dd=
tuart \
-    dtuart=3D/uart@1c090000 bootscrub=3D0"
-
 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh)=
.
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot =
time.
 PACKAGE_EXCLUDE_append =3D " rng-tools"
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machin=
e/juno.conf
index 3b16e6f..02ef226 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -25,6 +25,3 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boo=
t"
=20
 # Juno u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_juno_defconfig"
-
-# Xen configuration
-XEN_CONFIG_EARLY_PRINTK =3D "juno"
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aa=
rch64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aar=
ch64.inc
index b5397cf..3cd3917 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.i=
nc
@@ -24,16 +24,8 @@ BOOT_WRAPPER_AARCH64_KERNEL ??=3D "Image"
 # Kernel command line for the image
 BOOT_WRAPPER_AARCH64_CMDLINE ??=3D "rw"
=20
-# Xen image to put in the image
-# This should point to a file in the deploy image directory
-BOOT_WRAPPER_AARCH64_XEN ??=3D "xen-${MACHINE}"
-
-# Xen command line for the image
-BOOT_WRAPPER_AARCH64_XEN_CMDLINE ??=3D "noreboot dom0_mem=3D256M"
-
 # Image generated by boot wrapper
-BOOT_WRAPPER_AARCH64_IMAGE ?=3D "${@bb.utils.contains('DISTRO_FEATURES', '=
xen', \
-        'xen-system.axf', 'linux-system.axf', d)}"
+BOOT_WRAPPER_AARCH64_IMAGE ??=3D "linux-system.axf"
=20
 DEPENDS +=3D "virtual/kernel dtc-native"
=20
@@ -41,10 +33,6 @@ EXTRA_OECONF +=3D "--with-kernel-dir=3D${WORKDIR}/kernel=
"
 EXTRA_OECONF +=3D "--with-dtb=3D${WORKDIR}/kernel/dummy.dtb"
 EXTRA_OECONF +=3D "--with-cmdline=3D\"\""
 EXTRA_OECONF +=3D "--enable-psci --enable-gicv3"
-EXTRA_OECONF +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'xen', \
-        '--with-xen=3D${WORKDIR}/kernel/arch/arm64/boot/Image', '', d)}"
-EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', \
-        '--with-xen-cmdline=3D\"\"', '', d)}"
=20
 # unset LDFLAGS solves this error when compiling kernel modules:
 # aarch64-poky-linux-ld: unrecognized option '-Wl,-O1'
@@ -56,10 +44,6 @@ REAL_DTB =3D "${@os.path.basename(d.getVar('BOOT_WRAPPER=
_AARCH64_DEVICETREE'))}"
 EXTRA_OEMAKE +=3D "'KERNEL_DTB=3D${DEPLOY_DIR_IMAGE}/${REAL_DTB}'"
 EXTRA_OEMAKE +=3D "'KERNEL_IMAGE=3D${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARC=
H64_KERNEL}'"
 EXTRA_OEMAKE +=3D "'CMDLINE=3D${BOOT_WRAPPER_AARCH64_CMDLINE}'"
-EXTRA_OEMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', \
-        'XEN_IMAGE=3D${DEPLOY_DIR_IMAGE}/${BOOT_WRAPPER_AARCH64_XEN}', '',=
 d)}"
-EXTRA_OEMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', \
-        'XEN_CMDLINE=3D\"${BOOT_WRAPPER_AARCH64_XEN_CMDLINE}\"', '', d)}"
=20
=20
 do_configure_prepend() {
@@ -79,9 +63,6 @@ do_install[noexec] =3D "1"
 # We need the kernel to create an image
 do_deploy[depends] +=3D "virtual/kernel:do_deploy"
=20
-# We need xen if it is activated
-do_deploy[depends] +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'x=
en:do_deploy', '', d)}"
-
 do_deploy() {
     if [ ! -f ${DEPLOY_DIR_IMAGE}/${REAL_DTB} ]; then
         echo "ERROR: cannot find ${REAL_DTB} in ${DEPLOY_DIR_IMAGE}" >&2
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/ima=
ges-r0.txt b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/ima=
ges-r0.txt
deleted file mode 100644
index 177cf09..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/images-r0.=
txt
+++ /dev/null
@@ -1,78 +0,0 @@
-TITLE: Versatile Express Images Configuration File
-
-[IMAGES]
-TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-
-NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR0ADDRESS: 0x00000000          ;Image Flash Address
-NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
-NOR0LOAD: 00000000               ;Image Load Address
-NOR0ENTRY: 00000000              ;Image Entry Point
-
-NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
-NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
-NOR1LOAD: 00000000               ;Image Load Address
-NOR1ENTRY: 00000000              ;Image Entry Point
-
-NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR2ADDRESS: 0x00500000          ;Image Flash Address
-NOR2FILE: \SOFTWARE\Image        ;Image File Name
-NOR2NAME: norkern                ;Rename kernel to norkern
-NOR2LOAD: 00000000               ;Image Load Address
-NOR2ENTRY: 00000000              ;Image Entry Point
-
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file=
 extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-
-NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x01D00000          ;Image Flash Address
-NOR4FILE: \SOFTWARE\xen          ;Image File Name
-NOR4NAME: xen
-NOR4LOAD: 00000000               ;Image Load Address
-NOR4ENTRY: 00000000              ;Image Entry Point
-
-NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR5ADDRESS: 0x025C0000          ;Image Flash Address
-NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
-NOR5LOAD: 00000000               ;Image Load Address
-NOR5ENTRY: 00000000              ;Image Entry Point
-
-NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR6ADDRESS: 0x03E40000          ;Image Flash Address
-NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
-NOR6LOAD: 00000000               ;Image Load Address
-NOR6ENTRY: 00000000              ;Image Entry Point
-
-NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
-NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
-NOR7NAME: startup.nsh
-NOR7LOAD: 00000000               ;Image Load Address
-NOR7ENTRY: 00000000              ;Image Entry Point
-
-NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
-NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
-NOR8NAME: BOOTENV
-NOR8LOAD: 00000000               ;Image Load Address
-NOR8ENTRY: 00000000              ;Image Entry Point
-
-NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02600000          ;Image Flash Address
-NOR9FILE: \SOFTWARE\selftest     ;Image File Name
-NOR9LOAD: 00000000               ;Image Load Address
-NOR9ENTRY: 00000000              ;Image Entry Point
-
-NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR10ADDRESS: 0x02780000          ;Image Flash Address
-NOR10NAME: uEnv.txt
-NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-NOR10LOAD: 00000000               ;Image Load Address
-NOR10ENTRY: 00000000              ;Image Entry Point
-
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/ima=
ges-r1.txt b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/ima=
ges-r1.txt
deleted file mode 100644
index ac40bf0..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/images-r1.=
txt
+++ /dev/null
@@ -1,78 +0,0 @@
-TITLE: Versatile Express Images Configuration File
-
-[IMAGES]
-TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-
-NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR0ADDRESS: 0x00000000          ;Image Flash Address
-NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
-NOR0LOAD: 00000000               ;Image Load Address
-NOR0ENTRY: 00000000              ;Image Entry Point
-
-NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
-NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
-NOR1LOAD: 00000000               ;Image Load Address
-NOR1ENTRY: 00000000              ;Image Entry Point
-
-NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR2ADDRESS: 0x00500000          ;Image Flash Address
-NOR2FILE: \SOFTWARE\Image        ;Image File Name
-NOR2NAME: norkern                ;Rename kernel to norkern
-NOR2LOAD: 00000000               ;Image Load Address
-NOR2ENTRY: 00000000              ;Image Entry Point
-
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file=
 extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-
-NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x01D00000          ;Image Flash Address
-NOR4FILE: \SOFTWARE\xen          ;Image File Name
-NOR4NAME: xen
-NOR4LOAD: 00000000               ;Image Load Address
-NOR4ENTRY: 00000000              ;Image Entry Point
-
-NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR5ADDRESS: 0x025C0000          ;Image Flash Address
-NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
-NOR5LOAD: 00000000               ;Image Load Address
-NOR5ENTRY: 00000000              ;Image Entry Point
-
-NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR6ADDRESS: 0x03E40000          ;Image Flash Address
-NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
-NOR6LOAD: 00000000               ;Image Load Address
-NOR6ENTRY: 00000000              ;Image Entry Point
-
-NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
-NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
-NOR7NAME: startup.nsh
-NOR7LOAD: 00000000               ;Image Load Address
-NOR7ENTRY: 00000000              ;Image Entry Point
-
-NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
-NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
-NOR8NAME: BOOTENV
-NOR8LOAD: 00000000               ;Image Load Address
-NOR8ENTRY: 00000000              ;Image Entry Point
-
-NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02600000          ;Image Flash Address
-NOR9FILE: \SOFTWARE\selftest     ;Image File Name
-NOR9LOAD: 00000000               ;Image Load Address
-NOR9ENTRY: 00000000              ;Image Entry Point
-
-NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR10ADDRESS: 0x02780000          ;Image Flash Address
-NOR10NAME: uEnv.txt
-NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-NOR10LOAD: 00000000               ;Image Load Address
-NOR10ENTRY: 00000000              ;Image Entry Point
-
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/ima=
ges-r2.txt b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/ima=
ges-r2.txt
deleted file mode 100644
index 423a574..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/images-r2.=
txt
+++ /dev/null
@@ -1,78 +0,0 @@
-TITLE: Versatile Express Images Configuration File
-
-[IMAGES]
-TOTALIMAGES: 11                  ;Number of Images (Max: 32)
-
-NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR0ADDRESS: 0x00000000          ;Image Flash Address
-NOR0FILE: \SOFTWARE\fip.bin      ;Image File Name
-NOR0LOAD: 00000000               ;Image Load Address
-NOR0ENTRY: 00000000              ;Image Entry Point
-
-NOR1UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR1ADDRESS: 0x03EC0000          ;Image Flash Address
-NOR1FILE: \SOFTWARE\bl1.bin      ;Image File Name
-NOR1LOAD: 00000000               ;Image Load Address
-NOR1ENTRY: 00000000              ;Image Entry Point
-
-NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR2ADDRESS: 0x00500000          ;Image Flash Address
-NOR2FILE: \SOFTWARE\Image        ;Image File Name
-NOR2NAME: norkern                ;Rename kernel to norkern
-NOR2LOAD: 00000000               ;Image Load Address
-NOR2ENTRY: 00000000              ;Image Entry Point
-
-NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
-NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
-NOR3NAME: board.dtb              ;Specify target filename to preserve file=
 extension
-NOR3LOAD: 00000000               ;Image Load Address
-NOR3ENTRY: 00000000              ;Image Entry Point
-
-NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x01D00000          ;Image Flash Address
-NOR4FILE: \SOFTWARE\xen          ;Image File Name
-NOR4NAME: xen
-NOR4LOAD: 00000000               ;Image Load Address
-NOR4ENTRY: 00000000              ;Image Entry Point
-
-NOR5UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR5ADDRESS: 0x025C0000          ;Image Flash Address
-NOR5FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
-NOR5LOAD: 00000000               ;Image Load Address
-NOR5ENTRY: 00000000              ;Image Entry Point
-
-NOR6UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR6ADDRESS: 0x03E40000          ;Image Flash Address
-NOR6FILE: \SOFTWARE\scp_bl1.bin  ;Image File Name
-NOR6LOAD: 00000000               ;Image Load Address
-NOR6ENTRY: 00000000              ;Image Entry Point
-
-NOR7UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR7ADDRESS: 0x0BF00000          ;Image Flash Address
-NOR7FILE: \SOFTWARE\startup.nsh  ;Image File Name
-NOR7NAME: startup.nsh
-NOR7LOAD: 00000000               ;Image Load Address
-NOR7ENTRY: 00000000              ;Image Entry Point
-
-NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x0BFC0000          ;Image Flash Address
-NOR8FILE: \SOFTWARE\blank.img    ;Image File Name
-NOR8NAME: BOOTENV
-NOR8LOAD: 00000000               ;Image Load Address
-NOR8ENTRY: 00000000              ;Image Entry Point
-
-NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02600000          ;Image Flash Address
-NOR9FILE: \SOFTWARE\selftest     ;Image File Name
-NOR9LOAD: 00000000               ;Image Load Address
-NOR9ENTRY: 00000000              ;Image Entry Point
-
-NOR10UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR10ADDRESS: 0x02780000          ;Image Flash Address
-NOR10NAME: uEnv.txt
-NOR10FILE: \SOFTWARE\uEnv.txt     ;Image File Name
-NOR10LOAD: 00000000               ;Image Load Address
-NOR10ENTRY: 00000000              ;Image Entry Point
-
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/uEn=
v.txt b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/uEnv.txt
deleted file mode 100644
index 4307b69..0000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno-xen/uEnv.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-xen_name=3Dxen
-xen_addr=3D0x84000000
-uenvcmd=3Drun mybootcmd
-mybootcmd=3Decho Loading custom boot command; \
-echo Loading kernel; \
-afs load ${kernel_name} ${kernel_addr} ; \
-if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kernel=
_name}; afs load ${kernel_alt_name} ${kernel_addr}; fi; \
-echo Loading device tree; \
-afs load  ${fdtfile} ${fdt_addr}; \
-if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfile};=
 \
-afs load ${fdt_alt_name} ${fdt_addr}; fi; fdt addr ${fdt_addr}; fdt resize=
; \
-echo Loading Xen; \
-afs load  ${xen_name} ${xen_addr}; \
-if test $? -eq 0; then echo Booting Xen; bootefi ${xen_addr} ${fdt_addr}; =
fi;
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
juno.inc
index cd921b0..c62197d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.i=
nc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.i=
nc
@@ -15,7 +15,7 @@ SRC_URI[junofip.sha256sum] =3D "b8a3909bb3bc4350a8771b863=
193a3e33b358e2a727624a77c
=20
 # Add our how images.txt
=20
-FILESEXTRAPATHS_prepend_juno :=3D "${THISDIR}/files/${@bb.utils.contains('=
DISTRO_FEATURES', 'xen', 'juno-xen', 'juno', d)}:"
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files/juno:"
=20
 SRC_URI_append_juno =3D " \
 	file://images-r0.txt \
@@ -31,7 +31,6 @@ EXTRA_OEMAKE_append_juno =3D " SCP_BL2=3D${WORKDIR}/juno-=
oe-uboot/SOFTWARE/scp_bl2.b
 JUNO_EXTRA_DEPS ?=3D ""
 JUNO_EXTRA_DEPS_juno =3D ""
 JUNO_EXTRA_DEPS_juno +=3D "virtual/kernel:do_deploy"
-JUNO_EXTRA_DEPS_juno +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xen', =
'xen:do_deploy', '', d)}"
=20
 do_deploy[depends] +=3D "${JUNO_EXTRA_DEPS}"
=20
@@ -55,12 +54,6 @@ do_deploy_append() {
 		${DEPLOY_DIR_IMAGE}/Image \
 		${WORKDIR}/juno-oe-uboot/SOFTWARE/Image
=20
-	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" =
=3D "yes" ]; then
-		cp -a \
-			${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
-			${WORKDIR}/juno-oe-uboot/SOFTWARE/xen
-	fi
-
     # u-boot environment file
     cp -a ${WORKDIR}/uEnv.txt \
         ${WORKDIR}/juno-oe-uboot/SOFTWARE/
diff --git a/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-trace-fix-=
build-with-gcc9.patch b/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001=
-trace-fix-build-with-gcc9.patch
deleted file mode 100644
index 8ecc904..0000000
--- a/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-trace-fix-build-w=
ith-gcc9.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 0dcd945a675cd12d283121e9b7f1626104b60bcc Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Tue, 4 Jun 2019 15:32:55 +0200
-Subject: [PATCH] trace: fix build with gcc9
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-While I've not observed this myself, gcc 9 (imo validly) reportedly may
-complain
-
-trace.c: In function '__trace_hypercall':
-trace.c:826:19: error: taking address of packed member of 'struct <anonymo=
us>' may result in an unaligned pointer value [-Werror=3Daddress-of-packed-=
member]
-  826 |     uint32_t *a =3D d.args;
-
-and the fix is rather simple - remove the __packed attribute. Introduce
-a BUILD_BUG_ON() as replacement, for the unlikely case that Xen might
-get ported to an architecture where array alignment higher that that of
-its elements.
-
-Reported-by: Martin Li=C5=A1ka <martin.liska@suse.com>
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Acked-by: George Dunlap <george.dunlap@citrix.com>
-master commit: 3fd3b266d4198c06e8e421ca515d9ba09ccd5155
-master date: 2019-05-13 09:51:23 +0200
----
- xen/common/trace.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/xen/common/trace.c b/xen/common/trace.c
-index cc294fc384..d1ef81407b 100644
---- a/xen/common/trace.c
-+++ b/xen/common/trace.c
-@@ -819,12 +819,18 @@ unlock:
- void __trace_hypercall(uint32_t event, unsigned long op,
-                        const xen_ulong_t *args)
- {
--    struct __packed {
-+    struct {
-         uint32_t op;
-         uint32_t args[6];
-     } d;
-     uint32_t *a =3D d.args;
-=20
-+    /*
-+     * In lieu of using __packed above, which gcc9 legitimately doesn't
-+     * like in combination with the address of d.args[] taken.
-+     */
-+    BUILD_BUG_ON(offsetof(typeof(d), args) !=3D sizeof(d.op));
-+
- #define APPEND_ARG32(i)                         \
-     do {                                        \
-         unsigned i_ =3D (i);                      \
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Ca=
p-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-bsp/recipes-exten=
ded/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom=
0.patch
deleted file mode 100644
index 792bc9e..0000000
--- a/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-n=
umber-of-interrupt-lines-for-dom0.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a41feccdb6c03f12bddb4fb650a0465f0ed6eeca Mon Sep 17 00:00:00 2001
-From: Lukas Juenger <juenger@ice.rwth-aachen.de>
-Date: Fri, 5 Apr 2019 15:54:04 +0200
-Subject: [PATCH] xen/arm: Cap the number of interrupt lines for dom0
-
-Dom0 vGIC will use the same number of interrupt lines as the hardware GIC.
-While the hardware GIC can support up to 1020 interrupt lines,
-the vGIC is only supporting up to 992 interrupt lines.
-This means that Xen will not be able to boot on platforms where the hardwa=
re
-GIC supports more than 992 interrupt lines.
-While it would make sense to increase the limits in the vGICs, this is not
-trivial because of the design choices.
-At the moment, only models seem to report the maximum of interrupt lines.
-They also do not have any interrupt wired above the 992 limit.
-So it should be fine to cap the number of interrupt lines for dom0 to 992 =
lines.
-
-Signed-off-by: Lukas Juenger <juenger@ice.rwth-aachen.de>
-Acked-by: Julien Grall <julien.grall@arm.com>
----
- xen/arch/arm/setup.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
-index 444857a967..ccb0f181ea 100644
---- a/xen/arch/arm/setup.c
-+++ b/xen/arch/arm/setup.c
-@@ -888,7 +888,13 @@ void __init start_xen(unsigned long boot_phys_offset,
-     /* Create initial domain 0. */
-     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
-     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
--    dom0_cfg.arch.nr_spis =3D gic_number_lines() - 32;
-+    /*
-+     * Xen vGIC supports a maximum of 992 interrupt lines.
-+     * 32 are substracted to cover local IRQs.
-+     */
-+    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 992)=
 - 32;
-+    if ( gic_number_lines() > 992 )
-+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
-     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
-=20
-     dom0 =3D domain_create(0, &dom0_cfg, true);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig b/meta-a=
rm-bsp/recipes-extended/xen/files/fvp/defconfig
deleted file mode 100644
index f13327c..0000000
--- a/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
+++ /dev/null
@@ -1,73 +0,0 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/arm 4.12.0 Configuration
-#
-CONFIG_64BIT=3Dy
-CONFIG_ARM_64=3Dy
-CONFIG_ARM=3Dy
-CONFIG_ARCH_DEFCONFIG=3D"arch/arm/configs/arm64_defconfig"
-
-#
-# Architecture Features
-#
-CONFIG_NR_CPUS=3D128
-CONFIG_GICV3=3Dy
-CONFIG_HVM=3Dy
-# CONFIG_NEW_VGIC is not set
-CONFIG_SBSA_VUART_CONSOLE=3Dy
-CONFIG_ARM_SSBD=3Dy
-CONFIG_HARDEN_BRANCH_PREDICTOR=3Dy
-
-#
-# ARM errata workaround via the alternative framework
-#
-CONFIG_ARM64_ERRATUM_827319=3Dy
-CONFIG_ARM64_ERRATUM_824069=3Dy
-CONFIG_ARM64_ERRATUM_819472=3Dy
-CONFIG_ARM64_ERRATUM_832075=3Dy
-CONFIG_ARM64_ERRATUM_834220=3Dy
-CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=3Dy
-CONFIG_ALL_PLAT=3Dy
-# CONFIG_QEMU is not set
-# CONFIG_RCAR3 is not set
-# CONFIG_MPSOC is not set
-# CONFIG_NO_PLAT is not set
-CONFIG_ALL64_PLAT=3Dy
-# CONFIG_ALL32_PLAT is not set
-CONFIG_MPSOC_PLATFORM=3Dy
-
-#
-# Common Features
-#
-CONFIG_HAS_ALTERNATIVE=3Dy
-CONFIG_HAS_DEVICE_TREE=3Dy
-CONFIG_MEM_ACCESS=3Dy
-CONFIG_HAS_PDX=3Dy
-# CONFIG_XSM is not set
-CONFIG_SCHED_CREDIT=3Dy
-CONFIG_SCHED_CREDIT2=3Dy
-CONFIG_SCHED_RTDS=3Dy
-# CONFIG_SCHED_ARINC653 is not set
-CONFIG_SCHED_NULL=3Dy
-CONFIG_SCHED_DEFAULT=3D"credit2"
-# CONFIG_LIVEPATCH is not set
-CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=3Dy
-CONFIG_CMDLINE=3D""
-CONFIG_DOM0_MEM=3D""
-
-#
-# Device Drivers
-#
-CONFIG_HAS_NS16550=3Dy
-CONFIG_HAS_CADENCE_UART=3Dy
-CONFIG_HAS_MVEBU=3Dy
-CONFIG_HAS_PL011=3Dy
-CONFIG_HAS_SCIF=3Dy
-CONFIG_HAS_PASSTHROUGH=3Dy
-CONFIG_ARM_SMMU=3Dy
-CONFIG_DEFCONFIG_LIST=3D"arch/arm/configs/arm64_defconfig"
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
diff --git a/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig b/meta-=
arm-bsp/recipes-extended/xen/files/juno/defconfig
deleted file mode 100644
index f13327c..0000000
--- a/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
+++ /dev/null
@@ -1,73 +0,0 @@
-#
-# Automatically generated file; DO NOT EDIT.
-# Xen/arm 4.12.0 Configuration
-#
-CONFIG_64BIT=3Dy
-CONFIG_ARM_64=3Dy
-CONFIG_ARM=3Dy
-CONFIG_ARCH_DEFCONFIG=3D"arch/arm/configs/arm64_defconfig"
-
-#
-# Architecture Features
-#
-CONFIG_NR_CPUS=3D128
-CONFIG_GICV3=3Dy
-CONFIG_HVM=3Dy
-# CONFIG_NEW_VGIC is not set
-CONFIG_SBSA_VUART_CONSOLE=3Dy
-CONFIG_ARM_SSBD=3Dy
-CONFIG_HARDEN_BRANCH_PREDICTOR=3Dy
-
-#
-# ARM errata workaround via the alternative framework
-#
-CONFIG_ARM64_ERRATUM_827319=3Dy
-CONFIG_ARM64_ERRATUM_824069=3Dy
-CONFIG_ARM64_ERRATUM_819472=3Dy
-CONFIG_ARM64_ERRATUM_832075=3Dy
-CONFIG_ARM64_ERRATUM_834220=3Dy
-CONFIG_ARM64_HARDEN_BRANCH_PREDICTOR=3Dy
-CONFIG_ALL_PLAT=3Dy
-# CONFIG_QEMU is not set
-# CONFIG_RCAR3 is not set
-# CONFIG_MPSOC is not set
-# CONFIG_NO_PLAT is not set
-CONFIG_ALL64_PLAT=3Dy
-# CONFIG_ALL32_PLAT is not set
-CONFIG_MPSOC_PLATFORM=3Dy
-
-#
-# Common Features
-#
-CONFIG_HAS_ALTERNATIVE=3Dy
-CONFIG_HAS_DEVICE_TREE=3Dy
-CONFIG_MEM_ACCESS=3Dy
-CONFIG_HAS_PDX=3Dy
-# CONFIG_XSM is not set
-CONFIG_SCHED_CREDIT=3Dy
-CONFIG_SCHED_CREDIT2=3Dy
-CONFIG_SCHED_RTDS=3Dy
-# CONFIG_SCHED_ARINC653 is not set
-CONFIG_SCHED_NULL=3Dy
-CONFIG_SCHED_DEFAULT=3D"credit2"
-# CONFIG_LIVEPATCH is not set
-CONFIG_SUPPRESS_DUPLICATE_SYMBOL_WARNINGS=3Dy
-CONFIG_CMDLINE=3D""
-CONFIG_DOM0_MEM=3D""
-
-#
-# Device Drivers
-#
-CONFIG_HAS_NS16550=3Dy
-CONFIG_HAS_CADENCE_UART=3Dy
-CONFIG_HAS_MVEBU=3Dy
-CONFIG_HAS_PL011=3Dy
-CONFIG_HAS_SCIF=3Dy
-CONFIG_HAS_PASSTHROUGH=3Dy
-CONFIG_ARM_SMMU=3Dy
-CONFIG_DEFCONFIG_LIST=3D"arch/arm/configs/arm64_defconfig"
-
-#
-# Debugging Options
-#
-# CONFIG_DEBUG is not set
diff --git a/meta-arm-bsp/recipes-extended/xen/xen_4.%.bbappend b/meta-arm-=
bsp/recipes-extended/xen/xen_4.%.bbappend
deleted file mode 100644
index c41b658..0000000
--- a/meta-arm-bsp/recipes-extended/xen/xen_4.%.bbappend
+++ /dev/null
@@ -1,28 +0,0 @@
-# xen settings
-
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
-
-#
-# Define early console based on board parameters
-#
-
-# This should be set in board.conf or local.conf to enable early printk in=
 xen
-XEN_CONFIG_EARLY_PRINTK ??=3D "disable"
-
-EXTRA_OEMAKE +=3D "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disabl=
e', \
-    '', ' CONFIG_DEBUG=3Dy CONFIG_EARLY_PRINTK=3D${XEN_CONFIG_EARLY_PRINTK=
}',d)}"
-
-# Foundation-armv8 support
-COMPATIBLE_MACHINE_foundation-armv8 =3D "foundation-armv8"
-
-SRC_URI_append_foundation-armv8 =3D " file://fvp/defconfig"
-
-# FVP Base support
-COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
-
-SRC_URI_append_fvp-base =3D " file://fvp/defconfig"
-
-# Juno support
-COMPATIBLE_MACHINE_juno =3D "juno"
-
-SRC_URI_append_juno =3D " file://juno/defconfig"
diff --git a/meta-arm-bsp/recipes-extended/xen/xen_4.12.0.bbappend b/meta-a=
rm-bsp/recipes-extended/xen/xen_4.12.0.bbappend
deleted file mode 100644
index 87b1f63..0000000
--- a/meta-arm-bsp/recipes-extended/xen/xen_4.12.0.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-# xen version specific patch information
-
-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
-
-# Solve trace.c compilation error on 4.12.0
-# This should only be applied for 4.12.0 (solved in greater versions)
-SRC_URI +=3D "file://4.12.0/0001-trace-fix-build-with-gcc9.patch"
-
-# Fix problem with number of interrupts on gem5
-SRC_URI_append_gem5-arm64 =3D " file://4.12.0/0001-xen-arm-Cap-the-number-=
of-interrupt-lines-for-dom0.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/fvp/fvp-board.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platfor=
ms-kmeta/bsp/arm-platforms/fvp/fvp-board.cfg
index e10c003..2fd0264 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp/fvp-board.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp/fvp-board.cfg
@@ -9,8 +9,3 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
=20
 CONFIG_CPU_IDLE=3Dy
 CONFIG_ARM_CPUIDLE=3Dy
-
-# We need to turn off SVE support in the Linux kernel otherwise Xen is sto=
pping
-# Linux kernel with a coredump while trying to access ZEN bit of CPACR1 co=
re
-# register.
-# CONFIG_ARM64_SVE is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/gem5-arm64/gem5-arm64-board.cfg b/meta-arm-bsp/recipes-kernel/lin=
ux/arm-platforms-kmeta/bsp/arm-platforms/gem5-arm64/gem5-arm64-board.cfg
index b1b20e3..56bb9e6 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/gem5-arm64/gem5-arm64-board.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/gem5-arm64/gem5-arm64-board.cfg
@@ -21,8 +21,3 @@ CONFIG_MFD_VEXPRESS_SYSREG=3Dy
 # Turn off RAID to speed up boot
 CONFIG_MD=3Dn
 CONFIG_BTRFS_FS=3Dn
-
-# We need to turn off SVE support in the Linux kernel otherwise Xen is sto=
pping
-# Linux kernel with a coredump while trying to access ZEN bit of CPACR1 co=
re
-# register.
-# CONFIG_ARM64_SVE is not set
--=20
2.7.4

