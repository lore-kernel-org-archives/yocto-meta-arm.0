Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web10.1019.1587711155364193377
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Apr 2020 23:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=V1uohQfg;
 spf=pass (domain: arm.com, ip: 40.107.8.73, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDOs5mpdMx5vhUkqLKQjmagyAv/PHkqOctAKoV0+JRA=;
 b=V1uohQfgnZJqDYazdGt9VfpTysLcJiEtghVwoOyFLJXnbbxdhQN5glDRgCzY1K9AwAzDfwaXBmln5IL/nsISESB1mA41V4suQumPdvfPBhAcdox4U7oeCsR6EDGwOuWZ2HZ14cRe+8fyib7n8b+82V3SgEfQtcKsKcXEzV+v8dI=
Received: from AM5PR0502CA0015.eurprd05.prod.outlook.com
 (2603:10a6:203:91::25) by DB7PR08MB3564.eurprd08.prod.outlook.com
 (2603:10a6:10:4f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Fri, 24 Apr
 2020 06:52:32 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::a6) by AM5PR0502CA0015.outlook.office365.com
 (2603:10a6:203:91::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Fri, 24 Apr 2020 06:52:32 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.19 via Frontend Transport; Fri, 24 Apr 2020 06:52:32 +0000
Received: ("Tessian outbound 3a3e6dcbad0e:v53"); Fri, 24 Apr 2020 06:52:32 +0000
X-CR-MTA-TID: 64aa7808
Received: from a6d032ceb809.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2656BAB2-307F-44B4-83D3-816F73F445F0.1;
	Fri, 24 Apr 2020 06:52:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6d032ceb809.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Apr 2020 06:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhXgh1kSuCaElxCI4eSeK/zAAmnW2OPc0jOHE3SNxp4lzQGz11b0G8f5D9v1BiiU2B1sZECPV5DZ2jzkaZRWoxBB5wEu0+FIqNCQu1Jq6ziRpe2WFh8t2coTVsBxvIwmJm+IUE6uswvi8gwhB/jzvbhMjR9VwlEbti2mVcUB0D3JIXwZ7+QumOEMqS12GWzmGn2Q//CXN+toe40H/zQTB4HndJuV362WdfgUSm4eheGERgv6Hso7ImTCEL2vafdBkQ91gDCyF7AqUdNDRt+1/CMXr5495iqqBSYzEj5nyp5+2a4fTMaJ0m7oBCpg/33a9gxv4sfErFQ6vN+Vzyas9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDOs5mpdMx5vhUkqLKQjmagyAv/PHkqOctAKoV0+JRA=;
 b=ksPnlD7HAemduVrmIo7UwF73/6ByKw8Dzk8T5O+VX4XERs9dze3din/pUC/niaBa1ckhVB2WoT/RhM8uKKuyY+AD5hwN8kLx/RzN/01cpd4TiYfkAy+Q4a7uklW5tlPyba2Cv45Jgv3aNlzJJ6KXGXkcbDA+MzopGPRD5U/vekmsi+feXWVLlSzpxuSO0qviQFVnOmJloTmMpQOMEz2B0A+GlbBubrPGa2Ny/LnPjUgF2V4W9CSyvvr5yDVQ3D/xCeh+omGyw2OuoQ8nvB3iRYM//1o85zRhRZiQNDciX2gMevkaxqqmddRGlL9qvccdAq3GJSlWZaSJ5qxlRHistw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDOs5mpdMx5vhUkqLKQjmagyAv/PHkqOctAKoV0+JRA=;
 b=V1uohQfgnZJqDYazdGt9VfpTysLcJiEtghVwoOyFLJXnbbxdhQN5glDRgCzY1K9AwAzDfwaXBmln5IL/nsISESB1mA41V4suQumPdvfPBhAcdox4U7oeCsR6EDGwOuWZ2HZ14cRe+8fyib7n8b+82V3SgEfQtcKsKcXEzV+v8dI=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4420.eurprd08.prod.outlook.com (2603:10a6:208:142::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Fri, 24 Apr
 2020 06:52:24 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::9455:2702:c847:32da%5]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 06:52:24 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: add compatibility to dunfell
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: add compatibility to dunfell
Thread-Index: AQHWGgSPPH/KmCHjv0Wwi737NPRBTKiH1YnA
Date: Fri, 24 Apr 2020 06:52:24 +0000
Message-ID: 
 <AM0PR08MB3987B3F7ED4DD83D1BEEE65992D00@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200424064921.30088-1-vineeth.raveendran@arm.com>
In-Reply-To: <20200424064921.30088-1-vineeth.raveendran@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 271806ad-fb6f-434f-8bda-9dde9323cd4d.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9273e2a7-0a17-44ff-00ca-08d7e81c101c
x-ms-traffictypediagnostic: AM0PR08MB4420:|DB7PR08MB3564:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB35643761940D9F908C39B6DE92D00@DB7PR08MB3564.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 03838E948C
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(26005)(33656002)(71200400001)(6916009)(7696005)(2906002)(8936002)(81156014)(316002)(8676002)(53546011)(6506007)(4326008)(478600001)(86362001)(66946007)(186003)(55016002)(64756008)(66556008)(76116006)(66446008)(52536014)(5660300002)(66476007)(9686003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MVz1uA9tzRNOalHuhaVhs86UsBHu3Aw8xmKejK+yTEuNmNFIKABoaBWDnwyg0zmqh7MGHfbursPz80dcNTb+ZPpLDUg60Ni9Phb+eNn56qbEnsuWESI9mWVC/dQJONSPlbT2Xjnvq7/Bswzvc9QpUoAdJ0yeVn38GdbXn4FiM4K4FWsq8dQub8IRwh6UzTxFWti67jfp486hwDm+Psvhc7IcxfZmr3NSu6NT5TOiVWjktzcdu35BMK+H/50VY5OMK0VBwHsrc1FbGGufsaI/6rAQgYXII+Sn0FkkStSh6CpPKhNBJ7BFKqRR7JRx4q6P/MVB5OE1yU8GnTxoOH9flst6xCf6+HIaM0RyavHmRJOsdDnwhYGk5mYicTI9ObH31BL7Ce+v/Bx7YAlUxsAsj6W0J02EVhJuzyN3685GWHq5d29cRc7PXfxMVk1Ie6JA
x-ms-exchange-antispam-messagedata: 
 y4teS+3lefUzSs8SLZRUUZlTfoEtrY2qcX8JJm+Fk7OJWhwdcoSE6UXMRM89aMKiq+f6JZnlFd23mZeLTjiejPn6L7xn/WjAxhwsMSyBzNJDqQtTWO3DbsWKTRXWQmM6LsypLUJEFSGqsC9RHAA85g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4420
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966005)(26005)(6506007)(53546011)(33656002)(70586007)(7696005)(356005)(47076004)(82740400003)(6916009)(2906002)(36906005)(81166007)(8936002)(81156014)(8676002)(316002)(70206006)(186003)(478600001)(82310400002)(336012)(86362001)(4326008)(9686003)(55016002)(5660300002)(52536014);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	450e6937-7099-4c07-2eb4-08d7e81c0b97
X-Forefront-PRVS: 03838E948C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V9Q2z66nmLK8AxJzg/tJfKR1tPFtb9VfUaB5ebS+aSPFYfofFUpWMxpY9ClYoVRWjYmg+LpB1nS8noQL+btXJSw0FPZS1egy2pBFvbYGVoQ0C2EacCGy8LCGiGd58EO9Lyj93UXfqJzph9fwgkJV1JA/OAbqKSDrS52uuMd96YYUusmYsbM+tl2bNKLu4f6RbcTji/3eDruluSquMLOhAWCUtJpyReEphoUAzH1idW10wQIdo3/dNaMBUAfTs0ageS5ePiU33MHHPLsXtZ/xsC1oixDFdsWG+rz2H8G0AFaoJcyAlaN0cBCylc8EZzXAeELcwbcX4ta/NM9pUCkRpzThqRlhrOVd3/zuSJfQ6QP2QTiqTcTipVyunsGsLdCXj4xy1qN8JP7uZFFIpFTIUZzVe+1dFE52+GdA12yLCmxQx2tGclhetd3lQ/Oc78oTAl0AeYZOD1VogFmFnyV98fzKfKFW/qJeP6beTVSLzPfCozdcseFz7D6q6CB88MIhyaFFmgFgK0Alvjnxy9gSJQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2020 06:52:32.2563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9273e2a7-0a17-44ff-00ca-08d7e81c101c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3564
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Vineeth Raveendran via lists.yoctoproject.org
> Sent: 24 April 2020 07:49
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH] arm-autonomy: add compatibility to dunfell
>=20
>     - Remove xen-base from image as it's included via
>       xenguest-manager rdepends
>     - Use xen-tools in xenguest-manager rdepends for the required
>       xen tools and use xen-base only for zeus as it was changed
>       in meta-virtualization.
>     - Move xen bbappend as recipe was renamed in meta-virtualization.
>=20
> Change-Id: I439bde0df2c0a16f529436b65f1a96af5a2981af
> Issue-Id: SCM-833
> Signed-off-by: Vineeth Raveendran <vineeth.raveendran@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/conf/layer.conf                            | 2 +-
>  .../recipes-core/images/arm-autonomy-host-image-minimal.bb   | 1 -
>  .../xen/{xen_4.%.bbappend =3D> xen_%.bbappend}                 | 0
>  .../recipes-extended/xenguest/xenguest-manager.bb            | 5 ++++-
>  4 files changed, 5 insertions(+), 3 deletions(-)  rename meta-arm-
> autonomy/recipes-extended/xen/{xen_4.%.bbappend =3D> xen_%.bbappend}
> (100%)
>=20
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-
> autonomy/conf/layer.conf
> index 19f24ad..de79bdf 100644
> --- a/meta-arm-autonomy/conf/layer.conf
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -16,7 +16,7 @@ LAYERDEPENDS_meta-arm-autonomy =3D " \
>     openembedded-layer \
>     virtualization-layer \
>  "
> -LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus"
> +LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus dunfell"
>=20
>  # We don't activate virtualization feature from meta-virtualization as i=
t  #
> brings in lots of stuff we don't need. We need to disable the sanity chec=
k diff
> --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
> image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-
> autonomy-host-image-minimal.bb
> index 978b58f..727abf2 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> minimal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
> image-mini
> +++ mal.bb
> @@ -39,7 +39,6 @@ IMAGE_INSTALL +=3D " \
>      packagegroup-core-boot \
>      packagegroup-core-ssh-openssh \
>      kernel-modules \
> -    xen-base \
>      qemu \
>      xenguest-manager \
>      xenguest-network-bridge \
> diff --git a/meta-arm-autonomy/recipes-extended/xen/xen_4.%.bbappend
> b/meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> similarity index 100%
> rename from meta-arm-autonomy/recipes-
> extended/xen/xen_4.%.bbappend
> rename to meta-arm-autonomy/recipes-extended/xen/xen_%.bbappend
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> manager.bb
> index 9affae9..2e040a8 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> manager.bb
> @@ -46,7 +46,10 @@ do_install() {
>  }
>=20
>  # Things that we need on the target
> -RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-xl parted
> e2fsprogs"
> +RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 parted e2fsprogs"
> +
> +# Extend RDEPENDS based on the yocto version we are running against
> +RDEPENDS_${PN} +=3D "${@bb.utils.contains('LAYERSERIES_CORENAMES',
> 'zeus', 'xen-base', 'xen-tools', d)}"
>=20
>  FILES_${PN} +=3D "${bindir}/xenguest-manager \
>                 ${sysconfdir}/xenguest"
> --
> 2.17.1

