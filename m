Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1DCC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 17:31:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web11.926.1643304659854221341
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 09:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=JHCjtDWb;
 spf=pass (domain: arm.com, ip: 40.107.21.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpZ/bJzjcqr27Dq6rwHIiNZXUM9T9qwHls/9qwE9YgE=;
 b=JHCjtDWb5DJgTSURiIDmerYgo0UiXc25fOBnwDtI6268GLf+tU4QcuJGrls9Z2SLy+gCxIYgmg3vSZjQ2oCF15eoRlkySeMxJ9I7/vuTcH215UtnzWMclFCU5EbtwDR1Wg86goiqac11cag0F1pXO2pwnjjxeCY+O53vB6daxuk=
Received: from AM5PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:206:14::15) by AM0PR08MB3217.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 17:30:56 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::c6) by AM5PR0301CA0002.outlook.office365.com
 (2603:10a6:206:14::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 17:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 17:30:55 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 27 Jan 2022 17:30:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 656b7da6465c968c
X-CR-MTA-TID: 64aa7808
Received: from bc65956c7410.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 46670E67-20A7-48F6-94B3-A6C21B133D4C.1;
	Thu, 27 Jan 2022 17:30:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bc65956c7410.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Jan 2022 17:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdbitlDme7AkImpofONzB7IhyH2Tx85/TOHeSyTvOIznvBpC8BvIdGDz90TJlIDatl94WqxDSyT5wNaIC5yEeu1zZY497285NvKIRJj2o3iRdRH01qojPGacooIBO7f0AKmNTCLY7D50i1uhh5OOVz2X5BhmoSvQGYXm0chxWsFuojOUsVQRU8zq3jxpEr4Tb0CNNLrQFQA36WBJwXs8HDf5RYQl6Nfmo/nZspfrLSn9ldXukqIfzZYd1nNbaMTUsXlXDWytS/pAQTxy1E6rfKwlFRdn4NznSPjzNJx+Pgm89rBO7vaVeDsZEAu9zsSLRPAjsxTTAqyoSOfb7J8c+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpZ/bJzjcqr27Dq6rwHIiNZXUM9T9qwHls/9qwE9YgE=;
 b=XzlH6nmhYZ7L+wdfmuFmgGihU2PoMzKVIFiqK5/T8BtWJOXOhqBh+fY6OxtrFoZ2kHG2K41XiGV+3F0crQVCpbCVo6vLnyowsoXWCgQB59QbwD/bEAqmWZMXsMqwTSR8XrA/RchAGEl5OJZR5SxItrPmENmDa312PNd0ib4gCdgu/zFLm1qudk3zRViuKWByWuH0vITRj5a/WBZWXLnprnSXXXVnxd6fJKvHcRSrvpyoHdpiPtwBE+F7UpQomH1R2YnmTHhAFKaNA7TcXHA1dwjqrcEpSmEz/eylGflRieOBcGIHM5d/uf51RJiLUxPlEpKZDi2pTgbmUVFpv18eSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpZ/bJzjcqr27Dq6rwHIiNZXUM9T9qwHls/9qwE9YgE=;
 b=JHCjtDWb5DJgTSURiIDmerYgo0UiXc25fOBnwDtI6268GLf+tU4QcuJGrls9Z2SLy+gCxIYgmg3vSZjQ2oCF15eoRlkySeMxJ9I7/vuTcH215UtnzWMclFCU5EbtwDR1Wg86goiqac11cag0F1pXO2pwnjjxeCY+O53vB6daxuk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by HE1PR0801MB1706.eurprd08.prod.outlook.com (2603:10a6:3:84::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Thu, 27 Jan
 2022 17:30:44 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::4166:e460:59da:189]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::4166:e460:59da:189%3]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 17:30:44 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH honister] meta-arm: Make generic-arm64 kernel cfg based on
 linux-yocto standard kernel type
Date: Thu, 27 Jan 2022 17:30:23 +0000
Message-ID: 
 <6002a6eedfdc1c2681e8dc34c2bf35bec8b7178e.1643218652.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: cef76fbd-a9c5-4988-1162-08d9e1bac66e
