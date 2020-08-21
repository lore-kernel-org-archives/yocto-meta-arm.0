Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web11.134178.1598017852488560721
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 06:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UCcxKuJj;
 spf=pass (domain: arm.com, ip: 40.107.21.51, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrnKK1lika1+KArch+LcZJd6/XtmpnL4C71+yrMWKPE=;
 b=UCcxKuJj/3VXPRxQvOFkCDjIvFjLXLcG3FASaoerK6UUQk1qqQ/okT2jmn/ifmzlrSwaTG64RopJdsg7VlbjB+dw149TMkcLM7IvztCcFFUenWE6yt5EowgChf6hpsvPvr2/58FbeB/3LLTKfH6lzSA3CYNpr10TkNhBnqDMpYw=
Received: from DB6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::29) by
 AM5PR0801MB2036.eurprd08.prod.outlook.com (2603:10a6:203:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Fri, 21 Aug
 2020 13:50:47 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::df) by DB6P191CA0019.outlook.office365.com
 (2603:10a6:6:28::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Fri, 21 Aug 2020 13:50:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 13:50:47 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 21 Aug 2020 13:50:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a82e79044be74ba
X-CR-MTA-TID: 64aa7808
Received: from 7c7e2155e22a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F90D5E30-0299-485F-8300-D5D74C681C14.1;
	Fri, 21 Aug 2020 13:50:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c7e2155e22a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Aug 2020 13:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMZw1L9F32RqwEmpjOS1XL8nOq/1Bg1GNhTbJaSL4CvEFkRg0OW9iU2o47ZYlxWa1pQKQepnKCSUkYgWPTCxNlK/9P7q+qzL+gfz/jH8ggZ8n8tSLK3cpKBHSR4eeAXT8ROCFgjtHKTzdHBmdE7d/XyC3jwzPCp0iC/srxyt9W1WiMe/pazAew/dN94SYza6GYekMZW/ngJdDMCi6PvZIpABoDE+239cnqyyMr2rPxBKIZ4Kz+suW4OFJZ5cs24HKvTdEkZXKEoTkU5vb6OtJZ3XZgpPxS3WgYzkXXfMniUJiIlZEBf1B3VoKXqk4cEOs/uiauAhKJQxU1T74+PAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrnKK1lika1+KArch+LcZJd6/XtmpnL4C71+yrMWKPE=;
 b=gwGZtyVpceeGNxgjVjG5mDByJBZ604Ussfkm1wpkopAlvh5CV+85Ksi4YbeTgx3Cei71inH7eJxaoFDTC+Bfexzp5D2OW2wW5C46roXW5seD/5MNRTbEEbxDUe+OJs3r6AivdUF1DDcMVG+hjZlDQCH7dmBe1N9rO7vf+YZSy7RY0wXlJqOrmdCaO1DB9Q7ReQPfPQ+JusAPMpB0zykv1JbcPHWy28TJu/EHWvXZ6jvzcFSmQEeU39nBElz2m3a0h+SllOkK3rKcBGSLJEMZHKKGL/ezj/NPU2phd/pn87ld0YAAfhzOWaHvEfMPBd6+yDE935jrcrrWWCYFhLSloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrnKK1lika1+KArch+LcZJd6/XtmpnL4C71+yrMWKPE=;
 b=UCcxKuJj/3VXPRxQvOFkCDjIvFjLXLcG3FASaoerK6UUQk1qqQ/okT2jmn/ifmzlrSwaTG64RopJdsg7VlbjB+dw149TMkcLM7IvztCcFFUenWE6yt5EowgChf6hpsvPvr2/58FbeB/3LLTKfH6lzSA3CYNpr10TkNhBnqDMpYw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB3412.eurprd08.prod.outlook.com (2603:10a6:208:dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 13:50:40 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 13:50:40 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH 1/3] arm/trusted-firmware-a: fix variable name typo
Date: Fri, 21 Aug 2020 19:20:22 +0530
Message-Id: <20200821135024.25615-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::21) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM6PR08CA0047.namprd08.prod.outlook.com (2603:10b6:5:1e0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Fri, 21 Aug 2020 13:50:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2f8578e6-5f81-4c4f-32ee-08d845d9350b
X-MS-TrafficTypeDiagnostic: AM0PR08MB3412:|AM5PR0801MB2036:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB2036DFB8473197ADE257ABE0FA5B0@AM5PR0801MB2036.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:923;OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YdjkP5jI+MzXVZI8LIlw7AUyoee+cRYd+Lg2RT/63chgj1twlWmc1tQ5ZV+jbqhIhB2yyqSsEyBKq3x1DOY5HZp0BhhF5/yXFcLDnAm7kXK5Qd91xRYDrzPJlGtb/RlVEaPzKLs+dVWTJST1TcL9Qy8ktYAY1A0NOP8TnYi7RL11RsDZDo03p80IwxGi7Yu0B4lx8QEeXsVZBIA12LJhDbP9XpTYHQNfq2gjctu9MrjwrsmpTdIj/rucaJKvFD1ZG6R0bX94NOQnUX/LDZGQAPgl5cThjFuPlixySXw/SQtpDFPEDagMR4XYvahP23c1ZxFBtqiAAznDrIBRqWyEUQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(2906002)(8936002)(6486002)(316002)(83380400001)(6916009)(478600001)(4744005)(6666004)(86362001)(1076003)(5660300002)(956004)(2616005)(16526019)(186003)(8676002)(26005)(36756003)(4326008)(52116002)(7696005)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Tv7DVb+PnrATe6Pr0W+pS68vbJd9MxP6r1z4RTWi+/d+jtBlM7UMObNTbB8tNq5oYA2q38adJkRz3ye0R6fZePoBWEltXJtzREUSGksJ90oiC4GZn84a1GRNB9R1JkTzfy8mBHTDs6tNvRumtcaebPrzMGpOXem887I0Oafls4w5WufvOdmrsoY+a6Skp/8NsNZOE1Zy5UQBwsIyKHVV5ru8742vOCUZEbuwVcRNp749riCBMrvFMRljiqW+8mkUUhH+hmdk0pez0pchN01Y+5Cir9H9fCSaX0GvwAnzWyt8tTQWLwjjqteNJsIctFO4TT81phlkoh/5eHfi8E5VFJkyPhUuua4XNazKGLwIZqZTyAiQVfLzwTzgRVvyLYbJkmTQDCmCcfy0+13i1oNt4H8l5nGZMJRqNq7INDg9uRjfF+0qfeNLM5uLy62RzlRbeyWhIgcRxlKF3xWK0H/pigPqs1QH1Wpy9nZ2wOJz2BiMKXHiCWXEZKDtORkIs8+o6AXEbEupxjoBypmu6hdXlW0LnIlgHM6ehjPw1/BvQqxqIS4krfOSag5OG89IsePzOmQDzsjLTa+76TOteX9qigP4jD/Wqewb0bnvhr3StlFpnQxVYQl+0vDBV+mIKGVT3oJeId2A+j1dJ3PGUFBbpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3412
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4b7629b6-9e8e-4eb1-d6f1-08d845d93099
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XynDb3rLdmDoBBbqaf6AQxzL943nDHG03xMjPKc/21aPhcnMg/sf9Y2Iyr9ogo+9dgcrjQbY8kDU+VZ3CH/KPFj7QL9EgOvrlvy/pEN6P+SHUv09ogTfIV6fhLLpGFFTJSvZl+9JHXzj7wrVbkf7a0Tjnuifh4r4xL+as8Nobzo89jK/KZXO4oBGM+MYyejCxkkNyPeuWOHGKzruup3uCIV9Rn6dNPfigUitCO37jrMixb4hcWz0FdMHxZQs5ZXpT9/wDHK8QbibBqKHEaBX08rVbUHhWTlRf7G/5yZHYGk1gn9gvIzhGmgx5Hw5VMlrXVp7aqgQKxkelReoE88JEIE8ibZYSDw1u3FYNS42ZEI/3Y5A9BDtgJ2QlkC9K+NOsf0QW3zN8VT5c2Qzw+BI9Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(6486002)(8676002)(82310400002)(2906002)(4744005)(70206006)(8936002)(26005)(4326008)(1076003)(16526019)(186003)(6666004)(6916009)(316002)(86362001)(81166007)(956004)(5660300002)(7696005)(478600001)(47076004)(2616005)(356005)(82740400003)(336012)(70586007)(36756003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 13:50:47.3011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8578e6-5f81-4c4f-32ee-08d845d9350b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2036
Content-Type: text/plain

Variable name "processes" is wrongly mentioned as "processed", this patch
fixes the same.

Change-Id: Id9362f514861c75f8f6a727582e11b0e65736349
Issue-Id: PLATFORMS-3971
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 4362882..e4847b5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -171,7 +171,7 @@ do_install() {
             echo "dtbs install, skipped"
         elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
             echo "Tools $atfbin install, skipped"
-        elif [ "$processed" = "0" ]; then
+        elif [ "$processes" = "0" ]; then
             bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
             exit 1
         fi
-- 
2.17.1

