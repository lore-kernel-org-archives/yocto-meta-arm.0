Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web12.18700.1601480807103787888
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Sep 2020 08:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6qresTeq;
 spf=pass (domain: arm.com, ip: 40.107.22.58, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fXLkKvlG1jVwzzb4tYrxAKOPe+wDWbyntmYZU3V3zs=;
 b=6qresTeqfb2Nle40CL2K//IuSl/Ii81/XszLJv97M/CsEKFP3E5AUmoLgZJtrKpFe5NiEz0iXz63KMelQ4GOmCPusnXRZNos6VunANjEgT+jFQHPXngHefVLT/cXJUfXoseCOfGiErGS/WP43B0tV3619Mv6MwTdjPUovHEM3VE=
Received: from DB6P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::18) by
 DB7PR08MB3659.eurprd08.prod.outlook.com (2603:10a6:10:4a::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Wed, 30 Sep 2020 15:46:25 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::f3) by DB6P191CA0008.outlook.office365.com
 (2603:10a6:6:28::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Wed, 30 Sep 2020 15:46:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Wed, 30 Sep 2020 15:46:25 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Wed, 30 Sep 2020 15:46:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8b8bb225252066a
X-CR-MTA-TID: 64aa7808
Received: from d24111cfe72d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AD5CEEF1-C630-4B5A-A92C-05E53BCA4407.1;
	Wed, 30 Sep 2020 15:46:12 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d24111cfe72d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 30 Sep 2020 15:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCh3wsoTbWB3oeqql4VqIwrrUVzcOxhJatnOTzZC1miQKx1k29ZLX9U0uheXXZQSeWYfXoxWbL3AwQU8jomlpXBD01zxC8MPqpAG4R2XPGJU2HPaQLS832VDBEPuDpAeUaMWhSuj8FBwOohwOE5vS1TLTSm4Lc4unq0E4eQraoD2veVovVBV71plosfo7NakacSUr6P2sxbz8RWlqBOIzUmXmZux29h84Vji6qzSe0Y3HhGN9fLwKUd3u9jFTBK3+FMZle3lOCiZd6I5zvcgJDi8K2Zva8bVpw0zmlHJMVgT2HpAEVKyF0hn/Za6j9FnTcDXaMuwLa1S783NkSuKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fXLkKvlG1jVwzzb4tYrxAKOPe+wDWbyntmYZU3V3zs=;
 b=nqi0nx1Fken0KwjsmGt2Ly0z2caxZL9G9ZIR9wiN2Ya1O6bjeOPYCVUcsoPCbNZjyL5Fhcj0YV0AxtcCfxlkqehIrfxb7djLy7Wq+PctglEQAWfPXiJVlw8W8Y/AcMR0NEMivuL82PeIzmNb/1/js/LURTMSvepyLuUkxs4/klnNycO0zBIV8PoIXkhSz4RTEdsSmfXxv1OiYUqx3FdwZdlWKi+F7ojqjhriOkDgXcgO6mjIRaGWHI7MmTQGjE0qmAxwCjRxG856LaNR/gkY8JmNBgcBPkVVerJNwUb0p2ekfDwWiCjubWPXLX0tvGXRJzZnoBKI+X3GnhORO1LsRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fXLkKvlG1jVwzzb4tYrxAKOPe+wDWbyntmYZU3V3zs=;
 b=6qresTeqfb2Nle40CL2K//IuSl/Ii81/XszLJv97M/CsEKFP3E5AUmoLgZJtrKpFe5NiEz0iXz63KMelQ4GOmCPusnXRZNos6VunANjEgT+jFQHPXngHefVLT/cXJUfXoseCOfGiErGS/WP43B0tV3619Mv6MwTdjPUovHEM3VE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com (2603:10a6:20b:de::11)
 by AM5PR0801MB1921.eurprd08.prod.outlook.com (2603:10a6:203:44::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 30 Sep
 2020 15:46:10 +0000
Received: from AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71]) by AM7PR08MB5480.eurprd08.prod.outlook.com
 ([fe80::4c17:827f:bbbd:bf71%8]) with mapi id 15.20.3412.029; Wed, 30 Sep 2020
 15:46:10 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm-bsp/linux-arm64-ack: remove bbappend for version 4.19
