Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.88])
 by mx.groups.io with SMTP id smtpd.web11.14202.1585322837271270297
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hnj39CfC;
 spf=pass (domain: arm.com, ip: 40.107.3.88, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBt9gZo9YJlr9/ijszLOBh8E1QUMpHwVKrhb3bYjvXI=;
 b=hnj39CfCr8DgngaFhMa6nirxOiq24UFzgozUrDU2v7ZalBGNspt1p1Hqj47SW2sBnCaPqZ8MyWme98vAbtfQ5+fXziial6sKO2X+9APr3hNBKIe7OJKuxhc+zP1KPwlu1fHGZEvsHoQ5KvcG7ArvEDmG9M5oMaSuGQ2C24SV1+U=
Received: from AM7PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:20b:100::27)
 by AM6PR08MB3766.eurprd08.prod.outlook.com (2603:10a6:20b:83::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.18; Fri, 27 Mar
 2020 15:27:14 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::47) by AM7PR02CA0017.outlook.office365.com
 (2603:10a6:20b:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:27:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:27:14 +0000
Received: ("Tessian outbound 19f8d550f75c:v48"); Fri, 27 Mar 2020 15:27:14 +0000
X-CR-MTA-TID: 64aa7808
Received: from f861c9fe4f6b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D10313C4-F212-4BAC-B368-CF06C2482FFD.1;
	Fri, 27 Mar 2020 15:27:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f861c9fe4f6b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:27:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cafmKf5vECVpTDJMMeOAd0CshTQlp3tOIeK7Xjw8l5dLSwkPghaj+Nm6T6iZKk+TABFEtnwb1WzFM6HnZo5qc0HUsj1i9fugda20S4R5eCeI7gKR2WL0aBphD3smHOV9GIua1vXc9ziTkeGbtNKqIuxnzSdjZPVK97w8COTKI12J63/+7bYfkyXqrN+3j6ODVa2zTNQcABCSVD2g+t1bXT0xegX3owEXdsAfK2rHiD4TgSbiAG3JkpokvQjyiLNi4oOhSRSbH3iF87efsz8SZ5/JZBhqhzibs1fbk7cJCk888b2WrHBXYkLH5YMyACKTgpqyklroel7T5MrVs8Xjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBt9gZo9YJlr9/ijszLOBh8E1QUMpHwVKrhb3bYjvXI=;
 b=YpjoyWWefpywVZCv9L+JmDV0BEnha3qIOocne1Fxph3VMqb3dKnmb2tF7pFhWl5JWnZZfpsTyz9ZZQ2X8SKPQOuPJdhbjrPzECHY8Tyi2olhgdI9/wkKFmdAd59xRZNJ4psNCmcCSuvHrvYkSGCGqq0RbPImAfEYXlUgAMsqg6X5EElRMAIU+qHSmugpd6vn+wECQkLlZlzRwAtZApGPikkrcaaIWMCuAfozdLMZ4b4RfstPnAj3s9IlvD8bp9OL79iZsWGtxOJa4EkjuL8+7UjTr3ouXg4udPcW6NgQmn97Mh4VMjB6n/8/q6v39rxq6yiO2RB0HkAS01qokQ4MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBt9gZo9YJlr9/ijszLOBh8E1QUMpHwVKrhb3bYjvXI=;
 b=hnj39CfCr8DgngaFhMa6nirxOiq24UFzgozUrDU2v7ZalBGNspt1p1Hqj47SW2sBnCaPqZ8MyWme98vAbtfQ5+fXziial6sKO2X+9APr3hNBKIe7OJKuxhc+zP1KPwlu1fHGZEvsHoQ5KvcG7ArvEDmG9M5oMaSuGQ2C24SV1+U=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.215.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:27:08 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:27:07 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 2/7] arm-autonomy: Create xenguest-manager
Thread-Topic: [meta-arm] [PATCH 2/7] arm-autonomy: Create xenguest-manager
Thread-Index: AQHWBCXiTlFIHzIDmke681sr8joaX6hcj7Eg
Date: Fri, 27 Mar 2020 15:27:07 +0000
Message-ID: 
 <AM0PR08MB3987B749064CC4E209E5FC7192CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
 <20200327105223.460-3-bertrand.marquis@arm.com>
