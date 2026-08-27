Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AD8C61DC6
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:37:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36303.1787837869150001288
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 06:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=Xgoo4Kwe;
 spf=pass (domain: prevas.dk, ip: 40.107.162.38, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0hzT6gHTaNCJn6CBkX9Rk15ihxonA/z6+gpHBjyHxCTxzSorwJkP8DKAckTDKBr/qYg2zugC2uYXEx3YPqNLV7DaE6xMUC5gaFHaQrXp3xllYgri3w21EHVZ/9KFmBvGzpnKDkY9MuJ9Dyj0DJsA9bnL1iGikJu77X0+Wj/QUctumlXnfGZlHg5RwB47saoDLEQ29/h9L7SYw5s4tDMv0ndcxcp4jarbjaEQIMuedMOpn8nY3HmcvYtUBYFhRsWz0WQqpBZpQJuQCeyHPHF5sDJwx1ugbqWPMtVCaQ5UI9/EoXHcY93+yP/i6B9leM8bM6yoYRKLSv/63VjdEqwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8p6hYUemQIpUk08Jovdbm1eSEOfvQyK+jBe5HaXk4Y=;
 b=vtRWxB+KoqeEqCrfLH125av8bSuv1iNzBSySTeZkgZqnE72rK5+QO/wOEwHX+q4tSQ1mLgLGdcsiDajiWMSiyQ9Z5T8kZX/bxdRNHZRoIKkSxSGNB3P0mDb6AhiHZqrzt61V7XgGGWGfXDszF0FtgoMuyRJnvLv35F3QJkyeVRWXjPxnrKpJzUlWYr5E31OFusxRJKsM8vgqO5hTiwflBArYtgko4ozBdUP5xpUG/K35WMRgwuizjFKIv1ObAxZCrEV5OITaNhRxuiO3Q/HI6ThFgMU0wNF0PP03UwSFX1suohH0/FwjVchu/qEaqj3LVD8NkeQIKaenTWuTTyIohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8p6hYUemQIpUk08Jovdbm1eSEOfvQyK+jBe5HaXk4Y=;
 b=Xgoo4Kwelu5Y5KfvQO/GS3xJcMi+HAMNVNRO5Fwkzcuohm3yOMotO+gsX7HvvGOJ/Jh19PXiwrXXzmk0gzMANOe+2QG8eowrNjZistlZlJ/aHgNoC2WmpgPLZZvSf4LoisDieU3XLAXL0L2ZZLQ8vSqsrDJVjlUqiAcZ5ow/MIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by VI0PR10MB8487.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:214::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 13:37:43 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%3]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 13:37:43 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: meta-arm@lists.yoctoproject.org
