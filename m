Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.37249.1590766353419666955
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 May 2020 08:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XB5AEmI1;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id k18so2848037ion.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 29 May 2020 08:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=n6ICTGHe90dg9BTBQMXUyI1rRodASuDMzas2OcuRyrw=;
        b=XB5AEmI1GjEC9UyQc7vKW1QslcEScma7RvkgATrCbxScgLjQ+YbJ5Tt+W2knFeCeIy
         7/lC0CkgfE57ze9i6ADeLeR5MnrrL8pLkyp7VCgXir6ltaMk+iFTn88QbZOfL1JaEoaz
         Cc5rrYHUsi2UDHfsbhd2enoRfwveSW7P9DP2gUvwOtuBwLgzeVNn4wnzgXJW/+fpDxaf
         hjuEXVaW/NBl388ez4XnPErODjdRBZoMhQMSyZHCCOExjgEoAgfXE+kkc3makuV9+k/F
         xdWFubZ05nk5NuGOXpNhWUAIJLm6qVUcJ86rvHfC2/yGD4jOUaIOLLd+BWTaerEeSCG1
         NHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n6ICTGHe90dg9BTBQMXUyI1rRodASuDMzas2OcuRyrw=;
        b=k4ffs+2Ci1v2AwlMV2tTbX1Aa/nUP3bDCWpwKOKd0v5zG10Q1wx9/ZCnV9/G5+ZRgZ
         gpaM7VGE6gwr0jZdQ+LQr2QioM6u5CmEo953mvM8A9AYFIaEpluH8zw5O3yKmHatu+b2
         z18A1fmjB2pdDrdSI3Yv4hC3W9SrVj7HsJMswIrerhSJzjCeRN1/RsB8W9qoPBOLWc8R
         o6zqnp7bsy2yiynYGk4e/hO4DqL7yty7FPMXbyKEFxoBMij8ETxudx/tZoFrw7bnHqNl
         1EpqrldV+wMgXcxQ8uV/ag48DPgkGpF2eg5+Dy13/2NRQCJwRXtxJ7x/GuBzCAmcPP3q
         FdEA==
X-Gm-Message-State: AOAM532M42Qt+Lp+0oyd++mXENxr57qCu344EtuCDXA/cauaoRQkn/PT
	MXvK4mA8kmXfFXMH13IHybOUxRxSDP8=
X-Google-Smtp-Source: ABdhPJxIL3el1NIFDTK1qyQSdvfU28f5dOaiViOVBfDhSv7yJW89iJ0yvLPHgUJqLkAUJ1xZrxEMnA==
X-Received: by 2002:a02:2581:: with SMTP id g123mr7405294jag.35.1590766351600;
        Fri, 29 May 2020 08:32:31 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:2495:669d:5b93:9222])
        by smtp.gmail.com with ESMTPSA id o15sm4913316ilg.46.2020.05.29.08.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 08:32:30 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH] optee-os: Refresh GCC 10 patches
Date: Fri, 29 May 2020 10:32:27 -0500
Message-Id: <20200529153227.24175-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

