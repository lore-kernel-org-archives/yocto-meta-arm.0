Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3B5C369A0
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:17:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9663.1743603426586979965
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 07:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 450CA1FC4;
	Wed,  2 Apr 2025 07:17:09 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 857EF3F63F;
	Wed,  2 Apr 2025 07:17:05 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 3/6] optee-client: fix udev and systemd handling
Date: Wed,  2 Apr 2025 16:16:49 +0200
Message-ID: <20250402141652.380180-3-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402141652.380180-1-gyorgy.szing@arm.com>
References: <20250402141652.380180-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 14:17:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6437

Eliminate the systemd specific install content fix-up commands appended
to do_install.
  - patch optee-client to allow controlling installation of systemd and
    udev specific configuration files.
  - pass driver group names to optee-client build

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/optee/optee-client.inc   | 12 ++-
 ...ant-update-udev-systemd-install-code.patch | 78 +++++++++++++++++++
 .../optee/optee-client_4.3.0.bb               |  3 +-
 .../optee/optee-client_4.4.0.bb               |  1 +
 4 files changed, 89 insertions(+), 5 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee=
-supplicant-update-udev-systemd-install-code.patch

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index fc48c302..519041d6 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -18,14 +18,16 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D " \
     -DBUILD_SHARED_LIBS=3DON \
+    -DCFG_USE_PKGCONFIG=3DON \
 "
+
+EXTRA_OECMAKE +=3D " -DCFG_ENABLE_SYSTEMD=3DOn -DSYSTEMD_UNIT_DIR=3D${sy=
stemd_system_unitdir}/"
+EXTRA_OECMAKE +=3D " -DCFG_ENABLE_UDEV=3DOn -DUDEV_UDEV_DIR=3D${nonarch_=
base_libdir}/udev/rules.d/"
+EXTRA_OECMAKE +=3D " -DCFG_TEE_GROUP=3Dtee -DCFG_TEEPRIV_GROUP=3Dteepriv=
"
+
 EXTRA_OECMAKE:append:toolchain-clang =3D " -DCFG_WERROR=3D0"
