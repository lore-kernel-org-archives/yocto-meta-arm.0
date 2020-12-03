Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.49])
 by mx.groups.io with SMTP id smtpd.web10.8884.1606996820834616352
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 04:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=syWgkNYW;
 spf=pass (domain: arm.com, ip: 40.107.6.49, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0awF0R7RIzaXL6c9eFwOMrEm05x7KMT44HLnjJXYLmo=;
 b=syWgkNYWDgTxUJksjhg71r4BrBJ/RLPcDwimhRqj0WrKUuOLLhd59ay70+vJp8LtCtawYdsAb9bgTp1vb2DrhYT9UeC+VaPRDTgrIKYQvUVag+1lvBa40qp86i++ezPQFK4HjpvjWC5QmGWNsaiErZFetqhI5+8ft/B3Dtrdl7E=
Received: from AM6P193CA0135.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::40)
 by AS8PR08MB6261.eurprd08.prod.outlook.com (2603:10a6:20b:295::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 12:00:18 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::29) by AM6P193CA0135.outlook.office365.com
 (2603:10a6:209:85::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:00:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:00:17 +0000
Received: ("Tessian outbound 6af064f543d4:v71"); Thu, 03 Dec 2020 12:00:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 847a11aef0590566
X-CR-MTA-TID: 64aa7808
Received: from e7a117564c1a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BFBAC772-1FE0-4DF3-83D0-8E0B26381078.1;
	Thu, 03 Dec 2020 11:59:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7a117564c1a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Dec 2020 11:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxsGkwT4TWXXp+YTIbuYPijTrMsvM6d3PfGISJnMiN+3gtfvMBx9dgsGcpUknbJBZhXZsAXcIiPcrbEW30GF7mg4OR6fjhe7kfgZS7P/piv3k4CjbPL6yR5vfTwjSFlBkdNa5sLblX7oTMClr4EeqQ6mFPjfYnW84DOaGQwLYJJq8jq7NB3e/FZFr+wYScrPDTd5PebZGMsU43b67bBtvf6DmAAYBlkwbxZjaPebIBBEZxiPE1C30VKveg4dN4Y/L/beagOB8V/Tyx9FGyqEFzKFLYqh9bn0e5uBGSEmjelXFJfiRsq2pvs2GBCaN5GH1Ubz35DAf2Y14mlpRoDA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0awF0R7RIzaXL6c9eFwOMrEm05x7KMT44HLnjJXYLmo=;
 b=YiyT4s5I0+BW+NOR9zZ03r/hCup9QV04CtOI3MUyAQw1R1yAPm++YDvtiKZIp3tJY3jzWXHjJpo+qYZ0Jjs7MRuQkg1579LkPdkO2SbQIW6hnPsNyVWwy9Q96Gg0ucwdpXHoUNFTMmCKJQXW2jblVe+aseWhb0O4GoTlFkYeIcMPp4KnnO9ZosK6yOyPfhlojLIymIjXOd41vD6iGG7HeyvJDyBnycYWIyWs2FfRC28spXUd1/s/N9Wff7M7KSYfsbbcwIW+v4Vi6qXkZ89ybMpf0wcnnM1/Een4akEHL6rhoLjCf7VAIfrVpkhaxIqW/bu1XTRyvbRclITfFTZcQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0awF0R7RIzaXL6c9eFwOMrEm05x7KMT44HLnjJXYLmo=;
 b=syWgkNYWDgTxUJksjhg71r4BrBJ/RLPcDwimhRqj0WrKUuOLLhd59ay70+vJp8LtCtawYdsAb9bgTp1vb2DrhYT9UeC+VaPRDTgrIKYQvUVag+1lvBa40qp86i++ezPQFK4HjpvjWC5QmGWNsaiErZFetqhI5+8ft/B3Dtrdl7E=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5400.eurprd08.prod.outlook.com (2603:10a6:20b:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 11:59:39 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 11:59:39 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH 1/4] arm-autonomy/xenguest-tools: add multiple disk devices support
Date: Thu,  3 Dec 2020 11:59:21 +0000
Message-Id: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::13) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 11:59:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8cb5fe4-c906-4efa-4195-08d8978300a1
X-MS-TrafficTypeDiagnostic: AM7PR08MB5400:|AS8PR08MB6261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB6261A81DB8FBC56F2BE5BE7592F20@AS8PR08MB6261.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dKEjoAdQp0AAWV9bF8PpheMdEKonw3dchceabXhepMf+3nZYtGMPaN7cnSPwMvAAEK0nRMFzKjGUJNwh+sanpW7NFCJGLcNSY5+Bi08Dx8IO7K7BvPIkDbvvJUopL7NXR7PY2T2WOrXnL+BB9nhQigxd6ien048xsAv/jTslPHpafcFsok1QE0ByrX6KKZDr3FsZI1/qekeaZ1ies5wIFSD6TR5zrQSuCf2n8WrsiSwnSySfg/303jA0Xy0n1CKV+GZtFm4ZANR6i/IYScdB4rxBcmM0uG5HMxfGs9Hozkz24N1VIC3wKLDSnrveviUnprEGLDoaxR/MRL2wqQsPfw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(2616005)(6916009)(4326008)(2906002)(8936002)(36756003)(5660300002)(7696005)(6486002)(52116002)(478600001)(66946007)(66556008)(66476007)(83380400001)(86362001)(8676002)(6666004)(316002)(956004)(44832011)(26005)(30864003)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?FTtip08DfBgtOlK3PRK2BSw8zhnsTzdvq5HoHUf0fzqt20E0W3NhFASHrskc?=
 =?us-ascii?Q?LVu6PgWgyJ5ANOGysWkWs7E0Tuzb4q3FQPM979k4Xd0bdsuUe/f1/1hZb5u8?=
 =?us-ascii?Q?Py0cbx2R/4UWZj1XPJuWqK7KyZKVw4gsm/IYifQggw3j583min6qe6+8vlPf?=
 =?us-ascii?Q?Pjka/rTl2gY5pMIXC4XTpeBUTZ4QmmS8ee3ONUCGY1FA600iMy6BjVCTvFFb?=
 =?us-ascii?Q?FpUHyL2AV0eSgPPrO3l1YNQXeOas76u8xgcvnEkjwLpSv2Aqs4PR3DtDa5+n?=
 =?us-ascii?Q?KFrQEF8PmZXnFcBZCO7H9xHmeXtIGdk8lfBgT51bYlaq5o1RIfDqVVrpKh91?=
 =?us-ascii?Q?FWmqf/nsPL6Ai0VekOLuEDmkrjAizQHo5ct6WL9Vji5JrKaT5Si5wbfOX9RP?=
 =?us-ascii?Q?86uIR8LMhX7gwmRPad6N+OrybMkrf3M7oNK769PfP/GaGRffZI/QlnAfWQCw?=
 =?us-ascii?Q?TsOVyawugCnz6njrHTIo6zt8eZp36PBNFHeq5KtPLng0anyqnH0FJ7rBj8fv?=
 =?us-ascii?Q?7sieEmrmFYnlHdQyC2eTZuYiBWLgs1llezubIEkN9/dIVnHQyV92fbgjUZJ5?=
 =?us-ascii?Q?/QS+gD/p+6FtGDNwAISHpWK50xXxiuk20eG0IpmggDjy9O2Uz9NaqSgEUIDJ?=
 =?us-ascii?Q?hcOgd/D21E8AWccAC8gU+HD5j1H2L1Eg4aigO+M3XBOvm9jopo5VWWBZ+Bry?=
 =?us-ascii?Q?NhMK1QAJgqS3AAfiEQ1jJ34bdrH9IAD2u3KBCCUnjPjFQEhjlYgzL/YpneEQ?=
 =?us-ascii?Q?9cjhCZTjZ59Lq1tubZywuCRQUF3Ifesuibv7vj1fHjAt1hmbvS9RSEbn0k/u?=
 =?us-ascii?Q?+KuvqAN2LKUIM/8jyxcc9kIKadKXT8muTSZHIr22Vbsk2TOyVXGItbgIkybs?=
 =?us-ascii?Q?/yqiEfMNGYx6LAGXmOfBuYXtyp5VDOwNeDj2lqhiCLSgl8Y+gXaxMt6HK60G?=
 =?us-ascii?Q?ha6viile6tp/Qlt1Psh8FHqRY+RklHeOVYKgU168obOnDKiOG2ERy3y5I7ze?=
 =?us-ascii?Q?+YR1?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	79387caa-92d2-44f6-b65e-08d89782e949
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l3E/HoTdUwTNMOHw9SvGAkrIFBq2AgEDQomvljoOvxsFBrlStSUMfLBCCvyoMKX3+b/nNmWeHwgoKxO17q/r6bA7g39aM4PIsDqBNkZ98SVAXaC8uZEUPv2q2ca4YP87wuVIxufswQF03c4yu9bm35u2MA9seGxOWRejXBa7cPq2NH18aWLj3B+6aD018Kr0JXwniihRRxRGjr1tSfuG55lUQgSTUBLXteGZWm7LiTl683seM1t0SShvCtKp4PKlhCHZHkUf6n/OmC3mM+pt5soXWlbX+I5TxW8f2r2TKa/Ei5ESmASaHF3Tzd3YHH4LpsiiOsQwgtDC6D9EgcLFTWEgFMi++52HaQfiRDpbPcmk403zXdmFCePU5AK31w0BEMAbEaGQvTMvycaphyxrLA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(7696005)(36906005)(316002)(8936002)(6486002)(478600001)(47076004)(36756003)(2906002)(82740400003)(81166007)(356005)(86362001)(8676002)(44832011)(956004)(336012)(82310400003)(4326008)(2616005)(70586007)(83380400001)(30864003)(26005)(5660300002)(70206006)(6916009)(16526019)(6666004)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:00:17.9293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cb5fe4-c906-4efa-4195-08d8978300a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6261
Content-Type: text/plain

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