In-Reply-To: <20200327105223.460-3-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 2550a6b3-b369-4458-84a0-05d0f965094d.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af26a3e8-74a2-4d87-8eb0-08d7d26353c9
x-ms-traffictypediagnostic: AM0PR08MB5393:|AM6PR08MB3766:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3766B1DE39868A20EA4A7A1A92CC0@AM6PR08MB3766.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1169;OLM:1169;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(66476007)(55016002)(81166006)(52536014)(64756008)(9686003)(5660300002)(8676002)(2906002)(7696005)(66556008)(478600001)(81156014)(76116006)(26005)(30864003)(55236004)(6916009)(66446008)(8936002)(4326008)(86362001)(186003)(71200400001)(316002)(33656002)(6506007)(53546011)(559001)(579004);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tti8ctSres4NljDfiUhH2kBTCHBPR6pkB/YHDWzy0VGiW5TZtdhsC2xsfJbc1L1Cw4LPPLaIpUkBHwkYwSZ11bg1CaWpFW7k4eVW0q5fqhkwh6LCL2Wfh7B2scraKEB/l001+6Dsllh2rMK5ZLIBO/uaByIlsFuRphbSzq+1CxRwHO1DeAGWiQ+S3mp6mG/ytg7bFDOtfvbz9Upw/IuLYMEJtEqn46VOy1OaeAIoYv1jXatEc3jfrj1QGTIYPn9Wak6bHfo2WS44mCKfgGbr6eOIAVlb02jTP/tgyJRbIgxNP/xgkw9VQJIXBR7uvqV4FpILbVCRiMJTGka5zpRILtfX1ODd/F6X9X1Dy/ZtYVknra+v6f2GmzDtqR0Hjh9Zz/KyWCNMSj10gjaenTci+9vl3xuG1tM6HlZ961Rq8WOckSGDgobrgGK/9ctDkuhJsaB4vkSFrAw/IxEV3sTuAtDNp9ppj6rpnuBB180IQljRIErqhGrLlWf72pkrhvQUJqLBWn5av/Dxvxr94b2xwliI81iCFfJuGE6kDHtCXz/I5iyyQEv539DEn6U32s1Vi2+p4XEeIR4vR371DVWeVz1NA35JhP4JYwxmURe5H+oEyu2uwoLpEbflVrGv9y3GbHfoeKkBx0zEV2JmkLcl+w==
x-ms-exchange-antispam-messagedata: 
 ZwNi01pYyBdVKQUdU1RUrgVjLy0I1wqI77WkayMTPZ3/+UIf/do2arCLTwSjdqhNnG2OUwXA2HhOlKacse5BnYhs9CvActprdlzsVhkCy5JCf9p0nASsfi3q6y37S5aS5BmGvsG1xZ+hxsJlVTVwsA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(82740400003)(9686003)(478600001)(26826003)(53546011)(52536014)(7696005)(86362001)(336012)(4326008)(5660300002)(30864003)(70206006)(70586007)(36906005)(8936002)(55016002)(33656002)(2906002)(356004)(6506007)(186003)(8676002)(6916009)(26005)(81166006)(316002)(81156014)(47076004);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2cb2dff2-f0e5-457e-a61e-08d7d2634fde
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QWpFi0s38o8wYdAXaujdV4BzAtkDUNEXMmuMFXka81GBfc6KeciweqTJ6YT973ko4kg9b3JPQzCcNmvBJMiV7tNjKztEHTXW8I2d1X46VASSgfO3iQnaqKk2VlhBs7XAUsSNWI1mCrlMvrxAvnNgUyrvb92C5fw8Ko7aFBa8YgnWWYIcgFWgN5CMmMvlY+jmtE2mn8+UprYgZXpBNw4CArIFrGW4Mb3Fy23xIO7ITvOuOgP1rX4eZEgpZ1V0vrYL1blALgFZbmW8sk3MjRVpyFidtZGs49X6yjB+zzSGE2hSE+gn7miA3ygGXEnpbW3zEpQmkB8thSDwgE56W/gngcA0azK8+Cd+2qzBNK604ZkTTNdXJve2GTCGC86QNHJCWWSEgeIP3/qmLO9ETdhCnlZgf/OV75W8OdhmYITJ1sOnm4vikYB9WLKvkc70UhYjdj8LRJ6C9G8rt8WpejfA6mNXooVmiQ+dfS+CyKpitxEmLRVUU1N9JXvIwf9ecetv5b+FFVwg/Z5NQ6n29Ek//pvzFt99phrgWYXDkgAwPRozBsm1m0H+7ZCIOv3hrnTo05FnQlFCTDxiz3+ixjqbGGcpaE6yjdw2NyTQWItQQAQltgk4URnoJkTe7UtHIoSZARyW3iANrG0MNHUNJntgXznv8CYGnVHE++SNkzZ1h1huvzFYeIRfWuv0XSQTGfc4V6HiV3v7T7EpTxn1poZslA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:27:14.4106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af26a3e8-74a2-4d87-8eb0-08d7d26353c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3766
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:52
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 2/7] arm-autonomy: Create xenguest-manager
>=20
> Add xenguest-manager to handle xenguest image based guests:
> - create guest (use LVM to create disks for guests)
> - start/stop guests
> - provide init script to have guest auto started on boot
> - add documentation
>=20
> Change-Id: I5319ecb77f3aa9f8c1aff4891c05973288156f11
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                   |   4 +
>  .../documentation/xenguest-manager.md         |  67 ++
>  .../images/arm-autonomy-host-image-minimal.bb |   1 +
>  .../xenguest/files/xenguest-init              |  85 +++
>  .../xenguest/files/xenguest-manager           | 640 ++++++++++++++++++
>  .../xenguest/xenguest-manager.bb              |  52 ++
>  .../xenguest/xenguest-manager.bbappend        |   6 +
>  7 files changed, 855 insertions(+)
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-
> manager.md
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-init
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-manager
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-manager.bb
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-manager.bbappend
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index 560a783..93b5723 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -41,6 +41,7 @@ its documentation.
>=20
>  Those documentation files should be checked for variables:
>  - [xen-devicetree](documentation/xen-devicetree.md)
> +- [xenguest-manager](documentation/xenguest-manager.md)
>=20
>  BSPs
>  ----
> @@ -70,6 +71,9 @@ This layer is adding the following recipes and classes:
>  * [xenguest-mkimage](documentation/xenguest-mkimage.md): this is a tool
> to
>    create and modify images to be used as Xen guests.
>=20
> +* [xenguest-manager](documentation/xenguest-manager.md): this is a tool
> +to
> +  create/remove/start/stop xen guest generated using xenguest-mkimage.
> +
>  Contributing
>  ------------
>  This project has not put in place a process for contributions currently.=
 If you
> diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md
> b/meta-arm-autonomy/documentation/xenguest-manager.md
> new file mode 100644
> index 0000000..387af94
> --- /dev/null
> +++ b/meta-arm-autonomy/documentation/xenguest-manager.md
> @@ -0,0 +1,67 @@
> +Xenguest Manager
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +xenguest-manager is a tool to manage Xenguest images generated by
> +[xenguest-mkimage](xenguest-mkimage.md).
> +
> +On a Xen Dom0 system it will:
> +- create a xen guest from a xenguest image: extract its components,
> +create a
> +  disk for the guest using LVM volumes.
> +- start/stop a xen guest (during init or using xenguest-manager directly=
).
> +- check guest status
> +
> +xenguest-manager is composed of 2 shell scripts:
> +- xenguest-manager which can be used from command line to
> +start/stop/check guests and create or remove guest using xenguest images=
.
> +- xenguest-init which is called during init to automatically create and
> +start some guests as part of the host init process.
> +
> +Usage
> +-----
> +
> +xenguest-manager must be called like this:
> +`xenguest-manager OPERATION [OPTIONS]`
> +The following operations are available:
> +- create XENGUEST_IMAGE [GUESTNAME]: create a guest from a xenguest
> +image file
> +  as guest GUESTNAME. If GUESTNAME is not given the image file name is
> +used
> +  without the xenguest extension.
> +- remove GUESTNAME: remove the guest GUESTNAME.
> +- start GUESTNAME: start the guest GUESTNAME.
> +- stop GUESTNAME: stop the guest GUESTNAME (this is using `xl stop`
> +which is
> +  sending a stop signal to the running guest).
> +- kill GUESTNAME: force stopping the guest GUESTNAME.
> +- list: list the available guests.
> +- status [GUESTNAME]: print the current status of GUESTNAME. If
> +GUESTNAME is
> +  not given, print the status of all guests.
> +
> +For a detailed help on available options please use:
> +`xenguest-manager --help`
> +
> +Bitbake parameters
> +------------------
> +
> +Several parameters are available to configure the xenguest manager
> +during Yocto project compilation (those can be set in your project local=
.conf,
> for example).
> +
> +The following parameters are available:
> +
> +- XENGUEST_MANAGER_VOLUME_DEVICE: This is the device path used by
> the
> +  xenguest-manager on the device to create LVM disks when guests have a
> +disk
> +  configuration.
> +  This is set by default to "/dev/sda2".
> +
> +- XENGUEST_MANAGER_VOLUME_NAME: This is the LVM volume name that
> the
> +  xenguest-manager will create and use to create guest LVM disks.
> +  This is set by default to "vg-xen".
> +
> +- XENGUEST_MANAGER_GUEST_DIR: This is the directory on Dom0 where
> the
> +  xenguest-manager will look for xenguest images to create during init.
> +That's
> +  the place where xenguest images can be added to have them
> +automatically
> +  created during next Dom0 boot. The xenguests found there will only be
> +created
> +  if they were not already before (the basename of the files is used as
> +guest
> +  name).
> +  This is set by default to "/usr/share/guests".
> +
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
> image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-
> autonomy-host-image-minimal.bb
> index 5e09eac..ffe5bce 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> minimal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> mini
> +++ mal.bb
> @@ -16,6 +16,7 @@ IMAGE_INSTALL +=3D " \
>      kernel-modules \
>      xen-base \
>      qemu \
> +    xenguest-manager \
>      "
>=20
>  # Build xen-devicetree to produce a xen ready devicetree diff --git a/me=
ta-
> arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-
> autonomy/recipes-extended/xenguest/files/xenguest-init
> new file mode 100755
> index 0000000..9563d2f
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> @@ -0,0 +1,85 @@
> +#!/bin/bash
> +#
> +# xenguest Init Script to start and stop xenguests during boot #
> +
> +XENGUEST_CONF_BASE=3D"/etc/xenguest"
> +
> +if [ ! -f ${XENGUEST_CONF_BASE}/xenguest-manager.conf ]; then
> +    echo "No xenguest manager configuration !!"
> +    exit 1
> +fi
> +
> +source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
> +
> +# Create guest list
> +guestlist=3D$(/usr/bin/xenguest-manager list)
> +
> +# Unconfigured guests
> +
> +case "$1" in
> +  start)
> +        echo "Starting xenguest"
> +
> +        # Create unconfigured guests
> +        if [ -d ${XENGUEST_GUEST_DIR} ]; then
> +            for f in $(find ${XENGUEST_GUEST_DIR} -name "*.xenguest" \
> +                -exec basename {} .xenguest \;); do
> +                if [ ! -f ${XENGUEST_CONF_BASE}/guests/${f}/guest.cfg ];=
 then
> +                    # Check if this guest should be auto booted
> +                    autoboot=3D$(/usr/bin/xenguest-mkimage dump-paramsco=
nfig \
> +                        ${XENGUEST_GUEST_DIR}/${f}.xenguest | \
> +                        grep GUEST_AUTOBOOT | sed -e "s,.*=3D,," | tr -d=
 '"')
