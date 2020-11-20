Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.59])
 by mx.groups.io with SMTP id smtpd.web09.23967.1605872693086912277
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 03:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zNehE0jf;
 spf=pass (domain: arm.com, ip: 40.107.7.59, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnOdMmZ4ak9xKoxNB075bnieRRN/6zL5YKxyuw01gpM=;
 b=zNehE0jfidXCjO+3RZGCGolQFeh/5PR4NyHSQ6SW0tB6Nfxkvh60wV09HRC5iP75Vmv4WEe4TOc5EOphnRn37cq+TJpWR/HKZdvPtUimfpJV7WgnM8Cgt6N0QNkU/yXxLoLmVqp7fHENPMBV8bq6dUfenIhON0JihN4X+MZTj+w=
Received: from AM6PR0502CA0071.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::48) by DB6PR0802MB2550.eurprd08.prod.outlook.com
 (2603:10a6:4:a1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 11:44:50 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::3d) by AM6PR0502CA0071.outlook.office365.com
 (2603:10a6:20b:56::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 11:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:44:49 +0000
Received: ("Tessian outbound 082214a64d39:v71"); Fri, 20 Nov 2020 11:44:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b915082f8d7aaef5
X-CR-MTA-TID: 64aa7808
Received: from 7e654ddbd88b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6EAA6DD3-A231-43B8-AC9E-D8AAA3A33A4B.1;
	Fri, 20 Nov 2020 11:44:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e654ddbd88b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 20 Nov 2020 11:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN6RWacNHcXw5fm4q6hOEj87EgDv7Ua1bcc9M12KlbH71baaZBgX4Vkd8LWNvmygY9xBmIO8H9egwbtl2UkJj8YzGfAkqFJVpHPFFHsb8nualvcBPV1w/BsERLeCoDjsc+K+wY5K00WT5fTzOZsRfe9fdTPqD4m18M6KuJztsRGmqSnNFIDfruAlC9eZYP2mg7MCGO5ufEXq+IPORUSatwdtiFaFcn6aWnNOZujJ/H9haS7VTS7n9y9RtDggRq9PQ8nfFQiv/1VT34+lS2ilopyo9Aof9NlM4llaFJb2j6eY7wjRBwgXue6gIm7DdhxfPiTwB/HruOy7ha+AKD3QQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnOdMmZ4ak9xKoxNB075bnieRRN/6zL5YKxyuw01gpM=;
 b=MMn6tL/dMz6rJAbS/WLqxPQU6UMQeG5EbfYX/6AfSM/od6wJyZX87Bn5Xf2UdHAMZfM+ifNFdVn6O0n0uhA6GmJAuDcYvgDPRlAfOEU5OxqiMyAPWRYi+GW8YjB8P2GWiJTyhRB09w6havxxpNToQsqWoYyunzmYNFOSrqECxhYkV/YGjIhwA2WgM2NxuZKSq1fE4jofowY9mkFIJApmqsIlQU+o+Ff5dOSKM/oNKswD+hLm8fncmjXr8Fl8cworzglINRcCS3UViJutFlVBMkezHQba/pSMrVmjCd9QS+sCzElgrJVpCkXDZge8nHdSzukrvKx/GsD9EYp8+ibRMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnOdMmZ4ak9xKoxNB075bnieRRN/6zL5YKxyuw01gpM=;
 b=zNehE0jfidXCjO+3RZGCGolQFeh/5PR4NyHSQ6SW0tB6Nfxkvh60wV09HRC5iP75Vmv4WEe4TOc5EOphnRn37cq+TJpWR/HKZdvPtUimfpJV7WgnM8Cgt6N0QNkU/yXxLoLmVqp7fHENPMBV8bq6dUfenIhON0JihN4X+MZTj+w=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB8PR08MB5018.eurprd08.prod.outlook.com (2603:10a6:10:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 11:44:42 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::7481:42d7:df72:b159%3]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:44:42 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/5] arm-autonomy/xenguest-tools: set guest disk and partition sizes in MB or GB
