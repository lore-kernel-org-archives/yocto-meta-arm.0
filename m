Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71940C10F1A
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 16:33:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23267.1713890012164565309
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 09:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66D4339;
	Tue, 23 Apr 2024 09:33:59 -0700 (PDT)
Received: from FWLNXWH7M5.arm.com (unknown [10.57.21.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E7A8D3F7BD;
	Tue, 23 Apr 2024 09:33:30 -0700 (PDT)
From: Gyorgy Szing <gyorgy.szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <gyorgy.szing@arm.com>
Subject: [PATCH 4/9] arm/trusted-services: fix environment handling
Date: Tue, 23 Apr 2024 18:32:00 +0200
Message-ID: <20240423163205.5885-4-gyorgy.szing@arm.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240423163205.5885-1-gyorgy.szing@arm.com>
References: <20240423163205.5885-1-gyorgy.szing@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 23 Apr 2024 16:33:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5589

The current version of the TS recipes fails to build if the TS
environment is not set to opteesp. Change the recipes to allow building
the sp environment.

This environment targets "generic" secure partitions and produces SPMC
agnostic SP binaries which should be able to boot under any FF-A v1.0
compliant SPMC implementation.

Signed-off-by: Gyorgy Szing <gyorgy.szing@arm.com>
---
 documentation/trusted-services.md             |  3 ++
 .../recipes-security/optee/optee-os-ts.inc    | 31 ++++++++++---------
 .../trusted-services/trusted-services.inc     |  4 +--
 .../trusted-services/ts-sp-common.inc         |  1 +
 .../ts-sp-spm-test-common.inc                 |  3 ++
 5 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/documentation/trusted-services.md b/documentation/trusted-se=
rvices.md
index f672dc2e..0359b648 100644
--- a/documentation/trusted-services.md
+++ b/documentation/trusted-services.md
@@ -44,6 +44,9 @@ Other steps depend on your machine/platform definition:
    and in `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-n1sdp.inc` and
    `meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-corst=
one1000.inc` for N1SDP and Corstone1000 platforms.
=20
+4. Trusted Services supports an SPMC agonistic binary format. To build S=
Ps to this format the `TS_ENV` variable is to be
+   set to `sp`. The resulting SP binaries should be able to boot under a=
ny FF-A v1.1 compliant SPMC implementation.
+
 ## Normal World applications
=20
 Optionally for testing purposes you can add `packagegroup-ts-tests` into=
 your image. It includes=20
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/r=
ecipes-security/optee/optee-os-ts.inc
index c6b806ff..a9071abd 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -6,61 +6,64 @@
 # TS SPs UUIDs definitions
 require recipes-security/trusted-services/ts-uuid.inc
=20
-TS_ENV =3D "opteesp"
+TS_ENV ?=3D "opteesp"
 TS_BIN =3D "${RECIPE_SYSROOT}/usr/${TS_ENV}/bin"
+TS_BIN_SPM_TEST=3D "${RECIPE_SYSROOT}/usr/opteesp/bin"
+
+SP_EXT =3D "${@oe.utils.conditional('TS_ENV','opteesp','.stripped.elf','=
.bin',d)}"
=20
 # ITS SP
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', =
\
                                         ' ts-sp-its', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', =
\
-                                        ' ${TS_BIN}/${ITS_UUID}.stripped=
.elf', '', d)}"
+                                        ' ${TS_BIN}/${ITS_UUID}${SP_EXT}=
', '', d)}"
=20
 # Storage SP
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storag=
e', \
                                         ' ts-sp-storage', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-storag=
e', \
-                                        ' ${TS_BIN}/${STORAGE_UUID}.stri=
pped.elf', '', d)}"
+                                        ' ${TS_BIN}/${STORAGE_UUID}${SP_=
EXT}', '', d)}"
=20
 # Crypto SP.
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto=
', \
                                         ' ts-sp-crypto', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto=
', \
-                                        ' ${TS_BIN}/${CRYPTO_UUID}.strip=
ped.elf', '', d)}"
+                                        ' ${TS_BIN}/${CRYPTO_UUID}${SP_E=
XT}', '', d)}"
=20
 # Attestation SP
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attest=
ation', \
                                         ' ts-sp-attestation', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-attest=
ation', \
-                                        ' ${TS_BIN}/${ATTESTATION_UUID}.=
stripped.elf', '', d)}"
+                                        ' ${TS_BIN}/${ATTESTATION_UUID}$=
{SP_EXT}', '', d)}"
=20
 # Env-test SP
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-te=
st', \
                                         ' ts-sp-env-test', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-te=
st', \
-                                        ' ${TS_BIN}/${ENV_TEST_UUID}.str=
ipped.elf', '', d)}"
+                                        ' ${TS_BIN}/${ENV_TEST_UUID}${SP=
_EXT}', '', d)}"
=20
 # SE-Proxy SP
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-pro=
xy', \
                                         ' ts-sp-se-proxy', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-pro=
