Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.82])
 by mx.groups.io with SMTP id smtpd.web11.122.1585847351666873052
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 10:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0IlwIAWN;
 spf=pass (domain: arm.com, ip: 40.107.15.82, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1BboOrdA6vJ8WjpkB6EQpwnRTdWDy35a7JBaU7vAyA=;
 b=0IlwIAWNXA59Z/zwdTWgKWuP42vl8RUZJcc2+wS34uhBKNhMdozLCiSVKWIua4VZEeLcPF4az5eSxJxzbvxgK6SBBMzb+ZFccRTip1ElzU4QtczqRgs14vFThE+urtjjbeRiq9LIM05h9otYk9R3HLAngbwNBksB++2jo2BmEDI=
Received: from AM4PR0701CA0023.eurprd07.prod.outlook.com
 (2603:10a6:200:42::33) by VE1PR08MB4686.eurprd08.prod.outlook.com
 (2603:10a6:802:af::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 17:09:09 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:42:cafe::1a) by AM4PR0701CA0023.outlook.office365.com
 (2603:10a6:200:42::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.11 via Frontend
 Transport; Thu, 2 Apr 2020 17:09:09 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:09:09 +0000
Received: ("Tessian outbound 9e48e1321951:v50"); Thu, 02 Apr 2020 17:09:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e41e647bfc510e39
X-CR-MTA-TID: 64aa7808
Received: from b689a65f866a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 45DAFD3F-BE40-4154-A75E-EF13572D6F34.1;
	Thu, 02 Apr 2020 17:09:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b689a65f866a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxUbljjX1NHxgcqTWemEJ5HdYES8Dt6qZqtI0rNo7g3WqwF9bRvG/FXKVAJgffduhrZ0E82YePEWYDG9D69luSLN32IJmIZxeS7DMtW2N5s3AeTAkiyAeMJDi8NIle4dvDRUjGG9VTyWjLqYi1PngB9GBuUzGYwb2Re7nvPQ/CvO6LznUOu7feCPp3ApeTyPmUM16an6p3xqe9qFpBydPmbaDQmDmXe3IHUR2skCQpJrMtRbNmmtT0zO4S0CxKwhTnyEhEd36i4boVnLfKQzz08H4Sn62zHGOdkrBIXfbjntwLmTITTfwtcCws59Nq3j/BICxPV7q4jkywx3NwRXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1BboOrdA6vJ8WjpkB6EQpwnRTdWDy35a7JBaU7vAyA=;
 b=Z44ZjW2po+skFz1AGfi+/BmNBtj9krbPS4MocfgtoU6z05oSWMWi7ljkZ8fL9w+SjJQrscBip0BSeOI0x3IcVF/ce3CCQD2g9iNjaacL1ae2dmBzUQQ2Qzdv/6XYOxdZzn5ebky4kO8vZP4KIa93rWz4FF6c64VO41AeGfqT4USfHvYQGue5/yZkjEQUB4dZzc5O2ve9PAYyf0bQy8XC6tEqLr6b6EiRujR2UAXNxPdP650zpMw3o+2QxWaXMjVpP7/2tdI7fUForvqsQEoOZXnahCFMYkliqN2eFjErCoyI9Eix3pxOD+RmXZWXsEozxxGRd0rpbH+1y3LGRp3kZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1BboOrdA6vJ8WjpkB6EQpwnRTdWDy35a7JBaU7vAyA=;
 b=0IlwIAWNXA59Z/zwdTWgKWuP42vl8RUZJcc2+wS34uhBKNhMdozLCiSVKWIua4VZEeLcPF4az5eSxJxzbvxgK6SBBMzb+ZFccRTip1ElzU4QtczqRgs14vFThE+urtjjbeRiq9LIM05h9otYk9R3HLAngbwNBksB++2jo2BmEDI=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3801.eurprd08.prod.outlook.com (20.178.46.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 17:09:02 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:09:02 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 6/7] arm-autonomy: Create xenguest-image-extra class
Date: Thu,  2 Apr 2020 18:08:15 +0100
Message-Id: <20200402170816.8818-7-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:09:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ba06c06-aa8d-4969-6bc1-08d7d7288edc
X-MS-TrafficTypeDiagnostic: DB7PR08MB3801:|VE1PR08MB4686:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4686F56FFED88FB529B7DD369DC60@VE1PR08MB4686.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(5660300002)(66556008)(44832011)(2906002)(4326008)(66946007)(8676002)(66476007)(6666004)(6916009)(26005)(186003)(1076003)(81166006)(316002)(52116002)(478600001)(86362001)(6486002)(7696005)(956004)(2616005)(16526019)(81156014)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cfscOEz+BRE8oGSVR/3ncl29/zKm1CddLDd61lH1GPK52nolUzpxPA85UXHqBJXMPEUnkGzB0JAViGcmJe9SnKVlEE0tF7KxpY4rks1VLbJjf0cIxqQqh1TZ2bDGILccfSOch5x4DgbsD3/LpTprip1u/HfRxzo/V6dHw0qIIgo5CUhQ0eiG6W+ig4UEjMJp1J0rPoGb7hqjMzAw0Z+F8wpDlKYUhS5dSDHBYIUvfltzY1OO/QZaejgRjoi9FGdMpigPMYoiqYYUugC8xGRTkMViKU9hAjaSMu9iCO5sUqddQ2Jd5HfIPySkrDrpmeLT2daUOmeQIVVP61mXrOTt4TSrobSdqjmkgI+lMPstJlitRJ4rw4xih+PGESDtL0PrRg4p6KPqHV9LYAK4D+ydgaTdUz5NT+jtbuo2LO0O+d/xo7BZHL+XVaimHIZhB0Xm
X-MS-Exchange-AntiSpam-MessageData: 
 MDOgJtIMIwmIpNbJh/h8g/dwjMhJ3ASsIIScF0xh7v6KpXOxhToM4gptv/fNY9wmilzjGSdrD1eMN3PlGTOQDo5Wcrly0DORDnNIInVaQyPhJQkjIR9vwQ1eGlc44F7j8TiaWbIVYZ7c4a+eNloMbw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(186003)(26005)(16526019)(2616005)(4326008)(70206006)(8936002)(70586007)(478600001)(44832011)(6916009)(956004)(81156014)(36906005)(316002)(2906002)(47076004)(6486002)(5660300002)(26826003)(82740400003)(7696005)(356004)(36756003)(6666004)(336012)(86362001)(8676002)(1076003)(81166006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cd30152f-5c79-4421-e631-08d7d7288a5f
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2huu2rfAZcSfGV30A2fnMdtkywkRakR71BoWqHPyd4jjoHk5CKxiMFGeRjIEFyVIYCx0aig8HZh/VHdoLLiK8MSFOe8OossEoxIbJWwsPovX5laThqXhNwuD6GqRrdxrYt5EP8z7HnXVOW9DmPoInNSxy/avq+v48dYR4SWfjGhIPCnXGWIh9t0kd6tvxX5AJZikQeRKwG4xs71aolQGTC4682m8TxOOfMRc17gDc1HPC9IzgvfiwbwFBl+Jk0hRw8OxbKUVPDUt5b9p+ZV6gBAsLLg4QBl0/Vl4tj1wRAmbhwFQiyjj/VZT1flQHLHWY4Svz8vz/f+jkrKWBKyEcWvcRGSG/8yipc4o/FEvbp4aCt4ucUNRIpN7FWMu2Bdx3s3F1Jq9E4/sUGZmGZcYBcVQne964J1jebFhQzMftXXyG2csdRl5KwC+4sEu3Doe407PRFJ1FLBiXwkNlLOGzzBiR6D9RSbsG8XUs5EsYHjVXVSOLfkU5DV9ls09V/5cKxcvCaQoZDl5fSEq/PgBNQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:09:09.0627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba06c06-aa8d-4969-6bc1-08d7d7288edc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4686
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
Changes in v2:
- fix disk extra files handling (wrong variable was used before)
---
 .../classes/xenguest-image-extra.bbclass      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 meta-arm-autonomy/classes/xenguest-image-extra.bbclass

diff --git a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass b/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
new file mode 100644
index 0000000..502a083
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
+                die "xenguest-image: Xen file $f does not exist"
+            fi
+            call_xenguest_mkimage partial --xen-add-file=$f
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

