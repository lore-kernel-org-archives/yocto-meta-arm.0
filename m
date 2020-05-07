Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.43])
 by mx.groups.io with SMTP id smtpd.web11.3630.1588849558953879140
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tajwoeTB;
 spf=pass (domain: arm.com, ip: 40.107.7.43, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfZrCUYP137wyhCDxz6x5p4o0daGkV0yv8wsaPSQBEU=;
 b=tajwoeTBiKFFI2aqMAqq2Ze9CTsP1dHfoEuYFoBXLLaTc0BeciW7tmhwoY5ExwkhXCIUhSQMC1g8G24MLN6QoCyljawbPd4B64JefCkTL7exzxKx73UzyJcsEuxP/TAoK1R08zKqVUKso0N67zb8w+eYn69DPHcsUGvT8kaYnw4=
Received: from AM6P195CA0039.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::16)
 by VI1PR08MB4445.eurprd08.prod.outlook.com (2603:10a6:803:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Thu, 7 May
 2020 11:05:55 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::ff) by AM6P195CA0039.outlook.office365.com
 (2603:10a6:209:87::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Thu, 7 May 2020 11:05:54 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:05:53 +0000
Received: ("Tessian outbound 567b75aed2b9:v54"); Thu, 07 May 2020 11:05:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d3e8b01e40e4f228
X-CR-MTA-TID: 64aa7808
Received: from db5d87658c8a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 845CB05B-D5AA-45E9-85DD-76F1D0AD5A05.1;
	Thu, 07 May 2020 11:05:47 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id db5d87658c8a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:05:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2p4BmDuIQzHlg8RlWwkJpgbA/LVdm8sRFJNTQNGdrucaHHizk+zkGkORlFc1UFipX4gA17KX30k7dBAJAwJj130+5xqxbXXEh3GG/5136M+wqIcEkyibOOJ7TGMbkw5LzNN9SeL/PSyEa0/wquPyrn6zaaht6S34Sf57Vo5xwqObd33k+2k4yMOi24ATyYUjAykUbNXIGiSZtOKVJHJ+7FOZoRMrOPiP7pgSBqiArlWomWxALK5u+U0Sl5DJVrM24EENneDgDJruLLQF9K0NY7ggprOpp8h0mKT8sYpQaFEFa5MRoFZSs1v12mUAgt8LB5g7TT7FuI5luoGIli1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfZrCUYP137wyhCDxz6x5p4o0daGkV0yv8wsaPSQBEU=;
 b=bu4HztMT4alUPe6UPZ9UuBa5/Rp5+OB32nWGnizdQwcoowj1ISwBso/vzQ4g5tZjAoJCzsHIHtDqufp4MNatCfpczUnyFDIjl4QWJaWgadOaJSIsMSzIjd2lah331R3hx5Au7lmmbZJxFegCxl3h3E0rEonTGPifhPTJlD9F92SpDD32pRuOZHmliKFEyi3/Ug9+fQk8O7wXOAR220ktSD9nUWX8i6xK9ZNJBwBI8E9+gV6BhFap6HFqddyYTNau921Tf6H8YQoGSkQx4DNaroKTF/iIzuwPkUuU/p+50iYPmKyF1i3c7k8HIOAYFQuUNkf+6gvHPmIxS2IXFl9CpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfZrCUYP137wyhCDxz6x5p4o0daGkV0yv8wsaPSQBEU=;
 b=tajwoeTBiKFFI2aqMAqq2Ze9CTsP1dHfoEuYFoBXLLaTc0BeciW7tmhwoY5ExwkhXCIUhSQMC1g8G24MLN6QoCyljawbPd4B64JefCkTL7exzxKx73UzyJcsEuxP/TAoK1R08zKqVUKso0N67zb8w+eYn69DPHcsUGvT8kaYnw4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3818.eurprd08.prod.outlook.com (2603:10a6:10:7e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 11:05:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:05:43 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] [arm-autonomy] Move meta-arm-bsp machines settings to BBFILES_DYNAMIC
Date: Thu,  7 May 2020 12:03:55 +0100
Message-Id: <20200507110355.38492-1-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0252.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::24) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0252.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:05:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d76ee21e-6351-4d2c-634f-08d7f2769c37
X-MS-TrafficTypeDiagnostic: DB7PR08MB3818:|VI1PR08MB4445:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4445B9519E89AFB373D229299DA50@VI1PR08MB4445.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jpPBu17rOrKfurLzvFkcNE3Z7ToDTBCL/jLK1IXj0T0l2g/PG6Zlxkga+r8PhqnoYFeTlUdkkzt8j80/CiUQTcfhUuff7YRFn5RUASpG8bDYyXKJCmK8YncMiZHCMw+PAdx/mR1DiNP30AFHGJx7VUv4A1CsOmx/fw2ypzDkUwZGZLQ4xI7n4UV89tikBiSSj+5X6qWK+ZkJZ9KrPzlmQQtwqiX+5rPX6YuJ5EGCfS9XaRVEJtyjwmfHO8mtZxh0Iz2QCRD1QjqIkBB7L8CwXMKWXiRLkYpUwsbIjyy/pmbbWgaR0sFXnwfrtAsS7PHpFZp8MEWOIPzYGovzzwF9Y4ei7CLZ96b2I59J8VGcR0z9OJWiqKzngLRGRrYnzJnq7WCpFl482vO7cgrAHbRPLYPBvNwG5Cp1lAi+YKikoskn3jEkuKS1Ld59SS2p/d/Qn9ElKK/xf5i2J96JDP4Yse9FmK4sjbY4HnR0REBlLIkjeAxRP/AR+jEJmvi61r5w2oMFfgyLJp8BL/r6E4PhcQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(33430700001)(30864003)(6666004)(66556008)(956004)(66946007)(52116002)(7696005)(8936002)(478600001)(4326008)(66476007)(8676002)(44832011)(86362001)(6916009)(5660300002)(2906002)(2616005)(316002)(36756003)(83320400001)(83280400001)(83310400001)(6486002)(16526019)(33440700001)(83290400001)(186003)(1076003)(83300400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 mQWKM5tF40Rzzt2ELQd3P5OExkDJAeeZMaLBQrsGuNe11EbXlc9QlpbmmFFi5AyYnv7xpbNP7h/V24dC4xxMP/6Ccb5msbyBT4091dfVU2q0lQRvPGSnLN+ry8g69EGXdYsaMdyFsTHnERx8TQc2FlKZmXCkOxf+2gnvT7tDqGheRbUKNePTKgJdTRXJItGdf7PkgDeUXb6NJfQXk0UanY+C6lAyYirfNx/NvogOVImgFwGdZY85PoPgY9/B4zDTqnxykHtIkhyEBlKTd7ZblnaO4WfAh2MEquaYbouLCE3wDmAR0tB98igd4a6zN6RUTfSGygdosURmVa6jEQDLmJrHXw8l7YFnd4PjrGyVCXsx6+k9/Dp0w80RJlq2u1CS1T4QIJ7JdWPF1/Y9tQ9Y25m/mtYHDl3gWmX//kRxTMhATGkvASonIjy6MpM1Ei+g7+YCWVkdlbYS0G423SWR0uWr+HpVCMAO23temdPcvF3Z4/uCylv+aDo8rWA13bSxzBnWksgW+3++6cSm7+2j/kZKbokmmVqp4eKYIIrxgF+lTj2YjJMKFy08XyVjO+voOCAngSTKRPJ7PmiJk4/yft+MKSol+cuEKJycIsgTzfDoz1U6LjoZZxbZMQtH+2RZlzns/TPRkUK8nLFEvz0+7kfWpVVtyK9ciz8UMpX3wuLCy3XmlEzXauY6X2MP9wCCzmBmKdLsSkiAGvkbv8eliYEVmF8TCbjM8+Kwbx17UpXr6DSNHmDo1IR97aridw9j4z30YbKsO4W6+2btajoZxXhMHxxlikxTEdhZw3lHLh4=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3818
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966005)(33430700001)(2616005)(956004)(2906002)(36756003)(478600001)(82740400003)(1076003)(70206006)(70586007)(30864003)(186003)(86362001)(44832011)(6666004)(33440700001)(6486002)(81166007)(16526019)(336012)(82310400002)(26005)(4326008)(6916009)(7696005)(316002)(36906005)(5660300002)(47076004)(8676002)(356005)(8936002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	769fad72-a4bc-49c9-a424-08d7f276960a
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LGSU4zyV3tU6KCxsINsmneroASaFlyEzioiDaSCSHNEIwFSi4l0tf9OTmiNiETLFAEvZ7nixas0Qc1lOOVc9oziShSi+gUEJF4BP3c9I9ph3TpIMMcHClKnPeybzRgaoATywcdCW55RFNISIBV0yxONZdv4BMbEtZz9UTmfiLaklXsn2y88LZinmJgtwper1HiX/MX2XO92GWZ0TXylsd9snKkfNVNVZzVshEKSl4/gvrt/A7dWnMJJ/3kyQ0w6x9DMNwRx+b3cojS0NXUtqNcPeqPKoR3NhI5pYvbbfJW3jssZ4fKHdwR501aCsyE8nxwScV30yKGbGDOg9BtLZigQyNlBrAaWlRlale4uEE5VK+FHYjbnaJYAm+8uM7VxlcStfVolN5NeSRuo61/eVlYrIgibo9sbkli+C9UiqP3O2n8evo/Guoavvj7I52uETuGJRvHVWbD6XD1/eBG3YMatqRnmEDcc8DpBeyPQz/yTueVyRvj5icRlkF5XXAb2rO7H1p9hU5qyAfI831Vex/kMDp8uH9m+MW38StGoXBmunEVHq4dUNgE2+DEVASIJZ1KQdtljB93Q1B8jy4ySlNA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:05:53.6323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d76ee21e-6351-4d2c-634f-08d7f2769c37
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4445
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

All meta-arm-bsp machines specific settings should live at
meta-arm-autonomy/dynamic-layers/meta-arm-bsp/ and only be included if
meta-arm-bsp layer is present.

Change-Id: Ice8a301db85b5186384d602d9e3bedb909183320
Issue-Id: SCM-984
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../xen-devicetree/files/xen-juno.dtsi        |  0
 .../xen-devicetree/xen-devicetree.bbappend    |  0
 ...e-number-of-interrupt-lines-for-dom0.patch |  0
 .../recipes-extended/xen/files/fvp/defconfig  |  0
 .../recipes-extended/xen/files/juno/defconfig |  0
 .../recipes-extended/xen/xen_%.bbappend       | 27 +++++++++++++++++
 .../xenguest/xenguest-manager.bbappend        |  0
 .../xenguest/xenguest-network-bridge.bbappend |  0
 .../arm-autonomy/disable-arm64-sve.cfg        |  0
 .../arm-autonomy/disable-arm64-sve.scc        |  0
 .../recipes-kernel/linux/linux-%.bbappend     | 17 +++++++++++
 .../recipes-extended/xen/xen_%.bbappend       | 29 -------------------
 .../linux/linux-arm-autonomy.inc              | 13 +--------
 13 files changed, 45 insertions(+), 41 deletions(-)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen-devicetree/files/xen-juno.dtsi (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen-devicetree/xen-devicetree.bbappend (100%)
 rename meta-arm-autonomy/{recipes-extended/xen/files/4.12 => dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0}/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen/files/fvp/defconfig (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xen/files/juno/defconfig (100%)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xenguest/xenguest-manager.bbappend (100%)
 rename meta-arm-autonomy/{ => dynamic-layers/meta-arm-bsp}/recipes-extended/xenguest/xenguest-network-bridge.bbappend (100%)
 rename meta-arm-autonomy/{recipes-kernel/linux/arm-autonomy-kmeta => dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra}/features/arm-autonomy/disable-arm64-sve.cfg (100%)
 rename meta-arm-autonomy/{recipes-kernel/linux/arm-autonomy-kmeta => dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra}/features/arm-autonomy/disable-arm64-sve.scc (100%)
 create mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend

diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-juno.dtsi
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.dtsi
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/files/xen-juno.dtsi
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen-devicetree/xen-devicetree.bbappend
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/4.12/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/files/4.12/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/files/fvp/defconfig
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/fvp/defconfig
diff --git a/meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xen/files/juno/defconfig
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/files/juno/defconfig
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
new file mode 100644
index 0000000..bac391c
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen/xen_%.bbappend
@@ -0,0 +1,27 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+# Machine specific settings
+XEN_CONFIG_EARLY_PRINTK_juno = "juno"
+XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
+XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
+XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
+
+# Foundation-armv8 support
+COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
+
+SRC_URI_append_foundation-armv8 = " file://fvp/defconfig"
+
+# FVP Base support
+COMPATIBLE_MACHINE_fvp-base = "fvp-base"
+
+SRC_URI_append_fvp-base = " file://fvp/defconfig"
+
+# Juno support
+COMPATIBLE_MACHINE_juno = "juno"
+
+SRC_URI_append_juno = " file://juno/defconfig"
+
+# Gem5 support
+# Fix problem with number of interrupts on gem5
+SRC_URI_append_gem5-arm64 = " file://4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
+
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-manager.bbappend
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
similarity index 100%
rename from meta-arm-autonomy/recipes-extended/xenguest/xenguest-network-bridge.bbappend
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappend
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.cfg b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
similarity index 100%
rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.cfg
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.cfg
diff --git a/meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.scc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
similarity index 100%
rename from meta-arm-autonomy/recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/disable-arm64-sve.scc
rename to meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/arm-autonomy-kmeta-extra/features/arm-autonomy/disable-arm64-sve.scc
diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
new file mode 100644
index 0000000..189645a
--- /dev/null
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux/linux-%.bbappend
@@ -0,0 +1,17 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}:"
+
+#
+# arm-autonomy kmeta extra
+#
+SRC_URI_append = " file://arm-autonomy-kmeta-extra;type=kmeta;name=arm-autonomy-kmeta-extra;destsuffix=arm-autonomy-kmeta-extra"
+
+# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
+# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
+# register.
+LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURES', \
+                                         'arm-autonomy-host arm-autonomy-guest', \
+                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
+
+KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
+KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
+KERNEL_FEATURES_append_foundation-armv8 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
index fb5962a..92348e6 100644
--- a/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
+++ b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
@@ -1,37 +1,8 @@
-# xen settings
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
 #
 # Define early console based on board parameters
 #
 
 XEN_CONFIG_EARLY_PRINTK ??= "disable"
 
-# Machine specific settings
-XEN_CONFIG_EARLY_PRINTK_juno = "juno"
-XEN_CONFIG_EARLY_PRINTK_gem5-arm64 = "vexpress"
-XEN_CONFIG_EARLY_PRINTK_fvp-base = "fastmodel"
-XEN_CONFIG_EARLY_PRINTK_foundation-armv8 = "fastmodel"
-
 EXTRA_OEMAKE += "${@bb.utils.contains('XEN_CONFIG_EARLY_PRINTK', 'disable', \
     '', ' CONFIG_DEBUG=y CONFIG_EARLY_PRINTK=${XEN_CONFIG_EARLY_PRINTK}',d)}"
-
-# Foundation-armv8 support
-COMPATIBLE_MACHINE_foundation-armv8 = "foundation-armv8"
-
-SRC_URI_append_foundation-armv8 = " file://fvp/defconfig"
-
-# FVP Base support
-COMPATIBLE_MACHINE_fvp-base = "fvp-base"
-
-SRC_URI_append_fvp-base = " file://fvp/defconfig"
-
-# Juno support
-COMPATIBLE_MACHINE_juno = "juno"
-
-SRC_URI_append_juno = " file://juno/defconfig"
-
-# Gem5 support
-# Fix problem with number of interrupts on gem5
-SRC_URI_append_gem5-arm64 = " file://${XEN_REL}/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch"
diff --git a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
index bb48950..2763444 100644
--- a/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
+++ b/meta-arm-autonomy/recipes-kernel/linux/linux-arm-autonomy.inc
@@ -1,23 +1,12 @@
 # Add arm-autonomy specific features to the kernel
 
-FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
+FILESEXTRAPATHS_prepend := "${THISDIR}:"
 
 #
 # arm-autonomy kmeta
 #
 SRC_URI_append = " file://arm-autonomy-kmeta;type=kmeta;name=arm-autonomy-kmeta;destsuffix=arm-autonomy-kmeta"
 
-# We need to turn off SVE support in the Linux kernel otherwise Xen is stopping
-# Linux kernel with a coredump while trying to access XEN bit of CPACR1 core
-# register.
-LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE = "${@bb.utils.contains_any('DISTRO_FEATURES', \
-                                         'arm-autonomy-host arm-autonomy-guest', \
-                                         ' features/arm-autonomy/disable-arm64-sve.scc','',d)}"
-
-KERNEL_FEATURES_append_gem5-arm64 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
-KERNEL_FEATURES_append_fvp-base = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
-KERNEL_FEATURES_append_foundation-armv8 = "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE}"
-
 
 # Add xen host drivers to kernel if arm-autonomy-host is activated
 KERNEL_FEATURES += "${@bb.utils.contains('DISTRO_FEATURES', \
-- 
2.17.1

