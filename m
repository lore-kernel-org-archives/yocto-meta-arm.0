Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.57])
 by mx.groups.io with SMTP id smtpd.web11.15287.1603300491473869457
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 10:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GqndHs/5;
 spf=pass (domain: arm.com, ip: 40.107.2.57, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtoDpLrBTzMhkzSj7sfvx/SBqL1pJOuy/TwodI5bkm8=;
 b=GqndHs/5JE4Bdj+Y1rMP3f5K05xQ0jBHxa03ca/BIJJLahrp8mHgdpAJYiXYsKVnRC5uu3ktdBe8teCJi16Sf1O4wih/Eq32lTyOIO9f4xUtIgFSonFZvu8PRfoQe6OojAi8fspN2G/dOKXPxExzQYORn8v9nDgj1i+kFeJQVWs=
Received: from DB6PR0601CA0030.eurprd06.prod.outlook.com (2603:10a6:4:17::16)
 by DB6PR0802MB2184.eurprd08.prod.outlook.com (2603:10a6:4:83::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Wed, 21 Oct
 2020 17:14:48 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::12) by DB6PR0601CA0030.outlook.office365.com
 (2603:10a6:4:17::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 17:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 17:14:48 +0000
Received: ("Tessian outbound c189680f801b:v64"); Wed, 21 Oct 2020 17:14:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 506054a0dfda6700
X-CR-MTA-TID: 64aa7808
Received: from a00a1f2ba81b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3A10C170-48D9-48B5-8058-8693C0CCF697.1;
	Wed, 21 Oct 2020 17:10:45 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a00a1f2ba81b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Oct 2020 17:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNSlKp0UlIijGOpEUYnb338awYTI04FxVsns/KnTDQdN8K46T0OQ0mhCltY789g7a4B5N7xOp4AYONTeAd9rb7bJmPcJx4f96ywG1kWgHN+/LSSpo7/HMIi8NJNZC3lCIIk4rMxIP5cfr56yy1mBE8+taNe557Bb47ysjfQV5L4fuyPfVbxN6gvuFWB4fkTES4rC17PkRInpkD4918I8dM0F2hPZaqLuswrUJl1KNjdQwKQNfgHxc4Hbs6BmambFywYqlUrpJprK5GYmM3nZXUmi0DdDxL9pHKYqT5yeJYMVrK+GTU79HOGv8Na0ACDQNzJDLR1aJlaDzEurRSSQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtoDpLrBTzMhkzSj7sfvx/SBqL1pJOuy/TwodI5bkm8=;
 b=du0VoDfDD84J9hFm0QqIRwgS8hKAtFNVrj6X9YAwdO1dg1G4En54yW3yTNd6YW20YYouUvVdofzKah96djnt3jjxCzSrwIGxleuam643xbGWuAorrcXOGNzAbXmxcufWeYBk46PafRJC/IUJHeGIgqklwEwjX3pNxKb/bsWrz4HpH/p3GoN9WorKKP/Ho7ZztPpO8yTUx5gaIrMioKnp6mNdU6gvPEkPiIbdEKI9MUDxYefIxTMOEXaXp1juG3wBQnTeFV2r0+4Udp+JtH5f+fAQdkNDOAWrPu4iQIs7134CRdG+DC4dK4YJ6zpvpKgEXzeJPp4cQf5xRHUyXbRWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtoDpLrBTzMhkzSj7sfvx/SBqL1pJOuy/TwodI5bkm8=;
 b=GqndHs/5JE4Bdj+Y1rMP3f5K05xQ0jBHxa03ca/BIJJLahrp8mHgdpAJYiXYsKVnRC5uu3ktdBe8teCJi16Sf1O4wih/Eq32lTyOIO9f4xUtIgFSonFZvu8PRfoQe6OojAi8fspN2G/dOKXPxExzQYORn8v9nDgj1i+kFeJQVWs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com (2603:10a6:10:49::17)
 by DBBPR08MB6092.eurprd08.prod.outlook.com (2603:10a6:10:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 21 Oct
 2020 17:10:43 +0000
Received: from DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32]) by DB7PR08MB3531.eurprd08.prod.outlook.com
 ([fe80::e927:94f1:8ae1:aa32%5]) with mapi id 15.20.3477.029; Wed, 21 Oct 2020
 17:10:43 +0000
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH] arm-bsp/corstone700-test-app: adding test recipe for systems comms
Date: Wed, 21 Oct 2020 18:10:33 +0100
Message-Id: <20201021171033.21198-1-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::26) To DB7PR08MB3531.eurprd08.prod.outlook.com
 (2603:10a6:10:49::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by LO2P265CA0110.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 21 Oct 2020 17:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94c6d923-9730-431d-ccd2-08d875e4d0c3
X-MS-TrafficTypeDiagnostic: DBBPR08MB6092:|DB6PR0802MB2184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB21847FF3244C805274C31407FD1C0@DB6PR0802MB2184.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:363;OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 T1fERuSZZ/8KSDKdTq4t6ylfN631GGv2FOp18/57E8Slgtf4gsuJ7ir/PwMbCegO4C/shDI+Y9w1scAItm1ufr2ngWlr4mTCLUbcMbZUJ9ftiROn1aJ+kh05QAhfaXr9e3GATZpKyIoUy2i7ybcoRYjtLR2WhCqjuYkxMQLJiIUr+WrO0I2fpiq/fOqV5Q9MruaQKFFzhpV5VBNXu7L08y2Bt3xKvIUSeXaN9kX1mKzcKbKFVpAJWqZZHoGqcwxuDOh74BJkJ/tY2w6zq2se6wjbvW70xQ0HhWtnv2HQCoZSuuXiLGARIxJxE6bHhewh+1FaMDEpRPcRBp3YaqqGByBsyykVyHc1Lhz4u6RQo9YSkN9TihtuWTeUZ63xyv0Dh2ll/y3rd4cxdFXTX8JtPw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3531.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(956004)(1076003)(8936002)(26005)(2616005)(8676002)(2906002)(6666004)(86362001)(36756003)(478600001)(186003)(52116002)(4326008)(6486002)(66476007)(66556008)(66946007)(5660300002)(9686003)(16526019)(316002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 q3rADi4fY1oaDj78vmfiVlEBqY8E4GiA7L1dQ9chNwEkphEu4MPPgsyP4T95UZkp1RyXv9kMlrHqWfHBEH4k2/fqf+Rv6vVScCQJaaJCfKJuTnAY5MEsUr76HzrLBFoB8XqlOgPq4h+0ffOPYZCl3BlB6JupYtn4MLbKGZ1w0Kf3cquDEHH9Ss8a8o5w1x42Xeyl91EvDFUxDjv0vOQx9QzObNZnXYxOtoqs6nEiZBsKleNjg9N0BEnMRDo1s5U91hvwy72BAF9utFrvnqqonH55GjBwTWI0f95KylNf9FMo/Gsgtza+40rjz9GPAVPrqJSYTSc/TzInHaKK70rs5yWNuyyvjExJ7fnyagGY5bKgUeaKWsxJcBkeSdGmB4cEOfd162EzVR0/zJ2NM0o463U+C0ddzKz1VEKlvtXb8BnS6jQ/hfsRFDr5HrP0yMGN9mtvlLXJzbVmlurBGi4wd2aZDZrVHR/pVULR9PsiaR9tKhjDHfXnjA6QjpEMUCPm7/MO7ivpwEG3HdpDOzPEvL31ZAYM2NyThYvSaUEQA2Raxq62v9i/VFFc45y6CRyeRI20q8Cf9VHAQOOQYaEyaO+sH4FYrxQBO6t9nAsFjndoLzp+6UvfLXupSHwKPmdXNbBl7nO+lR4aw2yYtG75sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6092
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	207258c2-bb06-49e6-c10f-08d875e43e4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1vu0UwvBdhIYXStPCjuDj3X9s9fEi1XRPllHf5uMbhlAh2e/aCMMUHdLzNd4ZRAC5PWzakENrsuUkJQd0sluUCIC4512F7VRHo75ztwiV2LltEFLkALeDQBbpGw1UFV5kbqTldxxFGannYcZ+sntCR8edxo2uh3AP/s1rW5eev+Kz5gMLZ9yuE5E097OsSOQPSbPIm5pqxpxiktcZhkvgDRTv+mYVJQ2rZzoIFEnurnwV2icAvdvLZMtEgO8eDsOsdcqIgRrW7QcVkjTbfMLVk1oOj1oAXlwgeN8foemDjUWwzBmFdXjXaadMJifLGL0io7g5D9xPTlKAknClJI3RQAfENAl6D413eGLntzFcsvFZq8Br2A/05Sb31NgFfXXvjKJvzh6zBDSjxcGkzgqphUujauf7axfUukZPlVvT9dSwvv3eW4LmRRiNaTKvo6nau4o7kHiQLwpTx0GwDu+WZKvA83Ja1SDn0UhrBUhHfI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966005)(2906002)(6666004)(70586007)(70206006)(26005)(316002)(86362001)(9686003)(4326008)(956004)(2616005)(82310400003)(81166007)(7696005)(36756003)(1076003)(8936002)(16526019)(47076004)(6486002)(186003)(5660300002)(8676002)(478600001)(82740400003)(336012)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2020 17:14:48.8341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c6d923-9730-431d-ccd2-08d875e4d0c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2184
Content-Type: text/plain

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit provides a recipe that generates a Linux userspace
application used for testing the communication between Corstone700 cores.

Change-Id: I7c00653b0fcd6d9074510bbb70a838762aed0150
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 .../corstone700-test-app_1.0.bb               | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb

diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
new file mode 100644
index 0000000..d2bfb19
--- /dev/null
+++ b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app_1.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "CORSTONE700 systems communications tests"
+DESCRIPTION = "This is a Linux userspace tool to test the communication between Corstone700 cores"
+HOMEPAGE = "https://git.linaro.org/landing-teams/working/arm/test-apps.git"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://license.md;md5=e44b2531cd6ffe9dece394dbe988d9a0"
+
+SRC_URI = "git://git.linaro.org/landing-teams/working/arm/test-apps.git;protocol=https"
+SRCREV = "ecd93a275d11cf08f670a97783110bd698250963"
+PV .= "~git${SRCPV}"
+
+COMPATIBLE_MACHINE = "(corstone700)"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/test-app
+}
+
+do_install() {
+    install -D -p -m 0755 ${S}/test-app ${D}${bindir}/test-app
+}
-- 
2.17.1

