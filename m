Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.43])
 by mx.groups.io with SMTP id smtpd.web12.9527.1588338933341812102
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2020 06:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=e2gL5vUu;
 spf=pass (domain: arm.com, ip: 40.107.13.43, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNVhECRfsM9EqmwQQIUUS0X5mg2vxCQ2kT0mZpdoQHE=;
 b=e2gL5vUuf6w0Lvm946KicZaFOM0akLhp6d1TUwpqMSqS4SJxbhN/U0IbBRryB6WaspswItw52N6xgnPhr+y+IISC0hMFOGFO0ld2gRL0X+1zRQFoaf/l0Hj1Tj5SfgX4b4+eb+fvziNrJ71KFLWDrPPyqrPMDEQnVrblrRr6B4E=
Received: from AM6P191CA0088.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::29)
 by VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 1 May
 2020 13:15:30 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::99) by AM6P191CA0088.outlook.office365.com
 (2603:10a6:209:8a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Fri, 1 May 2020 13:15:30 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 13:15:29 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Fri, 01 May 2020 13:15:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1354409b9a23b947
X-CR-MTA-TID: 64aa7808
Received: from 58eaa7e4ca11.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA67FEA0-9A61-454F-8E5A-8D33976BB17F.1;
	Fri, 01 May 2020 13:15:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58eaa7e4ca11.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 May 2020 13:15:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S67BBtf4DoNvBJFPUQsE7NqtNMM9neNihawd3Anh4iuTQOIAtqDgg3vTRSSVw1sZuxVbY53pySzmEjAwbPkFMSsXRt1g940fvAD9a8/wQ955/jgtcABXZfi4zW9vy6zSvMgMD6HYOnzsLB9jxZXCK+qun1zPbyPn9TqT/UPxR9uSdxqm0vhLO+v3PFT5XVZIgvALVOjNwLrXo7NCegAFNX0Axiq0YoqJvJ0Lf/Vz2Uvr5vpzjo/P307vaMgNAoqiYnXQdNMqRsYsTqt6Bx+w9rRi97Kb2HoXZxNMEiyTm6wsnAL+5pRbm/5j3Vh2I9+rOyaFLqqNVkFf1Yhtkzfdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNVhECRfsM9EqmwQQIUUS0X5mg2vxCQ2kT0mZpdoQHE=;
 b=KqMHAvt0FLDWPMxb9ewnSoManJjRQo0SthV2paMbFFRg7oUmMy83UYtcIVqtTEP0K6XLKZHVHeWpR6MH/wv1pLygc4IgZ7MCrVzBu2FsCj5V5W3u+pLyT+eEY0VZROuJLoU8bHs5AFSuvP0V5WvLzK7HtMSo4yG756fqaXmEnrCIP8EyNxZ1aSqo1wQ02Ffij8gs7oHEx4oB5R8bHxg1f39aNSxZeF7e1XwZfBP+OInMGw9ahSYnzWold3Bmbt8fQwoCYtER9cfrJ02zQTGO7PPI1IQMVrEK+C9PeWpHrISpujqL8IFJIIh52nfwZfMY5BRUl+8mJQ1AoFPZZhBUmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNVhECRfsM9EqmwQQIUUS0X5mg2vxCQ2kT0mZpdoQHE=;
 b=e2gL5vUuf6w0Lvm946KicZaFOM0akLhp6d1TUwpqMSqS4SJxbhN/U0IbBRryB6WaspswItw52N6xgnPhr+y+IISC0hMFOGFO0ld2gRL0X+1zRQFoaf/l0Hj1Tj5SfgX4b4+eb+fvziNrJ71KFLWDrPPyqrPMDEQnVrblrRr6B4E=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4610.eurprd08.prod.outlook.com (2603:10a6:208:104::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 13:15:22 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 13:15:22 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-bsp] firmware-image-juno: Fix dependency loop
Date: Fri,  1 May 2020 14:15:22 +0100
Message-Id: <1588338922-58454-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::17) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.49) by LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 13:15:22 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9860d4f-b10d-4e88-a759-08d7edd1b8cc
X-MS-TrafficTypeDiagnostic: AM0PR08MB4610:|VI1PR08MB5517:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB55179E8702B5D28856AA2A7592AB0@VI1PR08MB5517.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qskn7vYjt5DM5fFrx/KnglN+WYR8v+35uX/zDk7MjjaZkrOzKLUgLqqUysKxECCUEuMkBON2iJv3g7XopgbDMliuZohUY3eBQwj3HFLFrFli488//J8kRjtIFX9+2smkFYrAGmno8hcxtDhiYRF7+1/eQyrty4VeISV7qdwUEDQnZ8/i6f5Be46wG7yy7JngIwRQqbGB4lS8UaEQlkmj4aH86p97uiLnyrGkpn5jvb2jTVrjNfZxAJ6lPgs1Ytc+MrXkuB9dbw/ZVYzdcve94b2XhtfF6pY07YkfgrMHjW1eNl9Nwlwka5Sa8p4B8BnYUiWosra8p5BHS519RWaTyM3z2QIeFynAJlWDg2PXroPiqiin5YQQv6eTsw2QuowXqmbAFnqO/6vgmJDeVGp1XimwweogGXdnT+PxqiVSPAvrzaoe0IrkJHdZ4zZ+dGTV
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(8676002)(2906002)(52116002)(86362001)(7696005)(26005)(6486002)(36756003)(8936002)(6916009)(186003)(16526019)(66556008)(66946007)(5660300002)(66476007)(478600001)(4326008)(44832011)(956004)(316002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 7XHVHM4icWIV6IriBa+vBPFIr9f7gx1cXOcu/fdtadr35YOrL3g5Sx5OkbKzakL6bmgv+KFObaPaN8wQm8P/CLRAa+DwW6zTI90bIji4PqcX/AO/5sz5UrMGveOVw7werSF6odMy94yOQedcAskPGUcDIOeZAkpGKX7kMDObwz6YNxRrJ/NaBk7zkd84QusCWY5YLX1CUlJtQmJ1zAyWBgJX22g5khGaKg3rxjad29qTOUx/Ce2R4B91qHjwTPAyIaOkV0aRaTEinPMXjgZD6+bXWZ6Ma5PNR7UGjCeq2Yi+/w+iHSueAt8YnHxIQL+6nzaI4Vt/duO+PzJKulhBuujsAJhilX9/DbCJEL/Md4FMnS7SZwBkniH1Wr3deqdJErH61lpwBjGQlr45NMwIMWs6e3eajnmNb+Z99roMmWSzhEpEzaZrhdbGAAukHPUBdOAGXtm6sXND5vkRF6jzsxB1D2JY7q4mw6m8CMm6DGVR3BFe5catwbjArSu53uIcBm0XiSnZ6cowD+7RsHU/7452z9eUg7XFqufpVw/E6sJl52DjPL7aPHFpS7Nm0tFE6PKd1ZWI1RQyYoH1tmVzqPI2AjoAZecswJQE2UvfCG9F6o/4GsmFjpesDCu2LnWLw+QsRnVsyWuv2yxBN6L+zFlyqrCeLgAUnwkZdyXycC139/XdpiR58L5BZToyWjn7DVrK92d5My+p+GZG4FdU6KqT1Cw7IW/gylf3Uf2CKJ+Q4SA4kMrvWTC71710da3KbLM4XhubIWEbCPmJNZBMN6/z5C3BydJzImTBEL6No9M=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4610
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966005)(2616005)(82310400002)(956004)(7696005)(2906002)(6486002)(8936002)(82740400003)(44832011)(8676002)(86362001)(36756003)(81166007)(336012)(5660300002)(70586007)(70206006)(478600001)(6916009)(4326008)(26005)(36906005)(316002)(356005)(186003)(47076004)(16526019);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ef44101f-b4bc-4de7-ba38-08d7edd1b45f
X-Forefront-PRVS: 0390DB4BDA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E/Ni0im6NU3P51Fv9gjxDNCL+bU3OZXYk6C8LzdRcDCbKnhRxUGHHzMHT5uiRQTBl6FrSKx71BaMeFxD1zmL+QKHSOQ5RuLvlnX4DWoNH/RjCnAtDO8UxiXAv6LPAO7uI51oDGxANjgNQWB4m/lJaSsR3GggZX9GBP+/jXC63X/IIaaeoUDeAnofFV1P3pGjn3/YAxq2VsGKJaAe5dQBdoiIrLsxpjwUR0TqaP64sIDTLJbA0VxYbEM8W5fgckdLaajMq4AxCtPpHFLEUy7wawYQwTp56tclyDduw3BU7ian1+KDtS846jdxD2D+MNaKd/bPpntUDwEOpQZFJKaYVOYd9NLs8PjiDvu8GpdAZt4PfM+5V2MYNMqIO5s0HtbHF1j1gEvybnfc78gsWRgFjh5IYBBiDrh8O077Ozghkn99Nch4UV+FQd+QZNKYdgkBxjwJJmJ4bvISFI5dN1i857rd2U0sB4Ezt6ORBhcMl0ytVdVNNbTn+mbW89DbRbs6S7rZFva9AfUSAHMgPDX64g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 13:15:29.9982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9860d4f-b10d-4e88-a759-08d7edd1b8cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517
Content-Type: text/plain