Date: Fri, 20 Nov 2020 12:44:01 +0100
Message-Id: <20201120114404.730-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201120114404.730-1-kamil.dziezyk@arm.com>
References: <20201120114404.730-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:44:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7cf737c6-d4b6-4b90-082d-08d88d49afc9
X-MS-TrafficTypeDiagnostic: DB8PR08MB5018:|DB6PR0802MB2550:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB25502D100214982A9DD51A52FDFF0@DB6PR0802MB2550.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BCNnj0h3DQQgGP2Vx6StBXsMqH2L4i2QOvN6KLeo9wtPFzeoMzWc0EDWf9AkqHS3CfPrtRuqg39DO0dWe4t/1oY4U8BGkqVYh/oKB39soCxR8vqTIz69szy1ilPvV6lQeTiwJF7W1tbZWDZogA8Oh/febqE0/1E7AS83+j2LLysWUHhdnb+WwjIK0t8YTFgE51cLj+9CC3RvlvMwCLf8Yah93pwTDoZGk0RdE6+bS5M+5GfaOKjaTCv3LocrjNkNEaEVSiQ41YzNBVvN4R7ZWhhTaQh2zh0OTG6pGwia8diWo6tDczJwg4a8Ltiop3MMr1OyU2FtXeq8mXkZ2Oc1Rg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(316002)(6486002)(44832011)(6916009)(83380400001)(2906002)(478600001)(186003)(956004)(26005)(16526019)(8936002)(2616005)(7696005)(5660300002)(52116002)(1076003)(66556008)(8676002)(66476007)(66946007)(86362001)(4326008)(36756003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 5R0v//LnwAmmbKpDT9UpeDuTcdPj1TQTeVxbu3JkpAx90poo4ia8m+UElYqDwj42ArzfCGxBi6FtZq7Er8EutKGedMp4yuM+x6xnOc4x167Iqd7RKdAKGWCNcI2HftZBYRPWRaFcGB2jpYG6l+N5slZEcgqRrz7NpPRj+f6TNUaCls/6mXuOVNWw4E3O9jtbNdVfUuB7lI+2HVRR3qkQksMGEBAVYURYbqVBbFiviolllGQsOLhs+wr76zUdxnkhVXWAfLtmA2qKUO+jbYZ1/cu7rrsphzrxamLSwh3hrPXsNw2Xx3o6pA+tvkSUGDF0b9k/O/adhLA3PxfSZbyilVbigtMT3Rz1jiHqCb62VpHtcVhafaIQeF0osebyUqwfeNPCrNoaDZa06Snsro7YxzBC6/pFscQ2xYDg2TXWYuUn6U1PgAqYW2BSR70Q8O2FyZ/YZ6/DoNM4GTYAMACBgLuJXJ0gLBMBzXf6IT83POilrqhye5Q/N1lLvst4GxZUVc5FzxKmbzBV6CqJZQ+FRFNhLOavQpx7O5gWNir3Y3Z9XWksqAfLTlGcuZYN4AM3TOU59uQb2qmgv8Tp+ejZSYEb5vFxrV0zyLicYSODZVgzZurggLlZKcx/JD4R0aSF4HJ/Nzqx9KCM12Cfa23f1P8BrE6sFPmemoT14wuveILHxgfDKiylOoi+ajvjB0TcHtoRgnKGD1HUvI0QsYKsSlC8vGMYDYx3jjIsm87kL/7r+SMCvGmpMezlOOoJ3fEveh4KrBOncQjpBGk1lhw1nlPe+y6KxNeVnPrvr4tDrKJsqKf+Jr40LzDnAEZEQVupalXRVwJBvfraEJ4MKOgGHuyN7aFTRIDeGCNsBoeMeWoMP3zt460AS+7ZNfFUPI4BgoxswSXxY/fcYLn2G3FdPQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5018
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	04ea69a1-2fa7-4e49-b72b-08d88d49ab75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nCh/U0e0jb+XLifjLgrJPmLvFOps3HaldBAdQOFMsBusnvmuOkoVc6hSJxEFevcHx3DfgJdSPrv6FDBwHTXggxmkQHdCN6lhgd4QcgT0IaYql7U3qzwPWC4b7CNY/W3dGrspOhK69sdKCfNIvi0NnSQdsKaNt7C5K6Qcqm10CK22i2BdWmb9KjeXTn0pt+xhLQGhwygUcvyZ4G2nwJsWvEddFPRfyO8iUzc42auS0iekqD3fc8j8RUI1MuQGYvPSJD1AnSuqSCzj+X0K5Zb2bcs1J+ftbHHM9NzH6S+ukSXCRymsBYx2LJaDxnrB61g/uUWhphK4E25t/nQDR9ZvPUtoamhGbD9vIhDq43LWolT/VWe7P5XepjA45xwuClRvUXl9WY6rUMSMZKuaD65Y1g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(46966005)(8936002)(6666004)(6486002)(2616005)(70206006)(82310400003)(70586007)(8676002)(956004)(2906002)(336012)(5660300002)(47076004)(44832011)(1076003)(16526019)(356005)(86362001)(82740400003)(186003)(316002)(26005)(478600001)(36756003)(7696005)(6916009)(81166007)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:44:49.2562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf737c6-d4b6-4b90-082d-08d88d49afc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2550
Content-Type: text/plain

This patch brings following improvements:
 * Allow user to set guest disk and partition sizes in MB or GB.
 * Documentation update about this improvement.

Change-Id: I0a1a2945022efcd9d32bb39404b4a85721e28e19
Issue-Id: SCM-1515
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../classes/xenguest-image.bbclass            | 39 ++++++-------
 .../documentation/xenguest-mkimage.md         | 18 +++---
 .../xenguest/files/xenguest-manager           | 56 +++++++++++++++++--
 .../xenguest/files/xenguest-mkimage           | 48 +++++++++++++++-
 4 files changed, 126 insertions(+), 35 deletions(-)

diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
index 93f6578..8c6b141 100644
--- a/meta-arm-autonomy/classes/xenguest-image.bbclass
+++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
@@ -44,13 +44,13 @@ XENGUEST_IMAGE_KERNEL ??= "Image"
 XENGUEST_IMAGE_DISK_SIZE ??= "${@ '4' if not d.getVar('INITRAMFS_IMAGE') else '0'}"
 
 #
-# XENGUEST_IMAGE_DISK PARTITIONS is used to describe the partitions to setup
+# XENGUEST_IMAGE_DISK_PARTITIONS is used to describe the partitions to setup
 # and their content.
 # It must be set to a space separated list of entries with each entry having
-# the format num:sz:fs:[file] where:
+# the format num:sz:[fs]:[file] where:
 # - num is a partition number
-# - sz is the partition size in Gigabit
-# - fs is the filesystem to use for the partition
+# - sz is the partition size in MB or GB(default), e.g 1000M or 1[G]
+# - fs is optional filesystem to use for the partition
 # - file is optionally pointing to a file to use as content of the partition
 #   Please check image_types_xenguest.bbclass for rootfs handling of files
 #
@@ -129,21 +129,22 @@ xenguest_image_create() {
 
     # create disk if needed
     disksize="${XENGUEST_IMAGE_DISK_SIZE}"
-    if [ -z "$disksize" ]; then
-        disksize="0"
-    fi
-    if [ $disksize -gt 0 ]; then
-        # setup disk size
-        call_xenguest_mkimage update --disk-reset-config --disk-size=$disksize
-
-        diskparts="${XENGUEST_IMAGE_DISK_PARTITIONS}"
-        if [ -n "$diskparts" ]; then
-            for arg in $diskparts; do
-                call_xenguest_mkimage update --disk-add-part=$arg
-                partnum="$(expr $partnum + 1)"
-            done
-        fi
-    fi
+    case ${disksize:=0} in
+        0|0M|0G)
+            ;;
+        *)
+            # setup disk size
+            call_xenguest_mkimage update --disk-reset-config --disk-size=$disksize
+
+            diskparts="${XENGUEST_IMAGE_DISK_PARTITIONS}"
+            if [ -n "$diskparts" ]; then
+                for arg in $diskparts; do
+                    call_xenguest_mkimage update --disk-add-part=$arg
+                done
+            fi
+            ;;
+    esac
+
 
     if [ "${XENGUEST_IMAGE_AUTOBOOT}" = "1" ]; then
         call_xenguest_mkimage update --set-param=GUEST_AUTOBOOT=1
diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
index ece17f7..d7baa2e 100644
--- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
+++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
@@ -58,12 +58,14 @@ order.
 ### disk.cfg and disk-files
 disk.cfg contains the guest disk description (disk size and disk partitions).
 The file contains the following entries:
-- `DISK_SIZE=X`: size of the disk to create in GB
+- `DISK_SIZE=X`: size of the disk to create in MB or GB(default),
+   e.g. 1000M or 4[G]
 - `DISK_PARTX=SIZE:FS:CONTENT`: create a partition number X (1 to 4) with a
-  size of SIZE GB, format it with filesystem FS (can be ext2, ext3, ext4, vfat
-  or swap) and extract CONTENT as initial partition content
-  (.tar[.gz|.xz|.bz2] file or img[.gz|.bz2] file to be dumped in the partition). FS and
-  CONTENT can be empty.
+  size of SIZE MB or GB(default), e.g 1000M or 2[G].
+  Format it with filesystem FS (can be ext2, ext3, ext4, vfat or swap)
+  and extract CONTENT as initial partition content (.tar[.gz|.xz|.bz2] file
+  or img[.gz|.bz2] file to be dumped in the partition).
+  FS and CONTENT can be empty.
 
 The disk-files contain files to be used for initializing the disk partitions
 content. Those should be used to create a LVM or a physical disk and initialize
