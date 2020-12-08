Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web11.8736.1607436361336775127
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 06:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mda7WGLO;
 spf=pass (domain: arm.com, ip: 40.107.20.81, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHZ2zp6Z7/TFYsOHVwZeQho5qAmb3xXurrNv4S8L2VE=;
 b=mda7WGLOy4H0uDSHmMAm4bN0bkUtwSL9jA88YXNcnmg3lP71tjVirRVzMgRZC2UZ+SVTp/Qys1JqsvpXTfWMOwsdxwA5RUobL7grWZbNGt8zmaytul5pR54l/sC1rV/DDBhhOHGehVTr7WlkE/kUotdZuyvGmjZ/BHhGrLnYkIg=
Received: from AS8PR04CA0006.eurprd04.prod.outlook.com (2603:10a6:20b:310::11)
 by HE1PR0801MB2075.eurprd08.prod.outlook.com (2603:10a6:3:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 14:05:58 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::16) by AS8PR04CA0006.outlook.office365.com
 (2603:10a6:20b:310::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 8 Dec 2020 14:05:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 14:05:57 +0000
Received: ("Tessian outbound eeda57fffe7b:v71"); Tue, 08 Dec 2020 14:05:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a05eadd995d4664
X-CR-MTA-TID: 64aa7808
Received: from 37689ef79b25.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6C071BE1-8962-4D5E-A256-01C038F6C8DB.1;
	Tue, 08 Dec 2020 14:05:37 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37689ef79b25.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Dec 2020 14:05:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2O0IAjI3aYnOBsBTqm9AELCJg4f4fMjqg6Mb5lzO+xSMRCXGlOviRQCNBuUMcK3MF6QAd/m+NYVlGJhs4Bb3a2iXRIRwtZuwJ0hJtvl+n/VzntZIrbXzpTdIZad8FjuZsfzBQTKoJz4+xRkO4WAGjjbvbDH7WTZMp57XcNRwzq7EuoI2GvewP42kiLZWXiAXWwOal41pTkj11//Kuj7FX/GU6D6hqeDMmL9oraYRBpvIcV1daTIhJeXhIt/3XokNc5pArQ7pQj/JFarw4vCa8JMEscabfHfsTo7OwIAgqo5FI8LHHgvG+QzxHsG75y8pY8Jl1syp7mtaxtqN3mL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHZ2zp6Z7/TFYsOHVwZeQho5qAmb3xXurrNv4S8L2VE=;
 b=EAcUfwQCzZhRAMKt63khYWcB9739U7/KSdE+zQovfFwbySO4wyZRN3e3EQ19DVF0dbl14dW36ayqwWM1UXijvtW/gNFcvR5uH6GJCqIUlb2zV0iJlgq0+vIOZGJ3YaG34ZfIGc1aEqWWDC7c71duh67zS5Wb3M7b/sAsvEU3p9cZIP9vjo8PcCU4cTOoq8AcELZyV2vtHaPIJgvOOB92ocpH/bAp54O2tUYZDEz7hCyxkNITAc2bhTsa7QUW+eExhg9xDNnX/2n+9LCSiL6C/KRNluy1AD2TWtsUdmMRDcXxnJliTvcKkqhBtRbGMMYF2VXTMT4LDhNmca0eWUqI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHZ2zp6Z7/TFYsOHVwZeQho5qAmb3xXurrNv4S8L2VE=;
 b=mda7WGLOy4H0uDSHmMAm4bN0bkUtwSL9jA88YXNcnmg3lP71tjVirRVzMgRZC2UZ+SVTp/Qys1JqsvpXTfWMOwsdxwA5RUobL7grWZbNGt8zmaytul5pR54l/sC1rV/DDBhhOHGehVTr7WlkE/kUotdZuyvGmjZ/BHhGrLnYkIg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6135.eurprd08.prod.outlook.com (2603:10a6:20b:29f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 14:05:36 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 14:05:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy/modutils-initscripts: Revert fix modules.dep update
Date: Tue,  8 Dec 2020 14:05:29 +0000
Message-Id: <2584bb9172dd000f8162f27be6a90c9f2a5147e2.1607436255.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0190.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::34) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0190.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 14:05:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c9569a9f-5913-42bf-025c-08d89b8262f2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6135:|HE1PR0801MB2075:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB2075FC17E7C5EE83DAAECC9A92CD0@HE1PR0801MB2075.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 r+r6o+3DFRA4871VuTUeFpVmRfz+Ncnd0P74RZkCnNW6j/0olSatjW3cYjfmJ92Xl15EuW1+l5wrdJTIzo2ETlel51nUt1IDRaGdipsbxGl415oS0pjivyv5lheKf+741YOLprlqdMK4l/o57xivMpsQDtb0awrh6NFlEQFlq7x794Wq6mDDAFowlCwbiR1e7Dp+c/IlmbPiLgqyeSNl026Ho0OqZ3novfDSW+7OrFIAvrjxzfi+YzsXRUQlPnjnXeEbrnHMPK/DqfYrO8cr1j9Zeuyxl4YI+g7DNCCyKd+q6J9gdXaot/PrRNvoChgQUPh6Bzh//TDLGKQkcNB7mTQNJni7lr3LS4ESEm3OvNaNx2w/uI8wleZidrEhJDrZ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(4326008)(2906002)(34490700003)(86362001)(2616005)(5660300002)(6486002)(956004)(52116002)(186003)(66946007)(66476007)(66556008)(7696005)(83380400001)(8676002)(26005)(6666004)(508600001)(6916009)(16526019)(44832011)(36756003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?baoLjEKA/NP+PzJb3gZ/30cIzb4i9NcstVtQqBS58J4ejshWpLxTbH+uYZ52?=
 =?us-ascii?Q?RjcOFb2F/AnUM8xRYPC39InVpG1p35WVF8mxKsTyja5EUwPojkPqd00ttGKQ?=
 =?us-ascii?Q?Cr5oYKaoMTVgF4juIT3WFGmI067ba4EfFw2CnK+DOrkTIr80mWiMyEJQmGDB?=
 =?us-ascii?Q?leJFQjWCJuUcX9WMmIPA3g28DkPvrjaOccP89MBcX91Y7QI2k9VGu/QOXqta?=
 =?us-ascii?Q?zBuOtG7qO1Wv///CWadyDmtTWEuDik1ZU42Med0GBQfzI2KeGcD/UZu7h6up?=
 =?us-ascii?Q?v+EJAL3cCoFwnAhMNz4o7YIBVPEhx48vwDhmRvlWjxNCofPtK2eWqB3sEc84?=
 =?us-ascii?Q?CANSqpupZoQssXRDMzMSUq9QFt7d0ExpFFX5J3OhF/qTQ+Do5h8fSaVso8xM?=
 =?us-ascii?Q?F0CjzfKCognsxyCh7a8Zr2MiDI6MANMNeWeQTp72CjVSaWghWNb6juL752ZF?=
 =?us-ascii?Q?WWiqz1ukyHwBRKdM/uD0u9tZlwDHycgosllTJujWsjLwOLelLCZ3kuk+6vrE?=
 =?us-ascii?Q?ex2K4VlDD/V+9PlS/ss0j1KVZ2RuoKeKPdBwtIYXbNMLQ9vx2zQSCUjsSjoN?=
 =?us-ascii?Q?U9BfB1WfmxbXmKi0ZfbDCH6MW5efY6C7GAOuFE4IO8UQ1mRQdA0XqWFL85Ju?=
 =?us-ascii?Q?MwOSs+jYtlSyiYyF2tjjKLqwU/ZXMAP2D8uoyX7VRvP7MveSz/XH4+rNlPCL?=
 =?us-ascii?Q?wZCkPBtGMimRYMKrE4dHfI+xEP/NS0lbxtTUBVxPQva7bDXgtL0Rf1puAlpi?=
 =?us-ascii?Q?rsCFP7jvs0H+374pDTgxPraV5d1GECb70a6wT1X9wGTOL8TKbgSwfvCRei7K?=
 =?us-ascii?Q?zXRvQcOdMV/L29c2tlEaLeFE7iOfNmn95FmLEWgv0nQ9k6QbpHgp+jOYrHxY?=
 =?us-ascii?Q?qzX74lE7yBaxxWkXVbtUBjSJRj4QWzvpizjQjffALiqaWsgYhMcnYBI4DDCW?=
 =?us-ascii?Q?iC2zwiKQ+gXE7KI8yviQhTqCd15O/grSb3Q4FIfBlXQNr1kdvesFDY/mHVXe?=
 =?us-ascii?Q?7lb7?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ec2c7e45-21a9-4082-e99e-08d89b825656
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MXYFmXEsQZAXLDYm+8/eAgI5CfAjUe69+uM8Sz8oZ+gAd2WBEo57wMugpb4wkGobLIy8BzcsRqYRHYaa+H9VZbmX4u/9MuGQl6e9VEtCjvLUVewOuEzOBN0epsoextSVwkW1fNlsogosGZ21tnvaD3ljnGKmWfOKFvdoma8ase0UTyYRTIVqKywPJvzSyS6TAANMNIcDUsuxuS6uKF7p3u9O44RgsReYXtZIH7IgKuIJF7b9MTnaq3zSW7akJe7ilMseqFdABFPpWPylE/gJD+0gYJs5Pf5fU/qDMAbLr1DRIbfXhvgUeJm3K1+FvtfB3wJSFl4TjujK+t04yPiGDGCxBx/6MqbfYQ/9qQE/nO5NyBm9aur0iDNfrWv1PEsnBcgigzSOhsPq/B8lsUIWUA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(46966005)(26005)(8676002)(8936002)(508600001)(5660300002)(6916009)(186003)(7696005)(356005)(16526019)(81166007)(36756003)(83380400001)(336012)(82310400003)(2906002)(6486002)(44832011)(2616005)(956004)(47076004)(4326008)(70586007)(86362001)(6666004)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 14:05:57.9517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9569a9f-5913-42bf-025c-08d89b8262f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2075
Content-Type: text/plain

This reverts commit 9872afc6c7de4f2d83a11ab4cf57593b0b02661d.

The fix was merged in oe-core as: 572f3045faa0a937947fbd56bcfef7bad55e9da6

Change-Id: Ib9531c1d18ac743c063afe66de18015472cdbb3d
Issue-Id: SCM-1520
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../modutils-initscripts.bbappend             |  4 ---
 .../fix-modules-dep-creation.patch            | 33 -------------------
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch

diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
index 6cd3e17..2a2fd20 100644
--- a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
+++ b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
@@ -1,6 +1,2 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI_append = " file://fix-modules-dep-creation.patch"
-
 # We want to have modutils.sh running after checkroot.sh (05)
 INITSCRIPT_PARAMS = "start 06 S ."
diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
deleted file mode 100644
index c9a7c1f..0000000
--- a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts/fix-modules-dep-creation.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-When building an image with USE_DEPMOD="0" we expect that on the first boot the
-modutils.sh initscript to create the modules.dep file if it is empty or not
-present.
-
-Upstream-Status: Pending
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
-
-diff --git a/modutils.sh b/modutils.sh
-index a78adf5729..4afd12a9fe 100755
---- a/modutils.sh
-+++ b/modutils.sh
-@@ -13,14 +13,17 @@
- 
- LOAD_MODULE=modprobe
- [ -f /proc/modules ] || exit 0
--[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
--[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
- 
--if [ ! -f /lib/modules/`uname -r`/modules.dep ]; then
-+# Test if modules.dep exists and has a size greater than zero
-+if [ ! -s /lib/modules/`uname -r`/modules.dep ]; then
- 	[ "$VERBOSE" != no ] && echo "Calculating module dependencies ..."
--	depmod -Ae
-+	depmod -ae
- fi
- 
-+[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
-+[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
-+
-+
- loaded_modules=" "
- 
- process_file() {
-- 
2.17.1

