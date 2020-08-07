Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.59])
 by mx.groups.io with SMTP id smtpd.web11.4271.1596829409729965512
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 12:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=t2x/Ksa9;
 spf=pass (domain: arm.com, ip: 40.107.12.59, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0gwyDKoqtUnefSYnIzVN/gYucavQrzR1xEd6FEUIv4=;
 b=t2x/Ksa9UcjV4nJ/QYNfF4qh5uHeuoT+9Zz/cha21Whq/LWYoYfDsnRq2qRA0DknqTENCEr2bJ5skTmROihZALtIUcoJISWJCJPEpctqkcdXfdMn5a+xIAyGBEO4LdPKJkG5wOfLgkqxEyX7IvgufbAIAN3sCzA+Mnytzdrv6Sw=
Received: from DB3PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:8::48) by
 PR2PR08MB4844.eurprd08.prod.outlook.com (2603:10a6:101:1d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Fri, 7 Aug 2020 19:43:27 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::89) by DB3PR08CA0035.outlook.office365.com
 (2603:10a6:8::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Fri, 7 Aug 2020 19:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 19:43:26 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Fri, 07 Aug 2020 19:43:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09523d43c4df241b
X-CR-MTA-TID: 64aa7808
Received: from 77f7555ae79a.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7C8F2AC4-80A4-43C1-9963-A342E04E63E2.1;
	Fri, 07 Aug 2020 19:43:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77f7555ae79a.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 19:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9YCs0n49UAXPTBzD22+cdvmLp9TQIDFGOJpv0g/iShswSOqgykDhAkoi8Q1V2kVFh/Vm0w5AHq0q5Tyg2f/0fjic9/m8td7EcnRfUpNODtLfAumbR+zplK7/77038OKZUq1k3T2270NbY1sOIKsRef82QO+uvF98u1odIcpIwoq7GsGFndcEgK5LyPqvnRMfG6bONoeRCpIWirkogERlNUpHVIReibkkp8MBMXxIyIDELcdx3+0r7nMDd81YrUjrZcX4aVxlQ49ps3TTbJVdITKMuVdN9ugaRee2qkUF2YkQ62mvr4A9X2MdASKCPVzKcVDrfag0Wv7e84DijTXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0gwyDKoqtUnefSYnIzVN/gYucavQrzR1xEd6FEUIv4=;
 b=c8Nd9uE+qneZT5MeL5CHkw91pJDqTtuGBxbU1sL7JjoS1wbCIudOsJ4FtkhlmRNOs1XEh0Nh/J28ZkKgNJfTBYNAunKzemU3Xb1l5MgEhyWewuo1sIRJp6p1f66xr2ej6v0VMvgIL430nGM/pO0Zid3Tf4XxOFt6H7xY/NgbxB3FyUupsTK3B2ysjsAn2/wJR27Zjm/o49QK7aMAvCPf4TuwtQR66j2dEo5fU1+3KAt812s30uh0BRKzWLBlB695U6ylL85MrTiQTaDoBBM1J+J2dV458nEj8R+mbk/hxFHbtz1oiLx44cJ2lfvtD2UJUqLjgQ0zvHdvI8xyrh0EaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0gwyDKoqtUnefSYnIzVN/gYucavQrzR1xEd6FEUIv4=;
 b=t2x/Ksa9UcjV4nJ/QYNfF4qh5uHeuoT+9Zz/cha21Whq/LWYoYfDsnRq2qRA0DknqTENCEr2bJ5skTmROihZALtIUcoJISWJCJPEpctqkcdXfdMn5a+xIAyGBEO4LdPKJkG5wOfLgkqxEyX7IvgufbAIAN3sCzA+Mnytzdrv6Sw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4868.eurprd08.prod.outlook.com (2603:10a6:20b:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 19:43:20 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 19:43:20 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 5/9] arm-bsp/external-system: enabling corstone700 platform support
Date: Fri,  7 Aug 2020 20:42:49 +0100
Message-Id: <20200807194253.14748-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
References: <20200807194253.14748-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN6PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:805:106::23) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN6PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:805:106::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.2 via Frontend Transport; Fri, 7 Aug 2020 19:43:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6d1b15d-4c8f-4646-90ac-08d83b0a2738
X-MS-TrafficTypeDiagnostic: AM6PR08MB4868:|PR2PR08MB4844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4844E0EB27FDB95D3F398FBFFD490@PR2PR08MB4844.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:205;OLM:205;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OwFxNMLAJkJtPOlg63e/Bn008og751TjeSt0vHJgVAyvwhYrSktz1wfPP3lLcHbj28gaL6P+lPpgEfN0etZJ5QbkBZ6uYhg9PWKSbkX0n/qwL8lbQgqOMN2qISLCjNT/EQ19YCMoH3VTzBShWzL44F4hsRMcbIBwshYgEf3N+wVRJ2NEOW7J1t2/3WYUrMCixLKCbETrPMbzoW4shhe8hkINNOHBiJ+dit7LnF2Vsxff3tJde5OWVgsG8F+V3QsLoFQlfPrdjHEBqHlgfaUZzpi0VKV+V7XUy8zCmuCPGLpFJOptRDP7wc7D0dKihYm7
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(83380400001)(8936002)(4326008)(6916009)(1076003)(5660300002)(956004)(2616005)(8676002)(6486002)(54906003)(26005)(86362001)(36756003)(52116002)(7696005)(16526019)(6666004)(478600001)(66476007)(9686003)(66556008)(186003)(66946007)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 9ddtkpZyvzZdEpShAFpUflqp8qYtZKpks0b98o2vxNmz+3ClCSGHmEG+di6iD6etsNXpTYEpXwhVt37Cf2Ao5vG/x0ewe/GPFDXiiZMw82nyl6Z6zGmIMsxzLzXbzgmqXZ+Ef3M8pH9f74QC4nfqBMeXhPNZbvuYUjgwvbZMRGNIuJlSTq+7C19YFy1LnlkWnGqic/PYiY5w9564EzniDLLDe+8kNDzgt8V51zCxL4H7LSaefvX3qvETivcXUEE0BFMx4k+S6Q0vjn4id6dHZ9iKFfPVAkRVDWQemxQ22amSQGZAvYOX21NIhX44t07aD1zWK+YfKSt3g9Pw+wXg9hWDpbjNSxMN3jSmDoSEcy9rmx4l1djBTG3P6XIUQJi5JW75GvNS4rj5NDrL/u8f6k5ZV9dcFA2KmNVFokjBWmhT8zPh+dzFrCB9vgR24tyCB9YZ49lztjGu+/t7IGhqszK14ekselLr4PfM0NfUW1fsnM7SD38gkPual1+jXJIrGvvXquGuKVXLwOkOG+MBQxZ324POZ2DBa5S9erEU7k6CE030O8EPvcntz3qHEUN84lkGLlQc9GcV/J8Ph6WipKhs9sDzt5/NVC7RUHISY7XwAfeFkSkA8KP6q4PZ8qFU7IjC3N81cGC5JQcOW4oFYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4868
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	774851b7-3d6e-4d33-9b03-08d83b0a2330
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wjuz6KOTN0ocBV+PElnLolKgXDNxLE6ZAp9ADFcFOOQxHQ0Al8dD+Y+YM1nbF14tOuxg4s3q5fp1YVR/0HcBXIw3miIpAVUTeUpdNgBiGPMsUpGritwntUEroTmGRrGziDx3LbsINFlXJSXelVSigzSRf0gokk8ZQlk8jcE2iYPzfYEP894BTLtnmfv94Ig1VxeQNnCxt6Wtglerg+a5S91MNPJMgTIP3s0atwxgpZHxSbeUt6JQiz2hAMpWFKZczXmfUXFQhaXFa/Dji41wvSeSDT3DUjcAvGJ5B2JRdv9u9m/5/lXz3UFVn6kD2EdnLaP/2gczhz8AOmGDJNvIrVHTRCY73FFhk3OoMikq9LhGN/FChjkLr5Jp/+bZTtDO5sfUkq5wEw5A98OB4P4v5A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(86362001)(8676002)(70206006)(336012)(478600001)(6486002)(1076003)(8936002)(26005)(956004)(36756003)(9686003)(2616005)(83380400001)(6916009)(82740400003)(4326008)(54906003)(5660300002)(16526019)(6666004)(70586007)(2906002)(7696005)(47076004)(82310400002)(186003)(356005)(81166007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 19:43:26.6585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d1b15d-4c8f-4646-90ac-08d83b0a2738
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4844
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit allows the external-system firmware to be used on the
corstone700 platform.

Change-Id: I746a970dcdceee60d91152e4315afa072ca843d3
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/include/corstone700.inc             | 2 +-
 .../recipes-bsp/external-system/external-system_0.1.0.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 495fc30..4c00c6d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,7 +14,7 @@ PREFERRED_VERSION_linux-stable ?= "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
-EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system"
 
 WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 0aab8ad..84da7ce 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -10,10 +10,10 @@ SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/external-system.git;
 SRCREV = "41ef76951c5119729c1ea305406f74776da90866"
 PV .= "~git${SRCPV}"
 
-COMPATIBLE_MACHINE = ""
+COMPATIBLE_MACHINE = "(corstone700-*)"
 
 # PRODUCT is passed to the Makefile to specify the platform to be used
-PRODUCT = ""
+PRODUCT = "corstone-700"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.17.1

