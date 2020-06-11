Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.47])
 by mx.groups.io with SMTP id smtpd.web10.2686.1591861666505374014
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 00:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jZVVV4nF;
 spf=pass (domain: arm.com, ip: 40.107.8.47, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+LzZq33aOwAPmgWVckW2+IXS33u9MY+40QE+Ms6BBU=;
 b=jZVVV4nFernq1e9igiJ8kcc6456YiBPSruwMSCf7/fle7x3di4oW2HpRgd+h738CwgXilA/yYRxvjlHISE21piykuqvcnCP9GwSOfhY+BDQExG4s+7mKdWeDCrto63UkYhkbbTS855xaDIiKZdpPmtqx8/KxW4ZUy267f+LGTSQ=
Received: from DB6PR1001CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::24)
 by AM6PR08MB4692.eurprd08.prod.outlook.com (2603:10a6:20b:d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 07:47:43 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::9) by DB6PR1001CA0038.outlook.office365.com
 (2603:10a6:4:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Thu, 11 Jun 2020 07:47:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 07:47:43 +0000
Received: ("Tessian outbound 39cdd740f5cb:v59"); Thu, 11 Jun 2020 07:47:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48710fdb3b6efa95
X-CR-MTA-TID: 64aa7808
Received: from 9b98d8d2d722.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BBFB96E8-0B60-422A-AF4B-88BBB8B2B0A7.1;
	Thu, 11 Jun 2020 07:47:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b98d8d2d722.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 07:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhMmOi3/ane61N4L/sTIT7dCaPlC/VOXGeHaP2MKGTzry9dT3+pgAyT5gmzxn8tgXGv80nlycWhFDK0r7HfL+55IC7v8uWrxsBGpr5APzZXHzT9XcZyTYH41HFiJdW5zhiHNATzTP++86hkKGSDpxl6rDYYIcVC6FQEEsTDVEPr2Q94P+WBu6sNHfPSiytLh+VRTYPG1eepm/fB8wuYoKk12TZEx6WrNn1kaGi2NzUsQvVT0dkn3R5zdqhS182yM0wf/zo8YnbQNmmmz5XKMQ1U5u9r1DTrxoVGMY5dkPFS4EncYUbkHSoDI2FNvSCtOjG+1rTw25kRk+Ib3qOREqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+LzZq33aOwAPmgWVckW2+IXS33u9MY+40QE+Ms6BBU=;
 b=SEpaUwDhL3tP6r5+fMDsQMdSDXq07Q8Y26wcccNLaWKit+wzcj0HIQQ2Mw1migQg9nQo04QfXstLb53jHt/IM0i1cr2DEcGvQKQJMegCMS2KqY17LK3/PG2ZTvQO/VpRCRX4XczTbwc+vIjIN9ADIC+AA4YC469fe7nA3ILzm/hjQtgyfBs5rvlofpQyRrH9OZva54riuYwnN5MkVmHcQ5KzM2Gb3WqWumVtOs4ZdDolJXp3lzrHiTS/9/fh0quOZN4Bjy6DA59I8rnI7AgsE7uhfbmLvW6djJDW4BgPZsUMobhz2cXUMoZTHvXcexW7Tw7mB1DFvlrw+IqamQGwkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+LzZq33aOwAPmgWVckW2+IXS33u9MY+40QE+Ms6BBU=;
 b=jZVVV4nFernq1e9igiJ8kcc6456YiBPSruwMSCf7/fle7x3di4oW2HpRgd+h738CwgXilA/yYRxvjlHISE21piykuqvcnCP9GwSOfhY+BDQExG4s+7mKdWeDCrto63UkYhkbbTS855xaDIiKZdpPmtqx8/KxW4ZUy267f+LGTSQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com (2603:10a6:803:e5::27)
 by VI1PR08MB2958.eurprd08.prod.outlook.com (2603:10a6:803:3d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Thu, 11 Jun
 2020 07:47:36 +0000
Received: from VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::3da2:15b6:9468:e4c7]) by VI1PR08MB3998.eurprd08.prod.outlook.com
 ([fe80::3da2:15b6:9468:e4c7%7]) with mapi id 15.20.3088.018; Thu, 11 Jun 2020
 07:47:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy, xenguest-network-bridge: Set bridge members per machine
