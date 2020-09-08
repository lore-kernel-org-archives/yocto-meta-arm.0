Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.83])
 by mx.groups.io with SMTP id smtpd.web10.11982.1599532661287458918
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bDm0aLYc;
 spf=pass (domain: arm.com, ip: 40.107.20.83, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/Aan/pDOgDeVkIHiG/iOiuewZgagQWXZMe0VGlHU4Y=;
 b=bDm0aLYcD7cNKSWsw9X5opydTxP8PiF28crUAXdRcDOABECiFwzufeQbSG/XEEpAOP0da9O9bIRNY4BntMERaOFZfsbyHsRGIeGfq9T1xyXKX0tc/hAhH4EbX7IZ5/1br02s1QVvFz35s4iklunWOt36B1Lsfdvt+92bgDrF2Ss=
Received: from AM6PR10CA0099.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::40)
 by DB7PR08MB3337.eurprd08.prod.outlook.com (2603:10a6:5:26::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 02:37:37 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::f2) by AM6PR10CA0099.outlook.office365.com
 (2603:10a6:209:8c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Tue, 8 Sep 2020 02:37:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 02:37:37 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Tue, 08 Sep 2020 02:37:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b926edb5e5386ad4
X-CR-MTA-TID: 64aa7808
Received: from c9a9f08894f1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 44D4C910-F804-4C88-8DD4-E4E2E9FFF8DE.1;
	Tue, 08 Sep 2020 02:37:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9a9f08894f1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 02:37:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gi3lTmfS1SGqxE1JXY1ENLgahg1yJqIHNXTgKzFSbh8XxZFE38GHWT1HA3VTPZmfpadZWwSPhMqEo1IW3mxK9N5JFuHIsKJn2vfw+1XIlsSAr/OipP8NgT/tyzIrKkNKG1n2ijQh4hnNTINV4YCF4q7rtBjtu8Ad1k+v+7kPGSHXO5qVHC4NanwC7ShOdhWh9holtDDVz2v9pbFog4hF+jj5PA4eLwLpYZ+PlNH8E1ysKpUj9UfTzj8Mp9WygZgB9SKF8ABVgQVVdiyXdewLGPNZfCdLoGO1K+6BR9pHGKhhBV7hh17kdkmwXIECGPLNEporWUwe2YALFRHEy6al4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/Aan/pDOgDeVkIHiG/iOiuewZgagQWXZMe0VGlHU4Y=;
 b=Ldrt2zoPIYCTjFD+1fs5UgGXQhs0xS6xAUer2KPEUKjd98nRPNiuMGP3s/pPf/qGorse9RyXfM0YCWygm2z6VhjaqINwAqsmMtPdi3B8SEOhcGEuhMCUESGxsn+9pMFikFuR5RcCig7VRhgwdSfpV4NCO5jaJzDKPJC14uQ7QgJV8g4oKi6mhWoFiDrRgUaFsD9ISxXR+H9kPfxEKIWXcWdMJSGxvPe00dB0g1a7vBkMC9ZNaXb+xxhc0k5PwcO36REC9VW0oCn7AbpvKhPI47ra+v7n/0urfON5s2R0rAuv1wchbYxPynyCri/ovhGg+MSaqXbO7TSRzlv8Tn8ydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/Aan/pDOgDeVkIHiG/iOiuewZgagQWXZMe0VGlHU4Y=;
 b=bDm0aLYcD7cNKSWsw9X5opydTxP8PiF28crUAXdRcDOABECiFwzufeQbSG/XEEpAOP0da9O9bIRNY4BntMERaOFZfsbyHsRGIeGfq9T1xyXKX0tc/hAhH4EbX7IZ5/1br02s1QVvFz35s4iklunWOt36B1Lsfdvt+92bgDrF2Ss=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5604.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Tue, 8 Sep
 2020 02:37:30 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 02:37:30 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH 1/3] arm-bsp/n1sdp: update SRC_REV to latest validated version
