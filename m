Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.80])
 by mx.groups.io with SMTP id smtpd.web12.12218.1592810102456803845
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 00:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sxLEG2Eg;
 spf=pass (domain: arm.com, ip: 40.107.2.80, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF+umVWqjj4p1ImaIRnMS8HygJrY41s4HI32Vbn8Mww=;
 b=sxLEG2Eg/1WCHY3Zmqpo7NZPkWkUtm5L3r7PAYfMQ/Zcrd85WUo2U9IarsKq7FIYnEVsPKlHF3Mw/3M7WdgW7+XG/tkQ37+lhZjs2jQ7waHkN6S4sOdj1Pw5cswJX9W589P+2WpbVRcNarpjXx4O4JwD3DBhxB4IDHbXcwAhK6c=
Received: from AM6P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::29)
 by AM0PR08MB4451.eurprd08.prod.outlook.com (2603:10a6:208:142::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:14:59 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::af) by AM6P191CA0052.outlook.office365.com
 (2603:10a6:209:7f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 07:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:14:59 +0000
Received: ("Tessian outbound da41658aa5d4:v59"); Mon, 22 Jun 2020 07:14:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3bbec4cc9cb9fccd
X-CR-MTA-TID: 64aa7808
Received: from 823ea2d4758f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2831EAE1-D164-41EA-A786-D04EB442603F.1;
	Mon, 22 Jun 2020 07:14:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 823ea2d4758f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 07:14:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoXL9Fyd8WDAvrKgVnJgAtErEDtwhKbDZtX6kE7nhuA7vC2LQkjol8aXWG+H9wenPp/kpIE+U7LJP75jvew7MG7P+CrdVKyXlvrAq4pKlRdPw0eGnOSZxs2UtU32+wEw1wrjhXD/BM64WWwMRaygAezmZhC+c/SefSnry6pwzzSos9EaNpHKKLyIDkqz2waNQQupVMURnV/4owru8qCp95bV872IZwVnYwHAabTpwC8iUhzk+3oXYwnDTs02cWYM2j50QI42NlPL5rt66/GZlc94GubZsBBNDy649rxqL9UlGPGI2bG1QY/bKmX1xY5cCu9DNMU6aD3++yR3xnf2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF+umVWqjj4p1ImaIRnMS8HygJrY41s4HI32Vbn8Mww=;
 b=Aa/sRg6oPgFDf/+WIi//Rt47ArjflrThDqnr1oCDZw0ehMtn+GmAIawLdI5S9Oyau2DsQKDyC7UfmSL9emdKxg6ijrC6M8LNpu0ka/nWuwZEApGPgbZANuRXVMdB6UPzujA6u2t7vXi0bGjtnKH5T37kb9BQGPqtX+gYBWWLsTWEmjyNwHT9BIU5XVx0CdenS1mJ1ruY/UUI5QvgOwZ2ocW6eQaEmJJfzvK2p0GnuAOiyetZhhbGIL4xupkueyyiIzW7m06EOxA5de3XaZG0dNbD/Va7ioo6xW49J7vMCR2dzVW35umm6RjxzyVaqiyad4YKV+BtR87qg1i59mDvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF+umVWqjj4p1ImaIRnMS8HygJrY41s4HI32Vbn8Mww=;
 b=sxLEG2Eg/1WCHY3Zmqpo7NZPkWkUtm5L3r7PAYfMQ/Zcrd85WUo2U9IarsKq7FIYnEVsPKlHF3Mw/3M7WdgW7+XG/tkQ37+lhZjs2jQ7waHkN6S4sOdj1Pw5cswJX9W589P+2WpbVRcNarpjXx4O4JwD3DBhxB4IDHbXcwAhK6c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2288.eurprd08.prod.outlook.com
 (2603:10a6:800:a6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 07:14:51 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Mon, 22 Jun
 2020 07:14:51 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH 1/6] arm-toolchain: external-arm-toolchain: Rename
Date: Mon, 22 Jun 2020 09:13:56 +0200
Message-Id: <20200622071401.2570-2-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622071401.2570-1-gabor.abonyi@arm.com>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (217.140.99.251) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:14:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b88cb5b-0491-496f-b961-08d8167bf985
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:|AM0PR08MB4451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4451E63B40898A03CF8322208E970@AM0PR08MB4451.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LE86lJpsFrIxOfMpmtYgQJMROAU8waMd/X9OPL5Mnlhc6C2Ek2nl4WNP0c7A1YmKzmtBrVkQ6KkILXwivdLsOqbQQCEiqrutI3a+SJC6p6372OSmfBTU2dwLbVJ5BR5+xjtz1kUxYHPVI2kZ2xxe9QSd4oVVArdErADQknerg1j3HGEMiI38SBPFfaRwTFAA2N8ORJ5juPmoMRH1ajd8rblMA+0Xk58sA5H1fr9xjgtwnPxBUTl4/Koi8eoQc1GUfAUfvBDeWR8Oi1GK5Q7ykjw4iOGU5fBa/mppDlfxAMbDACRKfFU1sMb7YqU9sUfM3DRkGcwKLs8ZI4wFqoRaSA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(7696005)(2616005)(66946007)(66556008)(26005)(6916009)(66476007)(6666004)(956004)(6486002)(86362001)(2906002)(186003)(16526019)(44832011)(478600001)(36756003)(8936002)(316002)(52116002)(5660300002)(83380400001)(1076003)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 W/bPu/DShwy6rOpD47dfAeFpKuj9UQRdaSFNooO+anQpsyy2/jZfADGWMfU1vaUqtv6qmWHs+j4HjcN53UjuqrbsVMDdT4PxSDx+qU4NqMVurA6g11e08xsAQ8kmd7XPqaGPZ1VUyKvI97U/yuX5O+RJ33SgObZZj5AvRdqnKfiDoOUCXFx0OTBqJVsSH+o6JQM/1flKpmVF1Q84MX8ERqhc5M7O7qm9qNvB0jc3IpCSfPrNGT6zXVYmoC/4UWVrhOgaTLkBijNy5UUzf8yqjuodd5XEFzPvl7ZNsu3DJnhgPIXh0MVbcPtueGddhQy6CtxBnyoCw0iVbt0i0lEUxAq8Pu0ZTK8JAKGYcR58WfmdMzyRTNyNtYPAYPOh8vcDbOk8EMJJ7NVcppo5eZA0+3H+KFRG02obi1FqcPnOlt9x1TF9EDNoP0CowaiA1lmWAyiuibs5dNTIs2RIcM727AKDHmCIpA1Xn8dBk15w6/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966005)(8676002)(6486002)(83380400001)(5660300002)(7696005)(6916009)(70586007)(36756003)(70206006)(86362001)(81166007)(2906002)(316002)(82310400002)(478600001)(336012)(8936002)(36906005)(356005)(26005)(186003)(6666004)(47076004)(44832011)(1076003)(82740400003)(4326008)(956004)(16526019)(2616005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	43b5295c-59ae-4ce3-07da-08d8167bf490
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xnapvOQXNWLbG2p9gdxBls7gbyX/oO7HIWzOPvLd4diB2me4XCv1qwkyITAC3KIRn/Ifmrls1qQpKSczL2RWPkZLRXxujIj0RRbFccLSqfq1LPiKjHXYc1VnIKZEYwOJik8WUZ/RIrtkhaX/+HHsAyAyKkym3ZiLEZbgvsfPiowFO59y6hj4VXkGN3Jqy74V11somKX7865CzgvcMUV+sC5IWYYZg3m7UcFD6Rbm/I2MLwG2mI69PNVuIjQ7nyYUCTcLTUzImD1HWQpOXO7JxwnETtxr3TVGsPjCwxusp5E4h4ZRWHVKpBFMyJHZeWrKSxcHv+sVxdimMB2iv4qvTZmPXXDri7cbVBkfBD/I90mIGjMsk4HDjVqiWjwNp7alrtu6spJNJFMnrbee4BLyKQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:14:59.5444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b88cb5b-0491-496f-b961-08d8167bf985
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4451
Content-Type: text/plain

Rename common external-arm-toolchain file, so it can be used by non-gcc
external toolchains too.

Change-Id: I48345dc53bc3d20f33b44fc0224b511f30107036
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 .../{gcc-x86host.inc => external-arm-toolchain-x86host.inc}     | 0
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 +-
 .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-x86host.inc => external-arm-toolchain-x86host.inc} (100%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-x86host.inc
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain-x86host.inc
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 91daf08..a45fee0 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2020 Texas Instruments Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-require gcc-x86host.inc
+require external-arm-toolchain-x86host.inc
 
 SUMMARY = "Baremetal GCC for Aarch64 processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index a36f0aa..6403fe1 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-require gcc-x86host.inc
+require external-arm-toolchain-x86host.inc
 
 SUMMARY = "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-- 
2.17.1

