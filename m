Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.68])
 by mx.groups.io with SMTP id smtpd.web09.6213.1631260403027824296
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Sep 2021 00:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3X9LcUk6;
 spf=pass (domain: arm.com, ip: 40.107.5.68, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtHxSQMR41eXpP0lWNO02fyB/SgWbVTOeKC3GdEjwRE=;
 b=3X9LcUk6n5MBG5c81XpdadzbmTd/Da7Qna2nEAHnr41GtX2d5Mgro0ZDswQlQLjGHQbrjSIjw934Tgp7eBHknX6RIlKVO91oM6nTf6UOkTowTSdrb8SX/TkXiCJeb/2VDk8wGmR3W5PZI05HvCXXCJK+ny+7N1DO0L5BcN0PCew=
Received: from DB8P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::38)
 by HE1PR08MB2873.eurprd08.prod.outlook.com (2603:10a6:7:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 07:53:18 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::1a) by DB8P191CA0028.outlook.office365.com
 (2603:10a6:10:130::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 07:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 07:53:17 +0000
Received: ("Tessian outbound f1898412aff1:v103"); Fri, 10 Sep 2021 07:53:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7b17f7d531fde7b
X-CR-MTA-TID: 64aa7808
Received: from 19931b70584d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D4F24879-8442-405C-B3B6-58E9DA790955.1;
	Fri, 10 Sep 2021 07:52:28 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19931b70584d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 10 Sep 2021 07:52:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4PaUt1JpevjM9M+Tt4nDYj2u3tO3bzXo2MAk1K0hNcvzWhCBfu6uV225ToiiSRL7rFtwUGUSgZ2tWpwnYCA729HJjsJ8MC293WziCtlT2annkGkb/vAvmCx7hYp2tSYxmDjHZO45BU0k1CIGzyzKi+9iIYYPmMsm0dV0Qf0r9FUVYUFeg2JHJTC21ThMWqwdtnjdV5v/Sjp0oSBmmhvky4Y2UQo6wEeB9ndA2w1ILgBmOkxXXqjCu63jJ4cFVOKIccwgotcrWYytfATBsD4ypg7C1ngsjkO1e7Y+q+TIQqui5OdNbbxItWA25i1YptOSuqBRjyVvBv9dhxYFOnUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LtHxSQMR41eXpP0lWNO02fyB/SgWbVTOeKC3GdEjwRE=;
 b=mkkj9JSHwpIqoQNGIftoJ6fuB0XVw9DUTP2Xz+C67wlLV+Tmnwig+fJm2A6SbrJ/i14aT0HjKDah+Hwedr0N72ihHL7wQUz6SURa81XxOUHE7K98AchsYPHNS8Hq55q+koNzV/v/2oOHVikYnj1KSOLI9sScG9n+m0lNIJH+nc7E8d7jtPPEhSozNccsYKRHptGsXxb3GDE0l4doCQPYGAi/4HaRiNYNIKcLUk9HF+bezHVGs4xK2YdiNoD5l8Dy3e4j13iw/VsE0qsDp3z3VIGNuSidhp9QV/oadwu8i9jWkAlI+FHEsEe0kcljnPYNL6I6JWVy1Dgjk1NUwsYInQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtHxSQMR41eXpP0lWNO02fyB/SgWbVTOeKC3GdEjwRE=;
 b=3X9LcUk6n5MBG5c81XpdadzbmTd/Da7Qna2nEAHnr41GtX2d5Mgro0ZDswQlQLjGHQbrjSIjw934Tgp7eBHknX6RIlKVO91oM6nTf6UOkTowTSdrb8SX/TkXiCJeb/2VDk8wGmR3W5PZI05HvCXXCJK+ny+7N1DO0L5BcN0PCew=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VE1PR08MB5040.eurprd08.prod.outlook.com (2603:10a6:803:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 10 Sep
 2021 07:52:25 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::11fc:9515:ac44:707e]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::11fc:9515:ac44:707e%7]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 07:52:24 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/tc0: Update kernel configuration to support Android S