The original fix for compiling with GCC 10 had to be reverted because it
failed on older versions. Upstream resolved this and re-instituted the
fix, so backport that patch series

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...01-mk-compile.mk-fix-cc-option-macro.patch |  59 +++++++
 ...of-cc-option-in-core-arch-arm-arm.mk.patch | 158 ++++++++++++++++++
 ...able-outline-atomics-when-compiling.patch} |  19 ++-
 ...omp-cflags-sm-from-libgcc-lookup-com.patch |  59 +++++++
 ...of-cc-option-in-core-arch-arm-arm.mk.patch |  33 ++++
 ...w-setting-sysroot-for-libgcc-lookup.patch} |  18 +-
 .../recipes-security/optee/optee-os_git.bb    |   8 +-
 7 files changed, 342 insertions(+), 12 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
 rename meta-arm/recipes-security/optee/optee-os/{0001-arm64-Disable-outline-atomics-when-compiling.patch => 0003-arm64-Disable-outline-atomics-when-compiling.patch} (64%)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
 rename meta-arm/recipes-security/optee/optee-os/{0001-allow-setting-sysroot-for-libgcc-lookup.patch => 0006-allow-setting-sysroot-for-libgcc-lookup.patch} (55%)

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch b/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch
new file mode 100644
index 0000000..52d8f9b
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-fix-cc-option-macro.patch
@@ -0,0 +1,59 @@
+From 1ec374238f537eb0e3024d0db45f1fe3b5d471cc Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome@forissier.org>
+Date: Wed, 20 May 2020 10:50:00 +0200
+Subject: [PATCH 1/6] mk/compile.mk: fix cc-option macro
+
+There are (at least) three issues with the cc-option macro:
+
+1. When COMPILER=clang: when presented with a supported but unused
+   option, Clang emits a warning to stderr (and returns a success code
+   of 0). Therefore it is incorrect to check stderr to determine if an
+   option is supported or not; we should rely on the return status
+   instead.
+2. When COMPILER=clang, the compile command $(CC$(sm)) contains an
+   equal sign (e.g., clang --target=arm-linux-gnueabihf). This is not
+   expected in the cc-option macro, currently only flags are allowed to
+   potentially contain an equal sign. This messes with the caching of
+   the test result.
+3. The macro should not cache the return value when an option is not
+   supported. For instance, if we have:
+     A := $(call cc-option,--not-supported,a)
+     B := $(call cc-option,--not-supported,b)
+   ...we expect A to be "a" and B to be "b". The current implementation
+   returns "a" in both cases.
+
+This commit fixes the above problems.
+
+Fixes: 989ac108b0ef ("mk/compile.mk: add cc-option macro")
+Signed-off-by: Jerome Forissier <jerome@forissier.org>
+Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ mk/compile.mk | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/mk/compile.mk b/mk/compile.mk
+index ddeb408f..9868ddd1 100644
+--- a/mk/compile.mk
++++ b/mk/compile.mk
+@@ -17,12 +17,12 @@ objs		:=
+ # Disable all builtin rules
+ .SUFFIXES:
+ 
+-__cc-option = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>&1 >/dev/null),$(2),$(1))
+-_cc-opt-cached-var-name = cached-cc-option$(subst =,~,$(strip $(1)))$(subst $(empty) $(empty),,$(CC$(sm)))
++_cc-option-supported = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>/dev/null >/dev/null || echo "Not supported"),,1)
++_cc-opt-cached-var-name = $(subst =,~,$(strip cached-cc-option-$(1)-$(subst $(empty) $(empty),,$(CC$(sm)))))
+ define _cc-option
+-$(eval _cached := $(call _cc-opt-cached-var-name,$1))
+-$(eval $(_cached) := $(if $(filter $(origin $(_cached)),undefined),$(call __cc-option,$(1),$(2)),$($(_cached))))
+-$($(_cached))
++$(eval _var_name := $(call _cc-opt-cached-var-name,$1))
++$(eval $(_var_name) := $(if $(filter $(origin $(_var_name)),undefined),$(call _cc-option-supported,$(1)),$($(_var_name))))
++$(if $($(_var_name)),$(1),$(2))
+ endef
+ cc-option = $(strip $(call _cc-option,$(1),$(2)))
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch b/meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
new file mode 100644
index 0000000..83cc52c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
@@ -0,0 +1,158 @@
+From b45199897c1f956ca9da0f4e8d857a49787f5ff8 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome@forissier.org>
+Date: Tue, 26 May 2020 15:21:00 +0200
+Subject: [PATCH 2/6] Allow use of cc-option in core/arch/arm/arm.mk
+
+It can be useful to call the cc-option macro when setting flags in
+core/arch/arm/arm.mk. Unfortunately cc-option is defined in
+mk/compile.mk which is too late to be useful (core/arch/arm/arm.mk is
+included by core/core.mk before mk/compile.mk).
+
+This commit addresses the issue by moving the definition of cc-option
+to its own file, mk/cc-option.mk, which is then included by
+core/arch/arm/arm.mk. There is a dependency on the compiler definitions
+(mk/gcc.mk or mk/clang.mk) and on $(arch-bit-$(sm)) so
+core/arch/arm/arm.mk is modified accordingly.
+
+Moving cc-option out of mk/compile.mk means that all non-core
+submodules would lose the definition unless they include
+mk/cc-option.mk; the TA dev kit is modified so that TAs can call
+cc-option from within their sub.mk files. As for other submodules, they
+are internal and do not use cc-options as of now so they are not
+modified.
+
+Signed-off-by: Jerome Forissier <jerome@forissier.org>
+Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ core/arch/arm/arm.mk | 14 ++++++++++++--
+ core/core.mk         |  4 ----
+ mk/cc-option.mk      |  9 +++++++++
+ mk/compile.mk        |  9 ---------
+ ta/mk/ta_dev_kit.mk  |  4 +++-
+ ta/ta.mk             |  1 +
+ 6 files changed, 25 insertions(+), 16 deletions(-)
+ create mode 100644 mk/cc-option.mk
+
+diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
+index a18eda3b..ad036c91 100644
+--- a/core/arch/arm/arm.mk
++++ b/core/arch/arm/arm.mk
+@@ -1,3 +1,15 @@
++# Setup compiler for this sub module
++# Note this file is included only from core.mk (with $(sm) == core)
++ifeq ($(CFG_ARM64_core),y)
++arch-bits-core := 64
++else
++arch-bits-core := 32
++endif
++COMPILER_core		?= $(COMPILER)
++include mk/$(COMPILER_core).mk
++
++include mk/cc-option.mk
++
+ CFG_LTC_OPTEE_THREAD ?= y
+ # Size of emulated TrustZone protected SRAM, 448 kB.
+ # Only applicable when paging is enabled.
+@@ -148,14 +160,12 @@ core-platform-cflags += -fpie
+ endif
+ 
+ ifeq ($(CFG_ARM64_core),y)
+-arch-bits-core := 64
+ core-platform-cppflags += $(arm64-platform-cppflags)
+ core-platform-cflags += $(arm64-platform-cflags)
+ core-platform-cflags += $(arm64-platform-cflags-generic)
+ core-platform-cflags += $(arm64-platform-cflags-no-hard-float)
+ core-platform-aflags += $(arm64-platform-aflags)
+ else
+-arch-bits-core := 32
+ core-platform-cppflags += $(arm32-platform-cppflags)
+ core-platform-cflags += $(arm32-platform-cflags)
+ core-platform-cflags += $(arm32-platform-cflags-no-hard-float)
+diff --git a/core/core.mk b/core/core.mk
+index 016f1489..1a330457 100644
+--- a/core/core.mk
++++ b/core/core.mk
+@@ -16,10 +16,6 @@ PLATFORM_FLAVOR_$(PLATFORM_FLAVOR) := y
+ $(eval $(call cfg-depends-all,CFG_PAGED_USER_TA,CFG_WITH_PAGER CFG_WITH_USER_TA))
+ include core/crypto.mk
+ 
+-# Setup compiler for this sub module
+-COMPILER_$(sm)		?= $(COMPILER)
+-include mk/$(COMPILER_$(sm)).mk
+-
+ cppflags$(sm)	+= -D__KERNEL__
+ 
+ cppflags$(sm)	+= -Icore/include
+diff --git a/mk/cc-option.mk b/mk/cc-option.mk
+new file mode 100644
+index 00000000..72f9a6f3
+--- /dev/null
++++ b/mk/cc-option.mk
+@@ -0,0 +1,9 @@
++_cc-option-supported = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>/dev/null >/dev/null || echo "Not supported"),,1)
++_cc-opt-cached-var-name = $(subst =,~,$(strip cached-cc-option-$(1)-$(subst $(empty) $(empty),,$(CC$(sm)))))
++define _cc-option
++$(eval _var_name := $(call _cc-opt-cached-var-name,$1))
++$(eval $(_var_name) := $(if $(filter $(origin $(_var_name)),undefined),$(call _cc-option-supported,$(1)),$($(_var_name))))
++$(if $($(_var_name)),$(1),$(2))
++endef
++cc-option = $(strip $(call _cc-option,$(1),$(2)))
++
+diff --git a/mk/compile.mk b/mk/compile.mk
+index 9868ddd1..d2705025 100644
+--- a/mk/compile.mk
++++ b/mk/compile.mk
+@@ -17,15 +17,6 @@ objs		:=
+ # Disable all builtin rules
+ .SUFFIXES:
+ 
+-_cc-option-supported = $(if $(shell $(CC$(sm)) $(1) -c -x c /dev/null -o /dev/null 2>/dev/null >/dev/null || echo "Not supported"),,1)
+-_cc-opt-cached-var-name = $(subst =,~,$(strip cached-cc-option-$(1)-$(subst $(empty) $(empty),,$(CC$(sm)))))
+-define _cc-option
+-$(eval _var_name := $(call _cc-opt-cached-var-name,$1))
+-$(eval $(_var_name) := $(if $(filter $(origin $(_var_name)),undefined),$(call _cc-option-supported,$(1)),$($(_var_name))))
+-$(if $($(_var_name)),$(1),$(2))
+-endef
+-cc-option = $(strip $(call _cc-option,$(1),$(2)))
+-
+ comp-cflags$(sm) = -std=gnu99
+ comp-aflags$(sm) =
+ comp-cppflags$(sm) =
+diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
+index 90c6a455..596a6961 100644
+--- a/ta/mk/ta_dev_kit.mk
++++ b/ta/mk/ta_dev_kit.mk
+@@ -93,6 +93,9 @@ clean:
+ 	@$(cmd-echo-silent) '  CLEAN   $(O)'
+ 	${q}if [ -d "$(O)" ]; then $(RMDIR) $(O); fi
+ 
++include  $(ta-dev-kit-dir$(sm))/mk/$(COMPILER_$(sm)).mk
++include  $(ta-dev-kit-dir$(sm))/mk/cc-option.mk
++
+ subdirs = .
+ include  $(ta-dev-kit-dir$(sm))/mk/subdir.mk
+ 
+@@ -107,7 +110,6 @@ endif
+ endif
+ 
+ SCRIPTS_DIR := $(ta-dev-kit-dir)/scripts
+-include  $(ta-dev-kit-dir$(sm))/mk/$(COMPILER_$(sm)).mk
+ include  $(ta-dev-kit-dir$(sm))/mk/compile.mk
+ 
+ ifneq ($(user-ta-uuid),)
+diff --git a/ta/ta.mk b/ta/ta.mk
+index b961663a..75b7cfd9 100644
+--- a/ta/ta.mk
++++ b/ta/ta.mk
+@@ -157,6 +157,7 @@ $(foreach f, $(libfiles), \
+ 
+ # Copy .mk files
+ ta-mkfiles = mk/compile.mk mk/subdir.mk mk/gcc.mk mk/clang.mk mk/cleandirs.mk \
++	mk/cc-option.mk \
+ 	ta/arch/$(ARCH)/link.mk ta/arch/$(ARCH)/link_shlib.mk \
+ 	ta/mk/ta_dev_kit.mk
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch b/meta-arm/recipes-security/optee/optee-os/0003-arm64-Disable-outline-atomics-when-compiling.patch
similarity index 64%
rename from meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch
rename to meta-arm/recipes-security/optee/optee-os/0003-arm64-Disable-outline-atomics-when-compiling.patch
index 086d433..71a7e91 100644
--- a/meta-arm/recipes-security/optee/optee-os/0001-arm64-Disable-outline-atomics-when-compiling.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0003-arm64-Disable-outline-atomics-when-compiling.patch
@@ -1,11 +1,12 @@
-From f94d9558d9eae48e92ce8d651539b6cf69eb4394 Mon Sep 17 00:00:00 2001
+From 821cf4e6bd2764ebab8d413eeb1c3dbf673aeb78 Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Mon, 18 May 2020 20:00:00 -0500
-Subject: [PATCH] arm64: Disable outline-atomics when compiling
+Subject: [PATCH 3/6] arm64: Disable outline-atomics when compiling
 
 Disables the automatic detection of LSE (Large System Extension)
 instructions when compiling AArch64 code. GCC 10 implements this
-detection in libgcc using __getauxval(), which optee doesn't implement.
+detection in libgcc using __getauxval(), which OP-TEE does not
+implement.
 This requires that the proper -mcpu is passed to GCC so that the code
 can be correctly compiled to use either LSE or load-store-exclusive.
 
@@ -18,21 +19,25 @@ Fixes linker errors like the following when compiling with GCC 10:
     recipe for target 'build/core/all_objs.o' failed
 
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_os/pull/3874]
+[jf: s/optee doesn't/OP-TEE does not/, replace ?= by := for immediate
+ evaluation]
+Reviewed-by: Jerome Forissier <jerome@forissier.org>
+Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 ---
  core/arch/arm/arm.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/core/arch/arm/arm.mk b/core/arch/arm/arm.mk
