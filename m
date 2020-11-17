Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.78])
 by mx.groups.io with SMTP id smtpd.web08.5897.1605607862196296724
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mlFOQoT5;
 spf=pass (domain: arm.com, ip: 40.107.20.78, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edz3htYnr/7lLxhqePeZIRF5nZJOzSq6qN4/SGlphf8=;
 b=mlFOQoT53IDX1Jpxl+vtp9GOp8gUmmWrWNopT5Kf4LLGcgrUhi0Zp3iU9TH94aFsGBUzT5tJ2wW1T27nn/wr1YCr9x6CFg43Yc0Svgc/DvZhrU5FM0HXeMeyDU21XZGfG2m2Lk2vw0BU+IgXR4/UIlod/sEdaLWTRWiMfwrszyE=
Received: from DU2PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:10:232::26)
 by AM0PR08MB3396.eurprd08.prod.outlook.com (2603:10a6:208:dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:11:00 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::3d) by DU2PR04CA0081.outlook.office365.com
 (2603:10a6:10:232::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend
 Transport; Tue, 17 Nov 2020 10:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:10:59 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Tue, 17 Nov 2020 10:10:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 104d1a6402cfd718
X-CR-MTA-TID: 64aa7808
Received: from 91251ae2d290.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 247DD08E-4291-4C32-AC14-0427537DA66A.1;
	Tue, 17 Nov 2020 10:10:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91251ae2d290.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:10:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggHanj6KB6QycEG22d+a8PwJ7FhLEypj607Nzx/7nn6BsntyfaFIXX1HOFHIziDuL8mG0/jvrE1NwdHuW6iwRq3Ss3aQs5CLeFh8gR8mTtpXrdPjLUTbUoI3P32zRzVCxalBgQtDxVPXERAgnJG/R4A1LwwcpC7ZcnGAiPvDr/iN6J1xb8ikqVBxAfZKkaUodpCFZhs3cK9son8RkIbH5osoETLOTg/JZqR5egFimxBECLdwxYwVi3YcT8cg/uOwhdaKP/wwOrd90cm4ttwrRqIrWHFbdT2yN+EfZrcduQ3IoLWnjOBvWOlE3FcP1yAtuUPxGEVZukV+DFTG6bY6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edz3htYnr/7lLxhqePeZIRF5nZJOzSq6qN4/SGlphf8=;
 b=YqNgoWPo+EFLc8uIjHgaeGKqdah4RwKSbnexPg7Ra4sgCJuC8j/CYpRazH6K6Q0dsJ+N2ZV7Em5arRDEsh4Q0RhTfbJeUZj6hRq5pytXv7w545J45w8En3BpaI7eKSkcwXg4DpJAiCkF9W33wpapQz37791kMyBFZPjTjz6DomlM87N0R5JMR4qxM8buoWi3Sj9dcjhWB+LVrCgCpHwElgBKsetEZbg2IhgfiNFwXw/c5XX+ak8KZB/GsnCeyCFaE+GTd8wbi1XNrTWFanEKcECej/Lm4RVl5ec80kLIPp32tU9bNFR1a+COPCT2mfqFcqTnM7g/Kok5HffvqmJvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edz3htYnr/7lLxhqePeZIRF5nZJOzSq6qN4/SGlphf8=;
 b=mlFOQoT53IDX1Jpxl+vtp9GOp8gUmmWrWNopT5Kf4LLGcgrUhi0Zp3iU9TH94aFsGBUzT5tJ2wW1T27nn/wr1YCr9x6CFg43Yc0Svgc/DvZhrU5FM0HXeMeyDU21XZGfG2m2Lk2vw0BU+IgXR4/UIlod/sEdaLWTRWiMfwrszyE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 17 Nov
 2020 10:10:41 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:10:41 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 6/8] arm-autonomy/n1sdp: Add GRUB config when including alternate kernel
