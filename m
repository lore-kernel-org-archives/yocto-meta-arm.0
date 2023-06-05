Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0CCC7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:02:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6914.1685970122549539891
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 06:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251F9152B
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:47 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70A243F663
	for <meta-arm@lists.yoctoproject.org>; Mon,  5 Jun 2023 06:02:01 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm-bsp/optee: Remove unreferenced patches
Date: Mon,  5 Jun 2023 08:01:54 -0500
Message-Id: <20230605130156.3309199-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230605130156.3309199-1-jon.mason@arm.com>
References: <20230605130156.3309199-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 05 Jun 2023 13:02:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4725

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ow-setting-sysroot-for-libgcc-lookup.patch | 35 ----------
 ...0007-allow-setting-sysroot-for-clang.patch | 30 ---------
 .../files/0008-no-warn-rwx-segments.patch     | 65 -------------------
 .../recipes-devtools/fiptool/files/ssl.patch  | 52 ---------------
 4 files changed, 182 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/0006-allow-=
setting-sysroot-for-libgcc-lookup.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/0007-allow-=
setting-sysroot-for-clang.patch
 delete mode 100644 meta-arm-bsp/recipes-security/optee/files/0008-no-war=
n-rwx-segments.patch
 delete mode 100644 meta-arm/recipes-devtools/fiptool/files/ssl.patch

