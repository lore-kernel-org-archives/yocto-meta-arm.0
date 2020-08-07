Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.70])
 by mx.groups.io with SMTP id smtpd.web10.5217.1596804149667020866
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ngcYBJFI;
 spf=pass (domain: arm.com, ip: 40.107.2.70, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Suh+YZth27IzXP+1Xo1VUx4zfhD77qNH8B5kFSjS5Ns=;
 b=ngcYBJFIEPKx1D3qE9y6Fu9gGnWalDy1YTJtTpMV17zn4tm5LR+SggKwbKk9O3zeddGKj715bEH6/Vf3QIqjfVS3KoRUN1Xugh0LDy9MEOeUE8RwxqACItDrreBOua4z4DQQPMeQP/olxVQ1lKih/VsOcbCkMA5nkrtKpBRj6og=
Received: from AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18)
 by AM0PR08MB3986.eurprd08.prod.outlook.com (2603:10a6:208:128::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 12:42:26 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::c8) by AM6PR08CA0030.outlook.office365.com
 (2603:10a6:20b:c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:26 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 07 Aug 2020 12:42:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf3af647fecdabac
X-CR-MTA-TID: 64aa7808
Received: from f74f662c15cb.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 545C75C3-AAA4-4841-BB27-7702880DD8F8.1;
	Fri, 07 Aug 2020 12:42:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f74f662c15cb.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLhEupH/KYhY/KgjmwpUNklNgME5zOzbsHhGDZ9s2Mb84FOdPZY3DjbA4waa10yWwYg/OU7NZo9kinxh+pixb5QDp5rRdkj/d3DuWfJU/BTUuXvxlMciJFehB/p0G8bhPKDRmbBFHt8LF/PBaCgy98sGXZacBKQIPhfunNtEoF0quctYvmyt7Qtya5k+zIJHsFbwp7eEyyEY0kg5eQ5UBXDc/OdR+4MRZ96qah1PyK3vFcVe41l+7+gCIaGkbfn0pVO8EeoXp8gJgH4iBDBUHDwsIS2nfve7SU1Gmvb8XsBGBEn19Z6weHAdBBovy1AlJk+ZOKpchXEbcUETj3icTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Suh+YZth27IzXP+1Xo1VUx4zfhD77qNH8B5kFSjS5Ns=;
 b=jMUqJk5Z/xRx/p1838TU2DXlrx6ei6bGZH+et6SSJHL5jEEjZkj1IPr28VbqTxvnaY9KrES8bB+cLqk76KrG+OC+aMtBdS9FoJscH9NNdsP17mjd5rK8uRLpm6qSozoHRNoIsBExcgBbVueGkO8JxzCrBIQ4FQp7sYrC+FeJEbEpNzZJ6Eoj+4ghIbgaPNQS1NvffuSqEGQ6HTj3pPS9h+ylltx+uN3FUwxXUz6lydlw99HwI/u9pWJ9HRzpj39J9h8wM2bL4Krh5fAUidVisGEfClVOPNG8qvvIv/XsBgt2uFTp22CKBN4/StFoL7xxjcCH/LspSJ8/0ekbD04lwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Suh+YZth27IzXP+1Xo1VUx4zfhD77qNH8B5kFSjS5Ns=;
 b=ngcYBJFIEPKx1D3qE9y6Fu9gGnWalDy1YTJtTpMV17zn4tm5LR+SggKwbKk9O3zeddGKj715bEH6/Vf3QIqjfVS3KoRUN1Xugh0LDy9MEOeUE8RwxqACItDrreBOua4z4DQQPMeQP/olxVQ1lKih/VsOcbCkMA5nkrtKpBRj6og=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:20 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:20 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 4/9] arm-bsp/trusted-firmware-a: adding support for corstone700 platform
