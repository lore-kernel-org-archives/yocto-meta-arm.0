Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.58])
 by mx.groups.io with SMTP id smtpd.web12.4906.1625571416921750988
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 04:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MzXAhRUj;
 spf=pass (domain: arm.com, ip: 40.107.2.58, mailfrom: ben.horgan@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj16Ij+V+KnR9ScMp3unboCsk7xf6wnVDTIKGWzJoeY=;
 b=MzXAhRUjkRWLwIPy5wvGrTJ2oQNUKub4R6SIxJ7cYFYGft1Xfzr90Q3Y4lNpO0qkigcA2UZTzJs1RSSJXKlpFcL/xsn6+7afHVVwCjET89MZq4ptDwa3dhsQ8UvzSxJtm/o7yw1wNlYHoBFR3CYHznvSocgkF1JWoe6MPx9Fn1g=
Received: from AM6P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::21)
 by AM6PR08MB3046.eurprd08.prod.outlook.com (2603:10a6:209:48::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 11:36:54 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::f2) by AM6P192CA0008.outlook.office365.com
 (2603:10a6:209:83::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 11:36:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 11:36:53 +0000
Received: ("Tessian outbound c836dc7aad98:v97"); Tue, 06 Jul 2021 11:36:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aaa497b3b2d12dd0
X-CR-MTA-TID: 64aa7808
Received: from 897168059568.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB86D8B8-122F-4CA4-A60C-E209C2D54FF8.1;
	Tue, 06 Jul 2021 11:36:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 897168059568.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 06 Jul 2021 11:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fh3nlNEQHYsOzEvTvL5Q2LWYfZntb6DADpX77pptOJrOFKprpoWn/5sWeGC4tAfLqyr0VF+hXvuQY8uknlf14YT9+GYx4ucdy66IT8iT/nriRZsZ6hQOzkNmzKZBPD3XOpYZWmn+l6zuFKb1FIKDbgouUdHhJMHucOkEh3TtkeYRcx7jDVWN40UnjIzfBzWmJVa/UjE3AAYq3W2MicwTL4fi9mLMJwkICnaxkiD7GVl1Lc4T3Xmtke5xndSmTcxvbtR6j4zg9xn6HIWw2Acmk+5mFn9kRXdrxf+8QwbmnXYZ551JQZDqSur2/rTuIb4MaP2AaEqUX6JQiOEqjTjbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj16Ij+V+KnR9ScMp3unboCsk7xf6wnVDTIKGWzJoeY=;
 b=P9YC8j330nqN+XgJpV+5kMfBJNNE1HI7fSdEG8kY4/90d3zavwIN6NssjXcYnFwYrFC1YzqR3suB5UAkHsqZzoYu1PZTNAQF+i0aOVJqBzoeGZwKcTdLT08Q/MMAuFUj/eVJrVDvIl91h/+/hRvYdhPx9ggDPmnPcd3Uez786iZYyr+uQ5jnNT+ZlDVgb7SmMqx8ojCcxQPU/QGR5QcbbaksREp/NdSXPEMDwWDWFOw6kx/+wo+rb6CMzhWtZaA/krXtoElKIAKW2LL821OzNyCCaeyXEBfkZj3Op0fk9FDcUyE+k7oACId/WGox0h6q3uy2+/RWo/flNwC9AeD8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj16Ij+V+KnR9ScMp3unboCsk7xf6wnVDTIKGWzJoeY=;
 b=MzXAhRUjkRWLwIPy5wvGrTJ2oQNUKub4R6SIxJ7cYFYGft1Xfzr90Q3Y4lNpO0qkigcA2UZTzJs1RSSJXKlpFcL/xsn6+7afHVVwCjET89MZq4ptDwa3dhsQ8UvzSxJtm/o7yw1wNlYHoBFR3CYHznvSocgkF1JWoe6MPx9Fn1g=
Received: from VE1PR08MB4768.eurprd08.prod.outlook.com (2603:10a6:802:ab::22)
 by VE1PR08MB5007.eurprd08.prod.outlook.com (2603:10a6:803:10c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 11:36:23 +0000
Received: from VE1PR08MB4768.eurprd08.prod.outlook.com
 ([fe80::2c51:9493:6d4f:e2cd]) by VE1PR08MB4768.eurprd08.prod.outlook.com
 ([fe80::2c51:9493:6d4f:e2cd%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 11:36:22 +0000
From: "Ben Horgan" <ben.horgan@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license checksums
Thread-Topic: [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license
 checksums
Thread-Index: AQHXclrZELtJLJR9J06pfbBJ+LCKdqs10Tux
Date: Tue, 6 Jul 2021 11:36:22 +0000
Message-ID: 
 <VE1PR08MB476875B8E8A76D9F136B0623911B9@VE1PR08MB4768.eurprd08.prod.outlook.com>
References: <20210706113402.18696-1-ben.horgan@arm.com>
In-Reply-To: <20210706113402.18696-1-ben.horgan@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 29116bc5-984b-491e-3612-08d940725a63
x-ms-traffictypediagnostic: VE1PR08MB5007:|AM6PR08MB3046:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3046DC4E8A7559A93E3A8268911B9@AM6PR08MB3046.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 3goN7dGt47nLO412kDlWJnavGZsAAidZIjppgsGCedPRz2b4+Su39KdYz+4hiz38T7FaZEZb7YC9VYY/MD6Ck7K3ewkZv4qWHwUlSc1wE2pn9WE/igjzOyyEAwA64DhdGEsndNc5JJXCO2/GtoIJLAJbRspKTNFRetmhypf4qIscVW8wLOSGZnWjJbddZhEzYRQ4kRJ0SaLrCJkTVBxcFSB46psIObuQy0THIv6fzydVAtSEGtyr6gxifBYPAUBkTufufQPuPDCl2dIW/nzlYuUnT61uwPIJqSwVMY/0So7+Ah6LjQEn5O5WqVzOM1jMjWf22rffwo/f+hflbx/bgxtMeFpV28RWcbqw+0QolWe/lGHXH/LRpHG73Kf+thicU2EjzHavQ8IFHs2b7fPfOLOtYqMsFIZoV5k3NpE3JoGTttHShBjjB4k02bxO3Cwi1M/JYanyGAC45yk3PxOmwc1X84XT4/PeP9Ecsi9IJaqas52++ywZIcWWPQkKW7a2dLMyZORfpSI3d6YBDQN+tkFTGNk0jaFy8BIfntrKKITEXoquJdhcKD4L4FbNDtYa7wbiEtWrejAziECH6J9tW7Tmh0gkyhWeOW26zUoh0Qm3kR+fspE5qc2wrq+YNWu6GYsBiVe7/vtyRJL/RPWurg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4768.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(52536014)(71200400001)(9686003)(33656002)(66556008)(38100700002)(8936002)(7696005)(55016002)(122000001)(19627405001)(5660300002)(6506007)(86362001)(66446008)(76116006)(66476007)(2906002)(83380400001)(478600001)(186003)(26005)(64756008)(6916009)(8676002)(53546011)(316002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+/HMRo13RfptZNviOsbRwADlJoRkam5pDgH9P1/uyw5QOyUxVrk5PEcP/qdy?=
 =?us-ascii?Q?xTt13aAGYtLBsgImJi8zQaCdku4UW0mLxMvue0zaX8VK0mqgXXoNSarZ7W7I?=
 =?us-ascii?Q?qxXQarMn7WertwUAL5OOyft2YaeJXjwTnLX2+d/xoff4RiJzYSIc8N6W3XbV?=
 =?us-ascii?Q?Rj2luGIg7eRsoeOLG2+8PrfNixHmeIZ5Ajl6p1ceoR1uRxYsWQ8CjOqZWJ+l?=
 =?us-ascii?Q?ntFmZk1kraxoP+zYxxipR4M1FOx0ZR2BhpO8CcZxT/heDqjg1bCOqZeQBVYd?=
 =?us-ascii?Q?zBPuzTy8wOotmoDwnId65qd6lV7SOMJyu36Oy7xU3iISljJotNyydeL+u/9D?=
 =?us-ascii?Q?pQE++aXSC9GdsidiDMr2zJ0a70uIPcpRk78kmXyTbMjzJLUfv3oW56iZlYdb?=
 =?us-ascii?Q?71ihcRzppqknrXVkTpbkeq++MvNvyHFT/c4er+N3HgiAhi27XoHWwI5SmGmV?=
 =?us-ascii?Q?Kyh1anxdNaByxQhzlD3dgTebIHujZL7cou61M8PO1u3mv/X0fVdw56ycf9Ny?=
 =?us-ascii?Q?vKJGHF9ufT/Cueb97mmwFIyyRdCn4aU3uRN8GVulWT2H/e3NKn6HRltPB4Kq?=
 =?us-ascii?Q?h+vKf6E+gbroH2C2tl2BnszPDKmJ51+Hhf2XT1xZ83O4sc19Kvqo0+SfYEOl?=
 =?us-ascii?Q?n204l4f+G9nbqsfuMUnbCYgj8rlTBv2FnmP9k+E2Fnz14JH7uHxSN9Ef2rz8?=
 =?us-ascii?Q?majq9lifMmxlGJheeWu2Xlg0/8HObbu/zyuWl6Kf1OcOUv0IZvWbwyQi7uD0?=
 =?us-ascii?Q?p/n6nnDVqdlAUraQt4zqXmgD5NoXePvnOL69XrJJFJo5kS3zVTwj2yk0KHBz?=
 =?us-ascii?Q?ZdRjULN84JqUouFhIYykJlEprWwGJdh3kd1GuKrJ1nAQfiorKxvKs0oRdaLx?=
 =?us-ascii?Q?YQ19ZKsqibH3WzyblYfv54vfhZ5vG7nWM6dEKqClFbzs4StGX6TviXPFsnHM?=
 =?us-ascii?Q?0JSZv6g8T81wjPkcOGdtaDzJ0fKyC9mYgSqWv8k5m5KalHMH0VQgYUtbwBXV?=
 =?us-ascii?Q?5EyH94fQkuhQNeV8jcocfOKEsseG/HlgEzvlZpE++Stk4vZ40OzFkdK+mlex?=
 =?us-ascii?Q?jYzSML39JkwOLfgQS75RqJamO68khuOhwDpEXQ6VVIcrih+FhDv31PWkKCaB?=
 =?us-ascii?Q?oibs0VOczA8jn3Q/0gODDaBWX8/8vSrhWn8CTw4t3/LG0DtIkw0YOJrPCxox?=
 =?us-ascii?Q?VS8arZGUjnaO4QbMrQDB618bqAm9P96YSNlrqDqTh8t+7sgFBJDAtz/t05CU?=
 =?us-ascii?Q?WjxzJS138gtZtovdPTZ0GJQ7kmkoJ55VVPxXA4kuQBDADB/5l35CBGIeVlGC?=
 =?us-ascii?Q?dc4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5007
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Ben.Horgan@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d7429ee-4f7f-4ea6-4e66-08d94072480d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tOvC9r2DddWibQgbCIiFNk6nZ6bcKRezqgcqb2PtbeChGQrlVALgAbx9WYXdqbQooDyvzYEu2da8YA9098a2eS30I+Z0f1baTgjhFgI6wmXdmybu0AuTEclnpybhAqDT5psAzNY5pDHtiHd7cNngun4rvTkZnds2/m3Mij7VjPrCJH+jAXKv2AGlztKTBpuKguScWsYdD9kjO62EVYR2WnX6nfGBzjvJkJL1nGf0dD+/mvCahd39f/2KPJ8bSiagaAGGVquX6N64a5CQLiy9rB+0zyh0rA4LKkjHnInZ81L7JecknS6RFHVnfbR4SPyf5yRHPPj8uQGpa0N839QqsNvHgxNBNKM8pfAvgtUf94pcd/XyY9LEp8BzRz+l0rkW9P1JFYbsXQvmYOsXGpDq3vYtbNlzHhoqvK37D/fxhbJaI/IAk8JCxxxlYkeC+jCthYdCF13Omc7WF9JP1Y1m/o+JK2dS5bt69D4l/LZ/Fm46A6+yQuWhrRT/tJp3KwVhoCkKNnDDEOFfeD2l11yK3ABpVF6ToJxtsX6V1MKdfRkB82g7iYKrsruKZg3XIkEjUxAx3rBiI/NlDKyW+P4z6bGQjCpJV9kMocqw0/29v4u5r+hYxGKDx80rlvOWbQOhW9B8GJCdxPHCHwP+JL5aFFG7iUuqq0K9EC5e09LvatRqF68Rin0qI59nO1bJPOzN14aqZL4Vdo9gfAl1aIX9hA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(36840700001)(7696005)(6506007)(478600001)(53546011)(26005)(316002)(81166007)(186003)(8936002)(356005)(47076005)(8676002)(83380400001)(33656002)(336012)(82740400003)(70586007)(36860700001)(55016002)(52536014)(70206006)(19627405001)(86362001)(82310400003)(2906002)(5660300002)(6916009)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 11:36:53.5986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29116bc5-984b-491e-3612-08d940725a63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3046
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_VE1PR08MB476875B8E8A76D9F136B0623911B9VE1PR08MB4768eurp_"

--_000_VE1PR08MB476875B8E8A76D9F136B0623911B9VE1PR08MB4768eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is meant as a v2 patch for "[meta-arm] [PATCH] arm-toolchain/gcc-aarch=
64-none-elf: Fix license checksum on x86_64 host".

Thanks,
Ben
________________________________
From: Ben Horgan <ben.horgan@arm.com>
Sent: 06 July 2021 12:34
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc: Ben Horgan <Ben.Horgan@arm.com>
Subject: [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license checksums

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 .../gcc-aarch64-none-elf_10.2-2020.11.bb                      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc=
-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/ext=
ernal-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb
index 5cbab9e..91caee1 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch6=
4-none-elf_10.2-2020.11.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch6=
4-none-elf_10.2-2020.11.bb
@@ -9,8 +9,8 @@ SUMMARY =3D "Baremetal GCC for Aarch64 processors"
 LICENSE =3D "GPL-3.0-with-GCC-exception & GPLv3"

 LIC_FILES_CHKSUM =3D "${@d.getVar(d.expand("LIC_FILES_CHKSUM_${HOST_ARCH}"=
))}"
-LIC_FILES_CHKSUM_aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D1b54=
8d9c341b3b5c82bc88551964aa60"
-LIC_FILES_CHKSUM_x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3Dc1df8=
56e21b17e58b0adbe29cacf4bd4"
+LIC_FILES_CHKSUM_aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3Dfdf3=
9a58ab6e893f3d83594cef77fa05"
+LIC_FILES_CHKSUM_x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3De4bcb=
5bee0c4a50c06704b0b73fcbe0c"

 PROVIDES =3D "virtual/aarch64-none-elf-gcc"

--
2.17.1


--_000_VE1PR08MB476875B8E8A76D9F136B0623911B9VE1PR08MB4768eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
This is meant as a v2 patch for &quot;<span class=3D"_15gqBTUta5ZVWkGNTkvx9=
0">[meta-arm] [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license check=
sum on x86_64 host&quot;.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span class=3D"_15gqBTUta5ZVWkGNTkvx90"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span class=3D"_15gqBTUta5ZVWkGNTkvx90">Thanks,<br>
Ben</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ben Horgan &lt;ben.ho=
rgan@arm.com&gt;<br>
<b>Sent:</b> 06 July 2021 12:34<br>
<b>To:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Cc:</b> Ben Horgan &lt;Ben.Horgan@arm.com&gt;<br>
<b>Subject:</b> [PATCH] arm-toolchain/gcc-aarch64-none-elf: Fix license che=
cksums</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Ben Horgan &lt;ben.horgan@arm.com&g=
t;<br>
---<br>
&nbsp;.../gcc-aarch64-none-elf_10.2-2020.11.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; | 4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc=
-aarch64-none-elf_10.2-2020.11.bb b/meta-arm-toolchain/recipes-devtools/ext=
ernal-arm-toolchain/gcc-aarch64-none-elf_10.2-2020.11.bb<br>
index 5cbab9e..91caee1 100644<br>
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch6=
4-none-elf_10.2-2020.11.bb<br>
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch6=
4-none-elf_10.2-2020.11.bb<br>
@@ -9,8 +9,8 @@ SUMMARY =3D &quot;Baremetal GCC for Aarch64 processors&quot=
;<br>
&nbsp;LICENSE =3D &quot;GPL-3.0-with-GCC-exception &amp; GPLv3&quot;<br>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;${@d.getVar(d.expand(&quot;LIC_FILES_CHKSU=
M_${HOST_ARCH}&quot;))}&quot;<br>
-LIC_FILES_CHKSUM_aarch64 =3D &quot;<a href=3D"file://share/doc/gcc/Copying=
.html;md5=3D1b548d9c341b3b5c82bc88551964aa60">file://share/doc/gcc/Copying.=
html;md5=3D1b548d9c341b3b5c82bc88551964aa60</a>&quot;<br>
-LIC_FILES_CHKSUM_x86-64 =3D &quot;<a href=3D"file://share/doc/gcc/Copying.=
html;md5=3Dc1df856e21b17e58b0adbe29cacf4bd4">file://share/doc/gcc/Copying.h=
tml;md5=3Dc1df856e21b17e58b0adbe29cacf4bd4</a>&quot;<br>
+LIC_FILES_CHKSUM_aarch64 =3D &quot;<a href=3D"file://share/doc/gcc/Copying=
.html;md5=3Dfdf39a58ab6e893f3d83594cef77fa05">file://share/doc/gcc/Copying.=
html;md5=3Dfdf39a58ab6e893f3d83594cef77fa05</a>&quot;<br>
+LIC_FILES_CHKSUM_x86-64 =3D &quot;<a href=3D"file://share/doc/gcc/Copying.=
html;md5=3De4bcb5bee0c4a50c06704b0b73fcbe0c">file://share/doc/gcc/Copying.h=
tml;md5=3De4bcb5bee0c4a50c06704b0b73fcbe0c</a>&quot;<br>
&nbsp;<br>
&nbsp;PROVIDES =3D &quot;virtual/aarch64-none-elf-gcc&quot;<br>
&nbsp;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VE1PR08MB476875B8E8A76D9F136B0623911B9VE1PR08MB4768eurp_--
