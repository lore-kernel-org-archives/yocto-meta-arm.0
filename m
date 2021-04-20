Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web10.58.1618935905922851167
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 09:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sGlcuIz2;
 spf=pass (domain: arm.com, ip: 40.107.7.42, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR4aukDkPXirajyPWTSGLbEFG+5v0kxoKL/CKMnEryE=;
 b=sGlcuIz2tdTj0zAPADkb8px84aod+Eavs5ArZVWZ8qIyalbO2u6HxDzKBFQmp7hAkt7k+ZWpZ7gYtkdjeSYNViSB4nodbrHI7ZfCl3dI6EGhRtlCCjfKcPuvJ9EF7Y0TiTnF2/OvRZLwoQpsXenjCftkVyrlOvEyqOSQ1XeQQfA=
Received: from AM6PR10CA0069.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::46)
 by AM8PR08MB5620.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 16:25:02 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::ba) by AM6PR10CA0069.outlook.office365.com
 (2603:10a6:209:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Tue, 20 Apr 2021 16:25:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 16:25:01 +0000
Received: ("Tessian outbound 4ee49f77c636:v90"); Tue, 20 Apr 2021 16:25:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7597ecd4b5e8e273
X-CR-MTA-TID: 64aa7808
Received: from fcdbb5a60619.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3A626FD1-FED1-41C3-A031-6B73A572D024.1;
	Tue, 20 Apr 2021 16:24:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcdbb5a60619.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Apr 2021 16:24:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAFxIuQFSR7s0PL5ntGoknMiJpvlCM3ro3taBsSwpYbRJ2TcWWffVfWs9OlQYu+XAvWkTm27xGKlqd+ZRChgvSSW4Io144IVG42BVHSjAr12vmK7IhtLpvZ5rB/JSwFOfMDxdfcdTNQ8OR8SChUPDuSKX3+G/7qyqOqvIzQuChBVO5JMR9tVHqM5oCG5c0WRf4ZIJsDRuEqaSjPtELGEBVU4R1MXGYx8Z9fJL7LAfE00w/dWgmwcAwFqEVPjqpoI8EWch7t9Vmp0qxkVNFlquJH5SjJlv2BAGjbh2g/rXL4P3qO+yScpRG6zuPu5rTU+JAjOzKzRzD9EitqhYnQIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR4aukDkPXirajyPWTSGLbEFG+5v0kxoKL/CKMnEryE=;
 b=We9zfNeKqUHdnNhJLxc4Zro6iLAIxmYBP1fyr6ucJMmxk5WmbxiqQZipcn0kyan3Y5Bg1esNBHoNtrwDXmBpxFMYrfBetSuubsUImMuJ2e1jqR+Tj9ITxfoT77xoai4NeFPS6+BKMuC6089SDtvwxOsFmMcPj47Xf6TYuLEjr5OsBNb3hCKvN1u8xeSD1CpGNQTB6OKLcRZCmtuDgmb3eo8Yuw6MyCgUJWeiAjHL9y33LUh8lcLRjRbSfl9OB4jp1v5YFafqC6fcJmJomst3Xdsui4MCOG3txef5jOXtS9roEKBmX9Ft0CWB89gHKt7o4K/+abAM6AWZtWG9QEq+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR4aukDkPXirajyPWTSGLbEFG+5v0kxoKL/CKMnEryE=;
 b=sGlcuIz2tdTj0zAPADkb8px84aod+Eavs5ArZVWZ8qIyalbO2u6HxDzKBFQmp7hAkt7k+ZWpZ7gYtkdjeSYNViSB4nodbrHI7ZfCl3dI6EGhRtlCCjfKcPuvJ9EF7Y0TiTnF2/OvRZLwoQpsXenjCftkVyrlOvEyqOSQ1XeQQfA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6615.eurprd08.prod.outlook.com (2603:10a6:20b:335::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 16:24:52 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 16:24:52 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] kas: Add fvp-baser-aemv8r64 BSP evaluation build
Date: Tue, 20 Apr 2021 17:24:45 +0100
Message-Id: <52318b39713ab23b67df4f8dcaa0e288b055dea5.1618935838.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::21) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0088.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.21 via Frontend Transport; Tue, 20 Apr 2021 16:24:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18ac95aa-69b3-47c4-424e-08d90418d936
X-MS-TrafficTypeDiagnostic: AS8PR08MB6615:|AM8PR08MB5620:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB562064D1A803A28E5E8531B792489@AM8PR08MB5620.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OMwBnzZclVGY7nOHvK1oZ0TipcR8vFH3IjlWS+Z3HYzKQBHEx5cbv9Lf2F7hTscuq4/m0G+eIM+xrSKp2EKXNcV+Avxbblud1ZH064RzdcxRACJ4VonFijN/9yVU0sxgfQXiiuNV+kubXbO13kLkOJ9TdPh813FImUZdoc2qPwdnwRhVS+AmPBH26bnOsTPBvyxhz9m1vaUI40cUZFU5MqkJ21aGu0ByWqldQGv131bdu1Jy4OxSfBp7aCbxn+aeoQIyVEiRcgR1CuogXbXtm2TXld9YFOasQv7MH4gtYvpLB9ncGWRzKoQSNdNBe8DkeMUb7Od21nH96RTOF7xSbfxiGrRIGE8Mos4C8MJxVZ1tu3VlNzn7p+QwaMvAH3FDdhxVoM2lsEws7Z/zLTDjVviQXQckM/TW6lIWzqMLRrlH3u3bKCYH5YAJH+TeNGZc/XTY4y8UP781wIf83OUM9p8Op9YNHP/Ku21C8UcE5o/sumDaGp2OeBfN0TULfLqtSH43sxARyTJ1N1snb53le9r9uXKnlyTro0AQIf9YYvryawif7M6YPECQwxX3C6/fKGLExB+rnKhSv0l8yrpek86aMHW8vfr7OyTIWSioH9I3u3751ycTTjQgjNsbok0C7A0WbrPlTcIvwgeQwUOGEvBDB8i4pdEDehQCXBiF8ufsw4LmU/sztlOPNp0cotJ60nz1BhqL4xtAuBIABKCNbokgDPdTFX+dpU4BLum8Mv8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(6666004)(66476007)(36756003)(316002)(44832011)(966005)(478600001)(66556008)(8936002)(38100700002)(5660300002)(7696005)(6916009)(52116002)(2616005)(956004)(66946007)(16526019)(4326008)(186003)(26005)(8676002)(2906002)(6486002)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?LIADo9yhw/OBaPe09lIzx+sWLwl/LjIvpLSsbTYsWICJc8BDEg3nqa77P828?=
 =?us-ascii?Q?TWgxBo4GVzi96bS1v78169U2676xu2MoVlrSq6mzM7b4RBxO23EnXEhZfDl4?=
 =?us-ascii?Q?POphLjKgDPnQuVqV3lurkzZcDXrlu/GXGyU8vWdgnN6j68AmxXrXrLnpEydL?=
 =?us-ascii?Q?sjRhlOjpCJAmA2l4dM0ti6UpY88138XuvtB1kvqzYP/A6FDDH/IADprb4VI4?=
 =?us-ascii?Q?O2C186PhPCDdoSlUYWoZNtK09pe5E3ZAMWGhBEbeA6iso5TuRga1cJ7B+MQR?=
 =?us-ascii?Q?9f/J2h0G1ccpxp3q1e8BxRlGByRpDhNFw/ik2jwrsY4iHlx0EG3GtJiFVh7+?=
 =?us-ascii?Q?eARnKoI6G4bd7HVQ3GdQz7rnhmTAXdVBhRXK2nbdhoZXyFlXl/tACNolhe9G?=
 =?us-ascii?Q?lgmWXwrjOH/Y0NCPU0FjMUzZ4cwc7V6ANa5JjCcyQVmwsZJNoFc6qDRhyvCf?=
 =?us-ascii?Q?KOK66nV/c5ehQJD94RBjARdeqhXg0pPiMwM+A9j3zhrX28d4gGvBLnleY9lz?=
 =?us-ascii?Q?JDExoBJLgB5geTzRS+zjqKu8zIbViAYDOSn9WtuEDaCFwHQqEfDSY3j2NPVE?=
 =?us-ascii?Q?CAZcKV/lNFJCkLhEJYTKs7keyA3p7eAtys2ZItWZwfbLxw4sNBf7ipvzeHS9?=
 =?us-ascii?Q?/i1hGFoKr4OY13pT1BNKim19mXxN5xG71mYTdYRqkIhgfKbOSLU+GKFecT8h?=
 =?us-ascii?Q?rcmAsmDXJdpfxxw0q/NNwjn+Ro9+7vZlcpgzBBd71XYZo8XX691vm/eIO1TP?=
 =?us-ascii?Q?61WWp5iZ/cIgcHLTtH/2ZQVbwofQIjnHmG4HXuPWyDki42uEEcrqeXH+zW4m?=
 =?us-ascii?Q?x0FGtoohLylqj8cJt1kSi/pqZR0YWMl0mP21uO1EPANMCf4H9Fo7ODisGwkJ?=
 =?us-ascii?Q?xUAL+pbq4FqGr9663tlb3MlHRz5uM+i4pYSfyMTFHUFmWijzqhIWbyklZDaD?=
 =?us-ascii?Q?sGRf2omN/o8xnOyQEkFQNCr2W0H62SxvSyiJ8JD03h8bFUnwIP69AcuwPyPR?=
 =?us-ascii?Q?ihW06Fe13I4AAGaOtAHqPIL0bjzcHw+8IBFzMvaW3+GfXMjsSzP5iFYq7vUs?=
 =?us-ascii?Q?JigMQlWsTBVKT4MN0vZ+IPqAuLJT9faoCKVbvHh3y/VufFCIigmrBVjwsl8n?=
 =?us-ascii?Q?12i+eyCLVrmkiloriApBIn5eM2KA370cGxVZzDNBp/9/VVaVVtSURYYdsW0X?=
 =?us-ascii?Q?gveV80Kmp1iIpJi8Z9Aktg3lkLPQCvztOnSu5J/nMQTxmCuc66wpK4JYZNte?=
 =?us-ascii?Q?ZC581hOftqZLVPzSb+XUQmPPAQToUuDjeW8Dmdo6i3uEOch87v+crEb2YUFJ?=
 =?us-ascii?Q?g2d/N9WWJdHTQd70Ueh3nwHk?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6615
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fd8a8be9-7149-4c03-8ce2-08d90418d3ad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hHGifTh4k/xPz1lw1Y3taDB1d7t9Cf8hXjKobFLcjkC/SHiDWortIv6DHNT2JQLx2P+sXulagY2g1OfA1Lv/iEP6Q4I8wFftSJ1aN+AYPH3vj4x/kxxoy1A4qUAlpGHcF+AxfVa26uuSbBl/HXTCra1TKYOkJ66ZCHZDJCUZcqDIqe5e7VVEuXUtDLSuxCzaiIDZF4lkWUk8TTHpX0VoOYZRysiTjGYsa/pDQXJ+6hfTSk68Easd1I1sL7Gl52j/2I/c6JoCbxw+rr9VhESx6m40+jUlMqY/+A3VUajG/yMexncWCW0my0XmfyOx9gUnshYRWoMnrtpS2YD8XsumbXRYlqcpA39V4AuK8k33JOIR8Y7yl9cJKTAF4u/Lm/cI5Eu2RgX96nhwxnlQuT7RQfvJxDV0A4jVdFtSZ/3HHDNSifkWrE0bgBWP6qmUx2GIUYtBxfpFEZHSlO3VOkF7YgyvOoFUNfqtcP9+j+e6JJs+G3bmAlQaFCC0Cey1nton8HLMWujXygsfWzYekqTvfsOJhPGB48sySmH4KPNUnR2EqFhMy5jWx4AWwDxADsO19IbspxtmbWz0wCfy14CWv61jFvFzb1oZnm4EA0P5ugatDji4hrZz0K1BvLLTIdPfyN8r+RAkoPWU4YsTipzsKpV1FoG4slSmadSd1NaKLSnzyQ3uM3aI997joK37F6ku1bEWH3pD2JrEwL/XdAyYtPqCf3hSpQDa/5lbXWe+lq8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966006)(36840700001)(70586007)(6666004)(336012)(70206006)(356005)(478600001)(36860700001)(82740400003)(186003)(16526019)(36756003)(81166007)(26005)(966005)(44832011)(7696005)(8936002)(86362001)(5660300002)(6486002)(6916009)(316002)(82310400003)(956004)(8676002)(4326008)(2616005)(2906002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 16:25:01.9024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ac95aa-69b3-47c4-424e-08d90418d936
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5620
Content-Type: text/plain

The kas/fvp-baser-aemv8r64-bsp.yml is intended to be used as an evaluation
build for the BSP components.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Idce501224f4c8fbd6c53dc318db73dcd3100b57b
---
 kas/fvp-baser-aemv8r64-bsp.yml | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 kas/fvp-baser-aemv8r64-bsp.yml

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.yml
new file mode 100644
index 0000000..b08e1a9
--- /dev/null
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -0,0 +1,32 @@
+header:
+  version: 9
+
+distro: poky
+machine: fvp-baser-aemv8r64
+
+defaults:
+  repos:
+    refspec: hardknott
+
+repos:
+  meta-arm:
+    layers:
+      meta-arm:
+      meta-arm-bsp:
+      meta-arm-toolchain:
+
+  poky:
+    url: https://git.yoctoproject.org/git/poky
+    layers:
+      meta:
+      meta-poky:
+
+local_conf_header:
+  base: |
+    CONF_VERSION = "1"
+    PACKAGE_CLASSES = "package_ipk"
+    PACKAGECONFIG_remove_pn-qemu-system-native = "gtk+ sdl"
+    EXTRA_IMAGE_FEATURES_append = " debug-tweaks"
+
+target:
+  - core-image-minimal
-- 
2.17.1

