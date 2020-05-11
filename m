Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web10.11561.1589202912254663904
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 06:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1d576IFd;
 spf=pass (domain: arm.com, ip: 40.107.6.67, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+g2DXF3SH0jT0O4CTNuao2xTyFncndGYvCBu4CMQNM=;
 b=1d576IFd+9+fERTXbSfyOsGw5T5ZYNcoqMcIntHzoJn6up0CdMKkj7gLN//7wSqp9LDymlLw6ie9efqkmVgLMlKdCToAy3lXyRlyeNgQ9sKbRQ+iXtvKGMQWaQUDJK6My+ddSfwUoQBXq2zzQcGKvU6uzr3rgZPX9+nLQbB6HHA=
Received: from DB8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::12)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 13:15:06 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::2b) by DB8P191CA0002.outlook.office365.com
 (2603:10a6:10:130::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Mon, 11 May 2020 13:15:06 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Mon, 11 May 2020 13:15:06 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Mon, 11 May 2020 13:15:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43d40bd3f9438303
X-CR-MTA-TID: 64aa7808
Received: from a849e5663360.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3B20A8D3-1BF5-4FE5-88C8-A0817399EAF7.1;
	Mon, 11 May 2020 13:15:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a849e5663360.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 May 2020 13:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XApzBNiTA0LvmWBg1DGmcXeiXCev4ITlywZtJCbRxY95FScEzisD0ZOQp7wKql19LvT5VGT0Z9t52iCWPz9bWTJOJUEr2dHJco31l323oTwtx8yip5VjWvbCMavIa9DI356URYcuRCKBOsa959CD+R/0DMOd5fsf4aRNNHx1zI0Z/nOt2ECHZfZdyMyYQ3Zl8JSSKCmI28ijQdOSECbc5HkF5MBoEpqduvoxNSNf2rf8ShXaF3QLvbr0AGMMEHDXWDuk7Vuy/o+yubezhtImptig46iSKcJnewJu+KDbo1PL4uQNazlf36ue7jOl00u/iQSw6kf9glizpE+lQjfFag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+g2DXF3SH0jT0O4CTNuao2xTyFncndGYvCBu4CMQNM=;
 b=g99MzMABHLRJlLFRa8Wo864uxaLLc6D03hCiXk15k55VTBY6VLB+rErI2gwCtztfAXntmN1/hlxrfDFqS4q4Rej/T2SSY35T/40JDFrk86qTXEWOqTFfF5kYEihp1WCAi/LUNE8UgOrYFmHW/xFy4TLAG+XWCr9Zfrk76BX84wK7t1fnuapNpU5QgDMuqVsxOPKGQ6SMG5OQF02IVKPgUtDAreVy8hDP1zmwGibrhDfD8Q/SU8xDHbOy9CUlF8t8IamBGYsVAs9yWO4tlSepkuQLv/RwsiU2mEVeLPSjFhaqCpUOzpHJpO2l8kCd6im6+UM4xLZgZ4RTP4cBYlU7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+g2DXF3SH0jT0O4CTNuao2xTyFncndGYvCBu4CMQNM=;
 b=1d576IFd+9+fERTXbSfyOsGw5T5ZYNcoqMcIntHzoJn6up0CdMKkj7gLN//7wSqp9LDymlLw6ie9efqkmVgLMlKdCToAy3lXyRlyeNgQ9sKbRQ+iXtvKGMQWaQUDJK6My+ddSfwUoQBXq2zzQcGKvU6uzr3rgZPX9+nLQbB6HHA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4226.eurprd08.prod.outlook.com (2603:10a6:208:147::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Mon, 11 May
 2020 13:14:59 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 13:14:59 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy: Add CONFIG_MD and CONFIG_BLK_DEV_DM in xen-host.cfg
Date: Mon, 11 May 2020 14:14:58 +0100
Message-Id: <1589202898-35955-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::15) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.52) by LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2979.28 via Frontend Transport; Mon, 11 May 2020 13:14:58 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ff1d193d-1071-4e61-8428-08d7f5ad52e4
X-MS-TrafficTypeDiagnostic: AM0PR08MB4226:|AM6PR08MB3158:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3158EFF499451CA86833830292A10@AM6PR08MB3158.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K9albxyV089264/YbgoCOq6doUbVuwqAP7AFyBce9tx7Tl0iKFw2nDVk6PSB/QhsLoEqi9I+DsBZiyxfVLGpJz89x5Yo1oVwtE9JnqF8149N0iVqfm8Ek7OEoHLEJdL6wY3sgZTQ6tFTeBffIaBK3UvLbrEr+kOBj71ve6V3NtQYHw7qF/mB75wFFXSGMgZqoCp+LBzyItVPvF0pOM5vBTMeyxZ8g/e9bmb9BhwWMncNfQOW/lXroFrm2yNkMG8n73mFa9InTZT3if00qA3qZoKWZDqpZhf+If82cWpgoNEiPLoBsi1WdYH2/FNfym7GXda4ZH4aoW1+CZvOH3ZtNfYPblEQMbtotmD1ig57scg4wpmrCzv4f4aEUhMyz1pFqufyyPFs+MAMAAjeX7q/4pXyMMvByZ/0GY2aI3beJ78EK9xmAQzK+HOs8SwKtlgyvV+FEAk550I9GrJ+X2IN5SK8Gn+DdzNoLZtdbdUWLk7pzWl7I+7taZigez1Zt1AASlNVNuCnSrM9gHkPl8A/Ew==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(33430700001)(44832011)(8676002)(8936002)(5660300002)(316002)(478600001)(6916009)(956004)(2616005)(86362001)(52116002)(4326008)(66556008)(2906002)(7696005)(26005)(66476007)(6486002)(16526019)(36756003)(33440700001)(66946007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 dZFhHIzsSW/zmVlcJq9kQqESFY3KX1ucxWYdrSdW19N7YvBRGMOltpeEuhTp6poPCexXo7mHlGzx4UHCDrJ4b3joBzcfd/2kvic5BvoNipaXar4NFfiRa73em1+NrLRH+LswhRodRUoxSsnGgGlLPbwT605LkEr4jcuS2Q+rMGx8Ef+U/zIBFidQcbI/idNTFKNe5EcWEmQObTKYLjiG+vVcZ7sKaP/F1eb6/HkOez05g1Orns45sROTgGSOZq+LMgvMDH+M3NF0IoVMFQSGloG0U0+gLfg/9xhZLMznT9Bkm+LyNUYOB8h9CNicmnMax51+OILrhYwezqNpa9z27iFJ9djIDB6y4EYB1kKIot4bclOmCs1xp65YfziYhySV2GI1EGkUTScge2evNqGnylgPLLaJx216zie5KwqHfir5Uuy5cBlaOA/yKTXE4vDgTTVtFIVZ4Ch53nrPEGppYoJM6ChkzKpAvbfomREAUKFnBDbnV/WqYwdeGSS6VuKR
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4226
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(33430700001)(70206006)(5660300002)(33440700001)(82740400003)(16526019)(70586007)(8676002)(316002)(186003)(44832011)(356005)(81166007)(6486002)(2906002)(36756003)(956004)(4326008)(7696005)(2616005)(82310400002)(26005)(47076004)(336012)(6916009)(8936002)(478600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	02718cdc-93ff-405d-d4a9-08d7f5ad4e69
X-Forefront-PRVS: 04004D94E2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FgjrVAy8HsPfROjZt6h/AJyUztjkSfGiQB7ambabTkh4Ax7OdQN8h6zsGmdbk5YG/XgWXn7RZJgos7LLDwflG3DV20+wEhagbgDq7Hz3GBlbooVrpWzHXkLsb7+pAEK6Q0lVaeEZwilcI2dwfqyMPFDeGH/ym0nfTgb3QxCgYmQOIth/dbDijJuRb7X6ZplNBwkPUXgupqJFIRPfEDSvzWUs2/dMSQZVJ71ZG4lNUXejJzbubd/SpGqASmijUZGmeYMMoac7SzBVw3vbMf7zdxW55MsVSxFqtHT+p5knEtYvStMQpei97uriE/bFduXcqTwo6q4aSldsrLU/Mcv2yXHQDjWmjAtejD7DZwrMm31E6X/3yictyuVM4TRT8Q74/1B53JhUyjQmpkY8yzJX4Iakoj313X6XMyV2yNVbNIowuxYMvPsaBU2jwSA+j0Kd4SGwRS5EdT6uVuHbyYmZPPUh9F6AIgK0pQGUoYMxqKn4eLvEBiL1kLqKMrbCUaU09gEKL/WnKqRx9cBxLoAQZD9xTxui5fZHwchZ5i9WCLUCFCksSO+BFy1tqPsGA+Z5najpY4Vu9jGtDZgIB2dABg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 13:15:06.4949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1d193d-1071-4e61-8428-08d7f5ad52e4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Content-Type: text/plain

The CONFIG_MD (Multiple Devices) and CONFIG_BLK_DEV_DM (Device Mapper)
kernel configs are needed for LVM2, so add them in xen-host.cfg to be
included in the kernel configuration for DOM0.

Change-Id: Ib5f4f4d767751615ee1239e95da7a7d56cbbc2dc
Issue-Id: SCM-996
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
index 2affab9..d457cb8 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
+++ b/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg
@@ -33,3 +33,6 @@ CONFIG_SWIOTLB_XEN=y
 CONFIG_XEN_EFI=y
 CONFIG_XEN_AUTO_XLATE=y
 
+# For LVM2 we need Multiple Devices and Device Mapper support
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
-- 
2.7.4

