Received: from foss.arm.com (foss.arm.com [])
 by mx.groups.io with SMTP id smtpd.web10.2086.1608312872725825441
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Dec 2020 09:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: arm.com, ip: <nil>, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E3BF30E
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:33 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 017AE3F66B
	for <meta-arm@lists.yoctoproject.org>; Fri, 18 Dec 2020 09:34:32 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/7] arm/trusted-firmware-m: upgrade to 1.1
Date: Fri, 18 Dec 2020 17:34:27 +0000
Message-Id: <20201218173427.1225026-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173427.1225026-1-ross.burton@arm.com>
References: <20201218173427.1225026-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change-Id: Id0c37b291b32072ebe61abcd908ed9a2ebf79365
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/files/objcopy.patch    | 20 +++++++++
 ...are-m_1.0.bb =3D> trusted-firmware-m_1.1.bb} | 42 +++++++++----------
 2 files changed, 41 insertions(+), 21 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy=
.patch
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_1.0.b=
b =3D> trusted-firmware-m_1.1.bb} (74%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy.patch =
b/meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy.patch
new file mode 100644
index 0000000..5734c13
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/files/objcopy.patch
@@ -0,0 +1,20 @@
+The BFD target elf32-little has no specified machine, which trips the
+architecture sanity test.  Use elf32-littlearm to set the machine
+correctly.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/cmake/Common/CompilerGNUARMCommon.cmake b/cmake/Common/Comp=
ilerGNUARMCommon.cmake
+index 32e805bb..2d3ea8e4 100644
+--- a/cmake/Common/CompilerGNUARMCommon.cmake
++++ b/cmake/Common/CompilerGNUARMCommon.cmake
+@@ -196,7 +196,7 @@ function(compiler_generate_hex_output TARGET)
+ endfunction()
+=20
+ function(compiler_generate_elf_output TARGET)
+-	add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND ${CMAKE_GNUARM_=
OBJCOPY} ARGS -O elf32-little $<TARGET_FILE:${TARGET}> $<TARGET_FILE_DIR:=
${TARGET}>/${TARGET}.elf)
++	add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND ${CMAKE_GNUARM_=
OBJCOPY} ARGS -O elf32-littlearm $<TARGET_FILE:${TARGET}> $<TARGET_FILE_D=
IR:${TARGET}>/${TARGET}.elf)
+ endfunction()
+=20
+ # Function for creating a new target that preprocesses a .c file
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.1.bb
similarity index 74%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.=
0.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.1.=
bb
index 9a56f53..17c3f4b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.1.bb
@@ -10,23 +10,25 @@ PROVIDES =3D "virtual/trusted-firmware-m"
=20
 LICENSE =3D "BSD-3-Clause & Apachev2"
=20
-LIC_FILES_CHKSUM ?=3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc3=
085f3afa"
-LIC_FILES_CHKSUM +=3D "file://../mbed-crypto/LICENSE;md5=3D302d50a6369f5=
f22efdb674db908167a"
-LIC_FILES_CHKSUM +=3D "file://../CMSIS_5/LICENSE.txt;md5=3Dc4082b6c254c9=
fb71136710391d9728b"
-
-SRC_URI  =3D "git://git.trustedfirmware.org/trusted-firmware-m.git;proto=
col=3Dhttps;branch=3Dmaster;name=3Dtfm;destsuffix=3D${S}"
-SRC_URI +=3D "git://github.com/ARMmbed/mbed-crypto.git;protocol=3Dhttps;=
branch=3Ddevelopment;name=3Dmbed-crypto;destsuffix=3D${S}/../mbed-crypto"
-SRC_URI +=3D "https://github.com/ARM-software/CMSIS_5/releases/download/=
5.5.0/ARM.CMSIS.5.5.0.pack;name=3Dcmsis;subdir=3D${S}/../CMSIS_5;download=
filename=3DARM.CMSIS.5.5.0.zip"
-
-SRC_URI[cmsis.md5sum] =3D "73b6cf6b4ab06ac099478e6cf983c08e"
-SRC_URI[cmsis.sha256sum] =3D "fc6e46c77de29ed05ef3bfd4846a2da49b024bc885=
4c876ac053aaa8d348ac52"
-
-SRCREV_FORMAT =3D "tfm_mbed-crypto_cmsis"
-# TF-Mv1.0
-SRCREV_tfm =3D "0768982ea41b5e7d207445f19ee23e5d67d9c89b"
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
+                    file://../tf-m-tests/license.rst;md5=3D02d06ffb8d9f0=
99ff4961c0cb0183a18 \
+                    file://../mbed-crypto/LICENSE;md5=3D302d50a6369f5f22=
efdb674db908167a \
+                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
+
+SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3Dmaster;name=3Dtfm;destsuffix=3D${S} \
+            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3Dmaster;name=3Dtfm-tests;destsuffix=3D${S}/../tf-m-tests \
+            git://github.com/ARMmbed/mbed-crypto.git;protocol=3Dhttps;br=
anch=3Ddevelopment;name=3Dmbed-crypto;destsuffix=3D${S}/../mbed-crypto \
+            git://github.com/JuulLabs-OSS/mcuboot.git;protocol=3Dhttps;n=
ame=3Dmcuboot;destsuffix=3D${S}/../mcuboot \
+            file://objcopy.patch"
+
+# TF-Mv1.1
+SRCREV_tfm =3D "a6b336c1509fd5f5522450e3cec0fcd6c060f9c8"
 # mbedcrypto-3.0.1
 SRCREV_mbed-crypto =3D "1146b4e06011b69a6437e6b728f2af043a06ec19"
-SRCREV_cmsis =3D "5.5.0"
+# TF-Mv1.1
+SRCREV_tfm-tests =3D "5a571808e7841f15cc966661a64dd6adb3b40f6c"
+# v1.6.0
+SRCREV_mcuboot =3D "50d24a57516f558dac72bef634723b60c5cfb46b"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d+)+)$"
=20
@@ -42,8 +44,10 @@ INHIBIT_DEFAULT_DEPS =3D "1"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-DEPENDS +=3D "cmake-native"
-DEPENDS +=3D "python3-cryptography-native python3-pyasn1-native python3-=
cbor-native"
+DEPENDS +=3D "cmake-native \
+            python3-cryptography-native \
+            python3-pyasn1-native \
+            python3-cbor-native"
=20
 S =3D "${WORKDIR}/git/tfm"
 B =3D "${WORKDIR}/build"
@@ -91,10 +95,6 @@ LDFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
 LD[unexport] =3D "1"
=20
-# This is needed because CMSIS_5 source package originally has .pack ext=
ension not .zip
-# and bitbake checks this dependency based on file extension
-do_unpack[depends] +=3D "unzip-native:do_populate_sysroot"
-
 do_configure[prefuncs] +=3D "do_check_config"
 do_check_config() {
     if [ ! -f "${S}/configs/${TFM_CONFIG}" ]; then
--=20
2.25.1

