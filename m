Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.55])
 by mx.groups.io with SMTP id smtpd.web12.4318.1587454453056392758
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 00:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aHPfrCx4;
 spf=pass (domain: arm.com, ip: 40.107.7.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EaYZ94aieIuG3Q2mulK8ZxRfHXMxIT2x+MeI8YENu4=;
 b=aHPfrCx4s8aONH4rFXM3smn+JklNuKpOfPgqSI/pQD1b8uWcbBd0sYzFWU022k7bhKhMYlVtH3+H6drQ5xS9F20tW+pTIyGVt/SjCKgLlr69K9Fbebcqvkp2XUCmCn3oQzHLZo9A70bTyNiaLtMyS9lIKk5iwqO/7MqmM0uW9e0=
Received: from AM6P195CA0047.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::24)
 by VI1PR08MB3102.eurprd08.prod.outlook.com (2603:10a6:803:3e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:10 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::f7) by AM6P195CA0047.outlook.office365.com
 (2603:10a6:209:87::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Tue, 21 Apr 2020 07:34:09 +0000
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
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 07:34:09 +0000
Received: ("Tessian outbound 7626dd1b3605:v53"); Tue, 21 Apr 2020 07:34:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c11135065ddee527
X-CR-MTA-TID: 64aa7808
Received: from c91ecaa415bd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0C3ADAB-ACF8-415C-9DA1-8614D9F83E25.1;
	Tue, 21 Apr 2020 07:34:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c91ecaa415bd.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 07:34:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8jdGodESkQlYe3FxEVHkn2qvxwOzTfNvBjZN7wN50KDqeSj7VAkcjDxi19n6EmZMMXUGLDIk0pfC2x3P3RYxWlftkwO59kxYe7UA+gGPf+VvGteKqwBEFBtH+CUxBC3yljvW9YDJ7doaOYLGLUIdEbB8pAoS4xhGK5zgPXHPAo+QaBiv4GKuiIHN5YnkwPLMDqD0gMGQfZxYNvg6ttaV2N8aZYuli0TZplcvYjk1WHvqgSv7mGPBBdqaoLhzdUebGt5Zwvb0HMa+QqUBUp1hBWsQ8m5Gg+iRVQNFq1YK2XukyyNf8EM9GWdmD8b0OHhDNL8WLejZcml0cIOYnio6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EaYZ94aieIuG3Q2mulK8ZxRfHXMxIT2x+MeI8YENu4=;
 b=kLCoDdYTQtLTbx1SbdKbueOqnWg9mRHqs+6t6vUXklxMgc3Z7NrG5lxsiWqm8MWB5Ltf48AUkKlFGOgmauSbXD4FjdALOnbZ+UxA0fgcrFQDAeu6t1xlTKIEoEc9XWq2xkoR4+V30mvI51QgX208S3GhqQhA35yjEQQEvPFelmRbKzf/7hzlFjWEXJ7LASLjuRWf4tUfwye3Ch8HmAIxU/Lg9hhvNqddq1Vfn/OW4+pzGZCaW17cUMA1F/esRTdIDqdeCdmMXnpUlS4X5nskYoWYXIB3NNE1su/0osb/RX/jZpH4mqbf2zY/5fEgtDH9qM/sTnkImZtJM/ZFfhXS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EaYZ94aieIuG3Q2mulK8ZxRfHXMxIT2x+MeI8YENu4=;
 b=aHPfrCx4s8aONH4rFXM3smn+JklNuKpOfPgqSI/pQD1b8uWcbBd0sYzFWU022k7bhKhMYlVtH3+H6drQ5xS9F20tW+pTIyGVt/SjCKgLlr69K9Fbebcqvkp2XUCmCn3oQzHLZo9A70bTyNiaLtMyS9lIKk5iwqO/7MqmM0uW9e0=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5139.eurprd08.prod.outlook.com (2603:10a6:208:15d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 07:34:02 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 07:34:02 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 4/5] meta-arm-bsp: Introduce firmware-image-juno recipe
Date: Tue, 21 Apr 2020 08:33:54 +0100
Message-Id: <1587454435-46370-5-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2921.29 via Frontend Transport; Tue, 21 Apr 2020 07:34:02 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8870fd82-cca7-4182-71ad-08d7e5c66163
X-MS-TrafficTypeDiagnostic: AM0PR08MB5139:|AM0PR08MB5139:|VI1PR08MB3102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB31025458F701BD956C6FC9BB92D50@VI1PR08MB3102.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(316002)(81156014)(6666004)(2906002)(8936002)(5660300002)(478600001)(44832011)(2616005)(966005)(956004)(26005)(6916009)(6486002)(36756003)(8676002)(66556008)(66476007)(66946007)(52116002)(7696005)(86362001)(16526019)(186003)(4326008);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KSXU8+pvHdViDVKpNiEHPSlEmziyakOYotld5esyf4fDqCeTAWXbV+3oIBdwdrzk1SVr6/76P1nV7P7vCaiDQy5msopST+ibau84iNJN/SWhkgLi0CNHFCiccagATL9yKuGlZadXXJYjZGmI0Y+crA614Ffo4G1OASX4nsC2ODSQqm6F4Q+HHP4s3oGiHxHb9lxwCYD/3Tmhxp7kMvwDek9HwTt29uz4V6Ybe8cAcyGxJjct1LdW84Y5tYSFKAqGX/jsO2iyoW+zbQ381wQwOiC2SsnXo+ObIbjB7S2ZdgWJ3whT617aNid67+l2pSs/isMclm04bn0Z51Qon+b4E5LV0yDvPxnI5x1fhawvRH8d/mTA0ZNAbFI3aUdfraAqGidobqu7iGWUsmjoT3ITjA1jYqYifVHCocDnL3uwMh+OYrqsRxVs40ZU49Aw6TDIEAIiT3IS9/RanQHO43x2h5ZWsbNyb7hHCsxng5Fwbv5X9aNDRpE1kY2EOJ/PcACIv2uWUv09kQBWaj1x8WogRA==
X-MS-Exchange-AntiSpam-MessageData: 
 zcV6qIxOGjEHiujK8Fuu8Oa73mr+S4dr30vgSuOQQEguSAnzsYnSWE/hni0/S02lItTac9+jI+CcqzRJPxiOlNmMZjyEd/q50OwpxRY8tUMoCDtjfSbb1XHZc84tejMAkQSIPphXdmnK9zzGSISGfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5139
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(81166007)(8936002)(81156014)(966005)(36756003)(4326008)(82740400003)(86362001)(6486002)(2906002)(5660300002)(356005)(44832011)(956004)(70586007)(70206006)(2616005)(47076004)(6666004)(36906005)(336012)(316002)(16526019)(478600001)(26005)(8676002)(6916009)(7696005)(186003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed3f5472-99f6-49bc-9f35-08d7e5c65cee
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9IOYTbrFO+PFYnz1t2Yc5+8cVm14QPfGOERHTFDLppmrAdHsG9gLWdretIfHE9hFIaOTbRXDgWmAPQYGT2EjfKmu6SljJ3p01C+avijs7brYyFbFKAso5vBtQRz52iFwjcLKuomXvGKN7ug9JNqBppN+hn1iLK8gVLBws392BwQVZLyJy+i+OytgZmqnuITvBYLWnvPc5su7LzUg8itiACnaNIO5CXI9Q2mfBCusYHKzp/bgkqE80SDXeQtSXfLv/mE5j4+xjDQZ+Z189XZ0FAA49dyybwE8E1SEcx+vPML4lssnDsqeP2KJhVVEcOf6VHhllfoWz+p03+javR5e10Y5B7HQXvBarFtM9rasK6ejzUd914BTy/FMznmuD/xsAi+xpwGfUWUeZ+Mn3eR2SSs4KFdT3pkACwSDsjURb2fJegCOOO7iXdZbmp3ICBE2fHGlxbJvGCY21vXHoyZwZb0OK936I69+1lrymc/YTAwAUgj1EI9hNAkY69j/C5fcKdzDAbWGahwyjsLfuTDqNp6lshOMXxLAdUy3Zs9QW2Jtbn4lReVTbAeaTvHuRE/H8SgFLQDFpZf8TegzYtsRXP5RTnNLnHFaJfouS3tHeB8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:34:09.5596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8870fd82-cca7-4182-71ad-08d7e5c66163
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3102
Content-Type: text/plain

Add the firmware-image-juno recipe to produce the Firmware Image for
Juno to be copied to the Configuration microSD card instead of the
trusted-firmware-a recipe.

Include the firmware-image-juno recipe in the EXTRA_IMAGEDEPENDS
only for juno MACHINE.

Change-Id: I316c70f22d57a3d85cc40386f1961ecd23edc865
Issue-Id: SCM-754 SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/machine/juno.conf                |  2 +-
 meta-arm-bsp/documentation/juno.md                 |  7 +-
 .../recipes-bsp/images/firmware-image-juno.bb      | 64 ++++++++++++++++++
 .../firmware-image-juno}/images-r0.txt             |  0
 .../firmware-image-juno}/images-r1.txt             |  0
 .../firmware-image-juno}/images-r2.txt             |  0
 .../juno => images/firmware-image-juno}/uEnv.txt   |  0
 .../trusted-firmware-a/trusted-firmware-a-juno.inc | 78 ++--------------------
 8 files changed, 73 insertions(+), 78 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r0.txt (100%)
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r1.txt (100%)
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/images-r2.txt (100%)
 rename meta-arm-bsp/recipes-bsp/{trusted-firmware-a/files/juno => images/firmware-image-juno}/uEnv.txt (100%)

diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index 02ef226..878b6b1 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
 
-EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot firmware-image-juno"
 
 # Juno u-boot configuration
 UBOOT_MACHINE = "vexpress_aemv8a_juno_defconfig"
diff --git a/meta-arm-bsp/documentation/juno.md b/meta-arm-bsp/documentation/juno.md
index 8d343de..cc5a272 100644
--- a/meta-arm-bsp/documentation/juno.md
+++ b/meta-arm-bsp/documentation/juno.md
@@ -16,20 +16,17 @@ the case in poky distribution).
 ### Update Juno SD card:
 
 The SD card content is generated during the build here:
-tmp/deploy/images/juno/juno-oe-uboot.tar.gz
+tmp/deploy/images/juno/firmware-image-juno.tar.gz
 
 Its content must be written on the Juno firmware SD card.
 To do this:
-- extract the content of the tar file:
-```bash$ tar -xzf tmp/deploy/images/juno/juno-oe-uboot.tar.gz```
-
 - insert the sdcard of the Juno in an SD card reader and mount it:
 ```bash$ sudo mount /dev/sdx1 /mnt```
 (replace sdx by the device of the SD card)
 
 - erase its content and put the new one:
 ```bash$ sudo rm -rf /mnt/*```
-```bash$ sudo cp -rf juno-oe-uboot/* /mnt/.```
+```bash$ sudo tar --no-same-owner -xzf tmp/deploy/images/juno/firmware-image-juno.tar.gz -C /mnt/```
 ```bash$ sudo umount /mnt```
 
 - reinsert the SD card in the Juno board
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
new file mode 100644
index 0000000..9be4005
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -0,0 +1,64 @@
+DESCRIPTION = "Firmware Image for Juno to be copied to the Configuration \
+microSD card"
+
+LICENSE = "BSD-3-Clause"
+SECTION = "firmware"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+DEPENDS = "virtual/trusted-firmware-a virtual/kernel"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "juno"
+
+LINARO_RELEASE = "19.06"
+
+SRC_URI = "http://releases.linaro.org/members/arm/platforms/${LINARO_RELEASE}/juno-latest-oe-uboot.zip;subdir=${UNPACK_DIR} \
+    file://images-r0.txt \
+    file://images-r1.txt \
+    file://images-r2.txt \
+    file://uEnv.txt \
+"
+SRC_URI[md5sum] = "01b662b81fa409d55ff298238ad24003"
+SRC_URI[sha256sum] = "b8a3909bb3bc4350a8771b863193a3e33b358e2a727624a77c9ecf13516cec82"
+
+UNPACK_DIR = "juno-firmware-${LINARO_RELEASE}"
+
+inherit deploy nopackages
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+    cp -a ${WORKDIR}/${UNPACK_DIR} ${D}
+    cp -f ${RECIPE_SYSROOT}/firmware/bl1-juno.bin \
+        ${D}/${UNPACK_DIR}/SOFTWARE/bl1.bin
+
+    cp -f ${RECIPE_SYSROOT}/firmware/fip-juno.bin \
+        ${D}/${UNPACK_DIR}/SOFTWARE/fip.bin
+
+    for f in ${KERNEL_DEVICETREE}; do
+        install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
+            ${D}/${UNPACK_DIR}/SOFTWARE/.
+    done
+
+    cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
+
+    # u-boot environment file
+    cp -f ${WORKDIR}/uEnv.txt ${D}/${UNPACK_DIR}/SOFTWARE/
+
+    # Juno images list file
+    cp -f ${WORKDIR}/images-r0.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262B/images.txt
+    cp -f ${WORKDIR}/images-r1.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262C/images.txt
+    cp -f ${WORKDIR}/images-r2.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262D/images.txt
+}
+do_install[depends] += "virtual/kernel:do_deploy"
+
+do_deploy() {
+    # Compress the files
+    tar -C ${D}/${UNPACK_DIR} -zcvf ${WORKDIR}/${PN}.tar.gz ./
+
+    # Deploy the compressed archive to the deploy folder
+    install -D -p -m0644 ${WORKDIR}/${PN}.tar.gz ${DEPLOYDIR}/${PN}.tar.gz
+}
+addtask deploy after do_install
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/images-r0.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/images-r0.txt
rename to meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/images-r1.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/images-r1.txt
rename to meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/images-r2.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/images-r2.txt
rename to meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/uEnv.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/trusted-firmware-a/files/juno/uEnv.txt
rename to meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
index 4a034c8..2f1559c 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
@@ -1,79 +1,13 @@
 # Juno specific TFA support
 