-index a18eda3b..07069c66 100644
+index ad036c91..d8dd5206 100644
 --- a/core/arch/arm/arm.mk
 +++ b/core/arch/arm/arm.mk
-@@ -115,7 +115,7 @@ arm32-platform-aflags-no-hard-float ?=
+@@ -127,7 +127,7 @@ arm32-platform-aflags-no-hard-float ?=
  
  arm64-platform-cflags-no-hard-float ?= -mgeneral-regs-only
  arm64-platform-cflags-hard-float ?=
 -arm64-platform-cflags-generic ?= -mstrict-align
-+arm64-platform-cflags-generic ?= -mstrict-align $(call cc-option,-mno-outline-atomics,)
++arm64-platform-cflags-generic := -mstrict-align $(call cc-option,-mno-outline-atomics,)
  
  ifeq ($(DEBUG),1)
  # For backwards compatibility
diff --git a/meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch b/meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch
new file mode 100644
index 0000000..95fd549
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch
@@ -0,0 +1,59 @@
+From a5dbec871f2acf01b5701a646584ad55d0ac1db7 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome@forissier.org>
+Date: Tue, 26 May 2020 11:35:32 +0200
+Subject: [PATCH 4/6] Cleanup unused comp-cflags$(sm) from libgcc lookup
+ commands
+
+The compiler is not expected to need any flag from $(comp-cflags$(sm))
+to locate the compiler runtime libraries, and in fact this variable is
+always undefined at the point it is used. Indeed, comp-cflags$(sm) is
+set in mk/compile.mk, i.e., after mk/gcc.mk (or mk/clang.mk) has
+been included.
+
+Therefore, remove the useless flags.
+
+Signed-off-by: Jerome Forissier <jerome@forissier.org>
+Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ mk/clang.mk | 10 +++++++++-
+ mk/gcc.mk   |  2 +-
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index 28367e73..34034a9c 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -45,7 +45,15 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ comp-cflags-warns-clang := -Wno-language-extension-token \
+ 			 -Wno-gnu-zero-variadic-macro-arguments
+ 
+-libgcc$(sm)  	:=
++# Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
++# libgcc for clang
++libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
++
++# Core ASLR relies on the executable being ready to run from its preferred load
++# address, because some symbols are used before the MMU is enabled and the
++# relocations are applied.
++ldflag-apply-dynamic-relocs := --apply-dynamic-relocs
+ 
+ # Define these to something to discover accidental use
+ CC		:= false
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index 1f2c5990..c53a23b1 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) $(comp-cflags$(sm)) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch b/meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
new file mode 100644
index 0000000..7c68cfd
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch
@@ -0,0 +1,33 @@
+From 2fd7b1f22d2e03dac423adace92ab2214305b4ac Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome@forissier.org>
+Date: Tue, 26 May 2020 18:16:16 +0200
+Subject: [PATCH 5/6] [Fixup] Allow use of cc-option in core/arch/arm/arm.mk
+
+Fix a build error, let's see if Shippable is happy with this, I
+still do not understand why these lines are needed.
+
+Signed-off-by: Jerome Forissier <jerome@forissier.org>
+Upstream-Status: Accepted [https://github.com/OP-TEE/optee_os/pull/3891]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ core/core.mk | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/core/core.mk b/core/core.mk
+index 1a330457..d6af1d51 100644
+--- a/core/core.mk
++++ b/core/core.mk
+@@ -16,6 +16,10 @@ PLATFORM_FLAVOR_$(PLATFORM_FLAVOR) := y
+ $(eval $(call cfg-depends-all,CFG_PAGED_USER_TA,CFG_WITH_PAGER CFG_WITH_USER_TA))
+ include core/crypto.mk
+ 
++# Setup compiler for this sub module
++COMPILER_$(sm)         ?= $(COMPILER)
++include mk/$(COMPILER_$(sm)).mk
++
+ cppflags$(sm)	+= -D__KERNEL__
+ 
+ cppflags$(sm)	+= -Icore/include
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
similarity index 55%
rename from meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
rename to meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
index 17127d0..d911d80 100644
--- a/meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
+++ b/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -1,13 +1,25 @@
+From 030cd84cf0df1c27355ec02e0226317684897a97 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH 6/6] allow setting sysroot for libgcc lookup
+
+---
+ mk/gcc.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
 diff --git a/mk/gcc.mk b/mk/gcc.mk
-index fc38c4d..77b8d74 100644
+index c53a23b1..330b200a 100644
 --- a/mk/gcc.mk
 +++ b/mk/gcc.mk
 @@ -12,7 +12,7 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
  			-print-file-name=include 2> /dev/null)
  
  # Get location of libgcc from gcc
--libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) $(comp-cflags$(sm)) \
-+libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) $(comp-cflags$(sm)) \
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
  			-print-libgcc-file-name 2> /dev/null)
  
  # Define these to something to discover accidental use
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index 6036bac..52c1155 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -15,8 +15,12 @@ DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyel
 SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_os.git \
-    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0001-arm64-Disable-outline-atomics-when-compiling.patch \
+    file://0001-mk-compile.mk-fix-cc-option-macro.patch \
+    file://0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
+    file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
+    file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
+    file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
+    file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1

