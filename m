Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.55])
 by mx.groups.io with SMTP id smtpd.web11.11850.1599133280468641879
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 04:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Tqs9ulvj;
 spf=pass (domain: arm.com, ip: 40.107.3.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0I62G6P2wdyfLQRHDu2OHvDpHClbZ/RBtGXM0lO+N0=;
 b=Tqs9ulvjhlOsJ6cdv2dDKu/BVmRj+uq8PMPRIs12Dh9mDVq4RmoKtKdLCQkmT5mFvgjhsnlr2HGoHEYZsudKTuQM8joLmTY2TnkIt4p34FQ1aVG6+3SV1dNIXA0UBfcMiw794ENyzDR/EZymEV2rLaABhCPRGT20byFR/7V/uJk=
Received: from DB6PR07CA0063.eurprd07.prod.outlook.com (2603:10a6:6:2a::25) by
 VI1PR08MB2958.eurprd08.prod.outlook.com (2603:10a6:803:3d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15; Thu, 3 Sep 2020 11:41:17 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::a0) by DB6PR07CA0063.outlook.office365.com
 (2603:10a6:6:2a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.7 via Frontend
 Transport; Thu, 3 Sep 2020 11:41:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 3 Sep 2020 11:41:17 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Thu, 03 Sep 2020 11:41:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d7664e7bafa1ff9
X-CR-MTA-TID: 64aa7808
Received: from c33918df5544.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0913A83A-0456-40E6-9E69-7176FB4F4B9E.1;
	Thu, 03 Sep 2020 11:40:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c33918df5544.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 11:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAg+q/fJvXWlY2TNPucIsPBOenE1RWAAXd4H1LiW/PYT53VgayxyQ7uVVziVcWWSa94ux6UHfL/glIdBt0cfCV4o2q0avdaqSOYHrjSVXIZQdITvPnYJWrBnOfjWjRqMA/ImDCBpWiL619a7JLHnrhkatrcYsabyM10HnddCVSL+eSnwj6Ywoi4DOpLvBryoNFDiDaHNfmKSZAs2eEojslFoxADvRHyEgrsEzOMTgBeisIm+SCW1oaM0Q/6G3yQZA5NGC8gElwERxnTl+KXhtU4u8pQgweP/eqlUvGCudBGShOh7NrpOoCRWIel3atuN6oJuuEIS2B8ZLESGu8RtUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0I62G6P2wdyfLQRHDu2OHvDpHClbZ/RBtGXM0lO+N0=;
 b=AAaeC6Hu3fr3SDCX3bCZsEgvUZNeHlnXoIuaJXcQNl8JW+XcQBazUK3qszWg1lUR+fy5lsbNHzVMGDrojjVEOKysw52w7D4g3s0Bqon8UX6LVvV9Pzl3HY81GDnA1MeqtZzMUFQrOfl+f/dV//8mYAaA5lHQAUsjKAZrwnF7uuC6Snucw3O4nThJPQZwZNpordcKgFU10lMNUyJjrrjDOvs8bYgMsh7YJ9AHQImsJKTIclfCsB/T7YbP4J4PhaTHBzRG2ZV6orXe75yRsKowyNWkikiILNTJqRa52fpiKh7DPtWrYGsvvfKECzAVOpCzT0oFerjWHnwpvmy8RhXjXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0I62G6P2wdyfLQRHDu2OHvDpHClbZ/RBtGXM0lO+N0=;
 b=Tqs9ulvjhlOsJ6cdv2dDKu/BVmRj+uq8PMPRIs12Dh9mDVq4RmoKtKdLCQkmT5mFvgjhsnlr2HGoHEYZsudKTuQM8joLmTY2TnkIt4p34FQ1aVG6+3SV1dNIXA0UBfcMiw794ENyzDR/EZymEV2rLaABhCPRGT20byFR/7V/uJk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3688.eurprd08.prod.outlook.com (2603:10a6:20b:8e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 11:40:39 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 11:40:39 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 7/9] arm-autonomy/gem5-aarch64-native: Set CPU and disable pointer authentication
Date: Thu,  3 Sep 2020 12:40:28 +0100
Message-Id: <4a35a1eea42207fd8fdae463a4037061a0e96cbb.1599133172.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
References: <bff93f4e0c123dc3cfbaf417b7c398e392b9771e.1599133172.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by LO2P265CA0463.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 11:40:35 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8fc85ebb-05bc-4c18-3f8b-08d84ffe453f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3688:|VI1PR08MB2958:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2958855C419F6491468D1967922C0@VI1PR08MB2958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NvFGQlQLQ6QCRON2cIVlMw/yRjMl0hWYSHnLV84N18bN1ftXwNHNSA9L7xQI8FuBx8CvWjatzwNAXCOG4bd+E1i7pFYulC1wU3iWFvx99lpiM4XWc+Glm1RK3+w5+I1Z8v442pZnya1BDRoTKWypE27j2xgDIa6W1P1WRvl9gBNc6qALsRRxthLUSzLq8PEunzCpTTao4NKDo+UT+NhBdn6mGINELOKTc9leo4HuMJBBo7K6JJIVIAnPIRPlC1kjEQgn8jA2pkoUz4Yf01mwzjbpD5glWLGbChfggqxe/CgBpP7xsuKebL6qTQMpi56LHYoL6BYSPy0cWcXR9G9yRA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52116002)(8936002)(44832011)(6666004)(86362001)(8676002)(478600001)(36756003)(4326008)(66556008)(66476007)(66946007)(2906002)(6486002)(5660300002)(186003)(26005)(16576012)(6916009)(956004)(316002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 YGYIbOfB5JkClBB4y2/UvlBfKk8vLg7Fg/n3X/dIt/yJEeLGScIqSoqe5J2v6PxkwM10/EfwvvdGshqHR/w4SKG/OeE2M2Of8MW4Ubs5r2/eMKIpW3cVYKEeWM4/AYGb4OL10gOAlN6iv3IDEnFgag3+mVXe5pBWsBDyQ6rouCVzY5ScSafgpBp2jYwLfLWmh/wL4DPDRwciTeZqYtgQBqrddeIjKnNm/p4smZpZk8Cmck5z5pGhq80O8R4zV2pZsEt6e6herYdGwbYdg8rG80OetgRJ0cr1VGigDF7YvOSnE/p1lYx3cSVMpVdJAqMMhfffOg2Q9gQzwnzX0FtvH/5Qsz8sbvxR0mnSOJCpGKf3WUza1UxKhiUhHwvkwPOmidebxeRL7sKT/jw7cJNbPT+k8QsiZL9zgSieAhuKdxcDFRJG3b1vEen+xy+oyjIWH0scgHSIMQTUXq0pnLJl1aVSnQRIziGg2m5SG+62D1inXUSwShcQ93gsPoOUFTac/Zr1gRLmDdoUbtegJWsy7CrSxlucrzhy8wc0FIDWRU9XGm9ZKcTrkkpJpCTvRipS1JPcf/1UBpgoBj+rxprYpfX3ZZs8cBfFBvmvLBQ4RElwE7qqTe94fx0yFVCzpOxSyuTy4dW+vuuZFg5oeuATSQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3688
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3cd1a20f-c4d3-4b4c-8954-08d84ffe2c2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9m5EuVIK+m7Y+P6cVbPEWSGYAcAAk504HCGfWGNDy9t3rkuo/PvSFDhPpwmg9QvGqK99aOQuMjDiEMfSNEwCeZeb3vaz8T3fIPUxs97MP/6QrgfF2K8xp1GyYfv9F1MOPA/qMIdHBSmeQMFcW6bDZg6Xx4Q0THtt0aLcE+d8WHmovlpGg6stEv/gf9IOKZ27dvdzFvqkMOKHTOHsz1hRq+8lVf/BuY7IKZ4/wiP0ttdGeyzJ8zl8uGf2bLTnXAbwZO3MXKEobU5v0BlkV7pmG4reP6Dqk8U+l4tb4iP+l1OGZOIrYX3bK5ymAyTapoWrqmywT936nifsEoVCy69lRs5DGJS4HCV3W5Q/FGgYYX2VsN+wI3CZAb368fm8o3nycYRoU6Gm0Z8se2yKSs8M2A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(2616005)(2906002)(5660300002)(44832011)(6916009)(36756003)(8676002)(86362001)(6486002)(8936002)(6666004)(26005)(4326008)(956004)(316002)(16576012)(186003)(70586007)(81166007)(336012)(82310400003)(82740400003)(356005)(478600001)(70206006)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 11:41:17.4915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc85ebb-05bc-4c18-3f8b-08d84ffe453f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2958
Content-Type: text/plain

When booting gem5-arm64 with Xen and Linux we need to set the cpu as Cortex A53
and remove support for pointer authentification.

Change-Id: Ib8ea61784f668bf88c1492e5e56737a0aa40d762
Issue-Id: SCM-899
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-devtools/gem5/gem5-aarch64-native_20.bbappend          | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend

diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
new file mode 100644
index 0000000..71b308a
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
@@ -0,0 +1,7 @@
+# When booting gem5-arm64 with Xen we need to set the cpu as Cortex A53 and
+# remove support for pointer authentification
+GEM5_RUN_EXTRA_append = " \
+${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'arm-autonomy-host', \
+'--param=system.cpu_cluster[0].cpus[0].isa[0].midr=0x410fd030 \
+--param=system.cpu_cluster[0].cpus[0].isa[0].id_aa64isar1_el1=0x0', \
+'', d)}"
-- 
2.7.4

