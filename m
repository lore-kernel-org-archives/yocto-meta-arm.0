Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.56])
 by mx.groups.io with SMTP id smtpd.web10.3822.1588849730285859757
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=iHBCqkdG;
 spf=pass (domain: arm.com, ip: 40.107.2.56, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAKdDgtM+xAg748EK752Z/BgHg8XnraW2arEaLm/UEw=;
 b=iHBCqkdGAbZdfLtZPF5J7+JZiqFn5oXJAwUqUCSEKayxehdYNH3GKhdqYRR+88cMY0b/OR48I8HNlhM9m78M8r9dPeBFaVWih70BBJMvkZw415gMYkrWMV3CCX61WT1QJN5rFu0fTMtpZajoilRsLMhU59dksKqu5Zok2AYA0J8=
Received: from DB6PR07CA0082.eurprd07.prod.outlook.com (2603:10a6:6:2b::20) by
 DB6PR0801MB1639.eurprd08.prod.outlook.com (2603:10a6:4:3b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28; Thu, 7 May 2020 11:08:47 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::a7) by DB6PR07CA0082.outlook.office365.com
 (2603:10a6:6:2b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Thu, 7 May 2020 11:08:45 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:08:45 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Thu, 07 May 2020 11:08:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 73d45f20a5586cbb
X-CR-MTA-TID: 64aa7808
Received: from 52f9c736c76c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2A53FEB7-8C34-4AD2-BD60-3130626C96E0.1;
	Thu, 07 May 2020 11:08:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 52f9c736c76c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPNSqN78L5WXkzgMha1U0YeaxAe3Xa6/aJTXJaF8YgqE7wkNjA87jxfImy8daX6cBobjPggOA0rSp6eAWgKdBT9Nju3vg+DlRwQK59dHC5BH9N1Js9QMphHe6rOr+Ywk7Fhv8E/i3PntmQ6Ae3/3JoT4k9pIexMZI6M9z+jvC4tf0xCUrbUEo9+n+R79fw4NcKgQBmV2TwsGmF/gI3c2vDgwvTGWyZih5SN19Rgr6MY424vAVtBHMRVlMFemZCMQm1CFhOjUH2n3ZKak/reVU5Rfrr7AKKvU++XLWwt8bP0Z6wg4+JCDh/HtJadfT0xfywXiEii8fING0uwhv6NxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAKdDgtM+xAg748EK752Z/BgHg8XnraW2arEaLm/UEw=;
 b=EJYYXCsp2zvIIvNX+iS/A0xGLr4tD9ViMSTg7tv8faoveFUnmELzHHHwPgpFrxUCSi8sWzxGR1FYUPkcz1kd8gK6cPqWhQ2Gvn07c6sW+rR/cZ7WHhMRVqaGwTIt7dWfI3HNnvizBf8XXAiKOipfpqkIJxHZt1QiVCpg1PWDUTmGMjZCMtrvttqaECJACxB8dZZdyw4bwhNrI2pOgrbIfoHFW3/QRrkUPDr/QCRfXqlty61MO/QKT21oalevsH2g56juT8Y6MQ4prsRWNDp1IIKkXIoVuu4Q+Za+92aABjSzyGpWh8CwwAZx2K/zjdI2A6Ms2U8iw1wnkrsWQHnpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAKdDgtM+xAg748EK752Z/BgHg8XnraW2arEaLm/UEw=;
 b=iHBCqkdGAbZdfLtZPF5J7+JZiqFn5oXJAwUqUCSEKayxehdYNH3GKhdqYRR+88cMY0b/OR48I8HNlhM9m78M8r9dPeBFaVWih70BBJMvkZw415gMYkrWMV3CCX61WT1QJN5rFu0fTMtpZajoilRsLMhU59dksKqu5Zok2AYA0J8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2954.eurprd08.prod.outlook.com (2603:10a6:5:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 11:08:38 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:08:38 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] [arm-autonomy] Don't include kernels in arm-autonomy-host images
Date: Thu,  7 May 2020 12:08:23 +0100
Message-Id: <20200507110825.38541-3-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507110825.38541-1-bertrand.marquis@arm.com>
References: <20200507110825.38541-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 11:08:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cbbb339a-0882-4830-7032-08d7f27702b4
X-MS-TrafficTypeDiagnostic: DB7PR08MB2954:|DB6PR0801MB1639:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB16391963DA0AD1A435250AB79DA50@DB6PR0801MB1639.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Aj6kQnEEKTIQLihEaDKjo7WPYHJnGmtmfRvJYPo4sVrlReBCpnwrZ9JO81tkE9aLnVjaspwratU/9JYCF4ZiiD+gQXX6bXEb3kc6QVqqk2/9nsY8CtJ+gSWQDJ113HJ9AhUFV+4B7zR+ERNqA68XiIvx1vTt115tkNj5VU7olKkdnLVwHXBekcqon0yl/74/eBrtEZuWrqxUZfhwPakDV3TPfJT1KFM50bi6ufk8W7FbM3z+UK1tsIJRwRF8hf4bs0cJ7fhJF1fAiFsGzTYO8YKmhhycKMvh2v5d+8hKdA9SZvwCR0u7/xThVap4uJRZMy/6zjkH7lzg670mM0ngC5O62XPY85l+NHTxAMTqm9GKe8SP/PE0ZtoZVOsUhmYNJCZ9WcUKBsDDJVb6wAeFpNuKXI9Wn35Ro4MOO5JyDcvx8v7OjI9Gz017WBlzGQQzhDJSKV3UpKFLkraQRiyFYOxAjJNU0mCKmqQ3mCpU0hc23hIx3JXcbUN/1ZV1ATyXMRPMTWVEn7bZHoP7dc+Txg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(33430700001)(1076003)(16526019)(316002)(2616005)(8936002)(5660300002)(33440700001)(44832011)(66946007)(4326008)(66476007)(2906002)(186003)(956004)(52116002)(86362001)(83280400001)(83320400001)(83290400001)(26005)(36756003)(478600001)(83310400001)(6666004)(83300400001)(7696005)(8676002)(6486002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 6Q3tX9S0bcYTjF3oN1pYmge7g5Kgf8iwR7pG8/Dp1vmS490tFtdM/iQW6d63/df8D0+ZVpjMNJZaj9hE3qdNgWd1+gS2HrHB8KRrOqsCrPZsRxdFJKDnGuuuKIW4OvyXvYqIHY/FzUWKpQ0LXnc+gdYwOgSpF67E24WiVZxU+MPEk9iNucpkgYfdFSwtYAyrSKMJlJWHXwi1vcCMx1Y3S2hrfCk/rlAtZvFsXVYHihmj6898RvUK5l4e7QyMbc4f7KstikF1aTlB2DuJvPLac4VEBcLouPVbPxMPa0owQypoKtQ8FR4bhepL62qvkmAzDEMuiiIlORGMwH5XBV3zXPK7bKcznDPvjLo6VSv8wNTSTpmFs0NLqIE3hqHh+pupKkReIGrLUgDWmAU/VE3ikolDIGE0poxBJqnCvlsdUSPF8CO28oH260GcfODA2ktbAW+t+5WdGdXuKOfAITUaxAkw6vSSsaxZ5sEAxwA+AJsUcQWo7MSROPoDPHf6sHqKMoFnZuv8yFXqO9SDVfdkQ3hE4IaEkK8yfYxdQtnt/zDkPgw0TIylHZ/nvmua/D+zAW5cLHOPu+uZ4WPRi4NhC8E95JsTde9sKdFyZ5q+V+sUBx4YHL5zE0DVFOXdF+j8LyPNKatWoaSaIv0T3u7V0H0zEA7gcVonwdMrQQLdSkMw1OIRipMkg62QoddK6RQRZkFH2TzM2kKyfdE1B3Uw+5FmA1ihk46HDBMzClPlKdwn5rjnCf0+gCKO2UnUOAyWP0+Kb5pC73rAZLsKQ9YE+U8yEZToJvK09pA5NTmhvTs=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2954
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(33430700001)(33440700001)(8676002)(16526019)(186003)(478600001)(336012)(356005)(47076004)(82740400003)(36756003)(316002)(5660300002)(1076003)(4326008)(70206006)(82310400002)(8936002)(81166007)(86362001)(6666004)(6486002)(44832011)(6916009)(956004)(2616005)(70586007)(7696005)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9d01c009-05fa-4663-e6f3-08d7f276fe33
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lh/lxB01dCXC7cppLSfyiit0Ww9IHVeluM5gih+xx9XyOWc1x/DNqAjDjSYutto4txHD4Xv3DhvOluYZSPRFMxAuWeWHxglLAKceCr74hFK/jMn0LIv/9B0xUk93oS6BcyeL5mJDmDmlvLXC3eNZovkH2brX8FfbLGht3NFjt1UvWrXnlUUkA23AYHqqy5F09wXnLdeBBLM5hZDzzsX5cUiIARLTEI6lJi4Q/53EAmeN+hZ32EeWq7TjTVNjFTAdzKX6k2XKH1ijZqvrOCshwkgOYtvdMkwh3oVSkQEPdj+do83i5mijcWjx+yGbsmdM5CkSNpoKmFM2aCJZCc07ls0XAeg6Wggzg7AzsEtFaT5QthKNFVFzH/yeLK96cJLBGkxWgA8lWo3beukzUO0PyceGl7zYzeogOljYBFBfSuxcITh4F4MVkwgKXcAtj4NmI+E8oONFCjgKT9SaAXMnuVm2bCPHpWJqFxbdHZIo4mDPfY8NoGr1FYeMJXzHSCInzqvMBQZ7w6O/svRjuyJfOgbxp36Zxn6mjdPxrk9CmQe8rrm0Hpj8TxogC8PuE3D0PU4RzNmHf0+G7atkZyb3mg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:08:45.6554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbb339a-0882-4830-7032-08d7f27702b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1639
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

To reduce arm-autonomy-host images size we don't include the Kernel
image.

Change-Id: Ibcadf873fc71f3793b2824e5169a777ee8a0ece6
Issue-Id: SCM-813
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/README.md                                 | 1 +
 meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index 836d459..785f278 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -25,6 +25,7 @@ This layer is adding the following Yocto DISTRO_FEATURES:
   an autonomy host system. It is doing the following:
   - add 'xen' and 'ipv4' to DISTRO_FEATURES.
   - add xen backend drivers to linux kernel configuration.
+  - To reduce the root filesystem image size the kernel image is not installed.
 
 * arm-autonomy-guest: this feature activates functionalities to run as guest
   of an autonomy system. It is doing the following:
diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
index 236fbe9..bd98ae2 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -3,3 +3,7 @@
 # We need to have xen and ipv4 activated
 DISTRO_FEATURES_append = " xen ipv4"
 
+# Don't include kernels in standard images when building arm-autonomy-host
+# If the kernel image is needed in the rootfs the following should be set from
+# a bbappend: RDEPENDS_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-image"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= ""
-- 
2.17.1

