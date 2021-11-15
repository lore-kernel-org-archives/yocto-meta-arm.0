Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C96C433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 06:28:22 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.18944.1636957700120009417
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Nov 2021 22:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pKOep8DZ;
 spf=pass (domain: linaro.org, ip: 209.85.216.52,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pj1-f52.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso13126792pjo.3
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Nov 2021 22:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=58sQ9BP5JOtbI2puQBlDfhFs6h5SyL8envOYGVPTtts=;
        b=pKOep8DZMNAnmiSTB/XA7agm3J+vSY9S33Kk72SW8LyCpGrRYmRJ6OrUoYiug9Uefs
         KL8Inmct9wh8+W4mHP7jiuptD1QXvYJHM7iy+VELIpL+y9CLK8a9cFaDWu68Lm2NNjYj
         oXIr14NlGDR0icfbNLHeMMN1eJPEZtsqiQ3Ha6K1Pd6ZgyAV8lVPDmorEro5tmBDscqd
         usehU111AmdR5Wai7CHh3wprmVPtSrIIsNwC2upGmBJ8U0R9IsEJG3ew/FNlUGqMO7Jj
         FvsCGBHVIj+soNRMj9AqLhOfUdzmBVguxt7T1KsbU645LrFyWgFuil6Jhp9UzqXN2vVa
         UHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=58sQ9BP5JOtbI2puQBlDfhFs6h5SyL8envOYGVPTtts=;
        b=VoMVBxrrwBCPWRKZ1pE03iLoHUcVmTwcRUbJZe0zxZj49ZbPFdIvbXZ7a3ilTGy1nR
         puqGhIZBMOmIAgcwR8ssq1j9O6QvL6il4aLrUuBAumlvD/W0y85dhzWXiGmkYnWjYbBP
         xvpw7O9Is6PpzRQSi0xmuknOuN+V7pnMydhvyobBALmcdKkICfBcT4d6gKukaghUKfo8
         Xp4K9cRHmZdFtOSMc2Uu84jIywvcyVI8qnDTi7Acn5qtZ8nwuopGkoLRdzmdxZcrg+MI
         ib1Ku5vleycL27JahKf1m+d3Yqzgz2FuP7iuUmLT0VICUTjN7XCndBASFUJcW5wWCDvu
         MzfQ==
X-Gm-Message-State: AOAM533QgXr8RAOXYlhalPEw/nYNFBvQwqL2Yd/iq6iTNVFMyIFE8lKh
	Y/mdEX63HPsAVorB3NY+aJ5pl1tcgmxqVzJY6UMRag==
X-Google-Smtp-Source: 
 ABdhPJwwyh0zXAFBLA0AD0tkNZ6+fdTiWMuwtHzxN4IyVysUCLbgX0EanbhO64KFODJmmww2QXUpG823wOhDTze5miY=
X-Received: by 2002:a17:90a:7645:: with SMTP id
 s5mr61373041pjl.125.1636957699553;
 Sun, 14 Nov 2021 22:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20211111131615.16972-1-maxim.uvarov@linaro.org>
 <CAPoiz9w+dmYeUwqiVf9d95xfOo1MBP5GjSbSN3WKWLDyikkVAA@mail.gmail.com>
In-Reply-To: 
 <CAPoiz9w+dmYeUwqiVf9d95xfOo1MBP5GjSbSN3WKWLDyikkVAA@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 15 Nov 2021 09:28:08 +0300
Message-ID: 
 <CAD8XO3b1FfKNq1n8hjR-jkE5ND2xSefnvstKxnzqzAnfYzm7KA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv2 1/3] optee: updae optee-os.inc to support
 external TAs
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Nov 2021 06:28:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2384

On Mon, 15 Nov 2021 at 06:52, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Thu, Nov 11, 2021 at 8:16 AM Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > Separate recipe for TA devkit is needed to solve
> > circular dependency to build TAs withthe devkit
> > and integrate it inside optee-os.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
>
> On this series, I'm seeing:
> ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but
> /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> DEPENDS on or otherwise requires it)
> optee-os-tadevkit was skipped: incompatible with machine tc0 (not in
> COMPATIBLE_MACHINE)
> https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328692
>
> Issue on tc0, tc1, and corstone1000 (and check-patch)
>

This should be fixed in v3 with adding conditions.

> I'm also seeing:
> ERROR: Nothing PROVIDES 'compiler-rtoptee-ftpm' (but
> /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> DEPENDS on or otherwise requires it)
> https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328682
>
> Issue on qemuarm64-secureboot
>

That is interesting. I also built a qemuarm64-secureboot. Might be
some changes in the current master for that.

> Thanks,
> Jon
>
>
>
>
>
>
> > ---
> >  .../recipes-security/optee/optee-examples.inc |  2 +-
> >  .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
> >  meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
> >  3 files changed, 21 insertions(+), 8 deletions(-)
> >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> > index 921fa18..656722e 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> >  LICENSE = "BSD-2-Clause"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> >
> > -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> >
> >  inherit python3native
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > new file mode 100644
> > index 0000000..0d37a52
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > @@ -0,0 +1,20 @@
> > +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> > +require optee-os_3.14.0.bb
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
> > +       echo "Do not inherit do_deploy from optee-os."
> > +}
> > +
> > +FILES:${PN} = "${includedir}/optee/"
> > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > index 277646e..1506a58 100644
> > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > @@ -46,12 +46,6 @@ do_install() {
> >      #install core in firmware
> >      install -d ${D}${nonarch_base_libdir}/firmware/
> >      install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> > -
> > -    #install TA devkit
> > -    install -d ${D}${includedir}/optee/export-user_ta/
> > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > -    done
> >  }
> >
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > @@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
> >  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> >
> >  FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> > -FILES:${PN}-dev = "${includedir}/optee/"
> >
> >  # note: "textrel" is not triggered on all archs
> >  INSANE_SKIP:${PN} = "textrel"
> > --
> > 2.17.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2362): https://lists.yoctoproject.org/g/meta-arm/message/2362
> > Mute This Topic: https://lists.yoctoproject.org/mt/86981076/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

