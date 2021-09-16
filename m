Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.71])
 by mx.groups.io with SMTP id smtpd.web08.720.1631811818186592803
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 10:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=95/FU/JB;
 spf=pass (domain: arm.com, ip: 40.107.1.71, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyxSRlYNv7DxX5DJEL77I2l7oRWKQaMPSFRa3Num5u0=;
 b=95/FU/JByHwpY5RL9jeOVV1tyPf9HeoLvMk+Z82jp1uICpQPR8dbMLTIStaX3RYty4Y9a6yFO7Ns8KuEuzgXNrvVY5HTQ/RJkAxXUSW//tBa6Ue4u1uCYtsZG251Rr5ymrWOe25Rsh2li4DM7MWK6EU9ck+c+mfzMAHxKuYQqmI=
Received: from AS8PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:20b:310::33)
 by VI1PR08MB3519.eurprd08.prod.outlook.com (2603:10a6:803:85::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 17:03:33 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::63) by AS8PR04CA0028.outlook.office365.com
 (2603:10a6:20b:310::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 17:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:03:32 +0000
Received: ("Tessian outbound 45760a30af4a:v103"); Thu, 16 Sep 2021 17:03:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b1159c5e86d03b9
X-CR-MTA-TID: 64aa7808
Received: from 2823c7a47651.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 310DD517-BB82-4CB0-B513-49EBD3A83C9B.1;
	Thu, 16 Sep 2021 17:03:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2823c7a47651.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Sep 2021 17:03:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnGqFHY/ApARRWNrbWmDd+lkC6g2mj5EbKHFNGXE5ydYdsrpWqrPOQcSmYClZk8hLOGevUyf8LpQQkvcYPO+iBcjlX8bqStj0VT1wEodF8d5+ylC+6D6uGdpk/XK/yqjPlerUMsr1m1R6Gse3WavBnU/GXyFMKNtSKdQ+ODVixRl6WIuEr7BcNZSBvwzAb7Ep0KCy5tn3cOOPjekfYJZQTaiAbF9RzvNHdRXK23/c7Eif2BPoaZAjv50Ig6IUi0wKqij/vBvcojRHNrAjQXlZXTk+AikSmXY0G8kQJt2zQSnBinhtGcS/Efr48SZHcvfblbkRwu3IH1t9UQuPUTbBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CyxSRlYNv7DxX5DJEL77I2l7oRWKQaMPSFRa3Num5u0=;
 b=VPUh9ahY8QLRmu/1xBeG26kiFU5pL1CE+lSIz8nKc611G8FL3etsAqwan097SasXBBNcNT7efWCQI4QTMjdz4JAv4+v3PBGxopdnT1kQ0TwkyV2bYWFrAWuqI7Q+dtHfHwze6tjc1dM6vGt3KfZpy1/9ZWwbw98S46bzS+0RYhMrI8zj0le/l0lTFg9c5IFtWqZHAwe+Lgud1vK896Yk420IR/YdFTUL1iwxc8+gIF0zyzwBZ7Niuyz7hgkIqRZaEsLU7nwFF/af+o1UxcT8giQLusU9tbei+1uXAKlWBIsoBXeb7uI0kQ+nHJSdsLj79Y2zMildt4UJPWuCybcp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyxSRlYNv7DxX5DJEL77I2l7oRWKQaMPSFRa3Num5u0=;
 b=95/FU/JByHwpY5RL9jeOVV1tyPf9HeoLvMk+Z82jp1uICpQPR8dbMLTIStaX3RYty4Y9a6yFO7Ns8KuEuzgXNrvVY5HTQ/RJkAxXUSW//tBa6Ue4u1uCYtsZG251Rr5ymrWOe25Rsh2li4DM7MWK6EU9ck+c+mfzMAHxKuYQqmI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBAPR08MB5847.eurprd08.prod.outlook.com (2603:10a6:10:1a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 16 Sep
 2021 17:03:13 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d36:69bc:4803:eee3]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d36:69bc:4803:eee3%7]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 17:03:13 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-bsp/n1sdp: Pin linux-yocto-rt to 5.10
