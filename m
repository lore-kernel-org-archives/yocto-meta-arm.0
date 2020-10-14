Subject: [PATCH 2/6] optee: upgraded recipes to 3.10
To: meta-arm@lists.yoctoproject.org
From: "Brett Warren" <brett.warren@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Linux Firefox 79
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Oct 2020 04:33:48 -0700
Message-ID: <8kyH.1602675228543077329.RykC@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="cmf0EVnR7R3592u6saZr"

--cmf0EVnR7R3592u6saZr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The optee recipes were upgraded due to issues booting with 3.8
on qemuarm64-secureboot, which were resolved by the upgrade.
The 3.8 recipes are retained for backwards compatibility.

optee-test and optee-examples were modified to pass a sysroot
to the LIBGCC_LOCATE_CFLAGS parameter, to ensure proper location
of the libgcc library.

Recipes have been renamed to reflect their current version.
As this makes the PV variables redundent, these have been removed.

Change-Id: Iacaba02d64570a790d5cc20eca8be58246e39019
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
.../optee/optee-client_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 59 +++++++++++++
...ee-client_git.bb =3D> optee-client_3.8.0.bb} |=C2=A0 2 -
.../optee/optee-examples_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 52 ++++++++++++
...xamples_git.bb =3D> optee-examples_3.8.0.bb} |=C2=A0 3 +-
.../recipes-security/optee/optee-os_3.10.0.bb | 83 +++++++++++++++++++
.../{optee-os_git.bb =3D> optee-os_3.8.0.bb}=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
.../optee/optee-test_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 55 ++++++++++++
...{optee-test_git.bb =3D> optee-test_3.8.0.bb} |=C2=A0 3 +-
8 files changed, 251 insertions(+), 8 deletions(-)
create mode 100644 meta-arm/recipes-security/optee/optee-client_3.10.0.bb
rename meta-arm/recipes-security/optee/{optee-client_git.bb =3D> optee-cli=
ent_3.8.0.bb} (98%)
create mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0.b=
b
rename meta-arm/recipes-security/optee/{optee-examples_git.bb =3D> optee-e=
xamples_3.8.0.bb} (95%)
create mode 100644 meta-arm/recipes-security/optee/optee-os_3.10.0.bb
rename meta-arm/recipes-security/optee/{optee-os_git.bb =3D> optee-os_3.8.=
0.bb} (98%)
create mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb
rename meta-arm/recipes-security/optee/{optee-test_git.bb =3D> optee-test_=
3.8.0.bb} (96%)

diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta=
-arm/recipes-security/optee/optee-client_3.10.0.bb
new file mode 100644
index 0000000..cbd3b93
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
@@ -0,0 +1,59 @@
+SUMMARY =3D "OP-TEE Client API"
+DESCRIPTION =3D "Open Portable Trusted Execution Environment - Normal Wor=
ld Client side of the TEE"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60=
a743e5b"
+
+require optee.inc
+
+inherit python3native systemd update-rc.d
+
+SRCREV =3D "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
+SRC_URI =3D " \
+=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_client.git \
+=C2=A0=C2=A0=C2=A0 file://tee-supplicant.service \
+=C2=A0=C2=A0=C2=A0 file://tee-supplicant.sh \
+"
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+EXTRA_OEMAKE =3D "O=3D${B}"
+
+do_compile() {
+=C2=A0=C2=A0=C2=A0 cd ${S}
+=C2=A0=C2=A0=C2=A0 oe_runmake
+}
+do_compile[cleandirs] =3D "${B}"
+
+do_install() {
+=C2=A0=C2=A0=C2=A0 cd ${S}
+=C2=A0=C2=A0=C2=A0 oe_runmake install
+
+=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/export/usr/sbin/tee-supplica=
nt ${D}${sbindir}/tee-supplicant
+
+=C2=A0=C2=A0=C2=A0 install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.=
0 ${D}${libdir}/libteec.so.1.0
+=C2=A0=C2=A0=C2=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
+=C2=A0=C2=A0=C2=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
+
+=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}
+=C2=A0=C2=A0=C2=A0 install -p -m0644 ${B}/export/usr/include/*.h ${D}${in=
cludedir}
+
+=C2=A0=C2=A0=C2=A0 install -D -p -m0644 ${WORKDIR}/tee-supplicant.service=
 ${D}${systemd_system_unitdir}/tee-supplicant.service
+
+=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}=
${sysconfdir}/init.d/tee-supplicant
+
+=C2=A0=C2=A0=C2=A0 sed -i -e s:@sysconfdir@:${sysconfdir}:g \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e s:@sbindi=
r@:${sbindir}:g \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${D}${systemd_system_unitdir}/tee-supplicant.service \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${D}${sysconfdir}/init.d/tee-supplicant
+}
+
+SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
+
+INITSCRIPT_PACKAGES =3D "${PN}"
+
+INITSCRIPT_NAME_${PN} =3D "tee-supplicant"
+INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
+
diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-ar=
m/recipes-security/optee/optee-client_3.8.0.bb
similarity index 98%
rename from meta-arm/recipes-security/optee/optee-client_git.bb
rename to meta-arm/recipes-security/optee/optee-client_3.8.0.bb
index 5dbbfe9..d43ebf4 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE =3D "https://www.op-tee.org/"
LICENSE =3D "BSD"
LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60a=
743e5b"

-PV =3D "3.8.0+git${SRCPV}"
-
require optee.inc

inherit python3native systemd update-rc.d
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_3.10.0.bb
new file mode 100644
index 0000000..4a7db10
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
@@ -0,0 +1,52 @@
+SUMMARY =3D "OP-TEE examples"
+DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sample App=
lications"
+HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples"
+
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc45=
3d70c30"
+
+DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
+
+inherit python3native
+
+require optee.inc
+
+SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
make-Pass-ldflags-during-link.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
+SRCREV =3D "c6eb00a9d83bf068a37e4806c97f582bb16e2973"
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
+
+EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V=3D1 \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OUTPUT_DIR=3D${B} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "
+
+do_compile() {
+=C2=A0=C2=A0=C2=A0 cd ${S}
+=C2=A0=C2=A0=C2=A0 oe_runmake
+}
+do_compile[cleandirs] =3D "${B}"
+
+do_install () {
+=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
+=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${bindir}
+=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/ca/* ${D}${bindir}
+=C2=A0=C2=A0=C2=A0 install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libd=
ir}/optee_armtz
+}
+
+FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-=
arm/recipes-security/optee/optee-examples_3.8.0.bb
similarity index 95%
rename from meta-arm/recipes-security/optee/optee-examples_git.bb
rename to meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
index 71be593..7ed3dfa 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples=
"
LICENSE =3D "GPLv2"
LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc453=
d70c30"

-PV =3D "3.8.0+git${SRCPV}"
-
DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"

inherit python3native
@@ -30,6 +28,7 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
TEEC_EXPORT=3D${TEEC_EXPORT} \
HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
V=3D1 \
OUTPUT_DIR=3D${B} \
"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm=
/recipes-security/optee/optee-os_3.10.0.bb
new file mode 100644
index 0000000..369e011
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
@@ -0,0 +1,83 @@
+SUMMARY =3D "OP-TEE Trusted OS"
+DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted si=
de of the TEE"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+LICENSE =3D "BSD"
+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee=
55ec173"
+
+inherit deploy python3native
+require optee.inc
+
+DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native pyt=
hon3-pyelftools-native"
+
+SRCREV =3D "d1c635434c55b7d75eadf471bde04926bd1e50a7"
+SRC_URI =3D " \
+=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_os.git \
+=C2=A0=C2=A0=C2=A0 file://0006-allow-setting-sysroot-for-libgcc-lookup.pa=
tch \
+"
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+OPTEEMACHINE ?=3D "${MACHINE}"
+OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"
+OPTEE_ARCH =3D "null"
+OPTEE_ARCH_armv7a =3D "arm32"
+OPTEE_ARCH_aarch64 =3D "arm64"
+OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
+
+EXTRA_OEMAKE =3D " \
+=C2=A0=C2=A0=C2=A0 PLATFORM=3D${OPTEEMACHINE} \
+=C2=A0=C2=A0=C2=A0 CFG_${OPTEE_CORE}_core=3Dy \
+=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_core=3D${HOST_PREFIX} \
+=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
+=C2=A0=C2=A0=C2=A0 NOWERROR=3D1 \
+=C2=A0=C2=A0=C2=A0 V=3D1 \
+=C2=A0=C2=A0=C2=A0 ta-targets=3Dta_${OPTEE_ARCH} \
+=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST}=
 \
+=C2=A0=C2=A0=C2=A0 O=3D${B} \
+"
+
+CFLAGS[unexport] =3D "1"
+LDFLAGS[unexport] =3D "1"
+CPPFLAGS[unexport] =3D "1"
+AS[unexport] =3D "1"
+LD[unexport] =3D "1"
+
+do_configure[noexec] =3D "1"
+
+do_compile() {
+=C2=A0=C2=A0=C2=A0 cd ${S}
+=C2=A0=C2=A0=C2=A0 oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0
+}
+do_compile[cleandirs] =3D "${B}"
+
+do_install() {
+=C2=A0=C2=A0=C2=A0 #install core in firmware
+=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/
+=C2=A0=C2=A0=C2=A0 install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libd=
ir}/firmware/
+
+=C2=A0=C2=A0=C2=A0 #install TA devkit
+=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/optee/export-user_ta/
+=C2=A0=C2=A0=C2=A0 for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -aR $f ${D}${includedir}/op=
tee/export-user_ta/
+=C2=A0=C2=A0=C2=A0 done
+}
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+do_deploy() {
+=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/optee
+=C2=A0=C2=A0=C2=A0 install -m 644 ${D}${nonarch_base_libdir}/firmware/* $=
{DEPLOYDIR}/optee/
+}
+
+addtask deploy before do_build after do_install
+
+SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"
+
+FILES_${PN} =3D "${nonarch_base_libdir}/firmware/"
+FILES_${PN}-dev =3D "${includedir}/optee/"
+
+INSANE_SKIP_${PN}-dev =3D "staticdev"
+
+INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/re=
cipes-security/optee/optee-os_3.8.0.bb
similarity index 98%
rename from meta-arm/recipes-security/optee/optee-os_git.bb
rename to meta-arm/recipes-security/optee/optee-os_3.8.0.bb
index deeb515..0001271 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
@@ -5,8 +5,6 @@ HOMEPAGE =3D "https://www.op-tee.org/"
LICENSE =3D "BSD"
LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee5=
5ec173"

-PV =3D "3.8.0+git${SRCPV}"
-
inherit deploy python3native
require optee.inc

diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_3.10.0.bb
new file mode 100644
index 0000000..96e612a
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
@@ -0,0 +1,55 @@
+SUMMARY =3D "OP-TEE sanity testsuite"
+DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test suite=
"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+LICENSE =3D "BSD & GPLv2"
+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940a=
ab1315a4fa"
+
+inherit python3native
+require optee.inc
+
+DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
+
+SRCREV =3D "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
+SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
host-xtest-Adjust-order-of-including-compiler.h.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGIN=
G_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGING_INCDIR}/optee=
/export-user_ta"
+
+EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V=3D1 \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 O=3D${B} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "
+
+do_compile() {
+=C2=A0=C2=A0=C2=A0 cd ${S}
+=C2=A0=C2=A0=C2=A0 # Top level makefile doesn't seem to handle parallel m=
ake gracefully
+=C2=A0=C2=A0=C2=A0 oe_runmake xtest
+=C2=A0=C2=A0=C2=A0 oe_runmake ta
+}
+do_compile[cleandirs] =3D "${B}"
+
+do_install () {
+=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xt=
est
+
+=C2=A0=C2=A0=C2=A0 # install path should match the value set in optee-cli=
ent/tee-supplicant
+=C2=A0=C2=A0=C2=A0 # default TEEC_LOAD_PATH is /lib
+=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
+=C2=A0=C2=A0=C2=A0 install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base=
_libdir}/optee_armtz/
+}
+
+FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
+
+# Imports machine specific configs from staging to build
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/=
recipes-security/optee/optee-test_3.8.0.bb
similarity index 96%
rename from meta-arm/recipes-security/optee/optee-test_git.bb
rename to meta-arm/recipes-security/optee/optee-test_3.8.0.bb
index 957286c..65e6cd1 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
@@ -10,8 +10,6 @@ require optee.inc

DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"

-PV =3D "3.8.0+git${SRCPV}"
-
SRCREV =3D "30481e381cb4285706e7516853495a7699c93b2c"
SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
@@ -29,6 +27,7 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
TEEC_EXPORT=3D${TEEC_EXPORT} \
CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
V=3D1 \
O=3D${B} \
"
--
2.17.1

--cmf0EVnR7R3592u6saZr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The optee recipes were upgraded due to issues booting with 3.8<br />on qemu=
arm64-secureboot, which were resolved by the upgrade.<br />The 3.8 recipes =
are retained for backwards compatibility.<br /><br />optee-test and optee-e=
xamples were modified to pass a sysroot<br />to the LIBGCC_LOCATE_CFLAGS pa=
rameter, to ensure proper location<br />of the libgcc library.<br /><br />R=
ecipes have been renamed to reflect their current version.<br />As this mak=
es the PV variables redundent, these have been removed.<br /><br />Change-I=
d: Iacaba02d64570a790d5cc20eca8be58246e39019<br />Signed-off-by: Brett Warr=
en &lt;brett.warren@arm.com&gt;<br />---<br />&nbsp;.../optee/optee-client_=
3.10.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | 59 +++++++++++++<br />&nbsp;...ee-client_git.bb =3D&gt; opte=
e-client_3.8.0.bb} |&nbsp; 2 -<br />&nbsp;.../optee/optee-examples_3.10.0.b=
b&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 52 ++=
++++++++++<br />&nbsp;...xamples_git.bb =3D&gt; optee-examples_3.8.0.bb} |&=
nbsp; 3 +-<br />&nbsp;.../recipes-security/optee/optee-os_3.10.0.bb | 83 ++=
+++++++++++++++++<br />&nbsp;.../{optee-os_git.bb =3D&gt; optee-os_3.8.0.bb=
}&nbsp;&nbsp;&nbsp; |&nbsp; 2 -<br />&nbsp;.../optee/optee-test_3.10.0.bb&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; | 55 ++++++++++++<br />&nbsp;...{optee-test_git.bb =3D&gt; op=
tee-test_3.8.0.bb} |&nbsp; 3 +-<br />&nbsp;8 files changed, 251 insertions(=
+), 8 deletions(-)<br />&nbsp;create mode 100644 meta-arm/recipes-security/=
optee/optee-client_3.10.0.bb<br />&nbsp;rename meta-arm/recipes-security/op=
tee/{optee-client_git.bb =3D&gt; optee-client_3.8.0.bb} (98%)<br />&nbsp;cr=
eate mode 100644 meta-arm/recipes-security/optee/optee-examples_3.10.0.bb<b=
r />&nbsp;rename meta-arm/recipes-security/optee/{optee-examples_git.bb =3D=
&gt; optee-examples_3.8.0.bb} (95%)<br />&nbsp;create mode 100644 meta-arm/=
recipes-security/optee/optee-os_3.10.0.bb<br />&nbsp;rename meta-arm/recipe=
s-security/optee/{optee-os_git.bb =3D&gt; optee-os_3.8.0.bb} (98%)<br />&nb=
sp;create mode 100644 meta-arm/recipes-security/optee/optee-test_3.10.0.bb<=
br />&nbsp;rename meta-arm/recipes-security/optee/{optee-test_git.bb =3D&gt=
; optee-test_3.8.0.bb} (96%)<br /><br />diff --git a/meta-arm/recipes-secur=
ity/optee/optee-client_3.10.0.bb b/meta-arm/recipes-security/optee/optee-cl=
ient_3.10.0.bb<br />new file mode 100644<br />index 0000000..cbd3b93<br />-=
-- /dev/null<br />+++ b/meta-arm/recipes-security/optee/optee-client_3.10.0=
.bb<br />@@ -0,0 +1,59 @@<br />+SUMMARY =3D "OP-TEE Client API"<br />+DESCR=
IPTION =3D "Open Portable Trusted Execution Environment - Normal World Clie=
nt side of the TEE"<br />+HOMEPAGE =3D "https://www.op-tee.org/"<br />+<br =
/>+LICENSE =3D "BSD"<br />+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D=
69663ab153298557a59c67a60a743e5b"<br />+<br />+require optee.inc<br />+<br =
/>+inherit python3native systemd update-rc.d<br />+<br />+SRCREV =3D "2a77c=
f88d956c34cb4a1c191bea6113e327f5fe0"<br />+SRC_URI =3D " \<br />+&nbsp;&nbs=
p;&nbsp; git://github.com/OP-TEE/optee_client.git \<br />+&nbsp;&nbsp;&nbsp=
; file://tee-supplicant.service \<br />+&nbsp;&nbsp;&nbsp; file://tee-suppl=
icant.sh \<br />+"<br />+<br />+S =3D "${WORKDIR}/git"<br />+B =3D "${WORKD=
IR}/build"<br />+<br />+EXTRA_OEMAKE =3D "O=3D${B}"<br />+<br />+do_compile=
() {<br />+&nbsp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nbsp; oe_runmake<b=
r />+}<br />+do_compile[cleandirs] =3D "${B}"<br />+<br />+do_install() {<b=
r />+&nbsp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nbsp; oe_runmake install=
<br />+<br />+&nbsp;&nbsp;&nbsp; install -D -p -m0755 ${B}/export/usr/sbin/=
tee-supplicant ${D}${sbindir}/tee-supplicant<br />+<br />+&nbsp;&nbsp;&nbsp=
; install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/lib=
teec.so.1.0<br />+&nbsp;&nbsp;&nbsp; ln -sf libteec.so.1.0 ${D}${libdir}/li=
bteec.so<br />+&nbsp;&nbsp;&nbsp; ln -sf libteec.so.1.0 ${D}${libdir}/libte=
ec.so.1<br />+<br />+&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}<br />+=
&nbsp;&nbsp;&nbsp; install -p -m0644 ${B}/export/usr/include/*.h ${D}${incl=
udedir}<br />+<br />+&nbsp;&nbsp;&nbsp; install -D -p -m0644 ${WORKDIR}/tee=
-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service<br=
 />+<br />+&nbsp;&nbsp;&nbsp; install -D -p -m0755 ${WORKDIR}/tee-supplican=
t.sh ${D}${sysconfdir}/init.d/tee-supplicant<br />+<br />+&nbsp;&nbsp;&nbsp=
; sed -i -e s:@sysconfdir@:${sysconfdir}:g \<br />+&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e s:@sbindir@:${sbindir}:g \<br />+&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; ${D}${systemd_system_unitdir}/tee-supplicant.service \<br />+&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${sy=
sconfdir}/init.d/tee-supplicant<br />+}<br />+<br />+SYSTEMD_SERVICE_${PN} =
=
=3D "tee-supplicant.service"<br />+<br />+INITSCRIPT_PACKAGES =3D "${PN}"<=
br />+<br />+INITSCRIPT_NAME_${PN} =3D "tee-supplicant"<br />+INITSCRIPT_PA=
RAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."<br />+<br />diff --git =
a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-se=
curity/optee/optee-client_3.8.0.bb<br />similarity index 98%<br />rename fr=
om meta-arm/recipes-security/optee/optee-client_git.bb<br />rename to meta-=
arm/recipes-security/optee/optee-client_3.8.0.bb<br />index 5dbbfe9..d43ebf=
4 100644<br />--- a/meta-arm/recipes-security/optee/optee-client_git.bb<br =
/>+++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb<br />@@ -5,8 =
+5,6 @@ HOMEPAGE =3D "https://www.op-tee.org/"<br />&nbsp;LICENSE =3D "BSD"=
<br />&nbsp;LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab15329855=
7a59c67a60a743e5b"<br />&nbsp;<br />-PV =3D "3.8.0+git${SRCPV}"<br />-<br /=
>&nbsp;require optee.inc<br />&nbsp;<br />&nbsp;inherit python3native syste=
md update-rc.d<br />diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb<b=
r />new file mode 100644<br />index 0000000..4a7db10<br />--- /dev/null<br =
/>+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb<br />@@ -0=
,0 +1,52 @@<br />+SUMMARY =3D "OP-TEE examples"<br />+DESCRIPTION =3D "Open=
 Portable Trusted Execution Environment - Sample Applications"<br />+HOMEPA=
GE =3D "https://github.com/linaro-swg/optee_examples"<br />+<br />+LICENSE =
=
=3D "GPLv2"<br />+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab41=
7e23b94f381dafc453d70c30"<br />+<br />+DEPENDS =3D "optee-client optee-os p=
ython3-pycryptodomex-native"<br />+<br />+inherit python3native<br />+<br /=
>+require optee.inc<br />+<br />+SRC_URI =3D "git://github.com/linaro-swg/o=
ptee_examples.git \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; file://0001-make-Pass-ldflags-during-link.patch \<br />+&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />+SRCREV =3D "c=
6eb00a9d83bf068a37e4806c97f582bb16e2973"<br />+<br />+S =3D "${WORKDIR}/git=
"<br />+B =3D "${WORKDIR}/build"<br />+<br />+OPTEE_CLIENT_EXPORT =3D "${ST=
AGING_DIR_HOST}${prefix}"<br />+TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefi=
x}"<br />+TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"<br />=
+<br />+EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<br />+&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />+&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TA_CRO=
SS_COMPILE=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_C=
FLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1=
 \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OUTPUT_DIR=3D${B} \<br />+&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />+=
<br />+do_compile() {<br />+&nbsp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&n=
bsp; oe_runmake<br />+}<br />+do_compile[cleandirs] =3D "${B}"<br />+<br />=
+do_install () {<br />+&nbsp;&nbsp;&nbsp; mkdir -p ${D}${nonarch_base_libdi=
r}/optee_armtz<br />+&nbsp;&nbsp;&nbsp; mkdir -p ${D}${bindir}<br />+&nbsp;=
&nbsp;&nbsp; install -D -p -m0755 ${B}/ca/* ${D}${bindir}<br />+&nbsp;&nbsp=
;&nbsp; install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_arm=
tz<br />+}<br />+<br />+FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armt=
z/"<br />+<br />+# Imports machine specific configs from staging to build<b=
r />+PACKAGE_ARCH =3D "${MACHINE_ARCH}"<br />diff --git a/meta-arm/recipes-=
security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/opte=
e-examples_3.8.0.bb<br />similarity index 95%<br />rename from meta-arm/rec=
ipes-security/optee/optee-examples_git.bb<br />rename to meta-arm/recipes-s=
ecurity/optee/optee-examples_3.8.0.bb<br />index 71be593..7ed3dfa 100644<br=
 />--- a/meta-arm/recipes-security/optee/optee-examples_git.bb<br />+++ b/m=
eta-arm/recipes-security/optee/optee-examples_3.8.0.bb<br />@@ -5,8 +5,6 @@=
 HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples"<br />&nbsp;LIC=
ENSE =3D "GPLv2"<br />&nbsp;LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=
=3Dcd95ab417e23b94f381dafc453d70c30"<br />&nbsp;<br />-PV =3D "3.8.0+git${=
SRCPV}"<br />-<br />&nbsp;DEPENDS =3D "optee-client optee-os python3-pycryp=
todomex-native"<br />&nbsp;<br />&nbsp;inherit python3native<br />@@ -30,6 =
+28,7 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \<br />&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; TA_CROSS_COMPILE=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \<br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; V=3D1 \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OUTPUT_DIR=3D${B} =
\<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; "<br />diff --git a/meta-arm/recipes-security/optee/=
optee-os_3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb<br =
/>new file mode 100644<br />index 0000000..369e011<br />--- /dev/null<br />=
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb<br />@@ -0,0 +1,83=
 @@<br />+SUMMARY =3D "OP-TEE Trusted OS"<br />+DESCRIPTION =3D "Open Porta=
ble Trusted Execution Environment - Trusted side of the TEE"<br />+HOMEPAGE=
 =3D "https://www.op-tee.org/"<br />+<br />+LICENSE =3D "BSD"<br />+LIC_FIL=
ES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec173"<=
br />+<br />+inherit deploy python3native<br />+require optee.inc<br />+<br=
 />+DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native p=
ython3-pyelftools-native"<br />+<br />+SRCREV =3D "d1c635434c55b7d75eadf471=
bde04926bd1e50a7"<br />+SRC_URI =3D " \<br />+&nbsp;&nbsp;&nbsp; git://gith=
ub.com/OP-TEE/optee_os.git \<br />+&nbsp;&nbsp;&nbsp; file://0006-allow-set=
ting-sysroot-for-libgcc-lookup.patch \<br />+"<br />+<br />+S =3D "${WORKDI=
R}/git"<br />+B =3D "${WORKDIR}/build"<br />+<br />+OPTEEMACHINE ?=3D "${MA=
CHINE}"<br />+OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"<br /=
>+OPTEE_ARCH =3D "null"<br />+OPTEE_ARCH_armv7a =3D "arm32"<br />+OPTEE_ARC=
H_aarch64 =3D "arm64"<br />+OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper=
()}"<br />+<br />+EXTRA_OEMAKE =3D " \<br />+&nbsp;&nbsp;&nbsp; PLATFORM=3D=
${OPTEEMACHINE} \<br />+&nbsp;&nbsp;&nbsp; CFG_${OPTEE_CORE}_core=3Dy \<br =
/>+&nbsp;&nbsp;&nbsp; CROSS_COMPILE_core=3D${HOST_PREFIX} \<br />+&nbsp;&nb=
sp;&nbsp; CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \<br />+&nbsp;&nb=
sp;&nbsp; NOWERROR=3D1 \<br />+&nbsp;&nbsp;&nbsp; V=3D1 \<br />+&nbsp;&nbsp=
;&nbsp; ta-targets=3Dta_${OPTEE_ARCH} \<br />+&nbsp;&nbsp;&nbsp; LIBGCC_LOC=
ATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \<br />+&nbsp;&nbsp;&nbsp; O=
=3D${B} \<br />+"<br />+<br />+CFLAGS[unexport] =3D "1"<br />+LDFLAGS[unex=
port] =3D "1"<br />+CPPFLAGS[unexport] =3D "1"<br />+AS[unexport] =3D "1"<b=
r />+LD[unexport] =3D "1"<br />+<br />+do_configure[noexec] =3D "1"<br />+<=
br />+do_compile() {<br />+&nbsp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nb=
sp; oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0<br />+}<br />+do_compile[cleand=
irs] =3D "${B}"<br />+<br />+do_install() {<br />+&nbsp;&nbsp;&nbsp; #insta=
ll core in firmware<br />+&nbsp;&nbsp;&nbsp; install -d ${D}${nonarch_base_=
libdir}/firmware/<br />+&nbsp;&nbsp;&nbsp; install -m 644 ${B}/core/*.bin $=
{D}${nonarch_base_libdir}/firmware/<br />+<br />+&nbsp;&nbsp;&nbsp; #instal=
l TA devkit<br />+&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}/optee/exp=
ort-user_ta/<br />+&nbsp;&nbsp;&nbsp; for f in ${B}/export-ta_${OPTEE_ARCH}=
/* ; do<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -aR $f ${D}${in=
cludedir}/optee/export-user_ta/<br />+&nbsp;&nbsp;&nbsp; done<br />+}<br />=
+<br />+PACKAGE_ARCH =3D "${MACHINE_ARCH}"<br />+<br />+do_deploy() {<br />=
+&nbsp;&nbsp;&nbsp; install -d ${DEPLOYDIR}/optee<br />+&nbsp;&nbsp;&nbsp; =
install -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/<br=
 />+}<br />+<br />+addtask deploy before do_build after do_install<br />+<b=
r />+SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"<br />+<br />+FILES=
_${PN} =3D "${nonarch_base_libdir}/firmware/"<br />+FILES_${PN}-dev =3D "${=
includedir}/optee/"<br />+<br />+INSANE_SKIP_${PN}-dev =3D "staticdev"<br /=
>+<br />+INHIBIT_PACKAGE_STRIP =3D "1"<br />diff --git a/meta-arm/recipes-s=
ecurity/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_3.=
8.0.bb<br />similarity index 98%<br />rename from meta-arm/recipes-security=
/optee/optee-os_git.bb<br />rename to meta-arm/recipes-security/optee/optee=
-os_3.8.0.bb<br />index deeb515..0001271 100644<br />--- a/meta-arm/recipes=
-security/optee/optee-os_git.bb<br />+++ b/meta-arm/recipes-security/optee/=
optee-os_3.8.0.bb<br />@@ -5,8 +5,6 @@ HOMEPAGE =3D "https://www.op-tee.org=
/"<br />&nbsp;LICENSE =3D "BSD"<br />&nbsp;LIC_FILES_CHKSUM =3D "file://${S=
}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee55ec173"<br />&nbsp;<br />-PV =3D =
"3.8.0+git${SRCPV}"<br />-<br />&nbsp;inherit deploy python3native<br />&nb=
sp;require optee.inc<br />&nbsp;<br />diff --git a/meta-arm/recipes-securit=
y/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee-test_3=
.10.0.bb<br />new file mode 100644<br />index 0000000..96e612a<br />--- /de=
v/null<br />+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb<br /=
>@@ -0,0 +1,55 @@<br />+SUMMARY =3D "OP-TEE sanity testsuite"<br />+DESCRIP=
TION =3D "Open Portable Trusted Execution Environment - Test suite"<br />+H=
OMEPAGE =3D "https://www.op-tee.org/"<br />+<br />+LICENSE =3D "BSD &amp; G=
PLv2"<br />+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666=
345ab8940aab1315a4fa"<br />+<br />+inherit python3native<br />+require opte=
e.inc<br />+<br />+DEPENDS =3D "optee-client optee-os python3-pycryptodomex=
-native"<br />+<br />+SRCREV =3D "30efcbeaf8864d0f2a5c4be593a5411001fab31b"=
<br />+SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \<br />+&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001-host-xtest=
-Adjust-order-of-including-compiler.h.patch \<br />+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />+<br />+S =3D "${WORKDIR}/git"<br />=
+B =3D "${WORKDIR}/build"<br />+<br />+OPTEE_CLIENT_EXPORT =3D "${STAGING_D=
IR_HOST}${prefix}"<br />+TEEC_EXPORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D "${STAGING_DIR_HOST}${prefix}"<br />+TA_DEV_KIT_DIR&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D "${STAGING_INCDIR}/optee/export-user_ta"<br />+<br=
 />+EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />+&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<br />+&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CRO=
SS_COMPILE_HOST=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CROSS_COMP=
ILE_TA=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAG=
S=3D--sysroot=3D${STAGING_DIR_HOST} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<b=
r />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; O=3D${B} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />+<br />+do_com=
pile() {<br />+&nbsp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nbsp; # Top le=
vel makefile doesn't seem to handle parallel make gracefully<br />+&nbsp;&n=
bsp;&nbsp; oe_runmake xtest<br />+&nbsp;&nbsp;&nbsp; oe_runmake ta<br />+}<=
br />+do_compile[cleandirs] =3D "${B}"<br />+<br />+do_install () {<br />+&=
nbsp;&nbsp;&nbsp; install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest=
<br />+<br />+&nbsp;&nbsp;&nbsp; # install path should match the value set =
in optee-client/tee-supplicant<br />+&nbsp;&nbsp;&nbsp; # default TEEC_LOAD=
_PATH is /lib<br />+&nbsp;&nbsp;&nbsp; mkdir -p ${D}${nonarch_base_libdir}/=
optee_armtz/<br />+&nbsp;&nbsp;&nbsp; install -D -p -m0444 ${B}/ta/*/*.ta $=
{D}${nonarch_base_libdir}/optee_armtz/<br />+}<br />+<br />+FILES_${PN} +=
=3D "${nonarch_base_libdir}/optee_armtz/"<br />+<br />+# Imports machine s=
pecific configs from staging to build<br />+PACKAGE_ARCH =3D "${MACHINE_ARC=
H}"<br />diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/m=
eta-arm/recipes-security/optee/optee-test_3.8.0.bb<br />similarity index 96=
%<br />rename from meta-arm/recipes-security/optee/optee-test_git.bb<br />r=
ename to meta-arm/recipes-security/optee/optee-test_3.8.0.bb<br />index 957=
286c..65e6cd1 100644<br />--- a/meta-arm/recipes-security/optee/optee-test_=
git.bb<br />+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb<br />=
@@ -10,8 +10,6 @@ require optee.inc<br />&nbsp;<br />&nbsp;DEPENDS =3D "opt=
ee-client optee-os python3-pycryptodomex-native"<br />&nbsp;<br />-PV =3D "=
3.8.0+git${SRCPV}"<br />-<br />&nbsp;SRCREV =3D "30481e381cb4285706e7516853=
495a7699c93b2c"<br />&nbsp;SRC_URI =3D "git://github.com/OP-TEE/optee_test.=
git \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \<br /=
>@@ -29,6 +27,7 @@ EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<=
br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \<br />&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; CROSS_COMPILE_TA=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \<br />&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O=3D${B}=
 \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; "<br />-- <br />2.17.1

--cmf0EVnR7R3592u6saZr--
