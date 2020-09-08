Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.70])
 by mx.groups.io with SMTP id smtpd.web12.12019.1599532663206925663
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Sep 2020 19:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hDdeJrAE;
 spf=pass (domain: arm.com, ip: 40.107.1.70, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+WDYpooCx+CKu9wXnws2JI33aUNy+rNd4h7Cx6yKTY=;
 b=hDdeJrAEc5O8jB2co/ql1UhcNz0p6O2ErkwaGeT322sRvIUZg4QrQj2ndPPx7FOrV4pZQJ8XuMm80/P93ZynboR1BnpcnOzO4lKhuAxGrXZ41Lw4asanAYwCEy9+KHjiTTqD5Eqj+0eY2mBD2JpXDC+cF8/EXB3+MtDBXmGxv+I=
Received: from DB6PR07CA0158.eurprd07.prod.outlook.com (2603:10a6:6:43::12) by
 DB6PR0802MB2358.eurprd08.prod.outlook.com (2603:10a6:4:89::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15; Tue, 8 Sep 2020 02:37:39 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::ad) by DB6PR07CA0158.outlook.office365.com
 (2603:10a6:6:43::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.9 via Frontend
 Transport; Tue, 8 Sep 2020 02:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 02:37:39 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Tue, 08 Sep 2020 02:37:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37d2596646962b7f
X-CR-MTA-TID: 64aa7808
Received: from feccaae45c33.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D3D398F8-3A35-42A8-854F-5529C2E528D0.1;
	Tue, 08 Sep 2020 02:37:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id feccaae45c33.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 02:37:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpgOug22EQn9tTM+1UilSfgEsN7MbhBlUTR4mXarjorKRa/c4mzN44/yV15Zj9cEFVPzMOb/vAep0uR9p/wMka+uydfkSSsX2S3pt8CYfWUFlhTvz9lbNVZRjbLciO0hLxVXzYBMkAIIcshqItJ8atzeZIKchC5PFVPVMZ0tQusJCN2rOEyFMoS7oGkxf7nMBwPuYoDYPsy3v7BI7fo/YgvZWfXiKcgmFJFb4ZMEIR9faJLhfeaYkyPNXCHAh8wC1az7Y9UoXWb7MDogqp8P7Qfmmg1US4YTn3XWBm9ZXcXPUlFwBlQ8EUy6jygsS2/8yfvNSp5JJwjF1GvTB7g1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+WDYpooCx+CKu9wXnws2JI33aUNy+rNd4h7Cx6yKTY=;
 b=l1rDESyxAWhhk2bk72qNfk5Ie236XhIx3u+Hb1/bT/1traPRUbrE7I1x7MTdTg7iwZrj3WuoGRL5wPFlnX26duULrJFRbUolUDdXG2HHFDWS4z6RmXmbI0FRjsIsTH8TC06yFH5WFHU0dMqoeacHKTDS9QXJr8+Y1QO3LJv+NXNFON+PsjfqIx3jqnuRAGT4AwymF77++fWmpwEhQ3rLmnO0hKvx3GcNnOHmanqS/TL7yc4gV0ufYsPy8wyrCyl/eyd77uasHR1cW49jZJs52gam7gUwPQ6SkeZeL6j/F4w3LXzn6NLCcAxqrHdkJgREbSuVLUtzuQEl6scX4t7wnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+WDYpooCx+CKu9wXnws2JI33aUNy+rNd4h7Cx6yKTY=;
 b=hDdeJrAEc5O8jB2co/ql1UhcNz0p6O2ErkwaGeT322sRvIUZg4QrQj2ndPPx7FOrV4pZQJ8XuMm80/P93ZynboR1BnpcnOzO4lKhuAxGrXZ41Lw4asanAYwCEy9+KHjiTTqD5Eqj+0eY2mBD2JpXDC+cF8/EXB3+MtDBXmGxv+I=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5604.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Tue, 8 Sep
 2020 02:37:33 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 02:37:33 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Sayanta Pattanayak <sayanta.pattanayak@arm.com>
Subject: [PATCH 2/3] arm-bsp/linux-linaro-arm-5.4: n1sdp: pcie: add quirk support to enable remote chip PCIe
Date: Tue,  8 Sep 2020 08:07:16 +0530
Message-Id: <20200908023717.9025-2-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908023717.9025-1-khasim.mohammed@arm.com>
References: <20200908023717.9025-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::24) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.53) by BM1PR0101CA0038.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Tue, 8 Sep 2020 02:37:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 32aeb5aa-b47e-4df0-2f34-08d853a0277d
X-MS-TrafficTypeDiagnostic: AM8PR08MB5604:|DB6PR0802MB2358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2358C2AE0339AF31E7181AB9FA290@DB6PR0802MB2358.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dsYF8ruVS4uKHdjSLGvheec8B2Kq2vOLzS9tQ/JiE8Lbo126gyPwA0ybusBijyzbRPe1bMF5iFm8ZlpgWVN2pnZhyzMWbJFifwyzOw8vDcI9ejFjqQmZUfDRgbfgTHHJdR32wh0LMIXhP+TAK1J438ks8qosLC5PAQOp8+6NLe0snY86/jedXC4CIGlwGyxP5d6ANV8eHGX/vkB8B2tgOIze89Q/FVsLyZ9ZZKcg0mlxv63RxBTkWFcmAQKW0/3vbKvLltkLvFRSAqU/fAeE8KyQ3Y6vkSf3jjsf0s6HFadvjR6wIQjwZ5B0z+7VhEU6RFVseICzeTe6dnjEsFMeKOWWbyRHupyqbpi8o0zaICE8F0MIrRobIYXfYIhP2UyYeurOorp9k+rSDqdbEr3/0m5PNLwsnwgwVkj21eL64mYwuUKpMX9wmiFJCjnxg8tl4aO5ApnfG8Ma4sSdHdX4XoHgLRII6SD46N4vseGwhV8qIQZwk98jMlZcj4ylRzf3
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(16526019)(1076003)(26005)(6916009)(186003)(6486002)(956004)(8936002)(2616005)(4326008)(66556008)(66946007)(66476007)(478600001)(83380400001)(86362001)(316002)(6666004)(36756003)(2906002)(7696005)(54906003)(5660300002)(52116002)(8676002)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 E/Ue87JALtXXaB2Hl4itrwgoXF2rTuyzlVXnH3c8A8IILFX38MZRvYbl+pJRzBVEMyA0Frtf4wYhMpudfs3cYt8V/LqpfdNi0oVvp8aNnI5E3VYV0yFUtGh3cLyCzkzjIxbu/B4T/IzUyCm36xDU1TmNU63W9FV2Cpf44e1SzJ87wlCgwuJoLiLhwYiU1geHVGyobSAPOW9fgkMMTSlPsQmzUj+ItAIHT8VUeezLKE6s5xEYGogTGN2LFR7TTtjzxU2SehfTQKbYFXfmmVWtdOyavvrrp1vqaRHGbNR9mC59jAkEu3vhZR7exkwxeLCj40MqXYt87HMOyF7hgxeFuu4nGBIDXSKXSd7ClXNZD+8QpqhcZsM1+rktNNdAnhyM2apT++ixTQuwJ09bmJCiaLie7HoT7xfxaWQHVv1PG+l/I+KStmldbpbIL3VNr4lcs/bT7BdvCD7HbpPQY0npJSmOJlgQqAbmY9gebu7hieAv3ripoG4kscJgEpIh2U9nEN64P0iiQqPdkQnF5QBwBFiEo2Hpn/0hPpLV+STZxGzAeLivbwj/pZr52RyTq2ppY3ZzaUiPy5+qYAM3oBdfejDo79Zp/PvboS2YKvy5+Eka8pC/lFh8hWuUwBBN0ji+rbYEDagTLs8PbZ1LiHWB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5604
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dc1a19de-d65f-429d-39e2-08d853a023a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	udLHWlevw5GPxHHMnZ4QTMAZpvZADgxzk6NkgJ5FYlThzMympOv8y87IMvGDlyTsIdpA33jtyQXwoH5mQd3ZLI9l2gC14OtSfWaDRRDoTYSE8J0UPlum1K/l4a31NY7q+K4qGkQK9JBFi+vUQPR4Nc+YjoDpwGNKXwOXHetotPZ9T/D4Ivs5//SzEHxc1ylv6YTCtOncEB+W23cjOSYV0jTIQkcQszC9oLdvLWJG1EDmOmzJtsFEi32tqgoyEyrCxvOjKDmaQKj/H/ORCZxYHvB4P4Ob8wilCQbWTGftfAQsoxkOWwPwYB+PFu5ZQHNt9zqpwhpIl3ukRjQSNVho1ANeIW7o8ZEJae2dvo2T50VCk8YMhfSuDAFFh6yRjHT/0SSc/4A86aYLuJl5sQk2OmBWX4toTuyhOB+ryMXIX/jgOU2JC8kAjkUalo3y1uaNGDVC8xOYWeLu5XdJM42gbiVXQX3VKtaxQB9cT0fG1CFvnMGXbAXE0K15WUQdCUAcveFCC2KfOWrueRdWZJadrVYR7gByr8nfHvhPF4fFG6SF19G4+yOoT2rEjteD+2tX
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(956004)(47076004)(6486002)(70586007)(70206006)(5660300002)(356005)(26005)(16526019)(81166007)(82740400003)(186003)(83380400001)(82310400003)(36756003)(6916009)(336012)(86362001)(2616005)(2906002)(8936002)(54906003)(1076003)(6666004)(478600001)(316002)(7696005)(8676002)(4326008)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 02:37:39.5253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32aeb5aa-b47e-4df0-2f34-08d853a0277d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2358
Content-Type: text/plain

