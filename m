Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7C8C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:38:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.200409.1698327513743023605
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Oct 2023 06:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C7A41424
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 06:39:14 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4465D3F64C
	for <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 06:38:31 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp/optee: remove 3.18 recipes and patches
Date: Wed, 25 Oct 2023 17:44:47 -0500
Message-Id: <20231025224448.3921419-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Oct 2023 13:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5180

3.18 recipes and patches are no longer in use and can be removed

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client_3.18.0.bb              |   3 -
 ...0005-core-ldelf-link-add-z-execstack.patch |  93 -------------
 ...ibutee-ta-add-.note.GNU-stack-sectio.patch | 127 ------------------
 .../optee/optee-os-tadevkit_3.18.0.bb         |  24 ----
 .../optee/optee-os-tadevkit_3.18.0.bbappend   |   6 -
 .../recipes-security/optee/optee-os_3.18.0.bb |  15 ---
 .../optee/optee-os_3.18.0.bbappend            |   6 -
 .../optee/optee-test_3.18.0.bb                |  10 --
 8 files changed, 284 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client_3.18=
.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0=
005-core-ldelf-link-add-z-execstack.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0=
006-arm32-libutils-libutee-ta-add-.note.GNU-stack-sectio.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.18.0.bb
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os-tadevkit=
_3.18.0.bbappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.b=
b
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.b=
bappend
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-test_3.18.0=
.bb

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client_3.18.0.bb b=
/meta-arm-bsp/recipes-security/optee/optee-client_3.18.0.bb
deleted file mode 100644
index ea7b65ce..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client_3.18.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-SRCREV =3D "e7cba71cc6e2ecd02f412c7e9ee104f0a5dffc6f"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0005-cor=
e-ldelf-link-add-z-execstack.patch b/meta-arm-bsp/recipes-security/optee/=
optee-os-3.18.0/0005-core-ldelf-link-add-z-execstack.patch
deleted file mode 100644
index 862a76b4..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0005-core-ldelf=
-link-add-z-execstack.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 63445958678b58c5adc7eca476b216e5dc0f4195 Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 23 Aug 2022 11:41:00 +0000
-Subject: [PATCH] core, ldelf: link: add -z execstack
-
-When building for arm32 with GNU binutils 2.39, the linker outputs
-warnings when generating some TEE core binaries (all_obj.o, init.o,
-unpaged.o and tee.elf) as well as ldelf.elf:
-
- arm-poky-linux-gnueabi-ld.bfd: warning: atomic_a32.o: missing .note.GNU=
-stack section implies executable stack
- arm-poky-linux-gnueabi-ld.bfd: NOTE: This behaviour is deprecated and w=
ill be removed in a future version of the linker
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
----
- core/arch/arm/kernel/link.mk | 13 +++++++++----
- ldelf/link.mk                |  3 +++
- 2 files changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index c39d43cbfc5b..0e96e606cd9d 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -9,6 +9,11 @@ link-script-dep =3D $(link-out-dir)/.kern.ld.d
-=20
- AWK	 =3D awk
-=20
-+link-ldflags-common +=3D $(call ld-option,--no-warn-rwx-segments)
-+ifeq ($(CFG_ARM32_core),y)
-+link-ldflags-common +=3D $(call ld-option,--no-warn-execstack)
-+endif
-+
- link-ldflags  =3D $(LDFLAGS)
- ifeq ($(CFG_CORE_ASLR),y)
- link-ldflags +=3D -pie -Bsymbolic -z norelro $(ldflag-apply-dynamic-rel=
ocs)
-@@ -31,7 +36,7 @@ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-o=
ut-dir)/tee.map
- link-ldflags +=3D --sort-section=3Dalignment
- link-ldflags +=3D --fatal-warnings
- link-ldflags +=3D --gc-sections
--link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
-+link-ldflags +=3D $(link-ldflags-common)
-=20
- link-ldadd  =3D $(LDADD)
- link-ldadd +=3D $(ldflags-external)
-@@ -56,7 +61,7 @@ link-script-cppflags :=3D \
- 		$(cppflagscore))
-=20
- ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
--		   $(call ld-option,--no-warn-rwx-segments) \
-+		   $(link-ldflags-common) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/all_objs.o
- $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
-@@ -70,7 +75,7 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
-=20
- unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
--		 $(call ld-option,--no-warn-rwx-segments)
-+		 $(link-ldflags-common)
- unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -99,7 +104,7 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all=
_objs.o
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
-=20
- init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
--	       $(call ld-option,--no-warn-rwx-segments)
-+	       $(link-ldflags-common)
- init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
- 	      $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/init.o
-diff --git a/ldelf/link.mk b/ldelf/link.mk
-index 64c8212a06fa..bd49551e7065 100644
---- a/ldelf/link.mk
-+++ b/ldelf/link.mk
-@@ -20,6 +20,9 @@ link-ldflags +=3D -z max-page-size=3D4096 # OP-TEE alw=
ays uses 4K alignment
- ifeq ($(CFG_CORE_BTI),y)
- link-ldflags +=3D $(call ld-option,-z force-bti) --fatal-warnings
- endif
-+ifeq ($(CFG_ARM32_$(sm)), y)
-+link-ldflags +=3D $(call ld-option,--no-warn-execstack)
-+endif
- link-ldflags +=3D $(link-ldflags$(sm))
-=20
- link-ldadd  =3D $(addprefix -L,$(libdirs))
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0006-arm=
32-libutils-libutee-ta-add-.note.GNU-stack-sectio.patch b/meta-arm-bsp/re=
cipes-security/optee/optee-os-3.18.0/0006-arm32-libutils-libutee-ta-add-.=
note.GNU-stack-sectio.patch
deleted file mode 100644
index e82fdc71..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-3.18.0/0006-arm32-libu=
tils-libutee-ta-add-.note.GNU-stack-sectio.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 1a991cbedf8647d5a1e7c312614f7867c3940968 Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Tue, 23 Aug 2022 12:31:46 +0000
-Subject: [PATCH] arm32: libutils, libutee, ta: add .note.GNU-stack secti=
on to
-
- .S files
-
-When building for arm32 with GNU binutils 2.39, the linker outputs
-warnings when linking Trusted Applications:
-
- arm-unknown-linux-uclibcgnueabihf-ld.bfd: warning: utee_syscalls_a32.o:=
 missing .note.GNU-stack section implies executable stack
