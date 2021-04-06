Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.70])
 by mx.groups.io with SMTP id smtpd.web08.10755.1617710302261497938
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 04:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0E5mvm/I;
 spf=pass (domain: arm.com, ip: 40.107.0.70, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7RffmPJZRxjb3zZNcH0yZprlbcXLfNkq4KSnJrbPs4=;
 b=0E5mvm/IL7DmyP9zxufWJ4VIMFp7L46JcKBhi0KwqwUpKuxhG0+ECEoNxBumBVFZRf7vLUt4/8zV1klrAwzvlXSDC1Nj+aJPz232AY+LJtUOfFxtjXEldeoS4HsiCbWRnkpW9cpqBDpDLF2pL01T8Y6OMi/Hnqu6sbp2dbNqB4Q=
Received: from AM5P194CA0005.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::15)
 by AM0PR08MB2977.eurprd08.prod.outlook.com (2603:10a6:208:63::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Tue, 6 Apr
 2021 11:58:14 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::79) by AM5P194CA0005.outlook.office365.com
 (2603:10a6:203:8f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend
 Transport; Tue, 6 Apr 2021 11:58:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29 via Frontend Transport; Tue, 6 Apr 2021 11:58:14 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90"); Tue, 06 Apr 2021 11:58:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 93e988b6e48a8079
X-CR-MTA-TID: 64aa7808
Received: from 269f49f2fa10.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9ECA56DF-24CB-4B44-9033-E01E2C19588D.1;
	Tue, 06 Apr 2021 11:58:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 269f49f2fa10.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Apr 2021 11:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXJ+j3Fjku0ziluhebNtdVDXMnfWKXYQmoZrXyqqeA8R6XQwXLM8037/uv1hC+MQa9MXc1NCEU116NRYNzkG+Q2joJS4IpxWN+r+TqtTp4geAjy1Itimm/i217ue7smR/tvmnamuIq9hjYKiXig92MADmXmgPMMuhNR537TQvVE7OGc8xljeuy8N8gDKSn8iYvpKCVzKv8SFkea4AdkCB1nw4gbC65jxzohgPYvT8hNGm+OR1PEnJcz+O1Nou1DPgL0yB1ILJ7JwOCxrNEWQOq7Rs7PVE8Yz9bAQ74VpabnMvZs2qLgMLia1a1DH+h2gA5ElcKiTWso87KJfmHQetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7RffmPJZRxjb3zZNcH0yZprlbcXLfNkq4KSnJrbPs4=;
 b=UR6jFtr9R4kGhKB40pQKu7VZe0eib4FDqoQpII6t3+y9hCQTmo8zKwBCFtFRwr/0D1v/fNJDFXpU3fhaeKlxEy86jvLHGMNM2vWSnccr6YsP8DaVzaspJSQPHoQSyYTp52uRCuWXHyy8MI8f5UAAqiW8yqPGy22SMJG8z9BrJcf4gJOLEb8E7iyAAhuQlAbVDl0xpoGUb9jO6kFBFJshANpddEuQry6b82+NZeno2ZT7xf5U7li2WvkXViSJqlAB1CbfpnOb3j2X8maB/HsOeVjfGeA1JKBDSOWyWxWAEMlqWMMZuY6KxeWv6byrlC4ebOVUmzha2xgZVYp8qEuCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7RffmPJZRxjb3zZNcH0yZprlbcXLfNkq4KSnJrbPs4=;
 b=0E5mvm/IL7DmyP9zxufWJ4VIMFp7L46JcKBhi0KwqwUpKuxhG0+ECEoNxBumBVFZRf7vLUt4/8zV1klrAwzvlXSDC1Nj+aJPz232AY+LJtUOfFxtjXEldeoS4HsiCbWRnkpW9cpqBDpDLF2pL01T8Y6OMi/Hnqu6sbp2dbNqB4Q=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Tue, 6 Apr
 2021 11:57:50 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::fd0c:6bcb:8df2:c39b%4]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:57:50 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/edk2-firmware: upgrade n1sdp to 202102
Date: Tue,  6 Apr 2021 17:27:35 +0530
Message-Id: <20210406115735.13620-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.55]
X-ClientProxiedBy: PN2PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::10) To VE1PR08MB4846.eurprd08.prod.outlook.com
 (2603:10a6:802:ae::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.55) by PN2PR01CA0065.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:23::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Tue, 6 Apr 2021 11:57:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c2cc6b7-5727-4158-8093-08d8f8f34207
