Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDA5C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 16:04:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9832.1635955470827565990
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 09:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAB1CED1
	for <meta-arm@lists.yoctoproject.org>; Wed,  3 Nov 2021 09:04:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F1CA3F7D7
	for <meta-arm@lists.yoctoproject.org>; Wed,  3 Nov 2021 09:04:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Update git: SRC_URIs
Date: Wed,  3 Nov 2021 16:04:27 +0000
Message-Id: <20211103160427.890131-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Nov 2021 16:04:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2335

GitHub has deprecated the unauthorised git protocol[1], so all GitHub
URLs need to specify protocol=3Dhttps.

Also the git fetcher is making the branch parameter mandatory, so add it
where it is currently implicit.

[1] https://github.blog/2021-09-01-improving-git-protocol-security-github=
/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb   | 2 +-
 .../trusted-firmware-a/trusted-firmware-a-corstone1000.inc    | 2 +-
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb             | 2 +-
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb             | 2 +-
 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb             | 2 +-
 .../corstone700-test-app/corstone700-test-app_1.0.bb          | 2 +-
 .../boot-wrapper-aarch64/boot-wrapper-aarch64_git.bb          | 2 +-
 meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb                   | 2 +-
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb       | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 2 +-
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc                   | 4 ++--
 meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb       | 2 +-
 meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb  | 2 +-
 meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb            | 2 +-
 meta-arm/recipes-security/optee/optee-client.inc              | 2 +-
 meta-arm/recipes-security/optee/optee-examples.inc            | 2 +-
 meta-arm/recipes-security/optee/optee-os.inc                  | 2 +-
 meta-arm/recipes-security/optee/optee-test.inc                | 2 +-
 meta-atp/recipes-devtools/atp/atp-source_3.1.inc              | 2 +-
 19 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb =
b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
index cfcb98de..0a8e2df6 100644
--- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
+++ b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
@@ -5,7 +5,7 @@ LICENSE =3D "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0 \
                     file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
=20
-SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmw=
are.git;protocol=3Dhttps \
+SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmw=
are.git;protocol=3Dhttps;branch=3Dmaster \
            file://gen-module-race.patch"
 SRCREV =3D "af7eeb1bb8c5a85a5e5a76d48acc6fe864d715a9"
 PV =3D "2020.02.10+git${SRCPV}"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 833396e8..32546bb3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -2,7 +2,7 @@
=20
 COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa"
+SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
=20
 # TF-A master branch with all Corstone1000 patches merged
 SRCREV_tfa =3D "459b24451a0829460783ce8dfa15561e36d901d8"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
index e54e34a1..1cd54be4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bb
@@ -16,7 +16,7 @@ PE =3D "1"
 # repo during parse
 SRCREV =3D "36fec02b1f90b92cf51ec531564f9284eae27ab4"
=20
-SRC_URI =3D "git://git.denx.de/u-boot.git \
+SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster \
           "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
index fa99a3a8..4dc4a2f7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bb
@@ -14,7 +14,7 @@ PE =3D "1"
 # repo during parse
 SRCREV =3D "2f5fbb5b39f7b67044dda5c35e4a4b31685a3109"
=20
-SRC_URI =3D "git://git.denx.de/u-boot.git \
+SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster \
           "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
index 6fffdbd2..0c4926bc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.10.bb
@@ -14,7 +14,7 @@ PE =3D "1"
 # repo during parse
 SRCREV =3D "050acee119b3757fee3bd128f55d720fdd9bb890"
=20
-SRC_URI =3D "git://git.denx.de/u-boot.git \
+SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster \
           "
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-t=
est-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone7=
00-test-app_1.0.bb
index d2bfb19f..8bd71ac4 100644
--- a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app=
_1.0.bb
+++ b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app=
_1.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "https://git.linaro.org/landing-teams/workin=
g/arm/test-apps.git"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0"
=20
-SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/test-apps.gi=
t;protocol=3Dhttps"
+SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/test-apps.gi=
t;protocol=3Dhttps;branch=3Dmaster"
 SRCREV =3D "ecd93a275d11cf08f670a97783110bd698250963"
 PV .=3D "~git${SRCPV}"
=20
diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index c7235173..8f4b9653 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -3,7 +3,7 @@ LICENSE =3D "BSD"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326febfb5fb909226c8e7=
ebcef5c"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git"
+SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster"
 SRCREV =3D "8d5a765251d9113c3c0f9fa14de42a9e7486fe8a"
=20
 PV =3D "git${SRCPV}"
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.5.bb
index dc248e48..b6dd685c 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.5.bb
@@ -9,7 +9,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy python3native pkgconfig
=20
-SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps \
+SRC_URI =3D "gitsm://git.trustedfirmware.org/hafnium/hafnium.git;protoco=
l=3Dhttps;branch=3Dmaster \
            file://hashbang.patch \
            file://pkg-config-native.patch \
            file://native-dtc.patch"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb b/me=
ta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
index d40d82db..40648aa4 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.8.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=
=3D9db9e3d2fb8d9300a6c3d15101
                     file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
=20
 SRC_URI =3D "\
-    gitsm://github.com/ARM-software/SCP-firmware.git;protocol=3Dhttps \
+    gitsm://github.com/ARM-software/SCP-firmware.git;protocol=3Dhttps;br=
anch=3Dmaster \
     file://0001-smt-Make-status-and-length-volatile-for-mod_smt_memo.pat=
