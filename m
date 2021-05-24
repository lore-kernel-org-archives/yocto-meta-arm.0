Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.50])
 by mx.groups.io with SMTP id smtpd.web11.371.1621887439334917646
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 May 2021 13:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=h+u4vzqj;
 spf=pass (domain: arm.com, ip: 40.107.20.50, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0YY9OBNQWLGjShqG1lu1n6th1hQK8Hp0mvSEA1v0n0=;
 b=h+u4vzqjjm3QA+C0m5ZSm8cbTCythdbZaD45ckEVgq6Hwz1/hsD8LcTD0hyGFqN16/BtePtf+f8KgNb838zkeuAPy5g56ydft2CFt1x9JBNNYD0nDbxUvL4FBkxRLw6a16eMfdttX4mcWqZrrnbRvDnEThHn338+rrvwEigtvdI=
Received: from DB7PR05CA0045.eurprd05.prod.outlook.com (2603:10a6:10:2e::22)
 by AM0PR08MB4322.eurprd08.prod.outlook.com (2603:10a6:208:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 20:17:16 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::8f) by DB7PR05CA0045.outlook.office365.com
 (2603:10a6:10:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Mon, 24 May 2021 20:17:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Mon, 24 May 2021 20:17:15 +0000
Received: ("Tessian outbound 6c8a2be3c2e7:v92"); Mon, 24 May 2021 20:17:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd4b985b3e7d79a2
X-CR-MTA-TID: 64aa7808
Received: from 4a3e998437b5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2F8EE7B6-184D-408B-9E93-47483BAC88A7.1;
	Mon, 24 May 2021 20:17:10 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a3e998437b5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 24 May 2021 20:17:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8/t0vSK7FK9X6zj7ZpASfVWWzfCxXzU/3/DvVupNOfZzsBWehLEELpvxL2sbsP2JSGnpmg8MaT8x7Su5ICAdWY+qqLgIQJo+TujfTFQk673FiTFSa2x8DjF7iwopts6QXMvYJfHYY1W6DkA1S6qY55IiTWLrAplKsZUAJN+CTpc/vey6CjLFtHPPkGvkcw4TMyvaRHQDv9vgUi3+lIcO8qsKjTqjRH7Te6RkPoUiI0aiaVZ9Qcef6H+MSNDgyd133VkaXP2LbBkAJBnRbzAx7shgN7GsBBPJStb7kt5VbAAqlQPgv4z2mtbAbTGTVoXten7f0a1J9CzKDGn2FYVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0YY9OBNQWLGjShqG1lu1n6th1hQK8Hp0mvSEA1v0n0=;
 b=jOYPBkIW6PRHKRCRrH2QjXuUHsTJJUbE7uwRruqvkTvAX1nlUFn+kgmpnpO2Eq0pfDGOPI30sLuaw+WtVEi/HXkyl14dAqpQJ5tRn+7WqfRpx4VCKN6MtY7E9hW0j/MObMrwib9DC9X++dasDUA2tqigZC12peeDl3VedwezlfE+YNjzGJyDPuBSsbGptoSWfYxYXBjbQo8PwAXEnOecK+PlsLAqcbosPK3viJShRWopYYmiQvKtmfLyD437hDEFQPi3/DWiLlharWJmWOiyitWjl9gfQFANgbp9HeaOD9YvNIUH3yVrqn/VCSwllSmFaC8iBkk102l9UnCKGjc3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0YY9OBNQWLGjShqG1lu1n6th1hQK8Hp0mvSEA1v0n0=;
 b=h+u4vzqjjm3QA+C0m5ZSm8cbTCythdbZaD45ckEVgq6Hwz1/hsD8LcTD0hyGFqN16/BtePtf+f8KgNb838zkeuAPy5g56ydft2CFt1x9JBNNYD0nDbxUvL4FBkxRLw6a16eMfdttX4mcWqZrrnbRvDnEThHn338+rrvwEigtvdI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VI1PR08MB3822.eurprd08.prod.outlook.com (2603:10a6:803:bb::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 20:17:08 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::d503:427b:74b7:1b23]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::d503:427b:74b7:1b23%2]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 20:17:07 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/fvp-base*: move to u-boot 2021.04
Date: Mon, 24 May 2021 21:16:51 +0100
Message-Id: <20210524201651.19095-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::18) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.53) by LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 20:17:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8520cf0a-70c8-4507-e518-08d91ef0ec97
X-MS-TrafficTypeDiagnostic: VI1PR08MB3822:|AM0PR08MB4322:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4322521D066E1641BD4B600189269@AM0PR08MB4322.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DrQvX178iT3VdW6U1Q+HrKeONbS096xRmq8Ld+wnfSKJQYITlJy+G3KnDz68v4VZc37z63jleDf/JDfR1ojUbm42/bG5pAji/QG8t5gNsjbeM5drjQXenmmtpWPbAcVpAZlehONnM6flyveo/YuIKS2z2sq/hC481dSuOwQ7nCRE07WgUDcvTaWh2bBm8p9/laP68AEc8nyJtT5hMDKZ+ROMZMGSYLc/QyftPpqUAvPrMDKl/PK7ou6rc+Qi8BOAtZorTx/vdooolYI4eqlDco/ybIwaNtgfdt4TzyoTIcMOkGxrD5jWVRBfRuPGp8WoTOMfqldcByBEHttKfGvCZHF2JL7Vn6jDglst8F37PoEEUtWUJfSS9h8hCLerCI2Z9NDXOmjyXIKEqMgihvuQlgmv9T9cgsdohmOnE0nS6WCfCzmqw+W62Gay+cskjt7D0JX6OVcps/NhgR9w0HDg3y7a3dJCH+1hkfL+bVdaELa7PxM6VIlOnEQklKLuxzsPPn5MDB4pDSTYr4ZJyM6lRRg9rG2Fh82OYC1ybxN39omNXkeV95Fc28AekeuQj/PNRsolByzVb67Qs47jfOXvsImVaDI3Laa5AZza5rgY8gN2ygr6/SSvSI8YLehc1M4Nl6KOvckf+aBhRxxVmzubmsFFAgusOKolr1xRd/fw3HM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(6666004)(316002)(6486002)(19627235002)(38350700002)(38100700002)(5660300002)(1076003)(8676002)(26005)(8936002)(53546011)(66946007)(66556008)(4326008)(44832011)(6916009)(83380400001)(478600001)(36756003)(86362001)(956004)(2906002)(7696005)(52116002)(16526019)(2616005)(66476007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?uLW8RtpLhFE1s+/Fjp1yMY8Hv93wEjL2c/IoVHfXfCidtCwbF00D3NEJRif+?=
 =?us-ascii?Q?ngFx35IKL6GaWHrYDcgUPifmWSzmA0qaVuJ83XXdC14ynDZN3JzIOp0I3tY9?=
 =?us-ascii?Q?a8CrYB7Pe2vWA002ba9t9bdfQuTv9ejUvTy0JdWGxYqde1twS4RHcQu6fKCn?=
 =?us-ascii?Q?7NDgh5Z6ZTIMNCQwQiua4mC2aR2oCs/DLYoFBLHQ5lAc1IRZkiuw1WnSk/cZ?=
 =?us-ascii?Q?vIkABhGW+oI8okcN+yAgkgnJk0NBHa5PTRpRZ3lfRDOfO7jL7ZCjsanQXr5G?=
 =?us-ascii?Q?TpqQZFU6gHnqzKWCY4RI1Qhquj9nhR7kwbN9uCuksWKIb6KHQVrtOiOSNFmM?=
 =?us-ascii?Q?NQxuEQD5hlMD2ZP+BCz2GPpgXxCRW355EIEKYnUnMiZ+fiUfAxCk80GSr+pm?=
 =?us-ascii?Q?Zi1qDvZe/HQq8w7ULe53/K4D0e9JBPtT4v2iIHG7cSgo2NLJyrcg8gqYnR4s?=
 =?us-ascii?Q?nNAJCl7KY/MIQfE4O4lmQcb4ALQilPpB5g2VDWUd4PnuntBaMDcBrq+BUQde?=
 =?us-ascii?Q?pO6EBQYiZkue91VAL8V2e9/cTjg0svewXQ8Jx6qZNSZd4JMU25gUtfrQk48j?=
 =?us-ascii?Q?yvtgnUFxKUK74zB/2OgkaZOjzLUZt372QHE4rhJqdqbodZEcRT8La2qVEkkg?=
 =?us-ascii?Q?gF8PaIy5X63gcTdxMMVWy7Sopw/c7Q3m+x9ZgXh7qtJnQ0eunxgarxYdqT2y?=
 =?us-ascii?Q?2QM1pGSkvzwS49yHAYX1+eY5BvyH5P5jQKb4OSOoSwU1Zfuem27fLFjibT5E?=
 =?us-ascii?Q?4Jbvta0PZBddAbPzY19E222bgmHTWi7Lutt7Uf8UCqs11eooRT5kEmyNiGOG?=
 =?us-ascii?Q?K6Nqywdp4dzrJsL7c60IYhTEHQyyFh3LxPZ4BB+zghwyfp66Z6p1bO+D7Ifi?=
 =?us-ascii?Q?P89oshuNYitic2tz1kw7N86d2zLcOvfXKF8bM2UOWBx9nTcoc00bFhv74b+o?=
 =?us-ascii?Q?skPEqtxUr9SOg37TPE/xwS+nZYdbnPXUMXBT+a/1la1bCErCn1GamI6X6PCy?=
 =?us-ascii?Q?kTQa0BQX1JqRRUUXi324JZV0OJRg5T2yw1Rgrg5s9AtqCSWFJ/pc+RqiSu/q?=
 =?us-ascii?Q?fvyufG0ozD9AAIyrZShH7Jhz0J21LhLWEMvlaOuD6R9MoSntLQtQ9PWdxjIZ?=
 =?us-ascii?Q?eKlQTqQMs1CKdvww2jqjYzH0p89hUh/tz66+3LAbIOAXf6dHP/yTt9G7cRb3?=
 =?us-ascii?Q?3DYtmFu34e0KSixBwik7yRolnu8PqesBrWr+2j1cuZjh7kvRVQRBs0pdWIot?=
 =?us-ascii?Q?W5p7DgSvuqPM21uVgrRM5UkyEdJsajEQHubnvhzS+sUS76IdGBXXnNbD29Bp?=
 =?us-ascii?Q?WhFIC23O1LCKGq8TjHxF/46B?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3822
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8169b79e-b328-44d0-4eaf-08d91ef0e665
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o7bzGevr3u6Q6buW9FDb9IW/Qtk3PJzwMyoblye62eCpvJWqY2U7bHuRLhzc3tKFx4p1JHGuWcr58jRKWacjxw07MMjwI6o4BduDp1bYhRtlaJf4FZch2w+Vr4SMyQZynL6vkygHZL8LGepZxjf/dFy6Ym6uO9eqdS2U6ZOsuzKti5Yedg2W6CTSWWTlCTQmrOhKXZjnA7sfHPZ/W1XUZF0ULGzFTwbTrqHKCEjHb8B2eSvRGhZfBN1viN1YQzVOmZyoHfgRooyCoKcR4MLo9O1pFbkTqQNJ8/D+n87p89N4Xox3/eZzH6aj1Ijws5Alu6W1xJvVk2QV++A3JIxm5lxZ42zfpITzis0DaSOV1nZsP/xIocSrdwhTmMwwar8E8R7RPoOYxjr3aXLAAuaOCWxT25pv06G6nFwoU07ezLhKbLk1fehy15Dq2ZzjY1+R3MsDh9EXregkCuEV7aDocqtwB2HZjaTWYRd9mkNxf43J1RklEl2LSDiyWPvTNaXzV1d1fMxex1DWGlwhg/PcGaS0exPkqIuK5eaAhQ04VWXLGiWCbikwcfftGUWxIMOFZvIahv/c0iiVCMpSmL6fznlmM7MPDJJZ5rxrAwoJeBFsNhBjKa5K+z4HUiuUz5H2gjllZ5j0pV9WxfvBZEFEqrBmED1kiR5mbYu+pFBylMo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(336012)(6666004)(1076003)(478600001)(16526019)(8676002)(8936002)(82740400003)(19627235002)(4326008)(70586007)(70206006)(36756003)(2616005)(44832011)(956004)(26005)(356005)(186003)(5660300002)(81166007)(53546011)(47076005)(36860700001)(86362001)(6916009)(6486002)(2906002)(316002)(7696005)(83380400001)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 20:17:15.9917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8520cf0a-70c8-4507-e518-08d91ef0ec97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4322
Content-Type: text/plain

Remove fvp-base patch that has been merged upstream and rebase
fvp-base-arm32 patch

Change-Id: Iac16598933b94c1db13d3e40f1d5b3a137c8bd4c
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc      |  2 +-
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 29 +++++------
 ...et-DRAM-to-4G-to-match-with-kernel-d.patch | 48 -------------------
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  4 +-
 4 files changed, 15 insertions(+), 68 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 169c0a3..96f81c3 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -15,7 +15,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
 
-PREFERRED_VERSION_u-boot ?= "2021.01"
+PREFERRED_VERSION_u-boot ?= "2021.04"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
index 0719629..c1feca1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
@@ -1,4 +1,4 @@
-From eb241dfffcf641d7f37e853e1795557796671b19 Mon Sep 17 00:00:00 2001
+From 6ae7b384eef45dd9f70e5e53c32cb14c56733013 Mon Sep 17 00:00:00 2001
 From: Anders Dellien <anders.dellien@arm.com>
 Date: Thu, 23 Jul 2020 17:32:55 +0100
 Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
@@ -25,15 +25,15 @@ Signed-off-by: Anders Dellien <anders.dellien@arm.com>
  arch/arm/Kconfig                          |  5 +++
  board/armltd/vexpress64/Kconfig           |  2 +-
  configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
- include/configs/vexpress_aemv8a.h         | 24 +++++++++-----
- 4 files changed, 62 insertions(+), 9 deletions(-)
+ include/configs/vexpress_aemv8a.h         | 23 +++++++++----
+ 4 files changed, 62 insertions(+), 8 deletions(-)
  create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index fbe90875ae..8468bfb45b 100644
+index 3307f2b3fc..0389e04cfb 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1187,6 +1187,11 @@ config TARGET_VEXPRESS64_BASE_FVP
+@@ -1184,6 +1184,11 @@ config TARGET_VEXPRESS64_BASE_FVP
  	select PL01X_SERIAL
  	select SEMIHOSTING
  
@@ -57,7 +57,7 @@ index 1d13f542e6..dad181c93c 100644
  	default "vexpress64"
 diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpress_aemv8a_aarch32_defconfig
 new file mode 100644
-index 0000000000..cf1e8d5cae
+index 0000000000..0726e0d0db
 --- /dev/null
 +++ b/configs/vexpress_aemv8a_aarch32_defconfig
 @@ -0,0 +1,40 @@
@@ -102,7 +102,7 @@ index 0000000000..cf1e8d5cae
 +CONFIG_DM_SERIAL=y
 +CONFIG_PL01X_SERIAL=y
 diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index e63c335f85..edded8c52b 100644
+index 7318fb6c58..f223811134 100644
 --- a/include/configs/vexpress_aemv8a.h
 +++ b/include/configs/vexpress_aemv8a.h
 @@ -9,8 +9,15 @@
@@ -132,8 +132,8 @@ index e63c335f85..edded8c52b 100644
  #define GICD_BASE			(0x2f000000)
  #define GICC_BASE			(0x2c000000)
  #elif CONFIG_TARGET_VEXPRESS64_JUNO
-@@ -159,7 +167,8 @@
- 				"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}"
+@@ -164,7 +172,8 @@
+ #endif
  
  
 -#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
@@ -142,7 +142,7 @@ index e63c335f85..edded8c52b 100644
  #define CONFIG_EXTRA_ENV_SETTINGS	\
  				"kernel_name=Image\0"		\
  				"kernel_addr=0x80080000\0"	\
-@@ -168,7 +177,9 @@
+@@ -173,7 +182,9 @@
  				"fdtfile=devtree.dtb\0"		\
  				"fdt_addr=0x83000000\0"		\
  				"boot_name=boot.img\0"		\
@@ -151,9 +151,9 @@ index e63c335f85..edded8c52b 100644
 +				"fdt_high=0xffffffffffffffff\0" \
 +				"initrd_high=0xffffffffffffffff\0"
  
+ #ifndef CONFIG_BOOTCOMMAND
  #define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then " \
- 				"  set bootargs; " \
-@@ -177,18 +188,15 @@
+@@ -183,15 +194,13 @@
  				"  bootm ${boot_addr} ${boot_addr} " \
  				"  ${fdt_addr}; " \
  				"else; " \
@@ -168,11 +168,8 @@ index e63c335f85..edded8c52b 100644
 -				"  booti $kernel_addr - $fdt_addr; " \
 +				BOOT_TYPE " $kernel_addr - $fdt_addr; " \
  				"fi"
- 
--
  #endif
- 
- /* Monitor Command Prompt */
+ #endif
 -- 
 2.17.1
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
deleted file mode 100644
index 541927c..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 9abe5e68033dab0d521475090ffd0cef9cb2c581 Mon Sep 17 00:00:00 2001
-Message-Id: <9abe5e68033dab0d521475090ffd0cef9cb2c581.1614260356.git.diego.sueiro@arm.com>
-From: Diego Sueiro <diego.sueiro@arm.com>
-Date: Mon, 15 Feb 2021 07:27:57 +0000
-Subject: [PATCH] vexpress64_fvp: Set DRAM to 4G to match with kernel
- devicetree
-
-Currently, the kernel devicetree is setting the DRAM size to ~4G.
-
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
-
-Upstream-Status: Backport
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- configs/vexpress_aemv8a_semi_defconfig | 2 +-
- include/configs/vexpress_aemv8a.h      | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configs/vexpress_aemv8a_semi_defconfig b/configs/vexpress_aemv8a_semi_defconfig
-index a26137ef5d..2ecb7762ce 100644
---- a/configs/vexpress_aemv8a_semi_defconfig
-+++ b/configs/vexpress_aemv8a_semi_defconfig
-@@ -2,7 +2,7 @@ CONFIG_ARM=y
- CONFIG_TARGET_VEXPRESS64_BASE_FVP=y
- CONFIG_SYS_TEXT_BASE=0x88000000
- CONFIG_SYS_MALLOC_F_LEN=0x2000
--CONFIG_NR_DRAM_BANKS=1
-+CONFIG_NR_DRAM_BANKS=2
- CONFIG_SYS_MEMTEST_START=0x80000000
- CONFIG_SYS_MEMTEST_END=0xff000000
- CONFIG_ENV_SIZE=0x40000
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 566bee5b87..7318fb6c58 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8a.h
-@@ -117,6 +117,9 @@
- #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- #define PHYS_SDRAM_2			(0x880000000)
- #define PHYS_SDRAM_2_SIZE		0x180000000
-+#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP && CONFIG_NR_DRAM_BANKS == 2
-+#define PHYS_SDRAM_2			(0x880000000)
-+#define PHYS_SDRAM_2_SIZE		0x80000000
- #endif
- 
- /* Enable memtest */
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index df9fdfb..a572347 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -5,9 +5,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 #
 # FVP BASE
 #
-SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch \
-                            file://0001-vexpress64_fvp-Set-DRAM-to-4G-to-match-with-kernel-d.patch \
-                          "
+SRC_URI_append_fvp-base = " file://u-boot_vexpress_fvp.patch"
 
 #
 # FVP BASE ARM32
-- 
2.17.1

