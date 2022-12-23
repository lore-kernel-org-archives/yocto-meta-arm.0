Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8875DC4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 05:48:06 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.66488.1671774480542903472
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 21:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Vfc68WwV;
 spf=pass (domain: linaro.org, ip: 209.85.221.174, mailfrom: sumit.garg@linaro.org)
Received: by mail-vk1-f174.google.com with SMTP id v81so1869241vkv.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 22 Dec 2022 21:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsOEyzwJ8TMzxBy7YxlAVGbuoiu+l07cvgfbXFugUx0=;
        b=Vfc68WwVr3cToApwACAJBD8RM4vXkNYQk8klYTSt0F2ChlR6ms9SMY6VBGNtTdloIb
         TBjQpfLZN080qibBRL8EDehTZL+CW1GsepL6+kZZfv4M944vRpQbWp3wdDpZ/iI8g8c5
         qWjtIEUZEHovMslGasWZiXYReuQ0RlrzUeWg4/vQeRp6gDZe78C92FBlY4+/1VkY8w8n
         gi/kq0GcFOatswYZ9+5o61opjlmrUt6R8JJhxxfg9ygX2vAHnAMcL9dSOVl7lsUXCOhr
         uB5YdXsqgc30sMN6HBJiM99UzSIqyAxbC0H5UvpiunTm/2J+HgjDCKlT1aEpTe/XqXqV
         8THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsOEyzwJ8TMzxBy7YxlAVGbuoiu+l07cvgfbXFugUx0=;
        b=OvgQ0H7zQwmiNR6k696GuLYC2Zxnw/LGytSHQwpqXYh1OZq3iu3T0HKSq+ZedmKDrX
         N/3oQiukyNB7NzZhuoUiMOzRwgh32pAsWdbGUbVQ5CVjx41jtp21QJB01ZagAbOWtoG4
         R5bxTja9BC/vcwYXNpvawoxnIwlkvlYAj8r8DQorHEuP5IhoxH91f+0Z03Coq1DGuM30
         Xs4GIKb6sLFUgYByBy1YWUcDv2DC03eIdR0fI9exWwLTkrj6XT7gPLjGV4oxf9B79pH9
         n56keNng1zgQTHxbXLV+lZ+aBUqUuAPC7/n97ls/q7ExjQqFFx3D+p2AL8lJ60gsVQHu
         rJXg==
X-Gm-Message-State: AFqh2koaWtegmk+JW3e4+vWl31drVeYE3oy1+/e3GYMhNQH8gYEN6Ss4
	BstI0/wSyqOOEtkOWVMINlxFXCCjC45Mls6rZhNz/A==
X-Google-Smtp-Source: AMrXdXsqF4JenY7Y65iF+1lFgIz7susUBKO/m1qcT+tT9lnTLblKwPPPaT0zKZjks0cXe8EBMM4pyjqZRlMAd9BFPEs=
X-Received: by 2002:a1f:9dc6:0:b0:3bc:cbd6:4778 with SMTP id
 g189-20020a1f9dc6000000b003bccbd64778mr898044vke.18.1671774479377; Thu, 22
 Dec 2022 21:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20221221143942.15196-1-emekcan.aras@arm.com> <20221221143942.15196-6-emekcan.aras@arm.com>
 <CAFA6WYMN0VaPyPqeYGrQx3+56KA+Pd78H-kEd6xQzF7o3vdOnQ@mail.gmail.com>
 <DBBPR08MB4838DA8917E1EFA549701D7A8EEB9@DBBPR08MB4838.eurprd08.prod.outlook.com>
 <CAFA6WYNyRUxHCM==QRYYFbHv2g=OACcrfDhP52ydNtxTpjCV_w@mail.gmail.com> <DBBPR08MB48384A6FC8780E6DFCE384698EE89@DBBPR08MB4838.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB48384A6FC8780E6DFCE384698EE89@DBBPR08MB4838.eurprd08.prod.outlook.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 23 Dec 2022 11:17:48 +0530
Message-ID: <CAFA6WYOHFj7LLtnc9jEQfZwLXAkFQDwg-FCOdoXGxjge_a5JCg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os version
To: Emekcan Aras <emekcan.aras@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross Burton <Ross.Burton@arm.com>, 
	Jon Mason <Jon.Mason@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Dec 2022 05:48:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4226

