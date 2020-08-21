Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.54])
 by mx.groups.io with SMTP id smtpd.web11.137228.1598026199981070915
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 09:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AHz+WIbL;
 spf=pass (domain: arm.com, ip: 40.107.4.54, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrnKK1lika1+KArch+LcZJd6/XtmpnL4C71+yrMWKPE=;
 b=AHz+WIbLA8R2ZhguYYJW7tVXbAv2RKBW8pXj8t/ThkDYyAlwzIT0UKY+j6XcHNmH1iFssYslBJSJwROmHAqG2gK5IOd1jPvaK15Fays+wnIssXI1w1NRAoBrzq9ciRBXbZdZjnhMK+YlKgLwVCNI3Hla7I4/rXnNVJ+OMsB8JkM=
Received: from AM6PR01CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::30) by DB6PR0801MB1653.eurprd08.prod.outlook.com
 (2603:10a6:4:3b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 16:09:57 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::65) by AM6PR01CA0053.outlook.office365.com
 (2603:10a6:20b:e0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Fri, 21 Aug 2020 16:09:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 16:09:56 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 21 Aug 2020 16:09:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: efb360e8f4b1b84b
X-CR-MTA-TID: 64aa7808
Received: from cb2c49a0d14e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 638F75C2-A732-4B65-929D-B9173ED1AFC7.1;
	Fri, 21 Aug 2020 16:09:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb2c49a0d14e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Aug 2020 16:09:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JTiqjsMpo/bgYsCOx3E62INtrQRRCAdLAckEO1JOfwg9wihebAq91kGmjt8WPfTyURwUm2/YMq8YINs+F3tPCxj78X0hFUa+X1aWf+5AleBj07tK5IA984wo/2pR8cxUEdsSoRgutKs1liA18G2VCkppgq5+ngDpJxjICBQ1T5UN1jNXJNsNFr7m1kCxplM6AXfqC2nPs8W54xsWLwxPbLYEuu5FHXn4W/z202jzvdBBMQkY5DhBI6mCy6+oiLWp+MdDZB+A5qbFQiPF4KFoSdwQPMbxE/6IaSx2c6SwvQ6I85+PTtcId6nnQn83EH8DMAD6qcvmlxamt/EoSAq/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrnKK1lika1+KArch+LcZJd6/XtmpnL4C71+yrMWKPE=;
 b=FJRlBNpSX6lgYdqCo7r+4HOJkBLvRXwlFvh3yV1iDViZkyQZwnHabGziJ4e3LW5OVz85yMUNc4moULfutZcqzvVVWY5XSAg9trb9NMk038Fpq5PiZtDK2pusHTsi89RuOI+H1QHfEfYK/Eca4P4RWse5n0CrKL3q65ducZQlIQemjdciPZ/pJxPrX800zBJ/+CtzQg6mRYb4b6j/n8ZCbbypI2996+XG+Elv7UK0503z5j/mgaS0MSfhRcKCjiQJC0pFLcM5qW3HUqKt/9PNyrHPPXE58THsT5QJn2aKkz4qr3m4NmCUK2hKlEnyeCw2Ei2nraCrpy4w1rCEQDzxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrnKK1lika1+KArch+LcZJd6/XtmpnL4C71+yrMWKPE=;
 b=AHz+WIbLA8R2ZhguYYJW7tVXbAv2RKBW8pXj8t/ThkDYyAlwzIT0UKY+j6XcHNmH1iFssYslBJSJwROmHAqG2gK5IOd1jPvaK15Fays+wnIssXI1w1NRAoBrzq9ciRBXbZdZjnhMK+YlKgLwVCNI3Hla7I4/rXnNVJ+OMsB8JkM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 16:09:49 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 16:09:49 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2 1/3] arm/trusted-firmware-a: fix variable name typo
