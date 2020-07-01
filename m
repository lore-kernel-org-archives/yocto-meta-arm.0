Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.64])
 by mx.groups.io with SMTP id smtpd.web12.21245.1593609609631159765
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lANvEtlP;
 spf=pass (domain: arm.com, ip: 40.107.0.64, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmCC4r6deOQEVgSW7UQGb4xJ18yLgA5iuRka7jMdYfY=;
 b=lANvEtlPA7KK27oHQSp9ns3P1Ra9qB652urqviggOQFfm9+d7yltLsRHe/VF5GL5zGIxVfRu00nhNdy4mqyoMQ7vo2ou7D4m2aKQ6xbLHIil72uJkw3fJLBBADBLL9lCVOpBpHjXIw6zX44k7ThQhu8DIhaSC8hX9dzYrcyQGk4=
Received: from AM6P192CA0092.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::33)
 by AM6PR08MB3862.eurprd08.prod.outlook.com (2603:10a6:20b:8c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Wed, 1 Jul
 2020 13:20:07 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::c9) by AM6P192CA0092.outlook.office365.com
 (2603:10a6:209:8d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Wed, 1 Jul 2020 13:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 13:20:07 +0000
Received: ("Tessian outbound 114f46c34313:v62"); Wed, 01 Jul 2020 13:20:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb821e4ff7c2a877
X-CR-MTA-TID: 64aa7808
Received: from 09ba26b85edd.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B6A4AA31-E371-4955-B2D9-F8536181B21F.1;
	Wed, 01 Jul 2020 13:20:01 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09ba26b85edd.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wu0yrb6qiIhTK+RDp9jYiFZ9p5rUZYRsjaYbJXbD+6ruEaO9pbCRJvPKffTZHZ5b5E9p4iPpXVEZ1FSPHbEcQDDAQxUxARhVws2Qv5DllBfeWnAn+RRQtm+eI3kVqjMQOa0Tj9r/4KnAjn0BwCAhQE+qjCwM6Y9PLMBPzLHTy3+3zWTCWCFn9OaQ1P30ysboZwrjBvcyuN5PYVDQJp37MbxaSz3B0KaZasuNK0A7xRtE05L/jKgIuwXTbxIzNYyvESiIZi73y+9lXsfA8AUdBSkEEZsgvcIZYAeBPSAPmwFdmKpcXIDOrm/Neg/1QaSkhjsIGbp9OHmJ0VsVr95w5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmCC4r6deOQEVgSW7UQGb4xJ18yLgA5iuRka7jMdYfY=;
 b=ZoMByUJCe96w/TsXfkBvX5Leqy+9H9L+hjCEBqqUcBY/wccwV86+s3xfTNP+XsnLxemU1w65Za/O6+kC8OaPHHOqn5pqnpA63OMakbcgZx7AVLYhu66wRDqnxJAK4SjhuWZVX7AwBn5yE+iBLyUyxb05BY/HH0lTWaSJhGc3QK1XPG199+xUUFtC3plPQhkN9E1y9WUTSdcv3B054FvaSduEMf9fk4DR/RoDJiyUSmcU796LtMDCw6FwWbcib+gzBfDjqmQJ4DE8I1naLfj9/+D7bPqiZyJQWvP3Fqz4ThzH4G+y7oYgE2milnuuQVyat0M7YzWI3oB8WtWZSCgj/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmCC4r6deOQEVgSW7UQGb4xJ18yLgA5iuRka7jMdYfY=;
 b=lANvEtlPA7KK27oHQSp9ns3P1Ra9qB652urqviggOQFfm9+d7yltLsRHe/VF5GL5zGIxVfRu00nhNdy4mqyoMQ7vo2ou7D4m2aKQ6xbLHIil72uJkw3fJLBBADBLL9lCVOpBpHjXIw6zX44k7ThQhu8DIhaSC8hX9dzYrcyQGk4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR08MB3838.eurprd08.prod.outlook.com
 (2603:10a6:803:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 13:20:00 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74%6]) with mapi id 15.20.3153.022; Wed, 1 Jul 2020
 13:20:00 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH v2 1/6] arm-toolchain: external-arm-toolchain: Rename
