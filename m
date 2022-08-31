Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23656ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 18:42:08 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web10.2639.1661971327020229109
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 11:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27VIiIVA011556;
	Wed, 31 Aug 2022 19:44:19 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH 5/7] psa-api-tests for Trusted Services
Date: Wed, 31 Aug 2022 19:41:55 +0100
Message-Id: <20220831184157.84687-5-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831184157.84687-1-Anton.Antonov@arm.com>
References: <20220831184157.84687-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Aug 2022 18:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3729

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .../ts-psa-api-test-common_git.inc            | 36 +++++++++++++++++++
 .../ts-psa-crypto-api-test_git.bb             |  9 +++++
 .../0012-PSA-TARGET-QCBOR.patch               | 29 +++++++++++++++
 .../ts-psa-iat-api-test_git.bb                | 19 ++++++++++
 .../ts-psa-its-api-test_git.bb                |  9 +++++
 .../ts-psa-ps-api-test_git.bb                 |  9 +++++
 6 files changed, 111 insertions(+)
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-psa-its-api-test_git.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/ts-psa-ps-api-test_git.bb

diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
new file mode 100644
index 00000000..1e1be6a9
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-api-test-common_git.inc
@@ -0,0 +1,36 @@
+SUMMARY = "Parts of PSA certification tests (psa-arch-test) for Trusted Services"
+
+TS_ENV = "arm-linux"
+
+require trusted-services.inc
+
+DEPENDS        += "libts"
+RDEPENDS:${PN} += "libts"
+
+SRC_URI += "git://github.com/ARM-software/psa-arch-tests.git;name=psatest;protocol=https;branch=main;destsuffix=git/psatest \
+            file://0012-psa-arch-test-toolchain.patch \
+           "
+
+SRCREV_psatest = "451aa087a40d02c7d04778235014c5619d126471"
+LIC_FILES_CHKSUM += "file://../psatest/LICENSE.md;md5=2a944942e1496af1886903d274dedb13"
+
+EXTRA_OECMAKE += "\
+                  -DPSA_ARCH_TESTS_SOURCE_DIR=${WORKDIR}/git/psatest \
+                 "
+
+# TS ships patches that need to be applied to psa-arch-tests
+apply_ts_patch() {
+    for p in ${S}/external/psa_arch_tests/*.patch; do
+        patch -p1 -d ${WORKDIR}/git/psatest < ${p}
+    done
+}
+do_patch[postfuncs] += "apply_ts_patch"
+
+FILES:${PN} = "${bindir}/${PSA_TEST}"
+
+do_install:append () {
+    install -d ${D}${bindir}
+    mv ${D}${TS_INSTALL}/bin/${PSA_TEST} ${D}${bindir}
+
+    rm -r --one-file-system ${D}${TS_INSTALL}
+}
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bb
new file mode 100644
index 00000000..710d3778
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Crypto PSA certification tests (psa-arch-test)"
+
+TS_ENV = "arm-linux"
+
+require ts-psa-api-test-common_${PV}.inc
+
+OECMAKE_SOURCEPATH = "${S}/deployments/psa-api-test/crypto/${TS_ENV}"
+
+PSA_TEST = "psa-crypto-api-test"
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch
new file mode 100644
index 00000000..3b28e80e
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test/0012-PSA-TARGET-QCBOR.patch
@@ -0,0 +1,29 @@
+From 3229ca31e59933608f82001c1cdcca9d0a0aa0e0 Mon Sep 17 00:00:00 2001
+From: Anton Antonov <Anton.Antonov@arm.com>
+Date: Wed, 31 Aug 2022 17:19:08 +0100
+Subject: [PATCH] Subject: [PATCH] Pass PSA_TARGET_QCBOR to psa-arch-tests
+
+psa-arch-tests require they own version of qcbor library.
+Pass PSA_TARGET_QCBOR which defines where pre-fetched qcbor sources are.
+
+Upstream-Status: Pending
+Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
+---
+ external/psa_arch_tests/pas-arch-test-init-cache.cmake.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in b/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in
+index 5c63596..64196c2 100644
+--- a/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in
++++ b/external/psa_arch_tests/pas-arch-test-init-cache.cmake.in
+@@ -10,6 +10,7 @@ set(CMAKE_TOOLCHAIN_FILE "@TS_EXTERNAL_LIB_TOOLCHAIN_FILE@" CACHE STRING "")
+ 
+ set(TOOLCHAIN INHERIT CACHE STRING "")
+ set(PSA_INCLUDE_PATHS "@PSA_ARCH_TESTS_EXTERNAL_INCLUDE_PATHS@"  CACHE STRING "")
++set(PSA_TARGET_QCBOR "@PSA_TARGET_QCBOR@"  CACHE STRING "")
+ set(SUITE "@TS_ARCH_TEST_SUITE@"  CACHE STRING "")
+ set(ARCH_TEST_EXTERNAL_DEFS "@PSA_ARCH_TEST_EXTERNAL_DEFS@"  CACHE STRING "")
+ set(CMAKE_VERBOSE_MAKEFILE OFF CACHE BOOL "")
+-- 
+2.25.1
+
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
new file mode 100644
index 00000000..73c5f61d
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Initial Attestation PSA certification tests (psa-arch-test) for Trusted Services"
+
+TS_ENV = "arm-linux"
+
+require ts-psa-api-test-common_${PV}.inc
+
+OECMAKE_SOURCEPATH = "${S}/deployments/psa-api-test/initial_attestation/${TS_ENV}"
+
+PSA_TEST = "psa-iat-api-test"
+
+# psa-arch-tests for INITIAL_ATTESTATION suite can't be built with pre-built qcbor
+# Fetch qcbor sources as a temp work-around and pass PSA_TARGET_QCBOR to psa-arch-tests
+SRC_URI += "git://github.com/laurencelundblade/QCBOR.git;name=psaqcbor;protocol=https;branch=master;destsuffix=git/psaqcbor \
+            file://0012-PSA-TARGET-QCBOR.patch \
+           "
+SRCREV_psaqcbor = "42272e466a8472948bf8fca076d113b81b99f0e0"
+
+EXTRA_OECMAKE += "-DPSA_TARGET_QCBOR=${WORKDIR}/git/psaqcbor \
+                 "
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-its-api-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-its-api-test_git.bb
new file mode 100644
index 00000000..32f2890b
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-its-api-test_git.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Internal Trusted Storage PSA certification tests (psa-arch-test) for Trusted Services"
+
+TS_ENV = "arm-linux"
+
+require ts-psa-api-test-common_${PV}.inc
+
+OECMAKE_SOURCEPATH = "${S}/deployments/psa-api-test/internal_trusted_storage/${TS_ENV}"
+
+PSA_TEST = "psa-its-api-test"
diff --git a/meta-arm/recipes-security/trusted-services/ts-psa-ps-api-test_git.bb b/meta-arm/recipes-security/trusted-services/ts-psa-ps-api-test_git.bb
new file mode 100644
index 00000000..bcf16712
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/ts-psa-ps-api-test_git.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Protected Storage PSA certification tests (psa-arch-test) for Trusted Services"
+
+TS_ENV = "arm-linux"
+
+require ts-psa-api-test-common_${PV}.inc
+
+OECMAKE_SOURCEPATH = "${S}/deployments/psa-api-test/protected_storage/${TS_ENV}"
+
+PSA_TEST = "psa-ps-api-test"
-- 
2.25.1


