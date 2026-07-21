Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56861C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:02:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22174.1784638924106749315
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 06:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=PAbsHg8w;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BAC5152B
	for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 06:01:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D2F13F86F
	for <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784638923; bh=c4FILYT++AFKTL9hvzpEHyYQWmkqg4hHNXMJTpnZM7Y=;
	h=From:To:Subject:Date:From;
	b=PAbsHg8wuObOV/UayFSfMHYR45guzmn7kS18/sq69VcgQb3bOGOXQoIvPnU2naLhs
	 Qd6BDZUVycJEhRx5mEMKyJl5Qh42Js18dXugGZPgFtfRzvmSk8421XZ9tA2O3UA0uv
	 gZi9Y7U8h7EID1RcVhjjYmp9WdY0JJJD7VqlTr9c=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] recipes: port LICENSE to SPDX
Date: Tue, 21 Jul 2026 14:01:59 +0100
Message-ID: <20260721130159.558910-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Jul 2026 13:02:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7119

openembedded-core now parses the LICENSE field as a SPDX license
expression[1], so convert the license statements.

This is mostly replacing "&" with "AND", but we can also use "WITH" in
the GCC recipes.

[1] oe-core e9d424738d6 ("classes/conf/lib: Parse LICENSE as SPDX Express=
ion")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2.inc  | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2.inc  | 2 +-
 .../external-arm-toolchain/gcc-aarch64-none-elf_15.3.rel1.bb    | 2 +-
 .../external-arm-toolchain/gcc-arm-none-eabi_15.3.rel1.bb       | 2 +-
 meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb                  | 2 +-
 meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc              | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb    | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb    | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc  | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.bb | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-2.2.2-src.inc         | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-2.3.0-src.inc         | 2 +-
 .../trusted-firmware-m/trusted-firmware-m-git-src.inc           | 2 +-
 .../trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb          | 2 +-
 meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb                     | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb        | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-common.inc                    | 2 +-
 meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb    | 2 +-
 meta-arm/recipes-security/optee/optee-test.inc                  | 2 +-
 .../recipes-security/trusted-services/trusted-services-src.inc  | 2 +-
 meta-arm/recipes-security/trusted-services/trusted-services.inc | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_git=
.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
index ede5b80a76..87a8a34886 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION =3D "Firmware to be loaded and run in Externa=
l System Harness in\
 HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/external-=
system.git"
 DEPENDS =3D "gcc-arm-none-eabi-native"
 INHIBIT_DEFAULT_DEPS =3D "1"
-LICENSE =3D "BSD-3-Clause & Apache-2.0"
+LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De44b2531cd6ffe9dece394dbe988d=
9a0 \
                     file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-rdn2.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-rdn2.inc
index d761a7ae63..c86d4a584e 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdn2=
.inc
@@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
 # add MBEDTLS to our sources if activated
 SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
 # Update license variables
-LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
+LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND Apach=
e-2.0', '', d)}"
 LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
 SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-rdv2.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-rdv2.inc
index 8010c523e1..408185e388 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-rdv2=
.inc
@@ -38,7 +38,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
 # add MBEDTLS to our sources if activated
 SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
 # Update license variables
-LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
+LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND Apach=
e-2.0', '', d)}"
 LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
 SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_15.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_15.3.rel1.bb
index 447db59cd4..05d6a9f952 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_15.3.rel1.bb
@@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
 COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
=20
 SUMMARY =3D "Arm GNU Toolchain - AArch64 bare-metal target (aarch64-none=
-elf)"
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.=
1"
=20
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_15.3.rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_15.3.rel1.bb
index 70a3a37289..db7a5dffa2 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.3.rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_15.3.rel1.bb
@@ -6,7 +6,7 @@ require arm-binary-toolchain.inc
 COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
=20
 SUMMARY =3D "Arm GNU Toolchain - AArch32 bare-metal target (arm-none-eab=
i)"
-LICENSE =3D "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+LICENSE =3D "GPL-3.0-or-later AND GPL-3.0-or-later WITH GCC-exception-3.=
1"
=20
 LIC_FILES_CHKSUM:aarch64 =3D "file://share/doc/gcc/Copying.html;md5=3D90=
