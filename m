Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99243C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:57:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web09.10818.1642766230360989025
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Jan 2022 03:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=0guWlrcg;
 spf=pass (domain: arm.com, ip: 40.107.6.78,
 mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9npdKJyVQLXn8PU5tvZTTwR8VO8757YEdEwxrHSGO0A=;
 b=0guWlrcgtDo0JvFVQC1vTzCLdz+5NUp0BZ0LtvQuoK632MJQ3Og7uGHjZx7OvMWioBzye/mHmA6uj1fBcIRyPuvjpl5AnXOv93PsXc6QSajGJC4HMkr/TLh8HxnydStnJiEwIPDHdyWbAYHbiF9zwASTvyFmOePwMCnfo5vV26E=
Received: from AM7PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:20b:100::25)
 by AM0PR08MB5108.eurprd08.prod.outlook.com (2603:10a6:208:15e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 11:57:07 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::cc) by AM7PR02CA0015.outlook.office365.com
 (2603:10a6:20b:100::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10 via Frontend
 Transport; Fri, 21 Jan 2022 11:57:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7 via Frontend Transport; Fri, 21 Jan 2022 11:57:07 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Fri, 21 Jan 2022 11:57:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 274ac4bfae1896fb
X-CR-MTA-TID: 64aa7808
Received: from 97c92d90e5b5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1D1D68AB-652D-464E-8078-CE4CCA9EEEBE.1;
	Fri, 21 Jan 2022 11:56:59 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 97c92d90e5b5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Jan 2022 11:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1jg1ps1rj33/rQtMbf0HdEJbMiO4ufxDUFbvjO95TQ5NWVtlswQhSkR3vjT8OvuuAwt7vM8r5rxtuJJIs9bF7iz6cdsx3Izp06cibBrb0agVtXXeuk6y+7HLcFP1bNC4oBv+2EdKCvqdYhoPHkX49ZaHpYCdPv/1WcsJLKyisn2sX7a+oqlgHLDCXhoxaLrb2lDo2Qv8MdwncKVAJOSyXvi8JcADGdiszgV3brXexIfrjNnTFry6XZ7MyYVqg1h5qGrgW7knSQn2awS+D3XIKqGTSpFapbkBEFJYLTnSUuqZG+q3EYH6JI+llBe6e4UUZPqBwpXMLP/Kwgi/KoryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9npdKJyVQLXn8PU5tvZTTwR8VO8757YEdEwxrHSGO0A=;
 b=H25fqHPG1vsWeeCLycRn0TJ968jEz1Eid5bqxrGSqmr/AQc34g4BRUiZGDLOS6vQ7Bn/syibi+5iz44EDjg7x8w9VmFI7L3nIOY58PZrMS0bTDL2KO+e/yIPGBZJi7sytN7FIG59hSPbTLwVuKsWhh6/63ycd0d3hggB0KCuqA6G/etqfhzuUEu448E2eiJOKlZ19Ql4qzKD0VgbkF79Oz2tyUJ6tkXkP4R8D3wYPaT8eQYsrUbKAdEbxmiYNqI3e6xmXzpKpmrKOem1//0Qq4w8fKrWa1AdIHhLzf4Bm74CW5a5CX3gzZHQLMQj34+3jOmjjLcom0TlYI0TAB9uGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9npdKJyVQLXn8PU5tvZTTwR8VO8757YEdEwxrHSGO0A=;
 b=0guWlrcgtDo0JvFVQC1vTzCLdz+5NUp0BZ0LtvQuoK632MJQ3Og7uGHjZx7OvMWioBzye/mHmA6uj1fBcIRyPuvjpl5AnXOv93PsXc6QSajGJC4HMkr/TLh8HxnydStnJiEwIPDHdyWbAYHbiF9zwASTvyFmOePwMCnfo5vV26E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by AM0PR08MB3075.eurprd08.prod.outlook.com (2603:10a6:208:5a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Fri, 21 Jan
 2022 11:56:57 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 11:56:57 +0000
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 1/3] arm-bsp/optee: add patch to support higher DRAM on TC
Date: Fri, 21 Jan 2022 11:56:41 +0000
Message-ID: <20220121115643.485616-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::16) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c36361a6-989d-40e9-0cfa-08d9dcd525f5
X-MS-TrafficTypeDiagnostic: 
	AM0PR08MB3075:EE_|AM5EUR03FT054:EE_|AM0PR08MB5108:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5108D190F6D4CF8650FEFC16FB5B9@AM0PR08MB5108.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:222;OLM:222;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 d2EwfvQ9BuBZi+f9/YeRl3AzhggzvJ2C5I3H1CqHOXZAsLykpXKN0amm6E8Ycxp2VA0s1D3vLABG5B2ORDBywWo32MJTSpAYCkr49+T+pUlOIJ+V1LWsMYzNFcrtLKJRpEIKgBczFIzCqA0pakJGT8zQ3PzREKm0FLnKqMq9qxwR80AXMVmC0I0nywQTSPsr78ddI+MQVxlyi5y0XyCkbVSFA6VgSDxLBbptH+aAyIPwUXk0aOiE4UzAvxrgJP+KavSRmWFvMVX65SKr5ggJov9OeLh3oz1pMVLgmZ5zVRmsO/GHMmkwybmmX6qY44iaF9uZaImqnb4Q6cDmUPXAXjzzkxBXWytRbeE2/MynFJCLgq0CAGagH1S62TI7akp7vjt90ABlrBHwYwAnzvCgXIYC/kR9QbpVlXuhdh8GyyZ7jb+Tt6DcZ3JeP7+gurU2HZLsjLfV/wRY+iFbQ+LzfqouTe+VqLLLCYfBTN8Q9eF1aQ+JFx8IZm0v5OiGLGkKaq9tXe1sqddXaFE04q6H7oWxbzQKMZXPg2XJ0vowcltoFsK8rk56IqONiqLf85RwlCjyQ/+tfNFpF3iB8qZIGWXaWjHfqt2CqQ+gi0SkfAeNQ9ABJxY6cKbqW+eJMsYszW8nCA32KX0yQyNvsuuN1csbcI7AV/n2tnyn3To6pIms/7DWN3D7IvCXAjKz2KpnmAOOonHtcISdjc9NQRuP+nHaA51eZB6FNWAEbXlmeGWTdp9DTUJdLC/sjSMG6J6IvKJ7H5ff3Z3xpFzodMQ0pJrgOwQYYj0RWE098IEjBMw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(44832011)(86362001)(186003)(26005)(6506007)(6916009)(1076003)(36756003)(8676002)(508600001)(52116002)(83380400001)(8936002)(6666004)(2906002)(5660300002)(316002)(6486002)(6512007)(66556008)(66476007)(66946007)(4326008)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3075
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d99e314f-80db-45b0-088a-08d9dcd51fbb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pZeF1Sk34eYlwytm20yv5h2FpKVblRCwZ3iOsKQaagpvig8V7jOjRCSvpjd55tFkpmPYJ56xlPdchYoa34ayKq1qVhOtzWjBwRxkUu0ZmRGuo3GWls7pz8386QJ4KLiKSrLADw9WDf7+N5xuQNenGLD14D85uPp+xpFWujQVVg4aEvoyJv1sBepavoy0O3TP/kbzTa2KQ2BmdYD5sYpHugVodZDhXEfOqlr+K5WwmMemYTVl4XxjOmZXN3y7MRCiqvoHJFX1JXGYCU5dqUc+4Tlpm/BxWUuWn2Ncdpro+I5pdkoo+vB0jzkaJHuzbA7UoGjZdtf/Gr+Qc/7bDTJ1BPjhCr+NNzjrEumnPD2IluYwui19U2G/fOCOwaudjhVdgHLE547HSTEWy2/+2WIiUQ/xD56b8QUWm1W/J8Hor5qzTIlzMdbvW0kbFXO9+kjpTk8oWgfAn+68DjNTzRnG00WD7lu44kEl0AHPu+L9FmRVlrQSMuUWxNvAsYlrRmtKtXWwohf8cDaDTsAt1bUCiyXNkHBVq98XFbBFiWFOyH2pe+vzPq9MOha/XIO8YQzccF4WqgUsFSycaLdojahaj0bWd8x3jVOJqBcfOTPZ6qAZCjQu1Sm+6w2/e/DceO0T1sSp104TogWuUz0kO1QqvDn6Mmn4M/IXXZuquo/hKAiKb3rBVLxqe7U/YAAgIjUcz+1Iziq+uz8wUZz5BhaRgq/5sKtGN2UKSk26/Ix9ikhi+X7x3Ppz+WlWQCtBubkmlGkozazMXrH1CW9LFUL2NjsZF0zRdYLKMoENbdiAhKI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(2906002)(6916009)(1076003)(86362001)(83380400001)(70586007)(70206006)(26005)(6486002)(4326008)(2616005)(8936002)(81166007)(82310400004)(508600001)(356005)(6506007)(186003)(316002)(47076005)(8676002)(44832011)(6512007)(36756003)(36860700001)(336012)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 11:57:07.1972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c36361a6-989d-40e9-0cfa-08d9dcd525f5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5108
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Jan 2022 11:57:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2887

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I54831317126b27e8635d941dce321df8471301f1
---
 ...ction-ID-according-to-FFA-v1.1-spec.patch} |  0
 ...e-UUID.patch =3D> 0003-Fix-optee-UUID.patch} |  0
 ...lcompute-add-support-for-higher-DRAM.patch | 60 +++++++++++++++++++
 .../optee/optee-os-generic-tc.inc             |  7 ++-
 4 files changed, 64 insertions(+), 3 deletions(-)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/tc/{0003-ffa-Upd=
ate-function-ID-according-to-FFA-v1.1-spec.patch =3D> 0002-ffa-Update-funct=
ion-ID-according-to-FFA-v1.1-spec.patch} (100%)
 rename meta-arm-bsp/recipes-security/optee/files/optee-os/tc/{0001-Fix-opt=
ee-UUID.patch =3D> 0003-Fix-optee-UUID.patch} (100%)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0=
004-plat-totalcompute-add-support-for-higher-DRAM.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-ffa=
-Update-function-ID-according-to-FFA-v1.1-spec.patch b/meta-arm-bsp/recipes=
-security/optee/files/optee-os/tc/0002-ffa-Update-function-ID-according-to-=
FFA-v1.1-spec.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-ffa-=
Update-function-ID-according-to-FFA-v1.1-spec.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0002-ffa-Up=
date-function-ID-according-to-FFA-v1.1-spec.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-Fix=
-optee-UUID.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0=
003-Fix-optee-UUID.patch
similarity index 100%
rename from meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-Fix-=
optee-UUID.patch
rename to meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0003-Fix-op=
tee-UUID.patch
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0004-pla=
t-totalcompute-add-support-for-higher-DRAM.patch b/meta-arm-bsp/recipes-sec=
urity/optee/files/optee-os/tc/0004-plat-totalcompute-add-support-for-higher=
-DRAM.patch
new file mode 100644
index 0000000..293ea7d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0004-plat-total=
compute-add-support-for-higher-DRAM.patch
@@ -0,0 +1,60 @@
+From 7fb6d720a285b6135a9247b2adde833ea90e2549 Mon Sep 17 00:00:00 2001
+From: Usama Arif <usama.arif@arm.com>
+Date: Mon, 27 Sep 2021 19:58:56 +0100
+Subject: [PATCH] plat-totalcompute: add support for higher DRAM
+
+The new 6GB DRAM bank starts at 0x8080000000.
+
+Signed-off-by: Usama Arif <usama.arif@arm.com>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/6d843=
0f943e091282849b188fbc0847c159e5de4]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ core/arch/arm/plat-totalcompute/conf.mk           | 2 ++
+ core/arch/arm/plat-totalcompute/main.c            | 1 +
+ core/arch/arm/plat-totalcompute/platform_config.h | 3 +++
+ 3 files changed, 6 insertions(+)
+
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
+index 558b7889..e894b1e1 100644
+--- a/core/arch/arm/plat-totalcompute/conf.mk
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -24,6 +24,8 @@ platform-cflags-debug-info =3D -gdwarf-2
+ platform-aflags-debug-info =3D -gdwarf-2
+ endif
+=20
++$(call force,CFG_CORE_ARM64_PA_BITS,40)
++
+ ifneq (,$(filter ${PLATFORM_FLAVOR},tc0 tc1))
+ CFG_TEE_CORE_NB_CORE =3D 8
+=20
+diff --git a/core/arch/arm/plat-totalcompute/main.c b/core/arch/arm/plat-t=
otalcompute/main.c
+index 42acf8dd..eab237bf 100644
+--- a/core/arch/arm/plat-totalcompute/main.c
++++ b/core/arch/arm/plat-totalcompute/main.c
+@@ -27,6 +27,7 @@ register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_=
DIST_REG_SIZE);
+ #endif
+=20
+ register_ddr(DRAM0_BASE, DRAM0_SIZE);
++register_ddr(DRAM1_BASE, DRAM1_SIZE);
+=20
+ #ifndef CFG_CORE_SEL2_SPMC
+ void main_init_gic(void)
+diff --git a/core/arch/arm/plat-totalcompute/platform_config.h b/core/arch=
/arm/plat-totalcompute/platform_config.h
+index 4255abca..b474a899 100644
+--- a/core/arch/arm/plat-totalcompute/platform_config.h
++++ b/core/arch/arm/plat-totalcompute/platform_config.h
+@@ -26,6 +26,9 @@
+ #define DRAM0_BASE		0x80000000
+ #define DRAM0_SIZE		0x7d000000
+=20
++#define DRAM1_BASE		0x8080000000ULL
++#define DRAM1_SIZE		0x180000000ULL
++
+ #define TZCDRAM_BASE		0xff000000
+ #define TZCDRAM_SIZE		0x01000000
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc b/=
meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
index 63abbb1..eeaa59a 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
@@ -1,7 +1,7 @@
 # Total Compute (tc) specific configuration for optee-os and optee-os-tade=
vkit
=20
 # Intermediate SHA with 3.14 baseline version
-# This has TC0 platform support
+# This has TC0 and TC1 platform support
 SRCREV =3D "e4f34e786135079160697d88212591105a65fbce"
 PV =3D "3.14.0+git${SRCPV}"
=20
@@ -9,8 +9,9 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/tc:=
"
 SRC_URI:append:tc =3D " \
     file://sp_layout.json \
     file://0001-WIP-Enable-managed-exit.patch \
-    file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
-    file://0001-Fix-optee-UUID.patch \
+    file://0002-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
+    file://0003-Fix-optee-UUID.patch \
+    file://0004-plat-totalcompute-add-support-for-higher-DRAM.patch \
     "
=20
 COMPATIBLE_MACHINE =3D "(tc?)"
--=20
2.30.2


