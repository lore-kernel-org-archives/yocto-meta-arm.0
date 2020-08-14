Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.88])
 by mx.groups.io with SMTP id smtpd.web12.14291.1597395875019499446
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 02:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EvYGAown;
 spf=pass (domain: arm.com, ip: 40.107.15.88, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQW1SHsOZ5QGo9epb0mFFU8H9VL34taScwaQ96MTilw=;
 b=EvYGAownsfNx0fHpkiHqAF+zTWKXH46gJ+3YudMdWq3s5q97X6F2w5LLh9uQ7Ub70FhYLkN89cqvMsSYqCp77BBnKtS6g7txinYEoW0CJIrMpF10UTo0gqnEVtjZEXhgYvF022iDDIu3YLFdjiOopozmQF/Dn/s7Vtj/jzwHUl8=
Received: from AM6PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::26)
 by AM0PR08MB5027.eurprd08.prod.outlook.com (2603:10a6:208:15c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 09:04:31 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::c3) by AM6PR10CA0013.outlook.office365.com
 (2603:10a6:209:89::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Fri, 14 Aug 2020 09:04:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:04:31 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Fri, 14 Aug 2020 09:04:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17914c1821797fee
X-CR-MTA-TID: 64aa7808
Received: from a4077d5d09f5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5400181-4F88-4AFA-944D-6BC085BEF7BF.1;
	Fri, 14 Aug 2020 09:04:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4077d5d09f5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Aug 2020 09:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhpjVcPVnt17CmKCD3EGDVwkts9zEAnYnEj4JQwCnMqdqZHCHp9moq/bCg8oOWN3M0/oac6RaIywEHTaV37poPYF3lqQvqO/3CawkGfGK/nGwxEvS1tDVZNYoaq9lZM49TzhcZ69jNVTMKnsUDrHLtqiZbBQXZpRekvpt1oC0qZeCKFO88g5vVQwfMEHucyhq5ehwHHR0XUy90DdvrFHXk6MGJVDn3UEM+wQLhsrJo40BABS/st5PQSr0HC7MfU0QB8o+/UGe1XebenPNutdhgs0pp0Xlo6iDFyjdCLKPViUB285pVnsDE5uLdZI4qUkdXenTdwpdhut39O13NKUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQW1SHsOZ5QGo9epb0mFFU8H9VL34taScwaQ96MTilw=;
 b=CfoFNHZX/CXSvMJmPi5HwA0yBXWkc6vdoIGWK8Ha0TFEYHEEuReUSYJ23ZyV+NJvkTUJRKbKvzKL7Of3gf7Ts9WCd66sFNYncnrij3QgIMf0lLFEC9WuhpYE2ZXDDjrurWGjBPAs8OIlIHQ4Vk22rWqrRHzbpRIIDflNyHv7lS5/4zxI9VqxP1PrH3KCZnYq85h8DNg4PsQ1XmxQtCC8d4nkHVBsdEauyUwdx8+YazB9hz521B8h+GcDLIxcREKWbAut7e/nyoXFZoyFJGmBdZXAqIvM0lhKnLaby/KD/kVRKpocD3krBVeJPR04vfohCq7NSzEwdDD11Rhdt/9XSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQW1SHsOZ5QGo9epb0mFFU8H9VL34taScwaQ96MTilw=;
 b=EvYGAownsfNx0fHpkiHqAF+zTWKXH46gJ+3YudMdWq3s5q97X6F2w5LLh9uQ7Ub70FhYLkN89cqvMsSYqCp77BBnKtS6g7txinYEoW0CJIrMpF10UTo0gqnEVtjZEXhgYvF022iDDIu3YLFdjiOopozmQF/Dn/s7Vtj/jzwHUl8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
 by VI1PR08MB3246.eurprd08.prod.outlook.com (2603:10a6:803:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 09:04:23 +0000
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::e9f7:6dd5:9cb3:23a3]) by VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::e9f7:6dd5:9cb3:23a3%5]) with mapi id 15.20.3283.016; Fri, 14 Aug 2020
 09:04:23 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/recipes-kernel: Remove kernel config warnings for fvp-base machines
