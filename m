Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.54])
 by mx.groups.io with SMTP id smtpd.web12.10428.1610464872548471301
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jFyTKTJy;
 spf=pass (domain: arm.com, ip: 40.107.6.54, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpB5n5h5tKvx0DsTrnMgerwwVaRFFGU2ERy1ABT5j9A=;
 b=jFyTKTJyazfNhf75pRxYQH5f3+eBh9M36F1xBxtXW8aIrdNxBmWFy6k+DHL93LVt1TiOUqgbu07p5R6z4xW2NqZYg4bXF/opVMlpW7n7B1Pfv0SZqKPjV044j30ewoMi4j3iHB58HO/IAi2yS3JsKqbhC7cdmls5vrWRDOE4YVg=
Received: from AS8PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:311::29)
 by AM6PR08MB3862.eurprd08.prod.outlook.com (2603:10a6:20b:8c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:10 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::d4) by AS8PR05CA0024.outlook.office365.com
 (2603:10a6:20b:311::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:09 +0000
Received: ("Tessian outbound 8418c949a3fa:v71"); Tue, 12 Jan 2021 15:21:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cbdd713aff5ecb4
X-CR-MTA-TID: 64aa7808
Received: from 2d8d19f0b71a.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 66C93721-4E17-41C8-BBEA-59CF561691DA.1;
	Tue, 12 Jan 2021 15:21:03 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d8d19f0b71a.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxjbnFDi4zcpg5nG/93lwVCqf0G1RKFvdwX99kuBa4RrjyAK4AL/HscQXoF87o93RhC9p/ObMtqGGqfINezNoWzc0fVgXDd7B/KK/7FBJi0iak165YKlDhW44XArCfuJJZgnnvPp3Rl1opykD9bH2m2wXxQ7+MW4V7vwSaWXA9Ekthiu9riTT0BMbmuEOc7BaBnV7+1wUQqspMRohUTrs+D71+iuNI+cYO7Un1V/NnccuXQlfbPFN9Vlm+RMD/wddxvqn74kaugwMyrbKjcYeZlD2ekusyU7jY6lsvM58VZUdkpVyMWehipCQssXSitASAHzNPj5syhwUAjhClb/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpB5n5h5tKvx0DsTrnMgerwwVaRFFGU2ERy1ABT5j9A=;
 b=FaWHqWMAdgqLx+sSd38gLQ3xrGl+5BoY6GV2suZiO6zL0bgQloCJhd3tsr7iGsh7wnoRb8Z4h0UhBXUTLdILeFX5yoIEn08/Fb0DiK4iE4OLLHZL49nvokNpdwrVdyztfqxQjVqlk3juOAB/G8v3mplYS82V/xgZ+1Eo2rS+r7s7NXdiNJGyNPRY0ftSBsjZNSswXtxEnAjs9a5gMbmHy+l1y5W5rsWtGxMbCszrGtydO4Nh5zWcktCbwrDdXURBlNm9n6OfXlfolnoOahkaqspN6rRAsO+n6FfB+edJdQ2cDxDhz9np+zrabhhpnPv5cM3mIUlpqedPU2yT44WI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpB5n5h5tKvx0DsTrnMgerwwVaRFFGU2ERy1ABT5j9A=;
 b=jFyTKTJyazfNhf75pRxYQH5f3+eBh9M36F1xBxtXW8aIrdNxBmWFy6k+DHL93LVt1TiOUqgbu07p5R6z4xW2NqZYg4bXF/opVMlpW7n7B1Pfv0SZqKPjV044j30ewoMi4j3iHB58HO/IAi2yS3JsKqbhC7cdmls5vrWRDOE4YVg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3053.eurprd08.prod.outlook.com (2603:10a6:803:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 15:21:02 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:02 +0000
From: arunachalam.ganapathy@arm.com
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 02/10] arm/trusted-firmware-a: Add support for spmd build option
Date: Tue, 12 Jan 2021 15:20:41 +0000
Message-ID: <20210112152049.3436645-2-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfdd19c9-6b0e-4dec-ffac-08d8b70db0c3
X-MS-TrafficTypeDiagnostic: VI1PR08MB3053:|AM6PR08MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB38624E2FA60CCBB5B23728C7FBAA0@AM6PR08MB3862.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DjeWfzIQRA6EnManbPBJScsSduUUZGY7MX7X2K3J97BtnAaNB1XhgVPmTSYS+7L9qXMzatgtQAzj31lCq++AFgSPsm71+HFLBRscvY2Hx1oRZfRoF2g6Fit8LiDTCd2V+rZeLpUC/CTtfdGUTZ7XswmrtMgzv3EmoMeyQhrAVGoIEQ8HE8RSzGAkcmBSGcrRyYOkuWZ7kaNf6Usz6H8NWUZ53zrD843lJUV5RMzSMl6M6CD/+3G8egVyGnFCFwBS8BYxFZVwtrO2gvXpS/8YpbPOg7yDbkR7PyXG21RBAU+OdraYAhs+gPL9Y1TYhdebM3aB8VjhBJVfJ6FUBpHRxDQSmU206CRPRjXgRiVDpYew/dZuU7wdtUwkdwZlbqqxODjQaJPqk9TljQ5nHzAtyQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(66946007)(1076003)(36756003)(6666004)(16526019)(66476007)(83380400001)(44832011)(186003)(5660300002)(8676002)(4326008)(7696005)(52116002)(2906002)(66556008)(8936002)(2616005)(956004)(6486002)(26005)(6916009)(478600001)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JkrUsk1SrUuo0DWLo5Iibq4Z8D0kG6YE+XaibFYvLphkSw5G+Lxyh6N5Eu6/?=
 =?us-ascii?Q?BGifDg0MFX74ApYCGemZyib/yePQoesTjqfWqKzngPlZaTRIfal/bZr/KEf/?=
 =?us-ascii?Q?QinIvVTGymtqX+CmFM09jm4b3GCj4Lt/iCcAsigtq8pIGjEv1KBFYj8HjNEn?=
 =?us-ascii?Q?SAej2Sg0GcwQSnohuCS/b6r7vxUdYVc7FSONudcnFSni6oCRn8xzExu38qIq?=
 =?us-ascii?Q?uY24yp3CXhzj+06WjI66HqZUXWdUt19Xe1IyySw+XWdleK3EeJtclbaiPxKV?=
 =?us-ascii?Q?6/IwTXzM8w13/mJrepV+2PrmHlJh3iTZrCmu601LFhrySCvxAf/YWcSMZxzd?=
 =?us-ascii?Q?qSqWcAW6ueedUn3+St9lr+lw8FCv+SLUYYSWnuPVzDaUcnnpYCnUpLZRAC3O?=
 =?us-ascii?Q?CjUfb5hb4ZcYirk2xs296pFZsOWkdVLiElWYU3MRzwYFnxy0kgm3KTd7+o3J?=
 =?us-ascii?Q?QIFe4lvSmDp78uZgupWtSLRcNnPE5IL/nAtWQ+bKdfR0wdfDQ9WqKs26LSoT?=
 =?us-ascii?Q?siomV6NfX3nfShiUwp44oN2MuSdeCervsvuhfBmKCTLVjMum1aeX10ARXTCr?=
 =?us-ascii?Q?T0xXUm+wFxi398aom4crZDi76vXtTjDuNZOcZqCfEdX3QVXz8ca0ezsKkimk?=
 =?us-ascii?Q?w841ezJemwvuk/WAa/+XpWKncwNs8QTP0Dzm16YRGBcNvF+xCRhxFXpheuTy?=
 =?us-ascii?Q?upwu6L/DcFFLMBLWw6S+7hZj89EHlO2AQ2sQe9gVeOUkKi9N6rbWP/bYiDAI?=
 =?us-ascii?Q?qp1gL/P9KwZGLirCj2TPn9kyOfX8TO4zKONAKMKyoTCMOBh7SAgICIjbBESc?=
 =?us-ascii?Q?j13HZ9PHr1+3Wo0mHU+05YE37ecLbyrWDCotIVuhiHw77FR4YsNvOJG9m3EZ?=
 =?us-ascii?Q?2AFkzHtByqjju4DQsc5rU2gMk86UwmAQvGp61U9Fu2QVxjNktoKH4oUmVPrF?=
 =?us-ascii?Q?QBmfQNoWsRpFcFKmAYJxesJm9ImTLfcrD2njv3N4MRCb5G2NRpchWlDh8gk1?=
 =?us-ascii?Q?Iy0x?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ddbd43e-1dc3-4eef-3be9-08d8b70dac07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oU8YHdVDS1WDZhP52EV0cW5bdfHDOCthLQhJmUHJpy+06Wgridtq3TYx9KoDh1PQNPbPvaAeoA7YFRhyoYdc47cA951+Jt1r/11n7lTGEgdn2rIhKQBsikQ4lg48V8sUfPafmZHPRYT08xF4+n8f7pa+kbPoYzx69cPiZ10NF8jKcsAKNONH3YAVmJhoEJyRVIFhoBuzxfdj87uVAlNDJT7fCBhkZNdCUyfAg6/SRpOC/reOYOW+T/r9oUky7N8qTiHd0ML9gp4+cM/1+ffoclD77P7jkr8+MRacYU++O0rYxsc+U3ApYZZFJw6CkyLeb3XXZYiiqja4qFaR5UaAMnlDqytECaU+Wqqn8OnqYSXqa84uR9pPhpLlVG9CqnYEKRPCer4zOdXmB7xyXvLL/IVZ52HbbJloz5a+K5FWx1wL9agG9OJpOpj23nrkOobRI8DAp/bCpRtQ0Dz5Hijmxrq4jJIepJAQJLVcyFt5JdUNIi/rmxiz2+3LIqWhRuRB
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(46966006)(6486002)(7696005)(8936002)(2906002)(4326008)(5660300002)(8676002)(36756003)(47076005)(44832011)(186003)(336012)(478600001)(316002)(1076003)(82740400003)(6666004)(356005)(81166007)(956004)(26005)(2616005)(83380400001)(86362001)(16526019)(82310400003)(70206006)(34020700004)(70586007)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:09.9658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdd19c9-6b0e-4dec-ffac-08d8b70db0c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3862
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This patch adds generic dispatcher 'spmd' option for SPD along with
SPMD_SPM_AT_SEL2 build option.

 Config: SPD=3Dspmd and SPMD_SPM_AT_SEL2=3D1. Indicates the SPMC component
 runs at the S-EL2
   - Add hafnium dependency
   - Set CTX_INCLUDE_EL2_REGS=3D1 and ARM_ARCH_MINOR=3D4
   - Set BL32 to hafnium image
   - Set SP_LAYOUT_FILE and ARM_SPMC_MANIFEST build parameters

 Config: SPD=3Dspmd and SPMD_SPM_AT_SEL2=3D0. Indicates the SPMC component
 runs at the S-EL1 execution state.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Icd3970e5132e75de67ef7f41dbfc8f9e1cdde7f3
---
 .../trusted-firmware-a/trusted-firmware-a.inc | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc=
 b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 48f5129..69d5ca8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -22,11 +22,20 @@ TFA_PLATFORM_aarch64_qemuall ?=3D "qemu"
 TFA_BOARD ?=3D ""
=20
 # Some platforms use SPD (Secure Payload Dispatcher) services
-# Few options are "opteed", "tlkd", "trusty", "tspd"...
+# Few options are "opteed", "tlkd", "trusty", "tspd", "spmd"...
 # Leave empty to not use SPD
 TFA_SPD ?=3D ""
 TFA_SPD_aarch64_qemuall ?=3D "opteed"
=20
+# Variable used when TFA_SPD=3Dspmd
+TFA_SPMD_SPM_AT_SEL2 ?=3D "1"
+
+# SP layout file location. Used when TFA_SPD=3Dspmd and TFA_SPMD_SPM_AT_SE=
L2=3D1
+TFA_SP_LAYOUT_FILE ?=3D ""
+
+# SPMC manifest file location. Used when TFA_SPD=3Dspmd and TFA_SPMD_SPM_A=
T_SEL2=3D1
+TFA_ARM_SPMC_MANIFEST_DTS ?=3D ""
+
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?=3D "0"
=20
@@ -114,6 +123,9 @@ EXTRA_OEMAKE +=3D "${@'TARGET_BOARD=3D${TFA_BOARD}' if =
d.getVar('TFA_BOARD') else ''
 # Handle TFA_SPD parameter
 EXTRA_OEMAKE +=3D "${@'SPD=3D${TFA_SPD}' if d.getVar('TFA_SPD') else ''}"
=20
+# If TFA_SPD is spmd, set SPMD_SPM_AT_SEL2
+EXTRA_OEMAKE +=3D "${@'SPMD_SPM_AT_SEL2=3D${TFA_SPMD_SPM_AT_SEL2}' if d.ge=
tVar('TFA_SPD', True) =3D=3D 'spmd' else ''}"
+
 # Handle TFA_DEBUG parameter
 EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_DEBUG', '1', 'DEBUG=3D${TFA_D=
EBUG}', '', d)}"
=20
@@ -125,6 +137,18 @@ DEPENDS +=3D " ${@bb.utils.contains('TFA_UBOOT', '1', =
'u-boot', '', d)}"
 do_compile[depends] +=3D " ${@bb.utils.contains('TFA_UBOOT', '1', 'u-boot:=
