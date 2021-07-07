Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.63])
 by mx.groups.io with SMTP id smtpd.web11.1006.1625680597885367609
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 10:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BIp8ZYwq;
 spf=pass (domain: arm.com, ip: 40.107.4.63, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6mbtBgjgOCglU/4TPdnzJgUAmEvIVD6odOrR5gXz4o=;
 b=BIp8ZYwqmf/OEOA0TIt8V9t+6KD3YAmOlKJMvPOlx95rswH/DMKB8UYK+Phg/xmjrBi+NsKqzuOymCuTQ0MJ7335MsViprEFR2Dd7PXbIrkJL8PYkniqValDDor2rvJabahsjcZxO13PleWNfJBvvYJC+RDvMHwsJvdG0V4r9A4=
Received: from DB6PR1001CA0045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::31)
 by AM4PR0802MB2147.eurprd08.prod.outlook.com (2603:10a6:200:61::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 17:56:35 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::a8) by DB6PR1001CA0045.outlook.office365.com
 (2603:10a6:4:55::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 17:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 17:56:35 +0000
Received: ("Tessian outbound 8b91ad1fd5d8:v98"); Wed, 07 Jul 2021 17:56:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9db869d150f3f5c7
X-CR-MTA-TID: 64aa7808
Received: from 0003ed4ccf82.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 39412610-40E9-47C5-B505-4189A83D4557.1;
	Wed, 07 Jul 2021 17:54:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0003ed4ccf82.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Jul 2021 17:54:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHKY0VvNkHdcL4RETTRqQ2b2SK6Rjy/D77GlUM/XqRVhfav4q5L9YJQ7O9jlu0eI4TTzskQ/F66Dl43AxkfNTNmeFvIHMzFp7Rmw++RYdlWigThJ/RL2ipaQ/TvWmudVt32cEPxCKDUn8qqgyjpWgsEUC31TO8OSBzJXM3mLVMnHdgrrlrJyjQgpveyqbB8o9vGA95AB7fDngljreD8okGFI3nOAflv2a9+0qJxT/pT+rXDjqYVwZh8dDT2+2kQszJ4ChZskq0Zl1YWQb8vq5Sjg81d1/XU7axhHl/p94myof9froBBUnUwheM6qle023apBebF2te75Uj7FVFn1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6mbtBgjgOCglU/4TPdnzJgUAmEvIVD6odOrR5gXz4o=;
 b=K24gSPaOesnn47EQfdzbU+oKi1xzVCNwknMwZK5D0yfpi9Mt33QuNTdsyvQiUKQ+aZzvdOvX92mXbp/sqY/Po6ygSiuzbyFEW+Dka/SF5RojLzQ6cWpilqrIqLaTDqSewxay3I2/xI1U3ThY24sRbdrc/2iwbEyNwXwmy/3bXqwSMnv6ZEVrDbe0i+nHu5gLEu40WftKwtGi+2aQoEeKkaK68GMx3Vvk154LtHhTRKaWn/6l5PRldQkFB3Wx04RaS4ifSigO4C1e1WpKZJUsFfegX+bflYuSDxHdfJtkM7grlTBpEY0BSnoTTPfIs/rwc6TfrwSdJ3JFnCRTLD4cJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6mbtBgjgOCglU/4TPdnzJgUAmEvIVD6odOrR5gXz4o=;
 b=BIp8ZYwqmf/OEOA0TIt8V9t+6KD3YAmOlKJMvPOlx95rswH/DMKB8UYK+Phg/xmjrBi+NsKqzuOymCuTQ0MJ7335MsViprEFR2Dd7PXbIrkJL8PYkniqValDDor2rvJabahsjcZxO13PleWNfJBvvYJC+RDvMHwsJvdG0V4r9A4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VE1PR08MB5744.eurprd08.prod.outlook.com (2603:10a6:800:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:54:03 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::84ca:bb80:c373:7ff7]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::84ca:bb80:c373:7ff7%8]) with mapi id 15.20.4264.032; Wed, 7 Jul 2021
 17:54:03 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/tc0: move to u-boot 2021.04
