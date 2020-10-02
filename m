Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.44])
 by mx.groups.io with SMTP id smtpd.web10.15209.1601647537355711280
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 07:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=080lZSCK;
 spf=pass (domain: arm.com, ip: 40.107.3.44, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1mLVK0Yz6tItgWmeckicoJJDoCCMvHh/R0zpjpTEzQ=;
 b=080lZSCKZU3Nbtm/FQKZ32MtJmAvA+l7oi84dTJnZTjIaxS+4jpU/JoIi93zbqLhQE1MGzQXFvKAIkgTKfdIcYXbXGRE2hxzQBhLA5DTGiVuUQ4sJJxg1/3sVP4owrLVLicd0IJEk/pLCvG3lhRwR4HPDsaiRpXrh85++8CmvJ8=
Received: from DBBPR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:d4::21)
 by HE1PR0801MB1882.eurprd08.prod.outlook.com (2603:10a6:3:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 14:05:34 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::6c) by DBBPR09CA0033.outlook.office365.com
 (2603:10a6:10:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Fri, 2 Oct 2020 14:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:05:34 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Fri, 02 Oct 2020 14:05:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: be70e9ff68553425
X-CR-MTA-TID: 64aa7808
Received: from 4a7e2a615ba5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 18AA988C-5E6A-4C28-A286-BF367CDA12DF.1;
	Fri, 02 Oct 2020 14:05:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a7e2a615ba5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:05:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUgqQ6vDQZ81AGsa2bErK2O1ydI3y+Yxa0L/5WNhonICDsK1y4NfWJ9N70p6uM7w/ozAizgiLRXdRHA+dBiefdJqWWQIzaI8KXjxZcnNoDzl8UtW8VQn82PYBQpJEh0ivTBhZJB5qCTt0M17bxFb4+GS7YMloyYHp4hxql6qePJYD8PBxdJNUN9vj/2UfGmLfELK1QuTfIf/xXTC16KtcPbKIO0VpEgEOG5n8peJ+YkvbnTJ4zsB9oC5zz/Li6Uc6pzARLMmDl4yxj0/dUvoRwQ+xQJe2weDX7RbLKvcAEcaEAIZftSZJg8RS0TdfDn4fvtk/sFo6vc/IR39pFanfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1mLVK0Yz6tItgWmeckicoJJDoCCMvHh/R0zpjpTEzQ=;
 b=DyNvWX4yT4AAmB/Ftu63JI0D0eyvgwGnLX8yq+DorcJZRzXBb6emScJv2Ub4le+TinzJWuYNjHNXJKDBOKrum+ERz/TUJfKJBKRTAsnbJMS5bCLp3lh8yEMD6jFETeOa1Bkmq+OGyihQYKvQKp3Dm5JgUf19tS3zG2tpYqJZ+jQrfIY5QFmIkBVWXkajVzFBtPTfiAS0P+aPFdTPVc155eV4n9S5ikYtLzptEmLLBbTmAOWjCI6V0C8vYWXC+M2aYmz7YknD2B2tLgCQ8oe9iI2a5A8zbzgbpjcOSUv7hsF7WNHP9KmJUjZ3xaJV9CicPqlqwHhC1w04lAnOPlynmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1mLVK0Yz6tItgWmeckicoJJDoCCMvHh/R0zpjpTEzQ=;
 b=080lZSCKZU3Nbtm/FQKZ32MtJmAvA+l7oi84dTJnZTjIaxS+4jpU/JoIi93zbqLhQE1MGzQXFvKAIkgTKfdIcYXbXGRE2hxzQBhLA5DTGiVuUQ4sJJxg1/3sVP4owrLVLicd0IJEk/pLCvG3lhRwR4HPDsaiRpXrh85++8CmvJ8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 14:05:03 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3433.037; Fri, 2 Oct 2020
 14:05:03 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] arm-bsp: remove armv8m
