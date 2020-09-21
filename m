Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.43246.1600698339542573560
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 07:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mk1QaCWQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id h6so12418098qtd.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Sep 2020 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R3y2zszWuWdmSe3mDK8Boa0K+VpLzwMeEfRh/QEi8mU=;
        b=mk1QaCWQe+TcmbK9a1v/9znwIWH0tzc8Siedqs6JQBbuUsSd+aSy7B0QqFmvT8n13R
         jaX7WOYJpfzw5f6DgJ3+NuoER8MLi3yeaRkfRiiXhy2e+XJ6wFy6mp+3jziFpdynkLVE
         Kjhe/2pbvRsW/dySGhstS5Cvml1Dxoxi2ktgjN/TKeAl5j8RzFR1X+qYxPmJ2LSj92ml
         sPXqV5v2okGiIgtMy36ameZO9tJibR5NBFKkfOZe5HjI0XN2i/YL/3NV2vPXF9qKfy+4
         47M8WPBRCv9oQPpLdqvIVz/kDqAKEg58n4RSqUVgFyUR5PuekSPkIjy+UL1Z+tLEhLkN
         HCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R3y2zszWuWdmSe3mDK8Boa0K+VpLzwMeEfRh/QEi8mU=;
        b=FuNgCYF21F1IVs/2JP2a58g5vzZzjatWAq/Cv1xgHk0XuDv+w2lw3FHz2Ae9KAGbbn
         nHmH5aCAMEHhfX5sFs6bq/9e2HWreagC/rDC+tWdp74/yTSr2yLZYfdYDO2vfhddQsbl
         U3A1HGm2SA8AMleQko9xghpNufK83J8B+B667Loe9/4eMXoDkbkXRillnyaYzdIts9M9
         3CcFdELa+Rm/k6BlB/RmWwpTApmrvYaV2LoaVnFtmTkXMHJjQBTLZh9tHQSvHN+hvXmI
         yuHS8BRTnYz7pGLGE5PEAlT9k93ShO85NEYnxXq4Qah4c8XOHthH8pr7Fl+i/4doT5pF
         47mA==
X-Gm-Message-State: AOAM531mk/yo0AKvqqKgC1IYD8y+UZwMJiRnEv8zBAEovpYExOl2hXX6
	M+OGbD4DsZq6D2S+iAH6kiYIUw==
X-Google-Smtp-Source: ABdhPJw0HZLSCMiYfeReyklAOcN9bfFVUpOrM00BjfzwMo34zKzHYvRlKHHhdrJ/HSVPRvKPrOZAuA==
X-Received: by 2002:ac8:f57:: with SMTP id l23mr46853245qtk.166.1600698338642;
        Mon, 21 Sep 2020 07:25:38 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id c1sm10271918qta.86.2020.09.21.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:25:38 -0700 (PDT)
Date: Mon, 21 Sep 2020 10:25:33 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Sumit Garg <sumit.garg@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, ross.burton@arm.com,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-arm][PATCH v4 4/5] external-arm-sdk-toolchain: add recipe to package gcc/gdb/binutils cross binaries
Message-ID: <20200921142532.GC16787@kudzu.us>
References: <1600344931-30670-1-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1600344931-30670-1-git-send-email-sumit.garg@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 05:45:31PM +0530, Sumit Garg wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Allows re-use of prebuilt ARM toolchain binaries for SDK generation.
> 
> This code is upstreamed from meta-arago layer.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> [Sumit: package headers corresponding to EAT_TARGET_SYS and add PV]
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>

Pulled into master.

Thanks,
Jon

