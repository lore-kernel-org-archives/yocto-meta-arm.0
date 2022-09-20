Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AA9C6FA90
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 12:58:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5944.1663765131260671092
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 05:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7274A1F60
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:57 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8FFA3F73B
	for <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 05:58:50 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/optee: remove old versions
Date: Tue, 20 Sep 2022 18:38:45 -0400
Message-Id: <20220920223846.8000-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220920223846.8000-1-jon.mason@arm.com>
References: <20220920223846.8000-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 12:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3798

Remove versions not being used anymore and update patches as necessary

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-os-tadevkit_3.14.0.bbappend   |   6 -
 .../optee/optee-os_3.14.0.bbappend            |   6 -
 .../optee/optee-test_3.14.0.bbappend          |   6 -
 .../optee/optee-examples_3.14.0.bb            |   4 -
 .../optee/optee-os-tadevkit_3.14.0.bb         |  20 ---
 .../{3.18 => }/0009-add-z-execstack.patch     |   0
 .../0010-add-note-GNU-stack-section.patch     |   0
 .../optee-os/3.14/0009-add-z-execstack.patch  |  95 -------------
 .../0010-add-note-GNU-stack-section.patch     | 128 ------------------
 .../recipes-security/optee/optee-os_3.14.0.bb |  10 --
 .../recipes-security/optee/optee-os_3.18.0.bb |   4 +-
 .../optee/optee-test_3.14.0.bb                |   3 -
 12 files changed, 2 insertions(+), 280 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
 rename meta-arm/recipes-security/optee/optee-os/{3.18 => }/0009-add-z-execstack.patch (100%)
 rename meta-arm/recipes-security/optee/optee-os/{3.18 => }/0010-add-note-GNU-stack-section.patch (100%)
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/3.14/0009-add-z-execstack.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/3.14/0010-add-note-GNU-stack-section.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.14.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.14.0.bb

diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend
deleted file mode 100644
index 6a22d47e..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.14.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?= ""
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc = "optee-os-generic-tc.inc"
-
-require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
deleted file mode 100644
index e276fb86..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.14.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_REQUIRE ?= ""
-MACHINE_OPTEE_OS_REQUIRE:tc = "optee-os-tc.inc"
-
-require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend b/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
deleted file mode 100644
index 490b3500..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.14.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_TEST_REQUIRE ?= ""
-MACHINE_OPTEE_TEST_REQUIRE:tc = "optee-test-tc.inc"
-
-require ${MACHINE_OPTEE_TEST_REQUIRE}
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
deleted file mode 100644
index f2b5f7dd..00000000
--- a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require optee-examples.inc
-
-SRCREV = "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
-
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
deleted file mode 100644
index 0d37a528..00000000
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.14.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/optee-os:"
-require optee-os_3.14.0.bb
-
-SUMMARY = "OP-TEE Trusted OS TA devkit"
-DESCRIPTION = "OP-TEE TA devkit for build TAs"
-HOMEPAGE = "https://www.op-tee.org/"
-
-do_install() {
-    #install TA devkit
-    install -d ${D}${includedir}/optee/export-user_ta/
-    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-        cp -aR $f ${D}${includedir}/optee/export-user_ta/
-    done
-}
-
-do_deploy() {
-	echo "Do not inherit do_deploy from optee-os."
-}
-
-FILES:${PN} = "${includedir}/optee/"
diff --git a/meta-arm/recipes-security/optee/optee-os/3.18/0009-add-z-execstack.patch b/meta-arm/recipes-security/optee/optee-os/0009-add-z-execstack.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/3.18/0009-add-z-execstack.patch
rename to meta-arm/recipes-security/optee/optee-os/0009-add-z-execstack.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os/0010-add-note-GNU-stack-section.patch
similarity index 100%
rename from meta-arm/recipes-security/optee/optee-os/3.18/0010-add-note-GNU-stack-section.patch
rename to meta-arm/recipes-security/optee/optee-os/0010-add-note-GNU-stack-section.patch
diff --git a/meta-arm/recipes-security/optee/optee-os/3.14/0009-add-z-execstack.patch b/meta-arm/recipes-security/optee/optee-os/3.14/0009-add-z-execstack.patch
deleted file mode 100644
index 616a0fff..00000000
--- a/meta-arm/recipes-security/optee/optee-os/3.14/0009-add-z-execstack.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From cb4349edce6ce360436f10da8b6aa32e68fb778d Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 23 Aug 2022 11:41:00 +0000
-Subject: [PATCH] core, ldelf: link: add -z execstack
-
-When building for arm32 with GNU binutils 2.39, the linker outputs
-warnings when generating some TEE core binaries (all_obj.o, init.o,
-unpaged.o and tee.elf) as well as ldelf.elf:
-
- arm-poky-linux-gnueabi-ld.bfd: warning: atomic_a32.o: missing .note.GNU-stack section implies executable stack
- arm-poky-linux-gnueabi-ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
-
-The permissions used when mapping the TEE core stacks do not depend on
-any metadata found in the ELF file. Similarly when the TEE core loads
-ldelf it already creates a non-executable stack regardless of ELF
-information. Therefore we can safely ignore the warnings. This is done
-by adding the '-z execstack' option.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
-
----
- core/arch/arm/kernel/link.mk | 13 +++++++++----
- ldelf/link.mk                |  4 ++++
- 2 files changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 3dc459d6..85cde58e 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -9,6 +9,11 @@ link-script-dep = $(link-out-dir)/.kern.ld.d
- 
- AWK	 = awk
- 
-+link-ldflags-common += $(call ld-option,--no-warn-rwx-segments)
-+ifeq ($(CFG_ARM32_core),y)
-+link-ldflags-common += $(call ld-option,--no-warn-execstack)
-+endif
-+
- link-ldflags  = $(LDFLAGS)
- ifeq ($(CFG_CORE_ASLR),y)
- link-ldflags += -pie -Bsymbolic -z notext -z norelro $(ldflag-apply-dynamic-relocs)
-@@ -17,7 +22,7 @@ link-ldflags += -T $(link-script-pp) -Map=$(link-out-dir)/tee.map
- link-ldflags += --sort-section=alignment
- link-ldflags += --fatal-warnings
- link-ldflags += --gc-sections
--link-ldflags += $(call ld-option,--no-warn-rwx-segments)
-+link-ldflags += $(link-ldflags-common)
- 
- link-ldadd  = $(LDADD)
- link-ldadd += $(ldflags-external)
-@@ -39,7 +44,7 @@ link-script-cppflags := \
- 		$(cppflagscore))
- 
- ldargs-all_objs := -T $(link-script-dummy) --no-check-sections \
--		   $(call ld-option,--no-warn-rwx-segments) \
-+		   $(link-ldflags-common) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles += $(link-out-dir)/all_objs.o
- $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
-@@ -53,7 +58,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/all_objs.o
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
- 
- unpaged-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
--		 $(call ld-option,--no-warn-rwx-segments)
-+		 $(link-ldflags-common)
- unpaged-ldadd := $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles += $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -82,7 +87,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_objs.o
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
- 
- init-ldargs := -T $(link-script-dummy) --no-check-sections --gc-sections \
--	       $(call ld-option,--no-warn-rwx-segments)
-+	       $(link-ldflags-common)
- init-ldadd := $(link-objs-init) $(link-out-dir)/version.o  $(link-ldadd) \
- 	      $(libgcccore)
- cleanfiles += $(link-out-dir)/init.o
-diff --git a/ldelf/link.mk b/ldelf/link.mk
-index 8fafc879..d8a05ea6 100644
---- a/ldelf/link.mk
-+++ b/ldelf/link.mk
-@@ -19,6 +19,10 @@ link-ldflags += --sort-section=alignment
- link-ldflags += -z max-page-size=4096 # OP-TEE always uses 4K alignment
- link-ldflags += $(link-ldflags$(sm))
- 
-+ifeq ($(CFG_ARM32_$(sm)), y)
-+link-ldflags += $(call ld-option,--no-warn-execstack)
-+endif
-+
- link-ldadd  = $(addprefix -L,$(libdirs))
- link-ldadd += --start-group $(addprefix -l,$(libnames)) --end-group
- ldargs-ldelf.elf := $(link-ldflags) $(objs) $(link-ldadd) $(libgcc$(sm))
diff --git a/meta-arm/recipes-security/optee/optee-os/3.14/0010-add-note-GNU-stack-section.patch b/meta-arm/recipes-security/optee/optee-os/3.14/0010-add-note-GNU-stack-section.patch
deleted file mode 100644
index c0330b9f..00000000
--- a/meta-arm/recipes-security/optee/optee-os/3.14/0010-add-note-GNU-stack-section.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From f99a0278ad5e26772b3dcf8c74b5bf986ecfbe1e Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 23 Aug 2022 12:31:46 +0000
-Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack section to
-
- .S files
-
-When building for arm32 with GNU binutils 2.39, the linker outputs
-warnings when linking Trusted Applications:
-
- arm-unknown-linux-uclibcgnueabihf-ld.bfd: warning: utee_syscalls_a32.o: missing .note.GNU-stack section implies executable stack
- arm-unknown-linux-uclibcgnueabihf-ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
-
-We could silence the warning by adding the '-z execstack' option to the
-TA link flags, like we did in the parent commit for the TEE core and
-ldelf. Indeed, ldelf always allocates a non-executable piece of memory
-for the TA to use as a stack.
-
-However it seems preferable to comply with the common ELF practices in
-this case. A better fix is therefore to add the missing .note.GNU-stack
-sections in the assembler files.
-
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5499]
-
----
- lib/libutee/arch/arm/utee_syscalls_a32.S             | 2 ++
- lib/libutils/ext/arch/arm/atomic_a32.S               | 2 ++
- lib/libutils/ext/arch/arm/mcount_a32.S               | 2 ++
- lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S  | 2 ++
- lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S | 2 ++
- lib/libutils/isoc/arch/arm/setjmp_a32.S              | 2 ++
- ta/arch/arm/ta_entry_a32.S                           | 2 ++
- 7 files changed, 14 insertions(+)
-
-diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch/arm/utee_syscalls_a32.S
-index 6e621ca6..af405f62 100644
---- a/lib/libutee/arch/arm/utee_syscalls_a32.S
-+++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
-@@ -7,6 +7,8 @@
- #include <tee_syscall_numbers.h>
- #include <asm.S>
- 
-+	.section .note.GNU-stack,"",%progbits
-+
-         .section .text
-         .balign 4
-         .code 32
-diff --git a/lib/libutils/ext/arch/arm/atomic_a32.S b/lib/libutils/ext/arch/arm/atomic_a32.S
-index eaef6914..2be73ffa 100644
---- a/lib/libutils/ext/arch/arm/atomic_a32.S
-+++ b/lib/libutils/ext/arch/arm/atomic_a32.S
-@@ -5,6 +5,8 @@
- 
- #include <asm.S>
- 
-+	.section .note.GNU-stack,"",%progbits
-+
- /* uint32_t atomic_inc32(uint32_t *v); */
- FUNC atomic_inc32 , :
- 	ldrex	r1, [r0]
-diff --git a/lib/libutils/ext/arch/arm/mcount_a32.S b/lib/libutils/ext/arch/arm/mcount_a32.S
-index 51439a23..54dc3c02 100644
---- a/lib/libutils/ext/arch/arm/mcount_a32.S
-+++ b/lib/libutils/ext/arch/arm/mcount_a32.S
-@@ -7,6 +7,8 @@
- 
- #if defined(CFG_TA_GPROF_SUPPORT) || defined(CFG_FTRACE_SUPPORT)
- 
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * Convert return address to call site address by subtracting the size of the
-  * mcount call instruction (blx __gnu_mcount_nc).
-diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-index a600c879..37ae9ec6 100644
---- a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-+++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-@@ -5,6 +5,8 @@
- 
- #include <asm.S>
- 
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * signed ret_idivmod_values(signed quot, signed rem);
-  * return quotient and remaining the EABI way (regs r0,r1)
-diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-index 2dc50bc9..5c3353e2 100644
---- a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-+++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-@@ -5,6 +5,8 @@
- 
- #include <asm.S>
- 
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * __value_in_regs lldiv_t __aeabi_ldivmod( long long n, long long d)
-  */
-diff --git a/lib/libutils/isoc/arch/arm/setjmp_a32.S b/lib/libutils/isoc/arch/arm/setjmp_a32.S
-index 43ea5937..f8a0b70d 100644
---- a/lib/libutils/isoc/arch/arm/setjmp_a32.S
-+++ b/lib/libutils/isoc/arch/arm/setjmp_a32.S
-@@ -51,6 +51,8 @@
- #define SIZE(x)
- #endif
- 
-+	.section .note.GNU-stack,"",%progbits
-+
- /* Arm/Thumb interworking support:
- 
-    The interworking scheme expects functions to use a BX instruction
-diff --git a/ta/arch/arm/ta_entry_a32.S b/ta/arch/arm/ta_entry_a32.S
-index d2f8a69d..cd9a12f9 100644
---- a/ta/arch/arm/ta_entry_a32.S
-+++ b/ta/arch/arm/ta_entry_a32.S
-@@ -5,6 +5,8 @@
- 
- #include <asm.S>
- 
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * This function is the bottom of the user call stack. Mark it as such so that
-  * the unwinding code won't try to go further down.
diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
deleted file mode 100644
index 6400ac2a..00000000
--- a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require optee-os.inc
-
-SRCREV = "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
-
-DEPENDS = "python3-pycryptodome-native python3-pyelftools-native"
-
-SRC_URI:append = " \
-    file://3.14/0009-add-z-execstack.patch \
-    file://3.14/0010-add-note-GNU-stack-section.patch \
-   "
diff --git a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
index f459efce..59e58ed3 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.18.0.bb
@@ -5,6 +5,6 @@ DEPENDS += "dtc-native"
 SRCREV = "1ee647035939e073a2e8dddb727c0f019cc035f1"
 SRC_URI:append = " \
     file://0001-core-Define-section-attributes-for-clang.patch \
-    file://3.18/0009-add-z-execstack.patch \
-    file://3.18/0010-add-note-GNU-stack-section.patch \
+    file://0009-add-z-execstack.patch \
+    file://0010-add-note-GNU-stack-section.patch \
    "
diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
deleted file mode 100644
index 6367c276..00000000
--- a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require optee-test.inc
-
-SRCREV = "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
-- 
2.17.1


