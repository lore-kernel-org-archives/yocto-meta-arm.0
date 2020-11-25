Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.86])
 by mx.groups.io with SMTP id smtpd.web12.2530.1606278713718879285
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 20:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cVqDDPbC;
 spf=pass (domain: arm.com, ip: 40.107.2.86, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCWomFseEwbRAs5xH478BeiQoXcK6hxfCnQq8uAHcjE=;
 b=cVqDDPbCesvEwHw858SafIQuhJmOG4gxiaEySPDsP2OBSJ0KoiktEUoJy2kDlIeO78QNhexoRIM6WYEDV6J2tgmqiWVfSokl0Sw5KsX/u8likG0c/28yIHYink5IXbIro0QGahAM3P/KoCj1jTG3kKa1PRq7gZqGI76fIGN/5cw=
Received: from AM5PR0701CA0022.eurprd07.prod.outlook.com
 (2603:10a6:203:51::32) by AM6PR08MB5173.eurprd08.prod.outlook.com
 (2603:10a6:20b:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 25 Nov
 2020 04:31:48 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::cd) by AM5PR0701CA0022.outlook.office365.com
 (2603:10a6:203:51::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.9 via Frontend
 Transport; Wed, 25 Nov 2020 04:31:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 04:31:48 +0000
Received: ("Tessian outbound 814be617737e:v71"); Wed, 25 Nov 2020 04:31:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3aac10dd4d8098e8
X-CR-MTA-TID: 64aa7808
Received: from 53c2df38e6a5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B060CDC7-5090-4D1A-977F-EC1F7D15F88A.1;
	Wed, 25 Nov 2020 04:31:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53c2df38e6a5.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 Nov 2020 04:31:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFoT1aIhlxmDImzpnC2dYnnd5TVeB4FHssejSTbwDnlxUEWbABiOxr13DyG9D3pBSfcCWWCbWOHEKJwjS5DQMllXPJB4EIL9BPniFUzwks12yP/B9ilGxHuHkIEqWf0z44er495ZKpYb4hmzJZsjUYwwHEbN74Pk/2CO2FT+UzGFHC0/E/qQ1biTBvmnG8L0hHX3Gi2SKOEUToH5IrMeu9ChlZCWSCYtWGRg4GP56crKZ0gMys2BOusIvEdTfq1f4oKegP1ngcrtly/y5aOJRXTio2C+HwfTcULY4cqkdAcAluNcu2DknANci8V7HNNWFjPRmc14KMya6+QGQuimBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCWomFseEwbRAs5xH478BeiQoXcK6hxfCnQq8uAHcjE=;
 b=TCvBC7FJexInR9Nfir2JSJh/TOmd03eiB0zyIxT7JSS/y5gFaFGqyiXuPH9Ma+2tu9D3tyjQaeHXICUI9QS83Y7ikViAjczIr8hzTjushh+dbaJ8Kj3WxI1+WEaRkqIj9M/P1supAwB1zWF3lNkCv7OFLtmyvp4qdAPWWgAZKnB9hZv3cq7ojLzlFKCcx+OfulVVGBzO8eMFlqv3u2fSJMJBrjYif5G2FONN57w8I7YpFxY03LN4YvvGvi/x1qDRJI/98s4SS7Pq97VE54ieoBbekQO6ukyilxNVvadyNaV/QsXRbQQ4JYjMlkIlEQzFN548braLQJgExXQaNzyOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCWomFseEwbRAs5xH478BeiQoXcK6hxfCnQq8uAHcjE=;
 b=cVqDDPbCesvEwHw858SafIQuhJmOG4gxiaEySPDsP2OBSJ0KoiktEUoJy2kDlIeO78QNhexoRIM6WYEDV6J2tgmqiWVfSokl0Sw5KsX/u8likG0c/28yIHYink5IXbIro0QGahAM3P/KoCj1jTG3kKa1PRq7gZqGI76fIGN/5cw=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM0PR08MB3684.eurprd08.prod.outlook.com (2603:10a6:208:106::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Wed, 25 Nov
 2020 04:31:38 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 04:31:38 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: add overview section to n1sdp documentation
Date: Wed, 25 Nov 2020 10:01:26 +0530
Message-Id: <20201125043126.21724-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 04:31:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bf364485-221c-42f5-cb0e-08d890fb05cf
X-MS-TrafficTypeDiagnostic: AM0PR08MB3684:|AM6PR08MB5173:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB51739520772C5AA6FF9F06A1FAFA0@AM6PR08MB5173.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CLYqX5w1u4vZOI5vdmT1eBNMGc6s6kQ+J6WZvL8feHDJgQjrqYtPDnp9PDODd3H2xVUXe4xEGblbbaGQOAiuBMlkwr6pfPWVw5cfdLU54R7pGySIGIu9NluOlLAZakD6bkIxnXFrXFWjTXBxp17r/umhEvgGXab4DgIztXT8OZyEaqxOIlnZZLvbTFFmm1R30ZxHJUdnd8FBd/+w39nyztAlu7MMX6rtjeOsj/sd62n4Sxd/kkDUTb18Rq2v+ipGzJ6ijrBvccb5+iPjs+EbB4xORKCUXEJgHeUrDDIGYgtudUX75oWvTw0ZFAFIHe+cY92f8FHMFJpXy0iwKVV+fXcwRnS/NAtj76jNwYP2EFhQb97sWhwbeXLiZ5NxEtQPIyG5hn/4rbrk+rqrxNkAgo4Er/e5n58gi/lgDpz6FOMEg8CK1b4ywFAnujdddBcFnRLaI0beqwmS3DK5TpYhDlzN4bDVxp/5gUWwJxQL8zqKzlPlXfoa7MIia4+E5qpW
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(66946007)(66476007)(1076003)(6916009)(8936002)(2906002)(5660300002)(6666004)(83380400001)(66556008)(2616005)(956004)(478600001)(316002)(26005)(4326008)(52116002)(7696005)(86362001)(8676002)(6486002)(186003)(16526019)(36756003)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 D/BejOR74AtjGOEIJBgOHBM7Fs9dzt2es5x2NnD1JD8dT5WfWspC6EGij6ojHUuom4YA5YzVPLZK44B+Wmeja/iWQf1on/yTtsAnYoGcrRV1HQfMxMYZGLzUhhq9UWo0kATQVtCpiRd3S08W5BvBePr7tn/DtrJ3paSR8eg6S5oGOP8+5X0HGKClSfHC0kSTWoooawjTgqmO8UWrQy+vwa0QHK/wBzF8kHSVc88QTGOYrgd2Xx1R4/yd0VyEuWbK+at3fkipJSUmdfsnGmP0xbsbJPH5vcecpBUGHGMIFBJmAvu5CiWx4KTtw7QTA8GWQ0Dp88+ODJBrDgG/M6mzJ2rCY7tMHINarFgQxHs0oie91NAkgv4zD2rJgZ3YtrDW6+JVVlJ6qI2TS2q07/+vbjZsIjuhTAhUI7oYKI5f+r894rsZywfivcl2YLs/MPEFISeZzxE7PkJ5V0cFlWjkl4Ncwp51w9jWfhTp4oB2hjwObJo+8XstbXve9LKb6uyhr/MCxYHytxeUA5z91UkaxO6a6iPMfycqq3l6d/4FQSyQesapvm9XMszEX6CNMolhh4Q4qdtl43SQ5LJyhaMDzlgqIyLHvBwWTDuvRSs7afQVk7K4XOFhyVf1M+9ioXJY8ZfDabO2phIQy1IzLnAweW7DZBQ3NF70eqSXikqt8u3xP3T3zXbxonHne+PuvQtTGIItZ8SjwEfIB1A3sf4o8EnxeZr3kCsVWnlpFNA1ibrlwTaSc9twEqtwe6ARWsxjAUhhkA2+jMziE9FVt/BDCYlqvnsia6hSw7/WSYwDAenf88M1i+SzaAwfptSzZx3wdglNIL6kV6NouLmc7sYlurcHlzVFvfoW9w9kV1Lah7+LhOp1dWV+8+tmmMsZzvWk5tOMMrkD3kmY7XSndUUHOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3684
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e78fcdd7-9b87-4c71-3be6-08d890faff7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tPpUfZHcUaw80VBoyrx6oE1b0HQv1GnDXpNcTTmU0J4xFzRN5oVKTTw/JGBovlrtYVCK7yENc4l33tI17kNmq4GQaNu6pDytdJIqTsfNWT59HDLMuH9eNXrUKEWjPmuIi5Hen4Sb8YJtGiVG2K/jj8sOagMc/cgVkRs52gIWVXxldc3Ug8GOuF57dAXeNtrDuXgB0iHbUXTE5rw4Ur7l0YSuNhfkYYBq6puy+KU2lENrX31AYXUi6Q1ev7hcw8qOaTgOp3ol5w5ZFR6OE3vst/qjyta4RT9Cn2jkIHQMe6p6wg/lNVPVuGP8sqldClGemoa5KdwruR8H8GFGnSU5KuLnsFwWmK3HIGhu6Pj0LEgqWaqUKvcST9xApNXdvacIyJbqIgJphioxjQIblaPTWbOmZ91qWSH+yO9PguPXL94Ipk+nUCdwldemle1dDWnnKcQIumTOS7G7lM0CmzvAfHMyb1Pkg5ayfn22luPEwMzEzGdzxKPjRyzZpi0Yxo7yAicQoaG0MuHKrJidK8haXzuvQWd0dc6uYaYkbImeSUY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966005)(956004)(356005)(36906005)(2616005)(70586007)(6666004)(316002)(6916009)(26005)(70206006)(47076004)(2906002)(6486002)(82740400003)(8936002)(5660300002)(4326008)(1076003)(36756003)(186003)(16526019)(83380400001)(81166007)(336012)(86362001)(7696005)(82310400003)(8676002)(478600001)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 04:31:48.0750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf364485-221c-42f5-cb0e-08d890fb05cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5173
Content-Type: text/plain

Update the n1sdp documentation in meta-arm-bsp to include overview section
and link to Arm community portal for further details on hardware platform.

Change-Id: Ic7c212db18a8c1f24255615061eee862af3aafd1
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/documentation/n1sdp.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arm-bsp/documentation/n1sdp.md b/meta-arm-bsp/documentation/n1sdp.md
index 24e35f0..d8661a5 100644
--- a/meta-arm-bsp/documentation/n1sdp.md
+++ b/meta-arm-bsp/documentation/n1sdp.md
@@ -1,5 +1,19 @@
 # N1SDP Development Platform Support in meta-arm-bsp
 
+## Overview
+The N1SDP provides access to the Arm Neoverse N1 SoC. The N1SDP enables software development for key enterprise technology
+and general Arm software development. The N1SDP consists of the N1 board containing the N1 SoC.
+The N1 SoC contains two dual-core Arm Neoverse N1 processor clusters.
+
+The system demonstrates Arm technology in the context of Cache-Coherent Interconnect for Accelerators (CCIX) protocol by:
+
+- Running coherent traffic between the N1 SoC and an accelerator card.
+- Coherent communication between two N1 SoCs.
+- Enabling development of CCIX-enabled FPGA accelerators.
+
+Further information on N1SDP can be found at
+https://community.arm.com/developer/tools-software/oss-platforms/w/docs/458/neoverse-n1-sdp
+
 ## Configuration:
 In the local.conf file, MACHINE should be set as follow:
 MACHINE ?= "n1sdp"
-- 
2.17.1

