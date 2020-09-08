Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web11.11961.1599532666037474532
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yaY/ZYkh;
 spf=pass (domain: arm.com, ip: 40.107.21.51, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijzQpifxd2HfxCSKasRnx5jbN0kAtQYXGq2mhuwP5QU=;
 b=yaY/ZYkh6KA1bjdn7Tv3QubC4ogm4zMS+PFkjm+ZKHAxYn5Q147epSqe6nM9eOGTeZZMv8MQ9RMjfQ2EsTTUs6efaxmdRBMBDRr+wgyJGn8iLnhUCtmJ9HmOHVFQVyINd7Miot8sTbtpN3APRT74nMkUyayADRH2yA77C2eJ8LY=
Received: from AM7PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:20b:130::14)
 by DB6PR0802MB2232.eurprd08.prod.outlook.com (2603:10a6:4:83::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Tue, 8 Sep
 2020 02:37:43 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::be) by AM7PR03CA0004.outlook.office365.com
 (2603:10a6:20b:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Tue, 8 Sep 2020 02:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 02:37:42 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Tue, 08 Sep 2020 02:37:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6dad9501e34e6c2
X-CR-MTA-TID: 64aa7808
Received: from 324cca98ab38.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 24344C2B-F744-47CF-879F-1D584E6917B4.1;
	Tue, 08 Sep 2020 02:37:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 324cca98ab38.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 02:37:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFXV1GcCtt5wfUzsfEIiyM9BFDCT6mdaiV3k6CmuIZ/9C1MDCQVMbL5y/5xnVRhpmAjuYHjuz7WERP6XaSjMQhnYKEBPJ/xJReyQV5AT4gHjeuNH+mZIZjBbj4P6W70homNAT9qZE7zbg9f2RFyNl/r84BcePZ0S4TfvwmCJmYGLu7GOyffI+XnoG/Slva77NYiDDFJ8ixan8I8H2q8fdO4v4sT/2eD5Cu6nYi6UEkvgarNoRgdSdRz2W8xqmFvtfsG3ubumIKD9EOlqiFwBs5MmFQav6Xpj+I8VyJjqcxJGhIfyjH/xxVT5PK1HaDIBGnjikZHuGx5qkvEU3ljGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijzQpifxd2HfxCSKasRnx5jbN0kAtQYXGq2mhuwP5QU=;
 b=KN3cWyn3YGo3lR+6eIW8IlFjk/rKJj1cibXib5mcHjO/PvuIzjbaUYfxlRRs1vgpD2JJlXhg2TUbAV84UZTLSqIPacH/Zp8lDkfoKRN6v50k1S8uiSxPswWTZqL3q+2DDqisYCjRxO2vFM/a6Hxwz3HdDR1S8aJW+btfGA8l+37n2zQdxhusIUdH5Cz0ma8T/FiXBZn0j0dxxN4Z8uovf+QM0kM/JXnR8Juyv+XYF9anlKdSMtL/YbtZISqM8XalnYlDcdHeAkFM7A/T37XdX1fEiPg38JpnlN9D/M/jvsTehrO3Z1OENJE3kwBmSso0BZQBTrl1BfOxSWeOAArJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijzQpifxd2HfxCSKasRnx5jbN0kAtQYXGq2mhuwP5QU=;
 b=yaY/ZYkh6KA1bjdn7Tv3QubC4ogm4zMS+PFkjm+ZKHAxYn5Q147epSqe6nM9eOGTeZZMv8MQ9RMjfQ2EsTTUs6efaxmdRBMBDRr+wgyJGn8iLnhUCtmJ9HmOHVFQVyINd7Miot8sTbtpN3APRT74nMkUyayADRH2yA77C2eJ8LY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5604.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Tue, 8 Sep
 2020 02:37:36 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 02:37:36 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH 3/3] arm-bsp/scp-firmware: set CCIX speed to GEN3 to work with interposer C2C setup