With this patch user can set DISK_DEVICE for guest image.
If guest disk configuration contains DISK_DEVICE setting,
xenguest-manager uses that disk for this guest, insted of default one,
that is set with XENGUEST_VOLUME_DEVICE in xenguest-manager.conf file.
DISK_DEVICE is not set by deafult.

Change-Id: If400850f60097d38339e76a3d18fc0e2b927f3a0
Issue-Id: SCM-1513
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../classes/xenguest-image.bbclass            |   8 ++
 .../documentation/xenguest-mkimage.md         |   5 +
 .../xenguest/files/xenguest-manager           | 104 +++++++++++-------
 .../xenguest/xenguest-manager.bb              |   2 +-
 4 files changed, 79 insertions(+), 40 deletions(-)

diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
index 8c6b141..5e5c4c7 100644
--- a/meta-arm-autonomy/classes/xenguest-image.bbclass
+++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
@@ -43,6 +43,9 @@ XENGUEST_IMAGE_KERNEL ??= "Image"
 # be included in the xenguest image)
 XENGUEST_IMAGE_DISK_SIZE ??= "${@ '4' if not d.getVar('INITRAMFS_IMAGE') else '0'}"
 
+# set empty partition to be used by xenguest-manager for this image
+XENGUEST_IMAGE_DISK_DEVICE ??= ""
+
 #
 # XENGUEST_IMAGE_DISK_PARTITIONS is used to describe the partitions to setup
 # and their content.
