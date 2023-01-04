Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB095C5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:33:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10859.1672835630962486774
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Jan 2023 04:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BB5C1655;
	Wed,  4 Jan 2023 04:34:32 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 198703F587;
	Wed,  4 Jan 2023 04:33:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/3] meta-atp: remove
Date: Wed,  4 Jan 2023 12:33:42 +0000
Message-Id: <20230104123343.3372506-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104123343.3372506-1-ross.burton@arm.com>
References: <20230104123343.3372506-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 04 Jan 2023 12:33:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4234

The meta-atp layer is unmaintained and gem5 is incompatible with Python
3.11, so won't work with master without work that is still ongoing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                |  5 +--
 README.md                                     |  4 --
 ci/gem5-atp-arm64.yml                         | 15 --------
 meta-atp/README.md                            |  1 -
 meta-atp/conf/layer.conf                      |  9 -----
 meta-atp/conf/machine/gem5-atp-arm64.conf     | 15 --------
 meta-atp/documentation/atp-standalone.md      | 13 -------
 meta-atp/documentation/gem5-atp-arm64.md      | 37 -------------------
 meta-atp/documentation/summary.md             | 11 ------
 .../atp/atp-gem5-native_3.1.bb                | 24 ------------
 .../atp/atp-gem5/start-gem5-atp.sh            | 13 -------
 .../recipes-devtools/atp/atp-native_3.1.bb    | 18 ---------
 .../recipes-devtools/atp/atp-source_3.1.inc   |  9 -----
 .../atp/files/no-werror.patch                 | 18 ---------
 .../gem5/gem5-aarch64-dtb.bbappend            |  5 ---
 meta-atp/recipes-kernel/atp/atp-module_3.1.bb | 25 -------------
 meta-atp/recipes-kernel/atp/atp-test_3.1.bb   | 21 -----------
 meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb   | 24 ------------
 .../recipes-kernel/linux/files/no_ftrace.cfg  |  1 -
 .../recipes-kernel/linux/files/smmuv3.cfg     |  4 --
 .../linux/linux-yocto_%.bbappend              |  2 -
 scripts/machine-summary.py                    |  2 +-
 22 files changed, 2 insertions(+), 274 deletions(-)
 delete mode 100644 ci/gem5-atp-arm64.yml
 delete mode 100644 meta-atp/README.md
 delete mode 100644 meta-atp/conf/layer.conf
 delete mode 100644 meta-atp/conf/machine/gem5-atp-arm64.conf
 delete mode 100644 meta-atp/documentation/atp-standalone.md
 delete mode 100644 meta-atp/documentation/gem5-atp-arm64.md
 delete mode 100644 meta-atp/documentation/summary.md
 delete mode 100644 meta-atp/recipes-devtools/atp/atp-gem5-native_3.1.bb
 delete mode 100755 meta-atp/recipes-devtools/atp/atp-gem5/start-gem5-atp=
.sh
 delete mode 100644 meta-atp/recipes-devtools/atp/atp-native_3.1.bb
 delete mode 100644 meta-atp/recipes-devtools/atp/atp-source_3.1.inc
 delete mode 100644 meta-atp/recipes-devtools/atp/files/no-werror.patch
 delete mode 100644 meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbapp=
end
 delete mode 100644 meta-atp/recipes-kernel/atp/atp-module_3.1.bb
 delete mode 100644 meta-atp/recipes-kernel/atp/atp-test_3.1.bb
 delete mode 100644 meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
 delete mode 100644 meta-atp/recipes-kernel/linux/files/no_ftrace.cfg
 delete mode 100644 meta-atp/recipes-kernel/linux/files/smmuv3.cfg
 delete mode 100644 meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d2856699..e8ab443d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -126,9 +126,6 @@ gem5-arm64:
     matrix:
       - VIRT: [none, xen]
=20
-gem5-atp-arm64:
-  extends: .build
-
 generic-arm64:
   extends: .build
=20
@@ -224,7 +221,7 @@ check-layers:
       "yocto-check-layer-wrapper $CI_PROJECT_DIR/$LAYER --dependency $CI=
_PROJECT_DIR/meta-* $KAS_WORK_DIR/meta-openembedded/meta-oe --no-auto-dep=
endency"
   parallel:
     matrix:
-      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5, m=
eta-atp]
+      - LAYER: [meta-arm, meta-arm-bsp, meta-arm-toolchain, meta-gem5]
=20
 pending-updates:
   extends: .setup
