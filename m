Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.78])
 by mx.groups.io with SMTP id smtpd.web10.14389.1585322920038993657
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cuW19taP;
 spf=pass (domain: arm.com, ip: 40.107.0.78, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/+YA7D6dQC3bBjqhwFPIaJtJEiemlk0DWe1dGOE1uo=;
 b=cuW19taPTe1XQL8dOHyWTlTVwixwbtbiR8fxSHl1RJ1WmHGtD6F4kpTsliaie+6JQwI7pO+gg5+erOu8cGUuC4E928ojQ88QxVsYThPvn97CwcHttlDGvTl/2pLwBU1ig0amlTqWUSZqGuPxIC/rDH3gYuXCf+QQx7ZZogFJjYE=
Received: from DB6PR0301CA0012.eurprd03.prod.outlook.com (2603:10a6:4:3e::22)
 by DB6PR0802MB2453.eurprd08.prod.outlook.com (2603:10a6:4:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Fri, 27 Mar
 2020 15:28:37 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::73) by DB6PR0301CA0012.outlook.office365.com
 (2603:10a6:4:3e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:28:37 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:28:37 +0000
Received: ("Tessian outbound e13acb17570e:v48"); Fri, 27 Mar 2020 15:28:37 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8dbb969b8704.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6C904683-2200-4E01-846D-26FA97122A0D.1;
	Fri, 27 Mar 2020 15:28:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dbb969b8704.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld+XNFvBGamGmeWoI8kjxq9/xZ7o6pZghggFxB24wvA1Dl7/2AjUHMsAslBVr4LBcekWJrX2H3Wtk2KHfyT5Q5HH+4PJHA9qxX0vDQcAJ2jwmv0/56vK92q2tRxbTiKnGvXwhWuxzhkK+vfcLIrOT3HngQA67MaO1WAaxEahxhOkXvgiA2h/TgO5Cr4GIOwytp2LkEuZdPdbEbrQMz8QcySjQGRAuxzlMZ4+nQNGaFT+mpRedpq55D3f8MG/pAms+Ov64h73874DI0z+XnNGa4xDj7UeI17RGVZ9fsuLi7n/Tc4r+ZUIgL7ZjwErpk7c8aEUYrVtZlxiVDSggmUanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/+YA7D6dQC3bBjqhwFPIaJtJEiemlk0DWe1dGOE1uo=;
 b=M/jq/A0b+2plfJBwZB2uTb1UgftDQh77Sm9gU8CVtW2u1MdioLuS8iFdFzlZJVJ84KYoYmaLMMOpMgWR5tBri+oJuOIg0x1zypPl02kRstiJNTXIPtSGRxAowYAQwKwChuaUGYGpIQH1j9NFkmndTS7aOew7+FDLunnrZIpvRpLyg+F/O2iaKYC8h/EkiF76Lmr89U9zfj6ThWQUX6PccUVIeHShYKyEWVwTzZYejqqYHCc9wLZdG3K8DFBpYo2S27ZRwrLsZW+VsYVAgH5R/dAtgc6LLChK7O9V8vDSYM0Wu8VT5eBVPsdYpANozg0garxa0NL/ZGYzUt2Y5lFUNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/+YA7D6dQC3bBjqhwFPIaJtJEiemlk0DWe1dGOE1uo=;
 b=cuW19taPTe1XQL8dOHyWTlTVwixwbtbiR8fxSHl1RJ1WmHGtD6F4kpTsliaie+6JQwI7pO+gg5+erOu8cGUuC4E928ojQ88QxVsYThPvn97CwcHttlDGvTl/2pLwBU1ig0amlTqWUSZqGuPxIC/rDH3gYuXCf+QQx7ZZogFJjYE=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4513.eurprd08.prod.outlook.com (20.179.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 15:28:30 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:28:30 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 5/7] arm-autonomy: Create xenguest image type
Thread-Topic: [meta-arm] [PATCH 5/7] arm-autonomy: Create xenguest image type
Thread-Index: AQHWBCXoH2zgLEE+3UqNGfJLBSGABahckFsQ
Date: Fri, 27 Mar 2020 15:28:30 +0000
Message-ID: 
 <AM0PR08MB3987FCBC5C62B9E6368BCC5092CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
 <20200327105223.460-6-bertrand.marquis@arm.com>
In-Reply-To: <20200327105223.460-6-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: b3bda9a6-313d-4310-b811-0a16c4a3f199.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84538ecd-ffc4-4fde-8249-08d7d263850e
x-ms-traffictypediagnostic: AM0PR08MB4513:|DB6PR0802MB2453:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB24538D8AA1F3BD60DCA8913A92CC0@DB6PR0802MB2453.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(55016002)(66446008)(9686003)(76116006)(26005)(81166006)(81156014)(6916009)(52536014)(33656002)(71200400001)(4326008)(316002)(5660300002)(8676002)(64756008)(66946007)(8936002)(478600001)(66476007)(53546011)(86362001)(7696005)(55236004)(2906002)(66556008)(186003)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Fan9Gn1HMbM9zpYa7rQVCIHBQSBXXGpWHjt4Vqd0yhZlVjCqO4OfM3EUGtN5gw53wC3jOjudJ9WdAuvvaAzZXvHlGaQKswTQcNqXNuyfLHoTP5kNK5XQWAJNNvhMvNC5MWN/S0eVoUm1foDc99ptKLrWUjaNW37I9tuerulfhtLVlKfGjFAfP4ptnEK5iTnKLXFDpmeMxR0Tuxl/isqt8RAPnzoCBb7hrsNuWH78M/Hizj/9oefYOwmbHCC5Qx9edtGZOxnEkpdxf7tjPuI6HRVP/O42+s6WsVS5MXzAc+cmQvgHkj0FTP1QqsP5IptsVZXLzRbkicuhMS6v6cHcqwqohJ9PnXS4WGFIq26paY+cR/89Diq6TQwr9/0m45D26ln0SfZ4+jRyNJKvGPqpax1s4ytcWEQyQqeR0zQeVuM90+YnxeAMPrr1mtWEPAct
x-ms-exchange-antispam-messagedata: 
 K+XLTYE2vt61PC0wn9hjQR38ecOzBaHGwnNywIsVjSszAJhTPeLIpu1EzeUUakDyi6+rY0YGHoDKon/PPSICAbRLMdmNIKM+Cuz/Rg7+4JFzQr4cWAnjaA7RIjdcDwcXAizIfPAL4eHksXDUgxMM8A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4513
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966005)(478600001)(81156014)(8936002)(52536014)(8676002)(2906002)(5660300002)(81166006)(33656002)(53546011)(336012)(4326008)(7696005)(6506007)(86362001)(55016002)(26005)(82740400003)(356004)(316002)(47076004)(26826003)(6916009)(9686003)(70586007)(186003)(70206006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb2a5395-f945-46ef-dbec-08d7d263812e
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	afYwwX4K1EZmW8a+9cQP8/ZdO/autc8Srp1qbcKJTu32aN22rRhqZv+ST+1nN2Hb8uhGslLgdS0nYM5PHjdF60dRp1QGgDV5axNgrC0HrVfFlIPIQPFDnYY6M5QrvJvxMrJTd9riISof2EqYSH5z8MI+YGPAzZixrq/anuIuwbfF1APeRpLS2BaeGOe+eAv5vMp+5iJ7nwryGyeZ4H744/frPqhlYDRooKC6bn251AynLR0nS8/llHHssoqYV9hlbF6JjaPHRwxQbNcGDnitIDE2ySJMtSKOSaCmWNlXUaGgCkbhD6fcG97z2kQ/y2NrJ7czr0Clfkbddj47HiaaSHSxf1D/BbxplTWjYymvBrkWebDLL4p6ZOIF72Xp5c2705NFYfDNsb2xTKTYgWIeVj/zMgcwuIMQwA1JQOl6PoZ0faKMkcrZYQUFm92Tkb02J1g3Sfuq0S4FjfpA8uqy5bp1W6GvBIMAXN14a519iGP/OCBdEmOlXkXe/MfA9jtQn/uIa20nV+q82HBM+VBB5Q==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:28:37.2070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84538ecd-ffc4-4fde-8249-08d7d263850e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2453
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:52
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 5/7] arm-autonomy: Create xenguest image type
>=20
> Create an image type xenguest to create a xenguest image as part of a Yoc=
to
> image (add FSTYPE xenguest).
>=20
> The image type is using xenguest-base-image as a producer for the xengues=
t
> image directory, adds kernel defined by XENGUEST_IMAGE_KERNEL to it, adds
> rootfs if listed in XENGUEST_IMAGE_DISK_PARTITIONS and pack the final
> image with file extension .xenguest with other types of images.
>=20
> If initramfs is configured, a xenguest image containing the kernel with i=
nitramfs
> is produced.
>=20
> The xenguest image type is added to IMAGE_FSTYPES and IMAGE_CLASSES if
> arm-autonomy-guest is set in DISTRO_FEATURES.
>=20
> Change-Id: Ibae8a50d41375839492e43a2e28d9472dc71b4a1
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../classes/image_types_xenguest.bbclass      | 132 ++++++++++++++++++
>  .../distro/include/arm-autonomy-guest.inc     |   4 +
>  2 files changed, 136 insertions(+)
>  create mode 100644 meta-arm-
> autonomy/classes/image_types_xenguest.bbclass
>=20
> diff --git a/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> new file mode 100644
> index 0000000..ff1e41a
> --- /dev/null
> +++ b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> @@ -0,0 +1,132 @@
> +# Create a xenguest image with kernel and filesystem produced by Yocto
> +# This will create a .xenguest file that the xenguest-manager can use.
> +
> +inherit xenguest-image deploy
> +
> +# We are creating our guest in a local subdirectory # force the value
> +so that we are not impacted if the user is changing it
> +XENGUEST_IMAGE_DEPLOY_DIR =3D "${WORKDIR}/tmp-xenguest"
> +
> +# Name of deployed file (keep standard image name and add .xenguest)
> +XENGUEST_IMAGE_DEPLOY ??=3D "${IMAGE_NAME}"
> +
> +# Deployed file when building with initramfs
> +XENGUEST_IMAGE_INITRAMFS_DEPLOY ??=3D "Image-initramfs-${MACHINE}"
> +
> +# Add kernel XENGUEST_IMAGE_KERNEL from DEPLOY_DIR_IMAGE to image
> +xenguest_image_add_kernel() {
> +    srcfile=3D"${1:-}"
> +    if [ -z "${srcfile}" ]; then
> +        srcfile=3D"${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_KERNEL}"
> +    fi
> +    call_xenguest_mkimage partial --xen-kernel=3D$srcfile }
> +
> +# Add rootfs file to the image
> +xenguest_image_add_rootfs() {
> +    call_xenguest_mkimage partial \
> +
> +--disk-add-
> file=3D${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${IMAGE_TYPEDEP_xeng
> +uest}:rootfs.${IMAGE_TYPEDEP_xenguest}
> +}
> +
> +# Pack xenguest image
> +xenguest_image_pack() {
> +    mkdir -p ${IMGDEPLOYDIR}
> +    rm -f ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
> +    call_xenguest_mkimage pack \
> +        ${IMGDEPLOYDIR}/${XENGUEST_IMAGE_DEPLOY}.xenguest
> +}
> +
> +# do_deploy is used for initramfs to pack the kernel initramfs in an
> +image
> +do_deploy() {
> +    # Add kernel
> +    xenguest_image_add_kernel
> +
> +    # Pack the image in deploydir
> +    mkdir -p ${DEPLOYDIR}
> +    rm -f ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
> +    call_xenguest_mkimage pack \
> +        ${DEPLOYDIR}/${XENGUEST_IMAGE_INITRAMFS_DEPLOY}.xenguest
> +}
> +do_deploy[depends] +=3D "${PN}:do_bootimg_xenguest"
> +do_deploy[depends] +=3D "virtual/kernel:do_deploy"
> +
> +#
> +# Task finishing the bootimg
> +# We need this task to actually create the symlinks # python
> +do_bootimg_xenguest() {
> +    subtasks =3D d.getVarFlag('do_bootimg_xenguest', 'subtasks')
> +
> +    bb.build.exec_func('xenguest_image_clone', d)
> +    if subtasks:
> +        for tk in subtasks.split():
> +            bb.build.exec_func(tk, d)
> +    bb.build.exec_func('xenguest_image_pack', d)
> +    bb.build.exec_func('create_symlinks', d) } # This is used to add
> +sub-tasks to do_bootimg_xenguest do_bootimg_xenguest[subtasks] =3D ""
> +# Those are required by create_symlinks to find our image
> +do_bootimg_xenguest[subimages] =3D "xenguest"
> +do_bootimg_xenguest[imgsuffix] =3D "."
> +do_bootimg_xenguest[depends] +=3D "xenguest-base-image:do_deploy"
> +# Need to have rootfs so all recipes have deployed their content
> +do_bootimg_xenguest[depends] +=3D "${PN}:do_rootfs"
> +
> +# This set in python anonymous after, just set a default value here
> +IMAGE_TYPEDEP_xenguest ?=3D "tar"
> +
> +# We must not be built at rootfs build time because we need the kernel
> +IMAGE_TYPES_MASKED +=3D "xenguest"
> +IMAGE_TYPES +=3D "xenguest"
> +
> +python __anonymous() {
> +    # Do not do anything if we are not in the want FSTYPES
> +    if bb.utils.contains_any('IMAGE_FSTYPES', 'xenguest', '1', '0', d):
> +
> +        # Check the coherency of the configuration
> +        rootfs_needed =3D False
> +        rootfs_file =3D ''
> +        kernel_needed =3D False
> +        initramfs_needed =3D False
> +
> +        rootfs_file =3D xenguest_image_rootfs_file(d)
> +        if rootfs_file:
> +            rootfs_needed =3D True
> +
> +        if d.getVar('XENGUEST_IMAGE_KERNEL'):
> +            kernel_needed =3D True
> +
> +        if d.getVar('INITRAMFS_IMAGE'):
> +            if int(d.getVar('INITRAMFS_IMAGE_BUNDLE')) !=3D 1:
> +                bb.error("xenguest-fstype: INITRAMFS_IMAGE is set but
> INITRAMFS_IMAGE_BUNDLE is set to 0.\n")
> +                bb.fatal("xenguest-fstype: This configuration is not sup=
ported by
> xenguest image type\n")
> +            initramfs_needed =3D True
> +
> +        if initramfs_needed and rootfs_needed:
> +            bb.warn("xenguest-fstype: Final image will use an initramfs =
kernel and
> rootfs in disk.\n")
> +            bb.warn("xenguest-fstype: rootfs.tar.%s should be removed
> + from XENGUEST_IMAGE_DISK_PARTITIONS.\n")
> +
> +        if not initramfs_needed and not rootfs_needed and not kernel_nee=
ded:
> +            bb.warn("xenguest-fstype: Generated image will have no
> + kernel and no rootfs.\n")
> +
> +        bb.build.addtask('do_bootimg_xenguest', 'do_image_complete',
> + None, d)
> +
> +        if rootfs_needed:
> +            # tell do_bootimg_xenguest to call add_rootfs
> +            d.appendVarFlag('do_bootimg_xenguest', 'subtasks', '
> xenguest_image_add_rootfs')
> +            # do_bootimg_xenguest will need the tar file
> +            d.appendVarFlag('do_bootimg_xenguest', 'depends',
> ' %s:do_image_tar' % (d.getVar('PN')))
> +            # set our TYPEDEP to the proper compression
> +            d.setVar('IMAGE_TYPEDEP_xenguest', 'tar' +
> + (rootfs_file.split('.tar', 1)[1] or ''))
> +
> +        if kernel_needed:
> +            if initramfs_needed:
> +                bb.build.addtask('do_deploy', 'do_build', None, d)
> +            else:
> +                # Tell do_bootimg_xenguest to call xenguest_image_add_ke=
rnel
> +                d.appendVarFlag('do_bootimg_xenguest', 'subtasks', '
> xenguest_image_add_kernel')
> +                # we will need kernel do_deploy
> +                d.appendVarFlag('do_bootimg_xenguest', 'depends', '
> +virtual/kernel:do_deploy') }
> +
> diff --git a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> index d961b40..9b5889e 100644
> --- a/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> +++ b/meta-arm-autonomy/conf/distro/include/arm-autonomy-guest.inc
> @@ -3,3 +3,7 @@
>  # We need to have ipv4 activated
>  DISTRO_FEATURES_append =3D " ipv4"
>=20
> +# Build a xenguest type image
> +IMAGE_CLASSES +=3D "image_types_xenguest"
> +IMAGE_FSTYPES +=3D "xenguest"
> +
> --
> 2.17.1

