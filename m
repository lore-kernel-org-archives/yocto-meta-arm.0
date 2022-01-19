Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CEDC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 14:46:07 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.71])
 by mx.groups.io with SMTP id smtpd.web11.7001.1642603566220537786
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 06:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=lssfQCWB;
 spf=pass (domain: arm.com, ip: 40.107.4.71,
 mailfrom: davidson.kumaresan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDcD/9VqXrRKayqiL/tD++raPQKuIaoPn1gNz3lpgOw=;
 b=lssfQCWBX7TiUVrMkR41yxQDvD65NTuI1XcMfQLiiOsImCGSEDLoBHIBTr+j6JY57tLytx2d8xSpcRxnubaGNa5MubUMLTu1ARpNtEwj7qR/3Ur7TchyyKP8M0CQwHTfrpxvRCB1nitVQYhQP8lVNljIbx3f6MPSQVayAHUulFM=
Received: from DB6PR0802CA0032.eurprd08.prod.outlook.com (2603:10a6:4:a3::18)
 by DB7PR08MB3577.eurprd08.prod.outlook.com (2603:10a6:10:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 14:46:03 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::9b) by DB6PR0802CA0032.outlook.office365.com
 (2603:10a6:4:a3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14 via Frontend
 Transport; Wed, 19 Jan 2022 14:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 14:46:03 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 19 Jan 2022 14:46:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5b2fa005db72a00c
X-CR-MTA-TID: 64aa7808
Received: from ef83340c0678.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28F61041-AE9D-494B-AA20-1D9F87837D18.1;
	Wed, 19 Jan 2022 14:45:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ef83340c0678.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Jan 2022 14:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+YZ/rOVt48SFjCdbm80r1JucJsy0ktjv47fFRIoFQCbqtfeg5QTrv/CVTqJ7H7oOS93cSw2N6zS1OpUdA2xwPaSX5oYpwhVpW6h1GyjrI3NoPJIG4houN5BvIu22IrNnhzIOW3UJUjoSiBAtvtFyveJe2MGOno0znf0+Be87xFCL/Nm0ymEqdzRaQNY6d0PmP+lnTIMe06zLvBksoFcX0iX6VOcBRjP6Q2QyLpudF1oF54h3qer7rCYGNProeyE/o+OlFgy/uOO1dJZPlss5cdhdJZACx67GzV5dvqppo4OQmFJX+CuqS15ARscXKyTw61y1l16sHnFvLlBYM+XHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDcD/9VqXrRKayqiL/tD++raPQKuIaoPn1gNz3lpgOw=;
 b=TJnJoVrYslxNnwEd8xR6Yfo0CfKQ5BbzEUCaLYTkS4M7Vaa+RvXYsXoIDRlGitVPvY0SGmCY8B0eHGl0Jo3NNs35nvAyN+1IOgYPsjjNGsrxWNsGzYiLLxVs8v2zwpBcJr4zOm58M8VwTB9LM4wIuGG03K8I/tKtDMU2nxXYXuptib1M+o5MyGoJvcEAcLou+nUhc7iA+fuSb0tK+Kmx5kfC6AESXC5LRT34HYZw7GO9eTwtFEBmBbBECDOp9DydsK9tTzH3teAwYwYc7pGFOQR91y5KMlKxLOoup/1AY+iInZMPsUMdXwZdS6aokxcrcDE93JJuYOnfdkeNZaq2PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDcD/9VqXrRKayqiL/tD++raPQKuIaoPn1gNz3lpgOw=;
 b=lssfQCWBX7TiUVrMkR41yxQDvD65NTuI1XcMfQLiiOsImCGSEDLoBHIBTr+j6JY57tLytx2d8xSpcRxnubaGNa5MubUMLTu1ARpNtEwj7qR/3Ur7TchyyKP8M0CQwHTfrpxvRCB1nitVQYhQP8lVNljIbx3f6MPSQVayAHUulFM=
Received: from DB6PR07CA0069.eurprd07.prod.outlook.com (2603:10a6:6:2a::31) by
 HE1PR0802MB2315.eurprd08.prod.outlook.com (2603:10a6:3:ce::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.12; Wed, 19 Jan 2022 14:45:53 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2a:cafe::1e) by DB6PR07CA0069.outlook.office365.com
 (2603:10a6:6:2a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 14:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 14:45:53 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 19 Jan
 2022 14:45:53 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Wed, 19
 Jan 2022 14:45:52 +0000
Received: from a076574-lin.blr.arm.com (10.162.16.64) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Wed, 19 Jan 2022 14:45:51 +0000
From: Davidson K <davidson.kumaresan@arm.com>
To: <meta-arm@lists.yoctoproject.org>
CC: Davidson K <davidson.kumaresan@arm.com>
Subject: [PATCH] arm-bsp: tc: use proper UUID in optee and linux kernel
Date: Wed, 19 Jan 2022 20:15:49 +0530
Message-ID: <20220119144549.52195-1-davidson.kumaresan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 529100cc-9cf9-4ad7-c770-08d9db5a6ab6
X-MS-TrafficTypeDiagnostic: 
	HE1PR0802MB2315:EE_|DB5EUR03FT005:EE_|DB7PR08MB3577:EE_
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3577CCA4C00A69F4D98DC99E90599@DB7PR08MB3577.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Gf2Bob9E0uS9WSYRuYzduDd/nh2m03uJZikxYsY/m7RIwKZuNGMGHoRPPFDbI2+8Tq+gDPJARDnZoKkDegm63b9IRkQhKLiij8z8NR4BMPm3qH53D5ICnvbR4ZoTUWJczx2D1wwH7wgqtGYUAkOvn42msLZ7Dr78hrtrUIYM46SYmlXGtGNkaQZoNJvFu6I+Lxk2px+43N4m/dV1AJzMvTKe1xO+PS0fIlcjO05JbhbJAglRUvUq33OgEEXlxKBy9ty6b5PoyoTTW+EFWphQLRaAerTYN3XYaYn+eShGpYMyqdDXHjRLwU8h1RQKaAOxWvWZZe8rVBs4v17Bo6+TIGE8ZZJmNEY8oX009yrG4usTrVljfKZl1lKWRcDrjQWSbj8swpeCEjawlr7NEwrOMGOtJyG+HwfqXKiy0+BzlatqtQI8JQ3ASyj8GOgK4HS1bw4kEmXPiJUJq6uNsnicxzaTGwTbsXCNKbWnVcHS/vOf6zcUHrd4KSO13NCVbQz9r6iinE3Hzf1xgflmd20ilI9CE8xsLHAXS2r5NU5UxH3r2CTm0lH3reL80+AIAgf1pdRcx7VkCYWsum0fUMWJDnQErmt4c5rM+x3Xntm0yM/ql6s9fzuwu+NG/Id+D7mFp5oqjvTpIyIgNmvuu0wJe3diL9AX3W79CjvRf+C2E5K3awmA5BIiCEjPjLHPZR4pgfjCYwzvF+6BrPmkc37eYfLYOaHxlR7RLnwIk7bh6eai6OKT1sp0gtCtk0ZtZrK7T5KgLZw61olmrDmYk+pDgSQnqbL29SBHD4yY3XmfrdxxIuzcry4u0ADMelkshPry3Su1tvRqp5yugl1TrVOtkZ1vPsewQi4bKaDQDH7svIesr/89laR/LvwGp+nzZaPv
X-Forefront-Antispam-Report-Untrusted: 
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(70206006)(508600001)(316002)(26005)(1076003)(4326008)(83380400001)(8676002)(82310400004)(81166007)(70586007)(356005)(336012)(40460700001)(6916009)(8936002)(2616005)(7696005)(2906002)(19627235002)(47076005)(36860700001)(86362001)(5660300002)(36756003)(426003)(186003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2315
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3252a9ae-5355-41ef-c4d4-08d9db5a64c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CFeWvOYmNFAk/C2XMccuisOW7/ZXIU+aovZMeMyjDjWVkxQ5jwS0JjvGtCAxXkRvSBknpMfvDGiHAXWgtbTMDmhIYi8vOYGnQm7X4qjxQR4XDCBY0dkpiXgvr1P/s+R9nMkT92gBFSRdlNpgfIvM9loEogjYGpfr1fLXZ3gCI4q8MG055I2Oa1JawkQhKneLdE78cbEOzC89SYwiBgWo8wy4uyC63ZEFeQ0/dcgkyh4TGnTsB+RJekB4JpWjJO2Yta4DSyPdgypeOSP/dnrJ5qr4p7MZzFABxZ9P61RqtkLo8D5r+EfT+ZPAG0GRK+Y2WygcRXkl6PYqPPRGDe22NCWzEUcS9i21l016g5+Gm4W3Ju6MQc7kT1ZGqAjGMCVEdZ7Ao1dW/MhQx0uy/onYayH7oKYXClwj+7TLoh3OYtl1ToInxQmssSJ3t9y6RBj2LBkMBvcCbTfppIq6u9abEk59uVl3qk2WvKKGLJelXMBY6YlWjXxrmKp4nRq5MuuR5YRyEPbcJxN+neOlSNlgnoH3+lg0OsXq3XWlHPryZ5vd/9xPmo0z/1il0QMIm3XNTCJZ6auJw5IyZhHA4uTn67xWJFlfdceBw+UlN1UQMoRU55RKZNr6XH4du0T1vfIAftZ9upbIGZDN2PNqhbjw0SHRE2Q6HH4PtWKFYCBKZS/HfcGQ+ZSjiQL5xMHXCR60rxd3FTS5PvK0+Uxz1jvLJ4ghKY6gPun6OHciwJABErpt9JDiOUBbB049SugIR1dCP2YtSzW39C/SBvi+IGc96bn+Ibv2hDC3AQ6oHvQPrLcy3v9XsMqbqYs+DWC85D+yLYNG/w2nYBVUOMa8xJX7jpEOTI0jKKRUVjCkFeByz7E=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(40470700002)(46966006)(81166007)(36756003)(508600001)(19627235002)(40460700001)(2906002)(47076005)(70586007)(8936002)(7696005)(4326008)(8676002)(70206006)(26005)(36860700001)(336012)(426003)(316002)(1076003)(2616005)(83380400001)(6916009)(82310400004)(186003)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 14:46:03.3454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 529100cc-9cf9-4ad7-c770-08d9db5a6ab6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3577
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jan 2022 14:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2866

Recently the way of handling Secure Partitions UUID changed in TF-A
and that needs corresponding changes in required components.  Hence
changing them for optee and linux kernel.

Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
---
 .../linux/linux-arm-platforms.inc             |  1 -
 ...-optee-hack-for-UUID-endianess-issue.patch | 58 -------------------
 .../optee-os/tc/0001-Fix-optee-UUID.patch     | 27 +++++++++
 .../optee/optee-os-generic-tc.inc             |  1 +
 4 files changed, 28 insertions(+), 59 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/=
tc/0020-drivers-optee-hack-for-UUID-endianess-issue.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0=
001-Fix-optee-UUID.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 5dadc44..1e09da3 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -272,7 +272,6 @@ SRC_URI:append:tc =3D " \
     file://0017-optee-refactor-driver-with-internal-callbacks.patch \
     file://0018-optee-add-a-FF-A-memory-pool.patch \
     file://0019-optee-add-FF-A-support.patch \
-    file://0020-drivers-optee-hack-for-UUID-endianess-issue.patch \
     file://0021-arm_ffa-add-support-for-FFA-v1.1.patch \
     "
 KERNEL_FEATURES:append:tc =3D " bsp/arm-platforms/tc.scc"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020=
-drivers-optee-hack-for-UUID-endianess-issue.patch b/meta-arm-bsp/recipes-k=
ernel/linux/linux-arm64-ack-5.10/tc/0020-drivers-optee-hack-for-UUID-endian=
ess-issue.patch
deleted file mode 100644
index 45319fc..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.10/tc/0020-driver=
s-optee-hack-for-UUID-endianess-issue.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 62e38805a966c1bc66a72bcdc83af7031c6a95df Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Thu, 27 May 2021 13:40:33 +0100
-Subject: [PATCH 20/22] drivers: optee: hack for UUID endianess issue
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
-Change-Id: Id5c42e4fe491a448f746b9d132dae20c85666554
-
-Upstream-Status: Inappropriate [will not be submitted as its only a workar=
ound]
----
- drivers/firmware/arm_ffa/driver.c | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/=
driver.c
-index 056a3fca14d1..82c84fe10be2 100644
---- a/drivers/firmware/arm_ffa/driver.c
-+++ b/drivers/firmware/arm_ffa/driver.c
-@@ -275,8 +275,18 @@ ffa_partition_probe(const uuid_t *uuid, struct ffa_pa=
rtition_info **buffer)
- 	struct ffa_partition_info *pbuf;
-=20
- 	export_uuid((u8 *)uuid0_4, uuid);
-+
-+#if 0
- 	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
- 					 uuid0_4[3], NULL, 0);
-+#else
-+	/* hack for optee UUID endianess issue */
-+	count =3D __ffa_partition_info_get(be32_to_cpup(&uuid0_4[0]),
-+					 be32_to_cpup(&uuid0_4[1]),
-+					 be32_to_cpup(&uuid0_4[2]),
-+					 be32_to_cpup(&uuid0_4[3]), NULL, 0);
-+#endif
-+
- 	if (count <=3D 0)
- 		return count;
-=20
-@@ -284,8 +294,17 @@ ffa_partition_probe(const uuid_t *uuid, struct ffa_pa=
rtition_info **buffer)
- 	if (!pbuf)
- 		return -ENOMEM;
-=20
-+#if 0
- 	count =3D __ffa_partition_info_get(uuid0_4[0], uuid0_4[1], uuid0_4[2],
- 					 uuid0_4[3], pbuf, count);
-+#else
-+	/* hack for optee UUID endianess issue */
-+	count =3D __ffa_partition_info_get(be32_to_cpup(&uuid0_4[0]),
-+					 be32_to_cpup(&uuid0_4[1]),
-+					 be32_to_cpup(&uuid0_4[2]),
-+					 be32_to_cpup(&uuid0_4[3]),
-+					 pbuf, count);
-+#endif
- 	if (count <=3D 0)
- 		kfree(pbuf);
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-Fix=
-optee-UUID.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0=
001-Fix-optee-UUID.patch
new file mode 100644
index 0000000..5374c02
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/tc/0001-Fix-optee-=
UUID.patch
@@ -0,0 +1,27 @@
+From 37fd6f3c18015bcad2c099bf9269e72140e55557 Mon Sep 17 00:00:00 2001
+From: Davidson K <davidson.kumaresan@arm.com>
+Date: Wed, 12 Jan 2022 17:14:03 +0530
+Subject: [PATCH] Fix optee UUID
+
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/commit/a9a8e=
483b6ff7f6e40c5ed95310a18e0bd1993c3#diff-2a310f8cc43d961b2efc05ac1619521653=
ba8977ff5e6dc5bb89754fd60fe954]
+Signed-off-by: Davidson K <davidson.kumaresan@arm.com>
+---
+ core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts b/=
core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+index 04847c4d..3b76fc7d 100644
+--- a/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
++++ b/core/arch/arm/plat-totalcompute/fdts/optee_sp_manifest.dts
+@@ -14,7 +14,7 @@
+ 	/* Properties */
+ 	description =3D "op-tee";
+ 	ffa-version =3D <0x00010000>; /* 31:16 - Major, 15:0 - Minor */
+-	uuid =3D <0x486178e0 0xe7f811e3 0xbc5e0002 0xa5d5c51b>;
++	uuid =3D <0xe0786148 0xe311f8e7 0x02005ebc 0x1bc5d5a5>;
+ 	id =3D <1>;
+ 	execution-ctx-count =3D <8>;
+ 	exception-level =3D <2>; /* S-EL1 */
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc b/=
meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
index 644af42..5f64f5a 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
+++ b/meta-arm-bsp/recipes-security/optee/optee-os-generic-tc.inc
@@ -11,6 +11,7 @@ SRC_URI:append:tc =3D " \
     file://0001-WIP-Enable-managed-exit.patch \
     file://0003-ffa-Update-function-ID-according-to-FFA-v1.1-spec.patch \
     file://0001-plat-totalcompute-Specify-managed-exit-in-the-partit.patch=
 \
+    file://0001-Fix-optee-UUID.patch \
     "
=20
 COMPATIBLE_MACHINE =3D "(tc?)"
--=20
2.34.1