Date: Fri, 21 Aug 2020 21:39:25 +0530
Message-Id: <20200821160927.10598-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR15CA0056.namprd15.prod.outlook.com
 (2603:10b6:3:ae::18) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM5PR15CA0056.namprd15.prod.outlook.com (2603:10b6:3:ae::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Fri, 21 Aug 2020 16:09:47 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 00ec2123-5a8a-4198-dc7b-08d845eca5c9
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:|DB6PR0801MB1653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB16530564C9170E09090B45B2FA5B0@DB6PR0801MB1653.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:923;OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RjOiVJQ4ME3KuBXUPhlRfgfXoCmWk0l9nHqsXlrBkEcQ8TPPEA4qel575ivOgrd6/tav8Ho8uRlLZM8NCWwBMOPLLr8ZiM8N75fdXHc48qDIxGqYiLBwg7pIfFACjGQzStthC6gS9nucmcE7kkA8ebDbXaWU+rcNkYqu7Vlk4yxW3NQv57Ia3XpJ3tVxNjBAUrY0MTQ94bjyd+DmHPFBNrunq5Y+nGhpr7M76IUArRQDF4zDpubSaZh2nah69mTYolkijwkGBxeXO33XKlmevyuG3dqUrBQm6yNh5+50dkvSWpcijlc/KKVFGvYkQxtn5zk5NWto2+q0BvaLKWDrWA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(1076003)(6666004)(5660300002)(86362001)(8936002)(316002)(66556008)(66476007)(478600001)(66946007)(8676002)(2906002)(26005)(83380400001)(6916009)(4744005)(16526019)(186003)(36756003)(52116002)(4326008)(6486002)(2616005)(956004)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 CvojAVaq14MurpjGzrLcSGrymmdldPABetNp1YuugFh3sA4M5LL8n3srzeMgNzqxOKtBRUSo4pVP1JmpCdR04BXryQxeSwnIs1WLf9OGjfVJSWKLTOXS4hhJCDgHcimct0N2O0j9N4e1c5FwE8a0eXLTeDQHRzswKjqD2YWA+VEXzzKS2i5nYINCUfYQvxv94WBZHqBCgRy1lblj0w0CE3gCe42IcQhIlqn8N4slkm2N+TMejnLSLz+1YBvtvw00Wc09XbIdL2/4EhNhYFudaCcBQ3OvZzZAy9wQ4tfhkDxFeSKh9V2hgpYaMH79mVlJD+6YU+3+g7lKFcnmlvnvrMDT9Tnq3CUnwyMVGT0KRUZ+89222Daad/HUy8bpIQXlkZMiWv9B6R/Sar/Y+QtNyyrX3g0R4KIq5FKFhU7vGsimEhDftU063H3m0tzp5uJUazsJyyx8eSkuy2vbaIBPe/Cn/hXeG6ngFWWfmX2ld0rag0/8Q4Qm13+61nVutH/f+6XR1HQrYDuKIcwKQyTz0widA0v8y50GqZ0eemGYQCOu7TqSxVfmRLejhxRahp4FXbK4Ug3eqsy3ba8It92VPZD/IKyZPduHem4kYscuRE9kS34rY50aNYFhV2Pt6pCsPHFwpjOR5OapJK/uTaoDjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5732
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	10534a1a-75d4-4f39-af08-08d845eca11a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FfXfk03Izk5Je9Lc2p07BBKViU221Srhv/6V8QDkzO5J0GvuViQEUwl2ci+LQNpdrcLB0e/fNGIT9D/mjjE7VRC55zKMMpqwZ9B4GkVCQS6odoQQVMNWXPOYdpcY+zFH51yj9SIom8k+qaKj1ZzGAaYzykdG8wDvCGPt2FHyZ0jerPTb0ZEywQkx2j45JhfumJJdBQEeKehVmLNy+DhRM5VtTc2eGRZiuiSsKyOUtglK/jylIxeRFBElDRjHDBcLgCp/mErtwBn6FFYh9Dwsh7xCYs0GctjuFuli23CADiTZJ3VUgZ6joxxXmB7fNAN45rXtR9EcILUneioAwM2tKM+naZOWinWKKSaGiVfosxe8KPA9VN7Yfj6OofXQsO0TpM2Ywvg+eyDAsSfC+3Zv+w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966005)(316002)(6486002)(7696005)(70586007)(8936002)(86362001)(70206006)(83380400001)(82740400003)(47076004)(26005)(4326008)(4744005)(36756003)(1076003)(6916009)(82310400002)(478600001)(81166007)(356005)(336012)(186003)(2906002)(6666004)(16526019)(956004)(36906005)(2616005)(5660300002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 16:09:56.8473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ec2123-5a8a-4198-dc7b-08d845eca5c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1653
Content-Type: text/plain

Variable name "processes" is wrongly mentioned as "processed", this patch
fixes the same.

Change-Id: Id9362f514861c75f8f6a727582e11b0e65736349
Issue-Id: PLATFORMS-3971
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 4362882..e4847b5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -171,7 +171,7 @@ do_install() {
             echo "dtbs install, skipped"
         elif [ -f ${B}/tools/$atfbin/$atfbin ]; then
             echo "Tools $atfbin install, skipped"
-        elif [ "$processed" = "0" ]; then
+        elif [ "$processes" = "0" ]; then
             bberror "Unsupported TFA_INSTALL_TARGET target $atfbin"
             exit 1
         fi
-- 
2.17.1

