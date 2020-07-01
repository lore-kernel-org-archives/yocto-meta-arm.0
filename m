Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.50])
 by mx.groups.io with SMTP id smtpd.web10.24345.1593616848223622211
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 08:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IVwFH4s7;
 spf=pass (domain: arm.com, ip: 40.107.22.50, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51do6SxXBbo2lH38lWeAJVoyBaadhWFzENkv4vMZQRI=;
 b=IVwFH4s7dElDPmaPqO5Pbtjxz1PK4l5ub/KbbtcnoqvHm5KAXkwYPvGzLLAtw49Z1Ru0zhaZYNP+VkB/NDQ7+vpyTl/Hj2lk7uqVGLC3I01caG5137wdLZNccN4dGPcJjPh/O3hFPzlL3h1WBu7b48ZrrPWn0pQmSqEMNfLHxCE=
Received: from AM6P191CA0084.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::25)
 by VI1PR0801MB2013.eurprd08.prod.outlook.com (2603:10a6:800:8a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 1 Jul
 2020 15:20:45 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::b9) by AM6P191CA0084.outlook.office365.com
 (2603:10a6:209:8a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend
 Transport; Wed, 1 Jul 2020 15:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 15:20:45 +0000
Received: ("Tessian outbound 114f46c34313:v62"); Wed, 01 Jul 2020 15:20:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61c8b4b370873680
X-CR-MTA-TID: 64aa7808
Received: from 51f34723ff30.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5BB9B9BB-2B02-46D0-9DA8-CC1F099728AF.1;
	Wed, 01 Jul 2020 15:20:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 51f34723ff30.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 15:20:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwOBRdvgtNLGfxYBdfMzT7vUWBf5ImfyAhlG4hgGQBekdKUMFYWe2lDu7Vp+kSk3pynoAEzQc2K8jJSal+COiyBG/f5j7LQufTzNy2AHfwpJRk4OQ1/iDlz87M5YuCuynyvFssQBX18aVD7j6jyNpncdVfFETtbp9TGtTiTVfxpPiBZQWoIDXvVjmrXjK2hoqrWN624fOul2RQ3P8xtahVDbQFcoyWieoahqM0FEF9IcHz2gt5UJoYll4kvqrYTImab/GLnMyL7XYY9VowkJz7WH3DUs/PXyV9+sl2Lc1hTwcVNuUxRcGy1uCRTlgenz/mvsdUrJbzfHoIoyrCDiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51do6SxXBbo2lH38lWeAJVoyBaadhWFzENkv4vMZQRI=;
 b=GAEYIHsG0X1wxdB/OXB3DRO4fHW9vD8EZJFIGHd6RK4843zEGzqXD4XUCXPPJTqLsiKjCbcjBeEJPlnBEkpuU1d2fdVHql1URo65TsqGDP9OxwHRgemPOvyn9Dnl9R2JWQy7ocqvI2c5uOB2Wv8f/Goi87Bw7wUhDYuQUefeHXEzNlZwRjlTqpnqnn543lFGiO+Ngs+Fw0yJ7jNbh8dwBoksJbG16bcfCHeu9Z4eR38DYjzUpAd8aA/miz1d9tDGDSrPiEhLbprg0Xk9dD5BITo9sEuKo707mlbGqQvj+qQ/i6igt5Kxr6wz1RVzipBZGK91jI5o1tEoLoxsobh+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51do6SxXBbo2lH38lWeAJVoyBaadhWFzENkv4vMZQRI=;
 b=IVwFH4s7dElDPmaPqO5Pbtjxz1PK4l5ub/KbbtcnoqvHm5KAXkwYPvGzLLAtw49Z1Ru0zhaZYNP+VkB/NDQ7+vpyTl/Hj2lk7uqVGLC3I01caG5137wdLZNccN4dGPcJjPh/O3hFPzlL3h1WBu7b48ZrrPWn0pQmSqEMNfLHxCE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DBBPR08MB4760.eurprd08.prod.outlook.com (2603:10a6:10:f6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Wed, 1 Jul
 2020 15:20:38 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 15:20:38 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/wic: add default wks file to create EFI disk image
Date: Wed,  1 Jul 2020 20:50:24 +0530
Message-Id: <20200701152024.16320-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BM1PR01CA0097.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::13)
 To DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.53) by BM1PR01CA0097.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Wed, 1 Jul 2020 15:20:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec81df59-8419-40f0-ca59-08d81dd25382