X-MS-TrafficTypeDiagnostic: 
	HE1PR0801MB1706:EE_|VE1EUR03FT063:EE_|AM0PR08MB3217:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB32170C0A4A3DFFC118D46EE092219@AM0PR08MB3217.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7pxbSK0pVepSzpBRFI7iG+a3jA6MryNjetI6lCiFe/sRTsIGFuDThAWpeXS+bhXo8rSdfAROBgjGM/nKfMzIR6ufeZPQccoXeuc5I8Jod3btWI6Weqb8zLorUXrcBpDxGqLD3cN3jGH0b8nVhEGYL2t9QBVGxcpKB7ENJlPqM3hGxrr0ClZtnh8xu9TXtBTkfbxs2pi+NDn20i6XeEpcivZSqq3HT636FXH0iBFJhSqR4uRYahA8h/wqWEfE+PStVw3TUV5G6v1EUHS0CCMr9AL2Qlmq2SWrbzqacCnLGGcymcu2QbiLVZF5No3CdOwDXj+NiITUSrie7hSb5zqhMqKoKo7oZBof2VFKBxvZ6tSyWPmeI2uBQ/PZ9J1O8p0ec97iUXio9+RJHC+hL9+Sgo7DvCiSfyM7q0jEPVYbB9Ba4TJd2FeYHUPVK3IBJKBlWyuDIULienMeIs58LECM1v+DpkrNgrSCgbSsU0gNE3auNNPEaUDYgsVXHbuFDqYxsAdPH1b6grKbS2YIpL8VJF/Dsp0Ab1GNbBMaS74Yro4OM80KcSESe/jYVPiYzpthtnyZjyc6QW/Wjh4og88DE7/TaEG5cv7prGbPSaVihf7QTN0S5EZI85zbZHLswvd1evQSPqQ1z+kKE2AVUKH/h+iXqH/lLlwhFaA8oYJRCBj1hcfB5xDa12M9PMOJfHFkb64W0XA7HrQJDmE32o0z0iZ2hE/cQ4eH2zrA60QZ1Iw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(2616005)(5660300002)(6486002)(6506007)(38350700002)(52116002)(26005)(8676002)(186003)(38100700002)(6512007)(66946007)(2906002)(508600001)(8936002)(316002)(54906003)(44832011)(6916009)(86362001)(4326008)(66476007)(66556008)(6666004)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1706
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	01557439-5acb-46cb-d5e3-08d9e1babf99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u4nSbKhTEGowKNJViVgC/641bRfrG+5XGVVqO78TW9UdyhfCdhFkHfPRKYke4mIgoNr9HcqBMtlhnhVHNcHcE9YVPDh/8N0YZy9/3KNFNS/3NGU3t6pvp77iBSsgHDPrdd8yC2vJVnEZ0o6eSyDwJKsXD1TwkIm8axuM76FBvatZr3MLsT+45Nx6Crk7WYUmLdPIVXpT2b5a43D1IOh8k1usGG306mJrlTw5UgBelo3YNSjA1hSu8NqTreEGJvTpzVr+9DuMegA6rxPLVq6/s997r692PCM/qh3Y95m4W/JF7riINYUED3mDqBhrZcqk6Q5DJMQhW9vQZltp1d/201DZOvflK1aoiERelih+4VzxIPUCAD8Qv/hwL5EltFzCYkZ/+oKSFlvuN+8jMqxgz7Krb6wUCn1HODW1YoLAXo7pAEkzfHfppmhdsCgFUDtZTECiQLxyqocLhhTVvj/hSh91XKN3m9YAn8lGR1+7vCDtnqbYKj1lUzC5Fm0mI+pKJDdPY8G5IZTrGWdRTGrp5IsgHkgmNI1P94j6fB6Y2jTVRFaG9Yap6kTQFIDPWupa2GUpSJsYEnyGOnWt11bS28OL6mIE9RpHKvuPMA/KqAAooIT6Y4dRG+MCA0JyamYVD1dpCkFsLRdklzWqgGiIXURGkCtVQ0K2E6gPq3XXlw4VmJKlCr+BSJZuzhvbnjFZcBJfzz8bumjKou+dUAyLYg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6916009)(54906003)(36756003)(82310400004)(8676002)(8936002)(5660300002)(70206006)(70586007)(81166007)(4326008)(316002)(356005)(508600001)(36860700001)(6486002)(2616005)(26005)(186003)(336012)(86362001)(44832011)(47076005)(2906002)(6506007)(6512007)(6666004)(40460700003)(41533002)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 17:30:55.7967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cef76fbd-a9c5-4988-1162-08d9e1bac66e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3217
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jan 2022 17:31:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2923

By having the generic-arm64 machine using the same kernel config as the
linux-yocto standard kernel type, application layers can rely on the same b=
ase
configuration, independently of the target machine.

Also, the kernel-yocto.bbclass searches for .scc files in the FILESEXTRAPAT=
HS.
Hence, we don't need to list generic-arm64-standard.scc in the SRC_URI.

Issue-Id: SCM-3910
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I46889ce38b32521d8350534cc590b57b158ad573
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../linux/linux-yocto/generic-arm64-standard.scc             | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64=
-standard.scc

diff --git a/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-standa=
rd.scc b/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-standard.s=
cc
new file mode 100644
index 0000000..21bff02
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-yocto/generic-arm64-standard.scc
@@ -0,0 +1,5 @@
+define KMACHINE generic-arm64
+define KTYPE standard
+define KARCH arm64
+
+include ktypes/standard/standard.scc
--=20
2.34.1


