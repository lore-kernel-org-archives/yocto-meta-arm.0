Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web09.6568.1626954055784375819
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 04:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bH7BpHcn;
 spf=pass (domain: arm.com, ip: 40.107.7.72, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ktNaXkj7ARK1lFKiPhM878w6ZDVXmSfkG2x/QQKW4w=;
 b=bH7BpHcnIox+g0biJbN7nieYHigBzkCCqXY5btCa48ufnqPTKgi6ZGJ1mndbzyH6WQdhtr7kt1WeDZpazNC3TcIuhRExNatJRFJMeqxTkojPhiA1Tqbencq5nG/BqjeW+WPMr7O/anBZ2ZeOryBGgfdz994wNPE4/14UrkrfGv8=
Received: from DU2PR04CA0298.eurprd04.prod.outlook.com (2603:10a6:10:28c::33)
 by DB7PR08MB3273.eurprd08.prod.outlook.com (2603:10a6:5:28::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Thu, 22 Jul
 2021 11:40:52 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::30) by DU2PR04CA0298.outlook.office365.com
 (2603:10a6:10:28c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Thu, 22 Jul 2021 11:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 11:40:52 +0000
Received: ("Tessian outbound 870783c3513f:v99"); Thu, 22 Jul 2021 11:40:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f87342f1cc5390db
X-CR-MTA-TID: 64aa7808
Received: from 7cd46fcdf3f9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3C91614C-F0A3-4931-B4A9-09C14B45965B.1;
	Thu, 22 Jul 2021 11:33:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cd46fcdf3f9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Jul 2021 11:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhvIsn728iGLLsZXIsFuiWyjf9Dt0kl4TdlvExrqy9RjD5r+gjqQDbBWDZWGq3rXFwRM88iLqKmw1dvb2eDFrhhMzqvl1hUQydTT4JiX3NbFm7uda/77l6LMGNNZMOjwFVQFVD7ATcz1Kd2jiD2XNKlorUW5xFua0bT4bpaGDqzM4dIbbWjQ+3WD9a7EoKHUO2opOIOGoRotRd1Fob87Do9kVK+w05woKLlK2+NgCU86LDMhBi0nlswAvA4LVC/PdxBYmYb08VHL9X+jSV8IAGp+rEQxPI1pZWLmvzBxgv9IQ9IDjQCnRRSd8CK0CUi9cArEmkmyhX0O7+m7vNt02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ktNaXkj7ARK1lFKiPhM878w6ZDVXmSfkG2x/QQKW4w=;
 b=HKIyA+Bei+Q2SNQZgyUZg75DOrO2lspVo6B/blUQ7Trp3VFS362evOqfTiaZSgrUjSD/p2PYsA4vGfKOjgC7SiQeZsA77wP3Ouzjm7c24GYWDSe/08D6bg60DmRDgpkJzUo0wsJnoCJCmFwoeoKZKCyxSiTCVZVmxqaZg5jFlPpIzhQBtictf8ECFEiJEUkUg6Z/sKlHDHmLyDhVuxZYZY7ZW+Tk9JxSWWh8poe6VbwrjhR8DNOI5QU8G6U0nSWIdjeKg/GeAs0LPHfgu+WzSWCbWW8MZ2sZGZyMPWKMOgndSyX9xU5b8dLBe8Q1TgGP9tV07kQ993fHE5yhIIVHVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ktNaXkj7ARK1lFKiPhM878w6ZDVXmSfkG2x/QQKW4w=;
 b=bH7BpHcnIox+g0biJbN7nieYHigBzkCCqXY5btCa48ufnqPTKgi6ZGJ1mndbzyH6WQdhtr7kt1WeDZpazNC3TcIuhRExNatJRFJMeqxTkojPhiA1Tqbencq5nG/BqjeW+WPMr7O/anBZ2ZeOryBGgfdz994wNPE4/14UrkrfGv8=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 11:33:37 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:36 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 4/6] arm/hafnium: update to version 2.5
Date: Thu, 22 Jul 2021 12:32:48 +0100
Message-ID: <20210722113250.3394087-4-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
References: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
X-ClientProxiedBy: LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::13) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.53) by LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 11:33:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8f4a920-babe-47ff-f9e5-08d94d058f65
X-MS-TrafficTypeDiagnostic: PA4PR08MB5950:|DB7PR08MB3273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3273B15462D07AFFD3B1EAB4FBE49@DB7PR08MB3273.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:421;OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: XJYPZHG9E9iZ3SFs9wB8CDbkPH08Oi5Ar93SnNvd0woEEvWlEvl/CzGCI4+5TQQRhNxE+cZjFhVbFJwZXnxM2bSIdTFQ0FOLcxLWnnaU+iP3sYcOGKbj+SlYvqKEHlUnVGfhGjurDXLJI6c70PMbqSRXCyoH+W+ntUAypIfOcg2ezJLo26BHCv6bw/7EQJNt5FGp87E+cxX1ArmVutHYP240xooiqZ4ZQLJcMKHsy6uiZ1MuuSN7cXBAPOZ8ceVZvAF+O2VUjAaDy5KOdprk7ej5C5WqrLNNWswzGABVYvLIvVlnUvqJCWoKIJ1OA4CYbaU7BxNB6prcx6zWecEOsgh96tKP27FcmuF2nnK0JUSFo/PAmz/7Pm4ZfCWHHYkFvMVTMIqDg0n0QTDb+FbMwC1VcBZ1q0o34gOXT5hg5FGH1ZJfG+pfM3mUCBj47NtHNRXfYvIk4eXsHVJFLO9L23z6yeKwl9T2mtXXc0Etihyug3fZTILa/bgDBuiCrYZ2LYyFRW9UjYq693RUDwwamJi+TcpdagwDEX4GCXjFs1RvEID9HEpStaG5P/jI7oLyO9wJWPK5gRbw34zlZVN7qjKFC+aW93x805VuKmN03TGAHXPVaRgOkYrWupS9rNAR3MHYG6zpFM+m/ooFxif8GH+md5cyauDXAu9fJW+0EP8vu/dlkjIPgQrqiHy81nIEyQkbPd0iDhxdxjzPuu9IOw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6486002)(8936002)(38100700002)(5660300002)(44832011)(186003)(36756003)(26005)(52116002)(6666004)(66946007)(66476007)(86362001)(508600001)(4326008)(66556008)(8676002)(2906002)(2616005)(83380400001)(1076003)(38350700002)(956004)(7696005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EK+f0u+XLtY9sIoGUAt8DNjwJ0ldCizBWuLSXvcLMTryqOgZamgcXb8HW99+?=
 =?us-ascii?Q?4aMrhu5eCVsCtKYz9olt6D5267YZOAonKDAFr9eRevLxAKEIuTBS2W699PKD?=
 =?us-ascii?Q?k/73lLCPytoEzUpRnob7WoL0Mtni0biA/dxaVBVzuM6e1PdNuSL+neMF87kJ?=
 =?us-ascii?Q?DgJU3uuGVLhoNyNXWlX1VtWHpRAzN/D0aF97sDdZywEuXxUqfCSYp/5RrMLM?=
 =?us-ascii?Q?nC6oAV6D+gpCoF4prJjgORpj6gp4nx3LfFbHx384jsN7/BzcfWnhbY8onTcr?=
 =?us-ascii?Q?1qwpEhpwlz8HNrAGa0m6G7lv+TvMxBGKYaTt0RvearZHyiNkLY5hAI/rVTxK?=
 =?us-ascii?Q?oIiNayGqYqWAiT/8WW5CDRgXDqhnDmi3vrkb14Hf4dRqv93dnFWtVA2hVyUE?=
 =?us-ascii?Q?gtUNw092AHW824hyYblhnH2mfvHLQZG4bjHhrJWSLUiBWypsKRAewvjK2UBq?=
 =?us-ascii?Q?CWcAFXKJd/em2R/hTKnm9/tSwXANaNf0FFeJPjaRv+muxgU6hn1rx3a+R4R4?=
 =?us-ascii?Q?IoH5afDggNWF92KjgEIoUljXAZnaUrRav+gH+K3NBzgtpdwiaEI3e4J3uTiA?=
 =?us-ascii?Q?rkfx8AR/YfOm+22wUjtpGSfh+yj2TSotOeyE/0fq0i1XQYwHMpQt4Lu5CpEB?=
 =?us-ascii?Q?/rwlKt3Zv9zB8SgWZjsgCQqmJZQWWM9ByDtQN6r00vfizr+LohFI94Odpppf?=
 =?us-ascii?Q?t3F3hqrRSS+z9QfUQ6EK7+7Bp0djIzwJJ4tb+jilEmC4zYxSUOimGpxrLKTm?=
 =?us-ascii?Q?u9OxYhiRXyb6D2gCwgk1UGqi6Gma4+RnXacOg80Wdkx4TpOXSK4xKtbRLkLo?=
 =?us-ascii?Q?9wCVKoB4KjNCJDAjDojcn2oD8HD74pSlUFr76t9ahqSBKeuubIhmKgL41HE+?=
 =?us-ascii?Q?Kv4NtgOAMmRG+FZbgJpKTKo4Vr8ZE8M7fAgC/6MdwMwwjJcAdi9liU9QEjnI?=
 =?us-ascii?Q?IivIqGyIQV0vw+21JY9S3219seRld/N3cJz1jO3P6j7QRC8cLVPAmjNqDnVl?=
 =?us-ascii?Q?6s8QLw7eK9LhOudLXz2r59YCjvNjPeros54nTpJmvyh8777pp5srNxqryO0z?=
 =?us-ascii?Q?SXd4gojzqZ6fuK22YsPJv4hn+uTYcrW0CyD/+G+Ni9D1c2rNnsB6m5n53ZyA?=
 =?us-ascii?Q?HXNWEKphSVwaY6xVjDo6lOVlOeDSJItM9Dctlmyv58o6Qf7EVwvw3mAGF50D?=
 =?us-ascii?Q?QiD+mwu1DXFf6OYGU9yDsuZEycnwc2bSkchk2b57yYqObreWWUjXMziF/eTr?=
 =?us-ascii?Q?bkqinmErFkQx34ZxfwRH/GgIfm+bExw62Lr+kj0/vUJgF/MBhi6bTX3oKpse?=
 =?us-ascii?Q?cbGB1EjaQuuVj7clWU/PDhdH?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	50f72481-c874-4a23-060d-08d94d048b65
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aClUNKGVjyAeTstWLHbhDSMQrXbz6MvHHjXpkSLsj+x2Bfq6mDTcihAjycIhY7Eq36/xzhPyB27tJ0GC1YXYUIg8zYnEXgnZhFHWTwQYhxrHkBx1OtTlLX1RmNL4RC1XFmWMAokN0gMqVbOca15Z71Gsm7Ih2p2RMpWG95tQsN2k66N9UQJFWLiVJAocTJCix8qGBe2dFt23gJo9LpwxuElS8gRr6MmRKzhqyH7WJdvI8blC/ie6gGpTqj6WxdGi90/2yLE6bnq7CWjsEbrnk8ZA1v/ePwX98SF5/avuWeTu1gGhq1GAb8Oem1AxBesS88xCOK352MNFKJ7uKly23G3S8TTW9+NLdSRQaztZChbxe9z8wirshDF3ihvqwZKSh3mmp/fmchyOK4QuMl64j9jo6mBLRgkCkVFXHNuLX1lcJVJeIZ5GiQyI/NIu8vDkUE84JrxH7vuasucD/h+Jf5ANqCEIlJ7F2n+jFjjkD0NfgygsLqyShq7lj+Lrb2uyc402vAZptpjUzMaIX0Hdpa0px/OPOlaUNchiPNO1kIGgpzMbg7gx7RzafAHAueu1Hj/bZiNy3/nTHhqpA6EmiZmVqLuFa8XF/r62/iwv/QQU18/w0JW4UHj6gHifknZ5YSXehqqQ+KtdKzSj6Sj5jDIqqM2GpgpIoB1x1jY++cl1mJTcG/MW6zrPWmbuuN+Ktv9LuZkX8RuDFvy743CgLw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(36840700001)(46966006)(478600001)(8936002)(2616005)(7696005)(83380400001)(86362001)(36860700001)(8676002)(70206006)(70586007)(4326008)(82310400003)(82740400003)(44832011)(5660300002)(26005)(6916009)(336012)(186003)(316002)(2906002)(1076003)(6486002)(81166007)(356005)(36756003)(47076005)(6666004)(956004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:40:52.5566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f4a920-babe-47ff-f9e5-08d94d058f65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3273
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I1405bd4df424e70af1286ccc675001bd79726b48
---
 meta-arm/recipes-bsp/hafnium/{hafnium_2.4.bb =3D> hafnium_2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/hafnium/{hafnium_2.4.bb =3D> hafnium_2.5.bb} (=
97%)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb b/meta-arm/recipes=
-bsp/hafnium/hafnium_2.5.bb
similarity index 97%
rename from meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
rename to meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
index 361d6db..97e31e8 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -8,7 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 inherit deploy python3native
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protocol=
=3Dhttps"
-SRCREV =3D "410a3acaf669c12d41fb4c57fcaf3ecee6fdba61"
+SRCREV =3D "3a149eb219467c0d9336467ea1fb9d3fb65da94b"
 S =3D "${WORKDIR}/git"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
--=20
2.29.2

