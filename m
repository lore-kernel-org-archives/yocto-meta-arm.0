Subject: [PATCH 6/6] optee: refactor into .inc files
To: meta-arm@lists.yoctoproject.org
From: "Brett Warren" <brett.warren@arm.com>
X-Originating-Location: Texas, US (217.140.99.251)
X-Originating-Platform: Linux Firefox 79
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Oct 2020 04:37:26 -0700
Message-ID: <saLs.1602675446043727735.TNTN@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="VBg66YQIGqSnuZvO2wfb"

--VBg66YQIGqSnuZvO2wfb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To reduce code duplication, .inc files are used to hold common parts
of recipes, allowing .bb files to only specify things specific to that
recipe version.

Change-Id: I30b51ebfb2e3147544d049b514a25886fb2b77d9
Signed-off-by: Brett Warren <brett.warren@arm.com>
---
.../recipes-security/optee/optee-client.inc=C2=A0=C2=A0 | 59 +++++++++++++
.../optee/optee-client_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58 +------------
.../optee/optee-client_3.8.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58 +------------
.../recipes-security/optee/optee-examples.inc | 55 ++++++++++++
.../optee/optee-examples_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 52 +-----------
.../optee/optee-examples_3.8.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 53 +-----------
meta-arm/recipes-security/optee/optee-os.inc=C2=A0 | 85 ++++++++++++++++++=
+
.../recipes-security/optee/optee-os_3.10.0.bb | 85 +------------------
.../recipes-security/optee/optee-os_3.8.0.bb=C2=A0 | 82 +-----------------
.../recipes-security/optee/optee-test.inc=C2=A0=C2=A0=C2=A0=C2=A0 | 58 +++=
++++++++++
.../optee/optee-test_3.10.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58 +------------
.../optee/optee-test_3.8.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 58 +------------
12 files changed, 269 insertions(+), 492 deletions(-)
create mode 100644 meta-arm/recipes-security/optee/optee-client.inc
create mode 100644 meta-arm/recipes-security/optee/optee-examples.inc
create mode 100644 meta-arm/recipes-security/optee/optee-os.inc
create mode 100644 meta-arm/recipes-security/optee/optee-test.inc

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/r=
ecipes-security/optee/optee-client.inc
new file mode 100644
index 0000000..d82392c
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-client.inc
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
+
diff --git a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta=
-arm/recipes-security/optee/optee-client_3.10.0.bb
index cbd3b93..c7cef19 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.10.0.bb
@@ -1,59 +1,3 @@
-SUMMARY =3D "OP-TEE Client API"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Normal Wor=
ld Client side of the TEE"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60=
a743e5b"
-
-require optee.inc
-
-inherit python3native systemd update-rc.d
+require optee-client.inc

