Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.58])
 by mx.groups.io with SMTP id smtpd.web11.18472.1592835394199750853
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 07:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qdz1F/d7;
 spf=pass (domain: arm.com, ip: 40.107.20.58, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKZMNkODlZ0/Hg/vALgNTOnAGhDQXu2R1a3rLixEllI=;
 b=qdz1F/d70rWj6/M0X/blfwBBOx4ya89PnPLqCq3c/7HlnSTAY1lljuyFvbHOciHUSK5Sfyf4zruqq0XXF7+3e7S+pt6EnBv9By68rQXJ3D/ZiuNqNGvcHljEIwYEhUuydO/mdrfdETv7XL4jZmgsRCLDyi4mMQxS3iNy5Cb5HD0=
Received: from AM6PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:20b:b2::21)
 by AM5PR0802MB2481.eurprd08.prod.outlook.com (2603:10a6:203:a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 14:16:31 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::53) by AM6PR08CA0009.outlook.office365.com
 (2603:10a6:20b:b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Mon, 22 Jun 2020 14:16:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 14:16:31 +0000
Received: ("Tessian outbound 022d32fb9a40:v59"); Mon, 22 Jun 2020 14:16:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97fa3e8a1ebe2a3b
X-CR-MTA-TID: 64aa7808
Received: from 2df3be9a107f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A3AD9F3B-D935-4129-A54C-B2C5435F8069.1;
	Mon, 22 Jun 2020 14:16:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2df3be9a107f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 14:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsdPLZ8ECsfSj3ot3x9tOgKRCF80RHJ7MJcWCPqKBzqFPWkKQMKKHPbGKKLyjx6Rm8vryvWAgwjTlv1q7eEQ5iBFZNJDLH1pClvezmF2thzDGn2NphOSMysPdjXXBvl8PzNixyQU2+9t8fWmriPHVt+oBuS1klNCFYESbz3z6ghzJAmUk3goqP3oVs0l3BBZAeGVPLNbYdPjMma3Z2/EgvNONCEKOLPVfAV4F5/jmQF7lFEP1WQBVyBFSVhLIrJ9X2si1fJbbt0znf4sbQixLJoyJ7o4K+8/Qa3rNbo4fGXYSDeYb447mMTD/bXgZ4/nIf4e1bmgd4AeqPlOoFKdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKZMNkODlZ0/Hg/vALgNTOnAGhDQXu2R1a3rLixEllI=;
 b=eJNQrIrJsYyN18Tork4bJUkMA4ZEmKOwOxiGfaoTzDl4RvwULtzKxFG3BxgPY+jeJwXRlmy40G2/pT4Iyn5nYOYgD2Lr2c+KQfU7/yV2EqDkVNj/8AHMvGEyySWyR/2qT8ysXA98LZW1fAtlnzaIf8L5jUcYJMUeSmX0nDb90LMDBc9oBYKqqj039FLH5LTmLXa9EDNjpIB5q+P5UFDQqs4h6TzQvgvdrED/wFfWe0A9UYq7RbAE2ThAbk7B7+uU93UFnNqWRCKKD8lXgXtvfXVey2Bds+a04LCCRxL2A76CgKYybLCKV/+/o+7idDDvWr68cwTIV2NflPlLJhDQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKZMNkODlZ0/Hg/vALgNTOnAGhDQXu2R1a3rLixEllI=;
 b=qdz1F/d70rWj6/M0X/blfwBBOx4ya89PnPLqCq3c/7HlnSTAY1lljuyFvbHOciHUSK5Sfyf4zruqq0XXF7+3e7S+pt6EnBv9By68rQXJ3D/ZiuNqNGvcHljEIwYEhUuydO/mdrfdETv7XL4jZmgsRCLDyi4mMQxS3iNy5Cb5HD0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5116.eurprd08.prod.outlook.com (2603:10a6:10:e5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 14:16:23 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 14:16:23 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm/fiptool : provides fiptool for packaging
Date: Mon, 22 Jun 2020 19:46:12 +0530
Message-Id: <20200622141612.4814-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::24) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0132.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Mon, 22 Jun 2020 14:16:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95dd68e4-ded3-4e2e-4706-08d816b6dc73
X-MS-TrafficTypeDiagnostic: DB8PR08MB5116:|AM5PR0802MB2481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB24810FAAB37214B292E1D57CFA970@AM5PR0802MB2481.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:459;OLM:459;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xY+dJJMTtQLKl4nOxNVyQ8aav4qsb2uIrw0BGn5ryaQRy7Hyc0WcWjtO7BM4ZBddDju2KL01+SYqui5wLr2GfJUwrlK3P4iT0ucjM/+gr/V94wB/X8zE/VhyVCLm8SMLWoopssIaAFVosJCGbGEhIg+HppwrzpGje65xSKQ81gI/Frda3hYOF6Rhyz52zQINY3BxuVkQgt4vcVy6krzgfJyS+tu0PBPvNLTE0pNg7vcw1uxCjhrboi6oohQm9Rg3WiSO9afWbD9jTnEK7+ihVAZ7lhNXTt//9j634dzUtax0EpSQ3mU7W+dk0rkal1uwA9k1zqRyfFs0Lcwq063Rcw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(66476007)(66556008)(66946007)(26005)(1076003)(7696005)(8936002)(36756003)(6916009)(5660300002)(478600001)(52116002)(86362001)(2906002)(16526019)(186003)(6666004)(956004)(2616005)(316002)(8676002)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 nY3frKFgyemuLSMc5Q6Qfv+StLMAuCmpotU3CRzpkWc8f63pxjdLbGPgQwrc1i1L4Uca98GxuRbdw0lQTMP61O8PdaiopnLfVEypPGt1AbjOwTmplzBJ5ZILSOJBTvUNH2yVVVRc2nlYLKH/E9mlIM47a4F+uMqfluAdjb0AGRzKIUkGsTyf8Wu+7xZPlm+UqFHad4VhsjMTCRLOaSqvx9PJAj4i0gzqLlJd73W0+pVR3/7IttbyxphVWHEheAeCoFeFAu3kQy2mKQQGCFh4xo2ZZx0gqn181q51bFsI36f0DIMxsCbTblpgzfyNcLEi/FpD3GZ/5ZUVa/5BLfpxicTbOrPdS75F7iXoDwpF6o4i7pGai2cvXMQlU8bWbbUhuQ2W8wVul8aUj6qM4DNaDyeZIPEyTy0iseeFj1tSLa6IbntGyGUSlzLZMNPrKMGBqXEGzw0F4cXyZ83dadCAndoA02nO3iUUCKJsQvfYBNct/1eCNMNeQdVFrRBPwb88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5116
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966005)(82310400002)(316002)(36906005)(70586007)(81166007)(478600001)(47076004)(356005)(6666004)(70206006)(86362001)(5660300002)(1076003)(16526019)(6486002)(2906002)(186003)(7696005)(6916009)(4326008)(956004)(82740400003)(336012)(8676002)(8936002)(26005)(36756003)(2616005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	49b78155-bd34-4d03-37c0-08d816b6d7b1
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O+ZZyuhAlrorKhOflma9EwI9ZCW6S/+UM2oQclhSjh0pQ+qgoRdDNWzOfsaFVVqXwiwQxAJqBO5dpkv2c0pPd1QevhjMIXJN2+yiJZ/nUmlZRtOlYlFLueAVO53C2QtWSneeQ9siR0fjbBejfRl3o5yOXudXDONBX63KyarlrD3PorznA4dA68Vwili++q8ZxENOqtSJjCYsSMAisCTWpeWLaYV2Vt+orKym5QUQpFBueScYcTjkXmAfHpq6f7HnMc7TPCn5TCj6wZUZ5z3wX5Ai2HErwUutB1h26XIz8aFWyDqPXhzDgffd2lzwxyL5GbXM4Ho6BEaH5matRSTzVsiTvzM9DYQh+O5gafXr1Mg8Iw4AeZZOQphTVaVs976Xcwu3p4mG4COnbXl1AjYrFg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 14:16:31.0157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95dd68e4-ded3-4e2e-4706-08d816b6dc73
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2481
Content-Type: text/plain

Firmware Image Package (FIP), is a packaging format used
by TF-A to package the firmware images in a single binary,
this tool is used to package the binaries in FIP format.

Change-Id: Ie4108915c5d63be340d6f53148a6dff03d6d48e7
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../fiptool/fiptool-native_2.3.bb             | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb

diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
new file mode 100644
index 0000000..25ca111
--- /dev/null
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.3.bb
@@ -0,0 +1,29 @@
+# Firmware Image Package (FIP)
+# It is a packaging format used by TF-A to package the
+# firmware images in a single binary.
+
+DESCRIPTION = "fiptool - Trusted Firmware tool for packaging"
+LICENSE = "BSD-3-Clause"
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;destsuffix=fiptool-${PV};protocol=https;"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+# Use fiptool from TF-A v2.3
+SRCREV = "ecd27ad85f1eba29f6bf92c39dc002c85b07dad5"
+
+DEPENDS += "openssl-native"
+
+inherit native
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

