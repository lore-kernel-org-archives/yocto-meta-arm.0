Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA5BC6FA86
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 19:30:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.441.1662665410880942815
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 12:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 988D5153B
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Sep 2022 12:30:16 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B5D23F71A
	for <meta-arm@lists.yoctoproject.org>; Thu,  8 Sep 2022 12:30:10 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/optee-os: add 3.10 recipe for corstone1000
Date: Thu,  8 Sep 2022 15:29:57 -0400
Message-Id: <20220908192959.21816-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Sep 2022 19:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3746

A optee-os v3.10 recipe is necessary for corstone100, as it is actually
using 3.10 SHA and then trying to apply patches for 3.14 (which is
causing fuzz errors).  Create this and use it to avoid these issues.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 35 ++++++++++
 ...0007-allow-setting-sysroot-for-clang.patch | 30 +++++++++
 .../files/0008-no-warn-rwx-segments.patch     | 65 +++++++++++++++++++
 ...rstone1000-add-corstone1000-platform.patch | 22 +++++--
 ...000-reserve-3MB-CVM-memory-for-optee.patch | 15 +++--
 ...0-add-a-rule-in-Makefile-to-SP_MAKEF.patch | 15 +++--
 ...ne1000-increase-OPTEE-core-heap-size.patch | 15 +++--
 ...d-missing-error-check-during-SP-init.patch | 15 +++--
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 35 ++++++++++
 ...0007-allow-setting-sysroot-for-clang.patch | 30 +++++++++
 .../0008-no-warn-rwx-segments.patch           | 65 +++++++++++++++++++
 .../recipes-security/optee/optee-os_3.10.0.bb |  3 +
 .../optee/optee-os_3.10.0.bbappend            |  6 ++
 .../optee/optee-os_3.14.0.bbappend            |  1 -
 14 files changed, 316 insertions(+), 36 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/0008-no-warn-rwx-segments.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bb
 create mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend

diff --git a/meta-arm-bsp/recipes-security/optee/files/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-security/optee/files/0006-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..b838335e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,35 @@
+From 4b2c1a31efe0c5514ae27e696e75659b55e41259 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
+for the compiler libraries as there's no easy way to reliably pass --sysroot
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24..81bfa78a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libgcc_eh.a 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
diff --git a/meta-arm-bsp/recipes-security/optee/files/0007-allow-setting-sysroot-for-clang.patch b/meta-arm-bsp/recipes-security/optee/files/0007-allow-setting-sysroot-for-clang.patch
new file mode 100644
index 00000000..d5e36948
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/0007-allow-setting-sysroot-for-clang.patch
@@ -0,0 +1,30 @@
+From 992bed8a62c75aab034fe53d6329fa7c15cf06ee Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index 0f48c836..47465523 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
+ 
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
+ # libgcc for clang
+-libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
+ 
+ # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/meta-arm-bsp/recipes-security/optee/files/0008-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/optee/files/0008-no-warn-rwx-segments.patch
new file mode 100644
index 00000000..40482282
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/0008-no-warn-rwx-segments.patch
@@ -0,0 +1,65 @@
+From 3126adccaf9c9dc669bb7e1f96326c03da4b570d Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 5 Aug 2022 09:48:03 +0200
+Subject: [PATCH] core: link: add --no-warn-rwx-segments
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+binutils ld.bfd generates one RWX LOAD segment by merging several sections
+with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 it
+also warns by default when that happens [1], which breaks the build due to
+--fatal-warnings. The RWX segment is not a problem for the TEE core, since
+that information is not used to set memory permissions. Therefore, silence
+the warning.
+
+Link: [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+Link: https://sourceware.org/bugzilla/show_bug.cgi?id=29448
+Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+---
+ core/arch/arm/kernel/link.mk | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 69375ad6..bea239cf 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -17,6 +17,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
+ link-ldflags += --sort-section=alignment
+ link-ldflags += --fatal-warnings
+ link-ldflags += --gc-sections
++link-ldflags += $(call ld-option,--no-warn-rwx-segments)
+ 
+ link-ldadd  = $(LDADD)
+ link-ldadd += $(libdeps)
+@@ -37,6 +38,7 @@ link-script-cppflags := \
+ 		$(cppflagscore))
+ 
+ ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
++		   $(call ld-option,--no-warn-rwx-segments) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/all_objs.o
+ $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
+@@ -49,7 +51,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
+ 
+-unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections
++unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
++		 $(call ld-option,--no-warn-rwx-segments)
+ unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/unpaged.o
+ $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
+@@ -77,7 +80,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
+ 
+-init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections
++init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
++	       $(call ld-option,--no-warn-rwx-segments)
+ init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
+ 	      $(libgcccore)
+ cleanfiles += $(link-out-dir)/init.o
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
index 7666486d..b2d9f03c 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0001-plat-corstone1000-add-corstone1000-platform.patch
@@ -1,15 +1,26 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From 439a87df6a9f60f2b29afd988ad58a67e6f0b603 Mon Sep 17 00:00:00 2001
+From 617e3a116178559fb6e148553b1cd56fb13ed7aa Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Tue, 22 Jun 2021 22:09:28 +0100
 Subject: [PATCH] plat-corstone1000: add corstone1000 platform
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
 These changes are to add corstone1000 platform to optee core
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+---
+ core/arch/arm/plat-corstone1000/conf.mk       | 37 +++++++++
+ core/arch/arm/plat-corstone1000/main.c        | 77 +++++++++++++++++++
+ .../arm/plat-corstone1000/platform_config.h   | 46 +++++++++++
+ core/arch/arm/plat-corstone1000/sub.mk        |  2 +
+ 4 files changed, 162 insertions(+)
+ create mode 100644 core/arch/arm/plat-corstone1000/conf.mk
+ create mode 100644 core/arch/arm/plat-corstone1000/main.c
+ create mode 100644 core/arch/arm/plat-corstone1000/platform_config.h
+ create mode 100644 core/arch/arm/plat-corstone1000/sub.mk
+
 diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
 new file mode 100644
 index 00000000..b14dd442
