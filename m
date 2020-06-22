Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.42])
 by mx.groups.io with SMTP id smtpd.web10.12148.1592810100155356555
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 00:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KUIOmxaF;
 spf=pass (domain: arm.com, ip: 40.107.2.42, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLRWegaVUVtxbI9DIx1pMLGKB2ePmD9+Z95XZi8Wb6M=;
 b=KUIOmxaFIyZeKKeGKQSlpbS6OUmoMDadRQH6FWawpmfBVpoo93UZuRyJEVAGxbPFYQdlqzbYianJpZw10ukuACvYW9QgThNTvO92GdQXpjnMpk/jiir2KUvUJ7Gi0OD4fMDqm5dxjnUA3b2NUGYrTukSBtNz7U30xnGGTldO4y0=
Received: from DB6PR0301CA0088.eurprd03.prod.outlook.com (2603:10a6:6:30::35)
 by VI1PR08MB3935.eurprd08.prod.outlook.com (2603:10a6:803:e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 07:14:57 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::e7) by DB6PR0301CA0088.outlook.office365.com
 (2603:10a6:6:30::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 07:14:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:14:57 +0000
Received: ("Tessian outbound 022d32fb9a40:v59"); Mon, 22 Jun 2020 07:14:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88ac5d99e4d7dedd
X-CR-MTA-TID: 64aa7808
Received: from cb928f8dbf53.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FDE79119-F727-46FF-9C8F-216FD73F01A6.1;
	Mon, 22 Jun 2020 07:14:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb928f8dbf53.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 07:14:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ59rGZZsaMQkfAgXM8LfPMWV4uyKSgi+tsGIdPSidN6bRwVVfJOu+kpxYrJOfn3bGkNqdnPf7dnNRtPKOejUMEaQ8iMCc0f4AcIiX3QvAe7qo4kqmRBYUjoG4QtvrGecSJw/crMoxj4iXz9+cTGKBy0hQ8dK/UJEZEC970dstAk/5ZVEp4dblyhHizMBgXyUyp8YNVrnnQcBMEVoITGirDYgdDG9vQ9ve1G3Y45naRtq/0lEACJSf439gzfHhzliTyjv/BPpO2+Yrul51lcNMHnC9J/9CrbppLSlEbX17O7OQXNkb3sql+XUiWI89RakQytBm71SHHwVcRg+tsuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLRWegaVUVtxbI9DIx1pMLGKB2ePmD9+Z95XZi8Wb6M=;
 b=TO3MSucLbOts6gLQyzEBacLdCF68kjNsZZplNUUPcwQ1ZKYGRrG1Oeu8Vh4rlspyFeOf87ie9fCyU2Zjn0FTiBe/nPWRPGBhZurrf9n/QE7Kt55xMy1stLoTGwJ4bsqVljVsstyb3bK+gdeg/heEi4ozIipQG6SVyt1w+R1M4t1DSyeVeMaRZnmIeUf0vVyytbn2pUqtvGsUisa0acuWUHjNnWr1WLN7PcPg+EK/0HWyQ2OYvl3Mx9oiT0WUbwlDycmPGUFWk4bD6ViwSpsQ187oSKqoz/2gBJoyMZvfaWC5jblWn2mbVgZ3sHoHGZphKeGs6eYRuwRre1XRGiiNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLRWegaVUVtxbI9DIx1pMLGKB2ePmD9+Z95XZi8Wb6M=;
 b=KUIOmxaFIyZeKKeGKQSlpbS6OUmoMDadRQH6FWawpmfBVpoo93UZuRyJEVAGxbPFYQdlqzbYianJpZw10ukuACvYW9QgThNTvO92GdQXpjnMpk/jiir2KUvUJ7Gi0OD4fMDqm5dxjnUA3b2NUGYrTukSBtNz7U30xnGGTldO4y0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2288.eurprd08.prod.outlook.com
 (2603:10a6:800:a6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Mon, 22 Jun
 2020 07:14:49 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Mon, 22 Jun
 2020 07:14:49 +0000
From: gabor.abonyi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH 0/6] arm, arm-bsp, arm-toolchain: Add Trusted-Firmware-M recipe
Date: Mon, 22 Jun 2020 09:13:55 +0200
Message-Id: <20200622071401.2570-1-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (217.140.99.251) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:14:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4b85b99-7256-499a-fd7e-08d8167bf803
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:|VI1PR08MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB39357A85906E75A41E4384E48E970@VI1PR08MB3935.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wFdZn/A+Pa1TdI32y3j254vTBJCy4ayZ6FJEU8+FkYHZWkNaPIXnkeC3rMzTOmtE2X+9QIc1oBjuttkioYuMft4u3bNeZemNiqVDqUrw+AY6UY+G9q2HPkbv1X2eyghx4E473q7ZeJkfrTQB9wH+dmf3bS8C1N524aUL17vcJ/OYQAuYhOjHoISE69U3Etpz9bdLMwpSfTanKj4JVb8/FWu2jeXOwuEcSp4cbCl5U2sTXYnnSyH8T9mTtA/NhGx2LVphBeSKhe+Fkut7ghLCKgly0YmDrV2yhLbC8FDx8Zkzp8qujM1Ur0vjIPAAzxv28FLXv8Y8ML3MhliRQBPcuw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(7696005)(2616005)(66946007)(66556008)(26005)(6916009)(66476007)(6666004)(956004)(6486002)(86362001)(2906002)(186003)(16526019)(44832011)(478600001)(36756003)(8936002)(316002)(52116002)(5660300002)(83380400001)(1076003)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 nFE8xSXsQOMyADOgWxzxPov3D3Jo2Om8E6HUpJb5rJHapcmJk4/ReaXBFSCkrTnXrMNQPrlGL+Adsms2bTyuL1lp6XyS1PCY5uqAyuajRrgIa2viaCw7VFaIOqy6t+moF/BDfEIO3czONbmNphuVgmspS2sG9ZdNzGIh8T+u+MxL9XFIxBYXPDx4kaX4dNy7u4Z+5Z+JLp+qnP15v8nV7gXv4n5dj65WrKXyWQyOwx8Wbch/hAeQWki6RREVsD7hjpMEjd9TI9vRC5gAnzz9gI2Th5gYxXi+XaMXlo8xXfFxH8mOZJnkDzxOAa4I1S/DdYSzXq9KOLRTLAXqqAJ0JB1Vc+2zyTPS77HwD2dOXK1TQ9BD9MJHbQ129GWp3V/nEkU37ExlEWAW+vqEIkbNIdf1vSsqGPx2VnxgeBxHEOaexRxoeDseYB0r3CZVyTnMra+NIeEfXW8AOew++Rebcll85ywYuSpVwloVhzThP6k1LgCMKtct4BUktQuEclYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(46966005)(6666004)(478600001)(26005)(6916009)(6486002)(2906002)(5660300002)(186003)(16526019)(316002)(8936002)(336012)(70206006)(2616005)(956004)(1076003)(70586007)(8676002)(4326008)(44832011)(7696005)(83380400001)(81166007)(86362001)(82740400003)(47076004)(36756003)(82310400002)(356005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ca0dcbf7-f058-405b-1106-08d8167bf343
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cRZtbfpnHLYtkpYQYf4Q5wkQG+6mStvwkBl1vHQAG9OqX1nAiKbN2wEZfUFCRwwZN3nXet86hvWZAkbKrNWudC9bhJmCqCeORa2agIMRKWhSMwIIfJ04+PmAE+pXjcW2WO34dWB8IoiPYsqhu4z09sJ6qJEUinICzvonQvsF6j+/Qn3hM2gSUq922blVADaXYP/tO0lNSCDYQoYfFN8xOZHS0o0gtIMirpQ3yG8m1ZRD4+IYEPeW8CNfSOhkimg3pxfGMKF3nfZJorUXPwE+2gyD3YMkckYqm39aB51kQnyR9iwWZyYjKzbEcnrf8WaPi1t2W5KV0JpsGe87Nsc3pYE1dW2Aja9Nrgomw/4nLpskWfuDmT8hCD6oNWSDldCF8AlyDqJyRye6SkCj5xcIIA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:14:57.0644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b85b99-7256-499a-fd7e-08d8167bf803
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3935
Content-Type: text/plain

These patches create Trusted-Firmware-M base recipe.
It requires Arm Clang external compiler toolchain and
python3-cbor (until upstreamed to either oe-core or meta-python).
It also add support for 2 machines, musca_b1 and musca_s1 as
compatible machines.

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
 .../classes/armcompiler-host-license.bbclass  |    7 +
 meta-arm-toolchain/conf/layer.conf            |    3 +
 .../Armcompiler-License-agreement             |  165 +
 .../Armcompiler-Redistributables              |   36 +
 .../Armcompiler-Supplementary-terms           |   10 +
 .../Armcompiler-Third-party-licenses          | 3947 +++++++++++++++++
 .../armcompiler_6.13.bb                       |   41 +
 ...inc => external-arm-toolchain-x86host.inc} |    0
 .../gcc-aarch64-none-elf_9.2-2019.12.bb       |    2 +-
 .../gcc-arm-none-eabi_9-2019-q4-major.bb      |    2 +-
 .../trusted-firmware-m/trusted-firmware-m.inc |  118 +
 .../trusted-firmware-m_1.0.bb                 |   25 +
 .../python/python3-cbor_1.0.0.bb              |   14 +
 17 files changed, 4404 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/conf/machine/armv8m.inc
 create mode 100644 meta-arm-bsp/conf/machine/musca_b1.conf
 create mode 100644 meta-arm-bsp/conf/machine/musca_s1.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
 create mode 100644 meta-arm-toolchain/classes/armcompiler-host-license.bbclass
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-License-agreement
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-Redistributables
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-Supplementary-terms
 create mode 100644 meta-arm-toolchain/custom-licenses/Armcompiler-Third-party-licenses
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/armcompiler_6.13.bb
 rename meta-arm-toolchain/recipes-devtools/external-arm-toolchain/{gcc-x86host.inc => external-arm-toolchain-x86host.inc} (100%)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
 create mode 100644 meta-arm/recipes-devtools/python/python3-cbor_1.0.0.bb

-- 
2.17.1

