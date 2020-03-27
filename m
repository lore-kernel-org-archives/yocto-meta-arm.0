Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.40])
 by mx.groups.io with SMTP id smtpd.web10.14360.1585322863829087442
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Pzo4plNp;
 spf=pass (domain: arm.com, ip: 40.107.14.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQTSj9tG0KsyINOE8vKAOmGWj3NvYL2vL0ntJv1KaV8=;
 b=Pzo4plNpqyOXiWYdRK7FfE7hciRCW5M4Fqo+p4vNwOXqSttFhX0NwMLX4whNWp4L5WFvyy/M8/HLMCYKizv2A1v+BH3KQ++06GTvZX2oVMbkbZ511Hhgiai3yoVq8+upu49GXem2LO0xmW0iukwL3PuTIMeStK1vsJlFe8U97xc=
Received: from AM7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:20b:100::13)
 by AM6PR08MB4627.eurprd08.prod.outlook.com (2603:10a6:20b:d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 15:27:38 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::ad) by AM7PR02CA0003.outlook.office365.com
 (2603:10a6:20b:100::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 15:27:38 +0000
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
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:27:37 +0000
Received: ("Tessian outbound 19f8d550f75c:v48"); Fri, 27 Mar 2020 15:27:37 +0000
X-CR-MTA-TID: 64aa7808
Received: from 79f23b17642e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5CDAEAF0-F1B5-411D-B1D5-8FCFF6864D18.1;
	Fri, 27 Mar 2020 15:27:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79f23b17642e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJS1BII5f9zLYYPZ+dXexa6A5LKqGctuR7X34ewaIDqwmxJxvifBqT/Ib1WUUFZZ15iBn4TMnR/VD6qz5vqscm9NfigQyvMlN6kgujcgjex3XLVl1EFncRt+ehV235+akNUCxBQA2MP9fCg0BY2o0L9tYzcb8fcGuHpGve2gRTfIe7HTM+Cw0IWvM1bUtgQ3xPwfperRk69rT7PVdKJxPuGbXLulfDCxb7qARK6W6aprHPubaRw/UE4wvqM7OM20wHQaSIMriaaIbB+749G+uCL742zkgijkM4ab5kzqYEdSPxYvs5KrL5fPJsQAyviaIYYiyQlmxqMVtDOYz0VTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQTSj9tG0KsyINOE8vKAOmGWj3NvYL2vL0ntJv1KaV8=;
 b=feIBDnQZ2HxeUAeFVb5kBCc/oGa8Q3EHbjk/mHwAJYNHFtqarTG0CcReA/XLbpE3z/4xT+FcSGzPw4pulKYOBFh2KJQJY7HaMVkExrL18KVLdktIg2B0/CdneydyWElPqW+Y/Uk8FQO2rQ3UCCbyqKCGW6cCo/40B8qmiYpSvOMtDXMRI1ef/mBa+qn1Wr6g+EncvEpwYj/DEsN/NwsdnO/tfm3d+3fRVFndPuU4+tODe/W6iwetAa0lpRnrLNOj1A9eFa2JOZS/KVcYIONNfwl0YtvJpa7HNSHrDtDVFvmVnPFE376y54mfE24Mj21awkh6HJhIOaygXna12viWPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQTSj9tG0KsyINOE8vKAOmGWj3NvYL2vL0ntJv1KaV8=;
 b=Pzo4plNpqyOXiWYdRK7FfE7hciRCW5M4Fqo+p4vNwOXqSttFhX0NwMLX4whNWp4L5WFvyy/M8/HLMCYKizv2A1v+BH3KQ++06GTvZX2oVMbkbZ511Hhgiai3yoVq8+upu49GXem2LO0xmW0iukwL3PuTIMeStK1vsJlFe8U97xc=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4513.eurprd08.prod.outlook.com (20.179.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 15:27:31 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:27:31 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/7] arm-autonomy: Create xenguest-image class
Thread-Topic: [meta-arm] [PATCH 3/7] arm-autonomy: Create xenguest-image class
Thread-Index: AQHWBCXks4BuaQGnxk2hpNI1gtglSKhckBDg
Date: Fri, 27 Mar 2020 15:27:31 +0000
Message-ID: 
 <AM0PR08MB3987315A8878D52936F9A5CC92CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
 <20200327105223.460-4-bertrand.marquis@arm.com>
In-Reply-To: <20200327105223.460-4-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 5d6c800d-2e38-4b89-8dc9-698287ab7593.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ffab026f-f6e2-4d91-7fb7-08d7d26361b9
x-ms-traffictypediagnostic: AM0PR08MB4513:|AM6PR08MB4627:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4627F720425FC61663992D8E92CC0@AM6PR08MB4627.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(55016002)(66446008)(9686003)(76116006)(26005)(81166006)(81156014)(6916009)(52536014)(33656002)(71200400001)(4326008)(316002)(5660300002)(8676002)(64756008)(66946007)(8936002)(478600001)(66476007)(53546011)(86362001)(7696005)(55236004)(2906002)(66556008)(186003)(6506007)(473944003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PzLu2vg6QoRFFGa+wi0MhPWwWvXf2eCT+q5CXOXB37xadnU9J4HAuqd9XLvlBxTCP3qwvdx1Y/siJIG1yMuBKzDbrzJIkJPqRjrx02+CqqdGbP/lpONIN/gPzMF2brRwnETnha8H2J/7NFSo+55MJhvdbXVXX+PTUKMPg86d5LJMeAdL99puN58WUVWucjpdlnAUqp+T8MCtgxjpD7nQIUX+SY3vYcvClptvn0ZXu2x+1D+TG2jvuELo3irvcJbq5c+mZFngiQ8OrSuJAKJezoRQmJdITiJFgIiXwsSR41s9L0F4TEq0kYjTrxHYA6vmEtmJKm+4IDCFNMS7xAvb6TyvlHSNYQ0JqR6m5lVGHsG462OruiuYgQPe6cmcwyZhL8ZfTezUbO5uunoEAcA47FdIBgWR4mF0JFueeTCLbdrU9LtqTTwwQsPyD7l0yKbicnLUqNbOvYuwrEg0Fg0FJmfVEDilqAQwVuU6153g9ugNooC1OGKIweb0xCSewolY
x-ms-exchange-antispam-messagedata: 
 z5V4ITFsy0xbRAcL5YviDmHReCMisAAJyyaSyGAr3SjgZtRQPfG+nhqRBHn8N9P+g4Qtu22LBZ/2sa5Wu2swFzTlUaAbxMK7ns/DwXyYDun/bR7vyOlb0AVfGeVxX0paUorXpHjuFxFNxmUQWGIvgg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4513
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(8676002)(33656002)(26826003)(356004)(52536014)(70586007)(186003)(26005)(6506007)(81156014)(2906002)(81166006)(7696005)(5660300002)(8936002)(53546011)(86362001)(478600001)(70206006)(316002)(36906005)(4326008)(6916009)(336012)(82740400003)(47076004)(55016002)(9686003)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a999f7f-f801-474e-1151-08d7d2635db9
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s0QN4LumbFHxK4BNKfcvAEaOcA35Hna/fYm1BlfwKs0GJao8Xld8LHAOo6YaIeYyELrGGGR3LehLdZSFA9EUHsNmeWdeO3P8a3hIiTDd4YqdhzGIpWMsHGxlHqVjSw3KSfGvZmXS7/Y/+NVDTM+E0U36WQnCtssITsL0KUlxqzph2/JjtHd6843NdMXp3XtNcMg1CATSHjeafRgJcw5sCbQMpQIpbDmoKqdP+ub/SzJ3cXShkQ/ArSisUAsljd2TBCxVdXt9GEDx06xS+bvtFV13eZkCosa4FBRgbBQlfjPjmE2fI8JfNNEEJVmfPl06ZAwB8ieKKY8MIcooylOpbYRTd4ydUuPBCVTKG/9uw2w2syQdrWCMDp+MjxBXxff07SXiiHbyjO3FSbVWCy3FW/qegkRxMnni+msWT/YYrcxHcR23S7i3p8VRNVQBJqe5a/RUjB7ihKzpQivEq8H9dTEbqczxkTpbgp2HpN1IQBAreGhRX17zamLM/n6ZkHwaXiHNyBQagH1SZ+Eyo0o9EHSwe7HKpCmX84GmV8Qy4XA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:27:37.7935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffab026f-f6e2-4d91-7fb7-08d7d26361b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4627
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:52
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 3/7] arm-autonomy: Create xenguest-image class
>=20
> Create xenguest-image class to be used by recipes and other classes to
> manipulate xenguest images.
> The recipe is defining some variables to configure default parameters of
> xenguest image (memory size, number of vcpus, command line, etc.). Those
> parameters all have the prefix XENGUEST_IMAGE_ and are documented at the
> beginning of the class.
>=20
> The class also provide some helper functions:
> - xenguest_image_create to create a xenguest image (using global
> parameters) in deploy as xenguest image directory
> - xenguest_image_clone to clone current xenguest image from deploy to be
> able to extend it and pack it in a xenguest image file
> - xenguest_image_rootfs_file function to allow other recipes to detect if=
 the
> rootfs should or not be embedded in the xenguest image
>=20
> Change-Id: I4ba54aa2c41e72964c152f673b71fe32f30b4aca
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  .../classes/xenguest-image.bbclass            | 187 ++++++++++++++++++
>  1 file changed, 187 insertions(+)
>  create mode 100644 meta-arm-autonomy/classes/xenguest-image.bbclass
>=20
> diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-
> autonomy/classes/xenguest-image.bbclass
> new file mode 100644
> index 0000000..fecf1ae
> --- /dev/null
> +++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
> @@ -0,0 +1,187 @@
> +# This class must be used to create, extend or pack a xenguest image.
> +# It is using xenguest-mkimage tool to do operations
> +
> +DEPENDS +=3D "xenguest-mkimage-native"
> +
> +#
> +# Xenguest image parameters
> +# All the following parameters can be modified in local.conf or on
> +recipes # inheriting this class #
> +
> +# Guest memory size in MB
> +XENGUEST_IMAGE_MEMORY_SIZE ??=3D "512"
> +
> +# Guest number of vcpus
> +XENGUEST_IMAGE_NUM_VCPUS ??=3D "1"
> +
> +# Guest auto boot during init, set to 1 to have guest started during
> +init or # to 0 if the guest should not be auto started
> +XENGUEST_IMAGE_AUTOBOOT ??=3D "1"
> +
> +# Partition containing the root file system # Xen will actually add
> +root=3D${XENGUEST_IMAGE_ROOT} to your guest kernel # command line # You
> +can let this empty if the root filesystem is specified in an other way
> +# and have root=3D option added to the command line for example or if yo=
u
> +don't # need a root filesystem mounted for your guest (initrd for
> +example) XENGUEST_IMAGE_ROOT ??=3D "/dev/xvda1"
> +
> +# Guest kernel command line arguments
> +XENGUEST_IMAGE_CMDLINE ??=3D "earlyprintk=3Dxenboot console=3Dhvc0 rw"
> +
> +# Extra commands to add to xenguest-image when creating the image
> +XENGUEST_IMAGE_EXTRA_CMD ??=3D ""
> +
> +# Kernel binary
> +# This value is used by the xenguest image type but is declared here to
> +have # all variables in the same place # Default value is:
> +# - Image if INITRAMFS_IMAGE is not set # -
> +Image-initramfs-${MACHINE}.bin if INITRAMFS_IMAGE is set # If this
> +value is empty no kernel will be added to the image
> +XENGUEST_IMAGE_KERNEL ??=3D "${@ 'Image' if not
> d.getVar('INITRAMFS_IMAGE') else 'Image-initramfs-${MACHINE}.bin'}"
> +
> +# Size of the disk to create (if 0 no disk will be created and rootfs
> +will not # be included in the xenguest image) XENGUEST_IMAGE_DISK_SIZE
> +??=3D "${@ '4' if not d.getVar('INITRAMFS_IMAGE') else '0'}"
> +
> +#
> +# XENGUEST_IMAGE_DISK PARTITIONS is used to describe the partitions to
> +setup # and their content.
> +# It must be set to a space separated list of entries with each entry
> +having # the format num:sz:fs:[file] where:
> +# - num is a partition number
> +# - sz is the partition size in Gigabit # - fs is the filesystem to use
> +for the partition # - file is optionally pointing to a file to use as
> +content of the partition
> +#   Please check image_types_xenguest.bbclass for rootfs handling of fil=
es
> +#
> +# Default value creates a partition 1 using the full disk, formated
> +with ext4 # and containing the root filesystem produced by Yocto
> +XENGUEST_IMAGE_DISK_PARTITIONS ??=3D
> "1:${XENGUEST_IMAGE_DISK_SIZE}:ext4:rootfs.tar.gz"
> +
> +# Sub-directory in wich the guest is created. This is create in deploy
> +as a # subdirectory and must be coherent between all components using
> +this class so # it must only be modified from local.conf if needed
> +XENGUEST_IMAGE_DEPLOY_SUBDIR ?=3D "xenguest"
> +
> +# Directory in which the xenguest should be deployed # a sub-directory
> +named ${XENGUEST_IMAGE_DEPLOY_SUBDIR} will be created there.
> +# This should be set to:
> +# - ${DEPLOYDIR} (default) if creating or extending the xenguest for a n=
ormal
> +#   recipe.
> +# - something in ${WORKDIR} if you need to clone and manipulate an
> +image XENGUEST_IMAGE_DEPLOY_DIR ??=3D "${DEPLOYDIR}"
> +
> +#
> +# Wrapper to call xenguest-mkimage
> +# It is using XENGUEST_IMAGE_DEPLOY_DIR and
> +XENGUEST_IMAGE_DEPLOY_SUBDIR # to find the image to operate on # #
> +Usage: call_xenguest_mkimage [operation] [args]
> +call_xenguest_mkimage() {
> +    local cmd=3D"${1}"
> +    local
> img=3D"${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUB
> DIR}"
> +    shift
> +
> +    echo "xenguest-mkimage $cmd $img $@"
> +    xenguest-mkimage $cmd $img $@
> +}
> +
> +#
> +# Create an initial xenguest image.
> +# This is a task which must be added in a recipe inheriting deploy # It
> +is using XENGUEST_IMAGE_MEMORY_SIZE,
> XENGUEST_IMAGE_NUM_VCPUS, #
> +XENGUEST_IMAGE_AUTOBOOT, XENGUEST_IMAGE_ROOT,
> XENGUEST_IMAGE_EXTRA_CMD,
> +#  XENGUEST_IMAGE_CMDLINE, XENGUEST_IMAGE_DISK_SIZE and #
> +XENGUEST_IMAGE_DISK_PARTITIONS to customize the initial guest #
> +xenguest_image_create() {
> +    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
> +        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
> +        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or
> XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
> +    fi
> +
> +    rm -rf
> ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
> +
> +    mkdir -p
> + ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
> +
> +    # Create the image
> +    call_xenguest_mkimage create --xen-
> memory=3D${XENGUEST_IMAGE_MEMORY_SIZE} \
> +        --xen-vcpus=3D${XENGUEST_IMAGE_NUM_VCPUS} \
> +        --xen-root=3D${XENGUEST_IMAGE_ROOT} \
> +        ${XENGUEST_IMAGE_EXTRA_CMD}
> +
> +    # add command line
> +    if [ -n "${XENGUEST_IMAGE_CMDLINE}" ]; then
> +        call_xenguest_mkimage update --xen-clean-extra
> +        for arg in ${XENGUEST_IMAGE_CMDLINE}; do
> +            call_xenguest_mkimage update --xen-extra=3D$arg
> +        done
> +    fi
> +
> +    # create disk if needed
> +    disksize=3D"${XENGUEST_IMAGE_DISK_SIZE}"
> +    if [ -z "$disksize" ]; then
> +        disksize=3D"0"
> +    fi
> +    if [ $disksize -gt 0 ]; then
> +        # setup disk size
> +        call_xenguest_mkimage update --disk-reset-config
> + --disk-size=3D$disksize
> +
> +        diskparts=3D"${XENGUEST_IMAGE_DISK_PARTITIONS}"
> +        if [ -n "$diskparts" ]; then
> +            for arg in $diskparts; do
> +                call_xenguest_mkimage update --disk-add-part=3D$arg
> +                partnum=3D"$(expr $partnum + 1)"
> +            done
> +        fi
> +    fi
> +
> +    if [ "${XENGUEST_IMAGE_AUTOBOOT}" =3D "1" ]; then
> +        call_xenguest_mkimage update --set-param=3DGUEST_AUTOBOOT=3D1
> +    else
> +        call_xenguest_mkimage update --set-param=3DGUEST_AUTOBOOT=3D0
> +    fi
> +}
> +
> +#
> +# Clone the current xenguest from deploy to manipulate it locally #
> +This is required if you need to change things before packing an image #
> +To set the local directory where to clone you must set #
> +XENGUEST_IMAGE_DEPLOY_DIR if you don't want to use do_deploy to
> modify
> +the # image #
> +xenguest_image_clone() {
> +    if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
> +        -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
> +        die "Configuration error: XENGUEST_IMAGE_DEPLOY_DIR or
> XENGUEST_IMAGE_DEPLOY_SUBDIR is empty"
> +    fi
> +
> +    if [ ! -f
> ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}/guest.cfg ];
> then
> +        die "xenguest-image:
> ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR} does not
> contain a valid guest"
> +    fi
> +
> +    rm -rf
> ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
> +    mkdir -p ${XENGUEST_IMAGE_DEPLOY_DIR}
> +    cp -rf ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR} \
> +
> ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
> +}
> +
> +# Helper function to retrieve rootfs file if present in one partition #
> +This can return an empty string or rootfs.tar[.COMP] def
> +xenguest_image_rootfs_file(d):
> +    disksize =3D d.getVar('XENGUEST_IMAGE_DISK_SIZE')
> +    # if disksize is 0, we don't create anything
> +    if not disksize or disksize =3D=3D '0':
> +        return ""
> +    # Find first partition with file=3Drootfs.tar*
> +    partlist =3D d.getVar('XENGUEST_IMAGE_DISK_PARTITIONS')
> +    if partlist:
> +        for partdesc in partlist.split():
> +            partelems =3D partdesc.split(':', 3)
> +            if partelems[3]:
> +                if partelems[3].startswith('rootfs.tar'):
> +                    return partelems[3]
> +    return ""
> --
> 2.17.1

