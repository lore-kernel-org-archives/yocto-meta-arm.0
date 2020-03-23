Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web12.53529.1584973321315727050
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 07:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XEkONXU8;
 spf=pass (domain: arm.com, ip: 40.107.22.81, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gug8wFBgPUJa+ycVj1WH7ggFcBU85SkAlvSlK8C5ngQ=;
 b=XEkONXU8Z7EHj3nwzO7tcHufqx+SL+aqmyUTUpE588HfuU0h4WifPMl8iZxCY1s2vT7fNU2YIWVMnvSz5X/NSDI8+v5WDhb4S1hTTmPG28U5iYg8FS5P3mAv/Uy+mr1BxV+f2vcc/aYDwzCCmuuPZkB9/I8KDKAe7jKdy45Py9o=
Received: from AM6PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:20b:b2::24)
 by AM6PR08MB3719.eurprd08.prod.outlook.com (2603:10a6:20b:83::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 23 Mar
 2020 14:21:59 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::4) by AM6PR08CA0012.outlook.office365.com
 (2603:10a6:20b:b2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Mon, 23 Mar 2020 14:21:59 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Mon, 23 Mar 2020 14:21:58 +0000
Received: ("Tessian outbound 47356f393f3c:v48"); Mon, 23 Mar 2020 14:21:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd49f31fb0e5d19b
X-CR-MTA-TID: 64aa7808
Received: from 02198b9ee1da.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 05D24D55-5FDB-4379-A8DD-33B400D3D4B5.1;
	Mon, 23 Mar 2020 14:21:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02198b9ee1da.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Mar 2020 14:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzbJhKcQLtFDT9Fzr54GSub0lxp4wvTPSHn2xVOW1b/q0eNcoGA62QXjTeDFlh8OgbZnC2r5IFfFygRtZR92A7+8kqEhggm8idc9gt4ezezmDPMcqS03tpdNdIddKUGq/pcQKXEDTrD7/vdsLKWeNKuzNy5y+mXfjW6dqWGnilfiP8C9aRcccvI3wRy+QcJmfQyuzMeVPQ5Svz6IY9PQNGc4JP8Ld4nLDjnIgnyUFWdCcwz95N76uHdhDyjQdY5Y+iwkALEuac+g5OH7s8HFq0rAIib1uR3VIKb95uyVI4fi9438NKg/mq5XtFaW1KKz40gJSGsw+RYhsCMkCS9u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gug8wFBgPUJa+ycVj1WH7ggFcBU85SkAlvSlK8C5ngQ=;
 b=KdIOd8Ou7YenfBBaj/7JJbslySAggVXfYiAuR5S+hh/H+Wiu0wfceOtC5Zs/yWmxWRvKX6P1wajO9tfC6hww2WBaR5PHJZ/ArdGiFeN7WrvkpE/x/pxCuo6+tTSBWoQKPfCoqsmB/2/CO8MT1UTgfT/oCtJ9Fmxq4ItpaNHmWTADRXqZzE1IOqrp+nZe4nBN+iGVVxOe0RVAGAzpP8Fjvi0UA1/XHzQsNJnJl+AchN7U/wU7tvYOehiZIt9AtEjNArN15HGqoyseE1ol51Yyu23I5HYwZU0SVlAUT8q0D7Rtem+AvnCc2oAiz1sS4r+Rgj+4G4d2A+a1pYh766d9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gug8wFBgPUJa+ycVj1WH7ggFcBU85SkAlvSlK8C5ngQ=;
 b=XEkONXU8Z7EHj3nwzO7tcHufqx+SL+aqmyUTUpE588HfuU0h4WifPMl8iZxCY1s2vT7fNU2YIWVMnvSz5X/NSDI8+v5WDhb4S1hTTmPG28U5iYg8FS5P3mAv/Uy+mr1BxV+f2vcc/aYDwzCCmuuPZkB9/I8KDKAe7jKdy45Py9o=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (20.178.118.32) by
 AM0PR08MB3458.eurprd08.prod.outlook.com (20.177.43.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Mon, 23 Mar 2020 14:21:52 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::11a8:d2c1:e055:a7d5%6]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 14:21:52 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
Date: Mon, 23 Mar 2020 10:21:45 -0400
Message-Id: <20200323142146.30350-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BN8PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:408:94::19) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by BN8PR03CA0006.namprd03.prod.outlook.com (2603:10b6:408:94::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend Transport; Mon, 23 Mar 2020 14:21:50 +0000
Received: by vm (sSMTP sendmail emulation); Mon, 23 Mar 2020 10:21:46 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce8a0d88-851b-4565-f876-08d7cf358c33
X-MS-TrafficTypeDiagnostic: AM0PR08MB3458:|AM6PR08MB3719:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB371920D8C207BCA14FD91E8AF0F00@AM6PR08MB3719.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(186003)(2616005)(4744005)(478600001)(44832011)(4326008)(1076003)(26005)(426003)(5660300002)(8936002)(66476007)(2906002)(81156014)(36756003)(8676002)(81166006)(86362001)(66946007)(66556008)(6916009)(42186006)(316002)(52116002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB3458;H:AM0PR08MB3972.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +AkMjqFnF0h7FUf2bTto/b2wMeK5RDH/l+FHJBm1wN18YklNfEv700XTI5TIqep1Z+Rg33pK941PW1/h0hjnxNKEc5En/Izv3wOtFj4dD80PdLCrPxoutdjo9oGEvF9peAJ44ABE02eOis1W5jC+y1SjNlmyvYMWOzl0YQF0ZSwreCE/vfwv+JYRrR4uwaykytAN8C9IG/nsDOJElKd5GuavyG/W3Mb2bOK9bra0IqfrYpwyEnZy4bBxY2e5jymoOe/+DLgCllWIhMHFJQh+oqKoGie2XyQtvRl29e83nnqsTHVyTmSes53o9OPrjzc5IbzIYl6ddpe3as8F7D16QCORdMafEgPLmsGARBw5oJ1j2ifZuk6OcaTHXAts6z5dUNxrUPtsi59gR/DdEtXWgd4xDd/E4p1bLwwiTL/W1+2qNXd7e1fcLlY1ZDliE6Xc9Xp/txVYvna+CDN49IGp2OWFE7uiYu0Dp9xKWAI1XIo=
X-MS-Exchange-AntiSpam-MessageData: 
 ucTxHS9Xi9QN6TPUwgaUR5qYgsXp8fMTQAcWHOl1EQx+FOKAJ/KwPyHgvndFpMLxC0OnTto4CT4yW/aBfL53oxxTiVltNougc1foOeEb7+rzKhMtrzofun4RPVWdbpCzbWuh5yIZgFdw6bfUo3PxVQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3458
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(199004)(46966005)(426003)(8676002)(47076004)(336012)(5660300002)(81156014)(26005)(2616005)(86362001)(81166006)(8936002)(44832011)(36906005)(2906002)(26826003)(356004)(4326008)(70586007)(70206006)(6916009)(316002)(4744005)(478600001)(36756003)(186003)(1076003)(42186006)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB3719;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fec986ed-aba1-4030-9386-08d7cf3587ad
X-Forefront-PRVS: 0351D213B3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TUtL3srduJv2XImRZbIZkJiEcMG8pMGXYLddsTyELUJTxoZ492yRDgFcUZEg9V1tH9O6MwumbafvkTEiTEPYlG7YTqQ1310VQl5hVHH6bdUeqUmHcf6dHh0qKwT1GMDtq+vm5eRqio+lnpnalHq6tvWwCxJK+Eb1R5K9FqlQQUHVIccV1acPF15Dq2rRoAjnjaHh9MAD3kgM9emFdqfiF01sBPYIA55EZDu+RqQms8g7/hU2PhOA5JI9PWLyP0dr9ozLH1ri49clow/wo4ovUAjI5w/qtzv3fJwvs8J4I0iJmEVQ4j9SygkxXygWgNJdu6jsIytu9YZiBzAkdPyxXoSmkDVhoSPlORGo1mDUp4/Kwvz91aae47yMyIUrJisYXjmAfKRByN/xI1tBB5uPEOuiVgojwvf7iVzjdrT1/dj1q/b9Dzuqw3aVmHMWP2jSv2L+uDd+10KRGGbmIb1oHAgEydwr4dXCx4bxR/7KZvk5R70DJpfw/75pCOoJnbwohHV267lWpxcG93mbSGed2h1aELGkt6/uKe1NY3Hlu0c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2020 14:21:58.7546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8a0d88-851b-4565-f876-08d7cf358c33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3719
Content-Type: text/plain

The current WIC references in the A5DS config file are causing a build
break, due to not being defined.  These WIC files should be revisited
once the IOTA distro is present.

Change-Id: Ied2cd6f768625d18150ed60bd5fe317e06c7f48a
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/a5ds.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
index 136105b..fa7d88e 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -14,7 +14,7 @@ EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
-IMAGE_FSTYPES += "tar.bz2 wic wic.nopt cpio.gz"
+IMAGE_FSTYPES += "tar.bz2 cpio.gz"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
 
-- 
2.17.1

