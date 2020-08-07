Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web12.5199.1596804147202400960
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yyxtweM+;
 spf=pass (domain: arm.com, ip: 40.107.22.53, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL1PL4O/J5NH+mxwk72uEboIKZAS7vgccZR5yQ4eloc=;
 b=yyxtweM+H9ctFOqskMdgKZZVhIiJowTf2j+y4RjfX9LMtAh6nyvTaGLYbbDsoDAC6u40SAxY4yRpJv5GhywHcWQWBICL5o1Zwm3rKBIbhEitIVvMdpLBDKC2b6vjU6PVR7B8y8LwxBT67VrKfN5gaVAep5HlFBxtPkBkQePXVCc=
Received: from DB6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::14) by
 HE1PR0802MB2364.eurprd08.prod.outlook.com (2603:10a6:3:c7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Fri, 7 Aug 2020 12:42:23 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::f3) by DB6P192CA0004.outlook.office365.com
 (2603:10a6:4:b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:23 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Fri, 07 Aug 2020 12:42:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0880c4274576c7c5
X-CR-MTA-TID: 64aa7808
Received: from b90ba483d29d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5DF4B91-67E7-434F-B8E9-9F6EF7ACBE61.1;
	Fri, 07 Aug 2020 12:42:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b90ba483d29d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKlPAQX0fDsD12liUBem0T9W5Og7zANTJtuz78B/CT9bGFcYo6rAcyeAFDoCQVlPCFaJoGmLTLhgCbC2mzKvnE+H3NVjnPwLTTN+aivzheXXNBhaz2HnBMQUfzNyO8ykiRgTtx9Ult7+MW7pL/1Dx7BrCHYeL1wAJf1I7EQtf8Y1fF5OrtJKH2GlL/OFIFyLJUPdAu/edHCPGwRRTIkGf6SGqTO8qh3+Ja9K7mTJ0klWBjkgC6jRuAAW2ISpXy0QpqZILFsOQKBisL3qfNkD+GhgOCX5KYUSoJtmgVND0+HJKv/8WOrwpkqx0s0IXiUXJx6KwPsDsUxuOWxn6LN22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL1PL4O/J5NH+mxwk72uEboIKZAS7vgccZR5yQ4eloc=;
 b=RURhOoroJZIt2nRSPV+6g7nonO7D06QOzsmZauEXm7+F0sKow5N0FZ57uZPMY475PS12XrOj2vSrHlIBWNhCBUdMaHluIzAYIwhd2/iS/I7M+EW3jGg2rcCMphSayLkGHmAvP5x8gk3GPDFjIs+JhZRU0Ih00AIowPRAQzp/Ywteips+1eFYAPCzgunFLLYaK02ypbstIor8S9EUmxVVzvDMRVdLSidquhpx6/366TKqq5tTCxFuvnjQXgBL94Go2q22G5I4kbPXfSew4hnwlpLEfUk9+V2OjoXBrcJb21k/eSakh813cdoHLha+y5ZXaO/5BkSWQ4mg1eJkkBMzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL1PL4O/J5NH+mxwk72uEboIKZAS7vgccZR5yQ4eloc=;
 b=yyxtweM+H9ctFOqskMdgKZZVhIiJowTf2j+y4RjfX9LMtAh6nyvTaGLYbbDsoDAC6u40SAxY4yRpJv5GhywHcWQWBICL5o1Zwm3rKBIbhEitIVvMdpLBDKC2b6vjU6PVR7B8y8LwxBT67VrKfN5gaVAep5HlFBxtPkBkQePXVCc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:15 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:15 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 2/9] arm-bsp/machine: adding corstone700-fvp machine
