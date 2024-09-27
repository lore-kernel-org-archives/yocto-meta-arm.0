Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C6ECDD1D0
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 17:45:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.75092.1727459099513504600
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Sep 2024 10:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87F0814BF
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 10:45:28 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC6423F587
	for <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 10:44:58 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/optee-os: Backport the clang fixes
Date: Fri, 27 Sep 2024 13:44:58 -0400
Message-Id: <20240927174458.81044-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Sep 2024 17:45:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6136

The Clang bug in OP-TEE OS has been resolved (see
https://github.com/OP-TEE/optee_os/issues/6754).  Backport those patches
and remove the forcing of GCC in the recipe.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...arm64.h-fix-compile-error-with-Clang.patch | 70 +++++++++++++++++++
 ...002-libutils-zlib-fix-Clang-warnings.patch | 64 +++++++++++++++++
 .../recipes-security/optee/optee-os_4.2.0.bb  |  2 +
 meta-arm/recipes-security/optee/optee.inc     |  3 -
 4 files changed, 136 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-arm64.h=
-fix-compile-error-with-Clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0002-libutil=
s-zlib-fix-Clang-warnings.patch

diff --git a/meta-arm/recipes-security/optee/optee-os/0001-arm64.h-fix-co=
mpile-error-with-Clang.patch b/meta-arm/recipes-security/optee/optee-os/0=
001-arm64.h-fix-compile-error-with-Clang.patch
new file mode 100644
index 000000000000..e4508b3435c6
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0001-arm64.h-fix-compile-e=
rror-with-Clang.patch
@@ -0,0 +1,70 @@
+From dc9fd53be9d69c4a6bc67d9de951b8f2a92abade Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 14 Jun 2024 17:51:22 +0200
+Subject: [PATCH 1/2] arm64.h: fix compile error with Clang
+
+Clang 18.1.6 fails to compile OP-TEE OS with the following error:
+
+   CC      out/arm/core/arch/arm/kernel/vfp.o
+ In file included from core/arch/arm/kernel/vfp.c:6:
+ In file included from core/arch/arm/include/arm.h:137:
+ core/arch/arm/include/arm64.h:455:1: error: expected readable system re=
gister
+   455 | DEFINE_U32_REG_READWRITE_FUNCS(fpcr)
+       | ^
+ core/arch/arm/include/arm64.h:436:3: note: expanded from macro 'DEFINE_=
U32_REG_READWRITE_FUNCS'
+   436 |                 DEFINE_U32_REG_READ_FUNC(reg)   \
+       |                 ^
+ core/arch/arm/include/arm64.h:430:3: note: expanded from macro 'DEFINE_=
U32_REG_READ_FUNC'
+   430 |                 DEFINE_REG_READ_FUNC_(reg, uint32_t, reg)
+       |                 ^
+ core/arch/arm/include/arm64.h:417:15: note: expanded from macro 'DEFINE=
_REG_READ_FUNC_'
+   417 |         asm volatile("mrs %0, " #asmreg : "=3Dr" (val64));     =
   \
+       |                      ^
+ <inline asm>:1:10: note: instantiated into assembly here
+     1 |         mrs x8, fpcr
+       |                 ^
+
+...and similar ones for fpcr write, as well as fpsr read and write.
+
+Clang 12.0.0 does not have any problem with this code which makes me
+think that it's a Clang/LLVM issue.
+
+Work around the problem by using the coded system register identifiers
+S3_3_c4_c4_0 and S3_3_c4_c4_1 instead of fpcr and fpsr, respectively.
+The values 3-3-4-4-0 and 3-3-4-4-1 are taken from the Arm ARM sections
+C.5.2.8 and C.5.2.9.
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Joakim Bech <joakim.bech@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ core/arch/arm/include/arm64.h | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/core/arch/arm/include/arm64.h b/core/arch/arm/include/arm64=
.h
+index 28922631f637..c72b5cd7bbd3 100644
+--- a/core/arch/arm/include/arm64.h
++++ b/core/arch/arm/include/arm64.h
+@@ -452,8 +452,15 @@ static inline __noprof void write_##reg(type val)		=
\
+=20
+ DEFINE_U32_REG_READWRITE_FUNCS(cpacr_el1)
+ DEFINE_U32_REG_READWRITE_FUNCS(daif)
++#ifdef __clang__
++DEFINE_REG_READ_FUNC_(fpcr, uint32_t, S3_3_c4_c4_0)
++DEFINE_REG_WRITE_FUNC_(fpcr, uint32_t, S3_3_c4_c4_0)
++DEFINE_REG_READ_FUNC_(fpsr, uint32_t, S3_3_c4_c4_1)
++DEFINE_REG_WRITE_FUNC_(fpsr, uint32_t, S3_3_c4_c4_1)
++#else
+ DEFINE_U32_REG_READWRITE_FUNCS(fpcr)
+ DEFINE_U32_REG_READWRITE_FUNCS(fpsr)
++#endif
+=20
+ DEFINE_U32_REG_READ_FUNC(ctr_el0)
+ #define read_ctr() read_ctr_el0()
+--=20
+2.39.5
+
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-libutils-zlib-=
fix-Clang-warnings.patch b/meta-arm/recipes-security/optee/optee-os/0002-=
libutils-zlib-fix-Clang-warnings.patch
new file mode 100644
index 000000000000..fb50fecbd01b
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0002-libutils-zlib-fix-Cla=
ng-warnings.patch
@@ -0,0 +1,64 @@
+From 47d5e6cbd61a38d1c31538e6b1775b901273fdec Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Fri, 14 Jun 2024 18:40:53 +0200
+Subject: [PATCH 2/2] libutils, zlib: fix Clang warnings
+
+Clang 18.1.6 reports the following warnings:
+
+   CC      out/arm/ldelf-lib/libutils/isoc/bget_malloc.o
+ In file included from lib/libutils/isoc/bget_malloc.c:127:
+ lib/libutils/isoc/bget.c:607:7: warning: a function definition without =
a prototype is deprecated in all versions of C and is not supported in C2=
3 [-Wdeprecated-non-prototype]
+   607 | void *bget(requested_align, hdr_size, requested_size, poolset)
+       |       ^
+
+And same with lib/zlib/{adler32.c,inffast.c,inflate.c,zutil.c}.
+
+In addition, zutil.c causes:
+
+  CC      out/arm/core/lib/zlib/zutil.o
+core/lib/zlib/zutil.c:28:33: warning: a function declaration without a p=
rototype is deprecated in all versions of C [-Wstrict-prototypes]
+   28 | const char * ZEXPORT zlibVersion()
+      |                                 ^
+      |                                  void
+
+Add -Wno-deprecated-non-prototype to libutils' bget_malloc.c to silence
+the first series, and simply remove -Wstrict-prototypes (added by
+default by mk/compile.mk) when building zlib.
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Acked-by: Joakim Bech <joakim.bech@linaro.org>
+Acked-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream-Status: Backport
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+
+---
+ core/lib/zlib/sub.mk     | 2 ++
+ lib/libutils/isoc/sub.mk | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/core/lib/zlib/sub.mk b/core/lib/zlib/sub.mk
+index d4f225dfbfc4..399544d02e20 100644
+--- a/core/lib/zlib/sub.mk
++++ b/core/lib/zlib/sub.mk
+@@ -6,3 +6,5 @@ srcs-y +=3D inftrees.c
+ srcs-y +=3D zutil.c
+ cflags-remove-y +=3D -Wold-style-definition
+ cflags-remove-y +=3D -Wswitch-default
++cflags-remove-y +=3D -Wstrict-prototypes
++cflags-y +=3D $(call cc-option,-Wno-deprecated-non-prototype)
+diff --git a/lib/libutils/isoc/sub.mk b/lib/libutils/isoc/sub.mk
+index ef1ca5da8cf0..705090211627 100644
+--- a/lib/libutils/isoc/sub.mk
++++ b/lib/libutils/isoc/sub.mk
+@@ -3,6 +3,7 @@ global-incdirs-y +=3D include
+ srcs-y +=3D bget_malloc.c
+ cflags-remove-bget_malloc.c-y +=3D -Wold-style-definition -Wredundant-d=
ecls
+ cflags-bget_malloc.c-y +=3D -Wno-sign-compare -Wno-cast-align
++cflags-bget_malloc.c-y +=3D $(call cc-option,-Wno-deprecated-non-protot=
ype)
+ ifeq ($(sm),core)
+ cflags-remove-bget_malloc.c-y +=3D $(cflags_kasan)
+ endif
+--=20
+2.39.5
+
diff --git a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.2.0.bb
index 33c19f2fa349..3f00c7b3617f 100644
--- a/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_4.2.0.bb
@@ -12,4 +12,6 @@ SRC_URI +=3D " \
     file://0001-compile.mk-use-CFLAGS-from-environment.patch \
     file://0002-link.mk-use-CFLAGS-with-version.o.patch \
     file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
+    file://0001-arm64.h-fix-compile-error-with-Clang.patch \
+    file://0002-libutils-zlib-fix-Clang-warnings.patch \
 "
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes=
-security/optee/optee.inc
index 37676f14960c..c5514f565172 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -14,9 +14,6 @@ OPTEE_ARCH:arm =3D "arm32"
 OPTEE_ARCH:aarch64 =3D "arm64"
 OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
=20
-# FIXME - breaks with Clang 18.  See https://github.com/OP-TEE/optee_os/=
issues/6754
-TOOLCHAIN =3D "gcc"
-
 OPTEE_TOOLCHAIN =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 OPTEE_COMPILER =3D "${@bb.utils.contains("BBFILE_COLLECTIONS", "clang-la=
yer", "${OPTEE_TOOLCHAIN}", "gcc", d)}"
=20
--=20
2.39.3 (Apple Git-146)


