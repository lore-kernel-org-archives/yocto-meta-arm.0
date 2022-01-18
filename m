Return-Path: <anders.dellien@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED05BC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 17:04:19 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.87])
 by mx.groups.io with SMTP id smtpd.web12.15350.1642525457544298625
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 09:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=PdW4MbvD;
 spf=pass (domain: arm.com, ip: 40.107.14.87,
 mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JnCk83k9XwR7agw+ChpzjfkSVeLw11pHaNmVlK0gvo=;
 b=PdW4MbvD3hQBbTEcTu43ULvSyhTzpHAEel4slVuS9BuXSEIM08fslD6DG82seDQMkDobAsXL1bNlQl8AZNGDRIEvHJIF7riGoxEU6reBTQ2fZYlOKppXy+g8HEauN+27kkEAFKGfrKtP55CNCNsEIgqDTOBe8Hlqf32LmXwtZAY=
Received: from DB9PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:10:1da::19)
 by DU2PR08MB7344.eurprd08.prod.outlook.com (2603:10a6:10:2f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 18 Jan
 2022 17:04:14 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::9f) by DB9PR05CA0014.outlook.office365.com
 (2603:10a6:10:1da::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Tue, 18 Jan 2022 17:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Tue, 18 Jan 2022 17:04:13 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Tue, 18 Jan 2022 17:04:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e3f408362ba1001
X-CR-MTA-TID: 64aa7808
Received: from 678618884cec.5
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 457C61AE-9F5D-484E-94CC-ACAD1EF11686.1;
	Tue, 18 Jan 2022 17:04:05 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 678618884cec.5
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jan 2022 17:04:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEPs7G4ztF5CZrS82J5eVLaRWvelWzdN/Jf3vd1PCS1WdenpmkX5X5c75kyneH2DZvbkfjx2QjTYWF+PuaHnrdFoqlyknytKAu5isOQ9yeWPHWJ8PdGeYxeehZ7X0tyN8AfxnX0wd5AuvcI5Qzz8jtAnfdlaXC0P1wFoggrNjNxWgAwhDXFVQDIKCVnvD6M2hkAKh/B7l3nlZIMTu763aSK9TM5cRzcUMgFbdmGvd+sj3EXA70WHkOC3B1BRfQ7j/8hyTM/3F6g659x+PL1lLUzHxXYD3w5ihPQjJTNHtzQKb9qQ/cJ17ZPzf7P9cbXnnD7X/Fi5v1Ha8GplKO1C2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JnCk83k9XwR7agw+ChpzjfkSVeLw11pHaNmVlK0gvo=;
 b=MYZ/FRiVWrWIxiEzwI+2XID4ntGE8eMUVJZh5cIigco2Fds2wW+xLkmIrgi0wJXYjM7UtrBkkTUqXNYK+Cxn/zUFV5/DYYtFeMr9Wnj0UwqPCZtqD6yLQsDXCBX3TLqxfvXq1A7iTQMRh71LnWQ8INc3pk3SEY/M2Ew9ddn/ACzC0pKuE/19n/ukdPtMp4LcAshFAy/ibk/UIYKUh1zKCE56ahQFG19DdlV322cXXBa175zsGKuQx++JEf8/e2w78FaPj4xBU4px7D938+7Km+vvLM639HP1IBhBGKhVhPbsJtZsUaeL1esEGfzRGsJdOcS+lb2dFJuXg7eSTlhndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JnCk83k9XwR7agw+ChpzjfkSVeLw11pHaNmVlK0gvo=;
 b=PdW4MbvD3hQBbTEcTu43ULvSyhTzpHAEel4slVuS9BuXSEIM08fslD6DG82seDQMkDobAsXL1bNlQl8AZNGDRIEvHJIF7riGoxEU6reBTQ2fZYlOKppXy+g8HEauN+27kkEAFKGfrKtP55CNCNsEIgqDTOBe8Hlqf32LmXwtZAY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by AM5PR0802MB2596.eurprd08.prod.outlook.com (2603:10a6:203:98::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 17:04:02 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::8126:bcfb:4535:3450]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::8126:bcfb:4535:3450%4]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 17:04:02 +0000
