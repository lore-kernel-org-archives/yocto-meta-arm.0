Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.57])
 by mx.groups.io with SMTP id smtpd.web10.15137.1599550123468159218
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 00:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kTXgDDgi;
 spf=pass (domain: arm.com, ip: 40.107.14.57, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijzQpifxd2HfxCSKasRnx5jbN0kAtQYXGq2mhuwP5QU=;
 b=kTXgDDgiSj+aXxwM1dWw68vzWW8Xng7f7E+6Q9dQvncGHOkvAmndXbUIxDD+SmGumI6A3YjQx3+RBs+W+1d1fVu5Yr5BwTiJqMI20Xp2xrvb7l4MyIe/cSpUGEKezUnRjZfke+lTYin8uO+d3w+IExAxBpJm/hTZkarDhLYvT2s=
Received: from DB6PR07CA0080.eurprd07.prod.outlook.com (2603:10a6:6:2b::18) by
 VI1PR08MB3535.eurprd08.prod.outlook.com (2603:10a6:803:81::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16; Tue, 8 Sep 2020 07:28:11 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::3d) by DB6PR07CA0080.outlook.office365.com
 (2603:10a6:6:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.10 via Frontend
 Transport; Tue, 8 Sep 2020 07:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 07:28:09 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Tue, 08 Sep 2020 07:28:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ebd31fcc58a9f046
X-CR-MTA-TID: 64aa7808
Received: from e3cdd34cc9e3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B4E7F565-7956-4C76-911A-6A8D6DA3435B.1;
	Tue, 08 Sep 2020 07:28:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3cdd34cc9e3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 07:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/cRBEGbn5x7pw+CC+WtoBPn6bP/Fx0e7QzFsIIBPX1QKWSywqrLaj0Rkj9olYrIcZpjdwcDDcrN2jBDiDIBY07JwNxpW/bRtQR1vsEMVtPxYc6khYgSLyDE60kt3ok7vMnx/CAtJn9ZLX/V947xIw8nkpN6JDiJhmaiejaC71G4utI533jzcb56AEym8NTBXdvFHOIVfiOSaogTop+wzPox9NyaejgiiYE7EMvnLLmyfbp0c69ATdOkijciakRIvQJk3CQeTBzGQ9KsGrwcXWufekIOOjp+Vue1kgpDoGc1yMRiqP9LxxKV4/yuh4U3GK3IkJRlxlKzq1NFwFsspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijzQpifxd2HfxCSKasRnx5jbN0kAtQYXGq2mhuwP5QU=;
 b=aFinjH/s0uS1RlbDFqVkV9b2N8D9kCYPfAATEFBHKLAOibHWRvYNmWF/S9T7RwGqShaaXhOFqWHLCiFvFF7eZ8RnEpW+KX6KXYGsHeQxIk6nf6Dw5gbUoND1aY2vARP0GpNF2uV9FUT7FQ5sPDDYsFNVKZv+8R8UB1dxCvinayUFKFROt/uBs9yemvUUqjr8/K5P7ZdcJgJN/70Y65Yc9Q/8WQD3Q/RyR4eNCua5/sR4Bx2VwVQts84qBJ8NV0i0Ef6I7CnNEDMjOJN0Psy6m5m/MuzElRDODYAmMdVj1lxHfiYAoBdbzsMH/bjjjsJtG38727WA7T7YhXtFfjE+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijzQpifxd2HfxCSKasRnx5jbN0kAtQYXGq2mhuwP5QU=;
 b=kTXgDDgiSj+aXxwM1dWw68vzWW8Xng7f7E+6Q9dQvncGHOkvAmndXbUIxDD+SmGumI6A3YjQx3+RBs+W+1d1fVu5Yr5BwTiJqMI20Xp2xrvb7l4MyIe/cSpUGEKezUnRjZfke+lTYin8uO+d3w+IExAxBpJm/hTZkarDhLYvT2s=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB2964.eurprd08.prod.outlook.com (2603:10a6:208:5d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 07:28:03 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:28:03 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2 3/3] arm-bsp/scp-firmware: set CCIX speed to GEN3 to work with interposer C2C setup
Date: Tue,  8 Sep 2020 12:57:26 +0530
Message-Id: <20200908072726.18776-3-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908072726.18776-1-khasim.mohammed@arm.com>
References: <20200908072726.18776-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: DM3PR12CA0057.namprd12.prod.outlook.com
 (2603:10b6:0:56::25) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM3PR12CA0057.namprd12.prod.outlook.com (2603:10b6:0:56::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 07:28:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fd84117-b9c6-46d3-9e2f-08d853c8bcbd
X-MS-TrafficTypeDiagnostic: AM0PR08MB2964:|VI1PR08MB3535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB35354C1890E4A1A81DF364B9FA290@VI1PR08MB3535.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rvXVccy5h1ksNHbzAZ7986aMrgoi9Km3G8+mkuGkpWFfz/ZAQBVlMWdQUcTKJLXr/Y/VOeJI1lSX9x5Sfg7jLnALUWRcxArFJ8k96vcYi3EtZ3IIg5udTW6EID8FyNKn8K50z7hjwDPUoQFCxNzGR45CL355sHRuv2OedbK3jpOEHPIfbm4JPNdBFIYa+NicTip954di1eoaS+du6XrSsAdQ09zI0knaRpYyTgrH5vcfXA37c2OgiNQELwZEYZMXA1WNZ2+etSvuhA4uIFtOqv9CXP9hXqWw19aht8ndDzBQJr8ddfLyuAXeZL5GAPNt1zLIwRTJCzql2YUIwGxlLSgIpEDPn95WgJGSDUN9NTO5wK0+qYRHQzN/lAJ7TAn8cvKlTH6kd/q6k82SG5fY+FJpM6GxJCXarLIXK6Fr2ZH3qdMH5Yjyjx9TEkezGkAxhlWreJJWQZDBIuef4sCFNw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(26005)(316002)(8676002)(52116002)(7696005)(6486002)(1076003)(66556008)(2616005)(6666004)(956004)(66476007)(66946007)(19627235002)(4326008)(36756003)(186003)(16526019)(83380400001)(2906002)(86362001)(478600001)(5660300002)(6916009)(8936002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 jA+RS3PewSzD5J/+scyTx1CXTIouGQUoNBRmhTIAZVA+UfPikYgO7g0X+49+cuGywgD7G0i56DFqH1P081yBEynfyRwi2s4h8R8j4iNEWOzBqPIyR9NSpLddpHLUkZNUYd8DGrNMyVAC+X0EgWfpNhQGkDigCA4R5aY6BlhHkOHxo8EDqzANhom5TOGyWabv5VwVRiqie9K/35aJt55Lu7jZL+2hDnviZpyhzHq9IvVswJTvLT4iup7Zf2FQV+wC7W0r4JGluKQIILwKK7UtFo1qPuxbGb2NOzQ/bhMFlAr77xrl5JZEXh9u70F9EbWlZdU46SF8sbqETbm10BK3+ZNKEItm5ntk3korIcLBpdpTQieWy/KONSmDO5/cRDvBAr8JM00My9gAmlkSnY4ljNXmsyjVkz/FiDeZ6lz53dV2Ck5qibmWViBrGp8qeudv2wUEk2X8+S9WkzytPQXi63372r/bqAheZwzwXEkKzPZSa0xj8dw+T8EZOUcK1K5tddsFYYSJGVftCL4WxIDhYrJf/YvPIUoayC/rHos20O4GSnnM7YvOCv9/y7p03E5jm+i1mi4DPQ7pA4vlbxMLpbIw4csZFnd4EoEBvXHrP5vqBkRl73MAc/7qKLjD+7MgkLyRXpA4+dJNg+DKXFoqWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2964
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0cd8cdb2-ccc2-4bce-9cf5-08d853c8b890
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WQkNAvETPacNvOx2RDoJxAf/M9+3bfHfEqrUhmLXXRIkt/LKnKanoyZVA7mPViUypa61h3kOk94wfD/5km7Z9Oit7RAIO6aL/EHvYd7p8yeROkyhzc/iX6mdduJqvJr7LTUtjQevSOADL+uHs8nRQ+5Z7SXDX6esxU6YLhmCPFWYxsXXi3RgmyzzNFlwOWEpS3yfHeTAMyfVSNmOXPEso05Fi/yGzX72lScTaLC48yA3fcPtRuoqPn2CzD6z+7ALLpfRy6RnCe5Lxsiii7jMOfhQnLlWakI8Gs5S6/1cDvuBh1Asef5r+A0VZROcdJx8tprBAdclt+6SchQMjIH8v/2wNyQnd0GVU9gGelFCvU+RETGlKKLd2sQH6P7nkX2Te/fxBPStqCjamptxnT6nKn6R3Zk5F9M5Mm619G4IDSMz7KuU2T++L4+co1kk3waIfkujOaRc8VGk2B+zdUeeTlK5FsqBlgUpe0A9GXP4zDUFRBRCZ7oi2TiptAVuGn9H
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(2616005)(956004)(86362001)(7696005)(2906002)(6486002)(70586007)(70206006)(36756003)(4326008)(316002)(82310400003)(26005)(478600001)(8676002)(6666004)(336012)(5660300002)(6916009)(1076003)(19627235002)(356005)(186003)(82740400003)(47076004)(81166007)(8936002)(83380400001)(16526019)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 07:28:09.7933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd84117-b9c6-46d3-9e2f-08d853c8bcbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3535
Content-Type: text/plain

Set CCIX speed to GEN3 to work with interposer C2C setup.
In this usecase set downstream/upstream port transmitter preset value to 4.

Change-Id: I9795a46d9a349dc2813a4ed92944a481c0a2498e
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 ...t-CCIX-speed-to-GEN3-to-work-with-in.patch | 85 +++++++++++++++++++
 .../scp-firmware/scp-firmware-n1sdp.inc       |  6 ++
 2 files changed, 91 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
new file mode 100644
index 0000000..fbc04f4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/n1sdp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
@@ -0,0 +1,85 @@
+Upstream-Status: Inappropriate [will not be submitted as its only required till hardware gets fixed]
+
+The patch is picked from git repo:
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree/scp/0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From a6d545cf9b6c46f2ea415d64fa81eb4771cfb51c Mon Sep 17 00:00:00 2001
+From: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
+Date: Thu, 28 May 2020 16:19:12 +0530
+Subject: [PATCH] product/n1sdp: set CCIX speed to GEN3 to work with interposer
+ C2C setup
+
+Set CCIX speed to GEN3 to work with interposer C2C setup
+In this use case set downstream/upstream port transmitter
+preset value to 4.
+
+Change-Id: I16e72a5eaa105386a64ab4ffe56f67134c670313
+Signed-off-by: Jagadeesh Ujja <jagadeesh.ujja@arm.com>
+---
+ .../module/n1sdp_pcie/src/mod_n1sdp_pcie.c    | 33 +++++++++++++++----
+ 1 file changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
+index 19fa5a5..a93e6cc 100644
+--- a/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
++++ b/product/n1sdp/module/n1sdp_pcie/src/mod_n1sdp_pcie.c
+@@ -206,7 +206,13 @@ static int n1sdp_pcie_phy_init(fwk_id_t id)
+     if (dev_ctx == NULL)
+         return FWK_E_PARAM;
+ 
+-    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
++    if ((n1sdp_get_chipid() != 0x0) ||
++        !dev_ctx->config->ccix_capable ||
++        pcie_ctx.c2c_api->is_slave_alive())
++        gen_speed = PCIE_GEN_3;
++    else
++        gen_speed = PCIE_GEN_4;
++
+     lane_count = LAN_COUNT_IN_X_16;
+ 
+     FWK_LOG_INFO("[%s] Initializing PHY...", pcie_type[did]);
+@@ -239,7 +245,13 @@ static int n1sdp_pcie_controller_init(fwk_id_t id, bool ep_mode)
+     if (dev_ctx == NULL)
+         return FWK_E_PARAM;
+ 
+-    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
++    if ((n1sdp_get_chipid() != 0x0) ||
++        !dev_ctx->config->ccix_capable ||
++        pcie_ctx.c2c_api->is_slave_alive())
++        gen_speed = PCIE_GEN_3;
++    else
++        gen_speed = PCIE_GEN_4;
++
+     lane_count = LAN_COUNT_IN_X_16;
+ 
+     if (ep_mode) {
+@@ -282,12 +294,19 @@ static int n1sdp_pcie_link_training(fwk_id_t id, bool ep_mode)
+     if (dev_ctx == NULL)
+         return FWK_E_PARAM;
+ 
+-    gen_speed = dev_ctx->config->ccix_capable ? PCIE_GEN_4 : PCIE_GEN_3;
++    if ((n1sdp_get_chipid() != 0x0) ||
++        !dev_ctx->config->ccix_capable ||
++        pcie_ctx.c2c_api->is_slave_alive()) {
++        gen_speed = PCIE_GEN_3;
++        down_stream_tx_preset = PCIE_RC_TX_PRESET_VALUE;
++        up_stream_tx_preset = PCIE_RC_TX_PRESET_VALUE;
++    } else {
++        gen_speed = PCIE_GEN_4;
++        down_stream_tx_preset = CCIX_RC_TX_PRESET_VALUE;
++        up_stream_tx_preset = CCIX_RC_TX_PRESET_VALUE;
++    }
++
+     lane_count = LAN_COUNT_IN_X_16;
+-    down_stream_tx_preset = dev_ctx->config->ccix_capable ?
+-                            CCIX_RC_TX_PRESET_VALUE : PCIE_RC_TX_PRESET_VALUE;
+-    up_stream_tx_preset = dev_ctx->config->ccix_capable ?
+-                          CCIX_RC_TX_PRESET_VALUE : PCIE_RC_TX_PRESET_VALUE;
+ 
+     if (gen_speed >= PCIE_GEN_3 && !ep_mode) {
+         FWK_LOG_INFO(
+-- 
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index 818b416..efa3acb 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -4,6 +4,12 @@ SRCREV        = "350be71a2ecef588b8ff5a095a0840de23506e45"
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
+
+SRC_URI_append = " \
+   file://0001-product-n1sdp-set-CCIX-speed-to-GEN3-to-work-with-in.patch \
+   "
+
 COMPATIBLE_MACHINE_n1sdp = "n1sdp"
 
 PV = "2.6.0+git${SRCPV}"
-- 
2.17.1

