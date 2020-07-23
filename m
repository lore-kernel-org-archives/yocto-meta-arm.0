Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web10.10588.1595505343788182195
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 04:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6X/8ckw6;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVBsBENlyUmbmPGMycxNx+PcTVvoBNqUYKqC7HyYnzQ=;
 b=6X/8ckw6vrnrSiWI4VLEm9Rb6yqj+5+14ixhLitPql0HWn+KFnnEx37WLeBNy/ZjkgfEiYpXfdyeuxRM8pyl6H0HPPaJxaoPyWV7KOEHMA5guNviIsB/RKvyy8thTp7GmDDXa469qq/T7EzqgxUKR2o2bVdEO2UkgTbBnYxIIKo=
Received: from DB8PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:10:100::42)
 by AM6PR08MB3814.eurprd08.prod.outlook.com (2603:10a6:20b:88::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 23 Jul
 2020 11:55:40 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::b4) by DB8PR06CA0029.outlook.office365.com
 (2603:10a6:10:100::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Thu, 23 Jul 2020 11:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 11:55:40 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Thu, 23 Jul 2020 11:55:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 698424bc49ce7d63
X-CR-MTA-TID: 64aa7808
Received: from a73617f8592c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B80CB3DF-C016-402B-9FD9-3D1BE474E558.1;
	Thu, 23 Jul 2020 11:55:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a73617f8592c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jul 2020 11:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhMv9t53FBhAV4diSOfbrbvHMuuotfK7deUF/5dVBqgUUc0gdvn4pSm+ak/pyWHG0NiTYo+n1IVbvcRSEu3v02E0IfSVsk5aMV+AZxEHAsiqcdKWBvu70BuN7OZUm7iBWt+tR6rcWOyce7r1/VJvuWyTsjQWOB+pCZfvIihd2P4GmoLmYqC6xezNIMcIJok6yLlSC2zZ6LBQLQInaM8tDk+tenl+jX2+TJ5KgH5spcDK0sC/rvJScdL6CUGH7oD8Z1iAgezx+5BdYC5H+fAS6I+exVyoAmJiOKWMpVUa6yszHHeUNRWhw88dj6S8LxicvK/qFD54g6FYi7Z0KsrVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVBsBENlyUmbmPGMycxNx+PcTVvoBNqUYKqC7HyYnzQ=;
 b=aJt7OY9uwQElws+iqkuLD9H+ro5/GOJQkc61rmTtORb/3NmER6AKoB4dAvfXIpdGbQ/y/aGEs/x8zCPmugnNLc91ssW041O0EoR581euWa++5Dv2psrjYFcbS4LS+fFHdtQyMjlAKVNElq5fWsJDEtfas4hHJYEVe3GzGPBMsDqEujNWN2COPWfbo6JyEjc4JaRYmFLcgIYMkAhBuYXKxh4rjTS1zRekZmNPEBb2HMd0bUjM3UZM92gvNdH8ABdZtgRzcd5QoM03oL1cnZascPMRyxxc0nKnSeOWaE2QravtE2yAEHNud0Cq0KpSFnzC09ljKL2wilXSkmS9ghrb4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVBsBENlyUmbmPGMycxNx+PcTVvoBNqUYKqC7HyYnzQ=;
 b=6X/8ckw6vrnrSiWI4VLEm9Rb6yqj+5+14ixhLitPql0HWn+KFnnEx37WLeBNy/ZjkgfEiYpXfdyeuxRM8pyl6H0HPPaJxaoPyWV7KOEHMA5guNviIsB/RKvyy8thTp7GmDDXa469qq/T7EzqgxUKR2o2bVdEO2UkgTbBnYxIIKo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB3961.eurprd08.prod.outlook.com (2603:10a6:10:ad::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 11:55:32 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::756a:e5c9:72e0:c023%4]) with mapi id 15.20.3216.024; Thu, 23 Jul 2020
 11:55:32 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2] arm-bsp/wic: fix WKS dependencies for N1SDP components