Base address mapping for remote chip Root PCIe ECAM space.

Remote Chip PCIe topology is enumerated in Firmware and current
change takes reference of enumerated PCIe hierarchy of Remote chip into the
kernel and include in complete PCIe topology for kernel framework.

Change-Id: I2bbceb5c89cc8fb4609e646652917cd97d638a27
Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 ...uirk-support-enabling-remote-chip-PC.patch | 134 ++++++++++++++++++
 .../linux/linux-linaro-arm_5.4.bbappend       |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
new file mode 100644
index 0000000..d3db77a
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-5.4/n1sdp/0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -0,0 +1,134 @@
+Upstream-Status: Inappropriate [will not be submitted as its an hack required to fix the hardware issue]
+
+This patch is picked from the git repository:
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/patch/?id=04b7e76d0fe6481a803f58e54e008a1489d713a5
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+From 94892f681463908e4a879258dfd6053bbb025447 Mon Sep 17 00:00:00 2001
+From: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+Date: Fri, 31 Jul 2020 15:32:24 +0530
+Subject: [PATCH 5/5] n1sdp: pcie: add quirk support enabling remote chip PCIe
+
+Base address mapping for remote chip Root PCIe ECAM space.
+
+Remote Chip PCIe topology is enumerated in Firmware and current
+change takes referecne of enumerated PCIe hierarchy of Remote chip into the
+kernel and include in complete PCIe topology for kernel framework.
+
+Change-Id: I368e51c535ac66e48bd356bd33da6c49f1a0fb2a
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+---
+ drivers/acpi/pci_mcfg.c             |  1 +
+ drivers/pci/controller/pcie-n1sdp.c | 34 ++++++++++++++++++++++++++---
+ include/linux/pci-ecam.h            |  1 +
+ 3 files changed, 33 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index 7a2b41b9ab57..53d073ef941f 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -149,6 +149,7 @@ static struct mcfg_fixup mcfg_quirks[] = {
+ 	/* N1SDP SoC with v1 PCIe controller */
+ 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
+ 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
+ };
+ 
+ static char mcfg_oem_id[ACPI_OEM_ID_SIZE];
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/pcie-n1sdp.c
+index 04c0de043817..19b573468ac5 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -28,8 +28,10 @@
+ 
+ /* Platform specific values as hardcoded in the firmware. */
+ #define AP_NS_SHARED_MEM_BASE	0x06000000
+-#define MAX_SEGMENTS		2		/* Two PCIe root complexes. */
++/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip*/
++#define MAX_SEGMENTS		3
+ #define BDF_TABLE_SIZE		SZ_16K
++#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
+ 
+ /*
+  * Shared memory layout as written by the SCP upon boot time:
+@@ -100,7 +102,10 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
+ 	if (segment >= MAX_SEGMENTS)
+ 		return -ENODEV;
+ 
+-	table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++	if (segment > 1)
++		table_base = AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
++	else
++		table_base = AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
+ 
+ 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
+ 				"PCIe valid BDFs")) {
+@@ -122,7 +127,13 @@ static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int segment)
+ 
+ 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
+ 
+-	rc_remapped_addr[segment] = devm_ioremap_nocache(dev,
++
++	if (segment > 1)
++		rc_remapped_addr[segment] = devm_ioremap_nocache(dev,
++						shared_data->rc_base_addr + REMOTE_CHIP_ADDR_OFFSET,
++						PCI_CFG_SPACE_EXP_SIZE);
++	else
++		rc_remapped_addr[segment] = devm_ioremap_nocache(dev,
+ 						shared_data->rc_base_addr,
+ 						PCI_CFG_SPACE_EXP_SIZE);
+ 	if (!rc_remapped_addr[segment]) {
+@@ -145,6 +156,11 @@ static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
+ 	return pci_n1sdp_init(cfg, 1);
+ }
+ 
++static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 2);
++}
++
+ struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops = {
+ 	.bus_shift	= 20,
+ 	.init		= pci_n1sdp_pcie_init,
+@@ -165,6 +181,16 @@ struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops = {
+ 	}
+ };
+ 
++struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops = {
++	.bus_shift	= 20,
++	.init		= pci_n1sdp_remote_pcie_init,
++	.pci_ops	= {
++		.map_bus        = pci_n1sdp_map_bus,
++		.read           = pci_generic_config_read32,
++		.write          = pci_generic_config_write32,
++	}
++};
++
+ static const struct of_device_id n1sdp_pcie_of_match[] = {
+ 	{ .compatible = "arm,n1sdp-pcie" },
+ 	{ },
+@@ -186,6 +212,8 @@ static int n1sdp_pcie_probe(struct platform_device *pdev)
+ 		return pci_host_common_probe(pdev, &pci_n1sdp_pcie_ecam_ops);
+ 	case 1:
+ 		return pci_host_common_probe(pdev, &pci_n1sdp_ccix_ecam_ops);
++	case 2:
++		return pci_host_common_probe(pdev, &pci_n1sdp_remote_pcie_ecam_ops);
+ 	}
+ 
+ 	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index 03cdea69f4e8..2270662428e1 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -59,6 +59,7 @@ extern struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PCIe v2.x */
+ extern struct pci_ecam_ops al_pcie_ops; /* Amazon Annapurna Labs PCIe */
+ extern struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PCIe */
+ extern struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PCIe */
++extern struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N1SDP PCIe */
+ #endif
+ 
+ #ifdef CONFIG_PCI_HOST_COMMON
+-- 
+2.25.0
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index c83d258..d1fa04c 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -11,6 +11,7 @@ SRC_URI_append_n1sdp = " \
     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
     file://0004-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://0005-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch \
     file://enable-realtek-R8169.cfg \
     file://scripts-dtc-remove-redundant-YYLOC.patch \
     "
-- 
2.17.1