diff --git a/README.md b/README.md
index e82f5532..eb8a8aa3 100644
--- a/README.md
+++ b/README.md
@@ -18,10 +18,6 @@ This repository contains the Arm layers for OpenEmbedd=
ed.
=20
   This layer contains recipes for Arm's binary toolchains (GCC and Clang=
 for -A and -M), and a recipe to build Arm's GCC.
=20
-* meta-atp
-
-  This layer contains recipes for the [AMBA Adaptive Traffic Profiles (A=
TP)](https://developer.arm.com/documentation/ihi0082/latest) generation i=
ntegration into meta-gem5.
-
 * meta-gem5
=20
   This layer contains recipes and machines for gem5, a system-level and =
processor simulator.
diff --git a/ci/gem5-atp-arm64.yml b/ci/gem5-atp-arm64.yml
deleted file mode 100644
index 626947b5..00000000
--- a/ci/gem5-atp-arm64.yml
+++ /dev/null
@@ -1,15 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/gem5-arm64.yml
-
-repos:
-  meta-arm:
-    layers:
-      meta-atp:
-
-machine: gem5-atp-arm64
-
-target:
-  - atp-native
-  - core-image-minimal
diff --git a/meta-atp/README.md b/meta-atp/README.md
deleted file mode 100644
index 490ddca9..00000000
--- a/meta-atp/README.md
+++ /dev/null
@@ -1 +0,0 @@
-See ../README.md
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
deleted file mode 100644
index 8e48b26f..00000000
--- a/meta-atp/conf/layer.conf
+++ /dev/null
@@ -1,9 +0,0 @@
-BBPATH .=3D ":${LAYERDIR}"
-BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
-            ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS +=3D "meta-atp"
-BBFILE_PATTERN_meta-atp =3D "^${LAYERDIR}/"
-
-LAYERDEPENDS_meta-atp =3D "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp =3D "langdale mickledore"
diff --git a/meta-atp/conf/machine/gem5-atp-arm64.conf b/meta-atp/conf/ma=
chine/gem5-atp-arm64.conf
deleted file mode 100644
index 6e6d49a9..00000000
--- a/meta-atp/conf/machine/gem5-atp-arm64.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-require conf/machine/gem5-arm64.conf
-MACHINEOVERRIDES =3D. "gem5-arm64:"
-
-# Use baremetal_atp.py as machine configuration
-GEM5_RUN_PROFILE =3D "configs/baremetal_atp.py"
-# Require m5term
-EXTRA_IMAGEDEPENDS +=3D "gem5-m5term-native"
-# Require ATP kernel modules, user API and gem5 m5readfile
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-module-atp atp-uapi gem5-m=
5readfile"
-# Optionally provide ATP kernel tests
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "atp-test"
-
-# Use ATP Engine gem5 models in gem5 build
-DEPENDS:append:pn-gem5-aarch64-native =3D " atp-gem5-native"
-GEM5_EXTRAS:pn-gem5-aarch64-native =3D "${STAGING_DATADIR_NATIVE}/atp"
diff --git a/meta-atp/documentation/atp-standalone.md b/meta-atp/document=
ation/atp-standalone.md
deleted file mode 100644
index 1ab4528a..00000000
--- a/meta-atp/documentation/atp-standalone.md
+++ /dev/null
@@ -1,13 +0,0 @@
-# Standalone ATP Engine executable
-
-Users can build the AMBA ATP Engine as a standalone native executable as=
 follows:
-
-```bash
-bitbake atp-native
-```
-
-Users can run the executable through standard build scripts:
-
-```bash
-oe-run-native atp-native atpeng [--help | args...]
-```
diff --git a/meta-atp/documentation/gem5-atp-arm64.md b/meta-atp/document=
ation/gem5-atp-arm64.md
deleted file mode 100644
index 018f374c..00000000
--- a/meta-atp/documentation/gem5-atp-arm64.md
+++ /dev/null
@@ -1,37 +0,0 @@
-## ATP Engine integration in gem5, and the gem5-atp-arm64 machine
-
-Users should select the `gem5-atp-arm64` machine in their `conf/local.co=
nf` file.
-
-Users can build the target image of preference, for example:
-
-```bash
-bitbake core-image-minimal
-```
-
-The resulting gem5 native executable contains the AMBA ATP Engine. The r=
esulting target image contains the kernel modules, UAPI and test suite.
-
-Users should run the environment as follows:
-
-```bash
-oe-run-native atp-gem5-native start-gem5-atp.sh
-```
-
-This script launches a fast simulation to fast-forward Linux boot. Once =
Linux boot is completed, the fast simulation switches into a detailed sim=
ulation for the final usable environment. Users can connect and interact =
with the environment as follows:
-
-```bash
-oe-run-native gem5-m5term-native m5term <PORT>
-```
-
-The connection PORT is announced by the deploy script as:
-
-```bash
-system.terminal: Listening for connections on port <PORT>
-```
-
-This is usually port 3456.
-
-Users can verify access to the ATP device by running the integration tes=
t suite from within the simulated environment as follows:
-
-```bash
-test_atp.out
-```
diff --git a/meta-atp/documentation/summary.md b/meta-atp/documentation/s=
ummary.md
deleted file mode 100644
index 7ac6c3f5..00000000
--- a/meta-atp/documentation/summary.md
+++ /dev/null
@@ -1,11 +0,0 @@
-# meta-atp summary
-
-The meta-atp layer supports building the following software components:
-
-- Arm's implementation of the AMBA ATP specification, namely the [AMBA A=
TP Engine](https://github.com/ARM-software/ATP-Engine).
-- Linux kernel modules and user API (UAPI) for programming ATP devices.
-- Integration test suite for verification of kernel modules and UAPI.
-
-It is also possible to build the AMBA ATP Engine as part of the final [g=
em5](https://www.gem5.org/) executable. For this, meta-atp extends the `g=
em5-aarch64-native` recipe to add the AMBA ATP engine code as extra sourc=
es.
-
-Users should add the meta-atp layer and layer dependencies to `conf/bbla=
yers.conf`. See `conf/layer.conf` for dependencies.
diff --git a/meta-atp/recipes-devtools/atp/atp-gem5-native_3.1.bb b/meta-=
atp/recipes-devtools/atp/atp-gem5-native_3.1.bb
deleted file mode 100644
index 634c9b11..00000000
--- a/meta-atp/recipes-devtools/atp/atp-gem5-native_3.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require atp-source_3.1.inc
-inherit native
-
-SUMMARY =3D "AMBA ATP Engine gem5 models"
-
-S =3D "${WORKDIR}/git"
-SRC_URI =3D "${ATP_SRC} file://start-gem5-atp.sh"
-
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
-
-do_install() {
-    install -d ${D}${datadir}/gem5/configs ${D}${datadir}/atp ${D}${bind=
ir}
-
-    # baremetal_atp.py machine configuration and sample stream.atp file
-    install ${S}/gem5/baremetal_atp.py ${S}/configs/stream.atp ${D}${dat=
adir}/gem5/configs
-    #=C2=A0ATP Engine sources for gem5 to use
-    install ${S}/SConscript ${S}/*.hh ${S}/*.cc ${D}${datadir}/atp
-    cp -RL ${S}/gem5 ${S}/proto ${D}${datadir}/atp
-
-    install ${WORKDIR}/start-gem5-atp.sh ${D}${bindir}
-}
-
-addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/meta-atp/recipes-devtools/atp/atp-gem5/start-gem5-atp.sh b/m=
eta-atp/recipes-devtools/atp/atp-gem5/start-gem5-atp.sh
deleted file mode 100755
index 16dac477..00000000
--- a/meta-atp/recipes-devtools/atp/atp-gem5/start-gem5-atp.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/usr/bin/env bash
-
-source <(bitbake -e gem5-aarch64-native | grep \
-    -e "^STAGING_DATADIR_NATIVE=3D" -e "^DEPLOY_DIR_TOOLS=3D")
-
-# Used by baremetal_atp.py
-export GEM5_DATADIR=3D${STAGING_DATADIR_NATIVE}/gem5
-export ATP_DATADIR=3D${STAGING_DATADIR_NATIVE}/gem5
-
-# Fast-forward Linux boot and restore into timing simulation
-${DEPLOY_DIR_TOOLS}/start-gem5.sh --checkpoint $@
-${DEPLOY_DIR_TOOLS}/start-gem5.sh --restore-with-cpu TimingSimpleCPU \
-                                  --checkpoint-restore 1 $@
diff --git a/meta-atp/recipes-devtools/atp/atp-native_3.1.bb b/meta-atp/r=
ecipes-devtools/atp/atp-native_3.1.bb
deleted file mode 100644
index 31b58bf9..00000000
--- a/meta-atp/recipes-devtools/atp/atp-native_3.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require atp-source_3.1.inc
-inherit pkgconfig native
-
-SUMMARY =3D "AMBA ATP Engine: synthetic traffic interface modelling fram=
ework"
-
-S =3D "${WORKDIR}/git"
-SRC_URI =3D "${ATP_SRC} \
-           file://no-werror.patch"
-
-EXTRA_OEMAKE +=3D "EXTRA_CXX_FLAGS=3D'${CXXFLAGS}' EXTRA_LD_FLAGS=3D'${L=
DFLAGS}'"
-
-do_install() {
-    oe_runmake install
-}
-
-DEPENDS =3D "protobuf-native cppunit-native"
-
-addtask addto_recipe_sysroot before do_build
diff --git a/meta-atp/recipes-devtools/atp/atp-source_3.1.inc b/meta-atp/=
recipes-devtools/atp/atp-source_3.1.inc
deleted file mode 100644
index de24ef83..00000000
--- a/meta-atp/recipes-devtools/atp/atp-source_3.1.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-ATP_SRC =3D "git://github.com/ARM-software/ATP-Engine.git;protocol=3Dhtt=
ps;branch=3Dmaster"
-ATP_REV =3D "be1066029d6256626b37be004e2a663fbc29f37e"
-ATP_LIC =3D "BSD-3-Clause-Clear"
-ATP_LIC_MD5 =3D "e836b5992257064f488715d9a59752c3"
-
-HOMEPAGE ?=3D "https://github.com/ARM-software/ATP-Engine"
-SRCREV ?=3D "${ATP_REV}"
-LICENSE ?=3D "${ATP_LIC}"
-LIC_FILES_CHKSUM ?=3D "file://LICENSE;md5=3D${ATP_LIC_MD5}"
diff --git a/meta-atp/recipes-devtools/atp/files/no-werror.patch b/meta-a=
tp/recipes-devtools/atp/files/no-werror.patch
deleted file mode 100644
index 4be143af..00000000
--- a/meta-atp/recipes-devtools/atp/files/no-werror.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Don't pass -Werror, as new compilers introduce new warnings.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/Makefile b/Makefile
-index c01b120..1d3c30a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -18,7 +18,7 @@ PROTOBUF_C_FLAGS:=3D $(shell pkg-config --cflags proto=
buf)
- CPPUNIT_C_FLAGS :=3D $(shell pkg-config --cflags cppunit)
- PROTOBUF_L_FLAGS:=3D $(shell pkg-config --libs protobuf)
- CPPUNIT_L_FLAGS	:=3D $(shell pkg-config --libs cppunit)
--CXX_FLAGS       :=3D $(PROTOBUF_C_FLAGS) -std=3Dc++11 -Wall -Werror -We=
xtra -Wno-unused-parameter -Wno-unused-variable $(CPPUNIT_C_FLAGS) -fPIC =
$(EXTRA_CXX_FLAGS)
-+CXX_FLAGS       :=3D $(PROTOBUF_C_FLAGS) -std=3Dc++11 -Wall -Wextra -Wn=
o-unused-parameter -Wno-unused-variable $(CPPUNIT_C_FLAGS) -fPIC $(EXTRA_=
CXX_FLAGS)
- LD_FLAGS        :=3D $(PROTOBUF_L_FLAGS) $(CPPUNIT_L_FLAGS) $(EXTRA_LD_=
FLAGS)
- PROTO_SRC_DIR   :=3D ./proto/
- PROTO_SRC       :=3D $(wildcard $(PROTO_SRC_DIR)tp*.proto)
diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend b/m=
eta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend
deleted file mode 100644
index c96f2cdc..00000000
--- a/meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-do_compile:prepend:gem5-atp-arm64() {
-    # Export datadir paths for baremetal_atp.py script
-    export GEM5_DATADIR=3D"${STAGING_DATADIR_NATIVE}/gem5"
-    export ATP_DATADIR=3D"${STAGING_DATADIR_NATIVE}/gem5"
-}
diff --git a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb b/meta-atp/rec=
ipes-kernel/atp/atp-module_3.1.bb
deleted file mode 100644
index 9b54e1c8..00000000
--- a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-COMPATIBLE_MACHINE =3D "gem5-atp-arm64"
-require recipes-devtools/atp/atp-source_3.1.inc
-inherit module
-
-SUMMARY =3D "Kernel modules for interacting wih ATP Engine and devices"
-SECTION =3D "kernel/modules"
-
-S =3D "${WORKDIR}/git"
-SRC_URI =3D "${ATP_SRC}"
-
-ATP_MOD_DIR =3D "linux"
-
-EXTRA_OEMAKE +=3D "-C ${ATP_MOD_DIR}"
-
-PROVIDES =3D "kernel-module-atp"
-RPROVIDES:${PN} =3D "kernel-module-atp"
-KERNEL_MODULE_AUTOLOAD +=3D "atp_buffer_manager atp_device"
-MODULES_MODULE_SYMVERS_LOCATION =3D "${ATP_MOD_DIR}"
-
-do_install:append() {
-    install -d ${D}${includedir}/linux
-    install -m 644 ${ATP_MOD_DIR}/atp_buffer_manager_user.h \
-                   ${ATP_MOD_DIR}/atp_device_user.h \
-                   ${D}${includedir}/linux
-}
diff --git a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb b/meta-atp/recip=
es-kernel/atp/atp-test_3.1.bb
deleted file mode 100644
index 3c88e08d..00000000
--- a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-COMPATIBLE_MACHINE =3D "gem5-atp-arm64"
-require recipes-devtools/atp/atp-source_3.1.inc
-
-SUMMARY =3D "End-to-end tests evaluating ATP kernel modules service corr=
ectness"
-SECTION =3D "kernel/userland"
-
-S =3D "${WORKDIR}/git"
-SRC_URI =3D "${ATP_SRC}"
-
-EXTRA_OEMAKE +=3D "-C linux/test"
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} install
-}
-
-DEPENDS =3D "atp-uapi cppunit"
-RDEPENDS:${PN} =3D "atp-uapi"
diff --git a/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb b/meta-atp/recip=
es-kernel/atp/atp-uapi_3.1.bb
deleted file mode 100644
index a8b14796..00000000
--- a/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-COMPATIBLE_MACHINE =3D "gem5-atp-arm64"
-require recipes-devtools/atp/atp-source_3.1.inc
-
-SUMMARY =3D "User API for accessing services from ATP kernel modules"
-SECTION =3D "kernel/userland"
-
-S =3D "${WORKDIR}/git"
-SRC_URI =3D "${ATP_SRC}"
-
-# Unversioned library
-SOLIBS =3D ".so"
-FILES_SOLIBSDEV =3D ""
-
-EXTRA_OEMAKE +=3D "-C linux/uapi"
-
-do_compile() {
-    oe_runmake KERNEL_HDR_PATH=3D${STAGING_INCDIR}
-}
-
-do_install() {
-    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} install
-}
-
-DEPENDS =3D "linux-libc-headers kernel-module-atp"
diff --git a/meta-atp/recipes-kernel/linux/files/no_ftrace.cfg b/meta-atp=
/recipes-kernel/linux/files/no_ftrace.cfg
deleted file mode 100644
index 870eeaf6..00000000
--- a/meta-atp/recipes-kernel/linux/files/no_ftrace.cfg
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_FTRACE is not set
diff --git a/meta-atp/recipes-kernel/linux/files/smmuv3.cfg b/meta-atp/re=
cipes-kernel/linux/files/smmuv3.cfg
deleted file mode 100644
index 2d0a87d9..00000000
--- a/meta-atp/recipes-kernel/linux/files/smmuv3.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_IOMMU_IO_PGTABLE=3Dy
-CONFIG_IOMMU_IO_PGTABLE_LPAE=3Dy
-# CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST is not set
-CONFIG_ARM_SMMU_V3=3Dy
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend b/meta-=
atp/recipes-kernel/linux/linux-yocto_%.bbappend
deleted file mode 100644
index 8cb86a97..00000000
--- a/meta-atp/recipes-kernel/linux/linux-yocto_%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-FILESEXTRAPATHS:prepend:gem5-atp-arm64 :=3D "${THISDIR}/files:"
-SRC_URI:append:gem5-atp-arm64 =3D " file://no_ftrace.cfg file://smmuv3.c=
fg"
diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index c2b43dae..e2cb4894 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -56,7 +56,7 @@ def get_url_for_patch(layer: str, localpath: pathlib.Pa=
th, d) -> str:
     # TODO: assumes default branch
     if layer =3D=3D "core":
         return f"https://git.openembedded.org/openembedded-core/tree/met=
a/{relative}"
-    elif layer in ("meta-arm", "meta-arm-bsp", "arm-toolchain", "meta-at=
p", "meta-gem5"):
+    elif layer in ("meta-arm", "meta-arm-bsp", "arm-toolchain", "meta-ge=
m5"):
         return f"https://git.yoctoproject.org/meta-arm/tree/{layer}/{rel=
ative}"
     else:
         print(f"WARNING: Don't know web URL for layer {layer}", file=3Ds=
ys.stderr)
--=20
2.34.1


