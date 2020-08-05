Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.89])
 by mx.groups.io with SMTP id smtpd.web10.4201.1596622632284248598
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 03:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=i2JNkteR;
 spf=pass (domain: arm.com, ip: 40.107.7.89, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br2ZROi7xmVIqWaYpasfd00HMjKCpTzImUaWAt7l+kY=;
 b=i2JNkteRWjBkt45BEANlS4nmGfQ5XCBAQ6N+6E1QUJybWJaFbVFldE1leyN/tXrpC0YwrbSBed4SqQgaS9JVhnbzIgegauf+rvZbFNKmYL7O6x7RMw9s9816++24eJuSD/PhqDkuWpGXmIpCzMtPnTv03FAn8ShqLBriBHnWrug=
Received: from AM4PR0101CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::48) by AM0PR08MB3585.eurprd08.prod.outlook.com
 (2603:10a6:208:d9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Wed, 5 Aug
 2020 10:17:09 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:200:41:cafe::1c) by AM4PR0101CA0080.outlook.office365.com
 (2603:10a6:200:41::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Wed, 5 Aug 2020 10:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 10:17:08 +0000
Received: ("Tessian outbound 4d1c9ff00b71:v64"); Wed, 05 Aug 2020 10:17:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45791c066e1212ee
X-CR-MTA-TID: 64aa7808
Received: from a7c11e468b28.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6A8ACF1C-5243-4C82-9AA2-97A55257ADF6.1;
	Wed, 05 Aug 2020 10:17:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7c11e468b28.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 10:17:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb0BHzY5T76O2kahPUL6kUCFiK+NA4SfesLn0aM9eSHUnHO1YMi0zbou76aS2DOl3a12kEUzWKvjbObB46xjh5xgnUqghHA/d2LOwJc+X+IXY2b/hrZw51vamLgv0oCnoHFgSyzTz9CjTNBj7OgjfLr2H3KaZDlqudz8y3MsFKm3Z9JETGOiadjwj4HbbGtWC8Vm4TnfgCzIY8EyBdLlQQR8ULT35I3TFCIG15WyTdAUEYGLqiKtLkbyRFkDBw0GvX3rbbEc7D5RyNROGoyxyJmuHqUtqX2Z39dYx3HaHmHeCVnX0XfzqJNNEz5B4xC22XRUWJJWUWH+bLxbpCKFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br2ZROi7xmVIqWaYpasfd00HMjKCpTzImUaWAt7l+kY=;
 b=XyheWDzPl7euFDbVjE8XczGBSqFssM3wHwVikTHtTCDJmbnWVK9qnPa9DtPn93hLI1pxcT0jLJzpiZqJIXGPPHcEL3Nsb0xmymgoMbtOWb3FiYDiGCk2jYzZd3hku+Wk2icj4vixw2LEa2bQxHx00AzGEo9B+lUmeRCcGpsR2WyFmX59n797ijpZydlaXciXQ8vAlmB3IFw0A37IC03Ny8JNY4epcrhYuGARrXaLoc2eSpDv51wABDGYo5jEPF2y1aPICsK/ETg6LdAhbcuo7hjyPUSIN9F0dsqV/IqztNWsWHPVrycruRd7X83YWj8fOB+fiE4qi4tcSxJpTZOOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br2ZROi7xmVIqWaYpasfd00HMjKCpTzImUaWAt7l+kY=;
 b=i2JNkteRWjBkt45BEANlS4nmGfQ5XCBAQ6N+6E1QUJybWJaFbVFldE1leyN/tXrpC0YwrbSBed4SqQgaS9JVhnbzIgegauf+rvZbFNKmYL7O6x7RMw9s9816++24eJuSD/PhqDkuWpGXmIpCzMtPnTv03FAn8ShqLBriBHnWrug=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DBBPR08MB4870.eurprd08.prod.outlook.com (2603:10a6:10:f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Wed, 5 Aug
 2020 10:17:01 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 10:17:01 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH 2/2] arm-bsp: trusted-firmware: tc0: remove SHA for mbedtls
Date: Wed,  5 Aug 2020 11:16:29 +0100
Message-Id: <20200805101629.27959-2-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805101629.27959-1-usama.arif@arm.com>
References: <20200805101629.27959-1-usama.arif@arm.com>
X-ClientProxiedBy: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.52) by LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 10:17:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eb0a14a2-589a-4f7b-ad9d-08d83928b5f6
X-MS-TrafficTypeDiagnostic: DBBPR08MB4870:|AM0PR08MB3585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB35851AC8827D2734D7F77EEC924B0@AM0PR08MB3585.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:121;OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 b6LkxcyJzn4XYRMN83TK+RdyUybjUF8m3bjXTp+d5oSOBq3Ta9oZEvf6aXiO6h5+awAN9esce1hNhX8c98kMmP3WMgFej1beXGe/R58/R/B5FNQSV6n++XVl71LaUuVAwcl6UHT9jRMv/ms8c6rjiSG5euDWIeo12EMs9KpeejgWHsG6QiE9gZneCJLD91xJLqzAZ9e59BbGT8d00HRIuuhczAtrcsepGvTsFTsNA/3uN4It6W+GD6D3Qdtj431y3rq27SY9PiPNKVnPBOPcHokeiKEbyalx+if6sPkkQn2LOm0EYRmOPznw+UfAxA9rGnbxXxuTKthgKoO05J+qjw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(83380400001)(6666004)(8676002)(1076003)(4326008)(186003)(4744005)(36756003)(26005)(6916009)(44832011)(16526019)(8936002)(316002)(478600001)(2616005)(86362001)(2906002)(6486002)(956004)(5660300002)(66476007)(7696005)(52116002)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 A7OW/1lqd43r6HhqBC/d1+AjmZYnfr5g3UILRaXMOO52I/frEBd2h0SjeS/W/TnEMpGE3FQseTGSUJua4/1DCozhVbjJBhXqo5X1r94ShsaAd2hO2v/Ta88mB3J6/sY2dnzTv9MjRgj62Kso+D7VgBduFrypsvJfOZzadQMRDUlYj8XsYdxfvDK7qrqSO9Ho1Uvj6+ySar4/lMl2P5h6MPWSooN4L1d6IBsBjCmYpO8SCVyBVUddgKUpllvq7SdZCZikk5v7PmcH2B6iHLdevbyDYZYkviH74Ugl+OB0Yjt048SiN3fjULxC70Ug3s4i7Fw326z3ESs5EjYCXNJeBpeFsZVYV8jcNjc5LoKeKVQSJfVd8lsM3W52VK+8UmoU1Qb3v3mKX67upqdxoleG2NGqNl++zBSzvjrqmrIfG9ptWvEANB3COfRAFw0ks6bqMwamxgr0u9fdWCXZ9GQ59wpU38uTJy8o8m9K/tvqd6RjMNOtWO/+7WVYW+TUfT8gkP0XbQgex508umyx/Xz0NCZWrpdA+7GQ4c1aUOQFAwLOV4BYGzbPxHADxy4LGSIkEttc+6+XcgJTNy40gwc8lZveEbRIutMMyb6Sab06j4knb3EchYntOcKYQ/tMhXrQu7D/vTZeBeYxF2YL5VuENQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4870
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9561e5a2-8f47-4632-e7b3-08d83928b152
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tG4JRNevTldxjGGKqSjfrln2MxM9jR8xk2qOZYJW/P16xjJPlLW45+Se4ygZLOAYJA4Kd3sH7pn4o58v/i8+d5dJ79+Zv9fkEjN0WtGKCCWaeWDH7t9tebtGpfXYULGC6AGHEDycq/6oKROMb5vDM2t1HbW92uyMIUuKTcW37EYPPppL8gvvL+gVLzDOWjzk9k4dh+v5sJGW8QnlUnfHBa+sg3/vI7VTqFXcMZUiF+rjm9nXSoDISx2H2dB69vA0wsTOzJpTndnuF5k/WRXUwgJiV3mHOkrwJgVXQPY9MLOh11FNuJB9SyJmoMh+T8uWcWtMiVDRNC6QotZQ9x8qxJZrqwQaLDQsRlSJXvuHvuj1wEFjZmTlwYC0+n8Adt2VnAtaOQfdlBbWOHUFQwn9fg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(70586007)(70206006)(83380400001)(82310400002)(2906002)(6486002)(6666004)(956004)(6916009)(47076004)(81166007)(2616005)(44832011)(1076003)(356005)(82740400003)(5660300002)(7696005)(336012)(86362001)(8676002)(8936002)(4744005)(4326008)(36756003)(16526019)(316002)(26005)(186003)(478600001)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 10:17:08.6133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0a14a2-589a-4f7b-ad9d-08d83928b5f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3585
Content-Type: text/plain

Use the default one from trusted-firmware-a_2.3

Change-Id: I496db01818b172b109e8dab04e39a66bafd35a2d
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc   | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
index 555fb1d..d22108a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.inc
@@ -2,8 +2,6 @@
 
 # Intermediate SHA with 2.3 baseline version
 SRCREV_tfa = "2fe7d18b0d99fdf4c4dbf84863bb2036dfebc537"
-# mbedtls-2.16.4 tag commit
-SRCREV_mbedtls = "39e2c0eeb6501980764793e8d54c49c0a42bde48"
 
 SRC_URI_append = " ${SRC_URI_MBEDTLS}"
 
-- 
2.17.1