ch \
 "
 SRCREV  =3D "043de77f220a0b4b0ec3aa367bd515a9e9df2a29"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 0d49a0a2..39b51566 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -7,7 +7,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit deploy
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa \
+SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;p=
rotocol=3Dhttps;name=3Dtfa;branch=3Dmaster \
            file://ssl.patch"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
=20
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 4b440860..2f6f42c0 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D "file://License.txt;md5=3D2b415520=
383f7964e96700ae12b4570a"
 LIC_FILES_CHKSUM +=3D "file://edk2-platforms/License.txt;md5=3D2b4155203=
83f7964e96700ae12b4570a"
=20
 # These can be overridden as needed
-EDK2_SRC_URI =3D "gitsm://github.com/tianocore/edk2.git"
-EDK2_PLATFORMS_SRC_URI =3D "git://github.com/tianocore/edk2-platforms.gi=
t"
+EDK2_SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=3Dmaster;=
protocol=3Dhttps"
+EDK2_PLATFORMS_SRC_URI =3D "git://github.com/tianocore/edk2-platforms.gi=
t;branch=3Dmaster;protocol=3Dhttps"
=20
 SRC_URI =3D "\
     ${EDK2_SRC_URI};name=3Dedk2;destsuffix=3Dedk2;nobranch=3D1 \
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb b/me=
ta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
index dd36eca8..1d771b6d 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
@@ -5,7 +5,7 @@
 DESCRIPTION =3D "fiptool - Trusted Firmware tool for packaging"
 LICENSE =3D "BSD-3-Clause"
=20
-SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;d=
estsuffix=3Dfiptool-${PV};protocol=3Dhttps \
+SRC_URI =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;d=
estsuffix=3Dfiptool-${PV};protocol=3Dhttps;branch=3Dmaster \
            file://ssl.patch"
 LIC_FILES_CHKSUM =3D "file://docs/license.rst;md5=3D713afe122abbe07f067f=
939ca3c480c5"
=20
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb=
 b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
index b3ba4376..91b7d64f 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.7.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
                    "
=20
 SRCREV =3D "9d8d75fa08352470c51abc23fe3b314879bd8b78"
-SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;bra=
nch=3Dmain \
+SRC_URI =3D "git://github.com/ARM-software/gator.git;protocol=3Dhttp;bra=
nch=3Dmain;protocol=3Dhttps \
            file://0001-Sources.mk-Remove-xml-PmuXMLParser.h-header-from-=
GAT.patch;striplevel=3D2 \
           "
=20
diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.1.0.bb
index e77433d6..804efb50 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/Linaro/OpenCSD"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
-SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps"
+SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
 SRCREV =3D "54c3f67811fbcea853b7d223383d4a755819bb7e"
=20
 S =3D "${WORKDIR}/git"
diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/=
recipes-security/optee/optee-client.inc
index 1642b0d0..3b9943cc 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D69663ab1532985=
57a59c67a60a743e5b"
 inherit systemd update-rc.d cmake
=20
 SRC_URI =3D " \
-    git://github.com/OP-TEE/optee_client.git \
+    git://github.com/OP-TEE/optee_client.git;branch=3Dmaster;protocol=3D=
https \
     file://tee-supplicant.service \
     file://tee-supplicant.sh \
 "
diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta-ar=
m/recipes-security/optee/optee-examples.inc
index b74344ac..921fa18d 100644
--- a/meta-arm/recipes-security/optee/optee-examples.inc
+++ b/meta-arm/recipes-security/optee/optee-examples.inc
@@ -11,7 +11,7 @@ inherit python3native
=20
 require optee.inc
=20
-SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git \
+SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git;branch=3Dmas=
ter;protocol=3Dhttps \
            file://0001-plugins-Honour-default-cross-compiler-environment=
-se.patch \
            file://0002-Makefile-Enable-plugins-installation-in-rootfs.pa=
tch \
           "
diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/reci=
pes-security/optee/optee-os.inc
index 3d707acf..277646e7 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -14,7 +14,7 @@ DEPENDS =3D "python3-pycryptodome-native python3-pyelft=
ools-native"
=20
 DEPENDS:append:toolchain-clang =3D " compiler-rt"
=20
-SRC_URI =3D "git://github.com/OP-TEE/optee_os.git"
+SRC_URI =3D "git://github.com/OP-TEE/optee_os.git;branch=3Dmaster;protoc=
ol=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index 0a8e56ca..99656a14 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -10,7 +10,7 @@ require optee.inc
=20
 DEPENDS =3D "optee-client optee-os python3-pycryptodome-native"
=20
-SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
+SRC_URI =3D "git://github.com/OP-TEE/optee_test.git;branch=3Dmaster;prot=
ocol=3Dhttps \
            file://run-ptest \
           "
=20
diff --git a/meta-atp/recipes-devtools/atp/atp-source_3.1.inc b/meta-atp/=
recipes-devtools/atp/atp-source_3.1.inc
index e5442c9c..de24ef83 100644
--- a/meta-atp/recipes-devtools/atp/atp-source_3.1.inc
+++ b/meta-atp/recipes-devtools/atp/atp-source_3.1.inc
@@ -1,4 +1,4 @@
-ATP_SRC =3D "git://github.com/ARM-software/ATP-Engine.git;protocol=3Dhtt=
ps"
+ATP_SRC =3D "git://github.com/ARM-software/ATP-Engine.git;protocol=3Dhtt=
ps;branch=3Dmaster"
 ATP_REV =3D "be1066029d6256626b37be004e2a663fbc29f37e"
 ATP_LIC =3D "BSD-3-Clause-Clear"
 ATP_LIC_MD5 =3D "e836b5992257064f488715d9a59752c3"
--=20
2.25.1


