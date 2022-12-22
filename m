Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BF3C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 06:49:01 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.40278.1671691737904059010
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Dec 2022 22:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=q47Y+zQG;
 spf=pass (domain: linaro.org, ip: 209.85.222.46, mailfrom: sumit.garg@linaro.org)
Received: by mail-ua1-f46.google.com with SMTP id c26so193383uak.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Dec 2022 22:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvdRI0HX+bf2cDCNJymctRT6aXORw9E1Fb1fJB7X1ak=;
        b=q47Y+zQGe945BsovuNic0uVv379FuH7eGYPS9Y0Jg/4a4DLeM1x8wJ6hkSN68BvAFX
         UFHCSRTuMZcs5NTwEViUTBHnqj3ntX1CGiXGq0vEFketCr1pFHoj6uy6pPHfftmxQuUE
         dTsMk78hLLfS82+p9dT63TVfWgTaDNGrecRjvkwHhdcqAZW89eC1I6zNdFrMSkv7TdFF
         7yyICagsggsGoEniWI5NJv9nHyfHEBo/fww6zpKFh/7lC5Ez0eIifP9iTyPqdClMRxxP
         +Yi+VclfYmbH6FV9dnicqKLf2UOhK87fkChDSy+ewn2w3fyhqRMB+OmRXeASt12xUVpS
         jqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvdRI0HX+bf2cDCNJymctRT6aXORw9E1Fb1fJB7X1ak=;
        b=bjVMqaej7K2X1yn7o7EqBn7LgcsauTtwY8SL8fUnTWbFlrJ3foY6cKIVXrAWaZqRAd
         r+czaJAiJvNjNe9TolQ2yToAu/20ZXyNll8T5zoykqLml7o26XCYTRjNcHg03Ieq+Cer
         Rq26T7BTxI7SU06i4ydhhpbFJiBvMik3cShVGQ4Ewq9OMLO7gcrs6yOUVCP8odS7bcTo
         H6dSAQ9xDWlgP1oJTSKHyJGWuEQuUxTuBn19sAeNaqqTLn9CLwpt1HnOWyzBQBJZIWZl
         TObXfL8DyvAmK1Ubrt0DOyupzJTWJ3PmLd26tNJNAU7UnlpOaczXKMJy35JHqUd2WhUc
         EhxQ==
X-Gm-Message-State: AFqh2kpWKNrx7xBIdJawjgeCYYNqpIem/wMKiwP4IvTpo9JXqNSsZ8oO
	Q7qPQcBcdMJP7YNinNa3L7w8K+QnIKBgFO27MVbfQA==
X-Google-Smtp-Source: AMrXdXuJj41kkYfwZ5LXxZpv6cZgBlHnEOMLpljQAkaMV7sr4Q1EvdDVPl6UAkne6k9R7FTk8iOpBKt5Sc2VydEKZ10=
X-Received: by 2002:ab0:55d5:0:b0:437:b40f:b9b5 with SMTP id
 w21-20020ab055d5000000b00437b40fb9b5mr428147uaa.34.1671691736785; Wed, 21 Dec
 2022 22:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20221221143942.15196-1-emekcan.aras@arm.com> <20221221143942.15196-6-emekcan.aras@arm.com>
 <CAFA6WYMN0VaPyPqeYGrQx3+56KA+Pd78H-kEd6xQzF7o3vdOnQ@mail.gmail.com> <DBBPR08MB4838DA8917E1EFA549701D7A8EEB9@DBBPR08MB4838.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4838DA8917E1EFA549701D7A8EEB9@DBBPR08MB4838.eurprd08.prod.outlook.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 22 Dec 2022 12:18:45 +0530
Message-ID: <CAFA6WYNyRUxHCM==QRYYFbHv2g=OACcrfDhP52ydNtxTpjCV_w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os version
To: Emekcan Aras <Emekcan.Aras@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Ross Burton <Ross.Burton@arm.com>, 
	Jon Mason <Jon.Mason@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 22 Dec 2022 06:49:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4223

