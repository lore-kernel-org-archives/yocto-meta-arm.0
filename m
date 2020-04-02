Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.70])
 by mx.groups.io with SMTP id smtpd.web11.119.1585847349454105189
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 10:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=moL/mX+L;
 spf=pass (domain: arm.com, ip: 40.107.20.70, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18k4Li9XdaeXI1XlJHIpkYXPFlyn99lwQV7Nu0rJzt8=;
 b=moL/mX+L50rrfLjjal68HVBtnETJF2CIybiyB7JQDv2sbWJfTMS9xgJxV5BoI/u+yq43E5nNgT2EE681jvDLvYu8Z3jorI1Jn4jELAFWgntrn/ouIGYwswOAh23tk3Ad+U1KT9il3JuLew8UIMzenJWOtUCVHJiqVY98cX6WdeA=
Received: from AM6PR10CA0075.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::16)
 by DB6PR0801MB1622.eurprd08.prod.outlook.com (2603:10a6:4:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 17:09:07 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::a1) by AM6PR10CA0075.outlook.office365.com
 (2603:10a6:209:8c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Thu, 2 Apr 2020 17:09:06 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:09:06 +0000
Received: ("Tessian outbound 1425309d4c0b:v50"); Thu, 02 Apr 2020 17:09:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c222ce3a8d44684d
X-CR-MTA-TID: 64aa7808
Received: from 00e1f5e28853.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 99A8F352-0C00-4840-8E97-6FF24BE948C9.1;
	Thu, 02 Apr 2020 17:09:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00e1f5e28853.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZ7x+bcapZ0KvbDRylao0WFcYbI4PItxB0fKeYS/zg6EmKhoaY5FJTaocAB5tRVGaCUhR6WNihCXS2Spkf1xs3GtylUGFubrfnGj0qhaCu8m+PGdmChhDp1/x1p6DuEF4sIC54Z6W8mmVEWDpRMSXnEhNfgUcF+1usx1eOMRkmvbdHV3TpLs+r7n8knR8oVOpKuiw8kwz9TYw7hr9gdeZkdvemsNPcBfyacnMQP3gkEgD03YYle3YbPudUBzP6E2/FNMFdg+S0Lpib2mktjkPhHL0Deesgor8RN8+1gYwAdO/3aUzvVT7ixI55LHpioHJSwnJx0IhRSUtH7MuYFjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18k4Li9XdaeXI1XlJHIpkYXPFlyn99lwQV7Nu0rJzt8=;
 b=iwSEtVsMjBiP+2cV5lrHBMh+XRXVl4B/Txf8mH16h8I0N5xJFCvbp9Mkb54B+3apmoied0F1oVZDlSE4ZfZORygduPIjU36f/Up/Z8/mf1UPjn24CK/8L9rUc3iVazP3vTd3FkyVjERyCP++PSKjif3yE1ivN9EluiAqNyPKtKS5kxqq3JBSyTSH+cEdUYUXGPDPQnaji7OLIY4G9JE03l9UP7WOcANmj9DryDCUTr63wc3k7eXIDugORKB3trtfy03y/oNqH1SKpALP94Fndh2p3ib6v6fvqPJmAkmapewu40qbmMD8N/UnkjqdmSIEljoWg815hRswNk8F8PO32A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18k4Li9XdaeXI1XlJHIpkYXPFlyn99lwQV7Nu0rJzt8=;
 b=moL/mX+L50rrfLjjal68HVBtnETJF2CIybiyB7JQDv2sbWJfTMS9xgJxV5BoI/u+yq43E5nNgT2EE681jvDLvYu8Z3jorI1Jn4jELAFWgntrn/ouIGYwswOAh23tk3Ad+U1KT9il3JuLew8UIMzenJWOtUCVHJiqVY98cX6WdeA=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3801.eurprd08.prod.outlook.com (20.178.46.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 17:08:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:08:59 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 5/7] arm-autonomy: Create xenguest image type
Date: Thu,  2 Apr 2020 18:08:14 +0100
Message-Id: <20200402170816.8818-6-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:08:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a93a481-de15-460d-f008-08d7d7288d62
X-MS-TrafficTypeDiagnostic: DB7PR08MB3801:|DB6PR0801MB1622:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB1622C7589F6FE7B1A275B0629DC60@DB6PR0801MB1622.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(5660300002)(66556008)(44832011)(2906002)(4326008)(66946007)(8676002)(66476007)(6666004)(6916009)(26005)(186003)(1076003)(81166006)(316002)(52116002)(478600001)(86362001)(6486002)(7696005)(956004)(2616005)(16526019)(81156014)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4UpOgJB1tvBKmtnGv5sLEOmZU0gTrEom+syGpRrI8XC6znZp87Fur9LqiLWXy1IZRUNaOlKWmfR8360hmu8lJ9DqprCdCWOHIA1iAZVQwVONIDa6r5xzUq0jZEgBerwKLO/icjf7tD0CaDYIdqRDXXSMu0a6gHTGuvM5QN+pWmr0633M2zoRhPSvwVFxEiiayli9fkSfuw3UqcKiHkjqjR4cMzywedfMUvbSy5oEk2SJ357iYfOc6kj2cqZRqshvb7rQbDFEKGM3HW8vGr/b7UKa0OSYPoQynq3vNrFja7YmnlAYrCEJ9wO0ogx/vUX+c9xUKxKODi3xh1v8wUpreVnaTVUjYH//GXNycfe8l4BE0+zaaDMB7r6hSR1pibq3vtixTNBjlbuC0H83o/+35494aMSAzb4BlsTayiEXm8gRrXsbkMfHjwsGdC9gGhlT
X-MS-Exchange-AntiSpam-MessageData: 
 vY/94z4SBWTACzk9SVUBaKkWoTV97+H0KHotz07eWPPrpChJoMcqI7hGaiPjf0q2fpQ7yOSdJV6Nd+7t9WXYAVagr3S2JYYxgV/Vq1mNIFWxpAW5Z0UxSc2paDUkEtlX2OrHepB/4+i0BRJSeSJhnQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(6916009)(956004)(316002)(16526019)(356004)(36906005)(336012)(2616005)(186003)(7696005)(6666004)(26826003)(6486002)(4326008)(26005)(1076003)(478600001)(82740400003)(2906002)(81156014)(44832011)(8676002)(86362001)(8936002)(70206006)(81166006)(36756003)(5660300002)(47076004)(70586007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f41944cb-b411-4ef0-ad86-08d7d72888e7
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jm/AZ9qYlXoaTtEDTDmJyFus76XIfSwi5F3bB21FtEGRtLqxDzUGfLtGBL7ZwzhmEeZmBsqZppp9+VImNAE9ZMBUHuGVzaUAGETIa7JSsmPtgiHBgiLfD/v9BsFOsWfX+C/l6Wa+LtIZMV5N4PflDIOrMkjlgGdwZC+v++ORdrObiOm6kYLCyHBiPeYnlvQGMgEYffxFf5CDGHR6LheIJGgg/+cdFtV6cj5M3ZYLzOJFrrAF0f5m0OnuIMGsNqCVd+PilksoZaYkVYX7Ab3hNMWvMSiPxSSsuC5QrT70eKXp6+iXzoYm5ighMfyRSUqZDKAofD/7I/mJRob4QXOCl3oWPV77JqBzEn5towIhIWZyJ17eFheZ4dJA4B6LaVq+8Et/L7g4RRiVtMCET4TWgLq5YlbzxDCWvnQDQpoOpFRhXDRcX19WG2bG6HL9FWBbZUpnCg+1xwaSpxShKVLALi1WTqUQ7zbJAk5g3VWeAyfD+T+jVzGwB35uGdJnBZQ0I2RowzfHHWRbeMyut6IQdQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:09:06.5908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a93a481-de15-460d-f008-08d7d7288d62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1622
Content-Type: text/plain

Create an image type xenguest to create a xenguest image as part of a
Yocto image (add FSTYPE xenguest).

The image type is using xenguest-base-image as a producer for the
xenguest image directory, adds kernel defined by
XENGUEST_IMAGE_KERNEL to it, adds rootfs if listed in
XENGUEST_IMAGE_DISK_PARTITIONS and pack the final image with file
extension .xenguest with other types of images.

If initramfs is configured, a xenguest image containing the kernel with
initramfs is produced.

The xenguest image type is added to IMAGE_FSTYPES and IMAGE_CLASSES if
arm-autonomy-guest is set in DISTRO_FEATURES.

Change-Id: Ibae8a50d41375839492e43a2e28d9472dc71b4a1
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../classes/image_types_xenguest.bbclass      | 132 ++++++++++++++++++
 .../distro/include/arm-autonomy-guest.inc     |   4 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta-arm-autonomy/classes/image_types_xenguest.bbclass

diff --git a/meta-arm-autonomy/classes/image_types_xenguest.bbclass b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
new file mode 100644
index 0000000..ff1e41a
--- /dev/null
+++ b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
@@ -0,0 +1,132 @@
+# Create a xenguest image with kernel and filesystem produced by Yocto
+# This will create a .xenguest file that the xenguest-manager can use.
+
+inherit xenguest-image deploy
+
+# We are creating our guest in a local subdirectory
+# force the value so that we are not impacted if the user is changing it
+XENGUEST_IMAGE_DEPLOY_DIR = "${WORKDIR}/tmp-xenguest"
+
+# Name of deployed file (keep standard image name and add .xenguest)
+XENGUEST_IMAGE_DEPLOY ??= "${IMAGE_NAME}"
+
+# Deployed file when building with initramfs
+XENGUEST_IMAGE_INITRAMFS_DEPLOY ??= "Image-initramfs-${MACHINE}"
+
+# Add kernel XENGUEST_IMAGE_KERNEL from DEPLOY_DIR_IMAGE to image
+xenguest_image_add_kernel() {
+    srcfile="${1:-}"
+    if [ -z "${srcfile}" ]; then
+        srcfile="${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_KERNEL}"
+    fi
+    call_xenguest_mkimage partial --xen-kernel=$srcfile
+}
+
+# Add rootfs file to the image
+xenguest_image_add_rootfs() {
+    call_xenguest_mkimage partial \
+        --disk-add-file=${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${IMAGE_TYPEDEP_xenguest}:rootfs.${IMAGE_TYPEDEP_xenguest}
+}
+
+# Pack xenguest image
+xenguest_image_pack() {
+    mkdir -p ${IMGDEPLOYDIR}
+    rm -f ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
+    call_xenguest_mkimage pack \
+        ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
+}
+
+# do_deploy is used for initramfs to pack the kernel initramfs in an image
+do_deploy() {
+    # Add kernel
+    xenguest_image_add_kernel
+
+    # Pack the image in deploydir
+    mkdir -p ${DEPLOYDIR}
+    rm -f ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
+    call_xenguest_mkimage pack \
+        ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
+}
+do_deploy[depends] += "${PN}:do_bootimg_xenguest"
+do_deploy[depends] += "virtual/kernel:do_deploy"
+
+#
+# Task finishing the bootimg
+# We need this task to actually create the symlinks
+#
+python do_bootimg_xenguest() {
+    subtasks = d.getVarFlag('do_bootimg_xenguest', 'subtasks')
+
+    bb.build.exec_func('xenguest_image_clone', d)
+    if subtasks:
+        for tk in subtasks.split():
+            bb.build.exec_func(tk, d)
+    bb.build.exec_func('xenguest_image_pack', d)
+    bb.build.exec_func('create_symlinks', d)
+}
+# This is used to add sub-tasks to do_bootimg_xenguest
+do_bootimg_xenguest[subtasks] = ""
+# Those are required by create_symlinks to find our image
+do_bootimg_xenguest[subimages] = "xenguest"
+do_bootimg_xenguest[imgsuffix] = "."
+do_bootimg_xenguest[depends] += "xenguest-base-image:do_deploy"
+# Need to have rootfs so all recipes have deployed their content
+do_bootimg_xenguest[depends] += "${PN}:do_rootfs"
+
+# This set in python anonymous after, just set a default value here
+IMAGE_TYPEDEP_xenguest ?= "tar"
+
+# We must not be built at rootfs build time because we need the kernel
+IMAGE_TYPES_MASKED += "xenguest"
+IMAGE_TYPES += "xenguest"
+
+python __anonymous() {
+    # Do not do anything if we are not in the want FSTYPES
+    if bb.utils.contains_any('IMAGE_FSTYPES', 'xenguest', '1', '0', d):
+
+        # Check the coherency of the configuration
+        rootfs_needed = False
+        rootfs_file = ''
+        kernel_needed = False
+        initramfs_needed = False
+
+        rootfs_file = xenguest_image_rootfs_file(d)
+        if rootfs_file:
+            rootfs_needed = True
+
+        if d.getVar('XENGUEST_IMAGE_KERNEL'):
+            kernel_needed = True
+
+        if d.getVar('INITRAMFS_IMAGE'):
+            if int(d.getVar('INITRAMFS_IMAGE_BUNDLE')) != 1:
+                bb.error("xenguest-fstype: INITRAMFS_IMAGE is set but INITRAMFS_IMAGE_BUNDLE is set to 0.\n")
+                bb.fatal("xenguest-fstype: This configuration is not supported by xenguest image type\n")
+            initramfs_needed = True
+
+        if initramfs_needed and rootfs_needed:
+            bb.warn("xenguest-fstype: Final image will use an initramfs kernel and rootfs in disk.\n")
+            bb.warn("xenguest-fstype: rootfs.tar.%s should be removed from XENGUEST_IMAGE_DISK_PARTITIONS.\n")
+
+        if not initramfs_needed and not rootfs_needed and not kernel_needed:
+            bb.warn("xenguest-fstype: Generated image will have no kernel and no rootfs.\n")
+
+        bb.build.addtask('do_bootimg_xenguest', 'do_image_complete', None, d)
+
+        if rootfs_needed:
+            # tell do_bootimg_xenguest to call add_rootfs
+            d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_image_add_rootfs')
+            # do_bootimg_xenguest will need the tar file
+            d.appendVarFlag('do_bootimg_xenguest', 'depends', ' %s:do_image_tar' % (d.getVar('PN')))
+            # set our TYPEDEP to the proper compression
+            d.setVar('IMAGE_TYPEDEP_xenguest', 'tar' + (rootfs_file.split('.tar', 1)[1] or ''))
+
+        if kernel_needed:
+            if initramfs_needed:
+                bb.build.addtask('do_deploy', 'do_build', None, d)
+            else:
+                # Tell do_bootimg_xenguest to call xenguest_image_add_kernel
+                d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_image_add_kernel')
+                # we will need kernel do_deploy
+                d.appendVarFlag('do_bootimg_xenguest', 'depends', ' virtual/kernel:do_deploy')
+}
+
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
index d961b40..9b5889e 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
@@ -3,3 +3,7 @@
 # We need to have ipv4 activated
 DISTRO_FEATURES_append = " ipv4"
 
+# Build a xenguest type image
+IMAGE_CLASSES += "image_types_xenguest"
+IMAGE_FSTYPES += "xenguest"
+
-- 
2.17.1

