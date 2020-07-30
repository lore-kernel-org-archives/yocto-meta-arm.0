Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.85])
 by mx.groups.io with SMTP id smtpd.web12.11492.1596124606242529125
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 08:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cb0Sq8Qr;
 spf=pass (domain: arm.com, ip: 40.107.15.85, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3/YDzUiaMvVE+taTR3Sq1MZHbMDdebWBDlmcz/lP0c=;
 b=cb0Sq8Qriimr4DGJK9nRN667ORSLmkmHXmZJ8yVyG662RpUUnYiCp0zWB5NHkiS92Hedy+hdNG9eT8yEMiPyClpFLA91lZgkWd7/bK1+6p0mdYng6Jg5USFphuFSVyk7Q39RuHZHHhUX2ZjlY7NpR3F2ekUksk1bKhFNjoBAeU0=
Received: from MR2P264CA0055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::19)
 by VI1PR08MB4127.eurprd08.prod.outlook.com (2603:10a6:803:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 15:56:43 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::a2) by MR2P264CA0055.outlook.office365.com
 (2603:10a6:500:31::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Thu, 30 Jul 2020 15:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 15:56:43 +0000
Received: ("Tessian outbound 1dc58800d5dd:v62"); Thu, 30 Jul 2020 15:56:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b6d313bf5779067d
X-CR-MTA-TID: 64aa7808
Received: from e606ee7c864e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1DB00F4B-79CE-4DBD-A396-72268A5E9573.1;
	Thu, 30 Jul 2020 15:56:37 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e606ee7c864e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Jul 2020 15:56:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZelXsLb/iio+9AwQNxNX1XOt2AstU+FyCpSdmOyRTDKf4PusqBUoWo7E67WvEyxmb/c9vFwYy9UXf7VjQgfoqycQmNyJbNExJx2EawU23JJhWQjYFKPdDFx26MY+LrtnB32Brna4U+3ehVugG+bT4Mz7h142EfbnNHFYogy5GqwUZHnMeLikz89gzweNA0JlEoNtDB7i+m48qLW8BecT6icyDvHuk6BzH3+YKzMLbputvDberC3giCexgiDSq35ZqGd0tTw0NaQrhYHAtC4tRKd/6S/TtgC/LGwAOtdpTam1y6V2nwYo6cXIoC1hEINq5FDNaKezyCMmk2y6dFuREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3/YDzUiaMvVE+taTR3Sq1MZHbMDdebWBDlmcz/lP0c=;
 b=TeTrf4Nvfmp7zV2ghl60qkN1psJZ9KFxLLs6cxWiW9CW+6s/4e7erTftS06XCHMpOQU+XILsoJ1+KTC0Yc4VOfRixCNsr7qRA/TpcIlfW79qzCKK5Jvj9e5KjKIfikf/tiRhHwHcZas5OVHbrkh0FziAQ803m/5rusnESlsJbkkO469eblRZplGkXPVQctT6QAVYNHsx4yzK94Wv3kUaDqFT6ReUSSSuHL6jr/KScuU89nduTTLEmKW4u8R2C9WRd0YKNYDSAmFgurXYhtJk8FWyxWCbyzMqEvlKrkTW8myfiuzMyUpGZeQvFnXUTQy5CgSK5+Z5yEPvPKmeQj8PxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3/YDzUiaMvVE+taTR3Sq1MZHbMDdebWBDlmcz/lP0c=;
 b=cb0Sq8Qriimr4DGJK9nRN667ORSLmkmHXmZJ8yVyG662RpUUnYiCp0zWB5NHkiS92Hedy+hdNG9eT8yEMiPyClpFLA91lZgkWd7/bK1+6p0mdYng6Jg5USFphuFSVyk7Q39RuHZHHhUX2ZjlY7NpR3F2ekUksk1bKhFNjoBAeU0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 30 Jul
 2020 15:56:36 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3216.033; Thu, 30 Jul 2020
 15:56:36 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Move gem5-arm64 to dynamic-layers/meta-gem5
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: Move gem5-arm64 to
 dynamic-layers/meta-gem5
Thread-Index: AQHWZonxiFKVciQX70aEIdlyKJnIMakgRuyA
Date: Thu, 30 Jul 2020 15:56:36 +0000
Message-ID: <00B5FDA1-4C4F-4F4A-AC1C-82F9A7329C1A@arm.com>
References: <1596124498-110662-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1596124498-110662-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4a30cfab-3d2e-4984-abe3-08d834a127a1
x-ms-traffictypediagnostic: DB8PR08MB5371:|VI1PR08MB4127:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB4127427369187410C9AA05E89D710@VI1PR08MB4127.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 F9hV47yXtxXNCLIx/JK6HoIy5q7cL94q7BrYYlOW28DyBYUVpNBlcxpeXkBg5V9kcoI++t1Xw6UkZRDgF5j2fyj8HRx223T6mg30ZOyXY+VdhEvG/W+5YOZm1xGvzio/D1JChn13szOzSGkPRiaPKVKTIRyK8/cgoUjT5aScg4+2EZDXIaMGg1zyhBJdmbuWH+y+3dqrmNZgD67LES2+Ouqs5YWOfkgb4isec12WI4Xp704xlF/GuV2rgeCxavnYLzraJm3814yib7o7qrb+gHohejOAgZu1XINcQkWOhRwXQ7tEdDzhmVeVPS2vtACXC+W3TINlng4K6OBOgDEXnLCvtzOLG6i771aa8EvpuL0iYsABTzhbAQJvOAewX0bdz/PTeoz+1IpLyN6k2fsVzwsO4/gXBFPwtSQBtUu3FY0f6eFfpWUpX2R5p41ICiOleMDpEmBtHPKOvnpwK5RUfw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(2906002)(2616005)(33656002)(83380400001)(186003)(5660300002)(4326008)(26005)(30864003)(66476007)(66556008)(6862004)(6636002)(66446008)(64756008)(6506007)(76116006)(66946007)(6486002)(53546011)(478600001)(8936002)(36756003)(966005)(316002)(54906003)(86362001)(8676002)(6512007)(71200400001)(91956017)(37006003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 3BoVOGTNcK6WD/SkZrEi1L5gVO0kfrSAerIuxJmujo3yMZ1vQfU3SPWaa8n0eiOiUbDyZ15EQP+qCo6e9OwZ43QgxB4CYBIAfj5QQbRZXkg16VEB6NSIfU7KAqML3bb1DpzLlg0y1e2TMCKv7ajAe1q1W523DXgpY13Os5FItuMvCIOO293llsltoT5lbjswbnyE9bvotOx4Qp2Svp1tUOmFKeVIDfeWdsZClg5IUXzOjkBAvjE3mh8zytPxeJ9jXz5mltqU4Dd4xT+o78aSKc0wQIQv2BU0xH7MEg56mf2Uh+a8RqLdv+fARrGHX5X8J5fT9S9jCBb8xAG5ZqqyeUJUsf5IWMu0RdofcKYNf8kl6GvY8uscNvd9cCWm/rTLqEi9KJwecIlQ0DaJ9LwfWfUhgv2zu4ZuLoC73zthcY8Mi6Pd9qDl/Crl7L1/A9zEdPTF98NSY/XZ4SrfGH+qVojMvATGcB16l2zSLUdOXPHVjpM+OcnKOb7YbWAIIV00Hp3+iDXdR+z74XpCPFfzc4qbE5yfq0dk3SM1Xhm6PRH6oGcXU1S2H1dcKgrO2OFdV7GZ12KmXV/7L9lqXdpZ1+p5FVhttCrSL1LJc1T7MYjinVR6Y2kbMApv/n+WlmyNzeSDjJ6XcRTG4XGX2laqxg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac19d5e2-62c5-4211-cf5c-08d834a12373
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ESF9C33UmL/dY7wRlGYJtJysgoyqW4NzvI8Ehv2YdlylQemmORH21vmxNWZPLNOBBvoiB+UKSoRjJDyBjIX/aJrr0+FfF26Eh2wLiBKM7qiYpwoHxo0KhdW4udLZ1WfCYcHRjspDGF/QCNDmwk04sdekpW7VtxpoeOHbdbd2C1MhMg7IcZzMg3AeZXqfxHbWCypSx55RYFvy/HLfouhEotbLvd21nzIDYgcT8a3ReCSab9SR5LEJR6+kH4ng8Bd/6ItWdOEleKGM4BZVXm6QS3cNXT/gJqKx8i+jnNN4W5EAMR3zxVaUcGZ6uf5IvK7nmXnawj5GFlkQ5C8C80CEr1QcTdtGIzASHPRi/e/LMk5uQBDeXwILVGJA3EZvm9QYegb3QldGrCVszNjwGaY1nPdys7CRQqJlHV4k5xKuLg5Osr9h9ayOCgq6mcle7GrTKkyXzwgKwiHWwoByyIk0Pg6YkRYfhsriN78ivScUKh7jGpdfQLwZHk+BywIKSpLU
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966005)(966005)(478600001)(26005)(86362001)(2906002)(4326008)(6486002)(30864003)(186003)(2616005)(83380400001)(47076004)(336012)(5660300002)(53546011)(8676002)(81166007)(70586007)(82310400002)(6506007)(54906003)(8936002)(316002)(37006003)(36906005)(70206006)(36756003)(33656002)(82740400003)(6862004)(6636002)(6512007)(356005)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 15:56:43.0761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a30cfab-3d2e-4984-abe3-08d834a127a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4127
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <75AF2D1295F7854588DB47F8E86774BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 30 Jul 2020, at 17:54, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Since gem5-arm64 machine implementation was moved from meta-arm-bsp to
> meta-gem5, we need to move the specific machine settings to
> meta-arm-autonomy/dynamic-layers/meta-gem5.
>=20
> Change-Id: I773189e7e1ee2ca77e569dcec2d92ecfb93d3719
> Issue-Id: SCM-1133
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-autonomy/conf/layer.conf                  |  1 +
> ...ap-the-number-of-interrupt-lines-for-dom0.patch | 44 ----------------=
------
> .../recipes-extended/xen/xen_%.bbappend            |  5 ---
> .../xenguest/xenguest-network-bridge.bbappend      |  2 -
> .../recipes-kernel/linux/linux-%.bbappend          |  1 -
> .../boot-wrapper-aarch64_%.bbappend                |  0
> .../meta-gem5/recipes-extended/xen/xen_%.bbappend  |  2 +
> .../xenguest/xenguest-network-bridge.bbappend      |  1 +
> .../features/arm-autonomy/disable-arm64-sve.cfg    |  4 ++
> .../features/arm-autonomy/disable-arm64-sve.scc    |  3 ++
> .../recipes-kernel/linux/linux-%.bbappend          | 15 ++++++++
> 11 files changed, 26 insertions(+), 52 deletions(-)
> delete mode 100644 meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes=
-extended/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-f=
or-dom0.patch
> rename meta-arm-autonomy/dynamic-layers/{meta-arm-bsp =3D> meta-gem5}/re=
cipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend (100%)
> create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-ex=
tended/xen/xen_%.bbappend
> create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-ex=
tended/xenguest/xenguest-network-bridge.bbappend
> create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-ke=
rnel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm6=
4-sve.cfg
> create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-ke=
rnel/linux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm6=
4-sve.scc
> create mode 100644 meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-ke=
rnel/linux/linux-%.bbappend
>=20
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/=
layer.conf
> index 5c13596..2b9e94d 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -31,4 +31,5 @@ USER_CLASSES_append =3D " arm-autonomy-features"
>=20
> BBFILES_DYNAMIC +=3D " \
>     meta-arm-bsp:${LAYERDIR}/dynamic-layers/meta-arm-bsp/*/*/*.bbappend =
\
> +    meta-gem5:${LAYERDIR}/dynamic-layers/meta-gem5/*/*/*.bbappend \
> "
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-exten=
ded/xen/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom=
0.patch b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xe=
n/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patc=
h
> deleted file mode 100644
> index 792bc9e..0000000
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
/files/4.12.0/0001-xen-arm-Cap-the-number-of-interrupt-lines-for-dom0.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From a41feccdb6c03f12bddb4fb650a0465f0ed6eeca Mon Sep 17 00:00:00 2001
> -From: Lukas Juenger <juenger@ice.rwth-aachen.de>
> -Date: Fri, 5 Apr 2019 15:54:04 +0200
> -Subject: [PATCH] xen/arm: Cap the number of interrupt lines for dom0
> -
> -Dom0 vGIC will use the same number of interrupt lines as the hardware G=
IC.
> -While the hardware GIC can support up to 1020 interrupt lines,
> -the vGIC is only supporting up to 992 interrupt lines.
> -This means that Xen will not be able to boot on platforms where the har=
dware
> -GIC supports more than 992 interrupt lines.
> -While it would make sense to increase the limits in the vGICs, this is =
not
> -trivial because of the design choices.
> -At the moment, only models seem to report the maximum of interrupt line=
s.
> -They also do not have any interrupt wired above the 992 limit.
> -So it should be fine to cap the number of interrupt lines for dom0 to 9=
92 lines.
> -
> -Signed-off-by: Lukas Juenger <juenger@ice.rwth-aachen.de>
> -Acked-by: Julien Grall <julien.grall@arm.com>
> ----
> - xen/arch/arm/setup.c | 8 +++++++-
> - 1 file changed, 7 insertions(+), 1 deletion(-)
> -
> -diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> -index 444857a967..ccb0f181ea 100644
> ---- a/xen/arch/arm/setup.c
> -+++ b/xen/arch/arm/setup.c
> -@@ -888,7 +888,13 @@ void __init start_xen(unsigned long boot_phys_offs=
et,
> -     /* Create initial domain 0. */
> -     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> -     dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> --    dom0_cfg.arch.nr_spis =3D gic_number_lines() - 32;
> -+    /*
> -+     * Xen vGIC supports a maximum of 992 interrupt lines.
> -+     * 32 are substracted to cover local IRQs.
> -+     */
> -+    dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) 9=
92) - 32;
> -+    if ( gic_number_lines() > 992 )
> -+        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n=
");
> -     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> -=20
> -     dom0 =3D domain_create(0, &dom0_cfg, true);
> ---=20
> -2.17.1
> -
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-exten=
ded/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/reci=
pes-extended/xen/xen_%.bbappend
> index bdcb75f..5e58ab1 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
/xen_%.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
/xen_%.bbappend
> @@ -2,7 +2,6 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>=20
> # Machine specific settings
> XEN_CONFIG_EARLY_PRINTK_juno =3D "juno"
> -XEN_CONFIG_EARLY_PRINTK_gem5-arm64 =3D "vexpress"
> XEN_CONFIG_EARLY_PRINTK_fvp-base =3D "fastmodel"
> XEN_CONFIG_EARLY_PRINTK_foundation-armv8 =3D "fastmodel"
> XEN_CONFIG_EARLY_PRINTK_n1sdp =3D "pl011,0x2a400000"
> @@ -22,10 +21,6 @@ COMPATIBLE_MACHINE_juno =3D "juno"
>=20
> SRC_URI_append_juno =3D " file://juno/defconfig"
>=20
> -# Gem5 support
> -# Fix problem with number of interrupts on gem5
> -SRC_URI_append_gem5-arm64 =3D " file://4.12.0/0001-xen-arm-Cap-the-numb=
er-of-interrupt-lines-for-dom0.patch"
> -
> # N1SDP support
> COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
>=20
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-exten=
ded/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-l=
ayers/meta-arm-bsp/recipes-extended/xenguest/xenguest-network-bridge.bbappe=
nd
> index de88cce..1efd7c6 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
guest/xenguest-network-bridge.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-extended/xen=
guest/xenguest-network-bridge.bbappend
> @@ -4,7 +4,5 @@ XENGUEST_NETWORK_BRIDGE_MEMBERS_fvp-base ?=3D "eth0"
>=20
> XENGUEST_NETWORK_BRIDGE_MEMBERS_foundation-armv8 ?=3D "eth0"
>=20
> -XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?=3D "eth0"
> -
> # Juno board has 2 network interfaces, add both of them to the bridge
> XENGUEST_NETWORK_BRIDGE_MEMBERS_juno ?=3D "eth0 eth1"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kerne=
l/linux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/re=
cipes-kernel/linux/linux-%.bbappend
> index 189645a..5231f51 100644
> --- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux=
/linux-%.bbappend
> +++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-kernel/linux=
/linux-%.bbappend
> @@ -12,6 +12,5 @@ LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE =3D "${@bb.utils.=
contains_any('DISTRO_FEATURE
>                                          'arm-autonomy-host arm-autonomy=
-guest', \
>                                          ' features/arm-autonomy/disable=
-arm64-sve.scc','',d)}"
>=20
> -KERNEL_FEATURES_append_gem5-arm64 =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM=
64_SVE}"
> KERNEL_FEATURES_append_fvp-base =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM64_=
SVE}"
> KERNEL_FEATURES_append_foundation-armv8 =3D "${LINUX_ARM_AUTONOMY_DISABL=
E_ARM64_SVE}"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/b=
oot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend b/meta-arm-autonomy/dy=
namic-layers/meta-gem5/recipes-bsp/boot-wrapper-aaarch64/boot-wrapper-aarch=
64_%.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/dynamic-layers/meta-arm-bsp/recipes-bsp/bo=
ot-wrapper-aaarch64/boot-wrapper-aarch64_%.bbappend
> rename to meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-bsp/boot-wr=
apper-aaarch64/boot-wrapper-aarch64_%.bbappend
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended=
/xen/xen_%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-ex=
tended/xen/xen_%.bbappend
> new file mode 100644
> index 0000000..9e7ba45
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xen/xe=
n_%.bbappend
> @@ -0,0 +1,2 @@
> +# Machine specific settings
> +XEN_CONFIG_EARLY_PRINTK_gem5-arm64 =3D "vexpress"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended=
/xenguest/xenguest-network-bridge.bbappend b/meta-arm-autonomy/dynamic-laye=
rs/meta-gem5/recipes-extended/xenguest/xenguest-network-bridge.bbappend
> new file mode 100644
> index 0000000..0283702
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-extended/xengue=
st/xenguest-network-bridge.bbappend
> @@ -0,0 +1 @@
> +XENGUEST_NETWORK_BRIDGE_MEMBERS_gem5-arm64 ?=3D "eth0"
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/l=
inux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.=
cfg b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-a=
utonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
> new file mode 100644
> index 0000000..7e87cab
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/ar=
m-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.cfg
> @@ -0,0 +1,4 @@
> +# We need to turn off SVE support in the Linux kernel otherwise Xen is =
stopping
> +# Linux kernel with a coredump while trying to access ZEN bit of CPACR1=
 core
