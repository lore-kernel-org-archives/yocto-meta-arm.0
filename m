Return-Path: <arunachalam.ganapathy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0ECC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 17:15:11 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.57])
 by mx.groups.io with SMTP id smtpd.web12.10523.1645636508967027062
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 09:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=CdTPig6f;
 spf=pass (domain: arm.com, ip: 40.107.0.57,
 mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CP+JPn1gyD6euVX+lRwXPhClazJrdg/45jOeUHTme8=;
 b=CdTPig6fXBY78J4wwivOySb1lgQYWAejWw1Pr6VoUmLZ2qqdGOcZMgUL7ryEnC4KyAQWtpFmzKeWFcQBiJex+JSC4nEyyuRTj6Pm1lflkidbWJVd3VQ6l5pHKVS/Nl+UkqM8nONUgeLjsArz2rhzsPNqvjZM+K2N2O/t2ZSpJTY=
Received: from AM7PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:110::12)
 by AS8PR08MB5896.eurprd08.prod.outlook.com (2603:10a6:20b:294::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Wed, 23 Feb
 2022 17:15:05 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::fc) by AM7PR04CA0002.outlook.office365.com
 (2603:10a6:20b:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.26 via Frontend
 Transport; Wed, 23 Feb 2022 17:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 17:15:04 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 23 Feb 2022 17:15:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1a9f0740ee034af
X-CR-MTA-TID: 64aa7808
Received: from 45b7b2378c99.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 13CDA49D-D315-44AE-A552-C1622652DE07.1;
	Wed, 23 Feb 2022 17:13:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 45b7b2378c99.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Feb 2022 17:13:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClntBxS9gizLg2d/y86K4TUyj4CIdG8bXVBjqaOmGUIxhBB7+rNZJ1yvaMle7us/NY7j2lL9U4PX6mLhJf0GOGkcU8G/fobGnelylBodwkqJ1GtATJm8nMo+MLNUrQ8jbPXTbGAqWNt6w27OURYlmF25akRQdLdI7K0iGj+OLb8x398AZpaNlpmtjxCoo1m3A7H64CR7DpjmlfY0yz41/iru8nOWYw+HdGGwUAS9inO7cNukDtgv6W0lFyQx3KC50FxcR5Cd+4q6RhYPzkLc4NbmYg0irynrzp42Udp3x+ogfu2rS++QMc798sk6/sUF8OV3ON656k13sxKqRMrApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CP+JPn1gyD6euVX+lRwXPhClazJrdg/45jOeUHTme8=;
 b=KBDxe/fmf1GPf1EOHq2Pqksg9h+RTcvSbv9447E5YFpfb99GVnNmXJ8R2JiItayNS7FXW23rtrpwA9FQFTqBZFJoxlvqROlUmjGOYWrpZX6L7lNYWXvPkYpW+9FDfriECDfG19zruAXBHnDLL3uMMCyByQVxV5S7gYZrQ7abv77TSZ6NG28EinwEbsLxDI5d/KO6zdOx2xn4SnuWytjRo5qBbdLoh4ChAg9yEkoWDDZN6kZvLUzflmAhUxNqAX1bM1clYTlQjTDo/iNJ/R7CODpfawjAPTUxHrai8TM5XUcp2nz8FTrD9wrlHaMpLHMiEI9zP3n1+1u8hGfkraOX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CP+JPn1gyD6euVX+lRwXPhClazJrdg/45jOeUHTme8=;
 b=CdTPig6fXBY78J4wwivOySb1lgQYWAejWw1Pr6VoUmLZ2qqdGOcZMgUL7ryEnC4KyAQWtpFmzKeWFcQBiJex+JSC4nEyyuRTj6Pm1lflkidbWJVd3VQ6l5pHKVS/Nl+UkqM8nONUgeLjsArz2rhzsPNqvjZM+K2N2O/t2ZSpJTY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by VI1PR08MB4511.eurprd08.prod.outlook.com (2603:10a6:803:f9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 17:13:12 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::30e1:4bc:62f3:7a4b]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::30e1:4bc:62f3:7a4b%3]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 17:13:12 +0000
