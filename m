Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.81])
 by mx.groups.io with SMTP id smtpd.web12.7203.1588254675782720181
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 06:51:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3UEuX0HN;
 spf=pass (domain: arm.com, ip: 40.107.8.81, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCCIwGU7HG0JkpsgV6cu2e3Q4NSCuiJJkR02UfAUklY=;
 b=3UEuX0HNAXvB7Tj4wNi9O/Z0XmX3QRitO8WM7twhu6bh2xr+kap9uX6+E4zXX/JqRaJePyP/qOiLHgJV4LKlpblQi6oD6wOM/CTfTF4pew82Aj6PU/oe10rG0konl0Q0N/xCOwPN1lGTWqlKJeERSH3ED8g8xeirN2eXEs6Z2S4=
Received: from AM6PR08CA0039.eurprd08.prod.outlook.com (2603:10a6:20b:c0::27)
 by VI1PR08MB4478.eurprd08.prod.outlook.com (2603:10a6:803:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 30 Apr
 2020 13:51:13 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::9c) by AM6PR08CA0039.outlook.office365.com
 (2603:10a6:20b:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 13:51:12 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:51:12 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Thu, 30 Apr 2020 13:51:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ba6ad44f4d84ae2
X-CR-MTA-TID: 64aa7808
Received: from 9fca05b080ac.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4CD1CD78-20DE-4CBE-B391-42570783C69F.1;
	Thu, 30 Apr 2020 13:51:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fca05b080ac.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 13:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Syzl7a/1uUgVhDhJA4AbpgH3ebI+SuCHo8lGW0WUESVkkYeuV47xREnsKc114Lil4ZfYQNBo3HAK6CLBeXUGwmsweFzD9FLIITnbChiA2U2PLuzaoNynvUqSm3f89xGQuD3K2iJhmSW+UWXCiDo3hRaxhf61pY/iGhAhS6YmTMrekMYguxy/vu01wEQKLximcBYkeekWu/M6nnRHd3xGNx7giwfkbgxliK2mkWM9WM/r/tTCr6Ui7QbIiD89wVkX5QKJleSpQ29NudZbOVSmrXsCCKa4cpEAUjLIIdagEaCJLjo9ocNTLxn81Xe4CiJ3GOcwoo5k6lo4LESZU05/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCCIwGU7HG0JkpsgV6cu2e3Q4NSCuiJJkR02UfAUklY=;
 b=X5dnmAFQ44Huiv22/t8FRfnKrUOLDj8Kw2xuxrINJ79pgm1x92LxcnXq4i4fQgcgLCbkyTXod0xlpjXSaJLJ548HRuaCxsu6M4SQb/e+bJw7CvSgRuE7n7VEDjqSbsnuimvV1KbVIZVZ+aWPcJ2lU4KtbP3zE2JXZ9NPBn6R65yXevwRW4unNvfAORj39Rlxml0z4qNJF67rQu/b4tg3hVpY8zzpsWHFCH3y2n5qId0E/gqz4KnKFdw1kcZJpTDhqm8MWP+Ib4fj3Q0vSsfoS8sgDpRdpEzph85Ode7qh42TvxkZf9pnUQdBQBWclb5g6I+KQn0/qiSytg6gpNcdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCCIwGU7HG0JkpsgV6cu2e3Q4NSCuiJJkR02UfAUklY=;
 b=3UEuX0HNAXvB7Tj4wNi9O/Z0XmX3QRitO8WM7twhu6bh2xr+kap9uX6+E4zXX/JqRaJePyP/qOiLHgJV4LKlpblQi6oD6wOM/CTfTF4pew82Aj6PU/oe10rG0konl0Q0N/xCOwPN1lGTWqlKJeERSH3ED8g8xeirN2eXEs6Z2S4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3556.eurprd08.prod.outlook.com (2603:10a6:208:e0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 13:51:05 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 13:51:05 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] [arm-autonomy] Have meta-arm-bsp specific bbappends as BBFILES_DYNAMIC
Date: Thu, 30 Apr 2020 14:51:03 +0100
Message-Id: <1588254663-86702-2-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
References: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:51:04 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27c41a18-5946-4266-0560-08d7ed0d8b40
X-MS-TrafficTypeDiagnostic: AM0PR08MB3556:|VI1PR08MB4478:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB44787BC0D82D5B5340D15EA892AA0@VI1PR08MB4478.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:792;OLM:792;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 r3K9xbhZbi4GAm0eunTZ4f1+MUOQVG+4XxibtYhH6HEXPrTZeozVzYQMTsHgCRqXC2GwgBS7WEsfwTZnFdBO9124F88BXwf3Pp2gryOZB78UrgUIW6hI4fAshaib/1pDdhRehQcC2cSp3ZW/1FZPdeyGGSAuSDXZqgWlbfynZi4782HpbYGqdlnUsSMyLm4zG0eFN8m5E/qlVs2fbKunvGorcgyMY8Up0+4h7x00Yinkoc66BMYZBYzNVAnvL/wiAT9675m5yeLlXgCQ6J+me46XKNucIM9xCt6yGnEok9/xFQI7/bEBd5CeAaumLzbeYw9OemwcwJo67c9Mbln0j4eIWmWHp0C/gGh7pjkVQykJ/Dt0jkYHGMxAcTCLpKhJMn04mA7zSv5bXsu7BI+tZiGeEzjpT8dVqJhU96oS0mSsD3ZMuqI8W1Z6TEO3A7zc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(186003)(8936002)(8676002)(5660300002)(52116002)(7696005)(26005)(6486002)(86362001)(2906002)(16526019)(36756003)(478600001)(316002)(44832011)(2616005)(956004)(66946007)(6916009)(66476007)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 +r/DCMcixk/DJmYwXQLnaGfB9fwXl0TD+iYhjO5D4SLosOmrvgmK7op2Tk30iw2BZWdHi/ISbpeWhE368gGG/xqkbnwRSdzPaHDEznsxIHzpR6aWEG7aGP1TETb+Bcjm9wItDILsQEXXSeAwk/nF4Mwe7UR1wYae6qN/3XCGBGTMSt/yWMHJbgsb4D8xCwzXJQZy2lTH8hcB/Tv+j1R5KTrAZXTBRS53/Z7Vt92pcZPfTjm3fyKM/vIuHkHCi3V4gqAns6aV8drIhaO25XPwNv/i1vmhNQiyBEik2m+7dqte5+ReyQzpKKh7OwN5Acb7DZhcqlh3rPffaYxxomT1CmhE6ezvxqOPB8eEFecEfMpuHkXfvSrBaVzR1eGPo8Li5S/pQif8Z1LIAwW5/Wb5mw/Hb2fcDwQs/D43wRsMGgPKnAMKTfJosqZHqwMQShUK57nmr3Bs2Z5KgJ8g6OdmWq7mI1N4oPk+BcR5pkmCh1aWENINZ4R3jNLgzHiUxZD/ElPOT07GKx0qgLABJGPVFWKrn6RChc08ux14+i/Pg5jTzf/6LB14pJ59I8WeFv7aNSrl05DT0u6JLP6eMreGEWMvnvewbIRrAd+iO03KboSSHPFJGitioYbMkLilojNEGLiepPbP5PljadM0puS3mSj8t4M+r5lAiHPj3oq1cYr0p+eYDYJ8kb3eRO0Sk86wSxF1wjnmYDqKwisw6Kbk9UYvmC81uNboLHal5ahr8yd3HMSJebn5/ehCxpa7I+G2KWiAhToj98bLR9LXFZ7wXr1atW6vZw19gtk4/Rvcd1o=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3556
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966005)(6916009)(2906002)(478600001)(8936002)(8676002)(4326008)(36906005)(26005)(7696005)(6486002)(36756003)(16526019)(356005)(86362001)(336012)(956004)(44832011)(2616005)(316002)(81166007)(82740400003)(186003)(70586007)(47076004)(82310400002)(70206006)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	76fa5958-a57d-495c-19c2-08d7ed0d86c9
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OHvwS84Q9l7Ti7dKDq+K7PDgRYm2EjxWFme+IvOh1hGKx7ehc6EJIVU2alX4bG1Go1cZW/VhmXgaV3HytDFaanJkJzdB1nPsRk49woTAoE9hT8TIv8phe3OB/cAtA6e02TMKgsIdfsyGqA2GrlEUBiBjIE4CiYAfhqTEgmOlUw7hONfkfYm6DFMiI/vGvGVoL5btDfVjOlcswJ3Px1mXZpWJ/kP0JA2l8jclQ4UJKupmGExV5jub2hC3X9H0VP5efbeDThlmNx8rGRGxnb+qpTh4lNV6IoyJDENNQN+nwsb6AAYfIU/8g+xK8o+129+Vq/O0r1iEsOp4Yrr2BqcU5FJE5Gwfa9fMPMUQnX79gfGqevZEN04nCqmU7be6O+RJ/ddXgcNHQLUFFy8vl3yb+0QFBVH4PUpY5bcf/OZxKgNcU3NP+NjYVzaSBeRd0NZfv6iK8j8gYuzpQf6y/iXoX0+EzWqURjz38+t+B5tBOTN2KMUffnmm0juu8WWE2AGHlBLVF/sTJxFTp+j/mwLGMA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 13:51:12.1571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c41a18-5946-4266-0560-08d7ed0d8b40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4478
Content-Type: text/plain

The boot-wrapper-aarch64_%.bbappend and firmware-image-juno.bbappend
should be only considered when meta-arm-bsp layer is present.

Change-Id: Id66a989820675a281946a26b9afec6d5b3d29bca
Issue-Id: SCM-984
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/conf/layer.conf                                      | 3 +++
 .../recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend  | 0
 .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno.bbappend      | 0
 .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r0.txt | 0
 .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r1.txt | 0
 .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r2.txt | 0
 .../meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/uEnv.txt      | 0
 7 files changed, 3 insertions(+)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno.bbappend (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r0.txt (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r1.txt (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/images-r2.txt (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-bsp/images/firmware-image-juno/uEnv.txt (100%)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index de79bdf..83c149d 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -29,3 +29,6 @@ ARM_AUTONOMY_DISTRO_CFGDIR = "${LAYERDIR}/conf/distro/include/"
 # Add class to handle arm-autonomy distro extensions
 USER_CLASSES_append = " arm-autonomy-features"
 
+BBFILES_DYNAMIC += " \
+    meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend \
+"
diff --git a/meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bbappend
diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r0.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r0.txt
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r0.txt
diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r1.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r1.txt
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r1.txt
diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r2.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/images-r2.txt
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/images-r2.txt
diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uEnv.txt b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
similarity index 100%
rename from meta-arm-autonomy/recipes-bsp/images/firmware-image-juno/uEnv.txt
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/images/firmware-image-juno/uEnv.txt
-- 
2.7.4