On Thu, 22 Dec 2022 at 14:12, Emekcan Aras <emekcan.aras@arm.com> wrote:
>
> From: Sumit Garg <sumit.garg@linaro.org>
> Sent: Thursday, December 22, 2022 6:48 AM
> To: Emekcan Aras <Emekcan.Aras@arm.com>
> Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ro=
ss Burton <Ross.Burton@arm.com>; Jon Mason <Jon.Mason@arm.com>; nd <nd@arm.=
com>
> Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os =
version
>
> On Wed, 21 Dec 2022 at 21:29, Emekcan Aras <Emekcan.Aras@arm.com> wrote:
> >
> >
> >
> > ________________________________
> > From: Sumit Garg <sumit.garg@linaro.org>
> > Sent: Wednesday, December 21, 2022 3:37 PM
> > To: Emekcan Aras <Emekcan.Aras@arm.com>
> > Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; =
Ross Burton <Ross.Burton@arm.com>; Jon Mason <Jon.Mason@arm.com>; nd <nd@ar=
m.com>
> > Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-o=
s version
> >
> > On Wed, 21 Dec 2022 at 20:10, <emekcan.aras@arm.com> wrote:
> > >
> > > From: Emekcan Aras <emekcan.aras@arm.com>
> > >
> > > There is a new optee version 3.19. Currently, qemuarm-secureboot cann=
ot boot
> > > optee 3.19 out-of-the-box.
> >
> > This sounds strange since Qemu is regularly tested in OP-TEE build CI
> > as well as 3.19 release [1]. Is it really an OP-TEE related issue? Can
> > you share details of the boot error you are observing?
> >
> > [1] https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83cae9f96=
026824ec242ff52
> >
> > -Sumit
> >
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 Panic 'Failed mapping FIP SPs' at=
 core/arch/arm/kernel/secure_partition.c:1223 <sp_init_all>
>
> This file won't even compile if CFG_SECURE_PARTITION=3Dn which is the
> default configuration. So how does it get enabled for Qemu using
> OP-TEE 3.19?
>
> I don't know. I saw that you've developed the qemu recipes. So hoping tha=
t you might answered this :)
> Maybe optee 3.19 set this explicitly. This patchset was already reviewed =
by maintainers actually and ran on different platforms.
> It could be related to the recipe as well, but as you can see I'm not doi=
ng anything complicated there.
>
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 TEE load address @ 0xcf412000
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 Call stack:
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41eb3c
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42bafc
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41bd4c
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42d548
> > 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41e268
> > 2022-12-21 11:33:27 - INFO - runqemu - INFO - SIGTERM received
> > 2022-12-21 11:33:27 - INFO - runqemu - INFO - Cleaning up
> > 2022-12-21 11:33:27 - INFO - runqemu - INFO - Host uptime: 1436.86
> > 2022-12-21 11:33:27 - INFO -
> > 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specifi=
ed
> > 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specifi=
ed
> >
> > This is the error message. We also have the same issue for n1sdp since =
the new optee is looking for an SP manifest in FIP..
>
> AFAIK, secure partitions are not enabled by default in OP-TEE. So how
> does that get enabled for Qemu? Also, I can see from your patch-set
> that you enable secure partitions explicitly for n1sdp.
>
> > Need to create a bbappend or an inc file for qemuarm-secureboot as well=
 where the necessary flags are set. Just left it for now since there are ot=
her platforms that use optee 3.18 version. I think this can be fixed relati=
vely easily when all the platforms upgrades to 3.19.
>
> I would suggest that we update Qemu as part of OP-TEE uprev as that is
> something which others could test as well as something that can be
> tested in CI as well.
>
> I kindly disagree with this :) Normally, there is always an uprev work fo=
r components every now and then.

The general practice is to bump up the component's version rather than
supporting multiple versions. If any bsp layer like meta-arm-bsp has a
different need for a component version then it can stick to an older
version and migrate later.

> Someone pushes a new recipe for the new version and if any platform fails=
, Maintainers ask platform-maintainers to fix it.

Qemu support is part of the meta-arm layer which has the OP-TEE
recipes too, see:

$ ls meta-arm/conf/machine/
generic-arm64.conf  qemuarm64-secureboot.conf  qemuarm-secureboot.conf
 qemu-generic-arm64.conf

So I would leave it upto meta-arm maintainers to decide here.

-Sumit

> At least that's our experience on corstone1000 and it makes sense, to be =
honest. I think optee uprev work and upgrading other platforms should go se=
parately if it doesn't work out-of-the-box. I.E. Next month, I'll update co=
rstone1000 to optee 3.19, because it doesn't work quite right with the new =
version. However, this is not related to the new recipe, it's rather relate=
d to configurations.
>
> -Sumit
>
> >
> > -Emek
> >
> > > This pins optee-os version to 3.18 for
> > > qemuarm-secureboot.
> > >
> > > Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> > > ---
> > >  meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
> > >  meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
> > >  2 files changed, 6 insertions(+)
> > >
> > > diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm=
/conf/machine/qemuarm-secureboot.conf
> > > index f08b84fe..db02dc68 100644
> > > --- a/meta-arm/conf/machine/qemuarm-secureboot.conf
> > > +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
> > > @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
> > >  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
> > >
> > >  MACHINE_FEATURES +=3D "optee-ftpm"
> > > +
> > > +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> > > +
> > > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-a=
rm/conf/machine/qemuarm64-secureboot.conf
> > > index 55c4cab4..7277817d 100644
> > > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > > @@ -23,3 +23,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
> > >  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
> > >
> > >  MACHINE_FEATURES +=3D "optee-ftpm"
> > > +
> > > +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> > > +
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4224): https://lists.yoctoproject.org/g/meta-arm/mess=
age/4224
> Mute This Topic: https://lists.yoctoproject.org/mt/95807186/1777089
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.garg@=
linaro.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

