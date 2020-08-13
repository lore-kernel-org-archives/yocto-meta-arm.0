Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.52])
 by mx.groups.io with SMTP id smtpd.web11.11723.1597330371707399728
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eClbBT5O;
 spf=pass (domain: arm.com, ip: 40.107.4.52, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLIFSVON0qFLir6L1ym6bEePt2tmFbo0hVrO1oL++s0=;
 b=eClbBT5Obf6lQWYBCQPqADT5WEasGqpSdtmGgREtYUO+WKdmashCIyEwJR5lHPgkRuoODp4NVLLUo5rs7nNUQymdhBAprcunGdFzgggwW5VsPJOXUxWhTzevdaDHfr0kr9C471x+2VqR4kagJi22t3/JaD+Dpvh2Zhr8BbJCXT0=
Received: from DB6P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::24) by
 AM6PR08MB5190.eurprd08.prod.outlook.com (2603:10a6:20b:e8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15; Thu, 13 Aug 2020 14:52:49 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::4c) by DB6P193CA0014.outlook.office365.com
 (2603:10a6:6:29::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:49 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Thu, 13 Aug 2020 14:52:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26c01029badafebb
X-CR-MTA-TID: 64aa7808
Received: from da33eb56ae30.6
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2294FDCB-645F-4381-B07A-EDBA74203ADF.1;
	Thu, 13 Aug 2020 14:52:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da33eb56ae30.6
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlAAFIQSusrmAOTdKE9+90aY4dxhe8wc0rnzEKYSgAyL55g1gqslhf4bU+tdV0cQyPrUxuKn1/PuHauNUwkJhsjfAlUNuLh3hluTCf8BVVVQzGw+7QNDiwloGK1YBYUyH45P0Iay/SA+iPHq7KmRSI4ep77WZxzytOFAE4PrV0UyUcYh1ZeFkD2y3uszdI6ERSqfu7oWohVNiTB1LtbLX58Du85MjoWmFF9c6ZxJvha4KoK4GW6UQV2BqR6Cg0brqP+3QXfwiGwuBAKbA73dfiWjQ8nCUQoGnuNLrozfiElYDeu2ujJovR3HsmKLe47QLpzCyl/KoZrQLBErbn/6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLIFSVON0qFLir6L1ym6bEePt2tmFbo0hVrO1oL++s0=;
 b=nx68gRCtlJkcJLfsIDXpo+4Zj7MuevntbURFMPxtuEJS1Zr1MrGKo3451oy5F5YzSjZsniKpClPD/HjJcUuHsoQzOxi0VaNJ4b6wPid8zb/vgxdIrOrgz9EItqg/mJ6E8vkaShjFP7m9h6gsFPTvst/LmTQ1eoNWycdlcsgL3gE7gQz81FRs89SV7if8DD9uiOqurE//WURFHU2ov+eBOYkRtalb6RhOHw0FAD0Cg23lvYAt1Pc/4H/WX0WWv/wmDaGjW8V9TjMgIsMJdMj4JwdmKY0f13SELJcodDbaPMaDiWTMhhfDB81qL6BK8TDrTY0NCyRdVmA6RmQqrIrZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLIFSVON0qFLir6L1ym6bEePt2tmFbo0hVrO1oL++s0=;
 b=eClbBT5Obf6lQWYBCQPqADT5WEasGqpSdtmGgREtYUO+WKdmashCIyEwJR5lHPgkRuoODp4NVLLUo5rs7nNUQymdhBAprcunGdFzgggwW5VsPJOXUxWhTzevdaDHfr0kr9C471x+2VqR4kagJi22t3/JaD+Dpvh2Zhr8BbJCXT0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:42 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:42 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH v2 2/9] arm-bsp/machine: adding corstone700-fvp machine
