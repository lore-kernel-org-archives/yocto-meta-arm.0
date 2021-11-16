Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E85C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 09:37:11 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.7798.1637055430064348747
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=C3Jz8Vyf;
 spf=pass (domain: linaro.org, ip: 209.85.216.46,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pj1-f46.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so2330713pjb.4
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v4Zfj9Fu63hLUN+QrL+u3MLxRqQuZmfVT+OQoZDLIS4=;
        b=C3Jz8VyfJFlw6WQiEncRqYtje/NRcCR036zCnIMAdFIw3wkAI1IFmo/bzced6umAg9
         bHjM7qU1Ch4dajv0zRNuUhMRnDnYyPzAonoeTumffaBtmRsPhM0BT8RxKFAwhnGSPq9M
         oIFQDTa0BWq38LDEpEZBOzBBYDMQWWei0zmDD3Du+ZpW/kpXrpakbSv+J5oIHGvyQSdz
         ybDWF6/BElNjONcvEHbGXg72YnLpVOR0GEL/UEE9Wf4wiN3+o4oZrbp5Ob7orlOXmGg6
         BFsNubA2BS+z+Eaz+rbHteJEt5XrR3QBG7cYxsFfbO7g5A+bmuVkaDsKXjAWxPA7Oywv
         bTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v4Zfj9Fu63hLUN+QrL+u3MLxRqQuZmfVT+OQoZDLIS4=;
        b=V/1bAjOx++BtIs97z08+ENJw+/thiXz6n/QtlpOoQlCpB9cehe4Hwal1HCl6LkhD0T
         m3xChOugB885YiOsx/YM82cQ+HTK43r/8nJy8CHhcfLh8R7G3Zqb8SFSnmAr2oF6xtz2
         AoMCPcqi78OyM0ksMtQXBd4S82aR9a+xkmrGMDddlUh3oTvEd5wg6+0puIECTTVcD4MJ
         dOU4IEWjDoPDmaJ/a3kod5gMsdr7myxCSuoWZU9LgtIfP19I6vDes1mhIn5X5PdQlxPW
         WmOem+P/DKGkBwJDEbDsCkXdCK7GiIex9LkQwju5lyHZvk/wreOWYkSX7ctmR4t8QkOn
         8Y+g==
X-Gm-Message-State: AOAM533f3wkDHyAh2X6KegWBSDm9D/iT/szexpufQAg+ND3/wnVQ7NlD
	4hoBHdVNsR2pWaRw0Z6N1j/R/GlrLRiZkinCpQYghQ==
X-Google-Smtp-Source: 
 ABdhPJxeJ06ukhD8TVA1OWi+KmKI2sUho6RcI3xQXv0u4fr4sXP7VQvLYBp0g0rK4v6qQqv4DK3+cTX8x93TlVqUsJY=
X-Received: by 2002:a17:90b:4d84:: with SMTP id
 oj4mr73605404pjb.90.1637055429371;
 Tue, 16 Nov 2021 01:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20211115140100.24634-1-maxim.uvarov@linaro.org>
 <16B7C62271B94CA7.23622@lists.yoctoproject.org>
 <20211115190524.GE31079@kudzu.us>
In-Reply-To: <20211115190524.GE31079@kudzu.us>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 16 Nov 2021 12:36:58 +0300
Message-ID: 
 <CAD8XO3abhs5gFQ4MPw9Ws3+bLUWusudODcjYoN_=VN6DHLB-Fw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv3 1/5] optee: updae optee-os.inc to support
 external TAs
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, Jon.Mason@arm.com, Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2402

On Mon, 15 Nov 2021 at 22:05, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Mon, Nov 15, 2021 at 11:47:17AM -0500, Jon Mason via lists.yoctoproject.org wrote:
> > CI is still running, but it is already failing check-layers (again) with
> > ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb DEPENDS on or otherwise requires it)
> > See https://gitlab.com/jonmason00/meta-arm/-/jobs/1783827221
>
> Looks like it's not clang safe either
> https://gitlab.com/jonmason00/meta-arm/-/jobs/1783827269
>
From log above error is:
| /bin/sh: 1: aarch64-poky-linux-gcc: not found

Interesting how I can reproduce it...

BR,
Maxim.

> >
> > Thanks,
> > Jon
> >
> > On Mon, Nov 15, 2021 at 05:00:56PM +0300, Maxim Uvarov wrote:
> > > Separate recipe for TA devkit is needed to solve
> > > circular dependency to build TAs withthe devkit
> > > and integrate it inside optee-os.
> > >
> > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > ---
> > >  .../recipes-security/optee/optee-examples.inc |  2 +-
> > >  .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
> > >  meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
> > >  3 files changed, 21 insertions(+), 8 deletions(-)
> > >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > >
> > > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> > > index 921fa18..656722e 100644
> > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > > @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> > >  LICENSE = "BSD-2-Clause"
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> > >
> > > -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> > > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> > >
> > >  inherit python3native
> > >
> > > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > new file mode 100644
> > > index 0000000..0d37a52
> > > --- /dev/null
> > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > @@ -0,0 +1,20 @@
> > > +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> > > +require optee-os_3.14.0.bb
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
> > > +   echo "Do not inherit do_deploy from optee-os."
> > > +}
> > > +
> > > +FILES:${PN} = "${includedir}/optee/"
> > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > > index 277646e..1506a58 100644
> > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > @@ -46,12 +46,6 @@ do_install() {
> > >      #install core in firmware
> > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > >      install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> > > -
> > > -    #install TA devkit
> > > -    install -d ${D}${includedir}/optee/export-user_ta/
> > > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > -    done
> > >  }
> > >
> > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > @@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
> > >  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> > >
> > >  FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> > > -FILES:${PN}-dev = "${includedir}/optee/"
> > >
> > >  # note: "textrel" is not triggered on all archs
> > >  INSANE_SKIP:${PN} = "textrel"
> > > --
> > > 2.17.1
> > >
> >
> > >
> > >
> > >
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2397): https://lists.yoctoproject.org/g/meta-arm/message/2397
> > Mute This Topic: https://lists.yoctoproject.org/mt/87069528/3616920
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

