Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.69])
 by mx.groups.io with SMTP id smtpd.web10.2832.1596792401782099599
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 02:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ixJzNXSJ;
 spf=pass (domain: arm.com, ip: 40.107.0.69, mailfrom: abdellatif.elkhlifi@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJr0KzC5I33s3u7X7BlPgPFY+Xbuer1oyVIdo2v9qFo=;
 b=ixJzNXSJHuAHUxWqyZUuvaqhcROn2D0dNExlPeJZt0VaAL4VRcGhEP34PJP1hqGlgTchJ8HZZrv4dQspMQA/RsWu/8vW3tD5xl6eiohxW89OS4YvP6w2gE1Jwi6vcUDcZ3YpXbf6Z15CJy5UQBNsCxV95C+lEkGINAE5MwypJdU=
Received: from AM6PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:92::15)
 by VE1PR08MB4991.eurprd08.prod.outlook.com (2603:10a6:803:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17; Fri, 7 Aug
 2020 09:26:38 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::9a) by AM6PR04CA0002.outlook.office365.com
 (2603:10a6:20b:92::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Fri, 7 Aug 2020 09:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Fri, 7 Aug 2020 09:26:38 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 07 Aug 2020 09:26:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f5591ce0789ac78
X-CR-MTA-TID: 64aa7808
Received: from bd96d49eb206.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 99998B89-83C1-49EC-8EDC-380505A6B29E.1;
	Fri, 07 Aug 2020 09:26:33 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd96d49eb206.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Aug 2020 09:26:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+jS0O19121N+zhuPXBXHaxS/eI9vxJK+o9srCCOj98tQsyeApW/gazbrPTK8smz1crH+zJ6NxyDVBhL5xSeuzmMyfsZIzXrPDWKz1iCgQTAF3QLoFmDK2WE/V/JjZUFrsIkn28cGQDE+0OYPiHQZt9serGsQ0QDQ5zmFeJnp1c6S5IgPPSB3eEsoaSmG9IeCB/DktpWnJ38/+NzwYd0mAGKoxJHTP+0CQw8nwAEl2dOTlYDxumSwLr72nUiav4yd6Hyo+IVKMgr511/CHV3nCW9E1/6ei2Li39YKW0w3KpkNuXEuoF8uoU/nZSyyqgMMJDW3tnSbM57FzipYBDyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJr0KzC5I33s3u7X7BlPgPFY+Xbuer1oyVIdo2v9qFo=;
 b=EWIRHuD4nOndNGmF4i0BziQk6IxMm7lgqkbRRR47rWG+yLG5hGlZs2D0ZpzUI02MdK7yiKYzQbNnPHyjteJPauYH+AfA7VSnFX/Q3QHp2SQZvVX1IME5KJ206XJfLYQ4mia1i20LWeyvnPWNsm4Wby20i1lb5HHEi6uGCivj8uUoPGPNMBdcDQQmhvneukmXEfdnKfLnKndck48uBaBfoT3ZZelcEpzP30ALNwaMdbK/OdD9pR5wX19rlbYRUijo2fgFQsZLdUIQOG+k63DVds4jtKdd+q8VL2dmlbBn90XmisFalhhG7RVdNTD24e9ZbFPx71pTJNl7sZEHs/VTdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJr0KzC5I33s3u7X7BlPgPFY+Xbuer1oyVIdo2v9qFo=;
 b=ixJzNXSJHuAHUxWqyZUuvaqhcROn2D0dNExlPeJZt0VaAL4VRcGhEP34PJP1hqGlgTchJ8HZZrv4dQspMQA/RsWu/8vW3tD5xl6eiohxW89OS4YvP6w2gE1Jwi6vcUDcZ3YpXbf6Z15CJy5UQBNsCxV95C+lEkGINAE5MwypJdU=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21)
 by AM6PR08MB4181.eurprd08.prod.outlook.com (2603:10a6:20b:ad::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 09:26:31 +0000
Received: from AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d]) by AM6PR08MB4934.eurprd08.prod.outlook.com
 ([fe80::ddfc:2b93:3d1a:6f1d%6]) with mapi id 15.20.3261.020; Fri, 7 Aug 2020
 09:26:31 +0000
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [PATCH 9/9] arm-bsp/linux: Enabling lan9115 Ethernet for corstone700-mps3
Date: Fri,  7 Aug 2020 10:25:53 +0100
Message-Id: <20200807092553.18876-10-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
References: <20200807092553.18876-1-abdellatif.elkhlifi@arm.com>
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To AM6PR08MB4934.eurprd08.prod.outlook.com
 (2603:10a6:20b:ee::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e121910.arm.com (217.140.99.251) by SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.7 via Frontend Transport; Fri, 7 Aug 2020 09:26:28 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0337687a-0f4e-4ad0-5d30-08d83ab3fcbb
X-MS-TrafficTypeDiagnostic: AM6PR08MB4181:|VE1PR08MB4991:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB49915648948AE71D4064541EFD490@VE1PR08MB4991.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 R0zcbUCjGQ8dPQ2AFQNWwAKUI7uoJ1CtueHppDMTkBLdpQSFEMzjhwPOZ655KM6I9iemWqDJRb5hx/PvnqH5f3g6Qfg9N8GVa0cDC2pZpgfeGUH/KKcEYztuzPShj5PQ71Wb/ayyU3le/+/AYVreSAeF6nnUSBQhu/jq0QT0OIUSC7DKs8CNx0z3Xfi0Cj5GmpfMjK4k3+GuF0b5VcY3mRhXSIVPEi7EF7tG1xFXPrR/ncymR7E2fdJ6t+whA7tNBXrYSnxTJkU8f4h0a0oMMh0gAEMImN3uBQCgRn40Q4TVbuKZBYIhD9ByCn2nGd6XrzaAXKlocHfdt5LdFfT3Ug==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4934.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(6916009)(4326008)(2616005)(66476007)(956004)(5660300002)(9686003)(86362001)(8936002)(66556008)(8676002)(66946007)(52116002)(2906002)(26005)(7696005)(1076003)(6666004)(36756003)(186003)(83380400001)(316002)(6486002)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UJtOAhk9iKH+5LNGAk26o6nVz+qVNsxDxn3D0M+jOdjjFLNzTroCkpqwO+WPuAFidroW80RiIdEPmRMO/H8ggcxNM7tOBIqOoeG8FlGZpFwHrwrDqAVzFUOGqOWXWtQuW+9vFBKg/GMYTXCCWBLEg4Ie/AJpPPhMjfUpz/PMFyqf3WNesEuWtZryCCft6YDfk0Vf8ojmCQj8Gtn9UzemMm56XHQjo0p2fzmlb/suIvcT8BKJdmu/o0whLzIRSSqRROkEOMWmcJuM+ElERv5dVv9wE4eNtLG4OaHxt5KPBeW4sUyK7WaTDvkDFi1fQtSX5GAVSRhvACq1RIaV6LW2UubPI5e36ojjmR5p80lAmEWtO5ANgRB5dG8IqU2v57ryd/dmRbB6mvY8oU6ao3ksCnaEsvVKkVAaty3C02JgDVmCPTpHd7z14S7vBuWfKVz7a59ajzWoXBpIxHcPKOCqHFI+UVlPFysrGSUhJGezCeHqb294yuOXFT74DSCOd1/YPdiNLBuzJsOabS9uBCF1+4Dkof10DbCNeaYAr8JTj0+T1jxZ5ntU6LAJUSBfznjjubv1jxDTP15FZ9udmfRw7XzShsRbi3k8DnHwXwbGgXYYvfel1C5IHuJHNVCknH9Jri+287sSI3u4BNSXBMxXUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4181
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Abdellatif.ElKhlifi@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	963e29f8-dcf1-4353-9258-08d83ab3f7b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ai94IG3kz/2DF5/Nk5EBnxJG04JmI2DKqr4vXH6zIHvumBB6m57mvBgEUqNn1jp+gUu6Q6laJF/nyPxEnJSS8LKX7ueq4d8dZ8TeT8xTdJakWzCHQCZ9RrN8mCuSusDF71jIorwoNFtC61VQPVnWgnQRWxMke16ONaPzFyRS8BB1YC7Q/nPEG1fu+f/NXBYT/w5XDQswtK0sMswAY7XIifxblyF1AR7TfzYLW6eFdUAnqdT6CR1lXKwQnmuc1nDLF2wObDTaA3jgFjGOaBFvc2bWGSDPR+BILu5erYKKznBixIDoVJvkkOhpe4WwtVGaDRYkoWI1gRXP3hqFOvw9+w3CmiqxvbKd+NBI/gOJFrskuFFYthlz9xZURl6TLg6dVN2cXpcMgnwFYSwv7Dph+g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(6916009)(36756003)(8676002)(6486002)(478600001)(83380400001)(7696005)(82310400002)(81166007)(5660300002)(70586007)(70206006)(1076003)(336012)(86362001)(82740400003)(2616005)(956004)(316002)(36906005)(26005)(16526019)(2906002)(186003)(9686003)(47076004)(8936002)(356005)(4326008)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:26:38.6079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0337687a-0f4e-4ad0-5d30-08d83ab3fcbb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4991
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

This commit enables lan9115 Ethernet in the v5.6 kernel
as a machine feature.

Change-Id: Ib8e724a64b24db3048a2b12973824bba9f3eecc4
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta-arm-bsp/conf/machine/corstone700-mps3.conf           | 5 +++++
 .../bsp/arm-platforms/corstone700/eth_lan9115.scc         | 4 ++++
 .../bsp/arm-platforms/corstone700/lan9115.cfg             | 1 +
 .../recipes-kernel/linux/linux-stable-corstone700.inc     | 8 ++++++++
 4 files changed, 18 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/eth_lan9115.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/b=
sp/arm-platforms/corstone700/lan9115.cfg

diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-bsp=
/conf/machine/corstone700-mps3.conf
index 28d7050..88ef5c1 100644
--- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
+++ b/meta-arm-bsp/conf/machine/corstone700-mps3.conf
@@ -4,4 +4,9 @@

 require conf/machine/include/corstone700.inc

+# default feature used: eth_lan9115
+# add the following line to local.conf to disable the feature:
+# MACHINE_FEATURES_remove =3D "eth_lan9115"
+MACHINE_FEATURES +=3D "eth_lan9115"
+
 TFA_TARGET_PLATFORM =3D "fpga"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/corstone700/eth_lan9115.scc b/meta-arm-bsp/recipes-kernel/linux/a=
rm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
new file mode 100644
index 0000000..94cb13e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/corstone700/eth_lan9115.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Ethernet feature using lan9115"
+
+kconf hardware pnp.cfg
+kconf hardware lan9115.cfg
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-=
platforms/corstone700/lan9115.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
new file mode 100644
index 0000000..cd77ec3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platfor=
ms/corstone700/lan9115.cfg
@@ -0,0 +1 @@
+CONFIG_SMSC911X=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc=
 b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
index 63f48df..95a8bab 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-stable-corstone700.inc
@@ -52,3 +52,11 @@ KERNEL_FEATURES_append_corstone700-fvp =3D " \
                           bsp/arm-platforms/corstone700/eth_lan91c111.scc'=
, \
                          'bsp/arm-platforms/corstone700/xip_cmdline.cfg', =
\
                           d)}"
+
+KERNEL_FEATURES_append_corstone700-mps3 =3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', \
+                         'eth_lan9115', \
+                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline.c=
fg \
+                          bsp/arm-platforms/corstone700/eth_lan9115.scc', =
\
+                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg', =
\
+                          d)}"
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
