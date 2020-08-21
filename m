Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.61])
 by mx.groups.io with SMTP id smtpd.web12.133447.1598017873390552350
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 06:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c4MntfRS;
 spf=pass (domain: arm.com, ip: 40.107.6.61, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYo62Qi1hNu7doAvpcPqHk6XrgxphWGlW1G1+vkoqCw=;
 b=c4MntfRS4jURwKHCQn1vqZVHSlosoIBNYhSRitsLjQtmIpTrqfQ5OO3He5Ms/YRX01GFErPPn+Snp4swDd9p773dawjHpXSUnONxr+AAHdN/jrM6sH7iBLZ7aA34op7JMko51NQGsnrkidUC1wjtMbnB3932M7l/oFWMMdk1wD4=
Received: from DB6PR07CA0200.eurprd07.prod.outlook.com (2603:10a6:6:42::30) by
 AM0PR08MB3218.eurprd08.prod.outlook.com (2603:10a6:208:5b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25; Fri, 21 Aug 2020 13:51:11 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::9b) by DB6PR07CA0200.outlook.office365.com
 (2603:10a6:6:42::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.10 via Frontend
 Transport; Fri, 21 Aug 2020 13:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 13:51:10 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Fri, 21 Aug 2020 13:51:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c0a30a2ff16bfb72
X-CR-MTA-TID: 64aa7808
Received: from a39ffc0e99b6.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2962CCE7-C185-4D31-8657-827BF0712D45.1;
	Fri, 21 Aug 2020 13:51:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a39ffc0e99b6.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 21 Aug 2020 13:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kP/1hmpoQJTQ5aC9YVlBFw4uQzrqdU6faTU/TP8XBLcTpYuwNALBkHoq1HhGHy9eDj+hSggLhrqYqSNyEonEPlidXpkvKuoN7LbuLH0bQ6gunfCobooV+svs7Iy7L8q1o/f4BkvJOMUHVg5Ou+dPNqDz0xiNj8W6ug5/GcKgzEutJD5iZ+cyx39EBt6xOqXK2/kv2IZSzo//dDi+vgqCTjnZs3Jvn1OdoE0sxu6VmZsBPENEq+WtQloaIgovcUo7K1x5JmMrFu45Fc4Wg6IwKM/+c776CyAbN6vQPqDlkXBfAzm7JwGpUsRJOEDHs4zG8CzGjZCozFpugR5QbMjqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYo62Qi1hNu7doAvpcPqHk6XrgxphWGlW1G1+vkoqCw=;
 b=d6U8F2czXKwYxMAhyX8hCWf6pLhIPd90MibD3GQcX6qo/Rm/JB4dCoS3YyjsuVho/FuUGbsaQCj9XLywLWhF6gXeK/gj3Yyve3zJW/ubD7hY+538zdQB5R0/T6tGpi8Sy60nFXPs0t/ftHc5TRJNfyxfwnv78ikCTqfoeU0LIMWlc8VMDzx0RCjl5qhyn3aKmVcY2Q81bUi6EgJ1W80Pu1cTZpsQalJO33mSbhRpwaycTTbuvQsTMr6qumqstrUD4rfnfvOeR9jvcRXt6+S9jvXE745GUyw3j6NAPaw0X86o81Ndhk/0mAPxn9/bM40Voreq4zp6mIddnMNam5riYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYo62Qi1hNu7doAvpcPqHk6XrgxphWGlW1G1+vkoqCw=;
 b=c4MntfRS4jURwKHCQn1vqZVHSlosoIBNYhSRitsLjQtmIpTrqfQ5OO3He5Ms/YRX01GFErPPn+Snp4swDd9p773dawjHpXSUnONxr+AAHdN/jrM6sH7iBLZ7aA34op7JMko51NQGsnrkidUC1wjtMbnB3932M7l/oFWMMdk1wD4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB5441.eurprd08.prod.outlook.com (2603:10a6:208:17d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 13:51:04 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::11c:52aa:c2da:5ef%4]) with mapi id 15.20.3283.027; Fri, 21 Aug 2020
 13:51:04 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH 3/3] arm-bsp/trusted-firmware-a: Install dtbs from the generic TFA recipe
