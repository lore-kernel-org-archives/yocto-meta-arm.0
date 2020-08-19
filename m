Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.55])
 by mx.groups.io with SMTP id smtpd.web12.86897.1597842102031615251
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 06:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=e7ak9c2K;
 spf=pass (domain: arm.com, ip: 40.107.6.55, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgUFlyyzW8gzshvMcsugFaIYK9YT4ezEwITCyvbDTiQ=;
 b=e7ak9c2Kfo0bQJ6fEbsqqWsH7GrAqM2woaIRhwRhQtuM3NdFjMlk1Xbx8fgYU0od5S4A+6A2jtlvyRtsdEBHFb7lqR5K3WST38m3d5Lv4ARZUg0uru4ZMCdloA39A3wdH3orfUDBNGY57utUtxajqt4cXYtHh5CtNIRIyg6cEyI=
Received: from AM6PR04CA0039.eurprd04.prod.outlook.com (2603:10a6:20b:f0::16)
 by DBBPR08MB4523.eurprd08.prod.outlook.com (2603:10a6:10:c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Wed, 19 Aug
 2020 13:01:40 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::29) by AM6PR04CA0039.outlook.office365.com
 (2603:10a6:20b:f0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 13:01:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 13:01:39 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Wed, 19 Aug 2020 13:01:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d315381c58a071d
X-CR-MTA-TID: 64aa7808
Received: from 9fc7f72b3856.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 17E8F3E8-3668-43B9-B96D-7AF96CEF41EE.1;
	Wed, 19 Aug 2020 13:01:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fc7f72b3856.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Aug 2020 13:01:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/705T9FgPBqjJGnuyNyw/tM4X5jnMZ2iHLzenr/FGs483Q1P61DLtSusjwnw30ocH2aor0vUfBZQrPZD7Wu9LANb9aEJuK5gPLdt3ri6Vll4VMhWL5vfZ+Zlx/nBe5kWW7VHGZ8Pz5ryqN4dRAIHEhtSJpLhLkzT8jtkRGCr1wvzkqaFeSCMN30gIJGvJ3Q/irdhT3bcMiaVGKlVMhYBRO4wp29CRdt6LnojhKia7/Ldy1fW8M4nTzMRjoZSejkACldyHMkmnvoc+OYgoPo1EP33O8BaYcNpZ0h8PuNwJNK7IWilK1OhiHRRQ9AjAkP9w1HoCgdkjeQpq3PcQgxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgUFlyyzW8gzshvMcsugFaIYK9YT4ezEwITCyvbDTiQ=;
 b=cekyVxAHg0sQ56OE2dW7Unj5r/zlu3j0kowXAFWhWPFQ2Au8cPAQkihvCuboJFeSXlnGpnsizf3JXKNODPw6snq2zbU5R9AzRJSivJeSOcuQ1wlfjLTFJacqdwE+FeV6S9WGj8JXvvT0R6GUExNnp1aOG5AIY0w30e5VOM1N1mlOuC53LEyupfDefNfFzbYcAs/fPtOuPJ1b2wCIU9AslFonYBFflc0hedeT7RLGAZPsG6ymkvb3SEM5PT9ulpgwovFVNIRSRCP6XELqwVTJzzFewiuShdX4UMaYB9cqwxdKVOpo/FjPDuUR73qgKIK3/Sf/I4c/1kjhwzQe85ATGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgUFlyyzW8gzshvMcsugFaIYK9YT4ezEwITCyvbDTiQ=;
 b=e7ak9c2Kfo0bQJ6fEbsqqWsH7GrAqM2woaIRhwRhQtuM3NdFjMlk1Xbx8fgYU0od5S4A+6A2jtlvyRtsdEBHFb7lqR5K3WST38m3d5Lv4ARZUg0uru4ZMCdloA39A3wdH3orfUDBNGY57utUtxajqt4cXYtHh5CtNIRIyg6cEyI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5586.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 13:01:23 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3283.027; Wed, 19 Aug 2020
 13:01:23 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH] arm-bsp/linux-linaro-arm: Fix multiple definition of `yylloc'
Date: Wed, 19 Aug 2020 18:31:10 +0530
Message-Id: <20200819130110.25145-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO3P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::18) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO3P123CA0013.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20 via Frontend Transport; Wed, 19 Aug 2020 13:01:21 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94058980-d04b-4b5a-c5d5-08d84440035e
X-MS-TrafficTypeDiagnostic: AM8PR08MB5586:|DBBPR08MB4523:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB45234912BC3B80A7850EF5A8FA5D0@DBBPR08MB4523.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rsrmkvq4ovcshkBzj7obBUjL9xtR/dOq71rAW4VPyaBW2bSbAQ2c/Ic43sYBdSsKNmTj1uXsIx1kRT+Nj1M/keVm4ItXAT7n6ernpJg8U9kaBD6OLCL5E4TQ9P9W7KPgizG1w0Clm7uKkWq7mVImw7XwJjCCx36cppS8VK/HCrEF8BJTvmuN546WfxH24MJIhtwjA43PDwi5QBTME518Mp16pfJWHNLGYb9mkWuJ5JjmLBnw0k1JMlF8BIpjPGQ4BfsnMgrNsxT9zFch78Y86p7MIZ0pK+jdRzyLMBIPYYH3NPiIwFd06lcHY118UdfxJ+Yc7e5YVWIxy/tvKSyNWkgQRMWHIJ8PGBqO+bqZ2mPPCt/Ly+8APJtxKVx/eqF4+M0mGwIxcG3aIGUsrg3THyWO7Isol7rmkhCoBcthRQ+G1CD7lrZN5VFoL/EliNooYQD7FeFr/MxbcrAEBMmmfg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(16526019)(2906002)(52116002)(1076003)(7696005)(2616005)(66556008)(86362001)(956004)(66476007)(66946007)(316002)(478600001)(6486002)(36756003)(54906003)(4326008)(186003)(8676002)(966005)(6666004)(26005)(5660300002)(6916009)(8936002)(83380400001)(81973001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 4L7EdSLs4d7k04y0EOuDD8n4F0qWC1HzrG14xAnE8nWS7hR7Tm9H0E0o+Ev2epGfizBdxb2DcAoqzP+yQu1N3G2c6mqM8xKFei1bbZQsooks0vhD3HJ4UmubsH4pTl/pOBkzIYWo4MaQqfldixdOCLs50MB4zAY7+ZRpPTOnndK3FqbJ8ro+pJqUiLt+unTV2M1EhwaIJdbWQhHHVhS0fPfJTjGjIpMcWOZegFX/lozmhG6TEwOOvVMybmwPlcaIwAe0S1FI7jR9W61nZpAx7dp9bNFdqfekUzgglk3QRIEqBFlSmvdaYq8kOPuz9uMKFmhI1NIsxrwJEZKUHYalW3/jnZy/+z1fcZwJtkRsz4icYMHeNPcW6HymjyQqmQw1P+eLWeVK/pTcJNp21rBAyslXhynesHEx9cffUKgLxxIdjqtD62AswU7HlvMjBfb24BsYPdzjgmeVYSBLjxGButq0tkFX4eZwRAq97ECaIjqCDuaZXQ+PU578fQOJVNz9DIDNJZfW8L9eMfTFZBSPwcGQOnqKoNePhyDb9zgIdH1cPKlGJTvvM12FZZMNPwyS+rpfLR+hOCVOGG3gsY1EGTT4fohL6WCnuja0XRaRerSNTGTJRDZYLgXIeVVfJPWKEdmZ4G+V6BD6FTSaWQOWmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5586
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	caaa1884-4fa6-4162-b3c0-08d8443ff926
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OcucpaxbJMQqop4j0wzdLu6mk6sRD1RILUGuZtcwfPSEXLAhzD+7avOzBk43sZqXhDYYTm/JJyf4II4UV5oQrifUhO9IFl3QW/N37bI+8gp9yE9vRTaKGehaRoE4l7C2gKaPddrKhRMfX+j25jSnQU1EnfU6CUk4t24Atv1a+qzCSevduJ2obo86a5ZnG8jlFlo9z1s2vwAv20vH+WyFf4bs7ZrLy7yr/dtD6lNVjMmoPYcOCP7gpM6A9+zujsYach2b3bVm147+pcPGkpBKWPz45WjHwUkk48yj/Rp7gCL6xpBu96H0c/pvxtXZW8pmOzp7s6Lt0yRoeVs/KiYhDUUVd9hM2RejgElitItACJ4V3M1KrYd7IvwjDe5PdwmA2CgJIiXQBuXW6ZVGRNHHXBHI4f5Kz+oR39tnjdkTq3f2uZLHWsP1qrDOwx+LXt8hlElx0WyjgPwCPsNkW2uG/I8MNKPEb5bbjTa79zifAk1HYT6L1PjnEP1dVJD6ho6d
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(5660300002)(956004)(966005)(316002)(6486002)(6916009)(54906003)(4326008)(86362001)(8676002)(26005)(478600001)(2906002)(8936002)(36906005)(2616005)(70586007)(7696005)(70206006)(1076003)(83380400001)(356005)(47076004)(336012)(6666004)(82740400003)(82310400002)(186003)(36756003)(81166007)(16526019)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 13:01:39.6994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94058980-d04b-4b5a-c5d5-08d84440035e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4523
Content-Type: text/plain

Patch https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/dtc/dtc-lexer.l?h=v5.4.56&id=35b34d264cb347909ec89d9fa895900035d5438c
is applied to fix kernel build failure due to multiple definition of 'yyloc'.

Refer to the bug report https://bugzilla.yoctoproject.org/show_bug.cgi?id=14014 for more details.

Change-Id: I801c6c40dc67ceea74993ccf26b077ba66ae58d8
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../scripts-dtc-remove-redundant-YYLOC.patch  | 59 +++++++++++++++++++
 .../linux/linux-linaro-arm_5.4.bbappend       |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
new file mode 100644
index 0000000..f3ae5e5
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/scripts-dtc-remove-redundant-YYLOC.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Backport https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scripts/dtc/dtc-lexer.l?h=v5.8
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From 35b34d264cb347909ec89d9fa895900035d5438c Mon Sep 17 00:00:00 2001
+From: Dirk Mueller <dmueller@suse.com>
+Date: Tue, 14 Jan 2020 18:53:41 +0100
+Subject: scripts/dtc: Remove redundant YYLOC global declaration
+
+commit e33a814e772cdc36436c8c188d8c42d019fda639 upstream.
+
+gcc 10 will default to -fno-common, which causes this error at link
+time:
+
+  (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol from plugin):(.text+0x0): first defined here
+
+This is because both dtc-lexer as well as dtc-parser define the same
+global symbol yyloc. Before with -fcommon those were merged into one
+defintion. The proper solution would be to to mark this as "extern",
+however that leads to:
+
+  dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc' [-Werror=redundant-decls]
+   26 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+In file included from dtc-lexer.l:24:
+dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
+  127 | extern YYLTYPE yylloc;
+      |                ^~~~~~
+cc1: all warnings being treated as errors
+
+which means the declaration is completely redundant and can just be
+dropped.
+
+Signed-off-by: Dirk Mueller <dmueller@suse.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+[robh: cherry-pick from upstream]
+Cc: stable@vger.kernel.org
+Signed-off-by: Rob Herring <robh@kernel.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ scripts/dtc/dtc-lexer.l | 1 -
+ 1 file changed, 1 deletion(-)
+
+(limited to 'scripts/dtc/dtc-lexer.l')
+
+diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
+index 5c6c3fd557d7..b3b7270300de 100644
+--- a/scripts/dtc/dtc-lexer.l
++++ b/scripts/dtc/dtc-lexer.l
+@@ -23,7 +23,6 @@ LINECOMMENT	"//".*\n
+ #include "srcpos.h"
+ #include "dtc-parser.tab.h"
+ 
+-YYLTYPE yylloc;
+ extern bool treesource_error;
+ 
+ /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
+-- 
+cgit v1.2.2-1-g5e49
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index e2640e0..c83d258 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -12,6 +12,7 @@ SRC_URI_append_n1sdp = " \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
     file://enable-realtek-R8169.cfg \
+    file://scripts-dtc-remove-redundant-YYLOC.patch \
     "
 
 # Referring to commit TAG N1SDP-2020.03.26
-- 
2.17.1

