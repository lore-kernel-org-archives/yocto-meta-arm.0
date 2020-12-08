Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.75])
 by mx.groups.io with SMTP id smtpd.web10.1778.1607389233424834153
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 17:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=rgNkHMx9;
 spf=pass (domain: arm.com, ip: 40.107.7.75, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKvWYcX+L9Tgn89Db//S16MDoT9jvKmQBmMol0TrjG8=;
 b=rgNkHMx9KgY2RCENrqWkBR/3L8Tx3NJPnwhy9q28ZO1FcOVfysn3rCenTxB+pXQ8fQ/HQBbELb2wtNsoZgSkiRe7I6GxqVTg/LqWoG/zj+Nc3iDEMzx5tMbOoCEtDfYdoh3SkE+3JjgDAFBBWyvbkzKR5m7mjt+coKMH7vz4oME=
Received: from AM6PR0202CA0071.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::48) by AM5PR0801MB2002.eurprd08.prod.outlook.com
 (2603:10a6:203:49::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 01:00:30 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::11) by AM6PR0202CA0071.outlook.office365.com
 (2603:10a6:20b:3a::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 01:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 01:00:29 +0000
Received: ("Tessian outbound fc5cc0046d61:v71"); Tue, 08 Dec 2020 01:00:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb0308662cd7c8de
X-CR-MTA-TID: 64aa7808
Received: from 2b8a15ae7b56.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7323E250-4A07-47FB-AD4A-FA43182CF7D0.1;
	Tue, 08 Dec 2020 01:00:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b8a15ae7b56.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Dec 2020 01:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TH4TIarrgQh+xpqYOi3diTGgb9OJZMCc23WyOH6gn7jl909hbwHhVDmXxi/oy4F0rsTK/iSlYrBTysSEPoSOpTqGKAdNTMsRto2Qt9pcY9Q/lAg1y1Sn8O6n8EdA9DjpTKToohiG/l0A+sItOhBJM6fT7LOp3vj4jQJAFjUf1Ev6WMUtjqM7JjS5AQt+QmOo2tL4+uEas4/Y2LvN9dz/W9/ijFJa82AVUEoWee4Ui8OJvHq/l9b+VuKSA1PR4+IMY40sULVLnsNtkStX8iLmTlnTUBHpeZi14lwxXgUMvd+N2cEYysfCadXqCeIKKdIAanR4c6PUSks81XTI6IiVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKvWYcX+L9Tgn89Db//S16MDoT9jvKmQBmMol0TrjG8=;
 b=cBXSfpNtIF7muoRJue0RF2fNEi56u3ifSxp+BcNO8yBcKmGXdQ6iP18gctx8kNew/UoPZIh0keOLWTtZEBJB0a2PG9MulIodw7AByS55MXkqRhl+9Gshqr86zFJOTdP7PXAEewa7tVaYwWKJpNlz+X7mtIvJXKo2JY7B/gkz+lbLDeM18WziNfG892g+k0I/zVMXLjkuUlscLpOGlVm9ypw2oWc4dpCRF2O6Dcy9WstXZRjZxLU2S+e9nLp6wRhaEc+jtyiyspsP/us3O3+oBzMTpeUwm9+CcKtuulTyButxQPps5tOSwjHQ7Nb08qJaha6sTG7k+bEEKxOIiVxyjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKvWYcX+L9Tgn89Db//S16MDoT9jvKmQBmMol0TrjG8=;
 b=rgNkHMx9KgY2RCENrqWkBR/3L8Tx3NJPnwhy9q28ZO1FcOVfysn3rCenTxB+pXQ8fQ/HQBbELb2wtNsoZgSkiRe7I6GxqVTg/LqWoG/zj+Nc3iDEMzx5tMbOoCEtDfYdoh3SkE+3JjgDAFBBWyvbkzKR5m7mjt+coKMH7vz4oME=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VI1PR08MB3181.eurprd08.prod.outlook.com (2603:10a6:803:3f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 01:00:09 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::8405:a3d4:af8c:a2ce]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::8405:a3d4:af8c:a2ce%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 01:00:09 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/scp-firmware: Update N1SDP SCP firmware to 2.7.0
Date: Tue,  8 Dec 2020 06:29:50 +0530
Message-Id: <20201208005950.6172-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-ClientProxiedBy: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To VE1PR08MB4846.eurprd08.prod.outlook.com
 (2603:10a6:802:ae::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 01:00:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9346cce6-e94c-4234-16ed-08d89b14a85a
X-MS-TrafficTypeDiagnostic: VI1PR08MB3181:|AM5PR0801MB2002:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB20024F6D970596E6635A6717FACD0@AM5PR0801MB2002.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MPI1fC9+XIRdyP3s4DOGd9gABkWPOXogUulyVvKs7kLmLRSz5xGDsXpUHylGKAnQmelHvyZITUJqDB/eqsNMA8K80M0DB0AJWSGu0PuHCbhuO+Aj5fTQpYl9KWYkiuTvkokeB+/XqsyXP9W4pEywCA9GeG3fVoNpQ9bkGI3TyiD6BopMS0kNpdsgH+rRDCf+hi1YTVTvER8Pz3cVr7zjLI6z3NCh7vUrHpg+CDkwJ4bXWjoofKLxqicFiIm3VXYg3ovsHji6Um+LoEQDVBre0vLLfFgK9+Y5jWQpjeUStMjxHrIQ/KrjFSaBV5B/J47UvsKfoRRr+ALVM7kc9o++JSN/eMhI+kR6zsm7El/0nTpXooOyE1iWBABiRcFREImeFtl1YmdyC8OsVHWJzbchCT3OKKxo3/IUUmKekKZkhQ6vLSqc+Z36qAPbdV9zwEsZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(66556008)(36756003)(86362001)(66946007)(66476007)(6666004)(2616005)(6486002)(2906002)(8936002)(8676002)(508600001)(956004)(15650500001)(6916009)(5660300002)(186003)(7696005)(4326008)(26005)(83380400001)(16526019)(1076003)(52116002)(34490700003)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?UYJr0M1SiguydmMfYndh6YAi114IPsSjv1M3vdU0XanJ4dk40E8m8fmgKS1N?=
 =?us-ascii?Q?1a2L+LHkqv9gt0qiBYOZA6niLufizZ1UYcL0AOcCrdc7NVbS1mdBfuGMmpnh?=
 =?us-ascii?Q?/QRv3dMFe16Z5A0DrSfQexumZT6X2kIHQmhzwPK1qtjnq2DJZeW4rb6UORxx?=
 =?us-ascii?Q?seobeVlzt1w6y+cRRNssIIDZdE1W2Av8t1FlkwGuvQHYWO377MAuv0Pxrptr?=
 =?us-ascii?Q?yVoEkoCsAsIBRqVUK2L9lpad0j2GQODs3dc4RWEQY5UIEwar8Vtaq1YNppKx?=
 =?us-ascii?Q?EzUNBFftIg6zdEqHKgVmLv43BvxB6qaIfpBLgs4efDM3VsOjWWzQ/ZVBq+8f?=
 =?us-ascii?Q?SpeDOINlGUm6ocW/93AFhdoCEwiqUXnIOovOEji1JxfsyaJF7qhHUpV7/ISs?=
 =?us-ascii?Q?dUKXmpm1FTH2tfw2ssCg9CdwB90H95ED28JsNMB8fSsZSR22IhuolUZ6UapI?=
 =?us-ascii?Q?R5kyHfsCUrmzl0onBnDHo04hoCpS8xVSci9K2FEi5FEPpUHUUqhmVq5Vh31U?=
 =?us-ascii?Q?lpJ77TbBaC/S7MgmyBsVthTWAq0vrlEPigForZVGIdS65i6xjMsxthG3fHFe?=
 =?us-ascii?Q?hhcZfZfyG1wIv5+dwaLqzqN+VFuMHmfhPQNPvAlTfmWDpgpRUv55wKeQm1Ts?=
 =?us-ascii?Q?annXD3rw3GTzyKrtS89RcMU/5XTCkQq9D8azxPuBMFI7qzPq8/hZ2plwLaOU?=
 =?us-ascii?Q?VAFhHZnOJDMRwX6l47HY55WTu6Kt+Bgfd9nYpv3vAiD6WaKwj8jKUdavM8zX?=
 =?us-ascii?Q?yT3TdnnT6Ls1AXAq7ptCTeRG37IDkXdcMwmzaHkb4IqwoTnBZDU7Jx7w4Rsq?=
 =?us-ascii?Q?spv+HtiBH4t4GqMnPxMDoFO18nP2gVMe+t7qvzuPBOqO7BAJkg1mKQ5Ox4Wf?=
 =?us-ascii?Q?Z6HSIQujzYF+8NKnj3YHhXUbFoRdxr4LvwhBHmOl7EaNzHhdtnJoGRtjg8dl?=
 =?us-ascii?Q?Vz+3oVm4Vgf5OQ/qZt+P+8KESRvru3wFHXyPvqIkpKrfl0NhLVxVeIFTxxcN?=
 =?us-ascii?Q?4/EO?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3181
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dbfd8920-e1cc-4d14-244a-08d89b149b83
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f0n8K489fuaYXKbZSaI91KpyMxV7NY3tJmWJMI0P1idgzcz5l6SeCBCdQnHKP9mX6HHDy70pH8P2hERJem6hrDqjEr6yeKNwXftTA65kcfuZco80SFqKmyOFcxbLHmS/b2AA5BfFqo3aI1z3hY3ntSV+KSIrf5NAW/wYFnCSZqNNsezuk2r+tCVrI6OlVzbhwpL1OQ2FwHJrmvZOzGHZ3b0t70mtj0uUObxN6kFn8E4NLAok3l0/l65bjcowpsw70qX6XKFCweg6lWsXln/R93Xf6s44f9hLhcH8fFRXyqiMMbQTWFktP4tp2wGpeft2nT40I8d2XAETj61lQJzq3ScGFflB0PEwqRPi9hXG5vFCWA++lbtWe679yA2J6gK6QbEBw2fZqIBH4J7hmJAu02+CB8eytKyWspT28sJCsgXM5Z2jdU5957umnV0NOB5I
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(46966005)(15650500001)(7696005)(508600001)(16526019)(4326008)(70586007)(83380400001)(8936002)(82310400003)(8676002)(6486002)(336012)(70206006)(36756003)(6666004)(6916009)(956004)(2616005)(86362001)(1076003)(2906002)(26005)(5660300002)(356005)(186003)(81166007)(47076004)(32563001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 01:00:29.7763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9346cce6-e94c-4234-16ed-08d89b14a85a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2002
Content-Type: text/plain

SCP firmware recipes are updated to build SCP firmware version 2.7.0 for N1SDP

Change-Id: Ic42fac178cf4ac9e87127e9b6258c9bd15101906
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                       | 2 +-
 .../recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc        | 3 ---
 .../recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend    | 1 -
 .../recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend    | 7 +++++++
 4 files changed, 8 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 1f11acd..441d8c6 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -31,7 +31,7 @@ PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
-PREFERRED_VERSION_scp-firmware ?= "2.6%"
+PREFERRED_VERSION_scp-firmware ?= "2.7%"
 
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index efa3acb..635ec39 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -1,6 +1,5 @@
 # N1SDP specific SCP configurations and build instructions
 
-SRCREV        = "350be71a2ecef588b8ff5a095a0840de23506e45"
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
@@ -12,8 +11,6 @@ SRC_URI_append = " \
 
 COMPATIBLE_MACHINE_n1sdp = "n1sdp"
 
-PV = "2.6.0+git${SRCPV}"
-
 DEPENDS += "fiptool-native"
 DEPENDS += "virtual/trusted-firmware-a"
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
index b760ba7..06b236b 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.6%.bbappend
@@ -2,7 +2,6 @@
 
 MACHINE_SCP_REQUIRE ?= ""
 
-MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
 MACHINE_SCP_REQUIRE_juno = "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE_sgi575 = "scp-firmware-sgi575.inc"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
new file mode 100644
index 0000000..53bd022
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_2.7%.bbappend
@@ -0,0 +1,7 @@
+# Include machine specific SCP configurations
+
+MACHINE_SCP_REQUIRE ?= ""
+
+MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
+
+require ${MACHINE_SCP_REQUIRE}
-- 
2.17.1

