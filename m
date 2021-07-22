Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.86])
 by mx.groups.io with SMTP id smtpd.web09.6513.1626953648729118408
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 04:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fMVxlQOP;
 spf=pass (domain: arm.com, ip: 40.107.2.86, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN2BBIh83q5v0p4k0owv4+jedf9iWU9s47qgaIjJSsA=;
 b=fMVxlQOPJMKOF8aSgTFbK8Dn0Azl3Ktb9dOIZfIEa5Cex6r3sYUP5hWY+5b8Bs2mmKYUohsvvY+EXC3a3Qmm3+eSZxPCNjiivyuSz6WHEpuEwe8wzIqPLh8EUoXPkHCF5ICa51VXjl0rTBpOFXOVThuKbiiCodsiv+onlriuH+4=
Received: from AM6P193CA0110.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::15)
 by DBBPR08MB4426.eurprd08.prod.outlook.com (2603:10a6:10:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 22 Jul
 2021 11:34:05 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::a7) by AM6P193CA0110.outlook.office365.com
 (2603:10a6:209:85::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Thu, 22 Jul 2021 11:34:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 11:34:04 +0000
Received: ("Tessian outbound ef2da60907d5:v99"); Thu, 22 Jul 2021 11:34:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 47a9b1c5b65a4c6a
X-CR-MTA-TID: 64aa7808
Received: from 600d3f53f1c6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF80AB93-C703-4FCE-8C55-B258E1CEA786.1;
	Thu, 22 Jul 2021 11:33:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 600d3f53f1c6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Jul 2021 11:33:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zi1dSsydDFEGKRRSn9wY7CSNPy1mFCoZmgc3USWvlVnlpteK1k/tJN6fofHdD/sbcG6XewvJ7JCpl5fPzI4M4h6zQsp+fHpNHjIab9Igmy55eauf1+slB8aizowTnjusQQSnyIBqfQhEfoY2FygALy3r2cSWv7GXdYi9i4CyIj6/1vlGAKnpWkGGqWG4rPoAnbpztR7+rLfqrtix5BMsPJvN0zNy6REVT7MnZBH1SOe48txC2ieEOPWBxGwD1sWsSZaW2uqaIggAu7hro+T2yPNYSHua4jJftsq5vx7m5Wq87JRRldXJI5s4nWV3PzIdTxeD2fdSTqjKyFQfgsde2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN2BBIh83q5v0p4k0owv4+jedf9iWU9s47qgaIjJSsA=;
 b=gXZk04eTUsA3LswNPUCygglek6oMiFRH1PpnB7V9ENycA4WoIa9uffxBoU3ctrfIaCY7x3YjZffMHqqj3HqOTIIwBbHtJ8rQu1Fx1EfzfjbVAAs+7hZBQx4Hi1DdwA0Jf2A2bD840BENy+9CCzoEXEYEWNo+4/Y4UwnLJZIqK3flP1gniReHj13QNqO2uZmpys+QiTKXU6Y2v33hVXXp180wy9h2do/A7BGiOA7ogzRgAxC58TlS6I1O7pt6XvJAH8i9LHJOZqw0y8TVrpp4SvNomwU3ufRA+DW7wumx53TFw97G2wPgjsftutyuXrsp32qQvlxQC5C6he84z3AjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN2BBIh83q5v0p4k0owv4+jedf9iWU9s47qgaIjJSsA=;
 b=fMVxlQOPJMKOF8aSgTFbK8Dn0Azl3Ktb9dOIZfIEa5Cex6r3sYUP5hWY+5b8Bs2mmKYUohsvvY+EXC3a3Qmm3+eSZxPCNjiivyuSz6WHEpuEwe8wzIqPLh8EUoXPkHCF5ICa51VXjl0rTBpOFXOVThuKbiiCodsiv+onlriuH+4=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PA4PR08MB5950.eurprd08.prod.outlook.com (2603:10a6:102:e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 11:33:38 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 11:33:38 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 5/6] arm-bsp/tc0: update Hafnium to 2.5
Date: Thu, 22 Jul 2021 12:32:49 +0100
Message-ID: <20210722113250.3394087-5-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
References: <20210722113250.3394087-1-arunachalam.ganapathy@arm.com>
X-ClientProxiedBy: LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::13) To PAXPR08MB6766.eurprd08.prod.outlook.com
 (2603:10a6:102:136::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.53) by LO2P265CA0241.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend Transport; Thu, 22 Jul 2021 11:33:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66a35c12-b0de-4c7e-aa16-08d94d049c66