From: Anders Dellien <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Usama Arif <usama.arif@arm.com>,
	Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2 1/3] arm-toolchain: Fetch prebuilt Android Clang,
 version r416183b
Date: Tue, 18 Jan 2022 17:03:48 +0000
Message-Id: <20220118170350.23361-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 10ba4c28-7896-4574-25fe-08d9daa48de0
X-MS-TrafficTypeDiagnostic: 
	AM5PR0802MB2596:EE_|DB5EUR03FT028:EE_|DU2PR08MB7344:EE_
X-Microsoft-Antispam-PRVS: 
	<DU2PR08MB7344D6ED9042D4B6DB942D3789589@DU2PR08MB7344.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 V6Gn5DOPJWVLEb2DHVAm/p22jFMpC/t1zCZiG7D5RYlmI7FP1hsKyh3ObMHOuY5cj4smXOXpoaKi/fQjE5kCyiMCYR8siC9D0jTtvJuldi8HwR1Q5d9pHz9NSBrCh4kqLkV/c2nGuEgGlMIuCoH7lYvwI/Mpgpk5ijy5rsGMyb7zqG9cbj2GJh8JG8F8gGixJYTihelAhIue0dccuJQs8vRzLmjFy4RnMZPYpNrWruYET9NfQutCKbBecnhLlQWt9OcIwCR0dDATMW4HDHHTb3/ymgK7xoESdv003QHlSVHmhlV/b39Bo3owdF/Y10uL0wzCkLmGHKAvJ5gMXo4n6L3Kbxded+LWdHHdwuNLHL2oVuHDrxHiWsFhV7UDaI/sYH5xbO3UeX1jzQZr+RiN3ZWY2ac8v3Td+BZ8KVsl0hiJGaloN6xD3BHsIqwp2NRjUwDrNhieNJHoK/LdXpezdIlzZoOh+0N+DC7nFkh8HS/69u+CEszHSA+ezM5sNfT9mxtYQaG/4uPDD1j1QcwRx0HiBqKXTXTVvezIoEhm7rA7wFHksnYwWQF9QyspFQ4OPJf8GAI03ja/3eKS6fY4S95zwetvHwLPjEoJLg7GGIgfPvzg5yqMD01vcljtd3BbUHSpv69LG+vGkWdraYZvYS5ElXCVY+HWf+eUUxsj3X82AGCh6rb8oZBfLEbuT3U3qnFeJi0MwB78ZGSxnh1tVV/HTPqLxl4VjWrHYvxf/+OfUm0qN5r3jXpxksMOkopMJ5tmI4dhal0/uETh1CPZhtk/lb+/rYUVq57TQaKZOlA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(54906003)(83380400001)(2906002)(186003)(52116002)(316002)(1076003)(6916009)(5660300002)(508600001)(36756003)(8676002)(8936002)(6666004)(26005)(86362001)(66946007)(66476007)(66556008)(4326008)(2616005)(6512007)(44832011)(38100700002)(6486002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b0f9f17c-e563-442f-82e1-08d9daa486cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	srcb41TQ57w6BH0DXPlp6qm8JaV+xx00Yvb5EeCsJwxKL6V4xFptpRm74oLRtLanIyyWxL/FGwWx0OpBDrXmNXWchSBAA9opJQecfNEuDuPpXm7289/4bBfLjVSRwPCnsxLEC3EQC4wuLvYLUxWjYfXkUvKGhuOf0Qf7I5BmaxDC581hoWch2TuXCTgZxX58BzRgCjRaG/IkvOy5mO0pZ2q+cgfhUSEm+B2V3F78O52xeqNTZrGUULu45RrYJ2QvvgOOHc2fYkG9x3VOHjge75XG3Pq9/N/uxLSUim42KUgtLVlTnQeaz/4r7XPo0Z6482hDvMEV+H49AMpswaXgsrLkpdZi2/QkGG/kllFcFOrS2CJODk6noQV6IR+jvTOdNE828aZS4RAFEAb6hoOHk6yAsKO4mD4ZbACwAwAGVmGCDfTIQPAs+k4SPKUk6z1Txa6zcHEKJg7BVLyT64MPlLsMQXl4c+mm4NbZSzrVvkJh/dqM/R6o69/W+eOKCBj/lvjMC5FRlW0AhbkEmvxzn6RlloXpFwl59A+9nyCKqiyGy4HyqUevE11kEcuW4bX8hOcqYHnc97+fgTKGcIQVG9D9oBjH+qfTtuo3GP/rDHYq8R0U6edJ3IlV5VLkjIdF2QUPX5E/E3r4PoeTIMugwbhGZnSiq3ZYRPD0V0d9+tJ5w9VqE0rAZCXjzqG6E/OoPYZULPNm0NhVuO7GUVzyX/F2u7WBiR161vqUvu8kyu44BKWbYCP2CYbGJnF2WR+f7NOGe+zFzrcPMo/dBMguEPEu7Qg61CWItAQQGa6MesRifRYU5owiT68zNz8I5DLYQcQW4OQghFuyaBgxJyKrpJyU+ASWbwNELctA1gvdLcE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(26005)(8676002)(508600001)(83380400001)(40460700001)(36860700001)(6916009)(36756003)(186003)(6666004)(2616005)(2906002)(1076003)(44832011)(81166007)(356005)(336012)(316002)(70586007)(4326008)(6486002)(86362001)(70206006)(6506007)(54906003)(5660300002)(6512007)(82310400004)(8936002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 17:04:13.9329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10ba4c28-7896-4574-25fe-08d9daa48de0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7344
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 17:04:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2858

From: Usama Arif <usama.arif@arm.com>

This Clang version is present in Android master
(as of October 8, 2021)

Signed-off-by: Usama Arif <usama.arif@arm.com>
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
Change-Id: I957742ee943ef68119fd7c7e2bd8ee62b717b31c
---
 ci/toolchains.yml                             |  1 +
 .../androidclang_r416183b.bb                  | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb

diff --git a/ci/toolchains.yml b/ci/toolchains.yml
index d99b1314..d2dc2961 100644
--- a/ci/toolchains.yml
+++ b/ci/toolchains.yml
@@ -18,3 +18,4 @@ target:
   - nativesdk-gcc-aarch64-none-elf
   - gcc-arm-none-eabi
   - nativesdk-gcc-arm-none-eabi
+  - nativesdk-androidclang
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
new file mode 100644
index 00000000..d28d6b1b
--- /dev/null
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/androidclang_r416183b.bb
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (c) 2021 Arm Limited
+#
+
+SUMMARY = "Android Clang compiler"
+DESCRIPTION = "Android Clang compiler, version r416183b. This is based on Clang 12.0.5 \
+Intended usage is to build kernel images that match the output of the Android (hermetic) \
+build system"
+
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://MODULE_LICENSE_MIT;md5=d41d8cd98f00b204e9800998ecf8427e"
+
+ANDROID_CLANG_VERSION = "clang-r416183b"
+ANDROID_CLANG_HASH = "bd96dfe349c962681f0e5388af874c771ef96670"
+
+COMPATIBLE_HOST = "x86_64.*-linux"
+
+SRC_URI = "https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/${ANDROID_CLANG_HASH}/${ANDROID_CLANG_VERSION}.tar.gz;subdir=${ANDROID_CLANG_VERSION}"
+
+# We need to set the checksum to "ignore" because the tarball is dynamically generated and has a new checksum every time
+# (the contents are the same, but the time stamp differs)
+BB_STRICT_CHECKSUM = "ignore"
+
+S = "${WORKDIR}/${ANDROID_CLANG_VERSION}"
+
+FILES:${PN} = "${datadir} ${bindir}"
+
+do_install() {
+    # We should really use ${libexecdir} here, but that as some files have invalid RPATH
+    # this results in lots of warning. So using ${datadir} for now
+    install -d ${D}${datadir}/${ANDROID_CLANG_VERSION}/
+
+    cp --no-preserve=ownership -r ${S}/. ${D}${datadir}/${ANDROID_CLANG_VERSION}/
+
+    install -d ${D}${bindir}
+    # Symlink all executables into bindir
+    for f in ${D}${datadir}/${ANDROID_CLANG_VERSION}/bin/*; do
+        ln -rs $f ${D}${bindir}/$(basename $f)
+    done
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+INSANE_SKIP:${PN} = "already-stripped libdir staticdev file-rdeps arch dev-so"
+
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


