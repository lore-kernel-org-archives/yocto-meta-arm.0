Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web12.18941.1594731549975910785
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 05:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ST3XINiw;
 spf=pass (domain: arm.com, ip: 40.107.8.87, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVqIGNA5S15i5EoRx/30SzRUUwWrreWwCCdTXIdnpkE=;
 b=ST3XINiwYiXs6AGmbluspbQqrPUm6cmx1Hyym1pz+THSwJ9k+8C3LvoIHo5BExdPNwAGvQ7GeC0mwcA/6wCFz3yMgw1jLQL1dt1a7tFUDJPy5eLAPgpz2NsWfWHWEGOl99fCKU2lqnASYahr0b4B8ZZvubR6Ox2yvNLHqTaua2M=
Received: from MR2P264CA0133.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::25)
 by VI1PR0802MB2415.eurprd08.prod.outlook.com (2603:10a6:800:ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Tue, 14 Jul
 2020 12:59:07 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::82) by MR2P264CA0133.outlook.office365.com
 (2603:10a6:500:30::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Tue, 14 Jul 2020 12:59:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 12:59:06 +0000
Received: ("Tessian outbound c83312565ef4:v62"); Tue, 14 Jul 2020 12:59:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ea81adf13bebd34
X-CR-MTA-TID: 64aa7808
Received: from 88542101e63e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C6A14677-2D67-486D-8015-1622F1BB4B10.1;
	Tue, 14 Jul 2020 12:59:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 88542101e63e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 14 Jul 2020 12:59:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esTwz1GmJgJNGgDi4VHSfxqvaQ5gIn+2KJiEQFp2621DlWcs2SlT6lFukqV97kf1LyDnNkdzj9pHLmJJdBHKGo06Ooe9x8soXjf8Xd4bC7hCiyaLxmD+FdRGR1cMPLaLUbz8lGxupoETwDhxOQDYpVWnXWthtaFX1dypQOj5jad7l3qEXh21YI2GUe5B++cOLcg+fB2hESUxcmL6hMcGEiuwoC2pY7JVPnFH15RyijrQz3a1CefxzQDej/pBsy17+2IEeSz3xwVfb7FHjXAFFhWojc8u84P2/Xju7uj+mu70o7j/zqnnNuGFUnbeezLwivOSXkalGFs2BCayXuoiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVqIGNA5S15i5EoRx/30SzRUUwWrreWwCCdTXIdnpkE=;
 b=VYvEZfaSZqm6iPWUQGsA5DDjcZw0BqVu066gwb8qaPRIsllg8p7oDbhXeZHC0nHU4TxvTBmQG/kUEVT38PCUjghXZ3qOtez8HQ6CGra6v2km2k0i7hdC9WLdHB0HTHfqBi+02qLIPI0ASl9wcjEI6it7LXnwlc/lsPDX77k7T3y6Anz7lKjvkTvxaUFd/M5CzyelDK6xakr35sI1J2GgQHYWovim3jULHeZhw/y8Hxi/a9GPpaTvZe5BS4TssvtawKwjgnQXr/W5ZFOT0n2SDlTvUlvOp0But+hsA9qfmJYERqWPcWAaW+WSx8KQX2Tg/BysaCf8h3lMBcMjSPPZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVqIGNA5S15i5EoRx/30SzRUUwWrreWwCCdTXIdnpkE=;
 b=ST3XINiwYiXs6AGmbluspbQqrPUm6cmx1Hyym1pz+THSwJ9k+8C3LvoIHo5BExdPNwAGvQ7GeC0mwcA/6wCFz3yMgw1jLQL1dt1a7tFUDJPy5eLAPgpz2NsWfWHWEGOl99fCKU2lqnASYahr0b4B8ZZvubR6Ox2yvNLHqTaua2M=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com (2603:10a6:20b:a3::11)
 by AM6PR08MB3237.eurprd08.prod.outlook.com (2603:10a6:209:4c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Tue, 14 Jul
 2020 12:58:59 +0000
Received: from AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44]) by AM6PR08MB3974.eurprd08.prod.outlook.com
 ([fe80::851d:b6da:540e:de44%6]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 12:58:59 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/4] arm-bsp: remove unused bbappend
