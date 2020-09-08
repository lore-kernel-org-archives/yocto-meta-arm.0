Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.47])
 by mx.groups.io with SMTP id smtpd.web10.15128.1599550077354784458
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 00:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=74Msxwx2;
 spf=pass (domain: arm.com, ip: 40.107.3.47, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9sEQBqf0kfxH6FQy7CSUv7utWgGZs2ipqL76G8/zCY=;
 b=74Msxwx2rAzRZMuuWFA6RaNv3yCK/MgsjRxHGdvlM9s03TLiOpG8yp0C+Qby6mDS2zqKyYNh6aoHMuhf3EEzBGbENob4SnGqan3wnofLxdBQJR/Br29doBmc8FI3BV5O9yngzMywEEnt9tuLqgQBsNpzY9ghUVCjGg2dLiDavhM=
Received: from AM6P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::29)
 by AM6PR08MB4103.eurprd08.prod.outlook.com (2603:10a6:20b:a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Tue, 8 Sep
 2020 07:27:53 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::5a) by AM6P191CA0052.outlook.office365.com
 (2603:10a6:209:7f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Tue, 8 Sep 2020 07:27:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 07:27:51 +0000
Received: ("Tessian outbound 7fc8f57bdedc:v64"); Tue, 08 Sep 2020 07:27:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 27eb08d6a48f004e
X-CR-MTA-TID: 64aa7808
Received: from 858c67409e72.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 04765EDD-1485-469F-88B0-5C3885F7502F.1;
	Tue, 08 Sep 2020 07:27:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 858c67409e72.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Sep 2020 07:27:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddLTPNevXZK9BGKVNBOPcsPQIGP47auZuPNQPcblZ0J1WnIaX57c7dzoy6v0grv51aShq7Z3GHakBp4ySeaNSRuCfb+MmGZcNe2dFetdmgVDcpejdcbrjdqCnStfHJ/G4f4vJd0sNGKE5rBWN8fsI5g/UF1i44VbiU1Cn+0bNah7JbpyV75ZZAVuxF6g+K0KqIlAW9s65M5MWs06W90bTX7xEh+iKUw/e2Q1Zm9FsxLfq0y6o2zfvxEZFytBefwRI8QaQbge7QZGXRyVhIale7ggHovUaNf2o7T87nGcpYS66FD6lM+NvoZysSS1PGqDoD3vzC81+eK9XgColj+Urg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9sEQBqf0kfxH6FQy7CSUv7utWgGZs2ipqL76G8/zCY=;
 b=QMmBsIXRb9a8KRn84h9b7HwqDR2+R2cKWmZVkytsPMpEWq4La80CDZ4eMdiY4yIlx/qiXVVKwXl91DrnkLq1XOvjhawBu4Z30QOW+8A0X38b1y87Lkx7eJGBPxrUd3DvwUGpSgQfTgcv5NP1ZiN4aXl7V9wYeJh/w7+hnJbT+6hQmI+AXPLtSOfzEnAxDVba1cW3r4Pv4eemits7RZUXx9I7e7FF7bjQ6/lHNaCOKLH0P0J0iobwKMP5KjSq9hD2TQ4l1UAhLUboW4nc/9QebgnMGbZeV+lCf8Dt/YaLVT4+dH/P1SJZXnd8hegr+h9YB6nEmpBNDhZ4sYDKm+Zfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9sEQBqf0kfxH6FQy7CSUv7utWgGZs2ipqL76G8/zCY=;
 b=74Msxwx2rAzRZMuuWFA6RaNv3yCK/MgsjRxHGdvlM9s03TLiOpG8yp0C+Qby6mDS2zqKyYNh6aoHMuhf3EEzBGbENob4SnGqan3wnofLxdBQJR/Br29doBmc8FI3BV5O9yngzMywEEnt9tuLqgQBsNpzY9ghUVCjGg2dLiDavhM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB2964.eurprd08.prod.outlook.com (2603:10a6:208:5d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 07:27:43 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:27:43 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2 1/3] arm-bsp/n1sdp: update SRC_REV to latest validated version
Date: Tue,  8 Sep 2020 12:57:24 +0530
Message-Id: <20200908072726.18776-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM3PR12CA0057.namprd12.prod.outlook.com
 (2603:10b6:0:56::25) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM3PR12CA0057.namprd12.prod.outlook.com (2603:10b6:0:56::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 07:27:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55b8d76a-ca70-4fde-b21b-08d853c8b207
X-MS-TrafficTypeDiagnostic: AM0PR08MB2964:|AM6PR08MB4103:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB41036EE185E78842D11303BCFA290@AM6PR08MB4103.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 v353ppNUFFr/Xg970mo6hMeQ+/m/spRg4sBD0FiXz2mQpMMCyrV8H0ToTTBygWVUO81aoFo5D0p+8akGcuVPpi0BFLd0Aco72t5aoFE81zATU3Rlofj7+QlqGy+yIQEMWdamdWmRbDgwmh23t6hfZ7eigxUYJZ5yx+aFipibBolfiQdCzUxPRX79nMkHyIYqgMPprHSvWftusINKyMmMEAnZXKcgbovBWf3IoRK7FtLuQnwaijLZsiY5D0utW8rwJAXG72PZTe/oOtklNh4vCCNtwtVyYPRyFaVbKVYecisyeDPpWTWtyF3we1I1QjqOVR4ucU8S16nP3H20wH4L/R3dc0D/Ev8ouczjrLd8h51f0eGlrJwwzSEhPw2eP3s9JDOQTb/cFA9No2FmvloDcQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(26005)(316002)(8676002)(52116002)(7696005)(6486002)(1076003)(66556008)(2616005)(15650500001)(6666004)(956004)(66476007)(66946007)(4326008)(36756003)(186003)(16526019)(83380400001)(2906002)(86362001)(478600001)(5660300002)(6916009)(8936002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 fSesLBDsG8CN+PBlEi5d+lFLH6CJYddyopH+uX7sXsm/btB2GiYsYCDL4+GdMWn9c4O9q/AKxyQXwXfAFzyMrGNTp4aPtqEc9MiqfEkLuMRQ5GchZoGz1wzLMAPiD/yEFIdH9pUkYznGrxSPOTtwGc1XjU0tDfUsCl1rDAPcJLX8F6SfkbeZcUox0Ha2eMTPlCHz6M9YfUAuuK+p8l6pDa7ufsi5CBYBBFRqg0715CntZdw9SSLL0XwjWccBJDg2kjnG0i0KRqshX0QPol/bCXp4aRsxR352PLqtAOYLQSsDj8Zh+jYWxSri8Bo38UrvmMkBUSPCUB2tu+Y9NkaFGL7G5WzyWu9h5I++eeWxki1mb9gws5R7VlVq3bEt/0ZEjl0F9XGGNxbDy7GGRwY+vRmEWSbx8yfi51fAghXOSNmkRIaUfOAFRDgxzIhEPMfnLp3TNBclpqIpv3J425DHGq3dMDslhDekinovhsDfnUwzoFLZRovJaK6Vwc+EGqE1r2Nv2yHI3x2N5DVWkpPwUKust5nntdj32MKd5kmrZjg3Viqjjm66eQVU04olLcpRY4M5L7GqNK4iNqNkwuY4A8IXXt9a3lUB0/joZf/sz0F6BLrUfv5WKDHhS+OxEbCGwiH57bgfRAI1btdDHDID2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2964
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	05bf8d64-c958-437c-3e3b-08d853c8ace7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gA2H+waAVAJVPhQXqVHmCNDJDn4+4fVYlMNS6n/Yk+BV/d1/TGqU1OmxksHUSb+UUzfTtfYl2leEwgdmN7lOBEuoPd3sAROtycz4dNsKXK1vdLxgyDpwcanZTIpCfY7+b6jYCg7zMOsgkYApfnFMp5r53dwWJrl0YdsmPsTkLPUSFchkJ4p1mhhsgIemZ570dW1NLY1QYeWVbUKKmuQxBOD+3MjXmxdgG1UH2gfdxmkEqudJLMxk0v4z3ZszH6yxtxbgE3sMvsig+k+b4CCrcwMtBR1zIcRZO88KcPIRmHHSG3fIjEfV7cDmGtMoqlfuBbiQzDboMuOX6NTqGB7DbX6K+EUMmL8TFIBzSuJZmaWDOsNAmeecMtjt+2AzAyH1fnfW9JYAeUAVgtCguJoWBDUoDo+3VE0UuFILH69ypwge0r/Dj2MOLldzCtCrW/16
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966005)(6666004)(7696005)(478600001)(8936002)(15650500001)(2906002)(36756003)(8676002)(356005)(336012)(70586007)(16526019)(81166007)(82740400003)(186003)(6916009)(82310400003)(26005)(956004)(2616005)(70206006)(47076004)(83380400001)(4326008)(316002)(86362001)(5660300002)(6486002)(1076003)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 07:27:51.6499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b8d76a-ca70-4fde-b21b-08d853c8b207
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4103
Content-Type: text/plain

This patch updates the SRC REV for SCP, TFA and edk2-platforms to point to
latest versions.

Change-Id: Ib6825d51fac89a9514b936ce927e7f5f3e508e26
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc  | 2 +-
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc           | 2 +-
 meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc         | 2 +-
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb     | 2 +-
 .../recipes-kernel/linux/linux-linaro-arm_5.4.bbappend        | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
index ce7acff..818b416 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -1,6 +1,6 @@
 # N1SDP specific SCP configurations and build instructions
 
-SRCREV        = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
+SRCREV        = "350be71a2ecef588b8ff5a095a0840de23506e45"
 SCP_PLATFORM  = "n1sdp"
 SCP_LOG_LEVEL = "INFO"
 
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index 84657ce..88967a7 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -12,6 +12,6 @@ SRC_URI_append = " \
     file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
     "
 
-SRCREV_tfa = "f0b1864f8e309a41d2eb1c9510f8cd3c7aacbb1d"
+SRCREV_tfa = "50eee85e044a77ad59f4903a5dad91b266770a1d"
 
 PV = "2.3+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 832b226..63154e3 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -5,7 +5,7 @@ SRC_URI = "\
 
 # TAGS and commit ID as per N1SDP-2020.03.26 release
 SRCREV_edk2           = "3ff8a6bffabad761279817252014d59b6069d68a"
-SRCREV_edk2-platforms = "b6bfc4417ff13168d69c4cbf2338f62c89c82dfd"
+SRCREV_edk2-platforms = "d9d32e6c8b7456d21ce365486ac563b6be36c20d"
 
 # N1SDP specific EDK2 configurations
 EDK2_BUILD_RELEASE = "0"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index feed922..577af5e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -1,4 +1,4 @@
-SRCREV ?= "41e8d7be674f98a0f3bef67b16ea2162109fd522"
+SRCREV ?= "84baaae9e751c058717d9702438429257f077f03"
 SRCREV_meta ?= "e32057eca987b7abbe3eb47ba36f06af8711278a"
 
 # KBRANCH is set to n1sdp by default as there is no master or 5.4 branch on the repository
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
index c83d258..84e75e0 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
@@ -15,8 +15,8 @@ SRC_URI_append_n1sdp = " \
     file://scripts-dtc-remove-redundant-YYLOC.patch \
     "
 
-# Referring to commit TAG N1SDP-2020.03.26
-SRCREV_n1sdp  = "41e8d7be674f98a0f3bef67b16ea2162109fd522"
+# Referring to commit TAG N1SDP-2020.07.27
+SRCREV_n1sdp  = "84baaae9e751c058717d9702438429257f077f03"
 SRCREV_dts_n1sdp = "3209a868152f348194cc1f20fd87c759d3a97d45"
 
 # Use intree defconfig
-- 
2.17.1

