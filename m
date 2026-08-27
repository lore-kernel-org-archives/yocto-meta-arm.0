Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A9BC61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:37:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36303.1787837869150001288
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Aug 2026 06:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=QzD0Cgq1;
 spf=pass (domain: prevas.dk, ip: 40.107.162.38, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRwP+iuSNDgVNpBSGOF3KEWmkZWZrid3kTWz/eqR/BHYhqc85OIp5xPNwNHwuUe29i58GD0/oq4MQnGPN03HyUWR9R+nCtmoCrob6Ptd0NzwRwzHVmSQ9MPVxe0onlQ+XeTR2RBiNqYhAaQsRkpy6F3QgtKXgXCznz72jf2YmwF6E6BN/nlQJdCZG2S/071Xg1HRDeKMubqHUm6nIFfbF7LB5oveIHG5uLuLYHYFVWl/OMjKHtnTpCedCXA5QqcjhzRuiLv9ilmYAnkJykIq689Hrg0Ww7YwtLEyHgfapGeZm4KQ8F8MSMseSgCyEPo1+9kYpK0s61mXScFcRhbH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXL/aD7oKsXW4AK6Krf6xjvuxIAZ9Hu6E/tBq5AGN+I=;
 b=sYMFe0YoQKZs0vHpMzRCxgvR18i2JoP6gEPa1UWJUW+IwOehTvaTgxetojKnPKrJheKe4xK39+ASTAZK7N2YrspFA+mX2Fw3G9IbBbD5FRDAgC1wOhkEdNkEFrxrJQ+lKFS7hYSZgp4gzUIQIqRgu3ip54aZ1mcah7Fov+LjbDoR6wmS2F+2MUWt65qq+2IhlyQyFWqpswriIjSRK2kRztwCVOLdRRiFG4r5h8Seby2iKoi4AymTg9YECXbLeNsBxN8cs625Y5xPNkdGdjKi4IcL6FEwnEWTFhXnHdXG53IwZbO7EsPZvKGauwodUEZD5luj5hyKSiPIzu5AeZAelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXL/aD7oKsXW4AK6Krf6xjvuxIAZ9Hu6E/tBq5AGN+I=;
 b=QzD0Cgq1qGUns83S7+ydovn5RdM7n1PyV0uQ0eOmVzXnJHF8q6qfBWJ/zU/akDt3sk9kDcIgy12kiX8662ZlSSyFxRmHtLXH8x0CTpAhi1HyjDI5m08Fdxb2tIDTF7jkCk0baRU+W3bV5ueOXCaVy9s1sNl9purvKclPMlEXTQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by VI0PR10MB8487.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:214::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 13:37:44 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%3]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 13:37:44 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: meta-arm@lists.yoctoproject.org
