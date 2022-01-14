Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD75C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 14:58:27 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.54])
 by mx.groups.io with SMTP id smtpd.web11.8066.1642172305745032227
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 06:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=38k/4CcH;
 spf=pass (domain: arm.com, ip: 40.107.3.54, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaL4BtcMYY9RSv3b+LEp+rRgIVFliJDOYMrEyJ95LCs=;
 b=38k/4CcH7oKPrDvSlOzTcC8r2fKEHLPbze8zTPyZ6mDfIRaKs9DE7EQFprHOkMZIvhnnmDnURTLz6jNb7xssIr7kFfAboVkPJYuYkfGSCbuV9gHj+d3Tksqzyme8wM+o6ZPaGaP33mGJBnOHwJlijl/PQOaihANXV6TM/zUMCAM=
Received: from AS9PR06CA0162.eurprd06.prod.outlook.com (2603:10a6:20b:45c::31)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 14:58:23 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::f6) by AS9PR06CA0162.outlook.office365.com
 (2603:10a6:20b:45c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12 via Frontend
 Transport; Fri, 14 Jan 2022 14:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 14:58:22 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Fri, 14 Jan 2022 14:58:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36b26bbc39d06719
X-CR-MTA-TID: 64aa7808
Received: from 08700403f3fd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3BAC473-2F9B-4677-8CA4-452F244AE6DF.1;
	Fri, 14 Jan 2022 14:58:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 08700403f3fd.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Jan 2022 14:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNhKVaOJJy6A9IES8Rz1mh6TnyZDLe1cL76N176KUSaJk/hO73jUfKQg9KGDgHOiJpDX8wRG57i0i447jvbMJ3hY2t5bLtJBprhKHpH2hacu1R3PuRPj/5GBA/mt1eX7xXDMaVgxg1bpMGMBV8uK5fMZimal8d83eJI8rBI5In9CFTbY8W+IGGPTAQJ5Mv40nvlGzVmOH3PSYduhk56qihoEM2ApCZiuofkzyEHGo2eU2X8mWhh3y4eNjuJthaHAV3mwJ1+YfLUObiWPDNZSTXZsH87AP6EiOMc1ly3AgZkUlQsq3VcRbi/y/Knui+iBa+lbkM4FGM4SN+lThqPXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaL4BtcMYY9RSv3b+LEp+rRgIVFliJDOYMrEyJ95LCs=;
 b=k8qvghmuEvD5lZquI8b0hiN7En1kM9Xebgm58NN6FV3BC6v0d7cswWMA4VD4Nc4c61ZBbOWBgIciEcaH0uhvcnriYvPG9R2WdS8679pC1g1d55nyzS/Zm/f/TdhJry7qI7uoDmztOrgNPAPfdvLMAwZrJdqC7c1AfjNUytQ+gRe7Zbc1rbE5sPAU/v95xX7A5GIiUKyr9989v2YaGQrLe8PSTGDtC4Oup23srGNlTmlC44lNqJO5q5uRcvjR1PHKhugHf71830zxH3oxvlUR7NiuDT7Q7v5nPhIrrIPnZ+lqIL3aF03xDBqbz8v6M1lb9L33o/EOWFaXmuBvwllRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaL4BtcMYY9RSv3b+LEp+rRgIVFliJDOYMrEyJ95LCs=;
 b=38k/4CcH7oKPrDvSlOzTcC8r2fKEHLPbze8zTPyZ6mDfIRaKs9DE7EQFprHOkMZIvhnnmDnURTLz6jNb7xssIr7kFfAboVkPJYuYkfGSCbuV9gHj+d3Tksqzyme8wM+o6ZPaGaP33mGJBnOHwJlijl/PQOaihANXV6TM/zUMCAM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by DB7PR08MB3868.eurprd08.prod.outlook.com (2603:10a6:10:32::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Fri, 14 Jan
 2022 14:58:13 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::9dcb:3b1e:f576:a27]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::9dcb:3b1e:f576:a27%4]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 14:58:13 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] meta-arm: Make generic-arm64 kernel cfg based on linux-yocto
 standard kernel type
Date: Fri, 14 Jan 2022 14:58:02 +0000
Message-ID: 
 <b0f55d0fc4ef33c8b24b658a8829d88646ddaf36.1642172230.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0061.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1d82a9e8-d7c0-44de-9167-08d9d76e4f3f
