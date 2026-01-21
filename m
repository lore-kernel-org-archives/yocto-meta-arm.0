Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD52CA5FDF
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 14:04:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12417.1769004245646665348
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 06:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A27531517;
	Wed, 21 Jan 2026 06:03:58 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.80.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 731F53F694;
	Wed, 21 Jan 2026 06:04:04 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH 3/3] arm/arm-bsp: optee: drop version 4.7.0
Date: Wed, 21 Jan 2026 14:03:36 +0000
Message-ID: <20260121140356.16818-4-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260121140356.16818-1-hugues.kambampiana@arm.com>
References: <20260121140356.16818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Jan 2026 14:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6863

Drop support for OP-TEE version 4.7.0 from the layer as
version 4.9.0 is present.

Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../optee-ftpm/optee-ftpm_4.7.0.bb            | 94 -------------------
 ...ant-update-udev-systemd-install-code.patch | 78 ---------------
 .../optee/optee-client_4.7.0.bb               |  5 -
 .../optee/optee-examples_4.7.0.bb             |  4 -
 .../optee/optee-os-tadevkit_4.7.0.bb          | 30 ------
 .../recipes-security/optee/optee-os_4.7.0.bb  |  8 --
 .../optee/optee-test_4.7.0.bb                 | 14 ---
 7 files changed, 233 deletions(-)
 delete mode 100644 meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0=
.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-client/0001-tee=
-supplicant-update-udev-systemd-install-code.patch
 delete mode 100644 meta-arm/recipes-security/optee/optee-client_4.7.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_4.7.0.=
bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_4.7=
.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-os_4.7.0.bb
 delete mode 100644 meta-arm/recipes-security/optee/optee-test_4.7.0.bb

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb b/m=
eta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
deleted file mode 100644
index 9164f31b..00000000
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_4.7.0.bb
+++ /dev/null
@@ -1,94 +0,0 @@
-SUMMARY =3D "OPTEE fTPM Microsoft TA"
-DESCRIPTION =3D "TCG reference implementation of the TPM 2.0 Specificati=
on."
-HOMEPAGE =3D "https://github.com/microsoft/ms-tpm-20-ref/"
-
-COMPATIBLE_MACHINE ?=3D "invalid"
-COMPATIBLE_MACHINE:genericarm64 =3D "genericarm64"
-COMPATIBLE_MACHINE:qemuarm64 =3D "qemuarm64"
-COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64"
-COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm"
-
-inherit deploy python3native
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5a3925ece0806073ae9ebbb08ff6f=
11e"
-LIC_FILES_CHKSUM +=3D "file://optee-ta/LICENSE;md5=3D5a3925ece0806073ae9=
ebbb08ff6f11e"
-
-DEPENDS =3D "python3-pyelftools-native optee-os-tadevkit python3-cryptog=
raphy-native"
-DEPENDS:append:toolchain-clang =3D " lld-native"
-
-FTPM_UUID =3D "bc50d971-d4c9-42c4-82cb-343fb7f37896"
-
-SRC_URI_ms-tpm   ?=3D "gitsm://github.com/Microsoft/ms-tpm-20-ref;protoc=
ol=3Dhttps"
-SRC_URI_optee-ta ?=3D "gitsm://github.com/OP-TEE/optee_ftpm.git;protocol=
=3Dhttps"
-
-SRCBRANCH_ms-tpm    =3D "main"
-SRCBRANCH_optee-ta  =3D "master"
-
-SRC_URI =3D "\
-    ${SRC_URI_ms-tpm};branch=3D${SRCBRANCH_ms-tpm};name=3Dms-tpm;destsuf=
fix=3Dms-tpm \
-    ${SRC_URI_optee-ta};branch=3D${SRCBRANCH_optee-ta};name=3Doptee-ta;d=
estsuffix=3Dms-tpm/optee-ta \
-"
-
-# As per optee-ftpm TA documentation, we have to use this SHA of MS TPM =
reference
-SRCREV_ms-tpm   ?=3D "98b60a44aba79b15fcce1c0d1e46cf5918400f6a"
-
-# v4.7.0
-SRCREV_optee-ta ?=3D "ce33372ab772e879826361a1ca91126260bd9be1"
-
-SRCREV_FORMAT    =3D "ms-tpm_optee-ta"
-
-UPSTREAM_CHECK_COMMITS =3D "1"
-
-S =3D "${UNPACKDIR}/ms-tpm"
-
-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
-
-EXTRA_OEMAKE +=3D '\
-    COMPILER=3D${TOOLCHAIN} \
-    TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
-    CROSS_COMPILE=3D${TARGET_PREFIX} \
-    CFG_MS_TPM_20_REF=3D"${S}" \
-    CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_HOST}" \
-'
-
-EXTRA_OEMAKE:append:aarch64:qemuall =3D "\
-    CFG_ARM64_ta_arm64=3Dy \
-"
-
-CFLAGS:append:toolchain-clang =3D " -Wno-unknown-warning-option"
-
-# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
-# right path until this is relocated automatically.
-export OPENSSL_MODULES =3D "${STAGING_LIBDIR_NATIVE}/ossl-modules"
-
-PARALLEL_MAKE =3D ""
-
-do_compile() {
-    cd ${S}/optee-ta
-    oe_runmake
-}
-
-do_install () {
-    mkdir -p ${D}/${nonarch_base_libdir}/optee_armtz
-    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.ta ${D}/${nonarch_b=
ase_libdir}/optee_armtz/
-    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.stripped.elf ${D}/$=
{nonarch_base_libdir}/optee_armtz/
-}
-
-do_deploy () {
-    install -d ${DEPLOYDIR}/optee
-    install -D -p -m 0644 ${S}/optee-ta/${FTPM_UUID}.stripped.elf ${DEPL=
OYDIR}/optee/
-}
-
-addtask deploy before do_build after do_install
-
-FILES:${PN} +=3D " \
-               ${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.ta \
-               ${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.stripped.=
elf \
-               "
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-INSANE_SKIP:${PN} +=3D "ldflags"
diff --git a/meta-arm/recipes-security/optee/optee-client/0001-tee-suppli=
cant-update-udev-systemd-install-code.patch b/meta-arm/recipes-security/o=
ptee/optee-client/0001-tee-supplicant-update-udev-systemd-install-code.pa=
tch
deleted file mode 100644
index cd367124..00000000
--- a/meta-arm/recipes-security/optee/optee-client/0001-tee-supplicant-up=
date-udev-systemd-install-code.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 5ddaac7c0770a423eca0cb727403b2f06657ffea Mon Sep 17 00:00:00 2001
-From: Gyorgy Szing <gyorgy.szing@arm.com>
-Date: Tue, 14 Jan 2025 09:42:25 +0100
-Subject: [PATCH 1/1] tee-supplicant: update udev & systemd install code
-
-- Allow optionally using pkg-config to discover install location of
-  systemd service and udev rule files.
-- Make systemd service file generation and installation optional.
-- Make udev rule file generation and installation optional.
-
-Changes are backwards compatible and the default operation is unchanged.
-
-Upstream-Status: Submitted [https://github.com/OP-TEE/optee_client/pull/=
402]
-
-Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
----
- tee-supplicant/CMakeLists.txt | 39 +++++++++++++++++++++++++++++++----
- 1 file changed, 35 insertions(+), 4 deletions(-)
-
-diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.t=
xt
-index 8df9bef..ae1f5a4 100644
---- a/tee-supplicant/CMakeLists.txt
-+++ b/tee-supplicant/CMakeLists.txt
-@@ -7,6 +7,9 @@ option(RPMB_EMU "Enable tee-supplicant to emulate RPMB" =
ON)
- option(CFG_TA_GPROF_SUPPORT "Enable tee-supplicant support for TAs inst=
rumented with gprof" ON)
- option(CFG_FTRACE_SUPPORT "Enable tee-supplicant support for TAs instru=
mented with ftrace" ON)
- option(CFG_TEE_SUPP_PLUGINS "Enable tee-supplicant plugin support" ON)
-+option(CFG_ENABLE_SYSTEMD "Enable systemd service unit file generation.=
" ON)
-+option(CFG_ENABLE_UDEV "Enable udev rules file generation." ON)
-+option(CFG_USE_PKGCONFIG "Use pkg-config for discovering install target=
 directory for systemd and udev files." OFF)
-=20
- set(CFG_TEE_SUPP_LOG_LEVEL "1" CACHE STRING "tee-supplicant log level")
- # FIXME: Question is, is this really needed? Should just use defaults f=
rom # GNUInstallDirs?
-@@ -117,8 +120,36 @@ endif()
- #######################################################################=
#########
- # Install targets
- #######################################################################=
#########
-+# Discover target install location of the systemd and udev files using =
pkg-config
-+if (CFG_USE_PKGCONFIG)
-+	# Note: pkg-config should return setting valid for the target platform=
 and not the host.
-+	include(FindPkgConfig)
-+	if (PKG_CONFIG_FOUND)
-+		pkg_search_module(SYSTEMD systemd)
-+		if (SYSTEMD_FOUND AND CFG_ENABLE_SYSTEMD)
-+			pkg_get_variable(UNIT_DIR systemd systemd_system_unit_dir)
-+			set(SYSTEMD_UNIT_DIR "${UNIT_DIR}" CACHE PATH "Location of systemd u=
nit files.")
-+			unset(UNIT_DIR)
-+		endif()
-+		pkg_search_module(UDEV udev)
-+		if (UDEV_FOUND)
-+			pkg_get_variable(UDEV_DIR udev udev_dir)
-+			set(UDEV_UDEV_DIR "${UDEV_DIR}" CACHE PATH "Location of udev files."=
)
-+			unset(UDEV_DIR)
-+		endif()
-+	endif()
-+endif()
-+
-+# Some sane defaults is discovering through pkgconfig fails or is disab=
led.
-+set(SYSTEMD_UNIT_DIR "${CMAKE_INSTALL_LIBDIR}/systemd/system" CACHE PAT=
H "Location of systemd unit files.")
-+set(UDEV_UDEV_DIR "${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d" CACHE PATH=
 "Location of udev files.")
-+
- install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBI=
NDIR})
--configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONLY=
)
--install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.servi=
ce DESTINATION ${CMAKE_INSTALL_LIBDIR}/systemd/system)
--configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
--install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DEST=
INATION ${CMAKE_INSTALL_SYSCONFDIR}/udev/rules.d)
-+if (CFG_ENABLE_SYSTEMD)
-+	configure_file(tee-supplicant@.service.in tee-supplicant@.service @ONL=
Y)
-+	install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/tee-supplicant@.serv=
ice DESTINATION ${SYSTEMD_UNIT_DIR})
-+endif()
-+if (CFG_ENABLE_UDEV)
-+	configure_file(optee-udev.rules.in optee-udev.rules @ONLY)
-+	install(FILES ${CMAKE_BINARY_DIR}/${PROJECT_NAME}/optee-udev.rules DES=
TINATION ${UDEV_UDEV_DIR})
-+endif()
-\ No newline at end of file
---=20
-2.43.0
-
diff --git a/meta-arm/recipes-security/optee/optee-client_4.7.0.bb b/meta=
-arm/recipes-security/optee/optee-client_4.7.0.bb
deleted file mode 100644
index 2fb157df..00000000
--- a/meta-arm/recipes-security/optee/optee-client_4.7.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require recipes-security/optee/optee-client.inc
-
-# v4.7.0
-SRCREV =3D "23c112a6f05cc5e39bd4aaf52ad515cad532237d"
-SRC_URI +=3D "file://0001-tee-supplicant-update-udev-systemd-install-cod=
e.patch"
diff --git a/meta-arm/recipes-security/optee/optee-examples_4.7.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_4.7.0.bb
deleted file mode 100644
index a926f819..00000000
--- a/meta-arm/recipes-security/optee/optee-examples_4.7.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-security/optee/optee-examples.inc
-
-# v4.7.0
-SRCREV =3D "14321a0607db16099d158478b21a2b2e37b3a935"
diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.7.0.bb b=
/meta-arm/recipes-security/optee/optee-os-tadevkit_4.7.0.bb
deleted file mode 100644
index cca9f62a..00000000
--- a/meta-arm/recipes-security/optee/optee-os-tadevkit_4.7.0.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-require recipes-security/optee/optee-os_${PV}.bb
-
-SUMMARY =3D "OP-TEE Trusted OS TA devkit"
-DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-DEPENDS +=3D "python3-pycryptodome-native"
-DEPENDS:append:toolchain-clang =3D " lld-native"
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
-# Build paths are currently embedded
-INSANE_SKIP:${PN}-dev +=3D "buildpaths"
-
-# Include extra headers needed by SPMC tests to TA DEVKIT.
-# Supported after op-tee v3.20
-EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
-                                        ' CFG_SPMC_TESTS=3Dy', '' , d)}"
diff --git a/meta-arm/recipes-security/optee/optee-os_4.7.0.bb b/meta-arm=
/recipes-security/optee/optee-os_4.7.0.bb
deleted file mode 100644
index 1d5d8ccc..00000000
--- a/meta-arm/recipes-security/optee/optee-os_4.7.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require recipes-security/optee/optee-os.inc
-
-DEPENDS +=3D "dtc-native"
-
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
-
-# v4.7.0
-SRCREV =3D "86846f4fdf14f25b50fd64a87888ca9fe85a9e2b"
diff --git a/meta-arm/recipes-security/optee/optee-test_4.7.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_4.7.0.bb
deleted file mode 100644
index f42e254a..00000000
--- a/meta-arm/recipes-security/optee/optee-test_4.7.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require recipes-security/optee/optee-test.inc
-
-# v4.7.0
-SRCREV =3D "a15be9eca1b7e935917d834284726027dffc8cfb"
-
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

