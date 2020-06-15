Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.88])
 by mx.groups.io with SMTP id smtpd.web10.22318.1592238467595883984
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 09:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=13bGvoS4;
 spf=pass (domain: arm.com, ip: 40.107.5.88, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/4+j7A87ixWn2UXpVHZ10SZtACHxhDEOk66uTMqT18=;
 b=13bGvoS4LPcZHM4BGMxsMQ6nIL5R/4BFJ6f8EiXwa/pMmPSMyDJ0RuBTXSRfXAJx8AYGEm+33u88K7F8E8fFuodQZAuJlQRWkAaK92H93otKy7GExOZyXkrLXcXbZBzuzn3foU/iiTSlHK2Iejape9G/k2TA6aTihuyq09u4S/o=
Received: from AM0PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:208:3e::27)
 by AM6PR08MB4566.eurprd08.prod.outlook.com (2603:10a6:20b:a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 16:27:44 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::a7) by AM0PR02CA0014.outlook.office365.com
 (2603:10a6:208:3e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Mon, 15 Jun 2020 16:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Mon, 15 Jun 2020 16:27:44 +0000
Received: ("Tessian outbound 79611f28bf50:v59"); Mon, 15 Jun 2020 16:27:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ef5df6a714d097c
X-CR-MTA-TID: 64aa7808
Received: from 70bdc46d55f5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7B0ACC60-E3DE-44FB-90B6-D7C10828B61A.1;
	Mon, 15 Jun 2020 16:27:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70bdc46d55f5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jun 2020 16:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBQhXlYeL+C+/lwYzHV1FeUQI1C2B50FxY2FvCmfxd2wQImQxKIYGmympFr1GqMl7Uix3Oz+QIybqxVKClZFzBsGfjMWeGZctfV9hUH7e0xSfnH4B6oz2zE+Gxlnzp24KbxvJ3MX7ejs6HYCChlna4GwGEz4wtsjACCvccLomfQtB4InhKOtdzqhszvRu9fBsVktX1aa+i3yJ8rvZA6/zIOrr8kOMbR3YZCP8nN7frJxz0NmoWvBrzXn7VJlL9u9yeb6OIKUEn3z5Z+FG27annFVNJO90TX3HVoENlEk4Fif+NXZMt4jbL9Qf7C6q7h7fHwrqG9KPX+N5+m6slWoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/4+j7A87ixWn2UXpVHZ10SZtACHxhDEOk66uTMqT18=;
 b=MjkJTHFWUsdCZXPPcOT5nvpPB+us/xWqAxFlRm/+r102r7Jni8a/J/v75gCvGN3dv0BXy07RHk6LWcFpVLe63VyA4RfgZ2jlgaqrhNM+LUaEHaCPLYMNbZsekpl5yv20TUeZ6QiYzrSu2qPkSPJrF7yooEiNGUCtIbkR12b0nZDSG1uulOTmBpYhRgK9AydwaK+4Zy6Gyg+zzk7vsWryW/G3Hy2L389b1P5aKaFqGLU/AcdRA9DOMnCH/wmMHybZRF6zUtdKbHjE/PFnp56rsEVDcNQrZXDJZETV4OpmHR+7HhUEPS8WIX4TeCLtq+varMY0v4IUPS9s3Okb76Qttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/4+j7A87ixWn2UXpVHZ10SZtACHxhDEOk66uTMqT18=;
 b=13bGvoS4LPcZHM4BGMxsMQ6nIL5R/4BFJ6f8EiXwa/pMmPSMyDJ0RuBTXSRfXAJx8AYGEm+33u88K7F8E8fFuodQZAuJlQRWkAaK92H93otKy7GExOZyXkrLXcXbZBzuzn3foU/iiTSlHK2Iejape9G/k2TA6aTihuyq09u4S/o=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5337.eurprd08.prod.outlook.com (2603:10a6:10:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Mon, 15 Jun
 2020 16:27:36 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 16:27:36 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] meta-arm: Fix passing of linker flags
Date: Mon, 15 Jun 2020 17:27:27 +0100
Message-Id: <20200615162727.8810-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0332.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::32) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sudpau01.cambridge.arm.com (217.140.106.50) by LO2P265CA0332.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Mon, 15 Jun 2020 16:27:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 485c71d4-08c1-4a48-41d0-08d81149085d
X-MS-TrafficTypeDiagnostic: DB8PR08MB5337:|AM6PR08MB4566:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB45664F4059C790A91223FE5CFA9C0@AM6PR08MB4566.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;OLM:1443;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OoLsA7MOwkJFYqhsGxeZVjDemlAz8ZrswsvuC2KllAgCWZwX3tUZjmx6rNpUrYHLUP/C3kxrBHAkY4/bT5f+KtT0WdkoyowfMLEhKcbxWOH9WqXvRC2W2hS1qrFA6C8egSA6iWdPSCA1vN8Yg6N3bKIqkUVIuMgvlDNsQcEVau4R4FIlmbsTQtPQP9q570WMUM12QlGQIXRTq1fC9uu9ecvbOIO9Q/OtBlyF1vopoC7V7OGchOW9U/gkmt9MQSIeDPP9w/f6LBQ7DKCNIwq4HUXQpiw0LFPAeEnSOcGeMlTWLK07U2jRlGWyMazd/lgk
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(66946007)(2616005)(66476007)(66556008)(316002)(956004)(2906002)(8936002)(54906003)(6666004)(36756003)(478600001)(6486002)(7696005)(52116002)(186003)(4326008)(26005)(86362001)(1076003)(16526019)(8676002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 WP7uC/q6Lg0cUR2OMPSg445FFauM1A7umhyZX6wVP1e67gaMLCoW0ok+SpG+meYdXVAwqgDJit/Pkwd0+12H1cSpCJ+B5HprA4XUFXZQn3pxXthYO1rvOO+4wwQ57ozde0F3PDCTKclFzmgoXOifQ5uYXaetGlqtEpyWv1FyKlUydsuQslaXNYosS1EyEJiiq7nj7GMpna5cicW2PE7O3Css1ABlLEh718k5zX5M1Bt/e+q9q4n3Ld8EOg/mbmfxVr+d8LWo1sxvrFH5Q42ndmOC5kErXCLg/jAUMOaft507nnKW2i24RctUJEVSYZvIss+RD68DjFTbTN+JA22FKIN5nmyN9WmDuioVvgMy244N+KIoqnMOJsv2zZ8MOrJwSMQecUC5quD+VZ6ErhFwc82jQT7QlRCZhWnDtZVEiBN90pzab7tgxaOGoTRdqIMfdjD5rH2WJ8s3GdNWpXZQ3emXpQUhtodeOZfb2wam6sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5337
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(2906002)(47076004)(478600001)(54906003)(6666004)(1076003)(316002)(6486002)(186003)(16526019)(8676002)(82740400003)(8936002)(86362001)(70586007)(70206006)(336012)(81166007)(956004)(2616005)(6916009)(36756003)(4326008)(356005)(7696005)(36906005)(82310400002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a66cfbf4-0531-4602-affe-08d811490352
X-Forefront-PRVS: 04359FAD81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qpzxEqLGHHxK5sBW6FZrQAd63xEW1e9rhpnuFfaonyIYdsYxEIP7XTWX8/4D8BMtcgL4UxNJpDnnlV5Ni+ABttasjANO9f197xdR26JfQFIp4kUM+LyNycMaK/nxf9mbbTcNH2OosHUHCqKiMi02b6Pz+ej6GyYZLO3oKnDtE03o2AzSHVyGTB0fV0d9DEkOxZnIP5oVHeVdzKISdMmDrbRuDmnHYR6z/CSniVVaXztmREi1wkRymQD32xtALDeeMDqe/0PeO914CV8cGma5JIEaKjEwLy614dEkVZgt1EacgX+bqfn+6PG7blgQZZULpLwmFrQyTpv/l0KQL/8SCIxjgVw2386OBl97rkBui9Vfi8HPc9p6U7ap34yKXoO0lKCpyGgnKxGjr/vqcvW/CA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 16:27:44.2780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 485c71d4-08c1-4a48-41d0-08d81149085d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4566
Content-Type: text/plain

The build initially worked because host machine had
util-linux-dev installed, the build failed otherwise.
This patch will fix the passing of linker flags.

Change-Id: If2f31e8e31109b9c8fd62b32d2f80902a1dd3cfd
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
index 7b9327c..6696768 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -48,6 +48,9 @@ python __anonymous() {
 }
 
 do_compile() {
+    sed -i -e 's:-I \.\.:-I \.\. ${BUILD_CFLAGS} :' ${EDK_TOOLS_PATH}/Source/C/Makefiles/header.makefile
+    sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/Source/C/*/GNUmakefile
+
     # Copy the templates as we don't run envsetup
     cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/build_rule.txt
     cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools_def.txt
-- 
2.17.1

