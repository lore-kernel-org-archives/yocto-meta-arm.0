Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.2884.1607977783284233124
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Dec 2020 12:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=IbnEje41;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id a6so12890451qtw.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Dec 2020 12:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V88qMlazaW0v6uDWo8KbLCcmv4QbdkmBjecKIdRopfA=;
        b=IbnEje41Ns2ZzCm/2fbpx5kMhthkhVCLmJKH5pYiKgOh6PpWEkBdq1ZaAbYtroJ8rE
         qlgFo1HRtPR6h3dZ61IV7WGJBsTjc6HzJ6SRDW1k4TFhWJSyCRz3FCESKmc1LF9KkwHW
         /Hss9WdJGGIE3r33HDWFVzVKrEnYfNmObGN8tpoCU9WI4d9tW0j859asfQdL3jJpV55W
         TgK+57gW2kfJhh4yMqOUfKqqh2zj1uGZFNLB3e+dQTjewDzie0/mgGTtqT5RekuMJJqB
         ru547JlGvmCsZsX9V2gBIK0R/A7FzgB57Oeel6TzoqY3dHbgmX0UQqzoIiPOglgG6uUh
         Iw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V88qMlazaW0v6uDWo8KbLCcmv4QbdkmBjecKIdRopfA=;
        b=naC9IjdEmreFfWfVnaeksNNGLhFwI3JouKZvE6LY49Sfuc6LZ4eWDfwEhSdtk/2UER
         8pu98v4IAtSf3EewOpGihWEws3qpfcoobVs0ecd/fj4YO90xKS3M17FSeqhfXPpE18px
         Oaqdd4bLaPrxcTNbCIH0QtfQH6zJoajCA/yYR8uKmROdxzDoHurCmnQ93cCa/pFbwGah
         T8wmWcrLs/ZOzhWKIlJRB8m//dGtmSLtW626I/gzcGQ83VcE6MHGb6OajLKOfx5/Urj+
         A/OMvZXxbKYafAqnRa6FRNYH4cKEFwKbs/KcZCTRMFx8N9eIqb8jG2TcL8eB1TKPDgnz
         j97g==
X-Gm-Message-State: AOAM533a8XqhUlvrZqSyorj3Q8UMy1n5ruEnhQ/hcgiAPD0kzeD90/Mn
	EslHFxj3TkK6C3A0mEJCtDBZQpOsNWa7kA==
X-Google-Smtp-Source: ABdhPJwPw0W6ugxgIlcRD6K/BDxWvGy9KYouAU3xtKdchPUoGEu8O6D5AWINzos/tqKR6rgRrM/cVg==
X-Received: by 2002:a05:622a:d:: with SMTP id x13mr34134349qtw.374.1607977782363;
        Mon, 14 Dec 2020 12:29:42 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id x130sm13234163qkb.78.2020.12.14.12.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:29:41 -0800 (PST)
Date: Mon, 14 Dec 2020 15:29:40 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Brett Warren <brett.warren@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH 1/2] arm-bsp/trusted-firmware-a: enable explicit linking to runtime builtin
Message-ID: <20201214202939.GB32195@kudzu.us>
References: <20201213155741.11452-1-brett.warren@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201213155741.11452-1-brett.warren@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 13, 2020 at 03:57:40PM +0000, Brett Warren wrote:
> When compiling under clang for aarch32, linking fails because
> the compiler-rt builtins aren't implicitly linked. Recipes and
> patches have been modified and added to explicitly pass the runtime
> builtin when linking files.
> 
> Change-Id: I4299b7d078d77c1fdd5576ceec1491f91e73c35d
> Signed-off-by: Brett Warren <brett.warren@arm.com>

This isn't working.  See below

