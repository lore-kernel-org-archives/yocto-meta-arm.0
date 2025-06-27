Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9D6C83000
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:51:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1926.1751053885745089462
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 12:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 058BD1A00;
	Fri, 27 Jun 2025 12:51:08 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D9B4B3F66E;
	Fri, 27 Jun 2025 12:51:24 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Marcin Juszkiewicz <marcin-oe@juszkiewicz.com.pl>
Subject: [PATCH 2/2] arm: WORKDIR fixes
Date: Fri, 27 Jun 2025 15:51:23 -0400
Message-Id: <20250627195123.14524-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250627195123.14524-1-jon.mason@arm.com>
References: <20250627195123.14524-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jun 2025 19:51:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6592

Upstream has removed the need for setting S to WORKDIR, and is throwing
an error if still doing so.  Make the necessary changes.

From the upstream commit, much of the changes where made via:
  sed -i "/^S =3D \"\${WORKDIR}\/git\"/d" `find . -name *.bb -o -name *.i=
nc -o -name *.bbclass`
  sed -i "s/^S =3D \"\${WORKDIR}\//S =3D \"\${UNPACKDIR}\//g" `find . -na=
me *.bb -o -name *.inc -o -name *.bbclass`

Suggested-by: Marcin Juszkiewicz <marcin-oe@juszkiewicz.com.pl>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-system/external-system_0.1.0.bb  |  1 -
 .../trusted-firmware-a-fvp-base.inc           |  2 +-
 .../uefi/edk2-basetools-native_202408.bb      |  4 +-
 .../corstone1000-external-sys-tests_1.0.bb    |  2 -
 .../arm-systemready-ir-acs.bb                 |  2 +-
 .../arm-systemready-scripts-native.bb         |  1 -
 .../edk2-test-parser-native.bb                |  1 -
 .../arm-systemready-linux-distros.inc         |  2 +-
 .../gcc-aarch64-none-elf_13.3.rel1.bb         |  2 +-
 .../gcc-arm-none-eabi_13.3.rel1.bb            |  2 +-
 .../boot-wrapper-aarch64_git.bb               |  2 -
 .../recipes-bsp/hafnium/hafnium_2.12.0.bb     |  2 -
 .../scp-firmware/scp-firmware_2.16.0.bb       |  1 -
 .../trusted-firmware-a/cot-dt2c_0.1.0.bb      |  2 -
 .../trusted-firmware-a/tf-a-tests_2.10.15.bb  |  1 -
 .../trusted-firmware-a/tf-a-tests_2.12.3.bb   |  1 -
 .../trusted-firmware-a/tf-a-tests_2.13.0.bb   |  1 -
 .../trusted-firmware-a/trusted-firmware-a.inc |  1 -
 .../trusted-firmware-a_2.10.17.bb             |  2 +-
 .../trusted-firmware-a_2.12.3.bb              |  2 +-
 .../trusted-firmware-a_2.13.0.bb              |  2 +-
 .../trusted-firmware-a_git.bb                 |  2 +-
 .../trusted-firmware-m-2.1.1-src.inc          | 18 ++++----
 .../trusted-firmware-m-2.2.0-src.inc          | 20 ++++-----
 .../trusted-firmware-m-git-src.inc            | 20 ++++-----
 .../trusted-firmware-rmm_0.6.0.bb             |  2 -
 .../uefi/edk2-basetools-native_202502.bb      |  2 -
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc   |  2 +-
 .../gator-daemon/gator-daemon_7.8.0.bb        |  2 +-
 meta-arm/recipes-devtools/gn/gn_git.bb        |  1 -
 .../recipes-devtools/opencsd/opencsd_1.5.6.bb |  2 -
 .../arm-ffa-user/arm-ffa-user_5.0.2.bb        |  3 +-
 .../optee-ftpm/optee-ftpm_git.bb              |  2 -
 .../recipes-security/optee/optee-client.inc   |  2 -
 .../recipes-security/optee/optee-examples.inc |  2 -
 meta-arm/recipes-security/optee/optee-os.inc  |  1 -
 .../recipes-security/optee/optee-test.inc     |  1 -
 .../trusted-services/trusted-services-src.inc | 41 +++++++++----------
 .../trusted-services/trusted-services.inc     |  3 ++
 .../ts-psa-api-test-common_git.inc            |  6 +--
 .../ts-psa-iat-api-test_git.bb                |  2 +-
 .../trusted-services/ts-sp-fwu_git.bb         |  6 +--
 meta-arm/recipes-test/pacbti/test-pacbti.bb   |  3 +-
 43 files changed, 73 insertions(+), 106 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index 1f2d02dfcf8d..d297c9d04703 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -19,7 +19,6 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 # PRODUCT is passed to the Makefile to specify the platform to be used.
 PRODUCT =3D "corstone-1000"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 # remove once arm-none-eabi-gcc updates to 13 or newer like poky
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-base.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a-fvp-base.inc
index 32e9dd7d9511..b93dc72a9c68 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
base.inc
@@ -7,7 +7,7 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:${THISDIR}/files/fvp-bas=
e:"
=20
 SRC_URI:append =3D " \
-    file://optee_spmc_maifest.dts;subdir=3Dgit/plat/arm/board/fvp/fdts \
+    file://optee_spmc_maifest.dts;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/=
plat/arm/board/fvp/fdts \
 "
