Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web10.14173.1585322446999289819
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ITl3L4Wy;
 spf=pass (domain: arm.com, ip: 40.107.20.65, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if6oqvFuWRpSJlHAUsqhqbIJxauk5fxUfNL15uz726Q=;
 b=ITl3L4Wy2FaYEsqKR5Za2yQGHtBo79CnNWXHhWFwy9pSnmPH7peVSIgP2l0IzU3XGxcbZ7P3EC9qAB9f/27O39PAJegZY8X0SzBCq3ymVpxJvNkonuKsSittFwckFi7tNDsO7CHGeblZrwncsFVPIfBebItg2+nHLo4Tq9sVBsc=
Received: from AM5PR0502CA0018.eurprd05.prod.outlook.com
 (2603:10a6:203:91::28) by AM7PR08MB5510.eurprd08.prod.outlook.com
 (2603:10a6:20b:109::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Fri, 27 Mar
 2020 15:20:44 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::ad) by AM5PR0502CA0018.outlook.office365.com
 (2603:10a6:203:91::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:20:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:20:44 +0000
Received: ("Tessian outbound fb361fb66447:v48"); Fri, 27 Mar 2020 15:20:44 +0000
X-CR-MTA-TID: 64aa7808
Received: from a17543ccfeea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 28D50579-A402-448B-A7F2-7A22BF322D15.1;
	Fri, 27 Mar 2020 15:20:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a17543ccfeea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:20:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ju/g7ewCq3x/asvpGU3gwiSOqL8uUf9Z2kWf6JsYdxjpnC+AdtE426A34JPr2zQ9JSXFvMTgBBT/eqFoZLOXLWjsBAciF4xI2rpg8HrKP3McUv3DR5U2ZyWBxyohbRrHDqxPLSQS1V+Gf2/+mx2MusfHsDchiLnmdJK/1OGlkHe42Ud0Ptj1yQjQqR8QSMLKVV7HknVgX3pjQu3R/DJq+7wLgUTZ8n2IIrgQ+JGPf612FgRXwlMGQ55NWKlQmQXybENHvgp9HXDwACZtxlIYoLU28sSL2UL/QhefqT+0Owl+z9dBucgmM3/i8XjplzTrmscEgDYrJEokS8vkHYGKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if6oqvFuWRpSJlHAUsqhqbIJxauk5fxUfNL15uz726Q=;
 b=OdPrsal1DPGmKX4l/pbXd/Xfohc6iRj94GTiaASHscotPeqQJqMCJAeoVm/ViV/nWz+a7sDMSFk2SftcnYtMQYhFcGrvUueOJqBDsVVkXfGFmPmEUYisXMqz+vn7O1OElZm+oNFAQUtN9vl7OFtvtMDnQ6Z7JOkweRDjcumkBowxYBZnsUi8lldXzSEOmgf3kaQzMQqQAE/TflFAX/FMZk18KAE7IzC67ZUnEYVmED3zRYB+CbRO0IbmzkKnZg++LeOlVtkgUqA5+CH4VrdfDHXtMn1kN+liTyxL5ySvhBvkl4hV8kDdEGi6DjRGRFFskVYWJjHPkMTf5OOeCOQ6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if6oqvFuWRpSJlHAUsqhqbIJxauk5fxUfNL15uz726Q=;
 b=ITl3L4Wy2FaYEsqKR5Za2yQGHtBo79CnNWXHhWFwy9pSnmPH7peVSIgP2l0IzU3XGxcbZ7P3EC9qAB9f/27O39PAJegZY8X0SzBCq3ymVpxJvNkonuKsSittFwckFi7tNDsO7CHGeblZrwncsFVPIfBebItg2+nHLo4Tq9sVBsc=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 15:20:37 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:20:37 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/7] arm-autonomy: Create meta-arm-autonomy layer
Thread-Topic: [meta-arm] [PATCH 1/7] arm-autonomy: Create meta-arm-autonomy
 layer
Thread-Index: AQHWBCWZvr1akc6i6k62ZHYTDdwuk6hci6hA
Date: Fri, 27 Mar 2020 15:20:37 +0000
Message-ID: 
 <AM0PR08MB3987646A755B4E39DB789F0292CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
 <20200327105010.400-2-bertrand.marquis@arm.com>
In-Reply-To: <20200327105010.400-2-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 2fb899be-53a8-47e7-9c79-3bec17e5b29d.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3bb28e50-5d0e-411c-16de-08d7d2626b2c
x-ms-traffictypediagnostic: AM0PR08MB3650:|AM7PR08MB5510:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB5510DE752E6EC3EF59BE829E92CC0@AM7PR08MB5510.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(6916009)(478600001)(55236004)(6506007)(53546011)(81166006)(186003)(55016002)(86362001)(8936002)(5660300002)(7696005)(26005)(81156014)(76116006)(33656002)(66476007)(66556008)(52536014)(66946007)(64756008)(8676002)(71200400001)(4326008)(316002)(2906002)(66446008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yOZ8mTV7QuuPBZYzd78ADlIb6IxkKMRP2mLtbboHoVy4nu7PqtvIwSnaPnCYKeyotBGrBvMS8Luibu6lmnKNGhJPvYlo8XzIrrGrQU1A0InynY3vtX7Gh/H9D+JlVmwfb2KE/Clfz4N6XutNH8J/2jsige7A5slELC6Tmzu+4VyhnTc2BeuDSUCdB5BCKcCjBIVVNyi6Yad9w15X7Kv6/aGHdPt0CPGFwxwuxmEms9ygbcL5rrN8CDUWh4zaw3re/9h5AJm7wjELsj10z7YLlkCalael5QKmOK+GveWUUM+HzCF9jKZ30sAhgacmFjIxMAuRZzm98i5dyx9Wb9hSCHpxiKfv8AQ5epOHcEqXSXVKqxmfz9lVq2spL26qRwQnkXJHsZs8qH8ant9uhMX2vkii5OLsp6pxHGhi7+h+FcUOCTknB9VI9JykXA3HZm6opL2Cl9cjyzqVknuG2vVeSH3mBO+lmdgS7pcdAhCc4vtnX7TNnA9xA3F0nsfmc305MxctpvKj/rO4ug1+OtO0q/OhGTg9dd6bOF4FjFpYkCN3Y3tGLTCWc1SSvMGBbJPuQ7ZgR9/vNj/UQkh139ZAIqIu03ob0HHp09povfhzmD1nqgsdNZZNH/raP1wjKTrWmNJprOXKDx0PKgK0SrQRfChUG8DKjqddDyCgxIAoGmxgTFnwJthFvSclKgmn8LVSLkxHlO/MLldjIL9cHEIlBRfXX7oOhbA+0Zn88iLGsss=
x-ms-exchange-antispam-messagedata: 
 YXtKA0mA+GIpvzkP/NR/eron0emKYj1Kz1U4UQtbCJAK1RKk+2NRZ9PlgiKdZvYRItBS0Fd4bW5bRPPPxCKGPBpdPUtHUu2rkO49VOnGYq6vwB3p4JZxPyJ5pWZrgHIsaElP8PoLfScwWfESKjtSdA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(6506007)(36906005)(53546011)(26005)(52536014)(186003)(70206006)(70586007)(5660300002)(26826003)(336012)(9686003)(356004)(47076004)(4326008)(316002)(7696005)(55016002)(8936002)(33656002)(478600001)(6916009)(81156014)(81166006)(8676002)(86362001)(82740400003)(2906002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	28b7d967-435f-4211-3e94-08d7d26266f2
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mKgF/N8zUH5/Ysu+QL/QBuGzvxbC4u1IxSzsWG6OxnG9aImvUftOdfgKYYXZw1gVxPlaWMfAZKO+bLrCJK9sN3Umw/iWPwatkccMD98vqJ43SU9/r23e68ZdT6EB9f/vIgV4/BT466JM+RhnGqU9XIUwj7+xcLMaP5s+qvSOtNKUecBZv3o9wVpi5mHGukh/7U3YjYqc0uLQbqqm24tiLbeK7o08Ntrmm4n09z4n0NNA5qyQ3V5zH5xCr7fmOJPxbaBHvvP+i7CKHDUWJKwS4td154aXD16zwUl9pSZ6v7nxfcmHF/qOBQIEAVX6B3+YEwXGIN8WSaNn0DEOjZDaQoV6ZsaT/0oB5madGtS6KjuJ6OONZgF7xCS/lo6V5/gkml2b2qjzLuwZ8xTdCgnPVLRxP98SAXT0CsMvEqbXwMUC/ULiNQ/ljIkMyTd4MCdsU98bP2NuQmC2frQ6UEptL1zQdSHbkipy8GEQu/swG+5RrdvOPTvdavA2sM84lb4U9A8ahSClIjoe857ZjUHI+dQtcyrdGsaYfV03U0CUCaSSX4/XijUvSup+ku1+VtdkAiIs59uTV1SBiNjgyfCBWmZGoRuJEvYCsEwi0IGsd40uw2Pw6L+i2lfvvxiVJJZpA5eujVuer2Bb75iSBaLP7wjeMFQ3shs/SPl7UOQS0rgGafBwSx9YIt2vHUxlqCimGXVBD6U3b0QCY2j89fZnU2T4MR8UgFAP3xwg4P3F0AwYUrcQFyNtHUsLsX2CbIar+zeKGf+yW3ipfF6XB1pQQmNS1fLpQIBMYdClmolm3Rg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:20:44.2323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb28e50-5d0e-411c-16de-08d7d2626b2c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5510
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:50
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 1/7] arm-autonomy: Create meta-arm-autonomy
> layer
>=20
> Create a meta-arm-autonomy layer in meta-arm.
> Add layer configuration file and Readme.
>=20
> Change-Id: Idf3411edc21f3d13fdc7146fcf34700d2aab1c41
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  README.md                         |  3 ++
>  meta-arm-autonomy/README.md       | 51
> +++++++++++++++++++++++++++++++
>  meta-arm-autonomy/conf/layer.conf | 25 +++++++++++++++
>  3 files changed, 79 insertions(+)
>  create mode 100644 meta-arm-autonomy/README.md  create mode 100644
> meta-arm-autonomy/conf/layer.conf
>=20
> diff --git a/README.md b/README.md
> index 20b106a..04c641d 100644
> --- a/README.md
> +++ b/README.md
> @@ -16,6 +16,9 @@ meta-arm-iota:
>  meta-arm-toolchain:
>  	This layer provides support for Arm's GNU-A toolset releases
>=20
> +meta-arm-autonomy:
> +    This layer provides a reference stack for autonomous systems.
> +
>  Contributing
>  ------------
>  Currently, we only accept patches from the meta-arm mailing list.  For g=
eneral
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md new file mode 100644 index 0000000..f8a1404
> --- /dev/null
> +++ b/meta-arm-autonomy/README.md
> @@ -0,0 +1,51 @@
> +meta-arm-autonomy Yocto Layer
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +This layer provides an hypervisor based solution (currently based on
> +Xen) for autonomous system. It contains recipes and classes to build
> +host and guests systems.
> +
> +Dependencies
> +------------
> +This layer depends on several other Yocto layers:
> +* meta-openembedded (https://git.openembedded.org/meta-
> openembedded)
> +* poky (https://git.yoctoproject.org/poky)
> +* meta-virtualization
> +(https://git.yoctoproject.org/meta-virtualization)
> +
> +Distribution Features
> +---------------------
> +This layer is adding the following Yocto DISTRO_FEATURES:
> +
> +Bitbake variables
> +-----------------
> +Some recipes and classes in this layer are introducing variables which
> +can be modified by the user in local.conf.
> +Each recipe introducing such variables has a chapter "Bitbake
> +parameters" in its documentation.
> +
> +Those documentation files should be checked for variables:
> +
> +BSPs
> +----
> +This layer is adding the following machines:
> +
> +Images
> +------
> +This layer is adding the following images:
> +
> +Recipes and classes
> +-------------------
> +This layer is adding the following recipes and classes:
> +
> +Contributing
> +------------
> +This project has not put in place a process for contributions
> +currently. If you would like to contribute, please contact the
> +maintainers
> +
> +
> +Maintainer(s)
> +-------------
> +* Bertrand Marquis <bertrand.marquis@arm.com>
> +* Filipe Rinaldi <filipe.rinaldi@arm.com>
> diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-
> autonomy/conf/layer.conf
> new file mode 100644
> index 0000000..2dc24a2
> --- /dev/null
> +++ b/meta-arm-autonomy/conf/layer.conf
> @@ -0,0 +1,25 @@
> +# Add layer to BBPATH
> +BBPATH .=3D ":${LAYERDIR}"
> +
> +# Add recipes-* directories to BBFILES
> +BBFILES +=3D " \
> +    ${LAYERDIR}/recipes-*/*/*.bb \
> +    ${LAYERDIR}/recipes-*/*/*.bbappend \
> +    "
> +
> +BBFILE_COLLECTIONS +=3D "meta-arm-autonomy"
> +BBFILE_PATTERN_meta-arm-autonomy =3D "^${LAYERDIR}/"
> +BBFILE_PRIORITY_meta-arm-autonomy =3D "6"
> +LAYERDEPENDS_meta-arm-autonomy =3D " \
> +   core \
> +   yocto \
> +   openembedded-layer \
> +   virtualization-layer \
> +"
> +LAYERSERIES_COMPAT_meta-arm-autonomy =3D "zeus"
> +
> +# We don't activate virtualization feature from meta-virtualization as
> +it # brings in lots of stuff we don't need. We need to disable the
> +sanity check # otherwise the user will see a warning on each build.
> +SKIP_META_VIRT_SANITY_CHECK =3D "1"
> +
> --
> 2.17.1