014a59d1783b37a10240d4d0002c6e"
 LIC_FILES_CHKSUM:x86-64 =3D "file://share/doc/gcc/Copying.html;md5=3D900=
14a59d1783b37a10240d4d0002c6e"
diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb b/meta-arm/re=
cipes-bsp/hafnium/hafnium_2.14.0.bb
index f8a374b7f0..0dfa2dace6 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.14.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Hafnium"
 DESCRIPTION =3D "A reference Secure Partition Manager (SPM) for systems =
that implement the Armv8.4-A Secure-EL2 extension"
 DEPENDS =3D "gn-native ninja-native bison-native bc-native dtc-native op=
enssl-native clang-native lld-native"
=20
-LICENSE =3D "BSD-3-Clause & GPL-2.0-only"
+LICENSE =3D "BSD-3-Clause AND GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D782b40c14bad5294672c500501edc=
103"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc b/meta-ar=
m/recipes-bsp/scp-firmware/scp-firmware.inc
index 032445b3bd..495b0f2905 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "SCP and MCP Firmware"
 DESCRIPTION =3D "Firmware for SCP and MCP software reference implementat=
ion"
 HOMEPAGE =3D "https://gitlab.arm.com/firmware/SCP-firmware"
=20
-LICENSE =3D "BSD-3-Clause & Apache-2.0"
+LICENSE =3D "Apache-2.0 AND BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://license.md;beginline=3D5;md5=3D9db9e3d2fb8d=
9300a6c3d15101b19731 \
                     file://contrib/cmsis/git/LICENSE.txt;md5=3De3fc50a88=
d0a364313df4b21ef20c29e"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
index a65106f24e..e876bd1eaa 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.14.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
-LICENSE =3D "BSD-3-Clause & NCSA"
+LICENSE =3D "BSD-3-Clause AND NCSA"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a=
32aa0ee7d1b4a"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb=
 b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
index 8bd5dd5643..17951766e1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.15.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Trusted Firmware-A tests(aka TFTF)"
-LICENSE =3D "BSD-3-Clause & NCSA"
+LICENSE =3D "BSD-3-Clause AND NCSA"
=20
 LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D6175cc0aa2e63b6d21a=
32aa0ee7d1b4a"
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 211196b5f8..1e06559ce2 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Trusted Firmware-A"
 HOMEPAGE =3D "https://trustedfirmware-a.readthedocs.io/"
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2.0"
+LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT"
=20
 inherit firmware
=20
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2=
.14.2.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.1=
4.2.bb
index 3d0b80188e..9c70d0b581 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.b=
b
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.14.2.b=
b
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM_MBEDTLS ??=3D ""
 # add MBEDTLS to our sources if activated
 SRC_URI:append =3D " ${@bb.utils.contains('TFA_MBEDTLS', '1', '${SRC_URI=
_MBEDTLS}', '', d)}"
 # Update license variables
-LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' & Apache-=
2.0', '', d)}"
+LICENSE:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' AND Apach=
e-2.0', '', d)}"
 LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' =
${LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
 # add mbed TLS to version
 SRCREV_FORMAT:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', '_mbe=
dtls', '', d)}"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.2-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.2-src.inc
index ddaab88e8b..8fb0265e94 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
@@ -1,6 +1,6 @@
 # Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
=20
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
                     file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.3.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.3.0-src.inc
index d3ab29d0e2..4ed6d8cb80 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.3.0-sr=
c.inc
@@ -1,6 +1,6 @@
 # Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
=20
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D002a64dec64b82c58a203a94b=
ee7b2a1 \
                     file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
index 7bea317cf3..ffc6200e77 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -1,6 +1,6 @@
 # Common src definitions for trusted-firmware-m and trusted-firmware-m-s=
cripts
=20
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
+LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
                     file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-r=
mm_0.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-=
rmm_0.6.0.bb
index 60558b6bca..43585982e9 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.=
0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "RMM Firmware"
 DESCRIPTION =3D "RMM Firmware for Arm reference platforms"
-LICENSE =3D "BSD-3-Clause & MIT"
+LICENSE =3D "BSD-3-Clause AND MIT"
=20
 SRC_URI =3D "gitsm://git.trustedfirmware.org/TF-RMM/tf-rmm.git;protocol=3D=
https;branch=3Dmain"
 SRCREV =3D "7f6bc132caef3596fbb88d3a419c2a3cb499cde2"
diff --git a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb b/meta-arm/recip=
es-bsp/uefi/sbsa-acs_7.2.2.bb
index 6d4422f99a..1c4753cbb2 100644
--- a/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
+++ b/meta-arm/recipes-bsp/uefi/sbsa-acs_7.2.2.bb
@@ -1,7 +1,7 @@
 require recipes-bsp/uefi/edk2-firmware_202605.bb
 PROVIDES:remove =3D "virtual/bootloader"
=20
-LICENSE +=3D "& Apache-2.0"
+LICENSE +=3D "AND Apache-2.0"
 LIC_FILES_CHKSUM +=3D "file://ShellPkg/Application/sbsa-acs/LICENSE.md;m=
d5=3D2a944942e1496af1886903d274dedb13"
=20
 SRC_URI +=3D "git://github.com/ARM-software/sbsa-acs;destsuffix=3Dedk2/S=
hellPkg/Application/sbsa-acs;protocol=3Dhttps;branch=3Dmaster;name=3Dacs =
\
diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
index 3c41d05c54..3a4789c57f 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.31.28.bb
@@ -1,6 +1,6 @@
 require fvp-envelope.inc
=20
-LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-Clause & Unlicense=
"
+LICENSE:append =3D " AND Artistic-2.0 AND BSL-1.0 AND BSD-2-Clause AND U=
nlicense"
=20
 SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
 LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/reci=
pes-devtools/fvp/fvp-common.inc
index 5d87cef783..5059985563 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -1,7 +1,7 @@
 HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms"
=20
 LICENSE_FLAGS =3D "Arm-FVP-EULA"
-LICENSE =3D "Proprietary & Apache-2.0 & Python-2.0 & GPL-3.0-with-GCC-ex=
ception & Zlib & NCSA & LGPL-2.0-or-later & MIT & BSD-3-Clause"
+LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND GPL-3.0-or-later WITH GCC-e=
xception-3.1 AND LGPL-2.0-or-later AND MIT AND NCSA AND Python-2.0 AND Zl=
ib AND LicenseRef-Proprietary"
=20
 # FVP has an End User License Agreement. Add Arm-FVP-EULA to
 # LICENSE_FLAGS_ACCEPTED if the EULA has been accepted, so it can
diff --git a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb=
 b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
index ffd308fa95..84681b1585 100644
--- a/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
+++ b/meta-arm/recipes-devtools/gator-daemon/gator-daemon_7.8.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "https://github.com/ARM-software/gator"
 # configuration requirement specified here:
 # https://github.com/ARM-software/gator#kernel-configuration
=20
-LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later & Apache-2.0"
+LICENSE =3D "Apache-2.0 AND GPL-2.0-only AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
                     file://libsensors/COPYING.LGPL;md5=3D4fbd65380cdd255=
951079008b364516c \
                     file://mxml/LICENSE;md5=3D86d3f3a95c324c9479bd898696=
8f4327 \
diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index bb9471bf88..8786d1bb5a 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "OP-TEE sanity testsuite"
 DESCRIPTION =3D "Open Portable Trusted Execution Environment - Test suit=
e"
 HOMEPAGE =3D "https://www.op-tee.org/"
=20
-LICENSE =3D "BSD-2-Clause & GPL-2.0-only"
+LICENSE =3D "BSD-2-Clause AND GPL-2.0-only"
=20
 inherit python3native ptest
 inherit deploy
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 22cc76ef25..2519b4c297 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -1,6 +1,6 @@
 # Define sources of Trusted Service and all external dependencies
=20
-LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Zlib"
+LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND Zlib"
=20
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index bdfccc48fd..c40d70bf8a 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -1,7 +1,7 @@
 SUMMARY ?=3D "The Trusted Services: framework for developing root-of-tru=
st services"
 HOMEPAGE =3D "https://trusted-services.readthedocs.io/en/latest/index.ht=
ml"
=20
-LICENSE =3D "Apache-2.0 & BSD-3-Clause & Zlib"
+LICENSE =3D "Apache-2.0 AND BSD-3-Clause AND Zlib"
=20
 inherit python3native cmake pkgconfig
=20
--=20
2.43.0


