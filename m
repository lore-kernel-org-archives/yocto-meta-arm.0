Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.59])
 by mx.groups.io with SMTP id smtpd.web10.116.1585847342776611268
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 10:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ubnCP1Oz;
 spf=pass (domain: arm.com, ip: 40.107.3.59, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlr5MzslPsmi2ZSFni1kc3bfVOOrKYW+G6ymlJAlWjc=;
 b=ubnCP1OzQ4BxEM7t6ahbgzJVbHyM/WQvcOPX/RWEgTVSHOv8VNFnBRRHcDT2tT4MLKYHlQ2n2yDkQrc13jp9JX7fEtONa1+o3s0bvkpeONMVsJT0JfDrLBMGzCI2xFJJIInOrwACE2SBsFZEvnzLwhwnviUw2P79xuRj0H8+6do=
Received: from AM6P191CA0053.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::30)
 by AM6PR08MB3350.eurprd08.prod.outlook.com (2603:10a6:209:45::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 2 Apr
 2020 17:08:59 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::d9) by AM6P191CA0053.outlook.office365.com
 (2603:10a6:209:7f::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend
 Transport; Thu, 2 Apr 2020 17:08:59 +0000
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
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:08:59 +0000
Received: ("Tessian outbound 9e48e1321951:v50"); Thu, 02 Apr 2020 17:08:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c30e77f85dd01d2b
X-CR-MTA-TID: 64aa7808
Received: from f5ec575854f6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9412A6D8-88CB-4DED-8FE6-96ED42FF4576.1;
	Thu, 02 Apr 2020 17:08:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5ec575854f6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:08:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvgRNbtDo70fYR8BWeq9RdHeVnSyBVLNHxuBzzksn9NHsNfDKDBN2+HV1jSVXjuTLVQDg6XW8KAtu+6iBDf73iYgCWK5qyn9OnM/Aj6SNp40+Dpq5siNE2BSDdwSqpz8D7Wocqzf7YMsrXQDuCRszCTaVCRDuOwiLvk6/qTCENe/JUzWD+Z96rM3CUn91ViPN5+dK2BXL9wdIrkHirxbD1Z6pulU4DPp3Dht8XjV6l8wcm53IwnVNPoq369OvMCSC3uZHWwCG6ow+yKpnd5KjAeDETbmdU8vgvdoLKAgSOgEJnxsPh6kP9ZzWALWbv4ShTG+Q4Nteu/Ftd/hjOO0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlr5MzslPsmi2ZSFni1kc3bfVOOrKYW+G6ymlJAlWjc=;
 b=UyuRdZJJZP+lF+snyli5L34tY0gVcha5MZkf2ZGLp3rMtqXx2u8ekq/yq0cHBW67sFt6yRCQGgET4JMCrlTOtoVqV/0y6jK6UbV2S8eNCFiKWoUeFWueoK5sTTt9AYsOk9dulmdaTv+AbjJvVWpbrrL/h+HfhntyvxxiR3F990g0MZ/75H4NDSY3SGkpt7hXfuOOnMZcLbR58DDeeThVeDmqfZfrZyVNlxzZk76jONxzHuN4hqnk+iMhh+ISbB5faC9AFFh8HM5qt9rSi5nl3g/BozRJfirnLcZjqExDHjJ71c68dSjiWtAAoCcXc/HBCKOBbbP9E3+eaVCMiksLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlr5MzslPsmi2ZSFni1kc3bfVOOrKYW+G6ymlJAlWjc=;
 b=ubnCP1OzQ4BxEM7t6ahbgzJVbHyM/WQvcOPX/RWEgTVSHOv8VNFnBRRHcDT2tT4MLKYHlQ2n2yDkQrc13jp9JX7fEtONa1+o3s0bvkpeONMVsJT0JfDrLBMGzCI2xFJJIInOrwACE2SBsFZEvnzLwhwnviUw2P79xuRj0H8+6do=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3801.eurprd08.prod.outlook.com (20.178.46.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Thu, 2 Apr 2020 17:08:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 17:08:52 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 2/7] arm-autonomy: Create xenguest-manager
Date: Thu,  2 Apr 2020 18:08:11 +0100
Message-Id: <20200402170816.8818-3-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::26) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.53) by PN1PR01CA0086.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Thu, 2 Apr 2020 17:08:50 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 50df84eb-dc27-406b-0cd0-08d7d728892d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3801:|AM6PR08MB3350:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3350F468D9CC300EB1D930329DC60@AM6PR08MB3350.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;OLM:1169;
X-Forefront-PRVS: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(8936002)(5660300002)(66556008)(44832011)(2906002)(4326008)(66946007)(30864003)(8676002)(66476007)(6666004)(6916009)(26005)(186003)(1076003)(81166006)(316002)(52116002)(478600001)(86362001)(6486002)(7696005)(956004)(2616005)(16526019)(81156014)(36756003);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4uxjqDDoUE81qve+4wzeIZpdGE76Wu6pY4L0txwnsKuHqTiA5lMg5luOjlv9K/9YjIrKQI501bf2ftkzQYHCFR5Qo46DQdBBKwlC9zklOCcD5O5iSwR3h6bhzMrmeseMrO7UxHFfgHXZzwy4w7bo1KNS1+gEJ1qOb1F+Flor1oukCjpy3Rghx68MAMVEVTnEoUtc9YSOq2iiZ0kxobMUc1zoDltE5rL9p3ljIij2ZiiREu2+EIzD5K3WNOKfDDftbLNLM7qATMmou72QLGm0OpVfniXzlGvm5d9WeaAZJJas1yDDSdGz9CaTi1kjoYAfLpdpTuZAXfD+CS/E6b5YI3G41sXRQOeO0SSBShaaVriVODjGfKL1PsEwtbC2EkeMjjxttHTpp9ev9qKsqwZBiCImgtrDme+MFlQE1pNq6pRmJBZXww8VWnot5eI5wJx4gh0Q5P2BGte+3b/BAO9iZhh9kErzIE/Kv1bxhzjlvYAxh+zWs9nCBmMP87d7tBTsfL+9QgzLeUC+cSjU0kCujuO4LidU+A1j1f4sj5da3qagrZtb1jYtE5Daee4wjvW8LrKHgAnpP+tqThKWwskJwMXnKPTltiSp4NrFx+k8Gl20f7jcps0HV0j1b4aqt4JSSWvqDjIYgXASKZ64b5tBJg==
X-MS-Exchange-AntiSpam-MessageData: 
 W3U6CGRj6b4UCLJO00tqAacDN050r+i/yZhAJ2C4yKKi+4IVD93NK6UDeS0oy0rgU8tOqop8S9xkBUr3u3Ms6aJKSv0BN5sT4ZSvFyVh+qE/FnuVfBtePBGOv6dk3DoIuNzkvUbfoz2uZeXTZhtGxg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3801
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(6916009)(26826003)(478600001)(86362001)(82740400003)(6486002)(1076003)(7696005)(356004)(956004)(186003)(16526019)(70206006)(6666004)(8936002)(70586007)(2906002)(336012)(30864003)(47076004)(36756003)(36906005)(81156014)(4326008)(26005)(2616005)(5660300002)(44832011)(8676002)(316002)(81166006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9d7c84e4-688e-4e75-82ab-08d7d7288469
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z6/033QzqjYzEw5xNc6s0nW4tloiiJ8kLDoR+W0WoEqzlX9U9dyS1OJc7w8mDLr36SwifezLN8zbN8QGrVvtL6uaCRT24TSvsNINmxEW8K5H8aiyhNIuaN5fC6ZpsP0SI9NoWKSUTen73rxDACczZXoJwOPq9lNsxnV7wH7NK4dpOPIGe+eDg6uPPeUS2GFjjH/V7hP6a/iaFEgJttm+MJTQiV7g5LbhAlHio7eQZ4aXl0icvyx/UpVLyZH7Mkl68yRcYGOYp08wloT1hbY+pT7pgr2ZxB9cDKFpwbtvVO+AXl9Qf3Qka8pVEJc9Dsoj6M7eI+KJjTkqkrqh4wY15TFwleC32lso6wQ2PwtEai2YEJQasR6M3kzWECJL6Xn7Xi41wjBgd1Pdtk+nw7K1CddkzznBWqycBK1jB39EpoMj0qcWCjKCnawFJe1Pq3O9mrcHWSK9RR+9qvRnztLIDdr1ozMw3vocjCjNiv4pLluic7V9zA41apyd/2tJ/R0t3SxWN1Rr8QileUqBxPR8WAFAS85bxubRBkBY1dofizyHM6DutwfkGNkYV9rSybRAGD9ktxbhsIN4ZBsGMkHmUKVmEloF5TSMpLzm8fRdD1k4Ne3oDeoxe+JEbzuEEYV28d5Io1x85ELoTP5UId8emmGuBwM+2OWBSTV+8rt+XAW+fYUuePoqxC7GKy+HwT0Zv5ErSCXSVkllTNJLVbIJ/Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:08:59.5528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50df84eb-dc27-406b-0cd0-08d7d728892d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3350
Content-Type: text/plain

Add xenguest-manager to handle xenguest image based guests:
- create guest (use LVM to create disks for guests)
- start/stop guests
- provide init script to have guest auto started on boot
- add documentation

Change-Id: I5319ecb77f3aa9f8c1aff4891c05973288156f11
Issue-Id: SCM-767
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 meta-arm-autonomy/README.md                   |   4 +
 .../documentation/xenguest-manager.md         |  67 ++
 .../images/arm-autonomy-host-image-minimal.bb |   1 +
 .../xenguest/files/xenguest-init              |  85 +++
 .../xenguest/files/xenguest-manager           | 640 ++++++++++++++++++
 .../xenguest/xenguest-manager.bb              |  52 ++
 .../xenguest/xenguest-manager.bbappend        |   6 +
 7 files changed, 855 insertions(+)
 create mode 100644 meta-arm-autonomy/documentation/xenguest-manager.md
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
 create mode 100755 meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index 560a783..93b5723 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -41,6 +41,7 @@ its documentation.
 
 Those documentation files should be checked for variables:
 - [xen-devicetree](documentation/xen-devicetree.md)
+- [xenguest-manager](documentation/xenguest-manager.md)
 
 BSPs
 ----
@@ -70,6 +71,9 @@ This layer is adding the following recipes and classes:
 * [xenguest-mkimage](documentation/xenguest-mkimage.md): this is a tool to
   create and modify images to be used as Xen guests.
 
+* [xenguest-manager](documentation/xenguest-manager.md): this is a tool to
+  create/remove/start/stop xen guest generated using xenguest-mkimage.
+
 Contributing
 ------------
 This project has not put in place a process for contributions currently. If you
diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md b/meta-arm-autonomy/documentation/xenguest-manager.md
new file mode 100644
index 0000000..387af94
--- /dev/null
+++ b/meta-arm-autonomy/documentation/xenguest-manager.md
@@ -0,0 +1,67 @@
+Xenguest Manager
+================
+
+Introduction
+------------
+
+xenguest-manager is a tool to manage Xenguest images generated by
+[xenguest-mkimage](xenguest-mkimage.md).
+
+On a Xen Dom0 system it will:
+- create a xen guest from a xenguest image: extract its components, create a
+  disk for the guest using LVM volumes.
+- start/stop a xen guest (during init or using xenguest-manager directly).
+- check guest status
+
+xenguest-manager is composed of 2 shell scripts:
+- xenguest-manager which can be used from command line to start/stop/check
+guests and create or remove guest using xenguest images.
+- xenguest-init which is called during init to automatically create and start
+some guests as part of the host init process.
+
+Usage
+-----
+
+xenguest-manager must be called like this:
+`xenguest-manager OPERATION [OPTIONS]`
+The following operations are available:
+- create XENGUEST_IMAGE [GUESTNAME]: create a guest from a xenguest image file
+  as guest GUESTNAME. If GUESTNAME is not given the image file name is used
+  without the xenguest extension.
+- remove GUESTNAME: remove the guest GUESTNAME.
+- start GUESTNAME: start the guest GUESTNAME.
+- stop GUESTNAME: stop the guest GUESTNAME (this is using `xl stop` which is
+  sending a stop signal to the running guest).
+- kill GUESTNAME: force stopping the guest GUESTNAME.
+- list: list the available guests.
+- status [GUESTNAME]: print the current status of GUESTNAME. If GUESTNAME is
+  not given, print the status of all guests.
+
+For a detailed help on available options please use:
+`xenguest-manager --help`
+
+Bitbake parameters
+------------------
+
+Several parameters are available to configure the xenguest manager during Yocto
+project compilation (those can be set in your project local.conf, for example).
+
+The following parameters are available:
+
+- XENGUEST_MANAGER_VOLUME_DEVICE: This is the device path used by the 
+  xenguest-manager on the device to create LVM disks when guests have a disk
+  configuration.
+  This is set by default to "/dev/sda2".
+
+- XENGUEST_MANAGER_VOLUME_NAME: This is the LVM volume name that the 
+  xenguest-manager will create and use to create guest LVM disks.
+  This is set by default to "vg-xen".
+
+- XENGUEST_MANAGER_GUEST_DIR: This is the directory on Dom0 where the 
+  xenguest-manager will look for xenguest images to create during init. That's
+  the place where xenguest images can be added to have them automatically
+  created during next Dom0 boot. The xenguests found there will only be created
+  if they were not already before (the basename of the files is used as guest
+  name).
+  This is set by default to "/usr/share/guests".
+
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 5e09eac..ffe5bce 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -16,6 +16,7 @@ IMAGE_INSTALL += " \
     kernel-modules \
     xen-base \
     qemu \
+    xenguest-manager \
     "
 
 # Build xen-devicetree to produce a xen ready devicetree
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
new file mode 100755
index 0000000..9563d2f
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
@@ -0,0 +1,85 @@
+#!/bin/bash
+#
+# xenguest Init Script to start and stop xenguests during boot
+#
+
+XENGUEST_CONF_BASE="/etc/xenguest"
+
+if [ ! -f ${XENGUEST_CONF_BASE}/xenguest-manager.conf ]; then
+    echo "No xenguest manager configuration !!"
+    exit 1
+fi
+
+source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
+
+# Create guest list
+guestlist=$(/usr/bin/xenguest-manager list)
+
+# Unconfigured guests
+
+case "$1" in
+  start)
+        echo "Starting xenguest"
+
+        # Create unconfigured guests
+        if [ -d ${XENGUEST_GUEST_DIR} ]; then
+            for f in $(find ${XENGUEST_GUEST_DIR} -name "*.xenguest" \
+                -exec basename {} .xenguest \;); do
+                if [ ! -f ${XENGUEST_CONF_BASE}/guests/${f}/guest.cfg ]; then
+                    # Check if this guest should be auto booted
+                    autoboot=$(/usr/bin/xenguest-mkimage dump-paramsconfig \
+                        ${XENGUEST_GUEST_DIR}/${f}.xenguest | \
+                        grep GUEST_AUTOBOOT | sed -e "s,.*=,," | tr -d '"')
+                    if [ "$autoboot" = "0" ]; then
+                        echo "Do not create $f, autoboot disabled"
+                    else
+                        /usr/bin/xenguest-manager create \
+                            ${XENGUEST_GUEST_DIR}/${f}.xenguest
+                        # Update guestlist
+                        if [ $? -eq 0 ]; then
+                            guestlist="${guestlist} ${f}"
+                        fi
+                    fi
+                fi
+            done
+        fi
+        if [ -n "${guestlist}" ]; then
+            for f in ${guestlist}; do
+                GUEST_AUTOBOOT="1"
+                if [ -f ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg ]; then
+                    source ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg
+                fi
+                if [ "${GUEST_AUTOBOOT}" = "1" ]; then
+                    /usr/bin/xenguest-manager start ${f}
+                fi
+            done
+        else
+            echo "No guest configured"
+        fi
+        ;;
+  status)
+        true
+        ;;
+  stop)
+        echo "Stopping xenguest"
+        for f in ${guestlist}; do
+            /usr/bin/xenguest-manager stop ${f}
+        done
+        ;;
+  reload)
+        echo >&2 'Reload not available; use force-reload'; exit 1
+        ;;
+  force-reload|restart)
+        echo "Restarting xenguest"
+        $0 stop
+        $0 start
+        ;;
+  *)
+        # do not advertise unreasonable commands that there is no reason
+        # to use with this device
+        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
+        exit 1
+esac
+
+exit $?
+
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
new file mode 100755
index 0000000..1daebc1
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -0,0 +1,640 @@
+#!/bin/bash
+# This script manages xenguest
+#
+set -u
+this="$0"
+
+XENGUEST_CONF_BASE="/etc/xenguest"
+LOGFILE="/var/log/xenguest"
+
+if [ ! -f ${XENGUEST_CONF_BASE}/xenguest-manager.conf ]; then
+    echo "Cannot find xenguest manager configuration"
+    exit 1
+fi
+
+# Following variables must be set in configuration:
+# XENGUEST_VOLUME_DEVICE: device to use for lvm
+# XENGUEST_VOLUME_NAME: lvm volume name to create on device
+source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
+
+PREF="xenguest:"
+
+if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
+    ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
+    echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
+    exit 1
+fi
+
+if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
+    echo "${PREF} No volume name in configuration, using vg-xen..."
+    XENGUEST_VOLUME_NAME="vg-xen"
+fi
+
+function usage() {
+    cat <<EOF
+Usage $this ACTION [OPTIONS]
+
+with ACTION being one of:
+ help
+   Display this help
+
+ create GUESTFILE [GUESTNAME]
+   Create a guest using xenguest image GUESTFILE and name it GUESTNAME.
+   This will extract and configure the guest and will also create the guest
+   disk if guest has one configured.
+   GUESTNAME is set to the basename of GUESTFILE if unspecified.
+   GUESTNAME guest must not exist
+
+ remove GUESTNAME
+   Remove GUESTNAME and destroy its disk (if it has one)
+
+ start GUESTNAME
+   Start guest GUESTNAME
+
+ stop|shutdown GUESTNAME
+   Stop guest GUESTNAME (send stop signal and let it shutdown normally)
+
+ kill|destroy GUESTNAME
+   Kill guest GUESTNAME (stop directly the guest without signaling it)
+
+ list
+   List configured guests
+
+ status
+   List guests and their current status (running or stopped)
+EOF
+}
+
+function xenguest_volume_init()
+{
+    pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
+        echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
+        pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            echo "${PREF} Error"
+            exit 1
+        fi
+    fi
+    vgs ${XENGUEST_VOLUME_NAME} > /dev/null 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Create ${XENGUEST_VOLUME_NAME} volume"
+        echo "vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE}" \
+            >> ${LOGFILE} 2>&1
+        vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE} \
+            >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            echo "${PREF} Error"
+            exit 1
+        fi
+    fi
+}
+
+# Detach a disk we attached to xen
+function xenguest_detach_disk()
+{
+    echo "xl block-detach 0 \$\(xl block-list 0 | " \
+        "grep \"domain/0\" | awk '{print \$1}'\)" \
+            >> ${LOGFILE} 2>&1
+    xl block-detach 0 $(xl block-list 0 | \
+        grep "domain/0" | awk '{print $1}') \
+        >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Error detaching partition ${part}"
+        exit 1
+    fi
+}
+
+function xenguest_disk_init()
+{
+    guestname="$1"
+    guestfile="$2"
+    devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
+
+    source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
+
+    if [ ${DISK_SIZE:-0} -eq 0 ]; then
+        echo "${PREF} No disk for ${guestname}"
+        return
+    fi
+
+    echo "${PREF} Create ${guestname} disk"
+
+    # Init our volume
+    xenguest_volume_init
+
+    echo "${PREF} Create hard drive for ${guestname}"
+
+
+    # Remove volume if it already exist
+    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE} 2>&1
+    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
+    if [ $? -eq 0 ]; then
+        echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
+        lvremove -y ${devname} >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            echo "${PREF} Error removing volume ${guestname}"
+            exit 1
+        fi
+    fi
+
+    # Create volume
+    echo "lvcreate -y -L ${DISK_SIZE}G -n ${guestname} ${XENGUEST_VOLUME_NAME}" \
+        >> ${LOGFILE} 2>&1
+    lvcreate -y -L ${DISK_SIZE}G -n ${guestname} ${XENGUEST_VOLUME_NAME} \
+        >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Error creating volume ${guestname}"
+        exit 1
+    fi
+
+    # Add partition table
+    echo "parted -s ${devname} mklabel msdos" >> ${LOGFILE} 2>&1
+    parted -s ${devname} mklabel msdos >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Error creating partition table on ${guestname}"
+        exit 1
+    fi
+
+    # Setup disk name in xen configuration
+    echo "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}" \
+        "--xen-disk=${devname}" >> ${LOGFILE} 2>&1
+    xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname} \
+        --xen-disk=${devname} >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Error setting disk in xen configuration"
+        exit 1
+    fi
+
+    # Create partitions
+    partstart="0"
+
+    # For each partition X the disk.cfg file should set a variable DISK_PARTX
+    # with a : separated list defining the partition:
+    # DISK_PART3="4:ext4:disk.tgz" means that partition 3 should be 4G formated
+    # with ext4 and initialized with the content of disk.tgz
+    for part in $(seq 1 4); do
+        eval partdesc="\${DISK_PART${part}:-0}"
+        size=$(echo ${partdesc} | sed -e "s/\(.*\):.*:.*/\1/")
+        fstype=$(echo ${partdesc} | sed -e "s/.*:\(.*\):.*/\1/")
+        content=$(echo ${partdesc} | sed -e "s/.*:.*:\(.*\)/\1/")
+
+        if [ "${size}" -ne 0 ]; then
+            # Size is expressed in GB, pass it in MB
+            size=$(expr ${size} \* 1024)
+            partend=$(expr ${partstart} + ${size})
+
+            # Let first MB of disk free for partition table
+            if [ ${partstart} -eq 0 ]; then
+                partstart="1"
+            fi
+
+            # Create partition
+            echo "parted -s ${devname} unit MB mkpart primary ${partstart}" \
+                "${partend}" >> ${LOGFILE} 2>&1
+            parted -s ${devname} unit MB mkpart primary ${partstart} \
+                ${partend} >> ${LOGFILE} 2>&1
+            if [ $? -ne 0 ]; then
+                echo "${PREF} Error adding partition ${part}"
+                exit 1
+            fi
+
+            # Set next partition start to current partition end
+            partstart="${partend}"
+
+            # Sync to see the created partition
+            echo "sync" >> ${LOGFILE} 2>&1
+            sync >> ${LOGFILE} 2>&1
+
+            # Prepare format command
+            if [ -n "${fstype}" ]; then
+                case ${fstype} in
+                    vfat|ext2|ext3|ext4)
+                        formatcmd="mkfs.${fstype} -F"
+                        ;;
+                    swap)
+                        formatcmd="mkswap"
+                        ;;
+                    *)
+                        echo "${PREF} partition ${part} of ${guestname}" \
+                            "fstype is invalid: ${fstype}"
+                        exit 1
+                        ;;
+                esac
+            else
+                formatcmd=""
+            fi
+
+            # Attach disk to xen
+            echo "xl block-attach 0 phy:${devname} xvda w" >> ${LOGFILE} 2>&1
+            xl block-attach 0 phy:${devname} xvda w >> ${LOGFILE} 2>&1
+            if [ $? -ne 0 ]; then
+                echo "${PREF} Error attaching partition ${part}"
+                exit 1
+            fi
+
+            # Sometimes it takes time to see the device
+            if [ ! -b /dev/xvda${part} ]; then
+                sleep 1
+            fi
+            if [ ! -b /dev/xvda${part} ]; then
+                echo "${PREF} Partition ${part} creation error"
+                xenguest_detach_disk
+                exit 1
+            fi
+
+            if [ -n "${formatcmd}" ]; then
+                echo "${formatcmd} /dev/xvda${part}" >> ${LOGFILE} 2>&1
+                ${formatcmd} /dev/xvda${part}
+                if [ $? -ne 0 ]; then
+                    echo "${PREF} Cannot create partition ${part} FS"
+                    xenguest_detach_disk
+                    exit 1
+                fi
+            fi
+
+            case ${content} in
+                *.img)
+                    # dd into partition
+                    echo "xenguest-mkimage extract-disk-file ${guestfile} " \
+                        "${content} | dd of=/dev/xvda${part} " >> ${LOGFILE} 2>&1
+                    xenguest-mkimage extract-disk-file ${guestfile} ${content} \
+                        | dd of=/dev/xvda${part} >> ${LOGFILE} 2>&1
+                    if [ $? -ne 0 ]; then
+                        echo "${PREF} Cannot populate partition ${part}"
+                        xenguest_detach_disk
+                        exit 1
+                    fi
+                    ;;
+                *.tar*)
+                    tararg=""
+                    case ${content} in
+                        *.tar.gz)
+                            tararg="z"
+                            ;;
+                        *.tar.bz2)
+                            tararg="j"
+                            ;;
+                        *.tar.xz)
+                            tararg="J"
+                            ;;
+                        *.tar)
+                            tararg=""
+                            ;;
+                        *)
+                            # invalid/unknown tar type
+                            echo "${PREF} Invalid file format in disk ${content}"
+                            xenguest_detach_disk
+                            exit 1
+                            ;;
+                    esac
+
+                    # must mount the partition and extract
+                    mntdir=$(mktemp -d)
+                    echo "mount /dev/xvda${part} ${mntdir}" >> ${LOGFILE} 2>&1
+                    mount /dev/xvda${part} ${mntdir} >> ${LOGFILE} 2>&1
+                    if [ $? -ne 0 ]; then
+                        echo "${PREF} Cannot mount partition ${part}"
+                        xenguest_detach_disk
+                        rm -rf ${mntdir}
+                        exit 1
+                    fi
+
+                    # tar and unmount
+                    echo "xenguest-mkimage extract-disk-file ${guestfile}" \
+                        "${content} | tar -C ${mntdir} -x${tararg}f - " \
+                            >> ${LOGFILE} 2>&1
+                    xenguest-mkimage extract-disk-file ${guestfile} ${content} \
+                        | tar -C ${mntdir} -x${tararg}f - >> ${LOGFILE} 2>&1
+                    if [ $? -ne 0 ]; then
+                        echo "${PREF} Cannot populate partition ${part}"
+                        umount ${mntdir}
+                        rm -rf ${mntdir}
+                        xenguest_detach_disk
+                        exit 1
+                    fi
+                    echo "umount ${mntdir}" >> ${LOGFILE} 2>&1
+                    umount ${mntdir} >> ${LOGFILE} 2>&1
+                    if [ $? -ne 0 ]; then
+                        echo "${PREF} Error unmounting ${part}"
+                        xenguest_detach_disk
+                        rm -rf ${mntdir}
+                        exit 1
+                    fi
+                    rm -rf ${mntdir}
+                    ;;
+                *)
+                    #invalid content type
+                    ;;
+            esac
+
+            # Detach disk
+            xenguest_detach_disk
+        fi
+    done
+
+}
+
+function xenguest_guest_create()
+{
+    guestfile="$1"
+    guestname="$2"
+
+    # extract xenguest tar
+    # put xen config in etc ?
+    # if disk config file:
+    #  disk init
+    #  add partititions
+
+    echo "${PREF} Create ${guestname} using ${guestfile}"
+    rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
+    mkdir -p ${XENGUEST_CONF_BASE}/guests/${guestname}
+
+    echo "xenguest-mkimage extract-config ${guestfile}" \
+        "${XENGUEST_CONF_BASE}/guests/${guestname}" >> ${LOGFILE} 2>&1
+    xenguest-mkimage extract-config ${guestfile} \
+        ${XENGUEST_CONF_BASE}/guests/${guestname} >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Error extracting guest image"
+        exit 1
+    fi
+
+    # Set guest name inside config
+    echo "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}" \
+        "--xen-name=${guestname}" >> ${LOGFILE} 2>&1
+    xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname} \
+        --xen-name=${guestname} >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Error setting guest name"
+        exit 1
+    fi
+
+    xenguest_disk_init ${guestname} ${guestfile}
+}
+
+function xenguest_guest_remove()
+{
+    guestname="$1"
+    devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
+
+    # check if guest had a volume
+    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE} 2>&1
+    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
+    if [ $? -eq 0 ]; then
+        # Remove guest volume
+        echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
+        lvremove -y ${devname} >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            echo "${PREF} Error removing volume ${guestname}"
+            exit 1
+        fi
+    fi
+
+    # remove guest files
+    rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
+}
+
+function xenguest_guest_start()
+{
+    guestname="${1}"
+    guestdir=${XENGUEST_CONF_BASE}/guests/${guestname}
+
+    # Get guest configuration
+    source ${guestdir}/params.cfg
+
+    pushd ${guestdir} > /dev/null 2>&1
+
+    # create config by merging all configurations together
+    cat guest.cfg $(find guest.d -type f 2> /dev/null) > ${guestname}.cfg
+
+    # Build init script lists (ignore non existing dirs errors,
+    # sort alphabetically and run global scripts first)
+    init_pre="$(find ${XENGUEST_CONF_BASE}/init.pre -type f 2> /dev/null | \
+            sort) $(find ${guestdir}/init.pre -type f 2> /dev/null | sort)"
+    init_d="$(find ${XENGUEST_CONF_BASE}/init.d -type f 2> /dev/null | \
+            sort) $(find ${guestdir}/init.d -type f 2> /dev/null | sort)"
+    init_post="$(find ${XENGUEST_CONF_BASE}/init.post -type f 2> /dev/null | \
+            sort) $(find ${guestdir}/init.post -type f 2> /dev/null | sort)"
+
+    # call pre init scripts
+    for f in ${init_pre}; do
+        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
+        $f ${guestname} >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            rm -f ${guestname}.cfg
+            popd > /dev/null 2>&1
+            echo "${PREF} Error during pre init script of ${guestname}"
+            exit 1
+        fi
+    done
+
+    # Create non started guest
+    echo "xl create -p ${guestname}.cfg" >> ${LOGFILE} 2>&1
+    xl create -p ${guestname}.cfg >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        rm -f ${guestname}.cfg
+        popd > /dev/null 2>&1
+        echo "${PREF} Error starting ${guestname}"
+        exit 1
+    fi
+
+    # call init scripts
+    for f in ${init_d}; do
+        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
+        $f ${guestname} >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            rm -f ${guestname}.cfg
+            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
+            xl destroy ${guestname} >> ${LOGFILE} 2>&1
+            popd > /dev/null 2>&1
+            echo "${PREF} Error during init script of ${guestname}"
+            exit 1
+        fi
+    done
+
+    # Start guest
+    echo "xl unpause ${guestname}" >> ${LOGFILE} 2>&1
+    xl unpause ${guestname} >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        rm -f ${guestname}.cfg
+        popd > /dev/null 2>&1
+        echo "${PREF} Error starting ${guestname}"
+        exit 1
+    fi
+
+    # call post init scripts
+    for f in ${init_post}; do
+        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
+        $f ${guestname} >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            rm -f ${guestname}.cfg
+            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
+            xl destroy ${guestname} >> ${LOGFILE} 2>&1
+            popd > /dev/null 2>&1
+            echo "${PREF} Error during post init script of ${guestname}"
+            exit 1
+        fi
+    done
+
+    rm -f ${guestname}.cfg
+    popd > /dev/null 2>&1
+}
+
+function xenguest_guest_stop()
+{
+    guestname="${1}"
+    echo "xl shutdown ${guestname}" >> ${LOGFILE} 2>&1
+    xl shutdown ${guestname} >> ${LOGFILE} 2>&1
+    if [ $? -ne 0 ]; then
+        echo "${PREF} Error stopping ${guestname}"
+        exit 1
+    fi
+}
+
+function check_guest_arg()
+{
+    cmd="${1}"
+    guestname="${2:-}"
+    if [ -z "${guestname:-}" ]; then
+        echo "${PREF} Usage ${this} ${cmd} GUESTNAME"
+        exit 1
+    fi
+}
+
+function check_guest_exist()
+{
+    guestname="${1}"
+    if [ ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg -o \
+        ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/params.cfg ]; then
+        echo "${PREF} Invalid guest name: ${guestname}"
+        exit 1
+    fi
+}
+
+function check_guest_running()
+{
+    guestname="${1}"
+    running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" || echo)
+    if [ ! "${running}" = "${guestname}" ]; then
+        echo "${PREF} Guest ${guestname} is not running"
+        exit 1
+    fi
+}
+
+function check_guest_not_running()
+{
+    guestname="${1}"
+    running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" || echo)
+    if [ "${running}" = "${guestname}" ]; then
+        echo "${PREF} Guest ${guestname} is running"
+        exit 1
+    fi
+}
+
+cmd="${1:-help}"
+arg1="${2:-}"
+arg2="${3:-}"
+
+case ${cmd} in
+    help|--help|-h|-?)
+        usage
+        exit 0
+        ;;
+    create)
+        guestfile="${arg1}"
+        guestname="${arg2}"
+        if [ -z "${guestfile}" -o ! -f "${guestfile}" ]; then
+            echo "${PREF} Usage ${this} create XENGUEST_FILE [NAME]"
+            exit 1
+        fi
+        if [ -z "${guestname}" ]; then
+            guestname=$(basename ${guestfile} .xenguest)
+        fi
+
+        if [ -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg ]; then
+            # Guest already exist
+            echo "${PREF} A guest ${guestname} already exist"
+            exit 1
+        fi
+
+        xenguest_guest_create ${guestfile} ${guestname}
+        ;;
+    remove)
+        guestname="${arg1:-}"
+        check_guest_arg ${cmd} ${guestname}
+        check_guest_exist ${guestname}
+        # We need to stop the guest first
+        running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" \
+            || echo)
+        if [ "${running}" = "${guestname}" ]; then
+            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
+            xl destroy ${guestname} >> ${LOGFILE} 2>&1
+            if [ $? -ne 0 ]; then
+                echo "${PREF} Error killing ${guestname}"
+                exit 1
+            fi
+        fi
+        xenguest_guest_remove ${guestname}
+        ;;
+    start)
+        guestname="${arg1:-}"
+        check_guest_arg ${cmd} ${guestname}
+        check_guest_exist ${guestname}
+        check_guest_not_running ${guestname}
+        xenguest_guest_start ${guestname}
+        ;;
+    stop|shutdown)
+        guestname="${arg1:-}"
+        check_guest_arg ${cmd} ${guestname}
+        check_guest_exist ${guestname}
+        check_guest_running ${guestname}
+        xenguest_guest_stop ${guestname}
+        ;;
+    kill|destroy)
+        guestname="${arg1:-}"
+        check_guest_arg ${cmd} ${guestname}
+        check_guest_exist ${guestname}
+        check_guest_running ${guestname}
+        echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
+        xl destroy ${guestname} >> ${LOGFILE} 2>&1
+        if [ $? -ne 0 ]; then
+            echo "${PREF} Error killing ${guestname}"
+            exit 1
+        fi
+        ;;
+    list)
+        if [ -d ${XENGUEST_CONF_BASE}/guests ]; then
+            for f in $(find ${XENGUEST_CONF_BASE}/guests -mindepth 1 \
+                -maxdepth 1 -type d -exec basename {} \;); do
+                if [ -f ${XENGUEST_CONF_BASE}/guests/$f/guest.cfg ]; then
+                    echo "$f"
+                fi
+            done
+        fi
+        ;;
+    status)
+        guestname="${arg1}"
+        if [ -n "${guestname}" ]; then
+            check_guest_exist ${guestname}
+            if xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" > \
+                /dev/null 2>&1; then
+                echo "${guestname}: Running"
+            else
+                echo "${guestname}: Stopped"
+            fi
+        else
+            guestlist=$($this list)
+            if [ -n "${guestlist}" ]; then
+                for f in ${guestlist}; do
+                    $this status $f
+                done
+            fi
+        fi
+        ;;
+    *)
+        echo "${PREF} Invalid argument ${cmd}"
+        exit 1
+        ;;
+esac
+
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
new file mode 100644
index 0000000..9affae9
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -0,0 +1,52 @@
+# Xenguest manager recipe
+#
+# xenguest-manager is a tool to control xen guest (e.g. create, start, stop)
+#
+
+DESCRIPTION = "Xen Guest Manager"
+LICENSE = "MIT"
+
+SRC_URI = " \
+    file://xenguest-manager \
+    file://xenguest-init \
+    "
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+S = "${WORKDIR}"
+
+# Please refer to documentation/xenguest-manager.md for documentation on those
+# parameters
+XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda2"
+XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen"
+XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
+
+# We add an init script to create and start guests automatically
+INITSCRIPT_NAME = "xenguest"
+INITSCRIPT_PARAMS = "defaults 90"
+
+inherit update-rc.d
+
+do_compile() {
+    echo "XENGUEST_VOLUME_DEVICE=\"${XENGUEST_MANAGER_VOLUME_DEVICE}\"" > \
+        xenguest-manager.conf
+    echo "XENGUEST_VOLUME_NAME=\"${XENGUEST_MANAGER_VOLUME_NAME}\"" >> \
+        xenguest-manager.conf
+    echo "XENGUEST_GUEST_DIR=\"${XENGUEST_MANAGER_GUEST_DIR}\"" >> \
+        xenguest-manager.conf
+}
+
+do_install() {
+    install -d -m 755 ${D}${bindir}
+    install -m 755 xenguest-manager ${D}${bindir}/.
+    install -d -m 755 ${D}${sysconfdir}/xenguest
+    install -m 644 xenguest-manager.conf ${D}${sysconfdir}/xenguest/.
+    install -d -m 755 ${D}${sysconfdir}/init.d
+    install -m 755 xenguest-init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+    install -d -m 755 ${D}${XENGUEST_GUEST_DIR}
+}
+
+# Things that we need on the target
+RDEPENDS_${PN} += "bash tar xenguest-mkimage lvm2 xen-xl parted e2fsprogs"
+
+FILES_${PN} += "${bindir}/xenguest-manager \
+               ${sysconfdir}/xenguest"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend
new file mode 100644
index 0000000..874cfed
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend
@@ -0,0 +1,6 @@
+# Board specific configuration for the manager
+
+# FVP and Foundation are using vda as hard drive and partition 2 is the
+# default rootfs, so use vda3 for guest lvm
+XENGUEST_MANAGER_VOLUME_DEVICE_foundation-armv8 ?= "/dev/vda3"
+XENGUEST_MANAGER_VOLUME_DEVICE_fvp-base ?= "/dev/vda3"
-- 
2.17.1

