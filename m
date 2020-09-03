Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.48])
 by mx.groups.io with SMTP id smtpd.web10.19713.1599154608427212762
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Sep 2020 10:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=q7RdxWhG;
 spf=pass (domain: arm.com, ip: 40.107.20.48, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko/tCv2MqOcS3lKqrY9b54rYJ0XIApVXNph52ajsb7Y=;
 b=q7RdxWhGBEG/QfM+UcRmftgYS3BVtFROzNlecArd8q3SV86yn350KgmJRGEegkP6XPevudF04OiGkkdSb74CJjRIUK0N1Gk0ksPqH8V0L5dMsftZ98Dnv75oT/YvILXHuqT0SDxJJbC/EHLSAGkXx3GBN43Pn9Iw3Uogj4zZ9jw=
Received: from MR2P264CA0098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::14)
 by DB6PR0802MB2296.eurprd08.prod.outlook.com (2603:10a6:4:87::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 17:36:46 +0000
Received: from VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::64) by MR2P264CA0098.outlook.office365.com
 (2603:10a6:500:33::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Thu, 3 Sep 2020 17:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT060.mail.protection.outlook.com (10.152.19.187) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16 via Frontend Transport; Thu, 3 Sep 2020 17:36:45 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 03 Sep 2020 17:36:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c31848e8ad6264c
X-CR-MTA-TID: 64aa7808
Received: from 155c6b028525.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EF05EF7F-69DB-4510-8269-6F183B1FD59C.1;
	Thu, 03 Sep 2020 17:36:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 155c6b028525.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Sep 2020 17:36:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl+eNM/PkbFBYzVFZ8MnrM6u9vAd8UyzxqbH6kjqsoRXb+GWPP3hmUbp6IR8J8NYaYiaLC/xxejsnK/oWMjEih3yukWtfxgdGajWncDn8AxTb22ZK7xfV1Eh9UKeJDeIFsHrLIkrYs5vLBgxLeJDh7HhLpUdlcIXqH6yVuladDDRtmHjyQbO4kz2ECQ4wbQfO8KXxSUEd2jOIpd0TicWhyC8YCW6tFM5pDcGlfHgzJTwqggbUJRP9t+yH0yQVgYzLufVm15LLMDBzQeXWo8RBF9LIUyvW7dvfs1Ef69zXbDWJWL9MCOlbBvvk4fXaBb+HC2V2bF/Hz0irqq2jUgIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko/tCv2MqOcS3lKqrY9b54rYJ0XIApVXNph52ajsb7Y=;
 b=Yre1ur6F5d8OIm7UfgvqlloGtlZVKwnjliBUME8Ch82YOlsCPNQB/Np/uNDrQMB+YarWafIFZBq2Kv7aw7Twk1ztlmQrHI/bDXeGHPwabJRLFEKrHe6NqexE1TXdFoEQiZFqAyR+tCD58e6zNhDjvN+l4FSiIDaUmiN4PXKuEqqhbASm8RlIa8KoQ6X1ofvZ3+TFWRypqEmR0U+YDQw437bMLNi6voIDfzTaHxx2yxUcarYKU5q1nU97pQttzNUnyh1lQUa3/txcQQmlKPXFUA1Ce5QvfxrIZgA1wE0irO1ZiIBaUo11bSHhY6F/7OEliTeVc8RlNqy7Gq4KKv7YMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko/tCv2MqOcS3lKqrY9b54rYJ0XIApVXNph52ajsb7Y=;
 b=q7RdxWhGBEG/QfM+UcRmftgYS3BVtFROzNlecArd8q3SV86yn350KgmJRGEegkP6XPevudF04OiGkkdSb74CJjRIUK0N1Gk0ksPqH8V0L5dMsftZ98Dnv75oT/YvILXHuqT0SDxJJbC/EHLSAGkXx3GBN43Pn9Iw3Uogj4zZ9jw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2940.eurprd08.prod.outlook.com (2603:10a6:7:30::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Thu, 3 Sep
 2020 17:36:38 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b%12]) with mapi id 15.20.3348.016; Thu, 3 Sep 2020
 17:36:38 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH v2 3/4] arm-bsp: SGI575 should use A75 tuning