Date: Fri,  7 Aug 2020 13:41:48 +0100
Message-Id: <20200807124155.24198-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c79cf5c2-bd62-466a-99db-08d83acf5564
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|HE1PR0802MB2364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB236436AC8772AD92B6A71EF0FD490@HE1PR0802MB2364.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iApoJZ5twDgsjnbhJfPpaqqWU6efpUjf4onCICvXDgs2abDY7hsv5QImG2srNNf/bRYSoKtoZZkOcw8tQMDG3z2rmxSFl+fqJ/ynPyEamocXOiTqMuB4JtpQ8uFD6wOn9MK3zKtfr1zYHpCLczS8NeNZIX3YkSz9xocx8f+Z9W5W1+ISqEIt4WHuC4aQw+B1e6D4Kz4Vk8H+P4dT/YULCFME0Y9RVzMs+/J95W6JKVHYttbM0/bakPagchvIBEf56TBwj3eq6tOW5/UL1y2j+P9f5MFcD3566hdVrtlfbtFDOq6eF5PjlUZkWA/4YKwLDoToobv6nH2nxvD80NzwTHBEfnKHhYyH7yEdZtLFeh/DSGx8sSkVK6NDYCF5D2RrhybQ0Iqk1RuP8oP8n+0Ckw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(66476007)(66556008)(36756003)(9686003)(478600001)(8936002)(8676002)(2906002)(6916009)(54906003)(66946007)(316002)(6486002)(966005)(4326008)(6666004)(186003)(26005)(86362001)(1076003)(16526019)(956004)(2616005)(7696005)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 GK7K0XBoUoNIJ4n4eboBVLbpE8cSQ7uC8lV1vLwU0zY8Ov+3CrTEImZGSIXVp/l9GKl1BX0mtXwgYxp0AcotZ2FxFZD485iuejEmfxIduMUF6utrdBLEIRyxgbMaFrsVgXEZEINFgEw/Sr2ZT5tsp/bBiaOi4GYXCNqdm6HlblGT7w7L2yfZH04kwjVmJVLd1rRjFJrRO39jZKaPLY50TggEAJemSvj89NiwwNlvSyL15Be2NGe32ec3Hn+tDUt9xkcO4IYhyP0mRbdXEJ0zXVzpu0UC8tuiwgP/NLnxmDsW1I1hrXxfKO/uAcxYVpNXKY+7Ye/+zG3Z9kZ7pS0G6eQGZD1ONNiknIi91fuJfOiFD6K/N+KJxnpkmB4r14G320ALRXSi3qi/OkJA5SzmE7fmdABwcz/m8zKAIgLymS9+7lRYdfQoBc3weAu5PvsnobAyrsYIw8FZ1JyAqJmMjqcz0vBp7z/V24QNvDLOgemomvpKjBizeE/70NcIEaqBx7b1loO88qR3V4FsQDFKWTcb2vUMGnPa4a4nB6Na7xV/1+1n3ynxL9Kc7ePvqU3xijV+38CTH5Ct9kw8p8j/yifDqKKS7hz3/GMksBBdpyJ6ziCXhlHAeF6qqvUDTx+X6x1Aa3ndTTqCAFROURtdVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b0b6cc6b-471c-497c-eb86-08d83acf501f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oCVYLAdR2VcQbX1zh40Er44GxUe74N1xk32kyz1sBUiUVNe05UGT4szNWHETeksESZbJbKiRJGH2x0usHRLOf3J9NjrA6smUYipk0zgrHqLMTo5WGMWCpKHnC1qe9SyhKl2TK/TcT39+4dG91eEOOexr3pDuDsmqTNo5ifU0Aa/77a33l/psZCJUvS5JMEJkRYbVyEtH4qDbW9Lbo7FXMC096HYSHGhNoKN/bX5LiV/IFw+qvdOB7C5+XsL6ipRYwAN+9QOHff66A5FoqshF1rDxLVhRU3SK6eJvVFC6bfSV+7uTr55NZ3nzK3YpOZWqJllakGG8b6TTGS/kr/wYtWyPSb0Xl2qqyv0TMWkIpRvz4cNDb21g0y7FFzdp3a7vydC+5hbehyjDWjU2Dq4JG5axIgT2dcxo5mrVAzN5nGOnYQQoJbMEP70RNwRfIBE7N77xptMzRB8i83q1GHXmMnJP+9Kuah73Kx+aYtPi1Yg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(336012)(356005)(4326008)(5660300002)(83380400001)(82310400002)(8676002)(8936002)(6486002)(7696005)(36756003)(47076004)(26005)(9686003)(478600001)(16526019)(54906003)(2906002)(70206006)(316002)(6916009)(70586007)(1076003)(86362001)(2616005)(956004)(81166007)(6666004)(966005)(186003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:23.8162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c79cf5c2-bd62-466a-99db-08d83acf5564
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2364
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This machine provides corstone700 platform on FVP.

For more information about the platform, please check:
https://community.arm.com/developer/tools-software/oss-platforms/w/docs/444=
/corstone-700

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

diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bsp/=
conf/machine/corstone700-fvp.conf
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
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-b=
sp/conf/machine/include/corstone700.inc
new file mode 100644
index 0000000..67cf153
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -0,0 +1,14 @@
+# Common configuration for all Corstone700 machines
+
+require conf/machine/include/tune-cortexa32.inc
+
+MACHINEOVERRIDES =3D. "corstone700:"
+
+SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
+
+PREFERRED_PROVIDER_virtual/kernel_corstone700 =3D "linux-stable"
+PREFERRED_VERSION_linux-stable ?=3D "5.6%"
+
+VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
+
+WKS_FILE ?=3D "arm-reference-image.corstone700.wks"
diff --git a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks b/meta-ar=
m-bsp/wic/arm-reference-image.corstone700.wks
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
+part --source rawcopy --sourceparams=3D"file=3Dspitoc.bin" --no-table --al=
ign 1 --fixed-size 1k
+
+part --source rawcopy --sourceparams=3D"file=3Dse_ramfw.bin" --no-table --=
align 1 --fixed-size 32k
+
+# Rawcopy of the FIP binary
+part --source rawcopy --sourceparams=3D"file=3Dfip.bin-corstone700" --no-t=
able --align 1 --fixed-size 991k
+
+# Rawcopy of the rootfs
+part --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/arm-referen=
ce-image-${MACHINE}.cramfs-xip" --no-table --fixed-size 2
+
+# Rawcopy of the kernel binary
+part --source rawcopy --sourceparams=3D"file=3DxipImage" --no-table --fixe=
d-size 3
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
