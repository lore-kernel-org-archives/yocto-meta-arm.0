Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.77])
 by mx.groups.io with SMTP id smtpd.web10.7531.1605617984398279378
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 04:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wqlARHWe;
 spf=pass (domain: arm.com, ip: 40.107.21.77, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuXfPnTu/vlaDg44Alof1HpyxfhDoVTRKes0+4OIAPI=;
 b=wqlARHWemvBmOgT1gtQrO19Win+jpKOjStkre0WnV/VbpwWfGnWPT0Sqa70orWGYILk+jgf0VVfYJ7JyyZAnvbvMGz7zLb6unSOdMCp1f9HUl0Yu9TfoLNbdDannrlO+l0qus5b+EyEsk9cTI4eDi9alUbyJH1N5XuLaIhFMArM=
Received: from AM6PR08CA0039.eurprd08.prod.outlook.com (2603:10a6:20b:c0::27)
 by VI1PR0802MB2494.eurprd08.prod.outlook.com (2603:10a6:800:b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 12:59:41 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::c8) by AM6PR08CA0039.outlook.office365.com
 (2603:10a6:20b:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Tue, 17 Nov 2020 12:59:41 +0000
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
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 12:59:41 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Tue, 17 Nov 2020 12:59:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b95a0870dcdf21e
X-CR-MTA-TID: 64aa7808
Received: from c00f62373a5b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F07A2CA9-B36D-43D8-82A3-8697C1D5C3F2.1;
	Tue, 17 Nov 2020 12:59:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c00f62373a5b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 12:59:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yl0CwgfwnbaaQ57V0CapjuQOCmGL/7V8bCIdjAoAj3AcfOLymaIIv1Q55ivkoECyOCDjfnef4cdz8cmU3/nWq7J6oUyWeHba+VISltgp73jf0a+6qpvHcAaCFdIT5Oj5HPyZQjccmpB1Z/w726IvctS3LjqUG+dFKBFDESdpeNPLWxNT01y+pFq/eR2cM2CTS/v8kcZS4n0/dNHG0lees5DK4Cl2/Y/rluxKSygeyY1rk7zp/TwXjHoi7SD/fciRf8wB7nRHJQ+lSgaYPaibkiVe2C0YkBEg2tmmoPhCHSiGmN5jzM/82zoftCJ3LMbx0mjDPogFzqiaYe8hw/E+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuXfPnTu/vlaDg44Alof1HpyxfhDoVTRKes0+4OIAPI=;
 b=XzHgs3ZZmZe/Q0bHkOZmOvef196ieBEyMcMfDRmHP5U3MzRoew8NHVWzx89WbH98JZ19iwdnE7rC7vsRa8CEViB3fzKgP8S6QNF9f1+o4BVNf2ZNnYFdHjyHplwi8s3V1A/NugCKgLCbTWZdxGvOht+hc70T4TNls6IpqSAygc4Orccq0SAEbMRIyhi0zIOK9oVS95VLFdVIbVEX7ESI/iP42L/i83QmVBVbebdSkuGJ8gRB7HbAa+rfLQ4vAemJRsXijHe6el+R8HwuoKMadopPcJEMbE7a+a81h7M8EjLd3JJdKJsnrXrSxjgT1MEjQwwR3D+95jUf4RgRddc2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuXfPnTu/vlaDg44Alof1HpyxfhDoVTRKes0+4OIAPI=;
 b=wqlARHWemvBmOgT1gtQrO19Win+jpKOjStkre0WnV/VbpwWfGnWPT0Sqa70orWGYILk+jgf0VVfYJ7JyyZAnvbvMGz7zLb6unSOdMCp1f9HUl0Yu9TfoLNbdDannrlO+l0qus5b+EyEsk9cTI4eDi9alUbyJH1N5XuLaIhFMArM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM8PR08MB5778.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::24)
 by AM8PR08MB5828.eurprd08.prod.outlook.com (2603:10a6:20b:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 17 Nov
 2020 12:59:33 +0000
Received: from AM8PR08MB5778.eurprd08.prod.outlook.com
 ([fe80::840b:48c7:161b:976a]) by AM8PR08MB5778.eurprd08.prod.outlook.com
 ([fe80::840b:48c7:161b:976a%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 12:59:33 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 1/2] arm-autonomy/documentation: Updated for gatesgarth branch
Date: Tue, 17 Nov 2020 12:59:20 +0000
Message-Id: <20201117125921.13879-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.53]
X-ClientProxiedBy: LO2P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::26) To AM8PR08MB5778.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d1::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.53) by LO2P265CA0062.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 12:59:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 17f2f406-e91e-4f8e-1173-08d88af8a5c8
X-MS-TrafficTypeDiagnostic: AM8PR08MB5828:|VI1PR0802MB2494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2494A44A4921117B0E6239FB8DE20@VI1PR0802MB2494.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 scsnkwQdVDZVjp99rxevwTac6zuKVFJmSBBt9BCPIc/t4NEcleMoYyfyPV5xolhXAsdaW7pPW9ieE42Q+uwGsdLNt2QMixkPi3t/2U0K8gwJf1bJq0sPYT3r/t065yVDrucEhhxWowcnEwG9tqdD+5XgZfgJ2Knje43RPsq0nv02e4319/pWSBFAAqmMFp1cGxI5v+FHG18N7PYMknVQNqDIU9mSxQ0gThIurxkXUVf2tcbeXj8+QuBYtRYRpYq+cA9aKFwD+oPFHzu/D02qIIOMJvqBvIN0NFOaNOWzNP4bHhdhzwvYdL31i6SXzTyUi8KaE0uAoPziBdCMBQeScZuna6Qv2j63oaa62HXm9Di9jZuiqmGrrTkpOFUdicBi2PJ3UI2MpAZFw3zDZG6U2Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB5778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(366004)(136003)(478600001)(6916009)(26005)(83380400001)(36756003)(86362001)(66556008)(66946007)(66476007)(316002)(1076003)(5660300002)(2616005)(52116002)(6486002)(8676002)(16526019)(186003)(7696005)(8936002)(15650500001)(956004)(6666004)(4326008)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UCZu+YaMhkUAMMS3yRxzSDioXVW2/K95Sicgq9kcicaY5f0OCLE6bR1PosgWgILoWGgezwJeo/GaMiSy0+qRqQJdzk5pKT7mBGSt8FtXGFIynuKa8Ca7Gw68V962i/4mv9C3T/l8cqusMDI4X+ycQSRNQeZMOoUEF+PYedQARyarSqvnLBm2OkdQn3BDvNhWT2fhiuIB7rEZmsbysCGVTKDs5lVbDzTrRDPKhDSYYVfOFNmYLm2IR/DxCtkIOyVr11V/eD+G1zFL+L+hZBOKfW70L2RU25WecRjMOdzqgIkB2WTp4G9NdSYdYVLeSNBZ2LSbl4pB+rtLNW623XKH/p3h1j2XaBs7EPyqvYHqBrBZSYO6hnKsbA+kOwmvbY0LiP1R4Z2yoo22VL6RqxvS8pdyll6OtpSAKtkH93FMn91Pk/fl8z8VlDjYIOMEY1xMgySy7VaXVCbffY5ifWeet4q4IG5SlHAZVjg7pYLogm7Vp9OXWb0uvciWSlw3yvqJPsY3zIxMxjvY6dxxQS51Mx+P/tEwU/31SOASmIGt3UHyoTuB/w8sJpvxyeXYSHleOaakqL9ksSDUGidygHumqOvLqjeYXCdW9JlTPbNtai1TVmUilzOOnIfbzwFIfx/zm/vyqYXndaroSKkFwykCOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5828
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	caaaa3d7-76cf-41bd-72f2-08d88af8a152
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x512RN2FfWKBA7CWouuZgpUaBn7zLS4RPM5EQ+suCgVWS3gD5fKB2NpDyZatkb2gHSM7Rtb2oSSlXjYvHBJ/KHOxAXSXJRXmYexuOEut+0cG6eLBjJjdWZaBS38GC9vjFWBIJKXHbaVvUBsJw3Ho1n+jfnlExHhrNUJpyJ8VFwjQGHEpm2XkANeZTifd2wH4oi6oVX/cqrSJKc4T1f0oqjfaHpA7CCsIQX4biBA6+NqeyA9t3qZyiDBK8+L4B69OPBgFZMREFZCTZH6VJsco77Rez3fWvesZlIsyGjbfUazvlKv/1PDGZstt7uotJLQ7638THX9PRTmEnjQfP77CmdrKRtrCzDq1104/YEmPSe3KXhWa2wLn1Yp/UlIUgmNcNig6LzwVlfoZ0vej7G7lb9s26vCIR7oSJg+phYWOuSc+jQ+gQqihDOOl8etkWiwuRZodkiuBjw48aPpSlVKTq8mcqpeeyWk8ZWWfYihyHcE=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966005)(36906005)(316002)(478600001)(5660300002)(6486002)(8936002)(70586007)(6666004)(86362001)(15650500001)(8676002)(2906002)(70206006)(1076003)(7696005)(6916009)(336012)(36756003)(2616005)(16526019)(956004)(4326008)(47076004)(81166007)(83380400001)(186003)(82740400003)(26005)(82310400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 12:59:41.0300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f2f406-e91e-4f8e-1173-08d88af8a5c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2494
Content-Type: text/plain

Updated arm-autonomy-quickstart.md to suggest a user checkout the
latest gatesgarth branch instead of zeus.

Issue-Id: SCM-1521
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Idbd54efbe4bdbc31588f726b41b082de89812d60
---
 meta-arm-autonomy/documentation/arm-autonomy-quickstart.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index eb02b3a..13b588f 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -30,7 +30,7 @@ First you must download the Yocto layers needed:
  - all other layers you might want to use
 
 For each of the downloaded layer make sure you checkout the release of Yocto
-you want to use (for example zeus using `git checkout zeus`).
+you want to use (for example gatesgarth using `git checkout gatesgarth`).
 
 Please follow [Yocto documentation](https://www.yoctoproject.org/docs/latest/brief-yoctoprojectqs/brief-yoctoprojectqs.html)
 in order to have the required dependencies.
-- 
2.17.1

