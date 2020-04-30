Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.47])
 by mx.groups.io with SMTP id smtpd.web11.7433.1588254674276317928
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 06:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=e7WNGOB3;
 spf=pass (domain: arm.com, ip: 40.107.0.47, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR/nCECA0Yc+lk2XghWlQaPvxA5c5fcrCwzs6QwcMAI=;
 b=e7WNGOB3X5oktvQwH61xAhuNpNrvPg2BoVLQpw/mtl2bN2ekLhsRk25KeKGIdd0mE/9JrnM8hm04wJb9QRMYu6mC5IhlZsvEp5a8ZsyqBcYwYyRo7z4TwG2RSLNA4R0vTL2MSO+Noxh+UNQgfkfo0mKo7VGHT07PF8NQ4psNzB8=
Received: from AM7PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:20b:130::23)
 by AM0PR08MB3092.eurprd08.prod.outlook.com (2603:10a6:208:5c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 13:51:11 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::d0) by AM7PR03CA0013.outlook.office365.com
 (2603:10a6:20b:130::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 13:51:11 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:51:11 +0000
Received: ("Tessian outbound ff098c684b24:v54"); Thu, 30 Apr 2020 13:51:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72a65ca12703be71
X-CR-MTA-TID: 64aa7808
Received: from 9fca05b080ac.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A9E400C2-8696-4F3B-BBEF-6A2E13AE879D.1;
	Thu, 30 Apr 2020 13:51:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fca05b080ac.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 13:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyJFWIMR4NA6Sa7PUVC1aQ3nnA85gv/cr2MFr4yqrCxY0q3DLtpWwMa8chwzewgcih7JGFvwhkF4yw0jvR1/4J3O7yihjTw0BopEcWTLTtQ6cZBasGs033MZwE70825iJ4yrcRcN26p1y2xmCKODIhkj966T6iFWb5fU0bjeqNzp9SmUs51ov8K7GQDn2mjSwnK1hXKDAnloZL4KPYfGslhbCHsQZxCEk2Z3918vO51wzH6mHwTk819fitWr/WoV4JVuI+PVLFgRCpap0O9SR1gszd3GCUWAJjANit5mR3MWdEl0hpRBTaX5ijl9Ody12bDno6+MwF258GMx7m+pGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR/nCECA0Yc+lk2XghWlQaPvxA5c5fcrCwzs6QwcMAI=;
 b=ZciRJs3lw403hV22ddPUdqTZzkKuullS3LFZNQhpGRTKK4atLM8E6VHzFmIP2KejX9o5xyLAQcZhS+V52CoKuD6JC4PHNkbF2pNIqutVEbB4WlHlm+pjJMXDPIIp4AmG6mYgn4PFVbE7JVPUJZ89c1fb0yumfa6ErQ8Ud99mJ0WhnFlL483D/lyeDXas9xYbFropowmIB3JDsI+4d1r5/Ixn7zcaZQAdvAsuCB9mTT2Say52w2c/NvIYJ1yI3BbMm7aU7PUBbZCC0M4/8rRYL4A9IspNmgwNvsA7QzgfhGQphnCOc3pV3g2JZBB5tewH5Bm303lYIQ0DhKem2Q0PAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR/nCECA0Yc+lk2XghWlQaPvxA5c5fcrCwzs6QwcMAI=;
 b=e7WNGOB3X5oktvQwH61xAhuNpNrvPg2BoVLQpw/mtl2bN2ekLhsRk25KeKGIdd0mE/9JrnM8hm04wJb9QRMYu6mC5IhlZsvEp5a8ZsyqBcYwYyRo7z4TwG2RSLNA4R0vTL2MSO+Noxh+UNQgfkfo0mKo7VGHT07PF8NQ4psNzB8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3556.eurprd08.prod.outlook.com (2603:10a6:208:e0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 13:51:04 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 13:51:04 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] [arm-autonomy] firmware-image-juno: Remove unnecessary machine override
Date: Thu, 30 Apr 2020 14:51:02 +0100
Message-Id: <1588254663-86702-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:51:03 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49886185-a455-41e6-e3a6-08d7ed0d8abe
X-MS-TrafficTypeDiagnostic: AM0PR08MB3556:|AM0PR08MB3092:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB30925611B9CA5282B7352FDB92AA0@AM0PR08MB3092.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:549;OLM:549;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RSxKqkF/7Tp84hhIfSDgp/CLyh6wBH217tGcLWwiUM23AaFl7lxMt1x4W58mAOnQRIaLLJTzbTjNuG7hViXZ7oOz5tiZ4cSN+/vNxyN6S9AGUomTvgfPc8zaXturdkC58jzOs3q97hVHAt9imFhVw3aaw9lFkksMbb4xbWg580t/2vBn/7LHmbC/TueEFsetKc4GGG+Y0wf5FLw9SCGh5HHgjAKC0zZd3DLT6kuJFu22PAqiUgribA6mooqYVaOvxDvg/Pl0qP/hjwOlusz7DiYR0P1fB5ia9J554GUDivEAsDL0HEN8rDHhs1as45o0wlXqwtaWNmZnttdYCVNcOSASmS2AD3quDqGKxL2a/Td5O9hoQda3K+7tDGDttc59AOAF/j0PkOHrDE5zzAsIRSWWzf39/bb4z4ugrxGZH5/nioPdB7Mb002ooaOGAala
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(186003)(8936002)(8676002)(5660300002)(52116002)(7696005)(26005)(6486002)(86362001)(2906002)(16526019)(36756003)(478600001)(316002)(44832011)(2616005)(956004)(66946007)(6916009)(66476007)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 1+k2JMAciCgasP2w9PNCbd1R/q87ASXvilgPngg1jKlzpa5dfOd8NI1/dbt9+65Ev5X+IOe61tQTxYdDVCL+IkFCfKtas8w2KLQm3dk9J8U80vJdyG+UCIrsHBZ7lsRFZOQOqMWlSlFRrcVRAFGvwP/6KYbM1kYz4GH4kfPiQdssMMuDmojpEF6lgiaRdTi7PBNk8RZiaCp16a/LVqhGbGdSl5rHn+cM+YhzAkUoS1OYvcFsND5amjEfo3ZoXP17Y4M0MD3vW/oGt8yWnlJW/FHg6PSkQdWkNS1dD8oR9V6QWwnjm6LgDe+i1GCKjAoD4lKGDUmkHKGgoNUS6eWrmf5pVw2G3oJMPHxsgvAjzfaaD6N5maE8b2xDpTx1Kh1PqbBkeCS93yEV+xWxze2GH7nSNnDp0JBdcT4aKLrHZUpyyjfZnVGRRFt+FxDvmWFyEnFBx6wD4vU/7C6P326KBaLdsiy5yFb5DnPxcfhTZMFtgX1juxtOQbCFqvOEVB5vdg/1ul8/S2Bqt18cyJc7pAx850axLk7PO7Sy++xzZBoetCeVJ9kIU/cPdJRsBYLSJA+0/T72yhAA0+tyX7+lqwI6ScIFgKjpgDhvltzj2ONXasfwDtYpt9rmKNfpAaIRSRcPCBHcLjtM9SRnq8gJCj/Q2GFX8ozy0gT6jd3YuIC56Cd/GaM75FX8U5+jkguwn9tZSL0Hpnr926plZKhL3B7azQdiyaYJcZQUW57l3lBEa8RucoU3rPTcz2EUdGUM3ccyy3pXHTdXTrOUBl/4OO/bEuXuN3Vu+CINf4bG+ck=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3556
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966005)(316002)(36906005)(86362001)(2616005)(2906002)(36756003)(956004)(82310400002)(8676002)(81166007)(70206006)(478600001)(70586007)(16526019)(7696005)(26005)(47076004)(336012)(5660300002)(8936002)(186003)(6486002)(356005)(44832011)(6916009)(4326008)(82740400003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5bb7aac7-110b-4c3a-ce76-08d7ed0d8631
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HVs6wWfvrGd7/Ndwsgtik7qASyGxRo3iM4JThLerLaLMc9CHWsAfSIBp+ndumjtvayMnElwCWfRBQjTAcyXQr4siZxaRt+sfZuJS/XKzbdDBJfwoeDhBSPB1gkA+UjCbmcuU8I157x9kGz+gI/IzQNQXBfmofTPBfcQhoD/dz+AFeTU4mQeBWUjqQXxRi9RARrIOdTv4VDI/jy7l9qXbINw4x1Q7lGlgxnPo5lVYJulvLJu+vIiSkamfJmFhKg//+nNaNtixCxEumCa8261LpNAbLD4rmH9H9L+LfsQNBeQLzpu3uXc6FgH26I/uW7xboZzRUig3UuXWZ6IIEc/WpgVRJjAWiAZ1go9k6La0hg7xhwXxSJllmlcdANvlPMSqqRJsrnOxFqIhBT4zBJjz1Y5mDi3kL5GXqze1DckaC0moHlvFNK2zVbULIzaskqrvZ61uoMpyjxhYY1S2n8e1IXvyhwninyRsIao5HfLuYPHbapnPY6OqW4HWoUow0EnB/Fj0CQTB5HH97VvNU42G9A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 13:51:11.3468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49886185-a455-41e6-e3a6-08d7ed0d8abe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3092
Content-Type: text/plain

Since firmware-image-juno main recipe is only compatible with juno
MACHINE, the _juno machine override are not needed.

Change-Id: If1b880ee2b6b854f83087005f7ae89f0d77aef7d
Issue-Id: SCM-889
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
index 55b83d3..2904e0b 100644
--- a/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
+++ b/meta-arm-autonomy/recipes-bsp/images/firmware-image-juno.bbappend
@@ -1,10 +1,10 @@
-FILESEXTRAPATHS_prepend_juno := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/${PN}:', '', d)}"
+FILESEXTRAPATHS_prepend := "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '${THISDIR}/${PN}:', '', d)}"
 
-INSTALL_EXTRA_DEPS_juno = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen:do_deploy', '', d)}"
+INSTALL_EXTRA_DEPS = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen:do_deploy', '', d)}"
 
 do_install[depends] += "${INSTALL_EXTRA_DEPS}"
 
-do_install_append_juno() {
+do_install_append() {
     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'yes', 'no', d)}" = "yes" ]; then
         cp  ${DEPLOY_DIR_IMAGE}/xen-${COMPATIBLE_MACHINE}.efi \
             ${D}/${UNPACK_DIR}/SOFTWARE/xen
-- 
2.7.4

