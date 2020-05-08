Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.77])
 by mx.groups.io with SMTP id smtpd.web12.461.1588955874586312776
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 09:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dIwtj/Bf;
 spf=pass (domain: arm.com, ip: 40.107.2.77, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFqWXMHKtTc+XEsZvfvYMZvlG/NuWEyVHSTyytvRtag=;
 b=dIwtj/BfhxRcl/OLHgXeg1Vg8RJDPl/RGdA1lh2jqOwjEj4G3QS3NbEMq6s5AKClftf9o+RZ5HPxcxmbE/nzPiC1s5TRX6P/7N1jq46B+bZR3vVwKEftIObcGGFmzmtRn2ZhRClddU69fcsbhrRyUfDu1g3X3Rz+zKk+S423xeo=
Received: from AM6PR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::38) by VI1PR0801MB1902.eurprd08.prod.outlook.com
 (2603:10a6:800:88::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Fri, 8 May
 2020 16:37:51 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::d5) by AM6PR01CA0061.outlook.office365.com
 (2603:10a6:20b:e0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Fri, 8 May 2020 16:37:50 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 16:37:50 +0000
Received: ("Tessian outbound 4cdf5642225a:v54"); Fri, 08 May 2020 16:37:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 774e7373fda55de1
X-CR-MTA-TID: 64aa7808
Received: from 253a6a6a017d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2E8AA2A6-5053-419F-80B7-67D8F15F7A4D.1;
	Fri, 08 May 2020 16:37:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 253a6a6a017d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 16:37:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1sdw+l1YahHNzFROENU9i/xAeN8pRgx2kK9IrqMjcLDzqo9ZnZq0k3NBGHPOQ+5zHccbiYnXmdICeaw8cfnBbqvKcCUldSg8ZxVKCSouSnWchUmzSpzWgHhVymDfkwQqAyJiwqGS1ySzj1n5kN7nbHw9pD2gjba43DuS9HzsLcc7ZD6jBR1eB6wjhMtSgPBPajzK7fc8z2BtgsTQM9tq005y0ratYtvO2ULLIhd27ztJbKneQiSEJASdGB8eM87P2L+//wTGMuDdfO1cSzfYh+VnEdc/urYeBLg/jUSgwS1dHQHVv8kSIQz2qeBIyNoUxgFWa/p3jQ21a5CgFP6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFqWXMHKtTc+XEsZvfvYMZvlG/NuWEyVHSTyytvRtag=;
 b=M24DIEMRPL5peZZjqZqIdbtLKatI3QfILNSvND82xfW4Vgdfq9tppnsPOoh9DlmfnJr/AGcXtLkv8MzGAncQAz8SZKd9+sVzCn4YijZ7vuXLJX0neME7Tw3jzq+x5lY/fvYcWaT4B6TmJSKeoh1uanYJXTQdXV2q88gCA5tgA/PaCJ5hObuwTQ9XiPR5sQQYElp6VxwX+UAF/hEMlq4HzDP/stvSZOI1/sR3GIJJB9YehqcZktOQwx5NYBNWXpKAdPF9bgp+NPEN6wJDBHnUocRrpGia0LzYa/ZTZkDRbw+zKG5u81oZq6yTqcDA8IeXq86XFb4k0V/swyLBg+yf/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFqWXMHKtTc+XEsZvfvYMZvlG/NuWEyVHSTyytvRtag=;
 b=dIwtj/BfhxRcl/OLHgXeg1Vg8RJDPl/RGdA1lh2jqOwjEj4G3QS3NbEMq6s5AKClftf9o+RZ5HPxcxmbE/nzPiC1s5TRX6P/7N1jq46B+bZR3vVwKEftIObcGGFmzmtRn2ZhRClddU69fcsbhrRyUfDu1g3X3Rz+zKk+S423xeo=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3402.eurprd08.prod.outlook.com (2603:10a6:10:4f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.21; Fri, 8 May
 2020 16:37:43 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 16:37:43 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm-bsp: linux-linaro-arm-5.4: Fix kernel menuconfig task
Thread-Topic: [meta-arm] [PATCH 3/4] arm-bsp: linux-linaro-arm-5.4: Fix kernel
 menuconfig task
Thread-Index: AQHWJVaZjADxOFAq1USRlw/tPgb+hKieY1CA
Date: Fri, 8 May 2020 16:37:43 +0000
Message-ID: <B5D1D878-EA75-47FB-8625-318E7062ADC1@arm.com>
References: <20200508163403.5987-1-bertrand.marquis@arm.com>
 <160D1AC4BBA54991.28161@lists.yoctoproject.org>
In-Reply-To: <160D1AC4BBA54991.28161@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ac291abe-5b99-40d3-58cf-08d7f36e2602
x-ms-traffictypediagnostic: DB7PR08MB3402:|VI1PR0801MB1902:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1902825CBE5743BD6159E8E29DA20@VI1PR0801MB1902.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Y9pGunJXsGHCyKZsZCykioYUBQ4fi0cQ7EpYasYqPA+SmcDkHs9qBvAgKg75kU+bXNQbYZrk9BKZUCo5nrIrdY1xJ31Vgl2TsX9X8/fP6rMHOM++OAZYnaTWJ58rfn8CLSP+Y/IZuKhPNG0OwlHCwKCdzZcHO1bRRHgPSp6b8UlZO2FYQbk3uoZrp00ii25QScdafT+1Y95JDQJLsKvaVqo7VLQzszwmLs2JUntKzGdaL0hFcJe2uBXq39NdiygviapBsLVeRINXJnNCGQevnO5FMFE9WbDWHq7paa8MO4tOx4rSFLctG4yI37a3jvLPlmbbRh8N7lOofqDqMyYkdGxet/cZLPC8RUDfUDJNukIuyNn7apJclhRBJrcJLk3ICyqV8UmKZCegfw9ArdnP6o8g4tTQ6t0GbgsVJ8FCKvPxJkuKNzOGY37LceUZbO8+E4fgJEeBqNDcAF0BP4e2pVv7FKWZ7uojwElcOXHhfG4p3WliIZFIg40S2WrK9rbmkCn1n0hAx/s+u2nAUe4/9jdN3VHEOsufxzgJiNr7UcE3S9N+v7Gb4YbCo/6i7TWRu2fu9BLNMbf+oQFxBBd/szCgEZV6Jo51xzACA9bXcNN3xyAcF2osNaXZOe4cRekMHQe0fqURq3B8WMb9kJYk873lpt7Au9ZrmwXckE3XoAg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(33430700001)(36756003)(83320400001)(83300400001)(83290400001)(6916009)(83280400001)(33440700001)(83310400001)(316002)(6506007)(26005)(8936002)(4326008)(6512007)(71200400001)(186003)(8676002)(33656002)(2616005)(66556008)(966005)(6486002)(2906002)(66476007)(53546011)(64756008)(86362001)(91956017)(5660300002)(478600001)(66446008)(66946007)(76116006)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 mxhsz+ybHuXwP0N3pzWr4Wb8QtLjFLBldUdkmAQRhrgoZ40ezMhlXcZsu/lS7+p4Y4k+7gZgECw0dDhSsT7uK3be+mYCpGzqvALcmiMNB2hgTYU0WykQ6if8yG16l/tLYuFTCNJJnJaDo+LTr9GsRcLc8iQih2ClOfFaLaxACbzLA3egoDSdiVf+d9MrQMMyuxL0A+pvGx19aXNPkZjzgR5Z79IQbBKjf2091GXX8zHGE3ZNgnqnj+pRPFKq88Tx46TK8+o2SADXZQNvrKtcred3AfNOb056je9q578UOuQYJ3BDC8BpIpTzUW2jSE75m/DBKEsZqhgouKnpkV4LnBgcwRhc+DXjAvz3KJod8N9QIA6ic0Tbx0vOox68uVNE2KX6Ad6ppwp/RvEG0ke+tnwCydStyAFsMLbKcXRLp6EVOcdOyVV85+UP6OOxqV+6jbd7dFNY1JiLFwnQyjGAsVGa0P08OIpeZA/GhfhVqqs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3402
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966005)(33430700001)(2616005)(36906005)(86362001)(478600001)(33656002)(47076004)(70586007)(8676002)(336012)(70206006)(2906002)(8936002)(36756003)(6512007)(6486002)(53546011)(6506007)(4326008)(316002)(356005)(81166007)(26005)(186003)(6916009)(33440700001)(82310400002)(82740400003)(966005)(5660300002)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	675c946c-3ae9-40f5-f9ab-08d7f36e21e9
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KVvo5QHXe+grDkqoSR1oAlnhDFOpP5qd+fGdb+QcOYEunYoLafkf2XfyMUl+34MXz8PKIr1DCn+jKeBBD0Vw9xQtVe0MZcBCuskZSjlnuizkSu6hBdhpE/69gvstG+tEvOHQqwZdFym3HnmZ6Wze9tcsR49S1/UadNG96NKvbIKE/bF8DnpJJwIllpOZUX6W1n42sQMSAEXjzgpRv024JjarEZ55mPtUMqy4FQTT0Nb8HQUKgUovBf9TwZIAvxu9Sfm/9d85NYWdZ5ZrDD6vulBgM6Hs8biPuagy3lOw8p/629HUVkWSvirSmGi6RZV49hO2CW5g3Llo3N5hi44YgNNtbj1e9tsuGPgWVTdAWfWyqvjtSZtFm3+gDN64v2+SsFRYwgatGFnNJ1XTH/nmATva4v3bNEKcOV3TlUFev+BLCg5pTP5Ae6BprPZ32W3M/pIfQo2DllL2/aWEJuB0MHBvAPxhXRKxxEBU7AYO5pHHPfJi1+5Adu+AurQwxsYyMvb93ria+xTD1in7a7M1X9YnEi1Q8UwQ7BLTaxqpeEzRWM4XW61UYcjO3r00l6hWUHNpJxqkneeS8e9Ngcdu13khjY2Ii8Eddr6UbxYvhK8UZ9wbhcUAWSRc0i2pJuCnst+wLztDP7gt5TH3DhAHd188DSrvjMomU32EpDSmdlRW4hqNJ58Gi7yw+8vBsRLS5XlluvcnGxmxML2vkyd/Fw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 16:37:50.5065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac291abe-5b99-40d3-58cf-08d7f36e2602
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1902
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B97F7DAAADD35E4D82523203397A12D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 8 May 2020, at 17:34, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> From: Diego Sueiro <diego.sueiro@arm.com>
>=20
> When calling `bitbake virtual/kernel -c menuconfig` it fails if the
> ncurses-dev package is not installed on the host machine.
>=20
> This patch makes usage of the ncurses library built by yocto if it
> is present.
>=20
> Change-Id: I261578f2934b225956e77ca4038a2df5603cc1b1
> Issue-Id: SCM-888
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

> ---
> meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb b=
/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> index 56e0f15..cc68ed3 100644
> --- a/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> +++ b/meta-arm-bsp/recipes-kernel/linux/linux-linaro-arm_5.4.bb
> @@ -11,7 +11,9 @@ COMPATIBLE_MACHINE ?=3D ""
> # KBRANCH is set to n1sdp by default as there is no master branch on the=
 repository
> KBRANCH =3D "n1sdp"
>=20
> -SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/kernel-rele=
ase.git;branch=3D${KBRANCH};"
> +SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/kernel-rele=
ase.git;branch=3D${KBRANCH}; \
> +           file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncur=
ses-location.patch \
> +          "
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8=
814"
>=20
> SRCREV =3D "${AUTOREV}"
> --=20
> 2.17.1
>=20
>=20

