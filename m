Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.2696.1592557324801092134
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jun 2020 02:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yg8UBLtF;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id n24so10572475lji.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jun 2020 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/j6s5HL84mdlios0Ft9vVGM3gavVJubFeFk/saSgqJY=;
        b=yg8UBLtFvA8yc5Sw4VxbnR1Xw+3i4acUfPBj4VToIJemJ+Q8JJgUOUKce3kU9YYviv
         pUxOdTvNdkmmeNTGaRTxf0WQc/1aIS1ynFXr8zafusWoGF/Nbl6ISd2kf+b956jn+kmu
         8/AUUVmw4d7diAF8dZ7DHFRv7jhAemVtYEUw+UfURiYH30TxfMe19txA96GJGEl8tzU7
         zzcMCcWMvTIPyRVeGcIzHkYPvvWfRySp4CVn+YOLthhHIFWZ4xPjdD4Cpmm71cp+s2Yv
         Jy1Hx9444zRLjSd3wuKM+1rHR2ExZ9puy+FtaXhgqu45KM/u3N3GBR9dFZL86VQN6dbv
         IHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/j6s5HL84mdlios0Ft9vVGM3gavVJubFeFk/saSgqJY=;
        b=YsvfoizJJ/uhIl2qFY90c5pymfDmxR/0A+xWUyPOUvq9rJUAM2WYeQJbkbANQFz6dY
         5PEGrIEl+2IbS+kwNXZAbniASADj8sUxlRM6nXxI8ZWDwK2W3G2Ph3fYxXV7K8IB/YCg
         d9TCXq57D7btoNwlvozKCk/Xmt7BeNmk1DPluW57i1Qs1GiRhU3GEIqhvOUOwG6YfTql
         YbTGX98EUv4ykQ9sr0UlCquk25UdrefwQMbrt0oIGrzMMUfLY4NHCTD7LLHDRLp2Fcr7
         CqNPvA87qnE2suiQSBuVvQaPdzvEo9OfD9ooUwaFzxoYO9jzf+SnH5ixl1H8Vu0a/++l
         9DWg==
X-Gm-Message-State: AOAM533ag7hczhbllSoNKOBTwas1Bt2bNlfHf8XOiJxaHoT2pgSLPoNq
	DTHu0wL6iQeW6sLePF5aOzYi9gRPxEV9JiKhtCacYg==
X-Google-Smtp-Source: ABdhPJxx6AXtXMK+5nRShRuize0Xu86YpyOrYPLDhl758tz5T9LdEJHEImkp/H/WSgdIMPcQzof4iyPY9k/nt3r8CUQ=
X-Received: by 2002:a2e:9c9:: with SMTP id 192mr1249993ljj.4.1592557322582;
 Fri, 19 Jun 2020 02:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <1619CAD238DC8DE5.13914@lists.yoctoproject.org> <20200619034620.GE17660@denix.org>
In-Reply-To: <20200619034620.GE17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 19 Jun 2020 14:31:50 +0530
Message-ID: <CAFA6WYNuQfMx8adeOgmJZEXrw-NyKbTsVrAKPjhxqrK78_3JaA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 0/5] external-arm-toolchain: Add prebuilt SDK support
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2020 at 09:16, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Thu, Jun 18, 2020 at 08:35:32PM -0400, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > This series adds a recipe with supporting enhancements and settings to package
> > existing cross-compile binaries from external toolchain to be used for SDK.
> >
> > This approach provides a benefit of full re-use of external toolchain and uses
> > the same set of binaries when cross-compiling on development host, as well as
> > SDK host.
> >
> > The limitation is that the SDK host architecture cannot be different from the
> > development host architecture and be the one supported by the external toolchain
> > releases, currently x86_64 and aarch64, which should cover >95% of use cases.
> >
> > For the remaining use cases when the above limitation cannot be met, the default
> > configuration for cross-canadian gcc/gdb/binutils uses weak assignment and can
> > be easily overwritten, which would result in building those components from
> > sources.
> >
> > Generated SDK has been tested using testsdk as follows:
>
> A little catch - this series was developed before the other got merged, so it
> currently conflicts with patch #3 from there. It can be quickly tested by
> reverting patch #3 from the other series, as this expects the use of the
> original EAT_TARGET_SYS and not OE TARGET_SYS. We need to decide what is the
> default.

I would prefer the default being to use prebuilt binaries for SDK as
well as this is something which reflects the purpose to use prebuilt
Arm toolchain in the first place. Along with this it provides a
consistent cross compilation environment for SDK users. So we need
support for EAT_TARGET_SYS. Also, it would be a good option for users
to override the default to rebuild SDK toolchain from source as well
which requires support for OE TARGET_SYS.

