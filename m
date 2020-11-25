Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.48])
 by mx.groups.io with SMTP id smtpd.web11.4318.1606295062407936431
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 01:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oj4pgKcP;
 spf=pass (domain: arm.com, ip: 40.107.2.48, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2PcZXsJV3da/ssJANQ6QF+9/6p7bs9SOzwY/eLyzQc=;
 b=oj4pgKcPg70j3ycWpDtFEopsGWd8RCUeN1DiuvMLFm3QWfDTDxVJJ661vmrwEe0Z73NKJAyTSmD2eUK8RiOvjl+yBuVUHcBgFAxCI4/njpVz4e661jUa6/1SKHhI9XO8wdjOW3/LDj9XRwgFLe7hFxhvXNtEUM2MoMc64lyS1gE=
Received: from AM5PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:203:69::20) by DBBPR08MB6172.eurprd08.prod.outlook.com
 (2603:10a6:10:1f4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 25 Nov
 2020 09:04:19 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::cc) by AM5PR0202CA0010.outlook.office365.com
 (2603:10a6:203:69::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 09:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 09:04:17 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Wed, 25 Nov 2020 09:04:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c6f54a1ac61a616
X-CR-MTA-TID: 64aa7808
Received: from a7b319405fe0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5AE59C8D-A921-4459-90C4-EEE6818471B8.1;
	Wed, 25 Nov 2020 09:04:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7b319405fe0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Nov 2020 09:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUmpz7QlcQnrsTbKRcHCLMFLq9HhMSY8eiAUMf9RojeRVpxFeRk3zNdvIWYQ7dEFIOOktvdgr0WFEnYWRNt3wBWBLOcG32wRaoQGUPcyFGiNc7OQSxvhtiP6pPTHotcCViK2zweq9YA7OgK0K46quEuJfXJ6E5tHy9Fzl2v4xdLYu8qdeKiUVGBP2/1qcll38AAjPmdzWfa6V7haXEcXkzlw1tLE9rQaQ0Yc2YP+1rrltXlM/9g/fmbZJBTlFEIwlErp0J+U322Kh0DhyoTHhUyWAr0Ny9h0N6dBG5Tr92/3PJuLTWZpMDBUWa97H34LIPPJ7mA1iQ+6jEQgN7smDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2PcZXsJV3da/ssJANQ6QF+9/6p7bs9SOzwY/eLyzQc=;
 b=KJj3rttOmVWnxcxJNNNgovjj0fnoxOiSD1G052SsoJaL1a7XQ1n/+8I0gRonjUCUlO24xsK7BhmLkFb+8hjCggJHTqEoYytQcEEiOQv8EMk4S8TaKT5Vv4JzYs8TchsnWHAtRPkd9Mz/htVefuMLyN6X9MTR5HEXywcB+RTgH3/O4cmQ7wtW44gjlXNcrYlp73H+2EoJDTQQh1njKHDWN27SN4pRTkt2G/dL29cDowsK79nF5KPcoBsdks93+NsvTD6MOH5ok7R0tg/zVNhnSI2ZcU0HoutA1cjYHRVtNxwb03LUc1RKEh42l4jpZLUvMBtG0eXsdDfCA1Rje3RcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2PcZXsJV3da/ssJANQ6QF+9/6p7bs9SOzwY/eLyzQc=;
 b=oj4pgKcPg70j3ycWpDtFEopsGWd8RCUeN1DiuvMLFm3QWfDTDxVJJ661vmrwEe0Z73NKJAyTSmD2eUK8RiOvjl+yBuVUHcBgFAxCI4/njpVz4e661jUa6/1SKHhI9XO8wdjOW3/LDj9XRwgFLe7hFxhvXNtEUM2MoMc64lyS1gE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 25 Nov
 2020 09:04:09 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab%4]) with mapi id 15.20.3611.022; Wed, 25 Nov 2020
 09:04:09 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/xenguest-manager: Fixed subshell false positive