Date: Thu, 11 Jun 2020 08:47:35 +0100
Message-Id: <1591861655-35452-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO3P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::21) To VI1PR08MB3998.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LO3P123CA0016.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 07:47:35 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55c551b0-dee7-49c5-8a61-08d80ddbb991
X-MS-TrafficTypeDiagnostic: VI1PR08MB2958:|AM6PR08MB4692:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB469295B4C2917D9333818FAE92800@AM6PR08MB4692.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6Wz2svZWGYfcrBuEM4OCtXVvOMerp1VLUK4IbfpxbBIjcybhC5XjY8smvQE2BWontRTo2LrOfKPrK0Fwh3e4iyjDn/baHKUoLf7blhS1B4X0Sm02FotPnZ1YTIj/+9NDFhySA/5YVW+KPpZ2Z5aEip9stX4NaDMZc6tMAF5EymtUI3bK/0V726Y81x2AQhLT223N/9b0FEyIw/GtRCKO3QmcSB5HV5qhXbj2IR/aBux/4ly1yL74NixMwr23OqbEhMquAZMiI8SwuZSCFgL7qwbmAaqMyC6SnoZ0BRhi8N6i4Yo+ISxsam5WEZ9hmElsJrHqAq8vK/kl8oGpBHpI7g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3998.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(478600001)(66556008)(66476007)(66946007)(44832011)(6916009)(316002)(8936002)(956004)(36756003)(8676002)(6486002)(2616005)(7696005)(52116002)(26005)(16526019)(186003)(4326008)(5660300002)(2906002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 tBIqkotrR07g4bFdbCvlzlKD6K/wzw9i0mRrpOS1KDIXkCaLIYpcdOMjVJdBxy7iot+kCpbCcZH0dzHR3ENtKbh6xb0Pf5eA8gRcPz46KdXcLwl5fzjDqTTVhnIlouYgIe60B1Q6m8I7B2yqTfoGOQ0a2mOP4WmsMva+4IXrff61Li3azHx/FqTtTVtQAj9NiQJ0Df2up7UTzbsK4GiMD/9zEIGr4Hya1XOplZfmOa4Bs9GCkSSQfuclmbt+oaAYNgtPQw1sCJN8HdfIL9CLGl7klae+cVIK/8eTqsTbhhFhzHpn7c7ciftl7rFyhEwHUMD71nOhJmKKZoIythlxVCXQd/kVQn8qaJ5E7l2RsmSB/yTnjvwcuOjtHz1JKHPHywWuGsSPh4+EXK3qz0EHLwkeN3t7TguwT8beAB1VWo15QihC53PgAvOBtv8Py1r+HILePIa3zugQzpxoZlMhruqmezWEKamLqkrKnirrQYZZ77r7/zyR6HSNZcHh4BX/
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2958
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(82740400003)(70206006)(4326008)(7696005)(2906002)(47076004)(26005)(70586007)(186003)(82310400002)(16526019)(83380400001)(356005)(478600001)(81166007)(8936002)(6916009)(6486002)(5660300002)(956004)(316002)(86362001)(44832011)(36756003)(2616005)(336012)(8676002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d591efb8-8643-4a9f-565c-08d80ddbb513
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Jle5yVOXEwne9BjRoyPTOmom5VWDHvwJZkuPtcIa/jJ8yNl+GlhNN8s863/E3MLbnBzNJxPVVIXIRk9hPaaAE6cNdJT84+/4a6E6vsd0C00wA0ynz6gYr6RZe5sujTAS2kMdZCx5buk+9aCHmLfxrlioThqrSg0rjWoojcZWAZTQ+SmbTFIW+bNtu9ygus8nHQQjJMHwoc0EfccIF3bx/2CaojOrltoapvzBnvSwvDp7BRlDwBnl3TEIegZKct1BcIxQvYb1OlDoMtlTa9p+Y7hC2PZ9uhfRTfc0gpkCt589qjt0pdzfqi2hmZJriCEa8CFZ8Z59EA1k61CVUDaxOTgmM7WcJmHEkXZOVhnRXuhJ1KwLiDSDNOd55Oht/kjnd+Zv+P/y+uSYX6ehxueINw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 07:47:43.5017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c551b0-dee7-49c5-8a61-08d80ddbb991
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4692
Content-Type: text/plain

By default, XENGUEST_NETWORK_BRIDGE_MEMBERS should be empty and only be
set per machine.

Change-Id: I67c56847eb785279c28757a6052f092c838babe0
Issue-Id: SCM-995
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-extended/xenguest/xenguest-network-bridge.bbappend    | 8 ++++++++
 .../recipes-extended/xenguest/xenguest-network-bridge.bb          | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
index dc84921..de88cce 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
@@ -1,2 +1,10 @@
+XENGUEST_NETWORK_BRIDGE_MEMBERS_n1sdp ?= "eth0"
+
+XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?= "eth0"
+
+XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?= "eth0"
+
+XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?= "eth0"
+
 # Juno board has 2 network interfaces, add both of them to the bridge
 XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?= "eth0 eth1"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
index babd694..c6c2242 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bb
@@ -9,7 +9,11 @@ S = "${WORKDIR}"
 # Please refer to documentation/xenguest-network-bridge.md for documentation on
 # those parameters
 XENGUEST_NETWORK_BRIDGE_NAME ?= "xenbr0"
-XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
+
+# The XENGUEST_NETWORK_BRIDGE_MEMBERS should be set in a machine.conf
+# or bbappend file.
+#XENGUEST_NETWORK_BRIDGE_MEMBERS ?= "eth0"
+
 XENGUEST_NETWORK_BRIDGE_CONFIG ?= "xenguest-network-bridge-dhcp.cfg.in"
 
 SRC_URI = " \
-- 
2.7.4

