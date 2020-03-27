Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.53])
 by mx.groups.io with SMTP id smtpd.web10.14343.1585322825494525375
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tqhP0oXv;
 spf=pass (domain: arm.com, ip: 40.107.2.53, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt3k0eNeCgie7cBGLdxDLez2ugLrKtv9nIS37YRON3A=;
 b=tqhP0oXvXpBJ/WFf0E91CGWx5wU3lbbkXqILWJoVoCzjl+9h+QEKLXOQiPRP23FTSNdYUJNZe6YPhbZUnSriEXET4XRYRxXnWLVHAUddihdtUdQNsl2lkJJdHu0YhWVMFuBQTYQxHG/Jv+YmONEB/du8r+CelVNpMKuTPSy8W3k=
Received: from DB8PR06CA0043.eurprd06.prod.outlook.com (2603:10a6:10:120::17)
 by AM6PR08MB4261.eurprd08.prod.outlook.com (2603:10a6:20b:b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 15:27:00 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::68) by DB8PR06CA0043.outlook.office365.com
 (2603:10a6:10:120::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend
 Transport; Fri, 27 Mar 2020 15:27:00 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:27:00 +0000
Received: ("Tessian outbound 8f06d475fc37:v48"); Fri, 27 Mar 2020 15:27:00 +0000
X-CR-MTA-TID: 64aa7808
Received: from 3f0769dde392.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 33645575-B0B4-41FF-9B22-90B488C81CF2.1;
	Fri, 27 Mar 2020 15:26:55 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f0769dde392.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjqwwF1LpYnkbK2r+BI5mPBkLBIm06h8/UAIZLBYgR8Up4rkxN+2M/8voN8k/qMO1ydWs/qXM5Z1DEaHNu325b62ep0KangTR1EKUgV/Hxh5ewPbdnVUIN8t9T0riBnNUl2o+hlwEpKrSnA/UXZM4QUG6yn5fxTOYrl2suoZJpNpGxLXLS1jufCBpb+WyugUqm0wWTrP/Ekdq9bsm7EnI6D5dOrI8uiOigJoQutWBG7JWU3uCt3O3b9sDb9MqSdVU89TT25VkeG5PWe6yVVUUBdwM2F7NRyFZbHPLKRwqu2pPT7XZfoWXCyjVFw+HSihRmEiXLjH9H7QpqA/0rBW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt3k0eNeCgie7cBGLdxDLez2ugLrKtv9nIS37YRON3A=;
 b=KefdvSNWO+g0VfMfUKxrrdq5N+P+7hjqah8Nzktj+VH8JVpsUa8n1wU991k3Y/2nEZM9zYmM6xNs8hYarEG7REC8GcBt8b1ABFiFWyZdD5Ekb/a0RhtvsGia1WAkFQ1qzNjnlnZzWyXoJ+6ABC5jiazwraxr7p/Ulow0eRngLtrQBP0/2JakTDlDat36EV1vzDl/D+Gu7f4owJSJVcIu+FYdmgMOL5dneicSW1c+Dv3RBequbcJMwkIR87k1Qume5bFVFmgSkyFugwEkbVBBUqDwrv+vsSUvhNF2tMnpI5E3DByswNVKuOhy4MissW2tQ71cCkafdxkwFy6xLA4F4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pt3k0eNeCgie7cBGLdxDLez2ugLrKtv9nIS37YRON3A=;
 b=tqhP0oXvXpBJ/WFf0E91CGWx5wU3lbbkXqILWJoVoCzjl+9h+QEKLXOQiPRP23FTSNdYUJNZe6YPhbZUnSriEXET4XRYRxXnWLVHAUddihdtUdQNsl2lkJJdHu0YhWVMFuBQTYQxHG/Jv+YmONEB/du8r+CelVNpMKuTPSy8W3k=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB3650.eurprd08.prod.outlook.com (20.177.108.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Fri, 27 Mar 2020 15:26:53 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:26:53 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 1/7] arm-autonomy: Create xenguest-mkimage
Thread-Topic: [meta-arm] [PATCH 1/7] arm-autonomy: Create xenguest-mkimage
Thread-Index: AQHWBCXnmmwC0+aai0+ctfeSReJ6vahcj9tA
Date: Fri, 27 Mar 2020 15:26:53 +0000
Message-ID: 
 <AM0PR08MB3987F0E3F1E7D782EF10BDB192CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105223.460-1-bertrand.marquis@arm.com>
 <20200327105223.460-2-bertrand.marquis@arm.com>
In-Reply-To: <20200327105223.460-2-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: fcdaba64-6ca2-4fd7-b5aa-10a15d6ce4c3.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d3f9cb6-b14f-4be1-cded-08d7d2634b71
x-ms-traffictypediagnostic: AM0PR08MB3650:|AM6PR08MB4261:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4261D2C3CBF02FD34359547D92CC0@AM6PR08MB4261.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(9686003)(6916009)(478600001)(55236004)(6506007)(53546011)(81166006)(186003)(55016002)(86362001)(8936002)(5660300002)(7696005)(26005)(81156014)(76116006)(33656002)(66476007)(66556008)(52536014)(66946007)(64756008)(8676002)(71200400001)(4326008)(316002)(2906002)(30864003)(66446008)(559001)(579004);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vOAxnKojZvS7cpsUAJvDui7p4jvisZTHxjpNT0rjRDvLBRU8IK6V+fIwGNFdUi0mFYmqLuHW/y7zavz67nbXZSNmGr+My1WYh0JywHpdPGSw9yGmo5aA7hJEU9sBBegGFCSZSOv0AKOBq8sDrWXLIVsQi0YeuO9z+5AZ0GZB6hC2UTaY7hpa45rn/XUGx7++cXZ9QM2iSG2KdEns9JYvmXb1mBjv/QYpJbQCushA4/IZS1mkBmbqzKb+J61aPD2ijJPhEU+hg5QNoPPapZXPqg2he9WLtXxK31Bm4YPOvz2qAIzXd9qu0JJRK841Noca95chJr2kYU/EkxBuFV9pMKeS9l1/v8nPcr0Xi4DPhwUdKHtZhmZEkIEAwHb/F2DrhOUe0CNGekYTV7aSZKc8LshgmgLnLsFhz7psBNs6LK1gFa5KX4H5TZMOfkWlkpi6ePE7My6269hqTX1oW1CuBa6mDBsiijgOHXoZvCiyhFga1Ny5GhHFIZDzNYYaxLu8SZBhKyFfHa+SByq+5/IYQSe0KrB65GNVc3zFZqfpnzfydHaeo76Dl9X0eSCUJ8A0jIyH70zafw57vndiHNi9lqtXKNwcY1nRp5TQA+ixHTdzHQe7aMmanEY+DjwjkBbAPoZsd9I3HMj8fxpQrDBqPg==
x-ms-exchange-antispam-messagedata: 
 F3NR32j6haaylBqCqD6LhnCuO/Exn+mV63VL4yAeo5API+LbLtmAe4vatHWMHqlqCve/vLbXNQgyglge9Pv4qE+f0TzENXnRzd5yitLXDCkCZRik9XS5Oxqumynq6qg/kkGQ/qVwDL5E9rTk1pWQHQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3650
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(8936002)(70206006)(82740400003)(70586007)(52536014)(4326008)(86362001)(55016002)(47076004)(9686003)(356004)(81166006)(81156014)(6916009)(8676002)(5660300002)(33656002)(26005)(30864003)(478600001)(26826003)(336012)(6506007)(7696005)(2906002)(316002)(53546011)(186003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3c4eb7f1-c262-4dac-bf24-08d7d263474e
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GtScQtECge1NN5wchSvm02vdB5JCe2ny9bGhNmzVRssCAoZrYjoYknfFam8u1OEq16da1/mdCKrRbx0VPuFlSo6jnbwir1U2GhJ/so6Hdy/SU6yGfCoUghGIjG8SA7G1twY6skQ8XaKDfC1gmcXK1WNVmOb0dK8AQJTQR4BtXu0GxNmB+C7rPefIVN9Ml6uKr4cVYoFqnPCH6PGnPmN8EWW0NzunXiZVpGqudCaMsCdJpz3FbSyxsRY+bTVzeFjVi952KSzR1+ICRU5XhmQts3NfPhijkqCu5oawzB/60fDdrtGOVYO9cK+P/1IqHSX4MykVFOINH05+AujE9n6xPIO/Qex7NF7HHxJFY2WglIYzVs/ew8OLNEVgo/2es5vx2nknntNHYUojWZf5myYX9niib5fMoeUYPoB80eq3n3A6lHQoxn4wim4qegyINA0MgMNAi1cO4PjIt7muMUnYhtJixup0+v5f1X6p01K6IL5glH/4oTDWPtLwInfRMO/2ECyb+7MI7wbUHqgRf4ieQz1XKsh4Rc++EiupCZiSdn8k+n2tPiAKcnSyEkDZHEEkyUkuVX0tyekaeF1rV19mUauV+cepchJv/s3Np63XbLRqDHuaFNaGSeptGlJMzjt+7qPrTB/vNg0UisM01gsMxwVyY0hIJU+z1LRCvsJS1LDFOYzk0jrsQflUlEbLrTP8TEaixToukHDTxPWyCfn7qA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:27:00.5489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3f9cb6-b14f-4be1-cded-08d7d2634b71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4261
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:52
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 1/7] arm-autonomy: Create xenguest-mkimage
>=20
> Create a xenguest-mkimage tool to create Xen guest images.
> Add documentation to explain what is a xenguest-image and how to use
> xenguest-mkimage.
>=20
> Change-Id: Id87240a4dfac2723f1dcceb8bfe969a7633ef261
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                   |   3 +
>  .../documentation/xenguest-mkimage.md         | 119 +++
>  .../xenguest/files/xenguest-mkimage           | 770 ++++++++++++++++++
>  .../xenguest/xenguest-mkimage.bb              |  31 +
>  4 files changed, 923 insertions(+)
>  create mode 100644 meta-arm-autonomy/documentation/xenguest-
> mkimage.md
>  create mode 100755 meta-arm-autonomy/recipes-
> extended/xenguest/files/xenguest-mkimage
>  create mode 100644 meta-arm-autonomy/recipes-
> extended/xenguest/xenguest-mkimage.bb
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index 78a7281..560a783 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -67,6 +67,9 @@ This layer is adding the following recipes and classes:
>  * [xen-devicetree](documentation/xen-devicetree.md): this is a recipe to
> modify
>    a device tree blob to add information required to boot xen and a Dom0 =
linux.
>=20
> +* [xenguest-mkimage](documentation/xenguest-mkimage.md): this is a tool
> +to
> +  create and modify images to be used as Xen guests.
> +
>  Contributing
>  ------------
>  This project has not put in place a process for contributions currently.=
 If you
> diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> new file mode 100644
> index 0000000..d77fd48
> --- /dev/null
> +++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> @@ -0,0 +1,119 @@
> +Xenguest mkimage
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +xenguest-mkimage is a tool to create and modify images to be used as
> +Guest with Xen. It defines a format to store completely defined guests
> +as a file or as a directory and provides options to create and modify th=
ose
> images.
> +
> +A xenguest image contains all elements required to create a xen guest.
> +This is the base elements like a Xen configuration and a Linux kernel
> +binary but also some more advanced elements like init scripts or a disk
> definition.
> +
> +The format is made to be deployable easily by storing everything in a
> +single file and provide tools to easily manipulate the images. It can
> +also easily be extended to have features like encryption or signature
> +of images, updates or complex configurations by providing features to
> +have init script that will be executed on the host embedded inside the i=
mage.
> +
> +Xenguest images content
> +-----------------------
> +
> +### params.cfg
> +
> +This file contains parameters that can be used by tools to configure
> +some functionalities on the host. This can be used by init scripts to
> +have configurable parameters as it is sourced before calling init script=
s.
> +
> +### guest.cfg and guest.d
> +
> +guest.cfg is the main xen configuration and guest.d contains optional
> +configuration parts. All those will be merged into one final xen
> +configuration before starting the guest.
> +
> +### files
> +This directory contains files that can be used by the xen
> +configuration, for example the binary of the kernel referenced in xen
> configuration).
> +This is where the kernel binary, the dtb or a ramdisk will be stored.
> +
> +### init.pre, init.d and init.post
> +These directories contain init scripts that will be executed on the
> +host during the guest startup. Those must be shell scripts and each
> +directory contains scripts called at a different time:
> + - init.pre: scripts executed before the guest is created. This can be u=
sed
> +     to prepare some features required to create the guest in xen or to
> +     generate part of the xen configuration dynamically.
> + - init.d: scripts executed when the guest has been created but before i=
t is
> +     started. This can be used to do some xenstore operations or configu=
re the
> +     guest behaviour using xl, for example.
> + - init.post: scripts executed just after starting the guest. This can b=
e
> +     used to configure things created by xen for the guest like network
> +     network interfaces.
> +
> +When a directory contains several scripts, those will be called in
> +alphabetical order.
> +
> +### disk.cfg and disk-files
> +disk.cfg contains the guest disk description (disk size and disk partiti=
ons).
> +The file contains the following entries:
> +- `DISK_SIZE=3DX`: size of the disk to create in GB
> +- `DISK_PARTX=3DSIZE:FS:CONTENT`: create a partition number X (1 to 4)
> +with a
> +  size of SIZE GB, format it with filesystem FS (can be ext2, ext3,
> +ext4, vfat
> +  or swap) and extract CONTENT as initial partition content
> +  (.tar[.gz|.xz|.bz2] file or img file to be dumped in the partition).
> +FS and
> +  CONTENT can be empty.
> +
> +The disk-files contain files to be used for initializing the disk
> +partitions content. Those should be used to create a LVM or a physical
> +disk and initialize it (create partitions, format them and put the initi=
al content).
> +
> +Usage
> +-----
> +
> +xenguest-mkimage is a shell script which must be called like this:
> +`xenguest-mkimage OPERATION XENGUEST [OPTIONS]`
> +
> +### Operations
> +- create: create a xenguest image. If XENGUEST is an existing empty
> +directory,
> +  the image is created as a directory otherwise it will be created as a =
file.
> +- check: verify that XENGUEST is a valid xenguest image.
> +- update: modify a xenguest image (see --help for a list of operations).
> +- pack: pack a xenguest image directory into a xenguest image file. The
> +file to
> +  be created must be given as 3rd argument.
> +- extract: extract a xenguest image file into a directory. The
> +destination
> +  directory must be given as 3rd argument.
> +- dump-xenconfig: dump xenguest image xen configuration.
> +- dump-diskconfig: dump xenguest image disk configuration.
> +- dump-paramsconfig: dump xenguest image parameters configuration.
> +
> +For a detailed help on available operations, please use:
> +`xenguest-mkimage --help`
> +
> +### Options
> +- --kernel=3DFILE: add kernel FILE as guest kernel. This is both adding
> +the file
> +  to the image and modifying the xen configuration to use it.
> +- --xen-memory=3DSIZE: set the guest memory size in MB.
> +- --xen-extra: add a kernel command line argument. This can be called
> +several
> +  times to add several command line options.
> +- --xen-device-tree=3DFILE: add dtb FILE as device tree. This both addin=
g
> +the
> +  file to the image and modifying the xen configuration to use it.
> +- --init-script=3DFILE: add guest init script. The script is embedded
> +inside the
> +  image file. Several script can be added and the basename of FILE is
> +used to
> +  distinguish them (calling the option twice with the same file will
> +update the
> +  script in the image with the second one).
> + --disk-size=3DSIZE: set the guest disk size to SIZE in GB. Calling this
> +with 0
> +  disable the guest disk.
> +- --disk-add-part=3DNUM:SIZE:FS:CONTENT: This is adding a partition to
> +the
> +  xenguest image disk. The partition is described with the arguments:
> +  - NUM: partition number.
> +  - SIZE: partition size in GB.
> +  - FS: filesystem to format the partition with. This can be ext2, ext3,=
 ext4,
> +    vfat of swap. If empty the partition is not formated.
> +  - CONTENT: tar of img file to use to initialize the partition. The fil=
e must
> +    be added to the image using --disk-add-file=3DFILE:CONTENT.
> +
> +For a detailed help on available options, please use:
> +`xenguest-mkimage OPERATION --help`
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> mkimage b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> mkimage
> new file mode 100755
> index 0000000..58fcd01
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-
> mkimage
> @@ -0,0 +1,770 @@
> +#!/bin/bash
> +# This script must be used to manipulate xenguest images # # xenguest
> +image topology:
> +#  params.cfg: guest global configuration file. Only edited using this s=
cript.
> +#  guest.cfg: xen main configuration file. Only edited using this script=
.
> +#  guest.d: directory contains files with custom xen configuration entri=
es
> +#    which are appended to guest.cfg before starting the guest
> +#  files: directory where files used by xen configuration are stored #
> +disk.cfg: guest disk configuration file. Only edited using this script.
> +#    (dtb, kernel image, etc)
> +#  disk: directory where files for disk creation are stored #
> +init.[pre,d,post]: directories containing init pre, base and post
> +scripts set -u set -e
> +
> +this=3D"$0"
> +
> +IMAGE_TMPDIR=3D""
> +
> +usage() {
> +    cat <<EOF
> +Usage $this ACTION XENGUEST [ARGS]
> +
> +Where XENGUEST is a xenguest image file or a xenguest directory.
> +
> +The following actions are supported:
> +help               Display this help
> +create             Create a xenguest image
> +update             Update/modify a xenguest image
> +partial            Create partial xenguest image in a directory
> +pack               Pack a xenguest directory into an image
> +check              Check a xenguest image
> +dump-paramsconfig  Display the guest configuration of a xenguest image
> +dump-xenconfig     Display the xen configuration of a xenguest image
> +dump-diskconfig    Display the disk configuration of a xenguest image
> +dump-init          Display init scripts of a xenguest image
> +extract            Extract a xenguest image content
> +extract-config     Extract the guest configuration from a xenguest image
> +extract-disk-file  Extract a disk file from a xenguest image Use $this
> +ACTION --help to have help on a specific action and its arguments.
> +EOF
> +}
> +
> +usage-check() {
> +    cat <<EOF
> +Usage $this check XENGUEST
> +
> +Check a xenguest image or a xenguest directory.
> +EOF
> +}
> +
> +usage-update-create() {
> +    cat <<EOF
> +All arguments are handled in order.
> +
> +Global configuration for the guest
> +--guest-config-reset    reset guest global configuration
> +--set-param=3DPARAM       disable parameter PARAM in guest global
> configuration
> +--set-param=3DPARAM=3DVAL   set parameter PARAM to value VAL in guest
> global
> +                        configuration.
> +                        Example of parameters supported are:
> +                        GUEST_AUTOBOOT: if set to 1 (default), guest wil=
l be
> +                         automatically created and started during host i=
nit.
> +
> +Xen configuration for the guest
> +--xen-reset-config      reset xen guest configuration to default
> +--xen-name=3D             disable name parameter in xen configuration
> +--xen-name=3DNAME         set guest name in xen configuration
> +--xen-kernel=3D           disable guest kernel parameter in xen configur=
ation
> +--xen-kernel=3DFILE       set guest kernel to FILE (file is added and xe=
n
> +                         configuration is set to use it)
> +--xen-memory            set guest memory size (in MB)
> +--xen-vcpus             set guest number of virtual cpus
> +--xen-clean-extra       set guest command line (extra) to an empty strin=
g
> +--xen-extra=3DARG         append ARG to the guest command line (with spa=
ce)
> +                         use this several time to set command line.
> +                         To set the command line to "console=3DttyS0 rw"=
 do
> +                         --xen-extra=3Dconsole=3DttyS0 --xen-extra=3Drw
> +--xen-root=3D             disable root parameter in xen configuration
> +--xen-root=3DROOT         set guest root in xen configuration
> +--xen-device-tree=3D      disable device tree parameter in xen configura=
tion
> +--xen-device-tree=3DFILE  set guest device tree in xen configuration and=
 add
> +                         file to xen files
> +--xen-disk=3D             disable disk parameter in xen configuration
> +--xen-disk=3DDEV          set guest disk to device DEV (phy:DEV,xvda,w i=
s set)
> +--xen-append=3DFILE       append FILE content to xen configuration
> +
> +Xen files
> +--xen-add-file=3DSRC:DST  add file SRC as file DST in the xenguest image=
.
> +                         If DST already exist in the image, it is overwr=
itten.
> +                         DST must be the same as arguments passed to oth=
er
> +                         options (like --xen-kernel)
> +--xen-rm-file=3DDST       remove file DST from the xenguest image.
> +
> +Init configuration
> +  This can be used to add init scripts for the guest. There are 3
> +possible init
> +  scripts which are called at different time. The pre scripts are
> +called first,
> +  then the xen guest is created in pause and standard init scripts are c=
alled.
> +  Finally the xen guest is started then the post init scripts are called=
.
> +  Each script is called with the name of the guest as first argument
> +and
> +  multiple scripts can be added (they must have different names).
> +
> +--init-script=3DFILE      add FILE as init script
> +--init-pre=3DFILE         add FILE as pre init script
> +--init-post=3DFILE        add FILE as post init script
> +
> +Disk configuration
> +--disk-reset-config     reset disk guest configuration to default (no di=
sk)
> +--disk-size=3DSZ          set guest disk size (in GB)
> +--disk-device=3DDEV       set device to be used to create the guest disk
> +                        if unset or set to an empty string, the volume w=
ill be
> +                        create in the default manager volume group.
> +--disk-add-part=3DDEF     add a partition to the guest disk with definit=
ion DEF
> +                         a partition definition must have the following =
format:
> +                         ID:SIZE:FORMAT:CONTENT where:
> +                         - ID is the partition numeric ID (1 to 4)
> +                         - FORMAT is the filesystem format (supported fo=
rmats
> +                           are none, vfat, swap, ext2, ext3 and ext4)
> +                         - CONTENT can be used to point to a file added =
using
> +                          --disk-add-file to be used as partition initia=
l
> +                          content (tar file or img file)
> +--disk-rm-part=3DID       remove partition ID from the guest disk
> +--disk-add-file=3DSRC:DST add file SRC as disk file DST in the xenguest =
image.
> +                         DST can then be used as a partition CONTENT.
> +--disk--rm-file=3DDST     remove disk file DST from the xenguest image.
> +EOF
> +}
> +
> +usage-create() {
> +    cat <<EOF
> +Usage $this create XENGUEST [ARGS]
> +
> +Create a xenguest image as XENGUEST file.
> +
> +EOF
> +    usage-update-create
> +}
> +
> +usage-update() {
> +    cat <<EOF
> +Usage $this update XENGUEST [ARGS]
> +
> +Update or modify a xenguest image or a xenguest directory.
> +
> +EOF
> +    usage-update-create
> +}
> +
> +usage-pack() {
> +    cat <<EOF
> +Usage $this pack XENGUEST DESTFILE
> +
> +Pack a xenguest directory in XENGUEST to create a xenguest image DESTFIL=
E.
> +
> +EOF
> +}
> +
> +usage-partial() {
> +    cat <<EOF
> +Usage $this partial XENGUEST [ARGS]
> +
> +Update or modify a partial xenguest image.
> +
> +EOF
> +    usage-update-create
> +}
> +
> +usage-dump-paramsconfig() {
> +    cat <<EOF
> +Usage $this dump-paramsconfig XENGUEST
> +
> +Dump the guest parameters of a xenguest image or directory EOF }
> +
> +usage-dump-xenconfig() {
> +    cat <<EOF
> +Usage $this dump-xenconfig XENGUEST
> +
> +Dump the xen configuration of a xenguest image or directory EOF }
> +
> +usage-dump-diskconfig() {
> +    cat <<EOF
> +Usage $this dump-diskconfig XENGUEST
> +
> +Dump the disk configuration of a xenguest image or directory EOF }
> +
> +usage-extract() {
> +    cat <<EOF
> +Usage $this extract XENGUEST DESTDIR
> +
> +Extract guest to DESTDIR
> +EOF
> +}
> +
> +usage-extract-config() {
> +    cat <<EOF
> +Usage $this extract-config XENGUEST DESTDIR
> +
> +Extract guest configuration to DESTDIR
> +EOF
> +}
> +
> +usage-extract-disk-file() {
> +    cat <<EOF
> +Usage $this extract-disk-file XENGUEST DISKFILE
> +
> +Extract disk file DISKFILE to stdout.
> +EOF
> +}
> +
> +check_image() {
> +    local tstfile=3D${1}
> +
> +    if [ ! -e ${tstfile} -o ! -w ${tstfile} ]; then
> +        echo "Error: File ${tstfile} does not exist or is not writeable"
> +        exit 1
> +    fi
> +
> +    if [ -f ${tstfile} ]; then
> +        # This is a xenguest file
> +        local res=3D$(tar -tvf ${tstfile} ./guest.cfg ./disk.cfg \
> +            ./params.cfg > /dev/null 2>&1 || echo "error")
> +        if [ -n "${res}" ]; then
> +            echo "Error: File ${tstfile} is not a valid xenguest"
> +            exit 1
> +        fi
> +    elif [ -d ${tstfile} ]; then
> +        if [ ! -f ${tstfile}/guest.cfg -o ! -f  ${tstfile}/disk.cfg -o \
> +            ! ${tstfile}/params.cfg ]; then
> +            echo "Error: Directory ${tstfile} is not a valid xenguest"
> +            exit 1
> +        fi
> +    fi
> +}
> +
> +params_config_reset() {
> +    cat <<EOF > ${IMAGE_TMPDIR}/params.cfg # Xenguest-image guest
> +global configuration # # !! This file must not be modified manually !!
> +#
> +# You can use xenguest-image to modify parameters.
> +#
> +
> +# Guest auto boot during Dom0 init
> +GUEST_AUTOBOOT=3D"1"
> +EOF
> +}
> +
> +params_config_setparam() {
> +    param=3D"${1}"
> +    shift
> +    value=3D"$@"
> +
> +    if [ -z "$value" ]; then
> +        sed -i "/.*${param}=3D.*/d" ${IMAGE_TMPDIR}/params.cfg
> +    elif grep -e "^${param}=3D" ${IMAGE_TMPDIR}/params.cfg > /dev/null; =
then
> +        sed -i "s/${param}=3D\".*\"/${param}=3D\"${value}\"/" \
> +            ${IMAGE_TMPDIR}/params.cfg
> +    else
> +        echo "${param}=3D\"${value}\"" >> ${IMAGE_TMPDIR}/params.cfg
> +    fi
> +}
> +
> +xen_config_reset() {
> +    cat <<EOF > ${IMAGE_TMPDIR}/guest.cfg # Xenguest-image main
> +configuraiton # # !! This file must not be modified manually !!
> +#
> +# You can use xenguest-image to modify parameters.
> +#
> +# You can add custom entries to configuration in the guest.d directory.
> +
> +# Guest name (set by manager when guest is created) # name =3D ""
> +
> +# Guest memory size in MB
> +memory =3D 1024
> +
> +# Number of VCPUS
> +vcpus =3D 1
> +
> +# Guest command line
> +extra =3D "earlyprintk=3Dxenboot console=3Dhvc0 rw"
> +
> +# Guest root filesystem device (from guest point of view) # root =3D
> +"/dev/xvda2"
> +
> +# Disk that will be used by the guest (set by manager when guest is
> +created) # disk =3D ['phy:/dev/vg-xen/guestname,xvda,w']
> +
> +EOF
> +}
> +
> +get_param_file() {
> +    param=3D"${1}"
> +
> +    if grep ${param} ${IMAGE_TMPDIR}/guest.cfg > /dev/null 2>&1; then
> +        echo "${IMAGE_TMPDIR}/guest.cfg"
> +    else
> +        if [ ! -f ${IMAGE_TMPDIR}/guest.d/${param}.cfg ]; then
> +            mkdir -p ${IMAGE_TMPDIR}/guest.d
> +            echo "# ${param} =3D \"\"" > ${IMAGE_TMPDIR}/guest.d/${param=
}.cfg
> +        fi
> +        echo "${IMAGE_TMPDIR}/guest.d/${param}.cfg"
> +    fi
> +}
> +
> +xen_config_disable_param() {
> +    param=3D"${1}"
> +    dst=3D$(get_param_file ${param})
> +
> +    sed -i "s@.*\(${param} =3D .*\)\$@# \1@" ${dst} }
> +
> +xen_config_set_number() {
> +    param=3D"${1}"
> +    shift
> +    value=3D"$@"
> +    dst=3D$(get_param_file ${param})
> +
> +    sed -i "s@.*${param} =3D .*@${param} =3D ${value}@" ${dst} }
> +
> +xen_config_set_string() {
> +    param=3D"${1}"
> +    shift
> +    value=3D"$@"
> +    dst=3D$(get_param_file ${param})
> +
> +    sed -i "s@.*${param} =3D .*@${param} =3D \"${value}\"@" ${dst} }
> +
> +xen_config_append_string() {
> +    param=3D"${1}"
> +    shift
> +    value=3D"$@"
> +    dst=3D$(get_param_file ${param})
> +
> +    sed -i "s@.*${param} =3D \"\([^\"]*\)\"@${param} =3D \"\1 ${value}\"=
@"
> +${dst} }
> +
> +xen_config_set_list() {
> +    param=3D"${1}"
> +    shift
> +    value=3D$(echo $@ | tr " " ",")
> +    dst=3D$(get_param_file ${param})
> +
> +    sed -i "s@.*${param} =3D .*@${param} =3D ['${value}']@" ${dst} }
> +
> +disk_config_reset() {
> +    echo "DISK_SIZE=3D\"0\"" > ${IMAGE_TMPDIR}/disk.cfg
> +    echo "DISK_DEVICE=3D\"\"" >> ${IMAGE_TMPDIR}/disk.cfg }
> +
> +disk_config_rm_part() {
> +    partid=3D$1
> +    sed -i "/DISK_PART${partid}=3D.*/d" ${IMAGE_TMPDIR}/disk.cfg }
> +
> +disk_config_add_part() {
> +    partid=3D${1}
> +    partsize=3D${2}
> +    partfs=3D${3}
> +    partcont=3D${4:-}
> +
> +    # Make we don't add the same partition twice
> +    disk_config_rm_part ${partid}
> +    echo "DISK_PART${partid}=3D\"${partsize}:${partfs}:${partcont}\"" >>=
 \
> +        ${IMAGE_TMPDIR}/disk.cfg
> +}
> +
> +# We need an action as first argument
> +action=3D"${1:-}"
> +
> +if [ -z "${action}" ]; then
> +    echo "Error: No ACTION provided"
> +    usage
> +    exit 1
> +fi
> +
> +# Only help does not require a xenguest argument so treat this first #
> +while there we also check that user is asking for a supported action
> +case $action in
> +    help|--help|-h|-?)
> +        usage
> +        exit 0
> +        ;;
> +    check|create|update|pack|partial)
> +        ;;
> +    dump-xenconfig|dump-diskconfig|dump-init|dump-paramsconfig)
> +        ;;
> +    extract|extract-config|extract-disk-file)
> +        ;;
> +    *)
> +        echo "Error: Invalid action $action"
> +        exit 1
> +        ;;
> +esac
> +
> +# Second argument should be the file name or directory
> +guestfile=3D"${2:-}"
> +
> +# Handle user asking for help on a specific action case $guestfile in
> +    help|--help|-h|-?)
> +        usage-${action}
> +        exit 0
> +        ;;
> +esac
> +
> +if [ -z "${guestfile}" ]; then
> +    echo "Error: no GUESTFILE provided"
> +    usage
> +    exit 1
> +fi
> +
> +shift 2
> +
> +case ${action} in
> +    check)
> +        check_image ${guestfile}
> +        echo "Image is OK"
> +        exit 0
> +        ;;
> +    dump-paramsconfig)
> +        check_image ${guestfile}
> +        echo "Guest configuration:"
> +        if [ -f ${guestfile} ]; then
> +            tar -xOf ${guestfile} ./params.cfg
> +        else
> +            cat ${guestfile}/params.cfg
> +        fi
> +        exit 0
> +        ;;
> +    dump-xenconfig)
> +        check_image ${guestfile}
> +        echo "Xen configuration:"
> +        if [ -f ${guestfile} ]; then
> +            tar -xOf ${guestfile} ./guest.cfg ./guest.d
> +        else
> +            cat ${guestfile}/guest.cfg ${guestfile}/guest.d/*
> +        fi
> +        echo
> +        exit 0
> +        ;;
> +    dump-diskconfig)
> +        check_image ${guestfile}
> +        echo "Disk configuration:"
> +        if [ -f ${guestfile} ]; then
> +            tar -xOf ${guestfile} ./disk.cfg
> +        else
> +            cat ${guestfile}/disk.cfg
> +        fi
> +        echo
> +        exit 0
> +        ;;
> +    dump-init)
> +        check_image ${guestfile}
> +        for init in init.d init-pre init-post; do
> +            echo "=3D=3D=3D ${init} =3D=3D=3D"
> +            if [ -f ${guestfile} ]; then
> +                tar -xOf ${guestfile} ./${init} 2> /dev/null || \
> +                    echo "No ${init} scripts."
> +            else
> +                cat ${guestfile}/${init}/* 2> /dev/null || \
> +                    echo "No ${init} scripts."
> +            fi
> +            echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D"
> +            echo
> +        done
> +        exit 0
> +        ;;
> +    pack)
> +        check_image ${guestfile}
> +        if [ ! -d ${guestfile} ]; then
> +            echo "Error: Cannot pack a xenguest image"
> +            exit 1
> +        fi
> +
> +        if [ -z "${1:-}" ] || [ -f ${1} ]; then
> +            echo "Error: No destination file or already existing file"
> +            exit 1
> +        fi
> +
> +        tar -C ${guestfile} -cf ${1} .
> +        exit 0
> +        ;;
> +    extract)
> +        check_image ${guestfile}
> +        if [ ! -d ${guestfile} ]; then
> +            echo "Error: Cannot extract config from xenguest directory"
> +            exit 1
> +        fi
> +
> +        if [ -z "${1:-}" ] || [ ! -d ${1} ]; then
> +            echo "Error: No destination directory for config extract"
> +            exit 1
> +        fi
> +
> +        tar -C ${1} -xf ${guestfile}
> +        exit 0
> +        ;;
> +    extract-config)
> +        check_image ${guestfile}
> +        if [ ! -f ${guestfile} ]; then
> +            echo "Error: Cannot extract config from xenguest directory"
> +            exit 1
> +        fi
> +
> +        if [ -z "${1:-}" ] || [ ! -d ${1} ]; then
> +            echo "Error: No destination directory for config extract"
> +            exit 1
> +        fi
> +
> +        #extract all but disk files
> +        tar -C ${1} --exclude=3D'./disk' -xf ${guestfile}
> +        exit 0
> +        ;;
> +    extract-disk-file)
> +        check_image ${guestfile}
> +
> +        if [ ! -f ${guestfile} ]; then
> +            echo "Error: Cannot extract disk file from xenguest director=
y" >&2
> +            exit 1
> +        fi
> +
> +        if [ -z "${1:-}" ]; then
> +            echo "Error: No file to extract" >&2
> +            exit 1
> +        fi
> +
> +        tar -xOf ${guestfile} ./disk/${1}
> +        exit 0
> +        ;;
> +    create)
> +        if [ -f ${guestfile} ]; then
> +            echo "Error: File ${guestfile} already exist"
> +            exit 1
> +        elif [ -d ${guestfile} ]; then
> +            if [ -n "$(ls -A ${guestfile})" ]; then
> +                echo "Error: Directory ${guestfile} is not empty"
> +                exit 1
> +            fi
> +            IMAGE_TMPDIR=3D$(realpath -m ${guestfile})
> +        else
> +            IMAGE_TMPDIR=3D$(mktemp -d)
> +        fi
> +
> +        # Create initial content
> +        params_config_reset
> +        xen_config_reset
> +        disk_config_reset
> +        ;;
> +    update)
> +        check_image ${guestfile}
> +
> +        if [ -f ${guestfile} ]; then
> +            # Extract the image to update it
> +            IMAGE_TMPDIR=3D$(mktemp -d)
> +            tar -C ${IMAGE_TMPDIR} -xf ${guestfile}
> +        else
> +            IMAGE_TMPDIR=3D$(realpath -m ${guestfile})
> +        fi
> +        ;;
> +    partial)
> +        if [ -e ${guestfile} -a ! -d ${guestfile} ]; then
> +            echo "Error: Invalid partial output directory"
> +            exit 1
> +        fi
> +        mkdir -p ${guestfile}
> +        IMAGE_TMPDIR=3D$(realpath -m ${guestfile})
> +        ;;
> +    *)
> +        echo "Invalid action ${action}"
> +        usage
> +        exit 1
> +        ;;
> +esac
> +
> +# Process command line arguments
> +for arg in "${@}"; do
> +    case ${arg} in
> +        --*=3D*)
> +            optarg=3D$(echo ${arg} | sed -e "s/[^=3D]*=3D//")
> +            ;;
> +        *)
> +            optarg=3D""
> +            ;;
> +    esac
> +
> +    case ${arg} in
> +        --guest-reset-config)
> +            params_config_reset
> +            ;;
> +        --set-param=3D*=3D*)
> +            param_name=3D$(echo $optarg | sed -e "s/=3D.*//")
> +            param_value=3D$(echo $optarg | sed -e "s/[^=3D]*=3D//")
> +            params_config_setparam "$param_name" "$param_value"
> +            ;;
> +        --set-param=3D*)
> +            params_config_setparam "$optarg"
> +            ;;
> +        --xen-reset-config)
> +            xen_config_create
> +            ;;
> +        --xen-name=3D*)
> +            if [ -z "${optarg}" ]; then
> +                xen_config_disable_param "name"
> +            else
> +                xen_config_set_string "name" "${optarg}"
> +            fi
> +            ;;
> +        --xen-kernel=3D*)
> +            if [ -z "${optarg}" ]; then
> +                xen_config_disable_param "kernel"
> +                rm -f ${IMAGE_TMPDIR}/files/kernel
> +            else
> +                if [ ! -f ${optarg} ]; then
> +                    echo "Error: invalid kernel file ${optarg}"
> +                    exit 1
> +                fi
> +                xen_config_set_string "kernel" "files/kernel"
> +                mkdir -p ${IMAGE_TMPDIR}/files
> +                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/kernel
> +            fi
> +            ;;
> +        --xen-memory=3D*)
> +            xen_config_set_number "memory" ${optarg}
> +            ;;
> +        --xen-vcpus=3D*)
> +            xen_config_set_number "vcpus" ${optarg}
> +            ;;
> +        --xen-clean-extra)
> +            xen_config_set_string "extra" ""
> +            ;;
> +        --xen-extra=3D*)
> +            xen_config_append_string "extra" ${optarg}
> +            ;;
> +        --xen-root=3D*)
> +            if [ -z "${optarg}" ]; then
> +                xen_config_disable_param "root"
> +            else
> +                xen_config_set_string "root" "${optarg}"
> +            fi
> +            ;;
> +        --xen-device-tree=3D*)
> +            if [ -z "${optarg}" ]; then
> +                xen_config_disable_param "device_tree"
> +                rm -f ${IMAGE_TMPDIR}/files/guest.dtb
> +            else
> +                if [ ! -f ${optarg} ]; then
> +                    echo "Error: invalid dtb file ${optarg}"
> +                    exit 1
> +                fi
> +                xen_config_set_string "device_tree" "files/guest.dtb"
> +                mkdir -p ${IMAGE_TMPDIR}/files
> +                install -m 644 ${optarg} ${IMAGE_TMPDIR}/files/guest.dtb
> +            fi
> +            ;;
> +        --xen-disk=3D*)
> +            if [ -z "${optarg}" ]; then
> +                xen_config_disable_param "disk"
> +            else
> +                xen_config_set_list "disk" "phy:${optarg}" "xvda" "w"
> +            fi
> +            ;;
> +        --xen-append=3D*)
> +            if [ ! -f ${optarg} ]; then
> +                echo "Error: invalid xen append file ${optarg}"
> +                exit 1
> +            fi
> +            mkdir -p ${IMAGE_TMPDIR}/guest.d
> +            install -m 755 ${optarg} ${IMAGE_TMPDIR}/guest.d/.
> +            ;;
> +        --xen-add-file=3D*)
> +            src=3D$(echo "${optarg}" | sed -e "s/:.*//")
> +            dst=3D$(echo "${optarg}" | sed -e "s/.*://")
> +            if [ ! -f ${src} ]; then
> +                echo "Error: Invalid file: ${src}"
> +                rm -rf ${IMAGE_TMPDIR}
> +                exit 1
> +            fi
> +            if [ -z "${dst}" ]; then
> +                dst=3D$(basename ${src})
> +            fi
> +            mkdir -p ${IMAGE_TMPDIR}/files/$(dirname ${dst})
> +            cp -f ${src} ${IMAGE_TMPDIR}/files/${dst}
> +            ;;
> +        --xen-rm-file=3D*)
> +            rm -f ${IMAGE_TMPDIR}/files/${optarg}
> +            ;;
> +        --init-script=3D*|--init-pre=3D*|--init-post=3D*)
> +            dst=3D""
> +            case $arg in
> +                --init-script=3D*)
> +                    dst=3D"init.d"
> +                    ;;
> +                --init-pre=3D*)
> +                    dst=3D"init.pre"
> +                    ;;
> +                --init-post=3D*)
> +                    dst=3D"init.post"
> +                    ;;
> +            esac
> +            if [ ! -f ${optarg} ]; then
> +                echo "${optarg} does not point to a valid file"
> +                exit 1
> +            else
> +                mkdir -p ${IMAGE_TMPDIR}/${dst}
> +                install -m 755 ${optarg} ${IMAGE_TMPDIR}/${dst}/.
> +            fi
> +            ;;
> +        --disk-reset-config)
> +            disk_config_reset
> +            ;;
> +        --disk-size=3D*)
> +            sed -i "s/DISK_SIZE=3D.*/DISK_SIZE=3D\"${optarg}\"/" \
> +                ${IMAGE_TMPDIR}/disk.cfg
> +            ;;
> +        --disk-device=3D*)
> +            sed -i "s/DISK_DEVICE=3D.*/DISK_SIZE=3D\"${optarg}\"/" \
> +                ${IMAGE_TMPDIR}/disk.cfg
> +            ;;
> +        --disk-add-part=3D*)
> +            disk_config_add_part $(echo "${optarg}" | tr ":" " ")
> +            ;;
> +        --disk-rm-part=3D*)
> +            disk_config_rm_part ${optarg}
> +            ;;
> +        --disk-add-file=3D*)
> +            src=3D$(echo "${optarg}" | sed -e "s/:.*//")
> +            dst=3D$(echo "${optarg}" | sed -e "s/.*://")
> +            if [ ! -f ${src} ]; then
> +                echo "Error: Invalid disk file: ${src}"
> +                rm -rf ${IMAGE_TMPDIR}
> +                exit 1
> +            fi
> +            if [ -z "${dst}" ]; then
> +                dst=3D$(basename ${src})
> +            fi
> +            mkdir -p ${IMAGE_TMPDIR}/disk/$(dirname ${dst})
> +            cp -f ${src} ${IMAGE_TMPDIR}/disk/${dst}
> +            ;;
> +        --disk-rm-file=3D*)
> +            rm -f ${IMAGE_TMPDIR}/disk/${optarg}
> +            ;;
> +        *)
> +            echo "Unsupported command: ${arg}"
> +            exit 1
> +            ;;
> +    esac
> +done
> +
> +if [ ! -d ${guestfile} ]; then
> +    # If the original guest was in a file we need to repack the file
> +    # with the changes we did on it in the IMAGE_TMPDIR
> +    rm -f ${guestfile}
> +    tar -C ${IMAGE_TMPDIR} -cf ${guestfile} .
> +    rm -rf ${IMAGE_TMPDIR}
> +fi
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> mkimage.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-
> mkimage.bb
> new file mode 100644
> index 0000000..6ea5fb1
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
> @@ -0,0 +1,31 @@
> +# Xenguest mkimage recipe
> +#
> +# xenguest-mkimage is a tool to create/modify images to be used as xen
> +guests # Produced images contains a xen configuration and several
> +optional components # (kernel, device-tree, disk definition and files,
> +init scripts) which all # together fully define a full xen guest
> +
> +DESCRIPTION =3D "Xenguest mkimage tool"
> +LICENSE =3D "MIT"
> +
> +SRC_URI =3D "file://xenguest-mkimage"
> +
> +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b
> 4f302"
> +
> +S =3D "${WORKDIR}"
> +
> +# Can be built native also to produce xenguest images during Yocto
> +build BBCLASSEXTEND =3D "native"
> +
> +do_configure[noexec] =3D "1"
> +do_compile[noexec] =3D "1"
> +
> +do_install() {
> +    install -d -m 755 ${D}${bindir}
> +    install -m 755 xenguest-mkimage ${D}${bindir}/.
> +}
> +
> +# We need bash and tar
> +RDEPENDS_${PN} =3D "bash tar"
> +FILES_${PN} =3D "${bindir}/xenguest-mkimage"
> +
> --
> 2.17.1

