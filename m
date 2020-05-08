Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.42])
 by mx.groups.io with SMTP id smtpd.web12.437.1588955819732877269
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 09:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7Rj6g/ff;
 spf=pass (domain: arm.com, ip: 40.107.5.42, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcOyxU8FIUKa7cSNug0UmVbM/HBoXFjJjs5lV8qJa3U=;
 b=7Rj6g/ffOHaIWD/CdBjv37ebvZsmpQk6UJknN8fn9DRtVNXb1Vsex/W5LcdMJi5b2aCQUxCsBYHWgkiuivEGRX8UdpRTfzTtHAJ43UeM/hfDh5PXv4Sc6DDbPXcTi9sLIvJ+oNaI9XaIA3AU9t2v49ikhzMQbp3kDRmwjKv9hlk=
Received: from MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::26)
 by VI1PR0801MB1694.eurprd08.prod.outlook.com (2603:10a6:800:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30; Fri, 8 May
 2020 16:36:57 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::c3) by MR2P264CA0086.outlook.office365.com
 (2603:10a6:500:32::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Fri, 8 May 2020 16:36:57 +0000
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
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 16:36:56 +0000
Received: ("Tessian outbound fb9de21a7e90:v54"); Fri, 08 May 2020 16:36:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 505299a9bdd21987
X-CR-MTA-TID: 64aa7808
Received: from 587a47a7dfaa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C5045D00-3C46-475E-B4DC-6C774EA0FD3E.1;
	Fri, 08 May 2020 16:36:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 587a47a7dfaa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 16:36:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HurkyGe3OHL5yG1Hyx9eRgGc5ao/vWnf+RAGX4AAdAtN7Z+fhZix6nTYgumqG1Z/AroBsKcZMnxM36FJDTWSEBMZf3uJFdRNCFRpihvcPsdL597Wy94f1rXnrENHamSj9igVGR+9033TtkJAILPi0G5oXk6U3ciSNl6QtKVfy4mHwJEtsQ9kzGykryEtJBNv0KWH/pvD+YgS5MMr4bbKg+kQJeKy5+zSnkMFcqNGrkkfw0UbRM88Mnd3EKprybh9d9rIMc7juaLkTcjZ0klxZCW4MaVlrNvikwm+tJrxCoumn0cLf7D7uKnMtQw/L4mo4nwFOBCOm3Q9elqmAUIxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcOyxU8FIUKa7cSNug0UmVbM/HBoXFjJjs5lV8qJa3U=;
 b=buHyJYg4TIGxcWUa+mPs8dDkFMMQRE0FUGr6KS6heJqNf6s4Cg2mhUFU9vj88mynln70gezwt7cnh6Bgjhc4R4xbVIwX1k05JK93fKNdr9syH+1umEshhqj8Me0mJ3LFsEOrYTyTRWIZU/y5BkoXNnAAQkHb+jygL1Ke4WsYAnQWkUrDv7qk+a+OVDyjU3N8Inrto6UIIMZB1D6Px1FJh9iQJ3ype1kCjq3De0QYGDX9FzPSTwV9oKDkAWBXkfOaCoER8XBR+unTKOrSXWz8mhLsyCho8KduUvDZb7hPraW6pG2sBiM8J+1AnQnjYrijYW3GyZShbrhAznM1G4E1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcOyxU8FIUKa7cSNug0UmVbM/HBoXFjJjs5lV8qJa3U=;
 b=7Rj6g/ffOHaIWD/CdBjv37ebvZsmpQk6UJknN8fn9DRtVNXb1Vsex/W5LcdMJi5b2aCQUxCsBYHWgkiuivEGRX8UdpRTfzTtHAJ43UeM/hfDh5PXv4Sc6DDbPXcTi9sLIvJ+oNaI9XaIA3AU9t2v49ikhzMQbp3kDRmwjKv9hlk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3402.eurprd08.prod.outlook.com (2603:10a6:10:4f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Fri, 8 May
 2020 16:36:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 16:36:49 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 4/4] arm-bsp: n1sdp: Add Linux kernel device-tree support
Thread-Topic: [meta-arm] [PATCH 4/4] arm-bsp: n1sdp: Add Linux kernel
 device-tree support
Thread-Index: AQHWJVaf8PhYeDTBekmH0etkXMjcXqieYw8A
Date: Fri, 8 May 2020 16:36:49 +0000
Message-ID: <BC233572-BC78-4904-9390-63DDB4682470@arm.com>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
 <160D1AC4E6B1905A.5849@lists.yoctoproject.org>
In-Reply-To: <160D1AC4E6B1905A.5849@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c5c4b59c-41e6-4ed3-9d1b-08d7f36e05dc
x-ms-traffictypediagnostic: DB7PR08MB3402:|VI1PR0801MB1694:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1694612A2BB9731479583FE39DA20@VI1PR0801MB1694.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:343;OLM:343;
x-forefront-prvs: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lJLnk7fBWlYhaorkMq4OQ4j0jlCVxicI5PD6BYiWmM1YM1my76oUWo6nm6KPx2fJVQ3U2cPZF03O89i+aBk4x3vyr/HhF/O3g2zez/RgB4IN8wW13Qiugs+HjrLmFfsRUsgJs9ueR/Gif7IuNE0teGCsxGoC+vOZKyB8Knze2soM4OcOx7UkSXRfiy6DBI1T9vBkmUs878RLf5hejhhFPgafnpaOlyy1Rb1S64dl9z2d9pKiimUiK/z/Lq5WrnLheOB8jY/E+O/vNdbzNOTDpUGkrfLn4iSrVCfdk1xraiJMAvattyy2NQvoJOlRaDzzfosi5SeCLW2brOi+QaQZQnvmh74BvZiVHjo3QQAda3gb/93nXYhKhH8Zl5Zt6RVsAIRrD3i0GXUojJL6aZTkZgJ8VHww6RSPVbi4rofyQx5TEHV8LMkCZf1CvGZzaNHN7mi0gobNxxvj/AyIrLaOpq3r1XEjFE9pqkDDCJ5iYH3mERb1XxXq2tQ7DCVU7+pwaVdWTRuQiwhcC1sQoZRI+y29/aJ8ocKWG4mJ6ektnzWbmm5Mty2NIYj1iqqp2F0NQ+2r/E8ZcJeSPAdqzfDxFj7SrkwM+sIJ/6TCtShqnf4jksKQZKmP6WlpnKh/Nn6U
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(33430700001)(36756003)(83320400001)(83300400001)(83290400001)(6916009)(83280400001)(33440700001)(83310400001)(316002)(6506007)(26005)(8936002)(4326008)(6512007)(71200400001)(186003)(8676002)(33656002)(2616005)(66556008)(966005)(6486002)(2906002)(66476007)(53546011)(64756008)(86362001)(91956017)(5660300002)(478600001)(66446008)(66946007)(76116006)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 7ly9PO3hG1iEdyGQwGdASawlt1Oq2Ptyaj47VtM4vcK8nFNO0aTdyEN0yGC5KzeiBX+KUrBghAjWILAGstsx4WbhzScQ3Yo3d1kV4Qxk68R4WwlvNlf64jxc4dAz7sImk+GgSlgdThbbr1VdSqQhgXsiG7Cz1NSRgwA4wqCJ8f9QqGMwp9KdRCmP4aCqIOXwNErYHUxR3Fr7lvBo8l5JQmIVrtwuMpYtL/CyM2NbHUn2+EEQnqRDIY6ptDm0e5xTBq2q8hWpBP5UDWVYzCJGEyKTmla0gBuvhPUOTzQ5AMoYODJ/q49cNf7dDhw11DxdH9O/jJM96O3ADz6IgfITJqPEiQlP4yzd4WfQPfgtqOGxJpobFbdpTROBwxZ46x37RF0Iei3bh5vESP+PaG6j7TJBlQgbV5Uw7jOCeWeG0hSxGOMdKoRWRyx1sSYt+B0znOa3DMXbp+feKV8s19RDi4umI2HZIjc6ZOMsENjYqLMEt8u2JEN1ZDtPNIP6MrBz
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3402
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(33430700001)(356005)(2616005)(966005)(70206006)(8676002)(8936002)(70586007)(33440700001)(478600001)(47076004)(5660300002)(6486002)(316002)(36906005)(82740400003)(82310400002)(4326008)(186003)(86362001)(6512007)(336012)(6916009)(81166007)(6506007)(53546011)(36756003)(26005)(33656002)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac482972-436b-4701-0c4e-08d7f36e01c8
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oMlmxB6KGApuuSE0EIOx2sEd9cGP6w+X6vg0eAXZWF9s3JZU4LA4TA9A2KBDGde/fD9O5nzP/HD4vrG11IliDWdSLXKeMTqW8VvfNZtJ0IrX0UgVE5fk8vjuYTEA0Z4c6+noA+aOqPivSPDnx1PrtoYJQ+Li7gWFuFnes0Y618lKKuLQJPHfSQaGhhjoTNgFwFS9Rl6EKdsSsLC2/T6Wg9laxIEwf3G2s8rLhiVqmYZxEOoYMiOO7X0WNP7fCMBSegN/vPqoyTJ1gvWkEq6MEp2PB2MMV3DSFG0gqW6lug0y1wSP2Ob1xFEfrXNtddgP0OtKjcYvdX8h1AH6EEo4siZtC8XMcKUBnc4l6TL+v65g2j2QoWCRI1BFXCWPVIZREOBup2m/slcyGo2inP5y0uw/Pu2p91lRnuxOYAMsEc+RWHInT7Qkc0MqOuCHqSfCUGqj3OXJaX/opnBqqrFvMenf+KiPzAyzDLCdDMCg12V57XFTiw8h9FGXzEe2zP1W+s+y9AmYUKI1hmoI5Yjz/f/Y64c4tQ+yHoJOtWQ7tiCUml4Uv1eEN3YJmgdQZviQZLzXms2131Dh2Fhw4ORQPJrO3skMtYNl8BlsvkTq9eRgBjTvkLdxOgefOAYxf/cP7Yx+YE6RRLXikBmGShuqkfZy1KJj7f0vCSgLE+6c8CI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 16:36:56.5511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c4b59c-41e6-4ed3-9d1b-08d7f36e05dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1694
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <184B0C3F9AAF594684F6A9234D1C9DAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 8 May 2020, at 17:34, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Diego Sueiro <diego.sueiro@arm.com>
>=20
> Update both machine configuration and kernel recipe to
> support Linux Kernel device-tree compilation.
>=20
> Change-Id: I01fa654bd88e0d2b7a4bfcc7cb60222c120a0473
> Issue-Id: SCM-888
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-bsp/conf/machine/n1sdp.conf                            | 1 +
> meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend | 2 ++
> 2 files changed, 3 insertions(+)
>=20
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/ma=
chine/n1sdp.conf
> index fbe135c..b19fb86 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -9,6 +9,7 @@ TUNE_FEATURES =3D "aarch64"
> require conf/machine/include/arm/arch-armv8a.inc
>=20
> KERNEL_IMAGETYPE =3D "Image"
> +KERNEL_DEVICETREE =3D "n1sdp/n1sdp.dtb"
>=20
> IMAGE_FSTYPES +=3D "tar.bz2 ext4"
>=20
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbap=
pend b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> index e2ba6ae..9634d43 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bbappend
> @@ -6,6 +6,7 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
>=20
> # Apply N1SDP specific patches
> SRC_URI_append_n1sdp =3D " \
> +    git://git.linaro.org/landing-teams/working/arm/device-tree.git;name=
=
=3Ddts;nobranch=3D1;destsuffix=3Dgit/arch/arm64/boot/dts \
>     file://0001-TMP-iommu-arm-smmu-v3-Ignore-IOPF-capabilities.patch \
>     file://0002-pci_quirk-add-acs-override-for-PCI-devices.patch \
>     file://0003-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch=
 \
> @@ -14,6 +15,7 @@ SRC_URI_append_n1sdp =3D " \
>=20
> # Referring to commit TAG N1SDP-2020.03.26
> SRCREV_n1sdp  =3D "137cccb0843e63b031acf67d1ca4f6447b8c417c"
> +SRCREV_dts_n1sdp =3D "3209a868152f348194cc1f20fd87c759d3a97d45"
>=20
> # Use intree defconfig
> KBUILD_DEFCONFIG_n1sdp =3D "defconfig"
> --=20
> 2.17.1
>=20
>=20