Date: Fri,  2 Oct 2020 10:04:04 -0400
Message-Id: <20201002140405.7896-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002140405.7896-1-jon.mason@arm.com>
References: <20201002140405.7896-1-jon.mason@arm.com>
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: SN4PR0201CA0005.namprd02.prod.outlook.com
 (2603:10b6:803:2b::15) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN4PR0201CA0005.namprd02.prod.outlook.com (2603:10b6:803:2b::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37 via Frontend Transport; Fri, 2 Oct 2020 14:04:46 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 02 Oct 2020 10:04:41 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38f3ce14-4c42-4ffe-0062-08d866dc3b42
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|HE1PR0801MB1882:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB18823765E3010502322753E0F0310@HE1PR0801MB1882.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /kpBZwfV1RWwas0pacz7+o4A2RPsvKXK19/w3Q8Cb3kj9lI2jwA+/9xbepwNGbXDwoBLF6QowpEtbahhYrfXD2fPOfvAeOc07aRb1ujFj9NbSvLsMawGdq1dYz24hpqi9qweuvgrOtaFHayb++RDyaRET+DngYtTkjYGU9zBZAJvBp1OFlKYrmuSrGfXX78y2JhpfuMbr2LmHBRQVs7yH67xySY+l6BzYD8yORKfbhQSOXJTQ7ImDTwOywwSlJoJNDeENZjOXH46nRSwOgSxZ4FYiya8udCe/FGvd4SZoaHf/uFtZmRyxEFTPR3WF2dd6OwtXHy+O4EbY9yAK7E/FV6kfcFRWntI8eHcVr3+6hoacDYcQaUY72bfuLOYTW6+szgzoiX1yexNfP6qtV8iT30nnnYshMOZkWS7x7upqbQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(186003)(26005)(1076003)(2616005)(44832011)(6666004)(426003)(66476007)(86362001)(66556008)(52116002)(66946007)(36756003)(5660300002)(8676002)(6916009)(83380400001)(478600001)(8936002)(42186006)(2906002)(316002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 7/c1OPa2DkfJJ8uLR1fn9MWo6xdwmicauDFnCJN9XWNl63QPbOiGEV2bGn9GKIgChR9LXCoxHYC3iN4YFHij5sDJwpJXVGBA8ffrIEv7DIvowYtbAizdoG1kg1LE0pXbpKnvvAqMTIZPIT+8R46DUmobeV/926dSURaX3iLz9ZSkJ2yxo0cX09H98M08h8relzX65Teg2v26fsstlw+vrjVfEiJ+D6mctq6D1C1VG7060mZiXEeUhhzna5lvFcIHz9cAEXTl5xku1Gp7cxKPg9dDN9J91fEBguLHDw9sr9/1tO2GEj5K2NFrynf4IHUI6hZ11e25EiSFmnRjTkVgMlMQ7sbp7vRzdneEL6BK+pxeIDg9m0zGSAixkaNci/66GRQ6S73LrCKCzAc5oWW7lk0laJBHPl7aMLZ8oKHtoOr9Bmfjj0zcBv/N6b/2YMlX4cbb63UK5d/vVS9TZPDKwJ9yMg9TlxbP+ryKGGm6epErZOM6oGZEC2lW154mS6DFRmN/f5lvd4rrcJTgLzt7Vs4sKwHWAlT9xwcjyRCPOpKHepG8lBuzXE74Q7ipN6PGNFCjlO0B16d88sT6fxRdkrX6qlTtV4p7Nd0UWxO6cMHiAKBvdlgQkvnVR9EIE5xKRqiyxrrwAeix3kZhs+JXvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	de969fc1-15d1-4f55-b89e-08d866dc1efd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y381ORbRFbyjyx1u3JlrHTPVTcOcbRla0NKm/sbkibwzwcRRk4JwWb1lPpBf5r0jCLgSIq9mbYtPyVJhriNdcjNFtR31jBpncCyarnKJlBHTJOlLwxAgZviBOaj3z3WkU0DV9egSKsaeyvHcihfBzdpgheRYtHjz+AZSW8ZkDDQfkawU55esswTeeQbwftlx3Ge+10relAmSw740WavTtJNq/I37I2LGnR0YGW47SdQdE6Fq1O6AcffvwdP0Mbbv3lWxXeKXZstV7UFFH0XHj3SsQQvkBUTxCK9TjGczPfQqUenfaqLngRZODJUvuO1nizgDQ2QotLfLoIux9y5P3Z4PwY3E7bIOCLcRRDEmdDQ4pwIlL5ySWVflkgM2cy+pPL8RldATKlbrLn9NqBv93GxcExh3E/s1bDPOJrOE4lc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(6916009)(82310400003)(2616005)(356005)(81166007)(36756003)(86362001)(47076004)(316002)(426003)(2906002)(42186006)(82740400003)(26005)(44832011)(6666004)(336012)(70586007)(186003)(5660300002)(83380400001)(8676002)(70206006)(8936002)(478600001)(1076003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:05:34.5884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f3ce14-4c42-4ffe-0062-08d866dc3b42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1882
Content-Type: text/plain

Musca B1 and S1 should be using the external tune files.  Remove armv8,
as it is not correct anyway, and use the Cortex-M33 tune.

Note:  This change will prevent glibc from compiling (and possibly
others).  This isn't relevant for a Cortex-M, as it should be
running an RTOS not Linux.

Change-Id: Id88d2af41217e8b5bad01e98b337cf0523acf6e1
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/armv8m.inc    | 12 ------------
 meta-arm-bsp/conf/machine/musca-b1.conf |  6 ++++--
 meta-arm-bsp/conf/machine/musca-s1.conf |  6 ++++--
 3 files changed, 8 insertions(+), 16 deletions(-)
 delete mode 100644 meta-arm-bsp/conf/machine/armv8m.inc

diff --git a/meta-arm-bsp/conf/machine/armv8m.inc b/meta-arm-bsp/conf/machine/armv8m.inc
deleted file mode 100644
index 0763193..0000000
--- a/meta-arm-bsp/conf/machine/armv8m.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DEFAULTTUNE ?= "armv8m"
-
-TUNEVALID[armv8m] = "Enable instructions for ARMv8-m"
-AVAILTUNES += "armv8m"
-
-PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
-
-ARMPKGARCH_tune-armv8m ?= "armv8m"
-TUNE_FEATURES_tune-armv8m = "armv8m"
-PACKAGE_EXTRA_ARCHS_tune-armv8m = "armv8m"
-
-require conf/machine/include/arm/arch-arm.inc
diff --git a/meta-arm-bsp/conf/machine/musca-b1.conf b/meta-arm-bsp/conf/machine/musca-b1.conf
index 0f9734b..e7320ba 100644
--- a/meta-arm-bsp/conf/machine/musca-b1.conf
+++ b/meta-arm-bsp/conf/machine/musca-b1.conf
@@ -5,7 +5,9 @@
 #@DESCRIPTION: Machine configuration for Musca-B1
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
-
 PREFERRED_VERSION_trusted-firmware-m = "1.0"
 
-require armv8m.inc
+require conf/machine/include/tune-cortexm33.inc
+
+# GLIBC will not work with Cortex-M.
+TCLIBC ?= "baremetal"
diff --git a/meta-arm-bsp/conf/machine/musca-s1.conf b/meta-arm-bsp/conf/machine/musca-s1.conf
index 4b6b575..a37657d 100644
--- a/meta-arm-bsp/conf/machine/musca-s1.conf
+++ b/meta-arm-bsp/conf/machine/musca-s1.conf
@@ -5,7 +5,9 @@
 #@DESCRIPTION: Machine configuration for Musca-S1
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-m"
-
 PREFERRED_VERSION_trusted-firmware-m = "1.0"
 
-require armv8m.inc
+require conf/machine/include/tune-cortexm33.inc
+
+# GLIBC will not work with Cortex-M.
+TCLIBC ?= "baremetal"
-- 
2.17.1

