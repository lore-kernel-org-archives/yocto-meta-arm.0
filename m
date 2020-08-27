Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.59])
 by mx.groups.io with SMTP id smtpd.web11.24439.1598549662119022749
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 10:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=El2qR3Qy;
 spf=pass (domain: arm.com, ip: 40.107.21.59, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEmJCcGpX3u5Nq7j55tCSeAanpYuifhFc92gAsAwupo=;
 b=El2qR3QyM3TVJq/Cu/sFHSncvqq9k0XMZ4g4PwJfmUTS8+7Run2zJ5WulxqON9irFxP6jXGgiw001ccrveXh+0Sijp+irsyNsQVFo8HQwCwbSR107E3VOc1vsqtYYBg5m47+UNpAHt1fe4wwixyJRi8b1z7GF2vSaG6O92ET0FM=
Received: from AM6PR10CA0080.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::21)
 by AM0PR08MB2964.eurprd08.prod.outlook.com (2603:10a6:208:5d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 17:34:19 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::79) by AM6PR10CA0080.outlook.office365.com
 (2603:10a6:209:8c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 17:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 17:34:18 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 27 Aug 2020 17:34:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a61204d5757c6f24
X-CR-MTA-TID: 64aa7808
Received: from 66ce6c88950f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FBDBF0F5-17F8-479E-AFB7-47C6F47311F3.1;
	Thu, 27 Aug 2020 17:34:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66ce6c88950f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Aug 2020 17:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1ZtoVU8hgDlRR3fn24OAhEzoqr9d4B5HzrZ8O9cMUxbfwlzI++Zu/Y+HP0syxc2ePiLFpDJhlpJBLae5vVdfLeRpZrYdawNjYEprfEmTFnByB2ZyJCbZDMwOF2vYAHLvjJv0CN8YwlvEa1jmTYV7V+9UguTzv7wDQBGLql8fxZyxkZuXgl2tP4EbYhdCHi1vvafmuceb95UjGCBw0LkOtHz0OY+/4m0DCwIWjIzBxT43F8KbcTv4miBcxnJsy1tpYbfyr0Ct/ilHw+GlbM1GPutc9ipbJgwnzfVikUoo7kpREjW6JEQ95VM8mDW3JhIcUJd4z20j2iigBRkJkrngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEmJCcGpX3u5Nq7j55tCSeAanpYuifhFc92gAsAwupo=;
 b=SgKjHxes9JFxqI2LQucbekZYWaaDdLZ4C5hQeU22U14uo30BKzLVMWTshJigKXsSICOJd7TkGXuWP12cAYcdJw7QYuDS9EQTt0+fvuvB04qSM2x/jR9Q8G3P0ceELNL5VVQE/2u2fNMYreddZwusPc+rnZNF32KqVDOgFO4nkmvLHqwEaweK5Hn8BZ+wroXqNUe0BGEtrJ4/VW39UldE4ySxuE3ca3dkh8JE9sAfSyDjYzOVm781UJTBqBWicWFsizxYij9kxLQTISMzlZTF9UOoGy/joXS9HdNZW5crMYa6sGjQyo/+bgshgvSQAN47T0yE7Cdas6U7kCTuNaNoig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEmJCcGpX3u5Nq7j55tCSeAanpYuifhFc92gAsAwupo=;
 b=El2qR3QyM3TVJq/Cu/sFHSncvqq9k0XMZ4g4PwJfmUTS8+7Run2zJ5WulxqON9irFxP6jXGgiw001ccrveXh+0Sijp+irsyNsQVFo8HQwCwbSR107E3VOc1vsqtYYBg5m47+UNpAHt1fe4wwixyJRi8b1z7GF2vSaG6O92ET0FM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB7PR08MB3465.eurprd08.prod.outlook.com (2603:10a6:10:50::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 17:34:10 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%6]) with mapi id 15.20.3305.032; Thu, 27 Aug 2020
 17:34:10 +0000
