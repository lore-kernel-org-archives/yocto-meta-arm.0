Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.68])
 by mx.groups.io with SMTP id smtpd.web10.4391.1587454451253977532
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Apr 2020 00:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MelOzG99;
 spf=pass (domain: arm.com, ip: 40.107.3.68, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOUXlPi3WuI2+0y0UgjNk0kSDSdq4gSap5SuJQK5DxY=;
 b=MelOzG99fPVhTvoK6bkJimxUqjpuPpz71PZ6ZOPAaWHIGsAwAUH0hMUDHAWrMHUdrU7QWmld5GAW8kolYoVdIAFj3VUA89OGA7gN4bSNQlg/tkklTONylMOE4Bu0D/XusiB/0bjRPaJzBK5CDF+ue2MgNH+vQSjDGlgfonDRbCU=
Received: from DB8PR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:a0::48)
 by VI1PR08MB3520.eurprd08.prod.outlook.com (2603:10a6:803:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:09 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::2f) by DB8PR09CA0035.outlook.office365.com
 (2603:10a6:10:a0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 07:34:08 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 07:34:08 +0000
Received: ("Tessian outbound 29c24b8a1b7a:v53"); Tue, 21 Apr 2020 07:34:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0290be4cdfbc3af6
X-CR-MTA-TID: 64aa7808
Received: from b20f9cf88c0e.8
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 151F8BE2-4A58-4FC4-A03A-D8AAC41692C7.1;
	Tue, 21 Apr 2020 07:34:03 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b20f9cf88c0e.8
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 Apr 2020 07:34:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHN7WzArM626l5iEhJmy0Fp8yFvWEJA04kgTlU8FvTQWNyex+FVg7rJe6SRSsz/BrR6DQ214uzkd5wpPmm6P7WyS90kI/47gMw1UJAApqMNrUduZI3MCqijnS+Rm/3+g27NwZtc0m0g7xzopUfaWYuSogqdsB7oJjn/8rykXpQ6JJP6zy3sY2AdiYyObDYx1mWpbiQ4Sebh2j0P0BU2+SaWgWtO/suQFmjRmJp9p5ypRWPtZiYHJPQ5TiAJrkhG0F9PdCc8UDUnHpzspZ464VuC4eZDOlqrsNqq6NU2IN0G4Yq5ET/Df1sXBJaNejw0pfMWXpeoh0Pj9Rwr5eiYceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOUXlPi3WuI2+0y0UgjNk0kSDSdq4gSap5SuJQK5DxY=;
 b=fHZs121uUqPDaM0xHaRySoYN8Hq6kOIFFHJ+1fKhdzvbReg3I/jMz3ZYHCsLabDnPKtUmsQk8N2ktut4qtBcA0PRehGpfvpOFwTUh6xc9Hs5EG77hTfeo36DiR5/tYfkzDjUXG6njQmAU79g4+zpoFzlBLdk1KS1KBleF0sXQngTNtDuxKL1SCopgwEJVbAXHI39zpLWhatuadCL1vxo2cWC2dAAyw849A4XJrU/wsJ9NtjIKqphv9I95yzrheK5ul/SXDUDOv7tdg/IHG19Z3SZ4QjuLOO9UC+tocWp9JjuofBviTVy0ChjhSC3prf39CqXVzPWJo/MScas48Wj9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOUXlPi3WuI2+0y0UgjNk0kSDSdq4gSap5SuJQK5DxY=;
 b=MelOzG99fPVhTvoK6bkJimxUqjpuPpz71PZ6ZOPAaWHIGsAwAUH0hMUDHAWrMHUdrU7QWmld5GAW8kolYoVdIAFj3VUA89OGA7gN4bSNQlg/tkklTONylMOE4Bu0D/XusiB/0bjRPaJzBK5CDF+ue2MgNH+vQSjDGlgfonDRbCU=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3890.eurprd08.prod.outlook.com (2603:10a6:208:10a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Tue, 21 Apr
 2020 07:34:02 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 07:34:02 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 3/5] meta-arm-bsp: Introduce the scp-firmware-juno recipe
Date: Tue, 21 Apr 2020 08:33:53 +0100
Message-Id: <1587454435-46370-4-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
References: <1587454435-46370-1-git-send-email-diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2921.29 via Frontend Transport; Tue, 21 Apr 2020 07:34:01 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 69de22c3-1947-4ef2-106f-08d7e5c660d9
X-MS-TrafficTypeDiagnostic: AM0PR08MB3890:|AM0PR08MB3890:|VI1PR08MB3520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3520F19DA93F69C5521A180192D50@VI1PR08MB3520.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(5660300002)(4326008)(86362001)(6666004)(44832011)(16526019)(36756003)(478600001)(186003)(2906002)(81156014)(52116002)(66946007)(7696005)(66476007)(316002)(66556008)(8936002)(26005)(8676002)(2616005)(956004)(6486002)(6916009);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uuEku0h1rX5FVfstW4P6akA8XXdSo2rnZX/xKD3+oYqdnTbe8s41Lu+d1D+5IKQqbZjlCJiE8sRG4itS5Oz5ZnRrKEeYbqG39fk19gFN2ukpPDQOPekNLtliYmExLB8ihmZEL6bdSCSW+Jc5N315V+AoTi7WIpEreNM3gYILeNJddJZLeijhe6F4Nd+HfmBpm6xL8XTeh4kO/7KHkJ2vHdQE50u/xLCyOqosmseeXuZu1/5GDLsQOgZVvrY3NIRyGfyOvC9FFWjc6+OG6pIvPffhuobpFHlOXFzIFpIrIPUxtXtXQ2uHn/gy7gJYfLj8ortL8z6eeJf/1V4q4JL9ERks6G3GcRgtu8zzmbJVRuuy8fSwbOkIiSwfjk1Fg5ahmAeaM/fo1velkhcnpW3EdyHroJZJtUoAmY4halxUCD9oaHLM1flInopzK1AUDQTrAtJDsQYydTnavMiTd2dXAm1+/JfhW5wtSvmKgN/AXr401xuUyQ/A+CA33WWhTF3ihaV9Y0WyTXT3mc6h93w44w==
X-MS-Exchange-AntiSpam-MessageData: 
 kaSr9uB9YNlCV1DZ6+LS/KK4Pl+O2WbxL/V+Yns1nkESZY+CqIeKaRCTD4psHt5OA2puf55m64mjIu+xRx72a+cZWExm3P1jdmkpdkrdkAg7jsyi4gqinhhvT0TlS5JszGoBtcozwPq/umMSz1vLmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3890
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(7696005)(16526019)(70586007)(6666004)(70206006)(4326008)(316002)(336012)(44832011)(2906002)(47076004)(956004)(356005)(82740400003)(186003)(81166007)(6486002)(8936002)(6916009)(8676002)(81156014)(5660300002)(86362001)(36756003)(478600001)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a6ee96e9-a7d2-47ec-0766-08d7e5c65caf
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e/oDOC2aywt1Jbm7WyV5DmijQ56HQcmnw1DVQMATscEHEO0HQM/68fbPIuwnwLIWj27h+5Dv83PNDwh8vvkTQJxUm19drJ/tH3Nwx4rXAvow3Nqdi916mCm4EYT7unBMLEDzpkDhgQXr8n5KbEdpv2WxjqotHV6GSAu6TTCToy+FujFViW88XvWPRg82JeYHmbcH7At9T9/i0pzupCXmSfJfSuL0gNq7Na5T6OeQL4vP9Esge4veLc3tCCI0Ji1iEBUl9sNXD1sZ+VS3pccDgxAlzvadUADFOpyo4f6gHZx/FRb+gzCFZWcXL4VfemE/v8oZA32MRiPmEDUaceJqtoLx346Tpwk0q4UA91jgh8QDsS2A4xmf48iDMxb0vHcSfJ43Nh5wSqDeJ/7WN0M9+8/umMr8Z4mJEJLvomXqwBvLYbDu/DUdTWyxOECfLu3XqmuFjDXDm0UABiY2dwwvCUvHAtia54UZCzhq7Kcm4b4+hUqCDtrSL5hCD/Y8IZQFUGIBNoNGlSLrrS+Cw3JBEl8RNPiLa+c2cEPqmLajIPyMBAdijL5jqsbwYiO+BaqIq/BFcTsRpZ9SY1DcTKQNsg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 07:34:08.7278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69de22c3-1947-4ef2-106f-08d7e5c660d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3520
Content-Type: text/plain

The scp-firmware-juno recipe is used to fetch the System Control
Processor (SCP) firmware in binary form for Juno.

Also update the trusted-firmware-a for juno to make usage of
the the SCP firmware binary from scp-firmware-juno recipe.

Change-Id: I2a7e517e06c3bbac6b0ffa3f28e0848d8f30589f
Issue-Id: SCM-754 SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../firmware/scp-firmware-juno_19.06.bb            | 38 ++++++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a-juno.inc |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb

diff --git a/meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb b/meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb
new file mode 100644
index 0000000..a6ac9ca
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/firmware/scp-firmware-juno_19.06.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "System Control Processor (SCP) firmware for Juno"
+HOMEPAGE = "https://github.com/ARM-software/SCP-firmware"
+LICENSE = "BSD-3-Clause"
+SECTION = "firmware"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "juno"
+
+PROVIDES += "virtual/scp-firmware"
+
+# For now, for juno we retrieve the SCP firmware in binary format
+# from Linaro Releases.
+SRC_URI = "http://releases.linaro.org/members/arm/platforms/${PV}/juno-latest-oe-uboot.zip;subdir=${UNPACK_DIR}"
+
+SRC_URI[md5sum] = "01b662b81fa409d55ff298238ad24003"
+SRC_URI[sha256sum] = "b8a3909bb3bc4350a8771b863193a3e33b358e2a727624a77c9ecf13516cec82"
+
+UNPACK_DIR = "juno-firmware"
+
+S = "${WORKDIR}/${UNPACK_DIR}"
+
+SCP_FIRMWARE_BINARIES = "scp_bl1.bin scp_bl2.bin"
+
+inherit nopackages
+
+do_configure[noexec] = "1"
+do_configure[compile] = "1"
+
+do_install() {
+    install -d ${D}/firmware
+    for file in ${SCP_FIRMWARE_BINARIES}; do
+        install -m 644 ${S}/SOFTWARE/${file} ${D}/firmware
+    done
+}
+
+SYSROOT_DIRS += "/firmware"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
index c62197d..4a034c8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno.inc
@@ -23,8 +23,10 @@ SRC_URI_append_juno = " \
 	file://images-r2.txt \
 	file://uEnv.txt \
 	"
+# Juno needs the System Control Processor Firmware
+DEPENDS += "virtual/scp-firmware"
 
-EXTRA_OEMAKE_append_juno = " SCP_BL2=${WORKDIR}/juno-oe-uboot/SOFTWARE/scp_bl2.bin"
+EXTRA_OEMAKE_append = " SCP_BL2=${RECIPE_SYSROOT}/firmware/scp_bl2.bin"
 
 # Build dependencies only for Juno and add them
 # doing it with do_deploy_juno[depends] does not work
-- 
2.7.4

