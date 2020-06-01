Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.62])
 by mx.groups.io with SMTP id smtpd.web11.48454.1591047306893467782
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Jun 2020 14:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aPDP88BD;
 spf=pass (domain: arm.com, ip: 40.107.4.62, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5Vzr3utkTWL08/SvsQyucxSyVMc7DKi8Wt3kwwrl+4=;
 b=aPDP88BDTygcbUtZzJIj6mZoRe3m5gjBzdLraz+UHyaA0zwsL6n25VJRHBLFymaTrzfSv6vOhl0junpR9gKiTaXBNbS4TlkTSnguSaZE9X859MDE48XwCbr/VhDhnjaz9IXoZgSoclYccLDVylUkjx0XcEZsYTflpI3bSNehOAM=
Received: from AM6P192CA0088.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::29)
 by DB7PR08MB3049.eurprd08.prod.outlook.com (2603:10a6:5:1d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Mon, 1 Jun
 2020 21:35:02 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::d3) by AM6P192CA0088.outlook.office365.com
 (2603:10a6:209:8d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Mon, 1 Jun 2020 21:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Mon, 1 Jun 2020 21:35:01 +0000
Received: ("Tessian outbound 14e212f6ce41:v57"); Mon, 01 Jun 2020 21:35:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 324938eed57e5e3e
X-CR-MTA-TID: 64aa7808
Received: from bf2125f12a3c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D0D96598-A179-4841-8C49-104232B1353F.1;
	Mon, 01 Jun 2020 21:34:56 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf2125f12a3c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 01 Jun 2020 21:34:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQcl/j64oM//q2ZeANURsdrwMXuueeUC6R2jcv5XA5pfKlwCxc/kV+ox6cdbtnYFvy5Wzlai4Iu81wpT71f0Ht44xeatsZ9/avPKsL/pPsC8pk8HRLxmgH2NcV/XA1hP9OMjeoe3LLdXsHQZbgxqHp0I9/Bc208pzjqJJCDEp5A7kPQHjf1G+ZZtp7UllwuoMYqs4A3UoCDhox2Z1iUmPEy6pTMamAxMrV9vth1Iz+QBUav4fQM5kMiwspz+byK7MshG21uYGdoQMrXq+XaYlTKsoo7nDXOp2NpfF+VjYWXuBa/ywW+NMd0NBICjz3TrYjH2yal2vcAjBuCrpdB17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5Vzr3utkTWL08/SvsQyucxSyVMc7DKi8Wt3kwwrl+4=;
 b=hcaLVW5iBFoPDUlSgThxzZySMBUBRYXmJzeX5J6m4MhbQjBA5Hg3wCIxKgkO6zZ7ZsERLWVh2jMfmGsqKQbh5/PWMLQHQSz1WQaY2RumLH96h85wlXnKcbzsJttUCY4oTZLNZjx3GSQb7ykJTIezmIjKNcbJuJ44Rd+cxxXvTQhPq48j7ja4gwBS7PfJQcvlh0gHC5owJTZjrGxmJd3MFtfJkyTv6QYEXfe8aBXiALMfK2f77i5DEQVugKR1kKhxs+QUugfXz2piwHA1b3K4TfhlyoMJRB0NMMxp3h+1QSv7eq4MhCodPnnhAa5Yyz4rMpA0f1XVkC2PN2CDQw4DaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5Vzr3utkTWL08/SvsQyucxSyVMc7DKi8Wt3kwwrl+4=;
 b=aPDP88BDTygcbUtZzJIj6mZoRe3m5gjBzdLraz+UHyaA0zwsL6n25VJRHBLFymaTrzfSv6vOhl0junpR9gKiTaXBNbS4TlkTSnguSaZE9X859MDE48XwCbr/VhDhnjaz9IXoZgSoclYccLDVylUkjx0XcEZsYTflpI3bSNehOAM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3650.eurprd08.prod.outlook.com (2603:10a6:208:da::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Mon, 1 Jun
 2020 21:34:54 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 21:34:54 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: a5ds: change SRC_URI to git
Date: Mon,  1 Jun 2020 17:34:48 -0400
Message-Id: <20200601213448.27344-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN2PR01CA0011.prod.exchangelabs.com (2603:10b6:804:2::21)
 To AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by SN2PR01CA0011.prod.exchangelabs.com (2603:10b6:804:2::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Mon, 1 Jun 2020 21:34:52 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 01 Jun 2020 17:34:48 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 65504e00-d6c8-4d1c-61d0-08d80673a439
X-MS-TrafficTypeDiagnostic: AM0PR08MB3650:|DB7PR08MB3049:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB30499824C9D9EE7DAEC4E1DAF08A0@DB7PR08MB3049.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-Forefront-PRVS: 0421BF7135
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w0M3sgGW41Rb0AjHpRS+QslrVdOs23vro8vk26lu0M0PnAtlHsrvsk0ovovRl474wTuxGzp+05X1KdMdMRB5yVvDMlQuOjBA7dqSJNqVOP5jxlBE9+umPTU7XGLkse8QZJybRzHdtW+kp/w/g3LZGxfHvOUEXK1iVf/7FvlKQMQvIZVQwePJn0JWC+0gFF1Dyc2fAchy2JahdZzlMLLDUS2IKmi2T0Lx+qSYZajh811ntIJIneR66g/pvAD31eAtvoHLZaF0fgqSqtKSf67gL1K3Y7Hpfhys3GgDr8cTkA0h1v7WKd4HU1Cbr3q/wNJMlpoaDIvdOqXby/aDgjYVaxweVK4OIY21ObSg8OhkRga23Dru4iSRj1JVRlbWM5V3xQTbihj3K13fhve2ZKrV3xDvLwxTIyVCbX/rI/f4n59npKnFD7ZHnya0xX0PLb+1kfUA1SDLgtxYDIoZGVBB+w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(66556008)(36756003)(2906002)(86362001)(1076003)(2616005)(52116002)(4326008)(186003)(66476007)(66946007)(83380400001)(42186006)(44832011)(6916009)(5660300002)(8936002)(8676002)(478600001)(26005)(316002)(426003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 SYPswdD3lZs4ZFzxt1vjcZXzszlfhw/Ch8o+/SHF8/DYxiyYs5P5P+EV2tzxMUKNIv+gq0+UCRlqOgq0wKlG+WvK1ETOXwKvrLN3/gOXYwN6Pg0hqKblwXPmPMssFtjiZub+ekvoBpqBPMDj+00eeNI+lD3OEpLWe/NfsX0D/nJmrLGxffjUQtvdqPi5WXs2AEEUSvnKRcFBzapPiKKkzQ8nZltvsrNUrR9/DeutIbwkjA56/hgD/muClU7PN/RvuAFrRJXqv4gb7Ep8jNB4LZiJdGp8M/n9HSGhchO1GWALuhJqc4MVgox5F9GNvKr9OcbDlTUC5exk7DoaRXyToFox9aG36xPd9F7bT7YBIUlbXd/yVYtjs4adqKGgViAOHfgl6Z9+/NzHEZrz9Lq3E+jYfszB6V3Yj0mr+ucPQe/7yjVRGPxEVTeqv+Lg978+vKkuEUjb6XP0XGlZPqSsPsWKptAjnQt5j2GLViE/Vp3rzRJMnezktcq78w/ks9Fw
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(6916009)(426003)(8676002)(2616005)(2906002)(4326008)(1076003)(5660300002)(26005)(36756003)(186003)(336012)(70586007)(82310400002)(478600001)(70206006)(81166007)(47076004)(356005)(8936002)(83380400001)(42186006)(44832011)(86362001)(82740400003)(316002)(36906005)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3bbdd306-726b-4516-8f52-08d806739f05
X-Forefront-PRVS: 0421BF7135
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jkXs7MHvM4hRDWJg7iW/Ahm5V2uSTL90AKnrZEytpd5c0hnPDGDtT8cABdBsw1wDhHSar0I6/szU76aYQpGn93VshT9A+1LRKiHWaCy+Zs+4iSZFcfR3vmG+XiIBON2xQLr+FqrjaPHajUF291dj0lqKgkhLuv4qg2OJfOU/xc1GVG0BaunXbrt+Wz1sP2ls5OhbCtUP6rCg2sRRNc7/xZUwkvooDfF5PSnFV+adV3F6W36Fq04P2fJAYi5UOdLFzIITd/eT2ZWNf2SvAFz7SdnKdVTPTAHlnSXxDiDLkmxgv4vju8jpyk8aBKWOZ2/R9FoPUKatPGwqTP3N6DYCiKyUUfRVVDvbWwa6zFfXC0Ti8ooH5Bf2gxfOlSSE8fnMhgbO660CoKaEey46ht8yM+vQhGl1f0l3HoAMTcy0gKtnJHHj9LtiKjB11DhKH/QcAxtZ1QXeHdDnp3ts6qBnhPeRuw2PKsbmYt7Q+3VGlWyAO46lcYF5czmWeNpqRmVV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2020 21:35:01.8075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65504e00-d6c8-4d1c-61d0-08d80673a439
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3049
Content-Type: text/plain

When building for a5ds dunfell, I am seeing the following error:
fatal: unable to access 'https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux/': server certificate verification failed. CAfile: none CRLfile: none

I do not see this error when using git instead of https to access the
tree.  So, change to that access method (and it should be faster too).

Change-Id: I8e793ece68edaaa918ed3c3a0e9b4e195775828f
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-upstream-arm-platforms.inc       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
index 7b73e75..472cea8 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-upstream-arm-platforms.inc
@@ -20,5 +20,5 @@ KBRANCH = ""
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 SRC_URI = "\
-        git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=https;nobranch=1 \
+        git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux;protocol=git;nobranch=1 \
         "
-- 
2.17.1

