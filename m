Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679BEC52D6D
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:26:23 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.91632.1722601574449986987
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 05:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YDO6fSrW;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso103974151fa.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722601572; x=1723206372; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSKKDqIFsmtWSnEeoboMcS1uKIkw42g+6lJiOsd5yT0=;
        b=YDO6fSrWwdl5U9b0q+3auihOP5tOrkoCya1ki6+WWy4/LeiXi0DBah5KKnl2DA3l1j
         BHfoJWjUgBLF+IeKm20gdUYPmg+AErQ9jrVnJGNbRyI7ME28es6qPLJwYfrc2iD1gYhS
         D2oEFW4hys0PjQS+irHa3+V1g5sGCOSwWqqplXIWXfQKcPpKgHc/LmLogRw37xxxdMNy
         IgqfBI7r6OgjqhjmLtcOz9+apCamNNoZIIYWN0LgIZCBheapFINK0jYBDw/Zo/fqXZg7
         Nw/o9ypesBrDzZRwixnoFe4hLrBEOm1cmU7WRtARIlD4iE+Lm8kor56R5IrqEjv8he4P
         OczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722601573; x=1723206373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSKKDqIFsmtWSnEeoboMcS1uKIkw42g+6lJiOsd5yT0=;
        b=LtyhFR8c/m2NMRo+wXnD9JgMzkSiXcXD7uLK0G75DUn4x4eiNPbDhw51qvKcB3ZoDX
         /qulsyVWL4eRLmIUn0EeZ3540ZZg2Gk8zN+KOOxQIuJXcqRwNqbnszeSSrNz5nTtlBdP
         P7wno+AqOQcJ+CpPdKrLLERsVMpQkdawWph2uZsOHD8qnWjeC4D/MlZeYXadi6Zmlns0
         1woUtikwt9KObJ8kIfEu1VQExijJmvLcYDW/Z3PXI++zhwX6MKV9E8g4PP9Cf4ezeDYh
         JT2ZxMKf+yDin4PH5NK9jvxkPMZttMzkxnBHPOVAekt7sI0/L4NeTfjeX0F4OksXBRvP
         tlyA==
X-Gm-Message-State: AOJu0YyrA5C6OOPvnHKeMVIC1CcG/R29kXPPgzPkZ/qplXf8ylul6Rd4
	5d2/ZxLjALxolz//HplIFDGBpCQ9trV+9aZWWX40eTkWnXJ+d5p/OdYyJoqMe5vRH8TLp+TEevQ
	l
X-Google-Smtp-Source: AGHT+IHx/Bfgb0HLOf3G/LT2w8zrDdekCVO1Ml80G/QqUq/Wno/7JbRBVOeVcPEGUQ5lDxMLGLtJCQ==
X-Received: by 2002:a2e:9110:0:b0:2ef:2c20:e061 with SMTP id 38308e7fff4ca-2f15aab0a5emr23088241fa.22.1722601572287;
        Fri, 02 Aug 2024 05:26:12 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e1864f6sm1451421fa.22.2024.08.02.05.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 05:26:11 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2][master-next] optee-os: fix buildpaths QA failure on corstone1000
Date: Fri,  2 Aug 2024 15:25:08 +0300
Message-ID: <20240802122508.27581-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Aug 2024 12:26:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5945

Patches applied upstream:

https://github.com/OP-TEE/optee_os/pull/6974

Fixes:

https://gitlab.com/jonmason00/meta-arm/-/jobs/7472950159

ERROR: mc:firmware:optee-os-4.2.0-r0 do_package_qa: QA Issue: File /lib/firmware/tee.elf in package optee-os contains reference to TMPDIR [buildpaths]

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...mpile.mk-use-CFLAGS-from-environment.patch | 43 ++++++++++++
 ...02-link.mk-use-CFLAGS-with-version.o.patch | 45 ++++++++++++
 ...k-generate-version.o-in-link-out-dir.patch | 70 +++++++++++++++++++
 .../recipes-security/optee/optee-os_4.2.0.bb  |  3 +
 4 files changed, 161 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-compile.mk-use-CFLAGS-from-environment.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0002-link.mk-use-CFLAGS-with-version.o.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0003-link.mk-generate-version.o-in-link-out-dir.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-compile.mk-use-CFLAGS-from-environment.patch b/meta-arm/recipes-security/optee/optee-os/0001-compile.mk-use-CFLAGS-from-environment.patch
