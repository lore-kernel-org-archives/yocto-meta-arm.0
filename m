Return-Path: <abdellatif.elkhlifi@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26782C433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13099.1637683188631550191
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 07:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5760A1FB;
	Tue, 23 Nov 2021 07:59:48 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.78.53])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 470493F5A1;
	Tue, 23 Nov 2021 07:59:46 -0800 (PST)
From: abdellatif.elkhlifi@arm.com
To: meta-arm@lists.yoctoproject.org,
	Arpita.S.K@arm.com,
	vishnu.banavath@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH][honister 05/19] arm/trusted-firmware-a: improve OpenSSL build
 fix
Date: Tue, 23 Nov 2021 15:59:12 +0000
Message-Id: <20211123155926.31743-6-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
References: <20211123155926.31743-1-abdellatif.elkhlifi@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Nov 2021 15:59:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2434

From: Ross Burton <ross@burtonini.com>

Take a patch that is heading upstream to pass OPENSSL_DIR to the fiptool
build, removing the need to alter the Makefiles at build time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../trusted-firmware-a/files/ssl.patch        | 52 +++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a.inc | 20 ++-----
 2 files changed, 57 insertions(+), 15 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch b/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
new file mode 100644
index 0000000..cdabd1b
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/files/ssl.patch
@@ -0,0 +1,52 @@
+fiptool: respect OPENSSL_DIR
+
+fiptool links to libcrypto, so as with the other tools it should respect
+OPENSSL_DIR for include/library paths.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile b/Makefile
+index ec6f88585..2d3b9fc26 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1388,7 +1388,7 @@ fwu_fip: ${BUILD_PLAT}/${FWU_FIP_NAME}
+ 
+ ${FIPTOOL}: FORCE
+ ifdef UNIX_MK
+-	${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} --no-print-directory -C ${FIPTOOLPATH}
++	${Q}${MAKE} CPPFLAGS="-DVERSION='\"${VERSION_STRING}\"'" FIPTOOL=${FIPTOOL} OPENSSL_DIR=${OPENSSL_DIR} --no-print-directory -C ${FIPTOOLPATH}
+ else
+ # Clear the MAKEFLAGS as we do not want
+ # to pass the gnumake flags to nmake.
+diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
+index 11d2e7b0b..7c2a08379 100644
+--- a/tools/fiptool/Makefile
++++ b/tools/fiptool/Makefile
+@@ -12,6 +12,8 @@ FIPTOOL ?= fiptool${BIN_EXT}
+ PROJECT := $(notdir ${FIPTOOL})
+ OBJECTS := fiptool.o tbbr_config.o
+ V ?= 0
++OPENSSL_DIR := /usr
++
+ 
+ override CPPFLAGS += -D_GNU_SOURCE -D_XOPEN_SOURCE=700
+ HOSTCCFLAGS := -Wall -Werror -pedantic -std=c99
+@@ -20,7 +22,7 @@ ifeq (${DEBUG},1)
+ else
+   HOSTCCFLAGS += -O2
+ endif
+-LDLIBS := -lcrypto
++LDLIBS := -L${OPENSSL_DIR}/lib -lcrypto
+ 
+ ifeq (${V},0)
+   Q := @
+@@ -28,7 +30,7 @@ else
+   Q :=
+ endif
+ 
+-INCLUDE_PATHS := -I../../include/tools_share
++INCLUDE_PATHS := -I../../include/tools_share  -I${OPENSSL_DIR}/include
+ 
+ HOSTCC ?= gcc
+ 
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 1fd99e7..36bd037 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -7,7 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit deploy
 
-SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa \
+           file://ssl.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 COMPATIBLE_MACHINE ?= "invalid"
@@ -140,6 +141,8 @@ EXTRA_OEMAKE += "${@bb.utils.contains('SEL2_SPMC', '1', 'ARM_SPMC_MANIFEST_DTS=$
 
 # Tell the tools where the native OpenSSL is located
 EXTRA_OEMAKE += "OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
+# Use the correct native compiler
+EXTRA_OEMAKE += "HOSTCC='${BUILD_CC}'"
 
 # Runtime variables
 EXTRA_OEMAKE += "RUNTIME_SYSROOT=${STAGING_DIR_HOST}"
@@ -148,23 +151,10 @@ BUILD_DIR = "${B}/${TFA_PLATFORM}"
 BUILD_DIR .= "${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
 BUILD_DIR .= "/${@'debug' if d.getVar("TFA_DEBUG") == '1' else 'release'}"
 
-# The following hack is needed to fit properly in yocto build environment
-# TFA is forcing the host compiler and its flags in the Makefile using :=
-# assignment for GCC and CFLAGS.
 do_compile() {
-    cd ${S}
-
-    # These changes are needed to have the native tools compiling and executing properly
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
-    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool/Makefile
-    sed -i '/^LIB/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/cert_create/Makefile
-
-    # This can be removed when only TF-A 2.4 onwards is supported
-    sed -i 's^OPENSSL_DIR.*=.*$^OPENSSL_DIR = ${STAGING_DIR_NATIVE}/${prefix_native}^' ${S}/tools/*/Makefile
-
     # Currently there are races if you build all the targets at once in parallel
     for T in ${TFA_BUILD_TARGET}; do
-        oe_runmake $T
+        oe_runmake -C ${S} $T
     done
 }
 do_compile[cleandirs] = "${B}"
-- 
2.17.1


