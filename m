Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web11.2988.1592381850110687865
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Jun 2020 01:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nRJXx4ai;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/DHqR2U2rBDwcclene9/DtANc0Z1ETEwoBiFKQHF+g=;
 b=nRJXx4aipK6iLwGU3gSjGWL08wwBHK3FK6melscnrYZDHPj0ydwSOv0sx+SuIqGhoaXbtOiE9JkPNrMmZB5v7bEQKoZjRcTWHpTyomdIBJvbFj1/qbd7D7ZH4PA/UOM6/l/QLhVPdDrUdlgfQCfIXhBCuzZuOLZqoV/K8LyDX4U=
Received: from DB6PR1001CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::29)
 by AM6PR08MB5093.eurprd08.prod.outlook.com (2603:10a6:20b:d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 17 Jun
 2020 08:17:27 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::ab) by DB6PR1001CA0019.outlook.office365.com
 (2603:10a6:4:b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Wed, 17 Jun 2020 08:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 08:17:27 +0000
Received: ("Tessian outbound cdcc6148d2f4:v59"); Wed, 17 Jun 2020 08:17:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e00d8fb992646b14
X-CR-MTA-TID: 64aa7808
Received: from 15efcf16e78b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2F5B42C8-2067-4A9C-B4F5-9B98B9860091.1;
	Wed, 17 Jun 2020 08:17:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15efcf16e78b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 08:17:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nzem60Rdu7EeOCHqgE/j3majLdVNDZb2+bLurE/Gv3OAyWgn3d38z7ArS0/m73PFkgYXGOmeU6fZSnN6FbaqrF+vCB460X+D/j4zwtJP0/rSRO2j1HOdD2jYfJm8TThKUuf4W+qeIZNB+H9jV6QfK/lfUDdpFuEXR2Qc8oObnLsPz8QhPKUofRSDL/MjTK6FaFvPjLaZF8t88lhiIZo9DjMlPYqARB/k6ig0B5PC/QXTlIN4aKHsq0PMUJNxwtExyzT6xWt8/nm3WFa9UDl7e53sN8EvMJe4/o50KGdtse6cygS3iyfDFXqlFiwF+b4BcfC7wo1Kxugd+IwwYN3UuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/DHqR2U2rBDwcclene9/DtANc0Z1ETEwoBiFKQHF+g=;
 b=Pksy/unUY6F1u8OX3eSyOP6witbCpQJdAZCV0DvQFDZkyj/TQSwLODxwf4YIvf+obq/6XOLFb1yMsg0LEoHgqVR1LrinpWFbs6xPcRcFB6uhdLAzQO2JhsBhXQmoUcQozyAxHwn85zBVCu+SFEPxZ5jmnZPxoUv2GblWHLL5opIvqZkKwOHe73knNhcxNFymn+hJPxh+rMjvufaPMnGFgq8xBaRjzmymMsBJZ92c/chMjJMblIOBsEFevHEKV6jyS4UUJH4+wciX3GaiU41+e4rB5L0+c7Ziy1kcMek4QflgHKJbY0AlCK3msSiAcA8dSdWfV8aVj34Rc8Du1XgHrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/DHqR2U2rBDwcclene9/DtANc0Z1ETEwoBiFKQHF+g=;
 b=nRJXx4aipK6iLwGU3gSjGWL08wwBHK3FK6melscnrYZDHPj0ydwSOv0sx+SuIqGhoaXbtOiE9JkPNrMmZB5v7bEQKoZjRcTWHpTyomdIBJvbFj1/qbd7D7ZH4PA/UOM6/l/QLhVPdDrUdlgfQCfIXhBCuzZuOLZqoV/K8LyDX4U=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB4025.eurprd08.prod.outlook.com (2603:10a6:10:a9::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Wed, 17 Jun
 2020 08:17:19 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 08:17:19 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH v2] arm-bsp/edk2-firmware: fix destsuffix and PV for recursion error
Date: Wed, 17 Jun 2020 13:47:02 +0530
Message-Id: <20200617081702.18172-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:3:5d::17) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM5PR06CA0031.namprd06.prod.outlook.com (2603:10b6:3:5d::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 08:17:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b48ab112-7293-4b49-cd3a-08d81296df3b
X-MS-TrafficTypeDiagnostic: DB8PR08MB4025:|AM6PR08MB5093:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB50935AD13AF753BF659B668BFA9A0@AM6PR08MB5093.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:369;OLM:369;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LASXluPGhTbr6dNCE/0ESFENiB8VWumVz6gHbHGsPH9YKcQVd7wAZEwiJ+kRMFzVwcy+G9m/4tTAsgn4pmprn+vPsgZowTk58zf2u6yBDorlOdCc3zOp7tVUT+gw26RNakYnzieNoIBkIgJm2tRQ2u1jqXJVUQVL1faKh3ZkQZz2NRmrEZy6DqpX87R7trpObV+mtXbUcDKCSSDiDcd6DS+WWvg6Ta70Mg4Z20RSP+JdOxxe4FZGiByq6e2tab3SLUO8ar+KhF91idPCRHLW9Bw9ZBLj1yjfX5dseA1cZiW/F9PfyRPfUMGw4MdNNpFA/ydCeqWaT9a1eMVXoX6yoo2Rj0qnrcZ0QEzePJTSe3bQUOMOKtOjoy2mvOV+//tV
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(86362001)(66946007)(186003)(8676002)(16526019)(26005)(8936002)(7696005)(5660300002)(4326008)(6916009)(52116002)(2616005)(66476007)(36756003)(66556008)(956004)(478600001)(1076003)(6666004)(316002)(6486002)(2906002)(83380400001)(54906003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 0uoekdn6OyFwFDdXZWe+koAs2wIxGHCY+CGXGil3NJAcXsZtaNL0UP3uNv49v3TebHUk2Z+yAj4DXt4poYn5J8yA1E0PNTNUQWCGqG993Hc/rfV2jITyAiNjxtTsP/BVyDu24V+Rj/mmjCLvOXkrOJQ6jMA8FQdmFq0KFLhxN81elpL9qKgTcH/OubqPAabaN7VWupBWZomCEy36IKwHc9g5bJBcHlutZx6/xarS0qeF8Ww6eEE5WJJdwoODwljs26mzLy5Kct/kaC9J56NsZY/tAZT7rx4Wm7XYZoqJszGcBvHlp9muGsfzKxzTM10pPcpCQf7iqWSnq5JNmGuZuRQheiuHc+kOB7A1YG0X9B6KHOxMdYfHD6qX6AibM2IMNVMvxkb+t3IhhwltzqDJlYOcu3elTKGT0SNRubHwZTt+0o8RDEpLtfA4x4nm3RTn/BLDzz1WIgFoP3JYtwyewXBawHwJGyPqvtlPPkRzwstWH3FccIQ38Xo4jFXM7vRJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4025
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(356005)(54906003)(8676002)(83380400001)(478600001)(1076003)(6666004)(82310400002)(8936002)(81166007)(5660300002)(47076004)(82740400003)(4326008)(70586007)(316002)(336012)(2906002)(26005)(70206006)(6916009)(36756003)(956004)(2616005)(6486002)(86362001)(186003)(16526019)(7696005)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	51190e96-3d66-4395-c901-08d81296da7b
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zYs+v9rbgf8AtKNxLlTCtUwdG7LsIQZWil8O7us6dRZAdT7FQ4Sl3c0pWUvGaG7ynEDLQtPBS2QTluIWZMTSJXzvWjYRTr0NUKGzyITaikFI01uMyEC7ulQiDCDZeoW8Tb1Knlp5HqM2bowM4NJFsOG9Fm/P28RzKildfxz8VfX2LbwW4ImBN+TD0+Gf2bIFMqjHbBIRP8vZVZPAS2L5t2G0Gg1GZfu1VSOf+XItQwOXA6MjVWyxHqTh7ye7ZfLqg0v/iCaGUG47H20IeNLFkujeFrAxUeOFJMxjc2W2AcHKe3XL9vEMXJuLddo+cLtRR68v7tq/m6lfUxzVShrLE8p2YN64J8Qbi9A+63AEYF6j7wFtT4MbhqJKxBvWMlstfai1GW/GBqWFtzzolr5mWP9L+lo3PMFTOL7ni9FykPw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 08:17:27.2487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b48ab112-7293-4b49-cd3a-08d81296df3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5093
Content-Type: text/plain

Use relative paths in destsuffix as the paths are relative
to ${WORKDIR} and turn the existing PV ?= into PV =

Change-Id: Ib9367a15dde611e5b74c11eeff330d0b5a3de75d
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index c8fc70a..832b226 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,6 +1,6 @@
 SRC_URI = "\
-    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=${S}/edk2;nobranch=1 \
-    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=${S}/edk2/edk2-platforms;nobranch=1 \
+    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=edk2;destsuffix=git/edk2;nobranch=1 \
+    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;name=edk2-platforms;destsuffix=git/edk2/edk2-platforms;nobranch=1 \
 "
 
 # TAGS and commit ID as per N1SDP-2020.03.26 release
@@ -16,4 +16,4 @@ EDK2_ARCH          = "AARCH64"
 
 COMPATIBLE_MACHINE = "n1sdp"
 
-PV ?= "201908+git${SRCPV}"
+PV = "201908+git${SRCPV}"
-- 
2.17.1

