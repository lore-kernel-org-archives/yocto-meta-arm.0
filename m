Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.55])
 by mx.groups.io with SMTP id smtpd.web12.11551.1597330384094863533
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 07:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DcbrwD2J;
 spf=pass (domain: arm.com, ip: 40.107.13.55, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOUS+Vf6K5Sz6mbTRu+d8udW3BZz2B7LYepDn75vQC0=;
 b=DcbrwD2JA9AYQzZuTth/pTOLmHChW0snIc2AIszh51emzXlZawciMpsuXP7FZ2bh7RFZ2MSKBistrmrNHLc2vjDw7IKFyab8ntLSz8UggNEEcfn/b+fpGhvcObPBpgcAhR7lSo7ZC2qOegjsedB0eXYRV4L1Nf3L5Y1GzPdw8Js=
Received: from AM5PR0701CA0049.eurprd07.prod.outlook.com (2603:10a6:203:2::11)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Thu, 13 Aug
 2020 14:52:59 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::b5) by AM5PR0701CA0049.outlook.office365.com
 (2603:10a6:203:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.10 via Frontend
 Transport; Thu, 13 Aug 2020 14:52:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:59 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Thu, 13 Aug 2020 14:52:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22511c3132bfe6c5
X-CR-MTA-TID: 64aa7808
Received: from 618ea1642277.12
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A9EA1807-0812-4011-89C7-24C79288ABB5.1;
	Thu, 13 Aug 2020 14:52:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 618ea1642277.12
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Aug 2020 14:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1HCfCOwxJr01vKEiZPeyJnkEhhY+qQYw9+E8F0Y0ETg8XBCgdSLzH4RE1wq2QTVkkyLF3RaW7ZNwVfdR8RQMoCIw9KMDb8RklirWeBPvtiYltJ4zIC8wsBv2ps+QqDsGMUKyJMMRhfeKaW1gzsNiU2ByuAd9MMaooUJD57Ac70knE5eR6byVFtcNsx7ca9ez8t5Znw47SiliwHSzKArleLgbNnry1cHF0hbknBWuQbcJS77xA6N32+SevTIJ9by5DqjMcbFfzvSaJ+Pcw2q++KQX5Wx9TvcjUybtA2unGDbrCLhfzOjMseQ7CSEFKWvGWCViaLh6ev5li6mszL6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOUS+Vf6K5Sz6mbTRu+d8udW3BZz2B7LYepDn75vQC0=;
 b=mXRfDkRKGw/ZpIxtA/jFCSwLEV+jianmJLO1kZZ+p1nNMlgolLHufJ9Pn0yQIE+IKg2ySfj51TszfKtffVnr/DpsX22/PQBwNMJhExQlYYsP/o/bab4TtFIJFc8dBUBiBj1HuRQ/PsnPIhHK9uuoLh/SIRP32s4fc9Jz1zFbGUbaGPPfkLdp5ZXXzuHxYZ6QM4UiMLzS8Yn0xMBmCDV1wpel9/2cRhNHnv7qT+Ml8Umj05BcgfvofSEibjzGb4onwc7XKFKwJa7WtQZcrpD4B4YuFCpbfAys8iM8GSHnUIW1xmJxC7D1kowjn2hrlVPsj+dpaBwl197EBu4+15Rg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOUS+Vf6K5Sz6mbTRu+d8udW3BZz2B7LYepDn75vQC0=;
 b=DcbrwD2JA9AYQzZuTth/pTOLmHChW0snIc2AIszh51emzXlZawciMpsuXP7FZ2bh7RFZ2MSKBistrmrNHLc2vjDw7IKFyab8ntLSz8UggNEEcfn/b+fpGhvcObPBpgcAhR7lSo7ZC2qOegjsedB0eXYRV4L1Nf3L5Y1GzPdw8Js=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 14:52:45 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3283.016; Thu, 13 Aug 2020
 14:52:45 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH v2 7/9] arm-bsp/scp-firmware: adding scp support for corstone700 platform
