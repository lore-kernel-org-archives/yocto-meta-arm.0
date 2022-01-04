Return-Path: <nachiketrahul.jagade@honeywell.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E280C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 05:35:24 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.130])
 by mx.groups.io with SMTP id smtpd.web12.2974.1641274522677020420
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Jan 2022 21:35:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@honeywell.com header.s=selector1 header.b=UuoRJQ7u;
 spf=pass (domain: honeywell.com, ip: 40.107.94.130,
 mailfrom: nachiketrahul.jagade@honeywell.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Honeywell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqFZ8EuFhEVTCEavfCs8H/8ilk53NKwKwanxDBSDAo0=;
 b=UuoRJQ7uUaCQWN2Qwhr7jVZB2z2F12ytTA7VaemYSqRk4GHaym7Ynw7xErNQwbaMkNifNKnLrPOfJZ90Ig2xPiPbZ5tkuo2m8Ne2nzlsnD/WbWlMytYCCRkKKMpwQ3CDhOoDXUl8+zH1/UdQn0hn6VD0RMYR494dzvluBaMn5F8=
Received: from BN7PR07MB4644.namprd07.prod.outlook.com (2603:10b6:406:f1::14)
 by BN7PR07MB5282.namprd07.prod.outlook.com (2603:10b6:408:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Tue, 4 Jan
 2022 05:35:18 +0000
Received: from BN7PR07MB4644.namprd07.prod.outlook.com
 ([fe80::edb1:dc10:64da:d4f5]) by BN7PR07MB4644.namprd07.prod.outlook.com
 ([fe80::edb1:dc10:64da:d4f5%3]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 05:35:18 +0000
From: "Jagade, Nachiket" <NachiketRahul.Jagade@Honeywell.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
	"Sridhara Murthy, Vinay" <Vinay.SridharaMurthy@Honeywell.com>, "Ankam,
 Ravindra" <Ravindra.Ankam@Honeywell.com>
Subject: Questions to create custom distro for TI am335x
Thread-Topic: Questions to create custom distro for TI am335x
Thread-Index: AdgAxbMGpSQvE0/+R5KdcLLTgwRA+A==
Date: Tue, 4 Jan 2022 05:35:18 +0000
Message-ID: 
 <BN7PR07MB4644CB07307C600A12570158854A9@BN7PR07MB4644.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
msip_labels: MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Enabled=true;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SetDate=2022-01-03T17:16:52Z;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Method=Standard;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Name=d546e5e1-5d42-4630-bacd-c69bfdcbd5e8;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SiteId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ActionId=415aa72d-c37a-4d38-819f-98afa1c4bf80;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ContentBits=0
x-ms-traffictypediagnostic: 
 BN3PR07MB2625:EE_|BN7PR07MB4644:EE_|BN3PR07MB2627:EE_|BN7PR07MB4644:EE_|BN3PR07MB2627:EE_|BN7PR07MB4644:EE_|BN6PR07MB3425:EE_|BN7PR07MB4644:EE_|BN7PR07MB5282:EE_
x-ms-exchange-crosstenant-originalarrivaltime: 04 Jan 2022 05:16:00.9071 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
x-ms-exchange-crosstenant-network-message-id: 
 e6062e68-6e14-4f30-a27c-08d9cf414c53
x-ms-exchange-transport-crosstenantheadersstamped: BN6PR07MB3425
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Honeywell.com;
x-ms-office365-filtering-correlation-id: 1c9f76a7-3810-4baf-617f-08d9cf43fe61
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:2733;OLM:2733;OLM:2733;OLM:2733;
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR07MB4644.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(7696005)(66476007)(66556008)(6506007)(19627235002)(316002)(37630700001)(5660300002)(64756008)(86362001)(66446008)(38070700005)(966005)(4326008)(45080400002)(55016003)(26005)(9686003)(66946007)(186003)(2906002)(66574015)(8676002)(8936002)(54906003)(71200400001)(53546011)(6862004)(52536014)(30864003)(107886003)(33656002)(82960400001)(76116006)(122000001)(83380400001)(508600001);DIR:OUT;SFP:1102;
x-microsoft-antispam: BCL:0;
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 
 iS3P0gzzHwheVFMqFVei1pCKd0UsvtRM6nz+isDC+ftFKXS6dsyl6bTKJEoX66SjunJ8ZivEglxb/erK119ICWdcULMnBN8sfx2gh7MDVmY7MACEA1DHegOpvsvGC1VP
x-microsoft-antispam-message-info: 
 JIWq6JGfpzyUBk+Hwo8GCxO3s1j6HFunDLPWkB5TnQIKCTBRRa6rZ2gNk6pK5aM/fQKclDJXY81niKbKkmpH+u/ysfwWrR4331HLwVdQ+khKd9yjzn7BzH3s91DxDN0TJPHuVcSv7hU6ZKf+8t/uxBjzqzK9C0BpX2KrWl4YYjJOAzDxFFl0iCVNqEEoetmHbnfZrT+Em8N1h9rCoZBfTrg5YxJlWUJBHKaY2aUJu6yEXhWE0vb4sMWgf3+hwrI4mqGolu8gJSRqC1Vh83uw/FmiVxgQyiloBFkopDxYFnsSh0AavDGJxnzr4+AboEJoWKLf04HrbdUr15ZhLobmzuVqL1F/ogB64/8nGhR1nrRxTf93/MWqNa6FmindqRiEZ5/1DytmIWcHuNhar3YqdFDB5d3MCmxvMK8WG9bM90QB1kgMRZWgWMROo5/IMzMFEPSEhkwubbZSzK4P7irkAuyeY4ye7FiQHVSZLThw7mZFT0AFm8zTi7VsOPwfPjda45c8PEq2ql4HEoK4mIPTUmlwyUBrtok3XzsEkRuzyBtSK8Yr2IUaBIwBoI78VAgCw+/teJvh4lNbEsN0Qeb4EGdfn+cE7ECIlyh29d8hL8hvtK26PCClYaNswpEkE4/GXVoryumfoXeKEtvoF4Q+o4XeqkcRMVmrCmK4/zx239Wp4Z3N8wtFyBPQb94jRgzosigGsOB7iCKP9b+LrN7oD9i0eooZ0WedzT0nPZ30tMDnjweHWXvZ3eDh91eJULxijEtV1D66q1iG+k6KLZ+fl2SHUXSZfl02lOGsJhzuqsY=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BN7PR07MB4644.namprd07.prod.outlook.com
smarttag: 4
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Honeywell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqFZ8EuFhEVTCEavfCs8H/8ilk53NKwKwanxDBSDAo0=;
 b=Jc214Y/pdE2SHm6csrRHwZJ3TAcvj944AWRcXXTqZ9QMduv0mtxXZKBQvmfmvfmpUVWIGBpIVB+TvS9MqFliFMwVO3B2wARvOR1iOSb9kDGwuj5onzbPu+ZNXYTwltV/C4TRlvuETWhflTMJMstZ7LBe6mN7gP7SMpmZ1Z69yss=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEeEE2qzA9Lv77sbKnRKd2QIiDCOlJxE/EKJgBhkvHa7A8p8E6sEMgQqVUaqsqXGcqhGoFNSLIFAth5dir0SPNd26jvM5MBIIwiTyIgyU6rWKqOcSNmFWCyUSUy+vFyhpBhXPZ6bc3adSiYySB0QZ/Y7KHsDWuHkq1QnvohEbil1B7s0t6AnK5ANDXB498LujeVm/Q9moW+9aG5kSDp/4AL89NjhNewTOqzSS6W66sOPcFxt+6pn+Cyol9cnXJZcJCAEahiMPJAR+Fasj6c93AZlMeqGlu0wBLyh4V1D5RmMVcHO4MLpxt21+dOMgCMhKriMZEcqk1vi4hAyWgIacw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqFZ8EuFhEVTCEavfCs8H/8ilk53NKwKwanxDBSDAo0=;
 b=AErUiM8TlQzKW4Gl9aVPVxvUOzwHPGnsE2KD1HO89Jc6R+cZ9hmhfaFjF9N1bn7T36uK4jOiNsuIYfo/Mjeo0VxBNcJEn3tdR0nUInkStMiPedEQya0ukP5Me1faJFZsFZAcoRjPHOHeVjEIYxIytgM2N8nya/ERs8sZs72KeJekDWK6TOlrdl+W9Pq//Y/h3cO2z80eh3rAZF4rVpVXBNuxlB543at1hfUbnXLGyX3bkC3d3tyapo3svB+pmhfSRdkuLqQwoh+/KTKe+Cm00KspPBUSqHtYlNYqJT1P22e6PeD1HmQj6nCaeDBpASa/54hoHNT0GTdNUWZlcIa8Iw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=honeywell.com; dmarc=pass action=none
 header.from=honeywell.com; dkim=pass header.d=honeywell.com; arc=none
x-microsoft-antispam-prvs: 
 <BN7PR07MB52829702DD553648C1D227AF854A9@BN7PR07MB5282.namprd07.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-office365-filtering-correlation-id-prvs: 
 e6062e68-6e14-4f30-a27c-08d9cf414c53
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?tZNp0if116MHd4lob+93/7VKn6H5zd2biFbd+rVESAQJj4TQcJpt9PPNdUv3?=
 =?us-ascii?Q?GVnMWRMIAUcv6RMlCpf5ZUHvQK15H71YQB/vAvgruaCfyBNYH2iwW6lgfUL6?=
 =?us-ascii?Q?Zuef+PrgSJ3qqV7YBuc/OJPQKLnn4VYbgwdPR3W6q6ToYxX1jTx5kOR4UxNZ?=
 =?us-ascii?Q?skfxAd4TeGqI3aAc6lBViHv/RxN6BxCfbODBdXFTiq+PZCCI9yVP53LnuGi+?=
 =?us-ascii?Q?dvir6pEkLX6UNNIIikqsubTSQP2TLodVbmeULVH9nB5JX/a1SNfOs8fsVQOd?=
 =?us-ascii?Q?S26ak+CCGH18Zzof/DEWuqXtPTNZHxEAUN/TeEV98gCIWOjPRaZiBvytagYk?=
 =?us-ascii?Q?8JwZT2YSb4t+/pgStA0yEBkKD8XsrJ5v/B/4iI5kfLgwhpQpbkQdf5agFza/?=
 =?us-ascii?Q?8oeWDnzKRpkpkPt/o6PGOjWY9llK82wiKEz5r+/OCkpmpYAdCYmxlo5yLQC9?=
 =?us-ascii?Q?f3SQYzircwN0kw8r0Kvg1EbcrfKMtr2I8SQLmKupHaqkIBiwAfN70SoNHkRx?=
 =?us-ascii?Q?RDeZc5rKXUYPvuL0KUjqx4OO4/vuHj99Osvnn0T36EfGSmFTDt9fU3+T9JUm?=
 =?us-ascii?Q?2AxqCoxIHh+nr6NAAKxa8b+WOTK9FE37VK+iJF1bF2qvThTXoxmi+hLRGlyx?=
 =?us-ascii?Q?dn6p4iWUJzA1WsbvBenAFdkG6ScqbEu6Mryae0UmUIq3OPDbxwrawROtlfXT?=
 =?us-ascii?Q?sGApRYCxHi6srk5XYvem+Xb8mr9EbPI65U18eOJ83dPZfnAl8pf2CiNAQLwi?=
 =?us-ascii?Q?qXgUx7piOwBNvP6mhn9PhmbRGIHuZA3vUHDzEdsovU2qqQ4QpsfuJLOgn4Ws?=
 =?us-ascii?Q?PUdHQqNZZbih1U6f2Om3D8cGqL9jzAeH59exOlSSkK/oNByrrX30DrBaIFuv?=
 =?us-ascii?Q?MJ1Pi01S4JVw5WUtdx6QRN+BX5oW7BT1vKLeYTTV7zhA9uT5JdlmtPEQY3y3?=
 =?us-ascii?Q?F1/xe6d3PCmzMDqM3dRda/lwec8dXVrjG73wR5ZZ28qsnrCByiGjP1TwBLIR?=
 =?us-ascii?Q?eBFCQvTYQLKnEYAkP3t2RxMAtG4J0fSsjH0zKpiRS+ghjXP8RUf2An1u19C6?=
 =?us-ascii?Q?CUD5QM40lx4DpvRNYJVHCVzDO9OtwLK9dRsHc+4JD/E4+zOGOc+5+RuRLDKJ?=
 =?us-ascii?Q?epmLoiFCpX4k/zQiWXFMa8zFun9+F7rqT4uI0LwKpG1u/V7+ncCHw5DyEHba?=
 =?us-ascii?Q?nwkLRCbVf3DLZjr1u8w8NDuKpRjYsNjQTk0V1hjIHCaWTQ+Rv68Cu1Cqu0YI?=
 =?us-ascii?Q?X+5tKYvuIul8evpmq5yjGHxrT1ybi2xn9XQ4Oz2+Rm/NPPk8SIoS4dwUxwa3?=
 =?us-ascii?Q?CFFaiX8gIFZedF1JCkJNCkzKS3MBm529Qb81vugo0PMhWBMfqY+0CEB1T8Ts?=
 =?us-ascii?Q?XFC0Hv/fTSFBnaK1VRcunpQcFI8ddZ9m6H7pYpksRwEMDizC1Wj1Ky8YM1Ev?=
 =?us-ascii?Q?DWOTSCXYpdhGnjbh4IXpNw9QIB2cqu4o1bRuKm0/Ial7+OcC+UFUlhHbt+Iu?=
 =?us-ascii?Q?JFlo1T/q9VJmcWDGv7dMUCMTXikS6JiOa11WNTLB/CBBjfvEJIGCe25yXhIB?=
 =?us-ascii?Q?VMppb3gmeuWS3gBV9vt0iPtBkm5C9URdoY7FmqBpLeYQyi3gtRZmQOQGywaA?=
 =?us-ascii?Q?Lqv17sb1iXEzodcCcCIdqsX6Zi324HJ6Uvm2TqM8usX6a7f0qaCLHe5N9zo8?=
 =?us-ascii?Q?p7sHxirM7Rp3Wbgf7ODEO+j7txsP2KfmpAc6fch/RRV40lCFyczk/A4EYiWX?=
 =?us-ascii?Q?0zqchXQhOw=3D=3D?=
x-antispam: TRUE
x-recptdomain: NotTLSDomain
x-ms-exchange-antispam-relay: 0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AE7EDA302007134A917A848688D03770@namprd07.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR07MB4644.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c9f76a7-3810-4baf-617f-08d9cf43fe61
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2022 05:35:18.5939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 y6z0/V9aI8uNEaZbOECiNxRSkf5QkJUZi4V8Yf2zNRE5D6XUPWBfxEMw1u/DCjvpmOqxjCnZKmJApVmNOmmtvs5j+Ssr23BjKIKh26G1mOaM9hcaLLnH4McbO6GJCpYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR07MB5282
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 05:35:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2774

Hello Denys,

Happy new year.
We are working on TI am335x sitara based platform. You had replied to quest=
ions of my colleague long ago.
We have created custom distro which is a mix of arago and poky. Reason is t=
hat when we last checked, arago distro did not had latest version of applic=
ations. And when I say application, I refer to open source packages such as=
 python, apparmor etc.
Also some layers were not available in arago and we had to resolve many dep=
endencies while compiling.

Now we want to make a distro with latest versions of all required packages.=
 So shall we go with 3.4 Honister or with latest dunfell release 3.1.13 ? O=
ur main aim is to have latest versions of packages with less number of vuln=
erability count. What will you suggest to achieve this?


Thanks and regards,
Nachiket


-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>
Sent: Wednesday, February 24, 2021 1:35 AM
To: Ankam, Ravindra <Ravindra.Ankam@Honeywell.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: [External] Re: [meta-arm] Error while building the custom image

Hi,

You seem to have a very strange combination of layers and mix of branches!

For example, is this a Poky distro or Arago? Why do you include meta-poky i=
f DISTRO =3D "arago"?
Why do you have some layers on "gatesgarth" and some on unstable "master"?
And finally, Arago distro currently does not fully support master or gatesg=
arth with the external Arm toolchain, only dunfell.

--
Denys


On Tue, Feb 23, 2021 at 02:47:48PM +0000, Ankam, Ravindra via lists.yoctopr=
oject.org wrote:
> Hi,
>                 Please attached the error logs.
> Can you please help how to address this issue?
>=20
> Thanks and regards,
> Ravi


> poky/build$ MACHINE=3Dam335x-evm bitbake custom-base-image Loading
> cache: 100%
> |########################################################################=
############################################################| Time: 0:00:00=
 Loaded 4805 entries from dependency cache.
> WARNING: No recipes in default available for:
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/r=
ecipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>  =20
> /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/
> recipes-graphics/wayland/weston_8.0.0.bbappend
>  =20
> /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/
> recipes-support/opencv/opencv_3.1.bbappend
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
> meta-custom          =3D "my-yocto-3.2.1:943ef2fad8428f002850e3655a3312e1=
3d0dcb2c"
> meta-arm
> meta-arm-toolchain   =3D "gatesgarth:7185d29de9f54d2cb5b2da35b0c3f1e5f381=
db2c"
> meta-clang           =3D "master:16f757de2d90594476d2c8feefd3a850c3c24931=
"
> meta-ti              =3D "master:fb4726a88cbb5a6311bdb3095b81d314e344a322=
"
> meta-arago-distro
> meta-arago-extras    =3D "master:f90d1bed7e775ac59bf1fcd95e95e9109d0953db=
"
> meta-qt5             =3D "master:23f7a1c8eabaf1beb80cc6214954c0e1751c4cbd=
"
> meta-virtualization  =3D "master-next:3389eb0f128b1ef1d1aaf518afdf298a88f=
89619"
> meta-networking
> meta-python
> meta-perl
> meta-oe
> meta-gnome
> meta-multimedia
> meta-filesystems     =3D "gatesgarth:cef93b7b00e620d90a610112ee574fa60b69=
1cf8"
> meta-tpm
> meta-security
> meta-security-compliance =3D "master:16ee7308c9fd48d69b02c5519d2e5edddc56=
0658"
> meta-selinux         =3D "gatesgarth:36db146d56535318d343dc9138358885356f=
2172"
> meta-linaro
> meta-optee           =3D "master:11091b487e1ad4c6a4adfac34d958a3d9d9ccd17=
"
>=20
> Initialising tasks: 100%
> |#####################################################################
> ##########################################################| Time:=20
> 0:00:02 Sstate summary: Wanted 1003 Found 0 Missed 1003 Current 22 (0%=20
> match, 2% complete)
> NOTE: Executing Tasks
> ERROR: external-arm-toolchain-2019.12-r0 do_install: '_sre.SRE_Match'=20
> object is not subscriptable
> ERROR: Logfile of failure stored in:=20
> /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/
> work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/t
> emp/log.do_install.22351
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are
> | ['virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recip
> | es-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/rsync/rsync_3.2.3.bb:do_populate_sysroot',
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-extended/xz/xz_5.2.5.bb:do_populate_sysroot',
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/bison/bison_3.7.2.bb:do_populate_sysroot',
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',
> | '/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/quil
> | t/quilt-native_0.66.bb:do_populate_sysroot',
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['patch-native',=20
> | 'rsync-native', 'xz-native', 'bison-native', 'pkgconfig-native',=20
> | 'quilt-native', 'pseudo-native', 'texinfo-dummy-native',=20
> | 'libtool-native', 'gnu-config-native', 'gettext-minimal-native',=20
> | 'automake-native', 'flex-native', 'autoconf-native', 'attr-native',=20
> | 'acl-native', 'popt-native', 'm4-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libanl.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libanl-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libBrokenLocale.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libBrokenLocale-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libc.so.6 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libc-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libcrypt.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libcrypt-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libdl.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libdl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libm.so.6 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libm-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnsl.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnsl-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_compat.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_compat-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_db.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_db-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_dns.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_dns-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_files.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_files-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_hesiod.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_hesiod-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libpthread.so.0 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libpthread-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libresolv.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libresolv-2.30.so, keep it=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/librt.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/librt-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libutil.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libutil-2.30.so, keep it
> | rmdir: failed to remove
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/usr/bin': Directory not empty
> | rmdir: failed to remove
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/usr/sbin': Directory not empty
> | rmdir: failed to remove
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/sbin': Directory not empty
> | NOTE: make -j 3 HOSTCC=3Dgcc  HOSTCPP=3Dgcc  -E headers_install INSTALL=
_HDR_PATH=3D/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm=
-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0=
/external-arm-toolchain-2019.12/usr
> |   INSTALL
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/external-arm-toolchain-2019.12/usr/include
> | mv: cannot stat
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/usr/lib/gcc/arm-none-linux-gnueabihf': No such file or=20
> | directory
> | WARNING: /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-ar=
m-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r=
0/temp/run.do_install.22351:415 exit 1 from 'mv /home/airport/ravi/yocto_ga=
tesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnuea=
bi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnuea=
bihf /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/=
work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image/=
usr/lib/gcc/arm-linux-gnueabi'
> | WARNING: Backtrace (BB generated script):
> |       #1: do_install, /home/airport/ravi/yocto_gatesgarth/poky/build/tm=
p-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolch=
ain/2019.12-r0/temp/run.do_install.22351, line 415
> |       #2: main,
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/temp/run.do_install.22351, line 415
> | ERROR: '_sre.SRE_Match' object is not subscriptable
> ERROR: Task (/home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-t=
oolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:=
do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 242 tasks of which 239 didn't need to be r=
erun and 1 failed.
>=20
> Summary: 1 task failed:
>  =20
> /home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain/r
> ecipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_in
> stall
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1713):=20
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.yoctoproject.org%2Fg%2Fmeta-arm%2Fmessage%2F1713&amp;data=3D04%7C01%7C
> Vinay.SridharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3
> c%7C96ece5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUn
> known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> wiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DHwaRFNz2%2Fo8OtD83YcwUngCFc17wzpX7Zk
> P%2BFCkAgA4%3D&amp;reserved=3D0 Mute This Topic:=20
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.yoctoproject.org%2Fmt%2F80852192%2F3617104&amp;data=3D04%7C01%7CVinay.
> SridharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3c%7C96
> ece5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUnknown%
> 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI6Mn0%3D%7C3000&amp;sdata=3DdITdALtS0RmCy4uvIPjZB6yGDMIC6NOtUq9wkrhjVH
> E%3D&amp;reserved=3D0 Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe:=20
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> s.yoctoproject.org%2Fg%2Fmeta-arm%2Funsub&amp;data=3D04%7C01%7CVinay.Sri
> dharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3c%7C96ece
> 5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> 6Mn0%3D%7C3000&amp;sdata=3DoVafEDlK82x6PFJz3kukwvuXECl5JW%2BD0GMwAkKDIZs
> %3D&amp;reserved=3D0 [denis@denix.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://nam12.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fdenix.org%2F0x420902729A92C964&amp;data=3D04%7C01%7CNach=
iketRahul.Jagade%40Honeywell.com%7Ce49425450ea14bd225ea08d9ce889c5b%7C96ece=
5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767908394296478%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000&amp;sdata=3DxDfgVNwA0j8WFflU4TNhfyV5UQ80zobXOQcsVeYjHTI%3D&amp;reserve=
d=3D0
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

