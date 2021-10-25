Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88479C4332F
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 15:42:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.34031.1635176533875584565
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 08:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79E9D1FB
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 245FD3F5A1
	for <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 08:42:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm/fiptool-native: improve OpenSSL build fix
Date: Mon, 25 Oct 2021 16:42:06 +0100
Message-Id: <20211025154207.2061343-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025154207.2061343-1-ross.burton@arm.com>
References: <20211025154207.2061343-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 25 Oct 2021 15:42:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2300

Take a patch that is heading upstream to pass OPENSSL_DIR to the fiptool
build, removing the need to alter the Makefiles at build time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/fiptool/files/ssl.patch  | 52 +++++++++++++++++++
 .../fiptool/fiptool-native_2.5.bb             |  9 ++--
 2 files changed, 56 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm/recipes-devtools/fiptool/files/ssl.patch

diff --git a/meta-arm/recipes-devtools/fiptool/files/ssl.patch b/meta-arm=
/recipes-devtools/fiptool/files/ssl.patch
new file mode 100644
index 00000000..cdabd1b7
--- /dev/null
+++ b/meta-arm/recipes-devtools/fiptool/files/ssl.patch
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
+=20
+ ${FIPTOOL}: FORCE
+ ifdef UNIX_MK
+-	${Q}${MAKE} CPPFLAGS=3D"-DVERSION=3D'\"${VERSION_STRING}\"'" FIPTOOL=3D=
${FIPTOOL} --no-print-directory -C ${FIPTOOLPATH}
++	${Q}${MAKE} CPPFLAGS=3D"-DVERSION=3D'\"${VERSION_STRING}\"'" FIPTOOL=3D=
${FIPTOOL} OPENSSL_DIR=3D${OPENSSL_DIR} --no-print-directory -C ${FIPTOOL=
PATH}
+ else
+ # Clear the MAKEFLAGS as we do not want
+ # to pass the gnumake flags to nmake.
+diff --git a/tools/fiptool/Makefile b/tools/fiptool/Makefile
+index 11d2e7b0b..7c2a08379 100644
+--- a/tools/fiptool/Makefile
++++ b/tools/fiptool/Makefile
+@@ -12,6 +12,8 @@ FIPTOOL ?=3D fiptool${BIN_EXT}
+ PROJECT :=3D $(notdir ${FIPTOOL})
+ OBJECTS :=3D fiptool.o tbbr_config.o
+ V ?=3D 0
++OPENSSL_DIR :=3D /usr
++
+=20
+ override CPPFLAGS +=3D -D_GNU_SOURCE -D_XOPEN_SOURCE=3D700
+ HOSTCCFLAGS :=3D -Wall -Werror -pedantic -std=3Dc99
+@@ -20,7 +22,7 @@ ifeq (${DEBUG},1)
+ else
+   HOSTCCFLAGS +=3D -O2
+ endif
+-LDLIBS :=3D -lcrypto
++LDLIBS :=3D -L${OPENSSL_DIR}/lib -lcrypto
+=20
+ ifeq (${V},0)
+   Q :=3D @
+@@ -28,7 +30,7 @@ else
+   Q :=3D
+ endif
+=20
+-INCLUDE_PATHS :=3D -I../../include/tools_share
++INCLUDE_PATHS :=3D -I../../include/tools_share  -I${OPENSSL_DIR}/includ=
e
+=20
+ HOSTCC ?=3D gcc
+=20
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb b/me=
ta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
index 2d0f333a..e733ff1e 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
@@ -5,7 +5,8 @@
 DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
 LICENSE =3D "BSD-3-Clause"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;d=
estsuffix=3Dfiptool-${PV};protocol=3Dhttps;"
+SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;d=
estsuffix=3Dfiptool-${PV};protocol=3Dhttps \
+           file://ssl.patch"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D713afe122abbe07f067f=
939ca3c480c5"
=20
 # Use fiptool from TF-A v2.5
@@ -15,11 +16,9 @@ DEPENDS +=3D "openssl-native"
=20
 inherit native
=20
-do_compile () {
-    # These changes are needed to have the fiptool compiling and executi=
ng properly
-    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makef=
ile
-    sed -i '/^INCLUDE_PATHS/ s,$, \$\{BUILD_CFLAGS},' ${S}/tools/fiptool=
/Makefile
+EXTRA_OEMAKE =3D "V=3D1 HOSTCC=3D'${BUILD_CC}' OPENSSL_DIR=3D${STAGING_D=
IR_NATIVE}/${prefix_native}"
=20
+do_compile () {
     oe_runmake fiptool
 }
=20
--=20
2.25.1


