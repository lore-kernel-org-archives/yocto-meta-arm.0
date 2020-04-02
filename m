Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.54])
 by mx.groups.io with SMTP id smtpd.web12.141.1585847346830781671
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 10:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Z8VgFM4Y;
 spf=pass (domain: arm.com, ip: 40.107.3.54, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Iyuj9t2ZtG9OOvw2ABGu4aZ6u+7ooAQwCa3Yk75etk=;
 b=Z8VgFM4YZsy0qkUcBrA/JlIlLdcFQSk5c3CfG1JhCtWvB2RuhHdQFoS8ZIZt4xjErcdMa+0qwJ7G9eFeL92fDIs9b9irqm/jcOIm2D5PgciZRO57rdn24uJA8fXuBnxMy3ymkSe01MY4uqr9VrSp/DkLciPEvj0d10p9RQouNHU=
Received: from AM0PR0102CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::38) by DB6PR0802MB2453.eurprd08.prod.outlook.com
 (2603:10a6:4:9e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 17:09:04 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:14:cafe::e3) by AM0PR0102CA0025.outlook.office365.com
 (2603:10a6:208:14::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend
 Transport; Thu, 2 Apr 2020 17:09:04 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:09:04 +0000
Received: ("Tessian outbound e2c88df8bbbe:v50"); Thu, 02 Apr 2020 17:09:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5af60c8877e3dc5f
X-CR-MTA-TID: 64aa7808
Received: from 3215ee0e4629.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0CA3BD73-CC39-4818-A088-F395986D6FE0.1;
	Thu, 02 Apr 2020 17:08:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3215ee0e4629.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:08:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUflofv7pSIZZmrKqo77BsWvj96j2VC/7Q2qXc0F5Q3HLNRTna5GddR4SKytpUX/hHnjVqvRvGQbM2reR7fx0V7/LjwB8pb6nTvP0Hyh+f9y18EF1GTgRFbhkylEF/Xspg6KNkdAKrznna1Vlw14qoHbHz5wZ/C6vtccW69iy/GotKm9jscEPIJBGZXLAWQpyKtLe6ozL0KKhX3Xx5Nee1p/fPK93NZfEQUNIkq9QFwMvIx1bsQDIrS7oBxpARm4whpsQupsYoDWnCh5JmUwOvGRBC/BLqSluwW/6NKdVqwcT5GsxCdyh2gsBkanzvHAu5RwIh9TTUP5wvcvpidcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Iyuj9t2ZtG9OOvw2ABGu4aZ6u+7ooAQwCa3Yk75etk=;
 b=nPf5ywYkHBFcTs5vjpC8ZvCeKnRi7i7pD60WBzhomSGYsAcbedQdo6oqb+oukZZ7nnikfo56KfnkRN7DCtX0wbmy64+hjdnYAElzGwjweU6iodbyDC6dtGsFSJHI9Yo+9WI9RZj++FxKWaFwI4fieC+SMEzAByn7TY3NpKS10qVdNCj3+fsHQW9LmAgayqWAh0o+jfl+jF65a0JP267P9fWFcjmww6QLXJFBMzKdU/j/Ay+pvc7/DcJuu24+7+xYgXSZsBFgF2KgX51wqiYzwss3KY4ioExRH6xsBzm1j5KDOC9MFXzg+N5Xjga69GzrW8U0RD3czpB+ufWRU8YgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Iyuj9t2ZtG9OOvw2ABGu4aZ6u+7ooAQwCa3Yk75etk=;
 b=Z8VgFM4YZsy0qkUcBrA/JlIlLdcFQSk5c3CfG1JhCtWvB2RuhHdQFoS8ZIZt4xjErcdMa+0qwJ7G9eFeL92fDIs9b9irqm/jcOIm2D5PgciZRO57rdn24uJA8fXuBnxMy3ymkSe01MY4uqr9VrSp/DkLciPEvj0d10p9RQouNHU=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3801.eurprd08.prod.outlook.com (20.178.46.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 17:08:57 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:08:57 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 4/7] arm-autonomy: Create xenguest-base-image recipe
Date: Thu,  2 Apr 2020 18:08:13 +0100
Message-Id: <20200402170816.8818-5-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:08:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab5ac6a8-2f0f-4467-e084-08d7d7288c0d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3801:|DB6PR0802MB2453:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2453B3FECE8676CB6D43A7A79DC60@DB6PR0802MB2453.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;OLM:1303;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(5660300002)(66556008)(44832011)(2906002)(4326008)(66946007)(8676002)(66476007)(6666004)(6916009)(26005)(186003)(1076003)(81166006)(316002)(52116002)(478600001)(86362001)(6486002)(7696005)(956004)(2616005)(16526019)(81156014)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WDGuIdmaXc3m++g3fG/vufEDl3SKyYSQZa2T2eedl0MBGFKGGVMB5egh2Llj+yoEfTB88g8aYg9tUFMNSu00tHMF1KNfsrQCXUCha0UqwZQwLjBnR/+X4iZ6+xbRErO2Ht/Q/hCUTTzfX/j3jFv1GmrelwuYc9lhnsmt9x+uGz4ACFf3hLjYTcMID2nH1ZkFZtfVmCWRJHfaueYVJFwrC8s9dwPrUQ2z3buYs3yPFaqnNxo0Kpqckx+wj4XqiokNsBCbnnUEtcXamQrYQKOKrl3Mg+ZhFp/38PNT3/syxmadaHbnJ2aFBszbpMvzH/AX0tAqTvtLbShsQKjRSNO86k7u5Xw+A2ILUbuS+hstxdP/rmizmrxHKfqcAroAiW6UaQexiebbMVa4t3lnHPIduyrN++8seJ9g5KTPvbX0rFcNhP3WjNkKrAH9bE8NVTkEX4pv6tBpPAi4xdqm9fARPhvLwTUvPxngNyrXCp6G72FOjUJDn/juhaLwBaME1zpgIYiO7PjBpLiblY525IaA2Q==
X-MS-Exchange-AntiSpam-MessageData: 
 u9bNqzkmQavtnmkz9k+gX+dWKdb84RhtLnbqkTew5T+lFzelTDm8viD2vyGjwu6UMhD70x7kVptPfA0Gu3AniyEGtI2RGNiVzjT392NS6yYQcm0PFonvF63Q9gr43jb4tEkqqxBkg+INio29jcC1bA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(336012)(478600001)(2616005)(44832011)(81166006)(8676002)(36756003)(8936002)(4326008)(5660300002)(86362001)(6916009)(956004)(2906002)(7696005)(81156014)(26005)(70206006)(26826003)(316002)(356004)(6666004)(16526019)(1076003)(6486002)(70586007)(47076004)(82740400003)(186003)(36906005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ce569e7f-c3cb-422d-62e6-08d7d7288777
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sytFtTICtseXWq+/Hs2JZiI320lgUbXX7RyyjimdfH6CTQAmrAWM+vFPODtWE7U32qbXo57FX+13+m2NoIAmGNObYglwTidXJlAilRho/yg83d53SMir37fuemEvVqg2xlJ+qpW08QPozkcUZuQDCIfZVnE4CxCPbUEzgoskOIerM+VnhggvXQKNR3tPZncx+MJ7Q0GnVdOMAIGCkD2pu76Ki7JRhkeMNp6bstxNB3EKn2AhaMjTd9q9k20yX5+i0thw6U9MGI6jwDPRfA4mFM/BRnfJH7BmRoBhD9fDvbcHkWx2+D+9FqHPtlXpC3FfpN9zZzqHFyeG+ojr5Wc7xHdkFMqlIC0gjZRB1VaePYscoiOFayY0T8wL6NjjWyRV6XfZChWJvswsd+fbIGqO7woidagIXY7dAIyDlArCjf0WzH3T3k+rukhy94fs9DOeMpEvZmPqiQN/VUQKHzD4iGIpG7bdMiEarT9ZrvWnd2WyvzpqnY96aGdYbIwfCiNrAsTb3yd1DtkEB2v2+c3TorVHJ9AqnS3RrGumFHTjnHYiygeJlNsxtops7lo6FUmq0BGInS7xNBhWno4sYl4Q+8WLfLZHp7zNQpYQFq48G38=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:09:04.3997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5ac6a8-2f0f-4467-e084-08d7d7288c0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2453
Content-Type: text/plain

Add xenguest-base-image recipe to create an initial xenguest image
directory in deploy.
This is using the xenguest-image class.
The recipe is also introducing several parameters named
XENGUEST_IMAGE_SRC_URI_* to allow the user to specify files or elements
to be added to the xenguest image.
Those parameters are documented inside the recipe.

Change-Id: I806a2fa07fb9593c366d88e2f4ee8b649cbcf8ea
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- fix handling of extended files by passing destination name only to
  options supporting it (disk-add-file and xen-add-file)
---
 .../xenguest/xenguest-base-image.bb           | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
new file mode 100644
index 0000000..fb66566
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
@@ -0,0 +1,119 @@
+# Create a xenguest base image
+#
+# This recipe creates a base image that is then extended by other recipes
+# through xenguest-image class.
+# xenguest image type is using this as base to add a kernel and a disk image
+# to create a guest
+#
+# The recipe is also adding files in those directories to the xenguest image:
+# - ${WORKDIR}/extend/disk-files: all files in this directory will be added to
+#   the guest disk files (using --disk-add-file)
+# - ${WORKDIR}/extend/files: all files in this directory will be added to the
+#   guest xen files (using --xen-add-file)
+# - ${WORKDIR}/extend/guest.d: all files in this directory will be added to
+#   the xen append configuration files (using --xen-append)
+# - ${WORKDIR}/extend/init.[pre|post|d]: all files in those directories will
+#   be added to the corresponding init scripts (using --init-[pre|post|script])
+# You can bbappend this recipe and put files in ${WORKDIR}/extend to add
+# elements to the image.
+#
+
+DESCRIPTION = "Xenguest Base Image"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+#
+# The following variables can contain SRC_URI compatible entries to add
+# files to the xenguest image.
+# You can set those variable in local.conf to add one or several files
+# For example to add a boot.tar.gz file that has to be downloaded to the file
+# useable for disk partition initialisation:
+# XENGUEST_IMAGE_SRC_URI_DISK_FILES += "https://www.test.com/files/boot.tar.gz"
+
+# Add disk files
+XENGUEST_IMAGE_SRC_URI_DISK_FILES ??= ""
+
+# Add xen files
+XENGUEST_IMAGE_SRC_URI_XEN_FILES ??= ""
+
+# Add xen configuration elements
+XENGUEST_IMAGE_SRC_URI_XEN_CONFIG ??= ""
+
+# Add pre init script
+XENGUEST_IMAGE_SRC_URI_INIT_PRE ??= ""
+
+# Add init script
+XENGUEST_IMAGE_SRC_URI_INIT ??= ""
+
+# Add post init script
+XENGUEST_IMAGE_SRC_URI_INIT_POST ??= ""
+
+S = "${WORKDIR}"
+
+inherit deploy xenguest-image
+
+# parse XENGUEST_IMAGE_SRC_URI_ variables and add them to SRC_URI
+python __anonymous() {
+    def parse_extend_variable(d, varname, destdir):
+        list = d.getVar(varname)
+        if list:
+            for entry in list.split():
+                #Check the URL
+                try:
+                    decode = bb.fetch.decodeurl(entry)
+                    d.appendVar('SRC_URI', ' ' + entry + ';unpack=0;subdir=extend/' + destdir)
+                except:
+                    bb.fatal("%s: %s contains an invalid URL:  %s" \
+                    % (d.getVar('PF'), varname, entry))
+
+    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_DISK_FILES', 'disk-files')
+    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_XEN_FILES', 'files')
+    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_XEN_CONFIG', 'guest.d')
+    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT_PRE', 'init.pre')
+    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT', 'init.d')
+    parse_extend_variable(d, 'XENGUEST_IMAGE_SRC_URI_INIT_POST', 'init.post')
+}
+
+# Make sure we are removing old files before redoing a fetch
+do_fetch[cleandirs] += "${WORKDIR}/extend"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_install[noexec] = "1"
+
+add_extend_files() {
+    local subdir="$1"
+    local cmd="$2"
+    local stripdest="${3:-n}"
+
+    if [ -d ${WORKDIR}/extend/$subdir ]; then
+        filelist=$(find ${WORKDIR}/extend/$subdir -type f)
+
+        if [ -n "$filelist" ]; then
+            for f in $filelist; do
+                if [ "$stripdest" = "y" ]; then
+                    call_xenguest_mkimage update --$cmd=$f:$(basename $f)
+                else
+                    call_xenguest_mkimage update --$cmd=$f
+                fi
+            done
+        fi
+    fi
+}
+
+do_deploy() {
+    # Create a new image
+    xenguest_image_create
+
+    # Add our extra files if any
+    add_extend_files "disk-files" "disk-add-file" "y"
+    add_extend_files "files" "xen-add-file" "y"
+    add_extend_files "guest.d" "xen-append"
+    add_extend_files "init.pre" "init-pre"
+    add_extend_files "init.d" "init-script"
+    add_extend_files "init.post" "init-post"
+}
+
+addtask deploy after do_install before do_build
+
-- 
2.17.1