Date: Fri, 14 Aug 2020 10:03:09 +0100
Message-Id: <20200814090309.16194-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN2PR01CA0046.prod.exchangelabs.com (2603:10b6:800::14) To
 VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e110568.arm.com (217.140.99.251) by SN2PR01CA0046.prod.exchangelabs.com (2603:10b6:800::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:04:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e0ca419b-2cdb-455c-0d66-08d840310eb4
X-MS-TrafficTypeDiagnostic: VI1PR08MB3246:|AM0PR08MB5027:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5027409B6B7F31CAAE9EE38289400@AM0PR08MB5027.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:418;OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 n9QoLwAqbfqKb/x3Xkf+DG+PIF/mdIO0XxMQ4ib6gPwD/v8UK4BUFJNFraJZ9PqEcvGYlRwUrRXJY+3RuNVo87vtpZlmEQGmZkgf6pGTkTirkedGdv6m5g+97calFoxQEjD6grLnMzFbGCukvtMazNnNF+cB8QrYgm1IkGmMS5ARLVitpOKWspbDIsYg5+3rVoBVI7jBQj+/shRHOCYumKF1ClWCxhmQCfR/lr7qKZ1VdbgjZNgwu0ce4CjWFAxGfpMiW739m1C4ayLbANyMdL1yAo393r86qVWDlr1wnAqXtOFfp9QLaziM0kL0/L3kZjFHHfF7BkpDlbSlk0+ZJg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4334.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(186003)(44832011)(478600001)(66946007)(36756003)(956004)(316002)(6486002)(66556008)(16526019)(1076003)(66476007)(2906002)(2616005)(8936002)(8676002)(86362001)(26005)(83380400001)(4326008)(6916009)(5660300002)(52116002)(7696005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 v9tn8fzfImXNdr0eX6TgITI31NXDDyDHmp/+V7DNfjkSY20mfxrmS/UNbd7mjM3xwK0seRAE6+FTAAOUcolko6aqh4JLu+pr5vw3NJUdup4FF0SfTDRsarI5cDlzJTUWMZQ4HT0Pq17W+9oxcVmrg75/AIGxUVg7a4VRdyqnsVpjHU1onKbY2OJenxb9xMi2lCAhw/DW3lcay7NL9ilhY//kKlHl39DcAfD/tyCIrVZ8V+ibQ+3aF+RrybNUUbKsfibxAilzKcY2B+eSoSv0bOwqrcHjKbiJ76xSHvjWlCju9shVK+PWfpQMUdTzgHZ5rCDDqEO5SDHLCJ7ZNn6mm/JsbR40fShZeReL5phhlzCcyPeaVg/6nSMGBVqGgjavuHja2GIP+jF+/auGp8hh0o+Eimf2lvWY+bpdn2qTbGHAcFX93cy6uMEHoU9Xh5fcwf8NeK/ASMxijit0t1LEsxxoQaOtXCqr5jcDiBWreLeZ6OmXfEOl1C4Q7oRiiorGDHWN6fK2A7tfIetkpEawovWYlvwXczpSLp4uMUDLrBRiSi1fF/XzGVzQfkPnU/Bbln/pYU04LOFMhI8FozS6KIELk/+tdVd9wO626GHruhYjXHXBro/63WP3ShUxxox062hrlGIwMFn6hi9PfhtbVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3246
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bfa2944b-b9c0-4020-8b7c-08d8403109bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1flVpGRNPv/IZJproUcwJ5GLfi4p/EOjwPAD2a8VgXXWBnDXCzfATBwotryFcsyuOmDAdsBSt9gbatL1A8SsYpR5rw9/33QC1xXCos4MB+4PwcRpa7z5E/YZ+dea43zCnq4u9XotllwUK6ViFxWSeO9gXMLp5wlyfzHivpV+zk/dCt08psQYvx7hW1F13CaGwti1J3I0Fn6m8v/l8aTLvb1YmDihLnZhv1dz4UAVYKLQBHoN/teAlL2ckrvVW0fOnSlr7w/cAY7ZizzbYCzhLcLzmSTz2d72iikpkVByEREauPPfuHtDGVxWuQxzN91DqFs0c4XTomw43gOLYCAedle58MeZVLQoipkw1xcWV9OslNiQW1bmZ3EblltmelhWrvIqTaWnjq0yUZnZER47ug==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(70206006)(5660300002)(26005)(36906005)(186003)(36756003)(16526019)(316002)(7696005)(336012)(4326008)(70586007)(86362001)(6666004)(6916009)(1076003)(44832011)(356005)(6486002)(2906002)(47076004)(8936002)(82740400003)(956004)(8676002)(82310400002)(81166007)(2616005)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 09:04:31.6617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ca419b-2cdb-455c-0d66-08d840310eb4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5027
Content-Type: text/plain

For fvp-base, enable CONFIG_COMPILE_TEST to remove warning regarding
CONFIG_ARM_TIMER_SP804

For fvp-base-arm32, enable CONFIG_MODULES to remove warning regarding
CONFIG_SCSI_DEBUG

Change-Id: I02457ae2d50e03367d1ec3aeb3a0f1571c0f2b05
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../bsp/arm-platforms/fvp-arm32/fvp-features.cfg                 | 1 +
 .../arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
index f2164f7..42cd476 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
@@ -1,3 +1,4 @@
+CONFIG_MODULES=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXT4_FS=y
 CONFIG_BINFMT_SCRIPT=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
index 144977f..b33c65c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-timer.cfg
@@ -1,3 +1,4 @@
 # Dual timer module
+CONFIG_COMPILE_TEST=y
 CONFIG_ARM_TIMER_SP804=y
 CONFIG_CLK_SP810=y
-- 
2.17.1

