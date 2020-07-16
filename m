Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.56])
 by mx.groups.io with SMTP id smtpd.web12.15950.1594907839669780291
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jul 2020 06:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dMqYlDa9;
 spf=pass (domain: arm.com, ip: 40.107.4.56, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTS+macCRLNdd9iOak1yl1QrPxU0AzVuevuU5yAT5sc=;
 b=dMqYlDa9kLnIYONc0rSiqTUz6KRAfZ+Fcqu+tIp2o/evp+WQAkhCmWnAukCkW2VJC2bTYOuRNvTX+2wFDkUtz7ArZycW0KuwYo31ITukNfwo18+/XVUou/OWNAaHaMG9FsTkN7K1ybu/1FO3Ffyv5BgUibx08ornEsDvydDLB6Q=
Received: from AM6PR05CA0006.eurprd05.prod.outlook.com (2603:10a6:20b:2e::19)
 by VI1PR08MB3824.eurprd08.prod.outlook.com (2603:10a6:803:bf::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 16 Jul
 2020 13:57:16 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::85) by AM6PR05CA0006.outlook.office365.com
 (2603:10a6:20b:2e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend
 Transport; Thu, 16 Jul 2020 13:57:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Thu, 16 Jul 2020 13:57:16 +0000
Received: ("Tessian outbound 7de93d801f24:v62"); Thu, 16 Jul 2020 13:57:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 744105dfa7b2d004
X-CR-MTA-TID: 64aa7808
Received: from d0f54c6a127c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5CDFBCB0-7AF1-4C4E-A064-42E1ACF59669.1;
	Thu, 16 Jul 2020 13:57:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0f54c6a127c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Jul 2020 13:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ0ZiUSs/rAiFFmQ5tk6J3He2WO9SQwI/m0C625TkAogNLKPnsg2nkR3LJ8+yCGFtG6KD2UB8XemLJdrSJekwZb0KF5LmGyXeJGTu+enVpRa+Gq1OelX9Hm+HdIwQJif4zWYb3CsJi05ef5/WA2axha0tsWW/aDglrmFkJ1US8XSuGPmhIqg2yKGSFjner4gZsWIQxl6vYeo2yNoMFPiwjaOcCc4MQWbIAUf+0jzYnrXWpXl1QYE7M624DOAgavVQKG6zD84bqWWK0cnBQ9BVW47CeXF4u8ZMJkZ9Cm0zBuqRW+3jMcz/f++q1cEkbbOma1AwetJ8tjwOKz1OeHsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTS+macCRLNdd9iOak1yl1QrPxU0AzVuevuU5yAT5sc=;
 b=OEiObfsyc6hhvGvQdzXBrywYRlyeo7O+0V3fqsalSyPWBq1ORIVyab0kCXiNw4NQgWIBmDt72pURF+N3QgYKvZuT11kr/erVrVo01Y9nLkh16mZs9gZG894600KJsLAWwkcD4k+B4StndAgY6qJOgw/AnGK3/UNZxN457BK6WoE2ngkrM60lNv1NNpb7yncFZA042BFD7Mm3LRZpGtUMHE1zuYucOS8dS43uGGXHiWzJQywv9OtNRI3fILOnYFgS/KUjhPDBsM1UmdtMLr/v9fz+rzwYK6Fj/6IL3Zv0Hn2o5iPTnBhldPTmUj55DluVpa3saBac4asWa02wf9iqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTS+macCRLNdd9iOak1yl1QrPxU0AzVuevuU5yAT5sc=;
 b=dMqYlDa9kLnIYONc0rSiqTUz6KRAfZ+Fcqu+tIp2o/evp+WQAkhCmWnAukCkW2VJC2bTYOuRNvTX+2wFDkUtz7ArZycW0KuwYo31ITukNfwo18+/XVUou/OWNAaHaMG9FsTkN7K1ybu/1FO3Ffyv5BgUibx08ornEsDvydDLB6Q=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3690.eurprd08.prod.outlook.com (2603:10a6:10:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 16 Jul
 2020 13:57:09 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3174.025; Thu, 16 Jul 2020
 13:57:09 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/qemu: Install qemu-system-i386 instead of qemu-xen
Thread-Topic: [meta-arm] [PATCH] arm-autonomy/qemu: Install qemu-system-i386
 instead of qemu-xen
Thread-Index: AQHWW3ZsoaTHD13DMkuqdO/N2h3nVqkKOxAA
Date: Thu, 16 Jul 2020 13:57:08 +0000
Message-ID: <9FF75369-59E1-4195-8E60-E64395175857@arm.com>
References: <1594906650-4962-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1594906650-4962-1-git-send-email-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [91.160.77.188]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 31432f56-6daa-45b2-da18-08d82990262d
x-ms-traffictypediagnostic: DB7PR08MB3690:|VI1PR08MB3824:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB382447208729B1B42FD21DFD9D7F0@VI1PR08MB3824.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fqCML1hCNcgdKU0N81CxcMQ2tWpZvxsBo8gpsJHP1dIk6SmpxqB29ZyJ/J0xvfXN7JnuK5+K+lmpedwLZijBcETFyDcgzNgpModMmxcNetSrKKGKzcX39hUB2O8MpzVHWKS1wywpy0clS7BmyKKo0+g6JN4xxYtYyjTCmk6sCn7sVbewZOd9Khp/FLr8D3Ri9oJKYoFyuXaPxG5vdTGOTkPLLRxPm1caRUcthagS6XDA3DhpIkh6+PwZ+Sco3qoPnvGmDPtrJemq62bLWmoRGtYD4x/yG7zpVOvxmJ5VjYwZMicaU/CYRyDbHB3ao2z4ArKCy5I+8bGiVkz1ZORLiY8wDpFXo2X/2pi+vnoRhJCPxp3tDI1rS8rA69jynfrSfy5MK/n6o/xRh2D6gAZ7fg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(2616005)(66946007)(64756008)(6636002)(71200400001)(33656002)(54906003)(66446008)(37006003)(36756003)(66556008)(86362001)(91956017)(6506007)(53546011)(498600001)(66476007)(76116006)(966005)(6512007)(6486002)(5660300002)(6862004)(4326008)(8676002)(26005)(2906002)(83380400001)(8936002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 wBYTjiotaVV4hz3v7oeA6eSU1toUTkZ5e6KuLWjFL5jgOdvAtANZIoWs2fldqp6kzDULqoSt7LfZr0fLWz4B3xP2fDC4Qe4HwjU50nyb+hdNhVUUpOwtljJu/PNm9NHGk13is2N82KkksOF3WKSBUTN52ZrlmMCBEjL5b+N1BIxyUM8SWZUQ2ptd5nYSuc6RRVXGegQs1dj00ffbjdjWdQ7vmV6suxwNcHnxiU262e2XPrDeTO9ZIL8A7QJotB55ZANyKWJi17Xqm6CQ1dxamDPyvqrsr2uXmGpJy0zh9gaJ6j9fiEHQdUtMrYSzvhsG/bFm4tv9+SyfZvVRJLlpk7yFHXlnveOibCG3yooL1Aj77ubkaR3Z9owkgBrU0+XrUGIOnotPaLwpzt7BKRBobbUm+TG0lqwibnTpgQmogIJE6Ygwyw0hzFhvGQ9/IabE0wLWwOc2HMY4Z5nwtFmncZjvErsghL6j3KzP6Lgf3Kc=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3690
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(6636002)(53546011)(86362001)(82310400002)(36906005)(4326008)(6862004)(336012)(2906002)(47076004)(81166007)(54906003)(70206006)(37006003)(83380400001)(70586007)(356005)(2616005)(478600001)(316002)(82740400003)(5660300002)(33656002)(36756003)(8936002)(26005)(6512007)(6506007)(186003)(966005)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ab72363f-3514-4c56-5a82-08d8299021b9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1ECVxYjFz3XUCQRZTmhsbcmTmpQh/gNkEAKUCbTZ7buadnyqmQtVa46X1HWR7ynj1XKKka2bbsQOCQL4DjLCQvTf3u23kquji91ED86YM8uxEL8M3+NbviWPHVN0OSsxHpu96hRx7lEvBQY5DC4443YEmj6FrPGKx8Evq+PmJEizzszzhZn3t9kc7lJD+au0jgYyNX0o+4bHIfOh/8ZgvdWhn0OnURPblJaJAqmRfweFbVZ9zwDgyl0QVDwfCjtbyCeb/Iut9KxG2n6j5H5plREL8wKH1guW4M8zLV0P6MXZy44d7WBh9zB8Cp29rKy9RkMEVyywAXNfLkJpCd1yq+X6LqGDnIypeQL8R7J5hzosFt0Gndi+FEmILdxgjvJSTmYPhcszYvfiY59MKxB1EGFwXCmleLdFlibXZ1RLeXlThYmvxEjrtI0EfbEWX3IOKZnePmPuUt/fTpydvY1iy/xmbLXMGNcg7dHRS2GmZ3U=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2020 13:57:16.4904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31432f56-6daa-45b2-da18-08d82990262d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3824
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03BB75C5721D314BA92FA1BE78FDE750@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 16 Jul 2020, at 15:37, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This patch cleans the qemu_%.bbappend and uses the already provided
> qemu-system-i386 package from meta-virtualization to include only the
> /usr/bin/qemu-system-i386 binary.
>=20
> Change-Id: I6f1fc4db458d0b09c54013c1512398521cb349e2
> Issue-Id: SCM-889
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> .../recipes-core/images/arm-autonomy-host-image-minimal.bb   |  2 +-
> meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend      | 12 +++---=
------
> 2 files changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-ima=
ge-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-ima=
ge-minimal.bb
> index 5b20fa0..9731c7c 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-mini=
mal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-mini=
mal.bb
> @@ -39,7 +39,7 @@ ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS ??=3D ""
> IMAGE_INSTALL +=3D " \
>     packagegroup-core-boot \
>     packagegroup-core-ssh-openssh \
> -    qemu-xen \
> +    qemu-system-i386 \
>     xenguest-manager \
>     xenguest-network-bridge \
>     "
> diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/m=
eta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
> index ed63a4e..dbd89aa 100644
> --- a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
> +++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
> @@ -6,13 +6,7 @@ OVERRIDES_append =3D "${@bb.utils.contains('DISTRO_FEAT=
URES', 'xen', ':xen', '', d
> QEMU_TARGETS_xen =3D "i386"
>=20
> PACKAGECONFIG[noaudio] =3D "--audio-drv-list=3D'',,"
> -PACKAGECONFIG_append_xen =3D " virtfs noaudio"
> -PACKAGECONFIG_remove_xen =3D "sdl"
> +PACKAGECONFIG_append_xen =3D " noaudio"
> +PACKAGECONFIG_remove_xen =3D "fdt sdl kvm"
>=20
> -# Reduce the qemu package size by splitting it into
> -# qemu and qemu-xen packages
> -PACKAGES_prepend_xen :=3D "${PN}-xen"
> -RDEPENDS_${PN}_xen +=3D "${PN}-xen"
> -FILES_${PN}-xen_xen =3D "${bindir}/qemu-system-i386"
> -RDEPENDS_${PN}-xen_xen +=3D "xen-tools-libxenstore xen-tools-libxenctrl=
 \
> -    xen-tools-libxenguest"
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'recipes-devtool=
s/qemu/${BPN}-package-split.inc', '', d)}
> --=20
> 2.7.4
>=20
>=20

