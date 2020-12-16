Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.53])
 by mx.groups.io with SMTP id smtpd.web10.9012.1608130858256195635
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Dec 2020 07:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BI7oYVUH;
 spf=pass (domain: arm.com, ip: 40.107.8.53, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5AaXBmAx46D4G0DY0/8xpfjESwJTH+0JLEQS1ANgx8=;
 b=BI7oYVUHBd6HTQld75mTJ+IyrT571rGi1xWMSASjQwJYeyQd1l4E4vpDgMoRX5Ige+oOgtsTAxETTgw8QOACesz2UKXto8zcCLmdB1yqPrLv81xpjiA1fuMZTpJUDBY86O69DGNySpUQeKg+vyz/OvJhBGGGrMoXLf2sd+CyU0k=
Received: from MRXP264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::25)
 by AM8PR08MB5748.eurprd08.prod.outlook.com (2603:10a6:20b:1df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 15:00:53 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::33) by MRXP264CA0037.outlook.office365.com
 (2603:10a6:500:14::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18 via Frontend
 Transport; Wed, 16 Dec 2020 15:00:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Wed, 16 Dec 2020 15:00:53 +0000
Received: ("Tessian outbound eeda57fffe7b:v71"); Wed, 16 Dec 2020 15:00:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2717f5a3f317e49f
X-CR-MTA-TID: 64aa7808
Received: from 74be66301179.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0D505B55-05A6-45A5-9F09-37F3F606E35E.1;
	Wed, 16 Dec 2020 15:00:33 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74be66301179.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 16 Dec 2020 15:00:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA8xH5fbmqChOXFNq/9XiahJmO0PQf1jfUP7ojmXXnSIdhE04+GGv50pwQ+m1MNmQWLhR79X837vQs/tEu1JyMRrUFc/SSM0mPgDVFEVW1vRzo5vMgP3ndAjSK6IMEdxFTjYG96oG/RLeyB44kkpeEmixTEqUMDRck9PAS2sbvG/dcDOykBpby5mIULgIYzMyFKaeDY0LepYNqs+2VCLS4mvoSbX3XHv0zhVs6tquD2RhBlgeHnla5NN9rP8mlKguaqmCYN5U7C+CI4KzaR3afH2b235oj3XY/C60MLu8Gg/LRCRdcOk5fJvvKb1fLqGNnbsbImS54/DbHQhiizzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5AaXBmAx46D4G0DY0/8xpfjESwJTH+0JLEQS1ANgx8=;
 b=Zf6gyDqwrkc+ZyQE+1g72WCoDE5C5jfxVIg/i2KlQ/6cLPf25lb6fPWxQIU4yT+IrEdA4UiJ7XlB6rQMF2d0yRCKwfwNSKWlbmhSURRDGP+56YwqzxlzCfKZm4Jbk18A5/CLrDc+mn+6jNPOE3ODaEvY/P9JWrGxCaXd6ZEk5TSNmi4Uy8tvmdjA66zMYCBqk5g7FfRjhYPPK+2XPa/zEv4o8pW5m78XkB1Vy0cwXqxIRFZsL3TVgW8ZNHiK3jAqAGKFhw+xiebDED40M4L228wgxR5SWA1suD0CDqTRWxXY4UUnIUAi+Y8/TFKaYoTkVnEgr99pUgoXmCKqxpcCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5AaXBmAx46D4G0DY0/8xpfjESwJTH+0JLEQS1ANgx8=;
 b=BI7oYVUHBd6HTQld75mTJ+IyrT571rGi1xWMSASjQwJYeyQd1l4E4vpDgMoRX5Ige+oOgtsTAxETTgw8QOACesz2UKXto8zcCLmdB1yqPrLv81xpjiA1fuMZTpJUDBY86O69DGNySpUQeKg+vyz/OvJhBGGGrMoXLf2sd+CyU0k=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4440.eurprd08.prod.outlook.com (2603:10a6:20b:bc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Wed, 16 Dec
 2020 15:00:32 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 15:00:32 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/wic: Revert Introduce empty plugin to create unformatted empty partitions
Date: Wed, 16 Dec 2020 15:00:26 +0000
Message-Id: <4341c027264f23f8f1738e2972cebcc53b6b74fd.1608130805.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.55) by LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 15:00:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e423dec6-3a47-49b4-bfb7-08d8a1d36245
X-MS-TrafficTypeDiagnostic: AM6PR08MB4440:|AM8PR08MB5748:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB5748AF4A91AB34F2A4E63C0292C50@AM8PR08MB5748.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:873;OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wFPqnvD7WLoeZ6QxbeV7CkvlE5g2OmCUd98pQgNN6Yy72Sc9aSryeRX9m1GWHjiAIhIfkeG3vWLNWfrVdpfbWbeYp6cfvjfYTv6qch7fVkm+Xduxn82dmk6Bz1gDsrHmYDSUrdIUvNDhwhH2RRgAmfr3VVJt5QIoCCZA55QOmfYL9SDKwQyoYvhHrMowuWynrSbB1ysJNtyGa8M2DVo6MmopPhhdWqS41lLSe8oljdLHqW/BaSWDKYc7sGsPGpiWZI//f1ZmYk9TVcBvn4rrBK4PBGEYVFpWqPhYlsiK4+MaxLWWJ2UFa3Qug2mmaqx0
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(956004)(8676002)(6666004)(2616005)(4326008)(66946007)(26005)(6486002)(2906002)(186003)(6916009)(86362001)(83380400001)(7696005)(316002)(44832011)(8936002)(16526019)(66556008)(478600001)(66476007)(36756003)(52116002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?3nuKmMpdMT/jT+/2ujhOGNyugf1MHu+btf6bGmQj2izL0OCoRMtrcsTEZ30F?=
 =?us-ascii?Q?5q2VHmDnqyfgbiGhE/J+hgBLYPUxetgp9SZvJ4LOdIBJxjNa2T9w9+Rn1+42?=
 =?us-ascii?Q?WOH6udCzUvQp2ERFkagFPofNLYukm2s92OvuNGkq48ncm5YlUftVhpKEC6zd?=
 =?us-ascii?Q?ik3a4kNu+RQzgHOLgu0cBFRCoTx/3J0Ywgu8x39ociRo/uPCLM5OF92/BGgN?=
 =?us-ascii?Q?399J6nx/1B0Yvt7lLm+k0Wvl6OwN78lCql2ZRO2/57YqEFq1zS0hBB3eBk8F?=
 =?us-ascii?Q?ZsAdxAFdZgANyTuA7E4e29eluDCOFRFdTZrAtsjBsrgso+1qN7E4UlWkt4JL?=
 =?us-ascii?Q?jgZVUWr08/exDjBwT9MUJhqOAhGuTV/V8buFE8g4Y83yxFZ7mwV9anCvPv1D?=
 =?us-ascii?Q?zZTpmxVPiBelljYviLF1mqDJntTg66aiZDiofb2n89fbPiQYg55xERLMnKgQ?=
 =?us-ascii?Q?7Lt7o7P/NzIn5P4dysBUxROJK43BIPHClaMNO0O2JpbkkPBDX6rkMuSFvTL/?=
 =?us-ascii?Q?VYb8ebgVM87dW8VoVvIKtwZELQcX/Ys7xxEBHyQ2v4Ej0WA4xz2kAGqx8Tyq?=
 =?us-ascii?Q?lu5nPbqUgZtT0A1Tc7r8FCJ7/KHvEwzdKG8TnyBGpHBdJXvkrTPmJrRlxwF9?=
 =?us-ascii?Q?RxmzePxBKziERkHfYzM4JpujV+ZFEngKeTcKfc36U1mLR8168GPt/c1oA3Z6?=
 =?us-ascii?Q?kcmlT0nl0h+JF7QDWgAN5zeKNp4UAIhQIyBn0IWEgCQPJnrHgwKIE8HPzDi0?=
 =?us-ascii?Q?aFqKZtscuUTgZ/P0tJgN5vv0iYWbXwrv4iBDrEghmn/qEu/YFyWaZ3gBYwd2?=
 =?us-ascii?Q?f+h9TO+tD422FVQ+LNibAeqUvwUlmYkbqKNt18NycUUHTAotSYoTQtbv+Pz3?=
 =?us-ascii?Q?lRzIWe1ogrVOFjikfyr7kUHwWRHhzP5mTaLro5qY0zRuCNEkkObuvF3N1CDY?=
 =?us-ascii?Q?EhNXYc1F7k/BDAgzQ/hYucR0VrIL0y4TwuwRUhx3ySG/o2SwtFG5yELLAOJ+?=
 =?us-ascii?Q?w/w9?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4440
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e8e12c5-7da1-4ffc-9bcf-08d8a1d355da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iuQsA0HOXMkrqursi3wWWNOv2AhVMwWY3c2wTyQmwoUG1DTJ7Z2/dfEEFC8+G3jGD0PYk36ONmRuGbowKqssBxmLEzJQGvMj+NIeMUbvQJySPAaa/6XxBL0jimkmFSztBJ+BAbY8z5fZoF/phMbfpGwlQzF8mZdt5uH1gtNncXEUua0Wcm7QRvslzOTDLJTubmbUBsLWGN0G9MpRSdAwVBGIHdojY6xcf9yfR4UrkNhB3oa1reQSMI+ckWBdKYqUgxAkylPXkBcc0qMB3OdhwOKMlGPgeWaPSECOaUqyrYJBUyAnYXjMEgG3GPVCE7sPFNtMGV57/4FNwIEGJczXAaVhljjJY+/n7RMofXFQC+cD1Shi1/ixb1kr0YOzYxvBWaeCeUJeI/cQtltcuFloOQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(86362001)(356005)(82310400003)(478600001)(5660300002)(6916009)(316002)(83380400001)(4326008)(81166007)(16526019)(956004)(6486002)(82740400003)(2906002)(26005)(6666004)(2616005)(186003)(8676002)(8936002)(36756003)(44832011)(336012)(7696005)(47076004)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 15:00:53.0505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e423dec6-3a47-49b4-bfb7-08d8a1d36245
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5748
Content-Type: text/plain

This reverts commit bc07e6c62adcfa8e997fa7862ddd47ccf1ab5785.

Wic empty plugin upstreamed to oe-core as: 77d174fc80663403ef76c5b808aafc1117d3545c.

Change-Id: I94e6fb8583cf6e26cf141087fe5adb187ea85ef1
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../scripts/lib/wic/plugins/source/empty.py   | 32 -------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py

diff --git a/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
deleted file mode 100644
index 041617d..0000000
--- a/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
+++ /dev/null
@@ -1,32 +0,0 @@
-#
-# SPDX-License-Identifier: MIT
-#
-
-# The empty wic plugin is used to create unformatted empty partitions for wic
-# images.
-# To use it you must pass "empty" as argument for the "--source" parameter in
-# the wks file. For example:
-# part foo --source empty --ondisk sda --size="1024" --align 1024
-
-import logging
-
-from wic.pluginbase import SourcePlugin
-
-logger = logging.getLogger('wic')
-
-class EmptyPartitionPlugin(SourcePlugin):
-    """
-    Populate unformatted empty partition.
-    """
-
-    name = 'empty'
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-        """
-        Called to do the actual content population for a partition i.e. it
-        'prepares' the partition to be incorporated into the image.
-        """
-        return
-- 
2.17.1

