Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.55])
 by mx.groups.io with SMTP id smtpd.web10.1507.1585812099734509327
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Apr 2020 00:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kW8FJwnP;
 spf=pass (domain: arm.com, ip: 40.107.13.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3X3BIy99osKzKSW5msDeq/x7nNptyGy8FoSZ7RIUY8=;
 b=kW8FJwnPcm4PuhRB4+v9wgzhE+rZ7mnfPPRkf0upiTskSLAkHGb8WF5Qv43TMwDlN95Kv5XedUBTecnr8ceYvGdxGR2Of6VMW8QuW9PKGTzPKDy+ThP8D3kpMhqqN3cNUJ56dipPCTg/oAGKTEaSTCgjl5h23GyvrS79Wzypw10=
Received: from VI1P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:bd::34)
 by AM6PR08MB3159.eurprd08.prod.outlook.com (2603:10a6:209:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Thu, 2 Apr
 2020 07:21:35 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:800:bd:cafe::a9) by VI1P193CA0024.outlook.office365.com
 (2603:10a6:800:bd::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Thu, 2 Apr 2020 07:21:34 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 07:21:34 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Thu, 02 Apr 2020 07:21:34 +0000
X-CR-MTA-TID: 64aa7808
Received: from c5cbb2089b53.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 712AE859-87C4-4458-8CEA-FCD57E271922.1;
	Thu, 02 Apr 2020 07:21:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c5cbb2089b53.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 07:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGOWa3yDaLJe2uOiCdthop2U/m6M4Lu9nocI9KE1aMIDOiz3/8aX2CkN16De2Ypx2FVpIGV3dOFn4y7bVOy11X0YzvVpJu59s3VE+TYeVJ2Rs9o4QflZpLHNyai6Ce8dP6Vuo1cCN2Heqpee7XS3H3INYZ+u8ifPOnLzlgOAAu37nQncb4leg8JDp5CPni0oAJq2bpQoW5sofyBPv8//3MFIjFw/cSwYrj+NdisHCpgAxpOv1i2DyjgkD0d/rWvQXdtTrgkg4lgepMDl6Q4ryohioRtYrnZcuDWWADeWd/oZOI+wNIZD61rcrSokOmK/IHVIHrg3VCCywfh72rhkog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3X3BIy99osKzKSW5msDeq/x7nNptyGy8FoSZ7RIUY8=;
 b=ELcJ/tpFG2TASvB47SSvueZDDdJHWMc/Ib0fR+tXGayFy1sh6TLViGNUR1nuj3bPhQ0pm7rFXsxk17fweBuEWeHxaiEjp83OIjfsuhV+ppxVXD/yE8+RW8wgysfobWfpb09HnC3Dg2kb6VxhzTy5hCoWW/MAllnkDLc2+QqluSCAuxftlLIejNby82gY/+io93I4/wSL4xecibMc0A/HJsQLfIVvT5ey6pgYyfVpRud8LNWPkumOk4yuckwuD9luCu18mEBNxuysvnSHwMUQPIiWiptSOFFZC/49+8+71aY8Jtn1fQqvVLMslYqOzjj6/ml0soWmUQZpwz16dEAbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3X3BIy99osKzKSW5msDeq/x7nNptyGy8FoSZ7RIUY8=;
 b=kW8FJwnPcm4PuhRB4+v9wgzhE+rZ7mnfPPRkf0upiTskSLAkHGb8WF5Qv43TMwDlN95Kv5XedUBTecnr8ceYvGdxGR2Of6VMW8QuW9PKGTzPKDy+ThP8D3kpMhqqN3cNUJ56dipPCTg/oAGKTEaSTCgjl5h23GyvrS79Wzypw10=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4147.eurprd08.prod.outlook.com (20.178.119.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Thu, 2 Apr 2020 07:21:28 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 07:21:28 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/5] optee-test: upgrade 3.7.0 -> 3.8.0, cleanup
Thread-Topic: [meta-arm] [PATCH 4/5] optee-test: upgrade 3.7.0 -> 3.8.0,
 cleanup
Thread-Index: AQHWCHssJAF0tWKZnEewtqMFWtytMqhlaxBQ
Date: Thu, 2 Apr 2020 07:21:28 +0000
Message-ID: 
 <AM0PR08MB39877ACB9DB803C81F670FD992C60@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <1585782786-34477-1-git-send-email-denis@denix.org>
 <1585782786-34477-4-git-send-email-denis@denix.org>
In-Reply-To: <1585782786-34477-4-git-send-email-denis@denix.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 1d70c1db-96cd-4169-bfab-a1cfd1d4332c.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3cdf7a5-6845-45f5-be32-08d7d6d679ae
x-ms-traffictypediagnostic: AM0PR08MB4147:|AM6PR08MB3159:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB315979DD237153163036455F92C60@AM6PR08MB3159.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(6916009)(5660300002)(186003)(81156014)(81166006)(8676002)(26005)(9686003)(478600001)(52536014)(33656002)(2906002)(86362001)(66476007)(66556008)(64756008)(66446008)(76116006)(7696005)(6506007)(66946007)(55016002)(8936002)(54906003)(53546011)(71200400001)(316002)(4326008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5NLyakhk0Vd/Kh2MPBe2qIwRb2sTs/M/glfjlmZeaaMEtBUxqTJEaFGoPntwHUl5f65mRZrk4sN5SSwtb9ixmOdoUlz74CVkH/g/eK9XiuFXEZhFI0LjzYvF7zK+MjM3cVu88TyEYSiZ6TFhNIsmqpPQ89dZ6c6BqB/hjM4Gs+Hc+MK0GIjEYZCni/CQM1gHI9wCT8ab72ghQd8JVSX5hY8I42p9fb7cXQr5eUf/pMQ8/P2uZDtMrZP7e30BNumVJkAeq8AcnQv2GUkq2uIqFNLbOdWRizfjOPM+KKM/m3wIAwvbuEsUfIlhK+8/uL0IJeX42W7dH8N/7RbPfku6XKelj5qg5yY2L97ZLLUZGRXkd+TAdegP/v2gMeOdNSDm8edZAmN8x02S4eMWhaArGNZ6cwW8B9oXv3HYfLTt2bIrOM6DglwnjeA+hxx+XdlI0DBGa9a4NUzeHICrcVW3may8fsCcDGVCpakta3FfHuaF5iX/ZhW8KzHNbYpR7yCR7cexazAhQwzXG6+/GenlFA==
x-ms-exchange-antispam-messagedata: 
 REDRu6ZllWL0b+dFRJLNjJAydqiTHIdZV1jWHUzx+QkvJPl4JZW846bDHFtqH6mF6bP0rGRkrhtFH9P1WJgzKLD35PYloprwOwy6D1+kdB7w5kVFr6C5U6BNAEKRkD52TRPblA4RM50I+7W/EqWQPA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(4326008)(54906003)(5660300002)(70586007)(70206006)(81156014)(186003)(7696005)(8936002)(356004)(52536014)(336012)(26005)(316002)(81166006)(26826003)(33656002)(55016002)(6506007)(47076004)(86362001)(82740400003)(2906002)(53546011)(6916009)(9686003)(478600001)(8676002)(36906005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aa7bf12d-e49f-4188-4202-08d7d6d675c5
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nZN4YRLXjCLCNTGuTcfAIUiZZoDHE65l2JeHlQDL2+RZDWX2Mngoxr4w8ykVtP4TzqcSQh1WGQ7BtV8ttrH6HC+AlGzL549QSFvovsmUEKcvLfhclv4t/hASzTpifKFChbFP8kdAJeFZpsrQPw7peyUAVUtiwN2Hryl9xPQoglGUqQnFS25Oh3+BjxYG6nkYM6xHF41D6cno9zEzuY8x48zxuuBWAGRiJMdbmc5fu26WFouRQfwJXLFZcXN35JFY+1NPWh4T1Adv8+QoA8vZ5/gWubTh9qxp5Ab6Ha2PJuVSOa4yhvu4IBg9NeDV59sUTR80HfIQSIqj8YjKjunS0DX/+Akd19XbT7UMsmhhr/BUzUegXlBPW3ysjPGy6BiH8t6TGtwmyu3HvQiKY75eFzG2k4P86JmBk59+S3olB0XJE2ULhZ/1b3a9RWHPk2Vga/ZwaNzQLUEuLBFGmX40DuFRx02xGGQlSKeqzuBwwMPrBRF9ot1jFgRn/tjsBqD9BTWVDglQeUwmfT4kvuyaofj6++l6CIQD6hMRJcO9FgnQmwJN0wnu0qoQF/SXJgtv6/G1txxMZyXdyPf3FiYs/w==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 07:21:34.8034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cdf7a5-6845-45f5-be32-08d7d6d679ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3159
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Denys Dmytriyenko via lists.yoctoproject.org
> Sent: 02 April 2020 00:13
> To: meta-arm@lists.yoctoproject.org
> Cc: Denys Dmytriyenko <denys@ti.com>
> Subject: [meta-arm] [PATCH 4/5] optee-test: upgrade 3.7.0 -> 3.8.0, clean=
up
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> * Drop previously backported patch for Python3 support
> * Add DESCRIPTION
> * Use common HOMEPAGE
> * Depend on PyCryptodomex instead of old PyCrypto
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../0001-use-python3-instead-of-python.patch       | 48 ----------------=
------
>  meta-arm/recipes-security/optee/optee-test_git.bb  | 15 ++++---
>  2 files changed, 7 insertions(+), 56 deletions(-)  delete mode 100644 me=
ta-
> arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-
> python.patch
>=20
> diff --git a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-
> instead-of-python.patch b/meta-arm/recipes-security/optee/optee-
> test/0001-use-python3-instead-of-python.patch
> deleted file mode 100644
> index 20f190a..0000000
> --- a/meta-arm/recipes-security/optee/optee-test/0001-use-python3-
> instead-of-python.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 6271160639002a2580d80b75b5397a96d56329f2 Mon Sep 17 00:00:00
> 2001
> -From: Scott Branden <scott.branden@broadcom.com>
> -Date: Fri, 27 Dec 2019 12:54:28 -0800
> -Subject: [PATCH] use python3 instead of python
> -
> -use python3 instead of python as python2 is EOL January 2020.
> -
> -Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> -Tested-by: Jerome Forissier <jerome@forissier.org> (QEMU,
> CFG_GCM_NIST_VECTORS=3Dy)
> -Upstream-Status: Backport from v3.8.0
> ----
> - scripts/file_to_c.py       | 4 ++--
> - scripts/rsp_to_gcm_test.py | 2 +-
> - 2 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/scripts/file_to_c.py b/scripts/file_to_c.py -index
> ae16f52..b4ce2a2 100755
> ---- a/scripts/file_to_c.py
> -+++ b/scripts/file_to_c.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # SPDX-License-Identifier: BSD-2-Clause
> - #
> - # Copyright (c) 2018, Linaro Limited
> -@@ -29,7 +29,7 @@ def main():
> -
> -     f.write("const uint8_t " + args.name + "[] =3D {\n")
> -     i =3D 0
> --    for x in array.array("B", inf.read()):
> -+    for x in array.array("B", map(ord, (inf.read()))):
> -         f.write("0x" + '{0:02x}'.format(x) + ",")
> -         i =3D i + 1
> -         if i % 8 =3D=3D 0:
> -diff --git a/scripts/rsp_to_gcm_test.py b/scripts/rsp_to_gcm_test.py -in=
dex
> 0543541..e4418be 100755
> ---- a/scripts/rsp_to_gcm_test.py
> -+++ b/scripts/rsp_to_gcm_test.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> -
> - modes =3D {'encrypt': 0, 'decrypt': 1}
> -
> ---
> -2.7.4
> -
> diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-
> arm/recipes-security/optee/optee-test_git.bb
> index 3f431c3..752d75d 100644
> --- a/meta-arm/recipes-security/optee/optee-test_git.bb
> +++ b/meta-arm/recipes-security/optee/optee-test_git.bb
> @@ -1,21 +1,20 @@
>  SUMMARY =3D "OP-TEE sanity testsuite"
> -HOMEPAGE =3D "https://github.com/OP-TEE/optee_test"
> +DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test suit=
e"
> +HOMEPAGE =3D "https://www.op-tee.org/"
>=20
>  LICENSE =3D "BSD & GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa"
>=20
>  inherit python3native
>=20
> -DEPENDS =3D "optee-client optee-os python3-pycrypto-native"
> +DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
>=20
> -PV =3D "3.7.0+git${SRCPV}"
> +PV =3D "3.8.0+git${SRCPV}"
>=20
> -SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
> -          file://0001-use-python3-instead-of-python.patch \
> -          "
> -S =3D "${WORKDIR}/git"
> +SRCREV =3D "30481e381cb4285706e7516853495a7699c93b2c"
> +SRC_URI =3D "git://github.com/OP-TEE/optee_test.git"
>=20
> -SRCREV =3D "227d6f4c40eaa6f84fe049b9e48c7b27ad7fab08"
> +S =3D "${WORKDIR}/git"
>=20
>  OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
>  TEEC_EXPORT         =3D "${STAGING_DIR_HOST}${prefix}"
> --
> 2.7.4

