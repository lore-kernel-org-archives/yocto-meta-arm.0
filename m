Return-Path: <arthur.cassegrain@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CE9FC592E
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 10:53:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67634.1772103211167026073
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Feb 2026 02:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: arthur.cassegrain@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60A4E15A1;
	Thu, 26 Feb 2026 02:53:24 -0800 (PST)
Received: from e142502.nice.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C209A3F73B;
	Thu, 26 Feb 2026 02:53:29 -0800 (PST)
From: Arthur Cassegrain <arthur.cassegrain@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>,
	Arthur Cassegrain <arthur.cassegrain@arm.com>
Subject: [PATCH 1/3] arm/trusted-firmware-m: clone dependencies under tfm source tree
Date: Thu, 26 Feb 2026 11:53:10 +0100
Message-ID: <20260226105312.4084782-2-arthur.cassegrain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
References: <20260226105312.4084782-1-arthur.cassegrain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Feb 2026 10:53:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6918

From: Clement Faure <clement.faure@arm.com>

Clone all trusted-firmware-m dependencies into the tfm source
tree under external/ instead of ${UNPACKDIR}.

This aligns the layout with devtool git-submodule handling,
ensuring the recipe sees a consistent source tree at build time
and allowing dependencies to be patched via devtool in the same
way as the main tf-m repository.

(reworked to avoid use internal variables for checkout)
to clone tf-m dependencies use hardcoded path for reproductibility
and avoid using BB_GIT_DEFAULT_DESTSUFFIX which may depend on
yocto version.

Signed-off-by: Clement Faure <clement.faure@arm.com>
Signed-off-by: Arthur Cassegrain <arthur.cassegrain@arm.com>
---
 .../trusted-firmware-m-2.1.4-src.inc          | 32 ++++++-------
 .../trusted-firmware-m-2.2.2-src.inc          | 45 ++++++++++---------
 .../trusted-firmware-m-git-src.inc            | 36 +++++++--------
 .../trusted-firmware-m/trusted-firmware-m.inc | 14 +++---
 4 files changed, 64 insertions(+), 63 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.4-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.4-src.inc
index bae9b11d..0ea55984 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.4-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.4-sr=
c.inc
@@ -3,10 +3,10 @@
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
-                    file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
-                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8 \
-                    file://../tfm-psa-adac/license.rst;md5=3D07f368487da=
347f3c7bd0fc3085f3afa"
+                    file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
+                    file://external/mbedtls/LICENSE;md5=3D379d5819937a6c=
2f1ef1630d341e026d \
+                    file://external/mcuboot/LICENSE;md5=3Db6ee33f1d12a5e=
6ee3de1e82fb51eeb8 \
+                    file://external/tfm-psa-adac/license.rst;md5=3D07f36=
8487da347f3c7bd0fc3085f3afa"
=20
 SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS ?=3D "git://git.trustedfirmware.org/TF=
-M/tf-m-extras.git;protocol=3Dhttps"
@@ -17,13 +17,13 @@ SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT ?=3D "git://github=
.com/mcu-tools/mcuboot.git;pr
 SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.com/laurencelundblad=
e/QCBOR.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
 SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm/external/tfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtfm/external/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dtfm/external/cmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dtfm/external/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dtfm/external/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dtfm/external/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm/external/tfm-psa-adac =
\
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
@@ -52,7 +52,7 @@ SRCREV_qcbor =3D "b0e7033268e88c9f27146fa9a1415ef4c19eb=
aff"
 SRCBRANCH_tfm-psa-adac =3D "master"
 SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf1f97deef625"
=20
-SRCREV_FORMAT =3D "tfm"
+SRCREV_FORMAT =3D "tfm_tfm-extras_tfm-tests_cmsis_mbedtls_mcuboot_qcbor_=
tfm-psa-adac_t-cose"
=20
 S =3D "${UNPACKDIR}/tfm"
=20
@@ -61,8 +61,8 @@ inherit apply_local_src_patches
 LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
=20
 do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
