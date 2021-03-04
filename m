Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.81])
 by mx.groups.io with SMTP id smtpd.web08.4670.1614853482272016312
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 02:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZJQGrWKO;
 spf=pass (domain: arm.com, ip: 40.107.0.81, mailfrom: anders.dellien@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuVZtd2AMC9t1KFD/lvBX627ool5NUfNmcqAxgATO5Y=;
 b=ZJQGrWKOzxmId6aJ1RdK+CkLgE/zW7s+hCwkZilZWmgeoqZwU0GA4Zgd2b7x7QXbdcn12ySK+HtGmkIVKAANkWUyKYpCXvmXav3KPoWoGUDYYclGpSSSwAyb4m82r9PZNkITTNVuE+YheMvPHw6hWEVdFisYLg0lURnZ3e+kqQk=
Received: from AM5PR0601CA0039.eurprd06.prod.outlook.com
 (2603:10a6:203:68::25) by AM0PR08MB4243.eurprd08.prod.outlook.com
 (2603:10a6:208:138::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 4 Mar
 2021 10:24:39 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::27) by AM5PR0601CA0039.outlook.office365.com
 (2603:10a6:203:68::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 4 Mar 2021 10:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 10:24:38 +0000
Received: ("Tessian outbound 338de582a688:v71"); Thu, 04 Mar 2021 10:24:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b26a479539b8e2a6
X-CR-MTA-TID: 64aa7808
Received: from a4ce3d037760.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6E947739-9F3A-4CBA-9A87-BD35CA3FAB54.1;
	Thu, 04 Mar 2021 10:19:41 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4ce3d037760.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 04 Mar 2021 10:19:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wcw4aWe1nj87rVlI8wlbQJOs2XjEKzoMGDYv8ydBosjOyMAj9jTzmgoPV4p39MAoBi80Y9mGFtgqHbYUjbTIxHPoI26W1OEXPhPQ9yKndG/968qEOZT3+Rrfm6U0LLZ1f6b86monaKYJxfyeIrVUKDr2Xb5O6LNfBlQkrmCnF/tkbHGxXyXFtBj3QBw9QapZQgelkDC6xqOQD/fFf+qX3K22wEuGXRcqw/IDvlsdtbizfEydpDTUTB+XiLP7JVbRDYRN7IjolI9GCVdSovriHxq+1BuyBgjgm3Z2P6uLoLBd8pr1CZUmDprolkh/Yy5ia34Kf4NTNEruVp/a6m5vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuVZtd2AMC9t1KFD/lvBX627ool5NUfNmcqAxgATO5Y=;
 b=ddppY4dnL7RINxWTXNkkIoVY0QsK/Ir8rx+Uolf+NHzF9I+Vcj/uT2quP98r2/QoIvNDD7JHM6hM2gkLO5GaMyEEJr/maSbUGcdgMfKrzRLEH5s8pBA0SQwkQlbwrj8cg90P81++IXLwDFCLJupbv3grsuGJdBioIynze7d6Rma8nJKlWPi267cjYpiVEu4wPmjfR6PJH1MweQ46SHaTQmZtwsHwEMyfTHQjpnHxSYWuJ9wtSGpUleA7pX5P5r1DY4xhoEduivZ8iW3170lGjlt9lkSs0BBKD4Ag0b9qvcRGOfgWsUKUsLCk8xtNZ2Jm6qqqUpiW7tVbd0kt7fBqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuVZtd2AMC9t1KFD/lvBX627ool5NUfNmcqAxgATO5Y=;
 b=ZJQGrWKOzxmId6aJ1RdK+CkLgE/zW7s+hCwkZilZWmgeoqZwU0GA4Zgd2b7x7QXbdcn12ySK+HtGmkIVKAANkWUyKYpCXvmXav3KPoWoGUDYYclGpSSSwAyb4m82r9PZNkITTNVuE+YheMvPHw6hWEVdFisYLg0lURnZ3e+kqQk=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com (2603:10a6:803:139::23)
 by VI1PR08MB5518.eurprd08.prod.outlook.com (2603:10a6:803:13a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 10:19:39 +0000
Received: from VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::b1f5:8793:c6e8:c4e1]) by VI1PR08MB5517.eurprd08.prod.outlook.com
 ([fe80::b1f5:8793:c6e8:c4e1%6]) with mapi id 15.20.3890.030; Thu, 4 Mar 2021
 10:19:38 +0000
From: "Anders Dellien" <anders.dellien@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH] arm-bsp/fvp-base*: Fix the MPIDR values in the device tree
Date: Thu,  4 Mar 2021 10:19:22 +0000
Message-Id: <20210304101922.4929-1-anders.dellien@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.52]
X-ClientProxiedBy: LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::28) To VI1PR08MB5517.eurprd08.prod.outlook.com
 (2603:10a6:803:139::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123962.cambridge.arm.com (217.140.106.52) by LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a3::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.25 via Frontend Transport; Thu, 4 Mar 2021 10:19:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bd4e568b-e727-4ff6-b47d-08d8def7b75d
X-MS-TrafficTypeDiagnostic: VI1PR08MB5518:|AM0PR08MB4243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB4243DF949BE1323D7A7C810189979@AM0PR08MB4243.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:283;OLM:283;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dp9f9mBCYzohb9VP0WZRe/qH2I7tb4GtCJllxWnFTMBTmzRRrMU05HnzgTqqbTt69kPL0Q5dRfdx5YJu41mNNM0+M/+LG3Fx+g6kAKnRv3Dr5BD11DQwIPb3N0R5v7u0zne9NMl/htERHy9Kx/l2uasATVHrQmcYUbtNGdNzfAqYf2BMlth/Cl7+9xaGCZxoua4aX1QPgeiyBY6ugzo2BIUQ00z9c5FyjW3fVsbqoD7f7yRdP2xxUzteziiNeAICGbQfOs/8hF8QkLFDkd6Tnd4rBMxXaUfAsaDisEktnPuADXY7V0A2oGxXpNwmk6WyhZ/W7cfYofNHegPD3Tak7vjvoUbLQRYBWZV8msHQbmLxCwVilgIqmepAzP0yXKWEPDjFMZhFz0OER1FiyC0PsBssxV59Jox+2usQ2tqYaxc2piHoM2Ek+jZCyZxfjiNa3gxYSZvRYV45MEZepibdBjqWhKl00IlGlfqIGtNvtwuJ8Xs4VNVXruWJ8219bFCha7HnJsi1Av954LasPYkxXg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5517.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(86362001)(66476007)(83380400001)(66556008)(6666004)(478600001)(36756003)(44832011)(1076003)(66946007)(2616005)(6916009)(4326008)(6486002)(2906002)(316002)(16526019)(26005)(8936002)(52116002)(7696005)(5660300002)(186003)(956004)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?HYVeZ5oB1cLD/YVR22vBcvXxoKXJ3iG0Lfq9wUfWHRFJr9BENYD8fsQea9nb?=
 =?us-ascii?Q?tg+kdDrtuzdPBzXWku7FGiPaf/VVi6qqJ/yhoBeUs9bSk2uaVBPM1de8J+J/?=
 =?us-ascii?Q?pvGsUeGHvYZxMBaYXFBxeb9p74xFR0d1e8M+rcvdw49ofG/AauPraQstwP8e?=
 =?us-ascii?Q?uRhqgRVM9AzdS+L+9+XWXvBCbWjBaFWTaq7hnxQMczYcJdlEZA0kcq4qT+OM?=
 =?us-ascii?Q?qqGIerFcIztvPecnM/FtJnNzUCtreo4/c/e8lMQsdPhpcpf26YRV8tNZLxly?=
 =?us-ascii?Q?mDFAEZoup+GirBgWH+xxivVOvbv0qs2i0FbdRI39k7LpG1Z/66sTNbS+tJio?=
 =?us-ascii?Q?0h/gEpgZaty9juJupjnrvNzhIOBss6KcBJmoTSyklUlSTND//+5yyvy8Q6O6?=
 =?us-ascii?Q?zoyv9aKn9n74+QMyiYeUWlMHC1vkHdaBn062BmrHc7SRBMuJn9AjTlWt8wau?=
 =?us-ascii?Q?3mXBqXPpqm3/IUWi0VvAAQSa78dhrvP1h7nj/KKLvf0rFCIvaXwqGZGIgLQD?=
 =?us-ascii?Q?K2IvGXML/FZAHB0hx0+LH6JfP4DFnxZINtRo4amoMzQ4i4oOyJOu9VKkhVOO?=
 =?us-ascii?Q?dOoa0Wdq0IKhSIp+7ceX7k4Q/X1Vpbg9WW/0SYJNyGf+bSnkalDDDOX+6a6f?=
 =?us-ascii?Q?Tk0WcEPY1xkj89mJp4KAPO1RXbOErJgwDoCDc9fAaFt75L7HmV6L1VY09Wxt?=
 =?us-ascii?Q?pku+xSFL4DbCdUV9sudMYXXdjfd8cef8DkGl4boShMGGJ7GN0kVlGflghpwU?=
 =?us-ascii?Q?CCGFeWjlD2IHBrkBajvUI6QzjpdRwOP9zEcy4J+OKvNbAAnNybkSmMnHM5HO?=
 =?us-ascii?Q?erFutXyB3CVSfiA7Y9fft5GH01dFNnq96akHavUa+zJZUfGZ/3IMWpBu+toA?=
 =?us-ascii?Q?zXhL9+KgKK41/KGVYsPcFoaXNkzeUDsW83HNoNAqbJJbTpD5lebQJiuO3ruv?=
 =?us-ascii?Q?9xztuzdBVIQxO0ZYxJCQr4UqHQdx1G9mgQ++gbatJtC/+4+w1ZJyvYeHfqRw?=
 =?us-ascii?Q?pMz9/DaepxXkSSMjZu6eSAjj08nb7045m34/A95F39Go7JbBjaQDEutD2JCC?=
 =?us-ascii?Q?zIKLVFMIPIKBq2cttueu6eQpz4k4lAUnoO6pEEwJu/LOoNCK46+WrL8i72wI?=
 =?us-ascii?Q?UEn87jBeytKdNZ6LJM43et+/FisW4Lk94oq4lfZuNRdjeGnYuB0/sxlA4Yh8?=
 =?us-ascii?Q?dN4xtYjEVVkCGTB09p1VphytkV/26GcTq3SmoqpPYpkXcBT+COt/Q4gsnolX?=
 =?us-ascii?Q?Zv+kAZr/LJbkcU9SYGVGcU9SX+tJ4YGEosCFXWvMaa+r+vPLxxwybN+7c16U?=
 =?us-ascii?Q?nTaRD0Qo92HlzQFlTnqORFA4?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5518
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anders.Dellien@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f2e7b9e7-8f1d-42d5-2b05-08d8def70425
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+WUMsXG8EptewF/ayaFY3izOP+lp9lu0f4m3NefGJpvK1xYqj+CzWqgiBkPZMRwzA9RPVSVsoTTRkyOBUpZ+Y/A8I0J2cu1TTa7VwXRro/a9Y5Sh2b1QPoIgjDdxGbzy0UpnEYhGwWO69mflczrkVHHQ6fPFzyKYWHCtidB3EXry/tfovq8OgihfgCOL69rTKJ644awXPYu7aC4G9G5w2gNCPven6XiGjNpKRWZ0VMl1T7yVClnhLY20qMrtfwmx1wKYiQzaiHGhnZpqR3pqd4p5C1z2+pDirTpo4s3jqod5wNWhIR5LWEJqEVkx3dHQq7FbdEDZwX3xW2koJkultxT90iToHjnV8UQKjJgeS7qq4IMZi1F2Zz83emmhljcst1tD9Tt6Kt5sz08sv7x/JhyH8NY3Bn5yXqMz54kSq3eKNrlHez0ufuke95H3f3nvxKDbb7vpiTynAfLMNMNw/K5m4lAUQWoO9dxzIHGhYQk7X3anLLCHyX7tURtNQ2dc+sCyFzVOuSp1Cu6crdnDkhEXkWrHhCsDMprAbsVRf5YQZQPoGAVPUkCTmSx9EIPDl05XSiJum4n5afksaq2TxDxjxkpMMhbFdcv3dRAwY6AWEGoC1mKNRsFpKjEamUE0YIaABFDjb5MGHu4Td8YG6Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(36840700001)(6916009)(86362001)(956004)(36860700001)(26005)(44832011)(478600001)(16526019)(316002)(186003)(70206006)(2906002)(2616005)(81166007)(7696005)(47076005)(6486002)(70586007)(336012)(83380400001)(5660300002)(8936002)(36756003)(8676002)(1076003)(4326008)(82740400003)(82310400003)(356005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 10:24:38.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4e568b-e727-4ff6-b47d-08d8def7b75d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4243
Content-Type: text/plain

The MPIDR values are incorrect, which means that only two CPUs start.
With this patch, all 8 CPUs start.

Change-Id: I4baa8738948ec756d6902bc75d0a56edf15e23f8
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../fvp-base-arm32/fvp-base-arm32-dts.patch   | 28 +++++++++----------
 .../linux/files/fvp-base-dts.patch            | 28 +++++++++----------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
index de7b752..b21b4c0 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/fvp-base-arm32-dts.patch
@@ -112,64 +112,64 @@ index 000000000000..f4601c7f99f8
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU1:cpu@1 {
++               CPU1:cpu@100 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x1>;
++                       reg = <0x0 0x100>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU2:cpu@2 {
++               CPU2:cpu@200 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x2>;
++                       reg = <0x0 0x200>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU3:cpu@3 {
++               CPU3:cpu@300 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x3>;
++                       reg = <0x0 0x300>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU4:cpu@100 {
++               CPU4:cpu@10000 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x100>;
++                       reg = <0x0 0x10000>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU5:cpu@101 {
++               CPU5:cpu@10100 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x101>;
++                       reg = <0x0 0x10100>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU6:cpu@102 {
++               CPU6:cpu@10200 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x102>;
++                       reg = <0x0 0x10200>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU7:cpu@103 {
++               CPU7:cpu@10300 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x103>;
++                       reg = <0x0 0x10300>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
index 47bc8e1..fcd8f70 100644
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-dts.patch
@@ -110,64 +110,64 @@ index 000000000000..f4601c7f99f8
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU1:cpu@1 {
++               CPU1:cpu@100 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x1>;
++                       reg = <0x0 0x100>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU2:cpu@2 {
++               CPU2:cpu@200 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x2>;
++                       reg = <0x0 0x200>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU3:cpu@3 {
++               CPU3:cpu@300 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x3>;
++                       reg = <0x0 0x300>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU4:cpu@100 {
++               CPU4:cpu@10000 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x100>;
++                       reg = <0x0 0x10000>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU5:cpu@101 {
++               CPU5:cpu@10100 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x101>;
++                       reg = <0x0 0x10100>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU6:cpu@102 {
++               CPU6:cpu@10200 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x102>;
++                       reg = <0x0 0x10200>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
 +               };
 +
-+               CPU7:cpu@103 {
++               CPU7:cpu@10300 {
 +                       device_type = "cpu";
 +                       compatible = "arm,armv8";
-+                       reg = <0x0 0x103>;
++                       reg = <0x0 0x10300>;
 +                       enable-method = "psci";
 +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 +                       next-level-cache = <&L2_0>;
-- 
2.17.1

