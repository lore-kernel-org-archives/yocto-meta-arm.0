Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web11.21755.1593445117642907306
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 08:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ogzjyjUZ;
 spf=pass (domain: arm.com, ip: 40.107.8.73, mailfrom: teo.coupriediaz@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jyj8GYK0Lv+P5Zt6pPWe3Xh/pPhCEZQvTBuT5+ZHsOo=;
 b=ogzjyjUZv3ytVmwkvoZCpQKpHzZsVCYS5esVwdu/QH6+ZLQEqHxWPaT7jAQhIe8cNAt0n/wMvqGjgGi9ZJ3L3RXman2CbZuU/4U0jKvN0QJDlCSy/FdN2apgNVx/TSJjC8pjydejqolvLoECmjNEhg31lrtiA+FC93JoiyUocCg=
Received: from MR2P264CA0150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::13) by
 VE1PR08MB4702.eurprd08.prod.outlook.com (2603:10a6:802:ab::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21; Mon, 29 Jun 2020 15:38:25 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::8f) by MR2P264CA0150.outlook.office365.com
 (2603:10a6:501:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend
 Transport; Mon, 29 Jun 2020 15:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.20 via Frontend Transport; Mon, 29 Jun 2020 15:38:25 +0000
Received: ("Tessian outbound 1e00bf306733:v60"); Mon, 29 Jun 2020 15:38:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4aa93c09c12b9607
X-CR-MTA-TID: 64aa7808
Received: from 8d93aed52277.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DECE81B4-A8A4-4AD8-BE4A-F9F70462C85D.1;
	Mon, 29 Jun 2020 15:38:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8d93aed52277.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 29 Jun 2020 15:38:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7wmJ+xWrV5Mo94hdCv9IUVYHDJ/2Oo2gOYqvrT83+slm8Rtrpy3zBtA2rKYnSsSXlvQt4yRmhM1TSPQ2AiUA6uTO01jh54+v1qiwpDNqdSQPnR5spwKRBVFZNd2EKcMQNjvM86iXgU03yW82bihiX0YZLO5AfDh3ECDDUpkCoMZLfgqcwhsIwiCXO97Uo3ZCIwfwAiwzQiY2c1wUNIpHcBitv5oL333knrSUXpM2tsTQVAE+rMrPfiSiJL/LZSgOy9zL7+pXDuB7okeeVQIWPht6khHvoI4KmGI0hNIPsrqoRaJH8L1GTi3qLeNWNFFY4uJGK/aVufwYXNf16+nlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jyj8GYK0Lv+P5Zt6pPWe3Xh/pPhCEZQvTBuT5+ZHsOo=;
 b=mpMLiBkq4LXX/0ePlMB8f+DF12gjMyXzAdbKZdwmItpKmi0wQQDMq39rEGihgjfhsKhcUQY4x7nKYGGdu5aaDksNhCInb6ovn+hxwHq8Rae6n5pFMi1OyIHlPK3q+XMTu/KB+tTnk1U7j7WduL11RCjDYU6Ol7brWIZp63hmhpGLHKzANr0WDigqITzVVxxypZpDFB/O2Ie5/Mxeu1l4a3Uwqvyfzdu0nquQQfc2ZiO7xRcfwKjyQs9GvJbGv7O2hGIQoacTL4VbYSdKFPonrP/5mikt7xc+6SGqvaFPtwEsrFc4bg+DQLgE8UR7ER/poQ+GwaJxmccy1GKHsxy5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jyj8GYK0Lv+P5Zt6pPWe3Xh/pPhCEZQvTBuT5+ZHsOo=;
 b=ogzjyjUZv3ytVmwkvoZCpQKpHzZsVCYS5esVwdu/QH6+ZLQEqHxWPaT7jAQhIe8cNAt0n/wMvqGjgGi9ZJ3L3RXman2CbZuU/4U0jKvN0QJDlCSy/FdN2apgNVx/TSJjC8pjydejqolvLoECmjNEhg31lrtiA+FC93JoiyUocCg=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com (2603:10a6:209:4b::10)
 by AM6PR08MB3366.eurprd08.prod.outlook.com (2603:10a6:20b:47::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Mon, 29 Jun
 2020 15:38:18 +0000
Received: from AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e]) by AM6PR08MB3208.eurprd08.prod.outlook.com
 ([fe80::a4fd:b8df:a939:965e%4]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 15:38:18 +0000
From: "Teo Couprie Diaz" <teo.coupriediaz@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Teo Couprie Diaz <teo.coupriediaz@arm.com>
Subject: [PATCH RESEND 1/2] arm: Introduce 4.19 Android Common Kernel
Date: Mon, 29 Jun 2020 16:38:16 +0100
Message-Id: <1593445097-23891-1-git-send-email-teo.coupriediaz@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::17) To AM6PR08MB3208.eurprd08.prod.outlook.com
 (2603:10a6:209:4b::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bc-d5-2-4.eu.iaas.arm.com (217.140.106.55) by LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3131.24 via Frontend Transport; Mon, 29 Jun 2020 15:38:18 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6f385c4-c919-48b9-3e75-08d81c427652
X-MS-TrafficTypeDiagnostic: AM6PR08MB3366:|VE1PR08MB4702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB47022BD83F123639F4D51265FA6E0@VE1PR08MB4702.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:64;OLM:8882;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PDJVBhOiD7rOeMzuWOS21BPV743pxGZ4b7+nLFVz8qbmnXYw12buUHGXgOOz8dKkx3RwUq8aULOjHDCDRXbbsJ3/a3KT0Fb3oPnHC7PxSlfEJVhsDddz/wB/RLVfq89XdK7SiRPmoUI/mC7ElioMQbXhq4hNAdUb9P1Tp2ZL789hrt+o6qGDK/BNN69Gt3MbxXHJiNbnQiy10ND0JvOU1KcmGjgFUGso9bIG5jY3BAGfsgGQ3iRFI+rzYOxTlIwhrIbNk5Y0wJhXce8674EKaZjwsejJMs7/QqV1Vk/rUQk1U/shIdty3kD4ezBWqv3R
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3208.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(6916009)(83380400001)(2906002)(956004)(4326008)(316002)(36756003)(66556008)(66476007)(66946007)(2616005)(8936002)(478600001)(6486002)(26005)(8676002)(186003)(86362001)(7696005)(16526019)(5660300002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 LYxzyxlgHE8tKlNgD2TI5DNtRLOkIgyCyy8d3M3ASa9dDRMZZkJ85zDRxd/LSne03Bv5nibrjTvJ0mta5LKSngbM1R4naVimHaSOSmCy2ioydAVbCxbAydVIKTnIiZ+9AYq6+Ri30TLIwsSZ3J1iivU1+n1v+w03m1/7/3xOJkcGt0CmavpO2e73N0nhWetXn3mliar6wHZQPmwsPekREiAlkopIcSSIao4OBjHuamTsa7wFHkVgTLf9VBexRcWEff4HGzf9up7g6uUALJH7XO2Wx863hfB8ojQXaZpotfHm7kxcEdWbnw7X0LpApHjpOgpcXxihdfNC6lR7Q3EG2QCsr/sSFGXkVJfmhwEwWVOZpTC0jz4qwsojY/fRPkUIWQ0qjwBiOaCMgw39Bs+2Ui3JzvIa0MIwLo62vDS3jqD0msQeZDIxhGCDtH/QnVhoZHDGC1W5ihPRdEamVTcpwSBmHGeVB0b3HEx2oS7oF14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3366
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Teo.CouprieDiaz@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(2906002)(83380400001)(6486002)(336012)(2616005)(956004)(478600001)(36906005)(82310400002)(316002)(81166007)(356005)(26005)(86362001)(6916009)(16526019)(36756003)(70206006)(186003)(70586007)(4326008)(5660300002)(8936002)(82740400003)(8676002)(7696005)(47076004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7762d71a-8b76-447b-53be-08d81c42724f
X-Forefront-PRVS: 044968D9E1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QMsscRH+1Hxkqk7ntHgTskOlbCuFCc+h0Qd3TNFPu7D1RBDvtD66+OPk/5/DfL8vy5HxC//ncgGMUU+YsrHhAvwcc1eg9etXaf6TpLSDm0H4vr/U6DtIPYk5qxI74E4qasN7bnYrgimoQ8grlc6YljEejSjNGX1dSLQPEWOBtmKdFetBWrKBt0kDtp4Hav61MFASS+WXfB9PzA9dzByiifxBQGNP4cteA4slhc5CQS/59xYqyCw9a1CPnWCi5AiOM6eaMWZRd1QMWuDS1G2aFCW35LmojzTaSETb/D43UVNiitEOvbV0LYqt56TaAkN+C3KveWAzmFhYxgC9NAR3fwEgMLFsN8aIPEYv9gta4GVTT3n6Ay9glpDrQAOuOJU2Ef5lzhPy/bWEBSHp5USu8w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 15:38:25.0336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f385c4-c919-48b9-3e75-08d81c427652
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4702
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This recipe targets machines based on arm64.
Change-Id: I9f9556c3ce3636a31fb3a6faf38494335be6b997
Signed-off-by: Teo Couprie Diaz <teo.coupriediaz@arm.com>
---
 .../recipes-kernel/linux/linux-arm64-ack_4.19.bb   | 29 ++++++++++++++++++=
++++
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
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
