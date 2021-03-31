Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web08.5544.1617191671069012554
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 04:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=M5MC/9VL;
 spf=pass (domain: arm.com, ip: 40.107.7.57, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNjUnBSLZER7Z3RSXBOIMH8MyPyjlLmV/JAQLA8qPqU=;
 b=M5MC/9VLV+7jrzHVqiRRAUrdkalBVB/HbDvsVFR4o3yWB7GiWXag1DG1jK/VofmkXfrFXxON0UpLbfrTe5H1K7wyo3JzdBywJakPAfyKNUTDMLnXMNhEySIyMNcu6SAytZReoaPinyveuQ9z0VNVhNgbsRJ/3HC6DG6GUwufMkE=
Received: from AM5PR0301CA0030.eurprd03.prod.outlook.com
 (2603:10a6:206:14::43) by AM6PR08MB3239.eurprd08.prod.outlook.com
 (2603:10a6:209:47::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 11:54:07 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::1e) by AM5PR0301CA0030.outlook.office365.com
 (2603:10a6:206:14::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend
 Transport; Wed, 31 Mar 2021 11:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Wed, 31 Mar 2021 11:54:06 +0000
Received: ("Tessian outbound fe4dea6b191c:v89"); Wed, 31 Mar 2021 11:54:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 180a9e4ffa34a339
X-CR-MTA-TID: 64aa7808
Received: from 101b76c58f54.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D60ABFC8-9D25-40A7-92A9-CC4651A38F67.1;
	Wed, 31 Mar 2021 11:54:00 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 101b76c58f54.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Mar 2021 11:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH1EyUWl7V/19HvGxIVRbRXr1RhT9q+wDJXKotp5FCgoOTktzkgza/3rmGZetcPjKdtElSCtLhGlYZI6YV9FtX6YYf2EmyZwtjUoxaDS+iDAe5kerxwZilJsGAQMaFM8WwnQUM3qR/laYwnEntc/ytI2gACAJIIw3Xuol22x45mYEghtw4OsEI9KzqaexOabZceSEBwnP7yhBVXJrN9d96g1tkgNW/ujcx7jEQHwxIiUjyOgElQ/FiHc7zrZo3jOfkGOE0JISbwleO7mB0ejTP23CWOwg8A7hQnlMLSnTuKrIPoONnJ/kr6Z4hRGSNLnVdTdugF1t0++M+Yp4IToig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNjUnBSLZER7Z3RSXBOIMH8MyPyjlLmV/JAQLA8qPqU=;
 b=M1K6IK8GAx/gRSx/nfrBrAPiMzN42t9Zqsf6KD/FBYdA6MaqbKoSwp3dPSBLobBm+OaMxRwuAxro70kCEDUr5L4p08z46L40pdHnHz2jfDVP4zKenFTDSqMuV43uYj/LMUDtnD9eE+QPLniCeZGq652JwEqRmu6iz5rBx/on85h0vOrtWWvD2+Vdhy4jUygLMeIjPKYrU/XGzo9xD23HdwHuYdk8VOvHNmvdxHdSEJHsG0SThknZpliu+FpnkaUbbiYnxb9JUuIyRdcThYk9LsM+fN4tAGdYNLSS4Ikf4cai4aA8vOBZ1NN+lGm+/b2oTzQn7o0eH5HYaSbvIbMiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNjUnBSLZER7Z3RSXBOIMH8MyPyjlLmV/JAQLA8qPqU=;
 b=M5MC/9VLV+7jrzHVqiRRAUrdkalBVB/HbDvsVFR4o3yWB7GiWXag1DG1jK/VofmkXfrFXxON0UpLbfrTe5H1K7wyo3JzdBywJakPAfyKNUTDMLnXMNhEySIyMNcu6SAytZReoaPinyveuQ9z0VNVhNgbsRJ/3HC6DG6GUwufMkE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 11:53:57 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 11:53:57 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/6] arm-bsp/linux: Introduce FVP common config fragment
Date: Wed, 31 Mar 2021 12:53:45 +0100
Message-Id: <76240d06ffae62dcc39d2372c39750ef183f32f7.1617191477.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
References: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend Transport; Wed, 31 Mar 2021 11:53:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbb7b216-2295-4dfe-e271-08d8f43bb009
X-MS-TrafficTypeDiagnostic: AS8PR08MB6536:|AM6PR08MB3239:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3239D03A2B399752E27D53D3927C9@AM6PR08MB3239.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:296;OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ISmyX/PSpCXQP3oPnKCUT8xe1fs7FMbZf3P3nt3kygk6i9bQKJzIquDALDHqHVVXp5rfeWsA3MRvWroug4lllZIA4aYprf830nmWx9q8RopVaOZsAPsV1BQf2B2WpcAEd8te2Wc36HUqvAMEBrXHRiGpRZslPZWTBRv26EY1RZ1J3YXix/aoy2jI7g4nUoKF/41uk8o+T6ohGbOlvldGWjeggQHo6q1OjyeM1Fb+DIUAcHX1u189XTvvd0LjvnrQ7aeQEAejiYWxbkiIRWrQB0tMgAVKDfxXld/UbO2nhI8aRhM13sNTfRyFCfu+3b+eYmEQZMsFy4cSFOCOul9HSrj3DWZFIUDUyO5OG9DfgCDRpYYJeWwE+cUY42pM7bpDNgx/7v2aEvlvT92kOuwaubBieimU4esXntsTI0xWGlRlLz4pCr2UPlGUtLgY60v8nzgR0THIYPb9sczDcm4CC3lXweeZh5BcSPRXlE0tQs2KNyyt9tTxKRZp3CmBEhP7Oh4/SV1TrZrU522ziXWg7iotw506Rq/XdO7nRXDzuyLESV3nMRVN1nukWzNtIhc+dffYio9KaxXqynEUQirtoRczQFYIBmh5UgOLgpYvm/LpOooLMUB5c4OX259h57qtzXaJ41Un9Hy/2Hktx/uzPWPaUqrJIhJPRRs7U9JeZM4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(6486002)(316002)(66946007)(36756003)(186003)(6666004)(86362001)(4744005)(2906002)(7696005)(5660300002)(66476007)(66556008)(26005)(52116002)(44832011)(16526019)(956004)(2616005)(4326008)(6916009)(478600001)(8936002)(8676002)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?L8S+R1VYU4DWYFeakrE5uI//MEs8XPjGWOk6FhGT/wHOLc1HlwGBfilhysZv?=
 =?us-ascii?Q?CNr3n2NGJghaw5cG4eNwgGbnZLEIvln9JgrfKUXo+pbbNdBkOG9EqlLJMhOB?=
 =?us-ascii?Q?7ZeRhd8QiQv0dTzlLNXued/J1pEDU/p/KozELCckGC4Nku1xEcia5XeBFFKP?=
 =?us-ascii?Q?2rBfDzyobdfD/Oh66NfrpaHFvwscxloa8YrmXpFq4hIwjF0jh3Q9w47+Uerc?=
 =?us-ascii?Q?C9lk0j0qL32IKJns0iorkr3i1FE4GS+f4e/r9WAqiNskyCCQA9By1MtdDZdy?=
 =?us-ascii?Q?2G0Ey9ZbFv+0VTCjIAFwgFjCEMZaIh+jBEEVHXIzY6vmxb4rf4R/On7xFqWg?=
 =?us-ascii?Q?CN+AfcGsGolF5SAUw7TgVFoW4DR30+2jVxSsuDzLAZ0pekAraElwKJHqD9iT?=
 =?us-ascii?Q?WojAZgBDY1r12DnpDks2C92ihRaqdri77np8PxIEEzCprBsl2oIND2rLAawI?=
 =?us-ascii?Q?VV3ZB4Yl4x8Tv4IigPaHjFtc//3yDKschKVmeCIGvb4iutp5fKB609CAPKkU?=
 =?us-ascii?Q?IYLRMAzcgVO9ZEjtAWVTGgqGFIAeFVag8agLU4fFhPNOUgCZ+NZaZJTdEszb?=
 =?us-ascii?Q?pOkyX7q4qODFqRUZqpZa7uNbH9Qe2ydK/0k8VCJxl6jy8ZnYjjKf6XAYRg0J?=
 =?us-ascii?Q?igGUaCMIfqotFm3aWpdGpbMHHOOs10VXDsoGBAyYqt+ntwaH/rzj0oktA4vY?=
 =?us-ascii?Q?BOhqc8XeADP+07tRJCf4UF8n2xf/ctf1MliB2F9M2Y+w9hheNU9ZDdIsXcVQ?=
 =?us-ascii?Q?Ih6k8NhD+sWl0DcQCWuKOJyWf3tIpyLTC4DmZngKbG92BEFHZ7k7fLV0ascq?=
 =?us-ascii?Q?lpvQTyaTgBK67XvmBZ29DVdMBWE7lOEpggtEmcoiqNnXfL+cTECpetrQYI3K?=
 =?us-ascii?Q?CrzIZpqMvYsBfqCF47o4ABpMliNrMEU7sxiVOHtB1aVof+n5V0nC+FTSE9aD?=
 =?us-ascii?Q?6d4XanNWMt23KKf+kiSRjxGmbm5L4zbwrhe1HBnqEXzydnDAwNEEv0FY7DIw?=
 =?us-ascii?Q?MTGY62NzQU+Ep1f8ko3dXFX3CaykjE83/rUAFH/vVHE6cqo5Pn198C9GFe/f?=
 =?us-ascii?Q?q4ZjKpsMuUsXLJPu4s6PsNP3I79cEmLM+0Lqiv0LPIxoI3o512y42j/pjb9K?=
 =?us-ascii?Q?FvsiIrK7rq2X7jgFExxEr2IrFkuPz1JLk/OKHuD1yfW9XcKGeTSnCnHYyrIA?=
 =?us-ascii?Q?Xn1gRsHAtmYnD5bbOR3Lts00zhodK3lqOp7mtb/UfBAm6nnBVqfQvtYW4wdb?=
 =?us-ascii?Q?11dw6Wx8K//S78SPQCcAQ2UZxL2vxmRzoHRyoclODIxuR5OLMbmhx7S3JdfV?=
 =?us-ascii?Q?9qVcC6SmUBj3yGTQ2pewnib8?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e365af8b-3605-4b1f-6eeb-08d8f43baa7a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+9C9wc/h1mHkAjumvZZwaZ7y5Vm3B6Rk1N8dYQkWl9XdJZ06HC++LnY4jDlhe5v5tI8gzy2Rv+aQ5czIUDvl2vOTYaGfZlurN+arpYQHPjKcFS518U5AHkUxMZyEQMfdqAlbR1vAbZFKtRzOIU+7NjFN0dNopE1HoHwHzgflQhL1fJ/rcoLUlReu713zv6xwX/OGJeqWzOF42/eGm9Huod62pzwQa4vron8xDxO1lMg2H4IAtP1/0XEXe5bIIDI3FLlAklDqS3ilXetF6VUyB6d+S33dyIT5WWPR9+dMDtqz9ea5utXp1IZUoLi+QQV+kXOT57rPaCdVyYc3f8N/1/4hOAj5QKFScU7yOUX6Kof55HaQ24V1XBiRCCOAbp1aUXJGyFHS7rPLBdjz0XNxtv6PQXXNJHVsPUK2ctI2IXe2KNmcdbVYV9kENobbvEPuKyiIl+82pn/CIIXVdDCY6d4MdU0s0gEle4YijI0HLiv9siciEncdOUTg6NHVIVWdLIQaSyfjIh5DcJXVNUHkUmm+AUe0EtN5VGJA7N/DFjznc6coNqOPGrHYB1ztLSsoVznjyk9rfI8bLvpl8PAHjddw3PrEbZP7rPEu/+i0mP60xrBbuXyotfmYA41vi/+yTYMWCvt+48HtcyvNAkU9YQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(36840700001)(46966006)(8936002)(478600001)(86362001)(6486002)(47076005)(81166007)(316002)(26005)(356005)(4744005)(4326008)(8676002)(36756003)(956004)(336012)(70206006)(44832011)(70586007)(5660300002)(7696005)(2616005)(16526019)(186003)(36860700001)(6666004)(82310400003)(6916009)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:54:06.5321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb7b216-2295-4dfe-e271-08d8f43bb009
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3239
Content-Type: text/plain

Issue-Id: SCM-2121
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Ic829801d2d32d6702f49adcd79f0f24a4595bbe1
---
 .../bsp/arm-platforms/fvp-common-peripherals.cfg          | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-common-peripherals.cfg

diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-common-peripherals.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-common-peripherals.cfg
new file mode 100644
index 0000000..ecb3cc9
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-common-peripherals.cfg
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: MIT
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+
+CONFIG_ARM_SP805_WATCHDOG=y
+
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_PL031=y
-- 
2.17.1