Date: Tue, 17 Nov 2020 10:04:47 +0000
Message-Id: <20201117100449.20111-7-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:10:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b8dd148-d6cf-4bfc-bc34-08d88ae1150a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5399:|AM0PR08MB3396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3396486CCC2D2EEF1681F42D92E20@AM0PR08MB3396.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qPY9BWVog/KDNEZy3mIUx1+/jZUXHIzQCaVpLRCVyPbkZlDzB/Yg46/+b4KazvNnrybW5C626irDnUqKRg7AYtC8sG6GjxR1ElVOCWgrT+4sm+MpcBGT7iaLNkWA2GejQGm6rhLaane6W5wzg/eqURrvqZknWLqUjGLaOMAhVuhSUMyiOWRLR+TnUXZ8ZsAI4Cr2EV0bwraNONofGpvArZW9PSAyL5tvZwEjn7CT/8ew2yB6BFyOKfJY9WFpE1wfV+/KRbAl0XvZ/Kskr6/rbbslRjogkGHdflqs8bQsKzVS/vy9EogBx6yegFyUOzpRi3aPf8qH7OREM9/pkf5VZA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(186003)(16526019)(26005)(316002)(956004)(2616005)(86362001)(8936002)(7696005)(5660300002)(478600001)(8676002)(1076003)(52116002)(2906002)(44832011)(6916009)(83380400001)(4326008)(66946007)(36756003)(6486002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 K61RkNGqwScWbqrb8581z9HNPCMWcqH4jsHiWH9qT9ifd5tx4UJiEFxNcjnDZ1YOSRnddZxoc4H3q8TKMajMrP2laHOqR3TnBC8oQJrYtT+PQCn1AHXLBkZlAGZOLdk0FaPDOcIcXL4lnZ3a9SYt4LdzgnTubSenm7Wt8iN1j84jphXK4XP0/aGOtyIi62G7ksuvGrqW+3JRMXzp+4Syyr8vUyQVa1sMvu7K3xUtmwKMLaUWgN9eAMrc4lL6QZ8KZ94NprNe6YTMynn0DsxnMGt8Ak5oRKjC7xQEhXsIXktfkCVXZFNcFX4M8u5ubjGoX3gTJ0KZvbYAQzOfnCT9qd4i5dqwh/ISJaun0T4aQb14PxzqpKcPIVcOQrwjrWJo/BU/GzD3PIoP1qKa1dsR/aN7e/B0NAZxTAXn+STJr/VgihSmHLf8V/SAJX/ArvVl6NSk5whLGaMZsJUBuf+zC9ZiaZVL1q6lkSxM9haWyZTlycyr5AHW91o4/FSXnNncLNMtnGBML1LkVhV18mDEN71ZO5SrUVeppApYQZct4IRREdFM9K3nEfbQMS1wYayQOqfYAyboOF/U8ATJTZSA8zCOy0DZzJnFoS86AjmQruTkcUvDN7kgaFkplWPaaFBPE6fkVFduTimXddUktdFLCU1xgO0hFng8WzV0eapya/0NTw569tIqQYxlIkhhD8tr0tJ1nQEEc60mJ3XqXMyNzHcppFK13W/PoOoXDKuy+EZrkonp2NBv9XBmu1wTx1CIXvIEjrGCK36n4HQk6SSbs87X6j44SrWeu+tegYt6Q6/N0OXnO/o20T0fUGn3HNCcVQ//Ol/O2+fPmgjvMt32YCpUr+UN9cBiSiQoHt2tD/NHnnPDM4leO1JrzODDeib+X4fU0+XPKlOQgfubh55UvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e2ec382b-eb7b-4e53-ed0b-08d88ae109d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qu6qP25xrc19PP9/R4G1Zn7WMT9RHPZZpDz4FYjaz4qdBb1EI/jyGC6RbJUC1Qqd5q1a0eVmic8vOPlfSqkMuQHCdA0Z9iQNGYBlNBCyo8o1rOKL6VX+MaF8vjqtZ036EC4t6s8doZ4QJi11p1R/RHy9XfkGCD7jBiqlsTIqlYwK8JfurZ8gQ4Wqac1LkDybh+gtxXJDIuHsc3cDJAMqcVbEtvd5L//pqdfAPBfHegtSE8YE/R9ne8bCybHb2C2HB6nzaheirRbOARa+LtRlTEvyDtwFAOGQFASwz/2/lj6rrMqlnr9lMgH25Dlo3J4IU2kOi3eg11jQPVQPSKz3iYEg5dN+dQPNKW/l9aww1VEg2i7gINtmD6uWdu7v0EK7eh5WYw2PC/acV3pfqGaHGA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(7696005)(26005)(16526019)(44832011)(186003)(316002)(86362001)(8936002)(336012)(6916009)(4326008)(2906002)(2616005)(36756003)(6486002)(8676002)(478600001)(82740400003)(47076004)(956004)(70206006)(1076003)(70586007)(356005)(5660300002)(82310400003)(83380400001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:10:59.8164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8dd148-d6cf-4bfc-bc34-08d88ae1150a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3396
Content-Type: text/plain

For N1SDP as arm-autonomy-host, when alternate-kernel DISTRO_FEATURE is present
we set, as GRUB config, the arm-autonomy-n1sdp-rt-grub.cfg which includes
additional entries for booting with the PREEMPT_RT kernel.

Change-Id: If40aee159ae5ba0efd3d9a5a16ee1c1167fb0504
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../conf/machine/n1sdp-extra-settings.inc     | 22 ++++++++++++++-
 .../wic/arm-autonomy-n1sdp-rt-grub.cfg        | 28 +++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-rt-grub.cfg

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
index 7501bf5..a675239 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
@@ -15,7 +15,14 @@ GUEST_PART_SIZE ?= "4097"
 GUEST_PART_SIZE_UNIT ?= "M"
 
 # The GRUB_CFG_FILE affects arm-autonomy-n1sdp-efidisk.wks.in file
-GRUB_CFG_FILE ?= "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy-n1sdp-grub.cfg"
+#
+# When alternate-kernel DISTRO_FEATURE is present we set the
+# arm-autonomy-n1sdp-rt-grub.cfg by default. This GRUB config file has
+# additional entries for booting with the PREEMPT_RT kernel.
+GRUB_CFG_FILE ?= "${@bb.utils.contains('DISTRO_FEATURES','alternate-kernel', \
+                     '${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy-n1sdp-rt-grub.cfg', \
+                     '${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy-n1sdp-grub.cfg' \
+                     , d)}"
 
 # From arm-autonomy-n1sdp-efidisk.wks.in, the /boot partition is /dev/sda1, and
 # the "/" partition is /dev/sda2.
@@ -60,3 +67,16 @@ IMAGE_EFI_BOOT_FILES += "\
 ${@ d.getVar('KERNEL_RT_IMAGE',d) or '' \
 if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d) and \
 d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
+
+
+EFIDIR ?= "/EFI/BOOT"
+GRUB_CFG_EXTRA_FILE ?= "${ARM_AUTONOMY_ARM_BSP_DYNAMIC_DIR}/wic/arm-autonomy-n1sdp-grub.cfg;.${EFIDIR}}"
+
+# When alternate-kernel DISTRO_FEATURE is present we set the
+# arm-autonomy-n1sdp-rt-grub.cfg by default. This GRUB config file has
+# additional entries for booting with the PREEMPT_RT kernel and also includes
+# the main GRUB config file set by GRUB_CFG_EXTRA_FILE.
+IMAGE_EFI_BOOT_FILES += "\
+${@ d.getVar('GRUB_CFG_EXTRA_FILE',d) or '' \
+if bb.utils.contains('DISTRO_FEATURES', 'alternate-kernel', True, False, d) and \
+d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-rt-grub.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-rt-grub.cfg
new file mode 100644
index 0000000..31d0bbf
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic/arm-autonomy-n1sdp-rt-grub.cfg
@@ -0,0 +1,28 @@
+set term="vt100"
+set default="3"
+set timeout="5"
+
+source $prefix/arm-autonomy-n1sdp-grub.cfg
+
+menuentry 'N1SDP PREEMPT_RT ACPI Boot' {
+    linux /Image-preempt-rt $kernel_cmdline acpi=force
+}
+
+menuentry 'N1SDP PREEMPT_RT Single-Chip Boot (Device Tree)' {
+    devicetree /n1sdp-single-chip.dtb
+    linux /Image-preempt-rt $kernel_cmdline
+}
+
+menuentry 'N1SDP PREEMPT_RT Multi-Chip Boot (Device Tree)' {
+    devicetree /n1sdp-multi-chip.dtb
+    linux /Image-preempt-rt $kernel_cmdline
+}
+
+menuentry 'N1SDP PREEMPT_RT Arm Autonomy (Xen) Single-Chip Boot (Device Tree)' {
+    # no_argumants under here is a workaround for a bug
+    # also any kernel or dom0 cmdline arguments has to be passed via dtb
+    # because any arguments put here will be ignored by xen
+    xen_hypervisor /xen.efi no_arguments=use_dtb_for_xen_or_kernel_cmdline
+    xen_module /Image-preempt-rt
+    devicetree /n1sdp-single-chip-xen.dtb
+}
-- 
2.17.1

