Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.59])
 by mx.groups.io with SMTP id smtpd.web11.8022.1589296845532961673
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 08:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=I2ERmuUs;
 spf=pass (domain: arm.com, ip: 40.107.6.59, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNzFa/HDOp42Hlh8ywelECuR8g5PwKfzHF+G0SxIRxs=;
 b=I2ERmuUsHqJA0slz4MnQ4KAl5PEAmMU/tj4yS7pPF7qDA0UUx1RyCFQMJ2QxBms0H5nrRj1ssbNcjvjajclZvS5nJAMEI29YrDza0AiiarEI497MG6mFdJFb9ck103Z0RUriODzAF9cgSP+fkExJvHCQYHrXwEu5ZMSSYWu20V8=
Received: from DB6PR0601CA0004.eurprd06.prod.outlook.com (2603:10a6:4:7b::14)
 by AM6PR08MB3637.eurprd08.prod.outlook.com (2603:10a6:20b:46::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Tue, 12 May
 2020 15:20:43 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::34) by DB6PR0601CA0004.outlook.office365.com
 (2603:10a6:4:7b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 12 May 2020 15:20:43 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 15:20:42 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Tue, 12 May 2020 15:20:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41b7dd47f12c3f19
X-CR-MTA-TID: 64aa7808
Received: from d84456b7d979.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 62EF6455-F9F9-4A3E-BBE6-BBF8601051B3.1;
	Tue, 12 May 2020 15:20:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d84456b7d979.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 15:20:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrhfCNsI92A9Mvq7Xh8yY2MjMprrmyLLKAkeoPmdnn+n82bVpCjqNQR3XHqBOSwdo+aqdobKYBcQ0q8RjvgXNuFUiFW33IUYmnE0WtRW/F8W+2ihfMUPiR/972P+CgeIi9Og5rTcostqmr/0SLqD6l2qcLNCxgCKK7g9uAvMXm/+EgQU8zOyz3rC5RGn/uoP3JBhuPJsyuRImlqNBd3SXdLHdwEGJ+NyCFDh6VcQu86+dvfiQGdcAjpXFb6G46IDGpB8PJlncc2unWXQPAODxnxmEPQ57Qds2bKp+G/vGR4zI5orfoGQ6i74iRe1q7S3V+xfddhdpS5tSaLkKwTwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNzFa/HDOp42Hlh8ywelECuR8g5PwKfzHF+G0SxIRxs=;
 b=OCm2zh6GD6QiZytSdfMA+ZuuHgjzuZ44/iUimJ92iXBYBHgtHPQ+kknRkUw+wibqQFxYugsgudWJemu/MMTDHIAbaKEole0l7iY+3rqj+Mez4dI/NSMY78RhyVj6Qnh2etZRKYOs2c4FTsUnRz0pJla9EW2eaCEIt/J5oIOrAe32tgWRzOLq8v4B7PAJiEAPPA0KheOaAblecPw3OZ5VVd6ag3Z1SNdCcS32FnBhtHzitt4KNcCfGfDHIMqmntxDnpmnacbXyyKSE11IkdSe8TMxNiy9eJ7PJBWYltF64SLVa2PenVhLARf6lsTjcslsjcEcCeO/zohvnYszAMmzvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNzFa/HDOp42Hlh8ywelECuR8g5PwKfzHF+G0SxIRxs=;
 b=I2ERmuUsHqJA0slz4MnQ4KAl5PEAmMU/tj4yS7pPF7qDA0UUx1RyCFQMJ2QxBms0H5nrRj1ssbNcjvjajclZvS5nJAMEI29YrDza0AiiarEI497MG6mFdJFb9ck103Z0RUriODzAF9cgSP+fkExJvHCQYHrXwEu5ZMSSYWu20V8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3298.eurprd08.prod.outlook.com (2603:10a6:208:5e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Tue, 12 May
 2020 15:20:34 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5%6]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 15:20:34 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH v2] Add recipes for TF-A versions 2.2 and 2.3
Date: Tue, 12 May 2020 11:20:28 -0400
Message-Id: <20200512152028.13779-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM3PR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:0:52::22) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by DM3PR08CA0012.namprd08.prod.outlook.com (2603:10b6:0:52::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 15:20:32 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 12 May 2020 11:20:28 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71b95fb7-f67f-4ac0-7c0c-08d7f6880956
X-MS-TrafficTypeDiagnostic: AM0PR08MB3298:|AM0PR08MB3298:|AM6PR08MB3637:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3637AA9E67FEDE8A8B30ECAEF0BE0@AM6PR08MB3637.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:398;OLM:398;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kjUH3oPnBqSbV+OH9k+DlHCxnw83UWXDa3PkElyeueUhEQwCeo8vRmrQJ8FcRB7IdViUaPoEjR/rPWGAwIYYwU0X/Dhtw9gpX7+fUauAig5gn9cWYCu8HZ8i6wrCLzPlHcVIXim6xhLFhnAb5NFcgy0koLRqJPoOyS0shl8ubAjoQ4+PHFqZq8jfE43KigaYc00gmGwkU0+z84GB1ZnImH2dTCYDg8hrjo6jA1K0IpZtro0M9C9AxAmJoOviJoOrCL85vaKHMeegoaVdczLvqVQlRUtjsc1DEEp6ncn1nWFqdP9CKdVdf5A5LP1T8CG3X9MT09yVEHCbuoRxUnSiVm5QgImZXy2InA9iZ3M2R6RIicX6MK2UN4t5jOpC7520bOst07x0a5TRbyuVOQInrqzXkLiiLU/e2iYNlL8fYAKDmSHOS8ck92w0lqQqo2vOPjdjHjv1thf2kj+5TybdZpynVjkR24o9RNOJ1PNvDK6LvzPlVQI/3+P+4vzrzMLWVPc8CZ1vXx2ZR/LyE75OOg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(33430700001)(8936002)(6916009)(26005)(8676002)(1076003)(186003)(316002)(5660300002)(478600001)(42186006)(33440700001)(2616005)(36756003)(52116002)(4326008)(66556008)(66476007)(66946007)(86362001)(44832011)(2906002)(426003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 5rtKiwdz1+6dg7M+s8vKqdkjj65BDfKyK5xxBOfmfwJeTwSGBGsytTct4ba/4PohrfV0phffuJ8wERIpp0MIyLJyotbvJpc5bg20b9BX/8Nt5lgtFb/hs7nywNm5kTehMfrHz2Dvp2ncu8KMdYOb1XWTtX0qjL9H8gNHPBZhoLbATTPe+GIDPjorYo73EjlYlO27EfEYknym3BsZ3Vc0ePpzdZTFtiN3tpL98BHLxOsRyCfuLPDEtCVULgInbcjg4vweWx65+2rzj4qrcUKh0IlzzxGR4lx1smn1i0BkxktPQn81GZ1jJ0Q1cdFnB5HjohXdMnvfJwxLQT4HJoNkwfNyUCtrj8b82/L6fVn2EGGO8oKT1x3r6Izj85UYVe7FIDPeQzB+MhmV659Er5hANLNqiyy5HL+De1biiKSHLilAn3nzCY/SNf6Vyzi2Y0EQNPEfakyOASUHM8SKBws/2chwNVW98u4lNT1ljd58XY2dIpRlIgmieKLELg+q6Rfn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3298
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(33430700001)(8936002)(4326008)(8676002)(33440700001)(356005)(26005)(81166007)(82310400002)(1076003)(478600001)(6916009)(42186006)(186003)(82740400003)(316002)(5660300002)(2616005)(36756003)(47076004)(86362001)(70206006)(44832011)(70586007)(2906002)(426003)(336012);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c2e362bc-7e48-46ff-6e63-08d7f68803be
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/UtXjKu/2U6KV9eSEI+0voV9etCoRbateFRKm8fUZMfby7e8VlBrQXkKy5cIZhM2Z4euOMrTIDF8XRlNmfxTHwDrcLiVkm/Ob94c/uHoo6jrZdWk3/LLfOj/xWrvJhZ1FaBWss+oIHpXAeUIzbmzm4UTYqYe/UD3NFzy1UpIjCbZm4PJQ/vDvZh/9PsuyQ0Hrhlh0wx9K4TdNUkoBhxDYRwSEuYAzKJ0I2hQMw/miV6tWp2vh64hJE97jEpqDBY3TqpYzpLdARWDeJ6Y0Twkw+/YocenIqj/d7sgMd2ap819TPhan/zRJo97Yq9Qjq3iXipXkN9w6fe8v5eZQtAt03GcqL5ZNBWfF7swdf0sVKlYdZNwGQI9GWSPFSOhzq366MLZmqUVHLNTp87/F7atluHuMTdAAebYCV8+Kqe03q6NM9EWQWwcsSc92nEjWCWZaNc+MSVzAub9WMlPSdThLK0IpOIvOeqEeYhEqEKqONqSfz7ytGOfhdIzoBqysBUkxlEQs8i0h5wg1TbkEqWNEWZzmOvqNiOLEjcOQj9XRCsnSS3gAnRDCGJSNm9gtYVYxp888lHOzzSHq6ZKbY1GNQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 15:20:42.8792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b95fb7-f67f-4ac0-7c0c-08d7f6880956
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3637
Content-Type: text/plain

Add basic recipes for TF-A versions 2.2 and 2.3.  Also, rearrange fields
in the various TF-A recipes to make them uniform and move the
do_compile_prepend to the inc file.

Change-Id: I85e4ac7bdc44ed85449e40fd2c94d73bf3e7d9e8
Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf           |  1 +
 .../trusted-firmware-a/trusted-firmware-a.inc |  9 ++++-
 .../trusted-firmware-a_2.1.bb                 | 20 ++--------
 .../trusted-firmware-a_2.2.bb                 | 38 +++++++++++++++++++
 .../trusted-firmware-a_2.3.bb                 | 38 +++++++++++++++++++
 .../trusted-firmware-a_git.bb                 | 29 ++++++--------
 6 files changed, 99 insertions(+), 36 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 878b6b1..898a863 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -20,6 +20,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
+PREFERRED_VERSION_trusted-firmware-a ?= "2.1%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 93ca199..e6d48e4 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -81,8 +81,15 @@ DEPENDS += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot', '', d)}"
 do_compile[depends] += " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:do_deploy', '', d)}"
 EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', ' BL33=${DEPLOY_DIR_IMAGE}/u-boot.bin', '',d)}"
 
-
+# The following hack is needed to fit properly in yocto build environment
+# TFA is forcing the host compiler and its flags in the Makefile using :=
+# assignment for GCC and CFLAGS.
 do_compile() {
+    # These changes are needed to have the fiptool compiling and executing properly
+    sed -i '/^LDLIBS/ s,$, \-L${RECIPE_SYSROOT_NATIVE}${libdir},' ${S}/tools/fiptool/Makefile
+    sed -i '/^INCLUDE_PATHS/ s,$, \-I${RECIPE_SYSROOT_NATIVE}${includedir},' ${S}/tools/fiptool/Makefile
+    export LD_LIBRARY_PATH=${STAGING_DIR_NATIVE}${libdir}:$LD_LIBRARY_PATH
+
     oe_runmake ${TFA_BUILD_TARGET}
 }
 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
index e8933fb..4d41202 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1.bb
@@ -1,6 +1,9 @@
 #
 # Trusted firmware-A 2.1
 #
+
+require trusted-firmware-a.inc
+
 SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
 
 # Use TF-A for version
@@ -33,20 +36,3 @@ LIC_FILES_CHKSUM_MBEDTLS += " \
 
 SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
 SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
-
-require trusted-firmware-a.inc
-
-# The following hack is needed to fit properly in yocto build environment
-# TFA is forcing the host compiler and its flags in the Makefile using :=
-# assignment for GCC and CFLAGS.
-# To properly use the native toolchain of yocto and the right libraries we need
-# to pass the proper flags to gcc. This is achieved here by creating a gcc
-# script to force passing to gcc the right CFLAGS and LDFLAGS
-do_compile_prepend() {
-    #Create an host gcc build parser to ensure the proper include path is used
-    mkdir -p bin
-    echo "#!/usr/bin/env bash" > bin/gcc
-    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
-    chmod a+x bin/gcc
-    export PATH="$PWD/bin:$PATH"
-}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
new file mode 100644
index 0000000..4d5316e
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
@@ -0,0 +1,38 @@
+#
+# Trusted firmware-A 2.2
+#
+
+require trusted-firmware-a.inc
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# Use TF-A for version
+SRCREV_FORMAT = "tfa"
+
+# TF-A v2.2
+SRCREV_tfa = "7192b956bde11652a835eee0724dca0e403fee90"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
+SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
+
+#
+# mbed TLS source
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+
+# mbed TLS v2.16.2
+SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
+    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+    "
+
+SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
+SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
new file mode 100644
index 0000000..bfda87b
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -0,0 +1,38 @@
+#
+# Trusted firmware-A 2.3
+#
+
+require trusted-firmware-a.inc
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# Use TF-A for version
+SRCREV_FORMAT = "tfa"
+
+# TF-A v2.3
+SRCREV_tfa = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+SRC_URI[tfa.md5sum] = "75c8f4958fb493d9bd7a8e5a9636ec18"
+SRC_URI[tfa.sha256sum] = "7c4c00a4f28d3cfbb235fd1a1fb28c4d2fc1d657c9301686e7d8824ef575d059"
+
+#
+# mbed TLS source
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+
+# mbed TLS v2.18.1
+SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
+    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+    "
+
+SRC_URI[mbedtls.md5sum] = "37cdec398ae9ebdd4640df74af893c95"
+SRC_URI[mbedtls.sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index 4bf3ae5..c443ecd 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -9,30 +9,23 @@ DEFAULT_PREFERENCE = "-1"
 require trusted-firmware-a.inc
 
 SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# Use TF-A for version
 SRCREV_FORMAT = "tfa"
-LIC_FILES_CHKSUM ?= "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
 
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+#
 # mbed TLS source
 # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
 SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
-LIC_FILES_CHKSUM_MBEDTLS ?= " \
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
     file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
     file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
     "
 
-S = "${WORKDIR}/git"
-
-# The following hack is needed to fit properly in yocto build environment
-# TFA is forcing the host compiler and its flags in the Makefile using :=
-# assignment for GCC and CFLAGS.
-# To properly use the native toolchain of yocto and the right libraries we need
-# to pass the proper flags to gcc. This is achieved here by creating a gcc
-# script to force passing to gcc the right CFLAGS and LDFLAGS
-do_compile_prepend() {
-    # Create an host gcc build parser to ensure the proper include path is used
-    mkdir -p bin
-    echo "#!/usr/bin/env bash" > bin/gcc
-    echo "$(which ${BUILD_CC}) ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \$@" >> bin/gcc
-    chmod a+x bin/gcc
-    export PATH="$PWD/bin:$PATH"
-}
-- 
2.17.1

