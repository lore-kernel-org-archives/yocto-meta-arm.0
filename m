Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.70])
 by mx.groups.io with SMTP id smtpd.web12.13835.1614270123251957583
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 25 Feb 2021 08:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QwZcZI0r;
 spf=pass (domain: arm.com, ip: 40.107.21.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JM/tdI17K4RxssaIPG/pZGOhLJkjqPBwOfzE/OPlwXg=;
 b=QwZcZI0ry7PxaMwIqE5OMkvn1ECSx3Bj5jtbAI3J2LI6JTPbjAn7koSEVDYOAl183FUf+HbcIPOWLKn9o8NLzLq7gg7wVRPg+o2laQGOoAv4ZJwvbSI3hrirvC99WskgeXWfMo1/FiQf+l+K8MrCJGeMhOfOguOzfCHnoTC1yWY=
Received: from AS8PR04CA0189.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::14)
 by AS8PR08MB6056.eurprd08.prod.outlook.com (2603:10a6:20b:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 25 Feb
 2021 16:22:00 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::c3) by AS8PR04CA0189.outlook.office365.com
 (2603:10a6:20b:2f3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Thu, 25 Feb 2021 16:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 16:21:59 +0000
Received: ("Tessian outbound 38eaf6505aed:v71"); Thu, 25 Feb 2021 16:21:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ff477014824c483
X-CR-MTA-TID: 64aa7808
Received: from 2b569bf4f80d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F75238EA-7594-4577-879F-F62975374768.1;
	Thu, 25 Feb 2021 16:21:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b569bf4f80d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Feb 2021 16:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6AIQErczE6Uf+nSsm4Kfz917CUwV5SMlBwQzocmsUmi1PcDit4EmE8MgfUdzBBZavXDawqAhPm2FDmpSihim1VMsgIsNMek/LVieERaFR8/Y6mBPJY2hkn+UYfTHcrIzSsnhHP2lXjX/kv21/F3kUzd005X1WxQDs9wRqTEqIwaNv0+D3zNVSfIWaD2gZGBbjbO5EZJtE2VfJLjbM85JuV+2ev+wInLVsxlph32CYDJtnZXEwPkg1+0pMVSdKbIiAM6+Mvg1I99grosD0QFbLRfKzpSCbKQE81jKM9y3P0OD0X/+j40NdVUoJ3Rp8ixpHV4RrMW1DgVpIrXNMnPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JM/tdI17K4RxssaIPG/pZGOhLJkjqPBwOfzE/OPlwXg=;
 b=hKEKaQpEYB8YbqKXkXNPOr+1XG0EdOjzVlF6WVEqk4pYhWmc6Vuf0RvakDW4041Jiyh/EhC3FwGYwe7GhpMe9etA6s4eLGHhVOBcr4rzCpb0S14dRUFEfWLi1QK7QRLvU3AAeqZmGFdDKdvZvrsJvJjnwvIN4ajYWaalaRk/C+h0rmCDM8tuXtIjWTrY4TWfkexYrJIod4Tyzfe2nLZINoOuhc03vO3MkCxw3m3LlpRel0QplfewmK57zYPygS12d97FrmcD3Fvcy7keDaXBP2VZVCwdGtahzQ/c4pYZSHKVsgRpQd9+h972SRf1EO+yjKX2XcNS3Z1fMoIUSBerMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JM/tdI17K4RxssaIPG/pZGOhLJkjqPBwOfzE/OPlwXg=;
 b=QwZcZI0ry7PxaMwIqE5OMkvn1ECSx3Bj5jtbAI3J2LI6JTPbjAn7koSEVDYOAl183FUf+HbcIPOWLKn9o8NLzLq7gg7wVRPg+o2laQGOoAv4ZJwvbSI3hrirvC99WskgeXWfMo1/FiQf+l+K8MrCJGeMhOfOguOzfCHnoTC1yWY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4230.eurprd08.prod.outlook.com (2603:10a6:20b:b3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 25 Feb
 2021 16:21:50 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 16:21:50 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH 2/3] arm-bsp: fvp-base-arm32: Correct load address for device tree
Date: Thu, 25 Feb 2021 16:21:42 +0000
Message-Id: <cb2a07be841906c29b993443a1c5fd3933542d61.1614269958.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ff23c6e49ff925107b7378afe0430ed4c6950b63.1614269958.git.diego.sueiro@arm.com>
References: <ff23c6e49ff925107b7378afe0430ed4c6950b63.1614269958.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1aa::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32 via Frontend Transport; Thu, 25 Feb 2021 16:21:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1e52039a-73fb-460f-e6a4-08d8d9a97a36
X-MS-TrafficTypeDiagnostic: AM6PR08MB4230:|AS8PR08MB6056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB60567365E8EC08D4607F184D929E9@AS8PR08MB6056.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:304;OLM:304;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oCGlZreeVIptkX9+fuV249kbMmNC0GM3vU5tzV2oAyVbBrHq0OSYsg375/Cul2yDRZPvlhNcf6BaGk4MQkWy1qDYruejeIGTwP65xl5rFT1pEKzMnIpI5KohlydFsbXr5EsQLRF2rKfjLlGAq33OZS7wGoDBJaqimsF9BdvyTaFuDPBAACS4qYND6sm5wXOncgpJgkV33kOR2J6HRPVvtnY241jepvmGZowHK3FbpF0uWf2AIZkr8OY0I2CiPVRWCh6b4RtFhFVdy9sbKHnE72/L9Oyh5HkCXfpC1dSWbRWKLbVKwZ+fMAkVAJvFiT+c5Qd45xPTu+CijaLRwMIlLUQDek9Ws1dAPeQGTLmOmkxKr7YqVR7+c5A09qDpXtctGJxeRccCmhJ61RF4re1MU8GLNap8v59MAsUcy7sN7NmqKa/TzlvUac9jCuhT99UxBGtacGx236Zi0mRgICrBYXqJ83YbyYQSrw/+51lqKupgh48HfVPWo2bVqILpRMZ/3j6Ox0mjwvCEvwCH809/1Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(8936002)(2906002)(6916009)(26005)(16526019)(7696005)(36756003)(6666004)(186003)(53546011)(4326008)(44832011)(52116002)(6486002)(66946007)(86362001)(83380400001)(316002)(5660300002)(2616005)(66556008)(478600001)(66476007)(8676002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?z9GQzNtvoqq+/oTobu3lsnPSHa38XpPlo6qnLC1PnMiptrIuI4q1QKwirH5z?=
 =?us-ascii?Q?FxW/36hSQn3dfSQxhuXKx6semMKq+KsX7MJv+2ENx6vYHJsdZZPITciBT34p?=
 =?us-ascii?Q?K8LZVm958PCItnrTkeFrkmNKcB/h4bShxbFO77oJS/THfpRovMAKUXPU9FXp?=
 =?us-ascii?Q?y/64Fd1WE/cck4Mqns+G7i7oN/T5EF8gxQvoXyf4hxpEbfvOqTIg++GOkYrK?=
 =?us-ascii?Q?8F/UGsnxqTz6emM1u9ZYeUWGrAkDv0OyWE8txz7ASWw6c+dItm/UEsDAY9kY?=
 =?us-ascii?Q?xXQxc5ss/YvuowKGhVfnhSUES4H8QihE4AxgeERtjJrazmKA3X9VNTLG/jGz?=
 =?us-ascii?Q?y8d0bk2ldrVmgdK3MutpneCGZMJr8wRL3Kk/5CoPyC6sOLmqn12UTmJ3TEe3?=
 =?us-ascii?Q?cSLIZJyEzc3aTrIp+gs9GDzGhydZWmjIlkKCu7Usva5cVKkLG/K2lGo8YWwz?=
 =?us-ascii?Q?3jkzjmrO1PoHOo3XBlzv1392XUGND7mHenAHZzzMpT9SBZK1mLa0uWQTKVpM?=
 =?us-ascii?Q?aO79ICaWkDzJkbXBQ6tvMFe2S0dyfV3YjF6BdjV4slL2vYWeUhMb5OdnXiXL?=
 =?us-ascii?Q?yHzDAX5WFFFQz6SOuvZQ10JujdMq9I4qdmlQFo0mIw4Oir5kULH3NFen+DPg?=
 =?us-ascii?Q?u+lBAfEvByFZ+BMFG1r3rxbiwDWyuOU5HO8LlYdQLH3TkIPewwIyLFL3/xGe?=
 =?us-ascii?Q?lBc2kft9wNMawEQu9YuZak44dR836/zh58YbrvILfSsUf5IvNuxfsoQ2l0K2?=
 =?us-ascii?Q?bd7Ui8H4KYH/9pCEggfuEfihGsceRCDf9e91yAn/Jxtj+XDzTAoaJcJrRJ1n?=
 =?us-ascii?Q?k6UhO2PjAXH4pMYrcEJbHLfgSuHcONJVXQNL7cy349x+mElNaviEowQI1Rlp?=
 =?us-ascii?Q?je1QI8/3SuShd6ezyFWEBRTGup6RSKN69764UkLSTZvBRh2so+B7ET/lyC1d?=
 =?us-ascii?Q?Z+D+S5LWUgquLSsifSVZeUOXMOD+mF/pXQzRlb+KTeYNfo5t2fIpTXlcPSf9?=
 =?us-ascii?Q?7DlXxA25jXE7oElgrExoZuxC0OSEF++dPA3Uv5vR6cz4+BR+0CVGVHrAGic/?=
 =?us-ascii?Q?2myDeYjAvJYy5wmfYExZggbyS1roXN8S0ecsnEi0+KrvM7PelSAPDcplg1kp?=
 =?us-ascii?Q?Mo/jWkzfam98ocLK6KcWFpSGnvcANGfYKjIUvZMmhAT5D/5/X/dBqSnV/rkW?=
 =?us-ascii?Q?xpheD/jgVVWkqYZFG1VmOEvsDUXx1TbisQhlngxKl3nBHnFnojGGRP67E+OS?=
 =?us-ascii?Q?I8bC6g4WqixJcsGQdL5e1TE+Ae9fiK9uDmdavLY9aKJv0G8vJaDPhRoPTdeP?=
 =?us-ascii?Q?a074dIt7iya2IVmcmZQNenAA?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4230
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	31b3eb66-00f1-4c59-b639-08d8d9a9748d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9+sYUyfWG+k+XBsZYbFQxbkcys+2N+JCCgji350WPI6Q2SqggK74MjCc1BoCfhfYm32hmeNypuOY7m0wWskkPWdN7drXpLdig9Ked/33BaJECndXYqZRBDSMvj/sem1d7BQsNkIueHjJEWYvV+7ZjKNW1RY3NAvRC+8Y/+6LJhX9gDKOs4mkAXFHtTy5ToEEviE/qma2t0+nBUfLNsNhEVKT0p3sAJ/ZPe8pfFBkGLVyCr4i5cHxUwJt5wY+Pg0WAFg5rDviSPu4epdMsWsd9YMVGZmzB0jwHbJI4thnS8o4ZDQmJ0bFjly/rEJgsJjtRQHLtcSxt63W2aBvsgjiQFVy87hJ/EsbP+jeeYf02j2NgH3urWUI9EslI1RdLVcMvDayOnXJm27Fo7gSkOI+t1yQDhvMC37gwlyJQtye3KMbVCD3iIBIR+jevJCFLtwyJAuf0K2ctTiNJ8u9bESZ6lIDwNW/qn0Dimok9dkOG1/rcUEbvRB6VOSaFqNK+cnwIqnt7V/GqYRpCRFEV/bHWR1cA9MdyeY74gQ1VbsGpYxD2F9u9wkx3veLGYW/ruXKiMpx7ow+boHXWPZvydh7yqo3ANrWNgavcVv/aqhXO9rLi+hU7PL9yk8ilStsendjllotG9dPK8tJliwhMcYUu1vQtB4HQyxNg6y+PH3PQ7g=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(53546011)(8936002)(2906002)(6666004)(356005)(36756003)(83380400001)(82740400003)(6916009)(8676002)(86362001)(6486002)(81166007)(44832011)(47076005)(26005)(4326008)(7696005)(16526019)(36860700001)(70206006)(478600001)(336012)(70586007)(186003)(956004)(82310400003)(2616005)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 16:21:59.4774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e52039a-73fb-460f-e6a4-08d8d9a97a36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6056
Content-Type: text/plain

From: Anders Dellien <anders.dellien@arm.com>

This commit ensures that we are using the device tree from the
Yocto build and not the one bundled within the FIP image.

Change-Id: I9592550f24867b04381e4eb962e3d942286bf480
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
index ccfa57e..c61912e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.01/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
@@ -1,4 +1,4 @@
-From 4e3e97f82c60bb60709d80bb4622b4239dbb830d Mon Sep 17 00:00:00 2001
+From eb241dfffcf641d7f37e853e1795557796671b19 Mon Sep 17 00:00:00 2001
 From: Anders Dellien <anders.dellien@arm.com>
 Date: Thu, 23 Jul 2020 17:32:55 +0100
 Subject: [PATCH] Add vexpress_aemv8a_aarch32 variant
@@ -25,15 +25,15 @@ Signed-off-by: Anders Dellien <anders.dellien@arm.com>
  arch/arm/Kconfig                          |  5 +++
  board/armltd/vexpress64/Kconfig           |  2 +-
  configs/vexpress_aemv8a_aarch32_defconfig | 40 +++++++++++++++++++++++
- include/configs/vexpress_aemv8a.h         | 28 +++++++++++-----
- 4 files changed, 65 insertions(+), 10 deletions(-)
+ include/configs/vexpress_aemv8a.h         | 24 +++++++++-----
+ 4 files changed, 62 insertions(+), 9 deletions(-)
  create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 54d65f8488..ab3898c470 100644
+index fbe90875ae..8468bfb45b 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1158,6 +1158,11 @@ config TARGET_VEXPRESS64_BASE_FVP
+@@ -1187,6 +1187,11 @@ config TARGET_VEXPRESS64_BASE_FVP
  	select PL01X_SERIAL
  	select SEMIHOSTING
  
@@ -102,19 +102,17 @@ index 0000000000..cf1e8d5cae
 +CONFIG_DM_SERIAL=y
 +CONFIG_PL01X_SERIAL=y
 diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpress_aemv8a.h
-index 09cdd3dab5..efb7d403ef 100644
+index e63c335f85..edded8c52b 100644
 --- a/include/configs/vexpress_aemv8a.h
 +++ b/include/configs/vexpress_aemv8a.h
-@@ -9,8 +9,17 @@
+@@ -9,8 +9,15 @@
  
  #define CONFIG_REMAKE_ELF
  
 +#ifdef CONFIG_ARM64
 +#define BOOT_TYPE                       "booti"
-+#define FDT_ADDR                        "0x83000000"
 +#else
 +#define BOOT_TYPE                       "bootz"
-+#define FDT_ADDR                        "0x82000000"
 +#endif
 +
  /* Link Definitions */
@@ -124,7 +122,7 @@ index 09cdd3dab5..efb7d403ef 100644
  /* ATF loads u-boot here for BASE_FVP model */
  #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f00000)
  #elif CONFIG_TARGET_VEXPRESS64_JUNO
-@@ -76,7 +85,8 @@
+@@ -76,7 +83,8 @@
  #define GICR_BASE			(0x2f100000)
  #else
  
@@ -134,7 +132,7 @@ index 09cdd3dab5..efb7d403ef 100644
  #define GICD_BASE			(0x2f000000)
  #define GICC_BASE			(0x2c000000)
  #elif CONFIG_TARGET_VEXPRESS64_JUNO
-@@ -159,16 +169,19 @@
+@@ -159,7 +167,8 @@
  				"booti ${kernel_addr_r} ${ramdisk_param} ${fdt_addr_r}"
  
  
@@ -144,11 +142,9 @@ index 09cdd3dab5..efb7d403ef 100644
  #define CONFIG_EXTRA_ENV_SETTINGS	\
  				"kernel_name=Image\0"		\
  				"kernel_addr=0x80080000\0"	\
- 				"initrd_name=ramdisk.img\0"	\
- 				"initrd_addr=0x88000000\0"	\
+@@ -168,7 +177,9 @@
  				"fdtfile=devtree.dtb\0"		\
--				"fdt_addr=0x83000000\0"		\
-+				"fdt_addr=" FDT_ADDR "\0"	\
+ 				"fdt_addr=0x83000000\0"		\
  				"boot_name=boot.img\0"		\
 -				"boot_addr=0x8007f800\0"
 +				"boot_addr=0x8007f800\0"	\
@@ -157,7 +153,7 @@ index 09cdd3dab5..efb7d403ef 100644
  
  #define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then " \
  				"  set bootargs; " \
-@@ -177,18 +190,15 @@
+@@ -177,18 +188,15 @@
  				"  bootm ${boot_addr} ${boot_addr} " \
  				"  ${fdt_addr}; " \
  				"else; " \
-- 
2.17.1

