Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.81])
 by mx.groups.io with SMTP id smtpd.web10.5405.1617191680358891248
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 04:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1Yeo0WJX;
 spf=pass (domain: arm.com, ip: 40.107.14.81, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xLryu9rFzMThww6VWG0tAv+2u86mIwQmfMW4sW4oP8=;
 b=1Yeo0WJXw5V2uGijQ7Z7RnCJoHi2aeAwgugcFgRZieQduIWunLKg9MV2X4sacBEhLMiKm4gAvxONyR66gGrq/hywWJyOyN/40pljEJA83DiNdFI7HceoToOYZlHyqwhZlShu2m5QBtGdJvv+WLQGcEFvH85ROBaPfsiR+zka9AI=
Received: from AM5PR0601CA0066.eurprd06.prod.outlook.com (2603:10a6:206::31)
 by AM0PR08MB4370.eurprd08.prod.outlook.com (2603:10a6:208:148::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 31 Mar
 2021 11:54:37 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::b0) by AM5PR0601CA0066.outlook.office365.com
 (2603:10a6:206::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend
 Transport; Wed, 31 Mar 2021 11:54:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 31 Mar 2021 11:54:37 +0000
Received: ("Tessian outbound 9681ff6f21f7:v89"); Wed, 31 Mar 2021 11:54:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4dcdcdb33df6a49e
X-CR-MTA-TID: 64aa7808
Received: from f73491d59770.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 34C6D113-C67A-486E-BD02-49AA0FC3CE11.1;
	Wed, 31 Mar 2021 11:53:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f73491d59770.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 31 Mar 2021 11:53:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdWVKDx326XN3y8cOLXW/1OuumYCzhwPViR6ii5Z3nXWYUayrshIzFZyOMTuEUZQS+AWe/VgMHDJ1nfGzHnpai2erBRK40Se/NTcjOmGB0+RgGFrly6G5s2pAaAGHPoYJ+9tckvePBbyWIWtVb3xjfB1wlqXICElZVDFNv0DpPNfEYcjNyJK5hlKBsnOmZy/dVYxQPNRcp/Jt36tUmapTaHc+mXP/BuuZrxXe20lPrnXMRso+gJAuNGbKxabELx+Qpjaq9aLd9XKeFXfsLikf3V9LMsbflR7DAdxwKYJkEMtyDrYyECR/PViAyIkXMWM7xf8+AGUAoa5gZbxvgOYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xLryu9rFzMThww6VWG0tAv+2u86mIwQmfMW4sW4oP8=;
 b=NXcCjkX6j/KRD8VWLipypXfTPMvUBoo7ooGpqvNbOxznzCptHfVF5viccfxvlk/ue+Tjq46qPT3SwYg4/K+3rYq1Y0Y8r7Nqk2VjXc1SvsID5B1robMQBSVUzBNQSthV1doY2U34rUYLIL7Z4s6upiabj5PO08CvGyYn5NmsT2uGzJuokMrU2yKC3/x8Zm2Bgt0n2ikqdA0suQO6/d2DJKETRSZw+d2rAB0Lwh85X/DAEOoJP/jsmlsiCW9fNktpxLInCfPM2ntYudhzeNs32XtHBpgIR3rNY0IwP7t22RwFE9Wx+y+0c52LDof+D0WWOtAK5h1enwj9D2PSqqMrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xLryu9rFzMThww6VWG0tAv+2u86mIwQmfMW4sW4oP8=;
 b=1Yeo0WJXw5V2uGijQ7Z7RnCJoHi2aeAwgugcFgRZieQduIWunLKg9MV2X4sacBEhLMiKm4gAvxONyR66gGrq/hywWJyOyN/40pljEJA83DiNdFI7HceoToOYZlHyqwhZlShu2m5QBtGdJvv+WLQGcEFvH85ROBaPfsiR+zka9AI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.31; Wed, 31 Mar
 2021 11:53:56 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 11:53:55 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/6] arm-bsp/arch: Introduce support for armv8r64 arch
Date: Wed, 31 Mar 2021 12:53:43 +0100
Message-Id: <7282be0b9e046674e04043c3559fbe6213440eb1.1617191477.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
References: <5d95eb725891888908595bb02de7cdf337b62f07.1617191477.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a5::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend Transport; Wed, 31 Mar 2021 11:53:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 515c6ae1-e30d-4df9-2964-08d8f43bc249
X-MS-TrafficTypeDiagnostic: AS8PR08MB6536:|AM0PR08MB4370:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB43701B3ADF87D5050F953048927C9@AM0PR08MB4370.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YDIwG+qQfjd1Tvsuj/722Tl3N6wSbk9Df6yx20gUEl4ZuvUKl4VGtVwv1EGX7r4E5hB4SalqSiHBY+pAIjMj/cDwJ5bVrjEIl+XPYuWKqq/phg4BH/QT3HssrufHgUeFzqImJig44LH7tMApyZdhjePn7udfCIfg077rwqOL4vxfD5NL38ExlDnf0G2kRsdiui+ldjTRTOxrFPXgLWRNufgQJfBdFDuL7+U7Woi6xK3o7YnD1002EcOGQMKGrsh/TiZUxsS+tUPFGTvA2+xdJFhS3pVWgylkE+GF7DJl+3EvNDRda0uA4khZOuzUx1ftWCDaGQGnMXYYBGab2Oxu5IKxGUHThIFGWYUoXe4gD30cBU36EnLTXwL54Lk+afhyrlCsSACgVLMzfm6xB2oeGcj0jrt9uT6dIKtMNfo1Zd5EJZjPdTFOfHUf2WzriYwrtqAd5ifR0/wyuxQAbEHmWaQVMvjQ7RO7mf7LwXvAelHBPPSYFy/k2jVGPIUeJ9I+0GwhpkZAHzwISSgqhxBM5dx0rmnh+4m0I8Nh0EevlJCzgpR747Ug0v/Ob8HjOzBcydFRj6YedBoj/sodOXrhMyg+Des/pO2ZWVOCQAplPv8UyAWKn8729/sEec8xWYXzmwGMM9Aal6c9IV/BLONt42Kxd6Dra0/I/i+IC/xmC+U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(6486002)(316002)(66946007)(36756003)(186003)(6666004)(86362001)(4744005)(2906002)(7696005)(5660300002)(66476007)(66556008)(26005)(52116002)(44832011)(16526019)(956004)(2616005)(4326008)(6916009)(478600001)(8936002)(8676002)(38100700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?nehLkOtjjRgFi78wSo21EuEspfXfbaga9d0As8m0mgbS1WBMCRRCuqKKvAJg?=
 =?us-ascii?Q?dQCEYY6DSMCHgXWiaQiyVCTk+3316cqsz5J1X5ZwBv5Gb0JMYJT+l9TXyr1W?=
 =?us-ascii?Q?S50NGlkNq6obdoVbf+DqJhLvO48SRUGB5puVzXt+ShNHKNkYkl3E6ptN9Lj3?=
 =?us-ascii?Q?1JhWsNcy9Q0S5a+AQHbavXhEP1AUGQCIKUbTsQL0ZrU3TG7l0ywlvIZK7tz8?=
 =?us-ascii?Q?eNP8pspdCSVAaLyXciQ7CqwDe7Ph0dnFpj1baUu9F+d6r4bFIfUjA9wwB66S?=
 =?us-ascii?Q?CiqLDGBUNApJdd7FeeT9JVIYKOe/lUL170liBEM5g2MIIZ0Dj4p88rmqnUBt?=
 =?us-ascii?Q?mkKH6IDGh1dB/2WQJnr+Ebfcy4ltywnDpqPyWxnWzGYK6YHrDWDizT7aEQEH?=
 =?us-ascii?Q?qWtENo/Ob7ymmNQIIqzUy5UUNU2vZsFmM8gbx9lzlgIG+c8YVJJMWUH/RxXb?=
 =?us-ascii?Q?t/ngXT1fCirPkzT918LGaq5RdmlobV3D1I9I6egLph2wSITnvnG/vd3/dmMk?=
 =?us-ascii?Q?q0wJ68DbGaKI+zAGDxrSYdbn3CkmKGQh2IHB44lMa+oV4XNCsCSL0puxgnih?=
 =?us-ascii?Q?5x5p3DN5iCvFxZx8tTKGPlT7M3fsHi9xralmuovIVbvNgX2fuU6PAlCKpJQv?=
 =?us-ascii?Q?l7SxAcW+wxJDxwi5xK7yThY8ED659dkXAF3cbWYiPLFJqV/0ij35cAsTBtKS?=
 =?us-ascii?Q?C9ytXH9CyiHkICKdIgVoTpdulIN561jsePrExb/OnK5Gz1fAHGUHM/hXDU95?=
 =?us-ascii?Q?mYyMxXvO1lufOlHJHZVz8ve3FcAZYSVE8nY5C8LS+ZWA1WIJvwz4qskA/+Xg?=
 =?us-ascii?Q?PBYdMeIHoOAtbDrfOyxsToDG2eyQuOD1M05G9LK702t6mQmU2qvSg/gizr7p?=
 =?us-ascii?Q?3YLEmD6zgX184OPxrg4Rwx5OszUHkrld7YarZJE+rgupseMhXEoe/zoBz6F6?=
 =?us-ascii?Q?0ecJqx+yEq5YgbinOOe8Bu/gE4g8FRgXhf2hY8+GYIhOZVJNQ8j2tFEzk+Al?=
 =?us-ascii?Q?PU0gox+2fy5aAwqOgdXoXTsY9eBEL/dEuaMq5RWJlQtl/J6L2D2HsunWrUII?=
 =?us-ascii?Q?L9oBbf9B7BfLVs386H3P2XQsQw/ltiQ8Kskq0Yko9Pb+DUzEMfWJF99JIN9Q?=
 =?us-ascii?Q?bawxEvvwROgJNK1txSYXSbpHtc5yv0RfNz3PS07h0WtcIOHuZSfDKQ1PKaLg?=
 =?us-ascii?Q?CTX1a1T8P8NZOosdEsFpKRFoxaDL54rWGeYGezNRt1dL7PLy2xfqaBVYyj6M?=
 =?us-ascii?Q?z+5grZwltDwlZ9vxH44hYiZknQazezI2qNiWDSh8T2kpnhSMyl2PANXLj/Ga?=
 =?us-ascii?Q?l6rIR5W6qo+Nvp0ItQ2OeDHt?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f26db598-f94e-4c72-29e1-08d8f43ba982
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lnfDHwxiX5pYwx7pf4GF4poQcAg5wJ9PuODl4+baqOO6f7bFWbLjwPT+OQ/NvHtkbMH38Aqioe4DioFaixZKKZ+c6x7XzyuyijPUGACkEbUsG4pO+s2+pds+17FcL4n7y67KAWGxTyA+nnp405unKOOzZn0c9nQ9540cHoBdIBvV0fhgXHqTiEOajiQt42ABBUtXn29eY/fChfsXKSlQ0rnx7zo9Co4l4xa6RCeQSUvaRIypUURBnIGH+5w+YciIaESGzSJwIluvXsdgh8UgJ/rNGJ58yec+QvU6Nh0oy7UoXcXNjLPHoWVuoaHrV5pNSeKlvoFN9WIIegec+3sop0wVh+dk5JzwHn69LEy5wLZF0LKTRWSF3df6a6+LT1Et36WuDewS+ynJcxTuayzvy1pI8LqELBE7b+ihCsTrReWTHUSuGs4HPhU70GFuieNFgHFInNiiEEeIgxdTa8ROOI3c8u21lZpeWERG7m2QJKaUZeKTeA9+JaZX23fNLsJLp8BdN8mXkpUy9JtkyqUD5nXLAVCUspsV2QpKuWQHQRIrNw2gc0Wkmlwsj35KX2HewflCYWNdsWZnycIsmXoTKILQqMr9p+VR2NHgrkwN2u1WtKHuccFIbO3Kn1g5FnmRIguP3nPXDXzfy8EJeoEBHg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(36840700001)(46966006)(36860700001)(2616005)(336012)(186003)(6486002)(26005)(47076005)(8676002)(70206006)(478600001)(86362001)(4744005)(70586007)(82310400003)(2906002)(36756003)(82740400003)(4326008)(81166007)(5660300002)(356005)(44832011)(16526019)(6916009)(316002)(7696005)(6666004)(956004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 11:54:37.1938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 515c6ae1-e30d-4df9-2964-08d8f43bc249
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4370
Content-Type: text/plain

We are temporarily using armv8-4a until GCC 11 is released and supported by
oe-core.

Issue-Id: SCM-2121
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I7e41105a1e99f5a71ea927d1b84c9a9fa9762aaf
---
 .../conf/machine/include/arm/armv8r/arch-armv8r64.inc         | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc

diff --git a/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
new file mode 100644
index 0000000..4ae8a51
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/include/arm/armv8r/arch-armv8r64.inc
@@ -0,0 +1,4 @@
+# We are temporarily using armv8-4a until GCC 11 is released and supported by
+# oe-core which will include the armv8-r support for aarch64.
+
+require conf/machine/include/arm/arch-armv8-4a.inc
-- 
2.17.1