Date: Tue,  8 Sep 2020 08:07:17 +0530
Message-Id: <20200908023717.9025-3-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908023717.9025-1-khasim.mohammed@arm.com>
References: <20200908023717.9025-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::24) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.53) by BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Tue, 8 Sep 2020 02:37:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c36cddcb-39e5-45af-d195-08d853a0297a
X-MS-TrafficTypeDiagnostic: AM8PR08MB5604:|DB6PR0802MB2232:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2232D745F730905D03EF84E1FA290@DB6PR0802MB2232.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NTSHxqoLjA/LnUEZ/Qr6vAMR7DnYBewnrLY6KaWxxZMBedewwRQ3DViFk0BOamO3GUQa/DoXM5uxfTBCoC+9EtVuxiIFM4i9UcgvfBCycAJTyM1SYRaa3c2zE5ccutTI3Hw6ME9AuMln9y5MGCRIB2Kbx5h28Kp2OP3T0NgCoFwASi+h3Me9w/qzIYNDpUu0kxIjgM880CgOWk/2vJzeQxbpuNFvfxPqGCsMjODghsWS5c7i4VvXJb3Q9NMDDtkQmhnOgFv1S2YY1UECunoHrCYc/JsLl2U2YtrTgCHowAyOSaaPXdkIhCIhut2UTbleyoDVyJ1uabsqByJ11YgO4C3dK3AdiL+aGOTFWN/8S/ZYzO4z2vrBjP9n8U+nWCSDGaEaOeCeJrmr2yFOJSt4v4tcpO0XIczxRq5Uuq8uvZoe0rtdlQ5r/EWEnETQD2uqRH+lHFYK3mFk7pLgwxQPoQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(16526019)(1076003)(26005)(6916009)(19627235002)(186003)(6486002)(956004)(8936002)(2616005)(4326008)(66556008)(66946007)(66476007)(478600001)(83380400001)(86362001)(316002)(6666004)(36756003)(2906002)(7696005)(5660300002)(52116002)(8676002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 +fj77ghGQI0qHE0dfWVdW17qIFwiPWbk/puuuIUxD1Qrq0O2Z30E+Qh5g+ScBd7ee1pawrZrUuaykH7J8Hfg9xuS7EWYndtUroksYjkyrc2wTDqKeU/HZJjv1LQGFzoVNJA6xSYv7rJ4J630pDBLG2OoACl+k8aCHmI6sCKhRAQE0xmFq948xEtTstqRlMmdpzxRqJO1nc/DRONZpLwq3lQO8XwQZeTYZLpJzeDFS0wWkSf+kSjg6r6uKrTNkjaUsRfPPIjbqqUYXC3OCVOxwGpTOWo3Z36joYNVVYE/G38/W9OCKP5dVZVF5HbuqtcdXaSahctiBgfL/TzjqdEuG9RHIVLSzMgmH7MbvQp1k/KZrbWhsee6t54peFxjdnfMDtNZ5AvDVPh2rAkpUjchRAKJklnNfZwy1n/5xJYyq5Rips+sP5uPDD7RdR6SR+BP96UKlO0yzkWRinuzYvdOhJIk3Kzo0tWZOc5jsNOdpnmyCP71jQFXbSJBQOgrARZNUA9H0OfDKDqHmtFnatjHg2DWwNWKKSHh5YUzE2s9jGvQZ/Z3Xf7/XZIGK8/POK8AOrSSQ3DoLpnDF9rBZt4M2fqDKh1Ux2E+T96wszO9ti8whT3iEXstKeuTjgZ25j3lC6KjreEV4hTKTwVtNJ//oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5604
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2c721bdf-1e92-4122-0ea5-08d853a0255c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	crmoDklamara5I+/oJMKoNvYB4NmWZ/0dykg155qsQCixVZcudhL1OEIiXxv1XNUxF6qHx3FmJ49WKRWzAGTDVntRA6QeFAf0fPKkqOkimKCOdixHbpk6uLtC4goKih1zG6wMd5y1YWGtDuO5Zjb9w6S/oD2gP2x41iOAHDxg8VY89584SHgCqB2NQ5z3eSD2IRCVlQYSdWlpyvEJKOqIo6HXsIoXSa1eskNQ03D/MSM/fByEs2VYRxB6X91mYfSqv0CZH9RHq22IqNMXnhAODpnrvUsy+Te4ijVAlAvuk/Ljt2BeJg9poly9WcDLi/u99yaNHuh/29CdDc16fB7y9XmtiNLLyh9FKuC9/b7s4VzTqBNSyQ89oml3sw5OC4wCi/B2qSHNVboJhLHuyknrkro2Ao1r3nsHyr17xQoWXZdCmr1ZO+OW+w4eDk21w+CalEhQnGUK2rYR7dCaKdpsIa7nv8RYbLNP7Un4MU2XLVsMj+M5kqRFnF3hg4Uvc3m
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966005)(956004)(36756003)(86362001)(6916009)(82740400003)(83380400001)(19627235002)(82310400003)(7696005)(336012)(2906002)(6666004)(70206006)(70586007)(81166007)(356005)(2616005)(1076003)(186003)(26005)(4326008)(6486002)(478600001)(5660300002)(8676002)(36906005)(316002)(47076004)(16526019)(8936002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 02:37:42.7573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c36cddcb-39e5-45af-d195-08d853a0297a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2232
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

