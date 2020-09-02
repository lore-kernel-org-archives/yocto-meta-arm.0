Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.47])
 by mx.groups.io with SMTP id smtpd.web11.10855.1599062036010436738
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 08:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=409mshBH;
 spf=pass (domain: arm.com, ip: 40.107.4.47, mailfrom: jon.mason@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko/tCv2MqOcS3lKqrY9b54rYJ0XIApVXNph52ajsb7Y=;
 b=409mshBHPTQ04j5lpTwyfVy4eS8WYcxKU/Vi6WInZIR1asdEe+dPnNw7VTojn7EU54a+cC5mVH3vFpOZsGnkVMgp/vlsUvLzUy/zdx9vag4e5pKAdYL1qeSqHr8u/Qvp95y+IFeUz5gZoFyCk7uo3I9uLEgCjYSG1T9fISD5iCY=
Received: from DB7PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:36::39)
 by VI1PR08MB5438.eurprd08.prod.outlook.com (2603:10a6:803:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 15:53:53 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::a2) by DB7PR05CA0026.outlook.office365.com
 (2603:10a6:10:36::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Wed, 2 Sep 2020 15:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 2 Sep 2020 15:53:53 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Wed, 02 Sep 2020 15:53:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95b019369ad14395
X-CR-MTA-TID: 64aa7808
Received: from 531557c9932d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FA8092FE-AD9A-4408-9817-CAD8B3A86430.1;
	Wed, 02 Sep 2020 15:53:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 531557c9932d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 02 Sep 2020 15:53:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7SyvvC0AXa1Y+l4i5yFowLYJUui3+1vIQ8LDITMUgidmKvExwWcUxXM6pyteHlegVBu0DB/XxFFOP1j3qj7j7poGzEZK/dDSO3x+fvBd1To4Zo+RKhJNSLXXz0b2mAc0YnSbZUwTC2ovgiifgJUz+AloZkCboGbayhHebXTDHMXoAWmVEsNAGg4W+GeXXt1/Jwwo0ugDCm2Ft0I8q4JzZz1wnGrycKaAUBuUFDUNEH7/zee2tRBQ78BLy9bUdes+BnyY/iSDnsxIpth5POslsOxUfew7oTuzuyVx4mfGSXuPDTtaln9nCrrkpMvXUZXf0E0o5SyIciNfVzM+prjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko/tCv2MqOcS3lKqrY9b54rYJ0XIApVXNph52ajsb7Y=;
 b=LeCWYKuE+e5ImpEDCDNMxFpJ/zTPXxLEWOKcmmvbXutnclQafnl8sHA8b2qyFVG03aK7CdOtkHBfvjJ0djYUOLIsHTEH0QDrTu9G+fcRbpMmkfI8axh99eAowLU0pp5sGjwNuwipnDTayQkLJynOjzYoPiJtxa5BHikjwDGjVb04gqYqyVm6ovHJR9LsL6/X02POsNX8zvp3PVb2IxVCSSMMtRo0kTIlAwJh6BVVFSoehrCyiQExAexjBz9uKXw0Limp5sHuKyiQ3V1kCcouzTExTD3fUhr5MiyOLFXH+PoyYRKi0c32aHGmKrAZUr4D2/sgnZjVzq0JsxVEpcPKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko/tCv2MqOcS3lKqrY9b54rYJ0XIApVXNph52ajsb7Y=;
 b=409mshBHPTQ04j5lpTwyfVy4eS8WYcxKU/Vi6WInZIR1asdEe+dPnNw7VTojn7EU54a+cC5mVH3vFpOZsGnkVMgp/vlsUvLzUy/zdx9vag4e5pKAdYL1qeSqHr8u/Qvp95y+IFeUz5gZoFyCk7uo3I9uLEgCjYSG1T9fISD5iCY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com (2603:10a6:3:50::23)
 by HE1PR0801MB1756.eurprd08.prod.outlook.com (2603:10a6:3:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 15:53:35 +0000
Received: from HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b]) by HE1PR0801MB2058.eurprd08.prod.outlook.com
 ([fe80::5007:f0b0:b7eb:c8b%12]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 15:53:34 +0000
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] arm-bsp: SGI575 should use A75 tuning
Date: Wed,  2 Sep 2020 11:53:19 -0400
Message-Id: <20200902155320.16918-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902155320.16918-1-jon.mason@arm.com>
References: <20200902155320.16918-1-jon.mason@arm.com>
X-ClientProxiedBy: SN1PR12CA0100.namprd12.prod.outlook.com
 (2603:10b6:802:21::35) To HE1PR0801MB2058.eurprd08.prod.outlook.com
 (2603:10a6:3:50::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SN1PR12CA0100.namprd12.prod.outlook.com (2603:10b6:802:21::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:53:32 +0000
Received: by vm (sSMTP sendmail emulation); Wed, 02 Sep 2020 11:53:28 -0400
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [136.56.1.171]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca218d7d-4e98-4378-28bd-08d84f58648f
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1756:|VI1PR08MB5438:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB5438E7FA86DB04D92004C015F02F0@VI1PR08MB5438.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cFC+iWUMZUt8L8C3Ala1vPLiYu/ag1+7PGfXce7ygDl/y2DiDK6sr9dELdS5isP0EStw7W8i7G92GfL0QpR1+zke7D2SSkNma3XYX+cLk5C3RnYaiFKwUTOsvLnJptKagmL4mGH4eP6J0QLAPNzaioiB7NXNg8B7iXvjn/fbl03945rt7Su9NbrFyv1W61dcsqyXDYUySUEWk/gC++EZ+CHAI/0UIzbhNZCkBZjhhfWq51s1g5D/xWkLezVxuk55yaZOfHl35BAlpahy2Y2AlzLWT3ltI825w6GVpGkKRDJqHt/0DPjni1YOMsubOQ0yjwfdmpsFOhzhCXB3X23E8YrBCKHewZcp/Zjyb9Ztc9cgS/bDG3CIVSyR4WaLGJVOjSjhQP41LbeWlgBSSTsdLw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0801MB2058.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(44832011)(36756003)(426003)(6666004)(8936002)(52116002)(86362001)(4744005)(966005)(478600001)(186003)(1076003)(8676002)(4326008)(5660300002)(316002)(66476007)(42186006)(66946007)(66556008)(6916009)(83380400001)(26005)(2616005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 hy+cpOetFb3O8cRH3CMgnRC/jUaAaXhlv45jsOdQvJEP+TthdWPZJ1jnXiG+0gy6buaAi6XKOECHYYjba7jkd8TZHWqw1FzVTd5uKgr4ObydbsCtXveXxgztU6SsNR45wYmwDobP/6SC+1eqLR1f2eeOklDXueqAnEK6/Kmw4cikyq/YiQD8pyJpRkgVcVeaat6KLt4JyICqWu5aBfB/siRbflsToVVb3Kg55cVdRw9WxRpxnrM0o/r4/WTSx0vTxZHQ3UsWbMUpi9AiXWgXdBMOXdLlSPuJdmKBpr+kewnpl7xvcrul3lA6ogQwvFrMF2nspVH+LgtKHHi8tvPZk0phNjj+HPq2NxIomsxDsbQefAu9R91vyrUJYvoRQYGH3p0J7RXEolcZYMyBpWxxGPJjoDgoLk7o17VK+Zdt3lFok6+gOd4BABEuguqpxIRE2AJ5EgkeJdM5zL27aMVShsWBPygrQu+gYxjucg+SbZgxnub1ydxYY6hepvAX+0QG20knjZ6R9vNkFnKwi3B1jCGeZ/fukxKP4iaroycMIO7w57Yo4dpm8ebPR5KJvIOgqFU7hcXjRHMBm1wugWdWcZhdEnPEXT+MSlykPXbBGCgR5yGadDaWShr3NxvhK/MxJZApePQhCq8SrP71gVONeQ==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1756
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jon.Mason@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee894295-79fd-427e-100d-08d84f5858b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ppy3Tfgt+AoacCmyW84ICwWHLcy/WzGVq9Eaq6dNwl0vO8tIZYzEcbvFVWedUpiGnr0T0Uir/q4/uiL69qIkSB6HmQIDrYJF/FSNg/u2fLptfmuZRcfb7sx2GQtL1Yzt27tn1lcMBpXXsMTvQL/GA2++nnI/yYC8KPXDLAQ14D75WDas3ghkpFlIQuwjx9hv+Eq7UwUTx1oCXhY2yGr2vDghhtVn1i35u8Q0l51P3oTACWM4qw+C9eoHwz9NEgb2er2NYyG7kjMGpByHRZa6Fdx/rS7k/jGoVsAhuZ6t+T2wSM7T0sufL2Hlx2EQnO0kYLfD7/m59ltrkC/cVHPhphWy0HqXXWJnkBOzQDXswtSSBisWqo3dc8W5+VAYsdBBAxWH2rAPnA+66wDObszoCMV3HnG+ugAyx4HUv9jfSqv1EBhsbtRjvLAxcTr3UyKdiX8ZR+PubB8ZjRGBLtvzfvkb+zBvuCW+KcipyfdDFsA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966005)(44832011)(2616005)(1076003)(5660300002)(316002)(966005)(4744005)(336012)(426003)(82310400003)(70586007)(70206006)(4326008)(86362001)(36756003)(83380400001)(47076004)(26005)(42186006)(8936002)(6666004)(356005)(8676002)(186003)(81166007)(478600001)(82740400003)(6916009)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:53:53.5685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca218d7d-4e98-4378-28bd-08d84f58648f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5438
Content-Type: text/plain

Per https://community.arm.com/developer/tools-software/oss-platforms/w/docs/489/system-guidance-for-infrastructure-sgi
The SGI575 is a Cortex-A75.  Use that tuning to get better optimization
for the platform.

Change-Id: I6172820684f2c32eb57be1e86f2ac632fcb7cecd
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/machine/sgi575.conf
index f8ad7a0..163c3b3 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -4,9 +4,7 @@
 #@NAME: SGI575
 #@DESCRIPTION: Machine configuration for SGI575
 
-TUNE_FEATURES = "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
+require conf/machine/include/tune-cortexa75.inc
 
 EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
-- 
2.17.1

