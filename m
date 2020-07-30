Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.59])
 by mx.groups.io with SMTP id smtpd.web10.11179.1596124350159265674
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KLQK7qD+;
 spf=pass (domain: arm.com, ip: 40.107.6.59, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttUR/LyokTKTZoe5qMPQNJHTHEiI63lQUXXQaqycMHU=;
 b=KLQK7qD+JYamK6fhBdDmuhoyqLdgPX1XEJY+/SRgmi2YDr6pFj0g8327q3krlgZWTFj5uDNzmpAnUSp0hGY8H7m54E1PcwBY4M0XQvGYJIa7kj+Ajcn4ICGxpDQPtUvVT67gq7mYLCzJu0rP1qVXm2p6P8VlBipfccZ+tATxJDI=
Received: from AM5PR1001CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::36) by AM0PR08MB3154.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 30 Jul
 2020 15:52:27 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::66) by AM5PR1001CA0059.outlook.office365.com
 (2603:10a6:206:15::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Thu, 30 Jul 2020 15:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:52:27 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Thu, 30 Jul 2020 15:52:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59ab5f4fc8041067
X-CR-MTA-TID: 64aa7808
Received: from c97a3733ccf7.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8766BAC8-FD8B-4650-AA59-906C64E366D7.1;
	Thu, 30 Jul 2020 15:52:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c97a3733ccf7.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnazYAGSHyYG7JkrFRzHwLC3JU7Hwh0SUqwMV6rwhYmpBjsoqWqlnEL5nexXutkrQPUl0AVNSMDL8GkAD89ZnbXDmi5vGvNsm63UFPPLuNny/PjsE0onvoFwGjctFBFmOJNDwfBqwzVO3T8LvgsC3P7b2zaq3Df/XioeM8eJBRInWl6jfwzP2jLoWfDni9JQfLZkzWjW0sxHWH/w7GJoCWn43dzaPBKC0wRfrw14xImQ4oqiBp0e8MMxqLgdBn7e+APHZ+dgWNo1kaBWlqDhKTbTsOLIiQTQl1d0YjjPj4KBao/ypk/LTXvd4PV8hPZ7NkXiBe+HoOHgwOzVfsJzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttUR/LyokTKTZoe5qMPQNJHTHEiI63lQUXXQaqycMHU=;
 b=EJEnChOk/RUesbT+hjMGfMvCd1AEu5CyhO/9EBLDNvi+HRleINgzSvuSQw34ci6dufHMTofv/AulA4x4eLEkeOIlB2NZjd98rJk986AL9MgzkrT9ynMv5eEEseLfljclWPBnlSshWj2dFibR5V8nWnxVNp4O8+9zotDBnzTV6EA4RCz7VHo1JKfm/eIJKLb2RwCTwl0EWarnEhmuXw2GxEGUBfzpEgNN0CYihDArAfx3CB+912+GgGsFe1H9Cvm/weHcpojRFdP7fNIJccSEF4Xei/VVz5Bf0yz0oiUbk2nKDE8xZJB7mvXJfYHMw3t0+20qY7+TwaoohqsgeVVA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttUR/LyokTKTZoe5qMPQNJHTHEiI63lQUXXQaqycMHU=;
 b=KLQK7qD+JYamK6fhBdDmuhoyqLdgPX1XEJY+/SRgmi2YDr6pFj0g8327q3krlgZWTFj5uDNzmpAnUSp0hGY8H7m54E1PcwBY4M0XQvGYJIa7kj+Ajcn4ICGxpDQPtUvVT67gq7mYLCzJu0rP1qVXm2p6P8VlBipfccZ+tATxJDI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 15:52:19 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 15:52:19 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] arm-autonomy/linux-arm-autonomy: Extend netfilter config for host