Date: Wed, 25 Nov 2020 09:04:01 +0000
Message-Id: <20201125090401.7757-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LNXP265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::16) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.54) by LNXP265CA0004.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 09:04:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bfcfff14-757b-4d99-e75a-08d8912116b2
X-MS-TrafficTypeDiagnostic: PR3PR08MB5836:|DBBPR08MB6172:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB6172E192369E03D0A58448E58DFA0@DBBPR08MB6172.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5uVEsdg+L2FgqZg8NnucwwL5NL1QuXZ0IbaFikBOQaEQqWHiNmx3jTzjFJaDKoHbYyVgdz6cWZjMN5Ypj0fJXaxs+ylvxOcYASS4H6HT15LV1OyJT29SxMZc7HaqAvYVDd4K6vSZ4Pn+vqBE2ZOh6psitcaznrY9epmdocacHe1w+s2nvRemohi0yHfudJv34N4X4/qnGkueTjOyrz8+eOAioVy86xX+rax/nE9z68rIGrcyypTPSMsUbmTqIx6A1VL8BVZ6bKwWTD41h1ClwgqP6GjD0Ft0raHb9+rI7+86tELpaFQuycOEmgFsMOo1BHFQlissDdOUDZ+Q/pM6+A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(8936002)(66946007)(6486002)(2906002)(6666004)(83380400001)(26005)(52116002)(5660300002)(7696005)(316002)(36756003)(66556008)(86362001)(66476007)(186003)(1076003)(2616005)(4326008)(6916009)(8676002)(478600001)(16526019)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ZeYKPIgyT+qtVUwh8KR/N1qzjYWwNXJgT5lAIKQWUEEOKYnP4jH7FimAKBPGKL2zo9I/jgsq1CZDSdCJ+jkStAVI5/ynOiPDzz3r/w4TowWrYy6FicJ2NZvwooq1x0QHyFnVY2uyu5ZLGUZ3sVAsd/7EbrW+2CdIodK76mlbEkwBzNwDTmzaOlDbQFVGAP1gRZl0H/D6sUgN8XTWaNhsLCZ7R6QKdToRMf/e87i/Y0+coJ6jQJsEa0QG0Wxmh1agaymXl4ipANPsg2Gbmjkqo5NdNaTleKiZpRJC/jTbgIT0vT6xvL4/KEFJR1IoX6y/FPK+5HtYBh0ZvgSWX8XWrBfHQM6r+hkZV4KV4RK5aSNNvBX0KjScHrrvIOTltii7kiESn4xB0Myh6SFeX/VEkrhkuVvOU8wHezABj0DVSOiXEreYEMTa35iIJKspoEAJC2B8UGqzC1GLzNJPkLUEDJGWH4PYqThgWs/qrfKRuwQWA26pc7pFxcdqRtTDBWzYAcXRnxoUwa2v9lwpqdhxRsf/o4OXm4va4a9g91abWbhbsKAeVT+Thx+QdPapYUp6MVwTALmI2y970xCnlHMcGC2LpCGSGtzmhT3njtzcgePERSSQEPQHl00oaWOz10kCD734vX72bvvTNeBuGYBuOVBzpRH8SXiitDg7H3WdlS/zw48HFICC41XSWMq22tkSYQEYfhIASbD1IVWmHD2rwcSU+xQxTIYc78ravwZJmhGRGQJzJLSESSpLfLQ9oWEADA34h/SzDXDyrOnRHwiqGrtfNZnMsLM0E361h8xxztd0/RjrHMiIz7r5m3GxeUVgFaYVvO9kujibkAAwm2guATBCAKVNZPLuldnffaDpdCmJ2YsbeMPnvJSFdY68c3YIcEIdglfUqY51VRkSxV20Lg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	58e430f4-5315-4209-36b2-08d891211159
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gn+kISGOc5RGgUc8KuqFPnp/QU3gZ0g5c3xbalC20XEitiUHSPv/xiHOU/0zVlxmbBbHAf0TzyOLdc2dcwg6kor1jFaLrz7ZG/2UaJHR0Lrtie1p3JuIR0s2StU9flNkZ34GH3TJD14T7OU02eHFDuRt9IwvEpZ5uCEVJx+VFu/OEOdzTLkvWst/JlQG3Vg0rjuRyp8401x+Xm35C+Ln7BeswtciL6SgE35uvOjf/8WK4VspDiUkMd4UMH3PAdGWEm4+ocmfQKoeJ6aY2m95YQ7sFPWyU4+EaMuGVy6JVAdCSsdh9cwJQ3o18SjPBYSnsweRpnr2wjBzKDSEVRH4J7njUSR7APgDxm9qZZ/jU97iZFWYzyrYgUS4TC6fWLXZ6lNW5wEKdCUobt5pVCgKFA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966005)(36756003)(336012)(7696005)(2616005)(6666004)(86362001)(83380400001)(47076004)(6486002)(8936002)(956004)(16526019)(2906002)(316002)(356005)(70586007)(70206006)(186003)(1076003)(82740400003)(5660300002)(478600001)(6916009)(4326008)(26005)(81166007)(8676002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 09:04:17.2387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcfff14-757b-4d99-e75a-08d8912116b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6172
Content-Type: text/plain

Removed private check from check_size and is_integer to prevent
false positive error on execution in a subshell

Issue-Id: 1623
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I57564bf610e21244c963a77c0669da5d4526eeff
---
 .../recipes-extended/xenguest/files/xenguest-manager          | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 33ec40f..cc55b26 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -70,8 +70,6 @@ function check_private()

 is_integer() {

-    check_private
-
     if ! [[ "${1}" =~ ^[0-9]+$ ]]; then
         >&2 echo "error: invalid number '${1}'"; exit 1
     fi
@@ -80,8 +78,6 @@ is_integer() {
 # check size and convert it to MB, e.g '1[G]' => '1000M'
 check_size() {

-    check_private
-
     local disksize="${1}"

     [ -n "${disksize}" ] || disksize="invalid"
--
2.17.1