> +                    if [ "$autoboot" =3D "0" ]; then
> +                        echo "Do not create $f, autoboot disabled"
> +                    else
> +                        /usr/bin/xenguest-manager create \
> +                            ${XENGUEST_GUEST_DIR}/${f}.xenguest
> +                        # Update guestlist
> +                        if [ $? -eq 0 ]; then
> +                            guestlist=3D"${guestlist} ${f}"
> +                        fi
> +                    fi
> +                fi
> +            done
> +        fi
> +        if [ -n "${guestlist}" ]; then
> +            for f in ${guestlist}; do
> +                GUEST_AUTOBOOT=3D"1"
> +                if [ -f ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg ]; =
then
> +                    source ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg
> +                fi
> +                if [ "${GUEST_AUTOBOOT}" =3D "1" ]; then
> +                    /usr/bin/xenguest-manager start ${f}
> +                fi
> +            done
> +        else
> +            echo "No guest configured"
> +        fi
> +        ;;
> +  status)
> +        true
> +        ;;
> +  stop)
> +        echo "Stopping xenguest"
> +        for f in ${guestlist}; do
> +            /usr/bin/xenguest-manager stop ${f}
> +        done
> +        ;;
> +  reload)
> +        echo >&2 'Reload not available; use force-reload'; exit 1
> +        ;;
> +  force-reload|restart)
> +        echo "Restarting xenguest"
> +        $0 stop
> +        $0 start
> +        ;;
> +  *)
> +        # do not advertise unreasonable commands that there is no reason
> +        # to use with this device
> +        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
> +        exit 1
> +esac
> +
> +exit $?
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> manager
> new file mode 100755
> index 0000000..1daebc1
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> manager
> @@ -0,0 +1,640 @@
> +#!/bin/bash
> +# This script manages xenguest
> +#
> +set -u
> +this=3D"$0"
> +
> +XENGUEST_CONF_BASE=3D"/etc/xenguest"
> +LOGFILE=3D"/var/log/xenguest"
> +
> +if [ ! -f ${XENGUEST_CONF_BASE}/xenguest-manager.conf ]; then
> +    echo "Cannot find xenguest manager configuration"
> +    exit 1
> +fi
> +
> +# Following variables must be set in configuration:
> +# XENGUEST_VOLUME_DEVICE: device to use for lvm #
> XENGUEST_VOLUME_NAME:
> +lvm volume name to create on device source
> +${XENGUEST_CONF_BASE}/xenguest-manager.conf
> +
> +PREF=3D"xenguest:"
> +
> +if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
> +    ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
> +    echo "${PREF} Invalid volume device in configuration:
> ${XENGUEST_VOLUME_DEVICE:-}"
> +    exit 1
> +fi
> +
> +if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
> +    echo "${PREF} No volume name in configuration, using vg-xen..."
> +    XENGUEST_VOLUME_NAME=3D"vg-xen"
> +fi
> +
> +function usage() {
> +    cat <<EOF
> +Usage $this ACTION [OPTIONS]
> +
> +with ACTION being one of:
> + help
> +   Display this help
> +
> + create GUESTFILE [GUESTNAME]
> +   Create a guest using xenguest image GUESTFILE and name it GUESTNAME.
> +   This will extract and configure the guest and will also create the gu=
est
> +   disk if guest has one configured.
> +   GUESTNAME is set to the basename of GUESTFILE if unspecified.
> +   GUESTNAME guest must not exist
> +
> + remove GUESTNAME
> +   Remove GUESTNAME and destroy its disk (if it has one)
> +
> + start GUESTNAME
> +   Start guest GUESTNAME
> +
> + stop|shutdown GUESTNAME
> +   Stop guest GUESTNAME (send stop signal and let it shutdown normally)
> +
> + kill|destroy GUESTNAME
> +   Kill guest GUESTNAME (stop directly the guest without signaling it)
> +
> + list
> +   List configured guests
> +
> + status
> +   List guests and their current status (running or stopped) EOF }
> +
> +function xenguest_volume_init()
> +{
> +    pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
> +        echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
> +        pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            echo "${PREF} Error"
> +            exit 1
> +        fi
> +    fi
> +    vgs ${XENGUEST_VOLUME_NAME} > /dev/null 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Create ${XENGUEST_VOLUME_NAME} volume"
> +        echo "vgcreate ${XENGUEST_VOLUME_NAME}
> ${XENGUEST_VOLUME_DEVICE}" \
> +            >> ${LOGFILE} 2>&1
> +        vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE}
> \
> +            >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            echo "${PREF} Error"
> +            exit 1
> +        fi
> +    fi
> +}
> +
> +# Detach a disk we attached to xen
> +function xenguest_detach_disk()
> +{
> +    echo "xl block-detach 0 \$\(xl block-list 0 | " \
> +        "grep \"domain/0\" | awk '{print \$1}'\)" \
> +            >> ${LOGFILE} 2>&1
> +    xl block-detach 0 $(xl block-list 0 | \
> +        grep "domain/0" | awk '{print $1}') \
> +        >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Error detaching partition ${part}"
> +        exit 1
> +    fi
> +}
> +
> +function xenguest_disk_init()
> +{
> +    guestname=3D"$1"
> +    guestfile=3D"$2"
> +    devname=3D"/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
> +
> +    source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
> +
> +    if [ ${DISK_SIZE:-0} -eq 0 ]; then
> +        echo "${PREF} No disk for ${guestname}"
> +        return
> +    fi
> +
> +    echo "${PREF} Create ${guestname} disk"
> +
> +    # Init our volume
> +    xenguest_volume_init
> +
> +    echo "${PREF} Create hard drive for ${guestname}"
> +
> +
> +    # Remove volume if it already exist
> +    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE}
> 2>&1
> +    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
> +    if [ $? -eq 0 ]; then
> +        echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
> +        lvremove -y ${devname} >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            echo "${PREF} Error removing volume ${guestname}"
> +            exit 1
> +        fi
> +    fi
> +
> +    # Create volume
> +    echo "lvcreate -y -L ${DISK_SIZE}G -n ${guestname}
> ${XENGUEST_VOLUME_NAME}" \
> +        >> ${LOGFILE} 2>&1
> +    lvcreate -y -L ${DISK_SIZE}G -n ${guestname}
> ${XENGUEST_VOLUME_NAME} \
> +        >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Error creating volume ${guestname}"
> +        exit 1
> +    fi
> +
> +    # Add partition table
> +    echo "parted -s ${devname} mklabel msdos" >> ${LOGFILE} 2>&1
> +    parted -s ${devname} mklabel msdos >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Error creating partition table on ${guestname}"
> +        exit 1
> +    fi
> +
> +    # Setup disk name in xen configuration
> +    echo "xenguest-mkimage update
> ${XENGUEST_CONF_BASE}/guests/${guestname}" \
> +        "--xen-disk=3D${devname}" >> ${LOGFILE} 2>&1
> +    xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}
> \
> +        --xen-disk=3D${devname} >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Error setting disk in xen configuration"
> +        exit 1
> +    fi
> +
> +    # Create partitions
> +    partstart=3D"0"
> +
> +    # For each partition X the disk.cfg file should set a variable DISK_=
PARTX
> +    # with a : separated list defining the partition:
> +    # DISK_PART3=3D"4:ext4:disk.tgz" means that partition 3 should be 4G
> formated
> +    # with ext4 and initialized with the content of disk.tgz
> +    for part in $(seq 1 4); do
> +        eval partdesc=3D"\${DISK_PART${part}:-0}"
> +        size=3D$(echo ${partdesc} | sed -e "s/\(.*\):.*:.*/\1/")
> +        fstype=3D$(echo ${partdesc} | sed -e "s/.*:\(.*\):.*/\1/")
> +        content=3D$(echo ${partdesc} | sed -e "s/.*:.*:\(.*\)/\1/")
> +
> +        if [ "${size}" -ne 0 ]; then
> +            # Size is expressed in GB, pass it in MB
> +            size=3D$(expr ${size} \* 1024)
> +            partend=3D$(expr ${partstart} + ${size})
> +
> +            # Let first MB of disk free for partition table
> +            if [ ${partstart} -eq 0 ]; then
> +                partstart=3D"1"
> +            fi
> +
> +            # Create partition
> +            echo "parted -s ${devname} unit MB mkpart primary ${partstar=
t}" \
> +                "${partend}" >> ${LOGFILE} 2>&1
> +            parted -s ${devname} unit MB mkpart primary ${partstart} \
> +                ${partend} >> ${LOGFILE} 2>&1
> +            if [ $? -ne 0 ]; then
> +                echo "${PREF} Error adding partition ${part}"
> +                exit 1
> +            fi
> +
> +            # Set next partition start to current partition end
> +            partstart=3D"${partend}"
> +
> +            # Sync to see the created partition
> +            echo "sync" >> ${LOGFILE} 2>&1
> +            sync >> ${LOGFILE} 2>&1
> +
> +            # Prepare format command
> +            if [ -n "${fstype}" ]; then
> +                case ${fstype} in
> +                    vfat|ext2|ext3|ext4)
> +                        formatcmd=3D"mkfs.${fstype} -F"
> +                        ;;
> +                    swap)
> +                        formatcmd=3D"mkswap"
> +                        ;;
> +                    *)
> +                        echo "${PREF} partition ${part} of ${guestname}"=
 \
