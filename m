Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.56])
 by mx.groups.io with SMTP id smtpd.web10.21525.1593609606348094072
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 06:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FuQiu4zD;
 spf=pass (domain: arm.com, ip: 40.107.21.56, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlGef10KBmbkAgAA6ZOcFLH1OferenAjgVDRbCFdVH4=;
 b=FuQiu4zDRXZ2EZaKuHKKF5cTmSZi+VXbNAb5HNJt7ONPv98WDHa9f2+cj0HXOZQOIf/RW91aJqpBAhRj1ICZHmVgFEKkukKoZ0al6P17uCTHwtcsP2Y4akAoi4xEuakM97seiKkrIV/5QFf4Wo5hX+DFhtoT5Kdsu8PY/SdO0cQ=
Received: from AM6P192CA0104.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::45)
 by VI1PR0802MB2509.eurprd08.prod.outlook.com (2603:10a6:800:b7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 1 Jul
 2020 13:20:03 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::a7) by AM6P192CA0104.outlook.office365.com
 (2603:10a6:209:8d::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend
 Transport; Wed, 1 Jul 2020 13:20:03 +0000
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
 15.20.3131.20 via Frontend Transport; Wed, 1 Jul 2020 13:20:03 +0000
Received: ("Tessian outbound 8239f48e56bd:v62"); Wed, 01 Jul 2020 13:20:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 724bd07bc3faf3fc
X-CR-MTA-TID: 64aa7808
Received: from a21e4e5f4956.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FDA7D37F-33D9-433F-BC40-8A6CE40452C4.1;
	Wed, 01 Jul 2020 13:19:57 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a21e4e5f4956.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 01 Jul 2020 13:19:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ensTOyPxBpjzkK696jo/zzXjS7WIj/gJdX1ojR1x4bHUaN8cGoSA0npU3pGtvK/omEDDLRO0PQF5Yw/6YOdZsGmgbgAcEZysmyThOjeRgedImZoEz/MfMLoRa9iIZrOHSxv6gm/xpnu8E5P4Rp1Jb/MLksgsi5WtRjDcQ4gL/65J0BQrPLGhNVypaEqL3fVVdaHbdYw49Hl+1vYiMar4H8eSpgknY60Tpp3K0UfiBlcMAUyvPOUYu8N7RY7skPU6TqcI0/t35Dra+tU3QRCwtboKKblVHVdzeo2XE79BELa29HL31hqljBzT52C7iLedr10Rcjv+3efGlFaQJbsuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlGef10KBmbkAgAA6ZOcFLH1OferenAjgVDRbCFdVH4=;
 b=k1UuRjO2v8CEEOVZqCgXlHLpLsGAE6G45hN8wg3D6hkzQKCY4bZOekYOdOxLhehwp4fpvYgjX+wlJO2HxVOo8uIzYI3xTZN0dFzau9mTySTlET91rKhd8HVXnEwAB6q42IqRQv7uAk2WBgtA2UnlGqCtq91ibEo1W+gq9isHYKySu1azQz7ZvnN6bVsrlhDLQVHBdJb+kSC8RAALIQUV8KCn75Dj4SVf1p/L6z5PIKrGsroghI/EN8ZXg8TMYYfyDVBNnBuartldsvdMqrr6ae8FyX5C8dB0D4bKdif9HJRCNWqcu0TSFkgkkv9nJktz7mpO1Xk6BcnJAQsYT40pqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlGef10KBmbkAgAA6ZOcFLH1OferenAjgVDRbCFdVH4=;
 b=FuQiu4zDRXZ2EZaKuHKKF5cTmSZi+VXbNAb5HNJt7ONPv98WDHa9f2+cj0HXOZQOIf/RW91aJqpBAhRj1ICZHmVgFEKkukKoZ0al6P17uCTHwtcsP2Y4akAoi4xEuakM97seiKkrIV/5QFf4Wo5hX+DFhtoT5Kdsu8PY/SdO0cQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR08MB3838.eurprd08.prod.outlook.com
 (2603:10a6:803:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Wed, 1 Jul
 2020 13:19:56 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::4d1f:13c7:837c:2b74%6]) with mapi id 15.20.3153.022; Wed, 1 Jul 2020
 13:19:56 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH v2 0/6] arm, arm-bsp, arm-toolchain: Add Trusted-Firmware-M recipe
