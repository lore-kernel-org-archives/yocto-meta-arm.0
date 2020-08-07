Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.79])
 by mx.groups.io with SMTP id smtpd.web11.2775.1596792396736388193
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=eWGYeYWd;
 spf=pass (domain: arm.com, ip: 40.107.1.79, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj01tY143ex/F2cONYh/hNar4B7F72QAgmkb5929VT4=;
 b=eWGYeYWde72UAg2eR5BlC8f2/JPm0b/PXQeDwniF/ymsPI4JaW/xr4zjNESAl8unGSaWqAoZA+a11pDIxtdsJ6EkJKOqja1RuHaGaM8ilDpLE6Fjo8A2BNlxH2R0WipcNHKkhvTbQCkae8MNOU5GzYGqrzzCC3q7Os3WjVtAIbQ=
Received: from AM5PR0201CA0024.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::34) by VE1PR08MB4878.eurprd08.prod.outlook.com
 (2603:10a6:802:a7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:33 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::d2) by AM5PR0201CA0024.outlook.office365.com
 (2603:10a6:203:3d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:33 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Fri, 07 Aug 2020 09:26:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0435ce0fb95472a
X-CR-MTA-TID: 64aa7808
Received: from 1b910f63043e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D007F87A-8AB6-4E5B-88D0-0BE3C5643C69.1;
	Fri, 07 Aug 2020 09:26:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b910f63043e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve34EAG1mAoWlfRQcG8N58IXCJM8RO7RG+X34B9z3lvuIrLKpjYg8GPyAGiJDl6vmrTmTxHfKbdnOETP5e61vwIQtp9lIxaGBmJUANyIv8d30Axao7u2X2LY9j7JjR61GLt2tyrbhrGL8/h1sQ2e6hnrarcABO/GViwUwq4Ww/ul0HR1uvOfp8NQD+eC1cIg/1I6KxA8IUVJfE/6Qgu9PYGYTu8usSUbcIdlpLg3odZnSDyyZUf4yLNOte/suSDVx/fotTj6YqXild9dHDd0yu0ddFoVLMDS398JUg26nADCt+4aoRzkUa/EBB071a2FTi51BJRybiy0Jx8xdaxWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj01tY143ex/F2cONYh/hNar4B7F72QAgmkb5929VT4=;
 b=IgmvEep4h8Jd2gZWIS2vmoCSSZtnPT8O3fRtnvPrjgHaKdzngrdcmMZpql58HXv5gfAVWkjOaBQvcIlR5oPij7KLN/1TmKjslWlXn0I3MrtZ4uibPDa+JKP24Hgt3r+wp4frUpUw/dQT1LdWQBLEhRsdWp3MLeBs9oCphLlrMbakylG9thB7Jsv5K8WuCZG/G7zh2wo7p8dAltdQh8bfYy9gWD14IQARoKskRER8jpYJJxI/wsWoWMqVlA6cuWMcYm6wIuUOoZYNis4+kzM7h4SRv/692UJxMWtgUWPip+aIWc7+OQS2IRy8fdQe42S80w24kxebHYRlVQmazZdGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj01tY143ex/F2cONYh/hNar4B7F72QAgmkb5929VT4=;
 b=eWGYeYWde72UAg2eR5BlC8f2/JPm0b/PXQeDwniF/ymsPI4JaW/xr4zjNESAl8unGSaWqAoZA+a11pDIxtdsJ6EkJKOqja1RuHaGaM8ilDpLE6Fjo8A2BNlxH2R0WipcNHKkhvTbQCkae8MNOU5GzYGqrzzCC3q7Os3WjVtAIbQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4705.eurprd08.prod.outlook.com (2603:10a6:20b:cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 09:26:26 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:26 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 7/9] arm-bsp/scp-firmware: adding scp support for corstone700 platform
Date: Fri,  7 Aug 2020 10:25:51 +0100
Message-Id: <20200807092553.18876-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
References: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:24 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 309f6c29-b29c-4ae9-bf49-08d83ab3f9b1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4705:|VE1PR08MB4878:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4878F8701E99F4C27DF976F1FD490@VE1PR08MB4878.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:862;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fXNo73Okatjokq1BKPP3Sksw8UXgIqLYnCFdeWSL8c9k3mv/9/Byb6lBf3YJajwvdQs6XPqkwLjl2ixmwqcuTCV1e/cf5UJxbdVCegVW+ZJ3h2zIPp1e/pI8Eb2poF2txXvB+ZwJvhA9D7Re6R3OeJ7fPdbg1L0ywfudbzqoaSUicrUvBxmh4t62O3hz7QbIVyAwj9r9yD50meD/MjjZTP3SdaR2HDKfIPeWKFsrd2YSW/FzakO5Pjvg17SYsgbsYT6Aa3yPeFw4MbLB01xTMgd7eeKp/eW2ZSUPIM7mhVXCYGwAM1B+9htvG2qiyz/JrdkMvYAXE670wfN05VFSkQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(4326008)(9686003)(6666004)(86362001)(6916009)(8936002)(6486002)(956004)(2616005)(7696005)(16526019)(52116002)(186003)(1076003)(2906002)(26005)(66476007)(66556008)(66946007)(316002)(36756003)(54906003)(5660300002)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 4tQetR9/Dc3suB19gnVYHPVhR6TqWMbXzStin/1KQS7XKr+KkhfQsW1n8XqYegGwsiHINZKNZTHtTVrc30muU+AyiXSsgehlgL9njGkkre1ZKYO5lSQWLxshSz8Oat3zQshzP+1doQBtXcN7gDJp4ubFj2ATUcyVTprlEv71g4MnnsuOepEzO0CeIMr/HM/i42zySvD+Z9v3azkoson85f1/f8lTz7IGZUYxMOWgJ8lDxKBBxLKn34x8dH/C+l899GgF3O8bl70a6YHyst/mgaED4BzdYgbOvy84fyRIVcG2FFdGzpy6TfUzo+jf410yF/GNgVrrxFPXK5xvKJvbnSh3/Bx6qJzvGrMluDNnh/Dh+BDRk6NFefRc0ik90L3K9NNAa84UI51gXaT0laO/o5EoNomOJtBn6/EeXQieMrkE6hKoapYv3C6Rv6ggJiumeVcKceRvVsulBzxGLDcNe2kKVApJfgJbGtCAxLZ9oUwaU+I4prMV5t/aEKyrnB1NeRyVlLgM0CMe3syNFE8aVHMpwdSoJaYbX+xaz80klMKeGh5kMptQYMNvycSo/8YlEf9FDkAZCI31K3oa6yAlmMStSLHEHFpCkRiVHBfwt74AKskbD31USWeIFT50QJpcryo7PO+4Y8FenPkuZ71viA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4705
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	575bc825-bbb2-4302-094e-08d83ab3f557
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H3Vz3KeZrJ20OlBJgLIv2+rMFPRZebDjMdqG9E1YoHC9xjnrPAduJxg/PD4AqTHA9d9DxNqgiRgUm5cAfATSLkWi2+Op8w1e152z+zjHnlhETJ0712ODSkqQWKWtzogXs+LCTFLqSfgejU2558vwMQ1qJ8T/nycoTBk7P6ieyk+sAdOdqHkfoYJZMXkXrK+P2br74NO7UYxy5rINnujBDGHl0t6QfYVPMqBe4F/XSgwSrMM0f4vq0amVXP3t94Cds6kZAEUtGfMBIiwj/4a4Txt4uKNK4Dk6L8bARWEP4lWD6s+/q2/w9XN+j0ir7giVvKh0hyQ7TiUV1bdd8NDWq2Km8d8/TDlEFfYhoe2GQF2yBiPr1g6xN63ArNn0HQIenjI/4NGOVYKSfDKwvAroMg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966005)(36906005)(8936002)(70586007)(9686003)(4326008)(70206006)(478600001)(54906003)(6916009)(7696005)(86362001)(316002)(8676002)(1076003)(186003)(356005)(81166007)(82310400002)(2906002)(36756003)(956004)(5660300002)(83380400001)(6666004)(26005)(2616005)(336012)(16526019)(82740400003)(6486002)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:33.5153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 309f6c29-b29c-4ae9-bf49-08d83ab3f9b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4878
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

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
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-cors=
tone700.inc

diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm-b=
sp/conf/machine/include/corstone700.inc
index 6b02415..91f290f 100644
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone700.inc
@@ -14,7 +14,15 @@ PREFERRED_VERSION_linux-stable ?=3D "5.6%"
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"

-EXTRA_IMAGEDEPENDS +=3D "virtual/trusted-firmware-a external-system u-boot=
"
+PREFERRED_PROVIDER_virtual/control-processor-firmware ?=3D "scp-firmware"
+PREFERRED_VERSION_control-processor-firmware ?=3D "2.6.0"
+
+EXTRA_IMAGEDEPENDS +=3D " \
+                      virtual/trusted-firmware-a          \
+                      external-system                     \
+                      u-boot                              \
+                      virtual/control-processor-firmware  \
+                      "

 WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700=
.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
new file mode 100644
index 0000000..16437c5
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-corstone700.inc
@@ -0,0 +1,37 @@
+# Corstone700 specific SCP configurations and build instructions
+
+SUMMARY =3D "Boot Processor firmware"
+DESCRIPTION =3D "Boot Processor firmware"
+DEPENDS +=3D "virtual/trusted-firmware-a"
+
+LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe988=
d9a0 \
+                    file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4b2=
1ef20c29e"
+
+COMPATIBLE_MACHINE =3D "(corstone700-*)"
+SCP_PLATFORM =3D "corstone-700"
+
+# boot-firmware project is a fork of scp-firmware
+SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmwar=
e.git;protocol=3Dhttps;branch=3Dmaster"
+SRCREV =3D "a4dd1b60218b5172a94e6f44c96384b84a77588c"
+PV =3D "0.1.0~git${SRCPV}"
+
+B =3D "${WORKDIR}/build"
+
+EXTRA_OEMAKE =3D "PRODUCT=3D'${SCP_PLATFORM}' \
+                BUILD_PATH=3D${B} \
+                CROSS_COMPILE=3D'arm-none-eabi-' \
+               "
+do_compile_append() {
+   oe_runmake -C ${S}/tools/spitoc CC=3D${BUILD_CC} clean all
+}
+
+do_install() {
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_ramfw/release/bi=
n/firmware.bin ${D}/firmware/se_ramfw.bin
+    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_romfw/release/bi=
n/firmware.bin ${D}/firmware/se_romfw.bin
+    ${S}/tools/spitoc/spitoc \
+    --seram ${D}/firmware/se_ramfw.bin \
+    --offset 1  \
+    --fip ${RECIPE_SYSROOT}/firmware/fip.bin-${TFA_PLATFORM} \
+    --offset  33 \
+    --out ${D}/firmware/spitoc.bin
+}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 33ae7fe..c971c5c 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -4,5 +4,6 @@ MACHINE_SCP_REQUIRE ?=3D ""

 MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
+MACHINE_SCP_REQUIRE_corstone700 =3D "scp-firmware-corstone700.inc"

 require ${MACHINE_SCP_REQUIRE}
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