> +# register.
> +# CONFIG_ARM64_SVE is not set
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/l=
inux/arm-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.=
scc b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/arm-a=
utonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
> new file mode 100644
> index 0000000..6bc769c
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/ar=
m-autonomy-kmeta-extra-gem5/features/arm-autonomy/disable-arm64-sve.scc
> @@ -0,0 +1,3 @@
> +define KFEATURE_DESCRIPTION "Disable SVE support"
> +
> +kconf non-hardware disable-arm64-sve.cfg
> diff --git a/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/l=
inux/linux-%.bbappend b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-=
kernel/linux/linux-%.bbappend
> new file mode 100644
> index 0000000..0d0047a
> --- /dev/null
> +++ b/meta-arm-autonomy/dynamic-layers/meta-gem5/recipes-kernel/linux/li=
nux-%.bbappend
> @@ -0,0 +1,15 @@
> +FILESEXTRAPATHS_prepend_gem5-arm64 :=3D "${THISDIR}:"
> +
> +#
> +# arm-autonomy kmeta extra
> +#
> +SRC_URI_append_gem5-arm64 =3D " file://arm-autonomy-kmeta-extra-gem5;ty=
pe=3Dkmeta;name=3Darm-autonomy-kmeta-extra-gem5;destsuffix=3Darm-autonomy-k=
meta-extra-gem5"
> +
> +# We need to turn off SVE support in the Linux kernel otherwise Xen is =
stopping
> +# Linux kernel with a coredump while trying to access XEN bit of CPACR1=
 core
> +# register.
> +LINUX_ARM_AUTONOMY_DISABLE_ARM64_SVE_gem5-arm64 =3D "${@bb.utils.contai=
ns_any('DISTRO_FEATURES', \
> +                                         'arm-autonomy-host arm-autonom=
y-guest', \
> +                                         ' features/arm-autonomy/disabl=
e-arm64-sve.scc','',d)}"
> +
> +KERNEL_FEATURES_append_gem5-arm64 =3D "${LINUX_ARM_AUTONOMY_DISABLE_ARM=
64_SVE}"
> --=20
> 2.7.4
>=20
>=20

