Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.15058.1593581912189213707
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Jun 2020 22:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P4E7XBF9;
 spf=pass (domain: linaro.org, ip: 209.85.167.68, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f68.google.com with SMTP id c11so12845162lfh.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Jun 2020 22:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+1c4oGam4leH6wGSVPTyFJMxuYD76FScjMfwOoKWWU=;
        b=P4E7XBF9VBJ3NJkzJMjz/T6vtkQm2jWP5DHkcH/H5/T4aZL/unRevCGvwwJIFUyngx
         hZLB1pPeigzv/WnrL9WIDe9RxtS3zkXOUzXdOzYyVOuqifWffCpRXC6PKk70ws44Yc0Y
         +p5toJyNWdngTsg/F+AT+35/Ni/j6XYpINAqG0QqcDcwvZLA0D03fpxo/4k611VQ66xX
         uiQITqBjTfAyBwtT9ohEvcUomGO+Yw9zcPZSRI/Hx5WC7YJCe85VtP2gVwS1vuVe4jaL
         Cc9yW06gxNsA8OOxdGnl0VlMPmRFDXEal3aNVN49LtucoW3WLL1iEoDulXzbf3J+b+Qy
         6i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+1c4oGam4leH6wGSVPTyFJMxuYD76FScjMfwOoKWWU=;
        b=Ulu1452F4JfYbLBY3mGp7aR/3QbzwEcXi6WjRUhWx1486wDYhsvH6MCKDRFZdY4Xvp
         0gtP/1KJnTtIoKxwBniu3AJx3ZdAWQ2yVZKqaj7e9vIiyYdXyXACKxRYGD3e9L6PZG9Y
         vJsrZUb5R5dd4gc02Hvj6d0KKokdFrN8zSKfCdTxJcJ9u1zN2KDyyGdYk152wo/j80xl
         aSfWvKMt82iH32vtZxk8tG7uMkJpIXZcY3zKozPETrr78H0SpHRx4DiBh7PbtZXRot8u
         5kNL4sExiXAp3190o9QkIYWS6tKsX/jnNkXj9qOBhvlYEdBo2DTVe461rz0GVQCsCwBc
         RACw==
X-Gm-Message-State: AOAM530/RuX4nC1DDhxy4lEBHt//QYbSBcspYjBak6i3tUf/NVTH/PTF
	pCrmEDH3xFLTetjuWBDxZ8EqrIo3z9gtBByL+fNwvg==
X-Google-Smtp-Source: ABdhPJzk6FYxEQmqrkD3qSrCmGgtGYTttcyhDjWJ8IfvTxjeKyTF3R05f1KJj3IoCpcN9SxuTpbcopr0gj+vtnbXc20=
X-Received: by 2002:a19:604f:: with SMTP id p15mr14440222lfk.59.1593581910111;
 Tue, 30 Jun 2020 22:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <1619CAD238DC8DE5.13914@lists.yoctoproject.org>
 <20200619034620.GE17660@denix.org> <CAFA6WYNuQfMx8adeOgmJZEXrw-NyKbTsVrAKPjhxqrK78_3JaA@mail.gmail.com>
 <CAFA6WYMQK2vYFNusjSqEBGhrno284R-Z+8epj2MDJsAXOyoQmQ@mail.gmail.com> <20200630011644.GO17660@denix.org>
In-Reply-To: <20200630011644.GO17660@denix.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Wed, 1 Jul 2020 11:08:18 +0530
Message-ID: <CAFA6WYM8d3L+=ZzcGU5McW1Z+c-HsrUd8J1HX+0YiUwavj1mUQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH v3 0/5] external-arm-toolchain: Add prebuilt SDK support
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2020 at 06:46, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Jun 23, 2020 at 08:29:59PM +0530, Sumit Garg wrote:
> > On Fri, 19 Jun 2020 at 14:31, Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > On Fri, 19 Jun 2020 at 09:16, Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > On Thu, Jun 18, 2020 at 08:35:32PM -0400, Denys Dmytriyenko wrote:
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > > This series adds a recipe with supporting enhancements and settings to package
> > > > > existing cross-compile binaries from external toolchain to be used for SDK.
> > > > >
> > > > > This approach provides a benefit of full re-use of external toolchain and uses
> > > > > the same set of binaries when cross-compiling on development host, as well as
> > > > > SDK host.
> > > > >
> > > > > The limitation is that the SDK host architecture cannot be different from the
> > > > > development host architecture and be the one supported by the external toolchain
> > > > > releases, currently x86_64 and aarch64, which should cover >95% of use cases.
> > > > >
> > > > > For the remaining use cases when the above limitation cannot be met, the default
> > > > > configuration for cross-canadian gcc/gdb/binutils uses weak assignment and can
> > > > > be easily overwritten, which would result in building those components from
> > > > > sources.
> > > > >
> > > > > Generated SDK has been tested using testsdk as follows:
> > > >
> > > > A little catch - this series was developed before the other got merged, so it
> > > > currently conflicts with patch #3 from there. It can be quickly tested by
> > > > reverting patch #3 from the other series, as this expects the use of the
> > > > original EAT_TARGET_SYS and not OE TARGET_SYS. We need to decide what is the
> > > > default.
> > >
> > > I would prefer the default being to use prebuilt binaries for SDK as
> > > well as this is something which reflects the purpose to use prebuilt
> > > Arm toolchain in the first place. Along with this it provides a
> > > consistent cross compilation environment for SDK users. So we need
> > > support for EAT_TARGET_SYS. Also, it would be a good option for users
> > > to override the default to rebuild SDK toolchain from source as well
> > > which requires support for OE TARGET_SYS.
> > >
> > > Having said that, we also need to support OE native compilation where
> > > native toolchain binaries aren't distributed as pre-built but rather
> > > need to be built from source. So hence we require support for OE
> > > TARGET_SYS.
> > >
> > > > If we decide to default to all prebuilt binaries even for SDK, then
> > > > using EAT_TARGET_SYS is easier and requires less adjustments. But if the
> > > > default should be to rebuild SDK binaries, then maybe defaulting to OE
> > > > TARGET_SYS is fine, as just got merged to master. Either way some extra
> > > > symlinking would be necessary and I can take care of it. Please speak up.
> > >
> > > Yes this is something which we agreed on earlier as well. So following
> > > simple change worked for me to support both prebuilt and source SDK
> > > toolchain:
> > >
> >
> > After looking carefully at external-arm-sdk-toolchain recipe, it looks
> > like we don't need below symlinks in external-arm-toolchain recipe as
> > all the libraries and headers required for cross-compilation
> > corresponding to EAT_TARGET_SYS can be packaged as part of
> > gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} which seems like a clean
> > solution.
>
> Well, there's one more use case that I had supported for long time - native
> compilation on the target.
>
> In that case, you compile gcc from sources, moreover, it's not an arm gcc, but
> vanilla from oe-core.

