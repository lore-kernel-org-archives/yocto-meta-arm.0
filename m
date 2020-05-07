Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.77])
 by mx.groups.io with SMTP id smtpd.web12.3687.1588849730194992695
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YX/tBJHa;
 spf=pass (domain: arm.com, ip: 40.107.0.77, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjPxBd/S7/hXU3qB01hdXDKuQ7uuJiGVxBedP4PivWM=;
 b=YX/tBJHafSWOZVl7zgJN7tmg4licdGWhDe29c9ZvkUqTKp37SkWfN2bc11TzVSbQJ4TcSV8e4rZWEeJqPV52n5REGtdXftblSSAGPaGj9YjP8lKmd/RVDnSs1pHSY5VmWTppMG0EOBjQYQukkRLglW+IpXgviYNjeoLRSxPzspI=
Received: from DB6PR07CA0076.eurprd07.prod.outlook.com (2603:10a6:6:2b::14) by
 AM7PR08MB5446.eurprd08.prod.outlook.com (2603:10a6:20b:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Thu, 7 May
 2020 11:08:47 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::23) by DB6PR07CA0076.outlook.office365.com
 (2603:10a6:6:2b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Thu, 7 May 2020 11:08:47 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:08:47 +0000
Received: ("Tessian outbound 5abcb386707e:v54"); Thu, 07 May 2020 11:08:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8b174122801668f
X-CR-MTA-TID: 64aa7808
Received: from 1486dac0beab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 56554590-ADEC-4701-B830-42F39950CBE3.1;
	Thu, 07 May 2020 11:08:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1486dac0beab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:08:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZIwNZopL3iAp3sIrEb10mnJkJ/GhvNlNed6DWJT2ST5oPpdbZGLi+1YKLLB+sRNtuqg6XhxwVpQpLd4oKS2dTkakkubX/xlttVa+0MEqCenj+YAOOHcT0BjwtoASDipvkF97ZaneQIc9mP0dfR6wVB524RmIbLlTfeAuK90zdrDNgQU2RZPKjcubDxdymyIMAcjlmTa4JAMXOnAuxkBaf7dPDp6FCHeLvu0ShpHwE3Ed7gufh4uDmljf7FGulS86/yl+HdXAKA31bjX7MHf3rklqx9d2tD+quk7aFKaIQqak+chL/US1drhjtw33ippqGM+8A6dVilmq7Sg6YbDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjPxBd/S7/hXU3qB01hdXDKuQ7uuJiGVxBedP4PivWM=;
 b=WAAQrKi088RUPlnXdNU+Yp4COQg8DCcFshcVAErnl4s8pA/6TnaA3Ayu845u9OnMAEydJ5QW+PRvr7X/cUcKp3rSLn24cH5e3tOb4u0aX5CFsqCbeI+KTw6vthFZdyENvcNYmrAcER+TTjpf4HhDuaH8dr2MV8Yzx/5qNMhlxWo7fWcfDYjuP6bX9KzYvgp08V4FHX0mzw5FFnnS99THiiX/PqD05lH6JYbZDgBuGw9ATqoK4hVcYEqahL9MedcVOXSx2RethTGjrtR0EO2zFJx0nfSDG1UYLizHd1QF3OuhobsEJq5fwCwrJF7Ikqpm0AwycQmitcHreWTX6rSSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjPxBd/S7/hXU3qB01hdXDKuQ7uuJiGVxBedP4PivWM=;
 b=YX/tBJHafSWOZVl7zgJN7tmg4licdGWhDe29c9ZvkUqTKp37SkWfN2bc11TzVSbQJ4TcSV8e4rZWEeJqPV52n5REGtdXftblSSAGPaGj9YjP8lKmd/RVDnSs1pHSY5VmWTppMG0EOBjQYQukkRLglW+IpXgviYNjeoLRSxPzspI=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2954.eurprd08.prod.outlook.com (2603:10a6:5:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 11:08:40 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:08:40 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com
Subject: [PATCH 4/4] [arm-autonomy] arm-autonomy-host-image-minimal: Remove kernel-modules
Date: Thu,  7 May 2020 12:08:25 +0100
Message-ID: <20200507110825.38541-5-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507110825.38541-1-bertrand.marquis@arm.com>
References: <20200507110825.38541-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 11:08:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01977b18-e52c-4a8f-4d46-08d7f2770403
X-MS-TrafficTypeDiagnostic: DB7PR08MB2954:|AM7PR08MB5446:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB5446CD82450E7CCF8149805B9DA50@AM7PR08MB5446.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Y+yT8bGVNek2U0XLQO7JvhuSOcizgtq1bMMkexukl1TG47e3FtZqkBaXYGt3ue/seh55FjreJIVRHyKsQGVL6DsOvyOK+blDeGTLl1AObIuGVsRFdCMfCvJmTHifYs7Rz8klSyQJspgBzbyVp02ju8AhK5+v15CbT34rxdch2X30fUsP6U+5BfTU8ENgiqMO9eJKVGSKL6hiFdc5rhq6MBpxLCqBZceDMpbSKM2Ux6B4i5GTP0/cYAML9RwZk/lNfsZxCxkHjB/G08b9vWL1y2j1XQS7u7SWrf4XEnpH4ufr/LTnrjn94vky+JvgKNPPehD5gjCRfgWsKD/eVWDt1/BQgm2CmpBovJNxm74ULw6t+n46PvKmpOTIM1wfO6Ht8bXS763B7Y+54u0seEY3M8/RGA4KhDYF1GOLVXzUWO6vd4AxKazKcI0z6ktie6BCAOicCtOTwsHXRTl0dodt2E36bW6961WWbosZl7B7ed6uwh1P9pWgOi8CaPRDh0bTRWFkM7q5cEZ1LBPZn5UQ4g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(33430700001)(1076003)(16526019)(316002)(2616005)(8936002)(5660300002)(33440700001)(44832011)(66946007)(4326008)(66476007)(2906002)(186003)(956004)(52116002)(86362001)(83280400001)(83320400001)(83290400001)(26005)(36756003)(478600001)(83310400001)(6666004)(83300400001)(7696005)(8676002)(6486002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: EBpmwuIGlDqVTHgiLysiMD/J7XFW3QYEHE3ZtCshfivzpall69YSGDZpOZtbcjuX29AvPlj6cpLsz5ax3t53DCGPb2CnFAwl7E2hEW5TlJw/iTrcrkVEQCZekYFuRlmlGCqnHThCmCgYvvbfAFLmNQP2PkZH4pNyVMszSDmeN4wrd07Ol3QMX68/hSSHt1WHNu3rioFoWBE7H7EYZoe4znsBCIV7gSKoyjbqwvGyEZZWyRgNreheQRCW3AQDCsVdlzlaB1IsPPJcmGCyvZqRcmg0wHv7aH3gNtcjPEIjahwompsW0mWlZxnCp/Vf15M9So5d7qk6+6w38g9I53r1FZbm9FiAFmKnALJqQdSJ4NHOeIThC/A1l9DWbAsJzlczIGsGU7uDW6Bhcq4U6xP9VJkzrhoPDkL1UT7Tx9kLShU1aqT4NxzsTlKdBjifA5JD3QZsy4ugDNg6aQGWpP3VxE453SNGJXh7/BWA9PiSPjbGpYk7Sc/Q+tYtT443nxjoYLWdg2JF/aZNvGavU50u0jWt5BctiY5rIaTkZlVoGRRpB1eHVHJDMAAKIATpaC0FgEQ02X1//EfZ/1BoFN6QbjnbiN+yKe+/HbHcQ11f/78Nn9wuBzfN9UrVYwL88ao9/s+Dj4Vx7miuwOIx5dPlp2s9q5yrDLe0GFQ+DrtPAenETBxj7N8EoC3+g47ooNXU6lUHvGqHYUXm86zogGSjMtpSngn2X/KmVdcVakXnaOR38GIaaLMGPCPH0aKOhZPBOLD9jz04eYIV+3ZQcEBjt7c4UPQLNCsBENdUzXXq0Tk=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2954
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(33430700001)(336012)(82740400003)(47076004)(956004)(356005)(36756003)(70586007)(44832011)(5660300002)(2906002)(70206006)(2616005)(6666004)(478600001)(81166007)(6916009)(186003)(8936002)(86362001)(16526019)(6486002)(82310400002)(26005)(7696005)(8676002)(1076003)(33440700001)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	74129f40-c16b-493c-5019-08d7f276fea2
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bZC4iyuovhCSkvl+tPBygaTIR8eO3pwUNwwnI5KHbQNSJlI3NKLjTRvuXUnc1QzGA7liDtvZ835ovGMzgRSnsuYTcRJ1tIM4OFo0PS3+FyDCR37kf5jFI+nEastREpWt7pw8P5QSyYnq8tEhctvnWj0FWlqmUREHwUt23u1pf8Ug0UNRF2lFTFSbH6ESYOqvK/WDqXiDALveuEVAUzEJIzibNT+r+AR07QFrB1bNl+4gXvg66F6crsSXWWwaxikaMe88Gh6d7APNdzOZNjTMqk16OLqowstPLBZdy3L+/VmN8EoXzyjqgoqZcsW3nsKddrBpV+REJlooOgYQj+wYdXbCNPw+fgippkmopDakxuw+lU0UmX08Moeu8UXnfMjDtcH7unFS7UShGEY5nS0cw4/K8Vkm0DBEezvE3RD/6KiCDJuy/TLN+Zy49kw9ofBOLanO89Uy4frO7hpt0Jn7kFS/ObtE5CoC8p5U8PaCfpJmSqoVV3bLAJ87g2TXmQVNN1wyo5C55oR2Ay1c/u3Bo4UlTkYMvsBQui0RmY9bWP0Q2iPsY7O4XzDjWVf2eDT8S8kFmMYkgmjD8xS273ytXQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:08:47.8504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01977b18-e52c-4a8f-4d46-08d7f2770403
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5446
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Diego Sueiro <diego.sueiro@arm.com>

To reduce final image size, remove the kernel-modules package from
IMAGE_INSTALL.

Change-Id: I61d7d2ea87c3007af1c8f7b4917e9692a1f9e001
Issue-Id: SCM-813
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-core/images/arm-autonomy-host-image-minimal.bb  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-=
minimal.bb
index 71314cd..3859f52 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal=
.bb
@@ -33,12 +33,12 @@ ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??=3D ""
=20
 #=C2=A0Includes minimal set required to start and manage guest. The xen sp=
ecific
 # modules are not explicitly included as they are built as part of the ker=
nel
-# image for performance reasons. Includes all kernel modules anyway as it =
makes
-# life easier and does not cost that much in size.
+# image for performance reasons. It doesn't include all kernel modules to
+# reduce the image size. If the kernel-modules packages are needed they ca=
n
+# be appended to IMAGE_INSTALL in a bbappend.
 IMAGE_INSTALL +=3D " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
-    kernel-modules \
     qemu-xen \
     xenguest-manager \
     xenguest-network-bridge \
--=20
2.17.1

