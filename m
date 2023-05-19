Return-Path: <gyorgy.szing@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C55C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:24:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23047.1684495454752916457
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 May 2023 04:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gyorgy.szing@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17B41FB;
	Fri, 19 May 2023 04:24:58 -0700 (PDT)
Received: from R91284ZP.arm.com (unknown [10.57.21.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 531B63F762;
	Fri, 19 May 2023 04:24:13 -0700 (PDT)
From: Gyorgy Szing <Gyorgy.Szing@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Gyorgy Szing <Gyorgy.Szing@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 01/16] arm/trusted-services: update TS version
Date: Fri, 19 May 2023 13:23:45 +0200
Message-Id: <20230519112400.340-1-Gyorgy.Szing@arm.com>
X-Mailer: git-send-email 2.39.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 May 2023 11:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4665

This change updates to latest available version of Trusted Services.
List of changes:
  - adapt SP recipes to file structure changes and support for
    "configurations". In TS each SP can be built in various different
    setups to allow adapting to platform and integration specific
    differences.
  - MbedTLS dependency has been updated to v3.3.0.
      - This needs new python dependencies are required in the build
        environment.
      - psa-acs was updated to a matching version.
      - do_patch() has been updated to support the MbedTLS patch added
        in TS.
  - Update TS dependency patching method to use git instead of patch.
  - Downgrade nanopb to match up-stream dependency version.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Gyorgy Szing <Gyorgy.Szing@arm.com>
---
 .../trusted-services/trusted-services-src.inc | 27 +++++++++----------
 .../trusted-services/ts-demo_git.bb           |  1 +
 .../trusted-services/ts-newlib_4.1.0.bb       |  4 +--
 .../ts-psa-api-test-common_git.inc            |  4 ++-
 .../trusted-services/ts-sp-attestation_git.bb |  3 ++-
 .../trusted-services/ts-sp-crypto_git.bb      |  5 ++--
 .../trusted-services/ts-sp-env-test_git.bb    |  3 ++-
 .../trusted-services/ts-sp-its_git.bb         |  3 ++-
 .../trusted-services/ts-sp-se-proxy_git.bb    |  3 ++-
 .../trusted-services/ts-sp-smm-gateway_git.bb |  3 ++-
 .../trusted-services/ts-sp-storage_git.bb     |  3 ++-
 11 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index dc295506..c3ab7867 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -5,8 +5,8 @@ LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSD-2-Clause & Z=
lib"
 SRC_URI =3D "git://git.trustedfirmware.org/TS/trusted-services.git;proto=
col=3Dhttps;branch=3Dintegration;name=3Dtrusted-services;destsuffix=3Dgit=
/trusted-services \
 "
=20
-#latest on 12.10.22.
-SRCREV_trusted-services =3D "3d4956770f89eb9ae0a73257901ae6277c078da6"
+#Latest on 2023 April 25
+SRCREV=3D"0d292e7c879076ea36cc39e30e0ac930b71e8cd8"
 LIC_FILES_CHKSUM =3D "file://${S}/license.rst;md5=3Dea160bac7f690a069c60=
8516b17997f4"
=20
 S =3D "${WORKDIR}/git/trusted-services"
@@ -17,14 +17,14 @@ SRC_URI +=3D "git://github.com/dgibson/dtc;name=3Ddtc=
;protocol=3Dhttps;branch=3Dmain;des
 SRCREV_dtc =3D "b6910bec11614980a21e46fbccc35934b671bd81"
 LIC_FILES_CHKSUM +=3D "file://../dtc/README.license;md5=3Da1eb22e37f09df=
5b5511b8a278992d0e"
=20
-# MbedTLS, tag "mbedtls-3.1.0"
+# MbedTLS, tag "mbedtls-3.3.0"
 SRC_URI +=3D "git://github.com/ARMmbed/mbedtls.git;name=3Dmbedtls;protoc=
ol=3Dhttps;branch=3Dmaster;destsuffix=3Dgit/mbedtls"
-SRCREV_mbedtls =3D "d65aeb37349ad1a50e0f6c9b694d4b5290d60e49"
+SRCREV_mbedtls =3D "8c89224991adff88d53cd380f42a2baa36f91454"
 LIC_FILES_CHKSUM +=3D "file://../mbedtls/LICENSE;md5=3D3b83ef96387f14655=
fc854ddc3c6bd57"
=20
-# Nanopb, tag "nanopb-0.4.6"
+# Nanopb, tag "nanopb-0.4.2"
 SRC_URI +=3D "git://github.com/nanopb/nanopb.git;name=3Dnanopb;protocol=3D=
https;branch=3Dmaster;destsuffix=3Dgit/nanopb"
-SRCREV_nanopb =3D "afc499f9a410fc9bbf6c9c48cdd8d8b199d49eb4"
+SRCREV_nanopb =3D "df0e92f474f9cca704fe2b31483f0b4d1b1715a4"
 LIC_FILES_CHKSUM +=3D "file://../nanopb/LICENSE.txt;md5=3D9db4b73a55a399=
4384112efcdb37c01f"
=20
 # qcbor, tag "v1.0.0"
@@ -54,15 +54,12 @@ LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;m=
d5=3Da8d8cf662ef6bf9936a1e14135
=20
 # TS ships patches for external dependencies that needs to be applied
 apply_ts_patches() {
-    for p in ${S}/external/qcbor/*.patch; do
-        patch -p1 -N -d ${WORKDIR}/git/qcbor < ${p} || true
-    done
-    for p in ${S}/external/t_cose/*.patch; do
-        patch -p1 -N -d ${WORKDIR}/git/tcose < ${p} || true
-    done
-    for p in ${S}/external/CppUTest/*.patch; do
-        patch -p1 -d ${WORKDIR}/git/cpputest < ${p}
-    done
+    ( cd ${WORKDIR}/git/qcbor;    git stash; git branch -f bf_am; git am=
 ${S}/external/qcbor/*.patch; git reset bf_am )
+    ( cd ${WORKDIR}/git/tcose;    git stash; git branch -f bf_am; git am=
 ${S}/external/t_cose/*.patch; git reset bf_am )
+    ( cd ${WORKDIR}/git/mbedtls;  git stash; git branch -f bf_am; git am=
 ${S}/external/MbedTLS/*.patch; git reset bf_am )
+    ( cd ${WORKDIR}/git/cpputest; git stash; git apply ${S}/external/Cpp=
UTest/*.patch )
+    ( cd ${WORKDIR}/git/dtc;      git stash; git apply ${S}/external/lib=
fdt/*.patch )
+    ( cd ${WORKDIR}/git/nanopb;   git stash; git apply ${S}/external/nan=
opb/*.patch )
 }
 do_patch[postfuncs] +=3D "apply_ts_patches"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb b/=
meta-arm/recipes-security/trusted-services/ts-demo_git.bb
index a9f7b65f..668bde56 100644
--- a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
@@ -6,6 +6,7 @@ TS_ENV =3D "arm-linux"
=20
 require trusted-services.inc
=20
+DEPENDS        +=3D "python3-jsonschema-native python3-jinja2-native"
 DEPENDS        +=3D "libts"
 RDEPENDS:${PN} +=3D "libts"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.b=
b b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
index 408c7d3c..24a724a4 100644
--- a/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-newlib_4.1.0.bb
@@ -22,9 +22,7 @@ OECMAKE_SOURCEPATH =3D "${S}/deployments/newlib/${TS_EN=
V}/"
=20
 # TS ships a patch that needs to be applied to newlib
 apply_ts_patch() {
-    for p in ${S}/external/newlib/*.patch; do
-        patch -p1 -d ${WORKDIR}/git/newlib < ${p}
-    done
+    ( cd ${WORKDIR}/git/newlib;    git stash; git branch -f bf_am; git a=
m ${S}/external/newlib/*.patch; git reset bf_am )
 }
 do_patch[postfuncs] +=3D "apply_ts_patch"
=20
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-c=
ommon_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-tes=
t-common_git.inc
index 41cb0c08..8a7b0e5c 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
@@ -4,6 +4,8 @@ TS_ENV =3D "arm-linux"
=20
 require trusted-services.inc
=20
+DEPENDS        +=3D "python3-jsonschema-native python3-jinja2-native"
+
 DEPENDS        +=3D "libts"
 RDEPENDS:${PN} +=3D "libts"
=20
@@ -11,7 +13,7 @@ SRC_URI +=3D "git://github.com/ARM-software/psa-arch-te=
sts.git;name=3Dpsatest;protoc
             file://0001-Pass-Yocto-build-settings-to-psa-arch-tests-nati=
ve.patch;patchdir=3D../psatest \
            "
=20
-SRCREV_psatest =3D "451aa087a40d02c7d04778235014c5619d126471"
+SRCREV_psatest =3D "38cb53a4d9e292435ddf7899960b15af62decfbe"
 LIC_FILES_CHKSUM +=3D "file://../psatest/LICENSE.md;md5=3D2a944942e1496a=
f1886903d274dedb13"
=20
 EXTRA_OECMAKE +=3D "\
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-attestation=
_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_gi=
t.bb
index eef05fe3..6cddfb03 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
@@ -3,5 +3,6 @@ DESCRIPTION =3D "Trusted Services attestation service pro=
vider"
 require ts-sp-common.inc
=20
 SP_UUID =3D "${ATTESTATION_UUID}"
+TS_SP_IAT_CONFIG ?=3D "default"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/attestation/${TS_ENV}"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/attestation/config/${TS_SP_IAT_CO=
NFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.=
bb b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
index 77a28557..867e4a81 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
@@ -3,7 +3,8 @@ DESCRIPTION =3D "Trusted Services crypto service provider=
"
 require ts-sp-common.inc
=20
 SP_UUID =3D "${CRYPTO_UUID}"
+TS_SP_CRYPTO_CONFIG ?=3D "default"
=20
-DEPENDS +=3D "python3-protobuf-native"
+DEPENDS +=3D "python3-protobuf-native python3-jsonschema-native python3-=
jinja2-native"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/crypto/${TS_ENV}"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/crypto/config/${TS_SP_CRYPTO_CONF=
IG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_gi=
t.bb b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
index 040fd4d1..5551a4de 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-env-test_git.bb
@@ -6,5 +6,6 @@ require ts-sp-common.inc
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 SP_UUID =3D "${ENV_TEST_UUID}"
+TS_SP_ENVTEST_CONFIG ?=3D "baremetal-fvp_base_revc"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/env-test/${TS_ENV}"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/env-test/config/${TS_SP_ENVTEST_C=
ONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb =
b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
index 4eb5dc5e..5472dbda 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
@@ -3,5 +3,6 @@ DESCRIPTION =3D "Trusted Services internal secure storage=
 service provider"
 require ts-sp-common.inc
=20
 SP_UUID =3D "${ITS_UUID}"
+TS_SP_ITS_CONFIG ?=3D "default"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/internal-trusted-storage/${TS_ENV=
}"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/internal-trusted-storage/config/$=
{TS_SP_ITS_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_gi=
t.bb b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
index b9246418..26781434 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
@@ -3,7 +3,8 @@ DESCRIPTION =3D "Trusted Services proxy service providers=
"
 require ts-sp-common.inc
=20
 SP_UUID =3D "${SE_PROXY_UUID}"
+TS_SP_SE_PROXY_CONFIG ?=3D "default"
=20
 DEPENDS +=3D "python3-protobuf-native"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/se-proxy/${TS_ENV}"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/se-proxy/config/${TS_SP_SE_PROXY_=
CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway=
_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_gi=
t.bb
index 06ca6bd1..752f7fe7 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
@@ -3,5 +3,6 @@ DESCRIPTION =3D "Trusted Services service provider for UE=
FI SMM services"
 require ts-sp-common.inc
=20
 SP_UUID =3D "${SMM_GATEWAY_UUID}"
+TS_SP_SMM_GATEWAY_CONFIG ?=3D "default"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/smm-gateway/${TS_ENV}"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/smm-gateway/config/${TS_SP_SMM_GA=
TEWAY_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-storage_git=
.bb b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
index c8937546..5b2f47b3 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
@@ -3,5 +3,6 @@ DESCRIPTION =3D "Trusted Services secure storage service =
provider"
 require ts-sp-common.inc
=20
 SP_UUID =3D "${STORAGE_UUID}"
+TS_SP_PS_CONFIG ?=3D "default"
=20
-OECMAKE_SOURCEPATH=3D"${S}/deployments/protected-storage/${TS_ENV}"
+OECMAKE_SOURCEPATH=3D"${S}/deployments/protected-storage/config/${TS_SP_=
PS_CONFIG}-${TS_ENV}"
--=20
2.39.1.windows.1


