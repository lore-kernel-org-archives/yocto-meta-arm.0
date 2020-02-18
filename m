Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.84])
 by mx.groups.io with SMTP id smtpd.web09.2865.1582063201136473356
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Feb 2020 14:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eCJA2Xxo;
 spf=pass (domain: arm.com, ip: 40.107.2.84, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHAiJstpepBWBUVuLKY+wFF688KjTvJVlklihJIHkbE=;
 b=eCJA2XxoBe5gn7T2gbheTmKaq+VGo9EetP66VhBmAgiqVMYYcyAaVYp7zCT/gX2VKv5QmskZhBHlTWI6S9gC1e2Fad8GBuyt4j7p+82mn2Gk5fiB9WFweKg8t8kzU69sLgLFtwRdQ4bP8i9UgPC5hPfbXyobb5J9ArLVAJk8nGo=
Received: from VI1PR0802CA0012.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::22) by AM6PR08MB5175.eurprd08.prod.outlook.com
 (2603:10a6:20b:ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25; Tue, 18 Feb
 2020 21:59:57 +0000
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by VI1PR0802CA0012.outlook.office365.com
 (2603:10a6:800:aa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend
 Transport; Tue, 18 Feb 2020 21:59:57 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT044.mail.protection.outlook.com (10.152.17.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Tue, 18 Feb 2020 21:59:57 +0000
Received: ("Tessian outbound 1f9bda537fdc:v42"); Tue, 18 Feb 2020 21:59:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 96ecc88618c17493
X-CR-MTA-TID: 64aa7808
Received: from 21554927b305.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8AF6CFA5-AB6B-4F4E-8A38-8FCA146D9851.1;
	Tue, 18 Feb 2020 21:59:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21554927b305.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Feb 2020 21:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gemP3038Kjy7CtPs94wGE1QgyNU1H+Z451E9N0zaWmciWwqKf3rnkzNVGl2xx0hseIL0qVWvC2O+05xV5hxoy91FhmscaE8j6PIkw8xz38MSZytTrqwv4GERlLLwfOf8dHMfedf5ETzMsYGIeJam38fa+l+YM1J849/wF9y5EGBvY3GnM+7jGgZFqmdO7g6BcULJc/F/s+yST4b6bYmH6wTie7D20ode/fiOPIgdt0VSINZOFWq7IOclf5jvEGh+93N8gouRQM4S8tS/GjNIj+IeGvw1A+2K6qrR62GEUA3/g7nSDqEbkl45DUXulYpgn0RLz+TsmWxGajlIlxUx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHAiJstpepBWBUVuLKY+wFF688KjTvJVlklihJIHkbE=;
 b=kIoi/FiexnryEhnAdlY84RnFd6P2zS2GHk+ssS2ilp9y+FFFLIJx/rVl/T5FgepWYASbJo1VL28XEatOFY9+i0Ps5QSxz47oLxk4lUOdohp5mR95e2RXX0TrlZrhCm1TNCp0uBDBJyx8zbUnHT5eBKMgfUQrPGSXnlnhZdbcxS3dRt09STLIBmxwmMOUIsSuD6tFsneShnWBMGhdFZLVR6uLglCVBpif6jO9dawkWW0VX6w2XYyRvJ9BNirSLS7WQX8A1jbFPCktH9Q9ACJuzyudDM4vYdJ6cgjx2Sf8QAZw5T9dV6dnuJ7I02vEt3pTvWU6qgJe3mrX5dQTQIiUoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHAiJstpepBWBUVuLKY+wFF688KjTvJVlklihJIHkbE=;
 b=eCJA2XxoBe5gn7T2gbheTmKaq+VGo9EetP66VhBmAgiqVMYYcyAaVYp7zCT/gX2VKv5QmskZhBHlTWI6S9gC1e2Fad8GBuyt4j7p+82mn2Gk5fiB9WFweKg8t8kzU69sLgLFtwRdQ4bP8i9UgPC5hPfbXyobb5J9ArLVAJk8nGo=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (20.178.118.32) by
 AM0PR08MB5236.eurprd08.prod.outlook.com (20.179.39.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Tue, 18 Feb 2020 21:59:50 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::8c04:6668:2593:d497]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::8c04:6668:2593:d497%2]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 21:59:49 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] Fix MACHINE setting in start script
Date: Tue, 18 Feb 2020 16:59:45 -0500
Message-Id: <20200218215945.10163-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20)
 To AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
