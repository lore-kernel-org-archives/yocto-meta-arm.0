Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.85])
 by mx.groups.io with SMTP id smtpd.web12.10827.1599062031749708364
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 08:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ijbXWwC3;
 spf=pass (domain: arm.com, ip: 40.107.5.85, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k2+624/gPiowobqrsCunoWjddZFt9CA5Un5KAugFrE=;
 b=ijbXWwC3wSoG8B6fuT1OyD030vBBhTU0bXwNlBoU1Sn2BVg+wRoL8lJvX+VCUt5mQVnzvgUEbxWZpe5ITJO0VGqRfMuJiYd7Oc/D9FQHKs4oegKC5/P2F3R/CYGJR9V6Q5nnv2C4E6x+qsvRWVQTRu5HKxzWq0W+usvx9YzCz4M=
Received: from DB7PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:10:36::16)
 by AM5PR0801MB1684.eurprd08.prod.outlook.com (2603:10a6:203:38::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 15:53:48 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::b7) by DB7PR05CA0003.outlook.office365.com
 (2603:10a6:10:36::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Wed, 2 Sep 2020 15:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 15:53:48 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Wed, 02 Sep 2020 15:53:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c2c6aad404b977a
X-CR-MTA-TID: 64aa7808
Received: from c99e9df994f0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D8D61BC6-39D5-4EDF-8B2D-50D200D375A7.1;
	Wed, 02 Sep 2020 15:53:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c99e9df994f0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 02 Sep 2020 15:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erPCDqlR6MggQux3EdkQVe7Yi0Ta6QcaUYUG1egb1mCwnX3dYjpyDAF2a1q2qaDfH9BVw/zw40zHZsEv5mBNfEsGi4iUgvARmCCLSogAVh3YRE6SXiMjbIpKiGTycy8Vo4oMjn7wKmoBZKNOG69rHWhEeHVidnAUYtuFmE68UVSexdyLt1KnjA0fADtzKtfW5Bp9UQkwyTLNsBjOMrQ35YvwRGKTXtzHz7Nvzq64HyaMPtzC6mQiNGaxacaSscVGZo/JA32EVo5hTb2cUGsNHp/YhEJzcOhLiv1qeqPrhcPL6QHQ0B3ZR8J4HhBBwsrOazxhoEAkkIr6kOKJIu6Bhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k2+624/gPiowobqrsCunoWjddZFt9CA5Un5KAugFrE=;
 b=aQeqbUkyGpGCeS9zoxl+AODR3vYYTKsN3kZHQRXXVX1ATr9O/J1oCPt1rHFbt/5PFPufqyxYMIG8ihJt/rYTd45JRchuY5zpwrS769pT4MiTWlkt0J1V1E12+6R9odyZMosSvHUdEP2zyEdKTryGoO5NLgUB0UUaqvs9dVjpgiAUl+JTTcWXtZT7fMgpW32VlIPbSxlXAOYUyQto+duFEDdARFS8O1MB8wpRru2LVsIkTrGsiGJ+zL20vg6mtv/DQiVrUXPoDU3d4m7KUBHtT9druZPXtXxtI8JjajsLe91R3sUmtqxDtdDNNrbQaddccEZaBM3lHeB17Uyxdp5ssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k2+624/gPiowobqrsCunoWjddZFt9CA5Un5KAugFrE=;
 b=ijbXWwC3wSoG8B6fuT1OyD030vBBhTU0bXwNlBoU1Sn2BVg+wRoL8lJvX+VCUt5mQVnzvgUEbxWZpe5ITJO0VGqRfMuJiYd7Oc/D9FQHKs4oegKC5/P2F3R/CYGJR9V6Q5nnv2C4E6x+qsvRWVQTRu5HKxzWq0W+usvx9YzCz4M=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR0801MB1756.eurprd08.prod.outlook.com (2603:10a6:3:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 15:53:28 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b%12]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:53:28 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/3] arm-bsp: ARMv8-2a: Add tuning files