On Wed, 21 Dec 2022 at 21:29, Emekcan Aras <Emekcan.Aras@arm.com> wrote:
>
>
>
> ________________________________
> From: Sumit Garg <sumit.garg@linaro.org>
> Sent: Wednesday, December 21, 2022 3:37 PM
> To: Emekcan Aras <Emekcan.Aras@arm.com>
> Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Ro=
ss Burton <Ross.Burton@arm.com>; Jon Mason <Jon.Mason@arm.com>; nd <nd@arm.=
com>
> Subject: Re: [meta-arm] [PATCH 5/5] arm/qemuarm-secureboot: pin optee-os =
version
>
> On Wed, 21 Dec 2022 at 20:10, <emekcan.aras@arm.com> wrote:
> >
> > From: Emekcan Aras <emekcan.aras@arm.com>
> >
> > There is a new optee version 3.19. Currently, qemuarm-secureboot cannot=
 boot
> > optee 3.19 out-of-the-box.
>
> This sounds strange since Qemu is regularly tested in OP-TEE build CI
> as well as 3.19 release [1]. Is it really an OP-TEE related issue? Can
> you share details of the boot error you are observing?
>
> [1] https://github.com/OP-TEE/optee_os/commit/afacf356f9593a7f83cae9f9602=
6824ec242ff52
>
> -Sumit
>
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 Panic 'Failed mapping FIP SPs' at c=
ore/arch/arm/kernel/secure_partition.c:1223 <sp_init_all>

This file won't even compile if CFG_SECURE_PARTITION=3Dn which is the
default configuration. So how does it get enabled for Qemu using
OP-TEE 3.19?

> 2022-12-21 11:33:27 - INFO - E/TC:0 0 TEE load address @ 0xcf412000
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 Call stack:
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41eb3c
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42bafc
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41bd4c
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf42d548
> 2022-12-21 11:33:27 - INFO - E/TC:0 0 0xcf41e268
> 2022-12-21 11:33:27 - INFO - runqemu - INFO - SIGTERM received
> 2022-12-21 11:33:27 - INFO - runqemu - INFO - Cleaning up
> 2022-12-21 11:33:27 - INFO - runqemu - INFO - Host uptime: 1436.86
> 2022-12-21 11:33:27 - INFO -
> 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specified
> 2022-12-21 11:33:27 - INFO - tput: No value for $TERM and no -T specified
>
> This is the error message. We also have the same issue for n1sdp since th=
e new optee is looking for an SP manifest in FIP..

AFAIK, secure partitions are not enabled by default in OP-TEE. So how
does that get enabled for Qemu? Also, I can see from your patch-set
that you enable secure partitions explicitly for n1sdp.

> Need to create a bbappend or an inc file for qemuarm-secureboot as well w=
here the necessary flags are set. Just left it for now since there are othe=
r platforms that use optee 3.18 version. I think this can be fixed relative=
ly easily when all the platforms upgrades to 3.19.

I would suggest that we update Qemu as part of OP-TEE uprev as that is
something which others could test as well as something that can be
tested in CI as well.

-Sumit

>
> -Emek
>
> > This pins optee-os version to 3.18 for
> > qemuarm-secureboot.
> >
> > Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> > ---
> >  meta-arm/conf/machine/qemuarm-secureboot.conf   | 3 +++
> >  meta-arm/conf/machine/qemuarm64-secureboot.conf | 3 +++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/meta-arm/conf/machine/qemuarm-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm-secureboot.conf
> > index f08b84fe..db02dc68 100644
> > --- a/meta-arm/conf/machine/qemuarm-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm-secureboot.conf
> > @@ -21,3 +21,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
> >  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
> >
> >  MACHINE_FEATURES +=3D "optee-ftpm"
> > +
> > +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> > +
> > diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm=
/conf/machine/qemuarm64-secureboot.conf
> > index 55c4cab4..7277817d 100644
> > --- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > +++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
> > @@ -23,3 +23,6 @@ WKS_FILE_DEPENDS =3D "trusted-firmware-a"
> >  IMAGE_BOOT_FILES =3D "${KERNEL_IMAGETYPE}"
> >
> >  MACHINE_FEATURES +=3D "optee-ftpm"
> > +
> > +PREFERRED_VERSION_optee-os ?=3D "3.18.%"
> > +
> > --
> > 2.17.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#4220): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/4220
> > Mute This Topic: https://lists.yoctoproject.org/mt/95807186/1777089
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [sumit.gar=
g@linaro.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

