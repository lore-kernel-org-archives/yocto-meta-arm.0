Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.2266.1588879874366857659
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 12:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=IQNNzjyq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id j2so5820576qtr.12
        for <meta-arm@lists.yoctoproject.org>; Thu, 07 May 2020 12:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hzRDjNTuaFD26uAePpBShVsUE4TlGhnbMqEexffELfo=;
        b=IQNNzjyqINypHsgJTGYw2jqd0z3tD3giTqlc1WpkxoJ8zIT/m5cWjcVNLjkonA8FN6
         e1CRArXu2DeErsdB8tV+mWkrtzo/PwxZ3xjsLD481agCEFWde5a55yEexh1rokBH32y5
         zJyWhnZIggdohLY2T04t+Vo9wk11nNTJABJyLdgLBx12J+EdBDe6Y5XKFZERjJjtzT9l
         kX4DV9WwOECmvFOpp1bDpGKrynkQlg4v/2KSL8/ymycevxUenA4nHuqLZbmQfUZJBAtD
         gEaW9NYImbslWPtMr2EaSTfwrP6BnBjIiHzmF4i9UBZyVqRqfONLBz8/el5/mNpABCy0
         57sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hzRDjNTuaFD26uAePpBShVsUE4TlGhnbMqEexffELfo=;
        b=XheO387GawOly893l4AcqBQyNZuTQol+cJfagcsqM5+9L80Tbs9BmSD5PcrZHhbdg5
         RYZ3ShpnrIzaicu+SXZ7CGKjVTYsDctndaljfqKPzSX3HhtONThw8vjxg5Rh73Attkfm
         LBMFJ6b9UHq4vQSQKROnoMjRhMgDyngZSqxxcSIQ3jkxfcN3UsZxv62UJ8DgnVSqMPgD
         x/JU6ZBFeCnUDO8YgB970mqz8699oqdiutWosyVtv543rqcvM+gZoycoZGy3zHgfyWwB
         8bz6i3gvmU5JPNnG31Qz8SPUg6Vv6FXj6jl+bEEAFI9IznYTvsRx/kkkwCp8tnrdMdiZ
         642A==
X-Gm-Message-State: AGi0PuZZhyU+01lFNFfl86n2FPiBt7+AlJ/+wd5Yoewe8jlWzeUtB5Uq
	iy8GTLK+bJIgXGEZ1P7VHd7ooA==
X-Google-Smtp-Source: APiQypKmaWnfXPaindg4P6x+JmdtRJypelMWtNxzGyLfNkRGH4IodQnedguSrAG0FwVL9bvcubj5pg==
X-Received: by 2002:aed:221c:: with SMTP id n28mr15370575qtc.235.1588879873360;
        Thu, 07 May 2020 12:31:13 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:d1e6:bc5d:97fe:f5af])
        by smtp.gmail.com with ESMTPSA id g8sm4959848qkb.30.2020.05.07.12.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 12:31:12 -0700 (PDT)
Date: Thu, 7 May 2020 15:31:11 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH v2] meta-arm-bsp: Update gem5 and switch to python3
Message-ID: <20200507193110.GA1726@kudzu.us>
References: <20200507164818.24202-1-bertrand.marquis@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200507164818.24202-1-bertrand.marquis@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 07, 2020 at 05:48:18PM +0100, Bertrand Marquis wrote:
> This patch includes several fixes for gem5-aarch64
> - Switch to a new version of gem5 supporting python3 and use python3 to
>  build it.
>  We use a version in develop branch of gem5 for now and we will have to
>  switch to release 20 once it is released mid of may.
> - Remove scons python2 recipes which were used before by gem5 as a
>  workaround until gem5 was updated to support python3
> - make gem5-aarch64-bootloader only compatible with gem5-aarch64
> - remove unnecessary FILESEXTRAPATHS_prepend in gem5-aarch64-bootloader
> 
> Change-Id: Iad9af4f2e6073ef63a51c2c33a05ed3855dd8f08
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v2:
> - update version of gem5 used to solve problems encountered during
>   compilation on some distributions (produced on debian-10 but not
>   on ubuntu 18.04)


This is working for me.  Applied to the master branch.

Thanks,
Jon

