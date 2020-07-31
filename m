Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.71])
 by mx.groups.io with SMTP id smtpd.web10.695.1596218822672149492
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Jul 2020 11:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uaEaMt7+;
 spf=pass (domain: arm.com, ip: 40.107.15.71, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0ewely/2/b23Z1c1H7/ObjtFXwbRKZ/HKoZODbv7/s=;
 b=uaEaMt7+9Y9j+4j11uA5f4gkyvaE5/jqSXNoSgjBI8RMN+5QrJBj32mnKl7ktwtBde/+a+/aEdqo6oWUqZ7mXk2xIhK8b+FMoYI4tKtvdc3+V6GKKA4m7KawN/oPyFQpwGoQ/n3tfPB/JFqhhz7AuNm9nj/mMGEn7Ccv5w+peQ8=
Received: from AM6PR0502CA0047.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::24) by DBBPR08MB4838.eurprd08.prod.outlook.com
 (2603:10a6:10:f6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 18:07:00 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::ee) by AM6PR0502CA0047.outlook.office365.com
 (2603:10a6:20b:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 18:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Fri, 31 Jul 2020 18:06:59 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Fri, 31 Jul 2020 18:06:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc911cc07925d756
X-CR-MTA-TID: 64aa7808
Received: from 9168a757458d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5C53FA30-55CB-4B62-B17B-C4F2DC05AD1A.1;
	Fri, 31 Jul 2020 18:06:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9168a757458d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 31 Jul 2020 18:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Obe+Z0hxQuXOIRAnyF13CCrZqDE0xlHhWuGQluW/jse9TGDJqT6aCNcw9YNlqb0i1Dl7ojuGd8o7ZjTUY4D4ia9uDQihEUaDIZWHJU7sGHnK1SDewDJAVZw03e+OsIloBnK8lTlApW2cRGwN319vJI9KMYg6gwddHymzEbAyHT86nEjTVJSCZOl7i5+TweLTmhrr69wNTaVORV/Xer7q7OEHL4KgBiD3upBsOEBg6aDptvMS9EcGEqdlOzbjNyKjp26aGQWYKbScL5hM7vu1bjY7tbAzR3+NOG/UVjKLFwWHJjFkN6BjkE/ydljE8KSDMph1/K75LrTJpAEg7/WOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0ewely/2/b23Z1c1H7/ObjtFXwbRKZ/HKoZODbv7/s=;
 b=PV6zRdmgfg70q5z3BtYaa4WvX0WoZvv4hgMkadqk3xfJ+/uMMWGJ92MoLQiVofrfbDIIc9gjCfs+Xe9WrVDCyclhVsoum6824uzrSG+Sv7pHA/sZdAy+7PP0rqfcmns5le4gE3KEdQnjTu0C/PugNbx9eHwi9rNcxMP412GiH470Ut/tHErrjEXUJKL/Vt2eY1DLhXLIQGKHc6G3Veo8n5OoeOgdWCQXxU1TpZpUrAaDs8s4l+poGX/Nt4dsYcgIpGcvUascCV/lDNcFezTXe6FhZa65pKOnNEhCBTPxzEMBsXAHgN8VffOE6QTeaE7XLyR20CeJbuAoNjX/jexJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0ewely/2/b23Z1c1H7/ObjtFXwbRKZ/HKoZODbv7/s=;
 b=uaEaMt7+9Y9j+4j11uA5f4gkyvaE5/jqSXNoSgjBI8RMN+5QrJBj32mnKl7ktwtBde/+a+/aEdqo6oWUqZ7mXk2xIhK8b+FMoYI4tKtvdc3+V6GKKA4m7KawN/oPyFQpwGoQ/n3tfPB/JFqhhz7AuNm9nj/mMGEn7Ccv5w+peQ8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB5267.eurprd08.prod.outlook.com (2603:10a6:208:158::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 18:06:52 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3239.019; Fri, 31 Jul 2020
 18:06:52 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm: add TF-A v1.5 recipes
Date: Fri, 31 Jul 2020 14:06:46 -0400
Message-Id: <20200731180646.18230-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0086.namprd05.prod.outlook.com
 (2603:10b6:803:22::24) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.110.7) by SN4PR0501CA0086.namprd05.prod.outlook.com (2603:10b6:803:22::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9 via Frontend Transport; Fri, 31 Jul 2020 18:06:50 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 31 Jul 2020 14:06:46 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.110.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64cde852-e168-42b1-19e1-08d8357c851c
X-MS-TrafficTypeDiagnostic: AM0PR08MB5267:|DBBPR08MB4838:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4838C60AFDFBA736A36A7ACCF04E0@DBBPR08MB4838.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 f2LlLwMHPxvCZkK8jhif81st7gwfJ5nFn332GTTi7oEEmEAO8b3sbyeAijcbxEoUVYPSW+fGBxoT0odCco3Nsh2QKpYIcp8KIuuMaF65zl9rWfjOBqqgTsE7fJPo143Gp2Lm6ES28bI+alG8TaT57MStAijlEpwVc6nw4bcBHL/h5UYNSi80/8AO4nRHIQPcjxzHAVrOs/xJLD96DgMk9QfDvZ2cbqeQ2SaiELYKceohfQWxb58P8D4WRTd7jjAT0aWqBdPXHpxbxyHk4Bjw4xKrpbswMdaBhkeBJtxRR7S3fHMWgMDfUhzm7FltRhVZO7CCtAGUH4ogzsazhq2kzw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(2906002)(8676002)(316002)(6916009)(2616005)(86362001)(426003)(478600001)(1076003)(8936002)(26005)(186003)(52116002)(5660300002)(4326008)(66556008)(36756003)(66476007)(44832011)(42186006)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 MFiLXkFwX0W1R4C5FPISk1Y9DLYV0TisyRAX0v0U+0M5ulKgXSShvfXZ/fZG53XLEVQNOIf0/9KmpnDOe/1/Z2spqK5sqI/7+Aw5yTUFenPe0JGRvGzUuZ3d0jSOXgRWziBcZBtHmTe79mKArL89egdXDzxfRlhPZ8HnFPkqWNqLZwsmtk5pV8DxTZ6CxgfrW0JTYoqIA84/PGkdHJ/GaIDjGUqMQklHRqEQ+xzWImovmiydmvcxyi5tZs6g5dFNFWpJ2L/SUnQbz/sBE8juS1TNj2/9KK1uuADw3QVWFOjVBjVBMgS4fVZHTKMJAycxqqZsnl2zY+pXt76vxcARA1jfB73X8+848hMHCVJsSHhPHF2tE5v7Cu/tTnwrh+KY/pmc4FlJbGwq8qSfixrfeN9upVHf3FMNeM8yVp+wUenW5Fnmp+PGddTijlYLKX7ZS17/8hlJ9QduetZ17s9dgsidUufCAbkeo1Jh07FR3/KlrdcE7KfAD2T+ICp7dNQ+238VHdwYJImAliuOgMYT4SFc2hX+npZw61JeYZ1M6vpHB3M+pTlIfYC1leyLaWTw2Lu9VbkESswC+Wf3Wlwa+aB01ggoBrDEIm9DdPWpKokz7M4sYEKpGa79quKZLB+e3lYESEkbYwgGxVnUdoGlkA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5267
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c02187c8-e2cc-456d-2cc9-08d8357c7fc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XOtBAJhu3JX+rO5tGf/CdrkLdgYKURkqE9m7jJFWRywF9VueY/yFRTBAMFfIk6Hfvsx6qT94CLQ4+PO9P83AHxM15TeMqbgg8gqtobd1vFO1D3Yg2BEiqPFPUB41vcuRJgE6vRPmDKujRyRurwKe/6muAdCaFz1xjZADUcYex5I+STNG7w6s1ohJaUo/S0n4zwMdJ9IMewLKKI8wdQN3i96YVlHeeqJWEHsNqkNlG0qeGpUUrGNVxzD1rOZdXiOUvruRUqrnr+2Do8OJJQC1QbzAL/DzZ9sIS9wxVeUppq156w5Wc7ATcBu0YlnHkXS6WyLA7+4Blap0t/19MP/SQ2vPCnttzxYmzZbVcW4V10Yvz1IknSo/jDk16SJK+O8lPViCb2W+p7t0xsE8dGcsvg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(82740400003)(4326008)(47076004)(81166007)(1076003)(5660300002)(8936002)(42186006)(316002)(36906005)(2616005)(186003)(2906002)(478600001)(336012)(70586007)(44832011)(426003)(86362001)(8676002)(70206006)(26005)(82310400002)(6916009)(36756003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 18:06:59.7803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cde852-e168-42b1-19e1-08d8357c851c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4838
Content-Type: text/plain

Add trusted-firmware-a recipes for v1.5.  While old, there are platforms
that are still using this older version.

Change-Id: Id40414ad58fd274af86203bb2c8d449e18a10c7a
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a_1.5.bb                 | 32 +++++++++++++++++++
 .../fiptool/fiptool-native_1.5.bb             | 31 ++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
 create mode 100644 meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
new file mode 100644
index 0000000..3570f4c
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_1.5.bb
@@ -0,0 +1,32 @@
+#
+# Trusted firmware-A 1.5
+#
+
+require trusted-firmware-a.inc
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+
+# Use TF-A for version
+SRCREV_FORMAT = "tfa"
+
+# TF-A v1.5
+SRCREV_tfa = "ed8112606c54d85781fc8429160883d6310ece32"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
+
+#
+# mbed TLS source
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+
+# mbed TLS v2.16.2
+SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
+    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+    "
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb
new file mode 100644
index 0000000..925542c
--- /dev/null
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_1.5.bb
@@ -0,0 +1,31 @@
+# Firmware Image Package (FIP)
+# It is a packaging format used by TF-A to package the
+# firmware images in a single binary.
+
+DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
+LICENSE = "BSD-3-Clause"
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https"
+LIC_FILES_CHKSUM = "file://license.rst;md5=e927e02bca647e14efd87e9e914b2443"
+
+# Use fiptool from TF-A v1.5
+SRCREV = "ed8112606c54d85781fc8429160883d6310ece32"
+
+DEPENDS += "openssl-native"
+
+inherit native
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+    # These changes are needed to have the fiptool compiling and executing properly
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
+
+    oe_runmake fiptool
+}
+
+do_install () {
+    install -d ${D}${bindir}/
+    install -m 0755 tools/fiptool/fiptool ${D}${bindir}
+}
-- 
2.17.1

