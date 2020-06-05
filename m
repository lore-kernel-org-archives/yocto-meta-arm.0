Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.11416.1591365153084894740
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jun 2020 06:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WEGf1qcU;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id n24so11798056lji.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jun 2020 06:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VbUXCznHwhuOoYg/kOJH6gbCjwRJAiYhTRDANQi36Rg=;
        b=WEGf1qcUAcEWn46ibh3yd9LVXPCV9jCDP9aR6pZ3pdfrCq3VbL/Bjw1o94IW9LXNGz
         Dn7DHBkjiPeJNZTBg4444Hf6UZ52bgUpDN1WZY7IuDETMiZWgtEOoZ7eRbQJU0hJSMjp
         t7zcRoM0eAj/D83SevbHoEeW3Bb/5usg4yyG8c7neJPaYq+0iud7RRd97PmiCf7tuMSy
         kbNIqJipPVKXyY3InZLNbQYXJ3csVzd1m56LiVfhcMt7AEE2naPxYHDHqErEQNdFGC55
         fVKKWFGMhOD/l0stOVCg01aJhK+2aA4mBp9X2kQhtJcX4BoMVo6cg9I2hYZXZ/ebGPBY
         vUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VbUXCznHwhuOoYg/kOJH6gbCjwRJAiYhTRDANQi36Rg=;
        b=bRQLk0k1R57NPwS+21ys+1ErId8EjDgXE8VR0pBQObTxOUnd5Z5GV8+fpFSg3g1GQW
         fSbEdo9aG/Jv5PxBl4Iv5WSnMtQeRFtl5bb2zzy1mmnH2PcdWP7qbHVGVN+tV+ToiDtQ
         IoYw9/mAWzsH6JbG8Ohm4/46rggAtPzxcGQGee76PRI5SWBp+2uoAjQDcTFXdx3JDMFV
         uJLUaM3gPwuUak4Eh0E9Zay/eRANi2pklxM2ZfqPVazE6vQYzYFFgirTXIrp+eakr+b+
         TCKVJ9LfMgq3UA5VheCVU4QLctlDh6AFTpqLYY7XhM36jXE83IFxvuUligxQUofctERA
         pDUQ==
X-Gm-Message-State: AOAM532p9U0OsGGe+/p7DrReGFuh8vw2XRWI239jsS/EjjiEF/Iv18aT
	JaCi1uq0EegZEaN4nMUxk2CFja3OUYkHLIWB0V6h0g==
X-Google-Smtp-Source: ABdhPJw/bxnSt9PiZsFNQ33qfg/91Gi9LClmAiTz1iHSl6gVfRhaJGDUB9cXF9W6N8e90YkL7xeefjENNXK6sDy5Gic=
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr4601151ljg.372.1591365150959;
 Fri, 05 Jun 2020 06:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <1591095894-15178-1-git-send-email-sumit.garg@linaro.org>
 <1591095894-15178-3-git-send-email-sumit.garg@linaro.org> <20200604184225.GE17660@denix.org>
In-Reply-To: <20200604184225.GE17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 5 Jun 2020 19:22:19 +0530
Message-ID: <CAFA6WYORPEGyL+P5pEP0bRUsVT4KUrNhVA3SrxehXQMMatfkxg@mail.gmail.com>
Subject: Re: [PATCH 2/4] external-arm-toolchain: Refine dev libraies packaging
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2020 at 00:12, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Jun 02, 2020 at 04:34:52PM +0530, Sumit Garg wrote:
> > OE core by default package all libraies installed as "${libdir}/lib*.so"
> > or "${libdir}/*.la" as part of "FILES_${PN}-dev" but in case of external
> > Arm tool-set recipe, multiple packages are provided which needs to
> > include specific libraries. So split dev libraries packaging accordingly
> > and only package remaining libraries as part of "FILES_${PN}-dev" which
> > aren't provided as part of other packages.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  .../external-arm-toolchain.bb                      | 23 ++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > index 04d8923..7f5a6f5 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > @@ -545,6 +545,29 @@ FILES_${PN} += "\
> >       ${base_libdir}/libpcprofile.so \
> >      "
> >
> > +FILES_${PN}-dev_remove = "\
>
> Shouldn't be using _remove here. It will probably break anyones .bbappends on
> this recipe and will make it hard making any adjustments.
>

Any specific reason to use .bbappends? Why can't those changes land in
meta-arm instead?

> If you check git logs, you'll see that every time we needed to change the
> default lists defined by glibc-package.inc in OE-Core, we had to re-create
> them from scratch.
>

Sounds reasonable, will create FILES_${PN}-dev from scratch instead.

-Sumit

>
> > +     ${libdir}/lib*.so \
> > +     ${libdir}/*.la \
> > +    "
> > +FILES_${PN}-dev += "\
> > +     ${libdir}/libcrypt.so \
> > +     ${libdir}/libc.so \
> > +     ${libdir}/libm.so \
> > +     ${libdir}/libpthread.so \
> > +     ${libdir}/libresolv.so \
> > +     ${libdir}/librt.so \
> > +     ${libdir}/libutil.so \
> > +     ${libdir}/libnss_files.so \
> > +     ${libdir}/libnss_compat.so \
> > +     ${libdir}/libnss_dns.so \
> > +     ${libdir}/libnss_hesiod.so \
> > +     ${libdir}/libnss_db.so \
> > +     ${libdir}/libdl.so \
> > +     ${libdir}/libanl.so \
> > +     ${libdir}/libBrokenLocale.so \
> > +     ${libdir}/libthread_db.so \
> > +    "
> > +
> >  FILES_${PN}-dbg += "${base_libdir}/debug"
> >
> >  # From gcc-runtime.inc
> > --
> > 2.7.4
> >
