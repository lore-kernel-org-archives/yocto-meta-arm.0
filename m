Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA22AC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 16:30:24 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.268.1746635415202996618
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 May 2025 09:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 40C0A40C8A;
	Wed,  7 May 2025 16:30:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXL4oIIvsC3O; Wed,  7 May 2025 16:30:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1EDF940BA7;
	Wed,  7 May 2025 16:30:13 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4167B1679DC;
	Wed,  7 May 2025 12:30:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] optee-test: make -Werror conditional and disabled by default
Date: Wed,  7 May 2025 12:30:10 -0400
Message-Id: <20250507163010.3416556-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 May 2025 16:30:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6493

From: Denys Dmytriyenko <denys@konsulko.com>

Unfortunately, new gcc-15 nonstring attribute has just recently been
merged to clang and hasn't made into a release yet - will be part of
clang-21.

For now backport the commit making -Werror conditional and disabled
by default.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...cmake-add-Werror-based-on-CFG_WERROR.patch | 74 +++++++++++++++++++
 .../optee/optee-test_4.4.0.bb                 |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-build=
-make-cmake-add-Werror-based-on-CFG_WERROR.patch

diff --git a/meta-arm/recipes-security/optee/optee-test/0001-build-make-c=
make-add-Werror-based-on-CFG_WERROR.patch b/meta-arm/recipes-security/opt=
ee/optee-test/0001-build-make-cmake-add-Werror-based-on-CFG_WERROR.patch
new file mode 100644
index 00000000..53e6ffdd
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test/0001-build-make-cmake-ad=
d-Werror-based-on-CFG_WERROR.patch
@@ -0,0 +1,74 @@
+From d068b668800a2bacae006f9b4d5d0fcbdabe9223 Mon Sep 17 00:00:00 2001
+From: Jerome Forissier <jerome.forissier@linaro.org>
+Date: Wed, 7 May 2025 14:01:38 +0200
+Subject: [PATCH] build: make, cmake: add -Werror based on CFG_WERROR
+
+Update the build files that currently set -Werror unconditionally to
+use set it based on the value of CFG_WERROR instead (disabled by
+default).
+
+Upstream-Status: Backport [https://github.com/OP-TEE/optee_test/commit/d=
068b668800a2bacae006f9b4d5d0fcbdabe9223]
+
+Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+Acked-by: Etienne Carriere <etienne.carriere@foss.st.com>
+---
+ CMakeLists.txt      | 7 ++++++-
+ host/xtest/Makefile | 6 +++++-
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 77c3a75..0f338b7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,6 +4,8 @@ project (optee_test C)
+ # Default cross compile settings
+ set (CMAKE_TOOLCHAIN_FILE CMakeToolchain.txt)
+=20
++option(CFG_WERROR "Build with -Werror" FALSE)
++
+ set (OPTEE_TEST_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
+ #######################################################################=
#########
+ # Compiler flags:
+@@ -18,10 +20,13 @@ add_compile_options (
+ 	-Wmissing-prototypes -Wnested-externs
+ 	-Wpointer-arith -Wshadow -Wstrict-prototypes
+ 	-Wswitch-default -Wunsafe-loop-optimizations
+-	-Wwrite-strings -Werror -fPIC
++	-Wwrite-strings -fPIC
+  	-Wno-missing-field-initializers
+ 	-Wno-unused-parameter
+ )
++if(CFG_WERROR)
++    add_compile_options(-Werror)
++endif(CFG_WERROR)
+=20
+ find_program(CCACHE_FOUND ccache)
+ if(CCACHE_FOUND)
+diff --git a/host/xtest/Makefile b/host/xtest/Makefile
+index 2bdf759..37f1d32 100644
+--- a/host/xtest/Makefile
++++ b/host/xtest/Makefile
+@@ -139,7 +139,7 @@ CFLAGS +=3D -DTA_DIR=3D\"$(TA_DIR)\"
+ # Include configuration file generated by OP-TEE OS (CFG_* macros)
+ CFLAGS +=3D -include conf.h
+=20
+-CFLAGS +=3D -Wall -Wcast-align -Werror \
++CFLAGS +=3D -Wall -Wcast-align \
+ 	  -Werror-implicit-function-declaration -Wextra -Wfloat-equal \
+ 	  -Wformat-nonliteral -Wformat-security -Wformat=3D2 -Winit-self \
+ 	  -Wmissing-declarations -Wmissing-format-attribute \
+@@ -150,6 +150,10 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \
+ 	  -Wno-declaration-after-statement \
+ 	  -Wno-missing-field-initializers -Wno-format-zero-length
+=20
++ifeq ($(CFG_WERROR),y)
++CFLAGS +=3D -Werror
++endif
++
+ CFLAGS +=3D -g3
+=20
+ LDFLAGS +=3D -L$(OPTEE_CLIENT_EXPORT)/lib -lteec
+--=20
+2.25.1
+
diff --git a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.4.0.bb
index d514c82c..8b88865b 100644
--- a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
@@ -5,6 +5,7 @@ SRCREV =3D "695231ef8987866663a9ed5afd8f77d1bae3dc08"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560"
=20
+SRC_URI +=3D "file://0001-build-make-cmake-add-Werror-based-on-CFG_WERRO=
R.patch"
=20
 # Include ffa_spmc test group if the SPMC test is enabled.
 # Supported after op-tee v3.20
--=20
2.25.1


