Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.76])
 by mx.groups.io with SMTP id smtpd.web11.16184.1601650195993881077
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Oct 2020 07:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=a+lLV9u0;
 spf=pass (domain: arm.com, ip: 40.107.21.76, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opRSTHofvJk3Bbv6FZduLSc1Gs0UKzJylUyrfjOAOpI=;
 b=a+lLV9u0EJX8OVJXGZrBTrBgoGtM2f/V6vapnRlElba1ObpIJbmjnYcNM2qSExsZJjBsyS/qUF4gzHFwUTC6P2peLRNaxiTEP/Mh22MfZyHlOeBHuU0OYleyToUcEG6lgBS9lZaNfl/Pn5Eo//kgvORRFnuUO9Eav7AWkOc3WlQ=
Received: from AM6PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:20b:f0::49)
 by VE1PR08MB4800.eurprd08.prod.outlook.com (2603:10a6:802:a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37; Fri, 2 Oct
 2020 14:49:52 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::bd) by AM6PR04CA0072.outlook.office365.com
 (2603:10a6:20b:f0::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Fri, 2 Oct 2020 14:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:49:51 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Fri, 02 Oct 2020 14:49:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83d8514516dd5be5
X-CR-MTA-TID: 64aa7808
Received: from e41accb8ccc9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5ABEF26B-C32E-49F4-B929-D55BDA1A4440.1;
	Fri, 02 Oct 2020 14:04:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e41accb8ccc9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 02 Oct 2020 14:04:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6EhtMKFGxsLeh+eE1KUF6NUoJG7FtvnSt9ZwzSewfd5yLpXRvmpflFRWgFc+8tAtSlfX5u8IrwHvmCmPyHAf/i7qDozGKpOEFWmMp4VynGOBHPzkEqR7IfYo6vA3xAz5OgUTDPV1gwnToxhzmDI9uOnqkmttKa9P/8r2XfX9EsNIeNdjZ+WO+MM/Sq6SwEvTqL1F+06tcYA2XU3R+TfiqYIlQQ+N1DnYJgbNWtEA6MwIaIh8rEUZdsXW3QDksRz6EMuKx2vsuICOKAW2NmezEAwCP3mvArZN5R/1YoW9VTMlgsaqJxRoHLeLtZzrhgtYZ5/pUT1UqL9mbjJMVrkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opRSTHofvJk3Bbv6FZduLSc1Gs0UKzJylUyrfjOAOpI=;
 b=HS7FticvxT8cvsQnkswbE0q09SRXddilIEpb3hgJbpwDrzb429Cc3yvC88Lmr8xgjUbRtebN4Jfad6NvnwiDPl9MgrP7cHJxJ888M4ft5qa75YMsKohw8ohZ0q9Vn0TXFu32bN/daqTJAzzUrfYUTyz3FC6axE+KzpxAzH/2o42rSM840IRravcW5GTD3zT+PrqIIXhnVLCGVZzmCGP8o3Yif2fY0992GAIvb8dcjqkXqsCbVibAjaZlsiM7V7Z303Ns0sxUKJwvaxcEUAJcKInNLjKIMH3qdBtGPsYs2Wl+0cS9tAgQ6JUijndl+XvIHsFAKyzN0B1UfjTuiOrS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opRSTHofvJk3Bbv6FZduLSc1Gs0UKzJylUyrfjOAOpI=;
 b=a+lLV9u0EJX8OVJXGZrBTrBgoGtM2f/V6vapnRlElba1ObpIJbmjnYcNM2qSExsZJjBsyS/qUF4gzHFwUTC6P2peLRNaxiTEP/Mh22MfZyHlOeBHuU0OYleyToUcEG6lgBS9lZaNfl/Pn5Eo//kgvORRFnuUO9Eav7AWkOc3WlQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR08MB2764.eurprd08.prod.outlook.com (2603:10a6:7:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Fri, 2 Oct
 2020 14:04:21 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::edce:70dc:41f6:a3f3%9]) with mapi id 15.20.3433.037; Fri, 2 Oct 2020
 14:04:21 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] gem5: remove reference to meta-arm-platforms
