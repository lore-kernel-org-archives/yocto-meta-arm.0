Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.87])
 by mx.groups.io with SMTP id smtpd.web12.14256.1601650176484835704
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 07:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=SVK+EVyh;
 spf=pass (domain: arm.com, ip: 40.107.0.87, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FJ0NFTcB4PV9cMKKjV1pGnVax+5ctQ9e1zkC+183Gw=;
 b=SVK+EVyhRPgKeOufARSjLpXfGVD19+VDmMnAm9Rz+K0b8A+3c33x8RSyVzdS/IAjBrUWWNdGioy4tpHmJENFUBiUElNaigg2bjFGdqJSztPdyqXKfJIv8x4nBJFd2tetPokiRbVbR6GoP5kwhghTAXqK8/g6kLWIA2MNKi+M4kk=
Received: from DB6PR07CA0105.eurprd07.prod.outlook.com (2603:10a6:6:2c::19) by
 DB7PR08MB3209.eurprd08.prod.outlook.com (2603:10a6:5:1e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.35; Fri, 2 Oct 2020 14:49:33 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::e0) by DB6PR07CA0105.outlook.office365.com
 (2603:10a6:6:2c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13 via Frontend
 Transport; Fri, 2 Oct 2020 14:49:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:49:33 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 02 Oct 2020 14:49:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c7d7ba7c3e9f676
X-CR-MTA-TID: 64aa7808
Received: from 0b3aa19e2eab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 165AD993-170F-42F9-9FFB-E98C7D3531AF.1;
	Fri, 02 Oct 2020 14:04:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0b3aa19e2eab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:04:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TszioVBISPmqBHyDN+XX5t1rQwzJ9Xf6Eee0vE0edfnNcUGKWfmvUradwqjIjGlNbb+A7UOlv/3lmQCsnxKoGquy0c8OS5TjwUyySvBRoQlWaTwFF0vJ6GIrYyXVm0TTNA0+NY2g/R7XsZbwvwU+pnzj15Qef4Fqv87+scOaOJFE/bI/gNBb8sNCWB2gv7TipGBO++q4TjjvqArlrsfzoFFBR9BxG6e+7+9q+mgUEZAznNsEJaIh5NmJRZaTTj3czxxeEuSNyRULQtY6uA3bH1TwBSSG0T8q96Fh7xVJjA+VeGYaACLXQRHsn4uZeDPwjdyj0if8+W/RgqgE40+Pyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FJ0NFTcB4PV9cMKKjV1pGnVax+5ctQ9e1zkC+183Gw=;
 b=K4EXqFGEx6dWHjuaRGC1zI5AwiHafgB5FUzbIPcHHPDKVPRhF3DNID4nCwpi1EyfSeOIajQCx2MfZd2C3z1TyXzfJrv/EMQg2Pi2UcH3Y0zt9yEVfX7HtfskiaYzsrZL6+MBGemuSimxeLr0EonPORdLME2fBgclIqJCWhaMtJbcERbXwrIAEgvMOIKruW6vLO4buqqCFya7LwDzDKIF6/79k5eO6XwjarWv5fNa5YkSx4y3Tilxuo+FY3HloFyqiOVe9RPIGDye7jvCaefmfCrc3EstqQ8FRtcCXV5v6aLFZnwj76cPi1K5l0f4rt1SkgM5rJzSLjqLEKV8DMNn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FJ0NFTcB4PV9cMKKjV1pGnVax+5ctQ9e1zkC+183Gw=;
 b=SVK+EVyhRPgKeOufARSjLpXfGVD19+VDmMnAm9Rz+K0b8A+3c33x8RSyVzdS/IAjBrUWWNdGioy4tpHmJENFUBiUElNaigg2bjFGdqJSztPdyqXKfJIv8x4nBJFd2tetPokiRbVbR6GoP5kwhghTAXqK8/g6kLWIA2MNKi+M4kk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 14:04:12 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3433.037; Fri, 2 Oct 2020
 14:04:12 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/7] arm-bsp: Remove references to meta-arm-platforms
Date: Fri,  2 Oct 2020 10:03:59 -0400
Message-Id: <20201002140405.7896-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: SN6PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:805:66::28) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN6PR08CA0015.namprd08.prod.outlook.com (2603:10b6:805:66::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Fri, 2 Oct 2020 14:04:10 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 02 Oct 2020 10:04:05 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f470523-4845-4289-28d2-08d866e26025
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|DB7PR08MB3209:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3209D3C422C18C421EAC04B7F0310@DB7PR08MB3209.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AucuVz1aO+6u3e9zFJh27M8SgESLMDIBIlxDkDnG9z7QUi3I9QRjsD07H0TUXvMc+fCw9WFhPBM39UXKWoQE0+mLTvIdsTPxM8a5WOnvOkyh3/io+7iZgmrlPGL4QtAB1VGSV1iIz6duZHHhjqa64kOdK7Fvr+k3BGqmgWOknY+zRetGhyLFr+KVvhkze8B2dI0bNpO4oVTxZQee3zFNEs0JQC7f3otnJRlq6c9K/F4ZOpEyNk5Unw9hkXZ/noijHnhDHlP4lsGj3ZGRlLGEIjc+wzPPBNeU22dWfBiWLZ8XYiZ4JJg2HnWulmErkNbiiJ/0d5UxjmmUFNwA2tr26siVp4WC4bLtFNGOBZIBDqQhqAXv++5LmRWYsrCRmALO
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(186003)(26005)(1076003)(2616005)(44832011)(6666004)(426003)(66476007)(86362001)(66556008)(52116002)(66946007)(36756003)(5660300002)(8676002)(6916009)(83380400001)(478600001)(8936002)(42186006)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 uPvmhkIPwSaj7pvAo+Ycj8LkciWR7sYeSS8mY+z3C/zSePfqd2wO8cjSEykGdZ/8ly/ssT28FDwy2dlasIV/RlHJm2/611uYcC0JPDGXLsdOsPIrP2f0s2tumWM0BpQGtgz7/8kct3vUsT5oEh2eWMIO0ceJ3As+KbXkqa5MIRHJqzu3RJas7N1RI7S2eAH8w51ndCuDb0XdZS1fheesL1SXffiyKjjKfHJh9TG2rWsyiHsUA8gi2oMcLqkTD3k+IR6BHOGGFqie+ModLoN0A68pouuBFLM6nkbpJ22TKTqPJcUg5g+fkgO1moRzHYuD5ZAHmOz153UDtihuuMveokp9WPQb8RfHFJTtWjCWHOXpcRgehbP5d8V+pEVLs86ytMLwVQiQVNUsbN2IP8HPKogm2+q5epo5lObxWcK3avLgXXpL4hWbTcM+dhdgBAFpy8E/12QeThepMY8Cie5Wu8iZFrAtfCqMS5GP6xNoL4SzqdYkWrshPIIBZ2dq9Zkki7koun7WQkyWP+oep1CR05b+TmdCukIVTk4NRJ5AvOO5j14O0yfqF02NVHWpDQoTeZ+ZmLhSW4M4GxfxeRbQMAwzYDHYHRDC470QFgrKoYnTi16mme7gteJuz/BKkrDTqLFt23BOoOkId7CZ11Enpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fa3d3b6e-538d-4f9c-e9c4-08d866dc096d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gtjdS8xyGx3YF6qcRR4ta9CAY/5BeaYLNkhTk/VJH7yEMQ/AZqaMo7wNIB/Lt7de4CEVsSVfENB3wC4FlRrIlQNUOMFmX5M8IfZcMRFF3bFsQeBrowKulmPFT7Xd3fKvFrRkCW9igIcg4oR/OBik/eWMonawvQc9M23ePyc/H0ZIttPubRHDYOn3qsDpXruMr08wI0WkcF3XoZQaDEwr/GxesL06OjCy3iVGrM/IjdieBZUoZlBI3mm14UZ75b8rXzkTDKNQ3xJQpKDeCyLqy3QUMGpBtNmWluYCKcEP4uwS2fkUftYk9ZA+FmFUh0pJPVE8aoZyOIIzLh4PQYly/tqP5uOPtaPBBxw8axZxP97yc/dUX1G7RjjgLRfSOkTYdnNI0XGusYP7nf5NJC2cTw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(46966005)(316002)(81166007)(44832011)(478600001)(82310400003)(36756003)(47076004)(83380400001)(336012)(6666004)(82740400003)(42186006)(6916009)(8676002)(2906002)(26005)(70206006)(70586007)(186003)(2616005)(356005)(1076003)(5660300002)(8936002)(426003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:49:33.4545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f470523-4845-4289-28d2-08d866e26025
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3209
Content-Type: text/plain

meta-arm-platforms does not exist.  Change to meta-arm-bsp.

Change-Id: Iacf74f2ec2d5cd2ddaa3a952e9190e71822bd9f5
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/documentation/a5ds.md             | 2 +-
 meta-arm-bsp/documentation/foundation-armv8.md | 2 +-
 meta-arm-bsp/documentation/fvp-base-arm32.md   | 2 +-
 meta-arm-bsp/documentation/fvp-base.md         | 2 +-
 meta-arm-bsp/documentation/juno.md             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/documentation/a5ds.md b/meta-arm-bsp/documentation/a5ds.md
index 9f88abc..38c719a 100644
--- a/meta-arm-bsp/documentation/a5ds.md
+++ b/meta-arm-bsp/documentation/a5ds.md
@@ -1,4 +1,4 @@
-# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-platforms
+# Cortex-A5 DesignStart A5DS Platform Support in meta-arm-bsp
 
 ## Howto Build and Run
 
diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bsp/documentation/foundation-armv8.md
index 7e73da5..dacdce3 100644
--- a/meta-arm-bsp/documentation/foundation-armv8.md
+++ b/meta-arm-bsp/documentation/foundation-armv8.md
@@ -1,4 +1,4 @@
-# Armv8-A Base Platform Support in meta-arm-platforms
+# Armv8-A Base Platform Support in meta-arm-bsp
 
 ## Howto Build and Run
 
diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/documentation/fvp-base-arm32.md
index 363e6b2..52ca1a4 100644
--- a/meta-arm-bsp/documentation/fvp-base-arm32.md
+++ b/meta-arm-bsp/documentation/fvp-base-arm32.md
@@ -1,4 +1,4 @@
-# Armv7-A Base Platform FVP Support in meta-arm-platforms
+# Armv7-A Base Platform FVP Support in meta-arm-bsp
 
 ## How to build and run
 
diff --git a/meta-arm-bsp/documentation/fvp-base.md b/meta-arm-bsp/documentation/fvp-base.md
index 58604e1..17c28c2 100644
--- a/meta-arm-bsp/documentation/fvp-base.md
+++ b/meta-arm-bsp/documentation/fvp-base.md
@@ -1,4 +1,4 @@
-# Armv8-A Base Platform FVP Support in meta-arm-platforms
+# Armv8-A Base Platform FVP Support in meta-arm-bsp
 
 ## Howto Build and Run
 
diff --git a/meta-arm-bsp/documentation/juno.md b/meta-arm-bsp/documentation/juno.md
index cc5a272..69e56bc 100644
--- a/meta-arm-bsp/documentation/juno.md
+++ b/meta-arm-bsp/documentation/juno.md
@@ -1,4 +1,4 @@
-# Juno Development Platform Support in meta-arm-platforms
+# Juno Development Platform Support in meta-arm-bsp
 
 ## Howto Build and Run
 
-- 
2.17.1

