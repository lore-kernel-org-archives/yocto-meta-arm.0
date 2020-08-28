Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.79])
 by mx.groups.io with SMTP id smtpd.web12.40693.1598613770577364683
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Aug 2020 04:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ot4k9KAV;
 spf=pass (domain: arm.com, ip: 40.107.1.79, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr/S5KH14nW9YjQS9vBqmuQ//ut+Q40Uwh2ovc5Wd1g=;
 b=Ot4k9KAVizUTRUW1arT+YKaN786S+qxzJLtmppPxHmFBexmK3SjMj4M2qzM8SkCY7CqMITM1MqFyk1gGB2wquIPVtsmVHMdS6AQj0FEK0Ii7x1N+KJwYEaU0DTmM2/iwsZvG0Tqw7ya3k/OuomMNmBkGwqr7I37HC0dAm+JwN8Y=
Received: from AM6PR10CA0099.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::40)
 by DBBPR08MB4363.eurprd08.prod.outlook.com (2603:10a6:10:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 28 Aug
 2020 11:22:47 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::e2) by AM6PR10CA0099.outlook.office365.com
 (2603:10a6:209:8c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Fri, 28 Aug 2020 11:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 11:22:46 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Fri, 28 Aug 2020 11:22:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0885025e2d21758
X-CR-MTA-TID: 64aa7808
Received: from dee2c1de9392.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7902ED51-B713-4186-882D-32C3AFDA7E83.1;
	Fri, 28 Aug 2020 11:22:09 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dee2c1de9392.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Aug 2020 11:22:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAJKilWuDSCr3T7T63Kx/uDO0kIHwwN97R9B29HXK0lOgvM5MX2Cak63aylsf/7eSu+eWopK7g4lHteM2vRh0DpyYrT/IJIPCWvioeiY+wGPyWzgREW41Ea6D4GJbf+5YlXG7KJAYob06WlL+mw4tuKIUVQpxyiRb95fdmRXFouZs3c7dOTopz/Yd/l5j0G9YUZzlwz4kz/uocmEkWseVjfka6kgDwjmPwyBcxRJMBNrUYrIQBu3xO8UIcgJaOEPQnSSAzrNGCALBKvsWvNHz7HvkYa/Rz41ZqI4f/zX1Afk9A3CCLuB3TatkFT0GuCoVXOj0O73VTlbFOe6NnkfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr/S5KH14nW9YjQS9vBqmuQ//ut+Q40Uwh2ovc5Wd1g=;
 b=fRPyiyh2lKZa9T2vEEpbGP/Cad7cxuF2dg1djDbdO8dGlHm3/Bp1Eqt0nKzA81D6LSYuLW1A9kGdG137WK0ATpT85vogN4lhXT0uu28HJ4OOyKbaNz6IRGs34geTtyOlleHaeYWZf4xHfnQyD6MAwCMeMl1WbmgcxQ8qc2LWcZfVC2np4fU1kMaMtZlBXA6Nj+exEmW8FYIC//OgK/amnks5judfld6SlSDgj+9AxEjv78nRntKAOMkNb8U7P6QT1JqWgnhNSiJM4UCkjJBgDP8CfTQiRQobgDRVkF993hcV5lpk8ycP654NhctXbbRgcm2XP8KqVBYXV9XR4Wx/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qr/S5KH14nW9YjQS9vBqmuQ//ut+Q40Uwh2ovc5Wd1g=;
 b=Ot4k9KAVizUTRUW1arT+YKaN786S+qxzJLtmppPxHmFBexmK3SjMj4M2qzM8SkCY7CqMITM1MqFyk1gGB2wquIPVtsmVHMdS6AQj0FEK0Ii7x1N+KJwYEaU0DTmM2/iwsZvG0Tqw7ya3k/OuomMNmBkGwqr7I37HC0dAm+JwN8Y=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR08MB2645.eurprd08.prod.outlook.com (2603:10a6:6:24::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 28 Aug
 2020 11:22:08 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3326.023; Fri, 28 Aug 2020
 11:22:08 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH 1/2] arm-bsp/machine: Fix ACK version for tc0 to 4.19
Date: Fri, 28 Aug 2020 12:21:56 +0100
Message-Id: <20200828112157.33380-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::19) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LNXP265CA0031.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Fri, 28 Aug 2020 11:22:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7de8496b-13dd-4dd5-2cc4-08d84b44b09a
X-MS-TrafficTypeDiagnostic: DB6PR08MB2645:|DBBPR08MB4363:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB43631432E7E74C55B970E17B92520@DBBPR08MB4363.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:184;OLM:184;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IdFmpTMYk0vZN3IOHFJNJuubxKZrvDzetpIVFF318cTDIP8yiY1yfYkbyyT7Z2cwujL0FG+dnKKksMem+5Zy5E/t3RHuF1AfJ9BMNIEOalaCWANzdsj2TE9eszAHxftvw91tF855wDmad7zzr3Ft+jwL8qHmGrOxBO8PSVHkalrNn1fPHxIzZB+mlJOmW7tQX20/udXaapQbUKM7ZHNLuMTpDfvXidpBYES0ID0MMkvo+iAO1V5wFFO1ZppGYUTKZ3/R1SRrqA4V0yMBFCf7wpk+bjiL0Ega3YVeGbQmMBWSjQuF5PPS2clXoKfemcCetQeLzbRePwYbuHNAu8lQpg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(956004)(52116002)(6916009)(316002)(2906002)(7696005)(16526019)(44832011)(8936002)(186003)(66946007)(478600001)(66476007)(4744005)(26005)(8676002)(86362001)(2616005)(6486002)(5660300002)(4326008)(6666004)(66556008)(1076003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 raVLkocxlzE6VPZvpanoD6vysdINgxAXBj1OoqJR6HrezL5S2ykrN3vXy71y2JLIX8bu/uZwJxDjuSWCchnm3zNvYMaWw0Ujc6UcLOMmDGILf5jbF05rQu5PmKwOdhzRqsvUlWBOxY0cJMzdFlb+wMswgJVuCzG311zoG0gxK8c3/ob/Dzd0QJkBxgHfU4Az7Fz9OMDSQps3JXUjrH3HoXhiTVtzCgXkK5eQUygf6+EcVpaOBszQ40KmFv1MkbVUIQHgFxVv797VlIOLCnHW9wCaxzHWNKCWEXfNq9hDd6xL7vBeecpIC9M0JWb5hhiO7Z9VnyuhK8gr9Ahq2jX0IocSBgS8H993Ve6HwT79CKMSDSD+86FBLptY/cmx6K8eWWy0z8Z7vQGF9HrwlBt0HuQ2lLAXWhwXye29GH21diFthcYt2N37oCbjMT4YeUQdFSbJdAziEAjlY30+YigMk/Ha8DK7y1O0xIBCBF65TOpgDO2AJv2DGb4+v9iUg4EFIseKqwR+uuCi4vsP3KdDkyrDNyKK5z/8YAjwbamYmjmuVJoV3UIr+D5eOtuZtn7R6Xs9GuBzD7S+eOOPMUrO7P1Bzz6qwhF9T1PdK2JQjkezPBPI1/D8qW2zwA7Vg/GkTroDd0IoyMAKIDjueRuhoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2645
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	70357317-4853-4a84-2e59-08d84b44999e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TXc2WesfgeT4R09OfP8peErKy7UY15CoyASUlxlmSCIdZqa9s63EhHVGirLAErQTn6U1AcDQsfWy6n+uWqxH92+Dcccxu23nvbSEuCZ0CL7J/Qsc6PN9wJHPEnuSYYsnRaSAJ2UOz+4xX0SgRUoPxvrY1kyqQvr7G0i/eiChpnSD+khQNybB0MYW1hOslzcwqYZkA+bPHfbHNgE+psxuHmJppPC//3Jsa4alBM0F+f6uXKN9c7L5K2YXNsAQQfSpu9l35wPgE9RE4l3LJo4U8AjzBhRaHYCiy3VfKqG6m6+eC4XhCogUBMYqA9RQHsOJbTgO//DWUW4B05VBucgfi7xKEgbxPGk3dVJJAHyWNRA+3NuzB15MH1gUVcis5Amztzqh+Log9ogMgec+vmYC7g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(82740400003)(86362001)(6666004)(1076003)(6916009)(70206006)(8676002)(36756003)(2906002)(4744005)(336012)(70586007)(478600001)(8936002)(44832011)(7696005)(2616005)(82310400002)(356005)(186003)(956004)(16526019)(6486002)(81166007)(26005)(4326008)(5660300002)(316002)(47076004)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2020 11:22:46.4589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de8496b-13dd-4dd5-2cc4-08d84b44b09a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4363
Content-Type: text/plain

Change-Id: Ieca56d40c26367c158b9394d546323be4c1f81ce
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm-bsp/conf/machine/tc0.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index 9b4f1ae..2de99cd 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -14,6 +14,7 @@ UBOOT_MACHINE ?= "total_compute_defconfig"
 # Trusted firmware A v2.3
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
+PREFERRED_VERSION_linux-arm64-ack ?= "4.19"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 
-- 
2.17.1