X-MS-TrafficTypeDiagnostic: PA4PR08MB5950:|DBBPR08MB4426:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB44260E3138AEEBCA10DF5835FBE49@DBBPR08MB4426.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:126;OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: OK3UN/U99qgz22xgyAydR2qLcaTqn6heGWrw++s65xJcW8KrNOQlKks9CQBRO1ZYjYCjDerb01iqilxRgVjAR40d7xOqzLkyvgyCFG06E+CN+N1PhKH3Rkhgh480vtFQZTvSnIPikofZEFnvQuG+aSqzuMBzxrQ2CixMEprDzWuEfEeLfLRfvLYT5Lg3yB5Xpgl0zJ0aGy3uUOpRCtLeraeZG44BMujCiKU89vX5k4PddJaJgEATdvE5a1oRwOD2rlpDyt5AHrVW40r8DTmpolecuPX+wNCnZBvIrpRl+3LD9YTtMScuhFdg4gNCo71Zii+zJORV/V5xL43LgE9DgrdEbVAYfzbI6TTJEJXIZoPiNktreEnA6KFdwjYZoLwZmGZMQyUG1jvLc2QSWIYGAummvj9ZgSiASA6upfbJukUDXdudKiwIYU9eO7RcjGESWi0HRkQgYbD3vzIQiI7GkCfYIXHT16L2f+wfxal8F6+lg4L5NeJ3si4lbCyZUKkLLiQOrQSmY3OyeU4PbYiFsRH8TZqi6fo08ujhdXeLFSC1dFTJsPirPMg4Y9GcAJphleCchA4iKMFE/wF4g3mH1edXZK4UZQJDYPYzpUWAIdC7as4gMW19Wb6H7h2Cl53ijZrWN5TSgZR3MTLsxOmeD7FfvNex2WMCQV5REtbnGsTkFY8BxzBzmWFkIdbss7ZSvNMEp0CAIycJlGaMRvfZVjLDsgfGNmZU169guD8HPC9PA4ysL+leDl0dfVNlxzHKdiMzKAjqpABhPmWz53l8CgAUSPeOAGph6E/TFgF04kLw8uWEWAWZcMr115/hIfxj
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6486002)(966005)(8936002)(38100700002)(5660300002)(44832011)(186003)(36756003)(26005)(52116002)(6666004)(66946007)(66476007)(86362001)(508600001)(4326008)(19627235002)(66556008)(8676002)(2906002)(2616005)(83380400001)(30864003)(1076003)(15650500001)(38350700002)(956004)(7696005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yXui+nbfobabGMyikfGHXy79JOa8TT7sdH3vdGYqBvSC8b6Mz2wdSN03DZxt?=
 =?us-ascii?Q?C0qKsJ95xS7hQBGYfytwUPjOfps/Vi+4W5IrBk0VexqtiULPekB8dr6Sibdj?=
 =?us-ascii?Q?t4M+FVymup63L7BKFBYRVZb3ZDoHcwVFuLjxQCUAUmJA8JzKweKbZiOng3OZ?=
 =?us-ascii?Q?gLd3ADWDSfsyyrLsChm/SE7tRL9Kxc9jSl6i6pYH7Po5TGRczMHeGSUebx/J?=
 =?us-ascii?Q?WhSz2KLy+y4OKPB7kZt2hX76XBENafgcal3+yTX4wGxCpYEcY53SLBVEggXV?=
 =?us-ascii?Q?bjf4ClYyrA6pmXVHDwzPSddD/fvCEO++DQOimfTj4qXpPoL+kIGRcn1gnOLy?=
 =?us-ascii?Q?MAFaOti1ec+beiicb2ibPe0MyPKli9m7+6/3sWg+l/uEmnpTalFbUtUPO2lb?=
 =?us-ascii?Q?qIDhaBF/MqCfqi4KLkRUQ20Gt0EyHuMt1aq5IrH/19myliolSOw/vhNRLqov?=
 =?us-ascii?Q?o2FCAVmw2yy42wvqC6uxmq0VvxHe+cxolY3WmO1p1KceBfOc6LV9+TSg5bdH?=
 =?us-ascii?Q?+XNwSM0NuogJl4Ic3J4cv0q/dgjYyKjbPLH/QYSBxMkBC3LZTJAYFSJl5/Ko?=
 =?us-ascii?Q?8/+SePTiqxjEfsdHL1+LrJoIab/KWXbQaAys7z+ILEQBMsMfW3+4xL2MVr4M?=
 =?us-ascii?Q?5XJojU67g2mgHoVRJDtEpxu0A4vbACghWej5nRVMxWXTEUopUxxk9/5TlQjh?=
 =?us-ascii?Q?r69SKJlV7cDRGWc3EavSRPk+KP2ENr1IUmHmv0CzXQOkI90t06xuDPTLC7Mw?=
 =?us-ascii?Q?QD8QDQHyIFVuX03eOgxoL14EFNPqp4eA3U4xqMwfSZYQmjZLf2oysHutVnFH?=
 =?us-ascii?Q?ltjJfGoftz1G/up5Mt15wUY+vh3LHOy0vDxWJwVqepRhtSWG/TRvKBPRUjqw?=
 =?us-ascii?Q?Zpzh5HLY5PurfvlCw1r6ieYZvvx1IACZxhRpCzEdMhzqc1869McO2aEeBJ/M?=
 =?us-ascii?Q?GjCMg/Vgx7AmD2vQP1z+//0YlocnfHZfwqYD4ZOeeb5n7lnTYfSS6pxk6Qi/?=
 =?us-ascii?Q?5Ko48JSLf25pRtC4cScfxwpZg2ClsgDhs4K44QPweAnj8mgktnzGcDNQmynU?=
 =?us-ascii?Q?HkFCX6RstCbLDgJEcTXdvGht8F//Fr+wShhz0SsbwxA7B4sPzZxicdA4chrt?=
 =?us-ascii?Q?p8PGtVb1T33puX8odN9/+NLT5tAvF2uUy0evWGYiJEvYipNC+yvfwubXEcwz?=
 =?us-ascii?Q?oBmhdEKIEeZtY+RO3bWjqUjEKQqsrUqciUCl8hKioSMTvL52MMCkVpIe2uhX?=
 =?us-ascii?Q?FJY3HFlCUboDOZxBSxc47qY3mNTYFILAUzEHy1u8b/ITRrDRl4AbSd+CdNpf?=
 =?us-ascii?Q?hbGBtInl+P7mtHesGm3sZWOY?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5950
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	984a7ca7-5d80-4c3b-67a7-08d94d048c21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0gqzl0krazKYTbNFxZJa31pWS6ZdxJ8RFgKTGffpRSLiD6ggIUb1P4HikJfspXUD4nJLsSrT/ZAbOtvQ19+Rpo2rzvvBUp32NH6c73hjOzOfC1sFR/rfQnD1GzaJm6gk29jZutErAG+ljr4nFkmbR/VEScujeV+dHR27HRc2yOlVIC32dQEwjAl4Toey0rndasxR5ZVv5Fwp4ZPIrJYihV7D34M+5VD895XqrD4dtB3MIEyngVKJrcn4U0ZTcAyLGhkBKrTqOOzyqmdVlY5cZrZfZy3ToHrI+ewqHMl38sljhVSMVhVrVpcoYZz5IuruFQwhRRI2Wc6tGERUBMdXVYHN9Hnht6MqOo43H+qI8zS32/imHXNsrDoSTA8yRF6noO9YOn448TQqixP0YBAxWggkyJNzV38V1BJU9fWvzLG2yBsytISl6oSCnfulqYxsxPcgMApmdZ3udu4cam+Vc4e1JTDqFe3tifWb/AcvHzYQt4eDUCrdi1lNmKjCAKib8t9laVdYqL7wixcgi0bd9/5pOsV60espmdxy2SeBozyJf5lnF2KMEuWl5nO0No6e1P4+rPXs6BcLGiUuALjDIemHVM2CPK1uCH5i2RT2D8/noH38pMjYnttNRicGU3un6Er27PPvTaTElnY4ytolLVfDF3Wdzb2WucZoIygDpGPZRJZZK2wMtOQFSb/+d0ewCJwuJGtcj269MIDT6hXYUTwT8yrlYHcuR6OKrVFVaxn8gLmebt1nO6V1dHUIUGHAXLUnqkO89zYKucuTpdsM9IfrD/xxByiTnKUSM8JzTMTWcEQXVoHzBUbJ2GV6Xhsr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(36840700001)(46966006)(26005)(70586007)(30864003)(15650500001)(6666004)(2616005)(956004)(36860700001)(82310400003)(19627235002)(1076003)(356005)(6916009)(70206006)(82740400003)(4326008)(83380400001)(81166007)(47076005)(478600001)(7696005)(8676002)(5660300002)(8936002)(966005)(6486002)(336012)(44832011)(86362001)(36756003)(316002)(2906002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 11:34:04.7188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a35c12-b0de-4c7e-aa16-08d94d049c66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4426
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I2da38cff515cb543a31c7d8e2c50b51ff94ca8d3
---
 ...condary-core-entry-point-at-SPMC-ini.patch | 276 ------------------
 ...A-Cold-boot-and-wake-up-from-suspend.patch |  95 ------
 ...-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch | 115 --------
 .../0004-tc0-Add-Theodul-DSU-support.patch    |  30 --
 .../recipes-bsp/hafnium/hafnium-tc0.inc       |  13 -
 ...nium_2.4.bbappend =3D> hafnium_2.5.bbappend} |   0
 6 files changed, 529 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Re=
gister-secondary-core-entry-point-at-SPMC-ini.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Co=
ld-boot-and-wake-up-from-suspend.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Re=
spond-to-PSCI_CPU_OFF-from-SPMD.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-Add=
-Theodul-DSU-support.patch
 rename meta-arm-bsp/recipes-bsp/hafnium/{hafnium_2.4.bbappend =3D> hafnium=
_2.5.bbappend} (100%)

diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Register-=
secondary-core-entry-point-at-SPMC-ini.patch b/meta-arm-bsp/recipes-bsp/haf=
nium/files/tc0/0001-FF-A-Register-secondary-core-entry-point-at-SPMC-ini.pa=
tch
deleted file mode 100644
index f2219d0..0000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0001-FF-A-Register-seconda=
ry-core-entry-point-at-SPMC-ini.patch
+++ /dev/null
@@ -1,276 +0,0 @@
-Upstream-Status: Pending [https://review.trustedfirmware.org/c/hafnium/haf=
nium/+/6009/27]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 06e7602ddb383e0f88c19feaa216c24cf032a136 Mon Sep 17 00:00:00 2001
-From: Max Shvetsov <maksims.svecovs@arm.com>
-Date: Thu, 27 Aug 2020 12:37:57 +0100
-Subject: [PATCH 2/5] FF-A: Register secondary core entry point at SPMC ini=
t.
-
-When the primary physical core boots the SPMC registers its secondary
-physical core entry points to the SPMD. All Secure Partition are then
-initialized on their primary Execution Contexts. A Secure Partition
-calls PSCI_CPU_ON from its first EC (trapped to the SPMC) passing
-entry point addresses of secondary ECs. ECs are turned "on" in their
-SPMC internal states, although they do not run yet (the service call
-does not reach the EL3 PSCI layer). Later, when the NWd (Hypervisor
-or OS Kernel) boots, it calls PSCI_CPU_ON for waking up physical cores
-down to EL3. The PSCI layer calls into SPMD PM hooks, then the SPMD
-calls into the SPMC by an exception return to the registered secondary
-entry point. The target secondary core then reaches Hafnium vcpu_main.
-
-Change-Id: I2bd42ea54e1a7feebff20e878345ec196ff352e9
-Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
----
- inc/hf/arch/init.h                          |  7 ++++
- inc/hf/arch/other_world.h                   |  2 ++
- src/arch/aarch64/hypervisor/other_world.c   | 29 +++++++++++++++
- src/arch/aarch64/hypervisor/psci_handler.c  | 40 +++++++++++++++++++++
- src/arch/aarch64/inc/hf/arch/spmd_helpers.h | 15 ++++++++
- src/cpu.c                                   |  2 +-
- src/init.c                                  |  2 ++
- src/load.c                                  |  3 ++
- src/main.c                                  | 12 ++++---
- 9 files changed, 106 insertions(+), 6 deletions(-)
- create mode 100644 src/arch/aarch64/inc/hf/arch/spmd_helpers.h
-
-diff --git a/inc/hf/arch/init.h b/inc/hf/arch/init.h
-index 5205e4e..ef0e48f 100644
---- a/inc/hf/arch/init.h
-+++ b/inc/hf/arch/init.h
-@@ -8,6 +8,8 @@
-=20
- #pragma once
-=20
-+#include "hf/boot_params.h"
-+
- /**
-  * Performs arch specific boot time initialization.
-  *
-@@ -15,3 +17,8 @@
-  * possible.
-  */
- void arch_one_time_init(void);
-+
-+/**
-+ * Sets up secondary cores.
-+ */
-+void arch_psci_secondary_core_init(const struct boot_params *params);
-diff --git a/inc/hf/arch/other_world.h b/inc/hf/arch/other_world.h
-index 68c0b45..860a142 100644
---- a/inc/hf/arch/other_world.h
-+++ b/inc/hf/arch/other_world.h
-@@ -20,3 +20,5 @@ bool arch_other_world_is_direct_request_valid(struct vcp=
u *current,
- bool arch_other_world_is_direct_response_valid(struct vcpu *current,
- 					       ffa_vm_id_t sender_vm_id,
- 					       ffa_vm_id_t receiver_vm_id);
-+void arch_other_world_init_ffa_id(void);
-+ffa_vm_id_t arch_other_world_get_ffa_id(void);
-diff --git a/src/arch/aarch64/hypervisor/other_world.c b/src/arch/aarch64/=
hypervisor/other_world.c
-index 74a2bb1..6b5bb16 100644
---- a/src/arch/aarch64/hypervisor/other_world.c
-+++ b/src/arch/aarch64/hypervisor/other_world.c
-@@ -23,6 +23,10 @@
- alignas(PAGE_SIZE) static uint8_t other_world_send_buffer[HF_MAILBOX_SIZE=
];
- alignas(PAGE_SIZE) static uint8_t other_world_recv_buffer[HF_MAILBOX_SIZE=
];
-=20
-+#else
-+
-+static ffa_vm_id_t physical_ffa_id;
-+
- #endif
-=20
- void arch_other_world_init(void)
-@@ -181,3 +185,28 @@ struct ffa_value arch_other_world_call(struct ffa_val=
ue args)
- {
- 	return smc_ffa_call(args);
- }
-+
-+#if SECURE_WORLD =3D=3D 1
-+
-+ffa_vm_id_t arch_other_world_get_ffa_id(void)
-+{
-+	return physical_ffa_id;
-+}
-+
-+void arch_other_world_init_ffa_id(void)
-+{
-+	struct ffa_value res =3D
-+		smc_ffa_call((struct ffa_value){.func =3D FFA_ID_GET_32});
-+
-+	if (res.func !=3D FFA_SUCCESS_32) {
-+		dlog_error("%s Failed to get SPMC's FFA-ID from SPMD.\n",
-+			   __func__);
-+		physical_ffa_id =3D HF_INVALID_VM_ID;
-+		return;
-+	}
-+	physical_ffa_id =3D res.arg2 & 0xFFFF;
-+
-+	CHECK(physical_ffa_id =3D=3D HF_TEE_VM_ID);
-+}
-+
-+#endif
-diff --git a/src/arch/aarch64/hypervisor/psci_handler.c b/src/arch/aarch64=
/hypervisor/psci_handler.c
-index f89a00b..b323faa 100644
---- a/src/arch/aarch64/hypervisor/psci_handler.c
-+++ b/src/arch/aarch64/hypervisor/psci_handler.c
-@@ -10,10 +10,13 @@
-=20
- #include <stdint.h>
-=20
-+#include "hf/arch/other_world.h"
- #include "hf/arch/plat/psci.h"
-+#include "hf/arch/spmd_helpers.h"
- #include "hf/arch/types.h"
-=20
- #include "hf/api.h"
-+#include "hf/boot_params.h"
- #include "hf/cpu.h"
- #include "hf/dlog.h"
- #include "hf/ffa.h"
-@@ -53,6 +56,41 @@ void arch_one_time_init(void)
- 	}
- #else
- 	el3_psci_version =3D PSCI_VERSION_1_1;
-+
-+	arch_other_world_init_ffa_id();
-+#endif
-+}
-+
-+/**
-+ * Register secondary physical core entry points to the SPMD.
-+ */
-+void arch_psci_secondary_core_init(const struct boot_params *params)
-+{
-+#if SECURE_WORLD =3D=3D 1
-+	struct ffa_value res;
-+
-+	for (uint32_t count =3D 0; count < params->cpu_count; count++) {
-+		uint32_t id =3D params->cpu_ids[count];
-+		struct cpu *cpu =3D cpu_find(id);
-+		const ffa_vm_id_t ffa_id =3D arch_other_world_get_ffa_id();
-+
-+		res =3D smc_ffa_call((struct ffa_value){
-+			.func =3D FFA_MSG_SEND_DIRECT_REQ_32,
-+			.arg1 =3D ((uint64_t)ffa_id << 16) | SPMD_ID,
-+			.arg3 =3D SPMD_DIRECT_MSG_SET_ENTRY_POINT,
-+			.arg4 =3D params->cpu_ids[count],
-+			.arg5 =3D (uintreg_t)&cpu_entry,
-+			.arg6 =3D (uintreg_t)cpu});
-+
-+		if (res.func !=3D FFA_SUCCESS_32) {
-+			dlog_warning(
-+				"%s Failed to initialize secondary core ID: "
-+				"%u\n",
-+				__func__, id);
-+		}
-+
-+		dlog_verbose("SPMD EP register returned %#x\n", res.func);
-+	}
- #endif
- }
-=20
-@@ -353,11 +391,13 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, ui=
nt32_t func, uintreg_t arg0,
-=20
- 		if (vcpu_secondary_reset_and_start(
- 			    target_vcpu, entry_point_address, context_id)) {
-+#if SECURE_WORLD =3D=3D 0
- 			/*
- 			 * Tell the scheduler that it can start running the new
- 			 * vCPU now.
- 			 */
- 			*next =3D api_wake_up(vcpu, target_vcpu);
-+#endif
- 			*ret =3D PSCI_RETURN_SUCCESS;
- 		} else {
- 			*ret =3D PSCI_ERROR_ALREADY_ON;
-diff --git a/src/arch/aarch64/inc/hf/arch/spmd_helpers.h b/src/arch/aarch6=
4/inc/hf/arch/spmd_helpers.h
-new file mode 100644
-index 0000000..6e11c36
---- /dev/null
-+++ b/src/arch/aarch64/inc/hf/arch/spmd_helpers.h
-@@ -0,0 +1,15 @@
-+/*
-+ * Copyright 2020 The Hafnium Authors.
-+ *
-+ * Use of this source code is governed by a BSD-style
-+ * license that can be found in the LICENSE file or at
-+ * https://opensource.org/licenses/BSD-3-Clause.
-+ */
-+
-+#define SPMD_ID 0xFFFF
-+#define SPMD_DIRECT_MSG_SET_ENTRY_POINT 1
-+
-+/**
-+ * Get SPMC ID stored in the manifest.
-+ */
-+ffa_vm_id_t get_ffa_id(void);
-diff --git a/src/cpu.c b/src/cpu.c
-index 0a3fc6f..0e0ee9a 100644
---- a/src/cpu.c
-+++ b/src/cpu.c
-@@ -138,7 +138,7 @@ bool cpu_on(struct cpu *c, ipaddr_t entry, uintreg_t a=
rg)
- 	c->is_on =3D true;
- 	sl_unlock(&c->lock);
-=20
--	if (!prev) {
-+	if (!prev && vm_id_is_current_world(HF_PRIMARY_VM_ID)) {
- 		struct vm *vm =3D vm_find(HF_PRIMARY_VM_ID);
- 		struct vcpu *vcpu =3D vm_get_vcpu(vm, cpu_index(c));
- 		struct vcpu_locked vcpu_locked;
-diff --git a/src/init.c b/src/init.c
-index a5b48ab..0121213 100644
---- a/src/init.c
-+++ b/src/init.c
-@@ -146,6 +146,8 @@ void one_time_init(void)
-=20
- 	cpu_module_init(params.cpu_ids, params.cpu_count);
-=20
-+	arch_psci_secondary_core_init(&params);
-+
- 	/* Load all VMs. */
- 	update.reserved_ranges_count =3D 0;
- 	if (!load_vms(mm_stage1_locked, &manifest, &cpio, &params, &update,
-diff --git a/src/load.c b/src/load.c
-index 660d77c..7accc65 100644
---- a/src/load.c
-+++ b/src/load.c
-@@ -286,6 +286,9 @@ static bool load_primary(struct mm_stage1_locked stage=
1_locked,
- 	dlog_info("Loaded primary VM with %u vCPUs, entry at %#x.\n",
- 		  vm->vcpu_count, pa_addr(primary_begin));
-=20
-+	/* Mark the primary to be the first booted VM */
-+	vm_update_boot(vm);
-+
- 	vcpu_locked =3D vcpu_lock(vm_get_vcpu(vm, 0));
- 	vcpu_on(vcpu_locked, primary_entry, params->kernel_arg);
- 	vcpu_unlock(&vcpu_locked);
-diff --git a/src/main.c b/src/main.c
-index 5f30aac..3cc932e 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -15,14 +15,16 @@
-  */
- struct vcpu *cpu_main(struct cpu *c)
- {
-+	struct vm *first_boot;
- 	struct vcpu *vcpu;
--#if SECURE_WORLD =3D=3D 1
--	struct vm *first_boot =3D vm_get_first_boot();
-+
-+	/*
-+	 * This returns the PVM in the normal worls and the first
-+	 * booted Secure Partition in the secure world.
-+	 */
-+	first_boot =3D vm_get_first_boot();
-=20
- 	vcpu =3D vm_get_vcpu(first_boot, cpu_index(c));
--#else
--	vcpu =3D vm_get_vcpu(vm_find(HF_PRIMARY_VM_ID), cpu_index(c));
--#endif
-=20
- 	vcpu->cpu =3D c;
-=20
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Cold-boot=
-and-wake-up-from-suspend.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc=
0/0002-FF-A-Cold-boot-and-wake-up-from-suspend.patch
deleted file mode 100644
index 6cce9ad..0000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0002-FF-A-Cold-boot-and-wa=
ke-up-from-suspend.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-Upstream-Status: Pending [https://review.trustedfirmware.org/c/hafnium/haf=
nium/+/6010/29]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From ebd568637627fa895e6e7f479675c650414cc240 Mon Sep 17 00:00:00 2001
-From: Max Shvetsov <maksims.svecovs@arm.com>
-Date: Thu, 27 Aug 2020 12:39:50 +0100
-Subject: [PATCH 3/5] FF-A: Cold boot and wake up from suspend.
-
-WIP: Currently there is zero entry-point passed with no arguments, This
-will be reworked once a proper way to pass this information will be
-defined.
-
-Change-Id: Ic6050af16d4081ca31729744995fbb999b170e11
-Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
----
- inc/hf/vcpu.h                              |  2 ++
- src/arch/aarch64/hypervisor/psci_handler.c |  2 ++
- src/main.c                                 | 20 ++++++++++++++++++++
- 3 files changed, 24 insertions(+)
-
-diff --git a/inc/hf/vcpu.h b/inc/hf/vcpu.h
-index 5439719..98f3a50 100644
---- a/inc/hf/vcpu.h
-+++ b/inc/hf/vcpu.h
-@@ -86,6 +86,8 @@ struct vcpu {
- 	 * a result of a prior FFA_MSG_SEND_DIRECT_REQ invocation.
- 	 */
- 	ffa_vm_id_t direct_request_origin_vm_id;
-+
-+	ipaddr_t psci_handler[1];
- };
-=20
- /** Encapsulates a vCPU whose lock is held. */
-diff --git a/src/arch/aarch64/hypervisor/psci_handler.c b/src/arch/aarch64=
/hypervisor/psci_handler.c
-index b323faa..c892385 100644
---- a/src/arch/aarch64/hypervisor/psci_handler.c
-+++ b/src/arch/aarch64/hypervisor/psci_handler.c
-@@ -389,6 +389,8 @@ bool psci_secondary_vm_handler(struct vcpu *vcpu, uint=
32_t func, uintreg_t arg0,
-=20
- 		target_vcpu =3D vm_get_vcpu(vm, target_vcpu_index);
-=20
-+		target_vcpu->psci_handler[0] =3D entry_point_address;
-+
- 		if (vcpu_secondary_reset_and_start(
- 			    target_vcpu, entry_point_address, context_id)) {
- #if SECURE_WORLD =3D=3D 0
-diff --git a/src/main.c b/src/main.c
-index 3cc932e..2c3d1a5 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -7,6 +7,7 @@
-  */
-=20
- #include "hf/cpu.h"
-+#include "hf/dlog.h"
- #include "hf/vm.h"
-=20
- /**
-@@ -18,6 +19,18 @@ struct vcpu *cpu_main(struct cpu *c)
- 	struct vm *first_boot;
- 	struct vcpu *vcpu;
-=20
-+#if SECURE_WORLD =3D=3D 1
-+	if (c->is_on =3D=3D false) {
-+		/*
-+		 * This is the PSCI warm reset path (svc_cpu_on_finish
-+		 * handler relayed by SPMD). Notice currenty the "first_boot"
-+		 * VM is resumed on any CPU on event.
-+		 */
-+		(void)cpu_on(c, ipa_init(0UL), 0UL);
-+		dlog_verbose("%s: cpu mpidr 0x%x on\n", __func__, c->id);
-+	}
-+#endif
-+
- 	/*
- 	 * This returns the PVM in the normal worls and the first
- 	 * booted Secure Partition in the secure world.
-@@ -26,6 +39,13 @@ struct vcpu *cpu_main(struct cpu *c)
-=20
- 	vcpu =3D vm_get_vcpu(first_boot, cpu_index(c));
-=20
-+	if (vcpu->psci_handler[0].ipa) {
-+		struct vcpu_locked vcpu_locked =3D vcpu_lock(vcpu);
-+
-+		vcpu_on(vcpu_locked, vcpu->psci_handler[0], 0);
-+		vcpu_unlock(&vcpu_locked);
-+	}
-+
- 	vcpu->cpu =3D c;
-=20
- 	arch_cpu_init();
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Respond-t=
o-PSCI_CPU_OFF-from-SPMD.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0=
/0003-FF-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch
deleted file mode 100644
index 87f2a43..0000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0003-FF-A-Respond-to-PSCI_=
CPU_OFF-from-SPMD.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-Upstream-Status: Pending [https://review.trustedfirmware.org/c/hafnium/haf=
nium/+/6011/29]
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-
-From 6a836b380265876a12b2edfb7f013523af89e754 Mon Sep 17 00:00:00 2001
-From: Max Shvetsov <maksims.svecovs@arm.com>
-Date: Fri, 18 Sep 2020 13:52:20 +0100
-Subject: [PATCH 4/5] FF-A: Respond to PSCI_CPU_OFF from SPMD.
-
-At run-time when a PSCI call is made from NWd, the corresponding SPMD PM
-hooks gets called and is eventually routed to the SPMC.  This change
-implements a generic "SPMD handler" processing PM events that may be
-conveyed from SPMD to SPMC such as core suspend, core off.
-
-Change-Id: Id288e26d9fbb8328acc71f5cf68c39e095a0e3da
-Signed-off-by: Max Shvetsov <maksims.svecovs@arm.com>
-Signed-off-by: Olivier Deprez <olivier.deprez@arm.com>
----
- src/arch/aarch64/hypervisor/handler.c | 49 +++++++++++++++++++++++++--
- 1 file changed, 47 insertions(+), 2 deletions(-)
-
-diff --git a/src/arch/aarch64/hypervisor/handler.c b/src/arch/aarch64/hype=
rvisor/handler.c
-index b33298c..43a1404 100644
---- a/src/arch/aarch64/hypervisor/handler.c
-+++ b/src/arch/aarch64/hypervisor/handler.c
-@@ -13,6 +13,7 @@
- #include "hf/arch/mmu.h"
- #include "hf/arch/other_world.h"
- #include "hf/arch/plat/smc.h"
-+#include "hf/arch/spmd_helpers.h"
-=20
- #include "hf/api.h"
- #include "hf/check.h"
-@@ -261,6 +262,7 @@ static void set_virtual_interrupt_current(bool enable)
- }
-=20
- #if SECURE_WORLD =3D=3D 1
-+
- static bool sp_boot_next(struct vcpu *current, struct vcpu **next,
- 			 struct ffa_value *ffa_ret)
- {
-@@ -303,6 +305,41 @@ out:
- 	vm_unlock(&current_vm_locked);
- 	return ret;
- }
-+
-+/**
-+ * Handle special direct messages from SPMD to SPMC. For now related to p=
ower
-+ * management only.
-+ */
-+static bool spmd_handler(struct ffa_value *args, struct vcpu *current)
-+{
-+	ffa_vm_id_t spmc_ffa_id =3D arch_other_world_get_ffa_id();
-+	ffa_vm_id_t sender =3D ffa_msg_send_sender(*args);
-+	ffa_vm_id_t receiver =3D ffa_msg_send_receiver(*args);
-+	ffa_vm_id_t current_vm_id =3D current->vm->id;
-+
-+	if (!((sender =3D=3D SPMD_ID) && (receiver =3D=3D spmc_ffa_id) &&
-+	      (current_vm_id =3D=3D HF_OTHER_WORLD_ID))) {
-+		return false;
-+	}
-+
-+	switch (args->arg3) {
-+	case PSCI_CPU_OFF:
-+		dlog_verbose("%s cpu off notification\n", __func__);
-+		args->func =3D FFA_MSG_SEND_DIRECT_RESP_32;
-+		args->arg1 =3D ((uint64_t)spmc_ffa_id << 16) | SPMD_ID;
-+		args->arg2 =3D 0U;
-+
-+		cpu_off(current->cpu);
-+		break;
-+	default:
-+		dlog_verbose("%s message not handled %#x\n", __func__,
-+			     args->arg3);
-+		return false;
-+	}
-+
-+	return true;
-+}
-+
- #endif
-=20
- /**
-@@ -461,11 +498,17 @@ static bool ffa_handler(struct ffa_value *args, stru=
ct vcpu *current,
- 					    (args->arg4 >> 16) & 0xffff,
- 					    current);
- 		return true;
--	case FFA_MSG_SEND_DIRECT_REQ_32:
-+	case FFA_MSG_SEND_DIRECT_REQ_32: {
-+#if SECURE_WORLD =3D=3D 1
-+		if (spmd_handler(args, current)) {
-+			return true;
-+		}
-+#endif
- 		*args =3D api_ffa_msg_send_direct_req(
- 			ffa_msg_send_sender(*args),
- 			ffa_msg_send_receiver(*args), *args, current, next);
- 		return true;
-+	}
- 	case FFA_MSG_SEND_DIRECT_RESP_32:
- 		*args =3D api_ffa_msg_send_direct_resp(
- 			ffa_msg_send_sender(*args),
-@@ -510,7 +553,9 @@ static void other_world_switch_loop(struct vcpu *other=
_world_vcpu,
- 		 * the result of the call back to EL3 unless the API handler
- 		 * sets *next to something different.
- 		 */
--		if (!ffa_handler(&other_world_args, other_world_vcpu, next)) {
-+
-+		if (!spmd_handler(&other_world_args, other_world_vcpu) &&
-+		    !ffa_handler(&other_world_args, other_world_vcpu, next)) {
- 			other_world_args.func =3D SMCCC_ERROR_UNKNOWN;
- 		}
- 	}
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-Add-Theodu=
l-DSU-support.patch b/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-A=
dd-Theodul-DSU-support.patch
deleted file mode 100644
index 4c0b5dd..0000000
--- a/meta-arm-bsp/recipes-bsp/hafnium/files/tc0/0004-tc0-Add-Theodul-DSU-s=
upport.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e8042fda56aa470cdda723757a957a81cd95dde8 Mon Sep 17 00:00:00 2001
-From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Date: Tue, 2 Feb 2021 12:12:32 +0000
-Subject: [PATCH] tc0: Add Theodul DSU support
-
-Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
-Upstream-Status: Pending [Not submitted to upstream yet]
-Change-Id: I4a9b7e4350410fdacccd8c12ff03a61b7e64e98b
----
- project/reference/BUILD.gn | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/project/reference/BUILD.gn b/project/reference/BUILD.gn
-index 5596009..ffcaab7 100644
---- a/project/reference/BUILD.gn
-+++ b/project/reference/BUILD.gn
-@@ -159,8 +159,8 @@ aarch64_toolchains("secure_tc0") {
-   gic_version =3D 3
-   gicd_base_address =3D "0x30000000"
-   gicr_base_address =3D "0x30140000"
--  heap_pages =3D 60
--  max_cpus =3D 4
-+  heap_pages =3D 80
-+  max_cpus =3D 8
-   max_vms =3D 16
-   toolchain_args =3D {
-     secure_world =3D "1"
---=20
-2.29.2
-
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc b/meta-arm-bs=
p/recipes-bsp/hafnium/hafnium-tc0.inc
index 9f14f73..f387cb5 100644
--- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
+++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc0.inc
@@ -1,18 +1,5 @@
 # TC0 specific configuration
=20
-# Intermediate SHA with 2.4 baseline version, required for OP-TEE SEL1 sup=
port
-SRCREV =3D "fe7f737ec20add15d49c587ebeb55f7ea0118226"
-PV =3D "2.4+git${SRCPV}"
-
-FILESEXTRAPATHS_prepend_tc0 :=3D "${THISDIR}/files/tc0:"
-
-SRC_URI_append =3D " \
-    file://0001-FF-A-Register-secondary-core-entry-point-at-SPMC-ini.patch=
 \
-    file://0002-FF-A-Cold-boot-and-wake-up-from-suspend.patch \
-    file://0003-FF-A-Respond-to-PSCI_CPU_OFF-from-SPMD.patch \
-    file://0004-tc0-Add-Theodul-DSU-support.patch \
-    "
-
 COMPATIBLE_MACHINE =3D "tc0"
=20
 HAFNIUM_PROJECT =3D "reference"
diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.4.bbappend b/meta-a=
rm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
similarity index 100%
rename from meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.4.bbappend
rename to meta-arm-bsp/recipes-bsp/hafnium/hafnium_2.5.bbappend
--=20
2.29.2