X-MS-TrafficTypeDiagnostic: 
	DB7PR08MB3868:EE_|VE1EUR03FT003:EE_|AS8PR08MB6053:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB6053711514FF2DA5F643E76A92549@AS8PR08MB6053.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 j+GogSbfGXebC22eOgR8bnCZCShs+NtcyQokc3rIXMYK4AMCl/UCIo/GsyLPMLs2P1bwW8jTZj9n3TMSNAbJkLYFKSvJ0/NtzqVnN1cHd0ueFdylCGKmqw9vJj0ptrRXF+7HVuPkYkCkUTF0VgYWP2eUOcbEtB9rM7h4TYY7jykqBjPzthYgBfGwpQ05sWJkixkG6Sk6+BeWC98oBys76QqSVcn3I97vbVQl35hsLOJHNJxdOMGQuIE3Pr4y70GDtlsAWRqbGiMbhvpaHlNyHbHNjrPrfVXPNtf5Auv7JcoAcpF0wgZrtXJPdL0apheywGbOJ3EtKe4RvciRlS4V84BZscSKRjBhBdJb35a5VT3Il66Nzq/qgJNN8YNgtGkBt34zmwXA0TDF5AtMfVAUv4ETsgGCmxI/nD8L6wEqWRfua/ad9b5WFyWxfUJDiXVlB3sypSkjylO5esimIe7s6KZBt0+Onq6bVxX6sth98uNrdXeXjeW06sZceh+1cBOQIq3gzmkBelAVhASi/MTSQJjqbExy8XfGW7tI0bnmqwsHCrITuXKQ2SMr1Mn/gUf1eirs1C1kTwUBkls8yBg8o2hdVtFQC7a26dLunLZSs5mr1+4QO5ifdygELvNknMrpV3S3BIsBvIpgEnJfpgFOAljwd7+QweAlt6fNfybM1LkpI8d+iNl9/vM6ZMavpGu0GfPQ5E0s/vyuFAkeWQwhlC87/3SGIUnK/T8X9wisV50=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8936002)(66476007)(36756003)(2616005)(6506007)(5660300002)(52116002)(26005)(66946007)(66556008)(2906002)(6512007)(44832011)(8676002)(6486002)(186003)(6916009)(86362001)(316002)(6666004)(508600001)(38100700002)(38350700002)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3868
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78eee5a9-7f73-4f5e-8e63-08d9d76e4973
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D0TjrMc50RU1bADcNLPL4+9tFbFJQlhIw1M+zET0sXBWlE6kkbK5zFbZC/xY11FnlFSg/HB0RsYl9VZpe+kKdfWYKL35YiYxfFv812gbgur8/YcGb3xj9SLDxWSyk8t5egUKFV5D9JOEjbUHpP49wy0XkW/SDoNIjJb9UpkNw12Nv+bGE+Aq1ISnJn0CLzKc6BdgzXIkKkdhbcCsqQ604HSrnJiVqBsOoZ0B8z7Jl/1U3nGIhy1luxEILfh2hrQ8uIL7rEqVGgqo73zb6PTuTvCuW0fQHoGKqOqeVjN1O/o9zDu/E4x4lRAUUpQq5phlHNH1ylULZz1+0uRTwJKDU8VxqHk9MwrU1dCEtz7/5f6XIe8nbM2VcJl1RWaad4GeGZ+Ln+nco9/d8USCqj3K9YbiyTdo8EhzG8+ArKzdZn5p9P2rJ1VTPs2CdZ40biu5z1L1ViddCP+AL6oGEq92mYivB6Ku4/VOEWuhldv0pUEjE4OLryLTn2pIHnqEb8CiOuBGn3pDdZ+gGcIatFLt3IpIMcNz3UHv8DhbUOVk7xDfJc93CVjmgvRHPGBkT4GbmIzUbBSi13OrBS8ofbRLlkaUu2eFbhthsSM7qBcmIUAUnZSqRp6FLbRagvUNyqORS8AsvxJi9VCeDLEDfRRMWslvTU8kOtPCzShZRfZ87JjhXdSbCJMhMSonhJUmEu3aVQYkTiZY1b1SvcXEIkx/iSdQtgv6CEyhbHWshaXmTUM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(82310400004)(508600001)(70206006)(6512007)(8676002)(70586007)(26005)(81166007)(5660300002)(186003)(6916009)(6506007)(6486002)(6666004)(36756003)(316002)(356005)(336012)(36860700001)(2616005)(2906002)(86362001)(44832011)(47076005)(4326008)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 14:58:22.4326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d82a9e8-d7c0-44de-9167-08d9d76e4f3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 14:58:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2830

By having the generic-arm64 machine using the same kernel config as the
linux-yocto standard kernel type, application layers can rely on the same b=
ase
configuration, independently of the target machine.

Also, the kernel-yocto.bbclass searches for .scc files in the FILESEXTRAPAT=
HS.
Hence, we don't need to list generic-arm64-standard.scc in the SRC_URI.

Issue-Id: SCM-3910
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I46889ce38b32521d8350534cc590b57b158ad573
---
 .../linux/linux-yocto/generic-arm64-standard.scc             | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64=
-standard.scc

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-standa=
rd.scc b/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-standard.s=
cc
new file mode 100644
index 0000000..21bff02
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-standard.scc
@@ -0,0 +1,5 @@
+define KMACHINE generic-arm64
+define KTYPE standard
+define KARCH arm64
+
+include ktypes/standard/standard.scc
--=20
2.34.1


