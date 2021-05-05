Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.70])
 by mx.groups.io with SMTP id smtpd.web12.6192.1620213223701709890
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 May 2021 04:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=G+FFP2fG;
 spf=pass (domain: arm.com, ip: 40.107.0.70, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shEdLGrNxMr2npYzW0D1Jly0CLGc+lxDF/9kX31GC4Y=;
 b=G+FFP2fGTjxpxC32ogUtR2TM6mEbqmZLJtU9THormUGFWD+6tl9xlNzyxoMDmUhDqczNXtCFcRPi79ABMtdDC6FBC1VWYrJ+eIePmQBzuq4gZJahOL+EHBqJoEcpicougoAnlu+KmyTPyB+k1lCu2P5cNCYBSsI0glIdCsqNAR8=
Received: from AM6P192CA0068.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::45)
 by HE1PR0801MB1786.eurprd08.prod.outlook.com (2603:10a6:3:7f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 11:13:39 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::30) by AM6P192CA0068.outlook.office365.com
 (2603:10a6:209:82::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 5 May 2021 11:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 11:13:38 +0000
Received: ("Tessian outbound 6c4b4bc1cefb:v91"); Wed, 05 May 2021 11:13:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e0d1194ce3dd192
X-CR-MTA-TID: 64aa7808
Received: from a552092fd40c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 190E8EF1-E33D-40B1-A3BD-0EC0E7D5403B.1;
	Wed, 05 May 2021 11:11:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a552092fd40c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 May 2021 11:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXOl8q09V9MFOrbG80GNxrwBaLVznNqvMo1gzb7ExYAmKOt1JhHQ5l0jojrcxkKjZWZhtU8IBkFkOXfg/Ubro9Mu0MAliweqBx7XfM8sBVW4+my1IWsHXFl/h+kRKgQuPY7iwm/KsURg3qN3lYhORBtbgul2U8EGQSg/NG0gFYp4jQ9bWO3RsDUlzUQMgvJkdhPPaOqknSbz0fITGvyASYaDgdWryCghtvxFBlWzJixOVFhL914d3eVCAMYZnJiqfLCyraxo4hv9xZrokQJxZ3rcfeWPuGOx2guDwcjuCWQVwtIZQssY+sWrLT5craxoS9FQYSgqWVOI1L6g4FDpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shEdLGrNxMr2npYzW0D1Jly0CLGc+lxDF/9kX31GC4Y=;
 b=UsAo/CqovT1Jy5meO5Cir98FzFHtErPOSc+WtNq7YeY4ZkVUeAlIpjrjXVAujIx3Bvx/vgndQvOuUIMTViVqiw7mqKGXfkdmWMOMlCmGtCb7AUPwh5gD7WMugUxi0rzCRnuaDRLduv0YMkeBUEab99X5MXAvFzz/65DjFeyExqMufKRhD8gtFYAF6ih9jmFTPouGfHB7V7znaDkJOX5chBTocHKdylD9Jnh158J6z4DqALZHGb1qlJW4Ha4JsdMlYl2K2c79KaZIgPhKQ5VL+qIiXdCjtHW1zUVm6833gXtiwQpJBpRX+wxFqpcAZFzJYqbqJu6j9YSSTKOusjJ0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shEdLGrNxMr2npYzW0D1Jly0CLGc+lxDF/9kX31GC4Y=;
 b=G+FFP2fGTjxpxC32ogUtR2TM6mEbqmZLJtU9THormUGFWD+6tl9xlNzyxoMDmUhDqczNXtCFcRPi79ABMtdDC6FBC1VWYrJ+eIePmQBzuq4gZJahOL+EHBqJoEcpicougoAnlu+KmyTPyB+k1lCu2P5cNCYBSsI0glIdCsqNAR8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VI1PR08MB5472.eurprd08.prod.outlook.com (2603:10a6:803:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 11:11:17 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::d503:427b:74b7:1b23]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::d503:427b:74b7:1b23%2]) with mapi id 15.20.4108.025; Wed, 5 May 2021
 11:11:17 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/fvp-base*: Introduce WIC support for fvp-base* machines
