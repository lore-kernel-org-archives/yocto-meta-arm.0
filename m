Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.44])
 by mx.groups.io with SMTP id smtpd.web11.8714.1585306381271970673
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ha19amnD;
 spf=pass (domain: arm.com, ip: 40.107.7.44, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puYNwcdyM2WDPxYhaHxYocD7/uAQVABW8fBY6SuAt5M=;
 b=Ha19amnDq0OpQOJMsz54SOuvqx92JPj1lgPzhSDSGRw53fQrv5Mp9UBn5H2QTgRiMn0r3wJQ7BFPbP8Iz0pjkAJOTpx9OxNygAgYdZyud+UHs1RtLOZSWVK3qg34/E49j9Ov3Ur2gidvib4gE4S9qlmrM8hi28Q0nVBluCt9U5k=
Received: from DB8PR06CA0039.eurprd06.prod.outlook.com (2603:10a6:10:120::13)
 by AM0PR08MB3140.eurprd08.prod.outlook.com (2603:10a6:208:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Fri, 27 Mar
 2020 10:52:58 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::fd) by DB8PR06CA0039.outlook.office365.com
 (2603:10a6:10:120::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:52:58 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:52:58 +0000
Received: ("Tessian outbound e13acb17570e:v48"); Fri, 27 Mar 2020 10:52:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a65fd9ede6d6e2f2
X-CR-MTA-TID: 64aa7808
Received: from fcf364c9fbdc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7B0C20DE-1F87-461A-8D65-6C8920F4405C.1;
	Fri, 27 Mar 2020 10:52:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcf364c9fbdc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:52:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGFf3+RIAq69j1pnAQ/O+GBytOwFdHXcIHG7OsiwBA5WukRtemWYR39n1rl/+3TKilVCSU18bioi3lLKwjsMmcZACy09isR2HPvya9R3LSp723w25HjvaVSkD27JVjU/rsypCOT6wj+Sq5GnFq+PQSeFjqIKktMP4IelBvF26Ne9rdwyjDV3vuNkORFQ3tmdfx2S7z6Ms2RicC99AjcXK9ofsYfBpn17FKZF1UYcWb8tzCFeAiq01wz4UitJfIIioo5tlkuyvzU4TLTx5X60YmVEoCQDcXfqVN+B+eF3bo+e9tENKKqkEKgtPVs27ZaBXAETj9e6EkY5T1pEM9v4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puYNwcdyM2WDPxYhaHxYocD7/uAQVABW8fBY6SuAt5M=;
 b=Bu8Lm3pEZyYRJuMhfN6EE0IEbr48uiJ5gE1pcFI5EERWWGxQjSIMRdByONSZomZdKMPJfV20T9uCLUij5YMgyJjlNKVWivaCnlsevY/6DrERByzbAVnlTrVtEt8zjm8pBhVreTFzxDKSijQd5alaQp2D3E68//V7no8pPy7PgrQmdbsfXaCcBzGTbW3NbYT1l+Lb/ZHWqZGxhjvd73MWqjuMUHRBuK7wZ/XqADY5aCu4n3P+aWpb7XVNaM7mBX3YJj/KU6jM5namvYmRQgzQTPgjIziosOxa7EGW+jC1AJ/HyuWycW170gLC4tisY3HaVCN9rZxUWguMZXuPiQfpHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puYNwcdyM2WDPxYhaHxYocD7/uAQVABW8fBY6SuAt5M=;
 b=Ha19amnDq0OpQOJMsz54SOuvqx92JPj1lgPzhSDSGRw53fQrv5Mp9UBn5H2QTgRiMn0r3wJQ7BFPbP8Iz0pjkAJOTpx9OxNygAgYdZyud+UHs1RtLOZSWVK3qg34/E49j9Ov3Ur2gidvib4gE4S9qlmrM8hi28Q0nVBluCt9U5k=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3276.eurprd08.prod.outlook.com (52.135.128.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:52:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:52:52 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 6/7] arm-autonomy: Create xenguest-image-extra class
Date: Fri, 27 Mar 2020 10:52:22 +0000
Message-Id: <20200327105223.460-7-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105223.460-1-bertrand.marquis@arm.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.54) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:52:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 17a5e3e0-7667-4691-4e17-08d7d23d034b
X-MS-TrafficTypeDiagnostic: DB7PR08MB3276:|AM0PR08MB3140:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB314008E08E2DACE7A87EAFF49DCC0@AM0PR08MB3140.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(2616005)(44832011)(4326008)(956004)(52116002)(86362001)(8936002)(7696005)(8676002)(81166006)(478600001)(66476007)(81156014)(1076003)(316002)(6916009)(36756003)(6666004)(66946007)(66556008)(16526019)(6486002)(186003)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vLvKKo6NtkRo5IdbP1D9Z3mADcFu1JHTNYg1Ros+1jqwmO7TdTbR+duuGhWQ/UDKTzsomLTnC32eB9tUxCDF4QgMyflCsAoT/jkoP8mgpSH4LCsfMtHzG47YBQRlMypPuoHZ+ddAi3pIeA6FS6UpxsZjHq5MJKFaEAs9Wb1U/6Vh93t+PiR6Z1muCNipDmF7TS0iadzfVxJ/D9eV6xLObMmX5sL9ff/misP4jH6/wSQO4VGIrDjygwDVJyOh0TV3gm4ZRt/Ag7zivsY3uYXjmDbKnLpe3YSPeIzb2FhWoOabb58R4EW3gfgjxc7K6PrlgiP/jSyu60f/s+VeObVaFy3ObahsfePHlaRMseOYHV6feDyUZLdKoTtYHh68mJyUQ3b9FFquEq9NkwGK+VGLs9DCeMttDm9KTiyLrzpZhPw2o6T0VywDYdEucQcXeOJe
X-MS-Exchange-AntiSpam-MessageData: 
 6ZyQ7TCJpLKEH0w/l722I8gQtqxUcwit3qIOqdnZeJSKU9pm2VwoN7yrzxBWiWTtmz/HSaooOLwRq84muLj5Neu+0C5gHBa/ikW3GrHgBE0DVxz7hBC1jjc3QZwMJQs0eqzae7/NRkccIqjsTN74Fw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3276
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(6916009)(8936002)(4326008)(26005)(70206006)(81156014)(6486002)(8676002)(1076003)(81166006)(86362001)(36756003)(82740400003)(356004)(70586007)(6666004)(44832011)(16526019)(186003)(2906002)(336012)(2616005)(956004)(47076004)(7696005)(316002)(26826003)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	01f3bc25-e3aa-4ce3-8ada-08d7d23cff59
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+sTUtI4bFZs0t7J06v8LbG3HnNsEKZsG6WOhZJohcohbj2KSx5K/8tDk2jD1Bw8bG8gTPKrUFAwCn1LLRq30rEMX6CsNN/TQCeSDWvCHdmRZqwwgyKNUsgRRoDYG05E/NihxoNq1vjR/eo80tbaZ4RDm90t6U7UKru7L8b7M/U5EcjkLPmL+TVKN8fHAiY8BS0rHLgvN/JsgLbt+FCKDFtIVXM06YHIPKF9EdRHWl4qEK/2ZxLIHn10fNXpeo1fbhbg90ko4jn7lHlx4Bz6ysqzgvwzYVyXBHDDht1sbLv29GxCVnHxW9DfWLc31fhPa8QNiI78OXPY4Bxy5nfMrM8ht9dkGO5sliiqi/ZheC/Y5RU/gbuvrzfZpmY6rmzqTqKbYKqtkihuD+N5xOzWoy5YsJg9lXNySmzXQxqyZDXFgg7TMbXv1+Q2kLVW+UXJrgJhs0qO4/L5maK8mCwZ12fWm78XAdBujxKo28FBTTc4Okfx/GF9Z/jiZuTwGLqeSqGl/MdHH1j3zIfanbhF4bQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:52:58.6239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a5e3e0-7667-4691-4e17-08d7d23d034b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3140
Content-Type: text/plain

Add class xenguest-image-extra to be used by recipes which wants to add
elements to the generated xenguest image.
The recipes using this call must inherit the deploy class and declare a
deploy task that will be extended by the class. The variables
XENGUEST_EXTRA_* documented in the class can be used to define what
should be used to extend the xenguest image.

Change-Id: I8a7682a7a7ca57b424ea815145408ccb8e4348ca
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../classes/xenguest-image-extra.bbclass      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 meta-arm-autonomy/classes/xenguest-image-extra.bbclass

diff --git a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
new file mode 100644
index 0000000..a5697e5
--- /dev/null
+++ b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
@@ -0,0 +1,102 @@
+# This class must be used to extend the xenguest image
+# It provides variables to add init scripts, a dtb, xen files or disk files.
+#
+# The class is extending deploy function so you recipe must inherit deploy and
+# have a do_deploy function (even if it is empty)
+
+# Use standard xenguest-image
+inherit xenguest-image
+
+# Add a DTB file for the guest
+# Only one file should be added, if this is set multiple times or in several
+# recipes, the last recipe setting it will prevail.
+XENGUEST_EXTRA_DTB ??= ""
+
+# Append something to the guest xen configuration
+# All files here will be merged together in the final xen configuration
+# This can contain several files or be used in several recipes
+XENGUEST_EXTRA_XENCONFIG ??= ""
+
+# Add a xenguest init, init-pre or init-post script
+XENGUEST_EXTRA_INIT_PRE ??= ""
+XENGUEST_EXTRA_INIT ??= ""
+XENGUEST_EXTRA_INIT_POST ??= ""
+
+# Add xenguest files, (to be used in extra xen config for example)
+# several files may be added, space separated, the path will be kept on the
+# generated xenguest image (if dir1/file1 is added, it can be used as
+# dir1/file1 file in the xen configuration).
+XENGUEST_EXTRA_FILES ??= ""
+
+# Add xenguest disk files (to be used as disk partition content)
+# several files may be added, space separated, the path will be kept on the
+# generated xenguest image (if dir1/file1 is added, it can be used as
+# dir1/file1 file in the disk content parameters).
+XENGUEST_EXTRA_DISK_FILES ??= ""
+
+do_deploy_append() {
+    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
+        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
+        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
+    fi
+    rm -rf ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
+    mkdir -p ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
+
+    if [ -n "${XENGUEST_EXTRA_DTB}" ]; then
+        if [ ! -f ${XENGUEST_EXTRA_DTB} ]; then
+            die "xenguest-image: DTB file ${XENGUEST_EXTRA_DTB} does not exist"
+        fi
+        call_xenguest_mkimage partial --xen-device-tree=${XENGUEST_EXTRA_DTB}
+    fi
+
+    if [ -n "${XENGUEST_EXTRA_XENCONFIG}" ]; then
+        for f in ${XENGUEST_EXTRA_XENCONFIG}; do
+            if [ ! -f $f ]; then
+                die "xenguest-image: Xen config $f does not exist"
+            fi
+            call_xenguest_mkimage partial --xen-append=$f
+        done
+    fi
+
+    if [ -n "${XENGUEST_EXTRA_INIT_PRE}" ]; then
+        if [ ! -f ${XENGUEST_EXTRA_INIT_PRE} ]; then
+            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT_PRE} does not exist"
+        fi
+        call_xenguest_mkimage partial --init-pre=${XENGUEST_EXTRA_INIT_PRE}
+    fi
+
+    if [ -n "${XENGUEST_EXTRA_INIT}" ]; then
+        if [ ! -f ${XENGUEST_EXTRA_INIT} ]; then
+            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT} does not exist"
+        fi
+        call_xenguest_mkimage partial --init-script=${XENGUEST_EXTRA_INIT}
+    fi
+
+    if [ -n "${XENGUEST_EXTRA_INIT_POST}" ]; then
+        if [ ! -f ${XENGUEST_EXTRA_INIT_POST} ]; then
+            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT_POST} does not exist"
+        fi
+        call_xenguest_mkimage partial --init-post=${XENGUEST_EXTRA_INIT_POST}
+    fi
+
+    if [ -n "${XENGUEST_EXTRA_FILES}" ]; then
+        for f in ${XENGUEST_EXTRA_FILES}; do
+            if [ ! -f $f ]; then
+                die "xenguest-image: Xen file $file does not exist"
+            fi
+            call_xenguest_mkimage partial --disk-add-file=$file
+        done
+    fi
+
+    if [ -n "${XENGUEST_EXTRA_DISK_FILES}" ]; then
+        for f in ${XENGUEST_EXTRA_DISK_FILES}; do
+            if [ ! -f $f ]; then
+                die "xenguest-image: Disk file $f does not exist"
+            fi
+            call_xenguest_mkimage partial --disk-add-file=$f
+        done
+    fi
+}
+# Need to have xenguest-image tool
+do_deploy[depends] += "xenguest-base-image:do_deploy"
+
-- 
2.17.1

