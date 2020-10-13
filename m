Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.54])
 by mx.groups.io with SMTP id smtpd.web12.9520.1602587920077410232
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 04:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sJmdvEMa;
 spf=pass (domain: arm.com, ip: 40.107.22.54, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nDsZ02vxV+JGC+OCFKRjI2yL7mUEIhB/MaDxshl6JY=;
 b=sJmdvEMa2Y7PuMbttKmxL0MrWZSScoNvwvQwtgu3zdA/DIhX3rzLNCkwaAK7EkUtA9OzFIjiC3NZUlU0I5X6P6lWW7yzOp9omVe3zKlmibAAHGJdAjyRC1xHxT60rh0Nf66HcDOskFMQBcCDsGSAK8njZcgeCKl/wCdIoCr65g0=
Received: from AM6P195CA0031.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::44)
 by VI1PR0802MB2398.eurprd08.prod.outlook.com (2603:10a6:800:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 13 Oct
 2020 11:18:37 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::29) by AM6P195CA0031.outlook.office365.com
 (2603:10a6:209:81::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Tue, 13 Oct 2020 11:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Tue, 13 Oct 2020 11:18:36 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Tue, 13 Oct 2020 11:18:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ef6aa1c386aa2cc
X-CR-MTA-TID: 64aa7808
Received: from 97ea701141a7.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D39A2689-2B27-4726-97EA-C18FC67A19FC.1;
	Tue, 13 Oct 2020 11:18:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 97ea701141a7.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Oct 2020 11:18:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZc+hBfrm3UAqNcZ3AIXcZ9AzHQ/myzr9xa8DDrga5orJ3DFfqxK9rqn2EK0BJgHQLLaPrNlv8bE46qLmtf4KWS+U36A3nBbNSId7Rsk/pYmKtO/Vy0E0gctIvnHmJFg+2Ai6rQ4aXsfONfKKUeeJDF8JAs4oM7Ark4Xp/F1FYEF0LZ60ygVcZiv3E0WSC+bq8QnI+nu8wNtNykha6xHRFDSRvjYzPkTH+O1OYNdJNxxF/9rkTUlNpGWN+RntlQHL+YWankbNrFrbBHgkUAz5fICZ+dJvqsnnEpLl7LF5VoQLRFOrOMHlkw3gNnkKH1GmjxG7lESoofoN+Mi7fA7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nDsZ02vxV+JGC+OCFKRjI2yL7mUEIhB/MaDxshl6JY=;
 b=QX97VuFKz3G8I7z5ZIeYGAUC3kszjI96GicIfZ9jT8zFvs8j527jPx4EJbGOhonZ8p0muyrRzlWmBB6Z+ezapXh6zI5+J2YA8qX2IDcRT4rkpTmvBqumXD2Ohq3BSGFBVWScXQ8vMf11P/zxExkuxxxSSzNhO04OmBJPabHw918b+hoOVt69AcOsjUPApXVtY7N0KcspjOAOjjlXBUspdmqLrPtkZfC0+GbGyKFgESpsBdH8FkUd/34d+cbeLiMYa5q5vHwriUnLmKSTPOAmCK7qm6jO60STyIQfTgYVANbooWeOTPQR9Gpy4OAr3cL1LXZCFJgqzuEawspw5jBEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nDsZ02vxV+JGC+OCFKRjI2yL7mUEIhB/MaDxshl6JY=;
 b=sJmdvEMa2Y7PuMbttKmxL0MrWZSScoNvwvQwtgu3zdA/DIhX3rzLNCkwaAK7EkUtA9OzFIjiC3NZUlU0I5X6P6lWW7yzOp9omVe3zKlmibAAHGJdAjyRC1xHxT60rh0Nf66HcDOskFMQBcCDsGSAK8njZcgeCKl/wCdIoCr65g0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com (2603:10a6:10:b2::16)
 by DB7PR08MB3211.eurprd08.prod.outlook.com (2603:10a6:5:27::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Tue, 13 Oct
 2020 11:18:26 +0000
Received: from DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::5416:ae85:c3b9:1c99]) by DB8PR08MB4123.eurprd08.prod.outlook.com
 ([fe80::5416:ae85:c3b9:1c99%7]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 11:18:26 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH 2/2] arm-bsp/scp-firmware: Update SHA for tc0
