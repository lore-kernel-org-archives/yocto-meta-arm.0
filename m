Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web11.17720.1600956217092921469
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Sep 2020 07:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jyKc4gGB;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CtzR5iGuq6gNPBMSl6HyUA1v0Ydex2fMGEiCv05l6o=;
 b=jyKc4gGBNbzH92mr7M/lfGngKOHe1gb7svQZEYDYhybWQj5KnQaGly7VyPYp2ungjymrLDKjRG6gd9s5OwKbWQrccNy+9wtpnUbFJrD/R9NOQkvtIS4Bwy4skr1dSaCZQoazwRzzzuXl83yZnMNKCXk03M4VDZ7XJt27X9lWOaA=
Received: from AM5PR0601CA0041.eurprd06.prod.outlook.com
 (2603:10a6:203:68::27) by VE1PR08MB5262.eurprd08.prod.outlook.com
 (2603:10a6:803:106::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 14:03:33 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::f0) by AM5PR0601CA0041.outlook.office365.com
 (2603:10a6:203:68::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 14:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 14:03:33 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Thu, 24 Sep 2020 14:03:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea35417456435aa7
X-CR-MTA-TID: 64aa7808
Received: from d113d4fdf54a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 66CDBDF8-A4C4-41D5-BEF2-340D2EF40B8A.1;
	Thu, 24 Sep 2020 14:03:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d113d4fdf54a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 24 Sep 2020 14:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5W6xPKX2bVxKTROFSVc9xDVDFHzTG8alOTEy3dSM6VZVnIA1PduoKoncGFtXda9XwKJZcaQ3V3nhIYXCB+paR+EWK2qsMfXvJhQzl54oei0+01wJEu74gXyyS5QdvpwIYBJkvtIcG6KbT3wGD3OfhYg9+7dWU2YMii8jRLqQyoj+EEfflTqLZJVzj3sfRTsZjyd3sPFKQHJ2qspWbJwf2AOdcpHbyr2vpSuoXumbmz2r/WKltDgLhA4NOfVz7jjtQnFxuXik/tg5FErhDSJakGLph4jiUdujWolAcMen6sf2h0iIvbIJwFu0aHXrhv/IVsyxq2sPoMO3E764aworA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CtzR5iGuq6gNPBMSl6HyUA1v0Ydex2fMGEiCv05l6o=;
 b=GN8rpFh5DVknDNI0PSmT4enstOQyDGdclmFbbyNAsANRAhDrYiQ66hAwTkIH8yZgzUWitmxlUgFBpwit7Q7fQTomU/d8wvvk27enrchU/uM0JRoI0zAXNtCSWEOhgYBDhM5Ox1mRx+WxoRYCWgFueJXcDwmspSZ5AelGyGcfiCBcZLmQbHUm8DpNAjiHqfAOzcaA7jJ3QQAX4kgZHzD3TIXyhDcNuqDFfMSi0aDhYBdqqRB8HT2oi0UJNW+oaBxjvHwVMP6/vRuyy8/XggYXlu96Q3mmMFfFSWA3kg7QAJBQT5gwImtP7eBIUos/zYdhWg92qvEbnHvhoxOwEgmaWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CtzR5iGuq6gNPBMSl6HyUA1v0Ydex2fMGEiCv05l6o=;
 b=jyKc4gGBNbzH92mr7M/lfGngKOHe1gb7svQZEYDYhybWQj5KnQaGly7VyPYp2ungjymrLDKjRG6gd9s5OwKbWQrccNy+9wtpnUbFJrD/R9NOQkvtIS4Bwy4skr1dSaCZQoazwRzzzuXl83yZnMNKCXk03M4VDZ7XJt27X9lWOaA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB3411.eurprd08.prod.outlook.com (2603:10a6:208:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Thu, 24 Sep
 2020 14:03:02 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 14:03:02 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/linux-linaro-arm-5.4: fix N1SDP kernel configuration warnings
Date: Thu, 24 Sep 2020 19:32:40 +0530
Message-Id: <20200924140240.9442-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::23) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0323.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Thu, 24 Sep 2020 14:03:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03bade9f-01bf-4149-b506-08d860929fbf
X-MS-TrafficTypeDiagnostic: AM0PR08MB3411:|VE1PR08MB5262:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB526246DBA0FFFFDC46C1AD59FA390@VE1PR08MB5262.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wY2q0AjbS5JYg4AuK9LbKVBWkKgyHMYmUn2848r99WAO6X8jVlmd+hrvuDIAoNtMq7RKWKLhcDieOau2s4xTRFCu6E4l5CWZIdQazVXI9I6dysvuLvUvsdz6KK2pe8tFp4f3/oB2WDtSw49AADTgi4TJJ8jCY7e9VdbSa654rUOZX0V3HwPTclpG4BIArvcRH2gD5N/COxsKS9TerI9dG+KNbBo3YNT/WJEjab9qSL5E3nO/ggsbcPynm+PqQEX/NWYY8VB3kHeYSB4WmDjMlM79Cqbq31TL5+PaA2z6ILd9oUoGNRnNlePcZomymw8YqjVugOGZq9UrTnWg4KehhsJcZGbYdrPzTfOrn5aW8Ntph/7Sr2p96QqUgvF0rnKW
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(66476007)(956004)(5660300002)(7696005)(478600001)(16526019)(6486002)(52116002)(186003)(26005)(86362001)(8676002)(6916009)(66946007)(8936002)(2906002)(4326008)(6666004)(2616005)(316002)(66556008)(4744005)(83380400001)(36756003)(1076003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 LzF65AHl6nKENU2GWNVsw3nlBKUFMtfHte/ePczo/oWWTsMzPF7bRluvwnwmlV5ogcBiW25SbETujHHpPXEBuR+ZtLt0hEyfcgXsKdrjztHJ0cxsIPwWP3kl76YWIxxnefz3qP1mMJ6fytTic1chJoFOIGJG9ICota+iEL6l7QBnnAl86TeAj+wmWw/3bJR9YTk+sQOnwTChrrzW+SSTMTQ4RF7WOqY08/Xx/Qt8mQ7cfGOlQt0DockUiPkZ4PgCEnOAZ4flz194ECWKR4l3FSrrTFfHvEcfaAIRS+6OHa1x4Z/TjWMYcHmQa7EqeB7aEWWio/H/w7VSF0WKPerPjbhZ5xDZccx4XBjAclc718EuC2/OC4squz0IAhlJhnzXBZA7a6FzQpv7T5V4JNGEp1X9XInusOwsIRqnx+etKiZ2a0/Lc16zPSJzAPXVT1GkCVIsCLmv7MKq4VA6YNCi9iGgz3DbuprxR6Eu5EB5WkCk6RcImhmqwOWg0gOSTEWYSrckgRtgjR5Fo+FlBzN0xLKA07EwZ7PfuaQddAusOxnzMpOyavmja5cQlRB/bGz8nAR9FbuljymsM/EtvL3nsT23aaT5DjU8f5O2ywegUwq9Mb0LWAJglOdPROTDIN8dcv8Lhq9OHqF9dSMVlP32mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3411
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6ca8020f-8b42-4b57-f2fc-08d860928cfe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rMq9fI/7Sxm4O8PY9CyPaNt0az53ji9nzwlfnl0P0m0U+sIeQoT6QToBiiv/WhNjGSlj8KIShPWEe/6Z0ls6hUE+6j1Ns6V5sA2d2bieI57lXCY6jH4xLn6lbsQrasLVb3km43lm76H5XP4T4BYF2rqNTcNkk0JnjwNIsKaJh3LXPRg/wdOBy/+z7Ow9WG8ul4hupQpBkv+8I1rYDR1nnalMoiLH3KwyxTKkBLaaGM8+bJ/Y0/2+ZmscFtxPSIZtsdpSEzlq05YxxOdXeBU9e+KiabZWsCcJNptZkDerjDjkoq609qIs7DhCgru+IIm+H6LvjEjl6s9ahCnC03HOWJUBxE1fxfkz0yM41znMSCR2D7ITBTQYPYtmNL7IXikk/1zMjRfXflNukGSjN36F0faFyv0zvUldTcve1IUPyuWCvQv1fbJaPIKeqNNgYopaRkD6nMeC3Eilw3bwUWxKnA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(46966005)(478600001)(336012)(4326008)(70586007)(82310400003)(8676002)(5660300002)(6916009)(8936002)(7696005)(86362001)(1076003)(36756003)(356005)(186003)(4744005)(6486002)(26005)(956004)(36906005)(16526019)(316002)(2616005)(2906002)(81166007)(47076004)(6666004)(70206006)(82740400003)(83380400001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 14:03:33.3388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bade9f-01bf-4149-b506-08d860929fbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5262
Content-Type: text/plain

Update the cfg file to fix build time kernel configuration warnings
as shown below:

{{ [NOTE]: 'CONFIG_REALTEK_PHY' last val (m) and .config val do not match
[INFO]: CONFIG_REALTEK_PHY : y ## .config: 2358 :configs///defconfig (m)
[INFO]: raw config text:

Change-Id: Icdd0ed0ecdde887e4dcb5874cc59ce407c8d92db
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
index 192cac0..7a57474 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/enable-realtek-R8169.cfg
@@ -1,2 +1,3 @@
 # Enable Realtek Gigabit Ethernet adapter
+CONFIG_REALTEK_PHY=y
 CONFIG_R8169=y
-- 
2.17.1