SRCREV =3D "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"
-SRC_URI =3D " \
-=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_client.git \
-=C2=A0=C2=A0=C2=A0 file://tee-supplicant.service \
-=C2=A0=C2=A0=C2=A0 file://tee-supplicant.sh \
-"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-EXTRA_OEMAKE =3D "O=3D${B}"
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake install
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/export/usr/sbin/tee-supplica=
nt ${D}${sbindir}/tee-supplicant
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.=
0 ${D}${libdir}/libteec.so.1.0
-=C2=A0=C2=A0=C2=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
-=C2=A0=C2=A0=C2=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
-
-=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}
-=C2=A0=C2=A0=C2=A0 install -p -m0644 ${B}/export/usr/include/*.h ${D}${in=
cludedir}
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0644 ${WORKDIR}/tee-supplicant.service=
 ${D}${systemd_system_unitdir}/tee-supplicant.service
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}=
${sysconfdir}/init.d/tee-supplicant
-
-=C2=A0=C2=A0=C2=A0 sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e s:@sbindi=
r@:${sbindir}:g \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${D}${systemd_system_unitdir}/tee-supplicant.service \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${D}${sysconfdir}/init.d/tee-supplicant
-}
-
-SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
-
-INITSCRIPT_PACKAGES =3D "${PN}"
-
-INITSCRIPT_NAME_${PN} =3D "tee-supplicant"
-INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
-
diff --git a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb b/meta-=
arm/recipes-security/optee/optee-client_3.8.0.bb
index d43ebf4..b1587bb 100644
--- a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb
@@ -1,59 +1,3 @@
-SUMMARY =3D "OP-TEE Client API"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Normal Wor=
ld Client side of the TEE"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60=
a743e5b"
-
-require optee.inc
-
-inherit python3native systemd update-rc.d
+require optee-client.inc

SRCREV =3D "be4fa2e36f717f03ca46e574aa66f697a897d090"
-SRC_URI =3D " \
-=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_client.git \
-=C2=A0=C2=A0=C2=A0 file://tee-supplicant.service \
-=C2=A0=C2=A0=C2=A0 file://tee-supplicant.sh \
-"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-EXTRA_OEMAKE =3D "O=3D${B}"
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake install
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/export/usr/sbin/tee-supplica=
nt ${D}${sbindir}/tee-supplicant
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.=
0 ${D}${libdir}/libteec.so.1.0
-=C2=A0=C2=A0=C2=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so
-=C2=A0=C2=A0=C2=A0 ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1
-
-=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}
-=C2=A0=C2=A0=C2=A0 install -p -m0644 ${B}/export/usr/include/*.h ${D}${in=
cludedir}
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0644 ${WORKDIR}/tee-supplicant.service=
 ${D}${systemd_system_unitdir}/tee-supplicant.service
-
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}=
${sysconfdir}/init.d/tee-supplicant
-
-=C2=A0=C2=A0=C2=A0 sed -i -e s:@sysconfdir@:${sysconfdir}:g \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e s:@sbindi=
r@:${sbindir}:g \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${D}${systemd_system_unitdir}/tee-supplicant.service \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${D}${sysconfdir}/init.d/tee-supplicant
-}
-
-SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"
-
-INITSCRIPT_PACKAGES =3D "${PN}"
-
-INITSCRIPT_NAME_${PN} =3D "tee-supplicant"
-INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."
-
diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-arm=
/recipes-security/optee/optee-examples.inc
new file mode 100644
index 0000000..7d12858
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -0,0 +1,55 @@
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
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
+
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
+
+EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V=3D1 \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OUTPUT_DIR=3D${B} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "
+
+S =3D "${WORKDIR}/git"
+B =3D "${WORKDIR}/build"
+
+OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
+TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
+TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
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
+
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb b/me=
ta-arm/recipes-security/optee/optee-examples_3.10.0.bb
index 2f3cc09..1c52698 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb
@@ -1,54 +1,4 @@
-SUMMARY =3D "OP-TEE examples"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sample App=
lications"
-HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples"
+require optee-examples.inc

-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc45=
3d70c30"
-
-DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
-
-inherit python3native
-
-require optee.inc
-
-SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
make-Pass-ldflags-during-link.patch \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
SRCREV =3D "c6eb00a9d83bf068a37e4806c97f582bb16e2973"

-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V=3D1 \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OUTPUT_DIR=3D${B} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install () {
-=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
-=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${bindir}
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/ca/* ${D}${bindir}
-=C2=A0=C2=A0=C2=A0 install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libd=
ir}/optee_armtz
-}
-
-FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb b/met=
a-arm/recipes-security/optee/optee-examples_3.8.0.bb
index f10b04d..bd9b317 100644
--- a/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb
@@ -1,54 +1,3 @@
-SUMMARY =3D "OP-TEE examples"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sample App=
lications"
-HOMEPAGE =3D "https://github.com/linaro-swg/optee_examples"
+require optee-examples.inc

-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc45=
3d70c30"
-
-DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
-
-inherit python3native
-
-require optee.inc
-
-SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
make-Pass-ldflags-during-link.patch \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
SRCREV =3D "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TA_CROSS_COMPILE=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V=3D1 \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OUTPUT_DIR=3D${B} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install () {
-=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
-=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${bindir}
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/ca/* ${D}${bindir}
-=C2=A0=C2=A0=C2=A0 install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libd=
ir}/optee_armtz
-}
-
-FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recip=
es-security/optee/optee-os.inc
new file mode 100644
index 0000000..3094b35
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -0,0 +1,85 @@
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
+DEPENDS_append_toolchain-clang =3D " compiler-rt"
+
+SRC_URI =3D "git://github.com/OP-TEE/optee_os.git"
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
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
+
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
+=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
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
+
diff --git a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb b/meta-arm=
/recipes-security/optee/optee-os_3.10.0.bb
index adc8510..c3f7b12 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb
@@ -1,88 +1,9 @@
-SUMMARY =3D "OP-TEE Trusted OS"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted si=
de of the TEE"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee=
55ec173"
-
-inherit deploy python3native
-require optee.inc
-
-DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native pyt=
hon3-pyelftools-native"
-
-DEPENDS_append_toolchain-clang =3D " compiler-rt"
+require optee-os.inc

SRCREV =3D "d1c635434c55b7d75eadf471bde04926bd1e50a7"
-SRC_URI =3D " \
-=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_os.git \
+
+SRC_URI_append =3D " \
file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
file://0007-allow-setting-sysroot-for-clang.patch \
"

-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-OPTEEMACHINE ?=3D "${MACHINE}"
-OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"
-OPTEE_ARCH =3D "null"
-OPTEE_ARCH_armv7a =3D "arm32"
-OPTEE_ARCH_aarch64 =3D "arm64"
-OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE =3D " \
-=C2=A0=C2=A0=C2=A0 PLATFORM=3D${OPTEEMACHINE} \
-=C2=A0=C2=A0=C2=A0 CFG_${OPTEE_CORE}_core=3Dy \
-=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_core=3D${HOST_PREFIX} \
-=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
-=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
-=C2=A0=C2=A0=C2=A0 NOWERROR=3D1 \
-=C2=A0=C2=A0=C2=A0 V=3D1 \
-=C2=A0=C2=A0=C2=A0 ta-targets=3Dta_${OPTEE_ARCH} \
-=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST}=
 \
-=C2=A0=C2=A0=C2=A0 O=3D${B} \
-"
-
-CFLAGS[unexport] =3D "1"
-LDFLAGS[unexport] =3D "1"
-CPPFLAGS[unexport] =3D "1"
-AS[unexport] =3D "1"
-LD[unexport] =3D "1"
-
-do_configure[noexec] =3D "1"
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-=C2=A0=C2=A0=C2=A0 #install core in firmware
-=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/
-=C2=A0=C2=A0=C2=A0 install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libd=
ir}/firmware/
-
-=C2=A0=C2=A0=C2=A0 #install TA devkit
-=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/optee/export-user_ta/
-=C2=A0=C2=A0=C2=A0 for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -aR $f ${D}${includedir}/op=
tee/export-user_ta/
-=C2=A0=C2=A0=C2=A0 done
-}
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-do_deploy() {
-=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/optee
-=C2=A0=C2=A0=C2=A0 install -m 644 ${D}${nonarch_base_libdir}/firmware/* $=
{DEPLOYDIR}/optee/
-}
-
-addtask deploy before do_build after do_install
-
-SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"
-
-FILES_${PN} =3D "${nonarch_base_libdir}/firmware/"
-FILES_${PN}-dev =3D "${includedir}/optee/"
-
-INSANE_SKIP_${PN}-dev =3D "staticdev"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/meta-arm/recipes-security/optee/optee-os_3.8.0.bb b/meta-arm/=
recipes-security/optee/optee-os_3.8.0.bb
index 0001271..bc863d0 100644
--- a/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-os_3.8.0.bb
@@ -1,18 +1,8 @@
-SUMMARY =3D "OP-TEE Trusted OS"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted si=
de of the TEE"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38a5a4aee=
55ec173"
-
-inherit deploy python3native
-require optee.inc
-
-DEPENDS =3D "python3-pycryptodome-native python3-pycryptodomex-native pyt=
hon3-pyelftools-native"
+require optee-os.inc

SRCREV =3D "023e33656e2c9557ce50ad63a98b2e2c9b51c118"
-SRC_URI =3D " \
-=C2=A0=C2=A0=C2=A0 git://github.com/OP-TEE/optee_os.git \
+
+SRC_URI_append =3D " \
file://0001-mk-compile.mk-fix-cc-option-macro.patch \
file://0002-Allow-use-of-cc-option-in-core-arch-arm-arm.mk.patch \
file://0003-arm64-Disable-outline-atomics-when-compiling.patch \
@@ -21,69 +11,3 @@ SRC_URI =3D " \
file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
file://missing-mkdir.patch \
"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-OPTEEMACHINE ?=3D "${MACHINE}"
-OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"
-OPTEE_ARCH =3D "null"
-OPTEE_ARCH_armv7a =3D "arm32"
-OPTEE_ARCH_aarch64 =3D "arm64"
-OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}"
-
-EXTRA_OEMAKE =3D " \
-=C2=A0=C2=A0=C2=A0 PLATFORM=3D${OPTEEMACHINE} \
-=C2=A0=C2=A0=C2=A0 CFG_${OPTEE_CORE}_core=3Dy \
-=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_core=3D${HOST_PREFIX} \
-=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \
-=C2=A0=C2=A0=C2=A0 NOWERROR=3D1 \
-=C2=A0=C2=A0=C2=A0 V=3D1 \
-=C2=A0=C2=A0=C2=A0 ta-targets=3Dta_${OPTEE_ARCH} \
-=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST}=
 \
-=C2=A0=C2=A0=C2=A0 O=3D${B} \
-"
-
-CFLAGS[unexport] =3D "1"
-LDFLAGS[unexport] =3D "1"
-CPPFLAGS[unexport] =3D "1"
-AS[unexport] =3D "1"
-LD[unexport] =3D "1"
-
-do_configure[noexec] =3D "1"
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 oe_runmake all CFG_TEE_TA_LOG_LEVEL=3D0
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-=C2=A0=C2=A0=C2=A0 #install core in firmware
-=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/
-=C2=A0=C2=A0=C2=A0 install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libd=
ir}/firmware/
-
-=C2=A0=C2=A0=C2=A0 #install TA devkit
-=C2=A0=C2=A0=C2=A0 install -d ${D}${includedir}/optee/export-user_ta/
-=C2=A0=C2=A0=C2=A0 for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -aR $f ${D}${includedir}/op=
tee/export-user_ta/
-=C2=A0=C2=A0=C2=A0 done
-}
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-do_deploy() {
-=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/optee
-=C2=A0=C2=A0=C2=A0 install -m 644 ${D}${nonarch_base_libdir}/firmware/* $=
{DEPLOYDIR}/optee/
-}
-
-addtask deploy before do_build after do_install
-
-SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"
-
-FILES_${PN} =3D "${nonarch_base_libdir}/firmware/"
-FILES_${PN}-dev =3D "${includedir}/optee/"
-
-INSANE_SKIP_${PN}-dev =3D "staticdev"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/rec=
ipes-security/optee/optee-test.inc
new file mode 100644
index 0000000..95ed311
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -0,0 +1,58 @@
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
+SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
host-xtest-Adjust-order-of-including-compiler.h.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-=
make-remove-Wno-unsafe-loop-for-clang.patch \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0003-=
make-remove-Wmissing-noreturn-for-clang.patch \
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
+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
+
+EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
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
diff --git a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb b/meta-a=
rm/recipes-security/optee/optee-test_3.10.0.bb
index 6541de4..396f7cb 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.10.0.bb
@@ -1,59 +1,3 @@
-SUMMARY =3D "OP-TEE sanity testsuite"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test suite=
"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD & GPLv2"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940a=
ab1315a4fa"
-
-inherit python3native
-require optee.inc
-
-DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
+require optee-test.inc

SRCREV =3D "30efcbeaf8864d0f2a5c4be593a5411001fab31b"
-SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
host-xtest-Adjust-order-of-including-compiler.h.patch \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-=
make-remove-Wno-unsafe-loop-for-clang.patch \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0003-=
make-remove-Wmissing-noreturn-for-clang.patch \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGIN=
G_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGING_INCDIR}/optee=
/export-user_ta"
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V=3D1 \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 O=3D${B} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 # Top level makefile doesn't seem to handle parallel m=
ake gracefully
-=C2=A0=C2=A0=C2=A0 oe_runmake xtest
-=C2=A0=C2=A0=C2=A0 oe_runmake ta
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install () {
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xt=
est
-
-=C2=A0=C2=A0=C2=A0 # install path should match the value set in optee-cli=
ent/tee-supplicant
-=C2=A0=C2=A0=C2=A0 # default TEEC_LOAD_PATH is /lib
-=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
-=C2=A0=C2=A0=C2=A0 install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base=
_libdir}/optee_armtz/
-}
-
-FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb b/meta-ar=
m/recipes-security/optee/optee-test_3.8.0.bb
index 7f3d49b..8ea3348 100644
--- a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb
@@ -1,59 +1,3 @@
-SUMMARY =3D "OP-TEE sanity testsuite"
-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test suite=
"
-HOMEPAGE =3D "https://www.op-tee.org/"
-
-LICENSE =3D "BSD & GPLv2"
-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940a=
ab1315a4fa"
-
-inherit python3native
-require optee.inc
-
-DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
+require optee-test.inc

SRCREV =3D "30481e381cb4285706e7516853495a7699c93b2c"
-SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-=
host-xtest-Adjust-order-of-including-compiler.h.patch \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0002-=
make-remove-Wno-unsafe-loop-for-clang.patch=C2=A0 \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0003-=
make-remove-Wmissing-noreturn-for-clang.patch \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
-TEEC_EXPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGIN=
G_DIR_HOST}${prefix}"
-TA_DEV_KIT_DIR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${STAGING_INCDIR}/optee=
/export-user_ta"
-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"
-
-EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 TEEC_EXPORT=3D${TEEC_EXPORT} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 CROSS_COMPILE_TA=3D${TARGET_PREFIX} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER=3D${OPTEE_COMPILER} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 V=3D1 \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 O=3D${B} \
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "
-
-do_compile() {
-=C2=A0=C2=A0=C2=A0 cd ${S}
-=C2=A0=C2=A0=C2=A0 # Top level makefile doesn't seem to handle parallel m=
ake gracefully
-=C2=A0=C2=A0=C2=A0 oe_runmake xtest
-=C2=A0=C2=A0=C2=A0 oe_runmake ta
-}
-do_compile[cleandirs] =3D "${B}"
-
-do_install () {
-=C2=A0=C2=A0=C2=A0 install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xt=
est
-
-=C2=A0=C2=A0=C2=A0 # install path should match the value set in optee-cli=
ent/tee-supplicant
-=C2=A0=C2=A0=C2=A0 # default TEEC_LOAD_PATH is /lib
-=C2=A0=C2=A0=C2=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
-=C2=A0=C2=A0=C2=A0 install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base=
_libdir}/optee_armtz/
-}
-
-FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
-
-# Imports machine specific configs from staging to build
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
--
2.17.1

--VBg66YQIGqSnuZvO2wfb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To reduce code duplication, .inc files are used to hold common parts<br />o=
f recipes, allowing .bb files to only specify things specific to that<br />=
recipe version.<br /><br />Change-Id: I30b51ebfb2e3147544d049b514a25886fb2b=
77d9<br />Signed-off-by: Brett Warren &lt;brett.warren@arm.com&gt;<br />---=
<br />&nbsp;.../recipes-security/optee/optee-client.inc&nbsp;&nbsp; | 59 ++=
+++++++++++<br />&nbsp;.../optee/optee-client_3.10.0.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 58 +----------=
--<br />&nbsp;.../optee/optee-client_3.8.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 58 +------------<b=
r />&nbsp;.../recipes-security/optee/optee-examples.inc | 55 ++++++++++++<b=
r />&nbsp;.../optee/optee-examples_3.10.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 52 +-----------<br />&nbsp;.../optee/=
optee-examples_3.8.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; | 53 +-----------<br />&nbsp;meta-arm/recipes-security=
/optee/optee-os.inc&nbsp; | 85 +++++++++++++++++++<br />&nbsp;.../recipes-s=
ecurity/optee/optee-os_3.10.0.bb | 85 +------------------<br />&nbsp;.../re=
cipes-security/optee/optee-os_3.8.0.bb&nbsp; | 82 +-----------------<br />&=
nbsp;.../recipes-security/optee/optee-test.inc&nbsp;&nbsp;&nbsp;&nbsp; | 58=
 +++++++++++++<br />&nbsp;.../optee/optee-test_3.10.0.bb&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 5=
8 +------------<br />&nbsp;.../optee/optee-test_3.8.0.bb&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 58 +------------<br />&nbsp;12 files changed, 269 insertions(+), 492 d=
eletions(-)<br />&nbsp;create mode 100644 meta-arm/recipes-security/optee/o=
ptee-client.inc<br />&nbsp;create mode 100644 meta-arm/recipes-security/opt=
ee/optee-examples.inc<br />&nbsp;create mode 100644 meta-arm/recipes-securi=
ty/optee/optee-os.inc<br />&nbsp;create mode 100644 meta-arm/recipes-securi=
ty/optee/optee-test.inc<br /><br />diff --git a/meta-arm/recipes-security/o=
ptee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc<br=
 />new file mode 100644<br />index 0000000..d82392c<br />--- /dev/null<br /=
>+++ b/meta-arm/recipes-security/optee/optee-client.inc<br />@@ -0,0 +1,59 =
@@<br />+SUMMARY =3D "OP-TEE Client API"<br />+DESCRIPTION =3D "Open Portab=
le Trusted Execution Environment - Normal World Client side of the TEE"<br =
/>+HOMEPAGE =3D "https://www.op-tee.org/"<br />+<br />+LICENSE =3D "BSD"<br=
 />+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a=
60a743e5b"<br />+<br />+require optee.inc<br />+<br />+inherit python3nativ=
e systemd update-rc.d<br />+<br />+SRC_URI =3D " \<br />+&nbsp;&nbsp;&nbsp;=
 git://github.com/OP-TEE/optee_client.git \<br />+&nbsp;&nbsp;&nbsp; file:/=
/tee-supplicant.service \<br />+&nbsp;&nbsp;&nbsp; file://tee-supplicant.sh=
 \<br />+"<br />+<br />+S =3D "${WORKDIR}/git"<br />+B =3D "${WORKDIR}/buil=
d"<br />+<br />+EXTRA_OEMAKE =3D "O=3D${B}"<br />+<br />+do_compile() {<br =
/>+&nbsp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nbsp; oe_runmake<br />+}<b=
r />+do_compile[cleandirs] =3D "${B}"<br />+<br />+do_install() {<br />+&nb=
sp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nbsp; oe_runmake install<br />+<=
br />+&nbsp;&nbsp;&nbsp; install -D -p -m0755 ${B}/export/usr/sbin/tee-supp=
licant ${D}${sbindir}/tee-supplicant<br />+<br />+&nbsp;&nbsp;&nbsp; instal=
l -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 ${D}${libdir}/libteec.so.=
1.0<br />+&nbsp;&nbsp;&nbsp; ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so=
<br />+&nbsp;&nbsp;&nbsp; ln -sf libteec.so.1.0 ${D}${libdir}/libteec.so.1<=
br />+<br />+&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}<br />+&nbsp;&n=
bsp;&nbsp; install -p -m0644 ${B}/export/usr/include/*.h ${D}${includedir}<=
br />+<br />+&nbsp;&nbsp;&nbsp; install -D -p -m0644 ${WORKDIR}/tee-supplic=
ant.service ${D}${systemd_system_unitdir}/tee-supplicant.service<br />+<br =
/>+&nbsp;&nbsp;&nbsp; install -D -p -m0755 ${WORKDIR}/tee-supplicant.sh ${D=
}${sysconfdir}/init.d/tee-supplicant<br />+<br />+&nbsp;&nbsp;&nbsp; sed -i=
 -e s:@sysconfdir@:${sysconfdir}:g \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; -e s:@sbindir@:${sbindir}:g \<br />+&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${=
systemd_system_unitdir}/tee-supplicant.service \<br />+&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${sysconfdir=
}/init.d/tee-supplicant<br />+}<br />+<br />+SYSTEMD_SERVICE_${PN} =3D "tee=
-supplicant.service"<br />+<br />+INITSCRIPT_PACKAGES =3D "${PN}"<br />+<br=
 />+INITSCRIPT_NAME_${PN} =3D "tee-supplicant"<br />+INITSCRIPT_PARAMS_${PN=
} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."<br />+<br />+<br />diff --git a/=
meta-arm/recipes-security/optee/optee-client_3.10.0.bb b/meta-arm/recipes-s=
ecurity/optee/optee-client_3.10.0.bb<br />index cbd3b93..c7cef19 100644<br =
/>--- a/meta-arm/recipes-security/optee/optee-client_3.10.0.bb<br />+++ b/m=
eta-arm/recipes-security/optee/optee-client_3.10.0.bb<br />@@ -1,59 +1,3 @@=
<br />-SUMMARY =3D "OP-TEE Client API"<br />-DESCRIPTION =3D "Open Portable=
 Trusted Execution Environment - Normal World Client side of the TEE"<br />=
-HOMEPAGE =3D "https://www.op-tee.org/"<br />-<br />-LICENSE =3D "BSD"<br /=
>-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60=
a743e5b"<br />-<br />-require optee.inc<br />-<br />-inherit python3native =
systemd update-rc.d<br />+require optee-client.inc<br />&nbsp;<br />&nbsp;S=
RCREV =3D "2a77cf88d956c34cb4a1c191bea6113e327f5fe0"<br />-SRC_URI =3D " \<=
br />-&nbsp;&nbsp;&nbsp; git://github.com/OP-TEE/optee_client.git \<br />-&=
nbsp;&nbsp;&nbsp; file://tee-supplicant.service \<br />-&nbsp;&nbsp;&nbsp; =
file://tee-supplicant.sh \<br />-"<br />-<br />-S =3D "${WORKDIR}/git"<br /=
>-B =3D "${WORKDIR}/build"<br />-<br />-EXTRA_OEMAKE =3D "O=3D${B}"<br />-<=
br />-do_compile() {<br />-&nbsp;&nbsp;&nbsp; cd ${S}<br />-&nbsp;&nbsp;&nb=
sp; oe_runmake<br />-}<br />-do_compile[cleandirs] =3D "${B}"<br />-<br />-=
do_install() {<br />-&nbsp;&nbsp;&nbsp; cd ${S}<br />-&nbsp;&nbsp;&nbsp; oe=
_runmake install<br />-<br />-&nbsp;&nbsp;&nbsp; install -D -p -m0755 ${B}/=
export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplicant<br />-<br />-&=
nbsp;&nbsp;&nbsp; install -D -p -m0644 ${B}/export/usr/lib/libteec.so.1.0 $=
{D}${libdir}/libteec.so.1.0<br />-&nbsp;&nbsp;&nbsp; ln -sf libteec.so.1.0 =
${D}${libdir}/libteec.so<br />-&nbsp;&nbsp;&nbsp; ln -sf libteec.so.1.0 ${D=
}${libdir}/libteec.so.1<br />-<br />-&nbsp;&nbsp;&nbsp; install -d ${D}${in=
cludedir}<br />-&nbsp;&nbsp;&nbsp; install -p -m0644 ${B}/export/usr/includ=
e/*.h ${D}${includedir}<br />-<br />-&nbsp;&nbsp;&nbsp; install -D -p -m064=
4 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-suppl=
icant.service<br />-<br />-&nbsp;&nbsp;&nbsp; install -D -p -m0755 ${WORKDI=
R}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplicant<br />-<br />-&=
nbsp;&nbsp;&nbsp; sed -i -e s:@sysconfdir@:${sysconfdir}:g \<br />-&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e s:@sbindir@:${sbind=
ir}:g \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; ${D}${systemd_system_unitdir}/tee-supplicant.service \<br=
 />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ${D}${sysconfdir}/init.d/tee-supplicant<br />-}<br />-<br />-SYSTEM=
D_SERVICE_${PN} =3D "tee-supplicant.service"<br />-<br />-INITSCRIPT_PACKAG=
ES =3D "${PN}"<br />-<br />-INITSCRIPT_NAME_${PN} =3D "tee-supplicant"<br /=
>-INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 90 0 6 ."<br />-<b=
r />diff --git a/meta-arm/recipes-security/optee/optee-client_3.8.0.bb b/me=
ta-arm/recipes-security/optee/optee-client_3.8.0.bb<br />index d43ebf4..b15=
87bb 100644<br />--- a/meta-arm/recipes-security/optee/optee-client_3.8.0.b=
b<br />+++ b/meta-arm/recipes-security/optee/optee-client_3.8.0.bb<br />@@ =
-1,59 +1,3 @@<br />-SUMMARY =3D "OP-TEE Client API"<br />-DESCRIPTION =3D "=
Open Portable Trusted Execution Environment - Normal World Client side of t=
he TEE"<br />-HOMEPAGE =3D "https://www.op-tee.org/"<br />-<br />-LICENSE =
=3D "BSD"<br />-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D69663ab153=
298557a59c67a60a743e5b"<br />-<br />-require optee.inc<br />-<br />-inherit=
 python3native systemd update-rc.d<br />+require optee-client.inc<br />&nbs=
p;<br />&nbsp;SRCREV =3D "be4fa2e36f717f03ca46e574aa66f697a897d090"<br />-S=
RC_URI =3D " \<br />-&nbsp;&nbsp;&nbsp; git://github.com/OP-TEE/optee_clien=
t.git \<br />-&nbsp;&nbsp;&nbsp; file://tee-supplicant.service \<br />-&nbs=
p;&nbsp;&nbsp; file://tee-supplicant.sh \<br />-"<br />-<br />-S =3D "${WOR=
KDIR}/git"<br />-B =3D "${WORKDIR}/build"<br />-<br />-EXTRA_OEMAKE =3D "O=
=3D${B}"<br />-<br />-do_compile() {<br />-&nbsp;&nbsp;&nbsp; cd ${S}<br /=
>-&nbsp;&nbsp;&nbsp; oe_runmake<br />-}<br />-do_compile[cleandirs] =3D "${=
B}"<br />-<br />-do_install() {<br />-&nbsp;&nbsp;&nbsp; cd ${S}<br />-&nbs=
p;&nbsp;&nbsp; oe_runmake install<br />-<br />-&nbsp;&nbsp;&nbsp; install -=
D -p -m0755 ${B}/export/usr/sbin/tee-supplicant ${D}${sbindir}/tee-supplica=
nt<br />-<br />-&nbsp;&nbsp;&nbsp; install -D -p -m0644 ${B}/export/usr/lib=
/libteec.so.1.0 ${D}${libdir}/libteec.so.1.0<br />-&nbsp;&nbsp;&nbsp; ln -s=
f libteec.so.1.0 ${D}${libdir}/libteec.so<br />-&nbsp;&nbsp;&nbsp; ln -sf l=
ibteec.so.1.0 ${D}${libdir}/libteec.so.1<br />-<br />-&nbsp;&nbsp;&nbsp; in=
stall -d ${D}${includedir}<br />-&nbsp;&nbsp;&nbsp; install -p -m0644 ${B}/=
export/usr/include/*.h ${D}${includedir}<br />-<br />-&nbsp;&nbsp;&nbsp; in=
stall -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_u=
nitdir}/tee-supplicant.service<br />-<br />-&nbsp;&nbsp;&nbsp; install -D -=
p -m0755 ${WORKDIR}/tee-supplicant.sh ${D}${sysconfdir}/init.d/tee-supplica=
nt<br />-<br />-&nbsp;&nbsp;&nbsp; sed -i -e s:@sysconfdir@:${sysconfdir}:g=
 \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -e s:=
@sbindir@:${sbindir}:g \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${D}${systemd_system_unitdir}/tee-suppli=
cant.service \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ${D}${sysconfdir}/init.d/tee-supplicant<br />-}<br=
 />-<br />-SYSTEMD_SERVICE_${PN} =3D "tee-supplicant.service"<br />-<br />-=
INITSCRIPT_PACKAGES =3D "${PN}"<br />-<br />-INITSCRIPT_NAME_${PN} =3D "tee=
-supplicant"<br />-INITSCRIPT_PARAMS_${PN} =3D "start 10 1 2 3 4 5 . stop 9=
0 0 6 ."<br />-<br />diff --git a/meta-arm/recipes-security/optee/optee-exa=
mples.inc b/meta-arm/recipes-security/optee/optee-examples.inc<br />new fil=
e mode 100644<br />index 0000000..7d12858<br />--- /dev/null<br />+++ b/met=
a-arm/recipes-security/optee/optee-examples.inc<br />@@ -0,0 +1,55 @@<br />=
+SUMMARY =3D "OP-TEE examples"<br />+DESCRIPTION =3D "Open Portable Trusted=
 Execution Environment - Sample Applications"<br />+HOMEPAGE =3D "https://g=
ithub.com/linaro-swg/optee_examples"<br />+<br />+LICENSE =3D "GPLv2"<br />=
+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381dafc453=
d70c30"<br />+<br />+DEPENDS =3D "optee-client optee-os python3-pycryptodom=
ex-native"<br />+<br />+inherit python3native<br />+<br />+require optee.in=
c<br />+<br />+SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git =
\<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file:/=
/0001-make-Pass-ldflags-during-link.patch \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />+<br />+OPTEE_COMPILER =3D "${@d.getVa=
r('TOOLCHAIN') or 'gcc'}"<br />+<br />+EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D=
${TA_DEV_KIT_DIR} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_CLIENT_EXPORT=3D${OPT=
EE_CLIENT_EXPORT} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT=
} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HOST_CROSS_COMPILE=3D${TARGET_PREFIX} \<br =
/>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_H=
OST} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER=3D${OPTEE_COMPILER} \<br />+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; TA_CROSS_COMPILE=3D${TARGET_PREFIX} \<br />+&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; V=3D1 \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OUTPUT_DIR=3D${B} \<br />+&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; "<br />+<br />+S =3D "${WORKDIR}/git"<br />+B =3D "${WORKDIR}/build"=
<br />+<br />+OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"<br />+=
TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"<br />+TA_DEV_KIT_DIR =3D "${=
STAGING_INCDIR}/optee/export-user_ta"<br />+<br />+do_compile() {<br />+&nb=
sp;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nbsp; oe_runmake<br />+}<br />+d=
o_compile[cleandirs] =3D "${B}"<br />+<br />+do_install () {<br />+&nbsp;&n=
bsp;&nbsp; mkdir -p ${D}${nonarch_base_libdir}/optee_armtz<br />+&nbsp;&nbs=
p;&nbsp; mkdir -p ${D}${bindir}<br />+&nbsp;&nbsp;&nbsp; install -D -p -m07=
55 ${B}/ca/* ${D}${bindir}<br />+&nbsp;&nbsp;&nbsp; install -D -p -m0444 ${=
B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz<br />+}<br />+<br />+FILES_$=
{PN} +=3D "${nonarch_base_libdir}/optee_armtz/"<br />+<br />+# Imports mach=
ine specific configs from staging to build<br />+PACKAGE_ARCH =3D "${MACHIN=
E_ARCH}"<br />+<br />diff --git a/meta-arm/recipes-security/optee/optee-exa=
mples_3.10.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.10.0.bb<=
br />index 2f3cc09..1c52698 100644<br />--- a/meta-arm/recipes-security/opt=
ee/optee-examples_3.10.0.bb<br />+++ b/meta-arm/recipes-security/optee/opte=
e-examples_3.10.0.bb<br />@@ -1,54 +1,4 @@<br />-SUMMARY =3D "OP-TEE exampl=
es"<br />-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sa=
mple Applications"<br />-HOMEPAGE =3D "https://github.com/linaro-swg/optee_=
examples"<br />+require optee-examples.inc<br />&nbsp;<br />-LICENSE =3D "G=
PLv2"<br />-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94=
f381dafc453d70c30"<br />-<br />-DEPENDS =3D "optee-client optee-os python3-=
pycryptodomex-native"<br />-<br />-inherit python3native<br />-<br />-requi=
re optee.inc<br />-<br />-SRC_URI =3D "git://github.com/linaro-swg/optee_ex=
amples.git \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; file://0001-make-Pass-ldflags-during-link.patch \<br />-&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />&nbsp;SRCREV =3D "c6e=
b00a9d83bf068a37e4806c97f582bb16e2973"<br />&nbsp;<br />-S =3D "${WORKDIR}/=
git"<br />-B =3D "${WORKDIR}/build"<br />-<br />-OPTEE_CLIENT_EXPORT =3D "$=
{STAGING_DIR_HOST}${prefix}"<br />-TEEC_EXPORT =3D "${STAGING_DIR_HOST}${pr=
efix}"<br />-TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"<br=
 />-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />-<br />-EX=
TRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />-&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<br />-&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HOST_CROS=
S_COMPILE=3D${TARGET_PREFIX} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TA_CROSS_COMPILE=
=
=3D${TARGET_PREFIX} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER=3D${OPTEE_COMPI=
LER} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STA=
GING_DIR_HOST} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<br />-&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; OUTPUT_DIR=3D${B} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />-<br />-do_compile() {<br =
/>-&nbsp;&nbsp;&nbsp; cd ${S}<br />-&nbsp;&nbsp;&nbsp; oe_runmake<br />-}<b=
r />-do_compile[cleandirs] =3D "${B}"<br />-<br />-do_install () {<br />-&n=
bsp;&nbsp;&nbsp; mkdir -p ${D}${nonarch_base_libdir}/optee_armtz<br />-&nbs=
p;&nbsp;&nbsp; mkdir -p ${D}${bindir}<br />-&nbsp;&nbsp;&nbsp; install -D -=
p -m0755 ${B}/ca/* ${D}${bindir}<br />-&nbsp;&nbsp;&nbsp; install -D -p -m0=
444 ${B}/ta/* ${D}${nonarch_base_libdir}/optee_armtz<br />-}<br />-<br />-F=
ILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"<br />-<br />-# Import=
s machine specific configs from staging to build<br />-PACKAGE_ARCH =3D "${=
MACHINE_ARCH}"<br />diff --git a/meta-arm/recipes-security/optee/optee-exam=
ples_3.8.0.bb b/meta-arm/recipes-security/optee/optee-examples_3.8.0.bb<br =
/>index f10b04d..bd9b317 100644<br />--- a/meta-arm/recipes-security/optee/=
optee-examples_3.8.0.bb<br />+++ b/meta-arm/recipes-security/optee/optee-ex=
amples_3.8.0.bb<br />@@ -1,54 +1,3 @@<br />-SUMMARY =3D "OP-TEE examples"<b=
r />-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Sample =
Applications"<br />-HOMEPAGE =3D "https://github.com/linaro-swg/optee_examp=
les"<br />+require optee-examples.inc<br />&nbsp;<br />-LICENSE =3D "GPLv2"=
<br />-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dcd95ab417e23b94f381d=
afc453d70c30"<br />-<br />-DEPENDS =3D "optee-client optee-os python3-pycry=
ptodomex-native"<br />-<br />-inherit python3native<br />-<br />-require op=
tee.inc<br />-<br />-SRC_URI =3D "git://github.com/linaro-swg/optee_example=
s.git \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
file://0001-make-Pass-ldflags-during-link.patch \<br />-&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />&nbsp;SRCREV =3D "559b2141=
c16bf0f57ccd72f60e4deb84fc2a05b0"<br />-<br />-S =3D "${WORKDIR}/git"<br />=
-B =3D "${WORKDIR}/build"<br />-<br />-OPTEE_CLIENT_EXPORT =3D "${STAGING_D=
IR_HOST}${prefix}"<br />-TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"<br =
/>-TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"<br />-OPTEE_=
COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />-<br />-EXTRA_OEMAKE=
 =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPT=
EE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEE=
C_EXPORT=3D${TEEC_EXPORT} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HOST_CROSS_COMPILE=
=3D${TARGET_PREFIX} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TA_CROSS_COMPILE=3D${TAR=
GET_PREFIX} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER=3D${OPTEE_COMPILER} \<br=
 />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_=
HOST} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OUT=
PUT_DIR=3D${B} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />-<br />-do_compile() {<br />-&nbsp;=
&nbsp;&nbsp; cd ${S}<br />-&nbsp;&nbsp;&nbsp; oe_runmake<br />-}<br />-do_c=
ompile[cleandirs] =3D "${B}"<br />-<br />-do_install () {<br />-&nbsp;&nbsp=
;&nbsp; mkdir -p ${D}${nonarch_base_libdir}/optee_armtz<br />-&nbsp;&nbsp;&=
nbsp; mkdir -p ${D}${bindir}<br />-&nbsp;&nbsp;&nbsp; install -D -p -m0755 =
${B}/ca/* ${D}${bindir}<br />-&nbsp;&nbsp;&nbsp; install -D -p -m0444 ${B}/=
ta/* ${D}${nonarch_base_libdir}/optee_armtz<br />-}<br />-<br />-FILES_${PN=
} +=3D "${nonarch_base_libdir}/optee_armtz/"<br />-<br />-# Imports machine=
 specific configs from staging to build<br />-PACKAGE_ARCH =3D "${MACHINE_A=
RCH}"<br />diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta=
-arm/recipes-security/optee/optee-os.inc<br />new file mode 100644<br />ind=
ex 0000000..3094b35<br />--- /dev/null<br />+++ b/meta-arm/recipes-security=
/optee/optee-os.inc<br />@@ -0,0 +1,85 @@<br />+SUMMARY =3D "OP-TEE Trusted=
 OS"<br />+DESCRIPTION =3D "Open Portable Trusted Execution Environment - T=
rusted side of the TEE"<br />+HOMEPAGE =3D "https://www.op-tee.org/"<br />+=
<br />+LICENSE =3D "BSD"<br />+LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md=
5=3Dc1f21c4f72f372ef38a5a4aee55ec173"<br />+<br />+inherit deploy python3na=
tive<br />+require optee.inc<br />+<br />+DEPENDS =3D "python3-pycryptodome=
-native python3-pycryptodomex-native python3-pyelftools-native"<br />+<br /=
>+DEPENDS_append_toolchain-clang =3D " compiler-rt"<br />+<br />+SRC_URI =
=3D "git://github.com/OP-TEE/optee_os.git"<br />+<br />+S =3D "${WORKDIR}/=
git"<br />+B =3D "${WORKDIR}/build"<br />+<br />+OPTEEMACHINE ?=3D "${MACHI=
NE}"<br />+OPTEEMACHINE_aarch64_qemuall ?=3D "vexpress-qemu_armv8a"<br />+O=
PTEE_ARCH =3D "null"<br />+OPTEE_ARCH_armv7a =3D "arm32"<br />+OPTEE_ARCH_a=
arch64 =3D "arm64"<br />+OPTEE_CORE =3D "${@d.getVar('OPTEE_ARCH').upper()}=
"<br />+OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />+<br /=
>+<br />+EXTRA_OEMAKE =3D " \<br />+&nbsp;&nbsp;&nbsp; PLATFORM=3D${OPTEEMA=
CHINE} \<br />+&nbsp;&nbsp;&nbsp; CFG_${OPTEE_CORE}_core=3Dy \<br />+&nbsp;=
&nbsp;&nbsp; CROSS_COMPILE_core=3D${HOST_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;=
 CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;=
 NOWERROR=3D1 \<br />+&nbsp;&nbsp;&nbsp; V=3D1 \<br />+&nbsp;&nbsp;&nbsp; t=
a-targets=3Dta_${OPTEE_ARCH} \<br />+&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAG=
S=3D--sysroot=3D${STAGING_DIR_HOST} \<br />+&nbsp;&nbsp;&nbsp; COMPILER=3D$=
{OPTEE_COMPILER} \<br />+&nbsp;&nbsp;&nbsp; O=3D${B} \<br />+"<br />+<br />=
+CFLAGS[unexport] =3D "1"<br />+LDFLAGS[unexport] =3D "1"<br />+CPPFLAGS[un=
export] =3D "1"<br />+AS[unexport] =3D "1"<br />+LD[unexport] =3D "1"<br />=
+<br />+do_configure[noexec] =3D "1"<br />+<br />+do_compile() {<br />+&nbs=
p;&nbsp;&nbsp; cd ${S}<br />+&nbsp;&nbsp;&nbsp; oe_runmake all CFG_TEE_TA_L=
OG_LEVEL=3D0<br />+}<br />+do_compile[cleandirs] =3D "${B}"<br />+<br />+do=
_install() {<br />+&nbsp;&nbsp;&nbsp; #install core in firmware<br />+&nbsp=
;&nbsp;&nbsp; install -d ${D}${nonarch_base_libdir}/firmware/<br />+&nbsp;&=
nbsp;&nbsp; install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmw=
are/<br />+<br />+&nbsp;&nbsp;&nbsp; #install TA devkit<br />+&nbsp;&nbsp;&=
nbsp; install -d ${D}${includedir}/optee/export-user_ta/<br />+&nbsp;&nbsp;=
&nbsp; for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do<br />+&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; cp -aR $f ${D}${includedir}/optee/export-user_ta/=
<br />+&nbsp;&nbsp;&nbsp; done<br />+}<br />+<br />+PACKAGE_ARCH =3D "${MAC=
HINE_ARCH}"<br />+<br />+do_deploy() {<br />+&nbsp;&nbsp;&nbsp; install -d =
${DEPLOYDIR}/optee<br />+&nbsp;&nbsp;&nbsp; install -m 644 ${D}${nonarch_ba=
se_libdir}/firmware/* ${DEPLOYDIR}/optee/<br />+}<br />+<br />+addtask depl=
oy before do_build after do_install<br />+<br />+SYSROOT_DIRS +=3D "${nonar=
ch_base_libdir}/firmware"<br />+<br />+FILES_${PN} =3D "${nonarch_base_libd=
ir}/firmware/"<br />+FILES_${PN}-dev =3D "${includedir}/optee/"<br />+<br /=
>+INSANE_SKIP_${PN}-dev =3D "staticdev"<br />+<br />+INHIBIT_PACKAGE_STRIP =
=
=3D "1"<br />+<br />diff --git a/meta-arm/recipes-security/optee/optee-os_=
3.10.0.bb b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb<br />index a=
dc8510..c3f7b12 100644<br />--- a/meta-arm/recipes-security/optee/optee-os_=
3.10.0.bb<br />+++ b/meta-arm/recipes-security/optee/optee-os_3.10.0.bb<br =
/>@@ -1,88 +1,9 @@<br />-SUMMARY =3D "OP-TEE Trusted OS"<br />-DESCRIPTION =
=
=3D "Open Portable Trusted Execution Environment - Trusted side of the TEE=
"<br />-HOMEPAGE =3D "https://www.op-tee.org/"<br />-<br />-LICENSE =3D "BS=
D"<br />-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f21c4f72f372ef38=
a5a4aee55ec173"<br />-<br />-inherit deploy python3native<br />-require opt=
ee.inc<br />-<br />-DEPENDS =3D "python3-pycryptodome-native python3-pycryp=
todomex-native python3-pyelftools-native"<br />-<br />-DEPENDS_append_toolc=
hain-clang =3D " compiler-rt"<br />+require optee-os.inc<br />&nbsp;<br />&=
nbsp;SRCREV =3D "d1c635434c55b7d75eadf471bde04926bd1e50a7"<br />-SRC_URI =
=3D " \<br />-&nbsp;&nbsp;&nbsp; git://github.com/OP-TEE/optee_os.git \<br=
 />+<br />+SRC_URI_append =3D " \<br />&nbsp;&nbsp;&nbsp;&nbsp; file://0006=
-allow-setting-sysroot-for-libgcc-lookup.patch \<br />&nbsp;&nbsp;&nbsp;&nb=
sp; file://0007-allow-setting-sysroot-for-clang.patch \<br />&nbsp;"<br />&=
nbsp;<br />-S =3D "${WORKDIR}/git"<br />-B =3D "${WORKDIR}/build"<br />-<br=
 />-OPTEEMACHINE ?=3D "${MACHINE}"<br />-OPTEEMACHINE_aarch64_qemuall ?=3D =
"vexpress-qemu_armv8a"<br />-OPTEE_ARCH =3D "null"<br />-OPTEE_ARCH_armv7a =
=
=3D "arm32"<br />-OPTEE_ARCH_aarch64 =3D "arm64"<br />-OPTEE_CORE =3D "${@=
d.getVar('OPTEE_ARCH').upper()}"<br />-OPTEE_COMPILER =3D "${@d.getVar('TOO=
LCHAIN') or 'gcc'}"<br />-<br />-EXTRA_OEMAKE =3D " \<br />-&nbsp;&nbsp;&nb=
sp; PLATFORM=3D${OPTEEMACHINE} \<br />-&nbsp;&nbsp;&nbsp; CFG_${OPTEE_CORE}=
_core=3Dy \<br />-&nbsp;&nbsp;&nbsp; CROSS_COMPILE_core=3D${HOST_PREFIX} \<=
br />-&nbsp;&nbsp;&nbsp; CROSS_COMPILE_ta_${OPTEE_ARCH}=3D${HOST_PREFIX} \<=
br />-&nbsp;&nbsp;&nbsp; COMPILER=3D${OPTEE_COMPILER} \<br />-&nbsp;&nbsp;&=
nbsp; NOWERROR=3D1 \<br />-&nbsp;&nbsp;&nbsp; V=3D1 \<br />-&nbsp;&nbsp;&nb=
sp; ta-targets=3Dta_${OPTEE_ARCH} \<br />-&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_=
CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} \<br />-&nbsp;&nbsp;&nbsp; O=3D${B=
} \<br />-"<br />-<br />-CFLAGS[unexport] =3D "1"<br />-LDFLAGS[unexport] =
=3D "1"<br />-CPPFLAGS[unexport] =3D "1"<br />-AS[unexport] =3D "1"<br />-=
LD[unexport] =3D "1"<br />-<br />-do_configure[noexec] =3D "1"<br />-<br />=
-do_compile() {<br />-&nbsp;&nbsp;&nbsp; cd ${S}<br />-&nbsp;&nbsp;&nbsp; o=
e_runmake all CFG_TEE_TA_LOG_LEVEL=3D0<br />-}<br />-do_compile[cleandirs] =
=
=3D "${B}"<br />-<br />-do_install() {<br />-&nbsp;&nbsp;&nbsp; #install c=
ore in firmware<br />-&nbsp;&nbsp;&nbsp; install -d ${D}${nonarch_base_libd=
ir}/firmware/<br />-&nbsp;&nbsp;&nbsp; install -m 644 ${B}/core/*.bin ${D}$=
{nonarch_base_libdir}/firmware/<br />-<br />-&nbsp;&nbsp;&nbsp; #install TA=
 devkit<br />-&nbsp;&nbsp;&nbsp; install -d ${D}${includedir}/optee/export-=
user_ta/<br />-&nbsp;&nbsp;&nbsp; for f in ${B}/export-ta_${OPTEE_ARCH}/* ;=
 do<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp -aR $f ${D}${includ=
edir}/optee/export-user_ta/<br />-&nbsp;&nbsp;&nbsp; done<br />-}<br />-<br=
 />-PACKAGE_ARCH =3D "${MACHINE_ARCH}"<br />-<br />-do_deploy() {<br />-&nb=
sp;&nbsp;&nbsp; install -d ${DEPLOYDIR}/optee<br />-&nbsp;&nbsp;&nbsp; inst=
all -m 644 ${D}${nonarch_base_libdir}/firmware/* ${DEPLOYDIR}/optee/<br />-=
}<br />-<br />-addtask deploy before do_build after do_install<br />-<br />=
-SYSROOT_DIRS +=3D "${nonarch_base_libdir}/firmware"<br />-<br />-FILES_${P=
N} =3D "${nonarch_base_libdir}/firmware/"<br />-FILES_${PN}-dev =3D "${incl=
udedir}/optee/"<br />-<br />-INSANE_SKIP_${PN}-dev =3D "staticdev"<br />-<b=
r />-INHIBIT_PACKAGE_STRIP =3D "1"<br />diff --git a/meta-arm/recipes-secur=
ity/optee/optee-os_3.8.0.bb b/meta-arm/recipes-security/optee/optee-os_3.8.=
0.bb<br />index 0001271..bc863d0 100644<br />--- a/meta-arm/recipes-securit=
y/optee/optee-os_3.8.0.bb<br />+++ b/meta-arm/recipes-security/optee/optee-=
os_3.8.0.bb<br />@@ -1,18 +1,8 @@<br />-SUMMARY =3D "OP-TEE Trusted OS"<br =
/>-DESCRIPTION =3D "Open Portable Trusted Execution Environment - Trusted s=
ide of the TEE"<br />-HOMEPAGE =3D "https://www.op-tee.org/"<br />-<br />-L=
ICENSE =3D "BSD"<br />-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3Dc1f2=
1c4f72f372ef38a5a4aee55ec173"<br />-<br />-inherit deploy python3native<br =
/>-require optee.inc<br />-<br />-DEPENDS =3D "python3-pycryptodome-native =
python3-pycryptodomex-native python3-pyelftools-native"<br />+require optee=
-os.inc<br />&nbsp;<br />&nbsp;SRCREV =3D "023e33656e2c9557ce50ad63a98b2e2c=
9b51c118"<br />-SRC_URI =3D " \<br />-&nbsp;&nbsp;&nbsp; git://github.com/O=
P-TEE/optee_os.git \<br />+<br />+SRC_URI_append =3D " \<br />&nbsp;&nbsp;&=
nbsp;&nbsp; file://0001-mk-compile.mk-fix-cc-option-macro.patch \<br />&nbs=
p;&nbsp;&nbsp;&nbsp; file://0002-Allow-use-of-cc-option-in-core-arch-arm-ar=
m.mk.patch \<br />&nbsp;&nbsp;&nbsp;&nbsp; file://0003-arm64-Disable-outlin=
e-atomics-when-compiling.patch \<br />@@ -21,69 +11,3 @@ SRC_URI =3D " \<br=
 />&nbsp;&nbsp;&nbsp;&nbsp; file://0006-allow-setting-sysroot-for-libgcc-lo=
okup.patch \<br />&nbsp;&nbsp;&nbsp;&nbsp; file://missing-mkdir.patch \<br =
/>&nbsp;"<br />-<br />-S =3D "${WORKDIR}/git"<br />-B =3D "${WORKDIR}/build=
"<br />-<br />-OPTEEMACHINE ?=3D "${MACHINE}"<br />-OPTEEMACHINE_aarch64_qe=
muall ?=3D "vexpress-qemu_armv8a"<br />-OPTEE_ARCH =3D "null"<br />-OPTEE_A=
RCH_armv7a =3D "arm32"<br />-OPTEE_ARCH_aarch64 =3D "arm64"<br />-OPTEE_COR=
E =3D "${@d.getVar('OPTEE_ARCH').upper()}"<br />-<br />-EXTRA_OEMAKE =3D " =
\<br />-&nbsp;&nbsp;&nbsp; PLATFORM=3D${OPTEEMACHINE} \<br />-&nbsp;&nbsp;&=
nbsp; CFG_${OPTEE_CORE}_core=3Dy \<br />-&nbsp;&nbsp;&nbsp; CROSS_COMPILE_c=
ore=3D${HOST_PREFIX} \<br />-&nbsp;&nbsp;&nbsp; CROSS_COMPILE_ta_${OPTEE_AR=
CH}=3D${HOST_PREFIX} \<br />-&nbsp;&nbsp;&nbsp; NOWERROR=3D1 \<br />-&nbsp;=
&nbsp;&nbsp; V=3D1 \<br />-&nbsp;&nbsp;&nbsp; ta-targets=3Dta_${OPTEE_ARCH}=
 \<br />-&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DI=
R_HOST} \<br />-&nbsp;&nbsp;&nbsp; O=3D${B} \<br />-"<br />-<br />-CFLAGS[u=
nexport] =3D "1"<br />-LDFLAGS[unexport] =3D "1"<br />-CPPFLAGS[unexport] =
=3D "1"<br />-AS[unexport] =3D "1"<br />-LD[unexport] =3D "1"<br />-<br />=
-do_configure[noexec] =3D "1"<br />-<br />-do_compile() {<br />-&nbsp;&nbsp=
;&nbsp; cd ${S}<br />-&nbsp;&nbsp;&nbsp; oe_runmake all CFG_TEE_TA_LOG_LEVE=
L=3D0<br />-}<br />-do_compile[cleandirs] =3D "${B}"<br />-<br />-do_instal=
l() {<br />-&nbsp;&nbsp;&nbsp; #install core in firmware<br />-&nbsp;&nbsp;=
&nbsp; install -d ${D}${nonarch_base_libdir}/firmware/<br />-&nbsp;&nbsp;&n=
bsp; install -m 644 ${B}/core/*.bin ${D}${nonarch_base_libdir}/firmware/<br=
 />-<br />-&nbsp;&nbsp;&nbsp; #install TA devkit<br />-&nbsp;&nbsp;&nbsp; i=
nstall -d ${D}${includedir}/optee/export-user_ta/<br />-&nbsp;&nbsp;&nbsp; =
for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do<br />-&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; cp -aR $f ${D}${includedir}/optee/export-user_ta/<br />-=
&nbsp;&nbsp;&nbsp; done<br />-}<br />-<br />-PACKAGE_ARCH =3D "${MACHINE_AR=
CH}"<br />-<br />-do_deploy() {<br />-&nbsp;&nbsp;&nbsp; install -d ${DEPLO=
YDIR}/optee<br />-&nbsp;&nbsp;&nbsp; install -m 644 ${D}${nonarch_base_libd=
ir}/firmware/* ${DEPLOYDIR}/optee/<br />-}<br />-<br />-addtask deploy befo=
re do_build after do_install<br />-<br />-SYSROOT_DIRS +=3D "${nonarch_base=
_libdir}/firmware"<br />-<br />-FILES_${PN} =3D "${nonarch_base_libdir}/fir=
mware/"<br />-FILES_${PN}-dev =3D "${includedir}/optee/"<br />-<br />-INSAN=
E_SKIP_${PN}-dev =3D "staticdev"<br />-<br />-INHIBIT_PACKAGE_STRIP =3D "1"=
<br />diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-ar=
m/recipes-security/optee/optee-test.inc<br />new file mode 100644<br />inde=
x 0000000..95ed311<br />--- /dev/null<br />+++ b/meta-arm/recipes-security/=
optee/optee-test.inc<br />@@ -0,0 +1,58 @@<br />+SUMMARY =3D "OP-TEE sanity=
 testsuite"<br />+DESCRIPTION =3D "Open Portable Trusted Execution Environm=
ent - Test suite"<br />+HOMEPAGE =3D "https://www.op-tee.org/"<br />+<br />=
+LICENSE =3D "BSD &amp; GPLv2"<br />+LIC_FILES_CHKSUM =3D "file://${S}/LICE=
NSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa"<br />+<br />+inherit python3=
native<br />+require optee.inc<br />+<br />+DEPENDS =3D "optee-client optee=
-os python3-pycryptodomex-native"<br />+<br />+SRC_URI =3D "git://github.co=
m/OP-TEE/optee_test.git \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; file://0001-host-xtest-Adjust-order-of-including-compiler=
.h.patch \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \ <br />+&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0003-make-remo=
ve-Wmissing-noreturn-for-clang.patch \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; "<br />+<br />+S =3D "${WORKDIR}/git"<br />+B =3D =
"${WORKDIR}/build"<br />+<br />+OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST=
}${prefix}"<br />+TEEC_EXPORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D "${STAGING_DIR_HOST}${prefix}"<br />+TA_DEV_KIT_DIR&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; =3D "${STAGING_INCDIR}/optee/export-user_ta"<br />+OPTEE_COMP=
ILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />+<br />+EXTRA_OEMAKE =3D=
 " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_C=
LIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EX=
PORT=3D${TEEC_EXPORT} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D=
--sysroot=3D${STAGING_DIR_HOST} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER=3D${=
OPTEE_COMPILER} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CROSS_COMPILE_HOST=3D${TARGET=
_PREFIX} \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CROSS_COMPILE_TA=3D${TARGET_PREFIX} =
\<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O=3D${B} =
\<br />+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; "<br />+<br />+do_compile() {<br />+&nbsp;&nbsp;&nbsp; cd=
 ${S}<br />+&nbsp;&nbsp;&nbsp; # Top level makefile doesn't seem to handle =
parallel make gracefully<br />+&nbsp;&nbsp;&nbsp; oe_runmake xtest<br />+&n=
bsp;&nbsp;&nbsp; oe_runmake ta<br />+}<br />+do_compile[cleandirs] =3D "${B=
}"<br />+<br />+do_install () {<br />+&nbsp;&nbsp;&nbsp; install -D -p -m07=
55 ${B}/xtest/xtest ${D}${bindir}/xtest<br />+<br />+&nbsp;&nbsp;&nbsp; # i=
nstall path should match the value set in optee-client/tee-supplicant<br />=
+&nbsp;&nbsp;&nbsp; # default TEEC_LOAD_PATH is /lib<br />+&nbsp;&nbsp;&nbs=
p; mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/<br />+&nbsp;&nbsp;&nbsp=
; install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armt=
z/<br />+}<br />+<br />+FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armt=
z/"<br />+<br />+# Imports machine specific configs from staging to build<b=
r />+PACKAGE_ARCH =3D "${MACHINE_ARCH}"<br />diff --git a/meta-arm/recipes-=
security/optee/optee-test_3.10.0.bb b/meta-arm/recipes-security/optee/optee=
-test_3.10.0.bb<br />index 6541de4..396f7cb 100644<br />--- a/meta-arm/reci=
pes-security/optee/optee-test_3.10.0.bb<br />+++ b/meta-arm/recipes-securit=
y/optee/optee-test_3.10.0.bb<br />@@ -1,59 +1,3 @@<br />-SUMMARY =3D "OP-TE=
E sanity testsuite"<br />-DESCRIPTION =3D "Open Portable Trusted Execution =
Environment - Test suite"<br />-HOMEPAGE =3D "https://www.op-tee.org/"<br /=
>-<br />-LICENSE =3D "BSD &amp; GPLv2"<br />-LIC_FILES_CHKSUM =3D "file://$=
{S}/LICENSE.md;md5=3Ddaa2bcccc666345ab8940aab1315a4fa"<br />-<br />-inherit=
 python3native<br />-require optee.inc<br />-<br />-DEPENDS =3D "optee-clie=
nt optee-os python3-pycryptodomex-native"<br />+require optee-test.inc<br /=
>&nbsp;<br />&nbsp;SRCREV =3D "30efcbeaf8864d0f2a5c4be593a5411001fab31b"<br=
 />-SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \<br />-&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001-host-xtest-Ad=
just-order-of-including-compiler.h.patch \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0002-make-remove-Wno-unsafe-loop-=
for-clang.patch \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; file://0003-make-remove-Wmissing-noreturn-for-clang.patch \<br />=
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />-<br />-S =
=3D "${WORKDIR}/git"<br />-B =3D "${WORKDIR}/build"<br />-<br />-OPTEE_CLI=
ENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"<br />-TEEC_EXPORT&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "${STAGING_DIR_HOST}${prefix}"<br =
/>-TA_DEV_KIT_DIR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "${STAGING_INCDIR}/opte=
e/export-user_ta"<br />-OPTEE_COMPILER =3D "${@d.getVar('TOOLCHAIN') or 'gc=
c'}"<br />-<br />-EXTRA_OEMAKE =3D " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<b=
r />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_CLIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<b=
r />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EXPORT=3D${TEEC_EXPORT} \<br />-&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; CROSS_COMPILE_HOST=3D${TARGET_PREFIX} \<br />-&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; CROSS_COMPILE_TA=3D${TARGET_PREFIX} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPI=
LER=3D${OPTEE_COMPILER} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=
=3D--sysroot=3D${STAGING_DIR_HOST} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<b=
r />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; O=3D${B} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "<br />-<br />-do_com=
pile() {<br />-&nbsp;&nbsp;&nbsp; cd ${S}<br />-&nbsp;&nbsp;&nbsp; # Top le=
vel makefile doesn't seem to handle parallel make gracefully<br />-&nbsp;&n=
bsp;&nbsp; oe_runmake xtest<br />-&nbsp;&nbsp;&nbsp; oe_runmake ta<br />-}<=
br />-do_compile[cleandirs] =3D "${B}"<br />-<br />-do_install () {<br />-&=
nbsp;&nbsp;&nbsp; install -D -p -m0755 ${B}/xtest/xtest ${D}${bindir}/xtest=
<br />-<br />-&nbsp;&nbsp;&nbsp; # install path should match the value set =
in optee-client/tee-supplicant<br />-&nbsp;&nbsp;&nbsp; # default TEEC_LOAD=
_PATH is /lib<br />-&nbsp;&nbsp;&nbsp; mkdir -p ${D}${nonarch_base_libdir}/=
optee_armtz/<br />-&nbsp;&nbsp;&nbsp; install -D -p -m0444 ${B}/ta/*/*.ta $=
{D}${nonarch_base_libdir}/optee_armtz/<br />-}<br />-<br />-FILES_${PN} +=
=3D "${nonarch_base_libdir}/optee_armtz/"<br />-<br />-# Imports machine s=
pecific configs from staging to build<br />-PACKAGE_ARCH =3D "${MACHINE_ARC=
H}"<br />diff --git a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb b=
/meta-arm/recipes-security/optee/optee-test_3.8.0.bb<br />index 7f3d49b..8e=
a3348 100644<br />--- a/meta-arm/recipes-security/optee/optee-test_3.8.0.bb=
<br />+++ b/meta-arm/recipes-security/optee/optee-test_3.8.0.bb<br />@@ -1,=
59 +1,3 @@<br />-SUMMARY =3D "OP-TEE sanity testsuite"<br />-DESCRIPTION =
=3D "Open Portable Trusted Execution Environment - Test suite"<br />-HOMEP=
AGE =3D "https://www.op-tee.org/"<br />-<br />-LICENSE =3D "BSD &amp; GPLv2=
"<br />-LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Ddaa2bcccc666345a=
b8940aab1315a4fa"<br />-<br />-inherit python3native<br />-require optee.in=
c<br />-<br />-DEPENDS =3D "optee-client optee-os python3-pycryptodomex-nat=
ive"<br />+require optee-test.inc<br />&nbsp;<br />&nbsp;SRCREV =3D "30481e=
381cb4285706e7516853495a7699c93b2c"<br />-SRC_URI =3D "git://github.com/OP-=
TEE/optee_test.git \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; file://0001-host-xtest-Adjust-order-of-including-compiler.h.pa=
tch \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi=
le://0002-make-remove-Wno-unsafe-loop-for-clang.patch&nbsp; \<br />-&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0003-make-remo=
ve-Wmissing-noreturn-for-clang.patch \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; "<br />-<br />-S =3D "${WORKDIR}/git"<br />-B =3D =
"${WORKDIR}/build"<br />-<br />-OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST=
}${prefix}"<br />-TEEC_EXPORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D "${STAGING_DIR_HOST}${prefix}"<br />-TA_DEV_KIT_DIR&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; =3D "${STAGING_INCDIR}/optee/export-user_ta"<br />-OPTEE_COMP=
ILER =3D "${@d.getVar('TOOLCHAIN') or 'gcc'}"<br />-<br />-EXTRA_OEMAKE =3D=
 " TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTEE_C=
