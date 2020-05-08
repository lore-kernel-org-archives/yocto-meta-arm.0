Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.69])
 by mx.groups.io with SMTP id smtpd.web10.393.1588955674791618516
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 09:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5AJBZITQ;
 spf=pass (domain: arm.com, ip: 40.107.6.69, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQoCll17hzt+cOrKJtsIC552hE0PbghL+wgNBgXSD1g=;
 b=5AJBZITQoSZlskfy6zcWGGCbKu+WQqkJBClAUErNduX6V2Y5sIHb2cJVL0knBNMrOaR9bKTyo9IPIVk4PAlJLcyoNilyHCC3iVbEv9AZaRBzDB5b3na+gpK4QyRCwUWuc4yqh4NePLSoYZghdSYVaCGHth6jQNKf5W69Qpxm+gE=
Received: from AM6PR10CA0108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::49)
 by DB6PR0802MB2614.eurprd08.prod.outlook.com (2603:10a6:4:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Fri, 8 May
 2020 16:34:32 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::9e) by AM6PR10CA0108.outlook.office365.com
 (2603:10a6:209:8c::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Fri, 8 May 2020 16:34:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 16:34:31 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Fri, 08 May 2020 16:34:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c76eacf655de89ff
X-CR-MTA-TID: 64aa7808
Received: from 21fbc336ee7d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D7DE15CD-53EF-4607-AF22-EE0C397A43FD.1;
	Fri, 08 May 2020 16:34:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21fbc336ee7d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 16:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhXwyu5DXzGCtxD4jeYP89O240Oah0UH9616Zqp9b1b8a79n2KLSeBWx886RZvwGkD8o35fTpKO13nFLhFUlLxPXBJez+vnF8/ItogW9nPHwmQO0qnlHvIf/gWZO9xdObSsX96pdjPvTJ6fZuMkcw8LdqBga8UwBpTLw4hUPz6965vLWBX1XxzUWflq+CybnxnWagjsYQCuzS49dyhvXTINtccLBjtMZQG0hGz317NfoZa1AjWFuBWfW9bZwrKHW6ra/boYsGUQMQO80Ww+DY5dXREOjLsVmyex5aW46LhFC+F3Xsw/kIR/EiNE57cSr5u4j65kE1v2CmcOR4apA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQoCll17hzt+cOrKJtsIC552hE0PbghL+wgNBgXSD1g=;
 b=ZTHJxKH0b0EJnLKZeRJU1nnVEZ09xVrp5Us0O3yzIPp3GgmzueSIpANxqPEzOACGHt+SJAVBKvc9bSfvGCXiLzYLk8Q69Zi29mCrTj4YyepDWqeqfAqjE3N8j8A7RYV4b0cNBxKLA+7eEskR+a2QSHstRB8WoF9ELW291UjgZ7M24jZLQm15N0wEnEkcpVIbovvsrPtx5c7RgOTgWTy904N6blZQ7uzmNHdWoRkfzVgEu7/oSlclcOgG/COYeFOdG9Eq1mLs0KDLxfQgGMsG/29FHYeqMrtUsdRjCPs9OJRxXAsrVi0/izSKrcTjODIMPXqW3/93VSm6/X8JV9cBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQoCll17hzt+cOrKJtsIC552hE0PbghL+wgNBgXSD1g=;
 b=5AJBZITQoSZlskfy6zcWGGCbKu+WQqkJBClAUErNduX6V2Y5sIHb2cJVL0knBNMrOaR9bKTyo9IPIVk4PAlJLcyoNilyHCC3iVbEv9AZaRBzDB5b3na+gpK4QyRCwUWuc4yqh4NePLSoYZghdSYVaCGHth6jQNKf5W69Qpxm+gE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30; Fri, 8 May
 2020 16:34:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 16:34:24 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] arm-bsp: linux-linaro-arm-5.4: Fix kernel menuconfig task
