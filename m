Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.89])
 by mx.groups.io with SMTP id smtpd.web12.17534.1600956242902569259
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 07:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Bm/rkd0R;
 spf=pass (domain: arm.com, ip: 40.107.15.89, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qILKuGQoSkGDr/Bb5aEQEydR4hlOCovbg0HbtCViV8=;
 b=Bm/rkd0RCZu0+cyfkuDyBGXzyT5fcgAEPoTMk0PRM1YKt83MaJyjR7Xgvcf/eGGjMNqpZsuJ6drrioOs/894BMQ4oIOeTw2R7sBduuUZ3ABOygNw6cik97CZwzlUccy0U/+YbzZUqC2ipgESXM89bNyy+yH6WYJZDWu/maiqaTk=
Received: from DB3PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:8:1::24) by
 AM6PR08MB5240.eurprd08.prod.outlook.com (2603:10a6:20b:ec::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Thu, 24 Sep 2020 14:03:46 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::42) by DB3PR06CA0011.outlook.office365.com
 (2603:10a6:8:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 14:03:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 14:03:46 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Thu, 24 Sep 2020 14:03:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f201826af476e920
X-CR-MTA-TID: 64aa7808
Received: from ed67097dcd4c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3153B44B-74C5-4359-96AF-DD40F606C1B9.1;
	Thu, 24 Sep 2020 14:03:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed67097dcd4c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Sep 2020 14:03:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4Vzq3LoercO1DC5UArlKlype0e4Tn3rm4RLy4hRyTmKoLAAppfrDAPoKwCr4u+buzQU3bLGdUjp+qVBOG1a8EIuCoJFmBXtkCQa3WTCKNIa0gi6qHS05zLWruh8u6Q36+dMWK7O+T5HJ0jfsAXB1VrJerr4rlcM6d80AEpTGTBn7i2KQXMLQx0N4G1yAkvfkrdmQFogg+l39Abcymd4heUygo1SB1rWf1BwQlsCdZt9xXBclKYeEVYnscHvxXrMC/sUTxyhCwxfmhUfbUcjaIMpRgYp9DzH26/yNkNUyxGTaQddV2TAHTz0GdHumz058WLbAiHoXfWB/+B+0kPD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qILKuGQoSkGDr/Bb5aEQEydR4hlOCovbg0HbtCViV8=;
 b=oaA3DwPpYc+AkSr1d78m/BEuMcUNJ674c8X+fn6059i+vJgkTMfJOsftQbxgHl1WiF+QRpoQ3iIYOj5SQC1Rb+M9V31jpidSsqXcqJU4bchTKRo/eKQWIYOtUagNYJFbZSfaud9pJkcUIfNetTK46sYZrzZ0jshPv65AMokvvq4mUJtcXmXcGel/stTvh9a1CFBXVcYbbSlYP0Q4tw4QpNaSkad2dl0TSW0rO/UJge/YVGXH/2wzr4YrWiI8X1nw1K6+ExFbSpZFEVbFTjYDfpSTJMuAMV+zJVTUcrBWK27i1hPl5eMWyZQqB5tqbcAFZgJ/pjz76rPzD3SKkP8Yag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qILKuGQoSkGDr/Bb5aEQEydR4hlOCovbg0HbtCViV8=;
 b=Bm/rkd0RCZu0+cyfkuDyBGXzyT5fcgAEPoTMk0PRM1YKt83MaJyjR7Xgvcf/eGGjMNqpZsuJ6drrioOs/894BMQ4oIOeTw2R7sBduuUZ3ABOygNw6cik97CZwzlUccy0U/+YbzZUqC2ipgESXM89bNyy+yH6WYJZDWu/maiqaTk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM4PR0802MB2161.eurprd08.prod.outlook.com (2603:10a6:200:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 14:03:38 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 14:03:38 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: update TFA SRC_REV to include remote chip pcie support
Date: Thu, 24 Sep 2020 19:33:21 +0530
Message-Id: <20200924140321.9511-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN1PR12CA0110.namprd12.prod.outlook.com
 (2603:10b6:802:21::45) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by SN1PR12CA0110.namprd12.prod.outlook.com (2603:10b6:802:21::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Thu, 24 Sep 2020 14:03:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7fc992b-b56e-4f80-d5cf-08d86092a776
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2161:|AM6PR08MB5240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB5240E1CE09AD74AE5CF3B546FA390@AM6PR08MB5240.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Wh5s0wXMkxoMJfSb53xTYY3N/v2DrKFQxIQXjQTnFCCmpasRl/1oOsGHpEqfgc+CxC+yZvS+g20DPrGnVJZZRY/4LQbFCcVEt+yifzddvWSaEP48Ve0YvnkLcM3ZLQfiMjIHkHt7KscwcEYka7hr91Tq0LDW0Zic9jxwDGFvMig9wpL63ChfxyxtJNEbQm1EmfgIhBFqI/JuDT3qavv2m0FBpfnS8ZlILQ4DXd7U5xknvYMPDY6smx4sKSqimWYVonOwwZJfWa+pmVgt4tfSN8VdtP8Gv/qfnNZgIzjjcSHi46zyMsaQ4diAyiCKE8v6TFgEcLrQLSEC43BzkpQ7QA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(26005)(16526019)(2616005)(4326008)(7696005)(316002)(956004)(52116002)(15650500001)(36756003)(2906002)(6916009)(186003)(8676002)(8936002)(478600001)(6486002)(86362001)(4744005)(5660300002)(66946007)(6666004)(83380400001)(1076003)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 gAs6uyxTB0hyWfEgsTE20y3LvqznB/IjrOofIaEOO4x4zODvdk8zU9MophOaE7qQjWNKNuKBFhhFJMEngPHqdDOPtpip/42K1IB/3A61LQDr4lbMNR8nJ8UFAhQBBX3NWi/VjjIdKH7/QLJxOfmth9GMgcPfNVFaZTpCvNomR6uHHSFK60xeWANGJgcTnbzp868/uOfLl3bRtI9o1LEsTVRASrlgEF1EFmXJdASdKYysgx53if9toBPOJ2hRIdy88VLLvYAdUFQm6OrF+6BFbrHB6bb93XqPCiq27Otwtlc5wWzPMCeFbMKOQoFb5e07rGBT8Pnivk4fQtGabVop3y+lnVvAXgbOP/hvMreRnym1tGPlCfiw45XfivWN63b75Ig7atuBMG1sNuzDzQHTy3ywKZj01tp/XjtmUJJqsQlCBYQmhQGRfHZFGqlDYMNDWn6S/bPCDYdrXyMByfgGOWqa2uiHxngpgy7pSneLn5Mzu5tMqzdrST9vZBrvLCRkytKaOUAKIj+vorpSIZDot8lRm6d/frovyjafD6+YrIfDvtTH2bIzx0li9eUv116XagibOcBn86TszQKAqPzxNEKsSwDP2+J0V378XnMBfNy9IjuIAg2Zal+06RYT89FhnQDxzHkXvXsuWLO/nxm8iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2161
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9f3e4c4c-aac4-4c2d-4c44-08d86092a24a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tcQyDV481SJVlLsoeimrPU891MS1gjtkKMx/j1t/yVM/WouWrACmuHyi7L1V+a8loSHg5e9/0v8cZ5nC0HW3+azN249o1eFvq09yh5aYFvbCp9162cqmODWuzs6YAMI/0DgdY2Gk2WoZ0lnMTq9FbN+CSs5UuWsFFk0vb0jZMEuS+5bz7sSvVAysWuh/fKY4sXOt9rfaF8++KxHpQVHQSyDg8JhdLpM3I4R71UjG46+x6comJpUZXg3Eel73RFJ5EykF8/6UJKjI34a84VxR4OWXBIsk77Ns7Hn35s1B9c/8lNj/XAFUHJGT1TvEVOuJ3FGcy+m6n3ugzTZOWCfOYoAEjtxMrHpu97E+qSoCQ41V75PLWm9/eXB2seLMF17qOX/p3kUs5e4t7dQYy0dk3ssqwTh5a5CFZs9l/huHHF4bsS3wqfPRaIMvEMxbWD+i
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(7696005)(6916009)(82740400003)(6486002)(4744005)(956004)(82310400003)(1076003)(2616005)(15650500001)(356005)(6666004)(5660300002)(70586007)(2906002)(478600001)(70206006)(186003)(336012)(316002)(47076004)(16526019)(36756003)(26005)(8676002)(83380400001)(81166007)(4326008)(86362001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 14:03:46.3919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fc992b-b56e-4f80-d5cf-08d86092a776
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5240
Content-Type: text/plain

This patch updates the SRC REV for TFA to latest version, this includes
patch required to add support for remote chip pcie.

Change-Id: Ifeba55ca14a3437e343c4bed72ca5bb2bbda7d2f
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index 88967a7..a9cf38f 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -12,6 +12,6 @@ SRC_URI_append = " \
     file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
     "
 
-SRCREV_tfa = "50eee85e044a77ad59f4903a5dad91b266770a1d"
+SRCREV_tfa = "dffd5192df41e77e27bb524bfe64d747c1c43522"
 
 PV = "2.3+git${SRCPV}"
-- 
2.17.1