do_deploy', '', d)}"
 EXTRA_OEMAKE +=3D "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=3D${DEPLOY=
_DIR_IMAGE}/u-boot.bin', '',d)}"
=20
+# Hafnium support
+SEL2_SPMC =3D "${@'${TFA_SPMD_SPM_AT_SEL2}' if d.getVar('TFA_SPD', True) =
=3D=3D 'spmd' else ''}"
+
+DEPENDS +=3D " ${@bb.utils.contains('SEL2_SPMC', '1', 'hafnium', '', d)}"
+
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('SEL2_SPMC', '1', 'CTX_INCLUDE_EL2=
_REGS=3D1 ARM_ARCH_MINOR=3D4 BL32=3D${RECIPE_SYSROOT}/firmware/hafnium.bin'=
, '', d)}"
+
+# Add SP layout file and spmc manifest for hafnium
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('SEL2_SPMC', '1', 'SP_LAYOUT_FILE=
=3D${TFA_SP_LAYOUT_FILE}' if d.getVar('TFA_SP_LAYOUT_FILE') else '', '', d)=
}"
+
+EXTRA_OEMAKE +=3D "${@bb.utils.contains('SEL2_SPMC', '1', 'ARM_SPMC_MANIFE=
ST_DTS=3D${TFA_ARM_SPMC_MANIFEST_DTS}' if d.getVar('TFA_ARM_SPMC_MANIFEST_D=
TS') else '', '', d)}"
+
 # Tell the tools where the native OpenSSL is located
 EXTRA_OEMAKE +=3D "OPENSSL_DIR=3D${STAGING_DIR_NATIVE}/${prefix_native}"
=20
--=20
2.29.2

