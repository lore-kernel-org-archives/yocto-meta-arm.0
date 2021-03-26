Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web10.341.1616778859464893433
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 10:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=f5h98RAN;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: jack.davison@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYy8EDf834qA4fgeu25vl7pUn6Cm05kYi9psv2/DmlI=;
 b=f5h98RANpgKLKXAPgSjYvsLus0yb17enpWT8xdbn5YKahgYNzdrP0Pu8ctga5egHSH11D8CIX5O4PMBMtMevvOvSoMNiBwFcoICf9TmVv3YB9XD6Dr/GxOgKWyKh9+aQgGRYEasXFoGueep91Hz5ODL9AMEHk8Ko0GwUd7rHhhs=
Received: from DB6PR0601CA0040.eurprd06.prod.outlook.com (2603:10a6:4:17::26)
 by PA4PR08MB6303.eurprd08.prod.outlook.com (2603:10a6:102:e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 26 Mar
 2021 17:14:17 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::37) by DB6PR0601CA0040.outlook.office365.com
 (2603:10a6:4:17::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend
 Transport; Fri, 26 Mar 2021 17:14:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.29 via Frontend Transport; Fri, 26 Mar 2021 17:14:16 +0000
Received: ("Tessian outbound 2220e7a8bae2:v89"); Fri, 26 Mar 2021 17:14:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c91d7db10a1df235
X-CR-MTA-TID: 64aa7808
Received: from 7a1074cadb61.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5AF8E175-2642-428D-BA5C-3F677F4CA1CA.1;
	Fri, 26 Mar 2021 17:14:11 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7a1074cadb61.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Mar 2021 17:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYFyYXRPW3yEbodIJoh2LaKMxn+d8U0nxTg8gXFCfJ7mHlJuS9UhWZr6vSrNGhYV5zOddqjXUWEIKecOmsvC1IP8LjwIrojJTdsWt18JZ78YF6WS35+YJiH74KmAIAAjJwm+meRQOf/by+iYyR35eds2FMJHmoiwshQD974qx9ywXoSim9jWBil609ztN1tNM6oQuwp67oPeGYGia2hqBB2xwpoYHHI1KzH0zHogUYF+UroxOUHa5co6MnP2TvedrcQN33aNsEZ4Tg30R28rdhNKhpsyep3sTl3kuHaHR3/iTnnw0H6n8Ffa0YuiCiQ7NYGpEOwFVC/Lct/HVRXOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYy8EDf834qA4fgeu25vl7pUn6Cm05kYi9psv2/DmlI=;
 b=BQ0q+LB69QIAHe3leZYO6VGebd+u2SQ3rkbQfuZk1kAFaBwRK/UpeknKOS5OEjkUhZAIwVBnmAZVsiI9ZIE/LIA6d+xzTyqvV0HxsgBG29Q9TULfz/PED0Vk89QcjydAWSB2m/+EztYiZtDsf9csVKF2mzs3q0qeexB2R/eoWwRspAer1GVTV2CZRSva5HEXGPIpBA4ia8m7hf8fsm/VBix926ZbGfys6oYoOnxhy62mFD6wFQ3x6kxQ7gQ2NPmnghXrjfxtxLdOLlZl/0CctSpPB+zPiYREkdCiedVfivY4WPLbUA/fNVtQZ8XLnLrmtq5vVQVNMsX8aDDROTWZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYy8EDf834qA4fgeu25vl7pUn6Cm05kYi9psv2/DmlI=;
 b=f5h98RANpgKLKXAPgSjYvsLus0yb17enpWT8xdbn5YKahgYNzdrP0Pu8ctga5egHSH11D8CIX5O4PMBMtMevvOvSoMNiBwFcoICf9TmVv3YB9XD6Dr/GxOgKWyKh9+aQgGRYEasXFoGueep91Hz5ODL9AMEHk8Ko0GwUd7rHhhs=
Received: from AM6PR08MB4967.eurprd08.prod.outlook.com (2603:10a6:20b:e8::13)
 by AS8PR08MB6342.eurprd08.prod.outlook.com (2603:10a6:20b:31a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 17:14:10 +0000
Received: from AM6PR08MB4967.eurprd08.prod.outlook.com
 ([fe80::5858:8e60:48ca:52c0]) by AM6PR08MB4967.eurprd08.prod.outlook.com
 ([fe80::5858:8e60:48ca:52c0%6]) with mapi id 15.20.3955.027; Fri, 26 Mar 2021
 17:14:10 +0000
From: jack.davison@arm.com
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Fw: [PATCH] arm: Enable ptest for optee xtest
Thread-Topic: [PATCH] arm: Enable ptest for optee xtest
Thread-Index: AQHXImMnQ+N2hZTH4Umg0PF2KXih6qqWgb4X
Date: Fri, 26 Mar 2021 17:14:09 +0000
Message-ID: 
 <AM6PR08MB496743D3739473CF74FBBF098E619@AM6PR08MB4967.eurprd08.prod.outlook.com>
References: 
 <AM6PR08MB49679C64E58B7ADC3664EF5A8E619@AM6PR08MB4967.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM6PR08MB49679C64E58B7ADC3664EF5A8E619@AM6PR08MB4967.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [86.141.162.41]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 48d148d6-2f9f-4694-b699-08d8f07a963a
x-ms-traffictypediagnostic: AS8PR08MB6342:|PA4PR08MB6303:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB63039B9EF1AD3D6F64D50E928E619@PA4PR08MB6303.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dUZvxZnysYMuHjsT4xr9HiRUvqNbZ64xpoi0+tZ/Rc7yeuWZApEO5yeOGyvkJCzB1HZT2NZns9A1kT5nq88xUb2KzprJwkRkWNGKmNiqYZ6VF2iKqy3O1ZSrosjvbBMlOwDtdBzwcn1Tq4ob/WcAAxFXS01qRAugrGmO69VvEGKs3lANolb/zm4rDqaRaD9D8kSnEOxpq0KraFr7Wpnyw9fvV7zPFXje02wsHWAwXPeqlizHDt75fe7jnK0ezqQd8v0Pll6I0e8Ih0DqeSlJT4FcmPAdREocvCmCECAcP4waKaDSOY4R/C9tZ1kYTxzm6Py3334k1Y1bIwmA/Kl4Tyjme1jecElyHCytkG3BZg0eD8spgwX85BokHOXUlTjjEs6V0kQ9ffaAw69Fq/oz6CqJ/VAPSHdGuaGiTZvR6qtJPS/hb4aoa8waPBsy70AYNYPlR8uOACzG4cb/zPxsM3B4whWGQv5pYFg4Td5wHeC7s3Riqjs5kfTRDh7cGw0ulGQwAG/mQSTSfhCQ94ej8Bvj3ARyuWrVXwuSUYrZgoFSkcwAq/+s8RfuNuc5OH2YkavGasVRqZVT1MCTXWAn5d8e0XuTz2zVT9osnnTiBP5T4CmT3bPmphlqQzC03TEq4rONzImNibdHj/19acfys/AWkSZH9XN7X4NN1sxWD8vuKu4XQsy78AiSFVFPvgrvgYOSKD6d2V3x1l7ihiRkPehJ5C+ovwnJK4KLXNlyXXY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4967.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(39850400004)(346002)(64756008)(66946007)(19627405001)(166002)(26005)(71200400001)(186003)(7696005)(66446008)(38100700001)(76116006)(2906002)(86362001)(2940100002)(9686003)(6506007)(66556008)(55016002)(316002)(66476007)(83380400001)(8676002)(5660300002)(33656002)(8936002)(52536014)(6916009)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?2hp20L/Lt8XGirDjKWPmecJqua3TL6ndIvTocsmLYc6GRyGUS/yK/WOv0p?=
 =?iso-8859-1?Q?OP9x6Rk25KE6FMqwZ1feEALkrspKKY8QtiiboLS2HCxBQ+L+y3CKMPwwUV?=
 =?iso-8859-1?Q?wRhUt8Yt/xWvdfhzpwop+Vdmx0+GXKVQ+bbr7jZXcLO62tzWis3aI4yJoE?=
 =?iso-8859-1?Q?EXG/I5JEbvi6CQ1GPNLz947KOOHxtbSknJUiH194qUSKMM+c/bMPMD5T4r?=
 =?iso-8859-1?Q?GtZXa8mHUWFUhORouAth2NtDqp117U0pXiOQWKq19PKW44Ar35qTkzKpLG?=
 =?iso-8859-1?Q?aFkfoFhSI+39GOgp8J1p+U37Rj4udHY4APNiC7E7tRUQDAsnEvooBjJRnP?=
 =?iso-8859-1?Q?XRBDB1a8h6S6wndaYFx34L8ggluCihT8PHUWq81L594APwZUTrt7iE3nxR?=
 =?iso-8859-1?Q?GQ5KQJVpjWGKQaUZkUetQ4zcKcTds5QIW9plqkJq18xYqnrRwNwC37YksB?=
 =?iso-8859-1?Q?7Xb28fAOcVEA/G3h8a8OKx8Cr33B3Eb+Y0CV01WgORlAapUy+OydOQI9ne?=
 =?iso-8859-1?Q?ImuF6y3q9vdGsoZeYmhfO7ZwF22fireLin0r6u04V4ZLa59rp1gnniLN0p?=
 =?iso-8859-1?Q?zcygUakERpAO3wZcUmZ7d8/BJQa4ptYsBeyfKiuFFYfMPbIGkGibzcaV2L?=
 =?iso-8859-1?Q?tbQ8ATodyIY3C24ud11pMxbVwj3QLcF9PdJtisgW23ZEzwOo7SWhsPR9kL?=
 =?iso-8859-1?Q?qCIAB7+Bjk3ajQQ2YR5FYX50QoHU+TCjIfO3ljFfBQ9/bfjm8lncn8deOd?=
 =?iso-8859-1?Q?HVcFYV5q8THmS5+AcwAN9g144ueLK+E2CmaM5oL2T5lT66N1w9XeukZdxE?=
 =?iso-8859-1?Q?ki6j6LTat1W0rxV3j3uQW0ljgjBZ9+YsGHs3Ew/IhOczjAmZcXuknA0XB3?=
 =?iso-8859-1?Q?HyqTiy0ogFjdXfcuSuRTlr5SKvyMcDqPJvMGMbxi/k0LABElUTfqUtz8f/?=
 =?iso-8859-1?Q?uGTMmQShh1KGZTVc/jcSNV9rBJipIdvskRBsUVtauAnL3MkozNlTBbsXzT?=
 =?iso-8859-1?Q?Je906p8BCtNB+1H/rxFI0ld2C1+OsQ659F3a9bmxbo0Zxf5Krc60rycvX3?=
 =?iso-8859-1?Q?Qzqo4PnDoJu/vTcYbYSqH+KMBRt1fY8bqoS/Mtyvj4pMgH0bfRhXS9PYCd?=
 =?iso-8859-1?Q?y+2wtUs88it7Ph5FgNrMb8+7ZhoFOa3BzAjgcUve+jKAk9dfK5gEk2nWdR?=
 =?iso-8859-1?Q?aAQufHQYjxF/ZrOYjhM+HCwpYeCK3Jx/ovKABaA+7B6gErbRKB9qfKDA43?=
 =?iso-8859-1?Q?XoqYDtsJ8k3mo/0chPBOBpLr1Y+G8APOxMF4/DFyPBQe+Hw9FsMMVeyzHB?=
 =?iso-8859-1?Q?FzV86QaBzYik4UOnt/CSIh7NKYRBL/0kAHRR3I3vOZMWpZo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6342
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jack.Davison@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	482485eb-e590-488a-5b32-08d8f07a9214
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2bDO0H57PzxDPjToRjBOYEhk1gJPN9qY6OW1XisA3Pmh8h3MmbY7rPLsjsQKjtrQITEKh6UBa4U6UGdBwN8r1CxgQWbPEJCqoMyUb0XppFx9YGdlydpYyfNBabsnCHedPXLSV5vmczln3ehv4gKZbBYGr0X8iX8D2hWDJfIQigFeDL1hH84qb+DOS+lhmENblLAhdWcM20ZXMBhwtffnnI/QsbC801nNKg+S6VPZT16CBKEeNPiSyfq8GDGf4ZoyoBDq4vRLWQtfyUu4Z0W/F/YQp/XAhsLOOXY2vwOg28kPWkUDoIVX6irkim8MltNNA4qBrUUmSL8lnUnEIX4Nqxj+t2E1vy+90cB8DEvDx6Ze6FzrZ+Sfb+GwDJXgQy0C5Xp/TRWZpAqjFxDFk9/FA11G3ZPyO+xyx/l+ouTBBYLUhqFcZ7TxVKUSUN84DBAoWZ5ocf/GfVIMXUjNOqW1P/IefEvVPyQmsnxhqp4lUort+n66O4/pXu6KaPQfUPoyIaVj9s7jA96OpuM44jcq/pEj0F3hFjbbvjwYoIDT1PcHPUSs2br7m8zMnQxuD9Imlly9Hix9zUhcGxGn+jmtT53tXMP72AJ7VLN+XtT2SnLGqrzz3xABAa9KZA0gXAbzauWPV+wr5LAm979ANvNTk8bm7ewFXkWXfaBtY/ir8O3zwAzGLszRBcrEvAnd03rVeS6PTH8AM68zZg9bp8IUXFoiEfsZTkiBdT9B0SXCGp8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(36840700001)(46966006)(186003)(166002)(6916009)(6506007)(86362001)(81166007)(82310400003)(47076005)(52536014)(2940100002)(316002)(33656002)(8676002)(55016002)(9686003)(26005)(478600001)(7696005)(19627405001)(5660300002)(83380400001)(336012)(70206006)(36860700001)(356005)(70586007)(8936002)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 17:14:16.9951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d148d6-2f9f-4694-b699-08d8f07a963a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6303
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB496743D3739473CF74FBBF098E619AM6PR08MB4967eurp_"

--_000_AM6PR08MB496743D3739473CF74FBBF098E619AM6PR08MB4967eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Provides a run-ptest script for running xtest under ptest-runner. This
script parses the output of xtest and converts it to Automake's test
format.

Change-Id: I7c981422034b39701ddd74e176f2f5134ae607e6
Signed-off-by: Jack Davison <jack.davison@arm.com>
---
 .../recipes-security/optee/optee-test.inc     |  3 +-
 .../optee/optee-test/run-ptest                | 52 +++++++++++++++++++
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100755 meta-arm/recipes-security/optee/optee-test/run-ptest

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/reci=
pes-security/optee/optee-test.inc
index 969d5e2..877bdeb 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -5,7 +5,7 @@ HOMEPAGE =3D "https://www.op-tee.org/"
 LICENSE =3D "BSD & GPLv2"
 LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aa=
b1315a4fa"

-inherit python3native
+inherit python3native ptest
 require optee.inc

 # Linking fails on musl due to C++/threads
@@ -19,6 +19,7 @@ SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.pat=
ch \
            file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
            file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
+           file://run-ptest \
           "

 S =3D "${WORKDIR}/git"
diff --git a/meta-arm/recipes-security/optee/optee-test/run-ptest b/meta-ar=
m/recipes-security/optee/optee-test/run-ptest
new file mode 100755
index 0000000..ba88c14
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/run-ptest
@@ -0,0 +1,52 @@
+#!/bin/sh
+xtest | awk '
+
+    # Escapes the special characters in a string so that, when
+    # included in a regex, it represents a literal match
+    function regx_escape_literal(str,    ret) {
+        ret =3D str
+        gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(\)\|]/ , "\\\\&", str)
+        return str
+    }
+
+    # Returns the simple test formatted name
+    function name(n,    ret) {
+        ret =3D n
+        gsub(/\./, " ", ret)
+        return ret
+    }
+
+    # Returns the simple test formatted result
+    function result(res) {
+        if(res ~ /OK/) {
+            return "PASS"
+        } else if(res ~ /FAILED/) {
+            return "FAIL"
+        }
+    }
+
+    function parse(name, description,     has_subtests, result_line) {
+        has_subtests =3D 0
+
+        # Consume every line up to the result line
+        result_line =3D "  " regx_escape_literal(name) " (OK|FAILED)"
+        do {
+            getline
+
+            # If this is a subtest (denoted by an "o" bullet) then subpars=
e
+            if($0 ~ /^o /) {
+                parse($2, description " : " substr($0, index($0, $3)))
+                has_subtests =3D 1
+            }
+        } while ($0 !~ result_line)
+
+        # Only print the results for the deepest nested subtests
+        if(!has_subtests) {
+            print result($2) ": " name(name) " - " description
+        }
+    }
+
+    # Start parsing at the beginning of every test (denoted by a "*" bulle=
t)
+    /^\* / { parse($2, substr($0, index($0, $3))) }
+
+'
--
2.17.1


