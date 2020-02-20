Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web11.6533.1582211398146757447
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 07:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5bdvt9RH;
 spf=pass (domain: arm.com, ip: 40.107.20.87, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxf+7RO+JQiai5yqgBn0I21N/CjoFy+cjSXveOO1Igk=;
 b=5bdvt9RHT83SFnrNuANk52edXMwaj8q32YjB1fSm0Mw+rXSXHKK35bCAFL70YKto7QaRSjHLx/FpWicGLn1RX4imiVhsq6nbuyAreiIKI3Oxu51rKaHDjpy2iRQ4JzmPtlrDaS9SZxxmCu9z3d3++Wjws+UOwbQYcI16ax6964s=
Received: from DB6PR0802CA0027.eurprd08.prod.outlook.com (2603:10a6:4:a3::13)
 by AM4PR0802MB2146.eurprd08.prod.outlook.com (2603:10a6:200:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22; Thu, 20 Feb
 2020 15:09:56 +0000
Received: from DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by DB6PR0802CA0027.outlook.office365.com
 (2603:10a6:4:a3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend
 Transport; Thu, 20 Feb 2020 15:09:56 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT014.mail.protection.outlook.com (10.152.20.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Thu, 20 Feb 2020 15:09:56 +0000
Received: ("Tessian outbound da94dc68d1bb:v42"); Thu, 20 Feb 2020 15:09:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c0c3e31e5e874af
X-CR-MTA-TID: 64aa7808
Received: from f18f8a26b8a5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 54D4138E-3DF1-494B-98BD-97049A7194CA.1;
	Thu, 20 Feb 2020 15:09:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f18f8a26b8a5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Feb 2020 15:09:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzEHlGL/ME9Hp/Tq4lwSrNXKvp8hNB31z3qGPeuTxn6fM/cb9ECDL7U39ITiIXXZwgcKEKdjYNrpwuS+9F39Oxw4C5K9eO4HaVL+uhkxe4mwEKPPDZrECI0Ax4vpDYAOKWagmmE1iVDveCJzt3NdJSTPzxOdvxASos1TnCjxIJ3RJy49RxYVUJPMD1Fi8gypM0JQwOQ4Pz89y/fPxDDMn//2TR1eKwFeWJw51nZAem/8/E+pR2p95N/ntmYYBK+hOrQSvHGwtWm9rKRtWMlsQIs1Nt5uvx7tu3S+5jfRcSiQSZ9O1xzbxb4KXUMExOINVIW+nTZ4TjgXr0AMAb6g/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxf+7RO+JQiai5yqgBn0I21N/CjoFy+cjSXveOO1Igk=;
 b=B2CtDS617u0C5TESn0z6HCSxFLaO3uk5XQNAKSrlMpC9pSOPGXE3E/K0yWd7Ng6zIXr1fZ4MmDXIY/5NxUYhaZTL+rMM4EPpiK6GFiZFnj5YcjAfffjB8mkSad00uzY7p3uD3SswBVOLO6J8WpRJX0EIJ41W3iVb3XfuXrfbecy2gpk23/wz4oPLiP6VFL0bnQ2e1lE6IU/1D4koEl/YxNBXgpz45q+fd3xkG2unKTXHC+OeIoPTABnTzCxGrwpj5O6jg2SJRarCr+O+QtO8uJ8GC0BCl47OGJqvLHrRcTjf/ylsrze5blFdhHV+/rE6l+8S4MWPhTwEFZbhG4PdHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxf+7RO+JQiai5yqgBn0I21N/CjoFy+cjSXveOO1Igk=;
 b=5bdvt9RHT83SFnrNuANk52edXMwaj8q32YjB1fSm0Mw+rXSXHKK35bCAFL70YKto7QaRSjHLx/FpWicGLn1RX4imiVhsq6nbuyAreiIKI3Oxu51rKaHDjpy2iRQ4JzmPtlrDaS9SZxxmCu9z3d3++Wjws+UOwbQYcI16ax6964s=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com (20.178.118.32) by
 AM0PR08MB4148.eurprd08.prod.outlook.com (20.178.202.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Thu, 20 Feb 2020 15:09:49 +0000
Received: from AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::8c04:6668:2593:d497]) by AM0PR08MB3972.eurprd08.prod.outlook.com
 ([fe80::8c04:6668:2593:d497%2]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 15:09:49 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] Remove meta-arm-iota
Date: Thu, 20 Feb 2020 10:09:41 -0500
Message-Id: <20200220150941.25282-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:5:40::14) To AM0PR08MB3972.eurprd08.prod.outlook.com
 (2603:10a6:208:127::32)
MIME-Version: 1.0
Received: from vm (217.140.111.135) by DM6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:5:40::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend Transport; Thu, 20 Feb 2020 15:09:47 +0000
Received: by vm (sSMTP sendmail emulation); Thu, 20 Feb 2020 10:09:41 -0500
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.111.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: db0828d8-a05c-404c-d8cb-08d7b616f1f3
X-MS-TrafficTypeDiagnostic: AM0PR08MB4148:|AM4PR0802MB2146:
X-Microsoft-Antispam-PRVS: 
	<AM4PR0802MB2146987DAC63F257EACAA7BCF0130@AM4PR0802MB2146.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-Forefront-PRVS: 031996B7EF
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(199004)(189003)(36756003)(2906002)(86362001)(81156014)(81166006)(52116002)(8676002)(426003)(4326008)(8936002)(316002)(186003)(6916009)(1076003)(42186006)(5660300002)(478600001)(44832011)(66946007)(66476007)(26005)(66556008)(2616005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR08MB4148;H:AM0PR08MB3972.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IC2+XRZECNaRVI3LzO4UwR0NCOHPn/IbJXIJfUaEHV4/mN4RiDYwtqRXkUuEFQKG/bGKbLQdpxFN9S7XBKQrX0eG6z6mTyEpdm2o+I9bPwWTy00xm2kyKe4KrGr0Qqu/jj+d1pueSf4/f3RCkQLGHWJYZBJBgHsUIb6X2XfnzdQLtDLD5J1QbgE4Pwyhct4VLNTZnX8CLqS3/lEERzD3yalJs23kL4Kgk7oqi7ycqfAp8S8ovLWHnWQeIhSiUXWMmdySVJ3FHdOr93lN0N6o9bIDvqf06WqigNSwAd/TFFBWjBQneTCm4TKOPombfeH1y8LHhKVGll8Bat47rmE6HCrvMQxwHF/Lm167+R8hKG0O0ChbhRBWMN8kOuF4FrGmE0djsgvu67s5dyDLyPWP/4bOUpc9lGNyzzAMPkmPl/YMBn+A1W8dvKQJozXs5uyCU3qWnvoXxtcUcr8uTPtOykuit8myOvCHNWw9s5bp8tIsRRQqGldkQgRfRD/i/scFMflIlUn2MfAoT1tLGjYPpw==
X-MS-Exchange-AntiSpam-MessageData: 
 vp7jxVhFhLFQj2bgFioI/y/FdlbCZbHPa4OGgLXANRyGU/9ZwL2UIJKpVe0ZcmDlT6RDAWdGwzQafj4l/zfhBdsjMqOobUwCvNXDCi/8sEvWgswVw57j8SonsTY2hHjwpdHK1Kgq8oBGstLDqqzfUg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4148
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jon.Mason@arm.com; 
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39850400004)(189003)(199004)(2616005)(316002)(86362001)(426003)(6916009)(8676002)(42186006)(70206006)(70586007)(44832011)(336012)(8936002)(81156014)(81166006)(478600001)(26005)(36756003)(26826003)(356004)(186003)(1076003)(5660300002)(2906002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM4PR0802MB2146;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;MX:1;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ace5e57-2d81-4326-ecaf-08d7b616ed2d
X-Forefront-PRVS: 031996B7EF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GXNm9Smt1LpfSBKgCzeTFNlkJ6Ia0xrRso/vBupJeGA0T+oaGkSSuvZyGbaBzl3sKl0C5vEIb6xu/sQAjtWIBJLZO7ouJLj3NgLNdaoTRwpSi9DY/+pWWft/dx8rC4s2DhcWy4Wmi+IzAgvcFXtrLUrD2MwMpiExHD6gaqeWaEj5KWHb8owq7iOVYbT09aqafIKypavBPWegLxSwiFIstDlgWR4b/Z0jaqJVPQLGEe4U7aaQGionT9Dlw8JiHNUVSfsZ9klXScEf8thfHDoYTXMA6L5f48HQbDS0OToAuFIIHgxxtwBpWIhxqy6G4dmepv2t6Nlq0OwW+fvGToiuQyEvMYQZHWlXCsr4tfL3wWdugr5volj/o7gHCW6HtA3DXvhGNMB/ANCKmfPCovJdyVkqH3jeeqIcWV3oDnXNtBhllR2euSSmU4Oi+8DKNTEDLRS+uDj6Ue7JEpgKvlulbr1Smg+TaBnemLuiDIvfAt3K9dCGlDJr9medcspvWvRIGoOhkOHjb5/dhNjGD1OAQA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2020 15:09:56.0980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db0828d8-a05c-404c-d8cb-08d7b616f1f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2146
Content-Type: text/plain

Feedback received that it is not acceptable to have a distro layer
inside (https://lists.yoctoproject.org/g/meta-arm/message/6).  Removing
from meta-arm and will create a separate git repository once that code
is ready.

Change-Id: I74d1083341d90caa038c1bd8c1d53aa565d28460
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-iota/conf/layer.conf | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-arm-iota/conf/layer.conf

diff --git a/meta-arm-iota/conf/layer.conf b/meta-arm-iota/conf/layer.conf
deleted file mode 100644
index 392ed9b..0000000
--- a/meta-arm-iota/conf/layer.conf
+++ /dev/null
@@ -1,13 +0,0 @@
-# We have a conf and classes directory, add to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have recipes-* directories, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
-            ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "meta-arm-iota"
-BBFILE_PATTERN_meta-arm-iota = "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-arm-iota = "6"
-
-LAYERDEPENDS_meta-arm-iota = "core"
-LAYERSERIES_COMPAT_meta-arm-iota = "warrior zeus"
-- 
2.17.1