From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 2/2] arm-bsp/scp-firmware: add patches related to MPMM for TC0
Date: Wed, 23 Feb 2022 17:12:51 +0000
Message-ID: <20220223171251.3156859-2-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223171251.3156859-1-arunachalam.ganapathy@arm.com>
References: <20220223171251.3156859-1-arunachalam.ganapathy@arm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::34) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: cc993ba9-8ee2-458b-ed45-08d9f6f008ab
X-MS-TrafficTypeDiagnostic: 
	VI1PR08MB4511:EE_|VE1EUR03FT029:EE_|AS8PR08MB5896:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB589642D2E5D00AA338C7F05EFB3C9@AS8PR08MB5896.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7p0eZ6ZT11Syn3VvH3TxdZWuA7qCi/+rwtxZNcQYjqf6nq6/AI8DgXV+HKVG83du22+JOW3ymGdCwfTaBuoFm1uuLHoYn32W6jTWVTDWFvS2ukywoHqvg9sswCPSY1kLoW7GuoNiSVk8LEI/s75QyoKnVZppQNfAJ6HgzTnNdscdmTAc9++MMEAT86KfxNot3c/7kIPGC0Nflvv7PliDF/RdTzpv/zgIDkHlZSPqsGAhYYvNosOQQpSck08NTY4OpmCITYXKvNB2tk3gsFbucgqseIeOC60Ev+4kjTpKeZ7FaNIbB5+GfH5cvaFgKgK94mIxiZizsttkj6KUEmm0PUz7qN2wvE+RLeuDkVBn+qBqvf0FFXJufZVLoriFnQ8cW/vmryT5fmKAvlixWX0vzf0ylSLRUHj+8yx7TFnLMcLyfP/MgGONf8qtK+f6UoD5r3y27hXkZFpGEX/vPmL+fA4faJ+AYGpFxqgrfMJ8k+bH2jbl+oPeBl1MRDgvhPJcsp/qzPnxsrkNG0hOOR2nOsPXNAcQIUCR2PZknOZbX0BRQOwbmNx7dP1J0Cuy8/EVrRv6UY6etulXpzGa5aHrARLRdbzkeM5YiMAi3wkrCwJH8W6BdEaJDJbrU2iiBCc0BnUvYNsSWP4nV71rUuXD4x2CHUbVJv6FXdRao/RVBcqQbjzkXPkZpWr6RNi0WR/+px/jRtPDsVMEJ3rh3K1ozA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6666004)(52116002)(6486002)(6512007)(6506007)(508600001)(2616005)(2906002)(38350700002)(38100700002)(8676002)(66476007)(5660300002)(19627235002)(26005)(66946007)(8936002)(6916009)(4326008)(316002)(44832011)(186003)(30864003)(83380400001)(1076003)(86362001)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4511
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e14ba2df-cc09-4ef8-cb09-08d9f6efc57c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yjp4o+CXRmkE6LIBOmvM8e5PgWUF6tWcyMlDwo7WRwEqr0D/YdVZ3wQndJhvy3l9ZlvFIc9BUUch9Y/1bMl6Z/E/EMeQ9Diqf908gdKMu6DfPD7qp/RQ89EJQ8ymwddg7Jxam3vApjtubMMRa6bF1he2oVtesU0y6aeNvrGpSMm5Bb6IlWOpH2xymeGrfVjEXkFrZ9Jbv5OOhmY9Z7FA8FJv57sUAf8NYSvW4vWOXbTmAB2rwBX5Zio1CjcnY0zQ+H4lCns92UzZzEu75xahIMpCaOy0cNsDkCfcYAmpn8R7E/6e9RcW7NZz+/qX4wpiloyTFh2BjrMX0iknlQztJOmdXnDIFnGkk4sOIFBgjOOwjUCHRtHHE9xMtkiLi0P6KEdf/2vz3XbxRVDqSo39m8WqWAJ98/tfglZQvF3ZMmJlYG22T7QSa3vOIxRSDQxsgwRkI6csMaTtW96SW7+rr0IzBdc1cBcQmfKOIYD8LBoumFsYfGqsXoGlmBmu0alHGDCSMmHxoQeMu7JOOv2c2gX+6F6sre3dye9bnnWkPTtNlSeMdDDIMULGrqatKZu4WqWyMflGSNzNMBpD8vwpG2DQvLKrBjTjz2bvxeM92gq23Uedxa78a+/7Wa86FhBjlGS3dX09f6XBm6n/NrYKbr8W8My+gqvJuszuCNGMKUDuC1Qntbz72yRfGDo2Rz05
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6666004)(81166007)(2616005)(82310400004)(6506007)(356005)(30864003)(44832011)(6512007)(5660300002)(8676002)(86362001)(1076003)(316002)(6916009)(4326008)(19627235002)(6486002)(70586007)(508600001)(70206006)(40460700003)(336012)(47076005)(2906002)(83380400001)(26005)(36860700001)(186003)(36756003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 17:15:04.6297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc993ba9-8ee2-458b-ed45-08d9f6f008ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5896
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Feb 2022 17:15:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3046

This commits updates the SHA of SCP-firmware and include required
patches to build SCP firmware with experimental features
MPMM/POWER/PERFORMANCE for TC0 platform.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I263b484a467636154b70805f920bb53c6fe2026c
---
 .../0001-tc0-fix-sensor-data-api-call.patch   |  65 ++++++
 .../files/tc/0002-tc0-fix-mpmm-config.patch   |  92 ++++++++
 ...form-variant-to-platform-feature-set.patch | 202 ++++++++++++++++++
 ...form-feature-set-options-in-firmware.patch | 114 ++++++++++
 .../scp-firmware/scp-firmware-tc.inc          |  15 +-
 5 files changed, 487 insertions(+), 1 deletion(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0001-tc0=
-fix-sensor-data-api-call.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-tc0=
-fix-mpmm-config.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0=
-rename-platform-variant-to-platform-feature-set.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0004-tc0=
-support-platform-feature-set-options-in-firmware.patch

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0001-tc0-fix-se=
nsor-data-api-call.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0=
001-tc0-fix-sensor-data-api-call.patch
new file mode 100644
index 00000000..227d9112
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0001-tc0-fix-sensor-da=
ta-api-call.patch
@@ -0,0 +1,65 @@
+From 33a2173e13453ecc4f766f0e69302524401df1b0 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Mon, 14 Feb 2022 08:28:46 +0000
+Subject: [PATCH 1/4] tc0: fix sensor data api call
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I827abeeac8317e4dd466cc0c4d493cdc90e7e39d
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ module/thermal_mgmt/src/mod_thermal_mgmt.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/module/thermal_mgmt/src/mod_thermal_mgmt.c b/module/thermal_m=
gmt/src/mod_thermal_mgmt.c
+index dbd45c74..6e2ff5ba 100644
+--- a/module/thermal_mgmt/src/mod_thermal_mgmt.c
++++ b/module/thermal_mgmt/src/mod_thermal_mgmt.c
+@@ -20,7 +20,7 @@
+ #include <fwk_mm.h>
+ #include <fwk_module.h>
+ #include <fwk_status.h>
+-#include <fwk_thread.h>
++#include <fwk_core.h>
+=20
+ #include <stdint.h>
+ #include <stdlib.h>
+@@ -372,7 +372,7 @@ static int read_temperature(void)
+         .id =3D mod_thermal_event_id_read_temp,
+     };
+=20
+-    return fwk_thread_put_event(&event);
++    return fwk_put_event(&event);
+ #else
+     int status;
+     uint64_t value;
+@@ -574,22 +574,22 @@ static int thermal_mgmt_process_event(
+     struct fwk_event *resp_event)
+ {
+     struct mod_sensor_event_params *params;
+-    uint64_t value;
++    struct mod_sensor_data ms_data;
+     int status;
+=20
+     if (fwk_id_is_equal(event->id, mod_thermal_event_id_read_temp)) {
+         /* Temperature-reading event */
+         status =3D
+-            mod_ctx.sensor_api->get_value(mod_ctx.config->sensor_id, &val=
ue);
++            mod_ctx.sensor_api->get_data(mod_ctx.config->sensor_id, &ms_d=
ata);
+         if (status =3D=3D FWK_SUCCESS) {
+-            mod_ctx.cur_temp =3D (uint32_t)value;
++            mod_ctx.cur_temp =3D (uint32_t)ms_data.value;
+         }
+     } else if (fwk_id_is_equal(event->id, mod_sensor_event_id_read_reques=
t)) {
+         /* Response event from Sensor HAL */
+         params =3D (struct mod_sensor_event_params *)event->params;
+=20
+-        if (params->status =3D=3D FWK_SUCCESS) {
+-            mod_ctx.cur_temp =3D (uint32_t)params->value;
++        if (params->sensor_data->status =3D=3D FWK_SUCCESS) {
++            mod_ctx.cur_temp =3D (uint32_t)params->sensor_data->value;
+             status =3D FWK_SUCCESS;
+         } else {
+             status =3D FWK_E_DEVICE;
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-tc0-fix-mp=
mm-config.patch b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-tc0-f=
ix-mpmm-config.patch
new file mode 100644
index 00000000..f2044a95
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0002-tc0-fix-mpmm-conf=
ig.patch
@@ -0,0 +1,92 @@
+From 736bd8aeceefd474c15a97e4a4ec99f07ef9a82c Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 11 Feb 2022 18:28:43 +0000
+Subject: [PATCH 2/4] tc0: fix mpmm config
+
+Do not enable MPMM in standard features set.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I7b273a2055452e2e8cd78a0d932514a6f2947ec5
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ product/tc0/scp_ramfw/config_mpmm.c | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/product/tc0/scp_ramfw/config_mpmm.c b/product/tc0/scp_ramfw/c=
onfig_mpmm.c
+index 3bfe99d3..13d866a5 100644
+--- a/product/tc0/scp_ramfw/config_mpmm.c
++++ b/product/tc0/scp_ramfw/config_mpmm.c
+@@ -27,7 +27,6 @@ enum core_pd_idx {
+     CORE7_IDX
+ };
+=20
+-#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VARIANT_STD=
)
+ static struct mod_mpmm_pct_table k_pct[] =3D {
+     { .cores_online =3D 4,
+       .default_perf_limit =3D 1153 * 1000000UL,
+@@ -115,7 +114,6 @@ static struct mod_mpmm_pct_table m_pct[] =3D {
+                           },
+                         } },
+ };
+-#endif
+=20
+ static struct mod_mpmm_pct_table m_elp_pct[] =3D {
+     { .cores_online =3D 1,
+@@ -132,7 +130,6 @@ static struct mod_mpmm_pct_table m_elp_pct[] =3D {
+                         } },
+ };
+=20
+-#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VARIANT_STD=
)
+ static const struct mod_mpmm_core_config k_core_config[] =3D {
+     [0] =3D {
+         .pd_id =3D FWK_ID_ELEMENT_INIT(FWK_MODULE_IDX_POWER_DOMAIN, CORE0=
_IDX),
+@@ -180,7 +177,6 @@ static const struct mod_mpmm_core_config m_core_config=
[] =3D {
+         .core_starts_online =3D false,
+         },
+ };
+-#endif
+=20
+ static const struct mod_mpmm_core_config m_elp_core_config[] =3D {
+     [0] =3D {
+@@ -191,7 +187,6 @@ static const struct mod_mpmm_core_config m_elp_core_co=
nfig[] =3D {
+         },
+ };
+=20
+-#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VARIANT_STD=
)
+ static const struct mod_mpmm_domain_config k_domain_conf[] =3D {
+     [0] =3D {
+         .perf_id =3D FWK_ID_ELEMENT_INIT(
+@@ -219,7 +214,6 @@ static const struct mod_mpmm_domain_config m_domain_co=
nf[] =3D {
+     },
+     [1] =3D {0},
+ };
+-#endif
+=20
+ static const struct mod_mpmm_domain_config m_elp_domain_conf[] =3D {
+     [0] =3D {
+@@ -236,14 +230,6 @@ static const struct mod_mpmm_domain_config m_elp_doma=
in_conf[] =3D {
+ };
+=20
+ static const struct fwk_element element_table[] =3D {
+-#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VAR_EXPERIM=
ENT_POWER)
+-    [0] =3D {
+-        .name =3D "MPMM_MATTERHORN_ELP_ARM_ELEM",
+-        .sub_element_count =3D 1,
+-        .data =3D m_elp_domain_conf,
+-    },
+-    [1] =3D { 0 },
+-#else
+     [0] =3D {
+         .name =3D "MPMM_KLEIN_ELEM",
+         .sub_element_count =3D 4,
+@@ -260,7 +246,6 @@ static const struct fwk_element element_table[] =3D {
+         .data =3D m_elp_domain_conf,
+     },
+     [3] =3D { 0 },
+-#endif
+ };
+=20
+ static const struct fwk_element *mpmm_get_element_table(fwk_id_t module_i=
d)
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0-rename=
-platform-variant-to-platform-feature-set.patch b/meta-arm-bsp/recipes-bsp/=
scp-firmware/files/tc/0003-tc0-rename-platform-variant-to-platform-feature-=
set.patch
new file mode 100644
index 00000000..5e995253
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0003-tc0-rename-platfo=
rm-variant-to-platform-feature-set.patch
@@ -0,0 +1,202 @@
+From 50e63f11762348bcd95d809af248f620f03d9ce4 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Fri, 11 Feb 2022 18:16:54 +0000
+Subject: [PATCH 3/4] tc0: rename platform variant to platform feature set
+
+THe PLATFORM_VARIANT flag was added to differentiate the software
+features enabled in SCP firmware. But this flag misleads to a new
+variant of same platform. This commits renames PLATFORM_VARIANT to
+PLATFORM_FEATURE_SET
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I93c0bc3e11fe18192bb8246df851345bdc473974
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ product/tc0/doc/{variants.md =3D> features.md} | 28 +++++++++-----------
+ product/tc0/scp_ramfw/CMakeLists.txt         | 26 +++---------------
+ product/tc0/scp_ramfw/Firmware.cmake         |  2 +-
+ product/tc0/scp_ramfw/config_scmi_perf.c     |  8 +++---
+ product/tc0/scp_romfw/CMakeLists.txt         |  6 ++---
+ product/tc0/scp_romfw/Firmware.cmake         |  2 +-
+ 6 files changed, 25 insertions(+), 47 deletions(-)
+ rename product/tc0/doc/{variants.md =3D> features.md} (77%)
+
+diff --git a/product/tc0/doc/variants.md b/product/tc0/doc/features.md
+similarity index 77%
+rename from product/tc0/doc/variants.md
+rename to product/tc0/doc/features.md
+index fbf616db..3ef520e2 100644
+--- a/product/tc0/doc/variants.md
++++ b/product/tc0/doc/features.md
+@@ -1,4 +1,4 @@
+-# TC0 Platform Variants
++# TC0 Platform Features
+=20
+ Copyright (c) 2022, Arm Limited. All rights reserved.
+=20
+@@ -7,30 +7,27 @@ Copyright (c) 2022, Arm Limited. All rights reserved.
+=20
+ Documentation for TC0 platform can be found at [1].
+=20
++### Standard
++
++The standard build provides all the features described in [1].
++For this default features, it's not required to provide any extra paramet=
ers in
++the build commands.
++
++### MPMM/Power/Performance (Experimental)
++
+ For the purpose of experimenting some of the software features that have =
been
+-introduced in SCP-firmware a new variant of TC0 has been created.
+-The variant(s) can be chosen at build time by adding:
++introduced in SCP-firmware of TC0. This can be enabled at build time, by =
adding:
+=20
+ ```sh
+=20
+ make -f Makefile.cmake \
+     PRODUCT=3Dtc0 \
+     MODE=3D<debug,release> \
+-    EXTRA_CONFIG_ARGS+=3D-DSCP_PLATFORM_VARIANT=3D<0,1>
++    EXTRA_CONFIG_ARGS+=3D-DSCP_PLATFORM_FEATURE_SET=3D1
+=20
+ ```
+=20
+-
+-### Variant 0 (Standard build)
+-
+-The standard build provides all the features described in [1].
+-For this default variant, it's not required to provide any extra paramete=
rs in
+-the build commands.
+-
+-
+-### Variant 1 (Power/Performance testing)
+-
+-This variant adds support for the following software features:
++This adds support for the following software features:
+ - Traffic Cop
+ - MPMM (Maximum Power Mitigation Mechanism)
+ - Thermal Management
+@@ -63,7 +60,6 @@ Once built, the features above will act as:
+=20
+ ## Limitations
+=20
+-- The "variant" option is available only with the CMake build.
+ - The Thermal functionality is limited at this time cause the constant
+   temperature being sampled.
+=20
+diff --git a/product/tc0/scp_ramfw/CMakeLists.txt b/product/tc0/scp_ramfw/=
CMakeLists.txt
+index 96310320..ce3178ee 100644
+--- a/product/tc0/scp_ramfw/CMakeLists.txt
++++ b/product/tc0/scp_ramfw/CMakeLists.txt
+@@ -11,25 +11,13 @@
+=20
+ add_executable(tc0-bl2)
+=20
++set(SCP_PLATFORM_FEATURE_SET ${SCP_PLATFORM_FEATURE_SET_INIT} CACHE STRIN=
G "1")
+=20
+-# SCP_PLATFORM_VARIANT options:
+-# - 'TC0_VARIANT_STD' for TC0 standard build
+-# - 'TC0_VAR_EXPERIMENT_POWER' for TC0 with power/performance plugins use=
d for
+-#   evaluation purposes
+-
+-
+-target_compile_definitions(tc0-bl2 PUBLIC -DTC0_VARIANT_STD=3D0)
+-target_compile_definitions(tc0-bl2 PUBLIC -DTC0_VAR_EXPERIMENT_POWER=3D1)
+-
+-
+-set(SCP_PLATFORM_VARIANT ${SCP_PLATFORM_VARIANT_INIT} CACHE STRING "1")
+-
+-
+-if (SCP_PLATFORM_VARIANT STREQUAL "1")
+-    message(NOTICE "SCP_PLATFORM_VARIANT set to EXPERIMENT_POWER (tc0-bl2=
)\n")
++if (SCP_PLATFORM_FEATURE_SET STREQUAL "1")
++    message(NOTICE "TC0 platform features MPMM/POWER/PERFORMANCE is exper=
imental (tc0-bl2)\n")
+=20
+     target_compile_definitions(tc0-bl2
+-        PUBLIC -DPLATFORM_VARIANT=3DTC0_VAR_EXPERIMENT_POWER)
++	PUBLIC -DTC0_FEATURES_MPMM_POWER_PERF)
+=20
+     set(SCP_ENABLE_PLUGIN_HANDLER TRUE PARENT_SCOPE)
+     set(SCP_ENABLE_FAST_CHANNELS TRUE PARENT_SCOPE)
+@@ -56,12 +44,6 @@ if (SCP_PLATFORM_VARIANT STREQUAL "1")
+     list(PREPEND SCP_MODULE_PATHS
+         "${CMAKE_CURRENT_LIST_DIR}/../module/tc0_power_model")
+     target_sources(tc0-bl2 PRIVATE "config_tc0_power_model.c")
+-
+-else()
+-    message(NOTICE "SCP_PLATFORM_VARIANT set to STANDARD (tc0-bl2)\n")
+-
+-    target_compile_definitions(tc0-bl2
+-        PUBLIC -DPLATFORM_VARIANT=3DTC0_VARIANT_STD)
+ endif()
+=20
+=20
+diff --git a/product/tc0/scp_ramfw/Firmware.cmake b/product/tc0/scp_ramfw/=
Firmware.cmake
+index 11d8eaab..4a555296 100644
+--- a/product/tc0/scp_ramfw/Firmware.cmake
++++ b/product/tc0/scp_ramfw/Firmware.cmake
+@@ -27,7 +27,7 @@ set(SCP_ENABLE_FAST_CHANNELS_INIT FALSE)
+=20
+ set(SCP_ENABLE_PLUGIN_HANDLER_INIT FALSE)
+=20
+-set(SCP_PLATFORM_VARIANT_INIT 0)
++set(SCP_PLATFORM_FEATURE_SET_INIT 0)
+=20
+ set(SCP_ARCHITECTURE "armv7-m")
+=20
+diff --git a/product/tc0/scp_ramfw/config_scmi_perf.c b/product/tc0/scp_ra=
mfw/config_scmi_perf.c
+index a4a47b3a..3e91939a 100644
+--- a/product/tc0/scp_ramfw/config_scmi_perf.c
++++ b/product/tc0/scp_ramfw/config_scmi_perf.c
+@@ -129,7 +129,7 @@ static const struct mod_scmi_perf_domain_config domain=
s[] =3D {
+     },
+ };
+=20
+-#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VAR_EXPERIM=
ENT_POWER)
++#ifdef TC0_FEATURES_MPMM_POWER_PERF
+ static const struct mod_scmi_plugin_config plugins_table[] =3D {
+     [0] =3D {
+         .id =3D FWK_ID_MODULE_INIT(FWK_MODULE_IDX_TRAFFIC_COP),
+@@ -156,9 +156,9 @@ const struct fwk_module_config config_scmi_perf =3D {
+ #else
+         .fast_channels_alarm_id =3D FWK_ID_NONE_INIT,
+ #endif
+-#if defined(PLATFORM_VARIANT) && (PLATFORM_VARIANT =3D=3D TC0_VAR_EXPERIM=
ENT_POWER)
+-        .plugins =3D plugins_table,
+-        .plugins_count =3D FWK_ARRAY_SIZE(plugins_table),
++#ifdef TC0_FEATURES_MPMM_POWER_PERF
++	.plugins =3D plugins_table,
++	.plugins_count =3D FWK_ARRAY_SIZE(plugins_table),
+ #endif
+     })
+ };
+diff --git a/product/tc0/scp_romfw/CMakeLists.txt b/product/tc0/scp_romfw/=
CMakeLists.txt
+index f9f40ad3..09cd2f5d 100644
+--- a/product/tc0/scp_romfw/CMakeLists.txt
++++ b/product/tc0/scp_romfw/CMakeLists.txt
+@@ -48,6 +48,6 @@ target_include_directories(tc0-bl1
+     PUBLIC $<TARGET_PROPERTY:cmsis::core-m,INTERFACE_INCLUDE_DIRECTORIES>=
)
+=20
+ cmake_dependent_option(
+-    SCP_PLATFORM_VARIANT "Choose platform software variant?"
+-    "${SCP_PLATFORM_VARIANT_INIT}" "DEFINED SCP_PLATFORM_VARIANT_INIT"
+-    "${SCP_PLATFORM_VARIANT}")
++    SCP_PLATFORM_FEATURE_SET "Choose platform software features?"
++    "${SCP_PLATFORM_FEATURE_SET_INIT}" "DEFINED SCP_PLATFORM_FEATURE_SET_=
INIT"
++    "${SCP_PLATFORM_FEATURE_SET}")
+diff --git a/product/tc0/scp_romfw/Firmware.cmake b/product/tc0/scp_romfw/=
Firmware.cmake
+index ab4468be..e1360159 100644
+--- a/product/tc0/scp_romfw/Firmware.cmake
++++ b/product/tc0/scp_romfw/Firmware.cmake
+@@ -21,7 +21,7 @@ set(SCP_ENABLE_NOTIFICATIONS_INIT TRUE)
+=20
+ set(SCP_ENABLE_IPO_INIT FALSE)
+=20
+-set(SCP_PLATFORM_VARIANT_INIT 0)
++set(SCP_PLATFORM_FEATURE_SET_INIT 0)
+=20
+ set(SCP_ARCHITECTURE "armv7-m")
+=20
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0004-tc0-suppor=
t-platform-feature-set-options-in-firmware.patch b/meta-arm-bsp/recipes-bsp=
/scp-firmware/files/tc/0004-tc0-support-platform-feature-set-options-in-fir=
mware.patch
new file mode 100644
index 00000000..aa83332b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/files/tc/0004-tc0-support-platf=
orm-feature-set-options-in-firmware.patch
@@ -0,0 +1,114 @@
+From 3e737dd47b228bdeffb06e39bffec7a4a436b244 Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Wed, 9 Feb 2022 16:02:10 +0000
+Subject: [PATCH 4/4] tc0: support platform feature set options in firmware=
.mk
+
+Support existing platform feature set options that is in cmake to
+firmware.mk. Two feature set for TC0 are
+0. Standard
+1. MPMM/Power/Performance (Experimental)
+
+Build option to select the feature set is using:
+make PRODUCT=3Dtc0 MODE=3D<debug,release> SCP_PLATFORM_FEATURE_SET=3D<0,1>
+
+The default value is set to 0 (Standard).
+Refer product/tc0/doc/features.md for more details.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I4028686a8f8461e0e2c29e15d5e52eb1d37ca60a
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ product/tc0/scp_ramfw/firmware.mk | 41 +++++++++++++++++++++++++++++--
+ product/tc0/scp_romfw/firmware.mk | 12 +++++++++
+ 2 files changed, 51 insertions(+), 2 deletions(-)
+
+diff --git a/product/tc0/scp_ramfw/firmware.mk b/product/tc0/scp_ramfw/fir=
mware.mk
+index ec6e6679..d7515f5b 100644
+--- a/product/tc0/scp_ramfw/firmware.mk
++++ b/product/tc0/scp_ramfw/firmware.mk
+@@ -9,8 +9,24 @@ BS_FIRMWARE_CPU :=3D cortex-m3
+ BS_FIRMWARE_HAS_NOTIFICATION :=3D yes
+ BS_FIRMWARE_HAS_RESOURCE_PERMISSIONS :=3D yes
+ BS_FIRMWARE_USE_NEWLIB_NANO_SPECS :=3D yes
+-BS_FIRMWARE_HAS_FAST_CHANNELS :=3D no
+-BS_FIRMWARE_HAS_PERF_PLUGIN_HANDLER :=3D no
++
++DEFAULT_SCP_PLATFORM_FEATURE_SET :=3D 0
++
++export SCP_PLATFORM_FEATURE_SET ?=3D $(DEFAULT_SCP_PLATFORM_FEATURE_SET)
++ifneq ($(filter-out 0 1, $(SCP_PLATFORM_FEATURE_SET)),)
++    $(error "Invalid for SCP_PLATFORM_FEATURE_SET parameter. Valid option=
s are \
++      0 or 1. Aborting...")
++endif
++
++ifeq ($(SCP_PLATFORM_FEATURE_SET),0)
++    BS_FIRMWARE_HAS_PERF_PLUGIN_HANDLER :=3D no
++    BS_FIRMWARE_HAS_FAST_CHANNELS :=3D no
++else
++    DEFINES +=3D TC0_FEATURES_MPMM_POWER_PERF
++    BS_FIRMWARE_HAS_PERF_PLUGIN_HANDLER :=3D yes
++    BS_FIRMWARE_HAS_FAST_CHANNELS :=3D yes
++    $(info "TC0 platform features POWER/PERFORMANCE is experimental")
++endif
+=20
+ BS_FIRMWARE_MODULES :=3D \
+     armv7m_mpu \
+@@ -44,6 +60,16 @@ ifeq ($(BS_FIRMWARE_HAS_RESOURCE_PERMISSIONS),yes)
+     BS_FIRMWARE_MODULES +=3D resource_perms
+ endif
+=20
++ifeq ($(SCP_PLATFORM_FEATURE_SET),1)
++BS_FIRMWARE_MODULES +=3D \
++        traffic_cop \
++        mpmm \
++        sensor \
++        reg_sensor \
++        thermal_mgmt \
++        tc0_power_model
++endif
++
+ BS_FIRMWARE_SOURCES :=3D \
+     config_system_power.c \
+     config_armv7m_mpu.c \
+@@ -75,4 +101,15 @@ ifeq ($(BS_FIRMWARE_HAS_RESOURCE_PERMISSIONS),yes)
+     BS_FIRMWARE_SOURCES +=3D config_resource_perms.c
+ endif
+=20
++ifeq ($(SCP_PLATFORM_FEATURE_SET),1)
++    BS_FIRMWARE_SOURCES +=3D \
++        config_traffic_cop.c \
++        config_mpmm.c \
++        config_sensor.c \
++        config_reg_sensor.c \
++        config_thermal_mgmt.c \
++        config_tc0_power_model.c
++endif
++
++
+ include $(BS_DIR)/firmware.mk
+diff --git a/product/tc0/scp_romfw/firmware.mk b/product/tc0/scp_romfw/fir=
mware.mk
+index 9977712f..0012b9fa 100644
+--- a/product/tc0/scp_romfw/firmware.mk
++++ b/product/tc0/scp_romfw/firmware.mk
+@@ -9,6 +9,18 @@ BS_FIRMWARE_CPU :=3D cortex-m3
+ BS_FIRMWARE_HAS_NOTIFICATION :=3D yes
+ BS_FIRMWARE_USE_NEWLIB_NANO_SPECS :=3D yes
+=20
++DEFAULT_SCP_PLATFORM_FEATURE_SET :=3D 0
++
++export SCP_PLATFORM_FEATURE_SET ?=3D $(DEFAULT_SCP_PLATFORM_FEATURE_SET)
++ifneq ($(filter-out 0 1, $(SCP_PLATFORM_FEATURE_SET)),)
++    $(error "Invalid for SCP_PLATFORM_FEATURE_SET parameter. Valid option=
s are \
++      0 or 1. Aborting...")
++endif
++
++ifeq ($(SCP_PLATFORM_FEATURE_SET),1)
++    $(info "TC0 platform features POWER/PERFORMANCE is experimental")
++endif
++
+ BS_FIRMWARE_MODULE_HEADERS_ONLY :=3D \
+     power_domain \
+     timer
+--=20
+2.30.2
+
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc b/me=
ta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
index cdf1bb6a..7b304322 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-tc.inc
@@ -1,4 +1,17 @@
-# TC0 specific SCP configuration
+# TC specific SCP configuration
+
+# Intermediate SHA with 2.9 baseline version
+# This has support for SCP features MPMM/POWER/PERFORMANCE for TC0
+SRCREV =3D "027b567fde5e3767fb1678bda28cf59fa7aac06d"
+PV =3D "2.9+git${SRCPV}"
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/tc:"
+SRC_URI:append:tc =3D " \
+    file://0001-tc0-fix-sensor-data-api-call.patch \
+    file://0002-tc0-fix-mpmm-config.patch \
+    file://0003-tc0-rename-platform-variant-to-platform-feature-set.patch =
\
+    file://0004-tc0-support-platform-feature-set-options-in-firmware.patch=
 \
+    "
=20
 COMPATIBLE_MACHINE =3D "(tc?)"
=20
--=20
2.30.2


