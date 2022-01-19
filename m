Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5525DC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 18:14:01 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.47])
 by mx.groups.io with SMTP id smtpd.web12.231.1642616030657030496
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 10:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=iM0S8yNH;
 spf=pass (domain: arm.com, ip: 40.107.14.47,
 mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qubEa/dd/E/dwkDJBi4N8Y1XyAZ0M2srgQ26mDzN5d4=;
 b=iM0S8yNHsigNrjlMcYSRPfn13i/T+fQK3LfyIXfAwZqgqFcpmJmggg4DtPGTnutnD5hZO1HQzKx+SBsTcFg8i7mTPqRLkkJ8W3i7QG8oIBbBYi62OajlMm1yxUeQFyEtT046dwO2xhuQHHRFRLa91bzsv1ohtwHUciUpa4qwF/Q=
Received: from AM6P195CA0088.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::29)
 by AM4PR08MB2850.eurprd08.prod.outlook.com (2603:10a6:205:3::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 18:13:47 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::8e) by AM6P195CA0088.outlook.office365.com
 (2603:10a6:209:86::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Wed, 19 Jan 2022 18:13:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 18:13:46 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Wed, 19 Jan 2022 18:13:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64900ffb73d43abd
X-CR-MTA-TID: 64aa7808
Received: from c6c653026334.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7ACF6DCB-A24B-476E-8588-3299040EFB90.1;
	Wed, 19 Jan 2022 18:13:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 c6c653026334.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Jan 2022 18:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS9wNs4VIuHN+A9L2GDjksDkdtO2BW9Fh4qLwwUVqUl5/7dRBKOxYFpJr3oNew8LHw5fyVX/2oCoMriAKtyWGafb9UOwAhhRjjWvRJ1gQvnb3qGwbU//4oHe2dNVJ9gplSPUtzL0oOAygNDahHjWE0lVOhDMDie35/RLwkl3SganKrf28zcJarfz61axJmy5vsWBkzw8Gep/VvVU7LNTcLqOkvD1Gn8JgKLdSPytZ8f4LaI/OOXQWz9BedY4DvS2JTLh7VwhIBidry8YVHyH5iq40tFF28I4jV5bd0sJFWBSHGWKUFmSe8uJoJft/upMyc9FNxuNRvuj2KI1ZMOzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qubEa/dd/E/dwkDJBi4N8Y1XyAZ0M2srgQ26mDzN5d4=;
 b=ahTS6mhyYDoFEvpnKIUGB07MczLZAeMNlvDsyB97U1J8gHFnfIcqVtKjAfsWC07uDz0llQ5cLNuvyl0U7PDcxu3uBT3JpW8Wylrcy+1CP60MFvYVwBrPOiTzlT5YywHaNihx/cW4L39zK8mOwCc3lJgDj+0JMDUjiht/9QdaAfzG4bQ4phVUXMSWf63yFMu98KY8HR/tIXNPJ7R4TCGaPXNJijDi1SHW6hvDp8stL+t7F8MzX4M6avTuIUrwSq4kfOKCvfaGpUtk9bJ75Ba41olKMqA2Z0GL1wE0XooV9xe1Q9+KWpSE/rusGCroG3/m6h+oVdzL1fTCTE6mvKkAlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qubEa/dd/E/dwkDJBi4N8Y1XyAZ0M2srgQ26mDzN5d4=;
 b=iM0S8yNHsigNrjlMcYSRPfn13i/T+fQK3LfyIXfAwZqgqFcpmJmggg4DtPGTnutnD5hZO1HQzKx+SBsTcFg8i7mTPqRLkkJ8W3i7QG8oIBbBYi62OajlMm1yxUeQFyEtT046dwO2xhuQHHRFRLa91bzsv1ohtwHUciUpa4qwF/Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by VE1PR08MB5806.eurprd08.prod.outlook.com (2603:10a6:800:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 18:13:26 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::4416:49a8:fb0c:6bf3%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 18:13:26 +0000
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH] arm-bsp/hafnium: extend stage-1 mapping limit on TC
Date: Wed, 19 Jan 2022 18:12:35 +0000
Message-ID: <20220119181235.2780583-1-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::23) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: fbfae92e-96bf-4c70-138d-08d9db776f61
X-MS-TrafficTypeDiagnostic: 
	VE1PR08MB5806:EE_|VE1EUR03FT008:EE_|AM4PR08MB2850:EE_
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB28508823CED58A52B27B21F5FB599@AM4PR08MB2850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7lL9G+pUhwLs60hz/rmPMK5mJUkb9NMU5ZY6Uh0JmLGt2eFMt3QdwE4y3pQUnsoIUUQ2iC6SUzwe4vzW+D8I+VWWEynMA3PITYU0RFGFn5IbCkPNiytKbwqrSiXZjQFhGSdlmMmwim/na5niXf69TiLX1uTc9fzsFLg9x96aoGyI1fWwQSUfz9sUluOLC0NuK+cBa4trI+zjIjsLg4Vp4NJks3ZPLDhTd+BIZWmXyV9cVLcD1499NAXl2NtNKND9k8JcKmCE/nskQHThCsNTNljjR7cXAAhNnYfEhpm8fJoA02RLhXNYPBUcthiBv5QullMzg61ZqIhXZhU4VTvCzeexAx+RCYcYF9fvX2CBdVjKc79gNJ3Mm1OoXWdBlkispA+Vid0ZIUCOnPyQrVRQPahgOeKmiN4/DiiM9/7dQ6K/nEGRXi0Gsi8f2Cx2Ch2PrOqiZLAdEeEv0vJhVGw+JslL2K+P0lZzSTXGetlThiRIGCt0ovsjPEk6H456iV9AVtd65WBIg7FhTP+9W5kOJ5dq1pbzs5Q2RaypGeTUDyEROvTMbXaF0J4yS2l7tas2UOhwbYR/+qcAqLXeb5TyWbGgjEmUGMrYD0c2/qud8vVCJqOx/DmoUXjethH4jgcDkNY8R8m4Q+q2eVrQw6NS/21gnpKamF4T2JybKPbYCg+2lIRhko8I1sXyJ0gE5cBCHy3EnVBPkH1z8UF1CTmhng==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(1076003)(38350700002)(508600001)(83380400001)(4326008)(38100700002)(6512007)(2616005)(5660300002)(8936002)(44832011)(66556008)(6666004)(36756003)(316002)(186003)(8676002)(6916009)(66476007)(86362001)(52116002)(6486002)(6506007)(66946007)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5806
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e6cb085a-b10d-4ec2-5e38-08d9db77626e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q+wQ61w49IR/chwk/sFzuFQUo79OlYoEQnTWRLsihBMtyO37YyZuJlhthiENxvLJAUgPjovPiPRbPDeN4woUxeyn1PaT1q0/cojoEJW4jb4FwVWr3MLozYK7lR4MH6UyWmVWTY2DqQTdzOy6OekQUygTrd2QP7qh85+yR2XWsbqrGXI7I6tRyxuB5OC6Y7u1dw3D32M3N9SerPgfbr/RNOvtwTZk5rOLbj29VXWYMasLXX5EmQbq8xHTpmZEeOBvm3+NXyLC6JSKIQNUPv2q0yEwwxqHJ31CbcNmt1owlX8ev2G42av+zupoW5e4IT7LstyMLJHmUhBJFA5sHjECEae1E/Kq57mVUDEDgPYeGqV3xtc4Bt15MH/eKhl6RrbsYwibWXQSZcwpOgovTuo1+Xzt0Ydx8PEijfNWOjC4EKQqYZsr14GCPa2mCMWUVmx/c8WHVFTp0wnvTkM8CINva4oWECG52E+kyzeJJE/9sUCFBXYWtEC/Rg3BdsydtzvZvBgOMhWD1FgK03FJ1Qq4I+YIHaGFiUmJCPmgSK/0hDZtBk08KQxDb/RIvr7BYqs/WLJpiYpnTFW0qsv5Pn1NalU3MVruEKo0iXPQ9qNsVLQO190j51Tarh0hoGGSPybkKRNmLEnTCcH8IyiTEMqHqyrdWLnWT21nCpFiM60+2sTGatkXr7in99MhbQNwUNnL1fuRqbtrwaHB4sflG47aZchTG+Wg8gVJuh7NvoeaGzqJrhUIBx4DDXKpmi6xtIrHKF+bK50Od6HADU6GzQd3MQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700002)(46966006)(36840700001)(2906002)(26005)(4326008)(6512007)(8676002)(70586007)(316002)(6666004)(2616005)(6486002)(6506007)(86362001)(336012)(5660300002)(47076005)(36756003)(81166007)(1076003)(186003)(356005)(40460700001)(83380400001)(82310400004)(36860700001)(6916009)(70206006)(508600001)(8936002)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 18:13:46.4453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fbfae92e-96bf-4c70-138d-08d9db776f61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2850
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 18:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2867

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Ia6fb2cfd7812a63a003dc3ffbc84fb8d410d02c3
---
 ...-if-start-address-exceeds-page-table.patch |  36 ++++
 .../0002-Extend-Stage-1-mapping-limit.patch   | 197 ++++++++++++++++++
 .../recipes-bsp/hafnium/hafnium-tc.inc        |   8 +-
 3 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-fix-fail=