@@ -105,12 +107,12 @@ For a detailed help on available operations, please use:
   image file. Several script can be added and the basename of FILE is used to
   distinguish them (calling the option twice with the same file will update the
   script in the image with the second one).
- --disk-size=SIZE: set the guest disk size to SIZE in GB. Calling this with 0
-  disable the guest disk.
+ --disk-size=SIZE: set the guest disk size to SIZE in MB or GB(default),
+   e.g 1000M or 2[G]. Calling this with 0 disable the guest disk.
 - --disk-add-part=NUM:SIZE:FS:CONTENT: This is adding a partition to the
   xenguest image disk. The partition is described with the arguments:
   - NUM: partition number.
-  - SIZE: partition size in GB.
+  - SIZE: partition size in MB or GB(default), e.g 1000M or 2[G].
   - FS: filesystem to format the partition with. This can be ext2, ext3, ext4,
     vfat of swap. If empty the partition is not formated.
   - CONTENT: tar of img file to use to initialize the partition. The file must
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 4ea3a37..eb7a3ce 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -54,6 +54,47 @@ with ACTION being one of:
 EOF
 }
 
+is_integer() {
+    if ! [[ "${1}" =~ ^[0-9]+$ ]]; then
+        >&2 echo "error: invalid number '${1}'"; exit 1
+    fi
+}
+
+# check size and convert it to MB, e.g '1[G]' => '1000M'
+check_size() {
+    local disksize="${1}"
+
+    [ -n "${disksize}" ] || disksize="invalid"
+
+    # disksize may have appended M or G suffix, let's extract it
+    # ${var:offset:length}, where #var is var length
+    local lastchar="${disksize:${#disksize}-1}"
+    case "${lastchar}" in
+        [0-9])
+            # backwards compatibility
+            is_integer "${disksize}"
+            echo -e "$((${disksize} * 1000))M"
+            return
+            ;;
+        G|M)
+            if [ "${#disksize}" -gt "1" ]; then
+                local size="${disksize::${#disksize}-1}"
+                is_integer "${size}"
+                # convert GB to MB
+                [ "${lastchar}" = "M" ] || size=$((${size} * 1000))
+                echo -e "${size}M"
+                return
+            fi
+            ;;
+        *)
+            ;;
+    esac
+
+    >&2 echo -e "Invalid size format '${1}'" \
+                "\n\tSupported size format is e.g 1000M or 2[G]"
+    exit 1
+}
+
 function xenguest_volume_init()
 {
     # Return:
@@ -142,7 +183,8 @@ function xenguest_disk_init()
 
     source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
 
-    if [ ${DISK_SIZE:-0} -eq 0 ]; then
+    DISK_SIZE=$(check_size "${DISK_SIZE}")
+    if [ -z "${DISK_SIZE}" ] || [ "${DISK_SIZE}" = "0M" ]; then
         echo "${PREF} No disk for ${guestname}"
         return
     fi
@@ -172,9 +214,9 @@ function xenguest_disk_init()
     fi
 
     # Create volume
-    echo "lvcreate -y -L ${DISK_SIZE}G -n ${guestname} ${XENGUEST_VOLUME_NAME}" \
+    echo "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${XENGUEST_VOLUME_NAME}" \
         >> ${LOGFILE} 2>&1
-    lvcreate -y -L ${DISK_SIZE}G -n ${guestname} ${XENGUEST_VOLUME_NAME} \
+    lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${XENGUEST_VOLUME_NAME} \
         >> ${LOGFILE} 2>&1
     if [ $? -ne 0 ]; then
         echo "${PREF} Error creating volume ${guestname}"
@@ -212,9 +254,11 @@ function xenguest_disk_init()
         fstype=$(echo ${partdesc} | sed -e "s/.*:\(.*\):.*/\1/")
         content=$(echo ${partdesc} | sed -e "s/.*:.*:\(.*\)/\1/")
 
-        if [ "${size}" -ne 0 ]; then
-            # Size is expressed in GB, pass it in MB
-            size=$(expr ${size} \* 1024)
+        size=$(check_size "${size}")
+        if [ -n "${size}" ] && [ "${size}" != "0M" ]; then
+            # size has appended M or G suffix, let's extract just the value
+            # ${var:offset:length}, where #var is var length
+            size="${size::${#size}-1}"
             partend=$(expr ${partstart} + ${size})
 
             # Let first MB of disk free for partition table
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
index fb321d6..c133e0e 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
@@ -110,7 +110,8 @@ Init configuration
 
 Disk configuration
 --disk-reset-config     reset disk guest configuration to default (no disk)
---disk-size=SZ          set guest disk size (in GB)
+--disk-size=SZ          set guest disk size in MB or GB(default),
+                         e.g 1000M or 2[G].
 --disk-device=DEV       set device to be used to create the guest disk
                         if unset or set to an empty string, the volume will be
                         create in the default manager volume group.
@@ -370,6 +371,47 @@ disk_config_rm_part() {
     sed -i "/DISK_PART${partid}=.*/d" ${IMAGE_TMPDIR}/disk.cfg
 }
 
+is_integer() {
+    if ! [[ "${1}" =~ ^[0-9]+$ ]]; then
+        >&2 echo "error: invalid number '${1}'"; exit 1
+    fi
+}
+
+# check size and convert it to MB, e.g '1[G]' => '1000M'
+check_size() {
+    local disksize="${1}"
+
+    [ -n "${disksize}" ] || disksize="invalid"
+
+    # disksize may have appended M or G suffix, let's extract it
+    # ${var:offset:length}, where #var is var length
+    local lastchar="${disksize:${#disksize}-1}"
+    case "${lastchar}" in
+        [0-9])
+            # backwards compatibility
+            is_integer "${disksize}"
+            echo -e "$((${disksize} * 1000))M"
+            return
+            ;;
+        G|M)
+            if [ "${#disksize}" -gt "1" ]; then
+                local size="${disksize::${#disksize}-1}"
+                is_integer "${size}"
+                # convert GB to MB
+                [ "${lastchar}" = "M" ] || size=$((${size} * 1000))
+                echo -e "${size}M"
+                return
+            fi
+            ;;
+        *)
+            ;;
+    esac
+
+    >&2 echo -e "Invalid size format '${1}'" \
+                "\n\tSupported size format is e.g 1000M or 2[G]"
+    exit 1
+}
+
 disk_config_add_part() {
     partconf="${1}"
     partid=$(echo ${partconf} | sed -e "s/:.*//")
@@ -742,7 +784,9 @@ for arg in "${@}"; do
             disk_config_reset
             ;;
         --disk-size=*)
-            sed -i "s/DISK_SIZE=.*/DISK_SIZE=\"${optarg}\"/" \
+            size=$(check_size "${optarg}")
+            [ -n "size" ] || exit 1
+            sed -i "s/DISK_SIZE=.*/DISK_SIZE=\"${size}\"/" \
                 ${IMAGE_TMPDIR}/disk.cfg
             ;;
         --disk-device=*)
-- 
2.17.1