Date: Wed,  1 Jul 2020 15:19:35 +0200
Message-Id: <20200701131940.3084-2-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701131940.3084-1-gabor.abonyi@arm.com>
References: <20200701131940.3084-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (178.48.104.185) by LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 13:19:59 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [178.48.104.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6f340c98-9a37-48ff-ea0f-08d81dc1791a
X-MS-TrafficTypeDiagnostic: VI1PR08MB3838:|AM6PR08MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3862060B1F9C6249CF8CD3A18E6C0@AM6PR08MB3862.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 f/JTbbqGpXYk3LVxL+xFiY1hv+LA91j1NIVwE0RpRdDTi9FUHRu5RoSMjyxX7MEGzCzfyZHI65FopdR2ZiLlmElnzt70pmIKsRSZ43mQWxhoszMaUo69kbkbt8lmzvzz7BdNh/JwlykUOb2LYKYryi5Jt3a2yb0EtIlQWrXDbkos9mrJLRaMgt1QcALQ6jKlRTGhNJZ2rwMxmvXqvN+xkToTJeXvIBEeUHpluO1bZKWFEk0x3lrN+NLEDJog3Xr2GQfkG2TnoDpF/2EOa2Zhw65UmQqnOWy4vBfXReyP4k21Np5jteNZ/7f8xScoUAwXXeN+n2PXjfh8Dw+Ks4Lkpw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(956004)(66476007)(8676002)(66946007)(2616005)(478600001)(2906002)(186003)(6486002)(4326008)(8936002)(16526019)(6666004)(1076003)(26005)(6916009)(36756003)(44832011)(83380400001)(316002)(86362001)(66556008)(52116002)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Lf/irqznO62vidCfBizk8D50sRWpA/n1Q8cksdP7OuhywTzJarn9m0i+D05IMEcjEO7ShbyqyqvWTq7EnI3i33+blqTp4MP6tU17hvjCbKab/VrBnPTL/S0lWeZnNp1eNam1P3Ft1j3haH1EmP6nlH89HTr2Wu0VWAihDewGK/g5w4yCtZC4DsPvSKy+31by4pRQLJXt/jvuYvH27wo+NR5Ab7GiOUpmgLYHPqts8LnrIZ47LudcDG4zmQewB0O2eIwP26OaciUwLtCnayfHyHn/QXdN1lj0+rjDDAr7D7vXGX+BIbKnkHIrRwbp3u0VYTvSDFfEj/rdzbU+P6XBldheLJjgGIaGwo0C4axSML6PUTW6x+Wbl2OcdNR8r6poDfNSsTFu2N8Bs+Wn9y/v8kqSfJA+QbvpH7Kvh99g2KtC73LP7soRgXShGtUkEJDUyNFpmahJ6DtYdMWduHJuSOf+Af8v5ZROT7TQ9NEhJ89bFIysi0uKP2Tn+n4vaZJv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(186003)(83380400001)(16526019)(2906002)(4326008)(6916009)(26005)(7696005)(1076003)(44832011)(70206006)(70586007)(5660300002)(2616005)(336012)(6666004)(6486002)(956004)(8676002)(8936002)(47076004)(86362001)(82740400003)(36756003)(82310400002)(81166007)(316002)(36906005)(478600001)(356005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bfce38c9-df38-4036-ba9b-08d81dc174d0
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v2ZsLgaXDUs71xEQ9TormVyevQzl0+LOpcTdYJtVzkXKxdsALbKsm6iM/iiTZaFO3ui7Gwtdubsnj42Oyw/b/oE8u7D6ev04OnbvqmL/SSDQDHfT8IKOJXem9c/WAV6v9OpIezugmGRYKigXYvoYRkBx9+zDCVlpXZHtPtioyEGYjR1oj4658mcKspoR5qp867IKiw5UQ1GPpQ9gZa7sYY+jh2KNTz0Cltsft7OosLQrTgUUtU8nnA8oe7Jx8QPeJs4sayuNVLh7s/Oqk7WDnecrn413GUE+dp3xdFuEyfhFtn8ROlxS9BURwGySqPVZLQRNdztVDvo5s66PbvShs+2IVQa1c/NutKtYqR51kihwf4RtoQ6ob2uRwQehARNXUS6oN7vdUzdBBcP0gWXO4A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:20:07.0021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f340c98-9a37-48ff-ea0f-08d81dc1791a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3862
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Rename common external-arm-toolchain file, so it can be used by non-gcc
external toolchains too.

Change-Id: I48345dc53bc3d20f33b44fc0224b511f30107036
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 .../{gcc-x86host.inc =3D> external-arm-toolchain-x86host.inc}     | 0
 .../external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb  | 2 +-
 .../external-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-x86=
host.inc =3D> external-arm-toolchain-x86host.inc} (100%)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc=
-x86host.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/e=
xternal-arm-toolchain-x86host.inc
similarity index 100%
rename from meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-=
x86host.inc
rename to meta-arm-toolchain/recipes-devtools/external-arm-toolchain/extern=
al-arm-toolchain-x86host.inc
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc=
-aarch64-none-elf_9.2-2019.12.bb b/meta-arm-toolchain/recipes-devtools/exte=
rnal-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
index 91daf08..a45fee0 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch6=
4-none-elf_9.2-2019.12.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch6=
4-none-elf_9.2-2019.12.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2020 Texas Instruments Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-require gcc-x86host.inc
+require external-arm-toolchain-x86host.inc
=20
 SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc=
-arm-none-eabi_9-2019-q4-major.bb b/meta-arm-toolchain/recipes-devtools/ext=
ernal-arm-toolchain/gcc-arm-none-eabi_9-2019-q4-major.bb
index a36f0aa..6403fe1 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-no=
ne-eabi_9-2019-q4-major.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-no=
ne-eabi_9-2019-q4-major.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2019 Garmin Ltd. or its subsidiaries
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
-require gcc-x86host.inc
+require external-arm-toolchain-x86host.inc
=20
 SUMMARY =3D "Baremetal GCC for ARM-R and ARM-M processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"
--=20
2.17.1