-COMPATIBLE_MACHINE_juno = "juno"
-TFA_PLATFORM_juno = "juno"
-TFA_DEBUG_juno = "1"
-TFA_MBEDTLS_juno = "1"
-TFA_UBOOT_juno = "1"
-TFA_BUILD_TARGET_juno = "bl1 fip"
+COMPATIBLE_MACHINE = "juno"
+TFA_PLATFORM = "juno"
+TFA_DEBUG = "1"
+TFA_MBEDTLS = "1"
+TFA_UBOOT = "1"
+TFA_BUILD_TARGET = "bl1 fip"
 
-# Firmware image from Linaro
-SRC_URI_append_juno = " http://releases.linaro.org/members/arm/platforms/19.06/juno-latest-oe-uboot.zip;name=junofip;subdir=juno-oe-uboot"
-
-SRC_URI[junofip.md5sum] = "01b662b81fa409d55ff298238ad24003"
-SRC_URI[junofip.sha256sum] = "b8a3909bb3bc4350a8771b863193a3e33b358e2a727624a77c9ecf13516cec82"
-
-# Add our how images.txt
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/juno:"
-
-SRC_URI_append_juno = " \
-	file://images-r0.txt \
-	file://images-r1.txt \
-	file://images-r2.txt \
-	file://uEnv.txt \
-	"
 # Juno needs the System Control Processor Firmware
 DEPENDS += "virtual/scp-firmware"
 
 EXTRA_OEMAKE_append = " SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_bl2.bin"
