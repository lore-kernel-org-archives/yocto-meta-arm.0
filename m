Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.15975.1591951756272668626
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 01:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TkCVPtLa;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id c17so10151564lji.11
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+uKZQQIg9D5FVZRonKI+sn7Ot5oGlB719NPIXpOPzMw=;
        b=TkCVPtLaXXXN5Zn5EQWQBLyuoGyYwkvhycQgNctj+tkF4RWaDE/Saaiqgl5EAcAS3F
         09VNGLTAcJqc02ezEfEmZRXlZHLpZa+pyAdo0yoAif/Qhs7BaQgLfzKz9q7KcMM8RkKx
         MEM+HkKspX+KdmiHDNE6qGdJUkMXPrRCrNLzPZlPkxib8mEBDSEOfpzycgQPnUvAMilp
         yNH0TSKD+hLkIGMI5zTet7XpDt+JBhPa/uoA9DrPDhhdgV9Jo+egjiC3e4ZxKpeo3DO0
         z01/xL7/+buHSnRAQZP9QUD0Cak9a8F4aodqcQryJQ+jHCH3b9sR7jr5BrLcqgFnoQqQ
         o62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+uKZQQIg9D5FVZRonKI+sn7Ot5oGlB719NPIXpOPzMw=;
        b=m9EGR/rLoAKg8wxTJxFfJFNEIa+bJb9+5pyhz6wxQ87/zC4jKcxFRgO+HmlV9cYUD7
         /7omE/qF/n+E6xTqeCMpvknNNEWi8KgsIsnHU0n2GY7i+u9SwrSWtbxM2be248iVev3L
         Q0W9iQxu7qXgItN7D6G6xUU1xxGaO6sdC4mKFvVHamdYVkh8vTflzbBazwJh5D4E3S5K
         Vh69+oF0mJtf2aMFi6oaJBNT+yKORxClpkxIpLul0NN8bIgLM9rpReXscCC4aPGZrNgR
         Ob3NyKoD19I7krVTwaI2pNw1yxWT3orDHxNMZoD4Qke8Z6hf62HQdCS5KVldsKlI3npE
         DLCQ==
X-Gm-Message-State: AOAM5337ZpqLPCh8nUdGPXeWdIKcrycdsO01E17NIISnLa4KgFE6pvUM
	JBhFQAjYbdykJVtRLCtq/Jw+KU4rtGa07SoqC0nLMw==
X-Google-Smtp-Source: ABdhPJy4VI7rLz1KqVGsXDb+Kk2Ure9EJj2hhI1q8H6I9cROgUlHqNBesc4+XnjxRhUrLtyCj5PNFji0pSkFK7HuwMY=
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr6063697ljg.372.1591951754181;
 Fri, 12 Jun 2020 01:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
 <1591796582-5015-3-git-send-email-sumit.garg@linaro.org> <20200612042311.GI17660@denix.org>
 <CAFA6WYM1MJaAh0B1q0iB_zNfwEQMaTMn7Y2pWfG-2z1t37fPUw@mail.gmail.com> <20200612073541.GQ17660@denix.org>
In-Reply-To: <20200612073541.GQ17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 12 Jun 2020 14:19:02 +0530
Message-ID: <CAFA6WYNTQO7f0W2D4xVepDyrT5wi=4NH1kT3h7jTNVSCEmpkLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] external-arm-toolchain: Refine dev libraries/headers packaging
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2020 at 13:05, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Jun 12, 2020 at 12:37:43PM +0530, Sumit Garg wrote:
> > On Fri, 12 Jun 2020 at 09:53, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > On Wed, Jun 10, 2020 at 07:12:59PM +0530, Sumit Garg wrote:
> > > > OE core by default package all libraries/headers installed as
> > > > "${libdir}/lib*.so", "${libdir}/*.la" and {includedir} as part of
> > > > FILES_${PN}-dev" but in case of external Arm toolchain recipe, multiple
> > > > packages are provided which needs to include specific libraries and
> > > > headers. So define "FILES_${PN}-dev" from scratch in order to package
> > > > dev libraries/headers as part of intended packages and only package
> > > > remaining libraries/headers as part of "FILES_${PN}-dev".
> > >
> > > This is probably fine, but have you considered/tried re-ordering list of
> > > PACKAGES, moving ${PN}-dev to the end? That way it would let other packages
> > > to pick up their files before collecting the remainder. Not sure, but I wonder
> > > if that would be any cleaner...
> > >
> >
> > Your suggestion sounded useful, so I gave it a try but unfortunately
> > OE core still prefers to package libraries and headers as part of
> > "FILES_${PN}-dev" rather than other intended packages.
>
> Sorry, I may not have been very clear. I didn't mean moving FILES_${PN}-dev
> position in the recipe, but rather ${PN}-dev position inside PACKAGES list.
>
> So, if you have FILES_a = "*" and FILES_b = "*" it all depends on which one is
> listed first in PACKAGES to get all the files: PACKAGES = "a b" or "b a"
>

Sorry I misinterpreted about what you meant. This approach worked like
a charm and it's much cleaner I think. So I just did following change
instead of this patch:

--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -307,6 +307,19 @@ PACKAGES =+ "\
        linux-libc-headers-dev \
 "

