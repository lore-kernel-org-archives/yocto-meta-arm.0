Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web11.8764.1589298906005672086
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 May 2020 08:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=o5sYc8/y;
 spf=pass (domain: arm.com, ip: 40.107.6.50, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqA1FfIRt7yKeBPHqdUD0tEjfLr9uruWqYw2XyiisCs=;
 b=o5sYc8/y7gSFhIwTaAaL+LsLuYYRHFk6mXvRFyhOrTAgdJdiKuQV+P9WLwepivrcd9lhrRwYrKo4wxshaK7EwGDjJoq4n35GjpoJWf542Z4nXahs+152GfZO9f/8KKrAR3I7wf6Hm24dFPNi5HzQhhsWreddILHoe8QXVnRm+l4=
Received: from DB6PR0501CA0036.eurprd05.prod.outlook.com (2603:10a6:4:67::22)
 by AM5PR0802MB2435.eurprd08.prod.outlook.com (2603:10a6:203:9e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Tue, 12 May
 2020 15:55:03 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::f) by DB6PR0501CA0036.outlook.office365.com
 (2603:10a6:4:67::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 12 May 2020 15:55:03 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Tue, 12 May 2020 15:55:03 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Tue, 12 May 2020 15:55:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1fd20d1126746801
X-CR-MTA-TID: 64aa7808
Received: from a290d9abadf1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DBAA231D-3307-4CC6-B2A4-B09E1EC61433.1;
	Tue, 12 May 2020 15:54:57 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a290d9abadf1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 May 2020 15:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7IXFs1MSBhEB//yAOXj+aQzWDucnuhZaFpyAJo+Pl+B166xAFP5JbQ5J3m6rCPA+pa4LiaXeHTx58dKPQKUz/DkLn3UX93BLBBO+2COuPEVUp30J/OTXhhl7FJAxyWFDVpC41+UA5OvpnFhVZa7HDoHvw3dhrfw2mNMvOtK7gD6jnRSDbKngD7a1mj/X6A6lc+iMtCs/KoodqhWM7GXyU6JrVUVdpHEUPXLxXjv5OJuY1K7Qi6gkUlrGlv0Nrqebc5eUJegLa2NEf+HugGpvqwRCkBaqad5UHL//t5Pi2J9CHx4K1nG4YEmKWSi7GVHDVOOrO3Y+/vD0uttXhO3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqA1FfIRt7yKeBPHqdUD0tEjfLr9uruWqYw2XyiisCs=;
 b=OCdpGgK6nS4Xoq+L7Owmg2jF/xnMt7h03c3ThMtydaS9Ak0KYLWDumzpr/O5tINZ7XkhlZesl6fD3qPkpmH4jyn8GZt4BFBxKf585f9j3WRTmTCeYrUmITih/MGkRHdfa3Gopt4i42gfNmG+7Yb++AXwq3ch/yM6A5qWRGHkTYCNwJP+l84Onz+B1zHgQaBNulaezeMYZA4JuArVHcIbYGFI+1bLmgY0ME1vwk88BG3tZ7kimDXq3W5UD0yH0bh4aI8zEbXIE4OD0x/t2BpherWuBHj4qnZbdZAeh7ePyLgF043moSPHnPzff0lWf0Hlav6RlEcADB7sQ9WxFUG5Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqA1FfIRt7yKeBPHqdUD0tEjfLr9uruWqYw2XyiisCs=;
 b=o5sYc8/y7gSFhIwTaAaL+LsLuYYRHFk6mXvRFyhOrTAgdJdiKuQV+P9WLwepivrcd9lhrRwYrKo4wxshaK7EwGDjJoq4n35GjpoJWf542Z4nXahs+152GfZO9f/8KKrAR3I7wf6Hm24dFPNi5HzQhhsWreddILHoe8QXVnRm+l4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB2995.eurprd08.prod.outlook.com (2603:10a6:208:5f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Tue, 12 May
 2020 15:54:56 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 15:54:56 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-bsp: linux-linaro-arm: Set COMPATIBLE_MACHINE to "invalid"
Date: Tue, 12 May 2020 16:54:55 +0100
Message-Id: <1589298895-66051-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0420.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::24) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0420.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3000.20 via Frontend Transport; Tue, 12 May 2020 15:54:55 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9e12d3b-3938-4efa-ab3c-08d7f68cd584
X-MS-TrafficTypeDiagnostic: AM0PR08MB2995:|AM5PR0802MB2435:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB24350C9A9C41F038A38F3C1892BE0@AM5PR0802MB2435.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 20/tzSUFsk5XNlTVrjlcwrZnAIpeC3sVJE2WOIkVtfyIS5hVdNGX4q/RmqFeCAX6p+IAOPzSf3/bbWdMo2GJDDG25wlN6UXGjxBfGpQPGFtlfPmyhHwtWgs49kmuQ085NDbVNYyVPfMwXxkOp/KquNiyaI9IUxaE3Mp0oOGHTlySIRmIf5goHa2cCx7NZaSf0Tkto9TLh3Y1qCZH/vrWuqszlBZ/WNw/RExM4jVdme6r1yM1aBS3JNhIX/6XKJaroeiuRNVuE8Jj51+WGZch67DvA5fd8QAfxpnU30V3YAYgjiMZzLI4gTNxQ73isGLcWDnxq8hpSBQjzwmYOwL6pYZCkjcILK+DRpdx9hefVRHW45TLfAiNWLSbvMXOFxNMW8/DZUbjlBKvAhqq6VwUBuItS9mzSihuZezEWt2C+Wa8JuNr7YBuyAEnTzuliYGiDxHpA2NiATRxFJ/T19M8HJ/HApHPeW3EjhnwSfgf2tW8A9HnpLtrw6kyY8T0jDisA7xbky/XWX+pWZua5uTl9UTbR22duTK/0LpKjnNUA3mwHMM85fbDwYY1tw16gzGQx4/G2ASXU6F2Ybcp+nvtGQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(33430700001)(26005)(6916009)(316002)(86362001)(16526019)(186003)(478600001)(4326008)(44832011)(66476007)(8936002)(8676002)(4744005)(7696005)(52116002)(2906002)(33440700001)(66946007)(6486002)(5660300002)(956004)(2616005)(66556008)(36756003)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 bDw1UcYG82XUAtazmqvnNXKs8HXPT4H+BUOyjIfOkievSj9AVjk/pqrO7CSfLguz0q2UowLIkpjyM4Id3qVPlUoCUrDIvPouhbXY2XgX+cJTTZKafOSbvLmGcovjibwrp/epZ9LTJQkYfc12gPlWeT6lC+mnwDdxeOZ4EA/rRdbNsHFAtYyxHmF6QBl89M2/3OWzK8Oiy1dt1eLvW3L9v80nDJWLcW3Ue9N35f5/83fff0LE76PYPvoHi9aLl9O2UXgawGIaaWhjAMr6qowwrV2x8NpMJ9pRcyJD8jtp5/obe+M8gDCIRkVB9EmgQuZzl59/vdeFyaLFZ860ZzkOgdiB4qEDnbr1MZ401Qp9IUWGXHD+TUbIKtuqSB9ZGkQkQiD7TVQ5tyNe8yZ/2mf1JrFbLJ1mn4GERU3OnYW20IZiZgnX751T5PPORqvw8ef1+B1bZXBtWFEiRjr6wI5bM5AzvkuVzO3iwzW6n6Vd1z7dy5PcDPCS+YKqhdaSJhSc
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2995
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966005)(33430700001)(5660300002)(186003)(82740400003)(2906002)(8936002)(81166007)(316002)(8676002)(86362001)(47076004)(44832011)(356005)(956004)(16526019)(33440700001)(82310400002)(6916009)(7696005)(70206006)(4744005)(36756003)(336012)(4326008)(2616005)(70586007)(26005)(478600001)(6486002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	84fcf27c-adf7-4873-549d-08d7f68cd119
X-Forefront-PRVS: 0401647B7F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vWH9LHTajqnE8XTI9qYE5ftDv6h34kmZQ+l5WG/z3izQLLT8hYnCGOvif0tSFnmTEBJzzJn5naOizKL/EntZK+gZboKMGNZjkGGQARfSFJSso16qDgnOgbImrMznR2XMCvB0CwYwcrD0xfBAUSFBbiO59PnSNGWDDejtIRvHNQe6rLx93hSiQ7Y30iOVfHQmbTNZEC5yEBHmuc+AJJviRoBJ3ADfqIN/3on/62VQeM4L5quxy0EDqp0RQLB/mFsrKgHQYqUR/mgmMc3i4pnvrrp+m6CuCzrs4Tvq/NIxp6Ya+d9AFmSkG2KyHH8WRBSXKmxsNhomBZrvRI7yYldBmfvGfqrriSOWuUHpiNPYckyf3TR8wr3NwfxY0d1SZGFZEwJUklZnN2u9GyNO+8xT/RzD6gkoJPe5sy7WoGI6b27fcUrQSsObTz5Rh+jwYqSLYoDVz+xfICCwhf5j2oCJszxfxLUF/DlADtVDiGgzyYDK+F1vC58jb4Gjp0byOLo1PdjEt+ysOJz7uCBHaBmCPZbEhX6oM8259k0MgxRGrcrhK8fURE4d0R198IIFxL17zmkgwrt4sNDOptYIw3jMhPGlrqlyVrxgjClvNyNeKxMu2ZSvQ504cAbL3/gbR8t1
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 15:55:03.4240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e12d3b-3938-4efa-ab3c-08d7f68cd584
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2435
Content-Type: text/plain

To keep consistency with trusted-firmware-a and optee recipes we should
use softer assignment to "invalid" for COMPATIBLE_MACHINE.

Change-Id: I57d0b220d92c4546e0539f95a54d391935f995fc
Issue-Id: SCM-954
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
index cc68ed3..fcc07a6 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
@@ -6,7 +6,7 @@ SECTION = "kernel"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-COMPATIBLE_MACHINE ?= ""
+COMPATIBLE_MACHINE ?= "invalid"
 
 # KBRANCH is set to n1sdp by default as there is no master branch on the repository
 KBRANCH = "n1sdp"
-- 
2.7.4