Date: Wed, 30 Sep 2020 16:45:55 +0100
Message-Id: <20200930154556.38686-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0435.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::15) To AM7PR08MB5480.eurprd08.prod.outlook.com
 (2603:10a6:20b:de::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0435.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 15:46:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4461995d-4787-495c-6a3d-08d86557fd2d
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1921:|DB7PR08MB3659:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB365915F7613FB95842CF757A92330@DB7PR08MB3659.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:639;OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MPwZ0lqFa8V7R1LsSvcaLS7LW4uew951yJDTO92cdDsfW1F9ra4lm0xO6buEyXz+fbKzXc5VcOPnyFsNY7Kd0QRLBU+ZeS50bBOVvnKqg9XjuwFQWfidW0d4mcMlQCh1da5SkVkiaae1AWDhgSxXQCirjWJLI+XOEbStKbeCDP5A3re5tLP4LUdlKKywY9s4EcPyiT+NuHpGje3kYwurNPfl7/VGdXeUY6Gfn/OKCqaQBNjUDxFyTGwTvG9qAi1HMNFSr4vpHzJZvSmd6SVPVYzXLVDYgY/RdheDjex4xWigDQAyfkzYEkcNTgiLhfqJvypR0PMJbJWi5VxfE/Q2kw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5480.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(36756003)(6666004)(83380400001)(66476007)(66556008)(66946007)(86362001)(6916009)(6486002)(52116002)(7696005)(5660300002)(4744005)(1076003)(8936002)(186003)(44832011)(16526019)(2906002)(956004)(4326008)(2616005)(8676002)(316002)(478600001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Lui4BqlDFP4xaudZProMKxWjUEmTeGC0bMWXW8LKhl6trNB+sgj4xBcu5MKqbzSZ/+GkgqZObUWZ9P98AOesw8Z54G8BRfVbwkznIX6CcA8cbJat7up6YjfbgJ1IwdS5moKbbU8Cns3U6m7PiGsIIyLLNtQE7X0JV2Reuc1iIN5hUERxYRNsyWXk50q9cbW7IpXnNtZig89/pWi0oozRZf0HQmlcFtou9G9CF6USNQzD5vLjm6HPFnmdThbO7q4lsIPEem7qu0uu63naTojD8ReIkrYUq3a3beMaLIMjs/S9FYh5LTPV0topFDXB/VGv4lHmhgjCo1EgbDTALbVVXqfvTmqiAoDYXvtgzbXaK8bfk6GcRgPaQfbixJT6jNfV90F/niUecCgNlMExHeMNe9N5/MsYhqtqt6MM0E9A9u7lZ+93JD9M7LmsaC+cTL1fLURK4R16jyXNPu4BB3p4UzmjafnVCG+ZNmaSpZplLzg84Nm0U338Q3jFFbEIx5+Qc6DC71WGD00lcO7WGpJX513NDeMHuaLXLkiXDkl0iuqkdwZ0qKxU7VRWYd4g4ubc7QeYsrvmxOgEFJLq06vYVKQCcbtSlGk3HA/SWg/jEDUMtwFPUXz86kZbgRjw18dP3gjsH+tJCwynSaRhSoAFWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1921
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ebe432c5-be95-49b2-6a21-08d86557f3e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zaVPGSTefOuPW5jZL8ONn+Mz+P7Xl0+/fq2roRQqWmFv6+7UhMOt7R05vGqhSzE5nTP2as0tQR/+4BcyTSGXos4QIaBriXsrFTjo4DitS8OdiVcF50PP/hC3aTWTp3WisUVumACfHNZ2fFAudcsr4VeAbjNdNCPI5b63JL686UFbibUbG6T3ZjV8d97y47nM2yXJiamJDoY2jJa9yhuXO4wgDxrbrP3BLFzd5memfOPLe03CGGDLJgB69czNEPhwvbGO+Nmys3tDn6HNhHz+U2KSHH5Y4Z8XTRwVYp1mxDOAtvqAYHImDw9VR66APDMMnI3v9zTgG070dkc9rfJIrnt+oS8WREQJF0kOOfIdssAQKSKCJjpXBgUFyEovsC5ozKMk26a+Gl+J+RyxTpGEOYD4eboBeSUV8MxZKjuuBd6rOzBgndHIwLrH7PsRCB+E
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(81166007)(6486002)(4326008)(6666004)(356005)(47076004)(316002)(82740400003)(8936002)(8676002)(70586007)(5660300002)(2906002)(478600001)(70206006)(36756003)(1076003)(86362001)(4744005)(186003)(956004)(82310400003)(336012)(16526019)(7696005)(26005)(6916009)(2616005)(44832011)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 15:46:25.7037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4461995d-4787-495c-6a3d-08d86557fd2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3659
Content-Type: text/plain

This version is not used by any arm bsps' anymore.

Change-Id: I14b78e78ce05a50b7cd3428993de280b9394ad48
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 .../recipes-kernel/linux/linux-arm64-ack_4.19.bbappend         | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
deleted file mode 100644
index f765661..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack_4.19.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# Machine specific configurations
-
-require linux-arm-platforms.inc
-- 
2.17.1

