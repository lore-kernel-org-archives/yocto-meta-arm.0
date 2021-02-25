Received: from FRA01-MR2-obe.outbound.protection.outlook.com (FRA01-MR2-obe.outbound.protection.outlook.com [40.107.9.72])
 by mx.groups.io with SMTP id smtpd.web12.13808.1614270042301818669
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Feb 2021 08:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=O9VLGkRw;
 spf=pass (domain: arm.com, ip: 40.107.9.72, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ep3vRn+N1XgBL2FNM2RsM/UIs8rTnp3JE/ImPAu6YY=;
 b=O9VLGkRwt22TUvTZ7ffGnI5027x446YQOSnKLv7Pa601o6pAyxYP96YT9niD/X9o8z6T1MWJSYzPyXr2UTfVseprcx1fhvfhXlitDgeZhOBCidedQuQocpNhgRgeP+u8rpGONgcAF/GNlef5X6uW5V+LcOZq/lWlxmn2+DSicXI=
Received: from AS8PR04CA0189.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::14)
 by PR2PR08MB4860.eurprd08.prod.outlook.com (2603:10a6:101:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.30; Thu, 25 Feb
 2021 16:20:39 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::51) by AS8PR04CA0189.outlook.office365.com
 (2603:10a6:20b:2f3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 16:20:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 16:20:38 +0000
Received: ("Tessian outbound 1ad67edf7b2b:v71"); Thu, 25 Feb 2021 16:20:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f335b94b305b8e0
X-CR-MTA-TID: 64aa7808
Received: from a51bd027658f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 738370DB-E8ED-4DCA-B8AB-F01F5C4ECCA4.1;
	Thu, 25 Feb 2021 16:20:32 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a51bd027658f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Feb 2021 16:20:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWM18IrMH2LDuHovLErH1UrYjjCpvcQAUkIMJbQ1KKfI8ukszOLxblWJVNhpOlt0IR8vBj4vwnksBwIZw+N0rJL/USGcWXRsWk1/lWZt0R/T4zb26Fp+GNr1iSuHev+iBsu/LtbkTraWmY17Qluj+2rjcTZTD+3IRmrwh/uOXRAmS6bRQWIwB7fjk9uONriUXxtzTkXP2OZDWahGqodWmgUB3z630MoeLS3+KaW1JR2pCmiqjYVPt+rJXN9NxAgDcxwok+R7JUJEJs+UZYuUMowreY/f+1S3uWexf/w3m86r5m8rjq0wl7Dof7eT6eY2dKdFBE4n2VScKrdR+AsxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ep3vRn+N1XgBL2FNM2RsM/UIs8rTnp3JE/ImPAu6YY=;
 b=ntZLSzHDd5A4VXhWgKdAZzuy9kusZN1Mbnaf3nOC/AFyQCbNplT4zyisFCMlxGXmpUcXiu//X67Mi76HjM+mVDPApsNgiO7xmjJOpCmzD0gF0dY10E60+M2Yq6xxYCWdDmtTVf+b1+orA3vktCRKkNaV04HL9NNUey8K8LE3lYbTA0+2qrljp3QSNS1Z/SSRDDB1Skv+yRhA7bgNRQqld7ESpb7ndjr3NFg6WD3WkkUjypLd5k5f+4xcjOFJG4Oz8BZbwUj9C8JDPG3ioYV8rf6wbOD7gpRyAvfj5+OB6WXruZ7sZA+Mjq4lTY2BAWVRwins8+Z1GWDB4uT23z6gcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ep3vRn+N1XgBL2FNM2RsM/UIs8rTnp3JE/ImPAu6YY=;
 b=O9VLGkRwt22TUvTZ7ffGnI5027x446YQOSnKLv7Pa601o6pAyxYP96YT9niD/X9o8z6T1MWJSYzPyXr2UTfVseprcx1fhvfhXlitDgeZhOBCidedQuQocpNhgRgeP+u8rpGONgcAF/GNlef5X6uW5V+LcOZq/lWlxmn2+DSicXI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5526.eurprd08.prod.outlook.com (2603:10a6:20b:108::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Thu, 25 Feb
 2021 16:20:30 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 16:20:30 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 1/3] arm-bsp/fvp-base*: move to u-boot 2021.01
Date: Thu, 25 Feb 2021 16:20:24 +0000
Message-Id: <ff23c6e49ff925107b7378afe0430ed4c6950b63.1614269958.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::27) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31 via Frontend Transport; Thu, 25 Feb 2021 16:20:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca8f875d-434a-4678-83c3-08d8d9a949f9
X-MS-TrafficTypeDiagnostic: AM7PR08MB5526:|PR2PR08MB4860:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB486011699D1DF4A55784D04B929E9@PR2PR08MB4860.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:144;OLM:144;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tnWfSwlRlfmeEUkPAB2gXoKp/eZdwbZIgb+36iSfZ3wZ56mDhhqTa6OfJOOz53leGIjNa3ZO5Y/D1D6YOToApn1MHmgD24KydOHcc2Cc88+XM/i2k9vPei4CQ21eeXm/I6OKX4OWQIFLJT7l9Q294ZE3kn62VA7q8eopylvuQabvXejR+nMw0GoLgQ68OwsKpKTGeeSQXI92oZM42YC7fPyemPjhQseZsDt9RIfiydjSrYCBaY8cVKPvA+hRfJiRg400cWxCXeohkOII7MrBxjUay3jgPNJJKqpmJmUjBZU1hrav3YqzNazfrHSl0RrYH92QwiXfY+I4oRd2MvmkcOXBYwM/l+82GcZXyPQKK/B5AYIVJvIXNPxQPnjN/txf3o3LNXfLoczmgpfmkIekjJQN7yXxZxmjoskIEjmiNPuHuXe2V3WDNJc1aJt+07y9Uxgqy8c2z4fyERbzxz1fS8cI2+hKnqEvq947O+TJlR6l4xkWrwJEHBx/G22JKW7D887oy4pEF+UbH1A5r4lFCA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(36756003)(4326008)(83380400001)(478600001)(86362001)(2906002)(6916009)(5660300002)(316002)(52116002)(66946007)(7696005)(66556008)(8936002)(6666004)(6486002)(956004)(2616005)(8676002)(16526019)(26005)(44832011)(186003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?TWCnXYaI8i1hcAn2PG15vGFCv79lJR+98dMstZ2F898U+z7xZPbsXs5nYNI3?=
 =?us-ascii?Q?arJfKurABpjR8Ln1SJna/B+kGGyRFNklUP3yojB6ot/UIPcZ8Wa9yeiDyhSe?=
 =?us-ascii?Q?Fveukkmk/VRJRJIcrvURXtk0xgAALBi14FV9nGpPv/6P4mvGVvg2lWXjIg1N?=
 =?us-ascii?Q?XNqwGRjFe3mqFXdsfrvddBJ1q/1kV438i/wCWraACRdvr4G68MiTmf1AfWXi?=
 =?us-ascii?Q?RNwnr5hBBUCrrlOvhvISt5CKsd3OIXcCKoOMkbTd15BaJ1yJfZ8N39K6LIQL?=
 =?us-ascii?Q?H5XuF8WuZHL5p4y8H9KX2L1SsJtcV2cvJzz8fC6csH+ehPpV+5np9/e6YXrD?=
 =?us-ascii?Q?H/Wih3k97J5chU4+o3b68L2UuV02tHU2Yi8Nhg7Z1NlYVRTw1igSpB52lIis?=
 =?us-ascii?Q?wme0OiMbiJAAdS62OGN626ZK+C/0JF8on+5Vw7Kahtd54XLyhesNu/RCDN9Q?=
 =?us-ascii?Q?3YgvwJFA2eB53/IauqflC/URoOJm7xbewnfDmEgW1SxM90wDxla0a9/FeDx2?=
 =?us-ascii?Q?5yaBfTtGzjTBirpGDnbwaU++Mw/ymPTStni0Fu4RDkJ2ZVdoN4AcAEZxh6jz?=
 =?us-ascii?Q?L3tA+rDIfd6E2PrtmbmjUnyrn3QRnmAZFd4qEaQLW+ge5ZKI3rFwAxbzfIu7?=
 =?us-ascii?Q?BeJXB/+PvqoDUMXDzfNPochsYXQAhxoJ40d7ghuoHIKB+dtJXXCzboqXpIeP?=
 =?us-ascii?Q?XVaXimapfffhpdwzy81z8cuGy17DYojPOcllYIRLQtJflXMus/QAMgzyun5K?=
 =?us-ascii?Q?4ucxwUIrgFpo5CIiFEA+O7SuxMWPd2/8TfF8yVZewDGbKqN8WiLyoXKjBSbm?=
 =?us-ascii?Q?Qx2cFY9rf1fQAjaBZQqq0Bz6EfmSSCc+4DrSrtlsncvZSsuAq55vFFNb4Fbo?=
 =?us-ascii?Q?oGsf+HQoBEoRs167JWXy/D6PMisXmbHAisCdFbqpPKzGGs5yIoO6wBZAh+W/?=
 =?us-ascii?Q?oFBkc907dI8DWFzr5YytU1jeiw/tQ9E2Mbk36hnlVqlCFd/m8n9FUbEF0wN7?=
 =?us-ascii?Q?Wg3uaam+jck7TKhQbesMpfk+GxgIxIKNN9ICFZuOdQZhwNgvljzO4QfhB6x5?=
 =?us-ascii?Q?KFGsZezF+TvkP6dZ83M93NOwfq7ck6moXReihFTdgWU3+OAvGHrimAfZPcdl?=
 =?us-ascii?Q?RvBrpRZ8iLNKpBGNclmqVeziv3AnHgQvrXz5gF5OfWCKYvuSkBPjCR34H2C6?=
 =?us-ascii?Q?p6iCkzNVTaVf6Re7xJVVrVxoBfHF98O4yFuQBl4NZY26CUg0gwwBAPHp+Gyu?=
 =?us-ascii?Q?uKZ2D9WqrzcppHCd+obftC8mwlp7Z47jfrhLk3Kwr7zaLDe1WwU0vgRMeTmL?=
 =?us-ascii?Q?t05Uv1FXBf+jOCQSc4aMgB6m?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5526
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a0e4085c-e8e2-44cf-2e7a-08d8d9a94537
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b9iCCK3sNDhdWC3UbJj+0JsMVKcpzYXEYRbMr5RtZjoWzXzhyVMqhYCbvKuB4QB7DZWk8MNKj6RXKgA3dZIRISPlO5fRLucegjsnxXfzMlrFRUPJ0pSXen2SVtLAo1zuAq/tvSwYwBTUvnK1HaLbDurZJBaZiGadA4ejEDEdZHjo3GyissO29wHjpClzUtxDN/CC90zf69GTqlm9T52zISDac/sZi7EC3zz3yZpBdjlQYo2CFRKR146Oydg/VrejvgxcSjogFArq37mh3OLHcmIvnAThB/HRRwzaCjZVO6uSTiufbE+60cZriLK1MvuaLCro2D2iEljLiY3SDzH4PXYCyvpZ97h375LBR1SHa4tJ3mPMSMPorWVy5b8JoegjkZctOnumhe1ch5eC7QTMb9JT+x0QNWaq/v1GfE+T2HpqAs1QF51jjM2ZfkoHVoBktBjZ7NHBMmYSNCSVnGbTkjNI+TseXy7yVY5vQuy6vFLClUFMXVkILQf9x8vaTmIWHqjdhRS7f3l+7lYZ51G6vQNaT4TrIjYiy8Lf0V0MPdfRkOvXVRf5xIWRdZVGuGlThtLhuJDA2vipHwZqbyV9b/7GQR59W3koXbNLRQloawsa5XWvKr+7fqt1ffOXH1c6bIIL11hQpBbZKUkyQXHxQENtJ8+tLyzaWGNUQeeVo24=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39830400003)(36840700001)(46966006)(36860700001)(86362001)(5660300002)(2616005)(81166007)(83380400001)(36756003)(82310400003)(44832011)(4326008)(356005)(26005)(70586007)(6916009)(8936002)(2906002)(186003)(478600001)(6486002)(7696005)(6666004)(8676002)(47076005)(316002)(956004)(336012)(70206006)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:20:38.5436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8f875d-434a-4678-83c3-08d8d9a949f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4860
Content-Type: text/plain

From: Anders Dellien <anders.dellien@arm.com>

Move both FVP platforms to u-boot 2021.01

Change-Id: I764ff964025bb1a0266f4c91469372ed5ffffde2
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-common.inc                        | 2 +-
 .../0001-Add-vexpress_aemv8a_aarch32-variant.patch              | 0
 .../fvp-base/u-boot_vexpress_fvp.patch                          | 0
 .../u-boot/{u-boot_2020.10.bbappend => u-boot_2021.01.bbappend} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.10 => u-boot-2021.01}/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot-2020.10 => u-boot-2021.01}/fvp-base/u-boot_vexpress_fvp.patch (100%)
 rename meta-arm-bsp/recipes-bsp/u-boot/{u-boot_2020.10.bbappend => u-boot_2021.01.bbappend} (100%)

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 94aa2bf..c4a5f6b 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -31,7 +31,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
 
-PREFERRED_VERSION_u-boot ?= "2020.10"
+PREFERRED_VERSION_u-boot ?= "2021.01"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.4%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.10/fvp-base/u-boot_vexpress_fvp.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base/u-boot_vexpress_fvp.patch
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bbappend
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.01.bbappend
-- 
2.17.1