Date: Thu,  3 Sep 2020 13:36:17 -0400
Message-Id: <20200903173618.2910-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903173618.2910-1-jon.mason@arm.com>
References: <20200903173618.2910-1-jon.mason@arm.com>
X-ClientProxiedBy: DM5PR06CA0055.namprd06.prod.outlook.com
 (2603:10b6:3:37::17) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by DM5PR06CA0055.namprd06.prod.outlook.com (2603:10b6:3:37::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 17:36:36 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 03 Sep 2020 13:36:32 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 633b0cf8-eb5b-4af9-0c1a-08d8502fed9a
X-MS-TrafficTypeDiagnostic: HE1PR08MB2940:|DB6PR0802MB2296:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB22965797426DB017744D2B27F02C0@DB6PR0802MB2296.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3u5jbvR7yn6ooqAkPa9Y0Dz2GZrs8OhlNmXpu/z/6MD4rW9PhF8tXXidYn+MJTipchNk+QW8sWFxVpI7j4fmACrJxEMQ86/oNbnam1D3kSd6MlkR3RpIfm0Vc24dJyzVyMWuBm1rreRTxZhQqVftXt9YBMBfn7SBqN543qIG2nSsIHeiI1V+3mMeeMzfVMYnC6d3CdNqCirU5bzn0XCHXN2whYk9eWB0CRuAenAs9/1VEcFQ0e8woclECMySLeOcGO/FikgrXpD6HuI84buDfLO9fpmdsMD6qZ+giXhQgk3jUfalTKD7yFh8ypIKF7W6mUjpyU9sdPlOMho7hPmcEmROdIP8ZXmaKsyT0cofkOo8Z9Z0DP6kkK5wKAE5N1vbgbFiuGYlbEUnVemf3/Kv+g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(1076003)(44832011)(36756003)(86362001)(2616005)(426003)(8936002)(52116002)(8676002)(6666004)(966005)(6916009)(316002)(4326008)(66946007)(42186006)(4744005)(478600001)(83380400001)(66556008)(2906002)(66476007)(186003)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 YXC/cvBsQIvbEBnBrP8Hl6hZtAaT4sYvl15PBZd8s5xrKOon3/iiDjxmiU2Sqj0qBbD8vXofm6ImF8ddlnvW3yElIarbeKbaf+AmM7TKcYjZCQn0mJGzVVlJMNGDSl06ZcjpMTpU/yGrHajoZGhhRrtXEMtVJ1ByB7444JdiY+pOgwow2Qm0aw4pEkOSF2qgk3R/6aX0qFxQUMTiOUSDBO2lel1hUxZ0CsGsgD2ptnceLUXGrGWZkUxjxDG8Xd/SR72s13KLmxELxSkGqvYqnpV79mfM71hDYc3BK6ipm68BUkDIF58Nt/P+VUUpqXQnm5sKGMopfJZmRZpzQZqO/sXzPUKVpVLEK4WQUWHWClE9pMo4paIZwaNdQIFRvNNSqGoUK7w/zkjACs0hv8XsJst6btc0GchGSqUZAnzw9KUuCSdcgpQ5/UL70qh0wEPsad33qdpfVgZHd49pgB7NIzDTREAGCT1RprNOXJ8kB5FMdpwShR2eKEHixtJQ82743rBczeVG1SEHUIoU/8AwJ4kMPGUme2GaZX2VSisYPBEMsE/dRTUX17IleY8Y8ifYZU3OrIekK+Y7OkdKYATE7kN5UlGQf0bHSUdXrssU+OPq9wniDV6hLzl0luqfHppKNYa176SdE4O6BVyiCJIOrQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2940
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d004e19-dcca-4333-7e13-08d8502fe8c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cCk+sSbOQPoW/loRKixK0CV5se1qPl9X+Bx1OuB8P2vkC6y5SOGxrFtObnY37hGCJH4i9wUPYBER9oIV+G+TcIudey1nj9uBeqk7mECfTW4q/aojSDHsNHPRkqcfLnwxlMGL0WUasuvr3WYu5m0alGgFe6rTtYYQFdFrDOzt4p5VxLDBU9v1jwHA+JMZ9MIMzX77FT+ERIVACYmWT7HthjORwJttAPY/hNIfWz3k5hevv5nzFUJuTJK77Dlngs/DqRGTIppoCMQdkx+z36Msxb/XWi4lz6OdIvACx7ShMOVGSPzJnP+oPZ93OPHDx+t/Cp48uyWmbuNjMIVqvBMmV5Qf4cjcZYESRpTobjHsdKVEH1k5FROhmH/5gEc5WOpBggTAFhABhDpnvZfR9WSW04UPqmLqlBV3kqZWH4w3g6blxgpjuKDw2SgBYA5xNRd5LeShmyws190rnNyb69H7FTkTecHS2wdvIlfNI9mYCgc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(82740400003)(4744005)(356005)(81166007)(316002)(26005)(86362001)(36906005)(6916009)(6666004)(186003)(4326008)(83380400001)(36756003)(5660300002)(44832011)(478600001)(42186006)(2616005)(8936002)(70206006)(1076003)(336012)(47076004)(82310400003)(426003)(8676002)(966005)(2906002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 17:36:45.1806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 633b0cf8-eb5b-4af9-0c1a-08d8502fed9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2296
Content-Type: text/plain

Per https://community.arm.com/developer/tools-software/oss-platforms/w/docs/489/system-guidance-for-infrastructure-sgi
The SGI575 is a Cortex-A75.  Use that tuning to get better optimization
for the platform.

Change-Id: I6172820684f2c32eb57be1e86f2ac632fcb7cecd
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index f8ad7a0..163c3b3 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -4,9 +4,7 @@
 #@NAME: SGI575
 #@DESCRIPTION: Machine configuration for SGI575
 
-TUNE_FEATURES = "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/tune-cortexa75.inc
 
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
-- 
2.17.1

