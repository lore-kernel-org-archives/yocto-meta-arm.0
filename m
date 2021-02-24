Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.130])
 by mx.groups.io with SMTP id smtpd.web09.2667.1614139024432251151
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Feb 2021 19:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@honeywell.com header.s=selector1 header.b=HkxjHxuj;
 spf=pass (domain: honeywell.com, ip: 40.107.101.130, mailfrom: ravindra.ankam@honeywell.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QowTNHy3GPqXMuu6TtikOikvzqPwxxSevEOHEk5ADVB+tb6jgKt1dhC3OhGK9oJoDuUCGjXS6aQcwZq+HFYrnsZ7xq20Y8Mp58lKRaX/sSc4+FPfCyCZownScCrSMbYwqyw6BVcQAsBb8/eh9TSv9ZkUQAZleXfdopFd52FTgOlgYIseu9gqc2GgOMOQMqvy1wCGC45OClEOyxbMYUm2kA7SN6YdX6wIoLPTj43GCAcYLl1UW/kgfnXAchOSB5P0cLk+hVaxRdFLEZpl6kedTAZ1zmT77BtsCbeTz5lmBvuoA+7gz1/XpEFnj0/L5hOO1JrYnYZRGO9je+cVAbgY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTjT5685OZfUp01V/50U0bFzQxEC49kV6svR/4Vm/QA=;
 b=X0uoIxlY9mcFAGkrZgOibpgPJUSs4lcTPK0G2zcMVToeslf1508fb9GuC7L97sOU2MbSFzbK2rKNEdtR5zTLh9joKcPl54JUwHyr0YSdaCCJQmDmQVLq2xntMj2sgcOH9Bl14g30mBZhn2pytRgHsBlPZXjAAoTDPOJSqnxelnK6ngYqzZcmf/JQWfvIBmTydO1qbI9M0ggMXDcAn549CQ2z6I3CesZdJUk5/IBxBHt2eOzBp1rL2cE8hGgLniOPM+evZ0uQwhdWu6KRBA6UKOxMpqjKUQK75plyopatSTgJtgpk+IH6iXwOiqDLif63Fl5cSm85gGRy4fIPMHhnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=honeywell.com; dmarc=pass action=none
 header.from=honeywell.com; dkim=pass header.d=honeywell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Honeywell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTjT5685OZfUp01V/50U0bFzQxEC49kV6svR/4Vm/QA=;
 b=HkxjHxujnR0HFJV7K4g0gX7lYjhUO9G/3IwDn6aevD5oEo1rrRMoivZMrbnGPA6U/e9dfrSb8x5n95tTbymjmR6lqnfJHV2jL+PgrgiJLLVN3+cnyFUuBK2v8e+hTS//YhXZm7C9a21gtWZOSKchJcQwlGRQQFK4TG2dxsGV06w=
Received: from SN1PR07MB3949.namprd07.prod.outlook.com (2603:10b6:802:25::17)
 by SN4PR0701MB3709.namprd07.prod.outlook.com (2603:10b6:803:44::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Wed, 24 Feb
 2021 03:56:55 +0000
Received: from SN1PR07MB3949.namprd07.prod.outlook.com
 ([fe80::c430:69d7:6d:82bf]) by SN1PR07MB3949.namprd07.prod.outlook.com
 ([fe80::c430:69d7:6d:82bf%2]) with mapi id 15.20.3868.027; Wed, 24 Feb 2021
 03:56:55 +0000
From: "Ankam, Ravindra" <Ravindra.Ankam@Honeywell.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: Re: [External] Re: [meta-arm] Error while building the custom image
Thread-Topic: [External] Re: [meta-arm] Error while building the custom image
Thread-Index: AdcJ8rX5nImPUeNeTLiDcvVgqT387wALHC0AABB13nA=
Date: Wed, 24 Feb 2021 03:56:55 +0000
Message-ID: 
 <SN1PR07MB39492D6085CB79E344549F1E819F9@SN1PR07MB3949.namprd07.prod.outlook.com>
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
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SetDate=2021-02-24T03:56:52Z;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Method=Standard;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Name=d546e5e1-5d42-4630-bacd-c69bfdcbd5e8;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SiteId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ActionId=34e6620a-c2ed-4b18-96bd-3f9fd86a0c31;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ContentBits=0
smarttag: 4
authentication-results: denix.org; dkim=none (message not signed)
 header.d=none;denix.org; dmarc=none action=none header.from=Honeywell.com;
x-originating-ip: [49.207.214.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2a6cec6b-11ed-4462-dff2-08d8d87839e6
x-ms-traffictypediagnostic: SN4PR0701MB3709:
x-microsoft-antispam-prvs: 
 <SN4PR0701MB3709C3E9CE46DBB3F9FE0628819F9@SN4PR0701MB3709.namprd07.prod.outlook.com>
x-antispam: TRUE
x-recptdomain: NotTLSDomain
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k+C5D0Fh1tM/uvJGg7qjfge2mA2i6SdpVeLsj0lm+65j/nwvz5YkNK9FZ/ICVE8VEqbNh/s77fwHDEqzprHv9Q2qmExcWd3Ig/9tbB3kTWZoJ/vSCcbpU4eeZ7e+H1V33o0nPigqu0w3t0rZ14ikfB/j8kLYVN9kV+DULCqgIeknYomZkozVzdkTJZKWKF8YCn8N89r3vwsKG9VpDkrNxXb8Cr8WGiZ+hZ8uUaHvvqVfymyO7hSS1Vq7iVnMRvN+eEY4ZBiGYantePb71B4PEfRKQ5Ue1W9c+w+SdYrIljfWZ/IC/oSLyn3MJFiJVVITYGCEGQXnIHuB7t5+Bi1zh9el6TWfIg6UpHeCnR6hywXvRDHVAmIXv3NZ88ZOnXidHVW60Tz6vqmNx0nH934jZTLw7mKVw+0GP1bdfcX+l7O97QZK95Px2HRTNwPmj5P0VrVpHwxC9egwvL6bP5MjceOi4NHS4UpqbhGxpIO/nuj63rbOM+mUSAs75m/L7V2jjTkwUPy7mK6JPwbM3k8MgfkPoRf1fW5hB4tTMjdHbuZ/F7VVNe7xDl6WShQ9YQ4+EcbzCMJsm7kH6f6H8sr62cXP1/vke2vccS07m1gNVtc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07MB3949.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(6916009)(5660300002)(55236004)(966005)(9686003)(66946007)(186003)(83380400001)(478600001)(30864003)(33656002)(316002)(76116006)(26005)(52536014)(4326008)(7696005)(53546011)(66476007)(8676002)(66574015)(66446008)(66556008)(6506007)(55016002)(86362001)(2906002)(8936002)(71200400001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?//p2LfJLSPwbOURl9b2W9FHFVEuFqoTPZ1I7EiuxVe7oG3HRPAcHMBUKjyEj?=
 =?us-ascii?Q?iQdZ4QOVSiQ3Tbs4+R0mds18sC/yP4GMqCXiFL+s/4gXTK35gCt/qRmjwwOg?=
 =?us-ascii?Q?wZUFNF8CTPtsZMw/OJzytpX0yqHyacN8d9Gufq9ofRfA+DLE0UZmSkVHerPj?=
 =?us-ascii?Q?TabfFc0IPPTw5lOvhP+vZvzpDR2x/j2ylVDtuh/zEZLyuAh/LDXPE4rvwFJK?=
 =?us-ascii?Q?zbleV/FuEovK8CXQK0aKT0lSLZSwRsYrI169s6DdXQfDbfehT2YpPPmrWtuY?=
 =?us-ascii?Q?VVPUqioPCuhY9kbhyxyM3v95b9SaPjmAuCZxgxUV6FXiXxi8Z80dLUTUStbp?=
 =?us-ascii?Q?lHLp6h7ByOcI3LsKls00Ifixbi+Y7VXh0t3qCYFNj++e+a3/NLzNOps9zUuP?=
 =?us-ascii?Q?Z46aVc7oU7a1aF0fN9Xv0Qr0k/M+T6xQjfQg7Odc5hprcnPq/xbBWKgiDUvx?=
 =?us-ascii?Q?w2eVb7+7wdXCyFFEcs4Hm9oMsm9hlTSyqZXzFPd4SqgvhamceEij/Y4hb6gc?=
 =?us-ascii?Q?6chgJEkXm7m3/b0Gk8uzgRA4+oK6NUW22E12CP1lY5RBl+LSDZXyUiGzhGWL?=
 =?us-ascii?Q?njrhRTKY499RnqUxny13Xq2+cYXaBEiWlsgsaVovkEqNh8o6YSSMsUxScjaj?=
 =?us-ascii?Q?hCdGhJOgOMtAVKUBHFc/glQIFFGan9TA74U8hlDUpQpC6amwL13CAqsstNHD?=
 =?us-ascii?Q?FruTNjpVjax47fH4tRLKfs3twRkelZyymA+peKFPdW90MLmpd8t5lboshN3U?=
 =?us-ascii?Q?n1Rs7Q9MhclM8ZBlpQD27EMJQ/ute2pU/quEQAjVqStnJtafPVjVaGIMQZIt?=
 =?us-ascii?Q?mwvJMRUfN6/NEoEUIERRACBrz3SqadnVdV/21CLABW2c9qXQtv37c8QOuLmN?=
 =?us-ascii?Q?Ss8XyYJ04OLaPM4pbNMQO9HIj3G0RSTy1f48N//uVQvOrJNggKyDIsrGPY3o?=
 =?us-ascii?Q?D8qaP5AeaZRB5eA04K0GNEnvzPQ9j1ZhT9ATXd+9e3D3gjRdCHv2Fwu8bKhz?=
 =?us-ascii?Q?jhTWZPQcqs4B/nwD6zklyfCcoM7iyD02hkeZ0E6nu0+QSOT7j5EPlanHju7g?=
 =?us-ascii?Q?nSjTs9DaAZkZAo2l5/Cl5doOIOUETF2zqXtyPeHoyA2f5dlV80fFu1oaZklD?=
 =?us-ascii?Q?1Tr31DmT9dhVndLk3SVsyhecVKIuUZXccw8nASuNhzU9zKj4O73nGwQ2pG1S?=
 =?us-ascii?Q?Ji/HT0DgSGWXj71MWSybtl4dR8bWcohcCNQxx2/ngWam3BXkEIcaRtRkGW4Z?=
 =?us-ascii?Q?A/y2ZbrwCrv7wzSGBQIItqZGiI10Xfd71nnN8xnhsdwERDTcbTluTwkE9r9X?=
 =?us-ascii?Q?q8xGntQr0pYlacoWoSmOBYq5?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR07MB3949.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6cec6b-11ed-4462-dff2-08d8d87839e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 03:56:55.1162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vIyJ/1t/dZtb37y6jD/KdBBJsenPtyX9HkiMYG9oD0O8wmVx45+9/feRSnMueJldI0ow22AAESkg71Q6RdgZhb2AeBLmdwm4LqKP0NGYr1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0701MB3709
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you Denys. This will help.

Regards,
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
