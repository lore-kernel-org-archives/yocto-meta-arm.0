Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.86])
 by mx.groups.io with SMTP id smtpd.web08.5765.1613032048970380433
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 00:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jkrIl2wh;
 spf=pass (domain: arm.com, ip: 40.107.20.86, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/6SqassdIDh7H5NEDNBrEaPA0tepCbLkPBeTmrekXg=;
 b=jkrIl2whVap8u0xKtc5LjKA4TCMxvzxgZM99EZY9OcD1Oq6SEo9ytxXt5g+IXXTpTxt+gcBpFJIhui7xg/lMZayeRN4XlNpqj6D5Vp9OpPawjjBQQZaLvytqmZAJk3jmQTlNrJdfD/9TSSigukhvZFoKuPgaLWVt8+etGNou3jQ=
Received: from MRXP264CA0035.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::23)
 by AM4PR08MB2673.eurprd08.prod.outlook.com (2603:10a6:205:b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Thu, 11 Feb
 2021 08:27:24 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::73) by MRXP264CA0035.outlook.office365.com
 (2603:10a6:500:14::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27 via Frontend
 Transport; Thu, 11 Feb 2021 08:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:27:23 +0000
Received: ("Tessian outbound f362b81824dc:v71"); Thu, 11 Feb 2021 08:27:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4cd295c3d6ddc934
X-CR-MTA-TID: 64aa7808
Received: from 6c99ccb6fcf0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id ADD520A4-A792-4F1E-B8FE-66C170DFBB71.1;
	Thu, 11 Feb 2021 08:27:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6c99ccb6fcf0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Feb 2021 08:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvB1jSYlYKGqgs/hncmdcARa8F1q8qkoLl/g4FwNVRWySoejGjaAw0A1hJhT7aY9IC0QoURiELZYFsA+tFjYM0/fMSD6QGnBpZOD1O0N/ZGYgl0khFP4jKNydGp5VwsHiD9kJ5oLVaCgSIg7UOlRBP+ugZK6NBltKgK64QiJOavwKvW4/2Ddkg+1kC9FvSTZRHu0Ws5fv19EBfCGb35XYvk1bZ+GUUMz30faytUkjCnwF9h11sTVPhtLq6d5p7iL3u2XsItIkyVBMUOyzyiw5E8lejFQoLXRFp2JGNiDZojPgHpZjs+dwpHpe5wh1qxCDjURMfGOZ1RvB++Cw8F4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/6SqassdIDh7H5NEDNBrEaPA0tepCbLkPBeTmrekXg=;
 b=hfyPZhuIWljTyTYPdTQzHDEgknOh1acHpfBmj6Mh6fCn1St18+udS93oIePBuEI9kvgs1VmBj6eLX+gNb9GeC/E8rixnb0MhJn7tblJAgtNlK02qVJCSkxBi6ug13QElBOnPKkoW4DMld82/g8gDFwuKgiuDlRWtpR7Vswc4sryPjzvbkl7tsFf8kn/+a8/X6wHuAQaniEKRX/cdslvxuabuo/vM4qPu6mI45oAwBqe/OCyIr2h9+zeXZYeVnhQcGxaYzLBoZW0WUIZtM79tTfPAy8dcQqe5zg7jEW1e3ns2YXHBLpfltfZT4SVwWDIgmEsHzVibipNRU9Buztgf1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/6SqassdIDh7H5NEDNBrEaPA0tepCbLkPBeTmrekXg=;
 b=jkrIl2whVap8u0xKtc5LjKA4TCMxvzxgZM99EZY9OcD1Oq6SEo9ytxXt5g+IXXTpTxt+gcBpFJIhui7xg/lMZayeRN4XlNpqj6D5Vp9OpPawjjBQQZaLvytqmZAJk3jmQTlNrJdfD/9TSSigukhvZFoKuPgaLWVt8+etGNou3jQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Thu, 11 Feb
 2021 08:27:08 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3825.023; Thu, 11 Feb 2021
 08:27:08 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm/gem5/boot-wrapper-aarch64: Move main recipe to meta-arm
Date: Thu, 11 Feb 2021 08:26:54 +0000
Message-Id: <7338df76627e2651b0e32ff75e898419032b37bc.1613031976.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: SN4PR0501CA0017.namprd05.prod.outlook.com
 (2603:10b6:803:40::30) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by SN4PR0501CA0017.namprd05.prod.outlook.com (2603:10b6:803:40::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11 via Frontend Transport; Thu, 11 Feb 2021 08:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 29dccde7-918a-4e3a-682c-08d8ce66db4c
X-MS-TrafficTypeDiagnostic: AM6PR08MB2998:|AM4PR08MB2673:
X-Microsoft-Antispam-PRVS: 
	<AM4PR08MB2673238AA6BF863C765EF8D0928C9@AM4PR08MB2673.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HR0YzWqVHzR8kgYEkV6U+cLEyKE+fYaHoZ0M8NoyGIhmXDNDbezoWrn2Uw74vzHj7xEPNjzzG7Lsi06Jy5Q9AupqKKbjws9KD297qprFCAMMg55cqEAVO0O1WNjDx54aN3ZPFGvfPEnljHPe4mHQr1HapdfYMlgrXXdbKC/jpTAYteSDwuASF85NuKsaDQo0NuD7d0z0DEcmjD1u8aGPrp72XmoMbiu+akGdbOzQjB/hMfCRsMlLCv73K2tHneH5dmRezue6yMZCF6UDybGQcWnEvTtC1XaW6Pc73NBF9aupdCVhlub3JNWwg0/H9zI3Y9yO6O06csQ2Wa6IHzfPVcJ64eu5J7DQtqgW80Pqy+w+TWsBieT49wJC8b7ZHxWvBsG/wlbO/hme9Su9N8VnXNkeXtiGv58sbJdGi8JDfdMl62h8rI/B2rQSOBeqqE7ixxp7qkIxfMBVgHEtnhX55VVd+XZvAnTdtgosfXQAjSfH8PkBzfadFIg6k/ypCeB4W5I0M6OwbGmMY/5Jg5CBiQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39850400004)(376002)(2906002)(956004)(8936002)(2616005)(86362001)(26005)(5660300002)(36756003)(6486002)(52116002)(7696005)(316002)(6666004)(6916009)(186003)(4326008)(66556008)(66476007)(83380400001)(478600001)(16526019)(66946007)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?UtksSg4O4gu4AV3V6isyHCv28jzyjojCeBgwPEMx4l0hirC+PUIYhR71EcS/?=
 =?us-ascii?Q?nsHMUZHSHfYunqQhY/rdrLbkmvRowjYjFDsgRwRJ6IBepNzW2UMBcFs3k91L?=
 =?us-ascii?Q?DzOVQBKRicEAwaslwAA77fb/p1XIOA9H/IaKuHDGATxoY1V8+hcAUEmQ21/z?=
 =?us-ascii?Q?RO2gXgnwpHLgSRSZTNdTaXhsMhfIO6/58TSe2PKyPtgTCBNZbownqXTc7DhO?=
 =?us-ascii?Q?80lSJ1yNEt05irwX2zwDMkG10fUp6k8Qgj0hsku7LBpbhZzdhouSA2gV6PDZ?=
 =?us-ascii?Q?PyLp9rvcFR5mCwS15VrOvUMBRt4wWMX5qLRREX3WVWgz90VpjNW0sJaNGuU2?=
 =?us-ascii?Q?49AfOTTXn9lncVMjN544OKf5hvedsIjttslj32Sbn33eIW1LY1G8jmrFeEc/?=
 =?us-ascii?Q?kujJg/wI7hTNGy/kfJpj7cSH2T4uGnVIw+QcDQqIwZjyVNwK1ZX/NIqadZwJ?=
 =?us-ascii?Q?yfs1zSVmLeZ4fNHZl19m2dRNdrXq1P15DAat2TjBOyuTKozRFg86eR5gBqQY?=
 =?us-ascii?Q?8ZvrMuKBBswoVqW8VV42WjoAHZ1dSEZpg7fYnam7yNmqtbJ8q91bxL35+jwZ?=
 =?us-ascii?Q?BR3Hq0v15NBBgrgReEBB9vb6kYJZlx1+ywpBG0q0GJEll2lv/znXxcLf8zC6?=
 =?us-ascii?Q?5ZQBAnbd7bjhsSrKPOq0IoysjvyaGC8KAZf7k9tNDUvLsPMcCww8BegwIxeq?=
 =?us-ascii?Q?QY5O7hnsC48hgXc2+ydNZi/IA8ynSKhxVYCSogsjzceqoNrmlHurQzDGgD2Q?=
 =?us-ascii?Q?yfMObrD8G3mEIkHkaxJDyJZxrzVGifLvsnHUmV9t9RPF6rJfYCBrcPKcqUDl?=
 =?us-ascii?Q?I2K44AQeI2AujJx+Ifkw+VDB1ViL0PinXqzblKD/9Yr8IgbZJd9a8ury221h?=
 =?us-ascii?Q?gqWzmqlVGLLy8D26gJVup6vnVyQf01BkMTxgfti09BwG6k+1W49jCC5/vsUR?=
 =?us-ascii?Q?s5Wv/PBACrms53SD+3A6iVdtTQE0GAMy6sJgylsoclXyPuDWjGPUvDp8odLz?=
 =?us-ascii?Q?+92NvQDQ6a49fr+lCSTBFR3WhVPIVqMLsUTJ9o8Od8nbiIdL9EIPmNLIYIf0?=
 =?us-ascii?Q?cbit72WTh0ajXnuYE5Ac5jhB2K7JLA/eLaxUEwNFfGXXuy3A6yytxw5m3Rvf?=
 =?us-ascii?Q?siXrQqAlu+MOaU92eaNxaZKixqb6LpG1AOmj9xsIG+t7SGcl0RKRM3SGOov6?=
 =?us-ascii?Q?rrB4kkx9QFW/qz4WY6qg1xw8dZk0aFPOfFrjiEA3bZYtop9zbozsGuqzJaED?=
 =?us-ascii?Q?JFbsv+rvpKfZE4BEgUPTAueEE1sMuwMd6zb3OKyF4C+rwag7JThoNeGbvijr?=
 =?us-ascii?Q?xBFlhBRouYsdVVRz+DihJc3a?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	888ef76d-2da2-4d52-a4a4-08d8ce66d1a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ebow3KS69ZNLNZeO7qHTxhPDc36N9lZS6RiAa4IQMyPiqNTmZSddeSeeWN1YGB7RBpgzuLSktsxgqdIduJAZuH3nhsirlWCBb08IKYjg6ye9XxX9r2mm4+6iRFDeElt6VIFxkyS9qZg2ZX6WZryQfce8Lw/Uw3r6ivuw/+TBYbRoo/HhKb0IR8d3zRBa98nSQrvgEULw2dDyMSrODTZj+h7cyFcV1iNBcHjKyQYlqengilqhFbPvqNaNnXndPW7r8QWEygi49oJEUKNBFBHiVLr7AwLZfSPKsClW3CeTtz1whs/mXIIdVyAHlCRJfgLYoU8X9F7DiE0DOqC3A63mbFvpx86Wzricj4qA8vnURkVTe08K0RCsZ1V70gb2NgK5cNlWY9296yUnICOZ09m9X82KIyD02SJcQBCvvKmLDjLTfIc2mVOZAp6JlQAQKb7xQ73o1vYLjmjd+C3TZhWqK/5PL8EFKlICF1Z5pDLeyxvrlRF7kV8vfndaUNNztzbkBJqGrkRYMUGBLn4h/FjGbxpI0GPT3GswXBnrbIuA5Lzjh59ssqz6+sHtVWYvWoi8lOCB36wfn3LoDNhsFNL0LdxOfn5A4Rv4ne3Y9v1x6UGZ8+4Jb9BzqhcYWmT7aFMrHuS2P/VIF/zcX5BTNaeqVYrA5xrJVgnk+N2VICf2c/o=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(86362001)(82310400003)(336012)(83380400001)(4326008)(8936002)(26005)(186003)(316002)(956004)(82740400003)(44832011)(81166007)(356005)(2616005)(7696005)(16526019)(8676002)(6486002)(36756003)(70206006)(70586007)(5660300002)(6916009)(2906002)(6666004)(47076005)(478600001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:27:23.2439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29dccde7-918a-4e3a-682c-08d8ce66db4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2673
Content-Type: text/plain

Move boot-wrapper-aarch64 recipe from meta-gem5 to meta-arm and merge the
contents of the .bb and .inc into a single recipe file.

Also, create a boot-wrapper-aarch64_%.bbappend for the gem5-arm64 machine.

Updated documentation for gem5-arm64 where meta-arm-toolchain and meta-arm
layers need to be included in the bblayers.conf.

Change-Id: Ia8193f4f0bf98069edcbf1661cb3e9b2105d12a3
Issue-Id: SCM-2080
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../boot-wrapper-aarch64_git.bb               | 15 +++++++++-----
 meta-gem5/conf/layer.conf                     |  3 ++-
 meta-gem5/documentation/gem5-arm64.md         |  5 ++++-
 .../boot-wrapper-aarch64_%.bbappend}          | 20 +++----------------
 4 files changed, 19 insertions(+), 24 deletions(-)
 rename meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc => meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb (90%)
 rename meta-gem5/recipes-bsp/{boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb => boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend} (50%)

diff --git a/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
similarity index 90%
rename from meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc
rename to meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
index 3cd3917..322c9ad 100644
--- a/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64.inc
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb
@@ -1,14 +1,20 @@
-
 SUMMARY = "Linux aarch64 boot wrapper with FDT support"
 LICENSE = "BSD"
 
-inherit autotools deploy
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bb63326febfb5fb909226c8e7ebcef5c"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git"
+SRCREV = "fd74c8cbd0e17483d2299208cad9742bee605ca7"
+
+PV = "git${SRCPV}"
 
-PROVIDES = "virtual/gem5-bootloader boot-wrapper-aarch64"
+S = "${WORKDIR}/git"
+
+inherit autotools deploy
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-COMPATIBLE_MACHINE ?= ""
+COMPATIBLE_MACHINE ?= "invalid"
 
 # Device tree to put in the image
 # by default use the standard kernel devicetree
@@ -84,4 +90,3 @@ do_deploy() {
         ${DEPLOYDIR}/linux-system.axf
 }
 addtask deploy before do_build after do_compile
-
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index a6448eb..bf42f74 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -9,5 +9,6 @@ BBFILE_COLLECTIONS += "meta-gem5"
 BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
-LAYERDEPENDS_meta-gem5 = "core openembedded-layer"
+LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
 LAYERSERIES_COMPAT_meta-gem5 = "gatesgarth"
+
diff --git a/meta-gem5/documentation/gem5-arm64.md b/meta-gem5/documentation/gem5-arm64.md
index caaa422..137676b 100644
--- a/meta-gem5/documentation/gem5-arm64.md
+++ b/meta-gem5/documentation/gem5-arm64.md
@@ -6,10 +6,13 @@
 In the local.conf file, MACHINE should be set as follow:
 MACHINE ?= "gem5-arm64"
 
+And in the bblayers.conf the following layers need to be added:
+##OEROOT##/meta-arm/meta-arm-toolchain
+##OEROOT##/meta-arm/meta-arm
+
 ### Build:
 ```bash$ bitbake core-image-minimal```
 
-
 ### Run:
 After compilation of an image, you can execute it using the compiled gem5
 with the followin command:
diff --git a/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
similarity index 50%
rename from meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb
rename to meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
index a071f60..d890d1b 100644
--- a/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_git.bb
+++ b/meta-gem5/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_%.bbappend
@@ -1,20 +1,7 @@
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bb63326febfb5fb909226c8e7ebcef5c"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git"
-
-PV = "git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRCREV = "fd74c8cbd0e17483d2299208cad9742bee605ca7"
-
-BPN = "boot-wrapper-aarch64"
-
-require boot-wrapper-aarch64.inc
-
 # Gem5 aarch64 support
-COMPATIBLE_MACHINE_gem5_arm64 = "gem5-arm64"
+COMPATIBLE_MACHINE_gem5-arm64 = "gem5-arm64"
+
+PROVIDES_gem5-arm64 += "virtual/gem5-bootloader"
 
 # For gem5 we use the dtb generated by gem5 directly
 DEPENDS_append_gem5-arm64 = " gem5-aarch64-dtb"
@@ -24,4 +11,3 @@ BOOT_WRAPPER_AARCH64_DEVICETREE_gem5-arm64 = "gem5-aarch64.dtb"
 DEPLOY_DEPEND_LIST ?= ""
 DEPLOY_DEPEND_LIST_gem5-arm64 = " gem5-aarch64-dtb:do_deploy"
 do_deploy[depends] += "${DEPLOY_DEPEND_LIST}"
-
-- 
2.17.1

