Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.58])
 by mx.groups.io with SMTP id smtpd.web11.2773.1596792391069928181
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=M4d6TBfb;
 spf=pass (domain: arm.com, ip: 40.107.2.58, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Suh+YZth27IzXP+1Xo1VUx4zfhD77qNH8B5kFSjS5Ns=;
 b=M4d6TBfbMJM2pTPp0KQIWOB32LemGY19jEPXDZeV0UxGaonexBs5VK+gNrsD4l0xQPcRrLvGi8YpAVi66BBtVq0YW8DujUK4eRQXh2ZzRY/U9oJNGd2eJgP6ye0KzTGMFIfsNdpd/hHZ68YSx/MUkb/H5Ru9JmL4IS3hTevsQWI=
Received: from MR2P264CA0080.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::20)
 by DB7PR08MB3339.eurprd08.prod.outlook.com (2603:10a6:5:1c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:27 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::3b) by MR2P264CA0080.outlook.office365.com
 (2603:10a6:500:32::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:26 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 07 Aug 2020 09:26:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dcff233273074447
X-CR-MTA-TID: 64aa7808
Received: from baac60a6746d.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 762C791A-18A2-405C-B927-9B7F01C9FFD1.1;
	Fri, 07 Aug 2020 09:26:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id baac60a6746d.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMKooiTSoLz3pnNHyMhtKA5HSV/a9/mu9aq+ZGW5sHOyFSHg1MeIZ2j1bQc+/BWeWJ/VcHDEuyjWrD3V8CqkBszdPMDkjhPtI2TnkFSJiKddQK4t0vWIMtXH1v9tFZ2ABz/wY28oRk36vgVVKInU8s0+WBw0aD8rrvIV/FfJzD4fMInPSyaapdj5PEDbf37JcygqAax+K6LvI73NcKYCd4cNEdiijw/IQTHDrViWZg5U01gHDKU6jEKXQi3EWNmxBKWXz+jEf1vDakBUbALw/Gk1JH5K5Uo/sZfZXgtVWOHW2xu2DY5voLRdXS9NMGieK70Q/smmm20NLfWpmXme+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Suh+YZth27IzXP+1Xo1VUx4zfhD77qNH8B5kFSjS5Ns=;
 b=hCMEE7uMbNqo0dzRXBB+GXva9hHljjR6GzOyQqWf5eREL3CXlhJWJ6JftDkjFswfdKT63HM2HG7sCRMF3oaCkf0Q2yK2A8dhN0s/mz4wgv8YRLy2+vCnOuomWgn7rjlAHGfhiUYynk8LJ9oX4W2E8sWl4aSVCztbkg3LHus+wqRpWVq5KnIYX7vEkS1WE9Ljb4XwLH0YZw4dU7ylqLjKpNWXWhJzn3KNhYU7iC4akYmUScQiDqVcVG8vNJD8DztOzrJdp5IsQRmqEgnUV3YkUHEXyabgVo23I18ee7GPlZGg/2fdZbJZzN8ZwnR2OePnLfkXYPrJ7YU0faqSyHB+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Suh+YZth27IzXP+1Xo1VUx4zfhD77qNH8B5kFSjS5Ns=;
 b=M4d6TBfbMJM2pTPp0KQIWOB32LemGY19jEPXDZeV0UxGaonexBs5VK+gNrsD4l0xQPcRrLvGi8YpAVi66BBtVq0YW8DujUK4eRQXh2ZzRY/U9oJNGd2eJgP6ye0KzTGMFIfsNdpd/hHZ68YSx/MUkb/H5Ru9JmL4IS3hTevsQWI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:19 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:19 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 4/9] arm-bsp/trusted-firmware-a: adding support for corstone700 platform
