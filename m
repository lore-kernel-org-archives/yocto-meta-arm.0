Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E39C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:56:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web09.9002.1644310558684416898
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 00:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=OElLSgar;
 spf=pass (domain: arm.com, ip: 40.107.7.72, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJeoOKufCf+YwgKC862F+b5Pe3UJvF2q7H4m3PaVdNY=;
 b=OElLSgarY8HCEN3iOz4LSpuxxYlXy9Na1m7xQ2xP/6cziCZ1TnpvdB8/dWwLo3L0rlOsc/HDI5pvncxaWISKl/g6hH3TeCc1bBry8IjHjPln/UaIkMVsCWgVWfrHVvcn1BS2IUuwIOA0WyLyQzwFizRVs7Y+1o4FLrdfK+2XnQo=
Received: from DB6PR07CA0190.eurprd07.prod.outlook.com (2603:10a6:6:42::20) by
 DB8PR08MB5340.eurprd08.prod.outlook.com (2603:10a6:10:11c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Tue, 8 Feb 2022 08:55:55 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::5b) by DB6PR07CA0190.outlook.office365.com
 (2603:10a6:6:42::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.6 via Frontend
 Transport; Tue, 8 Feb 2022 08:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 08:55:54 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Tue, 08 Feb 2022 08:55:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95f83c741ba7d309
X-CR-MTA-TID: 64aa7808
Received: from 5804b1e512ea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54C2BB16-CFD2-4F10-B467-F4FAB791BC59.1;
	Tue, 08 Feb 2022 08:55:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 5804b1e512ea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Feb 2022 08:55:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfGT0qIampmyd5g5B88EXeYVINLdbzI7UFE9AA+tOr0gU10XbkIWGo7/9yxNZFBufnd8VeixXUJ574+Y6JSgAGCWZN1Eg+zyif+F4AVOgzFIqenR9fAXGoMIINtzOA6sxAcoOJVx1v+yDIWTgtsG2HcJSq7venvhgqrwejRFz+25sqjBUhlVofaVhN503M6i0zFZzd8I3XTrE/Ahnod6RUpyTQaM/HkKpU+NUXGwR3MGvA9hF14pyYbtrXhaxPaadipdCLgTyQhT0XywdidnCbjgoyNIBwTs4TSRkEjhXHcOlNPyG8KaYXeHRjkcpN5vuTnSFqZllz020M66igL4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJeoOKufCf+YwgKC862F+b5Pe3UJvF2q7H4m3PaVdNY=;
 b=mO5AAv8M7stnieKn707JVIbWTa/QijTzYufhjs97d91Gu6t8E2Xc9Cu92qQHJiMZOjmWHPiRHRIdnCuLWwnvu4KgSaclPTvbznPF6uLB+5WL682iLKcbrCn3LJuqZUwv+T2gNt6mrOMWMKWQiCzHSRSkoHjq8d26zOef++KphHNgY/Pjrfwa997y6T4FsKPQftjv4b/jRz0abNe8GbEfUnlnKfWrouAJcdx4pXvT9CtbA4+gGaMwPfO4nNuukgH/MFhIDH4OZVp2t7in/puu4+3PBc8R1vN/GujXu/zac4s2QaklSRiWxqpZv+WiDFVrKfHLTIiNXF5ahQGF2DaOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJeoOKufCf+YwgKC862F+b5Pe3UJvF2q7H4m3PaVdNY=;
 b=OElLSgarY8HCEN3iOz4LSpuxxYlXy9Na1m7xQ2xP/6cziCZ1TnpvdB8/dWwLo3L0rlOsc/HDI5pvncxaWISKl/g6hH3TeCc1bBry8IjHjPln/UaIkMVsCWgVWfrHVvcn1BS2IUuwIOA0WyLyQzwFizRVs7Y+1o4FLrdfK+2XnQo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VI1PR0802MB2381.eurprd08.prod.outlook.com (2603:10a6:800:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 08:55:37 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::5843:cc07:ae99:81ee]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::5843:cc07:ae99:81ee%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 08:55:37 +0000
From: Anders Dellien <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2] arm-bsp/trusted-firmware-a: Update SHA for TC
Date: Tue,  8 Feb 2022 08:55:23 +0000
Message-Id: <20220208085523.25594-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 36b13510-2850-4229-c87c-08d9eae0d0ee
X-MS-TrafficTypeDiagnostic: 
	VI1PR0802MB2381:EE_|DB5EUR03FT048:EE_|DB8PR08MB5340:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB53408B781FAE8501230949C0892D9@DB8PR08MB5340.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O3iY4KZjDbTDbtaFRFeirQ4SCX+ToNfl6otJhVP6ryDt2+vz2F4WXtOyu0AbmYXd3wSxNNqNTFq2GmL8irT31sakH9pmRbzYQT21JA5FFuYH7VYvwMKordi43dvI68C0N0Y+XLSiL4OnLz6knnA8DElb1LOcfWR9dOT0jBsQ3FSIaEeuKhBUvhD39yZoupDKHT95tc7VtdbB3D7VahM0S1oCHhuC+35FVyMa1jI3xuir9iqidaEqTe4uOlomtlhU+o9mI2iX89FxYymR/AT3+AgymWYG20EZzZMb3g+3iJuYyqnH1XLpr5KcGyQf2GeYyIMoFytuzkLGrM8npzT2iDiORbRL8CTUNy0PWU+eLgqiVMN6pGU5D/pzHqbHbz66zcJXKMkuUau0ZdhKEiP4ARSL+iLSp4u+MwCpbvu3fbTHqZoIG/C9PdLDHV/ThPs5vvGCe2MQ3Dw56akbrhqDDpY7C/vEYnOUaxnb+FhFXTQarIb1S2JgrVrYguXFfKN8ZY8QupF1lADy0/aKvyr2vY4z2aUD0Vu4J+vTC/l5dPPXuZMsE08tySdKf+jB0LRM1/9vz4x66qPKKnp+KlCPeB+qEfZHs6wYkklky79KKb+hMwgloY9pavVsPKcINjwSlxVIGFfMw42B7vcEvSxklGbhVwh4dk7DDnRM1AwB5PzSPrnYP3T9ukrLEG5nKPDQY/e292snO8h3vMSXFCpyTLCT0638RPUX9hK8+uORTUCtTVkyB5LhrzGGsKVfHXab
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(316002)(186003)(6506007)(6916009)(36756003)(26005)(52116002)(2616005)(2906002)(6666004)(1076003)(38100700002)(6486002)(38350700002)(44832011)(83380400001)(86362001)(508600001)(4326008)(66556008)(8936002)(8676002)(15650500001)(5660300002)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2381
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0c1ea20d-9682-4165-0954-08d9eae0c565
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TznB4jzLtufcijWHapn7irotDSyJso+sf0Fkk/8GbnVZSouLsE6sRg5a7ej5Aqrdb0HHtrvf+di0sx+fT9Ud3eOyZZMb0Xxryl1+lmmgvKnVvq/tlVVu+j+YvYIu4/dHwcEidTi+TF5uNf0qrigdOZNUjGVmaKfn9lQEt4mJxgG/Tj7/ZEVYT6bowJ4/GJooE3YzmdrZwu8AyOVWRvvvdKtn8RfQ43ZmbR7cINTKbHCi2/L3OutoMRo/Y5zMXG+Q3lx0if9QKPEKRVUOpjy2DX1QnZ67e2kCgRJEpn1kgYxuQLGcdxcUEvtkUG4D5RixNBkNnCFWfo0isSXvtG/+3hTLgzMYduOe757OototFUi6KMfEMpHdHT3fajiy7zQtFXWxVteJChU8w9utBXCmMoACNbbWSt3aT/OpwdH1eNAQRw2S4FwPM89XlX91i5AEPJutWUBS1VT3ok1cfl6t8awrRp2ceF5N0RyxQQHpn6S9Uy5hndi/l5MijSSpkM+D21NAn37ibmMYv2abjj3u3UDT7AAvHbYnqvGdIDF6q9ecv7VrlXguPfgf41vofYAdPmqmbQScn01Gns0JXr5FMnWnl1UEsKIXwlZOvNPV+CQncccEYie5JN438kK/YLAQjlteSVuZWZ93lsk89JvqVctQWYtpKtFEZVMnYgvW84nWpj57V5yAUQ0FAOVwbl3t
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4326008)(82310400004)(36860700001)(47076005)(8676002)(70206006)(316002)(86362001)(70586007)(6916009)(2906002)(6512007)(2616005)(6506007)(15650500001)(6666004)(36756003)(508600001)(44832011)(40460700003)(81166007)(356005)(336012)(26005)(83380400001)(1076003)(186003)(6486002)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 08:55:54.8434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 36b13510-2850-4229-c87c-08d9eae0d0ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5340
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 08:56:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2952

Move TC to an intermediate SHA based on 2.6. This SHA includes
patches for:
* Support for 8GB DRAM
* Support for GPU
* Removal of kernel command-line (not needed, kept in U-Boot)

Also removed patch that fixes build problems as the problem has
been solved in the updated SHA.

Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Change-Id: Ic8c4ef35e8e7ed25711ff0813abab6b6c8564ef3
---
 .../trusted-firmware-a/trusted-firmware-a-tc.inc          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
index 19b46230..4d14b959 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc.inc
@@ -1,5 +1,9 @@
 # TC0 specific TFA configuration
 
+# Intermediate SHA with 2.6 baseline version
+SRCREV_tfa = "b06344a3f2c5a0fede3646627f37d1fce3d3d585"
+PV = "2.6+git${SRCPV}"
+
 DEPENDS += "scp-firmware util-linux-native gptfdisk-native"
 
 SRC_URI:append = " \
@@ -7,6 +11,10 @@ SRC_URI:append = " \
     file://generate_metadata.py \
     "
 
+SRC_URI:remove = " \
+    file://ssl.patch \
+    "
+
 COMPATIBLE_MACHINE = "(tc?)"
 
 TFA_PLATFORM = "tc"
-- 
2.17.1