Date: Fri, 10 Sep 2021 08:51:57 +0100
Message-Id: <20210910075157.19378-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::15) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.49) by LO4P123CA0316.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:197::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 07:52:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e7c5ef3-96d1-4848-80d0-08d974300d1a
X-MS-TrafficTypeDiagnostic: VE1PR08MB5040:|HE1PR08MB2873:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB28733B221193823EB3638BC389D69@HE1PR08MB2873.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VXE1qRDF9WD8uHcohjcswRcHcKfG9Ifmz3bzYcZhG3wS6EgzPtphNMYxzpjLP/Qhp5Gson6WGuF1Z0d1D3GxKa7rlTJKyuK2WtIWLV2J0MrjdZH7LH/NFHERTq6YObTTbpSNQZu0fUTwmqXa3H2Ctu1dfJxIxNtb7BDlQ2w+/hTqtwem8J6y9TmIR0/zlffJf550Mb/H/mRjS3cIGFw+xugp6UBd9HyK5ClO4yAHRl4PaqmjdpOo4VZjgTCPEG+ZMhXv9YH3yuY3nzvSlVgUIOTWZ3c4Lx6a9c2RV7v+4P52NC3t3WaL25Vtkni3bsW3PVoQORoT9tqmoZtAJFtdHuJR7/mFynhUqpDMZH1X+E2nnl8+LhfD0bHUQpRQCsQdm1vJRkzS0W4+Bv1J8mP/vfViFdsFS79w36mt17Qm/1lrMn2Gvsk8DldCoHsy0eaiVv1r/taLoWJsEBLz87/aMqiVgsW7wqyN4WocE+FJhBmKrbmM5o4ijMx5qWdok1rWXxavirrBSMNNJ2iHh121qBZJguIqiT1HgjlrvqCNPXzZGUWn+Vnc+CPYYt0ajFyXo1YNk93N/YlGQdUnxTkHG2J2t0lCBrlwBGse/qtEG1/14pcqaIVg8bHoFLkxMk3yTQZBp16xcgg7ByTB7WbPoZHS+cFjoPtoKfzYcYgZSc8N+IZVBO8uXXE6I9Na5mi5EvAUM7D8Ko8ToNIWKIoO1g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(366004)(346002)(396003)(6666004)(2906002)(83380400001)(7696005)(4326008)(38350700002)(186003)(38100700002)(15650500001)(66946007)(66476007)(1076003)(2616005)(956004)(36756003)(8936002)(8676002)(44832011)(52116002)(86362001)(6486002)(5660300002)(66556008)(478600001)(316002)(6916009)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5040
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc9f17d2-1e4c-4de1-ad1c-08d9742fed5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2b4R6Brljwf2bA6zbOBX9zHGgE1DmWgQijvTjC5gtg1rkW3vcBrOd7o/Q1ETLd25TpE7m3sYC8xUncFO7xjZI7BqsFk390slR81Gyo70nklxXb60GGnkUZIytsLP/+4utn/lmt+6xb08CJHpHhNzg4W9QmlifmilYWAQ/fLAzpwgk+7ehs7E1pCmmV0jN7o2H0D+ypUxRBqicm0JlbaBWJPdy+qm+0dMX94fU01VqUteeGg0KEDYolGAKo5vLkNxEVY0NCiWibipi1h+lA22/emlicDx7hEn1YnRxH70BDoEpJMF75MbWzxd2MMChUu50EF/owQ8wA7O5Cij3oZWWs8YiQBJzWPqttiItCTPu3qC6cgJ/m+/P0dD4W2rNIR3+l2CH/+XB+9ZDDiddy7j8XZv5egxsavWpTy2AyvfMqs2k5InyucO1rYHgXfDQceVB6fYmMHeMX3y2cZvlbL9lVZVmfsPb+SJOZId7asl0MgU5TC6kqu0mS21fkT52LyesMJ7VB55EYjxMtV2Wl0eB0N+ZPp8OfTngbflsepEuo5c7UO1BOOhChi10a3IE5R2IFbhGemh/TQvnDIT3+cxNihoEgJIwLhY59gskLGIl9yuXzjUVi1vBmCB8o4zNxdMlgLZQ5726GDMhm+HMc2xxemR026lSPvtA/+uxXzOVFMzY0LnD4tthY/4cXQ1z1yxLBp2RcW+AbihawPC7WvZOg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(36840700001)(46966006)(82310400003)(44832011)(956004)(2616005)(70206006)(2906002)(8936002)(4326008)(316002)(36860700001)(47076005)(86362001)(356005)(478600001)(5660300002)(336012)(1076003)(6666004)(7696005)(15650500001)(70586007)(26005)(83380400001)(36756003)(6486002)(8676002)(81166007)(6916009)(186003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 07:53:17.6648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7c5ef3-96d1-4848-80d0-08d974300d1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2873
Content-Type: text/plain

Android has deprecated ION and moved to dmabuf instead.
Update the kernel configuration accordingly.

Also, enable "CONFIG_DEVFREQ_THERMAL" as this is required by
the GPU libraries

Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Change-Id: I7ee3659792984f71cf818ef175d7e5ecc25c6d93
---
 .../linux/linux-arm64-ack-5.10/tc/defconfig       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
index f16b899..f8ef55b 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/defconfig
@@ -100,10 +100,10 @@ CONFIG_ARM_SCMI_CPUFREQ=y
 CONFIG_ARM_TEGRA186_CPUFREQ=y
 CONFIG_ARM_SCMI_PROTOCOL=y
 CONFIG_ARM_SCPI_PROTOCOL=y
-CONFIG_ARM_FFA_TRANSPORT=y
 CONFIG_RASPBERRYPI_FIRMWARE=y
 CONFIG_INTEL_STRATIX10_SERVICE=y
 CONFIG_INTEL_STRATIX10_RSU=m
+CONFIG_ARM_FFA_TRANSPORT=y
 CONFIG_EFI_CAPSULE_LOADER=y
 CONFIG_IMX_SCU=y
 CONFIG_IMX_SCU_PD=y
@@ -324,7 +324,6 @@ CONFIG_DM_MIRROR=m
 CONFIG_DM_ZERO=m
 CONFIG_DM_VERITY=y
 CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=y
-CONFIG_DM_VERITY_AVB=y
 CONFIG_DM_VERITY_FEC=y
 CONFIG_NETDEVICES=y
 CONFIG_MACVLAN=m
@@ -529,6 +528,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_QORIQ_THERMAL=m
 CONFIG_ROCKCHIP_THERMAL=m
@@ -785,6 +785,11 @@ CONFIG_QCOM_HIDMA_MGMT=y
 CONFIG_QCOM_HIDMA=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_DEFERRED_FREE=y
+CONFIG_DMABUF_HEAPS_PAGE_POOL=y
+CONFIG_DMABUF_HEAPS_SYSTEM=y
+CONFIG_DMABUF_HEAPS_CMA=y
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
@@ -794,9 +799,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_ASHMEM=y
-CONFIG_ION=y
-CONFIG_ION_SYSTEM_HEAP=y
-CONFIG_ION_CMA_HEAP=y
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y
@@ -827,8 +829,8 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_ARM_MHU=y
-CONFIG_IMX_MBOX=y
 CONFIG_ARM_MHU_V2=y
+CONFIG_IMX_MBOX=y
 CONFIG_PLATFORM_MHU=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
@@ -967,7 +969,6 @@ CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_CRYPTO_DEV_HISI_ZIP=m
-CONFIG_CMA_SIZE_MBYTES=256
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
-- 
2.17.1