Date: Fri, 21 Aug 2020 19:20:24 +0530
Message-Id: <20200821135024.25615-3-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821135024.25615-1-khasim.mohammed@arm.com>
References: <20200821135024.25615-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: DM6PR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::21) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by DM6PR08CA0047.namprd08.prod.outlook.com (2603:10b6:5:1e0::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Fri, 21 Aug 2020 13:51:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3661ec09-adde-45a8-197c-08d845d9432b
X-MS-TrafficTypeDiagnostic: AM0PR08MB5441:|AM0PR08MB3218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB3218012545CEA85540124E58FA5B0@AM0PR08MB3218.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8Dp6h2J19CQiA2Vozd7Rcn0K0uzyxIloZZUMoHBdiDgGGrkOPOibjpOYV6YTd9EjkalEbl8/6bvX0nbUB9kn5fnI1OvbK5TcUaOsDhkN/yUCfyUHA59Ra4JSHUV8Cwl3ezwqEpFU5QHhzPIWpCaNpE9LJorR0bM7ATyPUq1IMZeSP2l08JKbA8LGhjVmwb1mh5v9mNMEGLerEfyodxdDiqBmE9+LzLNF7zkSmx3Xsild2nohcMfHAdPQ98MaRUrEMxzVM+Div2nud79vovciVQbuN1Y5quMMLqO86Qu+17q3UeOKoCeLunPuQsbjvrPUqLlpqaq4BEtr71/mvoccxNm4+es5tfkCN2SzATQ/BUU0IZgYBwKs2C2794qAStDRdCQ3deYRvTPRSDQAKyMHBQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(956004)(16526019)(6916009)(2616005)(1076003)(66476007)(36756003)(86362001)(66946007)(8936002)(8676002)(2906002)(4326008)(478600001)(66556008)(5660300002)(316002)(6666004)(186003)(6486002)(83380400001)(26005)(7696005)(52116002)(41533002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 amvxwBVhbbaSyeAnJosW+ofHkU7YWqBrV2TvhrxbwSKzqBvMeDuGIel9fk/73jcKZkbI74BuSqjuNaYFJHMC1Z7r/JoPeJfrTVego7vzjCuUlPGgojDtRw8kTzz79kMSCCIok21jzapoYoFZK20Ip9o9NMsexC/YItCw5HYD7EMjGcSQpUGqk293apaprsfIr7f0mb5DdCeI497BIK3TEYR2vXHMmXo6fsPE3sXoa5YEhPZvxM1O6sxYA9vSDnwqL+i0GA0W8BUMuTNRz8KmzgIl/y22g6vIaM/CFwFwsVHT7c+KYD5inobMHWPLIkjIvjQRs+NHkNcrfMmxuVuDgPiEoT5ndA+JH3dkRShcUfBrMYPhDaoS/UpFYrJUVLJu9hHAb/r+zJlR/4dT0+ywhOhAE4Rdjz1jYn2v1+q2iIkjJvYMVyf4tsb89r9JlfSZU/iKmnfywvjtBjI2BCmpj9l6uwysnV+kE95VDYCRl8AWry/+lHdFhmi9y1jh0EteoZfDuFAJKH85azzVOiM4LgQwPDhko7aEFDnfWgRjE8XhNJq7h9qVJicYrcMiVfkCGp7paAK9Qq9HGMU6zjNoQm2uUy5TaFLu4UUYNeVxuSrpxq9BuRm67BdEjHElBGMO3VmXz1nF1mVzf1XrRPTOrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5441
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0b9259e3-8e22-438e-3cda-08d845d93efa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H9JfErH/a8fGVRYIN5Emy7DFXLDSlN1GnUyhnUBqbOmg+4Lic1ufSBVGzCu5Y4GxG5+VMBvN90WurdH/2tCrCaB1bO7/LLRigkpPSs06mA66HeMFs4XyfisKDWZQyMV1SUYxXyiOXtqhU36sjbx74rRZ4yp0GQZxDVV7SXHL3bCPM1BA6Gm04TeyXs0KOFSYPYQSNGtsulfnBuOw6zQYpZM4YucF1RmmCZGVcHVejKti2Sy8nJGPbAt7Dp05ba3Jijfu/Rau+H+xeIvKZ/yyWxyDPH/G6j4DRv3l+MwfNOrxR4jC/X/Lc+NkA4rp2ywRJJsb7CvGxO0YT8tI2mBR5HAtBFbM1TkAzf7rdGgFeHx2HzoeFcb0nWfVgUNqhHh3G1uYVveSmxlStAEah0rHXKEGgYP0ggEZG3WfYCveWoTHCWBMaHjyVJ3JiRKJe8bG
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966005)(47076004)(82740400003)(6486002)(81166007)(82310400002)(6666004)(83380400001)(186003)(26005)(356005)(316002)(7696005)(36756003)(16526019)(2616005)(336012)(956004)(1076003)(6916009)(8936002)(4326008)(5660300002)(2906002)(8676002)(478600001)(70206006)(70586007)(86362001)(41533002)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 13:51:10.9983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3661ec09-adde-45a8-197c-08d845d9432b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3218
Content-Type: text/plain

Configure TFA_INSTALL_TARGET to multi-chip and single-chip dtbs,
avoid installing dtbs in platform specific recipe instead use the generic
step.

Change-Id: I79835f2c4f4d0bde938e43d6cf59f73392520935
Issue-Id: PLATFORMS-3971
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../trusted-firmware-a/trusted-firmware-a-n1sdp.inc         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index c26cc78..84657ce 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -3,6 +3,7 @@
 COMPATIBLE_MACHINE = "n1sdp"
 TFA_PLATFORM       = "n1sdp"
 TFA_BUILD_TARGET   = "bl31 dtbs"
+TFA_INSTALL_TARGET = "bl31 n1sdp-multi-chip n1sdp-single-chip"
 TFA_DEBUG          = "1"
 TFA_MBEDTLS        = "0"
 TFA_UBOOT          = "0"
@@ -14,8 +15,3 @@ SRC_URI_append = " \
 SRCREV_tfa = "f0b1864f8e309a41d2eb1c9510f8cd3c7aacbb1d"
 
 PV = "2.3+git${SRCPV}"
-
-do_install_append() {
-    install -m 0644 "${BUILD_DIR}/fdts/n1sdp-single-chip.dtb" "${D}/firmware/n1sdp-single-chip.dtb"
-    install -m 0644 "${BUILD_DIR}/fdts/n1sdp-multi-chip.dtb" "${D}/firmware/n1sdp-multi-chip.dtb"
-}
-- 
2.17.1

