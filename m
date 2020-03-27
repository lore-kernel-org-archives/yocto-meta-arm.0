Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web12.8866.1585306378109642553
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zQgcjnoH;
 spf=pass (domain: arm.com, ip: 40.107.22.84, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SWe+KWFzPKgkNLTPibvNeyP/8nsRvCTkw964XqDMWw=;
 b=zQgcjnoHEp1AH/tRdZNDvvNm7OMyZ/1+CZRrT9W5oIsD0f8P9hIGiKMNQDkrEg8gsoiOjup/jvt/bANUExoblDHvRNTY1NrJc5vXohOWAJgkOUVp1CJuKqpbNgd7CdRgjZzUD+Qp4wrG3lFhrx5ylLmpwTO0dkam2Swi9AZZEN8=
Received: from DB6PR0301CA0027.eurprd03.prod.outlook.com (2603:10a6:4:3e::37)
 by AM6PR08MB4327.eurprd08.prod.outlook.com (2603:10a6:20b:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 10:52:56 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::64) by DB6PR0301CA0027.outlook.office365.com
 (2603:10a6:4:3e::37) with Microsoft SMTP Server (version=TLS1_2,
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
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:52:55 +0000
Received: ("Tessian outbound 6835489d965f:v48"); Fri, 27 Mar 2020 10:52:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38271302ad63989e
X-CR-MTA-TID: 64aa7808
Received: from 4b9794bbd627.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D4613721-40D5-49D9-99E9-F3270AE427D6.1;
	Fri, 27 Mar 2020 10:52:50 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b9794bbd627.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:52:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7X51+343vV8yGpjx4aQshnt/sxmsPUWiIioHzc/ZB1ad+nX+W8LPhOBxQUWTpQJhrf/1c6OrV4UE12i7daKuB1jKe/jEYu8Mq6iIRZD5CvKpCYM6D89+BaJ935nZ5ofZ+HMf/x6rJz037j6Z7UlbyDMLwnZpnH5WStQLO9l7ahH1g2BLcyUxMorKFk98brxyiuiOOi1h+DHafGXqp+0QKCRm9Lm/BpHN8+657V9hHMi+n1kXB175RcdPUiwWWqV7nCbgbewetK23ZiU3OHi/29pV7QOxobDtLU13x//rL6hzA3snKnzzMzRvAwgnbcDJOspdb3ggahnbWpLJbODwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SWe+KWFzPKgkNLTPibvNeyP/8nsRvCTkw964XqDMWw=;
 b=WIpQaMiiol4XtK3SDviI+ekw6CA2GjYMo+eE5RzNG+oWQ6BqwWgVwxCIkxrrC3or5dZl7q8rbibq8Liw0o24i3N/PgrT/bKtXrSapMsOHuqMbfhHg7IaWzkzaVjtgeFoDMQV9yqu+vq+4qDmGWD9RiiaCg5DdL1ZZYbhV+sXUIiySsgAUTAzrtFHY4qAP1VeExa1xKPz0nksplHq7cxBusKQMS0VKKtCZxYLUXFbvxjkztRPu8LQsGF7jBPxC1gwLqQ6YGUWwf6AWeCRrX46VzpxwHu0uD0MdfuSLGeZ6+O9Fzk7ypRigf3ZbRfNw1Txi/56pJ6nNWSB6MF73K0JiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SWe+KWFzPKgkNLTPibvNeyP/8nsRvCTkw964XqDMWw=;
 b=zQgcjnoHEp1AH/tRdZNDvvNm7OMyZ/1+CZRrT9W5oIsD0f8P9hIGiKMNQDkrEg8gsoiOjup/jvt/bANUExoblDHvRNTY1NrJc5vXohOWAJgkOUVp1CJuKqpbNgd7CdRgjZzUD+Qp4wrG3lFhrx5ylLmpwTO0dkam2Swi9AZZEN8=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3450.eurprd08.prod.outlook.com (20.176.238.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:52:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:52:49 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/7] arm-autonomy: Create xenguest-base-image recipe
Date: Fri, 27 Mar 2020 10:52:20 +0000
Message-Id: <20200327105223.460-5-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105223.460-1-bertrand.marquis@arm.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.54) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:52:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb6f83e8-8204-4ad9-04bd-08d7d23d01b1
X-MS-TrafficTypeDiagnostic: DB7PR08MB3450:|AM6PR08MB4327:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB43274BA55C2320AD21D023D89DCC0@AM6PR08MB4327.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:913;OLM:913;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(86362001)(6666004)(5660300002)(6486002)(4326008)(44832011)(956004)(2616005)(16526019)(478600001)(7696005)(81156014)(8676002)(66946007)(36756003)(26005)(1076003)(316002)(2906002)(186003)(6916009)(66556008)(66476007)(52116002)(81166006)(8936002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O48MbXUDIllto94Ob5jotW9iYc7mdPuigFtFqyQ2TDkvg5+Kxv85Ku+SZtEhMtzvXbADeS12MLr/WRuYu1evO5qFnROhgaFLodAXYAumChdBym/veiZeUuHYYnhHUAQy52x6fxQK3aiQofQ7I8zMDHbJEQrxzIruQ4OTMVw67Hh0hjq2j8iOAvkwqB5Hf/zdbTcbIzUB+s3vLfy7+uvAl42DXXO5FIZYxeyA7sTAiR289mGGzKrLGAU1EMapg6Ct/TpPqvfJci6vxb9k/ZZbgbNUbur/U6zg/SrCmG8UnqCeUX3aGzZZ7oxE8OFi+oVFBHrF7mvFwr+ClD2kN/zRh8++blb7eX2ep2+nhtlm9gXDkd3tRuriMDwoYn/OLnVg5qnwybowym39+S62diDLkAXq13TdzNy6X8mhSZoKvPKxFSrMtY3VlaI/VVaP2RVVye4Vdh2NgJic+ptETXWUxJeyC4srNWdFkgM46SEk5marPRBTB9yvb1g1vqd5p3NnHkqRXPqN3jk+0zC7FC1rJQ==
X-MS-Exchange-AntiSpam-MessageData: 
 DMBirdMEhoSed3tRaB1DcgyJurdNG1ht/hd1mQxHxBwcJkKip04ynCTdEbYqXmSrrKSoslec98RZGNT4KoC5CHtdFbbye0anc0rAzZWgzKu7JTg0e0iCQcCNsoLeLeMU6gS3o2UfQ0oHQc0t2rvAuA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(5660300002)(26005)(6666004)(356004)(70206006)(36756003)(316002)(4326008)(47076004)(8936002)(70586007)(336012)(6486002)(956004)(2616005)(16526019)(186003)(44832011)(7696005)(2906002)(82740400003)(6916009)(86362001)(81166006)(8676002)(26826003)(478600001)(81156014)(1076003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3ed8decd-561a-4f1f-a0b9-08d7d23cfd9b
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6hyoDvkOzlU2Sih1H9qadV4PGykEDtMjXTQ5MBGQ/llcxSOenJ2BCMkkUG+e5C0/eo8Ixz4Xl0FWa9pphitzZZ1hD++GwUGA/+hCDmGg7FM/6tEoDXc7s7ehREwJTGX10O2CSoPRxTmWC6piY4950Y037XTrEKLYRm01Z7QkCcp7PUVpM2nMywHCJBDqn7wDU/HWH/W523l8AlUbaBLIubq5bEuARVlh7cDP6U4XCMK99XzALzSHPzF98bXgQ7xCESK4i3gSRhiQl8tg/4HHjAzE4YeTSmyasLdJI5qwqeYn7i4S8/Yjl1P9KudgbO8fytAkwuZO/QWkC7VQVZM2kCSQUDEJDARiIZguqsx+kJFY+c7lw1z0dSERc9nIhRC6iK6CRsAotQn2vZeB1+vEnURRKs8kQbGFmW4O0XSjsq+ig+OJmQ4I3qdl780Fa1F+lItRmh2KT61cU5wbkBpCU/SlP9nybhhqpJQyKUpsvlR0JjAoaBfCVMKokcrUm0TkX3bZB8sz8SkaxESuSnpvoE0fX35vn+ZzA6Qx+yIDXH/Zp9e9BnXKOcLZN3zHDCtsYcDZodqRaWe8+Y4ryOD/OXc+HcQE7MIi5dQk2OIAtVo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:52:55.9360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6f83e8-8204-4ad9-04bd-08d7d23d01b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4327
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
 .../xenguest/xenguest-base-image.bb           | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
new file mode 100644
index 0000000..ea4a9f3
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
@@ -0,0 +1,116 @@
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
+# For example to add a boot.tar.gz file that you download to the file
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
+# Add init script
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
+
+    if [ -d ${WORKDIR}/extend/$subdir ]; then
+        filelist=$(find ${WORKDIR}/extend/$subdir -type f)
+
+        if [ -n "$filelist" ]; then
+            for f in $filelist; do
+                call_xenguest_mkimage update --$cmd=$f:$(basename $f)
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
+    add_extend_files "disk-files" "disk-add-file"
+    add_extend_files "files" "xen-add-file"
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

