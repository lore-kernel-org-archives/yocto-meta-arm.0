Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.82])
 by mx.groups.io with SMTP id smtpd.web11.529.1592326581700136995
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 09:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Bc27+eH3;
 spf=pass (domain: arm.com, ip: 40.107.3.82, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/4+j7A87ixWn2UXpVHZ10SZtACHxhDEOk66uTMqT18=;
 b=Bc27+eH31YywiO9l1dpDboRR5KiuXUS199KhPvXKgN9ggywMb+BzpdeWRw1WiqWzYfq/KsBwfxZyOTWebAgiljNNgf+TyCoZdPE0ydypyQGrjd9eliU+ut8a2BJs436QwHjlVcW/b8WbIF1i6jIJKg3gE6j/zdwflG4sUK1OH4k=
Received: from DB6PR07CA0055.eurprd07.prod.outlook.com (2603:10a6:6:2a::17) by
 DB7PR08MB3499.eurprd08.prod.outlook.com (2603:10a6:10:4b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18; Tue, 16 Jun 2020 16:56:19 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::d7) by DB6PR07CA0055.outlook.office365.com
 (2603:10a6:6:2a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.7 via Frontend
 Transport; Tue, 16 Jun 2020 16:56:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Tue, 16 Jun 2020 16:56:19 +0000
Received: ("Tessian outbound 2159a7a0a0b6:v59"); Tue, 16 Jun 2020 16:56:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43c4cdf7ace1534f
X-CR-MTA-TID: 64aa7808
Received: from 861e6255e847.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CAE29A8C-3029-42E1-83F4-713FF2F380C4.1;
	Tue, 16 Jun 2020 16:56:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 861e6255e847.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Jun 2020 16:56:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNvd1+aWK2OJkHRJVv119dUVipn9MZacEoU2bWF4FebxoW+WFPg62LkueHQIooSHHN+56yDCGlROTG0crIMgwQ0Oy2w5NJFlHr2sWu+p9A4lciayErpkbFBHzUtCfFn6+Gr7uNU9FS04xGgQscdtWccqP/ucpYmATg+T9BavZX3+T3WeWT+cB+/S3emXzuu0Dk/2YemGLNn4wfMA1EU3wrfDqH7zZIvpRKq2RNCt4a/FFwCkNyJ5t/x4BIWLW7D0FCSOn/8kBYVZMBGIdUjCeN2vydUuPyMw3/zwZKrkSC3HG/pRj3tw7oEQUgOFzTISsQEyHNa3ggMLLtEemt0XfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/4+j7A87ixWn2UXpVHZ10SZtACHxhDEOk66uTMqT18=;
 b=XSkYUi18WSByPhu/4soqEpVSycg/BoyKHayh0UJPrfWTu3Eeo+oZm2k6v5zHVBPUM8g6mKVxRvzHfrehqL9uqWPLt/WxYvSxJqbCqjIwU31UtquVKJFjb4WQD4Wbg5uanPMYU2CV42PGjGEHUujtkMcgglCNA3HhfcpqsDdzL/WGShyq43Khg8zkg0GmTNqmC+m2Wuwjs7pS6bUYqrZUZbTQgsJESSNnuDTy/NI1NGHsG+semNEXIqqR2CXAJeHWTR9MYM6VY3dI+2MwgLeX71IPRd+eKH1J8ay6VSiEazPx/yO8XaSu6tD4xFhz8ZwOLCJtaVgmRfaGSLRTH31DrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/4+j7A87ixWn2UXpVHZ10SZtACHxhDEOk66uTMqT18=;
 b=Bc27+eH31YywiO9l1dpDboRR5KiuXUS199KhPvXKgN9ggywMb+BzpdeWRw1WiqWzYfq/KsBwfxZyOTWebAgiljNNgf+TyCoZdPE0ydypyQGrjd9eliU+ut8a2BJs436QwHjlVcW/b8WbIF1i6jIJKg3gE6j/zdwflG4sUK1OH4k=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB4169.eurprd08.prod.outlook.com (2603:10a6:10:ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Tue, 16 Jun
 2020 16:56:11 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3088.029; Tue, 16 Jun 2020
 16:56:11 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm/edk2-firmware: fix passing of linker flags
Date: Tue, 16 Jun 2020 22:25:58 +0530
Message-Id: <20200616165558.31239-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::29) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Tue, 16 Jun 2020 16:56:09 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 716a90d8-c5d3-4b16-34a9-08d8121630ce
X-MS-TrafficTypeDiagnostic: DB8PR08MB4169:|DB7PR08MB3499:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3499FCF2CC599A817E716B14FA9D0@DB7PR08MB3499.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;OLM:1443;
X-Forefront-PRVS: 04362AC73B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lhkQXbQY4tpPGuBd90mRufO/aunriK/c+jRXuX5lUnSiiWrkLcNPSflxl/2rLDTah5GrAC8Z6YBuG7DLII46DNIZkIYHFmnWdUltzJ+BmHTlubMajHAczaA5CuuKLzStpGrk5Tz1SW4g9ZQTXlesMFJs5F9qnnwx+gYUMDq0aBL4SSBv6cOG7bObnX9PU42gb7yXKhddghhvWOvWu/ukqA9pM7OGR4hP4Z1YmP5BDccJryFObsFEs5Ml/ERDyuYv8RiQc4yeU7CqhclyYac1ft4EyzxMRDNv/9g8nJZUt+/f0O6fuNAAMCkyvVwBELOi
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(316002)(6666004)(86362001)(26005)(66946007)(8676002)(6486002)(2616005)(52116002)(66556008)(7696005)(8936002)(956004)(66476007)(36756003)(2906002)(6916009)(478600001)(5660300002)(1076003)(54906003)(186003)(16526019)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 wydyvaEflxt1tYdMxNW51iNhCo1wSyuwWPiRUC+IWsbWIYXinp25ybLR9Ta4xCQVw84RV7NA7+ZzFDuyVfzkGYsEY7Ep/oZJ+7Rz6BHnSkJheTep1K3b3zX8jnIXIz+a9As91iL196iLqpJRzWPSoE5Bs6zlWmzmlmWS3gsJFRT7VgULGG4Q4IoR3RlmcM0Dd+A8b9PmCEkrOMvxxsc+M4IHfnyJU8WknbZqHNMGv6+4sjEvgJyEEFKMBVW7Kj5OaHsCu7iDRIYXOBKB8CsmB+eFbuVkflYp/q/bkkdBAzBr4KNnd1Q/FfLJ7hzeltzabtCH+uAf3oADv11JCUoZDg4b9tNXXH3ZTuWudEGZ7qjj+LInyRCGXIEK5M95WmqYIlpXh9aIq+jJeHYicdrdZD8LqMUgOzTNCTqGhLrYj+NY+JzWgPQZiPLIfHNmrZ6r24ZEjzm8W71rFFE1uhOp6jCGy/DP/tlgeVhl8y754AerMjvG1FA7x2HgRjjYEiDN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4169
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(2906002)(47076004)(1076003)(478600001)(54906003)(6486002)(6666004)(316002)(82740400003)(8676002)(186003)(16526019)(8936002)(86362001)(82310400002)(70586007)(336012)(70206006)(81166007)(956004)(2616005)(4326008)(36756003)(356005)(6916009)(5660300002)(7696005)(26005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4271d03c-3b7e-40df-5b69-08d812162bc1
X-Forefront-PRVS: 04362AC73B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0fh7GPSpKmY+h5V1DtdwsskDJk3z7mcQYHx86K9rgs1Lu1FLRNB79jiKInuZ1hFDjep1zPRCJBZVue3HXnisUIV9VoISnN1eN1XhU2DySPNqVB10vggc4/XbzK660/iGOs7ZudFhXUPumpUAjvSTMva+PIi3f5XbPN+VmvCXC+cFmOYpPSZiAPVeVYKawQuY9ooj0iDwLcGsREbgQLwvVPzX5bjguGTA8qddmz/x+qwo/Tu6tynabsdlk6VuPrkCjLzeN0goOlNQR26GoqOju6jfmoizxJhfrmSNrG5lCYqO156TNXASEtuUjDCLARhelmHJvYLH+y+qOY8nM9Ijv5u1jzF/NBLH0Tfb5gnF+EBrv0YxX0HgP+lKbC2oRrIwmQcuhVHpxT9s8JquCW2lvQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2020 16:56:19.0256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 716a90d8-c5d3-4b16-34a9-08d8121630ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3499
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

