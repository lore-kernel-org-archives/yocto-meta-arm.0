Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.71])
 by mx.groups.io with SMTP id smtpd.web10.118.1585847345323263199
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 10:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qntDiikg;
 spf=pass (domain: arm.com, ip: 40.107.22.71, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VYfRQKS15/OfsoHpSVemvsKsF/tO9lYN32sfw9WxxY=;
 b=qntDiikgt7IwXhFyyRPjQzbwSCfJi/7mybwskAduzrevxsGLPAvJzgGYklc0kSQtn5KMntTOWuXbXOHaQabsxrWUv8bU6Ii5bxu3pVkOLPU7YLgpjkJg/0cglcCgKAFmKhev+48kzxloWdUNSXQeC+sF+Wsvsoj4PkT8opVmitI=
Received: from AM6P191CA0064.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::41)
 by VI1PR0801MB1775.eurprd08.prod.outlook.com (2603:10a6:800:57::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 17:09:02 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::af) by AM6P191CA0064.outlook.office365.com
 (2603:10a6:209:7f::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend
 Transport; Thu, 2 Apr 2020 17:09:01 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:09:01 +0000
Received: ("Tessian outbound 9e48e1321951:v50"); Thu, 02 Apr 2020 17:09:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ec028f9023725e28
X-CR-MTA-TID: 64aa7808
Received: from ce01b10b4587.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6EAB6D72-B001-42C8-BC8B-457214CB14DE.1;
	Thu, 02 Apr 2020 17:08:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce01b10b4587.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:08:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl8zHdU4wD05Nmvfr6KvCILGE9GGVysgZNPmakKWWJRx/eFJchObtTcYrzz1jsIWx3QVWJJs4iHxCUANJtaKNKgoPwLUuqohnFVAoj7z/zKhJTw8+ER8tBKsEM+xjaNT1IrbtmEIe7HrXy87E1FowOf/WBEc3VO+gQTELkGCWHgLH5waPUaEODrX2oNxn9yNUzi0rTQZBk94AeOGFZp9buj6Vx838mI27ltHe6ISI82E7zKYxsd0tsY+MJzaE1XjzNpNiqQLz4R4JEMFS9RyI6Qda8fq1y6X6+8G5uhUXV2/8++n5q+04cnWjff6mWW2822fMFmUQvq9YYHvwT7oVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VYfRQKS15/OfsoHpSVemvsKsF/tO9lYN32sfw9WxxY=;
 b=i1ZtqMSmqef2/FtR6BKunYcsR7Ba0j/X6xsC/CM/tn3GfLsfrwD2jNryzWCbqmZH8smQidWH77oEv9rbHaoLRXpXKLDGDgPhn2JfDf4lQVto4w+1+mmJH2zqg+ux3i3KfKxWSjayDomuSpX63KPLMLy6lmrzoOSFaJizIwo4fXDQwICdZtXocHLWdY88BdSGS0zGZJL/1P3WeHphiTo5yh0Ps48oRF4PFlCsV5d8jhkjYO7Y00XBgWvAyEyB4VrQgZitOUFpIj2PmXa0RkkmOKlAMzV80htJ0irKR+eYCy4mKgl6prfa9f2I2QT3ECRAGlngxLIDLN3ZxXa9BeQYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VYfRQKS15/OfsoHpSVemvsKsF/tO9lYN32sfw9WxxY=;
 b=qntDiikgt7IwXhFyyRPjQzbwSCfJi/7mybwskAduzrevxsGLPAvJzgGYklc0kSQtn5KMntTOWuXbXOHaQabsxrWUv8bU6Ii5bxu3pVkOLPU7YLgpjkJg/0cglcCgKAFmKhev+48kzxloWdUNSXQeC+sF+Wsvsoj4PkT8opVmitI=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3801.eurprd08.prod.outlook.com (20.178.46.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 17:08:54 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:08:54 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 3/7] arm-autonomy: Create xenguest-image class
Date: Thu,  2 Apr 2020 18:08:12 +0100
Message-Id: <20200402170816.8818-4-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:08:52 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c26e6af4-9b58-443d-3735-08d7d7288a8b
X-MS-TrafficTypeDiagnostic: DB7PR08MB3801:|VI1PR0801MB1775:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB17751EC21E1A6AB469CEA6049DC60@VI1PR0801MB1775.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(5660300002)(66556008)(44832011)(2906002)(4326008)(66946007)(8676002)(66476007)(6666004)(6916009)(26005)(186003)(1076003)(81166006)(316002)(52116002)(478600001)(86362001)(6486002)(7696005)(956004)(2616005)(16526019)(81156014)(36756003)(473944003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Xk0qB3vG1kTejjlT9U7+Km1bHyaPZqnF6twuU8Gfxnzm5ziBaX0mKnAlrjxuehjtmrPmmYE5MqzSVBE7hI6AnlO3P+tfNvH/5S9ej6YZ2+SCPYMDvuikLZut102x8dlfmUtGZtwPmWGMNBuOpKsx0+mhU7XNAdNcBEjuA0CkqtY6hOLRzVh9ljaUGOs5qJFzwOrlqMEurvek6n56AJEw4FmFKoTLvo1TuM63K5rR6d5lvqgobU6MdC6UFhOcjmDFkSvC89iySWHjK0Ona4BMOZDvYUo76rhYKBvgs5j2+/wsEjAxy4MEJRoVuXaz+pVwh0afbLPb/WFRFrcIjmSvlCzhqDdt989GQ4lHY21BAX9Xs7pSdZ4oER7Csxp8HpKCaMqFw741SVCbxac6PsErQKuM8IwpqGJK7CvJpKeed9jvxyqi/nm1G3VoZnrsBDwYKjI5dkIavzE1U5ucOaAvTJmqKPvCL/h4/duIl8KThZtBxFp8kFc8OdKqKpeHbJmv
X-MS-Exchange-AntiSpam-MessageData: 
 +PM6782KArH3zW6bXIG83jGzNoYnG8RcEQPswW9YS6hbBYGGE0hCV0Ohc6xWTKVwKNxX/a8+Hlom27Yeb5N1JJG0tqfRBthyUC4abM5bQf4hAgY0OfxcZh9n9abrdZis4cLM9G+fCz0sTEBe4SRnMw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(1076003)(44832011)(8676002)(478600001)(8936002)(81156014)(7696005)(81166006)(26826003)(336012)(86362001)(26005)(47076004)(5660300002)(4326008)(70586007)(16526019)(70206006)(2616005)(6916009)(316002)(6666004)(82740400003)(6486002)(956004)(186003)(356004)(36756003)(2906002)(36906005)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c5b536e9-68f7-4b39-3665-08d7d728860b
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a/3oG4OH56c1L5DxINAnt4eNESgInsbCuQXtmwa+HIuQ2/C7W+m6z8qYhMOw7hnWieoseQLw6Ua7C6Emgyjx+jGzyJE9EFvt1bKB30RBx3VZMKqZEfn1X14L5So+681SK0EhMn9aNQfqejF7pR7h92whNe9d4HsXMiZnrQ7g7wLhVIVZIj2wEZ38G5lWA59PvrSkBaKgwQOkt/S3dDP3muvjHnRd2ce3M/GYPhaTU0MbYD7gyw+NzdZRPc0odoNgJQy8g/JJY9EW0UXWJhXGORKSN7tcfZVQKrfmfM/YpZLYEAFKNztCoq3Xb9rV/b4SdJQiVIVSmTgDJigihZObaKtN8px54FwOaXt5cf1AZaGBqsUfTyciOATi2XWXaDMV9aDOvQcVYecS4GrxCGtPrntTIxr9h+WtElgUlMzU5AtWDDpxBMT45EFJscgAHHYKvJlibbjbDL1RwiHRe612xmSw5kB9F/wcRn7Dz0i/WboZZKLmO9G7e4hYA3+gvkIdxBdzfOFmX97OxpIvTyrxFhQe6cecGJx1QCdkeI35nK8=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:09:01.8657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26e6af4-9b58-443d-3735-08d7d7288a8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1775
Content-Type: text/plain

Create xenguest-image class to be used by recipes and other classes to
manipulate xenguest images.
The recipe is defining some variables to configure default parameters of
xenguest image (memory size, number of vcpus, command line, etc.). Those
parameters all have the prefix XENGUEST_IMAGE_ and are documented at the
beginning of the class.

The class also provide some helper functions:
- xenguest_image_create to create a xenguest image (using global
parameters) in deploy as xenguest image directory
- xenguest_image_clone to clone current xenguest image from deploy to be
able to extend it and pack it in a xenguest image file
- xenguest_image_rootfs_file function to allow other recipes to detect
if the rootfs should or not be embedded in the xenguest image

Change-Id: I4ba54aa2c41e72964c152f673b71fe32f30b4aca
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../classes/xenguest-image.bbclass            | 187 ++++++++++++++++++
 1 file changed, 187 insertions(+)
 create mode 100644 meta-arm-autonomy/classes/xenguest-image.bbclass

diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
new file mode 100644
index 0000000..fecf1ae
--- /dev/null
+++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
@@ -0,0 +1,187 @@
+# This class must be used to create, extend or pack a xenguest image.
+# It is using xenguest-mkimage tool to do operations
+
+DEPENDS += "xenguest-mkimage-native"
+
+#
+# Xenguest image parameters
+# All the following parameters can be modified in local.conf or on recipes
+# inheriting this class
+#
+
+# Guest memory size in MB
+XENGUEST_IMAGE_MEMORY_SIZE ??= "512"
+
+# Guest number of vcpus
+XENGUEST_IMAGE_NUM_VCPUS ??= "1"
+
+# Guest auto boot during init, set to 1 to have guest started during init or
+# to 0 if the guest should not be auto started
+XENGUEST_IMAGE_AUTOBOOT ??= "1"
+
+# Partition containing the root file system
+# Xen will actually add root=${XENGUEST_IMAGE_ROOT} to your guest kernel
+# command line
+# You can let this empty if the root filesystem is specified in an other way
+# and have root= option added to the command line for example or if you don't
+# need a root filesystem mounted for your guest (initrd for example)
+XENGUEST_IMAGE_ROOT ??= "/dev/xvda1"
+
+# Guest kernel command line arguments
+XENGUEST_IMAGE_CMDLINE ??= "earlyprintk=xenboot console=hvc0 rw"
+
+# Extra commands to add to xenguest-image when creating the image
+XENGUEST_IMAGE_EXTRA_CMD ??= ""
+
+# Kernel binary
+# This value is used by the xenguest image type but is declared here to have
+# all variables in the same place
+# Default value is:
+# - Image if INITRAMFS_IMAGE is not set
+# - Image-initramfs-${MACHINE}.bin if INITRAMFS_IMAGE is set
+# If this value is empty no kernel will be added to the image
+XENGUEST_IMAGE_KERNEL ??= "${@ 'Image' if not d.getVar('INITRAMFS_IMAGE') else 'Image-initramfs-${MACHINE}.bin'}"
+
+# Size of the disk to create (if 0 no disk will be created and rootfs will not
+# be included in the xenguest image)
+XENGUEST_IMAGE_DISK_SIZE ??= "${@ '4' if not d.getVar('INITRAMFS_IMAGE') else '0'}"
+
+#
+# XENGUEST_IMAGE_DISK PARTITIONS is used to describe the partitions to setup
+# and their content.
+# It must be set to a space separated list of entries with each entry having
+# the format num:sz:fs:[file] where:
+# - num is a partition number
+# - sz is the partition size in Gigabit
+# - fs is the filesystem to use for the partition
+# - file is optionally pointing to a file to use as content of the partition
+#   Please check image_types_xenguest.bbclass for rootfs handling of files
+#
+# Default value creates a partition 1 using the full disk, formated with ext4
+# and containing the root filesystem produced by Yocto
+XENGUEST_IMAGE_DISK_PARTITIONS ??= "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:rootfs.tar.gz"
+
+# Sub-directory in wich the guest is created. This is create in deploy as a
+# subdirectory and must be coherent between all components using this class so
+# it must only be modified from local.conf if needed
+XENGUEST_IMAGE_DEPLOY_SUBDIR ?= "xenguest"
+
+# Directory in which the xenguest should be deployed
+# a sub-directory named ${XENGUEST_IMAGE_DEPLOY_SUBDIR} will be created there.
+# This should be set to:
+# - ${DEPLOYDIR} (default) if creating or extending the xenguest for a normal
+#   recipe.
+# - something in ${WORKDIR} if you need to clone and manipulate an image
+XENGUEST_IMAGE_DEPLOY_DIR ??= "${DEPLOYDIR}"
+
+#
+# Wrapper to call xenguest-mkimage
+# It is using XENGUEST_IMAGE_DEPLOY_DIR and XENGUEST_IMAGE_DEPLOY_SUBDIR
+# to find the image to operate on
+#
+# Usage: call_xenguest_mkimage [operation] [args]
+call_xenguest_mkimage() {
+    local cmd="${1}"
+    local img="${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}"
+    shift
+
+    echo "xenguest-mkimage $cmd $img $@"
+    xenguest-mkimage $cmd $img $@
+}
+
+#
+# Create an initial xenguest image.
+# This is a task which must be added in a recipe inheriting deploy
+# It is using XENGUEST_IMAGE_MEMORY_SIZE, XENGUEST_IMAGE_NUM_VCPUS,
+#  XENGUEST_IMAGE_AUTOBOOT, XENGUEST_IMAGE_ROOT, XENGUEST_IMAGE_EXTRA_CMD,
+#  XENGUEST_IMAGE_CMDLINE, XENGUEST_IMAGE_DISK_SIZE and
+#  XENGUEST_IMAGE_DISK_PARTITIONS to customize the initial guest
+#
+xenguest_image_create() {
+    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
+        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
+        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
+    fi
+
+    rm -rf ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
+
+    mkdir -p ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
+
+    # Create the image
+    call_xenguest_mkimage create --xen-memory=${XENGUEST_IMAGE_MEMORY_SIZE} \
+        --xen-vcpus=${XENGUEST_IMAGE_NUM_VCPUS} \
+        --xen-root=${XENGUEST_IMAGE_ROOT} \
+        ${XENGUEST_IMAGE_EXTRA_CMD}
+
+    # add command line
+    if [ -n "${XENGUEST_IMAGE_CMDLINE}" ]; then
+        call_xenguest_mkimage update --xen-clean-extra
+        for arg in ${XENGUEST_IMAGE_CMDLINE}; do
+            call_xenguest_mkimage update --xen-extra=$arg
+        done
+    fi
+
+    # create disk if needed
+    disksize="${XENGUEST_IMAGE_DISK_SIZE}"
+    if [ -z "$disksize" ]; then
+        disksize="0"
+    fi
+    if [ $disksize -gt 0 ]; then
+        # setup disk size
+        call_xenguest_mkimage update --disk-reset-config --disk-size=$disksize
+
+        diskparts="${XENGUEST_IMAGE_DISK_PARTITIONS}"
+        if [ -n "$diskparts" ]; then
+            for arg in $diskparts; do
+                call_xenguest_mkimage update --disk-add-part=$arg
+                partnum="$(expr $partnum + 1)"
+            done
+        fi
+    fi
+
+    if [ "${XENGUEST_IMAGE_AUTOBOOT}" = "1" ]; then
+        call_xenguest_mkimage update --set-param=GUEST_AUTOBOOT=1
+    else
+        call_xenguest_mkimage update --set-param=GUEST_AUTOBOOT=0
+    fi
+}
+
+#
+# Clone the current xenguest from deploy to manipulate it locally
+# This is required if you need to change things before packing an image
+# To set the local directory where to clone you must set
+# XENGUEST_IMAGE_DEPLOY_DIR if you don't want to use do_deploy to modify the
+# image
+#
+xenguest_image_clone() {
+    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
+        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
+        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
+    fi
+
+    if [ ! -f ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}/guest.cfg ]; then
+        die "xenguest-image: ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR} does not contain a valid guest"
+    fi
+
+    rm -rf ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
+    mkdir -p ${XENGUEST_IMAGE_DEPLOY_DIR}
+    cp -rf ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR} \
+        ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
+}
+
+# Helper function to retrieve rootfs file if present in one partition
+# This can return an empty string or rootfs.tar[.COMP]
+def xenguest_image_rootfs_file(d):
+    disksize = d.getVar('XENGUEST_IMAGE_DISK_SIZE')
+    # if disksize is 0, we don't create anything
+    if not disksize or disksize == '0':
+        return ""
+    # Find first partition with file=rootfs.tar*
+    partlist = d.getVar('XENGUEST_IMAGE_DISK_PARTITIONS')
+    if partlist:
+        for partdesc in partlist.split():
+            partelems = partdesc.split(':', 3)
+            if partelems[3]:
+                if partelems[3].startswith('rootfs.tar'):
+                    return partelems[3]
+    return ""
-- 
2.17.1

