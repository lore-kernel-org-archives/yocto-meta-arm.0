Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web10.6418.1607422708597628900
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Dec 2020 02:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GJi09bkp;
 spf=pass (domain: arm.com, ip: 40.107.21.40, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GqlMQpkXS4KrIOb3f4X6ZtPscMeq/zbkn4WVlT2Vyc=;
 b=GJi09bkp96ZqgsZ29k84B2brYsroKIBLqGLXatZs2PT9ssOGUauhGGYqGKd4WBXkKgSwgi9Y3HgV+XGA71AqEaOTZ4JFhcmlAriwYqL3dbpFBzUCwXyE5eUKh3Q6X/Iym1TL8qUOTuD0GCbzoIOYuZil/jl5+SVTqi67lSg/P6c=
Received: from DB6P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::22) by
 AM6PR08MB4213.eurprd08.prod.outlook.com (2603:10a6:20b:8e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.22; Tue, 8 Dec 2020 10:18:25 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b8:cafe::3a) by DB6P192CA0012.outlook.office365.com
 (2603:10a6:4:b8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 8 Dec 2020 10:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 10:18:25 +0000
Received: ("Tessian outbound fc5cc0046d61:v71"); Tue, 08 Dec 2020 10:18:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed8a4b598dd882b6
X-CR-MTA-TID: 64aa7808
Received: from b492c00a6889.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 63AB33DD-5676-4488-993F-8A6EA4B4ADD2.1;
	Tue, 08 Dec 2020 10:17:47 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b492c00a6889.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Dec 2020 10:17:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCq5nhROajwCCjiTktwa/8dtzSdaHCuJikOp6hLkKKBd1SrxXxOe7wMvmcqZENQpZbYtcswWPhQDxl80orrHy9AvYc156pLWsJyimN5bLGDa3Uaqvj8oz90VmMd94cOspzIeZQN4m31NNCMFg9lFq59nm2KZCHayIoYJSbWjaLIjOuXJKcseEXqo5sIXHA4TlGmhNrOsw42ouoVpLf24KFps/MNlMd5HFR4LLYvnkPkzYBx8+9TX0QDmwkZZkC7mT/D4Tu1A+ZfWdSVaFgkx5842t/TAnOjdePZyvwsVvbfzKaUBvUQ+qdtYL/m979uf7p2F/xvm8cGj0C/iArV8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GqlMQpkXS4KrIOb3f4X6ZtPscMeq/zbkn4WVlT2Vyc=;
 b=mwQhO3Wix2E09t49HZJ4ofX13nOoLTDIT7ImUWp2zk77huVmvN4+RjRYHMQNG0qeKRyZ4beS+TesBkA+ICiWscM4gRdJhzr1wcwZiwtaPjqXyY353uNbZy9HwKdF9i90Ugn3ETBCQE7F/8zH/xhY9bvu6jUxdeRuor4a0zaU/90VTmfJ5gXHcG2EUd0UMvx82BIg5sWHqXM9hmr/MgNKL4PE2aw66QvT9aNDYUeCaN8VVvv1ntJPVYmRTrxAItd1COGAdSsHFhwgbfE8EYYjrjlNCWDYTTFO7Wb5Ghk4RiFOt2xkYV6aWKGwZhZNDeBV4wAKCQ7PIikJmLmasrMt7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GqlMQpkXS4KrIOb3f4X6ZtPscMeq/zbkn4WVlT2Vyc=;
 b=GJi09bkp96ZqgsZ29k84B2brYsroKIBLqGLXatZs2PT9ssOGUauhGGYqGKd4WBXkKgSwgi9Y3HgV+XGA71AqEaOTZ4JFhcmlAriwYqL3dbpFBzUCwXyE5eUKh3Q6X/Iym1TL8qUOTuD0GCbzoIOYuZil/jl5+SVTqi67lSg/P6c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB5914.eurprd08.prod.outlook.com (2603:10a6:10:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 10:17:44 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d01f:41c5:7a69:da6a]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d01f:41c5:7a69:da6a%5]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 10:17:44 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: [PATCH] arm-autonomy/xen-tools: update vif hostname fix patch status
