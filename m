Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web12.22310.1592238509300504791
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 09:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qXYPr6te;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBATjXtSEoSSCWZB6g834kRyCryrdIUraNrhtb4SH1w=;
 b=qXYPr6te4KXXRi26bInoFt5rIjh7DGUKlCtkCtCRpZgTWoa57euLmK3yQ7iv6rkglqbrEOr+WzSGkoTnn79w904sshBDz/Cikh2rtaOUlpmiLXxeDXm4f5/nFMmFECpK8DVzNpb7i0J/GzB1iMcGJl25X7iWAKAKEv3SrYKNxvA=
Received: from AM6PR10CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::22)
 by AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Mon, 15 Jun
 2020 16:28:26 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::ae) by AM6PR10CA0009.outlook.office365.com
 (2603:10a6:209:89::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Mon, 15 Jun 2020 16:28:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Mon, 15 Jun 2020 16:28:26 +0000
Received: ("Tessian outbound f590bea98ab4:v59"); Mon, 15 Jun 2020 16:28:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e608dcf4dfa30e82
X-CR-MTA-TID: 64aa7808
Received: from dc8561559f4c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC944CF5-7557-4453-88AD-DB431B779796.1;
	Mon, 15 Jun 2020 16:28:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc8561559f4c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 Jun 2020 16:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvCrQip/HnWUQ/goel4KDSA7Ys2umQgXUlJBsknZvmIXOO8f+ueKr2AaeiXxWI9Ymfyzm43guu8apOt5Vm3MoReHXejYg3QhzvHeNIrf7IxNBLnd8RXx0YvMFsKAHcXlyNUm+hxW9U8iGPGRvzNYiMab+rR1aSOOezdGXIgKPz4jU8xpKrgUjRKhvppYmH3xY+61FKIZ8PR/pYwHtSggUuxjt/6MHYpfi6sjBJWAgHPaQx+XNa68jHjWnuOIwyIu7z9mcq7+E9OHZ0ji5Sy94+FVXn9VfbaT3rHBJPrdQkuYbbN18xyORlFaywgFcRA+fYJPXiZAih9VKV5eS6rnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBATjXtSEoSSCWZB6g834kRyCryrdIUraNrhtb4SH1w=;
 b=JBbikaP1S/XaoGVlyvryGGL8UD9g8yAF3B+njOa7OaOY3Rcd8aWclrp4y67coK/xYEMzGjtOYLQx9j/pgtZfFfMoS1Uwlae9YxrdI4LDLxHiSJcyph/ZRjlOq+xMuine0CKz6laurgtA+TowK/NfXFqlTgcKMjlo4UouRaMfGXYXZSfXGT04mhfXXSWx1cJv3yNtgGRZpdHsKw/elz6UMWH9lhmAxRXtFJb0t4AU3KSKsL+VjAgwQXNnM43baMq+mti3az6Gr3ohuW/KX7YQUG1PpoeVsImCQypdx8xFHUgoMZlwqYEj+Ll7pdAnKLHSP5WG+2gpWpJ1WR9DMquK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBATjXtSEoSSCWZB6g834kRyCryrdIUraNrhtb4SH1w=;
 b=qXYPr6te4KXXRi26bInoFt5rIjh7DGUKlCtkCtCRpZgTWoa57euLmK3yQ7iv6rkglqbrEOr+WzSGkoTnn79w904sshBDz/Cikh2rtaOUlpmiLXxeDXm4f5/nFMmFECpK8DVzNpb7i0J/GzB1iMcGJl25X7iWAKAKEv3SrYKNxvA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5337.eurprd08.prod.outlook.com (2603:10a6:10:11e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Mon, 15 Jun
 2020 16:28:19 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3088.029; Mon, 15 Jun 2020
 16:28:19 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-bsp: Fix the PV variable for edk2
Date: Mon, 15 Jun 2020 17:28:11 +0100
Message-Id: <20200615162811.8860-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0040.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::28)
 To DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sudpau01.cambridge.arm.com (217.140.106.50) by LO2P123CA0040.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20 via Frontend Transport; Mon, 15 Jun 2020 16:28:19 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 883dc9b2-96b2-4d69-d1a9-08d81149216a
X-MS-TrafficTypeDiagnostic: DB8PR08MB5337:|AM6PR08MB4934:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4934D6021D854ABC1446894FFA9C0@AM6PR08MB4934.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:813;OLM:813;
X-Forefront-PRVS: 04359FAD81
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ypa/kQxoqkKIoX0U6o+PQJaN871L2sh56hYXfBOb8abSQfJewbdfKdpxgm6lecOQ7TAjJUgP6CxUOSL4vuWx5UVM46ameEIy0DVsXEVl2SknAPuOrJl01QrsakfMrS5GBPAdolirE1cbrj3kDJZ0K9vHH9cJKcGQ+X1Cd//vRSyYj8x2P7hsFnWZdk0lr7s5wKhH8SeONtduH3V837hY6cfKz4IIfH8TIxoX7EEji7RYspIs3oo6XQBEoYd19hZZVAHifIDb0fgIICk3+JRdk03HdlGWGzBKoJ+kXc2na8AfeTaf+rs51xGG3/+jCWH3B/BucAo7zY6W0C05JrQu6/cFwSzAeURi1toKLhk6lIuQmBCVkk+alJ3koqaAovfx
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(66946007)(2616005)(66476007)(66556008)(316002)(956004)(2906002)(8936002)(54906003)(6666004)(36756003)(478600001)(6486002)(7696005)(52116002)(186003)(4326008)(26005)(4744005)(86362001)(1076003)(16526019)(8676002)(6916009)(5660300002)(83380400001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 fKDsd0nWPrC4ZoVQPI6bwpWkpaFMstvJJq808jWs7vI9JSFHs9kpQ45iU4KuS3XOsaadOYZz/7gQG0FQYGzabqKWtiBifBnEnXBSI6QX0OR8NyNdOKMpmX1ZU5v9VtnmUNC3C+jAzMt8vztdHPFBtRAcNmo3RNyzR2dyagPr7MxvS76AMfJ4R62EtM31d5w8MYXtYVW7P152kwz/jeHh1VacPRLsbBm+7EnyH6Bb9/rqGwEkM7//JYWN82R63hYMf+FPzmj+IQ1tE3dURyIXZW83Az6/6cISr9GKdn6spiymXVw6tq+ims5Bz5wWEM6RepW8Op51LGJymVGLSR7mE475lfl5r4rDpbvvyjg960QEMN70RS6olVTKawi/NcFT978YeChLuLuVRbmdj3Cszzw3aSp1WYUo8T6rnEchM/He8wJG+AGEo2rhXduT/z/vQlX8n8yzUciR8dkTY6HymYSdgMq7QiLTtVR2UXzHBkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5337
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966005)(36756003)(6666004)(356005)(7696005)(82310400002)(1076003)(70206006)(36906005)(316002)(86362001)(6486002)(70586007)(6916009)(4744005)(54906003)(47076004)(81166007)(186003)(336012)(5660300002)(8676002)(83380400001)(4326008)(478600001)(82740400003)(16526019)(956004)(26005)(2616005)(2906002)(8936002)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e12711f0-6829-4b5c-cba0-08d811491d11
X-Forefront-PRVS: 04359FAD81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Yi2jkZoKh8PTNvIU2zVrAG79bO6lPVEQlGAb+D1p3T+dFQYUMqCgl+vsg2QdI8HL0hPKudTHzM0V7jrez0O5orBVoOYaKL6QmI4KMvd2EO2Asjkk38QlGw0hK8UvgfxrxBy9LIGZQtvsUYPkafQQ8+QUBD0EkSWAyZQJI3iETe3qWnlILvWn+HuYRwXlHMivMaJOyW1gids5Ab0S0roEE9xVHQCKBAB7U0G9DnSQS6FKOxZFybrOxaekchMv11cEdFOAgT2lPCgwkzbxo8SfJ8y3efO79RY2Hix436d5hJun8A1F+mSTStSav8NpHEJupfCEN5orCk5TsBLxoG6muwdvC3JSar/PXsHVtCBTzfTvGBeCUGOOmuBP0k8KoFK1EdWzV8FW5f/5XzKIWpIcxGHKzPSTAEBGVTr249I6/M=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2020 16:28:26.2729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 883dc9b2-96b2-4d69-d1a9-08d81149216a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4934
Content-Type: text/plain

PV variable is being set as PV=git by bitbake which is incorrect.
This patch fixes the PV variable.

Change-Id: Ie5a0f8b753fc2f7ac103c6d024c7134f88264079
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index c8fc70a..3114c47 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -16,4 +16,5 @@ EDK2_ARCH          = "AARCH64"
 
 COMPATIBLE_MACHINE = "n1sdp"
 
-PV ?= "201908+git${SRCPV}"
+SRCPV_COMBINED := "${@bb.fetch2.get_srcrev(d).replace('AUTOINC+','')}"
+PV = "201908+git${SRCPV_COMBINED}"
-- 
2.17.1

