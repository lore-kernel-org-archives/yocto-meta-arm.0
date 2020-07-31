Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.55])
 by mx.groups.io with SMTP id smtpd.web10.1320.1596220559544499354
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 11:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ea2Bp0sI;
 spf=pass (domain: arm.com, ip: 40.107.14.55, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c88/uSvNW2iLbMurAY62XC1QmdK6A+1AjOg3Qbu1usI=;
 b=Ea2Bp0sIf4OJg+Dmhyu/1DvkRv2L+mcm84ylXaKeRe2F9NWXwrp/JfmyQTG7GkQfo9Myx3ZgRW3Wv5RgrYSgWZp5RBzqMNvE/olKdQZG/YxDf0GarpCvbDfYcOcXSckt+oyO5JsIx98OZzSDLa5YcikZHfuLts+8wMXdkpUHXyI=
Received: from DB6PR07CA0190.eurprd07.prod.outlook.com (2603:10a6:6:42::20) by
 AM6PR08MB3896.eurprd08.prod.outlook.com (2603:10a6:20b:83::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.24; Fri, 31 Jul 2020 18:35:56 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::ff) by DB6PR07CA0190.outlook.office365.com
 (2603:10a6:6:42::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend
 Transport; Fri, 31 Jul 2020 18:35:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 18:35:55 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Fri, 31 Jul 2020 18:35:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e5dd3a3341b5ea58
X-CR-MTA-TID: 64aa7808
Received: from c95a27a4b892.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7A069DBA-D9BC-4053-820F-B7AF96ECBDEC.1;
	Fri, 31 Jul 2020 18:35:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c95a27a4b892.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Jul 2020 18:35:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niat7P9pi8DBHEhsAXRETxdj3QICveJPTTJm38dqOfVPWRT1EOWeFzFxf6i+Oyc+JiKemXMraAPuFQLGlefUyVEev6kH6myaGod/4hbfhZMqU50hG2amlkE57lDjgHCbNmUh3vdch4sxUJ7gfs1n9c2PXocI/Hj16NXfCY+G1YSdgN5lzrfM8Kcyb/s1YNZJGQlX2Xrp8w0Kdy9tVMDaT+qznKXTjcHt6IcodcJ37fYqK8zYp7YPUYE9dHZO7VMfONYZ44HtEFt/DnkpPqLHGmf+xw7wklzJs/+Pgpzdah9yhrK+qrbpEuduFvfW7D1AwZf+qLsslYgzPI6NIzpAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c88/uSvNW2iLbMurAY62XC1QmdK6A+1AjOg3Qbu1usI=;
 b=DYyJPdqQ4fJT5uGPL9wk8/tnsKEcD9ik5Mb3pL6PcM2oj3vUTy9FT0FLFNgIhkFdTeMl02toBsKL5oCYYFDYfVWtYXaUCtbRGO5S0OUj4I8qYUY+55pF8PtSO12HCMf6OCOAtt7lXzqezlqZRqIJnM9DQZe4JLkBlFWCSZOTkxMpBq0lmXuY1in3rdO7fDhqzv2fZS9rilmMAKXQOEiw7IdETKqpZIKZqPILiKFHl+UbXmMqe8oGAhjkDWyAcEsaeVKnvY3ruv2Co8ZXW9aWuHaO+GQYonNhCDnZ9bg6QC+2RFtCRtiGIZucmCDh/6UsTMkCDigvgSoYEkmaCdEUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c88/uSvNW2iLbMurAY62XC1QmdK6A+1AjOg3Qbu1usI=;
 b=Ea2Bp0sIf4OJg+Dmhyu/1DvkRv2L+mcm84ylXaKeRe2F9NWXwrp/JfmyQTG7GkQfo9Myx3ZgRW3Wv5RgrYSgWZp5RBzqMNvE/olKdQZG/YxDf0GarpCvbDfYcOcXSckt+oyO5JsIx98OZzSDLa5YcikZHfuLts+8wMXdkpUHXyI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com (2603:10a6:803:f1::20)
 by VE1PR08MB4816.eurprd08.prod.outlook.com (2603:10a6:802:a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 31 Jul
 2020 18:35:48 +0000
Received: from VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e]) by VI1PR08MB4334.eurprd08.prod.outlook.com
 ([fe80::3881:b1d4:e034:559e%6]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 18:35:48 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 3/3] arm-bsp: Introduce 32-bit FVP-BASE platform and BSP
Date: Fri, 31 Jul 2020 19:35:38 +0100
Message-Id: <20200731183538.40948-3-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731183538.40948-1-anders.dellien@arm.com>
References: <20200731183538.40948-1-anders.dellien@arm.com>
X-ClientProxiedBy: LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::23) To VI1PR08MB4334.eurprd08.prod.outlook.com
 (2603:10a6:803:f1::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.53) by LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20 via Frontend Transport; Fri, 31 Jul 2020 18:35:48 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c55bc422-91c8-4ebf-85b9-08d835808fd7
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|AM6PR08MB3896:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB38964109A57438C202BBFA1D894E0@AM6PR08MB3896.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2LSzyOy3/cHdSVyHC83DRyZOQr8eykOfMffVLdnFOcT24gY3Y4HzwqsLitInW3Z8CFGZoPBqbKuS9u9JFXBAO32yA0f4R4F7NfZrb6okEH1DKEZPOWZZ4O7ayEno4ehx6F22SAr83txuG85abYAsObATkrpZgfzZAgTWUeTn9krlygy7z/GJbWPDihDhWnl4rjsx32M6a7hIdQLZDbH9Aiiqr2N1iWgS6dsnQsSoqLCh6nC16LZwkX0gEyzd2ObSXjAHUDeWxj0nVSmFiWiRn3+0LUbqe3H7V4q4YsxBpdJB7KQdHJbEvFCNCfZ2KELZiVqdU0HPJKtRIWHq/l7d6/4Ax53DMqiD+1j7Ur/Zc2xU7XtEq7huMgB8ynG6d3CmICtldJgZDE61UHjDBgBqhw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB4334.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(66556008)(86362001)(66946007)(2616005)(4326008)(6666004)(19627235002)(956004)(66476007)(5660300002)(44832011)(1076003)(8676002)(8936002)(316002)(36756003)(6916009)(30864003)(83380400001)(186003)(16526019)(52116002)(7696005)(6486002)(478600001)(26005)(2906002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 TTE1Hw12bKRmYLfQBV/0BjnIhGOyL8I3WM66ZxOoOd3tYS3k0i34g2UlnIcPyU17QtXtjVFskDkzvgegp5I4599zFf3ou8DM1U3eFHXCaRf5gM8CsRQcDeyxl6ELqpLnWNVro5ynllRbwcyRFqjP6gGd9I33TD9fJP9nIBGUUW4b+ecGakLTrY8aKmytyCFfm89sbeS9owQUeXdBlzb5ZvZYn2HDuMFyOvjw69YjNz/DM+lJO8+iyjBgdYb+iJ1tD6gG4YikfkhvnkyYcBoPz/jYGr8I71of7K3N+hCQQQwXsZ2lClIhu1wOIOCu5n9sNxam/GF2n4HAa2NXSMiOsJcVua5kHVLuk806tmH+3CN4g0D8GurqbXCCebJt7r/GvHpyOT2kmTMhIR9fVpxbBfkMdv/yOrPlBJOQUhMW/VuXeLSjClUgBDZlpeNAu0LjbzggteVUT0bOVKE/6T9Lqg8rJUGTwrtrqUgNRt1noCSBUsa8GruTPhg14nLnR6rH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1f2d37f4-dc75-44f2-2160-08d835808b81
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2qnHjybjGxgpmbbRpc7M+3tvcxRYzbN22Ea3Emb3UWt9zDuBL+WgiOB5p3EpdZ4c8oEmlZjIsXZcp5MmtcY467T2ahsjUqwMNqshMeZY2FhdZgcgI5C9yXllxMx5H511WDQiIRA/h9kswd1bYoDNL7epBQHzEFWRdkrv1i0mEEQNOHBakOTBzjX6wdrb4Q3TFIGoDnetz/FBfTptwaGzwU55y0dfREyEA8u2uQpU+gvK98js5NYD/ll1nqRTS15wldeiCtSEbXfRTlAq+VwRqDgTRc4/pbgtZ0KgxsU6Q/NDbqR8+A8kRdphIuysRA+fC/L05iV2mcEfSGzYBS0Ly10BmjDBeRIyuSgVyo2or23w8BTFPHbQThLo+J+AnhAIN1PFIGmElmULPwfaTN/pW12ZBox5go3Fl88ehjbOhBMmXwFGqmsy7+uPwgm4zRvhYbCwHyrFoIDuo2+dpbFKkrefZtdkyotS1VSptat2mMs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(1076003)(36756003)(26005)(30864003)(6916009)(7696005)(70206006)(2906002)(6666004)(478600001)(16526019)(186003)(8676002)(8936002)(70586007)(6486002)(86362001)(4326008)(47076004)(356005)(956004)(2616005)(83380400001)(44832011)(19627235002)(5660300002)(336012)(82310400002)(81166007)(316002)(82740400003)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 18:35:55.8207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c55bc422-91c8-4ebf-85b9-08d835808fd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3896
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Also refactor fvp-common.inc to contain definitions shared
between fvp-base, fvp-base-arm32 and foundation-armv8

Change-Id: I3634c3fefa8d793d0bcf5fcfd7458e6dbd2a6622
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../conf/machine/foundation-armv8.conf        |  13 +-
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf |  17 +
 meta-arm-bsp/conf/machine/fvp-base.conf       |  13 +-
 meta-arm-bsp/conf/machine/fvp-common.inc      |  17 +-
 meta-arm-bsp/documentation/fvp-base-arm32.md  |  61 ++
 .../bsp/arm-platforms/fvp-arm32-standard.scc  |   7 +
 .../bsp/arm-platforms/fvp-arm32.scc           |  16 +
 .../0001-ARM-vexpress-enable-GICv3.patch      |  31 +
 .../bsp/arm-platforms/fvp-arm32/fvp-board.cfg |  12 +
 .../arm-platforms/fvp-arm32/fvp-features.cfg  |  25 +
 .../bsp/arm-platforms/fvp/fvp-net.cfg         |   1 +
 .../linux/files/fvp-base-arm32-dts.patch      | 580 ++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |   8 +
 13 files changed, 781 insertions(+), 20 deletions(-)
 create mode 100644 meta-arm-bsp/conf/machine/fvp-base-arm32.conf
 create mode 100644 meta-arm-bsp/documentation/fvp-base-arm32.md
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/fvp-arm32-standard.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/fvp-arm32.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/fvp-arm32/fvp-board.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/fvp-arm32/fvp-features.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-=
dts.patch

diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp=
/conf/machine/foundation-armv8.conf
index 0ff1060..0ec6ecd 100644
--- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
+++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
@@ -5,10 +5,13 @@
 #@DESCRIPTION: Machine configuration for Armv8-A Foundation Platform model

 require conf/machine/fvp-common.inc
+require conf/machine/include/arm/arch-armv8a.inc

-KERNEL_DEVICETREE =3D "arm/foundation-v8-gicv3-psci.dtb"
+TUNE_FEATURES =3D "aarch64"
+
+# FVP u-boot configuration
+UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"

-# Use haveged as a source of entropy instead of rng-tools (Needed for ssh)=
.
-# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot =
time.
-PACKAGE_EXCLUDE_append =3D " rng-tools"
-MACHINE_EXTRA_RRECOMMENDS +=3D "haveged"
+KERNEL_IMAGETYPE =3D "Image"
+
+KERNEL_DEVICETREE =3D "arm/foundation-v8-gicv3-psci.dtb"
diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp/c=
onf/machine/fvp-base-arm32.conf
new file mode 100644
index 0000000..3c3e5ac
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -0,0 +1,17 @@
+# Configuration for Armv7-A Base Platform FVP
+
+#@TYPE: Machine
+#@NAME: Armv7-A Base Platform FVP machine
+#@DESCRIPTION: Machine configuration for Armv7-A Base Platform FVP model
+
+require conf/machine/fvp-common.inc
+require conf/machine/include/arm/arch-armv7a.inc
+
+KERNEL_IMAGETYPE =3D "zImage"
+
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
+
+# FVP u-boot configuration
+UBOOT_MACHINE =3D "vexpress_aemv8a_aarch32_defconfig"
+
+KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/ma=
chine/fvp-base.conf
index 321b5d5..4bccdb6 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -5,10 +5,13 @@
 #@DESCRIPTION: Machine configuration for Armv8-A Base Platform FVP model

 require conf/machine/fvp-common.inc
+require conf/machine/include/arm/arch-armv8a.inc

-KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
+TUNE_FEATURES =3D "aarch64"
+
+# FVP u-boot configuration
+UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"

-# Use haveged as a source of entropy instead of rng-tools (Needed for ssh)=
.
-# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot =
time.
-PACKAGE_EXCLUDE_append =3D " rng-tools"
-MACHINE_EXTRA_RRECOMMENDS +=3D "haveged"
+KERNEL_IMAGETYPE =3D "Image"
+
+KERNEL_DEVICETREE =3D "arm/fvp-base-gicv3-psci-custom.dtb"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/m=
achine/fvp-common.inc
index 08f8b15..2279338 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -1,18 +1,12 @@
 # FVP common parameters

 #
-# Capturing FVP common configurations (Armv8-A Base Platform FVP and
-# Armv8-A Foundation Platform).
+# Capturing FVP common configurations (Armv8-A Base Platform FVP,
+# Armv8-A Foundation Platform and Armv7-A Base Platform FVP).
 #

-TUNE_FEATURES =3D "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
 MACHINE_FEATURES =3D "optee"

-KERNEL_IMAGETYPE =3D "Image"
-
 IMAGE_CLASSES +=3D "image_types_disk_img"
 IMAGE_FSTYPES +=3D "disk.img"

@@ -39,5 +33,8 @@ PREFERRED_VERSION_linux-yocto ?=3D "5.4%"

 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a u-boot"

-# FVP u-boot configuration
-UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
+# Use haveged as a source of entropy instead of rng-tools (Needed for ssh)=
.
+# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot =
time.
+PACKAGE_EXCLUDE_append =3D " rng-tools"
+MACHINE_EXTRA_RRECOMMENDS +=3D "haveged"
+
diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/do=
cumentation/fvp-base-arm32.md
new file mode 100644
index 0000000..363e6b2
--- /dev/null
+++ b/meta-arm-bsp/documentation/fvp-base-arm32.md
@@ -0,0 +1,61 @@
+# Armv7-A Base Platform FVP Support in meta-arm-platforms
+
+## How to build and run
+
+### Configuration:
+In the local.conf file, MACHINE should be set as follows:
+MACHINE ?=3D "fvp-base-arm32"
+
+### Build:
+```bash$ bitbake core-image-minimal```
+
+### Run:
+To Run the Fixed Virtual Platform simulation tool you must download "Armv8=
-A
+Base Platform FVP" from Arm developer (This might require the user to
+register) from this address:
+https://developer.arm.com/tools-and-software/simulation-models/fixed-virtu=
al-platforms
+and install it on your host PC.
+
+Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
+https://developer.arm.com/docs/100966/latest
+
+Armv8=E2=80=91A Foundation Platform User Guide:
+https://developer.arm.com/docs/100961/latest/
+
+
+Once done, do the following to build and run an image:
+```bash$ bitbake core-image-minimal```
+```bash$ export YOCTO_DEPLOY_IMGS_DIR=3D"<yocto-build-dir/tmp/deploy/image=
s/fvp-base-arm32>"```
+```bash$ cd <path-to-Base_RevC_AEMv8A_pkg-dir/models/Linux64_GCC-X.X/>```
+```
+bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=3D1 \
+         -C cache_state_modelled=3D0 \
+         -C bp.secureflashloader.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.=
bin \
+         -C bp.flashloader0.fname=3D${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
+         --data cluster0.cpu0=3D${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 =
\
+         -C bp.virtioblockdevice.image_path=3D${YOCTO_DEPLOY_IMGS_DIR}/cor=
e-image-minimal-fvp-base-arm32.disk.img \
+         -C cluster0.cpu0.CONFIG64=3D0 \
+         -C cluster0.cpu1.CONFIG64=3D0 \
+         -C cluster0.cpu2.CONFIG64=3D0 \
+         -C cluster0.cpu3.CONFIG64=3D0 \
+         -C cluster1.cpu0.CONFIG64=3D0 \
+         -C cluster1.cpu1.CONFIG64=3D0 \
+         -C cluster1.cpu2.CONFIG64=3D0 \
+         -C cluster1.cpu3.CONFIG64=3D0 \
+
+```
+
+
+If you have built a configuration without a ramdisk, you can use the follo=
wing
+command in U-boot to start Linux:
+```fvp32# bootz 0x80080000 - 0x82000000```
+
+## Devices supported in the kernel
+- serial
+- virtio disk
+- network
+- watchdog
+- rtc
+
+## Devices not supported or not functional
+None
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/fvp-arm32-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-pl=
atforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
new file mode 100644
index 0000000..a92d945
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp-arm32-standard.scc
@@ -0,0 +1,7 @@
+define KMACHINE fvp-arm32
+define KTYPE standard
+define KARCH arm
+define KMETA_EXTERNAL_BSP t
+
+include fvp-arm32.scc
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-k=
meta/bsp/arm-platforms/fvp-arm32.scc
new file mode 100644
index 0000000..f95b036
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp-arm32.scc
@@ -0,0 +1,16 @@
+include features/input/input.scc
+include cfg/timer/no_hz.scc
+
+patch fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
+
+kconf hardware fvp-arm32/fvp-board.cfg
+kconf hardware fvp-arm32/fvp-features.cfg
+kconf hardware fvp/fvp-net.cfg
+kconf hardware fvp/fvp-rtc.cfg
+kconf hardware fvp/fvp-serial.cfg
+kconf hardware fvp/fvp-virtio.cfg
+kconf hardware fvp/fvp-cfi.cfg
+kconf hardware fvp/fvp-drm.cfg
+kconf hardware fvp/fvp-timer.cfg
+kconf hardware fvp/fvp-virtio.cfg
+kconf hardware fvp/fvp-watchdog.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-=
vexpress-enable-GICv3.patch
new file mode 100644
index 0000000..d0a05c2
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
@@ -0,0 +1,31 @@
+From 5dbb6c4267b1e46ed08359be363d8bc9b6a79397 Mon Sep 17 00:00:00 2001
+From: Ryan Harkin <ryan.harkin@linaro.org>
+Date: Wed, 16 Nov 2016 14:43:02 +0000
+Subject: [PATCH] ARM: vexpress: enable GICv3
+
+Upstream-Status: Pending
+
+ARMv8 targets such as ARM's FVP Cortex-A32 model can run the 32-bit
+ARMv7 kernel.  And these targets often contain GICv3.
+
+Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
+Signed-off-by: Jon Medhurst <tixy@linaro.org>
+---
+ arch/arm/mach-vexpress/Kconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconf=
ig
+index 7c728ebc0b33..ed579382d41f 100644
+--- a/arch/arm/mach-vexpress/Kconfig
++++ b/arch/arm/mach-vexpress/Kconfig
+@@ -4,6 +4,7 @@ menuconfig ARCH_VEXPRESS
+       select ARCH_SUPPORTS_BIG_ENDIAN
+       select ARM_AMBA
+       select ARM_GIC
++      select ARM_GIC_V3
+       select ARM_GLOBAL_TIMER
+       select ARM_TIMER_SP804
+       select COMMON_CLK_VERSATILE
+--
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/fvp-arm32/fvp-board.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-board.cfg
new file mode 100644
index 0000000..e49a1e3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp-arm32/fvp-board.cfg
@@ -0,0 +1,12 @@
+CONFIG_ARM=3Dy
+
+CONFIG_ARCH_VEXPRESS=3Dy
+CONFIG_SMP=3Dy
+CONFIG_NR_CPUS=3D8
+CONFIG_HOTPLUG_CPU=3Dy
+
+CONFIG_REGULATOR=3Dy
+CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
+
+CONFIG_CPU_IDLE=3Dy
+CONFIG_ARM_CPUIDLE=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linux/ar=
m-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
new file mode 100644
index 0000000..f2164f7
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp-arm32/fvp-features.cfg
@@ -0,0 +1,25 @@
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_EXT4_FS=3Dy
+CONFIG_BINFMT_SCRIPT=3Dy
+CONFIG_BINFMT_MISC=3Dy
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_HIGHMEM=3Dy
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_TMPFS=3Dy
+CONFIG_TMPFS_POSIX_ACL=3Dy
+CONFIG_TMPFS_XATTR=3Dy
+CONFIG_DEVTMPFS=3Dy
+CONFIG_DEVTMPFS_MOUNT=3Dy
+CONFIG_DEBUG_FS=3Dy
+CONFIG_GENERIC_SCHED_CLOCK=3Dy
+CONFIG_CLKDEV_LOOKUP=3Dy
+CONFIG_NET=3Dy
+CONFIG_NETDEVICES=3Dy
+CONFIG_UNIX=3Dy
+CONFIG_ETHERNET=3Dy
+CONFIG_VFP=3Dy
+CONFIG_VFPv3=3Dy
+CONFIG_NEON=3Dy
+CONFIG_KERNEL_MODE_NEON=3Dy
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/fvp/fvp-net.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms=
-kmeta/bsp/arm-platforms/fvp/fvp-net.cfg
index 54e3686..20cc408 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp/fvp-net.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/fvp/fvp-net.cfg
@@ -1,2 +1,3 @@
+CONFIG_NET_VENDOR_SMSC=3Dy
 CONFIG_SMSC911X=3Dy
 CONFIG_SMC91X=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.pat=
