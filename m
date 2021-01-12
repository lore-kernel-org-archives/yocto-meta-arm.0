Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web08.10571.1610464876034451652
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tjrUAbKU;
 spf=pass (domain: arm.com, ip: 40.107.20.57, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg243bsYTVkRHCnBFCDt2h89H6ndiIHOdqjdRjy7G3g=;
 b=tjrUAbKUvSTUFrJTi8WnXoynb5nvymrroDvsC5+oYdtOa2AxBjVyXDmL7zvoDsNvGvbOn+8r6oiL1s/3RWdZVmui5Ltsv0o63Cn48rPGSIGU822N0c9r+Udlrj1pzTPUGOa75IBhXpSj2HtKSCx/evTa1WvAfBLn/xSdjcMTvK8=
Received: from DB8PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:110::40)
 by VI1PR08MB4223.eurprd08.prod.outlook.com (2603:10a6:803:b5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 15:21:12 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::67) by DB8PR04CA0030.outlook.office365.com
 (2603:10a6:10:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:12 +0000
Received: ("Tessian outbound 4d8113405d55:v71"); Tue, 12 Jan 2021 15:21:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 444c147fb944f09e
X-CR-MTA-TID: 64aa7808
Received: from 508110629080.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 08399F41-E357-41CC-8DB1-F19DFBF89E92.1;
	Tue, 12 Jan 2021 15:21:06 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 508110629080.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnUFE8clvH13WnCtDiGLQPcJOgsPBSUzifJ41hurLIxyqQqqROlK0QxyJJ6/qhbjeAN2ObSmk1V0v74P7yNpeRiFbVasxFC8bVTteCwuCKcCD8pEqlwkLzJPFgML8aJQtZsPtT3dzlEd0aU8eDLaCsm34XKL9YKsQeosB5Bom7M7HfZow1H67IC8KI+LhPV1p3rYmFAlZhPV4cI8soJSGLV6LM0IMYon6x3QwlFjVmxsEFr3s6/RcrSVdP9AnqqRJjXEamL86G2t4nuXYmArYxrgzHZVdyVm3twGbJDjh5jmTSOqwd+5RMLUpeKu2CmNfJSwfFZsOFyWDIhXbBqzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg243bsYTVkRHCnBFCDt2h89H6ndiIHOdqjdRjy7G3g=;
 b=hyDvNKykUwpQEADM75bBm4tuV9euqCcJjnPc1dUQ6p4yeuedPGgLorRvxRl4Vv5W5tkqLyWWLCYCRGHfx0wUtz0V36EjkID/M6l6Hf2Hxa4OZFtl7DFGmxZ4VC2UbTQew90AI+oY0hbpf18fqbfJy3e3NMv4lVd5DRXNjZxpz05kPA5yzZGcdjY/e8U3ql0GS503WbeqeDgsSlBVnmawVyhbncUqsM4kcKjGOAfGGTmladxG12poXaWh1OEMo6qE/ZAtxfffcyO15elwceftvR1wjMtIhxny3+xO9Az6dtTD5tUyD6e/uBqFW9Doyx92rQ6lRwWAaBsmkmZ5W6JwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg243bsYTVkRHCnBFCDt2h89H6ndiIHOdqjdRjy7G3g=;
 b=tjrUAbKUvSTUFrJTi8WnXoynb5nvymrroDvsC5+oYdtOa2AxBjVyXDmL7zvoDsNvGvbOn+8r6oiL1s/3RWdZVmui5Ltsv0o63Cn48rPGSIGU822N0c9r+Udlrj1pzTPUGOa75IBhXpSj2HtKSCx/evTa1WvAfBLn/xSdjcMTvK8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3053.eurprd08.prod.outlook.com (2603:10a6:803:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 15:21:04 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:04 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 07/10] arm-bsp/linux: add ffa driver to TC0
Date: Tue, 12 Jan 2021 15:20:46 +0000
Message-ID: <20210112152049.3436645-7-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2725479-93fb-4ac1-8ebb-08d8b70db1fe
X-MS-TrafficTypeDiagnostic: VI1PR08MB3053:|VI1PR08MB4223:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4223CAF650D5DBD50C723A0EFBAA0@VI1PR08MB4223.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 43aYCKosAi+O4NYNyCbMLMlcNt8OH8Kz3CkjvKjc9Gpe1f3zcUESpyPCZhLgJQ1KNxnOD11X90/TJ/fnsXTnOOVqt5y5Qq65Km3DssNwOIFMAC1yBGsaqwjYM+oJ2oe0wL9vR7XoaiN5QXTs9b4U9DEoyuFBS8q+GDjVTnZ1J//qG+yLFTcRbNDQTFisjogyXLZVl6V0XJwp6TPtGzljVIRvA3dJ2cNAgy+tinOhliyTImErVKkV8wAY+qaHL7WE7EcScaUOHuuykBf+xDqf52Q72WU8RZU2LV4eN1p5vlkELHyN10rLsZ2jU3imZR3x8ky19ikP5w3VupZjR2k4UhkivpgwYCUx3dseS9OeDdvx8na0byiFIdzGH+rGq73GK2/Hk3Fg09+V4q5QWvvIT4TebhN9+oW1Jgc2acfnqw2ZDqweX32rDJsljGG+Z+d3WZG0k3GnvR2qsbNF16oTZA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(66946007)(30864003)(1076003)(36756003)(6666004)(16526019)(966005)(66476007)(83380400001)(44832011)(186003)(5660300002)(8676002)(4326008)(7696005)(52116002)(2906002)(66556008)(8936002)(2616005)(956004)(6486002)(26005)(6916009)(478600001)(86362001)(316002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ypkBO0yCCu8DL8xr1R/ixNGfrHlnXQ7oyhbHhdXLMmGAOmP4QCRSX9QKUQ0H?=
 =?us-ascii?Q?f5o9qBxzNXzMlxfI99SpZcerkVp5tOM8O3o3JFyBl6naW+XJdM8j/VHIRleR?=
 =?us-ascii?Q?wNuhKyPJJoYyaHrZNZcAgUVqGQ8lUxzDWVJ/hti/ZqjW4a2QxKEwrd9CBFen?=
 =?us-ascii?Q?i2AlXVkaPW5kEZuhEaJjshIKBDiB4/3Io4RsCqDs4hJiZ0X7qjgQjeH6FaEC?=
 =?us-ascii?Q?zArffPAtaTgBAr3AXuu+HUcw3va8luhMU7E/Ziejtdj/Bwz5P2OyEZ/N4OMu?=
 =?us-ascii?Q?OtcgyEpg+i78RtXN6ZO8+Lyu4Ra+sOPhprohsSPpwxNvmzCxeDcyimR9cZ0A?=
 =?us-ascii?Q?opfJIzBnEaM2FeSyPEVuAEjhU3GqyILpEecz9M93pK7gMVqmkcSlS4uHo9Fy?=
 =?us-ascii?Q?n10s7sM0yk677X26goHSn7pyJtJwgQx9IsTr8nGlwI7POEjv9hxNUvi5Xjsk?=
 =?us-ascii?Q?jFv8bN9+kkFfQGayfzsgl7LBCUPfA+5E7Kd2i2vnKH4b2tp9EWqXhPtPerGb?=
 =?us-ascii?Q?sNblHxaU5e6mv5mQ9DKJRNDnmrRELqZ+8bxEj8Oa4L+czk7If95/KV1pNiX5?=
 =?us-ascii?Q?YLdavmYHIOtJSDzr5G4lPB2GpQ6OEJ16SuJif6Wb+M0/UWFA2ufCh2nnt8Fj?=
 =?us-ascii?Q?HAgdwu/nCg/7TDZGEfe/idxOdgd9hITTpm6E46/gpsjM5iJwfScBYPVp2Cd9?=
 =?us-ascii?Q?chwKo/MdoRkPuxQ2Y8qgAz63jNPMjX/C1L0ay03ExhrPyXX8hf8Qd5xcNIPM?=
 =?us-ascii?Q?IY3++5lbBwIT6uNqsJIwBZzm92hpIVcuGAumAvTDmHS2NmYRavnlyKrRtiuy?=
 =?us-ascii?Q?O5+WextbhlBvcx3vCS0c9XsksTEovbp9U4NSMmEkqtAeZGdYGeS5ad5UC2Ju?=
 =?us-ascii?Q?Y5z5ZU2NhvYDlt48uqUXPdiJJqIzTYq2YjmMQUqUbCkvb0SVqWT3+UjX3+kU?=
 =?us-ascii?Q?/idXPI2WvdIbpR9P62XM3LgA9dSDCCX+0b052HwP3/5FQ2BHcrGPJOjDAPgA?=
 =?us-ascii?Q?AjcH?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3b242edc-6f0c-4af0-4c03-08d8b70dad68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	390zkdM0f1Kf8GgWcVUoS1aqKCykD8Xia2uee7TEl2lHcaTtSBjhODSFgSUFUEBbVKIWvfClXcH3Fex9+3AU+n+UXyDrS8BfWpA7F8O9O6m+piJhAQTIczSqB0LrafqttAsVwZBpO9q1ngTSX7TEwZEcPtoKbrTOZtf0ibNTP1Z+UOWM/22N4JCYBm94YtMakVacknGnhiIkkIc/K35LO0Zeg2B24tc2e+0i7Xv6Zr/qioFbKaEAm6cDxEm1fnlJEd/ZCmWQS81XpZl74mrp5QjyUza0qJIHDxw5Ql9OyBnzdZJzsGEsDEUvG1ot9dN4qy5o0GtdahX25Wu38vQcSpi6TfHHCCu2TD5ytnkIGRVQ6NlyGMsA/Cem3D3/g6YP+2G4CNATKoONuxgOSkgQOTydFZCZg8mUNgo1LwmVb9Hh+WSd4I/YA94iPqud8lilQl7bbkehyCQBPAttwsw5KMKB3pZ1CZ3qTCKsaAfbQiMMAaxHk9d2ftypkXpIsSoX8pHEExyj96qXZQsL/NnorS6vbRdT355WIoxrjsXjOAxA1Jk75wjDuuflVCHlLAJX
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(46966006)(2906002)(36756003)(6916009)(44832011)(478600001)(70206006)(34020700004)(5660300002)(82310400003)(356005)(70586007)(82740400003)(956004)(8936002)(6666004)(336012)(16526019)(81166007)(316002)(83380400001)(8676002)(1076003)(6486002)(966005)(86362001)(26005)(47076005)(186003)(7696005)(4326008)(30864003)(2616005)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:12.1562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2725479-93fb-4ac1-8ebb-08d8b70db1fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4223
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This patch contains initial version of ffa driver adopted for
android11-5.4-lts kernel.

This is based on prototype ffa driver released by Arm.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: Idb198cc77368a95257f1b5bff37b17bd13144109
---
 .../linux/linux-arm-platforms.inc             |    1 +
 ...Initial-version-of-ffa-driver-based-.patch | 1461 +++++++++++++++++
 2 files changed, 1462 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0009-driver-firmware-Initial-version-of-ffa-driver-based-.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 1c9fdc1..873f120 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -76,6 +76,7 @@ SRC_URI_append_tc0 =3D " \
     file://0006-mailbox-arm_mhuv2-add-multi-word-transport-protocol-.patch=
 \
     file://0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch \
     file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch=
 \
+    file://0009-driver-firmware-Initial-version-of-ffa-driver-based-.patch=
 \
     "
=20
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0009=
-driver-firmware-Initial-version-of-ffa-driver-based-.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0009-driver-firmware-Initial-v=
ersion-of-ffa-driver-based-.patch
new file mode 100644
index 0000000..e5e1ff6
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0009-driver=
-firmware-Initial-version-of-ffa-driver-based-.patch
@@ -0,0 +1,1461 @@
+Upstream-Status: Pending [https://git.kernel.org/pub/scm/linux/kernel/git/=
sudeep.holla/linux.git/commit/?h=3Dffa_rel_proto&id=3D74aeede25bd737f4930e1=
322f5780ec1c61b9fd5]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 411f4ed69a06f213fb2abb7dbef0be5ce31ff55e Mon Sep 17 00:00:00 2001
+From: Jose Marinho <jose.marinho@arm.com>
+Date: Tue, 29 Oct 2019 09:28:55 +0000
+Subject: [PATCH] driver: firmware: Initial version of ffa driver based on
+ ffa_rel_proto
+
+Initial version of ffa driver based on ffa_rel_proto [1].
+
+[1]: https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.gi=
t/log/?h=3Dffa_rel_proto
+
+Squashed in:
+	 firmware: arm64/spci: Add initial SPCI driver
+
+	 Add initial SPCI driver
+
+	 firmware: spci: add conduit selection from DT
+
+	 The driver can use smc or hvc conduits depending on what is
+	 specified in the spci node in the DT.
+
+	 arm64: spci/smccc: Create smc call returning on x0 to x7
+
+	 The new smc call is SMCCCv1.2 compliant.
+
+	 arm_spci: Register Rx/Tx buffers.
+
+	 Registers the Rx/Tx buffers with the SPCI implementation at a higher EL.
+	 The buffers are restricted to 4KB in this implementation.
+
+	 arm_spci: Add SPCI memory sharing mechanisms.
+
+	 Add mem_share and mem_reclaim to the SPCI driver interface.
+	 These two methods allow for the basic memory sharing use-case where
+	 normal world shares a set of pages with secure world.
+	 The memory region description is in this implementation restricted to
+	 4KB (i.e. it must fit in the Tx buffer of the normal world VM).
+
+	 spci_driver/mem_share: Add lock around TX Buffer
+
+	 Ensure we aquire a lock around the TX buffer when sending information to
+	 prevent race conditions.
+
+	 arm_spci: Expose SPCI_PARTITION_INFO_GET
+
+	 Expose the SPCI_PARTITION_INFO_GET ABI to allow querying the system for
+	 information about a set of partitions identified by a specified UUID.
+
+	 The function expects the 128bit UUID to be discovered passed via 4 32bit
+	 words in the format: UUID_0-UUID_1-UUID_2-UUID3 and a pointer to an
+	 array of `spci_partition_info` structs that will allocated and populated
+	 with the discovered partitions information by the SPCI driver.  The
+	 caller is responsible for freeing this memory allocated by the SPCI
+	 driver.
+
+	 The function returns the number of the partitions found (and therefore
+	 the number of elements in the array) or a negative value indicating the
+	 error code if unsuccessful.
+
+	 This implementation currently disallows use of the NULL UUID.
+
+	 arm_spci: Implement rx_release
+
+	 SPCI: Move driver to directory
+
+	 The SPCI driver has a specific directory at drivers/firmware/spci.
+
+	 SPCI: multi-fragment memory share support
+
+	 arm_spci: use scatterlist in mem_share interface
+
+	 Previously an array of page* was passed in the mem_share interface.
+	 This commit introduces a scatterlist as partameter to mem_share function=
.
+
+	 arm_spci: Add RX_RELEASE return to spci_rx_release
+
+	 A Hypervisor can return SPCI_RX_RELEASE when the PVM calls
+	 SPCI_RX_RELEASE to signal that other VMs need to be scheduled.
+
+	 arm_spci: Change spci_memory_reclaim declaration
+
+	 Function takes an enum mem_clear_t flag to denote if memory should be
+	 cleared upon reclaim.
+
+	 arm_spci: Allow nil UUID in spci_parition_info_get
+
+	 Previously the nil UUID was disallowed.
+
+	 arm_spci: Add support for non-Tx buffer mem_share
+
+	 This commit introduces the buffer*, buffer_size parameters to the
+	 mem_share function. The buffer can be used alternatively to the Tx
+	 buffer. The mem_share function will populate the IPA-contiguous memory
+	 pointed to by buffer using the information in sg.
+
+	 The buffer* must be NULL is mem_share should use the Tx buffer.
+	 The buffer*, if non-NULL, must point to a IPA-contiguous memory region
+	 of size multiple of 4kiB.
+
+	 arm_spci: Support pause/resume in mem_share handle
+
+	 The Hypervisor is allowed to return SPCI_MEM_OPS_PAUSE if a mem_share
+	 operation is taking too long. The PVM must reply with
+	 SPCI_MEM_OPS_RESUME.
+
+	 arm_spci: Ammend debug print.
+
+	 arm_spci: add missing fields in mem descriptor
+
+	 The sender_id, vm_id fields were not properly filled in the mem_share
+	 function.
+
+	 arm_spci: mem_share selection of Tx or alloc buf
+
+	 This commit allows the mem_share invokation to select the  tx buffer or =
a
+	 dynamically allocated buffer to be used for the transfer of the memory
+	 region description.
+
+	 if use_tx =3D=3D true: the tx_lock is held until the memory region is fu=
lly
+	 transmitted.
+
+	 if use_tx =3D=3D false: the tx_lock is very briefly held in the preamble
+	 and postamble of the mem_share procedure.
+
+	 arm_spci: Allow compilation for arm arch [smcccv1_2 bits]
+
+	 arm_spci: Allow compilation for arm arch [arm_spci bits]
+
+	 Implement  SPCI features
+
+	 Currently only SPCI_Direct_Req is checked during SPCI driver
+	 initialisation.
+
+	 arm_spci: add err print when features does not report direct_req support
+
+	 arm_spci: refactor mem_share implementation for EAC [arm_spci bits]
+
+	 arm_spci: introduce support for SPCI_INTERRUPT
+
+	 A SP while executing in the context of a SPCI_MSG_SEND_DIRECT_REQ
+	 may be interrupted. In which case the scheduler must be instructed and
+	 be provided with the necessary information to resume the interrupted SP.
+
+	 arm_ffa: optee: Swap spci/SPCI for ffa/FFA. [arm_ffa bits]
+
+	 arm_ffa: Implement ffa_version discovery.
+
+	 arm_ffa: corrections to EAC support.
+
+	 arm_ffa: cast status return to signed for compare
+
+	 arm_ffa: rename 1st member of arm_smcccv1_2_return [arm-smcccv1_2.h bits=
]
+
+	 The smcccv1_2_return.func is renamed to arg0.
+
+	 arm_ffa: rename 1st member of arm_smcccv1_2_return [arm_ffa bits]
+
+	 The smcccv1_2_return.func is renamed to arg0.
+
+	 arm_ffa: set the default shareability to inner.
+
+	 Pages are shared with inner shareability attribute set in S2.
+
+	 arm_ffa: remove some panic calls
+
+	 Some panics were swaped by pr_warns and an error code return when the
+	 error condition being signaled is predicted by the FFA spec. The panics
+	 issued when an unexpected status is returned from EL2 or
+	 EL3 (behaviour deviating from the FFA spec) are left in the driver.
+
+	 arm_ffa: fix warnings and remove debug print
+
+	 Fixed few warnings related to unused variable and in pr_warn prints
+
+	 arm_ffa: correct checkpatch warnings
+
+	 arm_ffa.h: Split memory access permissions
+
+	 Split the FF-A instruction and data access permissions.
+	 This allows for specifying one attribute but not the other. This is
+	 required for lenders of memory for which must not specify the
+	 instruction access permission.
+
+Signed-off-by: Jose Marinho <jose.marinho@arm.com>
+Signed-off-by: Marc Bonnici <marc.bonnici@arm.com>
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I7bd8cf453e99498ab4df1f01092137a67116d15d
+---
+ arch/arm/kernel/Makefile            |   1 +
+ arch/arm/kernel/smcccv1_2-call.S    |  58 +++
+ arch/arm64/kernel/Makefile          |   2 +-
+ arch/arm64/kernel/smccc_v1_2-call.S |  24 +
+ drivers/firmware/Kconfig            |  11 +
+ drivers/firmware/Makefile           |   1 +
+ drivers/firmware/ffa/Makefile       |   6 +
+ drivers/firmware/ffa/arm_ffa.c      | 782 ++++++++++++++++++++++++++++
+ include/linux/arm-smcccv1_2.h       |  51 ++
+ include/linux/arm_ffa.h             | 235 +++++++++
+ 10 files changed, 1170 insertions(+), 1 deletion(-)
+ create mode 100644 arch/arm/kernel/smcccv1_2-call.S
+ create mode 100644 arch/arm64/kernel/smccc_v1_2-call.S
+ create mode 100644 drivers/firmware/ffa/Makefile
+ create mode 100644 drivers/firmware/ffa/arm_ffa.c
+ create mode 100644 include/linux/arm-smcccv1_2.h
+ create mode 100644 include/linux/arm_ffa.h
+
+diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
+index 8cad59465af3..5be97585d130 100644
+--- a/arch/arm/kernel/Makefile
++++ b/arch/arm/kernel/Makefile
+@@ -101,5 +101,6 @@ obj-$(CONFIG_SMP)		+=3D psci_smp.o
+ endif
+=20
+ obj-$(CONFIG_HAVE_ARM_SMCCC)	+=3D smccc-call.o
++obj-$(CONFIG_HAVE_ARM_SMCCC)	+=3D smcccv1_2-call.o
+=20
+ extra-y :=3D $(head-y) vmlinux.lds
+diff --git a/arch/arm/kernel/smcccv1_2-call.S b/arch/arm/kernel/smcccv1_2-=
call.S
+new file mode 100644
+index 000000000000..9a577c4045a7
+--- /dev/null
++++ b/arch/arm/kernel/smcccv1_2-call.S
+@@ -0,0 +1,58 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (c) 2020, Linaro Limited
++ */
++#include <linux/linkage.h>
++
++#include <asm-generic/export.h>
++#include <asm/opcodes-sec.h>
++#include <asm/opcodes-virt.h>
++#include <asm/unwind.h>
++
++	/*
++	 * Wrap c macros in asm macros to delay expansion until after the
++	 * SMCCC asm macro is expanded.
++	 */
++	.macro SMCCC_SMC
++	__SMC(0)
++	.endm
++
++	.macro SMCCC_HVC
++	__HVC(0)
++	.endm
++
++	.macro SMCCC instr
++UNWIND(	.fnstart)
++	mov	r12, sp
++	push	{r4-r7}
++UNWIND(	.save	{r4-r7})
++	ldm	r12, {r4-r7}
++	\instr
++	ldr	r12, [sp, #(4 * 8)]
++	stm	r12, {r0-r7}
++	pop	{r4-r7}
++	bx	lr
++UNWIND(	.fnend)
++	.endm
++
++/*
++ * void smccc_smc(unsigned long a0, unsigned long a1, unsigned long a2,
++ *		  unsigned long a3, unsigned long a4, unsigned long a5,
++ *		  unsigned long a6, unsigned long a7, struct arm_smccc_res *res,
++ *		  struct arm_smccc_quirk *quirk)
++ */
++ENTRY(__arm_smcccv1_2_smc)
++	SMCCC SMCCC_SMC
++ENDPROC(__arm_smcccv1_2_smc)
++EXPORT_SYMBOL(__arm_smcccv1_2_smc)
++
++/*
++ * void smccc_hvc(unsigned long a0, unsigned long a1, unsigned long a2,
++ *		  unsigned long a3, unsigned long a4, unsigned long a5,
++ *		  unsigned long a6, unsigned long a7, struct arm_smccc_res *res,
++ *		  struct arm_smccc_quirk *quirk)
++ */
++ENTRY(__arm_smcccv1_2_hvc)
++	SMCCC SMCCC_HVC
++ENDPROC(__arm_smcccv1_2_hvc)
++EXPORT_SYMBOL(__arm_smcccv1_2_hvc)
+diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
+index b3995329d9e5..4327ef6f4f8d 100644
+--- a/arch/arm64/kernel/Makefile
++++ b/arch/arm64/kernel/Makefile
+@@ -19,7 +19,7 @@ obj-y			:=3D debug-monitors.o entry.o irq.o fpsimd.o		\
+ 			   return_address.o cpuinfo.o cpu_errata.o		\
+ 			   cpufeature.o alternative.o cacheinfo.o		\
+ 			   smp.o smp_spin_table.o topology.o smccc-call.o	\
+-			   syscall.o
++			   syscall.o smccc_v1_2-call.o
+=20
+ extra-$(CONFIG_EFI)			:=3D efi-entry.o
+=20
+diff --git a/arch/arm64/kernel/smccc_v1_2-call.S b/arch/arm64/kernel/smccc=
_v1_2-call.S
+new file mode 100644
+index 000000000000..518e849409ed
+--- /dev/null
++++ b/arch/arm64/kernel/smccc_v1_2-call.S
+@@ -0,0 +1,24 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2019 Arm Ltd.
++ */
++
++#include <linux/linkage.h>
++
++.macro SMC_CALL conduit
++	\conduit #0
++	ldr x8, [sp]
++	stp x0, x1, [x8]
++	stp x2, x3, [x8, #16]
++	stp x4, x5, [x8, #32]
++	stp x6, x7, [x8, #48]
++	ret
++.endm
++
++ENTRY(__arm_smcccv1_2_hvc)
++	SMC_CALL hvc
++ENDPROC(__arm_smcccv1_2_hvc)
++
++ENTRY(__arm_smcccv1_2_smc)
++	SMC_CALL smc
++ENDPROC(__arm_smcccv1_2_smc)
+diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
+index 1bc0e965f2e9..3bcf3d4514e4 100644
+--- a/drivers/firmware/Kconfig
++++ b/drivers/firmware/Kconfig
+@@ -77,6 +77,17 @@ config ARM_SDE_INTERFACE
+ 	  standard for registering callbacks from the platform firmware
+ 	  into the OS. This is typically used to implement RAS notifications.
+=20
++config ARM_FFA_TRANSPORT
++	bool "ARM Secure Partition Client Interface (FFA)"
++	depends on ARM64 || ARM
++	help
++	  The Secure Partition Client Interface (FFA) is an Arm standard for
++	  communication and memory sharing between entities managed by SMCCC
++	  compliant firmware.
++
++	  This driver provides interface for all the client drivers making
++	  use of the features offered by FFA.
++
+ config EDD
+ 	tristate "BIOS Enhanced Disk Drive calls determine boot disk"
+ 	depends on X86
+diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
+index 64f5391e5749..10041c5f4d07 100644
+--- a/drivers/firmware/Makefile
++++ b/drivers/firmware/Makefile
+@@ -29,6 +29,7 @@ obj-$(CONFIG_TURRIS_MOX_RWTM)	+=3D turris-mox-rwtm.o
+=20
+ obj-$(CONFIG_ARM_SCMI_PROTOCOL)	+=3D arm_scmi/
+ obj-y				+=3D psci/
++obj-y				+=3D ffa/
+ obj-y				+=3D broadcom/
+ obj-y				+=3D meson/
+ obj-$(CONFIG_GOOGLE_FIRMWARE)	+=3D google/
+diff --git a/drivers/firmware/ffa/Makefile b/drivers/firmware/ffa/Makefile
+new file mode 100644
+index 000000000000..37f4ccae197b
+--- /dev/null
++++ b/drivers/firmware/ffa/Makefile
+@@ -0,0 +1,6 @@
++# SPDX-License-Identifier: GPL-2.0
++#
++# Makefile for the linux kernel.
++#
++obj-$(CONFIG_ARM_FFA_TRANSPORT)	+=3D arm_ffa.o
++ccflags-y +=3D -Og
+diff --git a/drivers/firmware/ffa/arm_ffa.c b/drivers/firmware/ffa/arm_ffa=
.c
+new file mode 100644
+index 000000000000..21838f8c4632
+--- /dev/null
++++ b/drivers/firmware/ffa/arm_ffa.c
+@@ -0,0 +1,782 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Secure Partitions Communication Interface (FFA) Protocol driver
++ *
++ * FFA is a system message passing and memory sharing protocol allowing f=
or
++ * execution contexts to exchange information with other execution contex=
ts
++ * residing on other Secure Partitions or Virtual Machines managed by any=
 FFA
++ * compliant firmware framework.
++ *
++ * Copyright (C) 2019, 2020 Arm Ltd.
++ */
++#define DEBUG
++
++#include <linux/platform_device.h>
++#include <linux/arm_ffa.h>
++#include <linux/arm-smcccv1_2.h>
++#include <linux/of_address.h>
++#include <linux/of_platform.h>
++#include <linux/module.h>
++#include <linux/mm.h>
++#include <linux/mutex.h>
++#include <linux/slab.h>
++#include <linux/scatterlist.h>
++
++
++static DEFINE_MUTEX(rx_lock);
++static DEFINE_MUTEX(tx_lock);
++
++static ffa_sp_id_t vm_id;
++
++static struct page *rx_buffer;
++static struct page *tx_buffer;
++
++static struct arm_smcccv1_2_return
++(*arm_ffa_smccc)(u32 func, u64 arg1, u64 arg2, u64 arg3, u64 arg4,
++		  u64 arg5, u64 arg6, u64 arg7);
++
++#define FFA_DEFINE_CALL(conduit)					\
++static struct arm_smcccv1_2_return					\
++arm_ffa_##conduit(u32 func, u64 arg1, u64 arg2, u64 arg3, u64 arg4,	\
++		   u64 arg5, u64 arg6, u64 arg7)			\
++{									\
++	struct arm_smcccv1_2_return smccc_ret;				\
++									\
++	__arm_smcccv1_2_##conduit(func, arg1, arg2, arg3, arg4, arg5,	\
++				  arg6,	arg7, &smccc_ret);		\
++									\
++	return smccc_ret;						\
++}
++
++FFA_DEFINE_CALL(smc)
++FFA_DEFINE_CALL(hvc)
++
++static u32 sender_receiver_pack(u32 src_id, u32 dst_id)
++{
++	return (((src_id << 16) & 0xffff0000) | (dst_id & 0xffff));
++}
++
++int ffa_msg_send(ffa_sp_id_t dst_id, u32 len, u32 attributes)
++{
++	struct arm_smcccv1_2_return msg_send_return;
++
++	/* w1[32:16] Sender endpoint ID, w1[15:0] destination endpoint id. */
++	u32 sender_receiver =3D sender_receiver_pack(vm_id, dst_id);
++
++	msg_send_return =3D arm_ffa_smccc(FFA_MSG_SEND_32, sender_receiver,
++					 0, len, attributes, 0, 0, 0);
++
++	if (msg_send_return.arg0  =3D=3D FFA_ERROR_32) {
++		switch ((int)msg_send_return.arg2) {
++		case FFA_INVALID_PARAMETERS:
++			return -ENXIO;
++		case FFA_DENIED:
++		case FFA_BUSY:
++			return -EAGAIN;
++		default:
++			panic("%s: Unhandled return code (%lld)\n", __func__,
++			      msg_send_return.arg2);
++		}
++	}
++	return 0;
++}
++
++struct arm_smcccv1_2_return
++ffa_msg_send_direct_req(ffa_sp_id_t dst_id, u64 w3, u64 w4, u64 w5,
++			 u64 w6, u64 w7)
++{
++	struct arm_smcccv1_2_return ret;
++
++	/* w1[32:16] Sender endpoint ID, w1[15:0] destination endpoint id. */
++	u32 sender_receiver =3D sender_receiver_pack(vm_id, dst_id);
++
++	ret =3D arm_ffa_smccc(FFA_MSG_SEND_DIRECT_REQ_32, sender_receiver, 0,
++			     w3, w4, w5, w6, w7);
++
++	while (ret.arg0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 &&
++		ret.arg0 !=3D FFA_SUCCESS_32) {
++		if (ret.arg0 =3D=3D FFA_ERROR_32) {
++			pr_err("%s: Error sending message %llu\n", __func__,
++				ret.arg0);
++			switch ((int)ret.arg1) {
++			case FFA_INVALID_PARAMETERS:
++				ret.arg0 =3D -ENXIO;
++				goto out;
++
++			case FFA_DENIED:
++			case FFA_NOT_SUPPORTED:
++				ret.arg0 =3D -EIO;
++				goto out;
++
++			case FFA_BUSY:
++				ret.arg0 =3D -EAGAIN;
++				goto out;
++			}
++		} else if (ret.arg0 =3D=3D FFA_INTERRUPT_32) {
++			ret =3D arm_ffa_smccc(FFA_RUN_32, ret.arg1,
++				0, 0, 0, 0, 0, 0);
++		}
++
++	}
++
++	ret.arg0 =3D 0;
++
++out:
++	return ret;
++}
++
++static int ffa_share_next_frag(u64 handle, u32 frag_len, u32 *tx_offset)
++{
++
++	struct arm_smcccv1_2_return smccc_return;
++	u32 handle_high =3D (handle >> 32) & 0xffffffff;
++	u32 handle_low =3D handle & 0xffffffff;
++
++	smccc_return =3D
++		arm_ffa_smccc(FFA_MEM_FRAG_TX_32, handle_low,
++			handle_high, frag_len, 0, 0, 0, 0);
++
++	while (smccc_return.arg0 !=3D FFA_MEM_FRAG_RX_32) {
++
++		if (smccc_return.arg0 =3D=3D FFA_ERROR_32) {
++			switch ((int)smccc_return.arg2) {
++			case FFA_INVALID_PARAMETERS:
++				return -ENXIO;
++			case FFA_NOT_SUPPORTED:
++				return -ENODEV;
++			default:
++				pr_warn("%s: Unknown Error code %llx\n",
++					__func__, smccc_return.arg2);
++				return -EIO;
++			}
++		}
++
++		if (smccc_return.arg0 =3D=3D FFA_MEM_OP_PAUSE_32) {
++
++			smccc_return =3D arm_ffa_smccc(FFA_MEM_OP_RESUME_32,
++				smccc_return.arg1, smccc_return.arg2, 0, 0, 0,
++				0, 0);
++		}
++	}
++
++	*tx_offset =3D smccc_return.arg3;
++
++	return 0;
++}
++
++static int ffa_share_init_frag(phys_addr_t buffer, u32 buffer_size,
++	u32 fragment_len, u32 total_len, u64 *handle)
++{
++
++	struct arm_smcccv1_2_return smccc_return;
++
++	smccc_return =3D
++		arm_ffa_smccc(FFA_MEM_SHARE_64, total_len, fragment_len, buffer,
++		buffer_size, 0, 0, 0);
++
++	while (smccc_return.arg0 !=3D FFA_SUCCESS_32) {
++
++		if (smccc_return.arg0 =3D=3D FFA_ERROR_32) {
++			switch ((int)smccc_return.arg2) {
++			case FFA_INVALID_PARAMETERS:
++				return -ENXIO;
++			case FFA_DENIED:
++				return -EIO;
++			case FFA_NO_MEMORY:
++				return -ENOMEM;
++			case FFA_ABORTED:
++				return -EAGAIN;
++			default:
++				pr_warn("%s: Unknown Error code %llx\n",
++					__func__, smccc_return.arg2);
++				return -EIO;
++			}
++		}
++
++		if (smccc_return.arg0 =3D=3D FFA_MEM_OP_PAUSE_32) {
++
++			smccc_return =3D arm_ffa_smccc(FFA_MEM_OP_RESUME_32,
++				smccc_return.arg1, smccc_return.arg2, 0, 0, 0,
++				0, 0);
++		}
++	}
++
++	*handle =3D (smccc_return.arg3 << 32) | smccc_return.arg2;
++
++	return 0;
++}
++
++static inline u32 compute_composite_offset(u32 num_attributes)
++{
++	u32 composite_offset =3D offsetof(struct ffa_mem_region,
++		endpoints[num_attributes]);
++
++	/* ensure composite are 8 byte aligned. */
++	if (composite_offset & 0x7)
++		return (composite_offset & (~(u32)0x7)) + 0x8;
++
++	return composite_offset;
++}
++
++static inline u32 compute_constituent_offset(u32 num_attributes)
++{
++	u32 constituent_offset =3D offsetof(struct ffa_mem_region,
++		endpoints[num_attributes]) +
++		offsetof(struct ffa_composite_memory_region, constituents[0]);
++
++	/* ensure constituents are 8 byte aligned. */
++	if (constituent_offset & 0x7)
++		return (constituent_offset & (~(u32)0x7)) + 0x8;
++
++	return constituent_offset;
++}
++
++static inline u32 compute_region_length(u32 num_constituents,
++	u32 num_attributes)
++{
++	/* This assumes that there is a single ffa_composite_memory_region. */
++	return compute_constituent_offset(num_attributes) +
++		sizeof(struct ffa_mem_region_constituent)*num_constituents;
++}
++
++static int ffa_rx_release(void)
++{
++	struct arm_smcccv1_2_return rx_release_return;
++
++	rx_release_return =3D arm_ffa_smccc(FFA_RX_RELEASE_32,
++					      0, 0, 0, 0, 0, 0, 0);
++
++	if (rx_release_return.arg0 =3D=3D FFA_ERROR_32) {
++		switch ((int)rx_release_return.arg2) {
++		case FFA_DENIED:
++			return -EAGAIN;
++		default:
++			panic("%s: Unhandled return code (%lld)\n", __func__,
++			      rx_release_return.arg2);
++		}
++	}
++
++	if (rx_release_return.arg0 =3D=3D FFA_RX_RELEASE_32) {
++		/*
++		 * FFA implementation returned FFA_RX_RELEASE which signals
++		 * the PVM that other VMs need to be scheduled.
++		 */
++		return 1;
++	}
++
++	return 0;
++}
++
++static uint32_t ffa_get_num_pages_sg(struct scatterlist *sg)
++{
++	uint32_t num_pages =3D 0;
++
++	do {
++		num_pages +=3D sg->length/PAGE_SIZE;
++	} while ((sg =3D sg_next(sg)));
++
++	return num_pages;
++}
++
++static inline struct ffa_memory_region_attribute ffa_set_region_normal(
++	enum ffa_mem_cacheability cacheability,
++	enum ffa_mem_shareability shareability)
++{
++	struct ffa_memory_region_attribute attr =3D {0};
++
++	attr.attribute =3D (FFA_MEM_NORMAL << FFA_MEMTYPE_OFFSET) |
++		(cacheability << FFA_CACHEABILITY_OFFSET) | shareability;
++
++	return attr;
++}
++
++static inline struct ffa_memory_region_attribute ffa_set_region_device(
++	enum ffa_mem_device_type device_type)
++{
++	struct ffa_memory_region_attribute attr =3D {0};
++
++	attr.attribute =3D (FFA_MEM_DEVICE << FFA_MEMTYPE_OFFSET) |
++		(device_type << FFA_DEVICE_OFFSET);
++
++	return attr;
++}
++
++static inline int ffa_transmit_fragment(u32 *tx_offset, phys_addr_t buffe=
r,
++	u32 buffer_size, u32 frag_len, u32 total_len, u64 *handle)
++{
++	int rc;
++
++	if (*tx_offset =3D=3D 0) {
++		rc =3D ffa_share_init_frag(buffer, buffer_size,
++			frag_len, total_len, handle);
++
++		*tx_offset =3D frag_len;
++	} else
++		rc =3D ffa_share_next_frag(*handle, frag_len, tx_offset);
++
++
++	return rc;
++}
++
++/*
++ * Share a set of pages with a list of destination endpoints.
++ * Returns a system-wide unique handle
++ */
++static int _ffa_share_memory(u32 tag, enum mem_clear_t flags,
++	struct ffa_mem_region_attributes *attrs,
++	u32 num_attrs, struct scatterlist *sg, u32 nents,
++	ffa_mem_handle_t *handle, phys_addr_t buffer, uint32_t buffer_size)
++{
++	struct ffa_mem_region *mem_region;
++	u32 index;
++	u32 num_constituents;
++	struct ffa_mem_region_constituent *constituents;
++	u32 total_len;
++	u32 fragment_len =3D sizeof(struct ffa_mem_region);
++	u32 max_fragment_size;
++	int rc =3D 0;
++	u32 tx_offset =3D 0;
++	struct ffa_composite_memory_region *composite =3D NULL;
++
++	if (buffer) {
++
++		BUG_ON(!buffer_size);
++		max_fragment_size =3D buffer_size * FFA_BASE_GRANULE_SIZE;
++		mem_region =3D phys_to_virt(buffer);
++
++	} else {
++
++		BUG_ON(buffer_size);
++		mem_region =3D (struct ffa_mem_region *)page_address(tx_buffer);
++		max_fragment_size =3D FFA_BASE_GRANULE_SIZE;
++
++	}
++
++	mem_region->flags =3D flags;
++	mem_region->tag =3D tag;
++	mem_region->sender_id =3D vm_id;
++	mem_region->region_attr =3D ffa_set_region_normal(FFA_WRITE_BACK,
++		FFA_INNER_SHAREABLE);
++	composite =3D ffa_get_composite(mem_region, num_attrs);
++	composite->total_page_count =3D ffa_get_num_pages_sg(sg);
++
++	fragment_len =3D compute_constituent_offset(num_attrs);
++
++	/* Ensure attribute description fits within the Tx buffer. */
++	if (fragment_len > max_fragment_size)
++		return -ENXIO;
++
++	constituents =3D (struct ffa_mem_region_constituent *)
++		(((void *)mem_region) + fragment_len);
++
++	composite->constituent_count =3D nents;
++	total_len =3D compute_region_length(nents, num_attrs);
++
++	for (index =3D 0; index < num_attrs; index++) {
++		mem_region->endpoints[index].receiver =3D attrs[index].receiver;
++		mem_region->endpoints[index].attrs =3D
++			attrs[index].attrs;
++
++		mem_region->endpoints[index].composite_off =3D
++			compute_composite_offset(num_attrs);
++	}
++	mem_region->endpoint_count =3D num_attrs;
++
++	num_constituents =3D 0;
++
++	do {
++		phys_addr_t address;
++
++		/*
++		 * If current fragment size equal Tx size trigger fragment
++		 * transfer.
++		 */
++		if (fragment_len =3D=3D max_fragment_size) {
++
++			/* Transmit fragment. */
++			rc =3D ffa_transmit_fragment(&tx_offset, buffer,
++				buffer_size, fragment_len, total_len, handle);
++
++			if (rc < 0)
++				return -ENXIO;
++
++
++			constituents =3D
++				(struct ffa_mem_region_constituent *)mem_region;
++
++			num_constituents =3D 0;
++			fragment_len =3D 0;
++		}
++
++		address =3D sg_phys(sg);
++
++		/*
++		 * Detect if any part of the constituent region surpasses the Tx
++		 * region.
++		 */
++		if (((void *) &constituents[num_constituents])
++			- (void *)mem_region > max_fragment_size) {
++			pr_err("%s: memory region fragment greater that the Tx buffer",
++				__func__);
++			return -EFAULT;
++		}
++#if 0
++		pr_devel("arm_ffa mem_share pa=3D%#lX\n", address);
++#endif
++		constituents[num_constituents].address =3D address;
++		constituents[num_constituents].page_count =3D
++			sg->length/PAGE_SIZE;
++		num_constituents++;
++		fragment_len +=3D sizeof(struct ffa_mem_region_constituent);
++
++
++	} while ((sg =3D sg_next(sg)));
++
++	rc =3D ffa_transmit_fragment(&tx_offset, buffer, buffer_size,
++		fragment_len, total_len, handle);
++
++	return rc;
++}
++
++/*
++ * Share a set of pages with a list of destination endpoints.
++ *
++ * Returns a system-wide unique handle
++ */
++static int ffa_share_memory(u32 tag, enum mem_clear_t flags,
++	struct ffa_mem_region_attributes *attrs,
++	u32 num_attrs, struct scatterlist *sg, u32 nents,
++	ffa_mem_handle_t *global_handle, bool use_tx)
++{
++	u32 buffer_size =3D 0;
++	phys_addr_t buffer_pa =3D 0;
++	int ret;
++	struct page *buffer_page =3D NULL;
++
++	if (!use_tx) {
++		/* Allocate buffer for this mem_share operation. */
++		buffer_page =3D alloc_page(GFP_KERNEL);
++		if (IS_ERR_OR_NULL(buffer_page)) {
++			/* print error. Return as tx lock is not held. */
++			pr_err("%s: unable to allocate buffer", __func__);
++			return -ENOMEM;
++		}
++
++		buffer_pa =3D page_to_phys(buffer_page);
++
++		buffer_size =3D 1;
++	}
++
++	if (use_tx)
++		mutex_lock(&tx_lock);
++
++	ret =3D _ffa_share_memory(tag, flags, attrs, num_attrs, sg, nents,
++		global_handle, buffer_pa, buffer_size);
++
++	if (use_tx)
++		mutex_unlock(&tx_lock);
++
++	return ret;
++}
++
++static int ffa_memory_reclaim(ffa_mem_handle_t global_handle,
++	enum mem_clear_t flags)
++{
++
++	struct arm_smcccv1_2_return smccc_return;
++	u32 handle_high =3D (global_handle >> 32) & 0xffffffff;
++	u32 handle_low =3D global_handle & 0xffffffff;
++
++	smccc_return =3D arm_ffa_smccc(FFA_MEM_RECLAIM_32, handle_low,
++		handle_high, flags, 0, 0, 0, 0);
++
++	if (smccc_return.arg0 =3D=3D FFA_ERROR_32) {
++		pr_err("%s: Error sending message %llu\n", __func__,
++			smccc_return.arg0);
++		switch ((int)smccc_return.arg2) {
++		case FFA_INVALID_PARAMETERS:
++			return -ENXIO;
++		case FFA_DENIED:
++		case FFA_NOT_SUPPORTED:
++			return -EIO;
++		case FFA_BUSY:
++			return -EAGAIN;
++		default:
++			pr_warn("%s: Unknown Error code %llx\n", __func__,
++				smccc_return.arg2);
++			return -EIO;
++		}
++	}
++
++	return 0;
++}
++
++/*
++ * Returns a negative value if function not supported. Otherwise returns =
w2,
++ * supplying optional feature parameter else 0.
++ */
++
++static int ffa_features(uint32_t function_id)
++{
++	struct arm_smcccv1_2_return features_return =3D
++		arm_ffa_smccc(FFA_FEATURES_32, function_id, 0, 0, 0, 0, 0, 0);
++
++	if (features_return.arg0 =3D=3D FFA_ERROR_32) {
++		switch ((int)features_return.arg2) {
++		case FFA_NOT_SUPPORTED:
++			return -ENODEV;
++		default:
++			panic("%s: Unhandled return code (%lld)\n", __func__,
++			      features_return.arg2);
++		}
++	} else {
++		return features_return.arg2;
++	}
++}
++
++static ffa_sp_id_t ffa_id_get(ffa_sp_id_t *vm_id_p)
++{
++	struct  arm_smcccv1_2_return id_get_return =3D
++		arm_ffa_smccc(FFA_ID_GET_32, 0, 0, 0, 0, 0, 0, 0);
++
++	if (id_get_return.arg0 =3D=3D FFA_ERROR_32) {
++		pr_warn("%s: failed to obtain vm id\n", __func__);
++		return -EIO;
++	}
++
++	*vm_id_p =3D id_get_return.arg2 & 0xffff;
++
++	return 0;
++}
++
++static int ffa_partition_info_get(uint32_t uuid0, uint32_t uuid1,
++				     uint32_t uuid2, uint32_t uuid3,
++				     struct ffa_partition_info **buffer)
++{
++	int rc =3D 0;
++	uint32_t count;
++	struct ffa_partition_info *info =3D
++		(struct ffa_partition_info *) page_address(rx_buffer);
++	struct arm_smcccv1_2_return partition_info_get_return;
++
++	mutex_lock(&rx_lock);
++	partition_info_get_return =3D arm_ffa_smccc(FFA_PARTITION_INFO_GET_32,
++						   uuid0, uuid1, uuid2, uuid3,
++						   0, 0, 0);
++
++	if (partition_info_get_return.arg0 =3D=3D FFA_ERROR_32) {
++		switch ((int)partition_info_get_return.arg2) {
++		case FFA_INVALID_PARAMETERS:
++			rc =3D -ENXIO;
++			goto err;
++		case FFA_NO_MEMORY:
++			rc =3D -ENOMEM;
++			goto err;
++		case FFA_NOT_SUPPORTED:
++			rc =3D -ENODEV;
++			goto err;
++		default:
++			panic("%s: Unhandled return code (%lld)\n", __func__,
++			      partition_info_get_return.arg2);
++		}
++	}
++
++	count =3D partition_info_get_return.arg2;
++
++	/* Allocate and copy the info structs.
++	 * Client is responsible for freeing.
++	 */
++	*buffer =3D kzalloc(sizeof(struct ffa_partition_info) * count,
++			  GFP_KERNEL);
++	if (*buffer =3D=3D NULL) {
++		rc =3D -ENOMEM;
++		goto err;
++	}
++	memcpy(*buffer, info, sizeof(struct ffa_partition_info) * count);
++
++	ffa_rx_release();
++
++	rc =3D count;
++err:
++	mutex_unlock(&rx_lock);
++
++	return rc;
++}
++
++static struct ffa_ops ffa_ops =3D {
++	.async_msg_send =3D ffa_msg_send,
++	.sync_msg_send =3D ffa_msg_send_direct_req,
++	.mem_share =3D ffa_share_memory,
++	.mem_reclaim =3D ffa_memory_reclaim,
++	.partition_info_get =3D ffa_partition_info_get,
++};
++
++struct ffa_ops *get_ffa_ops(void)
++{
++	return &ffa_ops;
++}
++EXPORT_SYMBOL_GPL(get_ffa_ops);
++
++static int ffa_dt_init(struct device_node *np)
++{
++	const char *conduit;
++
++	pr_info("FFA: obtaining conduit from DT.\n");
++
++	if (of_property_read_string(np, "conduit", &conduit)) {
++		pr_warn("FFA: cannot find conduit in DT\n");
++		return -ENXIO;
++	}
++
++	if (!strcmp("smc", conduit))
++		arm_ffa_smccc =3D arm_ffa_smc;
++	else if (!strcmp("hvc", conduit))
++		arm_ffa_smccc =3D arm_ffa_hvc;
++	else {
++		pr_warn("%s: unrecognized FFA conduit\n", __func__);
++		return -EIO;
++	}
++
++	return 0;
++}
++
++static const struct of_device_id ffa_of_match[] =3D {
++	{.compatible =3D "arm,ffa"},
++	{},
++};
++
++static int ffa_rxtx_map(uintptr_t tx_page, uintptr_t rx_page)
++{
++	struct arm_smcccv1_2_return map_return;
++
++	map_return =3D arm_ffa_smccc(FFA_RXTX_MAP_32, tx_page,
++					 rx_page, 1, 0, 0, 0, 0);
++
++	if (map_return.arg0 =3D=3D FFA_ERROR_32) {
++		switch ((int)map_return.arg2) {
++		case FFA_INVALID_PARAMETERS:
++			return -ENXIO;
++		case FFA_DENIED:
++			return -EAGAIN;
++		case FFA_NO_MEMORY:
++			return -ENOMEM;
++		case FFA_NOT_SUPPORTED:
++			return -ENODEV;
++
++		default:
++			panic("%s: Unhandled return code (%lld)\n", __func__,
++			      map_return.arg2);
++		}
++	}
++
++	return 0;
++}
++
++static int ffa_version_check(void)
++{
++	struct arm_smcccv1_2_return version_return;
++	u16 major =3D 1;
++	u16 minor =3D 0;
++	u32 hv_version;
++
++	version_return =3D arm_ffa_smccc(FFA_VERSION_32, ((u32)major<<16)|minor,
++		 0, 0, 0, 0, 0, 0);
++
++	if ((int)version_return.arg0 =3D=3D FFA_NOT_SUPPORTED) {
++		pr_err("%s: FFA ABI is not supported at higher exception levels\n",
++			__func__);
++		return -ENODEV;
++	}
++
++	hv_version =3D version_return.arg0;
++
++	if ((hv_version>>16) =3D=3D major)
++		if ((hv_version & 0xffff) >=3D minor)
++			return 0;
++
++	pr_err("%s: incompatible FFA ABI at higher exception level (%x)\n",
++		__func__, hv_version);
++	return -ENODEV;
++}
++
++static int ffa_probe(struct platform_device *pdev)
++{
++	int ret;
++
++	ret =3D ffa_dt_init(pdev->dev.of_node);
++	if (ret) {
++		pr_warn("%s: FFA driver initialization failed\n", __func__);
++		return ret;
++	}
++
++	ret =3D ffa_version_check();
++	if (ret)
++		return ret;
++
++	/* Initialize VM ID. */
++	ret =3D ffa_id_get(&vm_id);
++	if (ret) {
++		pr_warn("%s: failed to obtain own FFA endpoint ID\n", __func__);
++		return ret;
++	}
++
++	if (ffa_features(FFA_MSG_SEND_DIRECT_REQ_32)) {
++		pr_err("%s: FFA implementation at EL2 does not support FFA_MSG_SEND_DIR=
ECT_REQ_32\n",
++			__func__);
++		return -ENXIO;
++	}
++
++	/* Allocate Rx buffer. */
++	rx_buffer =3D alloc_page(GFP_KERNEL);
++
++	/*
++	 * Ensure buffer was correctly allocated and that the refcout was
++	 * incremented.
++	 */
++	if (!rx_buffer || !try_get_page(rx_buffer)) {
++		pr_err("%s: failed to allocate FFA Rx buffer\n", __func__);
++		return -ENOMEM;
++	}
++
++	/* Allocate Tx buffer. */
++	tx_buffer =3D alloc_page(GFP_KERNEL);
++
++	/*
++	 * Ensure buffer was correctly allocated and that the refcout was
++	 * incremented.
++	 */
++	if (!tx_buffer || !try_get_page(rx_buffer)) {
++		put_page(rx_buffer);
++		__free_page(rx_buffer);
++
++		pr_err("%s: failed to allocate FFA Tx buffer\n", __func__);
++		return -ENOMEM;
++	}
++
++	/* Register the RxTx buffers with the FFA supervisor implementation. */
++	ret =3D ffa_rxtx_map(page_to_phys(tx_buffer), page_to_phys(rx_buffer));
++	if (ret) {
++		put_page(rx_buffer);
++		put_page(tx_buffer);
++		__free_page(rx_buffer);
++		__free_page(tx_buffer);
++
++		pr_err("%s: failed to register FFA RxTx buffers\n", __func__);
++		return ret;
++	}
++
++	return 0;
++}
++
++static struct platform_driver ffa_driver =3D {
++	.driver =3D {
++		.name =3D "ffa_protocol",
++		.of_match_table =3D ffa_of_match,
++	},
++	.probe =3D ffa_probe,
++};
++module_platform_driver(ffa_driver);
++
++MODULE_AUTHOR("Arm");
++MODULE_DESCRIPTION("Arm FFA transport driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/include/linux/arm-smcccv1_2.h b/include/linux/arm-smcccv1_2.h
+new file mode 100644
+index 000000000000..a622cc352ae1
+--- /dev/null
++++ b/include/linux/arm-smcccv1_2.h
+@@ -0,0 +1,51 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2019 Arm Ltd.
++ */
++
++//#if defined(ARM64)
++#if CONFIG_ARM64=20
++struct arm_smcccv1_2_return {
++	u64 arg0;
++	u64 arg1;
++	u64 arg2;
++	u64 arg3;
++	u64 arg4;
++	u64 arg5;
++	u64 arg6;
++	u64 arg7;
++};
++#elif CONFIG_ARM
++struct arm_smcccv1_2_return {
++	u32 arg0;
++	u32 arg1;
++	u32 arg2;
++	u32 arg3;
++	u32 arg4;
++	u32 arg5;
++	u32 arg6;
++	u32 arg7;
++};
++#endif
++
++/**
++ * __arm_smcccv1_2_hvc() - make HVC calls
++ * @a0-a7: arguments passed in registers 0 to 7
++ * @res: result values from registers 0 to 7
++ */
++asmlinkage
++void __arm_smcccv1_2_hvc(unsigned long a0, unsigned long a1, unsigned lon=
g a2,
++			 unsigned long a3, unsigned long a4, unsigned long a5,
++			 unsigned long a6, unsigned long a7,
++			 struct arm_smcccv1_2_return  *res);
++
++/**
++ * __arm_smcccv1_2_smc() - make SMC calls
++ * @a0-a7: arguments passed in registers 0 to 7
++ * @res: result values from registers 0 to 7
++ */
++asmlinkage
++void __arm_smcccv1_2_smc(unsigned long a0, unsigned long a1, unsigned lon=
g a2,
++			 unsigned long a3, unsigned long a4, unsigned long a5,
++			 unsigned long a6, unsigned long a7,
++			 struct arm_smcccv1_2_return  *res);
+diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
+new file mode 100644
+index 000000000000..d3c80b7f9e07
+--- /dev/null
++++ b/include/linux/arm_ffa.h
+@@ -0,0 +1,235 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * Copyright (C) 2019, 2020 Arm Ltd.
++ */
++
++#ifndef __LINUX_ARM_FFA_H
++#define __LINUX_ARM_FFA_H
++
++#define FFA_ERROR_32                 0x84000060
++#define FFA_SUCCESS_32               0x84000061
++#define FFA_INTERRUPT_32             0x84000062
++#define FFA_VERSION_32               0x84000063
++#define FFA_FEATURES_32              0x84000064
++#define FFA_RX_RELEASE_32            0x84000065
++#define FFA_RXTX_MAP_32              0x84000066
++
++#define FFA_PARTITION_INFO_GET_32    0x84000068
++#define FFA_ID_GET_32                0x84000069
++
++#define FFA_RUN_32                   0x8400006D
++#define FFA_MSG_SEND_32              0x8400006E
++#define FFA_MSG_SEND_DIRECT_REQ_32   0x8400006F
++#define FFA_MSG_SEND_DIRECT_RESP_32  0x84000070
++#define FFA_MEM_RECLAIM_32           0x84000077
++#define FFA_MEM_OP_PAUSE_32          0x84000078
++#define FFA_MEM_OP_RESUME_32         0x84000079
++
++#define FFA_MEM_SHARE_64             0xC4000073
++
++#define FFA_MEM_FRAG_RX_32			  0x8400007A
++#define FFA_MEM_FRAG_TX_32			  0x8400007B
++
++/* FFA error codes. */
++#define FFA_SUCCESS            (0)
++#define FFA_NOT_SUPPORTED      (-1)
++#define FFA_INVALID_PARAMETERS (-2)
++#define FFA_NO_MEMORY          (-3)
++#define FFA_BUSY               (-4)
++#define FFA_INTERRUPTED        (-5)
++#define FFA_DENIED             (-6)
++#define FFA_RETRY              (-7)
++#define FFA_ABORTED            (-8)
++
++#define FFA_BASE_GRANULE_SIZE 4096
++
++struct scatterlist;
++
++enum ffa_mem_permission {
++	FFA_MEM_R   =3D 0x1,
++	FFA_MEM_RW  =3D 0x2,
++	FFA_MEM_XN  =3D 0x4,
++	FFA_MEM_X   =3D 0x8,
++};
++
++#define FFA_MEMTYPE_OFFSET 4
++enum ffa_mem_type {
++	FFA_MEM_DEVICE =3D 0x1,
++	FFA_MEM_NORMAL =3D 0x2,
++};
++
++
++#define FFA_CACHEABILITY_OFFSET 2
++enum ffa_mem_cacheability {
++	FFA_NON_CACHEABLE =3D 0x1,
++	FFA_WRITE_BACK =3D 0x3,
++};
++
++enum ffa_mem_shareability {
++	FFA_NON_SHAREABLE,
++	FFA_OUTER_SHAREABLE =3D 0x2,
++	FFA_INNER_SHAREABLE =3D 0x3,
++};
++
++#define FFA_DEVICE_OFFSET 2
++enum ffa_mem_device_type {
++	FFA_NGNRNE,
++	FFA_NGNRE,
++	FFA_NGRE,
++	FFA_GRE,
++};
++
++enum mem_clear_t {
++	FFA_KEEP_MEMORY,
++	FFA_CLEAR_MEMORY,
++};
++
++typedef u64 ffa_mem_handle_t;
++
++/* The type of an FFA endpoint ID */
++typedef u16 ffa_sp_id_t;
++
++struct ffa_mem_region_constituent {
++	u64 address;
++	u32 page_count;
++	u32 reserved_12_15;
++};
++
++struct ffa_composite_memory_region {
++
++	uint32_t total_page_count;
++	uint32_t constituent_count;
++
++	uint64_t reserved_0;
++
++	struct ffa_mem_region_constituent constituents[];
++};
++
++struct ffa_mem_region_attributes {
++	ffa_sp_id_t receiver;
++	u8 attrs;
++	u32 composite_off;
++	u64 reserved_8_15;
++};
++
++/* Table 43 */
++struct ffa_memory_region_attribute {
++	uint8_t attribute;
++};
++
++struct ffa_mem_region {
++	u16 sender_id;
++	struct ffa_memory_region_attribute region_attr;
++	u8 reserved_0;
++	u32 flags;
++	u64 handle;
++	u64 tag;
++	u32 reserved_1;
++	u32 endpoint_count;
++	struct ffa_mem_region_attributes endpoints[];
++};
++
++static inline struct ffa_composite_memory_region *
++ffa_get_composite(struct ffa_mem_region *mem_region, u32 num_endpoints)
++{
++	struct ffa_composite_memory_region *composite;
++
++	composite =3D (struct ffa_composite_memory_region *)
++		(&mem_region->endpoints[num_endpoints]);
++	return composite;
++}
++
++
++struct ffa_partition_info {
++		/** The ID of the VM the information is about. */
++		ffa_sp_id_t id;
++		/**
++		 * The number of execution contexts implemented by the
++		 * partition.
++		 */
++		uint16_t execution_context;
++		/**
++		 * The Partition's properties, e.g. supported messaging
++		 * methods
++		 */
++		uint32_t partition_properties;
++};
++
++
++/**
++ * struct ffa_ops - represents the various FFA protocol operations
++ * available for an SCPI endpoint.
++ */
++struct ffa_ops {
++	int (*async_msg_send)(ffa_sp_id_t dst_id, u32 len, u32 attributes);
++	struct arm_smcccv1_2_return
++	(*sync_msg_send)(ffa_sp_id_t dst_id, u64 w3, u64 w4, u64 w5,
++			 u64 w6, u64 w7);
++
++	/**
++	 * Registers a memory region with the FFA implementation.
++	 *
++	 * Params:
++	 *  - tag: Implementation defined value.
++	 *  - flags:
++	 *   - FFA_KEEP_MEMORY: DO not clear the memory region;
++	 *   - FFA_CLEAR_MEMORY: Clear the memory region.
++	 *  - attrs[]: Array of destination VMs and permissions with which the
++	 *     Stage-2 mappings are set.
++	 *  - num_attrs: Count of elements pointed to by attrs.
++	 *  - sg: scatter list holding the pages to be shared.
++	 *  - global_handle: A system-wide unique handle referring to the shared
++	 *     set of physical pages being shared.
++	 *  - use_tx: select if memorry region description is transmitted in tx
++	 *     or in a dynamically allocated buffer. When using the tx buffer a
++	 *     global lock on the tx buffer will be held.
++	 *
++	 * Return: 0 in case of success, otherwise a negative value
++	 * (error code).
++	 */
++	int (*mem_share)(u32 tag, enum mem_clear_t flags,
++			  struct ffa_mem_region_attributes attrs[],
++			  u32 num_attrs, struct scatterlist *sg, u32 nents,
++			  ffa_mem_handle_t *global_handle, bool use_tx);
++
++	/**
++	 * Reclaims a memory region previously registered with the FFA
++	 *  implementation.
++	 * Params:
++	 *  - global_handle: The global identifier of the memory region being
++	 *     reclaimed.
++	 *  - clear_memory: Set if the memory is meant to be cleared before
++	 *     being mapped in the owner's Stage-2.
++	 *
++	 * Return: 0 in case of success, otherwise a negative value
++	 * (error code).
++	 */
++	int (*mem_reclaim)(ffa_mem_handle_t global_handle,
++		enum mem_clear_t flags);
++	/**
++	 * Returns information on a sub-set of partitions within a system
++	 * identified by a UUID.
++	 * Params:
++	 *  - uuid0-3: The 128 bit UUID of the desired partition(s) represented
++	 *              as 4 32 bit uints in form: uuid0-uuid1-uuid2-uuid3.
++	 *  - ffa_partition_info**: A pointer to an array of
++	 *	                     `ffa_parition_info` structs that will be
++	 *	                     allocated and populated with the
++	 *	                     discovered partitions information. The
++	 *	                     caller is responsible for freeing the
++	 *	                     memory allocated by the FFA driver.
++	 * Return: The number of discovered partitions in the system and the
++	 *	   length of the array of ffa_partition_info structs,
++	 *	   otherwise a negative value (error code).
++	 */
++	int (*partition_info_get)(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
++				   struct ffa_partition_info **buffer);
++};
++
++#if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
++struct ffa_ops *get_ffa_ops(void);
++#else
++static inline struct ffa_ops *get_ffa_ops(void) { return NULL; }
++#endif
++
++#endif /*__LINUX_ARM_FFA_H*/
+--=20
+2.26.2
+
--=20
2.29.2

