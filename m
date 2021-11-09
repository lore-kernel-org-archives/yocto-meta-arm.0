Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5016AC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 02:48:27 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.7008.1636426106261530130
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 18:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=GIx3Brsl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id bk22so17512858qkb.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 18:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfRGYbfd7wVRO0SHyWEFQXI53BX22FpkPsan+HEFGs8=;
        b=GIx3BrslFrpTkhqKep0MAHiccqsUODipfyPvxxt+Tc8J4FqA44eXKVoa+MLX3vM8s0
         /nfQU/3or2NDTjVddW8Q+h14h4Izn5iHcMhXvtumwDwWUyKrxErRb/Yy5PHbE+I6XZ8m
         I7bpTqPAaTmYd30e1AcYtz4Ykm3pinuSRksqVUEsFdGNaKThvfDdI/mBZZxuZMVeC6TV
         Qayem+yb7+vMIyuXeHanWQEjkwguV3TPk/Xnt0pZbNSkKdkuWtAnSJV6HC3gLVpKeTou
         LLTrNwM244BIhhufoIIqBPETeh2rJ5wrW36UFBaEq86j7c90FRLjx0sobiDx6non+IVZ
         EHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfRGYbfd7wVRO0SHyWEFQXI53BX22FpkPsan+HEFGs8=;
        b=IzMBlIKNHHSL+EvwBRNqc/vY0nipfuFfAHqOmFXiAdZ+Aa+hseMrZ0okeO3DtAf3ra
         wlud4v//s2h/7FhyjQpUSOsg876/En/HdUI9MXQk3kUznfS0vFmh8G0xVHhy9NAkIgF7
         JKU2VQuz2pP0NVk6JyOO2lj5jR/xtB5wSEeQjAHmNzVl4pP000OOZGJ2mXGxi6YjS5U3
         SaowsOoo1j6UWEYe5t+nrWTm7HNtsCzmP3uK1PIKbglRezQ0o1cUIov69Q9brx+m6R5U
         /ICKWPf7osXKNizKHRrtOnU0bNvyLZNuahAABjEZzSnAQDJIUBIc81WQDHGW3oG+KXu8
         53+g==
X-Gm-Message-State: AOAM531BpLj5spZMLmOuhpVwWlTORJvqZKzMMsvH63ctbGSqzM/tXW1B
	D9BIUBvCKhjlcQfhP2ZkbYwEzCUQ4ZiZ3QoR22F4Sg==
X-Google-Smtp-Source: 
 ABdhPJwgzUuF1VkU5T7DpVnLHzOuf/pVx7RdiNCI3E/3HapA2wP4q/4Eqx54t/vef6AHsg60R+9pSA7WrtX/OawwGYs=
X-Received: by 2002:a37:9244:: with SMTP id u65mr3348289qkd.46.1636426105234;
 Mon, 08 Nov 2021 18:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20211103131144.4005-1-maxim.uvarov@linaro.org>
 <20211103154101.GA31775@kudzu.us>
 <CAD8XO3bGMK5=O_9JF4AdS4OQ7DOXWPE2J23dpuvczqOTtsTG=Q@mail.gmail.com>
In-Reply-To: 
 <CAD8XO3bGMK5=O_9JF4AdS4OQ7DOXWPE2J23dpuvczqOTtsTG=Q@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 8 Nov 2021 21:48:14 -0500
Message-ID: 
 <CAPoiz9yBmHOfP+4iNFBuvKd5aed3Yqau55o15ygXGT_sZ75dHg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] optee: updae optee-os.inc to support
 external TAs
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 02:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2346

On Mon, Nov 8, 2021 at 7:52 AM Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Wed, 3 Nov 2021 at 18:41, Jon Mason <jdmason@kudzu.us> wrote:
> >
> > This patch doesn't appear to apply to my tree.
> >
>
> Thanks for your review.  I will try to fix comments in v2. Do you
> manifest for the meta-arm somewhere? So I can test it locally in an
> environment close to your CI then combine layers together by myself.

We use Gitlab CI and KAS.  It works externally, as you can see from me
running it on my personal gitlab instance and docker container running
on my desktop.
https://gitlab.com/jonmason00/meta-arm/-/pipelines

It is probably overkill for you to set up something like this, but you
can use KAS fairly trivially and use our CI machine definitions.  For
OPTEE, I think you would want to build against the
qemuarm64-secureboot machine.  Something like:
$ pip install kas
$ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml

If you get stuck, message me on IRC and I'll do my best to help you.
Thanks,
Jon

>
> Maxim.
>
> > Applying: optee: updae optee-os.inc to support external TAs
> > error: patch failed: meta-arm/recipes-security/optee/optee-os.inc:44
> > error: meta-arm/recipes-security/optee/optee-os.inc: patch does not apply
> > Patch failed at 0001 optee: updae optee-os.inc to support external TAs
> >
> >
> > Other comments below
> >
> >
> > On Wed, Nov 03, 2021 at 04:11:43PM +0300, Maxim Uvarov wrote:
> > > Separate recipe for TA devkit is needed to solve
> > > circular dependency to  build TAs withthe devkit
> >
> > Nit, space between "with" and "the" needed and extra space before
> > "build"
> >
> > > and integrate it inside optee-os.
> > >
> > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > ---
> > >  .../optee/optee-os-tadevkit_3.11.0.bb          | 18 ++++++++++++++++++
> > >  meta-arm/recipes-security/optee/optee-os.inc   |  6 ------
> > >  2 files changed, 18 insertions(+), 6 deletions(-)
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > >
> > > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > > new file mode 100644
> > > index 0000000..d20cee9
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > > @@ -0,0 +1,18 @@
> > > +FILESEXTRAPATHS_prepend := "${THISDIR}/optee-os:"
> >
> > This is the old syntax, which is probably one of the reasons why it
> > doesn't apply on the latest.
> >
> > > +require optee-os_3.11.0.bb
> > > +
> > > +SUMMARY = "OP-TEE Trusted OS TA devkit"
> > > +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> > > +HOMEPAGE = "https://www.op-tee.org/"
> > > +
> > > +do_install() {
> > > +    #install TA devkit
> > > +    install -d ${D}${includedir}/optee/export-user_ta/
> > > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > +    done
> > > +}
> > > +
> > > +do_deploy() {
> > > +     echo "Nothing"
> >
> > I don't think you need this
> >
> > > +}
> > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > > index ea6c496..482d0e0 100644
> > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > @@ -44,12 +44,6 @@ do_install() {
> > >      #install core in firmware
> > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > >      install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> > > -
> > > -    #install TA devkit
> > > -    install -d ${D}${includedir}/optee/export-user_ta/
> > > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > -    done
> > >  }
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > --
> > > 2.17.1
> > >
> >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#2332): https://lists.yoctoproject.org/g/meta-arm/message/2332
> > > Mute This Topic: https://lists.yoctoproject.org/mt/86790368/3616920
> > > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> >

