Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web12.11456.1591365253265825997
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 06:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=83RPefkO;
 spf=pass (domain: arm.com, ip: 40.107.21.73, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1zPA5F7hkLReZaTWfqGvAWBUa1G3NQOppa1eqQ/ySc=;
 b=83RPefkO4Nv9Gka8jZeY1+Irn1q735DsPKHRrN4bDCh6OoRXwxOEn9E1LUDsBGl/KfWwrEeDLVSWHLqawMIwMxSmLGrfb8VY6qZiKvUcdrnquqIy78nuSpmcR3o9Hbhbam6BiWNZAB53KeIZxP60RrrhE8pLL6z0EkYJ1PVyoNs=
Received: from DB8PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:110::36)
 by VI1PR0802MB2205.eurprd08.prod.outlook.com (2603:10a6:800:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Fri, 5 Jun
 2020 13:54:10 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::4f) by DB8PR04CA0026.outlook.office365.com
 (2603:10a6:10:110::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Fri, 5 Jun 2020 13:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 13:54:09 +0000
Received: ("Tessian outbound 3e82c366635e:v59"); Fri, 05 Jun 2020 13:54:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5f3169ef5c62976
X-CR-MTA-TID: 64aa7808
Received: from 35999e0ea0f6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A161B54B-CA08-4509-997A-E418A7183DF4.1;
	Fri, 05 Jun 2020 13:54:04 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 35999e0ea0f6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 Jun 2020 13:54:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpDZdYeYtmgXBRFHWpLnEjt2fOeoiLyrp2Ydu44VFv/oKhyNBHRUXfHt3ue/QNC1EW98nERDcseWcOFQT6NDyHYfRAKLNB6WYHBcNsUPmNPhiglIlcTxRXzyPN2Dntk2LUhq9cKEs08Y4ItJxpXzVRpTx4oJwm6GZIAVQr8cBtrpomuCOlkpeRq+mwk6SJ4mTNyowt7vu+jqDlG/K1OpsyXEYvX4ajvrHFJkpSnymwJRRLKTYHMglAsrvJ2kjHEqcUjww4GkJZ5R2tuMfnqHI4jytW0TLeocgqV7T74Kfpe/s05w1DSLTuCKgPsnTiQEV/TkrLkAlNPZ6Cl55v7GYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1zPA5F7hkLReZaTWfqGvAWBUa1G3NQOppa1eqQ/ySc=;
 b=FHtbFD1fvxauYbv350lFA0cZM2sVC8V/Xu3uP3sH2zsnuWurUA3TpBFn7Okp+JxLDPSsTlt20JQzwD3/hJSrgaO0hL70xU1vXXzxNtFeRgM0NAoDRUtU14AqZMNNpLb1tuoUV18ju2tQzCG1rcvrhhm6qjWIDeooUPkVp51cHX5jAaiPJAOWIxzzae4O1MyWlzhKaevcBRKw35JozCwqHOqpk4egPD+2yDudnjclO9xdrPBPCvzKLbHEn1gKtwoEvsnl4OnOj6T/ZE1eMfx7oCul4POcqyYilpBjNMuupLWboWDEGXmUWmElou97AneJlbTjIDjUs6iHcBUwR5u9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1zPA5F7hkLReZaTWfqGvAWBUa1G3NQOppa1eqQ/ySc=;
 b=83RPefkO4Nv9Gka8jZeY1+Irn1q735DsPKHRrN4bDCh6OoRXwxOEn9E1LUDsBGl/KfWwrEeDLVSWHLqawMIwMxSmLGrfb8VY6qZiKvUcdrnquqIy78nuSpmcR3o9Hbhbam6BiWNZAB53KeIZxP60RrrhE8pLL6z0EkYJ1PVyoNs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3154.eurprd08.prod.outlook.com (2603:10a6:208:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Fri, 5 Jun
 2020 13:54:03 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 13:54:03 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp, linux-linaro-arm: Don't perform SHA verification
Date: Fri,  5 Jun 2020 14:54:02 +0100
Message-Id: <1591365242-62744-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::25) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0205.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 13:54:03 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7df0105c-5eab-4648-ab67-08d80957ebf5
X-MS-TrafficTypeDiagnostic: AM0PR08MB3154:|VI1PR0802MB2205:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2205581AFD163207E964075D92860@VI1PR0802MB2205.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:962;OLM:962;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 v3PRpQJ1IeiwPm6ABaRwpTlfODZj5MHLKlBVtBidz/hteYiMO+5ihIctfmbblYiEzbfFf8yllefIQ1NaB7l/g5z3XtBKilpzpkiyP/Uudx5OZAqaxLMRM0niSJmdsLuPvcWhweEb7U8gqjsQ+t4GyuHXxL1rCH1RJhxxBBVWjxjKEA3eeA23jUsWWgofH4nSAv80RUw0NBYHo23XTacuM+NJ/IjQph75lrskQ0xK4dgqSxSRIIiIj5hBHJuRcPoOWtT1oYMkMlSaYc+0jWUF5z765C6PJZJe2hsTO4LgjM73gLFy8qfS33IAADHe4s9Ue08ygFNaTxALnZSmFTt5yFwH6cv2rg4NB9lP++QZ5hCpFPbAv7kHgwvmgDE6nCnMxuXIyTeWK2A0sqGbcg3OZw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(7696005)(6916009)(36756003)(8676002)(186003)(83380400001)(16526019)(86362001)(8936002)(66476007)(66946007)(316002)(2906002)(52116002)(6486002)(66556008)(4326008)(956004)(44832011)(26005)(2616005)(478600001)(5660300002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 LoGka0nXGsha7fb4zciiAH98stq63GlfqL6vreTPRQndTLYD0Bno3oGc/gh4nN6x6hKbN3UCzowN5osZ4tsnDuQmMGcvyJ038GhtZELLyQphSf5boGli/GpIApqjwk11MYbcqwL1EdpXW6uAiTC4a87fkhEOvxleRUx689GMA1YWmyKc63IeJLNdavUkmb5OrcrLGzKQhxfT/IsROpLryZmEm4W/1JjmxqQFccE58GcCEfnIe/9PqF8lBprU67acv9CiS26EogdF05kerA2ZUE29u41ab3xMXFUXhcoCmJUMHfqjuSQcJE6S61JKL4WibhC0NLZO6kfrYsxHsM6aJ+kK6SfkbzrLLg7p2B3c5PrCkJthwsma8ClJ3Byq++YlXXuLX7vs9igwYspYUv9/wZluH7wYJcTLiLxqWryllFYmn/o5OCShfFH0whz6RgPmvJfNlMCNcOq2OItWFQaIqDPTjAbXwJPSidBA5sWNY8t65cy6fzoTOZqEnfkV/DLS
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3154
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966005)(8936002)(16526019)(47076004)(316002)(82740400003)(4326008)(36756003)(44832011)(26005)(81166007)(2906002)(7696005)(356005)(478600001)(6486002)(83380400001)(8676002)(6916009)(82310400002)(5660300002)(70586007)(186003)(336012)(70206006)(956004)(86362001)(2616005)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee9ba222-02b8-42ec-096e-08d80957e7ea
X-Forefront-PRVS: 0425A67DEF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BWRjsNVSOd0M4Hq7ycHQS2fUrySM6JGkzZVwwhhfZjMTo/IKi/7q0ydzoQEXyhXRlulxb8wU+G6qK/QOY28i0EuG3waEVMvV+o4RXZnZ/qvra6SdJg6z1cCcew8BHzAVLFkAAjdp/quh18BgqAb0dUjHZBpvJq57HpGdepUbPqFWLvCdG7X/a/1AuXO0O/HiFPeeZuNbW30S1N+DZYi7v4QO82KpWYK36b8x2/ZbktU36qkCKcNAFd4Awec9xoWQTtOcR5DbKEP9blUOVKTuvT5WBdwWqafVFoPrJ6T55VKWkY1FgGZinM7WJLcjpjWSS5+hipezfb2JBXSZWrV6LTHpBnXcmDS5z3/bM425UBHigwNXuazfAsEr6R1S4zXLBINmPsGFaqPAAb0a+AeZ0Jzmvcci/MUr2BXoqU9gNI3l2dork2CKtw7WPzfCMLBXp6ESCJOqodZJIczkSWLskQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 13:54:09.8405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df0105c-5eab-4648-ab67-08d80957ebf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2205
Content-Type: text/plain

Since the Linaro kernel-release repo doesn't have a master branch and
the branches are force pushed, we need to have the nobranch=1 setting
in the SRC_URI and have the SRCREV pointing to TAG commit SHA the will
not get modified.

Change-Id: Id1ad6b57a6f11ec4dadd3647043e6f2f48f498d4
Issue-ID: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index fcc07a6..d2cd127 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -11,10 +11,11 @@ COMPATIBLE_MACHINE ?= "invalid"
 # KBRANCH is set to n1sdp by default as there is no master branch on the repository
 KBRANCH = "n1sdp"
 
-SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;branch=${KBRANCH}; \
+SRC_URI = "git://git.linaro.org/landing-teams/working/arm/kernel-release.git;nobranch=1 \
            file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
           "
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
-SRCREV = "${AUTOREV}"
+# Refer to commit TAG N1SDP-2020.03.26 since it will not get force pushed
+SRCREV = "137cccb0843e63b031acf67d1ca4f6447b8c417c"
 LINUX_VERSION ?= "${PV}"
-- 
2.7.4

