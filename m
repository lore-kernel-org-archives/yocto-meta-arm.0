Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web11.764.1617040630313148959
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 10:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hoaKq2w/;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: jack.davison@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0BhOd+xcxa89YO8FIVLluXXIBiYyZP+hHWofWiqjoQ=;
 b=hoaKq2w/17WcIv+RFB+Avq7mSeIB3KDcdU9VSIzNBJJzU3v2EdsYZRYZqPspzp1KU+W+QcFXCHdrgic7rcF2q+Nc8V2e+MHBYFikpJHDpdGOxRG94vLEjn5IzUjOxA03Y7iW2RBtt+TzYB3Ad9atOcojNeTSBdkVYzs4UlpMxTs=
Received: from AM6PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:20b:b2::15)
 by VE1PR08MB4686.eurprd08.prod.outlook.com (2603:10a6:802:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 17:57:08 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::2a) by AM6PR08CA0003.outlook.office365.com
 (2603:10a6:20b:b2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Mon, 29 Mar 2021 17:57:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 17:57:07 +0000
Received: ("Tessian outbound 7d88ebbbfeee:v89"); Mon, 29 Mar 2021 17:57:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 11707ea3dd3373cf
X-CR-MTA-TID: 64aa7808
Received: from 448b3100feb4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 53E6700F-918E-4071-BD6D-FA53D0A0311C.1;
	Mon, 29 Mar 2021 17:57:00 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 448b3100feb4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 29 Mar 2021 17:57:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hykBWqxv0NPn98TObgZq8/iVKUYIuLh6/D/hlSacPLqMdD4LYNDbiBRyltO8eGz30B3ov0h332axds2WBJ1HHYuHBlEw8XKw60ZsCEWprmSHCl65Dq5z7ZbWLZEtuH1iRTv2cKTqt9OCUFpe5CO1J2DLZNfitO9j5LPKkTUZcjggHj2Mc9ipkJ3qamM4aITrBuEHD6iQspe6cxowr9Py8NH2RfXvtCmVKLNGy3B/QcvaO+PpGFks4XRijXP93P6Em+5G57UOQysSVFXF2O5sFWko2haLdRHrqmp3GNZ+Thq2lDSIb4exJC6lkM/ANWyZvqskPVDW2WzZSFN1SJDlKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0BhOd+xcxa89YO8FIVLluXXIBiYyZP+hHWofWiqjoQ=;
 b=oO5vZFDWYXL4LI2CoZRnN70N88nEwI01kom6D8uiglBY+MnCjFnJg0e6kvzskTGwrtXJIgXehxhuCKgDzHckNzinmDHnNy1ESCiN5ldI7wl/vpWmag9KgfBqsMjUBFm2l5lYpEfOppGX6dgK51wIOPpYfveNegbIpIa5TpaBr9bY8+nEaRhJcRksKOS65DXEh50d20wpgniXlp+QzBdQNX1QtLAwssg6aejQefQxHA8a4maVuXTBkC2xYJt/Kj3B+JKm5VrjgxTwWmknZM9UgWqq7i3jyC72BT3+SlvFVQ/QgT2a4lK9LcHffncWkPMXiCYUNOvzaF/nGz6wwxw/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0BhOd+xcxa89YO8FIVLluXXIBiYyZP+hHWofWiqjoQ=;
 b=hoaKq2w/17WcIv+RFB+Avq7mSeIB3KDcdU9VSIzNBJJzU3v2EdsYZRYZqPspzp1KU+W+QcFXCHdrgic7rcF2q+Nc8V2e+MHBYFikpJHDpdGOxRG94vLEjn5IzUjOxA03Y7iW2RBtt+TzYB3Ad9atOcojNeTSBdkVYzs4UlpMxTs=
Received: from AM0PR08MB4963.eurprd08.prod.outlook.com (2603:10a6:208:159::16)
 by AM0PR08MB5411.eurprd08.prod.outlook.com (2603:10a6:208:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 17:56:59 +0000
Received: from AM0PR08MB4963.eurprd08.prod.outlook.com
 ([fe80::dcce:eea3:59c:95c6]) by AM0PR08MB4963.eurprd08.prod.outlook.com
 ([fe80::dcce:eea3:59c:95c6%5]) with mapi id 15.20.3955.033; Mon, 29 Mar 2021
 17:56:59 +0000
From: "Jack Davison" <jack.davison@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: [PATCH] arm: Enable ptest for optee xtest
Thread-Topic: [PATCH] arm: Enable ptest for optee xtest
Thread-Index: AQHXJMLKM9pXidtMHU2gtmxUmWnri6qbP9Gs
Date: Mon, 29 Mar 2021 17:56:59 +0000
Message-ID: 
 <AM0PR08MB49633C9F6E7CE8C6447540648E7E9@AM0PR08MB4963.eurprd08.prod.outlook.com>
References: 
 <AM0PR08MB496369DE1256F32E238B3C068E7E9@AM0PR08MB4963.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM0PR08MB496369DE1256F32E238B3C068E7E9@AM0PR08MB4963.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [86.141.162.41]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 99d23fea-2665-44cf-23a2-08d8f2dc11a0
x-ms-traffictypediagnostic: AM0PR08MB5411:|VE1PR08MB4686:
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4686363BD2A307EED899B00A8E7E9@VE1PR08MB4686.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MmIjCjKQ4I8BOVul/XI6o+EiRWI3m6MyT1bUND8LbjQWbZJFo6H31EfSQplrjzYXY9eBCV4jz5wj7NQdgsmSJ+mhvzxvuH0nNLQyIO3qEqktnXld8DUKYNY6hbozL63D6DeBl+Tg2uS9ax6vdyr8ueLgVr669x7uUoeTe1+uBpNdVtAwq5Zqb5kdBlnLZUItnAUodsqwTJZXlaw0XTannb6bj2FgfS4Uw4yBXY3ivOY2ksQ5Huv/1w0ythpxvXp/zxEEM+Zg5SIJLA/sL9eNMrFO9Wi3cgvZcZjGDs0SGaF4qFs9N7IlUjmL/Fx261un4/gYwgbOttpF6CCUPIxaSDMkm9JK2coEyZ5vulla2BqvQWFW3upRboN/Nx3keshAU+6oj7d4Y5ZSn0dzOVPAS1Wf9J+KRTLPGBThkzh68gdXo/Gx68SF9J4CPrY0QzbEEenKELntZqbITMcIvnMedSnb/jcZQyK4uXRpBzS4q0SvCi94JBkHcMMPsKOwzBLQuyTR4sWi4r49gJ7vm/0807fvcORduqE28fYOwCFP9vYCNfrzoo1+XjbYsUAoZIgzk8kyt062n1qD+vSkHLTY7gm+siQ/z7nLjVB8Agrcfm4tV6gjuO/EOClrFX6ieAWvZIWXOyfmyqlW9Eo/5PkddM5X4eLshr69bSbHEujvBBGbBT2A/SJ2PGDFuIp88/EunOvIWs3livPJZNMm4cNfBQgQCmRGLolZOoN8/UB9A9Y=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4963.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(6506007)(66556008)(33656002)(66476007)(86362001)(66946007)(52536014)(76116006)(64756008)(55016002)(7696005)(6916009)(8676002)(2940100002)(478600001)(8936002)(66446008)(71200400001)(5660300002)(2906002)(26005)(316002)(83380400001)(9686003)(38100700001)(91956017)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?DWD6Fl2Emc6hEndBvvAQJPQ+108YJ0PT+uj4MlhgsKSPnxjHKnupu/HBls?=
 =?iso-8859-1?Q?9ve7MBAwPvKpGgPqCMEea6hCTGQQC9ARLjIV0vbIvJKfnvC5MDnal74PKP?=
 =?iso-8859-1?Q?PrH0oGbjSpfPWRPaZL9SHyBAaM0uotb4yF4cYnb3wx9SqA8rI8sW96A94Z?=
 =?iso-8859-1?Q?XkfltS+ezOZGsTh5Zv7U/3/culNJqQQlzvmUffsjtRcBijpwsQgNyyMkDU?=
 =?iso-8859-1?Q?AgU80zNPWdJAnFis2cMDNtCU286J1Zsxivs8+Hd00dCSlTO4GTihs6U1s+?=
 =?iso-8859-1?Q?ebDJXgfOrrDyGg+OMUKdxNLQX3VOPtu10R0ePHoc5YwTzj9Gy4fNFY04NU?=
 =?iso-8859-1?Q?8t/qlrABnch9EXsGjrNDYEM8E920Un6RHH+BpZ7A1+DYZ2mHOGwKkS+ROv?=
 =?iso-8859-1?Q?XKA7KMMsfXEpgNwEesOv4Ruzhlf99nqNbju2iPp9H9usw6BTxAPDIMv38E?=
 =?iso-8859-1?Q?r300oC3o6vxvzJt4XKs6WAwMONUlkdvdtpPLEadlcK0HIq2KZIPM84ivdw?=
 =?iso-8859-1?Q?WN+FlXJ/jWochWPwr6G13z5vKpOzWHkKOV5+2hbmEQb73W2tqAW2Cjij2U?=
 =?iso-8859-1?Q?CaWqG4qkcVZtVMbMyizDZvZSF7WZRyjai8gpSLAemifks/BX8ic+QEmsYm?=
 =?iso-8859-1?Q?xKZ5RtUibmw/yTS5KFVMj1/bNsDtdHpyuchTf9bAxQa0GDeZv9guaHgQt2?=
 =?iso-8859-1?Q?Rpwj7cawbolVsNS3CUOvaG+taJeCVB1eCxc3g+k2eusy7T3FQ9Sp4oMaxI?=
 =?iso-8859-1?Q?ZaVJf1hPGjATEv6W7qSUOxyYYjCtX+UsV1iX4TjAq6l+uHv9RxPPlF+X5l?=
 =?iso-8859-1?Q?xluSLRX7pm8H2/EeaHA/BBohbDAH5BqFNSeBsNiPRAmpfTp46gLGOoVkpJ?=
 =?iso-8859-1?Q?05RlYUX3sc9goME0C4BCQ3cTMs4ra899DiG25/A55W+DXdGebW/L8F9vN3?=
 =?iso-8859-1?Q?0nZSE1iz7x8Mpk1ZonclEeKX3wuI30NsgEO2A9KawFLJd+X5wTqeHljxFg?=
 =?iso-8859-1?Q?/cg/OD2tfMkzW8Xu/W2g7DtqVMZFdQe+B0ePr1qStFfgjHL4N2U7ulsY88?=
 =?iso-8859-1?Q?4ubbvrJjc2VimmGp7Kmb0GPqDpkfPmyATmw83a+FSSsrpaJa41wFe8Xhl1?=
 =?iso-8859-1?Q?TkkimhzP+q97RhqbnxahITednOqvg8WuSvjmcRoy7EAfMzEAr38UgAnSEO?=
 =?iso-8859-1?Q?PRikNvPQ4d6DhI7aT9ct2ZGIE2ppELnJWmzMnvpZiBSiaXOgIUW/XMb8Hs?=
 =?iso-8859-1?Q?SxoU4IzkSTn/4vhxknort88WowiLXcsu1BYP1WdGHPgGXvLE6Go3NAWkB5?=
 =?iso-8859-1?Q?nId+BHYMQriM40D6IJrfTZlt+RM/XkPFXgWY4QsYlRSbivw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5411
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Jack.Davison@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f6ee457d-28b8-49a6-29d1-08d8f2dc0cb2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z+I2QGO2e5DPdegtkDDHXAtvrWnkIz+KGWVt04re4DlAP2W72IQ0TkAsRlZiiq5Uki2XvlpLNTPfnF7HIqY9BCp7UPhxohwOjw0zinvpNRAW+300ZoK+hEldz61eivlbKFpvU6hPotyw0wpbQjtcLFelUAne99At8Gq/5Mckud6m3Ohpau1uEy4DbhnL7Wec45157PN1uP90ow8N0ZbSmEEBQyd6CwKi96qiXfNUZTyz7ybTqiLVpmckODN0CTQ/31oXn0gU0KnKfMrCjJqREJ7EtzQvzyS7dxPCwvQcIm6NdSS8eX3T3H0NlP+kJYielHNcEI514Jd4lGEfpRuRrXnNjv24m2bN7rK6jPwa8WXNgpchWCBHv87snauwvB64lGzkI2NZNucnopSM5EgokfbM6+2enspPpZE0RqL5LIhVTZtfC7j4hW+XQrHzy0cX7HoT6cOuoH6PyyhQhKBkZAibP7Ctm5SsULjux3Rk9IxeBUYKWhyxs0wn9LT7Bz1iTxjSnwy02H1OsJAHj8sdvPCZJ8p0OgjQxzqSuIovz3xlrh23qE7aiYR9DIWTUhvmZGPuQ8O0ApFMoMc3XAyWkRa9OqKYYJoNE+vvcPiBkjbiR4VCWwrRNcz87GKDaSDiTYJTbRdD+IVCggMJjkhLKALHEz/mwqTWPjQgibDZvLm63jbi28X6Bm2iwTW3VxdT0TEdX//7TZig1WsB67T0LuypviYmB4WRn/1FvIu2I3k=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(86362001)(33656002)(356005)(55016002)(478600001)(47076005)(36860700001)(336012)(6506007)(186003)(83380400001)(52536014)(5660300002)(9686003)(6916009)(82740400003)(316002)(82310400003)(26005)(2906002)(81166007)(70586007)(7696005)(70206006)(8936002)(8676002)(2940100002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 17:57:07.3870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d23fea-2665-44cf-23a2-08d8f2dc11a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4686
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Provides a run-ptest script for running xtest under ptest-runner. This=0A=
script parses the output of xtest and converts it to Automake's test=0A=
format.=0A=
=0A=
Change-Id: I7c981422034b39701ddd74e176f2f5134ae607e6=0A=
Signed-off-by: Jack Davison <jack.davison@arm.com>=0A=
---=0A=
=A0.../recipes-security/optee/optee-test.inc=A0=A0=A0=A0 |=A0 3 +-=0A=
=A0.../optee/optee-test/run-ptest=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 52 +++++++++++++++++++=0A=
=A02 files changed, 54 insertions(+), 1 deletion(-)=0A=
=A0create mode 100755 meta-arm/recipes-security/optee/optee-test/run-ptest=
=0A=
=0A=
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/reci=
pes-security/optee/optee-test.inc=0A=
index 969d5e2..877bdeb 100644=0A=
--- a/meta-arm/recipes-security/optee/optee-test.inc=0A=
+++ b/meta-arm/recipes-security/optee/optee-test.inc=0A=
@@ -5,7 +5,7 @@ HOMEPAGE =3D "https://www.op-tee.org/"=0A=
=A0LICENSE =3D "BSD & GPLv2"=0A=
=A0LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940=
aab1315a4fa"=0A=
=A0=0A=
-inherit python3native=0A=
+inherit python3native ptest=0A=
=A0require optee.inc=0A=
=A0=0A=
=A0# Linking fails on musl due to C++/threads=0A=
@@ -19,6 +19,7 @@ SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-host-xtest-Adjust-order-of-in=
cluding-compiler.h.patch \=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0002-make-remove-Wno-unsafe-loop-f=
or-clang.patch \ =0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0003-make-remove-Wmissing-noreturn=
-for-clang.patch \=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://run-ptest \=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "=0A=
=A0=0A=
=A0S =3D "${WORKDIR}/git"=0A=
diff --git a/meta-arm/recipes-security/optee/optee-test/run-ptest b/meta-ar=
m/recipes-security/optee/optee-test/run-ptest=0A=
new file mode 100755=0A=
index 0000000..ba88c14=0A=
--- /dev/null=0A=
+++ b/meta-arm/recipes-security/optee/optee-test/run-ptest=0A=
@@ -0,0 +1,52 @@=0A=
+#!/bin/sh=0A=
+xtest | awk '=0A=
+=0A=
+=A0=A0=A0 # Escapes the special characters in a string so that, when=0A=
+=A0=A0=A0 # included in a regex, it represents a literal match=0A=
+=A0=A0=A0 function regx_escape_literal(str,=A0=A0=A0 ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0 ret =3D str=0A=
+=A0=A0=A0=A0=A0=A0=A0 gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(\)\|]/ , "\\\\&", str=
)=0A=
+=A0=A0=A0=A0=A0=A0=A0 return str=0A=
+=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0 # Returns the simple test formatted name=0A=
+=A0=A0=A0 function name(n,=A0=A0=A0 ret) {=0A=
+=A0=A0=A0=A0=A0=A0=A0 ret =3D n=0A=
+=A0=A0=A0=A0=A0=A0=A0 gsub(/\./, " ", ret)=0A=
+=A0=A0=A0=A0=A0=A0=A0 return ret=0A=
+=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0 # Returns the simple test formatted result=0A=
+=A0=A0=A0 function result(res) {=0A=
+=A0=A0=A0=A0=A0=A0=A0 if(res ~ /OK/) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return "PASS"=0A=
+=A0=A0=A0=A0=A0=A0=A0 } else if(res ~ /FAILED/) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return "FAIL"=0A=
+=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0 function parse(name, description,=A0=A0=A0=A0 has_subtests, resu=
lt_line) {=0A=
+=A0=A0=A0=A0=A0=A0=A0 has_subtests =3D 0=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0 # Consume every line up to the result line=0A=
+=A0=A0=A0=A0=A0=A0=A0 result_line =3D "=A0 " regx_escape_literal(name) " (=
OK|FAILED)"=0A=
+=A0=A0=A0=A0=A0=A0=A0 do {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 getline=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 # If this is a subtest (denoted by an "o=
" bullet) then subparse=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if($0 ~ /^o /) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 parse($2, description " : " =
substr($0, index($0, $3)))=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 has_subtests =3D 1=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0=A0=A0=A0=A0 } while ($0 !~ result_line)=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0=A0 # Only print the results for the deepest nested subt=
ests=0A=
+=A0=A0=A0=A0=A0=A0=A0 if(!has_subtests) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 print result($2) ": " name(name) " - " d=
escription=0A=
+=A0=A0=A0=A0=A0=A0=A0 }=0A=
+=A0=A0=A0 }=0A=
+=0A=
+=A0=A0=A0 # Start parsing at the beginning of every test (denoted by a "*"=
 bullet)=0A=
+=A0=A0=A0 /^\* / { parse($2, substr($0, index($0, $3))) }=0A=
+=0A=
+'=0A=
-- =0A=
2.17.1=0A=
