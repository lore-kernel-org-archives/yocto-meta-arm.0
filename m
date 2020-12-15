Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web08.12302.1608042135643749538
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 06:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=p7zMvSWQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f194.google.com with SMTP id d14so18476469qkc.13
        for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 06:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DKAyRgdRo5hel9l9puU0F0mkck+97zItyxIws1caSL0=;
        b=p7zMvSWQaAQxq7SWoFZ1oJTzwxK/iXWgKKXp5vuIppJfM8vUD8j+AdxIur6X9NMarw
         yQvF2azY27vako+/1rHJV72+R3xKSxiiYD5d54CYmRMtQZ/lTN68HsmTKAZqYIXXGt/y
         qDvM3dlxhOKdkGnRy2NCs9UCcaevkA462opfQuhnS184W6k5tTr/cheM4b289SCyaOJZ
         ePnlpUzRC9hx1nGjEw6mqZfzQdXIacd0UMkNfr/L994UfzpJNoMYxuzX9Aq6KeYnKjXu
         yR5nu1hW/i94S3j8pM4LgEJVwev54XODpmhLJAqDzkWL2SZRd89mF22l7tKhtCMIEs60
         LMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DKAyRgdRo5hel9l9puU0F0mkck+97zItyxIws1caSL0=;
        b=krc4QFgEILMksAzffdKevgKz6b+wLsQgQ+5I8vIisL+lxR7yBYCLZs6HZasQXQJFKt
         w6Y332mtd0wQ9fDJXKzBUmM+a3ZpDpoa8nueCm/64omNYepsDppuFESQaZYd5c0DKtoa
         5wbVdxHiv1Eca7fIvjQQxqg8L2QLrHERp5AbgT9TX2BC5op+tkdbljjL+TY00CwGDDNM
         hPj1XXDyGNCUC+8Lqw6zn3+FRV2o5PP2VsbZmEEofJeyP7oGv0NsOUZdBoTEq8PpCQwH
         6U3j1q02dzm2WT7pbygJwGtP3p3K2OTdgYaHhwCsS0zVlgmA5USzHKfbLpvaQnSvFlCI
         VqOw==
X-Gm-Message-State: AOAM530fhK7V/H9AVgS8vNJx5c2LQ8f+giXxb+XzeMdzJKaraijJCtaO
	D/uAd7j/obI9YAN3lpdLmigTrQ==
X-Google-Smtp-Source: ABdhPJwZOwS0DnE8R0cE2kKCcoZFqYptQiWB1cSr/i2fN6DKrVEIwS9IUoHz4DtGfuR3sqSoSoJbgw==
X-Received: by 2002:a05:620a:4047:: with SMTP id i7mr38468850qko.3.1608042134533;
        Tue, 15 Dec 2020 06:22:14 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:4438:99f1:e83e:f284])
        by smtp.gmail.com with ESMTPSA id c7sm15618036qtw.70.2020.12.15.06.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:22:14 -0800 (PST)
