Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.80])
 by mx.groups.io with SMTP id smtpd.web10.12368.1600338179887982986
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 03:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LhCfY4fD;
 spf=pass (domain: arm.com, ip: 40.107.12.80, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OY67JsLzDGzFYDQpsCGRmMvm1c5BzHnSDXNXjdwhFLw=;
 b=LhCfY4fDbY/W4/uvLBz7r1gxr/bLoxiYAR30v5ADfOpBucRvifZIhr0Ek5yMMxk9oQ3GMp5XLX7NNoEiJmLs+PCEoyzzDVGW/ew7NlPSe0FN7zw8WyVr3/7dT1Kto4uW4Kc6xb3OpMHdJpi310KSs6I36Z5tNDiylqZ0JN4Ay+w=
Received: from AM5PR0601CA0026.eurprd06.prod.outlook.com
 (2603:10a6:203:68::12) by PR2PR08MB4730.eurprd08.prod.outlook.com
 (2603:10a6:101:19::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Thu, 17 Sep
 2020 10:22:56 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::91) by AM5PR0601CA0026.outlook.office365.com
 (2603:10a6:203:68::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Thu, 17 Sep 2020 10:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 10:22:55 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Thu, 17 Sep 2020 10:22:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf71a38d89b46e92
X-CR-MTA-TID: 64aa7808
Received: from e60ff2632fb7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5FEC8411-1C4E-426F-AC8C-66DE1756E837.1;
	Thu, 17 Sep 2020 10:22:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e60ff2632fb7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 17 Sep 2020 10:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDh6Y5HlepWIHCJ+wq4Xt4frFUDDO+hmbNQP8UGKKuELHfvfEmwv+RPrduyKGvq82o73JNy5R/d1qcC57c9gXKYU4cMtuOY2XadH24R5msFEFj+awjNrFZi3YrqfcYZ3YLXeCHc42hMT+vTHRhJdQbSvvuLWTm+/JJLSP5ZyDEqkur6DOoDrk12b5bmOlHdV02JDleDPcNuopLHEbGu0Sp5TxFw1blfSvW+ocpSO/M1WB1da12wFYDrb14rdosCUYF2cz4TCCdRzZko27ApwxJOgtyUXl26H82y9VMsuOLtU1VsbKpbHmRC8YFEKdGu8xrwh9cecb2oIdivKdn+YUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OY67JsLzDGzFYDQpsCGRmMvm1c5BzHnSDXNXjdwhFLw=;
 b=H6tXMGx2KLYqU05F9JINyy863HR7Ttty4SLD13ueM4fgUEm2D7xVCu3jsfjGk9YeVwTc5OMPSW/KebiX2B1iQHZ41uhGlXOWvkKgHkSZJcKfSgjTTeTHBOoF3O7L9L+pLJBMaC97oaPyuKv1VZlizeU3gyhe73v0tSoA9cLkIDr+2wlfyZX5BmRdHbFfZhK59xhNDN/aMrTAlNp3t0svRL8kCGoje5gnHRzGkYu2J/RLet9j8DA/qm1IzqS6JNjbtH4kEQlDn/ithBg4EefHp/RWZfzKQFaHAmrCci1+PNBdF4gHb7WZ2b4rRwesmALzFsgDhZaB8YrDzvAzfmsgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OY67JsLzDGzFYDQpsCGRmMvm1c5BzHnSDXNXjdwhFLw=;
 b=LhCfY4fDbY/W4/uvLBz7r1gxr/bLoxiYAR30v5ADfOpBucRvifZIhr0Ek5yMMxk9oQ3GMp5XLX7NNoEiJmLs+PCEoyzzDVGW/ew7NlPSe0FN7zw8WyVr3/7dT1Kto4uW4Kc6xb3OpMHdJpi310KSs6I36Z5tNDiylqZ0JN4Ay+w=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5528.eurprd08.prod.outlook.com (2603:10a6:20b:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Thu, 17 Sep
 2020 10:22:49 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3370.019; Thu, 17 Sep 2020
 10:22:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy/xenguest-network: Add kernel-module-xt-masquerade to RDEPENDS
Date: Thu, 17 Sep 2020 11:22:48 +0100
Message-Id: <bb838dbb3699c6ac5bb974cbe2290a6f3a0d4a6b.1600337921.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <03e382df593695bc5878f5822dc2d378e1ab416f.1600337921.git.diego.sueiro@arm.com>
References: <03e382df593695bc5878f5822dc2d378e1ab416f.1600337921.git.diego.sueiro@arm.com>
X-ClientProxiedBy: LO2P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::36) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.53) by LO2P265CA0288.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.13 via Frontend Transport; Thu, 17 Sep 2020 10:22:49 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 625b1008-fd39-48a5-f525-08d85af3a4bf
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|PR2PR08MB4730:
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4730E56F3D26142CA9532427923E0@PR2PR08MB4730.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:669;OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NSHREg3GT7hz9zh0uoPQDfk6WJFEDxVyfswvAH6PvwKJf6iGOwbB+hqvWFQg8uKqHAN5kO2PpgPv9ZTKuFBJF4KkRB4uDopLz/Vgndi5LXZhIoozouXCY7Qyv974x42GxB49lJj4AMFtS182gAabIOXbXCzWEQI+79/YPoa5a40wxfSeHNst1T1cDbPa6vcVXKjuEibP46W7hBmh3vHz8jAWDK8Nvyp9UyCorNn5QC0dvT+5dp3OTrgTy3CbBMDZ24tLi6Ri8C7DUpqkcSs1NJM5BV9ZhirCV+i0VdKNLVpZ8MARJ8Bm9QEn5nzSZNDTc/5eBoPC6eF1eTdsd6iezg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(6916009)(86362001)(26005)(66556008)(8936002)(66476007)(186003)(4326008)(2906002)(66946007)(36756003)(16526019)(5660300002)(4744005)(478600001)(316002)(956004)(44832011)(6486002)(52116002)(2616005)(8676002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 IccV9IBWycfE0uvaLikYx1BxGFqED4c6kSvp7Rj5xDrbKittqxyAyvDC3aaN2/68Oh+4phZsP6XqJWPD6/QrNDRAKOqDybZWUziJ6yQL6O5Ir8qkIkuEOWcQyZQmJv7CkEdmuW2VEBpU4OreekILmPsaopPk5qlTlXm2rDBX0LkKoDxnzO4MiEOrG+IbgsdS7vinlEIb+PDog1dq5qIVqUouwk8QQqflOWO9XaAtdmqZbfXnuTIQW/Lee7SHGUCEQDHgla48a397Hm0kSslALucA8D/m9VQmdd6y8n5M28K0cQbXhWy8D+hEjpvswHwl1l42OlF7Z0mFO72lfBfU7rHZ+Q5tgcRBjWEUCQCQfy2oGLIxt/sey1fwaFuK1MnyF3HLg7N49fr013mLt+OdVbuDOGg1dlig3mys42CHySOQ6QjpYx9RImcfHS4iQw2yd+bPJhYExKGd9kWWBEV8rYRBIgl/7bh7a6uEHGqbeQmaiHguExc7KE6GGCTYI4c7cT/XXS++hYgaQDFipxkD3ftxClfO7lxk8NsXiPsnmsgVQiai2RciuqvFts0dKc+ajqEq2VJPb6aa+YRg9zlD800E0+q3LIIb8tsAB2O01YzH3KqRo7BDkGcTWHzLcYIvumvZplICb7B+oo7T68VH/g==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c232daa0-7324-44db-1ab8-08d85af3a0bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UnXOAZGHrsbkbvzqlU6t993TeJtrtYEEgGcrkRcXhEnaDK4ADTg8WTJYo62hIXCJbDpNiRmu7TjF+dQeHeMZfqwLGVbUhBBDLbGITSdBGJw/bf8IGAzipf6FBKcSpQbvYcEphnytw/RWa1FkvfYMlPugB5AEsKUnGB4ZHuufMw9P7r7wrJ3v6EzPj8+fOwYGewo3RXn9fUhKAo4nvubwAxfWncSEDfY7sSq2Z+Ju7l/KnkAp5w8i01qX3+RRMvjIOdnAJiWIaB6Beo1lJV+LG/kYHUDiJuXIcEq27PezzDFqSQndtP5txueVPGq/UrNed0skNIxlkD2M6F/ehsM0CmnFlPC0VFKmk66KSNrnUz3VcQYA/0tVgn2HK3gUd236Ddwk4N1Tp/UfyX53OOXBaA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(478600001)(70586007)(70206006)(36756003)(316002)(2616005)(956004)(8936002)(6486002)(44832011)(36906005)(4326008)(47076004)(7696005)(356005)(81166007)(6916009)(8676002)(5660300002)(2906002)(82740400003)(4744005)(16526019)(336012)(82310400003)(86362001)(186003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 10:22:55.9432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625b1008-fd39-48a5-f525-08d85af3a4bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4730
Content-Type: text/plain

Newer versions of iptables requires the xt-MASQUARADE.ko.

Change-Id: I243365b8e1819407ddadc6f021704b867ab6dcf5
Issue-Id: SCM-1065
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index 206a294..6442687 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -63,6 +63,7 @@ RDEPENDS_${PN} += "bridge-utils \
                    kernel-module-xt-physdev \
                    kernel-module-xt-comment \
                    kernel-module-xt-nat \
+                   kernel-module-xt-masquerade \
                   "
 FILES_${PN} += "${sysconfdir}/network/interfaces.d/xenguest-network-bridge.cfg"
 FILES_${PN} += "${sysconfdir}/xenguest/init.pre/network-bridge.sh"
-- 
2.7.4