> ---
> 
> Changes in v4:
> - Package headers corresponding to EAT_TARGET_SYS.
> - Add PV for external-arm-sdk-toolchain.bb recipe.
> - After these changes, we don't need patch #5 hack.
> - Patches #1 to #3 are already applied.
> 
>  .../conf/distro/include/tcmode-external-arm.inc    |   4 +
>  .../external-arm-sdk-toolchain.bb                  | 144 +++++++++++++++++++++
>  2 files changed, 148 insertions(+)
>  create mode 100644 meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> 
> diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> index eee1a51..7d5aecc 100644
> --- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> +++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
> @@ -45,6 +45,10 @@ PREFERRED_PROVIDER_glibc-mtrace = "external-arm-toolchain"
>  PREFERRED_PROVIDER_libc-mtrace = "external-arm-toolchain"
>  PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-arm-toolchain"
>  
> +PREFERRED_PROVIDER_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> +PREFERRED_PROVIDER_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> +PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain-${TRANSLATED_TARGET_ARCH}"
> +
>  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
>  
>  DISTRO_FEATURES_LIBC = "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-crypt \
> diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> new file mode 100644
> index 0000000..3f12b4d
> --- /dev/null
> +++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-sdk-toolchain.bb
> @@ -0,0 +1,144 @@
> +inherit cross-canadian
> +
> +PN = "external-arm-sdk-toolchain-${TARGET_ARCH}"
> +BPN = "external-arm-sdk-toolchain"
> +PV = "${EAT_VER_MAIN}"
> +
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_DEFAULT_DEPS = "1"
> +EXCLUDE_FROM_SHLIBS = "1"
> +
> +EAT_LICENSE ??= ""
> +
> +LICENSE = "${EAT_LICENSE}"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +# Skip packaging QA checks for prebuilt binaries
> +INSANE_SKIP_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so staticdev file-rdeps libdir"
> +INSANE_SKIP_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> +INSANE_SKIP_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "dev-so file-rdeps"
> +
> +# Skip file dependencies in RPM for prebuilt binaries
> +SKIP_FILEDEPS = "1"
> +
> +PROVIDES = "\
> +	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +"
> +
> +PACKAGES = "\
> +	gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +	gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +	binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} \
> +"
> +
> +# Adjust defaults in line with external toolchain
> +bindir = "${exec_prefix}/bin"
> +libdir = "${exec_prefix}/lib"
> +libexecdir = "${exec_prefix}/libexec"
> +datadir = "${exec_prefix}/share"
> +gcclibdir = "${libdir}/gcc"
> +
> +FILES_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> +	${prefix}/${EAT_TARGET_SYS}/lib/libstdc++.* \
> +	${prefix}/${EAT_TARGET_SYS}/lib/libgcc_s.* \
> +	${prefix}/${EAT_TARGET_SYS}/lib/libsupc++.* \
> +	${prefix}/${EAT_TARGET_SYS}/include \
> +	${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* \
> +	${bindir}/${TARGET_PREFIX}gcov \
> +	${bindir}/${TARGET_PREFIX}gcc* \
> +	${bindir}/${TARGET_PREFIX}g++ \
> +	${bindir}/${TARGET_PREFIX}cpp \
> +	${libexecdir}/* \
> +"
> +
> +FILES_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> +	${bindir}/${TARGET_PREFIX}gdb* \
> +	${datadir}/gdb/* \
> +"
> +
> +FILES_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "\
> +	${prefix}/${EAT_TARGET_SYS}/bin/ld* \
> +	${prefix}/${EAT_TARGET_SYS}/bin/objcopy \
> +	${prefix}/${EAT_TARGET_SYS}/bin/strip \
> +	${prefix}/${EAT_TARGET_SYS}/bin/nm \
> +	${prefix}/${EAT_TARGET_SYS}/bin/ranlib \
> +	${prefix}/${EAT_TARGET_SYS}/bin/as \
> +	${prefix}/${EAT_TARGET_SYS}/bin/ar \
> +	${prefix}/${EAT_TARGET_SYS}/bin/objdump \
> +	${prefix}/${EAT_TARGET_SYS}/lib/ldscripts/* \
> +	${bindir}/${TARGET_PREFIX}ld* \
> +	${bindir}/${TARGET_PREFIX}addr2line \
> +	${bindir}/${TARGET_PREFIX}objcopy \
> +	${bindir}/${TARGET_PREFIX}readelf \
> +	${bindir}/${TARGET_PREFIX}strip \
> +	${bindir}/${TARGET_PREFIX}nm \
> +	${bindir}/${TARGET_PREFIX}ranlib \
> +	${bindir}/${TARGET_PREFIX}gprof \
> +	${bindir}/${TARGET_PREFIX}as \
> +	${bindir}/${TARGET_PREFIX}c++filt \
> +	${bindir}/${TARGET_PREFIX}ar \
> +	${bindir}/${TARGET_PREFIX}strings \
> +	${bindir}/${TARGET_PREFIX}objdump \
> +	${bindir}/${TARGET_PREFIX}size \
> +"
> +
> +DESCRIPTION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "The GNU cc and gcc C compilers"
> +DESCRIPTION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "gdb - GNU debugger"
> +DESCRIPTION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "A GNU collection of binary utilities"
> +
> +LICENSE_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GCC_LICENSE}"
> +LICENSE_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_GDB_LICENSE}"
> +LICENSE_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_BFD_LICENSE}"
> +
> +PKGV_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GCC}"
> +PKGV_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_GDB}"
> +PKGV_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "${EAT_VER_BFD}"
> +
> +do_install() {
> +	install -d ${D}${prefix}/${EAT_TARGET_SYS}/bin
> +	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib
> +	install -d ${D}${prefix}/${EAT_TARGET_SYS}/include
> +	install -d ${D}${bindir}
> +	install -d ${D}${libdir}
> +	install -d ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> +	install -d ${D}${libexecdir}
> +	install -d ${D}${datadir}/gdb
> +	install -d ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}/include
> +
> +	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +
> +	# gcc
> +	for i in libstdc++.* libgcc_s.* libsupc++.*; do
> +		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/${EAT_LIBDIR}/$i ${D}${prefix}/${EAT_TARGET_SYS}/lib
> +	done
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/include/* ${D}${prefix}/${EAT_TARGET_SYS}/include
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/lib/gcc/${EAT_TARGET_SYS}/${EAT_VER_GCC}/* ${D}${gcclibdir}/${EAT_TARGET_SYS}/${EAT_VER_GCC}
> +	for i in gcov gcc* g++ cpp; do
> +		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> +	done
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/libexec/* ${D}${libexecdir}
> +
> +	# gdb
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}gdb* ${D}${bindir}
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/share/gdb/* ${D}${datadir}/gdb/
> +
> +	# binutils
> +	for i in ld* objcopy strip nm ranlib as ar objdump; do
> +		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/bin/$i ${D}${prefix}/${EAT_TARGET_SYS}/bin
> +	done
> +	cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}/lib/ldscripts/* ${D}${prefix}/${EAT_TARGET_SYS}/lib/ldscripts
> +	for i in ld* addr2line objcopy readelf strip nm ranlib gprof as c++filt ar strings objdump size; do
> +		cp ${CP_ARGS} ${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}$i ${D}${bindir}
> +	done
> +}
> +
> +python () {
> +    if not d.getVar("EAT_VER_MAIN", False):
> +        raise bb.parse.SkipPackage("External ARM toolchain not configured (EAT_VER_MAIN not set).")
> +    if d.getVar('TCLIBC', True) != "glibc":
> +        raise bb.parse.SkipPackage("incompatible with %s" % d.getVar('TCLIBC', True))
> +}
> -- 
> 2.7.4
> 

> 
> 
> 

