Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.89])
 by mx.groups.io with SMTP id smtpd.web12.4946.1613461118407329358
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Feb 2021 23:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HzrtLSqL;
 spf=pass (domain: arm.com, ip: 40.107.5.89, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBwnZs9OQTz8YB5Rw0CZU8wNQ3uzcUiu44nXS7GieOk=;
 b=HzrtLSqLd/f2m4kcWN+cWoP/mNSBbp6EwhZUOWit42HUPqBNps/7rF1B8yHl8PotcWyM/svdvv4oA3QBKNyB2N5rTU1Hpcj3m89vWlKkGCLckV7x0bAYjfBlkWFJzPG6esg0NlzgozBVT84naOr2pK3Q3f0JcbnCs9O/wLULE3M=
Received: from AM6P194CA0063.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::40)
 by VI1PR08MB4526.eurprd08.prod.outlook.com (2603:10a6:803:f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Tue, 16 Feb
 2021 07:38:32 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::c2) by AM6P194CA0063.outlook.office365.com
 (2603:10a6:209:84::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Tue, 16 Feb 2021 07:38:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 07:38:31 +0000
Received: ("Tessian outbound 2db1bbc8a1d2:v71"); Tue, 16 Feb 2021 07:38:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ddfd38a3fd6afd0
X-CR-MTA-TID: 64aa7808
Received: from 733e728f9a19.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 442A88B5-C018-4EB8-B0CB-B1412F19DC97.1;
	Tue, 16 Feb 2021 07:38:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 733e728f9a19.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Feb 2021 07:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AilAKwa5xBCfQLtGj1yd9YabLjgNSHWp5MJSDoxgMiAPJAu5fvBuUKzvoxP9KinzO3eheZf+EjEkGDUcac6fu+wYRldDSgn+dsDiIf4dY0zmzGFszMBCf2jwgHJVkl+ZJNnTzfp/pMlbqL/KkZhdjXBlG6prkiMsGPnVfwmT557wbq3MVLBw2fITIL5Wo9UwtjgD4eegHkFLiCPUxSokEjsTkvUTbHTevm8IEgjK+hhdnBKUG+z8yxUxFinrit4uaTm9/Clarh+9qbesp1oNds8zNpXtwQSNGBNNhN7+r3kZJnV/Jl5/VPUt+F6z+59BOWIKSgkPHk+Zr9J0Whn4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBwnZs9OQTz8YB5Rw0CZU8wNQ3uzcUiu44nXS7GieOk=;
 b=OT4gvBTi7HdsJGWOikgkq2M5sp4wDmeBUOyA/DWappD7+joaBLQyt3G2z7kA/zwyZDhdWPaqB0HBCzdN9RfO1gYMU/2SlJo3y9/QqYpb+xkNzPVPI1OO4THgTML+aC2ibMa0FbCBtpBb+W1bAOgGMzHMt07gT8ktWwo2XXLSs0u+6rV+OSHC+LYhkKNQbPUWkCgXWhY/uAVB/usJQWtwjHefUUcAAYpHYi6ExB0c7zx+KVsm1sf+gQmy/kKzKQDNWUU6iaOcyMI7DSzlDP8Pu1b7w55CpUf7BVpqwHKdZedm9c2Aw/baUkf77llpqpC9c0CuoYZ1CmYrP1CV/AmZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBwnZs9OQTz8YB5Rw0CZU8wNQ3uzcUiu44nXS7GieOk=;
 b=HzrtLSqLd/f2m4kcWN+cWoP/mNSBbp6EwhZUOWit42HUPqBNps/7rF1B8yHl8PotcWyM/svdvv4oA3QBKNyB2N5rTU1Hpcj3m89vWlKkGCLckV7x0bAYjfBlkWFJzPG6esg0NlzgozBVT84naOr2pK3Q3f0JcbnCs9O/wLULE3M=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4965.eurprd08.prod.outlook.com (2603:10a6:20b:e5::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Tue, 16 Feb
 2021 07:38:22 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Tue, 16 Feb 2021
 07:38:22 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy: Fix XenStore initialisation for host kernels < 5.10.13
Date: Tue, 16 Feb 2021 07:38:14 +0000
Message-Id: <b52e49bceb7f7f1efb9f0436b737500aea5f0d13.1613461035.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend Transport; Tue, 16 Feb 2021 07:38:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5d8444da-f3ab-45b5-78af-08d8d24ddbe0
X-MS-TrafficTypeDiagnostic: AM6PR08MB4965:|VI1PR08MB4526:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4526C524BDF3BF8B7F53E0EC92879@VI1PR08MB4526.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3aH/hUI+hgbhYSwh6AZHOjasatn3s+RlUICY/G69tLzvtNkjjMtDyaiXj9Ua6jcAqK9Axbz0XNh0A04TPngCxsNLedZ5jWTt2cHrN0Z8C2KVxuiD4m/78jMTE7hewl0mhVqoNv+xmcXuneDQc/9JloRQAiqUcogaRfgVx+GHJ/kuDWu8+vEOXNZ+2CRly50vf8ROEWfJksJjoTe2XitZzvA0hS+Bg251g9gqiIgs2Z9nMKfWzN3aTr4Lj8FQW5iOS3dqyve4Idhp69FhBE85d4XqG7Hn45OFKMfCJLwiPmbyRILJ+XLsREtKFKj/vUzbQXItI2JwrqUre0w71FGG6sFrQ7YOh93H+0fACIEo4AIH7WiftAatP/Lxlj+91OBXgSKXv/bxl/sU4QJFQCQkSEbkVXf/gE01lCRickQt3sWsk8N+kT/rt8JnLGxjOEMvd40FlwNK5dLeXIxH7J++Vx35TpAI6qU+xrgKhjFTug1Rlc38ho6v/J0Oofx3syhmH1UtB7h4Spp11M6JmSne899FWN65Xse1uEvjIML+tBS0KdGXAHMDLB4RvLYD8f9g8sJ653pKe5jRTrwPnHsDouWNI140CalNoZ+gfjTe+Vc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(956004)(2616005)(8676002)(2906002)(52116002)(8936002)(83380400001)(66476007)(66946007)(6486002)(6666004)(5660300002)(36756003)(316002)(86362001)(478600001)(44832011)(66556008)(6916009)(16526019)(7696005)(966005)(4326008)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?J8KrOxAAqXOi4OlfcYF8wRtPJwLndTfItLFkpjd1pytNQYo7xsI+lyX1WZsJ?=
 =?us-ascii?Q?94awh2msogiBUocF9FESocb3olATEWJ5iM/j2JuZzQ/8O0riIj5n2XcsaZ7J?=
 =?us-ascii?Q?KdFcJTFoeMHB2gt8a9+ILOoEHItoCsqEs1G8+Aio1TeQoTQeTlNgFLjDEW+C?=
 =?us-ascii?Q?doHXMrLdzAli4uUzyLMNaY/yiwok3LFi6c+nZnCm8YT/MHjg31/GZCpaqrCs?=
 =?us-ascii?Q?Tst+TfxfoT+WQ/oxJ3t6/285UdJd4FnikSPb4GSOSnnTBFlrncV8cSOkrOcc?=
 =?us-ascii?Q?H8zb8WMzMjOxDIqfGX2EDBzYi/MAH5g05LuEMNLETFEskCAsi1iGUTgKrraL?=
 =?us-ascii?Q?64t73H/zRvJXqAx9fzhpoVj5SJ3qnLxPEVW5Si/MZA2LX8HSF3kDGg1ZIZX1?=
 =?us-ascii?Q?230yrwRu9ZODD+wJsWOsgn2vBd3ARWOiuYplZ7iQh3+aLW7LarMJdj49SxRy?=
 =?us-ascii?Q?TABV2enpK7B8Wg8ia8g7Af+oUH5amQW9Gfpqdrv8TWq5URlkdqCKySxYWb59?=
 =?us-ascii?Q?V3F/OoRdVzFe3MkHvLyvfyBp2gF7pjrW6DeZN7T4+JwqQ1dvCXP10wvOXRFW?=
 =?us-ascii?Q?BchwfZq7zxF8SPuPnIARRwQvCVbRRQU0qit4jdjl6PvQ51nhKVEUrgmONbMY?=
 =?us-ascii?Q?OFl+Ud+YnRB8GhgxaHiNa18Ef0VxflFzM730PXskTVrOIYNKdRlqFhxvhYWZ?=
 =?us-ascii?Q?7tcZJKVmc7ov+JoPy5Qnrx8XkISULwGjL8v6N+6ZJ0yy96jStb6om+CSFJ7P?=
 =?us-ascii?Q?BfXgQx7pp+TcuJbjQjbKe/JvL4Z+38KNgMFs+dtkw+Etp4BIdVXQITFZS3s5?=
 =?us-ascii?Q?r5n8OOPIEQ2pGgsHvXXetCkVwoNJO9o8MoFyeVhe4ICptXu3SQ2MGJMsUa6T?=
 =?us-ascii?Q?26y08t4+LYvdww3U6N6WV56da2e6RXhb8QX/PU1xdxKrZPToeBlZvSCGt2M1?=
 =?us-ascii?Q?Ck/ZVfGRHlcaIWAw0pJpXzKhoMSEhfcK9a0DcDbUZ6wF9fsMd6I0Hby19CnF?=
 =?us-ascii?Q?fnDyrvrv1eoSIMrLnqcrDJRVb45S6354lvWFYAbw9C20lX4c/HuEpakAKTJc?=
 =?us-ascii?Q?dmUo+Rad7QimpFyWgilDCcX2ok2O0gcInGyCySl45h23n/QMwR24QkSH6y7k?=
 =?us-ascii?Q?IoLaKjD9SdyNlqPLxNl19TFE+j8LbGK8YHaUaDo4d/lMT41eccZ6Sop9Wx3e?=
 =?us-ascii?Q?AYCjQk1gYnyHJkRiSgPOrMqVTKE0r8KSS1d5r8ORHd+jnS5hIqDXwU2fZrB0?=
 =?us-ascii?Q?IyE6tEO2STUXHy+gSMlMq2tis8TmcXKCufssc9IIdRicjVfZIFx/jLFbuJzZ?=
 =?us-ascii?Q?bPNsMo5NAufkrhCjkKDLsXM5?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4965
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	612a570e-0be8-464e-f931-08d8d24dd61a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	leZvIQ02p8yzpXPsz31p+az7DWExWdmVy8u7nhXwGEKJqYObfX9JbC1W85tF/9gUJUmfU4dxVbwW8fY3KpF4yByDdQlZAzjdE1uQxaRir3mQCeFY78A/Ok27A7RkvWuSWMsU+4Ws9NxZi+xAYlCQhEIY29Gykf2jbcbOZee+QLjCmursiKZKZ9W1/aqcIeaGiYe3rpJV2eoSGcN6TiY05CIiC5UgED0mFYFaN3/WiZKHDdmAEV3ove6b+hMDy6YKw/rmqXiV4Jz5HBGzBMukabiQT7vU9Ju3eWW78n3wjZuY1Uapu0PH1qifq5x2d2lxfaV85k+uPYn16qnQIBGsrPly3jk46KqnPNNlqlN3g2K9tCrp1va3DfPpb+eLyTHCZ06JSt3Ig5Ncn1a+AskIdrkgj0vqf1aqNLBVPBGREcVeYNrev8ve2FA2mtZNAgzr/mmCnwNKUSWOOhmX4jn3TD4soaYb/qPN45TxW8BNZjAa4zMW8HWFZuR811fxyZfdX8hxGoSvFKDW41HajZMeq58TpQ4wOlaqnP4/tXbINhXEZPlZwJAE4OKJu2MGrrW6lG4FJhoGS8ISXi47hz+cdJM0xE3m8oGExVJPPY21KiQINk2e0jqM5UUxk8bYSqQhn6Qpmv3XqZ/CoMYjbIv7M1aJNXVnk76lgihHir/L3RPv2owRDBpldcFMvzWegqlNmH+4YWa7oeNU8glnCvhIwZshDInwdxXSozG6ytNEpyk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(36840700001)(46966006)(4326008)(956004)(2616005)(6486002)(26005)(356005)(70206006)(81166007)(316002)(7696005)(186003)(16526019)(86362001)(36756003)(336012)(47076005)(6916009)(6666004)(2906002)(5660300002)(8676002)(966005)(478600001)(8936002)(83380400001)(70586007)(44832011)(82310400003)(82740400003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 07:38:31.5601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8444da-f3ab-45b5-78af-08d8d24ddbe0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4526
Content-Type: text/plain

The arm-autonomy-host kernels older than 5.10.13 need to backport the
0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch in order to be able to
use the `xl block-attach` and fix this issue:
```
xl block-attach 0 "phy:/dev/vg-xen-vda3/base" xvda w
libxl: error: libxl_xshelp.c:201:libxl__xs_read_mandatory: xenstore read failed: `/libxl/0/type': No such file or directory
libxl: warning: libxl_dom.c:52:libxl__domain_type: unable to get domain type for domid=0, assuming HVM
libxl: error: libxl_disk.c:314:device_disk_add: device already exists in xenstore
libxl: error: libxl_device.c:1407:device_addrm_aocomplete: unable to add device
```

This issue is not present in linux-linaro-arm 5.4.0 used by N1SDP, hence we do
not apply this patch for it.

Issue-Id: SCM-2151
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I1a38e22084161fb4b6028ef12443707cc566d56e
---
 ...XenStore-initialisation-for-XS_LOCAL.patch | 98 +++++++++++++++++++
 .../linux/linux-arm-autonomy.inc              |  4 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch

diff --git a/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
new file mode 100644
index 0000000..5bf9b74
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch
@@ -0,0 +1,98 @@
+From 5f3d54c00f1f2682cee9c590c22655b0330ffd18 Mon Sep 17 00:00:00 2001
+Message-Id: <5f3d54c00f1f2682cee9c590c22655b0330ffd18.1612780458.git.diego.sueiro@arm.com>
+From: David Woodhouse <dwmw@amazon.co.uk>
+Date: Tue, 26 Jan 2021 17:01:49 +0000
+Subject: [PATCH] xen: Fix XenStore initialisation for XS_LOCAL
+
+commit 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1 upstream.
+
+In commit 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
+I reworked the triggering of xenbus_probe().
+
+I tried to simplify things by taking out the workqueue based startup
+triggered from wake_waiting(); the somewhat poorly named xenbus IRQ
+handler.
+
+I missed the fact that in the XS_LOCAL case (Dom0 starting its own
+xenstored or xenstore-stubdom, which happens after the kernel is booted
+completely), that IRQ-based trigger is still actually needed.
+
+So... put it back, except more cleanly. By just spawning a xenbus_probe
+thread which waits on xb_waitq and runs the probe the first time it
+gets woken, just as the workqueue-based hack did.
+
+This is actually a nicer approach for *all* the back ends with different
+interrupt methods, and we can switch them all over to that without the
+complex conditions for when to trigger it. But not in -rc6. This is
+the minimal fix for the regression, although it's a step in the right
+direction instead of doing a partial revert and actually putting the
+workqueue back. It's also simpler than the workqueue.
+
+Fixes: 3499ba8198ca ("xen: Fix event channel callback via INTX/GSI")
+Reported-by: Juergen Gross <jgross@suse.com>
+Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
+Reviewed-by: Juergen Gross <jgross@suse.com>
+Link: https://lore.kernel.org/r/4c9af052a6e0f6485d1de43f2c38b1461996db99.camel@infradead.org
+Signed-off-by: Juergen Gross <jgross@suse.com>
+Cc: Salvatore Bonaccorso <carnil@debian.org>
+Cc: Jason Andryuk <jandryuk@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ drivers/xen/xenbus/xenbus_probe.c | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
+index c8f0282bb649..18ffd0551b54 100644
+--- a/drivers/xen/xenbus/xenbus_probe.c
++++ b/drivers/xen/xenbus/xenbus_probe.c
+@@ -714,6 +714,23 @@ static bool xs_hvm_defer_init_for_callback(void)
+ #endif
+ }
+ 
++static int xenbus_probe_thread(void *unused)
++{
++	DEFINE_WAIT(w);
++
++	/*
++	 * We actually just want to wait for *any* trigger of xb_waitq,
++	 * and run xenbus_probe() the moment it occurs.
++	 */
++	prepare_to_wait(&xb_waitq, &w, TASK_INTERRUPTIBLE);
++	schedule();
++	finish_wait(&xb_waitq, &w);
++
++	DPRINTK("probing");
++	xenbus_probe();
++	return 0;
++}
++
+ static int __init xenbus_probe_initcall(void)
+ {
+ 	/*
+@@ -725,6 +742,20 @@ static int __init xenbus_probe_initcall(void)
+ 	     !xs_hvm_defer_init_for_callback()))
+ 		xenbus_probe();
+ 
++	/*
++	 * For XS_LOCAL, spawn a thread which will wait for xenstored
++	 * or a xenstore-stubdom to be started, then probe. It will be
++	 * triggered when communication starts happening, by waiting
++	 * on xb_waitq.
++	 */
++	if (xen_store_domain_type == XS_LOCAL) {
++		struct task_struct *probe_task;
++
++		probe_task = kthread_run(xenbus_probe_thread, NULL,
++					 "xenbus_probe");
++		if (IS_ERR(probe_task))
++			return PTR_ERR(probe_task);
++	}
+ 	return 0;
+ }
+ device_initcall(xenbus_probe_initcall);
+-- 
+2.17.1
+
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 89c9fce..3f11619 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -38,8 +38,12 @@ python() {
     from distutils.version import LooseVersion
 
     kernelVersion = d.getVar('LINUX_VERSION')
+    pn = d.getVar('PN')
 
     if kernelVersion and LooseVersion(kernelVersion) < '5.10':
         if oe.utils.any_distro_features(d, "arm-autonomy-host arm-autonomy-guest"):
             d.appendVar('SRC_URI', ' file://files/0001-xen-arm-do-not-setup-the-runstate-info-page-if-kpti-.patch' )
+    if kernelVersion and pn != 'linux-libc-headers' and pn != 'linux-linaro-arm' and LooseVersion(kernelVersion) < '5.10.13':
+        if oe.utils.any_distro_features(d, "arm-autonomy-host"):
+            d.appendVar('SRC_URI', ' file://files/0001-xen-Fix-XenStore-initialisation-for-XS_LOCAL.patch' )
 }
-- 
2.17.1