Date: Wed,  1 Jul 2020 15:19:34 +0200
Message-Id: <20200701131940.3084-1-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::31) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (178.48.104.185) by LO2P265CA0019.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend Transport; Wed, 1 Jul 2020 13:19:55 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [178.48.104.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7ea6c59a-0576-4ade-b4d9-08d81dc176f8
X-MS-TrafficTypeDiagnostic: VI1PR08MB3838:|VI1PR0802MB2509:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2509D9FFEAB60C0F428481E58E6C0@VI1PR0802MB2509.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;OLM:2000;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Di1X+g2UVclWKscNKTlLJ5y06yub9dTQXb+ob4RqhQQghiIO1GnUAKq2bJkUN93wH8KVoYDyHP3ClbmS9sny9zWQO5jwSRhRYkvomy6UIBy3uKGoXGIsmmSB7hy6f1k4hAcbLP3YwkCtkdvn80ga490M7B/s+gLfOOjDRXLTfBUBVGcSxofizs9d2ocCJWmNw0FUSlkmkylnblaHAcj4KXuwdGC+vi19X9PxwmK4W5IQp8jdJ2xRkuQVYh/T3/bV4mxHBfVGGTkuqXZAn/NKR4LBIBRE09aHCxHdizyPCmKR2/pznF7wlmjHT4M7rDzmfiGWKeOIJApPlXvEhwan6w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(956004)(66476007)(8676002)(66946007)(2616005)(478600001)(2906002)(186003)(6486002)(4326008)(8936002)(16526019)(6666004)(1076003)(26005)(6916009)(36756003)(44832011)(83380400001)(316002)(86362001)(66556008)(52116002)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UZYnVNk14SAi44RakzYulRWkA3SkqArMdz9YE4oF+y+Zwn99/lnoxE3jmr2ta9lBUNiRqjpg4Xe1FZjGQNGtpwgwkPpO89AZCvyR+CJkSR+IRKfVVS6gStHGSyu5XrsYia0VCRHNy5X9tkULaUqUrGPVprJadzvxabaRDQNigrtUirDZ6erS6oX2A/Ybfm2m7B194+aGUlwKBojJ5rKg3EUPdgUoqqTBV1qM6X+uB6aqTbYJltdcVQBhZtfmgT7KKVZflr+UmL++R+6Pl6cBlZaGNG7WRwQDaaR+vtG/VwvaXaslkxn5rSSQtQWpXvAdhOQ0pTCpDM0BQcOLKFD71ydxQB9d1NVurFXgBYvSCnCKkztfe9aQRVsDkQzOX8i0Fn9CYGzTHKoksMewjj0eYvAN4Nl/+E2otQiYlz1HGVPqHXMaN2lfU08TxVquTeqfBwxqFKfdhPKkPxy9kXdSLptvi8uQIBgLWOW1UiWzUXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3838
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(16526019)(6486002)(36906005)(47076004)(83380400001)(2906002)(86362001)(70206006)(1076003)(70586007)(6666004)(8936002)(956004)(336012)(2616005)(7696005)(5660300002)(44832011)(36756003)(8676002)(478600001)(356005)(186003)(82310400002)(316002)(82740400003)(81166007)(6916009)(26005)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0ba369e5-3ea2-408f-9ce1-08d81dc17259
X-Forefront-PRVS: 04519BA941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5JiCptQnrzeM0VsJ0e+wloJOVUj60eQbCXsDX6+YeoISQC+YElO7wYX9cmnrs3ZW1fmDqa8KD0tStB5vUv/kCZUNQA2vvu2wOHh/1MXOqSbJTr5KzAW06+bn1xldX15MYZPY6pY8ftYC2vMVsAsp+SmwuOfH9kOhUj+hVh+Q8epSC7NoAfoh0hJeiGytYiIpakzM8hVrRkeNHJ8vs6cEjRoUT61CO36U7ijH5sX+sl1k/2LeEywONu4+FJ+n+VDd+kgANoLoEuglyyIyWk8OhBlJQECrB5a5puGhPxT3XPuQEiZ2hH3be5R+sJruv6YApC/K+U3YyuN/h0I/7yEiDda3eJW0JkpDlUfZKzfVqmEQsv2U3YaVhxcPBY58cb+GKFocf1GMcyVX6P5/UmpK9A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:20:03.3781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea6c59a-0576-4ade-b4d9-08d81dc176f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2509
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Based on comments, updated patch 2/6 and 4/6.

Gabor Abonyi (6):
  arm-toolchain: external-arm-toolchain: Rename
  arm-toolchain: armcompiler: Add Arm Clang recipe
  arm: python3-cbor: Add recipe
  arm: trusted-firmware-m: Add recipe
  arm-bsp: musca_b1: Add machine
  arm-bsp: musca_s1: Add machine

 meta-arm-bsp/conf/machine/armv8m.inc          |   10 +
 meta-arm-bsp/conf/machine/musca_b1.conf       |   11 +
 meta-arm-bsp/conf/machine/musca_s1.conf       |   11 +
 .../trusted-firmware-m_%.bbappend             |    4 +
 meta-arm-toolchain/conf/layer.conf            |    6 +
 .../Armcompiler-License-agreement             |  165 +
 .../Armcompiler-Redistributables              |   36 +
 .../Armcompiler-Supplementary-terms           |   10 +
 .../Armcompiler-Third-party-licenses          | 3947 +++++++++++++++++
 .../armcompiler_6.13.bb                       |   46 +
 ...inc =3D> external-arm-toolchain-x86host.inc} |    0
 .../gcc-aarch64-none-elf_9.2-2019.12.bb       |    2 +-
 .../gcc-arm-none-eabi_9-2019-q4-major.bb      |    2 +-
 meta-arm/conf/layer.conf                      |    1 +
 .../trusted-firmware-m_1.0.bb                 |  137 +
 .../python/python3-cbor_1.0.0.bb              |   14 +
 16 files changed, 4400 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/conf/machine/armv8m.inc
 create mode 100644 meta-arm-bsp/conf/machine/musca_b1.conf
 create mode 100644 meta-arm-bsp/conf/machine/musca_s1.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-fir=
mware-m_%.bbappend
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-License-=
agreement
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-Redistri=
butables
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-Suppleme=
ntary-terms
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-Third-pa=
rty-licenses
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolch=
ain/armcompiler_6.13.bb
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-x86=
host.inc =3D> external-arm-toolchain-x86host.inc} (100%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmwar=
e-m_1.0.bb
 create mode 100644 meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb

--=20
2.17.1

