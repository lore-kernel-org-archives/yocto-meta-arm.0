Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web11.12418.1592810112021932896
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 00:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7atWLIcL;
 spf=pass (domain: arm.com, ip: 40.107.8.75, mailfrom: gabor.abonyi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbCBP53lhh1/gncF7YMCjzLkddkpnhCeIKX7grLavgQ=;
 b=7atWLIcLywxu30eil63jYbRQwFMLwSZrR4SVE+ekpJJzwWsbgfFVhC5aQEyTYJBxWj3mN27LTK2unF4vFuPZkZMsR8J9DF9/CPxPQz3SIk8Lu/OmWFaHwFXuwunYLTgXCDmJUP7n6eAb2gIicHSzckO0EltwjTic3gUixbvD17s=
Received: from MRXP264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::23)
 by VI1PR08MB3166.eurprd08.prod.outlook.com (2603:10a6:803:42::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:15:09 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::a8) by MRXP264CA0011.outlook.office365.com
 (2603:10a6:500:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 07:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:15:08 +0000
Received: ("Tessian outbound f44be76249db:v59"); Mon, 22 Jun 2020 07:15:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e37de81ce0417356
X-CR-MTA-TID: 64aa7808
Received: from 39c93633beb0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 91C9C297-993A-4098-9A30-F7F65C02CE13.1;
	Mon, 22 Jun 2020 07:15:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39c93633beb0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 07:15:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgjX3VqhnSm9Utk/EOb/0sYZmIf8De2S0Yt1Kjsw4m02inTu3UFsxiNZYu0iwFf6d9tyigzmj912T7XbcVt3fQEOxQtvSdnNnvAZqWQNZmqcrhG020LDh7o/CnU+xRppvLB8U+f+gP2WscOfLyyWUjQnVQEhZLIZm22yvvl5hUWFH0G6jrJXYz15s+OVkSz9XL96ZpNl209u8ub0jS+zbvzUW7LADSYWZRiBdBJnf3hv4cqV24ONPYSnPkVXPNt3e2CHoUa/Bn2UfOcncBcsRij4sZAtpmnZchZWuFUc61/cWX4Vb+zabNj23JWBqfYzsJCxEOrdMybFWDBXrLHYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbCBP53lhh1/gncF7YMCjzLkddkpnhCeIKX7grLavgQ=;
 b=fQJ9GfxYNar7x9IzMRQDJT/C6bm+pmLD4tTeb44/Lq/ohP2OFoNxWKbFrHtaksg2rUNpojQlCttNr4NM8h342N09nPvR43rSpxJr09JX8s1MaHKUD781EkuxpeiZelEKYOgFI01WIrjIbto+jCm7l7cL0egGZ07NpzmzF7AI3iX2YR7VansHzQzVU7SqwYiSxTm/aincHh9DWxFepictvEY5QCMlptv/HF89C2NCggB/INmSiCBPkAIsaTwoPmwUND1MkYJPO4pJrPcsWHCDH+U8xr93ydcPYipXQPCHx17rkr+Y7zaktm9In1Xj+oo8ICpKq5Yyjra97jzBkJY2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbCBP53lhh1/gncF7YMCjzLkddkpnhCeIKX7grLavgQ=;
 b=7atWLIcLywxu30eil63jYbRQwFMLwSZrR4SVE+ekpJJzwWsbgfFVhC5aQEyTYJBxWj3mN27LTK2unF4vFuPZkZMsR8J9DF9/CPxPQz3SIk8Lu/OmWFaHwFXuwunYLTgXCDmJUP7n6eAb2gIicHSzckO0EltwjTic3gUixbvD17s=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22) by VI1PR0802MB2493.eurprd08.prod.outlook.com
 (2603:10a6:800:b3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 07:15:00 +0000
Received: from VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c]) by VI1PR0802MB2414.eurprd08.prod.outlook.com
 ([fe80::f019:f39b:c062:719c%11]) with mapi id 15.20.3109.027; Mon, 22 Jun
 2020 07:15:00 +0000
