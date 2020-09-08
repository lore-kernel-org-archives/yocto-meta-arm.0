Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.86])
 by mx.groups.io with SMTP id smtpd.web11.15044.1599550089935744189
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 00:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dk2WTb1T;
 spf=pass (domain: arm.com, ip: 40.107.21.86, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuJxEbbxU86b1OnWZi8bz8kuq6go/K3wbG4kYxgMgl8=;
 b=dk2WTb1Tt2qk+cvkUaYhZgqI6bznLaiO9QwOi2pPhgkqYhLwJChuWw25Rhxpv52HWtLmLvoeKKVvsvFvQxMkNXXStX1zXJDYZZYaO29KS7iuoExDThBXe4XbpY0FIw2rEb4j9YX30lWTm/7m+5uJNA+h20HRioz6q6Tx2Mv7vhY=
Received: from AM0PR10CA0076.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::29)
 by VE1PR08MB5120.eurprd08.prod.outlook.com (2603:10a6:803:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 07:28:06 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::49) by AM0PR10CA0076.outlook.office365.com
 (2603:10a6:208:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Tue, 8 Sep 2020 07:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 07:28:02 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Tue, 08 Sep 2020 07:28:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0f13c941748b3cd
X-CR-MTA-TID: 64aa7808
Received: from c97ab9de7554.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 803361BE-6BDF-4511-991D-F90B0745AA4A.1;
	Tue, 08 Sep 2020 07:27:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c97ab9de7554.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 07:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ienf9pgwuO1NkLB90q0qYxQkKlug5N1aekgQ0hz8z6RPrXP1YkWN3kT3TF8urssbDblybdehyICpS/PgwZ54/Owu6ZCfTZX7RsKRFkpzjTPDgL0BRINmOyEWghYaS6bRBYXOPc8ZnEjBI3Ac1C5XPkjoiOFc3mmoG6VqNj/r0JhsT8wNEM7OkBMISFsfCvN1qUe+4OqHwguCAD1cOUfolqBab+GHLsjw3uS2lB6D3MFhUnF7jamyligP8uHs/7Oqk+qdeQA7npvE3EdXINOaiFADeGiFBY/mhCyB3Clp3NCS0Us3Vsp3pPZ7TSdmCdPNOSVU7/IRFHC5F3njXJXQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuJxEbbxU86b1OnWZi8bz8kuq6go/K3wbG4kYxgMgl8=;
 b=MR8Lxm0fZ8thJgvGxN+tSEXkFYAsdyh1xL8pwjUJ6lng9dZ04XsPR8urnZwOWWYlbvK4uddC2xtuK1DPOJTCbxHcpXxO8LEo82IWtpVaKmQqT6iKJ7pSwGZmvy45VIVoiiZcxPzl6I+jSqinCL4C1gApvFh2ChSApbuVfwqp2Pa16lZfvV7eMxaxDiwFaV4lYX+ZwSnvVD7b4sRvJeAIpZ4KUO50A0v/bNHSqTIov6qkwq1mtSghVUwWoJ0KpWqUNojKDV1KAffbrem2eemn7HurMo8HY8Sxi+7Qn3Kps5f0OwpPmpt3VLYOQYfRnnCjcCANApC+dstkuTtkBQAIGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuJxEbbxU86b1OnWZi8bz8kuq6go/K3wbG4kYxgMgl8=;
 b=dk2WTb1Tt2qk+cvkUaYhZgqI6bznLaiO9QwOi2pPhgkqYhLwJChuWw25Rhxpv52HWtLmLvoeKKVvsvFvQxMkNXXStX1zXJDYZZYaO29KS7iuoExDThBXe4XbpY0FIw2rEb4j9YX30lWTm/7m+5uJNA+h20HRioz6q6Tx2Mv7vhY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB2964.eurprd08.prod.outlook.com (2603:10a6:208:5d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 07:27:49 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:27:49 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Sayanta Pattanayak <sayanta.pattanayak@arm.com>
Subject: [PATCH v2 2/3] arm-bsp/linux-linaro-arm-5.4: n1sdp: pcie: add quirk support to enable remote chip PCIe
Date: Tue,  8 Sep 2020 12:57:25 +0530
Message-Id: <20200908072726.18776-2-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908072726.18776-1-khasim.mohammed@arm.com>
References: <20200908072726.18776-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: DM3PR12CA0057.namprd12.prod.outlook.com
 (2603:10b6:0:56::25) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM3PR12CA0057.namprd12.prod.outlook.com (2603:10b6:0:56::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 07:27:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7dc5463c-0191-4384-70c2-08d853c8b93a
X-MS-TrafficTypeDiagnostic: AM0PR08MB2964:|VE1PR08MB5120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB5120317D716EDFE5AAF86A7FFA290@VE1PR08MB5120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lj7sDuoLFrR/rhaXaq92iIR07UKW2nrDgZTXirBcDel5w4f9D6ZEQ4ubF4V9Ipa2L/oaeae7z2XGaWKrv+LXPje4F1rEIYYlvORYatJiFYa587h08wny9Xx6i8/xwHKJqHndbWNMLjFykyCKUcH7SRCz0PicgMHSucI4yE87IEzR79IwbgA4StrDEtuUyCFbBb8ge4AGI9Xyr5tgiHdzGNNZ+fd6qTi+2O8gC7T74Pbtp+kcmAPH+2O8h0TunGavHq8Y7ouPVzrIkPxHJJPvh1Ill76ZHh4TEzkgli538g/UmoejkRL3YqEt4eBlptSBHGEuf4MfQOeMtt/z0mXcE6WCIt0ztVk3awbkp/1SKQOESOZAE6vmf8JQumTB/9MZSnhhD39yYpShk1QNkA4GEc+72TS9XJMBTQT8t2TypcpSmFO63yx0JDgXR/Omiqn110uD82uOqCBmW1Pk8g7cL/9RZCuGmVv/8RRXVdZ9WY4E/+CrglT+afiH9uWOyrZ1
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(26005)(316002)(8676002)(52116002)(7696005)(6486002)(1076003)(66556008)(2616005)(6666004)(956004)(66476007)(66946007)(4326008)(36756003)(54906003)(186003)(16526019)(83380400001)(2906002)(86362001)(478600001)(5660300002)(6916009)(8936002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 2gcKHubZHsJ5NSpU84LI8zkL6D5H1tQh6bnW+uTui9LHZZ94LCmf4C+a/HwCEwCMMzCuW2WBek0K/80Xe/N8tBurrUAyFZrc0hYGW4moGXZM1tLjPwqiHk29DRjUXb0NE7ssdI8lhJgl4+x1AvEei8zYFekTGhfRBtw73bCCIpvaih6j8BmUZl8hnXR0nljI8msN8dXcUektn7oDnF+jC9eHmpf2MKWYMtIwInTzHlY2M/+xxBZfV0De19nunnYMrjRprUualLPp5xkJRh674lEWbaVB3HXtPyGSj5k6tF1z3f2AgwpxpXb+d3AqLgR7LTqT4RENH86aNBFm34dtaJHPXTOuRtEvnEkjC+tTFpIuWB6FOi7RhZuINH++EWhdkYtoC23itluMW+hMrrrAmA5UjSKLOTvdHtYm+2Ke4d7GT3j58ID7Ct/rRGswoqh8sO/exE+y8wGCEV0eYzDrup0PHo4TJCvxq5vJGHW+MxtYTIpgjH3Ml/ZX9oYBKZfwuGYbvLMOuKQ/mwYHW5PoJdUdiGzAquGGCy0As+KGg6Fqppwiok8X1q8Mwvzts0owZ80i8ZdRxmNtdw1Hx5wEutPhCt/afXibz6KVPYnEPwPmAiUo4FFr3uSEPBXgntQ7o3TbBUfe9CkHKNh9NaWDLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2964
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26f1ce98-c2ad-48f0-ce60-08d853c8b00f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mxk/f9pYkgllgyIvGKsnz95FfFi6h5gJZ8F5NPecy/mZgUn+OJz2yVSRwwRciCydr4RR2IjSd2oVcsi1hCOW+OPAa/jO+CnELvlDGMsXgLBUcSeBU66ocukA3Xpzp2JsRSiLYGjo+dba3afpCo0aR1JnySE/CnVa7m8gKp2sEp0jAsTR8JTUonyj3N+uXH1fXTVcqYhzJoUJCm8pg700hIUraCgKDQgIiw+GWwjmqMGRfKevsMDmkgk/x3MOSyO/Q80IVMYD/JZ0CIpM+FFVA8q3cis5L8jUNXlTQfSZ18hUpKhrItoyztfnY4m5yepipbyw5aXu858EAZNwUwc8rVOi+Y6YFBqA1G4vSdoGhNZTaLd9hnsIYnGE8zfLws4ZnGviAO+F0+ElKJZD6F7MZS/tvszf29mUdUI4Ua/1iXJcq2dHy9wnqprAuIrPREVQjzZFtRowzWlLw6DHBZxh770hPR43cDHkRD9AZMbxqSfj4YsiOxnywci7Z+o7GDWtjshQDiz4BPnRTMVBEt/b3MeVoa7IllvlWauEncLfGNPNVtEvwlPglyaQZeNFgNHM
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(4326008)(6666004)(26005)(47076004)(2906002)(356005)(81166007)(336012)(6916009)(16526019)(70586007)(70206006)(186003)(54906003)(82310400003)(36906005)(83380400001)(2616005)(478600001)(956004)(6486002)(86362001)(36756003)(82740400003)(1076003)(316002)(8676002)(7696005)(8936002)(5660300002)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 07:28:02.4441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc5463c-0191-4384-70c2-08d853c8b93a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5120
Content-Type: text/plain

Base address mapping for remote chip Root PCIe ECAM space.

Remote Chip PCIe topology is enumerated in Firmware and current
change takes reference of enumerated PCIe hierarchy of Remote chip into the
kernel and include in complete PCIe topology for kernel framework.

Change-Id: I2bbceb5c89cc8fb4609e646652917cd97d638a27
Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 ...uirk-support-enabling-remote-chip-PC.patch | 134 ++++++++++++++++++
 .../linux/linux-linaro-arm_5.4.bbappend       |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
new file mode 100644
index 0000000..d3db77a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -0,0 +1,134 @@
+Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
+
+This patch is picked from the git repository:
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/patch/?id=04b7e76d0fe6481a803f58e54e008a1489d713a5
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From 94892f681463908e4a879258dfd6053bbb025447 Mon Sep 17 00:00:00 2001
+From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+Date: Fri, 31 Jul 2020 15:32:24 +0530
+Subject: [PATCH 5/5] n1sdp: pcie: add quirk support enabling remote chip PCIe
+
+Base address mapping for remote chip Root PCIe ECAM space.
+
+Remote Chip PCIe topology is enumerated in Firmware and current
+change takes referecne of enumerated PCIe hierarchy of Remote chip into the
+kernel and include in complete PCIe topology for kernel framework.
+
+Change-Id: I368e51c535ac66e48bd356bd33da6c49f1a0fb2a
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+---
+ drivers/acpi/pci_mcfg.c             |  1 +
+ drivers/pci/controller/pcie-n1sdp.c | 34 ++++++++++++++++++++++++++---
+ include/linux/pci-ecam.h            |  1 +
+ 3 files changed, 33 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index 7a2b41b9ab57..53d073ef941f 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -149,6 +149,7 @@ static struct mcfg_fixup mcfg_quirks[] = {
+ 	/* N1SDP SoC with v1 PCIe controller */
+ 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
+ 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
+ };
+ 
+ static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
+index 04c0de043817..19b573468ac5 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -28,8 +28,10 @@
+ 
+ /* Platform specific values as hardcoded in the firmware. */
+ #define AP_NS_SHARED_MEM_BASE	0x06000000
+-#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
++/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip*/
++#define MAX_SEGMENTS		3
+ #define BDF_TABLE_SIZE		SZ_16K
++#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
+ 
+ /*
+  * Shared memory layout as written by the SCP upon boot time:
+@@ -100,7 +102,10 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
+ 	if (segment >= MAX_SEGMENTS)
+ 		return -ENODEV;
+ 
+-	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++	if (segment > 1)
++		table_base = AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
++	else
++		table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
+ 
+ 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
+ 				"PCIe valid BDFs")) {
+@@ -122,7 +127,13 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
+ 
+ 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
+ 
+-	rc_remapped_addr[segment] = devm_ioremap_nocache(dev,
++
++	if (segment > 1)
++		rc_remapped_addr[segment] = devm_ioremap_nocache(dev,
++						shared_data->rc_base_addr + REMOTE_CHIP_ADDR_OFFSET,
++						PCI_CFG_SPACE_EXP_SIZE);
++	else
++		rc_remapped_addr[segment] = devm_ioremap_nocache(dev,
+ 						shared_data->rc_base_addr,
+ 						PCI_CFG_SPACE_EXP_SIZE);
+ 	if (!rc_remapped_addr[segment]) {
+@@ -145,6 +156,11 @@ static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
+ 	return pci_n1sdp_init(cfg, 1);
+ }
+ 
++static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 2);
++}
++
+ struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
+ 	.bus_shift	= 20,
+ 	.init		= pci_n1sdp_pcie_init,
+@@ -165,6 +181,16 @@ struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops = {
+ 	}
+ };
+ 
++struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops = {
++	.bus_shift	= 20,
++	.init		= pci_n1sdp_remote_pcie_init,
++	.pci_ops	= {
++		.map_bus        = pci_n1sdp_map_bus,
++		.read           = pci_generic_config_read32,
++		.write          = pci_generic_config_write32,
++	}
++};
++
+ static const struct of_device_id n1sdp_pcie_of_match[] = {
+ 	{ .compatible = "arm,n1sdp-pcie" },
+ 	{ },
+@@ -186,6 +212,8 @@ static int n1sdp_pcie_probe(struct platform_device *pdev)
+ 		return pci_host_common_probe(pdev, &pci_n1sdp_pcie_ecam_ops);
+ 	case 1:
+ 		return pci_host_common_probe(pdev, &pci_n1sdp_ccix_ecam_ops);
++	case 2:
++		return pci_host_common_probe(pdev, &pci_n1sdp_remote_pcie_ecam_ops);
+ 	}
+ 
+ 	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index 03cdea69f4e8..2270662428e1 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -59,6 +59,7 @@ extern struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x */
+ extern struct pci_ecam_ops al_pcie_ops; /* Amazon Annapurna Labs PCIe */
+ extern struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
+ extern struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
++extern struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N1SDP PCIe */
+ #endif
+ 
+ #ifdef CONFIG_PCI_HOST_COMMON
+-- 
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index 84e75e0..2904bab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -11,6 +11,7 @@ SRC_URI_append_n1sdp = " \
     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
     file://enable-realtek-R8169.cfg \
     file://scripts-dtc-remove-redundant-YYLOC.patch \
     "
-- 
2.17.1