> +                            "fstype is invalid: ${fstype}"
> +                        exit 1
> +                        ;;
> +                esac
> +            else
> +                formatcmd=3D""
> +            fi
> +
> +            # Attach disk to xen
> +            echo "xl block-attach 0 phy:${devname} xvda w" >> ${LOGFILE}=
 2>&1
> +            xl block-attach 0 phy:${devname} xvda w >> ${LOGFILE} 2>&1
> +            if [ $? -ne 0 ]; then
> +                echo "${PREF} Error attaching partition ${part}"
> +                exit 1
> +            fi
> +
> +            # Sometimes it takes time to see the device
> +            if [ ! -b /dev/xvda${part} ]; then
> +                sleep 1
> +            fi
> +            if [ ! -b /dev/xvda${part} ]; then
> +                echo "${PREF} Partition ${part} creation error"
> +                xenguest_detach_disk
> +                exit 1
> +            fi
> +
> +            if [ -n "${formatcmd}" ]; then
> +                echo "${formatcmd} /dev/xvda${part}" >> ${LOGFILE} 2>&1
> +                ${formatcmd} /dev/xvda${part}
> +                if [ $? -ne 0 ]; then
> +                    echo "${PREF} Cannot create partition ${part} FS"
> +                    xenguest_detach_disk
> +                    exit 1
> +                fi
> +            fi
> +
> +            case ${content} in
> +                *.img)
> +                    # dd into partition
> +                    echo "xenguest-mkimage extract-disk-file ${guestfile=
} " \
> +                        "${content} | dd of=3D/dev/xvda${part} " >> ${LO=
GFILE} 2>&1
> +                    xenguest-mkimage extract-disk-file ${guestfile} ${co=
ntent} \
> +                        | dd of=3D/dev/xvda${part} >> ${LOGFILE} 2>&1
> +                    if [ $? -ne 0 ]; then
> +                        echo "${PREF} Cannot populate partition ${part}"
> +                        xenguest_detach_disk
> +                        exit 1
> +                    fi
> +                    ;;
> +                *.tar*)
> +                    tararg=3D""
> +                    case ${content} in
> +                        *.tar.gz)
> +                            tararg=3D"z"
> +                            ;;
> +                        *.tar.bz2)
> +                            tararg=3D"j"
> +                            ;;
> +                        *.tar.xz)
> +                            tararg=3D"J"
> +                            ;;
> +                        *.tar)
> +                            tararg=3D""
> +                            ;;
> +                        *)
> +                            # invalid/unknown tar type
> +                            echo "${PREF} Invalid file format in disk ${=
content}"
> +                            xenguest_detach_disk
> +                            exit 1
> +                            ;;
> +                    esac
> +
> +                    # must mount the partition and extract
> +                    mntdir=3D$(mktemp -d)
> +                    echo "mount /dev/xvda${part} ${mntdir}" >> ${LOGFILE=
} 2>&1
> +                    mount /dev/xvda${part} ${mntdir} >> ${LOGFILE} 2>&1
> +                    if [ $? -ne 0 ]; then
> +                        echo "${PREF} Cannot mount partition ${part}"
> +                        xenguest_detach_disk
> +                        rm -rf ${mntdir}
> +                        exit 1
> +                    fi
> +
> +                    # tar and unmount
> +                    echo "xenguest-mkimage extract-disk-file ${guestfile=
}" \
> +                        "${content} | tar -C ${mntdir} -x${tararg}f - " =
\
> +                            >> ${LOGFILE} 2>&1
> +                    xenguest-mkimage extract-disk-file ${guestfile} ${co=
ntent} \
> +                        | tar -C ${mntdir} -x${tararg}f - >> ${LOGFILE} =
2>&1
> +                    if [ $? -ne 0 ]; then
> +                        echo "${PREF} Cannot populate partition ${part}"
> +                        umount ${mntdir}
> +                        rm -rf ${mntdir}
> +                        xenguest_detach_disk
> +                        exit 1
> +                    fi
> +                    echo "umount ${mntdir}" >> ${LOGFILE} 2>&1
> +                    umount ${mntdir} >> ${LOGFILE} 2>&1
> +                    if [ $? -ne 0 ]; then
> +                        echo "${PREF} Error unmounting ${part}"
> +                        xenguest_detach_disk
> +                        rm -rf ${mntdir}
> +                        exit 1
> +                    fi
> +                    rm -rf ${mntdir}
> +                    ;;
> +                *)
> +                    #invalid content type
> +                    ;;
> +            esac
> +
> +            # Detach disk
> +            xenguest_detach_disk
> +        fi
> +    done
> +
> +}
> +
> +function xenguest_guest_create()
> +{
> +    guestfile=3D"$1"
> +    guestname=3D"$2"
> +
> +    # extract xenguest tar
> +    # put xen config in etc ?
> +    # if disk config file:
> +    #  disk init
> +    #  add partititions
> +
> +    echo "${PREF} Create ${guestname} using ${guestfile}"
> +    rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
> +    mkdir -p ${XENGUEST_CONF_BASE}/guests/${guestname}
> +
> +    echo "xenguest-mkimage extract-config ${guestfile}" \
> +        "${XENGUEST_CONF_BASE}/guests/${guestname}" >> ${LOGFILE} 2>&1
> +    xenguest-mkimage extract-config ${guestfile} \
> +        ${XENGUEST_CONF_BASE}/guests/${guestname} >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Error extracting guest image"
> +        exit 1
> +    fi
> +
> +    # Set guest name inside config
> +    echo "xenguest-mkimage update
> ${XENGUEST_CONF_BASE}/guests/${guestname}" \
> +        "--xen-name=3D${guestname}" >> ${LOGFILE} 2>&1
> +    xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}
> \
> +        --xen-name=3D${guestname} >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Error setting guest name"
> +        exit 1
> +    fi
> +
> +    xenguest_disk_init ${guestname} ${guestfile} }
> +
> +function xenguest_guest_remove()
> +{
> +    guestname=3D"$1"
> +    devname=3D"/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
> +
> +    # check if guest had a volume
> +    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE}
> 2>&1
> +    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
> +    if [ $? -eq 0 ]; then
> +        # Remove guest volume
> +        echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
> +        lvremove -y ${devname} >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            echo "${PREF} Error removing volume ${guestname}"
> +            exit 1
> +        fi
> +    fi
> +
> +    # remove guest files
> +    rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
> +}
> +
> +function xenguest_guest_start()
> +{
> +    guestname=3D"${1}"
> +    guestdir=3D${XENGUEST_CONF_BASE}/guests/${guestname}
> +
> +    # Get guest configuration
> +    source ${guestdir}/params.cfg
> +
> +    pushd ${guestdir} > /dev/null 2>&1
> +
> +    # create config by merging all configurations together
> +    cat guest.cfg $(find guest.d -type f 2> /dev/null) >
> + ${guestname}.cfg
> +
> +    # Build init script lists (ignore non existing dirs errors,
> +    # sort alphabetically and run global scripts first)
> +    init_pre=3D"$(find ${XENGUEST_CONF_BASE}/init.pre -type f 2> /dev/nu=
ll | \
> +            sort) $(find ${guestdir}/init.pre -type f 2> /dev/null | sor=
t)"
> +    init_d=3D"$(find ${XENGUEST_CONF_BASE}/init.d -type f 2> /dev/null |=
 \
