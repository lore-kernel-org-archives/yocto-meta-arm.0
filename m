Return-Path: <ben.horgan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812BDC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 16:02:40 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.44])
 by mx.groups.io with SMTP id smtpd.web11.8274.1641571358899528488
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Jan 2022 08:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=5Jmg2Wo/;
 spf=pass (domain: arm.com, ip: 40.107.0.44, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/iSvnWvoPrrctQ1VDfkmxhIXPAbXCz4dsU1zxuiQNs=;
 b=5Jmg2Wo/N31OGMIlnB1LAm6F7XdHvT17gtCfBEZvYPz3RzTubKolddZdEtSc95NMSbI7iOECEV665IHPI80STKJUQilr+rJtaJwF9E0yK3O9ZqWPRx/vfrxyuTFN77bvCJRiWGgZxBI2xztaQsXIth0FOOOUgSlS3w+ddybeuXc=
Received: from LO2P123CA0075.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:138::8)
 by VI1PR08MB3278.eurprd08.prod.outlook.com (2603:10a6:803:48::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 16:02:35 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:600:138:cafe::f7) by LO2P123CA0075.outlook.office365.com
 (2603:10a6:600:138::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Fri, 7 Jan 2022 16:02:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14 via Frontend Transport; Fri, 7 Jan 2022 16:02:35 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Fri, 07 Jan 2022 16:02:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e276d9e66411dd7
X-CR-MTA-TID: 64aa7808
Received: from b026df89b4c5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD49DF25-DB70-44B2-80F6-3D46DB9754BF.1;
	Fri, 07 Jan 2022 16:02:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b026df89b4c5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Jan 2022 16:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMMrstAA+vqnhwNNEqYdiF++6n0RI/59ODiLuYxCW42DfD/TILpDNUUb2i/URP1diNbfmvwCdMjKQXrs0t60K1SJXHnZyrr4QmieQqKWQQltxdewaetGJo0MJDBz5bp0RQTc73S8RytC6rw0SBLwFug4/GhUuwYAUSVLkhwnJLZXkzqMqeArHamP9fD/D/rJTLHEFTB3PQsVhy/VxebHT7wVnfH8w1afnTmtU2+HTdcveFReCxh1I8p/MfPt6vzWI4BEE1rT316y/YyI08IVtDyRxOPf+/OIy3atbfVE5cnF8AcR9ylsfe5GGvEyuK9HzZYv90AZIVyxwt2od7HeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/iSvnWvoPrrctQ1VDfkmxhIXPAbXCz4dsU1zxuiQNs=;
 b=Lb/K35rU15ludujXzBl8B5K0ZUMiaooOfovFagd9m8WK6wD95dEdX9r9/jZVq5ORLc0XJIwG77rivPQcKsc7Ps5ZtsFUwRRXZfHeVu2vBs9ikL5fnKIHt1Zmz9kERmZB/X345fJR7P+Jr7T81BoCAaGQzLtnIBDj2VXNqqEut326CnNJmr/UaeGTHdLlsikbRLhTDGR7I9KB9Nf5FS8DCfOvVA7XD1ffXe2N5mBMM+FXp84Fy4eht390U0WByKlY6MUEueYTpVhsK8+wYH4EzNSiHP4nriKVVwUKl3Xrll1xhV4o0IW30I7nFIuu3711FHfzC0CsVBGk6YGOHApv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/iSvnWvoPrrctQ1VDfkmxhIXPAbXCz4dsU1zxuiQNs=;
 b=5Jmg2Wo/N31OGMIlnB1LAm6F7XdHvT17gtCfBEZvYPz3RzTubKolddZdEtSc95NMSbI7iOECEV665IHPI80STKJUQilr+rJtaJwF9E0yK3O9ZqWPRx/vfrxyuTFN77bvCJRiWGgZxBI2xztaQsXIth0FOOOUgSlS3w+ddybeuXc=
Received: from AM5PR0601CA0064.eurprd06.prod.outlook.com (2603:10a6:206::29)
 by VI1PR0801MB1887.eurprd08.prod.outlook.com (2603:10a6:800:85::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 16:02:26 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::32) by AM5PR0601CA0064.outlook.office365.com
 (2603:10a6:206::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7 via Frontend
 Transport; Fri, 7 Jan 2022 16:02:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.10 via Frontend Transport; Fri, 7 Jan 2022 16:02:25 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 7 Jan
 2022 16:02:17 +0000
Received: from android-wfh-server-benhor01.stack04.eu02.mi.arm.com
 (10.58.246.229) by mail.arm.com (10.251.24.31) with Microsoft SMTP Server id
 15.1.2308.20 via Frontend Transport; Fri, 7 Jan 2022 16:02:17 +0000
From: Ben Horgan <ben.horgan@arm.com>
To: <meta-arm@lists.yoctoproject.org>
CC: Ben Horgan <ben.horgan@arm.com>
Subject: [meta-arm][PATCH] arm-bsp/optee-os-tadevkit: total-compute: Add
 optee-os-tadevkit
Date: Fri, 7 Jan 2022 16:01:23 +0000
Message-ID: <20220107160123.16705-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 65a827ce-0725-42cd-a847-08d9d1f71ec6
X-MS-TrafficTypeDiagnostic: 
	VI1PR0801MB1887:EE_|AM5EUR03FT062:EE_|VI1PR08MB3278:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3278311A5FF7FBDCC608C337914D9@VI1PR08MB3278.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VNL26Ca7IiwLSK/BwqAonFH9gIINb5IxmTtc7InRoOr81cPlV44dofuD/tdW2lY+h2mCTfmG2OGKjOg008Xzr4NPOUEO9cE3FUkcVj1C8P2IUzdqU87xFlHfzncwYJBJrtsW6rPstsv5thvSnBlyXMCqdJvcXmLNUT1/zfMm/aZKwaKQ8b7lPeQWjCTEAXRff0ByPGp4/xLR6Ii9pk1Z83uyen4LW+goV9MIHvHu6IOLtrF0YsSFd6tfjjCUZ00mCIv3qglLLycU1Dr2exG4AWJ+zFdTFIlXrw/R+rSp32plNe6B9SkjNNJV9UzRGRjLzVNZCSQq/8/8wsZDm9bc0pAuoMLmbZF5oTEvp7mgB4igSUa0NovN+QHBVMnNafYyA+DBlfvrSCzGTJY6ja8roewghHMgGjBh4M3yMedAmcD3jvWu/p1Y6HhCqHVcv4SW/nceeBFquwWBlpEvag+kHeUf9KuUYR9zgBv5nT4GPGmp01GWV2mPuhFKaswEyT0RLbPdYurgKn2E7w4fgQ3LOSruKGVYfwNVfTUhg5HQAp8EPpRTwtNvXBiKzrDBBjqBC2BRH7JwJlKFNDRyaXeBaEB/pSdo1j19W3Cyqj0d5aOLTmV3egZXfAqxEN92/BXby9az3CofxhcS4nmgDiDquJSH2zqrYvPgmumpgBxzyahORc81LtU13IOb+nDU4b2BaKqm/6EgK9Uaerl12zBZLHHGuUrvwozFzOqG0zewwfne3syKHUxouMd8msdieG4wPFr1fT7s45S74wFHWSj4QJ1t0xvckflbJbe19NIx3aU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(26005)(47076005)(186003)(36756003)(44832011)(86362001)(4326008)(83380400001)(70206006)(81166007)(356005)(426003)(2616005)(5660300002)(6916009)(40460700001)(36860700001)(7696005)(1076003)(82310400004)(508600001)(70586007)(6666004)(8676002)(336012)(2906002)(316002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1887
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	10a1332c-42a0-404b-1cc8-08d9d1f71901
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cBmz2LrhG3oXGwuk09V4P+7S+BMY+0VhTXg6AU/mWoHMiasttyHxYuWYbDZ9PbTbg0IFzVazJQoqXH8LfNNE+ES9uh6caJynbPMQqU1Bqu/LLtSA0MsylNMW0tJFw27FwhmJCfmd88rWT+9inRbgZkiP4Ca9dXcug7ABy/eMBwldMPrGPDj3iIunJ3ji8bUVUJdms/Xfc2KeGRTscKlndtsoLZZlemc41re7UGYDO6Lg1YJTfTl6BkzuQQ5cfZGtHyhLJmLMO2q6UIHglHdF4HVWhA5XTD4UUBEphsxo18mJP3vvbARYhe54PA4p0d+7ynS+WvNCb9KhIVPmRF7v/ViBpZUUM6eWpaBilQz2sPL5ak9ategGajnE79kamf+MmT3Xtd0/LNBz6Wv6+n3aEri/AbFhXdHHZw0M6mrTVQP7dnqD6W7rhk99rn2X03dysaMZ86WNmCY7JBpg2ZJ3EruOC6STmrd71B6tWQc4dgNpJ5u1S3zwaHROciykZhUsP9F7zJz5qi7/dRV1ZBXv8S8il4NesB2P4O+gaNew9YSTTu+VD8FEic/VeNer/F+xRB//dlIWqcnEuwYThzgCOddq/s7vXkdTvQOo6IIHkhpv3kQEFRW1V5DcyEnqpC/4d2sROToXf/0aB7HQv4dj6KWLY7C6kq2o7TW7CFwTcUKPrQhHCUsqOMpSHfBuoTuUgHLIXMmqWHzWPaqSKijy9w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7696005)(70206006)(83380400001)(2616005)(336012)(82310400004)(4326008)(1076003)(2906002)(8936002)(70586007)(81166007)(36860700001)(26005)(36756003)(508600001)(47076005)(6666004)(86362001)(44832011)(6916009)(8676002)(186003)(426003)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 16:02:35.2473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65a827ce-0725-42cd-a847-08d9d1f71ec6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3278
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Jan 2022 16:02:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2810

The optee-os recipe was recently split into optee-os and
optee-os-tadevkit.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Change-Id: Id9794b7c4a7e2f3fac4286498fa44c35fd8aaa0b
---
 .../optee/optee-os-generic-tc.inc             | 20 +++++++++++++++++++
 .../optee/optee-os-tadevkit_3.14.0.bbappend   |  6 ++++++
 .../recipes-security/optee/optee-os-tc.inc    | 18 +----------------
 3 files changed, 27 insertions(+), 17 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
new file mode 100644
index 0000000..da6a06f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
@@ -0,0 +1,20 @@
+# Total Compute (tc) specific configuration for optee-os and optee-os-tadevkit
+
+# Intermediate SHA with 3.14 baseline version
+# This has TC0 platform support
+SRCREV = "e4f34e786135079160697d88212591105a65fbce"
+PV = "3.14.0+git${SRCPV}"
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/tc:"
+SRC_URI:append:tc = " \
+    file://sp_layout.json \
+    file://0001-WIP-Enable-managed-exit.patch \
+    file://0002-plat-totalcompute-Update-messaging-method-for-manage.patch \
+    file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
+    "
+
+COMPATIBLE_MACHINE = "(tc?)"
+
+OPTEEMACHINE:tc0 = "totalcompute-tc0"
+OPTEEMACHINE:tc1 = "totalcompute-tc1"
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend
new file mode 100644
index 0000000..6a22d47
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?= ""
+MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc = "optee-os-generic-tc.inc"
+
+require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc b/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
index bd6c638..7936652 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-tc.inc
@@ -1,22 +1,6 @@
 # TC0 specific configuration
 
-# Intermediate SHA with 3.14 baseline version
-# This has TC0 platform support
-SRCREV = "e4f34e786135079160697d88212591105a65fbce"
-PV = "3.14.0+git${SRCPV}"
-
-FILESEXTRAPATHS:prepend := "${THISDIR}/files/optee-os/tc:"
-SRC_URI:append:tc = " \
-    file://sp_layout.json \
-    file://0001-WIP-Enable-managed-exit.patch \
-    file://0002-plat-totalcompute-Update-messaging-method-for-manage.patch \
-    file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
-    "
-
-COMPATIBLE_MACHINE = "(tc?)"
-
-OPTEEMACHINE:tc0 = "totalcompute-tc0"
-OPTEEMACHINE:tc1 = "totalcompute-tc1"
+require optee-os-generic-tc.inc
 
 # Enable optee memory layout and boot logs
 EXTRA_OEMAKE += " CFG_TEE_CORE_LOG_LEVEL=3"
-- 
2.17.1