Date: Wed,  5 May 2021 12:11:02 +0100
Message-Id: <20210505111102.39567-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LO2P265CA0289.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::13) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.49) by LO2P265CA0289.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 11:11:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0af94df1-2b03-4ff1-0fa6-08d90fb6d56a
X-MS-TrafficTypeDiagnostic: VI1PR08MB5472:|HE1PR0801MB1786:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB17869B90F0FB3ECA26BD1A0089599@HE1PR0801MB1786.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lskrOhi2/H0DvPHMB7BVYdFvk7feJbttUY/vfuDKAnTryNWZ7FV/H+B3ICFeSFh3bF333tZQF8GrR4khbmwLYPWFdEXCAAoez40C2qrwoT8RaLYHOt32D4jpWoqGNoOUDxhOPBTVxxP5mr0ZKe36aCYrJAupJRq5S6jWuTyB6DUEq8VJIZ4IhyzHDpcKM8ouGvtGXi7km12qPR6JL+Bbru1GYGrVOUCD9p8bFZvita+SQfHnMsW3deEB/Oox90Qcp5og2ioONUTISyc2FCf8qat+vRWlL6Pu7WZlsijKZf4Izb7lxuhe8Jzc0+ZNd6eeCOlpOGrXy26I9UOA/+FYfOpJq1KXKvNTJzUkS64lvYPLjumN7pUOaQgAD4OwrVtCxG8JMluF+Aw/IOG9iqejJsOdlc0GCfRRJ9OJEmoskJva8EPwJLixELRQtYO1OZEOCzTdeTybY7XcWcJzUYe0t5BoqgZnguTAOJPXDwFB6oHJZm7R6TAZ0t/Yd7SR1w1LiKu9XmP1wMJ3weoxLra/x8ejmbeoyhCooaM2MkCLPpFidDBDjS/sFDZnewQDxKekgq7620WCBF18SnPdfdikEgtq2+lJDC1YJl9A+vHYP0vBgBgBWFloRm2ZkRwf9Uh9LUWQp1HgRjKOmJxRWoQmf0FLbMmGUAEXUIEEUHqo+Y4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(1076003)(6916009)(6666004)(16526019)(186003)(19627235002)(8936002)(30864003)(8676002)(4326008)(6486002)(956004)(316002)(38350700002)(5660300002)(36756003)(86362001)(44832011)(2906002)(2616005)(83380400001)(38100700002)(52116002)(66476007)(66556008)(7696005)(478600001)(26005)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?0Y99IzM7Mppsj/uSZ5UShbzzjLp4hfERpyY57ehKLabAIRrENMTAM997oRsP?=
 =?us-ascii?Q?lFNyANCnRTKoiVUrtWdV4KEulAM9MAehPEvVSJMSihgQOwBsqzNJDMNzG/Xa?=
 =?us-ascii?Q?7EFC7FZalcCnVi5sQcZTo4lfIaqG7YTCt7CUllxIr1BmonJPhepzWEcJEZNj?=
 =?us-ascii?Q?nUa9+LYKq3nvrfRgBfl0nSOtRYuMoHmpKg6C2wDj5ZnNYCJwzV7MVXQz1PFp?=
 =?us-ascii?Q?JtsK123zTcCTX4jq8FlCV2FL1KqpWVDidAtZXds3kYSj4vMrnQMk5xrbAPf6?=
 =?us-ascii?Q?gLvkapIpc9nYVGdddnB9rLLY8QqPg+MuOYq7x+IpWe40HXhHFSvl0XJRFkT6?=
 =?us-ascii?Q?upLLbKjs4PXEETe4XMlmbfvqD2xxY+5tJmE3puOmMwStT4dtqlc3hTlcW+Ir?=
 =?us-ascii?Q?bscA7UyFJFPyYtaeogbZExYVQ9BlytIzNUFBqv636TbWaPsa7XJF1O3R0NkR?=
 =?us-ascii?Q?oGvXlxxYzaWwvhHVjv+rqQgvqEneqIsfAXCM3jOB3uOdIRt8tl4dusFn9/ZD?=
 =?us-ascii?Q?wS3PgTpZXB8m2KctCWDWk477eag+U9rncz2ZEJwcRcB8GRN0zsqZ8ySwsIin?=
 =?us-ascii?Q?R8uFooW77m+v9Rm+QxRDJ4tHl+rsRlmueuwFlyOK64WHIEbIqdh6wY1tIlml?=
 =?us-ascii?Q?RAflq3mu5QUuOkSLTkk6E9dTBtAK0LC2AwR8birw/Z3QWIIB/1scDwwNyDwu?=
 =?us-ascii?Q?WykxXv44wWlGn/Ee9d9juvctdi1HyMXWng8Sa+H0niuv/HGiHcP9ah56WHh4?=
 =?us-ascii?Q?enegAAxwW0kdZn3coKYqjF1qh+BXu7XfouhwwvMPX0MgViTQFmPxNFce6n/I?=
 =?us-ascii?Q?NA+aERZMAPS3Dz7a6hb9AvUUMyFCGA/tx6kgMtd8Fe8wHyvdN0qXKW4DKpS1?=
 =?us-ascii?Q?w5j2jRC74CumvMpskzeRjps64+WuGDZyKG8B4+Nwuqt6yGnELQVykg70vB0K?=
 =?us-ascii?Q?EMt7K0Wucebxtzm96fOa6/5tCvqAJndHhIY7uXCBTxvkq9P2hBdBlxkOAr17?=
 =?us-ascii?Q?9vxpl/nInc7WBxJkftfsEm151co31Ff5jMBBVAkTa67W7aLiqOEIa4RO6B8m?=
 =?us-ascii?Q?tAIST3kOEMALGfjeCTkcJnrMCTLTgvRMinplZ5SY240mtQgrwF1V4jwCBZY5?=
 =?us-ascii?Q?jneTpJEUJCkaUbiA3XVB8up2lQ9Nwz2TrjrGHspyIHqnLctoD88xmrTBZ6V9?=
 =?us-ascii?Q?dyy6srFU5wqLrJFIMxxE62zeemeB9ptwZhXGIUMSmG3ThOYpZXf1brs3jfCi?=
 =?us-ascii?Q?3/Kp7GD3vTxcHzPq32Xsauq284S7fFoY9cP5yiwChPs5S1PSQco71Ib8F7Cq?=
 =?us-ascii?Q?IqIrQCxy1VuG7eP+QzFhh0w+?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5472
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ae99303b-3a7f-4ce9-283c-08d90fb6808c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rkw5IgpLFp4zOM6iYMwGrMMEvr70oSJG+rlUt+Q38n5Ii0seGFfXdLuJ05GIRzxdcncPrGNDf8/X0l7z5y7yha5resdFAGVEYuqVsLg7/IAL29UfAyt8gxgCGYDXmx1cSGzBNa3uZFzsT/p3gftsDRsKZm/yPb7DKk4g2DsTI6gUkNyS3QRbezauHzhiWEQfsF8UuhizTT1UzO/TjtA6/fvl0e3Zlz/CZJRAx//FYLJpGzbApB/4+BmMm3PgBLvpqxn6Tx9ZBDN0h8TOepZnDenI+Mgb3JJksDiyZ7AvlRSPFm0ECUgmc7Ywn43uk9+mQofaN+ZNaloLjmFKpYLQqtfHQgkcPmISl88ZuTmdR+3k2KvsL9roTLIoBBOSeGrqe3fPyTQmP2sroXnIMTvjZJwDJsUYBFQxxRQgVtqhi+lAwxtZVaIPIkuwIO9Ygg5cwVCUApDidTQ9dkkpdqueWJm0bl8DqU8F2aPHw5gAwGpW5+VJPm6TvUqy0KNPSlyvRUt+hWLtPegQA56ygMr5lz1vxC13Ck7t30p1srO9thOS3K83ejln1qHXEnnkkTdcNT/JyvVITwYY1cI8kyXujYaVJhMf5yJ8HSDD0SeJUc4MJkmFSULIVbXNaoheLPQS/4vIMO8/OlKTRiBAv3Jg5RMilNvmQiGWOMtUuVGeuPU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(36840700001)(46966006)(30864003)(8676002)(4326008)(356005)(83380400001)(6916009)(478600001)(36860700001)(6486002)(82740400003)(1076003)(186003)(8936002)(16526019)(81166007)(26005)(44832011)(2616005)(86362001)(36756003)(336012)(82310400003)(47076005)(70206006)(5660300002)(956004)(2906002)(19627235002)(7696005)(70586007)(6666004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 11:13:38.7918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af94df1-2b03-4ff1-0fa6-08d90fb6d56a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1786
Content-Type: text/plain

