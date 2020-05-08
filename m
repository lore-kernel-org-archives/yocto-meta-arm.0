Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.72])
 by mx.groups.io with SMTP id smtpd.web11.383.1588955675730691466
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 09:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QP1xrtYm;
 spf=pass (domain: arm.com, ip: 40.107.13.72, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fJdvQrAtzwQRdQ8BpZ5xrr6skQe+SNa/h18A+P75SI=;
 b=QP1xrtYmoZlnw+kLyknPmHT7usrZ1M/V4Qsf6WmDXofLcnngTCCtRXYsMXp5MQuSHixx6sZPK0iNNnf22Fs9jqGTjsTbXqfPs6OHbNqLNt13hpkP+hg0Z1pAoC0eIdfrQCFiD5f7qw8siVwlqV92deCCVJGFS7imxqxriD7oLrY=
Received: from AM6PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:20b:2e::25)
 by AM6PR08MB3351.eurprd08.prod.outlook.com (2603:10a6:209:48::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Fri, 8 May
 2020 16:34:33 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::e8) by AM6PR05CA0012.outlook.office365.com
 (2603:10a6:20b:2e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Fri, 8 May 2020 16:34:33 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 16:34:32 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Fri, 08 May 2020 16:34:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6252800d60d33735
X-CR-MTA-TID: 64aa7808
Received: from 21fbc336ee7d.4
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7C1181E8-5DE3-41F4-88A7-7D87C510CCAC.1;
	Fri, 08 May 2020 16:34:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21fbc336ee7d.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 16:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/SF32pQ+TyUMrsZXdFgRvEOhCYg9kaYYFUpHqO/9EAP4WK4vn0zL2MB7CfCDWYkoukEp+JD//fOFV4GjRtsiTweMnC707qkzpGEBMV7ZGFSvfqiwumv+YQGrKSwQJJQVjEmfEdBtMpG83ywSAqXRTsWafJqCk1sToGEMky172o8Poepuh8sG24hs6eu8/M8CiM3Q1XtHOiCt1vD9Zn/ZANF+6zrZh/nl2pF94NwTU7Fy9XXpzPv6cSuru9+1eSzFujrUomau4AvuaKPR8Oauc9gpwMcRbnHAi1ckVWzxwW/WYtjn9nxP7cEwH5IY6SCCXATOq/1Jvcg6ZE1JfrbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fJdvQrAtzwQRdQ8BpZ5xrr6skQe+SNa/h18A+P75SI=;
 b=FkCFwQtBWN7cgbsdM2fKYPD3yhy3mjopdSYlrhJBnKg28Dm7wIsvNJl5HFrwevo6SHsRvd7boAVHtVia/okFQKRYNkoGLPUPeOK6S6FVqbo9SYwAP64afSPRXeWYfoKjLXGx90Y9QDsNq5CqG8NE9RouQN0jTp9i8eoqPb+XlnicpQVgNrJ+LwMHvMBU4CzSsqEIBoYS29R8Y/TR1ebPhlh76ldXD+DnvcMck+TVjYBXqzEr3b2Jb3VnCS1rROBsCp6aNSNyob2upOG/kVH/LtPnKlyqaZre/fA+SsneRFVWirvsAaz0G/UmKIpTYFi/qZCiN6MDJOhaLgJYIloYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fJdvQrAtzwQRdQ8BpZ5xrr6skQe+SNa/h18A+P75SI=;
 b=QP1xrtYmoZlnw+kLyknPmHT7usrZ1M/V4Qsf6WmDXofLcnngTCCtRXYsMXp5MQuSHixx6sZPK0iNNnf22Fs9jqGTjsTbXqfPs6OHbNqLNt13hpkP+hg0Z1pAoC0eIdfrQCFiD5f7qw8siVwlqV92deCCVJGFS7imxqxriD7oLrY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3484.eurprd08.prod.outlook.com (2603:10a6:10:45::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30; Fri, 8 May
 2020 16:34:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 16:34:24 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/4] arm-bsp: n1sdp: Add Linux kernel device-tree support
Date: Fri,  8 May 2020 17:34:03 +0100
Message-Id: <20200508163403.5987-5-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508163403.5987-1-bertrand.marquis@arm.com>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.30 via Frontend Transport; Fri, 8 May 2020 16:34:24 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c25efa56-56c5-4b8e-49b0-08d7f36db007
X-MS-TrafficTypeDiagnostic: DB7PR08MB3484:|AM6PR08MB3351:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB33513245EFCF27F15C7A12B19DA20@AM6PR08MB3351.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:311;OLM:311;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 er2KZww1EDPLqqa9fOnF10V+ToKvgah94L1APQNLNjxDkm9C3anbGJerWxDB/am+O3N49T4tcD8cOkA0Y1/WdpQln2zJC0gGv5Sm1vINnJfXp/AfJSRcPINOobOn3s4f0fg8IAd6JYV0cHT0YPbP3EMqmrr74aakX+KRgOvruNAyOS+mJrh99/hp55RAahhPbp+K2aX9O184WXTmzQsEs1W/arVaT+VCRuRdLPuWFGOk77rbYIBq2eysQJVuyvHyHR4SnuRJGhKzzE2f7vcwRj0JC/okozstB2t+jo56BIzSIa1eMD+HeYVTTl7qyl+NwIJi+hI9ZhVuogCwDxIteG0Lt2qmfZorYELxQ7AQC6ASPZmVSrYjVVwcWTQzpS6WHZxyzRyy+aw0kUlbcn/RcTGcURkZvXCEarc3kM2DKrceZfJGAzhqA2pkJ/NF4WQRMVhP77G7UuBTfbFdRgI29p8MMPk5L0I20HkkM6tnV26dMUxlT5+rNFkJFjJMktv3ewavxnATSAL09dPp00H8vWfUNAWWkh76yEr9zst7giwIafgP0YH+dqbOiGvkuyWH
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(33430700001)(7696005)(52116002)(5660300002)(2616005)(6916009)(26005)(4326008)(66946007)(16526019)(44832011)(316002)(1076003)(36756003)(6486002)(186003)(956004)(83320400001)(8936002)(83280400001)(478600001)(83310400001)(8676002)(2906002)(6666004)(66476007)(33440700001)(86362001)(66556008)(83290400001)(83300400001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Ed5MsNA3AH/pV89in6bNNZmnFlmWgen8YDVz1t0u0cN+BNNGrbY6q9jME+8texbmerAsYIofogHfNtLWSitkElwon4q2j9PeQOzwSOVhhlpufOVNkuuCcFsOLYRlYOUJYfSqmOTRqHAeWcGZaQY625+k4Gy6xSQ35ENsV8yvXsgHat8F7CvQe89pnKt6WbcYHNmPqEYPe0WPFtCd7WGrbWkpf5VJqc87uQa14FtklRPpwFYa+foLiQoSh1ubwEOFc5pqz11XYdFREwtKqvO14OXGDRGmNxazoFMbyhXe2IP/golWCS7zx4T/WafvcNaPrqBCWI0Z56B4XHW7IrQuAPW0ftE6+9eD5n6/kS4Ezt96TlcyId6nZdrOLVCdWdA0aOmzvf6B4QrSixo25MSjt9ZxAsutseBnQ358pu8eN8JhNaG9gEkROPV4ljlyZ5sXxwtAkvQFSsqe98GjgddOgCS0iQvq+V+lqkn4N4B0x5U=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3484
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966005)(33430700001)(186003)(2906002)(6666004)(336012)(33440700001)(36756003)(6916009)(8676002)(86362001)(5660300002)(6486002)(8936002)(478600001)(7696005)(70206006)(1076003)(26005)(16526019)(44832011)(316002)(356005)(36906005)(82310400002)(82740400003)(47076004)(956004)(4326008)(2616005)(70586007)(81166007)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e618c82d-a195-4995-7080-08d7f36dab30
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F/l5qAYNsv0I11ID+FRFNDOm8k1EQazCBYkDpjFiZZcayrqqdhBL/32YO0svKHYMfr+t+5jMZQKE33mWb+sD4ZAPAvG7Fn1QSOX/pBqxcbsjdN+oKudxHNcUKAhQ2rShYVDDLiNpS9rnhjRMmtDAawSRU+5ur6XxFwohJet0fPIlwJouw61t1gC3DDICeJGc6UZYhB8+PdDGfNfctcc1bra/2PaQMfvXeSmEvYNCN/cQazZV9sAlPslraQmv21MV/ajNdD7BcEClq+/oYtOavOme29Xq0eS535rbcyeP4/jZhAwQ5O2uIfUrPrhQBYyC4XGyQNdaRjG5yyeRIr1p+CrVqNjfZ8HMZ/WMwTC9txniMIBpYLhtcua1MMDFThfqc4hPLtIdHakoAS3Krt95cktMhxY0Ecxc99e38sfZvWvsCJZpoFVPTUVQ9mxiL901vLa1qVMe76XHBOg8KFA2ivt7xHtD8cl271R7QICctC+ofKG1Ce31IQMrU9GuJnoShN/kGntsGCHID/qvmaqshzsXYGD8CPyp8GmjS3jmYEnXPAR2mFPTN5wSOJfmRywz+d4mBM3piBE6dsABagSeGYFawIuct2IZ1D+2HBHoKKo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 16:34:32.5397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c25efa56-56c5-4b8e-49b0-08d7f36db007
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3351
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

Update both machine configuration and kernel recipe to
support Linux Kernel device-tree compilation.

Change-Id: I01fa654bd88e0d2b7a4bfcc7cb60222c120a0473
Issue-Id: SCM-888
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf                            | 1 +
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index fbe135c..b19fb86 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -9,6 +9,7 @@ TUNE_FEATURES = "aarch64"
 require conf/machine/include/arm/arch-armv8a.inc
 
 KERNEL_IMAGETYPE = "Image"
+KERNEL_DEVICETREE = "n1sdp/n1sdp.dtb"
 
 IMAGE_FSTYPES += "tar.bz2 ext4"
 
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index e2ba6ae..9634d43 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -6,6 +6,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 # Apply N1SDP specific patches
 SRC_URI_append_n1sdp = " \
+    git://git.linaro.org/landing-teams/working/arm/device-tree.git;name=dts;nobranch=1;destsuffix=git/arch/arm64/boot/dts \
     file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
@@ -14,6 +15,7 @@ SRC_URI_append_n1sdp = " \
 
 # Referring to commit TAG N1SDP-2020.03.26
 SRCREV_n1sdp  = "137cccb0843e63b031acf67d1ca4f6447b8c417c"
+SRCREV_dts_n1sdp = "3209a868152f348194cc1f20fd87c759d3a97d45"
 
 # Use intree defconfig
 KBUILD_DEFCONFIG_n1sdp = "defconfig"
-- 
2.17.1