In either case (arm gcc or vanilla from oe-core), isn't the
target/native compiler built using OE TARGET_SYS?

I just gave target/native compiler (arm gcc) a try on Qemu using
core-image-kernel-dev image. Although I need to avoid some header
collisions from target compiler and libgcc, will post a separate patch
for that as well.

And following is the versioning info which includes target sys for
which the compiler is built:

=========
Poky (Yocto Project Reference Distro) 3.1+snapshot qemuarm64 ttyAMA0

qemuarm64 login: root
root@qemuarm64:~#
root@qemuarm64:~#
root@qemuarm64:~# gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/aarch64-poky-linux/9.2.1/lto-wrapper
Target: aarch64-poky-linux
Configured with:
../../../../../../work-shared/gcc-arm-9.2-r2019.12/gcc-arm-src-snapshot-9.2-2019.12/configure
--build=x86_64-linux --host=aarch64-poky-linux
--target=aarch64-poky-linux --prefix=/usr --exec_prefix=/usr
--bindir=/usr/bin --sbindir=/usr/sbin --libexecdir=/usr/libexec
--datadir=/usr/share --sysconfdir=/etc --sharedstatedir=/com
--localstatedir=/var --libdir=/usr/lib --includedir=/usr/include
--oldincludedir=/usr/include --infodir=/usr/share/info
--mandir=/usr/share/man --disable-silent-rules
--disable-dependency-tracking --with-libtool-sysroot=/ --with-gnu-ld
--enable-shared --enable-languages=c,c++ --enable-threads=posix
--disable-multilib --enable-default-pie --enable-c99
--enable-long-long --enable-symvers=gnu --enable-libstdcxx-pch
--program-prefix=aarch64-none-linux-gnu- --without-local-prefix
--disable-install-libiberty
--with-specs='%{!fno-common:%{!fcommon:-fcommon}}' --enable-lto
--disable-libssp --enable-libitm --disable-bootstrap
--disable-libmudflap --with-system-zlib --with-linker-hash-style=gnu
--enable-linker-build-id --with-ppl=no --with-cloog=no
--enable-checking=release --enable-cheaders=c_global --without-isl
--with-build-sysroot=/ --disable-static --enable-nls
--with-glibc-version=2.28 --enable-initfini-array
--enable-__cxa_atexit
Thread model: posix
gcc version 9.2.1 20191025 (GCC)
=========