xy', \
-                                        ' ${TS_BIN}/${SE_PROXY_UUID}.str=
ipped.elf', '', d)}"
+                                        ' ${TS_BIN}/${SE_PROXY_UUID}${SP=
_EXT}', '', d)}"
=20
 # SMM Gateway
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-ga=
teway', \
                                         ' ts-sp-smm-gateway', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-ga=
teway', \
-                                        ' ${TS_BIN}/${SMM_GATEWAY_UUID}.=
stripped.elf', '', d)}"
+                                        ' ${TS_BIN}/${SMM_GATEWAY_UUID}$=
{SP_EXT}', '', d)}"
=20
 # SPM test SPs
 DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
                                         ' ts-sp-spm-test1 ts-sp-spm-test=
2 \
                                           ts-sp-spm-test3 ts-sp-spm-test=
4', '' , d)}"
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-spm=
c-test', \
-                            ' ${TS_BIN}/${SPM_TEST1_UUID}.stripped.elf \
-                              ${TS_BIN}/${SPM_TEST2_UUID}.stripped.elf \
-                              ${TS_BIN}/${SPM_TEST3_UUID}.stripped.elf \
-                              ${TS_BIN}/${SPM_TEST4_UUID}.stripped.elf',=
 \
-                              '', d)}"
+                        ' ${TS_BIN_SPM_TEST}/${SPM_TEST1_UUID}.stripped.=
elf \
+                          ${TS_BIN_SPM_TEST}/${SPM_TEST2_UUID}.stripped.=
elf \
+                          ${TS_BIN_SPM_TEST}/${SPM_TEST3_UUID}.stripped.=
elf \
+                          ${TS_BIN_SPM_TEST}/${SPM_TEST4_UUID}.stripped.=
elf', \
+                          '', d)}"
 EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee=
-spmc-test', \
                                         ' CFG_SPMC_TESTS=3Dy', '' , d)}"
=20
@@ -69,7 +72,7 @@ DEPENDS:append  =3D "${@bb.utils.contains('MACHINE_FEAT=
URES', 'ts-block-storage',
                                         ' ts-sp-block-storage', '' , d)}=
"
=20
 SP_PATHS:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'ts-block-=
storage', \
-                                        ' ${TS_BIN}/${BLOCK_STORAGE_UUID=
}.stripped.elf', '', d)}"
+                                        ' ${TS_BIN}/${BLOCK_STORAGE_UUID=
}${SP_EXT}', '', d)}"
=20
 EXTRA_OEMAKE:append =3D "${@oe.utils.conditional('SP_PATHS', '', '', \
                         ' CFG_MAP_EXT_DT_SECURE=3Dy CFG_SECURE_PARTITION=
=3Dy \
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.=
inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index c4a6f78c..272e9106 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -23,7 +23,7 @@ TS_PLATFORM ?=3D "ts/mock"
 # FIP packaging is not supported yet
 SP_PACKAGING_METHOD ?=3D "embedded"
=20
-SYSROOT_DIRS +=3D "/usr/opteesp /usr/arm-linux"
+SYSROOT_DIRS +=3D "/usr/${TS_ENV} /usr/opteesp /usr/arm-linux"
=20
 # TS cmake files use find_file() to search through source code and build=
 dirs.
 # Yocto cmake class limits CMAKE_FIND_ROOT_PATH and find_file() fails.
@@ -54,5 +54,5 @@ EXTRA_OECMAKE +=3D "${@get_ts_toolchain_option(d)}"
=20
 # Paths to pre-built dependencies required by some TS SPs/tools
 EXTRA_OECMAKE +=3D "-Dlibts_ROOT=3D${STAGING_DIR_HOST}${TS_INSTALL}/lib/=
cmake/libts/ \
-                  -DNEWLIB_INSTALL_DIR=3D${STAGING_DIR_HOST}${TS_INSTALL=
}/newlib \
+                  -DNEWLIB_INSTALL_DIR=3D${STAGING_DIR_HOST}/usr/opteesp=
/newlib \
                  "
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc =
b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index 5e4cd720..c8b1409c 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -6,6 +6,7 @@ require trusted-services.inc
 require ts-uuid.inc
=20
 DEPENDS +=3D "dtc-native ts-newlib"
+DEPENDS +=3D "${@oe.utils.conditional('TS_ENV','sp','python3-pyelftools-=
native','', d)}"
=20
 FILES:${PN}-dev =3D "${TS_INSTALL}"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-co=
mmon.inc b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-comm=
on.inc
index e357629b..5c0d6865 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.in=
c
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.in=
c
@@ -1,5 +1,8 @@
 DESCRIPTION =3D "Trusted Services SPMC test SPs"
=20
+# spm test SP only supports opteesp.
+TS_ENV =3D 'opteesp'
+
 require ts-sp-common.inc
=20
 SP_UUID =3D "${SPM_TEST${SP_INDEX}_UUID}"
--=20
2.43.1


