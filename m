Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB4FC38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:49:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.42721.1674481749482848503
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 05:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1DB7C14;
	Mon, 23 Jan 2023 05:49:50 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.89.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49C813F64C;
	Mon, 23 Jan 2023 05:49:08 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH] arm: Use SRC* variables consistently
Date: Mon, 23 Jan 2023 13:48:55 +0000
Message-Id: <20230123134855.3793215-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 13:49:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4309

From: Peter Hoyes <Peter.Hoyes@arm.com>

The SRC_URI, SRCREV AND SRCBRANCH variables are currently used
inconsistently across recipes in meta-arm, leading to difficulties
customizing the configuration in external BSP layers where necessary.

Standardize usage across commonly used recipes so that:
 * SRC_URI contains a SRC_URI_PACKAGE_NAME variable per component which
   can be used to easily configure a mirror. This variable uses
   default assignment so that it can be easily overridden using an
   environment variable, e.g. to point to an internal mirror that cannot
   be committed externally.
 * SRCBRANCH is defined per component.
 * SRCREV is defined per component.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../scp-firmware/scp-firmware_2.10.0.bb           |  4 +++-
 .../trusted-firmware-a/tf-a-tests_2.7.0.bb        |  6 ++++--
 .../trusted-firmware-a/trusted-firmware-a.inc     |  4 +++-
 .../trusted-firmware-m_1.7.0.bb                   | 15 ++++++++++-----
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc       | 11 ++++++-----
 .../fiptool/fiptool-native_2.7.bb                 |  4 +++-
 .../trusted-firmware-m-scripts-native_1.6.0.bb    |  3 ++-
 7 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
index 055e0c1b..b25b9a40 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.10.0.bb
@@ -6,7 +6,9 @@ LICENSE =3D "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
                     file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
=20
-SRC_URI =3D "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=3D=
https;branch=3Dmaster"
+SRC_URI_SCP_FIRMWARE ?=3D "gitsm://github.com/ARM-software/SCP-firmware.=
git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_SCP_FIRMWARE};branch=3D${SRCBRANCH}"
+SRCBRANCH =3D "master"
=20
 SRCREV  =3D "673d014f3861ad81cc5ab06d2884a314a610799b"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb =
b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
index 645b2456..8ded64dd 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.7.0.bb
@@ -7,9 +7,11 @@ inherit deploy
=20
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/tf-a-tests.git;protocol=3D=
https;branch=3Dmaster \
+SRC_URI_TRUSTED_FIRMWARE_A_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
A/tf-a-tests.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A_TESTS};branch=3D${SRCBRANCH} \
           file://tf-a-tests-no-warn-rwx-segments.patch"
-SRCREV ?=3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
+SRCBRANCH =3D "master"
+SRCREV =3D "5f591f67738a1bbe6b262c53d9dad46ed8bbcd67"
=20
 DEPENDS +=3D "optee-os"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index c5b695e4..b0533a1e 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -5,7 +5,9 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRCBRANCH =3D "master"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};name=3Dtfa;branch=3D${SRCBRAN=
CH}"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1=
.7.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.=
0.bb
index 3b4469d0..8e02bf98 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_1.7.0.bb
@@ -15,11 +15,16 @@ LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368=
487da347f3c7bd0fc3085f3afa \
                     file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57 \
                     file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8"
=20
-SRC_URI  =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;=
protocol=3Dhttps;branch=3D${SRCBRANCH_tfm};name=3Dtfm;destsuffix=3Dgit/tf=
m \
-            git://git.trustedfirmware.org/TF-M/tf-m-tests.git;protocol=3D=
https;branch=3D${SRCBRANCH_tfm-tests};name=3Dtfm-tests;destsuffix=3Dgit/t=
f-m-tests \
-            git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH_mbedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
-            git://github.com/mcu-tools/mcuboot.git;protocol=3Dhttps;bran=
ch=3D${SRCBRANCH_mcuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
-            git://github.com/laurencelundblade/QCBOR.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH_qcbor};name=3Dqcbor;destsuffix=3Dgit/qcbor \
+SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_TESTS ?=3D "git://git.trustedfirmware.org/TF-=
M/tf-m-tests.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS ?=3D "git://github.com/ARMmbed/mbedtl=
s.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github.com/mcu-tools/mcub=
oot.git;protocol=3Dhttps"
+SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dgit/tfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dgit/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dgit/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dgit/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dgit/qcbor \
             "
=20
 # The required dependencies are documented in tf-m/config/config_default=
.cmake
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index c9f1f1da..bc477479 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -11,12 +11,13 @@ LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b4155=
20383f7964e96700ae12b4570a"
 LIC_FILES_CHKSUM +=3D "file://edk2-platforms/License.txt;md5=3D2b4155203=
83f7964e96700ae12b4570a"
=20
 # These can be overridden as needed
-EDK2_SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;=
protocol=3Dhttps"
-EDK2_PLATFORMS_SRC_URI =3D "git://github.com/tianocore/edk2-platforms.gi=
t;branch=3Dmaster;protocol=3Dhttps"
-
+SRC_URI_EDK2 ?=3D "gitsm://github.com/tianocore/edk2.git;protocol=3Dhttp=
s"
+SRC_URI_EDK2_PLATFORMS ?=3D "git://github.com/tianocore/edk2-platforms.g=
it;protocol=3Dhttps"
+SRCBRANCH_edk2 =3D "master"
+SRCBRANCH_edk2_platforms =3D "master"
 SRC_URI =3D "\
-    ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
-    ${EDK2_PLATFORMS_SRC_URI};name=3Dedk2-platforms;destsuffix=3Dedk2/ed=
k2-platforms;nobranch=3D1 \
+    ${SRC_URI_EDK2};branch=3D${SRCBRANCH_edk2_platforms};name=3Dedk2;des=
tsuffix=3Dedk2 \
+    ${SRC_URI_EDK2_PLATFORMS};branch=3D${SRCBRANCH_edk2};name=3Dedk2-pla=
tforms;destsuffix=3Dedk2/edk2-platforms \
     file://unaligned.patch \
     file://default.patch;patchdir=3Dedk2-platforms \
 "
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb b/me=
ta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
index ec531e44..66cf2ced 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.7.bb
@@ -5,7 +5,9 @@
 DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
 LICENSE =3D "BSD-3-Clause"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;d=
estsuffix=3Dfiptool-${PV};protocol=3Dhttps;branch=3Dmaster"
+SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://git.trustedfirmware.org/TF-A/trus=
ted-firmware-a.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_A};destsuffix=3Dfiptool-${PV};br=
anch=3D${SRCBRANCH}"
+SRCBRANCH =3D "master"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3Db2c740efedc159745b9b=
31f88ff03dde"
=20
 # Use fiptool from TF-A v2.7
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native_1.6.0.bb b/meta-arm/recipes-devtools/trusted-f=
irmware-m-scripts/trusted-firmware-m-scripts-native_1.6.0.bb
index 453d456a..217f08a6 100644
--- a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.6.0.bb
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.6.0.bb
@@ -1,5 +1,6 @@
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;p=
rotocol=3Dhttps;branch=3D${SRCBRANCH}"
+SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
+SRC_URI =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH}"
 # Use the wrapper script from TF-Mv1.6.0
 SRCBRANCH ?=3D "release/1.6.x"
 SRCREV =3D "7387d88158701a3c51ad51c90a05326ee12847a8"
--=20
2.34.1