Having said that, we also need to support OE native compilation where
native toolchain binaries aren't distributed as pre-built but rather
need to be built from source. So hence we require support for OE
TARGET_SYS.

> If we decide to default to all prebuilt binaries even for SDK, then
> using EAT_TARGET_SYS is easier and requires less adjustments. But if the
> default should be to rebuild SDK binaries, then maybe defaulting to OE
> TARGET_SYS is fine, as just got merged to master. Either way some extra
> symlinking would be necessary and I can take care of it. Please speak up.

Yes this is something which we agreed on earlier as well. So following
simple change worked for me to support both prebuilt and source SDK
toolchain:

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index b44fd2f..a7e08ad 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -106,6 +106,7 @@ do_install() {
        cp ${CP_ARGS}
${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
        if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
                mv
${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS}
${D}${includedir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
+               ln -sf ${TARGET_SYS}
${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS}
        fi
        ln -sf ../usr/include/c++ ${D}/include/c++

@@ -124,6 +125,9 @@ do_install() {
        cp ${CP_ARGS}
${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
        cp ${CP_ARGS}
${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude
${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/

+       ln -sf ${TARGET_SYS} ${D}${libdir}/${EAT_TARGET_SYS}
+       ln -sf ${TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
+
        # fix up the copied symlinks (they are still pointing to the
multiarch directory)
        linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64",
"ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES",
"callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
        ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
@@ -561,6 +565,11 @@ FILES_${PN} += "\
        ${base_libdir}/libpcprofile.so \
     "

+FILES_${PN}-dev += "\
+       ${libdir}/${EAT_TARGET_SYS} \
+       ${libdir}/gcc/${EAT_TARGET_SYS} \
+    "
+
 FILES_${PN}-dbg += "${base_libdir}/debug"

 # From gcc-runtime.inc

If it works for you as well, feel free to make it as a part of your patch-set.

With this change, this patch-set works fine for me. Feel free to add:

Tested-by: Sumit Garg <sumit.garg@linaro.org>

Although, I would like to give some more time to review this patch-set as well.

-Sumit

>
> --
> Denys
>
>
> > $ bitbake core-image-base -c testsdk
> >
> > Results:
> >
> > SDK testing environment: cortexa57-poky-linux
> > GalculatorTest class: SDK doesn't contain gettext
> > No python package in the SDK
> > RESULTS:
> > RESULTS - assimp.BuildAssimp.test_assimp: PASSED (100.40s)
> > RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (45.63s)
> > RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (22.28s)
> > RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (3.93s)
> > RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.13s)
> > RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.13s)
> > RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.21s)
> > RESULTS - gcc.GccCompileTest.test_make: PASSED (0.12s)
> > RESULTS - perl.PerlTest.test_perl: PASSED (0.03s)
> > RESULTS - python.Python3Test.test_python3: PASSED (0.05s)
> > RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> > RESULTS - python.Python2Test.test_python2: SKIPPED (0.00s)
> > SUMMARY:
> > core-image-base sdk (poky-glibc-x86_64-core-image-base-cortexa57-qemuarm64-toolchain-3.1+snapshot.sh:environment-setup-cortexa57-poky-linux) - Ran 12 tests in 172.918s
> > core-image-base sdk - OK - All required tests passed (successes=10, skipped=2, failures=0, errors=0)
> > NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and all succeeded.
> >
> > Changes in v3:
> > - Add patch #5 with SDK fixup code to symlink include directory between
> >   native and target sysroots, so external toolchain can find headers.
> >
> > Changes in v2:
> > - Remove conditional code in patch #2 to select GPL/LGPL license version
> >   based on toolchain component version, as old GPLv2 toolchains are no
> >   longer supported.
> > - In patch #4 in addition to INSANE_SKIP, use SKIP_FILEDEPS for RPM to
> >   skip rdeps checks.
> >
> > Denys Dmytriyenko (5):
> >   external-arm-toolchain-versions: also collect binutils/bfd version
> >   external-arm-toolchain-versions: set per-components license based on
> >     version
> >   external-arm-toolchain: check for TCLIBC being glibc
> >   external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils
> >     cross binaries
> >   tcmode-external-arm: fixup headers location in external toolchain SDK
> >
> >  .../include/external-arm-toolchain-versions.inc    |  38 ++++++
> >  .../conf/distro/include/tcmode-external-arm.inc    |  15 +++
> >  .../external-arm-sdk-toolchain.bb                  | 140 +++++++++++++++++++++
> >  .../external-arm-toolchain.bb                      |   8 +-
> >  4 files changed, 195 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> >
> > --
> > 2.7.4
> >
>
> >
>
> 
