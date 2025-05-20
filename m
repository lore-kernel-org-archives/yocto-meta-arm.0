Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45920C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.26822.1747762081962429538
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 May 2025 10:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D14FA1516;
	Tue, 20 May 2025 10:27:47 -0700 (PDT)
Received: from gyoszi01-yocto.budapest.arm.com (ubul2.budapest.arm.com [10.45.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA1B93F5A1;
	Tue, 20 May 2025 10:28:00 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 1/9] arm/trusted-services: update to newer version
Date: Tue, 20 May 2025 19:27:39 +0200
Message-ID: <20250520172748.3439803-1-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 May 2025 17:28:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6508

Bump the TS SHA to latest integration.
Set the version of TS dependencies as required.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 .../0001-Relax-pyelftools-dependency.patch    |  31 +++
 ...MbedTLS-3.6-and-GCC-14-compatibility.patch |  57 +++++
 ...Remove-TEE-driver-external-component.patch | 223 ------------------
 .../trusted-services/libts_git.bb             |   2 -
 .../trusted-services/trusted-services-src.inc |  21 +-
 5 files changed, 97 insertions(+), 237 deletions(-)
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0001=
-Relax-pyelftools-dependency.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/files/0002=
-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch
 delete mode 100644 meta-arm/recipes-security/trusted-services/libts/0001=
-Remove-TEE-driver-external-component.patch

diff --git a/meta-arm/recipes-security/trusted-services/files/0001-Relax-=
pyelftools-dependency.patch b/meta-arm/recipes-security/trusted-services/=
files/0001-Relax-pyelftools-dependency.patch
new file mode 100644
index 00000000..5b54e234
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0001-Relax-pyelfto=
ols-dependency.patch
@@ -0,0 +1,31 @@
+From f2f867d3d84415f82c1750fa8d1f47842a7b7287 Mon Sep 17 00:00:00 2001
+From: kas User <kas@example.com>
+Date: Tue, 11 Mar 2025 15:19:58 +0000
+Subject: [PATCH 1/1] Relax pyelftools dependency
+
+tools/python/elf_segments_to_manifest.py was only accpeting pyelftools v=
0.31.
+Relax this requirement to accept v0.31 and newer versions.
+
+Upstream-Status: Pending
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+
+---
+ tools/python/elf_segments_to_manifest.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/python/elf_segments_to_manifest.py b/tools/python/elf=
_segments_to_manifest.py
+index 378c318d4..52c12e0f4 100644
+--- a/tools/python/elf_segments_to_manifest.py
++++ b/tools/python/elf_segments_to_manifest.py
+@@ -16,7 +16,7 @@ from elftools import __version__ as module_version
+ from elftools.elf.elffile import ELFFile
+ from elftools.elf.constants import P_FLAGS
+=20
+-assert module_version =3D=3D "0.31"
++assert module_version >=3D "0.31"
+=20
+ class ElfSegmentsToManifest:
+     """
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-security/trusted-services/files/0002-Fix-Mb=
edTLS-3.6-and-GCC-14-compatibility.patch b/meta-arm/recipes-security/trus=
ted-services/files/0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch
new file mode 100644
index 00000000..ecd45abd
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/files/0002-Fix-MbedTLS-3=
.6-and-GCC-14-compatibility.patch
@@ -0,0 +1,57 @@
+From 919015a92dc0b98bbef81fb68cd9f90b89abb2dd Mon Sep 17 00:00:00 2001
+From: Gyorgy Szing <gyorgy.szing@arm.com>
+Date: Thu, 17 Oct 2024 09:46:58 +0000
+Subject: [PATCH 1/1] Fix MbedTLS 3.6 and GCC 14 compatibility
+
+For details please see the patch file.
+
+Upstream-Status: Pending
+
+Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
+---
+ ...or-triggered-build-issue-with-gcc-14.patch | 33 +++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+ create mode 100644 external/MbedTLS/0002-Fix-Werror-triggered-build-iss=
ue-with-gcc-14.patch
+
+diff --git a/external/MbedTLS/0002-Fix-Werror-triggered-build-issue-with=
-gcc-14.patch b/external/MbedTLS/0002-Fix-Werror-triggered-build-issue-wi=
th-gcc-14.patch
+new file mode 100644
+index 000000000..6e195f927
+--- /dev/null
++++ b/external/MbedTLS/0002-Fix-Werror-triggered-build-issue-with-gcc-14=
.patch
+@@ -0,0 +1,33 @@
++From 390c4bd9822b44b1f4c366e62634d328e8baf9a1 Mon Sep 17 00:00:00 2001
++From: Gyorgy Szing <gyorgy.szing@arm.com>
++Date: Thu, 17 Oct 2024 08:54:22 +0000
++Subject: [PATCH 1/1] Fix -Werror triggered build issue with gcc 14
++
++GCC 14 emits new warnings when compiling MbedTLS v3.6. This is
++a known issue (see [1]) and I am taking the proposed fix.
++
++https://github.com/Mbed-TLS/mbedtls/issues/9003#issuecomment-2108239255
++
++Upstream-Status: Pending
++
++Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
++---
++ library/common.h | 2 +-
++ 1 file changed, 1 insertion(+), 1 deletion(-)
++
++diff --git a/library/common.h b/library/common.h
++index 3936ffdfe1..d8c4073198 100644
++--- a/library/common.h
+++++ b/library/common.h
++@@ -199,7 +199,7 @@ static inline void mbedtls_xor(unsigned char *r,
++         uint8x16_t x =3D veorq_u8(v1, v2);
++         vst1q_u8(r + i, x);
++     }
++-#if defined(__IAR_SYSTEMS_ICC__)
+++#if defined(__IAR_SYSTEMS_ICC__) || defined(MBEDTLS_COMPILER_IS_GCC)
++     /* This if statement helps some compilers (e.g., IAR) optimise out=
 the byte-by-byte tail case
++      * where n is a constant multiple of 16.
++      * For other compilers (e.g. recent gcc and clang) it makes no dif=
ference if n is a compile-time
++--=20
++2.43.0
++
+--=20
+2.43.0
+
diff --git a/meta-arm/recipes-security/trusted-services/libts/0001-Remove=
-TEE-driver-external-component.patch b/meta-arm/recipes-security/trusted-=
services/libts/0001-Remove-TEE-driver-external-component.patch
deleted file mode 100644
index 79a20229..00000000
--- a/meta-arm/recipes-security/trusted-services/libts/0001-Remove-TEE-dr=
iver-external-component.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From cc9589c03cb0fcd9c3248b95f05cce1afaa37d0f Mon Sep 17 00:00:00 2001
-From: Balint Dobszay <balint.dobszay@arm.com>
-Date: Thu, 19 Oct 2023 16:35:05 +0200
-Subject: [PATCH] Remove TEE driver external component
-
-The TSTEE driver has been merged to Linux kernel v6.10, which makes the
-out-of-tree version deprecated. Remove the external component that was
-downloading it. Also, the in-tree version doesn't have a module version
-field defined, so the sanity check for reading the out-of-tree module's
-version is removed too.
-
-Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
-Change-Id: I57ee44293c5e940ee7fa944d1420ebcba624fc56
-Upstream-Status: Backport
----
- .../rpc/ts_rpc/caller/linux/component.cmake   |  6 --
- .../ts_rpc/caller/linux/ts_rpc_caller_linux.c | 56 +++----------------
- .../spm/optee/userspace-programs-on-fvp.rst   |  3 +-
- docs/quickstart/optee-testing.rst             |  1 -
- .../LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake | 54 ------------------
- 5 files changed, 9 insertions(+), 111 deletions(-)
- delete mode 100644 external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake
-
-diff --git a/components/rpc/ts_rpc/caller/linux/component.cmake b/compon=
ents/rpc/ts_rpc/caller/linux/component.cmake
-index c9f439e20da4..f8e4a52fb70c 100644
---- a/components/rpc/ts_rpc/caller/linux/component.cmake
-+++ b/components/rpc/ts_rpc/caller/linux/component.cmake
-@@ -8,8 +8,6 @@ if (NOT DEFINED TGT)
- 	message(FATAL_ERROR "mandatory parameter TGT is not defined.")
- endif()
-=20
--include(${TS_ROOT}/external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake)
--
- set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEADER
- 	"${CMAKE_CURRENT_LIST_DIR}/ts_rpc_caller_linux.h"
- 	)
-@@ -17,7 +15,3 @@ set_property(TARGET ${TGT} APPEND PROPERTY PUBLIC_HEAD=
ER
- target_sources(${TGT} PRIVATE
- 	"${CMAKE_CURRENT_LIST_DIR}/ts_rpc_caller_linux.c"
- 	)
--
--target_include_directories(${TGT} PRIVATE
--	"${LINUX_FFA_TEE_DRIVER_INCLUDE_DIR}"
--	)
-diff --git a/components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c b/=
components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c
-index 7c4606e56f09..3402a9f6ae2b 100644
---- a/components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c
-+++ b/components/rpc/ts_rpc/caller/linux/ts_rpc_caller_linux.c
-@@ -6,7 +6,6 @@
-=20
- #include "ts_rpc_caller_linux.h"
-=20
--#include <arm_tstee.h>
- #include <errno.h>
- #include <fcntl.h>
- #include <linux/tee.h>
-@@ -24,11 +23,16 @@
-=20
- #define INVALID_SESS_ID		  0
- #define MAX_TEE_DEV_NUM		  16
--#define TS_TEE_DRV_REQ_VER_MAJOR  2
--#define TS_TEE_DRV_REQ_VER_MINOR  0
--#define TS_TEE_DRV_REQ_VER_PATCH  0
- #define TS_TEE_DRV_INVALID_SHM_ID (0)
-=20
-+/*
-+ * This define is part of linux/tee.h starting from Linux v6.10
-+ * Let's keep a copy here in case the kernel headers come from an older=
 version
-+ */
-+#ifndef TEE_IMPL_ID_TSTEE
-+#define TEE_IMPL_ID_TSTEE 3
-+#endif
-+
- struct ts_tee_dev {
- 	uint16_t endpoint_id;
- 	char path[16];
-@@ -236,47 +240,6 @@ static rpc_status_t call(void *context, uint16_t op=
code,
- 	return RPC_SUCCESS;
- }
-=20
--static bool ts_tee_drv_check_version(void)
--{
--	unsigned int major =3D 0;
--	unsigned int minor =3D 0;
--	unsigned int patch =3D 0;
--	FILE *f =3D NULL;
--	int cnt =3D 0;
--
--	f =3D fopen("/sys/module/arm_tstee/version", "r");
--	if (f) {
--		cnt =3D fscanf(f, "%u.%u.%u", &major, &minor, &patch);
--		fclose(f);
--
--		if (cnt !=3D 3) {
--			printf("error: cannot read TS TEE driver version\n");
--			return false;
--		}
--	} else {
--		printf("error: TS TEE driver not available\n");
--		return false;
--	}
--
--	if (major !=3D TS_TEE_DRV_REQ_VER_MAJOR)
--		goto err;
--
--	if (minor < TS_TEE_DRV_REQ_VER_MINOR)
--		goto err;
--
--	if (minor =3D=3D TS_TEE_DRV_REQ_VER_MINOR)
--		if (patch < TS_TEE_DRV_REQ_VER_PATCH)
--			goto err;
--
--	return true;
--
--err:
--	printf("error: TS TEE driver is v%u.%u.%u but required v%u.%u.%u\n", m=
ajor, minor, patch,
--	       TS_TEE_DRV_REQ_VER_MAJOR, TS_TEE_DRV_REQ_VER_MINOR, TS_TEE_DRV_=
REQ_VER_PATCH);
--
--	return false;
--}
--
- static void ts_tee_drv_discover(struct ts_tee_dev *ts_tee_devs, size_t =
count)
- {
- 	struct tee_ioctl_version_data vers =3D { 0 };
-@@ -314,9 +277,6 @@ rpc_status_t ts_rpc_caller_linux_init(struct rpc_cal=
ler_interface *rpc_caller)
- 	if (!rpc_caller || rpc_caller->context)
- 		return RPC_ERROR_INVALID_VALUE;
-=20
--	if (!ts_tee_drv_check_version())
--		return RPC_ERROR_INTERNAL;
--
- 	context =3D (struct ts_rpc_caller_linux_context *)calloc(
- 		1, sizeof(struct ts_rpc_caller_linux_context));
- 	if (!context)
-diff --git a/docs/environments/secure-partitions/spm/optee/userspace-pro=
grams-on-fvp.rst b/docs/environments/secure-partitions/spm/optee/userspac=
e-programs-on-fvp.rst
-index f81e1dff3264..aeb26fb3462a 100644
---- a/docs/environments/secure-partitions/spm/optee/userspace-programs-o=
n-fvp.rst
-+++ b/docs/environments/secure-partitions/spm/optee/userspace-programs-o=
n-fvp.rst
-@@ -59,8 +59,7 @@ Once it boots to the login prompt, log in as root and =
from the FVP terminal, ent
-   # Install the shared library and executables
-   cp -vat /usr out/ts-install/arm-linux/lib out/ts-install/arm-linux/bi=
n
-=20
--  # Load the kernel modules
--  out/linux-arm-ffa-tee/load_module.sh
-+  # Load the kernel module
-   out/linux-arm-ffa-user/load_module.sh
-=20
-   # Run the test application
-diff --git a/docs/quickstart/optee-testing.rst b/docs/quickstart/optee-t=
esting.rst
-index 7eccf7ab9031..9ff2421d5565 100644
---- a/docs/quickstart/optee-testing.rst
-+++ b/docs/quickstart/optee-testing.rst
-@@ -47,7 +47,6 @@ Once it boots to the login prompt, log in as root and =
from the FVP terminal, ent
-=20
-   cd /mnt/host
-   cp -vat /usr out/ts-install/arm-linux/lib out/ts-install/arm-linux/bi=
n
--  out/linux-arm-ffa-tee/load_module.sh
-   out/linux-arm-ffa-user/load_module.sh
-   ts-service-test -v
-=20
-diff --git a/external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake b/extern=
al/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake
-deleted file mode 100644
-index da0a5b3def7e..000000000000
---- a/external/LinuxFfaTeeDriver/LinuxFfaTeeDriver.cmake
-+++ /dev/null
-@@ -1,54 +0,0 @@
--#----------------------------------------------------------------------=
---------
--# Copyright (c) 2020-2023, Arm Limited and Contributors. All rights res=
erved.
--#
--# SPDX-License-Identifier: BSD-3-Clause
--#
--#----------------------------------------------------------------------=
---------
--
--# If the driver is already installed, try to find that
--find_path(LINUX_FFA_TEE_DRIVER_INCLUDE_DIR
--	NAMES arm_tstee.h
--	DOC "Linux FF-A TEE driver include directory"
--)
--
--# If not found, download it
--if(NOT LINUX_FFA_TEE_DRIVER_INCLUDE_DIR)
--	set(LINUX_FFA_TEE_DRIVER_URL "https://git.gitlab.arm.com/linux-arm/lin=
ux-trusted-services.git"
--		CACHE STRING "Linux FF-A TEE driver repository URL")
--
--	# Note: the aim of this external component is to make the header file =
defining the IOCTL API
--	#        available. Fetching a moving reference is ok as long as API c=
ompatibility is guaranteed.
--	set(LINUX_FFA_TEE_DRIVER_REFSPEC "origin/tee-v2"
--		CACHE STRING "Linux FF-A TEE driver git refspec")
--
--	set(LINUX_FFA_TEE_DRIVER_SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/_deps=
/linux_ffa_tee_driver-src"
--		CACHE PATH "Location of Linux TEE driver source.")
--
--	if (DEFINED ENV{LINUX_FFA_TEE_DRIVER_SOURCE_DIR})
--		set(LINUX_FFA_TEE_DRIVER_SOURCE_DIR $ENV{LINUX_FFA_TEE_DRIVER_SOURCE_=
DIR}
--			CACHE PATH "Location of Linux TEE driver source." FORCE)
--	endif()
--
--	set(GIT_OPTIONS
--		GIT_REPOSITORY ${LINUX_FFA_TEE_DRIVER_URL}
--		GIT_TAG ${LINUX_FFA_TEE_DRIVER_REFSPEC}
--		GIT_SHALLOW TRUE
--		)
--		include(${TS_ROOT}/tools/cmake/common/LazyFetch.cmake REQUIRED)
--		LazyFetch_MakeAvailable(
--			DEP_NAME linux_ffa_tee_driver
--			FETCH_OPTIONS "${GIT_OPTIONS}"
--			SOURCE_DIR ${LINUX_FFA_TEE_DRIVER_SOURCE_DIR}
--		)
--
--	find_path(LINUX_FFA_TEE_DRIVER_INCLUDE_DIR
--		NAMES arm_tstee.h
--		PATHS ${LINUX_FFA_TEE_DRIVER_SOURCE_DIR}/uapi
--		NO_DEFAULT_PATH
--		REQUIRED
--		DOC "Linux FF-A TEE driver include directory"
--	)
--endif()
--
--set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS
--	"${LINUX_FFA_TEE_DRIVER_INCLUDE_DIR}/arm_tstee.h")
---=20
-2.39.2
-
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/me=
ta-arm/recipes-security/trusted-services/libts_git.bb
index 0c874e66..6bc19b66 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -5,8 +5,6 @@ TS_ENV =3D "arm-linux"
=20
 require trusted-services.inc
=20
-SRC_URI +=3D "file://0001-Remove-TEE-driver-external-component.patch \
-           "
 # If optee-client is not included, take care of udev and related configu=
ration.
 require ${@bb.utils.contains('IMAGE_INSTALL', 'optee-client', '', 'libts=
-udev.inc', d)}
=20
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index b3e01315..c321c1c1 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -9,10 +9,12 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
=20
 SRC_URI:append =3D "\
     file://0001-Allow-configuring-flash-image-files-compile-time.patch \
+    file://0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch \
+    file://0001-Relax-pyelftools-dependency.patch \
 "
=20
-# Trusted Services; aka. 2024 April 19
-SRCREV_trusted-services =3D "602be607198ea784bc5ab1c0c9d3ac4e2c67f1d9"
+# Trusted Services; aka. v1.1.0
+SRCREV_trusted-services =3D "83bd53b6689ebb071bc13fcd4e01618bab2e74ca"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 S =3D "${WORKDIR}/git/trusted-services"
@@ -24,14 +26,14 @@ SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc=
;protocol=3Dhttps;branch=3Dmain;des
 SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
 LIC_FILES_CHKSUM +=3D "file://../dtc/README.license;md5=3Da1eb22e37f09df=
5b5511b8a278992d0e"
=20
-# MbedTLS, tag "v3.5.1"
-SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protoc=
ol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/mbedtls"
-SRCREV_mbedtls =3D "15254759342494c7e969766d5424d78d7deb9bfa"
+# MbedTLS, tag "v3.6.0"
+SRC_URI +=3D "gitsm://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;prot=
ocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/mbedtls"
+SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
 LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1=
ef1630d341e026d"
=20
-# Nanopb, tag "nanopb-0.4.7" plus some further fixes
+# Nanopb, tag "nanopb-0.4.8" plus some further fixes
 SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=3D=
https;branch=3Dmaster;destsuffix=3Dgit/nanopb"
-SRCREV_nanopb =3D "dbbf5d8992295aae669b8071eadad02f87d5faf0"
+SRCREV_nanopb =3D "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
 LIC_FILES_CHKSUM +=3D "file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a399=
4384112efcdb37c01f"
=20
 # qcbor, tag "v1.0.0"
@@ -63,11 +65,6 @@ do_apply_local_src_patches() {
     apply_local_src_patches ${S}/external/nanopb ${WORKDIR}/git/nanopb
 }
=20
-do_config:append:() {
-    # Fine tune MbedTLS configuration for crypto only operation.
-    sh -c "cd ${WORKDIR}/git/mbedtls; python3 scripts/config.py crypto"
-}
-
 # Paths to dependencies required by some TS SPs/tools
 EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${WORKDIR}/git/dtc \
                   -DCPPUTEST_SOURCE_DIR=3D${WORKDIR}/git/cpputest \
--=20
2.43.0


