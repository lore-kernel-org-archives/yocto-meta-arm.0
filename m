Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.50])
 by mx.groups.io with SMTP id smtpd.web10.21529.1593609618081366353
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Aoo9EpVT;
 spf=pass (domain: arm.com, ip: 40.107.2.50, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJpEHemwKxS4i/ctwMf7t1HM60ez0rDeSGmNJSZquJE=;
 b=Aoo9EpVTy42Ajf6LeJ1Df6nNv89v/mA1HeMIyPmaK5Eu1s0O6pSRAW9WnhpLh3Haasy/8/BdmNHW9Vt6W86ZhTxyj0jCVYneHLvqtn0GYlPINso+D5YUf8DBER4YakAClMfzyQhAE3p5cqymek9jOq7i5Y2sDfN28/Xgq1ifohk=
Received: from AM6P192CA0105.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::46)
 by DB8PR08MB5051.eurprd08.prod.outlook.com (2603:10a6:10:bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Wed, 1 Jul
 2020 13:20:14 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::30) by AM6P192CA0105.outlook.office365.com
 (2603:10a6:209:8d::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend
 Transport; Wed, 1 Jul 2020 13:20:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 13:20:14 +0000
Received: ("Tessian outbound 8239f48e56bd:v62"); Wed, 01 Jul 2020 13:20:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f7bda07c2b714dd
X-CR-MTA-TID: 64aa7808
Received: from 9658bb56f02f.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 87565D6A-2EFD-4322-A584-B4017E2D21B8.1;
	Wed, 01 Jul 2020 13:20:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9658bb56f02f.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:20:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ji8zBk0frEIw6HSasNv0kT9m8FJdUZrQdZJSnEyoIAAnjkfjDMjWPhPdxJ6mMRDvZJNAgLVt/96ni3E1/yxecv4xhezfZC1wmT7FDo5H00BafvvjFXoGOPQfEgaegMPUWKnZD4IvBI4LaM7wECTL/x+BR1+qDSRZEAmwPLOnK1Kbg4lHZXUngYNkz5N8CemWJq8mDaxw5VPmUmk0mDwx4/HuZMlTM/dq8bNpefArjNspLgGYzxKPKsCTYawcvr07Npffb/4UlfVE9bQUYSM7BbwmEPBRcIyDDSZH57ADKip68gO9/6fDVnJXHKVh1n0DEEVJ3ts09pmjLNre9I/5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJpEHemwKxS4i/ctwMf7t1HM60ez0rDeSGmNJSZquJE=;
 b=RIyYkYpzILr2TGZHlLY4GQYgO/fcKfmK3YLW9ONarQotFd01Oglda3FnFtaqH3ZYePZCyYQTFXNAqYWkiwbwWAjAyX00U5x6LmwhhE7fJq4qY1VHzxq4156n6hUBwtT826ECn+9vJK2/FiqiWncv85F1yR2F+IK+4S9Qtd9zGNDSk+lngt0YpYg4zznwcy2h1qzUwmtR89dCCT6BXAXucBauxodOOWZS9Rm8Dks3JqRRfiON9t2S+vcWUCZSVGoJ6D9GmMsumPeRKxcUyjOrYuc3sCnU3myGirM1VYyz2CwpQeCayiqJ/FRLf1vWsZ8v4Zfv8Kli5SMlO/8Rzi6T7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJpEHemwKxS4i/ctwMf7t1HM60ez0rDeSGmNJSZquJE=;
 b=Aoo9EpVTy42Ajf6LeJ1Df6nNv89v/mA1HeMIyPmaK5Eu1s0O6pSRAW9WnhpLh3Haasy/8/BdmNHW9Vt6W86ZhTxyj0jCVYneHLvqtn0GYlPINso+D5YUf8DBER4YakAClMfzyQhAE3p5cqymek9jOq7i5Y2sDfN28/Xgq1ifohk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR08MB3838.eurprd08.prod.outlook.com
 (2603:10a6:803:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 13:20:07 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74%6]) with mapi id 15.20.3153.022; Wed, 1 Jul 2020
 13:20:07 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH v2 4/6] arm: trusted-firmware-m: Add recipe