=20
 do_install:append() {
-    # installed by default
-    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fal=
se', d)}; then
-        rm -rf ${D}${libdir}/systemd
-    fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
         install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${syscon=
fdir}/init.d/tee-supplicant
         sed -i -e s:@sysconfdir@:${sysconfdir}:g \
@@ -41,6 +43,8 @@ INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME:${PN} =3D "tee-supplicant"
 INITSCRIPT_PARAMS:${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
=20
+FILES:${PN} +=3D "${nonarch_base_libdir}/udev/rules.d/"
+
 # Users and groups:
 # tee group to access /dev/tee*
 # teepriv group to acess /dev/teepriv*, only tee-supplicant
diff --git a/meta-arm/recipes-security/optee/optee-client/0001-tee-suppli=
cant-update-udev-systemd-install-code.patch b/meta-arm/recipes-security/o=
ptee/optee-client/0001-tee-supplicant-update-udev-systemd-install-code.pa=
tch
new file mode 100644
index 00000000..d243f297
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-up=
date-udev-systemd-install-code.patch
@@ -0,0 +1,78 @@
+From 5ddaac7c0770a423eca0cb727403b2f06657ffea Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Tue, 14 Jan 2025 09:42:25 +0100
+Subject: [PATCH 1/1] tee-supplicant: update udev & systemd install code
+
+- Allow optionally using pkg-config to discover install location of
+  systemd service and udev rule files.
+- Make systemd service file generation and installation optional.
+- Make udev rule file generation and installation optional.
+
+Changes are backwards compatible and the default operation is unchanged.
+
+Upstream-Status: Pending
+
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+---
+ tee-supplicant/CMakeLists.txt | 39 +++++++++++++++++++++++++++++++----
+ 1 file changed, 35 insertions(+), 4 deletions(-)
+
+diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.t=
xt
+index 8df9bef..ae1f5a4 100644
+--- a/tee-supplicant/CMakeLists.txt
++++ b/tee-supplicant/CMakeLists.txt
+@@ -7,6 +7,9 @@ option(RPMB_EMU "Enable tee-supplicant to emulate RPMB" =
ON)
+ option(CFG_TA_GPROF_SUPPORT "Enable tee-supplicant support for TAs inst=
rumented with gprof" ON)
+ option(CFG_FTRACE_SUPPORT "Enable tee-supplicant support for TAs instru=
mented with ftrace" ON)
+ option(CFG_TEE_SUPP_PLUGINS "Enable tee-supplicant plugin support" ON)
++option(CFG_ENABLE_SYSTEMD "Enable systemd service unit file generation.=
" ON)
++option(CFG_ENABLE_UDEV "Enable udev rules file generation." ON)
++option(CFG_USE_PKGCONFIG "Use pkg-config for discovering install target=
 directory for systemd and udev files." OFF)
+=20
+ set(CFG_TEE_SUPP_LOG_LEVEL "1" CACHE STRING "tee-supplicant log level")
+ # FIXME: Question is, is this really needed? Should just use defaults f=
rom # GNUInstallDirs?
+@@ -117,8 +120,36 @@ endif()
+ #######################################################################=
#########
+ # Install targets
+ #######################################################################=
#########
++# Discover target install location of the systemd and udev files using =
pkg-config
++if (CFG_USE_PKGCONFIG)
++	# Note: pkg-config should return setting valid for the target platform=
 and not the host.
++	include(FindPkgConfig)
++	if (PKG_CONFIG_FOUND)
++		pkg_search_module(SYSTEMD systemd)
++		if (SYSTEMD_FOUND AND CFG_ENABLE_SYSTEMD)
++			pkg_get_variable(UNIT_DIR systemd systemd_system_unit_dir)
++			set(SYSTEMD_UNIT_DIR "${UNIT_DIR}" CACHE PATH "Location of systemd u=
nit files.")
++			unset(UNIT_DIR)
++		endif()
++		pkg_search_module(UDEV udev)
++		if (UDEV_FOUND)
++			pkg_get_variable(UDEV_DIR udev udev_dir)
++			set(UDEV_UDEV_DIR "${UDEV_DIR}" CACHE PATH "Location of udev files."=
)
++			unset(UDEV_DIR)
++		endif()
++	endif()
++endif()
++
++# Some sane defaults is discovering through pkgconfig fails or is disab=
led.
++set(SYSTEMD_UNIT_DIR "${CMAKE_INSTALL_LIBDIR}/systemd/system" CACHE PAT=
H "Location of systemd unit files.")
++set(UDEV_UDEV_DIR "${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d" CACHE PATH=
 "Location of udev files.")
++
+ install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBI=
NDIR})
+-configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONLY=
)
+-install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.servi=
ce DESTINATION ${CMAKE_INSTALL_LIBDIR}/systemd/system)
+-configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
+-install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DEST=
INATION ${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d)
++if (CFG_ENABLE_SYSTEMD)
++	configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONL=
Y)
++	install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.serv=
ice DESTINATION ${SYSTEMD_UNIT_DIR})
++endif()
++if (CFG_ENABLE_UDEV)
++	configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
++	install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DES=
TINATION ${UDEV_UDEV_DIR})
++endif()
+\ No newline at end of file
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.3.0.bb
index edab4583..fae453ad 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
@@ -2,7 +2,8 @@ require recipes-security/optee/optee-client.inc
=20
 SRCREV =3D "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
=20
-SRC_URI +=3D "file://0001-tee-supplicant-add-udev-rule-and-systemd-servi=
ce-fil.patch"
+SRC_URI +=3D "file://0001-tee-supplicant-add-udev-rule-and-systemd-servi=
ce-fil.patch \
+            file://0001-tee-supplicant-update-udev-systemd-install-code.=
patch"
=20
 inherit pkgconfig
 DEPENDS +=3D "util-linux"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.4.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.4.0.bb
index fa7b9564..8bd03868 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.4.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.4.0.bb
@@ -2,6 +2,7 @@ require recipes-security/optee/optee-client.inc
=20
 # v4.4.0
 SRCREV =3D "d221676a58b305bddbf97db00395205b3038de8e"
+SRC_URI +=3D "file://0001-tee-supplicant-update-udev-systemd-install-cod=
e.patch"
=20
 inherit pkgconfig
 DEPENDS +=3D "util-linux"
--=20
2.43.0


