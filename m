Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.74])
 by mx.groups.io with SMTP id smtpd.web10.8850.1585306377624960382
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zoEZdDcD;
 spf=pass (domain: arm.com, ip: 40.107.20.74, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VYfRQKS15/OfsoHpSVemvsKsF/tO9lYN32sfw9WxxY=;
 b=zoEZdDcDvjG8rKxgCv1otCBuqYlJXTQbgE7J6cDxTR18EuoGnPN6+q0hnVl+mLIPCAMSFaOUd9tTTVw2Vic2e0peJEs3kBgyD8PvOCrfOFnZPwoP2AcIiWTLQeMTTQS48tBDoyFaJq8pxx4EKH9Z5CjDQ36xht2ZVKBAjXwSwJU=
Received: from VI1PR08CA0183.eurprd08.prod.outlook.com (2603:10a6:800:d2::13)
 by AM6PR08MB3222.eurprd08.prod.outlook.com (2603:10a6:209:43::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Fri, 27 Mar
 2020 10:52:55 +0000
Received: from VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:800:d2:cafe::c5) by VI1PR08CA0183.outlook.office365.com
 (2603:10a6:800:d2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:52:55 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT032.mail.protection.outlook.com (10.152.18.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:52:54 +0000
Received: ("Tessian outbound 19f8d550f75c:v48"); Fri, 27 Mar 2020 10:52:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a3521ff9975e66b
X-CR-MTA-TID: 64aa7808
Received: from 2b4c43952ab9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 89B1B495-0806-4EB4-A63F-C7C406F0148D.1;
	Fri, 27 Mar 2020 10:52:49 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b4c43952ab9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcgjrjGba9UTNKWvTTG0EAaPV2HrKGmCTQp6w0alQTFsOOceBk6VxgpwLjkc7NHk9On7fo+Z61f1S3bR5XtNVvqHH0uE0po8TuD0W3AbUJX4pHD73JvEdzR5EwOozTFzkfu+mFPMmpLSWiw7QDTgiWvIZtsgw1dSRVVnEdHJ8eLjJ39Kjvw8+onDgA5hLetNlMr0PbO1ZypC4G7W/HlK8BtJcWnOtKur5l6SkMlIg5kExKTjuLhfMJUYJV95T6QKMCENiz8+PzuXEAngjwkYW2jzY+rbXNqFMRH6Y/cBdAPaZInrofo3KMmD+MLXypqicqGxnThOI+IAXKVIePz6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VYfRQKS15/OfsoHpSVemvsKsF/tO9lYN32sfw9WxxY=;
 b=bmVVmARoz6IrJnJxyew50D+F/Y0igF4sZiCIk5M4AzqndgBloBO4CaPzQo3MhzS2rn0JZ/TIEYdidnnQ9Ujj53WP/IE8jNpxhxkE0Q/eUIAjNRHVw/IQZnQCOw21jYkPS4pZ5S5i9kXhWK6aD0WiD46PAcMlk/GFQs6EOF/eaYPmY6xP43J9M6dlbcynkdlG84WM//A1HZ2iFb+htv3uo3VWgplTGS/xU81sZGyT6UDhF95HgvKTxVH+XGIVh9PEApwi6KxDBLruU4IDeCtfTwUD5fDaRXHHQdKg/RsglUUo4L9uYpN1t2ztTgotLgfUiMoP7h1PgPoPQM6rpsxtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VYfRQKS15/OfsoHpSVemvsKsF/tO9lYN32sfw9WxxY=;
 b=zoEZdDcDvjG8rKxgCv1otCBuqYlJXTQbgE7J6cDxTR18EuoGnPN6+q0hnVl+mLIPCAMSFaOUd9tTTVw2Vic2e0peJEs3kBgyD8PvOCrfOFnZPwoP2AcIiWTLQeMTTQS48tBDoyFaJq8pxx4EKH9Z5CjDQ36xht2ZVKBAjXwSwJU=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:52:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:52:48 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/7] arm-autonomy: Create xenguest-image class
Date: Fri, 27 Mar 2020 10:52:19 +0000
Message-Id: <20200327105223.460-4-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105223.460-1-bertrand.marquis@arm.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.54) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:52:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 59fbe92e-df0d-4d1c-e5e8-08d7d23d0135
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|AM6PR08MB3222:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3222D60247A9F2B7663703739DCC0@AM6PR08MB3222.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002)(473944003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 sPrqz2B2X0KD67jlX7k8tJbRprQ/hdt6M+5zYWS8YhhbFN8JFhO93pDpCNG08l2tA4hr00WNL2kGxTQPdjKdFBxMJONuCWywn7hIuVex4tCegE/e4FfVfONIHL0ZcT2HgPHU4++Kvi/jSmtXTbaNM+ML0DSRFvpH96GaJ/uDr3BvJWPjJyRHaN7640jxfUwclXqF6pPwo71c68hvPI3Bcm5P0KRwWQX0+eorI/WmfqbHxb0WNqYPfdzMuWuJJzGCKVmP4Pc2tut+eG+JAEvMEHDdGOQ7n9ckQqm7d3p1CcMtvw/fpS3mT02coihKGfkSW2axVFpUN6HJNrDTVsiHgaFHg9YLLKQN8LDmLwQzcDBfE4MHMNJte+fdRp7m585mvHGuGhLLVMv8ihVorN1KSfqySCZK3qKYMNdGdtzJ9qvjhNDoCpwz0yiNitZasdJkz1jGY4fgx0506YXZeM5t4vw92egAt8I1nCQSUWOCT0cLGJ2OCvU32gUkvHaiYPPW
X-MS-Exchange-AntiSpam-MessageData: 
 5Vx315EZYAHZEqdffFsDeSo9ayq881EbfvB9Hfs3ahIqRwfHT1ejPSU5AwziaXX2Pr3DFambje1PBAkQzCy8cooTv8fMlT/uoSaUaa2YfjS1KI+1wh3C8iU8rFsWFb4MrZN6JPz2tdolYLY4qvJJJg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(5660300002)(81166006)(82740400003)(86362001)(16526019)(6486002)(6916009)(8676002)(956004)(478600001)(336012)(26005)(186003)(36756003)(81156014)(2616005)(36906005)(316002)(1076003)(44832011)(8936002)(2906002)(4326008)(26826003)(47076004)(7696005)(6666004)(70586007)(356004)(70206006)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	65dfd7c0-05b3-423b-1bbb-08d7d23cfcc8
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4EEh9MSn7I5QINHbQFpaVXJagdcRddnl+uJGfQrmUnrjtZNDmaRFsJe5yGKhmVEAohH5f8OiyJ8ACkcP9C8S8qa1i5+FCXEjYXxHsTP1J+9q2WgNi3euEQHYxnDA+/N0L0unL+I/3cz/ksDIXIuH/JWwpf0PYKAhZMcmb6q3FIEeTNxEkSq0bivKiQPnFkjSY7uBjXWaIRey51dHwv7iOEOdCrHDn5K4G79RVDCyJ5ppVrCDAtUloxWfDpTzrhbQNVauPoEOvjUbz1R4eSmfA8fuDAZI53DCgg/ese3PuYYJhJ4NXT4hb7B9IcBz8g+H30Dxb8KioCTotCscyWr2qZfweoSPoIso2GZUVKqESYYbP40XQPKy9AUoekkiitrYLmHYlttNAE0gVTu4cxQCxkqV517lt5q41gooIGAIJcxYuptrPUGuFQxEb5HotTLHu5GjBRogkDyJhd8TrYXh1XiUQvHxe3Ai1+oQpNs2JWa4ayw6nL+zBX7sxQdQp5TNwwkb8aeVH5HS9JGfUzZNuYHadC4DNv1pNoGXHRxYVKc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:52:54.9943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fbe92e-df0d-4d1c-e5e8-08d7d23d0135
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3222
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

