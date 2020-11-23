Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.55])
 by mx.groups.io with SMTP id smtpd.web08.33389.1606128696459934782
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 02:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xPTB0Ubp;
 spf=pass (domain: arm.com, ip: 40.107.14.55, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfyJqV+cIL59DStQgBFYC9Rp+PVRmXXSC/8ZUjDz0fY=;
 b=xPTB0UbpQBnqS+9hyHyHKuWFyPdx5BGXsz1Dzldbja/Rscp8xRoOlQPBYHcDXMyJJ7r8MF7tk5Y10NdsB/HCKYLgH1p6tANvaIqJwogAT4nsEJ4JU90pqq56wa5qA3olDCGWbOLuQoXykWk/xBu9KztuHe5V/5fzmMnOXVBVMug=
Received: from AM6PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:92::24)
 by DBBPR08MB4789.eurprd08.prod.outlook.com (2603:10a6:10:f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 10:51:29 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::9d) by AM6PR04CA0011.outlook.office365.com
 (2603:10a6:20b:92::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 10:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 10:51:29 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Mon, 23 Nov 2020 10:51:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3048865d90a85f16
X-CR-MTA-TID: 64aa7808
Received: from 4c88510b0c6b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 89E888E1-D604-495C-B57B-8FCF55EC1E76.1;
	Mon, 23 Nov 2020 10:51:23 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c88510b0c6b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Nov 2020 10:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzEX4Nwsu3NqvCIEf5UHh2AOdyaGAIIuxNabDI5td/MMVE4/e4R0SYf9iGQnO98MWfppPBf3YkWc1KravB8aRVt6axaPuScCYDKLFfNKpcfAufMY2NgF0ZF0K5iHSBJiTE0p0DDr0hvjM2d/jV/CC/mSR2Y4H8hYGUodpW0n9Fwr/89x9yDty33jSwvKJLQDq38uqrzS3v9P0Igx5/6PHbr3vr6J33rnULDduOnZLYAHmf0/ZAF1WAl70OQwx3RDtgK1TrY8FK4fFMHlWXQQdavp9wDXJvWBFAUHcjxt8QvMwbHJBQON4p8322VlNGHQKYyWbvA+XDHGu/DSsR2DFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfyJqV+cIL59DStQgBFYC9Rp+PVRmXXSC/8ZUjDz0fY=;
 b=JnjM78MtrPcHLKvoi1iBqFG516QNlXqnmYujnqqsGG+nYFX9F5db98CcZjLhAeZL8FpRvmFQxXA1oVQ+zC10MmN+tnpnifW0L6Y8lI+qGNs3T5oLbHvg42QKbX2zpEyaeIOIwJ02z4K7ptbgX44pNHbX3PZV9obqIYAQtavSDTZPaRE0Jm87Lx32RilABreGeFdDeWv/x60iHtejNFAwCtTPmqqJLOPN1dnGZqHwXDQ0SmEVejtbYGjp7PusBpzwloXAh7u3SOUnk2TPM8XdVY/oIOBaVO+FEjXGLpX/fd08Q9/q0nsci/DdmOVq0QN7AFGsPd2DH2rvVUtXaKqTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfyJqV+cIL59DStQgBFYC9Rp+PVRmXXSC/8ZUjDz0fY=;
 b=xPTB0UbpQBnqS+9hyHyHKuWFyPdx5BGXsz1Dzldbja/Rscp8xRoOlQPBYHcDXMyJJ7r8MF7tk5Y10NdsB/HCKYLgH1p6tANvaIqJwogAT4nsEJ4JU90pqq56wa5qA3olDCGWbOLuQoXykWk/xBu9KztuHe5V/5fzmMnOXVBVMug=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PR3PR08MB5676.eurprd08.prod.outlook.com (2603:10a6:102:82::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 10:51:22 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::e8e7:483d:766b:3bab%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 10:51:22 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/n1sdp-image-customization: boot partition size variables
Date: Mon, 23 Nov 2020 10:51:16 +0000
Message-Id: <20201123105116.23629-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.49]
X-ClientProxiedBy: LO2P265CA0314.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::14) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.49) by LO2P265CA0314.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 10:51:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5bec550c-a03b-4bc9-cf02-08d88f9dbbad
X-MS-TrafficTypeDiagnostic: PR3PR08MB5676:|DBBPR08MB4789:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB4789FDFB68C7B48188A860CD8DFC0@DBBPR08MB4789.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fscJdTlkfes9skS2NDpKOCHO2DIMFZt8oE7NVXA26kjVG0HI/AjbVC3klFeGvtozf8FFSo1HXkg8kJkB6SYtAYJFTLFtXmSpjzmxi+O4cBtFCTFcCudTd6wsMbm58ILCkcYmpJUklJhjguPJNMjS1+BOldhzF0YJ2wVKRR09UnOG/mhaa5Ghe1iZa0rBuS34WhJQuFWQa5eIqsr6cQf6o38QATNHVZNzkLzlzO8bH4IH65Au6N54EeizCSm2IwqWTzT//LbyeQSxFA15cQEbSBGetX1RwhxiyYwEmySQpPyfnWqRum4AT2u6DRathyMI
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(5660300002)(4326008)(1076003)(6666004)(6486002)(6916009)(66946007)(66556008)(66476007)(83380400001)(316002)(186003)(16526019)(36756003)(26005)(8676002)(956004)(2616005)(8936002)(478600001)(86362001)(2906002)(52116002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ro9U44sYUggzpa1Giu1tXw0vp49YFimzeOKt+28zSqHWFtEny+/rD244aTbLxrRhEDurIJufM1PoMSaZ99xwrn9q9+1S1mALivv0nXuNw5bEhduxy0yWxCWJTmgpHl378dtVkSig7eCKERuotWjgMZH1lJrrzV14lrM/rGLHhLWKDqE2tJJwa+ViaZMkVqKWuwBp2j/M4daE97rdwsbGvFJ4JMdtZAPgvvyv3DblTn3P0ZFuUlXxCfqBZxGhx1tjKt9YyzxCo1H2d4+bVzGady1I7rd64O2Ak8E6iu235s13psZIr+/wK7TqdCyZdTMOmkWfsLAaPysAM44IW3L4RnfupORkLtNZlKrbUCICROutaqvcwXPfv334C7Oc6KH+MSQu18Ev5wZA3ptqO2YobiWPThJ+m32rIYaZhWkyryarMq4lDoc5BL0duHL31ANlmezUUetdXbBACZAcsXxEKBmhLw+I9p8QGV6AEiOVmJ4agllNc1vmSC+iEjEcZz7Rjl7eWZ1VhAgAHKawEhR8+qlOLU/9zCRDsIxy4JGGsCNjjbahTTIQKUN9DTXtxsJqxtfeGUMJvw6D/it2aHKNCvj7an2NTVMkJL72k2UOZYCO0jOxISFQv9bQ3S9FheAzXG4mNNbCgWaLUoiSMT1Nng==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5676
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a5bffd43-9f81-410b-4e25-08d88f9db79e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JnGjRW49qmf8Lnfs2tRbIoWxcV6myRcNIdz2pOL0dmqzUQhn63d/MzhtwcStJgjxBHUoe4rl5QeM0Le+STbxEbSHeagQfZ0ATCC96h6pi/QezD8J0YC29rYT7lmpvHZbkCKKolBdh8hamxX0US6jYoUnJI6p4pLOYQZdr8k9dfO64MCbaptqg8djbzhKh0oQqB8IyCyQ9atfht/nfryN2VBkVrUmRXyE0/CCoTFaBuuwh2yoTs8K7vIUnPOclYOdCEbySRPiJ+gA0ETI6zZYJNqWp8VV4cnJb+XpS4gMRFAilIFdrA3epqscGvOtShCI4/lhHE30+HuRoiZ4dpnfxKBXxex9vI/Bq4hqd7kVLAJYE2sWwUkhmEDj2CEY8Ml8mWjd8+2kWyfVtieOXozWeA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966005)(82310400003)(478600001)(356005)(1076003)(5660300002)(82740400003)(47076004)(6666004)(26005)(6486002)(36756003)(8676002)(8936002)(2906002)(7696005)(81166007)(70206006)(336012)(70586007)(316002)(83380400001)(36906005)(4326008)(86362001)(6916009)(186003)(2616005)(16526019)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 10:51:29.3703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bec550c-a03b-4bc9-cf02-08d88f9dbbad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4789
Content-Type: text/plain

