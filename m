Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11700.1619095922318153678
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 05:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C56D213A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Apr 2021 05:52:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53D4A3F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 22 Apr 2021 05:52:00 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] atp: initial layer
Date: Thu, 22 Apr 2021 13:51:54 +0100
Message-Id: <20210422125155.144249-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

meta-atp layer provides support for building AMBA Adaptive Traffic
Profiles (ATP) Engine. It provides the following recipes:

- ATP Engine native standalone build.
- ATP Engine with gem5 as host platform.
- ATP Linux kernel modules.
- ATP Linux user API.
- ATP Linux tests.

The layer provides a "gem5-atp-arm64" machine with ATP device and
adapter support.

Change-Id: Ib86c7502d62d5707d0d4bbdd7d179f231cf96f57
Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
---
 meta-atp/README.md                            | 76 +++++++++++++++++++
 meta-atp/conf/layer.conf                      |  9 +++
 meta-atp/conf/machine/gem5-atp-arm64.conf     | 11 +++
 .../recipes-devtools/atp/atp-native_3.1.bb    | 17 +++++
 .../recipes-devtools/atp/atp-source_3.1.inc   |  9 +++
 .../gem5/gem5-aarch64-dtb.bbappend            |  3 +
 .../gem5-aarch64-native/start-gem5-atp.sh     | 13 ++++
 .../gem5/gem5-aarch64-native_20.bbappend      | 24 ++++++
 .../gem5/gem5-m5ops/m5-readfile.sh            |  9 +++
 .../gem5/gem5-m5ops_20.bbappend               | 14 ++++
 meta-atp/recipes-kernel/atp/atp-module_3.1.bb | 24 ++++++
 meta-atp/recipes-kernel/atp/atp-test_3.1.bb   | 21 +++++
 meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb   | 24 ++++++
 .../linux/linux-yocto-5.4/no_ftrace.cfg       |  1 +
 .../linux/linux-yocto-5.4/smmuv3.cfg          |  4 +
 .../linux/linux-yocto_5.4.bbappend            |  2 +
 16 files changed, 261 insertions(+)
 create mode 100644 meta-atp/README.md
 create mode 100644 meta-atp/conf/layer.conf
 create mode 100644 meta-atp/conf/machine/gem5-atp-arm64.conf
 create mode 100644 meta-atp/recipes-devtools/atp/atp-native_3.1.bb
 create mode 100644 meta-atp/recipes-devtools/atp/atp-source_3.1.inc
 create mode 100644 meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbapp=
end
 create mode 100755 meta-atp/recipes-devtools/gem5/gem5-aarch64-native/st=
art-gem5-atp.sh
 create mode 100644 meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20=
.bbappend
 create mode 100755 meta-atp/recipes-devtools/gem5/gem5-m5ops/m5-readfile=
.sh
 create mode 100644 meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
 create mode 100644 meta-atp/recipes-kernel/atp/atp-module_3.1.bb
 create mode 100644 meta-atp/recipes-kernel/atp/atp-test_3.1.bb
 create mode 100644 meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
 create mode 100644 meta-atp/recipes-kernel/linux/linux-yocto-5.4/no_ftra=
ce.cfg
 create mode 100644 meta-atp/recipes-kernel/linux/linux-yocto-5.4/smmuv3.=
cfg
 create mode 100644 meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappen=
d