Date: Tue,  8 Sep 2020 08:07:15 +0530
Message-Id: <20200908023717.9025-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::24) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.53) by BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Tue, 8 Sep 2020 02:37:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f7697618-70c2-4312-4852-08d853a0263c
X-MS-TrafficTypeDiagnostic: AM8PR08MB5604:|DB7PR08MB3337:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB33373B22C3F4A475308A1F17FA290@DB7PR08MB3337.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iDjGZM0jciusAQBwlm04u6m2Rp4kVSmrNxEnRpEXk/NvXH18US2hM5OvaVX5ckbPy5z/2PUHj1N45FTY7nJlQjssXQ86qjH8GRq87yywm6nV/6Jg4Q/c2hwrZh1GMk31ySPAdia7b6Wulx62TFDcPDiqaFuZ5n0NA+u4FEO++y9DoOUBWAsJr4NK8KZQDhbqHASB1pP75Bm0Vi0Egt00gAMkkgSE4hSb7K1RpvtQi6oLh04Hf3XRDmO9s961U+9Xa9P0H5LoSy7CnpZh7ScCW+58coKiIJ0cEhTrxCy0Tnabcx8T7vuv+JCFEQXGsG8N0rTZ/EgEtPdh1AkhggZ9tuKRP4FQl8iHXFcA4EdMMg1ZhPNvZbSKb15iVOgAvxzP
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(16526019)(1076003)(26005)(6916009)(15650500001)(186003)(6486002)(956004)(8936002)(2616005)(4326008)(66556008)(66946007)(66476007)(478600001)(83380400001)(86362001)(316002)(6666004)(36756003)(2906002)(7696005)(5660300002)(52116002)(8676002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 0TAObxbMOMg8uHkpwv1ssQzeF3bIgJOuAwAy8//Wk7pcC18+z0nzd40rLkURzE/p0OmG2K9YOC70hjd0WVTikmVWApCK+UcVeDvC2F3KKm97GoXJ8GgIFS+I6XDxIOVFK4DrF4op0owf2cELcLONNLnKuHsxnjEwdTVFoch/Eoob5/xEulmkHB0x4B6+ZB826/ko9l8hL/pYc7ezT+wSo3TcQfJvBTFogUv9vtwlCJ6dYqeoBZ/CDUtMRfNf2U8m8EDK4ZIiQorBKDaTJEII53O484MXC9eOEcnEZXUyyfgq362mfRD+3eEWCYyf7Qt4F8k/gkNfMtwK04ovfJHUvfKgG6E+xBla0kpxrs99lKsBS9sjZbbLAVNkFKLj8qfBD8JTj7zCHLGf6m+3s5hQnkBP6hot1GTdY0E1UwHX+WySXjPpQ8SNgnj+Xv6aUx/6r0yHfdP8J3o270ELRn+MVCDbEIakPP1E5acbO/V7WLQ0ojCrCFB4bIZMsch4YcJdBEa5s+IXivNhd4tLXmp4AlggJq/daYT5VYIJI4Dn8ckezB5h9VQmIukO+6THZZXqZDUQC5udSwhK90mMcntfaUrH09GyHdtKTKhqf9JXHC+o/ZpoM+D9f9W6PisyX+GK9faiC0vcXhET48wvJZEtqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5604
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bb1ca853-2d67-4e88-2795-08d853a021bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nNUEnieAkTqLmeO1e2BoLHxVl/9m5OrLXmmuq8+oeszftCoV+D8wW2InqxU0UKxOStUA3We7/SDxu9Cyd+SCjzvLKtfTfXNiFjd2qUHEFXowut78D2eMFuytZYWp6xd8tt7GjfNKFpMFkZ1Z9TOehatA+pXtIZ/OQN3tEr62j6f9LYbCkBMzI3g4+ayrRtrGYE0bIt3i1RLTUGJe8B4j0vHba99l0MWlwU0Ki8xDraiKnDw53FmkZcGFUPy0asuS1gqYpKBeEgbTp6Zk31E42wTfzi5PApz6G5w+GdA6f6Vs9NKOzt33w6D805mFnQy2wgaUrntclOQ6eIXjwmIqelf9JtlbJ4y8EqfFSU2tnMNp9VlD2+D2ffXvLztoDk6DUApPZ/dgbMLibPvZdwE8SmmhMuvfpUcPm6aPes9K5t0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966005)(26005)(1076003)(81166007)(82310400003)(86362001)(2906002)(356005)(82740400003)(478600001)(5660300002)(8936002)(7696005)(6486002)(47076004)(316002)(186003)(36906005)(83380400001)(336012)(8676002)(16526019)(15650500001)(70206006)(36756003)(956004)(2616005)(70586007)(6666004)(6916009)(4326008)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 02:37:37.3189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7697618-70c2-4312-4852-08d853a0263c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3337
Content-Type: text/plain

This patch updates the SRC REV for SCP, TFA and edk2-platforms to point to
latest versions.

Change-Id: Ib6825d51fac89a9514b936ce927e7f5f3e508e26
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc    | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc | 2 +-
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index ce7acff..818b416 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -1,6 +1,6 @@
 # N1SDP specific SCP configurations and build instructions
 
-SRCREV        = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
+SRCREV        = "350be71a2ecef588b8ff5a095a0840de23506e45"
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index 84657ce..88967a7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -12,6 +12,6 @@ SRC_URI_append = " \
     file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
     "
 
-SRCREV_tfa = "f0b1864f8e309a41d2eb1c9510f8cd3c7aacbb1d"
+SRCREV_tfa = "50eee85e044a77ad59f4903a5dad91b266770a1d"
 
 PV = "2.3+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 832b226..63154e3 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -5,7 +5,7 @@ SRC_URI = "\
 
 # TAGS and commit ID as per N1SDP-2020.03.26 release
 SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
-SRCREV_edk2-platforms = "b6bfc4417ff13168d69c4cbf2338f62c89c82dfd"
+SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
 
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE = "0"
-- 
2.17.1