> ---
>  ...compiler-rt-builtins-when-32-bit-2-2.patch | 54 +++++++++++++++++++
>  ...compiler-rt-builtins-when-32-bit-2-3.patch | 52 ++++++++++++++++++
>  .../trusted-firmware-a/trusted-firmware-a.inc |  5 ++
>  .../trusted-firmware-a_2.2.bb                 |  4 ++
>  .../trusted-firmware-a_2.3.bb                 |  4 ++
>  5 files changed, 119 insertions(+)
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.2/0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.3/0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.2/0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.2/0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch
> new file mode 100644
> index 0000000..16bfcf1
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.2/0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch
> @@ -0,0 +1,54 @@
> +From f2855c0957ded1af279724c1a82c3e381cc036f9 Mon Sep 17 00:00:00 2001
> +From: Brett Warren <brett.warren@arm.com>
> +Date: Fri, 27 Nov 2020 10:12:07 +0000
> +Subject: [PATCH 3/3] make: link compiler-rt builtins when 32-bit
> +
> +Compiler-rt builtins weren't previously linked when using
> +GNU ld to link for aarch32; this is now explicitly linked
> +in.
> +
> +For use with TFA 2.2
> +
> +Upstream-Status: Pending
> +Signed-off-by: Brett Warren <brett.warren@arm.com>
> +---
> + Makefile                     | 9 +++++++++
> + make_helpers/build_macros.mk | 2 +-
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 721246d51..5bf8e9a11 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -204,6 +204,15 @@ LD			=	$(LINKER)
> + AS			=	$(CC) -c -x assembler-with-cpp $(TF_CFLAGS_$(ARCH))
> + CPP			=	$(CC) -E
> + PP			=	$(CC) -E
> ++
> ++ifeq (${ARCH},aarch32)
> ++RUNTIME_LIB             =       $(shell $(CC) --sysroot=$(RUNTIME_SYSROOT) \
> ++                                              $(shell sed 's/none/linux/' <<< '$(target32-directive)') \
> ++                                              -mfloat-abi=$(TARGET_FPU) \
> ++                                              -rtlib=compiler-rt \
> ++                                              -print-libgcc-file-name 2> /dev/null)
> ++endif
> ++
> + else
> + TF_CFLAGS_aarch32	=	$(march32-directive)
> + TF_CFLAGS_aarch64	=	$(march64-directive)
> +diff --git a/make_helpers/build_macros.mk b/make_helpers/build_macros.mk
> +index b89d87ea6..1ff345336 100644
> +--- a/make_helpers/build_macros.mk
> ++++ b/make_helpers/build_macros.mk
> +@@ -436,7 +436,7 @@ ifneq ($(findstring armlink,$(notdir $(LD))),)
> + else
> + 	$$(Q)$$(LD) -o $$@ $$(TF_LDFLAGS) $$(LDFLAGS) -Map=$(MAPFILE) \
> + 		--script $(LINKERFILE) $(BUILD_DIR)/build_message.o \
> +-		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS)
> ++		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS) $(RUNTIME_LIB)
> + endif
> + ifeq ($(DISABLE_BIN_GENERATION),1)
> + 	@${ECHO_BLANK_LINE}
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.3/0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.3/0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch
> new file mode 100644
> index 0000000..1c01865
> --- /dev/null
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-2.3/0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch
> @@ -0,0 +1,52 @@
> +From 39d139a56c54856a718218e30114f732188832ea Mon Sep 17 00:00:00 2001
> +From: Brett Warren <brett.warren@arm.com>
> +Date: Fri, 27 Nov 2020 14:41:43 +0000
> +Subject: [PATCH] make: link compiler-rt builtins when 32-bit
> +
> +Compiler-rt builtins weren't previously linked when using
> +GNU ld to link for aarch32; this is now explicitly linked
> +in.
> +
> +For use with TFA 2.3
> +
> +Upstream-Status: Pending
> +Signed-off-by: Brett Warren <brett.warren@arm.com>
> +---
> + Makefile                     | 7 +++++++
> + make_helpers/build_macros.mk | 2 +-
> + 2 files changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index f01a9ae3e..493b80b14 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -243,6 +243,13 @@ endif
> + AS			=	$(CC) -c -x assembler-with-cpp $(TF_CFLAGS_$(ARCH))
> + CPP			=	$(CC) -E
> + PP			=	$(CC) -E
> ++ifeq (${ARCH},aarch32)
> ++RUNTIME_LIB             =       $(shell $(CC) --sysroot=$(RUNTIME_SYSROOT) \
> ++                                              $(shell sed 's/none/linux/' <<< '$(target32-directive)') \
> ++                                              -mfloat-abi=$(TARGET_FPU) \
> ++                                              -rtlib=compiler-rt \
> ++                                              -print-libgcc-file-name 2> /dev/null)
> ++endif
> + else ifneq ($(findstring gcc,$(notdir $(CC))),)
> + TF_CFLAGS_aarch32	=	$(march32-directive)
> + TF_CFLAGS_aarch64	=	$(march64-directive)
> +diff --git a/make_helpers/build_macros.mk b/make_helpers/build_macros.mk
> +index 1c3d14d05..2a1abd4fe 100644
> +--- a/make_helpers/build_macros.mk
> ++++ b/make_helpers/build_macros.mk
> +@@ -482,7 +482,7 @@ ifneq ($(findstring armlink,$(notdir $(LD))),)
> + else ifneq ($(findstring gcc,$(notdir $(LD))),)
> + 	$$(Q)$$(LD) -o $$@ $$(TF_LDFLAGS) $$(LDFLAGS) -Wl,-Map=$(MAPFILE) \
> + 		-Wl,-T$(LINKERFILE) $(BUILD_DIR)/build_message.o \
> +-		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS)
> ++		$(OBJS) $(LDPATHS) $(LIBWRAPPER) $(LDLIBS) $(BL_LIBS) $(RUNTIME_LIB)
> + else
> + 	$$(Q)$$(LD) -o $$@ $$(TF_LDFLAGS) $$(LDFLAGS) $(BL_LDFLAGS) -Map=$(MAPFILE) \
> + 		--script $(LINKERFILE) $(BUILD_DIR)/build_message.o \
> +-- 
> +2.17.1
> +
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index d37c470..bed2bad 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -84,6 +84,7 @@ DEPENDS_remove = "virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
>  # We need openssl for fiptool
>  DEPENDS = "dtc-native openssl-native"
>  DEPENDS_append_aarch64_qemuall ?= " optee-os"
> +DEPENDS_append_toolchain-clang = " compiler-rt"
>  
>  # CC and LD introduce arguments which conflict with those otherwise provided by
>  # this recipe. The heads of these variables excluding those arguments
> @@ -121,6 +122,10 @@ EXTRA_OEMAKE += "${@bb.utils.contains('TFA_UBOOT', '1', 'BL33=${DEPLOY_DIR_IMAGE
>  # Tell the tools where the native OpenSSL is located
>  EXTRA_OEMAKE += "OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
>  
> +# Runtime variables
> +EXTRA_OEMAKE += "RUNTIME_SYSROOT=${STAGING_DIR_HOST}"
> +EXTRA_OEMAKE += "TARGET_FPU=${TARGET_FPU}"
> +
>  EXTRA_OEMAKE_append_aarch64_qemuall = " \
>      BL32=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-header_v2.bin \
>      BL32_EXTRA1=${STAGING_DIR_TARGET}${nonarch_base_libdir}/firmware/tee-pager_v2.bin \
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> index 4e8882c..0bc86cc 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bb
> @@ -19,6 +19,10 @@ LIC_FILES_CHKSUM += "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa8
>  
>  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.16"
>  
> +SRC_URI_append = " \
> +    file://0001-make-link-compiler-rt-builtins-when-32-bit-2-2.patch \
> +    "

This appears to need
FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"

Also, its weird in the same file to use "SRC_URI_append" and "SRC_URI +=".  For consistency, I think we should use "SRC_URI +=" here, since it was used above in the same file.


> +
>  # mbed TLS v2.16.2
>  SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
>  
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> index 745ee70..5f5839e 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -21,6 +21,10 @@ SRC_URI += "file://0001-fdts-a5ds-Fix-for-the-system-timer-issue.patch"
>  
>  SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.18"
>  
> +SRC_URI_append = " \
> +    file://0001-make-link-compiler-rt-builtins-when-32-bit-2-3.patch \
> +    "

Exact same problems in this file.

Thanks,
Jon

>  # mbed TLS v2.18.1
>  SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
>  
> -- 
> 2.17.1
> 

> 
> 
> 

