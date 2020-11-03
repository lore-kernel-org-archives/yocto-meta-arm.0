Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web08.4510.1604412786588146240
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 06:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=j2qJgbrv;
 spf=pass (domain: arm.com, ip: 40.107.6.56, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc2I4PHyu1BiaYB9KmalPuNRWW0GWvZk3Xobf3R2O94=;
 b=j2qJgbrvzdjnuHRdR7v35BpWNjZlLRDAspygFr4zGpvSJYjldI26OZs5i9h0Ah3UYujxFKnzTKotiapIBMCQRgE2jiPD6s9l33I5Tt/8SOfERLWnpBXUOS18i2IHfrR3uobukYwRsVMvVVP1bXecoe60LJi/KlmagRYZCGj+iHY=
Received: from AM6PR10CA0083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::24)
 by VI1PR0802MB2413.eurprd08.prod.outlook.com (2603:10a6:800:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 3 Nov
 2020 14:13:04 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8c:cafe::46) by AM6PR10CA0083.outlook.office365.com
 (2603:10a6:209:8c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 14:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 14:13:03 +0000
Received: ("Tessian outbound d5e343850048:v64"); Tue, 03 Nov 2020 14:13:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1a8b7e4f00da3dc
X-CR-MTA-TID: 64aa7808
Received: from ca3ee03d0df1.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80C648E8-8C41-4F77-BFE2-B93546B6BE8E.1;
	Tue, 03 Nov 2020 14:12:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca3ee03d0df1.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 03 Nov 2020 14:12:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX0AeuTAUSdxyxb2WwiPQDN8Xk8v13IjrGRvnbGcw0hcw0gdfM5+2xJDs/f4rJ4aWxXTW83ynDCgrdxDAZES0duDDUtQtN80umP4tKd8QvUOaQ5mFiRnfnmN0XLvJE+D1Be9uQIB7Zjx56cmCtHbuoInU3dLYMqH5ccgDbzcTgWO7Cmyw8+4JHGIZcvcLMyOK3Dl2yudvkap3pJYrKtRqP1YsnZvoTPOvb0BtKdFeDN1T7ruVDDMtidxNKhc2sTw6+8VSBrZu/m9/2CoaarNqN+Gush1REA/irljo/7+VDvX5eaHcbBJrWdW21SAoPHCyk0zg2F9L2d0bUd/05vLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc2I4PHyu1BiaYB9KmalPuNRWW0GWvZk3Xobf3R2O94=;
 b=VddTwp/vDIs9/XvykGk+iufWmNbUlD00Dlw1lsV2SWs3TjMld5oNhXMenQv52IlRKipryHyw6WXnWOg4+8yIFqBVygNXqHxuuj6aoTNA37AopDZ8cBPicHIR7pBZrpUDxq5mD77Y+hE5pFa1PAg4J0F6c23pUIeghFaGRuA9ER26Tump9f9zXIVlrD627CNqZtJL7MwgtiynW5LVaEuzWx4RPe10JQ11WwFyvSKDKQOWpFGiJ9Q8UO6UW9D4n7RNfUi3ug6T+8+ErfuCU8VUil/PbrmgrGYUfpsymBhIkYBfz9i875qJ0qafe+gzneKNZ9hnQb8d6G+3ZbouAmnQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fc2I4PHyu1BiaYB9KmalPuNRWW0GWvZk3Xobf3R2O94=;
 b=j2qJgbrvzdjnuHRdR7v35BpWNjZlLRDAspygFr4zGpvSJYjldI26OZs5i9h0Ah3UYujxFKnzTKotiapIBMCQRgE2jiPD6s9l33I5Tt/8SOfERLWnpBXUOS18i2IHfrR3uobukYwRsVMvVVP1bXecoe60LJi/KlmagRYZCGj+iHY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2997.eurprd08.prod.outlook.com (2603:10a6:209:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 14:12:24 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::e5c6:faac:7d9b:fcf%6]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 14:12:24 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 3/4] arm-bsp/kernel: Introduce linux-linaro-arm-rt recipe