From: "Gabor Abonyi" <gabor.abonyi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Gabor Abonyi <gabor.abonyi@arm.com>
Subject: [PATCH 5/6] arm-bsp: musca_b1: Add machine
Date: Mon, 22 Jun 2020 09:14:00 +0200
Message-Id: <20200622071401.2570-6-gabor.abonyi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622071401.2570-1-gabor.abonyi@arm.com>
References: <20200622071401.2570-1-gabor.abonyi@arm.com>
X-ClientProxiedBy: SN4PR0201CA0004.namprd02.prod.outlook.com
 (2603:10b6:803:2b::14) To VI1PR0802MB2414.eurprd08.prod.outlook.com
 (2603:10a6:800:b2::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gabor-VirtualBox.arm.com (217.140.99.251) by SN4PR0201CA0004.namprd02.prod.outlook.com (2603:10b6:803:2b::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 07:14:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 850f12f2-be50-4195-e9ae-08d8167bff27
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2493:|VI1PR08MB3166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3166CC0C4A35AFA74B2750A58E970@VI1PR08MB3166.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;OLM:3044;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BV7y2GHqY5ve0er4xvFJWfKOsNpNnNIvXBHlNI6NuEzoa8a76T2qtOt2+GuGiVgDhfeACnS+1u36MS2O2Uq4fELDhH9bI06ftIAITjnfMjJqAmIBqoUairwdmeotPDq0tFqPr4i3qIV7RXo1ImadKhMNER0hLST0ZpAn+O9ADmQs365G9c1PGGo2z/8a4qXfaOuKOs0VydIEVBTmPPXnsV+rdS6ZnOmRdobIEhBihPK8cT29hepwSeqTGlLwzUcelbJsgk/0J+7ehxy3d/1I28cf1BRnchi2HIIRW0+GLlMWRUG4ZeeO8fPrlPybPaoNx3Uo90bMb9+P1dealeCCSA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0802MB2414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(66556008)(66476007)(1076003)(26005)(36756003)(7696005)(8936002)(5660300002)(478600001)(86362001)(6916009)(2906002)(52116002)(186003)(16526019)(6666004)(956004)(2616005)(66946007)(316002)(44832011)(8676002)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 kbjmNiXT6rX+vw8cJDStmS90t/0yi1k5cSn/l8O3JWK/iBDSGQnFFoL0eyRdLOH1kF13GBQ5Q+jaQ3ncvOVFhtj01nef17L5NL6H+Q36HZerHRzl9898NwWMGDdTPULLfXGVTZ7XRVtqXc9xmVHpw8kBFOFWGmNNaGOWcy0SOfnxsaySaHEI/djZMbmjr3FcjWgQId3cKc7Jat7eUzgXc4qqTh/LlEeo82Dq8cgbFuzzHNGbTeBS4tq+nxtaX6wGuX0id7OncoxxXniMfG4SIkiqQdWYC+zZJyhM7SqTTw/37vvnkZwUKLEL5Jss/LjQn3rfP6EBUDO28+yJ6bj1bH5bscto0m24BXShLcdUjVTL9GEZl+t8n+rfX18u6XoyeUH11oDWqsPa/Qs6TQ3ndswYFsSk0CJ5w5+FtofcPnzi6ZyuOp9h1S72xqTPrctuEc/UT1yf+VJaWONxwzgdk6oF2pgNAWFIdxpsJ3UUeQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2493
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Gabor.Abonyi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(46966005)(5660300002)(336012)(478600001)(6486002)(8676002)(8936002)(81166007)(2906002)(6666004)(82310400002)(16526019)(47076004)(26005)(82740400003)(186003)(356005)(956004)(2616005)(7696005)(4326008)(44832011)(70206006)(70586007)(36756003)(316002)(6916009)(36906005)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1551f83a-a028-4e51-fbdd-08d8167bf9db
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tkE1nafuPtNsAeLcmw+XV7VNIzrsQwCIMZhqX35eWg0KId1Oct69gqgQZuQMjPNbKP08m68YOiQe6thI0/1chj9L2ol7u0ntfw6IbWKAQ+L4dNrl3iI9FNxUcggxwI+hufhjhyA9Qt8HJFv/ZTjl4V6JpvVi76HJ2ALTxk9dg3jwvPLtrvCxMEZmtOeF+pv+2gwJnk/xwjV8zc6Mfp1otsgUTx4g46jQ6a3meV0UX+gGEA8avIEdi8Jd87O8nCgYJ5ELi8UEIFsElDfUN0qc3ZxMLH8Bqf6/rBAku5D9UFDjv9UqSjqsno9mrhxfGbz8yh4tRtoM8wWFbI57BT6PTEBxDFMO4kTA9OMSwv7P2jxtmHRkvOuEtFqNzOK5kroKtzadygao2RJo00cFPUf9xw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 07:15:08.9400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 850f12f2-be50-4195-e9ae-08d8167bff27
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3166
Content-Type: text/plain

Add Musca B1 machine. Also add it to the supported targets
for Trusted Firmware M.

Change-Id: I66dcc87df9a8dcb258de701ffbdcde264b0886c5
Signed-off-by: Gabor Abonyi <gabor.abonyi@arm.com>
---
 meta-arm-bsp/conf/machine/armv8m.inc                  | 10 ++++++++++
 meta-arm-bsp/conf/machine/musca_b1.conf               | 11 +++++++++++
 .../trusted-firmware-m/trusted-firmware-m_%.bbappend  |  2 ++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/armv8m.inc
 create mode 100644 meta-arm-bsp/conf/machine/musca_b1.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend

diff --git a/meta-arm-bsp/conf/machine/armv8m.inc b/meta-arm-bsp/conf/machine/armv8m.inc
new file mode 100644
index 0000000..e7c7ca8
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/armv8m.inc
@@ -0,0 +1,10 @@
+DEFAULTTUNE ?= "armv8m"
+
+TUNEVALID[armv8m] = "Enable instructions for ARMv8-m"
+AVAILTUNES += "armv8m"
+
+ARMPKGARCH_tune-armv8m ?= "armv8m"
+TUNE_FEATURES_tune-armv8m = "armv8m"
+PACKAGE_EXTRA_ARCHS_tune-armv8m = "armv8m"
+
+require conf/machine/include/arm/arch-arm.inc
diff --git a/meta-arm-bsp/conf/machine/musca_b1.conf b/meta-arm-bsp/conf/machine/musca_b1.conf
new file mode 100644
index 0000000..0f9734b
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/musca_b1.conf
@@ -0,0 +1,11 @@
+# Configuration for Musca-B1 development board
+
+#@TYPE: Machine
+#@NAME: Musca-B1 machine
+#@DESCRIPTION: Machine configuration for Musca-B1
+
+EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
+
+PREFERRED_VERSION_trusted-firmware-m = "1.0"
+
+require armv8m.inc
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
new file mode 100644
index 0000000..f86e2b1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m_%.bbappend
@@ -0,0 +1,2 @@
+COMPATIBLE_MACHINE = "musca_b1"
+TFM_PLATFORM_musca_b1 = "MUSCA_B1"
-- 
2.17.1