-    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
-    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
-    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
+    apply_local_src_patches ${S}/lib/ext/qcbor ${S}/external/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${S}/external/mbedtl=
s
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${S}/external/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${S}/external/tf-m-t=
ests
 }
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.2-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.2-src.inc
index e78bbdd7..132f05aa 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.2-sr=
c.inc
@@ -3,11 +3,11 @@
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://${UNPACKDIR}/tf-m-tests/license.rst;md5=3D448=
1bae2221b0cfca76a69fb3411f390 \
-                    file://${UNPACKDIR}/mbedtls/LICENSE;md5=3D379d581993=
7a6c2f1ef1630d341e026d \
-                    file://${UNPACKDIR}/mcuboot/LICENSE;md5=3Db6ee33f1d1=
2a5e6ee3de1e82fb51eeb8 \
-                    file://${UNPACKDIR}/tfm-psa-adac/license.rst;md5=3D0=
7f368487da347f3c7bd0fc3085f3afa \
-                    file://${UNPACKDIR}/t_cose/LICENSE;md5=3Db2ebdbfb826=
02b97aa628f64cf4b65ad \
+                    file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
+                    file://external/mbedtls/LICENSE;md5=3D379d5819937a6c=
2f1ef1630d341e026d \
+                    file://external/mcuboot/LICENSE;md5=3Db6ee33f1d12a5e=
6ee3de1e82fb51eeb8 \
+                    file://external/tfm-psa-adac/license.rst;md5=3D07f36=
8487da347f3c7bd0fc3085f3afa \
+                    file://external/t_cose/LICENSE;md5=3Db2ebdbfb82602b9=
7aa628f64cf4b65ad \
                    "
=20
 SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
@@ -20,17 +20,6 @@ SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.co=
m/laurencelundblade/QCBOR.gi
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
=20
-SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
-            "
-
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
 # TF-Mv2.2.2
 SRCBRANCH_tfm ?=3D "release/2.2.x"
@@ -60,7 +49,19 @@ SRCREV_tfm-psa-adac =3D "819a254af6fb5eefdcef194ec85d2=
c7627451351"
 SRCBRANCH_t-cose =3D "dev"
 SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af9311cf1d"
=20
-SRCREV_FORMAT =3D "tfm"
+
+SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm/external/tfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtfm/external/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dtfm/external/cmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dtfm/external/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dtfm/external/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dtfm/external/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm/external/tfm-psa-adac =
\
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dtfm/external/t_cose \
+            "
+
+SRCREV_FORMAT =3D "tfm_tfm-extras_tfm-tests_cmsis_mbedtls_mcuboot_qcbor_=
tfm-psa-adac_t-cose"
=20
 S =3D "${UNPACKDIR}/tfm"
=20
@@ -69,9 +70,9 @@ inherit apply_local_src_patches
 LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
=20
 do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
-    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
-    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
-    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
-    apply_local_src_patches ${S}/lib/ext/t_cose ${UNPACKDIR}/t_cose
+    apply_local_src_patches ${S}/lib/ext/qcbor ${S}/external/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${S}/external/mbedtl=
s
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${S}/external/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${S}/external/tf-m-t=
ests
+    apply_local_src_patches ${S}/lib/ext/t_cose ${S}/external/t_cose
 }
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-g=
it-src.inc
index bf3a07d2..7bea317c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-git-src.=
inc
@@ -3,11 +3,11 @@
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & Apache-2.0"
=20
 LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa \
-                    file://../tf-m-tests/license.rst;md5=3D4481bae2221b0=
cfca76a69fb3411f390 \
-                    file://../mbedtls/LICENSE;md5=3D379d5819937a6c2f1ef1=
630d341e026d \
-                    file://../mcuboot/LICENSE;md5=3Db6ee33f1d12a5e6ee3de=
1e82fb51eeb8 \
-                    file://../tfm-psa-adac/license.rst;md5=3D07f368487da=
347f3c7bd0fc3085f3afa \
-                    file://../t_cose/LICENSE;md5=3Db2ebdbfb82602b97aa628=
f64cf4b65ad \
+                    file://external/tf-m-tests/license.rst;md5=3D4481bae=
2221b0cfca76a69fb3411f390 \
+                    file://external/mbedtls/LICENSE;md5=3D379d5819937a6c=
2f1ef1630d341e026d \
+                    file://external/mcuboot/LICENSE;md5=3Db6ee33f1d12a5e=
6ee3de1e82fb51eeb8 \
+                    file://external/tfm-psa-adac/license.rst;md5=3D07f36=
8487da347f3c7bd0fc3085f3afa \
+                    file://external/t_cose/LICENSE;md5=3Db2ebdbfb82602b9=
7aa628f64cf4b65ad \
                    "
=20
 SRC_URI_TRUSTED_FIRMWARE_M ?=3D "git://git.trustedfirmware.org/TF-M/trus=
