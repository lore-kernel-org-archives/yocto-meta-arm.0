Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.81])
 by mx.groups.io with SMTP id smtpd.web10.3861.1600764458154140377
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 01:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pSWwA1i+;
 spf=pass (domain: arm.com, ip: 40.107.6.81, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STnSZ5KbALUL5dOCMfgo+vuaG5tvM/ZkV+pTF5s9zyo=;
 b=pSWwA1i+8FQPn6XeXVWbX3K04jceKp3sus/LaQy1QY/ILHaTka568GUHhrxrVLEYnhHmtTcEYt1XB2QNukFXcNLXUrKgaJSdHQZefjgsNP8K2J1Qae8UEeqpuGwP4VDel6IdHTJb+3gS2h4VyXOoPoHyhPKx6V3JJzCEiJvHBaE=
Received: from AM5PR0601CA0053.eurprd06.prod.outlook.com (2603:10a6:206::18)
 by VI1PR08MB3120.eurprd08.prod.outlook.com (2603:10a6:803:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 08:47:34 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::31) by AM5PR0601CA0053.outlook.office365.com
 (2603:10a6:206::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Tue, 22 Sep 2020 08:47:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 08:47:34 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Tue, 22 Sep 2020 08:47:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb3769f06812928f
X-CR-MTA-TID: 64aa7808
Received: from 587af797ba5f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 755182E4-FEFA-43BC-B765-5DECA080242C.1;
	Tue, 22 Sep 2020 08:47:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 587af797ba5f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Sep 2020 08:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0QwGRdmMiWV2gIelI+ROEee2Ig+cQ88YxKE8RAp4xDa6CbrJrRsVGRKvMqx7TgwaV9GguMnIOvjruyKbasxovHW2o5NOd7vGrduu4UgOJGUTNzTsZ1JKsJo2n0T826ZY5eO1St8jIHZiivfoRVaWXv0eL8QxVaIObQH1fIHOWnTknoaNSjIdfCBLJ+wLRGCYS5/Z15MlhxD6ypfXQHYi/s2wyY7luEDbrzR2ADgjzoYwdZsqiToteNzvtIeSHvltKC4gjsUXZ1tImB839Pbhil1g83LRj0I/DkIUTum/wqUc16bC+mbcO3oL4sPxygsIgLn6/9UK73NBHsUK98t1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STnSZ5KbALUL5dOCMfgo+vuaG5tvM/ZkV+pTF5s9zyo=;
 b=JqRNpUBnZyYFklkU38MW4JIgObFT9Vu3DclA1L0JCeoILma1TmGMM2EM3briBNOqF/NFxcm5dUOZW44RD59LwGlUR4/YhybciwnJ99MFoK4TKTubTbWUeGTuV7lL34h9hXPysBOLdI2uiKJyMRN6HHeJ6LRXBhe4Jc0uTANNsXE7hGSiepjS2GI40ShrGK5/EMS9BVW2Pbq6gdfg/Fqg+CmVno4Q+G+PldBuPgzSf6l/lpexSpCmgk1Tz1Fsirsg6xrCwKUHLLiTS6kc3RUZKSrKX1KGWDYYXChoIjmwKEo540oL0fIwpyumHft1MVe6ukozlfi9ljondy8hpDha4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STnSZ5KbALUL5dOCMfgo+vuaG5tvM/ZkV+pTF5s9zyo=;
 b=pSWwA1i+8FQPn6XeXVWbX3K04jceKp3sus/LaQy1QY/ILHaTka568GUHhrxrVLEYnhHmtTcEYt1XB2QNukFXcNLXUrKgaJSdHQZefjgsNP8K2J1Qae8UEeqpuGwP4VDel6IdHTJb+3gS2h4VyXOoPoHyhPKx6V3JJzCEiJvHBaE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11)
 by DBAPR08MB5558.eurprd08.prod.outlook.com (2603:10a6:10:1b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.22; Tue, 22 Sep
 2020 08:47:23 +0000
Received: from DB7PR08MB3594.eurprd08.prod.outlook.com
 ([fe80::3180:c8f0:c00a:5f3e]) by DB7PR08MB3594.eurprd08.prod.outlook.com
 ([fe80::3180:c8f0:c00a:5f3e%3]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 08:47:23 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/documentation: Update arm-autonomy-quickstart.md with dependencies
Date: Tue, 22 Sep 2020 08:46:39 +0000
Message-Id: <20200922084639.15621-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P123CA0041.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::29)
 To DB7PR08MB3594.eurprd08.prod.outlook.com (2603:10a6:10:4e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.50) by LO2P123CA0041.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Tue, 22 Sep 2020 08:47:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c3cd81b-9851-4e2c-70ea-08d85ed42670
X-MS-TrafficTypeDiagnostic: DBAPR08MB5558:|VI1PR08MB3120:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB31207211BA7D1A467BFFDC168D3B0@VI1PR08MB3120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vwAsdQ88Hl+JkojVtwZD550EKcDeAkhrITC88F697lVEweiA5nDKyNaroy2L/w3F4qnFSSrkJmDz58PfeGQnlTckEQ2Ta0tn1WYe+Fj/BQDsYuduqbe6VONlZa74rzeFpVj4MQw2+PWfwj3T83x4Oe4xtKLS9lidilm9JTnDrMWArlkkv72+kw4Itb4MygnJ1Rc8eoYa5fQmFlzyv5jSrdUCA5x2mV+4H5hSl0crGXvmg2QZG/wMPIkZ0C+rjvPQU8gkMwMaNGlwyPEKc8GD9sE2i1wCw8Pfq6ATBbx+Hea8t4tK0NxY9H3v6KADVAqGholOQ+yO0JR6N49xNK/+3FAlxgaq1LML5y5WvV3Dm7raEO3VUPoOtvDXhOZFJ6Rl6t5y2KX43udngqsSf/wpkw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3594.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(316002)(8676002)(26005)(1076003)(83380400001)(6486002)(52116002)(4326008)(6916009)(66946007)(186003)(16526019)(478600001)(8936002)(6666004)(7696005)(36756003)(2616005)(2906002)(5660300002)(956004)(66556008)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 BzEweV3RKOoFI9G+DBW4lBl9e2A/JbHA5BOt4U2RsQtSGD8b0ATfJ3brr5fVmWBzhVHKeuOYNQktYdF5dvFov9+f1++D2n2jImfpm9fuFZcDOD0uGqFt38UErjUeo4/TihY1LxI68+YNULtPa/3t4NKLgAz+aMQHQriu8Dx13Et2F30FZaiL6+v+HzPaDvfB/96RkCFveqQhb6ln1IrLO0t4wiM3kjZR8KP6hxy/Zvfm0P9IPkv6VkZZgnmozhPKzL3g6sSZ9uPO9NIoagtYUYeNAadZ83KVpgkw2ARiuzEcjS6tofY7uvkRIPg0dye/2x5e7AcmgLF6KjtE9DOYdMawRb7ZsJzk0ylxfmCXZ0S9REx77aBuELw19yrP2Wcb3MgS99QU4hw3EnjIm5mnvC9y30K3FR1rjRjSDGxTgcch3FDerwFbzFnU+nJCQsxvr1WqCd8RyX80x+nVrzstRqWIZdFyCsTiEAaKeEu1yytW2tfxwoVRz/tlGcWZXAclWMemFE7UUhpnr9inA+zYusCuJkRdUVB84rx08CzQ1c9Q7pJa5L2Fl5LhLq0Hv4u+rLQBvVC210Ml5V4nIuAmwoUcY/nlfPUbNkNvCs2uagP+MdP9D8HbDqrcY7ZEIFt6KskwbNw8O/hrVx9Nh22QWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5558
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5be9dd4f-399e-46bd-f40a-08d85ed41fde
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U1Cb2JwIjMb/NJAnYODZ9DZ4Bf6l6sHcENbJXqs6VQtHh1UW6NRlDseOY2714V1T7j6PfxGGl+D7ZBs5/egFfT0Dag7TOhc69BoL3cNCULpg90sq7tQUuqI7Vsjec1rYBeuqMov/BS1CBt3uRmIHh8xwnOF1TWLVm0sJVNhoBIeEUNWj/E45gd1N5y3jfz21GH6j6hZQs9+KDRXgh4i2/qloZ0O1TrEYJx1dXh4M36CqUFtoGronv2Wt3Xw041kFW7c9gU2BcXSZ46XkTX6vQ464GqnypiO6BK4ZAQQ9kN+Nn0ka9aMtcwlnTH57lo65E1gW0vXJISRGk38OqeXw+z6ZWa4SmV8GkPeGLlyswiWc2dHWsmb2yfq1i+JBi9Z9NTnopSrslri463berNeM/++1iyANzWFL/IQmCunrHW6wgqSg5m95WWwWTFTfwd6lpgiGR44rMZHNMk6l5Ue7uhaCojrClmLlvoAzHPIAt6s=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(46966005)(86362001)(2906002)(5660300002)(4326008)(70586007)(8676002)(47076004)(6916009)(478600001)(356005)(7696005)(36756003)(2616005)(6666004)(1076003)(956004)(70206006)(316002)(36906005)(336012)(8936002)(81166007)(82310400003)(6486002)(186003)(26005)(83380400001)(16526019)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 08:47:34.3202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3cd81b-9851-4e2c-70ea-08d85ed42670
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3120
Content-Type: text/plain

Added dependencies on meta-kernel and meta-arm/meta-arm-toolchain layers
to quick start guide instructions.

Change-Id: I7d5a3c631ccdcc7a39b8003a958d5f68ecb606c7
Issue-Id: SCM-1298
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
---
 .../documentation/arm-autonomy-quickstart.md        | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index 2a457c1..eb02b3a 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -26,6 +26,7 @@ First you must download the Yocto layers needed:
  - [poky](https://git.yoctoproject.org/poky)
  - [meta-virtualization](https://git.yoctoproject.org/meta-virtualization)
  - [meta-arm](https://git.yoctoproject.org/meta-arm)
+ - [meta-kernel](https://gitlab.com/openembedded/community/meta-kernel.git)
  - all other layers you might want to use
 
 For each of the downloaded layer make sure you checkout the release of Yocto
@@ -56,8 +57,9 @@ Here are the main steps to create an arm-autonomy project:
   bitbake-layers add-layer $LAYERDIR_BASE/meta-poky $LAYERDIR_BASE/meta-yocto-bsp \
    $LAYERDIR_BASE/meta-openembedded/meta-oe $LAYERDIR_BASE/meta-openembedded/meta-python \
    $LAYERDIR_BASE/meta-openembedded/meta-filesystems $LAYERDIR_BASE/meta-openembedded/meta-networking \
-   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
-   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bsp
+   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-kernel \
+   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-toolchain \
+   $LAYERDIR_BASE/meta-arm/meta-arm-bsp $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
   ```
 
   Example of a `conf/bblayers.conf`:
@@ -71,12 +73,17 @@ Here are the main steps to create an arm-autonomy project:
     /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
     /home/user/arm-autonomy/meta-openembedded/meta-networking \
     /home/user/arm-autonomy/meta-virtualization \
-    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
+    /home/user/arm-autonomy/meta-kernel \
     /home/user/arm-autonomy/meta-arm/meta-arm \
+    /home/user/arm-autonomy/meta-arm/meta-arm-toolchain \
     /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
+    /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
     "
   ```
 
+  Be aware that changing the order may break some dependencies if editing the
+  config file manually.
+
 Those steps will have to be done for each project you will have to create.
 
 Host project
-- 
2.17.1