Date: Tue, 15 Dec 2020 09:22:12 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org, peter.griffin@linaro.org
Subject: Re: [meta-arm] [PATCH] arm/op-tee: remove old 3.8.0
Message-ID: <20201215142212.GD20024@kudzu.us>
References: <20201215092154.2750809-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201215092154.2750809-1-ross.burton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 09:21:54AM +0000, Ross Burton wrote:
> Change-Id: I8da09673c02f3a046e4291f7eb01cdb66117450f
> Signed-off-by: Ross Burton <ross.burton@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../optee/optee-client_3.8.0.bb               |   3 -
>  .../optee/optee-examples_3.8.0.bb             |   3 -
>  ...01-mk-compile.mk-fix-cc-option-macro.patch |  59 -------
>  ...of-cc-option-in-core-arch-arm-arm.mk.patch | 158 ------------------
>  ...sable-outline-atomics-when-compiling.patch |  46 -----
>  ...omp-cflags-sm-from-libgcc-lookup-com.patch |  59 -------
>  ...of-cc-option-in-core-arch-arm-arm.mk.patch |  33 ----
>  ...-sysroot-for-libgcc-lookup-for-3.8.0.patch |  25 ---
>  .../optee/optee-os/missing-mkdir.patch        |  31 ----
>  .../recipes-security/optee/optee-os_3.8.0.bb  |  13 --
>  .../optee/optee-test_3.8.0.bb                 |   3 -
>  11 files changed, 433 deletions(-)
>  delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.8.0.bb
>  delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os/0003-arm64-Disable-outline-atomics-when-compiling.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
>  delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.8.0.bb
>  delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> 
> diff --git a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> deleted file mode 100644
> index b1587bb..0000000
> --- a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require optee-client.inc
> -
> -SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
> diff --git a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> deleted file mode 100644
> index bd9b317..0000000
> --- a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require optee-examples.inc
> -
> -SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
> diff --git a/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch b/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch
> deleted file mode 100644
> index 52d8f9b..0000000
> --- a/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 1ec374238f537eb0e3024d0db45f1fe3b5d471cc Mon Sep 17 00:00:00 2001
> -From: Jerome Forissier <jerome@forissier.org>
> -Date: Wed, 20 May 2020 10:50:00 +0200
> -Subject: [PATCH 1/6] mk/compile.mk: fix cc-option macro
> -
> -There are (at least) three issues with the cc-option macro:
> -
> -1. When COMPILER=clang: when presented with a supported but unused
> -   option, Clang emits a warning to stderr (and returns a success code
> -   of 0). Therefore it is incorrect to check stderr to determine if an
> -   option is supported or not; we should rely on the return status
> -   instead.
> -2. When COMPILER=clang, the compile command $(CC$(sm)) contains an
> -   equal sign (e.g., clang --target=arm-linux-gnueabihf). This is not
> -   expected in the cc-option macro, currently only flags are allowed to
> -   potentially contain an equal sign. This messes with the caching of
> -   the test result.
> -3. The macro should not cache the return value when an option is not
> -   supported. For instance, if we have:
> -     A := $(call cc-option,--not-supported,a)
> -     B := $(call cc-option,--not-supported,b)
> -   ...we expect A to be "a" and B to be "b". The current implementation
> -   returns "a" in both cases.
> -
> -This commit fixes the above problems.
> -
> -Fixes: 989ac108b0ef ("mk/compile.mk: add cc-option macro")
> -Signed-off-by: Jerome Forissier <jerome@forissier.org>
> -Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ----
> - mk/compile.mk | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/mk/compile.mk b/mk/compile.mk
> -index ddeb408f..9868ddd1 100644
> ---- a/mk/compile.mk
> -+++ b/mk/compile.mk
> -@@ -17,12 +17,12 @@ objs		:=
> - # Disable all builtin rules
> - .SUFFIXES:
> - 
> --__cc-option = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>&1 >/dev/null),$(2),$(1))
> --_cc-opt-cached-var-name = cached-cc-option$(subst =,~,$(strip $(1)))$(subst $(empty) $(empty),,$(CC$(sm)))
> -+_cc-option-supported = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>/dev/null >/dev/null || echo "Not supported"),,1)
> -+_cc-opt-cached-var-name = $(subst =,~,$(strip cached-cc-option-$(1)-$(subst $(empty) $(empty),,$(CC$(sm)))))
> - define _cc-option
> --$(eval _cached := $(call _cc-opt-cached-var-name,$1))
> --$(eval $(_cached) := $(if $(filter $(origin $(_cached)),undefined),$(call __cc-option,$(1),$(2)),$($(_cached))))
> --$($(_cached))
> -+$(eval _var_name := $(call _cc-opt-cached-var-name,$1))
> -+$(eval $(_var_name) := $(if $(filter $(origin $(_var_name)),undefined),$(call _cc-option-supported,$(1)),$($(_var_name))))
> -+$(if $($(_var_name)),$(1),$(2))
> - endef
> - cc-option = $(strip $(call _cc-option,$(1),$(2)))
> - 
> --- 
> -2.17.1
> -
> diff --git a/meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch b/meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
> deleted file mode 100644
> index 83cc52c..0000000
> --- a/meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
> +++ /dev/null
> @@ -1,158 +0,0 @@
> -From b45199897c1f956ca9da0f4e8d857a49787f5ff8 Mon Sep 17 00:00:00 2001
> -From: Jerome Forissier <jerome@forissier.org>
> -Date: Tue, 26 May 2020 15:21:00 +0200
> -Subject: [PATCH 2/6] Allow use of cc-option in core/arch/arm/arm.mk
> -
> -It can be useful to call the cc-option macro when setting flags in
> -core/arch/arm/arm.mk. Unfortunately cc-option is defined in
> -mk/compile.mk which is too late to be useful (core/arch/arm/arm.mk is
> -included by core/core.mk before mk/compile.mk).
> -
> -This commit addresses the issue by moving the definition of cc-option
> -to its own file, mk/cc-option.mk, which is then included by
> -core/arch/arm/arm.mk. There is a dependency on the compiler definitions
> -(mk/gcc.mk or mk/clang.mk) and on $(arch-bit-$(sm)) so
> -core/arch/arm/arm.mk is modified accordingly.
> -
> -Moving cc-option out of mk/compile.mk means that all non-core
> -submodules would lose the definition unless they include
> -mk/cc-option.mk; the TA dev kit is modified so that TAs can call
> -cc-option from within their sub.mk files. As for other submodules, they
> -are internal and do not use cc-options as of now so they are not
> -modified.
> -
> -Signed-off-by: Jerome Forissier <jerome@forissier.org>
> -Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ----
> - core/arch/arm/arm.mk | 14 ++++++++++++--
> - core/core.mk         |  4 ----
> - mk/cc-option.mk      |  9 +++++++++
> - mk/compile.mk        |  9 ---------
> - ta/mk/ta_dev_kit.mk  |  4 +++-
> - ta/ta.mk             |  1 +
> - 6 files changed, 25 insertions(+), 16 deletions(-)
> - create mode 100644 mk/cc-option.mk
> -
> -diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
> -index a18eda3b..ad036c91 100644
> ---- a/core/arch/arm/arm.mk
> -+++ b/core/arch/arm/arm.mk
> -@@ -1,3 +1,15 @@
> -+# Setup compiler for this sub module
> -+# Note this file is included only from core.mk (with $(sm) == core)
> -+ifeq ($(CFG_ARM64_core),y)
> -+arch-bits-core := 64
> -+else
> -+arch-bits-core := 32
> -+endif
> -+COMPILER_core		?= $(COMPILER)
> -+include mk/$(COMPILER_core).mk
> -+
> -+include mk/cc-option.mk
> -+
> - CFG_LTC_OPTEE_THREAD ?= y
> - # Size of emulated TrustZone protected SRAM, 448 kB.
> - # Only applicable when paging is enabled.
> -@@ -148,14 +160,12 @@ core-platform-cflags += -fpie
> - endif
> - 
> - ifeq ($(CFG_ARM64_core),y)
> --arch-bits-core := 64
> - core-platform-cppflags += $(arm64-platform-cppflags)
> - core-platform-cflags += $(arm64-platform-cflags)
> - core-platform-cflags += $(arm64-platform-cflags-generic)
> - core-platform-cflags += $(arm64-platform-cflags-no-hard-float)
> - core-platform-aflags += $(arm64-platform-aflags)
> - else
> --arch-bits-core := 32
> - core-platform-cppflags += $(arm32-platform-cppflags)
> - core-platform-cflags += $(arm32-platform-cflags)
> - core-platform-cflags += $(arm32-platform-cflags-no-hard-float)
> -diff --git a/core/core.mk b/core/core.mk
> -index 016f1489..1a330457 100644
> ---- a/core/core.mk
> -+++ b/core/core.mk
> -@@ -16,10 +16,6 @@ PLATFORM_FLAVOR_$(PLATFORM_FLAVOR) := y
> - $(eval $(call cfg-depends-all,CFG_PAGED_USER_TA,CFG_WITH_PAGER CFG_WITH_USER_TA))
> - include core/crypto.mk
> - 
> --# Setup compiler for this sub module
> --COMPILER_$(sm)		?= $(COMPILER)
> --include mk/$(COMPILER_$(sm)).mk
> --
> - cppflags$(sm)	+= -D__KERNEL__
> - 
> - cppflags$(sm)	+= -Icore/include
> -diff --git a/mk/cc-option.mk b/mk/cc-option.mk
> -new file mode 100644
> -index 00000000..72f9a6f3
> ---- /dev/null
> -+++ b/mk/cc-option.mk
> -@@ -0,0 +1,9 @@
> -+_cc-option-supported = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>/dev/null >/dev/null || echo "Not supported"),,1)
> -+_cc-opt-cached-var-name = $(subst =,~,$(strip cached-cc-option-$(1)-$(subst $(empty) $(empty),,$(CC$(sm)))))
> -+define _cc-option
> -+$(eval _var_name := $(call _cc-opt-cached-var-name,$1))
> -+$(eval $(_var_name) := $(if $(filter $(origin $(_var_name)),undefined),$(call _cc-option-supported,$(1)),$($(_var_name))))
> -+$(if $($(_var_name)),$(1),$(2))
> -+endef
> -+cc-option = $(strip $(call _cc-option,$(1),$(2)))
> -+
> -diff --git a/mk/compile.mk b/mk/compile.mk
> -index 9868ddd1..d2705025 100644
> ---- a/mk/compile.mk
> -+++ b/mk/compile.mk
> -@@ -17,15 +17,6 @@ objs		:=
> - # Disable all builtin rules
> - .SUFFIXES:
> - 
> --_cc-option-supported = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>/dev/null >/dev/null || echo "Not supported"),,1)
> --_cc-opt-cached-var-name = $(subst =,~,$(strip cached-cc-option-$(1)-$(subst $(empty) $(empty),,$(CC$(sm)))))
> --define _cc-option
> --$(eval _var_name := $(call _cc-opt-cached-var-name,$1))
> --$(eval $(_var_name) := $(if $(filter $(origin $(_var_name)),undefined),$(call _cc-option-supported,$(1)),$($(_var_name))))
> --$(if $($(_var_name)),$(1),$(2))
> --endef
> --cc-option = $(strip $(call _cc-option,$(1),$(2)))
> --
> - comp-cflags$(sm) = -std=gnu99
> - comp-aflags$(sm) =
> - comp-cppflags$(sm) =
> -diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
> -index 90c6a455..596a6961 100644
> ---- a/ta/mk/ta_dev_kit.mk
> -+++ b/ta/mk/ta_dev_kit.mk
> -@@ -93,6 +93,9 @@ clean:
> - 	@$(cmd-echo-silent) '  CLEAN   $(O)'
> - 	${q}if [ -d "$(O)" ]; then $(RMDIR) $(O); fi
> - 
> -+include  $(ta-dev-kit-dir$(sm))/mk/$(COMPILER_$(sm)).mk
> -+include  $(ta-dev-kit-dir$(sm))/mk/cc-option.mk
> -+
> - subdirs = .
> - include  $(ta-dev-kit-dir$(sm))/mk/subdir.mk
> - 
> -@@ -107,7 +110,6 @@ endif
> - endif
> - 
> - SCRIPTS_DIR := $(ta-dev-kit-dir)/scripts
> --include  $(ta-dev-kit-dir$(sm))/mk/$(COMPILER_$(sm)).mk
> - include  $(ta-dev-kit-dir$(sm))/mk/compile.mk
> - 
> - ifneq ($(user-ta-uuid),)
> -diff --git a/ta/ta.mk b/ta/ta.mk
> -index b961663a..75b7cfd9 100644
> ---- a/ta/ta.mk
> -+++ b/ta/ta.mk
> -@@ -157,6 +157,7 @@ $(foreach f, $(libfiles), \
> - 
> - # Copy .mk files
> - ta-mkfiles = mk/compile.mk mk/subdir.mk mk/gcc.mk mk/clang.mk mk/cleandirs.mk \
> -+	mk/cc-option.mk \
> - 	ta/arch/$(ARCH)/link.mk ta/arch/$(ARCH)/link_shlib.mk \
> - 	ta/mk/ta_dev_kit.mk
> - 
> --- 
> -2.17.1
> -
> diff --git a/meta-arm/recipes-security/optee/optee-os/0003-arm64-Disable-outline-atomics-when-compiling.patch b/meta-arm/recipes-security/optee/optee-os/0003-arm64-Disable-outline-atomics-when-compiling.patch
> deleted file mode 100644
> index 71a7e91..0000000
> --- a/meta-arm/recipes-security/optee/optee-os/0003-arm64-Disable-outline-atomics-when-compiling.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 821cf4e6bd2764ebab8d413eeb1c3dbf673aeb78 Mon Sep 17 00:00:00 2001
> -From: Joshua Watt <JPEWhacker@gmail.com>
> -Date: Mon, 18 May 2020 20:00:00 -0500
> -Subject: [PATCH 3/6] arm64: Disable outline-atomics when compiling
> -
> -Disables the automatic detection of LSE (Large System Extension)
> -instructions when compiling AArch64 code. GCC 10 implements this
> -detection in libgcc using __getauxval(), which OP-TEE does not
> -implement.
> -This requires that the proper -mcpu is passed to GCC so that the code
> -can be correctly compiled to use either LSE or load-store-exclusive.
> -
> -Fixes linker errors like the following when compiling with GCC 10:
> -
> - aarch64-linux-ld.bfd: libgcc.a(lse-init.o):
> -    in function `init_have_lse_atomics':
> - lse-init.c:44: undefined reference to `__getauxval'
> - core/arch/arm/kernel/link.mk:38:
> -    recipe for target 'build/core/all_objs.o' failed
> -
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> -[jf: s/optee doesn't/OP-TEE does not/, replace ?= by := for immediate
> - evaluation]
> -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> -Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ----
> - core/arch/arm/arm.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
> -index ad036c91..d8dd5206 100644
> ---- a/core/arch/arm/arm.mk
> -+++ b/core/arch/arm/arm.mk
> -@@ -127,7 +127,7 @@ arm32-platform-aflags-no-hard-float ?=
> - 
> - arm64-platform-cflags-no-hard-float ?= -mgeneral-regs-only
> - arm64-platform-cflags-hard-float ?=
> --arm64-platform-cflags-generic ?= -mstrict-align
> -+arm64-platform-cflags-generic := -mstrict-align $(call cc-option,-mno-outline-atomics,)
> - 
> - ifeq ($(DEBUG),1)
> - # For backwards compatibility
> --- 
> -2.17.1
> -
> diff --git a/meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch b/meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch
> deleted file mode 100644
> index 95fd549..0000000
> --- a/meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From a5dbec871f2acf01b5701a646584ad55d0ac1db7 Mon Sep 17 00:00:00 2001
> -From: Jerome Forissier <jerome@forissier.org>
> -Date: Tue, 26 May 2020 11:35:32 +0200
> -Subject: [PATCH 4/6] Cleanup unused comp-cflags$(sm) from libgcc lookup
> - commands
> -
> -The compiler is not expected to need any flag from $(comp-cflags$(sm))
> -to locate the compiler runtime libraries, and in fact this variable is
> -always undefined at the point it is used. Indeed, comp-cflags$(sm) is
> -set in mk/compile.mk, i.e., after mk/gcc.mk (or mk/clang.mk) has
> -been included.
> -
> -Therefore, remove the useless flags.
> -
> -Signed-off-by: Jerome Forissier <jerome@forissier.org>
> -Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ----
> - mk/clang.mk | 10 +++++++++-
> - mk/gcc.mk   |  2 +-
> - 2 files changed, 10 insertions(+), 2 deletions(-)
> -
> -diff --git a/mk/clang.mk b/mk/clang.mk
> -index 28367e73..34034a9c 100644
> ---- a/mk/clang.mk
> -+++ b/mk/clang.mk
> -@@ -45,7 +45,15 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
> - comp-cflags-warns-clang := -Wno-language-extension-token \
> - 			 -Wno-gnu-zero-variadic-macro-arguments
> - 
> --libgcc$(sm)  	:=
> -+# Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
> -+# libgcc for clang
> -+libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
> -+			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
> -+
> -+# Core ASLR relies on the executable being ready to run from its preferred load
> -+# address, because some symbols are used before the MMU is enabled and the
> -+# relocations are applied.
> -+ldflag-apply-dynamic-relocs := --apply-dynamic-relocs
> - 
> - # Define these to something to discover accidental use
> - CC		:= false
> -diff --git a/mk/gcc.mk b/mk/gcc.mk
> -index 1f2c5990..c53a23b1 100644
> ---- a/mk/gcc.mk
> -+++ b/mk/gcc.mk
> -@@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
> - 			-print-file-name=include 2> /dev/null)
> - 
> - # Get location of libgcc from gcc
> --libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) $(comp-cflags$(sm)) \
> -+libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
> - 			-print-libgcc-file-name 2> /dev/null)
> - 
> - # Define these to something to discover accidental use
> --- 
> -2.17.1
> -
> diff --git a/meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch b/meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
> deleted file mode 100644
> index 7c68cfd..0000000
> --- a/meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 2fd7b1f22d2e03dac423adace92ab2214305b4ac Mon Sep 17 00:00:00 2001
> -From: Jerome Forissier <jerome@forissier.org>
> -Date: Tue, 26 May 2020 18:16:16 +0200
> -Subject: [PATCH 5/6] [Fixup] Allow use of cc-option in core/arch/arm/arm.mk
> -
> -Fix a build error, let's see if Shippable is happy with this, I
> -still do not understand why these lines are needed.
> -
> -Signed-off-by: Jerome Forissier <jerome@forissier.org>
> -Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
> -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ----
> - core/core.mk | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/core/core.mk b/core/core.mk
> -index 1a330457..d6af1d51 100644
> ---- a/core/core.mk
> -+++ b/core/core.mk
> -@@ -16,6 +16,10 @@ PLATFORM_FLAVOR_$(PLATFORM_FLAVOR) := y
> - $(eval $(call cfg-depends-all,CFG_PAGED_USER_TA,CFG_WITH_PAGER CFG_WITH_USER_TA))
> - include core/crypto.mk
> - 
> -+# Setup compiler for this sub module
> -+COMPILER_$(sm)         ?= $(COMPILER)
> -+include mk/$(COMPILER_$(sm)).mk
> -+
> - cppflags$(sm)	+= -D__KERNEL__
> - 
> - cppflags$(sm)	+= -Icore/include
> --- 
> -2.17.1
> -
> diff --git a/meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch b/meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
> deleted file mode 100644
> index d911d80..0000000
> --- a/meta-arm/recipes-security/optee/optee-os/allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 030cd84cf0df1c27355ec02e0226317684897a97 Mon Sep 17 00:00:00 2001
> -From: Joshua Watt <JPEWhacker@gmail.com>
> -Date: Tue, 26 May 2020 14:38:02 -0500
> -Subject: [PATCH 6/6] allow setting sysroot for libgcc lookup
> -
> ----
> - mk/gcc.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/mk/gcc.mk b/mk/gcc.mk
> -index c53a23b1..330b200a 100644
> ---- a/mk/gcc.mk
> -+++ b/mk/gcc.mk
> -@@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
> - 			-print-file-name=include 2> /dev/null)
> - 
> - # Get location of libgcc from gcc
> --libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
> -+libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
> - 			-print-libgcc-file-name 2> /dev/null)
> - 
> - # Define these to something to discover accidental use
> --- 
> -2.17.1
> -
> diff --git a/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch b/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
> deleted file mode 100644
> index db1b47f..0000000
> --- a/meta-arm/recipes-security/optee/optee-os/missing-mkdir.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/4000]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From 79384a244d1972cdb02114f5cde6fcaf2e014c9b Mon Sep 17 00:00:00 2001
> -From: Jerome Forissier <jerome@forissier.org>
> -Date: Tue, 28 Jul 2020 17:28:43 +0200
> -Subject: [PATCH] build: fix race when generating conf.mk
> -
> -This patch fixes the following error triggered by a heavily parallel build:
> -
> - echo sm := ta_arm64 > .../export-ta_arm64/mk/conf.mk.tmp
> - /bin/bash: .../export-ta_arm64/mk/conf.mk.tmp: No such file or directory
> -
> -Fixes: https://github.com/OP-TEE/optee_os/issues/3999
> -Signed-off-by: Jerome Forissier <jerome@forissier.org>
> ----
> - ta/ta.mk | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/ta/ta.mk b/ta/ta.mk
> -index 59ed87f71d..ad97edaf08 100644
> ---- a/ta/ta.mk
> -+++ b/ta/ta.mk
> -@@ -190,6 +190,7 @@ define mk-file-export
> - .PHONY: $(conf-mk-file-export)
> - $(conf-mk-file-export):
> - 	@$$(cmd-echo-silent) '  CHK    ' $$@
> -+	$(q)mkdir -p $$(dir $$@)
> - 	$(q)echo sm := $$(sm-$(conf-mk-file-export)) > $$@.tmp
> - 	$(q)echo sm-$$(sm-$(conf-mk-file-export)) := y >> $$@.tmp
> - 	$(q)($$(foreach v, $$(ta-mk-file-export-vars-$$(sm-$(conf-mk-file-export))), \
> diff --git a/meta-arm/recipes-security/optee/optee-os_3.8.0.bb b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> deleted file mode 100644
> index 7e0fad5..0000000
> --- a/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require optee-os.inc
> -
> -SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
> -
> -SRC_URI_append = " \
> -    file://0001-mk-compile.mk-fix-cc-option-macro.patch \
> -    file://0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
> -    file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
> -    file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
> -    file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
> -    file://allow-setting-sysroot-for-libgcc-lookup-for-3.8.0.patch\
> -    file://missing-mkdir.patch \
> -"
> diff --git a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> deleted file mode 100644
> index 8ea3348..0000000
> --- a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -require optee-test.inc
> -
> -SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
> -- 
> 2.25.1
> 

> 
> 
> 