Added variables BOOT_PART_SIZE and BOOT_PART_SIZE_UNIT to allow the
boot partition to be configured in conf files.

Issue-Id: SCM-1686
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Iaa76d4abdcccc693b3c38708ca452295ff8ee66e
---
 .../documentation/n1sdp-image-customization.md        | 11 ++++++++---
 .../conf/machine/n1sdp-extra-settings.inc             |  4 ++++
 .../wic/arm-autonomy-n1sdp-efidisk.wks.in             |  2 +-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta-arm-autonomy/documentation/n1sdp-image-customization.md b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
index 9e4186c..80c11cb 100644
--- a/meta-arm-autonomy/documentation/n1sdp-image-customization.md
+++ b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
@@ -11,12 +11,17 @@ perform a couple of customizations in the generated wic image:
    1 MiB per physical volume, hence it needs to be taken into account when
    setting GUEST_PART_SIZE.
 
-2. The wic image partition layout and contents with a custom wks file via
+2. Set the boot partition size (default: 100M) via `BOOT_PART_SIZE` and
+   `BOOT_PART_SIZE_UNIT` (M or G) variables in any conf file. The default
+   bootimg is ~44M so 100M leaves just over 50M of free space.
+
+3. The wic image partition layout and contents with a custom wks file via
    `ARM_AUTONOMY_WKS_FILE` variable (default:
    arm-autonomy-n1sdp-efidisk.wks.in which is affected by GUEST_PART_SIZE,
-   GUEST_PART_SIZE_UNIT and GRUB_CFG_FILE variables).
+   GUEST_PART_SIZE_UNIT, BOOT_PART_SIZE, BOOT_PART_SIZE_UNIT and
+   GRUB_CFG_FILE variables).
 
