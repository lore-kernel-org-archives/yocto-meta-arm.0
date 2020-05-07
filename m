Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.66])
 by mx.groups.io with SMTP id smtpd.web12.3596.1588849326407991999
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AzItdfDV;
 spf=pass (domain: arm.com, ip: 40.107.4.66, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0qa6PHhMgTvSws8D1m3OoH4cHM7PGgUcvI68YuKUls=;
 b=AzItdfDVcRgt8EV+RnziNl2L2HOFQ/BoIQQzeAgAMAgRhVIviOsJfDcjQOdDy54x/LeXWViQn4yBfF+FoWOB7ryqiWSXGjzZAlQOcaHNh93mzxS3kDTIzIwHGoXd0V2wQ6FTypaUkHLJntRuoDLNyIuCwLowniw1QoX3/sfc9yA=
Received: from DB6PR07CA0201.eurprd07.prod.outlook.com (2603:10a6:6:42::31) by
 AM5PR0801MB1923.eurprd08.prod.outlook.com (2603:10a6:203:4c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Thu, 7 May
 2020 11:02:03 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::9d) by DB6PR07CA0201.outlook.office365.com
 (2603:10a6:6:42::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.17 via Frontend
 Transport; Thu, 7 May 2020 11:02:02 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:02:02 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Thu, 07 May 2020 11:02:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad57061941a2d499
X-CR-MTA-TID: 64aa7808
Received: from 2f017b9f5091.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE69758C-132F-4F2B-9900-3AF9AEE6B4CA.1;
	Thu, 07 May 2020 11:01:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2f017b9f5091.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwhsBgzZD6QiIWPlTuDNBRm2a5h/cC3qrIQoj+lsgBIm50dYXlYoBuXwU70sLwKjMqqnGw0UMXDYMZVWqERTWu8k2qjlLyoM104dCGiZ0QZbWPYdfw+mYc9VRsJpYBKxkyW6OQQr2rySapCS+rxDxsuGEv4MWAkwUrRdudqlCYJreh8n9gGOIuzQ0Tm4LolPy+MbQVp5bP2yDWOo3V/cg5WKSv+Vt037bYKAFG6w/Lg4+kYVwszehernQSN1jqg3kKJ5k3+/MurAYVHbcqGm+f+PXyj04O4MxazAz0VbGYAYdQz3JI9jGzKPbWtNKAtsBSukDet7vfxn4+J6CyD4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0qa6PHhMgTvSws8D1m3OoH4cHM7PGgUcvI68YuKUls=;
 b=LmJm6fn1jTYvmCBeS3+AczONHpJ3h0N61FYXAo5vUEFKIg5aUZyjX0hfILgWhCQP4G/pmIKmuRS3U3/nmDbpNAc/46R21DjujUiNZ0eT6ZLceo0ekgS8aBHHWpv6FeKhMmEpzVYS2z3o90kzBjbooPcZfdd5IeULd8Be7zElU1+k7SH9yPmI3YRVMAO3TWusbt3Qp46eZPFYq3WwGFodZViOGWKlMlWt5aBbd43+9znWnwD6bjwsXfBWywSfEC05A8VjLrLWTkyIqX8t8EFfZUIXjanVpQMuKl4JDpMAsw262Xq89DC9QwUpcrN8EJDMC6kVLDd3krMVVQuYcUjypQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0qa6PHhMgTvSws8D1m3OoH4cHM7PGgUcvI68YuKUls=;
 b=AzItdfDVcRgt8EV+RnziNl2L2HOFQ/BoIQQzeAgAMAgRhVIviOsJfDcjQOdDy54x/LeXWViQn4yBfF+FoWOB7ryqiWSXGjzZAlQOcaHNh93mzxS3kDTIzIwHGoXd0V2wQ6FTypaUkHLJntRuoDLNyIuCwLowniw1QoX3/sfc9yA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3401.eurprd08.prod.outlook.com (2603:10a6:10:41::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 11:01:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:01:54 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-autonomy] rework initramfs support in xenguest FSTYPE
Date: Thu,  7 May 2020 11:43:26 +0100
Message-Id: <20200507104326.38408-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0175.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::19) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0175.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30 via Frontend Transport; Thu, 7 May 2020 11:01:54 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ae13744-18a2-4641-0d8d-08d7f2761292
X-MS-TrafficTypeDiagnostic: DB7PR08MB3401:|AM5PR0801MB1923:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB19234DAF481DE147620C29DF9DA50@AM5PR0801MB1923.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UErYXTr/c5NDGiv3mCT7shiivNITHkfixTYDvYYFz+3+JU6pVnDjTC3piE9a/WbcbAA68kBISawGPGLBHvX6lr7Wit7k5dnvZ4B9kR1MtGF9xjQvhjLNqUfeCLHXjFCddOqQX31r/Bp0N9OPW75++csWi/Ic78AlxsdMCodEM0OZQyNu2hLyzwfs15lPQXfgXbqjO+xevZ3Ra+qtVV/NgFjes93OdD9UJA5xTuXGTjPCgNu3u0hrNa2pP+KqnjQFLY9wSMUwTUNOsrr8wRQ8iOdKNMzbH2DZpkDoSXF+dgCgq1CjNuu6CU4l2l9Rw+Bd+MgTnlZciWA325YiXgOw9f+DoEDVkq5IOtTWwfjkaGJpZ0JvXm9g61ZTpEKul+i8btkEla5kaKPAmrIc0d13cBabZkGtifWan6uZXkSgaoZ5hQvjrNB3lrkMVwbEa3Kw4HKBaqjTBXQHnlns35TYEP/5s3Bd9SA8PACoBvRMf3GrZApIxi6U9lJScR5OLWWxNnbHq0eZ2ejkL1R+xATOTQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(33430700001)(478600001)(5660300002)(6666004)(86362001)(316002)(8936002)(4326008)(66556008)(2616005)(956004)(6486002)(36756003)(2906002)(8676002)(66476007)(83320400001)(83280400001)(83310400001)(6916009)(26005)(16526019)(7696005)(44832011)(52116002)(83290400001)(33440700001)(66946007)(83300400001)(186003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 D4w44tDiXM1Sp0cm2Mag19o7kO/gTz+3400LgbIqaOq04NYXfPlB8ec0gUpwYlHLnT/+FUBLGQInmuwjdH7LPJM/KpRKuuD2efvhdIg2QZgacpfSfpypFqOLu2FZcb78WNADsiO7yxhjE30FGLXIdLEqKR8VPG8ooWc6mAjOdh5aCC43jcd2/EFifMlXSkmpmVhhTNzmOeXMmqfyH2J9zCYIczHk/HF+oAa2aUpXq5Lkm8vDTnQ4jJPEp4avzAYctq/hpZ3p5+rIt+Ey+XS6QjgCaWZTVZ0JakKpjX1tyUWcXcyFMu1v5oBXpK0uB9uL1vbT6Ywe0Vz3gd9PV/voZSULR/R/scM72pGw2Hdi18kubPRzA9sRlgQS0vG0A/uQb2vjJuCfePhoxF6UA7LhkEmWR2NyaE03ndqR/II1snJnQm4F4nxb/iqEh90WMVITAeDHNDKihvqT0fNVMEkdtaassJcSL2yD1RLRY7WyADF5yWNpBuQrHmfZ3CHZ1cAN4b6U/ADM2Op6HmjAjwcPA58GrXMdelebpgDFA1pyueRrAUgl4VyZsb7jv5/HR7iGLyIb9geRZ4VfbCMGMN6qhwoyEfOixt70MEMlDY1mToyMOt5/0VZWGQHxvukhiyiw6exrUPLib3g0c0UyKpQDSMr9uVSQ7trBFndSwFbskxnJxfaia2RbA7k9XroFE1mAq2GSc9SPg1W8e4nUCNgTKO8DnsTctp30c8Fa4r/oqa0ijBL5Tx9+8Q059APEU7EzgdaALzVnSWDQkJHFRFP9kpGPQxdEMCuHvmLMYuFd/8I=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3401
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(33430700001)(6666004)(47076004)(6486002)(70586007)(70206006)(2616005)(316002)(86362001)(44832011)(356005)(956004)(4326008)(2906002)(81166007)(336012)(16526019)(36756003)(82740400003)(5660300002)(26005)(1076003)(478600001)(186003)(8936002)(6916009)(33440700001)(82310400002)(7696005)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5ba74954-a4d2-4725-4772-08d7f2760da1
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	USrtppFhBhsJjo20aV57qK/6Fc3XFqACnP6fNi24VAbQLS2q0/5lvU2acmhtoAo54RuR3CYO3gJQ3/Jg9p47rDzJFDFnInSqrWzj+M1h6td0zhyEN9xlc6xNWMFSJqmrzNRgoQ9u7Mf4bP9/C+3iRMFCC6xyRAi9nTuNDLwpjSPHihx4JKId7a5kBGxhBKFSomq4NCiFj7DUvqLvcL/1uUmVE9uhS7lNG/PqcK2IncgbzJ/+fgsGJD1cAqp37xIRPIDt9tUuGknmuCoKPELApfo/Kb56mw5RFV+mAwcsNDXuYTbW55MhdTu18RPNFprxqrTw0ug3lU/mvtdNWnIUrzTdy6J0iMRESlyL57X4ANP86/cGQ2HnUXfUbJu5vzq6dOCoGVLjsCLOJ2lN9l5NasX3bshbArZKZ8QNy6uXBqr/CBUU32zNBin8SxDMRbDjvrbr3INAsXYj5A0cbWi/QcRkx3bdcm01xS9Q8dmBurdesUbJSW1DzoeHVZECzxNhClleCWMXAT1u13hQkPQ92y06GCn/HUi4tQeKRbI3E216ytCnq2eLuPoi8MwZoHvQnbPK+6bAARkklOavh42N1Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:02:02.7728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae13744-18a2-4641-0d8d-08d7f2761292
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1923
Content-Type: text/plain

Rework the initramfs support in xenguest FSTYPE to be compatible with
Dunfell and remove an error with non existing recipeinfo during build.
- remove initramfs support in FSTYPE and do_deploy function
- create a KERNEL CLASS to create a xenguest image containing the kernel
bundle with initramfs during kernel compilation (only done if FSTYPE
contain xenguest and initramfs bundle is activated)
- add kernel-xenguest to KERNEL_CLASSES when autonomy-guest
DISTRO_FEATURE is activated
- remove unused parameters from xenguest-image class

Change-Id: If163aa74a2bbbd4f22651abefe8d2ab4677e82b0
Issue-Id: SCM-990
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../classes/image_types_xenguest.bbclass      | 56 ++++++-------------
 .../classes/kernel-xenguest.bbclass           | 34 +++++++++++
 .../classes/xenguest-image.bbclass            |  5 +-
 .../distro/include/arm-autonomy-guest.inc     |  2 +
 4 files changed, 53 insertions(+), 44 deletions(-)
 create mode 100644 meta-arm-autonomy/classes/kernel-xenguest.bbclass

diff --git a/meta-arm-autonomy/classes/image_types_xenguest.bbclass b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
index ff1e41a..195d6ed 100644
--- a/meta-arm-autonomy/classes/image_types_xenguest.bbclass
+++ b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
@@ -1,7 +1,7 @@
 # Create a xenguest image with kernel and filesystem produced by Yocto
 # This will create a .xenguest file that the xenguest-manager can use.
 
-inherit xenguest-image deploy
+inherit xenguest-image
 
 # We are creating our guest in a local subdirectory
 # force the value so that we are not impacted if the user is changing it
@@ -10,9 +10,6 @@ XENGUEST_IMAGE_DEPLOY_DIR = "${WORKDIR}/tmp-xenguest"
 # Name of deployed file (keep standard image name and add .xenguest)
 XENGUEST_IMAGE_DEPLOY ??= "${IMAGE_NAME}"
 
-# Deployed file when building with initramfs
-XENGUEST_IMAGE_INITRAMFS_DEPLOY ??= "Image-initramfs-${MACHINE}"
-
 # Add kernel XENGUEST_IMAGE_KERNEL from DEPLOY_DIR_IMAGE to image
 xenguest_image_add_kernel() {
     srcfile="${1:-}"
@@ -36,20 +33,6 @@ xenguest_image_pack() {
         ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
 }
 
-# do_deploy is used for initramfs to pack the kernel initramfs in an image
-do_deploy() {
-    # Add kernel
-    xenguest_image_add_kernel
-
-    # Pack the image in deploydir
-    mkdir -p ${DEPLOYDIR}
-    rm -f ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
-    call_xenguest_mkimage pack \
-        ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
-}
-do_deploy[depends] += "${PN}:do_bootimg_xenguest"
-do_deploy[depends] += "virtual/kernel:do_deploy"
-
 #
 # Task finishing the bootimg
 # We need this task to actually create the symlinks
@@ -88,28 +71,24 @@ python __anonymous() {
         rootfs_needed = False
         rootfs_file = ''
         kernel_needed = False
-        initramfs_needed = False
 
         rootfs_file = xenguest_image_rootfs_file(d)
         if rootfs_file:
             rootfs_needed = True
 
-        if d.getVar('XENGUEST_IMAGE_KERNEL'):
+        if d.getVar('XENGUEST_IMAGE_KERNEL') and not d.getVar('INITRAMFS_IMAGE'):
+            # If INITRAMFS_IMAGE is set, even if INITRAMFS_IMAGE_BUNDLE is not
+            # set to 1 to bundle the initramfs with the kernel, kernel.bbclass
+            # is setting a dependency on ${PN}:do_image_complete. We cannot
+            # in this case depend on do_deploy as it would create a circular
+            # dependency:
+            # do_image_complete would depend on kernel:do_deploy which would
+            # depend on ${PN}:do_image_complete
+            # In the case INITRAMFS_IMAGE_BUNDLE = 1, the kernel-xenguest class
+            # will handle the creation of a xenguest image with the kernel.
+            # In the other case the kernel can be added manually to the image.
             kernel_needed = True
 
-        if d.getVar('INITRAMFS_IMAGE'):
-            if int(d.getVar('INITRAMFS_IMAGE_BUNDLE')) != 1:
-                bb.error("xenguest-fstype: INITRAMFS_IMAGE is set but INITRAMFS_IMAGE_BUNDLE is set to 0.\n")
-                bb.fatal("xenguest-fstype: This configuration is not supported by xenguest image type\n")
-            initramfs_needed = True
-
-        if initramfs_needed and rootfs_needed:
-            bb.warn("xenguest-fstype: Final image will use an initramfs kernel and rootfs in disk.\n")
-            bb.warn("xenguest-fstype: rootfs.tar.%s should be removed from XENGUEST_IMAGE_DISK_PARTITIONS.\n")
-
-        if not initramfs_needed and not rootfs_needed and not kernel_needed:
-            bb.warn("xenguest-fstype: Generated image will have no kernel and no rootfs.\n")
-
         bb.build.addtask('do_bootimg_xenguest', 'do_image_complete', None, d)
 
         if rootfs_needed:
@@ -121,12 +100,9 @@ python __anonymous() {
             d.setVar('IMAGE_TYPEDEP_xenguest', 'tar' + (rootfs_file.split('.tar', 1)[1] or ''))
 
         if kernel_needed:
-            if initramfs_needed:
-                bb.build.addtask('do_deploy', 'do_build', None, d)
-            else:
-                # Tell do_bootimg_xenguest to call xenguest_image_add_kernel
-                d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_image_add_kernel')
-                # we will need kernel do_deploy
-                d.appendVarFlag('do_bootimg_xenguest', 'depends', ' virtual/kernel:do_deploy')
+            # Tell do_bootimg_xenguest to call xenguest_image_add_kernel
+            d.appendVarFlag('do_bootimg_xenguest', 'subtasks', ' xenguest_image_add_kernel')
+            # we will need kernel do_deploy
+            d.appendVarFlag('do_bootimg_xenguest', 'depends', ' virtual/kernel:do_deploy')
 }
 
diff --git a/meta-arm-autonomy/classes/kernel-xenguest.bbclass b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
new file mode 100644
index 0000000..a4954aa
--- /dev/null
+++ b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
@@ -0,0 +1,34 @@
+# Create a xenguest image containing the kernel with initramfs when
+# initramfs is activated
+# This is done using kernel-fitimage as model
+# To activate this, kernel-xenguest must be added to KERNEL_CLASSES
+
+inherit xenguest-image
+
+# use a local copy to pack all together
+XENGUEST_IMAGE_DEPLOY_DIR = "${WORKDIR}/tmp-xenguest"
+
+python __anonymous () {
+    # only if xenguest image type is present
+    if bb.utils.contains('IMAGE_FSTYPES', 'xenguest', '1', '0', d):
+        # only if initramfs bundle is activated
+        if d.getVar('INITRAMFS_IMAGE') and d.getVar('INITRAMFS_IMAGE_BUNDLE') == "1":
+            if not bb.utils.contains('KERNEL_IMAGETYPES', 'Image', '1', '0', d):
+                bb.fatal("xenguest image type with initramfs require Image kernel image type")
+            bb.build.addtask('do_assemble_xenguest_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+}
+
+do_assemble_xenguest_initramfs() {
+    xenguest_image_clone
+    call_xenguest_mkimage partial --xen-kernel=${B}/${KERNEL_OUTPUT_DIR}/Image.initramfs
+    rm -f ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
+    call_xenguest_mkimage pack ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
+}
+do_assemble_xenguest_initramfs[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
+
+kernel_do_deploy_append() {
+    if [ -f "${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest" ]; then
+        install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest "$deployDir/Image-${INITRAMFS_NAME}.xenguest"
+        ln -snf Image-${INITRAMFS_NAME}.xenguest $deployDir/Image-${INITRAMFS_LINK_NAME}.xenguest
+    fi
+}
diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
index b4d4122..e8880f3 100644
--- a/meta-arm-autonomy/classes/xenguest-image.bbclass
+++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
@@ -36,11 +36,8 @@ XENGUEST_IMAGE_EXTRA_CMD ??= ""
 # Kernel binary
 # This value is used by the xenguest image type but is declared here to have
 # all variables in the same place
-# Default value is:
-# - Image if INITRAMFS_IMAGE is not set
-# - Image-initramfs-${MACHINE}.bin if INITRAMFS_IMAGE is set
 # If this value is empty no kernel will be added to the image
-XENGUEST_IMAGE_KERNEL ??= "${@ 'Image' if not d.getVar('INITRAMFS_IMAGE') else 'Image-initramfs-${MACHINE}.bin'}"
+XENGUEST_IMAGE_KERNEL ??= "Image"
 
 # Size of the disk to create (if 0 no disk will be created and rootfs will not
 # be included in the xenguest image)
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
index 9b5889e..16b9f7e 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
@@ -7,3 +7,5 @@ DISTRO_FEATURES_append = " ipv4"
 IMAGE_CLASSES += "image_types_xenguest"
 IMAGE_FSTYPES += "xenguest"
 
+# xenguest kernel extension to handle initramfs
+KERNEL_CLASSES += "kernel-xenguest"
-- 
2.17.1

