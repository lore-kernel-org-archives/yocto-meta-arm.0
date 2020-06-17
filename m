Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web12.1662.1592374580831799945
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 23:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zIB/m3qV;
 spf=pass (domain: linaro.org, ip: 209.85.167.68, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f68.google.com with SMTP id d27so564617lfq.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jun 2020 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xWxU+nSgchfp4CSeK91xnTb1mqx5hstIYd2R6jhj26Y=;
        b=zIB/m3qVScjJCoNa6akGqmpMXr6w5S0/b4ciEx6XHWfwPnDiGMiXhu1aMTKo3Vdj2E
         bFIbEFnZhpgCbyDCGrMRhKjT0d4/DXyTRfMsI8JojGbxXiqsowDNK3t5TDFhtz07w2Vs
         NJgIwc2EikvWSwJzVSUEgJMKDHyytlCOnkZjK+JBjXXSfNCshCL+3GLcFiqdbV+bCKHo
         3MkMKtfyltFj1aqhebx0qjBVMHO6GNP87KvbFh9FwhDAvOkBC7wb6isD0vtwv0/FRne2
         kTF+nS5qwI4h2lE/5NoLBz7s8uB9jF1z24lbFHzY7dAKlD6+OaIgphfHyz2WoPvndK7J
         pX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xWxU+nSgchfp4CSeK91xnTb1mqx5hstIYd2R6jhj26Y=;
        b=uYvnIE1WI80E4bvwnA53oqB9ngQ7jm734cSIOO+KDoeLH+ZSzDnCDdQVwn6w0VxX44
         vvijM0WhAAOWFEiAnP12ECwwpfGTvF4c6BVlzNDaSWhFArKi8Y+JfdZ4KtRUc6NaG0hC
         KD7JbuIMvQL3K3BF7unxy+XpPunotejNuQveiZJIppneOFiUkZf7+7ajmUI7RttpxWYe
         YDeZzmloUh1aE8CC9qOlgJrd76GJGuj2ZtQD1Qucj4izOMVEyw1VdeCx4+QdC7KSiRRr
         qd9DbBmS1x3cxVOZC7xvWVeSzjTGUQFBarNxuidp45aivabgtbc1qOwXaAJ6ZQo8Dfss
         uMwQ==
X-Gm-Message-State: AOAM5327+CoTrNORJSQjBxFXMlT9PWsNLwaa6GtoHXjgn+kan8ETCVVt
	KcZtbJ9USDCvkm4b12u71zdpdyDcW4GXVlmEd+iRnJinEMo=
X-Google-Smtp-Source: ABdhPJx2u9QeUkJWV4LnFWAlxtVDfC1vyEUUbLIegrj4iFJwdGk2+uECAYFVhElLg4b1x+q6OdZkGHbcTPu8WKI0NXk=
X-Received: by 2002:ac2:41d4:: with SMTP id d20mr3646312lfi.204.1592374578589;
 Tue, 16 Jun 2020 23:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <1617C553B582127C.6417@lists.yoctoproject.org>
In-Reply-To: <1617C553B582127C.6417@lists.yoctoproject.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Wed, 17 Jun 2020 11:46:06 +0530
Message-ID: <CAFA6WYMa5thJhWTJQYnHgyOwRFmqedytMAQsvcBeXBHXjDMCqw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 0/5] external-arm-toolchain: Add support for SDK generation
To: meta-arm@lists.yoctoproject.org, Jon Mason <jdmason@kudzu.us>
Cc: Paul Barker <pbarker@konsulko.com>, Denys Dmytriyenko <denis@denix.org>, wmills@ti.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2020 at 16:02, Sumit Garg via lists.yoctoproject.org
<sumit.garg=linaro.org@lists.yoctoproject.org> wrote:
>
> Patch #1 #2 and #3 adds impprovements in external-arm-toolchain recipe in order
> to support SDK generation. SDK generation has been tested using:
>
> $ bitbake core-image-base -c populate_sdk
>
> Currently generated SDK only uses glibc provided by pre-built toolchain. The
> cross compiler, binutils, gdb/gdbserver etc. are built from source. This is
> something we would like to improve in future to package most of the components
> from pre-built toolchain instead.
>
> Generated SDK has been tested using testsdk as follows:
>
> $ bitbake core-image-base -c testsdk
>
> Results:
>
> SDK testing environment: aarch64-poky-linux
> GalculatorTest class: SDK doesn't contain gettext
> No python package in the SDK
> RESULTS:
> RESULTS - assimp.BuildAssimp.test_assimp: PASSED (97.93s)
> RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (22.51s)
> RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (17.40s)
> RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (2.52s)
> RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.06s)
> RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.08s)
> RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.10s)
> RESULTS - gcc.GccCompileTest.test_make: PASSED (0.06s)
> RESULTS - perl.PerlTest.test_perl: PASSED (0.23s)
> RESULTS - python.Python3Test.test_python3: PASSED (0.03s)
> RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> RESULTS - python.Python2Test.test_python2: SKIPPED (0.00s)
> SUMMARY:
> core-image-base sdk (poky-glibc-x86_64-core-image-base-aarch64-qemuarm64-toolchain-3.1+snapshot.sh:environment-setup-aarch64-poky-linux) - Ran 12 tests in 140.936s
> core-image-base sdk - OK - All required tests passed (successes=10, skipped=2, failures=0, errors=0)
>
> Patch #4 adds a README for meta-arm-toolchain layer.
>
> Patch #5 adds package specific licences for external-arm-toolchain recipe.
>
> Changes in v3:
> - Patch #2: re-order PACKAGES list rather than defining FILES_${PN}-dev
>   from scratch as it allows us to achieve the intended objective and is
>   much portable and cleaner approach.
> - Add review tags for patch #1 and #5.
>

Do we have any further comments on this patch-set? If not then I think
it should be fine to go ahead with this patch-set.

-Sumit

> Changes in v2:
> - Adds a new patch #3 which fixes issues reported by testsdk.
> - Define FILES_${PN}-dev from scratch which additionally refines packaging
>   for dev headers as well.
> - Make README common for whole meta-arm-toolchain layer rather than specific
>   to pre-built toolchain. Add myself as layer maintainer although I would
>   be happy to add another co-maintainer if someone is willing to volunteer.
> - Update README with testing info for external-arm-toolchain.
> - Misc. fixups.
>
> Sumit Garg (5):
>   external-arm-toolchain: Remove glibc locale dependency
>   external-arm-toolchain: Refine dev libraries/headers packaging
>   external-arm-toolchain: Align glibc packaging to OE TARGET_SYS
>   meta-arm-toolchain: Add README
>   external-arm-toolchain: Add package specific licenses
>
>  meta-arm-toolchain/README.md                       | 113 +++++++++++++++++++++
>  .../conf/distro/include/tcmode-external-arm.inc    |   1 +
>  .../external-arm-toolchain.bb                      |  35 +++++--
>  .../external-arm-toolchain/license.inc             |  76 ++++++++++++++
>  .../recipes-devtools/gcc/gcc-arm-common.inc        |   2 +-
>  5 files changed, 216 insertions(+), 11 deletions(-)
>  create mode 100644 meta-arm-toolchain/README.md
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/license.inc
>
> --
> 2.7.4
>
> 