diff --git a/meta-atp/README.md b/meta-atp/README.md
new file mode 100644
index 0000000..15d0e29
--- /dev/null
+++ b/meta-atp/README.md
@@ -0,0 +1,76 @@
+# meta-atp layer
+
+The meta-atp layer supports building environments with traffic generatio=
n capabilities based on [AMBA Adaptive Traffic Profiles (ATP)](https://de=
veloper.arm.com/documentation/ihi0082/latest).
+
+## Recipes
+
+The meta-atp layer supports building the following software components:
+
+- Arm's implementation of the AMBA ATP specification, namely the [AMBA A=
TP Engine](https://github.com/ARM-software/ATP-Engine).
+- Linux kernel modules and user API (UAPI) for programming ATP devices.
+- Integration test suite for verification of kernel modules and UAPI.
+
+It is also possible to build the AMBA ATP Engine as part of the final [g=
em5](https://www.gem5.org/) executable. For this, meta-atp extends the `g=
em5-aarch64-native` recipe to add the AMBA ATP engine code as extra sourc=
es.
+
+## Machines
+
+The `gem5-atp-arm64` machine extends the `gem5-arm64` machine to instant=
iate a simulated platform with support for programmable AMBA ATP traffic =
generation. The platform includes the following models:
+
+- `ProfileGen` model. This is the adapter layer between gem5 and the AMB=
A ATP Engine. It is the source of traffic into the gem5 host platform.
+- `ATPDevice` model. Software can program it using the Linux kernel modu=
les and UAPI to control traffic generation.
+
+## Usage
+
+Users should add the meta-atp layer and layer dependencies to `conf/bbla=
yers.conf`. See `conf/layer.conf` for dependencies.
+
+### Standalone Engine executable
+
+Users can build the AMBA ATP Engine as a standalone native executable as=
 follows:
+
+```bash
+bitbake atp-native
+```
+
+Users can run the executable through standard build scripts:
+
+```bash
+oe-run-native atp-native atpeng [--help | args...]
+```
+
+## Integration of the Engine in gem5
+
+Users should select the `gem5-atp-arm64` platform in their `conf/local.c=
onf` file.
+
+Users can build the target image of preference, for example:
+
+```bash
+bitbake core-image-minimal
+```
+
+The resulting gem5 native executable contains the AMBA ATP Engine. The r=
esulting target image contains the kernel modules, UAPI and test suite.
+
+Users should run the environment as follows:
+
+```bash
+./tmp/deploy/tools/start-gem5-atp.sh
+```
+
+This script launches a fast simulation to fast-forward Linux boot. Once =
Linux boot is completed, the fast simulation switches into a detailed sim=
ulation for the final usable environment. Users can connect and interact =
with the environment as follows:
+
+```bash
+oe-run-native gem5-m5term-native m5term <PORT>
+```
+
+The connection PORT is announced by the deploy script as:
+
+```bash
+system.terminal: Listening for connections on port <PORT>
+```
+
+This is usually port 3456.
+
+Users can verify access to the ATP device by running the integration tes=
t suite from within the simulated environment as follows:
+
+```bash
+test_atp.out
+```
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
new file mode 100644
index 0000000..3c03a62
--- /dev/null
+++ b/meta-atp/conf/layer.conf
@@ -0,0 +1,9 @@
+BBPATH .=3D ":${LAYERDIR}"
+BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS +=3D "meta-atp"
+BBFILE_PATTERN_meta-atp =3D "^${LAYERDIR}/"
+
+LAYERDEPENDS_meta-atp =3D "core openembedded-layer meta-gem5"
+LAYERSERIES_COMPAT_meta-atp =3D "gatesgarth hardknott"
diff --git a/meta-atp/conf/machine/gem5-atp-arm64.conf b/meta-atp/conf/ma=
chine/gem5-atp-arm64.conf
new file mode 100644
index 0000000..d5fe22a
--- /dev/null
+++ b/meta-atp/conf/machine/gem5-atp-arm64.conf
@@ -0,0 +1,11 @@
+require conf/machine/gem5-arm64.conf
+MACHINEOVERRIDES =3D. "gem5-arm64:"
+
+# Use baremetal_atp.py as machine configuration
+GEM5_RUN_PROFILE =3D "configs/baremetal_atp.py"
+# Require m5term
+EXTRA_IMAGEDEPENDS +=3D "gem5-m5term-native"
+# Require ATP kernel modules, user API and gem5 m5ops
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-module-atp atp-uapi gem5-m=
5ops"
+# Optionally provide ATP kernel tests
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "atp-test"
diff --git a/meta-atp/recipes-devtools/atp/atp-native_3.1.bb b/meta-atp/r=
ecipes-devtools/atp/atp-native_3.1.bb
new file mode 100644
index 0000000..bb51988
--- /dev/null
+++ b/meta-atp/recipes-devtools/atp/atp-native_3.1.bb
@@ -0,0 +1,17 @@
+require atp-source_3.1.inc
+inherit pkgconfig native
+
+SUMMARY =3D "AMBA ATP Engine: synthetic traffic interface modelling fram=
ework"
+
+S =3D "${WORKDIR}/git"
+SRC_URI =3D "${ATP_SRC}"
+
+EXTRA_OEMAKE +=3D "EXTRA_CXX_FLAGS=3D'${CXXFLAGS}' EXTRA_LD_FLAGS=3D'${L=
DFLAGS}'"
+
+do_install() {
+    oe_runmake install
+}
+
+DEPENDS =3D "protobuf-native cppunit-native"
+
+addtask addto_recipe_sysroot before do_build
diff --git a/meta-atp/recipes-devtools/atp/atp-source_3.1.inc b/meta-atp/=
recipes-devtools/atp/atp-source_3.1.inc
new file mode 100644
index 0000000..e5442c9
--- /dev/null
+++ b/meta-atp/recipes-devtools/atp/atp-source_3.1.inc
@@ -0,0 +1,9 @@
+ATP_SRC =3D "git://github.com/ARM-software/ATP-Engine.git;protocol=3Dhtt=
ps"
+ATP_REV =3D "be1066029d6256626b37be004e2a663fbc29f37e"
+ATP_LIC =3D "BSD-3-Clause-Clear"
+ATP_LIC_MD5 =3D "e836b5992257064f488715d9a59752c3"
+
+HOMEPAGE ?=3D "https://github.com/ARM-software/ATP-Engine"
+SRCREV ?=3D "${ATP_REV}"
+LICENSE ?=3D "${ATP_LIC}"
+LIC_FILES_CHKSUM ?=3D "file://LICENSE;md5=3D${ATP_LIC_MD5}"
diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend b/m=
eta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend
new file mode 100644
index 0000000..2b55b89
--- /dev/null
+++ b/meta-atp/recipes-devtools/gem5/gem5-aarch64-dtb.bbappend
@@ -0,0 +1,3 @@
+# Export datadir paths for baremetal_atp.py script
+export GEM5_DATADIR =3D "${STAGING_DATADIR_NATIVE}/gem5"
+export ATP_DATADIR =3D "${STAGING_DATADIR_NATIVE}/gem5"
diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native/start-gem=
5-atp.sh b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native/start-gem5-=
atp.sh
new file mode 100755
index 0000000..16dac47
--- /dev/null
+++ b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native/start-gem5-atp.s=
h
@@ -0,0 +1,13 @@
+#!/usr/bin/env bash
+
+source <(bitbake -e gem5-aarch64-native | grep \
+    -e "^STAGING_DATADIR_NATIVE=3D" -e "^DEPLOY_DIR_TOOLS=3D")
+
+# Used by baremetal_atp.py
+export GEM5_DATADIR=3D${STAGING_DATADIR_NATIVE}/gem5
+export ATP_DATADIR=3D${STAGING_DATADIR_NATIVE}/gem5
+
+# Fast-forward Linux boot and restore into timing simulation
+${DEPLOY_DIR_TOOLS}/start-gem5.sh --checkpoint $@
+${DEPLOY_DIR_TOOLS}/start-gem5.sh --restore-with-cpu TimingSimpleCPU \
+                                  --checkpoint-restore 1 $@
diff --git a/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappe=
nd b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
new file mode 100644
index 0000000..5194ce1
--- /dev/null
+++ b/meta-atp/recipes-devtools/gem5/gem5-aarch64-native_20.bbappend
@@ -0,0 +1,24 @@
+require recipes-devtools/atp/atp-source_3.1.inc
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}:"
+
+SRC_URI +=3D "${ATP_SRC};destsuffix=3Dgit/atp;name=3Datp \
+            file://start-gem5-atp.sh"
+SRCREV_FORMAT =3D "gem5_atp"
+SRCREV_atp =3D "${ATP_REV}"
+LICENSE +=3D "& ${ATP_LIC}"
+LIC_FILES_CHKSUM +=3D "file://atp/LICENSE;md5=3D${ATP_LIC_MD5}"
+
+EXTRA_OESCONS +=3D "EXTRAS=3D${S}/atp"
+
+do_install_append() {
+    # baremetal_atp.py machine configuration and sample stream.atp file
+    install -m 644 ${B}/atp/gem5/baremetal_atp.py \
+                   ${B}/atp/configs/stream.atp \
+                   ${D}${datadir}/gem5/configs
+}
+
+do_deploy_append() {
+    # start-gem5-atp.sh launch script
+    install -m 755 ${WORKDIR}/start-gem5-atp.sh ${DEPLOYDIR}
+}
diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5ops/m5-readfile.sh b/m=
eta-atp/recipes-devtools/gem5/gem5-m5ops/m5-readfile.sh
new file mode 100755
index 0000000..44477e9
--- /dev/null
+++ b/meta-atp/recipes-devtools/gem5/gem5-m5ops/m5-readfile.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:         m5-readfile
+# Required-Start:   $all
+# Default-Start:    5
+#=C2=A0Description:      Enables reading any script at simulation launch=
 time.
+### END INIT INFO
+
+m5 readfile | sh
diff --git a/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend b/meta=
-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
new file mode 100644
index 0000000..34024bf
--- /dev/null
+++ b/meta-atp/recipes-devtools/gem5/gem5-m5ops_20.bbappend
@@ -0,0 +1,14 @@
+inherit update-rc.d
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}:"
+
+# Add startup script calling m5 readfile for automatic checkpoint and re=
store
+SRC_URI +=3D "file://m5-readfile.sh"
+
+INITSCRIPT_NAME =3D "m5-readfile.sh"
+INITSCRIPT_PARAMS =3D "defaults 99"
+
+do_install_append() {
+    install -d ${D}/${INIT_D_DIR}
+    install -m 755 ${WORKDIR}/m5-readfile.sh ${D}/${INIT_D_DIR}
+}
diff --git a/meta-atp/recipes-kernel/atp/atp-module_3.1.bb b/meta-atp/rec=
ipes-kernel/atp/atp-module_3.1.bb
new file mode 100644
index 0000000..9820a9d
--- /dev/null
+++ b/meta-atp/recipes-kernel/atp/atp-module_3.1.bb
@@ -0,0 +1,24 @@
+require recipes-devtools/atp/atp-source_3.1.inc
+inherit module
+
+SUMMARY =3D "Kernel modules for interacting wih ATP Engine and devices"
+SECTION =3D "kernel/modules"
+
+S =3D "${WORKDIR}/git"
+SRC_URI =3D "${ATP_SRC}"
+
+ATP_MOD_DIR =3D "linux"
+
+EXTRA_OEMAKE +=3D "-C ${ATP_MOD_DIR}"
+
+PROVIDES =3D "kernel-module-atp"
+RPROVIDES_${PN} =3D "kernel-module-atp"
+KERNEL_MODULE_AUTOLOAD +=3D "atp_buffer_manager atp_device"
+MODULES_MODULE_SYMVERS_LOCATION =3D "${ATP_MOD_DIR}"
+
+do_install_append() {
+    install -d ${D}${includedir}/linux
+    install -m 644 ${ATP_MOD_DIR}/atp_buffer_manager_user.h \
+                   ${ATP_MOD_DIR}/atp_device_user.h \
+                   ${D}${includedir}/linux
+}
diff --git a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb b/meta-atp/recip=
es-kernel/atp/atp-test_3.1.bb
new file mode 100644
index 0000000..c3f3caa
--- /dev/null
+++ b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
@@ -0,0 +1,21 @@
+require recipes-devtools/atp/atp-source_3.1.inc
+inherit package
+
+SUMMARY =3D "End-to-end tests evaluating ATP kernel modules service corr=
ectness"
+SECTION =3D "kernel/userland"
+
+S =3D "${WORKDIR}/git"
+SRC_URI =3D "${ATP_SRC}"
+
+EXTRA_OEMAKE +=3D "-C linux/test"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} install
+}
+
+DEPENDS =3D "atp-uapi cppunit"
+RDEPENDS_${PN} =3D "atp-uapi"
diff --git a/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb b/meta-atp/recip=
es-kernel/atp/atp-uapi_3.1.bb
new file mode 100644
index 0000000..8c793a3
--- /dev/null
+++ b/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
@@ -0,0 +1,24 @@
+require recipes-devtools/atp/atp-source_3.1.inc
+inherit package
+
+SUMMARY =3D "User API for accessing services from ATP kernel modules"
+SECTION =3D "kernel/userland"
+
+S =3D "${WORKDIR}/git"
+SRC_URI =3D "${ATP_SRC}"
+
+# Unversioned library
+SOLIBS =3D ".so"
+FILES_SOLIBSDEV =3D ""
+
+EXTRA_OEMAKE +=3D "-C linux/uapi"
+
+do_compile() {
+    oe_runmake KERNEL_HDR_PATH=3D${STAGING_INCDIR}
+}
+
+do_install() {
+    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} install
+}
+
+DEPENDS =3D "linux-libc-headers kernel-module-atp"
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto-5.4/no_ftrace.cfg =
b/meta-atp/recipes-kernel/linux/linux-yocto-5.4/no_ftrace.cfg
new file mode 100644
index 0000000..870eeaf
--- /dev/null
+++ b/meta-atp/recipes-kernel/linux/linux-yocto-5.4/no_ftrace.cfg
@@ -0,0 +1 @@
+# CONFIG_FTRACE is not set
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto-5.4/smmuv3.cfg b/m=
eta-atp/recipes-kernel/linux/linux-yocto-5.4/smmuv3.cfg
new file mode 100644
index 0000000..2d0a87d
--- /dev/null
+++ b/meta-atp/recipes-kernel/linux/linux-yocto-5.4/smmuv3.cfg
@@ -0,0 +1,4 @@
+CONFIG_IOMMU_IO_PGTABLE=3Dy
+CONFIG_IOMMU_IO_PGTABLE_LPAE=3Dy
+# CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST is not set
+CONFIG_ARM_SMMU_V3=3Dy
diff --git a/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend b/met=
a-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
new file mode 100644
index 0000000..701499b
--- /dev/null
+++ b/meta-atp/recipes-kernel/linux/linux-yocto_5.4.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}-5.4:"
+SRC_URI +=3D "file://no_ftrace.cfg file://smmuv3.cfg"
--=20
2.25.1

