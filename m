Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web10.49238.1624291242160410510
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 09:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Leq8JY7p;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgj3+SEWTfjTb/9IkVMytn3xR0sSRUPmzkw33z+XX0=;
 b=Leq8JY7pSEoB0aWzDFc2jx3gK6GweILwvn8a81KUmkjvdy8bWMLnZdw8zlG9hVntXpprQuQ+LkxWMacP2YFTKMVX+wLQkHbphh1bpZn67vfQjHnh2scG9lwbUcVZ/knc7wtE/ReARjbor52GC5Xuyoz6NX6NZTiloxSPnmfTSRE=
Received: from AS8PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:20b:312::14)
 by AM6PR08MB3141.eurprd08.prod.outlook.com (2603:10a6:209:4a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 16:00:39 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::47) by AS8PR04CA0039.outlook.office365.com
 (2603:10a6:20b:312::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Mon, 21 Jun 2021 16:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 16:00:38 +0000
Received: ("Tessian outbound f88ae75fbd47:v96"); Mon, 21 Jun 2021 16:00:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff2f7c8ce6b5488f
X-CR-MTA-TID: 64aa7808
Received: from 570a44dc8b98.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9D05E2F4-EF2C-4276-86AB-69A211B61FA0.1;
	Mon, 21 Jun 2021 16:00:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 570a44dc8b98.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Jun 2021 16:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/GVwmoseQ69tx3gg1ZQ4uIu94OCuNQm1Odmrf7a/bOfx9VyAlY9QMl7ntz9lKhAPaR4HABs0qjhY/IAPdsWk8YKVIOVOWCKEt3Xlbwxm56jiy2N1OiYzIeP9c3fPYsYOchwbcBP88gyasgg6ISBlBtHBbgFnkALWXnJCVZPj1ccrveRKNOaQL0hZ4upLWRn2pr0N0Aj5v9AkHWsddvke4EQoBYNt4zD3P/+5V+6ZBrN7wMY9u7aWuBz+tdLkJmttPJ2MKzrkrmHorLPIdQ2dcI5lbh9REXAdgAvqaURRNl3R7tDuaWz1qDdON0Doku+wK/mY2rWXnnBiQ7AHDGpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgj3+SEWTfjTb/9IkVMytn3xR0sSRUPmzkw33z+XX0=;
 b=Ary/ptjFuzRXswdkPMlDDu1OFqAoLXTCdiqkqEqk0B8FtyHZni7Z9fV72x2F+SgXwc233JSxmXzvTgzSZVe5T0QXRsI1SQanODhZu5a38rhuZ8eoneLfqpuaPYWgV6akaXf3q62bC0I/LU+z9yF9TQilMr3ZWeWiL8nK/o4o8wUxkUWF8Bx8TmmdXAjKXqUlblGHWXCMaC0yFKhZSr6/aWcUl31OwUA0nFV7yZ1S5kY3VUapNqyY0E6DCMmuVyrNYy6It/SfagNU57OsWa6unVw4KJFJjfe1o7XkMzr977NvEfiIOCwzHuorkZ3YVMW0cGmUQGNorhYCPwU5Vm2+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDgj3+SEWTfjTb/9IkVMytn3xR0sSRUPmzkw33z+XX0=;
 b=Leq8JY7pSEoB0aWzDFc2jx3gK6GweILwvn8a81KUmkjvdy8bWMLnZdw8zlG9hVntXpprQuQ+LkxWMacP2YFTKMVX+wLQkHbphh1bpZn67vfQjHnh2scG9lwbUcVZ/knc7wtE/ReARjbor52GC5Xuyoz6NX6NZTiloxSPnmfTSRE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBAPR08MB5815.eurprd08.prod.outlook.com (2603:10a6:10:1ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 16:00:22 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60%3]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 16:00:22 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH 2/2] arm-autonomy/fvp-base: Make usage of wic images
