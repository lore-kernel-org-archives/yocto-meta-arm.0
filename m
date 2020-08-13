Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.52])
 by mx.groups.io with SMTP id smtpd.web12.11546.1597330377903880673
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=gykC4bns;
 spf=pass (domain: arm.com, ip: 40.107.8.52, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNg3AqTv4bAmnpIYJ/yr6o993Quq8Yjzo+nVIbXzeL8=;
 b=gykC4bnsaaUQLrNiBTfq9RUw3n0HX5c+N3OtppQB1p+OTfdxJZW9LbDs7p4QlJw7yeR0d2aw0UoNLWqNaJ1iwYGoFVVo8+mJxde+eAHV7FnJAa71QsGJ1sQZUkpsh4tSsyaTVt3LW4USpBfz0zrS5taG6SOnPe3zgo40+hD6X2w=
Received: from MR2P264CA0135.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::27)
 by VI1PR0802MB2623.eurprd08.prod.outlook.com (2603:10a6:800:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 14:52:54 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::98) by MR2P264CA0135.outlook.office365.com
 (2603:10a6:500:30::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:54 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 13 Aug 2020 14:52:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 481e085be11b132d
X-CR-MTA-TID: 64aa7808
Received: from 618ea1642277.13
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 49FD406E-4501-43D8-BB1B-80E4169E8044.1;
	Thu, 13 Aug 2020 14:52:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618ea1642277.13
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0mKv11lRFt5GIiRx7qxj6hqMbfe3+up/MsBmVe/g97zLKztKPufq0FKrk0ndhJwcBzwsgKaf4rZGsQAAsaTgu6xy6kb5zU1aaWvq/J6pvpYR1J5e1EBKrgeGWAPdyhh7klb9VmwDzFbAiWD8qLY/LwVElArrQOjO1y3dADliQJix9kXmyjNHALKYvWO1hyPneil/GZj/nT+FB8OkKhXGoV+O3xWI43iwyu9uRI/Clk28zXasPvxayBEZ3WOEjSjCivIen8fIkdzvIHKjHiBt+3Pvyj0p/dfYP2g0WVLFmibI87FmUtC9ax7xF7fDUXkaVTAYpxt+uGt+Ch0rF7H0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNg3AqTv4bAmnpIYJ/yr6o993Quq8Yjzo+nVIbXzeL8=;
 b=DO2NnclMKvaWiu1md0I9KAxVUn+qooLbEACNtRcuRGfiM4fCGvYOppFdpx3dA+guchVW6uRfNpiMijcSDzYRUT1VGbTzRItgeL8gAGyxu0davVLucQjhe0q4ADlCH7HM8nV481MAaJ6SK1PngCd40kOZ7ev6creeYPrwNXa7kZ0tWJxfTpjXWpf6MXSVL9eauAdiqdAFqxFjZ1tDIlR0XGjLkfDMfg6obk+Xrv6+RV3PVDZRw49oODS+S34ZabHYHlBGUbZfLnYK+/F3zDIK2th/zptYleOLuPIB5IGkRX0lTGVBozT6hH0bPP5pZuj4Gj0abBmCt0jzyOLVtTTqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNg3AqTv4bAmnpIYJ/yr6o993Quq8Yjzo+nVIbXzeL8=;
 b=gykC4bnsaaUQLrNiBTfq9RUw3n0HX5c+N3OtppQB1p+OTfdxJZW9LbDs7p4QlJw7yeR0d2aw0UoNLWqNaJ1iwYGoFVVo8+mJxde+eAHV7FnJAa71QsGJ1sQZUkpsh4tSsyaTVt3LW4USpBfz0zrS5taG6SOnPe3zgo40+hD6X2w=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:46 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:46 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH v2 8/9] arm-bsp/machine: adding corstone700-mps3 machine
