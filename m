Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.62])
 by mx.groups.io with SMTP id smtpd.web10.50265.1597080777969032354
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 10:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3B9OQY3p;
 spf=pass (domain: arm.com, ip: 40.107.20.62, mailfrom: prabin.ca@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMiuXXS1DupVLvCM5Xe7VzwOFvh+VdcF7iaDXaWtN6U=;
 b=3B9OQY3p1hh0jsrOSDppS1nHpeegRlFB6nvuzCZQixBkxlVlyzZTvJsyrpxMrs3NhfrzaFAQVHjdMJvWp+P3m96RQjSEJZFMO8WFz5q7bH2vqiobK0JD3tszVxEWVg3/lfbH3yzTe3J7xjZsHIvys1ghE/rAvVeF1wtvXsv/Bvo=
Received: from DB8PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:10:be::17)
 by VI1PR0801MB1853.eurprd08.prod.outlook.com (2603:10a6:800:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 17:32:55 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::f2) by DB8PR03CA0004.outlook.office365.com
 (2603:10a6:10:be::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Mon, 10 Aug 2020 17:32:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 17:32:55 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Mon, 10 Aug 2020 17:32:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 42d7b0a80eb96146
X-CR-MTA-TID: 64aa7808
Received: from 1c10492be4ca.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6ECF119A-097D-4C88-9840-EF3BE2D1EDBD.1;
	Mon, 10 Aug 2020 17:32:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c10492be4ca.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 17:32:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzslpgZ+g6s0tKb4k+JTpqoI0Qgt5jVtJcP3KsCW4B5LB6fL8jEKiiK1g308jYyUXocof4RkMCNIpz+tLw4qEFVDsKjSlCeGZguv1iDvp85oRYp5wSuVpqM+5SZj2nESqZlExgjAkRU66Kr10gWsmi+4o+gdYkuOK7XSn6uqG8nGB2RyJFYSB/s/QtfMn9RlugtJNm/BMlb/YU9TySodyp+YBo8CRjV98q8xDXzUwCVOP5GUI4++Vlrcryxa3uQ2z588dr6ryk/5wd/pba9GfrTYOnKoZYM5+Mt8wi7NxolcTyq7cyRe1Z/Nxvvf2Wdd67wJVMrN3GjXWY2PW8sx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMiuXXS1DupVLvCM5Xe7VzwOFvh+VdcF7iaDXaWtN6U=;
 b=ceBaWVXknJC+1EmEfe2rcsaIX7RqD6vUVf4tj7aTaNwK39g1MYbMSxfBMfcegGOacfMfmv+zZ0GUb7X7Er4kdl9VxwkJLMgNm3FiCxYnUXjGQRUbLrOo879Bd3wL6F0hRmXXF0NO0SS/EnRKqACH1vJHPa/+czvTp0Gqyrxak+iSOIWWEnGQbf67MYivDlE1uYd9v41qazvyyKOggh3oFvwFMvngMP1L3BZthWS8KF6ip6ff69PMGzAnwBCNYgPuoRm6QuAro7kl+IxD361HtutLRGjIvvXBqrZZHyZTfkFsM29thBs9VPtXddvPH8PnPcHcyUzESQebctO82VlCNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMiuXXS1DupVLvCM5Xe7VzwOFvh+VdcF7iaDXaWtN6U=;
 b=3B9OQY3p1hh0jsrOSDppS1nHpeegRlFB6nvuzCZQixBkxlVlyzZTvJsyrpxMrs3NhfrzaFAQVHjdMJvWp+P3m96RQjSEJZFMO8WFz5q7bH2vqiobK0JD3tszVxEWVg3/lfbH3yzTe3J7xjZsHIvys1ghE/rAvVeF1wtvXsv/Bvo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33)
 by AM0PR08MB3953.eurprd08.prod.outlook.com (2603:10a6:208:125::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Mon, 10 Aug
 2020 17:32:49 +0000
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5]) by AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 17:32:49 +0000
From: "Prabin CA" <prabin.ca@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Prabin CA <prabin.ca@arm.com>
Subject: [PATCH 3/7] arm-bsp/linux: Build Linux stable 5.7 for sgi575
Date: Mon, 10 Aug 2020 23:02:12 +0530
Message-ID: <20200810173216.10411-3-prabin.ca@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200810173216.10411-1-prabin.ca@arm.com>
References: <20200810173216.10411-1-prabin.ca@arm.com>
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To AM4PR08MB2756.eurprd08.prod.outlook.com
 (2603:10a6:205:c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a076760.blr.arm.com (217.140.105.53) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 17:32:48 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8bb7be52-9621-48e8-ae48-08d83d536a88
X-MS-TrafficTypeDiagnostic: AM0PR08MB3953:|VI1PR0801MB1853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1853399F0D0042FB4A6D68AEE1440@VI1PR0801MB1853.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xrp5bkfSB/IiggzSQoWV9HaNVnZK9EjiQA/DyUGv7FGFeM8NDwDuL+Q11/Fa//3ITRsFZj9p9Ddvb55zZFiJ90EaroaSGIb53U2Hg9o69Aygdbx2s6Bwry1nim1J0EtINtIyUT7Fo6c3A6UeAxIuf9Jg0l5MRhvrPDbpkZ56EKRmFol6iHqbWKRSaPQ0RxPEBtfr3sfH2Be/hOBLXWtnhW6aoVaWCiahj3FuC7tfaH0iezFKrZWOz043CacU0Kd00FP3yCToRqjvTPk7OgjBxeBThYIxUsA03iiw7acSJXffPNzE/ZvQm5JuEWo4c4DiV0FsvIHw/J2Oh+lAD4Sa8Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR08MB2756.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(26005)(16526019)(186003)(1076003)(316002)(2616005)(8676002)(478600001)(2906002)(6666004)(956004)(86362001)(5660300002)(8936002)(52116002)(7696005)(6486002)(66476007)(66556008)(83380400001)(6916009)(4326008)(36756003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: CIXuSPHizwWKZoKRIUxJ+BbQacB70BZxonm32r1BBYRAG8gg71X0hU+eeHAE5Ry5YJiTmb2yR79/lLO5l71NZvznRmYQa95I1H+V7FoHbP6JfGzlfQPD+/gKJIU+41HNPgz/GvqQqJFA//FdC91LaDzqF2JJi5zWYrHpGrHYtefRMOLj7b1EJgproJI19+2nCplxn7684gONBRNMzf1Gvt8m7pLlp4XuSk0ksKS7WxCd/jUnG1uFAWFfx1+iHoGQ4EHOwG+XpdLnhiyU8aPBW34pmJ6Ih+cWdCNSM1zZIOUN0OYZI20yVaagNei1la70hhXuP6wTDbhpQGNkfqWtdDw1v6VcMA3BLOdwVAHUH0fqeBB4lR3261Q/XXzB25ZkbbeGJ3czXNZtk5f1CDdGgbG73bpS6ytx/h5auyFpiwoAQKOjJw0ZopEgFm0N729s13U39NLFZqzK7hu3TiJS8ssPl2/8PrdcXQJ3I68TOD1zu0ofdPEqN9V6Y+tjy2s5HxJSJLJGwN9woQanEItE/BnqcnEhdwOvp3a796f3krTlNxO7zB/t4MeuGjfBQGN8BrcJi/A1t4LEriHTtDr3K0adz3mBvYZKx24CXl3kpwuQtgs4ZDahJThHkMweG/TcpfErZqSUaF4xh4pMbKrPsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3953
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Prabin.CA@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ff62c221-bec5-4c77-b08c-08d83d5366c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s/F/UqgE8sfXulFCfHbwvLpCwUxntQo7IL37+3pRFe9cNPUTTA6dqdLEULqBTSquOw2e+0HyogzYZl95TigkAjfM+lFjFq9KddezgHbnuMv0tvgzpBfYXO2Ktivv9pdyi1FTHBCPdeBp9SEdIzd6at/0xTjfcLaqUSbxk+Mv1qoLWKeubnwsK5ZQidNI6CtMIe6RyPO96g1H0yq/MVWxSRbXdmPCzWSB/UfVi7OEdXGuJZoxksbAR80Mm4z9ONgwyAKUwInYzFbGAJs0vyd/oCTZAOCqBQahTdGPXBRlK9G2IhBDHQ8pqI4U1aX6i4nOQ3oIEC6rURS8GSk6OdXXvBM/LzjeQnbKiq1/okQCXEp0fDuSlWAVO+qeVLIEGYL2/fbo7cx71U4OkGdnfziWGw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966005)(5660300002)(2906002)(356005)(82310400002)(316002)(8936002)(478600001)(2616005)(956004)(4326008)(7696005)(81166007)(82740400003)(186003)(16526019)(83380400001)(26005)(47076004)(70586007)(6486002)(36756003)(8676002)(336012)(70206006)(1076003)(6916009)(6666004)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 17:32:55.1777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb7be52-9621-48e8-ae48-08d83d536a88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1853
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

        - Update linux-arm inc for including sgi575
        - Add machine conf to add image dependency
          for Linux components