Date: Mon, 21 Jun 2021 17:59:34 +0200
Message-Id: <20210621155934.11382-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621155934.11382-1-kamil.dziezyk@arm.com>
References: <20210621155934.11382-1-kamil.dziezyk@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::21) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 16:00:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76bdd43e-311a-4d55-8d7f-08d934cdb6ca
X-MS-TrafficTypeDiagnostic: DBAPR08MB5815:|AM6PR08MB3141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3141B956C0F0F77D0A235298FD0A9@AM6PR08MB3141.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 H/NB+NuRe8OuqbWpk8gJaBKkZ1A28AfBZ26em3WjQvegAyU0u5jnCUcKJQn5nnJTEjyGHaqklXCbWoXfIpYfmOSLYX8ZuBj2G9MTdGAwGjdSuU+696eAfrF0ZDHI+kN1LogKHS0iQ8P+Q16XdL0kV4/UpNMR0ta88WATMJYYCz7JBQUEv1400iVDuG71zzQOj+VevlTYe+Xpy13i4uYIdw0c0tiJg2HrhxBBbpEHYCQEADKCoitP15FaZy8flXWYDYnObfJVOx91d9GaNnFQQOX67JZHT7RAL+DbIpaz3m39zqnSfaFv3SSOy+l7RbI6uqNJSvQciucSz8EJB7MC+pK9ElIvXB8+yjLPp7BttoLVK46Ic6xOTyOHk8QVly4bt34cfc2RHYf1Mf9MY2bvMxH5hQSUuiSQShJMmA4O1hqogs+/bl4G3m6A4gk6PofVwNNOKtnek8YIa1vSrSAjNu3KJcjyVpblPkdWPhfnYLqPZIdN+6qJ7xb3c4gE/yslfUed4Wjnh8a2S15ICI6eJ75tbrsTe75dHencn5DLo8/K2xPr7Ts8+qbkIYaAPg5ID3LqF1mxK7pxgbR+IDT+S7CqMs5mySSMwj4yjOLa356UIpCuamsu+P7NXz+tPCWERZvqPmZjC21cOepG67sa4cg6MsB4FglzaqpVj4Q/sjM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(366004)(396003)(376002)(8936002)(86362001)(66476007)(66556008)(2906002)(4326008)(54906003)(316002)(8676002)(478600001)(83380400001)(66946007)(38350700002)(38100700002)(52116002)(7696005)(6666004)(6916009)(16526019)(956004)(186003)(1076003)(2616005)(36756003)(44832011)(26005)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?3g9n3D7YgEn22d8ZP6EzjnWeDQqFlVsiT5z0WETcjye19+9g0Lixt81ToBXO?=
 =?us-ascii?Q?I/qU0u0UElpODdtPu/V6mODqCOf7/Ti73OEqnNjmzlGgcX+xijb1mdJdXZrU?=
 =?us-ascii?Q?yFXZ1pv/YKMq3tsOccisarjRJ20if7NkGG+GdmFvMvPqDEhffNUZMIc+CJLs?=
 =?us-ascii?Q?UlbglN/5qs7a5Ti92p/QyHSdTvtJCM1CrBv/O3TOdEtVaCulacyLQxk+l9/7?=
 =?us-ascii?Q?LhT2I4Vt1b//nCprky76Di43rznhydWK69KlE1JOR9okYPpRy6TsE8gQLx5t?=
 =?us-ascii?Q?IMt7se9petIRa67m8UbP5O33TjFSBySOYktYGJAJpG2BV5srfrA+PZ+6TPxJ?=
 =?us-ascii?Q?BTmxO5PlGrXGpelYO1kZKBdmLma/bHzZvsoWQuQgWoWMLywQDILAXA/mhIfj?=
 =?us-ascii?Q?0P8Pi3iKCPUi2z+tvxUTFr4ZgGv+F05fa4jOjd1XRu6cIlO6iq1NUZrOYzvg?=
 =?us-ascii?Q?1pvrmZQyw/TsRohWoFNmsV5zmKz9y/bKeTTtDduokpBjLWL8iAR3EZ56EXNp?=
 =?us-ascii?Q?XsKnf+svAmd5eDFz0+zg3GN4XJZ3ElRbDClnS3+znffANjS5//qkDsmYgx7f?=
 =?us-ascii?Q?1jMswabUA/MtREieT9718k1nLl3dNRTuwk6WGZzxBcnsbxMQ1+MJlr3SkO+V?=
 =?us-ascii?Q?WYaKJq/cztvmNS3DX4+yRUy057jlpI64UVTOOq5qHdPdzmhhXRSOvACr7Ib8?=
 =?us-ascii?Q?9ViZvFqzlWJiwQs7C/tWfLOj0Yx+c2CzapcPJdGI5YTCC7Ue149vyHD5w17V?=
 =?us-ascii?Q?VaQXGvYfjSCrEf5aq6e2dePAd3ZtBeEY1981UxLCSyidS61+5PgrNP5qkAjj?=
 =?us-ascii?Q?C5+nPeiYOrCkXJtkpv80+6cScFkjN+cUXZbkVUu4ECD+NWYqGmnkVLkj3bVQ?=
 =?us-ascii?Q?YQIn3SWv+lAlPnktteBPlyXxhj21I6iq22e1YOK1z1FMh2wAv5pAcuHnyUzQ?=
 =?us-ascii?Q?Tz9dZ0uex0vdoEIpt61TersIDpBuxtB+IX7Oe/JrsArXVzOzZX2srVLpc6Eh?=
 =?us-ascii?Q?L5VvQTJJh4D/5TueZBMVQgh7/j2njWXdr0jnewlzSZN2ixJIQKrfOD7K0701?=
 =?us-ascii?Q?M0raBHuYU1+oS09vxhIYP5k/lZkXwpYK/Jxihha6oI1zOXqI4kmQaXkFdZo2?=
 =?us-ascii?Q?dcYZlQ4vdu7Hfd/JF73LfpFC+AHq2ysGmyxVqDSMmI4Niklat19ciLi2mc+V?=
 =?us-ascii?Q?BmP8oTsbUD9pQW7xEdvzKnR6a2m6nFcZIoTG4bDF2gWM67BS0Od4lzxJIbFY?=
 =?us-ascii?Q?nGwMAUWDvL95b9lP4oQ2IVnI6MzSeRFxQ3b9hvBobfn8uGs1LUuQkEURrD7d?=
 =?us-ascii?Q?NrW5doVCy3gMdtEJF4Rlpbj/?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5815
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	98e20633-6387-47fa-0eea-08d934cdaca5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Exem7vODcObLgeU3Tu1n6LsXuynkKytdXXAM42kduMlTcacdzb/x8Ue1czRcBrZHYf2xBD53R5DKrh5YXhFF60/ApVnY8HJ/VUjisl9DGOR1TWod9l9U2vxe2/AVQSsI6AqY0fHJ16OWvdZlkWmrs7vWfzWoBI9OvCqRpWT91Sy0fR0EHSiDC3HpK1MNGjbzsGxz1P7KO8vZaZW2bWk9g1cO639mJpNYaJCqRoG4qJCqHden79Fe/fs+8yDZZMhVL+kva7TbQV56V8EJrt+A1JMje6Vv8/RxZl55s9qsd2k3k4VgRvGLpLYtRWm750UgQMJzl5PkeJtpa+IUd10GNXldtHFIcDahENOwTnhmwm0arygaO8Xzgki1KxiCvaMl4EToJPiHmKjGLkRAQcdumzE8xM1nv5IcAA+CKaUhsRP6uMg9XVQ5c7HiOFI94t9ebayPcircbpx9Z35dAkjWED6Cxh+YT/kKaTIO3X1a6Pt3gD1NVxkxRcQyCDKStqgnbBTDTfFN9wxOy6/Uu8hJ3ZuLfqAgOyVO0LhFJeLcYfCXO2GgOEx85Z+iNQgYJN+cLt7SyiAGnfwHzhaWpiyPF/QjUqefvd+romXnjRu9yG5myWjW72OewamX+eCQgwUy0wKLKycBV+gfOV6Icy+elW1mp9fc6eLSgTHypwHi7zE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39840400004)(376002)(346002)(136003)(46966006)(36840700001)(36756003)(86362001)(186003)(8676002)(6666004)(36860700001)(336012)(16526019)(956004)(478600001)(316002)(44832011)(5660300002)(82310400003)(2906002)(8936002)(7696005)(6916009)(26005)(70586007)(47076005)(83380400001)(81166007)(6486002)(4326008)(2616005)(70206006)(356005)(1076003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 16:00:38.8084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bdd43e-311a-4d55-8d7f-08d934cdb6ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3141
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

In meta-arm-bsp fvp-base switched to wic images. Hence, make the appropriate
changes to also use wic images in meta-arm-autonomy.

Change-Id: I34d68fee11ea339fb52a97d7593e373aa69faa1c
Issue-Id: SCM-2329
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
(cherry picked from commit b2031ed7ca8faaf82cf74208825999ed8cbd44af)
---
 .../conf/machine/fvp-base-extra-settings.inc    | 16 ++++++++++++++++
 .../wic/arm-autonomy-fvp-base-disk.wks.in       | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
index eb16bc8..91a9c2e 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/fvp-base-extra-settings.inc
@@ -4,4 +4,20 @@
 # default rootfs, so use vda3 for guest lvm
 XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/vda3"
 
+# We need to extend the wks search path to be able to find the wks file set in
+# ARM_AUTONOMY_WKS_FILE.
+WKS_SEARCH_PATH_prepend := "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic:"
+
+ARM_AUTONOMY_WKS_FILE ?= "arm-autonomy-fvp-base-disk.wks.in"
+# set wks file only if INITRAMFS_IMAGE_BUNDLE is not set
+WKS_FILE = "${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', '',\
+                                 '${ARM_AUTONOMY_WKS_FILE}', d)}"
+
+# Set the wks guest partition size and unit. It must be aligned with the sum of
+# all XENGUEST_IMAGE_DISK_SIZE set for the guests. By default, LVM2 metadata is
+# 1 MiB per physical volume, hence it needs to be taken into account when
+# setting GUEST_PART_SIZE. The XENGUEST_IMAGE_DISK_SIZE default value is 4GiB.
+GUEST_PART_SIZE ?= "4097"
+GUEST_PART_SIZE_UNIT ?= "M"
+
 XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in
new file mode 100644
index 0000000..dfd4c23
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-fvp-base-disk.wks.in
@@ -0,0 +1,17 @@
+# short-description: Create a disk image
+# long-description: Creates a partitioned disk image that the user
+# can directly dd to boot media.
+
+# For FVP Base first partition is empty to keep compatibility with disk.img
+part --label empty --source empty --ondisk sda --size="1M" --system-id 8e --align 1024
+
+# Second partition is rootfs normally populated as /dev/vda2
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
+
+# Third partition to accomodate guests images normally populated as /dev/vda3 (used by XENGUEST_MANAGER_VOLUME_DEVICE)
+part --label guests --source empty --ondisk sda --size="${GUEST_PART_SIZE}${GUEST_PART_SIZE_UNIT}" --system-id 8e --align 1024
+
+# Fourth partition is user defined entry normally populated as /dev/vda4
+${AUTONOMY_HOST_EXTRA_PARTITION}
+
+bootloader --ptable msdos
-- 
2.17.1

