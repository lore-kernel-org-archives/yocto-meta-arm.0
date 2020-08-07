Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.41])
 by mx.groups.io with SMTP id smtpd.web10.5220.1596804156893888399
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 05:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YLq+K4Le;
 spf=pass (domain: arm.com, ip: 40.107.6.41, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj01tY143ex/F2cONYh/hNar4B7F72QAgmkb5929VT4=;
 b=YLq+K4Le38xyppB8lqLeovSACT5L21nk/oQab2WqJAAGudzvwzIzp47VEt0AOoyi71S7nZ6mukkeBcPqYJGcSfI6wnCa7FplXaYpepOshOkco/NBftfA8Z8lo+5olhOppzoUknJfSrNIq1sWWydDkbC+o8jSI9zmWR2gkgaKSV0=
Received: from DB6PR0601CA0038.eurprd06.prod.outlook.com (2603:10a6:4:17::24)
 by AM6PR08MB3605.eurprd08.prod.outlook.com (2603:10a6:20b:48::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Fri, 7 Aug
 2020 12:42:33 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::af) by DB6PR0601CA0038.outlook.office365.com
 (2603:10a6:4:17::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Fri, 7 Aug 2020 12:42:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 12:42:33 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 07 Aug 2020 12:42:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc7515c2a4b054f1
X-CR-MTA-TID: 64aa7808
Received: from e650f82a9e88.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2169A5F8-752A-416F-9125-A9032B1D425E.1;
	Fri, 07 Aug 2020 12:42:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e650f82a9e88.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 12:42:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWjL9auGRLpfPuLz8ioxvTo+NIay/lLOX0XOX558PJA02VPlMfDLP2KTo+UU2xclGS4fW8ILbwz/D47/ypiGz5ix2siISyeyOpL7O8Woc1vcnWxwYJZA/efo/mQrHdlnzUsRPDs2YcrcaIyrPGmUIVJQgjLdN04Rm2A3l6wi0ygIpVwUEc5vdoAK4scWtkK0O/vmOWEBhRK0nQ4HHS6upJyWSTfglf7BCJUkpbxsZgq6I/xfXRMXVKsoc1JDZv+7hns31D5TacygGFEwYonNkTETl0UPYpWRH858AnMavJOI6e5L9RPK4XBl2jZ4GDPTcVPqzDHC65oM3RgwhE/+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj01tY143ex/F2cONYh/hNar4B7F72QAgmkb5929VT4=;
 b=ACI5xl9LPHv3nNN070SDopLI19nwdYzSohMliisC2ki2s4YhLgedcyHvdV7wVoEm0vlO54xycV1pu8Dh1DOqxPXY356jqx5aNX6DGtfmTKKAIQHdE+zIjBEeSGcTcIoR5VA2gI4+qmLFpzlvNGlkuFbg8C2drtKnfk7tGEN0Ip2C+oNm5WId6HhK4StZL1U0oGxqupqremBznixNHazrWtMTK5WfPObN1CsNoEZ8LS9MwvUbQrTEG7j1Enpzl+JLwigHz1C/3m+INS55GFpJ6Vv43Iv6XAMyidIqLPxqUxJxdBgmtfZvZfvUNLbdvxp8bVaKivMbfY25+72BAyV7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj01tY143ex/F2cONYh/hNar4B7F72QAgmkb5929VT4=;
 b=YLq+K4Le38xyppB8lqLeovSACT5L21nk/oQab2WqJAAGudzvwzIzp47VEt0AOoyi71S7nZ6mukkeBcPqYJGcSfI6wnCa7FplXaYpepOshOkco/NBftfA8Z8lo+5olhOppzoUknJfSrNIq1sWWydDkbC+o8jSI9zmWR2gkgaKSV0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 12:42:27 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 12:42:27 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Rui Miguel Silva <rui.silva@arm.com>
Subject: [PATCH 7/9] arm-bsp/scp-firmware: adding scp support for corstone700 platform
Date: Fri,  7 Aug 2020 13:41:53 +0100
Message-Id: <20200807124155.24198-8-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
References: <20200807124155.24198-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0401CA0043.namprd04.prod.outlook.com
 (2603:10b6:803:2a::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0401CA0043.namprd04.prod.outlook.com (2603:10b6:803:2a::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Fri, 7 Aug 2020 12:42:25 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5d75b07-d871-43df-58f3-08d83acf5ae6
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|AM6PR08MB3605:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB36053AACFFD1B71D093D15B3FD490@AM6PR08MB3605.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:862;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RivBkCcvzRtya5W8vtCOIU8Fn6DTYSFbpiTWR2WhlNLInSuk8lrrVgyrk5FGPJFM8rhdPJYPlJET5fs0rUUbp5jNxZAWcsxloQhYqKv3ho57aWyrHh9p+zbK4/OL92MuQGtBZTW9vFzqtWHJVHk/NvT4jm8GJeHiZ9nYd+j5HWbje4SySnUWyZjm8t31F3nRd/4/3ElBeqEGOikW5vTEMWwEqzbBj5JNnN4XJF3Seko+Fa1drWPnRdN1xAbuJx7nRp6+Oc247v+/Imb3iPKtfdyllYtut1YYJPfKhit5eqECDa9U/ykNAKgX1uuAmOQY5XtB7/ig+0J0MlwTSfq+3g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(66476007)(66556008)(36756003)(9686003)(478600001)(8936002)(8676002)(2906002)(6916009)(54906003)(66946007)(316002)(6486002)(4326008)(6666004)(186003)(26005)(86362001)(1076003)(16526019)(956004)(2616005)(7696005)(52116002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 bXNLsYS5nJqf/VYOBrIrdWv8c0g9LvDnfIiIULDhyuxIpQeHTnXKHtCagSmK0OXnzevqmWa4ApGfUrphthV79Hu3LfPtWyzMqIXFBMmrWCxLxzC1tSAQq/xNlEl77LeAFZJSQz3Ud0kJAFm3mFMifFLxuFXuFURX1kqiMLSnYA1iMxIt0TOzuR3TfVKyKQlNoPMpuV0hpm4QxuHhuvvm14+Kez3wGqUjT1GJxRXLuka3p9+VC4ltyoBAVZl55WMzgph9eAo9w/A/Z70zWzwYhKl7aWKsWMMvn9H1oU9anCsTkoKOR04c3pE3XXutqi+h1fQKCoTwsjsiT5br8PpOG6JfD47f7vDfHgU8T+fjz7Nkk75rdsVtEZnmEbNiUZhBDy9inGFROtBcINrmhngZk8W148UPhDYYHKRvFubjVTs0QRmCqKZcC00zsCDeQdwGmpykQrtwzIwXSUXU+BRriBnzBvxLnyiNO0WN8OIhqXYGa3rZkPzJMdo2vNhlYy5jUq/HigqJa6RFDDRyaFfWCpCzhJ1Y/4NH4XKIyR5ScIHOQQNW7DyTpaEnkjbJ3KcNxBXmWE9GJRwtHtAQq9us3XrZCIixW3HsqSbacKfsd8MG4kz+gX73o01flnKxv7LiGH/PqGHyljOn3gRpLOdFUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	58934a86-d1ab-48ce-25db-08d83acf5721
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nr8qi3DHa7cdQ18YNnCwUT2W2RPM79tpUdWzWelB1tm1BfABZbqpb10odGjb9UOmtRinZvhVQhOdqGVPa68m93ttKzBZm4pQ6EAwsWGg3RY33sZxjVhSHpmg8si5OAFRJxNNO3dH/TkFm//U8as6Fn3nP3M/G2S9+P4/E3JuqILjC04ajH5ip51/Z5i7pur1mA3pK8tzXGO8oaXi0iD1lbKCUPeuHzOWdbKT9d0yAYEklZnm0xSxQMVl6jTCJamy5WQt1kQC8vEUNc+lJ/9MqZArOFIVI5cVh2Hw4GWyBDxAXORH6HvCH0enZcmS+QJp/KynPR5D2yGiuBqv07YzcRQftNhj3Hy/D6WMqpQZZDaR8jeFt0aqYrSaLPeIrYmBEJSv/l8L5qfWrct68dD4sg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(54906003)(6666004)(8936002)(70206006)(316002)(2906002)(4326008)(70586007)(82740400003)(47076004)(6486002)(81166007)(5660300002)(9686003)(356005)(336012)(6916009)(82310400002)(16526019)(86362001)(2616005)(186003)(1076003)(8676002)(7696005)(83380400001)(478600001)(956004)(36756003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 12:42:33.0551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d75b07-d871-43df-58f3-08d83acf5ae6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3605
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
