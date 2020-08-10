Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.73])
 by mx.groups.io with SMTP id smtpd.web11.37591.1597028594494801042
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 09 Aug 2020 20:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=I0qSBhHi;
 spf=pass (domain: arm.com, ip: 40.107.13.73, mailfrom: damodar.santhapuri@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xUVK6DuloYIkky/FFBW92h6+qKFeCOBjf/NVOgU3+4=;
 b=I0qSBhHid/zyOX63kcbUXdJB7f8kLgX1cay+PxcyhBbr6fBUTxTRHtwoztOqPZ757APHyOBxGQII9BOiQp/1e1mGaSBLTlrZwugwdjV+nxw5IvUoO1C0w1+ocTwBbC63GqfwdD0d2HK9GRf9AjolnF0u68mjFc8nr4SHT16VHv8=
Received: from AM6PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:2e::21)
 by DB7PR08MB3129.eurprd08.prod.outlook.com (2603:10a6:5:1d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 03:03:10 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::21) by AM6PR05CA0008.outlook.office365.com
 (2603:10a6:20b:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Mon, 10 Aug 2020 03:03:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 03:03:10 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Mon, 10 Aug 2020 03:03:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0e078e24f64e29f
X-CR-MTA-TID: 64aa7808
Received: from 3dc80bfe6505.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7BF399FA-3E5F-4AD2-9F11-B70F2D11E898.1;
	Mon, 10 Aug 2020 03:03:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3dc80bfe6505.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 03:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCOcaSUGgF/PfqxpkiFYSfBsLwRRJwHuBykt9wHwHGik37OYdoeDKgD1bChFmX44vMbcJhSaHlJXqacBIlqH3QloF//tOCufTiNb4+r8FHHlgMmaEUFJ/akVLgPZTMnC2a0zLKAYepdmz28h/ZVBMwtW3yFrHSlFXsa+6zKltyhpVx4DzUpW5B8VCP6i5kehKxyLGPOiobfimgn0Ia6gbZO+aiox3JKTuIllTnHC9+kXZ3jcPnZFabjacD+dz5d9PZO2HR+7Q/uQfvBxPjcn4wFfw0LO6hizSUvgGybaL/pxbZupXrqw8wYGzZsxskMzi7vZ3yPVaJmoDPIXJKT+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xUVK6DuloYIkky/FFBW92h6+qKFeCOBjf/NVOgU3+4=;
 b=IwpdCrYSxYC2a20LI1nXqSjTi2BLHibOs2vvY81Korw7LnnZE043WrZWrQrwrukbwXj5s2WzntV2b2skx95uzDOkP/qbZvm21kxwzoTqzGFlAJuY39VkIfk0i07D03E1ihgKdBpQ1x3b/zD5FuF86DWa1Fy3CJ64xl45NuAihs8WGkxUQWYxSoxw1qw+5VRfh37lKuBx3KR/pRazPz38YKPWy9FFk/4wOopByiHeGKzhyJf8THvotE49pZtHtiF9dYEYlMhSA0JcahbWFjrAgzrmHL5lDg8/BU8Ei7w33NX9CyHxnNdnGSvvkIe+UiVHZr767fNNh5DlNQldg5UmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xUVK6DuloYIkky/FFBW92h6+qKFeCOBjf/NVOgU3+4=;
 b=I0qSBhHid/zyOX63kcbUXdJB7f8kLgX1cay+PxcyhBbr6fBUTxTRHtwoztOqPZ757APHyOBxGQII9BOiQp/1e1mGaSBLTlrZwugwdjV+nxw5IvUoO1C0w1+ocTwBbC63GqfwdD0d2HK9GRf9AjolnF0u68mjFc8nr4SHT16VHv8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com (2603:10a6:800:8c::9)
 by VI1PR08MB5519.eurprd08.prod.outlook.com (2603:10a6:803:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 03:03:02 +0000
Received: from VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::24b9:811d:b60b:f5b0]) by VI1PR0801MB1950.eurprd08.prod.outlook.com
 ([fe80::24b9:811d:b60b:f5b0%10]) with mapi id 15.20.3261.022; Mon, 10 Aug
 2020 03:03:02 +0000
From: damodar.santhapuri@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Damodar Santhapuri <damodar.santhapuri@arm.com>
Subject: [PATCH 1/2] arm-bsp/scp-firmware: build SCP firmware for juno
Date: Mon, 10 Aug 2020 08:32:15 +0530
Message-Id: <20200810030216.24798-1-damodar.santhapuri@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To VI1PR0801MB1950.eurprd08.prod.outlook.com
 (2603:10a6:800:8c::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a077431.blr.arm.com (217.140.105.56) by BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Mon, 10 Aug 2020 03:03:00 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.56]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a3711467-8c44-466a-a8bc-08d83cd9ea25