Date: Thu, 23 Jul 2020 17:25:21 +0530
Message-Id: <20200723115521.23703-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LNXP265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::26) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP265CA0062.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25 via Frontend Transport; Thu, 23 Jul 2020 11:55:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61242eb8-0666-42e5-65bc-08d82eff5255
X-MS-TrafficTypeDiagnostic: DB8PR08MB3961:|AM6PR08MB3814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB381483696B26234EB27D5E2DFA760@AM6PR08MB3814.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RGH5nq3ZND2k8+R9rXZmv/fxUIqAPcgLx6hNZv+35IV0+91MlqVK4bVWTSIIQtoDNy7lvkt0ifLjS9LVUIzP/IxVkaxOOdmKUzjaSHXPX+U6jYZvwswUayfgBtyO8hmXKg0ptgNe9E67VYCB1U4QojxPsaa6b213t/Y14wHsUeffxY1m2wwmTQzkYB/JC0KkmWgfr81eQ/4CQKcotiyHKP5bIiezmnCgv5HI0MqH/lOHcU27x/jbyNb17z1PD0Ics29DdVCv3XzW5tKw4Z/oB8PZXaYZK1ritYS3rcQgzVtlu2BLLPs83v5MhFnh+lycIUFRv+sE1Sml8lLCj5TdyxawCFB+QV5Ibzbm2k6PYABaw1SwHxTmeENb12X/SVbj
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(956004)(8936002)(66946007)(36756003)(4744005)(66556008)(66476007)(8676002)(5660300002)(2906002)(7696005)(52116002)(186003)(2616005)(478600001)(316002)(26005)(1076003)(4326008)(86362001)(6666004)(6486002)(6916009)(16526019)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 oCKOlILolnBpAkd/HLQWiLCpaC5kLYgsa19lZU2FSSk3onWg1IvlvAHKkhjVAbhSsXlLNcTrjpyvvIuBqsWKx7+SpCTuVM/ylk0ndCDfcFGHbKOtXZB/X+V+x/F+O58oFYJd3SkIiXlxy3WrSzc6nVa15SS9Kdq4SsK9MkIbFW6UdrTtYnsV2JBAlEsyAWsFz9XoVmAsknkZfKI65SqoCYKofVr+heVuaW1jmwm6+NFz67kvyusjuffqdtim/sV1VNG1DLcJf2GDWFQza8/0WEKjMhhj2bKkCiObSoTN0BqQdQ2ys7hITOkgna7crTxnSQzH/EwPOAdm2TkUj0yYT9m1ul34P1LHLBTExjLZSiGqHtLTcG+0G4aw2Z7cvnFm4mrZxI/btGIvAskcq/JU6Dik+pTasahaDHWdsIoUAn8iLTPFURm8hseNMieL0BhiC16KTg5PuNgSZoo3Ib8QiqqkzJg7qdrjw4zJ4CuPUTgsVvaglanjmupnrznZaSTW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3961
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3b8a11ed-d6c5-4559-5678-08d82eff4d51
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sz88ewGzBk6rd41kVllWORsrfLPbW2ZMd3pyY2UNTJqfwvvXXnW445y6seH5Ephb6XxNLNI7HxWDat0Qa0dra3oqKuqbQaGEOh1n1oBrWxw4WEybEoGT1r3aE4I0nNWIU+1m4Y/hNkor/L4+QQ2dF7t/kOGUmnXksE7/P0E/vqboLI3MbhGul5k3kT7uJn6T5l2M8+Jpz565cY1sJx+TC1n3/LDCmQL+825f8dPA865Ve4sLf9WryI+Sp61jpG28QAzPDNrSwohd98Ioxm5YckCom4SyMqmCPz6ics1GUkiNh+eeuprnKKXIIZYxY8aCgRAAGV5fG6RtQDLOwlc5xoymByS0HHNVDha6geG73atmujk2CR15DLSkoaQnUOt0xGNm96FPZasZITFjAzqxZ9DE269Oss72JiYbNHOBU/8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(86362001)(7696005)(356005)(6486002)(6666004)(478600001)(2906002)(5660300002)(8936002)(316002)(6916009)(8676002)(36756003)(82310400002)(4326008)(82740400003)(336012)(956004)(81166007)(47076004)(2616005)(70206006)(26005)(1076003)(186003)(4744005)(16526019)(70586007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 11:55:40.5721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61242eb8-0666-42e5-65bc-08d82eff5255
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3814
Content-Type: text/plain

Add build-time dependencies to ensure the required components
(TFA, SCP, UEFI EDK2) are built and available before
the task to create wic image gets initiated.

Change-Id: I3789c8d1a44984a26d31ddd8ddd5d16f4d58c7d3
Issue-Id: PLATFORMS-3134
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 139f619..d651270 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -17,6 +17,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 # Set default WKS
 WKS_FILE ?= "${@bb.utils.contains("EFI_PROVIDER", "systemd-boot", "systemd-bootdisk.wks", "mkefidisk.wks", d)}"
+WKS_FILE_DEPENDS_append = " ${EXTRA_IMAGEDEPENDS}"
 
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
-- 
2.17.1

