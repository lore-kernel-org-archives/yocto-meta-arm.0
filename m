Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web12.10007.1628699675280890726
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 09:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6vqK6yH/;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVL4gHJlYyA6d8ogtMAPrzJ8son8UR3mVF4zk1jYqjo=;
 b=6vqK6yH/ELsEveFk5ayTa4toW53Gk/n0XqajcK0gWCGyr7iPmMhenkt7B/ILH2wS4BNmqbkywfSJ9eMgjVZJL8um3Y5VVWrvCJ/aZ8GCNrXLklPPSBEvo+JUaWoPRVZwOIBGo2RExxcGuWj+uYGG5//BuzCaJxF+qPSMd7A15w0=
Received: from DB6PR07CA0078.eurprd07.prod.outlook.com (2603:10a6:6:2b::16) by
 VE1PR08MB5055.eurprd08.prod.outlook.com (2603:10a6:803:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 16:34:32 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::d6) by DB6PR07CA0078.outlook.office365.com
 (2603:10a6:6:2b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.8 via Frontend
 Transport; Wed, 11 Aug 2021 16:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 16:34:32 +0000
Received: ("Tessian outbound 19a632698c93:v103"); Wed, 11 Aug 2021 16:34:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d2638717e0207aa
X-CR-MTA-TID: 64aa7808
Received: from 39f3c6f9ca30.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C6DA2A76-28E7-4BF6-B306-7ACB6836B689.1;
	Wed, 11 Aug 2021 16:34:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 39f3c6f9ca30.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 11 Aug 2021 16:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIwbpqS/GpZ/LRf5jzAwoR2lhrN7362CR+Qvlcc4jbQVJU5zpsB+Ukc4Gz59HnQURCaexQKtsu5cAaMseJgZyjZ/qTZWjrNKiZUoJUiIPUEDO9LrVOp74Hsiv6DXaRmydivnoL5W0t+NOXTHxYQaNMj4o6MLm2KCefvAyOBh7Iwvm0ExwrlEwZoUo9YNCehnk3TO3YKxkYoJ34qDxMk8P3pb0nwWYTR3GXl+1f0lJTwyUJUOUCpE8QGrYGFrh7XpLr9QExULUhvHx3ofln2ymLYj3Xc4h5dBLVX4u+nNbn+jYQR6IplztaeE0eI7EVom642/wMFOEb9Q+0DThgXE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVL4gHJlYyA6d8ogtMAPrzJ8son8UR3mVF4zk1jYqjo=;
 b=Cwt8jpKI+Kf4Qn5WJxq5IfC62mcxAnrVkuemjceMZDiJa6ZFGn33G6F9E8jLGjA2enVRZ3/2xyS86kxztLcRfebTugQ7y0H61RrD0m/st2/4inLYHhsz7n9kap/BCRAidLhbVDFv2S0ecpErTRex2KwvWUZHDEw2wd4xw2WezeCtKjfc0FcMT+cFyr2B8qEjwNywZjQTe0RoxSSv+evIiRUM3I7zowQW8ywovKeEEkvaCUijBATspHP51cSIqcTRiw3CDHEnED7M4sqS5yN9Zx1OliysSTy7w3jw3SjtrTGtE+JNJB7DbpHTMoj/Cu323l/7/FBWrjKVS+b4ZYJseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVL4gHJlYyA6d8ogtMAPrzJ8son8UR3mVF4zk1jYqjo=;
 b=6vqK6yH/ELsEveFk5ayTa4toW53Gk/n0XqajcK0gWCGyr7iPmMhenkt7B/ILH2wS4BNmqbkywfSJ9eMgjVZJL8um3Y5VVWrvCJ/aZ8GCNrXLklPPSBEvo+JUaWoPRVZwOIBGo2RExxcGuWj+uYGG5//BuzCaJxF+qPSMd7A15w0=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6885.eurprd08.prod.outlook.com (2603:10a6:20b:394::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 16:34:25 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433%4]) with mapi id 15.20.4394.017; Wed, 11 Aug 2021
 16:34:25 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 2/2] arm-autonomy/arm64-autonomy-guest: Add tar.bz2 by appending to IMAGE_FSTYPES
