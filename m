Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.71])
 by mx.groups.io with SMTP id smtpd.web12.14371.1585322971031071181
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=uqR0Dqb0;
 spf=pass (domain: arm.com, ip: 40.107.1.71, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qbn8JfbTHnQNExm9f+gsU+WnmiCyqvswxZdlHKUDmo=;
 b=uqR0Dqb0wHCfi+pFmRRtXG3A6RhCedKt1nSB1I+IoSH8htNTLn2+sQspZRmsfkcfZfRGhXQEepCp3/yuu68TBv5MKi95kyqwHuoC2YRant0JKLOh6k/CDAkeNud/MApJ7t+SLycftZlKTQAAIEC55kaXkvIFDIrQFIVwuh+T0P4=
Received: from AM6P195CA0079.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::20)
 by AM6PR08MB4069.eurprd08.prod.outlook.com (2603:10a6:20b:af::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 15:29:28 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::fe) by AM6P195CA0079.outlook.office365.com
 (2603:10a6:209:86::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 15:29:28 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:29:27 +0000
Received: ("Tessian outbound 6835489d965f:v48"); Fri, 27 Mar 2020 15:29:27 +0000
X-CR-MTA-TID: 64aa7808
Received: from 0ca7b0337651.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9A3648D2-DB0F-46B3-8F59-A39ED3287DE2.1;
	Fri, 27 Mar 2020 15:29:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ca7b0337651.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:29:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHU4JiYzSx7La+p1waI6GN1tIxnBezKs3u7GlJNxAozdIos7pPU2pPNs9Rdcmf9Zv1Sog8pPQAr7OphdVQSKlOPS3n+KpF5uqIjG91agRrMQ1yrNtksx+9I4kUu/fgPlZg54361eY6QDzdfj3RgchonhifX76+SDk6SgJ7vUGbHdwVJN9obXGLZfgi3sF0CLOvl6qrfBLoJMwePSFeNfpdmUQkFgEJPUjOQo5X+hG4MyBwRNG7QTCeJmUlZpOKJPilcSZnHZ7l1E04deyTHxmh2Sil0ZmKoXcB9alF6t5hIlxpXxhrGc3LG9uvYmFBDExHZJ2WDNPtpdSohegrN+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qbn8JfbTHnQNExm9f+gsU+WnmiCyqvswxZdlHKUDmo=;
 b=LfI+8wL39nzDAMVN0P/+lSszdfGPQDqDQPT1xSL/elMBsRwjFz2BeYx6pUWf/QdyolQAye+4x4fdMbEAlU1ylU5MdoHzFTXKYh23RcDtjsnYpLLrk/XeR2Z2HwpuZhNuOQA1QnaIAV17cd8FbV8VGE7HzAoMxQJN9fso2PA3AaPQOHHUdlr8PP8leo+zDS+T9aOl7kKM8mt4hSEFAuj5p1kV1cayC6FOqXa060Sole3zxy4KD4g2R1waWqQjBkaYCv9YueagWhFI/CSAITOGNDV2TD9FoTtgCvyKbgUK1q4kzamVQLqIN4zJL/qF1Vk/hK6ic3Wqk9/6uor3C3RayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qbn8JfbTHnQNExm9f+gsU+WnmiCyqvswxZdlHKUDmo=;
 b=uqR0Dqb0wHCfi+pFmRRtXG3A6RhCedKt1nSB1I+IoSH8htNTLn2+sQspZRmsfkcfZfRGhXQEepCp3/yuu68TBv5MKi95kyqwHuoC2YRant0JKLOh6k/CDAkeNud/MApJ7t+SLycftZlKTQAAIEC55kaXkvIFDIrQFIVwuh+T0P4=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.215.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:29:22 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:29:22 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 7/7] arm-autonomy: Create xenguest-nodisk-image recipe
Thread-Topic: [meta-arm] [PATCH 7/7] arm-autonomy: Create
 xenguest-nodisk-image recipe
Thread-Index: AQHWBCXqwZWXJJnMqkqdwVf+3BWiZahckJBg
Date: Fri, 27 Mar 2020 15:29:22 +0000
Message-ID: 
 <AM0PR08MB39878AB5B4716D58F674E2E192CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
 <20200327105223.460-8-bertrand.marquis@arm.com>
