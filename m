Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDC2E71D5C
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 15:21:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20419.1696000896544628475
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 29 Sep 2023 08:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91EBCDA7;
	Fri, 29 Sep 2023 08:22:14 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD9F23F5A1;
	Fri, 29 Sep 2023 08:21:35 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 07/10] arm/trusted-services: use apply_local_src_patches
Date: Fri, 29 Sep 2023 16:21:25 +0100
Message-Id: <20230929152128.3401009-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Sep 2023 15:21:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5087

From: Ross Burton <ross.burton@arm.com>

Now that the apply_local_src_patches class supports being used with
multiple directories, use that instead of reimplementing the logic.

Also remove redundant patchdir assignments as these patches are against
the trusted-services repository, which is ${S}.  I suspect these are
exposing a subtle bug in the core patching logic which meant the local
patches were not applying correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-services/ts-arm-platforms.inc     | 16 ++++++++--------
 .../trusted-services/trusted-services-src.inc | 19 ++++++++++---------
 .../ts-psa-api-test-common_git.inc            | 10 +++-------
 3 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 29e33ffe..551a67dc 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -2,14 +2,14 @@ FILESEXTRAPATHS:prepend:corstone1000 :=3D "${THISDIR}/c=
orstone1000:"
=20
 COMPATIBLE_MACHINE:corstone1000 =3D "corstone1000"
 SRC_URI:append:corstone1000  =3D " \
-    file://0001-Add-stub-capsule-update-service-components.patch;patchdi=
r=3D../trusted-services \
-    file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch;patchdir=
=3D../trusted-services \
-    file://0003-FMP-Support-in-Corstone1000.patch;patchdir=3D../trusted-=
services \
-    file://0004-GetNextVariableName-Fix.patch;patchdir=3D../trusted-serv=
ices     \
-    file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.pat=
ch;patchdir=3D../trusted-services \
-    file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch;patchdir=3D../trusted-services \
-    file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch;patchdir=3D../trusted-services \
-    file://0008-plat-corstone1000-change-ns-interrupt-action.patch;patch=
dir=3D../trusted-services \
+    file://0001-Add-stub-capsule-update-service-components.patch \
+    file://0002-Fixes-in-AEAD-for-psa-arch-test-54-and-58.patch \
+    file://0003-FMP-Support-in-Corstone1000.patch \
+    file://0004-GetNextVariableName-Fix.patch     \
+    file://0005-plat-corstone1000-add-compile-definitions-for-ECP_DP.pat=
ch \
+    file://0006-plat-corstone1000-Use-the-stateless-platform-service.pat=
ch \
+    file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
+    file://0008-plat-corstone1000-change-ns-interrupt-action.patch \
     "
=20
=20
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services-=
src.inc b/meta-arm/recipes-security/trusted-services/trusted-services-src=
.inc
index 50360b1d..ce073943 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services-src.inc
@@ -61,16 +61,17 @@ LIC_FILES_CHKSUM +=3D "file://../openamp/LICENSE.md;m=
d5=3Da8d8cf662ef6bf9936a1e14135
=20
 SRCREV_FORMAT =3D "trusted-services_dtc_mbedtls_nanopb_qcbor_tcose_cpput=
est_libmetal_openamp"
=20
-# TS ships patches for external dependencies that needs to be applied
-apply_ts_patches() {
-    ( cd ${WORKDIR}/git/qcbor;    git stash; git branch -f bf_am; git am=
 ${S}/external/qcbor/*.patch; git reset bf_am )
-    ( cd ${WORKDIR}/git/tcose;    git stash; git branch -f bf_am; git am=
 ${S}/external/t_cose/*.patch; git reset bf_am )
-    ( cd ${WORKDIR}/git/mbedtls;  git stash; git branch -f bf_am; git am=
 ${S}/external/MbedTLS/*.patch; git reset bf_am )
-    ( cd ${WORKDIR}/git/cpputest; git stash; git apply ${S}/external/Cpp=
UTest/*.patch )
-    ( cd ${WORKDIR}/git/dtc;      git stash; git apply ${S}/external/lib=
fdt/*.patch )
-    ( cd ${WORKDIR}/git/nanopb;   git stash; git apply ${S}/external/nan=
opb/*.patch )
+inherit apply_local_src_patches
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches ${S}/external/qcbor ${WORKDIR}/git/qcbor
+    apply_local_src_patches ${S}/external/t_cose ${WORKDIR}/git/tcose
+    apply_local_src_patches ${S}/external/MbedTLS ${WORKDIR}/git/mbedtls
+    apply_local_src_patches ${S}/external/CppUTest ${WORKDIR}/git/cppute=
st
+    apply_local_src_patches ${S}/external/libfdt ${WORKDIR}/git/dtc
+    apply_local_src_patches ${S}/external/nanopb ${WORKDIR}/git/nanopb
 }
-do_patch[postfuncs] +=3D "apply_ts_patches"
=20
 # Paths to dependencies required by some TS SPs/tools
 EXTRA_OECMAKE +=3D "-DDTC_SOURCE_DIR=3D${WORKDIR}/git/dtc \
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-c=
ommon_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-tes=
t-common_git.inc
index 8a7b0e5c..c8b4e992 100644
--- a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_g=
it.inc
@@ -16,15 +16,11 @@ SRC_URI +=3D "git://github.com/ARM-software/psa-arch-=
tests.git;name=3Dpsatest;protoc
 SRCREV_psatest =3D "38cb53a4d9e292435ddf7899960b15af62decfbe"
 LIC_FILES_CHKSUM +=3D "file://../psatest/LICENSE.md;md5=3D2a944942e1496a=
f1886903d274dedb13"
=20
-EXTRA_OECMAKE +=3D "\
-                  -DPSA_ARCH_TESTS_SOURCE_DIR=3D${WORKDIR}/git/psatest \
-                 "
+EXTRA_OECMAKE +=3D "-DPSA_ARCH_TESTS_SOURCE_DIR=3D${WORKDIR}/git/psatest=
"
=20
-# TS check if there are patches to apply to psa-arch-tests, if so apply =
them
-apply_ts_patch() {
-    find ${S}/external/psa_arch_tests -type f -name '*.patch' -exec patc=
h -p1 -d ${WORKDIR}/git/psatest -i {} \;
+do_apply_local_src_patches:append() {
+    apply_local_src_patches ${S}/external/psa_arch_tests ${WORKDIR}/git/=
psatest
 }
-do_patch[postfuncs] +=3D "apply_ts_patch"
=20
 FILES:${PN} =3D "${bindir}/${PSA_TEST}"
=20
--=20
2.34.1


