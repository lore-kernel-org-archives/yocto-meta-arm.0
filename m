Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.59])
 by mx.groups.io with SMTP id smtpd.web11.10471.1588870127529705641
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 09:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=h8XVa/We;
 spf=pass (domain: arm.com, ip: 40.107.0.59, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlD5G60D0dUknv3diUybfaCj69G0BeEIyaccBzczjvk=;
 b=h8XVa/We1qV7Kb93zrvGXEdQD9dlY1I7zOkztdHtTygfU8VAGQfIh44elEbJUUNURkGCNvFOQtfNmqbCc+2DEXDJSA3VQ5JGOUW2uNzIoPEktq9K3sH/5AXopEx9YO+sAQivUiHCqx0ycbLoSLbSQ6tM4MKP6lwRUzeTdTZnN68=
Received: from DB6PR07CA0103.eurprd07.prod.outlook.com (2603:10a6:6:2c::17) by
 VI1PR08MB2768.eurprd08.prod.outlook.com (2603:10a6:802:19::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.27; Thu, 7 May 2020 16:48:44 +0000
Received: from DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::95) by DB6PR07CA0103.outlook.office365.com
 (2603:10a6:6:2c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.12 via Frontend
 Transport; Thu, 7 May 2020 16:48:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT063.mail.protection.outlook.com (10.152.20.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 16:48:44 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Thu, 07 May 2020 16:48:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5c776eceb2b2b693
X-CR-MTA-TID: 64aa7808
Received: from 30b015f48630.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D78FA1F2-9225-42BB-8C4B-B3AB8909266E.1;
	Thu, 07 May 2020 16:48:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 30b015f48630.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 16:48:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct42u4NE+1/ncZX1nCuBBufzDATuOjB2aedmiFFWxwfDrvdDhC7OZIlb4Nf8Eps6N6XrlpS6IdxcjlEDREtJpJ93FHBZwPM0eZGABPKShpTfg1NRt3DWVXmuqXHzlxEFjNXZbpvZfo7cXU/Kf8KMTBbYS8XiFC4AySAnakUmXDUoSxj7hZyaHU69wxpsKmXcog8f59cW0vESfV0s7E4UY1H8FnVRQ9kwWmeWQcyNWQuQADm+mvcuDs+M1M52lThlOXUTw+hU4CSGn7VRuZMUapmGd4Ov6LJHYRt+5xr+pEegRQDUP394+MdGqCIDNhXtSV+0tqDyiUgBzqVljvfFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlD5G60D0dUknv3diUybfaCj69G0BeEIyaccBzczjvk=;
 b=EDlPMIYkQD34TJ+hbNogFfj9NwaC7qQyrUMnToBdLx2xQR89t+kO4JkVzIwOWH6xrs1xGcciQuYySQyyp+2P5uEqAgQrmi0zCBHv+Vhql3Yi2WSm5vSejnQj5PnadBdSCx6Hw27M95GmqNJ5LpwMNbqUsJwsU8GNQ2EzM8zfG7hTUH2wNDipAqpDHlvelZE3gQScJA4gC/pXomzBJoSMvRsWkRqCL5F3GEV6kw9IjIfBVInusan85Gr1qKLhcMqWwhAAhPZysXN22WcrCPEbuzIRPvrwzcI/hAei3JRh5BL3Upflz1ZOPEbbHRRzk5CLVU77jugKBdU4GK+iZb7VkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlD5G60D0dUknv3diUybfaCj69G0BeEIyaccBzczjvk=;
 b=h8XVa/We1qV7Kb93zrvGXEdQD9dlY1I7zOkztdHtTygfU8VAGQfIh44elEbJUUNURkGCNvFOQtfNmqbCc+2DEXDJSA3VQ5JGOUW2uNzIoPEktq9K3sH/5AXopEx9YO+sAQivUiHCqx0ycbLoSLbSQ6tM4MKP6lwRUzeTdTZnN68=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3353.eurprd08.prod.outlook.com (2603:10a6:5:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 16:48:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 16:48:37 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2] meta-arm-bsp: Update gem5 and switch to python3
Date: Thu,  7 May 2020 17:48:18 +0100
Message-Id: <20200507164818.24202-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SG2PR02CA0068.apcprd02.prod.outlook.com
 (2603:1096:4:54::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.55) by SG2PR02CA0068.apcprd02.prod.outlook.com (2603:1096:4:54::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30 via Frontend Transport; Thu, 7 May 2020 16:48:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41fa998f-8704-456f-431f-08d7f2a68157
X-MS-TrafficTypeDiagnostic: DB7PR08MB3353:|VI1PR08MB2768:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB27682B605EDBC77CACA7C09E9DA50@VI1PR08MB2768.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 M4zZpqvEWb7V+wTUQAlzFki81MmlYfwETaf0ffSeoyOl9WyTFQ9Qvwf6417f0ICHj1xmPC+EXBZmzLvo7MHlYIVihcdADywspo+ExccEtgnszmgHpeykB3RSzi8gNgxOVv1P10pYsKj43gecI9JFWx/nkVws1plgVAl23iw3iOZVZkc4e80FvGQ46eKEkyEMmW9cHe3ybI9nmIcnpDtPZBLmYitREBzgxkgM41DKtU1A80poeoSh8sUQYPEGKWMUtwQqrZQOT9b6vh1GKzRScXBnCRuVTsgWlGGCPyBfZLo208aREjwNSWoGNg856j6es0tjc+xQvp8qUS9MuaPIp3CLrsWzeKJDP6bBtey9zGRAa+34YSys/Acmxpt4UU8p7f2VMuvQG6vhUd4zCWFfTGL0yIYMJypOOolJ0UVj8ZTHut/jdz8wJWte22q6yop+O586vkg2hZ0UI3wojxRAMXhWisedb6JatCRdVVvcu2tCCwuf9nnA/4KjPeHL3C4PpIC4rYXQZ357u9bZ4US5WGO88lcRpghfzOeL6GAj52/sYTSKwaKPBpHslTcuEp9nECqQ/58LMyUW9HuRcjpuLcLsNC+3ZR2142k3WQRYvvgzn2SdxRsCoahdBjM/FCTuxeU+oyqF+7/TtDIctcsEDY4fqiU8gAkOXmKumcMv9ks=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(33430700001)(66476007)(5660300002)(26005)(36756003)(8936002)(316002)(8676002)(186003)(6486002)(16526019)(33440700001)(66946007)(66556008)(2906002)(2616005)(44832011)(956004)(83290400001)(83310400001)(478600001)(19273905006)(86362001)(6916009)(52116002)(83280400001)(83320400001)(1076003)(6666004)(15650500001)(7696005)(4326008)(83300400001)(562404015)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 IWrNn4fxT0EjgREp0Z9LdD7PVw5Y6a+vGitQy2+4MDcXokOGH+0PSNPGIIIY5pHMhZAtCEDABCG8x3L08eaj/+Km7cq1Nf99dJaVUt1cfAKkVFVRqWoTl6wdnjgAGNdahZzOIQNI7cNKvZv6k28gNloPFwLrsp5afHTUzZlv18MlAN/oLQxeZ/+kiySj+45GBmLJz1TUGrR3xWptuy44poESP8zXMIuKw04CemFPe03JG5UV9XZFs3dPedBPm2Gl8ftI2zd7Rx4Zlpu05zOVRK4D9iUbzOa1NjHuXQxXuobzhwRitM7kj87KSPnSmx1SUVLs40Nsv5sUPSD4Fjah5fxALlfPUpEs3RMW1OkN3Kcgp0nfUIDNlaKQsFMWCLScUZoJYF9Ct9JWjHzGj3rJn4sZ1CCo282V1HI8mA+8NsamSVxlA2viT04I6ImugvozDWQ8+47zoII7kJzDBKbQAN/ok5JakO45K3NNmypgund/zagqdKLaYZnt7qwM08FvOluVwD940GpuNjzVmlJHGO6jSxlwop7+bikJxk1goA3bmXjaw/4HEN2KdHZCKBhq3YkqYKgBNsdvKxZd0Clrz5wtadBJIo1YHtOLrvwIy5w8/N9v2von8aGJuN/aAR1YKm7c+xrnK0Fvi3OpRw5x2Bs2GdB1/bDFjbtHe+ObeQnoCo7lKrgWYi/cIq1PEmiBXzHD94YdDwFPvoVm+sXVB9+vC+jPJXBs+jhjtVLaaUnMOb65Lc2H9chEjgs08z/8sqp2mrECwtvvGMAwHKI4jxyu/A7AtINk2VHGtTObKAo=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3353
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966005)(33430700001)(86362001)(15650500001)(8676002)(36756003)(70586007)(4326008)(8936002)(44832011)(70206006)(356005)(2616005)(33440700001)(47076004)(956004)(19273905006)(81166007)(316002)(1076003)(6666004)(186003)(7696005)(5660300002)(2906002)(82740400003)(6486002)(6916009)(478600001)(336012)(82310400002)(16526019)(26005)(562404015)(563064011);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7a743909-0900-435c-dfd0-08d7f2a67cc2
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T9CjPP2AHnnx//rKm5pYDp3s/8IXWQMdnNJj6Hj80cvbt1RtVOFPo+SvGcKek3NauNS+i+utQUN82YUuEDoouYrvX7KoNa8RssrMTjhG17bLbaUsXr6AJZWQhaix3cagZgVRJ9+HgkyoB8r2ZAqrJKbFj+bD9r/WVgDbBRBYrgOgM4Lx+JkKtglQAsn9qc8ESlPoHKQXc/x4YOgA9lDoj21RrYOXRG9NHW/gc/fYiCh0GKuWrfxZCsBTCSm5QkZlNRXLw2o9NZ4vEMb9Rd5h7Byh/t7c+WSMicXVmblAdhdSh5J1vXql7OTc+bY7nmOqjqYRngHK5SLgiqMR40lu9G+L3KGHXvZatuVapUXUHLsT+Gg5GXsgmNo2qJXcgdcFQB8WzPs4GHGqyPNcBhj7p3eIk4MwfTbisQOqQcShAuB8/bmp0yDen4Blo6fKPy0rVL6kKdai/Jnni2tGUuWTSNKlocOUBrakqVCwwFL/OjczlM3PazSJxnO4FH8f/xNk6gH5EntbUHPv8yBDBQ12zMWIH1iZrSw0M1UZ0DgNYYTY9iJh0yh8hvwZoWSpXN9uDqtYjtCXAFGnBZ8RaUldnwEqb0E8kAyYObKYxnJ+4l8kAypixtg0i1wydEth44unyImcNj9Gufh2G9xHJSuop4ayYLDeF5JpAbaKvlwaAoN25dJ0a8cYEXTNjbUTFLnyrnqI+eyv9hiZDI4s1z6cuA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 16:48:44.4617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fa998f-8704-456f-431f-08d7f2a68157
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2768
Content-Type: text/plain

This patch includes several fixes for gem5-aarch64
- Switch to a new version of gem5 supporting python3 and use python3 to
 build it.
 We use a version in develop branch of gem5 for now and we will have to
 switch to release 20 once it is released mid of may.
- Remove scons python2 recipes which were used before by gem5 as a
 workaround until gem5 was updated to support python3
- make gem5-aarch64-bootloader only compatible with gem5-aarch64
- remove unnecessary FILESEXTRAPATHS_prepend in gem5-aarch64-bootloader

Change-Id: Iad9af4f2e6073ef63a51c2c33a05ed3855dd8f08
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- update version of gem5 used to solve problems encountered during
  compilation on some distributions (produced on debian-10 but not
  on ubuntu 18.04)
---
 .../gem5/gem5-aarch64-bootloader.inc          |  3 +--
 .../gem5/gem5-aarch64-bootloader_git.bb       |  9 ++++----
 .../recipes-devtools/gem5/gem5-aarch64-dtb.bb |  5 -----
 .../gem5/gem5-aarch64-native_git.bb           |  6 ++++--
 .../recipes-devtools/gem5/gem5-native.inc     | 21 +++++++++----------
 meta-arm-bsp/recipes-devtools/python/README   |  4 ----
 .../python/python-scons-native_3.0.1.bb       |  8 -------
 .../python/python-scons_3.0.1.bb              | 21 -------------------
 8 files changed, 20 insertions(+), 57 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/README
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
 delete mode 100644 meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb

diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
index 72069ad..4c479f5 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
@@ -7,8 +7,7 @@ inherit deploy
 
 PROVIDES = "virtual/gem5-bootloader"
 
-COMPATIBLE_MACHINE ?= ""
-COMPATIBLE_MACHINE_gem5_arm64 = "gem5-arm64"
+COMPATIBLE_MACHINE = "gem5-arm64"
 
 # no configure step
 do_configure[noexec] = "1"
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
index ffbc2da..68f3648 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
@@ -1,16 +1,17 @@
 # gem5 custom bootloader
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
+# The recipe is currently using a version in the development branch of gem5
+# until version 20 with python3 support is released
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
+
 PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "bcf041f257623e5c9e77d35b7531bae59edc0423"
+SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
 
 BPN = "gem5-aarch64-bootloader"
 
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
index 362a8e0..b97a1b2 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
@@ -9,14 +9,9 @@ DEPENDS = "gem5-aarch64-native"
 do_configure[noexec] = "1"
 
 do_compile() {
-    # Gem5 is requiring a non zero size disk even though it is not required to
-    # generate the dtb. Use /proc/version as disk file.
-
     # generate a dtb using gem5
     gem5.opt \
         ${STAGING_DATADIR_NATIVE}/gem5/configs/example/arm/baremetal.py \
-        --disk-image /proc/version \
-        --kernel "" \
         --dtb-gen
 
     if [ ! -f m5out/system.dtb ]; then
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
index 9c77121..c42c82f 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
@@ -3,13 +3,15 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https"
+# The recipe is currently using a version in the development branch of gem5
+# until version 20 with python3 support is released
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
 
 PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "bcf041f257623e5c9e77d35b7531bae59edc0423"
+SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
 
 BPN = "gem5-aarch64-native"
 
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
index 4b02d13..429e18c 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
@@ -11,30 +11,29 @@ GEM5_BUILD_CONFIGS ?= "build/X86/gem5.opt"
 
 # Scons build arguments
 GEM5_SCONS_ARGS ?= "-j ${BB_NUMBER_THREADS} CC=${BUILD_CC} CXX=${BUILD_CXX} \
-    AS=${BUILD_AS} AR=${BUILD_AR} ${GEM5_BUILD_CONFIGS}"
+    AS=${BUILD_AS} AR=${BUILD_AR} ${GEM5_BUILD_CONFIGS} \
+    PYTHON_CONFIG=python3-config"
 
 # Default profile to run
 GEM5_RUN_PROFILE ?= "configs/example/fs.py"
 
-# We are building a native package and we need to use python
-inherit native pythonnative
+# We are building a native package and we need to use scons
+inherit native scons
 
 # the build is using several tools:
-# python: scons and six
+# python3: scons and six
 # google protobuf
 # pkgconfig
 # hdf5
-DEPENDS += "python-native python-scons-native python-six-native \
-    protobuf-native hdf5-native pkgconfig-native boost-native libpng-native"
+DEPENDS += "python3-six-native protobuf-native hdf5-native pkgconfig-native \
+    boost-native libpng-native"
 
-do_configure[noexec] = "1"
+EXTRA_OESCONS = "${GEM5_SCONS_ARGS}"
 
-do_compile() {
+do_compile_prepend() {
     # We need to use the proper native libraries when executing
     # compiled applications
     export LD_LIBRARY_PATH="${STAGING_LIBDIR_NATIVE}"
-
-    scons ${GEM5_SCONS_ARGS}
 }
 
 do_install() {
@@ -58,5 +57,5 @@ EOF
 
 FILES_${PN} = "${datadir}/gem5/* ${bindir}/*"
 INSANE_SKIP_${PN} += "already-stripped"
-RDEPENDS_${PN} += "python-native hdf5-native protobuf-native libpng-native"
+RDEPENDS_${PN} += "python3-native hdf5-native protobuf-native libpng-native"
 
diff --git a/meta-arm-bsp/recipes-devtools/python/README b/meta-arm-bsp/recipes-devtools/python/README
deleted file mode 100644
index b80c757..0000000
--- a/meta-arm-bsp/recipes-devtools/python/README
+++ /dev/null
@@ -1,4 +0,0 @@
-This is added for Gem5 compilation with Zeus as it has been removed from
-OpenEmbedded (and Gem5 needs scons to be compiled).
-
-This should be removed once Gem5 supports properly python3.
diff --git a/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
deleted file mode 100644
index 68b63c9..0000000
--- a/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-scons_${PV}.bb
-inherit native pythonnative
-DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
-
-do_install_append() {
-    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
-}
diff --git a/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb b/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
deleted file mode 100644
index d5084b2..0000000
--- a/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Software Construction tool (make/autotools replacement)"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
-
-SRC_URI[md5sum] = "b6a292e251b34b82c203b56cfa3968b3"
-SRC_URI[sha256sum] = "24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173"
-
-UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-  python-fcntl \
-  python-io \
-  python-json \
-  python-subprocess \
-  python-shell \
-  python-pprint \
-  "
-- 
2.17.1

