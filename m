Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00F0C7115E
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 08:11:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2042.1750234259331767085
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 01:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E46F1BD0;
	Wed, 18 Jun 2025 01:10:38 -0700 (PDT)
Received: from MGC575JXM4.arm.com (unknown [10.57.83.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53C943F66E;
	Wed, 18 Jun 2025 01:10:58 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20Faure?= <clement.faure@arm.com>
Subject: [PATCH 2/3] arm/optee: remove 4.3.0
Date: Wed, 18 Jun 2025 10:10:46 +0200
Message-Id: <20250618081047.34990-3-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250618081047.34990-1-clement.faure@arm.com>
References: <20250618081047.34990-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Jun 2025 08:11:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6566

From: Cl=C3=A9ment Faure <clement.faure@arm.com>

Remove optee 4.3.0 recipes.

Signed-off-by: Cl=C3=A9ment Faure <clement.faure@arm.com>
---
 ...dd-udev-rule-and-systemd-service-fil.patch | 186 ------------------
 .../optee/optee-client_4.3.0.bb               |  10 -
 .../optee/optee-examples_4.3.0.bb             |   3 -
 .../optee/optee-os-tadevkit_4.3.0.bb          |  26 ---
 ...mpile.mk-use-CFLAGS-from-environment.patch |  43 ----
 ....mk-remove-absolute-build-time-paths.patch |  53 -----
 ...02-link.mk-use-CFLAGS-with-version.o.patch |  45 -----
 ...k-generate-version.o-in-link-out-dir.patch |  70 -------
 .../recipes-security/optee/optee-os_4.3.0.bb  |  14 --
 .../optee/optee-test_4.3.0.bb                 |  12 --
 10 files changed, 462 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee=
-supplicant-add-udev-rule-and-systemd-service-fil.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_4.3.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_4.3.0.=
bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.3=
.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-compile=
.mk-use-CFLAGS-from-environment.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-mk-comp=
ile.mk-remove-absolute-build-time-paths.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-link.mk=
-use-CFLAGS-with-version.o.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0003-link.mk=
-generate-version.o-in-link-out-dir.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_4.3.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_4.3.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-client/0001-tee-suppli=
cant-add-udev-rule-and-systemd-service-fil.patch b/meta-arm/recipes-secur=
ity/optee/optee-client/0001-tee-supplicant-add-udev-rule-and-systemd-serv=
ice-fil.patch
deleted file mode 100644
index 18c0d950..00000000
--- a/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-ad=
d-udev-rule-and-systemd-service-fil.patch
+++ /dev/null
@@ -1,186 +0,0 @@
-From bf0d02758696ee7a9f7af9e95f85f5c238d0e109 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Wed, 2 Oct 2024 15:24:21 +0100
-Subject: [PATCH] tee-supplicant: add udev rule and systemd service file
-
-tee-supplicant startup with systemd init based
-is non-trivial. Add sample udev rule and systemd
-service files here so that distros can co-operate maintaining
-them.
-
-Files are from meta-arm https://git.yoctoproject.org/meta-arm
-at commit 7cce43e632daa8650f683ac726f9124681b302a4 with license
-MIT and authors:
-
-Peter Griffin <peter.griffin@linaro.org>
-Joshua Watt <JPEWhacker@gmail.com>
-Javier Tia <javier.tia@linaro.org>
-Mikko Rapeli <mikko.rapeli@linaro.org>
-
-With permission from the authors, files can be relicensed to
-BSD-2-Clause like rest of optee client repo.
-
-The config files expect to find tee and teepriv system groups
-and teesuppl user and group (part of teepriv group) for running
-tee-supplicant. Additionally state directory /var/lib/tee
-must be owned by teesuppl user and group with no rights
-to other users. The groups and user can be changed via
-CMake variables:
-
-CFG_TEE_GROUP
-CFG_TEEPRIV_GROUP
-CFG_TEE_SUPPL_USER
-CFG_TEE_SUPPL_GROUP
-
-Change storage path from /data to /var/lib and
-use standard CMake variables also for constructing install
-paths which can be override to change the defaults:
-
-CMAKE_INSTALL_PREFIX, e.g. /
-CMAKE_INSTALL_LIBDIR, e.g. /usr/lib
-CMAKE_INSTALL_LOCALSTATEDIR /var
-
-Once these are setup, udev will start tee-supplicant in initramfs
-or rootfs with teesuppl user and group when /dev/teepriv
-device appears. The systemd service starts before tpm2.target
-(new in systemd 256) which starts early in initramfs and in main rootfs.
-This covers firmware TPM TA usecases for main rootfs encryption. When
-stopping tee-supplicant, the ftpm kernel modules are removed and only
-then the main process stopped to avoid fTPM breakage. These workarounds
-may be removed once RPMB kernel and optee patches without tee-supplicant
-are merged (Linux kernel >=3D 6.12-rc1, optee_os latest master or >=3D 4=
.4).
-
-Tested on yocto meta-arm setup which runs fTPM and optee-test/xtest
-under qemuarm64:
-
-$ git clone https://git.yoctoproject.org/meta-arm
-$ cd meta-arm
-$ SSTATE_DIR=3D$HOME/sstate DL_DIR=3D$HOME/download kas build \
-ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
-
-Compiled image can be manually started to qemu serial console with:
-
-$ SSTATE_DIR=3D$HOME/sstate DL_DIR=3D$HOME/download kas shell \
-ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
-$ runqemu slirp nographic
-
-meta-arm maintainers run these tests as part of their CI.
-
-Note that if the tee-supplicant state directory /var/lib/tee
-can not be accessed due permissions or other problems, then
-tee-supplicant startup with systemd still works. Only optee-test/xtest
-will be failing and fTPM kernel drivers fail to load with error
-messages.
-
-Cc: Peter Griffin <peter.griffin@linaro.org>
-Cc: Joshua Watt <JPEWhacker@gmail.com>
-Cc: Javier Tia <javier.tia@linaro.org>
-Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- config.mk                                 |  2 +-
- libteec/CMakeLists.txt                    |  2 +-
- tee-supplicant/CMakeLists.txt             | 13 +++++++++++--
- tee-supplicant/optee-udev.rules.in        |  7 +++++++
- tee-supplicant/tee-supplicant@.service.in | 17 +++++++++++++++++
- 5 files changed, 37 insertions(+), 4 deletions(-)
- create mode 100644 tee-supplicant/optee-udev.rules.in
- create mode 100644 tee-supplicant/tee-supplicant@.service.in
-
-Upstream-Status: Backport
-
-diff --git a/config.mk b/config.mk
-index eae481f..3def087 100644
---- a/config.mk
-+++ b/config.mk
-@@ -23,7 +23,7 @@ CFG_TEE_SUPP_LOG_LEVEL?=3D1
- #   This folder can be created with the required permission in an init
- #   script during boot, else it will be created by the tee-supplicant o=
n
- #   first REE FS access.
--CFG_TEE_FS_PARENT_PATH ?=3D /data/tee
-+CFG_TEE_FS_PARENT_PATH ?=3D /var/lib/tee
-=20
- # CFG_TEE_CLIENT_LOG_FILE
- #   The location of the client log file when logging to file is enabled=
.
-diff --git a/libteec/CMakeLists.txt b/libteec/CMakeLists.txt
-index c742d31..c857369 100644
---- a/libteec/CMakeLists.txt
-+++ b/libteec/CMakeLists.txt
-@@ -14,7 +14,7 @@ endif()
- # Configuration flags always included
- #######################################################################=
#########
- set(CFG_TEE_CLIENT_LOG_LEVEL "1" CACHE STRING "libteec log level")
--set(CFG_TEE_CLIENT_LOG_FILE "/data/tee/teec.log" CACHE STRING "Location=
 of libteec log")
-+set(CFG_TEE_CLIENT_LOG_FILE "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee/tee=
c.log" CACHE STRING "Location of libteec log")
-=20
- #######################################################################=
#########
- # Source files
-diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.t=
xt
-index 54a34c7..8df9bef 100644
---- a/tee-supplicant/CMakeLists.txt
-+++ b/tee-supplicant/CMakeLists.txt
-@@ -11,10 +11,15 @@ option(CFG_TEE_SUPP_PLUGINS "Enable tee-supplicant p=
lugin support" ON)
- set(CFG_TEE_SUPP_LOG_LEVEL "1" CACHE STRING "tee-supplicant log level")
- # FIXME: Question is, is this really needed? Should just use defaults f=
rom # GNUInstallDirs?
- set(CFG_TEE_CLIENT_LOAD_PATH "/lib" CACHE STRING "Colon-separated list =
of paths where to look for TAs (see also --ta-dir)")
--set(CFG_TEE_FS_PARENT_PATH "/data/tee" CACHE STRING "Location of TEE fi=
lesystem (secure storage)")
-+set(CFG_TEE_FS_PARENT_PATH "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee" CAC=
HE STRING "Location of TEE filesystem (secure storage)")
- # FIXME: Why do we have if defined(CFG_GP_SOCKETS) && CFG_GP_SOCKETS =3D=
=3D 1 in the c-file?
- set(CFG_GP_SOCKETS "1" CACHE STRING "Enable GlobalPlatform Socket API s=
upport")
--set(CFG_TEE_PLUGIN_LOAD_PATH "/usr/lib/tee-supplicant/plugins/" CACHE S=
TRING "tee-supplicant's plugins path")
-+set(CFG_TEE_PLUGIN_LOAD_PATH "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_L=
IBDIR}/${PROJECT_NAME}/plugins/" CACHE STRING "tee-supplicant's plugins p=
ath")
-+
-+set(CFG_TEE_GROUP "tee" CACHE STRING "Group which has access to /dev/te=
e* devices")
-+set(CFG_TEEPRIV_GROUP "teepriv" CACHE STRING "Group which has access to=
 /dev/teepriv* devices")
-+set(CFG_TEE_SUPPL_USER "teesuppl" CACHE STRING "User account which tee-=
supplicant is started with")
-+set(CFG_TEE_SUPPL_GROUP "teesuppl" CACHE STRING "Group account which te=
e-supplicant is started with")
-=20
- if(CFG_TEE_SUPP_PLUGINS)
- 	set(CMAKE_INSTALL_RPATH "${CFG_TEE_PLUGIN_LOAD_PATH}")
-@@ -113,3 +118,7 @@ endif()
- # Install targets
- #######################################################################=
#########
- install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBI=
NDIR})
-+configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONLY=
)
-+install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.servi=
ce DESTINATION ${CMAKE_INSTALL_LIBDIR}/systemd/system)
-+configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
-+install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DEST=
INATION ${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d)
-diff --git a/tee-supplicant/optee-udev.rules.in b/tee-supplicant/optee-u=
dev.rules.in
-new file mode 100644
-index 0000000..275e833
---- /dev/null
-+++ b/tee-supplicant/optee-udev.rules.in
-@@ -0,0 +1,7 @@
-+# SPDX-License-Identifier: BSD-2-Clause
-+KERNEL=3D=3D"tee[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"@CFG_T=
EE_GROUP@", TAG+=3D"systemd"
-+
-+# If a /dev/teepriv[0-9]* device is detected, start an instance of
-+# tee-supplicant.service with the device name as parameter
-+KERNEL=3D=3D"teepriv[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"@C=
FG_TEEPRIV_GROUP@", \
-+    TAG+=3D"systemd", ENV{SYSTEMD_WANTS}+=3D"tee-supplicant@%k.service"
-diff --git a/tee-supplicant/tee-supplicant@.service.in b/tee-supplicant/=
tee-supplicant@.service.in
-new file mode 100644
-index 0000000..e53a935
---- /dev/null
-+++ b/tee-supplicant/tee-supplicant@.service.in
-@@ -0,0 +1,17 @@
-+# SPDX-License-Identifier: BSD-2-Clause
-+[Unit]
-+Description=3DTEE Supplicant on %i
-+DefaultDependencies=3Dno
-+After=3Ddev-%i.device
-+Wants=3Ddev-%i.device
-+Conflicts=3Dshutdown.target
-+Before=3Dtpm2.target sysinit.target shutdown.target
-+
-+[Service]
-+Type=3Dnotify
-+User=3D@CFG_TEE_SUPPL_USER@
-+Group=3D@CFG_TEE_SUPPL_GROUP@
-+EnvironmentFile=3D-@CMAKE_INSTALL_SYSCONFDIR@/default/tee-supplicant
-+ExecStart=3D@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_SBINDIR@/tee-supplica=
nt $OPTARGS
-+# Workaround for fTPM TA: stop kernel module before tee-supplicant
-+ExecStop=3D-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $=
MAINPID"
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.3.0.bb
deleted file mode 100644
index fae453ad..00000000
--- a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-SRCREV =3D "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
-
-SRC_URI +=3D "file://0001-tee-supplicant-add-udev-rule-and-systemd-servi=
ce-fil.patch \
-            file://0001-tee-supplicant-update-udev-systemd-install-code.=
patch"
-
-inherit pkgconfig
-DEPENDS +=3D "util-linux"
-EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.3.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.3.0.bb
deleted file mode 100644
index f082a25d..00000000
--- a/meta-arm/recipes-security/optee/optee-examples_4.3.0.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-SRCREV =3D "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb
deleted file mode 100644
index 2e43254a..00000000
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require recipes-security/optee/optee-os_${PV}.bb
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
-# Include extra headers needed by SPMC tests to TA DEVKIT.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-compile.mk-use=
-CFLAGS-from-environment.patch b/meta-arm/recipes-security/optee/optee-os=
/0001-compile.mk-use-CFLAGS-from-environment.patch
deleted file mode 100644
index 6577dce3..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-compile.mk-use-CFLAGS=
-from-environment.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 978cc08a393b7d5d0043bf7f4d33f0e33b2b18d8 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Thu, 1 Aug 2024 13:58:36 +0000
-Subject: [PATCH 1/3] compile.mk: use CFLAGS from environment
-
-Users can set CFLAGS just like AFLAGS, CC,
-LD etc and expect them to be used. It's ok to amend
-to them but overwriting should not be done.
-Build environment like yocto expect that these
-variables are used to call the compiler etc tools.
-Linux distro build environments usually set
-these variables.
-
-Helps to remove build time paths from generated binaries
-since mappings to remove them can be set by the distro
-build system in CFLAGS automatically for each SW component
-in the build.
-
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- mk/compile.mk | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Upstream-Status: Backport
-
-diff --git a/mk/compile.mk b/mk/compile.mk
-index b3d807ba4..0de7ea259 100644
---- a/mk/compile.mk
-+++ b/mk/compile.mk
-@@ -80,7 +80,8 @@ comp-compiler-$2 :=3D $$(CC$(sm))
- comp-flags-$2 =3D $$(filter-out $$(CFLAGS_REMOVE) $$(cflags-remove) \
- 			      $$(cflags-remove-$$(comp-sm-$2)) \
- 			      $$(cflags-remove-$2), \
--		   $$(CFLAGS$$(arch-bits-$$(comp-sm-$2))) $$(CFLAGS_WARNS) \
-+		   $$(CFLAGS$$(arch-bits-$$(comp-sm-$2))) $$(CFLAGS) \
-+		   $$(CFLAGS_WARNS) \
- 		   $$(comp-cflags$$(comp-sm-$2)) $$(cflags$$(comp-sm-$2)) \
- 		   $$(cflags-lib$$(comp-lib-$2)) $$(cflags-$2))
- ifeq ($C,1)
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-=
remove-absolute-build-time-paths.patch b/meta-arm/recipes-security/optee/=
optee-os/0001-mk-compile.mk-remove-absolute-build-time-paths.patch
deleted file mode 100644
index 63fb63a2..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0001-mk-compile.mk-remove-=
absolute-build-time-paths.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 29b84ae5b277b85cd7244acde077694e6643fcde Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Thu, 18 Jul 2024 07:54:18 +0000
-Subject: [PATCH] mk/compile.mk: remove absolute build time paths
-
-Some generated files get a __FILE_ID__ which include absolute
-build time paths. Remove the paths and use plain file name.
-Fixes yocto QA check.
-
-Problem/bug:
-
-$ strings ../image/lib/firmware/tee.elf | grep mikko
-__FILE_ID__
-_home_mikko_build_core_ta_pub_key_c
-__FILE_ID__
-_home_mikko_build_core_ldelf_hex_c
-__FILE_ID__
-_home_mikko_build_core_early_ta_fd02c9da_306c_48c7_a49c_bbd827ae86ee_c
-
-With this patch:
-
-$ strings ../image/lib/firmware/tee.elf | grep mikko
-$ strings ../image/lib/firmware/tee.elf | grep FILE_ID | egrep \
-"core_ta_pub_key_c|core_ldelf_hex_c|core_early_ta_fd02c9da_306c_4"
-__FILE_ID__ core_ta_pub_key_c
-__FILE_ID__ core_ldelf_hex_c
-__FILE_ID__ core_early_ta_fd02c9da_306c_48c7_a49c_bbd827ae86ee_c
-
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- mk/compile.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-Status: Backport
-
-diff --git a/mk/compile.mk b/mk/compile.mk
-index b3d807ba4..338535bf3 100644
---- a/mk/compile.mk
-+++ b/mk/compile.mk
-@@ -120,7 +120,7 @@ comp-cppflags-$2 =3D $$(filter-out $$(CPPFLAGS_REMOV=
E) $$(cppflags-remove) \
- 		      $$(addprefix -I,$$(incdirs-$2)) \
- 		      $$(cppflags$$(comp-sm-$2)) \
- 		      $$(cppflags-lib$$(comp-lib-$2)) $$(cppflags-$2)) \
--		      -D__FILE_ID__=3D$$(subst -,_,$$(subst /,_,$$(subst .,_,$1)))
-+		      -D__FILE_ID__=3D$$(subst -,_,$$(subst /,_,$$(subst .,_,$$(patsu=
bst $$(out-dir)/%,%,$1))))
-=20
- comp-flags-$2 +=3D -MD -MF $$(comp-dep-$2) -MT $$@
- comp-flags-$2 +=3D $$(comp-cppflags-$2)
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-use-CF=
LAGS-with-version.o.patch b/meta-arm/recipes-security/optee/optee-os/0002=
-link.mk-use-CFLAGS-with-version.o.patch
deleted file mode 100644
index 08bc15d7..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-use-CFLAGS-wi=
th-version.o.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From f9207376ed58836bf748cc4cea0fcbf46624a709 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Thu, 1 Aug 2024 14:03:11 +0000
-Subject: [PATCH 2/3] link.mk: use CFLAGS with version.o
-
-Should be used by all compilations.
-
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- core/arch/arm/kernel/link.mk   | 2 +-
- core/arch/riscv/kernel/link.mk | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Upstream-Status: Backport
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 49e9f4fa1..377a82b65 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -151,7 +151,7 @@ define update-buildcount
- endef
-=20
- # filter-out to workaround objdump warning
--version-o-cflags =3D $(filter-out -g3,$(core-platform-cflags) \
-+version-o-cflags =3D $(filter-out -g3,$(CFLAGS) $(core-platform-cflags)=
 \
- 			$(platform-cflags) $(cflagscore))
- # SOURCE_DATE_EPOCH defined for reproducible builds
- ifneq ($(SOURCE_DATE_EPOCH),)
-diff --git a/core/arch/riscv/kernel/link.mk b/core/arch/riscv/kernel/lin=
k.mk
-index 3d1000d15..1fff0a379 100644
---- a/core/arch/riscv/kernel/link.mk
-+++ b/core/arch/riscv/kernel/link.mk
-@@ -62,7 +62,7 @@ define update-buildcount
- endef
-=20
- # filter-out to workaround objdump warning
--version-o-cflags =3D $(filter-out -g3,$(core-platform-cflags) \
-+version-o-cflags =3D $(filter-out -g3,$(CFLAGS) $(core-platform-cflags)=
 \
- 			$(platform-cflags) $(cflagscore))
- # SOURCE_DATE_EPOCH defined for reproducible builds
- ifneq ($(SOURCE_DATE_EPOCH),)
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os/0003-link.mk-genera=
te-version.o-in-link-out-dir.patch b/meta-arm/recipes-security/optee/opte=
e-os/0003-link.mk-generate-version.o-in-link-out-dir.patch
deleted file mode 100644
index 0e559b2e..00000000
--- a/meta-arm/recipes-security/optee/optee-os/0003-link.mk-generate-vers=
ion.o-in-link-out-dir.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 8f100f355e645376729086edbace8f01cf7aa3b4 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Thu, 1 Aug 2024 14:04:55 +0000
-Subject: [PATCH 3/3] link.mk: generate version.o in link-out-dir
-
-When source code is piped to compiler, then the
-current working directory is left into debug
-data. If the working directory is not the output
-directory, then mappings which strip absolute output
-directory paths don't work.
-
-Removes absolute build time paths from version.o
-debug info.
-
-Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- core/arch/arm/kernel/link.mk   | 5 +++--
- core/arch/riscv/kernel/link.mk | 5 +++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
-
-Upstream-Status: Backport
-
-diff --git a/core/arch/arm/kernel/link.mk b/core/arch/arm/kernel/link.mk
-index 377a82b65..d1d527224 100644
---- a/core/arch/arm/kernel/link.mk
-+++ b/core/arch/arm/kernel/link.mk
-@@ -163,14 +163,15 @@ CORE_CC_VERSION =3D `$(CCcore) -v 2>&1 | grep "ver=
sion " | sed 's/ *$$//'`
- define gen-version-o
- 	$(call update-buildcount,$(link-out-dir)/.buildcount)
- 	@$(cmd-echo-silent) '  GEN     $(link-out-dir)/version.o'
--	$(q)echo -e "const char core_v_str[] =3D" \
-+	$(q)cd $(link-out-dir) && \
-+		echo -e "const char core_v_str[] =3D" \
- 		"\"$(TEE_IMPL_VERSION) \"" \
- 		"\"($(CORE_CC_VERSION)) \"" \
- 		"\"#$(BUILD_COUNT_STR) \"" \
- 		"\"$(DATE_STR) \"" \
- 		"\"$(CFG_KERN_LINKER_ARCH)\";\n" \
- 		| $(CCcore) $(version-o-cflags) \
--			-xc - -c -o $(link-out-dir)/version.o
-+			-xc - -c -o version.o
- endef
- $(link-out-dir)/version.o:
- 	$(call gen-version-o)
-diff --git a/core/arch/riscv/kernel/link.mk b/core/arch/riscv/kernel/lin=
k.mk
-index 1fff0a379..6511586e2 100644
---- a/core/arch/riscv/kernel/link.mk
-+++ b/core/arch/riscv/kernel/link.mk
-@@ -74,14 +74,15 @@ CORE_CC_VERSION =3D `$(CCcore) -v 2>&1 | grep "versi=
on " | sed 's/ *$$//'`
- define gen-version-o
- 	$(call update-buildcount,$(link-out-dir)/.buildcount)
- 	@$(cmd-echo-silent) '  GEN     $(link-out-dir)/version.o'
--	$(q)echo -e "const char core_v_str[] =3D" \
-+	$(q)cd $(link-out-dir) && \
-+		echo -e "const char core_v_str[] =3D" \
- 		"\"$(TEE_IMPL_VERSION) \"" \
- 		"\"($(CORE_CC_VERSION)) \"" \
- 		"\"#$(BUILD_COUNT_STR) \"" \
- 		"\"$(DATE_STR) \"" \
- 		"\"$(CFG_KERN_LINKER_ARCH)\";\n" \
- 		| $(CCcore) $(version-o-cflags) \
--			-xc - -c -o $(link-out-dir)/version.o
-+			-xc - -c -o version.o
- endef
-=20
- $(link-out-dir)/version.o:
---=20
-2.34.1
-
diff --git a/meta-arm/recipes-security/optee/optee-os_4.3.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.3.0.bb
deleted file mode 100644
index cfd926b0..00000000
--- a/meta-arm/recipes-security/optee/optee-os_4.3.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-SRCREV =3D "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
-SRC_URI +=3D " \
-    file://0003-optee-enable-clang-support.patch \
-    file://0001-mk-compile.mk-remove-absolute-build-time-paths.patch \
-    file://0001-compile.mk-use-CFLAGS-from-environment.patch \
-    file://0002-link.mk-use-CFLAGS-with-version.o.patch \
-    file://0003-link.mk-generate-version.o-in-link-out-dir.patch \
-"
diff --git a/meta-arm/recipes-security/optee/optee-test_4.3.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.3.0.bb
deleted file mode 100644
index 44846fef..00000000
--- a/meta-arm/recipes-security/optee/optee-test_4.3.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-SRCREV =3D "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da8fa504109e4cd7ea575bc49ea=
4be560"
-
-# Include ffa_spmc test group if the SPMC test is enabled.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy CFG_SECURE_=
PARTITION=3Dy', '' , d)}"
-
-RDEPENDS:${PN} +=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                                              ' arm-ffa-user', '' , d)}"

