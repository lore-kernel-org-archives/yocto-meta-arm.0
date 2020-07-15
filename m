Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.18752.1594915611395956681
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 09:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XkSgJrfv;
 spf=pass (domain: arm.com, ip: 40.107.20.59, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp+xohMKkZwgb+9IEQsYE1Mvy3KwcEiquZjG1Ud9qOY=;
 b=XkSgJrfvPjCPYaWW2djZnLB7ZkqU71MfVDRSNp8emhcgk1rb1VTA6kU+QFZkVFhQ63dCvKq69Bgz41oTSKkLIum0e8Nwe0w4XESOx2QQP0jq0uETsEHAY2Qo43WBO63CX7X3pEXQd4W9viVHTsxR2d0VVkLaLzVZAwFzt3IZZZc=
Received: from DB3PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:8:1::32) by
 DB7PR08MB3116.eurprd08.prod.outlook.com (2603:10a6:5:1e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22; Thu, 16 Jul 2020 16:06:48 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::50) by DB3PR06CA0019.outlook.office365.com
 (2603:10a6:8:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Thu, 16 Jul 2020 16:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 16:06:48 +0000
Received: ("Tessian outbound 73b502bf693a:v62"); Thu, 16 Jul 2020 16:06:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf44a516bea6796a
X-CR-MTA-TID: 64aa7808
Received: from 9e9c76ef34a3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EAE9BC86-0442-4126-AEA4-E0F67DF16172.1;
	Thu, 16 Jul 2020 16:06:42 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9e9c76ef34a3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Jul 2020 16:06:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDzSBmhtxlTwnkVTs4uAdzpiSG+V3Xa65yXh/EagIqo5HV/StKKble68BE1+jtzm1jg0qXAMwaiYFrIJTDkuQaxyHlcbNy2kgHypJ7KR//Qxc+43E2X5iZ9eH54yuzrouMdT2rMZxSJo/IU/1aOuDBFhTRUt9O7EoH1Ns8dCJe3QNBcis/qAhP5BtYG5oH+450gzIxXFcQB791+gz00+J8gUGSy2Q8ajQ8CubFqFFgyIAwWpyNqCoV6wTT9hz7xdWRkR1BPqdhE64ZHNVD9CoFoKokoc3YZJsI6li1qWNGIJQEv8h9K0SNuyN1ecOESUE36YOS2AttN7Mk8FPpPUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp+xohMKkZwgb+9IEQsYE1Mvy3KwcEiquZjG1Ud9qOY=;
 b=lI/V7KVOydmkyJ7W8Bp0uUipELqonV4R26RZtmIc7sxuobTkv/qEYYq/ObUp+wxnwkkZvc75k1NjpQLkqvlQzfSc9exZvwWK5S/nHVjdf+vlzIIUpItqp1GmPcXXLdYkn7GzjDQjzRZSFUWMOEpzoEvwTXCPuY6r7bsD3voW6E3edgmebC3AC8kdTgnpv2c8++XNaLx1BnnwEEZADaVhJezKBNIGv9W6/6qTLMYgRgv4sMedgGg6Ij+ozDln6jinNDVt8VCi1TBEdP8LVfCFW9mmBz/wP3Ip6I5GFKZAbOBjhoGWuAZnRq7jXhG8DuMevNgflqyyNiWuyJKMsV9YQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp+xohMKkZwgb+9IEQsYE1Mvy3KwcEiquZjG1Ud9qOY=;
 b=XkSgJrfvPjCPYaWW2djZnLB7ZkqU71MfVDRSNp8emhcgk1rb1VTA6kU+QFZkVFhQ63dCvKq69Bgz41oTSKkLIum0e8Nwe0w4XESOx2QQP0jq0uETsEHAY2Qo43WBO63CX7X3pEXQd4W9viVHTsxR2d0VVkLaLzVZAwFzt3IZZZc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (2603:10a6:208:127::32)
 by AM4PR0802MB2257.eurprd08.prod.outlook.com (2603:10a6:200:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 16 Jul
 2020 16:06:40 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::2549:2fc9:7918:6a8d%7]) with mapi id 15.20.3174.026; Thu, 16 Jul 2020
 16:06:40 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] Limit legacy compatibility to dunfell