Date: Thu, 13 Aug 2020 15:52:28 +0100
Message-Id: <20200813145230.22140-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
References: <20200813145230.22140-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::8) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO3P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:ba::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Thu, 13 Aug 2020 14:52:45 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c68e159-a931-4a84-6af6-08d83f989228
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB47248225D9AA0877752046B6FD430@AM6PR08MB4724.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:862;OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hrUFz2KU9QiiMY7Dio+4U98EtfDEjdiF91ThBCuu5HRcTrzFLhnklQQ9uK8WsEUdVUutU6O/W4HW9N5YCcA49+90XD2Yq9c2oPBxvT5XvTMlVWrFSpZfg9ZKiUOL18lUXuqbv2NoXaVbxm9PDueYjQrL7XEhYTN+dTTdrl5lA1NjQFYfeis2fjFtH4LtlK6DHrGX4nFMGDuGDSo90MzHfj7As4xmQ7TE8b8/ArgT8QN405EBZpgwsM35OTBfyB+xIdTLFeXkth6yiemZ3bFwKdBqZ6y/jE0cb52hiEkqpZHVRowN4PO/6DAoXuNSxpGLELwCJ1SjqMxWX6jJmy6pZw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(86362001)(6486002)(2906002)(83380400001)(7696005)(2616005)(956004)(316002)(54906003)(52116002)(36756003)(9686003)(8936002)(66476007)(6666004)(66556008)(66946007)(8676002)(1076003)(478600001)(16526019)(186003)(4326008)(6916009)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 x/ggdQ03oc3E3lmpp94nHXVh0tf18UmUr5yGr86ewDXG8qWQ77D6wLqVE3eiZVSHn38HQk+vbC3qPdgPt9GQZsoW9tNdt23kH00syKHCF7UuRILbZFxxTVMZLe625X9SvwV9NUuExWkCxwOumDYKYGssWMQedBdWR39L1pszxDFvpDMeVPyk47Z+iWtp6BKkFv2ozEhq2sBInVG6n0uNZoYLo070JoafRkE24F7MPvNLiYW3DFnBsZps9EySXZtUapA9dnNC7r+cL8NzhGTuPmOfrGTRFM5kjp4gNAcIyO018dxs5ta9G0Ia24JvJrE5mXcmpXnUyO528qAXb4caWacRLsdVaSeNvx9x9UxpU+/iDhyFR9X3GdEu1Q2mM95EfmOhRfuuf5Ty74oDXOOBNMF0XLuVM7vtYbjVsbKHpFWA9ohBgD924mdPOAItrcnwiKSHvASPPiH/ni42WJdlch61PJma4epNXz9aoF8lPhJdrLn97AxO3QY1BhMxYVBBIFKiGDt+mZZItKr0VdMw2F+lhkvQWq3K/J98TmQpUcvCtTC+OXrRj5FY1S0uAx5shk0nzf7hq50Rkte18bmx3dMJQl5zPp/eCcJOwz+S2Uo2LwO9+Y69QnMYiwY0D7hODzLCKxK/MXp8Ulu+Kxvy0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2baef498-e3a7-4ee2-2d9f-08d83f9889da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bSjoFbp8K9d9KJuIc0ERs7WCPKWsDlr4C2O9QIKTluIILSUxQ/c6pmi6ZK8Mp/TfLC7ZlJ24Qhw0D5c8CNVNrfmAVMCa25+19nsAZraLBQ4wmdEVXIxs+xso5/Lia5dd2nd2Sap88ULHkLBLegCNZ8rGY8YGVODa2+DRCb08fNm73HRop0lD2psq5O3wYpf6fBpJnCEt1QGtiWwmuIVL0zAyUnHfB9pYgVwvArFNm1qkiiQdosR0eYQUzhMSVSvW8Hh/DwtCVexsRM6oxV/IQulFCviFzbjoSEzSZn0hAA7LW2YFgvobHDOP9bdtmUNpHXZ7HzpHciSgsjF8ZxitcFvKQ9vBVh6COYkl9aG5W6XG0jMMBj0gigToLJFWKYsEuhIz4M98nqb8SknBPFea2A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966005)(7696005)(6486002)(8936002)(16526019)(956004)(2616005)(36906005)(54906003)(2906002)(47076004)(356005)(8676002)(70586007)(186003)(82310400002)(26005)(70206006)(36756003)(1076003)(4326008)(83380400001)(6666004)(5660300002)(336012)(9686003)(86362001)(498600001)(6916009)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 14:52:59.1906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c68e159-a931-4a84-6af6-08d83f989228
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

