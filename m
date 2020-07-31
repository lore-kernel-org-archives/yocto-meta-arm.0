Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.42])
 by mx.groups.io with SMTP id smtpd.web10.17478.1596199254351647092
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 05:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6bzz+Ltx;
 spf=pass (domain: arm.com, ip: 40.107.21.42, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2P4eOJ8ezSUoX5S/EdO2gJjpJtJUNBtgfGLc/uaIoU=;
 b=6bzz+LtxWu5CRCIJmymoc7gBGLVQkNmq1lphqWgjYQCvoiFQvF/hcy9cOhlee9hyIDxDj23Oacb7QBH0AQ9cjB7V2A+rqHSMuWReKIF68rZVYq+LZUk0n5aRi1s6MReIjBy8NrBdVELtj3Tk0yyQlSA6eb85wsyTd8fg1y5q7sY=
Received: from DB8PR06CA0038.eurprd06.prod.outlook.com (2603:10a6:10:120::12)
 by VI1PR0802MB2350.eurprd08.prod.outlook.com (2603:10a6:800:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 12:40:51 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::9d) by DB8PR06CA0038.outlook.office365.com
 (2603:10a6:10:120::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 12:40:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 12:40:50 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Fri, 31 Jul 2020 12:40:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a39a1532214ecabd
X-CR-MTA-TID: 64aa7808
Received: from c5b26709ae61.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 920DF9A1-B0E7-4968-8B1B-B7801F3B3E84.1;
	Fri, 31 Jul 2020 12:40:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5b26709ae61.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Jul 2020 12:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKdBszGpjt/yeUO2Pr0FlrYEz/WRKQ7oCJE8RoEE0dHKDmpAW00DIfOPuR5NUubFs9n2VPmuhurM+hurT+8zSa+EbPWtgjwYO9Drxe393q0TcF8azTrqgZK4bgBj83ociqvf7rJ6+RduSN2Z4OvzYUtPeBbrLneI1Hp+4xzKXVTk16zCn+0Iiy5OkDTqShCxzISuZFoEMk+zaCc4ac7W34PVNTmp1lyqbRQgsmBne+GJ9jH6153pCrwDQMmIYZZtSR1feOSXJIPAZSqEHruochE/1k9YT9SEaPuOevd9tif24+tE3DKhJgFOAsrdj70/YADa6+aXCDF+vMa5pFiKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2P4eOJ8ezSUoX5S/EdO2gJjpJtJUNBtgfGLc/uaIoU=;
 b=XVw4Wc4q78xqzeN0scDfCS6Ux2ybOoYMB5CO/2JHmWXTj3mCeeW036gEf+t0DZm0i8csSe3hYZqyaw1ae/rONDdaXibz8pE3hOq0bOSGaofKgTl5WUNeGidBuoC+X40t4/wcRFqR7loG5AcAjqo3RiHJeNJfXXg/tYhTyIoJiE43Iax3UFWbGKxFjtBJwI6ajhPPe4ytccLVkYZI18avN9Ow8gkMdTrF5W9+2KAySHJaRZZzsUHT3O1EZN7nxxULaAOEnEjAdrx3IiEAIqpzsmN7TRma9xO9/DSFuzznGF2QHo1Qye84EyuqRVAXMrt+17itbMKB1I85aP7hz4tfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2P4eOJ8ezSUoX5S/EdO2gJjpJtJUNBtgfGLc/uaIoU=;
 b=6bzz+LtxWu5CRCIJmymoc7gBGLVQkNmq1lphqWgjYQCvoiFQvF/hcy9cOhlee9hyIDxDj23Oacb7QBH0AQ9cjB7V2A+rqHSMuWReKIF68rZVYq+LZUk0n5aRi1s6MReIjBy8NrBdVELtj3Tk0yyQlSA6eb85wsyTd8fg1y5q7sY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 12:40:40 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 12:40:40 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: remove redundant entry
Date: Fri, 31 Jul 2020 08:40:33 -0400
Message-Id: <20200731124033.15497-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0093.namprd05.prod.outlook.com
 (2603:10b6:803:22::31) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.110.7) by SN4PR0501CA0093.namprd05.prod.outlook.com (2603:10b6:803:22::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.10 via Frontend Transport; Fri, 31 Jul 2020 12:40:38 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 31 Jul 2020 08:40:33 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.110.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57ace655-5070-4006-f213-08d8354ef508
X-MS-TrafficTypeDiagnostic: AM0PR08MB3778:|VI1PR0802MB2350:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB23506D9368FAC59883497D05F04E0@VI1PR0802MB2350.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:102;OLM:102;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pf94la/e2v8h2Juj6JL2DabeJGYnwY2lVTUquqHMP4KdunrCpH62ysRHNCo/jwuYnXbG+XdhvH9GcXzcWMEfc33g+JINStTd+FU+pNKyILbNff0Im+VuDpjsQfaTwfU00k0nsxUeclUdtbCzJHsOZ2LjTX1isRiMu89Kvu6QEOJd8JwB3SrR6CrxxGd6zDyaHafO4ylDBu9c0dVKcIuyMW3OtHiN9JCQ1gjw1rs33uo+/1cxGqynjgZbUEKhb6WP6BFcdhHOkcuRncu15bKsjPsunyYmhl3qp1BPZBVoeUksE0ui2/8qsUcX42kUaSQ15nehXxjqeYaAtjiX1u/EIA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(478600001)(186003)(2616005)(4744005)(316002)(42186006)(44832011)(6916009)(8676002)(426003)(26005)(36756003)(8936002)(4326008)(52116002)(1076003)(83380400001)(5660300002)(86362001)(66556008)(2906002)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 VBfhcdTJDZ8kglDz3KJnrQT4+qp+L63HQFQzd8Wuc6P/TaQ0ZcWInHyYVAyVjdWbE19dP4GZFKNsOusn7gEyZ2N58KijVsHd28cE9rRC5TWYE/j5PpRW6i5AjkOVaSUC6cu60rUGjphgROlzPk2SSpMmMr97PbLGz4DVjQnWMUtzWkL72eSR9mZ2p9zYWgvA4UAKXF2PArZJR5R4lv31ilcemvmZcBIf6xrk/Ify9napfqpyPbbqOno9rc/+NgFuPHjGWWtJtpAvt6anUGWTUcjB647GG59a6RO6NpwO5o68m+Q7a8Ub/g8ZOFAgwqEFn7FoHlAxwvPk6NFLKRpQxPbKz5G6C/AZXXmSxaONpNgXaOl3+YyBtvwP167ObL/upRIKZTfV3fU0CBQELh/Y5lYgD2Gbwekh+qa2Ah4EQbGQmOtyjPEVSjtOq1/7Cik5cwRDTthB12jrlI4iu2QpfXBbVkmKysE30Bat70C2YVetOzBFq32t9q1kKDXSPoc/hq5cAeIfbh4QoNwtU4PknDG8b+DfOaQSB+k8Ah/33aJnnJC9zZ7sILKqTNM1PD7IK1E9AZ1tNZiqh3A15N8yP37/dGUriXyT19fSqE8xsmxTluqu+vSJZqsbJJytZSlHC731u7mRs4EN7Zo7mK/UuA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3778
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b4df0cf9-2211-417a-5efb-08d8354eee11
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fbnP7K/FGThOcR8UG4mPHw/fcSjCN1zGNCI0d8n3FhKqAsMOLpjDf7CcFBfVR4/ZOLURm9w3rvfezz6aSWlJxpgeCDyNg4jeXX3sDvphMkazae5dxK732EqYzncqSTdOK+03bH58qOu0FnAeHxDheHY7upNsoSaqi0/0w0RWlkkhqqAXu6ARzZUpvFoh+cXcLykkmSU5duX1Clo4AVYJhPiADvgS4kV6EICf6BRUgGW4imFwx7j9DnCrVRWM9KA2JKE3vqOsVYz+tNElTtczd+zP/ojEHpU+Y9vay01+YKZKubHjOOsVNS8LRMTW4DdCVkQlkdCsRnOFTDseodAJ3ozm7x6kNvpDS8fIln4CQLKSwIgdS+ZH2G1DWuf92Ota0cuwAcKJUNbELGkG5ImgKQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(42186006)(8676002)(336012)(316002)(8936002)(36756003)(47076004)(70206006)(82740400003)(82310400002)(26005)(186003)(4326008)(83380400001)(86362001)(426003)(70586007)(1076003)(478600001)(2616005)(4744005)(81166007)(6916009)(356005)(5660300002)(44832011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 12:40:50.7590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ace655-5070-4006-f213-08d8354ef508
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2350
Content-Type: text/plain

Change-Id: I096c238ceec9244a130c1c5d7e30fc0dbc98997d
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/a5ds.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
index e7180e9..f7d35e7 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -16,8 +16,6 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 IMAGE_FSTYPES += "tar.bz2 cpio.gz"
 
-EXTRA_IMAGEDEPENDS += "u-boot"
-
 # Cortex-a5 u-boot configuration
 UBOOT_MACHINE = "designstart_ca5_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
-- 
2.17.1