> ---
>  .../gem5/gem5-aarch64-bootloader.inc          |  3 +--
>  .../gem5/gem5-aarch64-bootloader_git.bb       |  9 ++++----
>  .../recipes-devtools/gem5/gem5-aarch64-dtb.bb |  5 -----
>  .../gem5/gem5-aarch64-native_git.bb           |  6 ++++--
>  .../recipes-devtools/gem5/gem5-native.inc     | 21 +++++++++----------
>  meta-arm-bsp/recipes-devtools/python/README   |  4 ----
>  .../python/python-scons-native_3.0.1.bb       |  8 -------
>  .../python/python-scons_3.0.1.bb              | 21 -------------------
>  8 files changed, 20 insertions(+), 57 deletions(-)
>  delete mode 100644 meta-arm-bsp/recipes-devtools/python/README
>  delete mode 100644 meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
>  delete mode 100644 meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
> 
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> index 72069ad..4c479f5 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader.inc
> @@ -7,8 +7,7 @@ inherit deploy
>  
>  PROVIDES = "virtual/gem5-bootloader"
>  
> -COMPATIBLE_MACHINE ?= ""
> -COMPATIBLE_MACHINE_gem5_arm64 = "gem5-arm64"
> +COMPATIBLE_MACHINE = "gem5-arm64"
>  
>  # no configure step
>  do_configure[noexec] = "1"
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> index ffbc2da..68f3648 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-bootloader_git.bb
> @@ -1,16 +1,17 @@
>  # gem5 custom bootloader
>  
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https"
> -
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
>                      file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
>  
> +# The recipe is currently using a version in the development branch of gem5
> +# until version 20 with python3 support is released
> +SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
> +
>  PV = "git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "bcf041f257623e5c9e77d35b7531bae59edc0423"
> +SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
>  
>  BPN = "gem5-aarch64-bootloader"
>  
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
> index 362a8e0..b97a1b2 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-dtb.bb
> @@ -9,14 +9,9 @@ DEPENDS = "gem5-aarch64-native"
>  do_configure[noexec] = "1"
>  
>  do_compile() {
> -    # Gem5 is requiring a non zero size disk even though it is not required to
> -    # generate the dtb. Use /proc/version as disk file.
> -
>      # generate a dtb using gem5
>      gem5.opt \
>          ${STAGING_DATADIR_NATIVE}/gem5/configs/example/arm/baremetal.py \
> -        --disk-image /proc/version \
> -        --kernel "" \
>          --dtb-gen
>  
>      if [ ! -f m5out/system.dtb ]; then
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> index 9c77121..c42c82f 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-aarch64-native_git.bb
> @@ -3,13 +3,15 @@
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d9514d69d8abf88b6e9125e759bf0ab \
>                      file://LICENSE;md5=a585e2893cee63d16a1d8bc16c6297ec"
>  
> -SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https"
> +# The recipe is currently using a version in the development branch of gem5
> +# until version 20 with python3 support is released
> +SRC_URI = "git://gem5.googlesource.com/public/gem5;protocol=https;branch=develop"
>  
>  PV = "git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "bcf041f257623e5c9e77d35b7531bae59edc0423"
> +SRCREV = "3eab6ea51e4c2b97e7a68835dddacb989d7559c4"
>  
>  BPN = "gem5-aarch64-native"
>  
> diff --git a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> index 4b02d13..429e18c 100644
> --- a/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> +++ b/meta-arm-bsp/recipes-devtools/gem5/gem5-native.inc
> @@ -11,30 +11,29 @@ GEM5_BUILD_CONFIGS ?= "build/X86/gem5.opt"
>  
>  # Scons build arguments
>  GEM5_SCONS_ARGS ?= "-j ${BB_NUMBER_THREADS} CC=${BUILD_CC} CXX=${BUILD_CXX} \
> -    AS=${BUILD_AS} AR=${BUILD_AR} ${GEM5_BUILD_CONFIGS}"
> +    AS=${BUILD_AS} AR=${BUILD_AR} ${GEM5_BUILD_CONFIGS} \
> +    PYTHON_CONFIG=python3-config"
>  
>  # Default profile to run
>  GEM5_RUN_PROFILE ?= "configs/example/fs.py"
>  
> -# We are building a native package and we need to use python
> -inherit native pythonnative
> +# We are building a native package and we need to use scons
> +inherit native scons
>  
>  # the build is using several tools:
> -# python: scons and six
> +# python3: scons and six
>  # google protobuf
>  # pkgconfig
>  # hdf5
> -DEPENDS += "python-native python-scons-native python-six-native \
> -    protobuf-native hdf5-native pkgconfig-native boost-native libpng-native"
> +DEPENDS += "python3-six-native protobuf-native hdf5-native pkgconfig-native \
> +    boost-native libpng-native"
>  
> -do_configure[noexec] = "1"
> +EXTRA_OESCONS = "${GEM5_SCONS_ARGS}"
>  
> -do_compile() {
> +do_compile_prepend() {
>      # We need to use the proper native libraries when executing
>      # compiled applications
>      export LD_LIBRARY_PATH="${STAGING_LIBDIR_NATIVE}"
> -
> -    scons ${GEM5_SCONS_ARGS}
>  }
>  
>  do_install() {
> @@ -58,5 +57,5 @@ EOF
>  
>  FILES_${PN} = "${datadir}/gem5/* ${bindir}/*"
>  INSANE_SKIP_${PN} += "already-stripped"
> -RDEPENDS_${PN} += "python-native hdf5-native protobuf-native libpng-native"
> +RDEPENDS_${PN} += "python3-native hdf5-native protobuf-native libpng-native"
>  
> diff --git a/meta-arm-bsp/recipes-devtools/python/README b/meta-arm-bsp/recipes-devtools/python/README
> deleted file mode 100644
> index b80c757..0000000
> --- a/meta-arm-bsp/recipes-devtools/python/README
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -This is added for Gem5 compilation with Zeus as it has been removed from
> -OpenEmbedded (and Gem5 needs scons to be compiled).
> -
> -This should be removed once Gem5 supports properly python3.
> diff --git a/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb b/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
> deleted file mode 100644
> index 68b63c9..0000000
> --- a/meta-arm-bsp/recipes-devtools/python/python-scons-native_3.0.1.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require python-scons_${PV}.bb
> -inherit native pythonnative
> -DEPENDS = "python-native"
> -RDEPENDS_${PN} = ""
> -
> -do_install_append() {
> -    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
> -}
> diff --git a/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb b/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
> deleted file mode 100644
> index d5084b2..0000000
> --- a/meta-arm-bsp/recipes-devtools/python/python-scons_3.0.1.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "Software Construction tool (make/autotools replacement)"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
> -
> -SRC_URI[md5sum] = "b6a292e251b34b82c203b56cfa3968b3"
> -SRC_URI[sha256sum] = "24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173"
> -
> -UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
> -UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> -
> -inherit pypi setuptools
> -
> -RDEPENDS_${PN} = "\
> -  python-fcntl \
> -  python-io \
> -  python-json \
> -  python-subprocess \
> -  python-shell \
> -  python-pprint \
> -  "
> -- 
> 2.17.1
> 

> 

