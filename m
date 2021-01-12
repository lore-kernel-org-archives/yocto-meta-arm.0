Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web08.10570.1610464875786284633
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jaEap/ym;
 spf=pass (domain: arm.com, ip: 40.107.8.58, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNltiraZ5yIZWU20Z5LuP832AtHr/osNInffv091noA=;
 b=jaEap/ymTYTlViTyIuEQf86Rh7r8bD0NCV1cS01boGSArqIqAfxh1ESl5fSqcuMhmt+rGBvVsOXdqz4ymoEKit488diWPIuApzM75e1bqzFPlqoh+msa7ZSWI4Hgsl9wiD54U07q5uabHSur6dMsXbS+rVspNNfzyhAOs2v/Xcs=
Received: from MR2P264CA0131.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:30::23)
 by AM0PR08MB3155.eurprd08.prod.outlook.com (2603:10a6:208:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:12 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:30:cafe::e1) by MR2P264CA0131.outlook.office365.com
 (2603:10a6:500:30::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:11 +0000
Received: ("Tessian outbound af289585f0f4:v71"); Tue, 12 Jan 2021 15:21:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf159c035581eeff
X-CR-MTA-TID: 64aa7808
Received: from dae1e6482cc7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B3143B75-9BD2-4654-AF8E-81647F84D639.1;
	Tue, 12 Jan 2021 15:21:04 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dae1e6482cc7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEZecXcF515CATqp4tsbe4Huvg6bxIUOFBCMJpZPjjVsQq2Zh4SXdudO1aVdp1eKwsOkU2sOKV3Ut3Efl2uwsvspoFgd4NBDFHV0ECI1O1iqT0NO8A7BEG1YqPvegKkCOA1c8WR374sBl7DQ+GIde/z/d3IkbMySoEGkjiXy0FJjm+35+gN7cfnFREm3WlOYSvIQMcB1RGGd8cRQpT7+nyvsB1ojveXtgRcGcFMqsaKnE29tpgaOFLMT542oIPauS5xNF+8V+Gq6RmhVTHf9zRldh0kVBYDazWUeIQFaZRhPcHk8LO/lAHFpNKKyI1uzstXnYbDRrSdUMQdTx1s/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNltiraZ5yIZWU20Z5LuP832AtHr/osNInffv091noA=;
 b=CHAiD1/mcbBSxIz+rr6U/EIx1IBoG5q0koLMa1a/sgEXFVwR0DGB0c15m6ewsLDkQA7J4qAmBWfkPVqITSs1n9jnqO62IegZY5PSAJmJSDj0Yo3nvSY1IZ1eXa+Z1eqdvglDbXb/eRHmp8ReZYA9gjlgVUXFmGXJxERE9HgZjjO7NB5CosHHBSQlNynDtsn1OIpULFsiSmfH8wo7/bYmUaIKdd6AKGLLBtBCY4CYxckTntr7tmJ72J48LZY0sOcrjX5af5pLoC3DVtcV4RFGSDpK/YNgXhkLXmOXoAWjSGcS4EYlqd6NvKY/VZK4GF214h7bGszdE9Ci9w1H6zFsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNltiraZ5yIZWU20Z5LuP832AtHr/osNInffv091noA=;
 b=jaEap/ymTYTlViTyIuEQf86Rh7r8bD0NCV1cS01boGSArqIqAfxh1ESl5fSqcuMhmt+rGBvVsOXdqz4ymoEKit488diWPIuApzM75e1bqzFPlqoh+msa7ZSWI4Hgsl9wiD54U07q5uabHSur6dMsXbS+rVspNNfzyhAOs2v/Xcs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3055.eurprd08.prod.outlook.com (2603:10a6:803:4e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:02 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:02 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 03/10] arm-bsp/tc0: Add hafnium support
Date: Tue, 12 Jan 2021 15:20:42 +0000
Message-ID: <20210112152049.3436645-3-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a60e71de-45ab-4662-1711-08d8b70db1db
X-MS-TrafficTypeDiagnostic: VI1PR08MB3055:|AM0PR08MB3155:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3155415D241ECDD2B7CB7B51FBAA0@AM0PR08MB3155.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:350;OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FqtmzX+aM2hAbW2sNatDcjGcSHb3PEx0z7wjm27urlvFHtkhbnb76Gr9g0XUlVCmG16XB/LelGAEtrMzJBmDTXkrSwpiEgDhThjJAo2VFnhUAYgx8ozx10W4MzfmgS83oOzCznLPKg7NJ+HDC5Jq/W0XZBq1KcrdUYZTaS4mqZWZ6hZrgw8YOQT+zEnBy7F/80bY8zU9qkWILsAFF1jmSwGlS3mMwLe9zSlL/98Knlo3/f7FjJiahFKO6QZjANS1U4m9ec/QQtuUKqnnQDEg6LE8dh0S41HD+Ak8OiQd8VZCWbZ5BzNjPZtzlUhvEIPiLHW3rDvyEm2KhN1GLwMJlRoe9G4xAEt2d+jGhtzXD4aDIdUOmfNXUytzw56mxZjg54VizWMLw8LNGqXl0rWWDB0vshrt2GsuRS9Nd4N4wk40/7jXvL3TPszYlx19wFH/hUJTGw7OjlPZGdXadvUbXw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39850400004)(6916009)(6666004)(1076003)(6486002)(5660300002)(30864003)(4326008)(316002)(7696005)(16526019)(66556008)(66476007)(956004)(36756003)(478600001)(26005)(186003)(2906002)(44832011)(966005)(66946007)(8676002)(52116002)(2616005)(86362001)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2lshWgvDmU26h3JlVeozbJAfIdHKWMMEQFTVfByOqADPsGvTAzaPgtFw4R0E?=
 =?us-ascii?Q?ww2tBljbdgOkj479c7qshfJX9/sP/jcwLVDAwXU1XOGoawd7reZUkNxOyEL4?=
 =?us-ascii?Q?foY5YxHwMgcJlOFP7b01SqFzm2RKTeAryNWJnmXd+xFTVfvlmhn5/kzEXL8Q?=
 =?us-ascii?Q?gcsHF8aNGEwso3nPVtcmash6VCFddtBvPn+PZJtx28NzGhh7CuXSr2WB5L3v?=
 =?us-ascii?Q?ZNH/Tafh3Ge2QVJxvJvOzAA1adfRsO3cMQ26OAC/Y7Xs3GMRG3USSPL5X533?=
 =?us-ascii?Q?KYUc9suB+k5Bcev098LQ7liM72+r5wQIvFPesaNpC6PU2mF9SDJ3Mktg3eYc?=
 =?us-ascii?Q?eAbeiscn6Y5Y2ScQ0RSOpXzOi9QMTaCoFI+bmPAI0T+uPgqJkorBlEVRq5e8?=
 =?us-ascii?Q?3VPDbWCot0H7XPcDxVTN/XsUjyAZHkaKw/Sv8eoVnURIiTmtNeSA2MxDa5em?=
 =?us-ascii?Q?zYuO/4l5qWLgQz0cQFuLSeaPG1e6/fJ2fXkVE24GglAEiDW9C2ubmqMP16Km?=
 =?us-ascii?Q?iWQexeZEjDPgX3j8ufZFgKKQFykw942YvVPum4xqlurQsBe/N0paKAf0bNbU?=
 =?us-ascii?Q?yC1mqCRKwXy/VH+vaaUwIlRoyjn1/Ahs6ZFY+i96/MGQCIAgONt936ws63zO?=
 =?us-ascii?Q?dmyHAuxXvXFuStrpIifEdFwHnzD9TclpXPgOkHxWwq26Fr+yJGVE5yIYWULm?=
 =?us-ascii?Q?deCgJZNHf43/qzSW45lQ2+zy/aD04YrDq4D5mC5Fmt8dcGi0BBnU1yPBDv8X?=
 =?us-ascii?Q?DZWrq8HP1F9kHQoa02Ejg0IHO6wAxNZuvlYntyWK/FzlrFS+JeL7kPs2wTy/?=
 =?us-ascii?Q?Sx01RGKagcW8l0sLfmrkRSiZsbklLtuy+908jAf1OG+f2sflx4AKdGKiZDWS?=
 =?us-ascii?Q?f1Lj+eM0c1PwBEvJvipDkY3WloxYcbxFiQr6UZDiPj6nZ+ZxxrIUf6PpMhK8?=
 =?us-ascii?Q?08DSs1Rkrj9Ig/8giAvLRGTN/Ecu1VJMB1oQD8rjFHe42+/jEPyoWoi2Gghc?=
 =?us-ascii?Q?s5DT?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3055
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2574e87c-d4c6-4ec7-ac5d-08d8b70dac45
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HUnviBtAHm6rIAU9tp9RKq0I5SjgxHUZfXmVB+/ijahzwrigC8aA9+VPIu9hTyyLyqVzUokeGpLuoVtOPCTYTs6G4XbVquokzQuY/0Dk4UsnChSAXkZat7wuAtQsZgn3Ok4xmm7qhEdn0kG+k9b3SR9LM0FIgD/3TucOKdDVn1cO+6yQduMTZMrPPNgs7JsBAehAdpUzohfP7pKIRdPLCsxiZkRd0DGacyHavOoue6yBSR9lFOMhJXo1v+U+Hur6Qx5qXIttq7hYeiFvn0MxewmkthN5S4DkdZvvR6lUDPgjWvTx3q/c4moJ14gcZyC6xervI/x7eIAAebNHhcWVsr4NsD9Zy3K0urCOLCfyQWAiBuH+v6PjrQZWCrstXgChrgBzzJZsN4S7vRCehoBh9u9BKRr5UBT8/7tMnBgfR/yaeWckNVwYwVg0oL6TMHh5p5P1Vym4eDeUEb/sr0/Y92tIETqJZNR9HLe3qmgZUxLRc3JS8FRDuXoNkT743uOvgLjjbla6sID6a/8cOXATf6DEoKxKyKPDx1OXLN7qegLA3GjNgBXnHAYtp3fazcch
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(46966006)(5660300002)(83380400001)(86362001)(36756003)(81166007)(2906002)(82740400003)(7696005)(8936002)(966005)(16526019)(186003)(6916009)(6486002)(44832011)(356005)(6666004)(34020700004)(82310400003)(26005)(47076005)(956004)(70586007)(70206006)(8676002)(4326008)(2616005)(316002)(336012)(478600001)(1076003)(30864003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:11.7549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a60e71de-45ab-4662-1711-08d8b70db1db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3155
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Enables hafnium support for tc0.
Adds pending patches for SEL1 SP support.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: If5c12b7e7b7a301ae9a48a88223be3e51f38d3aa
---
 ...condary-core-entry-point-at-SPMC-ini.patch | 324 ++++++++++++++++++
 ...A-Cold-boot-and-wake-up-from-suspend.patch |  65 ++++
 ...-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch |  87 +++++
 .../recipes-bsp/hafnium/hafnium-tc0.inc       |  19 +
 .../recipes-bsp/hafnium/hafnium_2.4.bbappend  |   6 +
 5 files changed, 501 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Re=
gister-secondary-core-entry-point-at-SPMC-ini.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Co=
ld-boot-and-wake-up-from-suspend.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Re=
spond-to-PSCI_CPU_OFF-from-SPMD.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.4.bbappend

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Register-=
secondary-core-entry-point-at-SPMC-ini.patch b/meta-arm-bsp/recipes-bsp/haf=
nium/files/tc0/0001-FF-A-Register-secondary-core-entry-point-at-SPMC-ini.pa=
tch
new file mode 100644
index 0000000..5828750
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Register-seconda=
ry-core-entry-point-at-SPMC-ini.patch
@@ -0,0 +1,324 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From cb329ce33874abd8b69988c3dc63fd323a3413be Mon Sep 17 00:00:00 2001
+From: Max Shvetsov <maksims.svecovs@arm.com>
+Date: Thu, 27 Aug 2020 12:37:57 +0100
+Subject: [PATCH 1/4] FF-A: Register secondary core entry point at SPMC ini=
t.
+
+When the primary physical core boots the SPMC registers its secondary phys=
ical
+core entry points to the SPMD. All Secure Partition are then initialized o=
n
+their primary Execution Contexts. A Secure Partition calls PSCI_CPU_ON fro=
m its
+first EC (trapped to the SPMC) passing entry point addresses of secondary =
ECs.
+ECs are turned "on" in their SPMC internal states, although they do not ru=
n yet
+(the service call does not reach the EL3 PSCI layer). Later, when the NWd
+(Hypervisor or OS Kernel) boots, it calls PSCI_CPU_ON for waking up physic=
al
+cores down to EL3. The PSCI layer calls into SPMD PM hooks, then the SPMD =
calls
+into the SPMC by an exception return to the registered secondary entry poi=
nt.
+The target secondary core then reaches Hafnium vcpu_main.
+
+Change-Id: I2bd42ea54e1a7feebff20e878345ec196ff352e9
+Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
+Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
+---
+ inc/hf/arch/init.h                          |   7 ++
+ src/arch/aarch64/hypervisor/psci_handler.c  | 131 +++++++++++++++++---
+ src/arch/aarch64/inc/hf/arch/spmd_helpers.h |  15 +++
+ src/cpu.c                                   |   7 ++
+ src/init.c                                  |   2 +
+ 5 files changed, 143 insertions(+), 19 deletions(-)
+ create mode 100644 src/arch/aarch64/inc/hf/arch/spmd_helpers.h
+
+diff --git a/inc/hf/arch/init.h b/inc/hf/arch/init.h
+index 5205e4e..ef0e48f 100644
+--- a/inc/hf/arch/init.h
++++ b/inc/hf/arch/init.h
+@@ -8,6 +8,8 @@
+=20
+ #pragma once
+=20
++#include "hf/boot_params.h"
++
+ /**
+  * Performs arch specific boot time initialization.
+  *
+@@ -15,3 +17,8 @@
+  * possible.
+  */
+ void arch_one_time_init(void);
++
++/**
++ * Sets up secondary cores.
++ */
++void arch_psci_secondary_core_init(const struct boot_params *params);
+diff --git a/src/arch/aarch64/hypervisor/psci_handler.c b/src/arch/aarch64=
/hypervisor/psci_handler.c
+index f89a00b..bdcc1d3 100644
+--- a/src/arch/aarch64/hypervisor/psci_handler.c
++++ b/src/arch/aarch64/hypervisor/psci_handler.c
+@@ -11,9 +11,11 @@
+ #include <stdint.h>
+=20
+ #include "hf/arch/plat/psci.h"
++#include "hf/arch/spmd_helpers.h"
+ #include "hf/arch/types.h"
+=20
+ #include "hf/api.h"
++#include "hf/boot_params.h"
+ #include "hf/cpu.h"
+ #include "hf/dlog.h"
+ #include "hf/ffa.h"
+@@ -24,9 +26,32 @@
+ #include "smc.h"
+=20
+ static uint32_t el3_psci_version;
++static ffa_vm_id_t physical_ffa_id;
+=20
+ void cpu_entry(struct cpu *c);
+=20
++#if SECURE_WORLD =3D=3D 1
++
++static void set_ffa_id(void)
++{
++	struct ffa_value res =3D
++		smc_ffa_call((struct ffa_value){.func =3D FFA_ID_GET_32});
++
++	if (res.func !=3D FFA_SUCCESS_32) {
++		dlog_error("%s Failed to get it's own FF-A ID.\n", __func__);
++		physical_ffa_id =3D HF_INVALID_VM_ID;
++		return;
++	}
++	physical_ffa_id =3D res.arg2 & 0xFFFF;
++}
++
++#endif
++
++ffa_vm_id_t get_ffa_id(void)
++{
++	return physical_ffa_id;
++}
++
+ /* Performs arch specific boot time initialisation. */
+ void arch_one_time_init(void)
+ {
+@@ -53,9 +78,79 @@ void arch_one_time_init(void)
+ 	}
+ #else
+ 	el3_psci_version =3D PSCI_VERSION_1_1;
++
++	set_ffa_id();
+ #endif
+ }
+=20
++/**
++ * Register secondary physical core entry points to the SPMD.
++ */
++void arch_psci_secondary_core_init(const struct boot_params *params)
++{
++#if SECURE_WORLD =3D=3D 1
++	struct ffa_value res;
++
++	for (uint32_t count =3D 0; count < params->cpu_count; count++) {
++		uint32_t id =3D params->cpu_ids[count];
++		struct cpu *cpu =3D cpu_find(id);
++		const ffa_vm_id_t ffa_id =3D get_ffa_id();
++
++		res =3D smc_ffa_call((struct ffa_value){
++			.func =3D FFA_MSG_SEND_DIRECT_REQ_32,
++			.arg1 =3D (ffa_id << 16) | SPMD_ID,
++			.arg3 =3D SPMD_DIRECT_MSG_SET_ENTRY_POINT,
++			.arg4 =3D params->cpu_ids[count],
++			.arg5 =3D (uintreg_t)&cpu_entry,
++			.arg6 =3D (uintreg_t)cpu});
++
++		if (res.func !=3D FFA_SUCCESS_32) {
++			dlog_warning(
++				"%s Failed to initialize secondary core ID: "
++				"%u\n",
++				__func__, id);
++		}
++
++		dlog_verbose("SPMD EP register returned %#x\n", res.func);
++	}
++#endif
++}
++
++/**
++ * Convert a PSCI CPU / affinity ID for a secondary VM to the correspondi=
ng vCPU
++ * index.
++ */
++ffa_vcpu_index_t vcpu_id_to_index(cpu_id_t vcpu_id)
++{
++	/* For now we use indices as IDs for the purposes of PSCI. */
++	return vcpu_id;
++}
++
++#if SECURE_WORLD =3D=3D 1
++/**
++ * Use vcpu_on only as a way to initialize entry point without
++ * an intent to power up vcpu.
++ */
++static uintreg_t ffa_register_entrypoint(cpu_id_t id, struct vm *vm,
++					 uintreg_t entrypoint, uintreg_t param)
++{
++	ffa_vcpu_index_t target_vcpu_index =3D vcpu_id_to_index(id);
++
++	if (target_vcpu_index >=3D vm->vcpu_count) {
++		return PSCI_ERROR_INVALID_PARAMETERS;
++	}
++
++	struct vcpu *target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
++	struct vcpu_locked locked_target_vcpu =3D vcpu_lock(target_vcpu);
++
++	vcpu_on(locked_target_vcpu, ipa_init(entrypoint), param);
++
++	vcpu_unlock(&locked_target_vcpu);
++
++	return PSCI_RETURN_SUCCESS;
++}
++#endif
++
+ /**
+  * Handles PSCI requests received via HVC or SMC instructions from the pr=
imary
+  * VM.
+@@ -180,7 +275,8 @@ bool psci_primary_vm_handler(struct vcpu *vcpu, uint32=
_t func, uintreg_t arg0,
+ 		panic("CPU off failed");
+ 		break;
+=20
+-	case PSCI_CPU_ON:
++	case PSCI_CPU_ON: {
++#if SECURE_WORLD =3D=3D 0
+ 		c =3D cpu_find(arg0);
+ 		if (!c) {
+ 			*ret =3D PSCI_ERROR_INVALID_PARAMETERS;
+@@ -208,7 +304,12 @@ bool psci_primary_vm_handler(struct vcpu *vcpu, uint3=
2_t func, uintreg_t arg0,
+ 		if (*ret !=3D PSCI_RETURN_SUCCESS) {
+ 			cpu_off(c);
+ 		}
++#else
++		*ret =3D ffa_register_entrypoint((cpu_id_t)arg0, vcpu->vm, arg1,
++					       arg2);
++#endif
+ 		break;
++	}
+=20
+ 	case PSCI_MIGRATE:
+ 	case PSCI_MIGRATE_INFO_TYPE:
+@@ -234,16 +335,6 @@ bool psci_primary_vm_handler(struct vcpu *vcpu, uint3=
2_t func, uintreg_t arg0,
+ 	return true;
+ }
+=20
+-/**
+- * Convert a PSCI CPU / affinity ID for a secondary VM to the correspondi=
ng vCPU
+- * index.
+- */
+-ffa_vcpu_index_t vcpu_id_to_index(cpu_id_t vcpu_id)
+-{
+-	/* For now we use indices as IDs for the purposes of PSCI. */
+-	return vcpu_id;
+-}
+-
+ /**
+  * Handles PSCI requests received via HVC or SMC instructions from a seco=
ndary
+  * VM.
+@@ -337,22 +428,23 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, ui=
nt32_t func, uintreg_t arg0,
+ 	case PSCI_CPU_ON: {
+ 		/* Parameter names as per PSCI specification. */
+ 		cpu_id_t target_cpu =3D arg0;
+-		ipaddr_t entry_point_address =3D ipa_init(arg1);
+ 		uint64_t context_id =3D arg2;
+-		ffa_vcpu_index_t target_vcpu_index =3D
+-			vcpu_id_to_index(target_cpu);
+ 		struct vm *vm =3D vcpu->vm;
+-		struct vcpu *target_vcpu;
+=20
++#if SECURE_WORLD =3D=3D 1
++		*ret =3D ffa_register_entrypoint((cpu_id_t)target_cpu, vm, arg1,
++					       context_id);
++#else
++		ffa_vcpu_index_t target_vcpu_index =3D
++			vcpu_id_to_index(target_cpu);
+ 		if (target_vcpu_index >=3D vm->vcpu_count) {
+ 			*ret =3D PSCI_ERROR_INVALID_PARAMETERS;
+ 			break;
+ 		}
++		struct vcpu *target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
+=20
+-		target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
+-
+-		if (vcpu_secondary_reset_and_start(
+-			    target_vcpu, entry_point_address, context_id)) {
++		if (vcpu_secondary_reset_and_start(target_vcpu, ipa_init(arg1),
++						   context_id)) {
+ 			/*
+ 			 * Tell the scheduler that it can start running the new
+ 			 * vCPU now.
+@@ -362,6 +454,7 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, uint=
32_t func, uintreg_t arg0,
+ 		} else {
+ 			*ret =3D PSCI_ERROR_ALREADY_ON;
+ 		}
++#endif
+=20
+ 		break;
+ 	}
+diff --git a/src/arch/aarch64/inc/hf/arch/spmd_helpers.h b/src/arch/aarch6=
4/inc/hf/arch/spmd_helpers.h
+new file mode 100644
+index 0000000..6e11c36
+--- /dev/null
++++ b/src/arch/aarch64/inc/hf/arch/spmd_helpers.h
+@@ -0,0 +1,15 @@
++/*
++ * Copyright 2020 The Hafnium Authors.
++ *
++ * Use of this source code is governed by a BSD-style
++ * license that can be found in the LICENSE file or at
++ * https://opensource.org/licenses/BSD-3-Clause.
++ */
++
++#define SPMD_ID 0xFFFF
++#define SPMD_DIRECT_MSG_SET_ENTRY_POINT 1
++
++/**
++ * Get SPMC ID stored in the manifest.
++ */
++ffa_vm_id_t get_ffa_id(void);
+diff --git a/src/cpu.c b/src/cpu.c
+index 0a3fc6f..42a17fa 100644
+--- a/src/cpu.c
++++ b/src/cpu.c
+@@ -138,6 +138,8 @@ bool cpu_on(struct cpu *c, ipaddr_t entry, uintreg_t a=
rg)
+ 	c->is_on =3D true;
+ 	sl_unlock(&c->lock);
+=20
++#if SECURE_WORLD =3D=3D 0
++
+ 	if (!prev) {
+ 		struct vm *vm =3D vm_find(HF_PRIMARY_VM_ID);
+ 		struct vcpu *vcpu =3D vm_get_vcpu(vm, cpu_index(c));
+@@ -148,6 +150,11 @@ bool cpu_on(struct cpu *c, ipaddr_t entry, uintreg_t =
arg)
+ 		vcpu_unlock(&vcpu_locked);
+ 	}
+=20
++#else
++	(void)entry;
++	(void)arg;
++#endif
++
+ 	return prev;
+ }
+=20
+diff --git a/src/init.c b/src/init.c
+index a5b48ab..0121213 100644
+--- a/src/init.c
++++ b/src/init.c
+@@ -146,6 +146,8 @@ void one_time_init(void)
+=20
+ 	cpu_module_init(params.cpu_ids, params.cpu_count);
+=20
++	arch_psci_secondary_core_init(&params);
++
+ 	/* Load all VMs. */
+ 	update.reserved_ranges_count =3D 0;
+ 	if (!load_vms(mm_stage1_locked, &manifest, &cpio, &params, &update,
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Cold-boot=
-and-wake-up-from-suspend.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc=
0/0002-FF-A-Cold-boot-and-wake-up-from-suspend.patch
new file mode 100644
index 0000000..0b58637
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Cold-boot-and-wa=
ke-up-from-suspend.patch
@@ -0,0 +1,65 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 8422e2a5d6b2094f9f451a2d818a593cba29af84 Mon Sep 17 00:00:00 2001
+From: Max Shvetsov <maksims.svecovs@arm.com>
+Date: Thu, 27 Aug 2020 12:39:50 +0100
+Subject: [PATCH 2/4] FF-A: Cold boot and wake up from suspend.
+
+WIP: Currently there is zero entry-point passed with no arguments, This
+will be reworked once a proper way to pass this information will be
+defined.
+
+Change-Id: Ic6050af16d4081ca31729744995fbb999b170e11
+Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
+---
+ src/main.c | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index 5f30aac..7b7264f 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -7,6 +7,7 @@
+  */
+=20
+ #include "hf/cpu.h"
++#include "hf/dlog.h"
+ #include "hf/vm.h"
+=20
+ /**
+@@ -16,9 +17,31 @@
+ struct vcpu *cpu_main(struct cpu *c)
+ {
+ 	struct vcpu *vcpu;
++
+ #if SECURE_WORLD =3D=3D 1
+ 	struct vm *first_boot =3D vm_get_first_boot();
+=20
++	if (c->is_on =3D=3D false) {
++		/*
++		 * This is the PSCI warm reset path (svc_cpu_on_finish
++		 * handler relayed by SPMD). Notice currenty the "first_boot"
++		 * VM is resumed on any CPU on event.
++		 */
++		(void)cpu_on(c, ipa_init(0UL), 0UL);
++		dlog_verbose("%s: cpu mpidr 0x%x on\n", __func__, c->id);
++	}
++
++	/*
++	 * If `vm_get_first_boot` returns a valid vm, the first partition to
++	 * execute is in accordance to the boot-order field of the partition's
++	 * manifest.
++	 * Else, no partition has been configured with the "boot-order" field
++	 * in its manifest, and primary vm should be booted.
++	 */
++	if (!first_boot) {
++		first_boot =3D vm_find(HF_PRIMARY_VM_ID);
++	}
++
+ 	vcpu =3D vm_get_vcpu(first_boot, cpu_index(c));
+ #else
+ 	vcpu =3D vm_get_vcpu(vm_find(HF_PRIMARY_VM_ID), cpu_index(c));
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Respond-t=
o-PSCI_CPU_OFF-from-SPMD.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0=
/0003-FF-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch
new file mode 100644
index 0000000..83aeca3
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Respond-to-PSCI_=
CPU_OFF-from-SPMD.patch
@@ -0,0 +1,87 @@
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 66d7628fea54dd7a25d25a13eb4f732c0a3428d0 Mon Sep 17 00:00:00 2001
+From: Max Shvetsov <maksims.svecovs@arm.com>
+Date: Fri, 18 Sep 2020 13:52:20 +0100
+Subject: [PATCH 3/4] FF-A: Respond to PSCI_CPU_OFF from SPMD.
+
+At run-time when a PSCI call is made from NWd, the corresponding SPMD PM
+hooks gets called and is eventually routed to the SPMC.  This change
+implements a generic "SPMD handler" processing PM events that may be
+conveyed from SPMD to SPMC such as core suspend, core off.
+
+Change-Id: Id288e26d9fbb8328acc71f5cf68c39e095a0e3da
+Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
+---
+ src/arch/aarch64/hypervisor/handler.c | 40 ++++++++++++++++++++++++++-
+ 1 file changed, 39 insertions(+), 1 deletion(-)
+
+diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hype=
rvisor/handler.c
+index c10f77e..95d6a18 100644
+--- a/src/arch/aarch64/hypervisor/handler.c
++++ b/src/arch/aarch64/hypervisor/handler.c
+@@ -13,6 +13,7 @@
+ #include "hf/arch/mmu.h"
+ #include "hf/arch/other_world.h"
+ #include "hf/arch/plat/smc.h"
++#include "hf/arch/spmd_helpers.h"
+=20
+ #include "hf/api.h"
+ #include "hf/check.h"
+@@ -478,6 +479,41 @@ static bool ffa_handler(struct ffa_value *args, struc=
t vcpu *current,
+=20
+ #if SECURE_WORLD =3D=3D 1
+=20
++/**
++ * Returns true if the message is sent directly from SPMD to SPMC.
++ */
++static bool is_spmd_message(const uint64_t arg)
++{
++	return (((arg & 0xFFFF) =3D=3D get_ffa_id()) &&
++		(((arg >> 16) & 0xFFFF) =3D=3D SPMD_ID));
++}
++
++/**
++ * Handle special direct messages from SPMD to SPMC. For now related to p=
ower
++ * management only.
++ */
++static bool spmd_handler(struct ffa_value *ret)
++{
++	if (!is_spmd_message(ret->arg1)) {
++		return false;
++	}
++
++	dlog_verbose("%s Handling direct PSCI calls from SPMD\n", __func__);
++
++	switch (ret->arg3) {
++	case PSCI_CPU_OFF:
++		ret->func =3D FFA_MSG_SEND_DIRECT_RESP_32;
++		ret->arg1 =3D (get_ffa_id() << 16) | SPMD_ID;
++		ret->arg2 =3D 0U;
++		break;
++	default:
++		dlog_verbose("Following message not handled %#x\n", ret->arg3);
++		return false;
++	}
++
++	return true;
++}
++
+ /**
+  * Called to switch to the other world and handle FF-A calls from it. Ret=
urns
+  * when it is ready to run a secure partition again.
+@@ -510,7 +546,9 @@ static void other_world_switch_loop(struct vcpu *other=
_world_vcpu,
+ 		 * the result of the call back to EL3 unless the API handler
+ 		 * sets *next to something different.
+ 		 */
+-		if (!ffa_handler(&other_world_args, other_world_vcpu, next)) {
++
++		if (!spmd_handler(&other_world_args) &&
++		    !ffa_handler(&other_world_args, other_world_vcpu, next)) {
+ 			other_world_args.func =3D SMCCC_ERROR_UNKNOWN;
+ 		}
+ 	}
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc b/meta-arm-bs=
p/recipes-bsp/hafnium/hafnium-tc0.inc
new file mode 100644
index 0000000..51747ce
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
@@ -0,0 +1,19 @@
+# TC0 specific configuration
+
+# Intermediate SHA with 2.4 baseline version
+SRCREV =3D "ee68c5494dea5c5a59aa02af46b35ab3d949672e"
+PV =3D "2.4+git${SRCPV}"
+
+FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/tc0:"
+
+SRC_URI_append =3D " \
+    file://0001-FF-A-Register-secondary-core-entry-point-at-SPMC-ini.patch=
 \
+    file://0002-FF-A-Cold-boot-and-wake-up-from-suspend.patch \
+    file://0003-FF-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch \
+    "
+
+COMPATIBLE_MACHINE =3D "tc0"
+
+HAFNIUM_PROJECT =3D "reference"
+HAFNIUM_PLATFORM =3D "secure_tc0"
+HAFNIUM_INSTALL_TARGET =3D "hafnium"
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.4.bbappend b/meta-a=
rm-bsp/recipes-bsp/hafnium/hafnium_2.4.bbappend
new file mode 100644
index 0000000..a6e6874
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.4.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_HAFNIUM_REQUIRE ?=3D ""
+MACHINE_HAFNIUM_REQUIRE_tc0 =3D "hafnium-tc0.inc"
+
+require ${MACHINE_HAFNIUM_REQUIRE}
--=20
2.29.2

