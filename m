Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.47])
 by mx.groups.io with SMTP id smtpd.web10.19707.1599154596548243447
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 10:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AJFKND7S;
 spf=pass (domain: arm.com, ip: 40.107.1.47, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmfHKm66Tr3UnCfQh9CXiMmRfhwKrnZhzprNXRm9z+I=;
 b=AJFKND7Sow8OU/jSA3ALSl5kEujic1Zhq+slQnjF82Jy1yD1tbyr1xtZ5+qCZQUWgSsF1yPk406xl8aDVD3RQHTB1Ags50pCINekMWaVRtA9q8gzWXFSAPQp7An6Ys+ChwDZhgljsShVMdcysC7Fj7lT99AhpxXu/rp/WSqbu/M=
Received: from DB6PR0402CA0024.eurprd04.prod.outlook.com (2603:10a6:4:91::34)
 by VI1PR0802MB2304.eurprd08.prod.outlook.com (2603:10a6:800:9f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 3 Sep
 2020 17:36:33 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::86) by DB6PR0402CA0024.outlook.office365.com
 (2603:10a6:4:91::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Thu, 3 Sep 2020 17:36:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 17:36:33 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Thu, 03 Sep 2020 17:36:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76dc7ad73472225b
X-CR-MTA-TID: 64aa7808
Received: from 14cbbd36c9c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 327316E2-3848-4A25-AAED-BD0298532000.1;
	Thu, 03 Sep 2020 17:36:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14cbbd36c9c1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 17:36:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMWwpcz5ukAcRRFIP1DAtPh18XlnB+5Rrz4ELiUT7Hht3YlVrWi3jWotJaderEB0EZV7w1nh8evElqweNyUftHTaTaxBYWIsbQcClHVushkLOgznpYIfGJKloBuG43asUoarg7Z66sIGWlywy6ZBg+RajPHXxA74PzGumnfg2bdlWbq6M24qXSBKG9sq7/S3dZt0r2+7oRG9vfHJrHhwJdbxrI473GOL24BKNb5ELyXU4lc0yFqFnBLlS8mQP+T2XwWBDPx0hdUZNo4hi5IXZ4n0dwZiJMQ/kqHKVD4iDFTMAU1Dfrf9t8C8QaGUTjKFRAtj3Bqw6rxy8LZchhpmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmfHKm66Tr3UnCfQh9CXiMmRfhwKrnZhzprNXRm9z+I=;
 b=JT0YupC7wkWx/QMr/AO21sVapDcAHMqWdxR759KNpvdrRmjNqHAwYf5+8HRoB3Ce5cjGu0MY8/iK8sRTGAGuOJXnbvo73bi3BB/WBqeEZIOhadjWjufGxN4Wb4TKSimEDBzAFTyAKiWIMvDPsRyhz7BnmytBYMyAagGqPxRBkG79r4Blo8BXvx4ZDoGezVMz2bIcIJNBb2Ec9ELBJfxqg8few6Y/U2ofwxq0kBBkI229b6z8XqQDOOYDosenXHJHi8N/VT81Z3+eSrpmS2lZeSd7F0uyv3bhjN4usOIfcgvxYOI8GvFaPZ5d7j6y0g9P1HJKWge986XY264p3o608Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmfHKm66Tr3UnCfQh9CXiMmRfhwKrnZhzprNXRm9z+I=;
 b=AJFKND7Sow8OU/jSA3ALSl5kEujic1Zhq+slQnjF82Jy1yD1tbyr1xtZ5+qCZQUWgSsF1yPk406xl8aDVD3RQHTB1Ags50pCINekMWaVRtA9q8gzWXFSAPQp7An6Ys+ChwDZhgljsShVMdcysC7Fj7lT99AhpxXu/rp/WSqbu/M=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2940.eurprd08.prod.outlook.com (2603:10a6:7:30::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 17:36:25 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b%12]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 17:36:25 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 1/4] arm-bsp: add cortexa73-cortexa35 tune
Date: Thu,  3 Sep 2020 13:36:15 -0400
Message-Id: <20200903173618.2910-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:0:50::25) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by DM3PR03CA0015.namprd03.prod.outlook.com (2603:10b6:0:50::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 17:36:23 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 03 Sep 2020 13:36:18 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d17103f-56ff-4d2f-e771-08d8502fe667
X-MS-TrafficTypeDiagnostic: HE1PR08MB2940:|VI1PR0802MB2304:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB23049E3A6359FAD61EB2083EF02C0@VI1PR0802MB2304.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:628;OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1H2RM+t39tj2qf2Kcns0a9/dN+21cEp/0mSVMtLO7QKCVY2jLrArnU+1l7fwRFxXHNH7xbsb1h3Xd7yX0pBSUhyQjslLj0gsok8DDneEpvksokPVbTFsK0FCXmXm6lYpk09RS2SLRCAEONQIUcFs5DdfRdQTeKcr/GT+tSAl2eN2961y+Dr6nsWmpnf5syCXRbfIJwBjOk/kxL6TCZhP5O7iVO1PfrCVCTLuNJzFGI8/QJcRgKramIeQuhFU3z7ct5zUihFYQDRnZpMBGm5DxRerTLoz4Pu1WJxDMWON9yh/duGdd3GsOsPCGVZJRiFjd1VQ8goDezYiYkjTKq8ANw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(1076003)(44832011)(19627235002)(36756003)(86362001)(2616005)(426003)(8936002)(52116002)(8676002)(6666004)(6916009)(316002)(4326008)(66946007)(42186006)(478600001)(66556008)(2906002)(66476007)(186003)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 K2h0NMIyS9Fqqa709uC04AXP2VeCYZWT3rz9DBMsptIPfC+aiE2xNHqvDXQBwn8ZijNPmm0TLhC3tGSSVuVjIfhwdsdLOUjQxt2v9tWU2U+05i8qr4F/IlhK35lO+goyFYDcKvPn/gK2X0D6PB1bcY+qxyf7LkfauEyeEEtw+YF+O8wKUdwCwZgI7SnoeV4lW99+zV/Mj/qhODV+OfGolTN61G+nD+PTjXzC8GFvxwJaolJd1UEjZ1wNrDO3z+qkZFiQorguBARq7Oyc9hlkc4NWusx6CYAiDS0i/bucNgIWmenw/VRLfTbIklaGJT3XVcZnCVCd1C4W9y9dkWBIhEYRnbEL8mIluANrTlHdSedga0Dp6Xm5RFT0VeMn80Te1ZFHZRs3npmtYBDQZF9sgtt/wg0nTvnWQHq8YoJBtotoy2Fu+oqiNpi8wWhUOePEAuog5tUDshbC8XJH9vbZTF5cAFKDyje5AAr97KS1fywUGGnPMQsLDUqMDFFUKBOKqsxXKchl7BwbPOi/pWnlZpjyBwncyRPGiuIknmwXA0nOV0WTa2lf8YykI6RXdAUnpCi5wS6F5xDUxJltjk3rXxHJW5QqjAG9d18YexGtcCSauggcen3pU8cuOdN2xvcQNby2BK3RupPRE/2bbVtD7A==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2940
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	787c4f15-4eac-4164-35e9-08d8502fe0f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IKOCCqh4GI6w7+xS5e+bdDOaqAVioL07CntVVlPTgKgzCekGVGdzEZdemuiu28nRwM10UohsvDpIv1jr+hwiOzX2MU0rWFYgLS+/RBnaf9BNUeo4wBa6Tf1p+qJbTqN8VsrQtGCqMdFcxBBWI8K3HHjYjc5Rt5SF6ad2+CRr1ykQRVDl2dd3w7f0cUE/jYE/AvQfEZfuoxf2XmuA5ytNg6NL55VznlxbMymrAGm+Xh+uaQq2DqfIANnzGNtV+Z5QEUCn7oYvm91BjmfyRJxciZderV40B/VMwYLyzJNidhvegFUNKdr01RixRQTet3Ka5L9blricTsJOF9Z6Vnc6cMk9omz30f18Zcv0P8oKZtCJ63Duh7kF+8pWXHRuVo2Fuf9Bl+56uwyCS2gB1wAoDQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966005)(82310400003)(19627235002)(316002)(1076003)(42186006)(81166007)(478600001)(6666004)(36756003)(356005)(8676002)(70586007)(2616005)(86362001)(186003)(82740400003)(6916009)(426003)(336012)(47076004)(26005)(8936002)(44832011)(5660300002)(4326008)(70206006)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 17:36:33.2119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d17103f-56ff-4d2f-e771-08d8502fe667
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2304
Content-Type: text/plain

Add ARMv8-A big.LITTLE tuning for cortexa73-cortexa35.  It is supported
in GCC, and is the only one missing from OE-Core.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../include/tune-cortexa73-cortexa35.inc      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc

diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
new file mode 100644
index 0000000..9e0786c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "cortexa73-cortexa35"
+
+TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# cortexa73.cortexa35 implies crc support
+AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
+ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
+TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
+TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
+BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
+
-- 
2.17.1