@@ -142,6 +145,11 @@ xenguest_image_create() {
                     call_xenguest_mkimage update --disk-add-part=$arg
                 done
             fi
+            diskdevice="${XENGUEST_IMAGE_DISK_DEVICE}"
+            if [ -n "$diskdevice" ]; then
+                call_xenguest_mkimage update --disk-device="${diskdevice}"
+            fi
+
             ;;
     esac
 
diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
index d7baa2e..fd142b7 100644
--- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
+++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
@@ -66,6 +66,11 @@ The file contains the following entries:
   and extract CONTENT as initial partition content (.tar[.gz|.xz|.bz2] file
   or img[.gz|.bz2] file to be dumped in the partition).
   FS and CONTENT can be empty.
+- `DISK_DEVICE=X`: disk or partition to be used by lvm. Setting this option
+  allows to bind guest disk with any partition or disk available on host,
+  e.g. /dev/sda3 or /dev/sdb.
+  This variable is not set by default, but if set, it overrides disk settings
+  inside xenguest-manager.conf - 'XENGUEST_VOLUME_DEVICE'.
 
 The disk-files contain files to be used for initializing the disk partitions
 content. Those should be used to create a LVM or a physical disk and initialize
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index cc55b26..fafe4a0 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -116,51 +116,56 @@ function xenguest_volume_init()
     # Return:
     # 0 - success
     # 1 - failure
-
-    check_private
-
-    if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
-        ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
-        echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
-        return 1
+    local diskdevice
+    local volumename
+
+    if [ -z "${DISK_DEVICE}" ]; then
+        # By default guest is using disk defined inside xenguest-manager.conf
+        diskdevice="${XENGUEST_VOLUME_DEVICE}"
+        volumename="${XENGUEST_VOLUME_NAME}"
+    else
+        # If guest configuration contains custom disk setting,
+        # overwrite default one
+        diskdevice="${DISK_DEVICE}"
+        volumename="vg-xen-$(basename ${diskdevice})"
     fi
 
-    if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
-        echo "${PREF} No volume name in configuration, using vg-xen..."
-        XENGUEST_VOLUME_NAME="vg-xen"
+    if [ -z "${diskdevice}" -o ! -b "${diskdevice}" ]; then
+        echo "${PREF} Invalid volume device in configuration: ${diskdevice}"
+        return 1
     fi
 
-    pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
+    pvs "${diskdevice}" > /dev/null 2>&1
     if [ $? -ne 0 ]; then
         # Check if there is no filesystem in the block device
-        echo "lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
-        filesystem=$(lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE} 2>> ${LOGFILE})
+        echo "lsblk -n -o FSTYPE ${diskdevice}" >> ${LOGFILE} 2>&1
+        filesystem=$(lsblk -n -o FSTYPE "${diskdevice}" 2>> ${LOGFILE})
         if [[ $? -eq 0 && -z "$filesystem" ]]; then