ch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch
new file mode 100644
index 0000000..de7b752
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch
@@ -0,0 +1,580 @@
+These DTS files are the same as the ones provided for fvp-base.
+They will be temporarily provided here until we can use the DTS files from=
 TF-A.
+So, no need to upstream.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+
+diff --git a/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi =
b/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
+new file mode 100644
+index 000000000000..f4601c7f99f8
+--- /dev/null
++++ b/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
+@@ -0,0 +1,264 @@
++/*
++ * Copyright (c) 2017-2018, ARM Limited and Contributors. All rights rese=
rved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/memreserve/ 0x80000000 0x00010000;
++
++/include/ "rtsm_ve-motherboard-nomap.dtsi"
++
++/ {
++       model =3D "FVP Base";
++       compatible =3D "arm,vfp-base", "arm,vexpress";
++       interrupt-parent =3D <&gic>;
++       #address-cells =3D <2>;
++       #size-cells =3D <2>;
++
++       aliases {
++               serial0 =3D &v2m_serial0;
++               serial1 =3D &v2m_serial1;
++               serial2 =3D &v2m_serial2;
++               serial3 =3D &v2m_serial3;
++       };
++
++       psci {
++               compatible =3D "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
++               method =3D "smc";
++               cpu_suspend =3D <0xc4000001>;
++               cpu_off =3D <0x84000002>;
++               cpu_on =3D <0xc4000003>;
++               sys_poweroff =3D <0x84000008>;
++               sys_reset =3D <0x84000009>;
++       };
++
++       cpus {
++               #address-cells =3D <2>;
++               #size-cells =3D <0>;
++
++               cpu-map {
++                       cluster0 {
++                               core0 {
++                                       cpu =3D <&CPU0>;
++                               };
++                               core1 {
++                                       cpu =3D <&CPU1>;
++                               };
++                               core2 {
++                                       cpu =3D <&CPU2>;
++                               };
++                               core3 {
++                                       cpu =3D <&CPU3>;
++                               };
++                       };
++
++                       cluster1 {
++                               core0 {
++                                       cpu =3D <&CPU4>;
++                               };
++                               core1 {
++                                       cpu =3D <&CPU5>;
++                               };
++                               core2 {
++                                       cpu =3D <&CPU6>;
++                               };
++                               core3 {
++                                       cpu =3D <&CPU7>;
++                               };
++                       };
++               };
++
++               idle-states {
++                       entry-method =3D "arm,psci";
++
++                       CPU_SLEEP_0: cpu-sleep-0 {
++                               compatible =3D "arm,idle-state";
++                               local-timer-stop;
++                               arm,psci-suspend-param =3D <0x0010000>;
++                               entry-latency-us =3D <40>;
++                               exit-latency-us =3D <100>;
++                               min-residency-us =3D <150>;
++                       };
++
++                       CLUSTER_SLEEP_0: cluster-sleep-0 {
++                               compatible =3D "arm,idle-state";
++                               local-timer-stop;
++                               arm,psci-suspend-param =3D <0x1010000>;
++                               entry-latency-us =3D <500>;
++                               exit-latency-us =3D <1000>;
++                               min-residency-us =3D <2500>;
++                       };
++               };
++
++               CPU0:cpu@0 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x0>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               CPU1:cpu@1 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x1>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               CPU2:cpu@2 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x2>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               CPU3:cpu@3 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x3>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               CPU4:cpu@100 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x100>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               CPU5:cpu@101 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x101>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               CPU6:cpu@102 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x102>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               CPU7:cpu@103 {
++                       device_type =3D "cpu";
++                       compatible =3D "arm,armv8";
++                       reg =3D <0x0 0x103>;
++                       enable-method =3D "psci";
++                       cpu-idle-states =3D <&CPU_SLEEP_0 &CLUSTER_SLEEP_0=
>;
++                       next-level-cache =3D <&L2_0>;
++               };
++
++               L2_0: l2-cache0 {
++                       compatible =3D "cache";
++               };
++       };
++
++       memory@80000000 {
++               device_type =3D "memory";
++               reg =3D <0x00000000 0x80000000 0 0x7F000000>,
++                     <0x00000008 0x80000000 0 0x80000000>;
++       };
++
++       gic: interrupt-controller@2f000000 {
++               compatible =3D "arm,gic-v3";
++               #interrupt-cells =3D <3>;
++               #address-cells =3D <2>;
++               #size-cells =3D <2>;
++               ranges;
++               interrupt-controller;
++               reg =3D <0x0 0x2f000000 0 0x10000>,       // GICD
++                     <0x0 0x2f100000 0 0x200000>,      // GICR
++                     <0x0 0x2c000000 0 0x2000>,        // GICC
++                     <0x0 0x2c010000 0 0x2000>,        // GICH
++                     <0x0 0x2c02f000 0 0x2000>;        // GICV
++               interrupts =3D <1 9 4>;
++
++               its: its@2f020000 {
++                       compatible =3D "arm,gic-v3-its";
++                       msi-controller;
++                       reg =3D <0x0 0x2f020000 0x0 0x20000>; // GITS
++               };
++       };
++
++       timer {
++               compatible =3D "arm,armv8-timer";
++               interrupts =3D <1 13 0xff01>,
++                            <1 14 0xff01>,
++                            <1 11 0xff01>,
++                            <1 10 0xff01>;
++               clock-frequency =3D <100000000>;
++       };
++
++       timer@2a810000 {
++                       compatible =3D "arm,armv7-timer-mem";
++                       reg =3D <0x0 0x2a810000 0x0 0x10000>;
++                       clock-frequency =3D <100000000>;
++                       #address-cells =3D <2>;
++                       #size-cells =3D <2>;
++                       ranges;
++                       frame@2a830000 {
++                               frame-number =3D <1>;
++                               interrupts =3D <0 26 4>;
++                               reg =3D <0x0 0x2a830000 0x0 0x10000>;
++                       };
++       };
++
++       pmu {
++               compatible =3D "arm,armv8-pmuv3";
++               interrupts =3D <0 60 4>,
++                            <0 61 4>,
++                            <0 62 4>,
++                            <0 63 4>;
++       };
++
++       smb@8000000 {
++               compatible =3D "simple-bus";
++
++               #address-cells =3D <2>;
++               #size-cells =3D <1>;
++               ranges =3D <0 0 0 0x08000000 0x04000000>,
++                        <1 0 0 0x14000000 0x04000000>,
++                        <2 0 0 0x18000000 0x04000000>,
++                        <3 0 0 0x1c000000 0x04000000>,
++                        <4 0 0 0x0c000000 0x04000000>,
++                        <5 0 0 0x10000000 0x04000000>;
++       };
++
++       panels {
++               panel {
++                       compatible      =3D "panel";
++                       mode            =3D "XVGA";
++                       refresh         =3D <60>;
++                       xres            =3D <1024>;
++                       yres            =3D <768>;
++                       pixclock        =3D <15748>;
++                       left_margin     =3D <152>;
++                       right_margin    =3D <48>;
++                       upper_margin    =3D <23>;
++                       lower_margin    =3D <3>;
++                       hsync_len       =3D <104>;
++                       vsync_len       =3D <4>;
++                       sync            =3D <0>;
++                       vmode           =3D "FB_VMODE_NONINTERLACED";
++                       tim2            =3D "TIM2_BCD", "TIM2_IPC";
++                       cntl            =3D "CNTL_LCDTFT", "CNTL_BGR", "CN=
TL_LCDVCOMP(1)";
++                       caps            =3D "CLCD_CAP_5551", "CLCD_CAP_565=
", "CLCD_CAP_888";
++                       bpp             =3D <16>;
++               };
++       };
++
++};
+diff --git a/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-custom.dts b/arch/a=
rm/boot/dts/arm/fvp-base-gicv3-psci-custom.dts
+new file mode 100644
+index 000000000000..984dbca90126
+--- /dev/null
++++ b/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-custom.dts
+@@ -0,0 +1,9 @@
++/*
++ * Copyright (c) 2013-2017, ARM Limited and Contributors. All rights rese=
rved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/dts-v1/;
++
++/include/ "fvp-base-gicv3-psci-common-custom.dtsi"
+diff --git a/arch/arm/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi b/arch/a=
rm/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi
+new file mode 100644
+index 000000000000..a94f7cb863a2
+--- /dev/null
++++ b/arch/arm/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi
+@@ -0,0 +1,282 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * ARM Ltd. Fast Models
++ *
++ * Versatile Express (VE) system model
++ * Motherboard component
++ *
++ * VEMotherBoard.lisa
++ *
++ * This is a duplicate of rtsm_ve-motherboard.dtsi but not
++ * using interrupt-map as this is not properly supported in
++ * xen right now
++ */
++/ {
++       smb@8000000 {
++               motherboard {
++                       arm,v2m-memory-map =3D "rs1";
++                       compatible =3D "arm,vexpress,v2m-p1", "simple-bus"=
;
++                       #address-cells =3D <2>; /* SMB chipselect number a=
nd offset */
++                       #size-cells =3D <1>;
++                       ranges;
++
++                       flash@0,00000000 {
++                               compatible =3D "arm,vexpress-flash", "cfi-=
flash";
++                               reg =3D <0 0x00000000 0x04000000>,
++                                     <4 0x00000000 0x04000000>;
++                               bank-width =3D <4>;
++                       };
++
++                       v2m_video_ram: vram@2,00000000 {
++                               compatible =3D "arm,vexpress-vram";
++                               reg =3D <2 0x00000000 0x00800000>;
++                       };
++
++                       ethernet@2,02000000 {
++                               compatible =3D "smsc,lan91c111";
++                               reg =3D <2 0x02000000 0x10000>;
++                               interrupts =3D <0 15 4>;
++                       };
++
++                       v2m_clk24mhz: clk24mhz {
++                               compatible =3D "fixed-clock";
++                               #clock-cells =3D <0>;
++                               clock-frequency =3D <24000000>;
++                               clock-output-names =3D "v2m:clk24mhz";
++                       };
++
++                       v2m_refclk1mhz: refclk1mhz {
++                               compatible =3D "fixed-clock";
++                               #clock-cells =3D <0>;
++                               clock-frequency =3D <1000000>;
++                               clock-output-names =3D "v2m:refclk1mhz";
++                       };
++
++                       v2m_refclk32khz: refclk32khz {
++                               compatible =3D "fixed-clock";
++                               #clock-cells =3D <0>;
++                               clock-frequency =3D <32768>;
++                               clock-output-names =3D "v2m:refclk32khz";
++                       };
++
++                       iofpga@3,00000000 {
++                               compatible =3D "simple-bus";
++                               #address-cells =3D <1>;
++                               #size-cells =3D <1>;
++                               ranges =3D <0 3 0 0x200000>;
++
++                               v2m_sysreg: sysreg@10000 {
++                                       compatible =3D "arm,vexpress-sysre=
g";
++                                       reg =3D <0x010000 0x1000>;
++                                       gpio-controller;
++                                       #gpio-cells =3D <2>;
++                               };
++
++                               v2m_sysctl: sysctl@20000 {
++                                       compatible =3D "arm,sp810", "arm,p=
rimecell";
++                                       reg =3D <0x020000 0x1000>;
++                                       clocks =3D <&v2m_refclk32khz>, <&v=
2m_refclk1mhz>, <&v2m_clk24mhz>;
++                                       clock-names =3D "refclk", "timclk"=
, "apb_pclk";
++                                       #clock-cells =3D <1>;
++                                       clock-output-names =3D "timerclken=
0", "timerclken1", "timerclken2", "timerclken3";
++                                       assigned-clocks =3D <&v2m_sysctl 0=
>, <&v2m_sysctl 1>, <&v2m_sysctl 3>, <&v2m_sysctl 3>;
++                                       assigned-clock-parents =3D <&v2m_r=
efclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
++                               };
++
++                               aaci@40000 {
++                                       compatible =3D "arm,pl041", "arm,p=
rimecell";
++                                       reg =3D <0x040000 0x1000>;
++                                       interrupts =3D <0 11 4>;
++                                       clocks =3D <&v2m_clk24mhz>;
++                                       clock-names =3D "apb_pclk";
++                               };
++
++                               mmci@50000 {
++                                       compatible =3D "arm,pl180", "arm,p=
rimecell";
++                                       reg =3D <0x050000 0x1000>;
++                                       interrupts =3D <0 9 4 0 10 4>;
++                                       cd-gpios =3D <&v2m_sysreg 0 0>;
++                                       wp-gpios =3D <&v2m_sysreg 1 0>;
++                                       max-frequency =3D <12000000>;
++                                       vmmc-supply =3D <&v2m_fixed_3v3>;
++                                       clocks =3D <&v2m_clk24mhz>, <&v2m_=
clk24mhz>;
++                                       clock-names =3D "mclk", "apb_pclk"=
;
++                               };
++
++                               kmi@60000 {
++                                       compatible =3D "arm,pl050", "arm,p=
rimecell";
++                                       reg =3D <0x060000 0x1000>;
++                                       interrupts =3D <0 12 4>;
++                                       clocks =3D <&v2m_clk24mhz>, <&v2m_=
clk24mhz>;
++                                       clock-names =3D "KMIREFCLK", "apb_=
pclk";
++                               };
++
++                               kmi@70000 {
++                                       compatible =3D "arm,pl050", "arm,p=
rimecell";
++                                       reg =3D <0x070000 0x1000>;
++                                       interrupts =3D <0 13 4>;
++                                       clocks =3D <&v2m_clk24mhz>, <&v2m_=
clk24mhz>;
++                                       clock-names =3D "KMIREFCLK", "apb_=
pclk";
++                               };
++
++                               v2m_serial0: uart@90000 {
++                                       compatible =3D "arm,pl011", "arm,p=
rimecell";
++                                       reg =3D <0x090000 0x1000>;
++                                       interrupts =3D <0 5 4>;
++                                       clocks =3D <&v2m_clk24mhz>, <&v2m_=
clk24mhz>;
++                                       clock-names =3D "uartclk", "apb_pc=
lk";
++                               };
++
++                               v2m_serial1: uart@a0000 {
++                                       compatible =3D "arm,pl011", "arm,p=
rimecell";
++                                       reg =3D <0x0a0000 0x1000>;
++                                       interrupts =3D <0 6 4>;
++                                       clocks =3D <&v2m_clk24mhz>, <&v2m_=
clk24mhz>;
++                                       clock-names =3D "uartclk", "apb_pc=
lk";
++                               };
++
++                               v2m_serial2: uart@b0000 {
++                                       compatible =3D "arm,pl011", "arm,p=
rimecell";
++                                       reg =3D <0x0b0000 0x1000>;
++                                       interrupts =3D <0 7 4>;
++                                       clocks =3D <&v2m_clk24mhz>, <&v2m_=
clk24mhz>;
++                                       clock-names =3D "uartclk", "apb_pc=
lk";
++                               };
++
++                               v2m_serial3: uart@c0000 {
++                                       compatible =3D "arm,pl011", "arm,p=
rimecell";
++                                       reg =3D <0x0c0000 0x1000>;
++                                       interrupts =3D <0 8 4>;
++                                       clocks =3D <&v2m_clk24mhz>, <&v2m_=
clk24mhz>;
++                                       clock-names =3D "uartclk", "apb_pc=
lk";
++                               };
++
++                               wdt@f0000 {
++                                       compatible =3D "arm,sp805", "arm,p=
rimecell";
++                                       reg =3D <0x0f0000 0x1000>;
++                                       interrupts =3D <0 0 4>;
++                                       clocks =3D <&v2m_refclk32khz>, <&v=
2m_clk24mhz>;
++                                       clock-names =3D "wdogclk", "apb_pc=
lk";
++                               };
++
++                               v2m_timer01: timer@110000 {
++                                       compatible =3D "arm,sp804", "arm,p=
rimecell";
++                                       reg =3D <0x110000 0x1000>;
++                                       interrupts =3D <0 2 4>;
++                                       clocks =3D <&v2m_sysctl 0>, <&v2m_=
sysctl 1>, <&v2m_clk24mhz>;
++                                       clock-names =3D "timclken1", "timc=
lken2", "apb_pclk";
++                               };
++
++                               v2m_timer23: timer@120000 {
++                                       compatible =3D "arm,sp804", "arm,p=
rimecell";
++                                       reg =3D <0x120000 0x1000>;
++                                       interrupts =3D <0 3 4>;
++                                       clocks =3D <&v2m_sysctl 2>, <&v2m_=
sysctl 3>, <&v2m_clk24mhz>;
++                                       clock-names =3D "timclken1", "timc=
lken2", "apb_pclk";
++                               };
++
++                               rtc@170000 {
++                                       compatible =3D "arm,pl031", "arm,p=
rimecell";
++                                       reg =3D <0x170000 0x1000>;
++                                       interrupts =3D <0 4 4>;
++                                       clocks =3D <&v2m_clk24mhz>;
++                                       clock-names =3D "apb_pclk";
++                               };
++
++                               clcd@1f0000 {
++                                       compatible =3D "arm,pl111", "arm,p=
rimecell";
++                                       reg =3D <0x1f0000 0x1000>;
++                                       interrupt-names =3D "combined";
++                                       interrupts =3D <0 14 4>;
++                                       clocks =3D <&v2m_oscclk1>, <&v2m_c=
lk24mhz>;
++                                       clock-names =3D "clcdclk", "apb_pc=
lk";
++                                       arm,pl11x,framebuffer =3D <0x18000=
000 0x00180000>;
++                                       memory-region =3D <&v2m_video_ram>=
;
++                                       max-memory-bandwidth =3D <13000000=
0>; /* 16bpp @ 63.5MHz */
++
++                                       port {
++                                               v2m_clcd_pads: endpoint {
++                                                       remote-endpoint =
=3D <&v2m_clcd_panel>;
++                                                       arm,pl11x,tft-r0g0=
b0-pads =3D <0 8 16>;
++                                               };
++                                       };
++
++                                       panel {
++                                               compatible =3D "panel-dpi"=
;
++
++                                               port {
++                                                       v2m_clcd_panel: en=
dpoint {
++                                                               remote-end=
point =3D <&v2m_clcd_pads>;
++                                                       };
++                                               };
++
++                                               panel-timing {
++                                                       clock-frequency =
=3D <63500127>;
++                                                       hactive =3D <1024>=
;
++                                                       hback-porch =3D <1=
52>;
++                                                       hfront-porch =3D <=
48>;
++                                                       hsync-len =3D <104=
>;
++                                                       vactive =3D <768>;
++                                                       vback-porch =3D <2=
3>;
++                                                       vfront-porch =3D <=
3>;
++                                                       vsync-len =3D <4>;
++                                               };
++                                       };
++                               };
++
++                               virtio-block@130000 {
++                                       compatible =3D "virtio,mmio";
++                                       reg =3D <0x130000 0x200>;
++                                       interrupts =3D <0 42 4>;
++                               };
++                       };
++
++                       v2m_fixed_3v3: v2m-3v3 {
++                               compatible =3D "regulator-fixed";
++                               regulator-name =3D "3V3";
++                               regulator-min-microvolt =3D <3300000>;
++                               regulator-max-microvolt =3D <3300000>;
++                               regulator-always-on;
++                       };
++
++                       mcc {
++                               compatible =3D "arm,vexpress,config-bus";
++                               arm,vexpress,config-bridge =3D <&v2m_sysre=
g>;
++
++                               v2m_oscclk1: oscclk1 {
++                                       /* CLCD clock */
++                                       compatible =3D "arm,vexpress-osc";
++                                       arm,vexpress-sysreg,func =3D <1 1>=
;
++                                       freq-range =3D <23750000 63500000>=
;
++                                       #clock-cells =3D <0>;
++                                       clock-output-names =3D "v2m:oscclk=
1";
++                               };
++
++                               reset {
++                                       compatible =3D "arm,vexpress-reset=
";
++                                       arm,vexpress-sysreg,func =3D <5 0>=
;
++                               };
++
++                               muxfpga {
++                                       compatible =3D "arm,vexpress-muxfp=
ga";
++                                       arm,vexpress-sysreg,func =3D <7 0>=
;
++                               };
++
++                               shutdown {
++                                       compatible =3D "arm,vexpress-shutd=
own";
++                                       arm,vexpress-sysreg,func =3D <8 0>=
;
++                               };
++
++                               reboot {
++                                       compatible =3D "arm,vexpress-reboo=
t";
++                                       arm,vexpress-sysreg,func =3D <9 0>=
;
++                               };
++
++                               dvimode {
++                                       compatible =3D "arm,vexpress-dvimo=
de";
++                                       arm,vexpress-sysreg,func =3D <11 0=
>;
++                               };
++                       };
++               };
++       };
++};
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index afb597d..4e5635a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -11,6 +11,7 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}:${THISDIR}/files=
:"
 SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkmeta;name=3Darm-plat=
forms-kmeta;destsuffix=3Darm-platforms-kmeta"
 SRC_URI_append_foundation-armv8 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base =3D " ${SRC_URI_KMETA}"
+SRC_URI_append_fvp-base-arm32 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_juno =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_gem5-arm64 =3D " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta =3D "6147e82375aa9df8f2a162d42ea6406c79c854c5"
@@ -34,6 +35,13 @@ COMPATIBLE_MACHINE_fvp-base =3D "fvp-base"
 KMACHINE_fvp-base =3D "fvp"
 SRC_URI_append_fvp-base =3D " file://fvp-base-dts.patch"

+#
+# FVP BASE ARM32 KMACHINE
+#
+COMPATIBLE_MACHINE_fvp-base-arm32 =3D "fvp-base-arm32"
+KMACHINE_fvp-base-arm32 =3D "fvp-arm32"
+SRC_URI_append_fvp-base-arm32 =3D " file://fvp-base-arm32-dts.patch"
+
 #
 # Juno KMACHINE
 #
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