Date: Thu, 16 Sep 2021 19:02:11 +0200
Message-Id: <20210916170212.26705-2-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210916170212.26705-1-kamil.dziezyk@arm.com>
References: <20210916170212.26705-1-kamil.dziezyk@arm.com>
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ae::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:03:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ee245bf-6898-479a-d0c1-08d97933ea36
X-MS-TrafficTypeDiagnostic: DBAPR08MB5847:|VI1PR08MB3519:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3519EC31BCABBF7A4463D834FDDC9@VI1PR08MB3519.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ey/jf06BFCK1E2JyHJUYw948kPoeo2NOt7EjzEbeZIba7yZrXDEc3bDAaDa9xx8uLs8Tr10iGkL7+jP8lVc9QoQPkp5BitSoTNeG50DPVOH9LmjnNOFDqp3stYxgPBiKU//atM2n5DxJ3jH2KU5U+bKZAjeZ9LT4Y+kA05zUFtISqhayLXxNXop2JovxPRwN39SRr7ZuU/i+flmoWUA4VynwUVxjD4lIYGslHPs5XOsZBXKcSGqEAKX5pxsTwhwg8M800xUkgz8NUieErNxb2Risbe1sSpbYmk7rLTz2nEKdV3ioJ1lgIBuE92vIm4udTrdDFpzt+L+KD+G9IzaHk7/vRKT8yyYXy8N2wprk03KCMFc4AI5HB0TP5le+tYZCctUaL3Vq5Q7mVlZAkjRB4N2NhgW0CNbBI9CvurZZkDjWrFTxtWZv1Jdhoj4mWyASanCNBq/laV65yzV6Lr+q8jhfCvlL7Nh9tXmdRio+NKqG3vOzI51spKUJTZzOMCaxvouKyIZksnBCiNKDrqrYIFgWBZE6TgPRHRmRsXAiAERGeIoRmEib9tVlwZDAYmtnDptGlsOhsABTpbbSwyG9f8BnKn0dHNPF4X9aA1YBKWrKqVb9gZ/3cO4WCumSn2aVb0Fa2e+h8L5Bs4CUJigxr+9Z6z+B8zagLrEhL/Pp1DZ3JqK3MerIOCKQZV2RTGz+L5C51xT5B/0xr5CZBXmrtcdf23rk5opZo9MY8XN9AAMPdrV5Tbb2JLojbXBG0gkn
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(6916009)(44832011)(38100700002)(956004)(1076003)(38350700002)(2906002)(7696005)(4744005)(36756003)(26005)(6486002)(4326008)(8936002)(316002)(86362001)(5660300002)(8676002)(66556008)(2616005)(66946007)(66476007)(478600001)(83380400001)(186003)(52116002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5847
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	939db827-b040-45c9-f592-08d97933de1b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4yEBR/74TNkw3MokQZrQriYp8N3VIv3NTMhP8txErL9XRLJjsT+oOtjbnI1PxQPZPQVXJe5C6KOGJy5iHoWbd7kkW6hImZviVgTQojM/eJl6mevQgnV4B4VEn/nj9nbXOcoXFGHC7UaugNF8VHwIy3FHE41aojYoRC22qAqZJzvaUN7s/sZfuNv2xz8HnYj1ssGaFuEg301/0HJBrhObpxbTxhxbXsW1F5xF/I+IWH2g7AKS9FudrrQLK6i/lsqR95cwBRf9K/wD077NplCTUv3ZWb4SwbOka2pBo8nYSqYpjYtmXjn9LBZPDuJGjK0AshvOmi4xbkH/Dplj5uI0aDocpJWc6x3LVZZ6OZH4Ha9GxgLGE+yhW4IGZXKHysBjvU7dO3XaEHt9yG7uQXBQGlM7UVdwQ2mIzNHiAH4gL9jnSZM4NNgWgBB0a3xRIovpLuF7DZUc1Kk1OOUJ2xYTHcH5RY4RFl8xoq0qwGldgb6HHt4wVJPk9mOJ5OQK47ihRMGJN/ldD9F6GmXCYttD1g+GBFh+6hOzv3BWD8tz6FCQ5zZkSohdru99plzKHpf262IFWP9SjvOAXTcEVxiEWEpgUqS24GUQetLj92ALNG5IcY5te845viOKYHbGDhq/xpvC5yQnlXsdZnZEnhSe42R6L7Yq1CjOUkrHhqPw0btUtrLqLak7ifNmrQdtwbYuM8/TbTGBe15obYewWBqZcDzCRr0dpJAMVf0Zwa3knJ2WAhDtGFjJDGAYxdfwO3xV
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(70586007)(1076003)(4744005)(2906002)(4326008)(36860700001)(81166007)(356005)(82310400003)(6916009)(316002)(7696005)(26005)(2616005)(83380400001)(186003)(336012)(956004)(70206006)(6486002)(44832011)(47076005)(86362001)(5660300002)(82740400003)(8676002)(8936002)(478600001)(36756003)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 17:03:32.8830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee245bf-6898-479a-d0c1-08d97933ea36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3519
Content-Type: text/plain

This pins the rt kernel to the same version as the standard kernel.
Poky has recently upgraded to 5.13, which has not yet been validated
on the n1sdp.

Issue-Id: SCM-2987
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: Ie53c27e46f529f5e5dc5a6a6b32d2c021ca22651
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index b0d97f8..7e265ba 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -20,6 +20,7 @@ WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
 # Use kernel provided by yocto
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
+PREFERRED_VERSION_linux-yocto-rt ?= "5.10%"
 
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "linux-firmware-rtl8168"
-- 
2.17.1