--_000_AM6PR08MB496743D3739473CF74FBBF098E619AM6PR08MB4967eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div class=3D"PlainText">Provides a run-ptest script for running xtest unde=
r ptest-runner. This<br>
script parses the output of xtest and converts it to Automake's test<br>
format.<br>
<br>
Change-Id: I7c981422034b39701ddd74e176f2f5134ae607e6<br>
Signed-off-by: Jack Davison &lt;jack.davison@arm.com&gt;<br>
---<br>
&nbsp;.../recipes-security/optee/optee-test.inc&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 3 +-<br>
&nbsp;.../optee/optee-test/run-ptest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 52 ++++++++++++++++++=
+<br>
&nbsp;2 files changed, 54 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100755 meta-arm/recipes-security/optee/optee-test/run-pte=
st<br>
<br>
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/reci=
pes-security/optee/optee-test.inc<br>
index 969d5e2..877bdeb 100644<br>
--- a/meta-arm/recipes-security/optee/optee-test.inc<br>
+++ b/meta-arm/recipes-security/optee/optee-test.inc<br>
@@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.op-tee.org/">http=
s://www.op-tee.org/</a>&quot;<br>
&nbsp;LICENSE =3D &quot;BSD &amp; GPLv2&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://${S}/LICENSE.md;md5=3Dda=
a2bcccc666345ab8940aab1315a4fa">file://${S}/LICENSE.md;md5=3Ddaa2bcccc66634=
5ab8940aab1315a4fa</a>&quot;<br>
&nbsp;<br>
-inherit python3native<br>
+inherit python3native ptest<br>
&nbsp;require optee.inc<br>
&nbsp;<br>
&nbsp;# Linking fails on musl due to C++/threads<br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot;git://github.com/OP-TEE/optee_test.git =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch">
file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0002-make-remove-Wno-unsafe-loop-for-clang.patch">file://0002-ma=
ke-remove-Wno-unsafe-loop-for-clang.patch</a> \
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0003-make-remove-Wmissing-noreturn-for-clang.patch">file://0003-=
make-remove-Wmissing-noreturn-for-clang.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta-arm/recipes-security/optee/optee-test/run-ptest b/meta-ar=
m/recipes-security/optee/optee-test/run-ptest<br>
new file mode 100755<br>
index 0000000..ba88c14<br>
--- /dev/null<br>
+++ b/meta-arm/recipes-security/optee/optee-test/run-ptest<br>
@@ -0,0 +1,52 @@<br>
+#!/bin/sh<br>
+xtest | awk '<br>
+<br>
+&nbsp;&nbsp;&nbsp; # Escapes the special characters in a string so that, w=
hen<br>
+&nbsp;&nbsp;&nbsp; # included in a regex, it represents a literal match<br=
>
+&nbsp;&nbsp;&nbsp; function regx_escape_literal(str,&nbsp;&nbsp;&nbsp; ret=
) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D str<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(=
\)\|]/ , &quot;\\\\&amp;&quot;, str)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return str<br>
+&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp; # Returns the simple test formatted name<br>
+&nbsp;&nbsp;&nbsp; function name(n,&nbsp;&nbsp;&nbsp; ret) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D n<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gsub(/\./, &quot; &quot;, ret)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret<br>
+&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp; # Returns the simple test formatted result<br>
+&nbsp;&nbsp;&nbsp; function result(res) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(res ~ /OK/) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
&quot;PASS&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if(res ~ /FAILED/) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
&quot;FAIL&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp; function parse(name, description,&nbsp;&nbsp;&nbsp;&nbs=
p; has_subtests, result_line) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; has_subtests =3D 0<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Consume every line up to the =
result line<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result_line =3D &quot;&nbsp; &q=
uot; regx_escape_literal(name) &quot; (OK|FAILED)&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; getline=
<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If th=
is is a subtest (denoted by an &quot;o&quot; bullet) then subparse<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if($0 ~=
 /^o /) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; parse($2, description &quot; : &quot; substr($0, index($0,=
 $3)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; has_subtests =3D 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while ($0 !~ result_line)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Only print the results for th=
e deepest nested subtests<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(!has_subtests) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print r=
esult($2) &quot;: &quot; name(name) &quot; - &quot; description<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp; # Start parsing at the beginning of every test (denoted=
 by a &quot;*&quot; bullet)<br>
+&nbsp;&nbsp;&nbsp; /^\* / { parse($2, substr($0, index($0, $3))) }<br>
+<br>
+'<br>
-- <br>
2.17.1<br>
<br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
></span></font></div>
</div>
</body>
</html>

--_000_AM6PR08MB496743D3739473CF74FBBF098E619AM6PR08MB4967eurp_--
