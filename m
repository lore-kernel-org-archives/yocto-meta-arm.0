Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.9122.1627379029799529276
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 02:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EWX2onJt;
 spf=pass (domain: arm.com, ip: 40.107.22.84, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yldA8vQTtv8rqaegzpg7cWJLAC1tJrlwrkhDKMlU3cA=;
 b=EWX2onJt5Ryy66Y1uJICnSHteEWJ1bumvXxlbJXQKksEPr0O1j2DFHIkQlVEDA46PA4QTC+7atyUyX/I5QhCKfDaGOSX18YnigWUAyBpGWWGmILb12Q++9x8jokwVGZYfFaColpHDVnIMLzNVcXDCczRhe0p86fx0tBAG2VDZbY=
Received: from AM6P195CA0047.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::24)
 by AM8PR08MB6626.eurprd08.prod.outlook.com (2603:10a6:20b:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Tue, 27 Jul
 2021 09:43:46 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::6c) by AM6P195CA0047.outlook.office365.com
 (2603:10a6:209:87::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Tue, 27 Jul 2021 09:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Tue, 27 Jul 2021 09:43:45 +0000
Received: ("Tessian outbound 1e4fcc40c873:v100"); Tue, 27 Jul 2021 09:43:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea2524f757397642
X-CR-MTA-TID: 64aa7808
Received: from 12f746b1f5cc.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2564F9FC-754C-4341-AC7A-D75572E4A0D1.1;
	Tue, 27 Jul 2021 09:43:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12f746b1f5cc.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Jul 2021 09:43:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmais6qLX66qLH9X3QGFWTcWVYFwXXvq1d7UrdRyG4pBvhabFDhYMCDCz28Rs/4SlfGBE7Gn2nNvnRkU0FpCaqXGSiZPUovv8oijyMytCfWimaUjEmFNzWrVCBKkNV7bdWgEaRMfuBQdNhD/u4hM/TM/jzIorU824NryW2MhI9HJa5uSWHQ4bu/cHSmUXYSQFXY4zFuFwPZDa4RMV26zP1L16XWDBBqGlmX1ktWOWWbikQLso/IWIhYPf86jdJpEKh/DD3RNnEbYXTsC6NtQjwJ2j+3XYygZG1y/v0XuLzqpc84WQMlzaIjCB54h5EqmzKEFaCg6KlQSs/bnTT1Kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yldA8vQTtv8rqaegzpg7cWJLAC1tJrlwrkhDKMlU3cA=;
 b=dBgURrSwotYnfq9TeLGdSS+NrdRuMiATbAnlw+pOu68gtUATbUhOkZG4R63s7DJEZ1JMauzCErk0wBZY0vP2eZuJHkq1TXm0GojSNDfQtkilpdQTRLsamn9x8+L8iMIsiVOTO9fzx1P8deZVvsuu1vXKn3FM4evh+IfVYoa914KB0GAzZU7YzlE9pF7KNKdbElSAu3ekZMXCue1KZfrRBvs9nfmfxh6C64qg0r+7+udbhvBUWlbTRGKPpzxzcE4Ab4GYgdTEyTFAAuuafFRZyup/iVn8jqXqgkpvhRbkZ5JYCs7RxzieeW8EKi9Dozl6UF38y6sW/zfhsm2+aTK1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yldA8vQTtv8rqaegzpg7cWJLAC1tJrlwrkhDKMlU3cA=;
 b=EWX2onJt5Ryy66Y1uJICnSHteEWJ1bumvXxlbJXQKksEPr0O1j2DFHIkQlVEDA46PA4QTC+7atyUyX/I5QhCKfDaGOSX18YnigWUAyBpGWWGmILb12Q++9x8jokwVGZYfFaColpHDVnIMLzNVcXDCczRhe0p86fx0tBAG2VDZbY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PR3PR08MB5833.eurprd08.prod.outlook.com (2603:10a6:102:81::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.31; Tue, 27 Jul
 2021 09:43:24 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 09:43:24 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 2/2] arm-bsp/tc0: add managed exit patch for optee
Date: Tue, 27 Jul 2021 10:43:06 +0100
Message-ID: <20210727094306.3297231-2-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210727094306.3297231-1-arunachalam.ganapathy@arm.com>
References: <20210727094306.3297231-1-arunachalam.ganapathy@arm.com>
X-ClientProxiedBy: LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::12) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.51) by LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:192::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Tue, 27 Jul 2021 09:43:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39ea42dd-a2fe-40d2-dba7-08d950e30754
X-MS-TrafficTypeDiagnostic: PR3PR08MB5833:|AM8PR08MB6626:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB6626219AB9A077471EFE64F6FBE99@AM8PR08MB6626.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:497;OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lukUuRd7KnaRoCW6swOtuCchtm1R5vkozUDQAvfrxIgvNz06iCXE0zJVMR6xEJW7aYWmlSWP5hNy03zRa6a6eLA1CD86RqwkAuEggRNvMLMrOhesT5jfr9rTTy9u+3GbIVK+en5phsd1qbFrRdXokP7UR0H0CAmPul90FE2wzBxlgiiVlBQahLTfA2JMhPJaf2I5pFf4hR1BrFb0uxF43eiL+XNR9GAVFYAGVecLSNY3OlPnQnslSOwmVWUl/AGrMNfei9zmu8HNkQEQ8FoXOTpynP4pBy60Re7d4vOH+qJSr5+yurr+CCPmKgHjVaay/lSuM1b38U/V4WElxzxWWHpQeCy6/qK6+HKnoHzrdy0xcRUNwq/xD9f/MQSSMLVJXJhX8AyGwaoJ4/pnqnRf3OjSxlOIw8OkSIHQPPhc/G3GyprCant2yLFy3FZOS0fjgyeDgquKxcnNHVntw2VEAFk6X4lzdi19dWlow8lWLxCVQAfRwNeS3e+hnHuiUqD3/FqGtL+yJ7b2xdCH3oOQnfFfWv5++i/TqdNDPRpkNGYztSAATsEnk/xgXdKEcPfia7zpxx1wNlFsecIgm9TsiYOPkMtzO/nWjp2xrNnXN913t9ilcojXQgSyzVDINtAS8WkqI87M+dTRkTsLpzp+Ec4jwr6S4+Hpt5wep9Gnz1tGkBDsy4JO05M4/vdNBuEGflxPGp4SfQdN84oUnNgDrw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(7696005)(6666004)(36756003)(86362001)(83380400001)(66556008)(6486002)(1076003)(4326008)(316002)(44832011)(478600001)(8936002)(66946007)(38350700002)(38100700002)(186003)(52116002)(8676002)(2906002)(6916009)(26005)(2616005)(66476007)(5660300002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tC3kyIAcfR7o4TqTuFbSPN3G86zJ/9URiRogaUFF+vw72M5pkoly12+A3QVb?=
 =?us-ascii?Q?APYcla6iTlh8Xe6HxrLcs7FxM5Lz1GjORBCZn0yxdQu640MEPSWhlySyZsrp?=
 =?us-ascii?Q?azN0H3/xIRipkFvIed8SI3oaHekukcSbipXQt5G01Q8Jy7tOCE8RMxOvYiKs?=
 =?us-ascii?Q?81RBEYBhi+8/JONPIq0nMrn1wH0wyWbALJInDb2AKUpHJ/1DR9wTnxUodc/l?=
 =?us-ascii?Q?myM2mxwV6Vdm4yuC244sCvUD8f95en8opi8mmteBYyl03gGkKfaCLTeCBeeO?=
 =?us-ascii?Q?MzZ5qLuJO6DNnBIUEl7fBkfXjkN+2xmsT5v72AprAZB13QIL//uSn81UPrfK?=
 =?us-ascii?Q?8139YSnQ1fxSq6oAarjsUntFv0l3sVdnZpxWLSxNXDY0Qi25NyUfCKqvTj60?=
 =?us-ascii?Q?jt8MSfV2h0qORF9CYNb8BLqYSUilda5SqwbQJ8YOOPhedW3jHTfTujILlPF6?=
 =?us-ascii?Q?BoY1nKjDT7k67ENwl1KWBj1iOWMqWS8bms89ZCevOAJ8EU96y5oXL4UUXcsf?=
 =?us-ascii?Q?M+uEpNn+2UN5/9/6iGBzr6cNMWpAPryc/EDNK6t8XfFEh87wn8nOR401kyBr?=
 =?us-ascii?Q?DQpUqfJEjuTBuWib9FI4NmFw0AB7Fm1t+dEmfkfRUBBiqziv4Y3CzekNI2Kq?=
 =?us-ascii?Q?I0Zi88lJmy2pLUANwDyUrYGa8dy3rHvVER4clWRuJf5uov6nKIEBHVepsgjI?=
 =?us-ascii?Q?6r7VG5oRe2VpzHNHxCZ7RZFkhhFEi0WhTDSWzFef7Nv5avLDmo0hoYkYLYTL?=
 =?us-ascii?Q?bj5aRj7dj/pr91MTKgODsgLoQkpvWd/Q8SKXChvk+aoZ7WLEu7GB91xw2VT+?=
 =?us-ascii?Q?Hwu66mR1ljJkmRliUW/0fIeYANkGfCVrsNtTz6Q/m1IGbwTQBKDpb6D75+3d?=
 =?us-ascii?Q?FRctDz//SNWLU2qinWhfZBHqQNNCOGpF8bx4vIaa3stt5R879NWwfov1IAuR?=
 =?us-ascii?Q?AOrzXTIHLx92AJlrywbKCN75zXiKWj+cS8BXFJwMzHvdgXZeDV4Id+l42ApN?=
 =?us-ascii?Q?clMQh4WtIAgljN0ZWDkVO/Ks5vZi9f4kRAH+hs9CG9r7XyK0oqsXjWDNOCAz?=
 =?us-ascii?Q?6rT6CKGgukrwihJ6cfPG6JerfSlFL1rO9WsFPTUBPRHBGqYb3KsYe/LnT6iG?=
 =?us-ascii?Q?fZcJHkUMVXfKCyusppCEEgsVUKY1QV75PcRqntEnBRlkHEsI09Tsl8g0Ra9X?=
 =?us-ascii?Q?fM4rGq2sRJLPhsMHUxT3NtC/qwAYhLeHsFZltQxYifI8EMzfOBLpVWvIM5pU?=
 =?us-ascii?Q?mMfQnn/b2zjUKLu259At5Zr7iT7de3xCnLnhuXEg5gC5Nd88sZXD/QK+nSEP?=
 =?us-ascii?Q?bBNWeJMkPqoMEu2v1QFHUye1?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5833
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	425ea28b-dd11-4559-2e5a-08d950e2fa77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iLqDRD80b4rMMtcq09ZMFeBbq3eEbBaomFCaspv05x+G71QuC9dofXzU97d1v8DyLR+oSxsFdQS1uuPHQOP8spVZNaRRSYFTRZ6LfHkVxHA5tbqHWhftgMmUNjLUYVUyfeq7KkUb9kjpWGPS/LZgmhg6PyionRDuIS5LO7g9fUk0XqbuXBuxFyVLG37YoBqc3ExugGonOo/in13OZPfUqKCeTTUYvo55qbYT538cixxGmh91b2KvUe2BcI17pq1KQe0O6Bm7UUaPqRQWKp8LgT0+WxndOh8ObVar/jnmAUbNc6DPFfGP3bCVaepFA/hMrvGwIABIEAf+QgdmuyMDZBGuRkCNWfw1mldaNKzGOibGTEneHPy20BVVmACUePShVw3dIHv3XOhipKgi8eA85u40XYwJKOXp6ycfDZn6xTdxvRaSV2425404FDnLKQaUf1Qx5lCzjl8W/lGGQnMsE3AZgaeEzQchPBpkDIKuYuNh1iU6p7Z9san4BHBEMeNx6F20Xv3MPRMd1bjmUARqdQ7TjE1Ueh3RG5E8qkm3MyhnsHq8rPlb+yIweBH/LBhq0x5yMeb7N7Un6nFVa5DUez4n4e8TCQrcqsAvpl0dg4+ytNdS1c4ZdY654ogUETgECeRgsX1p9PO9qykQaNklPOMM7mKHH6AdmiQi0j65yrVneOMi4YwqhdXp+0pjl3SsX7HNahlrvpfA+gKv1iuf+g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(36840700001)(46966006)(70586007)(316002)(83380400001)(36756003)(2616005)(70206006)(7696005)(26005)(82740400003)(47076005)(86362001)(8676002)(186003)(8936002)(44832011)(5660300002)(4326008)(81166007)(478600001)(1076003)(956004)(82310400003)(336012)(6916009)(2906002)(6486002)(356005)(36860700001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 09:43:45.9276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ea42dd-a2fe-40d2-dba7-08d950e30754
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6626
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I2a8db6024af35bf95e94963b58011daebb3c666b
---
 .../tc0/0001-WIP-Enable-managed-exit.patch    | 123 ++++++++++++++++++
 .../recipes-security/optee/optee-os-tc0.inc   |   5 +-
 2 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/=
0001-WIP-Enable-managed-exit.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-WI=
P-Enable-managed-exit.patch b/meta-arm-bsp/recipes-security/optee/files/opt=
ee-os/tc0/0001-WIP-Enable-managed-exit.patch
new file mode 100644
index 0000000..c038299
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc0/0001-WIP-Enabl=
e-managed-exit.patch
@@ -0,0 +1,123 @@
+From 14b84786e85483bf3c737ef8b392204e307c0ff1 Mon Sep 17 00:00:00 2001
+From: Olivier Deprez <olivier.deprez@arm.com>
+Date: Mon, 16 Nov 2020 10:14:02 +0100
+Subject: [PATCH] WIP: Enable managed exit
+
+This change declares OP-TEE SP as supporting managed exit in response to
+a NS interrupt triggering while the SWd runs.
+
+At init OP-TEE enables (HF_INTERRUPT_ENABLE) the managed exit virtual
+interrupt through the Hafnium para-virtualized interface.
+
+Physical interrupts are trapped to the SPMC which injects a managed exit
+interrupt to OP-TEE. The managed exit interrupt is acknowledged by
+OP-TEE by HF_INTERUPT_GET hvc call.
+
+Note: this code change is meant with in mind the SPMC runs at SEL2. It
+needs slight refactoring such that it does not break the SEL1 SPMC
+configuration.
+
+Change-Id: I9a95f36cf517c11048ff04680007f40259c4f636
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ core/arch/arm/kernel/boot.c                          | 12 ++++++++++++
+ core/arch/arm/kernel/thread_a64.S                    | 11 ++++++++++-
+ core/arch/arm/kernel/thread_spmc.c                   | 11 +++++++++++
+ .../arm/plat-totalcompute/fdts/optee_sp_manifest.dts |  2 +-
+ 4 files changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/kernel/boot.c b/core/arch/arm/kernel/boot.c
+index 09c1b811..d130107f 100644
+--- a/core/arch/arm/kernel/boot.c
++++ b/core/arch/arm/kernel/boot.c
+@@ -1279,6 +1279,18 @@ static void init_secondary_helper(unsigned long nse=
c_entry)
+ 	init_vfp_sec();
+ 	init_vfp_nsec();
+=20
++	/* Enable managed exit interrupt for secondary core. */
++	__asm__ volatile (
++		"mov x0, %0;"
++		"mov x1, %1;"
++		"mov x2, %2;"
++		"mov x3, %3;"
++		"hvc #0"
++		: : "i" (0xff03), "i" (4), "i" (1), "i" (1));
++
++	IMSG("%s core %lu: enabled managed exit interrupt.",
++		__func__, get_core_pos());
++
+ 	IMSG("Secondary CPU %zu switching to normal world boot", get_core_pos())=
;
+ }
+=20
+diff --git a/core/arch/arm/kernel/thread_a64.S b/core/arch/arm/kernel/thre=
ad_a64.S
+index 3e0f5115..63bf396a 100644
+--- a/core/arch/arm/kernel/thread_a64.S
++++ b/core/arch/arm/kernel/thread_a64.S
+@@ -904,6 +904,14 @@ END_FUNC el0_sync_abort
+ 	bl	dcache_op_louis
+ 	ic	iallu
+ #endif
++
++	/* HF_INTERRUPT_GET */
++	mov	x0, #0xff04
++	hvc	#0
++	/* Expect managed exit interrupt */
++	cmp	x0, #4
++	bne	.
++
+ 	/*
+ 	 * Mark current thread as suspended
+ 	 */
+@@ -1021,8 +1029,9 @@ LOCAL_FUNC elx_irq , :
+ #endif
+ END_FUNC elx_irq
+=20
++#define HF_MANAGED_EXIT		1
+ LOCAL_FUNC elx_fiq , :
+-#if defined(CFG_ARM_GICV3)
++#if defined(CFG_ARM_GICV3) || defined (HF_MANAGED_EXIT)
+ 	foreign_intr_handler	fiq
+ #else
+ 	native_intr_handler	fiq
+diff --git a/core/arch/arm/kernel/thread_spmc.c b/core/arch/arm/kernel/thr=
ead_spmc.c
+index bd7930e7..89ff82bc 100644
+--- a/core/arch/arm/kernel/thread_spmc.c
++++ b/core/arch/arm/kernel/thread_spmc.c
+@@ -1394,6 +1394,17 @@ static TEE_Result spmc_init(void)
+ 	my_endpoint_id =3D spmc_get_id();
+ 	DMSG("My endpoint ID %#x", my_endpoint_id);
+=20
++	/* Enable managed exit interrupt for boot core. */
++	__asm__ volatile (
++		"mov x0, %0;"
++		"mov x1, %1;"
++		"mov x2, %2;"
++		"mov x3, %3;"
++		"hvc #0"
++		: : "i" (0xff03), "i" (4), "i" (1), "i" (1));
++
++	IMSG("%s enabled managed exit interrupt.", __func__);
++
+ 	return TEE_SUCCESS;
+ }
+ #endif /*CFG_CORE_SEL2_SPMC*/
+diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts b/=
core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+index 4b8b3681..04847c4d 100644
+--- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
++++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+@@ -23,7 +23,7 @@
+ 	entrypoint-offset =3D <0x1000>;
+ 	xlat-granule =3D <0>; /* 4KiB */
+ 	boot-order =3D <0>;
+-	messaging-method =3D <0>; /* Direct messaging only */
++	messaging-method =3D <3>; /* Direct messaging and managed exit supported=
 */
+=20
+ 	device-regions {
+ 		compatible =3D "arm,ffa-manifest-device-regions";
+--=20
+2.29.2
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc b/meta-ar=
m-bsp/recipes-security/optee/optee-os-tc0.inc
index 7afc112..c48cc6c 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc0.inc
@@ -6,7 +6,10 @@ SRCREV =3D "49dbb9ef65643c4322cf3f848910fa880d1c02f6"
 PV =3D "3.14.0+git${SRCPV}"
=20
 FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/optee-os/tc0:"
-SRC_URI_append =3D "file://sp_layout.json"
+SRC_URI_append =3D " \
+    file://sp_layout.json \
+    file://0001-WIP-Enable-managed-exit.patch \
+    "
=20
 COMPATIBLE_MACHINE =3D "tc0"
=20
--=20
2.29.2

