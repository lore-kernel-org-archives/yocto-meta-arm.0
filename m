Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.82])
 by mx.groups.io with SMTP id smtpd.web09.52610.1629283542651925647
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Aug 2021 03:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Np4otZHN;
 spf=pass (domain: arm.com, ip: 40.107.14.82, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8OTsuWDUfzWnI86tDIiV7glbPKvz6drJTtSZNtFc9A=;
 b=Np4otZHNGLi3mYddIz2h9knmNEQDga9bTp4cG8QGoM1hW1MuuM9fXgDERKD4eCeJBj3vvdGlFptUwOwR7ZcB6noroGh41vFf0FN/0jMhRt7zeTo2fEOegAc6BXUYCqYY1HHro2ss38zwXLQKQqcTOjRsOojUhcGEu+4ir8CyFBY=
Received: from AM5PR0201CA0008.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::18) by AM9PR08MB7056.eurprd08.prod.outlook.com
 (2603:10a6:20b:413::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 18 Aug
 2021 10:45:36 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::11) by AM5PR0201CA0008.outlook.office365.com
 (2603:10a6:203:3d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 18 Aug 2021 10:45:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 10:45:36 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103"); Wed, 18 Aug 2021 10:45:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b47e978ba5ee532e
X-CR-MTA-TID: 64aa7808
Received: from 92a60057f637.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A4E9F6FF-ADE1-46D8-979E-82CA89CEFF4A.1;
	Wed, 18 Aug 2021 10:45:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 92a60057f637.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Aug 2021 10:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhpwT2omSd+UFSsjxRyUSxViWARcPWg7Hb5zAIA3BcK5gIOzXatfHbBp0VH/rrntE6umbN2L7N4+8UVxyYXf8are9VOXfhxFgjQ7UCboq4kf4s2WHItERO6vg88qFSUz24TzDSB9RaYoc4JHlp6sY0434hXOfEUg6W1Z2Flz7V4Wqs4nIIgMj5yz6e5nAvaJwpEOaLVojDYV0jXncdt1Gjq0qUahgwOz9m+0X9kWhf2Wg6Q+v0hyTArIF5uFg+WWnzkSXuP4fTI820wXGUuoVAHBUKrDNwWVZiTXOTan/FVE00rCcjSD/7KI7p/06FeLCKqDoNhXgmxXRJthUa2VbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8OTsuWDUfzWnI86tDIiV7glbPKvz6drJTtSZNtFc9A=;
 b=DI8KToDpeAh9MKdO2bwuqu/f1OoO2EyFZmBnZS7GgouSkx4WlLzgukMKBB5F4Pm/MkQwJebCSbJaeRPpankqN5wiKvcKeMSdXPjgvFbMw2WUSzfA/UK6bFR130DjmEjGkLWBgxv4hEgzGeoaHsg4KXwyJJjaC+gnEIYJCgWI3ymfMMacGYABDQC64FJ5y89zuG1JCiu5Q1X39dBFqDyp+z1Vwl54Ahn4K7jVGsuEWRPzMYysxcHTE6zUOHt6jWZoYmK1SDBwm+W1hF40VMgP8+Ebrrn6doF5lVQQYIp1nMKnVvFp9ZxeZx7/m4ecGOqq9VdCv/1xGkLwQk+5UV0PLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8OTsuWDUfzWnI86tDIiV7glbPKvz6drJTtSZNtFc9A=;
 b=Np4otZHNGLi3mYddIz2h9knmNEQDga9bTp4cG8QGoM1hW1MuuM9fXgDERKD4eCeJBj3vvdGlFptUwOwR7ZcB6noroGh41vFf0FN/0jMhRt7zeTo2fEOegAc6BXUYCqYY1HHro2ss38zwXLQKQqcTOjRsOojUhcGEu+4ir8CyFBY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB5976.eurprd08.prod.outlook.com (2603:10a6:20b:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 10:45:18 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433%4]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 10:45:17 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] kas/fvp-baser-aemv8r64: Pin meta-arm to a stable build revision
