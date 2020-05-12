Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web12.9696.1589301259326696012
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 09:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wvUL8blI;
 spf=pass (domain: arm.com, ip: 40.107.22.49, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRQR7oaLiYvKs8Wd/M4PE25GODl3hRs0KVTno+plu+A=;
 b=wvUL8blI/GGwDKbU0kj1Vz9OE6P0dd7jNjDWSzM1kmLPDTk8sLWM1qdF4wTZrIcnay4xWfMFxiASUHMz6/H9jLyxX27LVrewyV+jNfV1+YsyawqSxiDWZd0BeY0aE12q6MCF3B6uCG8YpDXJNX1e5dVhR1H+lgBUck7Mg6adZFA=
Received: from AM0PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:208:3e::30)
 by AM6PR08MB3877.eurprd08.prod.outlook.com (2603:10a6:20b:88::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Tue, 12 May
 2020 16:34:16 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::a) by AM0PR02CA0017.outlook.office365.com
 (2603:10a6:208:3e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34 via Frontend
 Transport; Tue, 12 May 2020 16:34:16 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 16:34:15 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Tue, 12 May 2020 16:34:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ac671881a2a0174
X-CR-MTA-TID: 64aa7808
Received: from 38da4d6c57f6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F60A9270-71AE-493C-BF17-6616E699A87E.1;
	Tue, 12 May 2020 16:34:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38da4d6c57f6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 16:34:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY3kTzMqgCspJgYEefFDplxf22C3m2mK6yn+3K8WURx9NuSHIor25Ha+eHs0sNI4Mj/gDCd8ncsi5CzdhHFuIiFQSrjfcCPhcuFC6jwHj/Q/uw43mQLiViPtNuGt1SFRfBhteu+JTL8s3v4gZmd8b16S41rg32c5KsBXd4607osRX8308TB4AhI7tI4OQ7Ev/SWGc66TUjp/jgEpRfCL2iAgdWNTV0ebWxcSKIXxWYpDgEu23FkviMYoZTpldic1s5SA4jynqvR0XgHEQtZPIIxb5dWVvN3OBCe8uMDT14gRcFfvJrMqv+PfFn5HL4nMUn498Eq4JfD90wt5e8prgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRQR7oaLiYvKs8Wd/M4PE25GODl3hRs0KVTno+plu+A=;
 b=UFuOE7Lav8knTMWVAFum6ky0kNPBSfRvLFL4SMzspBNkKSBWLcICyFy/cAA9qVee2CnNiqu/UZBnVOYKeFyIPC+PxcO06vioNuqXFzFdmgYEj+F+0PO8Zwdxdx8xK8wl7eiZz4V4Vf0oxFLWY12jdPnppnx2p4zdILH3bU+ojNAxiJ0DCFFVDOfw1mqfD9weHAItjHpu2vl8r5O/BgTi+GyqWd38p+oS2bdy/s9Hp1ofoX8jos2597/b/wEkUC8aLJ5pN5Gx94p3ZuG/obQ/DFUIDkHLhRo5xboV7+imj7wLGr2EQ+vNgWtjWOkKQAyqmZDvX6oAwe7LL+xca7UWKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRQR7oaLiYvKs8Wd/M4PE25GODl3hRs0KVTno+plu+A=;
 b=wvUL8blI/GGwDKbU0kj1Vz9OE6P0dd7jNjDWSzM1kmLPDTk8sLWM1qdF4wTZrIcnay4xWfMFxiASUHMz6/H9jLyxX27LVrewyV+jNfV1+YsyawqSxiDWZd0BeY0aE12q6MCF3B6uCG8YpDXJNX1e5dVhR1H+lgBUck7Mg6adZFA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3819.eurprd08.prod.outlook.com (2603:10a6:10:30::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 16:34:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 16:34:08 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Switch to gem5 20.0 staging version
Date: Tue, 12 May 2020 17:33:54 +0100
Message-Id: <20200512163354.38571-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::23) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 16:34:08 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fec997ff-6d0b-41aa-cfb1-08d7f6924f9e
X-MS-TrafficTypeDiagnostic: DB7PR08MB3819:|AM6PR08MB3877:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB387796B2F9FB7EFB100CF4E19DBE0@AM6PR08MB3877.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QAcHO53rT53sAX3QNDO+gRsXSgc+XZmX/m/OnQt5e+JrrYPePfwQyaKnYdAtyVBXbLyMUtwnjoOeD28ga696NymZO5qVRTKkflVnL7cqCpJKTbix9QlynrKS2jpSdjLZoV0Im7ARZVbNGcAbJlVfPnZ/FgSNrS+L3VKUN2qfe/gh+YyuMPVuEpivBGGJSZtVGcxpfocl+KLjiwPDmcFGR4xBZysuopXEdoIaoKufbiBEP8g7roboa48Y/j6NrF/UEbpl2M+6r3k+E+kWEneVsbOpshZhv/FDsriNrQlbM3BRZrmXBcV2cmlhLcIR47JIOJjFviWbk7Vm3BkN0mhgnjP+fsj4cTyUJKs2R9b0GJPAd8biyKkVSW0VEw+cKRPSYpmD2BxV/p7eRTocM+ceZtlJjhmHYyMgmQUfahsZ6lUzb93L4k7WpGLwipSeSB4CXrujSxwMB4e9woXnZWQaEmhOuX7ReW9a0J/YR0U2bBS4983zV0IQzUcqhKtH+GqJHdlpL79V07ZLU6tccM1ePQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(33430700001)(33440700001)(2906002)(1076003)(5660300002)(44832011)(6916009)(16526019)(66556008)(36756003)(52116002)(7696005)(26005)(6486002)(8676002)(186003)(8936002)(86362001)(2616005)(66476007)(66946007)(4326008)(6666004)(316002)(956004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 RqeeLEIX9N7JF86PJxsGnnv2qUdQcrrIlj2d+8FTb3UeRsOEuPPoQDSjLah6YQPP5u+6RYcipznVDb2IIhbUpmLmUUChjhe80njVtv5NzYojw0SENEPgMeHBpQzkAP0DtPBO+TzatE3OmmH6yazesGSlaChPc3ltuaUryWhvg7ak0qL/PLO4rZDCMZEhus7Vz4Cj19br2PyYvOlfx40XUCQ3aXoBvl6fz2B/rz0Mb3Yl3iYOAvpsTCeuxdGp8PidV1rCjGMKhP8Yugjw9i3MCaNuyctFV2BrK1/ZdTT3qyE+LQvcPrS37Bc0cVBKA8Y45tOUV/DgH3ysE1zpxzWDrw40XiUKaSwupxIvABqN6KfrEpwK9g3nu5Dr7Z0MjSphthmHLYSKc42Gb2qf3iAl3kBdXpxPbF5ij7taUu3ZW3xM30IFLl2gHeG7U+kb5gORPTNB5jOBhheMndWOKbM4CZLKrmv6rC8+aK6tJaX20Wg=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3819
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(46966005)(33430700001)(44832011)(6486002)(7696005)(6666004)(2616005)(316002)(336012)(36906005)(8676002)(186003)(26005)(16526019)(86362001)(2906002)(956004)(82310400002)(5660300002)(8936002)(4326008)(70206006)(36756003)(81166007)(33440700001)(356005)(70586007)(6916009)(47076004)(478600001)(82740400003)(1076003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0e1cdccf-ebf8-447e-c5ad-08d7f6924b11
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y4nfN3behBQWIjZ+fNwzG2F0aiXuNR+fV79tq9XhkdqdZNRY0RCdcRIbhQ0xg9y/5LovAhWE/kWzM6DWI9iBXErnS8zWKiGrMXACfn9nzvJEa/7o+0JvlKbpaVKI0fFRBb8fd5UX8JsSOifLYWLwKltjIuAye6ayvqlO5RE/m+UP38Z7MPTZYFk0uBF5IuclkK3+65o5CEkWi/ZMz/lERwv2Cqh2mUquMNdwd31bxt49s0tSWSskFcenk9Pv9DYZFHrjr6cLL6HKK9sLt1oa7abUiQMqzJ/F1puz1j4faFHj5Df9R+NtQhDEQqwk79goBU6tTmha7buxUeZ+CiaOPeHsdFQPXRURNxctLmiUfd+AeMPGgW00xNWg5Cto2nzK1nQima2OB8uOmJu7MXH5sjU3myjTeOlySgrVjFL82YqR+P2opVzLfuBTicmoAErBWZ1HDjBxBNebCtUL29l4CXtJze92M8HPnebu3MZZdaCV2rp1W3lD6NYlf8+oV5aqQzdyVSIKwy5+b0WwzYIQEfkczBiEXhkURwYmKavuZ/u4IdOZHzeLycG4Gunuo4S/Vs+SEXxPK4PRTHK174MuFg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 16:34:15.7100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fec997ff-6d0b-41aa-cfb1-08d7f6924f9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3877
Content-Type: text/plain

Switch gem5 to use current HEAD version of the staging 20.0 branch to
solve compilation issues related to the move to python3

Create a link named python to python3 as some of gem5 python scripts
are looking for python and are compatible with both python2 and
python3.

Change-Id: I59256a8a6783a9614f5a2d5d760fada5bd6d0337
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../gem5/gem5-aarch64-bootloader_git.bb            |  8 ++++----
 .../gem5/gem5-aarch64-native_git.bb                | 14 ++++++++++----
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
index 68f3648..a3ab5aa 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
@@ -3,15 +3,15 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
-# The recipe is currently using a version in the development branch of gem5
-# until version 20 with python3 support is released
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
+# The recipe is currently using a version in the release staging branch of gem5
+# until version 20 is released
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
 
 PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
+SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
 
 BPN = "gem5-aarch64-bootloader"
 
diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
index c42c82f..d36f24f 100644
--- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
+++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
@@ -3,18 +3,24 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
                     file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
 
-# The recipe is currently using a version in the development branch of gem5
-# until version 20 with python3 support is released
-SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
+# The recipe is currently using a version in the release staging branch of gem5
+# until version 20 is released
+SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=release-staging-v20.0.0.0"
 
 PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
+SRCREV = "0bc5d77ed27e0765953d93c2376a4b4aea675a01"
 
 BPN = "gem5-aarch64-native"
 
 require gem5-aarch64-native.inc
 require gem5-native.inc
 
+do_compile_prepend() {
+    # Gem5 expect to have python in the path (can be python2 or 3)
+    # Create a link named python to python3
+    real=$(which ${PYTHON})
+    ln -snf $real $(dirname $real)/python
+}
-- 
2.17.1

