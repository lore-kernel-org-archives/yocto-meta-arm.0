Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0C1C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:17:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9659.1743603424663220994
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 07:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E14A91007;
	Wed,  2 Apr 2025 07:17:06 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D29E63F63F;
	Wed,  2 Apr 2025 07:17:02 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	tom.hochstein@nxp.com,
	sahil.malhotra@nxp.com,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 1/6] optee-client: use udev rule and systemd service from upstream
Date: Wed,  2 Apr 2025 16:16:47 +0200
Message-ID: <20250402141652.380180-1-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Apr 2025 14:17:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6435

From: Mikko Rapeli <mikko.rapeli@linaro.org>

Use backported upstream patch for udev rule and systemd service file.
sysvinit script is still used from meta-arm. Don't install systemd
service without systemd distro feature, other way round for
sysvinit script.

tee-supplicant started by systemd service runs as non-root teesuppl
user with teepriv group. sysvinit still runs as root since busybox
start-stop-daemon doesn't support -g group parameter and -u teesuppl
doesn't seem to change the effective user.

udev rules allow non-root /dev/tee* access from tee and
/dev/teepriv* access from teepriv groups.

Tested sysvinit changes with:

$ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml

and systemd changes with:

$ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml:ci/u=
efi-secureboot.yml

Cc: tom.hochstein@nxp.com
Cc: sahil.malhotra@nxp.com
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-security/optee/optee-client.inc   |  30 +--
 ...dd-udev-rule-and-systemd-service-fil.patch | 186 ++++++++++++++++++
 .../optee/optee-client/optee-udev.rules       |   6 -
 .../optee-client/tee-supplicant@.service      |  13 --
 .../optee/optee-client_4.3.0.bb               |   2 +
 5 files changed, 205 insertions(+), 32 deletions(-)
 create mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee=
-supplicant-add-udev-rule-and-systemd-service-fil.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/optee-ud=
ev.rules
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supp=
licant@.service

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index f387c805..fc48c302 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -9,9 +9,7 @@ inherit systemd update-rc.d cmake useradd
=20
 SRC_URI =3D " \
     git://github.com/OP-TEE/optee_client.git;branch=3Dmaster;protocol=3D=
https \
-    file://tee-supplicant@.service \
     file://tee-supplicant.sh \
-    file://optee-udev.rules \
 "
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
@@ -20,20 +18,21 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OECMAKE =3D " \
     -DBUILD_SHARED_LIBS=3DON \
-    -DCFG_TEE_FS_PARENT_PATH=3D'${localstatedir}/lib/tee' \
 "
 EXTRA_OECMAKE:append:toolchain-clang =3D " -DCFG_WERROR=3D0"
=20
 do_install:append() {
-    install -D -p -m0644 ${UNPACKDIR}/tee-supplicant@.service ${D}${syst=
emd_system_unitdir}/tee-supplicant@.service
-    install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${sysconfdir=
}/init.d/tee-supplicant
-    install -d ${D}${sysconfdir}/udev/rules.d
-    install -m 0644 ${UNPACKDIR}/optee-udev.rules ${D}${sysconfdir}/udev=
/rules.d/optee.rules
-
-    sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-           -e s:@sbindir@:${sbindir}:g \
-              ${D}${systemd_system_unitdir}/tee-supplicant@.service \
-              ${D}${sysconfdir}/init.d/tee-supplicant
+    # installed by default
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fal=
se', d)}; then
+        rm -rf ${D}${libdir}/systemd
+    fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
+        install -D -p -m0755 ${UNPACKDIR}/tee-supplicant.sh ${D}${syscon=
fdir}/init.d/tee-supplicant
+        sed -i -e s:@sysconfdir@:${sysconfdir}:g \
+               -e s:@sbindir@:${sbindir}:g \
+                  ${D}${sysconfdir}/init.d/tee-supplicant
+    fi
+    install -o teesuppl -g teesuppl -m 0700 -d ${D}${localstatedir}/lib/=
tee
 }
=20
 SYSTEMD_SERVICE:${PN} =3D "tee-supplicant@.service"