Date: Wed,  7 Jul 2021 18:53:40 +0100
Message-Id: <20210707175340.41867-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.49) by LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a7::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 17:54:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d397e6be-cf34-45d2-d0aa-08d941708f9a
X-MS-TrafficTypeDiagnostic: VE1PR08MB5744:|AM4PR0802MB2147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2147B6737B8689CF13F98F64891A9@AM4PR0802MB2147.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 00IBVx67WjV7m2LhMTC488mjspb9LsU3xgaj5Fpv4sy8HGAEiHWXTsATeBZcrGsSIPs0F8PxTb/nRn3AQE2tBMkBeCXCds3dl/svJwjBI4avYPiTDfxeqbMHmBhmetnaSaMEpwJOLdFV3vyLQdv3IOre98Ir+Lz9sX6KzYA1ozKdwfYlq0Ogn8uvmoghlNJJdmEypwqntf1F5XJ+eVBBEp+kelsNed5v33lZ6IeDVWaD7hBeOqWuPKlzzzAsZtCvW8qRwAyS90QMJ9Ca1HFq/0CIv5Hfdh3uWWPB4fx656Y60BVnTUS2mQtrEjtl/H71xp6AsnB1bxH4q6p81hEEB2HUDKSCI0tWj37T+icFKzoJHICNgKg0Z0jp8YmX4tE3YdKd/5Z8ztyZjGALqlhli60HrMjK9AQpncOmPNGLvq0GQmrNfprs3VcopLeAMb7Ie18DaSeKltyE1jNobN8TjUIp3UntMm2EnjCn98OgbgAoA+GbJKoYopkc8zzx2FLI+Nyml+UCZW9M000ejjyH4RSZeZ3B51BV6mP5sSoolgzKweDPmYFKb8fQ5CaWgwR7WVhHeQqELYkApJXwD8x648GaoBd5eqMoGxS2nguMj1deT38PPvCQdgjzc+2XACnDh6nLpl3S8ztQp3Sp+I5cjNCyQ83UkLhFUhTLspiwztfsmyp/QBVJh2uMjKa6+hslWsOpHFI6PIaT3wjrGT3WQbVWcfkPgLohtc9r8G+kMgpXISS/n9tpCdIdiuE6slQlZTx0zWrwoaO6GrTRlYCN8ShEJ/EKNeUpl5gL8Xoxkg0a8oKwIfmCXYizpR4AKhIa
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(86362001)(66476007)(66946007)(2616005)(38100700002)(2906002)(478600001)(36756003)(83380400001)(6666004)(66556008)(956004)(44832011)(26005)(7696005)(5660300002)(8936002)(6916009)(52116002)(4326008)(8676002)(186003)(6486002)(38350700002)(1076003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?OfnFzqWh4URvdflN8llXbw258KsuxMMLRSJRs/ZX+AZzzgN3tKmGD5H+qVln?=
 =?us-ascii?Q?d5Aiw8e5KGoU2ZqNR49jW9RgKpk3DFLGv6imyifctD1Frn+08dZjUNymREPH?=
 =?us-ascii?Q?7VQij2hGunNxPaJ7PtsUs4xRme6QpSL/Z+6wc6GA8Ttr3cqtyg0PH56JUS6w?=
 =?us-ascii?Q?lJcC2DqPhreFPx700oWpB44JznPdF0HsquEUyZdtRTXE+CSS8+626KDOpmiN?=
 =?us-ascii?Q?jJiNjD44umy7+Hpd/TrQRoVoKCU83wndhup9luctqyfBP8JTzUNeO8jAO0Fo?=
 =?us-ascii?Q?H7MHOSB+bECdGOFr2PxnI+zLjpqOAUNXzgzbMNTf4JJEuYrwUU+30jGGX89r?=
 =?us-ascii?Q?Ggdayk5g5n7Hupr+7xKtwQ+jq/y3WB/EqQbn0cIJg61wYX9oka04xNU4jxzs?=
 =?us-ascii?Q?3JrtCc3xGgX/f9dYKhUqmOx8MnE0K0JT0iix3XNfuKrpboNuV7JWxup1taEc?=
 =?us-ascii?Q?MEhTWrNYOYcFV4dP6HKRaZgITMlpJYO5VsECoaYmn0Jwnp14Xs26gV0ukbrE?=
 =?us-ascii?Q?p72Ee6V0t3fEg7nWb6FT2KEeaIKigL3t6ffjycMpbq+SClgpYtnu/Aj8QYS2?=
 =?us-ascii?Q?CC4L+6D1GluzX1UC1f5MEW82kLPaJ1BlWMQqNuIdj3zxA2y2q6RN3tX2qULH?=
 =?us-ascii?Q?bm45hb1qYSsRnRHm06w5NCd1JLA1YVEH4xbvKVXmQaojRv/RYfSL0/R2vU7Y?=
 =?us-ascii?Q?XpWDUsI1OlJAUMY9D0A/qhPsR6nHpqrfO6OFEWMupXQRPOU5kTSsR+OahrBI?=
 =?us-ascii?Q?8yLjVNVbFPaxSRikLcncyCjKBXNjEUi00Q+NLCKfCFKEmSP6J0upqo4sy1ek?=
 =?us-ascii?Q?kj59JOA/NT/hbB2e3KbFvZmRH2Yt8DG7Dh8LxpsHIWb7BQQqCxgk87MWrXgI?=
 =?us-ascii?Q?mRB6QrKfyxJmIeDdaSmNkfgVP6y+j1LC4QO4azUy5axQpfOOcP8HeUB+xDG/?=
 =?us-ascii?Q?8BxO+ZwlHy+Y3vHxjYdXgF0MNovtuDgzqFeMXTKaSkXDew8Qh5xtbPZTHiwm?=
 =?us-ascii?Q?QC023II4aIicA1E/U9S/92z28IcOlnXOZlDy6wHTjw3gKaYjSirorY7YsEp4?=
 =?us-ascii?Q?WcPb6rr6fjmLGdV4yWrhPTtXOM//PybIitnQixR4oQY4YgngOWTeYhgYXaAX?=
 =?us-ascii?Q?juPs0zhJNzrXd6g9n5RdCFeRZ1J24ZvikIRgIPh2t/WktWMYTOPtxRQwhFCy?=
 =?us-ascii?Q?8+axrz6KjuGT92CNV+7ViXblXk2AtXdGpC21KsP40SFlzo9UtYR2vengOHCq?=
 =?us-ascii?Q?pxb15bSvW176k8FHHRHBIbDrYoEmM9w0zrsYtpu2CPnb9l1FSsazo7nvv1FH?=
 =?us-ascii?Q?Gke0rZ9QNIQMCYnKOc2AS6yC?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5744
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	59d912e0-186d-42c5-36e4-08d941703535
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LwtMVMkE94NGhYarj/NrDuDhOI8uCPOGKFgtC77yiqH56tdLDiFK/TvCKp3+bhQDDWk2oxa8PJjKXjAQvb9ok5HX59Dj3il+jsPa/JzooOa4SefWW1AbZ68Gd/Yf7ZRP5oCaMo/h0nWHvscdyzMfCP7O3TlO+fmt6hy2VMIPEhyjhDiVeqGNxuGNrk+EWlf0vc5TqNnch0T57QflV3QYj3QOuQX1pRK3J7+MSJVc9k2CsdoX2BcQT0E7kqBzHqABbpS/VMBrWQ1dXzAp0V76uam93MK/7T12SuFaIjWOclg0OQHD4367X2ICs6L6QUUKUb8o9KhuQwIgqNYblkENBfKq8BfHkM6RhjuAmaSsCyVbdMEoOJAdh/Tyb/tQmLNbX5giki8DH2TORG9gdyjAJFgL+ecahApm3cQtNyC64RQ1BANIrFRL9T6bNrIWJYGTLufy1Zno/tg26I9An+SY1i+ZxFvbN8yuIIGs536P66I3OCtPe+Tjn89frQdECJ3BcR1RcpKoBDu9JxmHAYFTkZiembJrwvTvOTMLZ+a8Q2cYeK7nM72UUuFz0efKmct6ljC20LVbMD0uert19Yl2KUX3tf0wvF91e7sPzW2HQ6ugBkeXeGA72nAwvFyotJi9sr4hF1ypD3k7J+yInRWw/Goway8ZNyqUUht6apRddkkvPhvVxFMfF/fHC50c6S6odalx/8K+VWYLGEtv1AaR2pWaFexwGvIWGZuc5THkV7qayby1OxifEiQCoTzb7PmG4mTTZlS5UmhrXJag7cpk0R2BtEHJNMktSwsNQRbiL1/IZR/W0N1k/baxYrIJK2rO
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(81166007)(44832011)(316002)(356005)(336012)(478600001)(4326008)(1076003)(36756003)(47076005)(2616005)(86362001)(7696005)(2906002)(83380400001)(70586007)(82310400003)(956004)(6666004)(82740400003)(36860700001)(6916009)(70206006)(8676002)(6486002)(26005)(8936002)(186003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:56:35.0996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d397e6be-cf34-45d2-d0aa-08d941708f9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2147
Content-Type: text/plain

Also add necessary patches.

Change-Id: I7ef31832e3bd0521c03a3945e8b70596d2ef0f73
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 meta-arm-bsp/conf/machine/tc0.conf            |  2 +-
 ...ove-bootargs-from-Total-Compute-conf.patch | 33 +++++++++++++++++++
 ...0002-cmd-part-Correct-error-handling.patch | 32 ++++++++++++++++++
 .../u-boot/u-boot_2021.04.bbappend            | 12 +++++++
 4 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0002-cmd-part-Correct-error-handling.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.04.bbappend

diff --git a/meta-arm-bsp/conf/machine/tc0.conf b/meta-arm-bsp/conf/machine/tc0.conf
index 6bcb6c8..f9b0fee 100644
--- a/meta-arm-bsp/conf/machine/tc0.conf
+++ b/meta-arm-bsp/conf/machine/tc0.conf
@@ -10,7 +10,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 # Das U-boot
 UBOOT_MACHINE ?= "total_compute_defconfig"
-PREFERRED_VERSION_u-boot ?= "2020.10"
+PREFERRED_VERSION_u-boot ?= "2021.04"
 UBOOT_RD_LOADADDRESS = "0x88000000"
 UBOOT_RD_ENTRYPOINT = "0x88000000"
 UBOOT_LOADADDRESS = "0x80080000"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
new file mode 100644
index 0000000..87d8469
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch
@@ -0,0 +1,33 @@
+From 893c4a4089f796d1282b3ebde3d327db00e07157 Mon Sep 17 00:00:00 2001
+From: Anders Dellien <anders.dellien@arm.com>
+Date: Tue, 8 Jun 2021 09:35:56 +0100
+Subject: [PATCH 1/2] board: armltd: Remove bootargs from Total Compute
+ configuration
+
+This information will be maintained in the device tree instead.
+
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+Change-Id: I279399d4a0ea1a3330de5b58e8c9af78e48ba04c
+
+Upstream-Status: Pending [https://lists.denx.de/pipermail/u-boot/2021-June/452156.html]
+---
+ configs/total_compute_defconfig | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configs/total_compute_defconfig b/configs/total_compute_defconfig
+index e36d701ff4..954023fae5 100644
+--- a/configs/total_compute_defconfig
++++ b/configs/total_compute_defconfig
+@@ -11,8 +11,7 @@ CONFIG_FIT=y
+ CONFIG_FIT_SIGNATURE=y
+ CONFIG_LEGACY_IMAGE_FORMAT=y
+ CONFIG_BOOTDELAY=5
+-CONFIG_USE_BOOTARGS=y
+-CONFIG_BOOTARGS="console=ttyAMA0 debug user_debug=31 earlycon=pl011,0x7ff80000 loglevel=9 androidboot.hardware=total_compute video=640x480-32@60 androidboot.boot_devices=1c050000.mmci ip=dhcp androidboot.selinux=permissive"
++# CONFIG_USE_BOOTARGS is not set
+ # CONFIG_USE_BOOTCOMMAND is not set
+ # CONFIG_DISPLAY_CPUINFO is not set
+ # CONFIG_DISPLAY_BOARDINFO is not set
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0002-cmd-part-Correct-error-handling.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0002-cmd-part-Correct-error-handling.patch
new file mode 100644
index 0000000..dfb0f4f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2021.04/tc0/0002-cmd-part-Correct-error-handling.patch
@@ -0,0 +1,32 @@
+From 2fb7e756c005fe60b440943cfe0cbd39a82c79ac Mon Sep 17 00:00:00 2001
+From: Anders Dellien <anders.dellien@arm.com>
+Date: Tue, 15 Jun 2021 15:38:55 +0100
+Subject: [PATCH 2/2] cmd: part: Correct error handling
+
+As 'part_get_info_by_name' now returns more status codes than just
+-1 to indicate failure, we need to update the return value check.
+
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+Change-Id: Id972be70e9ed12fecaf97793b12d23ccc57007e7
+
+Upstream-Status: Pending [https://lists.denx.de/pipermail/u-boot/2021-June/452573.html]
+---
+ cmd/part.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmd/part.c b/cmd/part.c
+index 3395c17b89..e0463b5a54 100644
+--- a/cmd/part.c
++++ b/cmd/part.c
+@@ -140,7 +140,7 @@ static int do_part_info(int argc, char *const argv[], enum cmd_part_info param)
+ 			return 1;
+ 	} else {
+ 		part = part_get_info_by_name(desc, argv[2], &info);
+-		if (part == -1)
++		if (part < 0)
+ 			return 1;
+ 	}
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.04.bbappend b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.04.bbappend
new file mode 100644
index 0000000..ae83e5b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2021.04.bbappend
@@ -0,0 +1,12 @@
+# Machine specific u-boot
+
+THIS_DIR := "${THISDIR}"
+FILESEXTRAPATHS_prepend = "${THIS_DIR}/${BP}:"
+
+#
+# TC0 MACHINE
+#
+SRC_URI_append_tc0 = " \
+    file://0001-board-armltd-Remove-bootargs-from-Total-Compute-conf.patch \
+    file://0002-cmd-part-Correct-error-handling.patch \
+    "
-- 
2.17.1