CC: Jon Mason <jon.mason@arm.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Jan Luebbe <jlu@pengutronix.de>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH 2/2] optee-ftpm: rewrite its optee-os bbappend to use EARLY_TA_PATHS bitbake variable
Date: Thu, 27 Aug 2026 15:37:20 +0200
Message-ID: <20260827133720.3246210-2-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827133720.3246210-1-ravi@prevas.dk>
References: <20260827133720.3246210-1-ravi@prevas.dk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CPBP307CA0005.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:1::8)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|VI0PR10MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e05a5b-6de3-44c3-bace-08df04405fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	21uaK34XUYkQbwt872c+YjMnhvTdp6b7bw8E9jdLhRFwFBxgkNOP3eItUvB0xI8xp9BU7Za0gIZcnnzLxCbFoRc+gpiSpR9Iqhwn1ZlAAlnfsZKzHiTCiCAl2BJaGDmGZLtwzscK/em4O9e6nuaHX0B0QTQzcSU7HitoxGeKOhOL9cNfH2AZv8XHSRRlRgzztCc9rcrdNAYDWPBskHOtRdjbG7meFGnq/yqLAIRf7AS4Aa0c+yEzva5yvJA7rkYVT88x6edysQ2spyjKIJ4JR80PcFO2vs/m67T49P8OHMA3FfB2usF5wMaiPeS/woU5VGGxzW2aLAD6DgpHZM5YB9wYw3B5ujSq4F5tZQ1GbYSTDyRF0tX6DIXWFzw6jZwZ4ng4gp52vGo5N2ffcXECTblpe3DzhtZbL7PQjBFoA8Et2BWm4IRPrWM6hVEWKODFBbNFyRPWOTuJYpjm+SZANCfPHR+zVO977Ow2lJS0idFdcJmq++Jidm2LO/4+uPIWfwHT1Mh7bPpCHsImw1jFZeoWwjJuH6waYCo20JnmwmHTR88B8CbxKWl1qm0pvJ3xVPacIssNZCTVTQ7C5MajgfLjCCGJznpH3+GRvbqyEbJY4tKQxF8PDkOiXrDNzN1AdGL3iQezNQ+gjndszByN1sr1PzLaNdj0U4mDUexNSeE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/YgZBn54RxLiMxfXPVTBWkiKRCEDvmtX3SRo86bxmLvu3CtjgIkoLBIBqYxs?=
 =?us-ascii?Q?xnddil5qYR+siiCTISE1ZFfOKCwTH/YH1ZkpRT7OK7uy9nx5nQtzN6ijqPEh?=
 =?us-ascii?Q?qjdJ5KUekMdflDZ3GPRYC8uhvEaUh1CQpYZsh0nnmazxYyE5hUEhUTbNSwj/?=
 =?us-ascii?Q?BBbH8O00aQXlh1kYKvFetElw5603n4PpAiLeCXETwOMTwlhdsQg/Y3GJyjsm?=
 =?us-ascii?Q?nksSg1fMUdX5wXggds8TACZZnbaPdjV+8Hz/RGNwH5at1pZtJPRPF6JYS2fm?=
 =?us-ascii?Q?nd8ICeCIYIlhxYeT9FJ7BRtA0CRX6k4J8DMgevpF0PT2Ww0vq/DTOWyLyL9v?=
 =?us-ascii?Q?zUFpcYow1F0Cyiyb6/0gfCnKHL8ggXhPj4ikmWxX5hI1l6MQzSvqZTRCHw3m?=
 =?us-ascii?Q?aCUWZ2UJ7gm8JiMB3bIAkDWe63oLmZYXLHrna+AnmhAH9y0WzGO5/eGCVcJt?=
 =?us-ascii?Q?Mgu8vI4GjGpKE4m4gDs0YWdnOte9vCxgX+EeuvlOO9lXpEsHSGuYbH0zoPUD?=
 =?us-ascii?Q?VgHOY0jjXULGVjwKtNhJ8GLeYZYfAzL2dDtgmqZACJtWRB/utfKBxKyRgueh?=
 =?us-ascii?Q?ptBPk4bWg6vWE6j1EsxA93h3NQevs//WaoYJQmYl+9V/P9uEeRzGijvyYggq?=
 =?us-ascii?Q?MbcwkemrdHkL4+RYVPR9HnK/NnBH9EN/WBPqIzfcH5WPOb3yHAnln5ng7eCy?=
 =?us-ascii?Q?cjVbfPu7qddfDBdeNmPowpqkcv/FOo5bnUgfwtXb7zHRw9nhIViiGJNdBF2U?=
 =?us-ascii?Q?PlyJPeOWVl2RLYOjDmsnUISywAYX0REwt6woU1g9LCoQgZoUYaHCOMnwflUR?=
 =?us-ascii?Q?YFnLboWJHCNty8ZdYDYotNZEb0LS8t35Wthgfgd/3CtOWar1tMm5Wk5k8tpp?=
 =?us-ascii?Q?v2HfUT+OQkg0QwFa84Nw2Vse6HpMqyApS26c1pF6Aqr1/ml4HAOyH1LlxzdO?=
 =?us-ascii?Q?WCuXUsEGWohcuhLVBjyOgRa2Cuh35jt2gb0TKiA+mfwPC3jBfAbDgZbPtxZZ?=
 =?us-ascii?Q?Eacr8G1/m8jdkcRBzCmDi4SZymlDZ7cyWrS7KoJ4q0hdrLLlzqbB6RkY3GgC?=
 =?us-ascii?Q?ABOvT5iw6SeuvbHOvKDWrHn+u1sZKfZPC+RbuobS/btVFLl66XS+2vvwTpO7?=
 =?us-ascii?Q?SEYzotRyrYFZ4rFrPVAXiCIWJfp5leOmxV9+Ggl/88AFZUDT650x+1Hrqvf0?=
 =?us-ascii?Q?PiQGFw/TmPCChl7KX/avnq/1ik43xx4374Tj38gf+Rbto+Yx55SOTysDLJHz?=
 =?us-ascii?Q?2qmzPTnTOoiUZzSVueIku/zVqFtpX1LMWMw2nQ7eNRQY/EynwVCh5ztOZZhS?=
 =?us-ascii?Q?r+CL3gRIwS7N2//vYEphxQztJVLaoRfqfg0EyMPK4gB2Q+7QwZlvYvRZ0N4X?=
 =?us-ascii?Q?OyixSXfWqHD9J3/NJIQwoUKz0lBe1f12lYmM1QMKQVaFwrN7CHLMylkDDZOo?=
 =?us-ascii?Q?XcXASBZACGD8lIdCWsf9q3pyKXGvpTICkPVwEtFG94zKk0w4emkXUQawvgIN?=
 =?us-ascii?Q?gaqZaUFHzLIFfDOYVwcN7jQ1+aSYp4rtbJ++dagt9TKupCij01ZCttu6f8vK?=
 =?us-ascii?Q?e1YtLO519MDPvgrR91cDbeN0dKqU+NxN+kxYQdNVYVnoFpP4R1imspwg+vN+?=
 =?us-ascii?Q?mKSFuR0NHaebs+u7CGg3OGqneKSJSnATgNXdPdWr3QcQ8+1Iyyo6mtM6Ur1p?=
 =?us-ascii?Q?9OUGdbwv9o6IJxuBXC5t7GnzO6rb1sjS7VwtUjaKkTpHG6ca9zWMTwrT0CyZ?=
 =?us-ascii?Q?/3PwZ7IcbNwa9CJJ6ucn3ndEJvXpe7o=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e05a5b-6de3-44c3-bace-08df04405fba
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 13:37:44.3385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzE4gJuT5luIAanaNy6SsNGTX6ZGxZnMQ9fSAhHMFIZUTiNYvZLKs/plptzWZCWylkarixaoAL0WpETbxMRo0k7O9UNEdhRQX15DcnlrV1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8487
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Aug 2026 13:37:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7146