Date: Fri,  8 May 2020 17:34:02 +0100
Message-Id: <20200508163403.5987-4-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508163403.5987-1-bertrand.marquis@arm.com>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30 via Frontend Transport; Fri, 8 May 2020 16:34:24 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 583b4b71-2ffa-48cd-c785-08d7f36daf7f
X-MS-TrafficTypeDiagnostic: DB7PR08MB3484:|DB6PR0802MB2614:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2614CBACC7B34914CDF1B3589DA20@DB6PR0802MB2614.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:3276;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F1WiURQsVT16lvEKNlIo8g0G4VJxiBSYSy+uAsGo0tbMI+lJSXithidwM4QSEzEbLbgu/BU6oH+xTu3xymBc5fxHzKrnZ5i180L8USxlUitdLIhEu/kZjVKxcZCHRkoItbp5T0Slyc5xYlQoQZpdvv7J0/VWm58pI2D6AaDknZu6vGAcXnNJ7lmqWDt54oQbVvFjD4CVbjrU67jTmaMOE/HRmCTkq1zdiP3RqF7Mqk9e+oOC1/XJem1LxHPIHWmV1BC5c+CoyKc5eA8dvciix0DekMWqQleUzvMbZLb1fQKXM/eZXX6j8xj5I3J5/xl5NSOv/KtAUNuYzz2kpnmwV+qikxu4UmuORROU4S4dnCROcD88Cnr1llhWFJPzCkQa7ri6+tQm3xLY0wrOcGlHxKpaH0dbvT9iaYwYgKryZMDXMUv298kjT2QdyE+BwHaa67mma78/ltesYIz3Ofor/7DHLxWoa9Tmjw5SL5o/muvVLsdLgKkLvY2TAvOfEqYAk96m+M6DHLIHnbCi+M6La+ur+0Mt9bj6sTwdfVGreiSABoywPPrMDwmoasAjVIVI2HrbS+fEkYkIV97qRx2yww==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(33430700001)(7696005)(52116002)(5660300002)(2616005)(6916009)(26005)(4326008)(66946007)(16526019)(44832011)(316002)(1076003)(36756003)(6486002)(186003)(956004)(83320400001)(8936002)(83280400001)(478600001)(83310400001)(8676002)(2906002)(6666004)(66476007)(33440700001)(86362001)(66556008)(83290400001)(83300400001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UbNEvz72tt2pCgtV3WajY8m3wQsHkxvaxmiznOBkYoHAowBhfiwdmaX1+K/+bBt+DhrhyKRtm+gY1ms8Obrgx5t0EEJJq22N5IKKORUFIJiXyl3ub3sPHaJ0x9XWhAJpcbIwm+VpD4mgTHdcuCULUxQyupjjQYhRoe944yMbbq6lufwrwlzTCfOVa8P2vwqyfW+pXCe9NdOTOaxc+eFsFQ0enkWfWab7aOdhWlpuSju/qPLetDlYrrdPYn3JKmC460pDqOMrMsSdk3fg791SzJVOVh0KvmBcoHQ9aIPigz4uYjr2NPujS/6YGZm+hw9eVThXJrv4SliTdzGdenxHbE1NrpAkFZbasIHE13DLCxzv4yxFqZ/DdK/I0ySZFzXxj0JXk+/Cm55zgqzeEL72mIG0RlSUMcldsVQqRAv5S2rjj7ibjDFzkhV2rkxK+c+bb+prH6D2N71//VckPYmkrxBH3WdrtX1B5n5ZbzCKzRg=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3484
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(33430700001)(6486002)(86362001)(1076003)(336012)(5660300002)(44832011)(70586007)(70206006)(2616005)(33440700001)(4326008)(82740400003)(316002)(36906005)(81166007)(7696005)(6916009)(356005)(2906002)(26005)(956004)(82310400002)(47076004)(8676002)(36756003)(16526019)(186003)(478600001)(8936002)(6666004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	09d7e453-3344-4a64-561e-08d7f36daaf6
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8eWuODEGSMXqXg5hQStcxR12w6qEYL0DJ5dYUYkKnHX5YLX7dk5Y6Cbu0YwMMpwqRmnLqzY35yaJWjCWGIjvyEH0UgknBGP7P1IEV8pLaH42WY/DoCZfbLLuriMvJxFsqYE8o3pLLjdOL+8Vkc8S5RwYAAR8wNrleG0aMYauVi95/TUxcO1bTMSG3MTG16VnBN+fSd6QdsSx79Z8SHjCXnJJc7tg9sLbKblL5kHJNLJeb0ILdI/BqV3tGLngQV6JxdmmMIhpnPZ32wmP4x5/SoFEx3jAi00fSsU7/Bx1ocoUXNrQroMLBbkpWgjgtRtSLyK5B+B9NLXRzf7IBh60B9dSU8ZzljUjBMu8Zue+jmoMCNltOywFu8Cyx9bXlcCEPrbVVCAXwt8kjuFxZlZ8xIE4sAh7JmluompBh+oYQUeRhovHz/ukjrHjhMwPhmR9bEnqs/04eiIbnIjRe6Pqg2snqX+5YEQFXpAUSSpFSObB0h1uJh4e5CkVFtGu9pF28AifbSQX+YJyRmnPV9Ts00i1JRN5Ro79sT/hxfWyoOWmBc5XPfe+Dr/mQy39qteZR1c6MDSHdrd1cvfmHdxX02ShMoTN21VajLsb+FECSGuNfjTKyrWBC71XYBVnKm++
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 16:34:31.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 583b4b71-2ffa-48cd-c785-08d7f36daf7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2614
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

When calling `bitbake virtual/kernel -c menuconfig` it fails if the
ncurses-dev package is not installed on the host machine.

This patch makes usage of the ncurses library built by yocto if it
is present.

Change-Id: I261578f2934b225956e77ca4038a2df5603cc1b1
Issue-Id: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index 56e0f15..cc68ed3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -11,7 +11,9 @@ COMPATIBLE_MACHINE ?= ""
 # KBRANCH is set to n1sdp by default as there is no master branch on the repository
 KBRANCH = "n1sdp"
 
-SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;branch=${KBRANCH};"
+SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;branch=${KBRANCH}; \
+           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+          "
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 SRCREV = "${AUTOREV}"
-- 
2.17.1

