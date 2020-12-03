Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.59])
 by mx.groups.io with SMTP id smtpd.web12.8954.1606996984601622215
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Dec 2020 04:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=h7noioGh;
 spf=pass (domain: arm.com, ip: 40.107.2.59, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/FX1+cBkG362DKLpb/EUW9+OzXo0ou3qm1dy7nqkDs=;
 b=h7noioGhcZOB6XvXDZ7irpq1klriONNmjcmwBEdNuKzH28rZAewwxNzY1ciSKBswfJc7TmsYDQi5Wih4KCOh79OwdPLUDwo61fq1V0e6LhQk45JUlWvfiUJOjgf/LKA1FrGJG+Ppoe5EvdC+4Ob2zVyGK10e7YKesPO5089J6j0=
Received: from AM6PR10CA0090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::31)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 12:03:02 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::4e) by AM6PR10CA0090.outlook.office365.com
 (2603:10a6:209:8c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 12:03:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:03:01 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71"); Thu, 03 Dec 2020 12:03:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 757e56c4774dffe5
X-CR-MTA-TID: 64aa7808
Received: from 069553d3664c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DA296EF8-76F1-4129-9BDC-4EECDBE4BF58.1;
	Thu, 03 Dec 2020 12:02:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 069553d3664c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Dec 2020 12:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9o8T9CJmS7KgYhtSzkIOac5DLiolqKhI6fR2QvSJxShxYFk7OKdvHvgCg7137wE0VJAlE22AT4G+OC3tWYzkh73EXTcXvibEVHFQujRpR5N/PRnNVstiucMNZtiZOhYG8BsDymK1OoFSdTGOI2I+HHP7In9MJ+2+RrlHzY51P/11uWg1GsbYVvWW/WKmiOAE8P1ozOyXLwYbpA2Se3IWoGLJ5FKwSJP1uLKu5lmdgobXcD3Z//AKsdHXxEQtwAOOK4saTudr1f10U/tq4ssHaeKe4sOg9EonOYrEwjmXmFi+u6uUqPq561a+vF/fXTrsZ0Q4MfwlTgv9ujH9nJ1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/FX1+cBkG362DKLpb/EUW9+OzXo0ou3qm1dy7nqkDs=;
 b=R5fvZ6tXllyReWUbXZYM46sCf+iDqYejk4DIpyxOFJkP7ihkPOKk5xOoWrSfaclGD77G05NFuEJN/WD9miccdavwtBWh0hJv06yvgnMJG8vba2SlOXZZgkZJatudb3txyImhxotIKJGab5C2dNaav9o3UXKlHyT8xRS/z75PkHtaBiUjpDjqQiyevvdd8BSSGBHF1sXQPN/2QGimqrZBSDzd2Up4ZjCeM+oGrPzTb7bY8s4FHdzorYaSt4EqrGxUrR7IyQuRnDd5ffi0uKeCFmqSfLlkz/hsNI5/i/HIX9otWROmqj4EeiBnc4vQkkVX4ZMx9MTxegvWV2nhDjn56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/FX1+cBkG362DKLpb/EUW9+OzXo0ou3qm1dy7nqkDs=;
 b=h7noioGhcZOB6XvXDZ7irpq1klriONNmjcmwBEdNuKzH28rZAewwxNzY1ciSKBswfJc7TmsYDQi5Wih4KCOh79OwdPLUDwo61fq1V0e6LhQk45JUlWvfiUJOjgf/LKA1FrGJG+Ppoe5EvdC+4Ob2zVyGK10e7YKesPO5089J6j0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5400.eurprd08.prod.outlook.com (2603:10a6:20b:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.20; Thu, 3 Dec
 2020 12:02:23 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 12:02:23 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 4/4] arm-autonomy/juno-firmware: add compressed kernel support
Date: Thu,  3 Dec 2020 11:59:24 +0000
Message-Id: <22eaf42b533a87469e2d32eca15d32f66dfbb44d.1606996678.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
References: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::13) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P123CA0049.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 12:02:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f962390-dea4-4b16-e6e9-08d897836264
X-MS-TrafficTypeDiagnostic: AM7PR08MB5400:|AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB61519E5980A57E6F5552FF9A92F20@AS8PR08MB6151.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KhR14UmU9kBhTl4s4ZUSNJ6J1+X5Dhj6kbKID2UEVcWHjoanlnNoLeLTLLEFJD0B04FlVXIMgpHwglruM8/pjKuVHI8ZzEDeglEQ4V+BA18umKrufa0E5x0oqrJiQw39IJax2WsAe/ElsEFk618jyDkIKBUK6qNoUGXtm22SDSlQtnfJIZRCtT6kOKzvFiyaoT8PYT7d/YIyUkCcpcn+creWTWWHok7EVx1GphS7clxE2qTG8o9YHs4MVO5ZUd+ryEupPve2IyVnpphqLH5ApkbIfAYIpTtDrKBi3iLTt44z25FiXVkMbBJa+S0Mxp11
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(956004)(4001150100001)(44832011)(316002)(8676002)(16526019)(26005)(186003)(8936002)(5660300002)(36756003)(2616005)(2906002)(4326008)(6916009)(54906003)(66946007)(478600001)(86362001)(83380400001)(66476007)(66556008)(52116002)(6486002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?NC1rWRXt1EmA2VgZ9WzDVHsDXssVz/kdM2a2LprqtQbN7Jl5cdlj9iyhwbUk?=
 =?us-ascii?Q?UJzhvdqDNdSDVogZCsCPNNQo3G+vgYelcf/LzD1sOE5lPbTiRw9rUglsNBc7?=
 =?us-ascii?Q?6efuwvXHwpaa9SUyPtkjig+AXpgw7V9miyL/aRobTXaEMZ5wRLTK7ZbnrauL?=
 =?us-ascii?Q?xCGBc+W2+JNj/R4hygOSXGK9jm710PjqZ08sPJgpoT1LUgqcQNqjf7kQsK0g?=
 =?us-ascii?Q?RRP9s/vxD8kY1VnlSaiVNpzNhdBzD21R5SNim6ZyoAiZ9h06oHyjK3jC7/Do?=
 =?us-ascii?Q?NZSS62Con5QbyvZgnqGhzJXlouwG7tZu2rR37gxeF/pDQwz+Qebra2nARDxI?=
 =?us-ascii?Q?hDi8/fBKCxGOhmUsdZaiGF0UFyjePkjqBPqifzpqqL+6R+tJ8KEpl5bQk1Q2?=
 =?us-ascii?Q?z+Kcx6cePbb2/eW50jLjffmvWmy9rg89+wKSG2So3qZEskQ1kmyUO3k1pqln?=
 =?us-ascii?Q?xqUuqPINoK62ZwvnEeRvmnAHzlp5pwfFryUSUW1ofWdlYTba7T9zCEVs7V/d?=
 =?us-ascii?Q?2vL2msBpIQLVhAKxZCi8Ma1m9rsGrg0BHUYXnHGa3gHduDamOATtJLLXC+tf?=
 =?us-ascii?Q?r/GmxFdtATzkxTuj/9DDyrx7VkpDUdTzgBCM73WPj+36je0RDpXOxPen98Zy?=
 =?us-ascii?Q?mIyV0YCz23/6nL6n/2bVKuz2YJzkbluMJmrocKUTKT/VkKoOSGi872UHqr3K?=
 =?us-ascii?Q?MROnS6k5hJkswPCuWPiFnOeBDZXQcZVoPhbJIj8Kms8ybvUqFcbFwlJsXLsF?=
 =?us-ascii?Q?4i3F03T9RWndV2mJfmUONMGfXdEQtFmGCC41MvEHXbcBExEQDps4eBQilOzO?=
 =?us-ascii?Q?rOuyZ9QmfE5uVWYPjw1zDzylaU0mx6/46IfoIClWrG2l8LEKqyqflH4qQYNn?=
 =?us-ascii?Q?0ipBAoWupbBv+avGfOoNt9UHyXuIscMk71p1c2DkTii+xXp4d8LV1ZVqKBKS?=
 =?us-ascii?Q?dQhUZIvBxKfuZRRQRS97LVBd/3clMORiImIOERJ1aVXjGU108lOgcsLTKSQA?=
 =?us-ascii?Q?CJZ4?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5400
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dab9b877-12a5-4fd4-ff00-08d897834b12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uh1+18SPAR6gyYjvPHSSG92Utcxhvn8IOzqisimpGNG+p5TjyP8tEtLkpmbsP1eNc0e8urKfTERORKXvksR8SakJAFOIeIoHk3aSOFrvK7SFBoairOblVWQkzAeg0pqKMaDEEVOWQ6cJHGZdG6SbfwmKLiz0JmBM5RhTU2Yhe+uZEkKzxl0AJzyNxdE4RK1ckX3+Mh5d3IvtDoYhtdkxauefpO0D5FN9IM/TOthRY3zJaH7O3WTEG+WCdXoJqJugYkd9DIy3h4SJVEm3O3p66pKK3MUb3py2lsKRnEZP4xchDiGh3iUqxshxnU0DKMJmZtYs6zoZa16YfPLdkfCb2WtYASUcm37TWUhTGQfAdGNpZPI3GCY8T92yBJC7QEfKz1cqyyxsXxt7eo9TJ90zzA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(7696005)(8936002)(2906002)(4001150100001)(8676002)(36756003)(70206006)(70586007)(6486002)(47076004)(5660300002)(6916009)(82740400003)(83380400001)(356005)(81166007)(54906003)(36906005)(316002)(956004)(82310400003)(44832011)(336012)(478600001)(16526019)(186003)(4326008)(26005)(86362001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 12:03:01.9525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f962390-dea4-4b16-e6e9-08d897836264
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Content-Type: text/plain

From: Kamil Dziezyk <kamil.dziezyk@arm.com>

This patch adds support for lzma compressed kernel,
by setting KERNEL_ALT_IMAGETYPE to 'Image.lzma' and
adding additional decompression step during u-boot boot stage.

U-boot automatic Image decompression cannot be used here,
because if xen binary is the target of 'booti' command,
Image is not being decompressed neither by u-boot nor by xen.

Lzma compression is supported in u-boot with 'lzmadec' command,
and does not require setting additional dependencies inside kernel recipe.

Change-Id: I51b9aea962f8905f88b60ac28e71017c7d500189
Issue-Id: SCM-1769
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../conf/machine/juno-extra-settings.inc      |  1 +
 .../images/firmware-image-juno.bbappend       |  8 +++
 .../firmware-image-juno/add-xen-support.patch | 69 ++++++++++++++-----
 3 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
index ec7ed35..f8a16f4 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/juno-extra-settings.inc
@@ -1,4 +1,5 @@
 # Extra machine settings for juno
+KERNEL_ALT_IMAGETYPE = "Image.lzma"
 
 # Juno board has 2 network interfaces, add both of them to the bridge
 XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0 eth1"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
index 847e252..6b94dc9 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
@@ -39,4 +39,12 @@ do_deploy_prepend_xen() {
     done
 
     bbnote "Xen binaries added under SOFTWARE/XEN directory"
+
+    if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" -a "${KERNEL_ALT_IMAGETYPE}" = "Image.lzma" ]; then
+        # KERNEL_ALT_IMAGETYPE is expected to be Image.lzma,
+        # however NOR flash filesystem is DOS compatible with 8.3 naming,
+        # so we need to replace ".lzma" with ".lzm"
+        cp -L -f ${DEPLOY_DIR_IMAGE}/${KERNEL_ALT_IMAGETYPE} \
+                 ${D}/${UNPACK_DIR}/SOFTWARE/Image.lzm
+    fi
 }
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch
index 04098e1..29f1e06 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/add-xen-support.patch
@@ -9,9 +9,9 @@ It also adds customization for uEnv.txt file, that allows to autoboot xen.
 Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
 
-diff -r -u a/images-r0.txt b/images-r0.txt
---- a/images-r0.txt	2020-11-13 17:26:27.945942230 +0100
-+++ b/images-r0.txt	2020-11-13 17:26:43.221881902 +0100
+diff -u a/images-r0.txt b/images-r0.txt
+--- a/images-r0.txt	2020-11-25 20:25:38.677687712 +0100
++++ b/images-r0.txt	2020-11-25 20:36:55.482194294 +0100
 @@ -1,7 +1,7 @@
  TITLE: Versatile Express Images Configuration File
  
@@ -21,7 +21,16 @@ diff -r -u a/images-r0.txt b/images-r0.txt
  
  NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
  NOR0ADDRESS: 0x00000000          ;Image Flash Address
-@@ -24,7 +24,7 @@
+@@ -17,14 +17,14 @@
+ 
+ NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR2ADDRESS: 0x00500000          ;Image Flash Address
+-NOR2FILE: \SOFTWARE\Image        ;Image File Name
+-NOR2NAME: norkern                ;Rename kernel to norkern
++NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
++NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
+ NOR2LOAD: 00000000               ;Image Load Address
+ NOR2ENTRY: 00000000              ;Image Entry Point
  
  NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
  NOR3ADDRESS: 0x02900000          ;Image Flash Address
@@ -46,9 +55,9 @@ diff -r -u a/images-r0.txt b/images-r0.txt
 +NOR10NAME: xen
 +NOR10LOAD: 00000000              ;Image Load Address
 +NOR10ENTRY: 00000000             ;Image Entry Point
-diff -r -u a/images-r1.txt b/images-r1.txt
---- a/images-r1.txt	2020-11-13 17:26:27.945942230 +0100
-+++ b/images-r1.txt	2020-11-13 17:26:43.221881902 +0100
+diff -u a/images-r1.txt b/images-r1.txt
+--- a/images-r1.txt	2020-11-25 20:40:19.005177152 +0100
++++ b/images-r1.txt	2020-11-25 20:41:17.500886263 +0100
 @@ -1,7 +1,7 @@
  TITLE: Versatile Express Images Configuration File
  
@@ -58,7 +67,16 @@ diff -r -u a/images-r1.txt b/images-r1.txt
  
  NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
  NOR0ADDRESS: 0x00000000          ;Image Flash Address
-@@ -24,7 +24,7 @@
+@@ -17,14 +17,14 @@
+ 
+ NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR2ADDRESS: 0x00500000          ;Image Flash Address
+-NOR2FILE: \SOFTWARE\Image        ;Image File Name
+-NOR2NAME: norkern                ;Rename kernel to norkern
++NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
++NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
+ NOR2LOAD: 00000000               ;Image Load Address
+ NOR2ENTRY: 00000000              ;Image Entry Point
  
  NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
  NOR3ADDRESS: 0x02900000          ;Image Flash Address
@@ -83,9 +101,9 @@ diff -r -u a/images-r1.txt b/images-r1.txt
 +NOR10NAME: xen
 +NOR10LOAD: 00000000              ;Image Load Address
 +NOR10ENTRY: 00000000             ;Image Entry Point
-diff -r -u a/images-r2.txt b/images-r2.txt
---- a/images-r2.txt	2020-11-13 17:26:27.949942214 +0100
-+++ b/images-r2.txt	2020-11-13 17:26:43.221881902 +0100
+diff -u a/images-r2.txt b/images-r2.txt
+--- a/images-r2.txt	2020-11-25 20:40:30.625119321 +0100
++++ b/images-r2.txt	2020-11-25 20:41:30.720820597 +0100
 @@ -1,7 +1,7 @@
  TITLE: Versatile Express Images Configuration File
  
@@ -95,7 +113,16 @@ diff -r -u a/images-r2.txt b/images-r2.txt
  
  NOR0UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
  NOR0ADDRESS: 0x00000000          ;Image Flash Address
-@@ -24,7 +24,7 @@
+@@ -17,14 +17,14 @@
+ 
+ NOR2UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
+ NOR2ADDRESS: 0x00500000          ;Image Flash Address
+-NOR2FILE: \SOFTWARE\Image        ;Image File Name
+-NOR2NAME: norkern                ;Rename kernel to norkern
++NOR2FILE: \SOFTWARE\Image.lzm    ;Image File Name
++NOR2NAME: norkern.lzm            ;Rename kernel to norkern.lzm
+ NOR2LOAD: 00000000               ;Image Load Address
+ NOR2ENTRY: 00000000              ;Image Entry Point
  
  NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
  NOR3ADDRESS: 0x02900000          ;Image Flash Address
@@ -120,21 +147,27 @@ diff -r -u a/images-r2.txt b/images-r2.txt
 +NOR10NAME: xen
 +NOR10LOAD: 00000000              ;Image Load Address
 +NOR10ENTRY: 00000000             ;Image Entry Point
-diff -r -u a/uEnv.txt b/uEnv.txt
---- a/uEnv.txt	2020-11-13 17:26:27.949942214 +0100
-+++ b/uEnv.txt	2020-11-13 17:26:43.221881902 +0100
-@@ -1,3 +1,5 @@
+diff -u a/uEnv.txt b/uEnv.txt
+--- a/uEnv.txt	2020-11-20 13:48:31.845078690 +0100
++++ b/uEnv.txt	2020-11-25 20:30:00.572306675 +0100
+@@ -1,11 +1,16 @@
 +xen_name=xen
 +xen_addr=0x84000000
  uenvcmd=run mybootcmd
++kernel_alt_name=norkern.lzm
++kernel_comp_addr_r=0x88080000
  mybootcmd=echo Loading custom boot command; \
  echo Loading kernel; \
-@@ -7,5 +9,7 @@
+ afs load ${kernel_name} ${kernel_addr_r} ; \
+-if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kernel_name}; afs load ${kernel_alt_name} ${kernel_addr_r}; fi; \
++if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kernel_name}; afs load ${kernel_alt_name} ${kernel_comp_addr_r}; lzmadec ${kernel_comp_addr_r} ${kernel_addr_r}; fi; \
+ echo Loading device tree; \
  afs load  ${fdtfile} ${fdt_addr_r}; \
  if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfile}; \
  afs load ${fdt_alt_name} ${fdt_addr_r}; fi; fdt addr ${fdt_addr_r}; fdt resize; \
 -booti ${kernel_addr_r} - ${fdt_addr_r};
+-
 +echo Loading Xen; \
 +afs load  ${xen_name} ${xen_addr}; \
 +if test $? -eq 0; then echo Booting Xen; bootefi ${xen_addr} ${fdt_addr_r}; fi;
- 
+
-- 
2.17.1

