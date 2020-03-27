Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.79])
 by mx.groups.io with SMTP id smtpd.web10.8851.1585306378134836715
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 03:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7w0XfV6Z;
 spf=pass (domain: arm.com, ip: 40.107.7.79, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inYyYuAuEFNUfZsSum+OWiiCzpnCBV1DqAemIkFLZuA=;
 b=7w0XfV6Zr3GhJp4CBNDENvjKjrrvqe2viXKGq9dLB4BaXaBVp6tfo0KG9pcbQPh2XuRFrm22g1sCiE9Y/AEzoguPi3EFPGYm8sK4FWxXK5OVy9QO7wPN6u9AdVOueYvQ4D9y3vQX3LQ8FKW+zhrwxvAsMI+CbIYK4jMfy70NEWs=
Received: from DB8PR06CA0039.eurprd06.prod.outlook.com (2603:10a6:10:120::13)
 by AM0PR08MB3140.eurprd08.prod.outlook.com (2603:10a6:208:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Fri, 27 Mar
 2020 10:52:54 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::89) by DB8PR06CA0039.outlook.office365.com
 (2603:10a6:10:120::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 10:52:54 +0000
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
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 10:52:54 +0000
Received: ("Tessian outbound e13acb17570e:v48"); Fri, 27 Mar 2020 10:52:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf4c544551f75037
X-CR-MTA-TID: 64aa7808
Received: from 10e4855778ef.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EDD57103-EFC1-40B8-8630-7F0EE357C340.1;
	Fri, 27 Mar 2020 10:52:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10e4855778ef.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 10:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZW1TEDkloIgsD99KepQKYYoshwntAjr0ESXuN8BTezg+SyNHhnc5iHAERSg4vQAYcvGk2O6iYR96KXgM/tarsvy2+P3CGriRaqlvKQ2Lf/jLCQA6owp91h83Zk8vfInm+uyUpaKVw4TMWpCTafsTpOvH1scZzHiSLDo9d43DwrJ5IZri7h9xtqepGrUvVBdImD5oFjKv9DxiwXjdfRBcq39QVsrt6LGU8EjEiSxGtDJsQkKgFZTHuARPp4XsNayQdnvkVf4ahWIsW0ZTaukio9CpOjdUbQrNqaFwwCtAM3jPYb80J2mErUBbNOxn0dz4SgeMzfpFY7CSZKjfhAF+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inYyYuAuEFNUfZsSum+OWiiCzpnCBV1DqAemIkFLZuA=;
 b=k0G9kI/7Qth0dHHh5dxR0E0S+dzdyT10rbz+pgYc/942NdaAqPbVNz8iF8ScnsGtke6Z+KNdNm6HfgU6cp4la+MrkGeVR2AP1QH6eQp8eaC+xuXoa9gt+UgD7xF4VB98fZjDjTwuc6asNTjggMiZPRSsh2j5/IqDxcqFHDte9qWTy+cBZSFc1PbqmeT4cdvxFlZEBhgJckm1uRiq9SZ3bOTyb3YY/wtDhbz/916/6IAeWUizZTFzVXSQ2AU0v0Er3/7jOP5NpsjAMfWapJXNpz+MOEIf8qV/fwDuKiNzflWoKizEJjISeYjTk+iyUT7WSN+Syd1zI6eLozl00hCm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inYyYuAuEFNUfZsSum+OWiiCzpnCBV1DqAemIkFLZuA=;
 b=7w0XfV6Zr3GhJp4CBNDENvjKjrrvqe2viXKGq9dLB4BaXaBVp6tfo0KG9pcbQPh2XuRFrm22g1sCiE9Y/AEzoguPi3EFPGYm8sK4FWxXK5OVy9QO7wPN6u9AdVOueYvQ4D9y3vQX3LQ8FKW+zhrwxvAsMI+CbIYK4jMfy70NEWs=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3276.eurprd08.prod.outlook.com (52.135.128.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 10:52:45 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2835.025; Fri, 27 Mar 2020
 10:52:45 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/7] arm-autonomy: Create xenguest-mkimage
Date: Fri, 27 Mar 2020 10:52:17 +0000
Message-Id: <20200327105223.460-2-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327105223.460-1-bertrand.marquis@arm.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.54) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 10:52:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 179929a1-45dc-4fa2-d286-08d7d23d0094
X-MS-TrafficTypeDiagnostic: DB7PR08MB3276:|AM0PR08MB3140:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB314052D8A3921EE7BAD8963B9DCC0@AM0PR08MB3140.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;OLM:3173;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(2616005)(44832011)(4326008)(956004)(52116002)(86362001)(8936002)(7696005)(8676002)(81166006)(478600001)(66476007)(81156014)(1076003)(30864003)(316002)(6916009)(36756003)(6666004)(66946007)(66556008)(16526019)(6486002)(186003)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Uk5C3Hfc3jp9i0Tq414RpAx/BzlF5OAiYJhJLn7hNc2vPbP6xFhVHMXLD+vWHt0Yyjou7yqpsva87uyuIoH8YjAMlnilog7Ua+CGJRsjhDrZhlIQLZmJ4WW/6QGlyAQKH9/RzTe+UdWFALNvSowvOdfEqpY4bNV5+iEpNNQEeQIt1VMH3oxNtcqgPfnxPMej1vQtdUCYFy2FbcBFp+/+hFSkDeKIslXotFJ6D8O99FFkcF7XU0mu/B5zwbWnAvlzT8TRX2l2YW4zRxeNoCIxcj+0RoP0vKB5OaHoob+ldN9jl8qePq3hsoEcPACESMwDQS++zBCKsshz3P+TpyoO8Fid5O4/WVfhb+Y+2VayytzrzKemRYSqrBaDk95WySwIhCdCBirI5TLRrviPBW8fpxztOcXUKbC19+7DI0zZNbVOnrQsDViHfo4eYNgah5bXpUaiaci/bOnUMHL6SPtfpX1RBs9YxUR1CpHYWvkICp9p46oAlkYYPEeGurpfEkO8YDm983hlDx7JVnArYQ7zpaEaequSUk3uMAuqO78Fcfvhe8Hr77SwamrGB+gsqZuFBs8oRMrwhADjMc7suZVf6vVwAAHrT3cGGImNv0EYMOmAjXlgMHCQF/FKT5oZp4kXS0MB9QMX+afbzyKUXeqnDg==
X-MS-Exchange-AntiSpam-MessageData: 
 yPl8tE0B+jdGT60oScWnrJ4vKTZ2eX7AH/GpHMFjSsE9g1i5x4vRDm+9wtqGWZ7ttQdJWtmRfUCH2N7n0N0Fbs8nWWDm0ParrTvK0C3935pT8+v6Wbqp+SqrObO4wbAaP0B91Xz1T4GB87xZM29ksA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3276
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(6916009)(8936002)(4326008)(26005)(70206006)(81156014)(6486002)(8676002)(1076003)(81166006)(86362001)(36756003)(82740400003)(356004)(70586007)(6666004)(44832011)(16526019)(186003)(2906002)(336012)(2616005)(956004)(47076004)(7696005)(316002)(26826003)(5660300002)(478600001)(30864003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7476bcd0-479e-4e02-9a81-08d7d23cfafe
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pyPqDiJ+TBHXDeIBzXyuPytg+TnHPftUlyqD5HmN03FXit0KMYpmHfo3m5REv0YHj19x+HmT/GEj7J6TJVjJjdE/uTU8l7puACJuRuT2iiRdozWSU8IG7eeq8r2oDexa5F7OoRcAQEKNkFo9TeuWQhDnZckOrgu0QAJQUQp9fGlEmC9lvHUBWmRoywBO5XeckV2LjeTZiWKNse7T+PWNaRt248V285Yq1Sm/1vnLBTce7r7eLOXZ++d2G8pCJn3bPGHiwLwHWFrnUeaVCG3DbWj8X1BWJXfUbqkxDEX1kWoCNXh5H0vPv19oCZNlWmZ/MoSOoPT5+bDWarRAw7bwM7gsGU5RQm5owV5ynmo4uSAGlVBO/XyZRhmy8NW93Oey2KEX3yBWamW+MqEBMPS8tO2+NEZ7sH/ma2RKq7t4XAjYzoTy/4+r+N7VwdRF4NYVixMBwZNS59XhivSIO8RdhODxr4jCD4Cy7NwTBIedYUwj/utMfrE1RH1dRwdF7z+GYPWd2vv9Nw/IJC4Rh+nWkUiwgysrdOlKsty062KOX5lzgvG+dzQISnPJxU9ZiGgHmfW5njRlPkqMEfgchMXtOU6TT5Z1bS0X/0a0eGP7ZSlX+POLqzHglT1Ibw6l7nJCm5W98OK2jMzptBwyi1NWhp6QglRjCEExhyRgb8jNGDmo+UiJ1XVoYuF75/XCjjiyeV7AnQDbGRcPtAvfIRYrTA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 10:52:54.0745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 179929a1-45dc-4fa2-d286-08d7d23d0094
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3140
Content-Type: text/plain

Create a xenguest-mkimage tool to create Xen guest images.
Add documentation to explain what is a xenguest-image and how to use
xenguest-mkimage.

Change-Id: Id87240a4dfac2723f1dcceb8bfe969a7633ef261
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |   3 +
 .../documentation/xenguest-mkimage.md         | 119 +++
 .../xenguest/files/xenguest-mkimage           | 770 ++++++++++++++++++
 .../xenguest/xenguest-mkimage.bb              |  31 +
 4 files changed, 923 insertions(+)
 create mode 100644 meta-arm-autonomy/documentation/xenguest-mkimage.md
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index 78a7281..560a783 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -67,6 +67,9 @@ This layer is adding the following recipes and classes:
 * [xen-devicetree](documentation/xen-devicetree.md): this is a recipe to modify
   a device tree blob to add information required to boot xen and a Dom0 linux.
 
+* [xenguest-mkimage](documentation/xenguest-mkimage.md): this is a tool to
+  create and modify images to be used as Xen guests.
+
 Contributing
 ------------
 This project has not put in place a process for contributions currently. If you
diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
new file mode 100644
index 0000000..d77fd48
--- /dev/null
+++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
@@ -0,0 +1,119 @@
+Xenguest mkimage
+================
+
+Introduction
+------------
+
+xenguest-mkimage is a tool to create and modify images to be used as Guest with
+Xen. It defines a format to store completely defined guests as a file or as
+a directory and provides options to create and modify those images.
+
+A xenguest image contains all elements required to create a xen guest.
+This is the base elements like a Xen configuration and a Linux kernel binary
+but also some more advanced elements like init scripts or a disk definition.
+
+The format is made to be deployable easily by storing everything in a single
+file and provide tools to easily manipulate the images. It can also easily be
+extended to have features like encryption or signature of images, updates or
+complex configurations by providing features to have init script that will be
+executed on the host embedded inside the image.
+
+Xenguest images content
+-----------------------
+
+### params.cfg
+
+This file contains parameters that can be used by tools to configure some
+functionalities on the host. This can be used by init scripts to have
+configurable parameters as it is sourced before calling init scripts.
+
+### guest.cfg and guest.d
+
+guest.cfg is the main xen configuration and guest.d contains optional
+configuration parts. All those will be merged into one final xen configuration
+before starting the guest.
+
+### files
+This directory contains files that can be used by the xen configuration, for
+example the binary of the kernel referenced in xen configuration).
+This is where the kernel binary, the dtb or a ramdisk will be stored.
+
+### init.pre, init.d and init.post
+These directories contain init scripts that will be executed on the host
+during the guest startup. Those must be shell scripts and each directory
+contains scripts called at a different time:
+ - init.pre: scripts executed before the guest is created. This can be used
+     to prepare some features required to create the guest in xen or to
+     generate part of the xen configuration dynamically.
+ - init.d: scripts executed when the guest has been created but before it is
+     started. This can be used to do some xenstore operations or configure the
+     guest behaviour using xl, for example.
+ - init.post: scripts executed just after starting the guest. This can be
+     used to configure things created by xen for the guest like network
+     network interfaces.
+
+When a directory contains several scripts, those will be called in alphabetical
+order.
+
+### disk.cfg and disk-files
+disk.cfg contains the guest disk description (disk size and disk partitions).
+The file contains the following entries:
+- `DISK_SIZE=X`: size of the disk to create in GB
+- `DISK_PARTX=SIZE:FS:CONTENT`: create a partition number X (1 to 4) with a
+  size of SIZE GB, format it with filesystem FS (can be ext2, ext3, ext4, vfat
+  or swap) and extract CONTENT as initial partition content
+  (.tar[.gz|.xz|.bz2] file or img file to be dumped in the partition). FS and
+  CONTENT can be empty.
+
+The disk-files contain files to be used for initializing the disk partitions
+content. Those should be used to create a LVM or a physical disk and initialize
+it (create partitions, format them and put the initial content).
+
+Usage
+-----
+
+xenguest-mkimage is a shell script which must be called like this:
+`xenguest-mkimage OPERATION XENGUEST [OPTIONS]`
+
+### Operations
+- create: create a xenguest image. If XENGUEST is an existing empty directory,
+  the image is created as a directory otherwise it will be created as a file.
+- check: verify that XENGUEST is a valid xenguest image.
+- update: modify a xenguest image (see --help for a list of operations).
+- pack: pack a xenguest image directory into a xenguest image file. The file to
+  be created must be given as 3rd argument.
+- extract: extract a xenguest image file into a directory. The destination
+  directory must be given as 3rd argument.
+- dump-xenconfig: dump xenguest image xen configuration.
+- dump-diskconfig: dump xenguest image disk configuration.
+- dump-paramsconfig: dump xenguest image parameters configuration.
+
+For a detailed help on available operations, please use:
+`xenguest-mkimage --help`
+
+### Options
+- --kernel=FILE: add kernel FILE as guest kernel. This is both adding the file
+  to the image and modifying the xen configuration to use it.
+- --xen-memory=SIZE: set the guest memory size in MB.
+- --xen-extra: add a kernel command line argument. This can be called several
+  times to add several command line options.
+- --xen-device-tree=FILE: add dtb FILE as device tree. This both adding the
+  file to the image and modifying the xen configuration to use it.
+- --init-script=FILE: add guest init script. The script is embedded inside the
+  image file. Several script can be added and the basename of FILE is used to
+  distinguish them (calling the option twice with the same file will update the
+  script in the image with the second one).
+ --disk-size=SIZE: set the guest disk size to SIZE in GB. Calling this with 0
+  disable the guest disk.
+- --disk-add-part=NUM:SIZE:FS:CONTENT: This is adding a partition to the
+  xenguest image disk. The partition is described with the arguments:
+  - NUM: partition number.
+  - SIZE: partition size in GB.
+  - FS: filesystem to format the partition with. This can be ext2, ext3, ext4,
+    vfat of swap. If empty the partition is not formated.
+  - CONTENT: tar of img file to use to initialize the partition. The file must
+    be added to the image using --disk-add-file=FILE:CONTENT.
+
+For a detailed help on available options, please use:
+`xenguest-mkimage OPERATION --help`
+
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
new file mode 100755
index 0000000..58fcd01
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-mkimage
@@ -0,0 +1,770 @@
+#!/bin/bash
+# This script must be used to manipulate xenguest images
+#
+# xenguest image topology:
+#  params.cfg: guest global configuration file. Only edited using this script.
+#  guest.cfg: xen main configuration file. Only edited using this script.
+#  guest.d: directory contains files with custom xen configuration entries
+#    which are appended to guest.cfg before starting the guest
+#  files: directory where files used by xen configuration are stored
+#  disk.cfg: guest disk configuration file. Only edited using this script.
+#    (dtb, kernel image, etc)
+#  disk: directory where files for disk creation are stored
+#  init.[pre,d,post]: directories containing init pre, base and post scripts
+set -u
+set -e
+
+this="$0"
+
+IMAGE_TMPDIR=""
+
+usage() {
+    cat <<EOF
+Usage $this ACTION XENGUEST [ARGS]
+
+Where XENGUEST is a xenguest image file or a xenguest directory.
+
+The following actions are supported:
+help               Display this help
+create             Create a xenguest image
+update             Update/modify a xenguest image
+partial            Create partial xenguest image in a directory
+pack               Pack a xenguest directory into an image
+check              Check a xenguest image
+dump-paramsconfig  Display the guest configuration of a xenguest image
+dump-xenconfig     Display the xen configuration of a xenguest image
+dump-diskconfig    Display the disk configuration of a xenguest image
+dump-init          Display init scripts of a xenguest image
+extract            Extract a xenguest image content
+extract-config     Extract the guest configuration from a xenguest image
+extract-disk-file  Extract a disk file from a xenguest image
+Use $this ACTION --help to have help on a specific action and its arguments.
+EOF
+}
+
+usage-check() {
+    cat <<EOF
+Usage $this check XENGUEST
+
+Check a xenguest image or a xenguest directory.
+EOF
+}
+
+usage-update-create() {
+    cat <<EOF
+All arguments are handled in order.
+
+Global configuration for the guest
+--guest-config-reset    reset guest global configuration
+--set-param=PARAM       disable parameter PARAM in guest global configuration
+--set-param=PARAM=VAL   set parameter PARAM to value VAL in guest global
+                        configuration.
+                        Example of parameters supported are:
+                        GUEST_AUTOBOOT: if set to 1 (default), guest will be
+                         automatically created and started during host init.
+
+Xen configuration for the guest
+--xen-reset-config      reset xen guest configuration to default
+--xen-name=             disable name parameter in xen configuration
+--xen-name=NAME         set guest name in xen configuration
+--xen-kernel=           disable guest kernel parameter in xen configuration
+--xen-kernel=FILE       set guest kernel to FILE (file is added and xen
+                         configuration is set to use it)
+--xen-memory            set guest memory size (in MB)
+--xen-vcpus             set guest number of virtual cpus
+--xen-clean-extra       set guest command line (extra) to an empty string
+--xen-extra=ARG         append ARG to the guest command line (with space)
+                         use this several time to set command line.
+                         To set the command line to "console=ttyS0 rw" do
+                         --xen-extra=console=ttyS0 --xen-extra=rw
+--xen-root=             disable root parameter in xen configuration
+--xen-root=ROOT         set guest root in xen configuration
+--xen-device-tree=      disable device tree parameter in xen configuration
+--xen-device-tree=FILE  set guest device tree in xen configuration and add
+                         file to xen files
+--xen-disk=             disable disk parameter in xen configuration
+--xen-disk=DEV          set guest disk to device DEV (phy:DEV,xvda,w is set)
+--xen-append=FILE       append FILE content to xen configuration
+
+Xen files
+--xen-add-file=SRC:DST  add file SRC as file DST in the xenguest image.
+                         If DST already exist in the image, it is overwritten.
+                         DST must be the same as arguments passed to other
+                         options (like --xen-kernel)
+--xen-rm-file=DST       remove file DST from the xenguest image.
+
+Init configuration
+  This can be used to add init scripts for the guest. There are 3 possible init
+  scripts which are called at different time. The pre scripts are called first,
+  then the xen guest is created in pause and standard init scripts are called.
+  Finally the xen guest is started then the post init scripts are called.
+  Each script is called with the name of the guest as first argument and
+  multiple scripts can be added (they must have different names).
+
+--init-script=FILE      add FILE as init script
+--init-pre=FILE         add FILE as pre init script
+--init-post=FILE        add FILE as post init script
+
+Disk configuration
+--disk-reset-config     reset disk guest configuration to default (no disk)
+--disk-size=SZ          set guest disk size (in GB)
+--disk-device=DEV       set device to be used to create the guest disk
+                        if unset or set to an empty string, the volume will be
+                        create in the default manager volume group.
+--disk-add-part=DEF     add a partition to the guest disk with definition DEF
+                         a partition definition must have the following format:
+                         ID:SIZE:FORMAT:CONTENT where:
+                         - ID is the partition numeric ID (1 to 4)
+                         - FORMAT is the filesystem format (supported formats
+                           are none, vfat, swap, ext2, ext3 and ext4)
+                         - CONTENT can be used to point to a file added using
+                          --disk-add-file to be used as partition initial
+                          content (tar file or img file)
+--disk-rm-part=ID       remove partition ID from the guest disk
+--disk-add-file=SRC:DST add file SRC as disk file DST in the xenguest image.
+                         DST can then be used as a partition CONTENT.
+--disk--rm-file=DST     remove disk file DST from the xenguest image.
+EOF
+}
+
+usage-create() {
+    cat <<EOF
+Usage $this create XENGUEST [ARGS]
+
+Create a xenguest image as XENGUEST file.
+
+EOF
+    usage-update-create
+}
+
+usage-update() {
+    cat <<EOF
+Usage $this update XENGUEST [ARGS]
+
+Update or modify a xenguest image or a xenguest directory.
+
+EOF
+    usage-update-create
+}
+
+usage-pack() {
+    cat <<EOF
+Usage $this pack XENGUEST DESTFILE
+
+Pack a xenguest directory in XENGUEST to create a xenguest image DESTFILE.
+
+EOF
+}
+
+usage-partial() {
+    cat <<EOF
+Usage $this partial XENGUEST [ARGS]
+
+Update or modify a partial xenguest image.
+
+EOF
+    usage-update-create
+}
+
+usage-dump-paramsconfig() {
+    cat <<EOF
+Usage $this dump-paramsconfig XENGUEST
+
+Dump the guest parameters of a xenguest image or directory
+EOF
+}
+
+usage-dump-xenconfig() {
+    cat <<EOF
+Usage $this dump-xenconfig XENGUEST
+
+Dump the xen configuration of a xenguest image or directory
+EOF
+}
+
+usage-dump-diskconfig() {
+    cat <<EOF
+Usage $this dump-diskconfig XENGUEST
+
+Dump the disk configuration of a xenguest image or directory
+EOF
+}
+
+usage-extract() {
+    cat <<EOF
+Usage $this extract XENGUEST DESTDIR
+
+Extract guest to DESTDIR
+EOF
+}
+
+usage-extract-config() {
+    cat <<EOF
+Usage $this extract-config XENGUEST DESTDIR
+
+Extract guest configuration to DESTDIR
+EOF
+}
+
+usage-extract-disk-file() {
+    cat <<EOF
+Usage $this extract-disk-file XENGUEST DISKFILE
+
+Extract disk file DISKFILE to stdout.
+EOF
+}
+
+check_image() {
+    local tstfile=${1}
+
+    if [ ! -e ${tstfile} -o ! -w ${tstfile} ]; then
+        echo "Error: File ${tstfile} does not exist or is not writeable"
+        exit 1
+    fi
+
+    if [ -f ${tstfile} ]; then
+        # This is a xenguest file
+        local res=$(tar -tvf ${tstfile} ./guest.cfg ./disk.cfg \
+            ./params.cfg > /dev/null 2>&1 || echo "error")
+        if [ -n "${res}" ]; then
+            echo "Error: File ${tstfile} is not a valid xenguest"
+            exit 1
+        fi
+    elif [ -d ${tstfile} ]; then
+        if [ ! -f ${tstfile}/guest.cfg -o ! -f  ${tstfile}/disk.cfg -o \
+            ! ${tstfile}/params.cfg ]; then
+            echo "Error: Directory ${tstfile} is not a valid xenguest"
+            exit 1
+        fi
+    fi
+}
+
+params_config_reset() {
+    cat <<EOF > ${IMAGE_TMPDIR}/params.cfg
+# Xenguest-image guest global configuration
+#
+# !! This file must not be modified manually !!
+#
+# You can use xenguest-image to modify parameters.
+#
+
+# Guest auto boot during Dom0 init
+GUEST_AUTOBOOT="1"
+EOF
+}
+
+params_config_setparam() {
+    param="${1}"
+    shift
+    value="$@"
+
+    if [ -z "$value" ]; then
+        sed -i "/.*${param}=.*/d" ${IMAGE_TMPDIR}/params.cfg
+    elif grep -e "^${param}=" ${IMAGE_TMPDIR}/params.cfg > /dev/null; then
+        sed -i "s/${param}=\".*\"/${param}=\"${value}\"/" \
+            ${IMAGE_TMPDIR}/params.cfg
+    else
+        echo "${param}=\"${value}\"" >> ${IMAGE_TMPDIR}/params.cfg
+    fi
+}
+
+xen_config_reset() {
+    cat <<EOF > ${IMAGE_TMPDIR}/guest.cfg
+# Xenguest-image main configuraiton
+#
+# !! This file must not be modified manually !!
+#
+# You can use xenguest-image to modify parameters.
+#
+# You can add custom entries to configuration in the guest.d directory.
+
+# Guest name (set by manager when guest is created)
+# name = ""
+
+# Guest memory size in MB
+memory = 1024
+
+# Number of VCPUS
+vcpus = 1
+
+# Guest command line
+extra = "earlyprintk=xenboot console=hvc0 rw"
+
+# Guest root filesystem device (from guest point of view)
+# root = "/dev/xvda2"
+
+# Disk that will be used by the guest (set by manager when guest is created)
+# disk = ['phy:/dev/vg-xen/guestname,xvda,w']
+
+EOF
+}
+
+get_param_file() {
+    param="${1}"
+
+    if grep ${param} ${IMAGE_TMPDIR}/guest.cfg > /dev/null 2>&1; then
+        echo "${IMAGE_TMPDIR}/guest.cfg"
+    else
+        if [ ! -f ${IMAGE_TMPDIR}/guest.d/${param}.cfg ]; then
+            mkdir -p ${IMAGE_TMPDIR}/guest.d
+            echo "# ${param} = \"\"" > ${IMAGE_TMPDIR}/guest.d/${param}.cfg
+        fi
+        echo "${IMAGE_TMPDIR}/guest.d/${param}.cfg"
+    fi
+}
+
+xen_config_disable_param() {
+    param="${1}"
+    dst=$(get_param_file ${param})
+
+    sed -i "s@.*\(${param} = .*\)\$@# \1@" ${dst}
+}
+
+xen_config_set_number() {
+    param="${1}"
+    shift
+    value="$@"
+    dst=$(get_param_file ${param})
+
+    sed -i "s@.*${param} = .*@${param} = ${value}@" ${dst}
+}
+
+xen_config_set_string() {
+    param="${1}"
+    shift
+    value="$@"
+    dst=$(get_param_file ${param})
+
+    sed -i "s@.*${param} = .*@${param} = \"${value}\"@" ${dst}
+}
+
+xen_config_append_string() {
+    param="${1}"
+    shift
+    value="$@"
+    dst=$(get_param_file ${param})
+
+    sed -i "s@.*${param} = \"\([^\"]*\)\"@${param} = \"\1 ${value}\"@" ${dst}
+}
+
+xen_config_set_list() {
+    param="${1}"
+    shift
+    value=$(echo $@ | tr " " ",")
+    dst=$(get_param_file ${param})
+
+    sed -i "s@.*${param} = .*@${param} = ['${value}']@" ${dst}
+}
+
+disk_config_reset() {
+    echo "DISK_SIZE=\"0\"" > ${IMAGE_TMPDIR}/disk.cfg
+    echo "DISK_DEVICE=\"\"" >> ${IMAGE_TMPDIR}/disk.cfg
+}
+
+disk_config_rm_part() {
+    partid=$1
+    sed -i "/DISK_PART${partid}=.*/d" ${IMAGE_TMPDIR}/disk.cfg
+}
+
+disk_config_add_part() {
+    partid=${1}
+    partsize=${2}
+    partfs=${3}
+    partcont=${4:-}
+
+    # Make we don't add the same partition twice
+    disk_config_rm_part ${partid}
+    echo "DISK_PART${partid}=\"${partsize}:${partfs}:${partcont}\"" >> \
+        ${IMAGE_TMPDIR}/disk.cfg
+}
+
+# We need an action as first argument
+action="${1:-}"
+
+if [ -z "${action}" ]; then
+    echo "Error: No ACTION provided"
+    usage
+    exit 1
+fi
+
+# Only help does not require a xenguest argument so treat this first
+# while there we also check that user is asking for a supported action
+case $action in
+    help|--help|-h|-?)
+        usage
+        exit 0
+        ;;
+    check|create|update|pack|partial)
+        ;;
+    dump-xenconfig|dump-diskconfig|dump-init|dump-paramsconfig)
+        ;;
+    extract|extract-config|extract-disk-file)
+        ;;
+    *)
+        echo "Error: Invalid action $action"
+        exit 1
+        ;;
+esac
+
+# Second argument should be the file name or directory
+guestfile="${2:-}"
+
+# Handle user asking for help on a specific action
+case $guestfile in
+    help|--help|-h|-?)
+        usage-${action}
+        exit 0
+        ;;
+esac
+
+if [ -z "${guestfile}" ]; then
+    echo "Error: no GUESTFILE provided"
+    usage
+    exit 1
+fi
+
+shift 2
+
+case ${action} in
+    check)
+        check_image ${guestfile}
+        echo "Image is OK"
+        exit 0
+        ;;
+    dump-paramsconfig)
+        check_image ${guestfile}
+        echo "Guest configuration:"
+        if [ -f ${guestfile} ]; then
+            tar -xOf ${guestfile} ./params.cfg
+        else
+            cat ${guestfile}/params.cfg
+        fi
+        exit 0
+        ;;
+    dump-xenconfig)
+        check_image ${guestfile}
+        echo "Xen configuration:"
+        if [ -f ${guestfile} ]; then
+            tar -xOf ${guestfile} ./guest.cfg ./guest.d
+        else
+            cat ${guestfile}/guest.cfg ${guestfile}/guest.d/*
+        fi
+        echo
+        exit 0
+        ;;
+    dump-diskconfig)
+        check_image ${guestfile}
+        echo "Disk configuration:"
+        if [ -f ${guestfile} ]; then
+            tar -xOf ${guestfile} ./disk.cfg
+        else
+            cat ${guestfile}/disk.cfg
+        fi
+        echo
+        exit 0
+        ;;
+    dump-init)
+        check_image ${guestfile}
+        for init in init.d init-pre init-post; do
+            echo "=== ${init} ==="
+            if [ -f ${guestfile} ]; then
+                tar -xOf ${guestfile} ./${init} 2> /dev/null || \
+                    echo "No ${init} scripts."
+            else
+                cat ${guestfile}/${init}/* 2> /dev/null || \
+                    echo "No ${init} scripts."
+            fi
+            echo "==============="
+            echo
+        done
+        exit 0
+        ;;
+    pack)
+        check_image ${guestfile}
+        if [ ! -d ${guestfile} ]; then
+            echo "Error: Cannot pack a xenguest image"
+            exit 1
+        fi
+
+        if [ -z "${1:-}" ] || [ -f ${1} ]; then
+            echo "Error: No destination file or already existing file"
+            exit 1
+        fi
+
+        tar -C ${guestfile} -cf ${1} .
+        exit 0
+        ;;
+    extract)
+        check_image ${guestfile}
+        if [ ! -d ${guestfile} ]; then
+            echo "Error: Cannot extract config from xenguest directory"
+            exit 1
+        fi
+
+        if [ -z "${1:-}" ] || [ ! -d ${1} ]; then
+            echo "Error: No destination directory for config extract"
+            exit 1
+        fi
+
+        tar -C ${1} -xf ${guestfile}
+        exit 0
+        ;;
+    extract-config)
+        check_image ${guestfile}
+        if [ ! -f ${guestfile} ]; then
+            echo "Error: Cannot extract config from xenguest directory"
+            exit 1
+        fi
+
+        if [ -z "${1:-}" ] || [ ! -d ${1} ]; then
+            echo "Error: No destination directory for config extract"
+            exit 1
+        fi
+
+        #extract all but disk files
+        tar -C ${1} --exclude='./disk' -xf ${guestfile}
+        exit 0
+        ;;
+    extract-disk-file)
+        check_image ${guestfile}
+
+        if [ ! -f ${guestfile} ]; then
+            echo "Error: Cannot extract disk file from xenguest directory" >&2
+            exit 1
+        fi
+
+        if [ -z "${1:-}" ]; then
+            echo "Error: No file to extract" >&2
+            exit 1
+        fi
+
+        tar -xOf ${guestfile} ./disk/${1}
+        exit 0
+        ;;
+    create)
+        if [ -f ${guestfile} ]; then
+            echo "Error: File ${guestfile} already exist"
+            exit 1
+        elif [ -d ${guestfile} ]; then
+            if [ -n "$(ls -A ${guestfile})" ]; then
+                echo "Error: Directory ${guestfile} is not empty"
+                exit 1
+            fi
+            IMAGE_TMPDIR=$(realpath -m ${guestfile})
+        else
+            IMAGE_TMPDIR=$(mktemp -d)
+        fi
+
+        # Create initial content
+        params_config_reset
+        xen_config_reset
+        disk_config_reset
+        ;;
+    update)
+        check_image ${guestfile}
+
+        if [ -f ${guestfile} ]; then
+            # Extract the image to update it
+            IMAGE_TMPDIR=$(mktemp -d)
+            tar -C ${IMAGE_TMPDIR} -xf ${guestfile}
+        else
+            IMAGE_TMPDIR=$(realpath -m ${guestfile})
+        fi
+        ;;
+    partial)
+        if [ -e ${guestfile} -a ! -d ${guestfile} ]; then
+            echo "Error: Invalid partial output directory"
+            exit 1
+        fi
+        mkdir -p ${guestfile}
+        IMAGE_TMPDIR=$(realpath -m ${guestfile})
+        ;;
+    *)
+        echo "Invalid action ${action}"
+        usage
+        exit 1
+        ;;
+esac
+
+# Process command line arguments
+for arg in "${@}"; do
+    case ${arg} in
+        --*=*)
+            optarg=$(echo ${arg} | sed -e "s/[^=]*=//")
+            ;;
+        *)
+            optarg=""
+            ;;
+    esac
+
+    case ${arg} in
+        --guest-reset-config)
+            params_config_reset
+            ;;
+        --set-param=*=*)
+            param_name=$(echo $optarg | sed -e "s/=.*//")
+            param_value=$(echo $optarg | sed -e "s/[^=]*=//")
+            params_config_setparam "$param_name" "$param_value"
+            ;;
+        --set-param=*)
+            params_config_setparam "$optarg"
+            ;;
+        --xen-reset-config)
+            xen_config_create
+            ;;
+        --xen-name=*)
+            if [ -z "${optarg}" ]; then
+                xen_config_disable_param "name"
+            else
+                xen_config_set_string "name" "${optarg}"
+            fi
+            ;;
+        --xen-kernel=*)
+            if [ -z "${optarg}" ]; then
+                xen_config_disable_param "kernel"
+                rm -f ${IMAGE_TMPDIR}/files/kernel
+            else
+                if [ ! -f ${optarg} ]; then
+                    echo "Error: invalid kernel file ${optarg}"
+                    exit 1
+                fi
+                xen_config_set_string "kernel" "files/kernel"
+                mkdir -p ${IMAGE_TMPDIR}/files
+                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/kernel
+            fi
+            ;;
+        --xen-memory=*)
+            xen_config_set_number "memory" ${optarg}
+            ;;
+        --xen-vcpus=*)
+            xen_config_set_number "vcpus" ${optarg}
+            ;;
+        --xen-clean-extra)
+            xen_config_set_string "extra" ""
+            ;;
+        --xen-extra=*)
+            xen_config_append_string "extra" ${optarg}
+            ;;
+        --xen-root=*)
+            if [ -z "${optarg}" ]; then
+                xen_config_disable_param "root"
+            else
+                xen_config_set_string "root" "${optarg}"
+            fi
+            ;;
+        --xen-device-tree=*)
+            if [ -z "${optarg}" ]; then
+                xen_config_disable_param "device_tree"
+                rm -f ${IMAGE_TMPDIR}/files/guest.dtb
+            else
+                if [ ! -f ${optarg} ]; then
+                    echo "Error: invalid dtb file ${optarg}"
+                    exit 1
+                fi
+                xen_config_set_string "device_tree" "files/guest.dtb"
+                mkdir -p ${IMAGE_TMPDIR}/files
+                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/guest.dtb
+            fi
+            ;;
+        --xen-disk=*)
+            if [ -z "${optarg}" ]; then
+                xen_config_disable_param "disk"
+            else
+                xen_config_set_list "disk" "phy:${optarg}" "xvda" "w"
+            fi
+            ;;
+        --xen-append=*)
+            if [ ! -f ${optarg} ]; then
+                echo "Error: invalid xen append file ${optarg}"
+                exit 1
+            fi
+            mkdir -p ${IMAGE_TMPDIR}/guest.d
+            install -m 755 ${optarg} ${IMAGE_TMPDIR}/guest.d/.
+            ;;
+        --xen-add-file=*)
+            src=$(echo "${optarg}" | sed -e "s/:.*//")
+            dst=$(echo "${optarg}" | sed -e "s/.*://")
+            if [ ! -f ${src} ]; then
+                echo "Error: Invalid file: ${src}"
+                rm -rf ${IMAGE_TMPDIR}
+                exit 1
+            fi
+            if [ -z "${dst}" ]; then
+                dst=$(basename ${src})
+            fi
+            mkdir -p ${IMAGE_TMPDIR}/files/$(dirname ${dst})
+            cp -f ${src} ${IMAGE_TMPDIR}/files/${dst}
+            ;;
+        --xen-rm-file=*)
+            rm -f ${IMAGE_TMPDIR}/files/${optarg}
+            ;;
+        --init-script=*|--init-pre=*|--init-post=*)
+            dst=""
+            case $arg in
+                --init-script=*)
+                    dst="init.d"
+                    ;;
+                --init-pre=*)
+                    dst="init.pre"
+                    ;;
+                --init-post=*)
+                    dst="init.post"
+                    ;;
+            esac
+            if [ ! -f ${optarg} ]; then
+                echo "${optarg} does not point to a valid file"
+                exit 1
+            else
+                mkdir -p ${IMAGE_TMPDIR}/${dst}
+                install -m 755 ${optarg} ${IMAGE_TMPDIR}/${dst}/.
+            fi
+            ;;
+        --disk-reset-config)
+            disk_config_reset
+            ;;
+        --disk-size=*)
+            sed -i "s/DISK_SIZE=.*/DISK_SIZE=\"${optarg}\"/" \
+                ${IMAGE_TMPDIR}/disk.cfg
+            ;;
+        --disk-device=*)
+            sed -i "s/DISK_DEVICE=.*/DISK_SIZE=\"${optarg}\"/" \
+                ${IMAGE_TMPDIR}/disk.cfg
+            ;;
+        --disk-add-part=*)
+            disk_config_add_part $(echo "${optarg}" | tr ":" " ")
+            ;;
+        --disk-rm-part=*)
+            disk_config_rm_part ${optarg}
+            ;;
+        --disk-add-file=*)
+            src=$(echo "${optarg}" | sed -e "s/:.*//")
+            dst=$(echo "${optarg}" | sed -e "s/.*://")
+            if [ ! -f ${src} ]; then
+                echo "Error: Invalid disk file: ${src}"
+                rm -rf ${IMAGE_TMPDIR}
+                exit 1
+            fi
+            if [ -z "${dst}" ]; then
+                dst=$(basename ${src})
+            fi
+            mkdir -p ${IMAGE_TMPDIR}/disk/$(dirname ${dst})
+            cp -f ${src} ${IMAGE_TMPDIR}/disk/${dst}
+            ;;
+        --disk-rm-file=*)
+            rm -f ${IMAGE_TMPDIR}/disk/${optarg}
+            ;;
+        *)
+            echo "Unsupported command: ${arg}"
+            exit 1
+            ;;
+    esac
+done
+
+if [ ! -d ${guestfile} ]; then
+    # If the original guest was in a file we need to repack the file
+    # with the changes we did on it in the IMAGE_TMPDIR
+    rm -f ${guestfile}
+    tar -C ${IMAGE_TMPDIR} -cf ${guestfile} .
+    rm -rf ${IMAGE_TMPDIR}
+fi
+
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
new file mode 100644
index 0000000..6ea5fb1
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
@@ -0,0 +1,31 @@
+# Xenguest mkimage recipe
+#
+# xenguest-mkimage is a tool to create/modify images to be used as xen guests
+# Produced images contains a xen configuration and several optional components
+# (kernel, device-tree, disk definition and files, init scripts) which all
+# together fully define a full xen guest
+
+DESCRIPTION = "Xenguest mkimage tool"
+LICENSE = "MIT"
+
+SRC_URI = "file://xenguest-mkimage"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+S = "${WORKDIR}"
+
+# Can be built native also to produce xenguest images during Yocto build
+BBCLASSEXTEND = "native"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+    install -d -m 755 ${D}${bindir}
+    install -m 755 xenguest-mkimage ${D}${bindir}/.
+}
+
+# We need bash and tar
+RDEPENDS_${PN} = "bash tar"
+FILES_${PN} = "${bindir}/xenguest-mkimage"
+
-- 
2.17.1