@@ -196,6 +207,3 @@ index 00000000..8ddc2fd4
 @@ -0,0 +1,2 @@
 +global-incdirs-y += .
 +srcs-y += main.c
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
index ea60fee2..69cd1913 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0002-plat-corstone1000-reserve-3MB-CVM-memory-for-optee.patch
@@ -1,16 +1,20 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
-
-From dbaf7a11e686d362eb09e63841eb718ea777dd03 Mon Sep 17 00:00:00 2001
+From 63469ad63866d07012fc98214ce2bfb84093f9bb Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Wed, 1 Sep 2021 16:46:42 +0100
 Subject: [PATCH] plat-corstone1000: reserve 3MB CVM memory for optee
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Arpita S.K <arpita.s.k@arm.com>
+
 optee requires 3MB CVM memory to include SecurePartition's into
 it's image
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+---
+ core/arch/arm/plat-corstone1000/conf.mk | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
 diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
 index b14dd442..7a4aa13c 100644
 --- a/core/arch/arm/plat-corstone1000/conf.mk
@@ -25,6 +29,3 @@ index b14dd442..7a4aa13c 100644
  CFG_SHMEM_START  ?= 0x86000000
  CFG_SHMEM_SIZE   ?= 0x00200000
  
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
index 9aec829c..296cad30 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0003-plat-corstone1000-add-a-rule-in-Makefile-to-SP_MAKEF.patch
@@ -1,17 +1,21 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 327290faefe16440c4975c9539b11d43c92bcf48 Mon Sep 17 00:00:00 2001
+From 66df8edb433ad11face32e4f6aab90e64222d38c Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Thu, 25 Nov 2021 06:20:48 +0000
 Subject: [PATCH] plat-corstone1000: add a rule in Makefile to SP_MAKEFILE_PATH
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
 This change is to provide an option to user to include
 secure manifest into optee-os Makefile so that the secure
 partition is part of optee-os image
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+---
+ Makefile | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
 diff --git a/Makefile b/Makefile
 index f6fcea8b..21722939 100644
 --- a/Makefile
