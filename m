Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.1743.1602518140574148895
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Oct 2020 08:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Utzj80Hc;
 spf=pass (domain: arm.com, ip: 40.107.21.80, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsxdgDDrxTjyxwJ8VaJLUUOWCtI7qypdnmv6CJ5o3T0=;
 b=Utzj80HcB8r29F1OUMAujI9iEwqtA+slO1ybD4Xu0eglvpyo38Q9OVkBYk1VR4RGbcBJg1lzNbprMLP0KjBoh02Vnmh83PXruSZR5S52cmY4O8ogITHtLMWqeyvwqTRinNQjua0lG7BshJQIsIP4qG5kky6ULVmofgKaVOJ5gYs=
Received: from AM5PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:203:91::34) by AM6PR08MB4117.eurprd08.prod.outlook.com
 (2603:10a6:20b:a5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Mon, 12 Oct
 2020 15:55:37 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::83) by AM5PR0502CA0024.outlook.office365.com
 (2603:10a6:203:91::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Mon, 12 Oct 2020 15:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Mon, 12 Oct 2020 15:55:37 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Mon, 12 Oct 2020 15:55:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb27f28218815349
X-CR-MTA-TID: 64aa7808
Received: from 43ca2ec77815.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 991F6443-610D-4F86-B77B-997CABE25EE8.1;
	Mon, 12 Oct 2020 15:55:31 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43ca2ec77815.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Oct 2020 15:55:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3SLBMpDdCP1bmzU1tD9q4AFJYU2zr51W1d2AIs73naIuZyGOe9DXG7qnruIcflm9ZjYzwuosPc+eNAGLFAv1cW7mDMg24dGwCIRG8VdUgEZd0eWftojlYuyqk82V9sRaTCvnp4cdEk5gA/xzcNfKM+vwiErRJ/z8VTcKtN+EO+OAYuek4StaJlkhiPl8HnDZB9JikqPu8ExQxNDNx3OeHrGp8Hj8HukX6C23xMGVLsc6SpfIQb1dqrSF9xgxtJrdh8vGHH3ycN0s4ppRo5JoJgr4KmXsyHKdwssZRsYPYfVaP3fP/E2bmuZXA8J3unt+Pu9B9BRevaI1ue533dTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsxdgDDrxTjyxwJ8VaJLUUOWCtI7qypdnmv6CJ5o3T0=;
 b=DqWudXVMW5aL+Y1f386uNoDcG0b085lKjEWJy4gAH7PvLxUevFJZC8Sl+LYDot6+eMJa/txf0MIXAuCt2gimKEmGFYcYOa7fvVS3pTsb+dsGjNDu4N0ujqe0yZ63StxsSK3J+c0k/DHPtT68LQiOr6sAcV5aDLPGvIqSkYqFkwFA8Zbf8ReGjnSpfJfCsd6TPMV7kNzINY7tKWYWrJLvCEIdCjvFiL4fbMyfy+vWvJbD+UhzV+2nxUubPIE1jHg3cnmteSgtoaizzrmCXE5cVM7M+mx/H8YnkK559cCfgQ6nnB/NcNB1hO7aDJvbllF5rojv2IYfsSRStc2Q+NSr1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsxdgDDrxTjyxwJ8VaJLUUOWCtI7qypdnmv6CJ5o3T0=;
 b=Utzj80HcB8r29F1OUMAujI9iEwqtA+slO1ybD4Xu0eglvpyo38Q9OVkBYk1VR4RGbcBJg1lzNbprMLP0KjBoh02Vnmh83PXruSZR5S52cmY4O8ogITHtLMWqeyvwqTRinNQjua0lG7BshJQIsIP4qG5kky6ULVmofgKaVOJ5gYs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB5394.eurprd08.prod.outlook.com (2603:10a6:208:183::20)
 by AM8PR08MB5762.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Mon, 12 Oct
 2020 15:55:30 +0000
Received: from AM0PR08MB5394.eurprd08.prod.outlook.com
 ([fe80::29cc:3438:61c1:b54c]) by AM0PR08MB5394.eurprd08.prod.outlook.com
 ([fe80::29cc:3438:61c1:b54c%3]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 15:55:30 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp: fix cortexa32 tune
Date: Mon, 12 Oct 2020 11:55:24 -0400
Message-Id: <20201012155524.30084-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To AM0PR08MB5394.eurprd08.prod.outlook.com
 (2603:10a6:208:183::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by SN1PR12CA0073.namprd12.prod.outlook.com (2603:10b6:802:20::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Mon, 12 Oct 2020 15:55:28 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 12 Oct 2020 11:55:24 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c8d1719-7909-44a9-5669-08d86ec74324
X-MS-TrafficTypeDiagnostic: AM8PR08MB5762:|AM6PR08MB4117:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4117C3CE8093A01552556778F0070@AM6PR08MB4117.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GszNRJt6YHE15nYJhBlkv1Rc0wbcaS2cytmKVcLgFXz4qGH8r4lkGMUkZ7peaf4Z1siAgaJrwm9+2COQwaav5TEhD88428zbem+yeyRAdihobDTws6AmJ5qMZBzpujffsXPD8rmvHGl+qCsPCGkZwMPY/el6POwq7KJJZ9+MgXdhNzX/6Lv6xl5XuwSZJL+7lPNGNEyB8cw5XaBlCJgCTo+cWun3bVW7fCMZNFz9u1OGCubp94EIlo21bxpVrqp5DFD+XAKVzXfmcoITPB0N2RGnbcIy66/7LmnH3r46syLtiNKndpwhW29PuIXmp7F9
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB5394.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(26005)(36756003)(44832011)(478600001)(86362001)(6916009)(66946007)(2906002)(5660300002)(186003)(426003)(66556008)(8936002)(2616005)(66476007)(316002)(8676002)(42186006)(52116002)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 g3gNDj+OF1h5UXPEDtskOs1iU9sguG+aVC9DNYIuS9JX6pvK4EOulRdxFAuUF6EhLb3ciuzA39O5G14Ki8UbGN17E/W2sxMEZvceQFs+WcC2lwVvni6nwu4cOQ7pjx6vLSiu9atUHEDMURanoKZg9gpCFXGmQcnol39hgKunftNNiG9lzGum1lv8ai5fNp8SShwRZu+EEGPFuyGdXxy0qf17+6aHq0HNOBBb7hdgLwmZyJjnY9GzEe9Qokp55qQlGH7TMRR4XM76IuZGHu/eHIGbuToEAXXUBpApScteVIPN+Xo5XdWFeMk4AxiUD+MwfszMSA09XZGmqBdlI5NE1snMV1HF5zMA+oEadt4/8MuzKz+B9boUbzWuYMXhvy5kdnL1Y12BxF3IHeMlOyIPKpLNKstKDNcPrVdQ85GqQF7gFmPpVbmM9BCpNrgrNtlwLAKXj0Dekns7N0+IekB+9cmJLCMfktA1/7PXbLrJN9zful7/WCnaDKA/QWFm0A1bdLFiAX/BxNJ/1Nd+E1c5L0z7bho0hfE5v6hfgILzWVjxjfzMVmZ2vhWvFV/7nTxHixQft9q3Xz0LN6TdJoUFkvgdoZeCfgZKgUlYJUS+yM4LGijfyK0CwhZxCh1sLfnvwwBOojZQYKBgPnJkHMGQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5762
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f7d77aa2-5659-437c-a8c8-08d86ec73e0d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0dp5OawPnXL7U5st9OnfgmlToYOp1HloHSyqutz+iNhHnXqdJt95RCf1SQ8SSvyajpPgEcCPOnGKzvbvbMgFiUGKtoV4ukpEbDWstYivlOojgx87RmihHXqNA6Z/Toqh2g1PrT9089m9uOo1Zq59tEGxuTA1eHAgmRZhbGRmJ96FY2WIqGSVaLjDlKTUyGSb86CmK3q0dVRE0jPUcZgHgo1yVbddXuZ+aDvXpKYMlgcvyugToMKoqszlBpjZJ9U6XZtbO4uSCmKEQMnlbLHtZrnw8Im2wDwhv00YDh4iUqW8IVz+Ul8D7XIdpbuufY8EZXy10Lf4pWodQ9tg+dz7VtWLO1GEytRM/WHX5WkdlYnbCABxGLBFTvsbL8D6E8O48ca9sn0n74pChtDBbadwEw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(81166007)(6916009)(336012)(36756003)(42186006)(70206006)(83380400001)(8676002)(2906002)(1076003)(8936002)(36906005)(478600001)(26005)(70586007)(356005)(86362001)(186003)(2616005)(5660300002)(426003)(44832011)(47076004)(82740400003)(82310400003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2020 15:55:37.6367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8d1719-7909-44a9-5669-08d86ec74324
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4117
Content-Type: text/plain

Cortex-A32 is 32bit only, but the recent changes had it working as
64bit (causing build breaks).  This reverts that change in this file.

Change-Id: I58115096477424127baf99712b96131d2a0b0497
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/include/tune-cortexa32.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
index a11ab7b..e86de6c 100644
--- a/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa32.inc
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH_tune-cortexa32             = "cortexa32"
 ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa32"
+TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
 TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
 PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
-- 
2.17.1