Date: Wed,  1 Jul 2020 15:19:38 +0200
Message-Id: <20200701131940.3084-5-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701131940.3084-1-gabor.abonyi@arm.com>
References: <20200701131940.3084-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (178.48.104.185) by LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 13:20:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [178.48.104.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce99ad42-73ed-456b-82fc-08d81dc17da1
X-MS-TrafficTypeDiagnostic: VI1PR08MB3838:|DB8PR08MB5051:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB50514ACBB4539056F2839D978E6C0@DB8PR08MB5051.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /gwS5HXrWcyjsUWPsWEE0E6D6gzpnGbVUrV46vX9zuxRECltknZSjP9SaK5KME/XE/afHEJrIAXUfs+fBN0sCc/rvYBAMX4GV/sEE7mroZYPZ7kLuRufiU29ukRkfpR9OyGKyaeQI4cuWUnAMlpBb7dca8kCYAV+QJEEWT0iIToVwoKQcgv771IihhsJbsTA4mlgILFfP69jXvx0hofhfya1sKZhS5/dnCxkXvQ0/wOPC5il90XVnRH8nwdSzGPYQjd/Lqu6hbbt/c/DzeNK4a4HNW9lf0jSAxlztRiCfe4GD3VdF1fgHsf2/QQbbUriFB1hWa9eVn0lG3UA9E55eSDRZcSjnBvVZO1ECyT/5Z2P1bQmq1yyJnf8V1mOLLA8BsYo/kWhFxRjjxafOAUiig==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(956004)(66476007)(8676002)(66946007)(2616005)(478600001)(2906002)(186003)(6486002)(4326008)(8936002)(16526019)(6666004)(1076003)(26005)(6916009)(36756003)(44832011)(83380400001)(316002)(86362001)(66556008)(52116002)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 w/nHD9b72XFxZlxq8Fe+9kiZnoKoTHqI1bm0Druj/6x29nZ4UsjWCrEbwX7XzaPev2Gj/2x8Ew2f16LFLBedXUsngG8IHB0nppB44TharaDwI+T/LeR4j4lype40YztAjISkA3buRn14mPBLhX0fEtLFKvQqbpoYPfj3i5c2iETBwNJxXk+kKrX5ihM7pf787c8BMWhj1Ps8cjLKcdWuUjJMITQT8rwH2qjd6ekARO2dyNQSb4cCIi0uZqWHOZYQfLtM6MqMlrfhzXkT6cfNL+i6GrKBdEOBZCGpRy3afKLimoVaoMuR/Pa26lwsNnVajUMzl7i7c1vUkqiDfRbWMlqV/N4FTcJgZwfip1EZBtTiDoDjPWEkrsiR1rW8o1JvvpxSsiUgvrT2wmvRhOYs56bJd5e3PnIFtRiBwXdau2OEYx/j5lfkbNuNfMOxfkAoLgX9NzqJxxBdbRgW5ZFBXIrkSyX+4HNBTkYMOUTNKcNcvyf+Z5DP8h3OddK+GtO4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(4326008)(2906002)(7696005)(336012)(316002)(6666004)(478600001)(81166007)(47076004)(70206006)(36906005)(70586007)(82740400003)(86362001)(956004)(5660300002)(186003)(1076003)(83380400001)(44832011)(2616005)(26005)(6486002)(8676002)(356005)(36756003)(82310400002)(16526019)(6916009)(8936002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8de2f78b-7541-411c-aa17-08d81dc17927
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fPOeAGLpNQKHtek3RrRN1pwmLkIkzdENwwqm8hynDZDD/IXIASqIGgBKV84eoX0cYzSj+Ei+JG3Mos9Xp8ctT05QUR+TSvvlOnaUS5nciwJT1Gro51CMj5J2nJi8oo1/0KqyvlBFyo2kBAoFS8sLlITeXl+1XwVn7s20+XCIPJOI+r4LPbPIITRiqoOCwYc65pGO5gyq1CGi1u3ljuYh/cfUy1GcPI7jUQQbkX/TMZ3sZ4m0248VbEnbleP68TLCdzULo5l1jC4PpVSfvpuld8QuXG33yqoj/FHkJL0CGeofFdfAeW+Pbd0L7PRF2oHVrsCZtThuuPCMBJDbr76W7l69XG48wMFbofEsZSXy+Jnc2m20bdm3UegVqv7/AK6ET92kKaP7mLhLBf81KqZixP3OHTz0XnVWEK4EGTtEGMA540hPsITbwCpZdBqcRKM2fVJu6b4as0QBTKxcaeWCR4O4nrFrKgrkLoAWHjHiuXI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:20:14.6011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce99ad42-73ed-456b-82fc-08d81dc17da1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5051
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Adds a recipe to pull down the trusted-firmware-m repository and the
ones it depends on. The recipe can either use gcc-arm-none-eabi-native
or armcompiler-native Clang toolchain to compile the firmware.

Change-Id: I37a4ba38982b5b1d387eccbb26bb5c79bddab0f7
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 meta-arm/conf/layer.conf                      |   1 +
 .../trusted-firmware-m_1.0.bb                 | 137 ++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmwar=
e-m_1.0.bb

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 3341972..10a7951 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -11,5 +11,6 @@ BBFILE_PRIORITY_meta-arm =3D "6"
=20
 LAYERDEPENDS_meta-arm =3D " \
     core \
+    arm-toolchain \
 "
 LAYERSERIES_COMPAT_meta-arm =3D "warrior zeus dunfell"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0=
.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
new file mode 100644
index 0000000..3be1b33
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2020 Arm Limited
+#
+
+SUMMARY =3D "Trusted Firmware for Cortex-M"
+DESCRIPTION =3D "Trusted Firmware-M"
+HOMEPAGE =3D "https://git.trustedfirmware.org/trusted-firmware-m.git"
+PROVIDES =3D "virtual/trusted-firmware-m"
+
+# TF-Mv1.0
+SRCREV_tfm =3D "TF-Mv1.0"
+LICENSE =3D "BSD-3-Clause & Apachev2"
+
+LIC_FILES_CHKSUM ?=3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc308=
5f3afa"
+LIC_FILES_CHKSUM +=3D "file://../mbed-crypto/LICENSE;md5=3D302d50a6369f5f2=
2efdb674db908167a"
+LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D302d50a6369f5f22efd=
b674db908167a"
+LIC_FILES_CHKSUM +=3D "file://../CMSIS_5/LICENSE.txt;md5=3Dc4082b6c254c9fb=
71136710391d9728b"
+
+SRC_URI  =3D "git://git.trustedfirmware.org/trusted-firmware-m.git;protoco=
l=3Dhttps;branch=3Dmaster;name=3Dtfm;destsuffix=3D${S}"
+SRC_URI +=3D "git://github.com/ARMmbed/mbed-crypto.git;protocol=3Dhttps;br=
anch=3Ddevelopment;name=3Dmbed-crypto;destsuffix=3D${S}/../mbed-crypto"
+SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3Dmbedtls-2.7;name=3Dmbedtls;destsuffix=3D${S}/../mbedtls"
+SRC_URI +=3D "https://github.com/ARM-software/CMSIS_5/releases/download/5.=
5.0/ARM.CMSIS.5.5.0.pack;name=3Dcmsis;subdir=3D${S}/../CMSIS_5;downloadfile=
name=3DARM.CMSIS.5.5.0.zip"
+
+SRC_URI[cmsis.md5sum] =3D "73b6cf6b4ab06ac099478e6cf983c08e"
+SRC_URI[cmsis.sha256sum] =3D "fc6e46c77de29ed05ef3bfd4846a2da49b024bc8854c=
876ac053aaa8d348ac52"
+
+SRCREV_FORMAT ?=3D "tfm_mbed-crypto_mbedtls_cmsis"
+SRCREV_mbed-crypto ?=3D "mbedcrypto-3.0.1"
+SRCREV_mbedtls ?=3D "mbedtls-2.7.14"
+SRCREV_cmsis ?=3D "5.5.0"
+
+inherit python3native deploy
+
+TFM_DEPENDS ?=3D ""
+DEPENDS +=3D "${TFM_DEPENDS}"
+DEPENDS +=3D "cmake-native"
+DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native"
+DEPENDS +=3D "python3-jinja2-native python3-cbor-native python3-pyyaml-nat=
ive"
+
+S =3D "${WORKDIR}/git/tfm"
+B =3D "${S}/build"
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+# Build for debug (set TFA_DEBUG to 1 to activate)
+TFM_DEBUG ?=3D "0"
+# Set target config
+TFM_CONFIG ?=3D "ConfigDefault.cmake"
+# Platform must be set for each machine
+TFM_PLATFORM ?=3D "invalid"
+
+# Uncomment, or copy these lines to your local.conf to use the Arm Clang c=
ompiler
+# from meta-arm-toolchain.
+# Please make sure to check the applicable license beforehand!
+#LICENSE_FLAGS_WHITELIST =3D "armcompiler_armcompiler-native"
+#TFM_COMPILER =3D "ARMCLANG"
+# For most targets, it is required to set and export the following LICENSE=
 variables for the armcompiler:
+# ARM_TOOL_VARIANT, ARMLMD_LICENSE_FILE, LM_LICENSE_FILE
+
+# Setting GCC as the default TF-M compiler
+TFM_COMPILER ?=3D "GNUARM"
+DEPENDS +=3D "${@'armcompiler-native' if d.getVar('TFM_COMPILER', True) =
=3D=3D 'ARMCLANG' else 'gcc-arm-none-eabi-native'}"
+
+# Add platform parameters
+EXTRA_OECMAKE +=3D "-DTARGET_PLATFORM=3D${TFM_PLATFORM}"
+
+# Add compiler parameters
+EXTRA_OECMAKE +=3D "-DCOMPILER=3D${TFM_COMPILER}"
+
+# Handle TFM_DEBUG parameter
+EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUILD_=
TYPE=3DDebug', '', d)}"
+EXTRA_OECMAKE +=3D "-DPROJ_CONFIG=3D${S}/configs/${TFM_CONFIG}"
+
+# Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a sta=
ndalone application
+CFLAGS[unexport] =3D "1"
+LDFLAGS[unexport] =3D "1"
+AS[unexport] =3D "1"
+LD[unexport] =3D "1"
+
+# This is needed because CMSIS_5 source package originally has .pack exten=
sion not .zip
+# and bitbake checks this dependency based on file extension
+do_unpack[depends] +=3D "unzip-native:do_populate_sysroot"
+
+do_configure[prefuncs] +=3D "do_check_config"
+do_check_config() {
+    if [ ! -f "${S}/configs/${TFM_CONFIG}" ]; then
+        bbfatal "Couldn't find config file '${TFM_CONFIG}' in '${S}/config=
s/'"
+    fi
+}
+
+do_configure() {
+    cd ${S}
+    python3 "tools/tfm_parse_manifest_list.py"
+
+    if [ ! -d "${B}" ]
+    then
+        install -d ${B}
+    else
+        rm -f ${B}/CMakeCache.txt
+    fi
+
+    cd ${B}
+    cmake -G"Unix Makefiles" --build ${S} ${EXTRA_OECMAKE}
+}
+
+do_compile() {
+    if [ -d "${B}" ]
+    then
+        oe_runmake -C ${B} install
+    else
+        bbfatal "TF-M CMake not generated!"
+    fi
+}
+
+do_install() {
+    if [ ! -d "${B}/install/outputs" ]
+    then
+        bbfatal "Output not found in '${B}/install/outputs'!"
+    fi
+
+    install -d -m 755 ${D}/firmware
+    cd ${B}/install/outputs
+    for dir in *;do
+        install -D -p -m 0644 $dir/* -t ${D}/firmware/$dir/
+    done
+}
+
+FILES_${PN} =3D "/firmware"
+SYSROOT_DIRS +=3D "/firmware"
+# Skip QA check for relocations in .text of elf binaries
+INSANE_SKIP_${PN} =3D "textrel"
+
+addtask deploy after do_install
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
--=20
2.17.1