diff --git a/meta-arm-bsp/recipes-security/optee/files/0006-allow-setting=
-sysroot-for-libgcc-lookup.patch b/meta-arm-bsp/recipes-security/optee/fi=
les/0006-allow-setting-sysroot-for-libgcc-lookup.patch
deleted file mode 100644
index b838335e..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/0006-allow-setting-sysroo=
t-for-libgcc-lookup.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4b2c1a31efe0c5514ae27e696e75659b55e41259 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 26 May 2020 14:38:02 -0500
-Subject: [PATCH] allow setting sysroot for libgcc lookup
-
-Explicitly pass the new variable LIBGCC_LOCATE_CFLAGS variable when sear=
ching
-for the compiler libraries as there's no easy way to reliably pass --sys=
root
-otherwise.
-
-Upstream-Status: Pending [https://github.com/OP-TEE/optee_os/issues/4188=
]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- mk/gcc.mk | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mk/gcc.mk b/mk/gcc.mk
-index adc77a24..81bfa78a 100644
---- a/mk/gcc.mk
-+++ b/mk/gcc.mk
-@@ -13,11 +13,11 @@ nostdinc$(sm)	:=3D -nostdinc -isystem $(shell $(CC$(=
sm)) \
- 			-print-file-name=3Dinclude 2> /dev/null)
-=20
- # Get location of libgcc from gcc
--libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)  	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$=
(arch-bits-$(sm))) \
- 			-print-libgcc-file-name 2> /dev/null)
--libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libstdc++$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibstdc++.a 2> /dev/null)
--libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $=
(comp-cxxflags$(sm)) \
-+libgcc_eh$(sm)	:=3D $(shell $(CXX$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CXXFL=
AGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
- 			-print-file-name=3Dlibgcc_eh.a 2> /dev/null)
-=20
- # Define these to something to discover accidental use
diff --git a/meta-arm-bsp/recipes-security/optee/files/0007-allow-setting=
-sysroot-for-clang.patch b/meta-arm-bsp/recipes-security/optee/files/0007=
-allow-setting-sysroot-for-clang.patch
deleted file mode 100644
index d5e36948..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/0007-allow-setting-sysroo=
t-for-clang.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 992bed8a62c75aab034fe53d6329fa7c15cf06ee Mon Sep 17 00:00:00 2001
-From: Brett Warren <brett.warren@arm.com>
-Date: Wed, 23 Sep 2020 09:27:34 +0100
-Subject: [PATCH] optee: enable clang support
-
-When compiling with clang, the LIBGCC_LOCATE_CFLAG variable used
-to provide a sysroot wasn't included, which results in not locating
-compiler-rt. This is mitigated by including the variable as ammended.
-
-Upstream-Status: Pending
-ChangeId: 8ba69a4b2eb8ebaa047cb266c9aa6c2c3da45701
-Signed-off-by: Brett Warren <brett.warren@arm.com>
-
----
- mk/clang.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mk/clang.mk b/mk/clang.mk
-index 0f48c836..47465523 100644
---- a/mk/clang.mk
-+++ b/mk/clang.mk
-@@ -27,7 +27,7 @@ comp-cflags-warns-clang :=3D -Wno-language-extension-t=
oken \
-=20
- # Note, use the compiler runtime library (libclang_rt.builtins.*.a) ins=
tead of
- # libgcc for clang
--libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
-+libgcc$(sm)	:=3D $(shell $(CC$(sm)) $(LIBGCC_LOCATE_CFLAGS) $(CFLAGS$(a=
rch-bits-$(sm))) \
- 			-rtlib=3Dcompiler-rt -print-libgcc-file-name 2> /dev/null)
-=20
- # Core ASLR relies on the executable being ready to run from its prefer=
red load
diff --git a/meta-arm-bsp/recipes-security/optee/files/0008-no-warn-rwx-s=
egments.patch b/meta-arm-bsp/recipes-security/optee/files/0008-no-warn-rw=
x-segments.patch
deleted file mode 100644
index 40482282..00000000
--- a/meta-arm-bsp/recipes-security/optee/files/0008-no-warn-rwx-segments=
.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 3126adccaf9c9dc669bb7e1f96326c03da4b570d Mon Sep 17 00:00:00 2001
-From: Jerome Forissier <jerome.forissier@linaro.org>
-Date: Fri, 5 Aug 2022 09:48:03 +0200
-Subject: [PATCH] core: link: add --no-warn-rwx-segments
-
-Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
-Upstream-Status: Backport [https://github.com/OP-TEE/optee_os/pull/5474]
-
-binutils ld.bfd generates one RWX LOAD segment by merging several sectio=
ns
-with mixed R/W/X attributes (.text, .rodata, .data). After version 2.38 =
it
-also warns by default when that happens [1], which breaks the build due =
to
---fatal-warnings. The RWX segment is not a problem for the TEE core, sin=
ce
-that information is not used to set memory permissions. Therefore, silen=
ce
-the warning.
-
-Link: [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
ba951afb99912da01a6e8434126b8fac7aa75107
-Link: https://sourceware.org/bugzilla/show_bug.cgi?id=3D29448
-Reported-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
-Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
-Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
-
----
- core/arch/arm/kernel/link.mk | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 69375ad6..bea239cf 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -17,6 +17,7 @@ link-ldflags +=3D -T $(link-script-pp) -Map=3D$(link-o=
ut-dir)/tee.map
- link-ldflags +=3D --sort-section=3Dalignment
- link-ldflags +=3D --fatal-warnings
- link-ldflags +=3D --gc-sections
-+link-ldflags +=3D $(call ld-option,--no-warn-rwx-segments)
-=20
- link-ldadd  =3D $(LDADD)
- link-ldadd +=3D $(libdeps)
-@@ -37,6 +38,7 @@ link-script-cppflags :=3D \
- 		$(cppflagscore))
-=20
- ldargs-all_objs :=3D -T $(link-script-dummy) --no-check-sections \
-+		   $(call ld-option,--no-warn-rwx-segments) \
- 		   $(link-objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/all_objs.o
- $(link-out-dir)/all_objs.o: $(objs) $(libdeps) $(MAKEFILE_LIST)
-@@ -49,7 +51,8 @@ $(link-out-dir)/unpaged_entries.txt: $(link-out-dir)/a=
ll_objs.o
- 	$(q)$(NMcore) $< | \
- 		$(AWK) '/ ____keep_pager/ { printf "-u%s ", $$3 }' > $@
-=20
--unpaged-ldargs =3D -T $(link-script-dummy) --no-check-sections --gc-sec=
tions
-+unpaged-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-se=
ctions \
-+		 $(call ld-option,--no-warn-rwx-segments)
- unpaged-ldadd :=3D $(objs) $(link-ldadd) $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/unpaged.o
- $(link-out-dir)/unpaged.o: $(link-out-dir)/unpaged_entries.txt
-@@ -77,7 +80,8 @@ $(link-out-dir)/init_entries.txt: $(link-out-dir)/all_=
objs.o
- 	$(q)$(NMcore) $< | \
- 		$(AWK) '/ ____keep_init/ { printf "-u%s ", $$3 }' > $@
-=20
--init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons
-+init-ldargs :=3D -T $(link-script-dummy) --no-check-sections --gc-secti=
ons \
-+	       $(call ld-option,--no-warn-rwx-segments)
- init-ldadd :=3D $(link-objs-init) $(link-out-dir)/version.o  $(link-lda=
dd) \
- 	      $(libgcccore)
- cleanfiles +=3D $(link-out-dir)/init.o
diff --git a/meta-arm/recipes-devtools/fiptool/files/ssl.patch b/meta-arm=
/recipes-devtools/fiptool/files/ssl.patch
deleted file mode 100644
index cdabd1b7..00000000
--- a/meta-arm/recipes-devtools/fiptool/files/ssl.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-fiptool: respect OPENSSL_DIR
-
-fiptool links to libcrypto, so as with the other tools it should respect
-OPENSSL_DIR for include/library paths.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/Makefile b/Makefile
-index ec6f88585..2d3b9fc26 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1388,7 +1388,7 @@ fwu_fip: ${BUILD_PLAT}/${FWU_FIP_NAME}
-=20
- ${FIPTOOL}: FORCE
- ifdef UNIX_MK
--	${Q}${MAKE} CPPFLAGS=3D"-DVERSION=3D'\"${VERSION_STRING}\"'" FIPTOOL=3D=
${FIPTOOL} --no-print-directory -C ${FIPTOOLPATH}
-+	${Q}${MAKE} CPPFLAGS=3D"-DVERSION=3D'\"${VERSION_STRING}\"'" FIPTOOL=3D=
${FIPTOOL} OPENSSL_DIR=3D${OPENSSL_DIR} --no-print-directory -C ${FIPTOOL=
PATH}
- else
- # Clear the MAKEFLAGS as we do not want
- # to pass the gnumake flags to nmake.
-diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
-index 11d2e7b0b..7c2a08379 100644
---- a/tools/fiptool/Makefile
-+++ b/tools/fiptool/Makefile
-@@ -12,6 +12,8 @@ FIPTOOL ?=3D fiptool${BIN_EXT}
- PROJECT :=3D $(notdir ${FIPTOOL})
- OBJECTS :=3D fiptool.o tbbr_config.o
- V ?=3D 0
-+OPENSSL_DIR :=3D /usr
-+
-=20
- override CPPFLAGS +=3D -D_GNU_SOURCE -D_XOPEN_SOURCE=3D700
- HOSTCCFLAGS :=3D -Wall -Werror -pedantic -std=3Dc99
-@@ -20,7 +22,7 @@ ifeq (${DEBUG},1)
- else
-   HOSTCCFLAGS +=3D -O2
- endif
--LDLIBS :=3D -lcrypto
-+LDLIBS :=3D -L${OPENSSL_DIR}/lib -lcrypto
-=20
- ifeq (${V},0)
-   Q :=3D @
-@@ -28,7 +30,7 @@ else
-   Q :=3D
- endif
-=20
--INCLUDE_PATHS :=3D -I../../include/tools_share
-+INCLUDE_PATHS :=3D -I../../include/tools_share  -I${OPENSSL_DIR}/includ=
e
-=20
- HOSTCC ?=3D gcc
-=20
--=20
2.30.2