-            echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
-            echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
-            pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
+            echo "${PREF} Initialize lvm on ${diskdevice}"
+            echo "pvcreate -f ${diskdevice}" >> ${LOGFILE} 2>&1
+            pvcreate -f "${diskdevice}" >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
                 echo "${PREF} Error: initialing lvm on " \
-                     "${XENGUEST_VOLUME_DEVICE} failed." | tee -a ${LOGFILE}
+                     "${diskdevice} failed." | tee -a ${LOGFILE}
                 return 1
             fi
         else
             [ -z "$filesystem" ] || \
-                echo "${PREF} Error: The ${XENGUEST_VOLUME_DEVICE} is already " \
+                echo "${PREF} Error: The ${diskdevice} is already " \
                      "formatted as $filesystem." | tee -a ${LOGFILE}
             return 1
         fi
     fi
 
-    vgs ${XENGUEST_VOLUME_NAME} > /dev/null 2>&1
+    vgs "${volumename}" > /dev/null 2>&1
     if [ $? -ne 0 ]; then
-        echo "${PREF} Create ${XENGUEST_VOLUME_NAME} volume"
-        echo "vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE}" \
+        echo "${PREF} Create ${volumename} volume"
+        echo "vgcreate ${volumename} ${diskdevice}" \
             >> ${LOGFILE} 2>&1
-        vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE} \
+        vgcreate "${volumename}" "${diskdevice}" \
             >> ${LOGFILE} 2>&1
         if [ $? -ne 0 ]; then
-            echo "${PREF} Error: creating ${XENGUEST_VOLUME_NAME} volume " \
+            echo "${PREF} Error: creating ${volumename} volume " \
                  "failed."  | tee -a ${LOGFILE}
             return 1
         fi
@@ -201,9 +206,19 @@ function xenguest_disk_init()
 
     guestname="$1"
     guestfile="$2"
-    devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
 
     source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
+    if [ -z "${DISK_DEVICE}" ]; then
+        # By default guest is using disk defined inside xenguest-manager.conf
+        diskdevice="${XENGUEST_VOLUME_DEVICE}"
+        volumename="${XENGUEST_VOLUME_NAME}"
+    else
+        # If guest configuration contains custom disk setting,
+        # overwrite default one
+        diskdevice="${DISK_DEVICE}"
+        volumename="vg-xen-$(basename ${diskdevice})"
+    fi
+    devname="/dev/${volumename}/${guestname}"
 
     DISK_SIZE=$(check_size "${DISK_SIZE}")
     if [ -z "${DISK_SIZE}" ] || [ "${DISK_SIZE}" = "0M" ]; then
@@ -224,11 +239,11 @@ function xenguest_disk_init()
 
 
     # Remove volume if it already exist
-    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE} 2>&1
-    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
+    echo "lvs ${volumename}/${guestname}"  >> ${LOGFILE} 2>&1
+    lvs "${volumename}/${guestname}" >> ${LOGFILE} 2>&1
     if [ $? -eq 0 ]; then
         echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
