Return-Path: <maxim.uvarov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D19C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 09:40:08 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.7822.1637055607202172505
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bWf+LdMA;
 spf=pass (domain: linaro.org, ip: 209.85.216.46,
 mailfrom: maxim.uvarov@linaro.org)
Received: by mail-pj1-f46.google.com with SMTP id np3so15265868pjb.4
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 01:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LUZA5Q76tXGj983j4TmKpNDdbPSAPN3Ydu+cXc8PRT0=;
        b=bWf+LdMAbzUUWdvT02gV4sEuArOFz4nt2QdGtM4B6mCLDX+4rApkj/nXO8V+EPNAxi
         kmNrzN9f0ZpCyoccnf/N0uFjs0m+nMp70KL1p2KdpbtsYTbrDlY1lA38BhFnnhCuNH24
         tOc/OkgVf9m/y1SqmIwJB5rBXW1YIWRL7uLRfA77F7EfvFmaSGJyp+X4hdNrV32H9cp+
         Fgk9NawerVJu8HutuKjwUB1wUdmkViZq/i6LosmCg+QZQXQacwx7xjnQqVhlcs+FvcrG
         brAi0osNOZDoDyPcDKnwiUyw3GZwK7q/idLU0ERHdeFDWLc1PQuO770OJTpy3tlXjrto
         P7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LUZA5Q76tXGj983j4TmKpNDdbPSAPN3Ydu+cXc8PRT0=;
        b=a/68p0HZczwzPN/5gDmhp/PVukpFSDpE88ekXYFlqztV8ep/F0pmuM0Ap037yMQk/p
         lW8snmAmEikkXFQUQyMLkeodK2xxa57LQngyasMiduui+maqBG7ptlWOzBsOjYErT4Rs
         tdQhjJxp4D0XGDkD53LER2XsAlzsB/y9lEjc3NR3wb4bnhIT7WJtgrMgclGOYVnLZ4Hl
         GBcuq3ullLuPl5asXgZ8sg5kPxnt6QxnzhwEj8QsvC2oRqt8ZvV6YGjxd6zlFw454UEc
         Ard7LdeZYWG0q7ItiDravPBy30ILFiwtIoM+8UwQQT9zaGhQaGxX7YZkFf3D7qeDE4lw
         kx3A==
X-Gm-Message-State: AOAM532r/JPPUpsvIydct1h98FLsgYlaRTqkESbQnHEzFJWdxyiTKeTm
	haqpf1yGyXJQckJeWhsi9sIGMBx7WcMRZ+xgZv5i1/03APw=
X-Google-Smtp-Source: 
 ABdhPJzMTvBhkeY+THW6UBWLxL5BDH/X1XkBEcXgccWDWTdk8SuUPxnu0u2CNshc99Gtr9sv2HtGDUkwUUe1xN5FELI=
X-Received: by 2002:a17:90a:7645:: with SMTP id
 s5mr73117772pjl.125.1637055606617;
 Tue, 16 Nov 2021 01:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20211111131615.16972-1-maxim.uvarov@linaro.org>
 <CAPoiz9w+dmYeUwqiVf9d95xfOo1MBP5GjSbSN3WKWLDyikkVAA@mail.gmail.com>
 <CAD8XO3b1FfKNq1n8hjR-jkE5ND2xSefnvstKxnzqzAnfYzm7KA@mail.gmail.com>
 <20211115163227.GU10132@denix.org>
In-Reply-To: <20211115163227.GU10132@denix.org>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Tue, 16 Nov 2021 12:39:55 +0300
Message-ID: 
 <CAD8XO3a2W7VEqW5gU0w3a97hSxqqa+Xk7DTWHkuqV8kmd5L+jA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCHv2 1/3] optee: updae optee-os.inc to support
 external TAs
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org,
 Jon.Mason@arm.com,
	Ross.Burton@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Nov 2021 09:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2403