Date: Tue,  3 Nov 2020 14:11:43 +0000
Message-Id: <a88ede5a1df3c3ccc47fee764131ac7a019b8321.1604412597.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <0624b1d5cb32b094405595f69ec1bacee09c7e4e.1604412597.git.diego.sueiro@arm.com>
References: <0624b1d5cb32b094405595f69ec1bacee09c7e4e.1604412597.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.51]
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Tue, 3 Nov 2020 14:12:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 114acc5e-f6e5-49ba-cff7-08d88002945a
X-MS-TrafficTypeDiagnostic: AM6PR08MB2997:|VI1PR0802MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2413CC05ED87E6492BBD12B592110@VI1PR0802MB2413.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dhF522e+QAt0CG4cAcY2/vKKLh5E5vrOZzJpIKri8nmuig6+IuodAqN2U2xaXvV1QDLXgrZHNHMJMSdpQs4zP06ZChjYt8yT00UtuL/pm7YjbQf8G+kNuq/oqvf3VWDgT/yku/1CCCeUHuijdMtknJAEa0VF1pLGoL6dLr5SbuLwLoK6gr6NS1kKy7J7UOBs8+xGQoOUFKNG5/v1NFtRLCMu7TY+TjzZ86OBqQWmuQ+B6NeBxRpnanFJDwwIkCvCVGBEJ7T2H7A2j6qralEq6mLVYGAOhhauPMrkPzJx21ASRyOh7/t29RdKbd4O5aW8lVyLawG4JRRX9pIMy9CFyNIjI9ocyiB8Rnr/P5LlQyrDfAkVPFuXADWAPLoNEXwb3X+dBMQIrYdYCBfsUXLumA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39830400003)(66946007)(66556008)(186003)(26005)(16526019)(66476007)(2616005)(36756003)(5660300002)(44832011)(316002)(86362001)(7696005)(6916009)(6486002)(52116002)(4326008)(956004)(8676002)(8936002)(2906002)(478600001)(6666004)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 JBvd9NI2wQspNLZkJ2Aq+jAsE3vsrJ+9Ho/z7ml4KJv5v/TlLVGjDJW8XU/Dv61K0nLrSH3OIoWgZ8OaEIzVcgNlR97qo7g5a+598+tyG92b3NK0knCqWeTc0S0JO4h2emJGBFB1rf9xNXqWawD1vlEOgOtQU0YtQnFTyBUVNbxh+OmSDQjoW5xzZ6EiSDwFusZv5M4Wm4MJI454Diu1j7neVdPbXGdhZeE566z4gARV3JY33CHpKh6sMwEu2HGqSggdqMEKhbaqE3puGXJIqxS/FCMBfPTiELl+wrsMkgMsFLdSd1m0Lhfae/w7v0tJmi08DWda9MBAxoUV3zyVpH0wl4Ak/T8TLX8XrkgypO5snptUtBN0ijYdY2txkzTOhedZK10uyqauBF4KORZXAnYR+HlvS7OcBl8fB/CFL6+Ec8KavvJZsKpNmoBhmsDGrUb6YuMIhrywqVbCZT3A3DcIXABU9kzautDtPKmrNiz6sTa6OdGVyNXj69b6UUdlKhJvYzy1rHhOWoGtTLp1t+2z7Isvrz9aXNTnxFQce8+nhS3bxPRPFzmD5SSlBU3FAfoI/ADqZsW7BrOeH4SOgiBXlSjYz1e3uwtQrzwRSNgdkrYprVFnkJdkN8h89bJ1/PCDJWk+qQT5zIKCozhCDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2997
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	92d9e889-4dfe-4434-d66a-08d880027cbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6OJoqw9pTa+4nJEVllLosmC9lyLexS+TaXn1YYmipwgHbZe9Rb1J5qnFQrfSl0RvsexAX6KQi8cKMaBeWMiyF9K+6fVdJNBLmgOfmCE0IzR++lCpBTXrcjUxGCjc6PIbx8vVlWw3xOgnQ19Ug1+EwWQIy6PqQFCPAFFip9gyPGPerO3zC9v8QshM5fr4HYRQOQuBdWNRXNumsbvwnoA+d41KA7XOeFdEgLqx2EosGKLlmjl2Rr+oWSCqNCVZHcXritlAtvHx4aZ4i92GI82yw+3G9ClSxwVZYk74zq3M/QjzV37OHDqUWpjnK/vv0QRuq2gUs/CM0ih69Ui5a3CsF3Uc9QRQCafn+no7ushRKTmCJsGa662wtHDMlMkpyTU7OiDgU2jikNZU0PY9/ZrfbU63/HzqO2t9hof3hmz83Gp1m/m+VOi4P4F0u9K665asG53AZr25WfdlM2kMsMisjM3UQodUpBy8KWexAxzVRbs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(46966005)(7696005)(4326008)(316002)(6916009)(966005)(26005)(5660300002)(6666004)(478600001)(36906005)(956004)(82310400003)(2616005)(81166007)(86362001)(6486002)(16526019)(70206006)(70586007)(8676002)(2906002)(36756003)(186003)(336012)(44832011)(82740400003)(356005)(8936002)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 14:13:03.9644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 114acc5e-f6e5-49ba-cff7-08d88002945a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2413
Content-Type: text/plain

The linux-linaro-arm-rt recipe provides the kernel with PREEMPT_RT patches and
is based on linux-linaro-arm_5.4.bb. Set PREFERRED_PROVIDER_virtual/kernel to
linux-linaro-arm-rt to enable it as the default kernel.

Change-Id: I8c3e59c476ff3f8e434841f8f0aa11eaa6c799bd
Issue-Id: SCM-1653
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb
new file mode 100644
index 0000000..4ee46be
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm-rt_5.4.bb
@@ -0,0 +1,12 @@
+# This recipe provides the kernel with PREEMPT_RT patches and is based on
+# linux-linaro-arm_5.4.bb. Set PREFERRED_PROVIDER_virtual/kernel to
+# linux-linaro-arm-rt to enable it as the default kernel.
+require linux-linaro-arm_5.4.bb
+
+#
+# Include preempt-rt patches
+#
+SRC_URI_append = " https://cdn.kernel.org/pub/linux/kernel/projects/rt/5.4/older/patch-5.4.3-rt1.patch.gz;name=rt-patch"
+SRC_URI[rt-patch.sha256sum] = "6b92ba32c7ce30919c9b66e49e5f1dce58e1f8bd92fef91e548d6f2d434a2b39"
+
+LINUX_KERNEL_TYPE = "preempt-rt"
-- 
2.7.4

