Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web12.5980.1584452434790469529
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 06:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ts6oh+yH;
 spf=pass (domain: arm.com, ip: 40.107.7.72, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32eu8/TNvfSUNYv6ZqWXT2LUS3cj0kWHAc7sOSSlaDw=;
 b=ts6oh+yHc2V9ba/ANSypVQGjZBKGGxZ7Oh6WKWVdJsVjaJ63tyrFEOe/4vi0wvCyxceUGCGGvqvQ8V01UEEZXXht5IjqQY9JouHHVt5l1f+0vGDy+IIBEjE32w8WL8kPLTG+CwveghtGWeijR66VsF3ruXDG8/arenjbr2zR7R0=
Received: from AM5PR0701CA0060.eurprd07.prod.outlook.com (2603:10a6:203:2::22)
 by AM6PR08MB3815.eurprd08.prod.outlook.com (2603:10a6:20b:8b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Tue, 17 Mar
 2020 13:40:32 +0000
Received: from VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::57) by AM5PR0701CA0060.outlook.office365.com
 (2603:10a6:203:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.10 via Frontend
 Transport; Tue, 17 Mar 2020 13:40:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT057.mail.protection.outlook.com (10.152.19.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Tue, 17 Mar 2020 13:40:29 +0000
Received: ("Tessian outbound 0420f1404d58:v42"); Tue, 17 Mar 2020 13:40:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5fbc76fcc39ea9fc
X-CR-MTA-TID: 64aa7808
Received: from 8c7c9ec8c2a2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EA44B69D-FC67-4A0E-8473-2E0B4DD40B3D.1;
	Tue, 17 Mar 2020 13:40:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c7c9ec8c2a2.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Mar 2020 13:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYJS5IU4fR1R6Ei7fvEEUBoOFh1k4lOhFBA9DX1Q46hj7V41jXvmqiMK1hdcH5qLvzYAR085WWKIhAqJETXs96iiw5n19HTZOBJXhzXOCtws7Vz79Qe3JKByJzDXJZooLMSZl/p0NUkVRQQ6E1fx2+aNZpgFDw6bL2NtpxwTP9wQFC75zIxt2QOngBeMHfNHTk9/WeGlXjgWrJibV9gONE8mr8ZpQ1iTfLTXzYQVwQtMXmoCusmdCyJS50KnSJbfCfHlDRqqB23CSh9KtMb/cnsIEjSgv77AzVQrmWyKVQn09EBB0ZcbTQ51RjCDNAjWqZYUNDDUlIrvaUcCkt6m8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32eu8/TNvfSUNYv6ZqWXT2LUS3cj0kWHAc7sOSSlaDw=;
 b=FHn9a7Hw9lNJrl2j5y4e77gdFqcg1Uahg80N4t9pCir02ajY5owfluFQndlGEgx0gthHtg8noibVZu5FkQG7ZuwU/dVcsTgpWG2H8KYHStg94kPVn6ghk+p8i3lO5q9UJVzim2ivMKB26Y+4jk9s3S/KvvuBORnePUJMjRGrvGeuiKIlkvoAVkwxYnpa1O/q9qMPLPPK2LHH1GQsY44J5wRIUHzABnm+lrIQXa5t63jDmBkQp+ex/7isl/w42rfMXMr6QNPEi71YI5pm+hhDmMp7g5MZ9vVZYhjTtEZYofx/aBkn3czDI7/bJFshAmyvf9infGOitPGgXYHKTt4KEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32eu8/TNvfSUNYv6ZqWXT2LUS3cj0kWHAc7sOSSlaDw=;
 b=ts6oh+yHc2V9ba/ANSypVQGjZBKGGxZ7Oh6WKWVdJsVjaJ63tyrFEOe/4vi0wvCyxceUGCGGvqvQ8V01UEEZXXht5IjqQY9JouHHVt5l1f+0vGDy+IIBEjE32w8WL8kPLTG+CwveghtGWeijR66VsF3ruXDG8/arenjbr2zR7R0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (20.178.46.80) by
 DB7PR08MB3402.eurprd08.prod.outlook.com (20.177.121.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Tue, 17 Mar 2020 13:40:23 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::94d7:a242:40b4:cfb5%6]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 13:40:23 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: Leo Yang <Leo.Yang@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v1 RESEND] OpenCSD: Support for Arm CoreSight decode lib
Thread-Topic: [meta-arm] [PATCH v1 RESEND] OpenCSD: Support for Arm CoreSight
 decode lib
Thread-Index: AQHV82AxcM4gA6y/cEa2WeIzMImT9ahM3HaA
Date: Tue, 17 Mar 2020 13:40:23 +0000
Message-ID: <D89CBCAF-1ED4-4579-A899-809FD9C83502@arm.com>
References: <20200306023720.24723-1-leo.yan@linaro.org>
In-Reply-To: <20200306023720.24723-1-leo.yan@linaro.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2e262fc3-a20f-436d-11b7-08d7ca78c236
x-ms-traffictypediagnostic: DB7PR08MB3402:|AM6PR08MB3815:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3815A5A146C4B0568F236B009DF60@AM6PR08MB3815.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:2733;
x-forefront-prvs: 0345CFD558
X-Forefront-Antispam-Report-Untrusted: 
 SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(366004)(199004)(33656002)(4326008)(26005)(186003)(2906002)(966005)(66476007)(6512007)(478600001)(64756008)(66446008)(66556008)(66946007)(6506007)(53546011)(6486002)(5660300002)(71200400001)(54906003)(76116006)(91956017)(8936002)(36756003)(8676002)(81156014)(81166006)(6916009)(2616005)(86362001)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR08MB3402;H:DB7PR08MB3689.eurprd08.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +RJi6nHFydO4fBi4j1jpPMqmPKuCyl7UlAZX7iGXFhvvCNNenjFztUfqjxLXNaLBIkzFtzutbUF/HpiJfMdihldjNSCD21vkpqqChs8w5b0FkoCx59c8hBpwKOGJr7j9ph7AeZzSzf8bcP1m+5L9Nd9t42P4SYvJz2OrjaNfjYPqOdeqCSmUwlM7UF0lYJaUPYwtERZH0O6bx8So9nDCtRsCyep9ZI09DZEm2gEM5icJ/Y4LbbdvSHM1x9+AMPrJuFp/6kFAwUEW1VmPexkzVOjOWCWu7LTmPBdGh0KxY0jp7CkKaTBdfNRKc83D9ZixoSkz1TW44wtGaZsqztBIauHJ9GOg3o3rw/kdJZ51IcDwW9/goNtygcqiJEhz22UnRYLjjoa6mTW88x1kRE6DaMRylHtVTkRmQ1qHkp+q75luEh+zgSgYfIlSmoWzq8joOrrFTR+CITubt39vpLdwxiIo5NL8bIPiWpa74+kGv9HZtVhOwiaPcjwOvoPbQnXThWk105v3GVLm3YK2T49XXA==
x-ms-exchange-antispam-messagedata: 
 Cf8K3c0dKDdP/jcVHUAvY8APQqjf3nohKNsRshw1x9l5HqqSQEoeF0+ip25jCFYZxPyRMh0NYDyPOeXfc7VvgMJI5J66lAkjhrBr3HzdqKOACY8aTPBnxAHk4G78Ch0TPa+LAHK+NIQto3ez/atIXQ==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3402
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bertrand.Marquis@arm.com; 
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;IPV:CAL;SCL:-1;CTRY:IE;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(199004)(46966005)(6506007)(54906003)(53546011)(2616005)(47076004)(2906002)(36756003)(478600001)(6486002)(4326008)(5660300002)(33656002)(6512007)(36906005)(316002)(356004)(966005)(6916009)(26826003)(70586007)(8676002)(336012)(8936002)(26005)(81156014)(81166006)(86362001)(70206006)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR08MB3815;H:64aa7808-outbound-1.mta.getcheckrecipient.com;FPR:;SPF:Pass;LANG:en;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;A:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	47464eb3-5260-4f99-7a55-08d7ca78be8e
X-Forefront-PRVS: 0345CFD558
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qxV5bKM0v4mA6dKsAhmO8J78Km+ftn3v7NXdLCv/Aazq6v7L6XogZtMhXxZzCR72sNHNUzvk+Y1uKH1pc84n99oWGsvj0Ei/F0GFKXo6gXEW8FCLkJOb5M+t5UyDzrEiG2RTRmFq8fqhs8Bic0K/TLX4VHepQEUA6w4BO6YA9slc9veDV9fit2NrS2NY/iPn4eabYAbpDN9BGKOxuvK4HvScfrPhU2sJs5aMqsPfnHa7dQxjkrDivUkfLa4VzKTfgNaX5lOpQyx2ea9vnJ7HRPqBzg/x/yEuXl4515nPoMaQ1YrbqzVW34sHI+NjUq7O0Cl8IsZU1TgGGqRsBKN37Cmb+cwFGMJFGklTDt/mf7WIikpRvCCfIbuTcrGK2Eb2kjMB/s5y6jXTcZfnFYAhFtE3SZ3Pl8UkrHWSUFg5Bn8uSn7m7YDUybJR1p7FzpvOIdqxUCSZFuRuXzXtxGoFKe0NErO+/ybvgioCwhOW8Mlw2PLqJTo9W+kJNNz8ZDyaxjna3cNI+yJrFaShT6sDhd3VkqxohwFWwSULngIsLdEb9wH/dgGs2nqiAU7YKP/8jmRk7pD+AuQoFsSwjiI4HQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2020 13:40:29.8403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e262fc3-a20f-436d-11b7-08d7ca78c236
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3815
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC8D63A536FC474AB09316348258654E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable


> On 6 Mar 2020, at 02:37, Leo Yan via Lists.Yoctoproject.Org <leo.yan=3Dl=
inaro.org@lists.yoctoproject.org> wrote:
>=20
> Also create a new folder recipes-devtools under meta-arm to place
> this recipe.
>=20
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
> .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
> 1 file changed, 28 insertions(+)
> create mode 100644 meta-arm/recipes-devtools/opencsd/opencsd_git.bb
>=20
> diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm=
/recipes-devtools/opencsd/opencsd_git.bb
> new file mode 100644
> index 0000000..0c3b483
> --- /dev/null
> +++ b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "OpenCSD - An open source CoreSight(tm) Trace Decode librar=
y"
> +HOMEPAGE =3D "https://github.com/Linaro/OpenCSD"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43=
f3e5"
> +
> +SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttp;branch=3Dm=
aster"
> +SRCREV =3D "03c194117971e4ad0598df29395757ced2e6e9bd"
> +
> +S =3D "${WORKDIR}/git"
> +
> +COMPATIBLE_HOST =3D "(x86_64.*|aarch64.*)-linux"
> +
> +EXTRA_OEMAKE =3D "ARCH=3D'${TARGET_ARCH}' \
> +                CROSS_COMPILE=3D'${TARGET_SYS}-' \
> +                CC=3D'${CC}' \
> +                CXX=3D'${CXX}' \
> +                LINKER=3D'${CXX}' \
> +                LINUX64=3D1 \
> +                DEBUG=3D1 \
> +                "
> +
> +do_compile() {
> +    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
> +}
> +
> +do_install() {
> +    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=3D${D}/usr install=
; cd - )
> +}

I suspect both those will not catch make error if it happens.
You should not do this in a sub-shell.

I would suggest to rework this to do:
oe_runmake -C ${S}/decode/build/linux ${EXTRA_OEMAKE}

And adapt the same in install.

Regards
Bertrand

> --=20
> 2.17.1
>=20
>=20