Date: Thu, 13 Aug 2020 15:52:23 +0100
Message-Id: <20200813145230.22140-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81b69346-d8f0-42bf-5c8e-08d83f988c2d
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|AM6PR08MB5190:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB519072A1B0F41D95CDF9B259FD430@AM6PR08MB5190.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aTTlsSCWVYqknmm2ehQHMwnwi/SNkijTS4yKmpgdv9GQrhyyIQBOuoPs7LWks1dtW/fIDKc70NdKwE7sO3D6o8cJ4msreIvHc45CNBq9ggxPFp2l1z5yWNYYWU2IdDcfZJfXQYKxRNDdvTVPglLtWgDPYTV4+baLKkyxy3ucslFhKRn/huJMXOM0ELq9ueiAtMrwwpt/VraQaFTEywuHgml1/NyyrbOn0tiMHIITcR+kYXt1QZv9DoZ7OkW1MpIZsqN1NptCacpNNbVojFaaEmUpYq1I0ygDDuQNa1IFnka+mDk3Yog7b5Kib7hQFqaKkyYE28yRsTbafx8ApKD5NohoJMi4ZF72q9rDQ0/7hdx99lkeEoumygnF7jtcXfxzfPkzEy8WrWuFrTe9Kc3vpw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(7696005)(2616005)(956004)(316002)(54906003)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(966005)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 4ZaOAaHkL9kJi0jkaTShR7+avq0FI3bTTHyYHzav+efaYWzWOqj8aLblQY86MASUFXpzsDR+1urBI7pWZSsnaUL6dEfet4IJX6gSWP06Zx7T8WUzatfq6OJs/n/9YwT/d2yJoglH91JsnbgZsVktiHagm5fZ2ptuDwI/goAelj7zJcytWr94R/FEpSweXWu5nxOxo4nW4YCyiQ8It7zgv0ccnIx5V4hSC+EXhcq2YgRxqett0qUOMbdecWxLS5VRvKXankh/yASa0995E9YLr5qYF288sXLBmrLXLBPan4Niv6Icobc3HJ/fgXqSdPQedHXGUP4F0B4yxavV5D9pRiXK/OkSQzZc8x8IJ7oxXiD2Kd0RdULCQp8VgJVJRZQ9YFsGv01Z8fjITlJTiCeH4qibh8s7u8cKyHBAT+4pehg39qsk8qg0CyM1Fax26vYOTP/M2MTHMqDU9HIO669N/gbdabP/J1zaWvTTETuxyJ54Q8xntZ0wFeEx14CjFE02hOt1nSLzVAqnGeCB4Mm38Vocp2/u7HaHjX4SuwftyqmluOeyMBTjc71W+f164/ufIok3hUfl3CajcTC2uxrGM/lDbmfL2ji1k0/8riJeZDSxnzs5PgJe8pJ6TElQMJSSdZs/khJ/hdiVbaDvZuBa/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d97c9598-92b6-46f0-a4df-08d83f9887d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kfwz8z86dW89NgdJIPS89ev20QI2L7yXMQKzhdakvo/a1JwBpOv/XFK/3mvh8ooy3kdYTbemaz4uA2xeihzk9NcnxH7Zhn3KGPNhOJ29V4c19vOqCsf59fC6v7Uos3roOVo0nndd1VgsTfEQQOJPxTxoq+be83QodWnK+8iMrt1zVj4TQdaqZYNdVPHgclfjKZvv3W87BBqjp/Eg7gQPS+Xc1Ej3nA4eje21IAntoyTOItaelv3WvNuRmU/SQ69wgrzwORAWKh64UnWh+hz1kQNsWMUqqCNnyZSf5NhS5NUyh+SnBNhHPX8+8TtzkHGbyvz9ePYTM27IiPWoWgYndVV8R0fOprjZXE63cPdIKGIgqxzP6vj3HP/0cDoVRJCOK1woRjGRxPh7bB1yS9PHngNCmUy03hYxxcc7oCSdM8mLADKjsO2SAvGHp2W6NpM1B4Nqbk2lfc5kGs/v5NZSp27wYK5+MOCJx/XMG+f+JXQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966005)(8676002)(8936002)(5660300002)(9686003)(966005)(70206006)(2906002)(26005)(54906003)(6666004)(70586007)(316002)(478600001)(6916009)(2616005)(7696005)(36756003)(82740400003)(47076004)(6486002)(82310400002)(81166007)(16526019)(86362001)(186003)(956004)(336012)(356005)(1076003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:49.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b69346-d8f0-42bf-5c8e-08d83f988c2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5190
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This machine provides corstone700 platform on FVP.

For more information about the platform, please check:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444/corstone-700

Change-Id: I1197d3216f37ab8d2c792da82c4f5e7e17d5a09c
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/corstone700-fvp.conf         |  5 +++++
 .../conf/machine/include/corstone700.inc      | 14 ++++++++++++
 .../wic/arm-reference-image.corstone700.wks   | 22 +++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
 create mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
 create mode 100644 meta-arm-bsp/wic/arm-reference-image.corstone700.wks

diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
new file mode 100644
index 0000000..a6faac7
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/corstone700-fvp.conf
@@ -0,0 +1,5 @@
+#@TYPE: Machine
+#@NAME: corstone700-fvp machine
+#@DESCRIPTION: Machine configuration for Corstone700 FVP
+
+require conf/machine/include/corstone700.inc
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
new file mode 100644
index 0000000..67cf153
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -0,0 +1,14 @@
+# Common configuration for all Corstone700 machines
+
+require conf/machine/include/tune-cortexa32.inc
+
+MACHINEOVERRIDES =. "corstone700:"
+
+SERIAL_CONSOLES ?= "115200;ttyAMA0"
+
+PREFERRED_PROVIDER_virtual/kernel_corstone700 = "linux-stable"
+PREFERRED_VERSION_linux-stable ?= "5.6%"
+
+VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
+
+WKS_FILE ?= "arm-reference-image.corstone700.wks"
diff --git a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
new file mode 100644
index 0000000..39c70ce
--- /dev/null
+++ b/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
@@ -0,0 +1,22 @@
+# WIC partitioning for corstone700
+# Layout and maximum sizes:
+#
+# SPITOC: 1 KB
+# SE Ram FW: 32 KB
+# FIP image: 991 KB (composed of FIPTOC, BL32 and DTB)
+# XIP Cramfs rootfs: 2 MB
+# XIP Linux kernel: 3 MB
+#
+
+part --source rawcopy --sourceparams="file=spitoc.bin" --no-table --align 1 --fixed-size 1k
+
+part --source rawcopy --sourceparams="file=se_ramfw.bin" --no-table --align 1 --fixed-size 32k
+
+# Rawcopy of the FIP binary
+part --source rawcopy --sourceparams="file=fip.bin-corstone700" --no-table --align 1 --fixed-size 991k
+
+# Rawcopy of the rootfs
+part --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/arm-reference-image-${MACHINE}.cramfs-xip" --no-table --fixed-size 2
+
+# Rawcopy of the kernel binary
+part --source rawcopy --sourceparams="file=xipImage" --no-table --fixed-size 3
-- 
2.17.1