Add wks script, modify documentation and kernel command line.
Remove 'image_types_disk_img.bbclass' as it is no longer used.

Change-Id: I2a95349adc038e8484d7b9f578ad3ce698b1f528
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../classes/image_types_disk_img.bbclass      | 155 ------------------
 meta-arm-bsp/conf/machine/fvp-common.inc      |  20 +--
 meta-arm-bsp/documentation/fvp-base-arm32.md  |   2 +-
 meta-arm-bsp/documentation/fvp-base.md        |   2 +-
 ...-Add-vexpress_aemv8a_aarch32-variant.patch |   2 +-
 .../fvp-base/u-boot_vexpress_fvp.patch        |   2 +-
 meta-arm-bsp/wic/fvp-base.wks                 |   3 +
 7 files changed, 9 insertions(+), 177 deletions(-)
 delete mode 100644 meta-arm-bsp/classes/image_types_disk_img.bbclass
 create mode 100644 meta-arm-bsp/wic/fvp-base.wks

diff --git a/meta-arm-bsp/classes/image_types_disk_img.bbclass b/meta-arm-bsp/classes/image_types_disk_img.bbclass
deleted file mode 100644
index 78cc0d8..0000000
--- a/meta-arm-bsp/classes/image_types_disk_img.bbclass
+++ /dev/null
@@ -1,155 +0,0 @@
-# Defines the disk.img image type
-
-#
-# Add an image type 'disk.img' which creates a disk image
-# with up to 4 partitions
-#
-# For partition 1 (replace 1 by 2 for partition 2, and so on for 3 and 4):
-#
-# * DISK_IMG_PARTITION1_SIZE is the partition size in MB (1024 is 1 GB)
-#
-# * DISK_IMG_PARTITION1_FSTYPE is the file system to format the partition with.
-#   We support only ext files systems (ext2, ext3 and ext4)
-#   If this is empty, the partition will not be formated.
-#
-# * DISK_IMG_PARTITION1_CONTENT is the content to put in the filesystem.
-#   Only 'rootfs' is supported and will create a partition with the Yocto
-#   root filesystem.
-#
-
-# Default values for partition 1
-DISK_IMG_PARTITION1_SIZE ??= "2048"
-DISK_IMG_PARTITION1_FSTYPE ??= "ext4"
-DISK_IMG_PARTITION1_CONTENT ??= "rootfs"
-
-# Default values for partition 2
-DISK_IMG_PARTITION2_SIZE ??= "0"
-DISK_IMG_PARTITION2_FSTYPE ??= "ext2"
-DISK_IMG_PARTITION2_CONTENT ??= ""
-
-# Default values for partition 3
-DISK_IMG_PARTITION3_SIZE ??= "0"
-DISK_IMG_PARTITION3_FSTYPE ??= "ext4"
-DISK_IMG_PARTITION3_CONTENT ??= ""
-
-# Default values for partition 4
-DISK_IMG_PARTITION4_SIZE ??= "0"
-DISK_IMG_PARTITION4_FSTYPE ??= "ext4"
-DISK_IMG_PARTITION4_CONTENT ??= ""
-
-# Default disk sector size
-DISK_IMG_SECTOR_SIZE ??= "512"
-
-# We need mkfs.ext and parted tools to create our image (dd is always there)
-do_image_disk_img[depends] += "e2fsprogs-native:do_populate_sysroot \
-    parted-native:do_populate_sysroot"
-
-DISK_IMG_FILE = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.disk.img"
-
-# Create one disk partition
-disk_img_createpart() {
-    local imagefile="$1"
-    local start="$2"
-    local size="$3"
-    local fstype="${4:-}"
-    local content="${5:-}"
-    local formatargs=""
-
-    set -x
-
-    rm -f $imagefile
-
-    # Create the partition image
-    dd if=/dev/zero of=$imagefile bs=${DISK_IMG_SECTOR_SIZE} count=0 \
-        seek=$(expr $size / ${DISK_IMG_SECTOR_SIZE})
-
-    if [ -n "$fstype" ]; then
-        case $content in
-            rootfs)
-                formatargs=" -d ${IMAGE_ROOTFS}"
-                ;;
-            boot)
-                echo "Unsupported"
-                exit 1
-                ;;
-            *)
-        esac
-
-        # Create the file system (with content if needed)
-        mkfs.$fstype -F $imagefile $formatargs
-    fi
-
-    cat $imagefile >> ${DISK_IMG_FILE}
-
-    # Add the partition to the partition table
-    parted -s ${DISK_IMG_FILE} unit B mkpart primary $start \
-        $(expr $start + $realsize - 1)
-}
-
-disk_img_create () {
-    local currpos
-    local realsize
-
-    set -x
-
-    currpos=${DISK_IMG_SECTOR_SIZE}
-
-    # Create reserved part for partition table (1MB)
-    dd if=/dev/zero of=${DISK_IMG_FILE} bs=${DISK_IMG_SECTOR_SIZE} count=0 \
-        seek=1
-
-    parted -s ${DISK_IMG_FILE} mklabel msdos
-
-    if [ ${DISK_IMG_PARTITION1_SIZE} -ne 0 ]; then
-
-        # Reduce the first block size of one sector to make space
-        # for the partition table
-        realsize=$(expr ${DISK_IMG_PARTITION1_SIZE} \* 1024 \* 1024 \
-            - ${DISK_IMG_SECTOR_SIZE})
-
-        # Create the partition
-        disk_img_createpart ${WORKDIR}/part1.img $currpos $realsize \
-            "${DISK_IMG_PARTITION1_FSTYPE}" "${DISK_IMG_PARTITION1_CONTENT}"
-
-        currpos=$(expr $currpos + $realsize)
-    fi
-
-    if [ ${DISK_IMG_PARTITION2_SIZE} -ne 0 ]; then
-        # Partition size
-        realsize=$(expr ${DISK_IMG_PARTITION2_SIZE} \* 1024 \* 1024)
-
-        # Create the partition
-        disk_img_createpart ${WORKDIR}/part2.img $currpos $realsize \
-            "${DISK_IMG_PARTITION2_FSTYPE}" "${DISK_IMG_PARTITION2_CONTENT}"
-
-        currpos=$(expr $currpos + $realsize)
-
-    fi
-
-    if [ ${DISK_IMG_PARTITION3_SIZE} -ne 0 ]; then
-        # Partition size
-        realsize=$(expr ${DISK_IMG_PARTITION3_SIZE} \* 1024 \* 1024)
-
-        # Create the partition
-        disk_img_createpart ${WORKDIR}/part3.img $currpos $realsize \
-            "${DISK_IMG_PARTITION3_FSTYPE}" "${DISK_IMG_PARTITION3_CONTENT}"
-
-        currpos=$(expr $currpos + $realsize)
-
-    fi
-    if [ ${DISK_IMG_PARTITION4_SIZE} -ne 0 ]; then
-        # Partition size
-        realsize=$(expr ${DISK_IMG_PARTITION4_SIZE} \* 1024 \* 1024)
-
-        # Create the partition
-        disk_img_createpart ${WORKDIR}/part4.img $currpos $realsize \
-            "${DISK_IMG_PARTITION4_FSTYPE}" "${DISK_IMG_PARTITION4_CONTENT}"
-
-        currpos=$(expr $currpos + $realsize)
-
-    fi
-}
-
-IMAGE_CMD_disk.img = "disk_img_create"
-IMAGE_TYPES += "disk.img"
-
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index c4a5f6b..169c0a3 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -7,24 +7,8 @@
 
 MACHINE_FEATURES = "optee"
 
