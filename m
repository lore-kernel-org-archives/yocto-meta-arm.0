Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web11.10056.1596121536680881003
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=boacchvN;
 spf=pass (domain: arm.com, ip: 40.107.8.78, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThHiGicwd/VkaSPAq8zUWAHCsm83Q7srEjpOBwuGn4k=;
 b=boacchvN1Gl8yCoy9C4Z/ZBO30R06IXwOZ4ed/EqucH2jg/SOqUnzmT4VbFi0zPKyF19FTyFC1UFqYM+OeXOTiB1zXd7o93cVEpzoI27FRSi7Yn4iK0A/CqDnJtD/ch6yvuZYWtVTDfO/DrIbvOYUcmsWTlJVkdSRgMUWD38aBw=
Received: from MR2P264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::23) by
 VI1PR08MB3999.eurprd08.prod.outlook.com (2603:10a6:803:ea::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22; Thu, 30 Jul 2020 15:05:33 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::92) by MR2P264CA0011.outlook.office365.com
 (2603:10a6:500:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:05:33 +0000
Received: ("Tessian outbound 8f45de5545d6:v62"); Thu, 30 Jul 2020 15:05:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82999b698c3bbc47
X-CR-MTA-TID: 64aa7808
Received: from 31a346cdd366.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C2209635-396D-487A-9C8D-A798C4A0E06F.1;
	Thu, 30 Jul 2020 15:05:27 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 31a346cdd366.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:05:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nG3XZlS8i/zvvzr8MgehrOWUZcLMszi1cqiLDKNnUG/m3/Qyn7zXogjSmcqJcBtKc6zqqKkKLogotkLXMOBTcOOIsF00TpXXJJIFXgYR8PrEJ56ma/+Kvmm2SS1sSUfKcpV9fZIQuRna1Sv0yeNigX0izbBY8EX/9lRvpe071W97mmBQGwdye/D6u52wc9Fk2CV9j4QSykspw3RsRt8P0m1MnAKzwiyqcCXiDWyC186AkHZLCu5hk8zlwpf9jdgbN2Kgr6YbbeAp3DP7Zy2eOOjXfALzAmH0a1yj/GF78d/cBzi7cte1uZOfAu8830oiFpRrDIJ4j6nctOW/A+Hy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThHiGicwd/VkaSPAq8zUWAHCsm83Q7srEjpOBwuGn4k=;
 b=g3gkUSIBLGV6cSJZ2DIY3GHaq2uFnnCKu7G2ZzT4OujKb6EURYQcJLLAWiICQpdoqF8VwmAX8atYywlbO9Ix2FO+fgOZphdTXeAvnr5xPtEGRutST10lsOdB9OW6NPrg93/mL0FbWoryJuiQ9dp8+9LY//wwXtt/rUN8fmcKxOI6/I6N221fJDUiVtESZ6UrOPOimgS0/WXeavpOVrYXaEe3t99RTmJWzDejCZoR15cvvsZg7SyA9MHWzZbHLpePv3QFrW9JkW63G/6zQQKPVkA57KBOa8KahTzaZFi2GjfIdnufmM1CWoVc+tabz5QZ0lN8LfHw9+4w5JnRE5jg3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThHiGicwd/VkaSPAq8zUWAHCsm83Q7srEjpOBwuGn4k=;
 b=boacchvN1Gl8yCoy9C4Z/ZBO30R06IXwOZ4ed/EqucH2jg/SOqUnzmT4VbFi0zPKyF19FTyFC1UFqYM+OeXOTiB1zXd7o93cVEpzoI27FRSi7Yn4iK0A/CqDnJtD/ch6yvuZYWtVTDfO/DrIbvOYUcmsWTlJVkdSRgMUWD38aBw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB7PR08MB3706.eurprd08.prod.outlook.com (2603:10a6:10:7f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 15:05:25 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 15:05:25 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/linux-linaro-arm: enable Realtek R8169 eth adapter driver for N1SDP
Date: Thu, 30 Jul 2020 20:35:14 +0530
Message-Id: <20200730150514.27717-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0439.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::19) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0439.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Thu, 30 Jul 2020 15:05:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1eba803-9d07-4dd8-a5ce-08d8349a01d2
X-MS-TrafficTypeDiagnostic: DB7PR08MB3706:|VI1PR08MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3999318BBFE6B0CBD9218486FA710@VI1PR08MB3999.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:497;OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Om5z+cGDWASugWxPqkaEnrve4vFNVS4GKhmD5/YEo12lVjuUcCQ+Q5CASHsTcI0ynsXnbUABb0Elv91Wt4PrBqfjLMYtgyDCEs6l7R0UhWZ9Hqitp0N+RXShoCNcG/GI2U8tJ7mWUQbmwVMoBH2WzEqyzEDS+ylWQnIdiGNX3CBbtCem/8Pw2mzzNCnGIq8NI+cpdQxUoDuSFDTloh9OTbLiqtIuJoOsgd+k6eNkswF3W3oo9cb/jmSe+NMhSKHv9oiGB7qzxmy852wowm+4nNgYJhdxUEooRZqQ9CuRxX3Suvlrtta8NY+EXBYBuuEnCuMNlQmYYGkzVpPLQGnKNUjlHWj8fB0zcnxQMpCACVzr7th6+Rgzr/thyGbJssyC
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39860400002)(36756003)(6666004)(1076003)(8676002)(66946007)(66556008)(5660300002)(66476007)(8936002)(86362001)(2906002)(4326008)(2616005)(956004)(7696005)(52116002)(186003)(16526019)(6916009)(6486002)(478600001)(83380400001)(316002)(26005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 O5BMfMWkxiNzUoJNFEOIsgBg3DyYeS4pEztGQwTkA5dNSnrNs3kKavXRyTo8bUTRWA0DMvHM5rLMxmabvfQBgWAsKfVtsEjyQs5akfRJBAzAHaW6LAYItZ0RVOisn5E19GV7j++xYybvr96QQXsN8qF+Z5V1SZZo1BV9j9oQeV/zyT+Orgo0JgGFXPG9hRWu2dzm0gaN/nr5aZniXo/aupb4ejORDDA0JAg7Kr4XY4UwHHtNt5CCNAARJVuyZcVqIZS4OLR4rD8F7GnlHGkbROfxMey+DJYesUqNJ835HRpVFKpn/ukyzxc4n7EgvVYIdTHXGX03dON8S7DkG5bUrIbw/gZ18zBPgyd1Ay2R/s4TR6rcfD1oZXPRaq94mKuAAOoQB8KoNHr0Iq3Wc7xyeJsFZD+D/U+CFdfq9yeA0Mgp3R45nGhXIqFJlLkw5fkJb6m4uxCO2D3Rdm8vCaStiVM9VmopcfwHmN2Mn+U7PdhiNRhQLPisyYZrSfrpg3cx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3706
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	83af1556-adfb-4bed-9aa9-08d83499fcba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7ijUfyQokIEwWXnRJQJ3ukm4h6uGsHTKiFI/4ONLJEl3t2LyAjvttXU7ptW4XEZ8fiRP+R5rGiQkdbcbKe54box30G8wzgeLaGvNXU0xYYJWlXqlzORuJTDJxIOKonhDwJe0bL54mTsehh4rXhKa32sM2rtafgXaQcAid8ZSWxyzcpFJQQw6kbtEVSPBrNjAlgxLJ2n4IFAc7euLtXGzF3k8wcIxosMkQWRdRedDTtE6Twd+Q9wd8OIU/ZorpZxDIMdCezFVn34HNGfj3j1OXZQ9sk+jokRohnynSzaAjhiuE4v0UZieeYfyR0mCni8225O4Eaty6ROna3N6GedxCfM4se9L1/kky+gXYZPRwP1hJh9DjC8lHEOgSFCrM9nI8CeT1SAjfKMTZDvC7RKbqd1N14TT2MbvOUokBoGWlSc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(26005)(83380400001)(2616005)(956004)(316002)(36906005)(4326008)(6486002)(6916009)(47076004)(6666004)(5660300002)(36756003)(16526019)(186003)(82740400003)(7696005)(478600001)(336012)(356005)(8936002)(2906002)(81166007)(1076003)(86362001)(70586007)(82310400002)(70206006)(8676002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:05:33.1945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eba803-9d07-4dd8-a5ce-08d8349a01d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3999
Content-Type: text/plain

By default kernel defconfig is not enabled to support Realtek adapter driver
required to get ethernet working on N1SDP. This patch enables the CONFIG_R8169
to add the support.

Issue-Id: PLATFORMS-3134
Change-Id: I218ca8e0011db7f02329e103c1dea1350ccc3c28
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg   | 2 ++
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
new file mode 100644
index 0000000..192cac0
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
@@ -0,0 +1,2 @@
+# Enable Realtek Gigabit Ethernet adapter
+CONFIG_R8169=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index 029dbbb..e2640e0 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -11,6 +11,7 @@ SRC_URI_append_n1sdp = " \
     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://enable-realtek-R8169.cfg \
     "
 
 # Referring to commit TAG N1SDP-2020.03.26
-- 
2.17.1