=20
 # OP-TEE SPMC related configuration
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-basetools-native_202408.b=
b b/meta-arm-bsp/recipes-bsp/uefi/edk2-basetools-native_202408.bb
index d89a79015a83..0c08fce758d7 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-basetools-native_202408.bb
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-basetools-native_202408.bb
@@ -14,13 +14,11 @@ SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
-S =3D "${WORKDIR}/git"
-
 inherit native
=20
 RDEPENDS:${PN} +=3D "python3-core"
=20
 do_install () {
     mkdir -p ${D}${bindir}/edk2-BaseTools
-    cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk2-BaseTools/
+    cp -r ${S}/BaseTools/* ${D}${bindir}/edk2-BaseTools/
 }
diff --git a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/co=
rstone1000-external-sys-tests_1.0.bb b/meta-arm-bsp/recipes-test/corstone=
1000-external-sys-tests/corstone1000-external-sys-tests_1.0.bb
index 0fa01b58b97b..01bcdf871c8d 100644
--- a/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_1.0.bb
+++ b/meta-arm-bsp/recipes-test/corstone1000-external-sys-tests/corstone1=
000-external-sys-tests_1.0.bb
@@ -10,8 +10,6 @@ PV .=3D "+git"
=20
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
-S =3D "${WORKDIR}/git"
-
 do_compile() {
     ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/systems-comms-tes=
ts
 }
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
index 3558d4a08e86..7d6fd6ae718f 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
@@ -58,6 +58,6 @@ SRC_URI[acs-img.sha256sum] =3D "ea52f84dab44bde97de3e2d=
2224d883acaae35724dd8e2bdfb
 # Revision pointing to v2023.04 tag
 SRCREV_sr-ir-template =3D "c714db178ddf72e5ae5017f15421095297d5bf0e"
=20
-S =3D "${WORKDIR}/sources-unpack"
+S =3D "${UNPACKDIR}"
=20
 inherit arm-systemready-acs
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-scripts-native.bb b/meta-arm-systemready/recipes-test/arm-syste=
mready-acs/arm-systemready-scripts-native.bb
index ccc87ed24fb3..42f2508f4cce 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts-native.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-scripts-native.bb
@@ -12,7 +12,6 @@ python3-chardet-native python3-requests-native python3-=
construct-native \
 dtc-native python3-dtschema-wrapper-native"
=20
 PV =3D "v2023.04"
-S =3D "${WORKDIR}/git"
 SRC_URI =3D "\
         git://git.gitlab.arm.com/systemready/systemready-scripts.git;pro=
tocol=3Dhttps;nobranch=3D1 \
         file://0001-check-sr-results-Return-non-zero-exit-code-on-failur=
.patch \
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/edk2-t=
est-parser-native.bb b/meta-arm-systemready/recipes-test/arm-systemready-=
acs/edk2-test-parser-native.bb
index ad93c41e7bcb..ea7c070c26e6 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/edk2-test-par=
ser-native.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/edk2-test-par=
ser-native.bb
@@ -11,7 +11,6 @@ RDEPENDS:${PN} =3D "python3-packaging-native python3-py=
yaml-native \
                   python3-jsonschema-native"
=20
 PV =3D "v2023.04"
-S =3D "${WORKDIR}/git"
 SRC_URI =3D "git://git.gitlab.arm.com/systemready/edk2-test-parser.git;p=
rotocol=3Dhttps;nobranch=3D1"
=20
 # The SRCREV is at the v2023.04 tag
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros.inc b/meta-arm-systemready/recipes-test=
/arm-systemready-linux-distros/arm-systemready-linux-distros.inc
index 5e8a18e2f1ec..74aa937e2f6e 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros.inc
@@ -27,7 +27,7 @@ ARM_SYSTEMREADY_LINUX_DISTRO_ISO_IMAGE =3D \
 # Size of installation disk in MB
 ARM_SYSTEMREADY_LINUX_DISTRO_INSTALL_SIZE ?=3D "4096"
=20
-S =3D "${WORKDIR}/sources-unpack"
+S =3D "${UNPACKDIR}"
=20
 do_image() {
     dd if=3D/dev/zero of=3D${WORKDIR}/${IMAGE_LINK_NAME}.wic \
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_13.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_13.3.rel1.bb
index edb4ff6fcfac..dde7ddeb7adc 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.3.rel1.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "https://developer.arm.com/-/media/Files/do=
wnloads/gnu/${PV}/binrel/ar
 SRC_URI[gcc-aarch64.sha256sum] =3D "fad7d567be5c095943d42f7078ea6f9a8452=
062dfe151152c2ec825814d254e0"
 SRC_URI[gcc-x86_64.sha256sum] =3D "7fedf894040580b1db747d06ac5d4263c46e5=
91ffe7695656d1da5accb00a159"
=20
-S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
+S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
 UPSTREAM_CHECK_URI =3D "https://developer.arm.com/downloads/-/arm-gnu-to=
olchain-downloads"
 UPSTREAM_CHECK_REGEX =3D "arm-gnu-toolchain-(?P<pver>\d+\.\d*\.[A-z]*\d*=
).*-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_13.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_13.3.rel1.bb
index 185ecfed4a29..7660509b2fde 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.3.rel1.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "https://developer.arm.com/-/media/Files/do=
wnloads/gnu/${PV}/binrel/ar
 SRC_URI[gcc-aarch64.sha256sum] =3D "c8824bffd057afce2259f7618254e840715f=
33523a3d4e4294f471208f976764"
 SRC_URI[gcc-x86_64.sha256sum] =3D "95c011cee430e64dd6087c75c800f04b9c498=
32cc1000127a92a97f9c8d83af4"
=20
-S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
+S =3D "${UNPACKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
 UPSTREAM_CHECK_URI =3D "https://developer.arm.com/downloads/-/arm-gnu-to=
olchain-downloads"
 UPSTREAM_CHECK_REGEX =3D "arm-gnu-toolchain-(?P<pver>\d+\.\d*\.[A-z]*\d*=
).*-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index 8a37dd9e9492..ce31bff43aa4 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -11,8 +11,6 @@ UPSTREAM_CHECK_COMMITS =3D "1"
=20
 PV =3D "0+git"
=20
-S =3D "${WORKDIR}/git"
-
 inherit autotools deploy
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.12.0.bb
index 86034de6ab4a..d4bf501fbe4f 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.12.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad52=
94672c500501edc103"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-
 CLANGNATIVE =3D ""
 CLANGNATIVE:runtime-llvm =3D "clang-native"
=20
@@ -18,7 +17,6 @@ SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/ha=
fnium.git;protocol=3Dhttps;br
            file://0001-Use-pkg-config-native-to-find-the-libssl-headers.=
patch;patchdir=3Dthird_party/linux \
           "
 SRCREV =3D "2cf2ca7c4b81ab18e9cd363d9a5c8288e2a94fda"
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
index 66cf4e44962f..d41a9892109f 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
@@ -34,7 +34,6 @@ TOOLCHAIN =3D "gcc"
 inherit deploy
=20
 B =3D "${WORKDIR}/build"
-S =3D "${WORKDIR}/git"
=20
 # Allow platform specific copying of only scp or both scp & mcp, default=
 to both
 FW_TARGETS ?=3D "scp mcp"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb b/=
meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
index 8f64b8a66b8a..ce021527b7fe 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/cot-dt2c_0.1.0.bb
@@ -14,8 +14,6 @@ inherit python_poetry_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-S =3D "${UNPACKDIR}/git"
-
 # Dependencies of plotly and igraph are not needed for the standard case
 RDEPENDS:${PN} +=3D "python3-click \
                    python3-pydevicetree \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.b=
b b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
index 5b2899600bfb..e2e46aa038c1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.15.bb
@@ -25,7 +25,6 @@ TFA_PLATFORM ?=3D "invalid"
 EXTRA_OEMAKE +=3D "ARCH=3Daarch64"
 EXTRA_OEMAKE +=3D "LOG_LEVEL=3D50"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 # Add platform parameter
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
index 84984fe76883..32baefa4cacc 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.3.bb
@@ -27,7 +27,6 @@ TFA_PLATFORM ?=3D "invalid"
 EXTRA_OEMAKE +=3D "ARCH=3Daarch64"
 EXTRA_OEMAKE +=3D "LOG_LEVEL=3D50"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 # Add platform parameter
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
index 14a9043a5914..08da7cbabb47 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.13.0.bb
@@ -25,7 +25,6 @@ TFA_PLATFORM ?=3D "invalid"
 EXTRA_OEMAKE +=3D "ARCH=3Daarch64"
 EXTRA_OEMAKE +=3D "LOG_LEVEL=3D50"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 # Add platform parameter
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index c168cdea4058..4ebcd3c73f0d 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -39,7 +39,6 @@ TFA_ARM_SPMC_MANIFEST_DTS ?=3D ""
 # Build for debug (set TFA_DEBUG to 1 to activate)
 TFA_DEBUG ?=3D "0"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 # mbed TLS support (set TFA_MBEDTLS to 1 to activate)
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.10.17.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.=
10.17.bb
index e7dd90a5fec5..ca887e0e80ae 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.17.=
bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.17.=
bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3Db2c7=
40efedc159745b9b31f88ff03dd
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.12.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
2.3.bb
index d7f83fe716c4..970773265d5c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.3.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.3.b=
b
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7=
626b8c7a37263c6a58af8d19bee
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.13.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
3.0.bb
index 40d7e319c860..5c99446ee57b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.13.0.b=
b
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118=
e32884721c0be33267bd7ae1113
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_g=
it.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
index d168457938a8..6383fefa9c0f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D1118=
e32884721c0be33267bd7ae1113
 # in TF-A src, docs/getting_started/prerequisites.rst lists the expected=
 version mbedtls
 # mbedtls-3.6.3
 SRCBRANCH_MBEDTLS =3D "mbedtls-3.6"
-SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3Dgit/mbedtls;branch=3D${SRCBRANCH_MBEDTLS}"
+SRC_URI_MBEDTLS =3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls=
;protocol=3Dhttps;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/mbedtls;branc=
h=3D${SRCBRANCH_MBEDTLS}"
 SRCREV_mbedtls =3D "22098d41c6620ce07cf8a0134d37302355e1e5ef"
=20
 LIC_FILES_CHKSUM_MBEDTLS =3D "file://mbedtls/LICENSE;md5=3D379d5819937a6=
c2f1ef1630d341e026d"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.1-src.inc
index 6b483995f82d..1e47589df8a1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
@@ -16,14 +16,14 @@ SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "gitsm://gith=
ub.com/ARMmbed/mbedtls.git;pr
 SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dgit/cmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dgit/tfm-psa-adac \
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
@@ -54,4 +54,4 @@ SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf1=
f97deef625"
=20
 SRCREV_FORMAT =3D "tfm"
=20
-S =3D "${WORKDIR}/git/tfm"
+S =3D "${UNPACKDIR}/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.0-src.inc
index b475b7a3baf8..c201525382b8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.0-sr=
c.inc
@@ -21,15 +21,15 @@ SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github=
.com/mcu-tools/mcuboot.git;pr
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dgit/cmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dgit/tfm-psa-adac \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dgit/t_cose \
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
@@ -63,4 +63,4 @@ SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af9311=
cf1d"
=20
 SRCREV_FORMAT =3D "tfm"
=20
-S =3D "${WORKDIR}/git/tfm"
+S =3D "${UNPACKDIR}/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
index 9a7f23ff556d..b4e24c9ee580 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -21,15 +21,15 @@ SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github=
.com/mcu-tools/mcuboot.git;pr
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dgit/tfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dgit/cmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dgit/tfm-psa-adac \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dgit/t_cose \
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
@@ -63,4 +63,4 @@ SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af9311=
cf1d"
=20
 SRCREV_FORMAT =3D "tfm"
=20
-S =3D "${WORKDIR}/git/tfm"
+S =3D "${UNPACKDIR}/tfm"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-r=
mm_0.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-=
rmm_0.6.0.bb
index 96b1bd058e02..60558b6bca6b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
@@ -16,8 +16,6 @@ RMM_CONFIG:qemuarm64 =3D "qemu_virt_defcfg"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE =3D "qemuarm64"
=20
-S =3D "${WORKDIR}/git"
-
 # Build for debug (set RMM_DEBUG to 1 to activate)
 RMM_DEBUG ?=3D "0"
 RMM_BUILD_MODE ?=3D "${@bb.utils.contains('RMM_DEBUG', '1', 'Debug', 'Re=
lease', d)}"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb b/=
meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
index d89a79015a83..e9e48217984b 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-basetools-native_202502.bb
@@ -14,8 +14,6 @@ SRCREV =3D "b158dad150bf02879668f72ce306445250838201"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^edk2-stable(?P<pver>\d+)$"
=20
-S =3D "${WORKDIR}/git"
-
 inherit native
=20
 RDEPENDS:${PN} +=3D "python3-core"
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 92f080bfa8d0..a1840b16ec7d 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -57,7 +57,7 @@ DEPENDS +=3D "util-linux-native iasl-native"
=20
 inherit deploy
=20
-S =3D "${WORKDIR}/edk2"
+S =3D "${UNPACKDIR}/edk2"
 B =3D "${WORKDIR}/build"
=20
 LDFLAGS[unexport] =3D "1"
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb=
 b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
index 6188b07e84f1..ffd308fa95c2 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "git://github.com/ARM-software/gator.git;pr=
otocol=3Dhttp;branch=3Dmain;pro
            file://0001-Include-missing-cstdint.patch;striplevel=3D2 \
           "
=20
-S =3D "${WORKDIR}/git/daemon"
+S =3D "${UNPACKDIR}/${BP}/daemon"
=20
 COMPATIBLE_HOST =3D "aarch64.*-linux"
=20
diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index cc25b73f77e6..d4294bd36aa1 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -10,7 +10,6 @@ SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dht=
tps;branch=3Dmain"
 SRCREV =3D "ab638bd7cbb9ac8468bf2fbe60c74ed4706a14a7"
 PV =3D "0+git"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 # Map from our _OS strings to the GN's platform values.
diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.6.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.5.6.bb
index 8deafd323ae5..7b0cfded9037 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.6.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.5.6.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d=
2fa2530b985a43f3e5"
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
 SRCREV =3D "1900c6fd110275305b956aa47bd9f0c76b13a134"
=20
-S =3D "${WORKDIR}/git"
-
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
 EXTRA_OEMAKE =3D "ARCH=3D'${TARGET_ARCH}' \
diff --git a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.2.bb b=
/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.2.bb
index 741a410ba614..fdb23a5c7f3a 100644
--- a/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.2.bb
+++ b/meta-arm/recipes-kernel/arm-ffa-user/arm-ffa-user_5.0.2.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D05e355bbd61750=
7216a836c56cf24983"
 inherit module
=20
 SRC_URI =3D "git://gitlab.arm.com/linux-arm/linux-trusted-services;proto=
col=3Dhttps;branch=3Ddebugfs \
-           file://Makefile;subdir=3Dgit \
+           file://Makefile;subdir=3D${S} \
           "
-S =3D "${WORKDIR}/git"
=20
 # Tag debugfs-v5.0.2
 SRCREV =3D "885af0d1c3bf11aba12320d5484429160a9b9f26"
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 1aa46f9ae0d2..3d459d6f905e 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -26,8 +26,6 @@ SRCREV =3D "e9fc7b89d865536c46deb63f9c7d0121a3ded49c"
=20
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-S =3D "${WORKDIR}/git"
-
 OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
 TEEC_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
 TA_DEV_KIT_DIR =3D "${STAGING_INCDIR}/optee/export-user_ta"
diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index f965024992c2..0c3aefbb6c36 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -14,8 +14,6 @@ SRC_URI =3D " \
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
=20
-S =3D "${WORKDIR}/git"
-
 EXTRA_OECMAKE =3D " \
     -DBUILD_SHARED_LIBS=3DON \
     -DCFG_USE_PKGCONFIG=3DON \
diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-ar=
m/recipes-security/optee/optee-examples.inc
index 5011f4804523..648e8c2e9539 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -20,10 +20,8 @@ EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} =
\
                  OUTPUT_DIR=3D${B} \
                "
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
-
 do_compile() {
     oe_runmake -C ${S}
 }
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 7f515cb41d43..cf50dabed332 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -16,7 +16,6 @@ DEPENDS:append:toolchain-clang =3D " compiler-rt"
=20
 SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branch=3Dmaster;protoc=
ol=3Dhttps"
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 EXTRA_OEMAKE +=3D " \
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 5f35ad9e1feb..6f81f0de6db3 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -14,7 +14,6 @@ SRC_URI =3D "git://github.com/OP-TEE/optee_test.git;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://run-ptest \
           "
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index c321c1c19179..5a7ab785c28c 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -2,11 +2,10 @@
=20
 LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-services.git;proto=
col=3Dhttps;branch=3Dmain;name=3Dtrusted-services;destsuffix=3Dgit/truste=
d-services \
+SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-services.git;proto=
col=3Dhttps;branch=3Dmain;name=3Dtrusted-services;destsuffix=3Dtrusted-se=
rvices \
 "
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
 SRC_URI:append =3D "\
     file://0001-Allow-configuring-flash-image-files-compile-time.patch \
     file://0002-Fix-MbedTLS-3.6-and-GCC-14-compatibility.patch \
@@ -17,37 +16,37 @@ SRC_URI:append =3D "\
 SRCREV_trusted-services =3D "83bd53b6689ebb071bc13fcd4e01618bab2e74ca"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
-S =3D "${WORKDIR}/git/trusted-services"
+S =3D "${UNPACKDIR}/trusted-services"
 PV ?=3D "0.0+git"
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
 # DTC, tag "v1.6.1"
-SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;protocol=3Dhttps;b=
ranch=3Dmain;destsuffix=3Dgit/dtc"
+SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc;protocol=3Dhttps;b=
ranch=3Dmain;destsuffix=3Ddtc"
 SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
 LIC_FILES_CHKSUM +=3D "file://../dtc/README.license;md5=3Da1eb22e37f09df=
5b5511b8a278992d0e"
=20
 # MbedTLS, tag "v3.6.0"
-SRC_URI +=3D "gitsm://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;prot=
ocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/mbedtls"
+SRC_URI +=3D "gitsm://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;prot=
ocol=3Dhttps;branch=3Dmaster;destsuffix=3Dmbedtls"
 SRCREV_mbedtls =3D "2ca6c285a0dd3f33982dd57299012dacab1ff206"
 LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1=
ef1630d341e026d"
=20
 # Nanopb, tag "nanopb-0.4.8" plus some further fixes
-SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=3D=
https;branch=3Dmaster;destsuffix=3Dgit/nanopb"
+SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=3D=
https;branch=3Dmaster;destsuffix=3Dnanopb"
 SRCREV_nanopb =3D "6cfe48d6f1593f8fa5c0f90437f5e6522587745e"
 LIC_FILES_CHKSUM +=3D "file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a399=
4384112efcdb37c01f"
=20
 # qcbor, tag "v1.0.0"
-SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.git;name=3Dqcbor;=
protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/qcbor"
+SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.git;name=3Dqcbor;=
protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dqcbor"
 SRCREV_qcbor =3D "56b17bf9f74096774944bcac0829adcd887d391e"
 LIC_FILES_CHKSUM +=3D "file://../qcbor/README.md;md5=3De8ff2e88a722cdc55=
eddd0bb9aeca002"
=20
 # T_Cose
-SRC_URI +=3D "git://github.com/laurencelundblade/t_cose.git;name=3Dtcose=
;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/tcose"
+SRC_URI +=3D "git://github.com/laurencelundblade/t_cose.git;name=3Dtcose=
;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dtcose"
 SRCREV_tcose =3D "fc3a4b2c7196ff582e8242de8bd4a1bc4eec577f"
 LIC_FILES_CHKSUM +=3D "file://../tcose/LICENSE;md5=3Db2ebdbfb82602b97aa6=
28f64cf4b65ad"
=20
 # CppUTest,  tag "v3.8"
-SRC_URI +=3D "git://github.com/cpputest/cpputest.git;name=3Dcpputest;pro=
tocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/cpputest"
+SRC_URI +=3D "git://github.com/cpputest/cpputest.git;name=3Dcpputest;pro=
tocol=3Dhttps;branch=3Dmaster;destsuffix=3Dcpputest"
 SRCREV_cpputest =3D "e25097614e1c4856036366877a02346c4b36bb5b"
 LIC_FILES_CHKSUM +=3D "file://../cpputest/COPYING;md5=3Dce5d5f1fe02bcd13=
43ced64a06fd4177"
=20
@@ -57,19 +56,19 @@ inherit apply_local_src_patches
 LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
=20
 do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/external/qcbor ${WORKDIR}/git/qcbor
-    apply_local_src_patches ${S}/external/t_cose ${WORKDIR}/git/tcose
-    apply_local_src_patches ${S}/external/MbedTLS ${WORKDIR}/git/mbedtls
-    apply_local_src_patches ${S}/external/CppUTest ${WORKDIR}/git/cppute=
st
-    apply_local_src_patches ${S}/external/libfdt ${WORKDIR}/git/dtc
-    apply_local_src_patches ${S}/external/nanopb ${WORKDIR}/git/nanopb
+    apply_local_src_patches ${S}/external/qcbor ${WORKDIR}/sources/qcbor
+    apply_local_src_patches ${S}/external/t_cose ${WORKDIR}/sources/tcos=
e
+    apply_local_src_patches ${S}/external/MbedTLS ${WORKDIR}/sources/mbe=
dtls
+    apply_local_src_patches ${S}/external/CppUTest ${WORKDIR}/sources/cp=
putest
+    apply_local_src_patches ${S}/external/libfdt ${WORKDIR}/sources/dtc
+    apply_local_src_patches ${S}/external/nanopb ${WORKDIR}/sources/nano=
pb
 }
=20
 # Paths to dependencies required by some TS SPs/tools
-EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${WORKDIR}/git/dtc \
-                  -DCPPUTEST_SOURCE_DIR=3D${WORKDIR}/git/cpputest \
-                  -DNANOPB_SOURCE_DIR=3D${WORKDIR}/git/nanopb \
-                  -DT_COSE_SOURCE_DIR=3D${WORKDIR}/git/tcose \
-                  -DQCBOR_SOURCE_DIR=3D${WORKDIR}/git/qcbor \
-                  -DMBEDTLS_SOURCE_DIR=3D${WORKDIR}/git/mbedtls \
+EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${WORKDIR}/sources/dtc \
+                  -DCPPUTEST_SOURCE_DIR=3D${WORKDIR}/sources/cpputest \
+                  -DNANOPB_SOURCE_DIR=3D${WORKDIR}/sources/nanopb \
+                  -DT_COSE_SOURCE_DIR=3D${WORKDIR}/sources/tcose \
+                  -DQCBOR_SOURCE_DIR=3D${WORKDIR}/sources/qcbor \
+                  -DMBEDTLS_SOURCE_DIR=3D${WORKDIR}/sources/mbedtls \
                  "
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 2ba64af867cf..2ffc7c90ba10 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -56,3 +56,6 @@ EXTRA_OECMAKE +=3D "${@get_ts_toolchain_option(d)}"
 EXTRA_OECMAKE +=3D "-Dlibts_ROOT=3D${STAGING_DIR_HOST}${TS_INSTALL}/lib/=
cmake/libts/ \
                   -Dlibpsats_ROOT=3D${STAGING_DIR_HOST}${TS_INSTALL}/lib=
/cmake/libpsats/ \
                  "
+
+INSANE_SKIP:${PN} +=3D "buildpaths"
+INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-c=
ommon_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-tes=
t-common_git.inc
index e2f61febd340..aacd09c3858b 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
@@ -9,17 +9,17 @@ DEPENDS        +=3D "python3-jsonschema-native python3-=
jinja2-native"
 DEPENDS        +=3D "libpsats"
 RDEPENDS:${PN} +=3D "libpsats"
=20
-SRC_URI +=3D "git://github.com/ARM-software/psa-arch-tests.git;name=3Dps=
atest;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dgit/psatest \
+SRC_URI +=3D "git://github.com/ARM-software/psa-arch-tests.git;name=3Dps=
atest;protocol=3Dhttps;branch=3Dmain;destsuffix=3Dpsatest \
             file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-nati=
ve.patch;patchdir=3D../psatest \
            "
=20
 SRCREV_psatest =3D "74dc6646ff594e131a726a5305aba77bac30eceb"
 LIC_FILES_CHKSUM +=3D "file://../psatest/LICENSE.md;md5=3D2a944942e1496a=
f1886903d274dedb13"
=20
-EXTRA_OECMAKE +=3D "-DPSA_ARCH_TESTS_SOURCE_DIR=3D${WORKDIR}/git/psatest=
"
+EXTRA_OECMAKE +=3D "-DPSA_ARCH_TESTS_SOURCE_DIR=3D${WORKDIR}/sources/psa=
test"
=20
 do_apply_local_src_patches:append() {
-    apply_local_src_patches ${S}/external/psa_arch_tests ${WORKDIR}/git/=
psatest
+    apply_local_src_patches ${S}/external/psa_arch_tests ${WORKDIR}/sour=
ces/psatest
 }
=20
 FILES:${PN} =3D "${bindir}/${PSA_TEST}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-te=
st_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-tes=
t_git.bb
index c39554a69bb5..7deadc009893 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.=
bb
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.=
bb
@@ -10,7 +10,7 @@ PSA_TEST =3D "psa-iat-api-test"
=20
 # psa-arch-tests for INITIAL_ATTESTATION suite can't be built with pre-b=
uilt qcbor
 # Fetch qcbor sources as a temp work-around and pass PSA_TARGET_QCBOR to=
 psa-arch-tests
-SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.git;name=3Dpsaqcb=
or;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/psaqcbor \
+SRC_URI +=3D "git://github.com/laurencelundblade/QCBOR.git;name=3Dpsaqcb=
or;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dpsaqcbor \
            "
 SRCREV_psaqcbor =3D "42272e466a8472948bf8fca076d113b81b99f0e0"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb =
b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
index 247f3359d80f..0ec85b0cf9cb 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
@@ -14,14 +14,14 @@ TS_SP_FWU_CONFIG ?=3D "default"
 OECMAKE_SOURCEPATH =3D "${S}/deployments/fwu/config/${TS_SP_FWU_CONFIG}-=
${TS_ENV}"
=20
 # The GPT parser component is needed from TF-A
-SRC_URI +=3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;=
name=3Dtfa;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/tf-a"
+SRC_URI +=3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;=
name=3Dtfa;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Dtf-a"
 SRCREV_tfa =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 LIC_FILES_CHKSUM =3D "file://../tf-a/docs/license.rst;md5=3Db2c740efedc1=
59745b9b31f88ff03dde"
 do_apply_local_src_patches:append() {
-    apply_local_src_patches ${S}/external/tf_a ${WORKDIR}/git/tf-a
+    apply_local_src_patches ${S}/external/tf_a ${WORKDIR}/sources/tf-a
 }
=20
-EXTRA_OECMAKE:append =3D "-DTFA_SOURCE_DIR=3D${WORKDIR}/git/tf-a"
+EXTRA_OECMAKE:append =3D "-DTFA_SOURCE_DIR=3D${WORKDIR}/sources/tf-a"
=20
 # Deploy the secure flash image.
 do_deploy() {
diff --git a/meta-arm/recipes-test/pacbti/test-pacbti.bb b/meta-arm/recip=
es-test/pacbti/test-pacbti.bb
index b0ce19887e42..490eddf8d735 100644
--- a/meta-arm/recipes-test/pacbti/test-pacbti.bb
+++ b/meta-arm/recipes-test/pacbti/test-pacbti.bb
@@ -4,8 +4,7 @@ LIC_FILES_CHKSUM =3D "file://pacbti.c;beginline=3D2;endli=
ne=3D2;md5=3D6ec41034e04432ee37
=20
 SRC_URI =3D "file://pacbti.c"
=20
-S =3D "${WORKDIR}/sources"
-UNPACKDIR =3D "${S}"
+S =3D "${UNPACKDIR}/sources"
=20
 do_compile() {
     # Compile with -zforce-bti with fatal warnings, so the link fails if=
 PAC/BTI
--=20
2.39.5 (Apple Git-154)


