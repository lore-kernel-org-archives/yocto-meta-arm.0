Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9822.1603099640518101413
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 02:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F98A13D5
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:20 -0700 (PDT)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A7E03F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:19 -0700 (PDT)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v3 3/6] optee: enable clang support
Date: Mon, 19 Oct 2020 10:27:09 +0100
Message-Id: <20201019092712.13467-3-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019092712.13467-1-brett.warren@arm.com>
References: <20201019092712.13467-1-brett.warren@arm.com>

Patch 0002 and 0003 in optee-test remove -W options from make
to enable successful compilation with clang.

Patch 0007 modifies the libgcc$(sm) variable in optee so that it can
find the compiler-rt dependencies. Compiler-rt is also added as a
dependency to the optee recipe.

The compiler in use is passed to make via TOOLCHAIN. If TOOLCHAIN
doesn't exist (it is declared by meta-clang, and so doesn't exist
by default), 'gcc' is passed as a default.

These modifications allow optee to be successfully compiled
when TOOLCHAIN=clang

Change-Id: If565969e169078fabd5e3cf5716ca317cc49a126
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 .../optee/optee-examples_3.10.0.bb            |  2 ++
 .../optee/optee-examples_3.8.0.bb             |  2 ++
 ...0007-allow-setting-sysroot-for-clang.patch | 29 +++++++++++++++++
 .../recipes-security/optee/optee-os_3.10.0.bb |  5 +++
 ...ake-remove-Wno-unsafe-loop-for-clang.patch | 31 +++++++++++++++++++
 ...e-remove-Wmissing-noreturn-for-clang.patch | 31 +++++++++++++++++++
 .../optee/optee-test_3.10.0.bb                |  4 +++
 .../optee/optee-test_3.8.0.bb                 |  4 +++
 8 files changed, 108 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch

diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
index 4a7db10..2f3cc09 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
@@ -22,12 +22,14 @@ B = "${WORKDIR}/build"
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
+OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 
 EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  HOST_CROSS_COMPILE=${TARGET_PREFIX} \
                  TA_CROSS_COMPILE=${TARGET_PREFIX} \
+                 COMPILER=${OPTEE_COMPILER} \
                  LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  OUTPUT_DIR=${B} \
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
index 7ed3dfa..f10b04d 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
@@ -22,12 +22,14 @@ B = "${WORKDIR}/build"
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR = "${STAGING_INCDIR}/optee/export-user_ta"
+OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 
 EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  HOST_CROSS_COMPILE=${TARGET_PREFIX} \
                  TA_CROSS_COMPILE=${TARGET_PREFIX} \
+                 COMPILER=${OPTEE_COMPILER} \
                  LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  OUTPUT_DIR=${B} \
diff --git a/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch b/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
new file mode 100644
index 0000000..5c0d0a5
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os/0007-allow-setting-sysroot-for-clang.patch
@@ -0,0 +1,29 @@
+From 3167f2c0dba4db59d61b60a8fe66f969d20aafa9 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
index 369e011..adc8510 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
@@ -10,10 +10,13 @@ require optee.inc
 
 DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
 
+DEPENDS_append_toolchain-clang = " compiler-rt"
+
 SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_os.git \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
+    file://0007-allow-setting-sysroot-for-clang.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -25,12 +28,14 @@ OPTEE_ARCH = "null"
 OPTEE_ARCH_armv7a = "arm32"
 OPTEE_ARCH_aarch64 = "arm64"
 OPTEE_CORE = "${@d.getVar('OPTEE_ARCH').upper()}"
+OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 
 EXTRA_OEMAKE = " \
     PLATFORM=${OPTEEMACHINE} \
     CFG_${OPTEE_CORE}_core=y \
     CROSS_COMPILE_core=${HOST_PREFIX} \
     CROSS_COMPILE_ta_${OPTEE_ARCH}=${HOST_PREFIX} \
+    COMPILER=${OPTEE_COMPILER} \
     NOWERROR=1 \
     V=1 \
     ta-targets=ta_${OPTEE_ARCH} \
diff --git a/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch b/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
new file mode 100644
index 0000000..ef09c56
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
@@ -0,0 +1,31 @@
+From 438533ce9da1df0b7c7914e64b39ffdc1da1ab79 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warran@arm.com>
+Date: Thu, 8 Oct 2020 10:03:25 +0100
+Subject: [PATCH] make: remove -Wmissing-noreturn for clang
+
+When compiling when clang, -Wmissing-noreturn causes an error because
+of non-compliant code. This option is removed to workaround this.
+
+Upstream-Status: Pending
+Changed-Id: 71cb511904547d790d1ea98f93bf8e5a6afcb36d
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ host/xtest/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 3c206b0..96746de 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -169,7 +169,7 @@ CFLAGS += -Wall -Wcast-align -Werror \
+ 	  -Werror-implicit-function-declaration -Wextra -Wfloat-equal \
+ 	  -Wformat-nonliteral -Wformat-security -Wformat=2 -Winit-self \
+ 	  -Wmissing-declarations -Wmissing-format-attribute \
+-	  -Wmissing-include-dirs -Wmissing-noreturn \
++	  -Wmissing-include-dirs \
+ 	  -Wmissing-prototypes -Wnested-externs -Wpointer-arith \
+ 	  -Wshadow -Wstrict-prototypes -Wswitch-default \
+ 	  -Wwrite-strings \
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch b/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
new file mode 100644
index 0000000..b265e81
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
@@ -0,0 +1,31 @@
+From ed5a9d9f7a3e9e14ca0e8aea59008124ee0e5f96 Mon Sep 17 00:00:00 2001
+From: Brett Warren <brett.warren@arm.com>
+Date: Thu, 8 Oct 2020 10:20:52 +0100
+Subject: [PATCH] make: remove -Wno-unsafe-loop for clang
+
+When compiling with clang, the -Wno-unsafe-loop-optimizations option
+throws an error because clang doesn't recognise it. This option is
+removed to workaround this.
+
+Upstream-Status: Pending
+Change-Id: 5fe0892c73208aaffac8c9995cb3275936fb1ba6
+Signed-off-by: Brett Warren <brett.warren@arm.com>
+---
+ host/xtest/Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 96746de..73731d0 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -174,7 +174,6 @@ CFLAGS += -Wall -Wcast-align -Werror \
+ 	  -Wshadow -Wstrict-prototypes -Wswitch-default \
+ 	  -Wwrite-strings \
+ 	  -Wno-declaration-after-statement \
+-	  -Wno-unsafe-loop-optimizations \
+ 	  -Wno-missing-field-initializers -Wno-format-zero-length
+ endif
+ 
+-- 
+2.17.1
+
diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
index 96e612a..6541de4 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
@@ -13,6 +13,8 @@ DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
+           file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \
+           file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -21,12 +23,14 @@ B = "${WORKDIR}/build"
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
+OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 
 EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  CROSS_COMPILE_HOST=${TARGET_PREFIX} \
                  CROSS_COMPILE_TA=${TARGET_PREFIX} \
+                 COMPILER=${OPTEE_COMPILER} \
                  LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  O=${B} \
diff --git a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
index 65e6cd1..7f3d49b 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
@@ -13,6 +13,8 @@ DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
+           file://0002-make-remove-Wno-unsafe-loop-for-clang.patch  \
+           file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -21,12 +23,14 @@ B = "${WORKDIR}/build"
 OPTEE_CLIENT_EXPORT = "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT         = "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR      = "${STAGING_INCDIR}/optee/export-user_ta"
+OPTEE_COMPILER = "${@d.getVar('TOOLCHAIN') or 'gcc'}"
 
 EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  OPTEE_CLIENT_EXPORT=${OPTEE_CLIENT_EXPORT} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  CROSS_COMPILE_HOST=${TARGET_PREFIX} \
                  CROSS_COMPILE_TA=${TARGET_PREFIX} \
+                 COMPILER=${OPTEE_COMPILER} \
                  LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  O=${B} \
-- 
2.17.1