-        lvremove -y ${devname} >> ${LOGFILE} 2>&1
+        lvremove -y "${devname}" >> ${LOGFILE} 2>&1
         if [ $? -ne 0 ]; then
             echo "${PREF} Error removing volume ${guestname}"
             return 1
@@ -236,9 +251,9 @@ function xenguest_disk_init()
     fi
 
     # Create volume
-    echo "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${XENGUEST_VOLUME_NAME}" \
+    echo "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${volumename}" \
         >> ${LOGFILE} 2>&1
-    lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${XENGUEST_VOLUME_NAME} \
+    lvcreate -y -L "${DISK_SIZE}" -n "${guestname}" "${volumename}" \
         >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error creating volume ${guestname}"
@@ -247,7 +262,7 @@ function xenguest_disk_init()
 
     # Add partition table
     echo "parted -s ${devname} mklabel msdos" >> ${LOGFILE} 2>&1
-    parted -s ${devname} mklabel msdos >> ${LOGFILE} 2>&1
+    parted -s "${devname}" mklabel msdos >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error creating partition table on ${guestname}"
         return 1
@@ -256,8 +271,8 @@ function xenguest_disk_init()
     # Setup disk name in xen configuration
     echo "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}" \
         "--xen-disk=${devname}" >> ${LOGFILE} 2>&1
-    xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname} \
-        --xen-disk=${devname} >> ${LOGFILE} 2>&1
+    xenguest-mkimage update "${XENGUEST_CONF_BASE}/guests/${guestname}" \
+        "--xen-disk=${devname}" >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error setting disk in xen configuration"
         return 1
@@ -311,8 +326,8 @@ function xenguest_disk_init()
             # Create partition
             echo "parted -s ${devname} unit MB mkpart primary ${partstart}" \
                 "${partend}" >> ${LOGFILE} 2>&1
-            parted -s ${devname} unit MB mkpart primary ${partstart} \
-                ${partend} >> ${LOGFILE} 2>&1
+            parted -s "${devname}" unit MB mkpart primary "${partstart}" \
+                "${partend}" >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
                 echo "${PREF} Error adding partition ${part}"
                 return 1
@@ -346,7 +361,7 @@ function xenguest_disk_init()
 
             # Attach disk to xen
             echo "xl block-attach 0 phy:${devname} xvda w" >> ${LOGFILE} 2>&1
-            xl block-attach 0 phy:${devname} xvda w >> ${LOGFILE} 2>&1
+            xl block-attach 0 "phy:${devname}" xvda w >> ${LOGFILE} 2>&1
             if [ $? -ne 0 ]; then
                 echo "${PREF} Error attaching partition ${part}"
                 return 1
@@ -528,16 +543,27 @@ function xenguest_guest_remove()
     check_private
 
     guestname="$1"
-    devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
+    source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
+    if [ -z "${DISK_DEVICE}" ]; then
+        # By default guest is using disk defined inside xenguest-manager.conf
+        diskdevice="${XENGUEST_VOLUME_DEVICE}"
+        volumename="${XENGUEST_VOLUME_NAME}"
+    else
+        # If guest configuration contains custom disk setting,
+        # overwrite default one
+        diskdevice="${DISK_DEVICE}"
+        volumename="vg-xen-$(basename ${diskdevice})"
+    fi
+    devname="/dev/${volumename}/${guestname}"
 
     # check if guest had a volume
-    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE} 2>&1
-    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
+    echo "lvs ${volumename}/${guestname}"  >> ${LOGFILE} 2>&1
+    lvs ${volumename}/${guestname} >> ${LOGFILE} 2>&1
     if [ $? -eq 0 ]; then
         # Remove guest volume
         echo "${PREF} Removing ${guestname} volume. This might take a while..."
         echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
-        lvremove -y ${devname} >> ${LOGFILE} 2>&1
+        lvremove -y "${devname}" >> ${LOGFILE} 2>&1
         if [ $? -ne 0 ]; then
             echo "${PREF} Error removing volume ${guestname}"
             exit 1
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index 9c29bde..c55d879 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}"
 # Please refer to documentation/xenguest-manager.md for documentation on those
 # parameters
 XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda2"
-XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen"
+XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen-$(basename ${XENGUEST_MANAGER_VOLUME_DEVICE})"
 XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
 
 # We add an init script to create and start guests automatically
-- 
2.17.1

