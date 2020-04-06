Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web12.12426.1586184707824896087
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=G2WdCGyI;
 spf=pass (domain: arm.com, ip: 40.107.8.54, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCEYQgxIlnLTf4GOhHQi8lCXbGlkQdF6NGRtdtbCZcc=;
 b=G2WdCGyIDy/0BcPAKcQvOL6Yfwwr8+Q3PBF3r84F62uVEjftqnYVD0PCCsbmSyOy4PlEmtJq3sfJIYYwiNSInHdY1mU/8n5dG0qLiEY8w9dsKpegX6KbMnwZJOm0XOu1JcFKTw4v1sswwPH97wpkSFhdGy3q/Xlq/9XigS6+gWA=
Received: from VI1PR0701CA0034.eurprd07.prod.outlook.com
 (2603:10a6:800:90::20) by AM6PR08MB4690.eurprd08.prod.outlook.com
 (2603:10a6:20b:cd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Mon, 6 Apr
 2020 14:51:44 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:800:90:cafe::37) by VI1PR0701CA0034.outlook.office365.com
 (2603:10a6:800:90::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.6 via Frontend
 Transport; Mon, 6 Apr 2020 14:51:44 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Mon, 6 Apr 2020 14:51:43 +0000
Received: ("Tessian outbound eadf07c3b4bb:v50"); Mon, 06 Apr 2020 14:51:43 +0000
X-CR-MTA-TID: 64aa7808
Received: from d72213c4947a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 19BCF0CA-2ED8-4DCA-8D4C-079A6043EB8A.1;
	Mon, 06 Apr 2020 14:51:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d72213c4947a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 06 Apr 2020 14:51:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Er9O9QSPPjl110PjPzSpJflNXeTQF3WQwQ8eeJe2HATHMJF6GevTlIXZ2J3VEkkIMhtCvPdynngDcVrAR/ao/+liDvDcHAbHFFlkK/EzvIMGa5zJgM6NYZAAc2bDKhcOsJUp6qJOhPW01u+x3qlK5d/1goHPHMJCCAlM4PW+zWfC0dXmamU04wbZH8TV0S4DPY43rxJZ1yqEfepENxaJ+lnzDM5pc7pPLQx5r4e+nFz1gUwe9TLpEtTrgEd8Qd0g5iiFkDH6wGf2KElioVJuSOYrWjcWndbJh0w93lBJtmTT+3jtEREsj/exQpzoYwNwAAmnANQKTr7nOrZ50HgasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCEYQgxIlnLTf4GOhHQi8lCXbGlkQdF6NGRtdtbCZcc=;
 b=Zq1LAJSgZpBur5vl+eDHfr+/yaQBtJPa96rtR78E1YVScEoJhJmw8KueflIY/mjLfhqVRteNcIFuDjG/smHcTaYTKSzZLxdWREFsXeqJHz0CHMqSsCwdfQJkH1czdpzo4XSoDKR8UPKnDC8LTd7hW+FuvbdiEntS7A69h22y/fjuxIEhlqAEDzgD3xjIm0rv7aLaxPJfM39JBL6fgRY/W7ckJnYJHyiXams6Xoix2ukT3V1MRGcDo6OkmNeKVbPSm4xAJHMazCrfYg8YD+eWUlTCJ/9JNKYOJgzPqyYtgxHx1OtOQ8fLaUJpi94MkHY45MY+IouttUO+BNSiAHVPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCEYQgxIlnLTf4GOhHQi8lCXbGlkQdF6NGRtdtbCZcc=;
 b=G2WdCGyIDy/0BcPAKcQvOL6Yfwwr8+Q3PBF3r84F62uVEjftqnYVD0PCCsbmSyOy4PlEmtJq3sfJIYYwiNSInHdY1mU/8n5dG0qLiEY8w9dsKpegX6KbMnwZJOm0XOu1JcFKTw4v1sswwPH97wpkSFhdGy3q/Xlq/9XigS6+gWA=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4451.eurprd08.prod.outlook.com (20.179.34.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Mon, 6 Apr 2020 14:51:37 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2878.018; Mon, 6 Apr 2020
 14:51:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH v2 0/7] arm-autonomy: Introduce Xenguest system
Thread-Topic: [meta-arm] [PATCH v2 0/7] arm-autonomy: Introduce Xenguest
 system
Thread-Index: AQHWCRFtNmLdk15ogkWCijAbYhMwGKhsMvvQ
Date: Mon, 6 Apr 2020 14:51:36 +0000
Message-ID: 
 <AM0PR08MB3987F064ED64AA37DDE0BDA392C20@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200402170816.8818-1-bertrand.marquis@arm.com>
In-Reply-To: <20200402170816.8818-1-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 3e580f6f-62d9-4a25-9145-d3fc56f12031.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 59fffab5-cda6-4c10-37e1-08d7da3a0606
x-ms-traffictypediagnostic: AM0PR08MB4451:|AM6PR08MB4690:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4690CD8A4250274A309A605392C20@AM6PR08MB4690.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0365C0E14B
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(33656002)(86362001)(186003)(4326008)(6916009)(26005)(498600001)(5660300002)(52536014)(66476007)(9686003)(6506007)(7696005)(66446008)(66556008)(76116006)(64756008)(66946007)(55016002)(8676002)(55236004)(53546011)(81166006)(81156014)(71200400001)(2906002)(8936002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hKkzyUvNuFoN5BQ0F9u9YAQXE2qheZTaKXWrA8P8xGNjHPu6oxnxmifCIodsocFRnQ2k3pNCSVwkYqHva4ckQfnc/z+TbkXDtE6aX4crwmRvuFlSw2f8rk/0kwLud0DFhXub9DO/mk0hlLXmrB6WX8ztisOWA2XO95pfZc/NyEK6gA53SfT7NJDnBFtJntum9FPwJObA02vW07IgQSDz6TrrImL3t8H0tV+rIk7Vk98ZJefuiGZKFuJQGlFtx/GVZCh1Ol0eF+WjgdU5iFwwwjoE1ri5OFuJZwnIfIMy8H1yl5oBFT91aPAI+2GwKKgGLdy6RCpoheajRmWbiP65RxEzk1fHGRei+ydXWMG+LS73LNBP/Yr7vgMtSHEjLhgI/AhPaZ/pw+LN6PcrJh5H5i5S+QNjZ/I0IOAXei+ypUdZ7EIICvPw0aEhBavExjB9
x-ms-exchange-antispam-messagedata: 
 1rjEZLlJoVqtvzKyLh4ckRBcIGwURna00QW7tvpaccmwljL5Dd2VqN5ci40RAIzXVrTP3sGJ/i3ukAIBx0vRj5TSRVxWamhlSlHpz+ci2GKdrCkU8vOgRT2C6Ed+IFKJrBJqMe0Xb1+4ZEBOevvW/g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4451
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(8936002)(7696005)(478600001)(86362001)(26826003)(5660300002)(52536014)(70206006)(2906002)(70586007)(336012)(6916009)(316002)(36906005)(82740400003)(81166006)(186003)(26005)(9686003)(55016002)(47076004)(4326008)(53546011)(6506007)(81156014)(33656002)(8676002)(356004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	75b266ab-41d1-4233-d27e-08d7da3a01c7
X-Forefront-PRVS: 0365C0E14B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MooP9rHxEM66+TOarooz33AC00hVpOAeu0zmRGMj62ki5KIXFVj0kWEXjBb/gN0qa7le1agIuH3hGCXIFLGdraqvugHoTllqadx7PUAwrygN79Actz1pDvJc54dohyHoAhBui+Ihx6d4KA8qhH2CM10Bitxw3XSqhqdra76cRYaFOpfwAvCVD572r0QWF0FmI5/Q5v+Sq9vvHYCvV/MT2JyNxrkMG6hYY6hNTHMj6/9q/hbeHdubWZIHIs8IsSL3fZpVOL3yz1UuWYzR043J701YZdcLXj9yG+yTgBmAZ2O35E22eOvUK0im8VTPPnmJvfL0usscgNj4uZPljTZ65OvZiEKIBU0fs7hKNm1CMGEOD/MYSDWn+3pxk4aLE0CMCa1ozm49pe8kVoDgSvuQnoAWA3YP8NdE/skFiNZ2f8YHsfvejDa2tOIJvLyYT8hExM3W5T/O2CqQOQzfwhte6cFbNtQeYnCc9rxga/5OGxdbWeOPhoVLQ+ZK2YymEKGGnJspZIX2+GfFfLsaRA+lsw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2020 14:51:43.9172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fffab5-cda6-4c10-37e1-08d7da3a0606
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via lists.yoctoproject.org
> Sent: 02 April 2020 18:08
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH v2 0/7] arm-autonomy: Introduce Xenguest
> system
>=20
> This patch serie is introducing the Xenguest system. It is introducing an=
 image
> format to store a complete xen Guest inside one image file.
> The serie is adding Yocto recipes to create such images when building a Y=
octo
> image.
> It is also providing tools to use such images in a Xen Dom0.
>=20
> Changes in v2:
> - fix error in disk add files in image-extra-class
> - fix several script errors in xenguest-mkimage
> - fix base-image handling of extended files
>

For the entire series:
Reviewed-By: Diego Sueiro <diego.sueiro@arm.com>

> Bertrand Marquis (7):
>   arm-autonomy: Create xenguest-mkimage
>   arm-autonomy: Create xenguest-manager
>   arm-autonomy: Create xenguest-image class
>   arm-autonomy: Create xenguest-base-image recipe
>   arm-autonomy: Create xenguest image type
>   arm-autonomy: Create xenguest-image-extra class
>   arm-autonomy: Create xenguest-nodisk-image recipe
>=20
>  meta-arm-autonomy/README.md                   |   7 +
>  .../classes/image_types_xenguest.bbclass      | 132 +++
>  .../classes/xenguest-image-extra.bbclass      | 102 +++
>  .../classes/xenguest-image.bbclass            | 187 +++++
>  .../distro/include/arm-autonomy-guest.inc     |   4 +
>  .../documentation/xenguest-manager.md         |  67 ++
>  .../documentation/xenguest-mkimage.md         | 119 +++
>  .../images/arm-autonomy-host-image-minimal.bb |   1 +
>  .../xenguest/files/xenguest-init              |  85 ++
>  .../xenguest/files/xenguest-manager           | 640 +++++++++++++++
>  .../xenguest/files/xenguest-mkimage           | 772 ++++++++++++++++++
>  .../xenguest/xenguest-base-image.bb           | 119 +++
>  .../xenguest/xenguest-manager.bb              |  52 ++
>  .../xenguest/xenguest-manager.bbappend        |   6 +
>  .../xenguest/xenguest-mkimage.bb              |  31 +
>  .../xenguest/xenguest-nodisk-image.bb         |  38 +
>  16 files changed, 2362 insertions(+)
>  create mode 100644 meta-arm-
> autonomy/classes/image_types_xenguest.bbclass
>  create mode 100644 meta-arm-autonomy/classes/xenguest-image-
> extra.bbclass
>  create mode 100644 meta-arm-autonomy/classes/xenguest-image.bbclass
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-
> manager.md
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-
> mkimage.md
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-init
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-manager
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-mkimage
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-base-image.bb
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-manager.bb
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-manager.bbappend
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-mkimage.bb
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-nodisk-image.bb
>=20
> --
> 2.17.1

