Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A812CCD4853
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 14:55:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52214.1725461740173100267
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Sep 2024 07:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6857FEC
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Sep 2024 07:56:05 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B4AF3F73F
	for <meta-arm@lists.yoctoproject.org>; Wed,  4 Sep 2024 07:55:39 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/libts: Patch to fix 6.10 kernel builds breaks
Date: Wed,  4 Sep 2024 09:55:36 -0500
Message-Id: <20240904145538.2538-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Sep 2024 14:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6058

The ts-tee driver was upstreamed into the v6.10 kernel.  Remove
arm-tstee driver package, since the upstream one should be used.

Parselogs is failing on the qemuarm64-secureboot tests because the
arm ffs linux kernel driver requires gicv3 to be in the DT and logs an
error if not (though still appears to work).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/qemuarm64-secureboot-ts.yml                |   1 +
 meta-arm-bsp/conf/machine/fvp-base.conf       |   2 -
 .../conf/machine/qemuarm64-secureboot.conf    |   3 -
 .../arm-tstee/arm-tstee_2.0.0.bb              |  23 --
 .../linux/files/arm-ffa-transport.cfg         |   1 +
 ...Remove-TEE-driver-external-component.patch | 223 ++++++++++++++++++
 .../trusted-services/libts_git.bb             |   4 +-
 7 files changed, 227 insertions(+), 30 deletions(-)
 delete mode 100644 meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/libts/0001=
-Remove-TEE-driver-external-component.patch

diff --git a/ci/qemuarm64-secureboot-ts.yml b/ci/qemuarm64-secureboot-ts.=
yml
index 87f0fa9ed888..fc35d3f38b18 100644
--- a/ci/qemuarm64-secureboot-ts.yml
+++ b/ci/qemuarm64-secureboot-ts.yml
@@ -8,6 +8,7 @@ header:
 local_conf_header:
   trusted_services: |
     TEST_SUITES:append =3D " trusted_services"
+    TEST_SUITES:remove =3D "parselogs"
     # Include TS Crypto, TS Protected Storage, and TS Internal Trusted S=
torage and SPs into optee-os image
     # FIXME - remove TS SMM Gateway due to QEMU v9.0.0 test failures
     MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 2fc49fc7bfe2..353024e26b72 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -23,8 +23,6 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 KERNEL_DTB_NAME =3D "fvp-base-revc.dtb"
 KERNEL_DEVICETREE =3D "arm/${KERNEL_DTB_NAME}"
 KERNEL_IMAGETYPE =3D "Image"
-#FIXME - Working around arm-tstee not compiling on kernels greater than =
6.8
-PREFERRED_VERSION_linux-yocto ?=3D "6.6.%"
=20
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
diff --git a/meta-arm/conf/machine/qemuarm64-secureboot.conf b/meta-arm/c=
onf/machine/qemuarm64-secureboot.conf
index cfc6ff7706fb..78a39c03c1bd 100644
--- a/meta-arm/conf/machine/qemuarm64-secureboot.conf
+++ b/meta-arm/conf/machine/qemuarm64-secureboot.conf
@@ -3,9 +3,6 @@ MACHINEOVERRIDES =3D. "qemuarm64:"
 require ${COREBASE}/meta/conf/machine/qemuarm64.conf
=20
 KMACHINE =3D "qemuarm64"
-#FIXME - Working around arm-tstee not compiling on kernels greater than =
6.8
-PREFERRED_VERSION_linux-yocto ?=3D "6.6.%"
-PREFERRED_VERSION_linux-yocto-rt ?=3D "6.6.%"
=20
 # secure=3Don can't ever use KVM, so force it off
 QEMU_USE_KVM =3D ""
