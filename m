Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.70])
 by mx.groups.io with SMTP id smtpd.web11.4276.1596829418707562041
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=x4r0ZQ+W;
 spf=pass (domain: arm.com, ip: 40.107.12.70, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2f6zmNyjZ2X5iPcnuPYHBENumguEQhlwXPXkduodi4=;
 b=x4r0ZQ+WQN5jemef+MpAecCCdY1dvntwCZWaPUX4RdJcbqdSo4s8wUTzkaWc9rSSoZ0e355KxMTvKuvqLZNsTqobSjk8ecXTl33QtaQSDYZoo06y4dsrCloX+bglyUdT0nNTzicUXrHBPXeUOkqAW9vFnj6KCO0wJ3ou1MJoB1c=
Received: from AM6P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::42)
 by PR2PR08MB4778.eurprd08.prod.outlook.com (2603:10a6:101:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:35 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::92) by AM6P192CA0029.outlook.office365.com
 (2603:10a6:209:83::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:35 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 07 Aug 2020 19:43:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4f5ebb578da47b8a
X-CR-MTA-TID: 64aa7808
Received: from 1c930c5c291e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FBA991E4-1F18-4FE0-AB6C-FE7E983696B4.1;
	Fri, 07 Aug 2020 19:43:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c930c5c291e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZcrg+YpLvLOgl1ZifBwPwHhswJ7KSZqKwuBaznkE1SbuxO4sTjJRCJ876MRLm6QNlsAS8zwmFtgakCqaughDOepfyUhF4F/cw9wzY5xEUbXbT9giZESoySzRrqMqEULLvF81ZSf0TIc4/PhH8dmno+C6B8Ujh4leME82FYPV8+R6BuOz/KWqbZJzjcmYTKGmU6ALPAMIzwYxDdp2Yyto8erzmq4zB+tEehPWzbGMYTb1BsM5VIrMCti1PAZ1RGuqihShx81ppnrXNcLoRdbbUU/2sS7AhH7CvZIs23GxD9mY+tZnqVXBXEVeq599eSYVZe1MmuTMs/WKW8GFcpiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2f6zmNyjZ2X5iPcnuPYHBENumguEQhlwXPXkduodi4=;
 b=eS1sCczi6TJ0GyDRjSpNfbH5FQsFRgX5Q5GNpS11BeE6Y1CVN3uXqjWNpDpsgsHiquMyaKpKAp5DUV1qUl4mM22fZ+jPSP/3D3U/vFIJ9VEIq3C8kyV23OF9W3tqnoYqzh+FJMAhtiqM5yZwuu2tdClfw7ekNfRh98meLn5HpkJSgSrQvQ7NZ7ntTms4ODovtiIJ7DsHS2Tk4x6U66R+HLWIusy3Q+JOuU4N+5WWLVrJVjxeArg35208+VPOh8lBmmKD9xn7y8RDu0xHAD6oiM1JMOk4QfivxJkQ0dcES2ZFjGVIerwZKPH33MLfcf9wicABPV6ZsoBIJ4ykfEs+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2f6zmNyjZ2X5iPcnuPYHBENumguEQhlwXPXkduodi4=;
 b=x4r0ZQ+WQN5jemef+MpAecCCdY1dvntwCZWaPUX4RdJcbqdSo4s8wUTzkaWc9rSSoZ0e355KxMTvKuvqLZNsTqobSjk8ecXTl33QtaQSDYZoo06y4dsrCloX+bglyUdT0nNTzicUXrHBPXeUOkqAW9vFnj6KCO0wJ3ou1MJoB1c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:28 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:28 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 9/9] arm-bsp/linux: Enabling lan9115 Ethernet for corstone700-mps3