CC: Jon Mason <jon.mason@arm.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Jan Luebbe <jlu@pengutronix.de>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH 1/2] optee-os: make early TAs more convenient to add for .bbappends
Date: Thu, 27 Aug 2026 15:37:19 +0200
Message-ID: <20260827133720.3246210-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CPBP307CA0001.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::11) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|VI0PR10MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: f7436ea9-d7b9-457e-272a-08df04405f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	XUYlEBQ1IyzJco2iVOxw6acitBJQ55hg/Ou1VcikmUvrk37/5t5WOdbml9Lp8hV1Tw6C82C/kCcmjhpzT3v3xgwrT3FVG9jA7R+sbWqpsGG8Ho3C8JkyyfHe4LuaXLrasCPnguO7DKKv1Y8KyMqJ6udB6udPojM0KBJMVpImAcmDwaDFMYNNBuquEjjxvNTtwoDmKRqe7naZl1OHLSVCa9jInPgyueX+LcjNLn7HSTsg+tpnkTx3H/rEMhetzuIZPDPkdKRWrT7832RG67T1Z48nHUWYntvKifVtMhMWBZr49onDi38OcvvtfirKlAZA8jOIL2ESvUE420hx7X6JfciVnOViuzWATlgZM6PuBl6/gbJQSFcbGGWYHMxGlUIy9Sc75Kxv8ZsW2ID/r6uvBWkeisLjbG6iNzFVMiicgI3cHGyaK0D6kK30+x9JQfddj4b6NqlO5Gz+0mIOQkVBKjKtxhQQwc+FnPd3llX/7UF29wsYuiIrFiRnBbbkuVGxcPJA0hjx5w5NXZ0A9+hCiLXpYWVxx2G4FhsI4jvZl4gWH8Ev7gWMW/zsGHnKo6F8w3tt50YDv03g0N2ZoZhabdMdRTWbWgWb5pUmvX56Jx0CSTKIxnzCCIHwLijQlWFvSIob0lDCturdn6+G7ns3ulc/H9jZ+KOoYX3bhsakJyA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cbqP25XNZEDFlhA7/FWfP7eD37aXH8d+qlIYEE8FzcgX9W4Gbk7LFwTXst+y?=
 =?us-ascii?Q?4Dks2Ji3Q0PLP06vN5qKyUBQU77G1/a31hYoPiB1hG7O2T7PcxFvDS2yftz6?=
 =?us-ascii?Q?gyBlCfAzV2xaYiMoVaT//xfBiDGvMFvn/mR/J1eq7WmlpCQX2FZgBP80vY5B?=
 =?us-ascii?Q?XWsAM2GKqimOlFYke4U7LZ/CfrNcOA3S5gC0HasURL/iRb7MbSJTTCPHMz3t?=
 =?us-ascii?Q?atQFs6rviS5neeuPPT51TigY09Ftr+hpN6e2F3hr8BqWTFCfVY5qLMHXjqRs?=
 =?us-ascii?Q?SKmjLBziljwG1wp6+8VN6X2wb4JwwDdtURiymspTGyoCyaKFzgew0MuAlE3j?=
 =?us-ascii?Q?WWT5xP0yCDd9ROWp7MUxhtrxpTqHx5NyOH2MDmr/G9zV5teavAUOhOf4s+/e?=
 =?us-ascii?Q?wqa9imYiTEjz3/xZPlyq8g+FjQ2SNFLQ5dB7sdY1eZZ/smxAL2c0jNCXuRfK?=
 =?us-ascii?Q?ubw+RDkC35hbzPBewHBWogVk7TZbudHPhKtUWpjoEyXHMdcE/NaLLp1Vis3w?=
 =?us-ascii?Q?QyAU8XTxiHa7G1/ozckMf0nc/tw7OMCT0Mu2h7JWqwp4gnuysWIVyMsb40O3?=
 =?us-ascii?Q?tpCtTjlIEYeIUlqoqwM2MK39uVN4X2zJtVBQrtLG0WrPYqgiAT78Io+s5mAW?=
 =?us-ascii?Q?x3Q4ny8X8p2ymPOL47WgObvMPNV/QTmBzVj7A+dzMj8pFrjQ+bP5eBMTr+bH?=
 =?us-ascii?Q?lWE5eeFqKte9tGQsilVJGJ9n+K6EL0Me6eW5jwCFIfMJgWeLu8OyMEtGoOMN?=
 =?us-ascii?Q?O2+Dk0P3IqpniSyfa7s2d5uZ9owtqRMuUgQxG5SqSWDBZuxRkWFcEa35Jhcw?=
 =?us-ascii?Q?IGd6Wo48BBfv6ns3W7iFOMIhrQ11PcZAsTZ2aD5wgUSQeFEiH02GPiakh9Gg?=
 =?us-ascii?Q?EKGOM3yHxD6gzdBLrVP3xmJnF0Ca7C3ycJ/uSLUOTbpUnP7fRYpZEehCySUS?=
 =?us-ascii?Q?z+7E4hjzbq4R6tVpReHIBA5M4lVYplDG8JVQ6RPV+WkYNr2Z6NKhjldeDUoG?=
 =?us-ascii?Q?2FVgTmMiAL7ao61RI2busN+4SSU+6V0FIjW1HGu2ZtCLdAQyhQRZspZ+7V+z?=
 =?us-ascii?Q?bIVb7E8ztWW2gryBl1/t8Ev/0qMikI/W+PlG6gQFgjdfI+m+4SoiNbSNpYJ+?=
 =?us-ascii?Q?iSzt/5B0DHCYTuLdEdJ+mm8EkZ6L/M5XzWN9qQI+5jbRax/BVTaNGrImea4U?=
 =?us-ascii?Q?c89z91zMok/wAEB/i2lu8WATdnJsXD9JKkiPD4LrVLEsKOboWLxwkskBbIyb?=
 =?us-ascii?Q?NeWLR7FvCYC6oCGGX8VwT6sQ4IqAYN6p/CsubsiJsSE0W0keQkMoJUiBFv/R?=
 =?us-ascii?Q?cxAaA783zVTtOk1nMf1qxzrwP0lBjo1YpOJsiSZ0VvqpWxqJDkQxTSFK1/6+?=
 =?us-ascii?Q?9skE/pBc9+NiayLk6xeMrGpruI9qF88ssV7D/YSrZmTIVW4y2/mzElKYNRWf?=
 =?us-ascii?Q?gO245U4EBYxDKquFPbeahxTQ7BYPzx219pMdt7Epk1vaKbralF36Zh3+yN8D?=
 =?us-ascii?Q?gBlIElW9CVHa5Kw8WDEGGPXxWm7y7Ixj28hvNYdy0ydGUJKbxmhQW27+W8ct?=
 =?us-ascii?Q?HYg6K6pXS3Dnmn+DLobwR88ZdIhlZ9tDUcdnPXGHz//L0okUxXsymzAF5wWF?=
 =?us-ascii?Q?xjQXCQXZmyFfFYdaSG+R2WtnXdUVlV0lGAUV0/EtsHhcuoiS5+ZgNg8j4Jmr?=
 =?us-ascii?Q?vLVpMtn5w7FK6FqX6z6b8mmdcNz1DFTU0pznz0J2ldHCGX3yyskcqItwafQd?=
 =?us-ascii?Q?jwnOc8MJ6Uyw5apC44sN+od/oZHhaUY=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f7436ea9-d7b9-457e-272a-08df04405f12
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 13:37:43.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0/MnHwoYUzCEryHhUijzPtSHbcoVI5FXe44HGkIFz+yw4ZY+TPkpCNRNcq4iKG8Xt+Lgs82VxcEavZgQBHYOSk+sxIjVgaXd5VftL5G/UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8487
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Aug 2026 13:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7145