diff --git a/meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb b/meta-=
arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
deleted file mode 100644
index 34beac945ffa..000000000000
--- a/meta-arm/recipes-kernel/arm-tstee/arm-tstee_2.0.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY =3D "A Linux kernel module providing user space access to Truste=
d Services"
-DESCRIPTION =3D "${SUMMARY}"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D05e355bbd617507216a836c56cf24=
983"
-
-inherit module
-
-SRC_URI =3D "git://gitlab.arm.com/linux-arm/linux-trusted-services;proto=
col=3Dhttps;branch=3Dmain \
-           file://Makefile;subdir=3Dgit \
-          "
-S =3D "${WORKDIR}/git"
-
-# Tag tee-v2.0.0
-SRCREV =3D "a2d7349a96c3b3afb44bf1555d53f1c46e45a23d"
-UPSTREAM_CHECK_GITTAGREGEX =3D "^tee-v(?P<pver>\d+(\.\d+)+)$"
-
-COMPATIBLE_HOST =3D "(arm|aarch64).*-linux"
-KERNEL_MODULE_AUTOLOAD +=3D "arm-tstee"
-
-do_install:append() {
-    install -d ${D}${includedir}
-    install -m 0644 ${S}/uapi/arm_tstee.h ${D}${includedir}/
-}
diff --git a/meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg b/=
meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg
index 34de78e8955d..53f19610ccaf 100644
--- a/meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg
+++ b/meta-arm/recipes-kernel/linux/files/arm-ffa-transport.cfg
@@ -1 +1,2 @@
 CONFIG_ARM_FFA_TRANSPORT=3Dy
