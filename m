Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1979C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 12:52:14 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.44397.1636375934031561361
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 04:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YQAaLe9k;
 spf=pass (domain: linaro.org, ip: 209.85.216.47,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pj1-f47.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso8740694pjb.0
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 04:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D21he3Gmahix4sYxtyUIUOI2RjHXdzPhWsCm2pAre4c=;
        b=YQAaLe9k2IUFp06lQiegcrk3T26pULc/phsJK/oGVSiGvll+EfmOqqroLgqh7TfYqQ
         06o0rV9382gjvSECXzmcoo0b7zuqB8rKDy/wIda8ps0ODBgAMe+any5k3QbvJ7e/cPol
         K3VnFORRX/eely90dxkp2AXGeOUizt0vsqQKFnEFZIoTy49sDvZjcBNc4asO8rTofIse
         I10SvS2AhMzeY6WpX0ZQAE4pcnW+zIvMTVk23/jEgUArIDrqUsVmk5jTRmdSnpr522FQ
         yadzvJtf4P5ps8DHODFdmVBigwasOfYeBy91teI5WgPV2lDbvHAmRq//Ea/mji3n5keF
         DU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D21he3Gmahix4sYxtyUIUOI2RjHXdzPhWsCm2pAre4c=;
        b=gOLUdjrwIvMTDKB2DjniARUcLMnQft0W4hNHRtH3nNa310l0gZx57UOdjOf+bDpEPp
         kQj2oawv9raS+S46c8WVXE5KFD5suO02nfTzbDBORse2JeLhYgc4D7I4njMcBOaHwx/W
         PdHGZ50abVnqXW4awITlmoaykVmeibxfdcE2iRplpRfxxCP/I9ZZVLJpj2HlObUJRg7b
         AopM6R8rmBfXhD6/m/0hWobxrf68k70anC/JKAwq8B54caG/0KEHDpmRMyf1O/4c7jUq
         GC37ABXYad90j9+8v92mLxsU56/hA6mEEIdH3dTy8daiVcAHTSzT/r21kYLG79ZB4wHC
         q2Qg==
X-Gm-Message-State: AOAM530qDXoDYwfag70ECuDDQJAToSnfYzpv0Mc5DyIkcR6Gvz0hOuXp
	SQ6IKGQlEHWBsuhrgepJ+ZsXvhwnRWlTKS4BRwbRfQ==
X-Google-Smtp-Source: 
 ABdhPJzb4KYjIjygz10HynA6wx7LTCtGdq+L8ll69Ex10Q+ki3smF222OHQ0shUJX94oaJfePXEHtXye6cqGy2D6UYU=
X-Received: by 2002:a17:903:283:b0:142:1243:d879 with SMTP id
 j3-20020a170903028300b001421243d879mr40494689plr.61.1636375933271; Mon, 08
 Nov 2021 04:52:13 -0800 (PST)
MIME-Version: 1.0
References: <20211103131144.4005-1-maxim.uvarov@linaro.org>
 <20211103154101.GA31775@kudzu.us>
In-Reply-To: <20211103154101.GA31775@kudzu.us>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 8 Nov 2021 15:52:02 +0300
Message-ID: 
 <CAD8XO3bGMK5=O_9JF4AdS4OQ7DOXWPE2J23dpuvczqOTtsTG=Q@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] optee: updae optee-os.inc to support
 external TAs
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Nov 2021 12:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2344

On Wed, 3 Nov 2021 at 18:41, Jon Mason <jdmason@kudzu.us> wrote:
>
> This patch doesn't appear to apply to my tree.
>

Thanks for your review.  I will try to fix comments in v2. Do you
manifest for the meta-arm somewhere? So I can test it locally in an
environment close to your CI then combine layers together by myself.

Maxim.

> Applying: optee: updae optee-os.inc to support external TAs
> error: patch failed: meta-arm/recipes-security/optee/optee-os.inc:44
> error: meta-arm/recipes-security/optee/optee-os.inc: patch does not apply
> Patch failed at 0001 optee: updae optee-os.inc to support external TAs
>
>
> Other comments below
>
>
> On Wed, Nov 03, 2021 at 04:11:43PM +0300, Maxim Uvarov wrote:
> > Separate recipe for TA devkit is needed to solve
> > circular dependency to  build TAs withthe devkit
>
> Nit, space between "with" and "the" needed and extra space before
> "build"
>
> > and integrate it inside optee-os.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  .../optee/optee-os-tadevkit_3.11.0.bb          | 18 ++++++++++++++++++
> >  meta-arm/recipes-security/optee/optee-os.inc   |  6 ------
> >  2 files changed, 18 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > new file mode 100644
> > index 0000000..d20cee9
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > @@ -0,0 +1,18 @@
> > +FILESEXTRAPATHS_prepend := "${THISDIR}/optee-os:"
>
> This is the old syntax, which is probably one of the reasons why it
> doesn't apply on the latest.
>
> > +require optee-os_3.11.0.bb
> > +
> > +SUMMARY = "OP-TEE Trusted OS TA devkit"
> > +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> > +HOMEPAGE = "https://www.op-tee.org/"
> > +
> > +do_install() {
> > +    #install TA devkit
> > +    install -d ${D}${includedir}/optee/export-user_ta/
> > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > +    done
> > +}
> > +
> > +do_deploy() {
> > +     echo "Nothing"
>
> I don't think you need this
>
> > +}
> > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > index ea6c496..482d0e0 100644
> > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > @@ -44,12 +44,6 @@ do_install() {
> >      #install core in firmware
> >      install -d ${D}${nonarch_base_libdir}/firmware/
> >      install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> > -
> > -    #install TA devkit
> > -    install -d ${D}${includedir}/optee/export-user_ta/
> > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > -    done
> >  }
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > --
> > 2.17.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2332): https://lists.yoctoproject.org/g/meta-arm/message/2332
> > Mute This Topic: https://lists.yoctoproject.org/mt/86790368/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

