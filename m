Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web11.11851.1599133280768077791
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=V2yM4AfM;
 spf=pass (domain: arm.com, ip: 40.107.6.74, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQiECchGhmFYl4/gCUkYlg9Hw9VdKw7oonSU+7Rsh/Q=;
 b=V2yM4AfMpnEOX5/R2R6aIAoLOG7Y1LcQQKE/OxD9+lfq3xdbnxszSuokLH7kB0hEIQX58LCTf3V2PY7taoVgC+Wu2HLHTBtPC6UKDhyTzf2UbemzKf9oG5A5rtLHrrIvTpAJtKMgSgE072enmlk82pHc/emSwEyXqVR4Sby11hw=
Received: from DB6PR0301CA0083.eurprd03.prod.outlook.com (2603:10a6:6:30::30)
 by DB6PR08MB2824.eurprd08.prod.outlook.com (2603:10a6:6:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 11:41:18 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::63) by DB6PR0301CA0083.outlook.office365.com
 (2603:10a6:6:30::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Thu, 3 Sep 2020 11:41:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:41:18 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Thu, 03 Sep 2020 11:41:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ebd819233cda72a
X-CR-MTA-TID: 64aa7808
Received: from adf5eb66d691.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E2CF5C56-6521-4825-A34C-721E392D9D84.1;
	Thu, 03 Sep 2020 11:40:41 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id adf5eb66d691.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGGXA9vi/fCvEgJG9wTKPdRPUMOpDPXbgCxfn0c7dxMP+0Wr4Ivw255r5d34/5+Kg6G9+YpcwImxKWojtQwtvENhHPCiSBQXMW0QvX99IHofJUlXDhA+Q76+KI4pDbVc+TwzlzUP/f73yqokbz7wjhLuqq5xKq6/wcERButIgNiapYck5AiPgHxcigNJvxMrlUgBo76u11slElK6vKHDLfRKb3JqzYbrhXy7wCYzqcZZ0qtlYzLFZed+VHSYlQYkEjEkh/KbezBIbw/G46nWvWVcOKAZMUG1d7+k26PsZftDA5I+xWEP8kTAhtwy5BFL7iJEofTYiDIspqeyV3pWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQiECchGhmFYl4/gCUkYlg9Hw9VdKw7oonSU+7Rsh/Q=;
 b=MK9P8kDZmkOAiKoncTU1KbeEHBL77vCset7NXcPeJNZAvUhH0mdKgBTYebg0dYT/UZpn3oECa9yn8gX9biF+p6bggadEXadEQHhxcYUWOs53dpnILg9uBymtmC9bfid0FAokut0K+c7S3i98t0slf3KQFdmzUn18HXQc88HWDEfMT6jm4JdKNgoZ9Wnd9Q5vAZcDgaJn6IsYABXvOXm3bRIZH7/nlTpdTJ8LM7ZE9dvKLGhda52LFQi8FRgbiN1yOZohrzuTFbjRK6/oaKZNsNeOeCGAWdTj3lhJCagx9IiQoWEY/BmEkvXEY1clf2CtK3ZyD8PYdfO4vcmp03orgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQiECchGhmFYl4/gCUkYlg9Hw9VdKw7oonSU+7Rsh/Q=;
 b=V2yM4AfMpnEOX5/R2R6aIAoLOG7Y1LcQQKE/OxD9+lfq3xdbnxszSuokLH7kB0hEIQX58LCTf3V2PY7taoVgC+Wu2HLHTBtPC6UKDhyTzf2UbemzKf9oG5A5rtLHrrIvTpAJtKMgSgE072enmlk82pHc/emSwEyXqVR4Sby11hw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3688.eurprd08.prod.outlook.com (2603:10a6:20b:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 11:40:40 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:40 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 9/9] arm-autonomy/xen/gem5: Update EARLY_PRINTK support
Date: Thu,  3 Sep 2020 12:40:30 +0100
Message-Id: <2fd736944f83ac657e8e508bc1bafeacf570dc7a.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:36 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 72e0647f-28b2-43e3-53d9-08d84ffe45c9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3688:|DB6PR08MB2824:
X-Microsoft-Antispam-PRVS: 
	<DB6PR08MB28246848FB540EC1BEF987BE922C0@DB6PR08MB2824.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jIZZtXv2aQIxGnsv49F73kk/+macIOInDIEwx4Zg74m2g+WiIRa0Eiq3+EwHxFLSHboOMmzFZ9LsuN0uLVou3pXCgpkMlyh8/E3WbCMXAxV4+cdgtMLtd7TFgZ+cenO+Khp1ngwiRw4la3G5ranG84BTTnXsqzqBK5zQD5qbkR54eYDYyNdTagU6fspQr09NS1PyvFRSz6l0vfDvEaVQKdJf9gyCo6OK3FbvnMeQ58uiomkA/C2TvT+lVyY4aCW5HB46Ei1yLbyNtL5z9ajSf/w+3R57Y3NsE7Im40NjkjYEYkzol0tWxK0l2221fbfVCJ46AZJzD9JkalrWc5n6NA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52116002)(8936002)(44832011)(6666004)(86362001)(8676002)(478600001)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(6486002)(5660300002)(186003)(83380400001)(26005)(16576012)(6916009)(956004)(316002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 xZL9M6Wvi9b+Vq/wfXRlRrRIkEZ0Ypxh1otgIbNzQkh/Zz+dQENYbilzguqJfXSFE5bj97M7O2hYLP6FWgPpiZZQeoodLDgM1DBhwBs54Ir2PH8WeYPhTonL7FGDBpb38e+GCyUbpkYrvrQYORMwYFGtKGEnt69M2W9ehXko0x1SZNTE4ut3zYgLDMIKcQw4QA9OuZ3pURq39UhiAM/nEdxEahagCnIIjuWudaiLiAwzZGs7BQ0k1LKbT/06GrMk302r5gfPyLr7WQXwrUttGG6KHT6PcVw6mWuHlxoU6FwVuYzr9qDbgzTgbun2m8DkZWQirbqeBol7EekZ8/VjRW7YnaQYOeVTupNrUVADZvFoeCmy77uT2ovU7g/dHQKzlm6aMcvaqWeVQDzmXGFXftrc1yIm1CG2xey+4V/gk9j8n84XyHr44FgeeNlGwGz9fcb6MChouUAkolGXJvnacqCpY4WKpTK3RWlaiY7ljNX0Xwi5ZOo3oSfB44zv2K//hWRlbxOuFED6GOqqZLuxvopaYNXHUfu6stKuQ4PkiKw6LAj0s0IuXvAkFIb81graoPOxiN284KIB5arROddiPaGkxFnCB2obFCBOJVOqEedPduCzT6WA++O/QwWqpfcNRokzG9Dy54KsfNLFCBhUzA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3688
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	df257c72-d291-4a90-30e5-08d84ffe2cbb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rB9qe6CqNSI9aaWdHPaF9ExfK8PHDts9oBqc8LRHCuf598e1uEZPIa7Q0xhzcKvZXIvKbeaZAWja2N5/t32oMg/cfRqePE3enHtmjGUK6vLdDHPdHhoJzH1yeSGzgxlxwLP1GZ2JZRtTaDQkpP7TddbwLVepnIT1unWKCyOPfYs52rEV+xOvU8kR916c151iH5zEs7Ih8GhpCyEwufLnAGkonsqSb43peP09B1c2o0h+tqC0rr/iWG4jXdbWlERXANLb/gGQsA3JmScCUEhHk2DIU3fbKuTDHqF4TH6zJVquIKOKv2xagHq9iU1xGYT9kLdbI/qCj2E2B6L+jPmly7PuA1mYFFJOu6O++ljkaAP7M3xyIUv9VP2/RKkra9Z0MxdJ+kANEPtUp2ij5QNLdQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(36756003)(4326008)(336012)(2906002)(26005)(70206006)(70586007)(5660300002)(6916009)(316002)(186003)(2616005)(8676002)(8936002)(478600001)(83380400001)(44832011)(956004)(6486002)(86362001)(82310400003)(81166007)(16576012)(82740400003)(6666004)(47076004)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:41:18.3974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e0647f-28b2-43e3-53d9-08d84ffe45c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2824
Content-Type: text/plain

From Xen 4.14 version, the CONFIG_EARLY_PRINTK setting was moved from the
make define setting in xen/arch/arm/Rules.mk to the Kconfig infrastructure.
Hence, we need to make usage of config fragments to add this option to the
supported machines.

Change-Id: I64a7dfbe05c803e59f3296d7d0799126b2eb7d1f
Issue-Id: SCM-1197
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-extended/xen/files/gem5-arm64/early-printk.cfg          | 2 ++
 .../dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend    | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/files/gem5-arm64/early-printk.cfg

diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/files/gem5-arm64/early-printk.cfg b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/files/gem5-arm64/early-printk.cfg
new file mode 100644
index 0000000..e89e546
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/files/gem5-arm64/early-printk.cfg
@@ -0,0 +1,2 @@
+CONFIG_DEBUG=y
+CONFIG_EARLY_PRINTK_VEXPRESS=y
diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
index 9e7ba45..ef42c52 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xen_%.bbappend
@@ -1,2 +1,4 @@
-# Machine specific settings
-XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
+# gem5-arm64 support
+COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
+FILESEXTRAPATHS_prepend_gem5-arm64 := "${THISDIR}/files:"
+SRC_URI_append_gem5-arm64 = " file://early-printk.cfg"
-- 
2.7.4