Date: Wed,  2 Sep 2020 11:53:18 -0400
Message-Id: <20200902155320.16918-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR19CA0045.namprd19.prod.outlook.com
 (2603:10b6:3:9a::31) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by DM5PR19CA0045.namprd19.prod.outlook.com (2603:10b6:3:9a::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:53:25 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 02 Sep 2020 11:53:20 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.110.7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d78e96c6-1024-4eea-bb5b-08d84f5861a6
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1756:|AM5PR0801MB1684:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1684FFEED75AFCA0C6B7F119F02F0@AM5PR0801MB1684.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /IRoB8+gge+UIlddLFTo4soMnMpMO9awZjYp82rdh75/dyETV+YTjGM9KKcJIGn2MR1I4zA7mI5QLBfB31wtzTU0Ygi4+C8wBSni+V/SEXGUo8KWhQlpEjR36GgK23ZcT6ntigjLvoFTVTFg9Lc/+UiUIuL4NWEWbmwR51JJ+v87fUz75PMv9OvzYqgqrFyuXzO6MuTMzstEutkxcvlgRFrx5PJ3CnyEN6sTjToX8eK0WJ851fxwU3G5W8a6VN9HvvVWxwrdJImTD8f9f4soNr2lYUg9e/4G+d0Hu9/PwCmLY11qzMLEsuPC4wnxz4NO1f+M/1qD0+rRSYiFmf+jwQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(44832011)(36756003)(426003)(8936002)(52116002)(86362001)(478600001)(19627235002)(186003)(1076003)(8676002)(4326008)(5660300002)(316002)(66476007)(42186006)(66946007)(66556008)(6916009)(26005)(2616005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 KisKfYT499MHLuGH+yn/XdNH+/eA4RvrFMneghNHTItmuSJffohHrpu4BFr1ulJJDR8lYPnpElcdVCjYacP37EiixBvx4FQqZwEbkJLJPk/JWwYFtkRM9cgB3V2TYVxBt4CToYbDnqhvzCTt9g2KGIDoY60m4xT17qxxH12TUEc3SU5Cx3HfHv6yCGM6+sF9Ef8g2bcMVNO/Ly47VWN+mSvlIrAsHrk6urEIcNuKFakO40zTfPQjC0F75xQvr85RHgUybW+T88CvsKCoxK6HFDJsDb5lN2hn7bq9KX/WgeasHZdrGts8MyoGm+fOMo6ucKM+XykFfnMKmH0n7jy/wm80ReZdAlK/ty1nopvM/BtsOfZmuoAMsipOjebaIk8/hckYV3iLopmnWYlBjGqDRgooMCAW4WBH0nUQQvotl5fkmWN2m3vFp6RBsSWh1hGW6W39MgUJMmNap5ms6x2v+Hy6jAA1IzntcT3NyTb+U75qXawkb6TSggOgTUW6vfD6ROZg2EWIixwehTWXyzzruVu8CrPHDPl8cUvutrxfvUMJoNg8e0WYTRSrcHIGDmKP2stSowHyERo/qAYdc7+1kjr+Q99E9wSwDvOAQJHtt5Z+eYF/n/omDqb8FUjpZ/7lk6vWoa/mVUWzjRjQ8NnUoA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1756
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	355706af-ea12-4334-c42e-08d84f58548c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cd0ZPg1SZtJABFFU845AUeImX96+yG7yjIG/PE+VdkKOdAAJkaizQMrS69RNF9xBkSGKdp5p2F/78tk54HW0gIRWifEe4lv/6qGeEisbT3HRjihadZslhk6jK3m95oA/6gLsIgGbJeT2dRtE3krPScgbC66NmLcf+HUAgEgNa8rFb1m3EP3xfzvcmxkufvL9R3F9zORVSCTrBk8gJF3ZJUBSj4J5ZzBgfcOKBlXYnt9vDJyqIWxbT+1YrHXjYck6/Klxvij7ruG0AoVKz1LgotNNyJ19r45XdOWA14rnITUKFmOfhdLFWU7CerxwMUx6ur9WDiLzDSpunfi3Dp5T1zGZHxDDwi/TObjqBGFx2EO74/kmIh+SxW48FuQq2WJbRHJRdDc2OGRyS/6S9uoThw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966005)(70586007)(5660300002)(186003)(6916009)(336012)(1076003)(86362001)(82310400003)(82740400003)(81166007)(356005)(47076004)(19627235002)(4326008)(44832011)(2616005)(426003)(8676002)(478600001)(26005)(70206006)(8936002)(42186006)(2906002)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:53:48.6888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d78e96c6-1024-4eea-bb5b-08d84f5861a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1684
Content-Type: text/plain

Add all the available ARMv8.2 tunings from GCC.  This belongs in
OE-Core, but adding here so that it can be used while trying to upstream
there.

Change-Id: I5025eef6d18545478116b5079daf9c4d12e93dca
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../include/tune-cortexa73-cortexa35.inc      | 20 +++++++++++++++++++
 .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
 .../conf/machine/include/tune-cortexa75.inc   | 13 ++++++++++++
 .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
 .../conf/machine/include/tune-cortexa76.inc   | 13 ++++++++++++
 .../conf/machine/include/tune-cortexa77.inc   | 13 ++++++++++++
 .../conf/machine/include/tune-neoversen1.inc  | 14 +++++++++++++
 7 files changed, 113 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
 create mode 100644 meta-arm-bsp/conf/machine/include/tune-neoversen1.inc

diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
new file mode 100644
index 0000000..9e0786c
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa73-cortexa35.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "cortexa73-cortexa35"
+
+TUNEVALID[cortexa73-cortexa35] = "Enable big.LITTLE Cortex-A73.Cortex-A35 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", "cortexa73-cortexa35:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa35", " -mcpu=cortex-a73.cortex-a35", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# cortexa73.cortexa35 implies crc support
+AVAILTUNES += "cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+ARMPKGARCH_tune-cortexa73-cortexa35                  = "cortexa73-cortexa35"
+ARMPKGARCH_tune-cortexa73-cortexa35-crypto           = "cortexa73-cortexa35-crypto"
+TUNE_FEATURES_tune-cortexa73-cortexa35               = "aarch64 crc cortexa73-cortexa35"
+TUNE_FEATURES_tune-cortexa73-cortexa35-crypto        = "aarch64 crc crypto cortexa73-cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa35"
+PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa35-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa35 cortexa73-cortexa35-crypto"
+BASE_LIB_tune-cortexa73-cortexa35                    = "lib64"
+BASE_LIB_tune-cortexa73-cortexa35-crypto             = "lib64"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
new file mode 100644
index 0000000..8bc6b74
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75-cortexa55.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "cortexa75-cortexa55"
+
+TUNEVALID[cortexa75-cortexa55] = "Enable big.LITTLE Cortex-A75.Cortex-A55 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", "cortexa75-cortexa55:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa75-cortexa55", " -mcpu=cortex-a75.cortex-a55", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# cortexa75.cortexa55 implies crc support
+AVAILTUNES += "cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa75-cortexa55                  = "cortexa75-cortexa55"
+ARMPKGARCH_tune-cortexa75-cortexa55-crypto           = "cortexa75-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa75-cortexa55               = "aarch64 crc cortexa75-cortexa55"
+TUNE_FEATURES_tune-cortexa75-cortexa55-crypto        = "aarch64 crc crypto cortexa75-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa75-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75-cortexa55 cortexa75-cortexa55-crypto"
+BASE_LIB_tune-cortexa75-cortexa55                    = "lib64"
+BASE_LIB_tune-cortexa75-cortexa55-crypto             = "lib64"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
new file mode 100644
index 0000000..58a3019
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa75.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa75"
+
+TUNEVALID[cortexa75] = "Enable Cortex-A75 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa75', ' -mcpu=cortex-a75', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa75"
+ARMPKGARCH_tune-cortexa75             = "cortexa75"
+TUNE_FEATURES_tune-cortexa75          = "aarch64 cortexa75 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa75    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa75"
+BASE_LIB_tune-cortexa75               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
new file mode 100644
index 0000000..138d443
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76-cortexa55.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "cortexa76-cortexa55"
+
+TUNEVALID[cortexa76-cortexa55] = "Enable big.LITTLE Cortex-A76.Cortex-A55 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", "cortexa76-cortexa55:", "" ,d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa76-cortexa55", " -mcpu=cortex-a76.cortex-a55", "", d)}"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+# cortexa76.cortexa55 implies crc support
+AVAILTUNES += "cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+ARMPKGARCH_tune-cortexa76-cortexa55                  = "cortexa76-cortexa55"
+ARMPKGARCH_tune-cortexa76-cortexa55-crypto           = "cortexa76-cortexa55-crypto"
+TUNE_FEATURES_tune-cortexa76-cortexa55               = "aarch64 crc cortexa76-cortexa55"
+TUNE_FEATURES_tune-cortexa76-cortexa55-crypto        = "aarch64 crc crypto cortexa76-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa76-cortexa55"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76-cortexa55-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76-cortexa55 cortexa76-cortexa55-crypto"
+BASE_LIB_tune-cortexa76-cortexa55                    = "lib64"
+BASE_LIB_tune-cortexa76-cortexa55-crypto             = "lib64"
+
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
new file mode 100644
index 0000000..70f9770
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa76.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa76"
+
+TUNEVALID[cortexa76] = "Enable Cortex-A76 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76', ' -mcpu=cortex-a76', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa76"
+ARMPKGARCH_tune-cortexa76             = "cortexa76"
+TUNE_FEATURES_tune-cortexa76          = "aarch64 cortexa76 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa76    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa76"
+BASE_LIB_tune-cortexa76               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
new file mode 100644
index 0000000..672c8d5
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-cortexa77.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "cortexa77"
+
+TUNEVALID[cortexa77] = "Enable Cortex-A77 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa77', ' -mcpu=cortex-a77', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "cortexa77"
+ARMPKGARCH_tune-cortexa77             = "cortexa77"
+TUNE_FEATURES_tune-cortexa77          = "aarch64 cortexa77 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa77    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa77"
+BASE_LIB_tune-cortexa77               = "lib64"
diff --git a/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
new file mode 100644
index 0000000..04e28ee
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/tune-neoversen1.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "neoversen1"
+
+TUNEVALID[neoversen1] = "Enable Neoverse-N1 specific processor optimizations"
+# Note: Neoverse was called Ares, and GCC will accept "ares" in place of "neoverse-n1"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen1', ' -mcpu=neoverse-n1', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES += "neoversen1"
+ARMPKGARCH_tune-neoversen1             = "neoversen1"
+TUNE_FEATURES_tune-neoversen1          = "aarch64 neoversen1 crc crypto"
+PACKAGE_EXTRA_ARCHS_tune-neoversen1    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} neoversen1"
+BASE_LIB_tune-neoversen1               = "lib64"
-- 
2.17.1