MIME-Version: 1.0
Received: from vm (136.56.1.171) by BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.25 via Frontend Transport; Tue, 18 Feb 2020 21:59:48 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 18 Feb 2020 16:59:45 -0500
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4563c6e9-812c-4f34-3b81-08d7b4bde4a8
X-MS-TrafficTypeDiagnostic: AM0PR08MB5236:|AM6PR08MB5175:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB5175F76CE99322B10C9D3317F0110@AM6PR08MB5175.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:820;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(199004)(189003)(26005)(1076003)(2906002)(81156014)(42186006)(52116002)(66946007)(426003)(66476007)(66556008)(8936002)(81166006)(8676002)(4326008)(44832011)(478600001)(5660300002)(186003)(6916009)(86362001)(316002)(36756003)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB5236;H:AM0PR08MB3972.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aH8LyHVa/X4dcDRXd2/5Bb9VI6rxYAOKzi5rZFV+KicTleACBgqytEsQCA7wDAE9DARnDgKyJryMqypIuFhLSzkvT9p1xpcsv1a/4795tDI7pktZ/lshgrK6csYV0CJ+qRVj51xcOy0WYTLErX02GwSbyKgnlpN4toKpcwnh1yWISIjqsRfQbg7Y/rj3fhZCnJfiFas8CTBVw8q1N6lsILJFpCc5Fsuf5zQrmCoHd9gFiMPK21xObtIMMjlvmo889iJpDFUvHusBuBpBMnnKbHKTq7YpaUD2ERkY6meTEJzvq0kbFcE4+7VJZmjNwf/pQcYrcfRKtHKZDd/lbUKrjJG2ATDhB4897vA9RYFQP7GzqTuOaqDA2ZIKXcEuadNMOPriLjwG8ssgBmm/L0Y4mUXs7TO8MflNhLzENHYHIlgxva55OQqtQaRg7FJTqoL6
X-MS-Exchange-AntiSpam-MessageData: 
 C8l60mRRS1qDPcSe93tH69uQhxWgeBe2UPIEpEhDCntvolsLRWcaX3Wj0yjJGwLjwxHYIxFTe/no6FS+u/bA9i7roMnYPRZQ1rVdq9TjgLBJdPMX/QHfq6hTLrkVd2vdM6kb13nKwmx/4SYhSDMxQQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5236
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(189003)(199004)(8676002)(336012)(70206006)(42186006)(70586007)(81166006)(81156014)(2616005)(186003)(356004)(26005)(2906002)(44832011)(316002)(8936002)(26826003)(1076003)(86362001)(36906005)(426003)(5660300002)(478600001)(4326008)(6916009)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB5175;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4aefd214-fd0e-426a-8724-08d7b4bddf6a
X-Forefront-PRVS: 031763BCAF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HHxdVhUDvmXL8ZBe4tCoKh7uUO+sAsZr0RDgw3p09pyrrdjSfdDgr0dFCYHFBKPJbyY5vgh4NCoccvswn0MeVpMXH3lNOuw0jxY3m2Evi/tet+p6YDUt34J/0WvWSH7bNjZ0iI/G8rUGWTKp3nFm8Z595iz+X2DhoI70o+YZc3M9DhXHewXH8O46eaWGt8eO8efYZdXI2ggk7wQ9kMjuIvFpvHy46yYWECSvbvaF4oD36OixcsboCp8jYG/vz/79WrnkrPLThcyoOzegwwIwWNjImbYWHw2azzuCqCbk4kXeamFEY8ZSMc/hj2otj3wIEXeBKA6ep+uSBKE/SYwddq5EAUjr7qfbUfsoZl4MBkUfg9DPrTa5E3cKyj3/MpBV8eOx499DqFVPJP5vfsibASItxvgCU8EtoAKTxV7JPJDKoWzwzGnj2POKyBWoPdBW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 21:59:57.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4563c6e9-812c-4f34-3b81-08d7b4bde4a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5175
Content-Type: text/plain

The current MACHINE setting could be different than when bitbake was
originally run, thus causing an error when the start scripts are run.
Set the MACHINE in each bitbake command call to get around this.

Change-Id: I778b58d751ea0ddbcac6d73f347e6861edcf1ecf
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-devtools/fvp-common/files/start-foundation-armv8.sh | 2 +-
 .../recipes-devtools/fvp-common/files/start-fvp-base.sh         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
index ca39bee..1df4fd8 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-foundation-armv8.sh
@@ -5,7 +5,7 @@ set -u
 set -e
 
 # Get parameters from bitbake configuration
-source <(bitbake -e foundation-armv8-native | grep \
+source <(MACHINE=foundation-armv8 bitbake -e foundation-armv8-native | grep \
     -e "^STAGING_.*_NATIVE=" \
     -e "^DEPLOY_DIR.*=")
 
diff --git a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
index 1d3c206..ab60cea 100755
--- a/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
+++ b/meta-arm-bsp/recipes-devtools/fvp-common/files/start-fvp-base.sh
@@ -5,7 +5,7 @@ set -u
 set -e
 
 # Get parameters from bitbake configuration
-source <(bitbake -e fvp-base-native | grep \
+source <(MACHINE=fvp-base bitbake -e fvp-base-native | grep \
     -e "^STAGING_.*_NATIVE=" \
     -e "^DEPLOY_DIR.*=")
 
-- 
2.17.1