X-MS-TrafficTypeDiagnostic: VI1PR08MB5519:|DB7PR08MB3129:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3129BD910CAC1702120C7A7A8A440@DB7PR08MB3129.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /Y0nuiaCZ20zzIc/gO5N6akkUtp5KHs4M5PUqDMhuDdS2jHLUAWzj20Rj0NF42WHG1X5bi+q4DwPaHEGopv3WylQsrXj6XRDsZqt/QSkOoJmeZPAfnlN/84Pz6MYnxWc9qNXPkqe1v5Az8p+qK1cZIWs+7lm2nyGuQQm3Nz7evZX0Rj1LhVbRuWsiZD5N2WbNUuNajSBMQ+si1ftgnuJ/GsOq3SW6lls61Wo3tuK7pwIfpE/JtatenhmAN7XOKwaS+eduYHqpIJSM/wHmZZzvx3SRNq/CXBzlEVPmldcqFKjOBwQJd7JvkcAU0mpRvAVBubeHlGLNvn1QzyKOonCEvO6bIc0L09VCrpiUT/XcdjJe/VwksCHKJkdnSmZkZQ+9VHbFNhyDxsK7HjZaP0iDQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB1950.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39850400004)(1076003)(5660300002)(6666004)(8936002)(86362001)(66556008)(83380400001)(36756003)(66946007)(66476007)(8676002)(6916009)(316002)(4326008)(2906002)(52116002)(7696005)(186003)(16526019)(44832011)(2616005)(26005)(6486002)(956004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 0oaDnuK514mSQwG4zG3oszLRn6nKW2DVE3+4lD4L1yl09pZtm64JUQ/fSoUyC5Gzr9Zvmj9GI9yIrc400KDGuwnx1mrj1lZfbTQTMIX4T8NOdI0qXx2gfORnwTFXphDbvn4M2RhPYc/C9T09dcJSyzW1dJamEcQp7jr8NF18ni2nk97gkayITyphFdxYM185roWkOa2MgGTyXF4Po4bMNLsY2n7UConlv8TqeKzDj7VePqK0Lt4GWnxvUG5MT0N4sxVQBu1sLrCNUR1B7M7lYRhHXHKl6fQuDwygcQV5oqRhLh1NsiRqETRHV+k9187OSrwEO1cOFhkNlKcHQJIPOBb0svUVn9umTL2GOpPN3uX7s6txzHssgHYF7dQSS4Bf4Il9NFWpLvrfTqd5u+I2n5k0lNSUXJqexqj6gRCrkmlU1hVkHoMo/2gyf+SmNdIU2Ln/Hs6smCkO6vSED/8DwaHlo3b8jSSRHOGcb9YGhTlcLdDMbvuZFvwj3RVjhtE2kGnlSVG4oleN3oQHlZabRj/p+Mq96afg8NTjB9Dh0UuIryhyyZQd95IWDspW+3ghKj/gGc+NPXQX77EiV+eKpuNgaayXrPfRi6CkyjmF/RN8WZ/x5vLZgPwfu0Kwtgfi02V8rKX8009SuXWahhwkEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5519
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Damodar.Santhapuri@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ba156ab-bbed-400b-7e84-08d83cd9e48d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IX/xnpzrNBN8RhO8Ov+2fOSEMtkHvXcRtwdsNoA2slCoxab8etPrnchglPnnPo+H+ZW1NZvAsKWf8BEBP9ml5+jDdDu8C+a/P38TEySjUA1zBqMap9J9x/+8HSoYCSVgGuVGp6UY35wwK2DXKT5PY36fZR64FoVgJhdbpbpUTH6CSZbSBTjVC9POfjuujszLeSJl2KydUifvLuvMt8lkcH1DEo32RnN/cnDuFXMGySJKyW86p3NF7DZCzVh+F/LvVNq+rPU7RZFEAKETAUIo4G2/UuIr2wgFmayZfrM1fHHzkIXYvlONpjuXnGbhjdARIt4LlY54CL5NkjhFYImPu3/An93l9AG62Fs8121iO77h1ozpg1npvCxisk1NbKYzZ1Wh0tXJNMdH/PrS5iI+e87dWKrHxXM0tXvZzZCjSvrEEH71YIyPqN1rbuPHmoiuEYHQPkkxqrsqf1erc4DvQWaI98Uy61dwFLztAgPWtp8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39850400004)(346002)(376002)(396003)(136003)(46966005)(6666004)(82740400003)(316002)(81166007)(86362001)(6486002)(478600001)(47076004)(36906005)(6916009)(1076003)(356005)(8676002)(186003)(16526019)(7696005)(4326008)(26005)(336012)(8936002)(70586007)(70206006)(5660300002)(956004)(2616005)(83380400001)(2906002)(36756003)(44832011)(82310400002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 03:03:10.6091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3711467-8c44-466a-a8bc-08d83cd9ea25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3129
Content-Type: text/plain

- Remove scp-firmware-juno_19.06.bb
- Enable v2.6 support for juno
- Add juno machine specific to scp-firmware
- Use romfw_bypass as scp_bl1.bin

Change-Id: Ib3f92e170a4e5701f6c6d18695541eae763de464
Signed-off-by: Damodar Santhapuri <damodar.santhapuri@arm.com>
---
 .../firmware/scp-firmware-juno_19.06.bb       | 38 -------------------
 .../recipes-bsp/images/firmware-image-juno.bb |  5 ++-
 .../scp-firmware/scp-firmware-juno.inc        |  7 ++++
 .../scp-firmware/scp-firmware_%.bbappend      |  1 +
 .../trusted-firmware-a-juno.inc               |  4 +-
 5 files changed, 14 insertions(+), 41 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc

diff --git a/meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb b/meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb
deleted file mode 100644
index a6ac9ca..0000000
--- a/meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-DESCRIPTION = "System Control Processor (SCP) firmware for Juno"
-HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
-LICENSE = "BSD-3-Clause"
-SECTION = "firmware"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-COMPATIBLE_MACHINE = "juno"
-
-PROVIDES += "virtual/scp-firmware"
-
-# For now, for juno we retrieve the SCP firmware in binary format
-# from Linaro Releases.
-SRC_URI = "http://releases.linaro.org/members/arm/platforms/${PV}/juno-latest-oe-uboot.zip;subdir=${UNPACK_DIR}"
-
-SRC_URI[md5sum] = "01b662b81fa409d55ff298238ad24003"
-SRC_URI[sha256sum] = "b8a3909bb3bc4350a8771b863193a3e33b358e2a727624a77c9ecf13516cec82"
-
-UNPACK_DIR = "juno-firmware"
-
-S = "${WORKDIR}/${UNPACK_DIR}"
-
-SCP_FIRMWARE_BINARIES = "scp_bl1.bin scp_bl2.bin"
-
-inherit nopackages
-
-do_configure[noexec] = "1"
-do_configure[compile] = "1"
-
-do_install() {
-    install -d ${D}/firmware
-    for file in ${SCP_FIRMWARE_BINARIES}; do
-        install -m 644 ${S}/SOFTWARE/${file} ${D}/firmware
-    done
-}
-
-SYSROOT_DIRS += "/firmware"
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index b0ad14f..a79bab5 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 SECTION = "firmware"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
 
-DEPENDS = "virtual/trusted-firmware-a virtual/kernel"
+DEPENDS = "virtual/trusted-firmware-a virtual/kernel virtual/control-processor-firmware"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -39,6 +39,9 @@ do_install() {
     cp -f ${RECIPE_SYSROOT}/firmware/fip-juno.bin \
         ${D}/${UNPACK_DIR}/SOFTWARE/fip.bin
 
+    cp -f ${RECIPE_SYSROOT}/firmware/scp_romfw_bypass.bin \
+        ${D}/${UNPACK_DIR}/SOFTWARE/scp_bl1.bin
+
     # u-boot environment file
     cp -f ${WORKDIR}/uEnv.txt ${D}/${UNPACK_DIR}/SOFTWARE/
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
new file mode 100644
index 0000000..9e1e1c2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
@@ -0,0 +1,7 @@
+# juno specific SCP configuration
+
+COMPATIBLE_MACHINE = "juno"
+
+SCP_PLATFORM = "juno"
+FW_TARGETS = "scp"
+FW_INSTALL_append = " romfw_bypass"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 33ae7fe..97dcc05 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -4,5 +4,6 @@ MACHINE_SCP_REQUIRE ?= ""
 
 MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
+MACHINE_SCP_REQUIRE_juno = "scp-firmware-juno.inc"
 
 require ${MACHINE_SCP_REQUIRE}
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
index 2f1559c..a6d8ded 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
@@ -8,6 +8,6 @@ TFA_UBOOT = "1"
 TFA_BUILD_TARGET = "bl1 fip"
 
 # Juno needs the System Control Processor Firmware
-DEPENDS += "virtual/scp-firmware"
+DEPENDS += "virtual/control-processor-firmware"
 
-EXTRA_OEMAKE_append = " SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_bl2.bin"
+EXTRA_OEMAKE_append = " SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
-- 
2.17.1