Date: Wed, 11 Aug 2021 17:34:11 +0100
Message-Id: <3330da779421d56db0caac5882bc77e9cb9f6827.1628699576.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f860b4f7cf2d5518dab05c4e0773d9057f216753.1628699576.git.diego.sueiro@arm.com>
References: <f860b4f7cf2d5518dab05c4e0773d9057f216753.1628699576.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::35) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO2P265CA0095.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend Transport; Wed, 11 Aug 2021 16:34:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddb50cb8-e976-4572-a90f-08d95ce5e5dd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6885:|VE1PR08MB5055:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB505535DFE3DF2B9E05C05B8792F89@VE1PR08MB5055.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cmJsXFX4qSX5JYO7/7DWz9hXWYbyqCWVBSiwO1VNMYBJjALd588DQG5ReuyZU0+yLGX06cAgFox5OKghCKLNMJEYo34/Hbb3QCcQhskfeQ7flqdJmcUTaPwbsWLHU3HU/Ortgrk7cY5MFUbcWs//RJjKrGn71NIwfgJREuOJu+W+jE5UKhVVaFulL/AbYVscpjSRD78Jm04haou+S8qL4ZMHixhB+NIRvG53R4JiaXF6SSDVqc/d5+QHeyl8rGUW1U4XUM46MJdRdiUEEP7+HvFN+d7vE7ImAZ6ctRTLx/8Jjz9eLaQHrS3w9KBiKrbB4mif7k5kg983qVdlwYBUpeyYnZekJn7rxIK3SHyprA4D0HzL9llhVJVLP6wbXPfGt5kXhmSfC2pBnoDPTrjm9fil+CtKhJoJqrZQjvBwHW+yrCe7GuS1R8xjbUlVZBykVkMpRfZfGELAzbNE5+2iWH7NStSpgMGK+yITqfjTh8ShszVeHw2RKLVkj+GcDvzF49plfSyYFt6aFh6XQws9UevJN3mO77lPvMHYhW6Ied3DldncMfx8zkIPAwS3RK7+PnL3tntteHI2mn/dnMyAwiH37qHAatgV+FwMIlNMFJjygwzhDd+l06B8QCSUY8XNF+2teX0E7+lINMHJpegjC94tTL+ZUygLQNl/kfhb8gcztwEhxEC4m4P4De9HvjEs7D4yw3CgOTXyMPsQEgDZRQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(366004)(136003)(5660300002)(2906002)(86362001)(44832011)(2616005)(6486002)(4744005)(8936002)(7696005)(66476007)(52116002)(8676002)(66946007)(66556008)(956004)(26005)(478600001)(83380400001)(36756003)(6916009)(38100700002)(38350700002)(186003)(4326008)(316002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?MVmz+h25UmzoGmKeIopvfHahm5Z/+LUbOB1eR8AGicEhtyJ2rG+rcrV6Vc9F?=
 =?us-ascii?Q?hXjlR/smKd8cLxSAkL4qCsb+wlZ4qxCzotNQgdyqa05NaX2/CMjFukrLhd00?=
 =?us-ascii?Q?gYeEHM9t2PVTZhdS1XNXy6DryO8lXsGtCKYA1lBeptTnI9tBNQqZ6000dEyv?=
 =?us-ascii?Q?dsEFdC/tvpnUE3FxNc4rZuh1EXofZl/R+xttmTa9KCvKxc7QFNo6q0g643VI?=
 =?us-ascii?Q?XqNXwmeYQHx4gOfjEgSkP474uAIp5DQcgOla55TmTrS9yHS/BzDhqMoB+xmS?=
 =?us-ascii?Q?lSm5NlqDTVHt0xRppZy3v7SToEMex+zhW8s2311jRdUB+wpalFIP8pBnAjNg?=
 =?us-ascii?Q?yeQzedg4EDZ4BWJVQAOWp5erWJf2KDbzTMbiKSSuc6OC5r9TzKJNMjkcSV0k?=
 =?us-ascii?Q?mxEhMRNo7a382b4ERFUjbzjgzVLLl9kN/PHcQHs/Jiuxg5CUrWxJxAnY5AOq?=
 =?us-ascii?Q?L7BdjnaoNT3TFqXu7mUfTXhNN/ch2kcw6+g6FFaezOc0ExcIgLaKeIbp1K3V?=
 =?us-ascii?Q?iwpy+OumKd7EN8pSwq8jVP9+RztK4i4TX+++GBr2rPby/37GGnjWXQaDP+qM?=
 =?us-ascii?Q?X3Wm8SE4XRMwEa8txgNs/ZjK5mL74LEUtiSozAN00Qp6yIbJFclgkZui6qT4?=
 =?us-ascii?Q?dl/RUaHt+xRjPWOQE6w5WZVu8yW9jM5M2GF7E+Wqtzxk8OT7bIxVaCZR6SzH?=
 =?us-ascii?Q?PLae6b0d2SNgOwVxZwc4CoJ57dxmacoq0aK4PKTDGxo8h02TyRFf8Ml0MTJf?=
 =?us-ascii?Q?HYzA5sbHDfsh6Z1RqIDQai5kPI/oTHM7xyCAXSFvt907RMG3skxOWf6sxZok?=
 =?us-ascii?Q?YaC1mnpWwS/EczIuHxSLhnNlctLibqQWS4LQsPspnER8n0Sbler2pzawBMsz?=
 =?us-ascii?Q?Ao3S953pm/dbCrzP4U6EKQtZ3vgyQhojn3rXWSE+ECiGWIwC7gN4Gf0JIzJ9?=
 =?us-ascii?Q?hsA3FzF8kQZLzx2euj+KWbAwEeT84bFCP580AXP9nVapadmwrtTk28diX/Dv?=
 =?us-ascii?Q?RfRzXgaDr6Ri5WU/1DWNO6e9yYj/GXxO86bWiQnZXF+JWaAmTJB4HxL4cvzs?=
 =?us-ascii?Q?/jahyiNWsnppmH2qExLcBm2I+nduXxOfzgnH2reOUovchHHlVwPGSGmH53GZ?=
 =?us-ascii?Q?DznAGHoMaXLfMiWlahNmo7gjoDt3ZUh2jPdMAjktEJ78PgS/QrZVfuYh0n4V?=
 =?us-ascii?Q?MgsX0Q2Qb4BuWpXU/H6k2xlYP0+1iGEljZXvoT2WPvY3xW1FEIcaK4RnI1Yc?=
 =?us-ascii?Q?iUerfY5KoY5AwAAij6qO/6NDzI4+ItKmGDzED29q/W6LeJwaMB8lYcQosySF?=
 =?us-ascii?Q?Au9TD9Ul1tLMBprAJNID23Uv?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6885
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ab78f06a-271d-4c20-e6b1-08d95ce5e1a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7xKG0TeNb2kZ765n77OY+qG1Yhm/TJAqTQieEgc+jEa0n1rbBwaQjrG3ATCK64AKKb3EkWr5haqJyh+pfNxRT4aigwykvU7isstW3vXGG9sU6DLj4eHZokIV+RZ12lKJ8pT5VTe4dXzHhHrgWRYkXWfoZBR0ibJA1X7B+CN/UPOkXy8fT0Xuo9oJ143wvWV1twNFXRep2Q2Mql2luU8VhoVNDTnQlTwnKSSrwYRDSwisDiZXpbT1tGT1qha72IXII4w8Xe/S2pPId/lG66eF8Agal5o91/p89rH/nRDPW+8rGfgEmYE9J1UPg+ZF++XuSODlKVaBXeGJSQRrZsH0Bln6PBkTg3MKczgkC54IPHGf0GVJSineqo4Rx9KBdhBvR93rgfKyuGJyfwQCnw0+mjCcADIVSbfX100L9UUGJCtVVviHxKqrJ32w4gynY85AQZHuU1sOibKf6a9FWRX1XSeZ/IBgySnUmdZeFesyRdcHPagtdXft2kdrF5v/G0FDdCgdGxdAv3iPGr2xkLQ7qgrTnFHPaa9vrPvSooJGm5/1u4LqIbqdGrqZWAlx2zvgiQcWhWJ0Q98XFEjyJ93HUelECyZeWYracUEU6OQITbRQVtfXepswqDd1rcEOb8TnuE4R2qD6XWF5SI8eoDg4n/YMEOMwVIEENnNgNNmeyoTkKg07Kan/33gbOa4xxCUhU4FKRIP5ljT9gqRc3MmhEw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(36840700001)(46966006)(356005)(5660300002)(36860700001)(47076005)(83380400001)(316002)(4744005)(8676002)(82310400003)(6916009)(70586007)(6486002)(7696005)(8936002)(70206006)(82740400003)(36756003)(44832011)(6666004)(81166007)(2616005)(26005)(186003)(478600001)(336012)(2906002)(86362001)(956004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 16:34:32.3341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddb50cb8-e976-4572-a90f-08d95ce5e5dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5055
Content-Type: text/plain

This wil prevent default values assignment (?=) to be ignored depending on the
config files parsing order.

Issue-Id: SCM-3027
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I0629b52ad100c10eaac9f7004bcdfc778de678f0
---
 meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
index 097b382..c04fc23 100644
--- a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
+++ b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
@@ -8,7 +8,7 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 KERNEL_IMAGETYPE = "Image"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES:append = " tar.bz2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
-- 
2.17.1

