Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9821.1603099639766400224
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 02:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: brett.warren@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A110101E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:19 -0700 (PDT)
Received: from e125157.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84CA23F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 19 Oct 2020 02:27:18 -0700 (PDT)
From: "Brett Warren" <brett.warren@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v3 2/6] optee: upgraded recipes to 3.10
Date: Mon, 19 Oct 2020 10:27:08 +0100
Message-Id: <20201019092712.13467-2-brett.warren@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019092712.13467-1-brett.warren@arm.com>
References: <20201019092712.13467-1-brett.warren@arm.com>

The optee recipes were upgraded due to issues booting with 3.8
on qemuarm64-secureboot, which were resolved by the upgrade.
The 3.8 recipes are retained for backwards compatibility.

optee-test and optee-examples were modified to pass a sysroot
to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
of the libgcc library.

Recipes have been renamed to reflect their current version.
As this makes the PV variables redundent, these have been removed.

Change-Id: Iacaba02d64570a790d5cc20eca8be58246e39019
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
 .../{optee-client_git.bb => optee-client_3.10.0.bb}    |  4 +---
 .../{optee-client_git.bb => optee-client_3.8.0.bb}     |  2 --
 ...{optee-examples_git.bb => optee-examples_3.10.0.bb} |  5 ++---
 .../{optee-examples_git.bb => optee-examples_3.8.0.bb} |  3 +--
 .../optee/{optee-os_git.bb => optee-os_3.10.0.bb}      | 10 +---------
 .../optee/{optee-os_git.bb => optee-os_3.8.0.bb}       |  2 --
 .../optee/{optee-test_git.bb => optee-test_3.10.0.bb}  |  5 ++---
 .../optee/{optee-test_git.bb => optee-test_3.8.0.bb}   |  3 +--
 8 files changed, 8 insertions(+), 26 deletions(-)
 copy meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.10.0.bb} (95%)
 rename meta-arm/recipes-security/optee/{optee-client_git.bb => optee-client_3.8.0.bb} (98%)
 copy meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.10.0.bb} (92%)
 rename meta-arm/recipes-security/optee/{optee-examples_git.bb => optee-examples_3.8.0.bb} (95%)
 copy meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.10.0.bb} (81%)
 rename meta-arm/recipes-security/optee/{optee-os_git.bb => optee-os_3.8.0.bb} (98%)
 copy meta-arm/recipes-security/optee/{optee-test_git.bb => optee-test_3.10.0.bb} (93%)
 rename meta-arm/recipes-security/optee/{optee-test_git.bb => optee-test_3.8.0.bb} (96%)

diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
similarity index 95%
copy from meta-arm/recipes-security/optee/optee-client_git.bb
copy to meta-arm/recipes-security/optee/optee-client_3.10.0.bb
index 5dbbfe9..cbd3b93 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
@@ -5,13 +5,11 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.8.0+git${SRCPV}"
-
 require optee.inc
 
 inherit python3native systemd update-rc.d
 
-SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
+SRCREV = "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_client.git \
     file://tee-supplicant.service \
diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
similarity index 98%
rename from meta-arm/recipes-security/optee/optee-client_git.bb
rename to meta-arm/recipes-security/optee/optee-client_3.8.0.bb
index 5dbbfe9..d43ebf4 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
-PV = "3.8.0+git${SRCPV}"
-
 require optee.inc
 
 inherit python3native systemd update-rc.d
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
similarity index 92%
copy from meta-arm/recipes-security/optee/optee-examples_git.bb
copy to meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
index 71be593..4a7db10 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
 
-PV = "3.8.0+git${SRCPV}"
-
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
 inherit python3native
@@ -16,7 +14,7 @@ require optee.inc
 SRC_URI = "git://github.com/linaro-swg/optee_examples.git \
            file://0001-make-Pass-ldflags-during-link.patch \
            "
-SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
+SRCREV = "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
@@ -30,6 +28,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  HOST_CROSS_COMPILE=${TARGET_PREFIX} \
                  TA_CROSS_COMPILE=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  OUTPUT_DIR=${B} \
                "
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
similarity index 95%
rename from meta-arm/recipes-security/optee/optee-examples_git.bb
rename to meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
index 71be593..7ed3dfa 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://github.com/linaro-swg/optee_examples"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=cd95ab417e23b94f381dafc453d70c30"
 
-PV = "3.8.0+git${SRCPV}"
-
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
 inherit python3native
@@ -30,6 +28,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  HOST_CROSS_COMPILE=${TARGET_PREFIX} \
                  TA_CROSS_COMPILE=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  OUTPUT_DIR=${B} \
                "
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
similarity index 81%
copy from meta-arm/recipes-security/optee/optee-os_git.bb
copy to meta-arm/recipes-security/optee/optee-os_3.10.0.bb
index deeb515..369e011 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
@@ -5,23 +5,15 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
-PV = "3.8.0+git${SRCPV}"
-
 inherit deploy python3native
 require optee.inc
 
 DEPENDS = "python3-pycryptodome-native python3-pycryptodomex-native python3-pyelftools-native"
 
-SRCREV = "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
+SRCREV = "d1c635434c55b7d75eadf471bde04926bd1e50a7"
 SRC_URI = " \
     git://github.com/OP-TEE/optee_os.git \
-    file://0001-mk-compile.mk-fix-cc-option-macro.patch \
-    file://0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
-    file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
-    file://0004-Cleanup-unused-comp-cflags-sm-from-libgcc-lookup-com.patch \
-    file://0005-Fixup-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
     file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
-    file://missing-mkdir.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
similarity index 98%
rename from meta-arm/recipes-security/optee/optee-os_git.bb
rename to meta-arm/recipes-security/optee/optee-os_3.8.0.bb
index deeb515..0001271 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE = "https://www.op-tee.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 
-PV = "3.8.0+git${SRCPV}"
-
 inherit deploy python3native
 require optee.inc
 
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
similarity index 93%
copy from meta-arm/recipes-security/optee/optee-test_git.bb
copy to meta-arm/recipes-security/optee/optee-test_3.10.0.bb
index 957286c..96e612a 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
@@ -10,9 +10,7 @@ require optee.inc
 
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
-PV = "3.8.0+git${SRCPV}"
-
-SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
+SRCREV = "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
           "
@@ -29,6 +27,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  CROSS_COMPILE_HOST=${TARGET_PREFIX} \
                  CROSS_COMPILE_TA=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  O=${B} \
                "
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
similarity index 96%
rename from meta-arm/recipes-security/optee/optee-test_git.bb
rename to meta-arm/recipes-security/optee/optee-test_3.8.0.bb
index 957286c..65e6cd1 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
@@ -10,8 +10,6 @@ require optee.inc
 
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
-PV = "3.8.0+git${SRCPV}"
-
 SRCREV = "30481e381cb4285706e7516853495a7699c93b2c"
 SRC_URI = "git://github.com/OP-TEE/optee_test.git \
            file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
@@ -29,6 +27,7 @@ EXTRA_OEMAKE = " TA_DEV_KIT_DIR=${TA_DEV_KIT_DIR} \
                  TEEC_EXPORT=${TEEC_EXPORT} \
                  CROSS_COMPILE_HOST=${TARGET_PREFIX} \
                  CROSS_COMPILE_TA=${TARGET_PREFIX} \
+                 LIBGCC_LOCATE_CFLAGS=--sysroot=${STAGING_DIR_HOST} \
                  V=1 \
                  O=${B} \
                "
-- 
2.17.1

