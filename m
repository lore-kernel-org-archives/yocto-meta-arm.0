Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.83])
 by mx.groups.io with SMTP id smtpd.web11.53350.1612277132224921942
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Feb 2021 06:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=owtJK7V+;
 spf=pass (domain: arm.com, ip: 40.107.8.83, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAju/I+6Ysq/MO1vRGdB3y9a6Xn8BXtwrZSa+hgMuQg=;
 b=owtJK7V+dpactOkeH6AawP3zwFM1i1vAdGVkjQqjLSSK9SBzTJ/sPCLqS7Uk2NfPzur1C9x0Wp/7y5zS5Rc4jGsi34Epx5mvtApl0kH0u+l20+A/7MQi67OImrTAFm7xfFNswh7KMkWDU1x5YWNY4CgonwV4fZT5wtUo+GqJHBs=
Received: from DB9PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:1da::32)
 by DB7PR08MB3628.eurprd08.prod.outlook.com (2603:10a6:10:44::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 14:45:29 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::e9) by DB9PR05CA0027.outlook.office365.com
 (2603:10a6:10:1da::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend
 Transport; Tue, 2 Feb 2021 14:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 2 Feb 2021 14:45:29 +0000
Received: ("Tessian outbound af289585f0f4:v71"); Tue, 02 Feb 2021 14:45:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 462d3d4eddcc8e63
X-CR-MTA-TID: 64aa7808
Received: from dad990ea479d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B727C9B3-648E-423D-9625-910146F67E00.1;
	Tue, 02 Feb 2021 14:45:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dad990ea479d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 02 Feb 2021 14:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQGlDr5TMw30ga5jatgldcGAiHwsWNaoV0533uJ5YRy97LKgHC12tsmG/3qbrMA36dYi4hwu1Ar7r15RRYmfgKOanT6VYi5AfqOCP/YVPFRyhSXAnkszMoVwrbzG/9cpAMZo20wD7MzK2XN+eCN9K6aGqsS9r9QvacrmRhJBw82ITgTKPXqKPjINunnuwl5RP1RYOPmzjM4VKr4k69rkYWH6mI3rW1aTGPVUMq7s/ZrwSyj7oWaSNG107UWHPaDIIOVFXO2UAbxoC5FhGW08C2IgQBaVrMnrFNLhqpttubT5T8bQ9tuhZ87aNVKapaHha2Nwr9Rjof8wlDp+kH9YlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAju/I+6Ysq/MO1vRGdB3y9a6Xn8BXtwrZSa+hgMuQg=;
 b=JvW4BfQNXaH+AK2U0xZhdPc0CsVc5t5JujCRFKhbONEtnniPff4qRiEb/e2J54/kYebB2uErRFyWXLaMbUO+bE+AnFLZudsLTE3MUyFttLbLREkB29Vlh4+czu7+a/8WcfiSD9LngK95z13bPAp/eP8jVAyVjIEYnmtgs2MH+o9uDB2Y3mMQRXppzQ6YeSfMqn7DX83MfJ7j/pNuiY9/1eRxM2yq9jzVV45XNCyb/+7WnBCrl539D27smLfAFVd55XQCkg6A+Uvwhb+hUDmF6zOFXrWFOjEEjhZVB0lam358vRuTyCd54/eWvwdlLsyLSR2S6tZSLaIrLP67uQv7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAju/I+6Ysq/MO1vRGdB3y9a6Xn8BXtwrZSa+hgMuQg=;
 b=owtJK7V+dpactOkeH6AawP3zwFM1i1vAdGVkjQqjLSSK9SBzTJ/sPCLqS7Uk2NfPzur1C9x0Wp/7y5zS5Rc4jGsi34Epx5mvtApl0kH0u+l20+A/7MQi67OImrTAFm7xfFNswh7KMkWDU1x5YWNY4CgonwV4fZT5wtUo+GqJHBs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VI1PR08MB5471.eurprd08.prod.outlook.com (2603:10a6:803:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 14:45:20 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::bc36:4b30:64d2:17f3]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::bc36:4b30:64d2:17f3%6]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 14:45:20 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/fvp-base*: move to linux yocto kernel 5.10
