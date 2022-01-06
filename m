Return-Path: <nachiketrahul.jagade@honeywell.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D758C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 05:55:16 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.103])
 by mx.groups.io with SMTP id smtpd.web09.5189.1641448514619606537
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 21:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@honeywell.com header.s=selector1 header.b=ZvNITPcu;
 spf=pass (domain: honeywell.com, ip: 40.107.96.103,
 mailfrom: nachiketrahul.jagade@honeywell.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9yP1Rd1NS3S0MX27mbBwfWd6q4RG2X/7WMBOn8kSja2pgqrK/l4PHepcmCxYAYvFcY/911dSgzWVpE5p90VUzWuHAHrAX/RShpcPUCn/Pv+gn01AVmGrzNLgq5PYk0TWmhIrEWeb9wmvQC1rsdvXFt4Ag6m6tVR8tXWfh57Y725MDIRqF9Tk900L6RgxdxhVTIznNxYocyvLMUX70czePUonWJZ831MgHNziWMXd3XdcRvhGiDkcofv88VmRgj+7v5vL9JtKQ34S3Ag992GvrtGo8gQ2hKZ3i6uzDi9uwlJsW45IiBafvuTSLDA+k6muGzpeNpXA/ZzCqWhdL5WOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPnL5WQe9U46dvZONXb1rngdoT3syD/4vwyLvYMvRlU=;
 b=bhjQhja/rOyF5Otw6xLnsMhgfpFgG4csPlL+pq9iMy7plxggKrOYH8FRmjrScELnEEwXF+ZCsXfnGBdRrpca4qwak5SM3WrqWAnP/h/tEp8RFdQiagZEV6lZKDb6zkw954t6GnSyK/3C2IHjZZBepMa5TF1GLvnb52Wg+RcEq9QGq3GK05FHq726Hz7f/ceoXAw3f3huftuKi0UJgbqM13ReNURxzz7goFfFzPjABlUTbN6FCHAFUYI1iFZynUgLseiVSKrNxSFE9FYONl0acwO94SrzavOnGrUocOQYUxMna/xH7kjECWh9rx/5Rdc3/wG4aeQIT4AmL32EpSgvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=honeywell.com; dmarc=pass action=none
 header.from=honeywell.com; dkim=pass header.d=honeywell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Honeywell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPnL5WQe9U46dvZONXb1rngdoT3syD/4vwyLvYMvRlU=;
 b=ZvNITPcu8hrkkzMsvZSCnJoFmIgJoYbgzltHFIPTCMeO1VCCKv7aZBxqKwmH4Z6MW3mXjR9zXt+gTWAG4BnkCxCo26vUwZ8CagxNCdqanCiEKkZqNwh9lS54z3YG+uE2F7VeRDCud9/EXdQ6fxdidwghrMd7T7IVBFuYEX56lSo=
Received: from BN7PR07MB4644.namprd07.prod.outlook.com (2603:10b6:406:f1::14)
 by BN8PR07MB5796.namprd07.prod.outlook.com (2603:10b6:408:6c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 05:55:10 +0000
Received: from BN7PR07MB4644.namprd07.prod.outlook.com
 ([fe80::edb1:dc10:64da:d4f5]) by BN7PR07MB4644.namprd07.prod.outlook.com
 ([fe80::edb1:dc10:64da:d4f5%3]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 05:55:09 +0000
From: "Jagade, Nachiket" <NachiketRahul.Jagade@Honeywell.com>
To: Jon Mason <jdmason@kudzu.us>
CC: Denys Dmytriyenko <denis@denix.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>, "Sridhara Murthy, Vinay"
	<Vinay.SridharaMurthy@Honeywell.com>, "Ankam, Ravindra"
	<Ravindra.Ankam@Honeywell.com>, "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>, "S, Ramesh" <Ramesh.S@honeywell.com>,
	"Pabolu, ramgopala" <RamGopala.Pabolu@Honeywell.com>
Subject: RE: [External] Re: Questions to create custom distro for TI am335x
Thread-Topic: [External] Re: Questions to create custom distro for TI am335x
Thread-Index: AdgAxbMGpSQvE0/+R5KdcLLTgwRA+ABmy+eAABg2TWA=
Date: Thu, 6 Jan 2022 05:55:09 +0000
Message-ID: 
 <BN7PR07MB464442210C3452F7AC740045854C9@BN7PR07MB4644.namprd07.prod.outlook.com>
References: 
 <BN7PR07MB4644CB07307C600A12570158854A9@BN7PR07MB4644.namprd07.prod.outlook.com>
 <YdXhX4F9iK/yw2bo@kudzu.us>
In-Reply-To: <YdXhX4F9iK/yw2bo@kudzu.us>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Enabled=true;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SetDate=2022-01-06T05:55:05Z;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Method=Standard;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Name=d546e5e1-5d42-4630-bacd-c69bfdcbd5e8;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SiteId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ActionId=68596d55-e9fe-4f61-880f-8fa37b5c9b8b;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ContentBits=0
smarttag: 4
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Honeywell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccbf5104-56c1-437a-c13b-08d9d0d918e1
x-ms-traffictypediagnostic: BN8PR07MB5796:EE_
x-microsoft-antispam-prvs: 
 <BN8PR07MB57968D6BE80EC30FD616F035854C9@BN8PR07MB5796.namprd07.prod.outlook.com>
x-antispam: TRUE
x-recptdomain: NotTLSDomain
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rLgVN0HUHDRl+xOHrNi847YCimMjcFgeDa423CwwzUDVy7qvDl2RuzMWVJEKIev4B9Hfl8/LTA58IYoJrmPJWV2W1te4GjFoQLpJkJxrP/cBYtaVjNCGSOt8tMDAUnaoICQu6H8ox/ajbKqgV8NBifbKJ1uJMma+D2goVEUfLr7FAOW//5yEl2dMvwMS7G/JlcWSwAq66Tc4f6zVZiK/d9xlzP5sRo1Dcn3Iqw1Aj9r3ay/xAcltjNhuBQYUYVY1uvZJtnaJdzcI/+f09WDpy6SccpdyKjeLLaNgZfOYzCS9B63YDjX9Mxa8wNvLluYC0u16Bfwg4NaSajE+WKPhF2mriLEuk5UnFB0rq7Oe3m0BEjwrx68NRrsAKS39qPTEOUlOwooNsjqO94QU28h0K1Q5uWWXu9I5TVeR6IZhfIHLBVGS3xnE0BtFdHa23uA3siX8Sgdro7HjoYsEZxVJo2Z6H1Udy9EKmjLLfW54CIv0UOmeO9fJHjETj4draykTxB4crYuqDDovMv+DBmkHtZ0KmptJcT6/HFn0NXs5C77VE5rhi/CHg3U5WxQCQQe2QLQei9Kce9lDFoZCaNByvUaIG/XU2wEBr+kJAt2QFYOkSJL4/QAsGUDC/x6kbnbqJFBqQy1b1TC8HRzaLtmEHZROnY9Y6ga48TDwMk+nsy5TO5+J6NSgOF9FrM93/uCAkBZJRtLH4a7GVtUlnCZT4Xhfm9tLw0o2Wre6Z9SyVxwz6nHm8fZzVy1A4EbS6NTtF61G3eOaW8z/KI3q6o/syTuZ4WjQ/nfTdTWnoirZJBWC7dIumJsd1GR2V7OZhUD76CTUdt4VO8dwp+lXrBtSshsimappqOm5d/aozeQphgw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR07MB4644.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(66476007)(66946007)(186003)(64756008)(55016003)(7696005)(66556008)(83380400001)(122000001)(26005)(2906002)(4326008)(71200400001)(66574015)(966005)(8936002)(53546011)(107886003)(66446008)(6506007)(33656002)(86362001)(38070700005)(6916009)(508600001)(316002)(8676002)(9686003)(52536014)(45080400002)(30864003)(38100700002)(54906003)(82960400001)(5660300002)(19627235002)(579004)(10090945008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?i74u94133zvLtPbt9c6UJFMZNgXn+tN7JueTBd+a0lFJs3QuxmyUqzMUvzhL?=
 =?us-ascii?Q?7+Jw4X8zIJhtkvrKDo9T7tF0BtZoA6SpUAZYOh/HcWQgwINwE5fK+KopBW/V?=
 =?us-ascii?Q?fPPuF9+RkmMf4mdNbZd7Dp2kGeGCmB7rvOY8yAYVAKOUKVhq/rrOnz8QsqrF?=
 =?us-ascii?Q?KfoKr8auy23wvQ8JnLv+gS4IRuI8ONKyvaApOuh5TMJJ9yR3VZl7IJDPUbLz?=
 =?us-ascii?Q?W9ByapmcXITkUIpNO2NI1uZjYq0deDSYswiNU/tq6p7X+u5SJXaiwKl2daLh?=
 =?us-ascii?Q?brnQqstaMQIFvbM46K02RQf9mbfkWmi++3Ior8rU+krJJel2a72n3sBo/p6R?=
 =?us-ascii?Q?aAWClhh8DJAg4O9uMUPAxrXYYf0s6ROX7LUW1OLUlW+DOQ1/TAzzFFYOgWY+?=
 =?us-ascii?Q?+Ro0XrIQ7e5h+y59GmRA+DoxOadJ/Dqplxu+7UB1NETjfyh1u7pwCtOhuSlb?=
 =?us-ascii?Q?Ck5eJLPr51ibZ2Zmrjz27rlmV0c6l/k6c/9Yknw43xYstKjn0d4spCwfKdV9?=
 =?us-ascii?Q?S2fWzIw8cXIfOwYl0wTQ4x3YMGvNqv5ACCO2BXTCapNdkIWIzOrWmJ4mK/Hp?=
 =?us-ascii?Q?KH25r3HYpcU3Yauytf2AedkF/Oa+w99DjFR+ImuuH7uQ3NpHLwSx/OmwDSKR?=
 =?us-ascii?Q?COzBhAPEwD7mPs+1BZr+1VtCsFEFWSG286YxC+s6c+zrvcaBvmQ19J5SWiAU?=
 =?us-ascii?Q?4g9d9paaNqAsrtGUrRvZahB3E2Oi+CuXFXaiH8+CFH1oZNtMwra76WxX4neX?=
 =?us-ascii?Q?lcUXbOMDXwyqb7YJhhl4x2kN01asCe2ecdzlJ0dL0W2xLm9zfhWd0UvWg0K1?=
 =?us-ascii?Q?pxM1LLbDS/iBe9837FNrsLl0EH2Ir5xV7oGa34t8SAyKZsgOovWQ3hVvUmij?=
 =?us-ascii?Q?NwReGDFsL8BzvFd1iBfYk0lKZHlOWUJrhdVEJHCCT8RPnqjWHTAWmghVj5uv?=
 =?us-ascii?Q?7ARjCgvSQpbMgIYw5b/nrBWTZIduLsC7C1GruioAIJbMjfWjNi9DeBeyOTcA?=
 =?us-ascii?Q?uu1GKxXCg5yk3mSPZtscU0yLT27aStRNbDP47TxXf46TykQPhiA5o5tEp98b?=
 =?us-ascii?Q?gnjWBSIYU1UCgi/pFznXzc10CR0SqzXjF6U2P1uuscrBzG0zn9ZT+h00cs8V?=
 =?us-ascii?Q?BQ7P+7P5pggXpQURqaj0WAZhYDPF0deXisBVAufOQEfcoFUUVnb2hDC+CE4M?=
 =?us-ascii?Q?hzhpRLDBeQv0mwcQe8cObrsP5CuCKpPFrYF39PttmDGQCmUo4heEbI9PwVbu?=
 =?us-ascii?Q?3cHhiwpZtofXtpY7+r4t4gUwURAtvDfTSzJMnXhvTJ0Fo3oD1re4vEwu04YY?=
 =?us-ascii?Q?IzlxTYJxn9ytiw+WEv6F/7WB9Oza4OYcZe1rYs1EPANMlq0WMkAjHw0hD3K4?=
 =?us-ascii?Q?UxiKbS4nOp0Rq3arZQaupng6BXwv+O1TlmPMpg77xh6M9ly5XjgwN2qKY5Li?=
 =?us-ascii?Q?7+BO4PERufpN5aDkNUivAgNIQdGesUFiGnEzVbYj4JrRR9doR8oTN1A890hP?=
 =?us-ascii?Q?qjBtV/8XV0czmol7lRkE2iPOZ77qtFzU/xhEVDq4lxuO8aNQMX+dsB1upWsZ?=
 =?us-ascii?Q?jruxDxA2B0zW8fqaZ36T7LrMzUGd+cmR3R2PsPHrEf78lQzqzBRvbKwSkiK+?=
 =?us-ascii?Q?UvMFfIIqMzObdWCjW+4U1LOay7pj0vnYS+Jc8RnJ9b1lydvbHAgHKqTGL5Tj?=
 =?us-ascii?Q?drfJyKgPeyUR8LbXriEKBohW9pkJxo+CDoFADrCKlwa1d9egKYndazC4KGq7?=
 =?us-ascii?Q?iUKgC/mUTg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR07MB4644.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccbf5104-56c1-437a-c13b-08d9d0d918e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2022 05:55:09.2158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 d08/Tc3+gKc4zmquzaWe9TgVIWOiCe5E24sPmAyXirnH3oGtQvI6fRekZz7Gkkn8AX13WsIDx71GCFB0bKhYTjI/prnS7H6jcfq8ARj/5dhtHVYsbmwiNxuKtIWXDx5e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR07MB5796
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Jan 2022 05:55:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2801

Adding meta-arago mailing list as per Jon's suggestion


-----Original Message-----
From: Jon Mason <jdmason@kudzu.us>=20
Sent: 05 January 2022 11:50 PM
To: Jagade, Nachiket <NachiketRahul.Jagade@honeywell.com>
Cc: Denys Dmytriyenko <denis@denix.org>; meta-arm@lists.yoctoproject.org; S=
ridhara Murthy, Vinay <Vinay.SridharaMurthy@honeywell.com>; Ankam, Ravindra=
 <Ravindra.Ankam@honeywell.com>
Subject: [External] Re: Questions to create custom distro for TI am335x

[You don't often get email from jdmason@kudzu.us. Learn why this is importa=
nt at http://aka.ms/LearnAboutSenderIdentification.]

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.

On Tue, Jan 04, 2022 at 05:35:18AM +0000, Jagade, Nachiket wrote:
> Hello Denys,
>
> Happy new year.
> We are working on TI am335x sitara based platform. You had replied to que=
stions of my colleague long ago.
> We have created custom distro which is a mix of arago and poky. Reason is=
 that when we last checked, arago distro did not had latest version of appl=
ications. And when I say application, I refer to open source packages such =
as python, apparmor etc.
> Also some layers were not available in arago and we had to resolve many d=
ependencies while compiling.
>
> Now we want to make a distro with latest versions of all required package=
s. So shall we go with 3.4 Honister or with latest dunfell release 3.1.13 ?=
 Our main aim is to have latest versions of packages with less number of vu=
lnerability count. What will you suggest to achieve this?

This is not a Arm specific question.  So, your questions are better asked o=
n openembedded-core@lists.openembedded.org or yocto@lists.yoctoproject.org =
(or meta-arago@arago-project.org).

That being said, dunfell is the Yocto Project LTS and there is a dunfell br=
anch in meta-arago.  So, there should be less pain in using that for your h=
ybrid approach.

Thanks,
Jon


>
>
> Thanks and regards,
> Nachiket
>
>
> -----Original Message-----
> From: Denys Dmytriyenko <denis@denix.org>
> Sent: Wednesday, February 24, 2021 1:35 AM
> To: Ankam, Ravindra <Ravindra.Ankam@Honeywell.com>
> Cc: meta-arm@lists.yoctoproject.org
> Subject: [External] Re: [meta-arm] Error while building the custom=20
> image
>
> Hi,
>
> You seem to have a very strange combination of layers and mix of branches=
!
>
> For example, is this a Poky distro or Arago? Why do you include meta-poky=
 if DISTRO =3D "arago"?
> Why do you have some layers on "gatesgarth" and some on unstable "master"=
?
> And finally, Arago distro currently does not fully support master or gate=
sgarth with the external Arm toolchain, only dunfell.
>
> --
> Denys
>
>
> On Tue, Feb 23, 2021 at 02:47:48PM +0000, Ankam, Ravindra via lists.yocto=
project.org wrote:
> > Hi,
> >                 Please attached the error logs.
> > Can you please help how to address this issue?
> >
> > Thanks and regards,
> > Ravi
>
>
> > poky/build$ MACHINE=3Dam335x-evm bitbake custom-base-image Loading
> > cache: 100%
> > |######################################################################=
##############################################################| Time: 0:00:=
00 Loaded 4805 entries from dependency cache.
> > WARNING: No recipes in default available for:
> >  =20
> > /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distr
> > o/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
> >
> > /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distr
> > o/ recipes-graphics/wayland/weston_8.0.0.bbappend
> >
> > /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distr
> > o/ recipes-support/opencv/opencv_3.1.bbappend
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "1.48.0"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "ubuntu-16.04"
> > TARGET_SYS           =3D "arm-linux-gnueabi"
> > MACHINE              =3D "am335x-evm"
> > DISTRO               =3D "arago"
> > DISTRO_VERSION       =3D "2020.09"
> > TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard=
"
> > TARGET_FPU           =3D "hard"
> > meta
> > meta-poky
> > meta-yocto-bsp
> > meta-custom          =3D "my-yocto-3.2.1:943ef2fad8428f002850e3655a3312=
e13d0dcb2c"
> > meta-arm
> > meta-arm-toolchain   =3D "gatesgarth:7185d29de9f54d2cb5b2da35b0c3f1e5f3=
81db2c"
> > meta-clang           =3D "master:16f757de2d90594476d2c8feefd3a850c3c249=
31"
> > meta-ti              =3D "master:fb4726a88cbb5a6311bdb3095b81d314e344a3=
22"
> > meta-arago-distro
> > meta-arago-extras    =3D "master:f90d1bed7e775ac59bf1fcd95e95e9109d0953=
db"
> > meta-qt5             =3D "master:23f7a1c8eabaf1beb80cc6214954c0e1751c4c=
bd"
> > meta-virtualization  =3D "master-next:3389eb0f128b1ef1d1aaf518afdf298a8=
8f89619"
> > meta-networking
> > meta-python
> > meta-perl
> > meta-oe
> > meta-gnome
> > meta-multimedia
> > meta-filesystems     =3D "gatesgarth:cef93b7b00e620d90a610112ee574fa60b=
691cf8"
> > meta-tpm
> > meta-security
> > meta-security-compliance =3D "master:16ee7308c9fd48d69b02c5519d2e5edddc=
560658"
> > meta-selinux         =3D "gatesgarth:36db146d56535318d343dc913835888535=
6f2172"
> > meta-linaro
> > meta-optee           =3D "master:11091b487e1ad4c6a4adfac34d958a3d9d9ccd=
17"
> >
> > Initialising tasks: 100%
> > |###################################################################
> > |##
> > ##########################################################| Time:
> > 0:00:02 Sstate summary: Wanted 1003 Found 0 Missed 1003 Current 22=20
> > (0% match, 2% complete)
> > NOTE: Executing Tasks
> > ERROR: external-arm-toolchain-2019.12-r0 do_install: '_sre.SRE_Match'
> > object is not subscriptable
> > ERROR: Logfile of failure stored in:
> > /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> > c/=20
> > work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0
> > /t
> > emp/log.do_install.22351
> > Log data follows:
> > | DEBUG: Executing python function extend_recipe_sysroot
> > | NOTE: Direct dependencies are
> > | ['virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/rec
> > | ip es-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/reci
> > | pe s-devtools/rsync/rsync_3.2.3.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/reci
> > | pe s-extended/xz/xz_5.2.5.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/reci
> > | pe s-devtools/bison/bison_3.7.2.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/reci
> > | pe s-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',
> > | '/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/qu
> > | il t/quilt-native_0.66.bb:do_populate_sysroot',
> > | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/reci
> > | pe s-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
> > | NOTE: Installed into sysroot: []
> > | NOTE: Skipping as already exists in sysroot: ['patch-native',=20
> > | 'rsync-native', 'xz-native', 'bison-native', 'pkgconfig-native',=20
> > | 'quilt-native', 'pseudo-native', 'texinfo-dummy-native',=20
> > | 'libtool-native', 'gnu-config-native', 'gettext-minimal-native',=20
> > | 'automake-native', 'flex-native', 'autoconf-native',=20
> > | 'attr-native', 'acl-native', 'popt-native', 'm4-native']
> > | DEBUG: Python function extend_recipe_sysroot finished
> > | DEBUG: Executing shell function do_install=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libanl.so.1 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libanl-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libBrokenLocale.so.1 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libBrokenLocale-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libc.so.6 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libc-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libcrypt.so.1 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libcrypt-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libdl.so.2 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libdl-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libm.so.6 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libm-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libnsl.so.1 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libnsl-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libnss_compat.so.2 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libnss_compat-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libnss_db.so.2 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libnss_db-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libnss_dns.so.2 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libnss_dns-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libnss_files.so.2 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libnss_files-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libnss_hesiod.so.2 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libnss_hesiod-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libpthread.so.0 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libpthread-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libresolv.so.2 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libresolv-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/librt.so.1 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/librt-2.30.so, keep it=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2-
> > | r0/image/lib/libutil.so.1 is a symlink of=20
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/image/lib/libutil-2.30.so, keep it
> > | rmdir: failed to remove
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-g
> > | li
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.
> > | 12
> > | -r0/image/usr/bin': Directory not empty
> > | rmdir: failed to remove
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-g
> > | li
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.
> > | 12
> > | -r0/image/usr/sbin': Directory not empty
> > | rmdir: failed to remove
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-g
> > | li
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.
> > | 12
> > | -r0/image/sbin': Directory not empty
> > | NOTE: make -j 3 HOSTCC=3Dgcc  HOSTCPP=3Dgcc  -E headers_install INSTA=
LL_HDR_PATH=3D/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-a=
rm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-=
r0/external-arm-toolchain-2019.12/usr
> > |   INSTALL
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/external-arm-toolchain-2019.12/usr/include
> > | mv: cannot stat
> > | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-g
> > | li
> > | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.
> > | 12
> > | -r0/image/usr/lib/gcc/arm-none-linux-gnueabihf': No such file or=20
> > | directory
> > | WARNING: /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-=
arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12=
-r0/temp/run.do_install.22351:415 exit 1 from 'mv /home/airport/ravi/yocto_=
gatesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnu=
eabi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnu=
eabihf /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib=
c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/imag=
e/usr/lib/gcc/arm-linux-gnueabi'
> > | WARNING: Backtrace (BB generated script):
> > |       #1: do_install, /home/airport/ravi/yocto_gatesgarth/poky/build/=
tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-tool=
chain/2019.12-r0/temp/run.do_install.22351, line 415
> > |       #2: main,
> > | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gl
> > | ib
> > | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.1
> > | 2- r0/temp/run.do_install.22351, line 415
> > | ERROR: '_sre.SRE_Match' object is not subscriptable
> > ERROR: Task (/home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm=
-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.b=
b:do_install) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 242 tasks of which 239 didn't need to be=
 rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >
> > /home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain
> > /r=20
> > ecipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_
> > in
> > stall
> > Summary: There was 1 WARNING message shown.
> > Summary: There was 1 ERROR message shown, returning a non-zero exit cod=
e.
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#1713):
> > https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli
> > st=20
> > s.yoctoproject.org%2Fg%2Fmeta-arm%2Fmessage%2F1713&amp;data=3D04%7C01%
> > 7C
> > Vinay.SridharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83d
> > a3=20
> > c%7C96ece5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7C
> > Un=20
> > known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> > aW=20
> > wiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DHwaRFNz2%2Fo8OtD83YcwUngCFc17wzpX7
> > Zk
> > P%2BFCkAgA4%3D&amp;reserved=3D0 Mute This Topic:
> > https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli
> > st=20
> > s.yoctoproject.org%2Fmt%2F80852192%2F3617104&amp;data=3D04%7C01%7CVinay=
.
> > SridharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3c%7C
> > 96=20
> > ece5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUnknow
> > n%=20
> > 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> > JX=20
> > VCI6Mn0%3D%7C3000&amp;sdata=3DdITdALtS0RmCy4uvIPjZB6yGDMIC6NOtUq9wkrhj
> > VH
> > E%3D&amp;reserved=3D0 Group Owner:=20
> > meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli
> > st=20
> > s.yoctoproject.org%2Fg%2Fmeta-arm%2Funsub&amp;data=3D04%7C01%7CVinay.S
> > ri=20
> > dharaMurthy%40Honeywell.com%7Cbb8e0988781b4c3e846408d9ce83da3c%7C96e
> > ce=20
> > 5269c7d48b08daf8b93c90a5d18%7C0%7C0%7C637767887969200715%7CUnknown%7
> > CT=20
> > WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> > CI=20
> > 6Mn0%3D%7C3000&amp;sdata=3DoVafEDlK82x6PFJz3kukwvuXECl5JW%2BD0GMwAkKDI
> > Zs
> > %3D&amp;reserved=3D0 [denis@denix.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 -=20
> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdeni
> x.org%2F0x420902729A92C964&amp;data=3D04%7C01%7CNachiketRahul.Jagade%40h
> oneywell.com%7Cfe107bb437184a2b76b908d9d0780723%7C96ece5269c7d48b08daf
> 8b93c90a5d18%7C0%7C0%7C637770036639019423%7CUnknown%7CTWFpbGZsb3d8eyJW
> IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&
> amp;sdata=3DWFyQmhJ3fARDpyvin%2BLAZIu95iIx%2BrxxDWx9Li2dnTc%3D&amp;reser
> ved=3D0
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>

