Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.54])
 by mx.groups.io with SMTP id smtpd.web12.21399.1593610055229839997
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kfXY86zB;
 spf=pass (domain: arm.com, ip: 40.107.6.54, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7irmTzZtq8Rh7NUSNwMf4GrPEhO//2i+6GVwxkRUIaY=;
 b=kfXY86zByWPW/pk/ucjL7eoqk5SGVlWjUTqy3zOsRktOKtqDdqH7zktvNPiDrbfT/w2yb/2WoCDnTEG4rnMFpIaqShW7X5U9aBJEoA9IQGzjgSdfCA32HnioxshhLLLP9JPCEyK7ySNUVM8rmtaxQ1qOhXPSftFO9IMsOSC68zs=
Received: from DB8PR03CA0034.eurprd03.prod.outlook.com (2603:10a6:10:be::47)
 by HE1PR0801MB1755.eurprd08.prod.outlook.com (2603:10a6:3:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 1 Jul
 2020 13:27:33 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::38) by DB8PR03CA0034.outlook.office365.com
 (2603:10a6:10:be::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend
 Transport; Wed, 1 Jul 2020 13:27:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 1 Jul 2020 13:27:32 +0000
Received: ("Tessian outbound b8ad5ab47c8c:v62"); Wed, 01 Jul 2020 13:27:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 934f9c6f054559d1
X-CR-MTA-TID: 64aa7808
Received: from f4fb30e10767.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5EBC56D2-D85E-4F50-84B1-5295C6CF50FF.1;
	Wed, 01 Jul 2020 13:27:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4fb30e10767.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHl8dVIIMCQlgv2pKBhpgpvEKpd6HkhO8fa+m4gETkxq3rb/GSeAb8+aWf6ISdlTNRqVLqagCqvLwG48uHUje3nslVU3L4zgG+SJYsRJ8XsYe/hXbIIPqSV1BMr0eNAKX0n4v+SXW0i7uudCediO+7SecDmTMVdbvz9iDDVUqgTkWZBHnaCYYpqfXNM/tSYnk8bCVuO8lOBQp6t0WP53PcvC173JfbcejeTnl+nXwa8mHxKIuNbSodgEGa/QrbLecHnn+GmPdPLr9xULZRWYKxby+E1o3ITwCnoFA2F1TczkccUAmw8aJjGPqVZ4hpPBfH1uaFAhwo+x1Hf5yLQO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7irmTzZtq8Rh7NUSNwMf4GrPEhO//2i+6GVwxkRUIaY=;
 b=PZvW8VeiUdgHvbW9zTRbIFbV3K7enb7md9xGVCJYoCTppKW1plfEX6lYjYu7XHYR0YCKhq5yDjHWv3z1eGvqCFTrpi4Yq3XEarEqVRTVTkaaYIGzWToTTKzHWHT0y3uf0EKuP+/YPIl+649XEu/bUdkI8+7hf8pqgLIxqHSXFs0SwZR9jz4UoDxM+tWThhNrvmw/r5f9nZJ10MeNJ4o25PLJv+lmjPbAq0fy6b7ftZo30cudBUBsHTETAH/OXTWIkvBdL9ubdrrE0jyzI8C1z2SueK6Lqq9teOP37B20caj2CWJkX5dkWSytNDnGT/xgmZRKy9i+/1symVNix2VbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7irmTzZtq8Rh7NUSNwMf4GrPEhO//2i+6GVwxkRUIaY=;
 b=kfXY86zByWPW/pk/ucjL7eoqk5SGVlWjUTqy3zOsRktOKtqDdqH7zktvNPiDrbfT/w2yb/2WoCDnTEG4rnMFpIaqShW7X5U9aBJEoA9IQGzjgSdfCA32HnioxshhLLLP9JPCEyK7ySNUVM8rmtaxQ1qOhXPSftFO9IMsOSC68zs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB5058.eurprd08.prod.outlook.com (2603:10a6:208:160::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 1 Jul
 2020 13:27:24 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 13:27:24 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] gem5: Add README
Date: Tue, 30 Jun 2020 15:19:32 -0400
Message-Id: <20200630191932.31241-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630191932.31241-1-jon.mason@arm.com>
References: <20200630191932.31241-1-jon.mason@arm.com>
X-ClientProxiedBy: SN4PR0701CA0028.namprd07.prod.outlook.com
 (2603:10b6:803:2d::29) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN4PR0701CA0028.namprd07.prod.outlook.com (2603:10b6:803:2d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23 via Frontend Transport; Wed, 1 Jul 2020 13:27:22 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 30 Jun 2020 15:19:37 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c842f766-1de0-40c3-4a2d-08d81dc282a6
X-MS-TrafficTypeDiagnostic: AM0PR08MB5058:|HE1PR0801MB1755:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB175570689431BEC724F78308F06C0@HE1PR0801MB1755.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tELb4JDOc9qSviCAiiHqbJsr8L0/T9vEsG6XHOxgTqGayDrdUJ4JV6cT++7YwC0/GBGJNFYIj5te3Fr0KwHRSbm25gFECmh9IFSwYsCx1FBB0OGhbEmVF79RaoTQdeKC8jSLTMz18Gp8UE7ICQUaD7OqxXcI9G/dxmRtlxbSy8nHPi5VXwv4sEkASmwKOaUwCm5jU7M7MA6fhvPm7IZmDFjq8m6nvEsoCfXZKbXXaPg1LI5dl38TbMxSQhqLoL2FkM82vpxQ5l3a6uNiPr5ZAGWnAk65011w2fIBUrG4zOLceyxXut0ZcSNKdzgBYJRDuALis3ntMgPFn3B/LoXLcw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(39860400002)(346002)(396003)(376002)(66556008)(8676002)(26005)(6666004)(66476007)(66946007)(316002)(52116002)(2906002)(426003)(86362001)(478600001)(36756003)(42186006)(4744005)(5660300002)(4326008)(6916009)(186003)(8936002)(1076003)(44832011)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 8mhc1ZUv/Pd/53a1EerfbcOqvkeqm6marP+BbvAw+fWVknTrp7bEsfWmoynYiF8NMayLfVJjB+T0mZ3P2FIgyjAu7WptLZzK02q0oTT3tWMbtrxuPy1I53oU6OJPKbFx7REhYTDioeFbtqBt/YR/d+uA0xYthuvbkHjNGMPnJKF2Z5Ox4lPCe4kYWOn51HsbywmH47C0kHtQ40lGOhamqN3nu2Mhl2JRNNI1i59xiK+kngrJqN9NXcoCiCERuVjsyBP60ofrmZJNvsx3URkA7e4jh1+osw/qbqrU8ESJDx2KFBVoD5FJ/6MCjhwlqzDe1pbJWcogyW2ONB5793AEvVaSFEfRUiuaRw/YimuAmz9J6QD3Rjag4rokNh3sG/WmemtB5+vVAdvMwsolgD4wpwvEbuimWkLqM3IsUpLfDn/Ls8KV78/fp3OQMxIZAaLY2v2fNeMjxboL1sGHLy4dgIxhxdtBt01Nv4KAIlK0kQ4=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5058
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(8936002)(6916009)(2616005)(86362001)(1076003)(426003)(4744005)(26005)(316002)(42186006)(2906002)(44832011)(81166007)(336012)(47076004)(186003)(36756003)(82310400002)(6666004)(82740400003)(356005)(478600001)(5660300002)(8676002)(4326008)(70586007)(70206006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	80b79f48-8055-4f02-0501-08d81dc27d21
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b7DS2OD0Ta3Z2C5S16sB/cORkgXiA+h/24TDBh5N2F3vd9Dmfv08Ix717QbzEhn3f8LSCRAJjg2jQ+t+8Sv2azK81h2cfHZIL5GM158P32M3p8p2v24e/TCt3SPPuxjf0lN8CGuKXXJEyxXSCpks+bgpZrMQFicd5tzhOnVaQZ1mvUko7Xm5xIcV4ek0sh1oPTHA90geIYOGtKkFawVl30Q8jZRhSndaxM/Il0DogljnWIwALeQH6HplqXJNAf5hSpwidSjZZbkfh0W3CrXLqjq8fq0M5JGJkMIG0uTNO1te05oXJtQ7TU5IOmN55ZXsvz/6KJwIQ8dB2MKQqcD9EtLEKiI8PupowaGT+vdHYartLSb/QNIYJOawqQEX6rlMrU+G7OSsvy9mMzUnQ2BzWg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:27:32.5612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c842f766-1de0-40c3-4a2d-08d81dc282a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1755
Content-Type: text/plain

README.md is needed or yocto-check-layer throws an error.  Add a simple
one which references the one present in the root directory.

Change-Id: I1e0bb52ff3679347ec72d2f6178e7807398d583a
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/README.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta-gem5/README.md

diff --git a/meta-gem5/README.md b/meta-gem5/README.md
new file mode 100644
index 0000000..490ddca
--- /dev/null
+++ b/meta-gem5/README.md
@@ -0,0 +1 @@
+See ../README.md
-- 
2.17.1

