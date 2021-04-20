Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web10.12613.1618933211895524008
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 08:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=74VeHZck;
 spf=pass (domain: arm.com, ip: 40.107.7.74, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGAPAv6bd2Yh04uCVrZKJUPeTws8WEQLjyKSBwIDo1k=;
 b=74VeHZckhCdE7IPI0HybDJMobxm7pWvtd+94+EhT3rPOBqsTaa5IdkFGXP+7met7CtNeRVegBpqk7p4INXLDv+qZ2GstuZZhDdNatBhV+e14WmtxAlTsa1H2AyODU2swPi1RH9rsIAZPpjMfmQLAyF1i6TlMdY9PqCcq3Ebsv+Q=
Received: from DB3PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:8::44) by
 AM9PR08MB6227.eurprd08.prod.outlook.com (2603:10a6:20b:285::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 15:40:08 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::ae) by DB3PR08CA0031.outlook.office365.com
 (2603:10a6:8::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Tue, 20 Apr 2021 15:40:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 15:40:08 +0000
Received: ("Tessian outbound b610e7b4d771:v90"); Tue, 20 Apr 2021 15:40:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 753b63a312a7287a
X-CR-MTA-TID: 64aa7808
Received: from 9bc3f814d1f4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 88107A94-362D-4806-96AF-4FE6C93D4E98.1;
	Tue, 20 Apr 2021 15:40:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9bc3f814d1f4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 20 Apr 2021 15:40:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLv2H9gHjDqpc3xdug8GE/lMQZ4Fp0jQ4rPJC8ZxQokFRuEFckWj1xgT9XHobkplBot0nFmF6tZ1QoBkdgYElFMk03tkYC8OqMb0CEBBsNMyMIcxchfg7kHbvqrr+ZJ3q6rSQNgv8kE4XlYEbLGu3Ypw1djSWSdHUoQNFsfJsCT+JSZjMppn84CrtiZ6+9pRz2/381HAuZK+If36NOlbU7AOi2ErsmutzWO0FHGcFoxED5epjedO/XzZmRvQwVQdIkzh7hGS9uYocbZuAeaF3+Vcuz/LYWnMFEDAxQ3+7x+fc+EOjuLdozj8NwNU38Q6XlgrfK2wDrs5v2NgHY+K+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGAPAv6bd2Yh04uCVrZKJUPeTws8WEQLjyKSBwIDo1k=;
 b=BSyCfGiN7BPlHD9FxPb2MvvDFfE0ATYZ+5lHkuIYDq1fgzsNTxK6ZAl9KFRBbPkwQPbkqn+9O95X4M71wHoYh7V4xJHu6SSbiaN3lL3nhWtc2avKCXWvGg68g9xvdUCIbjBpq/gPO38xA0xEUh6A7P4/2Du5cvUBBZ7GYRTcv370yxZyqpj8p1pONN49xY8O6tUYhpvW0jdrovGmXJ5vsbNGDQg0/dcKSVOSXIGco4HWqaEXnNBxRsWai2epqhV5lzqcjaMApsuDvfpVrKSKQM3XA6+/MFRvJFRX/Pxx6Lt5HoWQdytx182Fg3bf8NaoXwteau0XMiSRAQVBZZ2gqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGAPAv6bd2Yh04uCVrZKJUPeTws8WEQLjyKSBwIDo1k=;
 b=74VeHZckhCdE7IPI0HybDJMobxm7pWvtd+94+EhT3rPOBqsTaa5IdkFGXP+7met7CtNeRVegBpqk7p4INXLDv+qZ2GstuZZhDdNatBhV+e14WmtxAlTsa1H2AyODU2swPi1RH9rsIAZPpjMfmQLAyF1i6TlMdY9PqCcq3Ebsv+Q=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6229.eurprd08.prod.outlook.com (2603:10a6:20b:295::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 15:40:01 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::185d:c3b0:a5c8:de4b%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 15:40:00 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/arm-autonomy-host: Set Xen to 4.14+stable version
Date: Tue, 20 Apr 2021 16:39:53 +0100
Message-Id: <10b09ea1d64f1b6933ae200803e89e31ea17c5c5.1618933109.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18d::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19 via Frontend Transport; Tue, 20 Apr 2021 15:40:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 497714b2-3f9b-4e0d-0aaf-08d9041293c9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6229:|AM9PR08MB6227:
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB62275662F49A1B2D6EED538792489@AM9PR08MB6227.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2tO3QpRyMaQTgzcKseQLzrAMedC2bpt7uzBfECSDx64kcwOH5OATea+RysYLgvAhejbGZrHvkV724CQoU0h3eqyrvkOh2phy9BSULOULAS/vmiy/mXTcjxvXgP2coq6MKW3nuiVfhiXzOq018E9OW0XR6ZadR5acZKTg2E6Hvjm3Jr7bbJpzZnP2FJv34TQNTwqA1uPHA3Ycqq3f/HQY0L95ZYSA6ge2F1KRa/9aKSBEmeBxRRT8FzCcr1fydcf0Vd/GEzsAT45l2wRnmydqD3KlKyUcAIPronPjd0gtc22od5v/shww/ZAx0z6kbchZMJB0n0dctHN++X3ZiTtb1MaIPcZvRtuWvUnBQJqaoMAjwJpwkQqnXth7GZka/027yH8AFlb2is8JyPN7HVdelUhvZW6FDHNapncIMm7krx7LjDP3wrBdjr6rb3cmNW+YpF0eKZkmLV6KUnl6f/0+7v4q94fXfjvOKgdKa/cAGaBgMlEqdl4CxT1CCB8vPBOP75B3010YtpHrBMsb06kBNYic3GvuZ+C8lVYPJwAyvYoF+kGHq34Likr7OukuGB6jdGF/c+fXnVFRzTt47FtlOF3AUbHDOgv5m4Qh0lNP8YHz7u+4sS7L8bwFOJOQAjSjTyjRQcaiT2d7shvWlAkQ3g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(2616005)(316002)(66556008)(26005)(36756003)(956004)(83380400001)(6486002)(186003)(4326008)(6666004)(478600001)(86362001)(16526019)(38350700002)(52116002)(44832011)(2906002)(8936002)(5660300002)(6916009)(8676002)(66476007)(38100700002)(66946007)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?6I78ozkjo/k5bmqfppPuebRs1r97Zt6lMWnzxg+G0iLxmHZunq+X66QQIJgr?=
 =?us-ascii?Q?XbWp85Y1n0I7zcmIYsGceiBad78iEkOcEEh7cBZk/VYwopxfdrbpz3XKI5KD?=
 =?us-ascii?Q?z0xUbeGCt25D+a0S9Xa8URKK3/51h/UaYM9XLN1GFXXMIdptxNjck13DY4h1?=
 =?us-ascii?Q?Fk3V7PFqByh6kxvyhg0EmCgko96z2AeOz/VTuUUD9bQwgrIcCPJDZqbwOg3z?=
 =?us-ascii?Q?v+nnAtrq+8FXy4RZY5D1FmoezWUv3xWNss5YmjVqiVw23m3ir2Aj3b+en6uU?=
 =?us-ascii?Q?i1Um3vXEkYtN4QPo4lppL0SYp41FSEj2auzE1Bb4dam4X0pT3JvYCfTNEVQm?=
 =?us-ascii?Q?8Yv1lnAJejEnswiNpyYvq8UPZzBQdEuPxPPd2mQTxXJzX5edr6WbFVlejqbG?=
 =?us-ascii?Q?wJcZEYbRffDAbVHxfVjoHcpNcwIF6GbpoRpIDC0PA0AgNTOdA/zl9qsJ4NP+?=
 =?us-ascii?Q?eqRLcO7j6qVQDf2zsB6N/V4uuT5ch54C7QRSFiOncCRx5tBMFjACiV3kcUmz?=
 =?us-ascii?Q?MSUg3ntKYyP9FRaUvKtJYsIBpBWPlTMkOdhEYwenfWFe6dGOfMqSV3nzEELJ?=
 =?us-ascii?Q?CNKr0B4vH9vYRZ19ATRXepLz548hW2IAN6qOu8egNgb0VcQpb6MOAYG+wJWp?=
 =?us-ascii?Q?sa8q6NM5o9YgoLz1/8aMcN7iAxdeztZDLjaKhI9bM2u7U7d0xFpHIA4KNijK?=
 =?us-ascii?Q?+iPyI52figgFaCSKh9DZkx50TJHW4P478dXoGgFxfia+Lq2sc++NrzQfSLrR?=
 =?us-ascii?Q?A62fCzEmN/PcuEFBiVxlAD563jkQDEf5fdmRgDrtai2oipL9Wzw7QjDEWQNX?=
 =?us-ascii?Q?oCJyTW0v59osdfAcydPezrm5704jPC86ZgVjikFOESpsGYmu4k1VI3WUBtGU?=
 =?us-ascii?Q?d59+n9JG37roSf7ue+8Tjzccs1KgdU8mcTfygKTUwsEMxs/Y8N7ugeBtA4se?=
 =?us-ascii?Q?ETFvF4ijUVKJP9708qAgYvk2uy6d/SflP+AFuaINSVNRK27gAPhLp45o3+FK?=
 =?us-ascii?Q?DWpuI2zQX4IJWXzTFE9TZqYZn73W8HoFx2BLjrb31AYfVwIhSChnNQeFThfO?=
 =?us-ascii?Q?kzKdi8AW7Hjv04WN/czr+s8zgQYWMkV5X54ye4u8+PlT+3ARLjHQy4JdYBi/?=
 =?us-ascii?Q?7zSr8U4DspYH3q5VZk+31/uUfqq093fDYvjLM6yGsPU54Vk4LF1hciLcvLxB?=
 =?us-ascii?Q?Re/ze28kQXEt45o6lk1OKU/0hmAlRN4nvrF2LenspDuSLH0ZaUfpLBHOj1A1?=
 =?us-ascii?Q?gWI7BTDUXONipeaT9HrXrJmwzQRZb4H5Aw01vl+f626fV6w/eyEdCjqRfHQe?=
 =?us-ascii?Q?yOMsIPhELIylPgfQO43QTOxl?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6229
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	215e2992-23c1-4e8a-0e5f-08d904128edb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2wWS5XfmXqbKGmLGKqs3Nbd22bhmg2m5uqD5LdqS6pUNQJxtCruo01c/TGibjGR3cZ9w0/aR9tk9KSwwuhZmvhQiKSlUBxM4QIKtRhr7n148RLnwoboA6yGSmkIl231HuiJU4fmwuJdUgU8QV1pZWMCIR8zmUaToGejK1ZI+UZkcN2L7heuTeBgCSiz3fUu7UDc0HMqPlKrfoQ9nYGqDcwmMrcslVpmxE0INExfD+5lfrtno60avbibwbUKIW+X0IeM526SDylT26DWlHLFiyrxpWfsBCAOSZ8lAK4txoC2A3TvqjGcPMJqgTAi0eW6jew2UnmGCDE79N8jmEpaeZa6KZdfQt+n4GIwkan/hVyvZTmO+cKvQ7EphZCqBxtsQ8rKHOlCknk48Y5Cp00npipA2Oz0GurCFTmTdhennFuCVaRmzF1dCaxgZBroesF52LC2zdGMcVMBjG0DfBEt+Otzn1+LvMOeWiFeGdWJFI5c4w5MROdGx4A/mDwj7KM0uQp+O/BZ+bxfguDbdBglmCIR8WJB45CBrs0qZpxih5ICDO8QNyXtypQBPYFZ8tN3nge+1Xmr0uPlK7yuWsqNbkE86SfBq40xWjS/Fr9nbfxA8JwmQB72eCLf1e/DysgbzLKFuBsoC8WMAEpGXmjIeo87vwwU77MdYeh+O3weOOno=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(346002)(136003)(36840700001)(46966006)(6916009)(16526019)(70206006)(2906002)(26005)(86362001)(8936002)(82310400003)(47076005)(478600001)(6666004)(36860700001)(4326008)(44832011)(83380400001)(81166007)(956004)(6486002)(5660300002)(82740400003)(2616005)(356005)(316002)(70586007)(36756003)(336012)(7696005)(8676002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 15:40:08.4919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497714b2-3f9b-4e0d-0aaf-08d9041293c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6227
Content-Type: text/plain

Since meta-virtualization master branch bumped to 4.15+stable we need to force
the 4.14+stable until we validate the new version.

Issue-Id: SSCM-2307
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Id204314af9c87615d88dfc60702867380225b491
---
 meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
index b7b6af7..3a4e89f 100644
--- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
+++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-host.inc
@@ -4,6 +4,11 @@
 DISTRO_FEATURES_append = " xen ipv4"
 DISTRO_FEATURES_NATIVE_append = " arm-autonomy-host"
 
+# Since meta-virtualization master branch bumped to 4.15+stable we need to
+# force the 4.14+stable selection until we validate the new version
+PREFERRED_VERSION_xen = "4.14+stable%"
+PREFERRED_VERSION_xen-tools = "4.14+stable%"
+
 # Don't include kernels in standard images when building arm-autonomy-host
 # If the kernel image is needed in the rootfs the following should be set from
 # a bbappend: RDEPENDS_${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-image"
-- 
2.17.1