Date: Wed, 18 Aug 2021 11:45:08 +0100
Message-Id: <b709c711356a79518281995fdd469de0f18ec651.1629283480.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::15) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO3P123CA0010.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend Transport; Wed, 18 Aug 2021 10:45:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be01b4ca-7696-4de8-8920-08d96235500c
X-MS-TrafficTypeDiagnostic: AS8PR08MB5976:|AM9PR08MB7056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB70567372ADD63ACA83B852DB92FF9@AM9PR08MB7056.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 C/QOhnOevsu1XVQjsdNEJIyPC3y6hqASUOFuM011d5XSYYeMI7dFtjouvZ9lvl42bP4nRQ/Od5EuRU6f38AW4DN70sVQ+N3c0Xy1HPgC6smgfW9nqt74LyyxmBdt3R8wIPQEIHOwd6pjgIj1X/jhuY8vyCAoBPXqgXFf5Ih5QE0DEDOIFodrPEA38bEJ+wJB6c5hGH2O1dDxgRhPx+TX7QW2jM89TxNsR1diAEClMZKGGsXYhx7AOLnIsOdzYLhFrf3VBEAZrj8QhW0vR0M2WwLAfseSV2hAG+dGI5/QGsKDFPWdPB4y3L/Ehx7S1jlvuFUMYq/gZcFHW0qFkZ0X72DNWLwrIJQvgzZ2FH41xsAb44DRtS+ozTSY3DwqfxgaqRb48oiHglqzDGK18M61eFjb7NL/uT3mUrdWj9rY683yJ8jxwS7ke68nHCrfW3K70Z5KZ9AGb5M5CywcLHtyswxyG8TLzPbvAWLL7hGIGCpJQ5AKTJdJA/x0Dr20584Nb2DIs0j3hyZEkwLJsOHB36Dh3WqlhPBoKpYUpOrNK26ZsMdDvaFLOEX3vtjUsWF3c1ba+3/JB3QueIENSstEtpkOodHMXUUhGOj7pGWIQl6OwXE0N7LUuE4RYcMyQdhNtc+ncajIrZ0OhIzYihG4PgiOnb3UeajPNgJhYnEHDeC5g2FtbtCtYi0LkmOFJ1bClMJ7urNmmHP3R9n1XOcuc/14XYOKln0u0XCxqu3zBGb1eKsklgEvvfdPI/zPXs8ECVaPaKevwUtL6I9Cw8lYv32eAudaT9CRegSuAssRETA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(44832011)(2616005)(6486002)(6666004)(38350700002)(66946007)(66556008)(26005)(186003)(956004)(38100700002)(66476007)(86362001)(36756003)(4326008)(966005)(5660300002)(8936002)(2906002)(8676002)(316002)(4744005)(6916009)(7696005)(478600001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?RKQ8qPkaJra2E2FQAqIRBvRVHUI5m6x32uR+2TAXiNahQWNqe6nCLepWAZxv?=
 =?us-ascii?Q?bxVj28LN/zakv2rT9QJv+rWTp7kcaj6luBr+2Ebhdebdhu052J3hioupaXGP?=
 =?us-ascii?Q?cUvRO38Br/EpI14/jfwrx0ZHWz9z+F+/SRYWC4cA3s7QRhkiLuDE/H7dYHQr?=
 =?us-ascii?Q?f1SNeF1+oiruR1LUVu3QZhLs5I1o+iHZo69qTRKZ77yeTjQcS011VWyLjLjJ?=
 =?us-ascii?Q?y0hCR/uNdMCKfTG2VFMB6v+BSUcXljbr70wnaZrw3hD2qtXJGOPt6wfICzVQ?=
 =?us-ascii?Q?1ims798vs1ClKmnuR60kTo5b5zN6LvFwtz4L+jOB+GjrgEGJnfOW9U4zshHK?=
 =?us-ascii?Q?WOTTn0YhwluoAv5aL0wPukgCNm1NBFMyHR5p9oyU4sdsP0FHXCDllG9xhRFh?=
 =?us-ascii?Q?QUkzAtx5xS8Qar4vsEKCmGUG4QOD332RSYbDGYX2zAKomqtH0qA/CzGNnjWH?=
 =?us-ascii?Q?6T0EtvpJ2J5yaO7XxQFtROvEEJjJScz4e+yJ90RaOAnlMlzPYYMiPXdGcCEk?=
 =?us-ascii?Q?/HY+aYzZdipsIrhOiuFO5E/K4XQ6+QKFEthhGRJTIx6edlh1IBo/AiIjkeud?=
 =?us-ascii?Q?L8ebUW0x7a6odqplfoJuGmcTWKHMebEcM0W34hVINafM8jqe2myhIhwLP8J5?=
 =?us-ascii?Q?4RB66BWaRSj8ocqaFWW6PozscJeOqpoL9HUVykq2B3KHvy5Fntw+FTCzZJVg?=
 =?us-ascii?Q?EpDmRVxi4Rb6tTLjnMoPFzIEGhn3jtdJJcT680spslq1MiN9un6HrAavCeQE?=
 =?us-ascii?Q?MMdwWvBE+7veE5A+mn+xoIPnuNQBP8CcEgWGrtXJL15KwBKGZhZAhJzp4fhq?=
 =?us-ascii?Q?4Ofo1TMgmmy+/qcbi3GFJkMss4kMptopnkMc34BbdTqKSvFPx2r3He8AD4uY?=
 =?us-ascii?Q?axMW9SX3CbXjvbBdpYsfXNmMflQc8vEKHbK9Wy5rE1QQjH7Qis1DxkujD5es?=
 =?us-ascii?Q?M9q1vPXVX/uROm1gYOAt+63K+zIV77YiVZ1O7402uekZMrU/IeGubPLm7veZ?=
 =?us-ascii?Q?tvWviaKSqqWAjwSXiVIlyejAw2oHFrOv8AVCR3N5fb6irG8b122RIAdysxAe?=
 =?us-ascii?Q?67Y7y51nD028F2SjD6pYnS1W6MAIznN2JozeFs1RJ4qsS0DYzbx0Lz2r1uWq?=
 =?us-ascii?Q?+D6pjXdMQKJB4dyKgC24LYHfL1zx9tc9tlskp085u5Gux7xTwEolyGTZhVUZ?=
 =?us-ascii?Q?EffCnXHj2w1sl7RYcT3iwfhOkEpIup07D3szi41tX1rT0yPTohWRLePyqEA4?=
 =?us-ascii?Q?HRYI9XM1V57oSZ/wPS6tzsCYhVraKQNwViTndVyqcGXaKN38zsXbM05UuVIA?=
 =?us-ascii?Q?NrlhfuDapDnUltu5slKznnZS?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5976
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	36364698-26ec-4dd8-beea-08d9623544b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A0BfQNnOFp+TITKKk647HyjgloUfRcBEDdpPF6M6DuV4L3OsWIOVZRns4AADgNG0u52siFUQsHv2/QO6DOJexenmUVeDhk1QALs5eyEJcFJewTXY2QKjCn2o/Lc0USQKNjAAewgqvfiTqpD1iQZp57yGimPtkmVyX5y3Av3lUIvTwTrItkMZUnvXUT7YAUkjHxFCcbitWv/t09nyvvhix7NhInvNXh2jPGC/zH5UE5B3GEx/XxiL+YE3v1hvUQOR4dYrpPmimnWzzUfbT8rJvkwSi7hD/ZNizgp8BSVFykTVf24a+7zaoUW4beWtxkSYaV4s2CGI05AX/ZpiiAHhQepUyTVYLhpHh/9KhYaDXHG7QcES1yvDuzQHT3VPll8Hipcc0qIMUoBvzSMw/Pn6fB6wHzVWUVBZ2Aq9yXFeARbfc8LNyWiqXWiGGe33N5Pdyz2vtcnSRk/9TDq/VDlwS2p5nBDsH5no+PM3iVgTr4btOfKZox3EDums9mFzmDTFvl6w+4L3ZXozQNhLhV/oLT3IYZ0grtzO7kEoKsPjaU3Sburd+rpx25NEwJIPF5BBNc6cbT2mDzT1Y5xX5Xx+vU2PJW/kLNQvp/Mi+l9p77OxfQ8FyjpUg5gVuOF1//JrlfQXI5zCi1J8KarkZoh19byatVxWFikkaQ3svQYpW/vKF4+FlGD+h5LsxwcgPszrl9vdjw6SX1oltRlaI5jHCN+dFxEcijUBNxJgjUSrT2QevcV0Mrf/GiSvGZIwrFgBldaIgMJHui/jjxeJBpXd1pxzoD5nftmG9HWXafTQyU4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(81166007)(47076005)(36756003)(356005)(26005)(86362001)(186003)(4744005)(2616005)(966005)(956004)(8936002)(8676002)(7696005)(4326008)(82310400003)(36860700001)(2906002)(6916009)(5660300002)(6486002)(70586007)(82740400003)(44832011)(70206006)(336012)(316002)(6666004)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 10:45:36.4573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be01b4ca-7696-4de8-8920-08d96235500c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7056
Content-Type: text/plain

Issue-Id: SCM-2989
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Id3e1362a6a727102ca5986e5e781280442348cf7
---
 kas/fvp-baser-aemv8r64-bsp.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.yml
index 65b1d54..33dd7a1 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -12,6 +12,7 @@ repos:
   meta-arm:
     url: https://git.yoctoproject.org/git/meta-arm
     path: layers/meta-arm
+    refspec: ce6c4936e53ef9afb596baabafa893234d914c20
     layers:
       meta-arm:
       meta-arm-bsp:
-- 
2.17.1