> +            sort) $(find ${guestdir}/init.d -type f 2> /dev/null | sort)=
"
> +    init_post=3D"$(find ${XENGUEST_CONF_BASE}/init.post -type f 2> /dev/=
null |
> \
> +            sort) $(find ${guestdir}/init.post -type f 2> /dev/null | so=
rt)"
> +
> +    # call pre init scripts
> +    for f in ${init_pre}; do
> +        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
> +        $f ${guestname} >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            rm -f ${guestname}.cfg
> +            popd > /dev/null 2>&1
> +            echo "${PREF} Error during pre init script of ${guestname}"
> +            exit 1
> +        fi
> +    done
> +
> +    # Create non started guest
> +    echo "xl create -p ${guestname}.cfg" >> ${LOGFILE} 2>&1
> +    xl create -p ${guestname}.cfg >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        rm -f ${guestname}.cfg
> +        popd > /dev/null 2>&1
> +        echo "${PREF} Error starting ${guestname}"
> +        exit 1
> +    fi
> +
> +    # call init scripts
> +    for f in ${init_d}; do
> +        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
> +        $f ${guestname} >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            rm -f ${guestname}.cfg
> +            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> +            xl destroy ${guestname} >> ${LOGFILE} 2>&1
> +            popd > /dev/null 2>&1
> +            echo "${PREF} Error during init script of ${guestname}"
> +            exit 1
> +        fi
> +    done
> +
> +    # Start guest
> +    echo "xl unpause ${guestname}" >> ${LOGFILE} 2>&1
> +    xl unpause ${guestname} >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        rm -f ${guestname}.cfg
> +        popd > /dev/null 2>&1
> +        echo "${PREF} Error starting ${guestname}"
> +        exit 1
> +    fi
> +
> +    # call post init scripts
> +    for f in ${init_post}; do
> +        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
> +        $f ${guestname} >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            rm -f ${guestname}.cfg
> +            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> +            xl destroy ${guestname} >> ${LOGFILE} 2>&1
> +            popd > /dev/null 2>&1
> +            echo "${PREF} Error during post init script of ${guestname}"
> +            exit 1
> +        fi
> +    done
> +
> +    rm -f ${guestname}.cfg
> +    popd > /dev/null 2>&1
> +}
> +
> +function xenguest_guest_stop()
> +{
> +    guestname=3D"${1}"
> +    echo "xl shutdown ${guestname}" >> ${LOGFILE} 2>&1
> +    xl shutdown ${guestname} >> ${LOGFILE} 2>&1
> +    if [ $? -ne 0 ]; then
> +        echo "${PREF} Error stopping ${guestname}"
> +        exit 1
> +    fi
> +}
> +
> +function check_guest_arg()
> +{
> +    cmd=3D"${1}"
> +    guestname=3D"${2:-}"
> +    if [ -z "${guestname:-}" ]; then
> +        echo "${PREF} Usage ${this} ${cmd} GUESTNAME"
> +        exit 1
> +    fi
> +}
> +
> +function check_guest_exist()
> +{
> +    guestname=3D"${1}"
> +    if [ ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg -o \
> +        ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/params.cfg ]; the=
n
> +        echo "${PREF} Invalid guest name: ${guestname}"
> +        exit 1
> +    fi
> +}
> +
> +function check_guest_running()
> +{
> +    guestname=3D"${1}"
> +    running=3D$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" =
|| echo)
> +    if [ ! "${running}" =3D "${guestname}" ]; then
> +        echo "${PREF} Guest ${guestname} is not running"
> +        exit 1
> +    fi
> +}
> +
> +function check_guest_not_running()
> +{
> +    guestname=3D"${1}"
> +    running=3D$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" =
|| echo)
> +    if [ "${running}" =3D "${guestname}" ]; then
> +        echo "${PREF} Guest ${guestname} is running"
> +        exit 1
> +    fi
> +}
> +
> +cmd=3D"${1:-help}"
> +arg1=3D"${2:-}"
> +arg2=3D"${3:-}"
> +
> +case ${cmd} in
> +    help|--help|-h|-?)
> +        usage
> +        exit 0
> +        ;;
> +    create)
> +        guestfile=3D"${arg1}"
> +        guestname=3D"${arg2}"
> +        if [ -z "${guestfile}" -o ! -f "${guestfile}" ]; then
> +            echo "${PREF} Usage ${this} create XENGUEST_FILE [NAME]"
> +            exit 1
> +        fi
> +        if [ -z "${guestname}" ]; then
> +            guestname=3D$(basename ${guestfile} .xenguest)
> +        fi
> +
> +        if [ -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg ]; t=
hen
> +            # Guest already exist
> +            echo "${PREF} A guest ${guestname} already exist"
> +            exit 1
> +        fi
> +
> +        xenguest_guest_create ${guestfile} ${guestname}
> +        ;;
> +    remove)
> +        guestname=3D"${arg1:-}"
> +        check_guest_arg ${cmd} ${guestname}
> +        check_guest_exist ${guestname}
> +        # We need to stop the guest first
> +        running=3D$(xl list | awk 'NR > 1 {print $1}' | grep "${guestnam=
e}" \
> +            || echo)
> +        if [ "${running}" =3D "${guestname}" ]; then
> +            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> +            xl destroy ${guestname} >> ${LOGFILE} 2>&1
> +            if [ $? -ne 0 ]; then
> +                echo "${PREF} Error killing ${guestname}"
> +                exit 1
> +            fi
> +        fi
> +        xenguest_guest_remove ${guestname}
> +        ;;
> +    start)
> +        guestname=3D"${arg1:-}"
> +        check_guest_arg ${cmd} ${guestname}
> +        check_guest_exist ${guestname}
> +        check_guest_not_running ${guestname}
> +        xenguest_guest_start ${guestname}
> +        ;;
> +    stop|shutdown)
> +        guestname=3D"${arg1:-}"
> +        check_guest_arg ${cmd} ${guestname}
> +        check_guest_exist ${guestname}
> +        check_guest_running ${guestname}
> +        xenguest_guest_stop ${guestname}
> +        ;;
> +    kill|destroy)
> +        guestname=3D"${arg1:-}"
> +        check_guest_arg ${cmd} ${guestname}
> +        check_guest_exist ${guestname}
> +        check_guest_running ${guestname}
> +        echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> +        xl destroy ${guestname} >> ${LOGFILE} 2>&1
> +        if [ $? -ne 0 ]; then
> +            echo "${PREF} Error killing ${guestname}"
> +            exit 1
> +        fi
> +        ;;
> +    list)
> +        if [ -d ${XENGUEST_CONF_BASE}/guests ]; then
> +            for f in $(find ${XENGUEST_CONF_BASE}/guests -mindepth 1 \
> +                -maxdepth 1 -type d -exec basename {} \;); do
> +                if [ -f ${XENGUEST_CONF_BASE}/guests/$f/guest.cfg ]; the=
n
> +                    echo "$f"
> +                fi
> +            done
> +        fi
> +        ;;
> +    status)
> +        guestname=3D"${arg1}"
> +        if [ -n "${guestname}" ]; then
> +            check_guest_exist ${guestname}
> +            if xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" >=
 \
