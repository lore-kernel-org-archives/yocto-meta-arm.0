Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C70BC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:30:21 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.86])
 by mx.groups.io with SMTP id smtpd.web08.9700.1643985019861945399
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=fxzVyNTe;
 spf=pass (domain: arm.com, ip: 40.107.6.86, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/HtoIQypcv8wiZu8sIWUFDBFnGe0BQeJZugAtJ5xeM=;
 b=fxzVyNTeOMusP3P1OiFhDAk8+KLDii9viNHR/s5mZlfOiCGJcN2P+J0z+vINy4oQU01H281Xev1dwKlsKtQrm5WweccX109LPNgeD8UDyjtvTGNn1TbxtaIX7+2tmmR/wEdCzDYgZ8e1TVAIGpuqctzAohVfeS9qnNLY2n0EOM0=
Received: from AS9PR06CA0171.eurprd06.prod.outlook.com (2603:10a6:20b:45c::29)
 by VI1PR08MB4303.eurprd08.prod.outlook.com (2603:10a6:803:f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 14:30:16 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::f6) by AS9PR06CA0171.outlook.office365.com
 (2603:10a6:20b:45c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Fri, 4 Feb 2022 14:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12 via Frontend Transport; Fri, 4 Feb 2022 14:30:15 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Fri, 04 Feb 2022 14:30:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4fe61955ed0d35b
X-CR-MTA-TID: 64aa7808
Received: from abd0acab778d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B69C3DD-8876-4A68-9F77-0421F3164540.1;
	Fri, 04 Feb 2022 14:30:09 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 abd0acab778d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 04 Feb 2022 14:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5Hkpn6Ml3fHdBUNHi+ZiWlzhCY1o/Vg2vVY3U3hyWAaFYY5V6LnABgiLLNsc9lsqaethaYUyMB9mYcSCmTfLSW3YrJgBF3ppnJxi+FadEmiiNjBbbCXOeX+WtflBqzA3XAYceax/OLgarLe4a6OOO2exeuK2Yyb5oDskFKPpZU0y6FU46smxEPY6AzqWjRmL2Xej9sjtk3m+FTMeuu2dSuzl6vtTQcMLPeBslSqNJ4XR7ZJ8G5TITyAPD3g0C/ciCGbDE41+3aRLopGZrZqYVubIrz48/j7KFU+w7wM9n3lXITFLIVq1v1gJNW6Tw8MTZjZpEuDc+05nm5r+2nt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/HtoIQypcv8wiZu8sIWUFDBFnGe0BQeJZugAtJ5xeM=;
 b=GJ6/YkiPUsqgX8Mq24fVgSg1FGAENiSQkpDiz7PO0t/Y6RT1N8lZjFZveu4CWqmW0IszpY++SJKbDnlZASDJ4jI8zAXJ8xZ1HyJuHIgNJ+3eNQOCU6v7JJNpsuQ4r0X9W+jyz6lW/BFs80pRFDcCoUcp77tDV0kVe89rg0Vkysksjc94rdQVBK4Gww0oI3I+oO0kp9mkqW23KH+GM2fQB+3qYYUiNNCIjpGp81v3P/+soRRfZKBryr55YTXP5LpJ5CwgXN7CdeBFduaxsMxVx2jr8maJ8mLkRdwHbBFL56toekGvfwZiAiSWW1sC7sEQpwyBm0JNVU9txewphh5tTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/HtoIQypcv8wiZu8sIWUFDBFnGe0BQeJZugAtJ5xeM=;
 b=fxzVyNTeOMusP3P1OiFhDAk8+KLDii9viNHR/s5mZlfOiCGJcN2P+J0z+vINy4oQU01H281Xev1dwKlsKtQrm5WweccX109LPNgeD8UDyjtvTGNn1TbxtaIX7+2tmmR/wEdCzDYgZ8e1TVAIGpuqctzAohVfeS9qnNLY2n0EOM0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by AM6PR08MB4117.eurprd08.prod.outlook.com (2603:10a6:20b:a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 4 Feb
 2022 14:30:07 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::5843:cc07:ae99:81ee]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::5843:cc07:ae99:81ee%5]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 14:30:06 +0000
From: Anders Dellien <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/trusted-firmware-a: Update SHA for TC
Date: Fri,  4 Feb 2022 14:29:47 +0000
Message-Id: <20220204142947.14996-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::10) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 82dc9678-2d0f-4bff-4ac7-08d9e7eadca6
X-MS-TrafficTypeDiagnostic: 
	AM6PR08MB4117:EE_|AM5EUR03FT018:EE_|VI1PR08MB4303:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4303EDCDF1565EE4A666656989299@VI1PR08MB4303.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:334;OLM:334;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ekmXaoLauugXWzdEqNvhJTxUwq724jyfMrRZIm9eA9l5HxV02rRfFF62pXt+ExKfYKpfOQ6rIWAZoLcaxxgR8kVH3qzye+U2EgOCg4b5+0oIdfxoP8/fSBWGMV2ta8Uvq4wSG0nqTXAfUlxeaV0/b5rcY23+M53ubE9Vw+y774BMk74gkbH6p7IbWH+ajn//A6UsZ8Kwoc02zAm+kf2ax9S0UXFRs/aXkIGSEAQlJFvSJewfXwXKC9Vjv1hO3YYtJSl8Yw8WEb6eE4llQVq24cXEzZvyzKhPWEDQUtAsJs0rmMhiJmiXG0OQsnybi+QSokx+3sNQVyBIi4Tl0VkA1OYQDK8a9Hr7OsX5TFkENUdVpHLyfuBRyhGvWFUvDpmRB61IcaQPehmPGgjHVxoRKwXFFncmpq8TozLhIxXkAWzecu1bwGfbP8GBpJ88i66LsGpFAv/xaFW1j14K5iFFXs+Y9JQfharSzonEI4PvpNmKCFLz/s86aVH8UgpgS9YIyy1K2bcfRxBZL06nc3kmu9uKKXi80jxWFqMBlenGeHXVWFyRb4I6tBc1Ykb3sVXuYoVRkeDUSNw/PICYHr2plvABEnnwmrQKDQs4Xtg36WlxQmJrz6F9VE2BqAtb4ogqvJDqYbmpGWICe9BjevnnmPZJcaC+BQZVLd8zifTR5bOxiYpabuEuefQyFw//Tq1I0MHNQKqyM9PagG8wQEnthQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(5660300002)(36756003)(52116002)(8936002)(6506007)(4744005)(66556008)(508600001)(44832011)(4326008)(6666004)(66946007)(6512007)(8676002)(66476007)(2906002)(6916009)(2616005)(186003)(38100700002)(86362001)(1076003)(38350700002)(26005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4117
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	39938859-d87a-4e7d-717b-08d9e7ead61d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yYKHkBRV8EGxNQZ4ql0OKKhOipLkFwWu3LyeLVxirF2bEgYm5xFkonp6u3kRV7+q6sTjdRVOnCuqyJEOMcsPfZuPu3tcSRmD8TwNImXC/E6rO9RGDxq5sZDqflP+ARcebzmjyejbH/L5RDoLZu9l2SQzWdTBZJl9L7Cb2FPn4KR7Cl8I4IAC3aO7qK3uZceK6HiFeQC2O/nSn9KdArejmC88PYN/Un/CPBJnQdQBtF2VO+g9EbQnwNwkB34dBxs5LB6uVPE1ri3BCyE+X1XoKLtgWVYoadmvLGSMz3DAetd6pES7OL7hny916+Erq3BERpzjh2hyv5MB8TOYwSOMVA6rzsclehurjJUDls2GNYJ9eeGUaTUozn0JcbP5fJGKtB9z8sTYpy6Q0rfqN3rON6lakP93TWteR2t3+3fgwTiiKvylnW2ymNKcjrE07C9lUYE4C9BQpniB1xSo3xjWEhRJt5rRY94ej318ZhaTjy9k+8N1gU050gycMoKYsUXHINXtMWU5cxI8rLIGOFW+JlFYqzFapYzR6jJICLfv2b3KuH0bLNNFGde+DjEsWYgwkC8ttF8YzqTjdc4cw4BJ2mbYgbW9WQTS5fA6d7VsjwT8XeGsF5bDG3hfLoC9p2DTP/C+irfz1bZaUmf1nin4SIpCs7tB/JwuhClLP9LAbERxXP2Mn4o0KN+nf3oVl+WN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6666004)(6916009)(316002)(40460700003)(4744005)(36860700001)(336012)(356005)(26005)(186003)(1076003)(86362001)(70586007)(81166007)(8676002)(8936002)(82310400004)(44832011)(2906002)(2616005)(4326008)(70206006)(508600001)(6506007)(6486002)(36756003)(47076005)(5660300002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:30:15.9046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82dc9678-2d0f-4bff-4ac7-08d9e7eadca6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4303
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Feb 2022 14:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2951

Move TC to an intermediate SHA based on 2.6. This SHA includes
patches for:
* Support for 8GB DRAM
* Support for GPU
* Removal of kernel command-line (not needed, kept in U-Boot)

Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Change-Id: Ic8c4ef35e8e7ed25711ff0813abab6b6c8564ef3
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
index 19b46230..c56c76cf 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
@@ -1,5 +1,9 @@
 # TC0 specific TFA configuration
 
+# Intermediate SHA with 2.6 baseline version
+SRCREV_tfa = "b06344a3f2c5a0fede3646627f37d1fce3d3d585"
+PV = "2.6+git${SRCPV}"
+
 DEPENDS += "scp-firmware util-linux-native gptfdisk-native"
 
 SRC_URI:append = " \
-- 
2.17.1