new file mode 100644
index 00000000..6577dce3
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-compile.mk-use-CFLAGS-from-environment.patch
@@ -0,0 +1,43 @@
+From 978cc08a393b7d5d0043bf7f4d33f0e33b2b18d8 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 1 Aug 2024 13:58:36 +0000
+Subject: [PATCH 1/3] compile.mk: use CFLAGS from environment
+
+Users can set CFLAGS just like AFLAGS, CC,
+LD etc and expect them to be used. It's ok to amend
+to them but overwriting should not be done.
+Build environment like yocto expect that these
+variables are used to call the compiler etc tools.
+Linux distro build environments usually set
+these variables.
+
+Helps to remove build time paths from generated binaries
+since mappings to remove them can be set by the distro
+build system in CFLAGS automatically for each SW component
+in the build.
+
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ mk/compile.mk | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport
+
+diff --git a/mk/compile.mk b/mk/compile.mk
+index b3d807ba4..0de7ea259 100644
+--- a/mk/compile.mk
++++ b/mk/compile.mk
+@@ -80,7 +80,8 @@ comp-compiler-$2 := $$(CC$(sm))
+ comp-flags-$2 = $$(filter-out $$(CFLAGS_REMOVE) $$(cflags-remove) \
+ 			      $$(cflags-remove-$$(comp-sm-$2)) \
+ 			      $$(cflags-remove-$2), \
+-		   $$(CFLAGS$$(arch-bits-$$(comp-sm-$2))) $$(CFLAGS_WARNS) \
++		   $$(CFLAGS$$(arch-bits-$$(comp-sm-$2))) $$(CFLAGS) \
++		   $$(CFLAGS_WARNS) \
+ 		   $$(comp-cflags$$(comp-sm-$2)) $$(cflags$$(comp-sm-$2)) \
+ 		   $$(cflags-lib$$(comp-lib-$2)) $$(cflags-$2))
+ ifeq ($C,1)
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-use-CFLAGS-with-version.o.patch b/meta-arm/recipes-security/optee/optee-os/0002-link.mk-use-CFLAGS-with-version.o.patch
new file mode 100644
index 00000000..08bc15d7
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0002-link.mk-use-CFLAGS-with-version.o.patch
@@ -0,0 +1,45 @@
+From f9207376ed58836bf748cc4cea0fcbf46624a709 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 1 Aug 2024 14:03:11 +0000
+Subject: [PATCH 2/3] link.mk: use CFLAGS with version.o
+
+Should be used by all compilations.
+
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ core/arch/arm/kernel/link.mk   | 2 +-
+ core/arch/riscv/kernel/link.mk | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Upstream-Status: Backport
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 49e9f4fa1..377a82b65 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -151,7 +151,7 @@ define update-buildcount
+ endef
+ 
+ # filter-out to workaround objdump warning
+-version-o-cflags = $(filter-out -g3,$(core-platform-cflags) \
++version-o-cflags = $(filter-out -g3,$(CFLAGS) $(core-platform-cflags) \
+ 			$(platform-cflags) $(cflagscore))
+ # SOURCE_DATE_EPOCH defined for reproducible builds
+ ifneq ($(SOURCE_DATE_EPOCH),)
+diff --git a/core/arch/riscv/kernel/link.mk b/core/arch/riscv/kernel/link.mk
+index 3d1000d15..1fff0a379 100644
+--- a/core/arch/riscv/kernel/link.mk
++++ b/core/arch/riscv/kernel/link.mk
+@@ -62,7 +62,7 @@ define update-buildcount
+ endef
+ 
+ # filter-out to workaround objdump warning
+-version-o-cflags = $(filter-out -g3,$(core-platform-cflags) \
++version-o-cflags = $(filter-out -g3,$(CFLAGS) $(core-platform-cflags) \
+ 			$(platform-cflags) $(cflagscore))
+ # SOURCE_DATE_EPOCH defined for reproducible builds
+ ifneq ($(SOURCE_DATE_EPOCH),)
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-link.mk-generate-version.o-in-link-out-dir.patch b/meta-arm/recipes-security/optee/optee-os/0003-link.mk-generate-version.o-in-link-out-dir.patch
new file mode 100644
index 00000000..0e559b2e
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0003-link.mk-generate-version.o-in-link-out-dir.patch
@@ -0,0 +1,70 @@
+From 8f100f355e645376729086edbace8f01cf7aa3b4 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Thu, 1 Aug 2024 14:04:55 +0000
+Subject: [PATCH 3/3] link.mk: generate version.o in link-out-dir
+
+When source code is piped to compiler, then the
+current working directory is left into debug
+data. If the working directory is not the output
+directory, then mappings which strip absolute output
+directory paths don't work.
+
+Removes absolute build time paths from version.o
+debug info.
+
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ core/arch/arm/kernel/link.mk   | 5 +++--
+ core/arch/riscv/kernel/link.mk | 5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 377a82b65..d1d527224 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -163,14 +163,15 @@ CORE_CC_VERSION = `$(CCcore) -v 2>&1 | grep "version " | sed 's/ *$$//'`
+ define gen-version-o
+ 	$(call update-buildcount,$(link-out-dir)/.buildcount)
+ 	@$(cmd-echo-silent) '  GEN     $(link-out-dir)/version.o'
+-	$(q)echo -e "const char core_v_str[] =" \
++	$(q)cd $(link-out-dir) && \
++		echo -e "const char core_v_str[] =" \
+ 		"\"$(TEE_IMPL_VERSION) \"" \
+ 		"\"($(CORE_CC_VERSION)) \"" \
+ 		"\"#$(BUILD_COUNT_STR) \"" \
+ 		"\"$(DATE_STR) \"" \
+ 		"\"$(CFG_KERN_LINKER_ARCH)\";\n" \
+ 		| $(CCcore) $(version-o-cflags) \
+-			-xc - -c -o $(link-out-dir)/version.o
++			-xc - -c -o version.o
+ endef
+ $(link-out-dir)/version.o:
+ 	$(call gen-version-o)
+diff --git a/core/arch/riscv/kernel/link.mk b/core/arch/riscv/kernel/link.mk
+index 1fff0a379..6511586e2 100644
+--- a/core/arch/riscv/kernel/link.mk
++++ b/core/arch/riscv/kernel/link.mk
+@@ -74,14 +74,15 @@ CORE_CC_VERSION = `$(CCcore) -v 2>&1 | grep "version " | sed 's/ *$$//'`
+ define gen-version-o
+ 	$(call update-buildcount,$(link-out-dir)/.buildcount)
+ 	@$(cmd-echo-silent) '  GEN     $(link-out-dir)/version.o'
+-	$(q)echo -e "const char core_v_str[] =" \
++	$(q)cd $(link-out-dir) && \
++		echo -e "const char core_v_str[] =" \
+ 		"\"$(TEE_IMPL_VERSION) \"" \
+ 		"\"($(CORE_CC_VERSION)) \"" \
+ 		"\"#$(BUILD_COUNT_STR) \"" \
+ 		"\"$(DATE_STR) \"" \
+ 		"\"$(CFG_KERN_LINKER_ARCH)\";\n" \
+ 		| $(CCcore) $(version-o-cflags) \
+-			-xc - -c -o $(link-out-dir)/version.o
++			-xc - -c -o version.o
+ endef
+ 
+ $(link-out-dir)/version.o:
+-- 
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
index cee024af..33c19f2f 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
@@ -9,4 +9,7 @@ SRC_URI += " \
     file://0003-optee-enable-clang-support.patch \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
     file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
+    file://0001-compile.mk-use-CFLAGS-from-environment.patch \
+    file://0002-link.mk-use-CFLAGS-with-version.o.patch \
+    file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
 "
-- 
2.34.1