Date: Thu, 30 Jul 2020 16:52:16 +0100
Message-Id: <1596124338-106961-2-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
References: <1596124338-106961-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::33) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by LO2P265CA0261.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.18 via Frontend Transport; Thu, 30 Jul 2020 15:52:19 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9b8e052-b941-4a32-71ec-08d834a08f13
X-MS-TrafficTypeDiagnostic: AM0PR08MB5425:|AM0PR08MB3154:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3154F06B89A1304040F2FF5B92710@AM0PR08MB3154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 E+Una2EzNjCvv6NEFC7OvvccrOxIOYTik5VE18z7Tm25TfbxwFejxav8XK5ZJ4EHdpaWShjp2SyyXpEDiyReY1CEqk+RbLhmCKYOiw50k8zEHkz7+l/5CqFSzA1vWIDrHHwAzsgdTWwLxbr9yr+9rxckQorkkT0R608iDTDOErF7dIUzulIAof7GTNBlydrqAcTpB2aMMya4WZhDvoFCSbU+ixvZ0I2s/gC5gC/XkYNQacAvYYr378d3Y5XnUvQ4QaHICPzLcK9R0w0g/ePfRrrGx89rNpVNw5Do8gwxxCYRCzNYmW7e3Eg/+en7lF2EJziVkJr9xmxynNxeiW3c1w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(66946007)(66556008)(2906002)(8676002)(316002)(478600001)(8936002)(956004)(16526019)(6486002)(26005)(6666004)(2616005)(36756003)(186003)(66476007)(52116002)(83380400001)(6916009)(4326008)(5660300002)(44832011)(86362001)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 paEDyhFXv4CjZ2D2H3cQGTLgwNJtVidldiTiGpGLE+KLi4XlMe3lWysECiCyF64z0WQm2BYbfsGMcmrJ/46REPPvP1GSN4LyT2SCqtA8rHo0s5td6e457ER+YkazJT0+yxYFsBtGWVPxYDSyGGZdnJTfzUZ2fHeBFcjzUO2WCNODLPdDPdzhX2ACyjDKhPyE/HoJDrPmueeQ0XHrUdPQSjdpQr9C9GMeXxj2+C5MHFHNo7dsLx/Eln/DvKEsXnOKak7QrO8HHnTH5bit0UGfSTk7pJu3hZY3W1cedUv7NMco3xDeiZV8+6Xnb4uyMZES5JMhANxs281mOdtWCJAZH+P8IfQJ/iFdrj9IEMlDnOXoAGe2IPOEotuNbhCUyo0a1qLDJd0hqPo7p4B/jyuuhIrE9TPCPgLHhDdMSiiQgDa8yXC1/tPlNVP/aT5XF0O/h2qm7o6XKvfEmWsz1lQnH6MTfeW8ml8RCn1Qozsgi2EnK5XxhRK3Ad6xJX5Z7AjLi4Gez8CoGA17zm5YOgdcO3vakUctq1HvVjYB4UMkl1p4L3MIoJToxKxJkGzI6TeZ1A/eGAucoLpCYKhSjg4TPCkjzViuI1ejsmvYBI05GyCyI7UH5kWvqUU0SxUGSdKrQLxPOAgy9JoLI4BW5gYkww==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c45fd333-675c-4a51-efea-08d834a08a8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GR28Bdvv2w5X4dqL33XFXjhEZeJ64SXY+tQBn4YKMS2cxf7DagxjetEN5M+WCV8TrRlhmxB3+nakK3O2vYCYDpu6eAedJtsPm6zEV8fjnKea7JhsYcbGjNHvrhhKuqTY2gCOaQ2XDRB6OTizLZnRgnc074Qykf6O/Bu75Mwc7xCPDWdXZJGIHNtWZeuZ1flJJNlLd4Si27JDZxXCeYgugD+DIj8Zbh+iascddopN9/DsW5ImwmfpOl1B2bAy2M7TWn6alOteAJIcLHtxteRKPfBLGLKlEYGWDl/83zMtSxLaUPLIBuwi8EeexsnpqtUp3U78MtiqqKJVhcLcWSxNDtcNpKX3ZpTlGCiKuwz0qBGln6072ydXWRXuiK9PLyN+uSu70wAbL6Fp1lNAlKxF3Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966005)(478600001)(2906002)(8936002)(956004)(83380400001)(2616005)(6916009)(8676002)(4326008)(356005)(82310400002)(5660300002)(82740400003)(81166007)(44832011)(47076004)(86362001)(316002)(36906005)(7696005)(36756003)(70206006)(336012)(70586007)(16526019)(186003)(6486002)(26005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:52:27.2183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b8e052-b941-4a32-71ec-08d834a08f13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3154
Content-Type: text/plain

To properly set the iptables rules to be applied when configuring the
network between the host and guest we need to have the netfilter.scc
kernel feature and following kernel extra kernel configs:
CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m

Change-Id: I6f3ff9e8db5d359efba5fb3ead04703f4f2ec88b
Issue-Id: SCM-1019
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg | 2 ++
 .../features/arm-autonomy/xen-host-iptables.scc                  | 9 +++++++++
 meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc    | 6 +++++-
 3 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg
 create mode 100644 meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg
new file mode 100644
index 0000000..1a57369
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/netfilter-extra.cfg
@@ -0,0 +1,2 @@
+CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
+CONFIG_NETFILTER_XT_MATCH_COMMENT=m
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
new file mode 100644
index 0000000..8f8ba45
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host-iptables.scc
@@ -0,0 +1,9 @@
+#
+# Not directly sourced via a kernel type but via an external bb
+#
+
+define KFEATURE_DESCRIPTION "Enable netfilter + conn tracking + extras"
+define KFEATURE_COMPATIBILITY all
+
+include features/netfilter/netfilter.scc
+kconf non-hardware netfilter-extra.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index 2763444..5f55d9b 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -10,7 +10,11 @@ SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;
 
 # Add xen host drivers to kernel if arm-autonomy-host is activated
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
-        'arm-autonomy-host', 'features/arm-autonomy/xen-host.scc', '', d)}"
+        'arm-autonomy-host', \
+        'features/arm-autonomy/xen-host.scc \
+         features/arm-autonomy/xen-host-iptables.scc', \
+        '', d)}"
+
 
 # Add xen guest drivers to kernel if arm-autonomy-guest is activated
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
-- 
2.7.4