Is there any of your special downstream use-case which I am missing here?

> That poses some challenges, when those gcc versions do
> not match. But due to re-use, you have to use existing runtime libs from
> glibc, libstdc++ and libgcc along with their corresponding headers, that were
> packaged by external-arm-toolchain recipe.

I think to avoid version skew problems, we should rely arm gcc
target/native toolchain built from source which can be easily done via
overriding following variable:

GCCVERSION = "arm-9.2"

> You are not going to install the
> SDK packages like gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} to get those
> headers on the target - they should come from corresponding *-dev packages,
> like glibc-dev, libstdc++-dev and libgcc-dev, etc.
>

We already package headers corresponding to OE TARGET_SYS which
suffices upstream target/native compilation.

-Sumit

> --
> Denys
>
>
> > > diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > index b44fd2f..a7e08ad 100644
> > > --- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > @@ -106,6 +106,7 @@ do_install() {
> > >         cp ${CP_ARGS}
> > > ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${includedir}
> > >         if [ -d ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS} ]; then
> > >                 mv
> > > ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS}
> > > ${D}${includedir}/c++/${EAT_VER_GCC}/${TARGET_SYS}
> > > +               ln -sf ${TARGET_SYS}
> > > ${D}${includedir}/c++/${EAT_VER_GCC}/${EAT_TARGET_SYS}
> > >         fi
> > >         ln -sf ../usr/include/c++ ${D}/include/c++
> > >
> > > @@ -124,6 +125,9 @@ do_install() {
> > >         cp ${CP_ARGS}
> > > ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
> > > ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > >         cp ${CP_ARGS}
> > > ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/finclude
> > > ${D}${libdir}/gcc/${TARGET_SYS}/${EAT_VER_GCC}/
> > >
> > > +       ln -sf ${TARGET_SYS} ${D}${libdir}/${EAT_TARGET_SYS}
> > > +       ln -sf ${TARGET_SYS} ${D}${libdir}/gcc/${EAT_TARGET_SYS}
> > > +
> > >         # fix up the copied symlinks (they are still pointing to the
> > > multiarch directory)
> > >         linker_name="${@bb.utils.contains("TUNE_FEATURES", "aarch64",
> > > "ld-linux-aarch64.so.1", bb.utils.contains("TUNE_FEATURES",
> > > "callconvention-hard", "ld-linux-armhf.so.3", "ld-linux.so.3",d), d)}"
> > >         ln -sf ld-${EAT_VER_LIBC}.so ${D}${base_libdir}/${linker_name}
> > > @@ -561,6 +565,11 @@ FILES_${PN} += "\
> > >         ${base_libdir}/libpcprofile.so \
> > >      "
> > >
> > > +FILES_${PN}-dev += "\
> > > +       ${libdir}/${EAT_TARGET_SYS} \
> > > +       ${libdir}/gcc/${EAT_TARGET_SYS} \
> > > +    "
> > > +
> > >  FILES_${PN}-dbg += "${base_libdir}/debug"
> > >
> > >  # From gcc-runtime.inc
> > >
> > > If it works for you as well, feel free to make it as a part of your patch-set.
> > >
> > > With this change, this patch-set works fine for me. Feel free to add:
> > >
> > > Tested-by: Sumit Garg <sumit.garg@linaro.org>
> > >
> > > Although, I would like to give some more time to review this patch-set as well.
> > >
> > > -Sumit
> > >
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > > $ bitbake core-image-base -c testsdk
> > > > >
> > > > > Results:
> > > > >
> > > > > SDK testing environment: cortexa57-poky-linux
> > > > > GalculatorTest class: SDK doesn't contain gettext
> > > > > No python package in the SDK
> > > > > RESULTS:
> > > > > RESULTS - assimp.BuildAssimp.test_assimp: PASSED (100.40s)
> > > > > RESULTS - buildcpio.BuildCpioTest.test_cpio: PASSED (45.63s)
> > > > > RESULTS - buildepoxy.EpoxyTest.test_epoxy: PASSED (22.28s)
> > > > > RESULTS - buildlzip.BuildLzipTest.test_lzip: PASSED (3.93s)
> > > > > RESULTS - gcc.GccCompileTest.test_gcc_compile: PASSED (0.13s)
> > > > > RESULTS - gcc.GccCompileTest.test_gpp2_compile: PASSED (0.13s)
> > > > > RESULTS - gcc.GccCompileTest.test_gpp_compile: PASSED (0.21s)
> > > > > RESULTS - gcc.GccCompileTest.test_make: PASSED (0.12s)
> > > > > RESULTS - perl.PerlTest.test_perl: PASSED (0.03s)
> > > > > RESULTS - python.Python3Test.test_python3: PASSED (0.05s)
> > > > > RESULTS - buildgalculator.GalculatorTest.test_galculator: SKIPPED (0.00s)
> > > > > RESULTS - python.Python2Test.test_python2: SKIPPED (0.00s)
> > > > > SUMMARY:
> > > > > core-image-base sdk (poky-glibc-x86_64-core-image-base-cortexa57-qemuarm64-toolchain-3.1+snapshot.sh:environment-setup-cortexa57-poky-linux) - Ran 12 tests in 172.918s
> > > > > core-image-base sdk - OK - All required tests passed (successes=10, skipped=2, failures=0, errors=0)
> > > > > NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and all succeeded.
> > > > >
> > > > > Changes in v3:
> > > > > - Add patch #5 with SDK fixup code to symlink include directory between
> > > > >   native and target sysroots, so external toolchain can find headers.
> > > > >
> > > > > Changes in v2:
> > > > > - Remove conditional code in patch #2 to select GPL/LGPL license version
> > > > >   based on toolchain component version, as old GPLv2 toolchains are no
> > > > >   longer supported.
> > > > > - In patch #4 in addition to INSANE_SKIP, use SKIP_FILEDEPS for RPM to
> > > > >   skip rdeps checks.
> > > > >
> > > > > Denys Dmytriyenko (5):
> > > > >   external-arm-toolchain-versions: also collect binutils/bfd version
> > > > >   external-arm-toolchain-versions: set per-components license based on
> > > > >     version
> > > > >   external-arm-toolchain: check for TCLIBC being glibc
> > > > >   external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils
> > > > >     cross binaries
> > > > >   tcmode-external-arm: fixup headers location in external toolchain SDK
> > > > >
> > > > >  .../include/external-arm-toolchain-versions.inc    |  38 ++++++
> > > > >  .../conf/distro/include/tcmode-external-arm.inc    |  15 +++
> > > > >  .../external-arm-sdk-toolchain.bb                  | 140 +++++++++++++++++++++
> > > > >  .../external-arm-toolchain.bb                      |   8 +-
> > > > >  4 files changed, 195 insertions(+), 6 deletions(-)
> > > > >  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> > > > >
> > > > > --
> > > > > 2.7.4
> > > > >
> > > >
> > > > >
> > > >
> > > > 
> >