@@ -33,6 +37,3 @@ index f6fcea8b..21722939 100644
  include mk/checkconf.mk
  
  .PHONY: all
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
index 42babb16..8c4178e2 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-plat-corstone1000-increase-OPTEE-core-heap-size.patch
@@ -1,17 +1,21 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 5fdf7792ead29784718d30d8a8a5383a994e2fef Mon Sep 17 00:00:00 2001
+From a9b5146200935c53f3bb1f4d03ef6a674b194b92 Mon Sep 17 00:00:00 2001
 From: Vishnu Banavath <vishnu.banavath@arm.com>
 Date: Thu, 2 Dec 2021 12:51:11 +0000
 Subject: [PATCH] plat-corstone1000: increase OPTEE core heap size
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
 This change is to increase optee core heap size to 131072
 from its default value to fit openAMP and smm-gateway
 in SEL0
 
 Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
 
+---
+ core/arch/arm/plat-corstone1000/conf.mk | 1 +
+ 1 file changed, 1 insertion(+)
+
 diff --git a/core/arch/arm/plat-corstone1000/conf.mk b/core/arch/arm/plat-corstone1000/conf.mk
 index 7a4aa13c..65d652a4 100644
 --- a/core/arch/arm/plat-corstone1000/conf.mk
@@ -24,6 +28,3 @@ index 7a4aa13c..65d652a4 100644
  $(call force,CFG_PSCI_ARM64,y)
  $(call force,CFG_DT,y)
  $(call force,CFG_EXTERNAL_DTB_OVERLAY,y)
--- 
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
index 852067bc..dfdf56f8 100644
--- a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0005-Fix-add-missing-error-check-during-SP-init.patch
@@ -1,11 +1,11 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-
-From 4617f85b70c7e4206b244f3eaffdc62ac3744a17 Mon Sep 17 00:00:00 2001
+From 9ec42a39ba4b14bc99f66b3fb9fc227e4e25d0ed Mon Sep 17 00:00:00 2001
 From: Jelle Sels <jelle.sels@arm.com>
 Date: Mon, 10 May 2021 11:37:23 +0200
 Subject: [PATCH] Fix: add missing error check during SP init
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
+
 Error checking during SP initialization (sp_init_uuid()) was lacking.
 As a result an out of CORE HEAP situation resulted in a panic. This was
 due to lack of memory in the inflate() function of zlib.
@@ -13,6 +13,10 @@ due to lack of memory in the inflate() function of zlib.
 Signed-off-by: Jelle Sels <jelle.sels@arm.com>
 Change-Id: I287e2e2dd507feb45991b32ed264b3b6ad6fcd39
 
+---
+ core/arch/arm/kernel/sp.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
 diff --git a/core/arch/arm/kernel/sp.c b/core/arch/arm/kernel/sp.c
 index 4acbc2e2..23532a01 100644
 --- a/core/arch/arm/kernel/sp.c
@@ -35,6 +39,3 @@ index 4acbc2e2..23532a01 100644
  
  	return res;
  }