+# Re-order PACKAGES list in order to shift ${PN}-dev towards the end as
+# it is meant to pick up remaining dev libraries and headers that aren't
+# picked up by other intended packages. And since some static libraries
+# needs to be packaged in ${PN}-dev, so we need to keep ${PN}-staticdev
+# later in order.
+
+PACKAGES := "${@oe.utils.str_filter_out('${PN}-dev', '${PACKAGES}', d)}"
+PACKAGES := "${@oe.utils.str_filter_out('${PN}-staticdev', '${PACKAGES}', d)}"
+PACKAGES += "\
+       ${PN}-dev \
+       ${PN}-staticdev \
+"
+
 INSANE_SKIP_${PN}-dbg = "staticdev"
 INSANE_SKIP_${PN}-utils += "ldflags"
 INSANE_SKIP_libstdc++ += "ldflags"

If this change looks fine, then I will use it instead for v3.

> This have happened in the past few times, e.g this one is very clear to
> illustrate the point:
>
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=fd2587171fec09ffb2974fc7b402ae6daf9ebaea
>
> In that case, libgcc-dev had to be moved to the very front of the list to get
> a chance to pick up the file, which would otherwise go into another package.
>

Thanks for sharing this example.

-Sumit

> But then, immediate expansion (as _remove wasn't available back then) or the
> use of actual _remove maybe fine for downstream, but otherwise is discouraged.
>
> So, if nothing else works, just re-defining FILES_${PN}-dev should be fine.
>
>
> > Fyi, I just did following change instead of this patch which wasn't successful:
> >
> > @@ -703,6 +655,17 @@ SUMMARY_libitm-dev = "GNU transactional memory
> > support library - development fil
> >  FILES_libitm-staticdev = "${libdir}/libitm.a"
> >  SUMMARY_libitm-staticdev = "GNU transactional memory support library
> > - static development files"
> >
> > +# Package remaining dev libraries and headers
> > +FILES_${PN}-dev = "\
> > +       ${includedir} \
> > +       ${base_libdir}/*_nonshared.a \
> > +       ${base_libdir}/*.o \
> > +       ${datadir}/aclocal \
> > +       ${libdir}/*.o \
> > +       ${libdir}/*_nonshared.a \
> > +       ${libdir}/*.so \
> > +    "
> > +
> >  EAT_VER_MAIN ??= ""
> >
> > -Sumit
> >
> > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > ---
> > > >  .../external-arm-toolchain.bb                      | 48 ++++++++++++++++++++++
> > > >  1 file changed, 48 insertions(+)
> > > >
> > > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > index 8cfc208..5d9a0a8 100644
> > > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > > @@ -546,6 +546,54 @@ FILES_${PN} += "\
> > > >       ${base_libdir}/libpcprofile.so \
> > > >      "
> > > >
> > > > +FILES_${PN}-dev = "\
> > > > +     ${includedir}/*.h \
> > > > +     ${includedir}/netatalk/ \
> > > > +     ${includedir}/netiucv/ \
> > > > +     ${includedir}/neteconet/ \
> > > > +     ${includedir}/nfs/ \
> > > > +     ${includedir}/rpcsvc/ \
> > > > +     ${includedir}/netipx/ \
> > > > +     ${includedir}/misc/ \
> > > > +     ${includedir}/rpc/ \
> > > > +     ${includedir}/sys/ \
> > > > +     ${includedir}/netrose/ \
> > > > +     ${includedir}/arpa/ \
> > > > +     ${includedir}/netinet/ \
> > > > +     ${includedir}/netrom/ \
> > > > +     ${includedir}/finclude/ \
> > > > +     ${includedir}/netax25/ \
> > > > +     ${includedir}/netash/ \
> > > > +     ${includedir}/bits/ \
> > > > +     ${includedir}/xen/ \
> > > > +     ${includedir}/netpacket/ \
> > > > +     ${includedir}/drm/ \
> > > > +     ${includedir}/net/ \
> > > > +     ${includedir}/protocols/ \
> > > > +     ${includedir}/gnu/ \
> > > > +     ${base_libdir}/*_nonshared.a \
> > > > +     ${base_libdir}/*.o \
> > > > +     ${datadir}/aclocal \
> > > > +     ${libdir}/*.o \
> > > > +     ${libdir}/*_nonshared.a \
> > > > +     ${libdir}/libcrypt.so \
> > > > +     ${libdir}/libc.so \
> > > > +     ${libdir}/libm.so \
> > > > +     ${libdir}/libpthread.so \
> > > > +     ${libdir}/libresolv.so \
> > > > +     ${libdir}/librt.so \
> > > > +     ${libdir}/libutil.so \
> > > > +     ${libdir}/libnss_files.so \
> > > > +     ${libdir}/libnss_compat.so \
> > > > +     ${libdir}/libnss_dns.so \
> > > > +     ${libdir}/libnss_hesiod.so \
> > > > +     ${libdir}/libnss_db.so \
> > > > +     ${libdir}/libdl.so \
> > > > +     ${libdir}/libanl.so \
> > > > +     ${libdir}/libBrokenLocale.so \
> > > > +     ${libdir}/libthread_db.so \
> > > > +    "
> > > > +
> > > >  FILES_${PN}-dbg += "${base_libdir}/debug"
> > > >
> > > >  # From gcc-runtime.inc
> > > > --
> > > > 2.7.4
> > > >
> >