-3. Custom grub.cfg file via `GRUB_CFG_FILE` (default:
+4. Custom grub.cfg file via `GRUB_CFG_FILE` (default:
    arm-autonomy-n1sdp-grub.cfg) variable to be set in any conf file. The full
    path or relative to `ARM_AUTONOMY_WKS_FILE` should be set.
 
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
index a675239..977efc5 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
@@ -14,6 +14,10 @@ WKS_FILE = "${ARM_AUTONOMY_WKS_FILE}"
 GUEST_PART_SIZE ?= "4097"
 GUEST_PART_SIZE_UNIT ?= "M"
 
+# Set default boot partition size and unit
+BOOT_PART_SIZE ?= "100"
+BOOT_PART_SIZE_UNIT ?= "M"
+
 # The GRUB_CFG_FILE affects arm-autonomy-n1sdp-efidisk.wks.in file
 #
 # When alternate-kernel DISTRO_FEATURE is present we set the
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
index d91d568..ded628c 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-efidisk.wks.in
@@ -3,7 +3,7 @@
 # can directly dd to boot media. Uses a custom grub.cfg file to configure the boot.
 
 # First boot partition normally populated as /dev/sda1
-part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --label msdos --active --align 1024
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --ondisk sda --size="${BOOT_PART_SIZE}${BOOT_PART_SIZE_UNIT}" --label msdos --active --align 1024
 
 # Second rootfs partition normally populated as /dev/sda2
 part / --source rootfs --ondisk sda --fstype=ext4 --label root --align 1024
-- 
2.17.1

