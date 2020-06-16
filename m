Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.47])
 by mx.groups.io with SMTP id smtpd.web10.481.1592326611556090170
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 09:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dd60vNNc;
 spf=pass (domain: arm.com, ip: 40.107.7.47, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbE/J1hIzfBMMu/pUTTmPZUeGqJeokgpVk0Ypif1c9E=;
 b=dd60vNNcYJbC0/cWLyT0pHrCG/+Cppy27ih6aXxWvEgqvEzcmrdyX+c8Kkjlm2vmYGcI18FNlfdb0ioD5QhO7plEB0CUOGM6XNIqwWoohPQV3XSQ6cctD+pykz9YNTGYTb7avAKBlaEaGM/LSktcUZPdRapTFDzt4AixWxegajM=
Received: from MR2P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::18) by
 AM4PR0802MB2339.eurprd08.prod.outlook.com (2603:10a6:200:64::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Tue, 16 Jun
 2020 16:56:48 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::90) by MR2P264CA0030.outlook.office365.com
 (2603:10a6:500::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Tue, 16 Jun 2020 16:56:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Tue, 16 Jun 2020 16:56:48 +0000
Received: ("Tessian outbound e66f203c6c7a:v59"); Tue, 16 Jun 2020 16:56:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ddfec1cb271be414
X-CR-MTA-TID: 64aa7808
Received: from 689001a20b22.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AB341834-AE77-4766-B3D0-232EBE12B132.1;
	Tue, 16 Jun 2020 16:56:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 689001a20b22.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Jun 2020 16:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EU7uh/sQQFX0NLG6AenO+1vQCHW1VlKXCwqaDW4YeJZf3E1iQ8EJHwm12HvA+xcEUnxmVrJQpD58LsY6YjjS6eRGJZSe555zpYagElc5L76N/MST3TKMSEzQf8kj4ElDHJAHsnjojOPMDdRfpyXCytiA3Iir0xSBS4PyXRGAnP/mg4L/e+blgs9CtccyXLcplF7fdqCCllVOauwxNoYGRCRJEEjJf1ZAPRRgAVuVSj4O9vfaAmH0jinrAl6JCpT+XSUYHiC/5wBMRWl97DNBcL/RM3/yUrhAMJv01EJ0D2+B5khYvRh+t1tUK3XPj0lzyvwXfXYhrGuIITOoSIziVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbE/J1hIzfBMMu/pUTTmPZUeGqJeokgpVk0Ypif1c9E=;
 b=lq0MMumBCvnXXrtpF7Stqov8yT7SvfV5edQCKWQpvzbdwFOvGMHXmYX5YpBYIk/7oLk6tyOT+FYVYThS33xs4XFLyJ9dga6fBgen4WvEcH7a+jYrMyF7pFMsZw4v1k/zMtfCV7/DlyvqXq96Siiug8YZ/CARBDZDNyo911DGhLhg2oEf68vDrjf42sAvLhH+bwumGaB6VxODmxUiuAdBBjEGVTRP9e6Z2zc0m5WmQwEFBT2WNk0vNQ5dT2pMoQd3fTgbY2mx8IsZ5Q6lbV9RH0YGqEd2K/SKRNqF3hKxoNSgoB3cN3dXt/c0P6aqsJ7CwNrAhdjfg7HHpaMb6ojTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbE/J1hIzfBMMu/pUTTmPZUeGqJeokgpVk0Ypif1c9E=;
 b=dd60vNNcYJbC0/cWLyT0pHrCG/+Cppy27ih6aXxWvEgqvEzcmrdyX+c8Kkjlm2vmYGcI18FNlfdb0ioD5QhO7plEB0CUOGM6XNIqwWoohPQV3XSQ6cctD+pykz9YNTGYTb7avAKBlaEaGM/LSktcUZPdRapTFDzt4AixWxegajM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5291.eurprd08.prod.outlook.com (2603:10a6:10:ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Tue, 16 Jun
 2020 16:56:40 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 16:56:40 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-bsp/edk2-firmware: fix destsuffix and PV for recursion error
Date: Tue, 16 Jun 2020 22:26:28 +0530
Message-Id: <20200616165628.31305-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::23) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Tue, 16 Jun 2020 16:56:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1c88a16-19b4-4559-47c5-08d812164239
X-MS-TrafficTypeDiagnostic: DB8PR08MB5291:|AM4PR0802MB2339:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2339615F0A5989D54094731BFA9D0@AM4PR0802MB2339.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:369;OLM:369;
X-Forefront-PRVS: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6XlJ+HYcw6ps3xrRt/bmjT4/5irMtjj/lpJx3/+eQtbtCUPXSHgaVwR4AEnbyNa4eBAQbc0O/SjpjugADGuPmAyZu4S9C5zoVBvSsbtDkXEraW2Cr9XT6vRtnvC4yIf4xEJJsSymyO44cKy5QBQsse/hnvOGMzriX5NrBvnyt7FeqH/8Mvt+1u+GKrep5ngWndKEWTL+OL/nHTKhjWRygEJ+JbPCU1S9/cWCzuh7Yw8Ue5DueLF6Yfdqh0t1hIm+ZHFuWOQWUMLtR/dJ2lGSb74fSaIoMDu4FUzEa4sZM6tbGKM3eZZIIoy/S/LIk4XQWcyIw6/AUJEoUwkYsoL5Ew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(36756003)(8936002)(6666004)(6486002)(1076003)(316002)(86362001)(8676002)(16526019)(186003)(66556008)(2906002)(54906003)(26005)(7696005)(6916009)(2616005)(83380400001)(5660300002)(956004)(66476007)(66946007)(4326008)(478600001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 jrxCKeFQ/1xq0MC66FqR8ChWR0fcrBpa5hEqv/j7A4DNtBUsAkT7ht9kUGnS5gSrYOg22gthSuZc9o0q0brc4FW0ETHxtsMtc78oKA78lBMjGNTHyCog//Mpkz7mAVXbfSW1WMNFLRGeYR4B9f5crFUX9nTagWTFR01O3mYeu8Ja411wU/dnjH/QWKfWAbjhWtig8Op3rHTNkSurl10Q9KBdQ+5qppJVJvMmesvitf9c5HQYM0YZbVFjKEs/rNuTC3g//3JekRBUid6flwlXME4op7mCnrUoN/sw5oC6OwojNC3Br4kgs0MZl6b8B3qQX7K070cc3Mrci2WZ7F3FL1sf1Qh5sxMUqGQZueJEV1wOZwavTesmOklW4JGlxU06mQ6jTRB2Yf+OwW1XvSWCyThAqvkQexVE16WI0jqYFOVZVQk0+NcDDoBladglri4xO/jKffMDZIH1ZRueHPR2W3kKTpm8ordaLdMji08lOnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5291
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966005)(6916009)(82740400003)(83380400001)(47076004)(356005)(81166007)(70206006)(6486002)(70586007)(86362001)(82310400002)(2906002)(5660300002)(26005)(54906003)(2616005)(956004)(7696005)(316002)(36906005)(336012)(1076003)(6666004)(36756003)(478600001)(186003)(8676002)(16526019)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4d1ade7b-890d-4bad-e93a-08d812163d37
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UEvIMKDwc1Mn6H887rIgMOmY5cf2KrrL5DMQDh92Ya26UXLuuDaaBcZqY1CIKUCXmDKzH14kY2Uee4Ae+z6Oub99lCsoocLPEgcJfhYPJXDqTFMXI07i0a9Yi+MqN/TeCoh29JC85SbUzsQvsQuK5z1d6UnMw2Gl2rdr4EhYuJedXIsM5QHnxjeQP9KBb/kfCGC/ugDRl6cK7m/mWDZkMpfiodUdhZfSIGmTY37hkd7VD7XXdvc5Jzq+lnU4TJANb4h1H2T14+LlfdoPt9juR/oow+TRgY2xwn5pTchzO4c72TJ4sV7Z/g5+drtUylH+uAbLNS+3/AlaH+JVqFP5MXccYsovm3QFhG06DbN/VOI2KNNWMUSp7SZRbtSZx/Hjlj/pbE+HHLAApa3uJqdnzQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 16:56:48.1406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c88a16-19b4-4559-47c5-08d812164239
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2339
Content-Type: text/plain

Use relative paths in destsuffix as the paths are relative
to ${WORKDIR} and turn the existing PV ?= into PV =

Change-Id: Ib9367a15dde611e5b74c11eeff330d0b5a3de75d
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index c8fc70a..a4c8e33 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,6 +1,6 @@
 SRC_URI = "\
-    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1 \
-    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1 \
+    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=git/edk2;nobranch=1 \
+    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=git/edk2/edk2-platforms;nobranch=1 \
 "
 
 # TAGS and commit ID as per N1SDP-2020.03.26 release
-- 
2.17.1