X-MS-TrafficTypeDiagnostic: VI1PR08MB5517:|AM0PR08MB2977:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB29773DAD59F77AA28F480377FA769@AM0PR08MB2977.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uS8vz0qOEu0sK1FrN8OUukFu2Cv6Bh2Y5twIZfFqQMGhUFueQjbie5JyuNl46pnC+8TexVUKXHK2NUgxaRNdAgATG643qdC4MBJWeDLTeSbNmXE09clDawtcM431330DXtWmyC9jM/WZSMp0VeC8lJ4W1q7s7RRZoaMeYAgofEgwj+kzsAvMpaMlkNwhNoXFEdf8S6SgCZzTdRI+mf29idzwTmNYuAgxi105t+jNwviDJQCktedtPzYWEspD9omCqCCEofe+cMzZ84GzsLoXtnLkjlJZRaUasWCu/lKHmDHdrytzg36fq5wwipr8F0qSev+hPhGjIc4ZdEJGfXYMMn8ltPhtI2bzxcB+vIMXMu2JShPY41Mdo9ZhgmDpKJYK5+vZ2+tx3AWZkaL4O2A96TLVWUsILh15rWPCdyBCfEznZnAcXsYZHgr9fGx/zE7ssOTlEoR8mWgryUqK1aMf7g0xM+mJMKyRJ+wkhD5dQW9WSCe2QzDvsuzsNUM4Yf97iA9lH3dMdtMMDK/a7PPPpb/znwnHRPg2AVOsc8CYqusozLEDcnXTaF25E0IifLDA6oKRoxFa3CTTLjul15OsK2/NhASuhfxs/gbaTmvHWHlDuGjAeUsf2XEnyT0j4WE11Ig/DyjJnTfXPcoyaGBLr72wpeYE2xArSDGiZgVfKmHpcABpBRk6ofyEfmLCRVBdxhjHXc130i+xasx58fFk+f8RaLHI4Zs3SOhNGRL22mgUOzmKC0yx74lDZn+d9twvYveW0kERaq0NHfxf8xd3Sw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(83380400001)(6916009)(38100700001)(38350700001)(316002)(186003)(16526019)(86362001)(36756003)(66556008)(66476007)(6486002)(66946007)(8936002)(8676002)(2906002)(19627235002)(6666004)(52116002)(4326008)(7696005)(5660300002)(26005)(478600001)(2616005)(1076003)(956004)(30864003)(32563001)(559001)(579004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?nHXtQ8i+UQkE4CoQHNs7ATkmKJEf3y6hJlTb8s2UEl1jZHYVnirpf4IgRvOY?=
 =?us-ascii?Q?uuQ/lvtmdPP27dC7w00PFkDjPLe14DtuxsxcXiEIz62pyE2u4MQb32JGGyc/?=
 =?us-ascii?Q?1Ni1PkCZ+mtT7cg3cuTI6v/vsCUM7CYXmIxtMeyvB0fPYAUmNVCOuNUmO/eq?=
 =?us-ascii?Q?fXU1rus/HwYe0xI3V8Ot/T8kUnF0g2LApSs/5CgAC0+0VBCItcssI1sU6H26?=
 =?us-ascii?Q?gK/jWDuBTh8CcaTCnn6AqiOJSMCYD2z6xpGg5sTt2a8z2VWgOuk3wFMFo+6T?=
 =?us-ascii?Q?sWzpaJW9k/6N+JyFNrYmYDIDkbl3mhCOVe2/kKc1ZAGFIFJS9UC0IhOspvYt?=
 =?us-ascii?Q?V8ls0LFxdY4Mgw3AMJJXqzKyD+nU5y+vIaWw/+bdBfVbjw0YQBQphy9REDLI?=
 =?us-ascii?Q?IvmU2EbMrkvw3HZmlUQ+J4cSXPGXk+JP8NvyY2K4qjQBv5PJDmTUWEBGX07V?=
 =?us-ascii?Q?ie39Ix+KWqPSmEN+C3Sy0GQlYsxBT8H/+8EkvhCdC7ReT8Sg1/FVepObwlcX?=
 =?us-ascii?Q?GfGEK8bI0RcJc5ZTAaSAsuTBreVj1tyykZs3DFqsNjhnfGjc/k+qdMdNoO3h?=
 =?us-ascii?Q?b6KC7KfOflpL8XQFZYrPWWq9kVNreXeiD/DefB4gsrCgBakfJy2gFgqG1A2W?=
 =?us-ascii?Q?2p7rI87k03CE46mCP1UITwz9S3pnHTJAEY5fliVcWmAPLhmxtNUwp8QvNeHE?=
 =?us-ascii?Q?KKLc3gaiaflkHbW20TbFZdHPgaC7traSKHjI+9tKwq80nUMjAf9chs99bT+P?=
 =?us-ascii?Q?sKpxpyYyO892FUbm8rN/tyEqSg3h0nBiX2i2LU1cgXB22+ph7pLF3NK9j+Dm?=
 =?us-ascii?Q?w40k6vqfG2lTZT35tk0B0JhFFqSVrNfnica2zXx1jjj1fN2vY3mw/5PUSzdR?=
 =?us-ascii?Q?VAzbfX/roHgf/QYwFMG1xN+CfcCGcvWTxWf+I7V71rP9aIGxBwkzA/5QoqNd?=
 =?us-ascii?Q?D+mT4EMVcBrsNOvJrPalxgxbrDW8ibHbo4/ydWykaKdQ/ur39awVkaovYIqh?=
 =?us-ascii?Q?LzdjA7WLVwmTc9YvevJxGjPtgsnmUiVRfM5ZWxJ5XKA+BxIQURun3gkrkvSy?=
 =?us-ascii?Q?SLm497pyoZzMyLzHiSDLdG0HDaJsu+eH/tEiXCPJ445cMaLkyjpTy17FuGpb?=
 =?us-ascii?Q?T7SzGlYLqoc3WjQz4WAVf3o7EAXO+i6c6230Eog9EFfef3CrpSUUwBdST04y?=
 =?us-ascii?Q?nFiCmrz3687Ll5JLu60OObkceIxaiY3TeBONtamZy2gWFGDdopmvmmjPiwM8?=
 =?us-ascii?Q?4Q3s2cGBxAGQeNEjb3F+h9eW/+lttq9Z5oTSuAbxEu2jn7EZfKOVF75JydMe?=
 =?us-ascii?Q?DQectpWh42RGlYyqpBnsFPzp?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5517
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9425b910-d514-4496-2261-08d8f8f3332f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m2afu6SAvs5/LreEYArkJuoE8goDCjJCkVLTvrFQ0og07RvAtgIDF0bMROvqlaQNwKbn4i9VPeEIBAEI+d0tdH4QSOTvn67vGbV2nsPpczniIC1Z7oluh9CNeSXGclPyINbWtIsqi8LFTnklaYDg/ZXyfkATLevUZOePUk1UakM++nCzfMFrdijlsk8ozLSVZhjp8iJ+EL5NiInX3SzY3i0lFzfibFNyo2IlIuc3YDzel4lEy0ypVne9f6uS8f4y5mIBiybuDU62V50fnRHlF83xU71Vi+Zo5TNRDghMnHkgcBSnGXncMqwzXqLj3EDX1oY1D9+N8HgIvEjoCaCRRzu3gh4RVX5Q0anzhfE4cxX0QAFNufpXApUftORJxE0plos2cfVghn+uCY246HXYqMFjnntmru7hYSXapH/jiffuR6pb9Y+7Il7SCe7to5i0AGaEaVwM2fyWB5szse2gHPeS7pE3hW8IZfoQCI4WYBaK3NP0vRre02AzD08p3ZEGzZNt+FxYzQ2naNltMBej/2jazXPOyLhDxC/R46W2gUIo0ZrSkgIYeEu5r0bK8gCbqVtJDD8riVI5OfaeXj+QNOe7/hGZ+VKgEsRtLdpg7aQtYxhxHwkJ0XVquU3u5nj2DondJ3IuktJr31x8MEbTAE2ZiJ968IqYqiysMFqOoeqVa5myuKuRkhi8xl3XR4eHAEOtgNiZWo6JIFQQPwTihscT5j429SNEcOCy7cH2OIg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(46966006)(36840700001)(36756003)(6916009)(2906002)(356005)(81166007)(316002)(6486002)(83380400001)(70586007)(5660300002)(70206006)(7696005)(86362001)(186003)(6666004)(16526019)(336012)(26005)(2616005)(956004)(30864003)(47076005)(8936002)(8676002)(36860700001)(82740400003)(1076003)(4326008)(478600001)(82310400003)(19627235002)(32563001)(559001)(579004)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:58:14.0674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2cc6b7-5727-4158-8093-08d8f8f34207
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2977
Content-Type: text/plain

edk2-firmware for n1sdp is ported and upgraded to 202102 version.

Change-Id: I08dcc7d1442ec9a9121ce648e68872d63169346a
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |    2 +-
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |    7 +-
 .../uefi/edk2-firmware_202102.bbappend        |    1 +
 .../n1sdp/Add-mem-regions-to-support.patch    |  216 +
 .../Configuration-Manager-for-N1SDP.patch     | 4111 +++++++++++++++++
 ...able-N1SDP-platform-specific-configs.patch |  245 +
 .../n1sdp/Introduce-platform-DXE-driver.patch |  122 +
 .../uefi/files/n1sdp/initialise.patch         |   32 -
 8 files changed, 4701 insertions(+), 35 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regions-to-support.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable-N1SDP-platform-specific-configs.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-platform-DXE-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 0fc4bb8..26c1a96 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -33,7 +33,7 @@ PREFERRED_VERSION_scp-firmware ?= "2.7%"
 
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
-PREFERRED_VERSION_edk2-firmware ?= "201911%"
+PREFERRED_VERSION_edk2-firmware ?= "202102%"
 
 #grub-efi
 EFI_PROVIDER ?= "grub-efi"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 07a41b0..0009e85 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,11 +1,14 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
-SRC_URI += "file://initialise.patch"
+SRC_URI_append = " file://Add-mem-regions-to-support.patch;patchdir=${S}/edk2-platforms \
+                   file://Introduce-platform-DXE-driver.patch;patchdir=${S}/edk2-platforms \
+                   file://Enable-N1SDP-platform-specific-configs.patch;patchdir=${S}/edk2-platforms \
+                   file://Configuration-Manager-for-N1SDP.patch;patchdir=${S}/edk2-platforms "
 
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE = "0"
 EDK2_PLATFORM      = "n1sdp"
-EDK2_PLATFORM_DSC  = "Platform/ARM/N1SdpPkg/N1SdpPlatform.dsc"
+EDK2_PLATFORM_DSC  = "Platform/ARM/N1Sdp/N1SdpPlatform.dsc"
 EDK2_BIN_NAME      = "BL33_AP_UEFI.fd"
 EDK2_ARCH          = "AARCH64"
 
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
index d34cd27..1f4c28b 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware_202102.bbappend
@@ -4,5 +4,6 @@ MACHINE_EDK2_REQUIRE ?= ""
 
 MACHINE_EDK2_REQUIRE_fvp-base = "edk2-firmware-fvp-base.inc"
 MACHINE_EDK2_REQUIRE_sgi575 = "edk2-firmware-sgi575.inc"
+MACHINE_EDK2_REQUIRE_n1sdp = "edk2-firmware-n1sdp.inc"
 
 require ${MACHINE_EDK2_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regions-to-support.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regions-to-support.patch
new file mode 100644
index 0000000..6f47e2e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Add-mem-regions-to-support.patch
@@ -0,0 +1,216 @@
+From f5ad583b2b3d480ab21682056b56eb59057fca70 Mon Sep 17 00:00:00 2001
+From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 6 Apr 2021 15:06:57 +0530
+Subject: [PATCH 1/4] Silicon/ARM/NeoverseN1Soc: Add mem regions to support C2C
+ usecase
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+This patch adds resource descriptor for multi-chip usecase and
+introduces corresponding PCD definitions.
+
+Change-Id: Iadf432a8008f1becf916e21ff84fa1c387b1ceae
+
+Signed-off-by: Chandni Cherukuri <chandni.cherukuri@arm.com>
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+---
+ .../Library/PlatformLib/PlatformLib.inf       | 14 +++-
+ .../Library/PlatformLib/PlatformLibMem.c      | 67 ++++++++++++++++++-
+ Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   | 28 +++++++-
+ 3 files changed, 103 insertions(+), 6 deletions(-)
+
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
+index 166c9e0444..791aeb96ad 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
+@@ -1,6 +1,6 @@
+ ## @file
+ #
+-#  Copyright (c) 2018-2020, ARM Limited. All rights reserved.
++#  Copyright (c) 2018-2021, ARM Limited. All rights reserved.<BR>
+ #
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent
+ #
+@@ -47,6 +47,18 @@
+ 
+   gArmNeoverseN1SocTokenSpaceGuid.PcdDramBlock2Base
+ 
++  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace
++
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMax
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMin
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixExpressBaseAddress
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Base
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Size
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Base
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Size
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseAddress
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize
++
+ [Guids]
+   gEfiHobListGuid          ## CONSUMES  ## SystemTable
+ 
+diff --git a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+index f9b3d03753..a2785dcfbd 100644
+--- a/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
++++ b/Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLibMem.c
+@@ -1,6 +1,6 @@
+ /** @file
+ *
+-*  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.
++*  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
+ *
+ *  SPDX-License-Identifier: BSD-2-Clause-Patent
+ *
+@@ -13,7 +13,7 @@
+ #include <NeoverseN1Soc.h>
+ 
+ // The total number of descriptors, including the final "end-of-table" descriptor.
+-#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 13
++#define MAX_VIRTUAL_MEMORY_MAP_DESCRIPTORS 19
+ 
+ /**
+   Returns the Virtual Memory Map of the platform.
+@@ -35,6 +35,7 @@ ArmPlatformGetVirtualMemoryMap (
+   EFI_RESOURCE_ATTRIBUTE_TYPE   ResourceAttributes;
+   NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;
+   UINT64                        DramBlock2Size;
++  UINT64                        RemoteDdrSize;
+ 
+   PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
+   DramBlock2Size = ((UINT64)(PlatInfo->LocalDdrSize -
+@@ -55,6 +56,24 @@ ArmPlatformGetVirtualMemoryMap (
+     FixedPcdGet64 (PcdDramBlock2Base),
+     DramBlock2Size);
+ 
++  if (PlatInfo->MultichipMode == 1) {
++    RemoteDdrSize = ((PlatInfo->RemoteDdrSize - 2) * 1024UL * 1024UL * 1024UL);
++
++    BuildResourceDescriptorHob (
++      EFI_RESOURCE_SYSTEM_MEMORY,
++      ResourceAttributes,
++      FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (PcdSystemMemoryBase),
++      PcdGet64 (PcdSystemMemorySize)
++      );
++
++    BuildResourceDescriptorHob (
++      EFI_RESOURCE_SYSTEM_MEMORY,
++      ResourceAttributes,
++      FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (PcdDramBlock2Base),
++      RemoteDdrSize
++      );
++  }
++
+   ASSERT (VirtualMemoryMap != NULL);
+   Index = 0;
+ 
+@@ -114,6 +133,32 @@ ArmPlatformGetVirtualMemoryMap (
+   VirtualMemoryTable[Index].Length          = PcdGet64 (PcdPcieMmio64Size);
+   VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
+ 
++  // CCIX RC Configuration Space
++  VirtualMemoryTable[++Index].PhysicalBase  = PcdGet32 (PcdCcixRootPortConfigBaseAddress);
++  VirtualMemoryTable[Index].VirtualBase     = PcdGet32 (PcdCcixRootPortConfigBaseAddress);
++  VirtualMemoryTable[Index].Length          = PcdGet32 (PcdCcixRootPortConfigBaseSize);
++  VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
++
++  // CCIX ECAM Configuration Space
++  VirtualMemoryTable[++Index].PhysicalBase  = PcdGet32 (PcdCcixExpressBaseAddress);
++  VirtualMemoryTable[Index].VirtualBase     = PcdGet32 (PcdCcixExpressBaseAddress);
++  VirtualMemoryTable[Index].Length          = (FixedPcdGet32 (PcdCcixBusMax) -
++                                               FixedPcdGet32 (PcdCcixBusMin) + 1) *
++                                               SIZE_1MB;
++  VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
++
++  // CCIX MMIO32 Memory Space
++  VirtualMemoryTable[++Index].PhysicalBase  = PcdGet32 (PcdCcixMmio32Base);
++  VirtualMemoryTable[Index].VirtualBase     = PcdGet32 (PcdCcixMmio32Base);
++  VirtualMemoryTable[Index].Length          = PcdGet32 (PcdCcixMmio32Size);
++  VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
++
++ // CCIX MMIO64 Memory Space
++  VirtualMemoryTable[++Index].PhysicalBase  = PcdGet64 (PcdCcixMmio64Base);
++  VirtualMemoryTable[Index].VirtualBase     = PcdGet64 (PcdCcixMmio64Base);
++  VirtualMemoryTable[Index].Length          = PcdGet64 (PcdCcixMmio64Size);
++  VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
++
+   // SubSystem Pheripherals - UART0
+   VirtualMemoryTable[++Index].PhysicalBase  = NEOVERSEN1SOC_UART0_BASE;
+   VirtualMemoryTable[Index].VirtualBase     = NEOVERSEN1SOC_UART0_BASE;
+@@ -138,6 +183,24 @@ ArmPlatformGetVirtualMemoryMap (
+   VirtualMemoryTable[Index].Length          = NEOVERSEN1SOC_EXP_PERIPH_BASE0_SZ;
+   VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_DEVICE;
+ 
++  if (PlatInfo->MultichipMode == 1) {
++    //Remote DDR (2GB)
++    VirtualMemoryTable[++Index].PhysicalBase  = PcdGet64 (PcdExtMemorySpace) +
++                                                PcdGet64 (PcdSystemMemoryBase);
++    VirtualMemoryTable[Index].VirtualBase     = PcdGet64 (PcdExtMemorySpace) +
++                                                PcdGet64 (PcdSystemMemoryBase);
++    VirtualMemoryTable[Index].Length          = PcdGet64 (PcdSystemMemorySize);
++    VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH;
++
++    //Remote DDR
++    VirtualMemoryTable[++Index].PhysicalBase  = PcdGet64 (PcdExtMemorySpace) +
++                                                PcdGet64 (PcdDramBlock2Base);
++    VirtualMemoryTable[Index].VirtualBase     = PcdGet64 (PcdExtMemorySpace) +
++                                                PcdGet64 (PcdDramBlock2Base);
++    VirtualMemoryTable[Index].Length          = RemoteDdrSize;
++    VirtualMemoryTable[Index].Attributes      = ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH;
++  }
++
+   // End of Table
+   VirtualMemoryTable[++Index].PhysicalBase  = 0;
+   VirtualMemoryTable[Index].VirtualBase     = 0;
+diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
+index 54b793a937..aa7c6615d1 100644
+--- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
++++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
+@@ -1,5 +1,5 @@
+ #
+-#  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.
++#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
+ #
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent
+ #
+@@ -33,8 +33,8 @@
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMax|17|UINT32|0x00000005
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMin|0|UINT32|0x00000006
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoBase|0x0|UINT32|0x00000007
+-  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoMaxBase|0x00FFFFFF|UINT32|0x00000008
+-  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoSize|0x01000000|UINT32|0x00000009
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoMaxBase|0x001FFFF|UINT32|0x00000008
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoSize|0x020000|UINT32|0x00000009
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoTranslation|0x75200000|UINT32|0x0000000A
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Base|0x71200000|UINT32|0x0000000B
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32MaxBase|0x751FFFFF|UINT32|0x0000000C
+@@ -44,3 +44,25 @@
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64MaxBase|0x28FFFFFFFF|UINT64|0x00000010
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Size|0x2000000000|UINT64|0x00000011
+   gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Translation|0x0|UINT64|0x00000012
++
++  # CCIX
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusCount|18|UINT32|0x00000016
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMax|17|UINT32|0x00000017
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMin|0|UINT32|0x00000018
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixExpressBaseAddress|0x68000000|UINT32|0x00000019
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoBase|0x0|UINT32|0x0000001A
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoMaxBase|0x01FFFF|UINT32|0x0000001B
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoSize|0x020000|UINT32|0x0000001C
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoTranslation|0x6D200000|UINT32|0x00000001D
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Base|0x69200000|UINT32|0x0000001E
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32MaxBase|0x6D1FFFFF|UINT32|0x00000001F
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Size|0x04000000|UINT32|0x00000020
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Translation|0x0|UINT32|0x00000021
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Base|0x2900000000|UINT64|0x00000022
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64MaxBase|0x48FFFFFFFF|UINT64|0x00000023
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Size|0x2000000000|UINT64|0x00000024
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Translation|0x0|UINT64|0x00000025
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseAddress|0x62000000|UINT32|0x00000026
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize|0x00001000|UINT32|0x00000027
++
++  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0x40000000000|UINT64|0x00000029
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch
new file mode 100644
index 0000000..c5bc9a0
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Configuration-Manager-for-N1SDP.patch
@@ -0,0 +1,4111 @@
+From 007f8e0b68ca39a3155e42707e9d955791eaabcd Mon Sep 17 00:00:00 2001
+From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 6 Apr 2021 15:28:37 +0530
+Subject: [PATCH 4/4] Platform/ARM/N1Sdp: Configuration Manager for N1SDP
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+The dynamic tables framework utilizes the configuration manager
+protocol to get the platform specific information required for
+building the firmware tables.
+
+The configuration manager is a platform specific component that
+collates the platform hardware information and builds an abstract
+platform configuration repository. The configuration manager also
+implements the configuration manager protocol which returns the
+hardware information requested by the table generators.
+
+This patch implements the configuration manager for N1SDP
+platform. It enables support for generating the following
+ACPI tables:
+             1. FACP
+             2. DSDT
+             3. GTDT
+             4. APIC
+             5. SPCR
+             6. DBG2
+             7. PPTT
+             8. IORT
+             9. MCFG
+            10. SSDT - PCI
+            11. SSDT - REMOTE PCI
+
+Also added :
+   ACPI bindings for CoreSight components.
+   Support for Arm CMN-600 PMU
+   HMAT table and expose CCIX memory as EFI_MEMORY_SP
+
+Change-Id: I100d592769642f4a6d18846a66f9f2bb047f0856
+Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+Signed-off-by: Chandni Cherukuri <chandni.cherukuri@arm.com>
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
+Signed-off-by: anukou01 <anurag.koul@arm.com>
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+---
+ .../ConfigurationManager.dsc.inc              |   16 +
+ .../AslTables/Dsdt.asl                        |  478 ++++
+ .../AslTables/SsdtPci.asl                     |  248 ++
+ .../AslTables/SsdtRemotePci.asl               |  157 ++
+ .../ConfigurationManager.c                    | 2219 +++++++++++++++++
+ .../ConfigurationManager.h                    |  310 +++
+ .../ConfigurationManagerDxe.inf               |  171 ++
+ .../ConfigurationManagerDxe/Hmat.c            |  104 +
+ .../ConfigurationManagerDxe/Platform.h        |   92 +
+ .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.c   |    1 +
+ .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf |    4 +
+ Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h  |   35 +
+ Platform/ARM/N1Sdp/N1SdpPlatform.dec          |   12 +-
+ Platform/ARM/N1Sdp/N1SdpPlatform.dsc          |    9 +
+ Platform/ARM/N1Sdp/N1SdpPlatform.fdf          |    9 +
+ Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec   |    5 +
+ 16 files changed, 3868 insertions(+), 2 deletions(-)
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.inc
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/Dsdt.asl
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtPci.asl
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtRemotePci.asl
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.h
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Hmat.c
+ create mode 100644 Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Platform.h
+ create mode 100644 Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h
+
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.inc b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.inc
+new file mode 100644
+index 0000000000..bcd4bf334d
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.inc
+@@ -0,0 +1,16 @@
++## @file
++#  dsc include file for Configuration Manager
++#
++#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++#
++#  SPDX-License-Identifier: BSD-2-Clause-Patent
++#
++##
++
++[Defines]
++
++[BuildOptions]
++
++[Components.common]
++  # Configuration Manager
++  Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/Dsdt.asl b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/Dsdt.asl
+new file mode 100644
+index 0000000000..cfb5dc0dca
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/Dsdt.asl
+@@ -0,0 +1,478 @@
++/** @file
++*  Differentiated System Description Table Fields (DSDT)
++*
++*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++*
++*  SPDX-License-Identifier: BSD-2-Clause-Patent
++*
++**/
++
++#include "N1SdpAcpiHeader.h"
++#include "NeoverseN1Soc.h"
++
++#define ACPI_GRAPH_REV        0
++#define ACPI_GRAPH_UUID       "ab02a46b-74c7-45a2-bd68-f7d344ef2153"
++
++#define CORESIGHT_GRAPH_UUID  "3ecbc8b6-1d0e-4fb3-8107-e627f805c6cd"
++
++#define CS_LINK_MASTER        1
++#define CS_LINK_SLAVE         0
++
++#define DSD_CS_GRAPH_BEGIN(_nports)       \
++        Package () {                      \
++          1,                              \
++          ToUUID(CORESIGHT_GRAPH_UUID),   \
++          _nports,
++
++#define DSD_CS_GRAPH_END  \
++        }
++
++#define DSD_GRAPH_BEGIN(_nports)      \
++     ToUUID(ACPI_GRAPH_UUID),         \
++     Package() {                      \
++       ACPI_GRAPH_REV,                \
++       1,                             \
++       DSD_CS_GRAPH_BEGIN(_nports)
++
++#define DSD_GRAPH_END     \
++       DSD_CS_GRAPH_END   \
++     }
++
++#define DSD_PORTS_BEGIN(_nports)    \
++   Name (_DSD,  Package () {        \
++     DSD_GRAPH_BEGIN(_nports)
++
++#define DSD_PORTS_END     \
++   DSD_GRAPH_END          \
++  })
++
++#define CS_PORT(_port, _rport, _rphandle, _dir)       \
++    Package () { _port, _rport, _rphandle, _dir}
++
++#define CS_INPUT_PORT(_port, _rport, _rphandle)       \
++    CS_PORT(_port, _rport, _rphandle, CS_LINK_SLAVE)
++
++#define CS_OUTPUT_PORT(_port, _rport, _rphandle)      \
++    CS_PORT(_port, _rport, _rphandle, CS_LINK_MASTER)
++
++DefinitionBlock("Dsdt.aml", "DSDT", 1, "ARMLTD", "N1SDP", EFI_ACPI_ARM_OEM_REVISION) {
++  Scope(_SB) {
++    Device(CP00) { // Ares-0: Cluster 0, Cpu 0
++      Name(_HID, "ACPI0007")
++      Name(_UID, Zero)
++      Name(_STA, 0xF)
++      Device(ETM0) { // ETM on Cluster0 CPU0
++        Name (_HID, "ARMHC500")
++        Name (_CID, "ARMHC500")
++        Name (_CRS, ResourceTemplate() {
++          QWordMemory (
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                                   // Granularity
++            FixedPcdGet64 (PcdCsEtm0Base),                // Min Base Address
++            FixedPcdGet64 (PcdCsEtm0MaxBase),             // Max Base Address
++            0,                                            // Translate
++            FixedPcdGet32 (PcdCsComponentSize)            // Length
++          )
++        })
++        DSD_PORTS_BEGIN(1)
++        CS_OUTPUT_PORT(0, 0, \_SB_.SFN0)
++        DSD_PORTS_END
++      } // ETM0
++    }
++
++    Device(CP01) { // Ares-1: Cluster 0, Cpu 1
++      Name(_HID, "ACPI0007")
++      Name(_UID, One)
++      Name(_STA, 0xF)
++      Device(ETM1) { // ETM on Cluster0 CPU1
++        Name (_HID, "ARMHC500")
++        Name (_CID, "ARMHC500")
++        Name (_CRS, ResourceTemplate() {
++          QWordMemory (
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                               // Granularity
++            FixedPcdGet64 (PcdCsEtm1Base),            // Min Base Address
++            FixedPcdGet64 (PcdCsEtm1MaxBase),         // Max Base Address
++            0,                                        // Translate
++            FixedPcdGet32 (PcdCsComponentSize)        // Length
++          )
++        })
++        DSD_PORTS_BEGIN(1)
++        CS_OUTPUT_PORT(0, 1, \_SB_.SFN0)
++        DSD_PORTS_END
++      } // ETM1
++    }
++
++    Device(CP02) { // Ares-2: Cluster 1, Cpu 0
++      Name(_HID, "ACPI0007")
++      Name(_UID, 2)
++      Name(_STA, 0xF)
++      Device(ETM2) { // ETM on Cluster1 CPU0
++        Name (_HID, "ARMHC500")
++        Name (_CID, "ARMHC500")
++        Name (_CRS, ResourceTemplate() {
++          QWordMemory (
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                               // Granularity
++            FixedPcdGet64 (PcdCsEtm2Base),            // Min Base Address
++            FixedPcdGet64 (PcdCsEtm2MaxBase),         // Max Base Address
++            0,                                        // Translate
++            FixedPcdGet32 (PcdCsComponentSize)        // Length
++          )
++        })
++        DSD_PORTS_BEGIN(1)
++        CS_OUTPUT_PORT(0, 0, \_SB_.SFN1)
++        DSD_PORTS_END
++      } // ETM2
++    }
++
++    Device(CP03) { // Ares-3: Cluster 1, Cpu 1
++      Name(_HID, "ACPI0007")
++      Name(_UID, 3)
++      Name(_STA, 0xF)
++      Device(ETM3) { // ETM on Cluster0 CPU0
++        Name (_HID, "ARMHC500")
++        Name (_CID, "ARMHC500")
++        Name (_CRS, ResourceTemplate() {
++          QWordMemory (
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                               // Granularity
++            FixedPcdGet64 (PcdCsEtm3Base),            // Min Base Address
++            FixedPcdGet64 (PcdCsEtm3MaxBase),         // Max Base Address
++            0,                                        // Translate
++            FixedPcdGet32 (PcdCsComponentSize)        // Length
++          )
++        })
++
++        DSD_PORTS_BEGIN(1)
++        CS_OUTPUT_PORT(0, 1, \_SB_.SFN1)
++        DSD_PORTS_END
++      } // ETM3
++    }
++
++    Device(ETF0) {
++      Name(_HID, "ARMHC97C")          // TMC
++      Name(_CID, "ARMHC97C")          // TMC
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsEtf0Base),            // Min Base Address
++          FixedPcdGet64 (PcdCsEtf0MaxBase),         // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++
++      DSD_PORTS_BEGIN(2)
++      CS_OUTPUT_PORT(0, 0, \_SB_.FUN),
++      CS_INPUT_PORT(0, 0, \_SB_.SFN0)
++      DSD_PORTS_END
++    } // ETF0
++
++    Device(ETF1) {
++      Name(_HID, "ARMHC97C")          // TMC
++      Name(_CID, "ARMHC97C")          // TMC
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsEtf1Base),            // Min Base Address
++          FixedPcdGet64 (PcdCsEtf1MaxBase),         // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++
++      DSD_PORTS_BEGIN(2)
++      CS_OUTPUT_PORT(0, 1, \_SB_.FUN),
++      CS_INPUT_PORT(0, 0, \_SB_.SFN1)
++      DSD_PORTS_END
++    } // ETF1
++
++    Device(ETF2) {
++      Name(_HID, "ARMHC97C")          // TMC
++      Name(_CID, "ARMHC97C")          // TMC
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsEtf2Base),            // Min Base Address
++          FixedPcdGet64 (PcdCsEtf2MaxBase),         // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++
++      DSD_PORTS_BEGIN(2)
++      CS_OUTPUT_PORT(0, 5, \_SB_.MFUN),
++      CS_INPUT_PORT(0, 0, \_SB_.STM0)
++      DSD_PORTS_END
++    } // ETF2
++
++    Device(FUN) {
++      Name(_HID, "ARMHC9FF")
++      Name(_CID, "ARMHC9FF")
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsFunnel0Base),         // Min Base Address
++          FixedPcdGet64 (PcdCsFunnel0MaxBase),      // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++      DSD_PORTS_BEGIN(3)
++      CS_OUTPUT_PORT(0, 0, \_SB_.MFUN),
++      CS_INPUT_PORT(0, 0, \_SB_.ETF0),
++      CS_INPUT_PORT(1, 0, \_SB_.ETF1)
++      DSD_PORTS_END
++    } // FUN
++
++    Device(STM0) {
++      Name(_HID, "ARMHC502")    // STM
++      Name(_CID, "ARMHC502")
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsStmBase),             // Min Base Address
++          FixedPcdGet64 (PcdCsStmMaxBase),          // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++        Memory32Fixed(ReadWrite,
++                      FixedPcdGet32 (PcdCsStmStimulusBase),
++                      FixedPcdGet32 (PcdCsStmStimulusSize))
++      })
++
++      DSD_PORTS_BEGIN(1)
++      CS_OUTPUT_PORT(0, 0, \_SB_.ETF2)
++      DSD_PORTS_END
++    }
++
++    Device(MFUN) {              // Master Funnel
++      Name(_HID, "ARMHC9FF")    // Funnel
++      Name(_CID, "ARMHC9FF")    // Funnel
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsFunnel1Base),         // Min Base Address
++          FixedPcdGet64 (PcdCsFunnel1MaxBase),      // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++
++      DSD_PORTS_BEGIN(3)
++      CS_OUTPUT_PORT(0, 0, \_SB_.REP),
++      CS_INPUT_PORT(0, 0, \_SB_.FUN),
++      CS_INPUT_PORT(5, 0, \_SB_.ETF2)
++      DSD_PORTS_END
++    } // MFUN
++
++    Device(REP) {
++      Name(_HID, "ARMHC98D")          // Replicator
++      Name(_CID, "ARMHC98D")          // Replicator
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsReplicatorBase),      // Min Base Address
++          FixedPcdGet64 (PcdCsReplicatorMaxBase),   // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++
++      DSD_PORTS_BEGIN(3)
++      CS_OUTPUT_PORT(0, 0, \_SB_.TPIU),
++      CS_OUTPUT_PORT(1, 0, \_SB_.ETR),
++      CS_INPUT_PORT(0, 0, \_SB_.MFUN)
++      DSD_PORTS_END
++    } // REP
++
++    Device(TPIU) {
++      Name(_HID, "ARMHC979")          // TPIU
++      Name(_CID, "ARMHC979")          // TPIU
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsTpiuBase),            // Min Base Address
++          FixedPcdGet64 (PcdCsTpiuMaxBase),         // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++
++      DSD_PORTS_BEGIN(1)
++      CS_INPUT_PORT(0, 0, \_SB_.REP)
++      DSD_PORTS_END
++    } // TPIU
++
++    Device(ETR) {
++      Name(_HID, "ARMHC97C")        // TMC
++      Name(_CID, "ARMHC97C")        // TMC
++      Name(_CCA, 0)                 // The ETR on this platform is not coherent
++      Name(_CRS, ResourceTemplate() {
++        QWordMemory (
++          ResourceProducer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          Cacheable,
++          ReadWrite,
++          0x00000000,                               // Granularity
++          FixedPcdGet64 (PcdCsEtrBase),             // Min Base Address
++          FixedPcdGet64 (PcdCsEtrMaxBase),          // Max Base Address
++          0,                                        // Translate
++          FixedPcdGet32 (PcdCsComponentSize)        // Length
++        )
++      })
++
++      Name(_DSD, Package() {
++         DSD_GRAPH_BEGIN(1)
++         CS_INPUT_PORT(0, 1, \_SB_.REP)
++         DSD_GRAPH_END,
++
++         ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
++         Package() {
++            Package(2) {"arm,scatter-gather", 1}
++         }
++      })
++
++    } // ETR
++
++    Device(SFN0) {              // Static Funnel 0
++      Name(_HID, "ARMHC9FE")    // Funnel
++      Name(_CID, "ARMHC9FE")    // Funnel
++
++      DSD_PORTS_BEGIN(3)
++      CS_OUTPUT_PORT(0, 0, \_SB_.ETF0),
++      CS_INPUT_PORT(0, 0, \_SB_.CP00.ETM0),
++      CS_INPUT_PORT(1, 0, \_SB_.CP01.ETM1)
++      DSD_PORTS_END
++    } // SFN0
++
++    Device(SFN1) {              // Static Funnel 1
++      Name(_HID, "ARMHC9FE")    // Funnel
++      Name(_CID, "ARMHC9FE")    // Funnel
++
++      DSD_PORTS_BEGIN(3)
++      CS_OUTPUT_PORT(0, 0, \_SB_.ETF1),
++      CS_INPUT_PORT(0, 0, \_SB_.CP02.ETM2),
++      CS_INPUT_PORT(1, 0, \_SB_.CP03.ETM3)
++      DSD_PORTS_END
++    } // SFN1
++
++    Device(CMN6) {
++      Name(_HID, "ARMHC600")
++
++      Name(_CRS, ResourceTemplate () {
++        // Region location is platform specific
++        // Other name(s) of this region: PERIPHBASE
++        QWordMemory (
++          ResourceConsumer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          NonCacheable,
++          ReadWrite,
++          0x00000000,
++          0x50000000,
++          0x5FFFFFFF,
++          0x00000000,
++          0x10000000,
++          ,
++          ,
++          CFGR
++        )
++
++        // Sub-region location is platform specific
++        // Other name(s) of this region: ROOTNODEBASE
++        QWordMemory (
++          ResourceConsumer,
++          PosDecode,
++          MinFixed,
++          MaxFixed,
++          NonCacheable,
++          ReadWrite,
++          0x00000000,
++          0x50D00000,
++          0x50D03FFF,
++          0x00000000,
++          0x00004000,
++          ,
++          ,
++          ROOT
++        )
++
++        // CMN600_INTREQPMU_DTC0
++        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 78 }
++      })
++    }
++  } // Scope(_SB)
++}
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtPci.asl b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtPci.asl
+new file mode 100644
+index 0000000000..8073df7676
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtPci.asl
+@@ -0,0 +1,248 @@
++/** @file
++*  Secondary System Description Table (SSDT)
++*
++*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++*
++*  SPDX-License-Identifier: BSD-2-Clause-Patent
++*
++**/
++
++#include "N1SdpAcpiHeader.h"
++
++/*
++  See ACPI 6.1 Section 6.2.13
++
++  There are two ways that _PRT can be used.
++
++  In the first model, a PCI Link device is used to provide additional
++  configuration information such as whether the interrupt is Level or
++  Edge triggered, it is active High or Low, Shared or Exclusive, etc.
++
++  In the second model, the PCI interrupts are hardwired to specific
++  interrupt inputs on the interrupt controller and are not
++  configurable. In this case, the Source field in _PRT does not
++  reference a device, but instead contains the value zero, and the
++  Source Index field contains the global system interrupt to which the
++  PCI interrupt is hardwired.
++
++  We use the first model with link indirection to set the correct
++  interrupt type as PCI defaults (Level Triggered, Active Low) are not
++  compatible with GICv2.
++*/
++#define LNK_DEVICE(Unique_Id, Link_Name, irq)                           \
++  Device(Link_Name) {                                                   \
++  Name(_HID, EISAID("PNP0C0F"))                                         \
++  Name(_UID, Unique_Id)                                                 \
++  Name(_PRS, ResourceTemplate() {                                       \
++    Interrupt(ResourceProducer, Level, ActiveHigh, Exclusive) { irq }   \
++    })                                                                  \
++  Method (_CRS, 0) { Return (_PRS) }                                    \
++  Method (_SRS, 1) { }                                                  \
++  Method (_DIS) { }                                                     \
++}
++
++#define PRT_ENTRY(Address, Pin, Link)                                                   \
++  Package (4) {                                                                         \
++    Address,  /* uses the same format as _ADR */                                        \
++    Pin,      /* The PCI pin number of the device (0-INTA, 1-INTB, 2-INTC, 3-INTD)  */  \
++    Link,     /* Interrupt allocated via Link device  */                                \
++    Zero      /* global system interrupt number (no used) */                            \
++}
++
++/*
++  See Reference [1] 6.1.1
++  "High word-Device #, Low word-Function #. (for example, device 3,
++  function 2 is 0x00030002). To refer to all the functions on a device #,
++  use a function number of FFFF)."
++*/
++#define ROOT_PRT_ENTRY(Pin, Link)   PRT_ENTRY(0x0000FFFF, Pin, Link)  // Device 0 for Bridge.
++
++DefinitionBlock("SsdtPci.aml", "SSDT", 1, "ARMLTD", "N1SDP",
++                EFI_ACPI_ARM_OEM_REVISION)
++{
++  Scope (_SB) {
++
++    // PCI Root Complex
++    LNK_DEVICE(1, LNKA, 201)
++    LNK_DEVICE(2, LNKB, 202)
++    LNK_DEVICE(3, LNKC, 203)
++    LNK_DEVICE(4, LNKD, 204)
++    LNK_DEVICE(5, LNKE, 233)
++    LNK_DEVICE(6, LNKF, 234)
++    LNK_DEVICE(7, LNKG, 235)
++    LNK_DEVICE(8, LNKH, 236)
++
++    // PCI Root Complex
++    Device(PCI0) {
++      Name (_HID, EISAID("PNP0A08")) // PCI Express Root Bridge
++      Name (_CID, EISAID("PNP0A03")) // Compatible PCI Root Bridge
++      Name (_SEG, Zero)              // PCI Segment Group number
++      Name (_BBN, Zero)              // PCI Base Bus Number
++      Name (_CCA, 1)                 // Cache Coherency Attribute
++
++      // Root Complex 0
++      Device (RP0) {
++        Name(_ADR, 0xF0000000)    // Dev 0, Func 0
++      }
++
++      // PCI Routing Table
++      Name(_PRT, Package() {
++        ROOT_PRT_ENTRY(0, LNKA),   // INTA
++        ROOT_PRT_ENTRY(1, LNKB),   // INTB
++        ROOT_PRT_ENTRY(2, LNKC),   // INTC
++        ROOT_PRT_ENTRY(3, LNKD),   // INTD
++      })
++
++      // Root complex resources
++      Method (_CRS, 0, Serialized) {
++        Name (RBUF, ResourceTemplate () {
++          WordBusNumber (                                       // Bus numbers assigned to this root
++            ResourceProducer,
++            MinFixed,
++            MaxFixed,
++            PosDecode,
++            0,                                                  // AddressGranularity
++            FixedPcdGet32 (PcdPcieBusMin),                      // AddressMinimum - Minimum Bus Number
++            FixedPcdGet32 (PcdPcieBusMax),                      // AddressMaximum - Maximum Bus Number
++            0,                                                  // AddressTranslation - Set to 0
++            FixedPcdGet32 (PcdPcieBusCount)                     // RangeLength - Number of Busses
++          )
++
++          DWordMemory (                               // 32-bit BAR Windows
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                               // Granularity
++            FixedPcdGet32 (PcdPcieMmio32Base),        // Min Base Address
++            FixedPcdGet32 (PcdPcieMmio32MaxBase),     // Max Base Address
++            FixedPcdGet32 (PcdPcieMmio32Translation), // Translate
++            FixedPcdGet32 (PcdPcieMmio32Size)         // Length
++          )
++
++          QWordMemory (                               // 64-bit BAR Windows
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                               // Granularity
++            FixedPcdGet64 (PcdPcieMmio64Base),        // Min Base Address
++            FixedPcdGet64 (PcdPcieMmio64MaxBase),     // Max Base Address
++            FixedPcdGet64 (PcdPcieMmio64Translation), // Translate
++            FixedPcdGet64 (PcdPcieMmio64Size)         // Length
++          )
++
++          DWordIo (                                   // IO window
++            ResourceProducer,
++            MinFixed,
++            MaxFixed,
++            PosDecode,
++            EntireRange,
++            0x00000000,                               // Granularity
++            FixedPcdGet32 (PcdPcieIoBase),            // Min Base Address
++            FixedPcdGet32 (PcdPcieIoMaxBase),         // Max Base Address
++            FixedPcdGet32 (PcdPcieIoTranslation),     // Translate
++            FixedPcdGet32 (PcdPcieIoSize),            // Length
++            ,
++            ,
++            ,
++            TypeTranslation
++          )
++        }) // Name(RBUF)
++
++        Return (RBUF)
++      } // Method (_CRS)
++    }
++
++  // CCIX Root Complex
++    Device(PCI1) {
++      Name (_HID, EISAID("PNP0A08")) // PCI Express Root Bridge
++      Name (_CID, EISAID("PNP0A03")) // Compatible PCI Root Bridge
++      Name (_SEG, 1)                 // PCI Segment Group number
++      Name (_BBN, Zero)              // PCI Base Bus Number
++      Name (_CCA, 1)                 // Cache Coherency Attribute
++
++    // Root Complex 1
++      Device (RP1) {
++        Name(_ADR, 0xF0000000)    // Dev 0, Func 0
++      }
++
++    // PCI Routing Table
++        Name(_PRT, Package() {
++         ROOT_PRT_ENTRY(0, LNKE),   // INTA
++         ROOT_PRT_ENTRY(1, LNKF),   // INTB
++         ROOT_PRT_ENTRY(2, LNKG),   // INTC
++         ROOT_PRT_ENTRY(3, LNKH),   // INTD
++        })
++
++    // Root complex resources
++      Method (_CRS, 0, Serialized) {
++        Name (RBUF, ResourceTemplate () {
++          WordBusNumber (      // Bus numbers assigned to this root
++            ResourceProducer,
++            MinFixed,
++            MaxFixed,
++            PosDecode,
++            0,                                                  // AddressGranularity
++            FixedPcdGet32 (PcdCcixBusMin),                      // AddressMinimum - Minimum Bus Number
++            FixedPcdGet32 (PcdCcixBusMax),                      // AddressMaximum - Maximum Bus Number
++            0,                                                  // AddressTranslation - Set to 0
++            FixedPcdGet32 (PcdCcixBusCount)                     // RangeLength - Number of Busses
++          )
++
++          DWordMemory (        // 32-bit BAR Windows
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,        // Granularity
++            FixedPcdGet32 (PcdCcixMmio32Base),        // Min Base Address
++            FixedPcdGet32 (PcdCcixMmio32MaxBase),     // Max Base Address
++            FixedPcdGet32 (PcdCcixMmio32Translation), // Translate
++            FixedPcdGet32 (PcdCcixMmio32Size)         // Length
++          )
++
++          QWordMemory (        // 64-bit BAR Windows
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,        // Granularity
++            FixedPcdGet64 (PcdCcixMmio64Base),        // Min Base Address
++            FixedPcdGet64 (PcdCcixMmio64MaxBase),     // Max Base Address
++            FixedPcdGet64 (PcdCcixMmio64Translation), // Translate
++            FixedPcdGet64 (PcdCcixMmio64Size)         // Length
++          )
++
++          DWordIo (             // IO window
++            ResourceProducer,
++            MinFixed,
++            MaxFixed,
++            PosDecode,
++            EntireRange,
++            0x00000000,         // Granularity
++            FixedPcdGet32 (PcdCcixIoBase),            // Min Base Address
++            FixedPcdGet32 (PcdCcixIoMaxBase),         // Max Base Address
++            FixedPcdGet32 (PcdCcixIoTranslation),     // Translate
++            FixedPcdGet32 (PcdCcixIoSize),            // Length
++            ,
++            ,
++            ,
++            TypeTranslation
++          )
++        }) // Name(RBUF)
++
++        Return (RBUF)
++      } // Method (_CRS)
++    }
++
++  }
++}
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtRemotePci.asl b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtRemotePci.asl
+new file mode 100644
+index 0000000000..630b9accbf
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/AslTables/SsdtRemotePci.asl
+@@ -0,0 +1,157 @@
++/** @file
++*  Secondary System Description Table (SSDT)
++*
++*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++*
++*  SPDX-License-Identifier: BSD-2-Clause-Patent
++*
++**/
++
++#include "N1SdpAcpiHeader.h"
++
++/*
++  See ACPI 6.1 Section 6.2.13
++
++  There are two ways that _PRT can be used.
++
++  In the first model, a PCI Link device is used to provide additional
++  configuration information such as whether the interrupt is Level or
++  Edge triggered, it is active High or Low, Shared or Exclusive, etc.
++
++  In the second model, the PCI interrupts are hardwired to specific
++  interrupt inputs on the interrupt controller and are not
++  configurable. In this case, the Source field in _PRT does not
++  reference a device, but instead contains the value zero, and the
++  Source Index field contains the global system interrupt to which the
++  PCI interrupt is hardwired.
++
++  We use the first model with link indirection to set the correct
++  interrupt type as PCI defaults (Level Triggered, Active Low) are not
++  compatible with GICv2.
++*/
++#define LNK_DEVICE(Unique_Id, Link_Name, irq)                           \
++  Device(Link_Name) {                                                   \
++  Name(_HID, EISAID("PNP0C0F"))                                         \
++  Name(_UID, Unique_Id)                                                 \
++  Name(_PRS, ResourceTemplate() {                                       \
++    Interrupt(ResourceProducer, Level, ActiveHigh, Exclusive) { irq }   \
++    })                                                                  \
++  Method (_CRS, 0) { Return (_PRS) }                                    \
++  Method (_SRS, 1) { }                                                  \
++  Method (_DIS) { }                                                     \
++}
++
++#define PRT_ENTRY(Address, Pin, Link)                                                   \
++  Package (4) {                                                                         \
++    Address,  /* uses the same format as _ADR */                                        \
++    Pin,      /* The PCI pin number of the device (0-INTA, 1-INTB, 2-INTC, 3-INTD)  */  \
++    Link,     /* Interrupt allocated via Link device  */                                \
++    Zero      /* global system interrupt number (no used) */                            \
++}
++
++/*
++  See Reference [1] 6.1.1
++  "High word-Device #, Low word-Function #. (for example, device 3,
++  function 2 is 0x00030002). To refer to all the functions on a device #,
++  use a function number of FFFF)."
++*/
++#define ROOT_PRT_ENTRY(Pin, Link)   PRT_ENTRY(0x0000FFFF, Pin, Link)  // Device 0 for Bridge.
++
++DefinitionBlock("SsdtRemotePci.aml", "SSDT", 1, "ARMLTD", "N1SDP",
++                EFI_ACPI_ARM_OEM_REVISION)
++{
++  Scope (_SB) {
++
++    // Remote PCI Root Complex
++    LNK_DEVICE(9, LNKI, 681)
++    LNK_DEVICE(10, LNKJ, 682)
++    LNK_DEVICE(11, LNKK, 683)
++    LNK_DEVICE(12, LNKL, 684)
++
++    //Remote PCIe root complex
++      Device(PCI2) {
++      Name (_HID, EISAID("PNP0A08")) // PCI Express Root Bridge
++      Name (_CID, EISAID("PNP0A03")) // Compatible PCI Root Bridge
++      Name (_SEG, 2)                 // PCI Segment Group number
++      Name (_BBN, Zero)              // PCI Base Bus Number
++      Name (_CCA, 1)                 // Cache Coherency Attribute
++
++      // Remote Root Complex 0
++      Device (RP0) {
++        Name(_ADR, 0xF0000000)    // Dev 0, Func 0
++      }
++
++      // PCI Routing Table
++      Name(_PRT, Package() {
++        ROOT_PRT_ENTRY(0, LNKI),   // INTA
++        ROOT_PRT_ENTRY(1, LNKJ),   // INTB
++        ROOT_PRT_ENTRY(2, LNKK),   // INTC
++        ROOT_PRT_ENTRY(3, LNKL),   // INTD
++      })
++
++      // Root complex resources
++      Method (_CRS, 0, Serialized) {
++        Name (RBUF, ResourceTemplate () {
++          WordBusNumber (                                       // Bus numbers assigned to this root
++            ResourceProducer,
++            MinFixed,
++            MaxFixed,
++            PosDecode,
++            0,                                                  // AddressGranularity
++            FixedPcdGet32 (PcdPcieBusMin),                      // AddressMinimum - Minimum Bus Number
++            FixedPcdGet32 (PcdPcieBusMax),                      // AddressMaximum - Maximum Bus Number
++            0,                                                  // AddressTranslation - Set to 0
++            FixedPcdGet32 (PcdPcieBusCount)                     // RangeLength - Number of Busses
++          )
++
++          QWordMemory (                               // 32-bit BAR Windows
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                               // Granularity
++            FixedPcdGet32 (PcdPcieMmio32Base),        // Min Base Address
++            FixedPcdGet32 (PcdPcieMmio32MaxBase),     // Max Base Address
++            FixedPcdGet32 (PcdRemotePcieMmio32Translation), // Translate
++            FixedPcdGet32 (PcdPcieMmio32Size)         // Length
++          )
++
++          QWordMemory (                               // 64-bit BAR Windows
++            ResourceProducer,
++            PosDecode,
++            MinFixed,
++            MaxFixed,
++            Cacheable,
++            ReadWrite,
++            0x00000000,                               // Granularity
++            FixedPcdGet64 (PcdPcieMmio64Base),        // Min Base Address
++            FixedPcdGet64 (PcdPcieMmio64MaxBase),     // Max Base Address
++            FixedPcdGet64 (PcdRemotePcieMmio64Translation), // Translate
++            FixedPcdGet64 (PcdPcieMmio64Size)         // Length
++          )
++
++          QWordIo (                                   // IO window
++            ResourceProducer,
++            MinFixed,
++            MaxFixed,
++            PosDecode,
++            EntireRange,
++            0x00000000,                               // Granularity
++            FixedPcdGet32 (PcdPcieIoBase),            // Min Base Address
++            FixedPcdGet32 (PcdPcieIoMaxBase),         // Max Base Address
++            FixedPcdGet64 (PcdRemotePcieIoTranslation),     // Translate
++            FixedPcdGet32 (PcdPcieIoSize),            // Length
++            ,
++            ,
++            ,
++            TypeTranslation
++          )
++        }) // Name(RBUF)
++
++        Return (RBUF)
++      } // Method (_CRS)
++    }
++  }
++}
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
+new file mode 100644
+index 0000000000..2b320ecbeb
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.c
+@@ -0,0 +1,2219 @@
++/** @file
++  Configuration Manager Dxe
++
++  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++  @par Glossary:
++    - Cm or CM   - Configuration Manager
++    - Obj or OBJ - Object
++**/
++
++#include <IndustryStandard/DebugPort2Table.h>
++#include <IndustryStandard/SerialPortConsoleRedirectionTable.h>
++#include <IndustryStandard/IoRemappingTable.h>
++#include <IndustryStandard/MemoryMappedConfigurationSpaceAccessTable.h>
++#include <Library/IoLib.h>
++#include <Library/ArmLib.h>
++#include <Library/DebugLib.h>
++#include <Library/IoLib.h>
++#include <Library/PcdLib.h>
++#include <Library/UefiBootServicesTableLib.h>
++#include <Protocol/AcpiTable.h>
++#include <Protocol/ConfigurationManagerProtocol.h>
++#include <NeoverseN1Soc.h>
++#include "N1SdpAcpiHeader.h"
++#include "ConfigurationManager.h"
++#include "Platform.h"
++
++extern struct EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat;
++
++/** The platform configuration repository information.
++*/
++STATIC
++EDKII_PLATFORM_REPOSITORY_INFO N1sdpRepositoryInfo = {
++  // Configuration Manager information
++  { CONFIGURATION_MANAGER_REVISION, CFG_MGR_OEM_ID },
++
++  // ACPI Table List
++  {
++    // FADT Table
++    {
++      EFI_ACPI_6_3_FIXED_ACPI_DESCRIPTION_TABLE_SIGNATURE,
++      EFI_ACPI_6_3_FIXED_ACPI_DESCRIPTION_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdFadt),
++      NULL
++    },
++    // GTDT Table
++    {
++      EFI_ACPI_6_3_GENERIC_TIMER_DESCRIPTION_TABLE_SIGNATURE,
++      EFI_ACPI_6_3_GENERIC_TIMER_DESCRIPTION_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdGtdt),
++      NULL
++    },
++    // MADT Table
++    {
++      EFI_ACPI_6_3_MULTIPLE_APIC_DESCRIPTION_TABLE_SIGNATURE,
++      EFI_ACPI_6_3_MULTIPLE_APIC_DESCRIPTION_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdMadt),
++      NULL
++    },
++    // SPCR Table
++    {
++      EFI_ACPI_6_3_SERIAL_PORT_CONSOLE_REDIRECTION_TABLE_SIGNATURE,
++      EFI_ACPI_SERIAL_PORT_CONSOLE_REDIRECTION_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSpcr),
++      NULL
++    },
++    // DSDT Table
++    {
++      EFI_ACPI_6_3_DIFFERENTIATED_SYSTEM_DESCRIPTION_TABLE_SIGNATURE,
++      0, // Unused
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdDsdt),
++      (EFI_ACPI_DESCRIPTION_HEADER*)dsdt_aml_code
++    },
++    // DBG2 Table
++    {
++      EFI_ACPI_6_3_DEBUG_PORT_2_TABLE_SIGNATURE,
++      EFI_ACPI_DBG2_DEBUG_DEVICE_INFORMATION_STRUCT_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdDbg2),
++      NULL
++    },
++    // PPTT Table
++    {
++      EFI_ACPI_6_3_PROCESSOR_PROPERTIES_TOPOLOGY_TABLE_STRUCTURE_SIGNATURE,
++      EFI_ACPI_6_3_PROCESSOR_PROPERTIES_TOPOLOGY_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdPptt),
++      NULL
++    },
++    // IORT Table
++    {
++      EFI_ACPI_6_3_IO_REMAPPING_TABLE_SIGNATURE,
++      EFI_ACPI_IO_REMAPPING_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdIort),
++      NULL
++    },
++    // PCI MCFG Table
++    {
++      EFI_ACPI_6_3_PCI_EXPRESS_MEMORY_MAPPED_CONFIGURATION_SPACE_BASE_ADDRESS_DESCRIPTION_TABLE_SIGNATURE,
++      EFI_ACPI_MEMORY_MAPPED_CONFIGURATION_SPACE_ACCESS_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdMcfg),
++      NULL,
++      SIGNATURE_64 ('A','R','M','N','1','S','D','P'),
++      0x20181101 // The Linux kernel patch for MCFG is applied only when
++                 // the OemRevision is 0x20181101
++    },
++    // SSDT table describing the PCI root complex
++    {
++      EFI_ACPI_6_3_SECONDARY_SYSTEM_DESCRIPTION_TABLE_SIGNATURE,
++      0, // Unused
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSsdt),
++      (EFI_ACPI_DESCRIPTION_HEADER*)ssdtpci_aml_code
++    },
++    // SRAT Table
++    {
++      EFI_ACPI_6_3_SYSTEM_RESOURCE_AFFINITY_TABLE_SIGNATURE,
++      EFI_ACPI_6_3_SYSTEM_RESOURCE_AFFINITY_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSrat),
++      NULL
++    },
++    // HMAT Table
++    {
++      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_SIGNATURE,
++      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_REVISION,
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdRaw),
++      (EFI_ACPI_DESCRIPTION_HEADER*)&Hmat
++    },
++    // SSDT table describing the Remote Chip PCI root complex
++    {
++      EFI_ACPI_6_3_SECONDARY_SYSTEM_DESCRIPTION_TABLE_SIGNATURE,
++      0, // Unused
++      CREATE_STD_ACPI_TABLE_GEN_ID (EStdAcpiTableIdSsdt),
++      (EFI_ACPI_DESCRIPTION_HEADER*)ssdtremotepci_aml_code
++    },
++  },
++
++  // Boot architecture information
++  { EFI_ACPI_6_3_ARM_PSCI_COMPLIANT },              // BootArchFlags
++
++#ifdef HEADLESS_PLATFORM
++  // Fixed feature flag information
++  { EFI_ACPI_6_3_HEADLESS },                        // Fixed feature flags
++#endif
++
++  // Power management profile information
++  { EFI_ACPI_6_3_PM_PROFILE_ENTERPRISE_SERVER },    // PowerManagement Profile
++
++  /* GIC CPU Interface information
++     GIC_ENTRY (CPUInterfaceNumber, Mpidr, PmuIrq, VGicIrq, GicRedistBase,
++                EnergyEfficiency, SpeIrq, ProximityDomain, ClockDomain)
++  */
++  {
++    GICC_ENTRY (0, GET_MPID3 (0x0, 0x0, 0x0, 0x0), 23, 25, 0, 0, 21, 0, 0),
++    GICC_ENTRY (1, GET_MPID3 (0x0, 0x0, 0x1, 0x0), 23, 25, 0, 0, 21, 0, 0),
++    GICC_ENTRY (2, GET_MPID3 (0x0, 0x1, 0x0, 0x0), 23, 25, 0, 0, 21, 0, 0),
++    GICC_ENTRY (3, GET_MPID3 (0x0, 0x1, 0x1, 0x0), 23, 25, 0, 0, 21, 0, 0),
++    GICC_ENTRY (4, GET_MPID3 (0x1, 0x0, 0x0, 0x0), 23, 25, 0, 0, 21, 1, 0),
++    GICC_ENTRY (5, GET_MPID3 (0x1, 0x0, 0x1, 0x0), 23, 25, 0, 0, 21, 1, 0),
++    GICC_ENTRY (6, GET_MPID3 (0x1, 0x1, 0x0, 0x0), 23, 25, 0, 0, 21, 1, 0),
++    GICC_ENTRY (7, GET_MPID3 (0x1, 0x1, 0x1, 0x0), 23, 25, 0, 0, 21, 1, 0),
++  },
++
++  // GIC Distributor Info
++  {
++    FixedPcdGet64 (PcdGicDistributorBase),  // UINT64  PhysicalBaseAddress
++    0,                                      // UINT32  SystemVectorBase
++    3                                       // UINT8   GicVersion
++  },
++
++  // GIC Re-Distributor Info
++  {
++    {
++      // UINT64  DiscoveryRangeBaseAddress
++      FixedPcdGet64 (PcdGicRedistributorsBase),
++      // UINT32  DiscoveryRangeLength
++      SIZE_1MB
++    },
++    {
++      // UINT64  DiscoveryRangeBaseAddress
++      FixedPcdGet64 (PcdGicRedistributorsBase) + (1ULL << 42),
++      // UINT32  DiscoveryRangeLength
++      SIZE_1MB
++    },
++  },
++
++  // GIC ITS
++  {
++    // GIC ITS - CCIX TCU
++    {
++      // The GIC ITS ID.
++      0,
++      // The physical address for the Interrupt Translation Service
++      0x30040000,
++      //Proximity Domain
++      0
++    },
++    // GIC ITS - PCIe TCU
++    {
++      // The GIC ITS ID.
++      1,
++      // The physical address for the Interrupt Translation Service
++      0x30060000,
++      //Proximity Domain
++      0
++    },
++    // GIC ITS - CCIX RC
++    {
++      // The GIC ITS ID.
++      2,
++      // The physical address for the Interrupt Translation Service
++      0x30080000,
++      //Proximity Domain
++      0
++    },
++    // GIC ITS - PCIe RC
++    {
++      // The GIC ITS ID.
++      3,
++      // The physical address for the Interrupt Translation Service
++      0x300A0000,
++      //Proximity Domain
++      0
++    },
++    //Remote chip GIC ITS - PCIe TCU
++    {
++     ITS_REMOTE_SMMU_PCIE,
++     0x40030060000,
++     1
++    },
++    //Remote chip GIC ITS - PCIe RC
++    {
++     ITS_REMOTE_PCIE,
++     0x400300a0000,
++     1
++    },
++  },
++
++  // Generic Timer Info
++  {
++    // The physical base address for the counter control frame
++    N1SDP_SYSTEM_TIMER_BASE_ADDRESS,
++    // The physical base address for the counter read frame
++    N1SDP_CNT_READ_BASE_ADDRESS,
++    // The secure PL1 timer interrupt
++    FixedPcdGet32 (PcdArmArchTimerSecIntrNum),
++    // The secure PL1 timer flags
++    N1SDP_GTDT_GTIMER_FLAGS,
++    // The non-secure PL1 timer interrupt
++    FixedPcdGet32 (PcdArmArchTimerIntrNum),
++    // The non-secure PL1 timer flags
++    N1SDP_GTDT_GTIMER_FLAGS,
++    // The virtual timer interrupt
++    FixedPcdGet32 (PcdArmArchTimerVirtIntrNum),
++    // The virtual timer flags
++    N1SDP_GTDT_GTIMER_FLAGS,
++    // The non-secure PL2 timer interrupt
++    FixedPcdGet32 (PcdArmArchTimerHypIntrNum),
++    // The non-secure PL2 timer flags
++    N1SDP_GTDT_GTIMER_FLAGS
++  },
++
++  // Generic Timer Block Information
++  {
++    {
++      // The physical base address for the GT Block Timer structure
++      N1SDP_GT_BLOCK_CTL_BASE,
++      // The number of timer frames implemented in the GT Block
++      N1SDP_TIMER_FRAMES_COUNT,
++      // Reference token for the GT Block timer frame list
++      REFERENCE_TOKEN (GTBlock0TimerInfo)
++    }
++  },
++
++  // GT Block Timer Frames
++  {
++    // Frame 0
++    {
++      0,                                  // UINT8   FrameNumber
++      N1SDP_GT_BLOCK_FRAME0_CTL_BASE,     // UINT64  PhysicalAddressCntBase
++      N1SDP_GT_BLOCK_FRAME0_CTL_EL0_BASE, // UINT64  PhysicalAddressCntEL0Base
++      N1SDP_GT_BLOCK_FRAME0_GSIV,         // UINT32  PhysicalTimerGSIV
++      N1SDP_GTX_TIMER_FLAGS,              // UINT32  PhysicalTimerFlags
++      0,                                  // UINT32  VirtualTimerGSIV
++      0,                                  // UINT32  VirtualTimerFlags
++      N1SDP_GTX_COMMON_FLAGS_NS           // UINT32  CommonFlags
++    },
++    // Frame 1
++    {
++      1,                                  // UINT8   FrameNumber
++      N1SDP_GT_BLOCK_FRAME1_CTL_BASE,     // UINT64  PhysicalAddressCntBase
++      N1SDP_GT_BLOCK_FRAME1_CTL_EL0_BASE, // UINT64  PhysicalAddressCntEL0Base
++      N1SDP_GT_BLOCK_FRAME1_GSIV,         // UINT32  PhysicalTimerGSIV
++      N1SDP_GTX_TIMER_FLAGS,              // UINT32  PhysicalTimerFlags
++      0,                                  // UINT32  VirtualTimerGSIV
++      0,                                  // UINT32  VirtualTimerFlags
++      N1SDP_GTX_COMMON_FLAGS_S            // UINT32  CommonFlags
++    },
++  },
++
++  // Watchdog Info
++  {
++    // The physical base address of the SBSA Watchdog control frame
++    FixedPcdGet64 (PcdGenericWatchdogControlBase),
++    // The physical base address of the SBSA Watchdog refresh frame
++    FixedPcdGet64 (PcdGenericWatchdogRefreshBase),
++    // The watchdog interrupt
++    FixedPcdGet32 (PcdGenericWatchdogEl2IntrNum),
++    // The watchdog flags
++    N1SDP_SBSA_WATCHDOG_FLAGS
++  },
++
++  // SPCR Serial Port
++  {
++    FixedPcdGet64 (PcdSerialRegisterBase),                  // BaseAddress
++    FixedPcdGet32 (PL011UartInterrupt),                     // Interrupt
++    FixedPcdGet64 (PcdUartDefaultBaudRate),                 // BaudRate
++    FixedPcdGet32 (PL011UartClkInHz),                       // Clock
++    EFI_ACPI_DBG2_PORT_SUBTYPE_SERIAL_ARM_SBSA_GENERIC_UART // Port subtype
++  },
++  // Debug Serial Port
++  {
++    FixedPcdGet64 (PcdSerialDbgRegisterBase),               // BaseAddress
++    0,                                                      // Interrupt -unused
++    FixedPcdGet64 (PcdSerialDbgUartBaudRate),               // BaudRate
++    FixedPcdGet32 (PcdSerialDbgUartClkInHz),                // Clock
++    EFI_ACPI_DBG2_PORT_SUBTYPE_SERIAL_ARM_SBSA_GENERIC_UART // Port subtype
++  },
++
++  // Processor Hierarchy Nodes
++  {
++    // Package
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[0]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      CM_NULL_TOKEN,
++      // CM_OBJECT_TOKEN  GicCToken
++      CM_NULL_TOKEN,
++      // UINT32  NoOfPrivateResources
++      SOC_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (SocResources)
++    },
++    // Cluster0
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[1]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[0]), // -> Package
++      // CM_OBJECT_TOKEN  GicCToken
++      CM_NULL_TOKEN,
++      // UINT32  NoOfPrivateResources
++      CLUSTER_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (ClusterResources)
++    },
++    // Cluster1
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[2]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[0]), // -> Package
++      // CM_OBJECT_TOKEN  GicCToken
++      CM_NULL_TOKEN,
++      // UINT32  NoOfPrivateResources
++      CLUSTER_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (ClusterResources)
++    },
++    // Cluster0 - Cpu0
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[3]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[1]), // -> 'cluster in Cluster0
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[0]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++    // Cluster0 - Cpu1
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[4]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[1]), // -> 'cluster in Cluster0
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[1]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++    // Cluster1 - Cpu0
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[3]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[2]), // -> 'cluster in Cluster1
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[2]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++    // Cluster1 - Cpu1
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[4]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[2]), // -> 'cluster in Cluster1
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[3]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++
++    // Slave chip hierarchy
++    // Package
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[7]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      CM_NULL_TOKEN,
++      // CM_OBJECT_TOKEN  GicCToken
++      CM_NULL_TOKEN,
++      // UINT32  NoOfPrivateResources
++      SOC_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (SocResources)
++    },
++    // Cluster0
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[8]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[7]), // -> Package
++      // CM_OBJECT_TOKEN  GicCToken
++      CM_NULL_TOKEN,
++      // UINT32  NoOfPrivateResources
++      CLUSTER_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (ClusterResources)
++    },
++    // Cluster1
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[9]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_INVALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_NOT_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[7]), // -> Package
++      // CM_OBJECT_TOKEN  GicCToken
++      CM_NULL_TOKEN,
++      // UINT32  NoOfPrivateResources
++      CLUSTER_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (ClusterResources)
++    },
++    // Cluster0 - Cpu0
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[10]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[8]), // -> 'cluster in Cluster0
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[4]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++    // Cluster0 - Cpu1
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[11]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[8]), // -> 'cluster in Cluster0
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[5]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++    // Cluster1 - Cpu0
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[10]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[9]), // -> 'cluster in Cluster1
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[6]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++    // Cluster1 - Cpu1
++    {
++      // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (ProcHierarchyInfo[11]),
++      // UINT32  Flags
++      PROC_NODE_FLAGS (
++        EFI_ACPI_6_3_PPTT_PACKAGE_NOT_PHYSICAL,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_ID_VALID,
++        EFI_ACPI_6_3_PPTT_PROCESSOR_IS_NOT_THREAD,
++        EFI_ACPI_6_3_PPTT_NODE_IS_LEAF,
++        EFI_ACPI_6_3_PPTT_IMPLEMENTATION_NOT_IDENTICAL
++      ),
++      // CM_OBJECT_TOKEN  ParentToken
++      REFERENCE_TOKEN (ProcHierarchyInfo[9]), // -> 'cluster in Cluster1
++      // CM_OBJECT_TOKEN  GicCToken
++      REFERENCE_TOKEN (GicCInfo[7]),
++      // UINT32  NoOfPrivateResources
++      CORE_RESOURCE_COUNT,
++      // CM_OBJECT_TOKEN  PrivateResourcesArrayToken
++      REFERENCE_TOKEN (CoreResources)
++    },
++  },
++
++  // Cache information
++  {
++    // 'cluster's L3 cache
++    {
++      REFERENCE_TOKEN (CacheInfo[0]),  // CM_OBJECT_TOKEN  Token
++      CM_NULL_TOKEN,                   // CM_OBJECT_TOKEN  NextLevelOfCacheToken
++      SIZE_1MB,                        // UINT32  Size
++      2048,                            // UINT32  NumberOfSets
++      8,                               // UINT32  Associativity
++      CACHE_ATTRIBUTES (               // UINT8   Attributes
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_UNIFIED,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK
++      ),
++      64                               // UINT16  LineSize
++    },
++    // 'core's L1 instruction cache
++    {
++      REFERENCE_TOKEN (CacheInfo[1]),  // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (CacheInfo[3]),  // CM_OBJECT_TOKEN  NextLevelOfCacheToken
++      SIZE_64KB,                       // UINT32  Size
++      256,                             // UINT32  NumberOfSets
++      4,                               // UINT32  Associativity
++      CACHE_ATTRIBUTES (               // UINT8   Attributes
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_INSTRUCTION,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK
++      ),
++      64                               // UINT16  LineSize
++    },
++    // 'core's L1 data cache
++    {
++      REFERENCE_TOKEN (CacheInfo[2]),  // CM_OBJECT_TOKEN  Token
++      REFERENCE_TOKEN (CacheInfo[3]),  // CM_OBJECT_TOKEN  NextLevelOfCacheToken
++      SIZE_64KB,                       // UINT32  Size
++      256,                             // UINT32  NumberOfSets
++      4,                               // UINT32  Associativity
++      CACHE_ATTRIBUTES (               // UINT8   Attributes
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ_WRITE,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_DATA,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK
++      ),
++      64                               // UINT16  LineSize
++    },
++    // cores's L2 cache
++    {
++      REFERENCE_TOKEN (CacheInfo[3]),  // CM_OBJECT_TOKEN  Token
++      CM_NULL_TOKEN,                   // CM_OBJECT_TOKEN  NextLevelOfCacheToken
++      SIZE_1MB,                        // UINT32  Size
++      2048,                            // UINT32  NumberOfSets
++      8,                               // UINT32  Associativity
++      CACHE_ATTRIBUTES (               // UINT8   Attributes
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_UNIFIED,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK
++      ),
++      64                               // UINT16  LineSize
++    },
++    // slc cache
++    {
++      REFERENCE_TOKEN (CacheInfo[4]),  // CM_OBJECT_TOKEN  Token
++      CM_NULL_TOKEN,                   // CM_OBJECT_TOKEN  NextLevelOfCacheToken
++      SIZE_8MB,                        // UINT32  Size
++      8192,                            // UINT32  NumberOfSets
++      16,                              // UINT32  Associativity
++      CACHE_ATTRIBUTES (               // UINT8   Attributes
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_ALLOCATION_READ,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_CACHE_TYPE_UNIFIED,
++        EFI_ACPI_6_3_CACHE_ATTRIBUTES_WRITE_POLICY_WRITE_BACK
++      ),
++      64                               // UINT16  LineSize
++    },
++  },
++  // Resources private to the 'cluster (shared among cores) in Cluster
++  {
++    { REFERENCE_TOKEN (CacheInfo[0]) }  // -> 'cluster's L3 cache in Cluster
++  },
++  // Resources private to each individual 'core instance in Cluster
++  {
++    { REFERENCE_TOKEN (CacheInfo[1]) }, // -> 'core's L1 I-cache in Cluster
++    { REFERENCE_TOKEN (CacheInfo[2]) }, // -> 'core's L1 D-cache in Cluster
++    { REFERENCE_TOKEN (CacheInfo[3]) }  // -> 'core's L2 cache in Cluster
++  },
++
++  // Resources private to the SoC
++  {
++    { REFERENCE_TOKEN (CacheInfo[4])   },  // -> slc for SoC
++  },
++
++  // ITS group node
++  {
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_CCIX]),
++      // The number of ITS identifiers in the ITS node.
++      1,
++      // Reference token for the ITS identifier array
++      REFERENCE_TOKEN (ItsIdentifierArray[ITS_SMMU_CCIX])
++    },
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_PCIE]),
++      // The number of ITS identifiers in the ITS node.
++      1,
++      // Reference token for the ITS identifier array
++      REFERENCE_TOKEN (ItsIdentifierArray[ITS_SMMU_PCIE])
++    },
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (ItsGroupInfo[ITS_CCIX]),
++      // The number of ITS identifiers in the ITS node.
++      1,
++      // Reference token for the ITS identifier array
++      REFERENCE_TOKEN (ItsIdentifierArray[ITS_CCIX])
++    },
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (ItsGroupInfo[ITS_PCIE]),
++      // The number of ITS identifiers in the ITS node.
++      1,
++      // Reference token for the ITS identifier array
++      REFERENCE_TOKEN (ItsIdentifierArray[ITS_PCIE])
++    },
++    //Remote Chip ITS
++    {
++      REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_SMMU_PCIE]),
++      1,
++      REFERENCE_TOKEN (ItsIdentifierArray[ITS_REMOTE_SMMU_PCIE])
++    },
++    {
++      REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_PCIE]),
++      1,
++      REFERENCE_TOKEN (ItsIdentifierArray[ITS_REMOTE_PCIE])
++    },
++  },
++  // ITS identifier array
++  {
++    {
++      // The ITS Identifier - 0
++      ITS_SMMU_CCIX
++    },
++    {
++      // The ITS Identifier - 1
++      ITS_SMMU_PCIE
++    },
++    {
++      // The ITS Identifier - 2
++      ITS_CCIX
++    },
++    {
++      // The ITS Identifier - 3
++      ITS_PCIE
++    },
++    {
++      // The ITS Identifier - 4
++      ITS_REMOTE_SMMU_PCIE
++    },
++    {
++      // The ITS Identifier - 5
++      ITS_REMOTE_PCIE
++    }
++  },
++
++  {
++    // SMMUv3 Node
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_PCIE]),
++      // Number of ID mappings
++      2,
++      // Reference token for the ID mapping array
++      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_SMMU_PCIE][0]),
++
++      // SMMU Base Address
++      0x4F400000,
++      // SMMU flags
++      EFI_ACPI_IORT_SMMUv3_FLAG_COHAC_OVERRIDE,
++      // VATOS address
++      0,
++      // Model
++      EFI_ACPI_IORT_SMMUv3_MODEL_GENERIC,
++      // GSIV of the Event interrupt if SPI based
++      0x10B,
++      // PRI Interrupt if SPI based
++      0,
++      // GERR interrupt if GSIV based
++      0x10D,
++      // Sync interrupt if GSIV based
++      0x10C,
++
++      // Proximity domain flag, ignored in this case
++      0,
++      // Index into the array of ID mapping, ignored as SMMU
++      // control interrupts are GSIV based
++      1
++    },
++    // SMMUv3 Node
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_CCIX]),
++      // Number of ID mappings
++      2,
++      // Reference token for the ID mapping array
++      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_SMMU_CCIX][0]),
++
++      // SMMU Base Address
++      0x4F000000,
++      // SMMU flags
++      EFI_ACPI_IORT_SMMUv3_FLAG_COHAC_OVERRIDE,
++      // VATOS address
++      0,
++      // Model
++      EFI_ACPI_IORT_SMMUv3_MODEL_GENERIC,
++      // GSIV of the Event interrupt if SPI based
++      0x104,
++      // PRI Interrupt if SPI based
++      0,
++      // GERR interrupt if GSIV based
++      0x106,
++      // Sync interrupt if GSIV based
++      0x105,
++
++      // Proximity domain flag, ignored in this case
++      0,
++      // Index into the array of ID mapping, ignored as SMMU
++      // control interrupts are GSIV based
++      1
++    },
++    //Remote Chip SMMU V3 setting
++    {
++      REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_REMOTE_PCIE]),
++      2,
++      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_REMOTE_SMMU_PCIE][0]),
++      0x4004f400000,
++      EFI_ACPI_IORT_SMMUv3_FLAG_COHAC_OVERRIDE,
++      0,
++      EFI_ACPI_IORT_SMMUv3_MODEL_GENERIC,
++      747,
++      0,
++      749,
++      748,
++      0,
++      1
++    }
++  },
++
++  {
++    // Root Complex node info
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (RootComplexInfo[0]),
++      // Number of ID mappings
++      1,
++      // Reference token for the ID mapping array
++      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_PCIE][0]),
++
++      // Memory access properties : Cache coherent attributes
++      EFI_ACPI_IORT_MEM_ACCESS_PROP_CCA,
++      // Memory access properties : Allocation hints
++      0,
++      // Memory access properties : Memory access flags
++      0,
++      // ATS attributes
++      EFI_ACPI_IORT_ROOT_COMPLEX_ATS_SUPPORTED,
++      // PCI segment number
++      0,
++      // Memory address size limit
++      42
++    },
++      // Root Complex node info
++    {
++      // Reference token for this Iort node
++      REFERENCE_TOKEN (RootComplexInfo[1]),
++      // Number of ID mappings
++      1,
++      // Reference token for the ID mapping array
++      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_PCIE][1]),
++
++      // Memory access properties : Cache coherent attributes
++      EFI_ACPI_IORT_MEM_ACCESS_PROP_CCA,
++      // Memory access properties : Allocation hints
++      0,
++      // Memory access properties : Memory access flags
++      0,
++      // ATS attributes
++      EFI_ACPI_IORT_ROOT_COMPLEX_ATS_SUPPORTED,
++      // PCI segment number
++      1,
++      // Memory address size limit
++      42
++    },
++     //Remote Chip Root Complex node Info
++    {
++      REFERENCE_TOKEN (RootComplexInfo[ROOT_REMOTE_PCIE]),
++      1,
++      REFERENCE_TOKEN (DeviceIdMapping[DEVICEIDMAPPING_REMOTE_PCIE][0]),
++      EFI_ACPI_IORT_MEM_ACCESS_PROP_CCA,
++      0,
++      0,
++      EFI_ACPI_IORT_ROOT_COMPLEX_ATS_SUPPORTED,
++      2,
++      42
++    }
++  },
++
++  // Array of Device ID mappings
++  {
++    // DeviceIdMapping[0][0] - [0][1]
++    {
++      /* Mapping SMMUv3 -> ITS Group
++      */
++
++      // SMMUv3 device ID mapping
++      {
++        // Input base
++        0x0,
++        // Number of input IDs
++        0x0000FFFF,
++        // Output Base
++        0x0,
++        // Output reference
++        REFERENCE_TOKEN (ItsGroupInfo[ITS_PCIE]),
++        // Flags
++        0
++      },
++      // SMMUv3 device ID mapping
++      {
++        // Input base
++        0x0,
++        // Number of input IDs
++        0x00000001,
++        // Output Base
++        0x0,
++        // Output reference token for the IORT node
++        REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_PCIE]),
++        // Flags
++        EFI_ACPI_IORT_ID_MAPPING_FLAGS_SINGLE
++      }
++    },
++    // DeviceIdMapping[1][0] - [1][1]
++    {
++      /* Mapping SMMUv3 -> ITS Group
++      */
++
++      // SMMUv3 device ID mapping
++      {
++        // Input base
++        0x0,
++        // Number of input IDs
++        0x0000FFFF,
++        // Output Base
++        0x0,
++        // Output reference
++        REFERENCE_TOKEN (ItsGroupInfo[ITS_CCIX]),
++        // Flags
++        0
++      },
++      // SMMUv3 device ID mapping
++      {
++        // Input base
++        0x0,
++        // Number of input IDs
++        0x00000001,
++        // Output Base
++        0x0,
++        // Output reference token for the IORT node
++        REFERENCE_TOKEN (ItsGroupInfo[ITS_SMMU_CCIX]),
++        // Flags
++        EFI_ACPI_IORT_ID_MAPPING_FLAGS_SINGLE
++      }
++    },
++    // DeviceIdMapping[2][0] - [2][1]
++    {
++      // Mapping for  RootComplex -> SMMUv3
++
++      // Device ID mapping for Root complex node
++      {
++        // Input base
++        0x0,
++        // Number of input IDs
++        0x0000FFFF,
++        // Output Base
++        0x0,
++        // Output reference
++        REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_PCIE]),
++        // Flags
++        0
++      },
++      // Device ID mapping for Root complex node
++      {
++        // Input base
++        0x0,
++        // Number of input IDs
++        0x0000FFFF,
++        // Output Base
++        0x0,
++        // Output reference token for the IORT node
++        REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_CCIX]),
++        // Flags
++        0
++      }
++    },
++      // Mapping of Remote Chip SMMUv3 -> ITS Group
++    {
++      {
++        0x0,
++        0x0000ffff,
++        0x0,
++        REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_PCIE]),
++        0
++      },
++      {
++        0x0,
++        0x00000001,
++        0x0,
++        REFERENCE_TOKEN (ItsGroupInfo[ITS_REMOTE_SMMU_PCIE]),
++        EFI_ACPI_IORT_ID_MAPPING_FLAGS_SINGLE
++      }
++    },
++      // Mapping for  Remote Chip RootComplex -> SMMUv3
++    {
++      {
++        0x0,
++        0x0000ffff,
++        0x0,
++        REFERENCE_TOKEN (SmmuV3Info[SMMUV3INFO_REMOTE_PCIE]),
++        0
++      }
++    },
++  },
++
++  // PCI Configuration Space Info
++  {
++    // PCIe ECAM
++    {
++      0x70000000,      // Base Address
++      0x0,             // Segment Group Number
++      0x0,             // Start Bus Number
++      17               // End Bus Number
++    },
++    // CCIX ECAM
++    {
++      0x68000000,      // Base Address
++      0x1,             // Segment Group Number
++      0x0,               // Start Bus Number
++      17               // End Bus Number
++    },
++    //Remote Chip PCIe ECAM
++    {
++      0x40070000000,   // Base Address
++      0x2,             // Segment Group Number
++      0x0,             // Start Bus Number
++      17               // End Bus Number
++    }
++  },
++
++  // Memory Affinity Info
++  {
++    {
++      // Proximity domain to which memory range belongs
++      0,
++      //Base Address
++      0x80000000,
++      //Length
++      0x80000000,
++      //Flags
++      EFI_ACPI_6_3_MEMORY_ENABLED
++    },
++    {
++      // Proximity domain to which memory range belongs
++      0,
++      //Base Address
++      0x8080000000,
++      //Length is updated dynamically from SRAM
++      0,
++      //Flags
++      EFI_ACPI_6_3_MEMORY_ENABLED
++    }
++  }
++
++};
++
++/** A helper function for returning the Configuration Manager Objects.
++  @param [in]       CmObjectId     The Configuration Manager Object ID.
++  @param [in]       Object         Pointer to the Object(s).
++  @param [in]       ObjectSize     Total size of the Object(s).
++  @param [in]       ObjectCount    Number of Objects.
++  @param [in, out]  CmObjectDesc   Pointer to the Configuration Manager Object
++                                   descriptor describing the requested Object.
++  @retval EFI_SUCCESS           Success.
++**/
++STATIC
++EFI_STATUS
++EFIAPI
++HandleCmObject (
++  IN  CONST CM_OBJECT_ID                CmObjectId,
++  IN        VOID                *       Object,
++  IN  CONST UINTN                       ObjectSize,
++  IN  CONST UINTN                       ObjectCount,
++  IN  OUT   CM_OBJ_DESCRIPTOR   * CONST CmObjectDesc
++  )
++{
++  CmObjectDesc->ObjectId = CmObjectId;
++  CmObjectDesc->Size = ObjectSize;
++  CmObjectDesc->Data = (VOID*)Object;
++  CmObjectDesc->Count = ObjectCount;
++  DEBUG ((
++    DEBUG_INFO,
++    "INFO: CmObjectId = %x, Ptr = 0x%p, Size = %d, Count = %d\n",
++    CmObjectId,
++    CmObjectDesc->Data,
++    CmObjectDesc->Size,
++    CmObjectDesc->Count
++    ));
++  return EFI_SUCCESS;
++}
++
++/** A helper function for returning the Configuration Manager Objects that
++    match the token.
++  @param [in]  This               Pointer to the Configuration Manager Protocol.
++  @param [in]  CmObjectId         The Configuration Manager Object ID.
++  @param [in]  Object             Pointer to the Object(s).
++  @param [in]  ObjectSize         Total size of the Object(s).
++  @param [in]  ObjectCount        Number of Objects.
++  @param [in]  Token              A token identifying the object.
++  @param [in]  HandlerProc        A handler function to search the object
++                                  referenced by the token.
++  @param [in, out]  CmObjectDesc  Pointer to the Configuration Manager Object
++                                  descriptor describing the requested Object.
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++STATIC
++EFI_STATUS
++EFIAPI
++HandleCmObjectRefByToken (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN        VOID                                  *       Object,
++  IN  CONST UINTN                                         ObjectSize,
++  IN  CONST UINTN                                         ObjectCount,
++  IN  CONST CM_OBJECT_TOKEN                               Token,
++  IN  CONST CM_OBJECT_HANDLER_PROC                        HandlerProc,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObjectDesc
++  )
++{
++  EFI_STATUS  Status;
++  CmObjectDesc->ObjectId = CmObjectId;
++  if (Token == CM_NULL_TOKEN) {
++    CmObjectDesc->Size = ObjectSize;
++    CmObjectDesc->Data = (VOID*)Object;
++    CmObjectDesc->Count = ObjectCount;
++    Status = EFI_SUCCESS;
++  } else {
++    Status = HandlerProc (This, CmObjectId, Token, CmObjectDesc);
++  }
++
++  DEBUG ((
++    DEBUG_INFO,
++    "INFO: Token = 0x%p, CmObjectId = %x, Ptr = 0x%p, Size = %d, Count = %d\n",
++    (VOID*)Token,
++    CmObjectId,
++    CmObjectDesc->Data,
++    CmObjectDesc->Size,
++    CmObjectDesc->Count
++    ));
++  return Status;
++}
++
++/** A helper function for returning Configuration Manager Object(s) referenced
++    by token when the entire platform repository is in scope and the
++    CM_NULL_TOKEN value is not allowed.
++  @param [in]  This               Pointer to the Configuration Manager Protocol.
++  @param [in]  CmObjectId         The Configuration Manager Object ID.
++  @param [in]  Token              A token identifying the object.
++  @param [in]  HandlerProc        A handler function to search the object(s)
++                                  referenced by the token.
++  @param [in, out]  CmObjectDesc  Pointer to the Configuration Manager Object
++                                  descriptor describing the requested Object.
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++STATIC
++EFI_STATUS
++EFIAPI
++HandleCmObjectSearchPlatformRepo (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token,
++  IN  CONST CM_OBJECT_HANDLER_PROC                        HandlerProc,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObjectDesc
++  )
++{
++  EFI_STATUS  Status;
++  CmObjectDesc->ObjectId = CmObjectId;
++  if (Token == CM_NULL_TOKEN) {
++    DEBUG ((
++      DEBUG_ERROR,
++      "ERROR: CM_NULL_TOKEN value is not allowed when searching"
++      " the entire platform repository.\n"
++      ));
++    return EFI_INVALID_PARAMETER;
++  }
++
++  Status = HandlerProc (This, CmObjectId, Token, CmObjectDesc);
++  DEBUG ((
++    DEBUG_INFO,
++    "INFO: Token = 0x%p, CmObjectId = %x, Ptr = 0x%p, Size = %d, Count = %d\n",
++    CmObjectId,
++    (VOID*)Token,
++    CmObjectDesc->Data,
++    CmObjectDesc->Size,
++    CmObjectDesc->Count
++    ));
++  return Status;
++}
++
++/** Initialize the Platform Configuration Repository.
++
++  @param [in]  This        Pointer to the Platform Configuration Repository.
++
++  @retval
++    EFI_SUCCESS   Success
++**/
++STATIC
++EFI_STATUS
++EFIAPI
++InitializePlatformRepository (
++  IN  EDKII_PLATFORM_REPOSITORY_INFO  * CONST PlatformRepo
++  )
++{
++  return EFI_SUCCESS;
++}
++
++/** Return a GT Block timer frame info list.
++
++  @param [in]      This        Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId  The Configuration Manager Object ID.
++  @param [in]      Token       A token for identifying the object
++  @param [in, out] CmObject    Pointer to the Configuration Manager Object
++                               descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++EFI_STATUS
++EFIAPI
++GetGTBlockTimerFrameInfo (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  PlatformRepo = This->PlatRepoInfo;
++
++  if (Token != (CM_OBJECT_TOKEN)&PlatformRepo->GTBlock0TimerInfo) {
++    return EFI_NOT_FOUND;
++  }
++
++  CmObject->ObjectId = CmObjectId;
++  CmObject->Size = sizeof (PlatformRepo->GTBlock0TimerInfo);
++  CmObject->Data = (VOID*)&PlatformRepo->GTBlock0TimerInfo;
++  CmObject->Count = sizeof (PlatformRepo->GTBlock0TimerInfo) /
++                      sizeof (PlatformRepo->GTBlock0TimerInfo[0]);
++  return EFI_SUCCESS;
++}
++
++/** Return an ITS identifier array.
++
++  @param [in]  This        Pointer to the Configuration Manager Protocol.
++  @param [in]  CmObjectId  The Configuration Manager Object ID.
++  @param [in]  Token       A token for identifying the object
++  @param [out] CmObject    Pointer to the Configuration Manager Object
++                           descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++*/
++EFI_STATUS
++EFIAPI
++GetItsIdentifierArray (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++  UINTN                             Count;
++  UINTN                             Index;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  PlatformRepo = This->PlatRepoInfo;
++
++  Count = sizeof (PlatformRepo->ItsIdentifierArray) /
++            sizeof (PlatformRepo->ItsIdentifierArray[0]);
++
++  for (Index = 0; Index < Count; Index++) {
++    if (Token == (CM_OBJECT_TOKEN)&PlatformRepo->ItsIdentifierArray[Index]) {
++      CmObject->ObjectId = CmObjectId;
++      CmObject->Size = sizeof (PlatformRepo->ItsIdentifierArray[0]);
++      CmObject->Data = (VOID*)&PlatformRepo->ItsIdentifierArray[Index];
++      CmObject->Count = 1;
++      return EFI_SUCCESS;
++    }
++  }
++
++  return EFI_NOT_FOUND;
++}
++
++/** Return an ITS group info.
++
++  @param [in]  This        Pointer to the Configuration Manager Protocol.
++  @param [in]  CmObjectId  The Configuration Manager Object ID.
++  @param [in]  Token       A token for identifying the object
++  @param [out] CmObject    Pointer to the Configuration Manager Object
++                           descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++*/
++EFI_STATUS
++EFIAPI
++GetItsGroupInfo (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++  UINTN                             Count;
++  UINTN                             Index;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  PlatformRepo = This->PlatRepoInfo;
++
++  Count = sizeof (PlatformRepo->ItsGroupInfo) /
++            sizeof (PlatformRepo->ItsGroupInfo[0]);
++
++  for (Index = 0; Index < Count; Index++) {
++    if (Token == (CM_OBJECT_TOKEN)&PlatformRepo->ItsGroupInfo[Index]) {
++      CmObject->ObjectId = CmObjectId;
++      CmObject->Size = sizeof (PlatformRepo->ItsGroupInfo[0]);
++      CmObject->Data = (VOID*)&PlatformRepo->ItsGroupInfo[Index];
++      CmObject->Count = 1;
++      return EFI_SUCCESS;
++    }
++  }
++
++  return EFI_NOT_FOUND;
++}
++
++/** Return a device Id mapping array.
++
++  @param [in]  This        Pointer to the Configuration Manager Protocol.
++  @param [in]  CmObjectId  The Configuration Manager Object ID.
++  @param [in]  Token       A token for identifying the object
++  @param [out] CmObject    Pointer to the Configuration Manager Object
++                           descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++*/
++EFI_STATUS
++EFIAPI
++GetDeviceIdMappingArray (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++  UINTN                             Count;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  PlatformRepo = This->PlatRepoInfo;
++
++  DEBUG ((DEBUG_INFO, "DeviceIdMapping - Token = %p\n"));
++
++  if (Token == (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[0][0]) {
++    Count = 2;
++    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[0][0]\n"));
++  } else if (Token ==
++             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[1][0]) {
++    Count = 2;
++    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[1][0]\n"));
++  } else if (Token ==
++             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[2][0]) {
++    Count  = 1;
++    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[2][0]\n"));
++  } else if (Token ==
++             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[2][1]) {
++    Count  = 1;
++    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[2][1]\n"));
++  } else if (Token ==
++             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[DEVICEIDMAPPING_REMOTE_SMMU_PCIE][0]) {
++    Count = 2;
++    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[DEVICEIDMAPPING_REMOTE_SMMU_PCIE][0]\n"));
++  } else if (Token ==
++             (CM_OBJECT_TOKEN)&PlatformRepo->DeviceIdMapping[DEVICEIDMAPPING_REMOTE_PCIE][0]) {
++    Count  = 1;
++    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Found DeviceIdMapping[DEVICEIDMAPPING_REMOTE_PCIE][0]\n"));
++  } else {
++    DEBUG ((DEBUG_INFO, "DeviceIdMapping - Not Found\n"));
++    return EFI_NOT_FOUND;
++  }
++
++  CmObject->Data = (VOID*)Token;
++  CmObject->ObjectId = CmObjectId;
++  CmObject->Count = Count;
++  CmObject->Size = Count * sizeof (CM_ARM_ID_MAPPING);
++
++  return EFI_SUCCESS;
++}
++
++/** Return GIC CPU Interface Info.
++
++  @param [in]      This           Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId     The Object ID of the CM object requested
++  @param [in]      SearchToken    A unique token for identifying the requested
++                                  CM_ARM_GICC_INFO object.
++  @param [in, out] CmObject       Pointer to the Configuration Manager Object
++                                  descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS             Success.
++  @retval EFI_INVALID_PARAMETER   A parameter is invalid.
++  @retval EFI_NOT_FOUND           The required object information is not found.
++**/
++EFI_STATUS
++EFIAPI
++GetGicCInfo (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               SearchToken,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++  NEOVERSEN1SOC_PLAT_INFO         *PlatInfo;
++  UINT32                          TotalObjCount;
++  UINT32                          ObjIndex;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  PlatformRepo = This->PlatRepoInfo;
++  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
++
++  if (PlatInfo->MultichipMode)
++    TotalObjCount = PLAT_CPU_COUNT * 2;
++  else
++    TotalObjCount = PLAT_CPU_COUNT;
++
++  for (ObjIndex = 0; ObjIndex < TotalObjCount; ObjIndex++) {
++    if (SearchToken == (CM_OBJECT_TOKEN)&PlatformRepo->GicCInfo[ObjIndex]) {
++      CmObject->ObjectId = CmObjectId;
++      CmObject->Size = sizeof (PlatformRepo->GicCInfo[ObjIndex]);
++      CmObject->Data = (VOID*)&PlatformRepo->GicCInfo[ObjIndex];
++      CmObject->Count = 1;
++      return EFI_SUCCESS;
++    }
++  }
++
++  return EFI_NOT_FOUND;
++}
++
++/** Return a list of Configuration Manager object references pointed to by the
++    given input token.
++
++  @param [in]      This           Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId     The Object ID of the CM object requested
++  @param [in]      SearchToken    A unique token for identifying the requested
++                                  CM_ARM_OBJ_REF list.
++  @param [in, out] CmObject       Pointer to the Configuration Manager Object
++                                  descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS             Success.
++  @retval EFI_INVALID_PARAMETER   A parameter is invalid.
++  @retval EFI_NOT_FOUND           The required object information is not found.
++**/
++EFI_STATUS
++EFIAPI
++GetCmObjRefs (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               SearchToken,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  PlatformRepo = This->PlatRepoInfo;
++
++  if (SearchToken == (CM_OBJECT_TOKEN)&PlatformRepo->ClusterResources) {
++    CmObject->Size = sizeof (PlatformRepo->ClusterResources);
++    CmObject->Data = (VOID*)&PlatformRepo->ClusterResources;
++    CmObject->Count = ARRAY_SIZE (PlatformRepo->ClusterResources);
++    return EFI_SUCCESS;
++  }
++  if (SearchToken == (CM_OBJECT_TOKEN)&PlatformRepo->CoreResources) {
++    CmObject->Size = sizeof (PlatformRepo->CoreResources);
++    CmObject->Data = (VOID*)&PlatformRepo->CoreResources;
++    CmObject->Count = ARRAY_SIZE (PlatformRepo->CoreResources);
++    return EFI_SUCCESS;
++  }
++  if (SearchToken == (CM_OBJECT_TOKEN)&PlatformRepo->SocResources) {
++    CmObject->Size = sizeof (PlatformRepo->SocResources);
++    CmObject->Data = (VOID*)&PlatformRepo->SocResources;
++    CmObject->Count = ARRAY_SIZE (PlatformRepo->SocResources);
++    return EFI_SUCCESS;
++  }
++
++  return EFI_NOT_FOUND;
++}
++
++/** Return a standard namespace object.
++
++  @param [in]      This        Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId  The Configuration Manager Object ID.
++  @param [in]      Token       An optional token identifying the object. If
++                               unused this must be CM_NULL_TOKEN.
++  @param [in, out] CmObject    Pointer to the Configuration Manager Object
++                               descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++EFI_STATUS
++EFIAPI
++GetStandardNameSpaceObject (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EFI_STATUS                      Status;
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++  NEOVERSEN1SOC_PLAT_INFO         *PlatInfo;
++  UINT32                           AcpiTableCount;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  Status = EFI_NOT_FOUND;
++  PlatformRepo = This->PlatRepoInfo;
++  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
++  AcpiTableCount = (sizeof (PlatformRepo->CmAcpiTableList) /
++                    sizeof (PlatformRepo->CmAcpiTableList[0]));
++  if (!PlatInfo->MultichipMode)
++        AcpiTableCount -= 1;
++
++  switch (GET_CM_OBJECT_ID (CmObjectId)) {
++    case EStdObjCfgMgrInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->CmInfo,
++                 sizeof (PlatformRepo->CmInfo),
++                 1,
++                 CmObject
++                 );
++      break;
++    case EStdObjAcpiTableList:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->CmAcpiTableList,
++                 sizeof (PlatformRepo->CmAcpiTableList),
++                 AcpiTableCount,
++                 CmObject
++                 );
++      break;
++    default: {
++      Status = EFI_NOT_FOUND;
++      DEBUG ((
++        DEBUG_ERROR,
++        "ERROR: Object 0x%x. Status = %r\n",
++        CmObjectId,
++        Status
++        ));
++      break;
++    }
++  }
++
++  return Status;
++}
++
++/** Return an ARM namespace object.
++
++  @param [in]      This        Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId  The Configuration Manager Object ID.
++  @param [in]      Token       An optional token identifying the object. If
++                               unused this must be CM_NULL_TOKEN.
++  @param [in, out] CmObject    Pointer to the Configuration Manager Object
++                               descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++EFI_STATUS
++EFIAPI
++GetArmNameSpaceObject (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EFI_STATUS                        Status;
++  EDKII_PLATFORM_REPOSITORY_INFO  * PlatformRepo;
++  NEOVERSEN1SOC_PLAT_INFO         *PlatInfo;
++  UINT32                          GicRedistCount;
++  UINT32                          GicCpuCount;
++  UINT32                          ProcHierarchyInfoCount;
++  UINT32                          GicItsInfoCount;
++  UINT32                          ItsGroupInfoCount;
++  UINT32                          ItsIdentifierArrayCount;
++  UINT32                          SmmuV3InfoCount;
++  UINT32                          DeviceIdMappingCount;
++  UINT32                          RootComplexInfoCount;
++  UINT32                          PciConfigInfoCount;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  Status = EFI_NOT_FOUND;
++  PlatformRepo = This->PlatRepoInfo;
++
++  /* Probe for multi chip information */
++  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
++  if (PlatInfo->MultichipMode) {
++    GicRedistCount = 2;
++    GicCpuCount = PLAT_CPU_COUNT * 2;
++    ProcHierarchyInfoCount = PLAT_PROC_HIERARCHY_NODE_COUNT * 2;
++    GicItsInfoCount = ITS_MAX;
++    ItsGroupInfoCount = ITS_MAX;
++    ItsIdentifierArrayCount = ITS_MAX;
++    SmmuV3InfoCount = SMMUV3INFO_MAX;
++    DeviceIdMappingCount = DEVICEIDMAPPING_MAX;
++    RootComplexInfoCount = ROOT_PCIE_MAX;
++    PciConfigInfoCount = ROOT_PCIE_MAX;
++  } else {
++    GicRedistCount = 1;
++    GicCpuCount = PLAT_CPU_COUNT;
++    ProcHierarchyInfoCount = PLAT_PROC_HIERARCHY_NODE_COUNT;
++    GicItsInfoCount = ITS_MASTER_CHIP_MAX;
++    ItsGroupInfoCount = ITS_MASTER_CHIP_MAX;
++    ItsIdentifierArrayCount = ITS_MASTER_CHIP_MAX;
++    SmmuV3InfoCount = SMMUV3INFO_MASTER_CHIP_MAX;
++    DeviceIdMappingCount = DEVICEIDMAPPING_MASTER_CHIP_MAX;
++    RootComplexInfoCount = ROOT_PCIE_MASTER_CHIP_MAX;
++    PciConfigInfoCount = ROOT_PCIE_MASTER_CHIP_MAX;
++  }
++
++  switch (GET_CM_OBJECT_ID (CmObjectId)) {
++    case EArmObjBootArchInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->BootArchInfo,
++                 sizeof (PlatformRepo->BootArchInfo),
++                 1,
++                 CmObject
++                 );
++      break;
++
++#ifdef HEADLESS_PLATFORM
++    case EArmObjFixedFeatureFlags:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->FixedFeatureFlags,
++                 sizeof (PlatformRepo->FixedFeatureFlags),
++                 1,
++                 CmObject
++                 );
++#endif
++      break;
++
++    case EArmObjPowerManagementProfileInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->PmProfileInfo,
++                 sizeof (PlatformRepo->PmProfileInfo),
++                 1,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjGenericTimerInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->GenericTimerInfo,
++                 sizeof (PlatformRepo->GenericTimerInfo),
++                 1,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjPlatformGenericWatchdogInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->Watchdog,
++                 sizeof (PlatformRepo->Watchdog),
++                 1,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjPlatformGTBlockInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->GTBlockInfo,
++                 sizeof (PlatformRepo->GTBlockInfo),
++                 ARRAY_SIZE (PlatformRepo->GTBlockInfo),
++                 CmObject
++                 );
++      break;
++
++    case EArmObjGTBlockTimerFrameInfo:
++      Status = HandleCmObjectRefByToken (
++                 This,
++                 CmObjectId,
++                 PlatformRepo->GTBlock0TimerInfo,
++                 sizeof (PlatformRepo->GTBlock0TimerInfo),
++                 ARRAY_SIZE (PlatformRepo->GTBlock0TimerInfo),
++                 Token,
++                 GetGTBlockTimerFrameInfo,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjGicCInfo:
++      Status = HandleCmObjectRefByToken (
++                 This,
++                 CmObjectId,
++                 PlatformRepo->GicCInfo,
++                 sizeof (PlatformRepo->GicCInfo),
++                 GicCpuCount,
++                 Token,
++                 GetGicCInfo,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjGicDInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->GicDInfo,
++                 sizeof (PlatformRepo->GicDInfo),
++                 1,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjGicRedistributorInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->GicRedistInfo,
++                 sizeof (PlatformRepo->GicRedistInfo),
++                 GicRedistCount,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjSerialConsolePortInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->SpcrSerialPort,
++                 sizeof (PlatformRepo->SpcrSerialPort),
++                 1,
++                 CmObject
++                 );
++      break;
++
++    case  EArmObjSerialDebugPortInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 &PlatformRepo->DbgSerialPort,
++                 sizeof (PlatformRepo->DbgSerialPort),
++                 1,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjGicItsInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->GicItsInfo,
++                 sizeof (PlatformRepo->GicItsInfo),
++                 GicItsInfoCount,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjSmmuV3:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->SmmuV3Info,
++                 sizeof (PlatformRepo->SmmuV3Info),
++                 SmmuV3InfoCount,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjItsGroup:
++      Status = HandleCmObjectRefByToken (
++                 This,
++                 CmObjectId,
++                 PlatformRepo->ItsGroupInfo,
++                 sizeof (PlatformRepo->ItsGroupInfo),
++                 ItsGroupInfoCount,
++                 Token,
++                 GetItsGroupInfo,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjGicItsIdentifierArray:
++      Status = HandleCmObjectRefByToken (
++                 This,
++                 CmObjectId,
++                 PlatformRepo->ItsIdentifierArray,
++                 sizeof (PlatformRepo->ItsIdentifierArray),
++                 ItsIdentifierArrayCount,
++                 Token,
++                 GetItsIdentifierArray,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjRootComplex:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->RootComplexInfo,
++                 sizeof (PlatformRepo->RootComplexInfo),
++                 RootComplexInfoCount,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjIdMappingArray:
++      Status = HandleCmObjectRefByToken (
++                 This,
++                 CmObjectId,
++                 PlatformRepo->DeviceIdMapping,
++                 sizeof (PlatformRepo->DeviceIdMapping),
++                 DeviceIdMappingCount,
++                 Token,
++                 GetDeviceIdMappingArray,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjProcHierarchyInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->ProcHierarchyInfo,
++                 sizeof (PlatformRepo->ProcHierarchyInfo),
++                 ProcHierarchyInfoCount,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjCacheInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->CacheInfo,
++                 sizeof (PlatformRepo->CacheInfo),
++                 ARRAY_SIZE (PlatformRepo->CacheInfo),
++                 CmObject
++                 );
++      break;
++
++    case EArmObjCmRef:
++      Status = HandleCmObjectSearchPlatformRepo (
++                 This,
++                 CmObjectId,
++                 Token,
++                 GetCmObjRefs,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjPciConfigSpaceInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->PciConfigInfo,
++                 sizeof (PlatformRepo->PciConfigInfo),
++                 PciConfigInfoCount,
++                 CmObject
++                 );
++      break;
++
++    case EArmObjMemoryAffinityInfo:
++      Status = HandleCmObject (
++                 CmObjectId,
++                 PlatformRepo->MemAffInfo,
++                 sizeof (PlatformRepo->MemAffInfo),
++                 ARRAY_SIZE (PlatformRepo->MemAffInfo),
++                 CmObject
++                 );
++      break;
++
++    default: {
++      Status = EFI_NOT_FOUND;
++      DEBUG ((
++        DEBUG_INFO,
++        "INFO: Object 0x%x. Status = %r\n",
++        CmObjectId,
++        Status
++        ));
++      break;
++    }
++  }//switch
++
++  return Status;
++}
++
++/** Return an OEM namespace object.
++
++  @param [in]      This        Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId  The Configuration Manager Object ID.
++  @param [in]      Token       An optional token identifying the object. If
++                               unused this must be CM_NULL_TOKEN.
++  @param [in, out] CmObject    Pointer to the Configuration Manager Object
++                               descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++EFI_STATUS
++EFIAPI
++GetOemNameSpaceObject (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EFI_STATUS  Status;
++
++  Status = EFI_SUCCESS;
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  switch (GET_CM_OBJECT_ID (CmObjectId)) {
++    default: {
++      Status = EFI_NOT_FOUND;
++      DEBUG ((
++        DEBUG_ERROR,
++        "ERROR: Object 0x%x. Status = %r\n",
++        CmObjectId,
++        Status
++        ));
++      break;
++    }
++  }
++
++  return Status;
++}
++
++/** The GetObject function defines the interface implemented by the
++    Configuration Manager Protocol for returning the Configuration
++    Manager Objects.
++
++  @param [in]      This        Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId  The Configuration Manager Object ID.
++  @param [in]      Token       An optional token identifying the object. If
++                               unused this must be CM_NULL_TOKEN.
++  @param [in, out] CmObject    Pointer to the Configuration Manager Object
++                               descriptor describing the requested Object.
++
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++EFI_STATUS
++EFIAPI
++N1sdpPlatformGetObject (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  EFI_STATUS  Status;
++
++  if ((This == NULL) || (CmObject == NULL)) {
++    ASSERT (This != NULL);
++    ASSERT (CmObject != NULL);
++    return EFI_INVALID_PARAMETER;
++  }
++
++  switch (GET_CM_NAMESPACE_ID (CmObjectId)) {
++    case EObjNameSpaceStandard:
++      Status = GetStandardNameSpaceObject (This, CmObjectId, Token, CmObject);
++      break;
++    case EObjNameSpaceArm:
++      Status = GetArmNameSpaceObject (This, CmObjectId, Token, CmObject);
++      break;
++    case EObjNameSpaceOem:
++      Status = GetOemNameSpaceObject (This, CmObjectId, Token, CmObject);
++      break;
++    default: {
++      Status = EFI_INVALID_PARAMETER;
++      DEBUG ((
++        DEBUG_ERROR,
++        "ERROR: Unknown Namespace Object = 0x%x. Status = %r\n",
++        CmObjectId,
++        Status
++        ));
++      break;
++    }
++  }
++
++  return Status;
++}
++
++/** The SetObject function defines the interface implemented by the
++    Configuration Manager Protocol for updating the Configuration
++    Manager Objects.
++
++  @param [in]      This        Pointer to the Configuration Manager Protocol.
++  @param [in]      CmObjectId  The Configuration Manager Object ID.
++  @param [in]      Token       An optional token identifying the object. If
++                               unused this must be CM_NULL_TOKEN.
++  @param [in]      CmObject    Pointer to the Configuration Manager Object
++                               descriptor describing the Object.
++
++  @retval EFI_UNSUPPORTED  This operation is not supported.
++**/
++EFI_STATUS
++EFIAPI
++N1sdpPlatformSetObject (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token OPTIONAL,
++  IN        CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  )
++{
++  return EFI_UNSUPPORTED;
++}
++
++/** A structure describing the configuration manager protocol interface.
++*/
++STATIC
++CONST
++EDKII_CONFIGURATION_MANAGER_PROTOCOL N1sdpPlatformConfigManagerProtocol = {
++  CREATE_REVISION(1,0),
++  N1sdpPlatformGetObject,
++  N1sdpPlatformSetObject,
++  &N1sdpRepositoryInfo
++};
++
++/**
++  Entrypoint of Configuration Manager Dxe.
++
++  @param  ImageHandle
++  @param  SystemTable
++
++  @return EFI_SUCCESS
++  @return EFI_LOAD_ERROR
++  @return EFI_OUT_OF_RESOURCES
++
++**/
++EFI_STATUS
++EFIAPI
++ConfigurationManagerDxeInitialize (
++  IN EFI_HANDLE          ImageHandle,
++  IN EFI_SYSTEM_TABLE  * SystemTable
++  )
++{
++  EFI_STATUS  Status;
++  NEOVERSEN1SOC_PLAT_INFO       *PlatInfo;
++  UINT64                        Dram2Size;
++  UINT64                        RemoteDdrSize = 0;
++
++  PlatInfo = (NEOVERSEN1SOC_PLAT_INFO *)NEOVERSEN1SOC_PLAT_INFO_STRUCT_BASE;
++  Dram2Size = ((PlatInfo->LocalDdrSize - 2) * 1024UL * 1024UL * 1024UL);
++
++  N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[LOCAL_DDR_REGION2]. \
++    Length = Dram2Size;
++
++  if (PlatInfo->MultichipMode == 1) {
++    RemoteDdrSize = ((PlatInfo->RemoteDdrSize -2) * 1024UL * 1024UL * 1024UL);
++
++    //Update Remote DDR Region1
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION1]. \
++      ProximityDomain = 1;
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION1]. \
++      BaseAddress = FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (PcdSystemMemoryBase);
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION1]. \
++      Length = FixedPcdGet64 (PcdSystemMemorySize);
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION1]. \
++      Flags = EFI_ACPI_6_3_MEMORY_ENABLED;
++
++    //Update Remote DDR Region2
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION2]. \
++      ProximityDomain = 1;
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION2]. \
++      BaseAddress = FixedPcdGet64 (PcdExtMemorySpace) + FixedPcdGet64 (PcdDramBlock2Base);
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION2]. \
++      Length = RemoteDdrSize;
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo->MemAffInfo[REMOTE_DDR_REGION2]. \
++      Flags = EFI_ACPI_6_3_MEMORY_ENABLED;
++  }
++
++  // Initialize the Platform Configuration Repository before installing the
++  // Configuration Manager Protocol
++  Status = InitializePlatformRepository (
++    N1sdpPlatformConfigManagerProtocol.PlatRepoInfo
++    );
++  if (EFI_ERROR (Status)) {
++    DEBUG ((
++      DEBUG_ERROR,
++      "ERROR: Failed to initialize the Platform Configuration Repository." \
++      " Status = %r\n",
++      Status
++      ));
++  }
++
++  Status = gBS->InstallProtocolInterface (
++                  &ImageHandle,
++                  &gEdkiiConfigurationManagerProtocolGuid,
++                  EFI_NATIVE_INTERFACE,
++                  (VOID*)&N1sdpPlatformConfigManagerProtocol
++                  );
++  if (EFI_ERROR (Status)) {
++    DEBUG ((
++      DEBUG_ERROR,
++      "ERROR: Failed to get Install Configuration Manager Protocol." \
++      " Status = %r\n",
++      Status
++      ));
++    goto error_handler;
++  }
++
++error_handler:
++  return Status;
++}
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.h b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.h
+new file mode 100644
+index 0000000000..d7bd5bdd94
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManager.h
+@@ -0,0 +1,310 @@
++/** @file
++
++  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++  @par Glossary:
++    - Cm or CM   - Configuration Manager
++    - Obj or OBJ - Object
++**/
++
++#ifndef CONFIGURATION_MANAGER_H_
++#define CONFIGURATION_MANAGER_H_
++
++/** C array containing the compiled AML template.
++    This symbol is defined in the auto generated C file
++    containing the AML bytecode array.
++*/
++extern CHAR8  dsdt_aml_code[];
++extern CHAR8  ssdtpci_aml_code[];
++extern CHAR8  ssdtremotepci_aml_code[];
++
++/** The configuration manager version.
++*/
++#define CONFIGURATION_MANAGER_REVISION CREATE_REVISION (1, 0)
++
++/** The OEM ID
++*/
++#define CFG_MGR_OEM_ID    { 'A', 'R', 'M', 'L', 'T', 'D' }
++
++/** A helper macro for mapping a reference token
++*/
++#define REFERENCE_TOKEN(Field)                                    \
++  (CM_OBJECT_TOKEN)((UINT8*)&N1sdpRepositoryInfo +                \
++    OFFSET_OF (EDKII_PLATFORM_REPOSITORY_INFO, Field))
++
++/** A helper macro that constructs the MPID based on the
++    Aff0, Aff1, Aff2, Aff3 values
++*/
++#define GET_MPID3(Aff3, Aff2, Aff1, Aff0)                         \
++  (((Aff3##ULL) << 32) | ((Aff2) << 16) | ((Aff1) << 8) | (Aff0))
++
++/** A helper macro for populating the GIC CPU information
++*/
++#define GICC_ENTRY(                                                      \
++          CPUInterfaceNumber,                                            \
++          Mpidr,                                                         \
++          PmuIrq,                                                        \
++          VGicIrq,                                                       \
++          GicRedistBase,                                                 \
++          EnergyEfficiency,                                              \
++          SpeIrq,                                                        \
++          ProximityDomain,                                               \
++          ClockDomain                                                    \
++          ) {                                                            \
++    CPUInterfaceNumber,       /* UINT32  CPUInterfaceNumber           */ \
++    CPUInterfaceNumber,       /* UINT32  AcpiProcessorUid             */ \
++    EFI_ACPI_6_2_GIC_ENABLED, /* UINT32  Flags                        */ \
++    0,                        /* UINT32  ParkingProtocolVersion       */ \
++    PmuIrq,                   /* UINT32  PerformanceInterruptGsiv     */ \
++    0,                        /* UINT64  ParkedAddress                */ \
++    FixedPcdGet64 (                                                      \
++      PcdGicInterruptInterfaceBase                                       \
++      ),                      /* UINT64  PhysicalBaseAddress          */ \
++    0,                        /* UINT64  GICV                         */ \
++    0,                        /* UINT64  GICH                         */ \
++    VGicIrq,                  /* UINT32  VGICMaintenanceInterrupt     */ \
++    GicRedistBase,            /* UINT64  GICRBaseAddress              */ \
++    Mpidr,                    /* UINT64  MPIDR                        */ \
++    EnergyEfficiency,         /* UINT8   ProcessorPowerEfficiencyClass*/ \
++    SpeIrq,                   /* UINT16  SpeOverflowInterrupt         */ \
++    ProximityDomain,          /* UINT32  ProximityDomain              */ \
++    ClockDomain,              /* UINT32  ClockDomain                  */ \
++    EFI_ACPI_6_3_GICC_ENABLED,/* UINT32  Flags                        */ \
++    }
++
++/** A helper macro for populating the Processor Hierarchy Node flags
++*/
++#define PROC_NODE_FLAGS(                                                \
++          PhysicalPackage,                                              \
++          AcpiProcessorIdValid,                                         \
++          ProcessorIsThread,                                            \
++          NodeIsLeaf,                                                   \
++          IdenticalImplementation                                       \
++          )                                                             \
++  (                                                                     \
++    PhysicalPackage |                                                   \
++    (AcpiProcessorIdValid << 1) |                                       \
++    (ProcessorIsThread << 2) |                                          \
++    (NodeIsLeaf << 3) |                                                 \
++    (IdenticalImplementation << 4)                                      \
++  )
++
++/** A helper macro for populating the Cache Type Structure's attributes
++*/
++#define CACHE_ATTRIBUTES(                                               \
++          AllocationType,                                               \
++          CacheType,                                                    \
++          WritePolicy                                                   \
++          )                                                             \
++  (                                                                     \
++    AllocationType |                                                    \
++    (CacheType << 2) |                                                  \
++    (WritePolicy << 4)                                                  \
++  )
++
++/** A function that prepares Configuration Manager Objects for returning.
++  @param [in]  This        Pointer to the Configuration Manager Protocol.
++  @param [in]  CmObjectId  The Configuration Manager Object ID.
++  @param [in]  Token       A token for identifying the object.
++  @param [out] CmObject    Pointer to the Configuration Manager Object
++                           descriptor describing the requested Object.
++  @retval EFI_SUCCESS           Success.
++  @retval EFI_INVALID_PARAMETER A parameter is invalid.
++  @retval EFI_NOT_FOUND         The required object information is not found.
++**/
++typedef EFI_STATUS (*CM_OBJECT_HANDLER_PROC) (
++  IN  CONST EDKII_CONFIGURATION_MANAGER_PROTOCOL  * CONST This,
++  IN  CONST CM_OBJECT_ID                                  CmObjectId,
++  IN  CONST CM_OBJECT_TOKEN                               Token,
++  IN  OUT   CM_OBJ_DESCRIPTOR                     * CONST CmObject
++  );
++
++/** The number of CPUs
++*/
++#define PLAT_CPU_COUNT              4
++
++/** The number of ACPI tables to install
++*/
++#define PLAT_ACPI_TABLE_COUNT       13
++
++/** The number of platform generic timer blocks
++*/
++#define PLAT_GTBLOCK_COUNT          1
++
++/** The number of timer frames per generic timer block
++*/
++#define PLAT_GTFRAME_COUNT          2
++
++/** The number of Processor Hierarchy Nodes
++    - one package node
++    - two cluster nodes
++    - two cores in cluster 0
++    - two cores in cluster 1
++*/
++#define PLAT_PROC_HIERARCHY_NODE_COUNT  7
++
++/** The number of unique cache structures:
++    - cluster L3 unified cache
++    - core L1 instruction cache
++    - core L1 data cache
++    - core L2 cache
++    - slc unified cache
++*/
++#define PLAT_CACHE_COUNT                5
++
++/** The number of resources private to the cluster
++    - L3 cache
++*/
++#define CLUSTER_RESOURCE_COUNT  1
++
++/** The number of resources private to 'core instance
++    - L1 data cache
++    - L1 instruction cache
++    - L2 cache
++*/
++#define CORE_RESOURCE_COUNT  3
++
++/** The number of resources private to SoC
++    - slc cache
++*/
++#define SOC_RESOURCE_COUNT  1
++
++/** Number of memory affinity entries
++*/
++#define LOCAL_DDR_REGION1   0
++#define LOCAL_DDR_REGION2   1
++#define REMOTE_DDR_REGION1  2
++#define REMOTE_DDR_REGION2  3
++#define DDR_REGION_COUNT    4
++
++enum {
++   ITS_SMMU_CCIX = 0,
++   ITS_SMMU_PCIE,
++   ITS_CCIX,
++   ITS_PCIE,
++   ITS_MASTER_CHIP_MAX,
++   ITS_REMOTE_SMMU_PCIE = ITS_MASTER_CHIP_MAX,
++   ITS_REMOTE_PCIE,
++   ITS_MAX
++};
++
++enum {
++   SMMUV3INFO_PCIE = 0,
++   SMMUV3INFO_CCIX,
++   SMMUV3INFO_MASTER_CHIP_MAX,
++   SMMUV3INFO_REMOTE_PCIE = SMMUV3INFO_MASTER_CHIP_MAX,
++   SMMUV3INFO_MAX
++};
++
++enum {
++   ROOT_PCIE = 0,
++   ROOT_PCIE_CCIX,
++   ROOT_PCIE_MASTER_CHIP_MAX,
++   ROOT_REMOTE_PCIE = ROOT_PCIE_MASTER_CHIP_MAX,
++   ROOT_PCIE_MAX
++};
++
++enum {
++   DEVICEIDMAPPING_SMMU_PCIE = 0,
++   DEVICEIDMAPPING_SMMU_CCIX,
++   DEVICEIDMAPPING_PCIE,
++   DEVICEIDMAPPING_MASTER_CHIP_MAX,
++   DEVICEIDMAPPING_REMOTE_SMMU_PCIE = DEVICEIDMAPPING_MASTER_CHIP_MAX,
++   DEVICEIDMAPPING_REMOTE_PCIE,
++   DEVICEIDMAPPING_MAX,
++};
++
++/** A structure describing the platform configuration
++    manager repository information
++*/
++typedef struct PlatformRepositoryInfo {
++  /// Configuration Manager Information
++  CM_STD_OBJ_CONFIGURATION_MANAGER_INFO CmInfo;
++
++  /// List of ACPI tables
++  CM_STD_OBJ_ACPI_TABLE_INFO            CmAcpiTableList[PLAT_ACPI_TABLE_COUNT];
++
++  /// Boot architecture information
++  CM_ARM_BOOT_ARCH_INFO                 BootArchInfo;
++
++#ifdef HEADLESS_PLATFORM
++  /// Fixed feature flag information
++  CM_ARM_FIXED_FEATURE_FLAGS            FixedFeatureFlags;
++#endif
++
++  /// Power management profile information
++  CM_ARM_POWER_MANAGEMENT_PROFILE_INFO  PmProfileInfo;
++
++  /// GIC CPU interface information
++  CM_ARM_GICC_INFO                      GicCInfo[PLAT_CPU_COUNT * 2];
++
++  /// GIC distributor information
++  CM_ARM_GICD_INFO                      GicDInfo;
++
++  /// GIC Redistributor information
++  CM_ARM_GIC_REDIST_INFO                GicRedistInfo[2];
++
++  /// GIC ITS information
++  CM_ARM_GIC_ITS_INFO                   GicItsInfo[ITS_MAX];
++
++  /// Generic timer information
++  CM_ARM_GENERIC_TIMER_INFO             GenericTimerInfo;
++
++  /// Generic timer block information
++  CM_ARM_GTBLOCK_INFO                   GTBlockInfo[PLAT_GTBLOCK_COUNT];
++
++  /// Generic timer frame information
++  CM_ARM_GTBLOCK_TIMER_FRAME_INFO       GTBlock0TimerInfo[PLAT_GTFRAME_COUNT];
++
++  /// Watchdog information
++  CM_ARM_GENERIC_WATCHDOG_INFO          Watchdog;
++
++  /** Serial port information for the
++      serial port console redirection port
++  */
++  CM_ARM_SERIAL_PORT_INFO               SpcrSerialPort;
++
++  /// Serial port information for the DBG2 UART port
++  CM_ARM_SERIAL_PORT_INFO               DbgSerialPort;
++
++  // Processor topology information
++  CM_ARM_PROC_HIERARCHY_INFO            ProcHierarchyInfo[PLAT_PROC_HIERARCHY_NODE_COUNT * 2];
++
++  // Cache information
++  CM_ARM_CACHE_INFO                     CacheInfo[PLAT_CACHE_COUNT];
++
++  // Cluster private resources
++  CM_ARM_OBJ_REF                        ClusterResources[CLUSTER_RESOURCE_COUNT];
++
++  // Core private resources
++  CM_ARM_OBJ_REF                        CoreResources[CORE_RESOURCE_COUNT];
++
++  // SoC Resources
++  CM_ARM_OBJ_REF                        SocResources[SOC_RESOURCE_COUNT];
++
++  /// ITS Group node
++  CM_ARM_ITS_GROUP_NODE                 ItsGroupInfo[ITS_MAX];
++
++  /// ITS Identifier array
++  CM_ARM_ITS_IDENTIFIER                 ItsIdentifierArray[ITS_MAX];
++
++  /// SMMUv3 node
++  CM_ARM_SMMUV3_NODE                    SmmuV3Info[SMMUV3INFO_MAX];
++
++  /// PCI Root complex node
++  CM_ARM_ROOT_COMPLEX_NODE              RootComplexInfo[ROOT_PCIE_MAX];
++
++  /// Array of DeviceID mapping
++  CM_ARM_ID_MAPPING                     DeviceIdMapping[DEVICEIDMAPPING_MAX][2];
++
++  /// PCI configuration space information
++  CM_ARM_PCI_CONFIG_SPACE_INFO          PciConfigInfo[ROOT_PCIE_MAX];
++
++  /// Memory Affinity Info
++  CM_ARM_MEMORY_AFFINITY_INFO           MemAffInfo[DDR_REGION_COUNT];
++
++} EDKII_PLATFORM_REPOSITORY_INFO;
++
++#endif // CONFIGURATION_MANAGER_H_
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
+new file mode 100644
+index 0000000000..c91495a295
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
+@@ -0,0 +1,171 @@
++## @file
++#  Configuration Manager Dxe
++#
++#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++#
++#  SPDX-License-Identifier: BSD-2-Clause-Patent
++#
++##
++
++[Defines]
++  INF_VERSION                    = 0x0001001B
++  BASE_NAME                      = ConfigurationManagerDxe
++  FILE_GUID                      = 6F9C3B47-6F7D-44B6-87E5-4B7F44A60147
++  MODULE_TYPE                    = DXE_DRIVER
++  VERSION_STRING                 = 1.0
++  ENTRY_POINT                    = ConfigurationManagerDxeInitialize
++
++#
++# The following information is for reference only and not required by the build tools.
++#
++#  VALID_ARCHITECTURES           = ARM AARCH64
++#
++
++[Sources]
++  AslTables/Dsdt.asl
++  AslTables/SsdtPci.asl
++  AslTables/SsdtRemotePci.asl
++  ConfigurationManager.c
++  Hmat.c
++
++[Packages]
++  ArmPkg/ArmPkg.dec
++  ArmPlatformPkg/ArmPlatformPkg.dec
++  DynamicTablesPkg/DynamicTablesPkg.dec
++  EmbeddedPkg/EmbeddedPkg.dec
++  MdeModulePkg/MdeModulePkg.dec
++  MdePkg/MdePkg.dec
++  Platform/ARM/N1Sdp/N1SdpPlatform.dec
++  Platform/ARM/VExpressPkg/ArmVExpressPkg.dec
++  Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
++
++[LibraryClasses]
++  ArmPlatformLib
++  PrintLib
++  UefiBootServicesTableLib
++  UefiDriverEntryPoint
++  UefiRuntimeServicesTableLib
++
++[Protocols]
++  gEdkiiConfigurationManagerProtocolGuid
++
++[FixedPcd]
++  # PL011 Serial Debug UART
++  gArmPlatformTokenSpaceGuid.PcdSerialDbgRegisterBase
++  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartBaudRate
++  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartClkInHz
++
++  gArmPlatformTokenSpaceGuid.PL011UartClkInHz
++  gArmPlatformTokenSpaceGuid.PL011UartInterrupt
++
++  gArmTokenSpaceGuid.PcdArmArchTimerHypIntrNum
++  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum
++  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum
++  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum
++
++  # SBSA Generic Watchdog
++  gArmTokenSpaceGuid.PcdGenericWatchdogControlBase
++  gArmTokenSpaceGuid.PcdGenericWatchdogEl2IntrNum
++  gArmTokenSpaceGuid.PcdGenericWatchdogRefreshBase
++
++  gArmTokenSpaceGuid.PcdGicDistributorBase
++  gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase
++  gArmTokenSpaceGuid.PcdGicRedistributorsBase
++
++  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterBase
++  gEfiMdePkgTokenSpaceGuid.PcdUartDefaultBaudRate
++
++  gArmPlatformTokenSpaceGuid.PcdCoreCount
++  gArmPlatformTokenSpaceGuid.PcdClusterCount
++
++  gArmN1SdpTokenSpaceGuid.PcdPcieExpressBaseAddress
++
++  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace
++  gArmNeoverseN1SocTokenSpaceGuid.PcdDramBlock2Base
++
++  gArmTokenSpaceGuid.PcdSystemMemoryBase
++  gArmTokenSpaceGuid.PcdSystemMemorySize
++
++  #PCIe
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieRootPortConfigBaseAddress
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieRootPortConfigBaseSize
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusCount
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMax
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieBusMin
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoMaxBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoSize
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieIoTranslation
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Base
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32MaxBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Size
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio32Translation
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Base
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64MaxBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Size
++  gArmNeoverseN1SocTokenSpaceGuid.PcdPcieMmio64Translation
++
++  # CCIX
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusCount
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMax
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixBusMin
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixExpressBaseAddress
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoMaxBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoSize
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixIoTranslation
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Base
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32MaxBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Size
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio32Translation
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Base
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64MaxBase
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Size
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixMmio64Translation
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseAddress
++  gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize
++
++  # Coresight
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm0Base
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm0MaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm1Base
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm1MaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm2Base
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm2MaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm3Base
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm3MaxBase
++
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf0Base
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf0MaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf1Base
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf1MaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf2Base
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf2MaxBase
++
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0Base
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0MaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1Base
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1MaxBase
++
++  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorBase
++  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorMaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsTpiuBase
++  gArmN1SdpTokenSpaceGuid.PcdCsTpiuMaxBase
++
++  gArmN1SdpTokenSpaceGuid.PcdCsEtrBase
++  gArmN1SdpTokenSpaceGuid.PcdCsEtrMaxBase
++
++  gArmN1SdpTokenSpaceGuid.PcdCsStmBase
++  gArmN1SdpTokenSpaceGuid.PcdCsStmMaxBase
++  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusBase
++  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusSize
++
++  gArmN1SdpTokenSpaceGuid.PcdCsComponentSize
++
++  # Remote PCIe
++  gArmN1SdpTokenSpaceGuid.PcdRemotePcieIoTranslation
++  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio32Translation
++  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio64Translation
++
++[Depex]
++  TRUE
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Hmat.c b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Hmat.c
+new file mode 100644
+index 0000000000..c69d03c9ae
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Hmat.c
+@@ -0,0 +1,104 @@
++/** @file
++*  Heterogeneous Memory Attribute Table (HMAT)
++*
++*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++*
++*  SPDX-License-Identifier: BSD-2-Clause-Patent
++*
++**/
++
++#include <IndustryStandard/Acpi.h>
++#include <Library/AcpiLib.h>
++#include <Library/ArmLib.h>
++#include "N1SdpAcpiHeader.h"
++
++//
++// Heterogeneous Memory Attribute Table
++//
++#pragma pack (1)
++
++typedef struct {
++  EFI_ACPI_6_3_HMAT_STRUCTURE_SYSTEM_LOCALITY_LATENCY_AND_BANDWIDTH_INFO LatencyStruct;
++  UINT32 InitiatorProximityDomainList[1];
++  UINT32 TargetProximityDomainList[2];
++  UINT16 LatencyEntry[1][2];
++} EFI_ACPI_6_3_HMAT_SYSTEM_LOCALITY_LATENCY_STRUCTURE;
++
++typedef struct {
++  EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_HEADER       Header;
++  EFI_ACPI_6_3_HMAT_STRUCTURE_MEMORY_PROXIMITY_DOMAIN_ATTRIBUTES Memory[2];
++  EFI_ACPI_6_3_HMAT_SYSTEM_LOCALITY_LATENCY_STRUCTURE            LatencyInfo;
++} EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE;
++
++#pragma pack ()
++
++EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE Hmat = {
++  // Header
++  {
++    ARM_ACPI_HEADER (
++      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_SIGNATURE,
++      EFI_ACPI_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE,
++      EFI_ACPI_6_3_HETEROGENEOUS_MEMORY_ATTRIBUTE_TABLE_REVISION
++    ),
++    {0x00, 0x00, 0x00, 0x00},
++  },
++
++  // Memory Attribute Structure
++  {
++    {
++      EFI_ACPI_6_3_HMAT_TYPE_MEMORY_PROXIMITY_DOMAIN_ATTRIBUTES, // Type
++      {0x00, 0x00}, // Reserved
++      40, // Length
++      {.InitiatorProximityDomainValid = 1}, // Flags
++      {0x00, 0x00}, // Reserved1
++      0, // InitiatorProximityDomain
++      0, // MemoryProximityDomain
++      { 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++      }, // Reserved2
++    },
++    {
++      EFI_ACPI_6_3_HMAT_TYPE_MEMORY_PROXIMITY_DOMAIN_ATTRIBUTES, // Type
++      {0x00, 0x00}, // Reserved
++      40, // Length
++      {.InitiatorProximityDomainValid = 1}, // Flags
++      {0x00, 0x00}, // Reserved1
++      0, // InitiatorProximityDomain
++      1, // MemoryProximityDomain
++      { 0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++        0x00, 0x00, 0x00, 0x00,
++      }, // Reserved2
++    },
++  },
++
++  // System Locality Latency Structure (LatencyInfo)
++  {
++    // LatencyStruct
++    {
++      EFI_ACPI_6_3_HMAT_TYPE_SYSTEM_LOCALITY_LATENCY_AND_BANDWIDTH_INFO, // Type
++      {0x00, 0x00}, // Reserved
++      sizeof (EFI_ACPI_6_3_HMAT_SYSTEM_LOCALITY_LATENCY_STRUCTURE), // Length
++      {.MemoryHierarchy = 0}, // Flags
++      0, // DataType - Access latency
++      {0x00, 0x00}, // Reserved1
++      1, // NumberOfInitiatorProximityDomains
++      2, // NumberOfTargetProximityDomains
++      {0x00, 0x00, 0x00, 0x00}, // Reserved2
++      1000, // EntryBaseUnit - 1000ps = 1ns
++    },
++    // InitiatorProximityDomainList
++    { 0 },
++    // TargetProximityDomainList
++    { 0, 1 },
++    // LatencyEntry
++    {
++      {119, 200}, // [0][0], [0][1]
++    },
++  },
++};
+diff --git a/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Platform.h b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Platform.h
+new file mode 100644
+index 0000000000..d220b09446
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/Platform.h
+@@ -0,0 +1,92 @@
++/** @file
++
++  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#ifndef PLATFORM_H_
++#define PLATFORM_H_
++
++#define ENABLE_MEM_MAPPED_TIMER
++
++#ifdef ENABLE_MEM_MAPPED_TIMER
++// REFCLK CNTControl
++#define N1SDP_SYSTEM_TIMER_BASE_ADDRESS   0x2A430000
++// REFCLK CNTRead
++#define N1SDP_CNT_READ_BASE_ADDRESS       0x2A800000
++#else
++#define N1SDP_SYSTEM_TIMER_BASE_ADDRESS   0xFFFFFFFFFFFFFFFF
++#define N1SDP_CNT_READ_BASE_ADDRESS       0xFFFFFFFFFFFFFFFF
++#endif
++
++// GT Block Timer
++// AP_REFCLK CNTCTL
++#define N1SDP_GT_BLOCK_CTL_BASE           0x2A810000
++#define N1SDP_TIMER_FRAMES_COUNT          2
++
++// GT Block Timer Frames
++// AP_REFCLK_S CNTBase0
++#define N1SDP_GT_BLOCK_FRAME0_CTL_BASE      0x2A830000
++#define N1SDP_GT_BLOCK_FRAME0_CTL_EL0_BASE  0xFFFFFFFFFFFFFFFF
++#define N1SDP_GT_BLOCK_FRAME0_GSIV          92
++
++// AP_REFCLK_NS CNTBase1
++#define N1SDP_GT_BLOCK_FRAME1_CTL_BASE      0x2A820000
++#define N1SDP_GT_BLOCK_FRAME1_CTL_EL0_BASE  0xFFFFFFFFFFFFFFFF
++#define N1SDP_GT_BLOCK_FRAME1_GSIV          91
++
++#define GTDT_TIMER_EDGE_TRIGGERED   \
++          EFI_ACPI_6_3_GTDT_TIMER_FLAG_TIMER_INTERRUPT_MODE
++#define GTDT_TIMER_LEVEL_TRIGGERED  0
++#define GTDT_TIMER_ACTIVE_LOW       \
++          EFI_ACPI_6_3_GTDT_TIMER_FLAG_TIMER_INTERRUPT_POLARITY
++#define GTDT_TIMER_ACTIVE_HIGH      0
++#define GTDT_TIMER_SAVE_CONTEXT     \
++          EFI_ACPI_6_3_GTDT_TIMER_FLAG_ALWAYS_ON_CAPABILITY
++#define GTDT_TIMER_LOSE_CONTEXT     0
++
++#define N1SDP_GTDT_GTIMER_FLAGS       (GTDT_TIMER_LOSE_CONTEXT   | \
++                                         GTDT_TIMER_ACTIVE_LOW   | \
++                                         GTDT_TIMER_LEVEL_TRIGGERED)
++
++// GT Block Timer Flags
++#define GTX_TIMER_EDGE_TRIGGERED    \
++          EFI_ACPI_6_3_GTDT_GT_BLOCK_TIMER_FLAG_TIMER_INTERRUPT_MODE
++#define GTX_TIMER_LEVEL_TRIGGERED   0
++#define GTX_TIMER_ACTIVE_LOW        \
++          EFI_ACPI_6_3_GTDT_GT_BLOCK_TIMER_FLAG_TIMER_INTERRUPT_POLARITY
++#define GTX_TIMER_ACTIVE_HIGH       0
++
++#define N1SDP_GTX_TIMER_FLAGS         (GTX_TIMER_ACTIVE_HIGH | \
++                                         GTX_TIMER_LEVEL_TRIGGERED)
++
++#define GTX_TIMER_SECURE            \
++          EFI_ACPI_6_3_GTDT_GT_BLOCK_COMMON_FLAG_SECURE_TIMER
++#define GTX_TIMER_NON_SECURE        0
++#define GTX_TIMER_SAVE_CONTEXT      \
++          EFI_ACPI_6_3_GTDT_GT_BLOCK_COMMON_FLAG_ALWAYS_ON_CAPABILITY
++#define GTX_TIMER_LOSE_CONTEXT      0
++
++#define N1SDP_GTX_COMMON_FLAGS_S      (GTX_TIMER_SAVE_CONTEXT      | \
++                                         GTX_TIMER_SECURE)
++#define N1SDP_GTX_COMMON_FLAGS_NS     (GTX_TIMER_SAVE_CONTEXT      | \
++                                         GTX_TIMER_NON_SECURE)
++
++// Watchdog
++#define SBSA_WATCHDOG_EDGE_TRIGGERED   \
++          EFI_ACPI_6_3_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_TIMER_INTERRUPT_MODE
++#define SBSA_WATCHDOG_LEVEL_TRIGGERED  0
++#define SBSA_WATCHDOG_ACTIVE_LOW       \
++          EFI_ACPI_6_3_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_TIMER_INTERRUPT_POLARITY
++#define SBSA_WATCHDOG_ACTIVE_HIGH      0
++#define SBSA_WATCHDOG_SECURE           \
++          EFI_ACPI_6_3_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_SECURE_TIMER
++#define SBSA_WATCHDOG_NON_SECURE       0
++
++#define N1SDP_SBSA_WATCHDOG_FLAGS        (SBSA_WATCHDOG_NON_SECURE       | \
++                                            SBSA_WATCHDOG_ACTIVE_HIGH    | \
++                                            SBSA_WATCHDOG_LEVEL_TRIGGERED)
++
++#endif // PLATFORM_H_
+diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
+index c9eac1e4a9..ed36828cc3 100644
+--- a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
++++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
+@@ -6,6 +6,7 @@
+ *
+ **/
+ 
++#include <Library/AcpiLib.h>
+ #include <Library/DebugLib.h>
+ #include <Library/UefiBootServicesTableLib.h>
+ #include <Protocol/RamDisk.h>
+diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
+index 0a3915734d..fce530ee3e 100644
+--- a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
++++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
+@@ -26,9 +26,13 @@
+   Platform/ARM/N1Sdp/N1SdpPlatform.dec
+ 
+ [LibraryClasses]
++  AcpiLib
+   HobLib
+   UefiDriverEntryPoint
+ 
++[Guids]
++  gN1SdpAcpiTableFileGuid
++
+ [Protocols]
+   gEfiRamDiskProtocolGuid
+ 
+diff --git a/Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h b/Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h
+new file mode 100644
+index 0000000000..4692ee4f46
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Include/N1SdpAcpiHeader.h
+@@ -0,0 +1,35 @@
++/** @file
++
++  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++
++  SPDX-License-Identifier: BSD-2-Clause-Patent
++
++**/
++
++#ifndef N1SDP_ACPI_HEADER__
++#define N1SDP_ACPI_HEADER__
++
++//
++// ACPI table information used to initialize tables.
++//
++#define EFI_ACPI_ARM_OEM_ID           'A','R','M','L','T','D'   // OEMID 6 bytes long
++#define EFI_ACPI_ARM_OEM_TABLE_ID     SIGNATURE_64('A','R','M','N','1','S','D','P') // OEM table id 8 bytes long
++#define EFI_ACPI_ARM_OEM_REVISION     0x20181101
++#define EFI_ACPI_ARM_CREATOR_ID       SIGNATURE_32('A','R','M',' ')
++#define EFI_ACPI_ARM_CREATOR_REVISION 0x00000099
++
++// A macro to initialise the common header part of EFI ACPI tables as defined by
++// EFI_ACPI_DESCRIPTION_HEADER structure.
++#define ARM_ACPI_HEADER(Signature, Type, Revision) {              \
++    Signature,                      /* UINT32  Signature */       \
++    sizeof (Type),                  /* UINT32  Length */          \
++    Revision,                       /* UINT8   Revision */        \
++    0,                              /* UINT8   Checksum */        \
++    { EFI_ACPI_ARM_OEM_ID },        /* UINT8   OemId[6] */        \
++    EFI_ACPI_ARM_OEM_TABLE_ID,      /* UINT64  OemTableId */      \
++    EFI_ACPI_ARM_OEM_REVISION,      /* UINT32  OemRevision */     \
++    EFI_ACPI_ARM_CREATOR_ID,        /* UINT32  CreatorId */       \
++    EFI_ACPI_ARM_CREATOR_REVISION   /* UINT32  CreatorRevision */ \
++  }
++
++#endif /* N1SDP_ACPI_HEADER__ */
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dec b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
+index 6b83d7c442..2a290e0ad4 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.dec
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
+@@ -20,17 +20,22 @@
+ #
+ ################################################################################
+ [Includes.common]
++  Include                        # Root include for the package
+ 
+ [LibraryClasses]
+   ArmPlatformLib|Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
+ 
+ [Guids.common]
+   gArmN1SdpTokenSpaceGuid =  { 0xd8f1624a, 0x98c1, 0x4f64, { 0xa6, 0x41, 0x19, 0x5e, 0xb5, 0x3b, 0x26, 0x0f } }
++  gN1SdpAcpiTableFileGuid =  { 0x9af67d31, 0x7de8, 0x4a71, { 0xa9, 0xa8, 0xa5, 0x97, 0xa2, 0x76, 0x59, 0xce } }
+ 
+ [PcdsFixedAtBuild]
+   gArmN1SdpTokenSpaceGuid.PcdRamDiskBase|0x88000000|UINT32|0x00000001
+   gArmN1SdpTokenSpaceGuid.PcdRamDiskSize|0x18000000|UINT32|0x00000002
+ 
++  # PCIe
++  gArmN1SdpTokenSpaceGuid.PcdPcieExpressBaseAddress|0x70000000|UINT32|0x00000007
++
+   # External memory
+   gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0|UINT64|0x00000029
+ 
+@@ -38,9 +43,7 @@
+   gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported|FALSE|BOOLEAN|0x00000003
+ 
+ [PcdsFixedAtBuild.common]
+-  #
+   # CoreSight Debug and Trace components
+-  #
+ 
+   # CoreSight ETMs
+   gArmN1SdpTokenSpaceGuid.PcdCsEtm0Base|0x402040000|UINT64|0x0000002D
+@@ -89,3 +92,8 @@
+   # unmapped reserved region results in a DECERR response.
+   #
+   gArmN1SdpTokenSpaceGuid.PcdCsComponentSize|0x1000|UINT32|0x00000049
++
++  # Remote Chip PCIe
++  gArmN1SdpTokenSpaceGuid.PcdRemotePcieIoTranslation|0x40075200000|UINT64|0x0000004A
++  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x40000000000|UINT64|0x0000004B
++  gArmN1SdpTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x40000000000|UINT64|0x0000004C
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+index 1b46eb2734..b59a563806 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+@@ -22,6 +22,8 @@
+   BUILD_NUMBER                   = 1
+ 
+ !include Platform/ARM/VExpressPkg/ArmVExpress.dsc.inc
++!include DynamicTablesPkg/DynamicTables.dsc.inc
++!include Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManager.dsc.inc
+ 
+ [LibraryClasses.common]
+   ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf
+@@ -152,6 +154,9 @@
+   gArmPlatformTokenSpaceGuid.PcdCoreCount|2
+   gArmPlatformTokenSpaceGuid.PcdClusterCount|2
+ 
++  # ACPI Table Version
++  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20
++
+   # Runtime Variable storage
+   gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvStoreReserved|0
+   gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|TRUE
+@@ -211,6 +216,10 @@
+       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
+   }
+ 
++  # ACPI Support
++  MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf
++  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf
++
+   # Platform driver
+   Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
+ 
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+index 64a812f563..444f3363e4 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+@@ -92,6 +92,15 @@ READ_LOCK_STATUS   = TRUE
+   INF MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf
+   INF MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf
+ 
++  # ACPI Support
++  INF MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf
++
++  # Configuration Manager
++  INF Platform/ARM/N1Sdp/ConfigurationManager/ConfigurationManagerDxe/ConfigurationManagerDxe.inf
++
++  # Dynamic Table fdf
++  !include DynamicTablesPkg/DynamicTables.fdf.inc
++
+   # Human Interface Support
+   INF MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf
+ 
+diff --git a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
+index aa7c6615d1..a8b9019f73 100644
+--- a/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
++++ b/Silicon/ARM/NeoverseN1Soc/NeoverseN1Soc.dec
+@@ -66,3 +66,8 @@
+   gArmNeoverseN1SocTokenSpaceGuid.PcdCcixRootPortConfigBaseSize|0x00001000|UINT32|0x00000027
+ 
+   gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0x40000000000|UINT64|0x00000029
++
++  # Remote Chip PCIe
++  gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieIoTranslation|0x40075200000|UINT64|0x0000004A
++  gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio32Translation|0x40000000000|UINT64|0x0000004B
++  gArmNeoverseN1SocTokenSpaceGuid.PcdRemotePcieMmio64Translation|0x40000000000|UINT64|0x0000004C
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable-N1SDP-platform-specific-configs.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable-N1SDP-platform-specific-configs.patch
new file mode 100644
index 0000000..3c2854d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Enable-N1SDP-platform-specific-configs.patch
@@ -0,0 +1,245 @@
+From 94709b223eeb11c56f882d94df93579d2294ce6b Mon Sep 17 00:00:00 2001
+From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 6 Apr 2021 15:20:46 +0530
+Subject: [PATCH 3/4] Platform/ARM/N1Sdp: Enable N1SDP platform specific
+ configurations
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+The patch
+  - adds GUIDs for Coresight,
+  - RAM Disk device registration and support.
+
+Change-Id: Ic6adb6400a114c1bbbba08008a8c1e187deb2e4e
+
+Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+---
+ Platform/ARM/N1Sdp/N1SdpPlatform.dec | 91 ++++++++++++++++++++++++++++
+ Platform/ARM/N1Sdp/N1SdpPlatform.dsc | 25 +++++++-
+ Platform/ARM/N1Sdp/N1SdpPlatform.fdf |  9 ++-
+ 3 files changed, 123 insertions(+), 2 deletions(-)
+ create mode 100644 Platform/ARM/N1Sdp/N1SdpPlatform.dec
+
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dec b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
+new file mode 100644
+index 0000000000..6b83d7c442
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dec
+@@ -0,0 +1,91 @@
++#
++#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++#
++#  SPDX-License-Identifier: BSD-2-Clause-Patent
++#
++
++[Defines]
++  DEC_SPECIFICATION              = 0x0001001A
++  PACKAGE_NAME                   = N1SdpPlatform
++  PACKAGE_GUID                   = 29aacb23-61e8-4fe2-8a06-793537cd26e9
++  PACKAGE_VERSION                = 0.1
++
++################################################################################
++#
++# Include Section - list of Include Paths that are provided by this package.
++#                   Comments are used for Keywords and Module Types.
++#
++# Supported Module Types:
++#  BASE SEC PEI_CORE PEIM DXE_CORE DXE_DRIVER DXE_RUNTIME_DRIVER DXE_SMM_DRIVER DXE_SAL_DRIVER UEFI_DRIVER UEFI_APPLICATION
++#
++################################################################################
++[Includes.common]
++
++[LibraryClasses]
++  ArmPlatformLib|Silicon/ARM/NeoverseN1Soc/Library/PlatformLib/PlatformLib.inf
++
++[Guids.common]
++  gArmN1SdpTokenSpaceGuid =  { 0xd8f1624a, 0x98c1, 0x4f64, { 0xa6, 0x41, 0x19, 0x5e, 0xb5, 0x3b, 0x26, 0x0f } }
++
++[PcdsFixedAtBuild]
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskBase|0x88000000|UINT32|0x00000001
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskSize|0x18000000|UINT32|0x00000002
++
++  # External memory
++  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0|UINT64|0x00000029
++
++[PcdsFeatureFlag.common]
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported|FALSE|BOOLEAN|0x00000003
++
++[PcdsFixedAtBuild.common]
++  #
++  # CoreSight Debug and Trace components
++  #
++
++  # CoreSight ETMs
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm0Base|0x402040000|UINT64|0x0000002D
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm0MaxBase|0x402040FFF|UINT64|0x0000002E
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm1Base|0x402140000|UINT64|0x0000002F
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm1MaxBase|0x402140FFF|UINT64|0x00000030
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm2Base|0x403040000|UINT64|0x00000031
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm2MaxBase|0x403040FFF|UINT64|0x00000032
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm3Base|0x403140000|UINT64|0x00000033
++  gArmN1SdpTokenSpaceGuid.PcdCsEtm3MaxBase|0x403140FFF|UINT64|0x00000034
++
++  # CoreSight TMC (ETRs/ETFs/ETBs)
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf0Base|0x400410000|UINT64|0x00000035
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf0MaxBase|0x400410FFF|UINT64|0x00000036
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf1Base|0x400420000|UINT64|0x00000037
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf1MaxBase|0x400420FFF|UINT64|0x00000038
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf2Base|0x400010000|UINT64|0x00000039
++  gArmN1SdpTokenSpaceGuid.PcdCsEtf2MaxBase|0x400010FFF|UINT64|0x0000003A
++  gArmN1SdpTokenSpaceGuid.PcdCsEtrBase|0x400120000|UINT64|0x00000043
++  gArmN1SdpTokenSpaceGuid.PcdCsEtrMaxBase|0x400120FFF|UINT64|0x00000044
++
++  # CoreSight Dynamic Funnel(s)
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0Base|0x4000B0000|UINT64|0x0000003B
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel0MaxBase|0x4000B0FFF|UINT64|0x0000003C
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1Base|0x4000A0000|UINT64|0x0000003D
++  gArmN1SdpTokenSpaceGuid.PcdCsFunnel1MaxBase|0x4000A0FFF|UINT64|0x0000003E
++
++  # CoreSight Dynamic Replicator(s)
++  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorBase|0x400110000|UINT64|0x0000003F
++  gArmN1SdpTokenSpaceGuid.PcdCsReplicatorMaxBase|0x400110FFF|UINT64|0x00000040
++
++  # CoreSight TPIU
++  gArmN1SdpTokenSpaceGuid.PcdCsTpiuBase|0x400130000|UINT64|0x00000041
++  gArmN1SdpTokenSpaceGuid.PcdCsTpiuMaxBase|0x400130FFF|UINT64|0x00000042
++
++  # CoreSight STM and STM Stimulus
++  gArmN1SdpTokenSpaceGuid.PcdCsStmBase|0x400800000|UINT64|0x00000045
++  gArmN1SdpTokenSpaceGuid.PcdCsStmMaxBase|0x400800FFF|UINT64|0x00000046
++  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusBase|0x4D000000|UINT32|0x00000047
++  gArmN1SdpTokenSpaceGuid.PcdCsStmStimulusSize|0x1000000|UINT32|0x00000048
++
++  # CoreSight Components' Size
++  #
++  # Newton TRMs specify the size for these coresight components as 64K.
++  # The actual size is just 4K though 64K is reserved. Access to the
++  # unmapped reserved region results in a DECERR response.
++  #
++  gArmN1SdpTokenSpaceGuid.PcdCsComponentSize|0x1000|UINT32|0x00000049
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+index 92376aab8f..1b46eb2734 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.dsc
+@@ -1,5 +1,5 @@
+ #
+-#  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.
++#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
+ #
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent
+ #
+@@ -32,6 +32,9 @@
+   TimerLib|ArmPkg/Library/ArmArchTimerLib/ArmArchTimerLib.inf
+   UefiUsbLib|MdePkg/Library/UefiUsbLib/UefiUsbLib.inf
+ 
++  # Ramdisk Support
++  FileExplorerLib|MdeModulePkg/Library/FileExplorerLib/FileExplorerLib.inf
++
+ [LibraryClasses.common.SEC]
+   HobLib|MdePkg/Library/PeiHobLib/PeiHobLib.inf
+   MemoryAllocationLib|MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
+@@ -70,6 +73,9 @@
+ [LibraryClasses.common.DXE_RUNTIME_DRIVER]
+   BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
+   HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
++!if $(TARGET) != RELEASE
++  DebugLib|MdePkg/Library/DxeRuntimeDebugLibSerialPort/DxeRuntimeDebugLibSerialPort.inf
++!endif
+ 
+ [LibraryClasses.common.UEFI_DRIVER, LibraryClasses.common.UEFI_APPLICATION, LibraryClasses.common.DXE_RUNTIME_DRIVER, LibraryClasses.common.DXE_DRIVER]
+   PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
+@@ -81,11 +87,16 @@
+ ################################################################################
+ 
+ [PcdsFeatureFlag.common]
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported|TRUE
+   gEfiMdeModulePkgTokenSpaceGuid.PcdTurnOffUsbLegacySupport|TRUE
+ 
+ [PcdsFixedAtBuild.common]
+   gArmTokenSpaceGuid.PcdVFPEnabled|1
+ 
++  # RAM Disk
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskBase|0x88000000
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskSize|0x18000000
++
+   # Stacks for MPCores in Normal World
+   gArmPlatformTokenSpaceGuid.PcdCPUCoresStackBase|0x80000000
+   gArmPlatformTokenSpaceGuid.PcdCPUCorePrimaryStackSize|0x40000
+@@ -98,6 +109,9 @@
+   # Secondary DDR memory
+   gArmNeoverseN1SocTokenSpaceGuid.PcdDramBlock2Base|0x8080000000
+ 
++  # External memory
++  gArmNeoverseN1SocTokenSpaceGuid.PcdExtMemorySpace|0x40000000000
++
+   # GIC Base Addresses
+   gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0x2C000000
+   gArmTokenSpaceGuid.PcdGicDistributorBase|0x30000000
+@@ -197,6 +211,9 @@
+       BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
+   }
+ 
++  # Platform driver
++  Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
++
+   # Human Interface Support
+   MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf
+ 
+@@ -235,6 +252,9 @@
+   # SATA Controller
+   MdeModulePkg/Bus/Pci/SataControllerDxe/SataControllerDxe.inf
+ 
++  # NVMe boot devices
++  MdeModulePkg/Bus/Pci/NvmExpressDxe/NvmExpressDxe.inf
++
+   # Usb Support
+   MdeModulePkg/Bus/Pci/UhciDxe/UhciDxe.inf
+   MdeModulePkg/Bus/Pci/EhciDxe/EhciDxe.inf
+@@ -243,3 +263,6 @@
+   MdeModulePkg/Bus/Usb/UsbKbDxe/UsbKbDxe.inf
+   MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf
+   MdeModulePkg/Bus/Pci/NonDiscoverablePciDeviceDxe/NonDiscoverablePciDeviceDxe.inf
++
++  # RAM Disk
++  MdeModulePkg/Universal/Disk/RamDiskDxe/RamDiskDxe.inf
+diff --git a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+index c4e1f7b4b8..64a812f563 100644
+--- a/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
++++ b/Platform/ARM/N1Sdp/N1SdpPlatform.fdf
+@@ -1,5 +1,5 @@
+ #
+-#  Copyright (c) 2018 - 2020, ARM Limited. All rights reserved.
++#  Copyright (c) 2018 - 2021, ARM Limited. All rights reserved.<BR>
+ #
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent
+ #
+@@ -109,6 +109,9 @@ READ_LOCK_STATUS   = TRUE
+   # SATA Controller
+   INF MdeModulePkg/Bus/Pci/SataControllerDxe/SataControllerDxe.inf
+ 
++  # NVMe boot devices
++  INF  MdeModulePkg/Bus/Pci/NvmExpressDxe/NvmExpressDxe.inf
++
+   # Usb Support
+   INF MdeModulePkg/Bus/Pci/UhciDxe/UhciDxe.inf
+   INF MdeModulePkg/Bus/Pci/EhciDxe/EhciDxe.inf
+@@ -137,10 +140,14 @@ READ_LOCK_STATUS   = TRUE
+ 
+   # FV FileSystem
+   INF MdeModulePkg/Universal/FvSimpleFileSystemDxe/FvSimpleFileSystemDxe.inf
++  INF MdeModulePkg/Universal/Disk/RamDiskDxe/RamDiskDxe.inf
+ 
+   # UEFI applications
+   INF  ShellPkg/Application/Shell/Shell.inf
+ 
++  # Platform driver
++  INF Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
++
+   # Bds
+   INF MdeModulePkg/Application/UiApp/UiApp.inf
+   INF MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-platform-DXE-driver.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-platform-DXE-driver.patch
new file mode 100644
index 0000000..274806a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/Introduce-platform-DXE-driver.patch
@@ -0,0 +1,122 @@
+From 5119374cdf5b86e8b6ff38329d87f0e494e2b356 Mon Sep 17 00:00:00 2001
+From: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 6 Apr 2021 15:12:27 +0530
+Subject: [PATCH 2/4] Platform/ARM/N1Sdp: Introduce platform DXE driver
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Add an initial platform DXE driver and support for ramdisk devices.
+
+Change-Id: Idf61fdc3dbde384e0414a80739078bb206784fc3
+
+Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+---
+ .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.c   | 43 +++++++++++++++++++
+ .../N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf | 43 +++++++++++++++++++
+ 2 files changed, 86 insertions(+)
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
+ create mode 100644 Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
+
+diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
+new file mode 100644
+index 0000000000..c9eac1e4a9
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.c
+@@ -0,0 +1,43 @@
++/** @file
++*
++*  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++*
++*  SPDX-License-Identifier: BSD-2-Clause-Patent
++*
++**/
++
++#include <Library/DebugLib.h>
++#include <Library/UefiBootServicesTableLib.h>
++#include <Protocol/RamDisk.h>
++
++EFI_STATUS
++EFIAPI
++ArmN1SdpEntryPoint (
++  IN EFI_HANDLE         ImageHandle,
++  IN EFI_SYSTEM_TABLE   *SystemTable
++  )
++{
++  EFI_STATUS                 Status;
++  EFI_RAM_DISK_PROTOCOL      *RamDisk;
++  EFI_DEVICE_PATH_PROTOCOL   *DevicePath;
++
++  Status = EFI_UNSUPPORTED;
++  if (FeaturePcdGet (PcdRamDiskSupported)) {
++    Status = gBS->LocateProtocol (&gEfiRamDiskProtocolGuid, NULL, (VOID**) &RamDisk);
++    if (EFI_ERROR (Status)) {
++      DEBUG ((DEBUG_ERROR, "%a: Couldn't find the RAM Disk protocol - %r\n", __FUNCTION__, Status));
++      return Status;
++    }
++
++    Status = RamDisk->Register (
++               (UINTN)PcdGet32(PcdRamDiskBase),
++               (UINTN)PcdGet32(PcdRamDiskSize),
++               &gEfiVirtualCdGuid,
++               NULL,
++               &DevicePath);
++    if (EFI_ERROR (Status)) {
++      DEBUG ((DEBUG_ERROR, "%a: Failed to register RAM Disk - %r\n", __FUNCTION__, Status));
++    }
++  }
++  return Status;
++}
+diff --git a/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
+new file mode 100644
+index 0000000000..0a3915734d
+--- /dev/null
++++ b/Platform/ARM/N1Sdp/Drivers/PlatformDxe/PlatformDxe.inf
+@@ -0,0 +1,43 @@
++## @file
++#
++#  Copyright (c) 2021, ARM Limited. All rights reserved.<BR>
++#
++#  SPDX-License-Identifier: BSD-2-Clause-Patent
++#
++##
++
++[Defines]
++  INF_VERSION                    = 0x0001001B
++  BASE_NAME                      = PlatformDxe
++  FILE_GUID                      = 11fc8b5a-377d-47a8-aee9-0093d3d3407f
++  MODULE_TYPE                    = DXE_DRIVER
++  VERSION_STRING                 = 1.0
++  ENTRY_POINT                    = ArmN1SdpEntryPoint
++
++[Sources.common]
++  PlatformDxe.c
++
++[Packages]
++  ArmPkg/ArmPkg.dec
++  ArmPlatformPkg/ArmPlatformPkg.dec
++  EmbeddedPkg/EmbeddedPkg.dec
++  MdePkg/MdePkg.dec
++  MdeModulePkg/MdeModulePkg.dec
++  Platform/ARM/N1Sdp/N1SdpPlatform.dec
++
++[LibraryClasses]
++  HobLib
++  UefiDriverEntryPoint
++
++[Protocols]
++  gEfiRamDiskProtocolGuid
++
++[FeaturePcd]
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskSupported
++
++[FixedPcd]
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskBase
++  gArmN1SdpTokenSpaceGuid.PcdRamDiskSize
++
++[Depex]
++  gEfiRamDiskProtocolGuid
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch b/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch
deleted file mode 100644
index 86fcd15..0000000
--- a/meta-arm-bsp/recipes-bsp/uefi/files/n1sdp/initialise.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-These variables can be returned without being set, so assign reasonable
-fallback values for the error paths.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ef296251231a9a646051efbed0d81131f0876e25 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 21 Oct 2020 17:29:17 +0100
-Subject: [PATCH] Add missing Status assignments
-
----
- Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c          | 2 +-
- Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c b/Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c
-index b605d9adbd..6b11a8545d 100644
---- a/edk2-platforms/Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c
-+++ b/edk2-platforms/Platform/ARM/Drivers/CcixDxe/CcixEnumeration.c
-@@ -684 +684 @@ CcixAgentInit(
--  EFI_STATUS Status;
-+  EFI_STATUS Status = EFI_ABORTED;
-diff --git a/Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c b/Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c
-index c828165d07..e1f7f5e8ea 100644
---- a/edk2-platforms/Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c
-+++ b/edk2-platforms/Platform/ARM/N1SdpPkg/Drivers/PlatformDxe/PlatformDxe.c
-@@ -26 +26 @@ ArmN1SdpPkgEntryPoint (
--  EFI_STATUS                 Status;
-+  EFI_STATUS                 Status = EFI_UNSUPPORTED;
--- 
-2.25.1
-- 
2.17.1