From: Rasmus Villemoes <ravi@prevas.dk>

If two different .bbappends both try to add an "early TA" by appending
an EARLY_TA_PATHS=3D"..." to EXTRA_OEMAKE, only one of them will
actually take effect.

For example, meta-arm itself has a .bbappend in optee-ftpm which adds
the ftpm TA if optee-ftpm is in MACHINE_FEATURES. If the BSP developer
wants to add another early TA, he has to take that into account and
very carefully ensure to create an EARLY_TA_PATHS=3D"..." argument which
contains both the ftpm value as well as his desired extra TA.

Instead, let the main recipe define a variable which can simply be
appended to in the normal way, and which is used for deriving the
single EARLY_TA_PATHS=3D"" argument in the make command line.

Handle the in-tree TAs similarly.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta-arm/recipes-security/optee/optee-os.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipe=
s-security/optee/optee-os.inc
index 95c41fb1..b90e379a 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -35,6 +35,21 @@ EXTRA_OEMAKE +=3D " CROSS_COMPILE64=3D${HOST_PREFIX}"
 # Enable BTI in optee
 EXTRA_OEMAKE +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-branch-pr=
otection', ' CFG_TA_BTI=3D1 CFG_CORE_PAUTH=3Dy CFG_TA_PAUTH=3Dy', '', d)}"
=20
+# If several .bbappends wants to add an early TA, and they both do
+# EXTRA_OEMAKE +=3D 'EARLY_TA_PATHS=3D"..."', only one of them will take
+# effect. Instead, create a bitbake variable holding the entire list,
+# which the .bbappends can append to, and add a single EARLY_TA_PATHS=3D
+# to the make cmdline here. Similarly for the in-tree ones.
+#
+# Note that it is not necessary to explicitly pass CFG_EARLY_TA=3Dy as
+# the build systems sets that itself if either list is non-empty (and
+# errors out if CFG_EARLY_TA was explicitly set to n).
+EARLY_TA_PATHS =3D ""
+CFG_IN_TREE_EARLY_TAS =3D ""
+
+EXTRA_OEMAKE +=3D "${@'EARLY_TA_PATHS=3D"' + d.getVar('EARLY_TA_PATHS') + =
'"' if d.getVar('EARLY_TA_PATHS') else ''}"
+EXTRA_OEMAKE +=3D "${@'CFG_IN_TREE_EARLY_TAS=3D"' + d.getVar('CFG_IN_TREE_=
EARLY_TAS') + '"' if d.getVar('CFG_IN_TREE_EARLY_TAS') else ''}"
+
 LDFLAGS[unexport] =3D "1"
 CPPFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
--=20
2.55.0