- arm-unknown-linux-uclibcgnueabihf-ld.bfd: NOTE: This behaviour is depre=
cated and will be removed in a future version of the linker
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
-diff --git a/lib/libutee/arch/arm/utee_syscalls_a32.S b/lib/libutee/arch=
/arm/utee_syscalls_a32.S
-index 6e621ca6e06d..af405f62723c 100644
---- a/lib/libutee/arch/arm/utee_syscalls_a32.S
-+++ b/lib/libutee/arch/arm/utee_syscalls_a32.S
-@@ -7,6 +7,8 @@
- #include <tee_syscall_numbers.h>
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
-         .section .text
-         .balign 4
-         .code 32
-diff --git a/lib/libutils/ext/arch/arm/atomic_a32.S b/lib/libutils/ext/a=
rch/arm/atomic_a32.S
-index eaef6914734e..2be73ffadcc9 100644
---- a/lib/libutils/ext/arch/arm/atomic_a32.S
-+++ b/lib/libutils/ext/arch/arm/atomic_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /* uint32_t atomic_inc32(uint32_t *v); */
- FUNC atomic_inc32 , :
- 	ldrex	r1, [r0]
-diff --git a/lib/libutils/ext/arch/arm/mcount_a32.S b/lib/libutils/ext/a=
rch/arm/mcount_a32.S
-index 51439a23014e..54dc3c02da66 100644
---- a/lib/libutils/ext/arch/arm/mcount_a32.S
-+++ b/lib/libutils/ext/arch/arm/mcount_a32.S
-@@ -7,6 +7,8 @@
-=20
- #if defined(CFG_TA_GPROF_SUPPORT) || defined(CFG_FTRACE_SUPPORT)
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * Convert return address to call site address by subtracting the size =
of the
-  * mcount call instruction (blx __gnu_mcount_nc).
-diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S b/lib/l=
ibutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-index a600c879668c..37ae9ec6f9f1 100644
---- a/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-+++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_divmod_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * signed ret_idivmod_values(signed quot, signed rem);
-  * return quotient and remaining the EABI way (regs r0,r1)
-diff --git a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S b/lib/=
libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-index 2dc50bc98bbf..5c3353e2c1ba 100644
---- a/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-+++ b/lib/libutils/isoc/arch/arm/arm32_aeabi_ldivmod_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * __value_in_regs lldiv_t __aeabi_ldivmod( long long n, long long d)
-  */
-diff --git a/lib/libutils/isoc/arch/arm/setjmp_a32.S b/lib/libutils/isoc=
/arch/arm/setjmp_a32.S
-index 43ea593758c9..f8a0b70df705 100644
---- a/lib/libutils/isoc/arch/arm/setjmp_a32.S
-+++ b/lib/libutils/isoc/arch/arm/setjmp_a32.S
-@@ -51,6 +51,8 @@
- #define SIZE(x)
- #endif
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /* Arm/Thumb interworking support:
-=20
-    The interworking scheme expects functions to use a BX instruction
-diff --git a/ta/arch/arm/ta_entry_a32.S b/ta/arch/arm/ta_entry_a32.S
-index d2f8a69daa7f..cd9a12f9dbf9 100644
---- a/ta/arch/arm/ta_entry_a32.S
-+++ b/ta/arch/arm/ta_entry_a32.S
-@@ -5,6 +5,8 @@
-=20
- #include <asm.S>
-=20
-+	.section .note.GNU-stack,"",%progbits
-+
- /*
-  * This function is the bottom of the user call stack. Mark it as such =
so that
-  * the unwinding code won't try to go further down.
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0=
.bb b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
deleted file mode 100644
index ff0baf8c..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require optee-os_3.18.0.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
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
-FILES:${PN} =3D "${includedir}/optee/"
-
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0=
.bbappend b/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.=
bbappend
deleted file mode 100644
index 0cb9b05e..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os-tadevkit_3.18.0.bbappe=
nd
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_TADEVKIT_REQUIRE:tc =3D "optee-os-tc.inc"
-
-require ${MACHINE_OPTEE_OS_TADEVKIT_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb b/met=
a-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb
deleted file mode 100644
index 6e1e6ad4..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${P}:"
-
-SRCREV =3D "1ee647035939e073a2e8dddb727c0f019cc035f1"
-SRC_URI +=3D " \
-    file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://0002-optee-enable-clang-support.patch \
-    file://0003-core-link-add-no-warn-rwx-segments.patch \
-    file://0004-core-Define-section-attributes-for-clang.patch \
-    file://0005-core-ldelf-link-add-z-execstack.patch \
-    file://0006-arm32-libutils-libutee-ta-add-.note.GNU-stack-sectio.pat=
ch \
-   "
diff --git a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend=
 b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
deleted file mode 100644
index e276fb86..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# Machine specific configurations
-
-MACHINE_OPTEE_OS_REQUIRE ?=3D ""
-MACHINE_OPTEE_OS_REQUIRE:tc =3D "optee-os-tc.inc"
-
-require ${MACHINE_OPTEE_OS_REQUIRE}
diff --git a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb b/m=
eta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
deleted file mode 100644
index cf8ea01b..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-test_3.18.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-SRC_URI +=3D " \
-    file://0001-xtest-regression_1000-remove-unneeded-stat.h-include.pat=
ch \
-   "
-SRCREV =3D "da5282a011b40621a2cf7a296c11a35c833ed91b"
-
-EXTRA_OEMAKE:append:libc-musl =3D " OPTEE_OPENSSL_EXPORT=3D${STAGING_INC=
DIR}"
-DEPENDS:append:libc-musl =3D " openssl"
-CFLAGS:append:libc-musl =3D " -Wno-error=3Ddeprecated-declarations"
--=20
2.30.2