On Mon, 15 Nov 2021 at 19:32, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Nov 15, 2021 at 09:28:08AM +0300, Maxim Uvarov wrote:
> > On Mon, 15 Nov 2021 at 06:52, Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > On Thu, Nov 11, 2021 at 8:16 AM Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > >
> > > > Separate recipe for TA devkit is needed to solve
> > > > circular dependency to build TAs withthe devkit
> > > > and integrate it inside optee-os.
> > > >
> > > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > >
> > > On this series, I'm seeing:
> > > ERROR: Nothing PROVIDES 'optee-os-tadevkit' (but
> > > /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
> > > DEPENDS on or otherwise requires it)
> > > optee-os-tadevkit was skipped: incompatible with machine tc0 (not in
> > > COMPATIBLE_MACHINE)
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328692
> > >
> > > Issue on tc0, tc1, and corstone1000 (and check-patch)
> > >
> >
> > This should be fixed in v3 with adding conditions.
> >
> > > I'm also seeing:
> > > ERROR: Nothing PROVIDES 'compiler-rtoptee-ftpm' (but
> > > /builds/jonmason00/meta-arm/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > > DEPENDS on or otherwise requires it)
> > > https://gitlab.com/jonmason00/meta-arm/-/jobs/1779328682
> > >
> > > Issue on qemuarm64-secureboot
> > >
> >
> > That is interesting. I also built a qemuarm64-secureboot. Might be
> > some changes in the current master for that.
>
> That is due to a missing space in bbappend:
> +DEPENDS:append = "optee-ftpm"
>
> Resulting in optee-ftpm being concatenated to compiler-rt in DEPENDS:
> > ERROR: Nothing PROVIDES 'compiler-rtoptee-ftpm' (but
>
> Similar to the one I reported about EXTRA_OEMAKE in the same bbappend...
>

I think that should be solved now in v3. qemuarm64_secure and t1000
build fine for me.

Maxim.

> --
> Denys
>
>
> > > Thanks,
> > > Jon
> > >
> > >
> > >
> > >
> > >
> > >
> > > > ---
> > > >  .../recipes-security/optee/optee-examples.inc |  2 +-
> > > >  .../optee/optee-os-tadevkit_3.14.0.bb         | 20 +++++++++++++++++++
> > > >  meta-arm/recipes-security/optee/optee-os.inc  |  7 -------
> > > >  3 files changed, 21 insertions(+), 8 deletions(-)
> > > >  create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > >
> > > > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > index 921fa18..656722e 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > > > @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
> > > >  LICENSE = "BSD-2-Clause"
> > > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
> > > >
> > > > -DEPENDS = "optee-client optee-os python3-pycryptodome-native"
> > > > +DEPENDS = "optee-client optee-os-tadevkit python3-pycryptodome-native"
> > > >
> > > >  inherit python3native
> > > >
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > > new file mode 100644
> > > > index 0000000..0d37a52
> > > > --- /dev/null
> > > > +++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
> > > > @@ -0,0 +1,20 @@
> > > > +FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
> > > > +require optee-os_3.14.0.bb
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
> > > > +       echo "Do not inherit do_deploy from optee-os."
> > > > +}
> > > > +
> > > > +FILES:${PN} = "${includedir}/optee/"
> > > > diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
> > > > index 277646e..1506a58 100644
> > > > --- a/meta-arm/recipes-security/optee/optee-os.inc
> > > > +++ b/meta-arm/recipes-security/optee/optee-os.inc
> > > > @@ -46,12 +46,6 @@ do_install() {
> > > >      #install core in firmware
> > > >      install -d ${D}${nonarch_base_libdir}/firmware/
> > > >      install -m 644 ${B}/core/*.bin ${B}/core/tee.elf ${D}${nonarch_base_libdir}/firmware/
> > > > -
> > > > -    #install TA devkit
> > > > -    install -d ${D}${includedir}/optee/export-user_ta/
> > > > -    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
> > > > -        cp -aR $f ${D}${includedir}/optee/export-user_ta/
> > > > -    done
> > > >  }
> > > >
> > > >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > @@ -66,7 +60,6 @@ addtask deploy before do_build after do_install
> > > >  SYSROOT_DIRS += "${nonarch_base_libdir}/firmware"
> > > >
> > > >  FILES:${PN} = "${nonarch_base_libdir}/firmware/"
> > > > -FILES:${PN}-dev = "${includedir}/optee/"
> > > >
> > > >  # note: "textrel" is not triggered on all archs
> > > >  INSANE_SKIP:${PN} = "textrel"
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > > >
> > > >

