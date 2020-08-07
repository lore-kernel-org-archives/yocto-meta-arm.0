Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web11.5108.1596804151161230267
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=u3qA4IkM;
 spf=pass (domain: arm.com, ip: 40.107.6.78, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yta/B44pC3j2jwGXYfZbAObzYJ9Q3bMChlNaLLXqdiQ=;
 b=u3qA4IkMD9Q7vPkbnV91pQi+40Bfvwfus4LmY+otQoly0+f4WHiV4sp0bJ4I58kDsMNKzhgVSSx9TLOR42jaWGBNmgHZin2wt2o3yzIoJBaMWW95Uwqs/EOKjTX4tPDHhCkvT95t/jA21CSVfWOES2JXXYLri0QZJdDTjVEgOrk=
Received: from AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49)
 by AM5PR0802MB2499.eurprd08.prod.outlook.com (2603:10a6:203:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 12:42:29 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::78) by AM6P194CA0036.outlook.office365.com
 (2603:10a6:209:90::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:28 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 07 Aug 2020 12:42:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b1befc9074fa7af
X-CR-MTA-TID: 64aa7808
Received: from 5b341530a0a0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3868CA13-3CFB-4104-B0A4-0D084E66E7D0.1;
	Fri, 07 Aug 2020 12:42:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5b341530a0a0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OivRk+mzE/DTBeAYllDFcNG7dV4VqXtUh4T3jsHZ/BiClVLVO4V3r9jOhLHVEUo1kdLYiwjs0nM74Upb2QRa3G6kQ5PMEAhchV3aUw6+knMWJpHJ7w64lZDeGFOloIb0pRF1tL62Uw02FDJkM0KA7LnmYKzqNwYcD9eBCueax4KzFSruwW45thAUTMkg9i5XQ1y8jaAzfvroYTidzB6sNjugS6fVk9ByXxfsAKCHlk9Ac1PXjd9FEUTx8b/2gtvteUmHtI9H4Z167SAwLKNc0GHLjhMGVkHd4/prlvtrV4BjLRpFeKskBSe/JoBYTcFY1U1wHwEQ+Hcc5TOF/GwWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yta/B44pC3j2jwGXYfZbAObzYJ9Q3bMChlNaLLXqdiQ=;
 b=dagQ3F8JpkKyOFXaVQSuqL86JpuOpuE0jY8PuCfw9p5FDZ398qHJLnmCAldGpdtH48s4h+vZwUwQIvAVt32K7UDpt0aJMIWxq2c+v4ApE8fAyfbK+3oBdKrjdGSgEoJWYrlvwng86btpuuNIJVQrUbMOXrCt20ngQI7vgLP4r2ZmIiuQTwns07nwcQ4cgQZ0DQYKg+nVdfg89+xRlRhTbChS5FcH9pU+E6pn4Sz0ePxFRHGShbb5udxbR/qDKtrzrfkcxDKAh9i5Zt7bgeBQPdX2CjzlPnWS0j5sH4sAOfeivOpQ/iPWMTJ5pDFt6mqmH0Nr2/vTDwWf2S5EYBxINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yta/B44pC3j2jwGXYfZbAObzYJ9Q3bMChlNaLLXqdiQ=;
 b=u3qA4IkMD9Q7vPkbnV91pQi+40Bfvwfus4LmY+otQoly0+f4WHiV4sp0bJ4I58kDsMNKzhgVSSx9TLOR42jaWGBNmgHZin2wt2o3yzIoJBaMWW95Uwqs/EOKjTX4tPDHhCkvT95t/jA21CSVfWOES2JXXYLri0QZJdDTjVEgOrk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:22 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:22 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 5/9] arm-bsp/external-system: enabling corstone700 platform support