@@ -42,5 +41,10 @@ INITSCRIPT_PACKAGES =3D "${PN}"
 INITSCRIPT_NAME:${PN} =3D "tee-supplicant"
 INITSCRIPT_PARAMS:${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
=20
+# Users and groups:
+# tee group to access /dev/tee*
+# teepriv group to acess /dev/teepriv*, only tee-supplicant
+# teesuppl user and group teesuppl to run tee-supplicant
 USERADD_PACKAGES =3D "${PN}"
-GROUPADD_PARAM:${PN} =3D "--system teeclnt"
+GROUPADD_PARAM:${PN} =3D "--system tee; --system teepriv; --system teesu=
ppl"
+USERADD_PARAM:${PN} =3D "--system -g teesuppl --groups teepriv --home-di=
r ${localstatedir}/lib/tee -M --shell /sbin/nologin teesuppl;"
diff --git a/meta-arm/recipes-security/optee/optee-client/0001-tee-suppli=
cant-add-udev-rule-and-systemd-service-fil.patch b/meta-arm/recipes-secur=
ity/optee/optee-client/0001-tee-supplicant-add-udev-rule-and-systemd-serv=
ice-fil.patch
new file mode 100644
index 00000000..18c0d950
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-ad=
d-udev-rule-and-systemd-service-fil.patch
@@ -0,0 +1,186 @@
+From bf0d02758696ee7a9f7af9e95f85f5c238d0e109 Mon Sep 17 00:00:00 2001
+From: Mikko Rapeli <mikko.rapeli@linaro.org>
+Date: Wed, 2 Oct 2024 15:24:21 +0100
+Subject: [PATCH] tee-supplicant: add udev rule and systemd service file
+
+tee-supplicant startup with systemd init based
+is non-trivial. Add sample udev rule and systemd
+service files here so that distros can co-operate maintaining
+them.
+
+Files are from meta-arm https://git.yoctoproject.org/meta-arm
+at commit 7cce43e632daa8650f683ac726f9124681b302a4 with license
+MIT and authors:
+
+Peter Griffin <peter.griffin@linaro.org>
+Joshua Watt <JPEWhacker@gmail.com>
+Javier Tia <javier.tia@linaro.org>
+Mikko Rapeli <mikko.rapeli@linaro.org>
+
+With permission from the authors, files can be relicensed to
+BSD-2-Clause like rest of optee client repo.
+
+The config files expect to find tee and teepriv system groups
+and teesuppl user and group (part of teepriv group) for running
+tee-supplicant. Additionally state directory /var/lib/tee
+must be owned by teesuppl user and group with no rights
+to other users. The groups and user can be changed via
+CMake variables:
+
+CFG_TEE_GROUP
+CFG_TEEPRIV_GROUP
+CFG_TEE_SUPPL_USER
+CFG_TEE_SUPPL_GROUP
+
+Change storage path from /data to /var/lib and
+use standard CMake variables also for constructing install
+paths which can be override to change the defaults:
+
+CMAKE_INSTALL_PREFIX, e.g. /
+CMAKE_INSTALL_LIBDIR, e.g. /usr/lib
+CMAKE_INSTALL_LOCALSTATEDIR /var
+
+Once these are setup, udev will start tee-supplicant in initramfs
+or rootfs with teesuppl user and group when /dev/teepriv
+device appears. The systemd service starts before tpm2.target
+(new in systemd 256) which starts early in initramfs and in main rootfs.
+This covers firmware TPM TA usecases for main rootfs encryption. When
+stopping tee-supplicant, the ftpm kernel modules are removed and only
+then the main process stopped to avoid fTPM breakage. These workarounds
+may be removed once RPMB kernel and optee patches without tee-supplicant
+are merged (Linux kernel >=3D 6.12-rc1, optee_os latest master or >=3D 4=
.4).
+
+Tested on yocto meta-arm setup which runs fTPM and optee-test/xtest
+under qemuarm64:
+
+$ git clone https://git.yoctoproject.org/meta-arm
+$ cd meta-arm
+$ SSTATE_DIR=3D$HOME/sstate DL_DIR=3D$HOME/download kas build \
+ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
+
+Compiled image can be manually started to qemu serial console with:
+
+$ SSTATE_DIR=3D$HOME/sstate DL_DIR=3D$HOME/download kas shell \
+ci/qemuarm64-secureboot.yml:ci/poky-altcfg.yml:ci/testimage.yml
+$ runqemu slirp nographic
+
+meta-arm maintainers run these tests as part of their CI.
+
+Note that if the tee-supplicant state directory /var/lib/tee
+can not be accessed due permissions or other problems, then
+tee-supplicant startup with systemd still works. Only optee-test/xtest
+will be failing and fTPM kernel drivers fail to load with error
+messages.
+
+Cc: Peter Griffin <peter.griffin@linaro.org>
+Cc: Joshua Watt <JPEWhacker@gmail.com>
+Cc: Javier Tia <javier.tia@linaro.org>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
+Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
+---
+ config.mk                                 |  2 +-
+ libteec/CMakeLists.txt                    |  2 +-
+ tee-supplicant/CMakeLists.txt             | 13 +++++++++++--
+ tee-supplicant/optee-udev.rules.in        |  7 +++++++
+ tee-supplicant/tee-supplicant@.service.in | 17 +++++++++++++++++
+ 5 files changed, 37 insertions(+), 4 deletions(-)
+ create mode 100644 tee-supplicant/optee-udev.rules.in
+ create mode 100644 tee-supplicant/tee-supplicant@.service.in
+
+Upstream-Status: Backport
+
+diff --git a/config.mk b/config.mk
+index eae481f..3def087 100644
+--- a/config.mk
++++ b/config.mk
+@@ -23,7 +23,7 @@ CFG_TEE_SUPP_LOG_LEVEL?=3D1
+ #   This folder can be created with the required permission in an init
+ #   script during boot, else it will be created by the tee-supplicant o=
n
+ #   first REE FS access.
+-CFG_TEE_FS_PARENT_PATH ?=3D /data/tee
++CFG_TEE_FS_PARENT_PATH ?=3D /var/lib/tee
+=20
+ # CFG_TEE_CLIENT_LOG_FILE
+ #   The location of the client log file when logging to file is enabled=
.
+diff --git a/libteec/CMakeLists.txt b/libteec/CMakeLists.txt
+index c742d31..c857369 100644
+--- a/libteec/CMakeLists.txt
++++ b/libteec/CMakeLists.txt
+@@ -14,7 +14,7 @@ endif()
+ # Configuration flags always included
+ #######################################################################=
#########
+ set(CFG_TEE_CLIENT_LOG_LEVEL "1" CACHE STRING "libteec log level")
+-set(CFG_TEE_CLIENT_LOG_FILE "/data/tee/teec.log" CACHE STRING "Location=
 of libteec log")
++set(CFG_TEE_CLIENT_LOG_FILE "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee/tee=
c.log" CACHE STRING "Location of libteec log")
+=20
+ #######################################################################=
#########
+ # Source files
+diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.t=
xt
+index 54a34c7..8df9bef 100644
+--- a/tee-supplicant/CMakeLists.txt
++++ b/tee-supplicant/CMakeLists.txt
+@@ -11,10 +11,15 @@ option(CFG_TEE_SUPP_PLUGINS "Enable tee-supplicant p=
lugin support" ON)
+ set(CFG_TEE_SUPP_LOG_LEVEL "1" CACHE STRING "tee-supplicant log level")
+ # FIXME: Question is, is this really needed? Should just use defaults f=
rom # GNUInstallDirs?
+ set(CFG_TEE_CLIENT_LOAD_PATH "/lib" CACHE STRING "Colon-separated list =
of paths where to look for TAs (see also --ta-dir)")
+-set(CFG_TEE_FS_PARENT_PATH "/data/tee" CACHE STRING "Location of TEE fi=
lesystem (secure storage)")
++set(CFG_TEE_FS_PARENT_PATH "${CMAKE_INSTALL_LOCALSTATEDIR}/lib/tee" CAC=
HE STRING "Location of TEE filesystem (secure storage)")
+ # FIXME: Why do we have if defined(CFG_GP_SOCKETS) && CFG_GP_SOCKETS =3D=
=3D 1 in the c-file?
+ set(CFG_GP_SOCKETS "1" CACHE STRING "Enable GlobalPlatform Socket API s=
upport")
+-set(CFG_TEE_PLUGIN_LOAD_PATH "/usr/lib/tee-supplicant/plugins/" CACHE S=
TRING "tee-supplicant's plugins path")
++set(CFG_TEE_PLUGIN_LOAD_PATH "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_L=
IBDIR}/${PROJECT_NAME}/plugins/" CACHE STRING "tee-supplicant's plugins p=
ath")
++
++set(CFG_TEE_GROUP "tee" CACHE STRING "Group which has access to /dev/te=
e* devices")
++set(CFG_TEEPRIV_GROUP "teepriv" CACHE STRING "Group which has access to=
 /dev/teepriv* devices")
++set(CFG_TEE_SUPPL_USER "teesuppl" CACHE STRING "User account which tee-=
supplicant is started with")
++set(CFG_TEE_SUPPL_GROUP "teesuppl" CACHE STRING "Group account which te=
e-supplicant is started with")
+=20
+ if(CFG_TEE_SUPP_PLUGINS)
+ 	set(CMAKE_INSTALL_RPATH "${CFG_TEE_PLUGIN_LOAD_PATH}")
+@@ -113,3 +118,7 @@ endif()
+ # Install targets
+ #######################################################################=
#########
+ install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBI=
NDIR})
++configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONLY=
)
++install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.servi=
ce DESTINATION ${CMAKE_INSTALL_LIBDIR}/systemd/system)
++configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
++install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DEST=
INATION ${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d)
+diff --git a/tee-supplicant/optee-udev.rules.in b/tee-supplicant/optee-u=
dev.rules.in
+new file mode 100644
+index 0000000..275e833
+--- /dev/null
++++ b/tee-supplicant/optee-udev.rules.in
+@@ -0,0 +1,7 @@
++# SPDX-License-Identifier: BSD-2-Clause
++KERNEL=3D=3D"tee[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"@CFG_T=
EE_GROUP@", TAG+=3D"systemd"
++
++# If a /dev/teepriv[0-9]* device is detected, start an instance of
++# tee-supplicant.service with the device name as parameter
++KERNEL=3D=3D"teepriv[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"@C=
FG_TEEPRIV_GROUP@", \
++    TAG+=3D"systemd", ENV{SYSTEMD_WANTS}+=3D"tee-supplicant@%k.service"
+diff --git a/tee-supplicant/tee-supplicant@.service.in b/tee-supplicant/=
tee-supplicant@.service.in
+new file mode 100644
+index 0000000..e53a935
+--- /dev/null
++++ b/tee-supplicant/tee-supplicant@.service.in
+@@ -0,0 +1,17 @@
++# SPDX-License-Identifier: BSD-2-Clause
++[Unit]
++Description=3DTEE Supplicant on %i
++DefaultDependencies=3Dno
++After=3Ddev-%i.device
++Wants=3Ddev-%i.device
++Conflicts=3Dshutdown.target
++Before=3Dtpm2.target sysinit.target shutdown.target
++
++[Service]
++Type=3Dnotify
++User=3D@CFG_TEE_SUPPL_USER@
++Group=3D@CFG_TEE_SUPPL_GROUP@
++EnvironmentFile=3D-@CMAKE_INSTALL_SYSCONFDIR@/default/tee-supplicant
++ExecStart=3D@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_SBINDIR@/tee-supplica=
nt $OPTARGS
++# Workaround for fTPM TA: stop kernel module before tee-supplicant
++ExecStop=3D-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $=
MAINPID"
+--=20
+2.34.1
+
diff --git a/meta-arm/recipes-security/optee/optee-client/optee-udev.rule=
s b/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
deleted file mode 100644
index 075f469c..00000000
--- a/meta-arm/recipes-security/optee/optee-client/optee-udev.rules
+++ /dev/null
@@ -1,6 +0,0 @@
-KERNEL=3D=3D"tee[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"teeclnt=
", TAG+=3D"systemd"
-
-# If a /dev/teepriv[0-9]* device is detected, start an instance of
-# tee-supplicant.service with the device name as parameter
-KERNEL=3D=3D"teepriv[0-9]*", MODE=3D"0660", OWNER=3D"root", GROUP=3D"tee=
clnt", \
-    TAG+=3D"systemd", ENV{SYSTEMD_WANTS}+=3D"tee-supplicant@%k.service"
diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@=
.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.s=
ervice
deleted file mode 100644
index e3039fde..00000000
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.servic=
e
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=3DTEE Supplicant on %i
-DefaultDependencies=3Dno
-After=3Ddev-%i.device
-Wants=3Ddev-%i.device
-Conflicts=3Dshutdown.target
-Before=3Dtpm2.target sysinit.target shutdown.target
-
-[Service]
-Type=3Dnotify
-EnvironmentFile=3D-@sysconfdir@/default/tee-supplicant
-ExecStart=3D@sbindir@/tee-supplicant $OPTARGS
-ExecStop=3D-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $M=
AINPID"
diff --git a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.3.0.bb
index 4a088004..edab4583 100644
--- a/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_4.3.0.bb
@@ -2,6 +2,8 @@ require recipes-security/optee/optee-client.inc
=20
 SRCREV =3D "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
=20
+SRC_URI +=3D "file://0001-tee-supplicant-add-udev-rule-and-systemd-servi=
ce-fil.patch"
+
 inherit pkgconfig
 DEPENDS +=3D "util-linux"
 EXTRA_OEMAKE +=3D "PKG_CONFIG=3Dpkg-config"
--=20
2.43.0