Date: Thu, 13 Aug 2020 15:52:29 +0100
Message-Id: <20200813145230.22140-9-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:45 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a688445-1d18-42cd-2bb4-08d83f988f41
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|VI1PR0802MB2623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB26232AABDB66107A65BBD74FFD430@VI1PR0802MB2623.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 esZGdYPnu8CNHhFxPM4foUOuB9o3JZNCk2Eum8Hnk01XRQomOVajyoYHHdmYUBmLeyhF/cAJbIJAVLxiQ5D3+gd0HmjdfNCQDqNGL+IlDkVYkp/GipKbnM1qBc6bMfAfAJH3wO2hUWAyVrSN4L//WFZd61QADJCN785Y7ylR3YqmMqT5A3Sfj7kEGtcApncEYe74dxtCAVat8I8iCLVBFlPObU1MgMe3GVt3xOn+iOvB/4/Y7TJTSkcPHGPwDns59rdGqy47HpQEhXB/LKQ3/HM6OuJ16zdJ3eguztosaAxqRrjTQoKxJZq1qdzVGJA+RIfxhpvPsQh5FQ/iVhzMXLxy0dalBd6FIstxiFxaW47gV8BWtzWw2X7kYA0nm1l/kh+Rjba51hyQQNwYg3MY9A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(7696005)(2616005)(956004)(316002)(54906003)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(966005)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 3ISmn1yc98fzZvuvlZR1ifNJQwbHQIE3HdBi2cVOLJ/mzqCSvJ72e6F0MM0YCVTzYTjfYqO+SiLtgIeGb4nFcK8pQEheORE3T3byiAfwFnYkzNfKOfj2PJfaxSaHDYF3NTOs8+hrU1UB5rFob+3jCAHDfZPRCkFavFwYxWexEMrFob0oHkPAtG64uA20tGChf1PfWh9rh9SnfXXb8BJvfbjm9v7zY1BW5Z6F/EgR2ElbouzK1rgVvWa4PEv6wpyeIeDOxhi4iz9u5IoUQJ2jD2uCiHM8NcpXXI+8pjReQqaqWV/PPCw4BRhIlmLKzCHbOVmdCeDX/azT+DVJ3y0TBmgGlaAlYW9JxaEDE3B673cLWVdm9T+Ip/uA3zblgnVsN8MXeFQc978OJaHxAszlFOCB4vO1yOf9UTnarB3EcrbLjqAkw6vL961RGUU+Cgo/y/oQc1v4/MKTemYOjE6AKnrW1eGwxxNn/+gXpOOCftdsbLQ38PGw0zu1mfEZmIZZQnHSyWoX+B/yaupN2lgRcs4RkBAHE+iC8RGbLTqp6gsYtAUHQQSFj1GolPxqx/UH9S6i9he4NF0ud3r1tXdPY+5+79VZkx67KgrU/hJlZmaP8nm+ENBsXkEBF/acSFBXBdarkmEuh8udqfJYAlIVEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17eccc22-820e-41ec-4e29-08d83f988a2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TUUeAwkPbhEKrHGAKr/Qut9CteM22s7UpnHOjSFxiNnEJQsTW0IO/IkeiY2FFPGj6diQTyS+s2UFPbQYWmp+MiD4ThZ1sDW38geSnkZET4XOZ5aniPuQm9XTxBZ/KBzPPn7DeQ78A5WJR5T7zpP4vsS6C8xhow59pBYKEr3KApsjfOBoo8vgNhSSQ5bbAGaSEaxzIJvBvl2IA5lr4ZFrdxugZJ59hvYgX4al0PALOuNfnG4RMcCcnOIjRnSY8PXJuGMIk3uKRzWg2HPwUgR6uEkH/OvUer93wju1otJC/VlN0kxKQbNegGbEyeVJHlCbN1nNNlY7EHyQ0SxVYZzeuETBKjehg9GZusibcw6R5ns8QR3Wc0iCEf/vt8rfRbMexe/l+A5VcuUCE6VPdbOH/qKBRINm0amHHmXu7KAFoboZqyi+gA4LqqELTEgre03IpVLwZzojFxrRLJ7KSpFb0amD9JO8epaHeP7WsGhFs+8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(70206006)(7696005)(5660300002)(186003)(966005)(16526019)(36756003)(36906005)(26005)(54906003)(316002)(86362001)(336012)(4326008)(70586007)(6916009)(6666004)(1076003)(956004)(2616005)(6486002)(478600001)(2906002)(47076004)(82740400003)(8936002)(356005)(82310400002)(9686003)(81166007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:54.2817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a688445-1d18-42cd-2bb4-08d83f988f41
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2623
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This machine provides corstone700 platform on the MPS3 FPGA board.

For more information about the platform, please check:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444/corstone-700

Change-Id: I7b654fcb8dc5c6efa261a1413389271df87534cb
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/corstone700-mps3.conf | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
new file mode 100644
index 0000000..28d7050
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: corstone700-mps3 machine
+#@DESCRIPTION: Machine configuration for Corstone700 MPS3
+
+require conf/machine/include/corstone700.inc
+
+TFA_TARGET_PLATFORM = "fpga"
-- 
2.17.1

