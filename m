Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.84])
 by mx.groups.io with SMTP id smtpd.web11.50064.1597080770364982383
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 10:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VPDg7gNI;
 spf=pass (domain: arm.com, ip: 40.107.14.84, mailfrom: prabin.ca@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REiu8ZLjSKDseq5SKO8ieYnu+QIizdSmRdFDvS8oIXQ=;
 b=VPDg7gNIf5PExmw0XuWIcjt7U+Rn6RPa40nrn+ND/AqReM4UdWvIfrW7gm+CG/cgfaW87jNpr6Ry346q0qYCF4mjN5G9VXsbeicKCUpShB8RasB7tcDE/eD3Rw4bPby69uglyyCjVTPVWTDYlpYPahNRilNEArSlNvQK+ymyo+Q=
Received: from AM6P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::32)
 by VI1PR08MB3104.eurprd08.prod.outlook.com (2603:10a6:803:42::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 17:32:47 +0000
Received: from AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::42) by AM6P192CA0019.outlook.office365.com
 (2603:10a6:209:83::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17 via Frontend
 Transport; Mon, 10 Aug 2020 17:32:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT058.mail.protection.outlook.com (10.152.17.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 17:32:47 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Mon, 10 Aug 2020 17:32:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: da3b1c6f5b61e91b
X-CR-MTA-TID: 64aa7808
Received: from 4bacfa1735f8.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F0A6FCF0-2101-4A12-BC78-E643D5CFF5F0.1;
	Mon, 10 Aug 2020 17:32:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4bacfa1735f8.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 17:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3YlX1+wKFSIEuaiyaOreyF6wZeFNI+iPM617AnHhabm7/rSVHflEtogtJNttTJl6JnFiqZyH5Dd/98PolebCAxM+YQOOvTHfKPAABw7yAwgSqy/bRZh6RIqtbKcU4gV7Vv7wMwUD7l1O/aXHkth/x483h4v0vZQcIR6psyu5G3DgwmeegL0pHXjc4sASuxRHm6TYPEH5RHsExc77V65XXyp75ut1rbo83otSc9da7sCtvvtnJOWg6LoV7xYjKcNKTevkneBM6nCptkCAfTOmyhQDCkSaKS0SD+FFdhsZ+fNSMF/Xhz3HtPxbRB6XvwyN7q8JUM/nG6fOfMr4O+RFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REiu8ZLjSKDseq5SKO8ieYnu+QIizdSmRdFDvS8oIXQ=;
 b=bcl3Zh1wfGt7YBQsulnd1zYiCnmDkH1cvhX0Lg/L1nAu/xjIkGUnA1KMahXlF2U2VRxn/jj8IscEzuROmZY+NU24QmTqTOIDcl+xxl9Oy9yUfVFy0LCn/Op1Q6JAy1NoA+gvWs3JnofrwaNHZAkcYw4v9Hq7n4z/hCkoBJp8tfkAlxSOAq4btLK8oK7TLE5gTSZDOe+iHeRIsFeoQjDRbLGHRFNWyknuh3TgBy52Q2EepYRwU7E513e/LqP+aa4bhXNMWB1ugjwgsm8Os9NGKnxJe7uOc02t/fYTNv1O+zz1Datb+tUGbC91OWPeMY++V58MGBUE9w+42GzYc88jpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REiu8ZLjSKDseq5SKO8ieYnu+QIizdSmRdFDvS8oIXQ=;
 b=VPDg7gNIf5PExmw0XuWIcjt7U+Rn6RPa40nrn+ND/AqReM4UdWvIfrW7gm+CG/cgfaW87jNpr6Ry346q0qYCF4mjN5G9VXsbeicKCUpShB8RasB7tcDE/eD3Rw4bPby69uglyyCjVTPVWTDYlpYPahNRilNEArSlNvQK+ymyo+Q=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33)
 by AM0PR08MB5409.eurprd08.prod.outlook.com (2603:10a6:208:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 17:32:41 +0000
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5]) by AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 17:32:41 +0000
From: "Prabin CA" <prabin.ca@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Prabin CA <prabin.ca@arm.com>
Subject: [PATCH 2/7] arm-bsp/fip-image: Build TFA/UEFI for sgi575
Date: Mon, 10 Aug 2020 23:02:11 +0530
Message-ID: <20200810173216.10411-2-prabin.ca@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810173216.10411-1-prabin.ca@arm.com>
References: <20200810173216.10411-1-prabin.ca@arm.com>
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To AM4PR08MB2756.eurprd08.prod.outlook.com
 (2603:10a6:205:c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a076760.blr.arm.com (217.140.105.53) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 17:32:40 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6291fbe7-7989-4653-4b1e-08d83d5365d4
X-MS-TrafficTypeDiagnostic: AM0PR08MB5409:|VI1PR08MB3104:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3104C8B31D2929F5EA4B0279E1440@VI1PR08MB3104.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:63;OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Nu1WoC2SJfvxyqGsPb1lGKAoBWxA27rrL16J9R4UeHzkxIi8Q2eIgYYZD82oi/RJE0vwcJrxWYmDPEs6SE0OrLukQqXcKULYHmIkhHNh5/fAqOqHthHNTceJekOL8lEf3N6evvN/psuwSdBF7b3q8tfHjpkmgkKKMVW727fo3HJa5fVNW6HXnEsN9BWTQGdZysjGxPuX53pqjeLQrKW2Wt16tr7iEgn3G+b8q7i2E6qsCitfa8plZcSCUqOPl/fts9fcQSnH0o8KgtOY+MLBICw9soKMGgl/TCLVKcmjcix7ZZaGe5OHGct0AWIMCXzQ
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR08MB2756.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8936002)(66476007)(66556008)(66946007)(6666004)(26005)(6916009)(36756003)(52116002)(7696005)(2906002)(86362001)(1076003)(316002)(956004)(2616005)(5660300002)(4326008)(8676002)(16526019)(186003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: C0xUxEv71eWsY2Z60Yrtc+/t3CALLFZgLV7kWjHuwGGt5khrXI/9uNkcRzjalBbKBmCTHtWNuSVqdGSc3yM4gN/ysT/cfLWjsEa3pzYFAaVhN9Bqqx3tGBgu227U9lNlM/Tgb9mWDZHwW+TGgJRKM4F0coP2WRPaGznH8CUELJTVUOdfahvMnFwu4LrFkvKvR9VJozQUqw/qf+KzWoTHXRWiMsIn3UbGEx9GUWg7/mzbx3xgGa9b7Ag9itfF6IkmZGjwQLx2IPm6iL3x40dMZPuKEawkp3GBU3yCZs0CBbqrJZSnEk3ee3qTDWZyQWuAlErqkH0Sh6sm95R/L+LvOms/7YFdxfbJCUiZHWN3Rgk1sp2mFaXsvJnnHU5RXiLeEhekrnyijNOt7jhpcC0VbfRuIVbCBkkX22RESYI/TNc97b+Ez1kpC5Jiag9JrIs38ZPtO6vNz1nqYSuXAX6W2CeP2bqhWsRT68anP7Wr1DR10dtsqrJ93fSXlliB8TOeLbJm7PGY8VD7VRBmER9OLnDkTJCkzhxtUmTx6qtPFgAXoU+bIDFhwSjjTG6gQxhFg/wwTDYlxbPeRqd03DJxAVgfZENH6svWxtnMOTl0QyttK/6R7flPkO2uqdhKFxBaqcixyV9jZHozz4H7d9E5SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5409
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Prabin.CA@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b850e825-359d-4deb-e70e-08d83d5361fe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	unbGqQiHlbO5I2qaFlxVbqg8Iut/oOJGVS0knccW6e1R9FlX6LolO19JKW4srijruN6q0HnX66z9FcKaWBEtApFX49LBP4Var+j9yCufE8JO+hsCbVGDjQPjlDlutmMhrupVMPdDV8sidHzaJfmt8O7w9RkUmutXZxi/u4LaLMAxdo610nI4YVOvTGyGe8O1nGZzvpZj3fBO2SPBkdBDVwgZnTmsZFYrqFWDQN4RLJJf+aDYm31Yr03k81cvqpQRTriaidhVjmigsBSvDv5aULKsbQctkUb6apdQY5nnqp28AmKpPbMxXQ7qiL7JqLi8VQ0PPhPHnkB7Us+i1oksSRZ2yBZMxXGyL9RrVBvOm1zJfgpzEbS7v5IQ2fpBvPwwXiodQXFFyJN3VIRPOS5H1w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(81166007)(6486002)(2906002)(4326008)(82740400003)(82310400002)(356005)(86362001)(478600001)(6916009)(8936002)(8676002)(36756003)(2616005)(956004)(5660300002)(6666004)(336012)(70586007)(70206006)(26005)(1076003)(7696005)(186003)(16526019)(316002)(36906005)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 17:32:47.2322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6291fbe7-7989-4653-4b1e-08d83d5365d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3104
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

        - Add bbappend recipe to build ARM-TF and UEFI firmware
          for SGI575.
        - Add machine conf to add image dependency
          for ARM-TF components.

Change-Id: I1f9dcc8877aa929c50bffd0b437e8f51527f3d45
Signed-off-by: Prabin CA <prabin.ca@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf          |  7 +++++++
 .../trusted-firmware-a-sgi575.inc              | 18 ++++++++++++++++++
 .../trusted-firmware-a_2.2.bbappend            |  1 +
 .../recipes-bsp/uefi/edk2-firmware-sgi575.inc  | 18 ++++++++++++++++++
 .../uefi/edk2-firmware_git.bbappend            |  1 +
 5 files changed, 45 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-sgi575.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/mach=
ine/sgi575.conf
index 04c4900..c77f3f5 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -9,3 +9,10 @@ TUNE_FEATURES =3D "aarch64"
 require conf/machine/include/arm/arch-armv8a.inc
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
+
+# Trusted firmware v2.2 version
+PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-sgi575.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-sgi575.inc
new file mode 100644
index 0000000..6d04fa3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-sgi575=
.inc
@@ -0,0 +1,18 @@
+# SGI575 specific TFA support
+
+SRC_URI_append =3D " ${SRC_URI_MBEDTLS}"
+
+COMPATIBLE_MACHINE =3D "sgi575"
+TFA_PLATFORM       =3D "sgi575"
+TFA_BUILD_TARGET   =3D "all fip"
+TFA_INSTALL_TARGET =3D "bl1 fip"
+TFA_DEBUG          =3D "1"
+TFA_MBEDTLS        =3D "1"
+TFA_UBOOT          =3D "0"
+
+# Sgi575 needs the UEFI as bl33
+DEPENDS +=3D "virtual/uefi-firmware"
+
+EXTRA_OEMAKE +=3D "BL33=3D${RECIPE_SYSROOT}/firmware/uefi.bin"
+EXTRA_OEMAKE +=3D "MBEDTLS_DIR=3Dmbedtls TRUSTED_BOARD_BOOT=3D1 GENERATE_C=
OT=3D1 ARM_ROTPK_LOCATION=3Ddevel_rsa \
+                     ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_rs=
a.pem"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.2.bbappend
index 6ede847..c6bd111 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb=
append
@@ -2,5 +2,6 @@
=20
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc"
+MACHINE_TFA_REQUIRE_sgi575 =3D "trusted-firmware-a-sgi575.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc b/meta-=
arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
new file mode 100644
index 0000000..e27d617
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sgi575.inc
@@ -0,0 +1,18 @@
+SRC_URI =3D "\
+    gitsm://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}/ed=
k2;nobranch=3D1 \
+    git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;de=
stsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1 \
+"
+# TAGS and commit ID
+SRCREV_edk2           =3D "50528537b2fb0ebdf32c719a0525635c93b905c2"
+SRCREV_edk2-platforms =3D "b972f17b329a85e6aa4d69f240d459839ba8b47c"
+
+# SGI575 specific EDK2 configurations
+EDK2_BUILD_RELEASE =3D "0"
+EDK2_PLATFORM      =3D "Sgi575"
+EDK2_PLATFORM_DSC  =3D "SgiPkg/Sgi575/Sgi575.dsc"
+EDK2_BIN_NAME      =3D "BL33_AP_UEFI.fd"
+EDK2_ARCH          =3D "AARCH64"
+
+COMPATIBLE_MACHINE =3D "sgi575"
+
+PV ?=3D "202005+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend b/met=
a-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
index dfebd87..bef54b0 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_git.bbappend
@@ -3,5 +3,6 @@
 MACHINE_EDK2_REQUIRE ?=3D ""
=20
 MACHINE_EDK2_REQUIRE_n1sdp =3D "edk2-firmware-n1sdp.inc"
+MACHINE_EDK2_REQUIRE_sgi575 =3D "edk2-firmware-sgi575.inc"
=20
 require ${MACHINE_EDK2_REQUIRE}
--=20
2.28.0

