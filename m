Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web12.12398.1594995671971176933
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 07:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OdWkb8Lf;
 spf=pass (domain: arm.com, ip: 40.107.21.71, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILkPDSamdMQcxiP/t3lwoId8h7RL+OVeO4BEl8JGbek=;
 b=OdWkb8LfFfxagoMylhD1Yer8NMTuHyjOVAFSrhmVyfjioAoRVRBa7aDu+xhELqFyKqZ1aN00ZWHZL2YtCVwWxanBAKx1eLQrNNXsp8vq9QNHOPOG/VFwA31dLtL3zvbDnsTJLWIEDsd/fMKkTbXTGK0cZ5u51DUU1RMWZwD3fLg=
Received: from AM6P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::48)
 by VI1PR0801MB1629.eurprd08.prod.outlook.com (2603:10a6:800:4f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 14:21:09 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::fd) by AM6P195CA0035.outlook.office365.com
 (2603:10a6:209:81::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.19 via Frontend
 Transport; Fri, 17 Jul 2020 14:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 14:21:08 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Fri, 17 Jul 2020 14:21:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75c60a74d7671f49
X-CR-MTA-TID: 64aa7808
Received: from b9aa93885345.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F3BBE2B3-2245-4AC3-8EB5-DA5A87D01651.1;
	Fri, 17 Jul 2020 14:21:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9aa93885345.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 17 Jul 2020 14:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAXpGeAKhoW/aQ1WOTCKZ3lsm4jLte+Qr5vYPDn0ZhCmThHKUPLEram1xZoaar1kA0pDeK+/YWQ6VRHT/A7h4s4cL7TOo7Kg2qzpRkifsryPtGhxtMqIU84gm/sxbEJMua/X33aJ6D3PWMZZcpK4eC3dInO722evkeGIVBRG2EAcrWN2TpxAUJRPQmuYnr1miw01yGaBFoEQcNHB7SAl76HggJM8GTgBzP+99BJJOj3lAuiO49WJDB7t9y/2tSagSFW5BGUTzE8tlf388SXaODGILrGr5xYlkIlPJ1A1Dy3J6ZV2uWnNr7wYLXvcbPWzsVP2+LvCUfZ4wHqIMF2jWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILkPDSamdMQcxiP/t3lwoId8h7RL+OVeO4BEl8JGbek=;
 b=NE3USjKP5teE5Yrvj0MT353cvculmfRSLZcj7whWpSJp2CjlND9xuVEv0/PgPxaMB9Ct1e4X0SMOz+8UWqJKkh6vGNi75Xg/UurGpbv/kL4ljy0jcXZu8GYNAyM8sOD9TSs/m6LpoHgEw5zZtzVs0M1O8d/VuI23FYyR2g5UoJCOGEO83DHLkTk0/qAWETxfVQLwMgxP29G1ei5l2WnNeoWaU3TyD+G2KYWSfhxqJcoME8KvK+ViwAV9mDlbvonE0hvInLzEJjw2zSdYPkc0P0l7e6C406cwkV0fI2X0ca10lVzTO1OUC54IeZQTpW26kirL3FOtcR0W9SJGevam2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILkPDSamdMQcxiP/t3lwoId8h7RL+OVeO4BEl8JGbek=;
 b=OdWkb8LfFfxagoMylhD1Yer8NMTuHyjOVAFSrhmVyfjioAoRVRBa7aDu+xhELqFyKqZ1aN00ZWHZL2YtCVwWxanBAKx1eLQrNNXsp8vq9QNHOPOG/VFwA31dLtL3zvbDnsTJLWIEDsd/fMKkTbXTGK0cZ5u51DUU1RMWZwD3fLg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3042.eurprd08.prod.outlook.com (2603:10a6:208:5e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 17 Jul
 2020 14:21:01 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 14:21:01 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: FVP include cleanup
Date: Thu, 16 Jul 2020 14:07:33 -0400
Message-Id: <20200716180733.12009-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:4:ad::44) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by DM5PR07CA0079.namprd07.prod.outlook.com (2603:10b6:4:ad::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 14:20:59 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 16 Jul 2020 14:07:33 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 649dab22-dec9-4c2c-6413-08d82a5ca64c
X-MS-TrafficTypeDiagnostic: AM0PR08MB3042:|VI1PR0801MB1629:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB16295D11600E3D68385F5ABAF07C0@VI1PR0801MB1629.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 nwi+he9pt1+5pKqZzUU5KZBySkab7DHvFc6QaIxmmMRllgvuUoTo/X/qQJj4EE64U3Z5HZh1gPQQ+RFgX8KsNJk1Zx21pFeKu0gHJdNIw8kzRdAt9ZEFr6GV4I9K8Ae0sgsOgTn7tbheyaN4IaK6zP3hljwqRkLMzFLcCtoD+pTW/c31C71uX/euhsYvB4vcb6lfMzTD8kLzukmfkOJBL8A9oqCBpyYEhmIa+ffBzEFTnIlsCqkFv344E6xkr1PnVV8Wlc4//9Ng9Tk2If1H9TYYYG2u+1Q9I+LXkZpAM+2HwnAn2fNSTZbKMEvGxlkMvJ88NExtnfCt8iBCS9aNBw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(2906002)(1076003)(8936002)(42186006)(8676002)(4326008)(52116002)(83380400001)(478600001)(44832011)(66476007)(36756003)(26005)(6916009)(186003)(66946007)(5660300002)(2616005)(66556008)(426003)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 6hlFIKjGIUPODnQjO9rOCwRv27nKrZBT1Ilq/T3syH4fo4QGUEcqmn/PUwsB4sQfyrAHe4ztVr2oP9EULNcfgNy4/vJ4IZXei43w64iFhoxSCCDtma17/LIrbuDbO1SkQSxZi9EzPrya6lKXcxbZ86Fm6ZKlp5SEqOJKbZqCw0mvp6MEd8H0frXyxkqGwMS9yPmexxBPXbkmAmiTcEI7PzYC9JZD60i+i7oPtYzGnFvoeCuaJH3sz+yzu0WokijwPlvUmzkkY9SyzO95pEqKX6ed95Jq+bkyvzyJh2pGOzMKSVOJbVfjlSxgu2GpidaMxiJ44ynJv0Rk7tf7Uj9dA2CNwQTJR+NxA+pLBqj9YlMo/K+Zu9rS1V/RLJEEEwSWpCM0QagJWI7BhVbJdniNKxPetFsLcHIYjz4y9fEnuwE6QpcVtlBMWZAPu54yEJ9z7irO/Eh438YdawemyO2RzXHoGK9FgajJSxftTNnexRLsJGLge+Fq9EKGaXRnYzf7
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3042
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966005)(186003)(36756003)(6916009)(1076003)(336012)(4326008)(26005)(70586007)(70206006)(478600001)(82740400003)(81166007)(5660300002)(356005)(82310400002)(83380400001)(47076004)(42186006)(2616005)(8936002)(2906002)(86362001)(426003)(44832011)(316002)(8676002)(36906005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fbe71503-d0a2-4d21-3503-08d82a5ca15c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DK1C0tCppeKuWdR08vjXnIbKL1rXKbaq62dGpiVfkA7g7s9kD99vwtOCQKVMvS3i0KSXck7/CayUbkgNWC5LZhmebOLl46bF6Fnm8xsNLCtT+K12/4REzNHYplsiYRg/HNwARkG85HcRgcE4MzIQLPYMM4pltABEQPdvnTO2svqpp6cJ4BWdULWZ56gQWRe69ur9J+XLxfsjRM8CQsipK7cx0+AJ1nZEgH727c7Dn3tVOwnIRCFLJ4VPnLOfziEtjZxG6pU4GlXJ4lkNx9EU9Pv/8CcjJ/k6JTnoMyefDEXEV8QlUCSYOFGh/0aRiDf0gW2CZyiJCl0JDxN3NQ61pUNdf7n8pO1yRhtMMi6uZ8JG41SzjiZRVOoV8KK9eNBtzqmLPIwryZ0rzwQ64m2oIw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 14:21:08.7734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649dab22-dec9-4c2c-6413-08d82a5ca64c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1629
Content-Type: text/plain

No real benefit to having the FVP inc file in a layer above the conf
files.  Move the file down one level and rename to make it more
consistent with the layout.

Change-Id: If32c0462352fbe2f3496957b1b2a169cfd7e7f66
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/foundation-armv8.conf                 | 2 +-
 meta-arm-bsp/conf/machine/fvp-base.conf                         | 2 +-
 .../conf/machine/{fvp-common/fvp.inc => fvp-common.inc}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-bsp/conf/machine/{fvp-common/fvp.inc => fvp-common.inc} (100%)

diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp/conf/machine/foundation-armv8.conf
index 73d2798..c1b9f4d 100644
--- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
+++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
@@ -4,7 +4,7 @@
 #@NAME: Armv8-A Foundation Platform machine
 #@DESCRIPTION: Machine configuration for Armv8-A Foundation Platform model
 
-require conf/machine/fvp-common/fvp.inc
+require conf/machine/fvp-common.inc
 
 KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
 
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 3039644..bd3c62d 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -4,7 +4,7 @@
 #@NAME: Armv8-A Base Platform FVP machine
 #@DESCRIPTION: Machine configuration for Armv8-A Base Platform FVP model
 
-require conf/machine/fvp-common/fvp.inc
+require conf/machine/fvp-common.inc
 
 KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
 
diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
similarity index 100%
rename from meta-arm-bsp/conf/machine/fvp-common/fvp.inc
rename to meta-arm-bsp/conf/machine/fvp-common.inc
-- 
2.17.1

