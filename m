Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web11.6862.1588252766597983363
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 06:19:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EaMaydxP;
 spf=pass (domain: arm.com, ip: 40.107.21.81, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkCA+D4H/5GlJK7XqjQfwkyghFqV+dVg8rpBDTFcw7s=;
 b=EaMaydxPTrXfOm7/X16nO6NBON4w4Cws6/VBjy3q9JkC+XKYr6kPsIL+aYLqOP4NnIFoDT7k6iiVsDxftxlLx3lJbtl/edu2P9LXfNwYXf7t80Qtr9M+lbqLxxSpWX1HJP24kWG7r2wjjVctz6i7y6lU0bcXIsMHbo/bvzLret4=
Received: from DB6PR1001CA0038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::24)
 by AM6PR08MB2952.eurprd08.prod.outlook.com (2603:10a6:209:43::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 13:19:23 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::d5) by DB6PR1001CA0038.outlook.office365.com
 (2603:10a6:4:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 13:19:23 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:19:23 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Thu, 30 Apr 2020 13:19:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 989d9300fc2196bd
X-CR-MTA-TID: 64aa7808
Received: from 911ee4b69fc8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 057E85D7-9D0F-4D9B-AC09-2712BC6D1325.1;
	Thu, 30 Apr 2020 13:19:17 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 911ee4b69fc8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 13:19:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kShgq3zPxQAYsR5jGOK63MXkPVN2/RY1zcMonMeFD9flU5TyeoFxRkSJ8pkKsN7mYHfSZf+ja8RcapkKYb0nBEFCVBniOHVU/OksgGdoVSyzvqJSmb/DTuZxf0t6e4UkoBgt5uqO9J7QO7eRayRZ9sV01dZJu0fc19pNDkaS1Eit5YwWqmUuDN0+EZklUQS4gZRd5T8SLnNyWeWPmuk6Ma0ORgTKZbaTikydX3wKcmTTiMuDg35lMrK/MM6r0KfD1cDqXwN9NYMFmRVih0uPOG7EZJSB7a3/uoVZMxbjqhRjAC3XqemqLuuids0mxViz70pbFOfkBwdTseBPlAPLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkCA+D4H/5GlJK7XqjQfwkyghFqV+dVg8rpBDTFcw7s=;
 b=PqFOxfFXgxenSU7Sxv1hoerk7sW97jCK9VAMznJgsw11pVv2r2pMjTYaUZwAoR2dvlMQlo47yJVCJwPMdbb1qNTszqFhVqYiaNYynqVWi6+facBcIG5vMbzPu/aoUXFW+astqWVbzzMgHaXKSWfqmnjWJJuGZpZqtePL5+XGBQKrimwYP7HSrWgO/MCG5dwDKI6U9h1Ih86AyUnJcJoQMFBYgJkiX+X9dJbmS6IXdQUMGbA52BvDBM1qsKdp2G2beSsApUWfVXZGhSncL1zIne4zL7wsUBpw5fz7JU3x5B30fCv8CYd/sO1rqceFZSaySOcVGAOLfr+kx6HFfOftUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkCA+D4H/5GlJK7XqjQfwkyghFqV+dVg8rpBDTFcw7s=;
 b=EaMaydxPTrXfOm7/X16nO6NBON4w4Cws6/VBjy3q9JkC+XKYr6kPsIL+aYLqOP4NnIFoDT7k6iiVsDxftxlLx3lJbtl/edu2P9LXfNwYXf7t80Qtr9M+lbqLxxSpWX1HJP24kWG7r2wjjVctz6i7y6lU0bcXIsMHbo/bvzLret4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4340.eurprd08.prod.outlook.com (2603:10a6:208:139::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 13:19:16 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 13:19:16 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] optee: Use softer assignment to "invalid" for COMPATIBLE_MACHINE
Date: Thu, 30 Apr 2020 14:19:15 +0100
Message-Id: <1588252755-48172-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0258.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::30) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P265CA0258.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:19:16 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 350fa370-7f8e-46c2-c1be-08d7ed09197a
X-MS-TrafficTypeDiagnostic: AM0PR08MB4340:|AM6PR08MB2952:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB2952E1C2BE473A0AD1B5D43492AA0@AM6PR08MB2952.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 g8SUZrMYXZzLw5YSf4SmynQfAZRFtp+4Wi2bix8alESk2RshPDFiCsa+ZlHW2Mc0931QTwXrPPBdlUM/aJpZivlj3IlvFXLCO7qUOSMAKsMJGQc0EMWE6WxByTrueZ45Ge38+Z1OvrIOJ4+bXHCGjHhA2NNxPBjxVkln24i8N9MuQ4rBJfPugJNuYiIpFti751jjgtcxlXgXGMVaoyU+hVjXGz0D6jXpFuez19pkOZpCia9X8H3iSF8qZCNou2UKkUIqJ4AUsm+fatZvJ/HDhHK5UqkYIBp326GScjkMb9fDXtKXBCA2W9jw7lFWHcbdNCUJy7abPx5+IXhrmIlv3HHl/1dyU/kk0rYnzTWBLtXTqmWq2dJyAkL720MqCtpmEhOClFUWYTFt1DhRqGP8D0fJXCOMLHXAma7XDOCANJqSQV2VhgWMkcEHRu94FGnE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(7696005)(2616005)(316002)(44832011)(956004)(2906002)(478600001)(66556008)(4326008)(6486002)(66476007)(66946007)(86362001)(36756003)(16526019)(186003)(26005)(8936002)(52116002)(8676002)(4744005)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 /SXyVno6Ub0B3lyu9eNodUXlzMt2dtupAQ0I/RmTdQgW5god4nSWm/+FatzUOqKLiFzH14WWNXlDO16JO6B/B3xeKRBRx9SWKMdyGjlNa37bxVA5LrMiOQ/Xj8nGKTlq5y/1f4T+gmOiv/CWkXe1ZUtcZlMpHOnQs+ef5YwiX3ooZF1ZY/n4m8GKgeHqGmpygMUa++lq2e3C+I+Bwg3gqPzDILjYQq9RqP6NbSNApR0rUW0pLjYlZqI9OuYY8cYzvaHKSqD8/xwsInNL9GP/nSk/lZGqJiIb5BGZNEe+Kj312ABq0Ie4g4sAXzTBf4cHVqiVPrZEUv7DhvrGtHXSn5JaH0o7ljwivjZrZxGicMRWS7Ppqw0ELSclSjcJqHON48hDm/APTUXaQzU3N8Emum91NL1xXTf0USFHxwCAg2k1plF5xP70+vGIRry/9UeVAXpQ1F/9NWVWyVxD6Ls4+eRjyxoRJmioLAOWyuXiUOM8K75T2WKhdnnFdYBPXjzY87KKVpqhaOKn1+B96858WeoY1qsGO6Q2itGgQX0Cq6ei6gyXNLAFml80n1yPpopavUayhUpt+Q/Efx3D1txO1a98DzvUvI/KLuzRieQnN58+wVhtaH9Wo3raf0fh72ANiC3iNxf5kXuHMRrm27RrOowUGiLcVYjVI6IIpKv8FkxNsd6Em+wR+1ucBZsn9UR6nuoXRRyv1LA2D7HLR8Y78qdZRJVjmjWB0QumzfpQHkfY70JKtv16qo+LaBiFQre9VLrr1KX7o5bVI/oQ55/qd9uHG8cn+bTCeLxhgtpE/mA=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4340
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966005)(16526019)(186003)(956004)(2616005)(47076004)(7696005)(478600001)(316002)(44832011)(4326008)(6486002)(82310400002)(2906002)(356005)(82740400003)(4744005)(5660300002)(6916009)(86362001)(26005)(8936002)(336012)(81166007)(70586007)(70206006)(8676002)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94f10338-6e0d-4eab-d201-08d7ed091548
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vvFK3SZtH1SYy9EyjHFQ9Cg2k8RWVtLxU3BRe1p7zWBcJttSH7ugUas8MjmOCZFDQUvWmB/imtg7f6M3DjNZWA0oZKYtho9YVjxwbrfG0tKNoTG8ZMO/M/QJlFKHvFtvpgIY2ndGpxAQQ5xBN/Kj6Z9wkSSi9RWTVg949G64ctgezdIJXanp0TgwKNy3IkEXXhzNNoqR/PMr824iUEz1ivsPQW2hHbVeX+dX25kVW5nb67/A/atL2822W/pYC30C8+ts4AxiF7+GQc95SxDwwvdzTlwoHhC0/EkrqxMgXnh1DzziKafWTDJZzI1rMgwrqG51p7SGpdgmNoEjUbY7OBKCuK00oCBwpOvtxaK4wMvm9g73aWu3MA8DwO4qz9XvlzKudCqj/Aj6XBQh8vXNZN8K7bW/764gpStVLSP1NQkN5zwmceMJo6f3ea9T8JwHjH6T0snMoRqbIGY+KtAg2lJLSqm7/C/y5zMjRD2iESYfH/TlWELT1ly4ANKlKemRsN8QbWxF0XBpYbQqMuE+8w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 13:19:23.4108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 350fa370-7f8e-46c2-c1be-08d7ed09197a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2952
Content-Type: text/plain

To keep consistency with trusted-firmware-a recipe we should use
softer assignment to "invalid" for COMPATIBLE_MACHINE.

Change-Id: Ib05afcd62b6b2104188b90bad4d952eb055ae443
Issue-Id: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm/recipes-security/optee/optee.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index a12521d..b3e5271 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -1,2 +1,2 @@
-COMPATIBLE_MACHINE = "null"
-# Please add supported machines below
+COMPATIBLE_MACHINE ?= "invalid"
+# Please add supported machines below or set it in .bbappend or .conf
-- 
2.7.4