Kernel binaries copying have to be performed in the do_deploy task to
avoid dependency loop between firmware-image-juno do_install and
virtual/kernel do_deploy when INITRAMFS_IMAGE_BUNDLE is set.

Also, copy the kernel image bundled with initramfs to the firmware
image when INITRAMFS_IMAGE_BUNDLE is set.

Change-Id: I66083d294ab4eb77c643ec33cc1333000373125b
Issue-Id: SCM-987
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-bsp/images/firmware-image-juno.bb      | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index 9be4005..b0ad14f 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -29,6 +29,8 @@ inherit deploy nopackages
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
+# The ${D} is used as a temporary directory and we don't generate any
+# packages for this recipe.
 do_install() {
     cp -a ${WORKDIR}/${UNPACK_DIR} ${D}
     cp -f ${RECIPE_SYSROOT}/firmware/bl1-juno.bin \
@@ -37,13 +39,6 @@ do_install() {
     cp -f ${RECIPE_SYSROOT}/firmware/fip-juno.bin \
         ${D}/${UNPACK_DIR}/SOFTWARE/fip.bin
 
-    for f in ${KERNEL_DEVICETREE}; do
-        install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
-            ${D}/${UNPACK_DIR}/SOFTWARE/.
-    done
-
-    cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
-
     # u-boot environment file
     cp -f ${WORKDIR}/uEnv.txt ${D}/${UNPACK_DIR}/SOFTWARE/
 
@@ -52,13 +47,29 @@ do_install() {
     cp -f ${WORKDIR}/images-r1.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262C/images.txt
     cp -f ${WORKDIR}/images-r2.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262D/images.txt
 }
-do_install[depends] += "virtual/kernel:do_deploy"
 
 do_deploy() {
+    # To avoid dependency loop between firmware-image-juno:do_install
+    # and virtual/kernel:do_deploy when INITRAMFS_IMAGE_BUNDLE = "1",
+    # we need to handle the kernel binaries copying in the do_deploy
+    # task.
+    for f in ${KERNEL_DEVICETREE}; do
+        install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
+            ${D}/${UNPACK_DIR}/SOFTWARE/.
+    done
+
+    if [ "${INITRAMFS_IMAGE_BUNDLE}" -eq 1 ]; then
+        cp -L -f ${DEPLOY_DIR_IMAGE}/Image-initramfs-juno.bin \
+            ${D}/${UNPACK_DIR}/SOFTWARE/Image
+    else
+        cp -L -f ${DEPLOY_DIR_IMAGE}/Image ${D}/${UNPACK_DIR}/SOFTWARE/
+    fi
+
     # Compress the files
     tar -C ${D}/${UNPACK_DIR} -zcvf ${WORKDIR}/${PN}.tar.gz ./
 
     # Deploy the compressed archive to the deploy folder
     install -D -p -m0644 ${WORKDIR}/${PN}.tar.gz ${DEPLOYDIR}/${PN}.tar.gz
 }
+do_deploy[depends] += "virtual/kernel:do_deploy"
 addtask deploy after do_install
-- 
2.7.4