From: "Usama Arif" <usama.arif@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Usama Arif <usama.arif@arm.com>
Subject: [PATCH] arm/scp-firmware: Fix build location
Date: Thu, 27 Aug 2020 18:33:53 +0100
Message-Id: <20200827173353.17860-1-usama.arif@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::24) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from usaari01.cambridge.arm.com (217.140.106.53) by LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 17:34:10 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e64af147-2e0a-454f-9ea5-08d84aaf6d8f
X-MS-TrafficTypeDiagnostic: DB7PR08MB3465:|AM0PR08MB2964:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB296474CE47FF7B523D5594A792550@AM0PR08MB2964.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Z3ttnlgA0Qi7zCotj/fHuuOyMXgPvjPZnaTnlEuHWnZsrIgbvuYftft0EsANviJ1bH4RCpEx2bTQ1ceMq27nFVXCe6sss6nLRYhLe0dsT4JqMyShqUOoAoKyvGc01ncQpsy7Hl9dxXd/VkRA56U0nUcTHbyf5ktkf+9jvrG3NWnODAbHrg8ZhNrGhx2U3VF1FJ+fANavHUptMPt+HyEpN9A/J03LxSAXkCT89vmlyoNGVZOMZ2/BYmKQOrXI4mgdj33XiZSNgrXVWUwtkJVhcFctqIASuNKiRji6gnEtjjR0BafZH2K4BYe5v7r9WOOh0NYSV7OwtxppF8MlShzg4g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(52116002)(7696005)(44832011)(478600001)(956004)(2616005)(6916009)(8936002)(8676002)(186003)(2906002)(16526019)(6486002)(26005)(4744005)(6666004)(1076003)(316002)(5660300002)(86362001)(66946007)(66476007)(83380400001)(66556008)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 9gKaLKff62TjzBYLFPo0oFGCh3Dsfd3NnbNyM4lpGdQFxEWw/djlgLAAqFRGsunsIzcJwA7MXZFGko3KPUuOAGENIq1OKxy6gTsdeicr1NPFdoOcaQ3SB7RJj+pEdrrvOIA3Kf2zouET2/W3Vq0hwVlLKSdM7JpeHewzvKDrmh5ws2RK3iJ+PEq+zXWkZEwI/50Q2cEe/DUo6kpmSFBWPGRbpa1iDzxuB1A4zKXVT2r+pHdKgk3+S6Oh3xKxA0s7Uk5kUhiPjpm5b58DfSN83AcC3G5SC+u2bcmcnlWe9fCc6QQ4VKSP2wzayN865WMqy9fU4/F2I2E5Ji8cw8o61XhnE3KlUpYaXNlW/tqqZhzo8GAa36YSoMyBQ/2D+8msMcBMaLYwf+Dwppx3F1zCHs0PkrJZo21oueRLqgXyd5D/pOcL75711hnCSqMKQSLN6/RBTlOuLiz1thIO7aYsOXnR0ZO9syzodYzbwuOUK90jkAKbsmB7OCqsQGwpKGi890yj2cogVnZQrWFJafAolCvRJHvTrCGAM2bIg++ZJgM/CsutDx0nL5sEuf/TaLA3lH7FHtcVPH79NMQiFUxeO3mCimCq6cTl6g7wNa+8EZvEDv3w42MaSdA3WuL2YZbih4GOt47uXtWr2QzvwuIZQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	352655ba-f4f9-4165-28cf-08d84aaf6868
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xcjOw3f9yLzLScIuQjwUmnqE8IoXYQ+NLr2mwJxKdu3/2meaUD9a4xOiMGlG5SlZDbwqpOBAAgyeiOmaNiml1hJGojaCNtKL3XHxJjJJWa+6HfVXZgT0C798hKA/lHIxQA4RjDcXu2Lwa1QCv8+2oWkhUsfPh/V+67q14iSi4PFQZ6czzFA6spIaIQ4KcWeD5cDTBQEPGKeUlu9H3mcC1RoO3dgNtQzRlINdU9pKdmR0oTxNQ+HfG7UB9JeukR6/lmWpn+M8B42lUTnf6ujSe3JAW9OEDiNeIIOxKOaUA2ClEAnnna2qPTB58GRGRsWRojxsyiYZ9eesbRkoBI97XyPYzMeStkTiBYKpZN8iETRxMV6/o5J/AfknZeXNTRCATiLljKGhvKfM+DxhH8dn2g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(336012)(70586007)(8676002)(47076004)(6666004)(1076003)(7696005)(70206006)(5660300002)(16526019)(82740400003)(4326008)(186003)(356005)(316002)(26005)(2906002)(36756003)(82310400002)(6916009)(956004)(86362001)(2616005)(6486002)(44832011)(83380400001)(478600001)(4744005)(8936002)(81166007)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 17:34:18.9586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e64af147-2e0a-454f-9ea5-08d84aaf6d8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2964
Content-Type: text/plain

The build location is dependent on whether
debug or release version of scp is being built.

Change-Id: I22e0777c316ea59a49a6f178d620a59d24372e00
Signed-off-by: Usama Arif <usama.arif@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
index 47b09aa..4de0912 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
@@ -58,7 +58,7 @@ do_install() {
      install -d ${D}/firmware
      for FW in ${FW_TARGETS}; do
         for TYPE in ${FW_INSTALL}; do
-           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/release/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
+           install -D "${B}/product/${SCP_PLATFORM}/${FW}_${TYPE}/${SCP_BUILD_STR}/bin/${FW}_${TYPE}.bin" "${D}/firmware/"
         done
      done
 }
-- 
2.17.1