In-Reply-To: <20200327105223.460-8-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 2f8e5537-ae2e-4ddf-a76d-49bb33846a86.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea94a6c7-c234-4070-a34c-08d7d263a363
x-ms-traffictypediagnostic: AM0PR08MB5393:|AM6PR08MB4069:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB40690C022C7F2D09D06DAD5A92CC0@AM6PR08MB4069.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(66476007)(55016002)(81166006)(52536014)(64756008)(9686003)(5660300002)(8676002)(2906002)(7696005)(66556008)(478600001)(81156014)(76116006)(26005)(55236004)(6916009)(66446008)(8936002)(4326008)(86362001)(186003)(71200400001)(316002)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tbvksmMSB/vNnHmRQSCiRpwd2jKgYNxISaeHLgf/UWzPixssvOuBhEtK/P+tKxTzBvjLwpoOpknjB6uwBr3H7+GK1SXg7SpccoswPSA1ZWGNicGSGyh1rU79URm+NXAq9jgUzKy6tw9IRUloCasAu3j3HHdXIAk7vcRxc1TFLcmX1X2G6zVv1aKjyROxHeOsdYLcFGI9F6dbUmanQ+aiyk/Cfn30O8jX2UrOn5elSWEUvIX6ViJGg4L6UrvhtYtzqplWYRTKmCbhUBt+829Nf2YUqK+9cbBBZ5dncxc/TlLUqUQYV4FBzaXNu2wrMbSEN2LTy6eoW61tBTe5jWdHVVNyAf40hIEapg8KC/urAHP9JTX00osbey9E9xLHptzQEBBdTsIdwG1VJ8CzA8Yg5ttWH3piRnO0sJKkRTtRdJ57ROFBR1aKwuCJAnqvcRL0
x-ms-exchange-antispam-messagedata: 
 IkdXrwu/+/ekUrrg1ZlsQ37nXBADo63n+eMiwWc7zmnPen1e5MgkvNy8zAX+1hCC0t7BNcsqRFlvLtQfbtIcYsJx5XjvaYVP7F2SdcoX1gpUcE4Xvfk9siSFuc+ZYnY+GpOonMSB59SsNQiZUd5/+A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(46966005)(33656002)(26005)(6916009)(8936002)(47076004)(6506007)(316002)(53546011)(356004)(82740400003)(86362001)(186003)(4326008)(336012)(9686003)(70586007)(52536014)(70206006)(36906005)(26826003)(55016002)(478600001)(2906002)(7696005)(5660300002)(8676002)(81156014)(81166006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5996991e-a6c7-409e-bc9a-08d7d2639fe6
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1D7FltziWUadlZ+/iyNS17q74UhQDTXR64UrF6/pQH44GmpyNFpejd+/vIUUT7xMOrUHMg032WtOOBtWLjZyl0n6/pus0h/NAY0zoSloWm8t0R4UZ4Ydj31Zep6MuAuK9muIAhfloVNxZC+pqKBMeT9gkV1E7vrS014UE4B8X8mcnDPce38o52BphA04ZT5bcZDJqDp/hKo1RuEgXOozPeoxHXN0nuSyVhRW+dDn2EptO8chIh1QKDWXB8aZpI3rv2Ow0lWdcl867zJEYiLsmOXygDUeHAZZOx9finLEWlsacPH5EyrUy6WLWk5ORZP+jIZKTmX5mJepjbfE4FtQA7BLMO0s/Qsz/HYFtSKdu9UBCjXHAaVGeXSbZj2QlFEXYaCrYXQIw21UHiIxqJtV37haFccgXcvdT+KV9IHxLCWGMghIVRCbz07Gl/u6M1P97nloOBC6cVoxd5Rk3m4mFHLyPinKGvYlnPVrrTY7GqwiC/rYrej4ePDAeR3AfcnMNwuntOBYnej/OIwD7XK67Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:29:27.9944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea94a6c7-c234-4070-a34c-08d7d263a363
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4069
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:52
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 7/7] arm-autonomy: Create xenguest-nodisk-
> image recipe
>=20
> Create a xenguest-nodisk-image recipe to be used when wanting to create a
> xenguest image without packing in it a root filesystem generated by Yocto=
.
> This recipe can be used to use aio root filesystem from an external tar f=
ile and
> just compile and take the linux kernel coming from Yocto.
>=20
> To achieve this, the variable XENGUEST_IMAGE_SRC_URI_DISK_FILES should
> be set to a SRC_URI compatible URL to the tar file and then call bitbake
> xenguest-nodisk-image.
>=20
> Change-Id: I1a8d80b89930f3bb6bcce40a55b4dfce9b5331ef
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../xenguest/xenguest-nodisk-image.bb         | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-nodisk-image.bb
>=20
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-
> image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> nodisk-image.bb
> new file mode 100644
> index 0000000..b2dbbe9
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-
> image.
> +++ bb
> @@ -0,0 +1,38 @@
> +# Create a xenguest image with kernel but no rootfs or an external
> +rootfs DESCRIPTION =3D "Xenguest No Disk Image"
> +LICENSE =3D "MIT"
> +
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b
> 4f302"
> +
> +S =3D "${WORKDIR}"
> +
> +inherit deploy xenguest-image
> +
> +# Name of the file we create in deploy
> +XENGUEST_IMAGE_NODISK_DEPLOY =3D "xenguest-nodisk-image.xenguest"
> +
> +# use a local copy to pack all together XENGUEST_IMAGE_DEPLOY_DIR =3D
> +"${WORKDIR}/tmp-xenguest"
> +
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +do_install[noexec] =3D "1"
> +
> +do_deploy() {
> +    xenguest_image_clone
> +
> +    # Add kernel to the image
> +    if [ -n "${XENGUEST_IMAGE_KERNEL}" ]; then
> +        call_xenguest_mkimage partial \
> +            --xen-kernel=3D${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_KERNEL}
> +    fi
> +
> +    # Pack and deploy the final image
> +    rm -f ${DEPLOYDIR}/${XENGUEST_IMAGE_NODISK_DEPLOY}
> +    call_xenguest_mkimage pack
> +${DEPLOYDIR}/${XENGUEST_IMAGE_NODISK_DEPLOY}
> +}
> +do_deploy[depends] +=3D "virtual/kernel:do_deploy"
> +do_deploy[depends] +=3D "xenguest-base-image:do_deploy"
> +
> +addtask deploy before do_build after do_install
> +
> --
> 2.17.1

