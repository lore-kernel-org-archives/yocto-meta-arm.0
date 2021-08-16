Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.48])
 by mx.groups.io with SMTP id smtpd.web08.22330.1629109738001380092
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 03:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=M88byiAh;
 spf=pass (domain: arm.com, ip: 40.107.5.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD4LSt3HfPYUS3SsU/iRtX1wjfqnuIex/6LhUBQZH10=;
 b=M88byiAhMN6+D9MTc6UtlwAOzaSgXsUi9BHw+psEj3WbXUTheEB7Xdu+Wxm7IDLHOIF8R17twnwBR4ifXc3F08ZlWs1KyHQqtaTYYx0C3Oa7x6I+9OOLqVT2AlRAdeJ3jc7yQ/g3Yh18ZrNA3Sf3znY1K27P2XS0p1xB7I89u6Y=
Received: from DB7PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:10:52::15)
 by AM5PR0801MB1940.eurprd08.prod.outlook.com (2603:10a6:203:48::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 10:28:55 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::f0) by DB7PR02CA0002.outlook.office365.com
 (2603:10a6:10:52::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 10:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 10:28:54 +0000
Received: ("Tessian outbound f11f34576ce3:v103"); Mon, 16 Aug 2021 10:28:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbd8fc4a2d93c842
X-CR-MTA-TID: 64aa7808
Received: from 0a9be1298699.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C3BC340-BFB1-463F-985A-D85C244680C3.1;
	Mon, 16 Aug 2021 10:28:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a9be1298699.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 16 Aug 2021 10:28:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6YCrxbLCzvBGYIVacBQ9xlrgCY8SoX+yni+pK7TGcxkM2bLQG+bdDHbKQ9r06Irdm+hCdCewNbaHsf4Apyw+L97K+FYEr2JAw4ZXo51Dw79DaDn6E5aBHX5qq90YfxsYCV9tt2s4mXrar9xtl28CCn3PsEbwilaZ6XBkGunphTmHrvB/R8ngJDvHTW6X27vELkCAevXpTKzIbj0cLhYujSRZeYGGoDcL6UNev33B17ePo1ri7z+zs1wdui4ug4fXQnSrK8+PX/q9LF1M4vBzJIkxQlOWagy8aN6Oei4uNnvT1SEbDmmJAmL6bg0UJkNAdXdlslt0g/jaheNZr2TbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD4LSt3HfPYUS3SsU/iRtX1wjfqnuIex/6LhUBQZH10=;
 b=m/70pQWxd2KOPbCPv3wEv6NOnY3x4UlDzXTIhFq2NsY904sMeZhe+dAO6W8HTtxDHoDp8FuPHGgVxXQIji/OxgcRDs43ZCfblkjCEGBYCnNdwCUjwnKQh3Y2eIsJdXAFo4Qf3FJ7o/iedE8zIs/Rr+qPwwZwgn5hfKDJTN5NUWpBCqYkRB4XvE9XPdb8hk4UpMHogAI0T3iG47esiCxsROK4YI4HWSLsiL4f42vKotuZtZ0PS4U8QcgzjVmgT0pnIlio5aeCv+halujSoxRtpxLhKFtIT/+OLR1PQETD2Fs4Ueu8aV0WYOuy6SBxlOFqCAntoViTFvJjlAyQsf28hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD4LSt3HfPYUS3SsU/iRtX1wjfqnuIex/6LhUBQZH10=;
 b=M88byiAhMN6+D9MTc6UtlwAOzaSgXsUi9BHw+psEj3WbXUTheEB7Xdu+Wxm7IDLHOIF8R17twnwBR4ifXc3F08ZlWs1KyHQqtaTYYx0C3Oa7x6I+9OOLqVT2AlRAdeJ3jc7yQ/g3Yh18ZrNA3Sf3znY1K27P2XS0p1xB7I89u6Y=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4551.eurprd08.prod.outlook.com (2603:10a6:20b:70::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 10:28:41 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 10:28:40 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm-bsp/fvp-baser-aemv8r64: Update documentation
Date: Mon, 16 Aug 2021 11:28:30 +0100
Message-Id: <2721357197f980b767da31111ce385d714b4f23d.1629109649.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 10:28:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0449cc04-7118-40f6-f4fb-08d960a0a638
X-MS-TrafficTypeDiagnostic: AM6PR08MB4551:|AM5PR0801MB1940:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB1940663D259D946FFB0E5E8992FD9@AM5PR0801MB1940.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gck54CSGparSKqOLPoaPEIL0F4eMydXN0XR2a6WTLfG+VyuklViWZtr+IySlLNIWsvB9RLT8RcUpnx38KM/uObO/cOeitBmLgq4U/ODFdrNpL7tnhIs4uhOEtPeoUxIoTTjLvaCsvwWc6xbjcuOgmz/codGPqIuSgKpRus/FKTqLIixUjAmrF9Lm8FIamRHZRu5nFZMjk6y1waAVEHKRtqA6DIjxMfeqOBX3/F1r3sYV8z3JKOesx6PDR2TK/pR5dx79eIaunAWHywdZDKJkrxrRiNeMV9bFEoqtnLCn9SeluKqMbPgjiDecLLXUHVfIl56zoO4jMw/HZnCk1VkCB5gyK7nhDXatGoEPtoCzknEJ4zQftwb37doiG4vy/j3VuCEwwMuAtaLyAEh5PRWD16cBwEDQFU6CI2SP41Ax3WBVacZrQf8Pg489z8K0mkRzdiw/f6TkI0n29JS0luqwSpqWIhSz64DQ+jm7IhGIzvMpZSIZXNYrLoD+CAf8mfGYPSQDWdCc2DnJXj1hGXc/JTMObtsyaobDg8eiD55GZG3jkc2mlT7IsD2zaXRwagX7vV18LpTjMwOzQWLxBNi0yxm/Zb3N8CbM/HG8CaD+bv2aCPcFfetfxpIxe+48cOxyYFL3HYj/FDfhBKu9K4INDmp/FzeaGgvaHRr0PWiTbuNSth0JdsaIFMzrKAaxXjPvCJlG3uE46HrzFy3ggZSMR6yy4kLRac2/4AUyb0cDyvbqdvAxv4XYrulbNpI/C5BKLr4C45o0iHaBvS93iu2GqckQ9s1kQhQIbsLDswYVbpL4AJP/gSp+a9dbhP/eO8N1sW/NgmrX3mGq86nk/G7MIA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(86362001)(2906002)(66556008)(15650500001)(316002)(478600001)(66476007)(8676002)(52116002)(8936002)(7696005)(6486002)(2616005)(5660300002)(956004)(186003)(6666004)(966005)(4326008)(38100700002)(38350700002)(6916009)(66946007)(83380400001)(36756003)(26005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?bEiGtm6y/alqWKXvxl2ZoR5T80BVK0OuUgQSj0boIglSGWs+ByUFevzc9SUd?=
 =?us-ascii?Q?eeTB5KrgXu4uKwpmD5mPltcNlrWpjg0lMylPVl4aSKsW46ugznvucdJMJmAq?=
 =?us-ascii?Q?VW3NJ8zOEiBIugb7v8TGK1cKJk2LlL30i5gDcUlIAtoZGnR2jFDGGCtBSqMH?=
 =?us-ascii?Q?nuxXAhNMkVnGKRAZBOoQ4Wcb40/v2+rqPRlazzSzWsSwbPMy3usst1oL8V4e?=
 =?us-ascii?Q?KAm+fMXkeFzWoyeJsq+6D0TcOJhXBiDb9QHtxov4zGuA6qFFONrAyRJ+tDKo?=
 =?us-ascii?Q?7imfuAcqHmLPeoYJVWz9mUQkcJRg+5rvPoMfq2F78VkNDhhZmPqeYHuovNE3?=
 =?us-ascii?Q?Aupr/+CfTSmWxb+/Otk/uw4EshDHqCEvn8plUq5vK4KtHTmwdK0HObajg4uK?=
 =?us-ascii?Q?Ejqrg/Ty/Ckn5ZfhXQwKpKwV5K0gXj6i/uTfYooTofMnuF5eIrEZ0EUr6gE8?=
 =?us-ascii?Q?LO5AOe6l7G6A8TUeRUrAVu2b3VFfvy4fQ95sJLfuCMK9Qs3DvcdqkggdDnwq?=
 =?us-ascii?Q?e5NcTtXkEgJRaq7s5EiNmbEmyUHiy4Z3L+mqsB3bxu8jTBCa0rrSgasHJEaf?=
 =?us-ascii?Q?Q5Ieahrd55UPWX0bqUfiuETuFdOTmCS76T+olMujCniLwt6f7Hl7BKNPYE/m?=
 =?us-ascii?Q?KH8N5CFbQa1Ii7QznpFDNT9KL+iCU+v4xyyCU7yl6Vp2KJw1OM1VWTVEuCZv?=
 =?us-ascii?Q?DtkODJqAoR3GBBLhoQcSG5LaTH9EQC/OGM/RviJLfzgzUhe5Rf1y09bltNKE?=
 =?us-ascii?Q?X7R/KPssBv6jalMQA1lFqOvNV9kgvUsEmEaS9lJUZF4p0UbxeiFplNXG/yma?=
 =?us-ascii?Q?Gk13SWFLY9+D2ZgkUkgkLjcLZCI7tQx9aNVVneuwOOFyu7x/ZRLwccyErarV?=
 =?us-ascii?Q?TgEAHemlCw2tZGeQRELD5Or8Wyneelul1Ra0VI1TfBfyooZcDVvouWg1nMYj?=
 =?us-ascii?Q?Oib36cbZA9mLHA8lu44LIUoBM/pPpoGLNcFOhEvBjEUEuwiZftaLUkCF7uvX?=
 =?us-ascii?Q?AcF7ib0Ee5BrZIm8xU/QdR90HudUKStPfzrRpftEaQv8uN654eYlshPxyfxy?=
 =?us-ascii?Q?HQNX2PBrahhWUDU3HDgsVkt32INkIO0XmMhyLkujdr/2K+3ZdNLhCtTaqUBA?=
 =?us-ascii?Q?C4JJKal/L3fweeceOZXtRHwbgM3n2iVB8jGbXnfj4hlHmzL3h+0oA8Sgg0Cx?=
 =?us-ascii?Q?EiW5TjMmhA3HbW18y2IkNUeDq2BJboset0OHNj+oJt3CNXACxJV1Znvyo88h?=
 =?us-ascii?Q?dOngvN9AsM340vbVEd4bMoUP+waoo4JE3pY8g0DUhCSctisZv6YI5kWOmcZg?=
 =?us-ascii?Q?ku8RcMm89XY5iLH5DY6LmWnY?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4551
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d595b1ca-e207-4e6b-01aa-08d960a09d6d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q30aWj2G2aJ7S9Y//SfXKqIOvMzP3HnuvzpkOYpkz27gbzS+OkYMPmYUHTOf3rBTedgTacqVo+uFNj6vYtEGNvsxlYaGl7n1nv8kdW+FOrW6LmS49e4gGxnEzxSsBpQCOxAaxmBaPdotrZkJKSC47PSHeEL8TePrsE4ihrigagLUlOSQ7uzUVW5rocLs13npb1LV8BamLDz6mh3ZE2SnbkSdAASmBlmsAHroN1xLYuN2B9O3qrrFm5NOPWhXt1DrhwOXB9FfF4pDRvxfHQbI1BVGaaBMtP1KXuYaUn+a/IImmLWX4eCWN09vQf71ULMqo6zwnPNOLyX+F03ZLYa1muf/g6Pt9cIzmuZpCe/wm+9UpZkEovBBuvQUtBenFKFLEc16oTUpomB9NOWFw0kOwmDZPb1/25jj8hpxUJK9S+StvoBa4EClJ3EGviSyDjGGXAnSWI8M7yE6bfE+DRVaixsPDCMjAvfidpsHQry2/ImZijqv5BYp7gPKe9GAEEXVOVJkhm2b1ROHfEPPBC4p+USLT7kFnQXNj9jdNTC3KJsflb8NN8HSxupAP6FWJUg5xF8U9NNvtr7mIFM9JlnT7M2Dy6VcJK88dtD4RlM3AVZ2FNGzS2KphBApkFqGwLml3tW8IQcYB1ti9coR7lr27TKiK8//dZbqOBQdCfR/d3ZDb55FV3TyzcN/eSHUf0VmXNGFrFLEqC/jZ6wkEIpIvobrG2UWsm0WidkTbwEI7sd5VrNYAkf/fVN0VR9mqfxE5OHAm6TwF3qQBE8qrdsn/ZSwvuSYFM9enxSTdj4VAmsUboryce61RQcB4YWdkNfZ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(70206006)(36756003)(316002)(81166007)(966005)(70586007)(6486002)(4326008)(26005)(478600001)(83380400001)(8936002)(8676002)(356005)(86362001)(47076005)(6916009)(336012)(82740400003)(82310400003)(956004)(2616005)(15650500001)(44832011)(5660300002)(7696005)(36860700001)(186003)(2906002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 10:28:54.9350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0449cc04-7118-40f6-f4fb-08d960a0a638
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1940
Content-Type: text/plain

Add information about PSCI support as well as known issues and limitations.

Also, update the fvp-baser-aemv8r64 kas config file to fetch the layers under
the layers directory and pin poky to a stable build revision.

Issue-Id: SCM-2989
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I8e2b30ba708f6ff7fdf43f29eede0e65aa3685ca
---
 kas/fvp-baser-aemv8r64-bsp.yml                  |  4 ++++
 kas/fvp-baser-aemv8r64-rt-bsp.yml               |  2 +-
 .../documentation/fvp-baser-aemv8r64.md         | 17 ++++++++++++++---
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/kas/fvp-baser-aemv8r64-bsp.yml b/kas/fvp-baser-aemv8r64-bsp.yml
index 2e7ff04..65b1d54 100644
--- a/kas/fvp-baser-aemv8r64-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-bsp.yml
@@ -10,6 +10,8 @@ defaults:
 
 repos:
   meta-arm:
+    url: https://git.yoctoproject.org/git/meta-arm
+    path: layers/meta-arm
     layers:
       meta-arm:
       meta-arm-bsp:
@@ -17,6 +19,8 @@ repos:
 
   poky:
     url: https://git.yoctoproject.org/git/poky
+    path: layers/poky
+    refspec: 1e2e9a84d6dd81d7f6dd69c0d119d0149d10ade1
     layers:
       meta:
       meta-poky:
diff --git a/kas/fvp-baser-aemv8r64-rt-bsp.yml b/kas/fvp-baser-aemv8r64-rt-bsp.yml
index 2e712f8..69335e3 100644
--- a/kas/fvp-baser-aemv8r64-rt-bsp.yml
+++ b/kas/fvp-baser-aemv8r64-rt-bsp.yml
@@ -4,5 +4,5 @@ header:
     - fvp-baser-aemv8r64-bsp.yml
 
 local_conf_header:
-  base: |
+  base-rt: |
     PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-rt"
diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
index 166969c..6fa82d8 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -27,7 +27,7 @@ The fvp-baser-aemv8r64 Yocto MACHINE supports the following BSP components,
 where either a standard or Real-Time Linux kernel (PREEMPT\_RT) can be built
 and run:
 
- - boot-wrapper-aarch64
+ - boot-wrapper-aarch64: provides PSCI support
  - Linux kernel: linux-yocto-5.10
  - Linux kernel with PREEMPT\_RT support: linux-yocto-rt-5.10
 
@@ -81,11 +81,15 @@ Fetch the meta-arm repository into a build directory:
 Building with the standard Linux kernel:
 
     cd ~/fvp-baser-aemv8r64-build
+    FVP_BASE_R_AEM_TARBALL_URI="file:///absolute/path/to/FVP_Base_AEMv8R_11.15_14.tgz" \
+    FVP_BASE_R_ARM_EULA_ACCEPT="True" \
     kas build meta-arm/kas/fvp-baser-aemv8r64-bsp.yml
 
 Building with the Real-Time Linux kernel (PREEMPT\_RT):
 
     cd ~/fvp-baser-aemv8r64-build
+    FVP_BASE_R_AEM_TARBALL_URI="file:///absolute/path/to/FVP_Base_AEMv8R_11.15_14.tgz" \
+    FVP_BASE_R_ARM_EULA_ACCEPT="True" \
     kas build meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml
 
 ### Networking
@@ -121,7 +125,7 @@ To run an image after the build is done with the standard Linux kernel:
 
     kas shell --keep-config-unchanged \
        meta-arm/kas/fvp-baser-aemv8r64-bsp.yml \
-           --command "../meta-arm/scripts/runfvp \
+           --command "../layers/meta-arm/scripts/runfvp \
                 --console \
                 -- \
                     --parameter 'bp.smsc_91c111.enabled=1' \
@@ -132,7 +136,7 @@ To run an image after the build is done with the Real-Time Linux kernel
 
     kas shell --keep-config-unchanged \
        meta-arm/kas/fvp-baser-aemv8r64-rt-bsp.yml \
-           --command "../meta-arm/scripts/runfvp \
+           --command "../layers/meta-arm/scripts/runfvp \
                 --console \
                 -- \
                     --parameter 'bp.smsc_91c111.enabled=1' \
@@ -178,3 +182,10 @@ Devices supported in the kernel
 - virtio network
 - watchdog
 - rtc
+
+Known Issues and Limitations
+----------------------------
+
+- Only PSCI CPU\_ON and CPU\_OFF functions are supported
+- Booting Linux kernel from Secure EL2 is not supported on Armv8-R AArch64
+- Both VHE and non-VHE Linux-KVM are not supported on Armv8-R AArch64
-- 
2.17.1