-IMAGE_CLASSES += "image_types_disk_img"
-IMAGE_FSTYPES += "disk.img"
-
-# Disk image configuration
-# We don't use the first partition
-DISK_IMG_PARTITION1_SIZE = "128"
-DISK_IMG_PARTITION1_FSTYPE = ""
-DISK_IMG_PARTITION1_CONTENT = ""
-
-# Second partition is used for rootfs
-DISK_IMG_PARTITION2_SIZE = "2048"
-DISK_IMG_PARTITION2_FSTYPE = "ext4"
-DISK_IMG_PARTITION2_CONTENT = "rootfs"
-
-# Empty third partition (8G - 2048M - 128M)
-DISK_IMG_PARTITION3_SIZE = "6016"
-DISK_IMG_PARTITION3_FSTYPE = ""
-DISK_IMG_PARTITION3_CONTENT = ""
+IMAGE_FSTYPES += "wic"
+WKS_FILE ?= "fvp-base.wks"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/documentation/fvp-base-arm32.md
index 52ca1a4..54408b0 100644
--- a/meta-arm-bsp/documentation/fvp-base-arm32.md
+++ b/meta-arm-bsp/documentation/fvp-base-arm32.md
@@ -33,7 +33,7 @@ bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=1 \
          -C bp.secureflashloader.fname=${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin \
          -C bp.flashloader0.fname=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
          --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
-         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-base-arm32.disk.img \
+         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-base-arm32.wic \
          -C cluster0.cpu0.CONFIG64=0 \
          -C cluster0.cpu1.CONFIG64=0 \
          -C cluster0.cpu2.CONFIG64=0 \
diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/documentation/fvp-base.md
index 17c28c2..b0026de 100644
--- a/meta-arm-bsp/documentation/fvp-base.md
+++ b/meta-arm-bsp/documentation/fvp-base.md
@@ -34,7 +34,7 @@ bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=1 \
          -C bp.flashloader0.fname=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
          --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
          --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/fvp-base-gicv3-psci-custom.dtb@0x83000000 \
-         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-base.disk.img
+         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-base.wic
 ```
 
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
index c61912e..0719629 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
@@ -68,7 +68,7 @@ index 0000000000..cf1e8d5cae
 +CONFIG_BOOTDELAY=1
 +CONFIG_SYS_TEXT_BASE=0x88000000
 +CONFIG_USE_BOOTARGS=y
-+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda2 rw androidboot.hardware=fvpbase rootwait loglevel=9"
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 systemd.log_target=null root=/dev/vda1 rw androidboot.hardware=fvpbase rootwait loglevel=9"
 +# CONFIG_DISPLAY_CPUINFO is not set
 +# CONFIG_DISPLAY_BOARDINFO is not set
 +CONFIG_HUSH_PARSER=y
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
index 0934e40..b0cbe0d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
@@ -10,7 +10,7 @@ index f0ac2f9da3..93fcd3026a 100644
  CONFIG_BOOTDELAY=1
  CONFIG_USE_BOOTARGS=y
 -CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 loglevel=9"
-+CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda2 rw rootwait loglevel=9"
++CONFIG_BOOTARGS="console=ttyAMA0 earlycon=pl011,0x1c090000 debug user_debug=31 androidboot.hardware=fvpbase root=/dev/vda1 rw rootwait loglevel=9"
  # CONFIG_USE_BOOTCOMMAND is not set
  # CONFIG_DISPLAY_CPUINFO is not set
  # CONFIG_DISPLAY_BOARDINFO is not set
diff --git a/meta-arm-bsp/wic/fvp-base.wks b/meta-arm-bsp/wic/fvp-base.wks
new file mode 100644
index 0000000..8399d04
--- /dev/null
+++ b/meta-arm-bsp/wic/fvp-base.wks
@@ -0,0 +1,3 @@
+# For fvp-base* machines we just need to populate the rootfs partition
+
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024 --extra-space 100
-- 
2.17.1

