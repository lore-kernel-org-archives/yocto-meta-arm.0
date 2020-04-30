Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.70])
 by mx.groups.io with SMTP id smtpd.web11.7055.1588253384417640248
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 06:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7T0BVNoT;
 spf=pass (domain: arm.com, ip: 40.107.6.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OorXrpnZCFDnZxHFtowhqHNJvOr/hgMMP6hNF8kzs3g=;
 b=7T0BVNoTyB5af6fBPDq0f/xsBYTUXO8BCwias9Q4m47V7OiRyKlSchSgZ7UbkRCK+Y9SMYFtNJxANXvAWU+L9rNOA+ouqE+/h+8tu3AF1/3UeNBnSThI07xkkunQYZnxSK42i4rcXAdsH5cxpObeYCWm+2pbFVITlxUd+hbzb0I=
Received: from DB6PR07CA0172.eurprd07.prod.outlook.com (2603:10a6:6:43::26) by
 VI1PR08MB3470.eurprd08.prod.outlook.com (2603:10a6:803:7c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13; Thu, 30 Apr 2020 13:29:42 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::23) by DB6PR07CA0172.outlook.office365.com
 (2603:10a6:6:43::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.10 via Frontend
 Transport; Thu, 30 Apr 2020 13:29:42 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:29:41 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Thu, 30 Apr 2020 13:29:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3b32326e978b361
X-CR-MTA-TID: 64aa7808
Received: from 15c041b493ba.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 854CED34-5F46-434E-90BA-019E6817908A.1;
	Thu, 30 Apr 2020 13:29:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15c041b493ba.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Apr 2020 13:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGM+R77C+RqiyIOKoJCUEyiAh8ctuMfbNKZPkOJd5LmIZrKZHTB6tswJUhC7beRoDSMWC0xBdYl+v500cSFCa7x2UDu/kOc3LWUW3B8kbfaB5I7epnftsLaXALk9VV7VlOJCeuYty4ydrH4R8sFDIybDbVC7fsCe+mK1TFor56kvjY85RC/7y+Tsa3fQxzC7ryu4hlsbHq6FlbsSZJ39XPnxpoGUQn76EOZ1/HSkw3ESbh8uJWrmwTFE+P4wrEwhVlgusmbHedh8YvD/pdmOQFW5NbgQtccBOg/l9to2y1Q92fnTKjyaR9m1pe2LLii0e9x+L14qbCPOfvDPn+nprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OorXrpnZCFDnZxHFtowhqHNJvOr/hgMMP6hNF8kzs3g=;
 b=Nou9t52sMcG0DjlusRRE/hv4MS/lZCi2rP8vE8FL3ZoNqG1PMddE825ux7knorLhNUsyXVb02A/J8A47rysAbPo5V9ZwC5ILkT2cyWjjW9nne0REk6Z62/MKjiW2Rb4r9P3lcxgCntDJmX7bSZ5G3qJW2W50jSk8GLr9AG2oTnj9H2OtpukhOEZY+uOSjVUCk5oBb2sxXYCn5OvOuHujfB0ejfTUDrlphjVK9DVlHd7lBd1pgPmq5Zjp/HvTrO09pxrg1JawhF+oabRaMKCK8eD/igsl8I+ohLnM//H26HEkrj0yPOAYF/K/p2yH0tbGyEYn65zm+LkmNQ9BlarqYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OorXrpnZCFDnZxHFtowhqHNJvOr/hgMMP6hNF8kzs3g=;
 b=7T0BVNoTyB5af6fBPDq0f/xsBYTUXO8BCwias9Q4m47V7OiRyKlSchSgZ7UbkRCK+Y9SMYFtNJxANXvAWU+L9rNOA+ouqE+/h+8tu3AF1/3UeNBnSThI07xkkunQYZnxSK42i4rcXAdsH5cxpObeYCWm+2pbFVITlxUd+hbzb0I=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB3443.eurprd08.prod.outlook.com (2603:10a6:208:d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 30 Apr
 2020 13:29:35 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 13:29:35 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-autonomy] xenguest-manager: Wait longer for /dev/xvdaX creation
Date: Thu, 30 Apr 2020 14:29:33 +0100
Message-Id: <1588253373-58920-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LNXP265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::34) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.50) by LNXP265CA0070.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5d::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2958.20 via Frontend Transport; Thu, 30 Apr 2020 13:29:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 68aecd10-8254-4461-ca92-08d7ed0a8a23
X-MS-TrafficTypeDiagnostic: AM0PR08MB3443:|VI1PR08MB3470:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3470F6D4CF7AE1FA8AEDC5A992AA0@VI1PR08MB3470.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;OLM:3513;
X-Forefront-PRVS: 0389EDA07F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pkWOjDnJH0gWbFxHBaxq/RN5Vz3BwLsB2NgExX9QxJs1jSGVUXIgC0RBDPgye2uXZz/vzxt/A3f7/QvwKXi05K4x+0KBZ/YwbQvTdDlTmSQAJqFTqyWvfTLT8afi9IqdeiDybjivViDuWTFtkcq/5mpjmuFQVe62ZKNwkac8PHsMHia4ac/3Mk99HpBRHCgWqhbZM7RGOk5Ejv/u5rwnnnppsDUBpcT4f607JZU6rYfPMhYrpmCm2hmQaUYZk5kdvwxhisT0SLO2UCNmSlQU+QCgCEZbwC9IWfjSR4XRMqxQuKQs/5hB3/LS1uNO7C27EeuYZC0zEZtPf8kgpHrjLwHnNFCRm7taYu54N733un6wQkzSDo6+KnNClHdWa+Ogfk6yzx8darEwevTOQ2NMWGtPBlZxs6Yd3to4OJR363Y1JRH39ofZ8x59sBhU8yjzH4TLrgZ++vuvmPWJ6Ibqc/X5rjuR6nViaab6cBM63msi8fPegUSs6IsIWqOe9rGL
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(86362001)(7696005)(8936002)(6916009)(52116002)(8676002)(36756003)(2906002)(316002)(66946007)(4326008)(26005)(16526019)(956004)(186003)(66476007)(6486002)(66556008)(478600001)(2616005)(44832011)(5660300002)(148743002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 EDR0y/w8oV6kUj9Bbus5siW51iR44KQo3XSI+XXN181S454v9xOa0k/5BHkQjCFgdkHFBTT8iQlhDhkdSCj4Z6kz7M8OQADnLbzDjG4bXTzxUPyjBCC7Y49usiUM5U1weqNI5iKeFydtlBTPjhlMA4urGzEcAlKCnNya/SWdUqEYOA8Wi8LLxEApCj2z6GnGLGsWP63jCYFSkvUP7t716KBraR3k5CqdEe3TFLVvVJydgD/YzHb1ZXBMr4u+XU2W0/Q2vH5/FH6vZVGFY94HXzmzpV790lQQHuQ+QwVGvraKOyTXxo+kB/Q+tYaP1z/fEN8+Ok9sNvp4iX4UVB4zPcLcGcHYut1BrsgHI66OZeVX3Ylm85UYpjcvLoq3ckElUflVk18D6wgu/AvkindkmgA0v0QgHAj5x68NIpWe+WJPYKfO43Ph58vFq/yMETTTBSvjXr5+b2dy54rplpOBuE3ihHtwYjjP4O4xaDPjIuH2+x55bpZBmUUFrLXA4teB4sjlt5ivlB2ANJbQRaALQFD8/hiHh7C6yv3gkJUvVUj938BioqGvZ3GZLVzPiU5EvfBBWlzKHRmmFqaTAyoHGZexKhwuFnidY/Rt9PxhGTVkBux26uNiIuK0XOTqcSTLuiFJqFtAU62zyW2hHgjYSvsBxeii+bYwTS4jF8o/eqnc21ijG8SrflJPzPHPgjY0FpV0ciF+k/XswLQ7uE2VVjEqJ8JuilRvqEGe7zdKg8soVRLGyhuqriNsHwvg1LvJSdD1k/0c8K8g+l0i++6tmoMVWQGPTxDhjY18f2SbHnA=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3443
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(8676002)(70206006)(70586007)(186003)(6486002)(47076004)(356005)(16526019)(81166007)(7696005)(82740400003)(36756003)(956004)(6916009)(4326008)(2906002)(316002)(82310400002)(8936002)(5660300002)(86362001)(336012)(2616005)(26005)(478600001)(44832011)(148743002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c8ae1daf-33d2-4af3-6f52-08d7ed0a8575
X-Forefront-PRVS: 0389EDA07F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0IZNTfIYFNjVip+d29yLDcTzPn1w+F8CXjUYlBsssAkvJx7+SJRu2gVOFcPmVqBDnrvx3aHz9QqvfI4uCYtmQM3mnLE11UPfiMqPILabW5p4q8zXSHJPyODQDdk4CCytooeBbSM5JFr05r9XavDqrWsTsuNIRjtaW0pBjTOcXb7yiDdjZt4eu1aAj1KwJ4AMgkOGSQTn34G/ARPu0HvAaUp9LlyDbEfDV+SYHCRqj+sfcQrjabqL1/qcr9ZjKnjT3J0jtEIYX3cRrhOYYm8TgXAnjiUtZMv6YL9Z5XdOTwIMpp3VWCda182djAKg+QtHSZ3VzEIUSP5Th8boJfRFMlTqVN/c5baodLZUu/RVTc1pIf0CtEXVFmlcmBgSUda0xIuDGy+PxFZXNThUXwPDdC5kAeMHNbQDFbrC/y02+1xHN4o6/J9DCIGj/tV/Qw1GGtGR8j5oprgytYEuCOYsM4IF3Hw5t5aaZlQUBZ9rmd/K6p362RuBzgiTD9cgsJ9kClSeGn8fUVoZB9J7BVaYa9zCoWNO4jyvweTxEL+HtVY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 13:29:41.9211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68aecd10-8254-4461-ca92-08d7ed0a8a23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3470
Content-Type: text/plain

Implement a wait block of 20s with exit condition for checking
/dev/xvdaX creation.
For example, in cases where the rootfs is mounted via NFS, a longer
time is needed until the xvda device appears in the system.

Change-Id: I44cbcf2a43aeb476eae92d5b6d2cfd683e4bdf21
Issue-Id: SCM-929
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-extended/xenguest/files/xenguest-manager      | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index b25eeb5..4777054 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -234,10 +234,17 @@ function xenguest_disk_init()
                 exit 1
             fi
 
-            # Sometimes it takes time to see the device
-            if [ ! -b /dev/xvda${part} ]; then
-                sleep 1
-            fi
+
+            # Loop for 20s to wait until /dev/xvdaX appears
+            i=0
+            while [ ! -b /dev/xvda${part} ]; do
+                ((i++))
+                if [[ "$i" == '40' ]]; then
+                    break;
+                fi
+                sleep 0.5
+            done
+
             if [ ! -b /dev/xvda${part} ]; then
                 echo "${PREF} Partition ${part} creation error"
                 xenguest_detach_disk
-- 
2.7.4