From: Rasmus Villemoes <ravi@prevas.dk>

If anything else in the BSP also wants or needs to add an early TA to
optee, that will conflict with this .bbappend adding its own
EARLY_TA_PATHS=3D"..." argument to EXTRA_OEMAKE.

Instead, add the path to the ftpm TA to the newly introduced
EARLY_TA_PATHS bitbake variable, which the main recipe will use to
produce the make argument.

Passing CFG_EARLY_TA=3Dy explicitly is not needed, as optee-os' build
system sets that automatically if the EARLY_TA_PATHS list is
non-empty.

CFG_CORE_HEAP_SIZE is somewhat harder to make play along nicely with
other .bbappends that might have an opinion on its proper (minimum)
value. For now, keep adding it explicitly to EXTRA_OEMAKE.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 .../recipes-security/optee-ftpm/optee-os_%.bbappend    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/met=
a-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 92c11157..74bde25e 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -4,8 +4,8 @@ DEPENDS:append =3D "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'optee-ftpm', '=
' , d)} \
 "
=20
-EXTRA_OEMAKE:append =3D "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', \
-        'CFG_CORE_HEAP_SIZE=3D131072 CFG_EARLY_TA=3Dy EARLY_TA_PATHS=3D"${=
STAGING_DIR_TARGET}/${base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"',=
 \
-        '', d)} \
-"
+python() {
+    if bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', True, False, d)=
:
+        d.appendVar('EARLY_TA_PATHS', ' ${STAGING_DIR_TARGET}/${base_libdi=
r}/optee_armtz/${FTPM_UUID}.stripped.elf')
+        d.appendVar('EXTRA_OEMAKE', ' CFG_CORE_HEAP_SIZE=3D131072')
+}
--=20
2.55.0