--- 
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch
new file mode 100644
index 00000000..b838335e
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0006-allow-setting-sysroot-for-libgcc-lookup.patch
@@ -0,0 +1,35 @@
+From 4b2c1a31efe0c5514ae27e696e75659b55e41259 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 26 May 2020 14:38:02 -0500
+Subject: [PATCH] allow setting sysroot for libgcc lookup
+
+Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when searching
+for the compiler libraries as there's no easy way to reliably pass --sysroot
+otherwise.
+
+Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ mk/gcc.mk | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mk/gcc.mk b/mk/gcc.mk
+index adc77a24..81bfa78a 100644
+--- a/mk/gcc.mk
++++ b/mk/gcc.mk
+@@ -13,11 +13,11 @@ nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
+ 			-print-file-name=include 2> /dev/null)
+ 
+ # Get location of libgcc from gcc
+-libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)  	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-print-libgcc-file-name 2> /dev/null)
+-libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libstdc++$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libstdc++.a 2> /dev/null)
+-libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
++libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
+ 			-print-file-name=libgcc_eh.a 2> /dev/null)
+ 
+ # Define these to something to discover accidental use
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch
new file mode 100644
index 00000000..d5e36948
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0007-allow-setting-sysroot-for-clang.patch
@@ -0,0 +1,30 @@
+From 992bed8a62c75aab034fe53d6329fa7c15cf06ee Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Wed, 23 Sep 2020 09:27:34 +0100
+Subject: [PATCH] optee: enable clang support
+
+When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
+to provide a sysroot wasn't included, which results in not locating
+compiler-rt. This is mitigated by including the variable as ammended.
+
+Upstream-Status: Pending
+ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+
+---
+ mk/clang.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mk/clang.mk b/mk/clang.mk
+index 0f48c836..47465523 100644
+--- a/mk/clang.mk
++++ b/mk/clang.mk
+@@ -27,7 +27,7 @@ comp-cflags-warns-clang := -Wno-language-extension-token \
+ 
+ # Note, use the compiler runtime library (libclang_rt.builtins.*.a) instead of
+ # libgcc for clang
+-libgcc$(sm)	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
++libgcc$(sm)	:= $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(arch-bits-$(sm))) \
+ 			-rtlib=compiler-rt -print-libgcc-file-name 2> /dev/null)
+ 
+ # Core ASLR relies on the executable being ready to run from its preferred load
diff --git a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch
new file mode 100644
index 00000000..40482282
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0008-no-warn-rwx-segments.patch
@@ -0,0 +1,65 @@
+From 3126adccaf9c9dc669bb7e1f96326c03da4b570d Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 5 Aug 2022 09:48:03 +0200
+Subject: [PATCH] core: link: add --no-warn-rwx-segments
+
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
+
+binutils ld.bfd generates one RWX LOAD segment by merging several sections
+with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 it
+also warns by default when that happens [1], which breaks the build due to
+--fatal-warnings. The RWX segment is not a problem for the TEE core, since
+that information is not used to set memory permissions. Therefore, silence
+the warning.
+
+Link: [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+Link: https://sourceware.org/bugzilla/show_bug.cgi?id=29448
+Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+---
+ core/arch/arm/kernel/link.mk | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
+index 69375ad6..bea239cf 100644
+--- a/core/arch/arm/kernel/link.mk
++++ b/core/arch/arm/kernel/link.mk
+@@ -17,6 +17,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
+ link-ldflags += --sort-section=alignment
+ link-ldflags += --fatal-warnings
+ link-ldflags += --gc-sections
++link-ldflags += $(call ld-option,--no-warn-rwx-segments)
+ 
+ link-ldadd  = $(LDADD)
+ link-ldadd += $(libdeps)
+@@ -37,6 +38,7 @@ link-script-cppflags := \
+ 		$(cppflagscore))
+ 
+ ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
++		   $(call ld-option,--no-warn-rwx-segments) \
+ 		   $(link-objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/all_objs.o
+ $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
+@@ -49,7 +51,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
+ 
+-unpaged-ldargs = -T $(link-script-dummy) --no-check-sections --gc-sections
++unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
++		 $(call ld-option,--no-warn-rwx-segments)
+ unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
+ cleanfiles += $(link-out-dir)/unpaged.o
+ $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
+@@ -77,7 +80,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
+ 	$(q)$(NMcore) $< | \
+ 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
+ 
+-init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections
++init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
++	       $(call ld-option,--no-warn-rwx-segments)
+ init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
+ 	      $(libgcccore)
+ cleanfiles += $(link-out-dir)/init.o
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bb
new file mode 100644
index 00000000..19beaa7c
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bb
@@ -0,0 +1,3 @@
+require recipes-security/optee/optee-os.inc
+
+SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend
new file mode 100644
index 00000000..db1fc18b
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.10.0.bbappend
@@ -0,0 +1,6 @@
+# Machine specific configurations
+
+MACHINE_OPTEE_OS_REQUIRE ?= ""
+MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os-corstone1000.inc"
+
+require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
index 7834b64b..e276fb86 100644
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
+++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
@@ -1,7 +1,6 @@
 # Machine specific configurations
 
 MACHINE_OPTEE_OS_REQUIRE ?= ""
-MACHINE_OPTEE_OS_REQUIRE:corstone1000 = "optee-os_corstone1000.inc"
 MACHINE_OPTEE_OS_REQUIRE:tc = "optee-os-tc.inc"
 
 require ${MACHINE_OPTEE_OS_REQUIRE}
-- 
2.17.1


