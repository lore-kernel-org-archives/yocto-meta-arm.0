Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web11.6480.1591879724787880616
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 05:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4SjNWH+U;
 spf=pass (domain: arm.com, ip: 40.107.8.50, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWILSKsqooXP/36SsnmZ8i2rYGdP3Hf+Dz6LQjALlZk=;
 b=4SjNWH+UfsbuRP1lhW7BbpLP6nh0NUCwXNh8xJq+r0G2Pz1030BVzVPEE/8sIYJBJfHDdqLB6jutiscC0a7d+BvHTyzNonjV35ahD4bZxYIOl8Crup3+E2y0S/uGlZfiRa9Q/F6v4TSFI5/rax6osyYpNtlZXFIdFFd0kS3wpZY=
Received: from DB6PR07CA0187.eurprd07.prod.outlook.com (2603:10a6:6:42::17) by
 HE1PR0802MB2298.eurprd08.prod.outlook.com (2603:10a6:3:c4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.21; Thu, 11 Jun 2020 12:48:39 +0000
Received: from DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::d7) by DB6PR07CA0187.outlook.office365.com
 (2603:10a6:6:42::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.10 via Frontend
 Transport; Thu, 11 Jun 2020 12:48:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT017.mail.protection.outlook.com (10.152.20.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 12:48:39 +0000
Received: ("Tessian outbound 1145f7a293ca:v59"); Thu, 11 Jun 2020 12:48:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 624457aad9309e72
X-CR-MTA-TID: 64aa7808
Received: from dfb107fc2a85.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3822A690-A23D-4E88-81DA-97ED01EE3D61.1;
	Thu, 11 Jun 2020 12:48:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfb107fc2a85.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jun 2020 12:48:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WERAY+/y73dzcCq8IQSGW9cqoM7+cib0U4mjQJb91oT4RHH2LQkrsoy8yok+MvG//i+jbuLaJ9g1rhdY/0MsB283AwOPYrELNKZleg0nT92/LBn2mUhZMwmn+O9RfJanPS2cr7a43SEzv0zNVSU2lZVam3ZaVgtAiq4K687jsZYMmgyYEzuSrppnNh1PJ87AFjC1YBR+Nu92X+ybS1t7N8WgRZMTeZFAtDc3XjluuqCUJ18ovoViW4CPtJTZDPpb9/mgnyQh/eTvDX+T0akp9DJhcJz8O09Oa8EbvIEMkQ9PTLUbcNrPSX00LK1J8l1Qz6xYgPNEFDzttYLXejRfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWILSKsqooXP/36SsnmZ8i2rYGdP3Hf+Dz6LQjALlZk=;
 b=bkTSunUV6uVloqxSHgX1LJ/yu0qtJLvXQu/i+oriR+X7PHC7WCWl0Tys9VJRsir2qpnftRaAOOR0p6grZFo1g21MZ8aTo/FinS2wY24TrH6h3OmLHg08f20GNJl8kO1LiSU8bxGMr7CwVybftW7ZtjhXVi3WUSx0ko8+6bYSIkA0kdQs3HBlvUHJ36Yumymu+eeSr95wYIx/hZXmuU+pQor0RBeyiqppWVeCdk99x1iWd5S3Ii3xWOA0GrjwMjDhKgCOFlBY/Rh9Zgw9gjLIC6o1Y1gVj4OmuGO3oKhG7RxvFdmoWZR3UxN6uaw+WRY8HFSndqK+QpVfMDR87mauxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWILSKsqooXP/36SsnmZ8i2rYGdP3Hf+Dz6LQjALlZk=;
 b=4SjNWH+UfsbuRP1lhW7BbpLP6nh0NUCwXNh8xJq+r0G2Pz1030BVzVPEE/8sIYJBJfHDdqLB6jutiscC0a7d+BvHTyzNonjV35ahD4bZxYIOl8Crup3+E2y0S/uGlZfiRa9Q/F6v4TSFI5/rax6osyYpNtlZXFIdFFd0kS3wpZY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB3556.eurprd08.prod.outlook.com (2603:10a6:208:e0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Thu, 11 Jun
 2020 12:48:32 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 12:48:32 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Fix gem5 build break
Date: Thu, 11 Jun 2020 08:48:26 -0400
Message-Id: <20200611124826.29927-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SN4PR0501CA0096.namprd05.prod.outlook.com
 (2603:10b6:803:22::34) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by SN4PR0501CA0096.namprd05.prod.outlook.com (2603:10b6:803:22::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.10 via Frontend Transport; Thu, 11 Jun 2020 12:48:30 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 11 Jun 2020 08:48:26 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fd3845df-4b75-414c-d7d0-08d80e05c3a0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3556:|HE1PR0802MB2298:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB22982BF8E873A708F0F24678F0800@HE1PR0802MB2298.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;OLM:4714;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2RbTqL6WkD6OndcdTySb+bEdSyoMG6lHp5VIjLxvN6Sxkjpjp8sopE2OBRz1lT9Mo5/GuvdLNiLGP6kq8tIxsEwEW1Fpn563hVIiMxfmwUEZUjt3QT2IRUjTkKMdMo4Ju3sSEMLkUVPK9Jk4yCK0ImQ167I1ewAwxq0NxM4uLTijSkFHINehBfylOPbRJzsefTmOX2Uyyw+zql9LtdKcZubFQwKpX3Ws9hUwAD93t8zTJZlRA2fy73ukm+JCVGLcQ5mka9+dwB3xGmaMaN+QlIowMgeKys3Rtrgg6HYDp9U1FJsBOC8GC7AoiYJPYqrnV/zVnjfa37yrUieWFiryQg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(8676002)(2906002)(8936002)(5660300002)(4744005)(86362001)(36756003)(44832011)(2616005)(426003)(1076003)(6916009)(42186006)(316002)(4326008)(66476007)(66556008)(66946007)(186003)(478600001)(26005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 CT5cy8HnBedWmVS/F2XZgkgsRvqwP0+wet2b9PaAj3BAWQJ0SCTpl9to3Keuk+oucpDKpR5Ka7NILuN6L3eEjOYZY64FTCsyza3x6Rr+bpLolGS8ne1r76Si2B8oUZRDjV7+1+MkwUt8sqdXLBOpNigGfmPKW0MwOjptfg7rYP75todySa54iUFoJDZwh8R18f4GdAH9GQVWX3pJnlmnt/HjcdG4V7uvyZiorTIBHR/CCP7pIE0JnAhEORneSVPCPzoiiIESP60jbccgQIMPyILg+N86e2Indz+ijvxZ9up7gIsANScqrrfiJgbMaPgInC59nR7YO1tiaN3zSzapHUTjN+Ie54nPedlDtwx0QblKVTOOgR+Y9kt/hZYbmmld7Egrjwip/C+/Qq07WaUoha5K2rEVj1k7nwPAMUZ5t4nUptMUlN15LHSSP0+szu6N3wR7e9RxF4RmGkx+mCDZ1WO0yhZTLRncY5G4FO4BJPM=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3556
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(4744005)(5660300002)(4326008)(26005)(186003)(1076003)(426003)(2906002)(86362001)(336012)(47076004)(82740400003)(70206006)(70586007)(478600001)(42186006)(316002)(82310400002)(8936002)(6916009)(356005)(8676002)(44832011)(81166007)(2616005)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	26daa2b1-080f-4633-7fc2-08d80e05be97
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jJ5FzWuU+SVs0gVLfKoxMcgiglVk2dz9gG4GsXIkTGKZYg1dQXmEZ2poKZTV8RZtizXygHCoNZ3ATuHCbZ2BHnCDWrsTdl3vzUAbEK0xNnF35+7J5VRs3uVN8AGq/8vcGW437zWvubOWw6TO16CQ+5FSHxcxYQEvA/km8YguE1wn8/Ghom9nLYbBlqgsRCfepbw2LqmM3E9LG55Z9gGccAURuHAspy5cQxlLl9OEVjh8L2VSbASkBWdY/H0Y8MkZu0UR5Jsld9RRIWZ+9vuF6zdtNX2wEr5Vf1gp6UfjUNI+qJVRjkDb9mS22Dcv3yWMrLaIbb+2YP57t/q0o2YT+QK+Dz6hTn6JRKBk6euVihzlYbOZKS72PMXHOQXFKOPnfKnZG2epkpFuKeUHxHP/OQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 12:48:39.2578
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3845df-4b75-414c-d7d0-08d80e05c3a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2298
Content-Type: text/plain

OE-core removed DEPLOY_DIR_TOOLS, which is causing a build break on gem5
due to DEPLOY_DIR_TOOLS usage.  Temporarily define it in the recipe to
get it working.

Change-Id: I8d4d6e73009cab8ad7102045b855afcad34d3bf3
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/gem5-arm64.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
index 4db86c9..fc31bcf 100644
--- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
+++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
@@ -51,3 +51,5 @@ EXTRA_IMAGEDEPENDS += "gem5-aarch64-native"
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
 PACKAGE_EXCLUDE_append = " rng-tools"
 IMAGE_INSTALL_append = " haveged"
+
+DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
-- 
2.17.1

