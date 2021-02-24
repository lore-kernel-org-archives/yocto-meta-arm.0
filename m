Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.130])
 by mx.groups.io with SMTP id smtpd.web08.4116.1614152169877534517
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Feb 2021 23:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@honeywell.com header.s=selector1 header.b=kZ2+pjOo;
 spf=pass (domain: honeywell.com, ip: 40.107.237.130, mailfrom: ravindra.ankam@honeywell.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/C/+9G0oybYnAk9VNiq9NVXcKMfy/23/KCEIVgv/b7icxmrPlh5Q17ZxYeSOwqgnVVKQUkqFkfGccZhvD0vpnZsXvVcrXMx9p2qoXEocLznxS9fXVFQPl+KlzKuaA5UFmV5H73Xb7wVefuMXJusocTscdV2yYDoPA4YKhwxsmD6x9E/k6e+jxlRmsGAXFKq906N3OsChTtBcd4EOrz3sOMtyE0IeLMCDkJ0nB0eUulEEExGoVDIH8g0kQr9zTy6qZrV75+Tc5+H6QBm9wGkWWx2+e9Oer5pwyfCHUPylRv3BsxQGvyL7GvWqX3p6IJGeNh9s17qIgQp/1UAkt9AFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBZnIoq+cd2BWguJA+RtmMDgAubpuKuXdvc72ZjhQqw=;
 b=ZJyVJUnjnZ6IpfeB1gIWVTgFpWXoifESJ7JeSd7bwVLsh6u0fhh0omknEQMUqdqlur8bTlVShIpAObMwdEyaWnPnmDZwEPxIBAoL7lCSqubgWnYzijTqTyicfuPCRgMef3xha0s5QxIibqeCPjBUQdFHvyUl5Zqr+NO9ZDL7bRT4iyBAVy2Re3FGJ3Ua0VCyX6yWUPhTHTvucrToq5lmoO+rk+z5tGT40TWt26oJC2dID5WMDx0DSchVSouEmo/VRLxLsX0MT0+lX4eNfI8Cy9Oaw388K/IHU00gigZUbwPkjFmTzGT2451sqMc7/ACklELgIJrljYEwd+gyFIkZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=honeywell.com; dmarc=pass action=none
 header.from=honeywell.com; dkim=pass header.d=honeywell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Honeywell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBZnIoq+cd2BWguJA+RtmMDgAubpuKuXdvc72ZjhQqw=;
 b=kZ2+pjOotawtdwzqz4cCM0oADz4UPRre8fVHtMY8HvZ2266NO7L8D18tJ03mNrzQ/kBgw7R6PRlB5j9eaQKtMCU7yEcDN+THknYLNg8VHdEMsdUm4bn2rerFqAqXLF8BCBKdwGXwcHo6v+CocrQsEll5E64xg9Ia81dNm8q5SuU=
Received: from SN1PR07MB3949.namprd07.prod.outlook.com (2603:10b6:802:25::17)
 by SN6PR07MB4781.namprd07.prod.outlook.com (2603:10b6:805:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Wed, 24 Feb
 2021 07:36:07 +0000
Received: from SN1PR07MB3949.namprd07.prod.outlook.com
 ([fe80::c430:69d7:6d:82bf]) by SN1PR07MB3949.namprd07.prod.outlook.com
 ([fe80::c430:69d7:6d:82bf%2]) with mapi id 15.20.3868.027; Wed, 24 Feb 2021
 07:36:07 +0000
From: "Ankam, Ravindra" <Ravindra.Ankam@Honeywell.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [External] Re: [meta-arm] Error while building the custom image
Thread-Topic: [External] Re: [meta-arm] Error while building the custom image
Thread-Index: AdcJ8rX5nImPUeNeTLiDcvVgqT387wALHC0AABgJYyA=
Date: Wed, 24 Feb 2021 07:36:07 +0000
Message-ID: 
 <SN1PR07MB3949ECD1DCEECFDA163FD3E1819F9@SN1PR07MB3949.namprd07.prod.outlook.com>
References: 
 <SN1PR07MB39493750FC8337D03E5E87DE81809@SN1PR07MB3949.namprd07.prod.outlook.com>
 <20210223200454.GA4892@denix.org>
In-Reply-To: <20210223200454.GA4892@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.0.60
dlp-reaction: no-action
msip_labels: MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Enabled=true;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SetDate=2021-02-24T07:36:04Z;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Method=Standard;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Name=d546e5e1-5d42-4630-bacd-c69bfdcbd5e8;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SiteId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ActionId=c08c17bf-78f4-4a51-a928-a61c44f90833;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ContentBits=0
smarttag: 4
authentication-results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=Honeywell.com;
x-originating-ip: [49.207.214.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9bd7e0b8-bf99-4189-c76b-08d8d896d950
x-ms-traffictypediagnostic: SN6PR07MB4781:
x-microsoft-antispam-prvs: 
 <SN6PR07MB478160E1A146D54DF64282FE819F9@SN6PR07MB4781.namprd07.prod.outlook.com>
x-antispam: TRUE
x-recptdomain: NotTLSDomain
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PMf0jL/glprTK4p8ckuYfE+FtZ4ZEb8132+L7lq//6qQmAj3w+e5d+ZygtiFMAsdPJhvQlU/59EWHMR1apa+IC4HINFSPFzMqx5jJxW+Jz2gaFiiFQsY8KMRBw+3wYnFIbP4OfLOU+qqCASPDxUdOul1cgajXDSNx9ayuQVffEWTYnCWsOHIWYQGj2+jPB+bdG8tWJPDktWn0UoHs+y8IJVmjlkRjykcZVO4X45cz73gw019Cl8jSVT7eoYEeRXRwlhpr+n5C//ojPGpmofijvi9WJOvuMw8HQFo7V8dhB88J3SKjhMru+9LjV7/8StK+B0mh6+ZRMB0n5Xa/ZSnBSkOt9Rcw2ZNKhPBkijkElEevXzA3Jg7EZLIGA/9+dyZxYgvt0bWlR3KTCntFxLVMLICgndw+EJbUZDWZcMmtsOETkCktKlCTA5YYkR06pQQbqtVlwdOFz7F9Fs/oMDtgb0qKkcgUVJJMbqxVLgnBUZLgzBqrzXzQoLrpeEd8J8jjCz4YLvn5EYaBQnmRls2ZkzeigG6RRniJZKXRFnFGC2UpirVH4q2RW9AkpcHAzi3xcCJVgCIGuVQ4ORs8uafp+PGs7VKqSQd1fPLYG3PxWg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07MB3949.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(8936002)(53546011)(7696005)(4326008)(8676002)(186003)(6506007)(26005)(66946007)(55236004)(30864003)(9686003)(55016002)(33656002)(478600001)(71200400001)(5660300002)(66556008)(52536014)(66446008)(66476007)(64756008)(86362001)(2906002)(316002)(966005)(66574015)(83380400001)(6916009)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?TvSRf+5bpso3uoNWkyW5UeUbx3nYPCVTzHCdnNpSIV/fM5yqklzbfX3Ylgc/?=
 =?us-ascii?Q?ztaLoQRMEtwN2HKskklYhynwTaCJNNONYREPaXihnNXKAfjnla+Hm2dnRXYt?=
 =?us-ascii?Q?SZdrX8M17BGzAGwEcx7Ifc4bbWHWw+P6DRQ0vbW18MBKx/IxAbnxby3g0gv/?=
 =?us-ascii?Q?WkPzYuGItsmv5RGnz/ujWKpIo03KWwen7nF+eUVhJmZ6q19Q77nbr6nJxSXx?=
 =?us-ascii?Q?994YxJ7wbFmzrdPjYRNr/8LDfQ1hoCfLSj6t9gVKBja9l6efGZhbqz1pWv2f?=
 =?us-ascii?Q?aPDdkndefQkKzSbtjBDKOW8SZMFe/EpWlhG8SkrwrC4AP4hV9o6AX864USi0?=
 =?us-ascii?Q?3tRP/3YJTqsF2NS2AB3p6QOw9si+LrcbDQNPwtxQh6kH/MLjfagnwJlnSpUp?=
 =?us-ascii?Q?Siq5yOWBn4etNG8bUdWbsCdMIJdtoaQTYFZgAP3HiT4KUfdKc6mMt6v5IrKA?=
 =?us-ascii?Q?hj1k3+KKtpChNJsVLGw4n69rz1jwT6Cz1rPvE4iQ1oeljpYfwX6PVapS4WW2?=
 =?us-ascii?Q?eV3509bJWpfL9ZzCnbkOQd9cs6Mg66rrx1NeOr13I9+WzdNXv74ZqIq5OvNs?=
 =?us-ascii?Q?VxGtQ2bOaBaeHd1Wo+gFL9FlFoVyKVfktvuuGsKfNZynKNMAr07o9Irf47EN?=
 =?us-ascii?Q?twCDdZ2M7A1npp7wiyrDsoD23ykgUuJEnUd2FLbZhc85tlTqgYQCwloj/YkB?=
 =?us-ascii?Q?80BC0aNrqBOu+9pZVcd1ZnhFll/9qefxAT9AcOo6nY1jRsnzdcBDG7JIeGbX?=
 =?us-ascii?Q?cbNd/DBL+hhHJi9ASuChTTEU7oeA1bnCL6rZiCwm9GMDSea4Zx6YTThkDaI1?=
 =?us-ascii?Q?TrbycRnSmc7FCOqT0NiC/7uJ9OBTD8FFE4zFHZXdOXcGIr0oFd+sOvS/CJDH?=
 =?us-ascii?Q?KDzlqY2Fc9wpDBQTSQeuCdXDUJf3s3orWLfjxKnG2HuCC+rSPhsT3/nmqOoJ?=
 =?us-ascii?Q?BpicRWrSKnMAVZGDtjhRFbFkHnwcJ+0M283t+tjKJ32Ma1NbrqfIKDt0bXWk?=
 =?us-ascii?Q?0tqZ4aPzfyEWd12Xc+SDUYLV+yqJ9iTj6Aa2qp5nOKb5VeWZqrxTQ5cU3/PY?=
 =?us-ascii?Q?IRYkQ4WBVvOilOSrD48m6iEqLuEytiznt99ovQ2gOOp1eFaMBd9eL0b5tZBW?=
 =?us-ascii?Q?qNejEPkaLE5yJeJaNRp0pOEl6JTA9PEOLweGxxXpDR0C0O/8n/9j77z3o0uq?=
 =?us-ascii?Q?wAZK16FW+ipQTs9BdrtrNco5k8sjj+BIA9usc0u6xm45e676zlZToWMKkdV5?=
 =?us-ascii?Q?DeAVimh1xdzekEQvSYVrdKFnGOWUHjSXLbiCLb4/qqxahhH+V2aW81LpxKKS?=
 =?us-ascii?Q?Rd4B+vwR3f54fFVkpeUmau/o?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR07MB3949.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd7e0b8-bf99-4189-c76b-08d8d896d950
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 07:36:07.4529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vcfd2oZcB0FZQU0IV9RVnAu+HrFxq8j5dzyT6cbnIu1nfEhrlFNWXRm3ZZAexzKiyV9+ZN5Ed8Rlqr6HOk/6ggSJJXeflBn5u/CbcPuhT8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4781
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hell Denys,
	Any idea about when Arago distro will be released for gatesgarth version?

Thanks and regards,
Ravi

-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>=20
Sent: Wednesday, February 24, 2021 1:35 AM
To: Ankam, Ravindra <Ravindra.Ankam@Honeywell.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: [External] Re: [meta-arm] Error while building the custom image

Hi,

You seem to have a very strange combination of layers and mix of branches!

For example, is this a Poky distro or Arago? Why do you include meta-poky =
if DISTRO =3D "arago"?
Why do you have some layers on "gatesgarth" and some on unstable "master"?
And finally, Arago distro currently does not fully support master or gates=
garth with the external Arm toolchain, only dunfell.

--
Denys


On Tue, Feb 23, 2021 at 02:47:48PM +0000, Ankam, Ravindra via lists.yoctop=
roject.org wrote:
> Hi,
>                 Please attached the error logs.
> Can you please help how to address this issue?
>=20
> Thanks and regards,
> Ravi


> poky/build$ MACHINE=3Dam335x-evm bitbake custom-base-image
> Loading cache: 100% |###################################################=
###########################################################################=
######| Time: 0:00:00
> Loaded 4805 entries from dependency cache.
> WARNING: No recipes in default available for:
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/=
recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/=
recipes-graphics/wayland/weston_8.0.0.bbappend
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/=
recipes-support/opencv/opencv_3.1.bbappend
> NOTE: Resolving any missing task queue dependencies
>=20
> Build Configuration:
> BB_VERSION           =3D "1.48.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "ubuntu-16.04"
> TARGET_SYS           =3D "arm-linux-gnueabi"
> MACHINE              =3D "am335x-evm"
> DISTRO               =3D "arago"
> DISTRO_VERSION       =3D "2020.09"
> TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           =3D "hard"
> meta
> meta-poky
> meta-yocto-bsp
> meta-custom          =3D "my-yocto-3.2.1:943ef2fad8428f002850e3655a3312e=
13d0dcb2c"
> meta-arm
> meta-arm-toolchain   =3D "gatesgarth:7185d29de9f54d2cb5b2da35b0c3f1e5f38=
1db2c"
> meta-clang           =3D "master:16f757de2d90594476d2c8feefd3a850c3c2493=
1"
> meta-ti              =3D "master:fb4726a88cbb5a6311bdb3095b81d314e344a32=
2"
> meta-arago-distro
> meta-arago-extras    =3D "master:f90d1bed7e775ac59bf1fcd95e95e9109d0953d=
b"
> meta-qt5             =3D "master:23f7a1c8eabaf1beb80cc6214954c0e1751c4cb=
d"
> meta-virtualization  =3D "master-next:3389eb0f128b1ef1d1aaf518afdf298a88=
f89619"
> meta-networking
> meta-python
> meta-perl
> meta-oe
> meta-gnome
> meta-multimedia
> meta-filesystems     =3D "gatesgarth:cef93b7b00e620d90a610112ee574fa60b6=
91cf8"
> meta-tpm
> meta-security
> meta-security-compliance =3D "master:16ee7308c9fd48d69b02c5519d2e5edddc5=
60658"
> meta-selinux         =3D "gatesgarth:36db146d56535318d343dc9138358885356=
f2172"
> meta-linaro
> meta-optee           =3D "master:11091b487e1ad4c6a4adfac34d958a3d9d9ccd1=
7"
>=20
> Initialising tasks: 100% |##############################################=
###########################################################################=
######| Time: 0:00:02
> Sstate summary: Wanted 1003 Found 0 Missed 1003 Current 22 (0% match, 2%=
 complete)
> NOTE: Executing Tasks
> ERROR: external-arm-toolchain-2019.12-r0 do_install: '_sre.SRE_Match' ob=
ject is not subscriptable
> ERROR: Logfile of failure stored in: /home/airport/ravi/yocto_gatesgarth=
/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/exter=
nal-arm-toolchain/2019.12-r0/temp/log.do_install.22351
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are ['virtual:native:/home/airport/ravi/yoct=
o_gatesgarth/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sy=
sroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recip=
es-devtools/rsync/rsync_3.2.3.bb:do_populate_sysroot', 'virtual:native:/hom=
e/airport/ravi/yocto_gatesgarth/poky/meta/recipes-extended/xz/xz_5.2.5.bb:d=
o_populate_sysroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/po=
ky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_populate_sysroot', 'virtua=
l:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/pkg=
config/pkgconfig_git.bb:do_populate_sysroot', '/home/airport/ravi/yocto_gat=
esgarth/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_s=
ysroot', 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/reci=
pes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['patch-native', 'rsync-n=
ative', 'xz-native', 'bison-native', 'pkgconfig-native', 'quilt-native', 'p=
seudo-native', 'texinfo-dummy-native', 'libtool-native', 'gnu-config-native=
', 'gettext-minimal-native', 'automake-native', 'flex-native', 'autoconf-na=
tive', 'attr-native', 'acl-native', 'popt-native', 'm4-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libanl.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/bu=
ild/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-=
toolchain/2019.12-r0/image/lib/libanl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libBrokenLocale.so.1 is a symlink of /home/airport/ravi/yocto_gatesgart=
h/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/exte=
rnal-arm-toolchain/2019.12-r0/image/lib/libBrokenLocale-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libc.so.6 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/buil=
d/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-to=
olchain/2019.12-r0/image/lib/libc-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libcrypt.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/=
build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-ar=
m-toolchain/2019.12-r0/image/lib/libcrypt-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libdl.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/bui=
ld/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-t=
oolchain/2019.12-r0/image/lib/libdl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libm.so.6 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/buil=
d/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-to=
olchain/2019.12-r0/image/lib/libm-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libnsl.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/bu=
ild/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-=
toolchain/2019.12-r0/image/lib/libnsl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libnss_compat.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/=
poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/extern=
al-arm-toolchain/2019.12-r0/image/lib/libnss_compat-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libnss_db.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky=
/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-a=
rm-toolchain/2019.12-r0/image/lib/libnss_db-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libnss_dns.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/pok=
y/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-=
arm-toolchain/2019.12-r0/image/lib/libnss_dns-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libnss_files.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/p=
oky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/externa=
l-arm-toolchain/2019.12-r0/image/lib/libnss_files-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libnss_hesiod.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/=
poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/extern=
al-arm-toolchain/2019.12-r0/image/lib/libnss_hesiod-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libpthread.so.0 is a symlink of /home/airport/ravi/yocto_gatesgarth/pok=
y/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-=
arm-toolchain/2019.12-r0/image/lib/libpthread-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libresolv.so.2 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky=
/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-a=
rm-toolchain/2019.12-r0/image/lib/libresolv-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/librt.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/bui=
ld/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-t=
oolchain/2019.12-r0/image/lib/librt-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
lib/libutil.so.1 is a symlink of /home/airport/ravi/yocto_gatesgarth/poky/b=
uild/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm=
-toolchain/2019.12-r0/image/lib/libutil-2.30.so, keep it
> | rmdir: failed to remove '/home/airport/ravi/yocto_gatesgarth/poky/buil=
d/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-to=
olchain/2019.12-r0/image/usr/bin': Directory not empty
> | rmdir: failed to remove '/home/airport/ravi/yocto_gatesgarth/poky/buil=
d/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-to=
olchain/2019.12-r0/image/usr/sbin': Directory not empty
> | rmdir: failed to remove '/home/airport/ravi/yocto_gatesgarth/poky/buil=
d/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-to=
olchain/2019.12-r0/image/sbin': Directory not empty
> | NOTE: make -j 3 HOSTCC=3Dgcc  HOSTCPP=3Dgcc  -E headers_install INSTAL=
L_HDR_PATH=3D/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-ar=
m-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r=
0/external-arm-toolchain-2019.12/usr
> |   INSTALL /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-=
arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12=
-r0/external-arm-toolchain-2019.12/usr/include
> | mv: cannot stat '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-ex=
ternal-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/=
2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnueabihf': No such file or dir=
ectory
> | WARNING: /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-a=
rm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-=
r0/temp/run.do_install.22351:415 exit 1 from 'mv /home/airport/ravi/yocto_g=
atesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnue=
abi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnue=
abihf /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc=
/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image=
/usr/lib/gcc/arm-linux-gnueabi'
> | WARNING: Backtrace (BB generated script):
> |       #1: do_install, /home/airport/ravi/yocto_gatesgarth/poky/build/t=
mp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolc=
hain/2019.12-r0/temp/run.do_install.22351, line 415
> |       #2: main, /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-ext=
ernal-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2=
019.12-r0/temp/run.do_install.22351, line 415
> | ERROR: '_sre.SRE_Match' object is not subscriptable
> ERROR: Task (/home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-=
toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb=
:do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 242 tasks of which 239 didn't need to be =
rerun and 1 failed.
>=20
> Summary: 1 task failed:
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain/r=
ecipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_install
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code=
.

>=20
>=20
>=20


--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
