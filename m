Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9163.1603209656248198137
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 09:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED7AB1FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 909063F66B
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Oct 2020 09:00:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/6] arm/edk2-firmware: rationalise $S
Date: Tue, 20 Oct 2020 17:00:48 +0100
Message-Id: <20201020160049.473237-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201020160049.473237-1-ross.burton@arm.com>
References: <20201020160049.473237-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently edk2-firmware sets S to WORKDIR/git/ and unpacks edk2 into
WORKDIR/git/edk2. This isn't idiomatic and breaks tooling such as devtool
which expects a git fetcher to unpack a git repository to $S.

Move the edk2 unpack to $S directly, and update the recipe where required=
.

Change-Id: Ib9571032c14a01864860e2eb5a04ed73dd382710
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/uefi/edk2-firmware-n1sdp.inc  |  4 +--
 .../recipes-bsp/uefi/edk2-firmware_git.bb     | 35 ++++++++++---------
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc b/meta=
-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
index 6bd7d79..78463ac 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-n1sdp.inc
@@ -1,6 +1,6 @@
 SRC_URI =3D "\
-    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Dedk2;=
destsuffix=3Dgit/edk2;nobranch=3D1 \
-    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;na=
me=3Dedk2-platforms;destsuffix=3Dgit/edk2/edk2-platforms;nobranch=3D1 \
+    git://git.linaro.org/landing-teams/working/arm/edk2.git;name=3Dedk2;=
destsuffix=3Dedk2;nobranch=3D1 \
+    git://git.linaro.org/landing-teams/working/arm/edk2-platforms.git;na=
me=3Dedk2-platforms;destsuffix=3Dedk2/edk2-platforms;nobranch=3D1 \
 "
=20
 # TAGS and commit ID as per N1SDP-2020.03.26 release
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb b/meta-arm/re=
cipes-bsp/uefi/edk2-firmware_git.bb
index 4012f0e..a0f2fbe 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_git.bb
@@ -7,13 +7,13 @@ LICENSE =3D "BSD-2-Clause-Patent"
 PROVIDES +=3D "virtual/uefi-firmware"
=20
 # EDK2
-LIC_FILES_CHKSUM =3D "file://edk2/License.txt;md5=3D2b415520383f7964e967=
00ae12b4570a"
+LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520383f7964e96700ae1=
2b4570a"
 # EDK2 Platforms
-LIC_FILES_CHKSUM +=3D "file://edk2/edk2-platforms/License.txt;md5=3D2b41=
5520383f7964e96700ae12b4570a"
+LIC_FILES_CHKSUM +=3D "file://edk2-platforms/License.txt;md5=3D2b4155203=
83f7964e96700ae12b4570a"
=20
-SRC_URI ?=3D "\
-    gitsm://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3D${S}/=
edk2;nobranch=3D1 \
-    git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;=
destsuffix=3D${S}/edk2/edk2-platforms;nobranch=3D1 \
+SRC_URI =3D "\
+    gitsm://github.com/tianocore/edk2.git;name=3Dedk2;destsuffix=3Dedk2;=
nobranch=3D1 \
+    git://github.com/tianocore/edk2-platforms.git;name=3Dedk2-platforms;=
destsuffix=3Dedk2/edk2-platforms;nobranch=3D1 \
 "
 SRCREV_edk2           ?=3D "6ff7c838d09224dd4e4c9b5b93152d8db1b19740"
 SRCREV_edk2-platforms ?=3D "ed4cc8059ec551032f0d8b8c172e9ec19214a638"
@@ -31,8 +31,9 @@ DEPENDS +=3D "util-linux-native iasl-native"
=20
 inherit deploy
=20
+S =3D "${WORKDIR}/edk2"
 B =3D "${WORKDIR}/build"
-S =3D "${WORKDIR}/git"
+do_compile[cleandirs] +=3D "${B}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?=3D "invalid"
@@ -44,11 +45,11 @@ do_configure[noexec] =3D "1"
=20
 # Set variables as per envsetup
 export GCC5_AARCH64_PREFIX =3D "${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PRE=
FIX}"
-export PACKAGES_PATH       =3D "${S}/edk2:${S}/edk2/edk2-platforms"
-export WORKSPACE           =3D "${S}/edk2"
-export EDK_TOOLS_PATH      =3D "${WORKSPACE}/BaseTools"
+export PACKAGES_PATH       =3D "${S}:${S}/edk2-platforms"
+export WORKSPACE           =3D "${B}"
+export EDK_TOOLS_PATH      =3D "${S}/BaseTools"
 export PYTHON_COMMAND      =3D "python3"
-export CONF_PATH           =3D "${WORKSPACE}/Conf"
+export CONF_PATH           =3D "${S}/Conf"
=20
 export BTOOLS_PATH =3D "${EDK_TOOLS_PATH}/BinWrappers/PosixLike"
=20
@@ -59,24 +60,24 @@ do_compile() {
     sed -i -e 's: -luuid: -luuid ${BUILD_LDFLAGS}:g' ${EDK_TOOLS_PATH}/S=
ource/C/*/GNUmakefile
=20
     # Copy the templates as we don't run envsetup
-    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${WORKSPACE}/Conf/buil=
d_rule.txt
-    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${WORKSPACE}/Conf/tools=
_def.txt
-    cp ${EDK_TOOLS_PATH}/Conf/target.template ${WORKSPACE}/Conf/target.t=
xt
+    cp ${EDK_TOOLS_PATH}/Conf/build_rule.template ${S}/Conf/build_rule.t=
xt
+    cp ${EDK_TOOLS_PATH}/Conf/tools_def.template ${S}/Conf/tools_def.txt
+    cp ${EDK_TOOLS_PATH}/Conf/target.template ${S}/Conf/target.txt
=20
     # Build basetools
-    oe_runmake -C ${S}/edk2/BaseTools
+    oe_runmake -C ${S}/BaseTools
=20
     PATH=3D"${WORKSPACE}:${BTOOLS_PATH}:$PATH" \
-    "${S}/edk2/BaseTools/BinWrappers/PosixLike/build" \
+    "${S}/BaseTools/BinWrappers/PosixLike/build" \
        -a "${EDK2_ARCH}" \
        -b ${EDK2_BUILD_MODE} \
        -t ${GCC_VER} \
-       -p "${S}/edk2/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
+       -p "${S}/edk2-platforms/Platform/ARM/${EDK2_PLATFORM_DSC}"
 }
=20
 do_install() {
     install -d ${D}/firmware
-    install "${S}/edk2/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_V=
ER}/FV/${EDK2_BIN_NAME}" "${D}/firmware/uefi.bin"
+    install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${GCC_VER}/FV=
/${EDK2_BIN_NAME} ${D}/firmware/uefi.bin
 }
=20
 FILES_${PN} =3D "/firmware"
--=20
2.25.1

