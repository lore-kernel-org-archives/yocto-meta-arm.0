Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web10.14468.1585323078628056907
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6fvxgyw/;
 spf=pass (domain: arm.com, ip: 40.107.7.42, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxMoLXcs3PR3GvQvHfqRkVFpn5xwai2dYRhXBiYqc8A=;
 b=6fvxgyw/uYJsxSJsbtzVIhKHYu7QwMQzStM1ZRXwBhoGaIcDNNjFONb9vyguQl8x74JqII/gL7RvF5UZMmfzJ7eYkTXisovrKxy1EcOaOlkzMb6Qwt2eO0KmQ5daZkqv6+vbbXaura6+eTO+E7zZ60dNtbLZm+JTo3CGA9X64QE=
Received: from AM0PR02CA0057.eurprd02.prod.outlook.com (2603:10a6:208:d2::34)
 by AM0PR08MB5460.eurprd08.prod.outlook.com (2603:10a6:208:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Fri, 27 Mar
 2020 15:31:12 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:d2:cafe::c0) by AM0PR02CA0057.outlook.office365.com
 (2603:10a6:208:d2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.21 via Frontend
 Transport; Fri, 27 Mar 2020 15:31:12 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:31:12 +0000
Received: ("Tessian outbound e13acb17570e:v48"); Fri, 27 Mar 2020 15:31:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from c3077901defc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7791AACD-85D3-4528-960A-146B7A26102E.1;
	Fri, 27 Mar 2020 15:31:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3077901defc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZjGIsU+w+P56x+h5zyy7HGfRcN/sj9C2fRM6pQ2Q8yT595S/5uzxVJ2i40TJ68s8w6+W/MTsYzZNweO3l/rBt2WjXC3Lq0vVTSmUY3qhSSeSgSz0SWEnIYzoo122AfRHINIASeOHDOc4OHJu3Vf7Y14iXf3LO4wBXuc2AUI0ieH4UvVHSvdv3L6z+J4PcUKy7hbWPhLYkezlbL+XKKcdwmk5DcTHTZ16co2VqVgsBOvxG2dQ7rT917TlSNCKyQ6+HEJwi1wqPXG52BrfdCzZNAzJX6axwFOOrc5CnTAwpnRceqQV1hfTAVmKE4BBZIfYBq9XAIZ7Leg6bJmMTZT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxMoLXcs3PR3GvQvHfqRkVFpn5xwai2dYRhXBiYqc8A=;
 b=Fhf2kQp2/QwlJQXHP1OcGPDYj4CULjQffMd04j3rrWfNGFN6/EGwOgPOhlyzBpGCq4oB/7aNmQQyxXzC8r7x903Q+SCP5CRvNtqoCDYACTQxrEyw7N4tTrDDSXeyz8na4zPr+QqEGk/yVqTSmaUV0AhnKEd8jIXfcaf4d0NO0NEvuSAZs/5rfKcXuye04QBaLTf9c2u6qN3vbqstlLvTm6HTNQ3A14Ga31HajuWBLgy/FK0rl90/emVaBmMIFR1rqjy1beDSwXRuk0rF5yNiuG8AHxmhV0ux8jYi4xo+p3vznybFLfusHUlFmmgJ6ZH6ph3DuX26kkkOfBXkEX6xRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxMoLXcs3PR3GvQvHfqRkVFpn5xwai2dYRhXBiYqc8A=;
 b=6fvxgyw/uYJsxSJsbtzVIhKHYu7QwMQzStM1ZRXwBhoGaIcDNNjFONb9vyguQl8x74JqII/gL7RvF5UZMmfzJ7eYkTXisovrKxy1EcOaOlkzMb6Qwt2eO0KmQ5daZkqv6+vbbXaura6+eTO+E7zZ60dNtbLZm+JTo3CGA9X64QE=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB5393.eurprd08.prod.outlook.com (52.132.215.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Fri, 27 Mar 2020 15:31:06 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:31:06 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy: Update quick start guide
Thread-Topic: [meta-arm] [PATCH] arm-autonomy: Update quick start guide
Thread-Index: AQHWBCZCIO9ThVi570aV062ADr7BY6hckRlg
Date: Fri, 27 Mar 2020 15:31:06 +0000
Message-ID: 
 <AM0PR08MB39878819F297E3FC3BF70E6592CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105513.618-1-bertrand.marquis@arm.com>
In-Reply-To: <20200327105513.618-1-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: a23093cc-aef5-4319-9f86-cd025e7e7baa.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f541fc2f-af46-4173-a61f-08d7d263e181
x-ms-traffictypediagnostic: AM0PR08MB5393:|AM0PR08MB5460:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB546075AE2A5709F07D33011692CC0@AM0PR08MB5460.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(66476007)(55016002)(81166006)(52536014)(64756008)(9686003)(5660300002)(8676002)(2906002)(7696005)(66556008)(478600001)(81156014)(76116006)(26005)(55236004)(6916009)(66446008)(8936002)(4326008)(86362001)(186003)(15650500001)(71200400001)(316002)(33656002)(6506007)(53546011);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RItBANt34HLff+i7c7bXokwYkpFqLmsnrFrpFDw5Z3wSFjKqAJctd6cl5Pw1yQmS9FHe4xMVFQ3HawwO5kUoKoYwTqSwJAVAK1Hg/a+TSFF6Ix/h8c4TRJzMUI5TVKL9eTo+ukwv51hz05VfdycV2JlvHdxhqlw8hRb/VnIamppySNUylYgJGxfCsy/Ean0ntYRbsCxDxYD/hbyHKRkBVDzb7BjzTtzg8L9hY6Enk1woGQyOSijzNOTF0BIkO3917VHidT9B9reX6byJ6MFPjKP/cL3Dp5d1VsYN7KuuB7P3GMFph2vA+VYJkG6vWq0pUt/1HQipZc4Ie9pENlqsksHmpHcohaUcphaGTCPBxiMIGA2y8nLNMwEGwSKtRFLuXtq8sqGIMOGviNKDqwxlal2zdsJ/TpCjoetJ4dXH/SSxrU7Zx6DEhl6m8m2szi74
x-ms-exchange-antispam-messagedata: 
 XV72Yz7CWKAYDSZoIycOqYqcIjBWZKF7gBse8JilnOi5G0YZaIgtSA8rJppiaY7LCOOXq+xzlN2DAfB6OlwFOrVc5UXwzZ6wHSK6j6oxTIAHB/ll4/IRA2HGWQp4elWq+PSu4LbBXorGRHdLuw/v5w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(5660300002)(81156014)(81166006)(186003)(86362001)(6916009)(82740400003)(26826003)(26005)(4326008)(2906002)(47076004)(53546011)(6506007)(36906005)(8676002)(478600001)(70206006)(15650500001)(7696005)(70586007)(316002)(52536014)(33656002)(356004)(9686003)(8936002)(55016002)(336012);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b79c8734-f340-450b-f4c9-08d7d263dde0
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CjirUevU4o/iHMIzSEy58nOvU9d1DYvvlcbULr2Iq1jbRHA0VTjoidzWnuDYCPFdsWuZKziwlAZNTlGMJ5H/c0t2Q97PQxrtXFm6meUM2nLhCrrHAWXQwLDubH71NA5xQmQQMssMxV0jdwRvg8sbhwd8TRS1mvc8r+yVs4IMMdvWJrgZsy1ed3pa6itO7My9C9vDuVLkrkqUsp97R3WpCorzU7VkOTl5pOqK9QU0utAl3J8pF/qiETX8OMCEb/gwolUfo61t4w9fFdmTLs5KcKDD9dBWkMcEfbvKAehwQ2bEMtqZZd58LBeX6zknNhZ9O4zrxE4Gt87lDoSUj4S10iMdOTMT0xzwpzNcqP497/NL9Z6G2ww+jZHUR1m1D2nV6zAkB/ebC+FOriiGA3mXDT/+eKQQqEdz8kJw/kZrpbam8zmbu+7npHK8BV9no6C4PRRGaRLbFSxihG/+Gpresoy6ZolLMfNVEgx/ctN+nExpKvjByyTSWI82oSE47i2P3tOr12ISAWQAdCJSPQP4xw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:31:12.1688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f541fc2f-af46-4173-a61f-08d7d263e181
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5460
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:55
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH] arm-autonomy: Update quick start guide
>=20
> Add more documentation to the quick start guide:
> - to include guests images in host image
> - to boot the host image
> - to adapt the layer to new boards
>=20
> Change-Id: I07ff13190daf404476d28803f43f330fc190cddc
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../documentation/arm-autonomy-quickstart.md  | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>=20
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> index 2b92996..c688600 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> @@ -91,6 +91,19 @@ To create a host project:
>=20
>  4. build the image using `bitbake arm-autonomy-host-image-minimal`
>=20
> +The project will generate a Linux kernel, a root filesystem, a Xen
> +binary and a DTB modified to include the required entries to boot Xen
> +and Linux as Dom0 (this DTB has the extension `-xen.dtb`).
> +
> +To boot the system using an u-boot base board you will need to:
> +- Load the kernel (by default at 0x80080000 unless you modify
> +  XEN_DEVICETREE_DOM0_ADDR value)
> +- Load the xen device tree (for example at 0x83000000)
> +- Load the xen-efi binary (for example at 0x84000000)
> +- run using `booti 0x84000000 - 0x83000000`
> +
> +In this example the addresses might need to be adapted depending on your
> board.
> +
>  Guest project
>  -------------
>  The guest projects are not target specific and will use a Yocto MACHINE
> defined @@ -113,4 +126,89 @@ To create a guest project:
>  4. build the image you want.
>     For example `bitbake core-image-minimal`
>=20
> +The build will create a ".xenguest" image that can be use on an host
> +project with the xenguest-manager.
> +
> +Include guests directly in the host image
> +-----------------------------------------
> +The layer provides a way to directly include in the host project one or
> +several images generated by guest projects.
> +
> +To use this feature, you must edit your host project `local.conf` file
> +and add set ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS to the list of
> +xenguest images you want to include in your host. Each xenguest image
> +must be given using a full path to it.
> +For example:
> +```
> +ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS =3D "/home/user/guest-
> project/tmp/deploy/images/arm64-autonomy-guest/core-image-minimal-
> arm64-autonomy-guest.xenguest;guestname=3Dmyguest"
> +```
> +This will add the guest and name it `myguest` on the host project image
> +and the xenguest-manager will automatically boot it during startup.
> +
> +Add support for your board
> +--------------------------
> +Most of arm-autonomy layer is board independent but some
> +functionalities might need to be customized for your board:
> +
> +### Add the kernel configuration for the host The layer is using
> +KERNEL_FEATURES to add drivers required to be a Xen Dom0 system.
> +Depending on the kernel used by your BSP and how it is configured you
> +might need to add the required drivers to your kernel configuration:
> +- if KERNEL_FEATURES system is supported by your kernel, make sure that
> +the file `recipes-kernel/linux/linux-arm-autonomy.inc` from the layer
> +is included by your kernel recipe.
> +- if it is not supported, you must add the proper drivers inside your
> +kernel (modules are possible but they must be loaded before
> +xenguest-manager is started). You can find the complete list of the
> +kernel configuration elements required in `recipes-kernel/linux/arm-
> autonomy-kmeta/features/arm-autonomy/xen-host.cfg`.
> +
> +### Define the drive and partition to use for the LVM volume The
> +xenguest-manager is creating disk hard drive using LVM on an empty
> +partition. The default value is set to use /dev/sda2.
> +You can change this for your board by setting
> XENGUEST_MANAGER_VOLUME_DEVICE.
> +
> +Check `recipes-extended/xenguest/xenguest-manager.bbappend` for
> examples.
> +
> +Please also read xenguest-manager.md.
> +
> +### Define the interface to add to xenguest network bridge
> +xenguest-network bridge is creating a bridge on the host and adds
> +network interfaces to it so that guest connected to it have access to ex=
ternal
> network.
> +By default `eth0` is set as the list of interfaces to be added to the br=
idge.
> +Depending on your board or use case you might want to use an other
> +interface or use multiple interfaces.
> +You can change this for your board by setting
> XENGUEST_NETWORK_BRIDGE_MEMBERS.
> +
> +Check `recipes-extended/xenguest/xenguest-network-bridge.bbappend` for
> +exmaples.
> +
> +Please also read xenguest-network-bridge.md.
> +
> +### Define the network configuration of the xenguest network bridge
> +xenguest network bridge is putting the host network interfaces in a
> +bridge and is configuring it by default to use dhcp.
> +If you need a different type of configuration you can set
> +XENGUEST_NETWORK_BRIDGE_CONFIG in a xenguest-network-
> bridge.bbappend to
> +use a different file.
> +The recipe will look for the file in ${WORKDIR} so you will need to add
> +it to SRC_URI in your bbappend.
> +The recipe will also substitute `###BRIDGE_NAME###` with the bridge
> +name configured in ${XENGUEST_NETWORK_BRIDGE_NAME}.
> +
> +You can find an example configuration file in
> +`recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in`.
> +
> +Please also read xenguest-network-bridge.md.
> +
> +### Customize Dom0 and Xen boot arguments for you board xen-devicetree
> +is writting inside the generated DTB Xen and Linux boot arguments as
> +long as the address where Dom0 Linux kernel can be found.
> +You might need to have different values for your board or depending on
> +your use case.
> +
> +You can find examples to customize this in
> +`recipes-extended/xen-devicetree/xen-devicetree.bbappend`.
> +
> +Please also read xen-devicetree.md.
>=20
> --
> 2.17.1

