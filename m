Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web11.14985.1591945676642439182
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jun 2020 00:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MzswzRqs;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id n24so9840966lji.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jun 2020 00:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tWryO0FEqHe2m9AMqOx5kTfJxWK0hsLlQ7Ku7RDnzXs=;
        b=MzswzRqszSDjZmvv0pQ8mM2MJl5Rq7m17TdyL1RtLiMoQtkdxZ74H+EG+aOdd2GACd
         eOboSJDVzpS1OpkR1JF7kuCoRW/SI2KauBms3TfqgGpsmm9p+nPZduTLhxgF+OCg0RZE
         PC2gk/cA4jofErBLJEyiGidcx+t01Xjoqvx7ju+8QwME8CwCUz6C/LS2pE93Gq3RwZ+u
         yKeA8yT1XO0c0LJ0dqpwH5rkAXWS6xJ8k8042hYr7bcjYryNCGomV78x13c91Y4tea2j
         AWvI6HiAtcnsDNUUtZ2m7v+rTY59YTtxLyTb/2sv39eaPg+F4aR3JqYxyvf2H9g2WYJ3
         RWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tWryO0FEqHe2m9AMqOx5kTfJxWK0hsLlQ7Ku7RDnzXs=;
        b=P1tjmEwTf1xLUhJ97cZbJTtgXMw97Cn4DaW377B+YQMeBDLXYl29fCDX1hLWsYFnXC
         B4WojkV2yQ/0MDssAvuU3IXMGfIeuH9Y1sVojF2vgg+AKsdIohkUcT7jdulU8SQ9XCaF
         RdMkRaFIpIF77cMpoBq42dScO2kAUUttdY6ph/qq0CcLFU3hrgAeRoveuNJ2htrZbLWy
         iLw3hnldX4Vvv14iPJ7GWD6Y4Wu6D9lk0D6OZtCnklRapNmGlhexbj41ELX9mpIJ97Kb
         WrIP/WjmrePVaU+9io12QTMjCoyRNGG+jYz+xx54ynCY/kKg1TIEw+cXis+lTWbFVEfF
         LAng==
X-Gm-Message-State: AOAM533WuaIeHDTPR3ZqUQKs4lQVRvc7Of1SVtsRlmoxWpeQpO/SHPmj
	UJfAMqIfj6afqAuHRhymauW1CLCK2olFAT9X4+a/qw==
X-Google-Smtp-Source: ABdhPJwMc5eaQSOIkZ1sviP+7EkTClWL8sC2AupyI3cd7/QsV/GDF6Be+saAOTvWToPPiZuX44Q02LaJrIctIw7qLMg=
X-Received: by 2002:a05:651c:1103:: with SMTP id d3mr6543144ljo.110.1591945674743;
 Fri, 12 Jun 2020 00:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <1591796582-5015-1-git-send-email-sumit.garg@linaro.org>
 <1591796582-5015-3-git-send-email-sumit.garg@linaro.org> <20200612042311.GI17660@denix.org>
In-Reply-To: <20200612042311.GI17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 12 Jun 2020 12:37:43 +0530
Message-ID: <CAFA6WYM1MJaAh0B1q0iB_zNfwEQMaTMn7Y2pWfG-2z1t37fPUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] external-arm-toolchain: Refine dev libraries/headers packaging
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org, Paul Barker <pbarker@konsulko.com>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2020 at 09:53, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Wed, Jun 10, 2020 at 07:12:59PM +0530, Sumit Garg wrote:
> > OE core by default package all libraries/headers installed as
> > "${libdir}/lib*.so", "${libdir}/*.la" and {includedir} as part of
> > FILES_${PN}-dev" but in case of external Arm toolchain recipe, multiple
> > packages are provided which needs to include specific libraries and
> > headers. So define "FILES_${PN}-dev" from scratch in order to package
> > dev libraries/headers as part of intended packages and only package
> > remaining libraries/headers as part of "FILES_${PN}-dev".
>
> This is probably fine, but have you considered/tried re-ordering list of
> PACKAGES, moving ${PN}-dev to the end? That way it would let other packages
> to pick up their files before collecting the remainder. Not sure, but I wonder
> if that would be any cleaner...
>

Your suggestion sounded useful, so I gave it a try but unfortunately
OE core still prefers to package libraries and headers as part of
"FILES_${PN}-dev" rather than other intended packages.

Fyi, I just did following change instead of this patch which wasn't successful:

@@ -703,6 +655,17 @@ SUMMARY_libitm-dev = "GNU transactional memory
support library - development fil
 FILES_libitm-staticdev = "${libdir}/libitm.a"
 SUMMARY_libitm-staticdev = "GNU transactional memory support library
- static development files"

+# Package remaining dev libraries and headers
+FILES_${PN}-dev = "\
+       ${includedir} \
+       ${base_libdir}/*_nonshared.a \
+       ${base_libdir}/*.o \
+       ${datadir}/aclocal \
+       ${libdir}/*.o \
+       ${libdir}/*_nonshared.a \
+       ${libdir}/*.so \
+    "
+
 EAT_VER_MAIN ??= ""

-Sumit

>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >  .../external-arm-toolchain.bb                      | 48 ++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > index 8cfc208..5d9a0a8 100644
> > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > @@ -546,6 +546,54 @@ FILES_${PN} += "\
> >       ${base_libdir}/libpcprofile.so \
> >      "
> >
> > +FILES_${PN}-dev = "\
> > +     ${includedir}/*.h \
> > +     ${includedir}/netatalk/ \
> > +     ${includedir}/netiucv/ \
> > +     ${includedir}/neteconet/ \
> > +     ${includedir}/nfs/ \
> > +     ${includedir}/rpcsvc/ \
> > +     ${includedir}/netipx/ \
> > +     ${includedir}/misc/ \
> > +     ${includedir}/rpc/ \
> > +     ${includedir}/sys/ \
> > +     ${includedir}/netrose/ \
> > +     ${includedir}/arpa/ \
> > +     ${includedir}/netinet/ \
> > +     ${includedir}/netrom/ \
> > +     ${includedir}/finclude/ \
> > +     ${includedir}/netax25/ \
> > +     ${includedir}/netash/ \
> > +     ${includedir}/bits/ \
> > +     ${includedir}/xen/ \
> > +     ${includedir}/netpacket/ \
> > +     ${includedir}/drm/ \
> > +     ${includedir}/net/ \
> > +     ${includedir}/protocols/ \
> > +     ${includedir}/gnu/ \
> > +     ${base_libdir}/*_nonshared.a \
> > +     ${base_libdir}/*.o \
> > +     ${datadir}/aclocal \
> > +     ${libdir}/*.o \
> > +     ${libdir}/*_nonshared.a \
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
