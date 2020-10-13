Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.51])
 by mx.groups.io with SMTP id smtpd.web12.9523.1602587937211591479
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 04:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aAcDPZT3;
 spf=pass (domain: arm.com, ip: 40.107.4.51, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqxdSWEUChxjJs4Ydi4Uc2/tU2mdjTPbeI8bJikOSJs=;
 b=aAcDPZT3e5sp1XGWesfWRO4qXCjlXaOay/9PyLLMtQjewUPeGEe4HYyKdEg2e/pVmBUc9nlG07H1+7Osqek/PhDOlzvjn5xantA29sSgykpeAEC/82J60KgjNgYkAB9jV5z+rLufonooUv3PToU3wSmGm0qP/7TH9rK2AdglydM=
Received: from AM6P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::40)
 by VE1PR08MB5006.eurprd08.prod.outlook.com (2603:10a6:803:113::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 11:18:54 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::e1) by AM6P195CA0027.outlook.office365.com
 (2603:10a6:209:81::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24 via Frontend
 Transport; Tue, 13 Oct 2020 11:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 11:18:53 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Tue, 13 Oct 2020 11:18:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9749c9d9c0d1ea85
X-CR-MTA-TID: 64aa7808
Received: from 35fb27b9700e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8EF5096C-23AE-4BAE-A20B-69ECD08B611B.1;
	Tue, 13 Oct 2020 11:18:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35fb27b9700e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 11:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzOBzsyGIJEuvTzKCEEqU6Z4nl5Bh/tXgOAgxv7BMhIwDcaQLJaeB9PMeA85iZC8FGYEVMgZtClv/wDWo9dgdxaOVrb397W+a7DNC4ZsSgiMb/3VfRWwI6QWA9OfPV4BaJs3Qe5JoAmk29kRi1cmvb7xx54H0ZqMrsf28E6A3L+7SEUyNIuti8JPS5JRk0j5Q7vA3L6DBzfZ5ccw8/45rfP1hEktU61gpNrXqAYQB4aiRFWPnJnA2PI3z1yPMVirFklD7kEgyoVjZNcKigKxM9gmD6WTYSFbVwsveFTVAgKHqmCQcBoAWX30f8rMYcrVoDaDMID850QwtqLSef90KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqxdSWEUChxjJs4Ydi4Uc2/tU2mdjTPbeI8bJikOSJs=;
 b=ffXRw9OVKqwPDPnS0rXQLTmZPLsG/sagfaoN7P9VY6Ag/huXVLGK3py/VRCR2zGKSrgAiVcDQVx4BWUx8kFlNQKMbhT+cXySfMJmDkLhiUtsYGU4QbxbD1I9/W8FpSxjkMEYabAM4DA0GEwUmQRhAt/xZJEiHE7//b65r9IT3G1rFUa1c6LwQxBOAkKznAS68GkMQNiXFbsEonHLhKbBdQ1ieRdwEUW/CRPo6ZDNIHVGogEjSmUYHaXVh2YfKTgI/DXwajHV+cZgwbDCVOyBteIP0z55rZ3/tCndl6q6KXfmNiHnOXEcMLABdfZ99mV4Fg72wUu9FDiBLjnvd+YFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqxdSWEUChxjJs4Ydi4Uc2/tU2mdjTPbeI8bJikOSJs=;
 b=aAcDPZT3e5sp1XGWesfWRO4qXCjlXaOay/9PyLLMtQjewUPeGEe4HYyKdEg2e/pVmBUc9nlG07H1+7Osqek/PhDOlzvjn5xantA29sSgykpeAEC/82J60KgjNgYkAB9jV5z+rLufonooUv3PToU3wSmGm0qP/7TH9rK2AdglydM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com (2603:10a6:10:b2::16)
 by DB7PR08MB3211.eurprd08.prod.outlook.com (2603:10a6:5:27::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 11:18:21 +0000
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::5416:ae85:c3b9:1c99]) by DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::5416:ae85:c3b9:1c99%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 11:18:21 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH 1/2] arm-bsp/trusted-firmware-a: Update SHA for tc0
Date: Tue, 13 Oct 2020 12:18:11 +0100
Message-Id: <20201013111812.52597-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::24) To DB8PR08MB4123.eurprd08.prod.outlook.com
 (2603:10a6:10:b2::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P123CA0060.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Tue, 13 Oct 2020 11:18:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 23704dd5-2d67-4e66-7076-08d86f69c4d2
X-MS-TrafficTypeDiagnostic: DB7PR08MB3211:|VE1PR08MB5006:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB50062B2C8D37F1FC66B8F74392040@VE1PR08MB5006.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uRhv2KBUZtFUhNa629MtVFs2T/pGRTzxFcypCIvsFCyIb6WI64WATmYfsF3GEOCHLMW5AVZQA6egF8jm3he3L5xQhm6TUZa6df0hDyFsSicwMWe5fEq3uad8G9enWzG2N9bjswgKeKka5t6welEUrLRdmazS1GTF6BVdZ2fXp5xYVV3XUJc4KHqIp/tUgKnsUHgxEtlVSNObOfFzW+UonK3eUUfh3mnxiBqNrfBHh2E8FeGWH9aw8D/5wZsa/FgWWwLT2/F9pPL+u35AmtKuHVs/CARJT/TuS+RoGntfrLPPeZUg/6VGI9jHmkap2VsPa7SJVgQRtnG4h4fhfSmvGg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4123.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(5660300002)(44832011)(66946007)(26005)(83380400001)(478600001)(2906002)(86362001)(956004)(6916009)(6486002)(186003)(1076003)(6666004)(4326008)(36756003)(16526019)(7696005)(52116002)(66476007)(8936002)(8676002)(2616005)(4744005)(316002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 W0oL0AoQsngUR80uDQ0halQ2eSWOl09OGnS4j1r9SAOiRSDKVF0gByqzbWstoOsJkAaMp+C2N2cB1XDr2LdI1stcvsuG6zJnF4IVXvDC3m3d6lwIab+zUNstDj3RwumYWKpBbd8qUlCTNzp1rfSXBwoUxfqi9KBS/K2TGpJEYVXLkBKhwOsqbNo+U2T9x3+dEZ2xPaNKiT7pjUtZjFS2tkz7C1GYJmjS3omuYmRKjB5BjJvUe7LWZsrvPormd1oAslmjYYDe36Xnj39gXT+Da0UOY+CcDsp+jGNbl0oIGg8UE+fKNhN/T++D/aOmysbLTAu+NDcxpIlPkkAASnw5KrUYMHnVJGqP74UvLSTH9NyNF9KP8cgQkg7Pejy4HpDym1F1k7YZAC1gRiGPiw5lf+0Nsls18bk0Iqy/JIbM6oSu+3NmxTPxeHprHqKiQN38CynW4zoV92eq8gcQrGcB1aDofeKgWraPIo27fD6EXDAUuhvvORDi7HrKwLxiYvYxVC8pLKXE42m0F3WSrMYRyZHACHXsou8hUoDk+UUyNTXTJYG68jSWOF0mblGOkDegjrlKaqPXDTBRbqN+lBIixFfTER09og4luJNqITIlXut//V7DglBC5zvO7sTxFJv1NnE3oMwnN8LAo6D00a0/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3211
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26035192-f205-4af0-875d-08d86f69b144
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	70qwR06gLZM73a0S+PNRWPAEadDgEzTU/Jq+H1GhKjLNYys/mo3xFU1SOXMQIDfZOiI0PyJa66Pgc6Flck8d2HmnBCysEwgs7kPyDvg7mqPU0EJDTs9K6PPoP7TbtywNHJyT/laIBJ5jykWRXniwYSgkjlF4/MN8yv9QXK5zIfWf3R9ihBl//dZCia8m/qfDd3Nv/8LMUvva2Y+MsQsSX5NNF+KOkuNAPPdw+XdqHmOoCnERppENXe/i4zDWwrHSr0QeHJHks7RHvyJSYa7t1veMFTIikLBnhNTf4/SoNsvnIqdPS1nHXC1xO76inlg8SrR8ZBmtoEWoE+LjDPAa+P7H4mxGk6NoiwxPhXGVbv1NcWRrW58nohPGPDAmLa7uJC6VcjHDuC7rLbqBPfebtQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(46966005)(1076003)(316002)(26005)(81166007)(2906002)(5660300002)(8936002)(47076004)(83380400001)(82740400003)(4326008)(8676002)(82310400003)(356005)(16526019)(86362001)(186003)(6666004)(4744005)(478600001)(336012)(7696005)(956004)(44832011)(2616005)(70586007)(36756003)(6486002)(70206006)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 11:18:53.6200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23704dd5-2d67-4e66-7076-08d86f69c4d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5006
Content-Type: text/plain

This SHA of trusted-firmware-a includes support for
additional features for tc0 including TZC and cpuidle.

Change-Id: I004f9614b2bada9b88d2fce90f0f10064d8437e4
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
index e2f41f1..9af04e8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
@@ -1,7 +1,7 @@
 # TCO specific TFA configuration
 
 # Intermediate SHA with 2.3 baseline version
-SRCREV_tfa = "2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537"
+SRCREV_tfa = "16796a25fefc4ecf780211bf554d3b8dc5436fa4"
 
 DEPENDS += "scp-firmware"
 
-- 
2.17.1

