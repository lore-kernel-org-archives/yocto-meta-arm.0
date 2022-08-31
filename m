Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F71EC3DA6B
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 18:42:08 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com
 [217.140.106.51])
 by mx.groups.io with SMTP id smtpd.web12.2683.1661971326866975328
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 11:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.106.51, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com
 (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 27VIiIVC011556;
	Wed, 31 Aug 2022 19:44:19 +0100
From: Anton Antonov <Anton.Antonov@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Anton.Antonov@arm.com
Subject: [PATCH 7/7] Define qemuarm64-secureboot-ts CI pipeline and include it
 into meta-arm
Date: Wed, 31 Aug 2022 19:41:57 +0100
Message-Id: <20220831184157.84687-7-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831184157.84687-1-Anton.Antonov@arm.com>
References: <20220831184157.84687-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Aug 2022 18:42:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3727

qemuarm64-secureboot-ts pipeline is based on qemuarm64-secureboot machine
and additionaly includes:
- TS Crypto, Storage, ITS, Attestation and SMM-Gateway SPs into optee-os image
- TS demo/test tools
- TS psa-arch-tests

This commit also includes Trusted Services OEQA tests

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 .gitlab-ci.yml                                |  7 +++
 ci/qemuarm64-secureboot-ts.yml                | 28 +++++++++++
 .../oeqa/runtime/cases/trusted_services.py    | 50 +++++++++++++++++++
 .../trusted-firmware-a_%.bbappend             |  9 +++-
 .../packagegroups/packagegroup-ts-tests.bb    | 26 ++++++++++
 .../trusted-services/libts_%.bbappend         |  3 ++
 6 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 ci/qemuarm64-secureboot-ts.yml
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/trusted_services.py
 create mode 100644 meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
 create mode 100644 meta-arm/recipes-security/trusted-services/libts_%.bbappend

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 840a6507..1fb21f60 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -171,6 +171,13 @@ qemuarm64-secureboot:
         TCLIBC: [glibc, musl]
         TESTING: testimage
 
+qemuarm64-secureboot-ts:
+  extends: .build
+  parallel:
+    matrix:
+      - TCLIBC: [glibc, musl]
+        TESTING: testimage
+
 qemuarm64:
   extends: .build
   parallel:
diff --git a/ci/qemuarm64-secureboot-ts.yml b/ci/qemuarm64-secureboot-ts.yml
new file mode 100644
index 00000000..66a27c68
--- /dev/null
+++ b/ci/qemuarm64-secureboot-ts.yml
@@ -0,0 +1,28 @@
+# Build qemuarm64-secureboot machine with
+# Trusted Services secure partition included into optee-os image.
+#
+# Run Trustes Services OEQA tests.
+
+header:
+  version: 11
+  includes:
+    - ci/base.yml
+    - ci/meta-openembedded.yml
+
+machine: qemuarm64-secureboot
+
+local_conf_header:
+  failing_tests: |
+    # software IO TLB: Cannot allocate buffer
+    DEFAULT_TEST_SUITES:remove = "parselogs"
+  trusted_services: |
+    TEST_SUITES:append = " trusted_services"
+    # Include TS Crypto, Storage, ITS, Attestation and SMM-Gateway SPs into optee-os image
+    MACHINE_FEATURES:append = " arm-ffa ts-crypto ts-storage ts-its ts-attestation ts-smm-gateway"
+    # Include TS demo/test tools into image
+    IMAGE_INSTALL:append = " packagegroup-ts-tests"
+    # Include TS PSA Arch tests into image
+    IMAGE_INSTALL:append = " packagegroup-ts-tests-psa"
+
+target:
+  - core-image-base
diff --git a/meta-arm/lib/oeqa/runtime/cases/trusted_services.py b/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
new file mode 100644
index 00000000..a5f93760
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/trusted_services.py
@@ -0,0 +1,50 @@
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class TrustedServicesTest(OERuntimeTestCase):
+
+    def run_test_tool(self, cmd, expected_status=0 ):
+        """ Run a test utility """
+
+        status, output = self.target.run(cmd)
+        self.assertEqual(status, expected_status, msg='\n'.join([cmd, output]))
+
+    @OEHasPackage(['ts-demo'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_00_ts_demo(self):
+        self.run_test_tool('ts-demo')
+
+    @OEHasPackage(['ts-service-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_01_ts_service_test(self):
+        self.run_test_tool('ts-service-test')
+
+    @OEHasPackage(['ts-uefi-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_02_ts_uefi_test(self):
+        self.run_test_tool('uefi-test')
+
+    @OEHasPackage(['ts-psa-crypto-api-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_03_psa_crypto_api_test(self):
+        # There are a few expected PSA Crypto tests failing
+        self.run_test_tool('psa-crypto-api-test', expected_status=46)
+
+    @OEHasPackage(['ts-psa-its-api-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_04_psa_its_api_test(self):
+        self.run_test_tool('psa-its-api-test')
+
+    @OEHasPackage(['ts-psa-ps-api-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_05_psa_ps_api_test(self):
+        # There are a few expected PSA Storage tests failing
+        self.run_test_tool('psa-ps-api-test', expected_status=46)
+
+    @OEHasPackage(['ts-psa-iat-api-test'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_06_psa_iat_api_test(self):
+        self.run_test_tool('psa-iat-api-test')
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 8815510e..6cf55d69 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -10,7 +10,14 @@ TFA_PLATFORM:qemuarm64-secureboot = "qemu"
 TFA_PLATFORM:qemu-generic-arm64 = "qemu_sbsa"
 TFA_PLATFORM:qemuarm-secureboot = "qemu"
 
-TFA_SPD:qemuarm64-secureboot = "opteed"
+# Trusted Services secure partitions require arm-ffa machine feature.
+# Enabling Secure-EL1 Payload Dispatcher (SPD) in this case
+TFA_SPD:qemuarm64-secureboot = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'spmd', 'opteed', d)}"
+# Configure tf-a accordingly to TS requirements if included
+EXTRA_OEMAKE:append:qemuarm64-secureboot = "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', ' CTX_INCLUDE_EL2_REGS=0 SPMC_OPTEE=1 ', '' , d)}"
+# Cortex-A57 supports Armv8.0 (no S-EL2 execution state).
+# The SPD SPMC component should run at the S-EL1 execution state.
+TFA_SPMD_SPM_AT_SEL2:qemuarm64-secureboot = "0"
 
 TFA_UBOOT:qemuarm64-secureboot = "1"
 TFA_UBOOT:qemuarm-secureboot = "1"
diff --git a/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb b/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
new file mode 100644
index 00000000..72ba33f4
--- /dev/null
+++ b/meta-arm/recipes-security/packagegroups/packagegroup-ts-tests.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Trusted Services test/demo linux tools"
+
+inherit packagegroup
+
+COMPATIBLE_HOST = "aarch64.*-linux"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PACKAGES = "${PN} ${PN}-psa"
+
+RDEPENDS:${PN} = "\
+    ts-demo \
+    ts-service-test \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-env-test', 'ts-remote-test', '' , d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-smm-gateway', 'ts-uefi-test', '' , d)} \
+"
+
+SUMMARY:${PN}-psa = "PSA certification tests (psa-arch-test) for TS SPs"
+RDEPENDS:${PN}-psa = "\
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-crypto', 'ts-psa-crypto-api-test', '' , d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-its', 'ts-psa-its-api-test', '' , d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-storage', 'ts-psa-ps-api-test', '' , d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-attestation', 'ts-psa-iat-api-test', '' , d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'ts-se-proxy', \
+          'ts-psa-crypto-api-test ts-psa-its-api-test ts-psa-ps-api-test ts-psa-iat-api-test', '' , d)} \
+"
diff --git a/meta-arm/recipes-security/trusted-services/libts_%.bbappend b/meta-arm/recipes-security/trusted-services/libts_%.bbappend
new file mode 100644
index 00000000..f987e40c
--- /dev/null
+++ b/meta-arm/recipes-security/trusted-services/libts_%.bbappend
@@ -0,0 +1,3 @@
+# Update MM communication buffer address for qemuarm64 machine
+SRC_URI:append:qemuarm64-secureboot = "file://0001-QEMU-MM-communication-buffer-address.patch \
+"
-- 
2.25.1


