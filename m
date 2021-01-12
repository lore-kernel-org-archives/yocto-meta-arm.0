Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web10.10316.1610464876330281366
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qAxB8AS7;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3v33LQVgXksw92HBvIw59aY+ujJnI1ePGvRhm8a9To=;
 b=qAxB8AS7NFnpY3987l+85oeEk1kCz/d9xBAjlHKdOP9GauX2eOn/COm4vAfUzz6xys1k7piphyhvTTI5bQkDLbZUu8Qu51czriqLWjUvxw+ca215enfLNKVkHUtRbShNJ0AwfBuqk7yNbmbvAdmSDoZmM7qGfW6+w3wQ/2gr2GI=
Received: from AS8PR04CA0248.eurprd04.prod.outlook.com (2603:10a6:20b:330::13)
 by AM4PR0802MB2275.eurprd08.prod.outlook.com (2603:10a6:200:63::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Tue, 12 Jan
 2021 15:21:14 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::b8) by AS8PR04CA0248.outlook.office365.com
 (2603:10a6:20b:330::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:13 +0000
Received: ("Tessian outbound 8418c949a3fa:v71"); Tue, 12 Jan 2021 15:21:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7acc00baca0b5d7f
X-CR-MTA-TID: 64aa7808
Received: from 8468bd697d5d.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5128DC70-9B95-409B-A0AC-3CE87D33484C.1;
	Tue, 12 Jan 2021 15:21:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8468bd697d5d.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpvzngN2ay7ZicROfJ8RdixB7QrOSjN+FIsfCGCP+O58VhevmUNXQ6lp0bLjrxZNEyPzby5pWf5dEm+7OiPsWbDK86DWl9qoDPMsbmfjzbt6SAkTMggsCiESXT8L1YYbLoFYqPsTdZJdrxr9FXT7eYNdtP3bot1fIzf/tEs0b85sBkF8Wd3BJgIhkjLLeEm88qtnSqbBgVGWDo0uVvZt7JmAxZv7mq0UPDt0oV8u6dhYy4BmxhSs/zHp0LE5APKqaUGa8jrfTIQIFoL+3LZKKPP5zmhznH0Nq9lubybDs8lVg38jkyp0AEK1ad+W4dtZ0uyqDgVUNxR2dfUTVP9Lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3v33LQVgXksw92HBvIw59aY+ujJnI1ePGvRhm8a9To=;
 b=GRkcVPLe2fCGMyVvdgUw4AQchY1HZAfLi2uBww0/Ya/CaIT72j0bG+zWVj6mxdjz7FihBV14z/Yczuviy/o3s212S+TXbXvRV0Ey+Igax3J6Km0g97Xf2RMkx8Q9JDxlkw2lvHxm9Ofil3yMMdvpAD8ga2PRPfrkXuk6mkVeHWISrQdO21WXHwAvbXI5S7jvLHRAzl4T1euChs9qxYwbPBXjtjpgXnmaQ7waOxQfaV3bsu4ML3eoGRdXyUwPWPU0f2YWie3mvOG6QiHsL9jO1/fqHWtd6TySQyIRepwosU7HOY72Gm3+uNCahlun8NdQk8tS/qG/NPbgaAp7oFTqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3v33LQVgXksw92HBvIw59aY+ujJnI1ePGvRhm8a9To=;
 b=qAxB8AS7NFnpY3987l+85oeEk1kCz/d9xBAjlHKdOP9GauX2eOn/COm4vAfUzz6xys1k7piphyhvTTI5bQkDLbZUu8Qu51czriqLWjUvxw+ca215enfLNKVkHUtRbShNJ0AwfBuqk7yNbmbvAdmSDoZmM7qGfW6+w3wQ/2gr2GI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3053.eurprd08.prod.outlook.com (2603:10a6:803:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 15:21:06 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:06 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 10/10] arm-bsp/tc0: Enable spmd and SEL2 SPMC with optee as SEL1 SP
Date: Tue, 12 Jan 2021 15:20:49 +0000
Message-ID: <20210112152049.3436645-10-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a07faa13-359d-4528-6967-08d8b70db2cc
X-MS-TrafficTypeDiagnostic: VI1PR08MB3053:|AM4PR0802MB2275:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB22751F76D91ACE6BEBCECE36FBAA0@AM4PR0802MB2275.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: GCh8RhgH8b+Lq/aUuv2iPKpmWyEfWn+Pj0IPjXiV6sA1Yo3KN7KFSL0YnsOCKie3wDXZQZfmjRWFe11gCwA7v/2e03XnPALStWSQq05uH7gKwOKvNKLzZHT1LHRkVTpW4IRzeD7W7gS/D8xzAOCB275t232Rt0cRv+KLwR97pDXwbI+DbcweWsr9dHISAFkH9STGlX0UJAW4YFORgtu+M9e3oIv7EBQBuLp4SvB6pgTFApEIfoZNp0LQEVLSrVFguqLriFx1J2rHCFxvKDq1mHEqHqsefOeyjSmOojT11DBi0gAnhLSBE323kHAr20Ox1rSA/oKGIPHtxt0uH6U5rwNJXbTeHT7tMEAawzVKxsdamcab8NzVGhyqdAIebWqVikPtf0UZlDyyJOipJVkbkA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(66946007)(1076003)(36756003)(6666004)(16526019)(66476007)(83380400001)(44832011)(186003)(5660300002)(8676002)(4326008)(7696005)(52116002)(2906002)(66556008)(8936002)(2616005)(956004)(6486002)(26005)(6916009)(478600001)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kgS9i0KBgDfgrEWXRH3FtDDuLRjEL/h6Zg9jJVQYaeAcyCr3Gvej2u9CrtWN?=
 =?us-ascii?Q?BTgt0f80l+cFepSOaxFwH28IBKd3ZWTry/Zz6hvM/nAGerinmVqZUH4vlt9F?=
 =?us-ascii?Q?jrEPca0hyqYInBtpa3TyJHrRDzhLWwYIm5RgGakH2mIEmOClZRc5h+PF8lYj?=
 =?us-ascii?Q?uJxnP5JDUz0W+uKGCRHfTFAB5/RI+quQzlZyUPjb4kKrNp3OczFekTJ7aqqy?=
 =?us-ascii?Q?qLEK99YvcT4kfiCQEXeYc+3NeNNDSuJ6vDytQv+t46V+VrQPcUpDzVJ7UaFv?=
 =?us-ascii?Q?Ry/iUnHp/v0s68deH/cfaf0AC9XM7TXh12n0TzeF/a9SpzQLgqSn0/oD7O7n?=
 =?us-ascii?Q?P78v1WHt0raMOW96M/gmzEKgzQVS7dJikfXVQWpkIrupe6rDIuxmZ5/rDJfM?=
 =?us-ascii?Q?FbSnwLS7B06yHT7z20bteVzZgQmapX0Sxw0brz6DXQwihbHZcdhGcSfNxc5T?=
 =?us-ascii?Q?1Htq9k9EnM/4wQ/c5w04OSbUI5Lo3ZzdR2OCILhRoGQ+K8Lf8JHh5x3mCOm7?=
 =?us-ascii?Q?5RRZBsRcWx1COfmB2UtdiNdHNxgH3x9Y80G8RV8gWLxbUvnya2vah6Q6NADG?=
 =?us-ascii?Q?ceOYgmzZzOg8YxzPv0YdurNyZ9wjATCpGcUU6MP62lWr+qK9xIS+bElL5LjL?=
 =?us-ascii?Q?u0RjMOTJNxMHzotegibNJ8V6Xb23PSKMtDhpVbqguF7uokpo2ZvebviX7BZu?=
 =?us-ascii?Q?s1KfHe1WYTGYqsXqe4JEdLIgObDr4QLiweF9CCFRpReVI8kYu+flzqwVYph9?=
 =?us-ascii?Q?1RpeDgR4+NXmV7aFGBMOD2+Y9fizL9qW6XjB7aGGfbQIQXX78SKZYG7ZrqvZ?=
 =?us-ascii?Q?RssKRHsTirfWg5SRvJ2JxgeDDAwReGb+MIEAzECgF6WL0+I84jGloOkmSX+4?=
 =?us-ascii?Q?j9kwkv6KyVpk+N+VG4NT4phQo/TzlUcSVgf4hfdyEZ2NNgzjC15NFl9E4t8s?=
 =?us-ascii?Q?cuSE3/pQdVXS8wpMG2lcExsSgfNOpQRB38Lqb7QDiErgZjbHtOd92gD95CRM?=
 =?us-ascii?Q?Xvtf?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0c662fa8-c960-4eeb-f20b-08d8b70dae88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/dbcVLK4lo97/Tj0MGtkkSSaUGkV5tUxSoSIsDqdCpKoNScs74UX+g2d66XhKSn4jA6LJZ+8A5MztiZp5ESeZ58NDVPnoSFQdQUcM8B+8lrwlPHcA6af+DqD/emNugTyP/rmdpbuR/FNiDhW/LazvjFQmo4zOLVv6zjSXl5aoAURLs3qpxuUqRdwgklaEgE8G4WwvnjXChJJO/AVanMPz/xulFw3wktuqnoxQdaFZ/J7+i0M+R1R8iLRxrsL7ImOCo05ygJuWu9yzcTXW0v1H/sNhZlGIa2Tx186/g1mLzpsZgh14syeFBnjmAAOsu+EBjYtzacWcfGigm7KlQfxeRyWWC+uAoZj/hRIKAl98bVdo7+gNCmwqdroTB0fJ2xWtUdlQtFTjOMzSTeBd2pJHA8BDpMMLZ8f93JKLbhJaCiHcpEFrxFAd5+OhHmO7gUBct2XuWji8QcOoOVeo/WUyZcvZIKNA+ekODsgzW2So3RobbVJHJI3UcIeuGbegvST
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(46966006)(478600001)(70206006)(26005)(956004)(8676002)(316002)(82740400003)(2906002)(83380400001)(6666004)(81166007)(36756003)(70586007)(5660300002)(7696005)(16526019)(6916009)(86362001)(186003)(2616005)(6486002)(44832011)(34020700004)(82310400003)(47076005)(1076003)(8936002)(336012)(356005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:13.3834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a07faa13-359d-4528-6967-08d8b70db2cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2275
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

- Set SPD to spmd with SEL2 SPMC. Set optee as SP
- Assign SP layout and spmc manifest file that corresponds to optee
- Move TF-A version from 2.3 to 2.4

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I3da3bf7f95ba42716b731f92e2cdfb928b1ab77f
---
 meta-arm-bsp/conf/machine/tc0.conf            |  3 +--
 .../trusted-firmware-a-tc0.inc                | 19 +++++++++++++------
 .../trusted-firmware-a_2.3.bbappend           |  1 -
 .../trusted-firmware-a_2.4.bbappend           |  1 +
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine=
/tc0.conf
index 6c366da..eda3324 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -26,9 +26,8 @@ UBOOT_SIGN_KEYNAME =3D "dev_key"
 UBOOT_SIGN_KEYDIR =3D "${DEPLOY_DIR_IMAGE}/keys"
 FIT_GENERATE_KEYS =3D "1"
=20
-# Trusted firmware A v2.3
 PREFERRED_PROVIDER_virtual/trusted-firmware-a ?=3D "trusted-firmware-a"
-PREFERRED_VERSION_trusted-firmware-a ?=3D "2.3%"
+PREFERRED_VERSION_trusted-firmware-a ?=3D "2.4%"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-arm64-ack"
 PREFERRED_VERSION_linux-arm64-ack ?=3D "5.4"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-tc0.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-t=
c0.inc
index 8d98937..bb12ba4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.in=
c
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-tc0.in=
c
@@ -1,10 +1,8 @@
-# TCO specific TFA configuration
+# TC0 specific TFA configuration
=20
-# Intermediate SHA with 2.3 baseline version
-SRCREV_tfa =3D "16796a25fefc4ecf780211bf554d3b8dc5436fa4"
-
-# This is incorporated into the SRCREV above
-SRC_URI_remove =3D "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue.p=
atch"
+# Intermediate SHA with 2.4 baseline version, required for OP-TEE SP
+SRCREV_tfa =3D "b153ce0391012e9228b807815a65fa0dc514cf77"
+PV =3D "2.4+git${SRCPV}"
=20
 DEPENDS +=3D "scp-firmware"
=20
@@ -17,6 +15,15 @@ TFA_INSTALL_TARGET =3D "bl1 fip"
 TFA_MBEDTLS =3D "1"
 TFA_DEBUG =3D "1"
=20
+TFA_SPD =3D "spmd"
+TFA_SPMD_SPM_AT_SEL2 =3D "1"
+
+# Set optee as SP. Set spmc manifest and sp layout file to optee
+DEPENDS +=3D "optee-os"
+
+TFA_SP_LAYOUT_FILE =3D "${RECIPE_SYSROOT}/lib/firmware/sp_layout.json"
+TFA_ARM_SPMC_MANIFEST_DTS =3D "plat/arm/board/tc0/fdts/tc0_spmc_optee_sp_m=
anifest.dts"
+
 EXTRA_OEMAKE +=3D "SCP_BL2=3D${RECIPE_SYSROOT}/firmware/scp_ramfw.bin"
 EXTRA_OEMAKE +=3D "TRUSTED_BOARD_BOOT=3D1 GENERATE_COT=3D1 ARM_ROTPK_LOCAT=
ION=3Ddevel_rsa \
                      ROT_KEY=3Dplat/arm/board/common/rotpk/arm_rotprivk_rs=
a.pem"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.3.bbappend
index f1908f8..0535278 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb=
append
@@ -1,7 +1,6 @@
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
 MACHINE_TFA_REQUIRE_corstone500 =3D "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE_corstone700 =3D "trusted-firmware-a-corstone700.inc"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
_2.4.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_2.4.bbappend
index 944dd7a..8087f39 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.4.bb=
append
@@ -4,5 +4,6 @@ MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
=20
 require ${MACHINE_TFA_REQUIRE}
--=20
2.29.2

