Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.52])
 by mx.groups.io with SMTP id smtpd.web10.137771.1598026278944904963
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 09:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Um1vdBvl;
 spf=pass (domain: arm.com, ip: 40.107.8.52, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYo62Qi1hNu7doAvpcPqHk6XrgxphWGlW1G1+vkoqCw=;
 b=Um1vdBvlzcltpTKmS6LXAdxacw8wBMvEa/51DxzeeeLIp5K5gJxBihh9NwbJdCmjfJVxdICiReoaRWQhqF8k8ed8DU81Q3sVISu4Fajgoq7YgDz3Dooo83At2CPhCXFnzpkunAzHRWBB/kuPlFRKkw7/VAG4H7BYID8BhL62BbQ=
Received: from DB8PR03CA0001.eurprd03.prod.outlook.com (2603:10a6:10:be::14)
 by DBBPR08MB4412.eurprd08.prod.outlook.com (2603:10a6:10:ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 16:11:16 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::a) by DB8PR03CA0001.outlook.office365.com
 (2603:10a6:10:be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Fri, 21 Aug 2020 16:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 16:11:15 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Fri, 21 Aug 2020 16:11:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99676666294cfb8c
X-CR-MTA-TID: 64aa7808
Received: from c03e27793f17.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 071B840D-8804-4848-B142-441495C8CFC6.1;
	Fri, 21 Aug 2020 16:11:09 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c03e27793f17.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Aug 2020 16:11:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3uPwh20Uua/6/aC/gTsTvZLScO46JHNR2TqGRWaYzi/av2ts+qY77V+l6WHSwZEc8dQC5WqK6e/i43oo/eDQMi8MoP+KQMHZojLH5qTrNM8NZ7rBXq7QJBCHeSRKYjEP9l5RxX1ZpVODrJ0qMuhcrw0IjsejIS9H7ysldcsphe4Z3N0/h9V/cQefxpl0MiAJHswtGip3z7Hz+EmB9PDjydRQR3fjwjFp5KyV7WoGT2iJXko9dftE/vgzXvXIXBCR4/kzfldEwoYOODXC6nXNv+paYdYhTI4p41CYeM7EXZU+e1qdQ4ZHjkjKutm2os8AOzJyi5VVvs+m/nogwsGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYo62Qi1hNu7doAvpcPqHk6XrgxphWGlW1G1+vkoqCw=;
 b=chdHB2OYo68xkoSHwfxXpjBKNrLVYclLiNSJg+yipSRxHpEVHri3DSz5+16c3F40DinsIyRizyZu9XzTDwvei9tZYAuS4s92AIdxl+6c1zHn9+VR7mZ9czs/7/1a538lwFb9hohRFnafaHfLK2fu6CHvPVeYYtTPlZo9R1M0KbksvVHPPnMGCKd+TpeRjVUbelwPfT4MNodCZIpzWQWsHAXRbAR1MKxS1keVXuK/1aJLsq7CKDXWYKuLtxw1DH+HN2mNRvYeP+3bJBm3XtHBHXsvRTELnTyOILc9bOAOcti/5di/2V8hzkMft2C62PokCKP7+Uzt7BNUuX36FKV2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYo62Qi1hNu7doAvpcPqHk6XrgxphWGlW1G1+vkoqCw=;
 b=Um1vdBvlzcltpTKmS6LXAdxacw8wBMvEa/51DxzeeeLIp5K5gJxBihh9NwbJdCmjfJVxdICiReoaRWQhqF8k8ed8DU81Q3sVISu4Fajgoq7YgDz3Dooo83At2CPhCXFnzpkunAzHRWBB/kuPlFRKkw7/VAG4H7BYID8BhL62BbQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 16:11:07 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 16:11:07 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2 3/3] arm-bsp/trusted-firmware-a: Install dtbs from the generic TFA recipe
Date: Fri, 21 Aug 2020 21:39:27 +0530
Message-Id: <20200821160927.10598-3-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821160927.10598-1-khasim.mohammed@arm.com>
References: <20200821160927.10598-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: DM5PR15CA0056.namprd15.prod.outlook.com
 (2603:10b6:3:ae::18) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM5PR15CA0056.namprd15.prod.outlook.com (2603:10b6:3:ae::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Fri, 21 Aug 2020 16:11:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6231e423-622b-42ff-170f-08d845ecd495
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:|DBBPR08MB4412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB44125F6A1E2293E2D5D9BF2CFA5B0@DBBPR08MB4412.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3Gsl9fg3DnX4+BhS2UaDk1+bxBN0RZqm0pI76YH2ZmLmCjUjetMYFda7tHCB13qFFuPLn8chEpbwNSLWxMBDJWkWXCJPrxt+kho+zkVKNYnY58FyJ6i3q3eLtQ3+Ad3fLyYb8wgKKdiQGKMohO40Z3SHB+z1C9ljCsVh8kopA08OFERoGloYB6i53wAgIqLNYRjhxemQxerAvjEvuSO31lbb2lKZuM26Y4gduzGr/E54vzjfxevOrD5nLsPugYlY76wNyiN2rFQHQ9oyOniba2hYF7t+RAuGxcoLmhZ3Gjfj0FXMiNR6UidqQuDJfr7/P02IT5UI+sNYeybdoEZlR3XifsN25QDgSyFwqZPz4q1aQUGTFRQmG2j0eJysiTbrEoYJSn2+3knuApLz4fbeCQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(1076003)(6666004)(5660300002)(86362001)(8936002)(316002)(66556008)(66476007)(478600001)(66946007)(8676002)(2906002)(26005)(83380400001)(6916009)(16526019)(186003)(36756003)(52116002)(4326008)(6486002)(2616005)(956004)(7696005)(41533002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Cj3t8xKMiDmaZXsODhwtI41g1OoNkP2EoqaiQ+KVi5TOuGk90D81vb+uWWuTWHNqFze8nTcoNnQfgEhiHTTDtWBmhFojqzJZ1RlsgWiq+gA+DssDhLozL3etihbmUqRRpzFo1AiIBw4FN30zxxAUNfiUez4LnMM+mmPeegkN6lEDN9VruWJrDLxBL7q5rlp2QcJDEuYerL40Cbp/sHylNkvn+Y6w1hhYCl1b3ASDKTwEY5LEiD7Qt69NqIg4NCsAy1Qfoo25pmsm+Qcn+0xMIFvuClxCtJNLRYtzglW9HRYvybK5fCB/9eSAO/vvbpIXit65RrPM+9sEndzpOwjj2UWl4S47tQrqAFD+/l64cqviBRSx0hsqybSMLNnSuhoD9DJDiLc182nz5XMJTMhY/DhEyd3pvzMndiQu3iK6kYTNtlE5+OPre0n+sz0btBcuVxxT7zrskSQIACiZSI95CYfPSdk99QewLYi9RXUBg9deC5j/ipkT78iA2TgTEzgiKeDEQa6YTUHxVhwX680anLuKSVkA4syf4SgWHI4BBc9GA3+N0aNqUjv7Q+Yd/t/9uzXa0XxSRwu+Rp5DgvqfJ1uHXWm0IQCL/zNgXRtF7eGVFZZjeOAvHpiYf4Fi4GU1q/qta2JkZh3m5ush8/ps6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d287e67c-5bdb-4c0f-e4aa-08d845eccfb8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8tnemGVjVmz5Vj/N+VUaeJoSxpB2JRx+G8H2D1Jc+myo4qhF2youYCWuaq6mJ5zwHdKGF5OuMQO8EnzzvvVid8OEiotxhpKoiAKD2AZgjjKsM4lkNL1kUmlHUsBq39V6kjJlY+yaIxvdTIU036DvJS4DGAZKrpd15UW8YbaelefhdoQ4/h54e0rGbbs7C/oIugAZUpCChNaxsc55fY9OsyNwNcVBh5auqia60+qynFuCFnvFuW+at8TdEyaQbsHRmNMbnTmQjx+zIg2ZZFfPyc/7w5fEX9W1Y5XQa51S8595fd5pJlXSIaueK/C6eYTevHOZDrZvEhFNtri0rzRcZTNdD2MC7dMiOOZPh/1GVIy23lu35jOQ0RgLENMH6DsDeaeSta/WNl0vQcOEyjIAwwhnykJxwSBwBUGEMki9fxl/tgchy53PRRH1Za24AnqK
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(8676002)(356005)(70586007)(2906002)(6666004)(6486002)(316002)(7696005)(82740400003)(478600001)(82310400002)(70206006)(47076004)(36756003)(4326008)(86362001)(956004)(26005)(8936002)(186003)(2616005)(6916009)(336012)(1076003)(5660300002)(83380400001)(16526019)(81166007)(41533002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 16:11:15.4004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6231e423-622b-42ff-170f-08d845ecd495
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4412
Content-Type: text/plain

Configure TFA_INSTALL_TARGET to multi-chip and single-chip dtbs,
avoid installing dtbs in platform specific recipe instead use the generic
step.

Change-Id: I79835f2c4f4d0bde938e43d6cf59f73392520935
Issue-Id: PLATFORMS-3971
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index c26cc78..84657ce 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -3,6 +3,7 @@
 COMPATIBLE_MACHINE = "n1sdp"
 TFA_PLATFORM       = "n1sdp"
 TFA_BUILD_TARGET   = "bl31 dtbs"
+TFA_INSTALL_TARGET = "bl31 n1sdp-multi-chip n1sdp-single-chip"
 TFA_DEBUG          = "1"
 TFA_MBEDTLS        = "0"
 TFA_UBOOT          = "0"
@@ -14,8 +15,3 @@ SRC_URI_append = " \
 SRCREV_tfa = "f0b1864f8e309a41d2eb1c9510f8cd3c7aacbb1d"
 
 PV = "2.3+git${SRCPV}"
-
-do_install_append() {
-    install -m 0644 "${BUILD_DIR}/fdts/n1sdp-single-chip.dtb" "${D}/firmware/n1sdp-single-chip.dtb"
-    install -m 0644 "${BUILD_DIR}/fdts/n1sdp-multi-chip.dtb" "${D}/firmware/n1sdp-multi-chip.dtb"
-}
-- 
2.17.1

