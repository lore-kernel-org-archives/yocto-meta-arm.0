Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web10.6090.1594299793875756144
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 06:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fUiEa6ol;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egEwWBEZt8OG1EawigUIhXP0Lq7FfozLpLqZ89IcQHw=;
 b=fUiEa6olnuQyK5/MEF0867cxjl+KSM+2/EUNNM929fsb8DVYRJiRLHk9Cd5hgbycPDBOEsplaXaz93oI9Y1NtSFBh6Vc7GCamC3OjO35DGWG6T8fP9XWMJeM5Z0K2jWAAU0mmHHtLCoDVYlYjemQV8Uymz0UUtf7tkJf3jRVx6c=
Received: from AM5PR0301CA0012.eurprd03.prod.outlook.com
 (2603:10a6:206:14::25) by AM7PR08MB5511.eurprd08.prod.outlook.com
 (2603:10a6:20b:10d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 9 Jul
 2020 13:03:12 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::66) by AM5PR0301CA0012.outlook.office365.com
 (2603:10a6:206:14::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend
 Transport; Thu, 9 Jul 2020 13:03:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 13:03:11 +0000
Received: ("Tessian outbound 1c27ecaec3d6:v62"); Thu, 09 Jul 2020 13:03:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 674a81eaa8289fbe
X-CR-MTA-TID: 64aa7808
Received: from a8ce95eb4bb2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FB0BDF9F-EBCA-4BA2-ABDE-FC828EF9AF72.1;
	Thu, 09 Jul 2020 13:03:06 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a8ce95eb4bb2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 09 Jul 2020 13:03:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYhOB0muRUGF2IIrAkPNxBtULfmlWUDWQyZXSCdcYIuhsgxUb4rrPIfQ/kYfMLPiYLvCSIZXQzndx79hNBnlvZXtnamqAWBOm64uX+3g1/x2iUqJImY6XIo9BVokGEt6CcevW5LDfAtCv7dWZJ90oWmDSpJJFtpvGg4lXu+r36N5FVq8h4+ZVwfOpTTEdQbXApszTq0R8zH8Ewdhq0QabnxcINmCccvzKATMoqPrfHWME0ENhXCDsV3pL4Z+CgAMZmm50I+sx5XEgo21f5DiZVXGzcTunwgcWC8AnB2V1TN5ObPU/gopMUHkO+39Ib4uEYfDxzp6jFsX0FNDaZo1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egEwWBEZt8OG1EawigUIhXP0Lq7FfozLpLqZ89IcQHw=;
 b=OWw8CI6P5v20QucIqICTkNoh9Sgxm5DRl7EWB3gEexY+9ahSsppaGLYeimH5Y5hNsrSSCTcWT+Mv8X8mXt/MXMoA0CXbV5Fo3hXYfHw58azbq8IpxnnwawgegyFrcu92HLt7RREP6UZjsINW2gdwK49EYjCxUTiFGQ/0bVl7/G629J/hIaIxPUWhCpx3hV10cBrxkJmZSzkc1fvsd9GLqhPU7EzhxdwzDpj/71EEIX/POx7qe4W3KkW3a/YcPrJ3fMJDUjY26dqSyC/42piPTUM3xqCFM+9QzxyYFaFZFVz8GWV02jSR8XFFhBBcftczbzpPw2L5Zravg5p4E+JC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egEwWBEZt8OG1EawigUIhXP0Lq7FfozLpLqZ89IcQHw=;
 b=fUiEa6olnuQyK5/MEF0867cxjl+KSM+2/EUNNM929fsb8DVYRJiRLHk9Cd5hgbycPDBOEsplaXaz93oI9Y1NtSFBh6Vc7GCamC3OjO35DGWG6T8fP9XWMJeM5Z0K2jWAAU0mmHHtLCoDVYlYjemQV8Uymz0UUtf7tkJf3jRVx6c=
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB4124.eurprd08.prod.outlook.com (2603:10a6:10:b0::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 13:03:05 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3153.030; Thu, 9 Jul 2020
 13:03:05 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: "jdmason@kudzu.us" <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [meta-arm] [PATCH] arm-bsp/grub: Add grub-efi support for N1SDP
Thread-Topic: [meta-arm] [PATCH] arm-bsp/grub: Add grub-efi support for N1SDP
Thread-Index: AQHWT7un/X0BIwbfhU6C9WKUb3RmKaj/QO0AgAAB6xE=
Date: Thu, 9 Jul 2020 13:03:05 +0000
Message-ID: 
 <DB8PR08MB496987B61FC45C9986A45FDDFA640@DB8PR08MB4969.eurprd08.prod.outlook.com>
References: 
 <20200701152349.16478-1-khasim.mohammed@arm.com>,<20200709125518.GD9023@kudzu.us>
In-Reply-To: <20200709125518.GD9023@kudzu.us>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c572f99-907b-4a2f-6dd3-08d824086f3d
x-ms-traffictypediagnostic: DB8PR08MB4124:|AM7PR08MB5511:
X-Microsoft-Antispam-PRVS: 
	<AM7PR08MB5511BFD22FFA12D89D059858FA640@AM7PR08MB5511.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Iv/HXdPAA5WAVjs05soupLdgQDcLl2+aTPTngex/QL+7DCQuYBGZg3vM+2tgxzRTWgsn4vZtLPUC7FHNCBNUKCIo+HMRnK20PED9MVd+wcagDvKUEqgFSXG23gzB0wVG3kychoPfeJ9rRbO5TPNBx4/GU8IG+QT3ljorHCyhTF1vdI5bhAHXWKcBzaSroavDQS5G3scaySWRv9SVWv+oVdz3AHSBhKpE4f+WY8aUPJ8xph7X//8Rl0QqApgl4/v0TTKEMx9nW4vv49oIcnwG7S1AmY69nfw1Gls0OdHYT9wAPK8zZcBdYVwLqNxSdBavEAqd+yPDtAB5qJkDsr9Qkj5y9e531jMF/gn9CssL29467AhsOenIT5K1Uwd4zaxe
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(71200400001)(86362001)(66556008)(83380400001)(76116006)(52536014)(66476007)(64756008)(66446008)(66946007)(6916009)(33656002)(5660300002)(2906002)(8676002)(4326008)(478600001)(55016002)(9686003)(26005)(186003)(53546011)(6506007)(7696005)(8936002)(316002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 92yryF1cnkMik/axr0yEJ2gUrQl5KE29Zv+USNF0P+YxbMPffddsSd79nNnB/Kppx5vhhRyc/0fRYRMB+VqRQ0XVUoKOIxFQ2Vc28dH7Mqkv2tYKlVtaziF5eOuyBve4Dwe1RRafmPB6IFemnHKWWZixwOrgQT0wYBiAOu5BuMarsZl1IJ83EL7vizMtI8ceb/LwGHSXOSkdUlgx4XcVszT1O48Pq2rSzakjVmABC9tn1cmPxBxcGpKYDgHtabFSrVxrHtyXdCQKyvvm5nyBaO3d0qksylL2WbNSfmLILqJpkgvuY7kDSBxbc+ddgsZjoZTs/xxSr0quVcBHd22OXk1qH7aOMZ3pSgXcB8Bj+aWdZHt/MOLd1uCMIlkcd7r87uyl2wgp6Z36M/l4VQ79zyrui+eCvosVoE5Ue0yfkAv57E4UqfUvpRARzkwFny/OcA6m7uz/ktymR88v5Sy9iJeqmLJ8UWDOiIWzq+Wu83G7tW2KLDA9hurhMqmNNkQV
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4124
Original-Authentication-Results: kudzu.us; dkim=none (message not signed)
 header.d=none;kudzu.us; dmarc=none action=none header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(70586007)(336012)(9686003)(8676002)(83380400001)(2906002)(478600001)(47076004)(33656002)(5660300002)(186003)(6506007)(86362001)(55016002)(356005)(82740400003)(70206006)(4326008)(7696005)(36906005)(316002)(8936002)(82310400002)(81166007)(26005)(6862004)(52536014)(32563001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8241c7bd-8c7b-4937-5e50-08d824086bae
X-Forefront-PRVS: 04599F3534
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sE/WydW+rgbAY4x+eSRZnvVuxH0DSoYIsogQZSCizSxgn7mMaMOdbA3ByJUvwgNOme9824EI9usBsdFgZcR8vDaju7B+X43kf1QuH14sQYFZKfHgmGo6TJ2LorY/ok58oqT2DyufIS1Mq0QYP2NTmTkURVkXdcOH2sMZLCyCU6KJqaqgndXAOuaccIng26u/IO5jLuhQ0Ro9x+1nvO21/vB+asb2nLxw3PkvR38l7eOLBOV4UTeeWisJl28jVKaw+Y5cuKvJO9kIa4hnMYb1rQoTvV3NqTZPbNgq+Uz9GuBSRhG71EISzF1I2tU2TUZqqOapsSneEdd9/38ib9quLdvvoC9ODMGgSsxlpyUoM0KcRUTlgK4OrRQJ1ipZooxY0eQ3fUsELNLmM1/Bl+xydqenqldVZ15wrH5KMkaMIBI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 13:03:11.6430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c572f99-907b-4a2f-6dd3-08d824086f3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5511
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Jon,


________________________________________
From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Jon Mason via lists.yoctoproject.org <jdmason=3Dkudzu.us@lists.yo=
ctoproject.org>
Sent: Thursday, July 9, 2020 6:25 PM
To: Khasim Mohammed
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/grub: Add grub-efi support for N1SD=
P

On Wed, Jul 01, 2020 at 08:53:49PM +0530, Khasim Mohammed wrote:
> grub-mkimage is used make a bootable image of GRUB,
> grub-efi dependency in added to conf file.
>
> Change-Id: Iaf08ed8b5e221003f10fceef9edffbe22b752534
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

> Applied to master.

Thanks.

Can you please consider applying this patch to Dunfell branch as well ?

Regards,
Khasim

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/mac=
hine/n1sdp.conf
> index 755bb09..92adb42 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -31,3 +31,6 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firm=
ware"
>
>  #UEFI EDK2 firmware
>  EXTRA_IMAGEDEPENDS +=3D "virtual/uefi-firmware"
> +
> +#grub-efi
> +EFI_PROVIDER ?=3D "grub-efi"
> --
> 2.17.1
>

>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
