Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.47])
 by mx.groups.io with SMTP id smtpd.web11.10407.1610464872508785576
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=78KeFGL0;
 spf=pass (domain: arm.com, ip: 40.107.22.47, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYgKTBkOjJyJFw2S8lct0CQkbSRP9/76tQsRawSfkgE=;
 b=78KeFGL0JcAFwNRgZjOkXmpHHKEbqfGRP7AuShZheql7xBi5z2t6lI10t8OxRK2eJKMkfr88o8NXq1R8DGQoqJMzqXmzfnAx4Jin9fWbq6iFruTw/XdBtNgo6zC+mSkgSNzgSlGd9abRCh4bLEkaUu0dKbnqLPj1YhVKkF8Xipw=
Received: from DB8PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:110::40)
 by HE1PR0802MB2377.eurprd08.prod.outlook.com (2603:10a6:3:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 15:21:09 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::25) by DB8PR04CA0030.outlook.office365.com
 (2603:10a6:10:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:09 +0000
Received: ("Tessian outbound 587c3d093005:v71"); Tue, 12 Jan 2021 15:21:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e35d610958d82c0
X-CR-MTA-TID: 64aa7808
Received: from 1085d4e5d598.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 86CF0DEA-EF8C-48E7-9B05-F2EDDFF39FA2.1;
	Tue, 12 Jan 2021 15:21:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1085d4e5d598.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STu8f8+N3y+HAdROvwbS7FHA9Td0Hhxu9vGue0PiO4szVa732kSW5pveosNPMRRUbWmKDcXHU6TTrnaGijLZDX7t5zHen+jJl3O/bquGloJ4Al/n6DgAr8Soc2rFKXK9sOTvtSACpi7gq6oumlwz5sl/fW0RYqPUSCAm+miqv/42rY7WGF+IHtKLwgRlbRAhw3GFTFSXb0dgGmc2iS2VAp4Jh6yjpiIPgAKdDw2Chuc4953e3A6fh76gVWgZsGTdeW5lwdiHKGb6j6VS5aCoVToC/iNVxpqp61MSwk5b7MiekB6tzgw6Ny3JMuvuJnvkY9l91tKnbtrAYPdZ+YkNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYgKTBkOjJyJFw2S8lct0CQkbSRP9/76tQsRawSfkgE=;
 b=feAe0EmCQkmth75bTgNR1/iPhH+Vb9cTlr0eaY4SE3oDPBhskKQE75H5Jn5GOqHu2O9VBjlrteMOnE3vQJUsl45opUK5IHbrth6lMi6052MVQAm6tB9r3joev9knKJUCi9aXho8aIakQ9Fc/veEg+B4zWj0FdfnP9dNQcKs3TLguoInsC3CabKdtuloMdsL8fwgQuCQQj+S0FUKzjpHfO2MDYuW3C8xewbUKb/GX3wyaICLWPbZqBVqOf1yea0I7tBDtJrfue83GsQbZ+RzqPtcvskSuhg//hXTkGzDpw2KmJcaDgAmUBB40V4AlotQ4dh5x0xhCITUnyNwI9QNP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYgKTBkOjJyJFw2S8lct0CQkbSRP9/76tQsRawSfkgE=;
 b=78KeFGL0JcAFwNRgZjOkXmpHHKEbqfGRP7AuShZheql7xBi5z2t6lI10t8OxRK2eJKMkfr88o8NXq1R8DGQoqJMzqXmzfnAx4Jin9fWbq6iFruTw/XdBtNgo6zC+mSkgSNzgSlGd9abRCh4bLEkaUu0dKbnqLPj1YhVKkF8Xipw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VE1PR08MB5133.eurprd08.prod.outlook.com (2603:10a6:803:109::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:01 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:01 +0000
From: arunachalam.ganapathy@arm.com
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 01/10] arm: Add hafnium support
Date: Tue, 12 Jan 2021 15:20:40 +0000
Message-ID: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c54496c7-83a6-4915-7b7a-08d8b70db063
X-MS-TrafficTypeDiagnostic: VE1PR08MB5133:|HE1PR0802MB2377:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB2377A9159CAA2007950A3BA4FBAA0@HE1PR0802MB2377.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: R1XEg+hfaZUut+5/dzvpauVw6eYmu8k8b+jepz/oDXqhCkknpGBBJmFwDtBURDIZGPEktst4G1dY3EYdI5xfel4KukP9q1t9GQHibJIjQ5v8rXbmDvnzVyqDs0+2QB69aNPna/5v89Z19iLGdAuRnF9SNytUZ7zKBr4b0BxjaDEtJ7+M4w7gu+3pY8lynDtU30NXn/BbHiBPmEfKtV+LSe+IU3/FArwJttHcMF785xXZXesoHhWOd8HqEk2yhddiNDgUyCyF0xK9f8Mk5Mn7l2UmGr9eLto6WI2l3Nmdh/IQYUJnWM8Q4vMOlnltqzFES7Ehl1ekc/GghCz+9aNE7FP2hXz3eUj2hihxnhduVxnflocj/+ZtYUQ7Je1qQgppfRgks07s6sd91nVOIKBoK7su7OflKQjlStHJFjxLXyLHmbMq4uMIy5nuWlkSz0YWCOlCYV+30sn2XlStMWUosw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(136003)(396003)(346002)(376002)(66946007)(5660300002)(66476007)(6486002)(1076003)(316002)(7696005)(6916009)(36756003)(66556008)(8936002)(8676002)(52116002)(186003)(26005)(16526019)(2906002)(44832011)(956004)(6666004)(2616005)(86362001)(966005)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hDgSBg2hWrJU370wUkGhrRDRyZViDcBwWMSvE6FQrVJHyBLsXEFooyas/CiJ?=
 =?us-ascii?Q?xGDxNZlgfR4Aart8LFnfpZg6xJh7dT9+DUuQeuYZLHn4Yx72DblfudjeI8HA?=
 =?us-ascii?Q?BjB1XGOIpqAI/JNnx+NtSBcPs9d//iqXg1mCHPHq35OYpGUu5U+f2w8hDdIe?=
 =?us-ascii?Q?u72SlD55W/T7qR66or3Kbqx2VZ8YkClQNKYabH4uWfdDvg9fmMCfQGZ3evO3?=
 =?us-ascii?Q?D7yV8MtQBVPXOPM+vJFZH5+/QczKH+mf/+SphY1mUmvE67Ju4wZEs2UR2k9t?=
 =?us-ascii?Q?OhPpFb6er+OXHR7EHLJUFUIutJ+wqmejE/Afji/+W+0SxokIqJMgLdEcEddR?=
 =?us-ascii?Q?Tk3OiVNY48mHadXl0u8a8tIRkPopdoxVvjeJyioo9h8oXB9aPk44ZqVsAfB/?=
 =?us-ascii?Q?QTGIleScMj26g1Gcd1IVvheX1HQbzPVUbwNRfZd33ppoh2PCv9ONPHt6TlPB?=
 =?us-ascii?Q?pgeiGAhZgiycQFyMG9HZV8WMOAUXb4GS7KPBpsUEJmcRBo15A89wO/o2g7aT?=
 =?us-ascii?Q?rLxR2ByFgEhfFlnLhl7bxXjTV4Cw9B17w9eSJ6pq+VKY4VR9cdNV2NAVNefC?=
 =?us-ascii?Q?UhtvmUAd4smVE8qzSi0qtHhKuM5eoiAI1o6JZsDHwOONeDQgp1hX25Eb75D2?=
 =?us-ascii?Q?8CgnBKN5Clxepuck/EV00Me5W4L0DYh/Cl1H1KUk5CxSLSMu+KkX/DRLGA5z?=
 =?us-ascii?Q?cg6ys3j+nGb7xGO2FGAjCjC6UVk1pX7BchSfTYVVdxTb41U5VQulCtGagIWx?=
 =?us-ascii?Q?czRIX6BENoD0bQXNCaydYAYbcfDTgAyx5orOGkUKb30TwlucI7CiyXLsJLsN?=
 =?us-ascii?Q?7VAJSOAM8pMBjgso3Nj6XbA7BbM8ec92QlNjGzksdAN6zD6nWHnKdohU9Zdz?=
 =?us-ascii?Q?HLow8kzgnXv1oS+cl/oW/qHWGfdvymA1b0XNpnpd21s0Gq633layb5Jozjeq?=
 =?us-ascii?Q?or7B4N1SfW1pHZ9OapsmW2OGbDLp6fnnrouaYg0DmabsKraG6uT7i672BJyA?=
 =?us-ascii?Q?1fS7?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5133
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	89c2cbc2-147b-4956-4ea2-08d8b70dab9a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rKhYqst1Bbgu++zIPhjWrprcAxpFAZuvx+uHcH+dpJXWq3+p77WSK2w38xQ2Pj9xkvKiwnWA/M92WZg4NJeBbPoYC5XyrpG5fR0mAvEN9f/oFT+NSa0lOs7Sxbv3aSZDNwE8RMokZqLdcSy9aUdNNd6LQEoK7oPSM4BwRaBt9mpPd6chw1RyUG2DSt/pkdKP6QB8lk51bYj/wuh2zOIFS5izihFq7p+xdxfkgoVykmKIZiU+SwzMnfDYJUVh87JA51kJ9IqSTk09U8GEzmF0qFiQbwew03P4mezmjY7gvlmWBfv9w021VILFI/h+nBdP6G+KTywbU0LbRy7yf/AEbOF+CpyhXl+fS8kzGU9Ji8H6+OCUtzxHRUjWM3ci7d6t0agOOux2OG9GwQydCsV/8SYvaxWmhwxC0O/OMxHJycp/qSs9I9vSS5HUHT1oxArpVzSyiTiza+YrciRPUgNZqnDlD5R3z583kwdhbRHOl5uB6T2d5i3GRdpmtDYw55OiDW42TSLfA8XnTpieAbl+bfYTD6YFQMllyz2RVkYbVuIuZjEJCsA7d/q4A1wnmV03
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(46966006)(186003)(316002)(6486002)(8936002)(16526019)(6666004)(1076003)(2616005)(956004)(44832011)(6916009)(2906002)(82740400003)(86362001)(7696005)(966005)(81166007)(5660300002)(356005)(47076005)(26005)(36756003)(4326008)(70206006)(336012)(70586007)(8676002)(82310400003)(478600001)(34020700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:09.4622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c54496c7-83a6-4915-7b7a-08d8b70db063
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2377
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Initial recipe for hafnium[1]. This enables build for reference Secure
Partition Manager (SPM) for systems that implement the Armv8.4-A
Secure-EL2 extension.

Link: [1] https://www.trustedfirmware.org/projects/hafnium/

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Ib256d8ca03c94131e308d962d786d5d6a656c256
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb | 74 +++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb b/meta-arm/recipes=
-bsp/hafnium/hafnium_2.4.bb
new file mode 100644
index 0000000..3a52599
--- /dev/null
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
@@ -0,0 +1,74 @@
+SUMMARY =3D "Hafnium"
+DESCRIPTION =3D "A reference Secure Partition Manager (SPM) for systems th=
at implement the Armv8.4-A Secure-EL2 extension"
+LICENSE =3D "BSD-3-Clause & GPLv2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5294672c500501edc10=
3"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+inherit deploy python3native
+
+SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=
=3Dhttps"
+SRCREV =3D "410a3acaf669c12d41fb4c57fcaf3ecee6fdba61"
+S =3D "${WORKDIR}/git"
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+# Default build 'reference'
+HAFNIUM_PROJECT ?=3D "reference"
+
+# Platform must be set for each machine
+HAFNIUM_PLATFORM ?=3D "invalid"
+
+# hafnium build directory
+# Append _clang as the build rule in hafnium adds this to the platform nam=
e.
+HAFNIUM_BUILD_DIR_PLAT =3D "out/${HAFNIUM_PROJECT}/${HAFNIUM_PLATFORM}_cla=
ng"
+
+# do_deploy will install everything listed in this variable. It is set by
+# default to hafnium
+HAFNIUM_INSTALL_TARGET ?=3D "hafnium"
+
+DEPENDS =3D "bison-native bc-native"
+
+# set project to build
+EXTRA_OEMAKE +=3D "PROJECT=3D${HAFNIUM_PROJECT}"
+
+do_compile_prepend() {
+    # Hafnium expects 'python'. Create symlink python to python3
+    real=3D$(which ${PYTHON})
+    ln -snf $real $(dirname $real)/python
+}
+
+do_install() {
+    install -d -m 755 ${D}/firmware
+    for bldfile in ${HAFNIUM_INSTALL_TARGET}; do
+        processed=3D"0"
+        if [ -f ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.bin ]; then
+            echo "Install $bldfile.bin"
+            install -m 0755 ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.bin \
+                ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.bin
+            ln -sf $bldfile-${HAFNIUM_PLATFORM}.bin ${D}/firmware/$bldfile=
.bin
+            processed=3D"1"
+        fi
+        if [ -f ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.elf ]; then
+            echo "Install $bldfile.elf"
+            install -m 0755 ${S}/${HAFNIUM_BUILD_DIR_PLAT}/$bldfile.elf \
+                ${D}/firmware/$bldfile-${HAFNIUM_PLATFORM}.elf
+            ln -sf $bldfile-${HAFNIUM_PLATFORM}.elf ${D}/firmware/$bldfile=
.elf
+            processed=3D"1"
+        fi
+        if [ "$processed" =3D "0" ]; then
+            bberror "Unsupported HAFNIUM_INSTALL_TARGET target $bldfile"
+            exit 1
+        fi
+    done
+}
+
+FILES_${PN} =3D "/firmware"
+SYSROOT_DIRS +=3D "/firmware"
+# skip QA tests: {'ldflags'}
+INSANE_SKIP_${PN} =3D "ldflags"
+
+do_deploy() {
+    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+}
+addtask deploy after do_install
--=20
2.29.2