Date: Fri,  7 Aug 2020 13:41:51 +0100
Message-Id: <20200807124155.24198-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d1f05c55-6902-4d83-52ec-08d83acf5863
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|AM5PR0802MB2499:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2499A1FF8895B3B6B86A2EAFFD490@AM5PR0802MB2499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:205;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NhVImP9HjggPPtbrAOPvOfZuNt6s4IbGQIpNVyO2sbF2JUi71x6HFv++bjdaW6nqosj4OWRV1E0aQofY+zDg7N9mgiF91V7fGy1B+RYaN8cIfwUS2fkQTu+OxYFMyVAdT0veRorzz64k3KzPS+0d1H+zTfRpLC7UhAi/kM6M6xa+Wc5xevwty1rHOIX6xeuvQXtGLFuRvdvCpPkc4PrYielVkfTpjMMoUjOT3YKCWvOlVINiRuh10rlgilil+R1w5MXGU7i3OHxo6N16WS8OxiXlzCjNmX7FPbokLf5wKrfRjaiZbe+g6LkO/x3q0UNw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(66476007)(66556008)(36756003)(9686003)(478600001)(8936002)(8676002)(2906002)(6916009)(54906003)(66946007)(316002)(6486002)(4326008)(6666004)(186003)(26005)(86362001)(1076003)(16526019)(956004)(2616005)(7696005)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 RCb6T7PfGWH+jaO0wuQHci2+zQ1I9BvD3RoiDHes7+CJhuqiLmZ4k0FCO1WuKrJFz+IlQ/KopZysJnfEPtdKjgPIhTDEtE5IihchOkYLJhbjEV2Zp7ThRd1cUslK17jV6fjqGNX/+hTl8aMJ/tuVby2SC5tpMZQt2fa/yKjAae8XqV0CyUq2WcJElScO52l3D/CPeHyY9F0fmajXL7H0dOY1bIO9cXIIN52FtZxQhY49QwafvCe1FRl3/ATXoZshJVho0VS25o3bqNq8Pw+nDW8dL9x/PGSP0/NruF2A8HsEgULgbEcnZ3vRg6aFSi4zQarDi5MLrM7sxX3Kv/qydqbzxUuIwVVS9FCw5qWm+bOrHWbvt7jHleIpny8SwRX52kpn1NbTV3zwFs/oc8697KyI/IA+B8zXlb8lHWHPleNkHSlMTV8d2Ei0SpQPwLaJv1O+RJmPEiC70Vq0PRP3Vjjy5U+q7l/tBNXY8NOn41RzYLpTFULSuprRQQjocsvWP57dBO5pfeR1WqgwRycC9aJciExZwq1p7S35M4LMSYx/WFIBIgAfpUI6lL9Mavz3XBhUugE/rvPlSsXzV+SLMj/O2Kp/JCIcGVCAWwOBa7iYEYZ1736KNY5FdKcrNK2tIom7RsVTll/qXPSnSBKPjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c5129dcd-3c1a-4464-e5c8-08d83acf548d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sZ4CBxTHHOF8fm+PKztrw4qwN98lruoD54kwXll118hbjnkc+ECOqfjp++RmI5mMdaGukyywulyOlOvB5RJEL7Y7wN49cW5PP3yCMhlbEgOU6+iUpaYKpdJDbg3adhyF4Bj6wK0NZZxOOGkS+sDbSHitw0RW4HrN3gea5pMOc/l/OHjYqIE676575L0jZJJg0RGCJaAuhZMWF54r0akNYcZB3zSLBIqw2IWagIsJPXB+XW8LffEgUxbqCJ82b5prdKy5XvC0z00IIVmvG1ad3GnuZIa9jCTnPZ7aaekh4cki1a0aX+NA/tEhUMR8s67Zbv85Ub3Ps+lkPQfWnqmhPA2L143+7csttY/rJ19yRGu7RBS38o9JV52fnZ1nsP4JIdgaPKWQPRVUxfj8OcU1mA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(70586007)(70206006)(47076004)(8676002)(8936002)(4326008)(36756003)(82740400003)(6916009)(2906002)(83380400001)(356005)(82310400002)(2616005)(956004)(81166007)(86362001)(186003)(16526019)(336012)(5660300002)(1076003)(9686003)(36906005)(7696005)(478600001)(54906003)(6486002)(316002)(26005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:28.7921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f05c55-6902-4d83-52ec-08d83acf5863
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2499
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

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

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-b=
sp/conf/machine/include/corstone700.inc
index 495fc30..4c00c6d 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,7 +14,7 @@ PREFERRED_VERSION_linux-stable ?=3D "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"

-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a external-system"

 WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0=
.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 0aab8ad..84da7ce 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -10,10 +10,10 @@ SRC_URI =3D "gitsm://git.linaro.org/landing-teams/worki=
ng/arm/external-system.git;
 SRCREV =3D "41ef76951c5119729c1ea305406f74776da90866"
 PV .=3D "~git${SRCPV}"

-COMPATIBLE_MACHINE =3D ""
+COMPATIBLE_MACHINE =3D "(corstone700-*)"

 # PRODUCT is passed to the Makefile to specify the platform to be used
-PRODUCT =3D ""
+PRODUCT =3D "corstone-700"

 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
