Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.59])
 by mx.groups.io with SMTP id smtpd.web12.21597.1593445301986840895
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 08:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ixi9846w;
 spf=pass (domain: arm.com, ip: 40.107.13.59, mailfrom: teo.coupriediaz@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfQuM08rZa0CaEUUZy1ALaY6Vb16c038IIoVXdaPCcQ=;
 b=Ixi9846w2N/sN9CUfh8tI/i4/DNAM7JEM6Qeeio1ET5a1ss0nK2jZUPaGnl2XbyQgmg1iNAVQPdMWCAHU4wTjJDTtXyCBKUU2d9dKcyxChde1O3JdXZ+dPAybLRfg9qLvQCWeuEjbbFYRcTu2qQRmvPmNf7WfHGkr1+6Ug1qMco=
Received: from AM5PR0701CA0058.eurprd07.prod.outlook.com (2603:10a6:203:2::20)
 by AM0PR08MB5540.eurprd08.prod.outlook.com (2603:10a6:208:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23; Mon, 29 Jun
 2020 15:41:39 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::64) by AM5PR0701CA0058.outlook.office365.com
 (2603:10a6:203:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.10 via Frontend
 Transport; Mon, 29 Jun 2020 15:41:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 15:41:39 +0000
Received: ("Tessian outbound cea5956745d7:v60"); Mon, 29 Jun 2020 15:41:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9ff5c8c95b1e872
X-CR-MTA-TID: 64aa7808
Received: from a4b2b346c678.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EA1D9A42-F675-4E9E-B491-EAF07B8791F8.1;
	Mon, 29 Jun 2020 15:41:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a4b2b346c678.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 29 Jun 2020 15:41:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFWvSuzIm1TnrpIn8Jia+SE0fR/cvQaCChgn+2uaY+HI3ZiqugQM1Ai7bS9na7Y5ba2hp+q0FOQ5oP/e+bQeLwad0ljli3F0sBPO4j/RtoHrIc705KHyBDwkWfXUoq9jfj2PHa+n9hkzLpyvRW+2j6uchxhfRQiXyOkASNu9MKRwFnlsHcfRaJbi57oT9Rsvrj0yYKzt6jIyQ+VagqDtFjN/5YBUquuRETHyyChOPNusUQ7yKKarQUspU/Q1KmgZWUOmAAqYgbScluwzYw88NrdSQ3aRVeT0MohRpGgqHEecrtcpGDA6JLDkbbaQi038XNGJylNPFCbZlASf5dGQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfQuM08rZa0CaEUUZy1ALaY6Vb16c038IIoVXdaPCcQ=;
 b=giuXX9X50wf5HfOkjyuQ5weNa6u4Jj/nOxGQuANUwthOoytJ18ilVi/rfhZ/tNZPIFo4PLuIWRdA4ifyf8ydW2AJwtnBwTgboFs8WpXXXT0SvtAFklZXk2gWpgq05IkrwjrResKhGcDhNtCVLURU5g4In5HXKkqx05HFJPkYpL/Ihu1e7vDCYyWRjnOXK+Ziil+BXhDGUZAvVc+J6IugMhJyse0TiKpjwxA49lb8nCOyPg9Zj9XVhLUyYlI/cGN6u1Fibn8TkuNe4jLCgADNxNTTd7E8Ecq9UwfVsdiuRWXUOy/fjMgqIGABK1O06/FeG+RQj2XeP646PdldK3gmhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfQuM08rZa0CaEUUZy1ALaY6Vb16c038IIoVXdaPCcQ=;
 b=Ixi9846w2N/sN9CUfh8tI/i4/DNAM7JEM6Qeeio1ET5a1ss0nK2jZUPaGnl2XbyQgmg1iNAVQPdMWCAHU4wTjJDTtXyCBKUU2d9dKcyxChde1O3JdXZ+dPAybLRfg9qLvQCWeuEjbbFYRcTu2qQRmvPmNf7WfHGkr1+6Ug1qMco=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10)
 by AM6PR08MB5062.eurprd08.prod.outlook.com (2603:10a6:20b:e1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Mon, 29 Jun
 2020 15:41:31 +0000
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e]) by AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e%4]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 15:41:31 +0000
From: "Teo Couprie Diaz" <teo.coupriediaz@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Teo Couprie Diaz <teo.coupriediaz@arm.com>
Subject: [PATCH RESEND 1/2] arm: Introduce 4.19 Android Common Kernel
Date: Mon, 29 Jun 2020 16:41:23 +0100
Message-Id: <20200629154124.9825-1-teo.coupriediaz@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO2P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::20) To AM6PR08MB3208.eurprd08.prod.outlook.com
 (2603:10a6:209:4b::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e123147.arm.com (217.140.99.251) by LO2P265CA0056.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 15:41:30 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ef2b5055-50d7-4001-896b-08d81c42e9ff
X-MS-TrafficTypeDiagnostic: AM6PR08MB5062:|AM0PR08MB5540:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5540F6C0127A03A78C6B1C90FA6E0@AM0PR08MB5540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:64;OLM:8882;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LwsEu36Gt/WoN+zbX14CqEW0oXj8/6igV1cbss9huGl4dBV3wkfFqDDwyjUQyQ1Fd8Ud+dI4Oh2gs8yDga3p8VDvJpk5mgp/Wt+Y4dcXtletA1E9Qbpa94ZU6WI7dgQKZObSXoSvYJUSgrD6zRtl6q026q5IE1kAjokG2FqB9+yxL5RtR8iqhjuHT+FXUqVpNhR7ORSR6cPlDUadqVmalLl0lp9n5mpO/G26T/X71YAHtr3j50JEpAdytUFtOK90wKv4J0j7NLaOLXMfyKQMJ0KV4iBSHjaDfCn9hNT9mOiux2JRGsX+fltmcMFadfFL
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3208.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(6916009)(52116002)(6666004)(8676002)(8936002)(4326008)(478600001)(7696005)(2906002)(6486002)(5660300002)(86362001)(26005)(16526019)(186003)(2616005)(956004)(83380400001)(1076003)(36756003)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 6UY2JtDomjPZlJdYmK9Hh7APh61KXDS1XOXByq7ibn3ZMd+2dEq6+rLAhbSKNonRzWrgzfAFxoGbYJwgAN5/vOg2Kwq2UCo5pNJjLkSSTXxfghen+fAZKOYYo1pvOSJqMifCMzd7OaDXUUOIk8vL6kLdyWDFgifyn/GbiWF25+1jzvrFzjCSdTnRpNKRItjwdSQ1KUdmtvYmVIaPdhtSqvLvrMmrHEUJPAxjDZ6YWEQ/4aA4UOLwoLLswsubhybl2cm/RoEnWBtzWxTWGl9vq4Q+GZ1l101sx1gqsEq1+pJU7elmBymhmvH4h88fN7/Aq7Ez/PtUQlc4aFXUuWJc8QrouWffVm2R8+wCkYw+wJI46Am5kEySNlnfJRxeJzXAcsfPbL2z7bMzf8LdFYFSKtYU8LcjAHCgtkyD3z9pLrckrzcxUyXU7aYhtI1tpmy1x1SBYKrE2gQusln0YmzyWc7kdpNDavpNbfMmgt2qQbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5062
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Teo.CouprieDiaz@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966005)(82310400002)(2906002)(6666004)(7696005)(336012)(5660300002)(8676002)(1076003)(4326008)(186003)(70586007)(316002)(86362001)(47076004)(70206006)(36756003)(81166007)(2616005)(356005)(956004)(6486002)(8936002)(26005)(83380400001)(82740400003)(36906005)(6916009)(16526019)(478600001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	12e67df3-7988-4209-54a1-08d81c42e557
X-Forefront-PRVS: 044968D9E1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nCkKoLRfqwthVkYNNmDcuHd6yyjq8saWDMuwkZRkeW+m3LlqML35aGuoWaTYz3IlTnIFRuV3q2wWPlapcnEorUQq0BeuYhaY3oHCemvrJgeexAGPauPDf815S08XeOu6+WkHNHyrRTXvPTG684zqBcww83jmCmTgbkE2SzMrT/oHV1Smq4J1q6jUj2UtE4o/ji18XJ56ed0J8rxQxtsT4XkzkHuDTaLJ2c/HrU+Ickq/VosQlb0GmCYq4Bv1SPcrUNZ6Ndub7AP7T3X1eOKvWsDldKnRF3t1OTvF8jZtdP064Db2oH+9LZvNeuaygX82z6dRYdBPZbIlcVSL1n9upOLMrGyywHD6bYWk+iDdzLUUNa2xBup7JC+5updFwYiS+MFVlqwElh6MuLX43n6qPQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 15:41:39.1033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2b5055-50d7-4001-896b-08d81c42e9ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5540
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This recipe targets machines based on arm64.
Change-Id: I9f9556c3ce3636a31fb3a6faf38494335be6b997
Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
---
 .../linux/linux-arm64-ack_4.19.bb             | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb

diff --git a/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb b/meta-a=
rm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
new file mode 100644
index 0000000..99db960
--- /dev/null
+++ b/meta-arm/recipes-kernel/linux/linux-arm64-ack_4.19.bb
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: Apache-2.0
+#
+# Copyright (c) 2020 Arm Limited
+#
+
+
+DESCRIPTION =3D "Linux Android Common Kernel"
+SECTION =3D "kernel"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://${S}/COPYING;md5=3Dbbea815ee2795b2f4230826c0c=
6b8814"
+
+require recipes-kernel/linux/linux-yocto.inc
+
+COMPATIBLE_MACHINE ?=3D "invalid"
+
+ARCH =3D "arm64"
+
+SRC_URI =3D " \
+    git://android.googlesource.com/kernel/common.git;protocol=3Dhttps;bran=
ch=3Dandroid-4.19-q-release \
+    "
+
+# ASB-2020-06-05_4.19-q-release tag commit
+SRCREV =3D "ebd43352dd92e56f14a4985a3c99de767fc8f9cf"
+
+S =3D "${WORKDIR}/git"
+
+LINUX_VERSION ?=3D "${PV}"
+KERNEL_VERSION_SANITY_SKIP =3D "1"
+KBRANCH =3D ""
--
2.17.1

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
