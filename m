Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.82])
 by mx.groups.io with SMTP id smtpd.web11.87443.1597841931394314165
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Aug 2020 05:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mv637Ekl;
 spf=pass (domain: arm.com, ip: 40.107.21.82, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQi6NUg4FdvLPpq4zxtndeHIUdvTMvRSAjsu4Zlmc7s=;
 b=mv637EklZr2zIfj8LWzGKAsZc9exxvmDCt+tkVnjPsT0zIrvYyL7b4ICkbp1P7fLI4M/oejBr9aEsgpQ75jTkksgE3QVy3nptAC4t39JchX+rGJelcsxQ5LbSlPDWjKCEpZyELEvPK1WnWao1uh2uy6wdb0HCTSdk4KgVlWIiYs=
Received: from AM7PR03CA0025.eurprd03.prod.outlook.com (2603:10a6:20b:130::35)
 by AM6PR08MB3895.eurprd08.prod.outlook.com (2603:10a6:20b:81::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 12:58:48 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::22) by AM7PR03CA0025.outlook.office365.com
 (2603:10a6:20b:130::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 12:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 12:58:48 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Wed, 19 Aug 2020 12:58:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5819016721ccaea6
X-CR-MTA-TID: 64aa7808
Received: from d110ddf7e0de.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 59B6AF51-958E-4536-B031-FFC903BB1C0E.1;
	Wed, 19 Aug 2020 12:58:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d110ddf7e0de.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 19 Aug 2020 12:58:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E86w/jWehrvrXk/0KWZ8aX1J45uN+95fv3Fy64XVh8dz4RikmYV3zTEcxAYR0jQXJNiweca9j/3m0Xa51mXx66506AknXmJ59w9ZK+NkOF9uALbUliVToxdCx+GW2HW2ROHMMkSIUCP0hmRmenqkEnXj627ZTqkCCKGAfrwaXIhHIh/nWzZikzO3qwccb2UewhFBwm2mNvbNX/42wUffUhhwVtUp3NQmC5pebGCpfSqvcny07UMsBRNgdVg+D5OpnjccKOifVnXIQVzX8/qMytgoQIn44xEgxoDwpEAgyAN0+Vrb9jH7mLKYkSAWnfmepS8bCcFPzJH40ao1krxncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQi6NUg4FdvLPpq4zxtndeHIUdvTMvRSAjsu4Zlmc7s=;
 b=bi+pbkvNCDntE+ehWD25KfYoyo3wuX2RpEiyIYr48fDSkzKDwElMZ5vMZ9iMIg0brgxhSWg3AuRXzDPMFO/EJbfAsMScN3maMpyzqCcM9Vm1wYBaqmIVxpBRKNksn3z5/L5ePjqpvAHWqMrJK7p42i+4aWJM41ye2vXQhsEU7/jGE5IsM0zq4MfLAsJD7uRAIxjPdqXyNp/wV5K8cBMA7wo7HJdc74mi0wqi0xhCBR0WaTsW2jRMpzOtSGMDI6Ku2BeNjIRpa773smc7gIa5ahHIjPAaad23ApXW4TsoWgjy5hm7QhFIpt76AklYWbmzegzsSnCTlHR4iLOqRpZkbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQi6NUg4FdvLPpq4zxtndeHIUdvTMvRSAjsu4Zlmc7s=;
 b=mv637EklZr2zIfj8LWzGKAsZc9exxvmDCt+tkVnjPsT0zIrvYyL7b4ICkbp1P7fLI4M/oejBr9aEsgpQ75jTkksgE3QVy3nptAC4t39JchX+rGJelcsxQ5LbSlPDWjKCEpZyELEvPK1WnWao1uh2uy6wdb0HCTSdk4KgVlWIiYs=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM0PR08MB2961.eurprd08.prod.outlook.com (2603:10a6:208:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 12:58:09 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::4970:ca13:3555:891f%3]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 12:58:08 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: Remove unused kernel recipe
Date: Wed, 19 Aug 2020 08:57:54 -0400
Message-Id: <20200819125755.23051-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SA9PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:806:20::18) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.110.7) by SA9PR03CA0013.namprd03.prod.outlook.com (2603:10b6:806:20::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.27 via Frontend Transport; Wed, 19 Aug 2020 12:58:06 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 19 Aug 2020 08:57:55 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.110.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f8651a05-e337-4488-5982-08d8443f9d2f
X-MS-TrafficTypeDiagnostic: AM0PR08MB2961:|AM6PR08MB3895:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3895D1AF7ED834D6EDF385AEF05D0@AM6PR08MB3895.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RPg3UKffFe7m0ieEeE+zUGcSR/axt/SjNguQH/hEGq5CH+EKOKzVsB4/pvcNC01B+zT6Dn3KgKkY4GOBRh43GP6+VXCIN2cSF2FBE5lj4HLEVzs2mv5uZv2FlR6H1ZLbxilM+F/yJj/BDSwwtvxcdp16upAWl3QNmRrLA39ADfk2ZFu4+6+DyQEN48a+BPkOMwKONdawrZaUvbZ4ozFWJwcNUS6JcoNKod1Z34eE1YsqVOF62mPYkJ5OCMYxvG05geSS+Qs0y3fzHbCA5lnZZ5wH6QU3PRQghFQGB8P7mKh8419ePXkBrpcmgyU2undSmCj1haNBT+8H5YU0r6xFwg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(66476007)(86362001)(478600001)(66556008)(66946007)(1076003)(52116002)(426003)(2616005)(5660300002)(316002)(44832011)(26005)(2906002)(8936002)(4326008)(36756003)(8676002)(83380400001)(42186006)(6916009)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 ngEjzpin3ES+HzfQDggO/FxS4hrRieWQlivhoqDqPzH7zJyQ4P5S4yPMeTPbJX670Txz+WT/VL+bw61JRewDjZ7YfvP3xJQo2cuGM2H1KwmVO/GLyvkUkOQDveFogxDzJ72WXfj/yiWLd6gbNonuEsy3flBM6EGs2W0/MfDupgT5nlXUnx0Ph98Z/zz5T0T2YaZxx6ZOnU7cvOs7byImQVaiURysB394wNV6qfZXsrH9RjzMdG+k1FWh0FRsXSmv0OsvnBV6GzekWVf4l8cfv/dDUBVEvXtxVlo4W4zsGTpcOKvIlkpjvi6TdyaPajRIixMGdAfXDHVpM+TBB0VcUw7ngOlDpqyI7+B2z2Q/D3VkIZiCx0H0zYS9moSb3TOJmAXeucFxl+vJUm/K3Nc9HMhazJWR20fZ7fkZJEQC0cly78wM2+1C39ucKjMTGgPgyxPTb6ECVTmTLHQTzTCntTku14chuAXG+BaXkWSYE7n+ZgJS6xWHye86ajOhh64c8M3226SDcl7Tp324VNDaOKk43IpdaB7SQykZQCJ0bPxEFZqWm22S64JXd0HCRPP3qeIxgk03A5Nlbg84uIETEFuRoxDIkH41dn3bIUSYVnAy84ojyLPmVyqZJNfuq0gojIoFRfLC2zflrysYzg0Kcg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2961
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6ed5f098-e705-4daf-1380-08d8443f84eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HlodaEUe8aR3DzzFqqQLP/+Y73el9/eff608nKPiuZzXebsEGjqXYXiFizg7tVK0SWBpIi3b4uYqJ4ejajaFPVZVB+a0jdUg1wbGc+pZZPsMAumeM3UXERPH34aO487zIvnk3BxEm63KQNe5X3RIBhJTjoX/6mPDU3B/RPSaYhxjxeO3+ZLn2PBLWgKUaKQchMxUgCAd0fkUUygKGUpHN8I/m1iEg44Fm1Up0wXOm/t+Zkzn4OXRgBjge+VOlVgbInCjT/Xl3tvg7ONkpkkusvqqchBvAmqAvuIfFnQe2RoIFFJW6OE2kT07wyonmYCUQk3BnJvWkBhFFNbMCgwHMXjvKMVcjajqsd7goccVNvmDTyT3HPe069I42k82y2WgRAuUfRxkfElkUaWL06eFWQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(1076003)(8936002)(44832011)(86362001)(336012)(2616005)(70586007)(36756003)(426003)(70206006)(5660300002)(8676002)(42186006)(81166007)(186003)(26005)(36906005)(316002)(82740400003)(356005)(82310400002)(83380400001)(2906002)(4326008)(478600001)(6916009)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 12:58:48.3095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8651a05-e337-4488-5982-08d8443f9d2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3895
Content-Type: text/plain

Change-Id: I4203a6d4536702a701055b511fc2b9a27868082f
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-kernel/linux/linux-linaro-arm_4.19.bb     |  7 -------
 .../linux/linux-linaro-arm_4.19.bbappend              | 11 -----------
 2 files changed, 18 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
deleted file mode 100644
index df8ba4d..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SRCREV ?= "e97e8d868aba53467039dbef3b7436c857433ae3"
-SRCREV_meta ?= "69022e62eb6c7046c84dace4af66ee8a30865865"
-
-KBRANCH ?= "latest-4.19-armlt-19.01"
-KMETA_BRANCH ?= "yocto-4.19"
-
-require linux-linaro-arm.inc
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
deleted file mode 100644
index b1bc72e..0000000
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_4.19.bbappend
+++ /dev/null
@@ -1,11 +0,0 @@
-# Add support for Arm Platforms (boards or simulators)
-
-require linux-arm-platforms.inc
-
-KCONF_BSP_AUDIT_LEVEL = "2"
-
-# Functionality flags
-KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.17.1

