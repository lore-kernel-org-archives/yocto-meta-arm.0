Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web11.49246.1624291254916820842
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Jun 2021 09:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9Ifn8tlp;
 spf=pass (domain: arm.com, ip: 40.107.13.85, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=civ2kjITBLubXVvLtcmrY5Ayu71EFTpj9CT5d1ZYQLs=;
 b=9Ifn8tlpEZpohy3qaQDmen9l3vuAYIRHCdI7CaT9pCKHwvsjqmWIN7J5R/QqiKqAuk1NvHwfu9hh4nGnktQycuo2bgEawUhPtGoQWy69UKwIiKYHJlcvZY7V3oD6FAM0unz8YIR6nNTPbHxXXUZXWglLN9ql1id4TR4S781Zb5o=
Received: from AM6P193CA0086.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::27)
 by DB9PR08MB6507.eurprd08.prod.outlook.com (2603:10a6:10:25a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 16:00:52 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::e3) by AM6P193CA0086.outlook.office365.com
 (2603:10a6:209:88::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Mon, 21 Jun 2021 16:00:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 16:00:51 +0000
Received: ("Tessian outbound d6f95fd272ef:v96"); Mon, 21 Jun 2021 16:00:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53be39c5a55ef20f
X-CR-MTA-TID: 64aa7808
Received: from 139560a75c5f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 40C1F48A-2C73-4332-95B3-4B9F84DBB943.1;
	Mon, 21 Jun 2021 16:00:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 139560a75c5f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Jun 2021 16:00:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2TRvmVEklqECkq8OiL/yUseXUvhJYrMkgiMKJX7IoKWeuMVPUJEpbX3OvjPEBdsWi0PelclSuodrzt/1X892XAM94457ZoJu1vA6ACWuLFgW9vfBDjq8iSLHPQn4hC8hy1wFu1Eux5F2h07NpeIDgSfb3kX1wqkHtNMiHNrG6st4149VQlDYs2wgGojtWcNJBsZC7WhWpNYSsQ7HXntlNV8OMcGpS4n4NiRiYA9BuvySJIBINEqwbJWl27YTRYhDn2kL0ZnllvDreRYFoYgvTIi3Y59ahUDJkCIFsuyVIMtKYj0BIHEDEohu5Ohc01PykMJdHSyaKBXFazozo+eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=civ2kjITBLubXVvLtcmrY5Ayu71EFTpj9CT5d1ZYQLs=;
 b=YLSgufl9/Z+vTBDcfjRqda4sENmHYRtLsMJ1oS12fu/D30VpmGt3NGNdqaXDraaK9MXdw06YyHvL+GHRjX6KgMHSos+5nZXeV33SFY9k2A+jEXsHTJekqtP9L7ysfZDQwrWo/g40BDxPFa0DOyrzYgTnloWFittMqfYacxYJ0v1EcABQC2b2nGlOM5gy8zlLO3kgRGyxUkLf8VqALeoYVxIr2gbha7r1fRHxDo2KpD8/aaGZbMDv8xBMeF0pStlf6ANPxgTVHRQScMRD3hn8aBw1NWV3dwSMCAesgbJnHPG3jzgFBpj6j5WxcqDF+WYmdX/NT0DXp9dZwO5iVgd/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=civ2kjITBLubXVvLtcmrY5Ayu71EFTpj9CT5d1ZYQLs=;
 b=9Ifn8tlpEZpohy3qaQDmen9l3vuAYIRHCdI7CaT9pCKHwvsjqmWIN7J5R/QqiKqAuk1NvHwfu9hh4nGnktQycuo2bgEawUhPtGoQWy69UKwIiKYHJlcvZY7V3oD6FAM0unz8YIR6nNTPbHxXXUZXWglLN9ql1id4TR4S781Zb5o=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBAPR08MB5815.eurprd08.prod.outlook.com (2603:10a6:10:1ab::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 16:00:12 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::318b:e684:6888:bb60%3]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 16:00:12 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-bsp/fvp-base*: Introduce WIC support for fvp-base* machines
Date: Mon, 21 Jun 2021 17:59:33 +0200
Message-Id: <20210621155934.11382-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::21) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 16:00:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd372168-8764-400e-82e7-08d934cdbe7a
X-MS-TrafficTypeDiagnostic: DBAPR08MB5815:|DB9PR08MB6507:
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB6507284A2D394C8703E90B86FD0A9@DB9PR08MB6507.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7U+B9TUMPGquEVxcyKLn7ajFkWnUeRsZkGW0w5ejCfr5REl3PRZHXx32j408E7Wzs9tGO4QowGjJ3l7BcjtZgIW6LWehD9Yq7M4u20OchSuLV8GaOuHpw3+DHoJUCxwWddhIQ6eB27u0KY1hzwMCox1wliP4AW359baPBNeABgneXtLGQA2zoRsO5AI3RZYCpMeM/3asACVflgzUbKmf3wUW3WLsqukVkUyoSifMHb/S0f9i2G5EmqKAkZE2DojwJpAR9JqNSYWtLc6LhlheNma5d+fnAxjgts/zKFgCK7zWs9C83WJJjxNjsnIX/XxotXzTusCSifOumRh4LGPiCQCoygwEtfOfhDdhNgt9WmS+WYYMBhrQfAs4s9Ygy0DmDVIi2M0spYuvPure6+VAjqLGXyOwvMZggZiSMnsa0AlSRIWILSPDnpJAzRXh3MKhTrXgv1gCcXx26XqyZl8bz2GiVGagCAGzcDcZ4aSLwOn43j1UVNNf9dOc62JIok8F4hqrTCy8w1eNjxH+alUCIla4B/hjp6xN5oWhmpJ4s4865ngzTSeAKMMpWQZBiIHe45e+5o8RZAJvRjA4MmNdje0iFpzKKQTOy7n3K0IncKhEtzI2Mf2okGw/UTzqO+u+IxL3goMhG7I8OQRF9GRsgg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39840400004)(366004)(396003)(376002)(8936002)(86362001)(66476007)(66556008)(2906002)(4326008)(316002)(8676002)(478600001)(83380400001)(66946007)(38350700002)(38100700002)(52116002)(7696005)(6666004)(6916009)(16526019)(956004)(186003)(1076003)(2616005)(36756003)(44832011)(26005)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?1V8JGw1vfXjaUHEho1EcO5YglO7LpihD2YS/psUgvcInzOUE1KeZxnkyMX4F?=
 =?us-ascii?Q?DUeICNWptVFEHH6k7Hm9jF67CgYzm61QhVkr/QedGNt8gaE7poZUqXRQDQh+?=
 =?us-ascii?Q?CvaLsVlJ/CysXRp8CkIhpDHX1aBkaaJKthTt2vdv50L6QF2X1kLdK0Z/7ZqO?=
 =?us-ascii?Q?ElwTaxOzQRTrMfbnyz4C10L4J5AmIa4sekhm8u06Ha9QiVSpFzx6Tc960vQM?=
 =?us-ascii?Q?km71tNnNyit9MmPeaTgjwLmtAYisq7xG5w1VbPkPs1R91a/LrCmBlRtOS4PF?=
 =?us-ascii?Q?+nPoA6MF1HeYH+Nxwk5wNZqo8FgTnr4DSD+tci8B639Wi+VpLVXbm4wJqkbc?=
 =?us-ascii?Q?VoQtazNRNyEL5Mlo/ITMQJHMWeFNK0M/iF4v7FyUV7NeoBBONMHSkXIlu0F7?=
 =?us-ascii?Q?6CsGiM0kGReKu+HUJkWaLzxU/8rSOOzSiSmG5eBQJh97eyILNSmfVsQymhNY?=
 =?us-ascii?Q?Tb9k/wxD4PnD685MkxFR3j2AM0oI3I3+08eU0HG7OmNSMCbMy93ZF77Znsxm?=
 =?us-ascii?Q?y7ffrVBsosu2+1oALvVUMMACxCNJ9ibWF/ioO9VTM0bMVGN1FS2g2VMbHJJ2?=
 =?us-ascii?Q?EYBa0zu171ob23Z+ybDuVouo9WSzZVfmWyqIDx3UDVi6s3C3E9tt4u5x1dzq?=
 =?us-ascii?Q?lkuiVzw0Cg/qnuAR+n6yIbjza6RaLwmHKZcOezh3IV6ec2wlqyDkHb3sy2qL?=
 =?us-ascii?Q?gKWbZpm8ayNVMjDwL3T6vuuTZ7qsHSx5QB7cVVnuLfEJwHH7IKIZZTTStZiV?=
 =?us-ascii?Q?P+F0FHRnNzlV6icLION/svk/zmu0M6zGCP6Si/Hhme3hre6k2Lm4GDBaqpN9?=
 =?us-ascii?Q?vyTVWfeCHq/dbQ+jrDUPEMQplXoO2XlvRprlFkDw5iLIGygHNv8RM6jrfIS/?=
 =?us-ascii?Q?yjyBRWcYEItW7a5zU9fCik7YttVd9EM3y7/eZLjVO4YBJec4ap8fADL1NLSf?=
 =?us-ascii?Q?LdWMuW3xhkYwiuGoZZ7Edteybhm72w0BnKUvxeRnt4Sy43cwBLTs4yEbrFtJ?=
 =?us-ascii?Q?fBR2sH45Z07ZkXHsunubHnVvWmANMpXbyuodDusNHfn6LoHN/KT5WKT9XEID?=
 =?us-ascii?Q?yqAtBAAlbbWbNT7RlgQupQt8y/XbTh3s1en49fQRMfaIX0HY949kaw7E2/HN?=
 =?us-ascii?Q?j1Cy7mKR5ryfk+NjSoxz3VD3S9dQkXIE51L94CyJud9qnFDHJqWpVE+tsVXN?=
 =?us-ascii?Q?8lAUnoGFcNsfCFQBD4CYysvanNfhCyXrblKb9igtGQegHMljCLe42v7D+dYJ?=
 =?us-ascii?Q?Qq6hJdC+v7C61flD6vstG+IyLvhIqeumkS4I9URFON5+NfJlCajvuDw8R5PN?=
 =?us-ascii?Q?A0+be+usOvbe3j+SnYcoPM4u?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5815
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ddb3bd75-ef9d-46ac-6526-08d934cda700
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5s/vDF43gF8gdGGDKblX2evSNCu7GU7b594gsAMZMQ+4f9Ll/1i7/GvYTJunt6NHI/m5NOfSsXGe1OjmU8Rxfu4pEtbSFpSHYBsQFBN/Xd9eqsjxRanUz4oa1mcqnl5rsNyXtBKVtasaNQmFdfyr5Zp0/PjgcnylybTF6gReaIDMbOyD1dpZKI4aFqD1waE2nc76T39kcfrO4/Gp+37vgttJW1yDfD1ZvTvvPpdrc/RF8GOsk83/C0amxGMmv86nHOTczLb+W4MI55ozQBccf1f2pUDpAagMU/T2gkOVj/jlB09ZwrLLLrXWZ3LVsFJZnYFR/Q2wwFRUCIJCMxTmS2nRnj8O3mJT6GJDL8dxoaOborf4p94Zkr2uVnD3B4VC2G5BENGXrk/YrfpHSgVFkVezvkqk6DVlLTtyKM8YPH+eX9Lr1Yps14lSdlF+FQaHzdnB5V9lvrnq4nlE7ifds9fVCBAKhRX7/ZSENgrfVJbFF79lXBy4ZUHpr9u+ZbCch98fCWhcqSAoCWo1Bj3mK6GsNkk4gplBWZXhvi11Cw8ovKU8zVYgmiWfTb+oEbVradGGdxb66qlCUXfwVDslxazKVTYt2gpyjE1sEkar9NAUXzDqPhgzvv+BmjPf2CDw/G0eVYUmC/MbB/Od0bT2CA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(346002)(376002)(136003)(396003)(46966006)(36840700001)(6666004)(82310400003)(47076005)(956004)(336012)(86362001)(36756003)(83380400001)(81166007)(356005)(6916009)(316002)(2616005)(70586007)(70206006)(6486002)(8676002)(44832011)(478600001)(186003)(26005)(1076003)(7696005)(8936002)(16526019)(5660300002)(2906002)(36860700001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 16:00:51.7506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd372168-8764-400e-82e7-08d934cdbe7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6507
Content-Type: text/plain

Add wks script that contains two partitions.
Rootfs is populated to second partition, because the first one is empty,
to keep compatibility with image_types_disk_img.bbclass
and use the same root device set in u-boot bootargs parameter.

Both wic and disk.img files are built by default.

Issue-Id: SCM-2698
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: Ib5b5c3a7aa6e8fe9fa90a2955ae1e461caa01356
---
 meta-arm-bsp/conf/machine/fvp-common.inc | 4 +++-
 meta-arm-bsp/wic/fvp-base.wks            | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/wic/fvp-base.wks

diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index c4a5f6b..ddf6b1c 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -8,7 +8,9 @@
 MACHINE_FEATURES = "optee"
 
 IMAGE_CLASSES += "image_types_disk_img"
-IMAGE_FSTYPES += "disk.img"
+IMAGE_FSTYPES += "disk.img wic"
+
+WKS_FILE ?= "fvp-base.wks"
 
 # Disk image configuration
 # We don't use the first partition
diff --git a/meta-arm-bsp/wic/fvp-base.wks b/meta-arm-bsp/wic/fvp-base.wks
new file mode 100644
index 0000000..ef08c81
--- /dev/null
+++ b/meta-arm-bsp/wic/fvp-base.wks
@@ -0,0 +1,6 @@
+# For fvp-base* machines we just need to populate the rootfs partition
+# but to keep backwards compatibility with disk.img,
+# we need to create first partition empty
+
+part --label empty --source empty --ondisk sda --size="1M" --system-id 8e --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --label root --size="2048"
-- 
2.17.1