X-MS-TrafficTypeDiagnostic: DBBPR08MB4760:|VI1PR0801MB2013:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB2013DFA2BE46B8688655D654FA6C0@VI1PR0801MB2013.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SitMJ0Tqo5YSI85V3aAYIG2zLMJr6OR0hcgVS0PoWdIGEeYeyTWK3qnEBcVkaovvlp4T8yG8y+Lp0AuIZOtHw0erFSb/Tgib3crwFErki17eY6592oE6ZvSGWE+h5NO0UaAUCxtVZPbHlGS9mOLSjL4un2DxcvQNuNBfcgOrz/gpSfPSp6NbzKVF0F7InwIjMMAu8+rJqH49YYoXrbzOETx828UAinKRoKZet1izCmweuDB8HEv+58G1iKjd3UVgyeNTQFJMJ7pEZS3ZBRlqqRn7tpAQSm6lyvGSVl57/68YEKfTsnaOoexWJm7IDxadTFiU9y61rqude4pvJhBARw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(16526019)(186003)(26005)(4326008)(2906002)(6916009)(52116002)(7696005)(1076003)(4744005)(66556008)(66476007)(66946007)(956004)(6666004)(2616005)(6486002)(5660300002)(8676002)(8936002)(86362001)(36756003)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 au1Zs1QUQR9GJMjeCtMGdAyb8TQyh9y/j6wmYGpCWRQFyHsSMjmO32jOAVttmUzQhKOkHMuSkRKnAhsD8hzPM5/Tgtf7xtO01kGFzi1n+Yr/Tb6bONJFvXC8UPLKDmzpVmMHjBua+8htf5dxIK4z8an/QejqG/A38XngHjtUoWjZdQWUT77dc9IR8u8G0DddYMByu+UMAyB4dvDbbSmRVBtCMYQg6PUw1RBaohevjmyhzs00K2WeILzxv1LL+pOddcFPFJdOYjL/R5UPoWdgjr+5ps6/S6F61b1MTd72C3twEeXFIvlnKVysEcqnmLETaRZUIrXOKbqZQyFR6TsgPTMwcLjn73zfaK8tCtRGd0FIJLLmJjQh2xbf+EadEfwB3j8PpVwg+7lqEXLyESBPxLNRICqeJlTipzQLa8jal/TDAlZiYnW8ynGlgGoOHUE9hk6s/cUt4T62JVSrzjaKcMAX0K2MYUGFG1BIj4ct+7mCRqJSaAmk6EucfEmBr5nk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4760
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(6916009)(6666004)(336012)(4744005)(26005)(16526019)(186003)(2616005)(2906002)(956004)(7696005)(1076003)(316002)(47076004)(36906005)(82310400002)(5660300002)(70586007)(8676002)(86362001)(36756003)(4326008)(70206006)(356005)(8936002)(82740400003)(478600001)(6486002)(81166007);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	12071e6c-01a3-41b4-208f-08d81dd24f0f
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d3zYPMTFqTLLXEl+p6FIQMl7bopSNqHnicFwjaprC1GBnw7EB0VF0CU9kprRmcxpg5mjw4piDdJpYvyh6/AB5ow7RGbN69VkkdiC7oSrNqJqz7RD5IVSFv6CEusTPrRwH6Xgtf3R5ExG5YiiYrBumz1GZ4EUtcQFa0xHF9fF/FX805z5AhrabdlcDkn1vL/Ep5n6rqkVPB2ZeyfdySPlvbI9dNLYqv6qq+vgI/LbigypzSfLmzTKoyctsYYB2ZrXbGSYUmBzu3ZOy/AiGYa2q2wEQR1qyBF3oPebLHB5bFa2xk9GTXtvTomK8S0OjTR+Ky2/zowFJhwo5HZHjTJZ8SPxqZAyyjRk2GEUdlmGVZjiQBWiH780bnnznorcq5ntew+6Q5fbk7mft6gbXA2eSw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 15:20:45.3804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec81df59-8419-40f0-ca59-08d81dd25382
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2013
Content-Type: text/plain

Creates a partitioned EFI disk image that the user
can directly dd to boot media. The selected bootloader is grub-efi.

Change-Id: I1a5e8bc953274cdcc1840b27351d8e6444b2c5ab
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 755bb09..318b2d0 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -15,6 +15,9 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
+# Set default WKS
+WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
+
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "5.4%"
-- 
2.17.1