Date: Tue,  8 Dec 2020 11:17:13 +0100
Message-Id: <20201208101713.24914-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: SA0PR11CA0035.namprd11.prod.outlook.com
 (2603:10b6:806:d0::10) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by SA0PR11CA0035.namprd11.prod.outlook.com (2603:10b6:806:d0::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 10:17:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f840dd2-2c02-45a0-1df8-08d89b629984
X-MS-TrafficTypeDiagnostic: DBBPR08MB5914:|AM6PR08MB4213:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB42132631F371CB35009371F2FDCD0@AM6PR08MB4213.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uE9Snx4NbSVytcBPgA6lV3yACfGBY0QYvmMK0rNIuY+d8WreH7ES5zcm4NnJKkakuMC9nVVO2edBhaRW38L1iBEtYMCXGs6fwQW4rVl90Yg6PIZrPW3F5fp7Zjz1HXNvc6ac6By4hkPUxISObMcqbsFnNwcCyk5bpC8X6keEJK00Nr0QU2x60EYEKJ0+iUg9YQ9k1tyEp+pM78g57KWxlTb3G6XxYbrNQ5s4DbgXPRRXkPMO0J6c2nJbgpVO7PoL3QuCPng9J98+Eka2/O7sZAeQObrGhVsHabN11rt7UMkvlm5V2w2UZVitSnUAMF+r69QekD1ZvXvzDKD2cryoz8Qrmdldtm/dcOoaXpPfqclgaArG/O1GaTd7T3sTBVhy
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(52116002)(7696005)(6486002)(34490700003)(44832011)(956004)(26005)(16526019)(186003)(2616005)(83380400001)(86362001)(6916009)(66574015)(508600001)(1076003)(36756003)(5660300002)(6666004)(8676002)(8936002)(2906002)(66476007)(66946007)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?gWHJ/e1qRdNUIZMU5Fu08ZBQ8xMXJUlLKboBUYTaWlfStCzJ5xqSlgXSERkS?=
 =?us-ascii?Q?z0sm8fiOQXZIhODukXK/VG03l9eGTgr7uB9rsxO4ECNkdqK/tk00EphjVtsR?=
 =?us-ascii?Q?lr/o4BWXqdzc2PDqPPebpfs/it1i4/8dthHidQXeLNdtTDopMD9cqduVB232?=
 =?us-ascii?Q?LLmhYXi4G9B1xWNoHK5gzIn2kba2UenBx8zlCXR3HrHPOZ3lPLWaYb4HGShZ?=
 =?us-ascii?Q?K5SurY5cRbSYILkc4XF3FfCK2sncmWidKmxwh9WNMMNYyna2CF3b5irXxHv6?=
 =?us-ascii?Q?Uq4sHO62LLRVx/8VLGwGMWblthLjoNDuJBrOGQ9i3zvai86g08hrDRYiT8+2?=
 =?us-ascii?Q?vJkl2gs0B7LH0qoSUMo6Q/Ky0uL4UtigU0yyssHFPk+ExtVvMa/zwxyPkY2I?=
 =?us-ascii?Q?NXvvTCyp7Nm/iScxumpz+eGGu4IFEIO/Nc48UV9E9Bl/nUVx5t3X3ODekRsE?=
 =?us-ascii?Q?zoTq6HUqKDtJtO8qt5ijogMn5LyGonyOIm+ntBOMDclZ69cydZ4ImOSW9B16?=
 =?us-ascii?Q?9B3M9Smps5StINX9n/9j8QVZnzxADdf++LAVBgXoyc6V2MKGoQbLXy/d3iMq?=
 =?us-ascii?Q?5O/n3flGqqoQPExQY1qWGrewkRas0MyVHrl4MTxFUBdXltWtlwEZSmta5jdO?=
 =?us-ascii?Q?89hI8p4ESJjTbF4777IbFjWazFZbuN2MwOt/R+ewKiK6gkwRVBby/atUPCCf?=
 =?us-ascii?Q?reyIZNb4wgVuLy7TmfNkrxylRrmlM3Wk1XpGXUHR4mYDoLATDjrHsZeMi9V6?=
 =?us-ascii?Q?Z3SArbi6MUPh/8jGcKZVd4Vm0wT7Mp0WR4epQ3JIhtAikgFt/8/cYOmjvAiU?=
 =?us-ascii?Q?3V51rjidxzNBKdAq5dnQPtmMqeq7Qa6tiJUhZywoThe599Rstd6MM0bAvazT?=
 =?us-ascii?Q?Ys+YpUGD0LOxt/q0gRHBeoaaurZeNJJlyhQyM13NWPLe8Sa7bqc7gOBaQEiK?=
 =?us-ascii?Q?YuHiuIew5kaN1BC2wxAyBNPg6FcFVMuljJ2V/KCNG1WyxL8Al7LRVZyvHjcR?=
 =?us-ascii?Q?HXq/?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5914
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	827194cc-61bc-4efb-34e5-08d89b6280de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vV2MoFXthW43W/YJqd9srAsHmMHNKko2JmbWwq7llOz1pLSJ3vd9LadNSlneqUGy7891TiLSUiHmRAZ6UFt68feMFOBLBIQM6eiLylBFaSwYfBARYliBoGVE9VjBzGXF6s/NTphhabOzKEtEI5m5SII9a01PZrjLtSU4CCetR1S6Oei72MKp0Vh2SNutT9Gcp8tz1+l2dplc8iHZRPBlg4db8yjAcr005fzO1gA9wyFu+c9EKPmqmoeaa35GIRpLCVkbCA07HpsNR86o+SutXthd2+q5HC5UWKE6eqH7125bToYzYVKBE+mtGBQwK1fLAB4FqLnuEvxpvA4/Wzbsp19hCz9WlEVs5PiE6//yFMfYWVYMZwbfRE9nvyjLSNH4l0v7dkDZ1MLThHCnSgUVSA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(46966005)(83380400001)(6666004)(66574015)(6486002)(356005)(36756003)(86362001)(4326008)(47076004)(508600001)(1076003)(8676002)(8936002)(70206006)(956004)(70586007)(82310400003)(186003)(7696005)(44832011)(81166007)(5660300002)(26005)(2906002)(2616005)(336012)(16526019)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 10:18:25.7518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f840dd2-2c02-45a0-1df8-08d89b629984
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4213
Content-Type: text/plain

Fix for hostname setting in vif-nat script was merged in xen upstream repo,
(sha: 5499e0fc8082024bf7e2d0facd5c976e82105070),
hence correct patch status for 4.14 is 'Backport'.

Issue-Id: SCM-1523
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: I35f04bfa0f0fff81a1ef20d500b9323e5f13b9ed
---
 .../xen-tools/0001-vif-nat-fix-hostname.patch | 32 ++++++++++++++-----
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
index 87f25e2..d2e52ce 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
+++ b/meta-arm-autonomy/recipes-extended/xen/xen-tools/0001-vif-nat-fix-hostname.patch
@@ -1,18 +1,34 @@
-Upstream-Status: Pending
+Upstream-Status: Backport
 Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
+
+From 5499e0fc8082024bf7e2d0facd5c976e82105070 Mon Sep 17 00:00:00 2001
+From: Diego Sueiro <diego.sueiro@arm.com>
+Date: Thu, 20 Aug 2020 11:58:20 +0100
+Subject: [PATCH] tools/hotplug: Fix hostname setting in vif-nat
 
 Setting the hostname is failing because the "$XENBUS_PATH/domain"
 doesn't exist anymore. To fix this we set it to dom$domid
 
-Index: git/tools/hotplug/Linux/vif-nat
-===================================================================
---- git.orig/tools/hotplug/Linux/vif-nat
-+++ git/tools/hotplug/Linux/vif-nat
-@@ -86,6 +86,7 @@ router_ip=$(routing_ip "$ip")
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
+Acked-by: Wei Liu <wl@xen.org>
+---
+ tools/hotplug/Linux/vif-nat | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/hotplug/Linux/vif-nat b/tools/hotplug/Linux/vif-nat
+index a76d9c784b..26144350b3 100644
+--- a/tools/hotplug/Linux/vif-nat
++++ b/tools/hotplug/Linux/vif-nat
+@@ -85,7 +85,7 @@ router_ip=$(routing_ip "$ip")
+ # Split the given IP/bits pair.
  vif_ip=`echo ${ip} | awk -F/ '{print $1}'`
  
- hostname=$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
-+[ -z "${hostname}" ] && hostname=dom$domid
+-hostname=$(xenstore_read "$XENBUS_PATH/domain" | tr -- '_.:/+' '-----')
++hostname=dom$domid
  if [ "$vifid" != "1" ]
  then
    hostname="$hostname-$vifid"
+-- 
+2.17.1
-- 
2.17.1