Date: Wed, 15 Jul 2020 08:59:20 -0400
Message-Id: <20200715125921.3460-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:5:177::36) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (217.140.111.135) by DM6PR02CA0059.namprd02.prod.outlook.com (2603:10b6:5:177::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 16:06:38 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 15 Jul 2020 08:59:21 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c5cfdfc4-8651-4289-fe97-08d829a23e91
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2257:|DB7PR08MB3116:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3116D8A3A4B9190EC5352403F07F0@DB7PR08MB3116.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WFzKBg7dg1Tsq9zVeof42TczcCSl8bcDWVSx8tXh5wQI8zcWc0Oh8ZYAk66FDksonLTmct2fzM15rBN5L72rsvwJnTHliqwY9NNK4OfhCKSy2Hzxc3FRZ49WlXoeASBlTGMMwv0GbQsh6Xs4dCqHWUMYZbp7vdiPqYzLwczV6vwtirp+iU1Uv9hvEXv8ymI/c/DidiwrN7ImX0mpo+RToZtthxm6T8eG6Ynqq0iUlvjvqqdpZip0OT58oBFch03XqcUONDx5ozMaAB/lYY5YW9BBtSUZ/NY2iupKjt61Q/2mYzbweLQCzcWjqCeEH+x6MkXLYPZ8JWyuhYCVL4a+bw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3972.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(8676002)(2616005)(426003)(26005)(83380400001)(66946007)(478600001)(66556008)(66476007)(5660300002)(86362001)(1076003)(44832011)(42186006)(2906002)(316002)(8936002)(52116002)(186003)(36756003)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Jgx4pcZ3U6edhz38TsTmn6yxX8IFi3vYQ3ELPsa3d5GQm2GWjHzd4vfiX06iDcHru3W5O9Hh6B6eGfOHYGP4Ev17ZUFX/Ee+9oIZCaRDyqxL3P4qG+MMBzNAeWfwBXIXpgGZh0fcvqSrz0ZOvk5YAf+Z5I4/KQ0mMn9/ekJpp4ZPn9oNo6rXOP5ty3ivI+1n00Qt+5xnyuK9cK2yEQ7wvySTr7l9PDIb7C5M2NpRsqD8PSOoaMXgHtHuzSW+3E0S8EAx39v4SgvraYBE0+YcrprZdQyw5IEyC3eIq98yEA0ayikPLLig9Q/vpOyNuYs6huRyxxGrgRBYH2ao/4Lc+puFCSg/6158oXJe2WdsO3i8vpyeI3n8SqQQ2mqtV0D1IYe3e1a5AReTeUzGHGAgIgtuz2Spsx3flwdS3SBCcYdPPQ3XVxrTcfkG7vL4iigI0if08NtitziN9Iv9MQ59ir6jEgkm/L5p29O3Fo4WNE/PUHQqZHoXp2kTfBpxN41r
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2257
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966005)(1076003)(336012)(4326008)(26005)(2906002)(8676002)(186003)(6916009)(8936002)(81166007)(5660300002)(316002)(426003)(86362001)(42186006)(82740400003)(36756003)(47076004)(478600001)(70206006)(44832011)(356005)(82310400002)(2616005)(70586007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0b4dcdde-e129-4328-ba35-08d829a2391c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DieuY1TersoFvwUy/ftaqzqJAoNlR6l+2Ck5gGLnFKyEisrp+yhKZtCo+3AxR+V0lZrDmW44lvJTZcniJc0nfzfPfTTD6mZjoQG/oOeN3x80WHUoXj5vEEpifdMGyqeOcaadBPuI0LE8PBtf9loGlK1WpZd9NXVwYI4tIVzb6LICiNRfqfjWhtprxwmNIszkShiHml0BL3qXFrlLEO8GqevAlYLRt/0e4F+6cEROAlkfx+pOnYo/ljovViJbDBee4BM/P54K+DvfQmw+3hnBt3C/nBSQjk5ExqvI1hgiN9lhfiDYqOvQI8j5F8hp7B1TTGXRJkk8f/bWxKcIC46I+dzQBoZRknme8OZGeuSOVpx0Oix7i88+u911lUpW/pZH5NHD3+gBOiyKYZEj9y0Kxw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 16:06:48.4051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cfdfc4-8651-4289-fe97-08d829a23e91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3116
Content-Type: text/plain

Layers are only being tested against dunfell and gatestgarth.  Limit the
layer compatibility to only those versions.

Change-Id: Ib4df617d8991b1c9096b8feaad9228174319bf11
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/layer.conf       | 2 +-
 meta-arm-toolchain/conf/layer.conf | 2 +-
 meta-arm/conf/layer.conf           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index bcf08ad..816ff9d 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -10,4 +10,4 @@ BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "6"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm meta-kernel"
-LAYERSERIES_COMPAT_meta-arm-bsp = "warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arm-bsp = "dunfell gatesgarth"
diff --git a/meta-arm-toolchain/conf/layer.conf b/meta-arm-toolchain/conf/layer.conf
index 800d15d..6ab98af 100644
--- a/meta-arm-toolchain/conf/layer.conf
+++ b/meta-arm-toolchain/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_arm-toolchain = "30"
 LICENSE_PATH += "${LAYERDIR}/custom-licenses"
 
 LAYERDEPENDS_arm-toolchain = "core"
-LAYERSERIES_COMPAT_arm-toolchain = "zeus dunfell"
+LAYERSERIES_COMPAT_arm-toolchain = "dunfell gatesgarth"
 
 # do not error out on bbappends for missing recipes
 BB_DANGLINGAPPENDS_WARNONLY = "true"
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 10a7951..14a5922 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-arm = "dunfell gatesgarth"
-- 
2.17.1