Change-Id: I26c539793b73a3f4a31e40daa4272904a1751b3e
Signed-off-by: Prabin CA <prabin.ca@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf                    | 5 +++++
 .../recipes-kernel/linux/linux-arm-platforms.inc         | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/mach=
ine/sgi575.conf
index c77f3f5..719d99e 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -16,3 +16,8 @@ PREFERRED_VERSION_trusted-firmware-a ?=3D "2.2%"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a"
=20
+# Use kernel provided by linaro
+KERNEL_IMAGETYPE ?=3D "Image"
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-stable"
+PREFERRED_VERSION_linux-stable ?=3D "5.7%"
+SERIAL_CONSOLES =3D "115200;ttyAMA0"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 4e5635a..9224dde 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -13,6 +13,7 @@ SRC_URI_append_foundation-armv8 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base-arm32 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_juno =3D " ${SRC_URI_KMETA}"
+SRC_URI_append_sgi575 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_gem5-arm64 =3D " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta =3D "6147e82375aa9df8f2a162d42ea6406c79c854c5"
=20
@@ -48,6 +49,14 @@ SRC_URI_append_fvp-base-arm32 =3D " file://fvp-base-arm3=
2-dts.patch"
 COMPATIBLE_MACHINE_juno =3D "juno"
 KMACHINE_juno =3D "juno"
=20
+#
+# SGI575 KMACHINE
+#
+COMPATIBLE_MACHINE_sgi575 =3D "sgi575"
+KMACHINE_sgi575 =3D "sgi575"
+KBUILD_DEFCONFIG_sgi575 =3D "defconfig"
+KCONFIG_MODE_sgi575 =3D "--alldefconfig"
+
 #
 # Total Compute KMACHINE
 #
--=20
2.28.0

