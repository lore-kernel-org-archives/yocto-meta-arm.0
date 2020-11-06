Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.83])
 by mx.groups.io with SMTP id smtpd.web09.12298.1604672440146806881
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Nov 2020 06:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IrJDt65+;
 spf=pass (domain: arm.com, ip: 40.107.0.83, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKfIODdoCouDCKOQZy30qmvt6Fq1/LUf+uIU6x0MJ8c=;
 b=IrJDt65+gY7tGhHNnxto+FUe65kDUC2oolrqW1MqCgW+4KBHmT5JWpS6y6xnSjD7IplpRypd10TMc1+/mbShLHlu7Oq/RhqlxrAxLR2gXAVxsrflJf2SHpNXMVVzG6/FKU8CN78MYTcbPXthFLh+ldfmXOztKkc2rLcksL8P0Ts=
Received: from AM5PR0601CA0028.eurprd06.prod.outlook.com
 (2603:10a6:203:68::14) by AM0PR08MB3554.eurprd08.prod.outlook.com
 (2603:10a6:208:e3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Fri, 6 Nov
 2020 14:20:37 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::20) by AM5PR0601CA0028.outlook.office365.com
 (2603:10a6:203:68::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 6 Nov 2020 14:20:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Fri, 6 Nov 2020 14:20:37 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Fri, 06 Nov 2020 14:20:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56963b102517f5de
X-CR-MTA-TID: 64aa7808
Received: from 004133bc2947.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 50DE5FA7-5861-4FF4-BBA0-6841BAF2C37A.1;
	Fri, 06 Nov 2020 14:20:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 004133bc2947.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 Nov 2020 14:20:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5BQkvT3mW/vv74eKE9+4fnySyOr8qA3yTEuwo8Djr54Nyz8ECMMaaqle+2sYAL370c0/raiObqz9MLfOzA7PN17axHvvS1fEY24WmE5pePQPWmRGaHo/jyNnuI583iuVBlfLrepcpjt2VnsA0WdOTSH1P+5ZaSyhDVWfK9PcV3X3J6uJ4YNBDFnjuIgXLlmzGns/Z9gePu2rYM40RD71DyChX+Y+jkCxn8OYESiqglgkLCdH3OVn93FxnEul56bYlFxOReY2zJOUcBFIBXG+3FAk9LPUzETXpm8seMQk60xaVTh1HGr+pVe1Yg+MFUYcNZNPtNj2G9yKAvln+vueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKfIODdoCouDCKOQZy30qmvt6Fq1/LUf+uIU6x0MJ8c=;
 b=H5WrUtpBKeuLDGb9KC1uvaw4oXKOqo5SSV73VU7smh8LpD8Jph9+sgQDFKmLzYnm8ESeVqfEph/9g2Oc15qiCH7TCZvu3bOMI7xLw+5AScecfy4HL9O/8bw/qTUrIyPLf8QpMryAIAEwDG1c07LpWSLUzWJJTfbogOa1Wd8HJpSVB+Bb8OGjwgXzT9k2FYsgY5vcz8j0fzcGWqm6nYP4Aa5WpUW1Pb2OUM8A4qwPsXTNkR8yszKu3YUNxPbkv9zQ05SWErOV3Cs3/Mg74h8EqaK4Ez5GEhlJt/zG94KcfB+yVFyc+6gq7xzm0lllGWaUh1S8gzR1WgDtbWObRfED2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKfIODdoCouDCKOQZy30qmvt6Fq1/LUf+uIU6x0MJ8c=;
 b=IrJDt65+gY7tGhHNnxto+FUe65kDUC2oolrqW1MqCgW+4KBHmT5JWpS6y6xnSjD7IplpRypd10TMc1+/mbShLHlu7Oq/RhqlxrAxLR2gXAVxsrflJf2SHpNXMVVzG6/FKU8CN78MYTcbPXthFLh+ldfmXOztKkc2rLcksL8P0Ts=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5525.eurprd08.prod.outlook.com (2603:10a6:20b:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 6 Nov
 2020 14:20:27 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 14:20:27 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH 2/2] arm-bsp/firmware-image-juno: update offest addresses for NOR flash images
Date: Fri,  6 Nov 2020 14:18:59 +0000
Message-Id: <9689f46db71ac67f07f45250d31b575e7c1d0de7.1604672207.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <80b1626dd2d1f10caf155a533b858c0ef5a663ba.1604672207.git.diego.sueiro@arm.com>
References: <80b1626dd2d1f10caf155a533b858c0ef5a663ba.1604672207.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.28 via Frontend Transport; Fri, 6 Nov 2020 14:20:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 733372d6-8d96-41d8-ce27-08d8825f21fc
X-MS-TrafficTypeDiagnostic: AM7PR08MB5525:|AM0PR08MB3554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3554D184EA02BBD9DFDD34F492ED0@AM0PR08MB3554.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 48l5hbCvs80W5C8pMarwArKTKvxs3PU/gVghE0sJmo5R41ubqwQ3eY9bCmE1lynSeTNyr3bxTS9SiLpIdRdOJdqEnrlSMLXwypx+ZLMRiOAkUB39T4ULGHVmy4pzVqbSm3s8Lvu755oHgqt9PzCpLIVc75p4ig7HoUiZE72ohG9+ovzXPsGbFYRAm+/mRi0+cEMnq3mD2tkiPv4Yc/T2RZ2rU7uFB/VRqtc2YvhmWLTOHU/xns+Jp+Xd2h7zznZBbxBRHwQKaoWhWzZFJqDtFWoeVObsha5w20RtngOnhLNm0G/e1c+rp3W7UpQMcHrm
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(39840400004)(376002)(2616005)(44832011)(52116002)(2906002)(36756003)(83380400001)(186003)(16526019)(26005)(6916009)(5660300002)(8936002)(478600001)(7696005)(8676002)(66946007)(956004)(6486002)(316002)(15650500001)(6666004)(86362001)(4326008)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 vvh24uylODZpCdM9RaJ/K5ZrPVxiObXJzR8Ugg3ruIbWfDX2yKH6rfjAfB6FdFjG1m+XPRoyOfkm5E7jjPAwZRPLuszsXEixtViLNE1tC05s3qb5+BJ6JyMdKDm5A5tTiftiKh7j28mskKCmGnZny0EC7vyP+xznJnIZNbgyyx/nEJrlRRhy3LvGSp4UflmGyldpQCz682bSZtnJjAS1Vwuk5iUBTPayh2eFUxtRXK+DaP5Wq6fJKjfen3Uy8UZ5PsSjS2wFYC0Nf7m5yUkOoSJiVOoFXR2ircCIk2vuFMtN3wf+O0iX5/3V/MmpC28UWipSlfFxAAeH90MkXctvpfMJxvXHAHu7L+Rl/pssQyQNMaNG+Kls49aVfDSJL3m9jH+dGnlP0nqnR5o9N3JNOByqj9SX4Dwr3Hvj2rEpa/NWNwYpKvNvSlM/XOYWCe/zNkZsTvVMkZeqg3vZD+SVIHQeO6PXk7hwoFCRZHRpdRnah6WkU6zps+eqmnT0+Mjz9uFOKoPp/gLPYPGU9MeNecqRyIX5eqEslPOqijlmaaCEkMOKvAfS7oFHuNTO3MrBO7sf/5h3EIWRxjXmQhOo5jGpLmTJWxQDPO139hzhpuK9gWIDYAPdMjjwKI9b15EF4W8P00P8Sh47VfN2y4UXvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5525
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2ab4fee5-4623-458b-70e0-08d8825f1bb3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lmKENwFJorUdTblHNZ82l7iTR2GJyGCcO+j/aHsmdzy796HzOSEdst3up9C5KvXH6yXp239nI+UH5KY1IENIxiWpjwMJH7348qCfVrbBnh01XCpTtH5rebOgWjYod2avpgmei0admBZIFy8Yv9yfGjhZqqwhVchNMDok1NRowGiSStCiEkbvJ7FRqRZVViP+Uk/CvYPY4Yq+epCed4xsX5pl2KU619OXLVqQyq42xqLePTn6W+MSiUjJV84h7XCzZrpgo+fRbGWXoLPFqyLvBn4SlBGTaKrGx8qWiTvmUk8+hlw8UEM4tWk/lgHozj2/pKl2RObPefchubgVw8OfCon24pqnu4+ZXw6K7mzqdt2C10wDm6OD8JAvEQCnxQSAhYZcETkfWE9lITa+hPL6Aw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(46966005)(44832011)(70206006)(6916009)(356005)(8936002)(336012)(4326008)(2616005)(8676002)(82310400003)(5660300002)(956004)(81166007)(70586007)(6486002)(186003)(86362001)(47076004)(16526019)(2906002)(26005)(6666004)(316002)(36906005)(7696005)(83380400001)(478600001)(15650500001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 14:20:37.5845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733372d6-8d96-41d8-ce27-08d8825f21fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3554
Content-Type: text/plain

From: Damodar Santhapuri <damodar.santhapuri@arm.com>

After migrating kernel vesion to >= 5.4, Image size has been increased
to >35MB . It causes the NOR flash memory corruption.This issue got
fixed by updating NOR flash offeset of effected images .

Change-Id: Ia635fd9d91724d8255866b9f19f1ec2d42a62d2e
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 .../recipes-bsp/images/firmware-image-juno/images-r0.txt       |  8 ++++----
 .../recipes-bsp/images/firmware-image-juno/images-r1.txt       |  8 ++++----
 .../recipes-bsp/images/firmware-image-juno/images-r2.txt       |  8 ++++----
 meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt   | 10 +++++-----
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
index 286dac7..f6ac533 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
@@ -23,14 +23,14 @@ NOR2LOAD: 00000000               ;Image Load Address
 NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
+NOR3ADDRESS: 0x02900000          ;Image Flash Address
 NOR3FILE: \SOFTWARE\juno.dtb     ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 
 NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x025C0000          ;Image Flash Address
+NOR4ADDRESS: 0x029C0000          ;Image Flash Address
 NOR4FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
 NOR4LOAD: 00000000               ;Image Load Address
 NOR4ENTRY: 00000000              ;Image Entry Point
@@ -56,13 +56,13 @@ NOR7LOAD: 00000000               ;Image Load Address
 NOR7ENTRY: 00000000              ;Image Entry Point
 
 NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x02600000          ;Image Flash Address
+NOR8ADDRESS: 0x02A00000          ;Image Flash Address
 NOR8FILE: \SOFTWARE\selftest     ;Image File Name
 NOR8LOAD: 00000000               ;Image Load Address
 NOR8ENTRY: 00000000              ;Image Entry Point
 
 NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02780000          ;Image Flash Address
+NOR9ADDRESS: 0x02A80000          ;Image Flash Address
 NOR9NAME: uEnv.txt
 NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
 NOR9LOAD: 00000000               ;Image Load Address
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
index f84caaf..a6291da 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
@@ -23,14 +23,14 @@ NOR2LOAD: 00000000               ;Image Load Address
 NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
+NOR3ADDRESS: 0x02900000          ;Image Flash Address
 NOR3FILE: \SOFTWARE\juno-r1.dtb  ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 
 NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x025C0000          ;Image Flash Address
+NOR4ADDRESS: 0x029C0000          ;Image Flash Address
 NOR4FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
 NOR4LOAD: 00000000               ;Image Load Address
 NOR4ENTRY: 00000000              ;Image Entry Point
@@ -56,13 +56,13 @@ NOR7LOAD: 00000000               ;Image Load Address
 NOR7ENTRY: 00000000              ;Image Entry Point
 
 NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x02600000          ;Image Flash Address
+NOR8ADDRESS: 0x02A00000          ;Image Flash Address
 NOR8FILE: \SOFTWARE\selftest     ;Image File Name
 NOR8LOAD: 00000000               ;Image Load Address
 NOR8ENTRY: 00000000              ;Image Entry Point
 
 NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02780000          ;Image Flash Address
+NOR9ADDRESS: 0x02A80000          ;Image Flash Address
 NOR9NAME: uEnv.txt
 NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
 NOR9LOAD: 00000000               ;Image Load Address
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
index 149e0c4..16a6a5f 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
@@ -23,14 +23,14 @@ NOR2LOAD: 00000000               ;Image Load Address
 NOR2ENTRY: 00000000              ;Image Entry Point
 
 NOR3UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR3ADDRESS: 0x02700000          ;Image Flash Address
+NOR3ADDRESS: 0x02900000          ;Image Flash Address
 NOR3FILE: \SOFTWARE\juno-r2.dtb  ;Image File Name
 NOR3NAME: board.dtb              ;Specify target filename to preserve file extension
 NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 
 NOR4UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR4ADDRESS: 0x025C0000          ;Image Flash Address
+NOR4ADDRESS: 0x029C0000          ;Image Flash Address
 NOR4FILE: \SOFTWARE\hdlcdclk.dat ;Image File Name
 NOR4LOAD: 00000000               ;Image Load Address
 NOR4ENTRY: 00000000              ;Image Entry Point
@@ -56,13 +56,13 @@ NOR7LOAD: 00000000               ;Image Load Address
 NOR7ENTRY: 00000000              ;Image Entry Point
 
 NOR8UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR8ADDRESS: 0x02600000          ;Image Flash Address
+NOR8ADDRESS: 0x02A00000          ;Image Flash Address
 NOR8FILE: \SOFTWARE\selftest     ;Image File Name
 NOR8LOAD: 00000000               ;Image Load Address
 NOR8ENTRY: 00000000              ;Image Entry Point
 
 NOR9UPDATE: AUTO                 ;Image Update:NONE/AUTO/FORCE
-NOR9ADDRESS: 0x02780000          ;Image Flash Address
+NOR9ADDRESS: 0x02A80000          ;Image Flash Address
 NOR9NAME: uEnv.txt
 NOR9FILE: \SOFTWARE\uEnv.txt     ;Image File Name
 NOR9LOAD: 00000000               ;Image Load Address
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
index 93eb5fb..77c02e3 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
@@ -1,11 +1,11 @@
 uenvcmd=run mybootcmd
 mybootcmd=echo Loading custom boot command; \
 echo Loading kernel; \
-afs load ${kernel_name} ${kernel_addr} ; \
-if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kernel_name}; afs load ${kernel_alt_name} ${kernel_addr}; fi; \
+afs load ${kernel_name} ${kernel_addr_r} ; \
+if test $? -eq 1; then echo Loading ${kernel_alt_name} instead of ${kernel_name}; afs load ${kernel_alt_name} ${kernel_addr_r}; fi; \
 echo Loading device tree; \
-afs load  ${fdtfile} ${fdt_addr}; \
+afs load  ${fdtfile} ${fdt_addr_r}; \
 if test $? -eq 1; then echo Loading ${fdt_alt_name} instead of ${fdtfile}; \
-afs load ${fdt_alt_name} ${fdt_addr}; fi; fdt addr ${fdt_addr}; fdt resize; \
-booti ${kernel_addr} - ${fdt_addr};
+afs load ${fdt_alt_name} ${fdt_addr_r}; fi; fdt addr ${fdt_addr_r}; fdt resize; \
+booti ${kernel_addr_r} - ${fdt_addr_r};
 
-- 
2.7.4

