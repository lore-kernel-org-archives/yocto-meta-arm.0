Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB31CC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:19:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.13386.1636471198715582251
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 07:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qDYALFjJ;
 spf=pass (domain: linaro.org, ip: 209.85.214.171,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pl1-f171.google.com with SMTP id u11so21495749plf.3
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VYgxjJV+UP4LUCmIee685hKGxL5zBbzjjekMVaUCft8=;
        b=qDYALFjJunS9GK6PP3fSFKxwy+UXp72Kj2Hjz7KKYUhTVgFWdp6/nrr4Af0KijUFUT
         7tNKzn1LB3ce3AJup8jOpxQ+GH8VI9UCR4u4neIFrWj/zs1GFngGmVmQkXD0xICsybrr
         Yc9QWO+sdg9GAHNa3PxCNvgr1hCHxk5VjYFWbe06mKO7Bq5Z9G9fgbJMxV4aS/2OLy2N
         maznLC/zGOTBcwV/vcpjwVuncWmDenegsCeDQ0mbPTBHIDVA3uaH3Jy+dVkpzRQkiI5j
         cfwVCupViemIdPpd3d0qrj+4djWMix+Bz7+WttJLBjj7+R6Vs0bDyzudH0SlVA2D/DUE
         quNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VYgxjJV+UP4LUCmIee685hKGxL5zBbzjjekMVaUCft8=;
        b=re8n57ChNYM12cLV/le+xHDGJxpH5txGrp9GW8ie0NtjC5W4fh9vGy21Jlfp2UKoif
         mUIJ9JkeSjmw69KpmfdvoRkPwo7QF9kZvdpoIrnwqhOhraFEjhYwLEVg3a9uxZUmb98o
         hRhOLlF2VjO/4FhQTQ21zxjFd8HIrKsKbqdxE0e8DelqDnmpdXVSbpW9Dy+uhNxZQLYE
         tcoHtFop9Ws25CzrS9IGmgz+56Jh8vxbDv3ddTfTlkVk0oXHU773gpDVIR8SPqKwudd4
         dy+C/7uZ8CEmDJw38qH73sfDvWzxbS1ftVzCnBhE5/sA8bwKb/NcEZhiY6Wz8ANLUpYg
         7PHw==
X-Gm-Message-State: AOAM533vDLjxHdDCjeel7XzUotChe2f6n23ZNKMO0/F7YoW46GXI+IyZ
	azqe7S1Mkrb/ykH2o3gXuDcPwWpp1w26yvm7JVvpnw==
X-Google-Smtp-Source: 
 ABdhPJwNton6GoWZOQaQVzp5pfBivyFIgzWcSbU1BwHTiO2QzYtm+SxpwVPvTe1WNHL7vM7GDxMJSRSHk9rq7moq18Y=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr7993985plh.33.1636471198058; Tue, 09 Nov
 2021 07:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20211103131144.4005-1-maxim.uvarov@linaro.org>
 <20211103154101.GA31775@kudzu.us>
 <CAD8XO3bGMK5=O_9JF4AdS4OQ7DOXWPE2J23dpuvczqOTtsTG=Q@mail.gmail.com>
 <CAPoiz9yBmHOfP+4iNFBuvKd5aed3Yqau55o15ygXGT_sZ75dHg@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9yBmHOfP+4iNFBuvKd5aed3Yqau55o15ygXGT_sZ75dHg@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 9 Nov 2021 18:19:46 +0300
Message-ID: 
 <CAD8XO3ZQjNQzVoGsH46f45tiDa8b2rqk_M6DPweyPsg1MX=YDw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] optee: updae optee-os.inc to support
 external TAs
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 15:19:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2351

On Tue, 9 Nov 2021 at 05:48, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Nov 8, 2021 at 7:52 AM Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > On Wed, 3 Nov 2021 at 18:41, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > This patch doesn't appear to apply to my tree.
> > >
> >
> > Thanks for your review.  I will try to fix comments in v2. Do you
> > manifest for the meta-arm somewhere? So I can test it locally in an
> > environment close to your CI then combine layers together by myself.
>
> We use Gitlab CI and KAS.  It works externally, as you can see from me
> running it on my personal gitlab instance and docker container running
> on my desktop.
> https://gitlab.com/jonmason00/meta-arm/-/pipelines
>
> It is probably overkill for you to set up something like this, but you
> can use KAS fairly trivially and use our CI machine definitions.  For
> OPTEE, I think you would want to build against the
> qemuarm64-secureboot machine.  Something like:
> $ pip install kas
> $ kas build ci/qemuarm64-secureboot.yml:ci/testimage.yml
>
> If you get stuck, message me on IRC and I'll do my best to help you.
> Thanks,
> Jon
>

Never tried KAS, but the build started and I think everything is fine.

Maxim.


> >
> > Maxim.
> >
> > > Applying: optee: updae optee-os.inc to support external TAs
> > > error: patch failed: meta-arm/recipes-security/optee/optee-os.inc:44
> > > error: meta-arm/recipes-security/optee/optee-os.inc: patch does not apply
> > > Patch failed at 0001 optee: updae optee-os.inc to support external TAs
> > >
> > >
> > > Other comments below
> > >
> > >
> > > On Wed, Nov 03, 2021 at 04:11:43PM +0300, Maxim Uvarov wrote:
> > > > Separate recipe for TA devkit is needed to solve
> > > > circular dependency to  build TAs withthe devkit
> > >
> > > Nit, space between "with" and "the" needed and extra space before
> > > "build"
> > >
> > > > and integrate it inside optee-os.
> > > >
> > > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > > ---
> > > >  .../optee/optee-os-tadevkit_3.11.0.bb          | 18 ++++++++++++++++++
> > > >  meta-arm/recipes-security/optee/optee-os.inc   |  6 ------
> > > >  2 files changed, 18 insertions(+), 6 deletions(-)
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > > >
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > > > new file mode 100644
> > > > index 0000000..d20cee9
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.11.0.bb
> > > > @@ -0,0 +1,18 @@
> > > > +FILESEXTRAPATHS_prepend := "${THISDIR}/optee-os:"
> > >
> > > This is the old syntax, which is probably one of the reasons why it
> > > doesn't apply on the latest.
> > >
> > > > +require optee-os_3.11.0.bb
> > > > +
> > > > +SUMMARY = "OP-TEE Trusted OS TA devkit"
> > > > +DESCRIPTION = "OP-TEE TA devkit for build TAs"
> > > > +HOMEPAGE = "https://www.op-tee.org/"
> > > > +
> > > > +do_install() {
> > > > +    #install TA devkit
> > > > +    install -d ${D}${includedir}/optee/export-user_ta/
> > > > +    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > > +        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > > +    done
> > > > +}
> > > > +
> > > > +do_deploy() {
> > > > +     echo "Nothing"
> > >
> > > I don't think you need this
> > >
> > > > +}
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > > > index ea6c496..482d0e0 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > @@ -44,12 +44,6 @@ do_install() {
> > > >      #install core in firmware
> > > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > > >      install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/
> > > > -
> > > > -    #install TA devkit
> > > > -    install -d ${D}${includedir}/optee/export-user_ta/
> > > > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > > -    done
> > > >  }
> > > >
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > --
> > > > 2.17.1
> > > >
> > >
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#2332): https://lists.yoctoproject.org/g/meta-arm/message/2332
> > > > Mute This Topic: https://lists.yoctoproject.org/mt/86790368/3616920
> > > > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > > > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >
> > >