Extend the scp recipe to support corstone700 plaform.

The scp runs on the boot processor (Secure Enclave).

Change-Id: I24289533a72367ebd2d2150c5230d9f435b4212f
Signed-off-by: Rui Miguel Silva <rui.silva@arm.com>
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../conf/machine/include/corstone700.inc      | 10 ++++-
 .../scp-firmware/scp-firmware-corstone700.inc | 37 +++++++++++++++++++
 .../scp-firmware/scp-firmware_%.bbappend      |  1 +
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-bsp/conf/machine/include/corstone700.inc
index 6b02415..91f290f 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,7 +14,15 @@ PREFERRED_VERSION_linux-stable ?= "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.3%"
 
-EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a external-system u-boot"
+PREFERRED_PROVIDER_virtual/control-processor-firmware ?= "scp-firmware"
+PREFERRED_VERSION_control-processor-firmware ?= "2.6.0"
+
+EXTRA_IMAGEDEPENDS += " \
+                      virtual/trusted-firmware-a          \
+                      external-system                     \
+                      u-boot                              \
+                      virtual/control-processor-firmware  \
+                      "
 
 WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
new file mode 100644
index 0000000..16437c5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
@@ -0,0 +1,37 @@
+# Corstone700 specific SCP configurations and build instructions
+
+SUMMARY = "Boot Processor firmware"
+DESCRIPTION = "Boot Processor firmware"
+DEPENDS += "virtual/trusted-firmware-a"
+
+LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0 \
+                    file://cmsis/LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+COMPATIBLE_MACHINE = "(corstone700-*)"
+SCP_PLATFORM = "corstone-700"
+
+# boot-firmware project is a fork of scp-firmware
+SRC_URI = "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmware.git;protocol=https;branch=master"
+SRCREV = "a4dd1b60218b5172a94e6f44c96384b84a77588c"
+PV = "0.1.0~git${SRCPV}"
+
+B = "${WORKDIR}/build"
+
+EXTRA_OEMAKE = "PRODUCT='${SCP_PLATFORM}' \
+                BUILD_PATH=${B} \
+                CROSS_COMPILE='arm-none-eabi-' \
+               "
+do_compile_append() {
+   oe_runmake -C ${S}/tools/spitoc CC=${BUILD_CC} clean all
+}
+
+do_install() {
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_ramfw/release/bin/firmware.bin ${D}/firmware/se_ramfw.bin
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_romfw/release/bin/firmware.bin ${D}/firmware/se_romfw.bin
+    ${S}/tools/spitoc/spitoc \
+    --seram ${D}/firmware/se_ramfw.bin \
+    --offset 1  \
+    --fip ${RECIPE_SYSROOT}/firmware/fip.bin-${TFA_PLATFORM} \
+    --offset  33 \
+    --out ${D}/firmware/spitoc.bin
+}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index b760ba7..8a68704 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -6,5 +6,6 @@ MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 = "scp-firmware-tc0.inc"
 MACHINE_SCP_REQUIRE_juno = "scp-firmware-juno.inc"
 MACHINE_SCP_REQUIRE_sgi575 = "scp-firmware-sgi575.inc"
+MACHINE_SCP_REQUIRE_corstone700 = "scp-firmware-corstone700.inc"
 
 require ${MACHINE_SCP_REQUIRE}
-- 
2.17.1