Date: Tue, 14 Jul 2020 08:58:34 -0400
Message-Id: <20200714125834.31338-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714125834.31338-1-jon.mason@arm.com>
References: <20200714125834.31338-1-jon.mason@arm.com>
X-ClientProxiedBy: SN4PR0701CA0037.namprd07.prod.outlook.com
 (2603:10b6:803:2d::32) To AM6PR08MB3974.eurprd08.prod.outlook.com
 (2603:10a6:20b:a3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN4PR0701CA0037.namprd07.prod.outlook.com (2603:10b6:803:2d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Tue, 14 Jul 2020 12:58:57 +0000
Received: by vm (sSMTP sendmail emulation); Tue, 14 Jul 2020 08:58:53 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03a56fd5-3999-4318-2492-08d827f5b146
X-MS-TrafficTypeDiagnostic: AM6PR08MB3237:|VI1PR0802MB2415:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2415C374CE4A44EE42CA6105F0610@VI1PR0802MB2415.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dWWAheYVU8rw+99ZBtIs069YFTvMcp6vJfHACm9+P6i3jPRI3Pi+mugVh2jQAO19XCv9oec1LTWirFPA6tyQDzq2J+FNBbHusOp247vUe7mK4XhkP5/VBQy4W/nU9ZOaM7C+9H7+MiNuEHOPtAjNDfpVwVtTrzSzEHplq6SOW1xQY5F8wca1JWBHr1rFy1WeKT1ww01W8QPmB9OUCrG3NW58U+m41lJ78BDYRAts0fIgZsrR2Pmlh41fguaB36UF5e4znJ6F7pkR7I8OqMXkLyiCBnwSu15oDfwbITcunqYHiKDkMDYDWbn/Tk45rapWaAFpdpfF33B6o+StVZCHTw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3974.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(1076003)(478600001)(8936002)(8676002)(26005)(186003)(66476007)(66946007)(6916009)(66556008)(2616005)(52116002)(316002)(86362001)(42186006)(6666004)(5660300002)(36756003)(44832011)(2906002)(83380400001)(4326008)(4744005)(426003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Pe8kz5V3HS07GlFiI0mUmlHxMabNQwxTGvhxnHYBCK8Ft881r/IugjFH+wwyVOpZ7xPi71LIxi5ikBz7vI0wPtJu9+U0lafJXNicZ64btvx94nSS1XFdGdKZPF0F6d1lAW/jD/g2967vj2axohdEHzOtNehXADIEMX0sAvUqNtF0NZcyS/2aYFMCs4YFBwbDTMi2srbBkbDlqJHX4HoApzZvysfB6o8bwKq5qHNExKHVv15DSggarnF0urkX6JVxrDRuZxEC6cuFBwKIndML9vziQnVDeLV51OVksTY38ka0mCPw6eIU8t4wrTNsE2aJC0G14gX3cgv0eGx1IStiD0HK2vyK7mpiPbByUyfiA+cVRH/XOaHRnvw4jK+//kPoEiANMxmeJOj1Rdo/q0lJvS6Kq1Q37AWWRGT927fFG3iPOoNlDy5+0rUohfxNDZhNlRRXKJCZbrDiAhnC1eprd4a2M05p4M9FqZrU+gPdX3Y=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3237
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(70586007)(478600001)(82740400003)(8936002)(83380400001)(42186006)(2906002)(356005)(6666004)(47076004)(1076003)(82310400002)(44832011)(36756003)(316002)(4326008)(36906005)(4744005)(26005)(81166007)(426003)(186003)(70206006)(6916009)(86362001)(8676002)(336012)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b1d734cf-05bf-4dcd-06e9-08d827f5ac36
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rUVS3PmallEFA1sFqDamY4An/kQtYqRjhWmwINU1zBaIV2bK9t4yVH2ireM0hXxor2nmGIeDyx0R4LBDUYiMKszMipklOgNpxKHQueykcJlDWhUivx+My8WZ8xgYdFZb3L4ySsmAywyU0qjuCR7evLUlsAJorajQfuOHeS6SDZgsl7Rs/CyqVeOdtHApkvWoDf/S3vvEwUdk1/3bnsaqV4TvU5sWABj682sN5v8Phsv0BTOIcDuI0MTZ12qVBRzQ1agO4gKnd/N7HH6/x1pwl5r16Wmh576lh0+HQmUAgLnZGY7zELpZ3/2biyHhAkpenPsq5kwwxw9IrDH0d1Vj1m300s4qT/F7It31Zm62wjIJacMTn5jbRXateeborZxRjWCfF6+S4Nbw1ezC6sZzkA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 12:59:06.6440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a56fd5-3999-4318-2492-08d827f5b146
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2415
Content-Type: text/plain

linux-yocto_5.4.bbappend is currently referencing a non-existing file.
It's not breaking the build because no one is using it.  Instead of
fixing it, it is better to remove it and re-add if/when it is used
again.

Change-Id: Icc6d4b2a3d42981dac884600a351c267ac346246
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
deleted file mode 100644
index ed6fbc3..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-yocto_5.4.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# Add support for Arm Platforms (boards or simulators)
-
-require linux-yocto-arm-platforms.inc
-- 
2.17.1

