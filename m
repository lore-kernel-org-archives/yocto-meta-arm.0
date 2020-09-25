Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.81])
 by mx.groups.io with SMTP id smtpd.web11.5634.1601032569283403045
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Sep 2020 04:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MVlBwxVG;
 spf=pass (domain: arm.com, ip: 40.107.6.81, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68To6R4nB4bKw8GP5Q7BLeY51X7YjHpR3xELdMuw6Ig=;
 b=MVlBwxVGaxd98+vbbbuAcwOlEra7jVVWJZR2pVFOnjymjzFFYtE32ip8ZZZd5B3Taa6CIUW5In8b1dU1PEhnWWtP4zGOqhfDFr0F8EpdWOqylrM/A+k3TAf/7JxWXW/1xsDXUdT6GSU6BB1wrA05+ZUN7e7pyiTrcvAm1HPP760=
Received: from DB7PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:10:36::15)
 by DB7PR08MB3180.eurprd08.prod.outlook.com (2603:10a6:5:1e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Fri, 25 Sep
 2020 11:16:03 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::c2) by DB7PR05CA0002.outlook.office365.com
 (2603:10a6:10:36::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Fri, 25 Sep 2020 11:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Fri, 25 Sep 2020 11:16:03 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 25 Sep 2020 11:16:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a52f081e838804ee
X-CR-MTA-TID: 64aa7808
Received: from 78a34fe7daa4.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F551BC86-8911-47C4-9C81-F72FD5E9D5F9.1;
	Fri, 25 Sep 2020 11:15:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 78a34fe7daa4.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 25 Sep 2020 11:15:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNHfONmklW7Zahm+36beiktq6rHhajFGHhDjpbmbFVs9WS5aSYuyH9tZuFzYoOgmHb1ZBqCwnw2rRuXP51tKQdFTSqaLEPxwJ57NhgbytGu5u7mWn2VDxIHK9Lb8l514Jf6guYrcW2hTh+w7dOY4A7mUvUChJiSbRk/wkqfs7BjDuEJVRAnoKAsVpCzDGwdAuX7Orn1tQJTr8IeXaBtQXGEC2hv+Efu2/TwP3n45nJXpZookLPXQl+mmaX5/ZqC9ZyL4+6I9XjFMtvLwWgAT8MoAv+96TADcZ2MOh3MtxPHzaSN7C+XYHYguXkYlel4sKEGJtLT7nyHMBHkhkYuvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68To6R4nB4bKw8GP5Q7BLeY51X7YjHpR3xELdMuw6Ig=;
 b=MTCgLh8lViPJqD0mw6YAOr+lBB3ehQvxMKL3uv4JbwZwy/7n5NGCRFpAGURWOyVk2+5z0EFt0Vc3HDz9Ig3RxrelrTNWkljbvP4nDNPx3YLXQeQUA0G9IMKjnZJ3tsjOSlfkzDG8l/Iw/7RFzd5QPWgN3Gakz47RRvdMZfZ3/1rM5O/Cx9lyS8/6/3FF0+H2OKBNeeOtjVpAgsY1oekyco8uWKE5Lc2qWL5WUJG4W9yvayRwGcJeedP70mATE3ZOL27YGUnbzCDjFUO30zoRJVVwABQEWilY2TBl4O5KTjZQ8QcKcGg/6QeCfoDQrqyh7WtWiFb32goGUbU0/NLdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68To6R4nB4bKw8GP5Q7BLeY51X7YjHpR3xELdMuw6Ig=;
 b=MVlBwxVGaxd98+vbbbuAcwOlEra7jVVWJZR2pVFOnjymjzFFYtE32ip8ZZZd5B3Taa6CIUW5In8b1dU1PEhnWWtP4zGOqhfDFr0F8EpdWOqylrM/A+k3TAf/7JxWXW/1xsDXUdT6GSU6BB1wrA05+ZUN7e7pyiTrcvAm1HPP760=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1810.eurprd08.prod.outlook.com (2603:10a6:203:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Fri, 25 Sep
 2020 11:15:55 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3391.028; Fri, 25 Sep 2020
 11:15:55 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/2] arm-autonomy/wic: Introduce empty plugin to create unformatted empty partitions
Date: Fri, 25 Sep 2020 12:15:46 +0100
Message-Id: <70f746be8740db141d3125e57b78805ebf35789e.1601032480.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LNXP265CA0058.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::22) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LNXP265CA0058.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3412.22 via Frontend Transport; Fri, 25 Sep 2020 11:15:54 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e4a37353-0eec-4fb9-c494-08d8614463ab
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1810:|DB7PR08MB3180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB318029EE59385ECBF01859A192360@DB7PR08MB3180.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vbWeLgzdLE9HZs/ei0/Vu4faaezlc9AkKRfBsn8t4cLxWM0oHZsRVokI+iN0cgoC+EsIFdmPCT+o0a2A4mvL+B385w9gtj3X9kgUFnZm6wUBb4WWnH5YfJ+mlVOXD7BG7SywvzZpNPXh9SshRc2CfFZ/O9Jn8T0oR37+oH6+dFqX5S90GFSOFWN/HL+gyTOELTVNKHYqVJAAMy70b8ryVdqK1g9J18hysc10Hxn7Ylw+bIO+EV54M/bdmWFfUjXTfDqLF1fCSBCqz9Ap2uNZQsoGVZldz1wx0mVstmRBok4SjNubE5jdPq7o3okwHKAm0a4NAyRxRGOqirwVqJs9hHft2/nFJ3JpSKSAr0J/fLP95/F05RQGt7goe+Ls67RP
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39850400004)(376002)(366004)(6486002)(6916009)(2906002)(5660300002)(66556008)(66476007)(44832011)(66946007)(36756003)(316002)(186003)(16526019)(956004)(2616005)(8936002)(478600001)(8676002)(4326008)(52116002)(7696005)(86362001)(6666004)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 o5h7MjWNhvK4hsoTNzNaPSitNiAuDklIov06Uppywyo043ztHpYjBNtlYoOwH1D7BcJ1Wb2rycUap5Vi7jQ4/z0Z3ofgM1PQ6rHZ5OJescUHGfRVfyIOD4px3xyaauVNoOrtdGiz5mBmRLnxcD8c1mfpMEyYCEgGLf6S9a4VLQpPwdT0ZiKElVdw/RiR8SCU70OISMqT6VEAD49mPssR5AwJNnuRbxJO61HS4ATpghsFSP+mldSr9RkVUvX4xabamUK0XWxRSjej6qT2eC+NqdMPNCGzUcK9lXom7kD6Rshh+an+HuA546a2P/uiiUEUtP70FZLzUl625HhDx37U6wk6STCvW+ppMLbhGfvRR8SGiBaZ24YspYzXliQBwRd3MbI9lCFlHLcvFDZa5gOG/WW/NLaA2pSr8d2+5fMtZNH+BtCVPCkhqgDrc7CGeYCVXFq3+J2N516rbocF1VVp/bd103SSUTjR5Gr3wwG3V8LS0vrWAiLLJgvwL3DATVoS+diVaBdseUt1sjbKOdtIbcNtrsMr3bEBtib3OotSbDdqLwD/ZZUeHVv/rjzjGebd73B3RYn3dJJB98LRg9RE6M+XFsbRB3wVljQZE8HxgQ+q2VkxtMyRm625qXuBvuclqaxDOMpr2lVnpe5AKsGLEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1810
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b7911efb-09cf-428e-f112-08d861445ec2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ThMTiOqcE0TOeKkon7kRZWY3OsLNeE8RDlXwxYDJ24clbfzq4m/aUR+eGDbolwqM0DAmzKyGdcTTCW/R5NxRttBUFFfdyFjyCRgUFt6apdXEEnFURcnzqXDSgT7tKno4RT2QePLg7/Yazj4Agy+7JdMv0gJP5HW7av9PlxZu517ZfEklEizEhsxjblRxQrwZgv+Rj9n/9ZIdMTc9Kpwydx2IosC52NQdFhIkbh9J/kf5wNoXR2AKReBmtim4kFgKqb+sRjM9PgZnnj9nuYKKzM40nYF5xWcOF1OJ44kBDZevXhNCw8oN6uRyLPm+Wr+JH9M1UqdyxH0Om+SXC/PwgPaOMOnzKSngqjV0vEWivTblLkv3mj5x/LG8Tak/uCl0skX4qyJENvJF5b6hiRgTRg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966005)(70206006)(86362001)(36756003)(16526019)(186003)(4326008)(7696005)(478600001)(6486002)(8936002)(6666004)(8676002)(316002)(82310400003)(5660300002)(26005)(82740400003)(70586007)(2906002)(81166007)(336012)(2616005)(44832011)(956004)(47076004)(6916009)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 11:16:03.0732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a37353-0eec-4fb9-c494-08d8614463ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3180
Content-Type: text/plain

The empty wic plugin is used to create unformatted empty partitions for wic
images.

To use it you must pass "empty" as argument for the "--source" parameter in the
wks file. For example:
part foo --source empty --ondisk sda --size="1024" --align 1024

Change-Id: I0155561e9cc2ac11159e181eec9e4d9ae11555c3
Issue-Id: SCM-889
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../scripts/lib/wic/plugins/source/empty.py        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py

diff --git a/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
new file mode 100644
index 0000000..041617d
--- /dev/null
+++ b/meta-arm-autonomy/scripts/lib/wic/plugins/source/empty.py
@@ -0,0 +1,32 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+# The empty wic plugin is used to create unformatted empty partitions for wic
+# images.
+# To use it you must pass "empty" as argument for the "--source" parameter in
+# the wks file. For example:
+# part foo --source empty --ondisk sda --size="1024" --align 1024
+
+import logging
+
+from wic.pluginbase import SourcePlugin
+
+logger = logging.getLogger('wic')
+
+class EmptyPartitionPlugin(SourcePlugin):
+    """
+    Populate unformatted empty partition.
+    """
+
+    name = 'empty'
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        return
-- 
2.7.4