Date: Fri,  7 Aug 2020 20:42:53 +0100
Message-Id: <20200807194253.14748-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7bf9b678-959b-426e-73ae-08d83b0a2c60
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|PR2PR08MB4778:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4778A5DA3A8F75F51D1DEB8EFD490@PR2PR08MB4778.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dNM5XISeJKImywwrG2trXJdl43iFEcXtdSuU062/eAJ8TgPYiC20Mk6kjF1Ayd9lLkgkrdH8M+Lbm9tUxopkJ62N3Vs8puHPNitBLC0/B2STOe97JooKsdBN002b0RJPmn5rLWl3AV0f0fTdyxBy+UcTLXvMDfrulLVj3a7ahT+7lu/l6d68xcPJKGSpl1MYwVVECn6zFSt/bm/EeTAKUXhQbAX1wMYVxVK2A2xJ6W9c6Wcl09xkpQB/FJ4nSd3OlrNxNrEOrgTNmbB4CHjAWfG8OWO/BAK01FnXRAGEkbXEpFcFghsJicXl8PH29EnSxq8m8RQsedJAQWT4bbs6Cg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(8936002)(4326008)(6916009)(1076003)(5660300002)(956004)(2616005)(8676002)(6486002)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 pqbR86+I0IIxlK6zp9VF9viXS/ooo6NZrxMA3soAt/MTrVygvjC1mJ0vzX7EGi2P4wFmEB9Ys/rFvGHSvFapBg5rmXV/S8TSSKXwXD/wkmpyujXfdZ1RpNyWrpqCaEiP26wpHepaZYLqdG6Sn9WatO28rieh3RvU408gbpr34GibBxaKTZ/6MnEq3KgxaL5GVrgKWfZ27oWekONNPExui6wqC7g4BATfdeeGQMevSAvxsI2e77xb//HdB8wFBNxC7f4hfF6C3oW5wHQtxKcGd8wgoDXm0XrItbhGO7BsLoqV5fiexKe4ij77VM2zq4IhMaYPD6amn9hnOJTGZwHk+Br+16uOi8y7do/JS1cYuhaeurbkzJwnv5Rq+/p1sLP/DplVK62hRr2GocunSflAYLfwnCysdk5ZUIWlmtIg/5XPyaxSae8arlERatLmTsIFJoEg4XI9cAJJCtJydaP/L9MeiSvT+PSk97S2/1rKXYha50OoQZWDgsPT+rbJMNPKZpJQ1nGuZHtIpsEj84sOVz1GIvvvWsWP1i+9ymE4+XL3tGznxiYEdoCtzUQEm8FW/6l+7sIVcNIQu/dvhB+UYc4oMoEwBUKwsgvgTE5np2b9I3PXN8hWrtzClkstPXCcUJ7t0N/s76pDeZGslkKT4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c55e3c21-5f68-47e0-b0a3-08d83b0a281c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GVirL19lhuHz3JoiAH1acM3N52YTmcmRF/gX3ccXMn1/o8KPZDnZXRZiDXtypTTTrtjUvsAyuBv9CeV4yR/kXl8+41pIj4GnZftX4w0omMeD0ZN64aOt3TlAssrSHEqiE1upL1BzIHALLMJKWYT3PSh1P/2ZFIfxmcU/4+qC7g6NWiUETfNLqoj5eLaK/FFv5kkuMnylvkgGQl83Z9u2hyYhpcgq5Ty/WlfKU0wWlJMbETWWWDjb5nsIwRbVnbIpEZJR1dwtf4x2ETiv1gaNRJHfzJZnVSpQMg5Rg+i7Sp42XoSSOpscrgSulyXUWyh7IQIkgZuO8QclRlAYCrmxyFJAA+qpOY1JwjroRaIYdUt3VbRzXdynCaMmR682lZo6U7hAbeVsANkqVsVh3sHxfg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(82740400003)(1076003)(16526019)(478600001)(336012)(36756003)(2906002)(6486002)(6666004)(36906005)(70206006)(26005)(316002)(186003)(47076004)(7696005)(956004)(2616005)(9686003)(356005)(8936002)(5660300002)(81166007)(8676002)(4326008)(70586007)(6916009)(86362001)(82310400002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:35.2066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf9b678-959b-426e-73ae-08d83b0a2c60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4778
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit enables lan9115 Ethernet in the v5.6 kernel
as a machine feature.

Change-Id: Ib8e724a64b24db3048a2b12973824bba9f3eecc4
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/corstone700-mps3.conf           | 5 +++++
 .../bsp/arm-platforms/corstone700/eth_lan9115.scc         | 4 ++++
 .../bsp/arm-platforms/corstone700/lan9115.cfg             | 1 +
 .../recipes-kernel/linux/linux-stable-corstone700.inc     | 8 ++++++++
 4 files changed, 18 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
index 28d7050..88ef5c1 100644
--- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -4,4 +4,9 @@
 
 require conf/machine/include/corstone700.inc
 
+# default feature used: eth_lan9115
+# add the following line to local.conf to disable the feature:
+# MACHINE_FEATURES_remove = "eth_lan9115"
+MACHINE_FEATURES += "eth_lan9115"
+
 TFA_TARGET_PLATFORM = "fpga"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
new file mode 100644
index 0000000..94cb13e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Ethernet feature using lan9115"
+
+kconf hardware pnp.cfg
+kconf hardware lan9115.cfg
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
new file mode 100644
index 0000000..cd77ec3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
@@ -0,0 +1 @@
+CONFIG_SMSC911X=y
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
index 63f48df..95a8bab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
@@ -52,3 +52,11 @@ KERNEL_FEATURES_append_corstone700-fvp = " \
                           bsp/arm-platforms/corstone700/eth_lan91c111.scc', \
                          'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
                           d)}"
+
+KERNEL_FEATURES_append_corstone700-mps3 = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'eth_lan9115', \
+                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg \
+                          bsp/arm-platforms/corstone700/eth_lan9115.scc', \
+                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', \
+                          d)}"
-- 
2.17.1

