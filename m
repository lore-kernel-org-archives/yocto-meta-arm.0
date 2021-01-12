Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.80])
 by mx.groups.io with SMTP id smtpd.web12.10431.1610464876925189226
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Zb53rrql;
 spf=pass (domain: arm.com, ip: 40.107.4.80, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wmINDcfkJzB2fmAW2tUTKSN0EnYD+WO8hzWNAA6bF0=;
 b=Zb53rrqlXf954YE9X3j7YvnKvaNPO6MTJZgkzknNGTDPE+YpXgC8lIXxmotv79mtLiUK7eSt2gkq9UygoUmAItZXnJwLF4d8gOamC+ZYYWREzx7lsy3aELBZMuMnUWhevf7c58ntSVaMxTngTaiQ1neImIiM9jNFCE496wv9Wy4=
Received: from AS8PR04CA0262.eurprd04.prod.outlook.com (2603:10a6:20b:330::27)
 by HE1PR0801MB2090.eurprd08.prod.outlook.com (2603:10a6:3:4c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:12 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::97) by AS8PR04CA0262.outlook.office365.com
 (2603:10a6:20b:330::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:12 +0000
Received: ("Tessian outbound 8418c949a3fa:v71"); Tue, 12 Jan 2021 15:21:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca472124d2305072
X-CR-MTA-TID: 64aa7808
Received: from 964941459468.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 29B2AF3A-5810-4A07-9DA2-7C285B70CE6F.1;
	Tue, 12 Jan 2021 15:21:05 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 964941459468.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1bg1048BcNb75P1Sb2TI24ovlD8QqHOfLreByMqUSdbKa2yaSQdCSi/1h3P8ommW1Hao9r6zdna4cu44+ygIQwHECOV6Kbq98UPkYmqAQeOJgs4BmEi+trfobIP2n33xtyE1t1El60Z4qqWSU+RaXPEeJcaD01UEu2thTri+Zsv8jtHCjsiTspJvSxdf3naNxhjp7cekgNsyHVlwGatJSqJYTBuc1E+w9evjdAxei0krt0R8cg8XFmQNvpKJdEiESJDt6l+TEHyotZQEiptYb5F+Qbm9eZs52ch4c/nuqCjpEFwMrbNcbt28Lm9VDie4JEHugMSku2dcd281CVw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wmINDcfkJzB2fmAW2tUTKSN0EnYD+WO8hzWNAA6bF0=;
 b=R3SXeHENywMb3VJzhyyWxFxMNI2MXjgwXCelnEfu0pnbuthKXqbFXGnohz//DBEK1f+dW/vejDDbAT6ZxHFi+dwyFmR4gchVLGrlCwmar6nSFqaFwj+GFVW19B5pWeQKisQJW6KHfM7dHRK8B9XdXaSNqOwwZ76jh9UeU1pjoohabhlaEMI8PtpcP6ZDoBc+n7g6W6FjtfNG+h8Vrkkz7UM2TpyVUXjmMDr0DI2gGHntygtwvZhjQRtKV5BkhCCZ6G/X/FQH6E/zBgIX27fLBgdyAL8vnFPGR00bz5tcrtCU41rWShqjZsDTkuIlI8fLcEjieXdv2zoO8/B4rCQSMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wmINDcfkJzB2fmAW2tUTKSN0EnYD+WO8hzWNAA6bF0=;
 b=Zb53rrqlXf954YE9X3j7YvnKvaNPO6MTJZgkzknNGTDPE+YpXgC8lIXxmotv79mtLiUK7eSt2gkq9UygoUmAItZXnJwLF4d8gOamC+ZYYWREzx7lsy3aELBZMuMnUWhevf7c58ntSVaMxTngTaiQ1neImIiM9jNFCE496wv9Wy4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3055.eurprd08.prod.outlook.com (2603:10a6:803:4e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:03 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:03 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 05/10] arm-bsp/tc0: Add tc0 platform support patches for optee
Date: Tue, 12 Jan 2021 15:20:44 +0000
Message-ID: <20210112152049.3436645-5-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49e1d7aa-ba50-4a29-991d-08d8b70db20f
X-MS-TrafficTypeDiagnostic: VI1PR08MB3055:|HE1PR0801MB2090:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB20909226C6E5E8EC7327443BFBAA0@HE1PR0801MB2090.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:353;OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: E6P++5xVoeAe9PqG4AkE/ZW//t+35/lrTZp/V9LlUemOU3RrmKwnbOKT0epITDqJnu8Qjughf/dexO1wuQJmrtXcXs4TsmtnIlBWx24AP8kGzZLB5YuUxW8GD3j2BmtdNKsZY5QCWKh171CQP7/uX/mf/zimoOZCxXkz0R4zc9hv1NVtz8kslaQoA2ZzVUjSV3dO9QKJEeQQpGyEtz6ypFswm6j56F8TPp31ayRz6bvK9SC1Wcx9NSjE7FDkvZWdpjeYUAHJqBgb+8ilwD8Ph8Tc11s3vBiVvcMKAEZXBIORDVDwGZgjVIMgUdWd4QDVHNisChRkuL4sdbR7bGufKxSaZV+iX0E0UCVMa61XjSD/rnqtviy6/DbqI66DGLQ33NA+iN9vw1JtWJAQLM9p7Mi09ghUiFm7TYnxsI7skxOyWbARL8ccq4n3zOnf2ysFrU1b4oczTm8xqEQCAJ+1D42D6ZOhOh9SgC3Yxcl+v54D0cqHg9MGbDAJc0GtJcZyL1X6/KvYjT9+jmiFyE7mqQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39850400004)(6916009)(6666004)(1076003)(6486002)(5660300002)(30864003)(4326008)(316002)(7696005)(16526019)(66556008)(66476007)(956004)(36756003)(478600001)(26005)(186003)(2906002)(44832011)(19627235002)(966005)(66946007)(8676002)(52116002)(2616005)(86362001)(8936002)(83380400001)(21314003)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bE0obLYzVMwvCXz0jCoAt8ne+r6mczMcPbXYJVgKPZWE06zKKcVWbfxASqaj?=
 =?us-ascii?Q?ezJxrPpJOrNBZJaQzPFQ2P4DYuCf4cjwPdiS9nC5Onktdzaq/jSDp2FDPvIP?=
 =?us-ascii?Q?VJPUalxk429pxn+HmNuNk/9kfdKxrVa0ny/6T1uURtkru17nJ22dmmK+RaUn?=
 =?us-ascii?Q?6+fJ7mQ4sf8ebeuE/da+CWtWm5T4ct4d3lKAWCcNECJ0VyCCNcQW9pFwj52r?=
 =?us-ascii?Q?f7W+jaVrbQisePgX4Jo4E4El70cdubATLZdjOMJmrq/iZbILBVLOc/asD+v5?=
 =?us-ascii?Q?iEv+hW/heeWRjghJ2BJiglq4VvzfoEoyz0F0lraGKXggUzRatbvacS7u1ASC?=
 =?us-ascii?Q?lbjD3On1bXjBnCYexMTu+SpMoQs0pAUu/1DbgdGb4ssgshXBdVMxUHsKJVbs?=
 =?us-ascii?Q?kwuITRAlbGQ9YwCH+zL1JnuZzYmHDvwZjL85g1zQPLFaiWZHvJhn1HRxlpgn?=
 =?us-ascii?Q?adJF0tBnzYhYNB4f8slNSsmMttnvbnbRXwEr53cYcXihzD9tEFkwlp6KFlbT?=
 =?us-ascii?Q?VHYRwQOHSmQR7t4d418sDvP6Q9jKvLlYSBLV4bgBLKSAeQ8sRYVHAlXt/vyR?=
 =?us-ascii?Q?o/NmdQlLYQGiyHl7lhlHh63bWoPV504xPvvu7j599cU4Hbi7Ldmgj+MDUjZP?=
 =?us-ascii?Q?67XEzt1WMHLAI+jJVPXuaVa8+34R6sreiCUHcx6mJ9i+qOCOoc1xDf7z2hbC?=
 =?us-ascii?Q?IXxtud22TiIK9X8Xbr+9HHH95jYMMBMrw4LojGp8w2wVXTV20lFoKJORf3/p?=
 =?us-ascii?Q?jZG/dkh6igLnjaEzEJErOMrgok1yGNZgo9XQVq4xT7vP3azADzQhI+W9MAl9?=
 =?us-ascii?Q?KCNEDeup4+ByUWWnCbns9CpXT1NzPedCAaWHbkQA6jbFCLzS56JCUoixgIWQ?=
 =?us-ascii?Q?rFaLaqBXsBZXAeHliQMSWZ6wLzILUAJ1Gg/52J6yIb7ncjTuGGL3gw1Ra9kN?=
 =?us-ascii?Q?XNGiMylPgaMiSpYpwOplrVG+1j7RZRGtFlNv55/erI1jsG79G0EZu7cus8H4?=
 =?us-ascii?Q?HFVh?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3055
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8f05a7c8-6b38-456e-87bd-08d8b70dacdc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IPDr7VwMEMBK4cC5sIRJVHcN5++1jezOgRQdKLbOQ87eVoznRfgE0Fw3ZAR4s5b2wESdy4EpR1UhYQbpO63ORHy5F9hg9HSjS0TuwtFLxU2+kwKlVRn9vq/h+AKRyPkw6nRtnMTJvt0KyjbjDoDQK5prS23myan0rQloQriXe2CvUDKTymp1Yj4EYNuHEYuAZmP4OdnFJaq3JZpAbpQSI5ctEZYgOmnxv3VHJggq25HzpHLe+KJePzBw8Qv6NGNjVrwKqgOnLwKbRINy3Hu3tHFSsnZSVU0qy6YYETiP85+uDm1Zy72PJX6JBhtL8C9dkzSffMrWHVolUIEyyafn1RPDIOxM/rzZHsV/+ZmW+t6KSx71NlvIR+fvMKU7laFPm+6dLJY6E8UetopHY8NveTBpfOw6e2iykzD6o42fqJ6K/LKIKulqpsiLPYWOJo9xfa0Rjb2JxbtJOQ61oT1iLHnG1L4KfwpwdSNNXwVCawUVI5F19+2VcUQeoCCc6MAWdmIqlpgN7PbJBqEMtX46V+CtsGn76NP5u6F7y6POcd898hVKEd7uNJQRjirhCjg6XDXQBYJBH/S9cgftG/4jCZGIjUZBb047fvRJaNWPexo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966006)(34020700004)(81166007)(7696005)(2616005)(16526019)(316002)(26005)(336012)(83380400001)(4326008)(356005)(966005)(956004)(82310400003)(5660300002)(86362001)(186003)(8676002)(47076005)(19627235002)(82740400003)(6666004)(30864003)(70586007)(70206006)(44832011)(6486002)(2906002)(1076003)(8936002)(36756003)(478600001)(6916009)(21314003)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:12.1020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e1d7aa-ba50-4a29-991d-08d8b70db20f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2090
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

These patches in optee-os adds support for
      - tc0 platform
      - SEL2 SPMC support in optee core
      - support for tc0 SEL2 SPMC config

The patch in optee-client adds support for
    - allocating page aligned shmem buffers

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I1cfe134bdcedc45adf446f46af0d2881815b98f6
---
 ...void-memcpy-when-using-TEEC_TempMemo.patch |  52 ++
 ...e-page-aligned-shared-memory-buffers.patch |  95 +++
 ...ore-SPMC-update-for-FF-A-version-1.0.patch |  50 ++
 .../tc0/0002-core-add-thread_smccc.patch      |  89 +++
 ...e-enable-SPCI-with-SPM-Core-at-S-EL2.patch | 623 ++++++++++++++++++
 ...fixes-to-align-with-upstream-hafnium.patch | 188 ++++++
 ...e-arm-Total-Compute-platform-support.patch | 187 ++++++
 ...alcompute-Add-support-for-S-EL2-SPMC.patch | 108 +++
 ...e-add-optee-manifest-file-and-sp-lay.patch |  73 ++
 ...e-define-tzdram-start-address-for-S-.patch |  36 +
 .../optee/optee-client-tc0.inc                |   7 +
 .../recipes-security/optee/optee-os-tc0.inc   |  15 +-
 12 files changed, 1522 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-client/=
tc0/0001-Revert-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-client/=
tc0/0002-Allocate-page-aligned-shared-memory-buffers.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0001-core-SPMC-update-for-FF-A-version-1.0.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0002-core-add-thread_smccc.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0004-core-fixes-to-align-with-upstream-hafnium.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0005-core-arm-Total-Compute-platform-support.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/000=
1-Revert-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch b/meta-arm-bsp=
/recipes-security/optee/files/optee-client/tc0/0001-Revert-libteec-Avoid-me=
mcpy-when-using-TEEC_TempMemo.patch
new file mode 100644
index 0000000..4515c1d
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0001-Rever=
t-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch
@@ -0,0 +1,52 @@
+Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_client/co=
mmit/7e569bdf770f635c5de1f4e659d41039a6199a0b]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 7e569bdf770f635c5de1f4e659d41039a6199a0b Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Wed, 11 Nov 2020 10:09:38 +0100
+Subject: [PATCH 1/2] Revert "libteec: Avoid memcpy() when using
+ TEEC_TempMemoryReference"
+
+This reverts commit dcb13e2f457fa98e9ba49dd2a364542680671e95.
+---
+ libteec/src/tee_client_api.c | 14 ++++----------
+ 1 file changed, 4 insertions(+), 10 deletions(-)
+
+diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
+index 6b81e09..b8ccdfa 100644
+--- a/libteec/src/tee_client_api.c
++++ b/libteec/src/tee_client_api.c
+@@ -217,15 +217,11 @@ static TEEC_Result teec_pre_process_tmpref(TEEC_Cont=
ext *ctx,
+ 			MEMREF_SHM_ID(param) =3D shm->id;
+ 		}
+ 	} else {
+-		shm->buffer =3D tmpref->buffer;
+-		res =3D TEEC_RegisterSharedMemory(ctx, shm);
++		res =3D TEEC_AllocateSharedMemory(ctx, shm);
+ 		if (res !=3D TEEC_SUCCESS)
+ 			return res;
+=20
+-		if (shm->shadow_buffer)
+-			memcpy(shm->shadow_buffer, tmpref->buffer,
+-			       tmpref->size);
+-
++		memcpy(shm->buffer, tmpref->buffer, tmpref->size);
+ 		MEMREF_SHM_ID(param) =3D shm->id;
+ 	}
+=20
+@@ -388,10 +384,8 @@ static void teec_post_process_tmpref(uint32_t param_t=
ype,
+ 			TEEC_SharedMemory *shm)
+ {
+ 	if (param_type !=3D TEEC_MEMREF_TEMP_INPUT) {
+-		if (MEMREF_SIZE(param) <=3D tmpref->size && tmpref->buffer &&
+-		    shm->shadow_buffer)
+-			memcpy(tmpref->buffer, shm->shadow_buffer,
+-			       MEMREF_SIZE(param));
++		if (MEMREF_SIZE(param) <=3D tmpref->size && tmpref->buffer)
++			memcpy(tmpref->buffer, shm->buffer, MEMREF_SIZE(param));
+=20
+ 		tmpref->size =3D MEMREF_SIZE(param);
+ 	}
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/000=
2-Allocate-page-aligned-shared-memory-buffers.patch b/meta-arm-bsp/recipes-=
security/optee/files/optee-client/tc0/0002-Allocate-page-aligned-shared-mem=
ory-buffers.patch
new file mode 100644
index 0000000..5928bfd
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-client/tc0/0002-Alloc=
ate-page-aligned-shared-memory-buffers.patch
@@ -0,0 +1,95 @@
+Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_client/co=
mmit/7a67f8b7681ecf3abb5b09e5e320857d16f4a7e6]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 7a67f8b7681ecf3abb5b09e5e320857d16f4a7e6 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Mon, 16 Nov 2020 17:34:07 +0100
+Subject: [PATCH 2/2] Allocate page aligned shared memory buffers
+
+Allocate page aligned shared memory buffer guarantee that each shared
+memory buffer doesn't accidentally share a page of memory or they may
+become aliased when mapped in secure world. This is normally not a big
+problem but may make it a bit harder to track down buffer overruns in
+shared memory buffers.
+
+In a post Arm v8.4 architecture with FF-A [1] there's trouble since it's
+not permitted to share the same physical page twice.
+
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ libteec/src/tee_client_api.c        | 14 ++++++++++++--
+ tee-supplicant/src/tee_supplicant.c | 12 +++++++++++-
+ 2 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
+index b8ccdfa..676d373 100644
+--- a/libteec/src/tee_client_api.c
++++ b/libteec/src/tee_client_api.c
+@@ -74,6 +74,16 @@ static void teec_mutex_unlock(pthread_mutex_t *mu)
+ 	pthread_mutex_unlock(mu);
+ }
+=20
++static void *teec_paged_aligned_alloc(size_t sz)
++{
++	void *p =3D NULL;
++
++	if (!posix_memalign(&p, sysconf(_SC_PAGESIZE), sz))
++		return p;
++
++	return NULL;
++}
++
+ static int teec_open_dev(const char *devname, const char *capabilities,
+ 			 uint32_t *gen_caps)
+ {
+@@ -790,7 +800,7 @@ TEEC_Result TEEC_RegisterSharedMemory(TEEC_Context *ct=
x, TEEC_SharedMemory *shm)
+ 		 * we're not making matters worse by trying to allocate and
+ 		 * register a shadow buffer before giving up.
+ 		 */
+-		shm->shadow_buffer =3D malloc(s);
++		shm->shadow_buffer =3D teec_paged_aligned_alloc(s);
+ 		if (!shm->shadow_buffer)
+ 			return TEEC_ERROR_OUT_OF_MEMORY;
+ 		fd =3D teec_shm_register(ctx->fd, shm->shadow_buffer, s,
+@@ -873,7 +883,7 @@ TEEC_Result TEEC_AllocateSharedMemory(TEEC_Context *ct=
x, TEEC_SharedMemory *shm)
+ 		s =3D 8;
+=20
+ 	if (ctx->reg_mem) {
+-		shm->buffer =3D malloc(s);
++		shm->buffer =3D teec_paged_aligned_alloc(s);
+ 		if (!shm->buffer)
+ 			return TEEC_ERROR_OUT_OF_MEMORY;
+=20
+diff --git a/tee-supplicant/src/tee_supplicant.c b/tee-supplicant/src/tee_=
supplicant.c
+index 94cf382..d590c2b 100644
+--- a/tee-supplicant/src/tee_supplicant.c
++++ b/tee-supplicant/src/tee_supplicant.c
+@@ -127,6 +127,16 @@ static size_t num_waiters_dec(struct thread_arg *arg)
+ 	return ret;
+ }
+=20
++static void *paged_aligned_alloc(size_t sz)
++{
++	void *p =3D NULL;
++
++	if (!posix_memalign(&p, sysconf(_SC_PAGESIZE), sz))
++		return p;
++
++	return NULL;
++}
++
+ static int get_value(size_t num_params, struct tee_ioctl_param *params,
+ 		     const uint32_t idx, struct param_value **value)
+ {
+@@ -336,7 +346,7 @@ static struct tee_shm *register_local_shm(int fd, size=
_t size)
+=20
+ 	memset(&data, 0, sizeof(data));
+=20
+-	buf =3D malloc(size);
++	buf =3D paged_aligned_alloc(size);
+ 	if (!buf)
+ 		return NULL;
+=20
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-co=
re-SPMC-update-for-FF-A-version-1.0.patch b/meta-arm-bsp/recipes-security/o=
ptee/files/optee-os/tc0/0001-core-SPMC-update-for-FF-A-version-1.0.patch
new file mode 100644
index 0000000..d3b2319
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-core-SPMC=
-update-for-FF-A-version-1.0.patch
@@ -0,0 +1,50 @@
+Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit=
/7c3b052b871420618a08402f626923fe85a139db]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 7c3b052b871420618a08402f626923fe85a139db Mon Sep 17 00:00:00 2001
+From: Marc Bonnici <marc.bonnici@arm.com>
+Date: Wed, 23 Sep 2020 13:55:22 +0100
+Subject: [PATCH 1/3] core: SPMC: update for FF-A version 1.0
+
+Update expected memory attributes. As per the FF-A spec (5.11.3)  a
+lender of a memory region should not specify the instruction access
+permission, therefore update the expected memory attribute.
+
+Updates the version number to 1.0 replacing the previous version number
+0.9.
+---
+ core/arch/arm/include/optee_ffa.h  | 4 ++--
+ core/arch/arm/kernel/thread_spmc.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/core/arch/arm/include/optee_ffa.h b/core/arch/arm/include/opt=
ee_ffa.h
+index 8498fbab..9daca732 100644
+--- a/core/arch/arm/include/optee_ffa.h
++++ b/core/arch/arm/include/optee_ffa.h
+@@ -27,8 +27,8 @@
+  * w3-w7: Implementation defined, free to be used below
+  */
+=20
+-#define OPTEE_FFA_VERSION_MAJOR	UINT32_C(0)
+-#define OPTEE_FFA_VERSION_MINOR	UINT32_C(9)
++#define OPTEE_FFA_VERSION_MAJOR	UINT32_C(1)
++#define OPTEE_FFA_VERSION_MINOR	UINT32_C(0)
+=20
+ #define OPTEE_FFA_BLOCKING_CALL(id)	UINT32_C(id)
+ #define OPTEE_FFA_YIELDING_CALL_BIT	31
+diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thr=
ead_spmc.c
+index 81edf03a..16f3bbe1 100644
+--- a/core/arch/arm/kernel/thread_spmc.c
++++ b/core/arch/arm/kernel/thread_spmc.c
+@@ -433,7 +433,7 @@ static int mem_share_init(void *buf, size_t blen, unsi=
gned int *page_count,
+ {
+ 	struct mem_region_descr *region_descr =3D NULL;
+ 	struct mem_transaction_descr *descr =3D NULL;
+-	const uint8_t exp_mem_acc_perm =3D 0x6; /* Not executable, Read-write */
++	const uint8_t exp_mem_acc_perm =3D 0x2; /* Read-write */
+ 	/* Normal memory, Write-Back cacheable, Inner shareable */
+ 	const uint8_t exp_mem_reg_attr =3D 0x2f;
+ 	unsigned int num_mem_accs =3D 0;
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-co=
re-add-thread_smccc.patch b/meta-arm-bsp/recipes-security/optee/files/optee=
-os/tc0/0002-core-add-thread_smccc.patch
new file mode 100644
index 0000000..32a420e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0002-core-add-=
thread_smccc.patch
@@ -0,0 +1,89 @@
+Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit=
/269e226eea2b2f26a6f844b7d25bc2b2a9b26315]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 269e226eea2b2f26a6f844b7d25bc2b2a9b26315 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Tue, 4 Feb 2020 17:30:55 +0100
+Subject: [PATCH 2/3] core: add thread_smccc()
+
+Adds the assembly function thread_smccc() which loads the first 8
+registers with the argument and executes an SMC or HVC instruction as
+appropriate. The result in the first 8 registers is then saved in the
+argument struct.
+
+Change-Id: Ie14154fb38de5ced3cfdebdb0bf19e48caaf2279
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ core/arch/arm/include/kernel/thread.h |  1 +
+ core/arch/arm/kernel/thread_a32.S     | 16 ++++++++++++++++
+ core/arch/arm/kernel/thread_a64.S     | 15 +++++++++++++++
+ 3 files changed, 32 insertions(+)
+
+diff --git a/core/arch/arm/include/kernel/thread.h b/core/arch/arm/include=
/kernel/thread.h
+index b9c0ba4b..4f0520e9 100644
+--- a/core/arch/arm/include/kernel/thread.h
++++ b/core/arch/arm/include/kernel/thread.h
+@@ -704,6 +704,7 @@ uint32_t thread_rpc_cmd(uint32_t cmd, size_t num_param=
s,
+=20
+ unsigned long thread_smc(unsigned long func_id, unsigned long a1,
+ 			 unsigned long a2, unsigned long a3);
++void thread_smccc(struct thread_smc_args *arg_res);
+=20
+ /**
+  * Allocate data for payload buffers.
+diff --git a/core/arch/arm/kernel/thread_a32.S b/core/arch/arm/kernel/thre=
ad_a32.S
+index 199e90a9..75d85c32 100644
+--- a/core/arch/arm/kernel/thread_a32.S
++++ b/core/arch/arm/kernel/thread_a32.S
+@@ -210,6 +210,22 @@ FUNC thread_smc , :
+ 	bx	lr
+ END_FUNC thread_smc
+=20
++/* void thread_smccc(struct thread_smc_args *arg_res) */
++FUNC thread_smccc , :
++	push	{r4-r7}
++	push	{r0, lr}
++	ldm	r0, {r0-r7}
++#ifdef CFG_CORE_SEL2_SPMC
++	hvc	#0
++#else
++	smc	#0
++#endif
++	pop	{r12, lr}
++	stm	r12, {r0-r7}
++	pop	{r4-r7}
++	bx	lr
++END_FUNC thread_smccc
++
+ FUNC thread_init_vbar , :
+ 	/* Set vector (VBAR) */
+ 	write_vbar r0
+diff --git a/core/arch/arm/kernel/thread_a64.S b/core/arch/arm/kernel/thre=
ad_a64.S
+index 9ce31eb2..3e0f5115 100644
+--- a/core/arch/arm/kernel/thread_a64.S
++++ b/core/arch/arm/kernel/thread_a64.S
+@@ -65,6 +65,21 @@ FUNC thread_smc , :
+ 	ret
+ END_FUNC thread_smc
+=20
++/* void thread_smccc(struct thread_smc_args *arg_res) */
++FUNC thread_smccc , :
++	push	x0, xzr
++	mov	x8, x0
++	load_xregs x8, 0, 0, 7
++#ifdef CFG_CORE_SEL2_SPMC
++	hvc	#0
++#else
++	smc	#0
++#endif
++	pop	x8, xzr
++	store_xregs x8, 0, 0, 7
++	ret
++END_FUNC thread_smccc
++
+ FUNC thread_init_vbar , :
+ 	msr	vbar_el1, x0
+ 	ret
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-co=
re-enable-SPCI-with-SPM-Core-at-S-EL2.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-os/tc0/0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patc=
h
new file mode 100644
index 0000000..c3967dc
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0003-core-enab=
le-SPCI-with-SPM-Core-at-S-EL2.patch
@@ -0,0 +1,623 @@
+Upstream-Status: Pending [https://github.com/jenswi-linaro/optee_os/commit=
/80f0ec4ba2af33584e99e917fa165b77028a511f]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 80f0ec4ba2af33584e99e917fa165b77028a511f Mon Sep 17 00:00:00 2001
+From: Marc Bonnici <marc.bonnici@arm.com>
+Date: Fri, 5 Jun 2020 13:47:40 +0100
+Subject: [PATCH 3/3] core: enable SPCI with SPM Core at S-EL2
+
+This is a port of a pre-exisiting patch to support the case where
+the SPM Core is implementation at S-EL2, that is, in a secure hypervisor.
+This configuration is also know as "S-EL2 SPMC" in the FFA specification.
+
+Compile with CFG_CORE_SEL2_SPMC=3Dy
+
+Note that this is an experimental feature, ABIs etc may have
+incompatible changes.
+
+Sqaushed in:
+	core: Update cookie to uint64 in S-EL2 code
+
+	As part of the update to FF-A 1.0 the globally
+	unique handle to identify a shared memory object is now 64
+	bits wide instead of 32. This commit updates the
+	remaining usage of 32 bit values.
+
+	core: Remove page count from S-EL2 code
+
+	The page count field has been dropped from upstream OP-TEE to
+	accommodate using a 64 bit handle in the same size message param struct,
+	therefore update our implementation to support this.
+
+	core: Update remaining FF-A structures to EAC
+
+	Update relinquish data structures and ABI invocations to the FFA
+	EAC spec
+---
+ core/arch/arm/arm.mk                   |   7 ++
+ core/arch/arm/include/kernel/thread.h  |   6 +
+ core/arch/arm/include/mm/mobj.h        |   6 +
+ core/arch/arm/kernel/thread_spmc.c     | 164 ++++++++++++++++++++++++-
+ core/arch/arm/kernel/thread_spmc_a64.S |   3 +-
+ core/arch/arm/mm/mobj_ffa.c            | 104 +++++++++++-----
+ core/arch/arm/plat-vexpress/conf.mk    |   5 +
+ 7 files changed, 260 insertions(+), 35 deletions(-)
+
+diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
+index f495f3c9..7c5e8fb0 100644
+--- a/core/arch/arm/arm.mk
++++ b/core/arch/arm/arm.mk
+@@ -97,6 +97,13 @@ endif
+ # changes
+ ifeq ($(CFG_CORE_SEL1_SPMC),y)
+ $(call force,CFG_CORE_FFA,y)
++$(call force,CFG_CORE_SEL2_SPMC,n)
++endif
++# SPMC configuration "S-EL2 SPMC" where SPM Core is implemented at S-EL2,
++# that is, the hypervisor sandboxing OP-TEE
++ifeq ($(CFG_CORE_SEL2_SPMC),y)
++$(call force,CFG_CORE_FFA,y)
++$(call force,CFG_CORE_SEL1_SPMC,n)
+ endif
+=20
+ # Unmaps all kernel mode code except the code needed to take exceptions
+diff --git a/core/arch/arm/include/kernel/thread.h b/core/arch/arm/include=
/kernel/thread.h
+index 4f0520e9..95f48589 100644
+--- a/core/arch/arm/include/kernel/thread.h
++++ b/core/arch/arm/include/kernel/thread.h
+@@ -759,6 +759,12 @@ enum thread_shm_cache_user {
+ void *thread_rpc_shm_cache_alloc(enum thread_shm_cache_user user,
+ 				 enum thread_shm_type shm_type,
+ 				 size_t size, struct mobj **mobj);
++
++#if defined(CFG_CORE_SEL2_SPMC)
++struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie);
++void thread_spmc_relinquish(uint64_t memory_region_handle);
++#endif
++
+ #endif /*__ASSEMBLER__*/
+=20
+ #endif /*KERNEL_THREAD_H*/
+diff --git a/core/arch/arm/include/mm/mobj.h b/core/arch/arm/include/mm/mo=
bj.h
+index 2b9bd90c..3f820666 100644
+--- a/core/arch/arm/include/mm/mobj.h
++++ b/core/arch/arm/include/mm/mobj.h
+@@ -216,6 +216,12 @@ struct mobj_ffa *mobj_ffa_sel1_spmc_new(unsigned int =
num_pages);
+ void mobj_ffa_sel1_spmc_delete(struct mobj_ffa *mobj);
+ TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie);
+ #endif
++#ifdef CFG_CORE_SEL2_SPMC
++struct mobj_ffa *mobj_ffa_sel2_spmc_new(uint64_t cookie,
++                                        unsigned int num_pages);
++void mobj_ffa_sel2_spmc_delete(struct mobj_ffa *mobj);
++#endif
++
+ uint64_t mobj_ffa_get_cookie(struct mobj_ffa *mobj);
+ TEE_Result mobj_ffa_add_pages_at(struct mobj_ffa *mobj, unsigned int *idx=
,
+ 				 paddr_t pa, unsigned int num_pages);
+diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thr=
ead_spmc.c
+index 16f3bbe1..3d7dc035 100644
+--- a/core/arch/arm/kernel/thread_spmc.c
++++ b/core/arch/arm/kernel/thread_spmc.c
+@@ -7,6 +7,7 @@
+ #include <assert.h>
+ #include <ffa.h>
+ #include <io.h>
++#include <initcall.h>
+ #include <kernel/interrupt.h>
+ #include <kernel/panic.h>
+ #include <kernel/spinlock.h>
+@@ -88,6 +89,18 @@ struct mem_frag_state {
+=20
+ static uint16_t my_sp_id =3D 0x8001;
+=20
++
++/* Table 149: FFA_MEM_RELINQUISH. */
++struct ffa_relinquish_descriptor {
++       uint64_t handle;
++       uint32_t flags;
++       uint32_t endpoint_count;
++       uint16_t endpoint_id_array[];
++};
++
++/* Our VM ID is 0x8001, non-secure VM ID 0x0001 */
++const uint32_t thread_spmc_target_info =3D 0x80010001;
++
+ /*
+  * If @rxtx_size is 0 RX/TX buffers are not mapped or initialized.
+  *
+@@ -101,8 +114,16 @@ static uint16_t my_sp_id =3D 0x8001;
+  * these buffers so we must always be careful when reading. while we hold
+  * the lock.
+  */
++
++#ifdef CFG_CORE_SEL2_SPMC
++static uint8_t rx_buf[SMALL_PAGE_SIZE] __aligned(SMALL_PAGE_SIZE);
++static uint8_t tx_buf[SMALL_PAGE_SIZE] __aligned(SMALL_PAGE_SIZE);
++#else
+ static void *rx_buf;
+ static void *tx_buf;
++#endif
++
++
+ static unsigned int rxtx_size;
+ static unsigned int rxtx_spinlock;
+ static bool tx_buf_is_mine;
+@@ -127,6 +148,28 @@ static void set_args(struct thread_smc_args *args, ui=
nt32_t fid,
+ 					  .a5 =3D w5, };
+ }
+=20
++static int __maybe_unused
++set_pages(struct constituent_address_range *regions, unsigned int num_reg=
ions,
++	  unsigned int num_pages, struct mobj_ffa *mf)
++{
++	unsigned int n =3D 0;
++	unsigned int idx =3D 0;
++
++	for (n =3D 0; n < num_regions; n++) {
++		unsigned int page_count =3D READ_ONCE(regions[n].page_count);
++		uint64_t addr =3D READ_ONCE(regions[n].address);
++
++		if (mobj_ffa_add_pages_at(mf, &idx, addr, page_count))
++			return FFA_INVALID_PARAMETERS;
++	}
++
++	if (idx !=3D num_pages)
++		return FFA_INVALID_PARAMETERS;
++
++	return 0;
++}
++
++
+ static void handle_version(struct thread_smc_args *args)
+ {
+ 	/*
+@@ -188,6 +231,7 @@ static void handle_features(struct thread_smc_args *ar=
gs)
+ 		 FFA_PARAM_MBZ, FFA_PARAM_MBZ, FFA_PARAM_MBZ);
+ }
+=20
++#ifdef CFG_CORE_SEL1_SPMC
+ static int map_buf(paddr_t pa, unsigned int sz, void **va_ret)
+ {
+ 	tee_mm_entry_t *mm =3D NULL;
+@@ -293,6 +337,7 @@ out:
+ 	set_args(args, ret_fid, FFA_PARAM_MBZ, rc,
+ 		 FFA_PARAM_MBZ, FFA_PARAM_MBZ, FFA_PARAM_MBZ);
+ }
++#endif
+=20
+ static void handle_rx_release(struct thread_smc_args *args)
+ {
+@@ -408,6 +453,7 @@ static void handle_blocking_call(struct thread_smc_arg=
s *args)
+ 	}
+ }
+=20
++#if CFG_CORE_SEL1_SPMC
+ static int get_acc_perms(struct mem_accsess_descr *mem_acc,
+ 			 unsigned int num_mem_accs, uint8_t *acc_perms,
+ 			 unsigned int *region_offs)
+@@ -531,7 +577,11 @@ static int add_mem_share_frag(struct mem_frag_state *=
s, void *buf, size_t flen)
+=20
+ 	SLIST_REMOVE(&frag_state_head, s, mem_frag_state, link);
+ 	if (rc < 0)
++#ifdef CFG_CORE_SEL2_SPMC
++		mobj_ffa_sel2_spmc_delete(s->share.mf);
++#else
+ 		mobj_ffa_sel1_spmc_delete(s->share.mf);
++#endif
+ 	else
+ 		mobj_ffa_push_to_inactive(s->share.mf);
+ 	free(s);
+@@ -559,8 +609,8 @@ static int add_mem_share(tee_mm_entry_t *mm, void *buf=
, size_t blen,
+ 			 sizeof(struct constituent_address_range), &n) ||
+ 	    ADD_OVERFLOW(n, addr_range_offs, &n) || n > blen)
+ 		return FFA_INVALID_PARAMETERS;
+-
+ 	share.mf =3D mobj_ffa_sel1_spmc_new(share.page_count);
++
+ 	if (!share.mf)
+ 		return FFA_NO_MEMORY;
+=20
+@@ -601,6 +651,7 @@ static int add_mem_share(tee_mm_entry_t *mm, void *buf=
, size_t blen,
+ 	return 0;
+ err:
+ 	mobj_ffa_sel1_spmc_delete(share.mf);
++
+ 	return rc;
+ }
+=20
+@@ -809,6 +860,7 @@ static void handle_mem_reclaim(struct thread_smc_args =
*args)
+ out:
+ 	set_args(args, ret_fid, ret_val, 0, 0, 0, 0);
+ }
++#endif
+=20
+ /* Only called from assembly */
+ void thread_spmc_msg_recv(struct thread_smc_args *args);
+@@ -822,6 +874,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
+ 	case FFA_FEATURES:
+ 		handle_features(args);
+ 		break;
++#if CFG_CORE_SEL1_SPMC
+ #ifdef ARM64
+ 	case FFA_RXTX_MAP_64:
+ #endif
+@@ -831,6 +884,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
+ 	case FFA_RXTX_UNMAP:
+ 		handle_rxtx_unmap(args);
+ 		break;
++#endif
+ 	case FFA_RX_RELEASE:
+ 		handle_rx_release(args);
+ 		break;
+@@ -847,6 +901,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
+ 		else
+ 			handle_blocking_call(args);
+ 		break;
++#if CFG_CORE_SEL1_SPMC
+ #ifdef ARM64
+ 	case FFA_MEM_SHARE_64:
+ #endif
+@@ -859,6 +914,7 @@ void thread_spmc_msg_recv(struct thread_smc_args *args=
)
+ 	case FFA_MEM_FRAG_TX:
+ 		handle_mem_frag_tx(args);
+ 		break;
++#endif
+ 	default:
+ 		EMSG("Unhandled FFA function ID %#"PRIx32, (uint32_t)args->a0);
+ 		set_args(args, FFA_ERROR, FFA_PARAM_MBZ, FFA_NOT_SUPPORTED,
+@@ -1185,3 +1241,109 @@ void thread_rpc_free_global_payload(struct mobj *m=
obj __unused)
+=20
+ 	assert(!cant_happen);
+ }
++
++#ifdef CFG_CORE_SEL2_SPMC
++static void spmc_rxtx_map(void)
++{
++	struct thread_smc_args args =3D {
++		.a0 =3D FFA_RXTX_MAP_64,
++		.a1 =3D (vaddr_t)tx_buf,
++		.a2 =3D (vaddr_t)rx_buf,
++		.a3 =3D 1,
++	};
++
++	thread_smccc(&args);
++	if (args.a0 =3D=3D FFA_ERROR) {
++		EMSG("ERROR rxtx map failed with error %ld\n", args.a2);
++		panic();
++	}
++}
++
++static struct mem_transaction_descr *spmc_retrieve_req(uint64_t cookie)
++{
++	struct mem_transaction_descr *retrieve_region =3D (void *)tx_buf;
++
++	struct thread_smc_args args =3D {
++		.a0 =3D FFA_MEM_RETRIEVE_REQ_64,
++		.a1 =3D   sizeof(*retrieve_region),  	// Total Length
++		.a2 =3D	sizeof(*retrieve_region),	// Frag Length =3D=3D Total length
++		.a3 =3D	0,				// Address, Using TX -> MBZ
++		.a4 =3D   0 				// Using TX -> MBZ
++	};
++
++	/* TODO pass all the information required by the spec */
++	memset(retrieve_region, 0, sizeof(*retrieve_region));
++	retrieve_region->global_handle =3D cookie;
++
++	thread_smccc(&args);
++	if (args.a0 =3D=3D FFA_ERROR /*TODO !=3D FFA_MEM_RETRIEVE_RESP_64 */) {
++		EMSG("Failed to fetch cookie %#"PRIx64, cookie);
++		return NULL;
++	}
++
++	return (void *)rx_buf;
++}
++
++void thread_spmc_relinquish(uint64_t cookie)
++{
++	struct ffa_relinquish_descriptor *relinquish_desc =3D (void *)tx_buf;
++
++	struct thread_smc_args args =3D {
++		.a0 =3D FFA_MEM_RELINQUISH,
++	};
++
++	memset(relinquish_desc, 0, sizeof(*relinquish_desc));
++	relinquish_desc->handle =3D cookie;
++	relinquish_desc->flags =3D 0;
++	/* TODO: Add endpoint details. */
++	thread_smccc(&args);
++	if (args.a0 !=3D FFA_SUCCESS_32)
++		EMSG("Failed to relinquish cookie %#"PRIx64, cookie);
++}
++
++struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie)
++{
++	struct mem_transaction_descr *retrieve_desc;
++	struct mem_region_descr *descr;
++	struct mobj_ffa *mf;
++	uint32_t num_pages;
++
++
++	/* XXX Support single mem_region. */
++	retrieve_desc =3D spmc_retrieve_req(cookie);
++
++	if (!retrieve_desc) {
++	    EMSG("Failed to retrieve cookie from rx buffer %#"PRIx64, cookie);
++	    return NULL;
++	}
++
++	descr =3D (struct mem_region_descr *)
++			((uint8_t *)retrieve_desc +
++				retrieve_desc->mem_accsess_descr_array[0].mem_region_offs);
++
++	num_pages =3D descr->total_page_count;
++	mf =3D mobj_ffa_sel2_spmc_new(cookie, num_pages);
++
++	if (!mf)
++		return NULL;
++
++	if (set_pages(descr->address_range_array,
++				  descr->address_range_count,
++				  num_pages, mf)) {
++		mobj_ffa_sel2_spmc_delete(mf);
++		return NULL;
++
++	}
++
++	return mf;
++}
++
++static TEE_Result spmc_init(void)
++{
++	spmc_rxtx_map();
++
++	return TEE_SUCCESS;
++}
++service_init(spmc_init);
++
++#endif /*CFG_CORE_SEL2_SPMC*/
+diff --git a/core/arch/arm/kernel/thread_spmc_a64.S b/core/arch/arm/kernel=
/thread_spmc_a64.S
+index 3d57da4d..66f9d0b4 100644
+--- a/core/arch/arm/kernel/thread_spmc_a64.S
++++ b/core/arch/arm/kernel/thread_spmc_a64.S
+@@ -17,7 +17,8 @@
+=20
+ FUNC thread_ffa_msg_wait , :
+ 	mov_imm	x0, FFA_MSG_WAIT		/* FID */
+-	mov	x1, #FFA_TARGET_INFO_MBZ	/* Target info MBZ */
++	adr     x1, thread_spmc_target_info
++	ldr     w1, [x1]
+ 	mov	x2, #FFA_PARAM_MBZ		/* Param MBZ */
+ 	mov	x3, #FFA_PARAM_MBZ		/* Param MBZ */
+ 	mov	x4, #FFA_PARAM_MBZ		/* Param MBZ */
+diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
+index fd5e66ea..e2c585a2 100644
+--- a/core/arch/arm/mm/mobj_ffa.c
++++ b/core/arch/arm/mm/mobj_ffa.c
+@@ -19,8 +19,10 @@ struct mobj_ffa {
+ 	tee_mm_entry_t *mm;
+ 	struct refcount mapcount;
+ 	uint16_t page_offset;
++#ifdef CFG_CORE_SEL1_SPMC
+ 	bool registered_by_cookie;
+ 	bool unregistered_by_cookie;
++#endif
+ 	paddr_t pages[];
+ };
+=20
+@@ -186,6 +188,24 @@ void mobj_ffa_sel1_spmc_delete(struct mobj_ffa *mf)
+ }
+ #endif /*CFG_CORE_SEL1_SPMC*/
+=20
++#ifdef CFG_CORE_SEL2_SPMC
++struct mobj_ffa *mobj_ffa_sel2_spmc_new(uint64_t cookie,
++					unsigned int num_pages)
++{
++	struct mobj_ffa *mf =3D NULL;
++
++	mf =3D ffa_new(num_pages);
++	if (mf)
++		mf->cookie =3D cookie;
++	return mf;
++}
++
++void mobj_ffa_sel2_spmc_delete(struct mobj_ffa *mf)
++{
++	free(mf);
++}
++#endif /*CFG_CORE_SEL2_SPMC*/
++
+ TEE_Result mobj_ffa_add_pages_at(struct mobj_ffa *mf, unsigned int *idx,
+ 				 paddr_t pa, unsigned int num_pages)
+ {
+@@ -234,7 +254,9 @@ static void unmap_helper(struct mobj_ffa *mf)
+ 	}
+ }
+=20
+-TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
++
++#ifdef CFG_CORE_SEL1_SPMC
++TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
+ {
+ 	TEE_Result res =3D TEE_SUCCESS;
+ 	struct mobj_ffa *mf =3D NULL;
+@@ -244,7 +266,7 @@ TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cook=
ie)
+ 	mf =3D find_in_list(&shm_head, cmp_cookie, cookie);
+ 	/*
+ 	 * If the mobj is found here it's still active and cannot be
+-	 * unregistered.
++	 * reclaimed.
+ 	 */
+ 	if (mf) {
+ 		DMSG("cookie %#"PRIx64" busy refc %u",
+@@ -252,24 +274,34 @@ TEE_Result mobj_ffa_unregister_by_cookie(uint64_t co=
okie)
+ 		res =3D TEE_ERROR_BUSY;
+ 		goto out;
+ 	}
++
+ 	mf =3D find_in_list(&shm_inactive_head, cmp_cookie, cookie);
++	if (!mf) {
++		res =3D TEE_ERROR_ITEM_NOT_FOUND;
++		goto out;
++	}
+ 	/*
+-	 * If the mobj isn't found or if it already has been unregistered.
++	 * If the mobj has been registered via mobj_ffa_get_by_cookie()
++	 * but not unregistered yet with mobj_ffa_unregister_by_cookie().
+ 	 */
+-	if (!mf || mf->unregistered_by_cookie) {
+-		res =3D TEE_ERROR_ITEM_NOT_FOUND;
++	if (mf->registered_by_cookie && !mf->unregistered_by_cookie) {
++		DMSG("cookie %#"PRIx64" busy", cookie);
++		res =3D TEE_ERROR_BUSY;
+ 		goto out;
+ 	}
+-	mf->unregistered_by_cookie =3D true;
+-	res =3D TEE_SUCCESS;
+=20
++	if (!pop_from_list(&shm_inactive_head, cmp_ptr, (vaddr_t)mf))
++		panic();
++	res =3D TEE_SUCCESS;
+ out:
+ 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
++	if (!res)
++		mobj_ffa_sel1_spmc_delete(mf);
+ 	return res;
+ }
++#endif /*CFG_CORE_SEL1_SPMC*/
+=20
+-#ifdef CFG_CORE_SEL1_SPMC
+-TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
++TEE_Result mobj_ffa_unregister_by_cookie(uint64_t cookie)
+ {
+ 	TEE_Result res =3D TEE_SUCCESS;
+ 	struct mobj_ffa *mf =3D NULL;
+@@ -279,7 +311,7 @@ TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cookie)
+ 	mf =3D find_in_list(&shm_head, cmp_cookie, cookie);
+ 	/*
+ 	 * If the mobj is found here it's still active and cannot be
+-	 * reclaimed.
++	 * unregistered.
+ 	 */
+ 	if (mf) {
+ 		DMSG("cookie %#"PRIx64" busy refc %u",
+@@ -287,43 +319,42 @@ TEE_Result mobj_ffa_sel1_spmc_reclaim(uint64_t cooki=
e)
+ 		res =3D TEE_ERROR_BUSY;
+ 		goto out;
+ 	}
+-
+ 	mf =3D find_in_list(&shm_inactive_head, cmp_cookie, cookie);
+-	if (!mf) {
+-		res =3D TEE_ERROR_ITEM_NOT_FOUND;
+-		goto out;
+-	}
+ 	/*
+-	 * If the mobj has been registered via mobj_ffa_get_by_cookie()
+-	 * but not unregistered yet with mobj_ffa_unregister_by_cookie().
++	 * If the mobj isn't found or if it already has been unregistered.
+ 	 */
+-	if (mf->registered_by_cookie && !mf->unregistered_by_cookie) {
+-		DMSG("cookie %#"PRIx64" busy", cookie);
+-		res =3D TEE_ERROR_BUSY;
++#ifdef CFG_CORE_SEL2_SPMC
++	if (!mf) {
++#else
++	if (!mf || mf->unregistered_by_cookie) {
++#endif
++		res =3D TEE_ERROR_ITEM_NOT_FOUND;
+ 		goto out;
+ 	}
+=20
+-	if (!pop_from_list(&shm_inactive_head, cmp_ptr, (vaddr_t)mf))
+-		panic();
++
++#ifdef CFG_CORE_SEL2_SPMC
++	mf =3D pop_from_list(&shm_inactive_head, cmp_cookie, cookie);
++	mobj_ffa_sel2_spmc_delete(mf);
++	thread_spmc_relinquish(cookie);
++#else
++	mf->unregistered_by_cookie =3D true;
++#endif
+ 	res =3D TEE_SUCCESS;
++
+ out:
+ 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
+-	if (!res)
+-		mobj_ffa_sel1_spmc_delete(mf);
+ 	return res;
+ }
+-#endif /*CFG_CORE_SEL1_SPMC*/
+=20
+-struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie, unsigned int interna=
l_offs)
++struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
++				    unsigned int internal_offs)
+ {
+ 	struct mobj_ffa *mf =3D NULL;
+ 	uint32_t exceptions =3D 0;
+-
+ 	if (internal_offs >=3D SMALL_PAGE_SIZE)
+ 		return NULL;
+-
+ 	exceptions =3D cpu_spin_lock_xsave(&shm_lock);
+-
+ 	mf =3D find_in_list(&shm_head, cmp_cookie, cookie);
+ 	if (mf) {
+ 		if (mf->page_offset =3D=3D internal_offs) {
+@@ -345,9 +376,19 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie, =
unsigned int internal_offs)
+ 		}
+ 	} else {
+ 		mf =3D pop_from_list(&shm_inactive_head, cmp_cookie, cookie);
++#if defined(CFG_CORE_SEL2_SPMC)
++		/* Try to retrieve it from the SPM at S-EL2 */
++		if (mf)
++			DMSG("cookie %#"PRIx64" resurrecting", cookie);
++		if (!mf)
++			EMSG("Populating mobj from rx buffer\n");
++			mf =3D thread_spmc_populate_mobj_from_rx(cookie);
++#endif
+ 		if (mf) {
++#if defined(CFG_CORE_SEL1_SPMC)
+ 			mf->unregistered_by_cookie =3D false;
+ 			mf->registered_by_cookie =3D true;
++#endif
+ 			assert(refcount_val(&mf->mobj.refc) =3D=3D 0);
+ 			refcount_set(&mf->mobj.refc, 1);
+ 			refcount_set(&mf->mapcount, 0);
+@@ -358,15 +399,12 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,=
 unsigned int internal_offs)
+ 			SLIST_INSERT_HEAD(&shm_head, mf, link);
+ 		}
+ 	}
+-
+ 	cpu_spin_unlock_xrestore(&shm_lock, exceptions);
+-
+ 	if (!mf) {
+ 		EMSG("Failed to get cookie %#"PRIx64" internal_offs %#x",
+-		     cookie, internal_offs);
++			cookie, internal_offs);
+ 		return NULL;
+ 	}
+-
+ 	return &mf->mobj;
+ }
+=20
+diff --git a/core/arch/arm/plat-vexpress/conf.mk b/core/arch/arm/plat-vexp=
ress/conf.mk
+index 26b9f51e..dd6530a6 100644
+--- a/core/arch/arm/plat-vexpress/conf.mk
++++ b/core/arch/arm/plat-vexpress/conf.mk
+@@ -58,8 +58,13 @@ CFG_WITH_STATS ?=3D y
+=20
+ ifeq ($(PLATFORM_FLAVOR),fvp)
+ CFG_TEE_CORE_NB_CORE =3D 8
++ifeq ($(CFG_CORE_SEL2_SPMC),y)
++CFG_TZDRAM_START ?=3D 0x06280000
++CFG_TZDRAM_SIZE  ?=3D 0x01D80000
++else
+ CFG_TZDRAM_START ?=3D 0x06000000
+ CFG_TZDRAM_SIZE  ?=3D 0x02000000
++endif
+ CFG_SHMEM_START  ?=3D 0x83000000
+ CFG_SHMEM_SIZE   ?=3D 0x00200000
+ # DRAM1 is defined above 4G
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-co=
re-fixes-to-align-with-upstream-hafnium.patch b/meta-arm-bsp/recipes-securi=
ty/optee/files/optee-os/tc0/0004-core-fixes-to-align-with-upstream-hafnium.=
patch
new file mode 100644
index 0000000..a36a510
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0004-core-fixe=
s-to-align-with-upstream-hafnium.patch
@@ -0,0 +1,188 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 5ca96d9ff7fa5481282fb8f59a54d3cc91a1ae36 Mon Sep 17 00:00:00 2001
+From: Olivier Deprez <olivier.deprez@arm.com>
+Date: Thu, 1 Oct 2020 07:59:54 +0200
+Subject: [PATCH 1/5] core: fixes to align with upstream hafnium
+
+FF-A: fix call to thread_spmc_populate_mobj_from_rx
+
+FF-A: fix typos in thread_spmc.c
+
+FF-A: fix mem retrieve request
+
+FF-A. fix mem relinquish
+
+FF-A: call rx release from thread_spmc_populate_mobj_from_rx
+
+Change-Id: I38794b34bf17428d62218e30bdd0180f75498ed4
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ core/arch/arm/kernel/thread_spmc.c | 52 +++++++++++++++++++++---------
+ core/arch/arm/mm/mobj_ffa.c        |  3 +-
+ 2 files changed, 39 insertions(+), 16 deletions(-)
+
+diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thr=
ead_spmc.c
+index 3d7dc035..872221d6 100644
+--- a/core/arch/arm/kernel/thread_spmc.c
++++ b/core/arch/arm/kernel/thread_spmc.c
+@@ -48,7 +48,7 @@ struct mem_access_perm_descr {
+ };
+=20
+ /* Table 41: Endpoint memory access descriptor */
+-struct mem_accsess_descr {
++struct mem_access_descr {
+ 	struct mem_access_perm_descr mem_access_perm_descr;
+ 	uint32_t mem_region_offs;
+ 	uint64_t reserved;
+@@ -64,7 +64,7 @@ struct mem_transaction_descr {
+ 	uint64_t tag;
+ 	uint32_t reserved1;
+ 	uint32_t mem_access_descr_count;
+-	struct mem_accsess_descr mem_accsess_descr_array[];
++	struct mem_access_descr mem_access_descr_array[];
+ };
+=20
+ struct ffa_partition_info {
+@@ -453,8 +453,8 @@ static void handle_blocking_call(struct thread_smc_arg=
s *args)
+ 	}
+ }
+=20
+-#if CFG_CORE_SEL1_SPMC
+-static int get_acc_perms(struct mem_accsess_descr *mem_acc,
++#ifdef CFG_CORE_SEL1_SPMC
++static int get_acc_perms(struct mem_access_descr *mem_acc,
+ 			 unsigned int num_mem_accs, uint8_t *acc_perms,
+ 			 unsigned int *region_offs)
+ {
+@@ -495,7 +495,7 @@ static int mem_share_init(void *buf, size_t blen, unsi=
gned int *page_count,
+=20
+ 	/* Check that the endpoint memory access descriptor array fits */
+ 	num_mem_accs =3D READ_ONCE(descr->mem_access_descr_count);
+-	if (MUL_OVERFLOW(sizeof(struct mem_accsess_descr), num_mem_accs, &n) ||
++	if (MUL_OVERFLOW(sizeof(struct mem_access_descr), num_mem_accs, &n) ||
+ 	    ADD_OVERFLOW(sizeof(*descr), n, &n) || n > blen)
+ 		return FFA_INVALID_PARAMETERS;
+=20
+@@ -503,7 +503,7 @@ static int mem_share_init(void *buf, size_t blen, unsi=
gned int *page_count,
+ 		return FFA_INVALID_PARAMETERS;
+=20
+ 	/* Check that the access permissions matches what's expected */
+-	if (get_acc_perms(descr->mem_accsess_descr_array,
++	if (get_acc_perms(descr->mem_access_descr_array,
+ 			  num_mem_accs, &mem_acc_perm, &region_descr_offs) ||
+ 	    mem_acc_perm !=3D exp_mem_acc_perm)
+ 		return FFA_INVALID_PARAMETERS;
+@@ -1263,17 +1263,29 @@ static struct mem_transaction_descr *spmc_retrieve=
_req(uint64_t cookie)
+ {
+ 	struct mem_transaction_descr *retrieve_region =3D (void *)tx_buf;
+=20
++	uint64_t size =3D sizeof(*retrieve_region) +
++		1 * sizeof(struct mem_access_descr);
+ 	struct thread_smc_args args =3D {
+ 		.a0 =3D FFA_MEM_RETRIEVE_REQ_64,
+-		.a1 =3D   sizeof(*retrieve_region),  	// Total Length
+-		.a2 =3D	sizeof(*retrieve_region),	// Frag Length =3D=3D Total length
++		.a1 =3D   size,  	// Total Length
++		.a2 =3D	size,	// Frag Length =3D=3D Total length
+ 		.a3 =3D	0,				// Address, Using TX -> MBZ
+ 		.a4 =3D   0 				// Using TX -> MBZ
+ 	};
+=20
+ 	/* TODO pass all the information required by the spec */
+-	memset(retrieve_region, 0, sizeof(*retrieve_region));
++	memset(retrieve_region, 0, size);
+ 	retrieve_region->global_handle =3D cookie;
++	retrieve_region->flags =3D 1;
++	retrieve_region->mem_access_descr_count =3D 1;
++	retrieve_region->mem_access_descr_array[0].mem_region_offs =3D 0;
++	retrieve_region->mem_access_descr_array[0].reserved =3D 0;
++	retrieve_region->mem_access_descr_array[0].mem_access_perm_descr =3D
++		(struct mem_access_perm_descr) {
++			.endpoint_id =3D my_sp_id,
++			.access_perm =3D 0,
++			.flags =3D 0
++		};
+=20
+ 	thread_smccc(&args);
+ 	if (args.a0 =3D=3D FFA_ERROR /*TODO !=3D FFA_MEM_RETRIEVE_RESP_64 */) {
+@@ -1296,6 +1308,8 @@ void thread_spmc_relinquish(uint64_t cookie)
+ 	relinquish_desc->handle =3D cookie;
+ 	relinquish_desc->flags =3D 0;
+ 	/* TODO: Add endpoint details. */
++	relinquish_desc->endpoint_count =3D 1;
++	relinquish_desc->endpoint_id_array[0] =3D my_sp_id;
+ 	thread_smccc(&args);
+ 	if (args.a0 !=3D FFA_SUCCESS_32)
+ 		EMSG("Failed to relinquish cookie %#"PRIx64, cookie);
+@@ -1303,11 +1317,14 @@ void thread_spmc_relinquish(uint64_t cookie)
+=20
+ struct mobj_ffa *thread_spmc_populate_mobj_from_rx(uint64_t cookie)
+ {
++	struct mobj_ffa *ret =3D NULL;
+ 	struct mem_transaction_descr *retrieve_desc;
+ 	struct mem_region_descr *descr;
+ 	struct mobj_ffa *mf;
+ 	uint32_t num_pages;
+-
++	struct thread_smc_args ffa_rx_release_args =3D {
++		.a0 =3D FFA_RX_RELEASE
++	};
+=20
+ 	/* XXX Support single mem_region. */
+ 	retrieve_desc =3D spmc_retrieve_req(cookie);
+@@ -1319,23 +1336,28 @@ struct mobj_ffa *thread_spmc_populate_mobj_from_rx=
(uint64_t cookie)
+=20
+ 	descr =3D (struct mem_region_descr *)
+ 			((uint8_t *)retrieve_desc +
+-				retrieve_desc->mem_accsess_descr_array[0].mem_region_offs);
++				retrieve_desc->mem_access_descr_array[0].mem_region_offs);
+=20
+ 	num_pages =3D descr->total_page_count;
+ 	mf =3D mobj_ffa_sel2_spmc_new(cookie, num_pages);
+=20
+ 	if (!mf)
+-		return NULL;
++		goto out;
+=20
+ 	if (set_pages(descr->address_range_array,
+ 				  descr->address_range_count,
+ 				  num_pages, mf)) {
+ 		mobj_ffa_sel2_spmc_delete(mf);
+-		return NULL;
+-
++		goto out;
+ 	}
+=20
+-	return mf;
++	ret =3D mf;
++
++out:
++	/* Release RX buffer after the mem retrieve request. */
++	thread_smccc(&ffa_rx_release_args);
++
++	return ret;
+ }
+=20
+ static TEE_Result spmc_init(void)
+diff --git a/core/arch/arm/mm/mobj_ffa.c b/core/arch/arm/mm/mobj_ffa.c
+index e2c585a2..8e334f04 100644
+--- a/core/arch/arm/mm/mobj_ffa.c
++++ b/core/arch/arm/mm/mobj_ffa.c
+@@ -380,9 +380,10 @@ struct mobj *mobj_ffa_get_by_cookie(uint64_t cookie,
+ 		/* Try to retrieve it from the SPM at S-EL2 */
+ 		if (mf)
+ 			DMSG("cookie %#"PRIx64" resurrecting", cookie);
+-		if (!mf)
++		if (!mf) {
+ 			EMSG("Populating mobj from rx buffer\n");
+ 			mf =3D thread_spmc_populate_mobj_from_rx(cookie);
++		}
+ #endif
+ 		if (mf) {
+ #if defined(CFG_CORE_SEL1_SPMC)
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0005-co=
re-arm-Total-Compute-platform-support.patch b/meta-arm-bsp/recipes-security=
/optee/files/optee-os/tc0/0005-core-arm-Total-Compute-platform-support.patc=
h
new file mode 100644
index 0000000..52270ec
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0005-core-arm-=
Total-Compute-platform-support.patch
@@ -0,0 +1,187 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 0c427d7f164a46862f6267b616d4ade28865b57a Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 15 Jul 2020 12:51:04 +0100
+Subject: [PATCH 2/5] core: arm: Total Compute platform support
+
+Initial support for Total Compute platform[1]
+    - defines tc0 platform configuration
+    - enables CFG_ARM64_core by default
+    - defines TZCDRAM_BASE
+
+Link: [1] https://community.arm.com/developer/tools-software/oss-platforms=
/w/docs/606/total-compute
+
+Change-Id: Icddafbdfac40bb6ff3c367910acf632688343721
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ core/arch/arm/plat-totalcompute/conf.mk       | 32 +++++++++++
+ core/arch/arm/plat-totalcompute/main.c        | 55 +++++++++++++++++++
+ .../arm/plat-totalcompute/platform_config.h   | 43 +++++++++++++++
+ core/arch/arm/plat-totalcompute/sub.mk        |  2 +
+ 4 files changed, 132 insertions(+)
+ create mode 100644 core/arch/arm/plat-totalcompute/conf.mk
+ create mode 100644 core/arch/arm/plat-totalcompute/main.c
+ create mode 100644 core/arch/arm/plat-totalcompute/platform_config.h
+ create mode 100644 core/arch/arm/plat-totalcompute/sub.mk
+
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
+new file mode 100644
+index 00000000..4fe894c7
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -0,0 +1,32 @@
++PLATFORM_FLAVOR ?=3D tc0
++
++ifeq ($(PLATFORM_FLAVOR),tc0)
++include core/arch/arm/cpu/cortex-armv8-0.mk
++platform-debugger-arm :=3D 1
++endif
++
++$(call force,CFG_WITH_ARM_TRUSTED_FW,y)
++$(call force,CFG_GENERIC_BOOT,y)
++$(call force,CFG_GIC,y)
++$(call force,CFG_ARM_GICV3,y)
++$(call force,CFG_PL011,y)
++$(call force,CFG_PM_STUBS,y)
++$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
++$(call force,CFG_ARM64_core,y)
++$(call force,CFG_WITH_LPAE,y)
++
++ifeq ($(platform-debugger-arm),1)
++# ARM debugger needs this
++platform-cflags-debug-info =3D -gdwarf-2
++platform-aflags-debug-info =3D -gdwarf-2
++endif
++
++ifeq ($(PLATFORM_FLAVOR),tc0)
++CFG_TEE_CORE_NB_CORE =3D 4
++
++CFG_TZDRAM_START ?=3D 0xff000000
++CFG_TZDRAM_SIZE  ?=3D 0x01000000
++
++CFG_SHMEM_START  ?=3D 0xfce00000
++CFG_SHMEM_SIZE   ?=3D 0x00200000
++endif
+diff --git a/core/arch/arm/plat-totalcompute/main.c b/core/arch/arm/plat-t=
otalcompute/main.c
+new file mode 100644
+index 00000000..e775abfc
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/main.c
+@@ -0,0 +1,55 @@
++/*
++ * Copyright (c) 2020, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#include <arm.h>
++#include <console.h>
++#include <drivers/gic.h>
++#include <drivers/pl011.h>
++#include <initcall.h>
++#include <kernel/boot.h>
++#include <kernel/interrupt.h>
++#include <kernel/misc.h>
++#include <kernel/panic.h>
++
++#include <mm/core_mmu.h>
++#include <platform_config.h>
++
++static struct gic_data gic_data __nex_bss;
++static struct pl011_data console_data __nex_bss;
++
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, CONSOLE_UART_BASE, PL011_REG_SIZ=
E);
++register_phys_mem_pgdir(MEM_AREA_IO_SEC, GICD_BASE, GIC_DIST_REG_SIZE);
++
++register_ddr(DRAM0_BASE, DRAM0_SIZE);
++
++void main_init_gic(void)
++{
++	vaddr_t gicc_base;
++
++	gicc_base =3D (vaddr_t)phys_to_virt(GIC_BASE + GICC_OFFSET,
++					  MEM_AREA_IO_SEC);
++	if (!gicc_base)
++		panic();
++
++	/*
++	 * On ARMv8, GIC configuration is initialized in ARM-TF
++	 * gicd base address is same as gicc_base.
++	 */
++	gic_init_base_addr(&gic_data, gicc_base, gicc_base);
++	itr_init(&gic_data.chip);
++}
++
++void itr_core_handler(void)
++{
++	gic_it_handle(&gic_data);
++}
++
++void console_init(void)
++{
++	pl011_init(&console_data, CONSOLE_UART_BASE, CONSOLE_UART_CLK_IN_HZ,
++		   CONSOLE_UART_BAUDRATE);
++	register_serial_console(&console_data.chip);
++}
+diff --git a/core/arch/arm/plat-totalcompute/platform_config.h b/core/arch=
/arm/plat-totalcompute/platform_config.h
+new file mode 100644
+index 00000000..dfc58857
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/platform_config.h
+@@ -0,0 +1,43 @@
++/*
++ * Copyright (c) 2020, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++#ifndef PLATFORM_CONFIG_H
++#define PLATFORM_CONFIG_H
++
++#include <mm/generic_ram_layout.h>
++
++/* Make stacks aligned to data cache line length */
++#define STACK_ALIGNMENT		64
++
++#if defined(PLATFORM_FLAVOR_tc0)
++#define GIC_BASE		0x30000000
++#define GICD_OFFSET		0x0
++#define GICC_OFFSET		0x0
++
++#define UART0_BASE		0x7FF70000
++#define UART1_BASE		0x7FF80000
++
++#define CONSOLE_UART_BASE	UART0_BASE
++
++#define DRAM0_BASE		0x80000000
++#define DRAM0_SIZE		0x7d000000
++
++#define TZCDRAM_BASE		0xff000000
++#define TZCDRAM_SIZE		0x01000000
++
++#else
++#error "Unknown platform flavor"
++#endif
++
++#ifdef GIC_BASE
++#define GICD_BASE		(GIC_BASE + GICD_OFFSET)
++#define GICC_BASE		(GIC_BASE + GICC_OFFSET)
++#endif
++
++#define CONSOLE_UART_BAUDRATE	115200
++#define CONSOLE_UART_CLK_IN_HZ	7372800
++
++#endif /* PLATFORM_CONFIG_H */
+diff --git a/core/arch/arm/plat-totalcompute/sub.mk b/core/arch/arm/plat-t=
otalcompute/sub.mk
+new file mode 100644
+index 00000000..8ddc2fd4
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/sub.mk
+@@ -0,0 +1,2 @@
++global-incdirs-y +=3D .
++srcs-y +=3D main.c
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-pl=
at-totalcompute-Add-support-for-S-EL2-SPMC.patch b/meta-arm-bsp/recipes-sec=
urity/optee/files/optee-os/tc0/0006-plat-totalcompute-Add-support-for-S-EL2=
-SPMC.patch
new file mode 100644
index 0000000..3070d5f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0006-plat-tota=
lcompute-Add-support-for-S-EL2-SPMC.patch
@@ -0,0 +1,108 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 8c21a8c7ac92839f36f83ebff9a208f24302c780 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 16 Nov 2020 17:29:09 +0000
+Subject: [PATCH 3/5] plat-totalcompute: Add support for S-EL2 SPMC
+
+This patch adds CFG_CORE_SEL2_SPMC support. Defines CFG_TZDRAM_START
+address with memory region reserved for SPMC. Adds secondary cpu boot
+request handler.
+
+Change-Id: I3f274c7bb6b7df2706ea81aee0f2a8f8f39c1d80
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ core/arch/arm/plat-totalcompute/conf.mk       |  5 ++
+ core/arch/arm/plat-totalcompute/sub.mk        |  3 ++
+ core/arch/arm/plat-totalcompute/tc0_spmc_pm.c | 50 +++++++++++++++++++
+ 3 files changed, 58 insertions(+)
+ create mode 100644 core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
+
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
+index 4fe894c7..34095acf 100644
+--- a/core/arch/arm/plat-totalcompute/conf.mk
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -24,8 +24,13 @@ endif
+ ifeq ($(PLATFORM_FLAVOR),tc0)
+ CFG_TEE_CORE_NB_CORE =3D 4
+=20
++ifeq ($(CFG_CORE_SEL2_SPMC),y)
++CFG_TZDRAM_START ?=3D 0xfd281000
++CFG_TZDRAM_SIZE  ?=3D 0x01d7f000
++else
+ CFG_TZDRAM_START ?=3D 0xff000000
+ CFG_TZDRAM_SIZE  ?=3D 0x01000000
++endif
+=20
+ CFG_SHMEM_START  ?=3D 0xfce00000
+ CFG_SHMEM_SIZE   ?=3D 0x00200000
+diff --git a/core/arch/arm/plat-totalcompute/sub.mk b/core/arch/arm/plat-t=
otalcompute/sub.mk
+index 8ddc2fd4..ffd76ee9 100644
+--- a/core/arch/arm/plat-totalcompute/sub.mk
++++ b/core/arch/arm/plat-totalcompute/sub.mk
+@@ -1,2 +1,5 @@
+ global-incdirs-y +=3D .
+ srcs-y +=3D main.c
++ifeq ($(CFG_CORE_FFA),y)
++srcs-y +=3D tc0_spmc_pm.c
++endif
+diff --git a/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c b/core/arch/arm=
/plat-totalcompute/tc0_spmc_pm.c
+new file mode 100644
+index 00000000..8e59a8cc
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/tc0_spmc_pm.c
+@@ -0,0 +1,50 @@
++// SPDX-License-Identifier: BSD-2-Clause
++/*
++ * Copyright (c) 2020, Arm Limited
++ */
++
++#include <arm.h>
++#include <kernel/boot.h>
++#include <ffa.h>
++#include <sm/psci.h>
++
++/*
++ * Lookup table of core and cluster affinities on the TC0. In the absence=
 of a
++ * DT that provides the same information, this table is used to initialis=
e
++ * OP-TEE on secondary cores.
++ */
++static const uint64_t core_clus_aff_array[] =3D {
++	0x0000,		/* Cluster 0 Cpu 0 */
++	0x0001,		/* Cluster 0 Cpu 1 */
++	0x0002,		/* Cluster 0 Cpu 2 */
++	0x0003		/* Cluster 0 Cpu 3 */
++};
++
++void ffa_secondary_cpu_boot_req(vaddr_t secondary_ep, uint64_t cookie)
++{
++	unsigned long mpidr =3D read_mpidr();
++	unsigned int aff_shift =3D 0;
++	unsigned long a1 =3D 0;
++	unsigned int cnt =3D 0;
++	int32_t ret =3D 0;
++
++	if (mpidr & MPIDR_MT_MASK)
++		aff_shift =3D MPIDR_CLUSTER_SHIFT;
++
++	for (cnt =3D 0; cnt < ARRAY_SIZE(core_clus_aff_array); cnt++) {
++		/* Clear out the affinity fields until level 2 */
++		a1 =3D mpidr & ~(unsigned long)MPIDR_AARCH32_AFF_MASK;
++
++		/* Create an mpidr from core_clus_aff_array */
++		a1 |=3D core_clus_aff_array[cnt] << aff_shift;
++
++		/* Invoke the PSCI_CPU_ON_SMC64 function */
++		ret =3D thread_smc(PSCI_CPU_ON_SMC64, a1, secondary_ep, cookie);
++
++		if (ret !=3D PSCI_RET_SUCCESS)
++			EMSG("PSCI_CPU_ON op on mpidr 0x%lx failed %"PRId32,
++			     a1, ret);
++		else
++			DMSG("PSCI_CPU_ON op on mpidr 0x%lx done", a1);
++	}
++}
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-pl=
at-totalcompute-add-optee-manifest-file-and-sp-lay.patch b/meta-arm-bsp/rec=
ipes-security/optee/files/optee-os/tc0/0007-plat-totalcompute-add-optee-man=
ifest-file-and-sp-lay.patch
new file mode 100644
index 0000000..6535496
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0007-plat-tota=
lcompute-add-optee-manifest-file-and-sp-lay.patch
@@ -0,0 +1,73 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 582bf63102ec37dadff2147dcebcb62783dcf377 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 16 Nov 2020 18:03:21 +0000
+Subject: [PATCH 4/5] plat-totalcompute: add optee manifest file and sp lay=
out
+
+For S-EL2 SPMC, add optee manifest file and sp layout file
+
+Change-Id: Ic3179987decf4e017cd4a0ad91b3beeea2bd6ca1
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ .../arm/plat-totalcompute/optee_manifest.dts  | 33 +++++++++++++++++++
+ .../arch/arm/plat-totalcompute/sp_layout.json |  6 ++++
+ 2 files changed, 39 insertions(+)
+ create mode 100644 core/arch/arm/plat-totalcompute/optee_manifest.dts
+ create mode 100644 core/arch/arm/plat-totalcompute/sp_layout.json
+
+diff --git a/core/arch/arm/plat-totalcompute/optee_manifest.dts b/core/arc=
h/arm/plat-totalcompute/optee_manifest.dts
+new file mode 100644
+index 00000000..4e60cbe1
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/optee_manifest.dts
+@@ -0,0 +1,33 @@
++/*
++ * Copyright (c) 2020, Arm Limited. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ *
++ * This file is a Partition Manifest (PM) for a minimal Secure Partition =
(SP)
++ * that has additional optional properties defined.
++ *
++ */
++
++/dts-v1/;
++
++/ {
++	compatible =3D "arm,ffa-manifest-1.0";
++
++	/* Properties */
++	description =3D "op-tee";
++	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
++	uuid =3D <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
++	id =3D <1>;
++	execution-ctx-count =3D <4>;
++	exception-level =3D <2>; /* S-EL1 */
++	execution-state =3D <0>; /* AARCH64 */
++	load-address =3D <0xfd280000>;
++	entrypoint-offset =3D <0x1000>;
++	xlat-granule =3D <0>; /* 4KiB */
++	boot-order =3D <0>;
++	messaging-method =3D <0>; /* Direct messaging only */
++	run-time-model =3D <1>; /* Run to completion */
++
++	/* Boot protocol */
++	gp-register-num =3D <0x0>;
++};
+diff --git a/core/arch/arm/plat-totalcompute/sp_layout.json b/core/arch/ar=
m/plat-totalcompute/sp_layout.json
+new file mode 100644
+index 00000000..05bc7851
+--- /dev/null
++++ b/core/arch/arm/plat-totalcompute/sp_layout.json
+@@ -0,0 +1,6 @@
++{
++	"op-tee" : {
++		"image": "tee-pager_v2.bin",
++		"pm": "optee_manifest.dts"
++	}
++}
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-pl=
at-totalcompute-define-tzdram-start-address-for-S-.patch b/meta-arm-bsp/rec=
ipes-security/optee/files/optee-os/tc0/0008-plat-totalcompute-define-tzdram=
-start-address-for-S-.patch
new file mode 100644
index 0000000..015bdc9
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0008-plat-tota=
lcompute-define-tzdram-start-address-for-S-.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 1827607c6381339d051a36a84d749c3a50e3463d Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 16 Nov 2020 17:38:07 +0000
+Subject: [PATCH 5/5] plat-totalcompute: define tzdram start address for S-=
EL1
+ SPMC config
+
+Define TZDRAM_START for CFG_CORE_SEL1_SPMC config
+
+Change-Id: I71aaa92a0ecdb791802336ca31ab52e97ee52955
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ core/arch/arm/plat-totalcompute/conf.mk | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/plat-totalcompute/conf.mk b/core/arch/arm/plat-=
totalcompute/conf.mk
+index 34095acf..d330eb92 100644
+--- a/core/arch/arm/plat-totalcompute/conf.mk
++++ b/core/arch/arm/plat-totalcompute/conf.mk
+@@ -24,7 +24,10 @@ endif
+ ifeq ($(PLATFORM_FLAVOR),tc0)
+ CFG_TEE_CORE_NB_CORE =3D 4
+=20
+-ifeq ($(CFG_CORE_SEL2_SPMC),y)
++ifeq ($(CFG_CORE_SEL1_SPMC),y)
++CFG_TZDRAM_START ?=3D 0xfd000000
++CFG_TZDRAM_SIZE  ?=3D 0x02000000
++else ifeq ($(CFG_CORE_SEL2_SPMC),y)
+ CFG_TZDRAM_START ?=3D 0xfd281000
+ CFG_TZDRAM_SIZE  ?=3D 0x01d7f000
+ else
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc b/met=
a-arm-bsp/recipes-security/optee/optee-client-tc0.inc
index 8b13386..ad9c475 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-client-tc0.inc
@@ -3,3 +3,10 @@
 # Intermediate SHA with 3.11 baseline version
 SRCREV =3D "3f44b870299514ad8c6b7dee776eb2994d9c1cd4"
 PV =3D "3.11.0+git${SRCPV}"
+
+FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/optee-client/tc0:"
+
+SRC_URI_append =3D " \
+    file://0001-Revert-libteec-Avoid-memcpy-when-using-TEEC_TempMemo.patch=
 \
+    file://0002-Allocate-page-aligned-shared-memory-buffers.patch \
+    "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-ar=
m-bsp/recipes-security/optee/optee-os-tc0.inc
index a700daf..fc89a9f 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -9,7 +9,20 @@ SRC_URI_remove =3D " \
     file://0001-libutils-provide-empty-__getauxval-implementation.patch \
     file://0002-link.mk-implement-support-for-libnames-after-libgcc-.patch=
 \
     file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch=
 \
-"
+    "
+
+FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/optee-os/tc0:"
+
+SRC_URI_append =3D " \
+    file://0001-core-SPMC-update-for-FF-A-version-1.0.patch \
+    file://0002-core-add-thread_smccc.patch \
+    file://0003-core-enable-SPCI-with-SPM-Core-at-S-EL2.patch \
+    file://0004-core-fixes-to-align-with-upstream-hafnium.patch \
+    file://0005-core-arm-Total-Compute-platform-support.patch \
+    file://0006-plat-totalcompute-Add-support-for-S-EL2-SPMC.patch \
+    file://0007-plat-totalcompute-add-optee-manifest-file-and-sp-lay.patch=
 \
+    file://0008-plat-totalcompute-define-tzdram-start-address-for-S-.patch=
 \
+    "
=20
 COMPATIBLE_MACHINE =3D "tc0"
=20
--=20
2.29.2