Date: Fri,  7 Aug 2020 13:41:50 +0100
Message-Id: <20200807124155.24198-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80ffc684-ffa6-4171-44e9-08d83acf56f6
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|AM0PR08MB3986:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB398639D7B6D7E64E4520D608FD490@AM0PR08MB3986.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:612;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oZIbtUcVcIyvvlN3aVBaegkNxcbHrGSDQ5N4X5ieLg/7CGcZ4GJ8t46X0P2LOM7bX39daRudulwtDfGqhRatWTWEk09hbTIvNW+UOWLNCJDMUqdmurQQ3OAssvL8pSe0x4cKn1W2cZU4L5i1bH0T0sWunptNsZlDS/mTzslNfEYoyMPeDcwCku/p+EN/HE/FgZrzSPnhklVGcgvdiu5cW2rzP1kfSMT3aIGAz2ZqjSqCjpO7Bn+XFn/gItBqKHf/2HOsrNnE2hGrAxi9vNV0Oipm/Y3Uq/E803GYU4CGjxVqePtosAB0/Cw1aS74X95SpfSRpfr53m/M39l3Wq9c5Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(66476007)(66556008)(36756003)(9686003)(478600001)(8936002)(8676002)(2906002)(6916009)(54906003)(66946007)(316002)(6486002)(4326008)(6666004)(186003)(26005)(86362001)(1076003)(16526019)(956004)(2616005)(7696005)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 PbsTXF2slB4xu1Zz6+WVm5XS7g46Vf3twKO0Jo3YAu7nVbMb5tuS1v6mKVzRwXtTQmi6kyP6t6JNwdeqod0Ry9MiNNPl8dYbHXDY6XMvzp2boeRuAcMEit7gJO+TbkeSSfkxItR6JvjcvNiVtjxA2jH4kA4AmUUOQHZnfrfLEW1MwL0hef0gbCI81QXTg8/A7j0bRxG0oWMJMNLpbQ9V+tGO81UdszZB/LKmSmvBY/7AyiSAOFdZH3O7v5Il35v08GmXo2xFP0CeAvRzgxvSgLl1pLDXPP0IPC46CBX4VzOBjlnJ0jUbtyLv0K9N7hTGK2dmT37DFnWR1CU2COU+MOLZFINyRGx8aHCcULEhkiCnZ3r0jngs0Pf989paoDTFVBirYcPQjdWywUX/74qVysgx+hvDcKvmUDMjn6Z7ed0QCF2hvF067wjx46zngHUCeG0f8tLpz8hG5cV4WxsMV5YAcMEVkxPbxmW47ugk3iesuW8tHpJ/g0QBStEUX/yhLJ0WNXh9KU0JKty1RyxLM4WfATznBz8pll1bZM9vqtQ9B3p25P+tFEBiplEdnZIq5J05m7QWUOexQOfuntS+vFtu2rgC+VXPJsthejzSI5hkx5OWXH5rbSEzT34R4FSKpvJjIu2cLQS26rg0G2ThRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3bb7b60f-8c5b-4d04-8e72-08d83acf5335
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L87NsIvEHLHnRgZU8Dl7RUMKTisgewMapqLzLebu8q1DIeNB8h98bE5NFoCLZYuOnCp/YE/M0mAZLf7URE2dXQvX35DqCyR2SSlC7D0pBvrY394KI9qPiKOzrVlb/m83kBcZXj3LI+aYo9bVGWlOzN4b3PhbXk4iVniPycdVkBQiWuAccZEfAzmku8HZ+qj5S9uvQZWxufSs7/42xZ9XHt/hAI99eZWzIW8kxSMh12HlZ6MrGlFGQOsdeyFAiEDll7EUfTpnavGkUnQgPoLgQxzDx5WQ6sjZH/j7gk9LzSMpKlAdyIVSeKtOYI9F6ViPV28gt4IDIIb/vMv9P1F/wdkRhumcZ8tjJBkToTWA+RMvajoFNZ6nOtDf+LFZiWZOM49L8/rb8nuoaZV+S/xFmQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(336012)(356005)(4326008)(5660300002)(83380400001)(82310400002)(8676002)(8936002)(6486002)(7696005)(36756003)(47076004)(26005)(9686003)(478600001)(16526019)(54906003)(2906002)(70206006)(316002)(6916009)(70586007)(1076003)(86362001)(2616005)(956004)(81166007)(6666004)(36906005)(186003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:26.3956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ffc684-ffa6-4171-44e9-08d83acf56f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3986
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit adds support for trusted-firmware-a to the corstone700
platform.

The trusted-firmware-a runs on the host processor.

Change-Id: I70ae2715e640bf50c756229a734dcb663c2d8e4d
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/corstone700-fvp.conf         |  2 ++
 .../conf/machine/include/corstone700.inc      | 11 +++++++-
 .../trusted-firmware-a-corstone700.inc        | 26 +++++++++++++++++++
 .../trusted-firmware-a_2.3.bbappend           |  1 +
 4 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-corstone700.inc

diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/=
conf/machine/corstone700-fvp.conf
index a968b39..2ee3b52 100644
--- a/meta-arm-bsp/conf/machine/corstone700-fvp.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
@@ -8,3 +8,5 @@ require conf/machine/include/corstone700.inc
 # add the following line to local.conf to disable the feature:
 # MACHINE_FEATURES_remove =3D "eth_lan91c111"
 MACHINE_FEATURES +=3D "eth_lan91c111"
+
+TFA_TARGET_PLATFORM =3D "fvp"
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-b=
sp/conf/machine/include/corstone700.inc
index 67cf153..495fc30 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -4,11 +4,20 @@ require conf/machine/include/tune-cortexa32.inc

 MACHINEOVERRIDES =3D. "corstone700:"

+TFA_PLATFORM =3D "corstone700"
+
 SERIAL_CONSOLES ?=3D "115200;ttyAMA0"

 PREFERRED_PROVIDER_virtual/kernel_corstone700 =3D "linux-stable"
 PREFERRED_VERSION_linux-stable ?=3D "5.6%"

-VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+
+WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"

 WKS_FILE ?=3D "arm-reference-image.corstone700.wks"
+
+VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firm=
ware-a-corstone700.inc
new file mode 100644
index 0000000..175e333
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corsto=
ne700.inc
@@ -0,0 +1,26 @@
+# Corstone700 machines specific TFA support
+
+COMPATIBLE_MACHINE =3D "(corstone700-*)"
+
+TFA_DEBUG =3D "1"
+TFA_UBOOT =3D "1"
+TFA_BUILD_TARGET =3D "all fip"
+TFA_INSTALL_TARGET =3D "fip.bin"
+
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D1dd070c98a281d18d9eefd93872=
9b031"
+
+# TF-A v2.3 is not used because the following commit is needed:
+# corstone700: splitting the platform support into FVP and FPGA
+SRCREV_tfa =3D "ef93cfa3a2591084307a41e64f1cbba327310749"
+
+PV =3D "2.3+git${SRCPV}"
+
+EXTRA_OEMAKE_append =3D " \
+                        ARCH=3Daarch32 \
+                        TARGET_PLATFORM=3D${TFA_TARGET_PLATFORM} \
+                        AARCH32_SP=3Dsp_min \
+                        ARM_LINUX_KERNEL_AS_BL33=3D0 \
+                        RESET_TO_SP_MIN=3D1 \
+                        ENABLE_PIE=3D1 \
+                        ARM_PRELOADED_DTB_BASE=3D0x80400000 \
+                        "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.3.bbappend
index 6f67b49..70c0a6d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb=
append
@@ -6,5 +6,6 @@ MACHINE_TFA_REQUIRE_a5ds =3D "trusted-firmware-a-a5ds.inc"
 MACHINE_TFA_REQUIRE_foundation-armv8 =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"

 require ${MACHINE_TFA_REQUIRE}
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
