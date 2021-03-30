Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web11.4093.1617109373185555768
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 06:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oHfggkkd;
 spf=pass (domain: arm.com, ip: 40.107.21.45, mailfrom: jack.davison@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEJ17tOAyg9/yfsKwvexVASyzUX8Phlv/CZszO+//eQ=;
 b=oHfggkkdcbDq+DWMC0+w6pSYthAKb23EI0D2pku6AMFQuyFUY0WY4SsWAhWZqD/s2AFnJBt5zquWPOPqyBrrA0TCtU94Mvy/yAd/znZ2AhptRtycQHJz8J8onUNICIHF/qd8h5GKyzVp7wA3/m0qoKxPcq+oAErBC97135wMFDE=
Received: from AS8PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:20b:331::14)
 by PA4PR08MB6158.eurprd08.prod.outlook.com (2603:10a6:102:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 13:02:50 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::cb) by AS8PR04CA0159.outlook.office365.com
 (2603:10a6:20b:331::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Tue, 30 Mar 2021 13:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 13:02:50 +0000
Received: ("Tessian outbound 001a76fead4a:v89"); Tue, 30 Mar 2021 13:02:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a8ba99ff7a7dbee1
X-CR-MTA-TID: 64aa7808
Received: from fc50aaaf6bda.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D055D242-7D26-4609-921D-0AAD4E85D357.1;
	Tue, 30 Mar 2021 13:02:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fc50aaaf6bda.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 30 Mar 2021 13:02:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aft0qeTJSFdDNFqS6JzBt98g155sQ65IYbfBRFyPOKCylPZM6Gsc4t2eqzkXHfye3WPgyIu+U5L/QRQk5XyG8ChDS3ymIp+MOhu+7tgwRg5sTvCF1Kh2fo6Kd45ERqEnwmf6u4GNQx10ahoh2i7CQxbHAGMLe8b2evjrgczV9E9jXM1milSDW92d/6PJO8pnKCwZVwiKGWLWOG/XwJcmyDEvB7L884uSUKs4mkysu9sNnrM7050dSeuqKMXMKYgRaqiRiy3uYosjEgQhFDrrGTEtZhG+3Rw4YCzp59AIaw02bGR3iMeAH15y/jMZaHqI3GiizA6yNX9LPRaewJeEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEJ17tOAyg9/yfsKwvexVASyzUX8Phlv/CZszO+//eQ=;
 b=cdc5lAUe4u0z2EdCuPh18LEiMKDweYa9zH/Or89wyWpRBY7B4hVnY/B2ZHYaXUEPEcXwfmogS9q7u9PYikTB1SCA2RxWXa7d1B3wTOwVK3bpu6VSn2CE7Hdtsjfqs53h/SFuEbsKJMkJ6U+0vRvx3NnztzOjGvLmrRSUPpVfKnX7lx1KYYeVhT5b/iJ3XSocMOlerb1MdXbceLLTIES5nPRP24uGuGW/sZgDSRlaHXI4CP8qtWwzrJ3MrBLa2+2ThMXQ/dNHlsmkGPRJ+Ewj1tiH+fDPfpwOXQzsjR0trrZRKTtqejh2gWYL6dnK4Kv8/5yN0E783PhWaiS7Gwfwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEJ17tOAyg9/yfsKwvexVASyzUX8Phlv/CZszO+//eQ=;
 b=oHfggkkdcbDq+DWMC0+w6pSYthAKb23EI0D2pku6AMFQuyFUY0WY4SsWAhWZqD/s2AFnJBt5zquWPOPqyBrrA0TCtU94Mvy/yAd/znZ2AhptRtycQHJz8J8onUNICIHF/qd8h5GKyzVp7wA3/m0qoKxPcq+oAErBC97135wMFDE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4967.eurprd08.prod.outlook.com (2603:10a6:20b:e8::13)
 by AM5PR0801MB2003.eurprd08.prod.outlook.com (2603:10a6:203:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Tue, 30 Mar
 2021 13:02:37 +0000
Received: from AM6PR08MB4967.eurprd08.prod.outlook.com
 ([fe80::5858:8e60:48ca:52c0]) by AM6PR08MB4967.eurprd08.prod.outlook.com
 ([fe80::5858:8e60:48ca:52c0%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 13:02:37 +0000
From: "Jack Davison" <jack.davison@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Jack Davison <jack.davison@arm.com>
Subject: [PATCH] arm: Enable ptest for optee xtest
Date: Tue, 30 Mar 2021 14:02:15 +0100
Message-Id: <20210330130215.40423-1-jack.davison@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To AM6PR08MB4967.eurprd08.prod.outlook.com
 (2603:10a6:20b:e8::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123352-lin.cambridge.arm.com (217.140.106.54) by LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32 via Frontend Transport; Tue, 30 Mar 2021 13:02:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 80a94e01-8696-441c-f89e-08d8f37c1fb5
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2003:|PA4PR08MB6158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6158B3ED343872809618120D8E7D9@PA4PR08MB6158.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VOYtToeOjZE6p5O9e8oMgN6HdRRIqvCcGg0rVo/teixDWErGTaZUzCoiDcXXyqXcR4slYmJjkfnfN09iJZlkrMRmjxoMLx18nmT0HIvYUxsi4avCnDUe+Lor4EJsUlrI34nx4F4GKWQUD0m6ZeD9klQSDvnoR6i3btuRp09FAVm3iHxwgkHaEFdxAbSJ2TOzVR15J/V1jx1Y6CPKHIwnSq4MBIi8FAnqkIV7y7tObS4zEP3acQBQHb1CunXW/Ji+IROv5gtPTV5VrjMqVU1livrvXQVN7x5CLdgRQWs7oDZ4nP/OGUt8XV4NJy8SorEyxwQWOlEn+vuisgmf9wwO7R+5sbTWg6lfHOcsWK6ccGX3KSHxVd74k/r7h9umJtIBu+/zeGnYhgZCAiaEwFdP2iQn7Lq6CU/zr9NoOj1KuOl+svd1b6hmJfbYvD1XspWon4MYdmd2+3clllyvQ32nCgl4eofowFtAAhN6GJ5no+k3T/cKOUyjL8vjJDVaEIepgSXeA+YXHH7aS0P+WQMFi6aWZkHX2ubzHJZjVQ5qIFqfFc95CH79W0KF5XD/xqbDWt+hMCnMXLPnsFDZfmfeBhoHoPa5i1F3FM5KHNaEP3glffpYQ93OlU1xtvXm6srpZjgxrpy3XET+Ns5nfYbBIVnqADPKpZgB7xEV/nQ7TSb+MCr4EHp89zpA7sOGSkN9Wxkmk3YoNVsx3zwvSPQ93fVeObLcctLuJBB7rty3FDo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(66476007)(2616005)(6666004)(66946007)(956004)(38100700001)(44832011)(66556008)(52116002)(6916009)(8676002)(5660300002)(4326008)(2906002)(86362001)(316002)(478600001)(7696005)(16526019)(186003)(26005)(36756003)(83380400001)(6486002)(1076003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?Z3T6YNmibqBF6QLR3dty2GUj9IYGji5Wf5J9VaVxd03sowzOAhR5xZVEw+ub?=
 =?us-ascii?Q?45DAqUiJ2Sx3BTtoM03larL7/oIcIhYDNcbj3IciIl1nG9UmQddSbIHaYbAL?=
 =?us-ascii?Q?jLe0zh88bTETGmPAcxsmHzzD48Kg+1UHNanDjSNB8axDMIpYgvuarjabqrya?=
 =?us-ascii?Q?kAWFoiRJmdKB7id9tsn1EzF/dcAFjrBw4u6PP8fXgvtVOCXprZcSquhcEyx2?=
 =?us-ascii?Q?ybAoBZ4G+XN9t+p/Hku/s2a31lvZIFPyMWGkdW6cI8CukDMkmfJPfraZwlIC?=
 =?us-ascii?Q?2VEbCjjNc5aOGHY/v1j/5rhKzGy6K1/NRYjcD8MSivO6qqitcZeDIz30g0OY?=
 =?us-ascii?Q?T2aPf3YnYtpWECqbmAsnXhrZ43wH6EbsN2gY93N8+gMrXN8pKqT/JOLR6KI3?=
 =?us-ascii?Q?7B7P9i+ZC/pC006cwwGuXAOizCgmK0ozqSDMV6AjSPHaFcTZreog0kh3OFyb?=
 =?us-ascii?Q?NnCkebFsu6xMJb6mpqDwhHISAPTci25tPsRd1G9A82+lnVY8rqmsNnJeksmk?=
 =?us-ascii?Q?KtxlqKDsgHEl5NVUwjaKhtDSoaYN3Q2O9P9A2OagMD9QzBRP08rigKIemkUc?=
 =?us-ascii?Q?MJigMHd7CC2i5xeEi4dtRUFHkUdUyTC2k/jnDIW5xvFHt9CZz5XfEO+gkguT?=
 =?us-ascii?Q?YUEaDJhn+87dw2OkSVOn6Gxa2205uNaDZqVjmAir5TufpKBWIbmrymJj4e89?=
 =?us-ascii?Q?To+73GPY1XkqlZ1EmBSaixkyxq6tekNt+lx9S0tWc7Cg3V1XZqJY4YAkn14x?=
 =?us-ascii?Q?A2vOAoUs0nUiO/k7G3I1a8p0asoUNHkKelMax3yh2W2u+GWfGCrjOcGM1UkB?=
 =?us-ascii?Q?yBfYT/wxcyM3P6Zl0+YeKyZOpksVw2PvHoPyLSMn+TMBiVS75c03ZizWYqGm?=
 =?us-ascii?Q?VbSHFXf6uaTcooDM2v+41OPzfukT/VvFRUm6Vvmj7jx9N6J4vdZIORkEQzU4?=
 =?us-ascii?Q?v4ocLLFktp2rQn5vHKvzPboJe7fG4KWKGIjaKaHAdtOigLDs6bioG30E1orA?=
 =?us-ascii?Q?aP70nU4lnBUPSazuRj1pUBQNzVbZ39Dcpm3y6XlUUbGhkZqGocARbIBiB1xH?=
 =?us-ascii?Q?f0LvfSsLYiecBRW95NOk/A7HuoqPn31CsIa9hAUlzaYcnczz1PAqFYPZD3Kp?=
 =?us-ascii?Q?xQdsCNQ5NTHjy5UFlgq3yYunwMB3WwbbUFkd24UU1DQIAXvMvWajD/U3vUoq?=
 =?us-ascii?Q?BzYMF3pkNQFWHYZw6gIe17XdYEV1b1GU7GwIiVxcirGEkQhhNUw8RaqXEpcE?=
 =?us-ascii?Q?D5mIyxXnd2zYUWRGOuKRS2P5t1JIFUElTuq9Mw+utskwzClwiTv7/GaA4PIj?=
 =?us-ascii?Q?MzBu5L5orW9V7ZAQ7zZYp9l6?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2003
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jack.Davison@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9092353b-5d4b-452a-dfb4-08d8f37c175e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uB7hBY8ddB3quP4WIcG8RuDAmIrf5nbsE2UKPXgF8HkFdkCTZRx67IpiNaCPD6iB0CP7YycuZPrOHFJjlSSVgVFoeTvSth9sJdFgyFY8UTTxpOsSUJNDaJnrA4MYSbtf3y5hPNeiRgJ93ifTbGvfKomYXCaptgS49uPNcDMitvZ+Cy+xh7NoUlDQQTqJzGxYoA35x7toEmi9rc/xaRddKyUYaa+7q1Fv1XVmzcpwizbdVfnEKFum2vNtNlbnQuub7wZl4jBlfpUVtWL0TBSgl3HA2HsmluIULktm1mIauw4akuBERjU46e4UiBQN7B3KQf14vEgNAFZpIoCIwXnmnlBKR3ETNCyczojfSzGuBaBOQ0p6auM5Zy3ZTP7KYPehPjVrkKNojlcOfBgWmroeuVMg8dz2K5hUujHM73iq4xctC5YOI3Q0Rfs8dGqcZ6VMGVkKtN9O3nFE6BeNKCa7qEGNFYiO+MWcq3zP2byxIM2ESFXh3kOrhmfKH3GKgPzG3Jg08OrCeET2tpNOxnUyg3Ykae91A1rYfQHjBjvW/gcs9TsN541q/mGzfJDY7+iUxEJ9iWoMhkzdzvfveer4+EIk30zp1bNmKBGBEN6uUDX/QfdRShOSXpJ0PHsH1ZnjyQ2LspXwA6E7+JbbxTDmkg6ZGTzGHSBsi8B9Ph4nE5B0xDcA649w4K/zUmil/xKp7ydJfWao0wQpZHHbsOOa/vm51ms3MudahgxBLlMse4I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(36840700001)(46966006)(956004)(2906002)(4326008)(36860700001)(26005)(16526019)(186003)(7696005)(36756003)(44832011)(336012)(8676002)(82740400003)(2616005)(356005)(1076003)(47076005)(70206006)(6666004)(70586007)(6916009)(86362001)(82310400003)(6486002)(5660300002)(8936002)(316002)(81166007)(478600001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 13:02:50.5829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a94e01-8696-441c-f89e-08d8f37c1fb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6158
Content-Type: text/plain

Provides a run-ptest script for running xtest under ptest-runner. This
script parses the output of xtest and converts it to Automake's test
format.

Change-Id: I7c981422034b39701ddd74e176f2f5134ae607e6
Signed-off-by: Jack Davison <jack.davison@arm.com>
---
 .../recipes-security/optee/optee-test.inc     |  3 +-
 .../optee/optee-test/run-ptest                | 52 +++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100755 meta-arm/recipes-security/optee/optee-test/run-ptest

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
index 969d5e2..877bdeb 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD & GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
 
-inherit python3native
+inherit python3native ptest
 require optee.inc
 
 # Linking fails on musl due to C++/threads
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
            file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \ 
            file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
+           file://run-ptest \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta-arm/recipes-security/optee/optee-test/run-ptest b/meta-arm/recipes-security/optee/optee-test/run-ptest
new file mode 100755
index 0000000..ba88c14
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/run-ptest
@@ -0,0 +1,52 @@
+#!/bin/sh
+xtest | awk '
+
+    # Escapes the special characters in a string so that, when
+    # included in a regex, it represents a literal match
+    function regx_escape_literal(str,    ret) {
+        ret = str
+        gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(\)\|]/ , "\\\\&", str)
+        return str
+    }
+
+    # Returns the simple test formatted name
+    function name(n,    ret) {
+        ret = n
+        gsub(/\./, " ", ret)
+        return ret
+    }
+
+    # Returns the simple test formatted result
+    function result(res) {
+        if(res ~ /OK/) {
+            return "PASS"
+        } else if(res ~ /FAILED/) {
+            return "FAIL"
+        }
+    }
+
+    function parse(name, description,     has_subtests, result_line) {
+        has_subtests = 0
+
+        # Consume every line up to the result line
+        result_line = "  " regx_escape_literal(name) " (OK|FAILED)"
+        do {
+            getline
+
+            # If this is a subtest (denoted by an "o" bullet) then subparse
+            if($0 ~ /^o /) {
+                parse($2, description " : " substr($0, index($0, $3)))
+                has_subtests = 1
+            }
+        } while ($0 !~ result_line)
+
+        # Only print the results for the deepest nested subtests
+        if(!has_subtests) {
+            print result($2) ": " name(name) " - " description
+        }
+    }
+
+    # Start parsing at the beginning of every test (denoted by a "*" bullet)
+    /^\* / { parse($2, substr($0, index($0, $3))) }
+
+'
-- 
2.17.1