ted-firmware-m.git;protocol=3Dhttps"
@@ -20,14 +20,14 @@ SRC_URI_TRUSTED_FIRMWARE_M_QCBOR ?=3D "git://github.c=
om/laurencelundblade/QCBOR.gi
 SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC ?=3D "git://git.trustedfirmware.org/=
shared/psa-adac.git;protocol=3Dhttps"
 SRC_URI_TRUSTED_FIRMWARE_M_T_COSE ?=3D "git://github.com/laurencelundbla=
de/t_cose.git;protocol=3Dhttps"
 SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D${SRCBRANCH_tfm};na=
me=3Dtfm;destsuffix=3Dtfm \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm-extras \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtf-m-tests \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dcmsis \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dmbedtls \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dmcuboot \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dqcbor \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm-psa-adac \
-            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dt_cose \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_EXTRAS};branch=3D${SRCBRANCH_tf=
m-extras};name=3Dtfm-extras;destsuffix=3Dtfm/external/tfm-extras \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_TESTS};branch=3D${SRCBRANCH_tfm=
-tests};name=3Dtfm-tests;destsuffix=3Dtfm/external/tf-m-tests \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_CMSIS};branch=3D${SRCBRANCH_cms=
is};name=3Dcmsis;destsuffix=3Dtfm/external/cmsis \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MBEDTLS};branch=3D${SRCBRANCH_m=
bedtls};name=3Dmbedtls;destsuffix=3Dtfm/external/mbedtls \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_MCUBOOT};branch=3D${SRCBRANCH_m=
cuboot};name=3Dmcuboot;destsuffix=3Dtfm/external/mcuboot \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_QCBOR};branch=3D${SRCBRANCH_qcb=
or};name=3Dqcbor;destsuffix=3Dtfm/external/qcbor \
+            ${SRC_URI_TRUSTED_FIRMWARE_M_PSA_ADAC};branch=3D${SRCBRANCH_=
tfm-psa-adac};name=3Dtfm-psa-adac;destsuffix=3Dtfm/external/tfm-psa-adac =
\
+            ${SRC_URI_TRUSTED_FIRMWARE_M_T_COSE};branch=3D${SRCBRANCH_t-=
cose};name=3Dt-cose;destsuffix=3Dtfm/external/t_cose \
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
@@ -68,9 +68,9 @@ inherit apply_local_src_patches
 LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
=20
 do_apply_local_src_patches() {
-    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
-    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
-    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
-    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
-    apply_local_src_patches ${S}/lib/ext/t_cose ${UNPACKDIR}/t_cose
+    apply_local_src_patches ${S}/lib/ext/qcbor ${S}/external/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${S}/external/mbedtl=
s
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${S}/external/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${S}/external/tf-m-t=
ests
+    apply_local_src_patches ${S}/lib/ext/t_cose ${S}/external/t_cose
 }
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index d47541da..4e3c5912 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -71,13 +71,13 @@ EXTRA_OECMAKE +=3D "-DTFM_PLATFORM=3D${TFM_PLATFORM}"
 EXTRA_OECMAKE +=3D "${@bb.utils.contains('TFM_DEBUG', '1', '-DCMAKE_BUIL=
D_TYPE=3DDebug', '-DCMAKE_BUILD_TYPE=3DRelease', d)}"
=20
 EXTRA_OECMAKE +=3D "\
-    -DCMSIS_PATH=3D${UNPACKDIR}/cmsis \
-    -DMBEDCRYPTO_PATH=3D${UNPACKDIR}/mbedtls \
-    -DMCUBOOT_PATH=3D${UNPACKDIR}/mcuboot \
-    -DQCBOR_PATH=3D${UNPACKDIR}/qcbor \
-    -DT_COSE_PATH=3D${UNPACKDIR}/t_cose \
-    -DTFM_EXTRAS_REPO_PATH=3D${UNPACKDIR}/tfm-extras \
-    -DTFM_TEST_REPO_PATH=3D${UNPACKDIR}/tf-m-tests \
+    -DCMSIS_PATH=3D${S}/external/cmsis \
+    -DMBEDCRYPTO_PATH=3D${S}/external/mbedtls \
+    -DMCUBOOT_PATH=3D${S}/external/mcuboot \
+    -DQCBOR_PATH=3D${S}/external/qcbor \
+    -DT_COSE_PATH=3D${S}/external/t_cose \
+    -DTFM_EXTRAS_REPO_PATH=3D${S}/external/tfm-extras \
+    -DTFM_TEST_REPO_PATH=3D${S}/external/tf-m-tests \
     "
=20
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
--=20
2.43.0