Date: Tue,  2 Feb 2021 14:45:03 +0000
Message-Id: <20210202144503.14548-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::34) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.50) by LNXP123CA0022.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Tue, 2 Feb 2021 14:45:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fae24c88-f29a-4ad0-75af-08d8c7892f59
X-MS-TrafficTypeDiagnostic: VI1PR08MB5471:|DB7PR08MB3628:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB36285C942A52A8CD002F986B89B59@DB7PR08MB3628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:119;OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Xz+3oXlivPuvon+PMhUevOmpRY61TDrEjLSPsC+5yvdyrJ+1Q1ZjMIHFlMhkud7i6x6Y1qJDIHC5UlPjcFsVBcS8HbfOH5/seUIkg88ew7ee0YtO09A2b5/SM2jRBEc66pfy/++b2kuOAVhGyj3oJ7QcVxtamDtpU6tM6QOlwu/pKPty8Jk5UhnOp9LEgg4g6j+ZIJU13ZUYJVuQPZBiMIbk09B4tOXeBe0nUID5Qi1gW1a/FDLZe/8j0oDCCYO+SdjuFZzilyLasmUBwTtW+csJGAssKdZMkb8KGXwAWtGyF3wGz5KsCADv4EfErpUBK9fazMhA+HwdnNqz6aiEDsnL12WwKEgaAh1w7yFZ2uYP9h3HMGUyIdb2SQFNon3noVNjT+EMue/FUuvZwX14E0FgcePW+bt4xtTRMwpuK5ku/XaMifRKMuh7J7kMYWXgPCGXG/E33A1ru0lfzwNgtqxJSJRCkyRmb4T42ZTCwjlBvYgCmM2EqJmkUHf4pq+GVjGCC0W+6im7t0CMS77clA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(366004)(376002)(396003)(186003)(26005)(16526019)(66556008)(66946007)(66476007)(2906002)(44832011)(86362001)(83380400001)(2616005)(956004)(8936002)(478600001)(8676002)(6916009)(6486002)(4326008)(52116002)(7696005)(36756003)(4744005)(316002)(6666004)(5660300002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?Z5wlslBaSVdruDoVMu4zxQZjcLR5T061ZCmW+GEur2goVO1bu+LyI94c+UkX?=
 =?us-ascii?Q?w600uEe111lZv/imULrM5KXwjRcNX4qH82/lY22Y3ta7N68JSm7CSj3N8a7h?=
 =?us-ascii?Q?vOIu1L4wcVte7sPOXCLpzOweHCLT2BhBdbbdszJyn14q/fhyIcbBdSpGlAry?=
 =?us-ascii?Q?P1uxyrBNlC5veoS6gXLBlMiSMy3OHpKbqTzxLL5Vr6hZTQjWEBDnpz9+KS0r?=
 =?us-ascii?Q?zRSAX1j9zwadvc9lgjPSaWp7XdEFIftrmYk07nYcgbNwBx6Qn1NjsPId9ayA?=
 =?us-ascii?Q?YPYhGEKmOyjs8F8CzuUQhsuKG6oPmLKaXLFwc+BvCgAQZjJKfkGghZPJpdus?=
 =?us-ascii?Q?INX0+744Pyb12FEZPXWJ5mKfzyRLAvy0e1RovxSDw+NHRSrxnrv59tKLozn3?=
 =?us-ascii?Q?1cipyudtTV9sQxfaV0b6pXmFSwcpcU02rB3l7LI4mfyIdH+GAbsEkPOgjl/y?=
 =?us-ascii?Q?Dm3byyNGCTUTQLgMuKeJYGY0auVDuwVn6Xt9xTPB5m3/TFd9Rw0uBdYipkxI?=
 =?us-ascii?Q?cMYdj0RCwLFEqYic00A2kaDt7wF6WV5RBZcIQThiopR5hGv/507akjpz8pbL?=
 =?us-ascii?Q?Ir9k0O/duf/JpJqPyieLpSNVmJhxVATj+1ZLAsBvSjBh5WR81ndB6d4bXL20?=
 =?us-ascii?Q?+OSkAiAr3Ct5xHKoSllef9738ydAWFWpCkl08fGuz4HAaVELRvbIFFKRarhR?=
 =?us-ascii?Q?QHnO/Cxvg3f69hTgJCsX8PlBPD5n5x6yUuWkuG8WdZyy19zA4da1lLberV5c?=
 =?us-ascii?Q?6rmHwXhV8KeVeSWJJ/WenLCGkvngBSTQ1aMDye1Yr7YJLH+mJLOGYgWX/f42?=
 =?us-ascii?Q?bpI719Q3LBKpqfidWCkPhrujKq6c98m1+5w9yzQGRxYNufKw5RyPzDQZeqL0?=
 =?us-ascii?Q?njovsmzsvC2jfdv2AiDp14tCfSuVkxO1Zl1A+qpfiUvSsNBLupSUc+wxne4p?=
 =?us-ascii?Q?HbI5Nla3NcGKcc4sTbT50TCqLX3hq/hWXG+MrVu+T6xHe20x85bX3bKOBBYN?=
 =?us-ascii?Q?PQZOYF12j6rTLpx40o4InZkZenO4gaoByqE7Ty0LqQ0iJcbiiLvH0GTuc6t+?=
 =?us-ascii?Q?X2IATdpP?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5471
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc5f263f-1737-4209-e857-08d8c7892989
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LvagthDSc+Uyb4TImcJe2ZbqSUcaKummZJcS23qoX2hvqGIHmE1jPT7UxnOs5WFfsxxjp88mEHX9i0Tv8D1Cey/JUuC4/ss8TmdXuMDBMbaa6VGdN2JfpLTxq1vT/4ZhK8Cf9x2uwMAWJVootVVvJXWWE9WqgHrMUgXuKECiYCmR6EkJ2knCQAULhc9uvALOXetySZFlpl4wE9xMCTu08R7Yen2/Mq0+Th2HT0ZxXmnDmIoMZ6wgDdbxF3DEv3t1m2eXZ9Wp+0aZDBeXgS12OiScSEIxsOXXBG2oVHPLjaxoPxObFB13zR6o9VxAAKIUqhYrKm53N1gySIutwqSc+PNmn5nJZz6t9puAyvnvGvcg94gLaM/4XFOMo7yjUMhUNTQ2zFqTgwg2lbZlPdwU3y1uXvlb0FPQYBlJLDBagrCgVxtKic0+paKMAKPalw/JpsLSiXIH44cgCiMivumesKpg/SG9XsCFIptJGFlQ00YsfVw53M7E1bZfCYNxDc6cHmfVowhWtI+n6JOPULaJ8dwsnVjCGIlFm/S3v1owjRGxShBgvlvy0N7V7UWMgMuwovwwD3JUjnbcYFOeQa3lrzB2NgVm9q3XYpUkuZ11y168V30T9XjOZ0jETVxc05adII+2lhAJZHamSrmqxZe620KG2dVEE7L+Z8a9qAXK4w8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(36840700001)(70206006)(26005)(82740400003)(5660300002)(2906002)(81166007)(8936002)(186003)(82310400003)(16526019)(7696005)(4744005)(70586007)(6486002)(478600001)(4326008)(8676002)(2616005)(336012)(956004)(83380400001)(47076005)(6916009)(6666004)(316002)(356005)(44832011)(1076003)(36860700001)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 14:45:29.1654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae24c88-f29a-4ad0-75af-08d8c7892f59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3628
Content-Type: text/plain

Move both FVP platforms to linux yocto kernel 5.10

Change-Id: Idc0b35d201a188d69c2e475f2f864f5bb0f06341
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index cdfb538..94aa2bf 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -29,7 +29,7 @@ DISK_IMG_PARTITION3_CONTENT = ""
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?= "5.4%"
+PREFERRED_VERSION_linux-yocto ?= "5.10%"
 
 PREFERRED_VERSION_u-boot ?= "2020.10"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
-- 
2.17.1

