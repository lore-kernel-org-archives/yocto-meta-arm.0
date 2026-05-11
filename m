Return-Path: <gergely.kovacs2@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E3ACD4842
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:52:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48452.1778500327884851335
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2026 04:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fTbiX/ob;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gergely.kovacs2@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3C02168F;
	Mon, 11 May 2026 04:52:01 -0700 (PDT)
Received: from gerkov02.lxd (e144143.arm.com [10.42.55.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2606A3F85F;
	Mon, 11 May 2026 04:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778500327; bh=oFdtzS6EyesSCyhRfQe3HXutsuxMikmUGYSLya5l+jU=;
	h=From:To:Cc:Subject:Date:From;
	b=fTbiX/ob+wPSBZ+RajZRUC2Y+4+gwvzbzV0y/PtnYj+u3H05VhDZ8PKG9TPrcj4Go
	 VY7L+1pbf0T51+tx2N4iVZ27YF13yQ8MCYmKPv1ywvlrO7vMDBZpbdTXiy3+li8AaR
	 U4V4AWD8e9xwiHfBHS6wT74GwcSum48alhl99ss0=
From: Gergely Kovacs <gergely.kovacs2@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: David Hu <david.hu2@arm.com>,
	Gergely Kovacs <Gergely.Kovacs2@arm.com>
Subject: [PATCH] arm/trusted-firmware-m: Enable regression test build
Date: Mon, 11 May 2026 11:49:53 +0000
Message-ID: <20260511114953.3407188-1-gergely.kovacs2@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2026 11:52:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7038

From: David Hu <david.hu2@arm.com>

TF-M build system has introduced a ground-breaking change since v2.0.0.
Enable TF-M regression test build, following build instructions in TF-M
document [1].

Add the BUILD_REGRESSION_TESTS variable to enable regression test
builds. Individual regression test suites can be selected by
passing the appropriate TF-M CMake options through EXTRA_OECMAKE.
If regression test is enabled, build TF-M and tests from tf-m-tests
directory.

The build files for Normal World build will be installed.

[1]: https://trustedfirmware-m.readthedocs.io/en/latest/building/tests_bu=
ild_instruction.html

Signed-off-by: David Hu <david.hu2@arm.com>
Signed-off-by: Gergely Kovacs <Gergely.Kovacs2@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m.inc | 32 +++++++++++++++----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 4e3c5912..3b6dce22 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -43,6 +43,11 @@ DEPENDS +=3D "cmake-native \
=20
 B =3D "${WORKDIR}/build"
=20
+# Build TF-M regression tests instead of the default firmware.
+# When enabled, the desired test suite options should be appended to
+# EXTRA_OECMAKE (e.g. -DTEST_S=3DON).
+BUILD_REGRESSION_TESTS ?=3D "0"
+
 # Build for debug (set TFM_DEBUG to 1 to activate)
 TFM_DEBUG ?=3D "${FIRMWARE_DEBUG_BUILD}"
=20
@@ -53,11 +58,6 @@ python() {
         raise bb.parse.SkipRecipe("TFM_PLATFORM needs to be set")
 }
=20
-PACKAGECONFIG ??=3D ""
-# Whether to integrate the test suite
-PACKAGECONFIG[test-secure] =3D "-DTEST_S=3DON,-DTEST_S=3DOFF"
-PACKAGECONFIG[test-nonsecure] =3D "-DTEST_NS=3DON,-DTEST_NS=3DOFF"
-
 # Currently we only support using the Arm binary GCC
 EXTRA_OECMAKE +=3D "-DTFM_TOOLCHAIN_FILE=3D${S}/toolchain_GNUARM.cmake"
=20
@@ -77,9 +77,12 @@ EXTRA_OECMAKE +=3D "\
     -DQCBOR_PATH=3D${S}/external/qcbor \
     -DT_COSE_PATH=3D${S}/external/t_cose \
     -DTFM_EXTRAS_REPO_PATH=3D${S}/external/tfm-extras \
-    -DTFM_TEST_REPO_PATH=3D${S}/external/tf-m-tests \
     "
=20
+# tf-m-tests directory
+# The directory can be overridden by local tf-m-tests folder path.
+TFM_TESTS_DIR ?=3D "${S}/external/tf-m-tests"
+
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
=20
 AS[unexport] =3D "1"
@@ -92,7 +95,13 @@ export OPENSSL_MODULES =3D "${STAGING_LIBDIR_NATIVE}/o=
ssl-modules"
=20
 do_configure[cleandirs] =3D "${B}"
 do_configure() {
-    cmake -GNinja -S ${S} -B ${B} ${EXTRA_OECMAKE} ${PACKAGECONFIG_CONFA=
RGS}
+    # When regression tests are enabled, TF-M is built under regression =
test
+    # directory.
+    if [ "${BUILD_REGRESSION_TESTS}" =3D "1" ]; then
+        cmake -GNinja -S ${TFM_TESTS_DIR}/tests_reg/spe -B ${B} -DCONFIG=
_TFM_SOURCE_PATH=3D${S} ${EXTRA_OECMAKE}
+    else
+        cmake -GNinja -S ${S} -B ${B} ${EXTRA_OECMAKE}
+    fi
 }
=20
 # Invoke install here as there's no point in splitting compile from inst=
all: the
@@ -110,6 +119,15 @@ do_install() {
     find ${B}/bin \( -name '*.bin' -o -name '*.elf' \) -type f | while r=
ead -r file; do
         install -m 0644 "$file" "${D}${FIRMWARE_DIR}"
     done
+
+    # Install for NS build
+    if [ -d "${B}/api_ns" ]; then
+        install -d -m 0755 ${D}/sysroot-only/api_ns
+
+        cd ${B}/api_ns
+        find . -type d -exec install -d -m 0755 ${D}/sysroot-only/api_ns=
/{} \;
+        find . -type f -exec install -m 0644 {} ${D}/sysroot-only/api_ns=
/{} \;
+    fi
 }
=20
 # Build paths are currently embedded because it's impossible to pass -fd=
ebug-prefix-map