Date: Tue, 13 Oct 2020 12:18:12 +0100
Message-Id: <20201013111812.52597-2-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013111812.52597-1-usama.arif@arm.com>
References: <20201013111812.52597-1-usama.arif@arm.com>
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::24) To DB8PR08MB4123.eurprd08.prod.outlook.com
 (2603:10a6:10:b2::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P123CA0060.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Tue, 13 Oct 2020 11:18:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 260392c1-0a66-4cb9-6a93-08d86f69ba79
X-MS-TrafficTypeDiagnostic: DB7PR08MB3211:|VI1PR0802MB2398:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2398BDC9D731D6C4C0E8C38892040@VI1PR0802MB2398.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lpHkU8jFiytsW7yZ94qOsXSHUCuDpv8mehqNP7EeDBjXVbj4S3uxXdfo4ykHk/Lmken58zVIU+Kn0fi7q/mmb/zKvKMOu26cs6f/K8/iW2gt4qXB+i/ApsognGLsHBP5D2wvjuI5CzedHAmXnlTZIqEsH5/TaUqCMwFctokB6v1bhMZXDTkt3vGcFe3rxTTRKvY8fCVP/n1aE3e3GMKc47msGaybYtsvhA/hoC7DZDdQZc3FnIPUMB9pU1nVeGb/wstDY5d+tUPp85czp0QFR4kuI8X61STW/0YuHs1tgXvFRRRQxKvWBlmxP5fq8GmV
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4123.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(5660300002)(44832011)(66946007)(26005)(83380400001)(478600001)(2906002)(86362001)(956004)(6916009)(6486002)(186003)(1076003)(6666004)(4326008)(36756003)(16526019)(7696005)(52116002)(66476007)(8936002)(8676002)(2616005)(316002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 gyrSMmc4uIXGKFHuop3UK0jgf+J3RkjdD0agRfXXOZq/40PCPFznJ1lsdISUCfqLaFr6Dhe1ROW0LP8PK57X3tZu77fK3JmNCATLgy7v2Dhp04oiYaJRW8XBoVnNC3PjhNkVVGEZDcGUzR0eOKabEA09DGMFPurg8Gh76BiNaURzWsDDZNK7Ym0T39fT3TMDiK0jY6U2dWXm6FqK16ASOxL6TLZvYN3arHiyaqvvjOKugfcRyBffAvoAey364tG8J/BFfCUaunqvffC/eGPsfvW/wvnyN/Z0JrJVChyNlWZUdFpXdy+wDy5Q2vuwTMUOFtY4t/uAiOjcCF2eqNX8Ki/z5QbJwo0FTFmdSFzQ3vJEgzsJ89A45Oc0tnFYPmZe89SaBI0+IXjnNlflDZbm/0UWxiVQYNAJFn7d6ZhoHM3ZXmGbC7agfbjRWu6i06X77n6Tg+m+o2rpXHV3o42NjhL5K+vjkKbWKz1YBPC5VWl4D6Qm6DKq7sP342F94lIKCjqqj99mBiG7BkvK2xBUAWjLvWNc0C2hL+V4Zbxj039M74TZHalv6Yd/VAkmMi371I3OgKGopbxcbEBRfbe1jccj1zbANck0fBxC+RBfPItcQn9VsFXRv+67MIdPYT+/8epSyQIGqBi2klcfueQgtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3211
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	16bec455-e590-4868-9f81-08d86f69b453
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SnYrV3SjfoFAigOehGa62GUWELjs/Ym1aB8P8rKwOO6xUwF6gLIVu23PM1nJ1V6clz4DLsp+FeOtHIADf0pSarm1mHwI+Wim2nbaxUbK1YmdQY2af3WvrxhyfDcIEFFlCs/ZWs55o3m9oFhEBeF8/U+mizzSyUnn/5ZEn9YO3IcrO0NQrNgpCkzI02a2vVe+KhNg+eAcS9I1hifhFD6TUcTnjOXN7kmO8N4cBZ6TBntOxDVnFUjdhiJ8k3NHUIGxN8gD++/SCYkksWaGse3CmzeY1DiS76zZlIfqRh5BSduldj9pqiABbrqoplCo3LdOnm+2MZgdaNvlyIOJ7OKTnz3NWw+X6XqQIMj+4cC1fsYdNuG5h1CAlYX/CeeN2F/IVC7xT8QgKUx8iwQR1HXGag==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966005)(6916009)(82740400003)(83380400001)(44832011)(82310400003)(956004)(2616005)(2906002)(81166007)(356005)(186003)(7696005)(6666004)(47076004)(336012)(26005)(16526019)(36756003)(478600001)(8936002)(8676002)(6486002)(86362001)(1076003)(316002)(5660300002)(70586007)(70206006)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 11:18:36.2594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 260392c1-0a66-4cb9-6a93-08d86f69ba79
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2398
Content-Type: text/plain

This SHA includes the architecture changes introduced as
including switching Cortex M7 to M3 as well as memory and
interrupt map changes. The SRC_URI is also overwritten as
the patch
0001-tools-gen_module_code-atomically-rewrite-the-generat.patch
has already been merged applied in the base recipe has
already been merge in this SHA.

Change-Id: I85dc6b65390249673415789ec110aae74ba3b5af
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
index a04f729..013bbf9 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc0.inc
@@ -1,7 +1,8 @@
 # TC0 specific SCP configuration
 
 # Intermediate SHA with 2.6 baseline version
-SRCREV = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
+SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
+SRCREV = "6fad1d3e2f82b2ef51e55928ac3a678a75f64ef4"
 
 COMPATIBLE_MACHINE = "tc0"
 
-- 
2.17.1