-
-# Build dependencies only for Juno and add them
-# doing it with do_deploy_juno[depends] does not work
-JUNO_EXTRA_DEPS ?= ""
-JUNO_EXTRA_DEPS_juno = ""
-JUNO_EXTRA_DEPS_juno += "virtual/kernel:do_deploy"
-
-do_deploy[depends] += "${JUNO_EXTRA_DEPS}"
-
-#
-# do_deploy_juno_append or do_deploy_append_juno are not working
-# so this file must not be included for other machines then the juno
-#
-do_deploy_append() {
-	cp -a ${S}/${TFA_BUILD_DIR}/bl1.bin \
-		${WORKDIR}/juno-oe-uboot/SOFTWARE/bl1.bin
-
-	cp -a ${S}/${TFA_BUILD_DIR}/fip.bin \
-		${WORKDIR}/juno-oe-uboot/SOFTWARE/fip.bin
-
-	for f in ${KERNEL_DEVICETREE}; do
-		install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
-			${WORKDIR}/juno-oe-uboot/SOFTWARE/.
-	done
-
-	cp -aL --remove-destination \
-		${DEPLOY_DIR_IMAGE}/Image \
-		${WORKDIR}/juno-oe-uboot/SOFTWARE/Image
-
-    # u-boot environment file
-    cp -a ${WORKDIR}/uEnv.txt \
-        ${WORKDIR}/juno-oe-uboot/SOFTWARE/
-
-    # Juno images list file
-    cp -a --remove-destination ${WORKDIR}/images-r0.txt \
-        ${WORKDIR}/juno-oe-uboot/SITE1/HBI0262B/images.txt
-    cp -a --remove-destination ${WORKDIR}/images-r1.txt \
-        ${WORKDIR}/juno-oe-uboot/SITE1/HBI0262C/images.txt
-    cp -a --remove-destination ${WORKDIR}/images-r2.txt \
-        ${WORKDIR}/juno-oe-uboot/SITE1/HBI0262D/images.txt
-
-    # Zip the files
-    cd ${WORKDIR}/
-    tar -zcvf juno-oe-uboot.tar.gz juno-oe-uboot/
-
-    # Deploy the compressed archive to the deploy folder
-    install -D -p -m0644 ${WORKDIR}/juno-oe-uboot.tar.gz ${DEPLOYDIR}/juno-oe-uboot.tar.gz
-
-}
-
-- 
2.7.4