Date: Fri,  2 Oct 2020 10:04:00 -0400
Message-Id: <20201002140405.7896-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002140405.7896-1-jon.mason@arm.com>
References: <20201002140405.7896-1-jon.mason@arm.com>
X-Originating-IP: [136.56.1.171]
X-ClientProxiedBy: BM1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::15) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from vm (136.56.1.171) by BM1PR0101CA0053.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:19::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend Transport; Fri, 2 Oct 2020 14:04:19 +0000
Received: by vm (sSMTP sendmail emulation); Fri, 02 Oct 2020 10:04:12 -0400
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7b9b161a-7278-4f2a-36b3-08d866e26b3a
X-MS-TrafficTypeDiagnostic: HE1PR08MB2764:|VE1PR08MB4800:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB48003981E6B867835F693853F0310@VE1PR08MB4800.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hNR/LHk6w1N+Cdl2F8Vqy3Tkx8RWI4JpBU4DHeokRy1HMiROggd3f56dPY3lgX/Xfw0LWkFqQElfrR8bFekwVl3ab6Qo80TuJ0yirbEcY+qgu8S+0mYUJw3QLtqVTpnvyXwxg45y81qCWpL9hQUQEL9v7IKdTUqrCSyGQ3QbDw7f6YSGsooXit70VY9j4lbbTxY0XBxvA4n1QdJh8KppEbLwS0wGxP9ALy43K6SP7q+f1mjQjpXN25Xw1kUekASPpGk5lW18awq4KUK0K9AAq3GnYxw0fWjI0NZRRoJzK/5cWfofkoYYd/nWniJ6bX0BYQPN1XI8MpKVF+TXZPXS3BTwjmmOcAk4fDjEsF2lNvp1n3DG9XPYdSggIcCqXvNu
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(186003)(4744005)(26005)(1076003)(2616005)(44832011)(6666004)(426003)(66476007)(86362001)(66556008)(52116002)(66946007)(36756003)(5660300002)(8676002)(6916009)(83380400001)(478600001)(8936002)(42186006)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Lk8krmVa8ZhUJkxZaw5CFHzlwzcRK3r2U9HCfBoEPfOUSW2w06FikqC0hoYO16r/XmwCaVcswI6OLWG86uOrj7MENt4p/pLtORX0zlo1atOxkSrRHBzOWYrf0WOJy7k1J+86Mks2BeLqCf69DLZ4JtcNKwIpYk8OnUZTOrdRQw3zyb2pbobVd0wycKbviCIQpZl7ANF1+Ylq9i4g6z2lgD7NoSa3VOpa8jLhx5nR3tLZJ7jWuW2FrRtkBh1ysQRNn/3Lbd5G4tmaBUfRJlq+mlbKKVByvaSMEyeeKzir+mS35GcpASvRrK0OJEr+uzO9Bke8zsztNGF6Clli7gXobCpYqGrYPKKhzyrXK0vbO/03wTyHrc7S3s78u2+tbHATAv3WA8qDIdQPtzLyrvNaDh5JkeK87LOHBSycVbPfsgU31aJEXBhewGa5CsNubwKcUycmtODg6TFnoI5dR11WDUFV8ZnVV8FqCCl2liN4mxOPWYJO2FZlsv0ABCiVaFukAe3uo8nn37HfInZBSJXuLYrf7/boYOmRHnleeRRquCBDmXuLMVLM37F5FvGIq7ETK9cXpCkTwIlD4nvj2Ukn8c6+zf9mXYCpS87rLQmOPatnOEIMPDhEd3adrKfGZwAdHWp+dyOPNf//ODc5WITvlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2764
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5598fad4-cd5f-4685-93b5-08d866dc0eee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l92ZJNWaqEOEBUh7XzQUzDf2XrdZyIx5gBV9TginKGFdH70A0f1k7F5l0mceb3qpH7uoDL/2WLGYaWyVRA/1qm1zFlKemiVqB6rHazQnzMi0lUUUcsbO8M+trg9SSoPt5yvKEgV7nj58uApohiDE6SOGCMVAtpcmY5IHdQXuWpofLC0+CRnweUTVgo/tiT39FVOY9pOnk+iXTeT9U37gSwDmmPOSRsrlxmHkQkzBDBYZnwpk9TqsD2vsTSWZUaqEP6m8pOOoHI9Y2jjRkEADZJz97dHlxU0B0pE1A3uLhZziaUR6ds1SXZBTskSxMYS0EGLmb80d6OkltFoiXjBXJ9ZT/CM1Yk0gQLrRIitngycC3+Xb+LZ8XkRRZ3TQNsHn0sI3dKCemVzK9yDTUZ+mfA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(478600001)(1076003)(44832011)(2906002)(4744005)(36756003)(86362001)(6666004)(2616005)(186003)(6916009)(42186006)(82740400003)(36906005)(316002)(426003)(336012)(356005)(81166007)(82310400003)(47076004)(26005)(5660300002)(8676002)(83380400001)(70206006)(70586007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:49:51.9355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9b161a-7278-4f2a-36b3-08d866e26b3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4800
Content-Type: text/plain

Change-Id: Ib279545916b7da00b3d74b58464fd35f511bdc11
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-gem5/documentation/gem5-arm64.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gem5/documentation/gem5-arm64.md b/meta-gem5/documentation/gem5-arm64.md
index dc305e8..caaa422 100644
--- a/meta-gem5/documentation/gem5-arm64.md
+++ b/meta-gem5/documentation/gem5-arm64.md
@@ -1,4 +1,4 @@
-# Gem5 Arm64 Platform Support in meta-arm-platforms
+# Gem5 Arm64 Platform Support in meta-gem5
 
 ## Howto Build and Run
 
-- 
2.17.1

