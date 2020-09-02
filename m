Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.52])
 by mx.groups.io with SMTP id smtpd.web12.10828.1599062032798402979
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 08:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WjKP+aGN;
 spf=pass (domain: arm.com, ip: 40.107.1.52, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Saczcz/rKNOxgFBnke7ZAM1mZqn7eDiLLVh6vkoy8=;
 b=WjKP+aGN7pM+sxAaCqFaBq2Tgiz+S8WF58QkwaIhnTfnHdpripkhzBXwIztx2y+BIp1sNIzpbpxGgFtmOgnZSgX8SUJVFB7+rdqP6SGrFQi0hi/5J0xQh7+zB+Oyicbe2N4/Vhjt1+awr38cXXTz3bxMGgwMyCRSu8S9t1cGFGw=
Received: from DB6PR0802CA0037.eurprd08.prod.outlook.com (2603:10a6:4:a3::23)
 by VI1PR0801MB1645.eurprd08.prod.outlook.com (2603:10a6:800:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.24; Wed, 2 Sep
 2020 15:53:49 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::e9) by DB6PR0802CA0037.outlook.office365.com
 (2603:10a6:4:a3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Wed, 2 Sep 2020 15:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 15:53:49 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Wed, 02 Sep 2020 15:53:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc97e2a4ba1893b4
X-CR-MTA-TID: 64aa7808
Received: from ee93db1939df.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 749EA840-D221-4501-BF28-F0944FDB41C5.1;
	Wed, 02 Sep 2020 15:53:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ee93db1939df.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 02 Sep 2020 15:53:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3+f8HtpsMi5ZJKTZzVdIh9Vd1q+ZE+Uhlu/Syqe8c54ma6dMQxiOFCVmYvO9HTS7sMQ0EODfU/bxCJsnyKxxcMrcjRYCJl/1HlB3kwK9qw6nvZKPMM9hSddDvQZ+j21WxDhebbLq1KZKEB72cU9pJ2179/WkocKUucydLO2gbX1b+ACwE8Ml8Hrn8ActcCtEhSMQRcwPd+lte1q9GmX984jjnlajWKZDzBvfsfOPld8HBdbKTPIVkkkD8g7iJXUJgvA1h7yTFogm+OfBpkPrOollMxFR5ejQmNc8nmzQ5vWJXsGMPUYN6NONkCFCGXaUQxFYMLneY/KtKpq2jyStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Saczcz/rKNOxgFBnke7ZAM1mZqn7eDiLLVh6vkoy8=;
 b=Z7awamiJnPT/FcbotNanyaFo/ATE5bi9ugx2sTUH7cVMYaEaKrU9k55bLl2an2yH7eXj3MDLTgLQJJXvVx2y1Ap/GnWhtzKMpr4c1Y3PA85LzQTgdd8q9GidyuRv44IREePNSV9riuFuSHg0y57qIMbZTdJ0UhCYq4tCuY8tcT0foLh6IUKDeWiHikfG3ouU8YbeoeMFS7IgK1rIDZ7INJsanlRKrozXulUB8fbHeIssoWN+BbXw/rxC9N5Dpb7oihuu0BhE4W9H3Vt8ce0vSD8wJbJsk7QThH6woAIPV6wca3QC11+OpS2PB/SbPi7yIgFOq2N5LXIA35koV/0DIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2Saczcz/rKNOxgFBnke7ZAM1mZqn7eDiLLVh6vkoy8=;
 b=WjKP+aGN7pM+sxAaCqFaBq2Tgiz+S8WF58QkwaIhnTfnHdpripkhzBXwIztx2y+BIp1sNIzpbpxGgFtmOgnZSgX8SUJVFB7+rdqP6SGrFQi0hi/5J0xQh7+zB+Oyicbe2N4/Vhjt1+awr38cXXTz3bxMGgwMyCRSu8S9t1cGFGw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR0801MB1756.eurprd08.prod.outlook.com (2603:10a6:3:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 15:53:42 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b%12]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:53:42 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-bsp: use neoverse-n1 for N1SDP
Date: Wed,  2 Sep 2020 11:53:20 -0400
Message-Id: <20200902155320.16918-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902155320.16918-1-jon.mason@arm.com>
References: <20200902155320.16918-1-jon.mason@arm.com>
X-ClientProxiedBy: SN6PR2101CA0019.namprd21.prod.outlook.com
 (2603:10b6:805:106::29) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SN6PR2101CA0019.namprd21.prod.outlook.com (2603:10b6:805:106::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.1 via Frontend Transport; Wed, 2 Sep 2020 15:53:39 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 02 Sep 2020 11:53:35 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 155a856b-e639-44f9-2455-08d84f58622a
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1756:|VI1PR0801MB1645:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1645829D04CC464D54FF018FF02F0@VI1PR0801MB1645.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 25khghJANrMgDATHFPnXEs3v8KGOWGRCyI3bl6RqQ5j0h4gyHO+rzTphNG/NCtkAPdTzQb/b060Utapy6E8Gd2AihY+TKl0yOOs/Zbf/Q0dv1hCnAg4k/hR6qRjTcuwQ1stFXNmYXmS9aiYg2lRXmr4XJlSwJuMF1DUoGUcMmaTxlewKMmU0oIsutEDyeWPJlSLQxu3HkErZw/24XPcwunvDY0tA/dY17OTqPJ6/a5jpOAFr1VEZKeTxbzvscDpBt/vA5+uYrgrV8//IjUYiZybPRutbsOWcelFoDKYpmxqZUuR1OFnwxi8d+UUUPd4f/QeDdCo+67jfFIaJv5HEK644DiIX8mBEqAkFOu/v/T+CnizGWb/Xj0zEMajRWFAuKgpD4xkY6RRM++XXjRwNqNzCcBfile664wh0+kmj5iTwa4Wv9n0JwMtFh9EZJNkB8ITpvqc+lPzPoGPLIvDH1A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(44832011)(36756003)(426003)(6666004)(8936002)(52116002)(86362001)(4744005)(966005)(478600001)(186003)(1076003)(8676002)(4326008)(5660300002)(316002)(66476007)(42186006)(66946007)(66556008)(6916009)(83380400001)(26005)(2616005)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 6qjEpmFPWEoa4ZQ1Db4AfvSEYI8A+aq1+cp6J/kYSwG3JPqsH2WvCmcV/xRJQgE6vaR9un87mVHjU9Z9gF+rprF9K/3qCu9NeiAlUNIU810IBGdiuU1lPqZ7s5Yz62VB21yYB3kU0awAnEA979ENFXLpwKT0jVfpmzFdxfA7h7xDo3Hq8wDf6sDs6VGtJudU3ahXOy2noqrY2YnOZNyEwMwBOpZwemFnv7lccm308SckCO18/XFw+0ByAf1YKqX5rU256ILAyk8fSUEBUHPFyDkBtZR7Dt/aENVsMuMZHdN3yYAXoPS2x8SXjH5ZQxflt5rHlIpvtad2+C1Ls+SQON5sCyCGMa8jGeHwEy+uAGPQTOSEclQoP9LP276m34qDKVUVFVmH9UQtVdJsoOeDWtqkFZie+ZIPlkB7lg+v1jroBRQ1lfeNRCg6RAcUYFMu5ey7McmKt4qtyU0nnESZ/V9gSOcOfWbn8b1QDclz/qXFpR09QNXeRZ110d8mgSI7SqHhECF6aWvgUbZI7VGY4WDqbmyPZIoYqaqXyPXKtowgrm0X3ftNVqlnIPecSAWpDBNzGKjJAtt/IcqZwtfL2ntOnBdciHqqigypeLs6pW+yNLgO+DAcE2veeMfYqHESVcXdqBS7/e/YoYrcxazFSA==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1756
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	deae9e73-7cfe-4c93-0038-08d84f585ce8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yh1y6MXP+DeaHycgpjoBch0ATCivf21oap6ROYak8MyOI6XCHw3hVjhh6clrUWa4Bqau4VtnNfdOImhj/f+GU8XwlvL/6sHqntfJbtweMDBlDdO1xxmKTbsd020greK8xDp6JolYNqP3HtX+0m6oDuHj4vWldsRjb06CCNTmOFjC3PC+7bTEeiW/4kMpnnYFfZ4SsCRL2UU2EgPFCtHUJx70Tf3+5sFYo8rO4Z7E2YLJcAwSNfoQyhULAWniSivr3RziRN216y2o3bZYMafAAHS3BpX+QYP/APG3MUJoh+PtZiLAiwvHHb3SJBzUvnZEAqp24NXFbDwCq7dsnZOLVl0SURB1VNElOpBHmlv4Qi0TzytBbr8+miNtynccFWx3dooZlS4emV8qgkYHNXeuAgqz4k8yU9LCnfTkwfBmFINCbuv/43WQxgm22g4tjN5oI79BGUR1zXwEDGeVemwXUEXuqEg0xrO6miXbkxJs44Bs4/ZK6Du61spfMGuYP1qf
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(136003)(46966005)(8936002)(356005)(70206006)(6916009)(47076004)(44832011)(8676002)(82310400003)(70586007)(5660300002)(426003)(2616005)(81166007)(86362001)(316002)(26005)(6666004)(82740400003)(336012)(36756003)(83380400001)(4744005)(478600001)(186003)(2906002)(1076003)(42186006)(966005)(4326008)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:53:49.5500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 155a856b-e639-44f9-2455-08d84f58622a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1645
Content-Type: text/plain

Per https://community.arm.com/developer/tools-software/oss-platforms/w/docs/458/neoverse-n1-sdp
The N1SDP is a Neoverse N1.  Use that tuning to get better optimization
for the platform.

Change-Id: I435931abd2537a17a08eae06395137ce185a49dc
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 506f3dc..e4e6663 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -4,9 +4,7 @@
 #@NAME: N1SDP machine
 #@DESCRIPTION: Machine configuration for N1SDP
 
-TUNE_FEATURES = "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/tune-neoversen1.inc
 
 KERNEL_IMAGETYPE = "Image"
 KERNEL_DEVICETREE = "n1sdp/n1sdp.dtb"
-- 
2.17.1

