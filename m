Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.47])
 by mx.groups.io with SMTP id smtpd.web11.3672.1588849729155069490
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=d3j5K9Y6;
 spf=pass (domain: arm.com, ip: 40.107.7.47, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP51F7erq+sOqe0EM8tJu9s82CntaZc8w99N6WeJz50=;
 b=d3j5K9Y6SR5DMzoriNS3yeHVCnmR4CVfOkzKxiXRmNOp+DkUJ4si7AwZouo/zVp+QYjoLx5frvDt5DzirqaOO5Moryv+G/9F+lXckNOFA0RuodF27OZixl/Ksj7KRthAl5viBsEikmvP/zjPbmpvhpzKc/IQ+UMtWA1lbQPqK4k=
Received: from DB6PR0301CA0005.eurprd03.prod.outlook.com (2603:10a6:4:3e::15)
 by DB7PR08MB4588.eurprd08.prod.outlook.com (2603:10a6:10:75::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Thu, 7 May
 2020 11:08:44 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::3d) by DB6PR0301CA0005.outlook.office365.com
 (2603:10a6:4:3e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Thu, 7 May 2020 11:08:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:08:44 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Thu, 07 May 2020 11:08:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ecc99c0d2e2eb491
X-CR-MTA-TID: 64aa7808
Received: from 1d3da808186c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 34653C47-2E4D-4810-962F-7D4521EA8005.1;
	Thu, 07 May 2020 11:08:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d3da808186c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kmsv1yWbVIVK/t3jMQN4P2bSI5Vs3U3n64o/ywEseKvGI0VAke1jlAAjq2VN+EOpVtM3FWjIoxTB6ZFrYijZ6/NEfNnUlaStzhB43JS1iFktexMePJWNbMW+IwToqZpBDc2SnoMZIsD8QP/09hNNq0BZ7eLnznXOeAcXkW7y2JAPGZpwSABXd0pstXq4LbExrrNeUGnqWp0xhP2hUu14OqZRkuIMmqdc/kWP9wMnVPcqqkFPP5Sxfysr1FXxtA6UdGNKyn1Fjy+14lVMve6T4QFNANY9ya8Mb37Hfhy7BT0jzxB2dhMr+/1FvBurjVCv9nBNX9BcJGBwoGKQp5UWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP51F7erq+sOqe0EM8tJu9s82CntaZc8w99N6WeJz50=;
 b=SleHkuSgghRrB57EgxYAu3y288xZv1W6gBKfTl4DhVK7f8/cLYFtgKQEnGJ+ka45pguSw0v7V9c79u6LfBJQt23D+v0js6imOFW/bcCotpAhc9peDAWI4mHeErX7ql+zvc3YEgEp56cx/R/RvoUyELYAulfJ+pAj1zyd7koH/8SDOEyftgUH6+q1aHc8n3Tb+uUWBgu0Kw/87mI6GN76zccyYRz632R4H1j2+wvZXcsJXAsbESnQsBPTNJry2e/Me+lxBS33LBbwctwQhDK9XGVgXvs4ojwEtkDCseiErWuFNRoiJhGAvQ5qyBENmrFQiq2v9XWVZKctO8z05lr78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP51F7erq+sOqe0EM8tJu9s82CntaZc8w99N6WeJz50=;
 b=d3j5K9Y6SR5DMzoriNS3yeHVCnmR4CVfOkzKxiXRmNOp+DkUJ4si7AwZouo/zVp+QYjoLx5frvDt5DzirqaOO5Moryv+G/9F+lXckNOFA0RuodF27OZixl/Ksj7KRthAl5viBsEikmvP/zjPbmpvhpzKc/IQ+UMtWA1lbQPqK4k=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2954.eurprd08.prod.outlook.com (2603:10a6:5:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 11:08:38 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:08:38 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] [arm-autonomy] qemu: Split qemu into qemu and qemu-xen packages
Date: Thu,  7 May 2020 12:08:22 +0100
Message-Id: <20200507110825.38541-2-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507110825.38541-1-bertrand.marquis@arm.com>
References: <20200507110825.38541-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 11:08:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cade9009-840b-43f5-45cf-08d7f277021d
X-MS-TrafficTypeDiagnostic: DB7PR08MB2954:|DB7PR08MB4588:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB45884156FD38518E7F8CAAEA9DA50@DB7PR08MB4588.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 14ujIhHaRSkqXmp4iSkaWZqRgQUyzshnx/5DRHgjCdBUMZM+CP9TDh5IOpBcmX69bTt94046MieLW/YCo6eTwr3HPZyzK514yTpNAUXI2453P1lgPLdcj7a4F/jzB+1uuUAQ4uQXJ5F5tg1HqjacLLe5T1LG5WlJyCiJxkRnngXaqEGuzPxEyHDLbcqB54+ZUFRJOrOceH0DlmYy8aDNrodHIjl6LLTwYhTvMtkhTv1A0dfH24oNrmvFgXjxIsXgZIwdGii/xkJma+xrMem1mCOthlk67Z8NFAAtDoZP4wxRhIYH8OmGWkWoxU/spmHKivDojnd3qs/Qq8zPeEJDqveLtWxsN2NnWrLAyMWfczh5EsFQ0l/7U5/XtBLcVDxzuB1kk+1Yd0HdXOjsfJyrTxuY5yx8JukCixSiTgcarxkoKxfe1de5IeVO3s++gnpuALs1p9EGiilk4nruJqfVC62TvxaQE70LqogcmwDYEAQO+fe/qLql0mDTogx6JK5mHHeuThaZfzHvYgp+UqLs4Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(33430700001)(1076003)(16526019)(316002)(2616005)(8936002)(5660300002)(33440700001)(44832011)(66946007)(4326008)(66476007)(2906002)(186003)(956004)(52116002)(86362001)(83280400001)(83320400001)(83290400001)(26005)(36756003)(478600001)(83310400001)(6666004)(83300400001)(7696005)(8676002)(6486002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 pce8MiTCVnBFqhhtxSt7BfkajbJCTCQsIC2bd7YDPD5tQ3NJX6iDnP5G+08Rr5Qg5GO4WCxswq5vIgLKgiDRyPRO0TbqeFaf5tCJI0/nCmvKqX+XQBK/75hL6FE2v/jhggCBb3II9+5CkZotLWIG7mBQAlOPgSD10jBIh8NbezrtrB3A5yo1nRs85HEoAUEXCrNileY9CsK39+KUVdCakvsEa8+PglG3TGhQKQCr8oO7SPidV6rk8bwTCIsKpHjcDdxUYOTCRqBUs3iJgHMvBJBU0piSkrtPw7Vx7WlMq4tCiblbcGfuHOGxWXUMTUU3qB5bfF6MFRDYyMrx6sbokg6YSiNrLaVGYx2QNLPDQCgbhHTWGGyaLI3NHDfUZWPZYFysKNoMkT6B9hYn6jW57oyewuIxhk5xVoLP8FR29EgGbd/kTE6htRDU9k/DyRksqmnKnjziKk5Jt/W45IZ6ZiTm6JXypBbutdXsCXsM6tO2TRhH5A0KKy43CbFXr5/N6sbAzE3VQZqCT/UVY8jsRddOylg99eKueHiGlR0T1bbQBRZox589tLP5ps1Qc1Fc6TO7DtSX4BPvM5107nmibjJVu/PCUJO0RCxGgZmCY8FK7gAXvbAPw86EMFJkTOLqF5m3Ee8oX2yMnKEGWqCiPtlY4BvGBn8Ku1JYMkK9WV6EYHRltynmNpZplpk/C2+wSjgd+uCfj+dsIdBHDoiq5y/ZNJi3ph6PevsD8N16iqtJltVzx1pVA3Jl0U3HTyUzyGkPBB4/623+yL1PENyl9YO/WndLMQ4soCCwoJZXBfo=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2954
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(33430700001)(70586007)(33440700001)(186003)(6666004)(478600001)(5660300002)(7696005)(1076003)(26005)(8676002)(6916009)(82310400002)(8936002)(86362001)(316002)(81166007)(47076004)(70206006)(6486002)(2616005)(82740400003)(4326008)(44832011)(356005)(336012)(956004)(36756003)(2906002)(16526019);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	531add95-c9a2-4e42-2bf3-08d7f276fdfb
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nwm35cw0sVWAfeia8nCIH3p8LVAgmxtsf2MrvIgD/YSeIrxE0Bf6iGbjZc7/SFEIDHNpvnxzCQryKkCFnJF5Ih/LYG8LVhC6HgYz5WJVDeuH+oFpJIxfNKiMHNrg5LjNYkeEeQb5FGpoRnMO0u/htQkyg10wkwEnTO/PuVfUOsUYnmn7TzfXHYjVKN0WoVFnoqBGRydKWUGCGICP/n1cT4M1btvmDix2S+DodPzhJqUgV3NyQCpV11vZt0AW/ha1hiJT1Y9eaSbRGJPUmxvASkdYxgWhXRp1CJS2JobrPLI/BUsU5s6fqnTrcRkuqAcRHjQyhmRf5bSgN1/K9SZIfn1DEg54VK9Wsmg/X6sehYl8dMRNLTgo7EdUNgY7OwqLG7rF5WfljceFFXsRwsKwvaW7XuRzdb/ut4gIVIBQAqDc6cRub00sGj8SO/oz3ZLkrbEEOE7kW7f7WK0hiefA1haBk6rvM7+xafA7Yr2KLBeBhs9Ax2i+2LE4Ml9DysdG1RWfGBF/KeUsyCtnyYqkmZir33V62BtemFBn8+1qLLDZKHK73NDwH6615EdY5uxhZHJPKOaIdhMExaZflMZ9rA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:08:44.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cade9009-840b-43f5-45cf-08d7f277021d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4588
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

When xen is in DISTRO_FEATURES we split the qemu package and install
only the qemu-xen with /usr/bin/qemu-system-i386 binary in the image
to reduce its size.

Change-Id: I460e959eb87a180b1baa5a11dbbe7df100d5e6a6
Issue-Id: SCM-813
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../images/arm-autonomy-host-image-minimal.bb    |  2 +-
 .../recipes-devtools/qemu/qemu_%.bbappend        | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index d586110..71314cd 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -39,7 +39,7 @@ IMAGE_INSTALL += " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
     kernel-modules \
-    qemu \
+    qemu-xen \
     xenguest-manager \
     xenguest-network-bridge \
     "
diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
new file mode 100644
index 0000000..b80c293
--- /dev/null
+++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
@@ -0,0 +1,16 @@
+# Use OVERRIDES to minimize the usage of
+# ${@bb.utils.contains('DISTRO_FEATURES', 'xen', ...
+OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d)}"
+
+# For Xen we only need the i386 binaries
+QEMU_TARGETS_xen = "i386"
+PACKAGECONFIG_append_xen = " virtfs"
+PACKAGECONFIG_remove_xen = "sdl"
+
+# Reduce the qemu package size by splitting it into
+# qemu and qemu-xen packages
+PACKAGES_prepend_xen := "${PN}-xen"
+RDEPENDS_${PN}_xen += "${PN}-xen"
+FILES_${PN}-xen_xen = "${bindir}/qemu-system-i386"
+RDEPENDS_${PN}-xen_xen += "xen-tools-libxenstore xen-tools-libxenctrl \
+    xen-tools-libxenguest"
-- 
2.17.1