Date: Fri,  7 Aug 2020 10:25:48 +0100
Message-Id: <20200807092553.18876-5-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
References: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0d2fbfb-07c9-4b9b-5f35-08d83ab3f5ce
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|DB7PR08MB3339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB33391F2F246277A728EDFB21FD490@DB7PR08MB3339.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:612;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 B/2cuKjn++UUBHB9efgqXumAgEw58s7X69HtCLMx0nfXqBBNyBAiYB3Cdk8hld2loty7wChrtbp/BObmUzUB+j4ejhMOQ9/Ie4/wTsvwLGBwq4h99WveX2YWSlAYDCH1KCzDmGDHVXoXkuiYmaKzXbDswN9cI6Y3+aPXQIm/8O0QrwEjbKizvjFyca8ulF2CepW33MEDabRG9T8/HpEHK17rkdn4VPXvqxlb976hrRpPdPZROz24ltocP3YVchDxH3QnldWGwCX8uA4ZZEVumjsPCR474pDQnN/zmwIfcsgLAbXx/wlvS1FBtoyzqVcDHb7s9lP3pVVvM7FWACRbdg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(4326008)(9686003)(6666004)(86362001)(6916009)(8936002)(6486002)(956004)(2616005)(7696005)(16526019)(52116002)(186003)(1076003)(2906002)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(54906003)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ZtOyBcwZJIUh4gwWG9qcfSh732n5vJDABeF/oabhaSs83h+Fk/NGCw0+HmUSx42GpI7L/QY9BpnX72s+6JHc/qyiC4ykY/7D5bkXyVkWGLeaTl7an4Vmm8IVFPcSniOSA42MHh5XpzWYR91bh1A/Cs/IYpo8tODOQW9KMv3BbY2hah948uXWhVNOR09xVgDFhF91cptEQboNFKisBn8AhS9XgRCaixyIgvJ8BUSQg21/t8aFpvaI5UoMd7F81Xbl9WXKD8e3GyqvMzk4No3wTfwVVcvA2IYS8J70iR7uDJbOb8Ku3JQL4ztfywGgGkPmBiwYE4fRflhpv/IjCTkqoaJrg9+kwEC2hyEhZ6E+j3egUML3FJfgNsJZucF/qP8tFO40i3cxySV/VndxgamYsRPWm5XEsjQy4pGlJaJYYg5UqVgJacsumxWM/oKcgT1wwTKjSl30vE6NVnHEntNHtewP0QgYc8joYTEX0Bq0218UsmC2YAu6DQBTZX7mXTkxjXgoIStQqM/GQy5btwsYFklj4dsQAU6Bo3NebB0gOPtI4H305QvJB0ws6jnB/Jc4xROsPxOng/yqElxkoF6mbd/l99mSzY2aG36QBNzjm2CVMMS1UafPGiJWIr0kqN8gYsT/smuNzNw1bx1P1sTNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7c3b4dab-fdb0-4797-31d9-08d83ab3f13f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pxEmFOC3GHF1abrpi+/1duPD+pRjFrNyRUuzGm95sebKZj3EkBEwiT4eb/BXGIH6jo4616/EeyRuI0mrIO6UW6DzwOticfF69GCvDBS6DWYN8Qs+3HgTuM3fFbHUewHwXUBITuf16MRi24F8bKhKG9gR9aRelcqClHT4A4WmMReSBGDvutmgUR97NU49HbvWlLc+7NSoS3M+kDAYNDyVex+wF0Slg9k8JR5zfsOC1GIPUIXZsxdEcNb9yDJbLpW/rtP6PMKIjfmHjQyV/A5lxlh4t2z6LFxQdpmjmfse4HcPvyctYslGq5CIGRgNPwtKZSKDResJT2QeBsK3VMb/4jWbSUu1ga2ADf5uX9iZaNqZD9Z3dKd1bc0ba16SnWuU7BWsMIJJNPO+WfVuEtTQrg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(6666004)(356005)(81166007)(9686003)(5660300002)(82310400002)(16526019)(54906003)(82740400003)(4326008)(47076004)(26005)(6486002)(956004)(1076003)(7696005)(83380400001)(70586007)(8676002)(186003)(8936002)(2616005)(36906005)(316002)(2906002)(478600001)(336012)(6916009)(86362001)(70206006)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:26.9345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d2fbfb-07c9-4b9b-5f35-08d83ab3f5ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3339
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