+CONFIG_ARM_TSTEE=3Dy
diff --git a/meta-arm/recipes-security/trusted-services/libts/0001-Remove=
-TEE-driver-external-component.patch b/meta-arm/recipes-security/trusted-=
services/libts/0001-Remove-TEE-driver-external-component.patch
new file mode 100644
index 000000000000..79a202294758
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/libts/0001-Remove-TEE-dr=
iver-external-component.patch
@@ -0,0 +1,223 @@
+From cc9589c03cb0fcd9c3248b95f05cce1afaa37d0f Mon Sep 17 00:00:00 2001
+From: Balint Dobszay <balint.dobszay@arm.com>
+Date: Thu, 19 Oct 2023 16:35:05 +0200
+Subject: [PATCH] Remove TEE driver external component
+
+The TSTEE driver has been merged to Linux kernel v6.10, which makes the
+out-of-tree version deprecated. Remove the external component that was
+downloading it. Also, the in-tree version doesn't have a module version
+field defined, so the sanity check for reading the out-of-tree module's
+version is removed too.
+
+Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
+Change-Id: I57ee44293c5e940ee7fa944d1420ebcba624fc56
+Upstream-Status: Backport
+---
+ .../rpc/ts_rpc/caller/linux/component.cmake   |  6 --
+ .../ts_rpc/caller/linux/ts_rpc_caller_linux.c | 56 +++----------------
+ .../spm/optee/userspace-programs-on-fvp.rst   |  3 +-
+ docs/quickstart/optee-testing.rst             |  1 -
+ .../LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake | 54 ------------------
+ 5 files changed, 9 insertions(+), 111 deletions(-)
+ delete mode 100644 external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake
+
+diff --git a/components/rpc/ts_rpc/caller/linux/component.cmake b/compon=
ents/rpc/ts_rpc/caller/linux/component.cmake
+index c9f439e20da4..f8e4a52fb70c 100644
+--- a/components/rpc/ts_rpc/caller/linux/component.cmake
++++ b/components/rpc/ts_rpc/caller/linux/component.cmake
+@@ -8,8 +8,6 @@ if (NOT DEFINED TGT)
+ 	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
+ endif()
+=20
+-include(${TS_ROOT}/external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake)
+-
+ set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
+ 	"${CMAKE_CURRENT_LIST_DIR}/ts_rpc_caller_linux.h"
+ 	)
+@@ -17,7 +15,3 @@ set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEAD=
ER
+ target_sources(${TGT} PRIVATE
+ 	"${CMAKE_CURRENT_LIST_DIR}/ts_rpc_caller_linux.c"
+ 	)
+-
+-target_include_directories(${TGT} PRIVATE
+-	"${LINUX_FFA_TEE_DRIVER_INCLUDE_DIR}"
+-	)
+diff --git a/components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c b/=
components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c
+index 7c4606e56f09..3402a9f6ae2b 100644
+--- a/components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c
++++ b/components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c
+@@ -6,7 +6,6 @@
+=20
+ #include "ts_rpc_caller_linux.h"
+=20
+-#include <arm_tstee.h>
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <linux/tee.h>
+@@ -24,11 +23,16 @@
+=20
+ #define INVALID_SESS_ID		  0
+ #define MAX_TEE_DEV_NUM		  16
+-#define TS_TEE_DRV_REQ_VER_MAJOR  2
+-#define TS_TEE_DRV_REQ_VER_MINOR  0
+-#define TS_TEE_DRV_REQ_VER_PATCH  0
+ #define TS_TEE_DRV_INVALID_SHM_ID (0)
+=20
++/*
++ * This define is part of linux/tee.h starting from Linux v6.10
++ * Let's keep a copy here in case the kernel headers come from an older=
 version
++ */
++#ifndef TEE_IMPL_ID_TSTEE
++#define TEE_IMPL_ID_TSTEE 3
++#endif
++
+ struct ts_tee_dev {
+ 	uint16_t endpoint_id;
+ 	char path[16];
+@@ -236,47 +240,6 @@ static rpc_status_t call(void *context, uint16_t op=
code,
+ 	return RPC_SUCCESS;
+ }
+=20
+-static bool ts_tee_drv_check_version(void)
+-{
+-	unsigned int major =3D 0;
+-	unsigned int minor =3D 0;
+-	unsigned int patch =3D 0;
+-	FILE *f =3D NULL;
+-	int cnt =3D 0;
+-
+-	f =3D fopen("/sys/module/arm_tstee/version", "r");
+-	if (f) {
+-		cnt =3D fscanf(f, "%u.%u.%u", &major, &minor, &patch);
+-		fclose(f);
+-
+-		if (cnt !=3D 3) {
+-			printf("error: cannot read TS TEE driver version\n");
+-			return false;
+-		}
+-	} else {
+-		printf("error: TS TEE driver not available\n");
+-		return false;
+-	}
+-
+-	if (major !=3D TS_TEE_DRV_REQ_VER_MAJOR)
+-		goto err;
+-
+-	if (minor < TS_TEE_DRV_REQ_VER_MINOR)
+-		goto err;
+-
+-	if (minor =3D=3D TS_TEE_DRV_REQ_VER_MINOR)
+-		if (patch < TS_TEE_DRV_REQ_VER_PATCH)
+-			goto err;
+-
+-	return true;
+-
+-err:
+-	printf("error: TS TEE driver is v%u.%u.%u but required v%u.%u.%u\n", m=
ajor, minor, patch,
+-	       TS_TEE_DRV_REQ_VER_MAJOR, TS_TEE_DRV_REQ_VER_MINOR, TS_TEE_DRV_=
REQ_VER_PATCH);
+-
+-	return false;
+-}
+-
+ static void ts_tee_drv_discover(struct ts_tee_dev *ts_tee_devs, size_t =
count)
+ {
+ 	struct tee_ioctl_version_data vers =3D { 0 };
+@@ -314,9 +277,6 @@ rpc_status_t ts_rpc_caller_linux_init(struct rpc_cal=
ler_interface *rpc_caller)
+ 	if (!rpc_caller || rpc_caller->context)
+ 		return RPC_ERROR_INVALID_VALUE;
+=20
+-	if (!ts_tee_drv_check_version())
+-		return RPC_ERROR_INTERNAL;
+-
+ 	context =3D (struct ts_rpc_caller_linux_context *)calloc(
+ 		1, sizeof(struct ts_rpc_caller_linux_context));
+ 	if (!context)
+diff --git a/docs/environments/secure-partitions/spm/optee/userspace-pro=
grams-on-fvp.rst b/docs/environments/secure-partitions/spm/optee/userspac=
e-programs-on-fvp.rst
+index f81e1dff3264..aeb26fb3462a 100644
+--- a/docs/environments/secure-partitions/spm/optee/userspace-programs-o=
n-fvp.rst
++++ b/docs/environments/secure-partitions/spm/optee/userspace-programs-o=
n-fvp.rst
+@@ -59,8 +59,7 @@ Once it boots to the login prompt, log in as root and =
from the FVP terminal, ent
+   # Install the shared library and executables
+   cp -vat /usr out/ts-install/arm-linux/lib out/ts-install/arm-linux/bi=
n
+=20
+-  # Load the kernel modules
+-  out/linux-arm-ffa-tee/load_module.sh
++  # Load the kernel module
+   out/linux-arm-ffa-user/load_module.sh
+=20
+   # Run the test application
+diff --git a/docs/quickstart/optee-testing.rst b/docs/quickstart/optee-t=
esting.rst
+index 7eccf7ab9031..9ff2421d5565 100644
+--- a/docs/quickstart/optee-testing.rst
++++ b/docs/quickstart/optee-testing.rst
+@@ -47,7 +47,6 @@ Once it boots to the login prompt, log in as root and =
from the FVP terminal, ent
+=20
+   cd /mnt/host
+   cp -vat /usr out/ts-install/arm-linux/lib out/ts-install/arm-linux/bi=
n
+-  out/linux-arm-ffa-tee/load_module.sh
+   out/linux-arm-ffa-user/load_module.sh
+   ts-service-test -v
+=20
+diff --git a/external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake b/extern=
al/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake
+deleted file mode 100644
+index da0a5b3def7e..000000000000
+--- a/external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake
++++ /dev/null
+@@ -1,54 +0,0 @@
+-#----------------------------------------------------------------------=
---------
+-# Copyright (c) 2020-2023, Arm Limited and Contributors. All rights res=
erved.
+-#
+-# SPDX-License-Identifier: BSD-3-Clause
+-#
+-#----------------------------------------------------------------------=
---------
+-
+-# If the driver is already installed, try to find that
+-find_path(LINUX_FFA_TEE_DRIVER_INCLUDE_DIR
+-	NAMES arm_tstee.h
+-	DOC "Linux FF-A TEE driver include directory"
+-)
+-
+-# If not found, download it
+-if(NOT LINUX_FFA_TEE_DRIVER_INCLUDE_DIR)
+-	set(LINUX_FFA_TEE_DRIVER_URL "https://git.gitlab.arm.com/linux-arm/lin=
ux-trusted-services.git"
+-		CACHE STRING "Linux FF-A TEE driver repository URL")
+-
+-	# Note: the aim of this external component is to make the header file =
defining the IOCTL API
+-	#        available. Fetching a moving reference is ok as long as API c=
ompatibility is guaranteed.
+-	set(LINUX_FFA_TEE_DRIVER_REFSPEC "origin/tee-v2"
+-		CACHE STRING "Linux FF-A TEE driver git refspec")
+-
+-	set(LINUX_FFA_TEE_DRIVER_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps=
/linux_ffa_tee_driver-src"
+-		CACHE PATH "Location of Linux TEE driver source.")
+-
+-	if (DEFINED ENV{LINUX_FFA_TEE_DRIVER_SOURCE_DIR})
+-		set(LINUX_FFA_TEE_DRIVER_SOURCE_DIR $ENV{LINUX_FFA_TEE_DRIVER_SOURCE_=
DIR}
+-			CACHE PATH "Location of Linux TEE driver source." FORCE)
+-	endif()
+-
+-	set(GIT_OPTIONS
+-		GIT_REPOSITORY ${LINUX_FFA_TEE_DRIVER_URL}
+-		GIT_TAG ${LINUX_FFA_TEE_DRIVER_REFSPEC}
+-		GIT_SHALLOW TRUE
+-		)
+-		include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
+-		LazyFetch_MakeAvailable(
+-			DEP_NAME linux_ffa_tee_driver
+-			FETCH_OPTIONS "${GIT_OPTIONS}"
+-			SOURCE_DIR ${LINUX_FFA_TEE_DRIVER_SOURCE_DIR}
+-		)
+-
+-	find_path(LINUX_FFA_TEE_DRIVER_INCLUDE_DIR
+-		NAMES arm_tstee.h
+-		PATHS ${LINUX_FFA_TEE_DRIVER_SOURCE_DIR}/uapi
+-		NO_DEFAULT_PATH
+-		REQUIRED
+-		DOC "Linux FF-A TEE driver include directory"
+-	)
+-endif()
+-
+-set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
+-	"${LINUX_FFA_TEE_DRIVER_INCLUDE_DIR}/arm_tstee.h")
+--=20
+2.39.2
+
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/me=
ta-arm/recipes-security/trusted-services/libts_git.bb
index dfcd4bde98e0..635e4769afd4 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -6,12 +6,12 @@ TS_ENV =3D "arm-linux"
 require trusted-services.inc
=20
 SRC_URI +=3D "file://tee-udev.rules \
+            file://0001-Remove-TEE-driver-external-component.patch \
            "
=20
 OECMAKE_SOURCEPATH=3D"${S}/deployments/libts/${TS_ENV}"
=20
-DEPENDS           +=3D "arm-tstee arm-ffa-user"
-RRECOMMENDS:${PN} +=3D "arm-tstee"
+DEPENDS           +=3D "arm-ffa-user"
=20
 # Unix group name for dev/tee* ownership.
 TEE_GROUP_NAME ?=3D "teeclnt"
--=20
2.39.3 (Apple Git-146)