-mapping-if-start-address-exceeds-page-table.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Extend-S=
tage-1-mapping-limit.patch

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-fix-fail-mappin=
g-if-start-address-exceeds-page-table.patch b/meta-arm-bsp/recipes-bsp/hafn=
ium/files/tc/0001-fix-fail-mapping-if-start-address-exceeds-page-table.patc=
h
new file mode 100644
index 0000000..79aee24
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0001-fix-fail-mapping-if-st=
art-address-exceeds-page-table.patch
@@ -0,0 +1,36 @@
+From dace8802ae6332eb4ca29faf288b96c83fadb2ae Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 28 Sep 2021 11:22:27 +0100
+Subject: [PATCH 1/2] fix: fail mapping if start address exceeds page table
+ mapping limit
+
+Currently the end address is capped to stay within bounds of page
+table range. If in case the start address is beyond bounds of
+page table then no mapping is made but the mm_map_root incorrectly
+returns success.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I858ac653aafff62e9a2cf5771a32dc38690cd899
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ src/mm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/mm.c b/src/mm.c
+index 6f15748..c57e24e 100644
+--- a/src/mm.c
++++ b/src/mm.c
+@@ -472,6 +472,10 @@ static bool mm_ptable_identity_map(struct mm_ptable *=
t, paddr_t pa_begin,
+ 	 */
+ 	CHECK(root_level >=3D 2);
+=20
++	if (begin >=3D ptable_end) {
++		return false;
++	}
++
+ 	/* Cap end to stay within the bounds of the page table. */
+ 	if (end > ptable_end) {
+ 		end =3D ptable_end;
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Extend-Stage-1-=
mapping-limit.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Extend=
-Stage-1-mapping-limit.patch
new file mode 100644
index 0000000..8493310
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc/0002-Extend-Stage-1-mapping=
-limit.patch
@@ -0,0 +1,197 @@
+From 45187e2f9c73ea96e69d1f46f0c24ff31d7f9298 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 28 Sep 2021 11:25:25 +0100
+Subject: [PATCH 2/2] Extend Stage 1 mapping limit
+
+As Stage 1 mappings are limited to 512GB, registering FF-A RxTx buffers
+fails when the physical address of these buffers exceeds 512GB. This
+fix removes the limitation and allows Stage 1 mapping up to the
+supported PA range.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I4cb8d68fc18e0edf4a7ee06ae636849d552d72a9
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ inc/hf/arch/mm.h      |  7 ++++++-
+ src/arch/aarch64/mm.c | 38 ++++++++++++++++++++++++++------------
+ src/arch/fake/mm.c    |  9 +++++++--
+ src/mm.c              |  8 +++++++-
+ 4 files changed, 46 insertions(+), 16 deletions(-)
+
+diff --git a/inc/hf/arch/mm.h b/inc/hf/arch/mm.h
+index ef64dd3..d277369 100644
+--- a/inc/hf/arch/mm.h
++++ b/inc/hf/arch/mm.h
+@@ -162,7 +162,12 @@ uint32_t arch_mm_stage1_attrs_to_mode(uint64_t attrs)=
;
+ /**
+  * Initializes the arch specific memory management.
+  */
+-bool arch_mm_init(paddr_t table);
++bool arch_mm_init(void);
++
++/**
++ * Set ptable base address.
++ */
++void arch_mm_set_ptable(paddr_t table);
+=20
+ /**
+  * Return the arch specific mm mode for send/recv pages of given VM ID.
+diff --git a/src/arch/aarch64/mm.c b/src/arch/aarch64/mm.c
+index 7256c28..0ee0bb6 100644
+--- a/src/arch/aarch64/mm.c
++++ b/src/arch/aarch64/mm.c
+@@ -141,6 +141,7 @@ struct arch_mm_config {
+ 	uintreg_t hcr_el2;
+ } arch_mm_config;
+=20
++static uint8_t mm_s1_max_level;
+ static uint8_t mm_s2_max_level;
+ static uint8_t mm_s2_root_table_count;
+=20
+@@ -676,12 +677,7 @@ uint32_t arch_mm_stage2_attrs_to_mode(uint64_t attrs)
+=20
+ uint8_t arch_mm_stage1_max_level(void)
+ {
+-	/*
+-	 * For stage 1 we hard-code this to 2 for now so that we can
+-	 * save one page table level at the expense of limiting the
+-	 * physical memory to 512GB.
+-	 */
+-	return 2;
++	return mm_s1_max_level;
+ }
+=20
+ uint8_t arch_mm_stage2_max_level(void)
+@@ -735,10 +731,16 @@ uint64_t arch_mm_combine_table_entry_attrs(uint64_t =
table_attrs,
+ 	return block_attrs;
+ }
+=20
++void
++arch_mm_set_ptable(paddr_t table)
++{
++	arch_mm_config.ttbr0_el2 =3D pa_addr(table);
++}
++
+ /**
+  * This is called early in initialization without MMU or caches enabled.
+  */
+-bool arch_mm_init(paddr_t table)
++bool arch_mm_init(void)
+ {
+ 	static const int pa_bits_table[16] =3D {32, 36, 40, 42, 44, 48};
+ 	uint64_t features =3D read_msr(id_aa64mmfr0_el1);
+@@ -784,6 +786,13 @@ bool arch_mm_init(paddr_t table)
+ 		mm_s2_max_level =3D 1;
+ 	}
+=20
++	if (pa_bits >=3D 40) {
++		mm_s1_max_level =3D 3;
++	} else {
++		/* Setting to 2 covers physical memory upto 512GB */
++		mm_s1_max_level =3D 2;
++	}
++
+ 	/*
+ 	 * Since the shallowest possible tree is used, the maximum number of
+ 	 * concatenated tables must be used. This means if no more than 4 bits
+@@ -800,6 +809,10 @@ bool arch_mm_init(paddr_t table)
+ 		"Stage 2 has %d page table levels with %d pages at the root.\n",
+ 		mm_s2_max_level + 1, mm_s2_root_table_count);
+=20
++	dlog_info("Stage 1 has %d page table levels with %d pages at the "
++		  "root.\n", mm_s1_max_level + 1,
++		  arch_mm_stage1_root_table_count());
++
+ 	/*
+ 	 * If the PE implements S-EL2 then VTCR_EL2.NSA/NSW bits are significant
+ 	 * in secure state. In non-secure state, NSA/NSW behave as if set to
+@@ -818,8 +831,6 @@ bool arch_mm_init(paddr_t table)
+ 	}
+=20
+ 	arch_mm_config =3D (struct arch_mm_config){
+-		.ttbr0_el2 =3D pa_addr(table),
+-
+ 		.vtcr_el2 =3D
+ 			(1U << 31) |		   /* RES1. */
+ 			(nsa_nsw << 29) |	   /* NSA/NSW. */
+@@ -879,14 +890,16 @@ bool arch_mm_init(paddr_t table)
+ 			 << 24) | /* IRGN1, normal mem, WB RA WA Cacheable. */
+ 			(1UL << 23) | /* EPD1 - Disable TTBR1_EL2 translation */
+ 			(0UL << 22) | /* TTBR0_EL2.ASID defines ASID */
+-			(25UL << 16) | /* T1SZ, input address is 2^39 bytes. */
++			((64 - pa_bits) << 16) | /* T1SZ, input address is *
++						    2^pa_bits bytes. */
+ 			(0UL << 14) |  /* TG0, granule size, 4KB. */
+ 			(3UL << 12) |  /* SH0, inner shareable. */
+ 			(1UL
+ 			 << 10) | /* ORGN0, normal mem, WB RA WA Cacheable. */
+ 			(1UL
+ 			 << 8) | /* IRGN0, normal mem, WB RA WA Cacheable. */
+-			(25UL << 0) | /* T0SZ, input address is 2^39 bytes. */
++			((64 - pa_bits) << 0) | /* T0SZ, input address is *
++						   2^pa_bits bytes. */
+ 			0;
+ 	} else {
+ 		arch_mm_config.tcr_el2 =3D
+@@ -896,7 +909,8 @@ bool arch_mm_init(paddr_t table)
+ 			(3 << 12) |		   /* SH0, inner shareable. */
+ 			(1 << 10) | /* ORGN0, normal mem, WB RA WA Cacheable. */
+ 			(1 << 8) |  /* IRGN0, normal mem, WB RA WA Cacheable. */
+-			(25 << 0) | /* T0SZ, input address is 2^39 bytes. */
++			((64 - pa_bits) << 0) | /* T0SZ, input address is *
++						   2^pa_bits bytes. */
+ 			0;
+ 	}
+ 	return true;
+diff --git a/src/arch/fake/mm.c b/src/arch/fake/mm.c
+index e06a8b7..8ac63fa 100644
+--- a/src/arch/fake/mm.c
++++ b/src/arch/fake/mm.c
+@@ -161,13 +161,18 @@ uint32_t arch_mm_stage1_attrs_to_mode(uint64_t attrs=
)
+ 	return attrs >> PTE_ATTR_MODE_SHIFT;
+ }
+=20
+-bool arch_mm_init(paddr_t table)
++bool arch_mm_init(void)
+ {
+ 	/* No initialization required. */
+-	(void)table;
+ 	return true;
+ }
+=20
++void arch_mm_set_ptable(paddr_t table)
++{
++	/* No initialization required. */
++	(void)table;
++}
++
+ uint32_t arch_mm_extra_attributes_from_vm(ffa_vm_id_t id)
+ {
+ 	(void)id;
+diff --git a/src/mm.c b/src/mm.c
+index c57e24e..aa0c512 100644
+--- a/src/mm.c
++++ b/src/mm.c
+@@ -1114,6 +1114,10 @@ bool mm_init(struct mpool *ppool)
+ 	dlog_info("data: %#x - %#x\n", pa_addr(layout_data_begin()),
+ 		  pa_addr(layout_data_end()));
+=20
++	if (!arch_mm_init()) {
++		return false;
++	}
++
+ 	/* ASID 0 is reserved for use by the hypervisor. */
+ 	if (!mm_ptable_init(&ptable, 0, MM_FLAG_STAGE1, ppool)) {
+ 		dlog_error("Unable to allocate memory for page table.\n");
+@@ -1133,5 +1137,7 @@ bool mm_init(struct mpool *ppool)
+ 	mm_identity_map(stage1_locked, layout_data_begin(), layout_data_end(),
+ 			MM_MODE_R | MM_MODE_W, ppool);
+=20
+-	return arch_mm_init(ptable.root);
++	arch_mm_set_ptable(ptable.root);
++
++	return true;
+ }
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-bsp=
/recipes-bsp/hafnium/hafnium-tc.inc
index 8eb6b4c..27f7777 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
@@ -1,4 +1,10 @@
-# TC0 specific configuration
+# TC specific configuration
=20
 COMPATIBLE_MACHINE =3D "(tc?)"
 HAFNIUM_PLATFORM =3D "secure_tc"
+
+FILESEXTRAPATHS:prepend:tc :=3D "${THISDIR}/files/tc:"
+SRC_URI:append =3D " \
+		file://0001-fix-fail-mapping-if-start-address-exceeds-page-table.patch \
+		file://0002-Extend-Stage-1-mapping-limit.patch \
+		 "
--=20
2.30.2


