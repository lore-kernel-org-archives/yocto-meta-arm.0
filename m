Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web11.6946.1588253041013100511
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 06:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WN/7A7/q;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMLG+LzmcKpy92N5cHJT4tR0MQyHhQyr9YpijIgJ9C0=;
 b=WN/7A7/qfDiJmuvhGBRluQXWrp3zECxSJmf2WgYfDIhez3g7hsl+fHmsdwnzPql9KOs84XOFfwicFMFR9pYXEiOEUqs7t7EgcNVbaj7jIemvcS/qfuv41etBsjhA5apozS8j1bwDDpGs2/ixUitENpAWyTvKoLQqly3AvjCW1ko=
Received: from MR2P264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::26) by
 DB6PR0801MB1639.eurprd08.prod.outlook.com (2603:10a6:4:3b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.22; Thu, 30 Apr 2020 13:23:58 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:0:cafe::85) by MR2P264CA0038.outlook.office365.com
 (2603:10a6:500::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 13:23:57 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:23:57 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Thu, 30 Apr 2020 13:23:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 946d056c47697d2e
X-CR-MTA-TID: 64aa7808
Received: from 05fba6f99e10.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CECE4BC9-6B05-4D3F-A488-1586DC288793.1;
	Thu, 30 Apr 2020 13:23:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05fba6f99e10.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 13:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3hVDtMhB7ADiHvRwZlkJUzLUH4ruEQDUJqSuPBiVfO0984Zg7j98LwCHSXljhhxgqGk5d2tauQlPtO0E1Y0nFyq0sbeCcJcCODSMaY8rR2D836vJKmnm3NBpPIQmvBbjuC2B4nWb5f5I+2+WKNZY6ZK6LhVpR2PnVHzcf8eywJcY7/B8HYD9OprlsT1Invl0e2OvpDNAm6r8GUCPRU03oRuxvP7jx4L4nLJzmQrXeneBFsrJ/ONnCHsPbFJEGyndACjEWQk0pXjK1/cA+OR19IT1y8ho830Es11NO4IZ+PwSEdQysby+MVSzFc7tjCwPfFMkPEK6AKOj/pX8L6THw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMLG+LzmcKpy92N5cHJT4tR0MQyHhQyr9YpijIgJ9C0=;
 b=aUCZUEa4bNqsjfKwxvptXGG8TMxcoPxjhzdujSvcb+UJxt184BsK+JmQ1D80nLaSuC4Eul9OONZ0I9ms/WOu7DK4XvSJG2QmBzctaoO3yIb+xnnBibByqO8pHkLg3Baj6BHTJGClnwYMzilMrmNtu3I4RpPxHb9lFvn+WyW77ojh51Wp4nHVx5nXsoENYvfTJ7HT4nfcsMw7ZaU3CVCXUYATJeYLvEbWXHqpUutlpg0rw7Tt40ofGHdnSlKa2t4gauUBkPCI9HBGCPGgy5EikUo52gut2jsV9ZlndOICuGS1yWGCPByYpoW1tHx+WfF2FFRRIHmj2PUsjVUzHj1tfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMLG+LzmcKpy92N5cHJT4tR0MQyHhQyr9YpijIgJ9C0=;
 b=WN/7A7/qfDiJmuvhGBRluQXWrp3zECxSJmf2WgYfDIhez3g7hsl+fHmsdwnzPql9KOs84XOFfwicFMFR9pYXEiOEUqs7t7EgcNVbaj7jIemvcS/qfuv41etBsjhA5apozS8j1bwDDpGs2/ixUitENpAWyTvKoLQqly3AvjCW1ko=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4340.eurprd08.prod.outlook.com (2603:10a6:208:139::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 13:23:50 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 13:23:50 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-autonomy] documentation: Update arm-autonomy-quickstart.md
Date: Thu, 30 Apr 2020 14:23:49 +0100
Message-Id: <1588253029-52944-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0239.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::35) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LO2P265CA0239.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:23:50 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 481fa976-f580-45ca-4d79-08d7ed09bcab
X-MS-TrafficTypeDiagnostic: AM0PR08MB4340:|DB6PR0801MB1639:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB1639FB7FB1950AF1CF645AC292AA0@DB6PR0801MB1639.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IjSMVDRfTi5jHE8JLdJN5GTrY/tj1RjU+I7/C2UlJRld9MeduUHRDsjrv4D4Lhgu9UJ8Yk4od8j6L37FYgCqNZym68Y5WBN4JD5X3YvKjHo21zsMBW4/HicKXNsXbnxnizXdOkzO0qpreAX+//j6j56VgyPLAz/Dnlz8mBPxX3ebfdoGmNX0WKZ5WLrl0CRMvh9y0/50ci0y1Qski193E2bM2NlgNay2mn52bGrZQI07S/fn8kHJWLJLtsvByjN7cqboo10cvLrIqfy7daC035d6YOgI2jYzWnCnpYYO34hcgkOlFNBd4OrogsHIPVxNfQoaLLgc70WEMsQgU4z5rg1rWkhe360W/Ln6WY91o81sFd4UI2Cb9gNPJT5/Loh2lAl503LPIcj9VNPvSwWbkzA91upkbRv3edFegKQBq8b1aN+othChij8kMhH4NZUx
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(7696005)(2616005)(316002)(44832011)(956004)(2906002)(478600001)(66556008)(4326008)(6486002)(66476007)(66946007)(86362001)(36756003)(16526019)(186003)(26005)(8936002)(52116002)(8676002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 btoXZVNxDRJTwL9X+wrosUKaah52GR+BZyfORvrLJBRWJXUqw30hzzSiFhqFlJuFx1iFZfZq3E9kTA5CkCDYXmSj2ztTqAH2+DH5GyhCY28q1OWtq9+cWx0RdHFMgeQrIsh8L58qTrzBJlkI65BuF9H/r0Jiu779iAcwasa9fGkzGr+BEDTB1hOahEMwceSYFEDsDRkGLDBGk1ywVopMqJnJkCSsiEfvTwbFH0couucOt9KzUKuMOO+ZkXEaYsoIriZ5nShkH5J3ttlQQH35TouMrg3PH1rtcjHf1k4YQn4gElYQY6a5bbJHhMMPfGduGmTIaCU3NVKrTbGmjnEd5auItlkJw76XTicjAtFQKI/H5gULZ7pcDP8vKEfi163/efOwA4BD8HKXOabbEdtowpjt+J6ZUC0qhBOKi1/l09RKwCjpELoBNe6ORtZpnJc6laxGRFHAyEq4HI2lfLLWiCuWhrPcnBMpp7EuFKXN0NMBUmsdh4wfuEl02J6iK4YH+q0unE6tzJkURJytQoqrfMIKkbyyclq+WL0pWfHjq4lkGtgJKteF/zM37PRnjJXHTRBEsMkxghjM2bdnpRqTtyUyZIq5waFn1ztz4rYFhOXiZRAMW8gIqqCC6olbhGdaZTK2GSR0B5Alu5LtaBRrKFrYHjWHn8KaXB948uoY7CCCP05CwC2jL5cwkEsfvEB1XzdPJ5QEPOelVTU+q++UHIoyhrxMHOKA2G/gs7ZmR6H87zrb/V4gAxpGtHg1kvGsWEj+U9lN7HIUd/jC+bnRGnoCm04kiTVMoN4ygvlCv4w=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4340
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966005)(4326008)(336012)(44832011)(86362001)(70206006)(16526019)(956004)(316002)(70586007)(478600001)(36906005)(186003)(47076004)(81166007)(8936002)(356005)(2616005)(8676002)(5660300002)(82310400002)(6916009)(36756003)(26005)(6486002)(7696005)(2906002)(82740400003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dffd9d8c-863c-41a8-4649-08d7ed09b888
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sIJSiQCdEb6N2gBRs78V3zwGBkZr/ziOtNDqo4dknC5voKILujGuVDColD/LUYFOVC+7njaHTRoBWz2Vsbs92yd8h/YxT9/2QH9eggS7Yrgm3vdeLW7qPo6dxg/JjFEdkCsPb98dLA2XmgAsaPpUtjVavc3S7NVn+K2P+nyuGXbGeTPxBKTLFLttEJ1E53n0DF/cZXJV3lBMmWfrOqs+hB+gIDR1wLsiP2NC4aU02jPtZ/btgDFt4VujJkptf0qKn82ali9ttQFDuhXBFjEueq/QN4VEPuWOByXSUasEnjsaAlmURQsclo5oQ2pmiK1Ep3DzQsgO88vEEIVQ8Ln8lr+wIrM6EUruP6bsrQNdgCBH/g/WmS52aERhAna6CzmCwGe6WmZvwpHJWjTd0D/G904PR91LFLBawJHilfHq707johoceWaVIskCwJfatLGA5nCBgTDCmSYmZsCcK8SanTTg8G9/OzmWgUVhXD6ogMuGNB1Tbl2bmdhzGhX0TsTXq8EvM6Kj9HoXnQ9BE1YI1A==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 13:23:57.0946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 481fa976-f580-45ca-4d79-08d7ed09bcab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1639
Content-Type: text/plain

Suggest the usage of `bitbake-layers add-layer` command to add all
dependant layers.

Change-Id: I1f40f6218b2edc5267e04723c592c16a434f2e82
Issue-Id: SCM-986
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../documentation/arm-autonomy-quickstart.md        | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index c688600..2a457c1 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -45,12 +45,23 @@ Here are the main steps to create an arm-autonomy project:
   oe-init-build-env my-project
   ```
 
-2. edit the file `conf/bblayers.conf` and add `meta-arm/meta-arm-autonomy`
-  layer to the list of layers of your project. Also add any other layers you
+2. Add `meta-arm/meta-arm-autonomy` layer to the list of layers of your
+  project in the `conf/bblayers.conf`. Also add any other layers you
   might need (for example `meta-arm/meta-arm-bsp` and `meta-arm/meta-arm` to
-  use Arm boards like Juno or FVP emulator).
+  use Arm boards like Juno or FVP emulator). You can achieve this by using
+  the `bitbake-layers add-layer layerdir [layerdir ...]` command.
   For example:
   ```
+  export LAYERDIR_BASE="/home/user/arm-autonomy/"
+  bitbake-layers add-layer $LAYERDIR_BASE/meta-poky $LAYERDIR_BASE/meta-yocto-bsp \
+   $LAYERDIR_BASE/meta-openembedded/meta-oe $LAYERDIR_BASE/meta-openembedded/meta-python \
+   $LAYERDIR_BASE/meta-openembedded/meta-filesystems $LAYERDIR_BASE/meta-openembedded/meta-networking \
+   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
+   $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-bsp
+  ```
+
+  Example of a `conf/bblayers.conf`:
+  ```
   BBLAYERS ?= " \
     /home/user/arm-autonomy/poky/meta \
     /home/user/arm-autonomy/poky/meta-poky \
@@ -59,10 +70,10 @@ Here are the main steps to create an arm-autonomy project:
     /home/user/arm-autonomy/meta-openembedded/meta-python \
     /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
     /home/user/arm-autonomy/meta-openembedded/meta-networking \
-    /home/user/arm-autonomy/meta-arm/meta-arm \
-    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
     /home/user/arm-autonomy/meta-virtualization \
     /home/user/arm-autonomy/meta-arm/meta-arm-autonomy \
+    /home/user/arm-autonomy/meta-arm/meta-arm \
+    /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
     "
   ```
 
-- 
2.7.4

