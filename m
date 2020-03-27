Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.58])
 by mx.groups.io with SMTP id smtpd.web12.14214.1585322658821160382
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2020 08:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aJW9mgNT;
 spf=pass (domain: arm.com, ip: 40.107.15.58, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koLfVr4tF0ke4NxecfV/3qEHRLdSRlivAmKZsip+GjI=;
 b=aJW9mgNTIRzAHaq7dRHImNTZIZHJM/uq4Ni+j/0rKih74nOR04pNL+XD826Ev2oUZFFv7FKSEYcLbl0XZ5DZeTmM/KgH5Xgjy2Io7lZWUoYyky9vsT2v0mQm4PK2KC+jUJKWrugRKUJFc5Cegieg3CIj273k6cmT19WnxeCxUGo=
Received: from VI1PR08CA0136.eurprd08.prod.outlook.com (2603:10a6:800:d5::14)
 by AM6PR08MB3238.eurprd08.prod.outlook.com (2603:10a6:209:45::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 15:24:12 +0000
Received: from VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:800:d5:cafe::4d) by VI1PR08CA0136.outlook.office365.com
 (2603:10a6:800:d5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Fri, 27 Mar 2020 15:24:12 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT028.mail.protection.outlook.com (10.152.18.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Fri, 27 Mar 2020 15:24:12 +0000
Received: ("Tessian outbound 66307db0259d:v48"); Fri, 27 Mar 2020 15:24:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from 57f0a1b66286.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AE3DD405-F9CF-40AA-ADA6-0FCAE34620DE.1;
	Fri, 27 Mar 2020 15:24:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 57f0a1b66286.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 27 Mar 2020 15:24:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAy0Jcuc0hF+9P/VxRj6HryWh6TOQlE2HBSTxHN2pf0sZni/Fr6NP4EZxvIqQh26gTqOo5cTPMqA53TG98ps2Qbjqi2uNotnvYVCQzhprmz2JIfYVpvdD92m2AoqspOuar6U0xWsvrm4DuXrWRbqZTGH6Pqa4BnfPhLHsCPLWJ7OoxKzy6M0ndj+TXfgtu+58Ppl/OlgZj5mtn73mIPF+9LVdpzkIxNNfKFxfdPMPOzo75RlqJN75s1MLzXgvQxlpZ3+0ta4PS0gyDDTCMtdnHkuKxXvHWxvBROpoBoRmiK9M9ipcHpF2M4aVej/O+a6/ot3R4b9aWf8ETlE4vAzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koLfVr4tF0ke4NxecfV/3qEHRLdSRlivAmKZsip+GjI=;
 b=FHGVZYOr+psiMwb2+LGCkaD3GgZb5iHIedh+vp3ubq4PXtTAI9sQCGN2VBKZiBbzRjSKVTPbawZ2o6pR5EhcjblCPQJKR6rfzdAArFic6JEwObVKpkfWg5DIpi/wdgGISdH3NwBm9HPYdiZRwU3Y9+QasUyqLw4bFnctXbsTJK49yktieR8z+XrqRcKp4fF1qGegBtS7YHbun3+zd+3zMybSZKHycS+VWsH+UNuieY8AZxeV5it8c2YdieyOZx66euq4em1RmfsOWj/zOWj8Q41WKwS5m3oD+NMd38yEfI45ljp15ce6eeqYyoPjDeaLK8vCY4E7b+zgwgdDXIQRxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koLfVr4tF0ke4NxecfV/3qEHRLdSRlivAmKZsip+GjI=;
 b=aJW9mgNTIRzAHaq7dRHImNTZIZHJM/uq4Ni+j/0rKih74nOR04pNL+XD826Ev2oUZFFv7FKSEYcLbl0XZ5DZeTmM/KgH5Xgjy2Io7lZWUoYyky9vsT2v0mQm4PK2KC+jUJKWrugRKUJFc5Cegieg3CIj273k6cmT19WnxeCxUGo=
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (20.178.203.79) by
 AM0PR08MB4513.eurprd08.prod.outlook.com (20.179.36.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 15:24:05 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::6c66:5717:22fe:4791%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 15:24:05 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 7/7] arm-autonomy: Create xen-devicetree recipe
Thread-Topic: [meta-arm] [PATCH 7/7] arm-autonomy: Create xen-devicetree
 recipe
Thread-Index: AQHWBCWheF9cuw5EcUeNI76dLqiI2ahcjw8g
Date: Fri, 27 Mar 2020 15:24:05 +0000
Message-ID: 
 <AM0PR08MB3987EB081DD4FC2AE8CEF73D92CC0@AM0PR08MB3987.eurprd08.prod.outlook.com>
References: <20200327105010.400-1-bertrand.marquis@arm.com>
 <20200327105010.400-8-bertrand.marquis@arm.com>
In-Reply-To: <20200327105010.400-8-bertrand.marquis@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 45b62a9e-c271-4d0f-b4bd-6a398dfb8095.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
x-originating-ip: [5.68.4.242]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ec3f559-7a4f-4393-ab28-08d7d262e724
x-ms-traffictypediagnostic: AM0PR08MB4513:|AM6PR08MB3238:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB32381F866216A08C7BBAB93792CC0@AM6PR08MB3238.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1227;OLM:1227;
x-forefront-prvs: 0355F3A3AE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(55016002)(66446008)(9686003)(76116006)(26005)(81166006)(81156014)(6916009)(52536014)(33656002)(71200400001)(4326008)(316002)(5660300002)(8676002)(64756008)(66946007)(8936002)(478600001)(66476007)(53546011)(86362001)(30864003)(7696005)(55236004)(2906002)(66556008)(186003)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 avpeIBR27q4eP62MTdGHv49ZX+E8jkVOGf+928CFsswrxWNGgBFHrW637f0rDMnj+gvu7SQ8MG4Rf8KzzA+LZXoqGmpC2tsG0skqQCCVuIxTZR0CGgeLCXTQXk3n24IAYRUsGHO7AaKqB8uDNr/a20hMG/2kYQEdjtGM3ZPsLwN8JucHvM/IbKBTvYDNX2cI90WvQNS9u6xDgo8lrTmkejdxHqn6TpupE1hFjkFkfXYWdWbvHt0szdQc6lHLcIhBzhkpl+3MyrrYvNWicd2C4UMyxOYXxu9yv/IqXUTwTee/OMdSoIfoA/mar5kglm3WOa6zNkmFS1w9no07oo+NJwDR68FUThwYdER9HID/DGfg+NL3DYPloR8ICbP7ogtEGw8bIJ0MF7cSRF8Z1MLe4/xxqrXcklLAzkLHlKwGt7NUtpNa6UdJMxOOpUdOK0oI6/gikcDqso0WW+eMzoYeDHwDzIMw7XJg6LmKv4IhaARkWfwylCK6AROIRSofXeoO4ID6m6yEKubhGq45hG/UEf+h4tT2w3/hoQ7HQ7hgDzK3m+lk+C/9G67zWFh7hAAqykCYtprG+i88g9w6iRZNu1X00b6TXXNu/qz4d+WeW1IM1OvNvd4uObuv1zaByALsgMI+7k+uihFZ2ztqMODq6A==
x-ms-exchange-antispam-messagedata: 
 2COgQiHjOYKCMfnTaUzMLKdzdCxTawd31qgLdoTS5vw7OTl1/5WlYdnXDXpaT/H3xEExGgus8ps+01uCSDgDH6VZMhbPBQTxAyhf6XNADqtqCpENUcdtS0JzRTDzb1aGxQ4PuumpGdTzl1lraV8ppA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4513
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Diego.Sueiro@arm.com; 
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10001)(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(53546011)(186003)(356004)(7696005)(33656002)(82740400003)(26005)(47076004)(70206006)(70586007)(52536014)(5660300002)(2906002)(30864003)(36906005)(6506007)(6916009)(478600001)(9686003)(4326008)(55016002)(336012)(81156014)(8936002)(81166006)(26826003)(316002)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	621d5c3b-c4ba-45e8-434f-08d7d262e2fc
X-Forefront-PRVS: 0355F3A3AE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TAnTIo3XzNZFC+p0/cvD4WupLBhemV822n4aBl7UcnY6BaZGNtp9+XpHXek7KJ+E3juyUPUNW9HeID/kT+MnFNlFYTvVP4i96QOEfSwWGRfDGJ3dV0fKXdQjCF2pbV74ehJWUMj7FfN86uzO1/NOGI1Mc5xh1A67vw/rU3+GQGOAshKmuyVulgSYdwwpx0ofsn5J+w3tEHgmYJiMrYEJWOk6/ZFPCt6vEsAObNtgP7Tha1DWCrGwBsqdzAjYEbmW4iz6873HcWR9AvCUWk4WXaLTfAR90wBC+tVFDh60xBN1GTja9VERbvh5cKOulQuAMdg6FPhM+547yJyyLkiKlPk2zsF3WKI7k7pKoMzt58OhHE+3o/m+is7KdDstg14EOX4JYcDYFKPL/EKFl5l5c7lSIheDQe1djDrvpzTcijS/gRQGp0y0O598l8KpzTDFU/vaA6SYVRAcbI0ZZjwb9GrzivTU5A0FfVkVUn7SIbRx3ilBEogPeusx8rsmzaNo5FGjlqvL30vKynHA+1o3PBcdMRc49AIOcOol2kzwEwHqt7XtLhljAgcuF0R8aqrhb3sk7lzY1h9I7S80RiV4atfS3MnkjI1LJIuzD8P8BrYelTo1NEx8CzJc5mswrPk1yxO6Tm2aXrOWlo0uAPCjbIg1+S6EqjMYfOOXUuggw+jQeOBl9gIeooy/Gmgt/DTxW1yi0yI44bV1s4OR0TSFzw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 15:24:12.1371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec3f559-7a4f-4393-ab28-08d7d262e724
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3238
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
> On Behalf Of Bertrand Marquis via Lists.Yoctoproject.Org
> Sent: 27 March 2020 10:50
> To: meta-arm@lists.yoctoproject.org
> Cc: nd <nd@arm.com>
> Subject: [meta-arm] [PATCH 7/7] arm-autonomy: Create xen-devicetree recip=
e
>=20
> Create a xen-devicetree recipe to add entries required to boot Xen and a
> Dom0 inside a DTB.
> The recipe is introducing XEN_DEVICETREE_* parameters to define the xen
> command line, the dom0 command line, the dom0 memory size, the dom0
> kernel load address and size.
> The recipe can also be extended using bbappend to adapt the device tree a=
nd
> the parameters.
> Adaptation are provided to support Juno, fvp-base and foundation-armv8
> boards from meta-arm-bsp.
> Add xen-devicetree as EXTRA_IMAGEDEPENDS to arm-autonomy-host-image-
> minimal
>=20
> Change-Id: Ibcfbd02c2377a9abcbd20caa47ea833b5308fbac
> Issue-Id: SCM-767
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

> ---
>  meta-arm-autonomy/README.md                   |   4 +
>  .../documentation/xen-devicetree.md           | 104 ++++++++++++++++++
>  .../images/arm-autonomy-host-image-minimal.bb |   3 +
>  .../xen-devicetree/files/xen-juno.dtsi        |  11 ++
>  .../xen-devicetree/files/xen.dtsi.in          |  17 +++
>  .../xen-devicetree/xen-devicetree.bb          |  68 ++++++++++++
>  .../xen-devicetree/xen-devicetree.bbappend    |  18 +++
>  7 files changed, 225 insertions(+)
>  create mode 100644 meta-arm-autonomy/documentation/xen-devicetree.md
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-
> devicetree/files/xen-juno.dtsi
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-
> devicetree/files/xen.dtsi.in
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-
> devicetree/xen-devicetree.bb
>  create mode 100644 meta-arm-autonomy/recipes-extended/xen-
> devicetree/xen-devicetree.bbappend
>=20
> diff --git a/meta-arm-autonomy/README.md b/meta-arm-
> autonomy/README.md index 9b12993..78a7281 100644
> --- a/meta-arm-autonomy/README.md
> +++ b/meta-arm-autonomy/README.md
> @@ -40,6 +40,7 @@ Each recipe introducing such variables has a chapter
> "Bitbake parameters" in  its documentation.
>=20
>  Those documentation files should be checked for variables:
> +- [xen-devicetree](documentation/xen-devicetree.md)
>=20
>  BSPs
>  ----
> @@ -63,6 +64,9 @@ Recipes and classes
>  -------------------
>  This layer is adding the following recipes and classes:
>=20
> +* [xen-devicetree](documentation/xen-devicetree.md): this is a recipe
> +to modify
> +  a device tree blob to add information required to boot xen and a Dom0 =
linux.
> +
>  Contributing
>  ------------
>  This project has not put in place a process for contributions currently.=
 If you
> diff --git a/meta-arm-autonomy/documentation/xen-devicetree.md b/meta-
> arm-autonomy/documentation/xen-devicetree.md
> new file mode 100644
> index 0000000..a44dca7
> --- /dev/null
> +++ b/meta-arm-autonomy/documentation/xen-devicetree.md
> @@ -0,0 +1,104 @@
> +Xen device tree
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +------------
> +
> +xen-devicetree recipe can be used to modify an existing Device Tree
> +Blob, produced by Linux kernel or another recipe, to include in it
> +entries required to start Xen and a Dom0 Linux on top of it.
> +
> +The recipe will do the following processing:
> +- generate a xen.dtsi file with entries required for xen based on
> +parameters
> +- turn DTBs in ${XEN_DEVICETREE_DTBS} back to dts
> +- include in xen.dtsi and all other dtsi from
> +  ${XEN_DEVICETREE_DTSI_MERGE} (check Bitbake parameters for more
> +information
> +  on this).
> +- use dtc to create a new DTB file
> +
> +The recipe will generate new files in deploy/images and name them with
> +the extension "-xen.dtb".
> +For example **machine.dtb** will generate **machine-xen.dtb**.
> +
> +Entries added to the DTBs
> +-------------------------
> +
> +When a DTB is processed by the recipe, the following block is added:
> +```
> +    chosen {
> +        xen,dom0-bootargs =3D "VAL";
> +        xen,xen-bootargs =3D "VAL";
> +
> +        modules {
> +            #size-cells =3D <0x00000001>;
> +            #address-cells =3D <0x00000001>;
> +
> +            module@0 {
> +                reg =3D <VAL VAL>;
> +                compatible =3D "multiboot,module";
> +            };
> +        };
> +    };
> +```
> +Each occurence of **VAL** is replaced by the content of the variables
> +listed in this documentation.
> +
> +Bitbake parameters
> +------------------
> +
> +Several parameters are available to configure the xen-devicetree during
> +Yocto project compilation (those can be set in your project local.conf, =
for
> exmple).
> +
> +The following parameters are available:
> +
> +- XEN_DEVICETREE_DEPEND: This variable can be used to indicate which
> +recipe
> +  task is generating the DTBs that xen-devicetree will modify. This
> +makes sure
> +  the xen devicetrees are properly regenerated if the source DTBs are ch=
anged.
> +  This variable is set by default to "virtual/kernel:do_deploy" to use
> +DTBs
> +  generated during the compilation of the Linux kernel. This must be
> +changed
> +  if the machine your are using is not using a DTB listed in
> KERNEL_DEVICETREE.
> +
> +- XEN_DEVICETREE_DTBS: This should be set to the list of DTBs you want
> +to be
> +  modified by xen-devicetree. Those must be files that xen-devicetree
> +can find
> +  in the ${DEPLOY_DIR_IMAGE} directory using only the basename of the
> entries.
> +  For example "mydir/board.dtb" will make the recipe look for
> +  ${DEPLOY_DIR_IMAGE}/board.dtb.
> +  This variable is set by default to "${KERNEL_DEVICETREE}" to process
> +the DTBs
> +  generated by the Linux kernel.
> +
> +- XEN_DEVICETREE_DOM0_MEM: Memory size to allocate to Dom0.
> +  This variable is only used if XEN_DEVICETREE_XEN_BOOTARGS has a value
> +  containing "dom0_mem=3D${XEN_DEVICETREE_DOM0_MEM}" as the
> memory
> +assigned to
> +  dom0 is defined using Xen boot arguments.
> +  This variable is set by default to "1024M".
> +
> +- XEN_DEVICETREE_DOM0_BOOTARGS: Boot arguments to pass to Dom0
> Linux
> +when
> +  booting it.
> +  This variable is set by default to "console=3Dhvc0 earlycon=3Dxen".
> +
> +- XEN_DEVICETREE_XEN_BOOTARGS: this variable should be set with the
> +boot
> +  arguments to be passed to Xen on boot.
> +  This variable is set by default to
> +  "noreboot dom0_mem=3D${XEN_DEVICETREE_DOM0_MEM}".
> +
> +- XEN_DEVICETREE_DOM0_ADDR: This is the address from which the Linux
> +kernel to
> +  be used for Dom0 will be copied. When using u-boot, this is the
> +address at
> +  which you will load the kernel Image before starting Xen.
> +  This variable is set by default to "0x80080000".
> +
> +- XEN_DEVICETREE_DOM0_SIZE: This is the size of the kernel loaded at
> +  ${XEN_DEVICETREE_DOM0_ADDR}. Xen will copy this amount of data inside
> +the
> +  guest before starting it so the size must be at least equal to the
> +kernel
> +  size but can be bigger. You must be careful not to have a value too
> +big as it
> +  could slow down boot or copy other parts with it (like the DTB).
> +  You might need to increase this if you use a kernel with a bundled ini=
tramfs.
> +  This variable is set by default to "0x01000000".
> +
> +- XEN_DEVICETREE_DTSI_MERGE: This variable contains the list of dtsi
> +files that
> +  must be included inside the generated DTB file. By default the only
> +one
> +  include is the "xen.dtsi" generated by the recipe.
> +  If your board or project needs to include more fixes or entries in
> +the DTB,
> +  this variable can be appended from a bbappend file to include other
> +dtsi. The
> +  files must be inside the recipe workspace during Yocto compilation.
> +  You can check xen-devicetree.bbappend for an example.
> +
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-
> image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-
> autonomy-host-image-minimal.bb
> index fb0a0b7..5e09eac 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> minimal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-
> mini
> +++ mal.bb
> @@ -18,6 +18,9 @@ IMAGE_INSTALL +=3D " \
>      qemu \
>      "
>=20
> +# Build xen-devicetree to produce a xen ready devicetree
> +EXTRA_IMAGEDEPENDS +=3D "xen-devicetree"
> +
>  python __anonymous() {
>      if bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', False, =
True,
> d):
>          raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'arm=
-
> autonomy-host'") diff --git a/meta-arm-autonomy/recipes-extended/xen-
> devicetree/files/xen-juno.dtsi b/meta-arm-autonomy/recipes-extended/xen-
> devicetree/files/xen-juno.dtsi
> new file mode 100644
> index 0000000..0f9af21
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen-juno.d
> +++ tsi
> @@ -0,0 +1,11 @@
> +/*
> + * Disable IOMMU on juno board when Xen is used  */
> +
> +/ {
> +
> +	/* turn off iommu */
> +	iommu@2b600000 {
> +		status =3D "disabled";
> +	};
> +};
> diff --git a/meta-arm-autonomy/recipes-extended/xen-
> devicetree/files/xen.dtsi.in b/meta-arm-autonomy/recipes-extended/xen-
> devicetree/files/xen.dtsi.in
> new file mode 100644
> index 0000000..42d12fa
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/files/xen.dtsi.i
> +++ n
> @@ -0,0 +1,17 @@
> +/ {
> +    chosen {
> +        xen,dom0-bootargs =3D "###XEN_DOM0_BOOTARGS###";
> +        xen,xen-bootargs =3D "###XEN_XEN_BOOTARGS###";
> +
> +        modules {
> +            #size-cells =3D <0x00000001>;
> +            #address-cells =3D <0x00000001>;
> +
> +            module@0 {
> +                reg =3D <###XEN_DOM0_ADDR### ###XEN_DOM0_SIZE###>;
> +                compatible =3D "multiboot,module";
> +            };
> +        };
> +    };
> +};
> +
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> devicetree.bb
> new file mode 100644
> index 0000000..0bb9def
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.b
> +++ b
> @@ -0,0 +1,68 @@
> +# This recipe can be used to modify one or several DTBS to add #
> +entries required to declare and boot Linux as Dom0 from Xen
> +
> +SRC_URI =3D "file://xen.dtsi.in"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "\
> +
> file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f
> 302 \
> +    "
> +
> +S =3D "${WORKDIR}"
> +
> +DESCRIPTION =3D "Add entries in DTB for Xen and Dom0"
> +
> +# Please refer to documentation/xen-devicetree.md for documentation on
> +those # parameters XEN_DEVICETREE_DEPEND ?=3D "virtual/kernel:do_deploy"
> +XEN_DEVICETREE_DTBS ?=3D "${KERNEL_DEVICETREE}"
> +XEN_DEVICETREE_XEN_BOOTARGS ?=3D "noreboot
> dom0_mem=3D${XEN_DEVICETREE_DOM0_MEM}"
> +XEN_DEVICETREE_DOM0_MEM ?=3D "1024M"
> +XEN_DEVICETREE_DOM0_BOOTARGS ?=3D "console=3Dhvc0 earlycon=3Dxen"
> +XEN_DEVICETREE_DOM0_ADDR ?=3D "0x80080000"
> +XEN_DEVICETREE_DOM0_SIZE ?=3D "0x01000000"
> +XEN_DEVICETREE_DTSI_MERGE ?=3D "xen.dtsi"
> +
> +# Our package does not generate any package for the rootfs but
> +contributes to # deploy inherit nopackages deploy
> +
> +DEPENDS +=3D "dtc-native"
> +
> +do_compile() {
> +    cat ${WORKDIR}/xen.dtsi.in \
> +        | sed -e
> "s,###XEN_DOM0_BOOTARGS###,${XEN_DEVICETREE_DOM0_BOOTARGS}," \
> +        | sed -e
> "s,###XEN_XEN_BOOTARGS###,${XEN_DEVICETREE_XEN_BOOTARGS}," \
> +        | sed -e
> "s,###XEN_DOM0_ADDR###,${XEN_DEVICETREE_DOM0_ADDR}," \
> +        | sed -e "s,###XEN_DOM0_SIZE###,${XEN_DEVICETREE_DOM0_SIZE}," \
> +        > ${WORKDIR}/xen.dtsi
> +
> +    # Generate final dtbs
> +    for dtbf in ${XEN_DEVICETREE_DTBS}; do
> +        rdtb=3D`basename $dtbf`
> +        if [ ! -f ${DEPLOY_DIR_IMAGE}/$rdtb ]; then
> +            die "Wrong file in XEN_DEVICETREE_DTBS:
> ${DEPLOY_DIR_IMAGE}/$rdtb does not exist"
> +        fi
> +        dtc -I dtb -O dts -o ${WORKDIR}/dom0-linux.dts
> + ${DEPLOY_DIR_IMAGE}/$rdtb
> +
> +        # Add external includes
> +        for inc in ${XEN_DEVICETREE_DTSI_MERGE}; do
> +            echo "/include/ \"$inc\"" >> ${WORKDIR}/dom0-linux.dts
> +        done
> +
> +        rdtbnoextn=3D`basename $dtbf ".dtb"`
> +        dtc -I dts -O dtb \
> +            -o ${WORKDIR}/${rdtbnoextn}-xen.dtb ${WORKDIR}/dom0-linux.dt=
s
> +    done
> +}
> +do_compile[depends] +=3D "${XEN_DEVICETREE_DEPEND}"
> +
> +do_deploy() {
> +    # install generated dtbs
> +    for dtbf in ${XEN_DEVICETREE_DTBS}; do
> +        rdtbnoextn=3D`basename $dtbf ".dtb"`
> +        install -m 644 ${rdtbnoextn}-xen.dtb ${DEPLOYDIR}/.
> +    done
> +}
> +
> +addtask deploy before do_build after do_compile
> diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-
> devicetree.bbappend b/meta-arm-autonomy/recipes-extended/xen-
> devicetree/xen-devicetree.bbappend
> new file mode 100644
> index 0000000..191cb13
> --- /dev/null
> +++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.b
> +++ bappend
> @@ -0,0 +1,18 @@
> +# Platform dependent parameters
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> +
> +# Add a dtb snippet to turn off iommu in dom0 on Juno board
> +SRC_URI_append_juno =3D " file://xen-juno.dtsi"
> +XEN_DEVICETREE_DTSI_MERGE_append_juno =3D " xen-juno.dtsi"
> +
> +# Board specific configs
> +XEN_DEVICETREE_DOM0_BOOTARGS_append_juno =3D " root=3D/dev/sda1
> rootwait"
> +XEN_DEVICETREE_XEN_BOOTARGS_append_juno =3D " console=3Ddtuart
> dtuart=3Dserial0 bootscrub=3D0 iommu=3Dno"
> +
> +XEN_DEVICETREE_DOM0_BOOTARGS_append_fvp-base =3D " root=3D/dev/vda2"
> +XEN_DEVICETREE_XEN_BOOTARGS_append_fvp-base =3D " console=3Ddtuart
> dtuart=3Dserial0 bootscrub=3D0"
> +
> +XEN_DEVICETREE_DOM0_BOOTARGS_append_foundation-armv8 =3D "
> root=3D/dev/vda2"
> +XEN_DEVICETREE_XEN_BOOTARGS_append_foundation-armv8 =3D "
> console=3Ddtuart dtuart=3Dserial0 bootscrub=3D0"
> +
> --
> 2.17.1

