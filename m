Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.84])
 by mx.groups.io with SMTP id smtpd.web10.10258.1602676523103214700
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 04:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=C8fljW74;
 spf=pass (domain: arm.com, ip: 40.107.6.84, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyKONXCjYLjxWPTd2CVCoVWUVKUEJdQxw0fyhvm4bac=;
 b=C8fljW74CH06iuLsrdw7yMItqcFAXz+XkdTSAilmV+Q3YxQvvvKNgzz3Kd61Z5smA+p+5T9duUK+b91saYpufwBh5pddHY9cIThkvX5xkU74ADeAM7q5TYhY+bsXy1MXQclg3zYDltTfWFa2Nqwuy0Eb5C7g21tE8mtV0pC/6Zw=
Received: from AM7PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:20b:110::40)
 by AM0PR08MB4611.eurprd08.prod.outlook.com (2603:10a6:208:10c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Wed, 14 Oct
 2020 11:55:20 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::35) by AM7PR04CA0030.outlook.office365.com
 (2603:10a6:20b:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Wed, 14 Oct 2020 11:55:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:55:20 +0000
Received: ("Tessian outbound d5e343850048:v64"); Wed, 14 Oct 2020 11:55:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29a539f989a112c0
X-CR-MTA-TID: 64aa7808
Received: from b554e0fc0d49.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C28444AA-AB7D-4CFA-8FFE-8C53244D5662.1;
	Wed, 14 Oct 2020 11:55:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b554e0fc0d49.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Oct 2020 11:55:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRkZ/QFk22QWcbLG/RqnDAmADyLDIz5USg8LQARV6PQJHnKXAJIZpa90ZwI6L7E3523h8F/Z1bFNJcHq5dPhxwWrQSif6B00eEUfJk9ftXLAZ1Il7PLiv+UBYXj9nlUfIfoPryTFqEt0kjbzuLg/R5MSlewIz5MFm+aKE2yr6vhsS+y+0tXM6Zm/bHfwiG6QgpNtvQR2/RhgjulDv4HBNPeQS8t6LVj5RiwTPgb5xHfCCT1o6yJltYbKHzs0rJeaJDilZTzizPatJ4O4l6IUqfzZfrSUb+xjQcMweyd8k0QcJniE0Uqaep9aV2L2FYOH2reDPxSknSrjfNX5q5C9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyKONXCjYLjxWPTd2CVCoVWUVKUEJdQxw0fyhvm4bac=;
 b=WY5hm73ZQJldL/3Cb+X5CjV+RcE2EtFMfblUP1apmzis2v5Jk/TXfU8vsI3cXToAFjYS9YpBJBEdmbPBv4igYjNIwPxaRWVKZqhVUIB5zMLT2hyNlDVRICOCF/EDzSvFQN1RKZywdrAadm8J3QIajNv6otlJ1CyfDqJmeVVgdJQSJ11z9fSJs/4t3aCc2ePq5bIapjRvkeCmKOLG9hk5ZhbjxcCly5BQ2ZIUxfJffzGSFzlVx2m6WlEwRDFequjGDmz1eIT2sUehVwdCS5g7Z/vqH81cm8KomWsPY2OKEV2LfrZbmL8S5ResWQJJ+ueHs5BW4pFkzLmUC5cd9FhGGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyKONXCjYLjxWPTd2CVCoVWUVKUEJdQxw0fyhvm4bac=;
 b=C8fljW74CH06iuLsrdw7yMItqcFAXz+XkdTSAilmV+Q3YxQvvvKNgzz3Kd61Z5smA+p+5T9duUK+b91saYpufwBh5pddHY9cIThkvX5xkU74ADeAM7q5TYhY+bsXy1MXQclg3zYDltTfWFa2Nqwuy0Eb5C7g21tE8mtV0pC/6Zw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DB6PR0801MB1831.eurprd08.prod.outlook.com (2603:10a6:4:38::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Wed, 14 Oct
 2020 11:55:00 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::a1a0:2e27:6240:e4bd%3]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 11:55:00 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-mkimage: add extra ramdisk support
Date: Wed, 14 Oct 2020 13:54:26 +0200
Message-Id: <20201014115426.2608-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: SN1PR12CA0080.namprd12.prod.outlook.com
 (2603:10b6:802:21::15) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by SN1PR12CA0080.namprd12.prod.outlook.com (2603:10b6:802:21::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Wed, 14 Oct 2020 11:54:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6dc286be-f4f7-402c-0c55-08d87038066e
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1831:|AM0PR08MB4611:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4611D3488AE2D96842196CCFFD050@AM0PR08MB4611.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +D6II7ckM6U8+0bM09HI9sG9vsW//iED0JZG6ZLAN2N2UZ/++3jjqnf5XdcJnjEg1Lo2KvklW5qgeUEYb9Y9IBy2rvvfyRbQsHOd6yvZy0YxqOxYzwphJ3mfe28ycNsL2gO6UPd7nhuYQM19fraA8Lgu5FC8T3Z3TqLDEocimCVlbA4s2kt8EATgXAYpDk7HmY37dDCOj1yxYXYK8IFK4J3hNpQM4yY3GbFCdwMUvSfWTL0juL3HSrB+aYFfCq+dwXmrrlry2J6HZhHYFVj9qAr6iZYyGBLBhKW4U5Llb7+VWncL+UcoQYKRil1umG+yi+QWloFNSV6492Wkx7axpg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(4326008)(52116002)(7696005)(44832011)(66476007)(66556008)(66946007)(8936002)(36756003)(6916009)(2906002)(5660300002)(956004)(8676002)(16526019)(26005)(2616005)(316002)(86362001)(186003)(478600001)(6666004)(83380400001)(6486002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 IhDBhWlSURm8otq3nMKbxPEER1Sg732VKYITzc2RbVBi9yYLgn5RQ5d2nOKi/WyoV4IPdbwVsEc1VuNaK+DgEo4xz1MBzRZlNbV0KTG8ZuRyZroH66ROXXDVpZ9ciq/P5NFJosF/JIC315XnB46Y8EEYsYjQed6S+HIAcb3U3T2CGYpf5Sfa3/a+F6yUb+pay1NnMq1WlrgbYHw66IraLkiJA0NrbtV20ZSepkLMb3rzfZ3MirB7vw2S9jgRRgIiPYyB9QLjbFiWgWjiSBj/LDDjJPsZvRl8vNTeax6l1s5YKac2CkZSTUVSoqkVoKbKEC5sHztlu68pHnAWt1iPxCaVFcQi54+vwX7ANHD3BZr8QAzz8PL9/M40y3AApiGVc8LYDnwy+1SMKsLpTIsXGP4DP1c9TNLzSkwqbsmD7Rrbrj1wzTWFkVBNAKHvnqFqJ9Wei4i/rte3naGoQhKq1gWGKpUuGRiKu1s38IowjAgT/FB5B+YJU9pjjsKNA49VBvtSyVU9Oh7oD7SzZ9/rH9Z6DD4niBAz4UOS0Auod+p9JRKwOs4wY/4L9lpB4ajMN89oYE/pDywckfiMtan7xexs7/bEVrpWHmBFVzbW6DbqvlEt3y5e1kKz0JiDL0ZGfAqnaF6TJraVMeR2yd2hFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1831
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3431f211-2d2a-4d74-bf72-08d87037fa6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MeWhcLQ7ucebvFqve1/0VULtEalWJV11iDiUDSc2GrpqGx0uUc7jDBquWppx05uHwg64rtlQIEMOVyMeIPyDYIojjTzI2ZVDuonks69lTWuYoNzJqlIEeBKpMdo5+Hzpj34tDufKH5ehYNqzpB9qxG2LKRWGzYHTXFxL4Zhrxw0KW0/gnLvhm3XUqD+VTrk/H/Z89EnBEJDOOr+7vY0G0SMYJBE/FiKPgTjfzrZx/ftpTDV4jtCF0t52+FPpoZRISNvy/Ma5cSYp2Sv5HG/fpVHv5AlPd0bhHv8Ic2Ma/v3BYHp2C10jQ/q0AiNquV5d2058pnoZJVfPN+OA71elHwA8ZyEmvXqTPCDN1nnbfe82jsmXI6AutOrdQ5DQzkJZ6cq2puZyXGRpQ+F4YsKl1Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(7696005)(8936002)(44832011)(70206006)(316002)(26005)(82740400003)(70586007)(956004)(2616005)(478600001)(336012)(2906002)(83380400001)(47076004)(86362001)(8676002)(81166007)(36756003)(6666004)(5660300002)(82310400003)(6916009)(356005)(1076003)(16526019)(186003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 11:55:20.0150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc286be-f4f7-402c-0c55-08d87038066e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4611
Content-Type: text/plain

Some guest images requires a ramdisk, that is built with a custom recipe.
This patch adds an option '--xen-ramdisk',
for xenguest-mkimage script to cover that.
Extra ramdisk support is also added to xenguest-image-extra bbclass,
via 'XENGUEST_EXTRA_RAMDISK' variable.

Issue-Id: SCM-1276
Change-Id: I8ec74a37c0c96ca83a3489911186f3b3262f80fd
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 .../classes/xenguest-image-extra.bbclass        | 12 ++++++++++++
 .../documentation/xenguest-mkimage.md           |  2 ++
 .../xenguest/files/xenguest-mkimage             | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
index 502a083..533b973 100644
--- a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
+++ b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
@@ -12,6 +12,11 @@ inherit xenguest-image
 # recipes, the last recipe setting it will prevail.
 XENGUEST_EXTRA_DTB ??= ""
 
+# Add a ramdisk file for the guest
+# Only one file should be added, if this is set multiple times or in several
+# recipes, the last recipe setting it will prevail.
+XENGUEST_EXTRA_RAMDISK ??= ""
+
 # Append something to the guest xen configuration
 # All files here will be merged together in the final xen configuration
 # This can contain several files or be used in several recipes
@@ -49,6 +54,13 @@ do_deploy_append() {
         call_xenguest_mkimage partial --xen-device-tree=${XENGUEST_EXTRA_DTB}
     fi
 
+    if [ -n "${XENGUEST_EXTRA_RAMDISK}" ]; then
+        if [ ! -f ${XENGUEST_EXTRA_RAMDISK} ]; then
+            die "xenguest-image: DTB file ${XENGUEST_EXTRA_RAMDISK} does not exist"
+        fi
+        call_xenguest_mkimage partial --xen-ramdisk=${XENGUEST_EXTRA_RAMDISK}
+    fi
+
     if [ -n "${XENGUEST_EXTRA_XENCONFIG}" ]; then
         for f in ${XENGUEST_EXTRA_XENCONFIG}; do
             if [ ! -f $f ]; then
diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
index 3dcc28b..ece17f7 100644
--- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
+++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
@@ -99,6 +99,8 @@ For a detailed help on available operations, please use:
   times to add several command line options.
 - --xen-device-tree=FILE: add dtb FILE as device tree. This both adding the
   file to the image and modifying the xen configuration to use it.
+- --xen-ramdisk=FILE: add ramdisk FILE as guest ramdisk. This both adding the
+  file to the image and modifying the xen configuration to use it.
 - --init-script=FILE: add guest init script. The script is embedded inside the
   image file. Several script can be added and the basename of FILE is used to
   distinguish them (calling the option twice with the same file will update the
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
index 4c1b4a8..a3f987a 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
@@ -82,6 +82,9 @@ Xen configuration for the guest
 --xen-device-tree=      disable device tree parameter in xen configuration
 --xen-device-tree=FILE  set guest device tree in xen configuration and add
                          file to xen files
+--xen-ramdisk=          disable ramdisk parameter in xen configuration
+--xen-ramdisk=FILE      set guest ramdisk in xen configuration and add
+                         file to xen files
 --xen-disk=             disable disk parameter in xen configuration
 --xen-disk=DEV          set guest disk to device DEV (phy:DEV,xvda,w is set)
 --xen-append=FILE       append FILE content to xen configuration
@@ -668,6 +671,20 @@ for arg in "${@}"; do
                 install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/guest.dtb
             fi
             ;;
+        --xen-ramdisk=*)
+            if [ -z "${optarg}" ]; then
+                xen_config_disable_param "ramdisk"
+                rm -f ${IMAGE_TMPDIR}/files/ramdisk.img
+            else
+                if [ ! -f ${optarg} ]; then
+                    echo "Error: invalid ramdisk file ${optarg}"
+                    exit 1
+                fi
+                xen_config_set_string "ramdisk" "files/ramdisk.img"
+                mkdir -p ${IMAGE_TMPDIR}/files
+                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/ramdisk.img
+            fi
+            ;;
         --xen-disk=*)
             if [ -z "${optarg}" ]; then
                 xen_config_disable_param "disk"
-- 
2.17.1