LIENT_EXPORT=3D${OPTEE_CLIENT_EXPORT} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEEC_EX=
PORT=3D${TEEC_EXPORT} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CROSS_COMPILE_HOST=3D${=
TARGET_PREFIX} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CROSS_COMPILE_TA=3D${TARGET_PR=
EFIX} \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER=3D${OPTEE_COMPILER} \<br />-&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; LIBGCC_LOCATE_CFLAGS=3D--sysroot=3D${STAGING_DIR_HOST} =
\<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=3D1 \<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O=3D${B} =
\<br />-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; "<br />-<br />-do_compile() {<br />-&nbsp;&nbsp;&nbsp; cd=
 ${S}<br />-&nbsp;&nbsp;&nbsp; # Top level makefile doesn't seem to handle =
parallel make gracefully<br />-&nbsp;&nbsp;&nbsp; oe_runmake xtest<br />-&n=
bsp;&nbsp;&nbsp; oe_runmake ta<br />-}<br />-do_compile[cleandirs] =3D "${B=
}"<br />-<br />-do_install () {<br />-&nbsp;&nbsp;&nbsp; install -D -p -m07=
55 ${B}/xtest/xtest ${D}${bindir}/xtest<br />-<br />-&nbsp;&nbsp;&nbsp; # i=
nstall path should match the value set in optee-client/tee-supplicant<br />=
-&nbsp;&nbsp;&nbsp; # default TEEC_LOAD_PATH is /lib<br />-&nbsp;&nbsp;&nbs=
p; mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/<br />-&nbsp;&nbsp;&nbsp=
; install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_libdir}/optee_armt=
z/<br />-}<br />-<br />-FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armt=
z/"<br />-<br />-# Imports machine specific configs from staging to build<b=
r />-PACKAGE_ARCH =3D "${MACHINE_ARCH}"<br />-- <br />2.17.1

--VBg66YQIGqSnuZvO2wfb--
