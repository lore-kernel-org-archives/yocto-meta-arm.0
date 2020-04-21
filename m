Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web10.4390.1587454451152997316
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 00:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=INGzvtXj;
 spf=pass (domain: arm.com, ip: 40.107.7.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxTxpYfX09nLNUkvFtJYj16CX7n2GYRH4Pd5VluZHW4=;
 b=INGzvtXjg6OskZQlSKbDas0tcuFKMP7U/TFhpmsG2N+xHF7UNjY0LdRM/vI6JAiPsI4d2Na0SVsyfXkXPeue/DdCzLJonD0cUYkNoL+y3pXNt1clWbjorZmgyYupdvaJPhvrqC6yVRmdNpQhC2oipsZZrc9dgm6F2FDMbdIKRR4=
Received: from AM6P195CA0057.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::34)
 by AM6PR08MB4342.eurprd08.prod.outlook.com (2603:10a6:20b:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:08 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::cc) by AM6P195CA0057.outlook.office365.com
 (2603:10a6:209:87::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 07:34:08 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 07:34:08 +0000
Received: ("Tessian outbound 7626dd1b3605:v53"); Tue, 21 Apr 2020 07:34:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e59d9a18789dff0
X-CR-MTA-TID: 64aa7808
Received: from b20f9cf88c0e.6
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2E2E14E1-D380-426A-86A6-785C08F7DB27.1;
	Tue, 21 Apr 2020 07:34:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b20f9cf88c0e.6
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 07:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNfp9rClDF0N/Fn2swDUdYKwh19UGVPMuINLtE13XBue/mwVFz+AEA4YZg3AAGRnaCDKFiCYUuJo/LoHOdZfFCElRXq2A7ogy3+JjWB4bA1+VMXENE7OoWTFZBcZ5LU90gwaKc45B30IYy710s+f7JSl7X/Ijhf6Jsyf1LNqYOB81jiLkEmADaIYgKPFJuAiPOAQGzkIwT1ZbnSCziTconza3d/4P20vS/Ridj6ristOtINEmKTmA26CpMA3+DMj/bStPeZMjl+kLclI8FQWlKAFBjlYMwpIm7zJfbAoxZAdnR1UA2G94gelEETI6gmJ0C6YkONoq1Z7UdIwIXlnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxTxpYfX09nLNUkvFtJYj16CX7n2GYRH4Pd5VluZHW4=;
 b=cZo0cz4t3udb2ewS/OMv1+NIM3SBgNLtnH79v9mv8+PvyZBWKo94I/q3lbzrCeuvSiZ7inE3abfcqDnk1KD29vfabqOREm7EIzYAm5DtxU3ZMX1zU2fg+27mp9Wlg/1yBlOL/pbp/8rGh3gELs6ORZGB0pynWexEVqg/YDuanbnkkjCazivDETjKtgtuan1wq7aeCo3QGj8xBojEzz/aXH9P0+1D28+WvrdqnzwSNC/pU/B2lgrm1dlzU2aZgFKxela42Ppt2Prag4tqvNKWs9EbyKWz646fETITCwOxwkWnq4vXQPoNx++ySc2dWP+2OZI4nUMK8TLxN2lp2AqP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxTxpYfX09nLNUkvFtJYj16CX7n2GYRH4Pd5VluZHW4=;
 b=INGzvtXjg6OskZQlSKbDas0tcuFKMP7U/TFhpmsG2N+xHF7UNjY0LdRM/vI6JAiPsI4d2Na0SVsyfXkXPeue/DdCzLJonD0cUYkNoL+y3pXNt1clWbjorZmgyYupdvaJPhvrqC6yVRmdNpQhC2oipsZZrc9dgm6F2FDMbdIKRR4=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3890.eurprd08.prod.outlook.com (2603:10a6:208:10a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:01 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 07:34:01 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/5] trusted-firmware-a: Deliver binaries artefacts to sysroot/firmware
Date: Tue, 21 Apr 2020 08:33:52 +0100
Message-Id: <1587454435-46370-3-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2921.29 via Frontend Transport; Tue, 21 Apr 2020 07:34:01 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 098e3fea-024d-4281-62bf-08d7e5c66073
X-MS-TrafficTypeDiagnostic: AM0PR08MB3890:|AM0PR08MB3890:|AM6PR08MB4342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB43425760AE68A962C74F359092D50@AM6PR08MB4342.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(5660300002)(4326008)(86362001)(6666004)(44832011)(16526019)(36756003)(478600001)(186003)(2906002)(81156014)(52116002)(66946007)(7696005)(66476007)(316002)(66556008)(8936002)(26005)(8676002)(2616005)(956004)(6486002)(6916009);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sabvJGGWpZvM6Hw8JlVR5A92w7SIkW0L9YLEJAdTlCvLjFG2JhP5RjscOhAt0/K4wGVyRVvkpJH67qSuZUIHXqcu5xAgFNncnOlrGObGP+Ycx6c7Ya32nYIx3PjyZklkrfTCkaxcmPhNqFVtbB3iX8GvMN/C5URi5RYZX3T6r5LITdpsmqFeEkPkGDhlygMzERLhrPMZW76g46GbNz60oyC0yU5OMDOLs+s77aBLZ9oPr/e+7OV/p7CNn6MTzfRsQC7YJHp7MWAYagL5p0iASSNO1RyZTYiDwmV9ljg/erXqya/Kw0LIAL0H8FolyHKbb18DZOU/6BF/oFfZZ6w2uuxetVmJubCexTDxn30yVIS3UYFkZMSx+3vUz3ctGRDaymJkCWF0DEZVqM8iS7kXyFUqf9nHyoi+UqzcIa8rUgcql0XUB1fO0ifyBLRlrYB3
X-MS-Exchange-AntiSpam-MessageData: 
 +6GvhM9f7HVn3B5r8zG13dxv7oJZYK0TBa0aIEmsIDIFyEKczOBG3bhsjwzGwKkITxG0gy3ij9fMHgr4kBuIHRhZ04rO2Odpb9fjcbXJ6bpCs/36QYZACNk3D8butcs5i3KQrfRd/P7LQO+mYYeT+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3890
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(356005)(82740400003)(6666004)(186003)(81166007)(2616005)(8676002)(336012)(16526019)(956004)(4326008)(81156014)(36756003)(6486002)(47076004)(8936002)(86362001)(26005)(5660300002)(7696005)(70586007)(316002)(36906005)(2906002)(44832011)(70206006)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	654c78d6-af78-48c7-1565-08d7e5c65c63
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YZt/0yy35nO/geNGyPEy/pbtjkrY9XQMvuw+pBYkQmify40vS6w+dNIdur62iOmNGBAFCUXiv2XEy4SLhSn6AUTrSPSDDsAbghAiUxmt1M5T62JWT4H6jFBrRZzxznQZKTB2P24OWjA+YZsXsg/WZlDyk4jgexKJDm2PGoAyZOHkoS/tGL4X7RnkjUwZYDDuFNdM71oVoTDJhb0DSYUXhYp+ZRMKiKGW9TrTk3ayX/LTfUTzvMGCE2Ge3YDRoM2nBjLT/zVzGfPFl9iLyyUFHBD6CU2VQVRt84jyTN9Z2d6/Fd5pPJTPiBS7s14PQR4cDLhXPZRziP8F0gOY8ElgQXvXzeq90Ii2c9aiExZmXTSsIKcyMO5uc6CmAUZ4iK2dBDcq69a1Oba0F7Zh3Nq+AA0gKPcJ7dJ3evpPRrB8yAriFCrqDIlbXzPCVvjAvkC9KbD5BB6w1MP45/wFJPz7CEJCBrsjk1P+BXFvOEbYW+Fe2BYSvGfh9GWJaDhbAn2zB+xZGvyLtlCjGudSySoDeA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:34:08.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098e3fea-024d-4281-62bf-08d7e5c66073
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4342
Content-Type: text/plain

Make usage of the do_install task to deliver binaries artefacts to
the `sysroot/firmware` path, making it easier for other recipes that
depends on it to make usage of those binaries instead of copying them
from the DEPLOY_DIR_IMAGE.

This recipe still deploys its artefacts to DEPLOY_DIR_IMAGE.

Change-Id: I97b97f90b23746557e981f8de10159c5f475becd
Issue-Id: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-fvp.inc  |  7 +++--
 .../trusted-firmware-a/trusted-firmware-a.inc      | 31 +++++++++++++---------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
index 6e7eba3..3e58ecf 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.inc
@@ -12,9 +12,9 @@ TFA_MBEDTLS = "1"
 TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "bl1 bl2 bl31 dtbs fiptool"
 
-do_deploy[depends] += "virtual/kernel:do_deploy"
+do_install[depends] += "virtual/kernel:do_deploy"
 
-do_deploy_append() {
+do_install_append() {
     ./tools/fiptool/fiptool create \
         --tb-fw ${S}/${TFA_BUILD_DIR}/bl2.bin \
         --soc-fw ${S}/${TFA_BUILD_DIR}/bl31.bin \
@@ -26,6 +26,5 @@ do_deploy_append() {
 
     ./tools/fiptool/fiptool info fip.bin
 
-    install -m 0644 ${S}/fip.bin ${DEPLOYDIR}/fip-fvp.bin
+    install -m 0644 ${S}/fip.bin ${D}/firmware/fip-fvp.bin
 }
-
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index d7c4fbf..93ca199 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,7 +5,7 @@ PROVIDES = "virtual/trusted-firmware-a"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit deploy
+inherit deploy nopackages
 
 COMPATIBLE_MACHINE ?= "invalid"
 
@@ -42,12 +42,12 @@ SRCREV_FORMAT_append = "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbedtls', '',
 TFA_UBOOT ?= "0"
 
 # What to build
-# By default we only build bl1, do_deploy will install
+# By default we only build bl1, do_deploy will copy
 # everything listed in this variable (by default bl1.bin)
 TFA_BUILD_TARGET ?= "bl1"
 
 # What to install
-# do_deploy will install everything listed in this
+# do_install and do_deploy will install everything listed in this
 # variable. It is set by default to TFA_BUILD_TARGET
 TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
 
@@ -60,9 +60,8 @@ LDFLAGS[unexport] = "1"
 AS[unexport] = "1"
 LD[unexport] = "1"
 
-# No configure or install
+# No configure
 do_configure[noexec] = "1"
-do_install[noexec] = "1"
 
 # We need dtc for dtbs compilation
 # We need openssl for fiptool
@@ -87,27 +86,27 @@ do_compile() {
     oe_runmake ${TFA_BUILD_TARGET}
 }
 
-do_deploy() {
-    install -d -m 755 ${DEPLOYDIR}
+do_install() {
+    install -d -m 755 ${D}/firmware
     for atfbin in ${TFA_INSTALL_TARGET}; do
         if [ "$atfbin" = "all" ]; then
             # Target all is not handled by default
-            bberror "all as TFA_INSTALL_TARGET is not handled by do_deploy"
+            bberror "all as TFA_INSTALL_TARGET is not handled by do_install"
             bberror "Please specify valid targets in TFA_INSTALL_TARGET or"
-            bberror "rewrite or turn off do_deploy"
+            bberror "rewrite or turn off do_install"
             exit 1
         elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.bin ]; then
             echo "Install $atfbin.bin"
             install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.bin \
-                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.bin
+                ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
         elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
             install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin.elf \
-                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}.elf
+                ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
         elif [ -f ${S}/${TFA_BUILD_DIR}/$atfbin ]; then
             echo "Install $atfbin"
             install -m 0644 ${S}/${TFA_BUILD_DIR}/$atfbin \
-                ${DEPLOYDIR}/$atfbin-${TFA_PLATFORM}
+                ${D}/firmware/$atfbin-${TFA_PLATFORM}
         elif [ "$atfbin" = "dtbs" ]; then
             echo "dtbs install, skipped"
         elif [ -f ${S}/tools/$atfbin/$atfbin ]; then
@@ -118,4 +117,10 @@ do_deploy() {
         fi
     done
 }
-addtask deploy before do_build after do_compile
+
+SYSROOT_DIRS += "/firmware"
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
-- 
2.7.4