> +                /dev/null 2>&1; then
> +                echo "${guestname}: Running"
> +            else
> +                echo "${guestname}: Stopped"
> +            fi
> +        else
> +            guestlist=3D$($this list)
> +            if [ -n "${guestlist}" ]; then
> +                for f in ${guestlist}; do
> +                    $this status $f
> +                done
> +            fi
> +        fi
> +        ;;
> +    *)
> +        echo "${PREF} Invalid argument ${cmd}"
> +        exit 1
> +        ;;
> +esac
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> manager.bb
> new file mode 100644
> index 0000000..9affae9
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> @@ -0,0 +1,52 @@
> +# Xenguest manager recipe
> +#
> +# xenguest-manager is a tool to control xen guest (e.g. create, start,
> +stop) #
> +
> +DESCRIPTION =3D "Xen Guest Manager"
> +LICENSE =3D "MIT"
> +
> +SRC_URI =3D " \
> +    file://xenguest-manager \
> +    file://xenguest-init \
> +    "
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b
> 4f302"
> +
> +S =3D "${WORKDIR}"
> +
> +# Please refer to documentation/xenguest-manager.md for documentation
> +on those # parameters XENGUEST_MANAGER_VOLUME_DEVICE ?=3D
> "/dev/sda2"
> +XENGUEST_MANAGER_VOLUME_NAME ?=3D "vg-xen"
> +XENGUEST_MANAGER_GUEST_DIR ?=3D "${datadir}/guests/"
> +
> +# We add an init script to create and start guests automatically
> +INITSCRIPT_NAME =3D "xenguest"
> +INITSCRIPT_PARAMS =3D "defaults 90"
> +
> +inherit update-rc.d
> +
> +do_compile() {
> +    echo
> "XENGUEST_VOLUME_DEVICE=3D\"${XENGUEST_MANAGER_VOLUME_DEVICE}
> \"" > \
> +        xenguest-manager.conf
> +    echo
> "XENGUEST_VOLUME_NAME=3D\"${XENGUEST_MANAGER_VOLUME_NAME}\"
> " >> \
> +        xenguest-manager.conf
> +    echo
> "XENGUEST_GUEST_DIR=3D\"${XENGUEST_MANAGER_GUEST_DIR}\"" >> \
> +        xenguest-manager.conf
> +}
> +
> +do_install() {
> +    install -d -m 755 ${D}${bindir}
> +    install -m 755 xenguest-manager ${D}${bindir}/.
> +    install -d -m 755 ${D}${sysconfdir}/xenguest
> +    install -m 644 xenguest-manager.conf ${D}${sysconfdir}/xenguest/.
> +    install -d -m 755 ${D}${sysconfdir}/init.d
> +    install -m 755 xenguest-init ${D}${sysconfdir}/init.d/${INITSCRIPT_N=
AME}
> +    install -d -m 755 ${D}${XENGUEST_GUEST_DIR} }
> +
> +# Things that we need on the target
> +RDEPENDS_${PN} +=3D "bash tar xenguest-mkimage lvm2 xen-xl parted
> e2fsprogs"
> +
> +FILES_${PN} +=3D "${bindir}/xenguest-manager \
> +               ${sysconfdir}/xenguest"
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> manager.bbappend b/meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-manager.bbappend
> new file mode 100644
> index 0000000..874cfed
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> manager.bbapp
> +++ end
> @@ -0,0 +1,6 @@
> +# Board specific configuration for the manager
> +
> +# FVP and Foundation are using vda as hard drive and partition 2 is the
> +# default rootfs, so use vda3 for guest lvm
> +XENGUEST_MANAGER_VOLUME_DEVICE_foundation-armv8 ?=3D "/dev/vda3"
> +XENGUEST_MANAGER_VOLUME_DEVICE_fvp-base ?=3D "/dev/vda3"
> --
> 2.17.1

